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
-3.027602, -0.1521599, -1.790303, 1, 0, 0, 1,
-2.800166, -0.8454964, -0.9963912, 1, 0.007843138, 0, 1,
-2.677559, 0.9432653, -2.869407, 1, 0.01176471, 0, 1,
-2.668531, -1.203435, -4.198615, 1, 0.01960784, 0, 1,
-2.566923, -0.06479155, -2.018764, 1, 0.02352941, 0, 1,
-2.558452, -0.4267614, -2.068723, 1, 0.03137255, 0, 1,
-2.543398, 0.1946925, 0.2176715, 1, 0.03529412, 0, 1,
-2.523362, -0.005842828, -1.848123, 1, 0.04313726, 0, 1,
-2.441002, 0.7606406, -2.217485, 1, 0.04705882, 0, 1,
-2.433173, -0.989658, -3.017349, 1, 0.05490196, 0, 1,
-2.410588, -1.627053, -3.083303, 1, 0.05882353, 0, 1,
-2.363033, -1.755467, -3.350331, 1, 0.06666667, 0, 1,
-2.358135, -0.3769825, -2.047461, 1, 0.07058824, 0, 1,
-2.341107, -1.748364, -3.441402, 1, 0.07843138, 0, 1,
-2.269411, 0.5096979, -2.399851, 1, 0.08235294, 0, 1,
-2.196504, 0.6720304, -0.8193428, 1, 0.09019608, 0, 1,
-2.189475, -0.878142, -1.413337, 1, 0.09411765, 0, 1,
-2.17867, 0.504315, -0.2483858, 1, 0.1019608, 0, 1,
-2.171494, 0.9093358, -2.31572, 1, 0.1098039, 0, 1,
-2.166877, 0.2337582, 0.3393551, 1, 0.1137255, 0, 1,
-2.157695, -0.0239828, -1.830828, 1, 0.1215686, 0, 1,
-2.143716, -1.717541, -2.920568, 1, 0.1254902, 0, 1,
-2.139476, -0.6475888, -2.54183, 1, 0.1333333, 0, 1,
-2.131412, 0.517123, -2.52408, 1, 0.1372549, 0, 1,
-2.111734, 1.849507, -0.9872789, 1, 0.145098, 0, 1,
-2.086013, 0.005005472, -3.753862, 1, 0.1490196, 0, 1,
-2.08273, -0.05778538, -2.788952, 1, 0.1568628, 0, 1,
-2.056539, -1.62059, -2.372094, 1, 0.1607843, 0, 1,
-2.053794, 0.866411, -1.939071, 1, 0.1686275, 0, 1,
-2.047956, -1.125982, -1.892325, 1, 0.172549, 0, 1,
-2.045691, 2.145059, 0.3837423, 1, 0.1803922, 0, 1,
-2.026816, -1.27661, -2.379511, 1, 0.1843137, 0, 1,
-2.01186, 0.6846284, -2.237733, 1, 0.1921569, 0, 1,
-1.992813, -0.3077732, -2.92986, 1, 0.1960784, 0, 1,
-1.990475, -2.424006, -2.610546, 1, 0.2039216, 0, 1,
-1.981306, 0.3383611, -0.8657724, 1, 0.2117647, 0, 1,
-1.976133, 1.206392, -0.4147586, 1, 0.2156863, 0, 1,
-1.959365, -1.073631, -4.246358, 1, 0.2235294, 0, 1,
-1.955393, -1.585954, -3.131518, 1, 0.227451, 0, 1,
-1.922217, 1.354771, -1.826231, 1, 0.2352941, 0, 1,
-1.920669, 0.5312629, -0.6360549, 1, 0.2392157, 0, 1,
-1.887919, -2.29901, -4.385657, 1, 0.2470588, 0, 1,
-1.853549, 0.3649096, -0.1680884, 1, 0.2509804, 0, 1,
-1.843814, -0.2053661, -0.8027101, 1, 0.2588235, 0, 1,
-1.843204, 0.4734037, 0.02891251, 1, 0.2627451, 0, 1,
-1.84188, -0.3784898, -2.287629, 1, 0.2705882, 0, 1,
-1.837633, -1.12095, -2.051294, 1, 0.2745098, 0, 1,
-1.830176, -0.5288324, -2.041193, 1, 0.282353, 0, 1,
-1.820015, 1.139904, -0.7607595, 1, 0.2862745, 0, 1,
-1.812108, -0.8634612, -1.435227, 1, 0.2941177, 0, 1,
-1.802358, 0.3021649, -1.47134, 1, 0.3019608, 0, 1,
-1.798491, -0.83078, -0.8664206, 1, 0.3058824, 0, 1,
-1.797221, -1.112257, -2.790994, 1, 0.3137255, 0, 1,
-1.788256, 0.5803863, -0.2651524, 1, 0.3176471, 0, 1,
-1.782836, 1.271373, -0.9385762, 1, 0.3254902, 0, 1,
-1.739969, 0.2869051, -1.269333, 1, 0.3294118, 0, 1,
-1.716036, 0.05235905, -1.707233, 1, 0.3372549, 0, 1,
-1.693947, 1.346029, -0.3715187, 1, 0.3411765, 0, 1,
-1.685535, -0.5858612, 0.5394124, 1, 0.3490196, 0, 1,
-1.679638, -1.758354, -2.475275, 1, 0.3529412, 0, 1,
-1.652912, 0.7083348, 0.8742766, 1, 0.3607843, 0, 1,
-1.634578, 0.55906, -1.070067, 1, 0.3647059, 0, 1,
-1.629365, -0.3246472, -0.987743, 1, 0.372549, 0, 1,
-1.614488, 0.729768, -0.2710226, 1, 0.3764706, 0, 1,
-1.611027, 2.201913, -0.5434293, 1, 0.3843137, 0, 1,
-1.606568, -0.443559, -0.1159598, 1, 0.3882353, 0, 1,
-1.60085, 0.0242367, -1.417994, 1, 0.3960784, 0, 1,
-1.580045, -1.214069, -1.572143, 1, 0.4039216, 0, 1,
-1.579693, 0.1812792, -2.567689, 1, 0.4078431, 0, 1,
-1.578907, 0.851441, -1.641935, 1, 0.4156863, 0, 1,
-1.576744, -0.9996368, -1.396306, 1, 0.4196078, 0, 1,
-1.573792, 0.01936829, -0.9982728, 1, 0.427451, 0, 1,
-1.567284, 2.123894, -1.269857, 1, 0.4313726, 0, 1,
-1.562398, -0.381948, -2.134513, 1, 0.4392157, 0, 1,
-1.54911, 1.185227, -1.269356, 1, 0.4431373, 0, 1,
-1.52166, 1.795689, -0.9703916, 1, 0.4509804, 0, 1,
-1.509816, 0.6948116, -1.775516, 1, 0.454902, 0, 1,
-1.505227, 1.698306, -0.7188836, 1, 0.4627451, 0, 1,
-1.504283, 1.366703, -0.2650866, 1, 0.4666667, 0, 1,
-1.502889, -0.9247999, -0.9992161, 1, 0.4745098, 0, 1,
-1.497442, 0.8976084, -1.46867, 1, 0.4784314, 0, 1,
-1.495143, -2.141518, -2.607055, 1, 0.4862745, 0, 1,
-1.482796, -0.3536721, -1.165882, 1, 0.4901961, 0, 1,
-1.482446, 1.98793, 0.6782026, 1, 0.4980392, 0, 1,
-1.480395, -1.126472, -3.158416, 1, 0.5058824, 0, 1,
-1.479988, -0.006454623, -1.242699, 1, 0.509804, 0, 1,
-1.478997, -0.6960327, -1.848004, 1, 0.5176471, 0, 1,
-1.471665, -0.4235897, -1.915494, 1, 0.5215687, 0, 1,
-1.465093, 0.42412, -2.523941, 1, 0.5294118, 0, 1,
-1.459599, 0.968632, -0.326573, 1, 0.5333334, 0, 1,
-1.452554, -0.3323991, -2.768612, 1, 0.5411765, 0, 1,
-1.435478, 1.563452, -0.1405358, 1, 0.5450981, 0, 1,
-1.433302, 2.453845, -2.226938, 1, 0.5529412, 0, 1,
-1.424994, -0.1893802, -2.589679, 1, 0.5568628, 0, 1,
-1.399545, 1.764567, -1.468324, 1, 0.5647059, 0, 1,
-1.398922, 0.8611896, -0.7737722, 1, 0.5686275, 0, 1,
-1.396865, 0.6593844, -2.013164, 1, 0.5764706, 0, 1,
-1.368173, 0.6637468, -0.6143178, 1, 0.5803922, 0, 1,
-1.358932, -0.9093054, -0.2092989, 1, 0.5882353, 0, 1,
-1.352984, 0.3391626, -0.5006278, 1, 0.5921569, 0, 1,
-1.350226, 0.5300646, -2.255862, 1, 0.6, 0, 1,
-1.347576, -0.7617746, -3.114784, 1, 0.6078432, 0, 1,
-1.346578, -0.4082691, -0.8117946, 1, 0.6117647, 0, 1,
-1.335641, 0.1799107, -2.246532, 1, 0.6196079, 0, 1,
-1.327771, 1.492907, -3.103462, 1, 0.6235294, 0, 1,
-1.321255, 1.426264, -0.4228942, 1, 0.6313726, 0, 1,
-1.305216, 0.4124043, -2.724657, 1, 0.6352941, 0, 1,
-1.279132, -0.0557659, 0.6229195, 1, 0.6431373, 0, 1,
-1.269585, 0.1627214, -1.641012, 1, 0.6470588, 0, 1,
-1.267061, -0.9291931, -0.826488, 1, 0.654902, 0, 1,
-1.264254, -0.7461727, -2.615463, 1, 0.6588235, 0, 1,
-1.2544, 0.9689228, -2.897887, 1, 0.6666667, 0, 1,
-1.252422, -0.218948, -1.340123, 1, 0.6705883, 0, 1,
-1.239606, -0.3948268, -1.395235, 1, 0.6784314, 0, 1,
-1.230414, -0.5258934, -2.008737, 1, 0.682353, 0, 1,
-1.224858, -1.642772, -1.742432, 1, 0.6901961, 0, 1,
-1.219288, -0.4326806, -0.9875692, 1, 0.6941177, 0, 1,
-1.218391, 0.4189855, -0.5416217, 1, 0.7019608, 0, 1,
-1.217514, -1.244191, -3.920537, 1, 0.7098039, 0, 1,
-1.21588, -0.3684554, -0.3003843, 1, 0.7137255, 0, 1,
-1.214735, 0.9365878, -0.1145931, 1, 0.7215686, 0, 1,
-1.19823, 0.3092282, -0.354741, 1, 0.7254902, 0, 1,
-1.166016, 0.9298992, 0.1399701, 1, 0.7333333, 0, 1,
-1.160908, 0.3561834, -0.9547817, 1, 0.7372549, 0, 1,
-1.159009, -0.8736721, -2.783818, 1, 0.7450981, 0, 1,
-1.158191, 0.910453, -0.1072659, 1, 0.7490196, 0, 1,
-1.155312, -1.409914, -4.483022, 1, 0.7568628, 0, 1,
-1.15065, -1.409368, -2.146578, 1, 0.7607843, 0, 1,
-1.136352, -0.03299985, -1.153442, 1, 0.7686275, 0, 1,
-1.12964, -1.05316, -1.823, 1, 0.772549, 0, 1,
-1.129047, -1.894912, -1.014165, 1, 0.7803922, 0, 1,
-1.128194, 0.9176484, -0.9272933, 1, 0.7843137, 0, 1,
-1.123343, 0.7994661, -0.2140233, 1, 0.7921569, 0, 1,
-1.119982, -0.4867652, -0.8247572, 1, 0.7960784, 0, 1,
-1.112547, -0.7220525, -2.048968, 1, 0.8039216, 0, 1,
-1.104688, 0.008711638, -1.848986, 1, 0.8117647, 0, 1,
-1.100748, 0.08183353, 0.1949543, 1, 0.8156863, 0, 1,
-1.100546, 1.131701, -1.784064, 1, 0.8235294, 0, 1,
-1.100245, -0.5682662, -0.8646406, 1, 0.827451, 0, 1,
-1.096133, 0.330992, 0.2711299, 1, 0.8352941, 0, 1,
-1.094145, -1.118052, -1.871293, 1, 0.8392157, 0, 1,
-1.08639, 1.840569, -0.7776722, 1, 0.8470588, 0, 1,
-1.084468, 0.02958606, -2.438929, 1, 0.8509804, 0, 1,
-1.084189, -0.6800565, -2.283966, 1, 0.8588235, 0, 1,
-1.083777, -0.2080344, -0.4318091, 1, 0.8627451, 0, 1,
-1.08255, 0.304518, 0.03886699, 1, 0.8705882, 0, 1,
-1.075166, 0.5159385, -1.826362, 1, 0.8745098, 0, 1,
-1.06544, 1.841852, 0.5982434, 1, 0.8823529, 0, 1,
-1.06323, -1.681575, -4.762321, 1, 0.8862745, 0, 1,
-1.063073, 0.8551307, -0.5777841, 1, 0.8941177, 0, 1,
-1.051936, 0.98796, -1.072558, 1, 0.8980392, 0, 1,
-1.050859, -0.100999, -2.681979, 1, 0.9058824, 0, 1,
-1.050578, 0.5924702, -1.037946, 1, 0.9137255, 0, 1,
-1.043294, -0.5406882, -3.826083, 1, 0.9176471, 0, 1,
-1.038893, 0.8398421, -0.5769103, 1, 0.9254902, 0, 1,
-1.029339, -0.7014489, -2.504101, 1, 0.9294118, 0, 1,
-1.022243, -0.7571787, -1.657711, 1, 0.9372549, 0, 1,
-1.020763, 1.593167, 0.2577257, 1, 0.9411765, 0, 1,
-1.019754, -0.9431484, -3.143723, 1, 0.9490196, 0, 1,
-1.011096, 0.3824008, -2.575173, 1, 0.9529412, 0, 1,
-1.006026, 0.1617873, -2.718656, 1, 0.9607843, 0, 1,
-1.004785, -0.2075319, -2.935896, 1, 0.9647059, 0, 1,
-1.002749, -0.1234207, -2.169259, 1, 0.972549, 0, 1,
-1.000467, -0.7430401, -4.195598, 1, 0.9764706, 0, 1,
-0.9902315, -0.4709882, -3.282449, 1, 0.9843137, 0, 1,
-0.9820328, 0.7525153, -0.5293342, 1, 0.9882353, 0, 1,
-0.981132, 0.4465477, -3.042989, 1, 0.9960784, 0, 1,
-0.9792147, -0.4569244, -2.42308, 0.9960784, 1, 0, 1,
-0.9791847, 0.7095445, 0.009794082, 0.9921569, 1, 0, 1,
-0.9741583, -1.947544, -2.92953, 0.9843137, 1, 0, 1,
-0.9736567, -0.04079955, -2.730253, 0.9803922, 1, 0, 1,
-0.9729834, 0.8806434, -0.4997069, 0.972549, 1, 0, 1,
-0.9686778, 1.404496, 1.240373, 0.9686275, 1, 0, 1,
-0.9673519, -0.7483867, -1.291682, 0.9607843, 1, 0, 1,
-0.9632916, -0.5461873, -1.046365, 0.9568627, 1, 0, 1,
-0.958002, -0.6863284, -2.480552, 0.9490196, 1, 0, 1,
-0.9531613, -0.9238809, -2.719159, 0.945098, 1, 0, 1,
-0.9444284, 1.535663, -1.138236, 0.9372549, 1, 0, 1,
-0.9389215, -1.063218, -2.880175, 0.9333333, 1, 0, 1,
-0.9314747, -0.004627629, -2.126028, 0.9254902, 1, 0, 1,
-0.9312785, 1.079281, 0.4255272, 0.9215686, 1, 0, 1,
-0.9278523, -0.4003072, -2.414431, 0.9137255, 1, 0, 1,
-0.9273761, -2.072955, -2.148945, 0.9098039, 1, 0, 1,
-0.9257801, -0.2649107, -2.199078, 0.9019608, 1, 0, 1,
-0.9105034, 1.456331, -1.54618, 0.8941177, 1, 0, 1,
-0.910467, -2.724001, -3.211072, 0.8901961, 1, 0, 1,
-0.9100449, 0.5506389, -1.077184, 0.8823529, 1, 0, 1,
-0.9096428, 0.7951248, -0.428705, 0.8784314, 1, 0, 1,
-0.9085357, 0.5073987, -1.560154, 0.8705882, 1, 0, 1,
-0.906804, -1.012468, -1.80746, 0.8666667, 1, 0, 1,
-0.9006404, -0.7922115, -1.827227, 0.8588235, 1, 0, 1,
-0.8989604, 0.6189498, 0.1061484, 0.854902, 1, 0, 1,
-0.898884, -0.1657434, -3.31487, 0.8470588, 1, 0, 1,
-0.8977686, 0.259598, -1.942975, 0.8431373, 1, 0, 1,
-0.8966917, 1.51441, -1.111769, 0.8352941, 1, 0, 1,
-0.8921536, -0.4327224, -1.69224, 0.8313726, 1, 0, 1,
-0.8912846, 0.5402953, -0.1803751, 0.8235294, 1, 0, 1,
-0.8852428, -0.4492331, 0.1242348, 0.8196079, 1, 0, 1,
-0.8852422, -0.5935171, -2.601784, 0.8117647, 1, 0, 1,
-0.8846189, -1.108667, -1.744613, 0.8078431, 1, 0, 1,
-0.884006, 1.069132, -1.721106, 0.8, 1, 0, 1,
-0.883077, 1.374361, 0.2738516, 0.7921569, 1, 0, 1,
-0.8803746, -2.358622, -1.865271, 0.7882353, 1, 0, 1,
-0.8786231, 1.217084, -0.6705855, 0.7803922, 1, 0, 1,
-0.8743253, -1.33776, -1.010969, 0.7764706, 1, 0, 1,
-0.8644629, 1.466927, 0.8375039, 0.7686275, 1, 0, 1,
-0.8634101, -0.4673439, -4.501824, 0.7647059, 1, 0, 1,
-0.8615344, 0.6859166, -0.9125791, 0.7568628, 1, 0, 1,
-0.8592035, 0.01091118, -2.752536, 0.7529412, 1, 0, 1,
-0.8579722, 0.5262235, -0.8611516, 0.7450981, 1, 0, 1,
-0.8433882, -0.4861661, -1.067468, 0.7411765, 1, 0, 1,
-0.8396098, -0.1768008, -1.267085, 0.7333333, 1, 0, 1,
-0.8395069, -0.02970839, -0.8245108, 0.7294118, 1, 0, 1,
-0.8359282, 0.3862063, -0.9760134, 0.7215686, 1, 0, 1,
-0.8325874, -0.0176094, -2.83148, 0.7176471, 1, 0, 1,
-0.8323733, 0.6640809, -1.068069, 0.7098039, 1, 0, 1,
-0.8320845, -0.1628707, -2.191452, 0.7058824, 1, 0, 1,
-0.8314707, -0.9782426, -2.404547, 0.6980392, 1, 0, 1,
-0.8256615, 0.3221523, -0.8985496, 0.6901961, 1, 0, 1,
-0.8120952, -0.06258977, -0.767255, 0.6862745, 1, 0, 1,
-0.8102896, -0.954268, -1.791119, 0.6784314, 1, 0, 1,
-0.809387, -0.160325, -2.713794, 0.6745098, 1, 0, 1,
-0.8086929, 1.570756, -1.30698, 0.6666667, 1, 0, 1,
-0.8077907, -0.7945893, -3.510257, 0.6627451, 1, 0, 1,
-0.805828, 0.6534193, 0.8678645, 0.654902, 1, 0, 1,
-0.7994397, 0.4149659, -1.704055, 0.6509804, 1, 0, 1,
-0.7961844, -0.5873457, -2.337327, 0.6431373, 1, 0, 1,
-0.7915698, 0.8328082, -1.324264, 0.6392157, 1, 0, 1,
-0.7892972, -0.5331089, -2.331883, 0.6313726, 1, 0, 1,
-0.7889413, -0.9807967, -3.052058, 0.627451, 1, 0, 1,
-0.7836631, 1.41227, -1.604102, 0.6196079, 1, 0, 1,
-0.7831588, -0.1691267, -2.457743, 0.6156863, 1, 0, 1,
-0.782834, -0.7060562, -3.163459, 0.6078432, 1, 0, 1,
-0.7799837, -0.228908, -3.667885, 0.6039216, 1, 0, 1,
-0.7798473, 2.718828, 0.3715745, 0.5960785, 1, 0, 1,
-0.7796445, -0.3676134, -3.571496, 0.5882353, 1, 0, 1,
-0.7791976, -1.012263, -1.783081, 0.5843138, 1, 0, 1,
-0.7745009, 0.8543956, -0.014156, 0.5764706, 1, 0, 1,
-0.7741755, 0.1336172, -1.937234, 0.572549, 1, 0, 1,
-0.7737342, -0.02247324, -0.6663688, 0.5647059, 1, 0, 1,
-0.7725786, -0.1632779, -1.812503, 0.5607843, 1, 0, 1,
-0.7680224, -2.316034, -2.427351, 0.5529412, 1, 0, 1,
-0.7640963, -0.6283707, -1.72225, 0.5490196, 1, 0, 1,
-0.7629654, -0.5850222, -2.586465, 0.5411765, 1, 0, 1,
-0.7610556, -0.9982158, -2.527415, 0.5372549, 1, 0, 1,
-0.7602073, -0.1201392, -1.424734, 0.5294118, 1, 0, 1,
-0.7563614, -0.7145458, -2.872913, 0.5254902, 1, 0, 1,
-0.7554362, -0.7123126, -2.460194, 0.5176471, 1, 0, 1,
-0.7526098, 0.3551725, 1.723018, 0.5137255, 1, 0, 1,
-0.7516845, 2.251607, -0.8965327, 0.5058824, 1, 0, 1,
-0.7506572, -0.2143321, -3.089261, 0.5019608, 1, 0, 1,
-0.7492131, -0.1130951, -2.557864, 0.4941176, 1, 0, 1,
-0.7406699, 0.07632431, -2.096682, 0.4862745, 1, 0, 1,
-0.729863, 0.1449666, -0.9438516, 0.4823529, 1, 0, 1,
-0.7207871, 0.9199585, -0.873888, 0.4745098, 1, 0, 1,
-0.7192363, 0.8511109, -0.6196229, 0.4705882, 1, 0, 1,
-0.7176166, -0.8465226, -2.84351, 0.4627451, 1, 0, 1,
-0.7158139, -0.5757744, -1.322437, 0.4588235, 1, 0, 1,
-0.7110955, -0.3694835, -2.634236, 0.4509804, 1, 0, 1,
-0.7073904, 0.9773006, -0.4139357, 0.4470588, 1, 0, 1,
-0.7064207, -1.534474, -1.583263, 0.4392157, 1, 0, 1,
-0.6989437, 2.177782, 0.7057816, 0.4352941, 1, 0, 1,
-0.6977552, -1.093698, -3.195071, 0.427451, 1, 0, 1,
-0.6949217, 0.1276676, -0.4345198, 0.4235294, 1, 0, 1,
-0.6906194, 0.5425774, -0.9538695, 0.4156863, 1, 0, 1,
-0.6803302, -0.2028342, -0.930199, 0.4117647, 1, 0, 1,
-0.6782625, -0.2221507, -0.2521891, 0.4039216, 1, 0, 1,
-0.677869, 0.3580113, 0.7879907, 0.3960784, 1, 0, 1,
-0.6720109, -0.6789823, -2.888061, 0.3921569, 1, 0, 1,
-0.6639258, -0.318087, -2.587268, 0.3843137, 1, 0, 1,
-0.6624444, -0.8573713, -3.295278, 0.3803922, 1, 0, 1,
-0.6498613, 0.3234678, -1.42399, 0.372549, 1, 0, 1,
-0.6494427, -1.967894, -3.520243, 0.3686275, 1, 0, 1,
-0.6467257, -0.127009, -2.334638, 0.3607843, 1, 0, 1,
-0.6418881, -0.432546, -0.009418338, 0.3568628, 1, 0, 1,
-0.6378814, -1.736576, -4.331099, 0.3490196, 1, 0, 1,
-0.6372983, 0.1990555, -1.988739, 0.345098, 1, 0, 1,
-0.6340452, 0.08286245, -2.20958, 0.3372549, 1, 0, 1,
-0.6320337, -0.4021353, -2.849102, 0.3333333, 1, 0, 1,
-0.6315846, 1.763877, 1.551335, 0.3254902, 1, 0, 1,
-0.6306295, 0.2742957, -0.5087017, 0.3215686, 1, 0, 1,
-0.6293571, 1.237363, 2.413316, 0.3137255, 1, 0, 1,
-0.6286859, -1.510124, -2.702296, 0.3098039, 1, 0, 1,
-0.6242307, 1.04198, 0.8025227, 0.3019608, 1, 0, 1,
-0.6204152, -0.01373858, -2.036748, 0.2941177, 1, 0, 1,
-0.616379, 1.670629, -0.1146516, 0.2901961, 1, 0, 1,
-0.6147727, -0.09081294, -1.675091, 0.282353, 1, 0, 1,
-0.6132777, 0.8085228, -1.174044, 0.2784314, 1, 0, 1,
-0.6123068, 0.7064188, -1.253995, 0.2705882, 1, 0, 1,
-0.6092126, 0.06015539, -1.240238, 0.2666667, 1, 0, 1,
-0.6056505, 0.8602158, -0.5146353, 0.2588235, 1, 0, 1,
-0.6040429, 0.3272563, -2.711594, 0.254902, 1, 0, 1,
-0.6036717, -1.561077, -1.433133, 0.2470588, 1, 0, 1,
-0.6022042, 0.3739525, -0.8897495, 0.2431373, 1, 0, 1,
-0.5941377, -2.006054, -2.909817, 0.2352941, 1, 0, 1,
-0.5885887, 0.08852894, -0.6367252, 0.2313726, 1, 0, 1,
-0.585075, -0.05746356, -3.119581, 0.2235294, 1, 0, 1,
-0.5835562, 1.353989, -0.1802203, 0.2196078, 1, 0, 1,
-0.5789809, -0.4376936, -3.475589, 0.2117647, 1, 0, 1,
-0.5740693, -0.3022178, 0.4574772, 0.2078431, 1, 0, 1,
-0.5695835, -0.6723261, -2.75328, 0.2, 1, 0, 1,
-0.568728, -1.545271, -3.356723, 0.1921569, 1, 0, 1,
-0.5672306, 0.4591609, -0.01970976, 0.1882353, 1, 0, 1,
-0.5613223, -1.014537, -2.84315, 0.1803922, 1, 0, 1,
-0.5583114, -1.503972, -1.975555, 0.1764706, 1, 0, 1,
-0.5544996, 0.4113404, -0.180114, 0.1686275, 1, 0, 1,
-0.548771, 0.2049409, -2.107013, 0.1647059, 1, 0, 1,
-0.5443513, 1.390031, -0.7463464, 0.1568628, 1, 0, 1,
-0.5332986, -2.552235, -3.327074, 0.1529412, 1, 0, 1,
-0.5323219, 0.786285, -0.8123195, 0.145098, 1, 0, 1,
-0.5268232, 0.6332926, 0.1043558, 0.1411765, 1, 0, 1,
-0.5109238, -1.271061, -1.144209, 0.1333333, 1, 0, 1,
-0.510683, 1.021013, -0.8105523, 0.1294118, 1, 0, 1,
-0.5100018, -0.02230083, -1.188288, 0.1215686, 1, 0, 1,
-0.5085643, 1.891808, 0.001336215, 0.1176471, 1, 0, 1,
-0.5075906, -0.2362821, -2.164273, 0.1098039, 1, 0, 1,
-0.5074918, -0.9586999, -2.863177, 0.1058824, 1, 0, 1,
-0.5048245, 0.7320103, -0.3137428, 0.09803922, 1, 0, 1,
-0.5035457, -1.590253, -1.299237, 0.09019608, 1, 0, 1,
-0.4983723, 0.5262887, 0.8496763, 0.08627451, 1, 0, 1,
-0.4955519, -1.038133, -2.837814, 0.07843138, 1, 0, 1,
-0.4876355, 0.4622198, -2.236589, 0.07450981, 1, 0, 1,
-0.4792293, 1.421097, 0.2704031, 0.06666667, 1, 0, 1,
-0.4763962, -0.008137881, 0.1149433, 0.0627451, 1, 0, 1,
-0.473645, -1.612979, -2.395956, 0.05490196, 1, 0, 1,
-0.4730392, 0.4473846, -0.6378062, 0.05098039, 1, 0, 1,
-0.4675127, -0.1955166, -1.526317, 0.04313726, 1, 0, 1,
-0.4638096, 0.5597461, -2.830977, 0.03921569, 1, 0, 1,
-0.4581942, 0.6459598, 0.7343602, 0.03137255, 1, 0, 1,
-0.4552209, 1.831576, 0.6380636, 0.02745098, 1, 0, 1,
-0.4543816, -0.06878474, -2.23184, 0.01960784, 1, 0, 1,
-0.453474, 0.280061, -1.504447, 0.01568628, 1, 0, 1,
-0.4532995, 1.224871, -0.1341524, 0.007843138, 1, 0, 1,
-0.4528907, 0.5404406, 0.4693675, 0.003921569, 1, 0, 1,
-0.4417748, 0.7576255, -0.7331101, 0, 1, 0.003921569, 1,
-0.4415864, -0.1602834, -2.816695, 0, 1, 0.01176471, 1,
-0.4412727, 0.4090666, -1.260836, 0, 1, 0.01568628, 1,
-0.4350643, -0.3217793, -1.444634, 0, 1, 0.02352941, 1,
-0.4344791, -0.8745015, -1.773534, 0, 1, 0.02745098, 1,
-0.4343057, 0.568171, 0.9719682, 0, 1, 0.03529412, 1,
-0.4321365, 0.008982097, -2.564165, 0, 1, 0.03921569, 1,
-0.4292047, -1.536989, -3.726269, 0, 1, 0.04705882, 1,
-0.4272213, -1.857835, -3.085183, 0, 1, 0.05098039, 1,
-0.4271318, 0.8481523, -1.655139, 0, 1, 0.05882353, 1,
-0.4193299, -0.5847245, -1.410855, 0, 1, 0.0627451, 1,
-0.4185407, 1.430203, -0.5327719, 0, 1, 0.07058824, 1,
-0.418448, -0.7817748, -3.021115, 0, 1, 0.07450981, 1,
-0.4170523, -1.813567, -4.642245, 0, 1, 0.08235294, 1,
-0.4139616, 1.712858, -0.01535516, 0, 1, 0.08627451, 1,
-0.4129686, 0.02026043, -0.6512202, 0, 1, 0.09411765, 1,
-0.4097874, -1.366144, -1.085767, 0, 1, 0.1019608, 1,
-0.4083018, -1.371242, -2.193136, 0, 1, 0.1058824, 1,
-0.4075866, -1.260476, -4.27151, 0, 1, 0.1137255, 1,
-0.4075367, -0.8385546, -3.226477, 0, 1, 0.1176471, 1,
-0.4066696, -0.1948942, -0.8961859, 0, 1, 0.1254902, 1,
-0.4062644, 0.3165278, -1.641408, 0, 1, 0.1294118, 1,
-0.4056482, 0.6524081, -1.321854, 0, 1, 0.1372549, 1,
-0.4038059, 1.444333, 0.5141572, 0, 1, 0.1411765, 1,
-0.3964356, 1.414681, -2.993091, 0, 1, 0.1490196, 1,
-0.3963895, 0.9968529, -0.9143903, 0, 1, 0.1529412, 1,
-0.3860515, 0.1753694, -1.764586, 0, 1, 0.1607843, 1,
-0.3850545, 0.07813859, -2.537318, 0, 1, 0.1647059, 1,
-0.3843164, 2.169168, -0.7314703, 0, 1, 0.172549, 1,
-0.3786154, 1.245177, 1.468434, 0, 1, 0.1764706, 1,
-0.3782721, 2.057348, -0.3455963, 0, 1, 0.1843137, 1,
-0.3778917, -0.1654748, -3.055633, 0, 1, 0.1882353, 1,
-0.376915, 2.05023, 0.3711838, 0, 1, 0.1960784, 1,
-0.3728165, -0.05798264, -0.9835704, 0, 1, 0.2039216, 1,
-0.371799, -2.304013, -1.961977, 0, 1, 0.2078431, 1,
-0.3710552, -0.4971692, -2.221771, 0, 1, 0.2156863, 1,
-0.3690717, 0.3670361, -0.02345231, 0, 1, 0.2196078, 1,
-0.3668164, -0.7267976, -4.803885, 0, 1, 0.227451, 1,
-0.3648708, -1.488882, -3.305951, 0, 1, 0.2313726, 1,
-0.3556703, 0.07060518, -1.745803, 0, 1, 0.2392157, 1,
-0.3548365, -1.015488, -2.485721, 0, 1, 0.2431373, 1,
-0.3526546, -1.265621, -4.236667, 0, 1, 0.2509804, 1,
-0.3520561, -1.560729, -4.100728, 0, 1, 0.254902, 1,
-0.3501398, 0.7742231, 0.0507146, 0, 1, 0.2627451, 1,
-0.3452788, 1.46652, -0.2392485, 0, 1, 0.2666667, 1,
-0.3343821, -0.6350965, -1.903667, 0, 1, 0.2745098, 1,
-0.3257662, 0.9116768, 0.5560338, 0, 1, 0.2784314, 1,
-0.3249767, 0.6893383, -0.949703, 0, 1, 0.2862745, 1,
-0.31969, 1.305175, 0.3023396, 0, 1, 0.2901961, 1,
-0.3196239, -1.920423, -2.553898, 0, 1, 0.2980392, 1,
-0.3188155, -1.217694, -3.585942, 0, 1, 0.3058824, 1,
-0.3186103, 0.2615717, -0.4509342, 0, 1, 0.3098039, 1,
-0.3148781, -1.787826, -4.443455, 0, 1, 0.3176471, 1,
-0.3144934, -0.6872829, -3.579291, 0, 1, 0.3215686, 1,
-0.3113029, -0.4531176, -2.451102, 0, 1, 0.3294118, 1,
-0.3112284, -0.4206863, -4.297531, 0, 1, 0.3333333, 1,
-0.3109916, -0.1015552, -2.053503, 0, 1, 0.3411765, 1,
-0.3018174, -0.6311543, -3.072438, 0, 1, 0.345098, 1,
-0.301741, 0.4912364, -2.028419, 0, 1, 0.3529412, 1,
-0.2962897, 0.232669, -1.228936, 0, 1, 0.3568628, 1,
-0.2909988, -0.5145369, -3.603391, 0, 1, 0.3647059, 1,
-0.2883686, 0.6085092, -1.247506, 0, 1, 0.3686275, 1,
-0.2847058, -1.105507, -4.304223, 0, 1, 0.3764706, 1,
-0.2846693, -0.5012503, -1.767814, 0, 1, 0.3803922, 1,
-0.2843158, 0.09435814, -0.8709067, 0, 1, 0.3882353, 1,
-0.2762722, 1.158919, -0.2471765, 0, 1, 0.3921569, 1,
-0.2756879, -0.6561898, -1.828883, 0, 1, 0.4, 1,
-0.2742417, -2.576694, -1.86113, 0, 1, 0.4078431, 1,
-0.2726105, 0.5912523, 1.162961, 0, 1, 0.4117647, 1,
-0.2691898, -0.4364493, -3.329438, 0, 1, 0.4196078, 1,
-0.2656353, -1.935846, -1.254114, 0, 1, 0.4235294, 1,
-0.2648172, 1.109559, -0.5131916, 0, 1, 0.4313726, 1,
-0.2610949, -2.103958, -5.713365, 0, 1, 0.4352941, 1,
-0.2589222, -0.0003336909, -1.675968, 0, 1, 0.4431373, 1,
-0.2565436, -0.218752, -0.9181042, 0, 1, 0.4470588, 1,
-0.2555963, -0.5015381, -2.230066, 0, 1, 0.454902, 1,
-0.2551005, 0.7781932, -1.166042, 0, 1, 0.4588235, 1,
-0.2504832, 0.7598875, -2.479215, 0, 1, 0.4666667, 1,
-0.249006, 0.2054751, -0.5301634, 0, 1, 0.4705882, 1,
-0.2480334, 1.417248, 1.622441, 0, 1, 0.4784314, 1,
-0.2472815, -0.7342929, -3.509614, 0, 1, 0.4823529, 1,
-0.2452421, -0.4131487, -3.20614, 0, 1, 0.4901961, 1,
-0.2450791, -1.629684, -4.164651, 0, 1, 0.4941176, 1,
-0.2437311, -0.6555624, -2.362169, 0, 1, 0.5019608, 1,
-0.236851, 0.8910161, 1.440681, 0, 1, 0.509804, 1,
-0.236037, 1.46685, -1.546122, 0, 1, 0.5137255, 1,
-0.2359491, 1.870294, -1.897306, 0, 1, 0.5215687, 1,
-0.2329618, -0.1865951, -3.639122, 0, 1, 0.5254902, 1,
-0.2270118, 0.2544356, 0.4162035, 0, 1, 0.5333334, 1,
-0.2130583, 1.765077, 0.5816325, 0, 1, 0.5372549, 1,
-0.2123104, 0.7183159, -0.0520011, 0, 1, 0.5450981, 1,
-0.2083258, -0.8712331, -5.391129, 0, 1, 0.5490196, 1,
-0.1988821, -0.4486095, -4.078271, 0, 1, 0.5568628, 1,
-0.1980409, -0.5494608, -3.220335, 0, 1, 0.5607843, 1,
-0.1976557, 0.7111487, -1.125499, 0, 1, 0.5686275, 1,
-0.1973641, 0.100229, -1.110957, 0, 1, 0.572549, 1,
-0.1965773, -0.448789, -3.622287, 0, 1, 0.5803922, 1,
-0.1918658, 0.02536437, -3.622674, 0, 1, 0.5843138, 1,
-0.1905969, 1.493168, -1.413497, 0, 1, 0.5921569, 1,
-0.1879506, -0.9931168, -3.282758, 0, 1, 0.5960785, 1,
-0.1826503, -0.2276854, -2.813158, 0, 1, 0.6039216, 1,
-0.176744, 0.5719222, -1.032144, 0, 1, 0.6117647, 1,
-0.1689578, -1.075191, -3.078622, 0, 1, 0.6156863, 1,
-0.167566, -1.142496, -3.586487, 0, 1, 0.6235294, 1,
-0.1648261, -0.01363307, -1.160911, 0, 1, 0.627451, 1,
-0.1607498, -0.658569, -3.877601, 0, 1, 0.6352941, 1,
-0.1570889, -0.846882, -3.815437, 0, 1, 0.6392157, 1,
-0.1566593, -0.2863507, -3.634028, 0, 1, 0.6470588, 1,
-0.1518923, -0.2546947, -1.89392, 0, 1, 0.6509804, 1,
-0.1492796, -0.1891325, -1.721541, 0, 1, 0.6588235, 1,
-0.1484791, 1.718621, -1.692871, 0, 1, 0.6627451, 1,
-0.1465211, -0.1434769, -0.3539999, 0, 1, 0.6705883, 1,
-0.1457145, 2.40206, 0.9759708, 0, 1, 0.6745098, 1,
-0.1438128, 0.3647733, -1.982323, 0, 1, 0.682353, 1,
-0.1429263, -0.2434364, -1.293663, 0, 1, 0.6862745, 1,
-0.1428517, -0.677533, -3.265611, 0, 1, 0.6941177, 1,
-0.1396007, 0.1780912, 0.2453999, 0, 1, 0.7019608, 1,
-0.1385802, -0.5615681, -4.399855, 0, 1, 0.7058824, 1,
-0.1369802, 0.007988352, -1.333089, 0, 1, 0.7137255, 1,
-0.1363962, -0.7970179, -2.898324, 0, 1, 0.7176471, 1,
-0.1321155, -0.7834737, -3.032896, 0, 1, 0.7254902, 1,
-0.1288019, -0.09010518, -1.547521, 0, 1, 0.7294118, 1,
-0.1287972, 1.029889, 1.34096, 0, 1, 0.7372549, 1,
-0.1280766, -0.3812303, -3.684353, 0, 1, 0.7411765, 1,
-0.1238098, 2.417312, 1.138302, 0, 1, 0.7490196, 1,
-0.1230601, -0.04409419, -0.7864974, 0, 1, 0.7529412, 1,
-0.1229909, -0.004987224, -2.566441, 0, 1, 0.7607843, 1,
-0.1213562, 1.82272, 1.067183, 0, 1, 0.7647059, 1,
-0.1173892, -1.033203, -2.87981, 0, 1, 0.772549, 1,
-0.109423, -0.9958227, -2.611066, 0, 1, 0.7764706, 1,
-0.1090532, 0.6527296, 0.2284698, 0, 1, 0.7843137, 1,
-0.1080062, -0.2390639, -2.632944, 0, 1, 0.7882353, 1,
-0.106769, 1.061207, 3.340334, 0, 1, 0.7960784, 1,
-0.1002461, -0.2474979, -3.650736, 0, 1, 0.8039216, 1,
-0.09651954, 0.8609319, 1.365632, 0, 1, 0.8078431, 1,
-0.09650796, -1.951468, -2.634734, 0, 1, 0.8156863, 1,
-0.09280077, 0.2035737, -1.625422, 0, 1, 0.8196079, 1,
-0.09278849, 1.130829, -0.3330128, 0, 1, 0.827451, 1,
-0.09261727, 0.9866465, -2.124308, 0, 1, 0.8313726, 1,
-0.08979031, -1.858075, -5.565639, 0, 1, 0.8392157, 1,
-0.08701169, 1.543629, -1.560174, 0, 1, 0.8431373, 1,
-0.08184016, 0.4114846, 1.194252, 0, 1, 0.8509804, 1,
-0.07869503, 1.678326, -1.654966, 0, 1, 0.854902, 1,
-0.07739052, -0.788453, -3.549168, 0, 1, 0.8627451, 1,
-0.07486203, -2.011406, -3.345697, 0, 1, 0.8666667, 1,
-0.07435368, 1.809024, 0.5419347, 0, 1, 0.8745098, 1,
-0.06986755, -0.9265599, -2.58777, 0, 1, 0.8784314, 1,
-0.05878966, -0.60464, -3.537836, 0, 1, 0.8862745, 1,
-0.05795496, -1.193525, -3.762592, 0, 1, 0.8901961, 1,
-0.04836648, -1.933778, -4.379673, 0, 1, 0.8980392, 1,
-0.04605332, -0.4237337, -1.635333, 0, 1, 0.9058824, 1,
-0.03347506, 1.137906, 0.2140411, 0, 1, 0.9098039, 1,
-0.0332642, -2.234579, -3.3491, 0, 1, 0.9176471, 1,
-0.03101684, 1.779714, -0.1306155, 0, 1, 0.9215686, 1,
-0.03101367, -0.974062, -4.271726, 0, 1, 0.9294118, 1,
-0.02036017, 0.6929958, -0.08750585, 0, 1, 0.9333333, 1,
-0.01038662, 1.839706, 0.2316443, 0, 1, 0.9411765, 1,
-0.002590502, 0.8429357, -0.5460429, 0, 1, 0.945098, 1,
-0.0006958638, 0.598627, 0.587024, 0, 1, 0.9529412, 1,
0.0001399595, 1.100491, -1.234587, 0, 1, 0.9568627, 1,
0.01507779, 0.06643672, 1.056196, 0, 1, 0.9647059, 1,
0.01511381, -2.120547, 3.98908, 0, 1, 0.9686275, 1,
0.01683845, -1.031866, 1.574856, 0, 1, 0.9764706, 1,
0.02981828, 0.8685916, -0.2502714, 0, 1, 0.9803922, 1,
0.03457632, 0.1606163, -0.4732604, 0, 1, 0.9882353, 1,
0.04207415, -0.1633778, 3.787201, 0, 1, 0.9921569, 1,
0.04219279, 0.1552092, 0.4007149, 0, 1, 1, 1,
0.04745862, 0.9669454, 2.183238, 0, 0.9921569, 1, 1,
0.05237312, 0.9811552, -0.2129211, 0, 0.9882353, 1, 1,
0.05505065, -1.779097, 3.513552, 0, 0.9803922, 1, 1,
0.06070617, 0.3808905, 0.564649, 0, 0.9764706, 1, 1,
0.06077726, 0.1975035, -1.007816, 0, 0.9686275, 1, 1,
0.06269994, -0.02025217, 0.6919987, 0, 0.9647059, 1, 1,
0.06822843, -1.201437, 3.093009, 0, 0.9568627, 1, 1,
0.07002321, -0.1060014, 2.706069, 0, 0.9529412, 1, 1,
0.07251421, -1.589586, 0.9975626, 0, 0.945098, 1, 1,
0.07295816, 0.5793257, -0.7909478, 0, 0.9411765, 1, 1,
0.07536109, -1.092985, 1.702772, 0, 0.9333333, 1, 1,
0.07644375, 0.2182682, 1.282869, 0, 0.9294118, 1, 1,
0.07661107, 1.73587, 0.9240587, 0, 0.9215686, 1, 1,
0.07845201, 1.215307, 0.3471136, 0, 0.9176471, 1, 1,
0.07956121, -0.7812384, 2.421638, 0, 0.9098039, 1, 1,
0.08149855, 0.5438907, 0.9122802, 0, 0.9058824, 1, 1,
0.08267082, 0.06007866, 0.04315134, 0, 0.8980392, 1, 1,
0.08752134, 1.047583, 1.141254, 0, 0.8901961, 1, 1,
0.089464, 0.4336112, -0.1373166, 0, 0.8862745, 1, 1,
0.09029288, 3.208278, -0.6520054, 0, 0.8784314, 1, 1,
0.09318979, -0.6756343, 3.015068, 0, 0.8745098, 1, 1,
0.09404249, 0.9033949, 0.3268115, 0, 0.8666667, 1, 1,
0.0943822, -0.5977608, 0.6995441, 0, 0.8627451, 1, 1,
0.1007223, -0.4053297, 1.867134, 0, 0.854902, 1, 1,
0.1034295, 1.106266, -1.013414, 0, 0.8509804, 1, 1,
0.1056088, -0.8945654, 2.455361, 0, 0.8431373, 1, 1,
0.1056817, -1.532999, 1.350615, 0, 0.8392157, 1, 1,
0.1062697, 1.490515, 0.09145231, 0, 0.8313726, 1, 1,
0.1136079, -0.06740525, 2.359846, 0, 0.827451, 1, 1,
0.1149766, 1.07629, 0.130883, 0, 0.8196079, 1, 1,
0.1161157, 0.7190611, -0.1571565, 0, 0.8156863, 1, 1,
0.1196203, 0.481968, -1.409964, 0, 0.8078431, 1, 1,
0.1218701, 0.5095004, 0.5881166, 0, 0.8039216, 1, 1,
0.1235761, -0.4362455, 3.002275, 0, 0.7960784, 1, 1,
0.1240152, -0.1270763, 1.113202, 0, 0.7882353, 1, 1,
0.1276389, 0.128923, -0.6523422, 0, 0.7843137, 1, 1,
0.1280155, -0.8988907, 2.606596, 0, 0.7764706, 1, 1,
0.1305798, 0.2487921, -0.5744313, 0, 0.772549, 1, 1,
0.1325461, -0.3730211, 3.546995, 0, 0.7647059, 1, 1,
0.1341335, 1.406911, -0.3120874, 0, 0.7607843, 1, 1,
0.1403895, 2.847968, 0.1056601, 0, 0.7529412, 1, 1,
0.1417619, 1.089514, -0.6844091, 0, 0.7490196, 1, 1,
0.1436302, 0.2128288, -1.481126, 0, 0.7411765, 1, 1,
0.1441399, 0.3237445, 1.481918, 0, 0.7372549, 1, 1,
0.1446072, 0.06787466, 0.1207112, 0, 0.7294118, 1, 1,
0.1450433, 0.8514737, 1.356155, 0, 0.7254902, 1, 1,
0.1452786, -0.1183634, 2.406249, 0, 0.7176471, 1, 1,
0.1464589, -0.140864, 2.093104, 0, 0.7137255, 1, 1,
0.1481424, -1.579615, 3.450888, 0, 0.7058824, 1, 1,
0.14828, 2.037162, 2.307045, 0, 0.6980392, 1, 1,
0.1485119, 0.8343165, -0.08601876, 0, 0.6941177, 1, 1,
0.1507845, 0.4212226, 2.513063, 0, 0.6862745, 1, 1,
0.1521163, 1.71718, 1.82605, 0, 0.682353, 1, 1,
0.1582505, -0.09854741, 2.166667, 0, 0.6745098, 1, 1,
0.160403, -0.8647376, 1.641734, 0, 0.6705883, 1, 1,
0.1604619, -0.8782926, 0.8481694, 0, 0.6627451, 1, 1,
0.1628705, -2.361936, 5.030849, 0, 0.6588235, 1, 1,
0.1711414, 1.245141, -0.5234321, 0, 0.6509804, 1, 1,
0.1748417, -0.3675765, 1.624632, 0, 0.6470588, 1, 1,
0.1748955, 0.03909205, 2.774319, 0, 0.6392157, 1, 1,
0.175041, -0.3012487, 2.840828, 0, 0.6352941, 1, 1,
0.1757982, -1.883181, 3.568353, 0, 0.627451, 1, 1,
0.176054, 0.9192956, -0.1968921, 0, 0.6235294, 1, 1,
0.1760653, -0.2736682, 3.252268, 0, 0.6156863, 1, 1,
0.1763808, -1.546642, 3.763407, 0, 0.6117647, 1, 1,
0.1779984, 0.5916339, -0.08072785, 0, 0.6039216, 1, 1,
0.1804531, -1.637836, 2.792853, 0, 0.5960785, 1, 1,
0.1810936, -1.286244, 3.050722, 0, 0.5921569, 1, 1,
0.1815566, 0.998341, 0.7261452, 0, 0.5843138, 1, 1,
0.1890017, 0.762178, 0.4742147, 0, 0.5803922, 1, 1,
0.1939056, 1.097496, 0.5142121, 0, 0.572549, 1, 1,
0.1948425, 0.3147213, -0.4706216, 0, 0.5686275, 1, 1,
0.1975527, 1.387764, 1.073635, 0, 0.5607843, 1, 1,
0.1984554, -0.4181527, 1.679249, 0, 0.5568628, 1, 1,
0.1992045, 0.8015537, 1.966666, 0, 0.5490196, 1, 1,
0.2030559, -0.857217, 3.938533, 0, 0.5450981, 1, 1,
0.2041237, 0.2124126, 1.10027, 0, 0.5372549, 1, 1,
0.2047646, -0.5530659, 1.963945, 0, 0.5333334, 1, 1,
0.2062089, 0.3410465, 1.188105, 0, 0.5254902, 1, 1,
0.2082422, 1.103206, -0.7194259, 0, 0.5215687, 1, 1,
0.2090014, 1.553581, 0.6114242, 0, 0.5137255, 1, 1,
0.2093473, 0.5804758, 0.8178571, 0, 0.509804, 1, 1,
0.2121855, -1.156531, 0.8417099, 0, 0.5019608, 1, 1,
0.2125303, 0.1452581, 2.605369, 0, 0.4941176, 1, 1,
0.2137614, -0.7309408, 1.228489, 0, 0.4901961, 1, 1,
0.2189489, 0.438885, 0.2145547, 0, 0.4823529, 1, 1,
0.2200461, -1.159947, 2.730186, 0, 0.4784314, 1, 1,
0.2271484, -0.6113091, 1.498944, 0, 0.4705882, 1, 1,
0.2279844, -1.059554, 3.6976, 0, 0.4666667, 1, 1,
0.2283589, -0.8898931, 2.572823, 0, 0.4588235, 1, 1,
0.2300889, 1.491428, -0.1243677, 0, 0.454902, 1, 1,
0.2319634, -0.7964444, 4.612136, 0, 0.4470588, 1, 1,
0.2383073, 0.9292305, -2.092523, 0, 0.4431373, 1, 1,
0.23935, -2.027804, 5.304261, 0, 0.4352941, 1, 1,
0.2399035, -0.2389704, 3.235495, 0, 0.4313726, 1, 1,
0.2401126, 0.08453538, 1.337582, 0, 0.4235294, 1, 1,
0.2407003, 1.517463, 2.016107, 0, 0.4196078, 1, 1,
0.2473489, -1.892885, 0.683131, 0, 0.4117647, 1, 1,
0.2503442, 2.757896, -0.01042804, 0, 0.4078431, 1, 1,
0.2584177, 0.7347177, 0.02004754, 0, 0.4, 1, 1,
0.2595161, 2.344404, -1.620286, 0, 0.3921569, 1, 1,
0.2598295, 1.812613, 0.5927392, 0, 0.3882353, 1, 1,
0.26006, 0.1452982, 1.37669, 0, 0.3803922, 1, 1,
0.2623052, -0.465407, 3.590779, 0, 0.3764706, 1, 1,
0.2679165, -0.4429983, 2.007376, 0, 0.3686275, 1, 1,
0.2694912, 0.6754749, 1.873095, 0, 0.3647059, 1, 1,
0.2724431, -0.9474058, 3.777936, 0, 0.3568628, 1, 1,
0.2754917, 1.599327, -0.7734078, 0, 0.3529412, 1, 1,
0.2826286, -0.4067243, 2.837833, 0, 0.345098, 1, 1,
0.2858128, -1.334528, 1.845181, 0, 0.3411765, 1, 1,
0.2903175, 0.07137721, 2.854217, 0, 0.3333333, 1, 1,
0.2925651, -1.659825, 2.352353, 0, 0.3294118, 1, 1,
0.2930601, 2.119007, 1.591493, 0, 0.3215686, 1, 1,
0.2949787, -0.2002708, 2.607169, 0, 0.3176471, 1, 1,
0.2971163, 0.5940375, 1.900254, 0, 0.3098039, 1, 1,
0.2976709, 0.09517284, -0.3334226, 0, 0.3058824, 1, 1,
0.3013487, -0.8241501, 4.317874, 0, 0.2980392, 1, 1,
0.3037125, -0.5104285, 3.650742, 0, 0.2901961, 1, 1,
0.3047797, 0.2503886, 1.51693, 0, 0.2862745, 1, 1,
0.3075786, -0.775457, 3.23711, 0, 0.2784314, 1, 1,
0.3084418, 0.2930481, 0.739402, 0, 0.2745098, 1, 1,
0.3109742, 0.4686321, 1.288678, 0, 0.2666667, 1, 1,
0.3114524, 1.90829, -0.3302709, 0, 0.2627451, 1, 1,
0.3165313, -1.033262, 3.437003, 0, 0.254902, 1, 1,
0.3171209, 0.6917489, -0.3366469, 0, 0.2509804, 1, 1,
0.3173371, -1.640239, 1.675869, 0, 0.2431373, 1, 1,
0.3183491, 0.2224774, -0.8430777, 0, 0.2392157, 1, 1,
0.3202573, -0.5045737, 3.032753, 0, 0.2313726, 1, 1,
0.3209729, 1.778624, 0.3822976, 0, 0.227451, 1, 1,
0.3218389, -0.4839345, 0.6863331, 0, 0.2196078, 1, 1,
0.3238017, 1.106109, 0.6459273, 0, 0.2156863, 1, 1,
0.3266641, -0.7945154, 0.6082383, 0, 0.2078431, 1, 1,
0.3278049, -0.2597339, 2.355295, 0, 0.2039216, 1, 1,
0.3278866, 1.497867, 2.017433, 0, 0.1960784, 1, 1,
0.3339585, 1.356337, -0.4402164, 0, 0.1882353, 1, 1,
0.3379244, 0.5845045, -0.1382035, 0, 0.1843137, 1, 1,
0.3408145, 1.933483, -0.08946765, 0, 0.1764706, 1, 1,
0.3430948, -2.116811, 2.938548, 0, 0.172549, 1, 1,
0.3473053, 1.542648, 0.7967302, 0, 0.1647059, 1, 1,
0.3558266, -1.553594, 3.992253, 0, 0.1607843, 1, 1,
0.3599097, -1.976542, 1.783726, 0, 0.1529412, 1, 1,
0.3602401, -0.34029, 1.239914, 0, 0.1490196, 1, 1,
0.3624036, 0.2930557, 0.1665849, 0, 0.1411765, 1, 1,
0.3644055, -0.9609361, 2.189945, 0, 0.1372549, 1, 1,
0.3675475, 1.155325, -0.6282799, 0, 0.1294118, 1, 1,
0.3680538, 1.301828, -1.462804, 0, 0.1254902, 1, 1,
0.3776517, -0.7939901, 2.119294, 0, 0.1176471, 1, 1,
0.3792678, -0.5120378, 4.257942, 0, 0.1137255, 1, 1,
0.3965899, 1.221178, 3.410717, 0, 0.1058824, 1, 1,
0.4076617, -2.056269, 2.813666, 0, 0.09803922, 1, 1,
0.4177397, 0.1571723, 0.9627458, 0, 0.09411765, 1, 1,
0.4191833, -1.066347, 3.111983, 0, 0.08627451, 1, 1,
0.4211266, 0.6534277, 1.345243, 0, 0.08235294, 1, 1,
0.4221129, 1.005957, -1.184469, 0, 0.07450981, 1, 1,
0.4295383, 0.2353327, -0.06533968, 0, 0.07058824, 1, 1,
0.4310352, -1.020288, 3.265514, 0, 0.0627451, 1, 1,
0.4310692, 1.451875, 0.8282437, 0, 0.05882353, 1, 1,
0.4380592, -1.441116, 1.269823, 0, 0.05098039, 1, 1,
0.4428483, 0.2459276, 0.807754, 0, 0.04705882, 1, 1,
0.4434166, 0.7909274, 0.02694719, 0, 0.03921569, 1, 1,
0.4469568, -0.04069415, 1.4623, 0, 0.03529412, 1, 1,
0.4509893, -1.963983, 5.666778, 0, 0.02745098, 1, 1,
0.4545209, 0.2320403, 1.159931, 0, 0.02352941, 1, 1,
0.4545764, 0.03596954, 1.589497, 0, 0.01568628, 1, 1,
0.4546645, -0.2627631, 2.12721, 0, 0.01176471, 1, 1,
0.4571847, -0.01464676, 4.422636, 0, 0.003921569, 1, 1,
0.4625178, -0.01391424, 1.22607, 0.003921569, 0, 1, 1,
0.4629025, -0.292388, 3.29128, 0.007843138, 0, 1, 1,
0.4672228, -0.02791506, 0.9280727, 0.01568628, 0, 1, 1,
0.4676606, -0.522097, 3.071047, 0.01960784, 0, 1, 1,
0.4701934, 1.02354, -1.386156, 0.02745098, 0, 1, 1,
0.4734757, -1.789406, 2.319337, 0.03137255, 0, 1, 1,
0.474263, -0.9729836, 4.30588, 0.03921569, 0, 1, 1,
0.4751099, -0.3107293, 2.640556, 0.04313726, 0, 1, 1,
0.4758162, -0.824253, 3.193902, 0.05098039, 0, 1, 1,
0.4785496, 0.6515419, 0.7127144, 0.05490196, 0, 1, 1,
0.4787455, -1.440531, 2.766143, 0.0627451, 0, 1, 1,
0.4794611, -0.1415315, 1.96127, 0.06666667, 0, 1, 1,
0.4876066, -1.231375, 2.564635, 0.07450981, 0, 1, 1,
0.4915821, -0.22633, 0.136573, 0.07843138, 0, 1, 1,
0.4941472, 1.271981, 0.1237171, 0.08627451, 0, 1, 1,
0.4967741, 0.192636, 2.375769, 0.09019608, 0, 1, 1,
0.4969829, 0.01723053, 0.2699752, 0.09803922, 0, 1, 1,
0.5010449, 1.962027, 0.6016577, 0.1058824, 0, 1, 1,
0.5023133, -0.1041089, 1.636964, 0.1098039, 0, 1, 1,
0.5023422, 0.3082215, 2.489075, 0.1176471, 0, 1, 1,
0.5096545, 0.2095823, 1.359203, 0.1215686, 0, 1, 1,
0.5097046, -0.8928381, 0.9921782, 0.1294118, 0, 1, 1,
0.5136169, -0.4564576, 1.524836, 0.1333333, 0, 1, 1,
0.5146442, 0.3038563, 1.49852, 0.1411765, 0, 1, 1,
0.5212406, 0.2492238, 0.8762588, 0.145098, 0, 1, 1,
0.528778, 0.3753588, 2.474266, 0.1529412, 0, 1, 1,
0.53331, 2.743133, 1.231282, 0.1568628, 0, 1, 1,
0.537281, -0.5540726, 2.782989, 0.1647059, 0, 1, 1,
0.5408411, -1.497788, 2.267927, 0.1686275, 0, 1, 1,
0.545273, -0.1039893, 2.891085, 0.1764706, 0, 1, 1,
0.5454392, 0.4387384, 1.29065, 0.1803922, 0, 1, 1,
0.5465721, 0.7885047, 0.1827469, 0.1882353, 0, 1, 1,
0.5493094, 0.0197746, 0.6162226, 0.1921569, 0, 1, 1,
0.5504057, 1.00172, 0.9794998, 0.2, 0, 1, 1,
0.5518304, -0.3441696, 1.66339, 0.2078431, 0, 1, 1,
0.5562738, -0.2806922, 1.001559, 0.2117647, 0, 1, 1,
0.5582419, -2.571963, 5.75765, 0.2196078, 0, 1, 1,
0.5592528, 0.2853722, 2.32831, 0.2235294, 0, 1, 1,
0.5596814, 0.9343355, 0.8609121, 0.2313726, 0, 1, 1,
0.5600465, -0.4363388, 3.251678, 0.2352941, 0, 1, 1,
0.562636, -0.2266873, 0.4574637, 0.2431373, 0, 1, 1,
0.5658966, 0.6606472, 0.3511521, 0.2470588, 0, 1, 1,
0.5670202, 2.279855, -0.1299674, 0.254902, 0, 1, 1,
0.567863, 1.14985, 0.5545493, 0.2588235, 0, 1, 1,
0.5680836, 0.3268145, 0.1744222, 0.2666667, 0, 1, 1,
0.5692047, -0.7826636, 1.938408, 0.2705882, 0, 1, 1,
0.5728582, 0.7217957, 1.309506, 0.2784314, 0, 1, 1,
0.5732247, 1.972212, 0.9344496, 0.282353, 0, 1, 1,
0.5807416, 0.4753957, 1.344109, 0.2901961, 0, 1, 1,
0.5840086, 1.400936, -1.29888, 0.2941177, 0, 1, 1,
0.5842931, 0.08453085, 1.809736, 0.3019608, 0, 1, 1,
0.5844916, -1.39589, 1.836155, 0.3098039, 0, 1, 1,
0.5855321, 1.505195, -0.1196674, 0.3137255, 0, 1, 1,
0.5903181, -0.172332, 1.515375, 0.3215686, 0, 1, 1,
0.5911145, -0.5674599, 1.685906, 0.3254902, 0, 1, 1,
0.5923402, -1.053591, 2.379773, 0.3333333, 0, 1, 1,
0.6056556, -0.0231191, 2.215887, 0.3372549, 0, 1, 1,
0.6082817, 1.282684, -0.836232, 0.345098, 0, 1, 1,
0.6112772, -1.4631, 2.42718, 0.3490196, 0, 1, 1,
0.612892, 0.4334767, -0.2855411, 0.3568628, 0, 1, 1,
0.6130257, -1.27847, 2.833525, 0.3607843, 0, 1, 1,
0.6150406, -0.06568855, 1.277532, 0.3686275, 0, 1, 1,
0.6203008, -0.1148495, 0.97631, 0.372549, 0, 1, 1,
0.6207728, -0.3511043, 3.720377, 0.3803922, 0, 1, 1,
0.6270127, -0.3469849, 1.862728, 0.3843137, 0, 1, 1,
0.6280249, 0.5885017, 0.5581433, 0.3921569, 0, 1, 1,
0.6305305, 1.219905, 1.711236, 0.3960784, 0, 1, 1,
0.6368015, 1.309167, 1.809652, 0.4039216, 0, 1, 1,
0.6399062, 1.328432, -0.5718399, 0.4117647, 0, 1, 1,
0.6400117, -1.78688, 2.311751, 0.4156863, 0, 1, 1,
0.6538919, 0.4860488, 0.6730657, 0.4235294, 0, 1, 1,
0.6636685, 1.268631, 1.553985, 0.427451, 0, 1, 1,
0.6641659, -0.9295605, 1.760199, 0.4352941, 0, 1, 1,
0.6657724, 0.2920827, 1.394043, 0.4392157, 0, 1, 1,
0.6677161, 0.3594438, 1.262164, 0.4470588, 0, 1, 1,
0.668052, 0.7992789, 1.081171, 0.4509804, 0, 1, 1,
0.6686778, -1.780983, 2.227251, 0.4588235, 0, 1, 1,
0.6714755, -1.083395, 2.806211, 0.4627451, 0, 1, 1,
0.6718799, -2.500849, 5.053607, 0.4705882, 0, 1, 1,
0.6838292, -0.1760554, 0.8309457, 0.4745098, 0, 1, 1,
0.6857455, 0.1402318, 1.802275, 0.4823529, 0, 1, 1,
0.6890058, -0.1517223, 1.440789, 0.4862745, 0, 1, 1,
0.6921337, -0.4728464, 3.925867, 0.4941176, 0, 1, 1,
0.6931404, 1.006674, -0.141628, 0.5019608, 0, 1, 1,
0.6955121, 1.036844, 2.315642, 0.5058824, 0, 1, 1,
0.6957834, -0.4538858, 3.728273, 0.5137255, 0, 1, 1,
0.699154, 1.476393, 0.7989517, 0.5176471, 0, 1, 1,
0.7011818, 0.3332124, 0.1512188, 0.5254902, 0, 1, 1,
0.7083174, -0.1226855, 0.2424842, 0.5294118, 0, 1, 1,
0.7167003, 0.9400103, 0.6355478, 0.5372549, 0, 1, 1,
0.721779, -0.5978096, 3.124981, 0.5411765, 0, 1, 1,
0.7273905, 1.056229, -1.474383, 0.5490196, 0, 1, 1,
0.7371832, -0.8103519, 4.266522, 0.5529412, 0, 1, 1,
0.7408408, -0.7816402, 2.688245, 0.5607843, 0, 1, 1,
0.7437254, 0.1732941, 2.247502, 0.5647059, 0, 1, 1,
0.7552508, -0.4646611, 0.5937815, 0.572549, 0, 1, 1,
0.7561553, 0.2810559, -1.531858, 0.5764706, 0, 1, 1,
0.7634255, 0.9777553, 0.2535969, 0.5843138, 0, 1, 1,
0.7636406, -1.195501, 3.044637, 0.5882353, 0, 1, 1,
0.7724944, -0.5309621, 2.520205, 0.5960785, 0, 1, 1,
0.7802862, 0.3965913, 1.797656, 0.6039216, 0, 1, 1,
0.7839947, -0.8745947, 0.3029959, 0.6078432, 0, 1, 1,
0.7844533, -1.678328, 2.770697, 0.6156863, 0, 1, 1,
0.7873067, -0.2276082, 1.159254, 0.6196079, 0, 1, 1,
0.7919142, 2.382908, 1.104537, 0.627451, 0, 1, 1,
0.7990165, 0.9282174, 3.123403, 0.6313726, 0, 1, 1,
0.8022804, 0.6414847, 0.457883, 0.6392157, 0, 1, 1,
0.804231, 0.4945099, 1.541069, 0.6431373, 0, 1, 1,
0.8097798, 0.6701226, 2.446057, 0.6509804, 0, 1, 1,
0.8126739, -1.119258, 2.889163, 0.654902, 0, 1, 1,
0.8176997, -0.5730456, 1.66257, 0.6627451, 0, 1, 1,
0.8289769, -0.386557, 1.504394, 0.6666667, 0, 1, 1,
0.8326548, -0.4583131, 1.911692, 0.6745098, 0, 1, 1,
0.8333678, -0.113863, 1.400461, 0.6784314, 0, 1, 1,
0.8394954, 1.444742, 0.7253484, 0.6862745, 0, 1, 1,
0.8432441, -0.1103885, 2.240357, 0.6901961, 0, 1, 1,
0.8446798, 0.5118597, 2.213598, 0.6980392, 0, 1, 1,
0.8560029, 0.1914338, 2.734588, 0.7058824, 0, 1, 1,
0.857081, -0.1110655, 2.335873, 0.7098039, 0, 1, 1,
0.8573305, 1.676613, 1.148911, 0.7176471, 0, 1, 1,
0.8579252, -0.1870209, 0.6634387, 0.7215686, 0, 1, 1,
0.859006, 1.477207, 2.161573, 0.7294118, 0, 1, 1,
0.8596527, 2.166618, 1.144271, 0.7333333, 0, 1, 1,
0.8638979, 1.301629, 0.9611875, 0.7411765, 0, 1, 1,
0.8646739, 0.7248302, 0.262553, 0.7450981, 0, 1, 1,
0.865306, -1.12673, 2.424864, 0.7529412, 0, 1, 1,
0.8653204, 0.1315824, 1.476536, 0.7568628, 0, 1, 1,
0.8706406, 0.8060144, 2.673299, 0.7647059, 0, 1, 1,
0.8741056, -1.912602, 3.263137, 0.7686275, 0, 1, 1,
0.8760487, 0.2253994, 2.299036, 0.7764706, 0, 1, 1,
0.8793013, 0.8613883, 2.600334, 0.7803922, 0, 1, 1,
0.88013, 0.2036721, 2.401603, 0.7882353, 0, 1, 1,
0.8802987, 1.474108, 1.541394, 0.7921569, 0, 1, 1,
0.8819574, -0.2858546, 2.619089, 0.8, 0, 1, 1,
0.8831879, -0.7194422, 2.402434, 0.8078431, 0, 1, 1,
0.8855908, -0.8436826, 2.716002, 0.8117647, 0, 1, 1,
0.8896862, 1.582802, -0.9276238, 0.8196079, 0, 1, 1,
0.8896895, -0.5394238, 1.909643, 0.8235294, 0, 1, 1,
0.8933576, 0.3874077, 0.7755162, 0.8313726, 0, 1, 1,
0.8949412, 0.2605129, 0.8986018, 0.8352941, 0, 1, 1,
0.8993901, 1.294052, 0.04036061, 0.8431373, 0, 1, 1,
0.9070239, 2.820884, -0.2384532, 0.8470588, 0, 1, 1,
0.912211, 0.6988695, 1.631519, 0.854902, 0, 1, 1,
0.9176728, 0.7626415, 0.8575206, 0.8588235, 0, 1, 1,
0.9273946, 1.278711, 2.742824, 0.8666667, 0, 1, 1,
0.9314729, 1.439765, 0.3399353, 0.8705882, 0, 1, 1,
0.9336815, 1.756755, 1.009104, 0.8784314, 0, 1, 1,
0.9362484, 0.2453061, 0.8966072, 0.8823529, 0, 1, 1,
0.9414724, -0.2454471, 1.34712, 0.8901961, 0, 1, 1,
0.9418591, -1.270217, 2.943473, 0.8941177, 0, 1, 1,
0.9444147, 0.9984707, 1.220471, 0.9019608, 0, 1, 1,
0.9509302, -1.220652, 2.002694, 0.9098039, 0, 1, 1,
0.9528709, 0.07741565, 2.058226, 0.9137255, 0, 1, 1,
0.9531679, 0.003658795, 2.351464, 0.9215686, 0, 1, 1,
0.9583477, -0.2604575, 3.270457, 0.9254902, 0, 1, 1,
0.9694923, 0.4973861, 1.307943, 0.9333333, 0, 1, 1,
0.9696584, -1.080881, 1.810452, 0.9372549, 0, 1, 1,
0.9761021, 0.1178998, 2.98021, 0.945098, 0, 1, 1,
0.9765257, 0.3845781, 0.1005521, 0.9490196, 0, 1, 1,
0.9792025, 0.7167277, 0.1833324, 0.9568627, 0, 1, 1,
0.987361, 0.5364826, -0.3392519, 0.9607843, 0, 1, 1,
0.9888743, 0.3524225, 1.353725, 0.9686275, 0, 1, 1,
0.9896426, -0.9411945, 2.250582, 0.972549, 0, 1, 1,
0.9934673, 0.01833159, 0.5366446, 0.9803922, 0, 1, 1,
0.9943991, -1.22833, 1.70842, 0.9843137, 0, 1, 1,
0.9956803, -1.410411, 3.167857, 0.9921569, 0, 1, 1,
0.9984827, -1.138783, 2.091967, 0.9960784, 0, 1, 1,
1.003752, 0.3900142, 0.4988885, 1, 0, 0.9960784, 1,
1.006283, 0.9886633, 1.898658, 1, 0, 0.9882353, 1,
1.01362, -0.06531455, 1.141191, 1, 0, 0.9843137, 1,
1.016279, -0.3311133, 2.765292, 1, 0, 0.9764706, 1,
1.025388, -0.4066447, 1.694497, 1, 0, 0.972549, 1,
1.026182, 1.983101, 0.5521266, 1, 0, 0.9647059, 1,
1.026699, 0.3933661, 2.816432, 1, 0, 0.9607843, 1,
1.037388, -1.429771, 3.836284, 1, 0, 0.9529412, 1,
1.039822, 1.413547, 1.640156, 1, 0, 0.9490196, 1,
1.040199, -0.9273102, 3.06776, 1, 0, 0.9411765, 1,
1.053018, 2.21368, 1.581578, 1, 0, 0.9372549, 1,
1.053292, -0.3360495, 1.054596, 1, 0, 0.9294118, 1,
1.058265, -0.6946355, 1.450949, 1, 0, 0.9254902, 1,
1.059955, 0.08022624, 2.220614, 1, 0, 0.9176471, 1,
1.066424, 0.6021138, -0.4935435, 1, 0, 0.9137255, 1,
1.069365, 1.073507, 0.6570612, 1, 0, 0.9058824, 1,
1.071137, 1.316854, -0.3309443, 1, 0, 0.9019608, 1,
1.077064, 0.4839199, 1.343604, 1, 0, 0.8941177, 1,
1.0897, 0.2278818, 2.114452, 1, 0, 0.8862745, 1,
1.096418, 0.07388915, 1.649555, 1, 0, 0.8823529, 1,
1.102239, 1.822341, -0.298299, 1, 0, 0.8745098, 1,
1.109583, -0.06681172, 2.668011, 1, 0, 0.8705882, 1,
1.113669, -1.438075, 3.778236, 1, 0, 0.8627451, 1,
1.126399, 0.3490317, 0.395682, 1, 0, 0.8588235, 1,
1.126614, 0.5194631, 2.325036, 1, 0, 0.8509804, 1,
1.126634, 0.1596825, 0.3904596, 1, 0, 0.8470588, 1,
1.127828, 1.424256, -1.108749, 1, 0, 0.8392157, 1,
1.13302, 0.3986772, 2.154341, 1, 0, 0.8352941, 1,
1.133515, 0.8210101, 0.599649, 1, 0, 0.827451, 1,
1.133832, 0.7191375, 2.256652, 1, 0, 0.8235294, 1,
1.140352, -0.2260244, 1.444849, 1, 0, 0.8156863, 1,
1.141161, 0.8545308, 1.683157, 1, 0, 0.8117647, 1,
1.143913, -2.01174, 1.883601, 1, 0, 0.8039216, 1,
1.14761, -0.9300151, 1.654347, 1, 0, 0.7960784, 1,
1.148124, -0.2281841, 0.3733513, 1, 0, 0.7921569, 1,
1.151277, -0.05172414, 1.308946, 1, 0, 0.7843137, 1,
1.152272, 0.2467022, 1.634522, 1, 0, 0.7803922, 1,
1.15482, 0.1240932, 1.973258, 1, 0, 0.772549, 1,
1.157415, -0.5489067, 0.5733309, 1, 0, 0.7686275, 1,
1.168497, -2.403667, 2.935386, 1, 0, 0.7607843, 1,
1.17427, 2.108048, 1.109853, 1, 0, 0.7568628, 1,
1.176416, 1.272263, 0.5142144, 1, 0, 0.7490196, 1,
1.176991, 0.878313, -1.14839, 1, 0, 0.7450981, 1,
1.177772, -2.01894, 1.733512, 1, 0, 0.7372549, 1,
1.178472, 0.1250511, -0.06470159, 1, 0, 0.7333333, 1,
1.184194, 0.540425, 0.6840264, 1, 0, 0.7254902, 1,
1.192274, -1.272425, 1.421256, 1, 0, 0.7215686, 1,
1.211733, -1.063815, 3.904254, 1, 0, 0.7137255, 1,
1.221277, -0.6042118, 1.30934, 1, 0, 0.7098039, 1,
1.224585, -0.087184, 1.48317, 1, 0, 0.7019608, 1,
1.224946, -0.5485175, 1.239565, 1, 0, 0.6941177, 1,
1.230817, 0.7543873, -0.4886776, 1, 0, 0.6901961, 1,
1.235915, 0.0640678, 1.970511, 1, 0, 0.682353, 1,
1.23752, -2.380631, 1.952033, 1, 0, 0.6784314, 1,
1.240666, 0.708689, 0.2794838, 1, 0, 0.6705883, 1,
1.244231, 0.1184501, 2.101024, 1, 0, 0.6666667, 1,
1.277722, 0.2738319, 2.55889, 1, 0, 0.6588235, 1,
1.285982, -1.269657, 1.050566, 1, 0, 0.654902, 1,
1.28611, -0.8563187, 1.963192, 1, 0, 0.6470588, 1,
1.306625, 0.425737, 1.952502, 1, 0, 0.6431373, 1,
1.306948, 1.50781, 0.1233192, 1, 0, 0.6352941, 1,
1.312011, 1.172093, 0.4315276, 1, 0, 0.6313726, 1,
1.313452, 1.303848, 1.148727, 1, 0, 0.6235294, 1,
1.313907, -2.186079, 2.961862, 1, 0, 0.6196079, 1,
1.314568, 0.7704688, 0.1480177, 1, 0, 0.6117647, 1,
1.319671, -1.236666, 3.147554, 1, 0, 0.6078432, 1,
1.321443, 0.55864, 2.056075, 1, 0, 0.6, 1,
1.321786, 0.2517571, 0.3477455, 1, 0, 0.5921569, 1,
1.325102, -0.0003553645, 2.411268, 1, 0, 0.5882353, 1,
1.332777, -0.8442946, 1.723318, 1, 0, 0.5803922, 1,
1.365221, 2.167259, 0.9341637, 1, 0, 0.5764706, 1,
1.371009, -0.173185, 1.086286, 1, 0, 0.5686275, 1,
1.373595, 0.005624939, -0.371962, 1, 0, 0.5647059, 1,
1.381366, 0.2690538, 1.503798, 1, 0, 0.5568628, 1,
1.390253, -0.09304276, 2.070575, 1, 0, 0.5529412, 1,
1.395786, -0.3594857, 2.184723, 1, 0, 0.5450981, 1,
1.402256, -2.312588, 2.385741, 1, 0, 0.5411765, 1,
1.403352, -2.157927, 2.367298, 1, 0, 0.5333334, 1,
1.40557, 0.678043, 2.009094, 1, 0, 0.5294118, 1,
1.40919, 0.4217858, 0.9185355, 1, 0, 0.5215687, 1,
1.428185, -0.9661817, 1.39067, 1, 0, 0.5176471, 1,
1.433706, 0.7975984, 0.4492131, 1, 0, 0.509804, 1,
1.436903, 1.059625, 1.191716, 1, 0, 0.5058824, 1,
1.441583, -2.355362, 1.805252, 1, 0, 0.4980392, 1,
1.442322, -0.792788, 1.98786, 1, 0, 0.4901961, 1,
1.445755, -0.9531102, -0.1983172, 1, 0, 0.4862745, 1,
1.446744, 0.3792903, 1.578723, 1, 0, 0.4784314, 1,
1.455006, 0.4606521, 1.864437, 1, 0, 0.4745098, 1,
1.462839, -1.272461, 2.560178, 1, 0, 0.4666667, 1,
1.463269, 1.51285, 0.7037072, 1, 0, 0.4627451, 1,
1.469882, 0.4506785, 2.117173, 1, 0, 0.454902, 1,
1.478056, 0.4274044, 1.828415, 1, 0, 0.4509804, 1,
1.486771, 0.02268765, 2.091268, 1, 0, 0.4431373, 1,
1.492688, 0.2554925, 0.8227041, 1, 0, 0.4392157, 1,
1.495969, -0.1455776, 2.439544, 1, 0, 0.4313726, 1,
1.506078, -1.442151, 2.340084, 1, 0, 0.427451, 1,
1.507005, -0.8765041, 0.2892472, 1, 0, 0.4196078, 1,
1.512589, 0.5555624, 1.152028, 1, 0, 0.4156863, 1,
1.521075, -0.8709335, 3.179338, 1, 0, 0.4078431, 1,
1.540096, -1.74827, 3.037253, 1, 0, 0.4039216, 1,
1.543129, -1.019043, 0.59171, 1, 0, 0.3960784, 1,
1.558644, -0.467622, 2.920439, 1, 0, 0.3882353, 1,
1.567275, 1.357824, 1.138423, 1, 0, 0.3843137, 1,
1.568947, 0.4468567, -0.1604831, 1, 0, 0.3764706, 1,
1.572057, -0.2183377, 1.607907, 1, 0, 0.372549, 1,
1.572361, -0.1858485, 0.7636247, 1, 0, 0.3647059, 1,
1.593422, 0.1431566, 1.957994, 1, 0, 0.3607843, 1,
1.611023, -0.1583608, 1.109994, 1, 0, 0.3529412, 1,
1.615115, 0.01958605, 2.014588, 1, 0, 0.3490196, 1,
1.624312, 1.694514, 1.3516, 1, 0, 0.3411765, 1,
1.627525, 0.1166837, 0.8163923, 1, 0, 0.3372549, 1,
1.635713, 0.6273659, 1.666818, 1, 0, 0.3294118, 1,
1.643351, -0.2739237, 1.570078, 1, 0, 0.3254902, 1,
1.648561, -0.2534862, -0.8717275, 1, 0, 0.3176471, 1,
1.65472, -0.3342555, 0.8262735, 1, 0, 0.3137255, 1,
1.674025, -0.8190953, 2.475603, 1, 0, 0.3058824, 1,
1.674125, 1.114526, 1.20126, 1, 0, 0.2980392, 1,
1.678228, 0.5847457, 0.7036186, 1, 0, 0.2941177, 1,
1.687349, -0.1814199, 0.8936439, 1, 0, 0.2862745, 1,
1.690512, -0.0592996, 0.8860648, 1, 0, 0.282353, 1,
1.698854, -1.347726, 2.534605, 1, 0, 0.2745098, 1,
1.702858, 0.2259573, 0.4780664, 1, 0, 0.2705882, 1,
1.704403, -0.582743, 2.699059, 1, 0, 0.2627451, 1,
1.717569, 0.3568305, -0.3044998, 1, 0, 0.2588235, 1,
1.734563, -0.657669, 1.407446, 1, 0, 0.2509804, 1,
1.738149, 1.589652, 0.1562117, 1, 0, 0.2470588, 1,
1.741397, 0.328264, 2.094165, 1, 0, 0.2392157, 1,
1.751285, 1.38079, 0.8900107, 1, 0, 0.2352941, 1,
1.770097, -0.2131725, 3.619409, 1, 0, 0.227451, 1,
1.781039, 1.306824, -0.5705975, 1, 0, 0.2235294, 1,
1.782008, 1.274878, 0.8267593, 1, 0, 0.2156863, 1,
1.799742, 1.581592, 1.902903, 1, 0, 0.2117647, 1,
1.810728, 0.848087, 1.097527, 1, 0, 0.2039216, 1,
1.81485, -0.9288362, 3.551527, 1, 0, 0.1960784, 1,
1.815541, -1.196611, 2.845928, 1, 0, 0.1921569, 1,
1.819177, 1.159782, 0.8188381, 1, 0, 0.1843137, 1,
1.834694, 0.7623057, 2.012426, 1, 0, 0.1803922, 1,
1.836647, -0.1878491, -0.5645563, 1, 0, 0.172549, 1,
1.842876, -0.4171484, 0.866873, 1, 0, 0.1686275, 1,
1.857318, -0.5378312, 1.582225, 1, 0, 0.1607843, 1,
1.870657, 0.4200614, 2.505669, 1, 0, 0.1568628, 1,
1.901453, -0.8255513, 3.44345, 1, 0, 0.1490196, 1,
1.909157, 0.4703398, 0.9564003, 1, 0, 0.145098, 1,
1.950185, -0.6353226, 2.51367, 1, 0, 0.1372549, 1,
1.978353, -0.1124301, 1.86326, 1, 0, 0.1333333, 1,
2.000656, 1.786821, 0.8695803, 1, 0, 0.1254902, 1,
2.007464, -1.481963, 2.263078, 1, 0, 0.1215686, 1,
2.041231, -1.116244, 1.873798, 1, 0, 0.1137255, 1,
2.072424, -0.1522915, 2.76938, 1, 0, 0.1098039, 1,
2.085662, 1.000322, 0.7214892, 1, 0, 0.1019608, 1,
2.089186, 0.279653, 1.876413, 1, 0, 0.09411765, 1,
2.124744, 0.1016995, 1.053199, 1, 0, 0.09019608, 1,
2.128629, -0.2887792, 1.994545, 1, 0, 0.08235294, 1,
2.141785, -1.150165, 2.967197, 1, 0, 0.07843138, 1,
2.210789, -1.099364, -0.6796719, 1, 0, 0.07058824, 1,
2.263661, 1.483652, 0.2631985, 1, 0, 0.06666667, 1,
2.298729, -1.664848, 2.346965, 1, 0, 0.05882353, 1,
2.340397, 0.4412658, 1.190228, 1, 0, 0.05490196, 1,
2.387425, -0.8753186, -0.1045293, 1, 0, 0.04705882, 1,
2.391506, 2.396378, 0.8616453, 1, 0, 0.04313726, 1,
2.417594, 0.9566425, -0.247934, 1, 0, 0.03529412, 1,
2.457764, -2.762168, 2.834631, 1, 0, 0.03137255, 1,
2.544635, 0.1523378, 2.800402, 1, 0, 0.02352941, 1,
2.588267, -0.3222019, 2.405334, 1, 0, 0.01960784, 1,
2.866212, -0.3464829, 1.604088, 1, 0, 0.01176471, 1,
2.968772, 0.3304964, -0.1651262, 1, 0, 0.007843138, 1
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
-0.02941537, -3.774158, -7.657702, 0, -0.5, 0.5, 0.5,
-0.02941537, -3.774158, -7.657702, 1, -0.5, 0.5, 0.5,
-0.02941537, -3.774158, -7.657702, 1, 1.5, 0.5, 0.5,
-0.02941537, -3.774158, -7.657702, 0, 1.5, 0.5, 0.5
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
-4.043988, 0.2230552, -7.657702, 0, -0.5, 0.5, 0.5,
-4.043988, 0.2230552, -7.657702, 1, -0.5, 0.5, 0.5,
-4.043988, 0.2230552, -7.657702, 1, 1.5, 0.5, 0.5,
-4.043988, 0.2230552, -7.657702, 0, 1.5, 0.5, 0.5
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
-4.043988, -3.774158, 0.02214265, 0, -0.5, 0.5, 0.5,
-4.043988, -3.774158, 0.02214265, 1, -0.5, 0.5, 0.5,
-4.043988, -3.774158, 0.02214265, 1, 1.5, 0.5, 0.5,
-4.043988, -3.774158, 0.02214265, 0, 1.5, 0.5, 0.5
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
-3, -2.851725, -5.88543,
2, -2.851725, -5.88543,
-3, -2.851725, -5.88543,
-3, -3.005464, -6.180809,
-2, -2.851725, -5.88543,
-2, -3.005464, -6.180809,
-1, -2.851725, -5.88543,
-1, -3.005464, -6.180809,
0, -2.851725, -5.88543,
0, -3.005464, -6.180809,
1, -2.851725, -5.88543,
1, -3.005464, -6.180809,
2, -2.851725, -5.88543,
2, -3.005464, -6.180809
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
"-3",
"-2",
"-1",
"0",
"1",
"2"
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
-3, -3.312942, -6.771566, 0, -0.5, 0.5, 0.5,
-3, -3.312942, -6.771566, 1, -0.5, 0.5, 0.5,
-3, -3.312942, -6.771566, 1, 1.5, 0.5, 0.5,
-3, -3.312942, -6.771566, 0, 1.5, 0.5, 0.5,
-2, -3.312942, -6.771566, 0, -0.5, 0.5, 0.5,
-2, -3.312942, -6.771566, 1, -0.5, 0.5, 0.5,
-2, -3.312942, -6.771566, 1, 1.5, 0.5, 0.5,
-2, -3.312942, -6.771566, 0, 1.5, 0.5, 0.5,
-1, -3.312942, -6.771566, 0, -0.5, 0.5, 0.5,
-1, -3.312942, -6.771566, 1, -0.5, 0.5, 0.5,
-1, -3.312942, -6.771566, 1, 1.5, 0.5, 0.5,
-1, -3.312942, -6.771566, 0, 1.5, 0.5, 0.5,
0, -3.312942, -6.771566, 0, -0.5, 0.5, 0.5,
0, -3.312942, -6.771566, 1, -0.5, 0.5, 0.5,
0, -3.312942, -6.771566, 1, 1.5, 0.5, 0.5,
0, -3.312942, -6.771566, 0, 1.5, 0.5, 0.5,
1, -3.312942, -6.771566, 0, -0.5, 0.5, 0.5,
1, -3.312942, -6.771566, 1, -0.5, 0.5, 0.5,
1, -3.312942, -6.771566, 1, 1.5, 0.5, 0.5,
1, -3.312942, -6.771566, 0, 1.5, 0.5, 0.5,
2, -3.312942, -6.771566, 0, -0.5, 0.5, 0.5,
2, -3.312942, -6.771566, 1, -0.5, 0.5, 0.5,
2, -3.312942, -6.771566, 1, 1.5, 0.5, 0.5,
2, -3.312942, -6.771566, 0, 1.5, 0.5, 0.5
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
-3.117548, -2, -5.88543,
-3.117548, 3, -5.88543,
-3.117548, -2, -5.88543,
-3.271955, -2, -6.180809,
-3.117548, -1, -5.88543,
-3.271955, -1, -6.180809,
-3.117548, 0, -5.88543,
-3.271955, 0, -6.180809,
-3.117548, 1, -5.88543,
-3.271955, 1, -6.180809,
-3.117548, 2, -5.88543,
-3.271955, 2, -6.180809,
-3.117548, 3, -5.88543,
-3.271955, 3, -6.180809
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
"-2",
"-1",
"0",
"1",
"2",
"3"
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
-3.580768, -2, -6.771566, 0, -0.5, 0.5, 0.5,
-3.580768, -2, -6.771566, 1, -0.5, 0.5, 0.5,
-3.580768, -2, -6.771566, 1, 1.5, 0.5, 0.5,
-3.580768, -2, -6.771566, 0, 1.5, 0.5, 0.5,
-3.580768, -1, -6.771566, 0, -0.5, 0.5, 0.5,
-3.580768, -1, -6.771566, 1, -0.5, 0.5, 0.5,
-3.580768, -1, -6.771566, 1, 1.5, 0.5, 0.5,
-3.580768, -1, -6.771566, 0, 1.5, 0.5, 0.5,
-3.580768, 0, -6.771566, 0, -0.5, 0.5, 0.5,
-3.580768, 0, -6.771566, 1, -0.5, 0.5, 0.5,
-3.580768, 0, -6.771566, 1, 1.5, 0.5, 0.5,
-3.580768, 0, -6.771566, 0, 1.5, 0.5, 0.5,
-3.580768, 1, -6.771566, 0, -0.5, 0.5, 0.5,
-3.580768, 1, -6.771566, 1, -0.5, 0.5, 0.5,
-3.580768, 1, -6.771566, 1, 1.5, 0.5, 0.5,
-3.580768, 1, -6.771566, 0, 1.5, 0.5, 0.5,
-3.580768, 2, -6.771566, 0, -0.5, 0.5, 0.5,
-3.580768, 2, -6.771566, 1, -0.5, 0.5, 0.5,
-3.580768, 2, -6.771566, 1, 1.5, 0.5, 0.5,
-3.580768, 2, -6.771566, 0, 1.5, 0.5, 0.5,
-3.580768, 3, -6.771566, 0, -0.5, 0.5, 0.5,
-3.580768, 3, -6.771566, 1, -0.5, 0.5, 0.5,
-3.580768, 3, -6.771566, 1, 1.5, 0.5, 0.5,
-3.580768, 3, -6.771566, 0, 1.5, 0.5, 0.5
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
-3.117548, -2.851725, -4,
-3.117548, -2.851725, 4,
-3.117548, -2.851725, -4,
-3.271955, -3.005464, -4,
-3.117548, -2.851725, -2,
-3.271955, -3.005464, -2,
-3.117548, -2.851725, 0,
-3.271955, -3.005464, 0,
-3.117548, -2.851725, 2,
-3.271955, -3.005464, 2,
-3.117548, -2.851725, 4,
-3.271955, -3.005464, 4
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
"4"
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
-3.580768, -3.312942, -4, 0, -0.5, 0.5, 0.5,
-3.580768, -3.312942, -4, 1, -0.5, 0.5, 0.5,
-3.580768, -3.312942, -4, 1, 1.5, 0.5, 0.5,
-3.580768, -3.312942, -4, 0, 1.5, 0.5, 0.5,
-3.580768, -3.312942, -2, 0, -0.5, 0.5, 0.5,
-3.580768, -3.312942, -2, 1, -0.5, 0.5, 0.5,
-3.580768, -3.312942, -2, 1, 1.5, 0.5, 0.5,
-3.580768, -3.312942, -2, 0, 1.5, 0.5, 0.5,
-3.580768, -3.312942, 0, 0, -0.5, 0.5, 0.5,
-3.580768, -3.312942, 0, 1, -0.5, 0.5, 0.5,
-3.580768, -3.312942, 0, 1, 1.5, 0.5, 0.5,
-3.580768, -3.312942, 0, 0, 1.5, 0.5, 0.5,
-3.580768, -3.312942, 2, 0, -0.5, 0.5, 0.5,
-3.580768, -3.312942, 2, 1, -0.5, 0.5, 0.5,
-3.580768, -3.312942, 2, 1, 1.5, 0.5, 0.5,
-3.580768, -3.312942, 2, 0, 1.5, 0.5, 0.5,
-3.580768, -3.312942, 4, 0, -0.5, 0.5, 0.5,
-3.580768, -3.312942, 4, 1, -0.5, 0.5, 0.5,
-3.580768, -3.312942, 4, 1, 1.5, 0.5, 0.5,
-3.580768, -3.312942, 4, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<5; i++) 
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
16, 17, 18, 16, 18, 19
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
-3.117548, -2.851725, -5.88543,
-3.117548, 3.297835, -5.88543,
-3.117548, -2.851725, 5.929716,
-3.117548, 3.297835, 5.929716,
-3.117548, -2.851725, -5.88543,
-3.117548, -2.851725, 5.929716,
-3.117548, 3.297835, -5.88543,
-3.117548, 3.297835, 5.929716,
-3.117548, -2.851725, -5.88543,
3.058717, -2.851725, -5.88543,
-3.117548, -2.851725, 5.929716,
3.058717, -2.851725, 5.929716,
-3.117548, 3.297835, -5.88543,
3.058717, 3.297835, -5.88543,
-3.117548, 3.297835, 5.929716,
3.058717, 3.297835, 5.929716,
3.058717, -2.851725, -5.88543,
3.058717, 3.297835, -5.88543,
3.058717, -2.851725, 5.929716,
3.058717, 3.297835, 5.929716,
3.058717, -2.851725, -5.88543,
3.058717, -2.851725, 5.929716,
3.058717, 3.297835, -5.88543,
3.058717, 3.297835, 5.929716
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
var radius = 7.839901;
var distance = 34.8806;
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
mvMatrix.translate( 0.02941537, -0.2230552, -0.02214265 );
mvMatrix.scale( 1.372456, 1.378416, 0.7174397 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.8806);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
Methyl_formate<-read.table("Methyl_formate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Methyl_formate$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_formate' not found
```

```r
y<-Methyl_formate$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_formate' not found
```

```r
z<-Methyl_formate$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_formate' not found
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
-3.027602, -0.1521599, -1.790303, 0, 0, 1, 1, 1,
-2.800166, -0.8454964, -0.9963912, 1, 0, 0, 1, 1,
-2.677559, 0.9432653, -2.869407, 1, 0, 0, 1, 1,
-2.668531, -1.203435, -4.198615, 1, 0, 0, 1, 1,
-2.566923, -0.06479155, -2.018764, 1, 0, 0, 1, 1,
-2.558452, -0.4267614, -2.068723, 1, 0, 0, 1, 1,
-2.543398, 0.1946925, 0.2176715, 0, 0, 0, 1, 1,
-2.523362, -0.005842828, -1.848123, 0, 0, 0, 1, 1,
-2.441002, 0.7606406, -2.217485, 0, 0, 0, 1, 1,
-2.433173, -0.989658, -3.017349, 0, 0, 0, 1, 1,
-2.410588, -1.627053, -3.083303, 0, 0, 0, 1, 1,
-2.363033, -1.755467, -3.350331, 0, 0, 0, 1, 1,
-2.358135, -0.3769825, -2.047461, 0, 0, 0, 1, 1,
-2.341107, -1.748364, -3.441402, 1, 1, 1, 1, 1,
-2.269411, 0.5096979, -2.399851, 1, 1, 1, 1, 1,
-2.196504, 0.6720304, -0.8193428, 1, 1, 1, 1, 1,
-2.189475, -0.878142, -1.413337, 1, 1, 1, 1, 1,
-2.17867, 0.504315, -0.2483858, 1, 1, 1, 1, 1,
-2.171494, 0.9093358, -2.31572, 1, 1, 1, 1, 1,
-2.166877, 0.2337582, 0.3393551, 1, 1, 1, 1, 1,
-2.157695, -0.0239828, -1.830828, 1, 1, 1, 1, 1,
-2.143716, -1.717541, -2.920568, 1, 1, 1, 1, 1,
-2.139476, -0.6475888, -2.54183, 1, 1, 1, 1, 1,
-2.131412, 0.517123, -2.52408, 1, 1, 1, 1, 1,
-2.111734, 1.849507, -0.9872789, 1, 1, 1, 1, 1,
-2.086013, 0.005005472, -3.753862, 1, 1, 1, 1, 1,
-2.08273, -0.05778538, -2.788952, 1, 1, 1, 1, 1,
-2.056539, -1.62059, -2.372094, 1, 1, 1, 1, 1,
-2.053794, 0.866411, -1.939071, 0, 0, 1, 1, 1,
-2.047956, -1.125982, -1.892325, 1, 0, 0, 1, 1,
-2.045691, 2.145059, 0.3837423, 1, 0, 0, 1, 1,
-2.026816, -1.27661, -2.379511, 1, 0, 0, 1, 1,
-2.01186, 0.6846284, -2.237733, 1, 0, 0, 1, 1,
-1.992813, -0.3077732, -2.92986, 1, 0, 0, 1, 1,
-1.990475, -2.424006, -2.610546, 0, 0, 0, 1, 1,
-1.981306, 0.3383611, -0.8657724, 0, 0, 0, 1, 1,
-1.976133, 1.206392, -0.4147586, 0, 0, 0, 1, 1,
-1.959365, -1.073631, -4.246358, 0, 0, 0, 1, 1,
-1.955393, -1.585954, -3.131518, 0, 0, 0, 1, 1,
-1.922217, 1.354771, -1.826231, 0, 0, 0, 1, 1,
-1.920669, 0.5312629, -0.6360549, 0, 0, 0, 1, 1,
-1.887919, -2.29901, -4.385657, 1, 1, 1, 1, 1,
-1.853549, 0.3649096, -0.1680884, 1, 1, 1, 1, 1,
-1.843814, -0.2053661, -0.8027101, 1, 1, 1, 1, 1,
-1.843204, 0.4734037, 0.02891251, 1, 1, 1, 1, 1,
-1.84188, -0.3784898, -2.287629, 1, 1, 1, 1, 1,
-1.837633, -1.12095, -2.051294, 1, 1, 1, 1, 1,
-1.830176, -0.5288324, -2.041193, 1, 1, 1, 1, 1,
-1.820015, 1.139904, -0.7607595, 1, 1, 1, 1, 1,
-1.812108, -0.8634612, -1.435227, 1, 1, 1, 1, 1,
-1.802358, 0.3021649, -1.47134, 1, 1, 1, 1, 1,
-1.798491, -0.83078, -0.8664206, 1, 1, 1, 1, 1,
-1.797221, -1.112257, -2.790994, 1, 1, 1, 1, 1,
-1.788256, 0.5803863, -0.2651524, 1, 1, 1, 1, 1,
-1.782836, 1.271373, -0.9385762, 1, 1, 1, 1, 1,
-1.739969, 0.2869051, -1.269333, 1, 1, 1, 1, 1,
-1.716036, 0.05235905, -1.707233, 0, 0, 1, 1, 1,
-1.693947, 1.346029, -0.3715187, 1, 0, 0, 1, 1,
-1.685535, -0.5858612, 0.5394124, 1, 0, 0, 1, 1,
-1.679638, -1.758354, -2.475275, 1, 0, 0, 1, 1,
-1.652912, 0.7083348, 0.8742766, 1, 0, 0, 1, 1,
-1.634578, 0.55906, -1.070067, 1, 0, 0, 1, 1,
-1.629365, -0.3246472, -0.987743, 0, 0, 0, 1, 1,
-1.614488, 0.729768, -0.2710226, 0, 0, 0, 1, 1,
-1.611027, 2.201913, -0.5434293, 0, 0, 0, 1, 1,
-1.606568, -0.443559, -0.1159598, 0, 0, 0, 1, 1,
-1.60085, 0.0242367, -1.417994, 0, 0, 0, 1, 1,
-1.580045, -1.214069, -1.572143, 0, 0, 0, 1, 1,
-1.579693, 0.1812792, -2.567689, 0, 0, 0, 1, 1,
-1.578907, 0.851441, -1.641935, 1, 1, 1, 1, 1,
-1.576744, -0.9996368, -1.396306, 1, 1, 1, 1, 1,
-1.573792, 0.01936829, -0.9982728, 1, 1, 1, 1, 1,
-1.567284, 2.123894, -1.269857, 1, 1, 1, 1, 1,
-1.562398, -0.381948, -2.134513, 1, 1, 1, 1, 1,
-1.54911, 1.185227, -1.269356, 1, 1, 1, 1, 1,
-1.52166, 1.795689, -0.9703916, 1, 1, 1, 1, 1,
-1.509816, 0.6948116, -1.775516, 1, 1, 1, 1, 1,
-1.505227, 1.698306, -0.7188836, 1, 1, 1, 1, 1,
-1.504283, 1.366703, -0.2650866, 1, 1, 1, 1, 1,
-1.502889, -0.9247999, -0.9992161, 1, 1, 1, 1, 1,
-1.497442, 0.8976084, -1.46867, 1, 1, 1, 1, 1,
-1.495143, -2.141518, -2.607055, 1, 1, 1, 1, 1,
-1.482796, -0.3536721, -1.165882, 1, 1, 1, 1, 1,
-1.482446, 1.98793, 0.6782026, 1, 1, 1, 1, 1,
-1.480395, -1.126472, -3.158416, 0, 0, 1, 1, 1,
-1.479988, -0.006454623, -1.242699, 1, 0, 0, 1, 1,
-1.478997, -0.6960327, -1.848004, 1, 0, 0, 1, 1,
-1.471665, -0.4235897, -1.915494, 1, 0, 0, 1, 1,
-1.465093, 0.42412, -2.523941, 1, 0, 0, 1, 1,
-1.459599, 0.968632, -0.326573, 1, 0, 0, 1, 1,
-1.452554, -0.3323991, -2.768612, 0, 0, 0, 1, 1,
-1.435478, 1.563452, -0.1405358, 0, 0, 0, 1, 1,
-1.433302, 2.453845, -2.226938, 0, 0, 0, 1, 1,
-1.424994, -0.1893802, -2.589679, 0, 0, 0, 1, 1,
-1.399545, 1.764567, -1.468324, 0, 0, 0, 1, 1,
-1.398922, 0.8611896, -0.7737722, 0, 0, 0, 1, 1,
-1.396865, 0.6593844, -2.013164, 0, 0, 0, 1, 1,
-1.368173, 0.6637468, -0.6143178, 1, 1, 1, 1, 1,
-1.358932, -0.9093054, -0.2092989, 1, 1, 1, 1, 1,
-1.352984, 0.3391626, -0.5006278, 1, 1, 1, 1, 1,
-1.350226, 0.5300646, -2.255862, 1, 1, 1, 1, 1,
-1.347576, -0.7617746, -3.114784, 1, 1, 1, 1, 1,
-1.346578, -0.4082691, -0.8117946, 1, 1, 1, 1, 1,
-1.335641, 0.1799107, -2.246532, 1, 1, 1, 1, 1,
-1.327771, 1.492907, -3.103462, 1, 1, 1, 1, 1,
-1.321255, 1.426264, -0.4228942, 1, 1, 1, 1, 1,
-1.305216, 0.4124043, -2.724657, 1, 1, 1, 1, 1,
-1.279132, -0.0557659, 0.6229195, 1, 1, 1, 1, 1,
-1.269585, 0.1627214, -1.641012, 1, 1, 1, 1, 1,
-1.267061, -0.9291931, -0.826488, 1, 1, 1, 1, 1,
-1.264254, -0.7461727, -2.615463, 1, 1, 1, 1, 1,
-1.2544, 0.9689228, -2.897887, 1, 1, 1, 1, 1,
-1.252422, -0.218948, -1.340123, 0, 0, 1, 1, 1,
-1.239606, -0.3948268, -1.395235, 1, 0, 0, 1, 1,
-1.230414, -0.5258934, -2.008737, 1, 0, 0, 1, 1,
-1.224858, -1.642772, -1.742432, 1, 0, 0, 1, 1,
-1.219288, -0.4326806, -0.9875692, 1, 0, 0, 1, 1,
-1.218391, 0.4189855, -0.5416217, 1, 0, 0, 1, 1,
-1.217514, -1.244191, -3.920537, 0, 0, 0, 1, 1,
-1.21588, -0.3684554, -0.3003843, 0, 0, 0, 1, 1,
-1.214735, 0.9365878, -0.1145931, 0, 0, 0, 1, 1,
-1.19823, 0.3092282, -0.354741, 0, 0, 0, 1, 1,
-1.166016, 0.9298992, 0.1399701, 0, 0, 0, 1, 1,
-1.160908, 0.3561834, -0.9547817, 0, 0, 0, 1, 1,
-1.159009, -0.8736721, -2.783818, 0, 0, 0, 1, 1,
-1.158191, 0.910453, -0.1072659, 1, 1, 1, 1, 1,
-1.155312, -1.409914, -4.483022, 1, 1, 1, 1, 1,
-1.15065, -1.409368, -2.146578, 1, 1, 1, 1, 1,
-1.136352, -0.03299985, -1.153442, 1, 1, 1, 1, 1,
-1.12964, -1.05316, -1.823, 1, 1, 1, 1, 1,
-1.129047, -1.894912, -1.014165, 1, 1, 1, 1, 1,
-1.128194, 0.9176484, -0.9272933, 1, 1, 1, 1, 1,
-1.123343, 0.7994661, -0.2140233, 1, 1, 1, 1, 1,
-1.119982, -0.4867652, -0.8247572, 1, 1, 1, 1, 1,
-1.112547, -0.7220525, -2.048968, 1, 1, 1, 1, 1,
-1.104688, 0.008711638, -1.848986, 1, 1, 1, 1, 1,
-1.100748, 0.08183353, 0.1949543, 1, 1, 1, 1, 1,
-1.100546, 1.131701, -1.784064, 1, 1, 1, 1, 1,
-1.100245, -0.5682662, -0.8646406, 1, 1, 1, 1, 1,
-1.096133, 0.330992, 0.2711299, 1, 1, 1, 1, 1,
-1.094145, -1.118052, -1.871293, 0, 0, 1, 1, 1,
-1.08639, 1.840569, -0.7776722, 1, 0, 0, 1, 1,
-1.084468, 0.02958606, -2.438929, 1, 0, 0, 1, 1,
-1.084189, -0.6800565, -2.283966, 1, 0, 0, 1, 1,
-1.083777, -0.2080344, -0.4318091, 1, 0, 0, 1, 1,
-1.08255, 0.304518, 0.03886699, 1, 0, 0, 1, 1,
-1.075166, 0.5159385, -1.826362, 0, 0, 0, 1, 1,
-1.06544, 1.841852, 0.5982434, 0, 0, 0, 1, 1,
-1.06323, -1.681575, -4.762321, 0, 0, 0, 1, 1,
-1.063073, 0.8551307, -0.5777841, 0, 0, 0, 1, 1,
-1.051936, 0.98796, -1.072558, 0, 0, 0, 1, 1,
-1.050859, -0.100999, -2.681979, 0, 0, 0, 1, 1,
-1.050578, 0.5924702, -1.037946, 0, 0, 0, 1, 1,
-1.043294, -0.5406882, -3.826083, 1, 1, 1, 1, 1,
-1.038893, 0.8398421, -0.5769103, 1, 1, 1, 1, 1,
-1.029339, -0.7014489, -2.504101, 1, 1, 1, 1, 1,
-1.022243, -0.7571787, -1.657711, 1, 1, 1, 1, 1,
-1.020763, 1.593167, 0.2577257, 1, 1, 1, 1, 1,
-1.019754, -0.9431484, -3.143723, 1, 1, 1, 1, 1,
-1.011096, 0.3824008, -2.575173, 1, 1, 1, 1, 1,
-1.006026, 0.1617873, -2.718656, 1, 1, 1, 1, 1,
-1.004785, -0.2075319, -2.935896, 1, 1, 1, 1, 1,
-1.002749, -0.1234207, -2.169259, 1, 1, 1, 1, 1,
-1.000467, -0.7430401, -4.195598, 1, 1, 1, 1, 1,
-0.9902315, -0.4709882, -3.282449, 1, 1, 1, 1, 1,
-0.9820328, 0.7525153, -0.5293342, 1, 1, 1, 1, 1,
-0.981132, 0.4465477, -3.042989, 1, 1, 1, 1, 1,
-0.9792147, -0.4569244, -2.42308, 1, 1, 1, 1, 1,
-0.9791847, 0.7095445, 0.009794082, 0, 0, 1, 1, 1,
-0.9741583, -1.947544, -2.92953, 1, 0, 0, 1, 1,
-0.9736567, -0.04079955, -2.730253, 1, 0, 0, 1, 1,
-0.9729834, 0.8806434, -0.4997069, 1, 0, 0, 1, 1,
-0.9686778, 1.404496, 1.240373, 1, 0, 0, 1, 1,
-0.9673519, -0.7483867, -1.291682, 1, 0, 0, 1, 1,
-0.9632916, -0.5461873, -1.046365, 0, 0, 0, 1, 1,
-0.958002, -0.6863284, -2.480552, 0, 0, 0, 1, 1,
-0.9531613, -0.9238809, -2.719159, 0, 0, 0, 1, 1,
-0.9444284, 1.535663, -1.138236, 0, 0, 0, 1, 1,
-0.9389215, -1.063218, -2.880175, 0, 0, 0, 1, 1,
-0.9314747, -0.004627629, -2.126028, 0, 0, 0, 1, 1,
-0.9312785, 1.079281, 0.4255272, 0, 0, 0, 1, 1,
-0.9278523, -0.4003072, -2.414431, 1, 1, 1, 1, 1,
-0.9273761, -2.072955, -2.148945, 1, 1, 1, 1, 1,
-0.9257801, -0.2649107, -2.199078, 1, 1, 1, 1, 1,
-0.9105034, 1.456331, -1.54618, 1, 1, 1, 1, 1,
-0.910467, -2.724001, -3.211072, 1, 1, 1, 1, 1,
-0.9100449, 0.5506389, -1.077184, 1, 1, 1, 1, 1,
-0.9096428, 0.7951248, -0.428705, 1, 1, 1, 1, 1,
-0.9085357, 0.5073987, -1.560154, 1, 1, 1, 1, 1,
-0.906804, -1.012468, -1.80746, 1, 1, 1, 1, 1,
-0.9006404, -0.7922115, -1.827227, 1, 1, 1, 1, 1,
-0.8989604, 0.6189498, 0.1061484, 1, 1, 1, 1, 1,
-0.898884, -0.1657434, -3.31487, 1, 1, 1, 1, 1,
-0.8977686, 0.259598, -1.942975, 1, 1, 1, 1, 1,
-0.8966917, 1.51441, -1.111769, 1, 1, 1, 1, 1,
-0.8921536, -0.4327224, -1.69224, 1, 1, 1, 1, 1,
-0.8912846, 0.5402953, -0.1803751, 0, 0, 1, 1, 1,
-0.8852428, -0.4492331, 0.1242348, 1, 0, 0, 1, 1,
-0.8852422, -0.5935171, -2.601784, 1, 0, 0, 1, 1,
-0.8846189, -1.108667, -1.744613, 1, 0, 0, 1, 1,
-0.884006, 1.069132, -1.721106, 1, 0, 0, 1, 1,
-0.883077, 1.374361, 0.2738516, 1, 0, 0, 1, 1,
-0.8803746, -2.358622, -1.865271, 0, 0, 0, 1, 1,
-0.8786231, 1.217084, -0.6705855, 0, 0, 0, 1, 1,
-0.8743253, -1.33776, -1.010969, 0, 0, 0, 1, 1,
-0.8644629, 1.466927, 0.8375039, 0, 0, 0, 1, 1,
-0.8634101, -0.4673439, -4.501824, 0, 0, 0, 1, 1,
-0.8615344, 0.6859166, -0.9125791, 0, 0, 0, 1, 1,
-0.8592035, 0.01091118, -2.752536, 0, 0, 0, 1, 1,
-0.8579722, 0.5262235, -0.8611516, 1, 1, 1, 1, 1,
-0.8433882, -0.4861661, -1.067468, 1, 1, 1, 1, 1,
-0.8396098, -0.1768008, -1.267085, 1, 1, 1, 1, 1,
-0.8395069, -0.02970839, -0.8245108, 1, 1, 1, 1, 1,
-0.8359282, 0.3862063, -0.9760134, 1, 1, 1, 1, 1,
-0.8325874, -0.0176094, -2.83148, 1, 1, 1, 1, 1,
-0.8323733, 0.6640809, -1.068069, 1, 1, 1, 1, 1,
-0.8320845, -0.1628707, -2.191452, 1, 1, 1, 1, 1,
-0.8314707, -0.9782426, -2.404547, 1, 1, 1, 1, 1,
-0.8256615, 0.3221523, -0.8985496, 1, 1, 1, 1, 1,
-0.8120952, -0.06258977, -0.767255, 1, 1, 1, 1, 1,
-0.8102896, -0.954268, -1.791119, 1, 1, 1, 1, 1,
-0.809387, -0.160325, -2.713794, 1, 1, 1, 1, 1,
-0.8086929, 1.570756, -1.30698, 1, 1, 1, 1, 1,
-0.8077907, -0.7945893, -3.510257, 1, 1, 1, 1, 1,
-0.805828, 0.6534193, 0.8678645, 0, 0, 1, 1, 1,
-0.7994397, 0.4149659, -1.704055, 1, 0, 0, 1, 1,
-0.7961844, -0.5873457, -2.337327, 1, 0, 0, 1, 1,
-0.7915698, 0.8328082, -1.324264, 1, 0, 0, 1, 1,
-0.7892972, -0.5331089, -2.331883, 1, 0, 0, 1, 1,
-0.7889413, -0.9807967, -3.052058, 1, 0, 0, 1, 1,
-0.7836631, 1.41227, -1.604102, 0, 0, 0, 1, 1,
-0.7831588, -0.1691267, -2.457743, 0, 0, 0, 1, 1,
-0.782834, -0.7060562, -3.163459, 0, 0, 0, 1, 1,
-0.7799837, -0.228908, -3.667885, 0, 0, 0, 1, 1,
-0.7798473, 2.718828, 0.3715745, 0, 0, 0, 1, 1,
-0.7796445, -0.3676134, -3.571496, 0, 0, 0, 1, 1,
-0.7791976, -1.012263, -1.783081, 0, 0, 0, 1, 1,
-0.7745009, 0.8543956, -0.014156, 1, 1, 1, 1, 1,
-0.7741755, 0.1336172, -1.937234, 1, 1, 1, 1, 1,
-0.7737342, -0.02247324, -0.6663688, 1, 1, 1, 1, 1,
-0.7725786, -0.1632779, -1.812503, 1, 1, 1, 1, 1,
-0.7680224, -2.316034, -2.427351, 1, 1, 1, 1, 1,
-0.7640963, -0.6283707, -1.72225, 1, 1, 1, 1, 1,
-0.7629654, -0.5850222, -2.586465, 1, 1, 1, 1, 1,
-0.7610556, -0.9982158, -2.527415, 1, 1, 1, 1, 1,
-0.7602073, -0.1201392, -1.424734, 1, 1, 1, 1, 1,
-0.7563614, -0.7145458, -2.872913, 1, 1, 1, 1, 1,
-0.7554362, -0.7123126, -2.460194, 1, 1, 1, 1, 1,
-0.7526098, 0.3551725, 1.723018, 1, 1, 1, 1, 1,
-0.7516845, 2.251607, -0.8965327, 1, 1, 1, 1, 1,
-0.7506572, -0.2143321, -3.089261, 1, 1, 1, 1, 1,
-0.7492131, -0.1130951, -2.557864, 1, 1, 1, 1, 1,
-0.7406699, 0.07632431, -2.096682, 0, 0, 1, 1, 1,
-0.729863, 0.1449666, -0.9438516, 1, 0, 0, 1, 1,
-0.7207871, 0.9199585, -0.873888, 1, 0, 0, 1, 1,
-0.7192363, 0.8511109, -0.6196229, 1, 0, 0, 1, 1,
-0.7176166, -0.8465226, -2.84351, 1, 0, 0, 1, 1,
-0.7158139, -0.5757744, -1.322437, 1, 0, 0, 1, 1,
-0.7110955, -0.3694835, -2.634236, 0, 0, 0, 1, 1,
-0.7073904, 0.9773006, -0.4139357, 0, 0, 0, 1, 1,
-0.7064207, -1.534474, -1.583263, 0, 0, 0, 1, 1,
-0.6989437, 2.177782, 0.7057816, 0, 0, 0, 1, 1,
-0.6977552, -1.093698, -3.195071, 0, 0, 0, 1, 1,
-0.6949217, 0.1276676, -0.4345198, 0, 0, 0, 1, 1,
-0.6906194, 0.5425774, -0.9538695, 0, 0, 0, 1, 1,
-0.6803302, -0.2028342, -0.930199, 1, 1, 1, 1, 1,
-0.6782625, -0.2221507, -0.2521891, 1, 1, 1, 1, 1,
-0.677869, 0.3580113, 0.7879907, 1, 1, 1, 1, 1,
-0.6720109, -0.6789823, -2.888061, 1, 1, 1, 1, 1,
-0.6639258, -0.318087, -2.587268, 1, 1, 1, 1, 1,
-0.6624444, -0.8573713, -3.295278, 1, 1, 1, 1, 1,
-0.6498613, 0.3234678, -1.42399, 1, 1, 1, 1, 1,
-0.6494427, -1.967894, -3.520243, 1, 1, 1, 1, 1,
-0.6467257, -0.127009, -2.334638, 1, 1, 1, 1, 1,
-0.6418881, -0.432546, -0.009418338, 1, 1, 1, 1, 1,
-0.6378814, -1.736576, -4.331099, 1, 1, 1, 1, 1,
-0.6372983, 0.1990555, -1.988739, 1, 1, 1, 1, 1,
-0.6340452, 0.08286245, -2.20958, 1, 1, 1, 1, 1,
-0.6320337, -0.4021353, -2.849102, 1, 1, 1, 1, 1,
-0.6315846, 1.763877, 1.551335, 1, 1, 1, 1, 1,
-0.6306295, 0.2742957, -0.5087017, 0, 0, 1, 1, 1,
-0.6293571, 1.237363, 2.413316, 1, 0, 0, 1, 1,
-0.6286859, -1.510124, -2.702296, 1, 0, 0, 1, 1,
-0.6242307, 1.04198, 0.8025227, 1, 0, 0, 1, 1,
-0.6204152, -0.01373858, -2.036748, 1, 0, 0, 1, 1,
-0.616379, 1.670629, -0.1146516, 1, 0, 0, 1, 1,
-0.6147727, -0.09081294, -1.675091, 0, 0, 0, 1, 1,
-0.6132777, 0.8085228, -1.174044, 0, 0, 0, 1, 1,
-0.6123068, 0.7064188, -1.253995, 0, 0, 0, 1, 1,
-0.6092126, 0.06015539, -1.240238, 0, 0, 0, 1, 1,
-0.6056505, 0.8602158, -0.5146353, 0, 0, 0, 1, 1,
-0.6040429, 0.3272563, -2.711594, 0, 0, 0, 1, 1,
-0.6036717, -1.561077, -1.433133, 0, 0, 0, 1, 1,
-0.6022042, 0.3739525, -0.8897495, 1, 1, 1, 1, 1,
-0.5941377, -2.006054, -2.909817, 1, 1, 1, 1, 1,
-0.5885887, 0.08852894, -0.6367252, 1, 1, 1, 1, 1,
-0.585075, -0.05746356, -3.119581, 1, 1, 1, 1, 1,
-0.5835562, 1.353989, -0.1802203, 1, 1, 1, 1, 1,
-0.5789809, -0.4376936, -3.475589, 1, 1, 1, 1, 1,
-0.5740693, -0.3022178, 0.4574772, 1, 1, 1, 1, 1,
-0.5695835, -0.6723261, -2.75328, 1, 1, 1, 1, 1,
-0.568728, -1.545271, -3.356723, 1, 1, 1, 1, 1,
-0.5672306, 0.4591609, -0.01970976, 1, 1, 1, 1, 1,
-0.5613223, -1.014537, -2.84315, 1, 1, 1, 1, 1,
-0.5583114, -1.503972, -1.975555, 1, 1, 1, 1, 1,
-0.5544996, 0.4113404, -0.180114, 1, 1, 1, 1, 1,
-0.548771, 0.2049409, -2.107013, 1, 1, 1, 1, 1,
-0.5443513, 1.390031, -0.7463464, 1, 1, 1, 1, 1,
-0.5332986, -2.552235, -3.327074, 0, 0, 1, 1, 1,
-0.5323219, 0.786285, -0.8123195, 1, 0, 0, 1, 1,
-0.5268232, 0.6332926, 0.1043558, 1, 0, 0, 1, 1,
-0.5109238, -1.271061, -1.144209, 1, 0, 0, 1, 1,
-0.510683, 1.021013, -0.8105523, 1, 0, 0, 1, 1,
-0.5100018, -0.02230083, -1.188288, 1, 0, 0, 1, 1,
-0.5085643, 1.891808, 0.001336215, 0, 0, 0, 1, 1,
-0.5075906, -0.2362821, -2.164273, 0, 0, 0, 1, 1,
-0.5074918, -0.9586999, -2.863177, 0, 0, 0, 1, 1,
-0.5048245, 0.7320103, -0.3137428, 0, 0, 0, 1, 1,
-0.5035457, -1.590253, -1.299237, 0, 0, 0, 1, 1,
-0.4983723, 0.5262887, 0.8496763, 0, 0, 0, 1, 1,
-0.4955519, -1.038133, -2.837814, 0, 0, 0, 1, 1,
-0.4876355, 0.4622198, -2.236589, 1, 1, 1, 1, 1,
-0.4792293, 1.421097, 0.2704031, 1, 1, 1, 1, 1,
-0.4763962, -0.008137881, 0.1149433, 1, 1, 1, 1, 1,
-0.473645, -1.612979, -2.395956, 1, 1, 1, 1, 1,
-0.4730392, 0.4473846, -0.6378062, 1, 1, 1, 1, 1,
-0.4675127, -0.1955166, -1.526317, 1, 1, 1, 1, 1,
-0.4638096, 0.5597461, -2.830977, 1, 1, 1, 1, 1,
-0.4581942, 0.6459598, 0.7343602, 1, 1, 1, 1, 1,
-0.4552209, 1.831576, 0.6380636, 1, 1, 1, 1, 1,
-0.4543816, -0.06878474, -2.23184, 1, 1, 1, 1, 1,
-0.453474, 0.280061, -1.504447, 1, 1, 1, 1, 1,
-0.4532995, 1.224871, -0.1341524, 1, 1, 1, 1, 1,
-0.4528907, 0.5404406, 0.4693675, 1, 1, 1, 1, 1,
-0.4417748, 0.7576255, -0.7331101, 1, 1, 1, 1, 1,
-0.4415864, -0.1602834, -2.816695, 1, 1, 1, 1, 1,
-0.4412727, 0.4090666, -1.260836, 0, 0, 1, 1, 1,
-0.4350643, -0.3217793, -1.444634, 1, 0, 0, 1, 1,
-0.4344791, -0.8745015, -1.773534, 1, 0, 0, 1, 1,
-0.4343057, 0.568171, 0.9719682, 1, 0, 0, 1, 1,
-0.4321365, 0.008982097, -2.564165, 1, 0, 0, 1, 1,
-0.4292047, -1.536989, -3.726269, 1, 0, 0, 1, 1,
-0.4272213, -1.857835, -3.085183, 0, 0, 0, 1, 1,
-0.4271318, 0.8481523, -1.655139, 0, 0, 0, 1, 1,
-0.4193299, -0.5847245, -1.410855, 0, 0, 0, 1, 1,
-0.4185407, 1.430203, -0.5327719, 0, 0, 0, 1, 1,
-0.418448, -0.7817748, -3.021115, 0, 0, 0, 1, 1,
-0.4170523, -1.813567, -4.642245, 0, 0, 0, 1, 1,
-0.4139616, 1.712858, -0.01535516, 0, 0, 0, 1, 1,
-0.4129686, 0.02026043, -0.6512202, 1, 1, 1, 1, 1,
-0.4097874, -1.366144, -1.085767, 1, 1, 1, 1, 1,
-0.4083018, -1.371242, -2.193136, 1, 1, 1, 1, 1,
-0.4075866, -1.260476, -4.27151, 1, 1, 1, 1, 1,
-0.4075367, -0.8385546, -3.226477, 1, 1, 1, 1, 1,
-0.4066696, -0.1948942, -0.8961859, 1, 1, 1, 1, 1,
-0.4062644, 0.3165278, -1.641408, 1, 1, 1, 1, 1,
-0.4056482, 0.6524081, -1.321854, 1, 1, 1, 1, 1,
-0.4038059, 1.444333, 0.5141572, 1, 1, 1, 1, 1,
-0.3964356, 1.414681, -2.993091, 1, 1, 1, 1, 1,
-0.3963895, 0.9968529, -0.9143903, 1, 1, 1, 1, 1,
-0.3860515, 0.1753694, -1.764586, 1, 1, 1, 1, 1,
-0.3850545, 0.07813859, -2.537318, 1, 1, 1, 1, 1,
-0.3843164, 2.169168, -0.7314703, 1, 1, 1, 1, 1,
-0.3786154, 1.245177, 1.468434, 1, 1, 1, 1, 1,
-0.3782721, 2.057348, -0.3455963, 0, 0, 1, 1, 1,
-0.3778917, -0.1654748, -3.055633, 1, 0, 0, 1, 1,
-0.376915, 2.05023, 0.3711838, 1, 0, 0, 1, 1,
-0.3728165, -0.05798264, -0.9835704, 1, 0, 0, 1, 1,
-0.371799, -2.304013, -1.961977, 1, 0, 0, 1, 1,
-0.3710552, -0.4971692, -2.221771, 1, 0, 0, 1, 1,
-0.3690717, 0.3670361, -0.02345231, 0, 0, 0, 1, 1,
-0.3668164, -0.7267976, -4.803885, 0, 0, 0, 1, 1,
-0.3648708, -1.488882, -3.305951, 0, 0, 0, 1, 1,
-0.3556703, 0.07060518, -1.745803, 0, 0, 0, 1, 1,
-0.3548365, -1.015488, -2.485721, 0, 0, 0, 1, 1,
-0.3526546, -1.265621, -4.236667, 0, 0, 0, 1, 1,
-0.3520561, -1.560729, -4.100728, 0, 0, 0, 1, 1,
-0.3501398, 0.7742231, 0.0507146, 1, 1, 1, 1, 1,
-0.3452788, 1.46652, -0.2392485, 1, 1, 1, 1, 1,
-0.3343821, -0.6350965, -1.903667, 1, 1, 1, 1, 1,
-0.3257662, 0.9116768, 0.5560338, 1, 1, 1, 1, 1,
-0.3249767, 0.6893383, -0.949703, 1, 1, 1, 1, 1,
-0.31969, 1.305175, 0.3023396, 1, 1, 1, 1, 1,
-0.3196239, -1.920423, -2.553898, 1, 1, 1, 1, 1,
-0.3188155, -1.217694, -3.585942, 1, 1, 1, 1, 1,
-0.3186103, 0.2615717, -0.4509342, 1, 1, 1, 1, 1,
-0.3148781, -1.787826, -4.443455, 1, 1, 1, 1, 1,
-0.3144934, -0.6872829, -3.579291, 1, 1, 1, 1, 1,
-0.3113029, -0.4531176, -2.451102, 1, 1, 1, 1, 1,
-0.3112284, -0.4206863, -4.297531, 1, 1, 1, 1, 1,
-0.3109916, -0.1015552, -2.053503, 1, 1, 1, 1, 1,
-0.3018174, -0.6311543, -3.072438, 1, 1, 1, 1, 1,
-0.301741, 0.4912364, -2.028419, 0, 0, 1, 1, 1,
-0.2962897, 0.232669, -1.228936, 1, 0, 0, 1, 1,
-0.2909988, -0.5145369, -3.603391, 1, 0, 0, 1, 1,
-0.2883686, 0.6085092, -1.247506, 1, 0, 0, 1, 1,
-0.2847058, -1.105507, -4.304223, 1, 0, 0, 1, 1,
-0.2846693, -0.5012503, -1.767814, 1, 0, 0, 1, 1,
-0.2843158, 0.09435814, -0.8709067, 0, 0, 0, 1, 1,
-0.2762722, 1.158919, -0.2471765, 0, 0, 0, 1, 1,
-0.2756879, -0.6561898, -1.828883, 0, 0, 0, 1, 1,
-0.2742417, -2.576694, -1.86113, 0, 0, 0, 1, 1,
-0.2726105, 0.5912523, 1.162961, 0, 0, 0, 1, 1,
-0.2691898, -0.4364493, -3.329438, 0, 0, 0, 1, 1,
-0.2656353, -1.935846, -1.254114, 0, 0, 0, 1, 1,
-0.2648172, 1.109559, -0.5131916, 1, 1, 1, 1, 1,
-0.2610949, -2.103958, -5.713365, 1, 1, 1, 1, 1,
-0.2589222, -0.0003336909, -1.675968, 1, 1, 1, 1, 1,
-0.2565436, -0.218752, -0.9181042, 1, 1, 1, 1, 1,
-0.2555963, -0.5015381, -2.230066, 1, 1, 1, 1, 1,
-0.2551005, 0.7781932, -1.166042, 1, 1, 1, 1, 1,
-0.2504832, 0.7598875, -2.479215, 1, 1, 1, 1, 1,
-0.249006, 0.2054751, -0.5301634, 1, 1, 1, 1, 1,
-0.2480334, 1.417248, 1.622441, 1, 1, 1, 1, 1,
-0.2472815, -0.7342929, -3.509614, 1, 1, 1, 1, 1,
-0.2452421, -0.4131487, -3.20614, 1, 1, 1, 1, 1,
-0.2450791, -1.629684, -4.164651, 1, 1, 1, 1, 1,
-0.2437311, -0.6555624, -2.362169, 1, 1, 1, 1, 1,
-0.236851, 0.8910161, 1.440681, 1, 1, 1, 1, 1,
-0.236037, 1.46685, -1.546122, 1, 1, 1, 1, 1,
-0.2359491, 1.870294, -1.897306, 0, 0, 1, 1, 1,
-0.2329618, -0.1865951, -3.639122, 1, 0, 0, 1, 1,
-0.2270118, 0.2544356, 0.4162035, 1, 0, 0, 1, 1,
-0.2130583, 1.765077, 0.5816325, 1, 0, 0, 1, 1,
-0.2123104, 0.7183159, -0.0520011, 1, 0, 0, 1, 1,
-0.2083258, -0.8712331, -5.391129, 1, 0, 0, 1, 1,
-0.1988821, -0.4486095, -4.078271, 0, 0, 0, 1, 1,
-0.1980409, -0.5494608, -3.220335, 0, 0, 0, 1, 1,
-0.1976557, 0.7111487, -1.125499, 0, 0, 0, 1, 1,
-0.1973641, 0.100229, -1.110957, 0, 0, 0, 1, 1,
-0.1965773, -0.448789, -3.622287, 0, 0, 0, 1, 1,
-0.1918658, 0.02536437, -3.622674, 0, 0, 0, 1, 1,
-0.1905969, 1.493168, -1.413497, 0, 0, 0, 1, 1,
-0.1879506, -0.9931168, -3.282758, 1, 1, 1, 1, 1,
-0.1826503, -0.2276854, -2.813158, 1, 1, 1, 1, 1,
-0.176744, 0.5719222, -1.032144, 1, 1, 1, 1, 1,
-0.1689578, -1.075191, -3.078622, 1, 1, 1, 1, 1,
-0.167566, -1.142496, -3.586487, 1, 1, 1, 1, 1,
-0.1648261, -0.01363307, -1.160911, 1, 1, 1, 1, 1,
-0.1607498, -0.658569, -3.877601, 1, 1, 1, 1, 1,
-0.1570889, -0.846882, -3.815437, 1, 1, 1, 1, 1,
-0.1566593, -0.2863507, -3.634028, 1, 1, 1, 1, 1,
-0.1518923, -0.2546947, -1.89392, 1, 1, 1, 1, 1,
-0.1492796, -0.1891325, -1.721541, 1, 1, 1, 1, 1,
-0.1484791, 1.718621, -1.692871, 1, 1, 1, 1, 1,
-0.1465211, -0.1434769, -0.3539999, 1, 1, 1, 1, 1,
-0.1457145, 2.40206, 0.9759708, 1, 1, 1, 1, 1,
-0.1438128, 0.3647733, -1.982323, 1, 1, 1, 1, 1,
-0.1429263, -0.2434364, -1.293663, 0, 0, 1, 1, 1,
-0.1428517, -0.677533, -3.265611, 1, 0, 0, 1, 1,
-0.1396007, 0.1780912, 0.2453999, 1, 0, 0, 1, 1,
-0.1385802, -0.5615681, -4.399855, 1, 0, 0, 1, 1,
-0.1369802, 0.007988352, -1.333089, 1, 0, 0, 1, 1,
-0.1363962, -0.7970179, -2.898324, 1, 0, 0, 1, 1,
-0.1321155, -0.7834737, -3.032896, 0, 0, 0, 1, 1,
-0.1288019, -0.09010518, -1.547521, 0, 0, 0, 1, 1,
-0.1287972, 1.029889, 1.34096, 0, 0, 0, 1, 1,
-0.1280766, -0.3812303, -3.684353, 0, 0, 0, 1, 1,
-0.1238098, 2.417312, 1.138302, 0, 0, 0, 1, 1,
-0.1230601, -0.04409419, -0.7864974, 0, 0, 0, 1, 1,
-0.1229909, -0.004987224, -2.566441, 0, 0, 0, 1, 1,
-0.1213562, 1.82272, 1.067183, 1, 1, 1, 1, 1,
-0.1173892, -1.033203, -2.87981, 1, 1, 1, 1, 1,
-0.109423, -0.9958227, -2.611066, 1, 1, 1, 1, 1,
-0.1090532, 0.6527296, 0.2284698, 1, 1, 1, 1, 1,
-0.1080062, -0.2390639, -2.632944, 1, 1, 1, 1, 1,
-0.106769, 1.061207, 3.340334, 1, 1, 1, 1, 1,
-0.1002461, -0.2474979, -3.650736, 1, 1, 1, 1, 1,
-0.09651954, 0.8609319, 1.365632, 1, 1, 1, 1, 1,
-0.09650796, -1.951468, -2.634734, 1, 1, 1, 1, 1,
-0.09280077, 0.2035737, -1.625422, 1, 1, 1, 1, 1,
-0.09278849, 1.130829, -0.3330128, 1, 1, 1, 1, 1,
-0.09261727, 0.9866465, -2.124308, 1, 1, 1, 1, 1,
-0.08979031, -1.858075, -5.565639, 1, 1, 1, 1, 1,
-0.08701169, 1.543629, -1.560174, 1, 1, 1, 1, 1,
-0.08184016, 0.4114846, 1.194252, 1, 1, 1, 1, 1,
-0.07869503, 1.678326, -1.654966, 0, 0, 1, 1, 1,
-0.07739052, -0.788453, -3.549168, 1, 0, 0, 1, 1,
-0.07486203, -2.011406, -3.345697, 1, 0, 0, 1, 1,
-0.07435368, 1.809024, 0.5419347, 1, 0, 0, 1, 1,
-0.06986755, -0.9265599, -2.58777, 1, 0, 0, 1, 1,
-0.05878966, -0.60464, -3.537836, 1, 0, 0, 1, 1,
-0.05795496, -1.193525, -3.762592, 0, 0, 0, 1, 1,
-0.04836648, -1.933778, -4.379673, 0, 0, 0, 1, 1,
-0.04605332, -0.4237337, -1.635333, 0, 0, 0, 1, 1,
-0.03347506, 1.137906, 0.2140411, 0, 0, 0, 1, 1,
-0.0332642, -2.234579, -3.3491, 0, 0, 0, 1, 1,
-0.03101684, 1.779714, -0.1306155, 0, 0, 0, 1, 1,
-0.03101367, -0.974062, -4.271726, 0, 0, 0, 1, 1,
-0.02036017, 0.6929958, -0.08750585, 1, 1, 1, 1, 1,
-0.01038662, 1.839706, 0.2316443, 1, 1, 1, 1, 1,
-0.002590502, 0.8429357, -0.5460429, 1, 1, 1, 1, 1,
-0.0006958638, 0.598627, 0.587024, 1, 1, 1, 1, 1,
0.0001399595, 1.100491, -1.234587, 1, 1, 1, 1, 1,
0.01507779, 0.06643672, 1.056196, 1, 1, 1, 1, 1,
0.01511381, -2.120547, 3.98908, 1, 1, 1, 1, 1,
0.01683845, -1.031866, 1.574856, 1, 1, 1, 1, 1,
0.02981828, 0.8685916, -0.2502714, 1, 1, 1, 1, 1,
0.03457632, 0.1606163, -0.4732604, 1, 1, 1, 1, 1,
0.04207415, -0.1633778, 3.787201, 1, 1, 1, 1, 1,
0.04219279, 0.1552092, 0.4007149, 1, 1, 1, 1, 1,
0.04745862, 0.9669454, 2.183238, 1, 1, 1, 1, 1,
0.05237312, 0.9811552, -0.2129211, 1, 1, 1, 1, 1,
0.05505065, -1.779097, 3.513552, 1, 1, 1, 1, 1,
0.06070617, 0.3808905, 0.564649, 0, 0, 1, 1, 1,
0.06077726, 0.1975035, -1.007816, 1, 0, 0, 1, 1,
0.06269994, -0.02025217, 0.6919987, 1, 0, 0, 1, 1,
0.06822843, -1.201437, 3.093009, 1, 0, 0, 1, 1,
0.07002321, -0.1060014, 2.706069, 1, 0, 0, 1, 1,
0.07251421, -1.589586, 0.9975626, 1, 0, 0, 1, 1,
0.07295816, 0.5793257, -0.7909478, 0, 0, 0, 1, 1,
0.07536109, -1.092985, 1.702772, 0, 0, 0, 1, 1,
0.07644375, 0.2182682, 1.282869, 0, 0, 0, 1, 1,
0.07661107, 1.73587, 0.9240587, 0, 0, 0, 1, 1,
0.07845201, 1.215307, 0.3471136, 0, 0, 0, 1, 1,
0.07956121, -0.7812384, 2.421638, 0, 0, 0, 1, 1,
0.08149855, 0.5438907, 0.9122802, 0, 0, 0, 1, 1,
0.08267082, 0.06007866, 0.04315134, 1, 1, 1, 1, 1,
0.08752134, 1.047583, 1.141254, 1, 1, 1, 1, 1,
0.089464, 0.4336112, -0.1373166, 1, 1, 1, 1, 1,
0.09029288, 3.208278, -0.6520054, 1, 1, 1, 1, 1,
0.09318979, -0.6756343, 3.015068, 1, 1, 1, 1, 1,
0.09404249, 0.9033949, 0.3268115, 1, 1, 1, 1, 1,
0.0943822, -0.5977608, 0.6995441, 1, 1, 1, 1, 1,
0.1007223, -0.4053297, 1.867134, 1, 1, 1, 1, 1,
0.1034295, 1.106266, -1.013414, 1, 1, 1, 1, 1,
0.1056088, -0.8945654, 2.455361, 1, 1, 1, 1, 1,
0.1056817, -1.532999, 1.350615, 1, 1, 1, 1, 1,
0.1062697, 1.490515, 0.09145231, 1, 1, 1, 1, 1,
0.1136079, -0.06740525, 2.359846, 1, 1, 1, 1, 1,
0.1149766, 1.07629, 0.130883, 1, 1, 1, 1, 1,
0.1161157, 0.7190611, -0.1571565, 1, 1, 1, 1, 1,
0.1196203, 0.481968, -1.409964, 0, 0, 1, 1, 1,
0.1218701, 0.5095004, 0.5881166, 1, 0, 0, 1, 1,
0.1235761, -0.4362455, 3.002275, 1, 0, 0, 1, 1,
0.1240152, -0.1270763, 1.113202, 1, 0, 0, 1, 1,
0.1276389, 0.128923, -0.6523422, 1, 0, 0, 1, 1,
0.1280155, -0.8988907, 2.606596, 1, 0, 0, 1, 1,
0.1305798, 0.2487921, -0.5744313, 0, 0, 0, 1, 1,
0.1325461, -0.3730211, 3.546995, 0, 0, 0, 1, 1,
0.1341335, 1.406911, -0.3120874, 0, 0, 0, 1, 1,
0.1403895, 2.847968, 0.1056601, 0, 0, 0, 1, 1,
0.1417619, 1.089514, -0.6844091, 0, 0, 0, 1, 1,
0.1436302, 0.2128288, -1.481126, 0, 0, 0, 1, 1,
0.1441399, 0.3237445, 1.481918, 0, 0, 0, 1, 1,
0.1446072, 0.06787466, 0.1207112, 1, 1, 1, 1, 1,
0.1450433, 0.8514737, 1.356155, 1, 1, 1, 1, 1,
0.1452786, -0.1183634, 2.406249, 1, 1, 1, 1, 1,
0.1464589, -0.140864, 2.093104, 1, 1, 1, 1, 1,
0.1481424, -1.579615, 3.450888, 1, 1, 1, 1, 1,
0.14828, 2.037162, 2.307045, 1, 1, 1, 1, 1,
0.1485119, 0.8343165, -0.08601876, 1, 1, 1, 1, 1,
0.1507845, 0.4212226, 2.513063, 1, 1, 1, 1, 1,
0.1521163, 1.71718, 1.82605, 1, 1, 1, 1, 1,
0.1582505, -0.09854741, 2.166667, 1, 1, 1, 1, 1,
0.160403, -0.8647376, 1.641734, 1, 1, 1, 1, 1,
0.1604619, -0.8782926, 0.8481694, 1, 1, 1, 1, 1,
0.1628705, -2.361936, 5.030849, 1, 1, 1, 1, 1,
0.1711414, 1.245141, -0.5234321, 1, 1, 1, 1, 1,
0.1748417, -0.3675765, 1.624632, 1, 1, 1, 1, 1,
0.1748955, 0.03909205, 2.774319, 0, 0, 1, 1, 1,
0.175041, -0.3012487, 2.840828, 1, 0, 0, 1, 1,
0.1757982, -1.883181, 3.568353, 1, 0, 0, 1, 1,
0.176054, 0.9192956, -0.1968921, 1, 0, 0, 1, 1,
0.1760653, -0.2736682, 3.252268, 1, 0, 0, 1, 1,
0.1763808, -1.546642, 3.763407, 1, 0, 0, 1, 1,
0.1779984, 0.5916339, -0.08072785, 0, 0, 0, 1, 1,
0.1804531, -1.637836, 2.792853, 0, 0, 0, 1, 1,
0.1810936, -1.286244, 3.050722, 0, 0, 0, 1, 1,
0.1815566, 0.998341, 0.7261452, 0, 0, 0, 1, 1,
0.1890017, 0.762178, 0.4742147, 0, 0, 0, 1, 1,
0.1939056, 1.097496, 0.5142121, 0, 0, 0, 1, 1,
0.1948425, 0.3147213, -0.4706216, 0, 0, 0, 1, 1,
0.1975527, 1.387764, 1.073635, 1, 1, 1, 1, 1,
0.1984554, -0.4181527, 1.679249, 1, 1, 1, 1, 1,
0.1992045, 0.8015537, 1.966666, 1, 1, 1, 1, 1,
0.2030559, -0.857217, 3.938533, 1, 1, 1, 1, 1,
0.2041237, 0.2124126, 1.10027, 1, 1, 1, 1, 1,
0.2047646, -0.5530659, 1.963945, 1, 1, 1, 1, 1,
0.2062089, 0.3410465, 1.188105, 1, 1, 1, 1, 1,
0.2082422, 1.103206, -0.7194259, 1, 1, 1, 1, 1,
0.2090014, 1.553581, 0.6114242, 1, 1, 1, 1, 1,
0.2093473, 0.5804758, 0.8178571, 1, 1, 1, 1, 1,
0.2121855, -1.156531, 0.8417099, 1, 1, 1, 1, 1,
0.2125303, 0.1452581, 2.605369, 1, 1, 1, 1, 1,
0.2137614, -0.7309408, 1.228489, 1, 1, 1, 1, 1,
0.2189489, 0.438885, 0.2145547, 1, 1, 1, 1, 1,
0.2200461, -1.159947, 2.730186, 1, 1, 1, 1, 1,
0.2271484, -0.6113091, 1.498944, 0, 0, 1, 1, 1,
0.2279844, -1.059554, 3.6976, 1, 0, 0, 1, 1,
0.2283589, -0.8898931, 2.572823, 1, 0, 0, 1, 1,
0.2300889, 1.491428, -0.1243677, 1, 0, 0, 1, 1,
0.2319634, -0.7964444, 4.612136, 1, 0, 0, 1, 1,
0.2383073, 0.9292305, -2.092523, 1, 0, 0, 1, 1,
0.23935, -2.027804, 5.304261, 0, 0, 0, 1, 1,
0.2399035, -0.2389704, 3.235495, 0, 0, 0, 1, 1,
0.2401126, 0.08453538, 1.337582, 0, 0, 0, 1, 1,
0.2407003, 1.517463, 2.016107, 0, 0, 0, 1, 1,
0.2473489, -1.892885, 0.683131, 0, 0, 0, 1, 1,
0.2503442, 2.757896, -0.01042804, 0, 0, 0, 1, 1,
0.2584177, 0.7347177, 0.02004754, 0, 0, 0, 1, 1,
0.2595161, 2.344404, -1.620286, 1, 1, 1, 1, 1,
0.2598295, 1.812613, 0.5927392, 1, 1, 1, 1, 1,
0.26006, 0.1452982, 1.37669, 1, 1, 1, 1, 1,
0.2623052, -0.465407, 3.590779, 1, 1, 1, 1, 1,
0.2679165, -0.4429983, 2.007376, 1, 1, 1, 1, 1,
0.2694912, 0.6754749, 1.873095, 1, 1, 1, 1, 1,
0.2724431, -0.9474058, 3.777936, 1, 1, 1, 1, 1,
0.2754917, 1.599327, -0.7734078, 1, 1, 1, 1, 1,
0.2826286, -0.4067243, 2.837833, 1, 1, 1, 1, 1,
0.2858128, -1.334528, 1.845181, 1, 1, 1, 1, 1,
0.2903175, 0.07137721, 2.854217, 1, 1, 1, 1, 1,
0.2925651, -1.659825, 2.352353, 1, 1, 1, 1, 1,
0.2930601, 2.119007, 1.591493, 1, 1, 1, 1, 1,
0.2949787, -0.2002708, 2.607169, 1, 1, 1, 1, 1,
0.2971163, 0.5940375, 1.900254, 1, 1, 1, 1, 1,
0.2976709, 0.09517284, -0.3334226, 0, 0, 1, 1, 1,
0.3013487, -0.8241501, 4.317874, 1, 0, 0, 1, 1,
0.3037125, -0.5104285, 3.650742, 1, 0, 0, 1, 1,
0.3047797, 0.2503886, 1.51693, 1, 0, 0, 1, 1,
0.3075786, -0.775457, 3.23711, 1, 0, 0, 1, 1,
0.3084418, 0.2930481, 0.739402, 1, 0, 0, 1, 1,
0.3109742, 0.4686321, 1.288678, 0, 0, 0, 1, 1,
0.3114524, 1.90829, -0.3302709, 0, 0, 0, 1, 1,
0.3165313, -1.033262, 3.437003, 0, 0, 0, 1, 1,
0.3171209, 0.6917489, -0.3366469, 0, 0, 0, 1, 1,
0.3173371, -1.640239, 1.675869, 0, 0, 0, 1, 1,
0.3183491, 0.2224774, -0.8430777, 0, 0, 0, 1, 1,
0.3202573, -0.5045737, 3.032753, 0, 0, 0, 1, 1,
0.3209729, 1.778624, 0.3822976, 1, 1, 1, 1, 1,
0.3218389, -0.4839345, 0.6863331, 1, 1, 1, 1, 1,
0.3238017, 1.106109, 0.6459273, 1, 1, 1, 1, 1,
0.3266641, -0.7945154, 0.6082383, 1, 1, 1, 1, 1,
0.3278049, -0.2597339, 2.355295, 1, 1, 1, 1, 1,
0.3278866, 1.497867, 2.017433, 1, 1, 1, 1, 1,
0.3339585, 1.356337, -0.4402164, 1, 1, 1, 1, 1,
0.3379244, 0.5845045, -0.1382035, 1, 1, 1, 1, 1,
0.3408145, 1.933483, -0.08946765, 1, 1, 1, 1, 1,
0.3430948, -2.116811, 2.938548, 1, 1, 1, 1, 1,
0.3473053, 1.542648, 0.7967302, 1, 1, 1, 1, 1,
0.3558266, -1.553594, 3.992253, 1, 1, 1, 1, 1,
0.3599097, -1.976542, 1.783726, 1, 1, 1, 1, 1,
0.3602401, -0.34029, 1.239914, 1, 1, 1, 1, 1,
0.3624036, 0.2930557, 0.1665849, 1, 1, 1, 1, 1,
0.3644055, -0.9609361, 2.189945, 0, 0, 1, 1, 1,
0.3675475, 1.155325, -0.6282799, 1, 0, 0, 1, 1,
0.3680538, 1.301828, -1.462804, 1, 0, 0, 1, 1,
0.3776517, -0.7939901, 2.119294, 1, 0, 0, 1, 1,
0.3792678, -0.5120378, 4.257942, 1, 0, 0, 1, 1,
0.3965899, 1.221178, 3.410717, 1, 0, 0, 1, 1,
0.4076617, -2.056269, 2.813666, 0, 0, 0, 1, 1,
0.4177397, 0.1571723, 0.9627458, 0, 0, 0, 1, 1,
0.4191833, -1.066347, 3.111983, 0, 0, 0, 1, 1,
0.4211266, 0.6534277, 1.345243, 0, 0, 0, 1, 1,
0.4221129, 1.005957, -1.184469, 0, 0, 0, 1, 1,
0.4295383, 0.2353327, -0.06533968, 0, 0, 0, 1, 1,
0.4310352, -1.020288, 3.265514, 0, 0, 0, 1, 1,
0.4310692, 1.451875, 0.8282437, 1, 1, 1, 1, 1,
0.4380592, -1.441116, 1.269823, 1, 1, 1, 1, 1,
0.4428483, 0.2459276, 0.807754, 1, 1, 1, 1, 1,
0.4434166, 0.7909274, 0.02694719, 1, 1, 1, 1, 1,
0.4469568, -0.04069415, 1.4623, 1, 1, 1, 1, 1,
0.4509893, -1.963983, 5.666778, 1, 1, 1, 1, 1,
0.4545209, 0.2320403, 1.159931, 1, 1, 1, 1, 1,
0.4545764, 0.03596954, 1.589497, 1, 1, 1, 1, 1,
0.4546645, -0.2627631, 2.12721, 1, 1, 1, 1, 1,
0.4571847, -0.01464676, 4.422636, 1, 1, 1, 1, 1,
0.4625178, -0.01391424, 1.22607, 1, 1, 1, 1, 1,
0.4629025, -0.292388, 3.29128, 1, 1, 1, 1, 1,
0.4672228, -0.02791506, 0.9280727, 1, 1, 1, 1, 1,
0.4676606, -0.522097, 3.071047, 1, 1, 1, 1, 1,
0.4701934, 1.02354, -1.386156, 1, 1, 1, 1, 1,
0.4734757, -1.789406, 2.319337, 0, 0, 1, 1, 1,
0.474263, -0.9729836, 4.30588, 1, 0, 0, 1, 1,
0.4751099, -0.3107293, 2.640556, 1, 0, 0, 1, 1,
0.4758162, -0.824253, 3.193902, 1, 0, 0, 1, 1,
0.4785496, 0.6515419, 0.7127144, 1, 0, 0, 1, 1,
0.4787455, -1.440531, 2.766143, 1, 0, 0, 1, 1,
0.4794611, -0.1415315, 1.96127, 0, 0, 0, 1, 1,
0.4876066, -1.231375, 2.564635, 0, 0, 0, 1, 1,
0.4915821, -0.22633, 0.136573, 0, 0, 0, 1, 1,
0.4941472, 1.271981, 0.1237171, 0, 0, 0, 1, 1,
0.4967741, 0.192636, 2.375769, 0, 0, 0, 1, 1,
0.4969829, 0.01723053, 0.2699752, 0, 0, 0, 1, 1,
0.5010449, 1.962027, 0.6016577, 0, 0, 0, 1, 1,
0.5023133, -0.1041089, 1.636964, 1, 1, 1, 1, 1,
0.5023422, 0.3082215, 2.489075, 1, 1, 1, 1, 1,
0.5096545, 0.2095823, 1.359203, 1, 1, 1, 1, 1,
0.5097046, -0.8928381, 0.9921782, 1, 1, 1, 1, 1,
0.5136169, -0.4564576, 1.524836, 1, 1, 1, 1, 1,
0.5146442, 0.3038563, 1.49852, 1, 1, 1, 1, 1,
0.5212406, 0.2492238, 0.8762588, 1, 1, 1, 1, 1,
0.528778, 0.3753588, 2.474266, 1, 1, 1, 1, 1,
0.53331, 2.743133, 1.231282, 1, 1, 1, 1, 1,
0.537281, -0.5540726, 2.782989, 1, 1, 1, 1, 1,
0.5408411, -1.497788, 2.267927, 1, 1, 1, 1, 1,
0.545273, -0.1039893, 2.891085, 1, 1, 1, 1, 1,
0.5454392, 0.4387384, 1.29065, 1, 1, 1, 1, 1,
0.5465721, 0.7885047, 0.1827469, 1, 1, 1, 1, 1,
0.5493094, 0.0197746, 0.6162226, 1, 1, 1, 1, 1,
0.5504057, 1.00172, 0.9794998, 0, 0, 1, 1, 1,
0.5518304, -0.3441696, 1.66339, 1, 0, 0, 1, 1,
0.5562738, -0.2806922, 1.001559, 1, 0, 0, 1, 1,
0.5582419, -2.571963, 5.75765, 1, 0, 0, 1, 1,
0.5592528, 0.2853722, 2.32831, 1, 0, 0, 1, 1,
0.5596814, 0.9343355, 0.8609121, 1, 0, 0, 1, 1,
0.5600465, -0.4363388, 3.251678, 0, 0, 0, 1, 1,
0.562636, -0.2266873, 0.4574637, 0, 0, 0, 1, 1,
0.5658966, 0.6606472, 0.3511521, 0, 0, 0, 1, 1,
0.5670202, 2.279855, -0.1299674, 0, 0, 0, 1, 1,
0.567863, 1.14985, 0.5545493, 0, 0, 0, 1, 1,
0.5680836, 0.3268145, 0.1744222, 0, 0, 0, 1, 1,
0.5692047, -0.7826636, 1.938408, 0, 0, 0, 1, 1,
0.5728582, 0.7217957, 1.309506, 1, 1, 1, 1, 1,
0.5732247, 1.972212, 0.9344496, 1, 1, 1, 1, 1,
0.5807416, 0.4753957, 1.344109, 1, 1, 1, 1, 1,
0.5840086, 1.400936, -1.29888, 1, 1, 1, 1, 1,
0.5842931, 0.08453085, 1.809736, 1, 1, 1, 1, 1,
0.5844916, -1.39589, 1.836155, 1, 1, 1, 1, 1,
0.5855321, 1.505195, -0.1196674, 1, 1, 1, 1, 1,
0.5903181, -0.172332, 1.515375, 1, 1, 1, 1, 1,
0.5911145, -0.5674599, 1.685906, 1, 1, 1, 1, 1,
0.5923402, -1.053591, 2.379773, 1, 1, 1, 1, 1,
0.6056556, -0.0231191, 2.215887, 1, 1, 1, 1, 1,
0.6082817, 1.282684, -0.836232, 1, 1, 1, 1, 1,
0.6112772, -1.4631, 2.42718, 1, 1, 1, 1, 1,
0.612892, 0.4334767, -0.2855411, 1, 1, 1, 1, 1,
0.6130257, -1.27847, 2.833525, 1, 1, 1, 1, 1,
0.6150406, -0.06568855, 1.277532, 0, 0, 1, 1, 1,
0.6203008, -0.1148495, 0.97631, 1, 0, 0, 1, 1,
0.6207728, -0.3511043, 3.720377, 1, 0, 0, 1, 1,
0.6270127, -0.3469849, 1.862728, 1, 0, 0, 1, 1,
0.6280249, 0.5885017, 0.5581433, 1, 0, 0, 1, 1,
0.6305305, 1.219905, 1.711236, 1, 0, 0, 1, 1,
0.6368015, 1.309167, 1.809652, 0, 0, 0, 1, 1,
0.6399062, 1.328432, -0.5718399, 0, 0, 0, 1, 1,
0.6400117, -1.78688, 2.311751, 0, 0, 0, 1, 1,
0.6538919, 0.4860488, 0.6730657, 0, 0, 0, 1, 1,
0.6636685, 1.268631, 1.553985, 0, 0, 0, 1, 1,
0.6641659, -0.9295605, 1.760199, 0, 0, 0, 1, 1,
0.6657724, 0.2920827, 1.394043, 0, 0, 0, 1, 1,
0.6677161, 0.3594438, 1.262164, 1, 1, 1, 1, 1,
0.668052, 0.7992789, 1.081171, 1, 1, 1, 1, 1,
0.6686778, -1.780983, 2.227251, 1, 1, 1, 1, 1,
0.6714755, -1.083395, 2.806211, 1, 1, 1, 1, 1,
0.6718799, -2.500849, 5.053607, 1, 1, 1, 1, 1,
0.6838292, -0.1760554, 0.8309457, 1, 1, 1, 1, 1,
0.6857455, 0.1402318, 1.802275, 1, 1, 1, 1, 1,
0.6890058, -0.1517223, 1.440789, 1, 1, 1, 1, 1,
0.6921337, -0.4728464, 3.925867, 1, 1, 1, 1, 1,
0.6931404, 1.006674, -0.141628, 1, 1, 1, 1, 1,
0.6955121, 1.036844, 2.315642, 1, 1, 1, 1, 1,
0.6957834, -0.4538858, 3.728273, 1, 1, 1, 1, 1,
0.699154, 1.476393, 0.7989517, 1, 1, 1, 1, 1,
0.7011818, 0.3332124, 0.1512188, 1, 1, 1, 1, 1,
0.7083174, -0.1226855, 0.2424842, 1, 1, 1, 1, 1,
0.7167003, 0.9400103, 0.6355478, 0, 0, 1, 1, 1,
0.721779, -0.5978096, 3.124981, 1, 0, 0, 1, 1,
0.7273905, 1.056229, -1.474383, 1, 0, 0, 1, 1,
0.7371832, -0.8103519, 4.266522, 1, 0, 0, 1, 1,
0.7408408, -0.7816402, 2.688245, 1, 0, 0, 1, 1,
0.7437254, 0.1732941, 2.247502, 1, 0, 0, 1, 1,
0.7552508, -0.4646611, 0.5937815, 0, 0, 0, 1, 1,
0.7561553, 0.2810559, -1.531858, 0, 0, 0, 1, 1,
0.7634255, 0.9777553, 0.2535969, 0, 0, 0, 1, 1,
0.7636406, -1.195501, 3.044637, 0, 0, 0, 1, 1,
0.7724944, -0.5309621, 2.520205, 0, 0, 0, 1, 1,
0.7802862, 0.3965913, 1.797656, 0, 0, 0, 1, 1,
0.7839947, -0.8745947, 0.3029959, 0, 0, 0, 1, 1,
0.7844533, -1.678328, 2.770697, 1, 1, 1, 1, 1,
0.7873067, -0.2276082, 1.159254, 1, 1, 1, 1, 1,
0.7919142, 2.382908, 1.104537, 1, 1, 1, 1, 1,
0.7990165, 0.9282174, 3.123403, 1, 1, 1, 1, 1,
0.8022804, 0.6414847, 0.457883, 1, 1, 1, 1, 1,
0.804231, 0.4945099, 1.541069, 1, 1, 1, 1, 1,
0.8097798, 0.6701226, 2.446057, 1, 1, 1, 1, 1,
0.8126739, -1.119258, 2.889163, 1, 1, 1, 1, 1,
0.8176997, -0.5730456, 1.66257, 1, 1, 1, 1, 1,
0.8289769, -0.386557, 1.504394, 1, 1, 1, 1, 1,
0.8326548, -0.4583131, 1.911692, 1, 1, 1, 1, 1,
0.8333678, -0.113863, 1.400461, 1, 1, 1, 1, 1,
0.8394954, 1.444742, 0.7253484, 1, 1, 1, 1, 1,
0.8432441, -0.1103885, 2.240357, 1, 1, 1, 1, 1,
0.8446798, 0.5118597, 2.213598, 1, 1, 1, 1, 1,
0.8560029, 0.1914338, 2.734588, 0, 0, 1, 1, 1,
0.857081, -0.1110655, 2.335873, 1, 0, 0, 1, 1,
0.8573305, 1.676613, 1.148911, 1, 0, 0, 1, 1,
0.8579252, -0.1870209, 0.6634387, 1, 0, 0, 1, 1,
0.859006, 1.477207, 2.161573, 1, 0, 0, 1, 1,
0.8596527, 2.166618, 1.144271, 1, 0, 0, 1, 1,
0.8638979, 1.301629, 0.9611875, 0, 0, 0, 1, 1,
0.8646739, 0.7248302, 0.262553, 0, 0, 0, 1, 1,
0.865306, -1.12673, 2.424864, 0, 0, 0, 1, 1,
0.8653204, 0.1315824, 1.476536, 0, 0, 0, 1, 1,
0.8706406, 0.8060144, 2.673299, 0, 0, 0, 1, 1,
0.8741056, -1.912602, 3.263137, 0, 0, 0, 1, 1,
0.8760487, 0.2253994, 2.299036, 0, 0, 0, 1, 1,
0.8793013, 0.8613883, 2.600334, 1, 1, 1, 1, 1,
0.88013, 0.2036721, 2.401603, 1, 1, 1, 1, 1,
0.8802987, 1.474108, 1.541394, 1, 1, 1, 1, 1,
0.8819574, -0.2858546, 2.619089, 1, 1, 1, 1, 1,
0.8831879, -0.7194422, 2.402434, 1, 1, 1, 1, 1,
0.8855908, -0.8436826, 2.716002, 1, 1, 1, 1, 1,
0.8896862, 1.582802, -0.9276238, 1, 1, 1, 1, 1,
0.8896895, -0.5394238, 1.909643, 1, 1, 1, 1, 1,
0.8933576, 0.3874077, 0.7755162, 1, 1, 1, 1, 1,
0.8949412, 0.2605129, 0.8986018, 1, 1, 1, 1, 1,
0.8993901, 1.294052, 0.04036061, 1, 1, 1, 1, 1,
0.9070239, 2.820884, -0.2384532, 1, 1, 1, 1, 1,
0.912211, 0.6988695, 1.631519, 1, 1, 1, 1, 1,
0.9176728, 0.7626415, 0.8575206, 1, 1, 1, 1, 1,
0.9273946, 1.278711, 2.742824, 1, 1, 1, 1, 1,
0.9314729, 1.439765, 0.3399353, 0, 0, 1, 1, 1,
0.9336815, 1.756755, 1.009104, 1, 0, 0, 1, 1,
0.9362484, 0.2453061, 0.8966072, 1, 0, 0, 1, 1,
0.9414724, -0.2454471, 1.34712, 1, 0, 0, 1, 1,
0.9418591, -1.270217, 2.943473, 1, 0, 0, 1, 1,
0.9444147, 0.9984707, 1.220471, 1, 0, 0, 1, 1,
0.9509302, -1.220652, 2.002694, 0, 0, 0, 1, 1,
0.9528709, 0.07741565, 2.058226, 0, 0, 0, 1, 1,
0.9531679, 0.003658795, 2.351464, 0, 0, 0, 1, 1,
0.9583477, -0.2604575, 3.270457, 0, 0, 0, 1, 1,
0.9694923, 0.4973861, 1.307943, 0, 0, 0, 1, 1,
0.9696584, -1.080881, 1.810452, 0, 0, 0, 1, 1,
0.9761021, 0.1178998, 2.98021, 0, 0, 0, 1, 1,
0.9765257, 0.3845781, 0.1005521, 1, 1, 1, 1, 1,
0.9792025, 0.7167277, 0.1833324, 1, 1, 1, 1, 1,
0.987361, 0.5364826, -0.3392519, 1, 1, 1, 1, 1,
0.9888743, 0.3524225, 1.353725, 1, 1, 1, 1, 1,
0.9896426, -0.9411945, 2.250582, 1, 1, 1, 1, 1,
0.9934673, 0.01833159, 0.5366446, 1, 1, 1, 1, 1,
0.9943991, -1.22833, 1.70842, 1, 1, 1, 1, 1,
0.9956803, -1.410411, 3.167857, 1, 1, 1, 1, 1,
0.9984827, -1.138783, 2.091967, 1, 1, 1, 1, 1,
1.003752, 0.3900142, 0.4988885, 1, 1, 1, 1, 1,
1.006283, 0.9886633, 1.898658, 1, 1, 1, 1, 1,
1.01362, -0.06531455, 1.141191, 1, 1, 1, 1, 1,
1.016279, -0.3311133, 2.765292, 1, 1, 1, 1, 1,
1.025388, -0.4066447, 1.694497, 1, 1, 1, 1, 1,
1.026182, 1.983101, 0.5521266, 1, 1, 1, 1, 1,
1.026699, 0.3933661, 2.816432, 0, 0, 1, 1, 1,
1.037388, -1.429771, 3.836284, 1, 0, 0, 1, 1,
1.039822, 1.413547, 1.640156, 1, 0, 0, 1, 1,
1.040199, -0.9273102, 3.06776, 1, 0, 0, 1, 1,
1.053018, 2.21368, 1.581578, 1, 0, 0, 1, 1,
1.053292, -0.3360495, 1.054596, 1, 0, 0, 1, 1,
1.058265, -0.6946355, 1.450949, 0, 0, 0, 1, 1,
1.059955, 0.08022624, 2.220614, 0, 0, 0, 1, 1,
1.066424, 0.6021138, -0.4935435, 0, 0, 0, 1, 1,
1.069365, 1.073507, 0.6570612, 0, 0, 0, 1, 1,
1.071137, 1.316854, -0.3309443, 0, 0, 0, 1, 1,
1.077064, 0.4839199, 1.343604, 0, 0, 0, 1, 1,
1.0897, 0.2278818, 2.114452, 0, 0, 0, 1, 1,
1.096418, 0.07388915, 1.649555, 1, 1, 1, 1, 1,
1.102239, 1.822341, -0.298299, 1, 1, 1, 1, 1,
1.109583, -0.06681172, 2.668011, 1, 1, 1, 1, 1,
1.113669, -1.438075, 3.778236, 1, 1, 1, 1, 1,
1.126399, 0.3490317, 0.395682, 1, 1, 1, 1, 1,
1.126614, 0.5194631, 2.325036, 1, 1, 1, 1, 1,
1.126634, 0.1596825, 0.3904596, 1, 1, 1, 1, 1,
1.127828, 1.424256, -1.108749, 1, 1, 1, 1, 1,
1.13302, 0.3986772, 2.154341, 1, 1, 1, 1, 1,
1.133515, 0.8210101, 0.599649, 1, 1, 1, 1, 1,
1.133832, 0.7191375, 2.256652, 1, 1, 1, 1, 1,
1.140352, -0.2260244, 1.444849, 1, 1, 1, 1, 1,
1.141161, 0.8545308, 1.683157, 1, 1, 1, 1, 1,
1.143913, -2.01174, 1.883601, 1, 1, 1, 1, 1,
1.14761, -0.9300151, 1.654347, 1, 1, 1, 1, 1,
1.148124, -0.2281841, 0.3733513, 0, 0, 1, 1, 1,
1.151277, -0.05172414, 1.308946, 1, 0, 0, 1, 1,
1.152272, 0.2467022, 1.634522, 1, 0, 0, 1, 1,
1.15482, 0.1240932, 1.973258, 1, 0, 0, 1, 1,
1.157415, -0.5489067, 0.5733309, 1, 0, 0, 1, 1,
1.168497, -2.403667, 2.935386, 1, 0, 0, 1, 1,
1.17427, 2.108048, 1.109853, 0, 0, 0, 1, 1,
1.176416, 1.272263, 0.5142144, 0, 0, 0, 1, 1,
1.176991, 0.878313, -1.14839, 0, 0, 0, 1, 1,
1.177772, -2.01894, 1.733512, 0, 0, 0, 1, 1,
1.178472, 0.1250511, -0.06470159, 0, 0, 0, 1, 1,
1.184194, 0.540425, 0.6840264, 0, 0, 0, 1, 1,
1.192274, -1.272425, 1.421256, 0, 0, 0, 1, 1,
1.211733, -1.063815, 3.904254, 1, 1, 1, 1, 1,
1.221277, -0.6042118, 1.30934, 1, 1, 1, 1, 1,
1.224585, -0.087184, 1.48317, 1, 1, 1, 1, 1,
1.224946, -0.5485175, 1.239565, 1, 1, 1, 1, 1,
1.230817, 0.7543873, -0.4886776, 1, 1, 1, 1, 1,
1.235915, 0.0640678, 1.970511, 1, 1, 1, 1, 1,
1.23752, -2.380631, 1.952033, 1, 1, 1, 1, 1,
1.240666, 0.708689, 0.2794838, 1, 1, 1, 1, 1,
1.244231, 0.1184501, 2.101024, 1, 1, 1, 1, 1,
1.277722, 0.2738319, 2.55889, 1, 1, 1, 1, 1,
1.285982, -1.269657, 1.050566, 1, 1, 1, 1, 1,
1.28611, -0.8563187, 1.963192, 1, 1, 1, 1, 1,
1.306625, 0.425737, 1.952502, 1, 1, 1, 1, 1,
1.306948, 1.50781, 0.1233192, 1, 1, 1, 1, 1,
1.312011, 1.172093, 0.4315276, 1, 1, 1, 1, 1,
1.313452, 1.303848, 1.148727, 0, 0, 1, 1, 1,
1.313907, -2.186079, 2.961862, 1, 0, 0, 1, 1,
1.314568, 0.7704688, 0.1480177, 1, 0, 0, 1, 1,
1.319671, -1.236666, 3.147554, 1, 0, 0, 1, 1,
1.321443, 0.55864, 2.056075, 1, 0, 0, 1, 1,
1.321786, 0.2517571, 0.3477455, 1, 0, 0, 1, 1,
1.325102, -0.0003553645, 2.411268, 0, 0, 0, 1, 1,
1.332777, -0.8442946, 1.723318, 0, 0, 0, 1, 1,
1.365221, 2.167259, 0.9341637, 0, 0, 0, 1, 1,
1.371009, -0.173185, 1.086286, 0, 0, 0, 1, 1,
1.373595, 0.005624939, -0.371962, 0, 0, 0, 1, 1,
1.381366, 0.2690538, 1.503798, 0, 0, 0, 1, 1,
1.390253, -0.09304276, 2.070575, 0, 0, 0, 1, 1,
1.395786, -0.3594857, 2.184723, 1, 1, 1, 1, 1,
1.402256, -2.312588, 2.385741, 1, 1, 1, 1, 1,
1.403352, -2.157927, 2.367298, 1, 1, 1, 1, 1,
1.40557, 0.678043, 2.009094, 1, 1, 1, 1, 1,
1.40919, 0.4217858, 0.9185355, 1, 1, 1, 1, 1,
1.428185, -0.9661817, 1.39067, 1, 1, 1, 1, 1,
1.433706, 0.7975984, 0.4492131, 1, 1, 1, 1, 1,
1.436903, 1.059625, 1.191716, 1, 1, 1, 1, 1,
1.441583, -2.355362, 1.805252, 1, 1, 1, 1, 1,
1.442322, -0.792788, 1.98786, 1, 1, 1, 1, 1,
1.445755, -0.9531102, -0.1983172, 1, 1, 1, 1, 1,
1.446744, 0.3792903, 1.578723, 1, 1, 1, 1, 1,
1.455006, 0.4606521, 1.864437, 1, 1, 1, 1, 1,
1.462839, -1.272461, 2.560178, 1, 1, 1, 1, 1,
1.463269, 1.51285, 0.7037072, 1, 1, 1, 1, 1,
1.469882, 0.4506785, 2.117173, 0, 0, 1, 1, 1,
1.478056, 0.4274044, 1.828415, 1, 0, 0, 1, 1,
1.486771, 0.02268765, 2.091268, 1, 0, 0, 1, 1,
1.492688, 0.2554925, 0.8227041, 1, 0, 0, 1, 1,
1.495969, -0.1455776, 2.439544, 1, 0, 0, 1, 1,
1.506078, -1.442151, 2.340084, 1, 0, 0, 1, 1,
1.507005, -0.8765041, 0.2892472, 0, 0, 0, 1, 1,
1.512589, 0.5555624, 1.152028, 0, 0, 0, 1, 1,
1.521075, -0.8709335, 3.179338, 0, 0, 0, 1, 1,
1.540096, -1.74827, 3.037253, 0, 0, 0, 1, 1,
1.543129, -1.019043, 0.59171, 0, 0, 0, 1, 1,
1.558644, -0.467622, 2.920439, 0, 0, 0, 1, 1,
1.567275, 1.357824, 1.138423, 0, 0, 0, 1, 1,
1.568947, 0.4468567, -0.1604831, 1, 1, 1, 1, 1,
1.572057, -0.2183377, 1.607907, 1, 1, 1, 1, 1,
1.572361, -0.1858485, 0.7636247, 1, 1, 1, 1, 1,
1.593422, 0.1431566, 1.957994, 1, 1, 1, 1, 1,
1.611023, -0.1583608, 1.109994, 1, 1, 1, 1, 1,
1.615115, 0.01958605, 2.014588, 1, 1, 1, 1, 1,
1.624312, 1.694514, 1.3516, 1, 1, 1, 1, 1,
1.627525, 0.1166837, 0.8163923, 1, 1, 1, 1, 1,
1.635713, 0.6273659, 1.666818, 1, 1, 1, 1, 1,
1.643351, -0.2739237, 1.570078, 1, 1, 1, 1, 1,
1.648561, -0.2534862, -0.8717275, 1, 1, 1, 1, 1,
1.65472, -0.3342555, 0.8262735, 1, 1, 1, 1, 1,
1.674025, -0.8190953, 2.475603, 1, 1, 1, 1, 1,
1.674125, 1.114526, 1.20126, 1, 1, 1, 1, 1,
1.678228, 0.5847457, 0.7036186, 1, 1, 1, 1, 1,
1.687349, -0.1814199, 0.8936439, 0, 0, 1, 1, 1,
1.690512, -0.0592996, 0.8860648, 1, 0, 0, 1, 1,
1.698854, -1.347726, 2.534605, 1, 0, 0, 1, 1,
1.702858, 0.2259573, 0.4780664, 1, 0, 0, 1, 1,
1.704403, -0.582743, 2.699059, 1, 0, 0, 1, 1,
1.717569, 0.3568305, -0.3044998, 1, 0, 0, 1, 1,
1.734563, -0.657669, 1.407446, 0, 0, 0, 1, 1,
1.738149, 1.589652, 0.1562117, 0, 0, 0, 1, 1,
1.741397, 0.328264, 2.094165, 0, 0, 0, 1, 1,
1.751285, 1.38079, 0.8900107, 0, 0, 0, 1, 1,
1.770097, -0.2131725, 3.619409, 0, 0, 0, 1, 1,
1.781039, 1.306824, -0.5705975, 0, 0, 0, 1, 1,
1.782008, 1.274878, 0.8267593, 0, 0, 0, 1, 1,
1.799742, 1.581592, 1.902903, 1, 1, 1, 1, 1,
1.810728, 0.848087, 1.097527, 1, 1, 1, 1, 1,
1.81485, -0.9288362, 3.551527, 1, 1, 1, 1, 1,
1.815541, -1.196611, 2.845928, 1, 1, 1, 1, 1,
1.819177, 1.159782, 0.8188381, 1, 1, 1, 1, 1,
1.834694, 0.7623057, 2.012426, 1, 1, 1, 1, 1,
1.836647, -0.1878491, -0.5645563, 1, 1, 1, 1, 1,
1.842876, -0.4171484, 0.866873, 1, 1, 1, 1, 1,
1.857318, -0.5378312, 1.582225, 1, 1, 1, 1, 1,
1.870657, 0.4200614, 2.505669, 1, 1, 1, 1, 1,
1.901453, -0.8255513, 3.44345, 1, 1, 1, 1, 1,
1.909157, 0.4703398, 0.9564003, 1, 1, 1, 1, 1,
1.950185, -0.6353226, 2.51367, 1, 1, 1, 1, 1,
1.978353, -0.1124301, 1.86326, 1, 1, 1, 1, 1,
2.000656, 1.786821, 0.8695803, 1, 1, 1, 1, 1,
2.007464, -1.481963, 2.263078, 0, 0, 1, 1, 1,
2.041231, -1.116244, 1.873798, 1, 0, 0, 1, 1,
2.072424, -0.1522915, 2.76938, 1, 0, 0, 1, 1,
2.085662, 1.000322, 0.7214892, 1, 0, 0, 1, 1,
2.089186, 0.279653, 1.876413, 1, 0, 0, 1, 1,
2.124744, 0.1016995, 1.053199, 1, 0, 0, 1, 1,
2.128629, -0.2887792, 1.994545, 0, 0, 0, 1, 1,
2.141785, -1.150165, 2.967197, 0, 0, 0, 1, 1,
2.210789, -1.099364, -0.6796719, 0, 0, 0, 1, 1,
2.263661, 1.483652, 0.2631985, 0, 0, 0, 1, 1,
2.298729, -1.664848, 2.346965, 0, 0, 0, 1, 1,
2.340397, 0.4412658, 1.190228, 0, 0, 0, 1, 1,
2.387425, -0.8753186, -0.1045293, 0, 0, 0, 1, 1,
2.391506, 2.396378, 0.8616453, 1, 1, 1, 1, 1,
2.417594, 0.9566425, -0.247934, 1, 1, 1, 1, 1,
2.457764, -2.762168, 2.834631, 1, 1, 1, 1, 1,
2.544635, 0.1523378, 2.800402, 1, 1, 1, 1, 1,
2.588267, -0.3222019, 2.405334, 1, 1, 1, 1, 1,
2.866212, -0.3464829, 1.604088, 1, 1, 1, 1, 1,
2.968772, 0.3304964, -0.1651262, 1, 1, 1, 1, 1
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
var radius = 9.667152;
var distance = 33.95546;
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
mvMatrix.translate( 0.02941525, -0.2230554, -0.02214265 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.95546);
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
