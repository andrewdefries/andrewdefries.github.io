---
output:
  html_document:
    self_contained: no
---

```r
library(knitr)
knit_hooks$set(webgl = hook_webgl)
cat('<script type="text/javascript">', readLines(system.file('WebGL', 'CanvasMatrix.js', package = 'rgl')), '</script>', sep = '\n')
```

<script type="text/javascript">
CanvasMatrix4=function(m){if(typeof m=='object'){if("length"in m&&m.length>=16){this.load(m[0],m[1],m[2],m[3],m[4],m[5],m[6],m[7],m[8],m[9],m[10],m[11],m[12],m[13],m[14],m[15]);return}else if(m instanceof CanvasMatrix4){this.load(m);return}}this.makeIdentity()};CanvasMatrix4.prototype.load=function(){if(arguments.length==1&&typeof arguments[0]=='object'){var matrix=arguments[0];if("length"in matrix&&matrix.length==16){this.m11=matrix[0];this.m12=matrix[1];this.m13=matrix[2];this.m14=matrix[3];this.m21=matrix[4];this.m22=matrix[5];this.m23=matrix[6];this.m24=matrix[7];this.m31=matrix[8];this.m32=matrix[9];this.m33=matrix[10];this.m34=matrix[11];this.m41=matrix[12];this.m42=matrix[13];this.m43=matrix[14];this.m44=matrix[15];return}if(arguments[0]instanceof CanvasMatrix4){this.m11=matrix.m11;this.m12=matrix.m12;this.m13=matrix.m13;this.m14=matrix.m14;this.m21=matrix.m21;this.m22=matrix.m22;this.m23=matrix.m23;this.m24=matrix.m24;this.m31=matrix.m31;this.m32=matrix.m32;this.m33=matrix.m33;this.m34=matrix.m34;this.m41=matrix.m41;this.m42=matrix.m42;this.m43=matrix.m43;this.m44=matrix.m44;return}}this.makeIdentity()};CanvasMatrix4.prototype.getAsArray=function(){return[this.m11,this.m12,this.m13,this.m14,this.m21,this.m22,this.m23,this.m24,this.m31,this.m32,this.m33,this.m34,this.m41,this.m42,this.m43,this.m44]};CanvasMatrix4.prototype.getAsWebGLFloatArray=function(){return new WebGLFloatArray(this.getAsArray())};CanvasMatrix4.prototype.makeIdentity=function(){this.m11=1;this.m12=0;this.m13=0;this.m14=0;this.m21=0;this.m22=1;this.m23=0;this.m24=0;this.m31=0;this.m32=0;this.m33=1;this.m34=0;this.m41=0;this.m42=0;this.m43=0;this.m44=1};CanvasMatrix4.prototype.transpose=function(){var tmp=this.m12;this.m12=this.m21;this.m21=tmp;tmp=this.m13;this.m13=this.m31;this.m31=tmp;tmp=this.m14;this.m14=this.m41;this.m41=tmp;tmp=this.m23;this.m23=this.m32;this.m32=tmp;tmp=this.m24;this.m24=this.m42;this.m42=tmp;tmp=this.m34;this.m34=this.m43;this.m43=tmp};CanvasMatrix4.prototype.invert=function(){var det=this._determinant4x4();if(Math.abs(det)<1e-8)return null;this._makeAdjoint();this.m11/=det;this.m12/=det;this.m13/=det;this.m14/=det;this.m21/=det;this.m22/=det;this.m23/=det;this.m24/=det;this.m31/=det;this.m32/=det;this.m33/=det;this.m34/=det;this.m41/=det;this.m42/=det;this.m43/=det;this.m44/=det};CanvasMatrix4.prototype.translate=function(x,y,z){if(x==undefined)x=0;if(y==undefined)y=0;if(z==undefined)z=0;var matrix=new CanvasMatrix4();matrix.m41=x;matrix.m42=y;matrix.m43=z;this.multRight(matrix)};CanvasMatrix4.prototype.scale=function(x,y,z){if(x==undefined)x=1;if(z==undefined){if(y==undefined){y=x;z=x}else z=1}else if(y==undefined)y=x;var matrix=new CanvasMatrix4();matrix.m11=x;matrix.m22=y;matrix.m33=z;this.multRight(matrix)};CanvasMatrix4.prototype.rotate=function(angle,x,y,z){angle=angle/180*Math.PI;angle/=2;var sinA=Math.sin(angle);var cosA=Math.cos(angle);var sinA2=sinA*sinA;var length=Math.sqrt(x*x+y*y+z*z);if(length==0){x=0;y=0;z=1}else if(length!=1){x/=length;y/=length;z/=length}var mat=new CanvasMatrix4();if(x==1&&y==0&&z==0){mat.m11=1;mat.m12=0;mat.m13=0;mat.m21=0;mat.m22=1-2*sinA2;mat.m23=2*sinA*cosA;mat.m31=0;mat.m32=-2*sinA*cosA;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==1&&z==0){mat.m11=1-2*sinA2;mat.m12=0;mat.m13=-2*sinA*cosA;mat.m21=0;mat.m22=1;mat.m23=0;mat.m31=2*sinA*cosA;mat.m32=0;mat.m33=1-2*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else if(x==0&&y==0&&z==1){mat.m11=1-2*sinA2;mat.m12=2*sinA*cosA;mat.m13=0;mat.m21=-2*sinA*cosA;mat.m22=1-2*sinA2;mat.m23=0;mat.m31=0;mat.m32=0;mat.m33=1;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}else{var x2=x*x;var y2=y*y;var z2=z*z;mat.m11=1-2*(y2+z2)*sinA2;mat.m12=2*(x*y*sinA2+z*sinA*cosA);mat.m13=2*(x*z*sinA2-y*sinA*cosA);mat.m21=2*(y*x*sinA2-z*sinA*cosA);mat.m22=1-2*(z2+x2)*sinA2;mat.m23=2*(y*z*sinA2+x*sinA*cosA);mat.m31=2*(z*x*sinA2+y*sinA*cosA);mat.m32=2*(z*y*sinA2-x*sinA*cosA);mat.m33=1-2*(x2+y2)*sinA2;mat.m14=mat.m24=mat.m34=0;mat.m41=mat.m42=mat.m43=0;mat.m44=1}this.multRight(mat)};CanvasMatrix4.prototype.multRight=function(mat){var m11=(this.m11*mat.m11+this.m12*mat.m21+this.m13*mat.m31+this.m14*mat.m41);var m12=(this.m11*mat.m12+this.m12*mat.m22+this.m13*mat.m32+this.m14*mat.m42);var m13=(this.m11*mat.m13+this.m12*mat.m23+this.m13*mat.m33+this.m14*mat.m43);var m14=(this.m11*mat.m14+this.m12*mat.m24+this.m13*mat.m34+this.m14*mat.m44);var m21=(this.m21*mat.m11+this.m22*mat.m21+this.m23*mat.m31+this.m24*mat.m41);var m22=(this.m21*mat.m12+this.m22*mat.m22+this.m23*mat.m32+this.m24*mat.m42);var m23=(this.m21*mat.m13+this.m22*mat.m23+this.m23*mat.m33+this.m24*mat.m43);var m24=(this.m21*mat.m14+this.m22*mat.m24+this.m23*mat.m34+this.m24*mat.m44);var m31=(this.m31*mat.m11+this.m32*mat.m21+this.m33*mat.m31+this.m34*mat.m41);var m32=(this.m31*mat.m12+this.m32*mat.m22+this.m33*mat.m32+this.m34*mat.m42);var m33=(this.m31*mat.m13+this.m32*mat.m23+this.m33*mat.m33+this.m34*mat.m43);var m34=(this.m31*mat.m14+this.m32*mat.m24+this.m33*mat.m34+this.m34*mat.m44);var m41=(this.m41*mat.m11+this.m42*mat.m21+this.m43*mat.m31+this.m44*mat.m41);var m42=(this.m41*mat.m12+this.m42*mat.m22+this.m43*mat.m32+this.m44*mat.m42);var m43=(this.m41*mat.m13+this.m42*mat.m23+this.m43*mat.m33+this.m44*mat.m43);var m44=(this.m41*mat.m14+this.m42*mat.m24+this.m43*mat.m34+this.m44*mat.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.multLeft=function(mat){var m11=(mat.m11*this.m11+mat.m12*this.m21+mat.m13*this.m31+mat.m14*this.m41);var m12=(mat.m11*this.m12+mat.m12*this.m22+mat.m13*this.m32+mat.m14*this.m42);var m13=(mat.m11*this.m13+mat.m12*this.m23+mat.m13*this.m33+mat.m14*this.m43);var m14=(mat.m11*this.m14+mat.m12*this.m24+mat.m13*this.m34+mat.m14*this.m44);var m21=(mat.m21*this.m11+mat.m22*this.m21+mat.m23*this.m31+mat.m24*this.m41);var m22=(mat.m21*this.m12+mat.m22*this.m22+mat.m23*this.m32+mat.m24*this.m42);var m23=(mat.m21*this.m13+mat.m22*this.m23+mat.m23*this.m33+mat.m24*this.m43);var m24=(mat.m21*this.m14+mat.m22*this.m24+mat.m23*this.m34+mat.m24*this.m44);var m31=(mat.m31*this.m11+mat.m32*this.m21+mat.m33*this.m31+mat.m34*this.m41);var m32=(mat.m31*this.m12+mat.m32*this.m22+mat.m33*this.m32+mat.m34*this.m42);var m33=(mat.m31*this.m13+mat.m32*this.m23+mat.m33*this.m33+mat.m34*this.m43);var m34=(mat.m31*this.m14+mat.m32*this.m24+mat.m33*this.m34+mat.m34*this.m44);var m41=(mat.m41*this.m11+mat.m42*this.m21+mat.m43*this.m31+mat.m44*this.m41);var m42=(mat.m41*this.m12+mat.m42*this.m22+mat.m43*this.m32+mat.m44*this.m42);var m43=(mat.m41*this.m13+mat.m42*this.m23+mat.m43*this.m33+mat.m44*this.m43);var m44=(mat.m41*this.m14+mat.m42*this.m24+mat.m43*this.m34+mat.m44*this.m44);this.m11=m11;this.m12=m12;this.m13=m13;this.m14=m14;this.m21=m21;this.m22=m22;this.m23=m23;this.m24=m24;this.m31=m31;this.m32=m32;this.m33=m33;this.m34=m34;this.m41=m41;this.m42=m42;this.m43=m43;this.m44=m44};CanvasMatrix4.prototype.ortho=function(left,right,bottom,top,near,far){var tx=(left+right)/(left-right);var ty=(top+bottom)/(top-bottom);var tz=(far+near)/(far-near);var matrix=new CanvasMatrix4();matrix.m11=2/(left-right);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=0;matrix.m32=0;matrix.m33=-2/(far-near);matrix.m34=0;matrix.m41=tx;matrix.m42=ty;matrix.m43=tz;matrix.m44=1;this.multRight(matrix)};CanvasMatrix4.prototype.frustum=function(left,right,bottom,top,near,far){var matrix=new CanvasMatrix4();var A=(right+left)/(right-left);var B=(top+bottom)/(top-bottom);var C=-(far+near)/(far-near);var D=-(2*far*near)/(far-near);matrix.m11=(2*near)/(right-left);matrix.m12=0;matrix.m13=0;matrix.m14=0;matrix.m21=0;matrix.m22=2*near/(top-bottom);matrix.m23=0;matrix.m24=0;matrix.m31=A;matrix.m32=B;matrix.m33=C;matrix.m34=-1;matrix.m41=0;matrix.m42=0;matrix.m43=D;matrix.m44=0;this.multRight(matrix)};CanvasMatrix4.prototype.perspective=function(fovy,aspect,zNear,zFar){var top=Math.tan(fovy*Math.PI/360)*zNear;var bottom=-top;var left=aspect*bottom;var right=aspect*top;this.frustum(left,right,bottom,top,zNear,zFar)};CanvasMatrix4.prototype.lookat=function(eyex,eyey,eyez,centerx,centery,centerz,upx,upy,upz){var matrix=new CanvasMatrix4();var zx=eyex-centerx;var zy=eyey-centery;var zz=eyez-centerz;var mag=Math.sqrt(zx*zx+zy*zy+zz*zz);if(mag){zx/=mag;zy/=mag;zz/=mag}var yx=upx;var yy=upy;var yz=upz;xx=yy*zz-yz*zy;xy=-yx*zz+yz*zx;xz=yx*zy-yy*zx;yx=zy*xz-zz*xy;yy=-zx*xz+zz*xx;yx=zx*xy-zy*xx;mag=Math.sqrt(xx*xx+xy*xy+xz*xz);if(mag){xx/=mag;xy/=mag;xz/=mag}mag=Math.sqrt(yx*yx+yy*yy+yz*yz);if(mag){yx/=mag;yy/=mag;yz/=mag}matrix.m11=xx;matrix.m12=xy;matrix.m13=xz;matrix.m14=0;matrix.m21=yx;matrix.m22=yy;matrix.m23=yz;matrix.m24=0;matrix.m31=zx;matrix.m32=zy;matrix.m33=zz;matrix.m34=0;matrix.m41=0;matrix.m42=0;matrix.m43=0;matrix.m44=1;matrix.translate(-eyex,-eyey,-eyez);this.multRight(matrix)};CanvasMatrix4.prototype._determinant2x2=function(a,b,c,d){return a*d-b*c};CanvasMatrix4.prototype._determinant3x3=function(a1,a2,a3,b1,b2,b3,c1,c2,c3){return a1*this._determinant2x2(b2,b3,c2,c3)-b1*this._determinant2x2(a2,a3,c2,c3)+c1*this._determinant2x2(a2,a3,b2,b3)};CanvasMatrix4.prototype._determinant4x4=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;return a1*this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4)-b1*this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4)+c1*this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4)-d1*this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4)};CanvasMatrix4.prototype._makeAdjoint=function(){var a1=this.m11;var b1=this.m12;var c1=this.m13;var d1=this.m14;var a2=this.m21;var b2=this.m22;var c2=this.m23;var d2=this.m24;var a3=this.m31;var b3=this.m32;var c3=this.m33;var d3=this.m34;var a4=this.m41;var b4=this.m42;var c4=this.m43;var d4=this.m44;this.m11=this._determinant3x3(b2,b3,b4,c2,c3,c4,d2,d3,d4);this.m21=-this._determinant3x3(a2,a3,a4,c2,c3,c4,d2,d3,d4);this.m31=this._determinant3x3(a2,a3,a4,b2,b3,b4,d2,d3,d4);this.m41=-this._determinant3x3(a2,a3,a4,b2,b3,b4,c2,c3,c4);this.m12=-this._determinant3x3(b1,b3,b4,c1,c3,c4,d1,d3,d4);this.m22=this._determinant3x3(a1,a3,a4,c1,c3,c4,d1,d3,d4);this.m32=-this._determinant3x3(a1,a3,a4,b1,b3,b4,d1,d3,d4);this.m42=this._determinant3x3(a1,a3,a4,b1,b3,b4,c1,c3,c4);this.m13=this._determinant3x3(b1,b2,b4,c1,c2,c4,d1,d2,d4);this.m23=-this._determinant3x3(a1,a2,a4,c1,c2,c4,d1,d2,d4);this.m33=this._determinant3x3(a1,a2,a4,b1,b2,b4,d1,d2,d4);this.m43=-this._determinant3x3(a1,a2,a4,b1,b2,b4,c1,c2,c4);this.m14=-this._determinant3x3(b1,b2,b3,c1,c2,c3,d1,d2,d3);this.m24=this._determinant3x3(a1,a2,a3,c1,c2,c3,d1,d2,d3);this.m34=-this._determinant3x3(a1,a2,a3,b1,b2,b3,d1,d2,d3);this.m44=this._determinant3x3(a1,a2,a3,b1,b2,b3,c1,c2,c3)}
</script>

This works fine.


```r
x <- sort(rnorm(1000))
y <- rnorm(1000)
z <- rnorm(1000) + atan2(x,y)
plot3d(x, y, z, col=rainbow(1000))
```

<canvas id="testgltextureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** points object 7 ****** -->
<script id="testglvshader7" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
gl_PointSize = 3.;
vCol = aCol;
}
</script>
<script id="testglfshader7" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 9 ****** -->
<script id="testglvshader9" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader9" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 10 ****** -->
<script id="testglvshader10" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader10" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** text object 11 ****** -->
<script id="testglvshader11" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader11" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 12 ****** -->
<script id="testglvshader12" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader12" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 13 ****** -->
<script id="testglvshader13" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader13" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 14 ****** -->
<script id="testglvshader14" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader14" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 15 ****** -->
<script id="testglvshader15" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader15" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 16 ****** -->
<script id="testglvshader16" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader16" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<!-- ****** text object 17 ****** -->
<script id="testglvshader17" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec2 aTexcoord;
varying vec2 vTexcoord;
uniform vec2 textScale;
attribute vec2 aOfs;
void main(void) {
vCol = aCol;
vTexcoord = aTexcoord;
vec4 pos = prMatrix * mvMatrix * vec4(aPos, 1.);
pos = pos/pos.w;
gl_Position = pos + vec4(aOfs*textScale, 0.,0.);
}
</script>
<script id="testglfshader17" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec2 vTexcoord;
uniform sampler2D uSampler;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
vec4 textureColor = lighteffect*texture2D(uSampler, vTexcoord);
if (textureColor.a < 0.1)
discard;
else
gl_FragColor = textureColor;
}
</script> 
<!-- ****** lines object 18 ****** -->
<script id="testglvshader18" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
}
</script>
<script id="testglfshader18" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
void main(void) {
vec4 colDiff = vCol;
vec4 lighteffect = colDiff;
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testglwebGLStart() {
var debug = function(msg) {
document.getElementById("testgldebug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testglcanvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 1;
zoom[1] = 1;
fov[1] = 30;
userMatrix[1] = new CanvasMatrix4();
userMatrix[1].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
function drawTextToCanvas(text, cex) {
var canvasX, canvasY;
var textX, textY;
var textHeight = 20 * cex;
var textColour = "white";
var fontFamily = "Arial";
var backgroundColour = "rgba(0,0,0,0)";
var canvas = document.getElementById("testgltextureCanvas");
var ctx = canvas.getContext("2d");
ctx.font = textHeight+"px "+fontFamily;
canvasX = 1;
var widths = [];
for (var i = 0; i < text.length; i++)  {
widths[i] = ctx.measureText(text[i]).width;
canvasX = (widths[i] > canvasX) ? widths[i] : canvasX;
}	  
canvasX = getPowerOfTwo(canvasX);
var offset = 2*textHeight; // offset to first baseline
var skip = 2*textHeight;   // skip between baselines	  
canvasY = getPowerOfTwo(offset + text.length*skip);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.fillStyle = backgroundColour;
ctx.fillRect(0, 0, ctx.canvas.width, ctx.canvas.height);
ctx.fillStyle = textColour;
ctx.textAlign = "left";
ctx.textBaseline = "alphabetic";
ctx.font = textHeight+"px "+fontFamily;
for(var i = 0; i < text.length; i++) {
textY = i*skip + offset;
ctx.fillText(text[i], 0,  textY);
}
return {canvasX:canvasX, canvasY:canvasY,
widths:widths, textHeight:textHeight,
offset:offset, skip:skip};
}
// ****** points object 7 ******
var prog7  = gl.createProgram();
gl.attachShader(prog7, getShader( gl, "testglvshader7" ));
gl.attachShader(prog7, getShader( gl, "testglfshader7" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog7, 0, "aPos");
gl.bindAttribLocation(prog7, 1, "aCol");
gl.linkProgram(prog7);
var v=new Float32Array([
-2.93693, -0.2468522, -0.8884463, 1, 0, 0, 1,
-2.886773, -0.4391924, -1.511525, 1, 0.007843138, 0, 1,
-2.666155, -1.684532, -2.592591, 1, 0.01176471, 0, 1,
-2.654154, -1.15058, -1.197567, 1, 0.01960784, 0, 1,
-2.648501, -0.3849222, -2.419375, 1, 0.02352941, 0, 1,
-2.579024, -0.2904879, -3.897766, 1, 0.03137255, 0, 1,
-2.555686, 0.9184827, -1.272101, 1, 0.03529412, 0, 1,
-2.516874, -0.8402932, -1.541186, 1, 0.04313726, 0, 1,
-2.470532, 0.9741793, -2.071962, 1, 0.04705882, 0, 1,
-2.385232, -0.6694465, -0.6702573, 1, 0.05490196, 0, 1,
-2.283366, -0.7505379, -1.336352, 1, 0.05882353, 0, 1,
-2.15405, -0.5935287, -2.465636, 1, 0.06666667, 0, 1,
-2.101653, 0.397539, -1.439611, 1, 0.07058824, 0, 1,
-2.096674, 1.584599, -1.728715, 1, 0.07843138, 0, 1,
-2.088869, 0.4888322, -2.742524, 1, 0.08235294, 0, 1,
-2.078581, 0.9480826, 0.05882971, 1, 0.09019608, 0, 1,
-2.061924, -0.1512155, -2.270133, 1, 0.09411765, 0, 1,
-2.040115, -0.2482705, -0.9826669, 1, 0.1019608, 0, 1,
-2.040078, -1.06421, -1.717327, 1, 0.1098039, 0, 1,
-2.036794, -0.02333496, -1.026957, 1, 0.1137255, 0, 1,
-2.036393, -3.210515, -2.315464, 1, 0.1215686, 0, 1,
-2.022547, -0.8896831, -4.000062, 1, 0.1254902, 0, 1,
-1.999887, 0.1584706, -1.255104, 1, 0.1333333, 0, 1,
-1.980316, -0.7015539, -2.851593, 1, 0.1372549, 0, 1,
-1.976672, 0.04370302, -0.9298093, 1, 0.145098, 0, 1,
-1.940334, 2.084635, 0.2399247, 1, 0.1490196, 0, 1,
-1.911947, 0.08327126, -2.752149, 1, 0.1568628, 0, 1,
-1.892616, -0.8098592, -1.40354, 1, 0.1607843, 0, 1,
-1.885028, -0.2870647, -0.02234271, 1, 0.1686275, 0, 1,
-1.883473, -0.4036931, -2.472368, 1, 0.172549, 0, 1,
-1.8743, 0.5125686, 0.2855681, 1, 0.1803922, 0, 1,
-1.871677, 1.085679, -0.1050433, 1, 0.1843137, 0, 1,
-1.853353, -1.008247, -0.451759, 1, 0.1921569, 0, 1,
-1.852929, -2.18225, -2.803408, 1, 0.1960784, 0, 1,
-1.845818, 0.2378149, -2.140926, 1, 0.2039216, 0, 1,
-1.819375, 0.1029001, -1.315722, 1, 0.2117647, 0, 1,
-1.817989, -0.129347, -1.065937, 1, 0.2156863, 0, 1,
-1.813838, 0.01468963, -0.6863011, 1, 0.2235294, 0, 1,
-1.794925, 0.6760802, -2.202008, 1, 0.227451, 0, 1,
-1.79328, -0.3258659, -0.8260998, 1, 0.2352941, 0, 1,
-1.785317, -0.7468239, -3.389306, 1, 0.2392157, 0, 1,
-1.749374, 1.435276, 0.6919348, 1, 0.2470588, 0, 1,
-1.741513, -1.54363, -1.308787, 1, 0.2509804, 0, 1,
-1.729359, -0.1298893, -2.35816, 1, 0.2588235, 0, 1,
-1.710613, 0.5843471, -1.176428, 1, 0.2627451, 0, 1,
-1.706224, 0.7126431, -2.873242, 1, 0.2705882, 0, 1,
-1.677525, -1.126251, -1.998779, 1, 0.2745098, 0, 1,
-1.668528, -1.00265, -0.08462872, 1, 0.282353, 0, 1,
-1.665871, 0.7362485, -1.101228, 1, 0.2862745, 0, 1,
-1.658491, -0.1634413, -1.775707, 1, 0.2941177, 0, 1,
-1.656198, -0.4621396, -2.207313, 1, 0.3019608, 0, 1,
-1.634527, -0.413582, -1.750672, 1, 0.3058824, 0, 1,
-1.618923, 0.7544382, -0.9733634, 1, 0.3137255, 0, 1,
-1.601267, -1.129075, -1.024257, 1, 0.3176471, 0, 1,
-1.600057, -0.6291759, -0.8104512, 1, 0.3254902, 0, 1,
-1.593435, -1.003632, -1.547244, 1, 0.3294118, 0, 1,
-1.590719, -0.1513176, -0.2956326, 1, 0.3372549, 0, 1,
-1.572359, 1.271341, -2.106163, 1, 0.3411765, 0, 1,
-1.533353, -0.9244552, -1.577731, 1, 0.3490196, 0, 1,
-1.528469, -0.903876, -1.575428, 1, 0.3529412, 0, 1,
-1.520042, -1.102547, -1.785991, 1, 0.3607843, 0, 1,
-1.517863, 2.32646, -0.9127921, 1, 0.3647059, 0, 1,
-1.513474, 0.2603088, -0.5236467, 1, 0.372549, 0, 1,
-1.51104, 0.9909631, -1.411749, 1, 0.3764706, 0, 1,
-1.497979, -2.689416, -3.219992, 1, 0.3843137, 0, 1,
-1.497435, -1.470183, -1.427325, 1, 0.3882353, 0, 1,
-1.488833, 0.6806694, -0.2449005, 1, 0.3960784, 0, 1,
-1.482773, -0.1286047, -2.389828, 1, 0.4039216, 0, 1,
-1.47417, -1.030902, -2.789074, 1, 0.4078431, 0, 1,
-1.465621, 0.2287757, -2.665811, 1, 0.4156863, 0, 1,
-1.457325, 0.2537916, -1.880293, 1, 0.4196078, 0, 1,
-1.454136, 0.3632002, -1.740678, 1, 0.427451, 0, 1,
-1.454008, 0.0545607, -2.280066, 1, 0.4313726, 0, 1,
-1.446263, -1.170884, -2.876297, 1, 0.4392157, 0, 1,
-1.438963, -1.23677, -2.314564, 1, 0.4431373, 0, 1,
-1.438788, 0.07654988, -1.085854, 1, 0.4509804, 0, 1,
-1.430119, 0.003624685, -1.047077, 1, 0.454902, 0, 1,
-1.412561, -1.729919, -1.935429, 1, 0.4627451, 0, 1,
-1.407098, 0.812761, -0.7046644, 1, 0.4666667, 0, 1,
-1.392646, 0.3392118, -0.3629063, 1, 0.4745098, 0, 1,
-1.36531, 0.01376198, -0.191233, 1, 0.4784314, 0, 1,
-1.359313, 1.258185, -1.916068, 1, 0.4862745, 0, 1,
-1.357408, -0.1173619, -1.832817, 1, 0.4901961, 0, 1,
-1.356386, 1.715543, -0.8983775, 1, 0.4980392, 0, 1,
-1.352433, -2.577793, -3.491921, 1, 0.5058824, 0, 1,
-1.345272, -1.356182, -2.604237, 1, 0.509804, 0, 1,
-1.345007, 0.9560916, -0.6469488, 1, 0.5176471, 0, 1,
-1.343333, 0.8953518, -1.667579, 1, 0.5215687, 0, 1,
-1.337274, -1.141184, -3.911399, 1, 0.5294118, 0, 1,
-1.337067, -0.3191406, -1.08192, 1, 0.5333334, 0, 1,
-1.322263, 0.5330451, 0.3856874, 1, 0.5411765, 0, 1,
-1.317406, -0.6815657, -1.516962, 1, 0.5450981, 0, 1,
-1.311631, 1.991586, -1.400411, 1, 0.5529412, 0, 1,
-1.30454, -0.8459188, -0.6515037, 1, 0.5568628, 0, 1,
-1.299183, -1.137127, -1.91214, 1, 0.5647059, 0, 1,
-1.297839, 1.510447, -0.9274203, 1, 0.5686275, 0, 1,
-1.286604, 0.737776, -1.936495, 1, 0.5764706, 0, 1,
-1.277222, -0.04473253, 0.5163417, 1, 0.5803922, 0, 1,
-1.267951, 0.8721684, -2.716123, 1, 0.5882353, 0, 1,
-1.264388, -1.52225, -4.339807, 1, 0.5921569, 0, 1,
-1.262167, 0.106085, -3.372132, 1, 0.6, 0, 1,
-1.259809, 1.289494, -2.473134, 1, 0.6078432, 0, 1,
-1.258078, -0.8783057, -2.774754, 1, 0.6117647, 0, 1,
-1.24299, -0.6912145, -2.324358, 1, 0.6196079, 0, 1,
-1.220571, -0.8197868, -2.622153, 1, 0.6235294, 0, 1,
-1.20239, -1.054007, -2.556326, 1, 0.6313726, 0, 1,
-1.202382, 0.5631482, -0.4102296, 1, 0.6352941, 0, 1,
-1.197015, 1.108947, -0.1125781, 1, 0.6431373, 0, 1,
-1.188619, 1.927979, -0.03102768, 1, 0.6470588, 0, 1,
-1.188072, -0.5746028, -1.363325, 1, 0.654902, 0, 1,
-1.185792, -0.1533014, -1.839894, 1, 0.6588235, 0, 1,
-1.179983, 0.9432547, -1.971045, 1, 0.6666667, 0, 1,
-1.176702, -0.6755713, -1.518967, 1, 0.6705883, 0, 1,
-1.167026, -0.5129728, -1.679562, 1, 0.6784314, 0, 1,
-1.162934, 0.215407, -0.9428373, 1, 0.682353, 0, 1,
-1.15446, 0.7041601, -1.334861, 1, 0.6901961, 0, 1,
-1.149246, 0.5086421, -0.7948818, 1, 0.6941177, 0, 1,
-1.134201, 0.293893, -1.119645, 1, 0.7019608, 0, 1,
-1.130094, 0.5797796, -0.2541783, 1, 0.7098039, 0, 1,
-1.12884, 1.191457, -1.789705, 1, 0.7137255, 0, 1,
-1.121197, -0.6690651, -1.426142, 1, 0.7215686, 0, 1,
-1.118733, 0.5662795, -2.971671, 1, 0.7254902, 0, 1,
-1.115214, 1.57652, 0.4570616, 1, 0.7333333, 0, 1,
-1.114615, -1.263968, -2.957618, 1, 0.7372549, 0, 1,
-1.110536, -0.7638432, -1.079866, 1, 0.7450981, 0, 1,
-1.099844, -1.73279, -3.287625, 1, 0.7490196, 0, 1,
-1.097019, -0.3191491, -1.664551, 1, 0.7568628, 0, 1,
-1.094582, -0.2475697, -2.633543, 1, 0.7607843, 0, 1,
-1.088657, -1.735475, -2.36509, 1, 0.7686275, 0, 1,
-1.086745, -0.2309045, -3.511883, 1, 0.772549, 0, 1,
-1.07857, 0.1935246, 0.6524714, 1, 0.7803922, 0, 1,
-1.076339, -0.1838194, -3.377453, 1, 0.7843137, 0, 1,
-1.074278, 0.3438652, 0.4394497, 1, 0.7921569, 0, 1,
-1.072237, -0.8780993, -2.91407, 1, 0.7960784, 0, 1,
-1.065053, -0.02908418, -0.7225686, 1, 0.8039216, 0, 1,
-1.06333, -1.17634, -2.971516, 1, 0.8117647, 0, 1,
-1.050259, 0.3399823, -1.202302, 1, 0.8156863, 0, 1,
-1.042926, 1.482905, -1.527096, 1, 0.8235294, 0, 1,
-1.04135, 0.937102, -1.491246, 1, 0.827451, 0, 1,
-1.036977, 0.797178, -1.48738, 1, 0.8352941, 0, 1,
-1.034636, 0.1775497, -1.170173, 1, 0.8392157, 0, 1,
-1.031098, 0.4419224, 0.007662578, 1, 0.8470588, 0, 1,
-1.030609, 0.6713596, -2.730608, 1, 0.8509804, 0, 1,
-1.029323, 0.285986, -1.714503, 1, 0.8588235, 0, 1,
-1.024826, 0.9511864, -1.236309, 1, 0.8627451, 0, 1,
-1.02326, 1.021779, -1.364047, 1, 0.8705882, 0, 1,
-1.022341, 0.09306675, -0.6220782, 1, 0.8745098, 0, 1,
-1.019175, -1.522066, -1.185803, 1, 0.8823529, 0, 1,
-1.016342, -0.2061525, -2.731271, 1, 0.8862745, 0, 1,
-1.013966, -1.134947, -2.581819, 1, 0.8941177, 0, 1,
-1.011606, 0.5050676, -1.554262, 1, 0.8980392, 0, 1,
-1.004628, 1.548063, -0.02174302, 1, 0.9058824, 0, 1,
-0.9984639, -0.07733393, -0.5864983, 1, 0.9137255, 0, 1,
-0.9980756, 0.6296567, -1.243114, 1, 0.9176471, 0, 1,
-0.9964107, 1.769841, 0.1208716, 1, 0.9254902, 0, 1,
-0.9946891, -0.8612447, -1.684894, 1, 0.9294118, 0, 1,
-0.9904673, -0.4188905, -1.630268, 1, 0.9372549, 0, 1,
-0.9904408, -0.1758418, -1.857777, 1, 0.9411765, 0, 1,
-0.9895903, 0.2751205, -1.326314, 1, 0.9490196, 0, 1,
-0.9854454, 0.4483705, -0.5197268, 1, 0.9529412, 0, 1,
-0.9849278, 0.7921911, -1.450084, 1, 0.9607843, 0, 1,
-0.983587, -2.006575, -4.550412, 1, 0.9647059, 0, 1,
-0.9688193, -0.1947662, -1.917805, 1, 0.972549, 0, 1,
-0.9675107, -1.265278, -4.385638, 1, 0.9764706, 0, 1,
-0.9659361, -0.6540166, -2.129984, 1, 0.9843137, 0, 1,
-0.9606508, 2.01469, 0.9984049, 1, 0.9882353, 0, 1,
-0.9604048, -0.02925294, -1.379272, 1, 0.9960784, 0, 1,
-0.9549949, -0.3975886, -0.8407564, 0.9960784, 1, 0, 1,
-0.9541594, -1.669887, -1.842254, 0.9921569, 1, 0, 1,
-0.9525308, -2.646636, -3.487819, 0.9843137, 1, 0, 1,
-0.9443707, 0.3865286, -2.070691, 0.9803922, 1, 0, 1,
-0.9440318, 0.3450176, -1.679571, 0.972549, 1, 0, 1,
-0.9334774, 1.708867, -1.161796, 0.9686275, 1, 0, 1,
-0.9305109, -0.9601881, -2.284664, 0.9607843, 1, 0, 1,
-0.9290646, -0.8572069, -2.828046, 0.9568627, 1, 0, 1,
-0.9285809, -0.86731, -2.874514, 0.9490196, 1, 0, 1,
-0.9271122, -2.067918, -2.785155, 0.945098, 1, 0, 1,
-0.9214813, 0.5899004, 0.1504152, 0.9372549, 1, 0, 1,
-0.9169125, -0.300852, -0.457303, 0.9333333, 1, 0, 1,
-0.9109076, 0.1604246, -2.046108, 0.9254902, 1, 0, 1,
-0.9095036, 0.6185424, -0.8745305, 0.9215686, 1, 0, 1,
-0.904595, 2.439876, -2.493385, 0.9137255, 1, 0, 1,
-0.9024705, 0.9686278, -0.5353968, 0.9098039, 1, 0, 1,
-0.901275, 1.353265, -0.2910436, 0.9019608, 1, 0, 1,
-0.8993482, -0.3426442, -1.641242, 0.8941177, 1, 0, 1,
-0.8967596, 1.097017, 0.09205105, 0.8901961, 1, 0, 1,
-0.8937698, 1.754839, 0.1666305, 0.8823529, 1, 0, 1,
-0.893319, -0.3275659, -1.404147, 0.8784314, 1, 0, 1,
-0.8914467, 0.5826405, -0.4835573, 0.8705882, 1, 0, 1,
-0.8850242, -1.881528, -1.987498, 0.8666667, 1, 0, 1,
-0.8847891, 1.013569, -2.253572, 0.8588235, 1, 0, 1,
-0.8843862, -1.310348, -0.9230417, 0.854902, 1, 0, 1,
-0.8839751, 1.164043, 0.002265954, 0.8470588, 1, 0, 1,
-0.8807387, -0.2170241, -1.353184, 0.8431373, 1, 0, 1,
-0.8745425, -0.1889393, -1.072169, 0.8352941, 1, 0, 1,
-0.872658, -0.8861983, -2.27484, 0.8313726, 1, 0, 1,
-0.867664, -0.4946431, -2.243612, 0.8235294, 1, 0, 1,
-0.8556174, -0.216088, -0.4148628, 0.8196079, 1, 0, 1,
-0.8523339, 0.6646609, -1.418479, 0.8117647, 1, 0, 1,
-0.8509197, -0.115624, -3.555001, 0.8078431, 1, 0, 1,
-0.850826, 0.2014979, -2.475048, 0.8, 1, 0, 1,
-0.8460633, -0.4871438, -1.764306, 0.7921569, 1, 0, 1,
-0.8296089, 0.09788665, -1.869445, 0.7882353, 1, 0, 1,
-0.8252677, 0.6477196, -0.4585141, 0.7803922, 1, 0, 1,
-0.8247176, 0.1765468, -0.1550298, 0.7764706, 1, 0, 1,
-0.8094985, -1.1202, -2.352147, 0.7686275, 1, 0, 1,
-0.8069901, -0.6652941, -2.769658, 0.7647059, 1, 0, 1,
-0.8064454, -1.203862, -2.731555, 0.7568628, 1, 0, 1,
-0.806401, -0.4437858, -3.126105, 0.7529412, 1, 0, 1,
-0.795839, -0.05186997, -1.973452, 0.7450981, 1, 0, 1,
-0.7931275, 0.5041063, -1.647809, 0.7411765, 1, 0, 1,
-0.790317, -0.8864641, -1.525528, 0.7333333, 1, 0, 1,
-0.7873231, 0.8800701, -0.2971213, 0.7294118, 1, 0, 1,
-0.7817125, -2.437989, -2.329511, 0.7215686, 1, 0, 1,
-0.7800213, -0.1504814, -2.826029, 0.7176471, 1, 0, 1,
-0.7751198, -0.2194808, -2.909139, 0.7098039, 1, 0, 1,
-0.7721438, -1.13189, -3.097465, 0.7058824, 1, 0, 1,
-0.7686053, -1.602405, -2.039481, 0.6980392, 1, 0, 1,
-0.7576567, 0.4376406, -1.308743, 0.6901961, 1, 0, 1,
-0.754046, -0.5805218, -0.2293639, 0.6862745, 1, 0, 1,
-0.7502957, 1.386687, -0.1351434, 0.6784314, 1, 0, 1,
-0.7437896, 0.6927958, -0.3306326, 0.6745098, 1, 0, 1,
-0.7437844, 0.5870306, -0.06580625, 0.6666667, 1, 0, 1,
-0.7414824, 0.7626628, -0.4234669, 0.6627451, 1, 0, 1,
-0.7362789, -0.6953562, -3.412479, 0.654902, 1, 0, 1,
-0.7321544, -2.067449, -3.914795, 0.6509804, 1, 0, 1,
-0.7319195, 0.3714082, -1.428079, 0.6431373, 1, 0, 1,
-0.7308576, 0.2625422, -1.35702, 0.6392157, 1, 0, 1,
-0.7273625, -0.8983405, -3.398331, 0.6313726, 1, 0, 1,
-0.7247394, 2.44786, 0.7255853, 0.627451, 1, 0, 1,
-0.7223659, 0.1564997, -0.04729031, 0.6196079, 1, 0, 1,
-0.715194, 1.170171, 1.567113, 0.6156863, 1, 0, 1,
-0.7053215, -1.068309, -3.640374, 0.6078432, 1, 0, 1,
-0.7038559, -1.648664, -2.278291, 0.6039216, 1, 0, 1,
-0.7035878, 0.5048062, -1.116616, 0.5960785, 1, 0, 1,
-0.7015054, 1.073449, -1.746933, 0.5882353, 1, 0, 1,
-0.7004281, 1.043865, -1.94715, 0.5843138, 1, 0, 1,
-0.698927, -0.3793947, -1.725562, 0.5764706, 1, 0, 1,
-0.6973969, 0.4881043, -2.025491, 0.572549, 1, 0, 1,
-0.6938487, -0.2096791, -1.71671, 0.5647059, 1, 0, 1,
-0.6902283, 0.9266751, -0.4207223, 0.5607843, 1, 0, 1,
-0.6901872, 0.4958982, -1.311014, 0.5529412, 1, 0, 1,
-0.686195, -0.6976359, -2.51138, 0.5490196, 1, 0, 1,
-0.6843389, 1.090502, 0.2863831, 0.5411765, 1, 0, 1,
-0.6838019, 0.7701178, -2.790166, 0.5372549, 1, 0, 1,
-0.6792468, -0.0216212, -1.482723, 0.5294118, 1, 0, 1,
-0.6752744, -0.8487602, -1.468344, 0.5254902, 1, 0, 1,
-0.6739981, 1.033143, -1.570938, 0.5176471, 1, 0, 1,
-0.66956, -1.407711, -3.108334, 0.5137255, 1, 0, 1,
-0.6657924, -0.6607693, -3.319187, 0.5058824, 1, 0, 1,
-0.6542674, -0.8133096, -3.054513, 0.5019608, 1, 0, 1,
-0.6520579, 1.369423, -0.7099757, 0.4941176, 1, 0, 1,
-0.6513184, -0.3823175, -0.3674236, 0.4862745, 1, 0, 1,
-0.6510903, 0.2086267, -0.3909028, 0.4823529, 1, 0, 1,
-0.6451179, -0.4561908, -2.133206, 0.4745098, 1, 0, 1,
-0.6395977, -0.7966447, -2.959029, 0.4705882, 1, 0, 1,
-0.6364971, -0.1202126, -0.9640902, 0.4627451, 1, 0, 1,
-0.6364382, -0.3380811, -4.007683, 0.4588235, 1, 0, 1,
-0.6311409, 0.7954364, -1.103728, 0.4509804, 1, 0, 1,
-0.6302888, -0.1680789, -2.265347, 0.4470588, 1, 0, 1,
-0.6290023, 1.188129, 0.4826347, 0.4392157, 1, 0, 1,
-0.6286671, -0.718032, -4.445084, 0.4352941, 1, 0, 1,
-0.6266509, 0.2223534, -2.45266, 0.427451, 1, 0, 1,
-0.6160965, -0.3364351, -1.675759, 0.4235294, 1, 0, 1,
-0.6140382, -0.05803598, 0.3488146, 0.4156863, 1, 0, 1,
-0.6132128, 0.9394445, -1.115266, 0.4117647, 1, 0, 1,
-0.610405, -1.931718, -2.568656, 0.4039216, 1, 0, 1,
-0.6066068, -2.246055, -1.764419, 0.3960784, 1, 0, 1,
-0.6059476, -0.653663, -1.327756, 0.3921569, 1, 0, 1,
-0.6036972, 0.3966345, 1.041198, 0.3843137, 1, 0, 1,
-0.6032301, 2.469774, 0.06608142, 0.3803922, 1, 0, 1,
-0.594852, -0.7498089, -3.163695, 0.372549, 1, 0, 1,
-0.5936027, -1.525217, -2.603032, 0.3686275, 1, 0, 1,
-0.5929666, 1.390527, -0.5851722, 0.3607843, 1, 0, 1,
-0.5916606, 1.324457, 0.4203431, 0.3568628, 1, 0, 1,
-0.590556, -1.218964, -1.440965, 0.3490196, 1, 0, 1,
-0.5901104, 0.3638063, -1.166676, 0.345098, 1, 0, 1,
-0.5853345, -0.7332489, -2.93314, 0.3372549, 1, 0, 1,
-0.5811438, -0.748612, -0.479222, 0.3333333, 1, 0, 1,
-0.5808476, 1.147333, -1.264348, 0.3254902, 1, 0, 1,
-0.5719091, 1.429648, -0.8445546, 0.3215686, 1, 0, 1,
-0.5709115, 1.144538, -2.206845, 0.3137255, 1, 0, 1,
-0.5648044, 1.061618, 0.7706172, 0.3098039, 1, 0, 1,
-0.5630993, 0.4367596, -0.5270416, 0.3019608, 1, 0, 1,
-0.5614713, 0.6045445, -2.05419, 0.2941177, 1, 0, 1,
-0.5600347, -1.297665, -4.167794, 0.2901961, 1, 0, 1,
-0.5587388, -0.4749325, -1.061257, 0.282353, 1, 0, 1,
-0.5579903, 0.629611, -0.2796544, 0.2784314, 1, 0, 1,
-0.5543702, -0.06269678, -0.8508182, 0.2705882, 1, 0, 1,
-0.5517984, -0.3761745, -1.656568, 0.2666667, 1, 0, 1,
-0.5493794, 0.2479775, -1.781707, 0.2588235, 1, 0, 1,
-0.5487523, -0.3536162, -2.808659, 0.254902, 1, 0, 1,
-0.5483273, -1.24163, -1.977542, 0.2470588, 1, 0, 1,
-0.5467767, -0.6780201, -4.030087, 0.2431373, 1, 0, 1,
-0.5446088, 0.4288217, 1.434452, 0.2352941, 1, 0, 1,
-0.5445101, -0.221407, -1.069221, 0.2313726, 1, 0, 1,
-0.5411261, 0.8712562, 0.9044745, 0.2235294, 1, 0, 1,
-0.5406639, -0.4604412, -1.919435, 0.2196078, 1, 0, 1,
-0.5369505, -0.2009811, -0.6735997, 0.2117647, 1, 0, 1,
-0.5347016, 1.369034, -1.486706, 0.2078431, 1, 0, 1,
-0.5327805, -1.081458, -0.7388117, 0.2, 1, 0, 1,
-0.5315639, 0.9552553, -1.50033, 0.1921569, 1, 0, 1,
-0.5314277, 0.6965166, 0.8153177, 0.1882353, 1, 0, 1,
-0.5204684, 0.5855691, -2.347093, 0.1803922, 1, 0, 1,
-0.5164631, 0.5241541, -0.09879477, 0.1764706, 1, 0, 1,
-0.5158914, -0.6897573, -1.491648, 0.1686275, 1, 0, 1,
-0.5150026, 0.4786595, -0.691504, 0.1647059, 1, 0, 1,
-0.5148611, 0.9750454, -1.872052, 0.1568628, 1, 0, 1,
-0.5115708, -0.00353767, -1.650301, 0.1529412, 1, 0, 1,
-0.5059142, 0.5433169, 0.2386627, 0.145098, 1, 0, 1,
-0.505026, -0.2218157, -1.588017, 0.1411765, 1, 0, 1,
-0.5004135, -0.1483763, -0.9558551, 0.1333333, 1, 0, 1,
-0.499072, 2.149441, -0.6497617, 0.1294118, 1, 0, 1,
-0.4975877, 1.478761, 0.8139769, 0.1215686, 1, 0, 1,
-0.4962064, -0.1176102, -1.304465, 0.1176471, 1, 0, 1,
-0.4906964, -1.855166, -2.635316, 0.1098039, 1, 0, 1,
-0.4855044, 0.7486478, -1.036378, 0.1058824, 1, 0, 1,
-0.484243, 2.530932, -0.5549558, 0.09803922, 1, 0, 1,
-0.4833893, 0.512607, -2.131742, 0.09019608, 1, 0, 1,
-0.4797896, -0.7196577, -2.647873, 0.08627451, 1, 0, 1,
-0.4760191, 2.834345, 0.3920149, 0.07843138, 1, 0, 1,
-0.4719966, -0.3436657, -2.395997, 0.07450981, 1, 0, 1,
-0.4683883, -0.09585852, -2.827765, 0.06666667, 1, 0, 1,
-0.4682577, 1.247084, 0.4793479, 0.0627451, 1, 0, 1,
-0.4675859, -1.528854, -2.820233, 0.05490196, 1, 0, 1,
-0.4569957, -0.1190902, -1.50949, 0.05098039, 1, 0, 1,
-0.4565182, 0.7639952, -1.490814, 0.04313726, 1, 0, 1,
-0.4502766, -0.5124226, -0.9576803, 0.03921569, 1, 0, 1,
-0.448103, 0.2238427, -2.911061, 0.03137255, 1, 0, 1,
-0.448086, -0.475865, -2.528561, 0.02745098, 1, 0, 1,
-0.4437729, -1.278631, -2.325866, 0.01960784, 1, 0, 1,
-0.4404944, 0.9418305, -0.9739408, 0.01568628, 1, 0, 1,
-0.4401583, -0.5455708, -1.450156, 0.007843138, 1, 0, 1,
-0.4383821, 0.719894, 0.1743484, 0.003921569, 1, 0, 1,
-0.4381008, 2.582047, 0.8209324, 0, 1, 0.003921569, 1,
-0.4350782, 1.10674, -0.554344, 0, 1, 0.01176471, 1,
-0.430639, 0.5063198, -0.843025, 0, 1, 0.01568628, 1,
-0.4266855, 0.6088462, 1.187022, 0, 1, 0.02352941, 1,
-0.4206024, 0.932126, -2.166343, 0, 1, 0.02745098, 1,
-0.4157692, 2.55216, -1.393298, 0, 1, 0.03529412, 1,
-0.414307, 0.2143777, -1.767392, 0, 1, 0.03921569, 1,
-0.4140413, 0.5558662, -1.448211, 0, 1, 0.04705882, 1,
-0.4022847, -0.542731, -1.760043, 0, 1, 0.05098039, 1,
-0.3937393, -0.4139805, -4.552033, 0, 1, 0.05882353, 1,
-0.3933457, -1.473801, -2.676288, 0, 1, 0.0627451, 1,
-0.3929122, 1.705796, 0.6536425, 0, 1, 0.07058824, 1,
-0.3893637, -0.2313342, -2.968123, 0, 1, 0.07450981, 1,
-0.3876275, 0.5986422, -0.8486894, 0, 1, 0.08235294, 1,
-0.3857605, -1.57628, -2.823487, 0, 1, 0.08627451, 1,
-0.3854331, 1.83217, 0.2207989, 0, 1, 0.09411765, 1,
-0.381559, -2.169548, -2.465838, 0, 1, 0.1019608, 1,
-0.3705977, 0.6911064, 0.177828, 0, 1, 0.1058824, 1,
-0.3690579, -0.8473659, -1.287926, 0, 1, 0.1137255, 1,
-0.3644735, -0.4322954, -2.920191, 0, 1, 0.1176471, 1,
-0.3622789, 1.619645, 1.207726, 0, 1, 0.1254902, 1,
-0.3612739, -0.4860247, -2.968405, 0, 1, 0.1294118, 1,
-0.3610476, -0.2679034, -0.9722901, 0, 1, 0.1372549, 1,
-0.3608788, -1.389991, -3.192624, 0, 1, 0.1411765, 1,
-0.352298, -0.7216935, -0.8594176, 0, 1, 0.1490196, 1,
-0.350076, -0.4058071, -1.9169, 0, 1, 0.1529412, 1,
-0.3493262, -1.667021, -2.677495, 0, 1, 0.1607843, 1,
-0.3437068, 0.1011419, -1.084769, 0, 1, 0.1647059, 1,
-0.342998, 0.8652359, -1.221881, 0, 1, 0.172549, 1,
-0.3423679, 0.5160728, -0.472445, 0, 1, 0.1764706, 1,
-0.3414492, -1.010236, -2.384056, 0, 1, 0.1843137, 1,
-0.3337537, -0.3514591, -2.724294, 0, 1, 0.1882353, 1,
-0.3318314, 0.5838715, -0.3167525, 0, 1, 0.1960784, 1,
-0.3313275, -1.271401, -4.394021, 0, 1, 0.2039216, 1,
-0.3305666, 0.7329504, -1.703599, 0, 1, 0.2078431, 1,
-0.3297177, -1.959783, -3.010965, 0, 1, 0.2156863, 1,
-0.3249729, -0.2116639, -2.066046, 0, 1, 0.2196078, 1,
-0.3222435, 1.324069, -0.4172888, 0, 1, 0.227451, 1,
-0.3198619, -1.437526, -2.387387, 0, 1, 0.2313726, 1,
-0.319292, -0.9028029, -2.249407, 0, 1, 0.2392157, 1,
-0.3181195, 0.5558405, 0.1641801, 0, 1, 0.2431373, 1,
-0.3174989, 0.980316, -1.822179, 0, 1, 0.2509804, 1,
-0.3169173, -0.3213947, -2.527093, 0, 1, 0.254902, 1,
-0.3163801, -0.6069683, -3.448456, 0, 1, 0.2627451, 1,
-0.3159505, 0.875467, 0.347734, 0, 1, 0.2666667, 1,
-0.3142728, -1.02653, -2.829088, 0, 1, 0.2745098, 1,
-0.3134041, -0.6463965, -3.716132, 0, 1, 0.2784314, 1,
-0.3080019, 0.5881937, 0.3827244, 0, 1, 0.2862745, 1,
-0.3072087, 0.574876, -1.252811, 0, 1, 0.2901961, 1,
-0.3036971, 0.6379001, -1.348909, 0, 1, 0.2980392, 1,
-0.2978224, -1.172831, -4.608908, 0, 1, 0.3058824, 1,
-0.2933981, 0.6380748, -2.212538, 0, 1, 0.3098039, 1,
-0.2907821, 1.383207, -1.072903, 0, 1, 0.3176471, 1,
-0.2899565, -1.222414, -3.691538, 0, 1, 0.3215686, 1,
-0.2890868, -1.601871, -2.961894, 0, 1, 0.3294118, 1,
-0.2825547, 1.624824, 0.5086544, 0, 1, 0.3333333, 1,
-0.2810299, -1.053013, -2.840027, 0, 1, 0.3411765, 1,
-0.2764481, -1.516329, -2.271481, 0, 1, 0.345098, 1,
-0.2733604, 0.7971498, 0.1523283, 0, 1, 0.3529412, 1,
-0.2728972, -1.671325, -5.229923, 0, 1, 0.3568628, 1,
-0.2692459, 1.804101, 2.063682, 0, 1, 0.3647059, 1,
-0.2692075, 0.4942531, -2.135906, 0, 1, 0.3686275, 1,
-0.2690133, 1.588368, -1.39373, 0, 1, 0.3764706, 1,
-0.2671176, -2.763104, -2.032162, 0, 1, 0.3803922, 1,
-0.2630925, -0.5552268, -2.915228, 0, 1, 0.3882353, 1,
-0.2574148, -0.2065068, -1.072615, 0, 1, 0.3921569, 1,
-0.2558139, -1.854973, -4.734633, 0, 1, 0.4, 1,
-0.2477584, -1.518887, -4.834319, 0, 1, 0.4078431, 1,
-0.2430201, 1.849305, -0.3225895, 0, 1, 0.4117647, 1,
-0.2423594, -0.1805089, -1.721076, 0, 1, 0.4196078, 1,
-0.2338409, -0.6309195, -2.8769, 0, 1, 0.4235294, 1,
-0.2315497, 0.2109732, 0.4245715, 0, 1, 0.4313726, 1,
-0.2297675, -2.24802, -1.697613, 0, 1, 0.4352941, 1,
-0.2278754, -0.5938325, -4.781022, 0, 1, 0.4431373, 1,
-0.2233415, -1.260448, -1.303212, 0, 1, 0.4470588, 1,
-0.2233011, 0.05463672, -1.005298, 0, 1, 0.454902, 1,
-0.2179899, 1.82987, 1.039196, 0, 1, 0.4588235, 1,
-0.217562, -0.4563662, -1.923316, 0, 1, 0.4666667, 1,
-0.2146634, -0.9011213, -2.130683, 0, 1, 0.4705882, 1,
-0.2083855, 0.4982052, 0.5696477, 0, 1, 0.4784314, 1,
-0.2069893, 0.04551184, 1.04849, 0, 1, 0.4823529, 1,
-0.2069048, -2.136124, -3.044435, 0, 1, 0.4901961, 1,
-0.1983375, -1.980984, -3.294361, 0, 1, 0.4941176, 1,
-0.195622, 0.6868435, 0.9711993, 0, 1, 0.5019608, 1,
-0.1867709, 0.2034886, -1.127657, 0, 1, 0.509804, 1,
-0.1858132, -1.782336, -2.491004, 0, 1, 0.5137255, 1,
-0.1834565, 0.7322441, -1.750286, 0, 1, 0.5215687, 1,
-0.1817239, -0.6239254, -3.820781, 0, 1, 0.5254902, 1,
-0.1801395, 0.8278314, -0.5759357, 0, 1, 0.5333334, 1,
-0.176999, 1.24638, -1.341353, 0, 1, 0.5372549, 1,
-0.1702527, -1.865813, -1.735393, 0, 1, 0.5450981, 1,
-0.1673477, 0.4400502, 1.167895, 0, 1, 0.5490196, 1,
-0.1672622, 0.1330367, -0.1537977, 0, 1, 0.5568628, 1,
-0.1651281, 2.567227, -0.9190021, 0, 1, 0.5607843, 1,
-0.1630248, 0.7549784, -1.019493, 0, 1, 0.5686275, 1,
-0.1522062, 0.6268085, -0.6911402, 0, 1, 0.572549, 1,
-0.1519676, -0.8833976, -1.85734, 0, 1, 0.5803922, 1,
-0.1514913, -1.295169, -3.325687, 0, 1, 0.5843138, 1,
-0.1490799, -1.222759, -3.464048, 0, 1, 0.5921569, 1,
-0.1477137, -0.06542492, -3.078792, 0, 1, 0.5960785, 1,
-0.1475344, -0.5684736, 0.01821981, 0, 1, 0.6039216, 1,
-0.1421545, -0.3193391, -3.240893, 0, 1, 0.6117647, 1,
-0.1416906, 0.3836187, 0.4605575, 0, 1, 0.6156863, 1,
-0.1413343, -3.12514, -4.041068, 0, 1, 0.6235294, 1,
-0.1347652, -0.6300099, -3.906433, 0, 1, 0.627451, 1,
-0.1272459, 0.05128933, -1.248997, 0, 1, 0.6352941, 1,
-0.1262372, 1.078498, 0.2272889, 0, 1, 0.6392157, 1,
-0.1256586, 0.6606846, 0.4220031, 0, 1, 0.6470588, 1,
-0.1240019, 1.052373, 0.093225, 0, 1, 0.6509804, 1,
-0.1129583, -0.4651273, -3.996136, 0, 1, 0.6588235, 1,
-0.1126478, 1.10028, -0.1995111, 0, 1, 0.6627451, 1,
-0.111561, -0.5237513, -3.411767, 0, 1, 0.6705883, 1,
-0.110365, -0.9361733, -2.563642, 0, 1, 0.6745098, 1,
-0.1103264, 0.2474494, -2.272729, 0, 1, 0.682353, 1,
-0.1039095, -0.07815554, -1.371014, 0, 1, 0.6862745, 1,
-0.1016411, -0.8882756, -1.179523, 0, 1, 0.6941177, 1,
-0.1016266, 0.0955454, -2.445997, 0, 1, 0.7019608, 1,
-0.09920786, -0.1262269, -2.029602, 0, 1, 0.7058824, 1,
-0.09489039, 0.2130337, 0.05646987, 0, 1, 0.7137255, 1,
-0.09287839, 0.4321817, 1.146249, 0, 1, 0.7176471, 1,
-0.08947589, 1.204232, -0.8788056, 0, 1, 0.7254902, 1,
-0.08841988, -1.349096, -3.847536, 0, 1, 0.7294118, 1,
-0.08179333, 0.5405011, 0.08679403, 0, 1, 0.7372549, 1,
-0.08005923, -0.4730013, -1.39084, 0, 1, 0.7411765, 1,
-0.07869331, -0.6543666, -1.194924, 0, 1, 0.7490196, 1,
-0.07545464, -0.3302915, -1.965429, 0, 1, 0.7529412, 1,
-0.07493843, -1.005173, -2.354722, 0, 1, 0.7607843, 1,
-0.07421623, 0.4822459, 0.4379221, 0, 1, 0.7647059, 1,
-0.07043034, -1.423442, -4.740402, 0, 1, 0.772549, 1,
-0.06238634, -0.8490847, -2.939587, 0, 1, 0.7764706, 1,
-0.0612161, -0.5793337, -2.436022, 0, 1, 0.7843137, 1,
-0.05821063, -0.4528684, -2.127908, 0, 1, 0.7882353, 1,
-0.05694357, 0.5429811, 1.066592, 0, 1, 0.7960784, 1,
-0.05392998, -1.137966, -4.099447, 0, 1, 0.8039216, 1,
-0.05075066, 0.966213, 1.200325, 0, 1, 0.8078431, 1,
-0.04995737, 0.09910131, -0.6892557, 0, 1, 0.8156863, 1,
-0.04434966, -1.433141, -2.458671, 0, 1, 0.8196079, 1,
-0.03615803, -2.842862, -5.608004, 0, 1, 0.827451, 1,
-0.03393596, 0.1215178, -0.7164338, 0, 1, 0.8313726, 1,
-0.03077465, 0.02977926, -0.361278, 0, 1, 0.8392157, 1,
-0.03017297, 0.1600578, -2.143466, 0, 1, 0.8431373, 1,
-0.02868493, 1.042747, -1.394688, 0, 1, 0.8509804, 1,
-0.02104742, 0.4740269, 0.5620615, 0, 1, 0.854902, 1,
-0.01902772, 0.8699911, 0.3760731, 0, 1, 0.8627451, 1,
-0.005805308, 0.5181007, 0.7181431, 0, 1, 0.8666667, 1,
-0.001518046, -0.9238466, -2.88923, 0, 1, 0.8745098, 1,
0.001604896, 0.08189145, 0.06212987, 0, 1, 0.8784314, 1,
0.004251467, 1.70544, -1.729621, 0, 1, 0.8862745, 1,
0.005053239, -0.8600887, 1.355277, 0, 1, 0.8901961, 1,
0.006517243, -0.1751433, 4.536272, 0, 1, 0.8980392, 1,
0.007822269, -1.730795, 1.944345, 0, 1, 0.9058824, 1,
0.008370428, -0.36914, 4.288731, 0, 1, 0.9098039, 1,
0.01555901, -0.3578807, 3.65437, 0, 1, 0.9176471, 1,
0.01634234, -0.02733741, 3.619212, 0, 1, 0.9215686, 1,
0.01836234, -0.9763697, 3.709158, 0, 1, 0.9294118, 1,
0.02607742, -0.09321111, 0.7261953, 0, 1, 0.9333333, 1,
0.03059611, -0.9580938, 2.612111, 0, 1, 0.9411765, 1,
0.03095493, -0.1186693, 1.82734, 0, 1, 0.945098, 1,
0.03156938, 0.639443, -1.135858, 0, 1, 0.9529412, 1,
0.03261084, 0.481124, 0.8184544, 0, 1, 0.9568627, 1,
0.03427971, 0.8230014, 0.3183657, 0, 1, 0.9647059, 1,
0.03578024, 0.06683994, 0.7378313, 0, 1, 0.9686275, 1,
0.03910289, -1.390715, 2.609615, 0, 1, 0.9764706, 1,
0.04593655, 0.4327729, -1.237219, 0, 1, 0.9803922, 1,
0.04729589, -0.07223263, 3.25985, 0, 1, 0.9882353, 1,
0.04831959, 0.07943907, 0.2139528, 0, 1, 0.9921569, 1,
0.05346912, -0.4507462, 3.101671, 0, 1, 1, 1,
0.05484137, 0.4364725, 0.5362679, 0, 0.9921569, 1, 1,
0.05548126, -0.5408204, 3.700062, 0, 0.9882353, 1, 1,
0.05636912, -0.9218482, 1.70756, 0, 0.9803922, 1, 1,
0.0609486, 0.3425784, -0.01608733, 0, 0.9764706, 1, 1,
0.06310933, 0.8884857, -0.7256196, 0, 0.9686275, 1, 1,
0.06382755, 0.8818244, 0.215066, 0, 0.9647059, 1, 1,
0.06487216, 1.125877, -1.832713, 0, 0.9568627, 1, 1,
0.07031985, -1.302888, 3.220629, 0, 0.9529412, 1, 1,
0.07308044, -0.4840646, 2.503131, 0, 0.945098, 1, 1,
0.0738738, 0.6371143, 0.06083491, 0, 0.9411765, 1, 1,
0.0758425, -0.8193398, 3.921655, 0, 0.9333333, 1, 1,
0.07817677, -0.2859214, 1.973228, 0, 0.9294118, 1, 1,
0.07838346, 1.122537, -1.209181, 0, 0.9215686, 1, 1,
0.08319161, -0.1888079, 1.034147, 0, 0.9176471, 1, 1,
0.08604356, 0.64102, 0.353541, 0, 0.9098039, 1, 1,
0.08756876, 0.7859548, -0.07165787, 0, 0.9058824, 1, 1,
0.08907208, 0.5528272, -0.8225389, 0, 0.8980392, 1, 1,
0.09054215, 0.05022956, 0.9487043, 0, 0.8901961, 1, 1,
0.09547674, -1.176958, 3.694186, 0, 0.8862745, 1, 1,
0.1029594, 1.120619, -0.5116224, 0, 0.8784314, 1, 1,
0.103219, -1.304468, 4.367121, 0, 0.8745098, 1, 1,
0.1033454, -0.3063597, 2.697789, 0, 0.8666667, 1, 1,
0.104149, 0.2162036, 1.112782, 0, 0.8627451, 1, 1,
0.1049365, -0.8490893, 1.669683, 0, 0.854902, 1, 1,
0.105714, 1.108278, -1.467839, 0, 0.8509804, 1, 1,
0.1057499, -1.7714, 3.369872, 0, 0.8431373, 1, 1,
0.1145743, -2.114427, 2.494224, 0, 0.8392157, 1, 1,
0.1155546, -0.5041099, 3.164715, 0, 0.8313726, 1, 1,
0.1169044, -0.8429542, 2.951485, 0, 0.827451, 1, 1,
0.1171489, 0.8843501, -2.028615, 0, 0.8196079, 1, 1,
0.121649, -1.358183, 2.420777, 0, 0.8156863, 1, 1,
0.1231524, 0.9956121, -0.0759765, 0, 0.8078431, 1, 1,
0.1240773, -1.955657, 2.377373, 0, 0.8039216, 1, 1,
0.1273495, 0.418556, 1.318679, 0, 0.7960784, 1, 1,
0.1332547, -0.6525997, 1.899065, 0, 0.7882353, 1, 1,
0.1338994, -1.392474, 2.862177, 0, 0.7843137, 1, 1,
0.1352788, -1.024471, 3.296744, 0, 0.7764706, 1, 1,
0.1392386, -0.6205912, 1.741382, 0, 0.772549, 1, 1,
0.1401062, -1.520564, 3.786999, 0, 0.7647059, 1, 1,
0.1451312, -0.3135101, 2.508028, 0, 0.7607843, 1, 1,
0.1452468, -0.02035089, 1.750768, 0, 0.7529412, 1, 1,
0.1463768, 0.1793504, 0.5815318, 0, 0.7490196, 1, 1,
0.1518012, -1.561029, 0.8257945, 0, 0.7411765, 1, 1,
0.1546785, -0.5233219, 2.166431, 0, 0.7372549, 1, 1,
0.1599101, 1.67109, -0.2990234, 0, 0.7294118, 1, 1,
0.1613968, -0.6155326, 1.703213, 0, 0.7254902, 1, 1,
0.1623697, 0.1723022, 0.1085758, 0, 0.7176471, 1, 1,
0.1624699, -0.07604028, 2.181835, 0, 0.7137255, 1, 1,
0.1631497, -1.540972, 3.879535, 0, 0.7058824, 1, 1,
0.1722807, -1.150871, 4.286257, 0, 0.6980392, 1, 1,
0.1727681, 2.517177, 1.568313, 0, 0.6941177, 1, 1,
0.175511, -0.1898586, 1.156101, 0, 0.6862745, 1, 1,
0.1770573, 1.390124, -0.2905553, 0, 0.682353, 1, 1,
0.1781493, 2.113477, 1.454876, 0, 0.6745098, 1, 1,
0.1824121, -0.8414522, 4.195593, 0, 0.6705883, 1, 1,
0.1911482, -1.175545, 2.871955, 0, 0.6627451, 1, 1,
0.2016887, 0.5506959, 1.48759, 0, 0.6588235, 1, 1,
0.2051206, 0.9661029, 1.680942, 0, 0.6509804, 1, 1,
0.2104761, 0.5495013, -0.1413882, 0, 0.6470588, 1, 1,
0.2189282, 1.18158, -1.175912, 0, 0.6392157, 1, 1,
0.2230611, 1.168846, 1.079647, 0, 0.6352941, 1, 1,
0.2434294, -0.4260067, 4.149912, 0, 0.627451, 1, 1,
0.2500823, -2.025084, 1.117631, 0, 0.6235294, 1, 1,
0.2535848, 1.709486, 0.5670615, 0, 0.6156863, 1, 1,
0.2548898, -1.654438, 3.47745, 0, 0.6117647, 1, 1,
0.2581994, 0.008004766, 0.5798532, 0, 0.6039216, 1, 1,
0.2638644, 0.1510084, 0.1433894, 0, 0.5960785, 1, 1,
0.2646167, 0.1679093, 0.7505043, 0, 0.5921569, 1, 1,
0.2681739, -0.2963976, -0.7769645, 0, 0.5843138, 1, 1,
0.2752009, -0.9901473, 2.540673, 0, 0.5803922, 1, 1,
0.2762255, -1.759366, 3.713517, 0, 0.572549, 1, 1,
0.2798773, -1.419182, 1.468781, 0, 0.5686275, 1, 1,
0.2801424, 0.295284, 1.175639, 0, 0.5607843, 1, 1,
0.2806731, 1.30713, 0.7870624, 0, 0.5568628, 1, 1,
0.2820233, 0.05044758, 1.232203, 0, 0.5490196, 1, 1,
0.2903746, 0.2639169, 1.614741, 0, 0.5450981, 1, 1,
0.2928579, -0.9610607, 1.302057, 0, 0.5372549, 1, 1,
0.2936556, 1.573306, -0.05020981, 0, 0.5333334, 1, 1,
0.2940349, 0.9375907, 0.6011745, 0, 0.5254902, 1, 1,
0.2959591, 1.042305, 1.661301, 0, 0.5215687, 1, 1,
0.3004889, -0.3413134, 3.207816, 0, 0.5137255, 1, 1,
0.3113633, 1.13667, -0.1071655, 0, 0.509804, 1, 1,
0.3138165, -0.9711035, 4.357682, 0, 0.5019608, 1, 1,
0.315937, -0.9455036, 2.116036, 0, 0.4941176, 1, 1,
0.3226821, -0.2126174, 1.938179, 0, 0.4901961, 1, 1,
0.3246676, 1.131984, 0.9682013, 0, 0.4823529, 1, 1,
0.3255659, -0.8298671, 2.060745, 0, 0.4784314, 1, 1,
0.3256909, 0.8614433, 0.6130627, 0, 0.4705882, 1, 1,
0.3277247, -0.8734212, 6.625617, 0, 0.4666667, 1, 1,
0.32859, -0.1582064, 3.209054, 0, 0.4588235, 1, 1,
0.3302934, -2.336043, 2.775013, 0, 0.454902, 1, 1,
0.3311831, 0.1127004, -0.4975818, 0, 0.4470588, 1, 1,
0.3326105, -2.070659, 1.35956, 0, 0.4431373, 1, 1,
0.3332433, -0.6073053, 3.659425, 0, 0.4352941, 1, 1,
0.3352859, 1.233849, 0.9808942, 0, 0.4313726, 1, 1,
0.3411615, -0.8694125, 2.773819, 0, 0.4235294, 1, 1,
0.3461951, 0.1531354, 0.1494461, 0, 0.4196078, 1, 1,
0.3500169, -2.085341, 3.998398, 0, 0.4117647, 1, 1,
0.3507187, -1.059873, 0.5521207, 0, 0.4078431, 1, 1,
0.3550902, 0.6582036, 1.821166, 0, 0.4, 1, 1,
0.3577659, -0.03219876, 1.467729, 0, 0.3921569, 1, 1,
0.3588623, 0.6360918, -1.462225, 0, 0.3882353, 1, 1,
0.3630234, -0.003043786, 3.428745, 0, 0.3803922, 1, 1,
0.365998, -0.2516377, 2.496607, 0, 0.3764706, 1, 1,
0.3669063, -0.1519972, 2.217481, 0, 0.3686275, 1, 1,
0.3676033, -1.300459, 1.50773, 0, 0.3647059, 1, 1,
0.3678795, -2.207806, 2.989887, 0, 0.3568628, 1, 1,
0.3707331, 0.2307718, 1.339102, 0, 0.3529412, 1, 1,
0.3714333, 2.005712, -0.01214364, 0, 0.345098, 1, 1,
0.3776214, 1.56059, 1.521845, 0, 0.3411765, 1, 1,
0.3783463, 0.7961901, -0.2582687, 0, 0.3333333, 1, 1,
0.3786543, -0.7517899, 1.259823, 0, 0.3294118, 1, 1,
0.3798715, -1.046867, 2.477483, 0, 0.3215686, 1, 1,
0.3800871, -0.579509, 2.335892, 0, 0.3176471, 1, 1,
0.3811791, 0.4626027, 0.3546972, 0, 0.3098039, 1, 1,
0.3821392, 0.8493657, 0.2546589, 0, 0.3058824, 1, 1,
0.3844137, -0.6301741, 1.422355, 0, 0.2980392, 1, 1,
0.3868788, -0.05829914, 4.127569, 0, 0.2901961, 1, 1,
0.387868, -0.6547443, 2.732605, 0, 0.2862745, 1, 1,
0.3907908, -0.4591219, 0.4130812, 0, 0.2784314, 1, 1,
0.3920247, 1.956799, -1.120544, 0, 0.2745098, 1, 1,
0.3927213, 0.7458352, 0.5202727, 0, 0.2666667, 1, 1,
0.3963364, -0.8539836, 3.320087, 0, 0.2627451, 1, 1,
0.3969616, -0.2278436, 0.7106711, 0, 0.254902, 1, 1,
0.3980572, -1.197291, 1.625864, 0, 0.2509804, 1, 1,
0.4008935, 1.418315, -0.07938828, 0, 0.2431373, 1, 1,
0.4021244, 1.98241, 0.7472961, 0, 0.2392157, 1, 1,
0.4057398, 0.1360077, -0.422512, 0, 0.2313726, 1, 1,
0.4199335, -0.2152029, 2.785558, 0, 0.227451, 1, 1,
0.4221222, -0.9531348, 0.9734105, 0, 0.2196078, 1, 1,
0.4363066, 0.5121036, -0.683872, 0, 0.2156863, 1, 1,
0.4382609, 0.03312346, 0.5647043, 0, 0.2078431, 1, 1,
0.4428022, 0.5331166, 0.7360623, 0, 0.2039216, 1, 1,
0.4431691, -0.819306, 1.028277, 0, 0.1960784, 1, 1,
0.4439861, -1.458318, 3.33372, 0, 0.1882353, 1, 1,
0.4458613, 0.4906767, 0.1301838, 0, 0.1843137, 1, 1,
0.4476133, 2.184087, -1.228403, 0, 0.1764706, 1, 1,
0.449516, 1.11871, 0.336116, 0, 0.172549, 1, 1,
0.4500879, -1.701713, 3.536553, 0, 0.1647059, 1, 1,
0.4508779, -0.2350507, 2.363839, 0, 0.1607843, 1, 1,
0.4527642, -0.005548771, 1.113716, 0, 0.1529412, 1, 1,
0.4597819, -1.482417, 2.909341, 0, 0.1490196, 1, 1,
0.4646074, -0.1055273, 1.158692, 0, 0.1411765, 1, 1,
0.4674091, -1.467041, 1.270251, 0, 0.1372549, 1, 1,
0.4679639, -0.4638788, 3.824411, 0, 0.1294118, 1, 1,
0.4681866, -0.1436681, 2.378929, 0, 0.1254902, 1, 1,
0.471543, -0.5560597, 2.137616, 0, 0.1176471, 1, 1,
0.4732034, -0.01337034, 1.325708, 0, 0.1137255, 1, 1,
0.4787437, 0.01308036, 2.322457, 0, 0.1058824, 1, 1,
0.4845773, -1.343045, 3.614327, 0, 0.09803922, 1, 1,
0.491505, -1.128779, 1.419843, 0, 0.09411765, 1, 1,
0.4919163, 1.485762, -0.04742372, 0, 0.08627451, 1, 1,
0.4942779, 0.8439608, 0.7871606, 0, 0.08235294, 1, 1,
0.4974025, -1.671309, 4.644318, 0, 0.07450981, 1, 1,
0.4978097, -2.114996, 4.57372, 0, 0.07058824, 1, 1,
0.4996956, -0.568871, 2.549525, 0, 0.0627451, 1, 1,
0.501972, 0.992591, 1.653656, 0, 0.05882353, 1, 1,
0.5036657, -1.957487, 2.044282, 0, 0.05098039, 1, 1,
0.5040471, -0.8072119, 2.487096, 0, 0.04705882, 1, 1,
0.5051581, -0.1237152, 1.702602, 0, 0.03921569, 1, 1,
0.508763, 1.693671, -0.08462667, 0, 0.03529412, 1, 1,
0.5089191, 1.537704, -0.8657451, 0, 0.02745098, 1, 1,
0.5097888, 1.744998, 2.41226, 0, 0.02352941, 1, 1,
0.5129398, -0.9902514, 1.782014, 0, 0.01568628, 1, 1,
0.5139214, -0.2363598, 2.939035, 0, 0.01176471, 1, 1,
0.5201947, 0.5003633, 0.1990079, 0, 0.003921569, 1, 1,
0.5232495, 1.633114, 0.403911, 0.003921569, 0, 1, 1,
0.5248629, 0.7536774, -0.2771777, 0.007843138, 0, 1, 1,
0.5279198, 0.2379245, 2.011715, 0.01568628, 0, 1, 1,
0.5309963, 1.041748, 0.2338842, 0.01960784, 0, 1, 1,
0.5327383, 1.294608, 1.575157, 0.02745098, 0, 1, 1,
0.5373333, -0.5106735, 1.331863, 0.03137255, 0, 1, 1,
0.537403, 0.2024451, 1.456595, 0.03921569, 0, 1, 1,
0.539073, 2.221417, 1.650343, 0.04313726, 0, 1, 1,
0.5392253, 0.701807, 0.9372669, 0.05098039, 0, 1, 1,
0.5409156, 1.458914, -0.2858505, 0.05490196, 0, 1, 1,
0.5413058, -0.1986115, 2.074741, 0.0627451, 0, 1, 1,
0.5454538, 0.3704918, -0.5666041, 0.06666667, 0, 1, 1,
0.5458727, 0.1774612, -0.2165049, 0.07450981, 0, 1, 1,
0.5487967, 0.9962964, 1.159882, 0.07843138, 0, 1, 1,
0.5518345, -0.3754103, 1.219961, 0.08627451, 0, 1, 1,
0.5552695, -0.2446652, 3.242983, 0.09019608, 0, 1, 1,
0.5567958, 0.6352398, 1.405156, 0.09803922, 0, 1, 1,
0.5568266, -0.6411624, 2.087339, 0.1058824, 0, 1, 1,
0.5569449, -0.5846329, 2.703636, 0.1098039, 0, 1, 1,
0.558414, -0.6871009, 2.379646, 0.1176471, 0, 1, 1,
0.5597684, 0.1604386, 1.462907, 0.1215686, 0, 1, 1,
0.562318, 0.5273653, 2.495442, 0.1294118, 0, 1, 1,
0.5652222, 1.381521, -0.394586, 0.1333333, 0, 1, 1,
0.5675356, -0.0571804, 1.396806, 0.1411765, 0, 1, 1,
0.5685763, -0.7057514, 0.8017216, 0.145098, 0, 1, 1,
0.569556, -0.1470224, 1.410444, 0.1529412, 0, 1, 1,
0.5709456, 0.798243, 0.1901995, 0.1568628, 0, 1, 1,
0.5723599, -1.060876, 0.813443, 0.1647059, 0, 1, 1,
0.5750168, 0.4457816, -0.5603524, 0.1686275, 0, 1, 1,
0.5890712, -0.3828995, 2.544594, 0.1764706, 0, 1, 1,
0.5891343, -0.9709512, 3.866613, 0.1803922, 0, 1, 1,
0.5895687, -0.4954554, 3.272796, 0.1882353, 0, 1, 1,
0.5943534, -0.454974, 2.03943, 0.1921569, 0, 1, 1,
0.5947147, -1.260382, 2.975118, 0.2, 0, 1, 1,
0.5997776, -1.004342, 2.508222, 0.2078431, 0, 1, 1,
0.6014683, -0.5342879, 2.06413, 0.2117647, 0, 1, 1,
0.6025473, -0.5062724, 2.407673, 0.2196078, 0, 1, 1,
0.6066263, 0.687289, -0.2940256, 0.2235294, 0, 1, 1,
0.6067131, -0.4478669, 2.829023, 0.2313726, 0, 1, 1,
0.6091728, -0.3384973, 3.609998, 0.2352941, 0, 1, 1,
0.612316, 2.21666, 1.154822, 0.2431373, 0, 1, 1,
0.6125488, -1.46272, 3.330741, 0.2470588, 0, 1, 1,
0.6127033, -0.7875476, 3.333297, 0.254902, 0, 1, 1,
0.6134273, -1.594034, 2.272808, 0.2588235, 0, 1, 1,
0.6135122, -0.71999, 3.186186, 0.2666667, 0, 1, 1,
0.6144223, 0.9693743, -0.05521808, 0.2705882, 0, 1, 1,
0.6150536, 0.3560816, 0.9488158, 0.2784314, 0, 1, 1,
0.6216311, -0.7709591, 2.255443, 0.282353, 0, 1, 1,
0.6238234, 0.3861255, 1.870214, 0.2901961, 0, 1, 1,
0.6290557, 0.9821596, -0.4727929, 0.2941177, 0, 1, 1,
0.6293467, -0.337351, 2.665734, 0.3019608, 0, 1, 1,
0.6299608, 0.02272664, 1.339934, 0.3098039, 0, 1, 1,
0.6343524, -0.9259115, 0.7398106, 0.3137255, 0, 1, 1,
0.6408397, 1.423689, -0.4931135, 0.3215686, 0, 1, 1,
0.6437972, 1.189453, -1.404432, 0.3254902, 0, 1, 1,
0.6438732, -1.075594, 2.722984, 0.3333333, 0, 1, 1,
0.6444075, -0.02942709, 0.03470324, 0.3372549, 0, 1, 1,
0.64498, -0.8038813, 1.505165, 0.345098, 0, 1, 1,
0.6471802, 0.3958524, 0.6338442, 0.3490196, 0, 1, 1,
0.6484131, -0.124472, 0.424866, 0.3568628, 0, 1, 1,
0.6535141, -1.11008, 2.994168, 0.3607843, 0, 1, 1,
0.6542443, -1.821421, 2.465536, 0.3686275, 0, 1, 1,
0.6625819, 1.010043, 1.170641, 0.372549, 0, 1, 1,
0.6628976, -0.8714229, 3.634691, 0.3803922, 0, 1, 1,
0.665351, 0.1800166, 0.6588173, 0.3843137, 0, 1, 1,
0.6693444, -1.03152, 2.915713, 0.3921569, 0, 1, 1,
0.6729367, 0.3104742, 1.143785, 0.3960784, 0, 1, 1,
0.6733762, 1.051051, 1.502363, 0.4039216, 0, 1, 1,
0.6742077, 0.4583951, 1.671661, 0.4117647, 0, 1, 1,
0.6816608, -0.863525, 3.407103, 0.4156863, 0, 1, 1,
0.6900988, -0.2020673, 3.354448, 0.4235294, 0, 1, 1,
0.693145, -0.3368555, 1.661793, 0.427451, 0, 1, 1,
0.694886, -0.06287878, 2.081794, 0.4352941, 0, 1, 1,
0.6949527, -1.052359, 4.239119, 0.4392157, 0, 1, 1,
0.6956112, -0.3024308, 2.468102, 0.4470588, 0, 1, 1,
0.6958547, -0.6758353, 3.003883, 0.4509804, 0, 1, 1,
0.6963808, -0.4450398, 3.963316, 0.4588235, 0, 1, 1,
0.7037144, -1.296304, 1.846647, 0.4627451, 0, 1, 1,
0.7037364, -1.429293, 2.606218, 0.4705882, 0, 1, 1,
0.70778, 0.6035567, 0.6570165, 0.4745098, 0, 1, 1,
0.7080649, 0.3918844, 2.13833, 0.4823529, 0, 1, 1,
0.7103788, 0.7700544, -0.2690303, 0.4862745, 0, 1, 1,
0.7143337, -2.144604, 5.026104, 0.4941176, 0, 1, 1,
0.7163777, -1.395458, 2.746593, 0.5019608, 0, 1, 1,
0.7232016, 0.02835395, 2.782113, 0.5058824, 0, 1, 1,
0.7251254, 0.09111489, 1.926078, 0.5137255, 0, 1, 1,
0.7286124, 0.5787573, 0.5791594, 0.5176471, 0, 1, 1,
0.7304962, -0.2551354, 3.288424, 0.5254902, 0, 1, 1,
0.747674, -0.8019574, 0.4116489, 0.5294118, 0, 1, 1,
0.7495543, 0.6300532, 0.7894214, 0.5372549, 0, 1, 1,
0.7508389, 0.249493, 2.280022, 0.5411765, 0, 1, 1,
0.7542658, -1.143665, 3.521217, 0.5490196, 0, 1, 1,
0.7551013, 1.371213, -0.7502543, 0.5529412, 0, 1, 1,
0.757135, -0.07927381, 1.317732, 0.5607843, 0, 1, 1,
0.7628979, 0.3728833, 2.443502, 0.5647059, 0, 1, 1,
0.7634328, -0.2362621, 2.221815, 0.572549, 0, 1, 1,
0.7682754, -0.06078288, 0.4221793, 0.5764706, 0, 1, 1,
0.7703781, 0.1197845, 1.480199, 0.5843138, 0, 1, 1,
0.7706594, 0.1664176, 0.8535251, 0.5882353, 0, 1, 1,
0.7831197, -0.4525851, 2.737832, 0.5960785, 0, 1, 1,
0.7899104, -0.511672, 3.034875, 0.6039216, 0, 1, 1,
0.7923194, -0.7745459, 4.011324, 0.6078432, 0, 1, 1,
0.7923335, 0.2466526, 0.920148, 0.6156863, 0, 1, 1,
0.792864, 0.6719651, 0.5067848, 0.6196079, 0, 1, 1,
0.7989551, 1.251436, 1.182019, 0.627451, 0, 1, 1,
0.8025694, -0.6730273, 2.663933, 0.6313726, 0, 1, 1,
0.806221, -0.2738817, 2.977388, 0.6392157, 0, 1, 1,
0.8094743, 1.302548, 2.204863, 0.6431373, 0, 1, 1,
0.8164189, -0.7837552, 1.630561, 0.6509804, 0, 1, 1,
0.8216478, -0.6750391, 3.171443, 0.654902, 0, 1, 1,
0.8253005, -0.9579305, 1.769512, 0.6627451, 0, 1, 1,
0.8258694, 0.7596254, 1.086541, 0.6666667, 0, 1, 1,
0.8343974, 2.329934, 1.805221, 0.6745098, 0, 1, 1,
0.8441786, 0.6446425, 0.2460154, 0.6784314, 0, 1, 1,
0.8461205, 1.184609, 1.028894, 0.6862745, 0, 1, 1,
0.8478916, -0.6390267, 2.09015, 0.6901961, 0, 1, 1,
0.8599648, 0.3189476, 1.667607, 0.6980392, 0, 1, 1,
0.8611267, -0.9396251, 1.995913, 0.7058824, 0, 1, 1,
0.8647847, 1.087672, 1.429921, 0.7098039, 0, 1, 1,
0.866129, 0.2978384, 2.206539, 0.7176471, 0, 1, 1,
0.8733057, -2.474506, 2.90403, 0.7215686, 0, 1, 1,
0.8759485, 0.4488637, 2.169194, 0.7294118, 0, 1, 1,
0.8778644, 0.5885572, 0.8131226, 0.7333333, 0, 1, 1,
0.8837534, -0.9068621, 3.907083, 0.7411765, 0, 1, 1,
0.8861086, -0.02666449, 1.215828, 0.7450981, 0, 1, 1,
0.8869285, 0.3048555, 0.4525771, 0.7529412, 0, 1, 1,
0.8898069, 0.911256, 1.529279, 0.7568628, 0, 1, 1,
0.8900847, 0.2359159, 3.719279, 0.7647059, 0, 1, 1,
0.8955687, -1.539452, 3.686905, 0.7686275, 0, 1, 1,
0.8958031, 1.477633, 0.5878838, 0.7764706, 0, 1, 1,
0.8988572, -1.581485, 3.314239, 0.7803922, 0, 1, 1,
0.8996661, 1.733902, 0.6054847, 0.7882353, 0, 1, 1,
0.899767, 0.994866, 1.267246, 0.7921569, 0, 1, 1,
0.9045216, 0.2716821, 0.4937497, 0.8, 0, 1, 1,
0.9058241, 0.8638746, -0.571752, 0.8078431, 0, 1, 1,
0.9058691, -1.092651, 2.020966, 0.8117647, 0, 1, 1,
0.9059487, 1.362067, 1.367069, 0.8196079, 0, 1, 1,
0.914032, 1.188635, 1.439914, 0.8235294, 0, 1, 1,
0.9150729, -1.738493, 2.842076, 0.8313726, 0, 1, 1,
0.9156623, 0.6488593, 1.337493, 0.8352941, 0, 1, 1,
0.9162626, 1.114936, 0.9038324, 0.8431373, 0, 1, 1,
0.9222776, 0.9949111, -0.3751061, 0.8470588, 0, 1, 1,
0.9274517, 0.5267247, -0.1209365, 0.854902, 0, 1, 1,
0.9284434, -0.3765768, 2.250488, 0.8588235, 0, 1, 1,
0.9295511, -0.1425228, 1.244997, 0.8666667, 0, 1, 1,
0.9299834, 0.6065902, 2.758055, 0.8705882, 0, 1, 1,
0.9327409, -0.9929927, 2.597542, 0.8784314, 0, 1, 1,
0.9340073, -1.365478, 2.079293, 0.8823529, 0, 1, 1,
0.934502, -1.048373, 2.200028, 0.8901961, 0, 1, 1,
0.9351813, -0.6661212, 0.9287739, 0.8941177, 0, 1, 1,
0.9411529, -0.6512849, 1.090389, 0.9019608, 0, 1, 1,
0.9414371, -1.165097, 3.178846, 0.9098039, 0, 1, 1,
0.9472879, -1.312404, 2.359823, 0.9137255, 0, 1, 1,
0.9488068, -0.1916762, 1.365554, 0.9215686, 0, 1, 1,
0.956406, -0.1482478, 3.109439, 0.9254902, 0, 1, 1,
0.9567134, -0.1963439, 0.9187035, 0.9333333, 0, 1, 1,
0.9656065, 0.1245322, 1.05485, 0.9372549, 0, 1, 1,
0.9681832, 0.7558291, 1.854081, 0.945098, 0, 1, 1,
0.9713979, -1.091569, 2.543757, 0.9490196, 0, 1, 1,
0.9757799, -0.2374843, 1.150981, 0.9568627, 0, 1, 1,
0.9762186, -1.125204, 3.229139, 0.9607843, 0, 1, 1,
0.9867239, 0.595198, 1.824948, 0.9686275, 0, 1, 1,
0.9916575, 0.1222485, 1.674109, 0.972549, 0, 1, 1,
0.992296, -0.2748632, 1.642883, 0.9803922, 0, 1, 1,
0.9924113, -1.231172, 2.997144, 0.9843137, 0, 1, 1,
0.9953554, 2.382738, 1.262061, 0.9921569, 0, 1, 1,
0.9988599, 1.52588, -0.3879875, 0.9960784, 0, 1, 1,
1.003856, -0.7750689, 0.5771957, 1, 0, 0.9960784, 1,
1.006333, 2.222154, 1.317031, 1, 0, 0.9882353, 1,
1.028976, -1.028981, 2.696047, 1, 0, 0.9843137, 1,
1.029241, 0.7823058, 3.320858, 1, 0, 0.9764706, 1,
1.031927, 1.654921, 2.23375, 1, 0, 0.972549, 1,
1.034798, 0.06306252, 2.924438, 1, 0, 0.9647059, 1,
1.034819, -0.3627758, 1.4732, 1, 0, 0.9607843, 1,
1.04169, -0.5621877, 1.352394, 1, 0, 0.9529412, 1,
1.043958, 0.06175107, 1.279587, 1, 0, 0.9490196, 1,
1.044427, 0.0696107, 3.291274, 1, 0, 0.9411765, 1,
1.046471, 0.2836292, 1.668932, 1, 0, 0.9372549, 1,
1.046787, -0.8721825, 1.870767, 1, 0, 0.9294118, 1,
1.047954, -2.714283, 2.401589, 1, 0, 0.9254902, 1,
1.049085, 0.722052, 2.705071, 1, 0, 0.9176471, 1,
1.055237, 0.4851621, 1.192837, 1, 0, 0.9137255, 1,
1.05887, 0.5501027, 2.107725, 1, 0, 0.9058824, 1,
1.060886, -0.09574559, 0.7512571, 1, 0, 0.9019608, 1,
1.061815, -1.423638, 1.571791, 1, 0, 0.8941177, 1,
1.063504, -0.3571957, 3.127957, 1, 0, 0.8862745, 1,
1.068766, 0.03167985, 1.639905, 1, 0, 0.8823529, 1,
1.073913, -0.7121871, 3.441461, 1, 0, 0.8745098, 1,
1.089686, -0.8255116, 3.942103, 1, 0, 0.8705882, 1,
1.091922, -2.262774, 2.013595, 1, 0, 0.8627451, 1,
1.093177, 0.1033399, 0.188029, 1, 0, 0.8588235, 1,
1.093676, 0.5864552, 0.4990327, 1, 0, 0.8509804, 1,
1.094942, 0.6436769, 0.4634146, 1, 0, 0.8470588, 1,
1.102468, -0.4456105, 0.706629, 1, 0, 0.8392157, 1,
1.109121, 0.4515289, 0.0627441, 1, 0, 0.8352941, 1,
1.110824, 1.285552, 1.078924, 1, 0, 0.827451, 1,
1.117704, -0.6007557, 1.407451, 1, 0, 0.8235294, 1,
1.140341, 0.8667023, 1.305098, 1, 0, 0.8156863, 1,
1.143786, -0.3343416, 0.8864862, 1, 0, 0.8117647, 1,
1.144257, -1.140383, 4.200702, 1, 0, 0.8039216, 1,
1.153416, 1.138018, 1.572265, 1, 0, 0.7960784, 1,
1.158093, -0.7459714, 3.961926, 1, 0, 0.7921569, 1,
1.167842, 0.4060429, 1.481337, 1, 0, 0.7843137, 1,
1.168121, 0.486596, 1.117995, 1, 0, 0.7803922, 1,
1.168613, 0.1143104, 0.8314484, 1, 0, 0.772549, 1,
1.175692, -0.0856607, 1.660228, 1, 0, 0.7686275, 1,
1.17839, 1.445494, 2.518956, 1, 0, 0.7607843, 1,
1.183072, 0.3631331, 2.242997, 1, 0, 0.7568628, 1,
1.184031, -0.7213296, 2.649646, 1, 0, 0.7490196, 1,
1.186701, -0.8640379, 0.7623664, 1, 0, 0.7450981, 1,
1.193747, 1.131843, 0.238681, 1, 0, 0.7372549, 1,
1.193806, -1.24724, 2.158471, 1, 0, 0.7333333, 1,
1.197571, -0.4887301, 2.148484, 1, 0, 0.7254902, 1,
1.198746, 1.454561, 0.4568532, 1, 0, 0.7215686, 1,
1.201035, 0.9662093, 0.09077647, 1, 0, 0.7137255, 1,
1.203439, 1.834699, 0.3384218, 1, 0, 0.7098039, 1,
1.20724, 1.182079, 0.8572801, 1, 0, 0.7019608, 1,
1.21013, -0.4714054, 3.73455, 1, 0, 0.6941177, 1,
1.210932, 0.06006568, 1.714677, 1, 0, 0.6901961, 1,
1.213832, -0.3386778, 1.333367, 1, 0, 0.682353, 1,
1.221767, 0.5443372, 0.253305, 1, 0, 0.6784314, 1,
1.223164, -0.1820564, 2.936689, 1, 0, 0.6705883, 1,
1.22716, 0.6236918, -0.7447674, 1, 0, 0.6666667, 1,
1.227434, -1.029564, 2.567935, 1, 0, 0.6588235, 1,
1.230078, -0.8983534, 1.273174, 1, 0, 0.654902, 1,
1.243204, 1.348317, 0.9308943, 1, 0, 0.6470588, 1,
1.247142, -0.3310638, 2.364635, 1, 0, 0.6431373, 1,
1.256455, -2.018802, 3.061722, 1, 0, 0.6352941, 1,
1.258335, 0.1627793, 0.8305773, 1, 0, 0.6313726, 1,
1.26748, 0.4238244, 3.176032, 1, 0, 0.6235294, 1,
1.272353, 1.07701, 0.4851796, 1, 0, 0.6196079, 1,
1.279366, -0.19805, 1.528642, 1, 0, 0.6117647, 1,
1.287056, 0.8114415, 0.9639879, 1, 0, 0.6078432, 1,
1.290601, -1.622167, 2.145868, 1, 0, 0.6, 1,
1.294171, -0.813142, 2.037462, 1, 0, 0.5921569, 1,
1.297313, -0.7096407, 1.077503, 1, 0, 0.5882353, 1,
1.31085, -0.1501634, 1.208557, 1, 0, 0.5803922, 1,
1.315389, 0.06529807, 1.429749, 1, 0, 0.5764706, 1,
1.323631, 0.7868945, 1.949929, 1, 0, 0.5686275, 1,
1.323746, 0.7501708, 1.157426, 1, 0, 0.5647059, 1,
1.325865, -0.3561327, 3.072244, 1, 0, 0.5568628, 1,
1.336151, -0.5854483, 0.1207841, 1, 0, 0.5529412, 1,
1.355769, -1.673037, 2.237469, 1, 0, 0.5450981, 1,
1.362313, 2.328953, 1.407778, 1, 0, 0.5411765, 1,
1.366416, -1.167384, 2.469496, 1, 0, 0.5333334, 1,
1.369341, -0.994724, 1.339585, 1, 0, 0.5294118, 1,
1.372983, -0.4205312, 2.493516, 1, 0, 0.5215687, 1,
1.376595, 0.673407, 0.5140146, 1, 0, 0.5176471, 1,
1.377453, -0.3175347, 2.92866, 1, 0, 0.509804, 1,
1.382083, -0.9818475, 2.27039, 1, 0, 0.5058824, 1,
1.393674, 0.1385831, 1.647992, 1, 0, 0.4980392, 1,
1.402822, 0.06731725, 2.255771, 1, 0, 0.4901961, 1,
1.407501, -0.2309502, 3.675709, 1, 0, 0.4862745, 1,
1.41188, -1.618479, 3.22207, 1, 0, 0.4784314, 1,
1.411903, -0.09805378, 2.089061, 1, 0, 0.4745098, 1,
1.419942, -0.2567298, 3.113286, 1, 0, 0.4666667, 1,
1.422579, 0.1732482, 1.878665, 1, 0, 0.4627451, 1,
1.434582, -0.347121, 2.672238, 1, 0, 0.454902, 1,
1.439078, 1.496613, 1.854254, 1, 0, 0.4509804, 1,
1.445971, 1.69259, -0.5995242, 1, 0, 0.4431373, 1,
1.448732, 0.09698176, 1.825119, 1, 0, 0.4392157, 1,
1.463273, 2.254653, 1.423546, 1, 0, 0.4313726, 1,
1.464498, 0.1125568, 3.941416, 1, 0, 0.427451, 1,
1.46665, 0.7922257, 1.712261, 1, 0, 0.4196078, 1,
1.477784, 0.6829795, 1.021149, 1, 0, 0.4156863, 1,
1.496804, 1.642364, -0.1096961, 1, 0, 0.4078431, 1,
1.500401, -1.022401, 1.072307, 1, 0, 0.4039216, 1,
1.501416, -0.926907, 0.828334, 1, 0, 0.3960784, 1,
1.515637, -0.6454283, 0.7765796, 1, 0, 0.3882353, 1,
1.516469, -0.2892059, 1.973942, 1, 0, 0.3843137, 1,
1.520431, -0.7272277, 1.11954, 1, 0, 0.3764706, 1,
1.544486, 0.4922107, 2.207999, 1, 0, 0.372549, 1,
1.548218, 0.3673751, 1.555076, 1, 0, 0.3647059, 1,
1.565329, -1.143262, 0.5378407, 1, 0, 0.3607843, 1,
1.578188, 1.350111, 2.26609, 1, 0, 0.3529412, 1,
1.587601, -0.7877057, 1.658878, 1, 0, 0.3490196, 1,
1.591416, -1.587025, 3.92907, 1, 0, 0.3411765, 1,
1.598334, 1.034557, 0.8278258, 1, 0, 0.3372549, 1,
1.607754, 0.7633055, -0.6745276, 1, 0, 0.3294118, 1,
1.617378, -1.145642, 1.94081, 1, 0, 0.3254902, 1,
1.628036, -1.696355, 0.8691536, 1, 0, 0.3176471, 1,
1.630612, -1.366524, 1.872009, 1, 0, 0.3137255, 1,
1.638141, -0.3477624, 1.649994, 1, 0, 0.3058824, 1,
1.684892, -0.4526045, 3.414338, 1, 0, 0.2980392, 1,
1.687877, -0.3795039, 1.392507, 1, 0, 0.2941177, 1,
1.692399, 0.5989448, 0.2115743, 1, 0, 0.2862745, 1,
1.698175, 0.7730867, 2.404863, 1, 0, 0.282353, 1,
1.700501, -1.84305, 3.610051, 1, 0, 0.2745098, 1,
1.711298, 0.547502, 1.524139, 1, 0, 0.2705882, 1,
1.713875, 0.6928943, 1.224671, 1, 0, 0.2627451, 1,
1.720065, -1.185176, 1.860132, 1, 0, 0.2588235, 1,
1.732955, 0.5664299, 3.769864, 1, 0, 0.2509804, 1,
1.736691, -1.708451, 3.185724, 1, 0, 0.2470588, 1,
1.743525, -0.8786756, 1.601749, 1, 0, 0.2392157, 1,
1.760017, 1.472357, 0.5519201, 1, 0, 0.2352941, 1,
1.769386, -1.931064, 3.707313, 1, 0, 0.227451, 1,
1.776438, 0.7429236, 0.9224925, 1, 0, 0.2235294, 1,
1.778444, 0.9818595, 1.700062, 1, 0, 0.2156863, 1,
1.783808, 0.4261194, 1.375173, 1, 0, 0.2117647, 1,
1.786283, 0.6379438, 1.98295, 1, 0, 0.2039216, 1,
1.807404, -0.1669464, 1.951895, 1, 0, 0.1960784, 1,
1.813344, 0.25467, 2.732432, 1, 0, 0.1921569, 1,
1.842703, 0.1457626, 0.1659726, 1, 0, 0.1843137, 1,
1.882965, -0.2451681, 1.41094, 1, 0, 0.1803922, 1,
1.916552, 0.388216, 2.273198, 1, 0, 0.172549, 1,
1.922651, 0.5280039, 1.628075, 1, 0, 0.1686275, 1,
1.927647, 0.3067104, -0.359255, 1, 0, 0.1607843, 1,
1.941832, -1.350236, 1.91315, 1, 0, 0.1568628, 1,
1.947861, -0.06812692, 2.144038, 1, 0, 0.1490196, 1,
1.968687, -0.07418589, -0.2016803, 1, 0, 0.145098, 1,
1.986846, 0.8664911, 1.4149, 1, 0, 0.1372549, 1,
2.067878, -0.8337179, 2.023621, 1, 0, 0.1333333, 1,
2.070161, -2.541701, 3.437746, 1, 0, 0.1254902, 1,
2.104184, -1.640914, 4.086399, 1, 0, 0.1215686, 1,
2.117812, -0.06622322, 1.12397, 1, 0, 0.1137255, 1,
2.168994, -0.4810213, 1.814961, 1, 0, 0.1098039, 1,
2.240601, 1.092298, 1.661677, 1, 0, 0.1019608, 1,
2.241418, -0.2394265, 1.406165, 1, 0, 0.09411765, 1,
2.245592, -1.237174, 1.086999, 1, 0, 0.09019608, 1,
2.322917, 0.5412445, 0.9309956, 1, 0, 0.08235294, 1,
2.416492, 0.5530347, 1.479489, 1, 0, 0.07843138, 1,
2.454298, -2.321401, 1.935662, 1, 0, 0.07058824, 1,
2.475151, -0.9183279, 0.8550336, 1, 0, 0.06666667, 1,
2.506948, -0.01052677, 2.187185, 1, 0, 0.05882353, 1,
2.538989, -0.4892308, 1.978172, 1, 0, 0.05490196, 1,
2.540326, -0.000424188, 1.66329, 1, 0, 0.04705882, 1,
2.638369, 0.6085856, 1.408758, 1, 0, 0.04313726, 1,
2.661006, -0.770227, 0.5491971, 1, 0, 0.03529412, 1,
2.80627, 0.4132589, -0.1675553, 1, 0, 0.03137255, 1,
2.834196, 0.2649663, 0.7259342, 1, 0, 0.02352941, 1,
2.947675, 0.6767038, 0.9510155, 1, 0, 0.01960784, 1,
2.984516, 0.7406085, 1.946991, 1, 0, 0.01176471, 1,
3.30108, -0.1831435, 1.02113, 1, 0, 0.007843138, 1
]);
var buf7 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc7 = gl.getUniformLocation(prog7,"mvMatrix");
var prMatLoc7 = gl.getUniformLocation(prog7,"prMatrix");
// ****** text object 9 ******
var prog9  = gl.createProgram();
gl.attachShader(prog9, getShader( gl, "testglvshader9" ));
gl.attachShader(prog9, getShader( gl, "testglfshader9" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog9, 0, "aPos");
gl.bindAttribLocation(prog9, 1, "aCol");
gl.linkProgram(prog9);
var texts = [
"x"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX9 = texinfo.canvasX;
var canvasY9 = texinfo.canvasY;
var ofsLoc9 = gl.getAttribLocation(prog9, "aOfs");
var texture9 = gl.createTexture();
var texLoc9 = gl.getAttribLocation(prog9, "aTexcoord");
var sampler9 = gl.getUniformLocation(prog9,"uSampler");
handleLoadedTexture(texture9, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
0.1820748, -4.235119, -7.681603, 0, -0.5, 0.5, 0.5,
0.1820748, -4.235119, -7.681603, 1, -0.5, 0.5, 0.5,
0.1820748, -4.235119, -7.681603, 1, 1.5, 0.5, 0.5,
0.1820748, -4.235119, -7.681603, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf9 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf9 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc9 = gl.getUniformLocation(prog9,"mvMatrix");
var prMatLoc9 = gl.getUniformLocation(prog9,"prMatrix");
var textScaleLoc9 = gl.getUniformLocation(prog9,"textScale");
// ****** text object 10 ******
var prog10  = gl.createProgram();
gl.attachShader(prog10, getShader( gl, "testglvshader10" ));
gl.attachShader(prog10, getShader( gl, "testglfshader10" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog10, 0, "aPos");
gl.bindAttribLocation(prog10, 1, "aCol");
gl.linkProgram(prog10);
var texts = [
"y"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX10 = texinfo.canvasX;
var canvasY10 = texinfo.canvasY;
var ofsLoc10 = gl.getAttribLocation(prog10, "aOfs");
var texture10 = gl.createTexture();
var texLoc10 = gl.getAttribLocation(prog10, "aTexcoord");
var sampler10 = gl.getUniformLocation(prog10,"uSampler");
handleLoadedTexture(texture10, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.994273, -0.1880853, -7.681603, 0, -0.5, 0.5, 0.5,
-3.994273, -0.1880853, -7.681603, 1, -0.5, 0.5, 0.5,
-3.994273, -0.1880853, -7.681603, 1, 1.5, 0.5, 0.5,
-3.994273, -0.1880853, -7.681603, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf10 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf10 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc10 = gl.getUniformLocation(prog10,"mvMatrix");
var prMatLoc10 = gl.getUniformLocation(prog10,"prMatrix");
var textScaleLoc10 = gl.getUniformLocation(prog10,"textScale");
// ****** text object 11 ******
var prog11  = gl.createProgram();
gl.attachShader(prog11, getShader( gl, "testglvshader11" ));
gl.attachShader(prog11, getShader( gl, "testglfshader11" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog11, 0, "aPos");
gl.bindAttribLocation(prog11, 1, "aCol");
gl.linkProgram(prog11);
var texts = [
"z"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX11 = texinfo.canvasX;
var canvasY11 = texinfo.canvasY;
var ofsLoc11 = gl.getAttribLocation(prog11, "aOfs");
var texture11 = gl.createTexture();
var texLoc11 = gl.getAttribLocation(prog11, "aTexcoord");
var sampler11 = gl.getUniformLocation(prog11,"uSampler");
handleLoadedTexture(texture11, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.994273, -4.235119, 0.5088062, 0, -0.5, 0.5, 0.5,
-3.994273, -4.235119, 0.5088062, 1, -0.5, 0.5, 0.5,
-3.994273, -4.235119, 0.5088062, 1, 1.5, 0.5, 0.5,
-3.994273, -4.235119, 0.5088062, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<1; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3
]);
var buf11 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf11 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc11 = gl.getUniformLocation(prog11,"mvMatrix");
var prMatLoc11 = gl.getUniformLocation(prog11,"prMatrix");
var textScaleLoc11 = gl.getUniformLocation(prog11,"textScale");
// ****** lines object 12 ******
var prog12  = gl.createProgram();
gl.attachShader(prog12, getShader( gl, "testglvshader12" ));
gl.attachShader(prog12, getShader( gl, "testglfshader12" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog12, 0, "aPos");
gl.bindAttribLocation(prog12, 1, "aCol");
gl.linkProgram(prog12);
var v=new Float32Array([
-2, -3.301188, -5.791508,
3, -3.301188, -5.791508,
-2, -3.301188, -5.791508,
-2, -3.456844, -6.106524,
-1, -3.301188, -5.791508,
-1, -3.456844, -6.106524,
0, -3.301188, -5.791508,
0, -3.456844, -6.106524,
1, -3.301188, -5.791508,
1, -3.456844, -6.106524,
2, -3.301188, -5.791508,
2, -3.456844, -6.106524,
3, -3.301188, -5.791508,
3, -3.456844, -6.106524
]);
var buf12 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc12 = gl.getUniformLocation(prog12,"mvMatrix");
var prMatLoc12 = gl.getUniformLocation(prog12,"prMatrix");
// ****** text object 13 ******
var prog13  = gl.createProgram();
gl.attachShader(prog13, getShader( gl, "testglvshader13" ));
gl.attachShader(prog13, getShader( gl, "testglfshader13" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog13, 0, "aPos");
gl.bindAttribLocation(prog13, 1, "aCol");
gl.linkProgram(prog13);
var texts = [
"-2",
"-1",
"0",
"1",
"2",
"3"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX13 = texinfo.canvasX;
var canvasY13 = texinfo.canvasY;
var ofsLoc13 = gl.getAttribLocation(prog13, "aOfs");
var texture13 = gl.createTexture();
var texLoc13 = gl.getAttribLocation(prog13, "aTexcoord");
var sampler13 = gl.getUniformLocation(prog13,"uSampler");
handleLoadedTexture(texture13, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-2, -3.768154, -6.736556, 0, -0.5, 0.5, 0.5,
-2, -3.768154, -6.736556, 1, -0.5, 0.5, 0.5,
-2, -3.768154, -6.736556, 1, 1.5, 0.5, 0.5,
-2, -3.768154, -6.736556, 0, 1.5, 0.5, 0.5,
-1, -3.768154, -6.736556, 0, -0.5, 0.5, 0.5,
-1, -3.768154, -6.736556, 1, -0.5, 0.5, 0.5,
-1, -3.768154, -6.736556, 1, 1.5, 0.5, 0.5,
-1, -3.768154, -6.736556, 0, 1.5, 0.5, 0.5,
0, -3.768154, -6.736556, 0, -0.5, 0.5, 0.5,
0, -3.768154, -6.736556, 1, -0.5, 0.5, 0.5,
0, -3.768154, -6.736556, 1, 1.5, 0.5, 0.5,
0, -3.768154, -6.736556, 0, 1.5, 0.5, 0.5,
1, -3.768154, -6.736556, 0, -0.5, 0.5, 0.5,
1, -3.768154, -6.736556, 1, -0.5, 0.5, 0.5,
1, -3.768154, -6.736556, 1, 1.5, 0.5, 0.5,
1, -3.768154, -6.736556, 0, 1.5, 0.5, 0.5,
2, -3.768154, -6.736556, 0, -0.5, 0.5, 0.5,
2, -3.768154, -6.736556, 1, -0.5, 0.5, 0.5,
2, -3.768154, -6.736556, 1, 1.5, 0.5, 0.5,
2, -3.768154, -6.736556, 0, 1.5, 0.5, 0.5,
3, -3.768154, -6.736556, 0, -0.5, 0.5, 0.5,
3, -3.768154, -6.736556, 1, -0.5, 0.5, 0.5,
3, -3.768154, -6.736556, 1, 1.5, 0.5, 0.5,
3, -3.768154, -6.736556, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf13 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf13 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc13 = gl.getUniformLocation(prog13,"mvMatrix");
var prMatLoc13 = gl.getUniformLocation(prog13,"prMatrix");
var textScaleLoc13 = gl.getUniformLocation(prog13,"textScale");
// ****** lines object 14 ******
var prog14  = gl.createProgram();
gl.attachShader(prog14, getShader( gl, "testglvshader14" ));
gl.attachShader(prog14, getShader( gl, "testglfshader14" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog14, 0, "aPos");
gl.bindAttribLocation(prog14, 1, "aCol");
gl.linkProgram(prog14);
var v=new Float32Array([
-3.0305, -3, -5.791508,
-3.0305, 2, -5.791508,
-3.0305, -3, -5.791508,
-3.191129, -3, -6.106524,
-3.0305, -2, -5.791508,
-3.191129, -2, -6.106524,
-3.0305, -1, -5.791508,
-3.191129, -1, -6.106524,
-3.0305, 0, -5.791508,
-3.191129, 0, -6.106524,
-3.0305, 1, -5.791508,
-3.191129, 1, -6.106524,
-3.0305, 2, -5.791508,
-3.191129, 2, -6.106524
]);
var buf14 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc14 = gl.getUniformLocation(prog14,"mvMatrix");
var prMatLoc14 = gl.getUniformLocation(prog14,"prMatrix");
// ****** text object 15 ******
var prog15  = gl.createProgram();
gl.attachShader(prog15, getShader( gl, "testglvshader15" ));
gl.attachShader(prog15, getShader( gl, "testglfshader15" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog15, 0, "aPos");
gl.bindAttribLocation(prog15, 1, "aCol");
gl.linkProgram(prog15);
var texts = [
"-3",
"-2",
"-1",
"0",
"1",
"2"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX15 = texinfo.canvasX;
var canvasY15 = texinfo.canvasY;
var ofsLoc15 = gl.getAttribLocation(prog15, "aOfs");
var texture15 = gl.createTexture();
var texLoc15 = gl.getAttribLocation(prog15, "aTexcoord");
var sampler15 = gl.getUniformLocation(prog15,"uSampler");
handleLoadedTexture(texture15, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.512387, -3, -6.736556, 0, -0.5, 0.5, 0.5,
-3.512387, -3, -6.736556, 1, -0.5, 0.5, 0.5,
-3.512387, -3, -6.736556, 1, 1.5, 0.5, 0.5,
-3.512387, -3, -6.736556, 0, 1.5, 0.5, 0.5,
-3.512387, -2, -6.736556, 0, -0.5, 0.5, 0.5,
-3.512387, -2, -6.736556, 1, -0.5, 0.5, 0.5,
-3.512387, -2, -6.736556, 1, 1.5, 0.5, 0.5,
-3.512387, -2, -6.736556, 0, 1.5, 0.5, 0.5,
-3.512387, -1, -6.736556, 0, -0.5, 0.5, 0.5,
-3.512387, -1, -6.736556, 1, -0.5, 0.5, 0.5,
-3.512387, -1, -6.736556, 1, 1.5, 0.5, 0.5,
-3.512387, -1, -6.736556, 0, 1.5, 0.5, 0.5,
-3.512387, 0, -6.736556, 0, -0.5, 0.5, 0.5,
-3.512387, 0, -6.736556, 1, -0.5, 0.5, 0.5,
-3.512387, 0, -6.736556, 1, 1.5, 0.5, 0.5,
-3.512387, 0, -6.736556, 0, 1.5, 0.5, 0.5,
-3.512387, 1, -6.736556, 0, -0.5, 0.5, 0.5,
-3.512387, 1, -6.736556, 1, -0.5, 0.5, 0.5,
-3.512387, 1, -6.736556, 1, 1.5, 0.5, 0.5,
-3.512387, 1, -6.736556, 0, 1.5, 0.5, 0.5,
-3.512387, 2, -6.736556, 0, -0.5, 0.5, 0.5,
-3.512387, 2, -6.736556, 1, -0.5, 0.5, 0.5,
-3.512387, 2, -6.736556, 1, 1.5, 0.5, 0.5,
-3.512387, 2, -6.736556, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf15 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf15 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc15 = gl.getUniformLocation(prog15,"mvMatrix");
var prMatLoc15 = gl.getUniformLocation(prog15,"prMatrix");
var textScaleLoc15 = gl.getUniformLocation(prog15,"textScale");
// ****** lines object 16 ******
var prog16  = gl.createProgram();
gl.attachShader(prog16, getShader( gl, "testglvshader16" ));
gl.attachShader(prog16, getShader( gl, "testglfshader16" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog16, 0, "aPos");
gl.bindAttribLocation(prog16, 1, "aCol");
gl.linkProgram(prog16);
var v=new Float32Array([
-3.0305, -3.301188, -4,
-3.0305, -3.301188, 6,
-3.0305, -3.301188, -4,
-3.191129, -3.456844, -4,
-3.0305, -3.301188, -2,
-3.191129, -3.456844, -2,
-3.0305, -3.301188, 0,
-3.191129, -3.456844, 0,
-3.0305, -3.301188, 2,
-3.191129, -3.456844, 2,
-3.0305, -3.301188, 4,
-3.191129, -3.456844, 4,
-3.0305, -3.301188, 6,
-3.191129, -3.456844, 6
]);
var buf16 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc16 = gl.getUniformLocation(prog16,"mvMatrix");
var prMatLoc16 = gl.getUniformLocation(prog16,"prMatrix");
// ****** text object 17 ******
var prog17  = gl.createProgram();
gl.attachShader(prog17, getShader( gl, "testglvshader17" ));
gl.attachShader(prog17, getShader( gl, "testglfshader17" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog17, 0, "aPos");
gl.bindAttribLocation(prog17, 1, "aCol");
gl.linkProgram(prog17);
var texts = [
"-4",
"-2",
"0",
"2",
"4",
"6"
];
var texinfo = drawTextToCanvas(texts, 1);	 
var canvasX17 = texinfo.canvasX;
var canvasY17 = texinfo.canvasY;
var ofsLoc17 = gl.getAttribLocation(prog17, "aOfs");
var texture17 = gl.createTexture();
var texLoc17 = gl.getAttribLocation(prog17, "aTexcoord");
var sampler17 = gl.getUniformLocation(prog17,"uSampler");
handleLoadedTexture(texture17, document.getElementById("testgltextureCanvas"));
var v=new Float32Array([
-3.512387, -3.768154, -4, 0, -0.5, 0.5, 0.5,
-3.512387, -3.768154, -4, 1, -0.5, 0.5, 0.5,
-3.512387, -3.768154, -4, 1, 1.5, 0.5, 0.5,
-3.512387, -3.768154, -4, 0, 1.5, 0.5, 0.5,
-3.512387, -3.768154, -2, 0, -0.5, 0.5, 0.5,
-3.512387, -3.768154, -2, 1, -0.5, 0.5, 0.5,
-3.512387, -3.768154, -2, 1, 1.5, 0.5, 0.5,
-3.512387, -3.768154, -2, 0, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 0, 0, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 0, 1, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 0, 1, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 0, 0, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 2, 0, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 2, 1, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 2, 1, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 2, 0, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 4, 0, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 4, 1, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 4, 1, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 4, 0, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 6, 0, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 6, 1, -0.5, 0.5, 0.5,
-3.512387, -3.768154, 6, 1, 1.5, 0.5, 0.5,
-3.512387, -3.768154, 6, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<6; i++) 
for (var j=0; j<4; j++) {
ind = 7*(4*i + j) + 3;
v[ind+2] = 2*(v[ind]-v[ind+2])*texinfo.widths[i];
v[ind+3] = 2*(v[ind+1]-v[ind+3])*texinfo.textHeight;
v[ind] *= texinfo.widths[i]/texinfo.canvasX;
v[ind+1] = 1.0-(texinfo.offset + i*texinfo.skip 
- v[ind+1]*texinfo.textHeight)/texinfo.canvasY;
}
var f=new Uint16Array([
0, 1, 2, 0, 2, 3,
4, 5, 6, 4, 6, 7,
8, 9, 10, 8, 10, 11,
12, 13, 14, 12, 14, 15,
16, 17, 18, 16, 18, 19,
20, 21, 22, 20, 22, 23
]);
var buf17 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var ibuf17 = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
var mvMatLoc17 = gl.getUniformLocation(prog17,"mvMatrix");
var prMatLoc17 = gl.getUniformLocation(prog17,"prMatrix");
var textScaleLoc17 = gl.getUniformLocation(prog17,"textScale");
// ****** lines object 18 ******
var prog18  = gl.createProgram();
gl.attachShader(prog18, getShader( gl, "testglvshader18" ));
gl.attachShader(prog18, getShader( gl, "testglfshader18" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog18, 0, "aPos");
gl.bindAttribLocation(prog18, 1, "aCol");
gl.linkProgram(prog18);
var v=new Float32Array([
-3.0305, -3.301188, -5.791508,
-3.0305, 2.925018, -5.791508,
-3.0305, -3.301188, 6.809121,
-3.0305, 2.925018, 6.809121,
-3.0305, -3.301188, -5.791508,
-3.0305, -3.301188, 6.809121,
-3.0305, 2.925018, -5.791508,
-3.0305, 2.925018, 6.809121,
-3.0305, -3.301188, -5.791508,
3.39465, -3.301188, -5.791508,
-3.0305, -3.301188, 6.809121,
3.39465, -3.301188, 6.809121,
-3.0305, 2.925018, -5.791508,
3.39465, 2.925018, -5.791508,
-3.0305, 2.925018, 6.809121,
3.39465, 2.925018, 6.809121,
3.39465, -3.301188, -5.791508,
3.39465, 2.925018, -5.791508,
3.39465, -3.301188, 6.809121,
3.39465, 2.925018, 6.809121,
3.39465, -3.301188, -5.791508,
3.39465, -3.301188, 6.809121,
3.39465, 2.925018, -5.791508,
3.39465, 2.925018, 6.809121
]);
var buf18 = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var mvMatLoc18 = gl.getUniformLocation(prog18,"mvMatrix");
var prMatLoc18 = gl.getUniformLocation(prog18,"prMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 1 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 8.2521;
var distance = 36.71453;
var t = tan(fov[1]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[1], hlen*aspect*zoom[1], 
-hlen*zoom[1], hlen*zoom[1], near, far);
else  
prMatrix.frustum(-hlen*zoom[1], hlen*zoom[1], 
-hlen*zoom[1]/aspect, hlen*zoom[1]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1820748, 0.1880853, -0.5088062 );
mvMatrix.scale( 1.388657, 1.433029, 0.7080863 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.71453);
// ****** points object 7 *******
gl.useProgram(prog7);
gl.bindBuffer(gl.ARRAY_BUFFER, buf7);
gl.uniformMatrix4fv( prMatLoc7, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc7, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.enableVertexAttribArray( colLoc );
gl.vertexAttribPointer(colLoc, 4, gl.FLOAT, false, 28, 12);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawArrays(gl.POINTS, 0, 1000);
// ****** text object 9 *******
gl.useProgram(prog9);
gl.bindBuffer(gl.ARRAY_BUFFER, buf9);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf9);
gl.uniformMatrix4fv( prMatLoc9, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc9, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc9, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc9 );
gl.vertexAttribPointer(texLoc9, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture9);
gl.uniform1i( sampler9, 0);
gl.enableVertexAttribArray( ofsLoc9 );
gl.vertexAttribPointer(ofsLoc9, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 10 *******
gl.useProgram(prog10);
gl.bindBuffer(gl.ARRAY_BUFFER, buf10);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf10);
gl.uniformMatrix4fv( prMatLoc10, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc10, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc10, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc10 );
gl.vertexAttribPointer(texLoc10, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture10);
gl.uniform1i( sampler10, 0);
gl.enableVertexAttribArray( ofsLoc10 );
gl.vertexAttribPointer(ofsLoc10, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** text object 11 *******
gl.useProgram(prog11);
gl.bindBuffer(gl.ARRAY_BUFFER, buf11);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf11);
gl.uniformMatrix4fv( prMatLoc11, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc11, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc11, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc11 );
gl.vertexAttribPointer(texLoc11, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture11);
gl.uniform1i( sampler11, 0);
gl.enableVertexAttribArray( ofsLoc11 );
gl.vertexAttribPointer(ofsLoc11, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 6, gl.UNSIGNED_SHORT, 0);
// ****** lines object 12 *******
gl.useProgram(prog12);
gl.bindBuffer(gl.ARRAY_BUFFER, buf12);
gl.uniformMatrix4fv( prMatLoc12, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc12, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 13 *******
gl.useProgram(prog13);
gl.bindBuffer(gl.ARRAY_BUFFER, buf13);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf13);
gl.uniformMatrix4fv( prMatLoc13, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc13, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc13, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc13 );
gl.vertexAttribPointer(texLoc13, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture13);
gl.uniform1i( sampler13, 0);
gl.enableVertexAttribArray( ofsLoc13 );
gl.vertexAttribPointer(ofsLoc13, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 14 *******
gl.useProgram(prog14);
gl.bindBuffer(gl.ARRAY_BUFFER, buf14);
gl.uniformMatrix4fv( prMatLoc14, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc14, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 15 *******
gl.useProgram(prog15);
gl.bindBuffer(gl.ARRAY_BUFFER, buf15);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf15);
gl.uniformMatrix4fv( prMatLoc15, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc15, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc15, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc15 );
gl.vertexAttribPointer(texLoc15, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture15);
gl.uniform1i( sampler15, 0);
gl.enableVertexAttribArray( ofsLoc15 );
gl.vertexAttribPointer(ofsLoc15, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 16 *******
gl.useProgram(prog16);
gl.bindBuffer(gl.ARRAY_BUFFER, buf16);
gl.uniformMatrix4fv( prMatLoc16, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc16, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 14);
// ****** text object 17 *******
gl.useProgram(prog17);
gl.bindBuffer(gl.ARRAY_BUFFER, buf17);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, ibuf17);
gl.uniformMatrix4fv( prMatLoc17, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc17, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniform2f( textScaleLoc17, 0.001488095, 0.001488095);
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.enableVertexAttribArray( texLoc17 );
gl.vertexAttribPointer(texLoc17, 2, gl.FLOAT, false, 28, 12);
gl.activeTexture(gl.TEXTURE0);
gl.bindTexture(gl.TEXTURE_2D, texture17);
gl.uniform1i( sampler17, 0);
gl.enableVertexAttribArray( ofsLoc17 );
gl.vertexAttribPointer(ofsLoc17, 2, gl.FLOAT, false, 28, 20);
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 28,  0);
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
// ****** lines object 18 *******
gl.useProgram(prog18);
gl.bindBuffer(gl.ARRAY_BUFFER, buf18);
gl.uniformMatrix4fv( prMatLoc18, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc18, false, new Float32Array(mvMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.disableVertexAttribArray( colLoc );
gl.vertexAttrib4f( colLoc, 0, 0, 0, 1 );
gl.lineWidth( 1 );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.drawArrays(gl.LINES, 0, 24);
gl.flush ();
}
var vpx0 = {
1: 0
};
var vpy0 = {
1: 0
};
var vpWidths = {
1: 504
};
var vpHeights = {
1: 504
};
var activeModel = {
1: 1
};
var activeProjection = {
1: 1
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(1);
return(1);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testglcanvas" width="1" height="1"></canvas> 
<p id="testgldebug">
You must enable Javascript to view this page properly.</p>
<script>testglwebGLStart();</script>

The following a 3D image is of Atrazine rendered from the 3D conformer file derived from here (http://pubchem.ncbi.nlm.nih.gov/compound/2256). The atoms are represented as spheres Nitrogen as blue, carbon as black, hydrogen as white, and chlorine as blue.


```r
open3d()
```

```
## glX 
##   2
```

```r
dicumarol<-read.table("dicumarol.xyz")
```

```
## Error in read.table("dicumarol.xyz"): no lines available in input
```

```r
x<-dicumarol$V2
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
```

```r
y<-dicumarol$V3
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
```

```r
z<-dicumarol$V4
```

```
## Error in eval(expr, envir, enclos): object 'dicumarol' not found
```

```r
atomcolor=c(rep("blue", 1), rep("red", 5), rep("black", 7), rep("white", 15))
#spheres3d(x, y, z, col=rainbow(1000))
spheres3d(x, y, z, col=atomcolor)
```

<canvas id="testgl2textureCanvas" style="display: none;" width="256" height="256">
Your browser does not support the HTML5 canvas element.</canvas>
<!-- ****** spheres object 25 ****** -->
<script id="testgl2vshader25" type="x-shader/x-vertex">
attribute vec3 aPos;
attribute vec4 aCol;
uniform mat4 mvMatrix;
uniform mat4 prMatrix;
varying vec4 vCol;
varying vec4 vPosition;
attribute vec3 aNorm;
uniform mat4 normMatrix;
varying vec3 vNormal;
void main(void) {
vPosition = mvMatrix * vec4(aPos, 1.);
gl_Position = prMatrix * vPosition;
vCol = aCol;
vNormal = normalize((normMatrix * vec4(aNorm, 1.)).xyz);
}
</script>
<script id="testgl2fshader25" type="x-shader/x-fragment"> 
#ifdef GL_ES
precision highp float;
#endif
varying vec4 vCol; // carries alpha
varying vec4 vPosition;
varying vec3 vNormal;
void main(void) {
vec3 eye = normalize(-vPosition.xyz);
const vec3 emission = vec3(0., 0., 0.);
const vec3 ambient1 = vec3(0., 0., 0.);
const vec3 specular1 = vec3(1., 1., 1.);// light*material
const float shininess1 = 50.;
vec4 colDiff1 = vec4(vCol.rgb * vec3(1., 1., 1.), vCol.a);
const vec3 lightDir1 = vec3(0., 0., 1.);
vec3 halfVec1 = normalize(lightDir1 + eye);
vec4 lighteffect = vec4(emission, 0.);
vec3 n = normalize(vNormal);
n = -faceforward(n, n, eye);
vec3 col1 = ambient1;
float nDotL1 = dot(n, lightDir1);
col1 = col1 + max(nDotL1, 0.) * colDiff1.rgb;
col1 = col1 + pow(max(dot(halfVec1, n), 0.), shininess1) * specular1;
lighteffect = lighteffect + vec4(col1, colDiff1.a);
gl_FragColor = lighteffect;
}
</script> 
<script type="text/javascript"> 
function getShader ( gl, id ){
var shaderScript = document.getElementById ( id );
var str = "";
var k = shaderScript.firstChild;
while ( k ){
if ( k.nodeType == 3 ) str += k.textContent;
k = k.nextSibling;
}
var shader;
if ( shaderScript.type == "x-shader/x-fragment" )
shader = gl.createShader ( gl.FRAGMENT_SHADER );
else if ( shaderScript.type == "x-shader/x-vertex" )
shader = gl.createShader(gl.VERTEX_SHADER);
else return null;
gl.shaderSource(shader, str);
gl.compileShader(shader);
if (gl.getShaderParameter(shader, gl.COMPILE_STATUS) == 0)
alert(gl.getShaderInfoLog(shader));
return shader;
}
var min = Math.min;
var max = Math.max;
var sqrt = Math.sqrt;
var sin = Math.sin;
var acos = Math.acos;
var tan = Math.tan;
var SQRT2 = Math.SQRT2;
var PI = Math.PI;
var log = Math.log;
var exp = Math.exp;
function testgl2webGLStart() {
var debug = function(msg) {
document.getElementById("testgl2debug").innerHTML = msg;
}
debug("");
var canvas = document.getElementById("testgl2canvas");
if (!window.WebGLRenderingContext){
debug(" Your browser does not support WebGL. See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var gl;
try {
// Try to grab the standard context. If it fails, fallback to experimental.
gl = canvas.getContext("webgl") 
|| canvas.getContext("experimental-webgl");
}
catch(e) {}
if ( !gl ) {
debug(" Your browser appears to support WebGL, but did not create a WebGL context.  See <a href=\"http://get.webgl.org\">http://get.webgl.org</a>");
return;
}
var width = 505;  var height = 505;
canvas.width = width;   canvas.height = height;
var prMatrix = new CanvasMatrix4();
var mvMatrix = new CanvasMatrix4();
var normMatrix = new CanvasMatrix4();
var saveMat = new CanvasMatrix4();
saveMat.makeIdentity();
var distance;
var posLoc = 0;
var colLoc = 1;
var zoom = new Object();
var fov = new Object();
var userMatrix = new Object();
var activeSubscene = 19;
zoom[19] = 1;
fov[19] = 30;
userMatrix[19] = new CanvasMatrix4();
userMatrix[19].load([
1, 0, 0, 0,
0, 0.3420201, -0.9396926, 0,
0, 0.9396926, 0.3420201, 0,
0, 0, 0, 1
]);
function getPowerOfTwo(value) {
var pow = 1;
while(pow<value) {
pow *= 2;
}
return pow;
}
function handleLoadedTexture(texture, textureCanvas) {
gl.pixelStorei(gl.UNPACK_FLIP_Y_WEBGL, true);
gl.bindTexture(gl.TEXTURE_2D, texture);
gl.texImage2D(gl.TEXTURE_2D, 0, gl.RGBA, gl.RGBA, gl.UNSIGNED_BYTE, textureCanvas);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MAG_FILTER, gl.LINEAR);
gl.texParameteri(gl.TEXTURE_2D, gl.TEXTURE_MIN_FILTER, gl.LINEAR_MIPMAP_NEAREST);
gl.generateMipmap(gl.TEXTURE_2D);
gl.bindTexture(gl.TEXTURE_2D, null);
}
function loadImageToTexture(filename, texture) {   
var canvas = document.getElementById("testgl2textureCanvas");
var ctx = canvas.getContext("2d");
var image = new Image();
image.onload = function() {
var w = image.width;
var h = image.height;
var canvasX = getPowerOfTwo(w);
var canvasY = getPowerOfTwo(h);
canvas.width = canvasX;
canvas.height = canvasY;
ctx.imageSmoothingEnabled = true;
ctx.drawImage(image, 0, 0, canvasX, canvasY);
handleLoadedTexture(texture, canvas);
drawScene();
}
image.src = filename;
}  	   
// ****** sphere object ******
var v=new Float32Array([
-1, 0, 0,
1, 0, 0,
0, -1, 0,
0, 1, 0,
0, 0, -1,
0, 0, 1,
-0.7071068, 0, -0.7071068,
-0.7071068, -0.7071068, 0,
0, -0.7071068, -0.7071068,
-0.7071068, 0, 0.7071068,
0, -0.7071068, 0.7071068,
-0.7071068, 0.7071068, 0,
0, 0.7071068, -0.7071068,
0, 0.7071068, 0.7071068,
0.7071068, -0.7071068, 0,
0.7071068, 0, -0.7071068,
0.7071068, 0, 0.7071068,
0.7071068, 0.7071068, 0,
-0.9349975, 0, -0.3546542,
-0.9349975, -0.3546542, 0,
-0.77044, -0.4507894, -0.4507894,
0, -0.3546542, -0.9349975,
-0.3546542, 0, -0.9349975,
-0.4507894, -0.4507894, -0.77044,
-0.3546542, -0.9349975, 0,
0, -0.9349975, -0.3546542,
-0.4507894, -0.77044, -0.4507894,
-0.9349975, 0, 0.3546542,
-0.77044, -0.4507894, 0.4507894,
0, -0.9349975, 0.3546542,
-0.4507894, -0.77044, 0.4507894,
-0.3546542, 0, 0.9349975,
0, -0.3546542, 0.9349975,
-0.4507894, -0.4507894, 0.77044,
-0.9349975, 0.3546542, 0,
-0.77044, 0.4507894, -0.4507894,
0, 0.9349975, -0.3546542,
-0.3546542, 0.9349975, 0,
-0.4507894, 0.77044, -0.4507894,
0, 0.3546542, -0.9349975,
-0.4507894, 0.4507894, -0.77044,
-0.77044, 0.4507894, 0.4507894,
0, 0.3546542, 0.9349975,
-0.4507894, 0.4507894, 0.77044,
0, 0.9349975, 0.3546542,
-0.4507894, 0.77044, 0.4507894,
0.9349975, -0.3546542, 0,
0.9349975, 0, -0.3546542,
0.77044, -0.4507894, -0.4507894,
0.3546542, -0.9349975, 0,
0.4507894, -0.77044, -0.4507894,
0.3546542, 0, -0.9349975,
0.4507894, -0.4507894, -0.77044,
0.9349975, 0, 0.3546542,
0.77044, -0.4507894, 0.4507894,
0.3546542, 0, 0.9349975,
0.4507894, -0.4507894, 0.77044,
0.4507894, -0.77044, 0.4507894,
0.9349975, 0.3546542, 0,
0.77044, 0.4507894, -0.4507894,
0.4507894, 0.4507894, -0.77044,
0.3546542, 0.9349975, 0,
0.4507894, 0.77044, -0.4507894,
0.77044, 0.4507894, 0.4507894,
0.4507894, 0.77044, 0.4507894,
0.4507894, 0.4507894, 0.77044
]);
var f=new Uint16Array([
0, 18, 19,
6, 20, 18,
7, 19, 20,
19, 18, 20,
4, 21, 22,
8, 23, 21,
6, 22, 23,
22, 21, 23,
2, 24, 25,
7, 26, 24,
8, 25, 26,
25, 24, 26,
7, 20, 26,
6, 23, 20,
8, 26, 23,
26, 20, 23,
0, 19, 27,
7, 28, 19,
9, 27, 28,
27, 19, 28,
2, 29, 24,
10, 30, 29,
7, 24, 30,
24, 29, 30,
5, 31, 32,
9, 33, 31,
10, 32, 33,
32, 31, 33,
9, 28, 33,
7, 30, 28,
10, 33, 30,
33, 28, 30,
0, 34, 18,
11, 35, 34,
6, 18, 35,
18, 34, 35,
3, 36, 37,
12, 38, 36,
11, 37, 38,
37, 36, 38,
4, 22, 39,
6, 40, 22,
12, 39, 40,
39, 22, 40,
6, 35, 40,
11, 38, 35,
12, 40, 38,
40, 35, 38,
0, 27, 34,
9, 41, 27,
11, 34, 41,
34, 27, 41,
5, 42, 31,
13, 43, 42,
9, 31, 43,
31, 42, 43,
3, 37, 44,
11, 45, 37,
13, 44, 45,
44, 37, 45,
11, 41, 45,
9, 43, 41,
13, 45, 43,
45, 41, 43,
1, 46, 47,
14, 48, 46,
15, 47, 48,
47, 46, 48,
2, 25, 49,
8, 50, 25,
14, 49, 50,
49, 25, 50,
4, 51, 21,
15, 52, 51,
8, 21, 52,
21, 51, 52,
15, 48, 52,
14, 50, 48,
8, 52, 50,
52, 48, 50,
1, 53, 46,
16, 54, 53,
14, 46, 54,
46, 53, 54,
5, 32, 55,
10, 56, 32,
16, 55, 56,
55, 32, 56,
2, 49, 29,
14, 57, 49,
10, 29, 57,
29, 49, 57,
14, 54, 57,
16, 56, 54,
10, 57, 56,
57, 54, 56,
1, 47, 58,
15, 59, 47,
17, 58, 59,
58, 47, 59,
4, 39, 51,
12, 60, 39,
15, 51, 60,
51, 39, 60,
3, 61, 36,
17, 62, 61,
12, 36, 62,
36, 61, 62,
17, 59, 62,
15, 60, 59,
12, 62, 60,
62, 59, 60,
1, 58, 53,
17, 63, 58,
16, 53, 63,
53, 58, 63,
3, 44, 61,
13, 64, 44,
17, 61, 64,
61, 44, 64,
5, 55, 42,
16, 65, 55,
13, 42, 65,
42, 55, 65,
16, 63, 65,
17, 64, 63,
13, 65, 64,
65, 63, 64
]);
var sphereBuf = gl.createBuffer();
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bufferData(gl.ARRAY_BUFFER, v, gl.STATIC_DRAW);
var sphereIbuf = gl.createBuffer();
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.bufferData(gl.ELEMENT_ARRAY_BUFFER, f, gl.STATIC_DRAW);
// ****** spheres object 25 ******
var prog25  = gl.createProgram();
gl.attachShader(prog25, getShader( gl, "testgl2vshader25" ));
gl.attachShader(prog25, getShader( gl, "testgl2fshader25" ));
//  Force aPos to location 0, aCol to location 1 
gl.bindAttribLocation(prog25, 0, "aPos");
gl.bindAttribLocation(prog25, 1, "aCol");
gl.linkProgram(prog25);
var v=new Float32Array([
-2.93693, -0.2468522, -0.8884463, 0, 0, 1, 1, 1,
-2.886773, -0.4391924, -1.511525, 1, 0, 0, 1, 1,
-2.666155, -1.684532, -2.592591, 1, 0, 0, 1, 1,
-2.654154, -1.15058, -1.197567, 1, 0, 0, 1, 1,
-2.648501, -0.3849222, -2.419375, 1, 0, 0, 1, 1,
-2.579024, -0.2904879, -3.897766, 1, 0, 0, 1, 1,
-2.555686, 0.9184827, -1.272101, 0, 0, 0, 1, 1,
-2.516874, -0.8402932, -1.541186, 0, 0, 0, 1, 1,
-2.470532, 0.9741793, -2.071962, 0, 0, 0, 1, 1,
-2.385232, -0.6694465, -0.6702573, 0, 0, 0, 1, 1,
-2.283366, -0.7505379, -1.336352, 0, 0, 0, 1, 1,
-2.15405, -0.5935287, -2.465636, 0, 0, 0, 1, 1,
-2.101653, 0.397539, -1.439611, 0, 0, 0, 1, 1,
-2.096674, 1.584599, -1.728715, 1, 1, 1, 1, 1,
-2.088869, 0.4888322, -2.742524, 1, 1, 1, 1, 1,
-2.078581, 0.9480826, 0.05882971, 1, 1, 1, 1, 1,
-2.061924, -0.1512155, -2.270133, 1, 1, 1, 1, 1,
-2.040115, -0.2482705, -0.9826669, 1, 1, 1, 1, 1,
-2.040078, -1.06421, -1.717327, 1, 1, 1, 1, 1,
-2.036794, -0.02333496, -1.026957, 1, 1, 1, 1, 1,
-2.036393, -3.210515, -2.315464, 1, 1, 1, 1, 1,
-2.022547, -0.8896831, -4.000062, 1, 1, 1, 1, 1,
-1.999887, 0.1584706, -1.255104, 1, 1, 1, 1, 1,
-1.980316, -0.7015539, -2.851593, 1, 1, 1, 1, 1,
-1.976672, 0.04370302, -0.9298093, 1, 1, 1, 1, 1,
-1.940334, 2.084635, 0.2399247, 1, 1, 1, 1, 1,
-1.911947, 0.08327126, -2.752149, 1, 1, 1, 1, 1,
-1.892616, -0.8098592, -1.40354, 1, 1, 1, 1, 1,
-1.885028, -0.2870647, -0.02234271, 0, 0, 1, 1, 1,
-1.883473, -0.4036931, -2.472368, 1, 0, 0, 1, 1,
-1.8743, 0.5125686, 0.2855681, 1, 0, 0, 1, 1,
-1.871677, 1.085679, -0.1050433, 1, 0, 0, 1, 1,
-1.853353, -1.008247, -0.451759, 1, 0, 0, 1, 1,
-1.852929, -2.18225, -2.803408, 1, 0, 0, 1, 1,
-1.845818, 0.2378149, -2.140926, 0, 0, 0, 1, 1,
-1.819375, 0.1029001, -1.315722, 0, 0, 0, 1, 1,
-1.817989, -0.129347, -1.065937, 0, 0, 0, 1, 1,
-1.813838, 0.01468963, -0.6863011, 0, 0, 0, 1, 1,
-1.794925, 0.6760802, -2.202008, 0, 0, 0, 1, 1,
-1.79328, -0.3258659, -0.8260998, 0, 0, 0, 1, 1,
-1.785317, -0.7468239, -3.389306, 0, 0, 0, 1, 1,
-1.749374, 1.435276, 0.6919348, 1, 1, 1, 1, 1,
-1.741513, -1.54363, -1.308787, 1, 1, 1, 1, 1,
-1.729359, -0.1298893, -2.35816, 1, 1, 1, 1, 1,
-1.710613, 0.5843471, -1.176428, 1, 1, 1, 1, 1,
-1.706224, 0.7126431, -2.873242, 1, 1, 1, 1, 1,
-1.677525, -1.126251, -1.998779, 1, 1, 1, 1, 1,
-1.668528, -1.00265, -0.08462872, 1, 1, 1, 1, 1,
-1.665871, 0.7362485, -1.101228, 1, 1, 1, 1, 1,
-1.658491, -0.1634413, -1.775707, 1, 1, 1, 1, 1,
-1.656198, -0.4621396, -2.207313, 1, 1, 1, 1, 1,
-1.634527, -0.413582, -1.750672, 1, 1, 1, 1, 1,
-1.618923, 0.7544382, -0.9733634, 1, 1, 1, 1, 1,
-1.601267, -1.129075, -1.024257, 1, 1, 1, 1, 1,
-1.600057, -0.6291759, -0.8104512, 1, 1, 1, 1, 1,
-1.593435, -1.003632, -1.547244, 1, 1, 1, 1, 1,
-1.590719, -0.1513176, -0.2956326, 0, 0, 1, 1, 1,
-1.572359, 1.271341, -2.106163, 1, 0, 0, 1, 1,
-1.533353, -0.9244552, -1.577731, 1, 0, 0, 1, 1,
-1.528469, -0.903876, -1.575428, 1, 0, 0, 1, 1,
-1.520042, -1.102547, -1.785991, 1, 0, 0, 1, 1,
-1.517863, 2.32646, -0.9127921, 1, 0, 0, 1, 1,
-1.513474, 0.2603088, -0.5236467, 0, 0, 0, 1, 1,
-1.51104, 0.9909631, -1.411749, 0, 0, 0, 1, 1,
-1.497979, -2.689416, -3.219992, 0, 0, 0, 1, 1,
-1.497435, -1.470183, -1.427325, 0, 0, 0, 1, 1,
-1.488833, 0.6806694, -0.2449005, 0, 0, 0, 1, 1,
-1.482773, -0.1286047, -2.389828, 0, 0, 0, 1, 1,
-1.47417, -1.030902, -2.789074, 0, 0, 0, 1, 1,
-1.465621, 0.2287757, -2.665811, 1, 1, 1, 1, 1,
-1.457325, 0.2537916, -1.880293, 1, 1, 1, 1, 1,
-1.454136, 0.3632002, -1.740678, 1, 1, 1, 1, 1,
-1.454008, 0.0545607, -2.280066, 1, 1, 1, 1, 1,
-1.446263, -1.170884, -2.876297, 1, 1, 1, 1, 1,
-1.438963, -1.23677, -2.314564, 1, 1, 1, 1, 1,
-1.438788, 0.07654988, -1.085854, 1, 1, 1, 1, 1,
-1.430119, 0.003624685, -1.047077, 1, 1, 1, 1, 1,
-1.412561, -1.729919, -1.935429, 1, 1, 1, 1, 1,
-1.407098, 0.812761, -0.7046644, 1, 1, 1, 1, 1,
-1.392646, 0.3392118, -0.3629063, 1, 1, 1, 1, 1,
-1.36531, 0.01376198, -0.191233, 1, 1, 1, 1, 1,
-1.359313, 1.258185, -1.916068, 1, 1, 1, 1, 1,
-1.357408, -0.1173619, -1.832817, 1, 1, 1, 1, 1,
-1.356386, 1.715543, -0.8983775, 1, 1, 1, 1, 1,
-1.352433, -2.577793, -3.491921, 0, 0, 1, 1, 1,
-1.345272, -1.356182, -2.604237, 1, 0, 0, 1, 1,
-1.345007, 0.9560916, -0.6469488, 1, 0, 0, 1, 1,
-1.343333, 0.8953518, -1.667579, 1, 0, 0, 1, 1,
-1.337274, -1.141184, -3.911399, 1, 0, 0, 1, 1,
-1.337067, -0.3191406, -1.08192, 1, 0, 0, 1, 1,
-1.322263, 0.5330451, 0.3856874, 0, 0, 0, 1, 1,
-1.317406, -0.6815657, -1.516962, 0, 0, 0, 1, 1,
-1.311631, 1.991586, -1.400411, 0, 0, 0, 1, 1,
-1.30454, -0.8459188, -0.6515037, 0, 0, 0, 1, 1,
-1.299183, -1.137127, -1.91214, 0, 0, 0, 1, 1,
-1.297839, 1.510447, -0.9274203, 0, 0, 0, 1, 1,
-1.286604, 0.737776, -1.936495, 0, 0, 0, 1, 1,
-1.277222, -0.04473253, 0.5163417, 1, 1, 1, 1, 1,
-1.267951, 0.8721684, -2.716123, 1, 1, 1, 1, 1,
-1.264388, -1.52225, -4.339807, 1, 1, 1, 1, 1,
-1.262167, 0.106085, -3.372132, 1, 1, 1, 1, 1,
-1.259809, 1.289494, -2.473134, 1, 1, 1, 1, 1,
-1.258078, -0.8783057, -2.774754, 1, 1, 1, 1, 1,
-1.24299, -0.6912145, -2.324358, 1, 1, 1, 1, 1,
-1.220571, -0.8197868, -2.622153, 1, 1, 1, 1, 1,
-1.20239, -1.054007, -2.556326, 1, 1, 1, 1, 1,
-1.202382, 0.5631482, -0.4102296, 1, 1, 1, 1, 1,
-1.197015, 1.108947, -0.1125781, 1, 1, 1, 1, 1,
-1.188619, 1.927979, -0.03102768, 1, 1, 1, 1, 1,
-1.188072, -0.5746028, -1.363325, 1, 1, 1, 1, 1,
-1.185792, -0.1533014, -1.839894, 1, 1, 1, 1, 1,
-1.179983, 0.9432547, -1.971045, 1, 1, 1, 1, 1,
-1.176702, -0.6755713, -1.518967, 0, 0, 1, 1, 1,
-1.167026, -0.5129728, -1.679562, 1, 0, 0, 1, 1,
-1.162934, 0.215407, -0.9428373, 1, 0, 0, 1, 1,
-1.15446, 0.7041601, -1.334861, 1, 0, 0, 1, 1,
-1.149246, 0.5086421, -0.7948818, 1, 0, 0, 1, 1,
-1.134201, 0.293893, -1.119645, 1, 0, 0, 1, 1,
-1.130094, 0.5797796, -0.2541783, 0, 0, 0, 1, 1,
-1.12884, 1.191457, -1.789705, 0, 0, 0, 1, 1,
-1.121197, -0.6690651, -1.426142, 0, 0, 0, 1, 1,
-1.118733, 0.5662795, -2.971671, 0, 0, 0, 1, 1,
-1.115214, 1.57652, 0.4570616, 0, 0, 0, 1, 1,
-1.114615, -1.263968, -2.957618, 0, 0, 0, 1, 1,
-1.110536, -0.7638432, -1.079866, 0, 0, 0, 1, 1,
-1.099844, -1.73279, -3.287625, 1, 1, 1, 1, 1,
-1.097019, -0.3191491, -1.664551, 1, 1, 1, 1, 1,
-1.094582, -0.2475697, -2.633543, 1, 1, 1, 1, 1,
-1.088657, -1.735475, -2.36509, 1, 1, 1, 1, 1,
-1.086745, -0.2309045, -3.511883, 1, 1, 1, 1, 1,
-1.07857, 0.1935246, 0.6524714, 1, 1, 1, 1, 1,
-1.076339, -0.1838194, -3.377453, 1, 1, 1, 1, 1,
-1.074278, 0.3438652, 0.4394497, 1, 1, 1, 1, 1,
-1.072237, -0.8780993, -2.91407, 1, 1, 1, 1, 1,
-1.065053, -0.02908418, -0.7225686, 1, 1, 1, 1, 1,
-1.06333, -1.17634, -2.971516, 1, 1, 1, 1, 1,
-1.050259, 0.3399823, -1.202302, 1, 1, 1, 1, 1,
-1.042926, 1.482905, -1.527096, 1, 1, 1, 1, 1,
-1.04135, 0.937102, -1.491246, 1, 1, 1, 1, 1,
-1.036977, 0.797178, -1.48738, 1, 1, 1, 1, 1,
-1.034636, 0.1775497, -1.170173, 0, 0, 1, 1, 1,
-1.031098, 0.4419224, 0.007662578, 1, 0, 0, 1, 1,
-1.030609, 0.6713596, -2.730608, 1, 0, 0, 1, 1,
-1.029323, 0.285986, -1.714503, 1, 0, 0, 1, 1,
-1.024826, 0.9511864, -1.236309, 1, 0, 0, 1, 1,
-1.02326, 1.021779, -1.364047, 1, 0, 0, 1, 1,
-1.022341, 0.09306675, -0.6220782, 0, 0, 0, 1, 1,
-1.019175, -1.522066, -1.185803, 0, 0, 0, 1, 1,
-1.016342, -0.2061525, -2.731271, 0, 0, 0, 1, 1,
-1.013966, -1.134947, -2.581819, 0, 0, 0, 1, 1,
-1.011606, 0.5050676, -1.554262, 0, 0, 0, 1, 1,
-1.004628, 1.548063, -0.02174302, 0, 0, 0, 1, 1,
-0.9984639, -0.07733393, -0.5864983, 0, 0, 0, 1, 1,
-0.9980756, 0.6296567, -1.243114, 1, 1, 1, 1, 1,
-0.9964107, 1.769841, 0.1208716, 1, 1, 1, 1, 1,
-0.9946891, -0.8612447, -1.684894, 1, 1, 1, 1, 1,
-0.9904673, -0.4188905, -1.630268, 1, 1, 1, 1, 1,
-0.9904408, -0.1758418, -1.857777, 1, 1, 1, 1, 1,
-0.9895903, 0.2751205, -1.326314, 1, 1, 1, 1, 1,
-0.9854454, 0.4483705, -0.5197268, 1, 1, 1, 1, 1,
-0.9849278, 0.7921911, -1.450084, 1, 1, 1, 1, 1,
-0.983587, -2.006575, -4.550412, 1, 1, 1, 1, 1,
-0.9688193, -0.1947662, -1.917805, 1, 1, 1, 1, 1,
-0.9675107, -1.265278, -4.385638, 1, 1, 1, 1, 1,
-0.9659361, -0.6540166, -2.129984, 1, 1, 1, 1, 1,
-0.9606508, 2.01469, 0.9984049, 1, 1, 1, 1, 1,
-0.9604048, -0.02925294, -1.379272, 1, 1, 1, 1, 1,
-0.9549949, -0.3975886, -0.8407564, 1, 1, 1, 1, 1,
-0.9541594, -1.669887, -1.842254, 0, 0, 1, 1, 1,
-0.9525308, -2.646636, -3.487819, 1, 0, 0, 1, 1,
-0.9443707, 0.3865286, -2.070691, 1, 0, 0, 1, 1,
-0.9440318, 0.3450176, -1.679571, 1, 0, 0, 1, 1,
-0.9334774, 1.708867, -1.161796, 1, 0, 0, 1, 1,
-0.9305109, -0.9601881, -2.284664, 1, 0, 0, 1, 1,
-0.9290646, -0.8572069, -2.828046, 0, 0, 0, 1, 1,
-0.9285809, -0.86731, -2.874514, 0, 0, 0, 1, 1,
-0.9271122, -2.067918, -2.785155, 0, 0, 0, 1, 1,
-0.9214813, 0.5899004, 0.1504152, 0, 0, 0, 1, 1,
-0.9169125, -0.300852, -0.457303, 0, 0, 0, 1, 1,
-0.9109076, 0.1604246, -2.046108, 0, 0, 0, 1, 1,
-0.9095036, 0.6185424, -0.8745305, 0, 0, 0, 1, 1,
-0.904595, 2.439876, -2.493385, 1, 1, 1, 1, 1,
-0.9024705, 0.9686278, -0.5353968, 1, 1, 1, 1, 1,
-0.901275, 1.353265, -0.2910436, 1, 1, 1, 1, 1,
-0.8993482, -0.3426442, -1.641242, 1, 1, 1, 1, 1,
-0.8967596, 1.097017, 0.09205105, 1, 1, 1, 1, 1,
-0.8937698, 1.754839, 0.1666305, 1, 1, 1, 1, 1,
-0.893319, -0.3275659, -1.404147, 1, 1, 1, 1, 1,
-0.8914467, 0.5826405, -0.4835573, 1, 1, 1, 1, 1,
-0.8850242, -1.881528, -1.987498, 1, 1, 1, 1, 1,
-0.8847891, 1.013569, -2.253572, 1, 1, 1, 1, 1,
-0.8843862, -1.310348, -0.9230417, 1, 1, 1, 1, 1,
-0.8839751, 1.164043, 0.002265954, 1, 1, 1, 1, 1,
-0.8807387, -0.2170241, -1.353184, 1, 1, 1, 1, 1,
-0.8745425, -0.1889393, -1.072169, 1, 1, 1, 1, 1,
-0.872658, -0.8861983, -2.27484, 1, 1, 1, 1, 1,
-0.867664, -0.4946431, -2.243612, 0, 0, 1, 1, 1,
-0.8556174, -0.216088, -0.4148628, 1, 0, 0, 1, 1,
-0.8523339, 0.6646609, -1.418479, 1, 0, 0, 1, 1,
-0.8509197, -0.115624, -3.555001, 1, 0, 0, 1, 1,
-0.850826, 0.2014979, -2.475048, 1, 0, 0, 1, 1,
-0.8460633, -0.4871438, -1.764306, 1, 0, 0, 1, 1,
-0.8296089, 0.09788665, -1.869445, 0, 0, 0, 1, 1,
-0.8252677, 0.6477196, -0.4585141, 0, 0, 0, 1, 1,
-0.8247176, 0.1765468, -0.1550298, 0, 0, 0, 1, 1,
-0.8094985, -1.1202, -2.352147, 0, 0, 0, 1, 1,
-0.8069901, -0.6652941, -2.769658, 0, 0, 0, 1, 1,
-0.8064454, -1.203862, -2.731555, 0, 0, 0, 1, 1,
-0.806401, -0.4437858, -3.126105, 0, 0, 0, 1, 1,
-0.795839, -0.05186997, -1.973452, 1, 1, 1, 1, 1,
-0.7931275, 0.5041063, -1.647809, 1, 1, 1, 1, 1,
-0.790317, -0.8864641, -1.525528, 1, 1, 1, 1, 1,
-0.7873231, 0.8800701, -0.2971213, 1, 1, 1, 1, 1,
-0.7817125, -2.437989, -2.329511, 1, 1, 1, 1, 1,
-0.7800213, -0.1504814, -2.826029, 1, 1, 1, 1, 1,
-0.7751198, -0.2194808, -2.909139, 1, 1, 1, 1, 1,
-0.7721438, -1.13189, -3.097465, 1, 1, 1, 1, 1,
-0.7686053, -1.602405, -2.039481, 1, 1, 1, 1, 1,
-0.7576567, 0.4376406, -1.308743, 1, 1, 1, 1, 1,
-0.754046, -0.5805218, -0.2293639, 1, 1, 1, 1, 1,
-0.7502957, 1.386687, -0.1351434, 1, 1, 1, 1, 1,
-0.7437896, 0.6927958, -0.3306326, 1, 1, 1, 1, 1,
-0.7437844, 0.5870306, -0.06580625, 1, 1, 1, 1, 1,
-0.7414824, 0.7626628, -0.4234669, 1, 1, 1, 1, 1,
-0.7362789, -0.6953562, -3.412479, 0, 0, 1, 1, 1,
-0.7321544, -2.067449, -3.914795, 1, 0, 0, 1, 1,
-0.7319195, 0.3714082, -1.428079, 1, 0, 0, 1, 1,
-0.7308576, 0.2625422, -1.35702, 1, 0, 0, 1, 1,
-0.7273625, -0.8983405, -3.398331, 1, 0, 0, 1, 1,
-0.7247394, 2.44786, 0.7255853, 1, 0, 0, 1, 1,
-0.7223659, 0.1564997, -0.04729031, 0, 0, 0, 1, 1,
-0.715194, 1.170171, 1.567113, 0, 0, 0, 1, 1,
-0.7053215, -1.068309, -3.640374, 0, 0, 0, 1, 1,
-0.7038559, -1.648664, -2.278291, 0, 0, 0, 1, 1,
-0.7035878, 0.5048062, -1.116616, 0, 0, 0, 1, 1,
-0.7015054, 1.073449, -1.746933, 0, 0, 0, 1, 1,
-0.7004281, 1.043865, -1.94715, 0, 0, 0, 1, 1,
-0.698927, -0.3793947, -1.725562, 1, 1, 1, 1, 1,
-0.6973969, 0.4881043, -2.025491, 1, 1, 1, 1, 1,
-0.6938487, -0.2096791, -1.71671, 1, 1, 1, 1, 1,
-0.6902283, 0.9266751, -0.4207223, 1, 1, 1, 1, 1,
-0.6901872, 0.4958982, -1.311014, 1, 1, 1, 1, 1,
-0.686195, -0.6976359, -2.51138, 1, 1, 1, 1, 1,
-0.6843389, 1.090502, 0.2863831, 1, 1, 1, 1, 1,
-0.6838019, 0.7701178, -2.790166, 1, 1, 1, 1, 1,
-0.6792468, -0.0216212, -1.482723, 1, 1, 1, 1, 1,
-0.6752744, -0.8487602, -1.468344, 1, 1, 1, 1, 1,
-0.6739981, 1.033143, -1.570938, 1, 1, 1, 1, 1,
-0.66956, -1.407711, -3.108334, 1, 1, 1, 1, 1,
-0.6657924, -0.6607693, -3.319187, 1, 1, 1, 1, 1,
-0.6542674, -0.8133096, -3.054513, 1, 1, 1, 1, 1,
-0.6520579, 1.369423, -0.7099757, 1, 1, 1, 1, 1,
-0.6513184, -0.3823175, -0.3674236, 0, 0, 1, 1, 1,
-0.6510903, 0.2086267, -0.3909028, 1, 0, 0, 1, 1,
-0.6451179, -0.4561908, -2.133206, 1, 0, 0, 1, 1,
-0.6395977, -0.7966447, -2.959029, 1, 0, 0, 1, 1,
-0.6364971, -0.1202126, -0.9640902, 1, 0, 0, 1, 1,
-0.6364382, -0.3380811, -4.007683, 1, 0, 0, 1, 1,
-0.6311409, 0.7954364, -1.103728, 0, 0, 0, 1, 1,
-0.6302888, -0.1680789, -2.265347, 0, 0, 0, 1, 1,
-0.6290023, 1.188129, 0.4826347, 0, 0, 0, 1, 1,
-0.6286671, -0.718032, -4.445084, 0, 0, 0, 1, 1,
-0.6266509, 0.2223534, -2.45266, 0, 0, 0, 1, 1,
-0.6160965, -0.3364351, -1.675759, 0, 0, 0, 1, 1,
-0.6140382, -0.05803598, 0.3488146, 0, 0, 0, 1, 1,
-0.6132128, 0.9394445, -1.115266, 1, 1, 1, 1, 1,
-0.610405, -1.931718, -2.568656, 1, 1, 1, 1, 1,
-0.6066068, -2.246055, -1.764419, 1, 1, 1, 1, 1,
-0.6059476, -0.653663, -1.327756, 1, 1, 1, 1, 1,
-0.6036972, 0.3966345, 1.041198, 1, 1, 1, 1, 1,
-0.6032301, 2.469774, 0.06608142, 1, 1, 1, 1, 1,
-0.594852, -0.7498089, -3.163695, 1, 1, 1, 1, 1,
-0.5936027, -1.525217, -2.603032, 1, 1, 1, 1, 1,
-0.5929666, 1.390527, -0.5851722, 1, 1, 1, 1, 1,
-0.5916606, 1.324457, 0.4203431, 1, 1, 1, 1, 1,
-0.590556, -1.218964, -1.440965, 1, 1, 1, 1, 1,
-0.5901104, 0.3638063, -1.166676, 1, 1, 1, 1, 1,
-0.5853345, -0.7332489, -2.93314, 1, 1, 1, 1, 1,
-0.5811438, -0.748612, -0.479222, 1, 1, 1, 1, 1,
-0.5808476, 1.147333, -1.264348, 1, 1, 1, 1, 1,
-0.5719091, 1.429648, -0.8445546, 0, 0, 1, 1, 1,
-0.5709115, 1.144538, -2.206845, 1, 0, 0, 1, 1,
-0.5648044, 1.061618, 0.7706172, 1, 0, 0, 1, 1,
-0.5630993, 0.4367596, -0.5270416, 1, 0, 0, 1, 1,
-0.5614713, 0.6045445, -2.05419, 1, 0, 0, 1, 1,
-0.5600347, -1.297665, -4.167794, 1, 0, 0, 1, 1,
-0.5587388, -0.4749325, -1.061257, 0, 0, 0, 1, 1,
-0.5579903, 0.629611, -0.2796544, 0, 0, 0, 1, 1,
-0.5543702, -0.06269678, -0.8508182, 0, 0, 0, 1, 1,
-0.5517984, -0.3761745, -1.656568, 0, 0, 0, 1, 1,
-0.5493794, 0.2479775, -1.781707, 0, 0, 0, 1, 1,
-0.5487523, -0.3536162, -2.808659, 0, 0, 0, 1, 1,
-0.5483273, -1.24163, -1.977542, 0, 0, 0, 1, 1,
-0.5467767, -0.6780201, -4.030087, 1, 1, 1, 1, 1,
-0.5446088, 0.4288217, 1.434452, 1, 1, 1, 1, 1,
-0.5445101, -0.221407, -1.069221, 1, 1, 1, 1, 1,
-0.5411261, 0.8712562, 0.9044745, 1, 1, 1, 1, 1,
-0.5406639, -0.4604412, -1.919435, 1, 1, 1, 1, 1,
-0.5369505, -0.2009811, -0.6735997, 1, 1, 1, 1, 1,
-0.5347016, 1.369034, -1.486706, 1, 1, 1, 1, 1,
-0.5327805, -1.081458, -0.7388117, 1, 1, 1, 1, 1,
-0.5315639, 0.9552553, -1.50033, 1, 1, 1, 1, 1,
-0.5314277, 0.6965166, 0.8153177, 1, 1, 1, 1, 1,
-0.5204684, 0.5855691, -2.347093, 1, 1, 1, 1, 1,
-0.5164631, 0.5241541, -0.09879477, 1, 1, 1, 1, 1,
-0.5158914, -0.6897573, -1.491648, 1, 1, 1, 1, 1,
-0.5150026, 0.4786595, -0.691504, 1, 1, 1, 1, 1,
-0.5148611, 0.9750454, -1.872052, 1, 1, 1, 1, 1,
-0.5115708, -0.00353767, -1.650301, 0, 0, 1, 1, 1,
-0.5059142, 0.5433169, 0.2386627, 1, 0, 0, 1, 1,
-0.505026, -0.2218157, -1.588017, 1, 0, 0, 1, 1,
-0.5004135, -0.1483763, -0.9558551, 1, 0, 0, 1, 1,
-0.499072, 2.149441, -0.6497617, 1, 0, 0, 1, 1,
-0.4975877, 1.478761, 0.8139769, 1, 0, 0, 1, 1,
-0.4962064, -0.1176102, -1.304465, 0, 0, 0, 1, 1,
-0.4906964, -1.855166, -2.635316, 0, 0, 0, 1, 1,
-0.4855044, 0.7486478, -1.036378, 0, 0, 0, 1, 1,
-0.484243, 2.530932, -0.5549558, 0, 0, 0, 1, 1,
-0.4833893, 0.512607, -2.131742, 0, 0, 0, 1, 1,
-0.4797896, -0.7196577, -2.647873, 0, 0, 0, 1, 1,
-0.4760191, 2.834345, 0.3920149, 0, 0, 0, 1, 1,
-0.4719966, -0.3436657, -2.395997, 1, 1, 1, 1, 1,
-0.4683883, -0.09585852, -2.827765, 1, 1, 1, 1, 1,
-0.4682577, 1.247084, 0.4793479, 1, 1, 1, 1, 1,
-0.4675859, -1.528854, -2.820233, 1, 1, 1, 1, 1,
-0.4569957, -0.1190902, -1.50949, 1, 1, 1, 1, 1,
-0.4565182, 0.7639952, -1.490814, 1, 1, 1, 1, 1,
-0.4502766, -0.5124226, -0.9576803, 1, 1, 1, 1, 1,
-0.448103, 0.2238427, -2.911061, 1, 1, 1, 1, 1,
-0.448086, -0.475865, -2.528561, 1, 1, 1, 1, 1,
-0.4437729, -1.278631, -2.325866, 1, 1, 1, 1, 1,
-0.4404944, 0.9418305, -0.9739408, 1, 1, 1, 1, 1,
-0.4401583, -0.5455708, -1.450156, 1, 1, 1, 1, 1,
-0.4383821, 0.719894, 0.1743484, 1, 1, 1, 1, 1,
-0.4381008, 2.582047, 0.8209324, 1, 1, 1, 1, 1,
-0.4350782, 1.10674, -0.554344, 1, 1, 1, 1, 1,
-0.430639, 0.5063198, -0.843025, 0, 0, 1, 1, 1,
-0.4266855, 0.6088462, 1.187022, 1, 0, 0, 1, 1,
-0.4206024, 0.932126, -2.166343, 1, 0, 0, 1, 1,
-0.4157692, 2.55216, -1.393298, 1, 0, 0, 1, 1,
-0.414307, 0.2143777, -1.767392, 1, 0, 0, 1, 1,
-0.4140413, 0.5558662, -1.448211, 1, 0, 0, 1, 1,
-0.4022847, -0.542731, -1.760043, 0, 0, 0, 1, 1,
-0.3937393, -0.4139805, -4.552033, 0, 0, 0, 1, 1,
-0.3933457, -1.473801, -2.676288, 0, 0, 0, 1, 1,
-0.3929122, 1.705796, 0.6536425, 0, 0, 0, 1, 1,
-0.3893637, -0.2313342, -2.968123, 0, 0, 0, 1, 1,
-0.3876275, 0.5986422, -0.8486894, 0, 0, 0, 1, 1,
-0.3857605, -1.57628, -2.823487, 0, 0, 0, 1, 1,
-0.3854331, 1.83217, 0.2207989, 1, 1, 1, 1, 1,
-0.381559, -2.169548, -2.465838, 1, 1, 1, 1, 1,
-0.3705977, 0.6911064, 0.177828, 1, 1, 1, 1, 1,
-0.3690579, -0.8473659, -1.287926, 1, 1, 1, 1, 1,
-0.3644735, -0.4322954, -2.920191, 1, 1, 1, 1, 1,
-0.3622789, 1.619645, 1.207726, 1, 1, 1, 1, 1,
-0.3612739, -0.4860247, -2.968405, 1, 1, 1, 1, 1,
-0.3610476, -0.2679034, -0.9722901, 1, 1, 1, 1, 1,
-0.3608788, -1.389991, -3.192624, 1, 1, 1, 1, 1,
-0.352298, -0.7216935, -0.8594176, 1, 1, 1, 1, 1,
-0.350076, -0.4058071, -1.9169, 1, 1, 1, 1, 1,
-0.3493262, -1.667021, -2.677495, 1, 1, 1, 1, 1,
-0.3437068, 0.1011419, -1.084769, 1, 1, 1, 1, 1,
-0.342998, 0.8652359, -1.221881, 1, 1, 1, 1, 1,
-0.3423679, 0.5160728, -0.472445, 1, 1, 1, 1, 1,
-0.3414492, -1.010236, -2.384056, 0, 0, 1, 1, 1,
-0.3337537, -0.3514591, -2.724294, 1, 0, 0, 1, 1,
-0.3318314, 0.5838715, -0.3167525, 1, 0, 0, 1, 1,
-0.3313275, -1.271401, -4.394021, 1, 0, 0, 1, 1,
-0.3305666, 0.7329504, -1.703599, 1, 0, 0, 1, 1,
-0.3297177, -1.959783, -3.010965, 1, 0, 0, 1, 1,
-0.3249729, -0.2116639, -2.066046, 0, 0, 0, 1, 1,
-0.3222435, 1.324069, -0.4172888, 0, 0, 0, 1, 1,
-0.3198619, -1.437526, -2.387387, 0, 0, 0, 1, 1,
-0.319292, -0.9028029, -2.249407, 0, 0, 0, 1, 1,
-0.3181195, 0.5558405, 0.1641801, 0, 0, 0, 1, 1,
-0.3174989, 0.980316, -1.822179, 0, 0, 0, 1, 1,
-0.3169173, -0.3213947, -2.527093, 0, 0, 0, 1, 1,
-0.3163801, -0.6069683, -3.448456, 1, 1, 1, 1, 1,
-0.3159505, 0.875467, 0.347734, 1, 1, 1, 1, 1,
-0.3142728, -1.02653, -2.829088, 1, 1, 1, 1, 1,
-0.3134041, -0.6463965, -3.716132, 1, 1, 1, 1, 1,
-0.3080019, 0.5881937, 0.3827244, 1, 1, 1, 1, 1,
-0.3072087, 0.574876, -1.252811, 1, 1, 1, 1, 1,
-0.3036971, 0.6379001, -1.348909, 1, 1, 1, 1, 1,
-0.2978224, -1.172831, -4.608908, 1, 1, 1, 1, 1,
-0.2933981, 0.6380748, -2.212538, 1, 1, 1, 1, 1,
-0.2907821, 1.383207, -1.072903, 1, 1, 1, 1, 1,
-0.2899565, -1.222414, -3.691538, 1, 1, 1, 1, 1,
-0.2890868, -1.601871, -2.961894, 1, 1, 1, 1, 1,
-0.2825547, 1.624824, 0.5086544, 1, 1, 1, 1, 1,
-0.2810299, -1.053013, -2.840027, 1, 1, 1, 1, 1,
-0.2764481, -1.516329, -2.271481, 1, 1, 1, 1, 1,
-0.2733604, 0.7971498, 0.1523283, 0, 0, 1, 1, 1,
-0.2728972, -1.671325, -5.229923, 1, 0, 0, 1, 1,
-0.2692459, 1.804101, 2.063682, 1, 0, 0, 1, 1,
-0.2692075, 0.4942531, -2.135906, 1, 0, 0, 1, 1,
-0.2690133, 1.588368, -1.39373, 1, 0, 0, 1, 1,
-0.2671176, -2.763104, -2.032162, 1, 0, 0, 1, 1,
-0.2630925, -0.5552268, -2.915228, 0, 0, 0, 1, 1,
-0.2574148, -0.2065068, -1.072615, 0, 0, 0, 1, 1,
-0.2558139, -1.854973, -4.734633, 0, 0, 0, 1, 1,
-0.2477584, -1.518887, -4.834319, 0, 0, 0, 1, 1,
-0.2430201, 1.849305, -0.3225895, 0, 0, 0, 1, 1,
-0.2423594, -0.1805089, -1.721076, 0, 0, 0, 1, 1,
-0.2338409, -0.6309195, -2.8769, 0, 0, 0, 1, 1,
-0.2315497, 0.2109732, 0.4245715, 1, 1, 1, 1, 1,
-0.2297675, -2.24802, -1.697613, 1, 1, 1, 1, 1,
-0.2278754, -0.5938325, -4.781022, 1, 1, 1, 1, 1,
-0.2233415, -1.260448, -1.303212, 1, 1, 1, 1, 1,
-0.2233011, 0.05463672, -1.005298, 1, 1, 1, 1, 1,
-0.2179899, 1.82987, 1.039196, 1, 1, 1, 1, 1,
-0.217562, -0.4563662, -1.923316, 1, 1, 1, 1, 1,
-0.2146634, -0.9011213, -2.130683, 1, 1, 1, 1, 1,
-0.2083855, 0.4982052, 0.5696477, 1, 1, 1, 1, 1,
-0.2069893, 0.04551184, 1.04849, 1, 1, 1, 1, 1,
-0.2069048, -2.136124, -3.044435, 1, 1, 1, 1, 1,
-0.1983375, -1.980984, -3.294361, 1, 1, 1, 1, 1,
-0.195622, 0.6868435, 0.9711993, 1, 1, 1, 1, 1,
-0.1867709, 0.2034886, -1.127657, 1, 1, 1, 1, 1,
-0.1858132, -1.782336, -2.491004, 1, 1, 1, 1, 1,
-0.1834565, 0.7322441, -1.750286, 0, 0, 1, 1, 1,
-0.1817239, -0.6239254, -3.820781, 1, 0, 0, 1, 1,
-0.1801395, 0.8278314, -0.5759357, 1, 0, 0, 1, 1,
-0.176999, 1.24638, -1.341353, 1, 0, 0, 1, 1,
-0.1702527, -1.865813, -1.735393, 1, 0, 0, 1, 1,
-0.1673477, 0.4400502, 1.167895, 1, 0, 0, 1, 1,
-0.1672622, 0.1330367, -0.1537977, 0, 0, 0, 1, 1,
-0.1651281, 2.567227, -0.9190021, 0, 0, 0, 1, 1,
-0.1630248, 0.7549784, -1.019493, 0, 0, 0, 1, 1,
-0.1522062, 0.6268085, -0.6911402, 0, 0, 0, 1, 1,
-0.1519676, -0.8833976, -1.85734, 0, 0, 0, 1, 1,
-0.1514913, -1.295169, -3.325687, 0, 0, 0, 1, 1,
-0.1490799, -1.222759, -3.464048, 0, 0, 0, 1, 1,
-0.1477137, -0.06542492, -3.078792, 1, 1, 1, 1, 1,
-0.1475344, -0.5684736, 0.01821981, 1, 1, 1, 1, 1,
-0.1421545, -0.3193391, -3.240893, 1, 1, 1, 1, 1,
-0.1416906, 0.3836187, 0.4605575, 1, 1, 1, 1, 1,
-0.1413343, -3.12514, -4.041068, 1, 1, 1, 1, 1,
-0.1347652, -0.6300099, -3.906433, 1, 1, 1, 1, 1,
-0.1272459, 0.05128933, -1.248997, 1, 1, 1, 1, 1,
-0.1262372, 1.078498, 0.2272889, 1, 1, 1, 1, 1,
-0.1256586, 0.6606846, 0.4220031, 1, 1, 1, 1, 1,
-0.1240019, 1.052373, 0.093225, 1, 1, 1, 1, 1,
-0.1129583, -0.4651273, -3.996136, 1, 1, 1, 1, 1,
-0.1126478, 1.10028, -0.1995111, 1, 1, 1, 1, 1,
-0.111561, -0.5237513, -3.411767, 1, 1, 1, 1, 1,
-0.110365, -0.9361733, -2.563642, 1, 1, 1, 1, 1,
-0.1103264, 0.2474494, -2.272729, 1, 1, 1, 1, 1,
-0.1039095, -0.07815554, -1.371014, 0, 0, 1, 1, 1,
-0.1016411, -0.8882756, -1.179523, 1, 0, 0, 1, 1,
-0.1016266, 0.0955454, -2.445997, 1, 0, 0, 1, 1,
-0.09920786, -0.1262269, -2.029602, 1, 0, 0, 1, 1,
-0.09489039, 0.2130337, 0.05646987, 1, 0, 0, 1, 1,
-0.09287839, 0.4321817, 1.146249, 1, 0, 0, 1, 1,
-0.08947589, 1.204232, -0.8788056, 0, 0, 0, 1, 1,
-0.08841988, -1.349096, -3.847536, 0, 0, 0, 1, 1,
-0.08179333, 0.5405011, 0.08679403, 0, 0, 0, 1, 1,
-0.08005923, -0.4730013, -1.39084, 0, 0, 0, 1, 1,
-0.07869331, -0.6543666, -1.194924, 0, 0, 0, 1, 1,
-0.07545464, -0.3302915, -1.965429, 0, 0, 0, 1, 1,
-0.07493843, -1.005173, -2.354722, 0, 0, 0, 1, 1,
-0.07421623, 0.4822459, 0.4379221, 1, 1, 1, 1, 1,
-0.07043034, -1.423442, -4.740402, 1, 1, 1, 1, 1,
-0.06238634, -0.8490847, -2.939587, 1, 1, 1, 1, 1,
-0.0612161, -0.5793337, -2.436022, 1, 1, 1, 1, 1,
-0.05821063, -0.4528684, -2.127908, 1, 1, 1, 1, 1,
-0.05694357, 0.5429811, 1.066592, 1, 1, 1, 1, 1,
-0.05392998, -1.137966, -4.099447, 1, 1, 1, 1, 1,
-0.05075066, 0.966213, 1.200325, 1, 1, 1, 1, 1,
-0.04995737, 0.09910131, -0.6892557, 1, 1, 1, 1, 1,
-0.04434966, -1.433141, -2.458671, 1, 1, 1, 1, 1,
-0.03615803, -2.842862, -5.608004, 1, 1, 1, 1, 1,
-0.03393596, 0.1215178, -0.7164338, 1, 1, 1, 1, 1,
-0.03077465, 0.02977926, -0.361278, 1, 1, 1, 1, 1,
-0.03017297, 0.1600578, -2.143466, 1, 1, 1, 1, 1,
-0.02868493, 1.042747, -1.394688, 1, 1, 1, 1, 1,
-0.02104742, 0.4740269, 0.5620615, 0, 0, 1, 1, 1,
-0.01902772, 0.8699911, 0.3760731, 1, 0, 0, 1, 1,
-0.005805308, 0.5181007, 0.7181431, 1, 0, 0, 1, 1,
-0.001518046, -0.9238466, -2.88923, 1, 0, 0, 1, 1,
0.001604896, 0.08189145, 0.06212987, 1, 0, 0, 1, 1,
0.004251467, 1.70544, -1.729621, 1, 0, 0, 1, 1,
0.005053239, -0.8600887, 1.355277, 0, 0, 0, 1, 1,
0.006517243, -0.1751433, 4.536272, 0, 0, 0, 1, 1,
0.007822269, -1.730795, 1.944345, 0, 0, 0, 1, 1,
0.008370428, -0.36914, 4.288731, 0, 0, 0, 1, 1,
0.01555901, -0.3578807, 3.65437, 0, 0, 0, 1, 1,
0.01634234, -0.02733741, 3.619212, 0, 0, 0, 1, 1,
0.01836234, -0.9763697, 3.709158, 0, 0, 0, 1, 1,
0.02607742, -0.09321111, 0.7261953, 1, 1, 1, 1, 1,
0.03059611, -0.9580938, 2.612111, 1, 1, 1, 1, 1,
0.03095493, -0.1186693, 1.82734, 1, 1, 1, 1, 1,
0.03156938, 0.639443, -1.135858, 1, 1, 1, 1, 1,
0.03261084, 0.481124, 0.8184544, 1, 1, 1, 1, 1,
0.03427971, 0.8230014, 0.3183657, 1, 1, 1, 1, 1,
0.03578024, 0.06683994, 0.7378313, 1, 1, 1, 1, 1,
0.03910289, -1.390715, 2.609615, 1, 1, 1, 1, 1,
0.04593655, 0.4327729, -1.237219, 1, 1, 1, 1, 1,
0.04729589, -0.07223263, 3.25985, 1, 1, 1, 1, 1,
0.04831959, 0.07943907, 0.2139528, 1, 1, 1, 1, 1,
0.05346912, -0.4507462, 3.101671, 1, 1, 1, 1, 1,
0.05484137, 0.4364725, 0.5362679, 1, 1, 1, 1, 1,
0.05548126, -0.5408204, 3.700062, 1, 1, 1, 1, 1,
0.05636912, -0.9218482, 1.70756, 1, 1, 1, 1, 1,
0.0609486, 0.3425784, -0.01608733, 0, 0, 1, 1, 1,
0.06310933, 0.8884857, -0.7256196, 1, 0, 0, 1, 1,
0.06382755, 0.8818244, 0.215066, 1, 0, 0, 1, 1,
0.06487216, 1.125877, -1.832713, 1, 0, 0, 1, 1,
0.07031985, -1.302888, 3.220629, 1, 0, 0, 1, 1,
0.07308044, -0.4840646, 2.503131, 1, 0, 0, 1, 1,
0.0738738, 0.6371143, 0.06083491, 0, 0, 0, 1, 1,
0.0758425, -0.8193398, 3.921655, 0, 0, 0, 1, 1,
0.07817677, -0.2859214, 1.973228, 0, 0, 0, 1, 1,
0.07838346, 1.122537, -1.209181, 0, 0, 0, 1, 1,
0.08319161, -0.1888079, 1.034147, 0, 0, 0, 1, 1,
0.08604356, 0.64102, 0.353541, 0, 0, 0, 1, 1,
0.08756876, 0.7859548, -0.07165787, 0, 0, 0, 1, 1,
0.08907208, 0.5528272, -0.8225389, 1, 1, 1, 1, 1,
0.09054215, 0.05022956, 0.9487043, 1, 1, 1, 1, 1,
0.09547674, -1.176958, 3.694186, 1, 1, 1, 1, 1,
0.1029594, 1.120619, -0.5116224, 1, 1, 1, 1, 1,
0.103219, -1.304468, 4.367121, 1, 1, 1, 1, 1,
0.1033454, -0.3063597, 2.697789, 1, 1, 1, 1, 1,
0.104149, 0.2162036, 1.112782, 1, 1, 1, 1, 1,
0.1049365, -0.8490893, 1.669683, 1, 1, 1, 1, 1,
0.105714, 1.108278, -1.467839, 1, 1, 1, 1, 1,
0.1057499, -1.7714, 3.369872, 1, 1, 1, 1, 1,
0.1145743, -2.114427, 2.494224, 1, 1, 1, 1, 1,
0.1155546, -0.5041099, 3.164715, 1, 1, 1, 1, 1,
0.1169044, -0.8429542, 2.951485, 1, 1, 1, 1, 1,
0.1171489, 0.8843501, -2.028615, 1, 1, 1, 1, 1,
0.121649, -1.358183, 2.420777, 1, 1, 1, 1, 1,
0.1231524, 0.9956121, -0.0759765, 0, 0, 1, 1, 1,
0.1240773, -1.955657, 2.377373, 1, 0, 0, 1, 1,
0.1273495, 0.418556, 1.318679, 1, 0, 0, 1, 1,
0.1332547, -0.6525997, 1.899065, 1, 0, 0, 1, 1,
0.1338994, -1.392474, 2.862177, 1, 0, 0, 1, 1,
0.1352788, -1.024471, 3.296744, 1, 0, 0, 1, 1,
0.1392386, -0.6205912, 1.741382, 0, 0, 0, 1, 1,
0.1401062, -1.520564, 3.786999, 0, 0, 0, 1, 1,
0.1451312, -0.3135101, 2.508028, 0, 0, 0, 1, 1,
0.1452468, -0.02035089, 1.750768, 0, 0, 0, 1, 1,
0.1463768, 0.1793504, 0.5815318, 0, 0, 0, 1, 1,
0.1518012, -1.561029, 0.8257945, 0, 0, 0, 1, 1,
0.1546785, -0.5233219, 2.166431, 0, 0, 0, 1, 1,
0.1599101, 1.67109, -0.2990234, 1, 1, 1, 1, 1,
0.1613968, -0.6155326, 1.703213, 1, 1, 1, 1, 1,
0.1623697, 0.1723022, 0.1085758, 1, 1, 1, 1, 1,
0.1624699, -0.07604028, 2.181835, 1, 1, 1, 1, 1,
0.1631497, -1.540972, 3.879535, 1, 1, 1, 1, 1,
0.1722807, -1.150871, 4.286257, 1, 1, 1, 1, 1,
0.1727681, 2.517177, 1.568313, 1, 1, 1, 1, 1,
0.175511, -0.1898586, 1.156101, 1, 1, 1, 1, 1,
0.1770573, 1.390124, -0.2905553, 1, 1, 1, 1, 1,
0.1781493, 2.113477, 1.454876, 1, 1, 1, 1, 1,
0.1824121, -0.8414522, 4.195593, 1, 1, 1, 1, 1,
0.1911482, -1.175545, 2.871955, 1, 1, 1, 1, 1,
0.2016887, 0.5506959, 1.48759, 1, 1, 1, 1, 1,
0.2051206, 0.9661029, 1.680942, 1, 1, 1, 1, 1,
0.2104761, 0.5495013, -0.1413882, 1, 1, 1, 1, 1,
0.2189282, 1.18158, -1.175912, 0, 0, 1, 1, 1,
0.2230611, 1.168846, 1.079647, 1, 0, 0, 1, 1,
0.2434294, -0.4260067, 4.149912, 1, 0, 0, 1, 1,
0.2500823, -2.025084, 1.117631, 1, 0, 0, 1, 1,
0.2535848, 1.709486, 0.5670615, 1, 0, 0, 1, 1,
0.2548898, -1.654438, 3.47745, 1, 0, 0, 1, 1,
0.2581994, 0.008004766, 0.5798532, 0, 0, 0, 1, 1,
0.2638644, 0.1510084, 0.1433894, 0, 0, 0, 1, 1,
0.2646167, 0.1679093, 0.7505043, 0, 0, 0, 1, 1,
0.2681739, -0.2963976, -0.7769645, 0, 0, 0, 1, 1,
0.2752009, -0.9901473, 2.540673, 0, 0, 0, 1, 1,
0.2762255, -1.759366, 3.713517, 0, 0, 0, 1, 1,
0.2798773, -1.419182, 1.468781, 0, 0, 0, 1, 1,
0.2801424, 0.295284, 1.175639, 1, 1, 1, 1, 1,
0.2806731, 1.30713, 0.7870624, 1, 1, 1, 1, 1,
0.2820233, 0.05044758, 1.232203, 1, 1, 1, 1, 1,
0.2903746, 0.2639169, 1.614741, 1, 1, 1, 1, 1,
0.2928579, -0.9610607, 1.302057, 1, 1, 1, 1, 1,
0.2936556, 1.573306, -0.05020981, 1, 1, 1, 1, 1,
0.2940349, 0.9375907, 0.6011745, 1, 1, 1, 1, 1,
0.2959591, 1.042305, 1.661301, 1, 1, 1, 1, 1,
0.3004889, -0.3413134, 3.207816, 1, 1, 1, 1, 1,
0.3113633, 1.13667, -0.1071655, 1, 1, 1, 1, 1,
0.3138165, -0.9711035, 4.357682, 1, 1, 1, 1, 1,
0.315937, -0.9455036, 2.116036, 1, 1, 1, 1, 1,
0.3226821, -0.2126174, 1.938179, 1, 1, 1, 1, 1,
0.3246676, 1.131984, 0.9682013, 1, 1, 1, 1, 1,
0.3255659, -0.8298671, 2.060745, 1, 1, 1, 1, 1,
0.3256909, 0.8614433, 0.6130627, 0, 0, 1, 1, 1,
0.3277247, -0.8734212, 6.625617, 1, 0, 0, 1, 1,
0.32859, -0.1582064, 3.209054, 1, 0, 0, 1, 1,
0.3302934, -2.336043, 2.775013, 1, 0, 0, 1, 1,
0.3311831, 0.1127004, -0.4975818, 1, 0, 0, 1, 1,
0.3326105, -2.070659, 1.35956, 1, 0, 0, 1, 1,
0.3332433, -0.6073053, 3.659425, 0, 0, 0, 1, 1,
0.3352859, 1.233849, 0.9808942, 0, 0, 0, 1, 1,
0.3411615, -0.8694125, 2.773819, 0, 0, 0, 1, 1,
0.3461951, 0.1531354, 0.1494461, 0, 0, 0, 1, 1,
0.3500169, -2.085341, 3.998398, 0, 0, 0, 1, 1,
0.3507187, -1.059873, 0.5521207, 0, 0, 0, 1, 1,
0.3550902, 0.6582036, 1.821166, 0, 0, 0, 1, 1,
0.3577659, -0.03219876, 1.467729, 1, 1, 1, 1, 1,
0.3588623, 0.6360918, -1.462225, 1, 1, 1, 1, 1,
0.3630234, -0.003043786, 3.428745, 1, 1, 1, 1, 1,
0.365998, -0.2516377, 2.496607, 1, 1, 1, 1, 1,
0.3669063, -0.1519972, 2.217481, 1, 1, 1, 1, 1,
0.3676033, -1.300459, 1.50773, 1, 1, 1, 1, 1,
0.3678795, -2.207806, 2.989887, 1, 1, 1, 1, 1,
0.3707331, 0.2307718, 1.339102, 1, 1, 1, 1, 1,
0.3714333, 2.005712, -0.01214364, 1, 1, 1, 1, 1,
0.3776214, 1.56059, 1.521845, 1, 1, 1, 1, 1,
0.3783463, 0.7961901, -0.2582687, 1, 1, 1, 1, 1,
0.3786543, -0.7517899, 1.259823, 1, 1, 1, 1, 1,
0.3798715, -1.046867, 2.477483, 1, 1, 1, 1, 1,
0.3800871, -0.579509, 2.335892, 1, 1, 1, 1, 1,
0.3811791, 0.4626027, 0.3546972, 1, 1, 1, 1, 1,
0.3821392, 0.8493657, 0.2546589, 0, 0, 1, 1, 1,
0.3844137, -0.6301741, 1.422355, 1, 0, 0, 1, 1,
0.3868788, -0.05829914, 4.127569, 1, 0, 0, 1, 1,
0.387868, -0.6547443, 2.732605, 1, 0, 0, 1, 1,
0.3907908, -0.4591219, 0.4130812, 1, 0, 0, 1, 1,
0.3920247, 1.956799, -1.120544, 1, 0, 0, 1, 1,
0.3927213, 0.7458352, 0.5202727, 0, 0, 0, 1, 1,
0.3963364, -0.8539836, 3.320087, 0, 0, 0, 1, 1,
0.3969616, -0.2278436, 0.7106711, 0, 0, 0, 1, 1,
0.3980572, -1.197291, 1.625864, 0, 0, 0, 1, 1,
0.4008935, 1.418315, -0.07938828, 0, 0, 0, 1, 1,
0.4021244, 1.98241, 0.7472961, 0, 0, 0, 1, 1,
0.4057398, 0.1360077, -0.422512, 0, 0, 0, 1, 1,
0.4199335, -0.2152029, 2.785558, 1, 1, 1, 1, 1,
0.4221222, -0.9531348, 0.9734105, 1, 1, 1, 1, 1,
0.4363066, 0.5121036, -0.683872, 1, 1, 1, 1, 1,
0.4382609, 0.03312346, 0.5647043, 1, 1, 1, 1, 1,
0.4428022, 0.5331166, 0.7360623, 1, 1, 1, 1, 1,
0.4431691, -0.819306, 1.028277, 1, 1, 1, 1, 1,
0.4439861, -1.458318, 3.33372, 1, 1, 1, 1, 1,
0.4458613, 0.4906767, 0.1301838, 1, 1, 1, 1, 1,
0.4476133, 2.184087, -1.228403, 1, 1, 1, 1, 1,
0.449516, 1.11871, 0.336116, 1, 1, 1, 1, 1,
0.4500879, -1.701713, 3.536553, 1, 1, 1, 1, 1,
0.4508779, -0.2350507, 2.363839, 1, 1, 1, 1, 1,
0.4527642, -0.005548771, 1.113716, 1, 1, 1, 1, 1,
0.4597819, -1.482417, 2.909341, 1, 1, 1, 1, 1,
0.4646074, -0.1055273, 1.158692, 1, 1, 1, 1, 1,
0.4674091, -1.467041, 1.270251, 0, 0, 1, 1, 1,
0.4679639, -0.4638788, 3.824411, 1, 0, 0, 1, 1,
0.4681866, -0.1436681, 2.378929, 1, 0, 0, 1, 1,
0.471543, -0.5560597, 2.137616, 1, 0, 0, 1, 1,
0.4732034, -0.01337034, 1.325708, 1, 0, 0, 1, 1,
0.4787437, 0.01308036, 2.322457, 1, 0, 0, 1, 1,
0.4845773, -1.343045, 3.614327, 0, 0, 0, 1, 1,
0.491505, -1.128779, 1.419843, 0, 0, 0, 1, 1,
0.4919163, 1.485762, -0.04742372, 0, 0, 0, 1, 1,
0.4942779, 0.8439608, 0.7871606, 0, 0, 0, 1, 1,
0.4974025, -1.671309, 4.644318, 0, 0, 0, 1, 1,
0.4978097, -2.114996, 4.57372, 0, 0, 0, 1, 1,
0.4996956, -0.568871, 2.549525, 0, 0, 0, 1, 1,
0.501972, 0.992591, 1.653656, 1, 1, 1, 1, 1,
0.5036657, -1.957487, 2.044282, 1, 1, 1, 1, 1,
0.5040471, -0.8072119, 2.487096, 1, 1, 1, 1, 1,
0.5051581, -0.1237152, 1.702602, 1, 1, 1, 1, 1,
0.508763, 1.693671, -0.08462667, 1, 1, 1, 1, 1,
0.5089191, 1.537704, -0.8657451, 1, 1, 1, 1, 1,
0.5097888, 1.744998, 2.41226, 1, 1, 1, 1, 1,
0.5129398, -0.9902514, 1.782014, 1, 1, 1, 1, 1,
0.5139214, -0.2363598, 2.939035, 1, 1, 1, 1, 1,
0.5201947, 0.5003633, 0.1990079, 1, 1, 1, 1, 1,
0.5232495, 1.633114, 0.403911, 1, 1, 1, 1, 1,
0.5248629, 0.7536774, -0.2771777, 1, 1, 1, 1, 1,
0.5279198, 0.2379245, 2.011715, 1, 1, 1, 1, 1,
0.5309963, 1.041748, 0.2338842, 1, 1, 1, 1, 1,
0.5327383, 1.294608, 1.575157, 1, 1, 1, 1, 1,
0.5373333, -0.5106735, 1.331863, 0, 0, 1, 1, 1,
0.537403, 0.2024451, 1.456595, 1, 0, 0, 1, 1,
0.539073, 2.221417, 1.650343, 1, 0, 0, 1, 1,
0.5392253, 0.701807, 0.9372669, 1, 0, 0, 1, 1,
0.5409156, 1.458914, -0.2858505, 1, 0, 0, 1, 1,
0.5413058, -0.1986115, 2.074741, 1, 0, 0, 1, 1,
0.5454538, 0.3704918, -0.5666041, 0, 0, 0, 1, 1,
0.5458727, 0.1774612, -0.2165049, 0, 0, 0, 1, 1,
0.5487967, 0.9962964, 1.159882, 0, 0, 0, 1, 1,
0.5518345, -0.3754103, 1.219961, 0, 0, 0, 1, 1,
0.5552695, -0.2446652, 3.242983, 0, 0, 0, 1, 1,
0.5567958, 0.6352398, 1.405156, 0, 0, 0, 1, 1,
0.5568266, -0.6411624, 2.087339, 0, 0, 0, 1, 1,
0.5569449, -0.5846329, 2.703636, 1, 1, 1, 1, 1,
0.558414, -0.6871009, 2.379646, 1, 1, 1, 1, 1,
0.5597684, 0.1604386, 1.462907, 1, 1, 1, 1, 1,
0.562318, 0.5273653, 2.495442, 1, 1, 1, 1, 1,
0.5652222, 1.381521, -0.394586, 1, 1, 1, 1, 1,
0.5675356, -0.0571804, 1.396806, 1, 1, 1, 1, 1,
0.5685763, -0.7057514, 0.8017216, 1, 1, 1, 1, 1,
0.569556, -0.1470224, 1.410444, 1, 1, 1, 1, 1,
0.5709456, 0.798243, 0.1901995, 1, 1, 1, 1, 1,
0.5723599, -1.060876, 0.813443, 1, 1, 1, 1, 1,
0.5750168, 0.4457816, -0.5603524, 1, 1, 1, 1, 1,
0.5890712, -0.3828995, 2.544594, 1, 1, 1, 1, 1,
0.5891343, -0.9709512, 3.866613, 1, 1, 1, 1, 1,
0.5895687, -0.4954554, 3.272796, 1, 1, 1, 1, 1,
0.5943534, -0.454974, 2.03943, 1, 1, 1, 1, 1,
0.5947147, -1.260382, 2.975118, 0, 0, 1, 1, 1,
0.5997776, -1.004342, 2.508222, 1, 0, 0, 1, 1,
0.6014683, -0.5342879, 2.06413, 1, 0, 0, 1, 1,
0.6025473, -0.5062724, 2.407673, 1, 0, 0, 1, 1,
0.6066263, 0.687289, -0.2940256, 1, 0, 0, 1, 1,
0.6067131, -0.4478669, 2.829023, 1, 0, 0, 1, 1,
0.6091728, -0.3384973, 3.609998, 0, 0, 0, 1, 1,
0.612316, 2.21666, 1.154822, 0, 0, 0, 1, 1,
0.6125488, -1.46272, 3.330741, 0, 0, 0, 1, 1,
0.6127033, -0.7875476, 3.333297, 0, 0, 0, 1, 1,
0.6134273, -1.594034, 2.272808, 0, 0, 0, 1, 1,
0.6135122, -0.71999, 3.186186, 0, 0, 0, 1, 1,
0.6144223, 0.9693743, -0.05521808, 0, 0, 0, 1, 1,
0.6150536, 0.3560816, 0.9488158, 1, 1, 1, 1, 1,
0.6216311, -0.7709591, 2.255443, 1, 1, 1, 1, 1,
0.6238234, 0.3861255, 1.870214, 1, 1, 1, 1, 1,
0.6290557, 0.9821596, -0.4727929, 1, 1, 1, 1, 1,
0.6293467, -0.337351, 2.665734, 1, 1, 1, 1, 1,
0.6299608, 0.02272664, 1.339934, 1, 1, 1, 1, 1,
0.6343524, -0.9259115, 0.7398106, 1, 1, 1, 1, 1,
0.6408397, 1.423689, -0.4931135, 1, 1, 1, 1, 1,
0.6437972, 1.189453, -1.404432, 1, 1, 1, 1, 1,
0.6438732, -1.075594, 2.722984, 1, 1, 1, 1, 1,
0.6444075, -0.02942709, 0.03470324, 1, 1, 1, 1, 1,
0.64498, -0.8038813, 1.505165, 1, 1, 1, 1, 1,
0.6471802, 0.3958524, 0.6338442, 1, 1, 1, 1, 1,
0.6484131, -0.124472, 0.424866, 1, 1, 1, 1, 1,
0.6535141, -1.11008, 2.994168, 1, 1, 1, 1, 1,
0.6542443, -1.821421, 2.465536, 0, 0, 1, 1, 1,
0.6625819, 1.010043, 1.170641, 1, 0, 0, 1, 1,
0.6628976, -0.8714229, 3.634691, 1, 0, 0, 1, 1,
0.665351, 0.1800166, 0.6588173, 1, 0, 0, 1, 1,
0.6693444, -1.03152, 2.915713, 1, 0, 0, 1, 1,
0.6729367, 0.3104742, 1.143785, 1, 0, 0, 1, 1,
0.6733762, 1.051051, 1.502363, 0, 0, 0, 1, 1,
0.6742077, 0.4583951, 1.671661, 0, 0, 0, 1, 1,
0.6816608, -0.863525, 3.407103, 0, 0, 0, 1, 1,
0.6900988, -0.2020673, 3.354448, 0, 0, 0, 1, 1,
0.693145, -0.3368555, 1.661793, 0, 0, 0, 1, 1,
0.694886, -0.06287878, 2.081794, 0, 0, 0, 1, 1,
0.6949527, -1.052359, 4.239119, 0, 0, 0, 1, 1,
0.6956112, -0.3024308, 2.468102, 1, 1, 1, 1, 1,
0.6958547, -0.6758353, 3.003883, 1, 1, 1, 1, 1,
0.6963808, -0.4450398, 3.963316, 1, 1, 1, 1, 1,
0.7037144, -1.296304, 1.846647, 1, 1, 1, 1, 1,
0.7037364, -1.429293, 2.606218, 1, 1, 1, 1, 1,
0.70778, 0.6035567, 0.6570165, 1, 1, 1, 1, 1,
0.7080649, 0.3918844, 2.13833, 1, 1, 1, 1, 1,
0.7103788, 0.7700544, -0.2690303, 1, 1, 1, 1, 1,
0.7143337, -2.144604, 5.026104, 1, 1, 1, 1, 1,
0.7163777, -1.395458, 2.746593, 1, 1, 1, 1, 1,
0.7232016, 0.02835395, 2.782113, 1, 1, 1, 1, 1,
0.7251254, 0.09111489, 1.926078, 1, 1, 1, 1, 1,
0.7286124, 0.5787573, 0.5791594, 1, 1, 1, 1, 1,
0.7304962, -0.2551354, 3.288424, 1, 1, 1, 1, 1,
0.747674, -0.8019574, 0.4116489, 1, 1, 1, 1, 1,
0.7495543, 0.6300532, 0.7894214, 0, 0, 1, 1, 1,
0.7508389, 0.249493, 2.280022, 1, 0, 0, 1, 1,
0.7542658, -1.143665, 3.521217, 1, 0, 0, 1, 1,
0.7551013, 1.371213, -0.7502543, 1, 0, 0, 1, 1,
0.757135, -0.07927381, 1.317732, 1, 0, 0, 1, 1,
0.7628979, 0.3728833, 2.443502, 1, 0, 0, 1, 1,
0.7634328, -0.2362621, 2.221815, 0, 0, 0, 1, 1,
0.7682754, -0.06078288, 0.4221793, 0, 0, 0, 1, 1,
0.7703781, 0.1197845, 1.480199, 0, 0, 0, 1, 1,
0.7706594, 0.1664176, 0.8535251, 0, 0, 0, 1, 1,
0.7831197, -0.4525851, 2.737832, 0, 0, 0, 1, 1,
0.7899104, -0.511672, 3.034875, 0, 0, 0, 1, 1,
0.7923194, -0.7745459, 4.011324, 0, 0, 0, 1, 1,
0.7923335, 0.2466526, 0.920148, 1, 1, 1, 1, 1,
0.792864, 0.6719651, 0.5067848, 1, 1, 1, 1, 1,
0.7989551, 1.251436, 1.182019, 1, 1, 1, 1, 1,
0.8025694, -0.6730273, 2.663933, 1, 1, 1, 1, 1,
0.806221, -0.2738817, 2.977388, 1, 1, 1, 1, 1,
0.8094743, 1.302548, 2.204863, 1, 1, 1, 1, 1,
0.8164189, -0.7837552, 1.630561, 1, 1, 1, 1, 1,
0.8216478, -0.6750391, 3.171443, 1, 1, 1, 1, 1,
0.8253005, -0.9579305, 1.769512, 1, 1, 1, 1, 1,
0.8258694, 0.7596254, 1.086541, 1, 1, 1, 1, 1,
0.8343974, 2.329934, 1.805221, 1, 1, 1, 1, 1,
0.8441786, 0.6446425, 0.2460154, 1, 1, 1, 1, 1,
0.8461205, 1.184609, 1.028894, 1, 1, 1, 1, 1,
0.8478916, -0.6390267, 2.09015, 1, 1, 1, 1, 1,
0.8599648, 0.3189476, 1.667607, 1, 1, 1, 1, 1,
0.8611267, -0.9396251, 1.995913, 0, 0, 1, 1, 1,
0.8647847, 1.087672, 1.429921, 1, 0, 0, 1, 1,
0.866129, 0.2978384, 2.206539, 1, 0, 0, 1, 1,
0.8733057, -2.474506, 2.90403, 1, 0, 0, 1, 1,
0.8759485, 0.4488637, 2.169194, 1, 0, 0, 1, 1,
0.8778644, 0.5885572, 0.8131226, 1, 0, 0, 1, 1,
0.8837534, -0.9068621, 3.907083, 0, 0, 0, 1, 1,
0.8861086, -0.02666449, 1.215828, 0, 0, 0, 1, 1,
0.8869285, 0.3048555, 0.4525771, 0, 0, 0, 1, 1,
0.8898069, 0.911256, 1.529279, 0, 0, 0, 1, 1,
0.8900847, 0.2359159, 3.719279, 0, 0, 0, 1, 1,
0.8955687, -1.539452, 3.686905, 0, 0, 0, 1, 1,
0.8958031, 1.477633, 0.5878838, 0, 0, 0, 1, 1,
0.8988572, -1.581485, 3.314239, 1, 1, 1, 1, 1,
0.8996661, 1.733902, 0.6054847, 1, 1, 1, 1, 1,
0.899767, 0.994866, 1.267246, 1, 1, 1, 1, 1,
0.9045216, 0.2716821, 0.4937497, 1, 1, 1, 1, 1,
0.9058241, 0.8638746, -0.571752, 1, 1, 1, 1, 1,
0.9058691, -1.092651, 2.020966, 1, 1, 1, 1, 1,
0.9059487, 1.362067, 1.367069, 1, 1, 1, 1, 1,
0.914032, 1.188635, 1.439914, 1, 1, 1, 1, 1,
0.9150729, -1.738493, 2.842076, 1, 1, 1, 1, 1,
0.9156623, 0.6488593, 1.337493, 1, 1, 1, 1, 1,
0.9162626, 1.114936, 0.9038324, 1, 1, 1, 1, 1,
0.9222776, 0.9949111, -0.3751061, 1, 1, 1, 1, 1,
0.9274517, 0.5267247, -0.1209365, 1, 1, 1, 1, 1,
0.9284434, -0.3765768, 2.250488, 1, 1, 1, 1, 1,
0.9295511, -0.1425228, 1.244997, 1, 1, 1, 1, 1,
0.9299834, 0.6065902, 2.758055, 0, 0, 1, 1, 1,
0.9327409, -0.9929927, 2.597542, 1, 0, 0, 1, 1,
0.9340073, -1.365478, 2.079293, 1, 0, 0, 1, 1,
0.934502, -1.048373, 2.200028, 1, 0, 0, 1, 1,
0.9351813, -0.6661212, 0.9287739, 1, 0, 0, 1, 1,
0.9411529, -0.6512849, 1.090389, 1, 0, 0, 1, 1,
0.9414371, -1.165097, 3.178846, 0, 0, 0, 1, 1,
0.9472879, -1.312404, 2.359823, 0, 0, 0, 1, 1,
0.9488068, -0.1916762, 1.365554, 0, 0, 0, 1, 1,
0.956406, -0.1482478, 3.109439, 0, 0, 0, 1, 1,
0.9567134, -0.1963439, 0.9187035, 0, 0, 0, 1, 1,
0.9656065, 0.1245322, 1.05485, 0, 0, 0, 1, 1,
0.9681832, 0.7558291, 1.854081, 0, 0, 0, 1, 1,
0.9713979, -1.091569, 2.543757, 1, 1, 1, 1, 1,
0.9757799, -0.2374843, 1.150981, 1, 1, 1, 1, 1,
0.9762186, -1.125204, 3.229139, 1, 1, 1, 1, 1,
0.9867239, 0.595198, 1.824948, 1, 1, 1, 1, 1,
0.9916575, 0.1222485, 1.674109, 1, 1, 1, 1, 1,
0.992296, -0.2748632, 1.642883, 1, 1, 1, 1, 1,
0.9924113, -1.231172, 2.997144, 1, 1, 1, 1, 1,
0.9953554, 2.382738, 1.262061, 1, 1, 1, 1, 1,
0.9988599, 1.52588, -0.3879875, 1, 1, 1, 1, 1,
1.003856, -0.7750689, 0.5771957, 1, 1, 1, 1, 1,
1.006333, 2.222154, 1.317031, 1, 1, 1, 1, 1,
1.028976, -1.028981, 2.696047, 1, 1, 1, 1, 1,
1.029241, 0.7823058, 3.320858, 1, 1, 1, 1, 1,
1.031927, 1.654921, 2.23375, 1, 1, 1, 1, 1,
1.034798, 0.06306252, 2.924438, 1, 1, 1, 1, 1,
1.034819, -0.3627758, 1.4732, 0, 0, 1, 1, 1,
1.04169, -0.5621877, 1.352394, 1, 0, 0, 1, 1,
1.043958, 0.06175107, 1.279587, 1, 0, 0, 1, 1,
1.044427, 0.0696107, 3.291274, 1, 0, 0, 1, 1,
1.046471, 0.2836292, 1.668932, 1, 0, 0, 1, 1,
1.046787, -0.8721825, 1.870767, 1, 0, 0, 1, 1,
1.047954, -2.714283, 2.401589, 0, 0, 0, 1, 1,
1.049085, 0.722052, 2.705071, 0, 0, 0, 1, 1,
1.055237, 0.4851621, 1.192837, 0, 0, 0, 1, 1,
1.05887, 0.5501027, 2.107725, 0, 0, 0, 1, 1,
1.060886, -0.09574559, 0.7512571, 0, 0, 0, 1, 1,
1.061815, -1.423638, 1.571791, 0, 0, 0, 1, 1,
1.063504, -0.3571957, 3.127957, 0, 0, 0, 1, 1,
1.068766, 0.03167985, 1.639905, 1, 1, 1, 1, 1,
1.073913, -0.7121871, 3.441461, 1, 1, 1, 1, 1,
1.089686, -0.8255116, 3.942103, 1, 1, 1, 1, 1,
1.091922, -2.262774, 2.013595, 1, 1, 1, 1, 1,
1.093177, 0.1033399, 0.188029, 1, 1, 1, 1, 1,
1.093676, 0.5864552, 0.4990327, 1, 1, 1, 1, 1,
1.094942, 0.6436769, 0.4634146, 1, 1, 1, 1, 1,
1.102468, -0.4456105, 0.706629, 1, 1, 1, 1, 1,
1.109121, 0.4515289, 0.0627441, 1, 1, 1, 1, 1,
1.110824, 1.285552, 1.078924, 1, 1, 1, 1, 1,
1.117704, -0.6007557, 1.407451, 1, 1, 1, 1, 1,
1.140341, 0.8667023, 1.305098, 1, 1, 1, 1, 1,
1.143786, -0.3343416, 0.8864862, 1, 1, 1, 1, 1,
1.144257, -1.140383, 4.200702, 1, 1, 1, 1, 1,
1.153416, 1.138018, 1.572265, 1, 1, 1, 1, 1,
1.158093, -0.7459714, 3.961926, 0, 0, 1, 1, 1,
1.167842, 0.4060429, 1.481337, 1, 0, 0, 1, 1,
1.168121, 0.486596, 1.117995, 1, 0, 0, 1, 1,
1.168613, 0.1143104, 0.8314484, 1, 0, 0, 1, 1,
1.175692, -0.0856607, 1.660228, 1, 0, 0, 1, 1,
1.17839, 1.445494, 2.518956, 1, 0, 0, 1, 1,
1.183072, 0.3631331, 2.242997, 0, 0, 0, 1, 1,
1.184031, -0.7213296, 2.649646, 0, 0, 0, 1, 1,
1.186701, -0.8640379, 0.7623664, 0, 0, 0, 1, 1,
1.193747, 1.131843, 0.238681, 0, 0, 0, 1, 1,
1.193806, -1.24724, 2.158471, 0, 0, 0, 1, 1,
1.197571, -0.4887301, 2.148484, 0, 0, 0, 1, 1,
1.198746, 1.454561, 0.4568532, 0, 0, 0, 1, 1,
1.201035, 0.9662093, 0.09077647, 1, 1, 1, 1, 1,
1.203439, 1.834699, 0.3384218, 1, 1, 1, 1, 1,
1.20724, 1.182079, 0.8572801, 1, 1, 1, 1, 1,
1.21013, -0.4714054, 3.73455, 1, 1, 1, 1, 1,
1.210932, 0.06006568, 1.714677, 1, 1, 1, 1, 1,
1.213832, -0.3386778, 1.333367, 1, 1, 1, 1, 1,
1.221767, 0.5443372, 0.253305, 1, 1, 1, 1, 1,
1.223164, -0.1820564, 2.936689, 1, 1, 1, 1, 1,
1.22716, 0.6236918, -0.7447674, 1, 1, 1, 1, 1,
1.227434, -1.029564, 2.567935, 1, 1, 1, 1, 1,
1.230078, -0.8983534, 1.273174, 1, 1, 1, 1, 1,
1.243204, 1.348317, 0.9308943, 1, 1, 1, 1, 1,
1.247142, -0.3310638, 2.364635, 1, 1, 1, 1, 1,
1.256455, -2.018802, 3.061722, 1, 1, 1, 1, 1,
1.258335, 0.1627793, 0.8305773, 1, 1, 1, 1, 1,
1.26748, 0.4238244, 3.176032, 0, 0, 1, 1, 1,
1.272353, 1.07701, 0.4851796, 1, 0, 0, 1, 1,
1.279366, -0.19805, 1.528642, 1, 0, 0, 1, 1,
1.287056, 0.8114415, 0.9639879, 1, 0, 0, 1, 1,
1.290601, -1.622167, 2.145868, 1, 0, 0, 1, 1,
1.294171, -0.813142, 2.037462, 1, 0, 0, 1, 1,
1.297313, -0.7096407, 1.077503, 0, 0, 0, 1, 1,
1.31085, -0.1501634, 1.208557, 0, 0, 0, 1, 1,
1.315389, 0.06529807, 1.429749, 0, 0, 0, 1, 1,
1.323631, 0.7868945, 1.949929, 0, 0, 0, 1, 1,
1.323746, 0.7501708, 1.157426, 0, 0, 0, 1, 1,
1.325865, -0.3561327, 3.072244, 0, 0, 0, 1, 1,
1.336151, -0.5854483, 0.1207841, 0, 0, 0, 1, 1,
1.355769, -1.673037, 2.237469, 1, 1, 1, 1, 1,
1.362313, 2.328953, 1.407778, 1, 1, 1, 1, 1,
1.366416, -1.167384, 2.469496, 1, 1, 1, 1, 1,
1.369341, -0.994724, 1.339585, 1, 1, 1, 1, 1,
1.372983, -0.4205312, 2.493516, 1, 1, 1, 1, 1,
1.376595, 0.673407, 0.5140146, 1, 1, 1, 1, 1,
1.377453, -0.3175347, 2.92866, 1, 1, 1, 1, 1,
1.382083, -0.9818475, 2.27039, 1, 1, 1, 1, 1,
1.393674, 0.1385831, 1.647992, 1, 1, 1, 1, 1,
1.402822, 0.06731725, 2.255771, 1, 1, 1, 1, 1,
1.407501, -0.2309502, 3.675709, 1, 1, 1, 1, 1,
1.41188, -1.618479, 3.22207, 1, 1, 1, 1, 1,
1.411903, -0.09805378, 2.089061, 1, 1, 1, 1, 1,
1.419942, -0.2567298, 3.113286, 1, 1, 1, 1, 1,
1.422579, 0.1732482, 1.878665, 1, 1, 1, 1, 1,
1.434582, -0.347121, 2.672238, 0, 0, 1, 1, 1,
1.439078, 1.496613, 1.854254, 1, 0, 0, 1, 1,
1.445971, 1.69259, -0.5995242, 1, 0, 0, 1, 1,
1.448732, 0.09698176, 1.825119, 1, 0, 0, 1, 1,
1.463273, 2.254653, 1.423546, 1, 0, 0, 1, 1,
1.464498, 0.1125568, 3.941416, 1, 0, 0, 1, 1,
1.46665, 0.7922257, 1.712261, 0, 0, 0, 1, 1,
1.477784, 0.6829795, 1.021149, 0, 0, 0, 1, 1,
1.496804, 1.642364, -0.1096961, 0, 0, 0, 1, 1,
1.500401, -1.022401, 1.072307, 0, 0, 0, 1, 1,
1.501416, -0.926907, 0.828334, 0, 0, 0, 1, 1,
1.515637, -0.6454283, 0.7765796, 0, 0, 0, 1, 1,
1.516469, -0.2892059, 1.973942, 0, 0, 0, 1, 1,
1.520431, -0.7272277, 1.11954, 1, 1, 1, 1, 1,
1.544486, 0.4922107, 2.207999, 1, 1, 1, 1, 1,
1.548218, 0.3673751, 1.555076, 1, 1, 1, 1, 1,
1.565329, -1.143262, 0.5378407, 1, 1, 1, 1, 1,
1.578188, 1.350111, 2.26609, 1, 1, 1, 1, 1,
1.587601, -0.7877057, 1.658878, 1, 1, 1, 1, 1,
1.591416, -1.587025, 3.92907, 1, 1, 1, 1, 1,
1.598334, 1.034557, 0.8278258, 1, 1, 1, 1, 1,
1.607754, 0.7633055, -0.6745276, 1, 1, 1, 1, 1,
1.617378, -1.145642, 1.94081, 1, 1, 1, 1, 1,
1.628036, -1.696355, 0.8691536, 1, 1, 1, 1, 1,
1.630612, -1.366524, 1.872009, 1, 1, 1, 1, 1,
1.638141, -0.3477624, 1.649994, 1, 1, 1, 1, 1,
1.684892, -0.4526045, 3.414338, 1, 1, 1, 1, 1,
1.687877, -0.3795039, 1.392507, 1, 1, 1, 1, 1,
1.692399, 0.5989448, 0.2115743, 0, 0, 1, 1, 1,
1.698175, 0.7730867, 2.404863, 1, 0, 0, 1, 1,
1.700501, -1.84305, 3.610051, 1, 0, 0, 1, 1,
1.711298, 0.547502, 1.524139, 1, 0, 0, 1, 1,
1.713875, 0.6928943, 1.224671, 1, 0, 0, 1, 1,
1.720065, -1.185176, 1.860132, 1, 0, 0, 1, 1,
1.732955, 0.5664299, 3.769864, 0, 0, 0, 1, 1,
1.736691, -1.708451, 3.185724, 0, 0, 0, 1, 1,
1.743525, -0.8786756, 1.601749, 0, 0, 0, 1, 1,
1.760017, 1.472357, 0.5519201, 0, 0, 0, 1, 1,
1.769386, -1.931064, 3.707313, 0, 0, 0, 1, 1,
1.776438, 0.7429236, 0.9224925, 0, 0, 0, 1, 1,
1.778444, 0.9818595, 1.700062, 0, 0, 0, 1, 1,
1.783808, 0.4261194, 1.375173, 1, 1, 1, 1, 1,
1.786283, 0.6379438, 1.98295, 1, 1, 1, 1, 1,
1.807404, -0.1669464, 1.951895, 1, 1, 1, 1, 1,
1.813344, 0.25467, 2.732432, 1, 1, 1, 1, 1,
1.842703, 0.1457626, 0.1659726, 1, 1, 1, 1, 1,
1.882965, -0.2451681, 1.41094, 1, 1, 1, 1, 1,
1.916552, 0.388216, 2.273198, 1, 1, 1, 1, 1,
1.922651, 0.5280039, 1.628075, 1, 1, 1, 1, 1,
1.927647, 0.3067104, -0.359255, 1, 1, 1, 1, 1,
1.941832, -1.350236, 1.91315, 1, 1, 1, 1, 1,
1.947861, -0.06812692, 2.144038, 1, 1, 1, 1, 1,
1.968687, -0.07418589, -0.2016803, 1, 1, 1, 1, 1,
1.986846, 0.8664911, 1.4149, 1, 1, 1, 1, 1,
2.067878, -0.8337179, 2.023621, 1, 1, 1, 1, 1,
2.070161, -2.541701, 3.437746, 1, 1, 1, 1, 1,
2.104184, -1.640914, 4.086399, 0, 0, 1, 1, 1,
2.117812, -0.06622322, 1.12397, 1, 0, 0, 1, 1,
2.168994, -0.4810213, 1.814961, 1, 0, 0, 1, 1,
2.240601, 1.092298, 1.661677, 1, 0, 0, 1, 1,
2.241418, -0.2394265, 1.406165, 1, 0, 0, 1, 1,
2.245592, -1.237174, 1.086999, 1, 0, 0, 1, 1,
2.322917, 0.5412445, 0.9309956, 0, 0, 0, 1, 1,
2.416492, 0.5530347, 1.479489, 0, 0, 0, 1, 1,
2.454298, -2.321401, 1.935662, 0, 0, 0, 1, 1,
2.475151, -0.9183279, 0.8550336, 0, 0, 0, 1, 1,
2.506948, -0.01052677, 2.187185, 0, 0, 0, 1, 1,
2.538989, -0.4892308, 1.978172, 0, 0, 0, 1, 1,
2.540326, -0.000424188, 1.66329, 0, 0, 0, 1, 1,
2.638369, 0.6085856, 1.408758, 1, 1, 1, 1, 1,
2.661006, -0.770227, 0.5491971, 1, 1, 1, 1, 1,
2.80627, 0.4132589, -0.1675553, 1, 1, 1, 1, 1,
2.834196, 0.2649663, 0.7259342, 1, 1, 1, 1, 1,
2.947675, 0.6767038, 0.9510155, 1, 1, 1, 1, 1,
2.984516, 0.7406085, 1.946991, 1, 1, 1, 1, 1,
3.30108, -0.1831435, 1.02113, 1, 1, 1, 1, 1
]);
var values25 = v;
var normLoc25 = gl.getAttribLocation(prog25, "aNorm");
var mvMatLoc25 = gl.getUniformLocation(prog25,"mvMatrix");
var prMatLoc25 = gl.getUniformLocation(prog25,"prMatrix");
var normMatLoc25 = gl.getUniformLocation(prog25,"normMatrix");
gl.enable(gl.DEPTH_TEST);
gl.depthFunc(gl.LEQUAL);
gl.clearDepth(1.0);
gl.clearColor(1,1,1,1);
var xOffs = yOffs = 0,  drag  = 0;
function multMV(M, v) {
return [M.m11*v[0] + M.m12*v[1] + M.m13*v[2] + M.m14*v[3],
M.m21*v[0] + M.m22*v[1] + M.m23*v[2] + M.m24*v[3],
M.m31*v[0] + M.m32*v[1] + M.m33*v[2] + M.m34*v[3],
M.m41*v[0] + M.m42*v[1] + M.m43*v[2] + M.m44*v[3]];
}
drawScene();
function drawScene(){
gl.depthMask(true);
gl.disable(gl.BLEND);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
// ***** subscene 19 ****
gl.viewport(0, 0, 504, 504);
gl.scissor(0, 0, 504, 504);
gl.clearColor(1, 1, 1, 1);
gl.clear(gl.COLOR_BUFFER_BIT | gl.DEPTH_BUFFER_BIT);
var radius = 10.06937;
var distance = 35.36822;
var t = tan(fov[19]*PI/360);
var near = distance - radius;
var far = distance + radius;
var hlen = t*near;
var aspect = 1;
prMatrix.makeIdentity();
if (aspect > 1)
prMatrix.frustum(-hlen*aspect*zoom[19], hlen*aspect*zoom[19], 
-hlen*zoom[19], hlen*zoom[19], near, far);
else  
prMatrix.frustum(-hlen*zoom[19], hlen*zoom[19], 
-hlen*zoom[19]/aspect, hlen*zoom[19]/aspect, 
near, far);
mvMatrix.makeIdentity();
mvMatrix.translate( -0.1820748, 0.1880853, -0.5088062 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.36822);
normMatrix.makeIdentity();
normMatrix.scale( 1, 1, 1 );   
normMatrix.multRight( userMatrix[19] );
// ****** spheres object 25 *******
gl.useProgram(prog25);
gl.bindBuffer(gl.ARRAY_BUFFER, sphereBuf);
gl.bindBuffer(gl.ELEMENT_ARRAY_BUFFER, sphereIbuf);
gl.uniformMatrix4fv( prMatLoc25, false, new Float32Array(prMatrix.getAsArray()) );
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(mvMatrix.getAsArray()) );
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(normMatrix.getAsArray()) );
gl.enableVertexAttribArray( posLoc );
gl.vertexAttribPointer(posLoc,  3, gl.FLOAT, false, 12,  0);
gl.enableVertexAttribArray(normLoc25 );
gl.vertexAttribPointer(normLoc25,  3, gl.FLOAT, false, 12,  0);
gl.disableVertexAttribArray( colLoc );
var sphereNorm = new CanvasMatrix4();
sphereNorm.scale(1, 1, 1);
sphereNorm.multRight(normMatrix);
gl.uniformMatrix4fv( normMatLoc25, false, new Float32Array(sphereNorm.getAsArray()) );
for (var i = 0; i < 1000; i++) {
var sphereMV = new CanvasMatrix4();
var baseofs = i*8
var ofs = baseofs + 7;	       
var scale = values25[ofs];
sphereMV.scale(1*scale, 1*scale, 1*scale);
sphereMV.translate(values25[baseofs], 
values25[baseofs+1], 
values25[baseofs+2]);
sphereMV.multRight(mvMatrix);
gl.uniformMatrix4fv( mvMatLoc25, false, new Float32Array(sphereMV.getAsArray()) );
ofs = baseofs + 3;       
gl.vertexAttrib4f( colLoc, values25[ofs], 
values25[ofs+1], 
values25[ofs+2],
values25[ofs+3] );
gl.drawElements(gl.TRIANGLES, 384, gl.UNSIGNED_SHORT, 0);
}
gl.flush ();
}
var vpx0 = {
19: 0
};
var vpy0 = {
19: 0
};
var vpWidths = {
19: 504
};
var vpHeights = {
19: 504
};
var activeModel = {
19: 19
};
var activeProjection = {
19: 19
};
var whichSubscene = function(coords){
if (0 <= coords.x && coords.x <= 504 && 0 <= coords.y && coords.y <= 504) return(19);
return(19);
}
var translateCoords = function(subsceneid, coords){
return {x:coords.x - vpx0[subsceneid], y:coords.y - vpy0[subsceneid]};
}
var vlen = function(v) {
return sqrt(v[0]*v[0] + v[1]*v[1] + v[2]*v[2])
}
var xprod = function(a, b) {
return [a[1]*b[2] - a[2]*b[1],
a[2]*b[0] - a[0]*b[2],
a[0]*b[1] - a[1]*b[0]];
}
var screenToVector = function(x, y) {
var width = vpWidths[activeSubscene];
var height = vpHeights[activeSubscene];
var radius = max(width, height)/2.0;
var cx = width/2.0;
var cy = height/2.0;
var px = (x-cx)/radius;
var py = (y-cy)/radius;
var plen = sqrt(px*px+py*py);
if (plen > 1.e-6) { 
px = px/plen;
py = py/plen;
}
var angle = (SQRT2 - plen)/SQRT2*PI/2;
var z = sin(angle);
var zlen = sqrt(1.0 - z*z);
px = px * zlen;
py = py * zlen;
return [px, py, z];
}
var rotBase;
var trackballdown = function(x,y) {
rotBase = screenToVector(x, y);
saveMat.load(userMatrix[activeModel[activeSubscene]]);
}
var trackballmove = function(x,y) {
var rotCurrent = screenToVector(x,y);
var dot = rotBase[0]*rotCurrent[0] + 
rotBase[1]*rotCurrent[1] + 
rotBase[2]*rotCurrent[2];
var angle = acos( dot/vlen(rotBase)/vlen(rotCurrent) )*180./PI;
var axis = xprod(rotBase, rotCurrent);
userMatrix[activeModel[activeSubscene]].load(saveMat);
userMatrix[activeModel[activeSubscene]].rotate(angle, axis[0], axis[1], axis[2]);
drawScene();
}
var y0zoom = 0;
var zoom0 = 1;
var zoomdown = function(x, y) {
y0zoom = y;
zoom0 = log(zoom[activeProjection[activeSubscene]]);
}
var zoommove = function(x, y) {
zoom[activeProjection[activeSubscene]] = exp(zoom0 + (y-y0zoom)/height);
drawScene();
}
var y0fov = 0;
var fov0 = 1;
var fovdown = function(x, y) {
y0fov = y;
fov0 = fov[activeProjection[activeSubscene]];
}
var fovmove = function(x, y) {
fov[activeProjection[activeSubscene]] = max(1, min(179, fov0 + 180*(y-y0fov)/height));
drawScene();
}
var mousedown = [trackballdown, zoomdown, fovdown];
var mousemove = [trackballmove, zoommove, fovmove];
function relMouseCoords(event){
var totalOffsetX = 0;
var totalOffsetY = 0;
var currentElement = canvas;
do{
totalOffsetX += currentElement.offsetLeft;
totalOffsetY += currentElement.offsetTop;
}
while(currentElement = currentElement.offsetParent)
var canvasX = event.pageX - totalOffsetX;
var canvasY = event.pageY - totalOffsetY;
return {x:canvasX, y:canvasY}
}
canvas.onmousedown = function ( ev ){
if (!ev.which) // Use w3c defns in preference to MS
switch (ev.button) {
case 0: ev.which = 1; break;
case 1: 
case 4: ev.which = 2; break;
case 2: ev.which = 3;
}
drag = ev.which;
var f = mousedown[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height-coords.y;
activeSubscene = whichSubscene(coords);
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y); 
ev.preventDefault();
}
}    
canvas.onmouseup = function ( ev ){	
drag = 0;
}
canvas.onmouseout = canvas.onmouseup;
canvas.onmousemove = function ( ev ){
if ( drag == 0 ) return;
var f = mousemove[drag-1];
if (f) {
var coords = relMouseCoords(ev);
coords.y = height - coords.y;
coords = translateCoords(activeSubscene, coords);
f(coords.x, coords.y);
}
}
var wheelHandler = function(ev) {
var del = 1.1;
if (ev.shiftKey) del = 1.01;
var ds = ((ev.detail || ev.wheelDelta) > 0) ? del : (1 / del);
zoom[activeProjection[activeSubscene]] *= ds;
drawScene();
ev.preventDefault();
};
canvas.addEventListener("DOMMouseScroll", wheelHandler, false);
canvas.addEventListener("mousewheel", wheelHandler, false);
}
</script>
<canvas id="testgl2canvas" width="1" height="1"></canvas> 
<p id="testgl2debug">
You must enable Javascript to view this page properly.</p>
<script>testgl2webGLStart();</script>
