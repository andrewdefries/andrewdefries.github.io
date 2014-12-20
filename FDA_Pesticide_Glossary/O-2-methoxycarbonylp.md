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
-2.960876, 1.555562, -1.340478, 1, 0, 0, 1,
-2.699614, -0.2823285, -2.113581, 1, 0.007843138, 0, 1,
-2.606439, -0.2439075, -2.259782, 1, 0.01176471, 0, 1,
-2.545929, -1.779008, -2.608024, 1, 0.01960784, 0, 1,
-2.542389, -0.3764486, -3.503507, 1, 0.02352941, 0, 1,
-2.524738, 0.130377, -1.916013, 1, 0.03137255, 0, 1,
-2.506266, -0.6374229, -1.405828, 1, 0.03529412, 0, 1,
-2.503234, -0.5902368, -1.56915, 1, 0.04313726, 0, 1,
-2.481566, -0.08728202, -0.9558094, 1, 0.04705882, 0, 1,
-2.476902, 0.9362075, -2.336513, 1, 0.05490196, 0, 1,
-2.397866, 0.1874457, -2.868177, 1, 0.05882353, 0, 1,
-2.384789, -0.2199048, -1.948689, 1, 0.06666667, 0, 1,
-2.359026, 0.5822347, -1.510847, 1, 0.07058824, 0, 1,
-2.353679, 0.4857185, -0.7739948, 1, 0.07843138, 0, 1,
-2.33249, -0.3436548, -0.8305596, 1, 0.08235294, 0, 1,
-2.284364, 0.8350131, -0.5649704, 1, 0.09019608, 0, 1,
-2.245024, 0.4695337, -2.908746, 1, 0.09411765, 0, 1,
-2.214758, -0.9411893, -1.866107, 1, 0.1019608, 0, 1,
-2.203206, -1.754053, 1.382871, 1, 0.1098039, 0, 1,
-2.19674, -0.1547198, -2.780333, 1, 0.1137255, 0, 1,
-2.091258, -1.967292, -1.252795, 1, 0.1215686, 0, 1,
-2.053465, -1.65181, -2.169348, 1, 0.1254902, 0, 1,
-2.024745, -0.3513976, -0.7195381, 1, 0.1333333, 0, 1,
-2.011091, 0.05586871, -2.231323, 1, 0.1372549, 0, 1,
-2.01065, -1.513402, -3.530118, 1, 0.145098, 0, 1,
-2.006466, 0.5666805, -1.467981, 1, 0.1490196, 0, 1,
-1.986536, 0.09741544, -1.739367, 1, 0.1568628, 0, 1,
-1.970659, 0.2763787, -1.667622, 1, 0.1607843, 0, 1,
-1.960174, 0.3990383, -2.6072, 1, 0.1686275, 0, 1,
-1.955719, -0.2271166, -1.852713, 1, 0.172549, 0, 1,
-1.943323, 0.2142578, -1.975238, 1, 0.1803922, 0, 1,
-1.942183, -1.962525, -3.198266, 1, 0.1843137, 0, 1,
-1.883176, -0.3339792, -1.831885, 1, 0.1921569, 0, 1,
-1.869584, 0.4057781, -1.837408, 1, 0.1960784, 0, 1,
-1.860484, 1.728249, -0.7624598, 1, 0.2039216, 0, 1,
-1.858701, 0.5753791, -0.9046918, 1, 0.2117647, 0, 1,
-1.858366, 0.3933521, -2.916563, 1, 0.2156863, 0, 1,
-1.844445, 0.0539774, -2.181772, 1, 0.2235294, 0, 1,
-1.829401, 0.1382919, -2.941839, 1, 0.227451, 0, 1,
-1.821026, 0.9874073, -2.829871, 1, 0.2352941, 0, 1,
-1.803302, 0.2076204, -1.051913, 1, 0.2392157, 0, 1,
-1.80049, -1.168406, -1.90052, 1, 0.2470588, 0, 1,
-1.75529, -2.328076, -4.716037, 1, 0.2509804, 0, 1,
-1.752511, -0.9552534, -1.82697, 1, 0.2588235, 0, 1,
-1.750811, 1.166986, -1.048877, 1, 0.2627451, 0, 1,
-1.726278, 0.2811253, -1.676432, 1, 0.2705882, 0, 1,
-1.711161, 0.0169388, -3.377838, 1, 0.2745098, 0, 1,
-1.686353, 1.822815, 1.291347, 1, 0.282353, 0, 1,
-1.67586, 0.817361, -1.731346, 1, 0.2862745, 0, 1,
-1.67507, -0.4174425, -0.3966781, 1, 0.2941177, 0, 1,
-1.671308, -0.4150376, -1.450066, 1, 0.3019608, 0, 1,
-1.662483, -1.379584, -1.993478, 1, 0.3058824, 0, 1,
-1.659237, 1.541116, -1.823143, 1, 0.3137255, 0, 1,
-1.65748, 1.601689, 0.6964262, 1, 0.3176471, 0, 1,
-1.657094, 0.6736526, -2.052524, 1, 0.3254902, 0, 1,
-1.652402, 0.8263887, -1.092395, 1, 0.3294118, 0, 1,
-1.650331, -1.452433, -2.287112, 1, 0.3372549, 0, 1,
-1.647123, 1.219035, -0.3102739, 1, 0.3411765, 0, 1,
-1.645396, 0.7848697, -1.60189, 1, 0.3490196, 0, 1,
-1.637373, -0.2587023, -1.345942, 1, 0.3529412, 0, 1,
-1.633302, -0.4370423, -2.180245, 1, 0.3607843, 0, 1,
-1.605782, 0.4217887, -2.086827, 1, 0.3647059, 0, 1,
-1.594491, -0.4409702, -2.807492, 1, 0.372549, 0, 1,
-1.583487, 0.1160255, 0.1850843, 1, 0.3764706, 0, 1,
-1.578753, 0.4709609, -1.394216, 1, 0.3843137, 0, 1,
-1.56615, 0.5621615, -1.732539, 1, 0.3882353, 0, 1,
-1.551699, 0.5231117, -0.4060363, 1, 0.3960784, 0, 1,
-1.531836, 0.6998547, -0.07100142, 1, 0.4039216, 0, 1,
-1.525194, -1.313268, -4.649222, 1, 0.4078431, 0, 1,
-1.512875, 1.446338, -1.240504, 1, 0.4156863, 0, 1,
-1.505288, -0.1301943, -1.039211, 1, 0.4196078, 0, 1,
-1.502997, -0.2459529, -0.1661568, 1, 0.427451, 0, 1,
-1.492614, -0.3093629, -2.806968, 1, 0.4313726, 0, 1,
-1.489674, -0.1665495, -1.615909, 1, 0.4392157, 0, 1,
-1.480108, 0.3584631, -1.277049, 1, 0.4431373, 0, 1,
-1.445144, -0.118171, -2.021814, 1, 0.4509804, 0, 1,
-1.442549, -0.4414284, -1.060368, 1, 0.454902, 0, 1,
-1.440093, -0.2325038, -1.303749, 1, 0.4627451, 0, 1,
-1.432141, -0.1550902, -1.667985, 1, 0.4666667, 0, 1,
-1.418273, 1.215753, -1.445375, 1, 0.4745098, 0, 1,
-1.409383, -0.1664537, -1.720958, 1, 0.4784314, 0, 1,
-1.400818, 0.2860107, -0.8835804, 1, 0.4862745, 0, 1,
-1.39911, -2.095449, -2.678269, 1, 0.4901961, 0, 1,
-1.394298, -1.918153, -2.36738, 1, 0.4980392, 0, 1,
-1.387343, -0.4996515, -1.614264, 1, 0.5058824, 0, 1,
-1.386731, -2.539711, -3.776265, 1, 0.509804, 0, 1,
-1.370876, 0.209423, -2.534582, 1, 0.5176471, 0, 1,
-1.367955, -0.7980026, -2.304904, 1, 0.5215687, 0, 1,
-1.359977, 0.2866223, -1.39528, 1, 0.5294118, 0, 1,
-1.355983, -0.7417061, -1.871348, 1, 0.5333334, 0, 1,
-1.334282, 0.6478486, -0.5095761, 1, 0.5411765, 0, 1,
-1.330369, 1.071845, 0.4909572, 1, 0.5450981, 0, 1,
-1.328017, 0.9043058, -0.09724062, 1, 0.5529412, 0, 1,
-1.308995, 0.5462143, -0.1501885, 1, 0.5568628, 0, 1,
-1.30877, 0.6074502, -1.378661, 1, 0.5647059, 0, 1,
-1.305727, -1.626428, -3.59059, 1, 0.5686275, 0, 1,
-1.3016, 0.15872, -0.2308334, 1, 0.5764706, 0, 1,
-1.296777, -0.07942547, -2.054724, 1, 0.5803922, 0, 1,
-1.295352, -0.9137605, -2.626374, 1, 0.5882353, 0, 1,
-1.293786, 0.604015, -0.9789051, 1, 0.5921569, 0, 1,
-1.287672, -0.1733546, -0.7426165, 1, 0.6, 0, 1,
-1.280225, -0.1255266, -1.7028, 1, 0.6078432, 0, 1,
-1.277332, -1.018219, -0.7335825, 1, 0.6117647, 0, 1,
-1.264833, -1.481733, -3.332718, 1, 0.6196079, 0, 1,
-1.257599, 0.849313, -1.452038, 1, 0.6235294, 0, 1,
-1.256224, 0.2831739, -1.638009, 1, 0.6313726, 0, 1,
-1.241343, -0.5611836, -1.078599, 1, 0.6352941, 0, 1,
-1.237798, 0.1704496, -0.4696207, 1, 0.6431373, 0, 1,
-1.233847, 0.07532412, -1.276828, 1, 0.6470588, 0, 1,
-1.227861, -1.520456, -2.596373, 1, 0.654902, 0, 1,
-1.227115, -0.6938332, -2.212464, 1, 0.6588235, 0, 1,
-1.222787, -1.483804, -2.739914, 1, 0.6666667, 0, 1,
-1.221917, -0.5971772, -2.166557, 1, 0.6705883, 0, 1,
-1.217102, -0.08120368, -0.844375, 1, 0.6784314, 0, 1,
-1.211077, -0.6948794, -0.05490797, 1, 0.682353, 0, 1,
-1.210351, 1.523811, -0.4524595, 1, 0.6901961, 0, 1,
-1.207731, 0.4002026, 0.1976732, 1, 0.6941177, 0, 1,
-1.207103, 1.922887, -0.0373942, 1, 0.7019608, 0, 1,
-1.201642, -0.6782322, -0.3438779, 1, 0.7098039, 0, 1,
-1.200374, -0.126814, -2.068495, 1, 0.7137255, 0, 1,
-1.199772, 1.177105, -1.948871, 1, 0.7215686, 0, 1,
-1.198756, -1.934804, -2.85606, 1, 0.7254902, 0, 1,
-1.195697, -1.040814, -2.542019, 1, 0.7333333, 0, 1,
-1.195275, 1.520253, 2.016339, 1, 0.7372549, 0, 1,
-1.190771, -0.4230801, -2.422845, 1, 0.7450981, 0, 1,
-1.188837, -1.183302, -1.388613, 1, 0.7490196, 0, 1,
-1.188263, -0.002306368, -1.311313, 1, 0.7568628, 0, 1,
-1.182981, -0.05110995, 1.002675, 1, 0.7607843, 0, 1,
-1.179141, -1.162607, -4.388759, 1, 0.7686275, 0, 1,
-1.169088, -0.6032637, -0.7675938, 1, 0.772549, 0, 1,
-1.166297, -0.2057588, -1.770642, 1, 0.7803922, 0, 1,
-1.160623, 1.70733, -1.322126, 1, 0.7843137, 0, 1,
-1.157197, 0.534124, -0.5608982, 1, 0.7921569, 0, 1,
-1.155803, 1.381335, -0.02080336, 1, 0.7960784, 0, 1,
-1.15379, -0.458996, -2.202112, 1, 0.8039216, 0, 1,
-1.145928, 1.078387, 0.02454133, 1, 0.8117647, 0, 1,
-1.144138, -2.3937, -2.856098, 1, 0.8156863, 0, 1,
-1.143882, -1.301487, -4.767941, 1, 0.8235294, 0, 1,
-1.141832, 0.6187097, 1.336173, 1, 0.827451, 0, 1,
-1.127296, -0.5605115, -2.04751, 1, 0.8352941, 0, 1,
-1.123901, -0.06402082, -1.607576, 1, 0.8392157, 0, 1,
-1.123415, 0.8768134, 0.9229553, 1, 0.8470588, 0, 1,
-1.121591, -0.1613356, -0.9896622, 1, 0.8509804, 0, 1,
-1.117397, 0.4517033, -2.720723, 1, 0.8588235, 0, 1,
-1.114353, -1.827005, -1.652117, 1, 0.8627451, 0, 1,
-1.114317, 0.2409762, 0.5279979, 1, 0.8705882, 0, 1,
-1.110249, -0.2207424, -0.9055342, 1, 0.8745098, 0, 1,
-1.108574, -0.5953919, -2.187636, 1, 0.8823529, 0, 1,
-1.100462, -0.6966568, -3.156428, 1, 0.8862745, 0, 1,
-1.087796, 0.2661109, -0.9853585, 1, 0.8941177, 0, 1,
-1.084344, -1.096809, -1.465236, 1, 0.8980392, 0, 1,
-1.076866, -1.72289, -2.813964, 1, 0.9058824, 0, 1,
-1.068821, -0.6095022, -1.113607, 1, 0.9137255, 0, 1,
-1.063439, 1.339963, -2.577954, 1, 0.9176471, 0, 1,
-1.063227, 1.14176, 1.653497, 1, 0.9254902, 0, 1,
-1.061259, 0.06531037, -3.505385, 1, 0.9294118, 0, 1,
-1.057438, 0.05685842, -1.792662, 1, 0.9372549, 0, 1,
-1.053807, -0.01711497, 0.4993384, 1, 0.9411765, 0, 1,
-1.053196, -0.6989574, -2.731765, 1, 0.9490196, 0, 1,
-1.049529, -0.5711371, -2.632705, 1, 0.9529412, 0, 1,
-1.049327, -0.3348104, -3.020226, 1, 0.9607843, 0, 1,
-1.042884, 1.632783, 0.1780699, 1, 0.9647059, 0, 1,
-1.039536, 1.080138, -1.22968, 1, 0.972549, 0, 1,
-1.034984, 0.4842252, -1.495952, 1, 0.9764706, 0, 1,
-1.030414, -0.2455769, -2.593678, 1, 0.9843137, 0, 1,
-1.014467, 1.74389, 0.3045608, 1, 0.9882353, 0, 1,
-1.008269, -2.11395, -3.860416, 1, 0.9960784, 0, 1,
-1.00697, -0.03004308, -1.331375, 0.9960784, 1, 0, 1,
-1.003024, 0.01958951, -0.01075005, 0.9921569, 1, 0, 1,
-1.001928, -0.2184399, -2.483012, 0.9843137, 1, 0, 1,
-0.9929509, 0.57477, 0.3141412, 0.9803922, 1, 0, 1,
-0.9907349, 0.5043617, -1.539529, 0.972549, 1, 0, 1,
-0.9902224, 2.204942, 0.7156688, 0.9686275, 1, 0, 1,
-0.9735395, 0.4701175, -1.32823, 0.9607843, 1, 0, 1,
-0.9655752, -0.4453351, -1.164508, 0.9568627, 1, 0, 1,
-0.962778, -0.3043481, -1.829291, 0.9490196, 1, 0, 1,
-0.9612756, 0.6354493, -0.03976636, 0.945098, 1, 0, 1,
-0.9561957, 0.2539341, -1.418372, 0.9372549, 1, 0, 1,
-0.9548699, -0.09062148, -1.658501, 0.9333333, 1, 0, 1,
-0.9529827, -1.684104, -3.115092, 0.9254902, 1, 0, 1,
-0.943841, -1.456115, -2.070697, 0.9215686, 1, 0, 1,
-0.9413157, 0.511852, 1.198493, 0.9137255, 1, 0, 1,
-0.9370465, 0.63444, -2.196399, 0.9098039, 1, 0, 1,
-0.9356883, -0.589721, -1.216743, 0.9019608, 1, 0, 1,
-0.9355705, -1.155972, -2.222699, 0.8941177, 1, 0, 1,
-0.927741, 0.9866129, 1.223521, 0.8901961, 1, 0, 1,
-0.9260589, -0.7901157, -2.494202, 0.8823529, 1, 0, 1,
-0.9260523, 2.035053, 0.6409466, 0.8784314, 1, 0, 1,
-0.9245961, -1.393677, -3.895163, 0.8705882, 1, 0, 1,
-0.923131, 0.2394188, -1.247043, 0.8666667, 1, 0, 1,
-0.9229379, 3.056366, -1.780501, 0.8588235, 1, 0, 1,
-0.9143492, -0.4882385, -2.822164, 0.854902, 1, 0, 1,
-0.9139158, -0.03464068, -1.399007, 0.8470588, 1, 0, 1,
-0.9081849, -0.5489265, -2.843416, 0.8431373, 1, 0, 1,
-0.9009323, -0.5457817, -3.186093, 0.8352941, 1, 0, 1,
-0.8811914, -1.469137, -1.012277, 0.8313726, 1, 0, 1,
-0.8748096, -0.5030474, -1.660599, 0.8235294, 1, 0, 1,
-0.8690771, 0.1496267, -1.496997, 0.8196079, 1, 0, 1,
-0.8593245, -0.6067187, -1.756383, 0.8117647, 1, 0, 1,
-0.8586427, 1.525276, -0.9436912, 0.8078431, 1, 0, 1,
-0.8579125, -0.4980462, -1.119472, 0.8, 1, 0, 1,
-0.8560311, 0.2304258, -1.423185, 0.7921569, 1, 0, 1,
-0.8558385, -0.07843938, -0.6429706, 0.7882353, 1, 0, 1,
-0.8558097, 0.2040237, -0.6992872, 0.7803922, 1, 0, 1,
-0.8538597, 2.484669, -2.33889, 0.7764706, 1, 0, 1,
-0.8481292, 0.8689018, -0.8430418, 0.7686275, 1, 0, 1,
-0.8432851, -1.158437, -3.158515, 0.7647059, 1, 0, 1,
-0.8426172, 1.941536, -1.405005, 0.7568628, 1, 0, 1,
-0.8409259, 1.990477, -1.051033, 0.7529412, 1, 0, 1,
-0.8370323, 0.105722, -0.8542687, 0.7450981, 1, 0, 1,
-0.8340014, -1.112202, -2.362839, 0.7411765, 1, 0, 1,
-0.8296522, -0.4431979, -0.6266348, 0.7333333, 1, 0, 1,
-0.8293399, -1.470512, -3.565351, 0.7294118, 1, 0, 1,
-0.8285013, -0.5068532, -3.678747, 0.7215686, 1, 0, 1,
-0.826466, -0.4224406, -3.001285, 0.7176471, 1, 0, 1,
-0.8241367, 1.413338, -0.8455617, 0.7098039, 1, 0, 1,
-0.8209926, -0.04635435, -1.502308, 0.7058824, 1, 0, 1,
-0.8147459, -0.8557385, -3.330815, 0.6980392, 1, 0, 1,
-0.8093374, -0.7326213, -4.095248, 0.6901961, 1, 0, 1,
-0.8065206, -0.5764161, -3.524732, 0.6862745, 1, 0, 1,
-0.8052176, -0.1668828, -2.451285, 0.6784314, 1, 0, 1,
-0.8027641, 0.6657082, -0.8010601, 0.6745098, 1, 0, 1,
-0.7999038, -1.488909, -2.987762, 0.6666667, 1, 0, 1,
-0.799146, -0.614602, -2.081452, 0.6627451, 1, 0, 1,
-0.7979972, 1.758352, 0.5581059, 0.654902, 1, 0, 1,
-0.7949504, -0.4978706, -1.486805, 0.6509804, 1, 0, 1,
-0.7943919, -0.5094644, -5.180548, 0.6431373, 1, 0, 1,
-0.7932308, -0.9972643, -2.326412, 0.6392157, 1, 0, 1,
-0.7887917, -0.6225836, -0.5751001, 0.6313726, 1, 0, 1,
-0.7848788, 0.5096955, -0.749743, 0.627451, 1, 0, 1,
-0.7776021, 1.064883, 1.00983, 0.6196079, 1, 0, 1,
-0.7711011, -0.2355869, -1.729397, 0.6156863, 1, 0, 1,
-0.7690082, -1.431344, -3.202723, 0.6078432, 1, 0, 1,
-0.767475, 0.5528091, -2.456894, 0.6039216, 1, 0, 1,
-0.7654576, -1.228007, -3.113051, 0.5960785, 1, 0, 1,
-0.762162, 0.01450123, -2.349928, 0.5882353, 1, 0, 1,
-0.7552111, -0.9069736, -4.211089, 0.5843138, 1, 0, 1,
-0.7495205, 1.431735, -0.9460666, 0.5764706, 1, 0, 1,
-0.7444081, -0.2164746, -3.278796, 0.572549, 1, 0, 1,
-0.7433761, 0.4021997, -2.233895, 0.5647059, 1, 0, 1,
-0.7369711, 0.330349, -0.1969881, 0.5607843, 1, 0, 1,
-0.7357064, 0.7725829, -0.9885388, 0.5529412, 1, 0, 1,
-0.7306269, -0.7310646, -2.647285, 0.5490196, 1, 0, 1,
-0.7279738, -0.5793688, -0.9454522, 0.5411765, 1, 0, 1,
-0.7279196, 1.264503, -0.8938392, 0.5372549, 1, 0, 1,
-0.7275527, 0.6858182, -2.099941, 0.5294118, 1, 0, 1,
-0.7267107, 0.1407494, -0.3751879, 0.5254902, 1, 0, 1,
-0.7047173, 0.4477276, -1.705098, 0.5176471, 1, 0, 1,
-0.7029911, 0.4813932, -0.6696584, 0.5137255, 1, 0, 1,
-0.7019607, -0.08506053, -2.585784, 0.5058824, 1, 0, 1,
-0.6962667, 0.4297185, -1.093047, 0.5019608, 1, 0, 1,
-0.6958565, 2.148355, -0.04607124, 0.4941176, 1, 0, 1,
-0.692215, -0.9319746, -2.266996, 0.4862745, 1, 0, 1,
-0.6917034, -0.5481001, -2.385645, 0.4823529, 1, 0, 1,
-0.6880785, 0.2313102, 2.398653, 0.4745098, 1, 0, 1,
-0.6834042, 1.282105, 0.3262286, 0.4705882, 1, 0, 1,
-0.6832187, -0.9125817, -2.531074, 0.4627451, 1, 0, 1,
-0.6785814, 1.440395, -1.561448, 0.4588235, 1, 0, 1,
-0.6709872, -1.005028, -1.794087, 0.4509804, 1, 0, 1,
-0.6701348, -0.6834965, -3.626235, 0.4470588, 1, 0, 1,
-0.6694375, -1.879497, -2.751943, 0.4392157, 1, 0, 1,
-0.6693357, 0.6391596, -0.8894401, 0.4352941, 1, 0, 1,
-0.6625756, -2.080458, -3.777249, 0.427451, 1, 0, 1,
-0.6614302, 1.024139, -0.8596324, 0.4235294, 1, 0, 1,
-0.660836, -0.174732, -1.037296, 0.4156863, 1, 0, 1,
-0.6600062, -0.3208857, -0.9694515, 0.4117647, 1, 0, 1,
-0.6593779, -0.28756, -2.974915, 0.4039216, 1, 0, 1,
-0.6541627, -1.317703, -1.552189, 0.3960784, 1, 0, 1,
-0.6526059, 0.704716, -1.161852, 0.3921569, 1, 0, 1,
-0.6516511, -0.2130919, -2.249536, 0.3843137, 1, 0, 1,
-0.6477028, 0.8915817, 0.0357022, 0.3803922, 1, 0, 1,
-0.6476953, -0.1394278, -3.816394, 0.372549, 1, 0, 1,
-0.6470294, 0.3783623, -2.521599, 0.3686275, 1, 0, 1,
-0.6468888, 1.724823, -0.5473642, 0.3607843, 1, 0, 1,
-0.6457228, -1.171977, -1.543558, 0.3568628, 1, 0, 1,
-0.6446955, 0.7995758, -0.4830264, 0.3490196, 1, 0, 1,
-0.6385006, 1.265065, -0.4164333, 0.345098, 1, 0, 1,
-0.638412, -0.6053751, -3.663771, 0.3372549, 1, 0, 1,
-0.6378262, -1.264165, -3.95475, 0.3333333, 1, 0, 1,
-0.6367906, -0.7332945, -2.089612, 0.3254902, 1, 0, 1,
-0.6358884, 0.1803077, -0.8002762, 0.3215686, 1, 0, 1,
-0.6346214, 0.3107953, -1.216243, 0.3137255, 1, 0, 1,
-0.6304289, 0.1513914, -1.932704, 0.3098039, 1, 0, 1,
-0.6276609, 1.32671, -1.055292, 0.3019608, 1, 0, 1,
-0.6272427, 0.3505522, -2.452946, 0.2941177, 1, 0, 1,
-0.6259131, -0.5990376, -3.355318, 0.2901961, 1, 0, 1,
-0.6252597, 0.8613745, -1.144212, 0.282353, 1, 0, 1,
-0.6251093, -0.2106633, -3.800484, 0.2784314, 1, 0, 1,
-0.6235212, -0.02843009, -1.417546, 0.2705882, 1, 0, 1,
-0.6234803, -2.195729, -3.614072, 0.2666667, 1, 0, 1,
-0.6233998, 0.174476, -1.313858, 0.2588235, 1, 0, 1,
-0.6212513, 0.601239, 0.3576565, 0.254902, 1, 0, 1,
-0.6195289, 0.7123868, -1.110695, 0.2470588, 1, 0, 1,
-0.6174557, -0.4434941, -3.391955, 0.2431373, 1, 0, 1,
-0.6124105, -0.5427527, -3.61281, 0.2352941, 1, 0, 1,
-0.6104058, -0.1565134, -2.085915, 0.2313726, 1, 0, 1,
-0.6101705, -0.6044044, -3.990533, 0.2235294, 1, 0, 1,
-0.6051237, -0.2711581, -2.798555, 0.2196078, 1, 0, 1,
-0.6047778, -1.606777, -3.428516, 0.2117647, 1, 0, 1,
-0.6043462, -0.1294935, 0.05942179, 0.2078431, 1, 0, 1,
-0.6035323, 0.7273878, -0.4222984, 0.2, 1, 0, 1,
-0.5982589, 0.8779249, -0.6852044, 0.1921569, 1, 0, 1,
-0.5963652, -0.3400795, -2.56973, 0.1882353, 1, 0, 1,
-0.5948526, -0.04846423, -1.870476, 0.1803922, 1, 0, 1,
-0.5917104, 0.3965597, -0.4636887, 0.1764706, 1, 0, 1,
-0.5869887, -0.09156212, -1.9943, 0.1686275, 1, 0, 1,
-0.586959, -1.943719, -2.822502, 0.1647059, 1, 0, 1,
-0.5789763, 1.236721, -2.140284, 0.1568628, 1, 0, 1,
-0.5757936, -0.5666386, 0.1630739, 0.1529412, 1, 0, 1,
-0.5743037, -0.2039069, -0.5066035, 0.145098, 1, 0, 1,
-0.5705488, 0.8125825, -0.8173334, 0.1411765, 1, 0, 1,
-0.5697937, -3.942804, -4.359966, 0.1333333, 1, 0, 1,
-0.5689726, -1.127878, -2.846598, 0.1294118, 1, 0, 1,
-0.567379, -1.529563, -2.441835, 0.1215686, 1, 0, 1,
-0.5579725, 0.8394852, -0.5896102, 0.1176471, 1, 0, 1,
-0.5579209, -1.137587, -3.112784, 0.1098039, 1, 0, 1,
-0.5565249, -0.4527965, -1.407875, 0.1058824, 1, 0, 1,
-0.553351, -0.8541569, -1.987766, 0.09803922, 1, 0, 1,
-0.5439007, -0.2332412, -1.947582, 0.09019608, 1, 0, 1,
-0.5422523, 1.441869, -0.3845082, 0.08627451, 1, 0, 1,
-0.5420364, -0.2183299, -3.33647, 0.07843138, 1, 0, 1,
-0.5392867, -1.575677, -3.146665, 0.07450981, 1, 0, 1,
-0.538902, 0.1248062, -0.7579769, 0.06666667, 1, 0, 1,
-0.5369222, -0.5221648, -2.783002, 0.0627451, 1, 0, 1,
-0.5342905, 0.1391633, -0.1165662, 0.05490196, 1, 0, 1,
-0.5328214, 1.047826, -0.01760557, 0.05098039, 1, 0, 1,
-0.5323517, 0.7424789, -0.9969169, 0.04313726, 1, 0, 1,
-0.531754, -1.874408, -2.782609, 0.03921569, 1, 0, 1,
-0.5283996, 0.2073379, -1.837678, 0.03137255, 1, 0, 1,
-0.5256248, -0.2952106, -3.70732, 0.02745098, 1, 0, 1,
-0.5238578, 0.4773192, -0.7061711, 0.01960784, 1, 0, 1,
-0.5233405, -0.8980517, -2.802424, 0.01568628, 1, 0, 1,
-0.5200372, 1.800485, 0.2899031, 0.007843138, 1, 0, 1,
-0.5189436, 0.5521094, -0.7313684, 0.003921569, 1, 0, 1,
-0.5186498, 2.026495, 1.156095, 0, 1, 0.003921569, 1,
-0.5164004, 0.6812729, -0.345558, 0, 1, 0.01176471, 1,
-0.5125632, -1.612148, -4.914886, 0, 1, 0.01568628, 1,
-0.5075623, 0.6518406, -0.6232882, 0, 1, 0.02352941, 1,
-0.5065022, 0.9246768, 1.216632, 0, 1, 0.02745098, 1,
-0.5062773, 0.890173, 0.5312777, 0, 1, 0.03529412, 1,
-0.5052674, 0.1569961, -0.5705991, 0, 1, 0.03921569, 1,
-0.5040848, 0.2676977, -0.001062138, 0, 1, 0.04705882, 1,
-0.4988618, 1.083936, 0.3419994, 0, 1, 0.05098039, 1,
-0.4921176, -0.04277844, -0.1741292, 0, 1, 0.05882353, 1,
-0.487512, -1.292665, -3.409828, 0, 1, 0.0627451, 1,
-0.4868645, 0.4603181, -1.466192, 0, 1, 0.07058824, 1,
-0.4844324, 1.452937, 0.2776003, 0, 1, 0.07450981, 1,
-0.4804478, 0.3033881, -1.0515, 0, 1, 0.08235294, 1,
-0.4761986, 0.6360816, -0.3110461, 0, 1, 0.08627451, 1,
-0.4750361, 0.1643624, 0.2732493, 0, 1, 0.09411765, 1,
-0.471758, -0.06990445, -1.950718, 0, 1, 0.1019608, 1,
-0.4674068, -0.4007497, -2.677062, 0, 1, 0.1058824, 1,
-0.4668524, -0.1956062, -0.07232852, 0, 1, 0.1137255, 1,
-0.4664013, -1.736346, -3.925582, 0, 1, 0.1176471, 1,
-0.458035, 0.687698, -0.3119057, 0, 1, 0.1254902, 1,
-0.4571109, 1.107411, -0.6512773, 0, 1, 0.1294118, 1,
-0.4532798, -0.4839243, -1.773684, 0, 1, 0.1372549, 1,
-0.4528111, -1.901172, -3.211822, 0, 1, 0.1411765, 1,
-0.4527397, -0.7697252, -3.312565, 0, 1, 0.1490196, 1,
-0.4507407, 1.082749, 0.6019051, 0, 1, 0.1529412, 1,
-0.445331, 0.8863339, -1.307, 0, 1, 0.1607843, 1,
-0.44482, -0.4087802, -3.081459, 0, 1, 0.1647059, 1,
-0.4447588, -2.597204, -2.908503, 0, 1, 0.172549, 1,
-0.4394107, 0.3831769, -0.9405192, 0, 1, 0.1764706, 1,
-0.4376645, 0.4940295, -0.6959574, 0, 1, 0.1843137, 1,
-0.4316949, -0.187988, -3.244922, 0, 1, 0.1882353, 1,
-0.4315119, 0.2296435, -2.668154, 0, 1, 0.1960784, 1,
-0.4233447, 0.2700411, -1.027876, 0, 1, 0.2039216, 1,
-0.42164, 0.3319741, -1.8703, 0, 1, 0.2078431, 1,
-0.4100375, -0.155622, -1.09118, 0, 1, 0.2156863, 1,
-0.4085166, -0.1500978, -2.91516, 0, 1, 0.2196078, 1,
-0.4063595, -0.006823597, -3.148627, 0, 1, 0.227451, 1,
-0.4024002, 0.7905914, -0.5592332, 0, 1, 0.2313726, 1,
-0.4005821, 0.182619, -0.7813411, 0, 1, 0.2392157, 1,
-0.3975884, -0.413148, -2.763068, 0, 1, 0.2431373, 1,
-0.3953942, -1.356868, -3.194572, 0, 1, 0.2509804, 1,
-0.3943044, 0.743615, 0.6263599, 0, 1, 0.254902, 1,
-0.3919108, 0.01728869, -2.267671, 0, 1, 0.2627451, 1,
-0.3910955, -0.435507, -1.4183, 0, 1, 0.2666667, 1,
-0.3906503, -0.8518406, -2.751194, 0, 1, 0.2745098, 1,
-0.3872068, -0.3176398, -2.626554, 0, 1, 0.2784314, 1,
-0.3846242, -0.2968756, -2.483428, 0, 1, 0.2862745, 1,
-0.3832014, 1.660363, 0.2882136, 0, 1, 0.2901961, 1,
-0.3738088, -0.7421528, -3.41867, 0, 1, 0.2980392, 1,
-0.3729592, 0.5857032, 0.7856886, 0, 1, 0.3058824, 1,
-0.3700902, 1.664925, -0.2936265, 0, 1, 0.3098039, 1,
-0.36973, 1.289782, 0.1332651, 0, 1, 0.3176471, 1,
-0.3668101, 1.312691, -1.403899, 0, 1, 0.3215686, 1,
-0.3658832, -1.396542, -2.358844, 0, 1, 0.3294118, 1,
-0.3647161, 0.6652438, -1.793612, 0, 1, 0.3333333, 1,
-0.3642332, -0.2228803, -2.162157, 0, 1, 0.3411765, 1,
-0.3621791, -0.3598743, -1.645265, 0, 1, 0.345098, 1,
-0.3580212, 0.04338402, -0.4078806, 0, 1, 0.3529412, 1,
-0.3573492, -0.2705969, -1.246604, 0, 1, 0.3568628, 1,
-0.3570149, -0.3130912, -3.047592, 0, 1, 0.3647059, 1,
-0.3560534, -0.3728834, -2.47259, 0, 1, 0.3686275, 1,
-0.3520393, 0.03013559, -1.521684, 0, 1, 0.3764706, 1,
-0.3507219, 1.258176, -1.713744, 0, 1, 0.3803922, 1,
-0.3411211, -0.2546837, -0.7876302, 0, 1, 0.3882353, 1,
-0.3321998, -0.3026259, -2.379864, 0, 1, 0.3921569, 1,
-0.3262608, -0.2110867, -0.2529772, 0, 1, 0.4, 1,
-0.3237395, 0.07028862, -1.49768, 0, 1, 0.4078431, 1,
-0.3208276, 0.3629894, -1.835688, 0, 1, 0.4117647, 1,
-0.3180054, -0.6352829, -3.410904, 0, 1, 0.4196078, 1,
-0.3169779, -1.213425, -3.658496, 0, 1, 0.4235294, 1,
-0.3059502, 0.6553617, -0.5520189, 0, 1, 0.4313726, 1,
-0.3043447, -1.522102, -1.890528, 0, 1, 0.4352941, 1,
-0.301787, 0.2318173, -0.8123438, 0, 1, 0.4431373, 1,
-0.2998078, 0.6752365, 1.332344, 0, 1, 0.4470588, 1,
-0.2997209, 0.2866168, 0.3661633, 0, 1, 0.454902, 1,
-0.2904705, 0.8109038, 0.4753829, 0, 1, 0.4588235, 1,
-0.2848361, -0.634783, -1.583207, 0, 1, 0.4666667, 1,
-0.2846218, -0.6916082, -4.169908, 0, 1, 0.4705882, 1,
-0.2818553, 0.8045704, 0.5039934, 0, 1, 0.4784314, 1,
-0.2779041, -0.9586338, -1.74, 0, 1, 0.4823529, 1,
-0.2774504, 1.943734, -1.986999, 0, 1, 0.4901961, 1,
-0.276813, -0.4480771, -1.69769, 0, 1, 0.4941176, 1,
-0.2756112, -0.5109289, -2.909067, 0, 1, 0.5019608, 1,
-0.2752217, -0.1920965, -1.609906, 0, 1, 0.509804, 1,
-0.2689575, 0.1536509, -0.7788876, 0, 1, 0.5137255, 1,
-0.2662327, -0.1537093, -0.1564953, 0, 1, 0.5215687, 1,
-0.2658686, -2.286498, -2.011452, 0, 1, 0.5254902, 1,
-0.2588919, -0.6437449, -2.174098, 0, 1, 0.5333334, 1,
-0.2571779, 1.153236, 0.4931906, 0, 1, 0.5372549, 1,
-0.2514856, -0.8987432, -2.883507, 0, 1, 0.5450981, 1,
-0.2493178, 1.533989, 0.4493637, 0, 1, 0.5490196, 1,
-0.2458351, 0.5655292, 0.4710209, 0, 1, 0.5568628, 1,
-0.2437928, 0.8568646, -0.3037052, 0, 1, 0.5607843, 1,
-0.2393587, 0.0996904, -1.861974, 0, 1, 0.5686275, 1,
-0.2362695, -0.3424692, -3.305366, 0, 1, 0.572549, 1,
-0.236153, -1.28565, -2.078631, 0, 1, 0.5803922, 1,
-0.2346512, -0.9594107, -2.658947, 0, 1, 0.5843138, 1,
-0.2333253, 1.671913, -0.365812, 0, 1, 0.5921569, 1,
-0.2322191, -1.043862, -3.101555, 0, 1, 0.5960785, 1,
-0.2301455, 1.05433, -0.8298776, 0, 1, 0.6039216, 1,
-0.2300392, -0.2690027, -1.953758, 0, 1, 0.6117647, 1,
-0.2291329, 1.616688, -1.355123, 0, 1, 0.6156863, 1,
-0.2287063, -0.4664961, -2.430761, 0, 1, 0.6235294, 1,
-0.2266283, 0.1816444, -0.5643466, 0, 1, 0.627451, 1,
-0.221406, -1.057084, -1.802384, 0, 1, 0.6352941, 1,
-0.2202056, 0.2095263, -0.07646367, 0, 1, 0.6392157, 1,
-0.2174015, 0.8557683, 0.7705678, 0, 1, 0.6470588, 1,
-0.2164379, 0.3444238, -0.5732805, 0, 1, 0.6509804, 1,
-0.2151878, 0.5844141, -0.1413711, 0, 1, 0.6588235, 1,
-0.2094065, 0.7589803, 0.3675608, 0, 1, 0.6627451, 1,
-0.2091276, 0.2747984, -2.097108, 0, 1, 0.6705883, 1,
-0.2020557, -0.3498523, -3.203596, 0, 1, 0.6745098, 1,
-0.2007706, -0.436487, -2.740736, 0, 1, 0.682353, 1,
-0.1975647, 0.403955, -0.9378349, 0, 1, 0.6862745, 1,
-0.1899636, 0.4768637, -0.4569378, 0, 1, 0.6941177, 1,
-0.1893225, 0.1397142, -0.6429294, 0, 1, 0.7019608, 1,
-0.1884459, -2.352389, -2.551375, 0, 1, 0.7058824, 1,
-0.1869341, 1.152507, 1.595509, 0, 1, 0.7137255, 1,
-0.1852994, -1.099895, -4.504553, 0, 1, 0.7176471, 1,
-0.1824941, -0.005630855, -1.723323, 0, 1, 0.7254902, 1,
-0.1780573, -0.028325, -1.265442, 0, 1, 0.7294118, 1,
-0.1759112, -1.328746, -3.070685, 0, 1, 0.7372549, 1,
-0.1744474, -0.7218759, -3.383076, 0, 1, 0.7411765, 1,
-0.1700623, 0.5965947, 1.471666, 0, 1, 0.7490196, 1,
-0.1630236, -0.8827544, -3.766304, 0, 1, 0.7529412, 1,
-0.153307, -0.2294952, -2.242208, 0, 1, 0.7607843, 1,
-0.1519086, -0.6571958, -2.985341, 0, 1, 0.7647059, 1,
-0.1467809, -0.2260936, -2.23739, 0, 1, 0.772549, 1,
-0.1423032, 0.8564036, 1.359641, 0, 1, 0.7764706, 1,
-0.1399764, 0.491601, -0.6357825, 0, 1, 0.7843137, 1,
-0.13969, 0.5477595, 0.2945008, 0, 1, 0.7882353, 1,
-0.1389346, 0.8271754, 1.657022, 0, 1, 0.7960784, 1,
-0.1305116, 1.393128, 1.589201, 0, 1, 0.8039216, 1,
-0.1274077, 0.2751764, 0.1952572, 0, 1, 0.8078431, 1,
-0.1240432, 1.34477, -0.1930297, 0, 1, 0.8156863, 1,
-0.1240175, -0.4986728, -4.026383, 0, 1, 0.8196079, 1,
-0.1216583, -0.7013925, -3.873926, 0, 1, 0.827451, 1,
-0.1203053, -0.01115622, -0.09209069, 0, 1, 0.8313726, 1,
-0.1196202, -0.4806985, -2.988873, 0, 1, 0.8392157, 1,
-0.1175635, -0.007521534, -1.119589, 0, 1, 0.8431373, 1,
-0.1157437, -0.04221656, 0.412822, 0, 1, 0.8509804, 1,
-0.1148314, 0.366968, -0.5421334, 0, 1, 0.854902, 1,
-0.1129471, 1.407898, -1.001191, 0, 1, 0.8627451, 1,
-0.1127149, -0.2074793, -2.089031, 0, 1, 0.8666667, 1,
-0.112674, 1.937589, -0.5880327, 0, 1, 0.8745098, 1,
-0.1126613, -0.004849318, 0.6093762, 0, 1, 0.8784314, 1,
-0.1068789, -1.128179, -1.602709, 0, 1, 0.8862745, 1,
-0.1055134, -2.331816, -4.871129, 0, 1, 0.8901961, 1,
-0.1039071, -2.349843, -2.233839, 0, 1, 0.8980392, 1,
-0.09937534, 0.949986, -1.453567, 0, 1, 0.9058824, 1,
-0.09686679, -0.2184686, -3.226468, 0, 1, 0.9098039, 1,
-0.09099631, 0.6554351, 0.2151497, 0, 1, 0.9176471, 1,
-0.08912413, -0.6874827, -2.586136, 0, 1, 0.9215686, 1,
-0.08807878, 2.107935, -0.6064753, 0, 1, 0.9294118, 1,
-0.08502164, 0.7177896, -1.201916, 0, 1, 0.9333333, 1,
-0.07887702, 0.5504875, -0.4695452, 0, 1, 0.9411765, 1,
-0.07852732, -0.6885497, -3.606026, 0, 1, 0.945098, 1,
-0.07758359, -0.111503, -3.58935, 0, 1, 0.9529412, 1,
-0.07711976, 0.9887493, -0.5998671, 0, 1, 0.9568627, 1,
-0.07693926, 1.140852, 0.3135638, 0, 1, 0.9647059, 1,
-0.06977222, 0.8788421, 0.9957049, 0, 1, 0.9686275, 1,
-0.06517754, 1.247891, 0.5792195, 0, 1, 0.9764706, 1,
-0.06159827, 0.2307339, -1.4592, 0, 1, 0.9803922, 1,
-0.05826741, -0.6267871, -4.063204, 0, 1, 0.9882353, 1,
-0.05669751, -1.122169, -2.037592, 0, 1, 0.9921569, 1,
-0.05195288, -0.6384075, -3.934255, 0, 1, 1, 1,
-0.04733805, 0.07009295, -0.8129252, 0, 0.9921569, 1, 1,
-0.04653527, 1.428303, 0.7139934, 0, 0.9882353, 1, 1,
-0.04396139, -0.5838361, -2.562976, 0, 0.9803922, 1, 1,
-0.0404872, 1.095565, -1.554768, 0, 0.9764706, 1, 1,
-0.03856394, 0.1391161, -0.1312361, 0, 0.9686275, 1, 1,
-0.03804367, -0.8779786, -5.210145, 0, 0.9647059, 1, 1,
-0.03653507, 1.357035, 0.02647366, 0, 0.9568627, 1, 1,
-0.03605786, 1.242105, 0.3106159, 0, 0.9529412, 1, 1,
-0.0344217, -0.9864298, -3.629238, 0, 0.945098, 1, 1,
-0.02965795, -0.03028188, -3.171453, 0, 0.9411765, 1, 1,
-0.0254863, 0.1467155, 1.609073, 0, 0.9333333, 1, 1,
-0.02268253, -0.8524301, -5.296763, 0, 0.9294118, 1, 1,
-0.02132641, 0.4238445, 1.008153, 0, 0.9215686, 1, 1,
-0.02040044, -1.006645, -3.866749, 0, 0.9176471, 1, 1,
-0.02031398, -1.464895, -3.012238, 0, 0.9098039, 1, 1,
-0.02005205, 0.3327881, -0.1212221, 0, 0.9058824, 1, 1,
-0.01546301, -0.5993752, -2.849984, 0, 0.8980392, 1, 1,
-0.01351368, -1.10135, -3.748912, 0, 0.8901961, 1, 1,
-0.01093983, 0.741325, -0.722011, 0, 0.8862745, 1, 1,
-0.009990488, 1.546112, -0.03465903, 0, 0.8784314, 1, 1,
-0.005584906, 0.9776602, 0.06152525, 0, 0.8745098, 1, 1,
-0.002324743, 0.6860936, -0.9622277, 0, 0.8666667, 1, 1,
0.000159796, -0.1029257, 3.532665, 0, 0.8627451, 1, 1,
0.000168012, -0.4247527, 4.062596, 0, 0.854902, 1, 1,
0.008947379, 0.3924483, -0.6450983, 0, 0.8509804, 1, 1,
0.0100069, 0.8523684, -0.1577084, 0, 0.8431373, 1, 1,
0.01056668, -1.372998, 4.288491, 0, 0.8392157, 1, 1,
0.0185415, -1.098884, 3.453121, 0, 0.8313726, 1, 1,
0.01854734, 1.04277, 0.5867788, 0, 0.827451, 1, 1,
0.02401678, -1.372388, 4.32802, 0, 0.8196079, 1, 1,
0.02476882, -0.5409459, 3.318023, 0, 0.8156863, 1, 1,
0.02645614, 0.01176706, 2.879353, 0, 0.8078431, 1, 1,
0.02854501, -0.4760943, 2.862109, 0, 0.8039216, 1, 1,
0.0295356, -0.7764994, 2.971064, 0, 0.7960784, 1, 1,
0.02988268, -0.3186219, 2.585861, 0, 0.7882353, 1, 1,
0.03549526, -1.003602, 3.622791, 0, 0.7843137, 1, 1,
0.03809569, 0.4112386, 1.077677, 0, 0.7764706, 1, 1,
0.03945632, 0.04273332, 3.806679, 0, 0.772549, 1, 1,
0.04028986, -0.2174824, 1.531681, 0, 0.7647059, 1, 1,
0.04118006, -1.283394, 3.68954, 0, 0.7607843, 1, 1,
0.04125106, 1.902758, 0.05878776, 0, 0.7529412, 1, 1,
0.0425455, 0.3121663, 1.199742, 0, 0.7490196, 1, 1,
0.04410012, -1.965277, 2.902774, 0, 0.7411765, 1, 1,
0.04978142, 2.091987, -1.275231, 0, 0.7372549, 1, 1,
0.05291119, 0.03775898, 1.477451, 0, 0.7294118, 1, 1,
0.0531594, 1.605144, 1.565922, 0, 0.7254902, 1, 1,
0.053957, 0.1487444, -1.463662, 0, 0.7176471, 1, 1,
0.05766368, 1.404349, 1.180651, 0, 0.7137255, 1, 1,
0.05972398, 0.1284078, 0.3870383, 0, 0.7058824, 1, 1,
0.06239279, -0.4755561, 3.796913, 0, 0.6980392, 1, 1,
0.06706173, 1.911412, 0.6363379, 0, 0.6941177, 1, 1,
0.06733535, -1.389547, 2.706613, 0, 0.6862745, 1, 1,
0.07122619, 0.1425242, -0.9574014, 0, 0.682353, 1, 1,
0.07265364, -0.7465245, 2.755786, 0, 0.6745098, 1, 1,
0.07379811, -0.1700523, 3.176076, 0, 0.6705883, 1, 1,
0.07423303, 0.4028884, 0.5164496, 0, 0.6627451, 1, 1,
0.07516377, 1.213058, -1.47994, 0, 0.6588235, 1, 1,
0.07633756, -1.026176, 3.594608, 0, 0.6509804, 1, 1,
0.07987653, 1.215014, 0.1652663, 0, 0.6470588, 1, 1,
0.08490285, -1.098262, 4.641442, 0, 0.6392157, 1, 1,
0.08578708, 0.5496607, 0.9263484, 0, 0.6352941, 1, 1,
0.09186104, 1.158975, -0.02409474, 0, 0.627451, 1, 1,
0.09196289, -1.498147, 3.840622, 0, 0.6235294, 1, 1,
0.09385759, -0.6378386, 4.422119, 0, 0.6156863, 1, 1,
0.0940372, -2.394667, 2.234523, 0, 0.6117647, 1, 1,
0.09508286, -0.06164272, 3.105066, 0, 0.6039216, 1, 1,
0.09634288, -1.007109, 2.282893, 0, 0.5960785, 1, 1,
0.1008933, -0.7888532, 1.32958, 0, 0.5921569, 1, 1,
0.1027866, -3.36586, 2.818833, 0, 0.5843138, 1, 1,
0.1032486, -0.78809, 2.333594, 0, 0.5803922, 1, 1,
0.107935, 0.970915, 0.4731925, 0, 0.572549, 1, 1,
0.1084987, 1.005135, 0.01498895, 0, 0.5686275, 1, 1,
0.1092049, -0.05797601, 3.636818, 0, 0.5607843, 1, 1,
0.1120156, -0.3665638, 1.994018, 0, 0.5568628, 1, 1,
0.1134188, 0.9898978, -1.005328, 0, 0.5490196, 1, 1,
0.1168261, 1.355522, 1.202737, 0, 0.5450981, 1, 1,
0.117469, -0.8221232, 3.378, 0, 0.5372549, 1, 1,
0.1183717, -0.4361266, 2.760339, 0, 0.5333334, 1, 1,
0.127284, 0.9742208, 1.13444, 0, 0.5254902, 1, 1,
0.1278592, -1.467615, 3.341181, 0, 0.5215687, 1, 1,
0.132536, -2.224308, 1.966996, 0, 0.5137255, 1, 1,
0.1342657, -0.1216884, 3.262174, 0, 0.509804, 1, 1,
0.1412577, -1.484776, 4.033528, 0, 0.5019608, 1, 1,
0.1450105, 0.9228172, 1.102838, 0, 0.4941176, 1, 1,
0.1465926, 0.4392889, 2.889227, 0, 0.4901961, 1, 1,
0.151559, 0.7148792, -1.0203, 0, 0.4823529, 1, 1,
0.1532159, -1.635201, 1.947918, 0, 0.4784314, 1, 1,
0.1541097, -1.007532, 2.436265, 0, 0.4705882, 1, 1,
0.1557698, 0.2498382, 1.156224, 0, 0.4666667, 1, 1,
0.1578111, -0.3483074, 2.99022, 0, 0.4588235, 1, 1,
0.159388, 0.2774024, 1.028448, 0, 0.454902, 1, 1,
0.1607075, 0.9997805, -0.2652638, 0, 0.4470588, 1, 1,
0.1607425, -0.4175922, 3.573877, 0, 0.4431373, 1, 1,
0.1648289, -0.09888033, 1.536733, 0, 0.4352941, 1, 1,
0.1696597, -1.255922, 2.048145, 0, 0.4313726, 1, 1,
0.1704339, 0.7297578, -0.5189553, 0, 0.4235294, 1, 1,
0.1768882, -1.6242, 5.231855, 0, 0.4196078, 1, 1,
0.1781512, 0.9070638, 0.7920106, 0, 0.4117647, 1, 1,
0.1796189, -0.07473058, 1.917095, 0, 0.4078431, 1, 1,
0.181545, -0.3582318, 2.182148, 0, 0.4, 1, 1,
0.1817096, 1.304205, -1.410034, 0, 0.3921569, 1, 1,
0.1821444, 1.361333, -0.1580727, 0, 0.3882353, 1, 1,
0.1872642, -0.1458655, 0.7641263, 0, 0.3803922, 1, 1,
0.1909674, 0.04438876, -1.358585, 0, 0.3764706, 1, 1,
0.194923, -1.327932, 5.354405, 0, 0.3686275, 1, 1,
0.1975201, 0.2458939, 0.4355445, 0, 0.3647059, 1, 1,
0.1985756, -0.2972772, 1.801942, 0, 0.3568628, 1, 1,
0.1987947, 0.3857237, -0.3597265, 0, 0.3529412, 1, 1,
0.200072, 0.297779, 1.175689, 0, 0.345098, 1, 1,
0.2006197, -1.504934, 3.296509, 0, 0.3411765, 1, 1,
0.2045025, -0.5186871, 4.066133, 0, 0.3333333, 1, 1,
0.2052273, -0.3416471, 3.670922, 0, 0.3294118, 1, 1,
0.2066826, 0.3985293, -0.1920099, 0, 0.3215686, 1, 1,
0.2081109, 0.1513741, 0.9184106, 0, 0.3176471, 1, 1,
0.2097992, -1.205446, 4.911053, 0, 0.3098039, 1, 1,
0.2151635, -1.341421, 2.194215, 0, 0.3058824, 1, 1,
0.2160865, -0.816232, 1.222219, 0, 0.2980392, 1, 1,
0.2165516, 0.05969573, 2.676796, 0, 0.2901961, 1, 1,
0.2190422, -1.167777, 2.738082, 0, 0.2862745, 1, 1,
0.2226135, 0.510087, 0.3262134, 0, 0.2784314, 1, 1,
0.2264606, -1.010466, 2.13258, 0, 0.2745098, 1, 1,
0.2292872, 0.8799003, 2.468529, 0, 0.2666667, 1, 1,
0.2296387, -0.7503903, 1.33493, 0, 0.2627451, 1, 1,
0.2380028, 0.6185724, 1.370857, 0, 0.254902, 1, 1,
0.247285, 0.6957505, 0.2315728, 0, 0.2509804, 1, 1,
0.2474124, 0.1014755, 1.984293, 0, 0.2431373, 1, 1,
0.2488662, -0.8706502, 2.594178, 0, 0.2392157, 1, 1,
0.250113, -0.2596764, 2.007936, 0, 0.2313726, 1, 1,
0.2502845, 0.6723791, 1.487527, 0, 0.227451, 1, 1,
0.2530117, -2.193382, 3.025824, 0, 0.2196078, 1, 1,
0.2544426, -1.57539, 3.700286, 0, 0.2156863, 1, 1,
0.2606666, 0.3236899, -1.095326, 0, 0.2078431, 1, 1,
0.2671202, 0.0028074, 1.134398, 0, 0.2039216, 1, 1,
0.2687806, -0.6791381, 2.343166, 0, 0.1960784, 1, 1,
0.278228, 0.1969985, 1.474287, 0, 0.1882353, 1, 1,
0.2789855, -1.677015, 2.058021, 0, 0.1843137, 1, 1,
0.282332, 1.265048, 1.981962, 0, 0.1764706, 1, 1,
0.2827039, 0.809146, 0.8255334, 0, 0.172549, 1, 1,
0.282722, 0.3443897, 1.340681, 0, 0.1647059, 1, 1,
0.2828116, -0.3679404, 2.94387, 0, 0.1607843, 1, 1,
0.2846748, 0.1946851, 0.4930848, 0, 0.1529412, 1, 1,
0.2867198, 0.1791228, 0.8279344, 0, 0.1490196, 1, 1,
0.2898932, -0.1890305, 1.046686, 0, 0.1411765, 1, 1,
0.292358, -0.5399358, 1.9599, 0, 0.1372549, 1, 1,
0.293841, 1.73863, -0.8080183, 0, 0.1294118, 1, 1,
0.2975787, 1.374005, 1.410459, 0, 0.1254902, 1, 1,
0.2977006, -1.139456, 4.328151, 0, 0.1176471, 1, 1,
0.3016738, 0.4868501, 0.9944013, 0, 0.1137255, 1, 1,
0.3048233, 0.7041392, 1.124232, 0, 0.1058824, 1, 1,
0.3078565, -1.349958, 5.25474, 0, 0.09803922, 1, 1,
0.3124227, 0.5327809, 0.7125401, 0, 0.09411765, 1, 1,
0.3135767, 0.04966156, 0.327563, 0, 0.08627451, 1, 1,
0.317718, -1.291208, 2.005206, 0, 0.08235294, 1, 1,
0.3304626, 1.776831, -0.3666877, 0, 0.07450981, 1, 1,
0.3311283, 0.3261787, -0.7988336, 0, 0.07058824, 1, 1,
0.3312143, -0.5371684, 4.81043, 0, 0.0627451, 1, 1,
0.3329749, -1.104139, 2.54804, 0, 0.05882353, 1, 1,
0.3381701, -0.6466965, 3.012432, 0, 0.05098039, 1, 1,
0.3404302, -0.8554785, 3.136428, 0, 0.04705882, 1, 1,
0.3411129, -0.7190676, 3.138338, 0, 0.03921569, 1, 1,
0.3412742, 0.7780821, 0.1917811, 0, 0.03529412, 1, 1,
0.3421044, 1.507305, 1.219274, 0, 0.02745098, 1, 1,
0.3504437, -0.2422585, 2.680279, 0, 0.02352941, 1, 1,
0.3510399, 1.434653, 1.306695, 0, 0.01568628, 1, 1,
0.3527411, 1.17184, 2.010113, 0, 0.01176471, 1, 1,
0.3527817, -1.405526, 2.9572, 0, 0.003921569, 1, 1,
0.3545245, -0.3816617, 2.385215, 0.003921569, 0, 1, 1,
0.3572594, -0.5731636, 2.984791, 0.007843138, 0, 1, 1,
0.357944, -0.317458, 2.883361, 0.01568628, 0, 1, 1,
0.3610467, -0.3796517, 1.370515, 0.01960784, 0, 1, 1,
0.3614294, -1.633131, 1.8948, 0.02745098, 0, 1, 1,
0.3647429, -0.01482239, 0.6866749, 0.03137255, 0, 1, 1,
0.3659999, -1.944559, 3.634513, 0.03921569, 0, 1, 1,
0.3672403, 0.3449914, 1.532621, 0.04313726, 0, 1, 1,
0.3681206, 0.9153354, 1.334857, 0.05098039, 0, 1, 1,
0.3714189, 0.5633792, -0.3474649, 0.05490196, 0, 1, 1,
0.3717708, -0.04643112, 0.7210591, 0.0627451, 0, 1, 1,
0.3741667, 1.119756, 0.7649872, 0.06666667, 0, 1, 1,
0.3761608, -0.8035243, 1.779573, 0.07450981, 0, 1, 1,
0.3817402, -0.2763657, 1.693659, 0.07843138, 0, 1, 1,
0.3861463, -0.5052675, 1.206604, 0.08627451, 0, 1, 1,
0.3904381, 0.5769858, -0.6897409, 0.09019608, 0, 1, 1,
0.3965948, -1.729066, 3.673956, 0.09803922, 0, 1, 1,
0.4035873, 1.316824, 0.5638408, 0.1058824, 0, 1, 1,
0.409781, -1.336581, 2.505796, 0.1098039, 0, 1, 1,
0.4126239, -1.385112, 2.898768, 0.1176471, 0, 1, 1,
0.4180193, 0.842005, 0.2350542, 0.1215686, 0, 1, 1,
0.418371, -0.06834012, 1.61819, 0.1294118, 0, 1, 1,
0.4199728, -0.1239398, 1.478551, 0.1333333, 0, 1, 1,
0.4247395, 0.9245901, 0.768899, 0.1411765, 0, 1, 1,
0.4260538, -1.174625, 3.025329, 0.145098, 0, 1, 1,
0.4271012, -1.76703, 2.077298, 0.1529412, 0, 1, 1,
0.4277096, -0.4176683, 0.9901373, 0.1568628, 0, 1, 1,
0.4355609, -0.3156621, 2.621701, 0.1647059, 0, 1, 1,
0.4392944, 0.7990382, -1.770728, 0.1686275, 0, 1, 1,
0.4428419, -0.4803445, 1.976848, 0.1764706, 0, 1, 1,
0.4438248, 1.046179, -0.3033199, 0.1803922, 0, 1, 1,
0.449656, 0.05245638, 2.651861, 0.1882353, 0, 1, 1,
0.4497115, 1.070708, 1.350547, 0.1921569, 0, 1, 1,
0.4498647, 1.362347, 0.8771567, 0.2, 0, 1, 1,
0.4557332, 0.332422, 0.1956673, 0.2078431, 0, 1, 1,
0.457635, 0.3477996, 0.9786063, 0.2117647, 0, 1, 1,
0.4595996, 0.5012072, 1.000213, 0.2196078, 0, 1, 1,
0.461109, 0.2403353, 1.545379, 0.2235294, 0, 1, 1,
0.4613557, -0.795828, 3.237108, 0.2313726, 0, 1, 1,
0.4667006, -0.3494269, 2.10921, 0.2352941, 0, 1, 1,
0.4679485, -0.4130298, 3.165145, 0.2431373, 0, 1, 1,
0.4764812, 1.730365, 0.3486271, 0.2470588, 0, 1, 1,
0.4782921, -0.4667525, 1.080475, 0.254902, 0, 1, 1,
0.4791922, -0.9601204, 4.093159, 0.2588235, 0, 1, 1,
0.4815499, -0.5175115, 2.121739, 0.2666667, 0, 1, 1,
0.4887579, -0.9410112, 1.789795, 0.2705882, 0, 1, 1,
0.4887718, -0.1958406, 2.339965, 0.2784314, 0, 1, 1,
0.4905023, 1.044744, -0.1288991, 0.282353, 0, 1, 1,
0.4950268, 0.7949833, -0.004446086, 0.2901961, 0, 1, 1,
0.4968656, -0.1284623, 2.449819, 0.2941177, 0, 1, 1,
0.4978061, -0.2181714, 2.825783, 0.3019608, 0, 1, 1,
0.4980464, 1.400113, 0.8527151, 0.3098039, 0, 1, 1,
0.4988172, -1.648264, 2.901445, 0.3137255, 0, 1, 1,
0.4991257, -1.665215, 2.425034, 0.3215686, 0, 1, 1,
0.4993716, -0.9712534, 2.893523, 0.3254902, 0, 1, 1,
0.5034509, -1.950608, 2.802216, 0.3333333, 0, 1, 1,
0.5055665, -1.01116, 1.593887, 0.3372549, 0, 1, 1,
0.5072595, -0.4556524, 2.722978, 0.345098, 0, 1, 1,
0.5186288, -0.307947, 1.09481, 0.3490196, 0, 1, 1,
0.518647, 0.8946094, 0.9317162, 0.3568628, 0, 1, 1,
0.5231571, 0.4225029, 0.9468531, 0.3607843, 0, 1, 1,
0.5254878, 1.29012, -0.4564876, 0.3686275, 0, 1, 1,
0.527041, 1.706003, 0.2495752, 0.372549, 0, 1, 1,
0.5273883, 0.5132439, 3.269838, 0.3803922, 0, 1, 1,
0.5293876, -0.7663424, 2.718033, 0.3843137, 0, 1, 1,
0.5354629, -0.5261825, 0.3153095, 0.3921569, 0, 1, 1,
0.5512857, -0.3757511, 1.356279, 0.3960784, 0, 1, 1,
0.5565357, 1.797286, -0.4152427, 0.4039216, 0, 1, 1,
0.5620794, -2.357043, 3.991844, 0.4117647, 0, 1, 1,
0.5637472, -0.1412684, 2.063582, 0.4156863, 0, 1, 1,
0.5659642, 0.2964669, 0.7797517, 0.4235294, 0, 1, 1,
0.5666933, -0.3589016, 1.722949, 0.427451, 0, 1, 1,
0.5667358, 0.4996052, -0.02219649, 0.4352941, 0, 1, 1,
0.5673823, 0.7840935, -0.4574628, 0.4392157, 0, 1, 1,
0.5673838, 0.6642321, -0.06947967, 0.4470588, 0, 1, 1,
0.5676593, 0.4980021, 1.048526, 0.4509804, 0, 1, 1,
0.5718956, 1.325734, 1.384499, 0.4588235, 0, 1, 1,
0.5723369, 1.087565, 1.113592, 0.4627451, 0, 1, 1,
0.5727459, -0.3715758, 1.487085, 0.4705882, 0, 1, 1,
0.5741385, 0.4618042, -0.2335784, 0.4745098, 0, 1, 1,
0.5741872, 0.06448878, 0.2047956, 0.4823529, 0, 1, 1,
0.5803934, -0.260116, 3.404171, 0.4862745, 0, 1, 1,
0.5817344, -0.369701, 1.6882, 0.4941176, 0, 1, 1,
0.5920272, -1.651163, 2.255263, 0.5019608, 0, 1, 1,
0.5972253, -1.33831, 2.394373, 0.5058824, 0, 1, 1,
0.5977042, 1.091476, -0.8722788, 0.5137255, 0, 1, 1,
0.5988831, -0.443822, 2.933561, 0.5176471, 0, 1, 1,
0.5999684, 0.2568724, 2.965395, 0.5254902, 0, 1, 1,
0.6058316, -0.01340013, 2.73998, 0.5294118, 0, 1, 1,
0.60684, -0.7194368, 0.0610322, 0.5372549, 0, 1, 1,
0.6073121, -0.3620549, 2.416574, 0.5411765, 0, 1, 1,
0.6083521, -0.5661624, 0.5734192, 0.5490196, 0, 1, 1,
0.6132511, -0.8054745, 3.284788, 0.5529412, 0, 1, 1,
0.616329, 0.07034164, 1.396502, 0.5607843, 0, 1, 1,
0.6175805, -1.105901, 1.317437, 0.5647059, 0, 1, 1,
0.6182405, 1.0725, 1.405178, 0.572549, 0, 1, 1,
0.620627, -1.227682, 2.976106, 0.5764706, 0, 1, 1,
0.6269765, 1.135226, -0.1885168, 0.5843138, 0, 1, 1,
0.6288384, -0.1560024, 2.065854, 0.5882353, 0, 1, 1,
0.6304013, -0.1866598, 2.180457, 0.5960785, 0, 1, 1,
0.6359469, 0.280555, 0.8816703, 0.6039216, 0, 1, 1,
0.637659, -1.430849, 0.1336639, 0.6078432, 0, 1, 1,
0.6460987, -0.6645179, 3.320879, 0.6156863, 0, 1, 1,
0.6489364, -0.989423, 0.7652691, 0.6196079, 0, 1, 1,
0.649479, 1.731099, 1.218123, 0.627451, 0, 1, 1,
0.6550968, -2.406084, 2.601628, 0.6313726, 0, 1, 1,
0.6580136, 0.1325649, 0.09641719, 0.6392157, 0, 1, 1,
0.6610381, 0.288379, 1.395372, 0.6431373, 0, 1, 1,
0.6637608, -0.6154756, 3.212068, 0.6509804, 0, 1, 1,
0.6639141, 1.098288, 0.7028872, 0.654902, 0, 1, 1,
0.6659395, 0.4657234, 0.3415226, 0.6627451, 0, 1, 1,
0.6672823, 1.036265, -0.3644705, 0.6666667, 0, 1, 1,
0.6747154, 0.2180026, 2.429075, 0.6745098, 0, 1, 1,
0.6747679, 1.983041, 1.02836, 0.6784314, 0, 1, 1,
0.6748545, -0.5380193, 1.534736, 0.6862745, 0, 1, 1,
0.6882856, -0.7656944, 1.671173, 0.6901961, 0, 1, 1,
0.6915667, 0.1879129, 0.915671, 0.6980392, 0, 1, 1,
0.6942489, 0.6337163, 1.301028, 0.7058824, 0, 1, 1,
0.6963676, -0.6032186, 2.597088, 0.7098039, 0, 1, 1,
0.7007701, 1.188944, 0.5395239, 0.7176471, 0, 1, 1,
0.7021393, 0.3503081, -0.1088279, 0.7215686, 0, 1, 1,
0.7050796, 0.08348838, 0.855417, 0.7294118, 0, 1, 1,
0.7184411, -0.9090728, 3.062303, 0.7333333, 0, 1, 1,
0.7278895, -0.4430299, 3.214802, 0.7411765, 0, 1, 1,
0.7353265, 0.2950789, 1.28043, 0.7450981, 0, 1, 1,
0.7383409, 0.4363227, 0.8595788, 0.7529412, 0, 1, 1,
0.7391713, -1.033225, 0.8978865, 0.7568628, 0, 1, 1,
0.7400099, -1.501858, 4.269408, 0.7647059, 0, 1, 1,
0.7426147, -0.5507209, 1.29879, 0.7686275, 0, 1, 1,
0.7442271, -0.6749781, 1.937897, 0.7764706, 0, 1, 1,
0.7575825, 0.8344709, -1.014356, 0.7803922, 0, 1, 1,
0.7605225, 0.6090216, 1.429699, 0.7882353, 0, 1, 1,
0.7645981, 0.3894921, 0.6812096, 0.7921569, 0, 1, 1,
0.7692657, -0.125898, 0.9234502, 0.8, 0, 1, 1,
0.7745162, -0.6260216, 0.7247126, 0.8078431, 0, 1, 1,
0.7797778, -2.09121, 2.631476, 0.8117647, 0, 1, 1,
0.7869124, 0.6827514, 0.8730151, 0.8196079, 0, 1, 1,
0.7969576, 0.2276892, 2.001588, 0.8235294, 0, 1, 1,
0.7971247, -1.065821, 2.94942, 0.8313726, 0, 1, 1,
0.8098873, 1.542885, -2.133959, 0.8352941, 0, 1, 1,
0.8115827, 0.06948974, 1.848529, 0.8431373, 0, 1, 1,
0.8132418, -1.409299, 2.468984, 0.8470588, 0, 1, 1,
0.818304, -1.02151, 2.529713, 0.854902, 0, 1, 1,
0.8212638, -1.130897, 1.421071, 0.8588235, 0, 1, 1,
0.8213639, -0.5377496, 1.622416, 0.8666667, 0, 1, 1,
0.8245355, 0.295346, 0.1493055, 0.8705882, 0, 1, 1,
0.8254675, -1.925291, 3.37314, 0.8784314, 0, 1, 1,
0.8262191, -0.5615081, 1.98784, 0.8823529, 0, 1, 1,
0.8274972, 1.217555, 1.892342, 0.8901961, 0, 1, 1,
0.8283001, 0.2719642, 0.09976994, 0.8941177, 0, 1, 1,
0.8283981, -0.8765627, 3.385098, 0.9019608, 0, 1, 1,
0.8364142, -0.03199518, 1.047578, 0.9098039, 0, 1, 1,
0.8371298, -0.6488171, 0.1748336, 0.9137255, 0, 1, 1,
0.8466142, -1.718495, 1.814304, 0.9215686, 0, 1, 1,
0.8472639, 0.2745926, 1.022538, 0.9254902, 0, 1, 1,
0.8481681, -0.5335556, 2.053117, 0.9333333, 0, 1, 1,
0.8609246, -0.2442965, 2.538121, 0.9372549, 0, 1, 1,
0.8652005, -0.1735092, 1.673171, 0.945098, 0, 1, 1,
0.865771, -0.4933797, 2.137695, 0.9490196, 0, 1, 1,
0.867018, 0.2334403, 1.589831, 0.9568627, 0, 1, 1,
0.8759438, 0.725194, 1.293239, 0.9607843, 0, 1, 1,
0.8775985, 1.762186, 1.000389, 0.9686275, 0, 1, 1,
0.8845011, 1.009513, 1.383084, 0.972549, 0, 1, 1,
0.8846372, -0.3860259, 1.864246, 0.9803922, 0, 1, 1,
0.8905056, 0.5455311, -0.06293076, 0.9843137, 0, 1, 1,
0.8917047, -0.5019844, 2.864791, 0.9921569, 0, 1, 1,
0.8994663, 1.098252, 1.363177, 0.9960784, 0, 1, 1,
0.9015527, 1.623402, 0.1941527, 1, 0, 0.9960784, 1,
0.9074957, -0.478018, 0.2549585, 1, 0, 0.9882353, 1,
0.9154032, 0.194964, 1.405694, 1, 0, 0.9843137, 1,
0.920518, 0.9106145, 0.2375808, 1, 0, 0.9764706, 1,
0.9300025, 0.2748924, 0.8375918, 1, 0, 0.972549, 1,
0.9353518, -0.5045047, 1.72308, 1, 0, 0.9647059, 1,
0.9364426, 0.008100444, 1.941096, 1, 0, 0.9607843, 1,
0.9366109, 3.184466, -0.6233635, 1, 0, 0.9529412, 1,
0.9376656, 0.01743685, 1.794161, 1, 0, 0.9490196, 1,
0.9400274, -0.2449399, 0.9051614, 1, 0, 0.9411765, 1,
0.9401082, -0.1121936, 0.426244, 1, 0, 0.9372549, 1,
0.9459394, 0.07852823, 2.406947, 1, 0, 0.9294118, 1,
0.9485379, -1.343387, 2.955053, 1, 0, 0.9254902, 1,
0.973063, 1.339293, 1.489985, 1, 0, 0.9176471, 1,
0.9764867, 1.721365, 1.103569, 1, 0, 0.9137255, 1,
0.9819603, 0.9210082, 1.596538, 1, 0, 0.9058824, 1,
0.983734, 1.49956, 1.144482, 1, 0, 0.9019608, 1,
0.9867322, 0.2873317, 1.247998, 1, 0, 0.8941177, 1,
0.987166, -1.094772, 3.760463, 1, 0, 0.8862745, 1,
0.9922189, 0.7000393, 0.4665954, 1, 0, 0.8823529, 1,
1.000293, -1.99819, 2.756014, 1, 0, 0.8745098, 1,
1.016422, 0.2890295, 1.396492, 1, 0, 0.8705882, 1,
1.022378, 0.873379, 0.186, 1, 0, 0.8627451, 1,
1.030728, 0.3479611, 0.2654577, 1, 0, 0.8588235, 1,
1.040868, 0.9687914, 1.449081, 1, 0, 0.8509804, 1,
1.048937, -0.4300046, 2.259412, 1, 0, 0.8470588, 1,
1.050001, 0.2868844, 0.9972719, 1, 0, 0.8392157, 1,
1.075781, -0.09104045, 0.4502435, 1, 0, 0.8352941, 1,
1.089212, 0.3432977, 2.837875, 1, 0, 0.827451, 1,
1.089657, -0.1537734, 0.6930813, 1, 0, 0.8235294, 1,
1.094443, 0.8194055, 3.049646, 1, 0, 0.8156863, 1,
1.107542, -0.6700037, 1.777194, 1, 0, 0.8117647, 1,
1.114431, -0.7787428, 3.23005, 1, 0, 0.8039216, 1,
1.115064, 1.289999, 0.2535601, 1, 0, 0.7960784, 1,
1.119361, -0.09769242, 1.555601, 1, 0, 0.7921569, 1,
1.131524, 0.4632295, 0.8535624, 1, 0, 0.7843137, 1,
1.137217, 0.8597263, 2.534056, 1, 0, 0.7803922, 1,
1.138412, -0.98862, 0.9729739, 1, 0, 0.772549, 1,
1.141136, 0.4477711, 3.490422, 1, 0, 0.7686275, 1,
1.142613, -1.07748, 0.6108654, 1, 0, 0.7607843, 1,
1.144496, 0.7506043, 0.365227, 1, 0, 0.7568628, 1,
1.17468, 0.5080093, -0.1843814, 1, 0, 0.7490196, 1,
1.178003, -0.4422796, 2.701306, 1, 0, 0.7450981, 1,
1.184638, 0.7739207, -0.1549623, 1, 0, 0.7372549, 1,
1.194104, 0.9152817, 0.678954, 1, 0, 0.7333333, 1,
1.200863, -0.342413, 2.795147, 1, 0, 0.7254902, 1,
1.201303, -1.168111, 3.323314, 1, 0, 0.7215686, 1,
1.206254, -0.8911995, 0.7838211, 1, 0, 0.7137255, 1,
1.234192, -1.165533, 4.049277, 1, 0, 0.7098039, 1,
1.239195, 0.4254953, -0.6605177, 1, 0, 0.7019608, 1,
1.254818, -0.4076276, 0.9833142, 1, 0, 0.6941177, 1,
1.261955, -0.06894366, 1.463602, 1, 0, 0.6901961, 1,
1.272504, -0.4524203, 3.270186, 1, 0, 0.682353, 1,
1.27392, -0.1187196, 0.3403028, 1, 0, 0.6784314, 1,
1.276405, -0.2706954, 2.450144, 1, 0, 0.6705883, 1,
1.279028, 1.139844, -0.1265378, 1, 0, 0.6666667, 1,
1.280766, 0.7049791, 0.4135236, 1, 0, 0.6588235, 1,
1.283503, -0.4908013, 1.463274, 1, 0, 0.654902, 1,
1.286856, 0.3615992, 2.029558, 1, 0, 0.6470588, 1,
1.288939, 0.4600581, 2.164408, 1, 0, 0.6431373, 1,
1.290631, 0.8483877, 0.8169399, 1, 0, 0.6352941, 1,
1.291603, -0.8285959, 0.5884979, 1, 0, 0.6313726, 1,
1.291738, -1.888196, 3.638339, 1, 0, 0.6235294, 1,
1.304833, 1.335843, 2.075816, 1, 0, 0.6196079, 1,
1.305703, -0.3511296, 2.575242, 1, 0, 0.6117647, 1,
1.312936, -0.1146868, 2.571021, 1, 0, 0.6078432, 1,
1.31301, -0.299269, 1.90299, 1, 0, 0.6, 1,
1.313047, -0.06624511, 2.72104, 1, 0, 0.5921569, 1,
1.315282, 0.689302, -0.7487475, 1, 0, 0.5882353, 1,
1.347681, -2.406355, 3.672486, 1, 0, 0.5803922, 1,
1.352736, -1.493665, 1.847303, 1, 0, 0.5764706, 1,
1.358244, 0.2662179, 1.316366, 1, 0, 0.5686275, 1,
1.378821, -0.5113839, 3.309779, 1, 0, 0.5647059, 1,
1.38491, -1.095587, 2.051842, 1, 0, 0.5568628, 1,
1.38689, 0.2703587, 2.334805, 1, 0, 0.5529412, 1,
1.389731, -0.7783492, 4.007782, 1, 0, 0.5450981, 1,
1.394825, -0.9789175, 1.61684, 1, 0, 0.5411765, 1,
1.404315, 0.81792, 0.6383711, 1, 0, 0.5333334, 1,
1.40806, -0.331286, 0.6668432, 1, 0, 0.5294118, 1,
1.423879, 0.7939286, 2.003062, 1, 0, 0.5215687, 1,
1.426594, -0.8695235, 2.142712, 1, 0, 0.5176471, 1,
1.42704, 0.1391687, 1.688026, 1, 0, 0.509804, 1,
1.435619, -0.4064331, 1.55099, 1, 0, 0.5058824, 1,
1.444671, -1.184661, 1.985627, 1, 0, 0.4980392, 1,
1.445856, 1.143985, -0.9087994, 1, 0, 0.4901961, 1,
1.44719, -0.6733901, 2.313563, 1, 0, 0.4862745, 1,
1.449291, 0.08245511, 1.992842, 1, 0, 0.4784314, 1,
1.455751, 0.3772617, 1.663751, 1, 0, 0.4745098, 1,
1.4576, -1.500084, 3.492383, 1, 0, 0.4666667, 1,
1.460791, 0.9228789, 1.531613, 1, 0, 0.4627451, 1,
1.462449, -0.04982688, 0.2713279, 1, 0, 0.454902, 1,
1.465824, -1.181119, 2.782888, 1, 0, 0.4509804, 1,
1.477679, -0.06582482, 0.9082269, 1, 0, 0.4431373, 1,
1.483626, -0.4143192, 3.128973, 1, 0, 0.4392157, 1,
1.486734, -0.6792592, 1.248848, 1, 0, 0.4313726, 1,
1.486743, -1.822492, 1.676351, 1, 0, 0.427451, 1,
1.496693, -1.434577, 2.990591, 1, 0, 0.4196078, 1,
1.511476, 1.954759, -1.546055, 1, 0, 0.4156863, 1,
1.515897, -0.9254681, 0.4660488, 1, 0, 0.4078431, 1,
1.543128, 1.010856, 0.9601258, 1, 0, 0.4039216, 1,
1.573861, -0.6627235, 0.6835021, 1, 0, 0.3960784, 1,
1.584427, -0.8625263, 1.450737, 1, 0, 0.3882353, 1,
1.586669, 0.4100769, 2.834492, 1, 0, 0.3843137, 1,
1.58954, 0.583715, 2.517831, 1, 0, 0.3764706, 1,
1.600238, 0.2430282, 2.124903, 1, 0, 0.372549, 1,
1.603979, -0.2018971, 1.246817, 1, 0, 0.3647059, 1,
1.637848, 0.9224172, 1.194442, 1, 0, 0.3607843, 1,
1.640695, -1.318556, 1.144468, 1, 0, 0.3529412, 1,
1.649189, -0.8796842, -0.0444111, 1, 0, 0.3490196, 1,
1.657627, -0.3126999, 1.098643, 1, 0, 0.3411765, 1,
1.667732, 2.354539, -0.8009402, 1, 0, 0.3372549, 1,
1.681837, -1.135418, 0.5544359, 1, 0, 0.3294118, 1,
1.684575, 0.6524342, 0.3230775, 1, 0, 0.3254902, 1,
1.684806, 0.0473173, 3.636886, 1, 0, 0.3176471, 1,
1.700984, -0.2129207, 0.2192393, 1, 0, 0.3137255, 1,
1.729732, -0.2991658, 2.032031, 1, 0, 0.3058824, 1,
1.744403, 0.5057102, 1.112682, 1, 0, 0.2980392, 1,
1.745777, 1.390187, -1.98202, 1, 0, 0.2941177, 1,
1.753386, 0.2701176, 1.692579, 1, 0, 0.2862745, 1,
1.755599, -0.2808378, 2.091807, 1, 0, 0.282353, 1,
1.759851, -0.5198847, 2.395105, 1, 0, 0.2745098, 1,
1.776445, 0.6880941, 1.324632, 1, 0, 0.2705882, 1,
1.7802, -2.081749, 3.069924, 1, 0, 0.2627451, 1,
1.788079, -1.380361, 2.229616, 1, 0, 0.2588235, 1,
1.806057, -0.04852306, 1.888819, 1, 0, 0.2509804, 1,
1.807442, -2.22652, 3.031991, 1, 0, 0.2470588, 1,
1.81044, -2.488605, 2.011422, 1, 0, 0.2392157, 1,
1.825684, -0.335347, -0.5144423, 1, 0, 0.2352941, 1,
1.836279, -0.1302265, 2.412823, 1, 0, 0.227451, 1,
1.841109, 1.24284, -0.5941772, 1, 0, 0.2235294, 1,
1.858578, -1.353172, 0.5447477, 1, 0, 0.2156863, 1,
1.909706, -0.002765073, -0.2344247, 1, 0, 0.2117647, 1,
1.913645, -1.855981, 3.036351, 1, 0, 0.2039216, 1,
1.917019, -0.1615763, 2.428689, 1, 0, 0.1960784, 1,
1.943211, 0.3746921, 0.7657332, 1, 0, 0.1921569, 1,
1.963269, -0.7618671, 1.926002, 1, 0, 0.1843137, 1,
1.971696, -0.8370266, 2.596313, 1, 0, 0.1803922, 1,
1.977014, 1.324862, 0.3608715, 1, 0, 0.172549, 1,
1.979643, -1.631558, 3.315089, 1, 0, 0.1686275, 1,
1.980654, 0.3895097, 0.1300007, 1, 0, 0.1607843, 1,
2.029359, 0.5361001, 1.930466, 1, 0, 0.1568628, 1,
2.034383, 0.3130812, 3.746467, 1, 0, 0.1490196, 1,
2.054301, 1.296184, -0.5295135, 1, 0, 0.145098, 1,
2.057884, 0.9326231, 1.735416, 1, 0, 0.1372549, 1,
2.102936, 0.6978741, -0.3002038, 1, 0, 0.1333333, 1,
2.106474, -0.1552343, 0.1795807, 1, 0, 0.1254902, 1,
2.111592, 1.285408, 2.970882, 1, 0, 0.1215686, 1,
2.125632, -0.3929733, 1.545654, 1, 0, 0.1137255, 1,
2.138596, 0.07882813, 1.09453, 1, 0, 0.1098039, 1,
2.183683, -0.9234952, 1.53543, 1, 0, 0.1019608, 1,
2.203936, -1.04895, 2.817284, 1, 0, 0.09411765, 1,
2.217278, -0.9564686, 0.9560571, 1, 0, 0.09019608, 1,
2.23401, 0.03708408, 2.201923, 1, 0, 0.08235294, 1,
2.240213, 0.6477538, 1.376511, 1, 0, 0.07843138, 1,
2.245715, -0.7723749, 1.649495, 1, 0, 0.07058824, 1,
2.328725, -0.3855118, 2.735939, 1, 0, 0.06666667, 1,
2.3577, 1.214797, -0.3660667, 1, 0, 0.05882353, 1,
2.380391, -0.6307734, 2.54916, 1, 0, 0.05490196, 1,
2.389093, 1.003154, 1.395653, 1, 0, 0.04705882, 1,
2.426428, -1.230827, 3.493373, 1, 0, 0.04313726, 1,
2.447022, -0.18115, 1.858593, 1, 0, 0.03529412, 1,
2.598539, 0.9938706, 1.701698, 1, 0, 0.03137255, 1,
2.768607, 1.486144, -0.4717704, 1, 0, 0.02352941, 1,
3.138861, 0.987815, 1.594421, 1, 0, 0.01960784, 1,
3.638934, 1.157377, 1.366207, 1, 0, 0.01176471, 1,
3.870182, 0.6506342, -0.2550287, 1, 0, 0.007843138, 1
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
0.4546525, -5.150876, -7.102137, 0, -0.5, 0.5, 0.5,
0.4546525, -5.150876, -7.102137, 1, -0.5, 0.5, 0.5,
0.4546525, -5.150876, -7.102137, 1, 1.5, 0.5, 0.5,
0.4546525, -5.150876, -7.102137, 0, 1.5, 0.5, 0.5
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
-4.118741, -0.379169, -7.102137, 0, -0.5, 0.5, 0.5,
-4.118741, -0.379169, -7.102137, 1, -0.5, 0.5, 0.5,
-4.118741, -0.379169, -7.102137, 1, 1.5, 0.5, 0.5,
-4.118741, -0.379169, -7.102137, 0, 1.5, 0.5, 0.5
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
-4.118741, -5.150876, 0.02882075, 0, -0.5, 0.5, 0.5,
-4.118741, -5.150876, 0.02882075, 1, -0.5, 0.5, 0.5,
-4.118741, -5.150876, 0.02882075, 1, 1.5, 0.5, 0.5,
-4.118741, -5.150876, 0.02882075, 0, 1.5, 0.5, 0.5
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
-2, -4.049713, -5.456531,
3, -4.049713, -5.456531,
-2, -4.049713, -5.456531,
-2, -4.23324, -5.730799,
-1, -4.049713, -5.456531,
-1, -4.23324, -5.730799,
0, -4.049713, -5.456531,
0, -4.23324, -5.730799,
1, -4.049713, -5.456531,
1, -4.23324, -5.730799,
2, -4.049713, -5.456531,
2, -4.23324, -5.730799,
3, -4.049713, -5.456531,
3, -4.23324, -5.730799
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
-2, -4.600294, -6.279334, 0, -0.5, 0.5, 0.5,
-2, -4.600294, -6.279334, 1, -0.5, 0.5, 0.5,
-2, -4.600294, -6.279334, 1, 1.5, 0.5, 0.5,
-2, -4.600294, -6.279334, 0, 1.5, 0.5, 0.5,
-1, -4.600294, -6.279334, 0, -0.5, 0.5, 0.5,
-1, -4.600294, -6.279334, 1, -0.5, 0.5, 0.5,
-1, -4.600294, -6.279334, 1, 1.5, 0.5, 0.5,
-1, -4.600294, -6.279334, 0, 1.5, 0.5, 0.5,
0, -4.600294, -6.279334, 0, -0.5, 0.5, 0.5,
0, -4.600294, -6.279334, 1, -0.5, 0.5, 0.5,
0, -4.600294, -6.279334, 1, 1.5, 0.5, 0.5,
0, -4.600294, -6.279334, 0, 1.5, 0.5, 0.5,
1, -4.600294, -6.279334, 0, -0.5, 0.5, 0.5,
1, -4.600294, -6.279334, 1, -0.5, 0.5, 0.5,
1, -4.600294, -6.279334, 1, 1.5, 0.5, 0.5,
1, -4.600294, -6.279334, 0, 1.5, 0.5, 0.5,
2, -4.600294, -6.279334, 0, -0.5, 0.5, 0.5,
2, -4.600294, -6.279334, 1, -0.5, 0.5, 0.5,
2, -4.600294, -6.279334, 1, 1.5, 0.5, 0.5,
2, -4.600294, -6.279334, 0, 1.5, 0.5, 0.5,
3, -4.600294, -6.279334, 0, -0.5, 0.5, 0.5,
3, -4.600294, -6.279334, 1, -0.5, 0.5, 0.5,
3, -4.600294, -6.279334, 1, 1.5, 0.5, 0.5,
3, -4.600294, -6.279334, 0, 1.5, 0.5, 0.5
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
-3.063342, -2, -5.456531,
-3.063342, 2, -5.456531,
-3.063342, -2, -5.456531,
-3.239242, -2, -5.730799,
-3.063342, 0, -5.456531,
-3.239242, 0, -5.730799,
-3.063342, 2, -5.456531,
-3.239242, 2, -5.730799
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
"0",
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
-3.591042, -2, -6.279334, 0, -0.5, 0.5, 0.5,
-3.591042, -2, -6.279334, 1, -0.5, 0.5, 0.5,
-3.591042, -2, -6.279334, 1, 1.5, 0.5, 0.5,
-3.591042, -2, -6.279334, 0, 1.5, 0.5, 0.5,
-3.591042, 0, -6.279334, 0, -0.5, 0.5, 0.5,
-3.591042, 0, -6.279334, 1, -0.5, 0.5, 0.5,
-3.591042, 0, -6.279334, 1, 1.5, 0.5, 0.5,
-3.591042, 0, -6.279334, 0, 1.5, 0.5, 0.5,
-3.591042, 2, -6.279334, 0, -0.5, 0.5, 0.5,
-3.591042, 2, -6.279334, 1, -0.5, 0.5, 0.5,
-3.591042, 2, -6.279334, 1, 1.5, 0.5, 0.5,
-3.591042, 2, -6.279334, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.063342, -4.049713, -4,
-3.063342, -4.049713, 4,
-3.063342, -4.049713, -4,
-3.239242, -4.23324, -4,
-3.063342, -4.049713, -2,
-3.239242, -4.23324, -2,
-3.063342, -4.049713, 0,
-3.239242, -4.23324, 0,
-3.063342, -4.049713, 2,
-3.239242, -4.23324, 2,
-3.063342, -4.049713, 4,
-3.239242, -4.23324, 4
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
-3.591042, -4.600294, -4, 0, -0.5, 0.5, 0.5,
-3.591042, -4.600294, -4, 1, -0.5, 0.5, 0.5,
-3.591042, -4.600294, -4, 1, 1.5, 0.5, 0.5,
-3.591042, -4.600294, -4, 0, 1.5, 0.5, 0.5,
-3.591042, -4.600294, -2, 0, -0.5, 0.5, 0.5,
-3.591042, -4.600294, -2, 1, -0.5, 0.5, 0.5,
-3.591042, -4.600294, -2, 1, 1.5, 0.5, 0.5,
-3.591042, -4.600294, -2, 0, 1.5, 0.5, 0.5,
-3.591042, -4.600294, 0, 0, -0.5, 0.5, 0.5,
-3.591042, -4.600294, 0, 1, -0.5, 0.5, 0.5,
-3.591042, -4.600294, 0, 1, 1.5, 0.5, 0.5,
-3.591042, -4.600294, 0, 0, 1.5, 0.5, 0.5,
-3.591042, -4.600294, 2, 0, -0.5, 0.5, 0.5,
-3.591042, -4.600294, 2, 1, -0.5, 0.5, 0.5,
-3.591042, -4.600294, 2, 1, 1.5, 0.5, 0.5,
-3.591042, -4.600294, 2, 0, 1.5, 0.5, 0.5,
-3.591042, -4.600294, 4, 0, -0.5, 0.5, 0.5,
-3.591042, -4.600294, 4, 1, -0.5, 0.5, 0.5,
-3.591042, -4.600294, 4, 1, 1.5, 0.5, 0.5,
-3.591042, -4.600294, 4, 0, 1.5, 0.5, 0.5
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
-3.063342, -4.049713, -5.456531,
-3.063342, 3.291375, -5.456531,
-3.063342, -4.049713, 5.514173,
-3.063342, 3.291375, 5.514173,
-3.063342, -4.049713, -5.456531,
-3.063342, -4.049713, 5.514173,
-3.063342, 3.291375, -5.456531,
-3.063342, 3.291375, 5.514173,
-3.063342, -4.049713, -5.456531,
3.972647, -4.049713, -5.456531,
-3.063342, -4.049713, 5.514173,
3.972647, -4.049713, 5.514173,
-3.063342, 3.291375, -5.456531,
3.972647, 3.291375, -5.456531,
-3.063342, 3.291375, 5.514173,
3.972647, 3.291375, 5.514173,
3.972647, -4.049713, -5.456531,
3.972647, 3.291375, -5.456531,
3.972647, -4.049713, 5.514173,
3.972647, 3.291375, 5.514173,
3.972647, -4.049713, -5.456531,
3.972647, -4.049713, 5.514173,
3.972647, 3.291375, -5.456531,
3.972647, 3.291375, 5.514173
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
var radius = 7.987483;
var distance = 35.53721;
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
mvMatrix.translate( -0.4546525, 0.379169, -0.02882075 );
mvMatrix.scale( 1.227435, 1.176423, 0.7872078 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.53721);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
O-2-methoxycarbonylp<-read.table("O-2-methoxycarbonylp.xyz")
```

```
## Error in read.table("O-2-methoxycarbonylp.xyz"): no lines available in input
```

```r
x<-O-2-methoxycarbonylp$V2
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
y<-O-2-methoxycarbonylp$V3
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
```

```r
z<-O-2-methoxycarbonylp$V4
```

```
## Error in eval(expr, envir, enclos): object 'O' not found
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
-2.960876, 1.555562, -1.340478, 0, 0, 1, 1, 1,
-2.699614, -0.2823285, -2.113581, 1, 0, 0, 1, 1,
-2.606439, -0.2439075, -2.259782, 1, 0, 0, 1, 1,
-2.545929, -1.779008, -2.608024, 1, 0, 0, 1, 1,
-2.542389, -0.3764486, -3.503507, 1, 0, 0, 1, 1,
-2.524738, 0.130377, -1.916013, 1, 0, 0, 1, 1,
-2.506266, -0.6374229, -1.405828, 0, 0, 0, 1, 1,
-2.503234, -0.5902368, -1.56915, 0, 0, 0, 1, 1,
-2.481566, -0.08728202, -0.9558094, 0, 0, 0, 1, 1,
-2.476902, 0.9362075, -2.336513, 0, 0, 0, 1, 1,
-2.397866, 0.1874457, -2.868177, 0, 0, 0, 1, 1,
-2.384789, -0.2199048, -1.948689, 0, 0, 0, 1, 1,
-2.359026, 0.5822347, -1.510847, 0, 0, 0, 1, 1,
-2.353679, 0.4857185, -0.7739948, 1, 1, 1, 1, 1,
-2.33249, -0.3436548, -0.8305596, 1, 1, 1, 1, 1,
-2.284364, 0.8350131, -0.5649704, 1, 1, 1, 1, 1,
-2.245024, 0.4695337, -2.908746, 1, 1, 1, 1, 1,
-2.214758, -0.9411893, -1.866107, 1, 1, 1, 1, 1,
-2.203206, -1.754053, 1.382871, 1, 1, 1, 1, 1,
-2.19674, -0.1547198, -2.780333, 1, 1, 1, 1, 1,
-2.091258, -1.967292, -1.252795, 1, 1, 1, 1, 1,
-2.053465, -1.65181, -2.169348, 1, 1, 1, 1, 1,
-2.024745, -0.3513976, -0.7195381, 1, 1, 1, 1, 1,
-2.011091, 0.05586871, -2.231323, 1, 1, 1, 1, 1,
-2.01065, -1.513402, -3.530118, 1, 1, 1, 1, 1,
-2.006466, 0.5666805, -1.467981, 1, 1, 1, 1, 1,
-1.986536, 0.09741544, -1.739367, 1, 1, 1, 1, 1,
-1.970659, 0.2763787, -1.667622, 1, 1, 1, 1, 1,
-1.960174, 0.3990383, -2.6072, 0, 0, 1, 1, 1,
-1.955719, -0.2271166, -1.852713, 1, 0, 0, 1, 1,
-1.943323, 0.2142578, -1.975238, 1, 0, 0, 1, 1,
-1.942183, -1.962525, -3.198266, 1, 0, 0, 1, 1,
-1.883176, -0.3339792, -1.831885, 1, 0, 0, 1, 1,
-1.869584, 0.4057781, -1.837408, 1, 0, 0, 1, 1,
-1.860484, 1.728249, -0.7624598, 0, 0, 0, 1, 1,
-1.858701, 0.5753791, -0.9046918, 0, 0, 0, 1, 1,
-1.858366, 0.3933521, -2.916563, 0, 0, 0, 1, 1,
-1.844445, 0.0539774, -2.181772, 0, 0, 0, 1, 1,
-1.829401, 0.1382919, -2.941839, 0, 0, 0, 1, 1,
-1.821026, 0.9874073, -2.829871, 0, 0, 0, 1, 1,
-1.803302, 0.2076204, -1.051913, 0, 0, 0, 1, 1,
-1.80049, -1.168406, -1.90052, 1, 1, 1, 1, 1,
-1.75529, -2.328076, -4.716037, 1, 1, 1, 1, 1,
-1.752511, -0.9552534, -1.82697, 1, 1, 1, 1, 1,
-1.750811, 1.166986, -1.048877, 1, 1, 1, 1, 1,
-1.726278, 0.2811253, -1.676432, 1, 1, 1, 1, 1,
-1.711161, 0.0169388, -3.377838, 1, 1, 1, 1, 1,
-1.686353, 1.822815, 1.291347, 1, 1, 1, 1, 1,
-1.67586, 0.817361, -1.731346, 1, 1, 1, 1, 1,
-1.67507, -0.4174425, -0.3966781, 1, 1, 1, 1, 1,
-1.671308, -0.4150376, -1.450066, 1, 1, 1, 1, 1,
-1.662483, -1.379584, -1.993478, 1, 1, 1, 1, 1,
-1.659237, 1.541116, -1.823143, 1, 1, 1, 1, 1,
-1.65748, 1.601689, 0.6964262, 1, 1, 1, 1, 1,
-1.657094, 0.6736526, -2.052524, 1, 1, 1, 1, 1,
-1.652402, 0.8263887, -1.092395, 1, 1, 1, 1, 1,
-1.650331, -1.452433, -2.287112, 0, 0, 1, 1, 1,
-1.647123, 1.219035, -0.3102739, 1, 0, 0, 1, 1,
-1.645396, 0.7848697, -1.60189, 1, 0, 0, 1, 1,
-1.637373, -0.2587023, -1.345942, 1, 0, 0, 1, 1,
-1.633302, -0.4370423, -2.180245, 1, 0, 0, 1, 1,
-1.605782, 0.4217887, -2.086827, 1, 0, 0, 1, 1,
-1.594491, -0.4409702, -2.807492, 0, 0, 0, 1, 1,
-1.583487, 0.1160255, 0.1850843, 0, 0, 0, 1, 1,
-1.578753, 0.4709609, -1.394216, 0, 0, 0, 1, 1,
-1.56615, 0.5621615, -1.732539, 0, 0, 0, 1, 1,
-1.551699, 0.5231117, -0.4060363, 0, 0, 0, 1, 1,
-1.531836, 0.6998547, -0.07100142, 0, 0, 0, 1, 1,
-1.525194, -1.313268, -4.649222, 0, 0, 0, 1, 1,
-1.512875, 1.446338, -1.240504, 1, 1, 1, 1, 1,
-1.505288, -0.1301943, -1.039211, 1, 1, 1, 1, 1,
-1.502997, -0.2459529, -0.1661568, 1, 1, 1, 1, 1,
-1.492614, -0.3093629, -2.806968, 1, 1, 1, 1, 1,
-1.489674, -0.1665495, -1.615909, 1, 1, 1, 1, 1,
-1.480108, 0.3584631, -1.277049, 1, 1, 1, 1, 1,
-1.445144, -0.118171, -2.021814, 1, 1, 1, 1, 1,
-1.442549, -0.4414284, -1.060368, 1, 1, 1, 1, 1,
-1.440093, -0.2325038, -1.303749, 1, 1, 1, 1, 1,
-1.432141, -0.1550902, -1.667985, 1, 1, 1, 1, 1,
-1.418273, 1.215753, -1.445375, 1, 1, 1, 1, 1,
-1.409383, -0.1664537, -1.720958, 1, 1, 1, 1, 1,
-1.400818, 0.2860107, -0.8835804, 1, 1, 1, 1, 1,
-1.39911, -2.095449, -2.678269, 1, 1, 1, 1, 1,
-1.394298, -1.918153, -2.36738, 1, 1, 1, 1, 1,
-1.387343, -0.4996515, -1.614264, 0, 0, 1, 1, 1,
-1.386731, -2.539711, -3.776265, 1, 0, 0, 1, 1,
-1.370876, 0.209423, -2.534582, 1, 0, 0, 1, 1,
-1.367955, -0.7980026, -2.304904, 1, 0, 0, 1, 1,
-1.359977, 0.2866223, -1.39528, 1, 0, 0, 1, 1,
-1.355983, -0.7417061, -1.871348, 1, 0, 0, 1, 1,
-1.334282, 0.6478486, -0.5095761, 0, 0, 0, 1, 1,
-1.330369, 1.071845, 0.4909572, 0, 0, 0, 1, 1,
-1.328017, 0.9043058, -0.09724062, 0, 0, 0, 1, 1,
-1.308995, 0.5462143, -0.1501885, 0, 0, 0, 1, 1,
-1.30877, 0.6074502, -1.378661, 0, 0, 0, 1, 1,
-1.305727, -1.626428, -3.59059, 0, 0, 0, 1, 1,
-1.3016, 0.15872, -0.2308334, 0, 0, 0, 1, 1,
-1.296777, -0.07942547, -2.054724, 1, 1, 1, 1, 1,
-1.295352, -0.9137605, -2.626374, 1, 1, 1, 1, 1,
-1.293786, 0.604015, -0.9789051, 1, 1, 1, 1, 1,
-1.287672, -0.1733546, -0.7426165, 1, 1, 1, 1, 1,
-1.280225, -0.1255266, -1.7028, 1, 1, 1, 1, 1,
-1.277332, -1.018219, -0.7335825, 1, 1, 1, 1, 1,
-1.264833, -1.481733, -3.332718, 1, 1, 1, 1, 1,
-1.257599, 0.849313, -1.452038, 1, 1, 1, 1, 1,
-1.256224, 0.2831739, -1.638009, 1, 1, 1, 1, 1,
-1.241343, -0.5611836, -1.078599, 1, 1, 1, 1, 1,
-1.237798, 0.1704496, -0.4696207, 1, 1, 1, 1, 1,
-1.233847, 0.07532412, -1.276828, 1, 1, 1, 1, 1,
-1.227861, -1.520456, -2.596373, 1, 1, 1, 1, 1,
-1.227115, -0.6938332, -2.212464, 1, 1, 1, 1, 1,
-1.222787, -1.483804, -2.739914, 1, 1, 1, 1, 1,
-1.221917, -0.5971772, -2.166557, 0, 0, 1, 1, 1,
-1.217102, -0.08120368, -0.844375, 1, 0, 0, 1, 1,
-1.211077, -0.6948794, -0.05490797, 1, 0, 0, 1, 1,
-1.210351, 1.523811, -0.4524595, 1, 0, 0, 1, 1,
-1.207731, 0.4002026, 0.1976732, 1, 0, 0, 1, 1,
-1.207103, 1.922887, -0.0373942, 1, 0, 0, 1, 1,
-1.201642, -0.6782322, -0.3438779, 0, 0, 0, 1, 1,
-1.200374, -0.126814, -2.068495, 0, 0, 0, 1, 1,
-1.199772, 1.177105, -1.948871, 0, 0, 0, 1, 1,
-1.198756, -1.934804, -2.85606, 0, 0, 0, 1, 1,
-1.195697, -1.040814, -2.542019, 0, 0, 0, 1, 1,
-1.195275, 1.520253, 2.016339, 0, 0, 0, 1, 1,
-1.190771, -0.4230801, -2.422845, 0, 0, 0, 1, 1,
-1.188837, -1.183302, -1.388613, 1, 1, 1, 1, 1,
-1.188263, -0.002306368, -1.311313, 1, 1, 1, 1, 1,
-1.182981, -0.05110995, 1.002675, 1, 1, 1, 1, 1,
-1.179141, -1.162607, -4.388759, 1, 1, 1, 1, 1,
-1.169088, -0.6032637, -0.7675938, 1, 1, 1, 1, 1,
-1.166297, -0.2057588, -1.770642, 1, 1, 1, 1, 1,
-1.160623, 1.70733, -1.322126, 1, 1, 1, 1, 1,
-1.157197, 0.534124, -0.5608982, 1, 1, 1, 1, 1,
-1.155803, 1.381335, -0.02080336, 1, 1, 1, 1, 1,
-1.15379, -0.458996, -2.202112, 1, 1, 1, 1, 1,
-1.145928, 1.078387, 0.02454133, 1, 1, 1, 1, 1,
-1.144138, -2.3937, -2.856098, 1, 1, 1, 1, 1,
-1.143882, -1.301487, -4.767941, 1, 1, 1, 1, 1,
-1.141832, 0.6187097, 1.336173, 1, 1, 1, 1, 1,
-1.127296, -0.5605115, -2.04751, 1, 1, 1, 1, 1,
-1.123901, -0.06402082, -1.607576, 0, 0, 1, 1, 1,
-1.123415, 0.8768134, 0.9229553, 1, 0, 0, 1, 1,
-1.121591, -0.1613356, -0.9896622, 1, 0, 0, 1, 1,
-1.117397, 0.4517033, -2.720723, 1, 0, 0, 1, 1,
-1.114353, -1.827005, -1.652117, 1, 0, 0, 1, 1,
-1.114317, 0.2409762, 0.5279979, 1, 0, 0, 1, 1,
-1.110249, -0.2207424, -0.9055342, 0, 0, 0, 1, 1,
-1.108574, -0.5953919, -2.187636, 0, 0, 0, 1, 1,
-1.100462, -0.6966568, -3.156428, 0, 0, 0, 1, 1,
-1.087796, 0.2661109, -0.9853585, 0, 0, 0, 1, 1,
-1.084344, -1.096809, -1.465236, 0, 0, 0, 1, 1,
-1.076866, -1.72289, -2.813964, 0, 0, 0, 1, 1,
-1.068821, -0.6095022, -1.113607, 0, 0, 0, 1, 1,
-1.063439, 1.339963, -2.577954, 1, 1, 1, 1, 1,
-1.063227, 1.14176, 1.653497, 1, 1, 1, 1, 1,
-1.061259, 0.06531037, -3.505385, 1, 1, 1, 1, 1,
-1.057438, 0.05685842, -1.792662, 1, 1, 1, 1, 1,
-1.053807, -0.01711497, 0.4993384, 1, 1, 1, 1, 1,
-1.053196, -0.6989574, -2.731765, 1, 1, 1, 1, 1,
-1.049529, -0.5711371, -2.632705, 1, 1, 1, 1, 1,
-1.049327, -0.3348104, -3.020226, 1, 1, 1, 1, 1,
-1.042884, 1.632783, 0.1780699, 1, 1, 1, 1, 1,
-1.039536, 1.080138, -1.22968, 1, 1, 1, 1, 1,
-1.034984, 0.4842252, -1.495952, 1, 1, 1, 1, 1,
-1.030414, -0.2455769, -2.593678, 1, 1, 1, 1, 1,
-1.014467, 1.74389, 0.3045608, 1, 1, 1, 1, 1,
-1.008269, -2.11395, -3.860416, 1, 1, 1, 1, 1,
-1.00697, -0.03004308, -1.331375, 1, 1, 1, 1, 1,
-1.003024, 0.01958951, -0.01075005, 0, 0, 1, 1, 1,
-1.001928, -0.2184399, -2.483012, 1, 0, 0, 1, 1,
-0.9929509, 0.57477, 0.3141412, 1, 0, 0, 1, 1,
-0.9907349, 0.5043617, -1.539529, 1, 0, 0, 1, 1,
-0.9902224, 2.204942, 0.7156688, 1, 0, 0, 1, 1,
-0.9735395, 0.4701175, -1.32823, 1, 0, 0, 1, 1,
-0.9655752, -0.4453351, -1.164508, 0, 0, 0, 1, 1,
-0.962778, -0.3043481, -1.829291, 0, 0, 0, 1, 1,
-0.9612756, 0.6354493, -0.03976636, 0, 0, 0, 1, 1,
-0.9561957, 0.2539341, -1.418372, 0, 0, 0, 1, 1,
-0.9548699, -0.09062148, -1.658501, 0, 0, 0, 1, 1,
-0.9529827, -1.684104, -3.115092, 0, 0, 0, 1, 1,
-0.943841, -1.456115, -2.070697, 0, 0, 0, 1, 1,
-0.9413157, 0.511852, 1.198493, 1, 1, 1, 1, 1,
-0.9370465, 0.63444, -2.196399, 1, 1, 1, 1, 1,
-0.9356883, -0.589721, -1.216743, 1, 1, 1, 1, 1,
-0.9355705, -1.155972, -2.222699, 1, 1, 1, 1, 1,
-0.927741, 0.9866129, 1.223521, 1, 1, 1, 1, 1,
-0.9260589, -0.7901157, -2.494202, 1, 1, 1, 1, 1,
-0.9260523, 2.035053, 0.6409466, 1, 1, 1, 1, 1,
-0.9245961, -1.393677, -3.895163, 1, 1, 1, 1, 1,
-0.923131, 0.2394188, -1.247043, 1, 1, 1, 1, 1,
-0.9229379, 3.056366, -1.780501, 1, 1, 1, 1, 1,
-0.9143492, -0.4882385, -2.822164, 1, 1, 1, 1, 1,
-0.9139158, -0.03464068, -1.399007, 1, 1, 1, 1, 1,
-0.9081849, -0.5489265, -2.843416, 1, 1, 1, 1, 1,
-0.9009323, -0.5457817, -3.186093, 1, 1, 1, 1, 1,
-0.8811914, -1.469137, -1.012277, 1, 1, 1, 1, 1,
-0.8748096, -0.5030474, -1.660599, 0, 0, 1, 1, 1,
-0.8690771, 0.1496267, -1.496997, 1, 0, 0, 1, 1,
-0.8593245, -0.6067187, -1.756383, 1, 0, 0, 1, 1,
-0.8586427, 1.525276, -0.9436912, 1, 0, 0, 1, 1,
-0.8579125, -0.4980462, -1.119472, 1, 0, 0, 1, 1,
-0.8560311, 0.2304258, -1.423185, 1, 0, 0, 1, 1,
-0.8558385, -0.07843938, -0.6429706, 0, 0, 0, 1, 1,
-0.8558097, 0.2040237, -0.6992872, 0, 0, 0, 1, 1,
-0.8538597, 2.484669, -2.33889, 0, 0, 0, 1, 1,
-0.8481292, 0.8689018, -0.8430418, 0, 0, 0, 1, 1,
-0.8432851, -1.158437, -3.158515, 0, 0, 0, 1, 1,
-0.8426172, 1.941536, -1.405005, 0, 0, 0, 1, 1,
-0.8409259, 1.990477, -1.051033, 0, 0, 0, 1, 1,
-0.8370323, 0.105722, -0.8542687, 1, 1, 1, 1, 1,
-0.8340014, -1.112202, -2.362839, 1, 1, 1, 1, 1,
-0.8296522, -0.4431979, -0.6266348, 1, 1, 1, 1, 1,
-0.8293399, -1.470512, -3.565351, 1, 1, 1, 1, 1,
-0.8285013, -0.5068532, -3.678747, 1, 1, 1, 1, 1,
-0.826466, -0.4224406, -3.001285, 1, 1, 1, 1, 1,
-0.8241367, 1.413338, -0.8455617, 1, 1, 1, 1, 1,
-0.8209926, -0.04635435, -1.502308, 1, 1, 1, 1, 1,
-0.8147459, -0.8557385, -3.330815, 1, 1, 1, 1, 1,
-0.8093374, -0.7326213, -4.095248, 1, 1, 1, 1, 1,
-0.8065206, -0.5764161, -3.524732, 1, 1, 1, 1, 1,
-0.8052176, -0.1668828, -2.451285, 1, 1, 1, 1, 1,
-0.8027641, 0.6657082, -0.8010601, 1, 1, 1, 1, 1,
-0.7999038, -1.488909, -2.987762, 1, 1, 1, 1, 1,
-0.799146, -0.614602, -2.081452, 1, 1, 1, 1, 1,
-0.7979972, 1.758352, 0.5581059, 0, 0, 1, 1, 1,
-0.7949504, -0.4978706, -1.486805, 1, 0, 0, 1, 1,
-0.7943919, -0.5094644, -5.180548, 1, 0, 0, 1, 1,
-0.7932308, -0.9972643, -2.326412, 1, 0, 0, 1, 1,
-0.7887917, -0.6225836, -0.5751001, 1, 0, 0, 1, 1,
-0.7848788, 0.5096955, -0.749743, 1, 0, 0, 1, 1,
-0.7776021, 1.064883, 1.00983, 0, 0, 0, 1, 1,
-0.7711011, -0.2355869, -1.729397, 0, 0, 0, 1, 1,
-0.7690082, -1.431344, -3.202723, 0, 0, 0, 1, 1,
-0.767475, 0.5528091, -2.456894, 0, 0, 0, 1, 1,
-0.7654576, -1.228007, -3.113051, 0, 0, 0, 1, 1,
-0.762162, 0.01450123, -2.349928, 0, 0, 0, 1, 1,
-0.7552111, -0.9069736, -4.211089, 0, 0, 0, 1, 1,
-0.7495205, 1.431735, -0.9460666, 1, 1, 1, 1, 1,
-0.7444081, -0.2164746, -3.278796, 1, 1, 1, 1, 1,
-0.7433761, 0.4021997, -2.233895, 1, 1, 1, 1, 1,
-0.7369711, 0.330349, -0.1969881, 1, 1, 1, 1, 1,
-0.7357064, 0.7725829, -0.9885388, 1, 1, 1, 1, 1,
-0.7306269, -0.7310646, -2.647285, 1, 1, 1, 1, 1,
-0.7279738, -0.5793688, -0.9454522, 1, 1, 1, 1, 1,
-0.7279196, 1.264503, -0.8938392, 1, 1, 1, 1, 1,
-0.7275527, 0.6858182, -2.099941, 1, 1, 1, 1, 1,
-0.7267107, 0.1407494, -0.3751879, 1, 1, 1, 1, 1,
-0.7047173, 0.4477276, -1.705098, 1, 1, 1, 1, 1,
-0.7029911, 0.4813932, -0.6696584, 1, 1, 1, 1, 1,
-0.7019607, -0.08506053, -2.585784, 1, 1, 1, 1, 1,
-0.6962667, 0.4297185, -1.093047, 1, 1, 1, 1, 1,
-0.6958565, 2.148355, -0.04607124, 1, 1, 1, 1, 1,
-0.692215, -0.9319746, -2.266996, 0, 0, 1, 1, 1,
-0.6917034, -0.5481001, -2.385645, 1, 0, 0, 1, 1,
-0.6880785, 0.2313102, 2.398653, 1, 0, 0, 1, 1,
-0.6834042, 1.282105, 0.3262286, 1, 0, 0, 1, 1,
-0.6832187, -0.9125817, -2.531074, 1, 0, 0, 1, 1,
-0.6785814, 1.440395, -1.561448, 1, 0, 0, 1, 1,
-0.6709872, -1.005028, -1.794087, 0, 0, 0, 1, 1,
-0.6701348, -0.6834965, -3.626235, 0, 0, 0, 1, 1,
-0.6694375, -1.879497, -2.751943, 0, 0, 0, 1, 1,
-0.6693357, 0.6391596, -0.8894401, 0, 0, 0, 1, 1,
-0.6625756, -2.080458, -3.777249, 0, 0, 0, 1, 1,
-0.6614302, 1.024139, -0.8596324, 0, 0, 0, 1, 1,
-0.660836, -0.174732, -1.037296, 0, 0, 0, 1, 1,
-0.6600062, -0.3208857, -0.9694515, 1, 1, 1, 1, 1,
-0.6593779, -0.28756, -2.974915, 1, 1, 1, 1, 1,
-0.6541627, -1.317703, -1.552189, 1, 1, 1, 1, 1,
-0.6526059, 0.704716, -1.161852, 1, 1, 1, 1, 1,
-0.6516511, -0.2130919, -2.249536, 1, 1, 1, 1, 1,
-0.6477028, 0.8915817, 0.0357022, 1, 1, 1, 1, 1,
-0.6476953, -0.1394278, -3.816394, 1, 1, 1, 1, 1,
-0.6470294, 0.3783623, -2.521599, 1, 1, 1, 1, 1,
-0.6468888, 1.724823, -0.5473642, 1, 1, 1, 1, 1,
-0.6457228, -1.171977, -1.543558, 1, 1, 1, 1, 1,
-0.6446955, 0.7995758, -0.4830264, 1, 1, 1, 1, 1,
-0.6385006, 1.265065, -0.4164333, 1, 1, 1, 1, 1,
-0.638412, -0.6053751, -3.663771, 1, 1, 1, 1, 1,
-0.6378262, -1.264165, -3.95475, 1, 1, 1, 1, 1,
-0.6367906, -0.7332945, -2.089612, 1, 1, 1, 1, 1,
-0.6358884, 0.1803077, -0.8002762, 0, 0, 1, 1, 1,
-0.6346214, 0.3107953, -1.216243, 1, 0, 0, 1, 1,
-0.6304289, 0.1513914, -1.932704, 1, 0, 0, 1, 1,
-0.6276609, 1.32671, -1.055292, 1, 0, 0, 1, 1,
-0.6272427, 0.3505522, -2.452946, 1, 0, 0, 1, 1,
-0.6259131, -0.5990376, -3.355318, 1, 0, 0, 1, 1,
-0.6252597, 0.8613745, -1.144212, 0, 0, 0, 1, 1,
-0.6251093, -0.2106633, -3.800484, 0, 0, 0, 1, 1,
-0.6235212, -0.02843009, -1.417546, 0, 0, 0, 1, 1,
-0.6234803, -2.195729, -3.614072, 0, 0, 0, 1, 1,
-0.6233998, 0.174476, -1.313858, 0, 0, 0, 1, 1,
-0.6212513, 0.601239, 0.3576565, 0, 0, 0, 1, 1,
-0.6195289, 0.7123868, -1.110695, 0, 0, 0, 1, 1,
-0.6174557, -0.4434941, -3.391955, 1, 1, 1, 1, 1,
-0.6124105, -0.5427527, -3.61281, 1, 1, 1, 1, 1,
-0.6104058, -0.1565134, -2.085915, 1, 1, 1, 1, 1,
-0.6101705, -0.6044044, -3.990533, 1, 1, 1, 1, 1,
-0.6051237, -0.2711581, -2.798555, 1, 1, 1, 1, 1,
-0.6047778, -1.606777, -3.428516, 1, 1, 1, 1, 1,
-0.6043462, -0.1294935, 0.05942179, 1, 1, 1, 1, 1,
-0.6035323, 0.7273878, -0.4222984, 1, 1, 1, 1, 1,
-0.5982589, 0.8779249, -0.6852044, 1, 1, 1, 1, 1,
-0.5963652, -0.3400795, -2.56973, 1, 1, 1, 1, 1,
-0.5948526, -0.04846423, -1.870476, 1, 1, 1, 1, 1,
-0.5917104, 0.3965597, -0.4636887, 1, 1, 1, 1, 1,
-0.5869887, -0.09156212, -1.9943, 1, 1, 1, 1, 1,
-0.586959, -1.943719, -2.822502, 1, 1, 1, 1, 1,
-0.5789763, 1.236721, -2.140284, 1, 1, 1, 1, 1,
-0.5757936, -0.5666386, 0.1630739, 0, 0, 1, 1, 1,
-0.5743037, -0.2039069, -0.5066035, 1, 0, 0, 1, 1,
-0.5705488, 0.8125825, -0.8173334, 1, 0, 0, 1, 1,
-0.5697937, -3.942804, -4.359966, 1, 0, 0, 1, 1,
-0.5689726, -1.127878, -2.846598, 1, 0, 0, 1, 1,
-0.567379, -1.529563, -2.441835, 1, 0, 0, 1, 1,
-0.5579725, 0.8394852, -0.5896102, 0, 0, 0, 1, 1,
-0.5579209, -1.137587, -3.112784, 0, 0, 0, 1, 1,
-0.5565249, -0.4527965, -1.407875, 0, 0, 0, 1, 1,
-0.553351, -0.8541569, -1.987766, 0, 0, 0, 1, 1,
-0.5439007, -0.2332412, -1.947582, 0, 0, 0, 1, 1,
-0.5422523, 1.441869, -0.3845082, 0, 0, 0, 1, 1,
-0.5420364, -0.2183299, -3.33647, 0, 0, 0, 1, 1,
-0.5392867, -1.575677, -3.146665, 1, 1, 1, 1, 1,
-0.538902, 0.1248062, -0.7579769, 1, 1, 1, 1, 1,
-0.5369222, -0.5221648, -2.783002, 1, 1, 1, 1, 1,
-0.5342905, 0.1391633, -0.1165662, 1, 1, 1, 1, 1,
-0.5328214, 1.047826, -0.01760557, 1, 1, 1, 1, 1,
-0.5323517, 0.7424789, -0.9969169, 1, 1, 1, 1, 1,
-0.531754, -1.874408, -2.782609, 1, 1, 1, 1, 1,
-0.5283996, 0.2073379, -1.837678, 1, 1, 1, 1, 1,
-0.5256248, -0.2952106, -3.70732, 1, 1, 1, 1, 1,
-0.5238578, 0.4773192, -0.7061711, 1, 1, 1, 1, 1,
-0.5233405, -0.8980517, -2.802424, 1, 1, 1, 1, 1,
-0.5200372, 1.800485, 0.2899031, 1, 1, 1, 1, 1,
-0.5189436, 0.5521094, -0.7313684, 1, 1, 1, 1, 1,
-0.5186498, 2.026495, 1.156095, 1, 1, 1, 1, 1,
-0.5164004, 0.6812729, -0.345558, 1, 1, 1, 1, 1,
-0.5125632, -1.612148, -4.914886, 0, 0, 1, 1, 1,
-0.5075623, 0.6518406, -0.6232882, 1, 0, 0, 1, 1,
-0.5065022, 0.9246768, 1.216632, 1, 0, 0, 1, 1,
-0.5062773, 0.890173, 0.5312777, 1, 0, 0, 1, 1,
-0.5052674, 0.1569961, -0.5705991, 1, 0, 0, 1, 1,
-0.5040848, 0.2676977, -0.001062138, 1, 0, 0, 1, 1,
-0.4988618, 1.083936, 0.3419994, 0, 0, 0, 1, 1,
-0.4921176, -0.04277844, -0.1741292, 0, 0, 0, 1, 1,
-0.487512, -1.292665, -3.409828, 0, 0, 0, 1, 1,
-0.4868645, 0.4603181, -1.466192, 0, 0, 0, 1, 1,
-0.4844324, 1.452937, 0.2776003, 0, 0, 0, 1, 1,
-0.4804478, 0.3033881, -1.0515, 0, 0, 0, 1, 1,
-0.4761986, 0.6360816, -0.3110461, 0, 0, 0, 1, 1,
-0.4750361, 0.1643624, 0.2732493, 1, 1, 1, 1, 1,
-0.471758, -0.06990445, -1.950718, 1, 1, 1, 1, 1,
-0.4674068, -0.4007497, -2.677062, 1, 1, 1, 1, 1,
-0.4668524, -0.1956062, -0.07232852, 1, 1, 1, 1, 1,
-0.4664013, -1.736346, -3.925582, 1, 1, 1, 1, 1,
-0.458035, 0.687698, -0.3119057, 1, 1, 1, 1, 1,
-0.4571109, 1.107411, -0.6512773, 1, 1, 1, 1, 1,
-0.4532798, -0.4839243, -1.773684, 1, 1, 1, 1, 1,
-0.4528111, -1.901172, -3.211822, 1, 1, 1, 1, 1,
-0.4527397, -0.7697252, -3.312565, 1, 1, 1, 1, 1,
-0.4507407, 1.082749, 0.6019051, 1, 1, 1, 1, 1,
-0.445331, 0.8863339, -1.307, 1, 1, 1, 1, 1,
-0.44482, -0.4087802, -3.081459, 1, 1, 1, 1, 1,
-0.4447588, -2.597204, -2.908503, 1, 1, 1, 1, 1,
-0.4394107, 0.3831769, -0.9405192, 1, 1, 1, 1, 1,
-0.4376645, 0.4940295, -0.6959574, 0, 0, 1, 1, 1,
-0.4316949, -0.187988, -3.244922, 1, 0, 0, 1, 1,
-0.4315119, 0.2296435, -2.668154, 1, 0, 0, 1, 1,
-0.4233447, 0.2700411, -1.027876, 1, 0, 0, 1, 1,
-0.42164, 0.3319741, -1.8703, 1, 0, 0, 1, 1,
-0.4100375, -0.155622, -1.09118, 1, 0, 0, 1, 1,
-0.4085166, -0.1500978, -2.91516, 0, 0, 0, 1, 1,
-0.4063595, -0.006823597, -3.148627, 0, 0, 0, 1, 1,
-0.4024002, 0.7905914, -0.5592332, 0, 0, 0, 1, 1,
-0.4005821, 0.182619, -0.7813411, 0, 0, 0, 1, 1,
-0.3975884, -0.413148, -2.763068, 0, 0, 0, 1, 1,
-0.3953942, -1.356868, -3.194572, 0, 0, 0, 1, 1,
-0.3943044, 0.743615, 0.6263599, 0, 0, 0, 1, 1,
-0.3919108, 0.01728869, -2.267671, 1, 1, 1, 1, 1,
-0.3910955, -0.435507, -1.4183, 1, 1, 1, 1, 1,
-0.3906503, -0.8518406, -2.751194, 1, 1, 1, 1, 1,
-0.3872068, -0.3176398, -2.626554, 1, 1, 1, 1, 1,
-0.3846242, -0.2968756, -2.483428, 1, 1, 1, 1, 1,
-0.3832014, 1.660363, 0.2882136, 1, 1, 1, 1, 1,
-0.3738088, -0.7421528, -3.41867, 1, 1, 1, 1, 1,
-0.3729592, 0.5857032, 0.7856886, 1, 1, 1, 1, 1,
-0.3700902, 1.664925, -0.2936265, 1, 1, 1, 1, 1,
-0.36973, 1.289782, 0.1332651, 1, 1, 1, 1, 1,
-0.3668101, 1.312691, -1.403899, 1, 1, 1, 1, 1,
-0.3658832, -1.396542, -2.358844, 1, 1, 1, 1, 1,
-0.3647161, 0.6652438, -1.793612, 1, 1, 1, 1, 1,
-0.3642332, -0.2228803, -2.162157, 1, 1, 1, 1, 1,
-0.3621791, -0.3598743, -1.645265, 1, 1, 1, 1, 1,
-0.3580212, 0.04338402, -0.4078806, 0, 0, 1, 1, 1,
-0.3573492, -0.2705969, -1.246604, 1, 0, 0, 1, 1,
-0.3570149, -0.3130912, -3.047592, 1, 0, 0, 1, 1,
-0.3560534, -0.3728834, -2.47259, 1, 0, 0, 1, 1,
-0.3520393, 0.03013559, -1.521684, 1, 0, 0, 1, 1,
-0.3507219, 1.258176, -1.713744, 1, 0, 0, 1, 1,
-0.3411211, -0.2546837, -0.7876302, 0, 0, 0, 1, 1,
-0.3321998, -0.3026259, -2.379864, 0, 0, 0, 1, 1,
-0.3262608, -0.2110867, -0.2529772, 0, 0, 0, 1, 1,
-0.3237395, 0.07028862, -1.49768, 0, 0, 0, 1, 1,
-0.3208276, 0.3629894, -1.835688, 0, 0, 0, 1, 1,
-0.3180054, -0.6352829, -3.410904, 0, 0, 0, 1, 1,
-0.3169779, -1.213425, -3.658496, 0, 0, 0, 1, 1,
-0.3059502, 0.6553617, -0.5520189, 1, 1, 1, 1, 1,
-0.3043447, -1.522102, -1.890528, 1, 1, 1, 1, 1,
-0.301787, 0.2318173, -0.8123438, 1, 1, 1, 1, 1,
-0.2998078, 0.6752365, 1.332344, 1, 1, 1, 1, 1,
-0.2997209, 0.2866168, 0.3661633, 1, 1, 1, 1, 1,
-0.2904705, 0.8109038, 0.4753829, 1, 1, 1, 1, 1,
-0.2848361, -0.634783, -1.583207, 1, 1, 1, 1, 1,
-0.2846218, -0.6916082, -4.169908, 1, 1, 1, 1, 1,
-0.2818553, 0.8045704, 0.5039934, 1, 1, 1, 1, 1,
-0.2779041, -0.9586338, -1.74, 1, 1, 1, 1, 1,
-0.2774504, 1.943734, -1.986999, 1, 1, 1, 1, 1,
-0.276813, -0.4480771, -1.69769, 1, 1, 1, 1, 1,
-0.2756112, -0.5109289, -2.909067, 1, 1, 1, 1, 1,
-0.2752217, -0.1920965, -1.609906, 1, 1, 1, 1, 1,
-0.2689575, 0.1536509, -0.7788876, 1, 1, 1, 1, 1,
-0.2662327, -0.1537093, -0.1564953, 0, 0, 1, 1, 1,
-0.2658686, -2.286498, -2.011452, 1, 0, 0, 1, 1,
-0.2588919, -0.6437449, -2.174098, 1, 0, 0, 1, 1,
-0.2571779, 1.153236, 0.4931906, 1, 0, 0, 1, 1,
-0.2514856, -0.8987432, -2.883507, 1, 0, 0, 1, 1,
-0.2493178, 1.533989, 0.4493637, 1, 0, 0, 1, 1,
-0.2458351, 0.5655292, 0.4710209, 0, 0, 0, 1, 1,
-0.2437928, 0.8568646, -0.3037052, 0, 0, 0, 1, 1,
-0.2393587, 0.0996904, -1.861974, 0, 0, 0, 1, 1,
-0.2362695, -0.3424692, -3.305366, 0, 0, 0, 1, 1,
-0.236153, -1.28565, -2.078631, 0, 0, 0, 1, 1,
-0.2346512, -0.9594107, -2.658947, 0, 0, 0, 1, 1,
-0.2333253, 1.671913, -0.365812, 0, 0, 0, 1, 1,
-0.2322191, -1.043862, -3.101555, 1, 1, 1, 1, 1,
-0.2301455, 1.05433, -0.8298776, 1, 1, 1, 1, 1,
-0.2300392, -0.2690027, -1.953758, 1, 1, 1, 1, 1,
-0.2291329, 1.616688, -1.355123, 1, 1, 1, 1, 1,
-0.2287063, -0.4664961, -2.430761, 1, 1, 1, 1, 1,
-0.2266283, 0.1816444, -0.5643466, 1, 1, 1, 1, 1,
-0.221406, -1.057084, -1.802384, 1, 1, 1, 1, 1,
-0.2202056, 0.2095263, -0.07646367, 1, 1, 1, 1, 1,
-0.2174015, 0.8557683, 0.7705678, 1, 1, 1, 1, 1,
-0.2164379, 0.3444238, -0.5732805, 1, 1, 1, 1, 1,
-0.2151878, 0.5844141, -0.1413711, 1, 1, 1, 1, 1,
-0.2094065, 0.7589803, 0.3675608, 1, 1, 1, 1, 1,
-0.2091276, 0.2747984, -2.097108, 1, 1, 1, 1, 1,
-0.2020557, -0.3498523, -3.203596, 1, 1, 1, 1, 1,
-0.2007706, -0.436487, -2.740736, 1, 1, 1, 1, 1,
-0.1975647, 0.403955, -0.9378349, 0, 0, 1, 1, 1,
-0.1899636, 0.4768637, -0.4569378, 1, 0, 0, 1, 1,
-0.1893225, 0.1397142, -0.6429294, 1, 0, 0, 1, 1,
-0.1884459, -2.352389, -2.551375, 1, 0, 0, 1, 1,
-0.1869341, 1.152507, 1.595509, 1, 0, 0, 1, 1,
-0.1852994, -1.099895, -4.504553, 1, 0, 0, 1, 1,
-0.1824941, -0.005630855, -1.723323, 0, 0, 0, 1, 1,
-0.1780573, -0.028325, -1.265442, 0, 0, 0, 1, 1,
-0.1759112, -1.328746, -3.070685, 0, 0, 0, 1, 1,
-0.1744474, -0.7218759, -3.383076, 0, 0, 0, 1, 1,
-0.1700623, 0.5965947, 1.471666, 0, 0, 0, 1, 1,
-0.1630236, -0.8827544, -3.766304, 0, 0, 0, 1, 1,
-0.153307, -0.2294952, -2.242208, 0, 0, 0, 1, 1,
-0.1519086, -0.6571958, -2.985341, 1, 1, 1, 1, 1,
-0.1467809, -0.2260936, -2.23739, 1, 1, 1, 1, 1,
-0.1423032, 0.8564036, 1.359641, 1, 1, 1, 1, 1,
-0.1399764, 0.491601, -0.6357825, 1, 1, 1, 1, 1,
-0.13969, 0.5477595, 0.2945008, 1, 1, 1, 1, 1,
-0.1389346, 0.8271754, 1.657022, 1, 1, 1, 1, 1,
-0.1305116, 1.393128, 1.589201, 1, 1, 1, 1, 1,
-0.1274077, 0.2751764, 0.1952572, 1, 1, 1, 1, 1,
-0.1240432, 1.34477, -0.1930297, 1, 1, 1, 1, 1,
-0.1240175, -0.4986728, -4.026383, 1, 1, 1, 1, 1,
-0.1216583, -0.7013925, -3.873926, 1, 1, 1, 1, 1,
-0.1203053, -0.01115622, -0.09209069, 1, 1, 1, 1, 1,
-0.1196202, -0.4806985, -2.988873, 1, 1, 1, 1, 1,
-0.1175635, -0.007521534, -1.119589, 1, 1, 1, 1, 1,
-0.1157437, -0.04221656, 0.412822, 1, 1, 1, 1, 1,
-0.1148314, 0.366968, -0.5421334, 0, 0, 1, 1, 1,
-0.1129471, 1.407898, -1.001191, 1, 0, 0, 1, 1,
-0.1127149, -0.2074793, -2.089031, 1, 0, 0, 1, 1,
-0.112674, 1.937589, -0.5880327, 1, 0, 0, 1, 1,
-0.1126613, -0.004849318, 0.6093762, 1, 0, 0, 1, 1,
-0.1068789, -1.128179, -1.602709, 1, 0, 0, 1, 1,
-0.1055134, -2.331816, -4.871129, 0, 0, 0, 1, 1,
-0.1039071, -2.349843, -2.233839, 0, 0, 0, 1, 1,
-0.09937534, 0.949986, -1.453567, 0, 0, 0, 1, 1,
-0.09686679, -0.2184686, -3.226468, 0, 0, 0, 1, 1,
-0.09099631, 0.6554351, 0.2151497, 0, 0, 0, 1, 1,
-0.08912413, -0.6874827, -2.586136, 0, 0, 0, 1, 1,
-0.08807878, 2.107935, -0.6064753, 0, 0, 0, 1, 1,
-0.08502164, 0.7177896, -1.201916, 1, 1, 1, 1, 1,
-0.07887702, 0.5504875, -0.4695452, 1, 1, 1, 1, 1,
-0.07852732, -0.6885497, -3.606026, 1, 1, 1, 1, 1,
-0.07758359, -0.111503, -3.58935, 1, 1, 1, 1, 1,
-0.07711976, 0.9887493, -0.5998671, 1, 1, 1, 1, 1,
-0.07693926, 1.140852, 0.3135638, 1, 1, 1, 1, 1,
-0.06977222, 0.8788421, 0.9957049, 1, 1, 1, 1, 1,
-0.06517754, 1.247891, 0.5792195, 1, 1, 1, 1, 1,
-0.06159827, 0.2307339, -1.4592, 1, 1, 1, 1, 1,
-0.05826741, -0.6267871, -4.063204, 1, 1, 1, 1, 1,
-0.05669751, -1.122169, -2.037592, 1, 1, 1, 1, 1,
-0.05195288, -0.6384075, -3.934255, 1, 1, 1, 1, 1,
-0.04733805, 0.07009295, -0.8129252, 1, 1, 1, 1, 1,
-0.04653527, 1.428303, 0.7139934, 1, 1, 1, 1, 1,
-0.04396139, -0.5838361, -2.562976, 1, 1, 1, 1, 1,
-0.0404872, 1.095565, -1.554768, 0, 0, 1, 1, 1,
-0.03856394, 0.1391161, -0.1312361, 1, 0, 0, 1, 1,
-0.03804367, -0.8779786, -5.210145, 1, 0, 0, 1, 1,
-0.03653507, 1.357035, 0.02647366, 1, 0, 0, 1, 1,
-0.03605786, 1.242105, 0.3106159, 1, 0, 0, 1, 1,
-0.0344217, -0.9864298, -3.629238, 1, 0, 0, 1, 1,
-0.02965795, -0.03028188, -3.171453, 0, 0, 0, 1, 1,
-0.0254863, 0.1467155, 1.609073, 0, 0, 0, 1, 1,
-0.02268253, -0.8524301, -5.296763, 0, 0, 0, 1, 1,
-0.02132641, 0.4238445, 1.008153, 0, 0, 0, 1, 1,
-0.02040044, -1.006645, -3.866749, 0, 0, 0, 1, 1,
-0.02031398, -1.464895, -3.012238, 0, 0, 0, 1, 1,
-0.02005205, 0.3327881, -0.1212221, 0, 0, 0, 1, 1,
-0.01546301, -0.5993752, -2.849984, 1, 1, 1, 1, 1,
-0.01351368, -1.10135, -3.748912, 1, 1, 1, 1, 1,
-0.01093983, 0.741325, -0.722011, 1, 1, 1, 1, 1,
-0.009990488, 1.546112, -0.03465903, 1, 1, 1, 1, 1,
-0.005584906, 0.9776602, 0.06152525, 1, 1, 1, 1, 1,
-0.002324743, 0.6860936, -0.9622277, 1, 1, 1, 1, 1,
0.000159796, -0.1029257, 3.532665, 1, 1, 1, 1, 1,
0.000168012, -0.4247527, 4.062596, 1, 1, 1, 1, 1,
0.008947379, 0.3924483, -0.6450983, 1, 1, 1, 1, 1,
0.0100069, 0.8523684, -0.1577084, 1, 1, 1, 1, 1,
0.01056668, -1.372998, 4.288491, 1, 1, 1, 1, 1,
0.0185415, -1.098884, 3.453121, 1, 1, 1, 1, 1,
0.01854734, 1.04277, 0.5867788, 1, 1, 1, 1, 1,
0.02401678, -1.372388, 4.32802, 1, 1, 1, 1, 1,
0.02476882, -0.5409459, 3.318023, 1, 1, 1, 1, 1,
0.02645614, 0.01176706, 2.879353, 0, 0, 1, 1, 1,
0.02854501, -0.4760943, 2.862109, 1, 0, 0, 1, 1,
0.0295356, -0.7764994, 2.971064, 1, 0, 0, 1, 1,
0.02988268, -0.3186219, 2.585861, 1, 0, 0, 1, 1,
0.03549526, -1.003602, 3.622791, 1, 0, 0, 1, 1,
0.03809569, 0.4112386, 1.077677, 1, 0, 0, 1, 1,
0.03945632, 0.04273332, 3.806679, 0, 0, 0, 1, 1,
0.04028986, -0.2174824, 1.531681, 0, 0, 0, 1, 1,
0.04118006, -1.283394, 3.68954, 0, 0, 0, 1, 1,
0.04125106, 1.902758, 0.05878776, 0, 0, 0, 1, 1,
0.0425455, 0.3121663, 1.199742, 0, 0, 0, 1, 1,
0.04410012, -1.965277, 2.902774, 0, 0, 0, 1, 1,
0.04978142, 2.091987, -1.275231, 0, 0, 0, 1, 1,
0.05291119, 0.03775898, 1.477451, 1, 1, 1, 1, 1,
0.0531594, 1.605144, 1.565922, 1, 1, 1, 1, 1,
0.053957, 0.1487444, -1.463662, 1, 1, 1, 1, 1,
0.05766368, 1.404349, 1.180651, 1, 1, 1, 1, 1,
0.05972398, 0.1284078, 0.3870383, 1, 1, 1, 1, 1,
0.06239279, -0.4755561, 3.796913, 1, 1, 1, 1, 1,
0.06706173, 1.911412, 0.6363379, 1, 1, 1, 1, 1,
0.06733535, -1.389547, 2.706613, 1, 1, 1, 1, 1,
0.07122619, 0.1425242, -0.9574014, 1, 1, 1, 1, 1,
0.07265364, -0.7465245, 2.755786, 1, 1, 1, 1, 1,
0.07379811, -0.1700523, 3.176076, 1, 1, 1, 1, 1,
0.07423303, 0.4028884, 0.5164496, 1, 1, 1, 1, 1,
0.07516377, 1.213058, -1.47994, 1, 1, 1, 1, 1,
0.07633756, -1.026176, 3.594608, 1, 1, 1, 1, 1,
0.07987653, 1.215014, 0.1652663, 1, 1, 1, 1, 1,
0.08490285, -1.098262, 4.641442, 0, 0, 1, 1, 1,
0.08578708, 0.5496607, 0.9263484, 1, 0, 0, 1, 1,
0.09186104, 1.158975, -0.02409474, 1, 0, 0, 1, 1,
0.09196289, -1.498147, 3.840622, 1, 0, 0, 1, 1,
0.09385759, -0.6378386, 4.422119, 1, 0, 0, 1, 1,
0.0940372, -2.394667, 2.234523, 1, 0, 0, 1, 1,
0.09508286, -0.06164272, 3.105066, 0, 0, 0, 1, 1,
0.09634288, -1.007109, 2.282893, 0, 0, 0, 1, 1,
0.1008933, -0.7888532, 1.32958, 0, 0, 0, 1, 1,
0.1027866, -3.36586, 2.818833, 0, 0, 0, 1, 1,
0.1032486, -0.78809, 2.333594, 0, 0, 0, 1, 1,
0.107935, 0.970915, 0.4731925, 0, 0, 0, 1, 1,
0.1084987, 1.005135, 0.01498895, 0, 0, 0, 1, 1,
0.1092049, -0.05797601, 3.636818, 1, 1, 1, 1, 1,
0.1120156, -0.3665638, 1.994018, 1, 1, 1, 1, 1,
0.1134188, 0.9898978, -1.005328, 1, 1, 1, 1, 1,
0.1168261, 1.355522, 1.202737, 1, 1, 1, 1, 1,
0.117469, -0.8221232, 3.378, 1, 1, 1, 1, 1,
0.1183717, -0.4361266, 2.760339, 1, 1, 1, 1, 1,
0.127284, 0.9742208, 1.13444, 1, 1, 1, 1, 1,
0.1278592, -1.467615, 3.341181, 1, 1, 1, 1, 1,
0.132536, -2.224308, 1.966996, 1, 1, 1, 1, 1,
0.1342657, -0.1216884, 3.262174, 1, 1, 1, 1, 1,
0.1412577, -1.484776, 4.033528, 1, 1, 1, 1, 1,
0.1450105, 0.9228172, 1.102838, 1, 1, 1, 1, 1,
0.1465926, 0.4392889, 2.889227, 1, 1, 1, 1, 1,
0.151559, 0.7148792, -1.0203, 1, 1, 1, 1, 1,
0.1532159, -1.635201, 1.947918, 1, 1, 1, 1, 1,
0.1541097, -1.007532, 2.436265, 0, 0, 1, 1, 1,
0.1557698, 0.2498382, 1.156224, 1, 0, 0, 1, 1,
0.1578111, -0.3483074, 2.99022, 1, 0, 0, 1, 1,
0.159388, 0.2774024, 1.028448, 1, 0, 0, 1, 1,
0.1607075, 0.9997805, -0.2652638, 1, 0, 0, 1, 1,
0.1607425, -0.4175922, 3.573877, 1, 0, 0, 1, 1,
0.1648289, -0.09888033, 1.536733, 0, 0, 0, 1, 1,
0.1696597, -1.255922, 2.048145, 0, 0, 0, 1, 1,
0.1704339, 0.7297578, -0.5189553, 0, 0, 0, 1, 1,
0.1768882, -1.6242, 5.231855, 0, 0, 0, 1, 1,
0.1781512, 0.9070638, 0.7920106, 0, 0, 0, 1, 1,
0.1796189, -0.07473058, 1.917095, 0, 0, 0, 1, 1,
0.181545, -0.3582318, 2.182148, 0, 0, 0, 1, 1,
0.1817096, 1.304205, -1.410034, 1, 1, 1, 1, 1,
0.1821444, 1.361333, -0.1580727, 1, 1, 1, 1, 1,
0.1872642, -0.1458655, 0.7641263, 1, 1, 1, 1, 1,
0.1909674, 0.04438876, -1.358585, 1, 1, 1, 1, 1,
0.194923, -1.327932, 5.354405, 1, 1, 1, 1, 1,
0.1975201, 0.2458939, 0.4355445, 1, 1, 1, 1, 1,
0.1985756, -0.2972772, 1.801942, 1, 1, 1, 1, 1,
0.1987947, 0.3857237, -0.3597265, 1, 1, 1, 1, 1,
0.200072, 0.297779, 1.175689, 1, 1, 1, 1, 1,
0.2006197, -1.504934, 3.296509, 1, 1, 1, 1, 1,
0.2045025, -0.5186871, 4.066133, 1, 1, 1, 1, 1,
0.2052273, -0.3416471, 3.670922, 1, 1, 1, 1, 1,
0.2066826, 0.3985293, -0.1920099, 1, 1, 1, 1, 1,
0.2081109, 0.1513741, 0.9184106, 1, 1, 1, 1, 1,
0.2097992, -1.205446, 4.911053, 1, 1, 1, 1, 1,
0.2151635, -1.341421, 2.194215, 0, 0, 1, 1, 1,
0.2160865, -0.816232, 1.222219, 1, 0, 0, 1, 1,
0.2165516, 0.05969573, 2.676796, 1, 0, 0, 1, 1,
0.2190422, -1.167777, 2.738082, 1, 0, 0, 1, 1,
0.2226135, 0.510087, 0.3262134, 1, 0, 0, 1, 1,
0.2264606, -1.010466, 2.13258, 1, 0, 0, 1, 1,
0.2292872, 0.8799003, 2.468529, 0, 0, 0, 1, 1,
0.2296387, -0.7503903, 1.33493, 0, 0, 0, 1, 1,
0.2380028, 0.6185724, 1.370857, 0, 0, 0, 1, 1,
0.247285, 0.6957505, 0.2315728, 0, 0, 0, 1, 1,
0.2474124, 0.1014755, 1.984293, 0, 0, 0, 1, 1,
0.2488662, -0.8706502, 2.594178, 0, 0, 0, 1, 1,
0.250113, -0.2596764, 2.007936, 0, 0, 0, 1, 1,
0.2502845, 0.6723791, 1.487527, 1, 1, 1, 1, 1,
0.2530117, -2.193382, 3.025824, 1, 1, 1, 1, 1,
0.2544426, -1.57539, 3.700286, 1, 1, 1, 1, 1,
0.2606666, 0.3236899, -1.095326, 1, 1, 1, 1, 1,
0.2671202, 0.0028074, 1.134398, 1, 1, 1, 1, 1,
0.2687806, -0.6791381, 2.343166, 1, 1, 1, 1, 1,
0.278228, 0.1969985, 1.474287, 1, 1, 1, 1, 1,
0.2789855, -1.677015, 2.058021, 1, 1, 1, 1, 1,
0.282332, 1.265048, 1.981962, 1, 1, 1, 1, 1,
0.2827039, 0.809146, 0.8255334, 1, 1, 1, 1, 1,
0.282722, 0.3443897, 1.340681, 1, 1, 1, 1, 1,
0.2828116, -0.3679404, 2.94387, 1, 1, 1, 1, 1,
0.2846748, 0.1946851, 0.4930848, 1, 1, 1, 1, 1,
0.2867198, 0.1791228, 0.8279344, 1, 1, 1, 1, 1,
0.2898932, -0.1890305, 1.046686, 1, 1, 1, 1, 1,
0.292358, -0.5399358, 1.9599, 0, 0, 1, 1, 1,
0.293841, 1.73863, -0.8080183, 1, 0, 0, 1, 1,
0.2975787, 1.374005, 1.410459, 1, 0, 0, 1, 1,
0.2977006, -1.139456, 4.328151, 1, 0, 0, 1, 1,
0.3016738, 0.4868501, 0.9944013, 1, 0, 0, 1, 1,
0.3048233, 0.7041392, 1.124232, 1, 0, 0, 1, 1,
0.3078565, -1.349958, 5.25474, 0, 0, 0, 1, 1,
0.3124227, 0.5327809, 0.7125401, 0, 0, 0, 1, 1,
0.3135767, 0.04966156, 0.327563, 0, 0, 0, 1, 1,
0.317718, -1.291208, 2.005206, 0, 0, 0, 1, 1,
0.3304626, 1.776831, -0.3666877, 0, 0, 0, 1, 1,
0.3311283, 0.3261787, -0.7988336, 0, 0, 0, 1, 1,
0.3312143, -0.5371684, 4.81043, 0, 0, 0, 1, 1,
0.3329749, -1.104139, 2.54804, 1, 1, 1, 1, 1,
0.3381701, -0.6466965, 3.012432, 1, 1, 1, 1, 1,
0.3404302, -0.8554785, 3.136428, 1, 1, 1, 1, 1,
0.3411129, -0.7190676, 3.138338, 1, 1, 1, 1, 1,
0.3412742, 0.7780821, 0.1917811, 1, 1, 1, 1, 1,
0.3421044, 1.507305, 1.219274, 1, 1, 1, 1, 1,
0.3504437, -0.2422585, 2.680279, 1, 1, 1, 1, 1,
0.3510399, 1.434653, 1.306695, 1, 1, 1, 1, 1,
0.3527411, 1.17184, 2.010113, 1, 1, 1, 1, 1,
0.3527817, -1.405526, 2.9572, 1, 1, 1, 1, 1,
0.3545245, -0.3816617, 2.385215, 1, 1, 1, 1, 1,
0.3572594, -0.5731636, 2.984791, 1, 1, 1, 1, 1,
0.357944, -0.317458, 2.883361, 1, 1, 1, 1, 1,
0.3610467, -0.3796517, 1.370515, 1, 1, 1, 1, 1,
0.3614294, -1.633131, 1.8948, 1, 1, 1, 1, 1,
0.3647429, -0.01482239, 0.6866749, 0, 0, 1, 1, 1,
0.3659999, -1.944559, 3.634513, 1, 0, 0, 1, 1,
0.3672403, 0.3449914, 1.532621, 1, 0, 0, 1, 1,
0.3681206, 0.9153354, 1.334857, 1, 0, 0, 1, 1,
0.3714189, 0.5633792, -0.3474649, 1, 0, 0, 1, 1,
0.3717708, -0.04643112, 0.7210591, 1, 0, 0, 1, 1,
0.3741667, 1.119756, 0.7649872, 0, 0, 0, 1, 1,
0.3761608, -0.8035243, 1.779573, 0, 0, 0, 1, 1,
0.3817402, -0.2763657, 1.693659, 0, 0, 0, 1, 1,
0.3861463, -0.5052675, 1.206604, 0, 0, 0, 1, 1,
0.3904381, 0.5769858, -0.6897409, 0, 0, 0, 1, 1,
0.3965948, -1.729066, 3.673956, 0, 0, 0, 1, 1,
0.4035873, 1.316824, 0.5638408, 0, 0, 0, 1, 1,
0.409781, -1.336581, 2.505796, 1, 1, 1, 1, 1,
0.4126239, -1.385112, 2.898768, 1, 1, 1, 1, 1,
0.4180193, 0.842005, 0.2350542, 1, 1, 1, 1, 1,
0.418371, -0.06834012, 1.61819, 1, 1, 1, 1, 1,
0.4199728, -0.1239398, 1.478551, 1, 1, 1, 1, 1,
0.4247395, 0.9245901, 0.768899, 1, 1, 1, 1, 1,
0.4260538, -1.174625, 3.025329, 1, 1, 1, 1, 1,
0.4271012, -1.76703, 2.077298, 1, 1, 1, 1, 1,
0.4277096, -0.4176683, 0.9901373, 1, 1, 1, 1, 1,
0.4355609, -0.3156621, 2.621701, 1, 1, 1, 1, 1,
0.4392944, 0.7990382, -1.770728, 1, 1, 1, 1, 1,
0.4428419, -0.4803445, 1.976848, 1, 1, 1, 1, 1,
0.4438248, 1.046179, -0.3033199, 1, 1, 1, 1, 1,
0.449656, 0.05245638, 2.651861, 1, 1, 1, 1, 1,
0.4497115, 1.070708, 1.350547, 1, 1, 1, 1, 1,
0.4498647, 1.362347, 0.8771567, 0, 0, 1, 1, 1,
0.4557332, 0.332422, 0.1956673, 1, 0, 0, 1, 1,
0.457635, 0.3477996, 0.9786063, 1, 0, 0, 1, 1,
0.4595996, 0.5012072, 1.000213, 1, 0, 0, 1, 1,
0.461109, 0.2403353, 1.545379, 1, 0, 0, 1, 1,
0.4613557, -0.795828, 3.237108, 1, 0, 0, 1, 1,
0.4667006, -0.3494269, 2.10921, 0, 0, 0, 1, 1,
0.4679485, -0.4130298, 3.165145, 0, 0, 0, 1, 1,
0.4764812, 1.730365, 0.3486271, 0, 0, 0, 1, 1,
0.4782921, -0.4667525, 1.080475, 0, 0, 0, 1, 1,
0.4791922, -0.9601204, 4.093159, 0, 0, 0, 1, 1,
0.4815499, -0.5175115, 2.121739, 0, 0, 0, 1, 1,
0.4887579, -0.9410112, 1.789795, 0, 0, 0, 1, 1,
0.4887718, -0.1958406, 2.339965, 1, 1, 1, 1, 1,
0.4905023, 1.044744, -0.1288991, 1, 1, 1, 1, 1,
0.4950268, 0.7949833, -0.004446086, 1, 1, 1, 1, 1,
0.4968656, -0.1284623, 2.449819, 1, 1, 1, 1, 1,
0.4978061, -0.2181714, 2.825783, 1, 1, 1, 1, 1,
0.4980464, 1.400113, 0.8527151, 1, 1, 1, 1, 1,
0.4988172, -1.648264, 2.901445, 1, 1, 1, 1, 1,
0.4991257, -1.665215, 2.425034, 1, 1, 1, 1, 1,
0.4993716, -0.9712534, 2.893523, 1, 1, 1, 1, 1,
0.5034509, -1.950608, 2.802216, 1, 1, 1, 1, 1,
0.5055665, -1.01116, 1.593887, 1, 1, 1, 1, 1,
0.5072595, -0.4556524, 2.722978, 1, 1, 1, 1, 1,
0.5186288, -0.307947, 1.09481, 1, 1, 1, 1, 1,
0.518647, 0.8946094, 0.9317162, 1, 1, 1, 1, 1,
0.5231571, 0.4225029, 0.9468531, 1, 1, 1, 1, 1,
0.5254878, 1.29012, -0.4564876, 0, 0, 1, 1, 1,
0.527041, 1.706003, 0.2495752, 1, 0, 0, 1, 1,
0.5273883, 0.5132439, 3.269838, 1, 0, 0, 1, 1,
0.5293876, -0.7663424, 2.718033, 1, 0, 0, 1, 1,
0.5354629, -0.5261825, 0.3153095, 1, 0, 0, 1, 1,
0.5512857, -0.3757511, 1.356279, 1, 0, 0, 1, 1,
0.5565357, 1.797286, -0.4152427, 0, 0, 0, 1, 1,
0.5620794, -2.357043, 3.991844, 0, 0, 0, 1, 1,
0.5637472, -0.1412684, 2.063582, 0, 0, 0, 1, 1,
0.5659642, 0.2964669, 0.7797517, 0, 0, 0, 1, 1,
0.5666933, -0.3589016, 1.722949, 0, 0, 0, 1, 1,
0.5667358, 0.4996052, -0.02219649, 0, 0, 0, 1, 1,
0.5673823, 0.7840935, -0.4574628, 0, 0, 0, 1, 1,
0.5673838, 0.6642321, -0.06947967, 1, 1, 1, 1, 1,
0.5676593, 0.4980021, 1.048526, 1, 1, 1, 1, 1,
0.5718956, 1.325734, 1.384499, 1, 1, 1, 1, 1,
0.5723369, 1.087565, 1.113592, 1, 1, 1, 1, 1,
0.5727459, -0.3715758, 1.487085, 1, 1, 1, 1, 1,
0.5741385, 0.4618042, -0.2335784, 1, 1, 1, 1, 1,
0.5741872, 0.06448878, 0.2047956, 1, 1, 1, 1, 1,
0.5803934, -0.260116, 3.404171, 1, 1, 1, 1, 1,
0.5817344, -0.369701, 1.6882, 1, 1, 1, 1, 1,
0.5920272, -1.651163, 2.255263, 1, 1, 1, 1, 1,
0.5972253, -1.33831, 2.394373, 1, 1, 1, 1, 1,
0.5977042, 1.091476, -0.8722788, 1, 1, 1, 1, 1,
0.5988831, -0.443822, 2.933561, 1, 1, 1, 1, 1,
0.5999684, 0.2568724, 2.965395, 1, 1, 1, 1, 1,
0.6058316, -0.01340013, 2.73998, 1, 1, 1, 1, 1,
0.60684, -0.7194368, 0.0610322, 0, 0, 1, 1, 1,
0.6073121, -0.3620549, 2.416574, 1, 0, 0, 1, 1,
0.6083521, -0.5661624, 0.5734192, 1, 0, 0, 1, 1,
0.6132511, -0.8054745, 3.284788, 1, 0, 0, 1, 1,
0.616329, 0.07034164, 1.396502, 1, 0, 0, 1, 1,
0.6175805, -1.105901, 1.317437, 1, 0, 0, 1, 1,
0.6182405, 1.0725, 1.405178, 0, 0, 0, 1, 1,
0.620627, -1.227682, 2.976106, 0, 0, 0, 1, 1,
0.6269765, 1.135226, -0.1885168, 0, 0, 0, 1, 1,
0.6288384, -0.1560024, 2.065854, 0, 0, 0, 1, 1,
0.6304013, -0.1866598, 2.180457, 0, 0, 0, 1, 1,
0.6359469, 0.280555, 0.8816703, 0, 0, 0, 1, 1,
0.637659, -1.430849, 0.1336639, 0, 0, 0, 1, 1,
0.6460987, -0.6645179, 3.320879, 1, 1, 1, 1, 1,
0.6489364, -0.989423, 0.7652691, 1, 1, 1, 1, 1,
0.649479, 1.731099, 1.218123, 1, 1, 1, 1, 1,
0.6550968, -2.406084, 2.601628, 1, 1, 1, 1, 1,
0.6580136, 0.1325649, 0.09641719, 1, 1, 1, 1, 1,
0.6610381, 0.288379, 1.395372, 1, 1, 1, 1, 1,
0.6637608, -0.6154756, 3.212068, 1, 1, 1, 1, 1,
0.6639141, 1.098288, 0.7028872, 1, 1, 1, 1, 1,
0.6659395, 0.4657234, 0.3415226, 1, 1, 1, 1, 1,
0.6672823, 1.036265, -0.3644705, 1, 1, 1, 1, 1,
0.6747154, 0.2180026, 2.429075, 1, 1, 1, 1, 1,
0.6747679, 1.983041, 1.02836, 1, 1, 1, 1, 1,
0.6748545, -0.5380193, 1.534736, 1, 1, 1, 1, 1,
0.6882856, -0.7656944, 1.671173, 1, 1, 1, 1, 1,
0.6915667, 0.1879129, 0.915671, 1, 1, 1, 1, 1,
0.6942489, 0.6337163, 1.301028, 0, 0, 1, 1, 1,
0.6963676, -0.6032186, 2.597088, 1, 0, 0, 1, 1,
0.7007701, 1.188944, 0.5395239, 1, 0, 0, 1, 1,
0.7021393, 0.3503081, -0.1088279, 1, 0, 0, 1, 1,
0.7050796, 0.08348838, 0.855417, 1, 0, 0, 1, 1,
0.7184411, -0.9090728, 3.062303, 1, 0, 0, 1, 1,
0.7278895, -0.4430299, 3.214802, 0, 0, 0, 1, 1,
0.7353265, 0.2950789, 1.28043, 0, 0, 0, 1, 1,
0.7383409, 0.4363227, 0.8595788, 0, 0, 0, 1, 1,
0.7391713, -1.033225, 0.8978865, 0, 0, 0, 1, 1,
0.7400099, -1.501858, 4.269408, 0, 0, 0, 1, 1,
0.7426147, -0.5507209, 1.29879, 0, 0, 0, 1, 1,
0.7442271, -0.6749781, 1.937897, 0, 0, 0, 1, 1,
0.7575825, 0.8344709, -1.014356, 1, 1, 1, 1, 1,
0.7605225, 0.6090216, 1.429699, 1, 1, 1, 1, 1,
0.7645981, 0.3894921, 0.6812096, 1, 1, 1, 1, 1,
0.7692657, -0.125898, 0.9234502, 1, 1, 1, 1, 1,
0.7745162, -0.6260216, 0.7247126, 1, 1, 1, 1, 1,
0.7797778, -2.09121, 2.631476, 1, 1, 1, 1, 1,
0.7869124, 0.6827514, 0.8730151, 1, 1, 1, 1, 1,
0.7969576, 0.2276892, 2.001588, 1, 1, 1, 1, 1,
0.7971247, -1.065821, 2.94942, 1, 1, 1, 1, 1,
0.8098873, 1.542885, -2.133959, 1, 1, 1, 1, 1,
0.8115827, 0.06948974, 1.848529, 1, 1, 1, 1, 1,
0.8132418, -1.409299, 2.468984, 1, 1, 1, 1, 1,
0.818304, -1.02151, 2.529713, 1, 1, 1, 1, 1,
0.8212638, -1.130897, 1.421071, 1, 1, 1, 1, 1,
0.8213639, -0.5377496, 1.622416, 1, 1, 1, 1, 1,
0.8245355, 0.295346, 0.1493055, 0, 0, 1, 1, 1,
0.8254675, -1.925291, 3.37314, 1, 0, 0, 1, 1,
0.8262191, -0.5615081, 1.98784, 1, 0, 0, 1, 1,
0.8274972, 1.217555, 1.892342, 1, 0, 0, 1, 1,
0.8283001, 0.2719642, 0.09976994, 1, 0, 0, 1, 1,
0.8283981, -0.8765627, 3.385098, 1, 0, 0, 1, 1,
0.8364142, -0.03199518, 1.047578, 0, 0, 0, 1, 1,
0.8371298, -0.6488171, 0.1748336, 0, 0, 0, 1, 1,
0.8466142, -1.718495, 1.814304, 0, 0, 0, 1, 1,
0.8472639, 0.2745926, 1.022538, 0, 0, 0, 1, 1,
0.8481681, -0.5335556, 2.053117, 0, 0, 0, 1, 1,
0.8609246, -0.2442965, 2.538121, 0, 0, 0, 1, 1,
0.8652005, -0.1735092, 1.673171, 0, 0, 0, 1, 1,
0.865771, -0.4933797, 2.137695, 1, 1, 1, 1, 1,
0.867018, 0.2334403, 1.589831, 1, 1, 1, 1, 1,
0.8759438, 0.725194, 1.293239, 1, 1, 1, 1, 1,
0.8775985, 1.762186, 1.000389, 1, 1, 1, 1, 1,
0.8845011, 1.009513, 1.383084, 1, 1, 1, 1, 1,
0.8846372, -0.3860259, 1.864246, 1, 1, 1, 1, 1,
0.8905056, 0.5455311, -0.06293076, 1, 1, 1, 1, 1,
0.8917047, -0.5019844, 2.864791, 1, 1, 1, 1, 1,
0.8994663, 1.098252, 1.363177, 1, 1, 1, 1, 1,
0.9015527, 1.623402, 0.1941527, 1, 1, 1, 1, 1,
0.9074957, -0.478018, 0.2549585, 1, 1, 1, 1, 1,
0.9154032, 0.194964, 1.405694, 1, 1, 1, 1, 1,
0.920518, 0.9106145, 0.2375808, 1, 1, 1, 1, 1,
0.9300025, 0.2748924, 0.8375918, 1, 1, 1, 1, 1,
0.9353518, -0.5045047, 1.72308, 1, 1, 1, 1, 1,
0.9364426, 0.008100444, 1.941096, 0, 0, 1, 1, 1,
0.9366109, 3.184466, -0.6233635, 1, 0, 0, 1, 1,
0.9376656, 0.01743685, 1.794161, 1, 0, 0, 1, 1,
0.9400274, -0.2449399, 0.9051614, 1, 0, 0, 1, 1,
0.9401082, -0.1121936, 0.426244, 1, 0, 0, 1, 1,
0.9459394, 0.07852823, 2.406947, 1, 0, 0, 1, 1,
0.9485379, -1.343387, 2.955053, 0, 0, 0, 1, 1,
0.973063, 1.339293, 1.489985, 0, 0, 0, 1, 1,
0.9764867, 1.721365, 1.103569, 0, 0, 0, 1, 1,
0.9819603, 0.9210082, 1.596538, 0, 0, 0, 1, 1,
0.983734, 1.49956, 1.144482, 0, 0, 0, 1, 1,
0.9867322, 0.2873317, 1.247998, 0, 0, 0, 1, 1,
0.987166, -1.094772, 3.760463, 0, 0, 0, 1, 1,
0.9922189, 0.7000393, 0.4665954, 1, 1, 1, 1, 1,
1.000293, -1.99819, 2.756014, 1, 1, 1, 1, 1,
1.016422, 0.2890295, 1.396492, 1, 1, 1, 1, 1,
1.022378, 0.873379, 0.186, 1, 1, 1, 1, 1,
1.030728, 0.3479611, 0.2654577, 1, 1, 1, 1, 1,
1.040868, 0.9687914, 1.449081, 1, 1, 1, 1, 1,
1.048937, -0.4300046, 2.259412, 1, 1, 1, 1, 1,
1.050001, 0.2868844, 0.9972719, 1, 1, 1, 1, 1,
1.075781, -0.09104045, 0.4502435, 1, 1, 1, 1, 1,
1.089212, 0.3432977, 2.837875, 1, 1, 1, 1, 1,
1.089657, -0.1537734, 0.6930813, 1, 1, 1, 1, 1,
1.094443, 0.8194055, 3.049646, 1, 1, 1, 1, 1,
1.107542, -0.6700037, 1.777194, 1, 1, 1, 1, 1,
1.114431, -0.7787428, 3.23005, 1, 1, 1, 1, 1,
1.115064, 1.289999, 0.2535601, 1, 1, 1, 1, 1,
1.119361, -0.09769242, 1.555601, 0, 0, 1, 1, 1,
1.131524, 0.4632295, 0.8535624, 1, 0, 0, 1, 1,
1.137217, 0.8597263, 2.534056, 1, 0, 0, 1, 1,
1.138412, -0.98862, 0.9729739, 1, 0, 0, 1, 1,
1.141136, 0.4477711, 3.490422, 1, 0, 0, 1, 1,
1.142613, -1.07748, 0.6108654, 1, 0, 0, 1, 1,
1.144496, 0.7506043, 0.365227, 0, 0, 0, 1, 1,
1.17468, 0.5080093, -0.1843814, 0, 0, 0, 1, 1,
1.178003, -0.4422796, 2.701306, 0, 0, 0, 1, 1,
1.184638, 0.7739207, -0.1549623, 0, 0, 0, 1, 1,
1.194104, 0.9152817, 0.678954, 0, 0, 0, 1, 1,
1.200863, -0.342413, 2.795147, 0, 0, 0, 1, 1,
1.201303, -1.168111, 3.323314, 0, 0, 0, 1, 1,
1.206254, -0.8911995, 0.7838211, 1, 1, 1, 1, 1,
1.234192, -1.165533, 4.049277, 1, 1, 1, 1, 1,
1.239195, 0.4254953, -0.6605177, 1, 1, 1, 1, 1,
1.254818, -0.4076276, 0.9833142, 1, 1, 1, 1, 1,
1.261955, -0.06894366, 1.463602, 1, 1, 1, 1, 1,
1.272504, -0.4524203, 3.270186, 1, 1, 1, 1, 1,
1.27392, -0.1187196, 0.3403028, 1, 1, 1, 1, 1,
1.276405, -0.2706954, 2.450144, 1, 1, 1, 1, 1,
1.279028, 1.139844, -0.1265378, 1, 1, 1, 1, 1,
1.280766, 0.7049791, 0.4135236, 1, 1, 1, 1, 1,
1.283503, -0.4908013, 1.463274, 1, 1, 1, 1, 1,
1.286856, 0.3615992, 2.029558, 1, 1, 1, 1, 1,
1.288939, 0.4600581, 2.164408, 1, 1, 1, 1, 1,
1.290631, 0.8483877, 0.8169399, 1, 1, 1, 1, 1,
1.291603, -0.8285959, 0.5884979, 1, 1, 1, 1, 1,
1.291738, -1.888196, 3.638339, 0, 0, 1, 1, 1,
1.304833, 1.335843, 2.075816, 1, 0, 0, 1, 1,
1.305703, -0.3511296, 2.575242, 1, 0, 0, 1, 1,
1.312936, -0.1146868, 2.571021, 1, 0, 0, 1, 1,
1.31301, -0.299269, 1.90299, 1, 0, 0, 1, 1,
1.313047, -0.06624511, 2.72104, 1, 0, 0, 1, 1,
1.315282, 0.689302, -0.7487475, 0, 0, 0, 1, 1,
1.347681, -2.406355, 3.672486, 0, 0, 0, 1, 1,
1.352736, -1.493665, 1.847303, 0, 0, 0, 1, 1,
1.358244, 0.2662179, 1.316366, 0, 0, 0, 1, 1,
1.378821, -0.5113839, 3.309779, 0, 0, 0, 1, 1,
1.38491, -1.095587, 2.051842, 0, 0, 0, 1, 1,
1.38689, 0.2703587, 2.334805, 0, 0, 0, 1, 1,
1.389731, -0.7783492, 4.007782, 1, 1, 1, 1, 1,
1.394825, -0.9789175, 1.61684, 1, 1, 1, 1, 1,
1.404315, 0.81792, 0.6383711, 1, 1, 1, 1, 1,
1.40806, -0.331286, 0.6668432, 1, 1, 1, 1, 1,
1.423879, 0.7939286, 2.003062, 1, 1, 1, 1, 1,
1.426594, -0.8695235, 2.142712, 1, 1, 1, 1, 1,
1.42704, 0.1391687, 1.688026, 1, 1, 1, 1, 1,
1.435619, -0.4064331, 1.55099, 1, 1, 1, 1, 1,
1.444671, -1.184661, 1.985627, 1, 1, 1, 1, 1,
1.445856, 1.143985, -0.9087994, 1, 1, 1, 1, 1,
1.44719, -0.6733901, 2.313563, 1, 1, 1, 1, 1,
1.449291, 0.08245511, 1.992842, 1, 1, 1, 1, 1,
1.455751, 0.3772617, 1.663751, 1, 1, 1, 1, 1,
1.4576, -1.500084, 3.492383, 1, 1, 1, 1, 1,
1.460791, 0.9228789, 1.531613, 1, 1, 1, 1, 1,
1.462449, -0.04982688, 0.2713279, 0, 0, 1, 1, 1,
1.465824, -1.181119, 2.782888, 1, 0, 0, 1, 1,
1.477679, -0.06582482, 0.9082269, 1, 0, 0, 1, 1,
1.483626, -0.4143192, 3.128973, 1, 0, 0, 1, 1,
1.486734, -0.6792592, 1.248848, 1, 0, 0, 1, 1,
1.486743, -1.822492, 1.676351, 1, 0, 0, 1, 1,
1.496693, -1.434577, 2.990591, 0, 0, 0, 1, 1,
1.511476, 1.954759, -1.546055, 0, 0, 0, 1, 1,
1.515897, -0.9254681, 0.4660488, 0, 0, 0, 1, 1,
1.543128, 1.010856, 0.9601258, 0, 0, 0, 1, 1,
1.573861, -0.6627235, 0.6835021, 0, 0, 0, 1, 1,
1.584427, -0.8625263, 1.450737, 0, 0, 0, 1, 1,
1.586669, 0.4100769, 2.834492, 0, 0, 0, 1, 1,
1.58954, 0.583715, 2.517831, 1, 1, 1, 1, 1,
1.600238, 0.2430282, 2.124903, 1, 1, 1, 1, 1,
1.603979, -0.2018971, 1.246817, 1, 1, 1, 1, 1,
1.637848, 0.9224172, 1.194442, 1, 1, 1, 1, 1,
1.640695, -1.318556, 1.144468, 1, 1, 1, 1, 1,
1.649189, -0.8796842, -0.0444111, 1, 1, 1, 1, 1,
1.657627, -0.3126999, 1.098643, 1, 1, 1, 1, 1,
1.667732, 2.354539, -0.8009402, 1, 1, 1, 1, 1,
1.681837, -1.135418, 0.5544359, 1, 1, 1, 1, 1,
1.684575, 0.6524342, 0.3230775, 1, 1, 1, 1, 1,
1.684806, 0.0473173, 3.636886, 1, 1, 1, 1, 1,
1.700984, -0.2129207, 0.2192393, 1, 1, 1, 1, 1,
1.729732, -0.2991658, 2.032031, 1, 1, 1, 1, 1,
1.744403, 0.5057102, 1.112682, 1, 1, 1, 1, 1,
1.745777, 1.390187, -1.98202, 1, 1, 1, 1, 1,
1.753386, 0.2701176, 1.692579, 0, 0, 1, 1, 1,
1.755599, -0.2808378, 2.091807, 1, 0, 0, 1, 1,
1.759851, -0.5198847, 2.395105, 1, 0, 0, 1, 1,
1.776445, 0.6880941, 1.324632, 1, 0, 0, 1, 1,
1.7802, -2.081749, 3.069924, 1, 0, 0, 1, 1,
1.788079, -1.380361, 2.229616, 1, 0, 0, 1, 1,
1.806057, -0.04852306, 1.888819, 0, 0, 0, 1, 1,
1.807442, -2.22652, 3.031991, 0, 0, 0, 1, 1,
1.81044, -2.488605, 2.011422, 0, 0, 0, 1, 1,
1.825684, -0.335347, -0.5144423, 0, 0, 0, 1, 1,
1.836279, -0.1302265, 2.412823, 0, 0, 0, 1, 1,
1.841109, 1.24284, -0.5941772, 0, 0, 0, 1, 1,
1.858578, -1.353172, 0.5447477, 0, 0, 0, 1, 1,
1.909706, -0.002765073, -0.2344247, 1, 1, 1, 1, 1,
1.913645, -1.855981, 3.036351, 1, 1, 1, 1, 1,
1.917019, -0.1615763, 2.428689, 1, 1, 1, 1, 1,
1.943211, 0.3746921, 0.7657332, 1, 1, 1, 1, 1,
1.963269, -0.7618671, 1.926002, 1, 1, 1, 1, 1,
1.971696, -0.8370266, 2.596313, 1, 1, 1, 1, 1,
1.977014, 1.324862, 0.3608715, 1, 1, 1, 1, 1,
1.979643, -1.631558, 3.315089, 1, 1, 1, 1, 1,
1.980654, 0.3895097, 0.1300007, 1, 1, 1, 1, 1,
2.029359, 0.5361001, 1.930466, 1, 1, 1, 1, 1,
2.034383, 0.3130812, 3.746467, 1, 1, 1, 1, 1,
2.054301, 1.296184, -0.5295135, 1, 1, 1, 1, 1,
2.057884, 0.9326231, 1.735416, 1, 1, 1, 1, 1,
2.102936, 0.6978741, -0.3002038, 1, 1, 1, 1, 1,
2.106474, -0.1552343, 0.1795807, 1, 1, 1, 1, 1,
2.111592, 1.285408, 2.970882, 0, 0, 1, 1, 1,
2.125632, -0.3929733, 1.545654, 1, 0, 0, 1, 1,
2.138596, 0.07882813, 1.09453, 1, 0, 0, 1, 1,
2.183683, -0.9234952, 1.53543, 1, 0, 0, 1, 1,
2.203936, -1.04895, 2.817284, 1, 0, 0, 1, 1,
2.217278, -0.9564686, 0.9560571, 1, 0, 0, 1, 1,
2.23401, 0.03708408, 2.201923, 0, 0, 0, 1, 1,
2.240213, 0.6477538, 1.376511, 0, 0, 0, 1, 1,
2.245715, -0.7723749, 1.649495, 0, 0, 0, 1, 1,
2.328725, -0.3855118, 2.735939, 0, 0, 0, 1, 1,
2.3577, 1.214797, -0.3660667, 0, 0, 0, 1, 1,
2.380391, -0.6307734, 2.54916, 0, 0, 0, 1, 1,
2.389093, 1.003154, 1.395653, 0, 0, 0, 1, 1,
2.426428, -1.230827, 3.493373, 1, 1, 1, 1, 1,
2.447022, -0.18115, 1.858593, 1, 1, 1, 1, 1,
2.598539, 0.9938706, 1.701698, 1, 1, 1, 1, 1,
2.768607, 1.486144, -0.4717704, 1, 1, 1, 1, 1,
3.138861, 0.987815, 1.594421, 1, 1, 1, 1, 1,
3.638934, 1.157377, 1.366207, 1, 1, 1, 1, 1,
3.870182, 0.6506342, -0.2550287, 1, 1, 1, 1, 1
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
var radius = 9.85938;
var distance = 34.63065;
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
mvMatrix.translate( -0.4546525, 0.379169, -0.02882075 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63065);
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
