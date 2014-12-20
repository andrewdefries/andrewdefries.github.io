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
-3.660514, -0.8330284, -0.7343507, 1, 0, 0, 1,
-3.256602, 1.793955, -2.038502, 1, 0.007843138, 0, 1,
-2.980049, 0.8539823, 0.4782346, 1, 0.01176471, 0, 1,
-2.667554, -1.382305, -1.680666, 1, 0.01960784, 0, 1,
-2.66165, -0.7269059, -0.6365595, 1, 0.02352941, 0, 1,
-2.657071, 0.004602693, -0.2098555, 1, 0.03137255, 0, 1,
-2.615392, -0.7107909, -1.874554, 1, 0.03529412, 0, 1,
-2.60125, 1.167445, -1.70334, 1, 0.04313726, 0, 1,
-2.572901, -2.29531, -1.859161, 1, 0.04705882, 0, 1,
-2.559132, -0.9749153, -0.5953229, 1, 0.05490196, 0, 1,
-2.556181, -0.3035973, -1.980493, 1, 0.05882353, 0, 1,
-2.432686, -0.3863701, -1.146241, 1, 0.06666667, 0, 1,
-2.388679, 1.309209, -1.322453, 1, 0.07058824, 0, 1,
-2.300411, -1.420447, -0.528901, 1, 0.07843138, 0, 1,
-2.295092, 1.266835, -2.348693, 1, 0.08235294, 0, 1,
-2.294147, -0.7777894, -2.464685, 1, 0.09019608, 0, 1,
-2.287418, -0.7830666, -3.547527, 1, 0.09411765, 0, 1,
-2.280138, 0.7866508, -1.879597, 1, 0.1019608, 0, 1,
-2.209716, 0.3822139, -2.170349, 1, 0.1098039, 0, 1,
-2.14328, -0.8172765, -2.309824, 1, 0.1137255, 0, 1,
-2.130886, 1.081195, -1.696079, 1, 0.1215686, 0, 1,
-2.113465, 0.4552854, -0.7589287, 1, 0.1254902, 0, 1,
-2.103743, -0.008491448, -0.8134265, 1, 0.1333333, 0, 1,
-2.065418, -0.5130686, -2.369915, 1, 0.1372549, 0, 1,
-2.060337, 1.518518, 1.680407, 1, 0.145098, 0, 1,
-2.057588, 0.3242323, -0.09890126, 1, 0.1490196, 0, 1,
-2.016377, -1.117586, -0.0004089636, 1, 0.1568628, 0, 1,
-1.99165, -1.082928, -3.815163, 1, 0.1607843, 0, 1,
-1.97035, 0.7415434, -3.391208, 1, 0.1686275, 0, 1,
-1.944128, -2.451288, -2.97803, 1, 0.172549, 0, 1,
-1.93332, 0.3698919, 0.07587584, 1, 0.1803922, 0, 1,
-1.931746, -0.01354682, -1.408724, 1, 0.1843137, 0, 1,
-1.918209, -0.7585053, -3.274034, 1, 0.1921569, 0, 1,
-1.911827, -0.0201527, -1.264365, 1, 0.1960784, 0, 1,
-1.910611, 1.022283, 0.34835, 1, 0.2039216, 0, 1,
-1.88022, 0.5219073, -0.3519607, 1, 0.2117647, 0, 1,
-1.868528, 0.3489645, -1.24715, 1, 0.2156863, 0, 1,
-1.866163, 1.384855, -1.499173, 1, 0.2235294, 0, 1,
-1.861215, -0.2547908, -3.088853, 1, 0.227451, 0, 1,
-1.852708, 0.8993418, 0.03762609, 1, 0.2352941, 0, 1,
-1.848775, 1.364991, -1.890279, 1, 0.2392157, 0, 1,
-1.834175, 1.604164, -1.386068, 1, 0.2470588, 0, 1,
-1.826519, -0.5538213, -0.606249, 1, 0.2509804, 0, 1,
-1.823889, 0.8966984, -0.9163383, 1, 0.2588235, 0, 1,
-1.821149, -0.486268, -1.42062, 1, 0.2627451, 0, 1,
-1.820617, -0.5187767, -0.9080446, 1, 0.2705882, 0, 1,
-1.820592, 0.3866698, -1.560567, 1, 0.2745098, 0, 1,
-1.816332, 1.173425, -1.153167, 1, 0.282353, 0, 1,
-1.810209, -1.390206, -2.775801, 1, 0.2862745, 0, 1,
-1.803908, -1.964284, -3.450952, 1, 0.2941177, 0, 1,
-1.78949, 0.4591922, 0.4350226, 1, 0.3019608, 0, 1,
-1.77887, -0.7581998, -1.908004, 1, 0.3058824, 0, 1,
-1.767838, 0.1862235, -2.846302, 1, 0.3137255, 0, 1,
-1.764019, 2.098641, -0.3401608, 1, 0.3176471, 0, 1,
-1.758683, -0.5926673, -3.777497, 1, 0.3254902, 0, 1,
-1.743063, 0.9281991, -1.447062, 1, 0.3294118, 0, 1,
-1.730277, -0.8493999, -2.532077, 1, 0.3372549, 0, 1,
-1.725062, 1.723771, -0.6923305, 1, 0.3411765, 0, 1,
-1.721361, -0.7296682, -0.400453, 1, 0.3490196, 0, 1,
-1.711782, 1.174178, -1.123999, 1, 0.3529412, 0, 1,
-1.705182, 0.9114682, -2.73463, 1, 0.3607843, 0, 1,
-1.692796, 0.3770135, -2.509358, 1, 0.3647059, 0, 1,
-1.675307, 0.4694423, -2.001475, 1, 0.372549, 0, 1,
-1.663027, -0.4094036, -1.156315, 1, 0.3764706, 0, 1,
-1.661951, -0.5892798, -0.8728206, 1, 0.3843137, 0, 1,
-1.658877, 1.132177, -0.8687783, 1, 0.3882353, 0, 1,
-1.622555, -0.8318291, -4.056978, 1, 0.3960784, 0, 1,
-1.616182, -1.102041, -2.605322, 1, 0.4039216, 0, 1,
-1.593998, -0.1210728, -1.301364, 1, 0.4078431, 0, 1,
-1.591745, 2.588382, -1.372617, 1, 0.4156863, 0, 1,
-1.590456, 1.322755, -1.032609, 1, 0.4196078, 0, 1,
-1.588327, 1.065933, -1.29818, 1, 0.427451, 0, 1,
-1.574853, 0.201581, -1.40071, 1, 0.4313726, 0, 1,
-1.571336, 0.4426932, -0.3983437, 1, 0.4392157, 0, 1,
-1.567771, 0.984497, -3.380062, 1, 0.4431373, 0, 1,
-1.555542, 1.23181, -1.555149, 1, 0.4509804, 0, 1,
-1.543887, -0.365556, -1.730997, 1, 0.454902, 0, 1,
-1.529335, -0.1104093, -2.579276, 1, 0.4627451, 0, 1,
-1.528333, -1.749502, -3.21795, 1, 0.4666667, 0, 1,
-1.518881, -1.232829, -1.507873, 1, 0.4745098, 0, 1,
-1.50154, -1.029962, -2.176797, 1, 0.4784314, 0, 1,
-1.5002, 0.9971265, -1.147364, 1, 0.4862745, 0, 1,
-1.49629, -2.68025, -2.755657, 1, 0.4901961, 0, 1,
-1.483094, -2.557157, -2.267662, 1, 0.4980392, 0, 1,
-1.479897, -0.9058189, -1.384386, 1, 0.5058824, 0, 1,
-1.478333, -0.4944467, -3.283419, 1, 0.509804, 0, 1,
-1.477178, -0.1982551, -3.12687, 1, 0.5176471, 0, 1,
-1.472315, -0.1665401, -2.501338, 1, 0.5215687, 0, 1,
-1.44043, -0.3031385, -0.7157013, 1, 0.5294118, 0, 1,
-1.434455, 1.708314, 0.3854946, 1, 0.5333334, 0, 1,
-1.427115, -0.4015651, -3.284739, 1, 0.5411765, 0, 1,
-1.419977, 0.9957165, -1.23796, 1, 0.5450981, 0, 1,
-1.414026, 0.1276213, -0.9907644, 1, 0.5529412, 0, 1,
-1.3973, 0.3073489, -2.486801, 1, 0.5568628, 0, 1,
-1.394355, 1.269862, -0.0955458, 1, 0.5647059, 0, 1,
-1.387117, -1.419922, -0.8464848, 1, 0.5686275, 0, 1,
-1.338332, -2.1267, -3.054368, 1, 0.5764706, 0, 1,
-1.32594, 0.0735103, -1.254138, 1, 0.5803922, 0, 1,
-1.319986, 1.464498, -2.599671, 1, 0.5882353, 0, 1,
-1.317793, -0.3250528, -1.846152, 1, 0.5921569, 0, 1,
-1.315561, 0.06635097, -1.443069, 1, 0.6, 0, 1,
-1.314649, -0.7813533, -2.228779, 1, 0.6078432, 0, 1,
-1.308786, 0.4226473, -1.462126, 1, 0.6117647, 0, 1,
-1.300267, 0.1438457, -1.852648, 1, 0.6196079, 0, 1,
-1.29759, -0.6230748, -1.778592, 1, 0.6235294, 0, 1,
-1.289699, -0.02313915, -2.036137, 1, 0.6313726, 0, 1,
-1.287034, 1.608366, -1.216539, 1, 0.6352941, 0, 1,
-1.28474, 0.04214004, -1.989423, 1, 0.6431373, 0, 1,
-1.283107, 0.2847613, -0.7193293, 1, 0.6470588, 0, 1,
-1.279191, -0.2056787, -1.107162, 1, 0.654902, 0, 1,
-1.274529, -0.04279634, -0.9921874, 1, 0.6588235, 0, 1,
-1.265895, 0.916586, 0.6618174, 1, 0.6666667, 0, 1,
-1.26475, 0.4350931, -3.017634, 1, 0.6705883, 0, 1,
-1.255112, -0.2557665, -0.6311218, 1, 0.6784314, 0, 1,
-1.247951, -1.024497, -4.049373, 1, 0.682353, 0, 1,
-1.24416, 0.7795559, -1.087644, 1, 0.6901961, 0, 1,
-1.240114, -0.9618356, -1.419614, 1, 0.6941177, 0, 1,
-1.233143, -2.111355, -3.021119, 1, 0.7019608, 0, 1,
-1.232556, -0.5005483, -1.867226, 1, 0.7098039, 0, 1,
-1.222774, -0.606566, -3.729891, 1, 0.7137255, 0, 1,
-1.21094, 0.6799096, -0.4864665, 1, 0.7215686, 0, 1,
-1.20938, -0.4475151, -1.745703, 1, 0.7254902, 0, 1,
-1.196501, -0.2343, -1.766694, 1, 0.7333333, 0, 1,
-1.184812, -0.5156538, -3.15727, 1, 0.7372549, 0, 1,
-1.184403, -0.4297257, -2.839598, 1, 0.7450981, 0, 1,
-1.169224, 0.4381046, -1.854514, 1, 0.7490196, 0, 1,
-1.167555, 0.6490129, 0.2240529, 1, 0.7568628, 0, 1,
-1.163696, -1.593928, -3.377593, 1, 0.7607843, 0, 1,
-1.155768, 0.8139682, -1.240974, 1, 0.7686275, 0, 1,
-1.151585, 2.059508, 0.7875355, 1, 0.772549, 0, 1,
-1.146381, -0.1994841, -3.04166, 1, 0.7803922, 0, 1,
-1.134433, -0.1498051, -1.548433, 1, 0.7843137, 0, 1,
-1.132919, -0.1899456, -0.8505315, 1, 0.7921569, 0, 1,
-1.132266, 0.2934113, -1.121136, 1, 0.7960784, 0, 1,
-1.111469, 0.7941796, -1.777924, 1, 0.8039216, 0, 1,
-1.111382, 0.2944058, -1.102578, 1, 0.8117647, 0, 1,
-1.111115, -0.3307239, -0.5433393, 1, 0.8156863, 0, 1,
-1.103669, 0.1980388, -1.467058, 1, 0.8235294, 0, 1,
-1.103459, -0.3817742, -1.54473, 1, 0.827451, 0, 1,
-1.101486, -1.136465, -1.276965, 1, 0.8352941, 0, 1,
-1.098673, 0.1917159, -1.85688, 1, 0.8392157, 0, 1,
-1.096358, 0.7154874, -0.3051023, 1, 0.8470588, 0, 1,
-1.09123, 0.3560997, -2.351194, 1, 0.8509804, 0, 1,
-1.089009, -0.1405923, -1.915389, 1, 0.8588235, 0, 1,
-1.080053, 0.2754445, 0.08940345, 1, 0.8627451, 0, 1,
-1.076106, -0.01403828, -1.610072, 1, 0.8705882, 0, 1,
-1.066531, -2.207076, -1.084282, 1, 0.8745098, 0, 1,
-1.066063, 0.8702905, -0.7823184, 1, 0.8823529, 0, 1,
-1.050328, -0.6406875, -1.693548, 1, 0.8862745, 0, 1,
-1.037686, 1.985135, -0.9966071, 1, 0.8941177, 0, 1,
-1.034169, -0.5202208, -2.513794, 1, 0.8980392, 0, 1,
-1.01448, -0.6632372, -3.428468, 1, 0.9058824, 0, 1,
-1.003821, 0.6717284, -1.079288, 1, 0.9137255, 0, 1,
-1.001858, 0.6901615, -0.6907642, 1, 0.9176471, 0, 1,
-1.001268, -0.9118893, -1.320743, 1, 0.9254902, 0, 1,
-0.9939495, -0.3678096, -3.466295, 1, 0.9294118, 0, 1,
-0.9880777, 0.638472, -0.4802543, 1, 0.9372549, 0, 1,
-0.9856011, -1.000827, -2.374223, 1, 0.9411765, 0, 1,
-0.9853359, -1.32816, -2.663343, 1, 0.9490196, 0, 1,
-0.9820691, 0.7528567, -1.629445, 1, 0.9529412, 0, 1,
-0.9781833, -1.020467, -2.69632, 1, 0.9607843, 0, 1,
-0.9767842, -0.497944, -3.390198, 1, 0.9647059, 0, 1,
-0.9702492, 0.4819856, -0.03154336, 1, 0.972549, 0, 1,
-0.9617846, 0.6209058, -1.347096, 1, 0.9764706, 0, 1,
-0.9550332, 1.02932, 0.4779686, 1, 0.9843137, 0, 1,
-0.9520674, 0.2268759, -2.354055, 1, 0.9882353, 0, 1,
-0.9460906, 0.01607813, -1.021971, 1, 0.9960784, 0, 1,
-0.936852, 1.196945, -0.4409348, 0.9960784, 1, 0, 1,
-0.9291084, -0.6456848, -2.964116, 0.9921569, 1, 0, 1,
-0.926277, 0.1698396, -1.639457, 0.9843137, 1, 0, 1,
-0.9220835, 0.2394582, -1.335376, 0.9803922, 1, 0, 1,
-0.9195771, -0.6069336, -3.606185, 0.972549, 1, 0, 1,
-0.9185011, -0.4013359, -0.9785192, 0.9686275, 1, 0, 1,
-0.9142405, 0.310104, -2.229328, 0.9607843, 1, 0, 1,
-0.9102578, 0.1225549, -3.17119, 0.9568627, 1, 0, 1,
-0.9017733, 1.356172, -1.636123, 0.9490196, 1, 0, 1,
-0.8973512, 0.331964, -1.683768, 0.945098, 1, 0, 1,
-0.8966329, -0.4560146, -4.741343, 0.9372549, 1, 0, 1,
-0.8927043, 0.1042515, -2.180047, 0.9333333, 1, 0, 1,
-0.8907518, 0.3794728, 0.8023478, 0.9254902, 1, 0, 1,
-0.8899474, 0.4869874, -1.211542, 0.9215686, 1, 0, 1,
-0.8890458, -0.01960561, -1.914729, 0.9137255, 1, 0, 1,
-0.8766065, -0.9533968, -1.05822, 0.9098039, 1, 0, 1,
-0.8726861, -0.01468517, -4.384644, 0.9019608, 1, 0, 1,
-0.8675133, 0.2007769, -1.224434, 0.8941177, 1, 0, 1,
-0.8670096, -0.8310125, -3.387753, 0.8901961, 1, 0, 1,
-0.8528928, -0.8326119, -1.627752, 0.8823529, 1, 0, 1,
-0.8485683, -0.9006772, -2.863811, 0.8784314, 1, 0, 1,
-0.8429623, -0.6050925, -2.946598, 0.8705882, 1, 0, 1,
-0.8417564, -0.7428035, -2.040949, 0.8666667, 1, 0, 1,
-0.8411463, -1.710712, -1.222436, 0.8588235, 1, 0, 1,
-0.8384709, -0.8519781, -2.662176, 0.854902, 1, 0, 1,
-0.8372282, 0.2427911, -0.92009, 0.8470588, 1, 0, 1,
-0.8336022, 0.1313207, -0.3950473, 0.8431373, 1, 0, 1,
-0.8328942, -0.7566622, -2.08212, 0.8352941, 1, 0, 1,
-0.8282951, 0.8806802, -0.7224129, 0.8313726, 1, 0, 1,
-0.826899, -1.594479, -3.438751, 0.8235294, 1, 0, 1,
-0.8261696, -0.6320904, -1.868265, 0.8196079, 1, 0, 1,
-0.8118129, -0.1014935, -1.119482, 0.8117647, 1, 0, 1,
-0.8080053, 0.06579457, -1.493071, 0.8078431, 1, 0, 1,
-0.8074036, -0.5673747, -0.6206414, 0.8, 1, 0, 1,
-0.8061258, -0.04174083, -1.746446, 0.7921569, 1, 0, 1,
-0.805596, 0.5268417, -0.8452309, 0.7882353, 1, 0, 1,
-0.8050149, -0.8739486, -2.185918, 0.7803922, 1, 0, 1,
-0.8015124, 0.4990015, -1.110117, 0.7764706, 1, 0, 1,
-0.8003523, 0.9056686, -1.759781, 0.7686275, 1, 0, 1,
-0.7984911, 0.5231576, -2.02903, 0.7647059, 1, 0, 1,
-0.7970955, -0.9870332, -2.880481, 0.7568628, 1, 0, 1,
-0.7955605, -0.6112935, -2.387973, 0.7529412, 1, 0, 1,
-0.7904932, -0.08792331, -1.877057, 0.7450981, 1, 0, 1,
-0.7890621, -1.427835, -2.31359, 0.7411765, 1, 0, 1,
-0.7869316, -1.037288, -2.266775, 0.7333333, 1, 0, 1,
-0.7829146, -1.139397, -2.192395, 0.7294118, 1, 0, 1,
-0.7823861, 0.5080431, -0.1128253, 0.7215686, 1, 0, 1,
-0.7798579, 0.649026, 0.2145346, 0.7176471, 1, 0, 1,
-0.7759832, -0.6161436, -2.055176, 0.7098039, 1, 0, 1,
-0.774967, -0.0278468, -1.279722, 0.7058824, 1, 0, 1,
-0.7741977, -0.1435843, -0.8026761, 0.6980392, 1, 0, 1,
-0.7736393, 0.2838143, -2.560561, 0.6901961, 1, 0, 1,
-0.7709025, -1.813863, -3.126569, 0.6862745, 1, 0, 1,
-0.7660363, -1.853664, -3.441755, 0.6784314, 1, 0, 1,
-0.7639325, 1.725537, -1.039109, 0.6745098, 1, 0, 1,
-0.7632553, -0.7251896, -2.032038, 0.6666667, 1, 0, 1,
-0.7616001, -0.934552, -3.923332, 0.6627451, 1, 0, 1,
-0.7566745, -0.982232, -3.1639, 0.654902, 1, 0, 1,
-0.7559695, 0.08427998, -0.4486929, 0.6509804, 1, 0, 1,
-0.7545377, -0.8917475, -2.656259, 0.6431373, 1, 0, 1,
-0.7538123, -1.256349, -1.566725, 0.6392157, 1, 0, 1,
-0.7505507, -1.87142, -1.405841, 0.6313726, 1, 0, 1,
-0.7468985, 0.9117182, 0.265936, 0.627451, 1, 0, 1,
-0.7464379, -1.002692, -2.42663, 0.6196079, 1, 0, 1,
-0.7409441, -0.7581105, -3.133702, 0.6156863, 1, 0, 1,
-0.7383083, 0.4034615, -2.528946, 0.6078432, 1, 0, 1,
-0.7362522, 0.874861, -0.8578841, 0.6039216, 1, 0, 1,
-0.7339097, -0.8206809, -3.761909, 0.5960785, 1, 0, 1,
-0.7300383, -0.3146078, -3.143901, 0.5882353, 1, 0, 1,
-0.7273058, 1.769947, -1.154359, 0.5843138, 1, 0, 1,
-0.7255101, 0.3893055, -1.031754, 0.5764706, 1, 0, 1,
-0.7243219, -0.4510832, -2.313673, 0.572549, 1, 0, 1,
-0.7235143, -0.4962898, -3.893884, 0.5647059, 1, 0, 1,
-0.7232188, 0.08557116, -2.799297, 0.5607843, 1, 0, 1,
-0.7118866, -0.4877381, -0.875163, 0.5529412, 1, 0, 1,
-0.7068284, -0.3295249, -1.879426, 0.5490196, 1, 0, 1,
-0.6966277, 0.04395526, -1.204987, 0.5411765, 1, 0, 1,
-0.6958315, -0.6334346, -1.834302, 0.5372549, 1, 0, 1,
-0.6906481, 0.4816735, -3.073147, 0.5294118, 1, 0, 1,
-0.6890479, 0.1053007, -0.8231843, 0.5254902, 1, 0, 1,
-0.6887712, 0.5223324, -1.32731, 0.5176471, 1, 0, 1,
-0.6858789, -0.8662028, -3.18856, 0.5137255, 1, 0, 1,
-0.6853784, -0.6740286, -3.499793, 0.5058824, 1, 0, 1,
-0.6834162, 0.09830981, -1.694064, 0.5019608, 1, 0, 1,
-0.6792715, -1.351015, -3.612137, 0.4941176, 1, 0, 1,
-0.6756725, 0.5043204, -0.7956091, 0.4862745, 1, 0, 1,
-0.6739235, 0.6903535, -0.2845663, 0.4823529, 1, 0, 1,
-0.6695819, -1.140935, -1.118245, 0.4745098, 1, 0, 1,
-0.6665365, 0.6021317, -0.2081397, 0.4705882, 1, 0, 1,
-0.6559651, 0.926984, 0.1100577, 0.4627451, 1, 0, 1,
-0.6517216, 1.068144, -1.749426, 0.4588235, 1, 0, 1,
-0.6495317, -1.315805, -2.848807, 0.4509804, 1, 0, 1,
-0.6454711, 1.431332, -3.347397, 0.4470588, 1, 0, 1,
-0.6392796, 0.5494923, -1.429607, 0.4392157, 1, 0, 1,
-0.6391634, 2.206485, -0.6673399, 0.4352941, 1, 0, 1,
-0.6375391, -0.6532147, -1.185791, 0.427451, 1, 0, 1,
-0.6339694, -2.2544, -2.625248, 0.4235294, 1, 0, 1,
-0.6323975, 1.320313, 0.585376, 0.4156863, 1, 0, 1,
-0.62755, 0.1004419, -1.145672, 0.4117647, 1, 0, 1,
-0.6262745, 1.433103, 0.7618805, 0.4039216, 1, 0, 1,
-0.6242317, -0.299341, -0.7964162, 0.3960784, 1, 0, 1,
-0.6240848, -0.9646829, -1.853179, 0.3921569, 1, 0, 1,
-0.6238511, -0.3238782, -3.980943, 0.3843137, 1, 0, 1,
-0.6231211, 0.9104936, -2.263511, 0.3803922, 1, 0, 1,
-0.6154513, -1.540383, -3.451119, 0.372549, 1, 0, 1,
-0.6092415, -1.991177, -3.021331, 0.3686275, 1, 0, 1,
-0.6071088, -0.7771574, -3.01313, 0.3607843, 1, 0, 1,
-0.6059605, 0.2606139, -2.049124, 0.3568628, 1, 0, 1,
-0.5947632, 0.2964625, -1.993152, 0.3490196, 1, 0, 1,
-0.5886526, -1.903151, -0.5701562, 0.345098, 1, 0, 1,
-0.5868106, 0.5341209, -1.845152, 0.3372549, 1, 0, 1,
-0.5849771, 0.08890566, -2.065121, 0.3333333, 1, 0, 1,
-0.5838762, 0.2400078, -2.148972, 0.3254902, 1, 0, 1,
-0.5817822, -1.567338, -0.8873748, 0.3215686, 1, 0, 1,
-0.5800374, 1.976536, -0.5175052, 0.3137255, 1, 0, 1,
-0.5797438, -0.2168936, -1.568682, 0.3098039, 1, 0, 1,
-0.5789428, -1.401102, -3.953344, 0.3019608, 1, 0, 1,
-0.5738562, -0.751105, -2.507485, 0.2941177, 1, 0, 1,
-0.5729361, 0.05159916, -1.457471, 0.2901961, 1, 0, 1,
-0.5674604, 0.3105972, -0.2539223, 0.282353, 1, 0, 1,
-0.5629228, -1.018001, -1.895203, 0.2784314, 1, 0, 1,
-0.5599014, -0.01712122, 0.4340031, 0.2705882, 1, 0, 1,
-0.5589518, 0.7961041, -0.4160448, 0.2666667, 1, 0, 1,
-0.5580444, 0.3566613, -0.833265, 0.2588235, 1, 0, 1,
-0.5531415, 0.4445617, -2.298489, 0.254902, 1, 0, 1,
-0.5506243, -0.3889854, -1.982693, 0.2470588, 1, 0, 1,
-0.5500726, -0.2157236, -0.533469, 0.2431373, 1, 0, 1,
-0.5482457, -0.6333271, -2.629625, 0.2352941, 1, 0, 1,
-0.5448084, 1.145632, 0.8819381, 0.2313726, 1, 0, 1,
-0.5422225, -1.594252, -4.39491, 0.2235294, 1, 0, 1,
-0.5377795, -1.216359, -2.465053, 0.2196078, 1, 0, 1,
-0.5367121, 0.4915574, -1.225984, 0.2117647, 1, 0, 1,
-0.5323356, 0.2431566, -1.279328, 0.2078431, 1, 0, 1,
-0.5322762, -0.6815564, -1.681449, 0.2, 1, 0, 1,
-0.5294638, 1.954348, 0.5512965, 0.1921569, 1, 0, 1,
-0.5167634, 1.034759, -0.8904047, 0.1882353, 1, 0, 1,
-0.5128651, -1.835828, -2.00529, 0.1803922, 1, 0, 1,
-0.512529, -1.881876, -0.7879061, 0.1764706, 1, 0, 1,
-0.5074326, -0.1938819, 0.1097356, 0.1686275, 1, 0, 1,
-0.505986, -0.9257936, -2.720239, 0.1647059, 1, 0, 1,
-0.5047982, -0.6688532, -2.959996, 0.1568628, 1, 0, 1,
-0.5041686, -2.366929, -3.889436, 0.1529412, 1, 0, 1,
-0.499903, -0.1112261, 0.2588054, 0.145098, 1, 0, 1,
-0.4977848, -0.6841478, -3.095774, 0.1411765, 1, 0, 1,
-0.4945361, 1.009437, 0.839991, 0.1333333, 1, 0, 1,
-0.491758, 0.5682084, -1.064445, 0.1294118, 1, 0, 1,
-0.4899233, 0.01942131, -1.64656, 0.1215686, 1, 0, 1,
-0.4886193, 0.9643078, -0.8244643, 0.1176471, 1, 0, 1,
-0.4883379, 1.21902, -0.5374202, 0.1098039, 1, 0, 1,
-0.4830358, 0.1041623, -1.376424, 0.1058824, 1, 0, 1,
-0.4803802, 0.1760213, -2.677095, 0.09803922, 1, 0, 1,
-0.4788711, 0.122907, -1.59568, 0.09019608, 1, 0, 1,
-0.4742314, 0.4555269, -3.38564, 0.08627451, 1, 0, 1,
-0.4739739, -0.6366253, -0.3823104, 0.07843138, 1, 0, 1,
-0.4728966, 0.3878108, -0.007237347, 0.07450981, 1, 0, 1,
-0.4698118, 0.3228924, 0.2114969, 0.06666667, 1, 0, 1,
-0.4653475, -0.7691709, -2.120746, 0.0627451, 1, 0, 1,
-0.4645448, -0.4776268, -1.627992, 0.05490196, 1, 0, 1,
-0.4618623, 0.609273, -0.7115655, 0.05098039, 1, 0, 1,
-0.4568932, 0.9576622, -0.7683742, 0.04313726, 1, 0, 1,
-0.45024, -0.5001699, -2.271414, 0.03921569, 1, 0, 1,
-0.4485816, -0.2861386, -1.854605, 0.03137255, 1, 0, 1,
-0.4473087, -1.098278, -2.847584, 0.02745098, 1, 0, 1,
-0.4453553, -0.6071503, -3.356849, 0.01960784, 1, 0, 1,
-0.4395722, -0.4102442, -1.903735, 0.01568628, 1, 0, 1,
-0.4378519, 0.02983205, -1.263361, 0.007843138, 1, 0, 1,
-0.4333691, -1.159405, -4.295727, 0.003921569, 1, 0, 1,
-0.425154, -0.3951029, -3.667934, 0, 1, 0.003921569, 1,
-0.4161389, -0.2495826, -3.114321, 0, 1, 0.01176471, 1,
-0.4095974, 0.009767443, -2.44701, 0, 1, 0.01568628, 1,
-0.3996777, -0.4643207, -2.341377, 0, 1, 0.02352941, 1,
-0.3993602, 3.090081, -0.5712382, 0, 1, 0.02745098, 1,
-0.3973875, 0.02568691, -1.589233, 0, 1, 0.03529412, 1,
-0.3965565, 1.257404, -0.9683759, 0, 1, 0.03921569, 1,
-0.3959711, -0.3977677, -0.3856316, 0, 1, 0.04705882, 1,
-0.3950144, -1.284534, -3.291321, 0, 1, 0.05098039, 1,
-0.3932079, -0.324297, -2.78873, 0, 1, 0.05882353, 1,
-0.3916081, -0.4758856, -2.135881, 0, 1, 0.0627451, 1,
-0.3890241, 0.7706511, -1.432536, 0, 1, 0.07058824, 1,
-0.3856333, -0.9711305, -2.858318, 0, 1, 0.07450981, 1,
-0.3838663, -0.3507963, -3.876972, 0, 1, 0.08235294, 1,
-0.3800532, 0.3922747, -1.228862, 0, 1, 0.08627451, 1,
-0.3793361, -2.106899, -2.571435, 0, 1, 0.09411765, 1,
-0.3775838, -0.7714509, -2.68861, 0, 1, 0.1019608, 1,
-0.3740542, -1.442207, -5.999763, 0, 1, 0.1058824, 1,
-0.37267, -0.2686792, -1.730255, 0, 1, 0.1137255, 1,
-0.3702747, 1.089886, -0.3470791, 0, 1, 0.1176471, 1,
-0.369112, -0.1749948, -3.404613, 0, 1, 0.1254902, 1,
-0.3669509, -1.229797, -2.050527, 0, 1, 0.1294118, 1,
-0.3655891, -0.05497007, 0.6904147, 0, 1, 0.1372549, 1,
-0.3634005, -0.1928588, -1.326584, 0, 1, 0.1411765, 1,
-0.3625444, 0.6362803, -0.1494576, 0, 1, 0.1490196, 1,
-0.3604871, -0.8269913, -3.0315, 0, 1, 0.1529412, 1,
-0.3589671, 0.3052348, -0.6306508, 0, 1, 0.1607843, 1,
-0.3563917, -0.5384058, -2.936789, 0, 1, 0.1647059, 1,
-0.3557935, 0.06419431, -2.07852, 0, 1, 0.172549, 1,
-0.3497161, 0.651015, -1.82273, 0, 1, 0.1764706, 1,
-0.349503, -0.9790621, -2.946821, 0, 1, 0.1843137, 1,
-0.348206, -0.2592566, -2.952227, 0, 1, 0.1882353, 1,
-0.3465967, 0.5899481, -0.6911365, 0, 1, 0.1960784, 1,
-0.3461191, 0.5081959, -0.3953815, 0, 1, 0.2039216, 1,
-0.3452813, -1.300327, -4.943885, 0, 1, 0.2078431, 1,
-0.3414491, 1.05912, -0.1257061, 0, 1, 0.2156863, 1,
-0.3407759, 0.5316012, -0.08857927, 0, 1, 0.2196078, 1,
-0.3365308, -0.04335768, -1.392509, 0, 1, 0.227451, 1,
-0.3364222, -0.04867011, -2.682284, 0, 1, 0.2313726, 1,
-0.33601, -0.3869472, -2.404294, 0, 1, 0.2392157, 1,
-0.3352982, -0.2876292, -1.765153, 0, 1, 0.2431373, 1,
-0.3338736, -0.415771, -2.006594, 0, 1, 0.2509804, 1,
-0.326475, 0.08224801, -1.507334, 0, 1, 0.254902, 1,
-0.3249742, 1.328322, 1.999432, 0, 1, 0.2627451, 1,
-0.3244503, 0.6950503, -1.028223, 0, 1, 0.2666667, 1,
-0.3225484, 1.500983, -0.6579076, 0, 1, 0.2745098, 1,
-0.3220344, -1.26653, -5.173104, 0, 1, 0.2784314, 1,
-0.3213466, 1.714467, -0.2622638, 0, 1, 0.2862745, 1,
-0.3191254, -1.574548, -4.242417, 0, 1, 0.2901961, 1,
-0.3162406, -0.2491436, -0.7574238, 0, 1, 0.2980392, 1,
-0.3152199, 0.04580205, -0.8578975, 0, 1, 0.3058824, 1,
-0.3150858, 0.1447099, 1.450627, 0, 1, 0.3098039, 1,
-0.3055045, -0.3401682, -3.030159, 0, 1, 0.3176471, 1,
-0.3051674, 1.143677, -0.7226219, 0, 1, 0.3215686, 1,
-0.305026, -0.7270363, -2.469562, 0, 1, 0.3294118, 1,
-0.3020747, 0.5873939, -1.556302, 0, 1, 0.3333333, 1,
-0.3004478, 1.107068, -3.069668, 0, 1, 0.3411765, 1,
-0.2973451, 0.4465829, 0.7337003, 0, 1, 0.345098, 1,
-0.296748, 0.6168211, 0.5187846, 0, 1, 0.3529412, 1,
-0.294961, 1.962354, -0.5055758, 0, 1, 0.3568628, 1,
-0.2801865, -0.536997, -3.121384, 0, 1, 0.3647059, 1,
-0.2784585, 0.07466704, -1.767263, 0, 1, 0.3686275, 1,
-0.2719625, 1.184359, -0.3974333, 0, 1, 0.3764706, 1,
-0.2709093, -0.6992765, -0.9951125, 0, 1, 0.3803922, 1,
-0.2680331, -1.332997, -2.757033, 0, 1, 0.3882353, 1,
-0.2677325, 0.1184837, -0.5333727, 0, 1, 0.3921569, 1,
-0.2597809, -0.4466859, -3.183929, 0, 1, 0.4, 1,
-0.2596926, -2.061825, -1.663785, 0, 1, 0.4078431, 1,
-0.257197, -0.2966833, -3.690069, 0, 1, 0.4117647, 1,
-0.2559885, -0.5470219, -3.593793, 0, 1, 0.4196078, 1,
-0.2556891, 0.2693282, 1.453575, 0, 1, 0.4235294, 1,
-0.2517996, 0.7271394, -2.106784, 0, 1, 0.4313726, 1,
-0.245512, -0.5222076, -2.743245, 0, 1, 0.4352941, 1,
-0.2440671, -0.2139748, -2.462368, 0, 1, 0.4431373, 1,
-0.2420289, 1.509929, 0.9345557, 0, 1, 0.4470588, 1,
-0.2414669, -0.9506996, -1.947429, 0, 1, 0.454902, 1,
-0.2368226, 1.195993, -0.9412277, 0, 1, 0.4588235, 1,
-0.2273322, 0.2783294, 0.02817848, 0, 1, 0.4666667, 1,
-0.2204847, -0.04019516, -1.43353, 0, 1, 0.4705882, 1,
-0.2187595, 0.9594783, 0.6257555, 0, 1, 0.4784314, 1,
-0.2166276, -0.5735129, -3.972317, 0, 1, 0.4823529, 1,
-0.2148201, 0.4788762, -2.356624, 0, 1, 0.4901961, 1,
-0.2077985, -0.076464, -1.389032, 0, 1, 0.4941176, 1,
-0.2025858, -0.7070317, -2.082804, 0, 1, 0.5019608, 1,
-0.1982365, -1.772347, -4.782106, 0, 1, 0.509804, 1,
-0.1950304, -0.3511342, -2.837922, 0, 1, 0.5137255, 1,
-0.1938319, 0.9723023, 0.03451751, 0, 1, 0.5215687, 1,
-0.1937118, -0.1359618, -3.238634, 0, 1, 0.5254902, 1,
-0.1910632, -0.6180412, -1.236343, 0, 1, 0.5333334, 1,
-0.190941, 2.563103, -1.037376, 0, 1, 0.5372549, 1,
-0.1897749, 0.1003511, -2.999938, 0, 1, 0.5450981, 1,
-0.1845892, 0.8231142, -0.2601038, 0, 1, 0.5490196, 1,
-0.1829249, -0.8610076, -4.461899, 0, 1, 0.5568628, 1,
-0.1794125, -0.1169069, -2.868533, 0, 1, 0.5607843, 1,
-0.1752399, 0.5845479, -0.7313646, 0, 1, 0.5686275, 1,
-0.1737547, 0.5870959, -1.975605, 0, 1, 0.572549, 1,
-0.1663993, -0.05240649, -1.926533, 0, 1, 0.5803922, 1,
-0.1663972, -1.878298, -4.495279, 0, 1, 0.5843138, 1,
-0.1663453, -0.02462145, -1.226134, 0, 1, 0.5921569, 1,
-0.1629712, 0.1909068, -1.376919, 0, 1, 0.5960785, 1,
-0.1625717, -0.02064935, -0.678169, 0, 1, 0.6039216, 1,
-0.1597084, 0.150986, -0.04127696, 0, 1, 0.6117647, 1,
-0.1564204, 1.197782, -0.8817871, 0, 1, 0.6156863, 1,
-0.1559874, 0.03715282, -1.905674, 0, 1, 0.6235294, 1,
-0.1533231, 0.7231372, 0.3617081, 0, 1, 0.627451, 1,
-0.1527505, 1.422086, -0.594432, 0, 1, 0.6352941, 1,
-0.151867, 0.04895547, -0.5573578, 0, 1, 0.6392157, 1,
-0.1507872, -0.1966868, -2.55292, 0, 1, 0.6470588, 1,
-0.1507408, -0.7471387, -1.163221, 0, 1, 0.6509804, 1,
-0.1456053, -0.300458, -3.271761, 0, 1, 0.6588235, 1,
-0.1450291, 0.06502813, -0.9407657, 0, 1, 0.6627451, 1,
-0.1446614, -0.9281825, -3.241573, 0, 1, 0.6705883, 1,
-0.1401908, 0.5812112, 1.52339, 0, 1, 0.6745098, 1,
-0.1400777, -0.5495414, -3.072008, 0, 1, 0.682353, 1,
-0.1385122, -1.036471, -3.812859, 0, 1, 0.6862745, 1,
-0.1350342, 0.778648, -2.256734, 0, 1, 0.6941177, 1,
-0.1302805, -0.2069088, -2.771509, 0, 1, 0.7019608, 1,
-0.1289235, -0.7558177, -3.332617, 0, 1, 0.7058824, 1,
-0.1282634, -1.188888, -3.143993, 0, 1, 0.7137255, 1,
-0.1216358, -1.189312, -2.807281, 0, 1, 0.7176471, 1,
-0.1214583, 0.2161468, -0.3097728, 0, 1, 0.7254902, 1,
-0.1197455, -0.5228541, -3.684605, 0, 1, 0.7294118, 1,
-0.1191237, -2.090137, -3.611575, 0, 1, 0.7372549, 1,
-0.1172604, -0.5029821, -3.068115, 0, 1, 0.7411765, 1,
-0.1153783, -2.935302, -2.410495, 0, 1, 0.7490196, 1,
-0.111613, 0.8212645, 1.594625, 0, 1, 0.7529412, 1,
-0.1007898, -0.3581636, -1.762247, 0, 1, 0.7607843, 1,
-0.1001059, 0.2860747, -0.963147, 0, 1, 0.7647059, 1,
-0.09724735, -0.7802851, -2.793591, 0, 1, 0.772549, 1,
-0.09607448, 0.1118922, -0.5226397, 0, 1, 0.7764706, 1,
-0.09340061, -1.819212, -3.699072, 0, 1, 0.7843137, 1,
-0.0915667, -0.7140216, -3.924561, 0, 1, 0.7882353, 1,
-0.09096985, 1.295039, 1.006963, 0, 1, 0.7960784, 1,
-0.08818624, -0.2926351, -2.443934, 0, 1, 0.8039216, 1,
-0.08774351, 0.1756296, -0.7778829, 0, 1, 0.8078431, 1,
-0.08676821, 0.799951, 1.708819, 0, 1, 0.8156863, 1,
-0.08621005, 1.674066, -0.4096551, 0, 1, 0.8196079, 1,
-0.08345006, -2.00882, -1.690311, 0, 1, 0.827451, 1,
-0.08328886, -0.3647478, -3.383555, 0, 1, 0.8313726, 1,
-0.07673747, -0.6771193, -4.06401, 0, 1, 0.8392157, 1,
-0.07219448, 0.1170124, 0.1467204, 0, 1, 0.8431373, 1,
-0.07167279, -1.406639, -2.295618, 0, 1, 0.8509804, 1,
-0.06984257, -0.6088371, -3.484115, 0, 1, 0.854902, 1,
-0.06552681, 0.8210191, 0.1235657, 0, 1, 0.8627451, 1,
-0.06405605, 0.938552, 0.6086072, 0, 1, 0.8666667, 1,
-0.06093059, -2.225926, -3.218267, 0, 1, 0.8745098, 1,
-0.06010593, -0.1130224, -2.181967, 0, 1, 0.8784314, 1,
-0.05942827, -0.4319195, -3.22148, 0, 1, 0.8862745, 1,
-0.05799534, 1.279434, -0.6838122, 0, 1, 0.8901961, 1,
-0.05557641, -0.2668651, -2.585091, 0, 1, 0.8980392, 1,
-0.05212538, 0.1887406, 0.1631589, 0, 1, 0.9058824, 1,
-0.05192812, 1.11352, 0.427844, 0, 1, 0.9098039, 1,
-0.0513886, 0.765968, 0.953118, 0, 1, 0.9176471, 1,
-0.05019706, 2.784258, -0.02906561, 0, 1, 0.9215686, 1,
-0.04695866, -0.6443476, -2.021655, 0, 1, 0.9294118, 1,
-0.04675285, -0.2115708, -4.527853, 0, 1, 0.9333333, 1,
-0.04272382, 1.299037, -0.6959216, 0, 1, 0.9411765, 1,
-0.04188918, 2.087687, -0.003685561, 0, 1, 0.945098, 1,
-0.03899486, -0.05951843, -2.070754, 0, 1, 0.9529412, 1,
-0.03789281, -0.6811139, -4.638638, 0, 1, 0.9568627, 1,
-0.03685796, -0.7010521, -3.915411, 0, 1, 0.9647059, 1,
-0.03308195, -1.184129, -2.5434, 0, 1, 0.9686275, 1,
-0.03247369, -0.5093341, -3.622635, 0, 1, 0.9764706, 1,
-0.02813455, -1.845686, -1.674164, 0, 1, 0.9803922, 1,
-0.0281127, 0.004670433, -0.4958569, 0, 1, 0.9882353, 1,
-0.02776155, -0.1710207, -2.765808, 0, 1, 0.9921569, 1,
-0.02496077, -0.7206479, -2.735366, 0, 1, 1, 1,
-0.02354363, -0.8733213, -3.321069, 0, 0.9921569, 1, 1,
-0.02197701, -1.249532, -4.456656, 0, 0.9882353, 1, 1,
-0.008996516, 1.087452, -0.957225, 0, 0.9803922, 1, 1,
-0.006496597, -0.1879806, -4.460913, 0, 0.9764706, 1, 1,
-0.004135645, -1.107022, -5.217685, 0, 0.9686275, 1, 1,
-0.003570089, -0.02551174, -3.12171, 0, 0.9647059, 1, 1,
-0.0007617867, 0.2644571, -0.07996497, 0, 0.9568627, 1, 1,
0.0001043945, 0.4444141, 0.7468979, 0, 0.9529412, 1, 1,
0.002844449, -0.9110149, 2.938465, 0, 0.945098, 1, 1,
0.01010597, 0.1394603, -1.130016, 0, 0.9411765, 1, 1,
0.01142702, 0.5048624, 0.3388852, 0, 0.9333333, 1, 1,
0.02393399, -0.4595675, 4.279143, 0, 0.9294118, 1, 1,
0.0255089, 0.7967785, -0.3988893, 0, 0.9215686, 1, 1,
0.02602281, -0.2295321, 5.097866, 0, 0.9176471, 1, 1,
0.03557321, 0.9932411, 0.8454106, 0, 0.9098039, 1, 1,
0.03700647, 1.203445, -0.3213225, 0, 0.9058824, 1, 1,
0.03764547, 0.004693809, -0.7775869, 0, 0.8980392, 1, 1,
0.03918752, 0.3198537, 1.762145, 0, 0.8901961, 1, 1,
0.04128038, -0.9774422, 1.743165, 0, 0.8862745, 1, 1,
0.04184913, 0.5786407, 0.9806591, 0, 0.8784314, 1, 1,
0.04735364, -0.5553613, 3.128387, 0, 0.8745098, 1, 1,
0.04816755, 1.553005, 0.407933, 0, 0.8666667, 1, 1,
0.05006765, 0.6447319, 0.7366827, 0, 0.8627451, 1, 1,
0.05271801, -0.1084373, 3.941139, 0, 0.854902, 1, 1,
0.05482631, -0.3226036, 3.798263, 0, 0.8509804, 1, 1,
0.0572759, -1.59167, 5.223091, 0, 0.8431373, 1, 1,
0.0606356, -1.971812, 4.803389, 0, 0.8392157, 1, 1,
0.06311294, -0.6703124, 1.369669, 0, 0.8313726, 1, 1,
0.06561847, 2.133217, -0.578072, 0, 0.827451, 1, 1,
0.06565611, 1.138748, -0.02424618, 0, 0.8196079, 1, 1,
0.06599548, -0.6235556, 4.033429, 0, 0.8156863, 1, 1,
0.0738111, -0.1638315, 3.970418, 0, 0.8078431, 1, 1,
0.07409246, 1.206942, -0.7571342, 0, 0.8039216, 1, 1,
0.07527211, -0.4437609, 2.923594, 0, 0.7960784, 1, 1,
0.07638889, -0.8445724, 2.274927, 0, 0.7882353, 1, 1,
0.07945038, -0.050033, 1.650441, 0, 0.7843137, 1, 1,
0.08160346, -1.674547, 3.916049, 0, 0.7764706, 1, 1,
0.08195938, -0.2259739, 2.960074, 0, 0.772549, 1, 1,
0.08297402, 0.5078087, 0.9205474, 0, 0.7647059, 1, 1,
0.08479186, 0.763944, -1.12756, 0, 0.7607843, 1, 1,
0.09041782, -1.533323, 4.467639, 0, 0.7529412, 1, 1,
0.0912805, 0.2588618, 2.105007, 0, 0.7490196, 1, 1,
0.09150442, 0.5328788, 0.5769166, 0, 0.7411765, 1, 1,
0.09510513, -0.5368198, 2.788575, 0, 0.7372549, 1, 1,
0.09616228, 0.8807858, -1.773722, 0, 0.7294118, 1, 1,
0.09807845, 2.093014, 0.7763891, 0, 0.7254902, 1, 1,
0.101332, -1.10489, 2.840925, 0, 0.7176471, 1, 1,
0.1025478, -0.4420368, 4.528258, 0, 0.7137255, 1, 1,
0.1027854, 0.06295559, 2.292654, 0, 0.7058824, 1, 1,
0.1028839, 0.4912317, 1.060091, 0, 0.6980392, 1, 1,
0.1030714, -2.329561, 3.316011, 0, 0.6941177, 1, 1,
0.1106375, -1.364903, 4.716145, 0, 0.6862745, 1, 1,
0.1130845, -1.444794, 2.998415, 0, 0.682353, 1, 1,
0.1143711, -0.8639131, 3.047532, 0, 0.6745098, 1, 1,
0.1146069, 0.03897969, 1.062351, 0, 0.6705883, 1, 1,
0.1151179, -0.5229154, 2.571564, 0, 0.6627451, 1, 1,
0.116643, -0.0176419, 2.030984, 0, 0.6588235, 1, 1,
0.1182875, -0.4945113, 1.699093, 0, 0.6509804, 1, 1,
0.1192024, 1.380372, 0.7002545, 0, 0.6470588, 1, 1,
0.1243797, 0.5743812, -0.4201071, 0, 0.6392157, 1, 1,
0.1253901, 0.1234977, -0.2863096, 0, 0.6352941, 1, 1,
0.1265197, 1.007475, 1.174767, 0, 0.627451, 1, 1,
0.1307449, -0.9796184, 3.327596, 0, 0.6235294, 1, 1,
0.1357294, -0.2192397, 2.847375, 0, 0.6156863, 1, 1,
0.1376914, -1.500041, 1.934109, 0, 0.6117647, 1, 1,
0.1377059, 2.342888, -1.495369, 0, 0.6039216, 1, 1,
0.1378172, -0.5499321, 3.393317, 0, 0.5960785, 1, 1,
0.1380359, -0.9217571, 2.732473, 0, 0.5921569, 1, 1,
0.1382034, 1.428723, -1.178049, 0, 0.5843138, 1, 1,
0.1463368, -1.044217, 3.210301, 0, 0.5803922, 1, 1,
0.1469189, -0.09421049, 1.686086, 0, 0.572549, 1, 1,
0.1475738, -0.1723486, 2.459715, 0, 0.5686275, 1, 1,
0.1525083, 0.2482976, 1.411233, 0, 0.5607843, 1, 1,
0.1558021, 0.7797825, -1.068643, 0, 0.5568628, 1, 1,
0.1620368, 0.6640047, 0.9097664, 0, 0.5490196, 1, 1,
0.1648456, 0.6092203, -0.154039, 0, 0.5450981, 1, 1,
0.1659935, -1.253677, 3.605222, 0, 0.5372549, 1, 1,
0.1662529, -0.9844632, 1.664692, 0, 0.5333334, 1, 1,
0.1666131, 1.533249, -0.350822, 0, 0.5254902, 1, 1,
0.167177, -1.667742, 2.12438, 0, 0.5215687, 1, 1,
0.16826, 1.909423, 0.3678665, 0, 0.5137255, 1, 1,
0.1728143, 0.5227796, 0.9348997, 0, 0.509804, 1, 1,
0.1770773, -1.166847, 3.042991, 0, 0.5019608, 1, 1,
0.1773388, -0.1938086, 2.118654, 0, 0.4941176, 1, 1,
0.1828335, -1.478594, 3.335269, 0, 0.4901961, 1, 1,
0.184257, 0.1901525, 0.09590902, 0, 0.4823529, 1, 1,
0.1854876, -0.189056, 2.286694, 0, 0.4784314, 1, 1,
0.1891664, 0.9125409, -0.4253982, 0, 0.4705882, 1, 1,
0.1898104, -0.08201835, 2.583977, 0, 0.4666667, 1, 1,
0.1910712, -2.233117, 2.253571, 0, 0.4588235, 1, 1,
0.2021266, 0.08598667, -0.7068688, 0, 0.454902, 1, 1,
0.2029214, -0.2826745, 2.886094, 0, 0.4470588, 1, 1,
0.2059811, 1.295825, 0.2792808, 0, 0.4431373, 1, 1,
0.2073953, 0.7395481, 0.4120769, 0, 0.4352941, 1, 1,
0.2079884, -0.04167725, 1.290988, 0, 0.4313726, 1, 1,
0.2123687, 2.232931, 0.9532341, 0, 0.4235294, 1, 1,
0.2125261, -1.100108, 4.661936, 0, 0.4196078, 1, 1,
0.2193719, 0.1517521, 0.3915431, 0, 0.4117647, 1, 1,
0.2317599, -0.01548951, 0.2777894, 0, 0.4078431, 1, 1,
0.2317801, -0.9032161, 1.988869, 0, 0.4, 1, 1,
0.2326306, -0.01210492, 1.251274, 0, 0.3921569, 1, 1,
0.2344672, -0.6524501, 2.0893, 0, 0.3882353, 1, 1,
0.2354351, 0.4537649, 1.548847, 0, 0.3803922, 1, 1,
0.2354363, 0.4123591, 1.367174, 0, 0.3764706, 1, 1,
0.2357945, -0.6017373, 2.050628, 0, 0.3686275, 1, 1,
0.2384535, 0.6103163, -0.2013844, 0, 0.3647059, 1, 1,
0.2387035, -0.6718691, 1.457224, 0, 0.3568628, 1, 1,
0.2405297, -0.5582954, 2.868901, 0, 0.3529412, 1, 1,
0.2415812, 1.125117, 1.551429, 0, 0.345098, 1, 1,
0.2419581, 1.320248, -0.4439175, 0, 0.3411765, 1, 1,
0.2438391, 1.200282, 0.8608228, 0, 0.3333333, 1, 1,
0.2460217, 0.1888889, 0.7662764, 0, 0.3294118, 1, 1,
0.2463244, -1.55948, 2.466317, 0, 0.3215686, 1, 1,
0.2476996, -0.6694603, 2.531486, 0, 0.3176471, 1, 1,
0.2496373, 0.3611838, 1.219815, 0, 0.3098039, 1, 1,
0.2504947, 2.217734, 1.057442, 0, 0.3058824, 1, 1,
0.2571081, -0.8721933, 4.363959, 0, 0.2980392, 1, 1,
0.2579976, -1.805993, 3.213021, 0, 0.2901961, 1, 1,
0.2595748, 1.169368, 1.079628, 0, 0.2862745, 1, 1,
0.2616848, -1.384782, 4.200853, 0, 0.2784314, 1, 1,
0.2700594, 0.2734991, 0.7242653, 0, 0.2745098, 1, 1,
0.2717205, 0.09688617, 2.085096, 0, 0.2666667, 1, 1,
0.2725753, -1.28817, 1.451622, 0, 0.2627451, 1, 1,
0.2752548, -1.00419, 2.321661, 0, 0.254902, 1, 1,
0.2782435, -0.05725077, 1.135107, 0, 0.2509804, 1, 1,
0.2786724, 0.2122064, 0.8585663, 0, 0.2431373, 1, 1,
0.2821481, -0.1103174, 2.078909, 0, 0.2392157, 1, 1,
0.2852266, -0.1750208, 2.72257, 0, 0.2313726, 1, 1,
0.2867569, -1.086349, 4.879915, 0, 0.227451, 1, 1,
0.2873921, 0.4462834, -0.7892348, 0, 0.2196078, 1, 1,
0.2893716, 1.971237, 1.614416, 0, 0.2156863, 1, 1,
0.2896945, 0.2239316, -0.178566, 0, 0.2078431, 1, 1,
0.2897665, -1.141357, 2.819399, 0, 0.2039216, 1, 1,
0.2898376, -0.9807538, 3.09719, 0, 0.1960784, 1, 1,
0.2939861, 0.4670138, 1.278664, 0, 0.1882353, 1, 1,
0.2958377, 0.4324202, -0.2430069, 0, 0.1843137, 1, 1,
0.2973657, -0.2783791, 2.419975, 0, 0.1764706, 1, 1,
0.2976067, 0.2944925, 1.807405, 0, 0.172549, 1, 1,
0.2995355, 1.462593, 0.7054045, 0, 0.1647059, 1, 1,
0.3016376, -0.7499396, 4.579588, 0, 0.1607843, 1, 1,
0.3038778, 0.1832227, 1.398724, 0, 0.1529412, 1, 1,
0.3052506, 0.816789, -0.9383251, 0, 0.1490196, 1, 1,
0.3059425, 0.7806874, 2.133935, 0, 0.1411765, 1, 1,
0.307463, 1.088454, -0.6076937, 0, 0.1372549, 1, 1,
0.309476, 1.123642, 1.682865, 0, 0.1294118, 1, 1,
0.3100482, 0.7326444, -0.6140322, 0, 0.1254902, 1, 1,
0.3109833, 0.1819654, 1.093501, 0, 0.1176471, 1, 1,
0.3116829, 0.579537, -0.2821788, 0, 0.1137255, 1, 1,
0.314012, -0.6351269, 3.837743, 0, 0.1058824, 1, 1,
0.3154665, 0.7739211, 0.1769756, 0, 0.09803922, 1, 1,
0.3212227, 2.203003e-05, 1.417066, 0, 0.09411765, 1, 1,
0.3227449, -0.06521479, -0.1328774, 0, 0.08627451, 1, 1,
0.3230309, 0.291596, 0.4757099, 0, 0.08235294, 1, 1,
0.3264605, -1.40043, 2.780329, 0, 0.07450981, 1, 1,
0.3293176, -0.09242218, 0.3439108, 0, 0.07058824, 1, 1,
0.3304676, 0.1912187, 1.217776, 0, 0.0627451, 1, 1,
0.3366087, -0.3915091, 2.829154, 0, 0.05882353, 1, 1,
0.3396311, -0.6962718, 1.652539, 0, 0.05098039, 1, 1,
0.3411961, 0.6668545, 0.3786822, 0, 0.04705882, 1, 1,
0.3443643, 0.1554237, 0.3841977, 0, 0.03921569, 1, 1,
0.3453898, -1.231013, 4.577563, 0, 0.03529412, 1, 1,
0.3454549, 0.9024004, -1.199598, 0, 0.02745098, 1, 1,
0.3457139, 0.1933053, 2.050406, 0, 0.02352941, 1, 1,
0.3477525, -0.1500771, 1.468981, 0, 0.01568628, 1, 1,
0.3504226, 1.859096, -1.870888, 0, 0.01176471, 1, 1,
0.3523575, -0.1526096, 1.24733, 0, 0.003921569, 1, 1,
0.3524969, -0.5039701, 4.47844, 0.003921569, 0, 1, 1,
0.3536005, -0.2041287, 0.8892107, 0.007843138, 0, 1, 1,
0.3542481, -0.4784245, 2.371213, 0.01568628, 0, 1, 1,
0.359064, 0.8346345, 1.79911, 0.01960784, 0, 1, 1,
0.3597328, -0.3668377, 2.062829, 0.02745098, 0, 1, 1,
0.3619556, 1.563176, 0.5913984, 0.03137255, 0, 1, 1,
0.362448, -0.37472, 3.603827, 0.03921569, 0, 1, 1,
0.3639721, -0.03901517, 1.32638, 0.04313726, 0, 1, 1,
0.3680589, 0.609219, 0.4359804, 0.05098039, 0, 1, 1,
0.3685443, -1.006086, 2.44148, 0.05490196, 0, 1, 1,
0.3698973, 0.2105118, 0.4032401, 0.0627451, 0, 1, 1,
0.3739143, 1.471904, -0.7860443, 0.06666667, 0, 1, 1,
0.374978, -1.652795, 3.356401, 0.07450981, 0, 1, 1,
0.3767635, -0.675732, 3.555366, 0.07843138, 0, 1, 1,
0.3783739, 0.04260302, 0.4668979, 0.08627451, 0, 1, 1,
0.3832175, 1.392869, 0.1754455, 0.09019608, 0, 1, 1,
0.3840299, -0.4243608, 0.8261602, 0.09803922, 0, 1, 1,
0.3840466, -0.8537771, 4.283147, 0.1058824, 0, 1, 1,
0.3857162, 0.6926572, -0.2030017, 0.1098039, 0, 1, 1,
0.3880391, -0.7839404, 4.984955, 0.1176471, 0, 1, 1,
0.3903532, 0.573671, -0.4153603, 0.1215686, 0, 1, 1,
0.391362, -1.059622, 2.718074, 0.1294118, 0, 1, 1,
0.3955508, 2.784658, 0.3179098, 0.1333333, 0, 1, 1,
0.3981621, -1.260159, 0.9999308, 0.1411765, 0, 1, 1,
0.4050548, 0.9618586, 0.2358857, 0.145098, 0, 1, 1,
0.4127274, -1.931427, 3.218772, 0.1529412, 0, 1, 1,
0.4137281, -0.9366708, 0.9104329, 0.1568628, 0, 1, 1,
0.4172543, -0.2349772, 2.252492, 0.1647059, 0, 1, 1,
0.4214824, 1.065522, 1.089298, 0.1686275, 0, 1, 1,
0.4248806, 0.3514091, -0.1377921, 0.1764706, 0, 1, 1,
0.4283527, 0.9483858, 1.517677, 0.1803922, 0, 1, 1,
0.4312716, -0.6621079, 3.383611, 0.1882353, 0, 1, 1,
0.4354263, -0.5049551, 3.853536, 0.1921569, 0, 1, 1,
0.435901, 1.951821, -2.645468, 0.2, 0, 1, 1,
0.4396898, -1.470618, 1.910283, 0.2078431, 0, 1, 1,
0.4412702, -0.2851086, 3.499187, 0.2117647, 0, 1, 1,
0.4474939, -0.2112854, 3.815451, 0.2196078, 0, 1, 1,
0.4479416, -0.5998668, 1.332574, 0.2235294, 0, 1, 1,
0.4494357, -0.6878182, 2.715358, 0.2313726, 0, 1, 1,
0.4497658, -1.303144, 2.753219, 0.2352941, 0, 1, 1,
0.4508892, 1.661955, -0.5635096, 0.2431373, 0, 1, 1,
0.4560638, 0.6015763, 2.933747, 0.2470588, 0, 1, 1,
0.4611374, -0.6058361, 0.8548798, 0.254902, 0, 1, 1,
0.4666832, 0.2507949, 0.8634518, 0.2588235, 0, 1, 1,
0.4704887, 0.6367399, -0.5130484, 0.2666667, 0, 1, 1,
0.4766017, 0.4446357, -0.526175, 0.2705882, 0, 1, 1,
0.4772782, -1.492665, 2.789034, 0.2784314, 0, 1, 1,
0.4784891, -0.1648423, 2.098092, 0.282353, 0, 1, 1,
0.4824636, 0.3647668, 1.069686, 0.2901961, 0, 1, 1,
0.4825004, 0.3453399, 0.008225355, 0.2941177, 0, 1, 1,
0.4865207, 1.258654, -0.6589174, 0.3019608, 0, 1, 1,
0.4932988, 0.8977395, 0.2331408, 0.3098039, 0, 1, 1,
0.4948789, 1.09174, -0.1050309, 0.3137255, 0, 1, 1,
0.4964502, -1.844587, 4.035773, 0.3215686, 0, 1, 1,
0.5050628, -0.2663483, 3.003045, 0.3254902, 0, 1, 1,
0.5083042, 0.2739804, 0.7043856, 0.3333333, 0, 1, 1,
0.5087453, 0.3963165, 0.8863086, 0.3372549, 0, 1, 1,
0.5088001, -0.495994, 3.619031, 0.345098, 0, 1, 1,
0.5109015, 0.2661664, 0.0002469878, 0.3490196, 0, 1, 1,
0.5113938, 1.133452, 2.879279, 0.3568628, 0, 1, 1,
0.5118914, 0.1741948, -1.645729, 0.3607843, 0, 1, 1,
0.5235179, 0.4446163, 0.5124984, 0.3686275, 0, 1, 1,
0.528335, -1.660109, 1.764987, 0.372549, 0, 1, 1,
0.5304216, -1.013518, 1.602292, 0.3803922, 0, 1, 1,
0.5407158, 0.1594709, 2.064993, 0.3843137, 0, 1, 1,
0.5460299, 0.2838674, 1.595235, 0.3921569, 0, 1, 1,
0.5480251, -0.8845096, 1.496536, 0.3960784, 0, 1, 1,
0.5542706, -0.7361935, 2.286084, 0.4039216, 0, 1, 1,
0.5547816, -0.7154776, 3.06895, 0.4117647, 0, 1, 1,
0.5595351, -0.263052, 1.787561, 0.4156863, 0, 1, 1,
0.5612327, -1.003627, 1.980194, 0.4235294, 0, 1, 1,
0.5626066, -0.265022, 2.929714, 0.427451, 0, 1, 1,
0.5662349, 0.7483573, 1.136122, 0.4352941, 0, 1, 1,
0.5679483, 0.8608561, 0.9734361, 0.4392157, 0, 1, 1,
0.5768092, -0.6475659, 2.133934, 0.4470588, 0, 1, 1,
0.581889, 2.286312, -0.8342824, 0.4509804, 0, 1, 1,
0.5844085, 0.2245197, 0.2354367, 0.4588235, 0, 1, 1,
0.5860877, -1.016929, 2.165508, 0.4627451, 0, 1, 1,
0.5943643, 0.7460552, -0.9027503, 0.4705882, 0, 1, 1,
0.6089457, 0.4519669, 0.5237697, 0.4745098, 0, 1, 1,
0.6108994, -0.4592327, 1.277572, 0.4823529, 0, 1, 1,
0.6197277, 2.014671, 1.040495, 0.4862745, 0, 1, 1,
0.6259068, -0.0566924, 1.503664, 0.4941176, 0, 1, 1,
0.6301087, -3.388605, 2.852198, 0.5019608, 0, 1, 1,
0.6320071, 1.401602, 0.3739211, 0.5058824, 0, 1, 1,
0.6459595, 0.4159192, 0.2407945, 0.5137255, 0, 1, 1,
0.6471532, -1.244065, 3.772478, 0.5176471, 0, 1, 1,
0.6539387, 1.092021, 1.273769, 0.5254902, 0, 1, 1,
0.6554908, 0.2684104, -0.9417424, 0.5294118, 0, 1, 1,
0.6571324, -0.8155941, 2.2417, 0.5372549, 0, 1, 1,
0.6579691, -0.06205464, 1.941274, 0.5411765, 0, 1, 1,
0.6619186, -0.8452019, 3.219147, 0.5490196, 0, 1, 1,
0.6652946, -0.768343, 4.382101, 0.5529412, 0, 1, 1,
0.6669221, 0.9553803, 0.8387985, 0.5607843, 0, 1, 1,
0.6671127, -0.1465699, 2.112611, 0.5647059, 0, 1, 1,
0.6671144, 1.368668, 0.9823858, 0.572549, 0, 1, 1,
0.6701302, -1.470549, 3.100382, 0.5764706, 0, 1, 1,
0.6719632, -0.6880751, 2.66475, 0.5843138, 0, 1, 1,
0.6743925, 0.4143047, 1.366828, 0.5882353, 0, 1, 1,
0.6762648, -0.9398887, 2.238773, 0.5960785, 0, 1, 1,
0.6829395, -0.8372746, 3.390207, 0.6039216, 0, 1, 1,
0.6833477, 0.6354674, 2.676039, 0.6078432, 0, 1, 1,
0.6864306, 0.521532, 1.30382, 0.6156863, 0, 1, 1,
0.6882591, 1.923954, -0.3336405, 0.6196079, 0, 1, 1,
0.6915393, -1.006664, 0.6462634, 0.627451, 0, 1, 1,
0.6939901, 0.244609, 0.618347, 0.6313726, 0, 1, 1,
0.698617, -0.5268697, 2.602051, 0.6392157, 0, 1, 1,
0.7038715, -0.2936181, 0.3012888, 0.6431373, 0, 1, 1,
0.7080323, 0.6832666, 1.031492, 0.6509804, 0, 1, 1,
0.7137629, -1.088021, 2.081686, 0.654902, 0, 1, 1,
0.7142224, -1.035836, 2.366166, 0.6627451, 0, 1, 1,
0.7209569, -2.411517, 1.996813, 0.6666667, 0, 1, 1,
0.7241298, -1.234782, 2.193057, 0.6745098, 0, 1, 1,
0.7268371, -0.4846447, 2.334584, 0.6784314, 0, 1, 1,
0.7300952, -1.047782, 3.030735, 0.6862745, 0, 1, 1,
0.7389481, -0.2885101, 3.746753, 0.6901961, 0, 1, 1,
0.7403783, -1.365726, 3.25225, 0.6980392, 0, 1, 1,
0.7476337, -0.5532843, 2.605932, 0.7058824, 0, 1, 1,
0.7497813, 0.06726309, 1.167029, 0.7098039, 0, 1, 1,
0.7513018, -0.2804451, 2.250675, 0.7176471, 0, 1, 1,
0.7611448, -0.6520025, 1.734436, 0.7215686, 0, 1, 1,
0.7631375, 1.420953, 1.652498, 0.7294118, 0, 1, 1,
0.7703915, 1.731982, -0.4688407, 0.7333333, 0, 1, 1,
0.7707486, -0.6574757, 1.622571, 0.7411765, 0, 1, 1,
0.7755646, 2.238223, 0.2429195, 0.7450981, 0, 1, 1,
0.7783741, 1.376711, 0.2016621, 0.7529412, 0, 1, 1,
0.7816983, 0.09486881, 1.656306, 0.7568628, 0, 1, 1,
0.7828125, -0.7417945, 0.7788888, 0.7647059, 0, 1, 1,
0.7897127, -1.200475, 1.829047, 0.7686275, 0, 1, 1,
0.7925692, 1.266053, 0.6411663, 0.7764706, 0, 1, 1,
0.7930558, 0.859901, 1.612348, 0.7803922, 0, 1, 1,
0.796221, -0.4798098, 2.104445, 0.7882353, 0, 1, 1,
0.7975106, 0.3793411, 0.8917466, 0.7921569, 0, 1, 1,
0.8017203, 0.8268254, 1.137791, 0.8, 0, 1, 1,
0.8088123, 0.2488061, 2.435896, 0.8078431, 0, 1, 1,
0.8140847, -0.7025403, 2.115465, 0.8117647, 0, 1, 1,
0.8167455, -0.2438111, 3.23594, 0.8196079, 0, 1, 1,
0.8214992, 0.6926967, 0.4706772, 0.8235294, 0, 1, 1,
0.834278, 0.5571821, 2.170448, 0.8313726, 0, 1, 1,
0.836127, 0.6216819, 0.4658648, 0.8352941, 0, 1, 1,
0.8413562, -0.5435829, 3.1556, 0.8431373, 0, 1, 1,
0.8432224, -0.5116132, 2.13759, 0.8470588, 0, 1, 1,
0.8455055, 0.1952993, 2.070374, 0.854902, 0, 1, 1,
0.8482034, 0.6616068, 0.3491702, 0.8588235, 0, 1, 1,
0.8507353, 1.663573, 2.959519, 0.8666667, 0, 1, 1,
0.8685565, 0.4287786, 1.428755, 0.8705882, 0, 1, 1,
0.8781134, 1.589923, 1.108842, 0.8784314, 0, 1, 1,
0.8790871, -0.835384, 0.8078195, 0.8823529, 0, 1, 1,
0.8791369, -0.1654619, 2.117174, 0.8901961, 0, 1, 1,
0.8835596, -0.6947407, 1.099042, 0.8941177, 0, 1, 1,
0.8836373, -0.9656336, 4.71675, 0.9019608, 0, 1, 1,
0.8967245, 2.625748, -1.515718, 0.9098039, 0, 1, 1,
0.9075674, 0.4098494, 0.251025, 0.9137255, 0, 1, 1,
0.9088869, -0.4975683, 1.625406, 0.9215686, 0, 1, 1,
0.9117781, -0.4605655, 1.464184, 0.9254902, 0, 1, 1,
0.912448, 0.9416676, 1.436702, 0.9333333, 0, 1, 1,
0.9136818, -0.3129325, 1.815962, 0.9372549, 0, 1, 1,
0.9202819, 0.160366, 0.362394, 0.945098, 0, 1, 1,
0.9357947, 0.5260071, 1.466851, 0.9490196, 0, 1, 1,
0.9366387, -0.6211814, 1.878044, 0.9568627, 0, 1, 1,
0.9403386, 1.430779, 2.206618, 0.9607843, 0, 1, 1,
0.9428268, 0.7658654, 0.8469003, 0.9686275, 0, 1, 1,
0.9637755, 0.004556611, 2.707077, 0.972549, 0, 1, 1,
0.9654034, -0.1922061, 3.944251, 0.9803922, 0, 1, 1,
0.9660249, -0.5437419, 2.119269, 0.9843137, 0, 1, 1,
0.9773003, 1.010861, 0.8373944, 0.9921569, 0, 1, 1,
0.977722, -1.146342, 1.258787, 0.9960784, 0, 1, 1,
0.9825327, -1.184706, 2.7288, 1, 0, 0.9960784, 1,
0.9842821, 0.3989231, -0.8362795, 1, 0, 0.9882353, 1,
0.9846056, -0.6469349, 2.348714, 1, 0, 0.9843137, 1,
0.9867552, 0.05954935, 1.016306, 1, 0, 0.9764706, 1,
0.988637, 0.5948451, 2.251954, 1, 0, 0.972549, 1,
0.9909727, -0.6563893, 0.5372165, 1, 0, 0.9647059, 1,
0.9912807, 0.1486567, 1.518615, 1, 0, 0.9607843, 1,
0.9921481, 0.4841683, 0.9747339, 1, 0, 0.9529412, 1,
0.9970949, -1.0094, 1.287676, 1, 0, 0.9490196, 1,
1.001043, 0.575439, 2.321381, 1, 0, 0.9411765, 1,
1.00532, -0.1843481, -0.06046624, 1, 0, 0.9372549, 1,
1.016047, 1.019162, 0.3717459, 1, 0, 0.9294118, 1,
1.021486, -0.654036, 1.590683, 1, 0, 0.9254902, 1,
1.02267, -0.7849235, 3.478251, 1, 0, 0.9176471, 1,
1.030759, 0.8316543, 2.008241, 1, 0, 0.9137255, 1,
1.035704, 0.4149626, 0.1679998, 1, 0, 0.9058824, 1,
1.036241, 0.5218455, 1.739605, 1, 0, 0.9019608, 1,
1.041069, 1.182749, 0.4689619, 1, 0, 0.8941177, 1,
1.044635, 1.621907, 1.189662, 1, 0, 0.8862745, 1,
1.052627, 1.748587, 1.472078, 1, 0, 0.8823529, 1,
1.053409, 1.492827, 0.8284199, 1, 0, 0.8745098, 1,
1.053518, -0.2514543, 0.168478, 1, 0, 0.8705882, 1,
1.053571, -0.1499091, 0.9760049, 1, 0, 0.8627451, 1,
1.059675, 0.9383094, 1.68704, 1, 0, 0.8588235, 1,
1.063903, -0.4531501, 2.154696, 1, 0, 0.8509804, 1,
1.081597, -1.375807, 2.506198, 1, 0, 0.8470588, 1,
1.086707, 0.5816382, 1.785371, 1, 0, 0.8392157, 1,
1.09235, 1.7036, 0.5933889, 1, 0, 0.8352941, 1,
1.101003, 0.4896874, 1.41851, 1, 0, 0.827451, 1,
1.101091, 1.46177, 1.120919, 1, 0, 0.8235294, 1,
1.106036, 1.19031, 0.4632143, 1, 0, 0.8156863, 1,
1.107231, -1.449325, 3.591446, 1, 0, 0.8117647, 1,
1.108582, -0.7570153, 1.508919, 1, 0, 0.8039216, 1,
1.111527, -0.6328125, 0.3361668, 1, 0, 0.7960784, 1,
1.114151, -1.506852, 2.685312, 1, 0, 0.7921569, 1,
1.116257, 1.523679, 2.64781, 1, 0, 0.7843137, 1,
1.11903, 0.04033517, 2.097785, 1, 0, 0.7803922, 1,
1.121638, -1.117894, 3.101388, 1, 0, 0.772549, 1,
1.124238, -0.1983507, 2.292155, 1, 0, 0.7686275, 1,
1.124984, 0.3180279, 1.819314, 1, 0, 0.7607843, 1,
1.125972, -0.2092078, 2.082276, 1, 0, 0.7568628, 1,
1.127398, -1.214742, 3.048285, 1, 0, 0.7490196, 1,
1.137091, -0.08827714, 0.6107963, 1, 0, 0.7450981, 1,
1.137779, 0.7161956, 0.7131075, 1, 0, 0.7372549, 1,
1.141797, 0.8340713, 2.692171, 1, 0, 0.7333333, 1,
1.142563, -0.584524, -0.494121, 1, 0, 0.7254902, 1,
1.153728, -0.2036516, 1.727498, 1, 0, 0.7215686, 1,
1.162675, 0.2710374, 2.191589, 1, 0, 0.7137255, 1,
1.17003, 0.02735601, 1.291935, 1, 0, 0.7098039, 1,
1.170219, 1.250946, 1.915229, 1, 0, 0.7019608, 1,
1.184528, -0.3357224, 1.230786, 1, 0, 0.6941177, 1,
1.190946, 0.1443441, 2.220609, 1, 0, 0.6901961, 1,
1.195761, -0.7403375, 2.762955, 1, 0, 0.682353, 1,
1.202652, 0.3306993, 2.407409, 1, 0, 0.6784314, 1,
1.203388, 0.9899294, 0.7719889, 1, 0, 0.6705883, 1,
1.205329, 0.7193451, 1.678051, 1, 0, 0.6666667, 1,
1.20939, 1.69179, 0.8480237, 1, 0, 0.6588235, 1,
1.211672, -1.167394, 2.772528, 1, 0, 0.654902, 1,
1.215362, -0.08208911, 2.592523, 1, 0, 0.6470588, 1,
1.216062, -0.1216949, 2.804802, 1, 0, 0.6431373, 1,
1.221165, -0.002132528, -0.1468267, 1, 0, 0.6352941, 1,
1.222646, -0.5586259, 1.648952, 1, 0, 0.6313726, 1,
1.232409, 0.5479226, -1.083659, 1, 0, 0.6235294, 1,
1.236138, -1.01, 2.611277, 1, 0, 0.6196079, 1,
1.236969, 0.06790653, -0.2874822, 1, 0, 0.6117647, 1,
1.2385, -0.7013503, 2.758418, 1, 0, 0.6078432, 1,
1.241384, 1.018763, 1.196059, 1, 0, 0.6, 1,
1.243135, 1.319334, 1.997334, 1, 0, 0.5921569, 1,
1.244022, 0.4612378, 0.5274303, 1, 0, 0.5882353, 1,
1.24803, -0.4974624, 2.752191, 1, 0, 0.5803922, 1,
1.248102, -0.2687725, 0.053548, 1, 0, 0.5764706, 1,
1.275478, -0.09085716, 1.879747, 1, 0, 0.5686275, 1,
1.27644, 1.708763, 0.296501, 1, 0, 0.5647059, 1,
1.286957, 0.4691108, 0.8780828, 1, 0, 0.5568628, 1,
1.289478, -0.5674616, 2.0509, 1, 0, 0.5529412, 1,
1.31809, -0.7237492, 2.342685, 1, 0, 0.5450981, 1,
1.320279, -0.1594681, 1.616156, 1, 0, 0.5411765, 1,
1.328537, -0.1998952, 3.282655, 1, 0, 0.5333334, 1,
1.330542, 0.8273401, 0.6312648, 1, 0, 0.5294118, 1,
1.356973, -0.9440314, 1.813483, 1, 0, 0.5215687, 1,
1.364776, 0.1805947, 0.9076746, 1, 0, 0.5176471, 1,
1.373165, -0.3425064, 0.06021787, 1, 0, 0.509804, 1,
1.376126, 0.01901617, 1.394316, 1, 0, 0.5058824, 1,
1.377452, 1.369191, 1.277328, 1, 0, 0.4980392, 1,
1.3777, 0.1716161, 0.7853859, 1, 0, 0.4901961, 1,
1.379451, 1.113864, -0.1423963, 1, 0, 0.4862745, 1,
1.380286, 0.7253159, 1.196501, 1, 0, 0.4784314, 1,
1.382887, -2.631538, 1.139705, 1, 0, 0.4745098, 1,
1.385055, 0.05244799, 0.6719124, 1, 0, 0.4666667, 1,
1.398728, -0.5024415, 2.174274, 1, 0, 0.4627451, 1,
1.402207, 0.8302898, 1.39209, 1, 0, 0.454902, 1,
1.405058, -0.1100098, 2.681, 1, 0, 0.4509804, 1,
1.410752, 2.504209, 0.2673602, 1, 0, 0.4431373, 1,
1.42737, -1.838666, 2.111327, 1, 0, 0.4392157, 1,
1.466018, -0.6811069, 5.257467, 1, 0, 0.4313726, 1,
1.467277, -0.8294933, 1.525816, 1, 0, 0.427451, 1,
1.475948, 2.614036, 1.523038, 1, 0, 0.4196078, 1,
1.482431, -1.095343, 2.903238, 1, 0, 0.4156863, 1,
1.485355, -0.1972351, 2.226632, 1, 0, 0.4078431, 1,
1.487734, 1.434633, -0.1505014, 1, 0, 0.4039216, 1,
1.491156, -1.550249, 1.56902, 1, 0, 0.3960784, 1,
1.501933, -0.5112071, 1.483271, 1, 0, 0.3882353, 1,
1.503602, -0.6043862, -0.1500657, 1, 0, 0.3843137, 1,
1.508227, -0.6764314, 0.9059917, 1, 0, 0.3764706, 1,
1.523571, -0.705705, 4.30658, 1, 0, 0.372549, 1,
1.531148, -0.5765467, 3.045228, 1, 0, 0.3647059, 1,
1.553666, -1.376887, 1.206009, 1, 0, 0.3607843, 1,
1.565292, -0.3958057, 1.689778, 1, 0, 0.3529412, 1,
1.571229, 0.8319206, 2.36182, 1, 0, 0.3490196, 1,
1.573871, 1.552275, -0.3123763, 1, 0, 0.3411765, 1,
1.576596, -0.2558332, 2.442047, 1, 0, 0.3372549, 1,
1.597986, 0.09056502, 0.784264, 1, 0, 0.3294118, 1,
1.616825, -1.233388, 3.658335, 1, 0, 0.3254902, 1,
1.623535, 1.47596, -0.7760857, 1, 0, 0.3176471, 1,
1.627011, -1.02363, 1.951983, 1, 0, 0.3137255, 1,
1.629413, 0.135087, 1.295443, 1, 0, 0.3058824, 1,
1.632665, -1.725862, 3.2322, 1, 0, 0.2980392, 1,
1.635873, 1.537744, 0.9658975, 1, 0, 0.2941177, 1,
1.64772, 0.7192906, 1.540114, 1, 0, 0.2862745, 1,
1.650443, -0.3103281, 2.429834, 1, 0, 0.282353, 1,
1.656291, -1.695425, 2.403959, 1, 0, 0.2745098, 1,
1.659294, 2.793784, 0.6201695, 1, 0, 0.2705882, 1,
1.66373, -0.9636716, 0.6618316, 1, 0, 0.2627451, 1,
1.665072, 0.434203, -1.267184, 1, 0, 0.2588235, 1,
1.666346, 0.1003964, -0.5333063, 1, 0, 0.2509804, 1,
1.672439, -2.643382, 2.369833, 1, 0, 0.2470588, 1,
1.689229, -0.453898, 2.575974, 1, 0, 0.2392157, 1,
1.694304, -1.499749, 2.785533, 1, 0, 0.2352941, 1,
1.698794, -0.2850152, 0.4881996, 1, 0, 0.227451, 1,
1.708837, -0.1628229, 2.599456, 1, 0, 0.2235294, 1,
1.728359, 0.5743236, 1.203836, 1, 0, 0.2156863, 1,
1.730737, -0.2452554, 1.591603, 1, 0, 0.2117647, 1,
1.759197, -0.2588626, 3.683721, 1, 0, 0.2039216, 1,
1.763398, 0.475491, 1.457547, 1, 0, 0.1960784, 1,
1.774691, -0.4106079, 0.869019, 1, 0, 0.1921569, 1,
1.779289, -0.02368098, 1.635451, 1, 0, 0.1843137, 1,
1.806952, -0.1191446, 0.8644351, 1, 0, 0.1803922, 1,
1.832713, -0.6633993, 1.480594, 1, 0, 0.172549, 1,
1.876997, 0.873946, 2.110817, 1, 0, 0.1686275, 1,
1.912202, -0.5448269, 2.995072, 1, 0, 0.1607843, 1,
1.91341, 0.4195913, 1.527425, 1, 0, 0.1568628, 1,
1.930471, 0.6953479, 0.8262166, 1, 0, 0.1490196, 1,
1.932691, -0.09410606, 1.891338, 1, 0, 0.145098, 1,
1.947616, 2.04109, 0.5749676, 1, 0, 0.1372549, 1,
1.947625, -1.288203, 2.858599, 1, 0, 0.1333333, 1,
1.965276, 0.2099102, 2.327675, 1, 0, 0.1254902, 1,
2.000511, 1.154651, -0.4362275, 1, 0, 0.1215686, 1,
2.004691, -1.518436, 1.243887, 1, 0, 0.1137255, 1,
2.030683, -0.09485633, 0.3666352, 1, 0, 0.1098039, 1,
2.112716, 0.7239556, 0.07473604, 1, 0, 0.1019608, 1,
2.163557, -1.136839, 0.1900329, 1, 0, 0.09411765, 1,
2.166424, -0.5246401, 3.186219, 1, 0, 0.09019608, 1,
2.202593, 1.519443, 1.112007, 1, 0, 0.08235294, 1,
2.270945, 0.4007291, 1.05159, 1, 0, 0.07843138, 1,
2.272465, 1.497867, 0.9787042, 1, 0, 0.07058824, 1,
2.287575, -0.7803746, 0.3096806, 1, 0, 0.06666667, 1,
2.287697, 2.348262, 0.8745158, 1, 0, 0.05882353, 1,
2.289991, 0.4492042, 1.292738, 1, 0, 0.05490196, 1,
2.347206, 0.1905778, 0.7890199, 1, 0, 0.04705882, 1,
2.447849, 0.1351654, 2.352919, 1, 0, 0.04313726, 1,
2.487477, 0.05746466, -0.3052521, 1, 0, 0.03529412, 1,
2.554714, -0.6463747, 0.7461475, 1, 0, 0.03137255, 1,
2.562898, -0.7817759, 0.944606, 1, 0, 0.02352941, 1,
2.748336, -1.37179, 1.554983, 1, 0, 0.01960784, 1,
2.752076, 2.328345, 0.6999686, 1, 0, 0.01176471, 1,
3.026226, -0.9265546, 1.9094, 1, 0, 0.007843138, 1
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
-0.3171443, -4.486742, -7.907864, 0, -0.5, 0.5, 0.5,
-0.3171443, -4.486742, -7.907864, 1, -0.5, 0.5, 0.5,
-0.3171443, -4.486742, -7.907864, 1, 1.5, 0.5, 0.5,
-0.3171443, -4.486742, -7.907864, 0, 1.5, 0.5, 0.5
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
-4.793917, -0.1492618, -7.907864, 0, -0.5, 0.5, 0.5,
-4.793917, -0.1492618, -7.907864, 1, -0.5, 0.5, 0.5,
-4.793917, -0.1492618, -7.907864, 1, 1.5, 0.5, 0.5,
-4.793917, -0.1492618, -7.907864, 0, 1.5, 0.5, 0.5
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
-4.793917, -4.486742, -0.3711481, 0, -0.5, 0.5, 0.5,
-4.793917, -4.486742, -0.3711481, 1, -0.5, 0.5, 0.5,
-4.793917, -4.486742, -0.3711481, 1, 1.5, 0.5, 0.5,
-4.793917, -4.486742, -0.3711481, 0, 1.5, 0.5, 0.5
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
-3, -3.485785, -6.168622,
3, -3.485785, -6.168622,
-3, -3.485785, -6.168622,
-3, -3.652611, -6.458495,
-2, -3.485785, -6.168622,
-2, -3.652611, -6.458495,
-1, -3.485785, -6.168622,
-1, -3.652611, -6.458495,
0, -3.485785, -6.168622,
0, -3.652611, -6.458495,
1, -3.485785, -6.168622,
1, -3.652611, -6.458495,
2, -3.485785, -6.168622,
2, -3.652611, -6.458495,
3, -3.485785, -6.168622,
3, -3.652611, -6.458495
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
-3, -3.986264, -7.038242, 0, -0.5, 0.5, 0.5,
-3, -3.986264, -7.038242, 1, -0.5, 0.5, 0.5,
-3, -3.986264, -7.038242, 1, 1.5, 0.5, 0.5,
-3, -3.986264, -7.038242, 0, 1.5, 0.5, 0.5,
-2, -3.986264, -7.038242, 0, -0.5, 0.5, 0.5,
-2, -3.986264, -7.038242, 1, -0.5, 0.5, 0.5,
-2, -3.986264, -7.038242, 1, 1.5, 0.5, 0.5,
-2, -3.986264, -7.038242, 0, 1.5, 0.5, 0.5,
-1, -3.986264, -7.038242, 0, -0.5, 0.5, 0.5,
-1, -3.986264, -7.038242, 1, -0.5, 0.5, 0.5,
-1, -3.986264, -7.038242, 1, 1.5, 0.5, 0.5,
-1, -3.986264, -7.038242, 0, 1.5, 0.5, 0.5,
0, -3.986264, -7.038242, 0, -0.5, 0.5, 0.5,
0, -3.986264, -7.038242, 1, -0.5, 0.5, 0.5,
0, -3.986264, -7.038242, 1, 1.5, 0.5, 0.5,
0, -3.986264, -7.038242, 0, 1.5, 0.5, 0.5,
1, -3.986264, -7.038242, 0, -0.5, 0.5, 0.5,
1, -3.986264, -7.038242, 1, -0.5, 0.5, 0.5,
1, -3.986264, -7.038242, 1, 1.5, 0.5, 0.5,
1, -3.986264, -7.038242, 0, 1.5, 0.5, 0.5,
2, -3.986264, -7.038242, 0, -0.5, 0.5, 0.5,
2, -3.986264, -7.038242, 1, -0.5, 0.5, 0.5,
2, -3.986264, -7.038242, 1, 1.5, 0.5, 0.5,
2, -3.986264, -7.038242, 0, 1.5, 0.5, 0.5,
3, -3.986264, -7.038242, 0, -0.5, 0.5, 0.5,
3, -3.986264, -7.038242, 1, -0.5, 0.5, 0.5,
3, -3.986264, -7.038242, 1, 1.5, 0.5, 0.5,
3, -3.986264, -7.038242, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.760815, -3, -6.168622,
-3.760815, 3, -6.168622,
-3.760815, -3, -6.168622,
-3.932999, -3, -6.458495,
-3.760815, -2, -6.168622,
-3.932999, -2, -6.458495,
-3.760815, -1, -6.168622,
-3.932999, -1, -6.458495,
-3.760815, 0, -6.168622,
-3.932999, 0, -6.458495,
-3.760815, 1, -6.168622,
-3.932999, 1, -6.458495,
-3.760815, 2, -6.168622,
-3.932999, 2, -6.458495,
-3.760815, 3, -6.168622,
-3.932999, 3, -6.458495
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
-4.277366, -3, -7.038242, 0, -0.5, 0.5, 0.5,
-4.277366, -3, -7.038242, 1, -0.5, 0.5, 0.5,
-4.277366, -3, -7.038242, 1, 1.5, 0.5, 0.5,
-4.277366, -3, -7.038242, 0, 1.5, 0.5, 0.5,
-4.277366, -2, -7.038242, 0, -0.5, 0.5, 0.5,
-4.277366, -2, -7.038242, 1, -0.5, 0.5, 0.5,
-4.277366, -2, -7.038242, 1, 1.5, 0.5, 0.5,
-4.277366, -2, -7.038242, 0, 1.5, 0.5, 0.5,
-4.277366, -1, -7.038242, 0, -0.5, 0.5, 0.5,
-4.277366, -1, -7.038242, 1, -0.5, 0.5, 0.5,
-4.277366, -1, -7.038242, 1, 1.5, 0.5, 0.5,
-4.277366, -1, -7.038242, 0, 1.5, 0.5, 0.5,
-4.277366, 0, -7.038242, 0, -0.5, 0.5, 0.5,
-4.277366, 0, -7.038242, 1, -0.5, 0.5, 0.5,
-4.277366, 0, -7.038242, 1, 1.5, 0.5, 0.5,
-4.277366, 0, -7.038242, 0, 1.5, 0.5, 0.5,
-4.277366, 1, -7.038242, 0, -0.5, 0.5, 0.5,
-4.277366, 1, -7.038242, 1, -0.5, 0.5, 0.5,
-4.277366, 1, -7.038242, 1, 1.5, 0.5, 0.5,
-4.277366, 1, -7.038242, 0, 1.5, 0.5, 0.5,
-4.277366, 2, -7.038242, 0, -0.5, 0.5, 0.5,
-4.277366, 2, -7.038242, 1, -0.5, 0.5, 0.5,
-4.277366, 2, -7.038242, 1, 1.5, 0.5, 0.5,
-4.277366, 2, -7.038242, 0, 1.5, 0.5, 0.5,
-4.277366, 3, -7.038242, 0, -0.5, 0.5, 0.5,
-4.277366, 3, -7.038242, 1, -0.5, 0.5, 0.5,
-4.277366, 3, -7.038242, 1, 1.5, 0.5, 0.5,
-4.277366, 3, -7.038242, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<7; i++) 
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
20, 21, 22, 20, 22, 23,
24, 25, 26, 24, 26, 27
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
-3.760815, -3.485785, -4,
-3.760815, -3.485785, 4,
-3.760815, -3.485785, -4,
-3.932999, -3.652611, -4,
-3.760815, -3.485785, -2,
-3.932999, -3.652611, -2,
-3.760815, -3.485785, 0,
-3.932999, -3.652611, 0,
-3.760815, -3.485785, 2,
-3.932999, -3.652611, 2,
-3.760815, -3.485785, 4,
-3.932999, -3.652611, 4
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
-4.277366, -3.986264, -4, 0, -0.5, 0.5, 0.5,
-4.277366, -3.986264, -4, 1, -0.5, 0.5, 0.5,
-4.277366, -3.986264, -4, 1, 1.5, 0.5, 0.5,
-4.277366, -3.986264, -4, 0, 1.5, 0.5, 0.5,
-4.277366, -3.986264, -2, 0, -0.5, 0.5, 0.5,
-4.277366, -3.986264, -2, 1, -0.5, 0.5, 0.5,
-4.277366, -3.986264, -2, 1, 1.5, 0.5, 0.5,
-4.277366, -3.986264, -2, 0, 1.5, 0.5, 0.5,
-4.277366, -3.986264, 0, 0, -0.5, 0.5, 0.5,
-4.277366, -3.986264, 0, 1, -0.5, 0.5, 0.5,
-4.277366, -3.986264, 0, 1, 1.5, 0.5, 0.5,
-4.277366, -3.986264, 0, 0, 1.5, 0.5, 0.5,
-4.277366, -3.986264, 2, 0, -0.5, 0.5, 0.5,
-4.277366, -3.986264, 2, 1, -0.5, 0.5, 0.5,
-4.277366, -3.986264, 2, 1, 1.5, 0.5, 0.5,
-4.277366, -3.986264, 2, 0, 1.5, 0.5, 0.5,
-4.277366, -3.986264, 4, 0, -0.5, 0.5, 0.5,
-4.277366, -3.986264, 4, 1, -0.5, 0.5, 0.5,
-4.277366, -3.986264, 4, 1, 1.5, 0.5, 0.5,
-4.277366, -3.986264, 4, 0, 1.5, 0.5, 0.5
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
-3.760815, -3.485785, -6.168622,
-3.760815, 3.187262, -6.168622,
-3.760815, -3.485785, 5.426325,
-3.760815, 3.187262, 5.426325,
-3.760815, -3.485785, -6.168622,
-3.760815, -3.485785, 5.426325,
-3.760815, 3.187262, -6.168622,
-3.760815, 3.187262, 5.426325,
-3.760815, -3.485785, -6.168622,
3.126527, -3.485785, -6.168622,
-3.760815, -3.485785, 5.426325,
3.126527, -3.485785, 5.426325,
-3.760815, 3.187262, -6.168622,
3.126527, 3.187262, -6.168622,
-3.760815, 3.187262, 5.426325,
3.126527, 3.187262, 5.426325,
3.126527, -3.485785, -6.168622,
3.126527, 3.187262, -6.168622,
3.126527, -3.485785, 5.426325,
3.126527, 3.187262, 5.426325,
3.126527, -3.485785, -6.168622,
3.126527, -3.485785, 5.426325,
3.126527, 3.187262, -6.168622,
3.126527, 3.187262, 5.426325
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
var radius = 8.034728;
var distance = 35.74741;
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
mvMatrix.translate( 0.3171443, 0.1492618, 0.3711481 );
mvMatrix.scale( 1.261344, 1.30185, 0.7492321 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.74741);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
gl.drawArrays(gl.LINES, 0, 16);
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
gl.drawElements(gl.TRIANGLES, 42, gl.UNSIGNED_SHORT, 0);
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
Methyl_isothiocyanat<-read.table("Methyl_isothiocyanat.xyz")
```

```
## Error in read.table("Methyl_isothiocyanat.xyz"): no lines available in input
```

```r
x<-Methyl_isothiocyanat$V2
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_isothiocyanat' not found
```

```r
y<-Methyl_isothiocyanat$V3
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_isothiocyanat' not found
```

```r
z<-Methyl_isothiocyanat$V4
```

```
## Error in eval(expr, envir, enclos): object 'Methyl_isothiocyanat' not found
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
-3.660514, -0.8330284, -0.7343507, 0, 0, 1, 1, 1,
-3.256602, 1.793955, -2.038502, 1, 0, 0, 1, 1,
-2.980049, 0.8539823, 0.4782346, 1, 0, 0, 1, 1,
-2.667554, -1.382305, -1.680666, 1, 0, 0, 1, 1,
-2.66165, -0.7269059, -0.6365595, 1, 0, 0, 1, 1,
-2.657071, 0.004602693, -0.2098555, 1, 0, 0, 1, 1,
-2.615392, -0.7107909, -1.874554, 0, 0, 0, 1, 1,
-2.60125, 1.167445, -1.70334, 0, 0, 0, 1, 1,
-2.572901, -2.29531, -1.859161, 0, 0, 0, 1, 1,
-2.559132, -0.9749153, -0.5953229, 0, 0, 0, 1, 1,
-2.556181, -0.3035973, -1.980493, 0, 0, 0, 1, 1,
-2.432686, -0.3863701, -1.146241, 0, 0, 0, 1, 1,
-2.388679, 1.309209, -1.322453, 0, 0, 0, 1, 1,
-2.300411, -1.420447, -0.528901, 1, 1, 1, 1, 1,
-2.295092, 1.266835, -2.348693, 1, 1, 1, 1, 1,
-2.294147, -0.7777894, -2.464685, 1, 1, 1, 1, 1,
-2.287418, -0.7830666, -3.547527, 1, 1, 1, 1, 1,
-2.280138, 0.7866508, -1.879597, 1, 1, 1, 1, 1,
-2.209716, 0.3822139, -2.170349, 1, 1, 1, 1, 1,
-2.14328, -0.8172765, -2.309824, 1, 1, 1, 1, 1,
-2.130886, 1.081195, -1.696079, 1, 1, 1, 1, 1,
-2.113465, 0.4552854, -0.7589287, 1, 1, 1, 1, 1,
-2.103743, -0.008491448, -0.8134265, 1, 1, 1, 1, 1,
-2.065418, -0.5130686, -2.369915, 1, 1, 1, 1, 1,
-2.060337, 1.518518, 1.680407, 1, 1, 1, 1, 1,
-2.057588, 0.3242323, -0.09890126, 1, 1, 1, 1, 1,
-2.016377, -1.117586, -0.0004089636, 1, 1, 1, 1, 1,
-1.99165, -1.082928, -3.815163, 1, 1, 1, 1, 1,
-1.97035, 0.7415434, -3.391208, 0, 0, 1, 1, 1,
-1.944128, -2.451288, -2.97803, 1, 0, 0, 1, 1,
-1.93332, 0.3698919, 0.07587584, 1, 0, 0, 1, 1,
-1.931746, -0.01354682, -1.408724, 1, 0, 0, 1, 1,
-1.918209, -0.7585053, -3.274034, 1, 0, 0, 1, 1,
-1.911827, -0.0201527, -1.264365, 1, 0, 0, 1, 1,
-1.910611, 1.022283, 0.34835, 0, 0, 0, 1, 1,
-1.88022, 0.5219073, -0.3519607, 0, 0, 0, 1, 1,
-1.868528, 0.3489645, -1.24715, 0, 0, 0, 1, 1,
-1.866163, 1.384855, -1.499173, 0, 0, 0, 1, 1,
-1.861215, -0.2547908, -3.088853, 0, 0, 0, 1, 1,
-1.852708, 0.8993418, 0.03762609, 0, 0, 0, 1, 1,
-1.848775, 1.364991, -1.890279, 0, 0, 0, 1, 1,
-1.834175, 1.604164, -1.386068, 1, 1, 1, 1, 1,
-1.826519, -0.5538213, -0.606249, 1, 1, 1, 1, 1,
-1.823889, 0.8966984, -0.9163383, 1, 1, 1, 1, 1,
-1.821149, -0.486268, -1.42062, 1, 1, 1, 1, 1,
-1.820617, -0.5187767, -0.9080446, 1, 1, 1, 1, 1,
-1.820592, 0.3866698, -1.560567, 1, 1, 1, 1, 1,
-1.816332, 1.173425, -1.153167, 1, 1, 1, 1, 1,
-1.810209, -1.390206, -2.775801, 1, 1, 1, 1, 1,
-1.803908, -1.964284, -3.450952, 1, 1, 1, 1, 1,
-1.78949, 0.4591922, 0.4350226, 1, 1, 1, 1, 1,
-1.77887, -0.7581998, -1.908004, 1, 1, 1, 1, 1,
-1.767838, 0.1862235, -2.846302, 1, 1, 1, 1, 1,
-1.764019, 2.098641, -0.3401608, 1, 1, 1, 1, 1,
-1.758683, -0.5926673, -3.777497, 1, 1, 1, 1, 1,
-1.743063, 0.9281991, -1.447062, 1, 1, 1, 1, 1,
-1.730277, -0.8493999, -2.532077, 0, 0, 1, 1, 1,
-1.725062, 1.723771, -0.6923305, 1, 0, 0, 1, 1,
-1.721361, -0.7296682, -0.400453, 1, 0, 0, 1, 1,
-1.711782, 1.174178, -1.123999, 1, 0, 0, 1, 1,
-1.705182, 0.9114682, -2.73463, 1, 0, 0, 1, 1,
-1.692796, 0.3770135, -2.509358, 1, 0, 0, 1, 1,
-1.675307, 0.4694423, -2.001475, 0, 0, 0, 1, 1,
-1.663027, -0.4094036, -1.156315, 0, 0, 0, 1, 1,
-1.661951, -0.5892798, -0.8728206, 0, 0, 0, 1, 1,
-1.658877, 1.132177, -0.8687783, 0, 0, 0, 1, 1,
-1.622555, -0.8318291, -4.056978, 0, 0, 0, 1, 1,
-1.616182, -1.102041, -2.605322, 0, 0, 0, 1, 1,
-1.593998, -0.1210728, -1.301364, 0, 0, 0, 1, 1,
-1.591745, 2.588382, -1.372617, 1, 1, 1, 1, 1,
-1.590456, 1.322755, -1.032609, 1, 1, 1, 1, 1,
-1.588327, 1.065933, -1.29818, 1, 1, 1, 1, 1,
-1.574853, 0.201581, -1.40071, 1, 1, 1, 1, 1,
-1.571336, 0.4426932, -0.3983437, 1, 1, 1, 1, 1,
-1.567771, 0.984497, -3.380062, 1, 1, 1, 1, 1,
-1.555542, 1.23181, -1.555149, 1, 1, 1, 1, 1,
-1.543887, -0.365556, -1.730997, 1, 1, 1, 1, 1,
-1.529335, -0.1104093, -2.579276, 1, 1, 1, 1, 1,
-1.528333, -1.749502, -3.21795, 1, 1, 1, 1, 1,
-1.518881, -1.232829, -1.507873, 1, 1, 1, 1, 1,
-1.50154, -1.029962, -2.176797, 1, 1, 1, 1, 1,
-1.5002, 0.9971265, -1.147364, 1, 1, 1, 1, 1,
-1.49629, -2.68025, -2.755657, 1, 1, 1, 1, 1,
-1.483094, -2.557157, -2.267662, 1, 1, 1, 1, 1,
-1.479897, -0.9058189, -1.384386, 0, 0, 1, 1, 1,
-1.478333, -0.4944467, -3.283419, 1, 0, 0, 1, 1,
-1.477178, -0.1982551, -3.12687, 1, 0, 0, 1, 1,
-1.472315, -0.1665401, -2.501338, 1, 0, 0, 1, 1,
-1.44043, -0.3031385, -0.7157013, 1, 0, 0, 1, 1,
-1.434455, 1.708314, 0.3854946, 1, 0, 0, 1, 1,
-1.427115, -0.4015651, -3.284739, 0, 0, 0, 1, 1,
-1.419977, 0.9957165, -1.23796, 0, 0, 0, 1, 1,
-1.414026, 0.1276213, -0.9907644, 0, 0, 0, 1, 1,
-1.3973, 0.3073489, -2.486801, 0, 0, 0, 1, 1,
-1.394355, 1.269862, -0.0955458, 0, 0, 0, 1, 1,
-1.387117, -1.419922, -0.8464848, 0, 0, 0, 1, 1,
-1.338332, -2.1267, -3.054368, 0, 0, 0, 1, 1,
-1.32594, 0.0735103, -1.254138, 1, 1, 1, 1, 1,
-1.319986, 1.464498, -2.599671, 1, 1, 1, 1, 1,
-1.317793, -0.3250528, -1.846152, 1, 1, 1, 1, 1,
-1.315561, 0.06635097, -1.443069, 1, 1, 1, 1, 1,
-1.314649, -0.7813533, -2.228779, 1, 1, 1, 1, 1,
-1.308786, 0.4226473, -1.462126, 1, 1, 1, 1, 1,
-1.300267, 0.1438457, -1.852648, 1, 1, 1, 1, 1,
-1.29759, -0.6230748, -1.778592, 1, 1, 1, 1, 1,
-1.289699, -0.02313915, -2.036137, 1, 1, 1, 1, 1,
-1.287034, 1.608366, -1.216539, 1, 1, 1, 1, 1,
-1.28474, 0.04214004, -1.989423, 1, 1, 1, 1, 1,
-1.283107, 0.2847613, -0.7193293, 1, 1, 1, 1, 1,
-1.279191, -0.2056787, -1.107162, 1, 1, 1, 1, 1,
-1.274529, -0.04279634, -0.9921874, 1, 1, 1, 1, 1,
-1.265895, 0.916586, 0.6618174, 1, 1, 1, 1, 1,
-1.26475, 0.4350931, -3.017634, 0, 0, 1, 1, 1,
-1.255112, -0.2557665, -0.6311218, 1, 0, 0, 1, 1,
-1.247951, -1.024497, -4.049373, 1, 0, 0, 1, 1,
-1.24416, 0.7795559, -1.087644, 1, 0, 0, 1, 1,
-1.240114, -0.9618356, -1.419614, 1, 0, 0, 1, 1,
-1.233143, -2.111355, -3.021119, 1, 0, 0, 1, 1,
-1.232556, -0.5005483, -1.867226, 0, 0, 0, 1, 1,
-1.222774, -0.606566, -3.729891, 0, 0, 0, 1, 1,
-1.21094, 0.6799096, -0.4864665, 0, 0, 0, 1, 1,
-1.20938, -0.4475151, -1.745703, 0, 0, 0, 1, 1,
-1.196501, -0.2343, -1.766694, 0, 0, 0, 1, 1,
-1.184812, -0.5156538, -3.15727, 0, 0, 0, 1, 1,
-1.184403, -0.4297257, -2.839598, 0, 0, 0, 1, 1,
-1.169224, 0.4381046, -1.854514, 1, 1, 1, 1, 1,
-1.167555, 0.6490129, 0.2240529, 1, 1, 1, 1, 1,
-1.163696, -1.593928, -3.377593, 1, 1, 1, 1, 1,
-1.155768, 0.8139682, -1.240974, 1, 1, 1, 1, 1,
-1.151585, 2.059508, 0.7875355, 1, 1, 1, 1, 1,
-1.146381, -0.1994841, -3.04166, 1, 1, 1, 1, 1,
-1.134433, -0.1498051, -1.548433, 1, 1, 1, 1, 1,
-1.132919, -0.1899456, -0.8505315, 1, 1, 1, 1, 1,
-1.132266, 0.2934113, -1.121136, 1, 1, 1, 1, 1,
-1.111469, 0.7941796, -1.777924, 1, 1, 1, 1, 1,
-1.111382, 0.2944058, -1.102578, 1, 1, 1, 1, 1,
-1.111115, -0.3307239, -0.5433393, 1, 1, 1, 1, 1,
-1.103669, 0.1980388, -1.467058, 1, 1, 1, 1, 1,
-1.103459, -0.3817742, -1.54473, 1, 1, 1, 1, 1,
-1.101486, -1.136465, -1.276965, 1, 1, 1, 1, 1,
-1.098673, 0.1917159, -1.85688, 0, 0, 1, 1, 1,
-1.096358, 0.7154874, -0.3051023, 1, 0, 0, 1, 1,
-1.09123, 0.3560997, -2.351194, 1, 0, 0, 1, 1,
-1.089009, -0.1405923, -1.915389, 1, 0, 0, 1, 1,
-1.080053, 0.2754445, 0.08940345, 1, 0, 0, 1, 1,
-1.076106, -0.01403828, -1.610072, 1, 0, 0, 1, 1,
-1.066531, -2.207076, -1.084282, 0, 0, 0, 1, 1,
-1.066063, 0.8702905, -0.7823184, 0, 0, 0, 1, 1,
-1.050328, -0.6406875, -1.693548, 0, 0, 0, 1, 1,
-1.037686, 1.985135, -0.9966071, 0, 0, 0, 1, 1,
-1.034169, -0.5202208, -2.513794, 0, 0, 0, 1, 1,
-1.01448, -0.6632372, -3.428468, 0, 0, 0, 1, 1,
-1.003821, 0.6717284, -1.079288, 0, 0, 0, 1, 1,
-1.001858, 0.6901615, -0.6907642, 1, 1, 1, 1, 1,
-1.001268, -0.9118893, -1.320743, 1, 1, 1, 1, 1,
-0.9939495, -0.3678096, -3.466295, 1, 1, 1, 1, 1,
-0.9880777, 0.638472, -0.4802543, 1, 1, 1, 1, 1,
-0.9856011, -1.000827, -2.374223, 1, 1, 1, 1, 1,
-0.9853359, -1.32816, -2.663343, 1, 1, 1, 1, 1,
-0.9820691, 0.7528567, -1.629445, 1, 1, 1, 1, 1,
-0.9781833, -1.020467, -2.69632, 1, 1, 1, 1, 1,
-0.9767842, -0.497944, -3.390198, 1, 1, 1, 1, 1,
-0.9702492, 0.4819856, -0.03154336, 1, 1, 1, 1, 1,
-0.9617846, 0.6209058, -1.347096, 1, 1, 1, 1, 1,
-0.9550332, 1.02932, 0.4779686, 1, 1, 1, 1, 1,
-0.9520674, 0.2268759, -2.354055, 1, 1, 1, 1, 1,
-0.9460906, 0.01607813, -1.021971, 1, 1, 1, 1, 1,
-0.936852, 1.196945, -0.4409348, 1, 1, 1, 1, 1,
-0.9291084, -0.6456848, -2.964116, 0, 0, 1, 1, 1,
-0.926277, 0.1698396, -1.639457, 1, 0, 0, 1, 1,
-0.9220835, 0.2394582, -1.335376, 1, 0, 0, 1, 1,
-0.9195771, -0.6069336, -3.606185, 1, 0, 0, 1, 1,
-0.9185011, -0.4013359, -0.9785192, 1, 0, 0, 1, 1,
-0.9142405, 0.310104, -2.229328, 1, 0, 0, 1, 1,
-0.9102578, 0.1225549, -3.17119, 0, 0, 0, 1, 1,
-0.9017733, 1.356172, -1.636123, 0, 0, 0, 1, 1,
-0.8973512, 0.331964, -1.683768, 0, 0, 0, 1, 1,
-0.8966329, -0.4560146, -4.741343, 0, 0, 0, 1, 1,
-0.8927043, 0.1042515, -2.180047, 0, 0, 0, 1, 1,
-0.8907518, 0.3794728, 0.8023478, 0, 0, 0, 1, 1,
-0.8899474, 0.4869874, -1.211542, 0, 0, 0, 1, 1,
-0.8890458, -0.01960561, -1.914729, 1, 1, 1, 1, 1,
-0.8766065, -0.9533968, -1.05822, 1, 1, 1, 1, 1,
-0.8726861, -0.01468517, -4.384644, 1, 1, 1, 1, 1,
-0.8675133, 0.2007769, -1.224434, 1, 1, 1, 1, 1,
-0.8670096, -0.8310125, -3.387753, 1, 1, 1, 1, 1,
-0.8528928, -0.8326119, -1.627752, 1, 1, 1, 1, 1,
-0.8485683, -0.9006772, -2.863811, 1, 1, 1, 1, 1,
-0.8429623, -0.6050925, -2.946598, 1, 1, 1, 1, 1,
-0.8417564, -0.7428035, -2.040949, 1, 1, 1, 1, 1,
-0.8411463, -1.710712, -1.222436, 1, 1, 1, 1, 1,
-0.8384709, -0.8519781, -2.662176, 1, 1, 1, 1, 1,
-0.8372282, 0.2427911, -0.92009, 1, 1, 1, 1, 1,
-0.8336022, 0.1313207, -0.3950473, 1, 1, 1, 1, 1,
-0.8328942, -0.7566622, -2.08212, 1, 1, 1, 1, 1,
-0.8282951, 0.8806802, -0.7224129, 1, 1, 1, 1, 1,
-0.826899, -1.594479, -3.438751, 0, 0, 1, 1, 1,
-0.8261696, -0.6320904, -1.868265, 1, 0, 0, 1, 1,
-0.8118129, -0.1014935, -1.119482, 1, 0, 0, 1, 1,
-0.8080053, 0.06579457, -1.493071, 1, 0, 0, 1, 1,
-0.8074036, -0.5673747, -0.6206414, 1, 0, 0, 1, 1,
-0.8061258, -0.04174083, -1.746446, 1, 0, 0, 1, 1,
-0.805596, 0.5268417, -0.8452309, 0, 0, 0, 1, 1,
-0.8050149, -0.8739486, -2.185918, 0, 0, 0, 1, 1,
-0.8015124, 0.4990015, -1.110117, 0, 0, 0, 1, 1,
-0.8003523, 0.9056686, -1.759781, 0, 0, 0, 1, 1,
-0.7984911, 0.5231576, -2.02903, 0, 0, 0, 1, 1,
-0.7970955, -0.9870332, -2.880481, 0, 0, 0, 1, 1,
-0.7955605, -0.6112935, -2.387973, 0, 0, 0, 1, 1,
-0.7904932, -0.08792331, -1.877057, 1, 1, 1, 1, 1,
-0.7890621, -1.427835, -2.31359, 1, 1, 1, 1, 1,
-0.7869316, -1.037288, -2.266775, 1, 1, 1, 1, 1,
-0.7829146, -1.139397, -2.192395, 1, 1, 1, 1, 1,
-0.7823861, 0.5080431, -0.1128253, 1, 1, 1, 1, 1,
-0.7798579, 0.649026, 0.2145346, 1, 1, 1, 1, 1,
-0.7759832, -0.6161436, -2.055176, 1, 1, 1, 1, 1,
-0.774967, -0.0278468, -1.279722, 1, 1, 1, 1, 1,
-0.7741977, -0.1435843, -0.8026761, 1, 1, 1, 1, 1,
-0.7736393, 0.2838143, -2.560561, 1, 1, 1, 1, 1,
-0.7709025, -1.813863, -3.126569, 1, 1, 1, 1, 1,
-0.7660363, -1.853664, -3.441755, 1, 1, 1, 1, 1,
-0.7639325, 1.725537, -1.039109, 1, 1, 1, 1, 1,
-0.7632553, -0.7251896, -2.032038, 1, 1, 1, 1, 1,
-0.7616001, -0.934552, -3.923332, 1, 1, 1, 1, 1,
-0.7566745, -0.982232, -3.1639, 0, 0, 1, 1, 1,
-0.7559695, 0.08427998, -0.4486929, 1, 0, 0, 1, 1,
-0.7545377, -0.8917475, -2.656259, 1, 0, 0, 1, 1,
-0.7538123, -1.256349, -1.566725, 1, 0, 0, 1, 1,
-0.7505507, -1.87142, -1.405841, 1, 0, 0, 1, 1,
-0.7468985, 0.9117182, 0.265936, 1, 0, 0, 1, 1,
-0.7464379, -1.002692, -2.42663, 0, 0, 0, 1, 1,
-0.7409441, -0.7581105, -3.133702, 0, 0, 0, 1, 1,
-0.7383083, 0.4034615, -2.528946, 0, 0, 0, 1, 1,
-0.7362522, 0.874861, -0.8578841, 0, 0, 0, 1, 1,
-0.7339097, -0.8206809, -3.761909, 0, 0, 0, 1, 1,
-0.7300383, -0.3146078, -3.143901, 0, 0, 0, 1, 1,
-0.7273058, 1.769947, -1.154359, 0, 0, 0, 1, 1,
-0.7255101, 0.3893055, -1.031754, 1, 1, 1, 1, 1,
-0.7243219, -0.4510832, -2.313673, 1, 1, 1, 1, 1,
-0.7235143, -0.4962898, -3.893884, 1, 1, 1, 1, 1,
-0.7232188, 0.08557116, -2.799297, 1, 1, 1, 1, 1,
-0.7118866, -0.4877381, -0.875163, 1, 1, 1, 1, 1,
-0.7068284, -0.3295249, -1.879426, 1, 1, 1, 1, 1,
-0.6966277, 0.04395526, -1.204987, 1, 1, 1, 1, 1,
-0.6958315, -0.6334346, -1.834302, 1, 1, 1, 1, 1,
-0.6906481, 0.4816735, -3.073147, 1, 1, 1, 1, 1,
-0.6890479, 0.1053007, -0.8231843, 1, 1, 1, 1, 1,
-0.6887712, 0.5223324, -1.32731, 1, 1, 1, 1, 1,
-0.6858789, -0.8662028, -3.18856, 1, 1, 1, 1, 1,
-0.6853784, -0.6740286, -3.499793, 1, 1, 1, 1, 1,
-0.6834162, 0.09830981, -1.694064, 1, 1, 1, 1, 1,
-0.6792715, -1.351015, -3.612137, 1, 1, 1, 1, 1,
-0.6756725, 0.5043204, -0.7956091, 0, 0, 1, 1, 1,
-0.6739235, 0.6903535, -0.2845663, 1, 0, 0, 1, 1,
-0.6695819, -1.140935, -1.118245, 1, 0, 0, 1, 1,
-0.6665365, 0.6021317, -0.2081397, 1, 0, 0, 1, 1,
-0.6559651, 0.926984, 0.1100577, 1, 0, 0, 1, 1,
-0.6517216, 1.068144, -1.749426, 1, 0, 0, 1, 1,
-0.6495317, -1.315805, -2.848807, 0, 0, 0, 1, 1,
-0.6454711, 1.431332, -3.347397, 0, 0, 0, 1, 1,
-0.6392796, 0.5494923, -1.429607, 0, 0, 0, 1, 1,
-0.6391634, 2.206485, -0.6673399, 0, 0, 0, 1, 1,
-0.6375391, -0.6532147, -1.185791, 0, 0, 0, 1, 1,
-0.6339694, -2.2544, -2.625248, 0, 0, 0, 1, 1,
-0.6323975, 1.320313, 0.585376, 0, 0, 0, 1, 1,
-0.62755, 0.1004419, -1.145672, 1, 1, 1, 1, 1,
-0.6262745, 1.433103, 0.7618805, 1, 1, 1, 1, 1,
-0.6242317, -0.299341, -0.7964162, 1, 1, 1, 1, 1,
-0.6240848, -0.9646829, -1.853179, 1, 1, 1, 1, 1,
-0.6238511, -0.3238782, -3.980943, 1, 1, 1, 1, 1,
-0.6231211, 0.9104936, -2.263511, 1, 1, 1, 1, 1,
-0.6154513, -1.540383, -3.451119, 1, 1, 1, 1, 1,
-0.6092415, -1.991177, -3.021331, 1, 1, 1, 1, 1,
-0.6071088, -0.7771574, -3.01313, 1, 1, 1, 1, 1,
-0.6059605, 0.2606139, -2.049124, 1, 1, 1, 1, 1,
-0.5947632, 0.2964625, -1.993152, 1, 1, 1, 1, 1,
-0.5886526, -1.903151, -0.5701562, 1, 1, 1, 1, 1,
-0.5868106, 0.5341209, -1.845152, 1, 1, 1, 1, 1,
-0.5849771, 0.08890566, -2.065121, 1, 1, 1, 1, 1,
-0.5838762, 0.2400078, -2.148972, 1, 1, 1, 1, 1,
-0.5817822, -1.567338, -0.8873748, 0, 0, 1, 1, 1,
-0.5800374, 1.976536, -0.5175052, 1, 0, 0, 1, 1,
-0.5797438, -0.2168936, -1.568682, 1, 0, 0, 1, 1,
-0.5789428, -1.401102, -3.953344, 1, 0, 0, 1, 1,
-0.5738562, -0.751105, -2.507485, 1, 0, 0, 1, 1,
-0.5729361, 0.05159916, -1.457471, 1, 0, 0, 1, 1,
-0.5674604, 0.3105972, -0.2539223, 0, 0, 0, 1, 1,
-0.5629228, -1.018001, -1.895203, 0, 0, 0, 1, 1,
-0.5599014, -0.01712122, 0.4340031, 0, 0, 0, 1, 1,
-0.5589518, 0.7961041, -0.4160448, 0, 0, 0, 1, 1,
-0.5580444, 0.3566613, -0.833265, 0, 0, 0, 1, 1,
-0.5531415, 0.4445617, -2.298489, 0, 0, 0, 1, 1,
-0.5506243, -0.3889854, -1.982693, 0, 0, 0, 1, 1,
-0.5500726, -0.2157236, -0.533469, 1, 1, 1, 1, 1,
-0.5482457, -0.6333271, -2.629625, 1, 1, 1, 1, 1,
-0.5448084, 1.145632, 0.8819381, 1, 1, 1, 1, 1,
-0.5422225, -1.594252, -4.39491, 1, 1, 1, 1, 1,
-0.5377795, -1.216359, -2.465053, 1, 1, 1, 1, 1,
-0.5367121, 0.4915574, -1.225984, 1, 1, 1, 1, 1,
-0.5323356, 0.2431566, -1.279328, 1, 1, 1, 1, 1,
-0.5322762, -0.6815564, -1.681449, 1, 1, 1, 1, 1,
-0.5294638, 1.954348, 0.5512965, 1, 1, 1, 1, 1,
-0.5167634, 1.034759, -0.8904047, 1, 1, 1, 1, 1,
-0.5128651, -1.835828, -2.00529, 1, 1, 1, 1, 1,
-0.512529, -1.881876, -0.7879061, 1, 1, 1, 1, 1,
-0.5074326, -0.1938819, 0.1097356, 1, 1, 1, 1, 1,
-0.505986, -0.9257936, -2.720239, 1, 1, 1, 1, 1,
-0.5047982, -0.6688532, -2.959996, 1, 1, 1, 1, 1,
-0.5041686, -2.366929, -3.889436, 0, 0, 1, 1, 1,
-0.499903, -0.1112261, 0.2588054, 1, 0, 0, 1, 1,
-0.4977848, -0.6841478, -3.095774, 1, 0, 0, 1, 1,
-0.4945361, 1.009437, 0.839991, 1, 0, 0, 1, 1,
-0.491758, 0.5682084, -1.064445, 1, 0, 0, 1, 1,
-0.4899233, 0.01942131, -1.64656, 1, 0, 0, 1, 1,
-0.4886193, 0.9643078, -0.8244643, 0, 0, 0, 1, 1,
-0.4883379, 1.21902, -0.5374202, 0, 0, 0, 1, 1,
-0.4830358, 0.1041623, -1.376424, 0, 0, 0, 1, 1,
-0.4803802, 0.1760213, -2.677095, 0, 0, 0, 1, 1,
-0.4788711, 0.122907, -1.59568, 0, 0, 0, 1, 1,
-0.4742314, 0.4555269, -3.38564, 0, 0, 0, 1, 1,
-0.4739739, -0.6366253, -0.3823104, 0, 0, 0, 1, 1,
-0.4728966, 0.3878108, -0.007237347, 1, 1, 1, 1, 1,
-0.4698118, 0.3228924, 0.2114969, 1, 1, 1, 1, 1,
-0.4653475, -0.7691709, -2.120746, 1, 1, 1, 1, 1,
-0.4645448, -0.4776268, -1.627992, 1, 1, 1, 1, 1,
-0.4618623, 0.609273, -0.7115655, 1, 1, 1, 1, 1,
-0.4568932, 0.9576622, -0.7683742, 1, 1, 1, 1, 1,
-0.45024, -0.5001699, -2.271414, 1, 1, 1, 1, 1,
-0.4485816, -0.2861386, -1.854605, 1, 1, 1, 1, 1,
-0.4473087, -1.098278, -2.847584, 1, 1, 1, 1, 1,
-0.4453553, -0.6071503, -3.356849, 1, 1, 1, 1, 1,
-0.4395722, -0.4102442, -1.903735, 1, 1, 1, 1, 1,
-0.4378519, 0.02983205, -1.263361, 1, 1, 1, 1, 1,
-0.4333691, -1.159405, -4.295727, 1, 1, 1, 1, 1,
-0.425154, -0.3951029, -3.667934, 1, 1, 1, 1, 1,
-0.4161389, -0.2495826, -3.114321, 1, 1, 1, 1, 1,
-0.4095974, 0.009767443, -2.44701, 0, 0, 1, 1, 1,
-0.3996777, -0.4643207, -2.341377, 1, 0, 0, 1, 1,
-0.3993602, 3.090081, -0.5712382, 1, 0, 0, 1, 1,
-0.3973875, 0.02568691, -1.589233, 1, 0, 0, 1, 1,
-0.3965565, 1.257404, -0.9683759, 1, 0, 0, 1, 1,
-0.3959711, -0.3977677, -0.3856316, 1, 0, 0, 1, 1,
-0.3950144, -1.284534, -3.291321, 0, 0, 0, 1, 1,
-0.3932079, -0.324297, -2.78873, 0, 0, 0, 1, 1,
-0.3916081, -0.4758856, -2.135881, 0, 0, 0, 1, 1,
-0.3890241, 0.7706511, -1.432536, 0, 0, 0, 1, 1,
-0.3856333, -0.9711305, -2.858318, 0, 0, 0, 1, 1,
-0.3838663, -0.3507963, -3.876972, 0, 0, 0, 1, 1,
-0.3800532, 0.3922747, -1.228862, 0, 0, 0, 1, 1,
-0.3793361, -2.106899, -2.571435, 1, 1, 1, 1, 1,
-0.3775838, -0.7714509, -2.68861, 1, 1, 1, 1, 1,
-0.3740542, -1.442207, -5.999763, 1, 1, 1, 1, 1,
-0.37267, -0.2686792, -1.730255, 1, 1, 1, 1, 1,
-0.3702747, 1.089886, -0.3470791, 1, 1, 1, 1, 1,
-0.369112, -0.1749948, -3.404613, 1, 1, 1, 1, 1,
-0.3669509, -1.229797, -2.050527, 1, 1, 1, 1, 1,
-0.3655891, -0.05497007, 0.6904147, 1, 1, 1, 1, 1,
-0.3634005, -0.1928588, -1.326584, 1, 1, 1, 1, 1,
-0.3625444, 0.6362803, -0.1494576, 1, 1, 1, 1, 1,
-0.3604871, -0.8269913, -3.0315, 1, 1, 1, 1, 1,
-0.3589671, 0.3052348, -0.6306508, 1, 1, 1, 1, 1,
-0.3563917, -0.5384058, -2.936789, 1, 1, 1, 1, 1,
-0.3557935, 0.06419431, -2.07852, 1, 1, 1, 1, 1,
-0.3497161, 0.651015, -1.82273, 1, 1, 1, 1, 1,
-0.349503, -0.9790621, -2.946821, 0, 0, 1, 1, 1,
-0.348206, -0.2592566, -2.952227, 1, 0, 0, 1, 1,
-0.3465967, 0.5899481, -0.6911365, 1, 0, 0, 1, 1,
-0.3461191, 0.5081959, -0.3953815, 1, 0, 0, 1, 1,
-0.3452813, -1.300327, -4.943885, 1, 0, 0, 1, 1,
-0.3414491, 1.05912, -0.1257061, 1, 0, 0, 1, 1,
-0.3407759, 0.5316012, -0.08857927, 0, 0, 0, 1, 1,
-0.3365308, -0.04335768, -1.392509, 0, 0, 0, 1, 1,
-0.3364222, -0.04867011, -2.682284, 0, 0, 0, 1, 1,
-0.33601, -0.3869472, -2.404294, 0, 0, 0, 1, 1,
-0.3352982, -0.2876292, -1.765153, 0, 0, 0, 1, 1,
-0.3338736, -0.415771, -2.006594, 0, 0, 0, 1, 1,
-0.326475, 0.08224801, -1.507334, 0, 0, 0, 1, 1,
-0.3249742, 1.328322, 1.999432, 1, 1, 1, 1, 1,
-0.3244503, 0.6950503, -1.028223, 1, 1, 1, 1, 1,
-0.3225484, 1.500983, -0.6579076, 1, 1, 1, 1, 1,
-0.3220344, -1.26653, -5.173104, 1, 1, 1, 1, 1,
-0.3213466, 1.714467, -0.2622638, 1, 1, 1, 1, 1,
-0.3191254, -1.574548, -4.242417, 1, 1, 1, 1, 1,
-0.3162406, -0.2491436, -0.7574238, 1, 1, 1, 1, 1,
-0.3152199, 0.04580205, -0.8578975, 1, 1, 1, 1, 1,
-0.3150858, 0.1447099, 1.450627, 1, 1, 1, 1, 1,
-0.3055045, -0.3401682, -3.030159, 1, 1, 1, 1, 1,
-0.3051674, 1.143677, -0.7226219, 1, 1, 1, 1, 1,
-0.305026, -0.7270363, -2.469562, 1, 1, 1, 1, 1,
-0.3020747, 0.5873939, -1.556302, 1, 1, 1, 1, 1,
-0.3004478, 1.107068, -3.069668, 1, 1, 1, 1, 1,
-0.2973451, 0.4465829, 0.7337003, 1, 1, 1, 1, 1,
-0.296748, 0.6168211, 0.5187846, 0, 0, 1, 1, 1,
-0.294961, 1.962354, -0.5055758, 1, 0, 0, 1, 1,
-0.2801865, -0.536997, -3.121384, 1, 0, 0, 1, 1,
-0.2784585, 0.07466704, -1.767263, 1, 0, 0, 1, 1,
-0.2719625, 1.184359, -0.3974333, 1, 0, 0, 1, 1,
-0.2709093, -0.6992765, -0.9951125, 1, 0, 0, 1, 1,
-0.2680331, -1.332997, -2.757033, 0, 0, 0, 1, 1,
-0.2677325, 0.1184837, -0.5333727, 0, 0, 0, 1, 1,
-0.2597809, -0.4466859, -3.183929, 0, 0, 0, 1, 1,
-0.2596926, -2.061825, -1.663785, 0, 0, 0, 1, 1,
-0.257197, -0.2966833, -3.690069, 0, 0, 0, 1, 1,
-0.2559885, -0.5470219, -3.593793, 0, 0, 0, 1, 1,
-0.2556891, 0.2693282, 1.453575, 0, 0, 0, 1, 1,
-0.2517996, 0.7271394, -2.106784, 1, 1, 1, 1, 1,
-0.245512, -0.5222076, -2.743245, 1, 1, 1, 1, 1,
-0.2440671, -0.2139748, -2.462368, 1, 1, 1, 1, 1,
-0.2420289, 1.509929, 0.9345557, 1, 1, 1, 1, 1,
-0.2414669, -0.9506996, -1.947429, 1, 1, 1, 1, 1,
-0.2368226, 1.195993, -0.9412277, 1, 1, 1, 1, 1,
-0.2273322, 0.2783294, 0.02817848, 1, 1, 1, 1, 1,
-0.2204847, -0.04019516, -1.43353, 1, 1, 1, 1, 1,
-0.2187595, 0.9594783, 0.6257555, 1, 1, 1, 1, 1,
-0.2166276, -0.5735129, -3.972317, 1, 1, 1, 1, 1,
-0.2148201, 0.4788762, -2.356624, 1, 1, 1, 1, 1,
-0.2077985, -0.076464, -1.389032, 1, 1, 1, 1, 1,
-0.2025858, -0.7070317, -2.082804, 1, 1, 1, 1, 1,
-0.1982365, -1.772347, -4.782106, 1, 1, 1, 1, 1,
-0.1950304, -0.3511342, -2.837922, 1, 1, 1, 1, 1,
-0.1938319, 0.9723023, 0.03451751, 0, 0, 1, 1, 1,
-0.1937118, -0.1359618, -3.238634, 1, 0, 0, 1, 1,
-0.1910632, -0.6180412, -1.236343, 1, 0, 0, 1, 1,
-0.190941, 2.563103, -1.037376, 1, 0, 0, 1, 1,
-0.1897749, 0.1003511, -2.999938, 1, 0, 0, 1, 1,
-0.1845892, 0.8231142, -0.2601038, 1, 0, 0, 1, 1,
-0.1829249, -0.8610076, -4.461899, 0, 0, 0, 1, 1,
-0.1794125, -0.1169069, -2.868533, 0, 0, 0, 1, 1,
-0.1752399, 0.5845479, -0.7313646, 0, 0, 0, 1, 1,
-0.1737547, 0.5870959, -1.975605, 0, 0, 0, 1, 1,
-0.1663993, -0.05240649, -1.926533, 0, 0, 0, 1, 1,
-0.1663972, -1.878298, -4.495279, 0, 0, 0, 1, 1,
-0.1663453, -0.02462145, -1.226134, 0, 0, 0, 1, 1,
-0.1629712, 0.1909068, -1.376919, 1, 1, 1, 1, 1,
-0.1625717, -0.02064935, -0.678169, 1, 1, 1, 1, 1,
-0.1597084, 0.150986, -0.04127696, 1, 1, 1, 1, 1,
-0.1564204, 1.197782, -0.8817871, 1, 1, 1, 1, 1,
-0.1559874, 0.03715282, -1.905674, 1, 1, 1, 1, 1,
-0.1533231, 0.7231372, 0.3617081, 1, 1, 1, 1, 1,
-0.1527505, 1.422086, -0.594432, 1, 1, 1, 1, 1,
-0.151867, 0.04895547, -0.5573578, 1, 1, 1, 1, 1,
-0.1507872, -0.1966868, -2.55292, 1, 1, 1, 1, 1,
-0.1507408, -0.7471387, -1.163221, 1, 1, 1, 1, 1,
-0.1456053, -0.300458, -3.271761, 1, 1, 1, 1, 1,
-0.1450291, 0.06502813, -0.9407657, 1, 1, 1, 1, 1,
-0.1446614, -0.9281825, -3.241573, 1, 1, 1, 1, 1,
-0.1401908, 0.5812112, 1.52339, 1, 1, 1, 1, 1,
-0.1400777, -0.5495414, -3.072008, 1, 1, 1, 1, 1,
-0.1385122, -1.036471, -3.812859, 0, 0, 1, 1, 1,
-0.1350342, 0.778648, -2.256734, 1, 0, 0, 1, 1,
-0.1302805, -0.2069088, -2.771509, 1, 0, 0, 1, 1,
-0.1289235, -0.7558177, -3.332617, 1, 0, 0, 1, 1,
-0.1282634, -1.188888, -3.143993, 1, 0, 0, 1, 1,
-0.1216358, -1.189312, -2.807281, 1, 0, 0, 1, 1,
-0.1214583, 0.2161468, -0.3097728, 0, 0, 0, 1, 1,
-0.1197455, -0.5228541, -3.684605, 0, 0, 0, 1, 1,
-0.1191237, -2.090137, -3.611575, 0, 0, 0, 1, 1,
-0.1172604, -0.5029821, -3.068115, 0, 0, 0, 1, 1,
-0.1153783, -2.935302, -2.410495, 0, 0, 0, 1, 1,
-0.111613, 0.8212645, 1.594625, 0, 0, 0, 1, 1,
-0.1007898, -0.3581636, -1.762247, 0, 0, 0, 1, 1,
-0.1001059, 0.2860747, -0.963147, 1, 1, 1, 1, 1,
-0.09724735, -0.7802851, -2.793591, 1, 1, 1, 1, 1,
-0.09607448, 0.1118922, -0.5226397, 1, 1, 1, 1, 1,
-0.09340061, -1.819212, -3.699072, 1, 1, 1, 1, 1,
-0.0915667, -0.7140216, -3.924561, 1, 1, 1, 1, 1,
-0.09096985, 1.295039, 1.006963, 1, 1, 1, 1, 1,
-0.08818624, -0.2926351, -2.443934, 1, 1, 1, 1, 1,
-0.08774351, 0.1756296, -0.7778829, 1, 1, 1, 1, 1,
-0.08676821, 0.799951, 1.708819, 1, 1, 1, 1, 1,
-0.08621005, 1.674066, -0.4096551, 1, 1, 1, 1, 1,
-0.08345006, -2.00882, -1.690311, 1, 1, 1, 1, 1,
-0.08328886, -0.3647478, -3.383555, 1, 1, 1, 1, 1,
-0.07673747, -0.6771193, -4.06401, 1, 1, 1, 1, 1,
-0.07219448, 0.1170124, 0.1467204, 1, 1, 1, 1, 1,
-0.07167279, -1.406639, -2.295618, 1, 1, 1, 1, 1,
-0.06984257, -0.6088371, -3.484115, 0, 0, 1, 1, 1,
-0.06552681, 0.8210191, 0.1235657, 1, 0, 0, 1, 1,
-0.06405605, 0.938552, 0.6086072, 1, 0, 0, 1, 1,
-0.06093059, -2.225926, -3.218267, 1, 0, 0, 1, 1,
-0.06010593, -0.1130224, -2.181967, 1, 0, 0, 1, 1,
-0.05942827, -0.4319195, -3.22148, 1, 0, 0, 1, 1,
-0.05799534, 1.279434, -0.6838122, 0, 0, 0, 1, 1,
-0.05557641, -0.2668651, -2.585091, 0, 0, 0, 1, 1,
-0.05212538, 0.1887406, 0.1631589, 0, 0, 0, 1, 1,
-0.05192812, 1.11352, 0.427844, 0, 0, 0, 1, 1,
-0.0513886, 0.765968, 0.953118, 0, 0, 0, 1, 1,
-0.05019706, 2.784258, -0.02906561, 0, 0, 0, 1, 1,
-0.04695866, -0.6443476, -2.021655, 0, 0, 0, 1, 1,
-0.04675285, -0.2115708, -4.527853, 1, 1, 1, 1, 1,
-0.04272382, 1.299037, -0.6959216, 1, 1, 1, 1, 1,
-0.04188918, 2.087687, -0.003685561, 1, 1, 1, 1, 1,
-0.03899486, -0.05951843, -2.070754, 1, 1, 1, 1, 1,
-0.03789281, -0.6811139, -4.638638, 1, 1, 1, 1, 1,
-0.03685796, -0.7010521, -3.915411, 1, 1, 1, 1, 1,
-0.03308195, -1.184129, -2.5434, 1, 1, 1, 1, 1,
-0.03247369, -0.5093341, -3.622635, 1, 1, 1, 1, 1,
-0.02813455, -1.845686, -1.674164, 1, 1, 1, 1, 1,
-0.0281127, 0.004670433, -0.4958569, 1, 1, 1, 1, 1,
-0.02776155, -0.1710207, -2.765808, 1, 1, 1, 1, 1,
-0.02496077, -0.7206479, -2.735366, 1, 1, 1, 1, 1,
-0.02354363, -0.8733213, -3.321069, 1, 1, 1, 1, 1,
-0.02197701, -1.249532, -4.456656, 1, 1, 1, 1, 1,
-0.008996516, 1.087452, -0.957225, 1, 1, 1, 1, 1,
-0.006496597, -0.1879806, -4.460913, 0, 0, 1, 1, 1,
-0.004135645, -1.107022, -5.217685, 1, 0, 0, 1, 1,
-0.003570089, -0.02551174, -3.12171, 1, 0, 0, 1, 1,
-0.0007617867, 0.2644571, -0.07996497, 1, 0, 0, 1, 1,
0.0001043945, 0.4444141, 0.7468979, 1, 0, 0, 1, 1,
0.002844449, -0.9110149, 2.938465, 1, 0, 0, 1, 1,
0.01010597, 0.1394603, -1.130016, 0, 0, 0, 1, 1,
0.01142702, 0.5048624, 0.3388852, 0, 0, 0, 1, 1,
0.02393399, -0.4595675, 4.279143, 0, 0, 0, 1, 1,
0.0255089, 0.7967785, -0.3988893, 0, 0, 0, 1, 1,
0.02602281, -0.2295321, 5.097866, 0, 0, 0, 1, 1,
0.03557321, 0.9932411, 0.8454106, 0, 0, 0, 1, 1,
0.03700647, 1.203445, -0.3213225, 0, 0, 0, 1, 1,
0.03764547, 0.004693809, -0.7775869, 1, 1, 1, 1, 1,
0.03918752, 0.3198537, 1.762145, 1, 1, 1, 1, 1,
0.04128038, -0.9774422, 1.743165, 1, 1, 1, 1, 1,
0.04184913, 0.5786407, 0.9806591, 1, 1, 1, 1, 1,
0.04735364, -0.5553613, 3.128387, 1, 1, 1, 1, 1,
0.04816755, 1.553005, 0.407933, 1, 1, 1, 1, 1,
0.05006765, 0.6447319, 0.7366827, 1, 1, 1, 1, 1,
0.05271801, -0.1084373, 3.941139, 1, 1, 1, 1, 1,
0.05482631, -0.3226036, 3.798263, 1, 1, 1, 1, 1,
0.0572759, -1.59167, 5.223091, 1, 1, 1, 1, 1,
0.0606356, -1.971812, 4.803389, 1, 1, 1, 1, 1,
0.06311294, -0.6703124, 1.369669, 1, 1, 1, 1, 1,
0.06561847, 2.133217, -0.578072, 1, 1, 1, 1, 1,
0.06565611, 1.138748, -0.02424618, 1, 1, 1, 1, 1,
0.06599548, -0.6235556, 4.033429, 1, 1, 1, 1, 1,
0.0738111, -0.1638315, 3.970418, 0, 0, 1, 1, 1,
0.07409246, 1.206942, -0.7571342, 1, 0, 0, 1, 1,
0.07527211, -0.4437609, 2.923594, 1, 0, 0, 1, 1,
0.07638889, -0.8445724, 2.274927, 1, 0, 0, 1, 1,
0.07945038, -0.050033, 1.650441, 1, 0, 0, 1, 1,
0.08160346, -1.674547, 3.916049, 1, 0, 0, 1, 1,
0.08195938, -0.2259739, 2.960074, 0, 0, 0, 1, 1,
0.08297402, 0.5078087, 0.9205474, 0, 0, 0, 1, 1,
0.08479186, 0.763944, -1.12756, 0, 0, 0, 1, 1,
0.09041782, -1.533323, 4.467639, 0, 0, 0, 1, 1,
0.0912805, 0.2588618, 2.105007, 0, 0, 0, 1, 1,
0.09150442, 0.5328788, 0.5769166, 0, 0, 0, 1, 1,
0.09510513, -0.5368198, 2.788575, 0, 0, 0, 1, 1,
0.09616228, 0.8807858, -1.773722, 1, 1, 1, 1, 1,
0.09807845, 2.093014, 0.7763891, 1, 1, 1, 1, 1,
0.101332, -1.10489, 2.840925, 1, 1, 1, 1, 1,
0.1025478, -0.4420368, 4.528258, 1, 1, 1, 1, 1,
0.1027854, 0.06295559, 2.292654, 1, 1, 1, 1, 1,
0.1028839, 0.4912317, 1.060091, 1, 1, 1, 1, 1,
0.1030714, -2.329561, 3.316011, 1, 1, 1, 1, 1,
0.1106375, -1.364903, 4.716145, 1, 1, 1, 1, 1,
0.1130845, -1.444794, 2.998415, 1, 1, 1, 1, 1,
0.1143711, -0.8639131, 3.047532, 1, 1, 1, 1, 1,
0.1146069, 0.03897969, 1.062351, 1, 1, 1, 1, 1,
0.1151179, -0.5229154, 2.571564, 1, 1, 1, 1, 1,
0.116643, -0.0176419, 2.030984, 1, 1, 1, 1, 1,
0.1182875, -0.4945113, 1.699093, 1, 1, 1, 1, 1,
0.1192024, 1.380372, 0.7002545, 1, 1, 1, 1, 1,
0.1243797, 0.5743812, -0.4201071, 0, 0, 1, 1, 1,
0.1253901, 0.1234977, -0.2863096, 1, 0, 0, 1, 1,
0.1265197, 1.007475, 1.174767, 1, 0, 0, 1, 1,
0.1307449, -0.9796184, 3.327596, 1, 0, 0, 1, 1,
0.1357294, -0.2192397, 2.847375, 1, 0, 0, 1, 1,
0.1376914, -1.500041, 1.934109, 1, 0, 0, 1, 1,
0.1377059, 2.342888, -1.495369, 0, 0, 0, 1, 1,
0.1378172, -0.5499321, 3.393317, 0, 0, 0, 1, 1,
0.1380359, -0.9217571, 2.732473, 0, 0, 0, 1, 1,
0.1382034, 1.428723, -1.178049, 0, 0, 0, 1, 1,
0.1463368, -1.044217, 3.210301, 0, 0, 0, 1, 1,
0.1469189, -0.09421049, 1.686086, 0, 0, 0, 1, 1,
0.1475738, -0.1723486, 2.459715, 0, 0, 0, 1, 1,
0.1525083, 0.2482976, 1.411233, 1, 1, 1, 1, 1,
0.1558021, 0.7797825, -1.068643, 1, 1, 1, 1, 1,
0.1620368, 0.6640047, 0.9097664, 1, 1, 1, 1, 1,
0.1648456, 0.6092203, -0.154039, 1, 1, 1, 1, 1,
0.1659935, -1.253677, 3.605222, 1, 1, 1, 1, 1,
0.1662529, -0.9844632, 1.664692, 1, 1, 1, 1, 1,
0.1666131, 1.533249, -0.350822, 1, 1, 1, 1, 1,
0.167177, -1.667742, 2.12438, 1, 1, 1, 1, 1,
0.16826, 1.909423, 0.3678665, 1, 1, 1, 1, 1,
0.1728143, 0.5227796, 0.9348997, 1, 1, 1, 1, 1,
0.1770773, -1.166847, 3.042991, 1, 1, 1, 1, 1,
0.1773388, -0.1938086, 2.118654, 1, 1, 1, 1, 1,
0.1828335, -1.478594, 3.335269, 1, 1, 1, 1, 1,
0.184257, 0.1901525, 0.09590902, 1, 1, 1, 1, 1,
0.1854876, -0.189056, 2.286694, 1, 1, 1, 1, 1,
0.1891664, 0.9125409, -0.4253982, 0, 0, 1, 1, 1,
0.1898104, -0.08201835, 2.583977, 1, 0, 0, 1, 1,
0.1910712, -2.233117, 2.253571, 1, 0, 0, 1, 1,
0.2021266, 0.08598667, -0.7068688, 1, 0, 0, 1, 1,
0.2029214, -0.2826745, 2.886094, 1, 0, 0, 1, 1,
0.2059811, 1.295825, 0.2792808, 1, 0, 0, 1, 1,
0.2073953, 0.7395481, 0.4120769, 0, 0, 0, 1, 1,
0.2079884, -0.04167725, 1.290988, 0, 0, 0, 1, 1,
0.2123687, 2.232931, 0.9532341, 0, 0, 0, 1, 1,
0.2125261, -1.100108, 4.661936, 0, 0, 0, 1, 1,
0.2193719, 0.1517521, 0.3915431, 0, 0, 0, 1, 1,
0.2317599, -0.01548951, 0.2777894, 0, 0, 0, 1, 1,
0.2317801, -0.9032161, 1.988869, 0, 0, 0, 1, 1,
0.2326306, -0.01210492, 1.251274, 1, 1, 1, 1, 1,
0.2344672, -0.6524501, 2.0893, 1, 1, 1, 1, 1,
0.2354351, 0.4537649, 1.548847, 1, 1, 1, 1, 1,
0.2354363, 0.4123591, 1.367174, 1, 1, 1, 1, 1,
0.2357945, -0.6017373, 2.050628, 1, 1, 1, 1, 1,
0.2384535, 0.6103163, -0.2013844, 1, 1, 1, 1, 1,
0.2387035, -0.6718691, 1.457224, 1, 1, 1, 1, 1,
0.2405297, -0.5582954, 2.868901, 1, 1, 1, 1, 1,
0.2415812, 1.125117, 1.551429, 1, 1, 1, 1, 1,
0.2419581, 1.320248, -0.4439175, 1, 1, 1, 1, 1,
0.2438391, 1.200282, 0.8608228, 1, 1, 1, 1, 1,
0.2460217, 0.1888889, 0.7662764, 1, 1, 1, 1, 1,
0.2463244, -1.55948, 2.466317, 1, 1, 1, 1, 1,
0.2476996, -0.6694603, 2.531486, 1, 1, 1, 1, 1,
0.2496373, 0.3611838, 1.219815, 1, 1, 1, 1, 1,
0.2504947, 2.217734, 1.057442, 0, 0, 1, 1, 1,
0.2571081, -0.8721933, 4.363959, 1, 0, 0, 1, 1,
0.2579976, -1.805993, 3.213021, 1, 0, 0, 1, 1,
0.2595748, 1.169368, 1.079628, 1, 0, 0, 1, 1,
0.2616848, -1.384782, 4.200853, 1, 0, 0, 1, 1,
0.2700594, 0.2734991, 0.7242653, 1, 0, 0, 1, 1,
0.2717205, 0.09688617, 2.085096, 0, 0, 0, 1, 1,
0.2725753, -1.28817, 1.451622, 0, 0, 0, 1, 1,
0.2752548, -1.00419, 2.321661, 0, 0, 0, 1, 1,
0.2782435, -0.05725077, 1.135107, 0, 0, 0, 1, 1,
0.2786724, 0.2122064, 0.8585663, 0, 0, 0, 1, 1,
0.2821481, -0.1103174, 2.078909, 0, 0, 0, 1, 1,
0.2852266, -0.1750208, 2.72257, 0, 0, 0, 1, 1,
0.2867569, -1.086349, 4.879915, 1, 1, 1, 1, 1,
0.2873921, 0.4462834, -0.7892348, 1, 1, 1, 1, 1,
0.2893716, 1.971237, 1.614416, 1, 1, 1, 1, 1,
0.2896945, 0.2239316, -0.178566, 1, 1, 1, 1, 1,
0.2897665, -1.141357, 2.819399, 1, 1, 1, 1, 1,
0.2898376, -0.9807538, 3.09719, 1, 1, 1, 1, 1,
0.2939861, 0.4670138, 1.278664, 1, 1, 1, 1, 1,
0.2958377, 0.4324202, -0.2430069, 1, 1, 1, 1, 1,
0.2973657, -0.2783791, 2.419975, 1, 1, 1, 1, 1,
0.2976067, 0.2944925, 1.807405, 1, 1, 1, 1, 1,
0.2995355, 1.462593, 0.7054045, 1, 1, 1, 1, 1,
0.3016376, -0.7499396, 4.579588, 1, 1, 1, 1, 1,
0.3038778, 0.1832227, 1.398724, 1, 1, 1, 1, 1,
0.3052506, 0.816789, -0.9383251, 1, 1, 1, 1, 1,
0.3059425, 0.7806874, 2.133935, 1, 1, 1, 1, 1,
0.307463, 1.088454, -0.6076937, 0, 0, 1, 1, 1,
0.309476, 1.123642, 1.682865, 1, 0, 0, 1, 1,
0.3100482, 0.7326444, -0.6140322, 1, 0, 0, 1, 1,
0.3109833, 0.1819654, 1.093501, 1, 0, 0, 1, 1,
0.3116829, 0.579537, -0.2821788, 1, 0, 0, 1, 1,
0.314012, -0.6351269, 3.837743, 1, 0, 0, 1, 1,
0.3154665, 0.7739211, 0.1769756, 0, 0, 0, 1, 1,
0.3212227, 2.203003e-05, 1.417066, 0, 0, 0, 1, 1,
0.3227449, -0.06521479, -0.1328774, 0, 0, 0, 1, 1,
0.3230309, 0.291596, 0.4757099, 0, 0, 0, 1, 1,
0.3264605, -1.40043, 2.780329, 0, 0, 0, 1, 1,
0.3293176, -0.09242218, 0.3439108, 0, 0, 0, 1, 1,
0.3304676, 0.1912187, 1.217776, 0, 0, 0, 1, 1,
0.3366087, -0.3915091, 2.829154, 1, 1, 1, 1, 1,
0.3396311, -0.6962718, 1.652539, 1, 1, 1, 1, 1,
0.3411961, 0.6668545, 0.3786822, 1, 1, 1, 1, 1,
0.3443643, 0.1554237, 0.3841977, 1, 1, 1, 1, 1,
0.3453898, -1.231013, 4.577563, 1, 1, 1, 1, 1,
0.3454549, 0.9024004, -1.199598, 1, 1, 1, 1, 1,
0.3457139, 0.1933053, 2.050406, 1, 1, 1, 1, 1,
0.3477525, -0.1500771, 1.468981, 1, 1, 1, 1, 1,
0.3504226, 1.859096, -1.870888, 1, 1, 1, 1, 1,
0.3523575, -0.1526096, 1.24733, 1, 1, 1, 1, 1,
0.3524969, -0.5039701, 4.47844, 1, 1, 1, 1, 1,
0.3536005, -0.2041287, 0.8892107, 1, 1, 1, 1, 1,
0.3542481, -0.4784245, 2.371213, 1, 1, 1, 1, 1,
0.359064, 0.8346345, 1.79911, 1, 1, 1, 1, 1,
0.3597328, -0.3668377, 2.062829, 1, 1, 1, 1, 1,
0.3619556, 1.563176, 0.5913984, 0, 0, 1, 1, 1,
0.362448, -0.37472, 3.603827, 1, 0, 0, 1, 1,
0.3639721, -0.03901517, 1.32638, 1, 0, 0, 1, 1,
0.3680589, 0.609219, 0.4359804, 1, 0, 0, 1, 1,
0.3685443, -1.006086, 2.44148, 1, 0, 0, 1, 1,
0.3698973, 0.2105118, 0.4032401, 1, 0, 0, 1, 1,
0.3739143, 1.471904, -0.7860443, 0, 0, 0, 1, 1,
0.374978, -1.652795, 3.356401, 0, 0, 0, 1, 1,
0.3767635, -0.675732, 3.555366, 0, 0, 0, 1, 1,
0.3783739, 0.04260302, 0.4668979, 0, 0, 0, 1, 1,
0.3832175, 1.392869, 0.1754455, 0, 0, 0, 1, 1,
0.3840299, -0.4243608, 0.8261602, 0, 0, 0, 1, 1,
0.3840466, -0.8537771, 4.283147, 0, 0, 0, 1, 1,
0.3857162, 0.6926572, -0.2030017, 1, 1, 1, 1, 1,
0.3880391, -0.7839404, 4.984955, 1, 1, 1, 1, 1,
0.3903532, 0.573671, -0.4153603, 1, 1, 1, 1, 1,
0.391362, -1.059622, 2.718074, 1, 1, 1, 1, 1,
0.3955508, 2.784658, 0.3179098, 1, 1, 1, 1, 1,
0.3981621, -1.260159, 0.9999308, 1, 1, 1, 1, 1,
0.4050548, 0.9618586, 0.2358857, 1, 1, 1, 1, 1,
0.4127274, -1.931427, 3.218772, 1, 1, 1, 1, 1,
0.4137281, -0.9366708, 0.9104329, 1, 1, 1, 1, 1,
0.4172543, -0.2349772, 2.252492, 1, 1, 1, 1, 1,
0.4214824, 1.065522, 1.089298, 1, 1, 1, 1, 1,
0.4248806, 0.3514091, -0.1377921, 1, 1, 1, 1, 1,
0.4283527, 0.9483858, 1.517677, 1, 1, 1, 1, 1,
0.4312716, -0.6621079, 3.383611, 1, 1, 1, 1, 1,
0.4354263, -0.5049551, 3.853536, 1, 1, 1, 1, 1,
0.435901, 1.951821, -2.645468, 0, 0, 1, 1, 1,
0.4396898, -1.470618, 1.910283, 1, 0, 0, 1, 1,
0.4412702, -0.2851086, 3.499187, 1, 0, 0, 1, 1,
0.4474939, -0.2112854, 3.815451, 1, 0, 0, 1, 1,
0.4479416, -0.5998668, 1.332574, 1, 0, 0, 1, 1,
0.4494357, -0.6878182, 2.715358, 1, 0, 0, 1, 1,
0.4497658, -1.303144, 2.753219, 0, 0, 0, 1, 1,
0.4508892, 1.661955, -0.5635096, 0, 0, 0, 1, 1,
0.4560638, 0.6015763, 2.933747, 0, 0, 0, 1, 1,
0.4611374, -0.6058361, 0.8548798, 0, 0, 0, 1, 1,
0.4666832, 0.2507949, 0.8634518, 0, 0, 0, 1, 1,
0.4704887, 0.6367399, -0.5130484, 0, 0, 0, 1, 1,
0.4766017, 0.4446357, -0.526175, 0, 0, 0, 1, 1,
0.4772782, -1.492665, 2.789034, 1, 1, 1, 1, 1,
0.4784891, -0.1648423, 2.098092, 1, 1, 1, 1, 1,
0.4824636, 0.3647668, 1.069686, 1, 1, 1, 1, 1,
0.4825004, 0.3453399, 0.008225355, 1, 1, 1, 1, 1,
0.4865207, 1.258654, -0.6589174, 1, 1, 1, 1, 1,
0.4932988, 0.8977395, 0.2331408, 1, 1, 1, 1, 1,
0.4948789, 1.09174, -0.1050309, 1, 1, 1, 1, 1,
0.4964502, -1.844587, 4.035773, 1, 1, 1, 1, 1,
0.5050628, -0.2663483, 3.003045, 1, 1, 1, 1, 1,
0.5083042, 0.2739804, 0.7043856, 1, 1, 1, 1, 1,
0.5087453, 0.3963165, 0.8863086, 1, 1, 1, 1, 1,
0.5088001, -0.495994, 3.619031, 1, 1, 1, 1, 1,
0.5109015, 0.2661664, 0.0002469878, 1, 1, 1, 1, 1,
0.5113938, 1.133452, 2.879279, 1, 1, 1, 1, 1,
0.5118914, 0.1741948, -1.645729, 1, 1, 1, 1, 1,
0.5235179, 0.4446163, 0.5124984, 0, 0, 1, 1, 1,
0.528335, -1.660109, 1.764987, 1, 0, 0, 1, 1,
0.5304216, -1.013518, 1.602292, 1, 0, 0, 1, 1,
0.5407158, 0.1594709, 2.064993, 1, 0, 0, 1, 1,
0.5460299, 0.2838674, 1.595235, 1, 0, 0, 1, 1,
0.5480251, -0.8845096, 1.496536, 1, 0, 0, 1, 1,
0.5542706, -0.7361935, 2.286084, 0, 0, 0, 1, 1,
0.5547816, -0.7154776, 3.06895, 0, 0, 0, 1, 1,
0.5595351, -0.263052, 1.787561, 0, 0, 0, 1, 1,
0.5612327, -1.003627, 1.980194, 0, 0, 0, 1, 1,
0.5626066, -0.265022, 2.929714, 0, 0, 0, 1, 1,
0.5662349, 0.7483573, 1.136122, 0, 0, 0, 1, 1,
0.5679483, 0.8608561, 0.9734361, 0, 0, 0, 1, 1,
0.5768092, -0.6475659, 2.133934, 1, 1, 1, 1, 1,
0.581889, 2.286312, -0.8342824, 1, 1, 1, 1, 1,
0.5844085, 0.2245197, 0.2354367, 1, 1, 1, 1, 1,
0.5860877, -1.016929, 2.165508, 1, 1, 1, 1, 1,
0.5943643, 0.7460552, -0.9027503, 1, 1, 1, 1, 1,
0.6089457, 0.4519669, 0.5237697, 1, 1, 1, 1, 1,
0.6108994, -0.4592327, 1.277572, 1, 1, 1, 1, 1,
0.6197277, 2.014671, 1.040495, 1, 1, 1, 1, 1,
0.6259068, -0.0566924, 1.503664, 1, 1, 1, 1, 1,
0.6301087, -3.388605, 2.852198, 1, 1, 1, 1, 1,
0.6320071, 1.401602, 0.3739211, 1, 1, 1, 1, 1,
0.6459595, 0.4159192, 0.2407945, 1, 1, 1, 1, 1,
0.6471532, -1.244065, 3.772478, 1, 1, 1, 1, 1,
0.6539387, 1.092021, 1.273769, 1, 1, 1, 1, 1,
0.6554908, 0.2684104, -0.9417424, 1, 1, 1, 1, 1,
0.6571324, -0.8155941, 2.2417, 0, 0, 1, 1, 1,
0.6579691, -0.06205464, 1.941274, 1, 0, 0, 1, 1,
0.6619186, -0.8452019, 3.219147, 1, 0, 0, 1, 1,
0.6652946, -0.768343, 4.382101, 1, 0, 0, 1, 1,
0.6669221, 0.9553803, 0.8387985, 1, 0, 0, 1, 1,
0.6671127, -0.1465699, 2.112611, 1, 0, 0, 1, 1,
0.6671144, 1.368668, 0.9823858, 0, 0, 0, 1, 1,
0.6701302, -1.470549, 3.100382, 0, 0, 0, 1, 1,
0.6719632, -0.6880751, 2.66475, 0, 0, 0, 1, 1,
0.6743925, 0.4143047, 1.366828, 0, 0, 0, 1, 1,
0.6762648, -0.9398887, 2.238773, 0, 0, 0, 1, 1,
0.6829395, -0.8372746, 3.390207, 0, 0, 0, 1, 1,
0.6833477, 0.6354674, 2.676039, 0, 0, 0, 1, 1,
0.6864306, 0.521532, 1.30382, 1, 1, 1, 1, 1,
0.6882591, 1.923954, -0.3336405, 1, 1, 1, 1, 1,
0.6915393, -1.006664, 0.6462634, 1, 1, 1, 1, 1,
0.6939901, 0.244609, 0.618347, 1, 1, 1, 1, 1,
0.698617, -0.5268697, 2.602051, 1, 1, 1, 1, 1,
0.7038715, -0.2936181, 0.3012888, 1, 1, 1, 1, 1,
0.7080323, 0.6832666, 1.031492, 1, 1, 1, 1, 1,
0.7137629, -1.088021, 2.081686, 1, 1, 1, 1, 1,
0.7142224, -1.035836, 2.366166, 1, 1, 1, 1, 1,
0.7209569, -2.411517, 1.996813, 1, 1, 1, 1, 1,
0.7241298, -1.234782, 2.193057, 1, 1, 1, 1, 1,
0.7268371, -0.4846447, 2.334584, 1, 1, 1, 1, 1,
0.7300952, -1.047782, 3.030735, 1, 1, 1, 1, 1,
0.7389481, -0.2885101, 3.746753, 1, 1, 1, 1, 1,
0.7403783, -1.365726, 3.25225, 1, 1, 1, 1, 1,
0.7476337, -0.5532843, 2.605932, 0, 0, 1, 1, 1,
0.7497813, 0.06726309, 1.167029, 1, 0, 0, 1, 1,
0.7513018, -0.2804451, 2.250675, 1, 0, 0, 1, 1,
0.7611448, -0.6520025, 1.734436, 1, 0, 0, 1, 1,
0.7631375, 1.420953, 1.652498, 1, 0, 0, 1, 1,
0.7703915, 1.731982, -0.4688407, 1, 0, 0, 1, 1,
0.7707486, -0.6574757, 1.622571, 0, 0, 0, 1, 1,
0.7755646, 2.238223, 0.2429195, 0, 0, 0, 1, 1,
0.7783741, 1.376711, 0.2016621, 0, 0, 0, 1, 1,
0.7816983, 0.09486881, 1.656306, 0, 0, 0, 1, 1,
0.7828125, -0.7417945, 0.7788888, 0, 0, 0, 1, 1,
0.7897127, -1.200475, 1.829047, 0, 0, 0, 1, 1,
0.7925692, 1.266053, 0.6411663, 0, 0, 0, 1, 1,
0.7930558, 0.859901, 1.612348, 1, 1, 1, 1, 1,
0.796221, -0.4798098, 2.104445, 1, 1, 1, 1, 1,
0.7975106, 0.3793411, 0.8917466, 1, 1, 1, 1, 1,
0.8017203, 0.8268254, 1.137791, 1, 1, 1, 1, 1,
0.8088123, 0.2488061, 2.435896, 1, 1, 1, 1, 1,
0.8140847, -0.7025403, 2.115465, 1, 1, 1, 1, 1,
0.8167455, -0.2438111, 3.23594, 1, 1, 1, 1, 1,
0.8214992, 0.6926967, 0.4706772, 1, 1, 1, 1, 1,
0.834278, 0.5571821, 2.170448, 1, 1, 1, 1, 1,
0.836127, 0.6216819, 0.4658648, 1, 1, 1, 1, 1,
0.8413562, -0.5435829, 3.1556, 1, 1, 1, 1, 1,
0.8432224, -0.5116132, 2.13759, 1, 1, 1, 1, 1,
0.8455055, 0.1952993, 2.070374, 1, 1, 1, 1, 1,
0.8482034, 0.6616068, 0.3491702, 1, 1, 1, 1, 1,
0.8507353, 1.663573, 2.959519, 1, 1, 1, 1, 1,
0.8685565, 0.4287786, 1.428755, 0, 0, 1, 1, 1,
0.8781134, 1.589923, 1.108842, 1, 0, 0, 1, 1,
0.8790871, -0.835384, 0.8078195, 1, 0, 0, 1, 1,
0.8791369, -0.1654619, 2.117174, 1, 0, 0, 1, 1,
0.8835596, -0.6947407, 1.099042, 1, 0, 0, 1, 1,
0.8836373, -0.9656336, 4.71675, 1, 0, 0, 1, 1,
0.8967245, 2.625748, -1.515718, 0, 0, 0, 1, 1,
0.9075674, 0.4098494, 0.251025, 0, 0, 0, 1, 1,
0.9088869, -0.4975683, 1.625406, 0, 0, 0, 1, 1,
0.9117781, -0.4605655, 1.464184, 0, 0, 0, 1, 1,
0.912448, 0.9416676, 1.436702, 0, 0, 0, 1, 1,
0.9136818, -0.3129325, 1.815962, 0, 0, 0, 1, 1,
0.9202819, 0.160366, 0.362394, 0, 0, 0, 1, 1,
0.9357947, 0.5260071, 1.466851, 1, 1, 1, 1, 1,
0.9366387, -0.6211814, 1.878044, 1, 1, 1, 1, 1,
0.9403386, 1.430779, 2.206618, 1, 1, 1, 1, 1,
0.9428268, 0.7658654, 0.8469003, 1, 1, 1, 1, 1,
0.9637755, 0.004556611, 2.707077, 1, 1, 1, 1, 1,
0.9654034, -0.1922061, 3.944251, 1, 1, 1, 1, 1,
0.9660249, -0.5437419, 2.119269, 1, 1, 1, 1, 1,
0.9773003, 1.010861, 0.8373944, 1, 1, 1, 1, 1,
0.977722, -1.146342, 1.258787, 1, 1, 1, 1, 1,
0.9825327, -1.184706, 2.7288, 1, 1, 1, 1, 1,
0.9842821, 0.3989231, -0.8362795, 1, 1, 1, 1, 1,
0.9846056, -0.6469349, 2.348714, 1, 1, 1, 1, 1,
0.9867552, 0.05954935, 1.016306, 1, 1, 1, 1, 1,
0.988637, 0.5948451, 2.251954, 1, 1, 1, 1, 1,
0.9909727, -0.6563893, 0.5372165, 1, 1, 1, 1, 1,
0.9912807, 0.1486567, 1.518615, 0, 0, 1, 1, 1,
0.9921481, 0.4841683, 0.9747339, 1, 0, 0, 1, 1,
0.9970949, -1.0094, 1.287676, 1, 0, 0, 1, 1,
1.001043, 0.575439, 2.321381, 1, 0, 0, 1, 1,
1.00532, -0.1843481, -0.06046624, 1, 0, 0, 1, 1,
1.016047, 1.019162, 0.3717459, 1, 0, 0, 1, 1,
1.021486, -0.654036, 1.590683, 0, 0, 0, 1, 1,
1.02267, -0.7849235, 3.478251, 0, 0, 0, 1, 1,
1.030759, 0.8316543, 2.008241, 0, 0, 0, 1, 1,
1.035704, 0.4149626, 0.1679998, 0, 0, 0, 1, 1,
1.036241, 0.5218455, 1.739605, 0, 0, 0, 1, 1,
1.041069, 1.182749, 0.4689619, 0, 0, 0, 1, 1,
1.044635, 1.621907, 1.189662, 0, 0, 0, 1, 1,
1.052627, 1.748587, 1.472078, 1, 1, 1, 1, 1,
1.053409, 1.492827, 0.8284199, 1, 1, 1, 1, 1,
1.053518, -0.2514543, 0.168478, 1, 1, 1, 1, 1,
1.053571, -0.1499091, 0.9760049, 1, 1, 1, 1, 1,
1.059675, 0.9383094, 1.68704, 1, 1, 1, 1, 1,
1.063903, -0.4531501, 2.154696, 1, 1, 1, 1, 1,
1.081597, -1.375807, 2.506198, 1, 1, 1, 1, 1,
1.086707, 0.5816382, 1.785371, 1, 1, 1, 1, 1,
1.09235, 1.7036, 0.5933889, 1, 1, 1, 1, 1,
1.101003, 0.4896874, 1.41851, 1, 1, 1, 1, 1,
1.101091, 1.46177, 1.120919, 1, 1, 1, 1, 1,
1.106036, 1.19031, 0.4632143, 1, 1, 1, 1, 1,
1.107231, -1.449325, 3.591446, 1, 1, 1, 1, 1,
1.108582, -0.7570153, 1.508919, 1, 1, 1, 1, 1,
1.111527, -0.6328125, 0.3361668, 1, 1, 1, 1, 1,
1.114151, -1.506852, 2.685312, 0, 0, 1, 1, 1,
1.116257, 1.523679, 2.64781, 1, 0, 0, 1, 1,
1.11903, 0.04033517, 2.097785, 1, 0, 0, 1, 1,
1.121638, -1.117894, 3.101388, 1, 0, 0, 1, 1,
1.124238, -0.1983507, 2.292155, 1, 0, 0, 1, 1,
1.124984, 0.3180279, 1.819314, 1, 0, 0, 1, 1,
1.125972, -0.2092078, 2.082276, 0, 0, 0, 1, 1,
1.127398, -1.214742, 3.048285, 0, 0, 0, 1, 1,
1.137091, -0.08827714, 0.6107963, 0, 0, 0, 1, 1,
1.137779, 0.7161956, 0.7131075, 0, 0, 0, 1, 1,
1.141797, 0.8340713, 2.692171, 0, 0, 0, 1, 1,
1.142563, -0.584524, -0.494121, 0, 0, 0, 1, 1,
1.153728, -0.2036516, 1.727498, 0, 0, 0, 1, 1,
1.162675, 0.2710374, 2.191589, 1, 1, 1, 1, 1,
1.17003, 0.02735601, 1.291935, 1, 1, 1, 1, 1,
1.170219, 1.250946, 1.915229, 1, 1, 1, 1, 1,
1.184528, -0.3357224, 1.230786, 1, 1, 1, 1, 1,
1.190946, 0.1443441, 2.220609, 1, 1, 1, 1, 1,
1.195761, -0.7403375, 2.762955, 1, 1, 1, 1, 1,
1.202652, 0.3306993, 2.407409, 1, 1, 1, 1, 1,
1.203388, 0.9899294, 0.7719889, 1, 1, 1, 1, 1,
1.205329, 0.7193451, 1.678051, 1, 1, 1, 1, 1,
1.20939, 1.69179, 0.8480237, 1, 1, 1, 1, 1,
1.211672, -1.167394, 2.772528, 1, 1, 1, 1, 1,
1.215362, -0.08208911, 2.592523, 1, 1, 1, 1, 1,
1.216062, -0.1216949, 2.804802, 1, 1, 1, 1, 1,
1.221165, -0.002132528, -0.1468267, 1, 1, 1, 1, 1,
1.222646, -0.5586259, 1.648952, 1, 1, 1, 1, 1,
1.232409, 0.5479226, -1.083659, 0, 0, 1, 1, 1,
1.236138, -1.01, 2.611277, 1, 0, 0, 1, 1,
1.236969, 0.06790653, -0.2874822, 1, 0, 0, 1, 1,
1.2385, -0.7013503, 2.758418, 1, 0, 0, 1, 1,
1.241384, 1.018763, 1.196059, 1, 0, 0, 1, 1,
1.243135, 1.319334, 1.997334, 1, 0, 0, 1, 1,
1.244022, 0.4612378, 0.5274303, 0, 0, 0, 1, 1,
1.24803, -0.4974624, 2.752191, 0, 0, 0, 1, 1,
1.248102, -0.2687725, 0.053548, 0, 0, 0, 1, 1,
1.275478, -0.09085716, 1.879747, 0, 0, 0, 1, 1,
1.27644, 1.708763, 0.296501, 0, 0, 0, 1, 1,
1.286957, 0.4691108, 0.8780828, 0, 0, 0, 1, 1,
1.289478, -0.5674616, 2.0509, 0, 0, 0, 1, 1,
1.31809, -0.7237492, 2.342685, 1, 1, 1, 1, 1,
1.320279, -0.1594681, 1.616156, 1, 1, 1, 1, 1,
1.328537, -0.1998952, 3.282655, 1, 1, 1, 1, 1,
1.330542, 0.8273401, 0.6312648, 1, 1, 1, 1, 1,
1.356973, -0.9440314, 1.813483, 1, 1, 1, 1, 1,
1.364776, 0.1805947, 0.9076746, 1, 1, 1, 1, 1,
1.373165, -0.3425064, 0.06021787, 1, 1, 1, 1, 1,
1.376126, 0.01901617, 1.394316, 1, 1, 1, 1, 1,
1.377452, 1.369191, 1.277328, 1, 1, 1, 1, 1,
1.3777, 0.1716161, 0.7853859, 1, 1, 1, 1, 1,
1.379451, 1.113864, -0.1423963, 1, 1, 1, 1, 1,
1.380286, 0.7253159, 1.196501, 1, 1, 1, 1, 1,
1.382887, -2.631538, 1.139705, 1, 1, 1, 1, 1,
1.385055, 0.05244799, 0.6719124, 1, 1, 1, 1, 1,
1.398728, -0.5024415, 2.174274, 1, 1, 1, 1, 1,
1.402207, 0.8302898, 1.39209, 0, 0, 1, 1, 1,
1.405058, -0.1100098, 2.681, 1, 0, 0, 1, 1,
1.410752, 2.504209, 0.2673602, 1, 0, 0, 1, 1,
1.42737, -1.838666, 2.111327, 1, 0, 0, 1, 1,
1.466018, -0.6811069, 5.257467, 1, 0, 0, 1, 1,
1.467277, -0.8294933, 1.525816, 1, 0, 0, 1, 1,
1.475948, 2.614036, 1.523038, 0, 0, 0, 1, 1,
1.482431, -1.095343, 2.903238, 0, 0, 0, 1, 1,
1.485355, -0.1972351, 2.226632, 0, 0, 0, 1, 1,
1.487734, 1.434633, -0.1505014, 0, 0, 0, 1, 1,
1.491156, -1.550249, 1.56902, 0, 0, 0, 1, 1,
1.501933, -0.5112071, 1.483271, 0, 0, 0, 1, 1,
1.503602, -0.6043862, -0.1500657, 0, 0, 0, 1, 1,
1.508227, -0.6764314, 0.9059917, 1, 1, 1, 1, 1,
1.523571, -0.705705, 4.30658, 1, 1, 1, 1, 1,
1.531148, -0.5765467, 3.045228, 1, 1, 1, 1, 1,
1.553666, -1.376887, 1.206009, 1, 1, 1, 1, 1,
1.565292, -0.3958057, 1.689778, 1, 1, 1, 1, 1,
1.571229, 0.8319206, 2.36182, 1, 1, 1, 1, 1,
1.573871, 1.552275, -0.3123763, 1, 1, 1, 1, 1,
1.576596, -0.2558332, 2.442047, 1, 1, 1, 1, 1,
1.597986, 0.09056502, 0.784264, 1, 1, 1, 1, 1,
1.616825, -1.233388, 3.658335, 1, 1, 1, 1, 1,
1.623535, 1.47596, -0.7760857, 1, 1, 1, 1, 1,
1.627011, -1.02363, 1.951983, 1, 1, 1, 1, 1,
1.629413, 0.135087, 1.295443, 1, 1, 1, 1, 1,
1.632665, -1.725862, 3.2322, 1, 1, 1, 1, 1,
1.635873, 1.537744, 0.9658975, 1, 1, 1, 1, 1,
1.64772, 0.7192906, 1.540114, 0, 0, 1, 1, 1,
1.650443, -0.3103281, 2.429834, 1, 0, 0, 1, 1,
1.656291, -1.695425, 2.403959, 1, 0, 0, 1, 1,
1.659294, 2.793784, 0.6201695, 1, 0, 0, 1, 1,
1.66373, -0.9636716, 0.6618316, 1, 0, 0, 1, 1,
1.665072, 0.434203, -1.267184, 1, 0, 0, 1, 1,
1.666346, 0.1003964, -0.5333063, 0, 0, 0, 1, 1,
1.672439, -2.643382, 2.369833, 0, 0, 0, 1, 1,
1.689229, -0.453898, 2.575974, 0, 0, 0, 1, 1,
1.694304, -1.499749, 2.785533, 0, 0, 0, 1, 1,
1.698794, -0.2850152, 0.4881996, 0, 0, 0, 1, 1,
1.708837, -0.1628229, 2.599456, 0, 0, 0, 1, 1,
1.728359, 0.5743236, 1.203836, 0, 0, 0, 1, 1,
1.730737, -0.2452554, 1.591603, 1, 1, 1, 1, 1,
1.759197, -0.2588626, 3.683721, 1, 1, 1, 1, 1,
1.763398, 0.475491, 1.457547, 1, 1, 1, 1, 1,
1.774691, -0.4106079, 0.869019, 1, 1, 1, 1, 1,
1.779289, -0.02368098, 1.635451, 1, 1, 1, 1, 1,
1.806952, -0.1191446, 0.8644351, 1, 1, 1, 1, 1,
1.832713, -0.6633993, 1.480594, 1, 1, 1, 1, 1,
1.876997, 0.873946, 2.110817, 1, 1, 1, 1, 1,
1.912202, -0.5448269, 2.995072, 1, 1, 1, 1, 1,
1.91341, 0.4195913, 1.527425, 1, 1, 1, 1, 1,
1.930471, 0.6953479, 0.8262166, 1, 1, 1, 1, 1,
1.932691, -0.09410606, 1.891338, 1, 1, 1, 1, 1,
1.947616, 2.04109, 0.5749676, 1, 1, 1, 1, 1,
1.947625, -1.288203, 2.858599, 1, 1, 1, 1, 1,
1.965276, 0.2099102, 2.327675, 1, 1, 1, 1, 1,
2.000511, 1.154651, -0.4362275, 0, 0, 1, 1, 1,
2.004691, -1.518436, 1.243887, 1, 0, 0, 1, 1,
2.030683, -0.09485633, 0.3666352, 1, 0, 0, 1, 1,
2.112716, 0.7239556, 0.07473604, 1, 0, 0, 1, 1,
2.163557, -1.136839, 0.1900329, 1, 0, 0, 1, 1,
2.166424, -0.5246401, 3.186219, 1, 0, 0, 1, 1,
2.202593, 1.519443, 1.112007, 0, 0, 0, 1, 1,
2.270945, 0.4007291, 1.05159, 0, 0, 0, 1, 1,
2.272465, 1.497867, 0.9787042, 0, 0, 0, 1, 1,
2.287575, -0.7803746, 0.3096806, 0, 0, 0, 1, 1,
2.287697, 2.348262, 0.8745158, 0, 0, 0, 1, 1,
2.289991, 0.4492042, 1.292738, 0, 0, 0, 1, 1,
2.347206, 0.1905778, 0.7890199, 0, 0, 0, 1, 1,
2.447849, 0.1351654, 2.352919, 1, 1, 1, 1, 1,
2.487477, 0.05746466, -0.3052521, 1, 1, 1, 1, 1,
2.554714, -0.6463747, 0.7461475, 1, 1, 1, 1, 1,
2.562898, -0.7817759, 0.944606, 1, 1, 1, 1, 1,
2.748336, -1.37179, 1.554983, 1, 1, 1, 1, 1,
2.752076, 2.328345, 0.6999686, 1, 1, 1, 1, 1,
3.026226, -0.9265546, 1.9094, 1, 1, 1, 1, 1
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
var radius = 9.886267;
var distance = 34.72509;
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
mvMatrix.translate( 0.3171442, 0.149262, 0.3711481 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.72509);
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
