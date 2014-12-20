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
-3.161213, -0.9140276, -2.537139, 1, 0, 0, 1,
-3.075841, 0.06501473, -2.423224, 1, 0.007843138, 0, 1,
-2.823056, 0.1834986, -0.9736607, 1, 0.01176471, 0, 1,
-2.772862, -1.62969, -2.151879, 1, 0.01960784, 0, 1,
-2.616224, -2.30881, -1.951544, 1, 0.02352941, 0, 1,
-2.580487, 0.5115657, -1.666208, 1, 0.03137255, 0, 1,
-2.556525, -0.5902796, -1.680369, 1, 0.03529412, 0, 1,
-2.551384, -0.09868015, -1.304107, 1, 0.04313726, 0, 1,
-2.539956, 1.241174, -1.311231, 1, 0.04705882, 0, 1,
-2.508495, 0.6107855, 2.224172, 1, 0.05490196, 0, 1,
-2.404608, 0.3993286, 0.2288605, 1, 0.05882353, 0, 1,
-2.328721, -0.1542594, -1.911889, 1, 0.06666667, 0, 1,
-2.301928, 0.8139344, -2.126055, 1, 0.07058824, 0, 1,
-2.252385, 1.349252, -1.613603, 1, 0.07843138, 0, 1,
-2.234787, 1.143291, -0.8107402, 1, 0.08235294, 0, 1,
-2.21082, -0.6885665, -2.979389, 1, 0.09019608, 0, 1,
-2.184317, -1.242247, -2.280734, 1, 0.09411765, 0, 1,
-2.18315, 0.3864022, -1.717368, 1, 0.1019608, 0, 1,
-2.172972, -0.7505361, -3.532279, 1, 0.1098039, 0, 1,
-2.155778, 1.142153, -0.8788028, 1, 0.1137255, 0, 1,
-2.148978, 1.418647, -1.526094, 1, 0.1215686, 0, 1,
-2.089305, -0.7262121, -3.250471, 1, 0.1254902, 0, 1,
-2.083597, 1.499641, -1.456415, 1, 0.1333333, 0, 1,
-2.079547, -0.1264752, -2.249623, 1, 0.1372549, 0, 1,
-2.060018, 0.8665154, -1.003451, 1, 0.145098, 0, 1,
-2.056111, 1.019982, 0.2900535, 1, 0.1490196, 0, 1,
-2.048364, -0.6112283, -1.009772, 1, 0.1568628, 0, 1,
-2.019397, 1.255076, -2.378368, 1, 0.1607843, 0, 1,
-2.017958, -0.2012423, -2.231746, 1, 0.1686275, 0, 1,
-2.003254, -0.9679273, -3.090618, 1, 0.172549, 0, 1,
-1.961957, 0.2123258, -1.928929, 1, 0.1803922, 0, 1,
-1.918754, 0.8123944, -2.35371, 1, 0.1843137, 0, 1,
-1.889767, -0.4453894, -2.465209, 1, 0.1921569, 0, 1,
-1.863834, -0.682559, -0.7579608, 1, 0.1960784, 0, 1,
-1.85775, 1.027466, 0.09963024, 1, 0.2039216, 0, 1,
-1.843064, -0.520289, -0.463329, 1, 0.2117647, 0, 1,
-1.809701, 0.04524777, 0.1245971, 1, 0.2156863, 0, 1,
-1.803053, 0.789184, -1.83903, 1, 0.2235294, 0, 1,
-1.797003, -2.354596, -2.611484, 1, 0.227451, 0, 1,
-1.796469, 0.3451958, -0.2373801, 1, 0.2352941, 0, 1,
-1.788717, -0.3345155, -0.8854283, 1, 0.2392157, 0, 1,
-1.779902, -1.092159, -3.640227, 1, 0.2470588, 0, 1,
-1.752917, -1.188424, -0.7246689, 1, 0.2509804, 0, 1,
-1.750648, -1.213622, -2.348147, 1, 0.2588235, 0, 1,
-1.746351, -0.1266799, -0.5310223, 1, 0.2627451, 0, 1,
-1.744199, -2.65594, -4.066274, 1, 0.2705882, 0, 1,
-1.743233, -0.8831996, -1.950101, 1, 0.2745098, 0, 1,
-1.743195, 0.3442056, -1.098666, 1, 0.282353, 0, 1,
-1.735536, -1.013159, -2.239575, 1, 0.2862745, 0, 1,
-1.727469, -0.6622974, -3.239448, 1, 0.2941177, 0, 1,
-1.722917, -1.286357, 0.2933204, 1, 0.3019608, 0, 1,
-1.70483, -0.8074779, -2.00484, 1, 0.3058824, 0, 1,
-1.694385, -0.8888311, -3.38086, 1, 0.3137255, 0, 1,
-1.666069, -1.065761, -0.7176723, 1, 0.3176471, 0, 1,
-1.652422, 1.905699, -1.472717, 1, 0.3254902, 0, 1,
-1.649332, 1.381762, -1.096058, 1, 0.3294118, 0, 1,
-1.630564, -0.2754548, -0.1013586, 1, 0.3372549, 0, 1,
-1.629991, -0.3482053, 0.2851492, 1, 0.3411765, 0, 1,
-1.627893, 0.2752016, -0.9552143, 1, 0.3490196, 0, 1,
-1.613181, -0.4080106, -1.413789, 1, 0.3529412, 0, 1,
-1.613097, -0.7560839, -0.9438862, 1, 0.3607843, 0, 1,
-1.596561, 1.038947, -3.732947, 1, 0.3647059, 0, 1,
-1.595186, -0.160441, -2.1048, 1, 0.372549, 0, 1,
-1.593321, -0.8510759, -1.010741, 1, 0.3764706, 0, 1,
-1.587278, -0.4212201, -1.832626, 1, 0.3843137, 0, 1,
-1.583558, -0.04171025, -2.566688, 1, 0.3882353, 0, 1,
-1.576962, -0.2295695, -2.076611, 1, 0.3960784, 0, 1,
-1.575155, 1.454824, -1.532264, 1, 0.4039216, 0, 1,
-1.563427, -0.1769155, -1.647518, 1, 0.4078431, 0, 1,
-1.56113, -0.05591783, -1.756054, 1, 0.4156863, 0, 1,
-1.559663, 0.9234186, -0.6304703, 1, 0.4196078, 0, 1,
-1.556121, -0.08835711, -0.4643969, 1, 0.427451, 0, 1,
-1.548067, -1.33226, -3.147635, 1, 0.4313726, 0, 1,
-1.534285, 0.8444197, -2.289457, 1, 0.4392157, 0, 1,
-1.521782, 0.9988968, -0.8311078, 1, 0.4431373, 0, 1,
-1.509243, 0.9747778, -2.283343, 1, 0.4509804, 0, 1,
-1.505687, -0.4854667, 0.1095205, 1, 0.454902, 0, 1,
-1.501338, 0.126017, -1.007541, 1, 0.4627451, 0, 1,
-1.500084, -0.2682818, -1.603632, 1, 0.4666667, 0, 1,
-1.486747, 0.696057, 0.03110337, 1, 0.4745098, 0, 1,
-1.479081, 0.7481135, -2.116796, 1, 0.4784314, 0, 1,
-1.471163, 0.6028878, -0.812659, 1, 0.4862745, 0, 1,
-1.429505, 0.06886224, -2.260178, 1, 0.4901961, 0, 1,
-1.428648, 0.3966295, -1.698811, 1, 0.4980392, 0, 1,
-1.420511, -0.5160285, -2.429196, 1, 0.5058824, 0, 1,
-1.413643, 0.01460907, -1.812054, 1, 0.509804, 0, 1,
-1.413505, -1.112167, -0.8678575, 1, 0.5176471, 0, 1,
-1.413155, 0.3755288, -1.273112, 1, 0.5215687, 0, 1,
-1.409396, -0.07975943, -2.514394, 1, 0.5294118, 0, 1,
-1.408846, 1.15387, -0.3495398, 1, 0.5333334, 0, 1,
-1.408427, 1.906519, 1.087495, 1, 0.5411765, 0, 1,
-1.405538, -0.2062976, -2.966518, 1, 0.5450981, 0, 1,
-1.403075, 1.690465, -0.3653307, 1, 0.5529412, 0, 1,
-1.392768, 0.3593669, -1.707963, 1, 0.5568628, 0, 1,
-1.388555, 0.2587171, -1.133514, 1, 0.5647059, 0, 1,
-1.383859, -0.03938141, 0.0882111, 1, 0.5686275, 0, 1,
-1.375343, 1.164513, -1.735003, 1, 0.5764706, 0, 1,
-1.357174, 1.230305, -2.736981, 1, 0.5803922, 0, 1,
-1.355268, -1.432091, -1.313529, 1, 0.5882353, 0, 1,
-1.346134, 1.579463, 0.3871321, 1, 0.5921569, 0, 1,
-1.346068, 0.9857322, -0.5522316, 1, 0.6, 0, 1,
-1.337579, -0.6507799, -2.235625, 1, 0.6078432, 0, 1,
-1.337104, -0.8042981, -1.974329, 1, 0.6117647, 0, 1,
-1.33255, -0.294531, 0.2439754, 1, 0.6196079, 0, 1,
-1.328307, -0.351503, -2.76972, 1, 0.6235294, 0, 1,
-1.314286, 0.4026914, -1.320539, 1, 0.6313726, 0, 1,
-1.308087, -0.5595341, -0.8500175, 1, 0.6352941, 0, 1,
-1.28552, -0.6047689, -0.1828836, 1, 0.6431373, 0, 1,
-1.268796, -0.6424893, -2.127608, 1, 0.6470588, 0, 1,
-1.267702, 0.6134032, 0.7843483, 1, 0.654902, 0, 1,
-1.265857, -0.1429435, -3.795863, 1, 0.6588235, 0, 1,
-1.262408, -1.330303, -2.670074, 1, 0.6666667, 0, 1,
-1.262089, 1.38238, -0.3627092, 1, 0.6705883, 0, 1,
-1.253943, 0.5246292, -2.524274, 1, 0.6784314, 0, 1,
-1.246072, -0.7492454, -1.357167, 1, 0.682353, 0, 1,
-1.244482, -1.304662, -2.576995, 1, 0.6901961, 0, 1,
-1.23636, -0.5133922, -1.024439, 1, 0.6941177, 0, 1,
-1.235598, 2.276602, -0.06620122, 1, 0.7019608, 0, 1,
-1.234171, -0.6660653, -1.795323, 1, 0.7098039, 0, 1,
-1.230583, 1.973711, -1.107781, 1, 0.7137255, 0, 1,
-1.224574, 0.3063042, -1.94082, 1, 0.7215686, 0, 1,
-1.223174, -0.3608034, -3.138451, 1, 0.7254902, 0, 1,
-1.217932, -0.6431062, -2.359052, 1, 0.7333333, 0, 1,
-1.207992, 0.01639049, -1.32119, 1, 0.7372549, 0, 1,
-1.205138, 0.9970213, 0.3328076, 1, 0.7450981, 0, 1,
-1.175952, -0.6665746, -1.402792, 1, 0.7490196, 0, 1,
-1.173068, 0.6335229, -0.228845, 1, 0.7568628, 0, 1,
-1.171284, 1.24743, 0.2914105, 1, 0.7607843, 0, 1,
-1.16751, -1.930454, 0.06439238, 1, 0.7686275, 0, 1,
-1.167458, 1.06467, -2.252336, 1, 0.772549, 0, 1,
-1.148782, -1.045737, -1.700813, 1, 0.7803922, 0, 1,
-1.142271, 0.3789726, -2.582652, 1, 0.7843137, 0, 1,
-1.142046, 1.711908, -0.9331982, 1, 0.7921569, 0, 1,
-1.140152, -1.355388, -3.275947, 1, 0.7960784, 0, 1,
-1.137358, 0.3293581, -0.4577554, 1, 0.8039216, 0, 1,
-1.125041, 0.9141952, -0.1942933, 1, 0.8117647, 0, 1,
-1.124587, -0.2232646, -1.997604, 1, 0.8156863, 0, 1,
-1.124474, -0.9249747, -3.460361, 1, 0.8235294, 0, 1,
-1.121234, 0.6451729, -2.952886, 1, 0.827451, 0, 1,
-1.120744, 0.5919967, -1.125695, 1, 0.8352941, 0, 1,
-1.110556, 0.6817124, -0.5336087, 1, 0.8392157, 0, 1,
-1.11047, -0.01960884, -4.187072, 1, 0.8470588, 0, 1,
-1.107137, -0.007255135, -1.380892, 1, 0.8509804, 0, 1,
-1.09203, -0.2537858, -1.644051, 1, 0.8588235, 0, 1,
-1.076077, -1.214587, -2.592733, 1, 0.8627451, 0, 1,
-1.075299, -0.5844724, -2.396956, 1, 0.8705882, 0, 1,
-1.069361, 2.133903, -0.7381397, 1, 0.8745098, 0, 1,
-1.066498, 0.7385473, -1.303198, 1, 0.8823529, 0, 1,
-1.064053, -1.312808, -2.442848, 1, 0.8862745, 0, 1,
-1.040465, 0.4868299, -1.379868, 1, 0.8941177, 0, 1,
-1.037613, -1.857496, -2.710985, 1, 0.8980392, 0, 1,
-1.028968, -1.56204, -3.333116, 1, 0.9058824, 0, 1,
-1.01678, -0.1669873, -0.7851896, 1, 0.9137255, 0, 1,
-1.01673, -1.090422, -2.537726, 1, 0.9176471, 0, 1,
-1.014757, -0.3777752, -1.29553, 1, 0.9254902, 0, 1,
-1.013471, 0.9937891, -2.094023, 1, 0.9294118, 0, 1,
-1.012098, 0.001324074, -1.59532, 1, 0.9372549, 0, 1,
-1.01192, -0.894919, -2.922498, 1, 0.9411765, 0, 1,
-1.0116, 0.289267, -1.535995, 1, 0.9490196, 0, 1,
-1.011462, -1.407647, -2.272163, 1, 0.9529412, 0, 1,
-1.00633, 1.786649, -0.9731364, 1, 0.9607843, 0, 1,
-1.001278, -1.529001, -3.457897, 1, 0.9647059, 0, 1,
-0.9982756, -0.7223895, -1.354607, 1, 0.972549, 0, 1,
-0.9963761, -1.205256, -2.68485, 1, 0.9764706, 0, 1,
-0.9910731, 0.8080575, -1.866003, 1, 0.9843137, 0, 1,
-0.9826033, 0.7077764, -1.54728, 1, 0.9882353, 0, 1,
-0.9786573, 0.9939618, 0.1314306, 1, 0.9960784, 0, 1,
-0.9738932, 0.114131, -0.9051524, 0.9960784, 1, 0, 1,
-0.9603292, 0.1100895, 0.06153295, 0.9921569, 1, 0, 1,
-0.9562269, -0.7036889, -3.455824, 0.9843137, 1, 0, 1,
-0.9549766, 0.148207, -0.6259714, 0.9803922, 1, 0, 1,
-0.9530247, -0.6960666, -1.59423, 0.972549, 1, 0, 1,
-0.9419208, 0.9973208, -0.5159981, 0.9686275, 1, 0, 1,
-0.9335009, 1.250861, 0.7910778, 0.9607843, 1, 0, 1,
-0.9327369, -0.5663885, -2.771509, 0.9568627, 1, 0, 1,
-0.9321533, 1.630904, -2.746393, 0.9490196, 1, 0, 1,
-0.925502, 1.636327, -1.126288, 0.945098, 1, 0, 1,
-0.9203337, -1.449528, -2.735471, 0.9372549, 1, 0, 1,
-0.9199679, 1.063315, -0.8568606, 0.9333333, 1, 0, 1,
-0.9193783, -0.9165223, -3.391981, 0.9254902, 1, 0, 1,
-0.9163944, 1.18841, -1.033079, 0.9215686, 1, 0, 1,
-0.9153861, 0.2214308, -1.599774, 0.9137255, 1, 0, 1,
-0.9131075, -1.048241, -2.385421, 0.9098039, 1, 0, 1,
-0.9110106, 0.9855146, 1.023098, 0.9019608, 1, 0, 1,
-0.9089217, 1.646836, -1.859241, 0.8941177, 1, 0, 1,
-0.9069003, 0.06372453, -2.782038, 0.8901961, 1, 0, 1,
-0.900985, -0.3640005, -1.400266, 0.8823529, 1, 0, 1,
-0.8974115, 0.3624826, -1.973357, 0.8784314, 1, 0, 1,
-0.8951692, -1.096326, -2.749712, 0.8705882, 1, 0, 1,
-0.8914455, 0.3331181, 0.02040765, 0.8666667, 1, 0, 1,
-0.8828474, -0.3624788, -1.836263, 0.8588235, 1, 0, 1,
-0.8788672, -1.492685, -2.882095, 0.854902, 1, 0, 1,
-0.8688093, 0.1358081, -2.080646, 0.8470588, 1, 0, 1,
-0.8679183, 1.331555, -0.5737438, 0.8431373, 1, 0, 1,
-0.8657494, 2.031883, -1.301272, 0.8352941, 1, 0, 1,
-0.8577022, 0.03042003, -1.724587, 0.8313726, 1, 0, 1,
-0.8573201, 0.4173974, -0.9185836, 0.8235294, 1, 0, 1,
-0.8506284, 0.02704618, -3.093962, 0.8196079, 1, 0, 1,
-0.8363179, 2.076246, -0.5990717, 0.8117647, 1, 0, 1,
-0.8355879, -1.35203, -1.671669, 0.8078431, 1, 0, 1,
-0.8350454, 0.6040176, -2.16105, 0.8, 1, 0, 1,
-0.8326519, 0.8134477, -1.845883, 0.7921569, 1, 0, 1,
-0.8289278, 0.1687725, -2.615824, 0.7882353, 1, 0, 1,
-0.8255566, -0.5203071, -2.114554, 0.7803922, 1, 0, 1,
-0.8249055, -0.6836433, -1.713485, 0.7764706, 1, 0, 1,
-0.824095, 0.3458116, -1.05026, 0.7686275, 1, 0, 1,
-0.8239487, -0.9148981, -1.536092, 0.7647059, 1, 0, 1,
-0.8235347, -0.1773645, -2.712411, 0.7568628, 1, 0, 1,
-0.8231174, -1.864539, -2.443426, 0.7529412, 1, 0, 1,
-0.8221957, 0.2976609, -0.6387591, 0.7450981, 1, 0, 1,
-0.8113016, -1.281719, -1.866215, 0.7411765, 1, 0, 1,
-0.8092611, 0.004814147, -0.5575829, 0.7333333, 1, 0, 1,
-0.8046677, -1.078714, -3.570572, 0.7294118, 1, 0, 1,
-0.8023127, 0.6330261, -0.1026437, 0.7215686, 1, 0, 1,
-0.7997907, -2.268733, -4.319563, 0.7176471, 1, 0, 1,
-0.7961346, -1.390758, -1.754676, 0.7098039, 1, 0, 1,
-0.7959875, 0.3252733, -1.2095, 0.7058824, 1, 0, 1,
-0.7955043, 0.9935648, -2.018981, 0.6980392, 1, 0, 1,
-0.79398, 1.609533, -0.5010303, 0.6901961, 1, 0, 1,
-0.7869428, -0.2878807, -1.64121, 0.6862745, 1, 0, 1,
-0.7841861, 1.312733, -1.343913, 0.6784314, 1, 0, 1,
-0.7773957, -1.712971, -3.351306, 0.6745098, 1, 0, 1,
-0.7733271, -1.651761, -2.938162, 0.6666667, 1, 0, 1,
-0.7654542, -0.1160722, -1.901113, 0.6627451, 1, 0, 1,
-0.7644234, 0.08087521, 0.5469375, 0.654902, 1, 0, 1,
-0.7578444, 1.375876, -2.004983, 0.6509804, 1, 0, 1,
-0.7569479, 0.6098341, 0.4890859, 0.6431373, 1, 0, 1,
-0.7561299, -0.144603, -1.696054, 0.6392157, 1, 0, 1,
-0.7534594, 0.06584457, -3.007589, 0.6313726, 1, 0, 1,
-0.7507672, 0.4843114, -1.104128, 0.627451, 1, 0, 1,
-0.7413853, -0.6025519, -1.882258, 0.6196079, 1, 0, 1,
-0.7403957, -0.4924672, -3.46719, 0.6156863, 1, 0, 1,
-0.7366027, -0.2640937, -2.171955, 0.6078432, 1, 0, 1,
-0.7364764, 0.5835671, -2.103839, 0.6039216, 1, 0, 1,
-0.7346914, 3.136354, -0.128591, 0.5960785, 1, 0, 1,
-0.7322989, 1.692543, 0.1401196, 0.5882353, 1, 0, 1,
-0.7155918, 0.7762158, 1.186625, 0.5843138, 1, 0, 1,
-0.7077546, 0.3527077, -0.6809481, 0.5764706, 1, 0, 1,
-0.6945362, 0.5965559, -3.273364, 0.572549, 1, 0, 1,
-0.6822418, -0.6997843, -2.972909, 0.5647059, 1, 0, 1,
-0.68186, 2.434709, -0.8496822, 0.5607843, 1, 0, 1,
-0.6818537, 1.197391, -0.8125269, 0.5529412, 1, 0, 1,
-0.6616259, -0.3581659, -0.4320774, 0.5490196, 1, 0, 1,
-0.6592831, 0.03830734, -1.089377, 0.5411765, 1, 0, 1,
-0.6588944, -1.266792, -3.61267, 0.5372549, 1, 0, 1,
-0.6583039, 1.069296, -0.823005, 0.5294118, 1, 0, 1,
-0.6533747, -1.021819, -2.282797, 0.5254902, 1, 0, 1,
-0.6526347, -0.4692106, -1.704658, 0.5176471, 1, 0, 1,
-0.6512061, -0.1291533, -0.6871884, 0.5137255, 1, 0, 1,
-0.6504206, 1.940746, -0.3766749, 0.5058824, 1, 0, 1,
-0.650349, 0.4928245, -2.144401, 0.5019608, 1, 0, 1,
-0.6502281, -0.6630232, -2.822026, 0.4941176, 1, 0, 1,
-0.6495388, -0.8073972, -3.367787, 0.4862745, 1, 0, 1,
-0.6487222, -0.01289332, -1.401865, 0.4823529, 1, 0, 1,
-0.6455871, 0.2504694, -1.580825, 0.4745098, 1, 0, 1,
-0.6440876, 1.457252, -0.5516311, 0.4705882, 1, 0, 1,
-0.6431507, -0.2583946, -1.141632, 0.4627451, 1, 0, 1,
-0.6412271, -0.7777604, -3.200461, 0.4588235, 1, 0, 1,
-0.6297768, 0.06858917, -1.540931, 0.4509804, 1, 0, 1,
-0.62739, 0.6695282, 0.3816575, 0.4470588, 1, 0, 1,
-0.6266003, -0.3343838, -2.397854, 0.4392157, 1, 0, 1,
-0.6255698, -0.257405, -3.05389, 0.4352941, 1, 0, 1,
-0.6244925, 1.169823, -0.126183, 0.427451, 1, 0, 1,
-0.6221318, 0.1243861, -1.472774, 0.4235294, 1, 0, 1,
-0.621993, 0.001819954, -1.674753, 0.4156863, 1, 0, 1,
-0.6122659, -0.7143771, -2.890337, 0.4117647, 1, 0, 1,
-0.5925496, -0.1505722, -2.28212, 0.4039216, 1, 0, 1,
-0.5917237, 0.2100587, -1.498463, 0.3960784, 1, 0, 1,
-0.5901315, -0.4710242, -3.904132, 0.3921569, 1, 0, 1,
-0.5858334, 1.674403, -1.057355, 0.3843137, 1, 0, 1,
-0.5770953, -0.7670999, -1.274718, 0.3803922, 1, 0, 1,
-0.5743523, 1.587718, -0.08498163, 0.372549, 1, 0, 1,
-0.5715454, -1.970389, -2.437888, 0.3686275, 1, 0, 1,
-0.5619698, -0.5790879, -2.502256, 0.3607843, 1, 0, 1,
-0.5607229, 0.5593609, -1.282829, 0.3568628, 1, 0, 1,
-0.5598197, -2.069877, -3.156475, 0.3490196, 1, 0, 1,
-0.5596097, 0.5590044, 0.06866787, 0.345098, 1, 0, 1,
-0.5585095, -0.3702887, -4.096338, 0.3372549, 1, 0, 1,
-0.5580991, -1.248531, -4.132616, 0.3333333, 1, 0, 1,
-0.5539732, -0.844875, -1.512772, 0.3254902, 1, 0, 1,
-0.552829, 0.3579423, -2.13505, 0.3215686, 1, 0, 1,
-0.5495788, 0.4835432, -0.3429759, 0.3137255, 1, 0, 1,
-0.5473301, 0.9286577, -2.135186, 0.3098039, 1, 0, 1,
-0.5469762, -0.3013011, -1.908851, 0.3019608, 1, 0, 1,
-0.5418422, -0.3589012, -3.611311, 0.2941177, 1, 0, 1,
-0.5412993, -0.3289235, -1.237489, 0.2901961, 1, 0, 1,
-0.5398914, 0.4725825, 0.2322986, 0.282353, 1, 0, 1,
-0.5370414, 1.052937, -2.023552, 0.2784314, 1, 0, 1,
-0.5307195, 2.268622, 0.4172004, 0.2705882, 1, 0, 1,
-0.5274854, -1.102923, -4.982282, 0.2666667, 1, 0, 1,
-0.5221906, -0.6742182, -2.572279, 0.2588235, 1, 0, 1,
-0.5202767, 0.09148459, -0.8554943, 0.254902, 1, 0, 1,
-0.5142819, 0.7086025, 1.908715, 0.2470588, 1, 0, 1,
-0.5117235, 0.8341841, -0.3197737, 0.2431373, 1, 0, 1,
-0.5116274, 0.4707685, -2.561065, 0.2352941, 1, 0, 1,
-0.5079886, 0.1310697, -1.631701, 0.2313726, 1, 0, 1,
-0.5057407, -0.6665886, -3.109774, 0.2235294, 1, 0, 1,
-0.5027594, 0.9085899, -0.6852138, 0.2196078, 1, 0, 1,
-0.5017005, -1.221117, -4.040927, 0.2117647, 1, 0, 1,
-0.5015845, 0.5518122, -0.008429918, 0.2078431, 1, 0, 1,
-0.4994061, 0.8783994, -0.1847371, 0.2, 1, 0, 1,
-0.49914, 0.7616863, -0.3831841, 0.1921569, 1, 0, 1,
-0.497631, 0.9939796, -0.3625893, 0.1882353, 1, 0, 1,
-0.4973959, 0.9247892, -0.4668799, 0.1803922, 1, 0, 1,
-0.4930909, 1.859883, 2.179842, 0.1764706, 1, 0, 1,
-0.4924025, -1.4832, -1.527654, 0.1686275, 1, 0, 1,
-0.4878696, 0.08783473, -0.7213113, 0.1647059, 1, 0, 1,
-0.483078, 0.2273941, -0.8491496, 0.1568628, 1, 0, 1,
-0.4822032, -0.1784972, -2.03337, 0.1529412, 1, 0, 1,
-0.4805274, 0.4208443, -1.655116, 0.145098, 1, 0, 1,
-0.4794662, -0.1672677, -1.082407, 0.1411765, 1, 0, 1,
-0.4750994, -0.4053614, -2.51029, 0.1333333, 1, 0, 1,
-0.4737925, 1.685987, -0.3798304, 0.1294118, 1, 0, 1,
-0.4711795, -0.5386119, -2.35353, 0.1215686, 1, 0, 1,
-0.4710361, 0.9125377, -0.7911945, 0.1176471, 1, 0, 1,
-0.4682395, -0.7504767, -3.214407, 0.1098039, 1, 0, 1,
-0.4645476, -0.7301303, -2.835037, 0.1058824, 1, 0, 1,
-0.4585322, 0.4759263, -0.1399553, 0.09803922, 1, 0, 1,
-0.4582244, -1.187408, -4.441488, 0.09019608, 1, 0, 1,
-0.4570016, 0.02592167, -1.828181, 0.08627451, 1, 0, 1,
-0.4555291, -0.5223384, -4.008533, 0.07843138, 1, 0, 1,
-0.4543968, 0.3569738, -3.462062, 0.07450981, 1, 0, 1,
-0.4481902, -0.5416443, -3.148326, 0.06666667, 1, 0, 1,
-0.4456313, -0.5699095, -3.064904, 0.0627451, 1, 0, 1,
-0.4443612, 0.1497456, -1.161697, 0.05490196, 1, 0, 1,
-0.4430329, -1.300433, -4.485662, 0.05098039, 1, 0, 1,
-0.4430321, -0.006621657, -1.521271, 0.04313726, 1, 0, 1,
-0.4418943, 0.01433078, -1.038823, 0.03921569, 1, 0, 1,
-0.4397585, 0.7313833, -0.1495416, 0.03137255, 1, 0, 1,
-0.4367001, 0.008583854, -0.7533431, 0.02745098, 1, 0, 1,
-0.4330632, -1.482116, -3.39638, 0.01960784, 1, 0, 1,
-0.4288101, 0.7416201, -0.2788916, 0.01568628, 1, 0, 1,
-0.4155562, 1.651304, 0.01631519, 0.007843138, 1, 0, 1,
-0.414885, 0.7027745, -1.876802, 0.003921569, 1, 0, 1,
-0.4145771, -0.03069823, -2.898211, 0, 1, 0.003921569, 1,
-0.412739, 1.715595, -0.09280024, 0, 1, 0.01176471, 1,
-0.4064261, 0.6745354, 1.94161, 0, 1, 0.01568628, 1,
-0.4060471, -0.4658342, -0.2780063, 0, 1, 0.02352941, 1,
-0.4036946, 1.314369, 0.6757634, 0, 1, 0.02745098, 1,
-0.4021952, 0.5586353, -1.279484, 0, 1, 0.03529412, 1,
-0.3998175, 0.4948836, -0.7340549, 0, 1, 0.03921569, 1,
-0.3924904, -0.0885165, -1.324796, 0, 1, 0.04705882, 1,
-0.3919515, 0.335803, 1.843771, 0, 1, 0.05098039, 1,
-0.3906569, -0.7613242, -3.612123, 0, 1, 0.05882353, 1,
-0.3847733, -0.6490471, -2.858099, 0, 1, 0.0627451, 1,
-0.3808502, -1.357921, -3.246511, 0, 1, 0.07058824, 1,
-0.3807999, -0.03764119, -1.191123, 0, 1, 0.07450981, 1,
-0.3798352, 0.0742024, -1.577839, 0, 1, 0.08235294, 1,
-0.3734868, -0.7215165, -2.581032, 0, 1, 0.08627451, 1,
-0.3710171, 0.7810897, -1.402243, 0, 1, 0.09411765, 1,
-0.3674568, 0.7055117, -1.430621, 0, 1, 0.1019608, 1,
-0.3577409, -1.307023, -2.999047, 0, 1, 0.1058824, 1,
-0.356676, 0.9278324, -1.486567, 0, 1, 0.1137255, 1,
-0.3565593, 1.803056, -1.247082, 0, 1, 0.1176471, 1,
-0.3513281, 0.7009521, 0.9464085, 0, 1, 0.1254902, 1,
-0.3513216, -0.9119495, -2.149936, 0, 1, 0.1294118, 1,
-0.3460112, 0.3695531, 0.2802818, 0, 1, 0.1372549, 1,
-0.3411952, -0.5240197, -1.138857, 0, 1, 0.1411765, 1,
-0.3386647, 0.9047525, -0.9574574, 0, 1, 0.1490196, 1,
-0.3381176, 0.3339389, 0.6911622, 0, 1, 0.1529412, 1,
-0.3224398, 1.174005, 0.1493388, 0, 1, 0.1607843, 1,
-0.3199671, -0.2417005, -2.879534, 0, 1, 0.1647059, 1,
-0.3172044, -2.303274, -3.067922, 0, 1, 0.172549, 1,
-0.3134477, -0.4531507, -1.619219, 0, 1, 0.1764706, 1,
-0.3113173, 0.06877716, -2.391152, 0, 1, 0.1843137, 1,
-0.3089699, 0.02182763, -1.627471, 0, 1, 0.1882353, 1,
-0.3089386, -1.46115, -2.951435, 0, 1, 0.1960784, 1,
-0.3089125, -0.3719887, -2.604946, 0, 1, 0.2039216, 1,
-0.3068562, -1.465073, -3.684069, 0, 1, 0.2078431, 1,
-0.3039657, 0.3888971, -1.239088, 0, 1, 0.2156863, 1,
-0.3005513, -1.336791, -3.737046, 0, 1, 0.2196078, 1,
-0.2973757, -0.4714201, -2.730889, 0, 1, 0.227451, 1,
-0.2943717, 5.571814e-05, -2.06829, 0, 1, 0.2313726, 1,
-0.2939938, -0.5494038, -3.05118, 0, 1, 0.2392157, 1,
-0.293395, 0.07548326, -1.748078, 0, 1, 0.2431373, 1,
-0.2923529, -0.02079291, -1.484486, 0, 1, 0.2509804, 1,
-0.2920639, -2.216025, -2.491027, 0, 1, 0.254902, 1,
-0.291375, -1.603524, -2.44745, 0, 1, 0.2627451, 1,
-0.28965, 0.3132777, -0.5633869, 0, 1, 0.2666667, 1,
-0.2893934, 0.7017131, -0.5834808, 0, 1, 0.2745098, 1,
-0.2892988, -1.352157, -4.966334, 0, 1, 0.2784314, 1,
-0.2854882, -0.3226312, -2.229836, 0, 1, 0.2862745, 1,
-0.2779963, -0.45115, -2.086747, 0, 1, 0.2901961, 1,
-0.2778752, -0.202391, -1.707166, 0, 1, 0.2980392, 1,
-0.2765133, 1.194872, 0.0880975, 0, 1, 0.3058824, 1,
-0.2764273, 1.61761, -1.18932, 0, 1, 0.3098039, 1,
-0.2649332, 0.9261867, -0.8737537, 0, 1, 0.3176471, 1,
-0.2626851, -0.1184044, -1.533164, 0, 1, 0.3215686, 1,
-0.2603676, -0.4402367, -3.95344, 0, 1, 0.3294118, 1,
-0.2597386, 0.7681784, 1.276433, 0, 1, 0.3333333, 1,
-0.2563703, -0.2664684, -3.245905, 0, 1, 0.3411765, 1,
-0.2532497, -0.142601, -1.636401, 0, 1, 0.345098, 1,
-0.2509905, -0.213293, -3.70155, 0, 1, 0.3529412, 1,
-0.2505809, -1.325878, -2.1816, 0, 1, 0.3568628, 1,
-0.2487571, -0.1578366, -1.145049, 0, 1, 0.3647059, 1,
-0.2469244, 0.2425514, -0.3183377, 0, 1, 0.3686275, 1,
-0.2444479, 0.1621747, -1.588296, 0, 1, 0.3764706, 1,
-0.2411891, 1.405827, -0.1496481, 0, 1, 0.3803922, 1,
-0.2336553, 0.2669381, -0.4837496, 0, 1, 0.3882353, 1,
-0.2282291, 0.0285267, -1.444878, 0, 1, 0.3921569, 1,
-0.2277679, -1.177906, -1.521585, 0, 1, 0.4, 1,
-0.2255132, 1.066877, 0.1664587, 0, 1, 0.4078431, 1,
-0.2253398, -0.5001478, -1.868228, 0, 1, 0.4117647, 1,
-0.2198296, 0.6722966, -0.2170244, 0, 1, 0.4196078, 1,
-0.2164465, 0.146126, -0.7367743, 0, 1, 0.4235294, 1,
-0.2160637, -1.474308, -4.12685, 0, 1, 0.4313726, 1,
-0.2145811, 0.5120967, 0.251133, 0, 1, 0.4352941, 1,
-0.2124091, -0.04129997, -1.849082, 0, 1, 0.4431373, 1,
-0.2102697, 0.7868268, 1.456141, 0, 1, 0.4470588, 1,
-0.2092827, 0.8556168, 0.1157658, 0, 1, 0.454902, 1,
-0.2088704, -0.3098359, -1.422299, 0, 1, 0.4588235, 1,
-0.208335, 0.4690575, -1.318463, 0, 1, 0.4666667, 1,
-0.2076873, -1.664261, -2.97705, 0, 1, 0.4705882, 1,
-0.2066421, -0.9672124, -4.391443, 0, 1, 0.4784314, 1,
-0.1939298, 0.03156702, -1.876796, 0, 1, 0.4823529, 1,
-0.1890526, 1.11939, -1.996048, 0, 1, 0.4901961, 1,
-0.188377, -0.2523713, -3.698462, 0, 1, 0.4941176, 1,
-0.1881435, 1.389682, -1.416519, 0, 1, 0.5019608, 1,
-0.1879122, 1.343116, -1.670311, 0, 1, 0.509804, 1,
-0.1836134, 0.1595381, -0.1678247, 0, 1, 0.5137255, 1,
-0.1835537, -0.8790667, -2.471685, 0, 1, 0.5215687, 1,
-0.1831774, -0.1234912, -2.644886, 0, 1, 0.5254902, 1,
-0.1828526, -0.07182748, -1.112953, 0, 1, 0.5333334, 1,
-0.1743196, 0.8415457, -0.7462338, 0, 1, 0.5372549, 1,
-0.1724244, -0.6392325, -3.483194, 0, 1, 0.5450981, 1,
-0.1704676, -1.115736, -1.451256, 0, 1, 0.5490196, 1,
-0.1698499, -3.545304, -3.286931, 0, 1, 0.5568628, 1,
-0.1698475, -0.4455488, -5.750685, 0, 1, 0.5607843, 1,
-0.1693344, -2.987469, -2.053154, 0, 1, 0.5686275, 1,
-0.1689089, -1.4353, -3.288496, 0, 1, 0.572549, 1,
-0.1659707, -0.6620923, -2.17568, 0, 1, 0.5803922, 1,
-0.1644795, 0.2533706, 0.0829476, 0, 1, 0.5843138, 1,
-0.1633403, -0.4535905, -2.710535, 0, 1, 0.5921569, 1,
-0.1605371, 0.08106649, -0.2246758, 0, 1, 0.5960785, 1,
-0.1542901, -0.6035867, -3.965661, 0, 1, 0.6039216, 1,
-0.1530797, -0.1011591, -2.014458, 0, 1, 0.6117647, 1,
-0.151283, 0.6685693, -1.46953, 0, 1, 0.6156863, 1,
-0.1511184, 0.2765193, -1.613815, 0, 1, 0.6235294, 1,
-0.151033, 0.7902011, -1.455469, 0, 1, 0.627451, 1,
-0.1488446, -1.039057, -2.123826, 0, 1, 0.6352941, 1,
-0.1484364, -0.08032592, -2.041236, 0, 1, 0.6392157, 1,
-0.1471297, 0.9427264, 0.7288754, 0, 1, 0.6470588, 1,
-0.1434606, 1.014757, -1.389575, 0, 1, 0.6509804, 1,
-0.1424911, -0.2703638, -3.612063, 0, 1, 0.6588235, 1,
-0.1403348, 0.9127396, -0.1146954, 0, 1, 0.6627451, 1,
-0.1397401, 1.587272, -1.091358, 0, 1, 0.6705883, 1,
-0.1381858, 0.7246453, -0.1017847, 0, 1, 0.6745098, 1,
-0.133168, -0.7707549, -4.52108, 0, 1, 0.682353, 1,
-0.1312938, 0.1532967, -0.009113986, 0, 1, 0.6862745, 1,
-0.1286879, 0.4894075, -0.1136281, 0, 1, 0.6941177, 1,
-0.124792, 0.1706326, -1.83301, 0, 1, 0.7019608, 1,
-0.1191525, -1.576184, -2.721521, 0, 1, 0.7058824, 1,
-0.1189569, 1.049674, -0.769899, 0, 1, 0.7137255, 1,
-0.1187587, -1.796548, -3.363883, 0, 1, 0.7176471, 1,
-0.1149348, 0.1365334, 0.4982388, 0, 1, 0.7254902, 1,
-0.1129486, 0.3158106, -0.2646578, 0, 1, 0.7294118, 1,
-0.1077598, -0.5381572, -2.2901, 0, 1, 0.7372549, 1,
-0.107371, 0.5167076, 1.3341, 0, 1, 0.7411765, 1,
-0.1027038, -0.9319566, -2.213508, 0, 1, 0.7490196, 1,
-0.09693263, -0.7507618, -2.361285, 0, 1, 0.7529412, 1,
-0.0936157, -0.9189433, -2.000403, 0, 1, 0.7607843, 1,
-0.09265824, -0.4505003, -4.868086, 0, 1, 0.7647059, 1,
-0.08960509, 0.4279186, -0.1652122, 0, 1, 0.772549, 1,
-0.08729334, 1.289754, -0.8479671, 0, 1, 0.7764706, 1,
-0.08431146, 0.03405062, -2.388007, 0, 1, 0.7843137, 1,
-0.08207206, 0.5688581, -1.848193, 0, 1, 0.7882353, 1,
-0.07924484, -0.4498189, -4.814126, 0, 1, 0.7960784, 1,
-0.07503361, -0.3108266, -5.182377, 0, 1, 0.8039216, 1,
-0.07133351, -1.074947, -3.747056, 0, 1, 0.8078431, 1,
-0.06734971, -0.4612921, -3.168506, 0, 1, 0.8156863, 1,
-0.06685214, 0.09491874, -1.261364, 0, 1, 0.8196079, 1,
-0.06479599, 0.7835358, -1.15637, 0, 1, 0.827451, 1,
-0.06366795, -0.4576901, -2.111549, 0, 1, 0.8313726, 1,
-0.06351095, -0.2889155, -2.74706, 0, 1, 0.8392157, 1,
-0.06337129, 0.0916746, 0.7006865, 0, 1, 0.8431373, 1,
-0.06320772, -0.7446811, -2.353548, 0, 1, 0.8509804, 1,
-0.05908088, 2.356874, -0.707288, 0, 1, 0.854902, 1,
-0.05645103, 0.639899, 1.037353, 0, 1, 0.8627451, 1,
-0.05579117, -1.137255, -1.855255, 0, 1, 0.8666667, 1,
-0.05527115, 0.8503219, 0.2645695, 0, 1, 0.8745098, 1,
-0.05347132, -1.240978, -3.510958, 0, 1, 0.8784314, 1,
-0.05258131, 0.5789148, -0.2989269, 0, 1, 0.8862745, 1,
-0.04806886, -1.962743, -4.652346, 0, 1, 0.8901961, 1,
-0.04741634, -1.490465, -3.806351, 0, 1, 0.8980392, 1,
-0.04517387, -0.452413, -2.399, 0, 1, 0.9058824, 1,
-0.04382976, -0.1640199, -3.915653, 0, 1, 0.9098039, 1,
-0.04295076, -0.5161636, -2.157459, 0, 1, 0.9176471, 1,
-0.04251458, -0.3290895, -3.066961, 0, 1, 0.9215686, 1,
-0.03755856, -0.1148766, -1.358485, 0, 1, 0.9294118, 1,
-0.03096292, 1.207906, 0.2709754, 0, 1, 0.9333333, 1,
-0.02977265, -1.04791, -3.462853, 0, 1, 0.9411765, 1,
-0.02871387, -1.644595, -2.568241, 0, 1, 0.945098, 1,
-0.02307279, 0.5356295, 0.2559392, 0, 1, 0.9529412, 1,
-0.0221595, 0.04239413, -0.6859061, 0, 1, 0.9568627, 1,
-0.02066965, 1.222672, -0.2154437, 0, 1, 0.9647059, 1,
-0.0193485, 1.186391, -0.4378895, 0, 1, 0.9686275, 1,
-0.01688933, 0.6333277, 0.2016813, 0, 1, 0.9764706, 1,
-0.01605768, 0.116698, 0.1668216, 0, 1, 0.9803922, 1,
-0.01590871, -0.8826773, -3.47754, 0, 1, 0.9882353, 1,
-0.01510054, 0.8574378, -0.6558176, 0, 1, 0.9921569, 1,
-0.008988002, 0.9200687, 0.2239187, 0, 1, 1, 1,
-0.0072854, 1.694376, 0.07638367, 0, 0.9921569, 1, 1,
-0.006914221, -0.7367855, -3.16077, 0, 0.9882353, 1, 1,
-0.004714204, 0.6312222, 0.1157411, 0, 0.9803922, 1, 1,
-0.002624268, 0.4542989, -0.4258062, 0, 0.9764706, 1, 1,
-0.002494897, -1.122614, -4.654008, 0, 0.9686275, 1, 1,
-0.0006725141, 0.2444314, 0.5721967, 0, 0.9647059, 1, 1,
0.002886303, 0.657585, -0.8712047, 0, 0.9568627, 1, 1,
0.004912682, -0.9107225, 4.11168, 0, 0.9529412, 1, 1,
0.006656705, -0.2422521, 3.942881, 0, 0.945098, 1, 1,
0.007089721, 0.4737199, -0.5528811, 0, 0.9411765, 1, 1,
0.01451446, -0.6435465, 3.832505, 0, 0.9333333, 1, 1,
0.02069388, 0.7480684, 1.30449, 0, 0.9294118, 1, 1,
0.02191315, 0.2684545, 0.4217682, 0, 0.9215686, 1, 1,
0.02207542, 0.1749753, -0.9054296, 0, 0.9176471, 1, 1,
0.02613859, 0.3340766, 0.3541532, 0, 0.9098039, 1, 1,
0.0282218, 0.2782797, -0.4895364, 0, 0.9058824, 1, 1,
0.03020848, -0.4634201, 4.206001, 0, 0.8980392, 1, 1,
0.0394408, -0.07250488, 2.73871, 0, 0.8901961, 1, 1,
0.04610178, -0.2207123, 4.170831, 0, 0.8862745, 1, 1,
0.04833459, -0.6863609, 2.840546, 0, 0.8784314, 1, 1,
0.04927238, -0.4623644, 4.000451, 0, 0.8745098, 1, 1,
0.05861536, 0.8648505, -0.2659014, 0, 0.8666667, 1, 1,
0.0588803, -1.649797, 3.90152, 0, 0.8627451, 1, 1,
0.06138296, -0.6981554, 1.709849, 0, 0.854902, 1, 1,
0.06586009, 0.5838823, -0.9891243, 0, 0.8509804, 1, 1,
0.06624387, -0.8809796, 1.741911, 0, 0.8431373, 1, 1,
0.06847692, 1.368638, -0.4322033, 0, 0.8392157, 1, 1,
0.07220565, -0.6060352, 3.106174, 0, 0.8313726, 1, 1,
0.0749834, 0.1910287, -0.1136294, 0, 0.827451, 1, 1,
0.07899087, 0.1279808, 0.05219779, 0, 0.8196079, 1, 1,
0.08175652, 1.461848, 1.193811, 0, 0.8156863, 1, 1,
0.08248672, -1.057436, 2.045903, 0, 0.8078431, 1, 1,
0.08899476, -0.08460016, 3.446268, 0, 0.8039216, 1, 1,
0.08899657, -0.6924702, 4.465515, 0, 0.7960784, 1, 1,
0.09228443, -0.6659219, 2.290304, 0, 0.7882353, 1, 1,
0.09656721, 1.976744, 1.877544, 0, 0.7843137, 1, 1,
0.09689529, 0.9150276, 0.2338832, 0, 0.7764706, 1, 1,
0.1029726, -0.9284059, 3.270967, 0, 0.772549, 1, 1,
0.1050506, 0.04901408, 0.5474627, 0, 0.7647059, 1, 1,
0.105094, -0.8112712, 3.124774, 0, 0.7607843, 1, 1,
0.1107921, 0.05037067, 1.791517, 0, 0.7529412, 1, 1,
0.1146123, -0.704388, 0.8978887, 0, 0.7490196, 1, 1,
0.1175582, 2.687509, -0.235368, 0, 0.7411765, 1, 1,
0.118484, 0.1315003, 0.8472881, 0, 0.7372549, 1, 1,
0.1211237, 1.890068, -0.7445954, 0, 0.7294118, 1, 1,
0.1221458, 1.141872, 1.108128, 0, 0.7254902, 1, 1,
0.122823, 0.6312588, 0.9652846, 0, 0.7176471, 1, 1,
0.1267185, 0.6489858, -2.259513, 0, 0.7137255, 1, 1,
0.1269033, 0.1062013, 0.3521873, 0, 0.7058824, 1, 1,
0.1287731, -0.7185552, 2.604935, 0, 0.6980392, 1, 1,
0.1317637, -0.2211505, 1.710723, 0, 0.6941177, 1, 1,
0.1343219, -0.29361, 0.8063495, 0, 0.6862745, 1, 1,
0.134787, 0.6947439, -0.4249828, 0, 0.682353, 1, 1,
0.1352917, -0.7947682, 1.713478, 0, 0.6745098, 1, 1,
0.1387324, -0.1223438, 1.169702, 0, 0.6705883, 1, 1,
0.1406921, -0.6132887, 2.965424, 0, 0.6627451, 1, 1,
0.1447116, 1.083875, -0.02998983, 0, 0.6588235, 1, 1,
0.1465895, -0.5120515, 3.789783, 0, 0.6509804, 1, 1,
0.1479973, -0.2656519, 3.19228, 0, 0.6470588, 1, 1,
0.1483754, -0.2912706, 2.663982, 0, 0.6392157, 1, 1,
0.1488184, -0.9707237, 2.97161, 0, 0.6352941, 1, 1,
0.1506331, 0.6001596, -0.7934212, 0, 0.627451, 1, 1,
0.1509481, -0.2103993, 3.340074, 0, 0.6235294, 1, 1,
0.1524221, 0.1436624, 1.081628, 0, 0.6156863, 1, 1,
0.1525901, 0.5882134, 1.099114, 0, 0.6117647, 1, 1,
0.1530725, 0.5267531, 1.183786, 0, 0.6039216, 1, 1,
0.1588673, -0.5081832, 1.744458, 0, 0.5960785, 1, 1,
0.1615796, 0.7565631, 0.8344006, 0, 0.5921569, 1, 1,
0.1623141, -0.9446034, 0.9637345, 0, 0.5843138, 1, 1,
0.1626311, -0.480649, 1.639058, 0, 0.5803922, 1, 1,
0.164182, -0.2378276, 2.934789, 0, 0.572549, 1, 1,
0.1642685, -0.3013181, 2.664021, 0, 0.5686275, 1, 1,
0.1679177, -0.5911903, 1.139357, 0, 0.5607843, 1, 1,
0.1800699, -0.9975761, 3.973602, 0, 0.5568628, 1, 1,
0.1835758, 0.569942, 0.6431213, 0, 0.5490196, 1, 1,
0.1836679, 1.717226, 0.1211602, 0, 0.5450981, 1, 1,
0.184976, 0.8535106, 1.156917, 0, 0.5372549, 1, 1,
0.1871275, 0.4124319, 1.298831, 0, 0.5333334, 1, 1,
0.1878266, 1.116895, -3.221047, 0, 0.5254902, 1, 1,
0.1884398, -0.5636483, 3.069272, 0, 0.5215687, 1, 1,
0.1894957, 0.9954776, 0.8288779, 0, 0.5137255, 1, 1,
0.1934461, -0.4364522, 3.039815, 0, 0.509804, 1, 1,
0.1944932, -1.560478, 3.195678, 0, 0.5019608, 1, 1,
0.2018227, 0.9451228, -1.05528, 0, 0.4941176, 1, 1,
0.2022958, 1.314795, 0.500177, 0, 0.4901961, 1, 1,
0.202641, -0.9462783, 1.814086, 0, 0.4823529, 1, 1,
0.203995, -0.5336655, 3.323469, 0, 0.4784314, 1, 1,
0.2046585, 0.02916123, 2.691548, 0, 0.4705882, 1, 1,
0.2056319, -0.2823356, 2.494931, 0, 0.4666667, 1, 1,
0.2088643, -2.311131, 2.654394, 0, 0.4588235, 1, 1,
0.2088771, 0.0668622, 1.215688, 0, 0.454902, 1, 1,
0.2129817, -0.5777248, 2.163279, 0, 0.4470588, 1, 1,
0.2134394, -1.143215, 2.945571, 0, 0.4431373, 1, 1,
0.2186912, -0.550142, 2.896474, 0, 0.4352941, 1, 1,
0.2233743, 0.2908801, 0.8702233, 0, 0.4313726, 1, 1,
0.2263363, -0.8648773, 2.25652, 0, 0.4235294, 1, 1,
0.2312967, 0.7002884, 0.6724081, 0, 0.4196078, 1, 1,
0.2350136, 1.955623, 0.525082, 0, 0.4117647, 1, 1,
0.2352248, 1.933095, -0.03983678, 0, 0.4078431, 1, 1,
0.237623, -0.8975554, 2.202555, 0, 0.4, 1, 1,
0.238943, 0.7613359, -2.020172, 0, 0.3921569, 1, 1,
0.239031, -1.483072, 2.678355, 0, 0.3882353, 1, 1,
0.2406108, 1.538982, -0.4556371, 0, 0.3803922, 1, 1,
0.2408541, 0.5906385, -1.842718, 0, 0.3764706, 1, 1,
0.2417246, -0.461916, 3.098034, 0, 0.3686275, 1, 1,
0.2422702, 0.6972159, -0.07175025, 0, 0.3647059, 1, 1,
0.2428817, 0.35028, 1.3656, 0, 0.3568628, 1, 1,
0.2455816, 0.2479711, 1.156775, 0, 0.3529412, 1, 1,
0.2470699, -0.3632241, 1.545288, 0, 0.345098, 1, 1,
0.2499861, -0.314076, 2.009706, 0, 0.3411765, 1, 1,
0.2572164, -2.496092, 3.251176, 0, 0.3333333, 1, 1,
0.2581185, -0.963953, 3.018143, 0, 0.3294118, 1, 1,
0.2623713, 0.5766318, 1.307909, 0, 0.3215686, 1, 1,
0.2664746, 1.316521, -0.07675671, 0, 0.3176471, 1, 1,
0.2687793, -1.674929, 2.079769, 0, 0.3098039, 1, 1,
0.2703317, 0.4376866, 1.991001, 0, 0.3058824, 1, 1,
0.2725528, 0.5813254, 0.3241646, 0, 0.2980392, 1, 1,
0.2729886, 0.1271409, 0.4831854, 0, 0.2901961, 1, 1,
0.2732816, 0.452767, 0.07472959, 0, 0.2862745, 1, 1,
0.274223, 0.6111427, 0.864669, 0, 0.2784314, 1, 1,
0.2754936, -0.3931763, 2.787234, 0, 0.2745098, 1, 1,
0.2760901, 0.09968115, 0.1342356, 0, 0.2666667, 1, 1,
0.2764698, -2.389756, 3.968849, 0, 0.2627451, 1, 1,
0.28526, -0.4465868, 4.778195, 0, 0.254902, 1, 1,
0.2866774, -0.08073875, 1.59022, 0, 0.2509804, 1, 1,
0.2877518, 0.1271936, 0.955297, 0, 0.2431373, 1, 1,
0.2917263, 1.616008, 1.031227, 0, 0.2392157, 1, 1,
0.2938907, 1.057171, 1.086964, 0, 0.2313726, 1, 1,
0.2971815, 0.2383564, 1.057934, 0, 0.227451, 1, 1,
0.2979918, 0.2340762, -0.2006177, 0, 0.2196078, 1, 1,
0.2994253, -0.01795887, 1.326761, 0, 0.2156863, 1, 1,
0.299509, -0.6478933, 2.441862, 0, 0.2078431, 1, 1,
0.3000162, 1.390156, 0.839298, 0, 0.2039216, 1, 1,
0.3025543, 0.8367548, 1.712364, 0, 0.1960784, 1, 1,
0.3048308, 0.005671273, 1.849193, 0, 0.1882353, 1, 1,
0.3121432, -0.5679012, 1.857595, 0, 0.1843137, 1, 1,
0.312269, -0.1620231, 0.4337679, 0, 0.1764706, 1, 1,
0.3125021, -1.562499, 1.825378, 0, 0.172549, 1, 1,
0.31388, 0.5556258, 0.7504901, 0, 0.1647059, 1, 1,
0.3174874, -1.751091, 2.176777, 0, 0.1607843, 1, 1,
0.3191439, -0.03473892, 0.8819665, 0, 0.1529412, 1, 1,
0.3210044, 0.7056734, 0.2719927, 0, 0.1490196, 1, 1,
0.3286859, -1.002498, 2.774866, 0, 0.1411765, 1, 1,
0.330624, -1.647342, 2.668909, 0, 0.1372549, 1, 1,
0.3394471, -0.3514601, 1.338067, 0, 0.1294118, 1, 1,
0.3396367, -0.5096506, 1.927316, 0, 0.1254902, 1, 1,
0.3400956, 0.6410148, 0.1710607, 0, 0.1176471, 1, 1,
0.3402406, 1.114679, -0.5761207, 0, 0.1137255, 1, 1,
0.3422061, 1.176274, 1.664164, 0, 0.1058824, 1, 1,
0.3432396, 0.3396893, -0.4966309, 0, 0.09803922, 1, 1,
0.3455746, -0.5502948, 2.394703, 0, 0.09411765, 1, 1,
0.3459313, -2.200142, 4.383867, 0, 0.08627451, 1, 1,
0.346588, -0.9572443, 1.729363, 0, 0.08235294, 1, 1,
0.349272, 0.9215651, -0.8820134, 0, 0.07450981, 1, 1,
0.354228, 0.8955999, 0.2261333, 0, 0.07058824, 1, 1,
0.3576455, -0.7672474, 2.213493, 0, 0.0627451, 1, 1,
0.3652427, 0.1613234, -2.17241, 0, 0.05882353, 1, 1,
0.3657992, 1.380825, -0.1822635, 0, 0.05098039, 1, 1,
0.368768, 0.05834598, 0.8549234, 0, 0.04705882, 1, 1,
0.3751436, -0.3875527, 2.387573, 0, 0.03921569, 1, 1,
0.380415, -0.01162299, 3.110058, 0, 0.03529412, 1, 1,
0.3825093, -0.8392673, 3.72328, 0, 0.02745098, 1, 1,
0.3833566, 1.084529, 1.169216, 0, 0.02352941, 1, 1,
0.3876497, 0.5392429, 0.957402, 0, 0.01568628, 1, 1,
0.3927214, -0.348244, 3.143924, 0, 0.01176471, 1, 1,
0.3993009, -0.7194121, 4.256982, 0, 0.003921569, 1, 1,
0.4049038, -0.2056618, 1.053781, 0.003921569, 0, 1, 1,
0.4070337, 0.9770785, -1.133215, 0.007843138, 0, 1, 1,
0.408279, -0.3002226, 2.416241, 0.01568628, 0, 1, 1,
0.4091417, 0.2738163, 0.1484637, 0.01960784, 0, 1, 1,
0.4146163, -2.032944, 3.126391, 0.02745098, 0, 1, 1,
0.426291, 0.7100134, 1.389263, 0.03137255, 0, 1, 1,
0.4279833, 2.810011, 0.2619295, 0.03921569, 0, 1, 1,
0.4284095, 0.08318312, 0.5812031, 0.04313726, 0, 1, 1,
0.4310507, -0.7499002, 4.251163, 0.05098039, 0, 1, 1,
0.4329771, 1.156613, 1.569083, 0.05490196, 0, 1, 1,
0.4379214, -0.377362, 2.516787, 0.0627451, 0, 1, 1,
0.4396244, 1.351945, -1.556513, 0.06666667, 0, 1, 1,
0.4405177, 1.450895, 1.217898, 0.07450981, 0, 1, 1,
0.453613, -0.9293783, 1.365004, 0.07843138, 0, 1, 1,
0.4565899, 1.318315, -0.2479707, 0.08627451, 0, 1, 1,
0.458311, 1.160424, 0.3573163, 0.09019608, 0, 1, 1,
0.4598727, -0.2452656, 2.457575, 0.09803922, 0, 1, 1,
0.4685198, 0.1589266, 0.3716057, 0.1058824, 0, 1, 1,
0.4701649, -0.4791859, 1.955806, 0.1098039, 0, 1, 1,
0.4735165, -0.9713202, 3.863638, 0.1176471, 0, 1, 1,
0.4741679, -0.9804586, 3.284457, 0.1215686, 0, 1, 1,
0.4790251, 2.375009, 1.210784, 0.1294118, 0, 1, 1,
0.4798726, 0.2911093, 0.1371493, 0.1333333, 0, 1, 1,
0.4873151, -1.2321, 2.499055, 0.1411765, 0, 1, 1,
0.4876907, -0.1361102, 1.837139, 0.145098, 0, 1, 1,
0.4891424, -0.939859, 2.347401, 0.1529412, 0, 1, 1,
0.4891773, 0.5942847, 0.6467342, 0.1568628, 0, 1, 1,
0.4898083, 1.360194, -1.488693, 0.1647059, 0, 1, 1,
0.4922268, -0.6814021, 1.887051, 0.1686275, 0, 1, 1,
0.4924035, 0.7277278, 1.889868, 0.1764706, 0, 1, 1,
0.4946159, 0.4268635, 0.9023969, 0.1803922, 0, 1, 1,
0.4956639, 2.564509, -0.1769781, 0.1882353, 0, 1, 1,
0.4960309, 1.063367, -0.07373669, 0.1921569, 0, 1, 1,
0.500911, 1.384694, 0.943023, 0.2, 0, 1, 1,
0.5021973, 0.2054947, 2.828802, 0.2078431, 0, 1, 1,
0.5065659, 0.1240298, 0.856029, 0.2117647, 0, 1, 1,
0.5067793, 2.257764, 1.00748, 0.2196078, 0, 1, 1,
0.5080401, 2.390827, -0.7946093, 0.2235294, 0, 1, 1,
0.5122804, -1.075653, 3.884123, 0.2313726, 0, 1, 1,
0.512584, 2.24411, -0.01374471, 0.2352941, 0, 1, 1,
0.5135033, -0.6316569, 1.724476, 0.2431373, 0, 1, 1,
0.5163283, -1.198979, 4.675973, 0.2470588, 0, 1, 1,
0.520489, -1.048873, 2.55673, 0.254902, 0, 1, 1,
0.5208131, -0.7034245, 3.146243, 0.2588235, 0, 1, 1,
0.5230215, 0.714141, 0.6243222, 0.2666667, 0, 1, 1,
0.5240964, -1.449677, 3.041668, 0.2705882, 0, 1, 1,
0.5274041, 0.1251459, 1.911641, 0.2784314, 0, 1, 1,
0.5329608, -0.2461133, 1.744224, 0.282353, 0, 1, 1,
0.5346859, 1.369991, 0.9285041, 0.2901961, 0, 1, 1,
0.5386696, 0.1046447, 1.248975, 0.2941177, 0, 1, 1,
0.5390685, 0.6553057, -1.021574, 0.3019608, 0, 1, 1,
0.5391014, 0.3525302, 1.062088, 0.3098039, 0, 1, 1,
0.5406213, 0.4760576, 0.5988026, 0.3137255, 0, 1, 1,
0.5446104, 0.3345564, 0.7878568, 0.3215686, 0, 1, 1,
0.5479946, -1.059513, 3.012011, 0.3254902, 0, 1, 1,
0.5496508, 0.9624242, 1.826652, 0.3333333, 0, 1, 1,
0.5569094, -1.303659, 1.991973, 0.3372549, 0, 1, 1,
0.5613926, 0.2605208, 0.138242, 0.345098, 0, 1, 1,
0.5638831, -0.3036501, 2.165276, 0.3490196, 0, 1, 1,
0.5669981, 2.069212, 1.928993, 0.3568628, 0, 1, 1,
0.5714272, 0.4336307, 1.873966, 0.3607843, 0, 1, 1,
0.5739486, -0.4829767, 0.657434, 0.3686275, 0, 1, 1,
0.574519, 2.133453, 1.483532, 0.372549, 0, 1, 1,
0.5749941, 0.168353, 1.035444, 0.3803922, 0, 1, 1,
0.5756614, 0.4816239, 0.1317548, 0.3843137, 0, 1, 1,
0.5759587, -0.9149428, 3.155003, 0.3921569, 0, 1, 1,
0.5787264, -0.6804822, 3.216487, 0.3960784, 0, 1, 1,
0.5815341, -2.050503, 2.471488, 0.4039216, 0, 1, 1,
0.5853348, -0.3880999, 2.808763, 0.4117647, 0, 1, 1,
0.5862588, -1.56377, 2.677849, 0.4156863, 0, 1, 1,
0.5873111, 0.6201039, 0.7432636, 0.4235294, 0, 1, 1,
0.5926192, -0.6780885, 3.228325, 0.427451, 0, 1, 1,
0.59316, -1.603671, 2.635345, 0.4352941, 0, 1, 1,
0.5962269, 0.6628543, 0.4400015, 0.4392157, 0, 1, 1,
0.5962644, -0.4285153, 2.366004, 0.4470588, 0, 1, 1,
0.6006603, 0.7585918, -0.2524564, 0.4509804, 0, 1, 1,
0.6037664, -1.067451, 2.050096, 0.4588235, 0, 1, 1,
0.6038728, -1.232991, 2.301584, 0.4627451, 0, 1, 1,
0.6103515, -0.1711848, 2.609058, 0.4705882, 0, 1, 1,
0.6133846, 0.6518968, 1.235407, 0.4745098, 0, 1, 1,
0.6175763, -0.2241702, 1.659666, 0.4823529, 0, 1, 1,
0.6196467, -0.6408415, 2.979256, 0.4862745, 0, 1, 1,
0.6206142, 0.07211244, 1.646777, 0.4941176, 0, 1, 1,
0.6213712, -2.327398, 1.758669, 0.5019608, 0, 1, 1,
0.6216151, 1.950694, 0.2817399, 0.5058824, 0, 1, 1,
0.6228155, 0.7191359, 0.1261519, 0.5137255, 0, 1, 1,
0.6245957, 0.6757159, 0.001696019, 0.5176471, 0, 1, 1,
0.6261644, -0.3110626, 3.72066, 0.5254902, 0, 1, 1,
0.6270931, -0.6516075, 2.742299, 0.5294118, 0, 1, 1,
0.6292682, -0.02326123, 2.586185, 0.5372549, 0, 1, 1,
0.6379386, -1.237743, 1.905734, 0.5411765, 0, 1, 1,
0.6413785, -1.304841, 3.944614, 0.5490196, 0, 1, 1,
0.653517, 0.4860949, 1.760268, 0.5529412, 0, 1, 1,
0.6570842, -1.403557, 3.758616, 0.5607843, 0, 1, 1,
0.6631604, -1.912626, 3.488711, 0.5647059, 0, 1, 1,
0.6655753, 1.388125, -0.8283269, 0.572549, 0, 1, 1,
0.6713217, -1.835782, 4.123663, 0.5764706, 0, 1, 1,
0.6718642, -0.07081493, 2.184273, 0.5843138, 0, 1, 1,
0.6769869, 0.1067203, 1.740689, 0.5882353, 0, 1, 1,
0.6815017, 0.2551288, 0.7494849, 0.5960785, 0, 1, 1,
0.6832689, -0.9244193, 3.680304, 0.6039216, 0, 1, 1,
0.6866527, -0.1014694, 0.8637162, 0.6078432, 0, 1, 1,
0.6958297, 0.7530252, 0.1652705, 0.6156863, 0, 1, 1,
0.7019555, 1.365368, -1.696133, 0.6196079, 0, 1, 1,
0.7042866, -2.213354, 1.665524, 0.627451, 0, 1, 1,
0.7090706, -0.5095514, 2.114662, 0.6313726, 0, 1, 1,
0.717024, 1.169007, -0.9717029, 0.6392157, 0, 1, 1,
0.7267241, -1.064605, 1.341117, 0.6431373, 0, 1, 1,
0.7268067, -0.2112985, 2.670731, 0.6509804, 0, 1, 1,
0.7280899, -0.4020501, 1.972774, 0.654902, 0, 1, 1,
0.7328953, 0.03204739, 0.7613023, 0.6627451, 0, 1, 1,
0.7405699, -0.06268506, 0.9291974, 0.6666667, 0, 1, 1,
0.7451616, 0.1954672, 2.531816, 0.6745098, 0, 1, 1,
0.7548813, -0.1754697, 1.35149, 0.6784314, 0, 1, 1,
0.7549697, -0.5730798, 3.538012, 0.6862745, 0, 1, 1,
0.7596343, 0.0566796, 1.648123, 0.6901961, 0, 1, 1,
0.7671015, 0.396125, 2.48503, 0.6980392, 0, 1, 1,
0.7680951, 1.248879, 0.09209931, 0.7058824, 0, 1, 1,
0.7686782, -1.055095, 2.278658, 0.7098039, 0, 1, 1,
0.7801282, 0.5720367, 1.946543, 0.7176471, 0, 1, 1,
0.7844567, 0.02576281, 2.52358, 0.7215686, 0, 1, 1,
0.7860909, -0.1950752, 1.566586, 0.7294118, 0, 1, 1,
0.7980035, -0.9102654, 0.8218209, 0.7333333, 0, 1, 1,
0.8000785, 0.12684, 1.318407, 0.7411765, 0, 1, 1,
0.8003513, 0.8304814, 0.417082, 0.7450981, 0, 1, 1,
0.8178017, -0.2952375, 3.168503, 0.7529412, 0, 1, 1,
0.8214126, -0.0967834, 0.892748, 0.7568628, 0, 1, 1,
0.8229253, -0.1528187, 3.482422, 0.7647059, 0, 1, 1,
0.8241708, -0.3665487, 2.576417, 0.7686275, 0, 1, 1,
0.844474, -0.08418154, 1.766527, 0.7764706, 0, 1, 1,
0.8478367, -3.101766, 2.975774, 0.7803922, 0, 1, 1,
0.8525499, -0.08889429, 2.023153, 0.7882353, 0, 1, 1,
0.8536986, 0.4876738, 1.838183, 0.7921569, 0, 1, 1,
0.8551106, -0.2537647, 1.46448, 0.8, 0, 1, 1,
0.8667139, 0.7613357, 0.6563396, 0.8078431, 0, 1, 1,
0.8674309, 0.007801024, 1.577901, 0.8117647, 0, 1, 1,
0.8684096, -1.361887, 3.0454, 0.8196079, 0, 1, 1,
0.8693626, 0.5850497, -0.04631599, 0.8235294, 0, 1, 1,
0.8730696, -0.3874796, 1.403438, 0.8313726, 0, 1, 1,
0.8749654, 0.5099254, 0.8987601, 0.8352941, 0, 1, 1,
0.8765805, 0.8839123, 0.6203768, 0.8431373, 0, 1, 1,
0.8773564, 0.7597816, 0.746072, 0.8470588, 0, 1, 1,
0.8782049, -0.9606231, 3.319363, 0.854902, 0, 1, 1,
0.8802414, -0.2597193, 2.532721, 0.8588235, 0, 1, 1,
0.8821892, 1.418857, -0.9106652, 0.8666667, 0, 1, 1,
0.8845486, 1.683033, 1.443419, 0.8705882, 0, 1, 1,
0.8869109, -0.08705177, 1.181963, 0.8784314, 0, 1, 1,
0.8870652, 0.07391006, 1.330257, 0.8823529, 0, 1, 1,
0.8947025, -1.156723, 5.665237, 0.8901961, 0, 1, 1,
0.8996364, -0.2802602, 2.919618, 0.8941177, 0, 1, 1,
0.9014559, 0.7708506, 0.7035522, 0.9019608, 0, 1, 1,
0.9042845, 1.428571, 0.1824366, 0.9098039, 0, 1, 1,
0.9074804, 0.2067351, 1.343714, 0.9137255, 0, 1, 1,
0.9094952, 0.8013569, 1.575078, 0.9215686, 0, 1, 1,
0.9141203, 0.3358569, -0.2512954, 0.9254902, 0, 1, 1,
0.916747, 0.9655238, 1.551356, 0.9333333, 0, 1, 1,
0.9177219, 1.282411, -0.8575918, 0.9372549, 0, 1, 1,
0.9180781, 0.3413171, 2.108083, 0.945098, 0, 1, 1,
0.9228093, -0.6733274, 1.209618, 0.9490196, 0, 1, 1,
0.9307814, 1.78313, 0.3591619, 0.9568627, 0, 1, 1,
0.9334412, -0.9700861, 3.161517, 0.9607843, 0, 1, 1,
0.9364936, -0.4216841, 0.8620176, 0.9686275, 0, 1, 1,
0.9377265, 1.058089, 1.934135, 0.972549, 0, 1, 1,
0.9408695, -0.05218018, 2.474322, 0.9803922, 0, 1, 1,
0.9444083, 1.797474, 2.017017, 0.9843137, 0, 1, 1,
0.9507238, 0.764697, 0.6774821, 0.9921569, 0, 1, 1,
0.9565479, 1.690187, 1.267023, 0.9960784, 0, 1, 1,
0.9585237, 0.6887731, -0.1065526, 1, 0, 0.9960784, 1,
0.9602442, -1.482043, 1.659468, 1, 0, 0.9882353, 1,
0.9678706, -0.1644097, 0.6093606, 1, 0, 0.9843137, 1,
0.9748964, 0.2090251, -0.2874773, 1, 0, 0.9764706, 1,
0.987912, -0.2642785, 1.818185, 1, 0, 0.972549, 1,
0.9923764, 0.2274317, 1.809696, 1, 0, 0.9647059, 1,
0.9990601, 0.8846718, -0.02441114, 1, 0, 0.9607843, 1,
1.001718, 0.3952701, -1.151197, 1, 0, 0.9529412, 1,
1.00326, 1.987185, 2.754464, 1, 0, 0.9490196, 1,
1.003859, 0.9216823, 1.033831, 1, 0, 0.9411765, 1,
1.005401, 0.7993019, 1.771916, 1, 0, 0.9372549, 1,
1.006406, -0.4784971, 2.879756, 1, 0, 0.9294118, 1,
1.01671, 0.3954628, 2.1135, 1, 0, 0.9254902, 1,
1.019519, -0.9172163, 2.024606, 1, 0, 0.9176471, 1,
1.030721, -0.7711843, 2.213439, 1, 0, 0.9137255, 1,
1.031087, 1.568351, 0.1006797, 1, 0, 0.9058824, 1,
1.031722, 1.333019, 1.451961, 1, 0, 0.9019608, 1,
1.039226, 0.8100338, 1.486443, 1, 0, 0.8941177, 1,
1.044177, -1.098056, 3.528696, 1, 0, 0.8862745, 1,
1.048764, -0.2636229, -0.5929155, 1, 0, 0.8823529, 1,
1.050581, -1.773359, 3.520429, 1, 0, 0.8745098, 1,
1.062992, 0.1633713, 2.060709, 1, 0, 0.8705882, 1,
1.066219, 1.100296, 2.033824, 1, 0, 0.8627451, 1,
1.075045, -1.978455, 3.515781, 1, 0, 0.8588235, 1,
1.083501, -0.473395, 2.586735, 1, 0, 0.8509804, 1,
1.085518, 0.5138643, 2.212103, 1, 0, 0.8470588, 1,
1.086093, 0.7548804, 0.9224571, 1, 0, 0.8392157, 1,
1.090469, 0.1561503, 2.014243, 1, 0, 0.8352941, 1,
1.111326, 1.022296, 0.6831068, 1, 0, 0.827451, 1,
1.130765, 0.2448538, 2.026194, 1, 0, 0.8235294, 1,
1.131538, 0.4125163, 1.726252, 1, 0, 0.8156863, 1,
1.133908, -0.1741156, 0.4032684, 1, 0, 0.8117647, 1,
1.136119, -2.185171, 3.25347, 1, 0, 0.8039216, 1,
1.144219, -1.62096, 3.434263, 1, 0, 0.7960784, 1,
1.14579, 0.07042672, 1.380694, 1, 0, 0.7921569, 1,
1.151818, -0.2117791, 2.607955, 1, 0, 0.7843137, 1,
1.15481, -0.06746849, 1.433157, 1, 0, 0.7803922, 1,
1.161118, 0.8118824, 1.815091, 1, 0, 0.772549, 1,
1.167578, 1.299415, 0.7884169, 1, 0, 0.7686275, 1,
1.177972, 0.7385188, 0.8163739, 1, 0, 0.7607843, 1,
1.179507, -0.407457, 1.327901, 1, 0, 0.7568628, 1,
1.190815, -1.489744, 2.225758, 1, 0, 0.7490196, 1,
1.196117, 0.6919955, 2.061467, 1, 0, 0.7450981, 1,
1.205893, -1.152847, 0.6149985, 1, 0, 0.7372549, 1,
1.207523, -1.912972, 3.331452, 1, 0, 0.7333333, 1,
1.209211, -0.9835951, 2.102047, 1, 0, 0.7254902, 1,
1.212218, -0.2367802, 0.3895071, 1, 0, 0.7215686, 1,
1.227275, 0.2081176, 0.5191653, 1, 0, 0.7137255, 1,
1.23974, -0.4030204, 3.566622, 1, 0, 0.7098039, 1,
1.241233, 1.107816, -0.1191131, 1, 0, 0.7019608, 1,
1.247256, 1.407902, 1.616248, 1, 0, 0.6941177, 1,
1.253831, 0.9520739, 1.692966, 1, 0, 0.6901961, 1,
1.254519, 0.1744772, 0.1310164, 1, 0, 0.682353, 1,
1.258574, -0.07693411, 1.174007, 1, 0, 0.6784314, 1,
1.268422, -1.152153, 2.622282, 1, 0, 0.6705883, 1,
1.272024, 0.2750088, 1.560787, 1, 0, 0.6666667, 1,
1.275237, 0.6250463, -0.1056462, 1, 0, 0.6588235, 1,
1.281722, 1.524997, -0.2651735, 1, 0, 0.654902, 1,
1.284681, -1.575888, 1.537388, 1, 0, 0.6470588, 1,
1.287584, 1.205384, 1.873523, 1, 0, 0.6431373, 1,
1.293735, -0.437712, 1.749339, 1, 0, 0.6352941, 1,
1.295935, -0.06703413, 1.076208, 1, 0, 0.6313726, 1,
1.29666, 0.8870168, 0.4929119, 1, 0, 0.6235294, 1,
1.298341, -1.415553, 3.360733, 1, 0, 0.6196079, 1,
1.312624, 0.09312765, -0.004035515, 1, 0, 0.6117647, 1,
1.313562, 0.5321563, 1.301596, 1, 0, 0.6078432, 1,
1.323011, -0.9551422, 2.475432, 1, 0, 0.6, 1,
1.335137, -1.532331, 5.113206, 1, 0, 0.5921569, 1,
1.339206, -0.07273328, 2.773572, 1, 0, 0.5882353, 1,
1.33999, 0.343544, -0.06165496, 1, 0, 0.5803922, 1,
1.340985, -2.989598, 0.9762424, 1, 0, 0.5764706, 1,
1.3423, 1.47085, -0.5154206, 1, 0, 0.5686275, 1,
1.348479, 1.688819, 0.8757992, 1, 0, 0.5647059, 1,
1.350817, -0.3941948, 0.9318455, 1, 0, 0.5568628, 1,
1.360722, 0.1818919, 1.249009, 1, 0, 0.5529412, 1,
1.369916, -1.778167, 1.050789, 1, 0, 0.5450981, 1,
1.370499, -1.613595, 1.025972, 1, 0, 0.5411765, 1,
1.376364, 0.4388898, 1.345888, 1, 0, 0.5333334, 1,
1.378678, 2.231923, 0.3395585, 1, 0, 0.5294118, 1,
1.380375, -0.520673, 2.146401, 1, 0, 0.5215687, 1,
1.380757, 1.514025, 0.6151319, 1, 0, 0.5176471, 1,
1.401258, 0.1804636, 2.518766, 1, 0, 0.509804, 1,
1.412875, -1.331999, 3.500495, 1, 0, 0.5058824, 1,
1.429972, 0.7873346, 0.6678296, 1, 0, 0.4980392, 1,
1.432126, -1.032491, 2.844846, 1, 0, 0.4901961, 1,
1.435989, -0.2812462, 1.21079, 1, 0, 0.4862745, 1,
1.437268, 0.2133256, 1.353692, 1, 0, 0.4784314, 1,
1.476215, 1.482332, -1.363533, 1, 0, 0.4745098, 1,
1.484745, 0.6321293, 0.8341591, 1, 0, 0.4666667, 1,
1.488624, -1.326541, 1.234838, 1, 0, 0.4627451, 1,
1.495714, 0.193241, 1.440296, 1, 0, 0.454902, 1,
1.495716, -0.4877327, 1.600492, 1, 0, 0.4509804, 1,
1.499436, -0.2499517, 0.2270037, 1, 0, 0.4431373, 1,
1.512521, -0.8117192, 2.890721, 1, 0, 0.4392157, 1,
1.517201, -1.058496, 1.044719, 1, 0, 0.4313726, 1,
1.529478, 0.3285032, 3.131507, 1, 0, 0.427451, 1,
1.530549, -1.080736, 2.658382, 1, 0, 0.4196078, 1,
1.532288, -0.9106083, 0.4698677, 1, 0, 0.4156863, 1,
1.542258, 0.2646383, 1.936815, 1, 0, 0.4078431, 1,
1.547581, -2.044539, 2.459248, 1, 0, 0.4039216, 1,
1.56045, -2.061176, 2.642455, 1, 0, 0.3960784, 1,
1.56048, 0.68404, 0.9988562, 1, 0, 0.3882353, 1,
1.575832, 0.1599242, -0.4251371, 1, 0, 0.3843137, 1,
1.585567, -0.5747545, 1.723103, 1, 0, 0.3764706, 1,
1.602957, -1.311811, 1.871267, 1, 0, 0.372549, 1,
1.605114, 1.928842, 1.076119, 1, 0, 0.3647059, 1,
1.625042, -0.2321245, 2.008443, 1, 0, 0.3607843, 1,
1.62823, 0.2854057, 0.3918373, 1, 0, 0.3529412, 1,
1.629253, -0.3127998, 3.39186, 1, 0, 0.3490196, 1,
1.638012, -0.2885137, 0.47955, 1, 0, 0.3411765, 1,
1.640645, -0.1546694, 1.916211, 1, 0, 0.3372549, 1,
1.648416, -0.5284745, 2.561152, 1, 0, 0.3294118, 1,
1.651134, 0.1544024, 3.310156, 1, 0, 0.3254902, 1,
1.655395, -0.6243622, 0.9951422, 1, 0, 0.3176471, 1,
1.660246, 1.747289, -0.1123898, 1, 0, 0.3137255, 1,
1.671919, 0.3089635, 1.296333, 1, 0, 0.3058824, 1,
1.685336, 0.139732, 0.6640294, 1, 0, 0.2980392, 1,
1.691464, -0.1703441, 2.687488, 1, 0, 0.2941177, 1,
1.72886, 1.308901, 0.4482798, 1, 0, 0.2862745, 1,
1.744717, -1.107723, 3.274471, 1, 0, 0.282353, 1,
1.747795, -0.7938548, 2.277916, 1, 0, 0.2745098, 1,
1.750119, -0.9618477, 2.689439, 1, 0, 0.2705882, 1,
1.753715, -0.8236372, 4.162529, 1, 0, 0.2627451, 1,
1.755775, -0.5934978, 0.612152, 1, 0, 0.2588235, 1,
1.771974, 0.1993356, 1.559097, 1, 0, 0.2509804, 1,
1.80955, 0.2709973, 2.175072, 1, 0, 0.2470588, 1,
1.818252, 0.160781, 3.278753, 1, 0, 0.2392157, 1,
1.83013, 1.679392, 0.4919911, 1, 0, 0.2352941, 1,
1.83952, -0.5806497, 2.404717, 1, 0, 0.227451, 1,
1.848077, -0.7674237, 3.357194, 1, 0, 0.2235294, 1,
1.849547, -1.186385, 2.015457, 1, 0, 0.2156863, 1,
1.850097, -1.848476, 1.104416, 1, 0, 0.2117647, 1,
1.857666, -0.6965722, 2.642468, 1, 0, 0.2039216, 1,
1.858133, -1.46735, 1.689118, 1, 0, 0.1960784, 1,
1.867098, -0.8200706, 1.431537, 1, 0, 0.1921569, 1,
1.871866, 1.369847, 0.5350304, 1, 0, 0.1843137, 1,
1.896797, 0.5121737, 3.631265, 1, 0, 0.1803922, 1,
1.917127, -1.045786, 2.832924, 1, 0, 0.172549, 1,
1.921003, -1.133535, 1.512033, 1, 0, 0.1686275, 1,
1.935436, 0.1819483, 2.794882, 1, 0, 0.1607843, 1,
1.936127, 0.6492982, 2.365787, 1, 0, 0.1568628, 1,
1.948829, 2.393714, 1.365114, 1, 0, 0.1490196, 1,
1.961104, 1.558718, 0.4329835, 1, 0, 0.145098, 1,
1.975329, -0.6999255, 1.547366, 1, 0, 0.1372549, 1,
1.98187, 0.7820869, -0.02988739, 1, 0, 0.1333333, 1,
1.993498, -0.1113328, 0.4563728, 1, 0, 0.1254902, 1,
2.060051, 0.9561952, 2.554467, 1, 0, 0.1215686, 1,
2.072522, -1.435305, 3.195584, 1, 0, 0.1137255, 1,
2.112129, 0.973312, 0.5789574, 1, 0, 0.1098039, 1,
2.114772, -0.479172, 2.923488, 1, 0, 0.1019608, 1,
2.144244, 0.1264183, 1.477992, 1, 0, 0.09411765, 1,
2.145614, 0.7396732, -1.43899, 1, 0, 0.09019608, 1,
2.15094, -0.4915173, 1.788341, 1, 0, 0.08235294, 1,
2.188851, -1.387884, 2.894101, 1, 0, 0.07843138, 1,
2.191974, 0.6931551, 1.167094, 1, 0, 0.07058824, 1,
2.200125, -1.220414, 2.046598, 1, 0, 0.06666667, 1,
2.208721, -0.2471908, 2.757622, 1, 0, 0.05882353, 1,
2.250492, -0.1133726, 1.043553, 1, 0, 0.05490196, 1,
2.280252, -0.6215564, 1.020084, 1, 0, 0.04705882, 1,
2.290072, -2.099143, 4.181489, 1, 0, 0.04313726, 1,
2.293233, -0.1889477, 1.7652, 1, 0, 0.03529412, 1,
2.345001, 0.3948342, 0.02147255, 1, 0, 0.03137255, 1,
2.402284, 0.6357249, 0.5440587, 1, 0, 0.02352941, 1,
2.611355, -0.7392783, 1.389039, 1, 0, 0.01960784, 1,
2.633901, -0.9766453, 2.979337, 1, 0, 0.01176471, 1,
2.71625, 1.118411, 2.169058, 1, 0, 0.007843138, 1
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
-0.2224815, -4.677845, -7.685683, 0, -0.5, 0.5, 0.5,
-0.2224815, -4.677845, -7.685683, 1, -0.5, 0.5, 0.5,
-0.2224815, -4.677845, -7.685683, 1, 1.5, 0.5, 0.5,
-0.2224815, -4.677845, -7.685683, 0, 1.5, 0.5, 0.5
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
-4.157443, -0.2044747, -7.685683, 0, -0.5, 0.5, 0.5,
-4.157443, -0.2044747, -7.685683, 1, -0.5, 0.5, 0.5,
-4.157443, -0.2044747, -7.685683, 1, 1.5, 0.5, 0.5,
-4.157443, -0.2044747, -7.685683, 0, 1.5, 0.5, 0.5
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
-4.157443, -4.677845, -0.04272389, 0, -0.5, 0.5, 0.5,
-4.157443, -4.677845, -0.04272389, 1, -0.5, 0.5, 0.5,
-4.157443, -4.677845, -0.04272389, 1, 1.5, 0.5, 0.5,
-4.157443, -4.677845, -0.04272389, 0, 1.5, 0.5, 0.5
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
-3, -3.645529, -5.921924,
2, -3.645529, -5.921924,
-3, -3.645529, -5.921924,
-3, -3.817581, -6.215884,
-2, -3.645529, -5.921924,
-2, -3.817581, -6.215884,
-1, -3.645529, -5.921924,
-1, -3.817581, -6.215884,
0, -3.645529, -5.921924,
0, -3.817581, -6.215884,
1, -3.645529, -5.921924,
1, -3.817581, -6.215884,
2, -3.645529, -5.921924,
2, -3.817581, -6.215884
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
-3, -4.161687, -6.803803, 0, -0.5, 0.5, 0.5,
-3, -4.161687, -6.803803, 1, -0.5, 0.5, 0.5,
-3, -4.161687, -6.803803, 1, 1.5, 0.5, 0.5,
-3, -4.161687, -6.803803, 0, 1.5, 0.5, 0.5,
-2, -4.161687, -6.803803, 0, -0.5, 0.5, 0.5,
-2, -4.161687, -6.803803, 1, -0.5, 0.5, 0.5,
-2, -4.161687, -6.803803, 1, 1.5, 0.5, 0.5,
-2, -4.161687, -6.803803, 0, 1.5, 0.5, 0.5,
-1, -4.161687, -6.803803, 0, -0.5, 0.5, 0.5,
-1, -4.161687, -6.803803, 1, -0.5, 0.5, 0.5,
-1, -4.161687, -6.803803, 1, 1.5, 0.5, 0.5,
-1, -4.161687, -6.803803, 0, 1.5, 0.5, 0.5,
0, -4.161687, -6.803803, 0, -0.5, 0.5, 0.5,
0, -4.161687, -6.803803, 1, -0.5, 0.5, 0.5,
0, -4.161687, -6.803803, 1, 1.5, 0.5, 0.5,
0, -4.161687, -6.803803, 0, 1.5, 0.5, 0.5,
1, -4.161687, -6.803803, 0, -0.5, 0.5, 0.5,
1, -4.161687, -6.803803, 1, -0.5, 0.5, 0.5,
1, -4.161687, -6.803803, 1, 1.5, 0.5, 0.5,
1, -4.161687, -6.803803, 0, 1.5, 0.5, 0.5,
2, -4.161687, -6.803803, 0, -0.5, 0.5, 0.5,
2, -4.161687, -6.803803, 1, -0.5, 0.5, 0.5,
2, -4.161687, -6.803803, 1, 1.5, 0.5, 0.5,
2, -4.161687, -6.803803, 0, 1.5, 0.5, 0.5
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
-3.249375, -3, -5.921924,
-3.249375, 3, -5.921924,
-3.249375, -3, -5.921924,
-3.400719, -3, -6.215884,
-3.249375, -2, -5.921924,
-3.400719, -2, -6.215884,
-3.249375, -1, -5.921924,
-3.400719, -1, -6.215884,
-3.249375, 0, -5.921924,
-3.400719, 0, -6.215884,
-3.249375, 1, -5.921924,
-3.400719, 1, -6.215884,
-3.249375, 2, -5.921924,
-3.400719, 2, -6.215884,
-3.249375, 3, -5.921924,
-3.400719, 3, -6.215884
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
-3.703408, -3, -6.803803, 0, -0.5, 0.5, 0.5,
-3.703408, -3, -6.803803, 1, -0.5, 0.5, 0.5,
-3.703408, -3, -6.803803, 1, 1.5, 0.5, 0.5,
-3.703408, -3, -6.803803, 0, 1.5, 0.5, 0.5,
-3.703408, -2, -6.803803, 0, -0.5, 0.5, 0.5,
-3.703408, -2, -6.803803, 1, -0.5, 0.5, 0.5,
-3.703408, -2, -6.803803, 1, 1.5, 0.5, 0.5,
-3.703408, -2, -6.803803, 0, 1.5, 0.5, 0.5,
-3.703408, -1, -6.803803, 0, -0.5, 0.5, 0.5,
-3.703408, -1, -6.803803, 1, -0.5, 0.5, 0.5,
-3.703408, -1, -6.803803, 1, 1.5, 0.5, 0.5,
-3.703408, -1, -6.803803, 0, 1.5, 0.5, 0.5,
-3.703408, 0, -6.803803, 0, -0.5, 0.5, 0.5,
-3.703408, 0, -6.803803, 1, -0.5, 0.5, 0.5,
-3.703408, 0, -6.803803, 1, 1.5, 0.5, 0.5,
-3.703408, 0, -6.803803, 0, 1.5, 0.5, 0.5,
-3.703408, 1, -6.803803, 0, -0.5, 0.5, 0.5,
-3.703408, 1, -6.803803, 1, -0.5, 0.5, 0.5,
-3.703408, 1, -6.803803, 1, 1.5, 0.5, 0.5,
-3.703408, 1, -6.803803, 0, 1.5, 0.5, 0.5,
-3.703408, 2, -6.803803, 0, -0.5, 0.5, 0.5,
-3.703408, 2, -6.803803, 1, -0.5, 0.5, 0.5,
-3.703408, 2, -6.803803, 1, 1.5, 0.5, 0.5,
-3.703408, 2, -6.803803, 0, 1.5, 0.5, 0.5,
-3.703408, 3, -6.803803, 0, -0.5, 0.5, 0.5,
-3.703408, 3, -6.803803, 1, -0.5, 0.5, 0.5,
-3.703408, 3, -6.803803, 1, 1.5, 0.5, 0.5,
-3.703408, 3, -6.803803, 0, 1.5, 0.5, 0.5
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
-3.249375, -3.645529, -4,
-3.249375, -3.645529, 4,
-3.249375, -3.645529, -4,
-3.400719, -3.817581, -4,
-3.249375, -3.645529, -2,
-3.400719, -3.817581, -2,
-3.249375, -3.645529, 0,
-3.400719, -3.817581, 0,
-3.249375, -3.645529, 2,
-3.400719, -3.817581, 2,
-3.249375, -3.645529, 4,
-3.400719, -3.817581, 4
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
-3.703408, -4.161687, -4, 0, -0.5, 0.5, 0.5,
-3.703408, -4.161687, -4, 1, -0.5, 0.5, 0.5,
-3.703408, -4.161687, -4, 1, 1.5, 0.5, 0.5,
-3.703408, -4.161687, -4, 0, 1.5, 0.5, 0.5,
-3.703408, -4.161687, -2, 0, -0.5, 0.5, 0.5,
-3.703408, -4.161687, -2, 1, -0.5, 0.5, 0.5,
-3.703408, -4.161687, -2, 1, 1.5, 0.5, 0.5,
-3.703408, -4.161687, -2, 0, 1.5, 0.5, 0.5,
-3.703408, -4.161687, 0, 0, -0.5, 0.5, 0.5,
-3.703408, -4.161687, 0, 1, -0.5, 0.5, 0.5,
-3.703408, -4.161687, 0, 1, 1.5, 0.5, 0.5,
-3.703408, -4.161687, 0, 0, 1.5, 0.5, 0.5,
-3.703408, -4.161687, 2, 0, -0.5, 0.5, 0.5,
-3.703408, -4.161687, 2, 1, -0.5, 0.5, 0.5,
-3.703408, -4.161687, 2, 1, 1.5, 0.5, 0.5,
-3.703408, -4.161687, 2, 0, 1.5, 0.5, 0.5,
-3.703408, -4.161687, 4, 0, -0.5, 0.5, 0.5,
-3.703408, -4.161687, 4, 1, -0.5, 0.5, 0.5,
-3.703408, -4.161687, 4, 1, 1.5, 0.5, 0.5,
-3.703408, -4.161687, 4, 0, 1.5, 0.5, 0.5
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
-3.249375, -3.645529, -5.921924,
-3.249375, 3.236579, -5.921924,
-3.249375, -3.645529, 5.836476,
-3.249375, 3.236579, 5.836476,
-3.249375, -3.645529, -5.921924,
-3.249375, -3.645529, 5.836476,
-3.249375, 3.236579, -5.921924,
-3.249375, 3.236579, 5.836476,
-3.249375, -3.645529, -5.921924,
2.804412, -3.645529, -5.921924,
-3.249375, -3.645529, 5.836476,
2.804412, -3.645529, 5.836476,
-3.249375, 3.236579, -5.921924,
2.804412, 3.236579, -5.921924,
-3.249375, 3.236579, 5.836476,
2.804412, 3.236579, 5.836476,
2.804412, -3.645529, -5.921924,
2.804412, 3.236579, -5.921924,
2.804412, -3.645529, 5.836476,
2.804412, 3.236579, 5.836476,
2.804412, -3.645529, -5.921924,
2.804412, -3.645529, 5.836476,
2.804412, 3.236579, -5.921924,
2.804412, 3.236579, 5.836476
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
var radius = 7.960999;
var distance = 35.41938;
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
mvMatrix.translate( 0.2224815, 0.2044747, 0.04272389 );
mvMatrix.scale( 1.421852, 1.25072, 0.7320374 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41938);
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
Padan<-read.table("Padan.xyz")
```

```
## Error in read.table("Padan.xyz"): no lines available in input
```

```r
x<-Padan$V2
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
```

```r
y<-Padan$V3
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
```

```r
z<-Padan$V4
```

```
## Error in eval(expr, envir, enclos): object 'Padan' not found
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
-3.161213, -0.9140276, -2.537139, 0, 0, 1, 1, 1,
-3.075841, 0.06501473, -2.423224, 1, 0, 0, 1, 1,
-2.823056, 0.1834986, -0.9736607, 1, 0, 0, 1, 1,
-2.772862, -1.62969, -2.151879, 1, 0, 0, 1, 1,
-2.616224, -2.30881, -1.951544, 1, 0, 0, 1, 1,
-2.580487, 0.5115657, -1.666208, 1, 0, 0, 1, 1,
-2.556525, -0.5902796, -1.680369, 0, 0, 0, 1, 1,
-2.551384, -0.09868015, -1.304107, 0, 0, 0, 1, 1,
-2.539956, 1.241174, -1.311231, 0, 0, 0, 1, 1,
-2.508495, 0.6107855, 2.224172, 0, 0, 0, 1, 1,
-2.404608, 0.3993286, 0.2288605, 0, 0, 0, 1, 1,
-2.328721, -0.1542594, -1.911889, 0, 0, 0, 1, 1,
-2.301928, 0.8139344, -2.126055, 0, 0, 0, 1, 1,
-2.252385, 1.349252, -1.613603, 1, 1, 1, 1, 1,
-2.234787, 1.143291, -0.8107402, 1, 1, 1, 1, 1,
-2.21082, -0.6885665, -2.979389, 1, 1, 1, 1, 1,
-2.184317, -1.242247, -2.280734, 1, 1, 1, 1, 1,
-2.18315, 0.3864022, -1.717368, 1, 1, 1, 1, 1,
-2.172972, -0.7505361, -3.532279, 1, 1, 1, 1, 1,
-2.155778, 1.142153, -0.8788028, 1, 1, 1, 1, 1,
-2.148978, 1.418647, -1.526094, 1, 1, 1, 1, 1,
-2.089305, -0.7262121, -3.250471, 1, 1, 1, 1, 1,
-2.083597, 1.499641, -1.456415, 1, 1, 1, 1, 1,
-2.079547, -0.1264752, -2.249623, 1, 1, 1, 1, 1,
-2.060018, 0.8665154, -1.003451, 1, 1, 1, 1, 1,
-2.056111, 1.019982, 0.2900535, 1, 1, 1, 1, 1,
-2.048364, -0.6112283, -1.009772, 1, 1, 1, 1, 1,
-2.019397, 1.255076, -2.378368, 1, 1, 1, 1, 1,
-2.017958, -0.2012423, -2.231746, 0, 0, 1, 1, 1,
-2.003254, -0.9679273, -3.090618, 1, 0, 0, 1, 1,
-1.961957, 0.2123258, -1.928929, 1, 0, 0, 1, 1,
-1.918754, 0.8123944, -2.35371, 1, 0, 0, 1, 1,
-1.889767, -0.4453894, -2.465209, 1, 0, 0, 1, 1,
-1.863834, -0.682559, -0.7579608, 1, 0, 0, 1, 1,
-1.85775, 1.027466, 0.09963024, 0, 0, 0, 1, 1,
-1.843064, -0.520289, -0.463329, 0, 0, 0, 1, 1,
-1.809701, 0.04524777, 0.1245971, 0, 0, 0, 1, 1,
-1.803053, 0.789184, -1.83903, 0, 0, 0, 1, 1,
-1.797003, -2.354596, -2.611484, 0, 0, 0, 1, 1,
-1.796469, 0.3451958, -0.2373801, 0, 0, 0, 1, 1,
-1.788717, -0.3345155, -0.8854283, 0, 0, 0, 1, 1,
-1.779902, -1.092159, -3.640227, 1, 1, 1, 1, 1,
-1.752917, -1.188424, -0.7246689, 1, 1, 1, 1, 1,
-1.750648, -1.213622, -2.348147, 1, 1, 1, 1, 1,
-1.746351, -0.1266799, -0.5310223, 1, 1, 1, 1, 1,
-1.744199, -2.65594, -4.066274, 1, 1, 1, 1, 1,
-1.743233, -0.8831996, -1.950101, 1, 1, 1, 1, 1,
-1.743195, 0.3442056, -1.098666, 1, 1, 1, 1, 1,
-1.735536, -1.013159, -2.239575, 1, 1, 1, 1, 1,
-1.727469, -0.6622974, -3.239448, 1, 1, 1, 1, 1,
-1.722917, -1.286357, 0.2933204, 1, 1, 1, 1, 1,
-1.70483, -0.8074779, -2.00484, 1, 1, 1, 1, 1,
-1.694385, -0.8888311, -3.38086, 1, 1, 1, 1, 1,
-1.666069, -1.065761, -0.7176723, 1, 1, 1, 1, 1,
-1.652422, 1.905699, -1.472717, 1, 1, 1, 1, 1,
-1.649332, 1.381762, -1.096058, 1, 1, 1, 1, 1,
-1.630564, -0.2754548, -0.1013586, 0, 0, 1, 1, 1,
-1.629991, -0.3482053, 0.2851492, 1, 0, 0, 1, 1,
-1.627893, 0.2752016, -0.9552143, 1, 0, 0, 1, 1,
-1.613181, -0.4080106, -1.413789, 1, 0, 0, 1, 1,
-1.613097, -0.7560839, -0.9438862, 1, 0, 0, 1, 1,
-1.596561, 1.038947, -3.732947, 1, 0, 0, 1, 1,
-1.595186, -0.160441, -2.1048, 0, 0, 0, 1, 1,
-1.593321, -0.8510759, -1.010741, 0, 0, 0, 1, 1,
-1.587278, -0.4212201, -1.832626, 0, 0, 0, 1, 1,
-1.583558, -0.04171025, -2.566688, 0, 0, 0, 1, 1,
-1.576962, -0.2295695, -2.076611, 0, 0, 0, 1, 1,
-1.575155, 1.454824, -1.532264, 0, 0, 0, 1, 1,
-1.563427, -0.1769155, -1.647518, 0, 0, 0, 1, 1,
-1.56113, -0.05591783, -1.756054, 1, 1, 1, 1, 1,
-1.559663, 0.9234186, -0.6304703, 1, 1, 1, 1, 1,
-1.556121, -0.08835711, -0.4643969, 1, 1, 1, 1, 1,
-1.548067, -1.33226, -3.147635, 1, 1, 1, 1, 1,
-1.534285, 0.8444197, -2.289457, 1, 1, 1, 1, 1,
-1.521782, 0.9988968, -0.8311078, 1, 1, 1, 1, 1,
-1.509243, 0.9747778, -2.283343, 1, 1, 1, 1, 1,
-1.505687, -0.4854667, 0.1095205, 1, 1, 1, 1, 1,
-1.501338, 0.126017, -1.007541, 1, 1, 1, 1, 1,
-1.500084, -0.2682818, -1.603632, 1, 1, 1, 1, 1,
-1.486747, 0.696057, 0.03110337, 1, 1, 1, 1, 1,
-1.479081, 0.7481135, -2.116796, 1, 1, 1, 1, 1,
-1.471163, 0.6028878, -0.812659, 1, 1, 1, 1, 1,
-1.429505, 0.06886224, -2.260178, 1, 1, 1, 1, 1,
-1.428648, 0.3966295, -1.698811, 1, 1, 1, 1, 1,
-1.420511, -0.5160285, -2.429196, 0, 0, 1, 1, 1,
-1.413643, 0.01460907, -1.812054, 1, 0, 0, 1, 1,
-1.413505, -1.112167, -0.8678575, 1, 0, 0, 1, 1,
-1.413155, 0.3755288, -1.273112, 1, 0, 0, 1, 1,
-1.409396, -0.07975943, -2.514394, 1, 0, 0, 1, 1,
-1.408846, 1.15387, -0.3495398, 1, 0, 0, 1, 1,
-1.408427, 1.906519, 1.087495, 0, 0, 0, 1, 1,
-1.405538, -0.2062976, -2.966518, 0, 0, 0, 1, 1,
-1.403075, 1.690465, -0.3653307, 0, 0, 0, 1, 1,
-1.392768, 0.3593669, -1.707963, 0, 0, 0, 1, 1,
-1.388555, 0.2587171, -1.133514, 0, 0, 0, 1, 1,
-1.383859, -0.03938141, 0.0882111, 0, 0, 0, 1, 1,
-1.375343, 1.164513, -1.735003, 0, 0, 0, 1, 1,
-1.357174, 1.230305, -2.736981, 1, 1, 1, 1, 1,
-1.355268, -1.432091, -1.313529, 1, 1, 1, 1, 1,
-1.346134, 1.579463, 0.3871321, 1, 1, 1, 1, 1,
-1.346068, 0.9857322, -0.5522316, 1, 1, 1, 1, 1,
-1.337579, -0.6507799, -2.235625, 1, 1, 1, 1, 1,
-1.337104, -0.8042981, -1.974329, 1, 1, 1, 1, 1,
-1.33255, -0.294531, 0.2439754, 1, 1, 1, 1, 1,
-1.328307, -0.351503, -2.76972, 1, 1, 1, 1, 1,
-1.314286, 0.4026914, -1.320539, 1, 1, 1, 1, 1,
-1.308087, -0.5595341, -0.8500175, 1, 1, 1, 1, 1,
-1.28552, -0.6047689, -0.1828836, 1, 1, 1, 1, 1,
-1.268796, -0.6424893, -2.127608, 1, 1, 1, 1, 1,
-1.267702, 0.6134032, 0.7843483, 1, 1, 1, 1, 1,
-1.265857, -0.1429435, -3.795863, 1, 1, 1, 1, 1,
-1.262408, -1.330303, -2.670074, 1, 1, 1, 1, 1,
-1.262089, 1.38238, -0.3627092, 0, 0, 1, 1, 1,
-1.253943, 0.5246292, -2.524274, 1, 0, 0, 1, 1,
-1.246072, -0.7492454, -1.357167, 1, 0, 0, 1, 1,
-1.244482, -1.304662, -2.576995, 1, 0, 0, 1, 1,
-1.23636, -0.5133922, -1.024439, 1, 0, 0, 1, 1,
-1.235598, 2.276602, -0.06620122, 1, 0, 0, 1, 1,
-1.234171, -0.6660653, -1.795323, 0, 0, 0, 1, 1,
-1.230583, 1.973711, -1.107781, 0, 0, 0, 1, 1,
-1.224574, 0.3063042, -1.94082, 0, 0, 0, 1, 1,
-1.223174, -0.3608034, -3.138451, 0, 0, 0, 1, 1,
-1.217932, -0.6431062, -2.359052, 0, 0, 0, 1, 1,
-1.207992, 0.01639049, -1.32119, 0, 0, 0, 1, 1,
-1.205138, 0.9970213, 0.3328076, 0, 0, 0, 1, 1,
-1.175952, -0.6665746, -1.402792, 1, 1, 1, 1, 1,
-1.173068, 0.6335229, -0.228845, 1, 1, 1, 1, 1,
-1.171284, 1.24743, 0.2914105, 1, 1, 1, 1, 1,
-1.16751, -1.930454, 0.06439238, 1, 1, 1, 1, 1,
-1.167458, 1.06467, -2.252336, 1, 1, 1, 1, 1,
-1.148782, -1.045737, -1.700813, 1, 1, 1, 1, 1,
-1.142271, 0.3789726, -2.582652, 1, 1, 1, 1, 1,
-1.142046, 1.711908, -0.9331982, 1, 1, 1, 1, 1,
-1.140152, -1.355388, -3.275947, 1, 1, 1, 1, 1,
-1.137358, 0.3293581, -0.4577554, 1, 1, 1, 1, 1,
-1.125041, 0.9141952, -0.1942933, 1, 1, 1, 1, 1,
-1.124587, -0.2232646, -1.997604, 1, 1, 1, 1, 1,
-1.124474, -0.9249747, -3.460361, 1, 1, 1, 1, 1,
-1.121234, 0.6451729, -2.952886, 1, 1, 1, 1, 1,
-1.120744, 0.5919967, -1.125695, 1, 1, 1, 1, 1,
-1.110556, 0.6817124, -0.5336087, 0, 0, 1, 1, 1,
-1.11047, -0.01960884, -4.187072, 1, 0, 0, 1, 1,
-1.107137, -0.007255135, -1.380892, 1, 0, 0, 1, 1,
-1.09203, -0.2537858, -1.644051, 1, 0, 0, 1, 1,
-1.076077, -1.214587, -2.592733, 1, 0, 0, 1, 1,
-1.075299, -0.5844724, -2.396956, 1, 0, 0, 1, 1,
-1.069361, 2.133903, -0.7381397, 0, 0, 0, 1, 1,
-1.066498, 0.7385473, -1.303198, 0, 0, 0, 1, 1,
-1.064053, -1.312808, -2.442848, 0, 0, 0, 1, 1,
-1.040465, 0.4868299, -1.379868, 0, 0, 0, 1, 1,
-1.037613, -1.857496, -2.710985, 0, 0, 0, 1, 1,
-1.028968, -1.56204, -3.333116, 0, 0, 0, 1, 1,
-1.01678, -0.1669873, -0.7851896, 0, 0, 0, 1, 1,
-1.01673, -1.090422, -2.537726, 1, 1, 1, 1, 1,
-1.014757, -0.3777752, -1.29553, 1, 1, 1, 1, 1,
-1.013471, 0.9937891, -2.094023, 1, 1, 1, 1, 1,
-1.012098, 0.001324074, -1.59532, 1, 1, 1, 1, 1,
-1.01192, -0.894919, -2.922498, 1, 1, 1, 1, 1,
-1.0116, 0.289267, -1.535995, 1, 1, 1, 1, 1,
-1.011462, -1.407647, -2.272163, 1, 1, 1, 1, 1,
-1.00633, 1.786649, -0.9731364, 1, 1, 1, 1, 1,
-1.001278, -1.529001, -3.457897, 1, 1, 1, 1, 1,
-0.9982756, -0.7223895, -1.354607, 1, 1, 1, 1, 1,
-0.9963761, -1.205256, -2.68485, 1, 1, 1, 1, 1,
-0.9910731, 0.8080575, -1.866003, 1, 1, 1, 1, 1,
-0.9826033, 0.7077764, -1.54728, 1, 1, 1, 1, 1,
-0.9786573, 0.9939618, 0.1314306, 1, 1, 1, 1, 1,
-0.9738932, 0.114131, -0.9051524, 1, 1, 1, 1, 1,
-0.9603292, 0.1100895, 0.06153295, 0, 0, 1, 1, 1,
-0.9562269, -0.7036889, -3.455824, 1, 0, 0, 1, 1,
-0.9549766, 0.148207, -0.6259714, 1, 0, 0, 1, 1,
-0.9530247, -0.6960666, -1.59423, 1, 0, 0, 1, 1,
-0.9419208, 0.9973208, -0.5159981, 1, 0, 0, 1, 1,
-0.9335009, 1.250861, 0.7910778, 1, 0, 0, 1, 1,
-0.9327369, -0.5663885, -2.771509, 0, 0, 0, 1, 1,
-0.9321533, 1.630904, -2.746393, 0, 0, 0, 1, 1,
-0.925502, 1.636327, -1.126288, 0, 0, 0, 1, 1,
-0.9203337, -1.449528, -2.735471, 0, 0, 0, 1, 1,
-0.9199679, 1.063315, -0.8568606, 0, 0, 0, 1, 1,
-0.9193783, -0.9165223, -3.391981, 0, 0, 0, 1, 1,
-0.9163944, 1.18841, -1.033079, 0, 0, 0, 1, 1,
-0.9153861, 0.2214308, -1.599774, 1, 1, 1, 1, 1,
-0.9131075, -1.048241, -2.385421, 1, 1, 1, 1, 1,
-0.9110106, 0.9855146, 1.023098, 1, 1, 1, 1, 1,
-0.9089217, 1.646836, -1.859241, 1, 1, 1, 1, 1,
-0.9069003, 0.06372453, -2.782038, 1, 1, 1, 1, 1,
-0.900985, -0.3640005, -1.400266, 1, 1, 1, 1, 1,
-0.8974115, 0.3624826, -1.973357, 1, 1, 1, 1, 1,
-0.8951692, -1.096326, -2.749712, 1, 1, 1, 1, 1,
-0.8914455, 0.3331181, 0.02040765, 1, 1, 1, 1, 1,
-0.8828474, -0.3624788, -1.836263, 1, 1, 1, 1, 1,
-0.8788672, -1.492685, -2.882095, 1, 1, 1, 1, 1,
-0.8688093, 0.1358081, -2.080646, 1, 1, 1, 1, 1,
-0.8679183, 1.331555, -0.5737438, 1, 1, 1, 1, 1,
-0.8657494, 2.031883, -1.301272, 1, 1, 1, 1, 1,
-0.8577022, 0.03042003, -1.724587, 1, 1, 1, 1, 1,
-0.8573201, 0.4173974, -0.9185836, 0, 0, 1, 1, 1,
-0.8506284, 0.02704618, -3.093962, 1, 0, 0, 1, 1,
-0.8363179, 2.076246, -0.5990717, 1, 0, 0, 1, 1,
-0.8355879, -1.35203, -1.671669, 1, 0, 0, 1, 1,
-0.8350454, 0.6040176, -2.16105, 1, 0, 0, 1, 1,
-0.8326519, 0.8134477, -1.845883, 1, 0, 0, 1, 1,
-0.8289278, 0.1687725, -2.615824, 0, 0, 0, 1, 1,
-0.8255566, -0.5203071, -2.114554, 0, 0, 0, 1, 1,
-0.8249055, -0.6836433, -1.713485, 0, 0, 0, 1, 1,
-0.824095, 0.3458116, -1.05026, 0, 0, 0, 1, 1,
-0.8239487, -0.9148981, -1.536092, 0, 0, 0, 1, 1,
-0.8235347, -0.1773645, -2.712411, 0, 0, 0, 1, 1,
-0.8231174, -1.864539, -2.443426, 0, 0, 0, 1, 1,
-0.8221957, 0.2976609, -0.6387591, 1, 1, 1, 1, 1,
-0.8113016, -1.281719, -1.866215, 1, 1, 1, 1, 1,
-0.8092611, 0.004814147, -0.5575829, 1, 1, 1, 1, 1,
-0.8046677, -1.078714, -3.570572, 1, 1, 1, 1, 1,
-0.8023127, 0.6330261, -0.1026437, 1, 1, 1, 1, 1,
-0.7997907, -2.268733, -4.319563, 1, 1, 1, 1, 1,
-0.7961346, -1.390758, -1.754676, 1, 1, 1, 1, 1,
-0.7959875, 0.3252733, -1.2095, 1, 1, 1, 1, 1,
-0.7955043, 0.9935648, -2.018981, 1, 1, 1, 1, 1,
-0.79398, 1.609533, -0.5010303, 1, 1, 1, 1, 1,
-0.7869428, -0.2878807, -1.64121, 1, 1, 1, 1, 1,
-0.7841861, 1.312733, -1.343913, 1, 1, 1, 1, 1,
-0.7773957, -1.712971, -3.351306, 1, 1, 1, 1, 1,
-0.7733271, -1.651761, -2.938162, 1, 1, 1, 1, 1,
-0.7654542, -0.1160722, -1.901113, 1, 1, 1, 1, 1,
-0.7644234, 0.08087521, 0.5469375, 0, 0, 1, 1, 1,
-0.7578444, 1.375876, -2.004983, 1, 0, 0, 1, 1,
-0.7569479, 0.6098341, 0.4890859, 1, 0, 0, 1, 1,
-0.7561299, -0.144603, -1.696054, 1, 0, 0, 1, 1,
-0.7534594, 0.06584457, -3.007589, 1, 0, 0, 1, 1,
-0.7507672, 0.4843114, -1.104128, 1, 0, 0, 1, 1,
-0.7413853, -0.6025519, -1.882258, 0, 0, 0, 1, 1,
-0.7403957, -0.4924672, -3.46719, 0, 0, 0, 1, 1,
-0.7366027, -0.2640937, -2.171955, 0, 0, 0, 1, 1,
-0.7364764, 0.5835671, -2.103839, 0, 0, 0, 1, 1,
-0.7346914, 3.136354, -0.128591, 0, 0, 0, 1, 1,
-0.7322989, 1.692543, 0.1401196, 0, 0, 0, 1, 1,
-0.7155918, 0.7762158, 1.186625, 0, 0, 0, 1, 1,
-0.7077546, 0.3527077, -0.6809481, 1, 1, 1, 1, 1,
-0.6945362, 0.5965559, -3.273364, 1, 1, 1, 1, 1,
-0.6822418, -0.6997843, -2.972909, 1, 1, 1, 1, 1,
-0.68186, 2.434709, -0.8496822, 1, 1, 1, 1, 1,
-0.6818537, 1.197391, -0.8125269, 1, 1, 1, 1, 1,
-0.6616259, -0.3581659, -0.4320774, 1, 1, 1, 1, 1,
-0.6592831, 0.03830734, -1.089377, 1, 1, 1, 1, 1,
-0.6588944, -1.266792, -3.61267, 1, 1, 1, 1, 1,
-0.6583039, 1.069296, -0.823005, 1, 1, 1, 1, 1,
-0.6533747, -1.021819, -2.282797, 1, 1, 1, 1, 1,
-0.6526347, -0.4692106, -1.704658, 1, 1, 1, 1, 1,
-0.6512061, -0.1291533, -0.6871884, 1, 1, 1, 1, 1,
-0.6504206, 1.940746, -0.3766749, 1, 1, 1, 1, 1,
-0.650349, 0.4928245, -2.144401, 1, 1, 1, 1, 1,
-0.6502281, -0.6630232, -2.822026, 1, 1, 1, 1, 1,
-0.6495388, -0.8073972, -3.367787, 0, 0, 1, 1, 1,
-0.6487222, -0.01289332, -1.401865, 1, 0, 0, 1, 1,
-0.6455871, 0.2504694, -1.580825, 1, 0, 0, 1, 1,
-0.6440876, 1.457252, -0.5516311, 1, 0, 0, 1, 1,
-0.6431507, -0.2583946, -1.141632, 1, 0, 0, 1, 1,
-0.6412271, -0.7777604, -3.200461, 1, 0, 0, 1, 1,
-0.6297768, 0.06858917, -1.540931, 0, 0, 0, 1, 1,
-0.62739, 0.6695282, 0.3816575, 0, 0, 0, 1, 1,
-0.6266003, -0.3343838, -2.397854, 0, 0, 0, 1, 1,
-0.6255698, -0.257405, -3.05389, 0, 0, 0, 1, 1,
-0.6244925, 1.169823, -0.126183, 0, 0, 0, 1, 1,
-0.6221318, 0.1243861, -1.472774, 0, 0, 0, 1, 1,
-0.621993, 0.001819954, -1.674753, 0, 0, 0, 1, 1,
-0.6122659, -0.7143771, -2.890337, 1, 1, 1, 1, 1,
-0.5925496, -0.1505722, -2.28212, 1, 1, 1, 1, 1,
-0.5917237, 0.2100587, -1.498463, 1, 1, 1, 1, 1,
-0.5901315, -0.4710242, -3.904132, 1, 1, 1, 1, 1,
-0.5858334, 1.674403, -1.057355, 1, 1, 1, 1, 1,
-0.5770953, -0.7670999, -1.274718, 1, 1, 1, 1, 1,
-0.5743523, 1.587718, -0.08498163, 1, 1, 1, 1, 1,
-0.5715454, -1.970389, -2.437888, 1, 1, 1, 1, 1,
-0.5619698, -0.5790879, -2.502256, 1, 1, 1, 1, 1,
-0.5607229, 0.5593609, -1.282829, 1, 1, 1, 1, 1,
-0.5598197, -2.069877, -3.156475, 1, 1, 1, 1, 1,
-0.5596097, 0.5590044, 0.06866787, 1, 1, 1, 1, 1,
-0.5585095, -0.3702887, -4.096338, 1, 1, 1, 1, 1,
-0.5580991, -1.248531, -4.132616, 1, 1, 1, 1, 1,
-0.5539732, -0.844875, -1.512772, 1, 1, 1, 1, 1,
-0.552829, 0.3579423, -2.13505, 0, 0, 1, 1, 1,
-0.5495788, 0.4835432, -0.3429759, 1, 0, 0, 1, 1,
-0.5473301, 0.9286577, -2.135186, 1, 0, 0, 1, 1,
-0.5469762, -0.3013011, -1.908851, 1, 0, 0, 1, 1,
-0.5418422, -0.3589012, -3.611311, 1, 0, 0, 1, 1,
-0.5412993, -0.3289235, -1.237489, 1, 0, 0, 1, 1,
-0.5398914, 0.4725825, 0.2322986, 0, 0, 0, 1, 1,
-0.5370414, 1.052937, -2.023552, 0, 0, 0, 1, 1,
-0.5307195, 2.268622, 0.4172004, 0, 0, 0, 1, 1,
-0.5274854, -1.102923, -4.982282, 0, 0, 0, 1, 1,
-0.5221906, -0.6742182, -2.572279, 0, 0, 0, 1, 1,
-0.5202767, 0.09148459, -0.8554943, 0, 0, 0, 1, 1,
-0.5142819, 0.7086025, 1.908715, 0, 0, 0, 1, 1,
-0.5117235, 0.8341841, -0.3197737, 1, 1, 1, 1, 1,
-0.5116274, 0.4707685, -2.561065, 1, 1, 1, 1, 1,
-0.5079886, 0.1310697, -1.631701, 1, 1, 1, 1, 1,
-0.5057407, -0.6665886, -3.109774, 1, 1, 1, 1, 1,
-0.5027594, 0.9085899, -0.6852138, 1, 1, 1, 1, 1,
-0.5017005, -1.221117, -4.040927, 1, 1, 1, 1, 1,
-0.5015845, 0.5518122, -0.008429918, 1, 1, 1, 1, 1,
-0.4994061, 0.8783994, -0.1847371, 1, 1, 1, 1, 1,
-0.49914, 0.7616863, -0.3831841, 1, 1, 1, 1, 1,
-0.497631, 0.9939796, -0.3625893, 1, 1, 1, 1, 1,
-0.4973959, 0.9247892, -0.4668799, 1, 1, 1, 1, 1,
-0.4930909, 1.859883, 2.179842, 1, 1, 1, 1, 1,
-0.4924025, -1.4832, -1.527654, 1, 1, 1, 1, 1,
-0.4878696, 0.08783473, -0.7213113, 1, 1, 1, 1, 1,
-0.483078, 0.2273941, -0.8491496, 1, 1, 1, 1, 1,
-0.4822032, -0.1784972, -2.03337, 0, 0, 1, 1, 1,
-0.4805274, 0.4208443, -1.655116, 1, 0, 0, 1, 1,
-0.4794662, -0.1672677, -1.082407, 1, 0, 0, 1, 1,
-0.4750994, -0.4053614, -2.51029, 1, 0, 0, 1, 1,
-0.4737925, 1.685987, -0.3798304, 1, 0, 0, 1, 1,
-0.4711795, -0.5386119, -2.35353, 1, 0, 0, 1, 1,
-0.4710361, 0.9125377, -0.7911945, 0, 0, 0, 1, 1,
-0.4682395, -0.7504767, -3.214407, 0, 0, 0, 1, 1,
-0.4645476, -0.7301303, -2.835037, 0, 0, 0, 1, 1,
-0.4585322, 0.4759263, -0.1399553, 0, 0, 0, 1, 1,
-0.4582244, -1.187408, -4.441488, 0, 0, 0, 1, 1,
-0.4570016, 0.02592167, -1.828181, 0, 0, 0, 1, 1,
-0.4555291, -0.5223384, -4.008533, 0, 0, 0, 1, 1,
-0.4543968, 0.3569738, -3.462062, 1, 1, 1, 1, 1,
-0.4481902, -0.5416443, -3.148326, 1, 1, 1, 1, 1,
-0.4456313, -0.5699095, -3.064904, 1, 1, 1, 1, 1,
-0.4443612, 0.1497456, -1.161697, 1, 1, 1, 1, 1,
-0.4430329, -1.300433, -4.485662, 1, 1, 1, 1, 1,
-0.4430321, -0.006621657, -1.521271, 1, 1, 1, 1, 1,
-0.4418943, 0.01433078, -1.038823, 1, 1, 1, 1, 1,
-0.4397585, 0.7313833, -0.1495416, 1, 1, 1, 1, 1,
-0.4367001, 0.008583854, -0.7533431, 1, 1, 1, 1, 1,
-0.4330632, -1.482116, -3.39638, 1, 1, 1, 1, 1,
-0.4288101, 0.7416201, -0.2788916, 1, 1, 1, 1, 1,
-0.4155562, 1.651304, 0.01631519, 1, 1, 1, 1, 1,
-0.414885, 0.7027745, -1.876802, 1, 1, 1, 1, 1,
-0.4145771, -0.03069823, -2.898211, 1, 1, 1, 1, 1,
-0.412739, 1.715595, -0.09280024, 1, 1, 1, 1, 1,
-0.4064261, 0.6745354, 1.94161, 0, 0, 1, 1, 1,
-0.4060471, -0.4658342, -0.2780063, 1, 0, 0, 1, 1,
-0.4036946, 1.314369, 0.6757634, 1, 0, 0, 1, 1,
-0.4021952, 0.5586353, -1.279484, 1, 0, 0, 1, 1,
-0.3998175, 0.4948836, -0.7340549, 1, 0, 0, 1, 1,
-0.3924904, -0.0885165, -1.324796, 1, 0, 0, 1, 1,
-0.3919515, 0.335803, 1.843771, 0, 0, 0, 1, 1,
-0.3906569, -0.7613242, -3.612123, 0, 0, 0, 1, 1,
-0.3847733, -0.6490471, -2.858099, 0, 0, 0, 1, 1,
-0.3808502, -1.357921, -3.246511, 0, 0, 0, 1, 1,
-0.3807999, -0.03764119, -1.191123, 0, 0, 0, 1, 1,
-0.3798352, 0.0742024, -1.577839, 0, 0, 0, 1, 1,
-0.3734868, -0.7215165, -2.581032, 0, 0, 0, 1, 1,
-0.3710171, 0.7810897, -1.402243, 1, 1, 1, 1, 1,
-0.3674568, 0.7055117, -1.430621, 1, 1, 1, 1, 1,
-0.3577409, -1.307023, -2.999047, 1, 1, 1, 1, 1,
-0.356676, 0.9278324, -1.486567, 1, 1, 1, 1, 1,
-0.3565593, 1.803056, -1.247082, 1, 1, 1, 1, 1,
-0.3513281, 0.7009521, 0.9464085, 1, 1, 1, 1, 1,
-0.3513216, -0.9119495, -2.149936, 1, 1, 1, 1, 1,
-0.3460112, 0.3695531, 0.2802818, 1, 1, 1, 1, 1,
-0.3411952, -0.5240197, -1.138857, 1, 1, 1, 1, 1,
-0.3386647, 0.9047525, -0.9574574, 1, 1, 1, 1, 1,
-0.3381176, 0.3339389, 0.6911622, 1, 1, 1, 1, 1,
-0.3224398, 1.174005, 0.1493388, 1, 1, 1, 1, 1,
-0.3199671, -0.2417005, -2.879534, 1, 1, 1, 1, 1,
-0.3172044, -2.303274, -3.067922, 1, 1, 1, 1, 1,
-0.3134477, -0.4531507, -1.619219, 1, 1, 1, 1, 1,
-0.3113173, 0.06877716, -2.391152, 0, 0, 1, 1, 1,
-0.3089699, 0.02182763, -1.627471, 1, 0, 0, 1, 1,
-0.3089386, -1.46115, -2.951435, 1, 0, 0, 1, 1,
-0.3089125, -0.3719887, -2.604946, 1, 0, 0, 1, 1,
-0.3068562, -1.465073, -3.684069, 1, 0, 0, 1, 1,
-0.3039657, 0.3888971, -1.239088, 1, 0, 0, 1, 1,
-0.3005513, -1.336791, -3.737046, 0, 0, 0, 1, 1,
-0.2973757, -0.4714201, -2.730889, 0, 0, 0, 1, 1,
-0.2943717, 5.571814e-05, -2.06829, 0, 0, 0, 1, 1,
-0.2939938, -0.5494038, -3.05118, 0, 0, 0, 1, 1,
-0.293395, 0.07548326, -1.748078, 0, 0, 0, 1, 1,
-0.2923529, -0.02079291, -1.484486, 0, 0, 0, 1, 1,
-0.2920639, -2.216025, -2.491027, 0, 0, 0, 1, 1,
-0.291375, -1.603524, -2.44745, 1, 1, 1, 1, 1,
-0.28965, 0.3132777, -0.5633869, 1, 1, 1, 1, 1,
-0.2893934, 0.7017131, -0.5834808, 1, 1, 1, 1, 1,
-0.2892988, -1.352157, -4.966334, 1, 1, 1, 1, 1,
-0.2854882, -0.3226312, -2.229836, 1, 1, 1, 1, 1,
-0.2779963, -0.45115, -2.086747, 1, 1, 1, 1, 1,
-0.2778752, -0.202391, -1.707166, 1, 1, 1, 1, 1,
-0.2765133, 1.194872, 0.0880975, 1, 1, 1, 1, 1,
-0.2764273, 1.61761, -1.18932, 1, 1, 1, 1, 1,
-0.2649332, 0.9261867, -0.8737537, 1, 1, 1, 1, 1,
-0.2626851, -0.1184044, -1.533164, 1, 1, 1, 1, 1,
-0.2603676, -0.4402367, -3.95344, 1, 1, 1, 1, 1,
-0.2597386, 0.7681784, 1.276433, 1, 1, 1, 1, 1,
-0.2563703, -0.2664684, -3.245905, 1, 1, 1, 1, 1,
-0.2532497, -0.142601, -1.636401, 1, 1, 1, 1, 1,
-0.2509905, -0.213293, -3.70155, 0, 0, 1, 1, 1,
-0.2505809, -1.325878, -2.1816, 1, 0, 0, 1, 1,
-0.2487571, -0.1578366, -1.145049, 1, 0, 0, 1, 1,
-0.2469244, 0.2425514, -0.3183377, 1, 0, 0, 1, 1,
-0.2444479, 0.1621747, -1.588296, 1, 0, 0, 1, 1,
-0.2411891, 1.405827, -0.1496481, 1, 0, 0, 1, 1,
-0.2336553, 0.2669381, -0.4837496, 0, 0, 0, 1, 1,
-0.2282291, 0.0285267, -1.444878, 0, 0, 0, 1, 1,
-0.2277679, -1.177906, -1.521585, 0, 0, 0, 1, 1,
-0.2255132, 1.066877, 0.1664587, 0, 0, 0, 1, 1,
-0.2253398, -0.5001478, -1.868228, 0, 0, 0, 1, 1,
-0.2198296, 0.6722966, -0.2170244, 0, 0, 0, 1, 1,
-0.2164465, 0.146126, -0.7367743, 0, 0, 0, 1, 1,
-0.2160637, -1.474308, -4.12685, 1, 1, 1, 1, 1,
-0.2145811, 0.5120967, 0.251133, 1, 1, 1, 1, 1,
-0.2124091, -0.04129997, -1.849082, 1, 1, 1, 1, 1,
-0.2102697, 0.7868268, 1.456141, 1, 1, 1, 1, 1,
-0.2092827, 0.8556168, 0.1157658, 1, 1, 1, 1, 1,
-0.2088704, -0.3098359, -1.422299, 1, 1, 1, 1, 1,
-0.208335, 0.4690575, -1.318463, 1, 1, 1, 1, 1,
-0.2076873, -1.664261, -2.97705, 1, 1, 1, 1, 1,
-0.2066421, -0.9672124, -4.391443, 1, 1, 1, 1, 1,
-0.1939298, 0.03156702, -1.876796, 1, 1, 1, 1, 1,
-0.1890526, 1.11939, -1.996048, 1, 1, 1, 1, 1,
-0.188377, -0.2523713, -3.698462, 1, 1, 1, 1, 1,
-0.1881435, 1.389682, -1.416519, 1, 1, 1, 1, 1,
-0.1879122, 1.343116, -1.670311, 1, 1, 1, 1, 1,
-0.1836134, 0.1595381, -0.1678247, 1, 1, 1, 1, 1,
-0.1835537, -0.8790667, -2.471685, 0, 0, 1, 1, 1,
-0.1831774, -0.1234912, -2.644886, 1, 0, 0, 1, 1,
-0.1828526, -0.07182748, -1.112953, 1, 0, 0, 1, 1,
-0.1743196, 0.8415457, -0.7462338, 1, 0, 0, 1, 1,
-0.1724244, -0.6392325, -3.483194, 1, 0, 0, 1, 1,
-0.1704676, -1.115736, -1.451256, 1, 0, 0, 1, 1,
-0.1698499, -3.545304, -3.286931, 0, 0, 0, 1, 1,
-0.1698475, -0.4455488, -5.750685, 0, 0, 0, 1, 1,
-0.1693344, -2.987469, -2.053154, 0, 0, 0, 1, 1,
-0.1689089, -1.4353, -3.288496, 0, 0, 0, 1, 1,
-0.1659707, -0.6620923, -2.17568, 0, 0, 0, 1, 1,
-0.1644795, 0.2533706, 0.0829476, 0, 0, 0, 1, 1,
-0.1633403, -0.4535905, -2.710535, 0, 0, 0, 1, 1,
-0.1605371, 0.08106649, -0.2246758, 1, 1, 1, 1, 1,
-0.1542901, -0.6035867, -3.965661, 1, 1, 1, 1, 1,
-0.1530797, -0.1011591, -2.014458, 1, 1, 1, 1, 1,
-0.151283, 0.6685693, -1.46953, 1, 1, 1, 1, 1,
-0.1511184, 0.2765193, -1.613815, 1, 1, 1, 1, 1,
-0.151033, 0.7902011, -1.455469, 1, 1, 1, 1, 1,
-0.1488446, -1.039057, -2.123826, 1, 1, 1, 1, 1,
-0.1484364, -0.08032592, -2.041236, 1, 1, 1, 1, 1,
-0.1471297, 0.9427264, 0.7288754, 1, 1, 1, 1, 1,
-0.1434606, 1.014757, -1.389575, 1, 1, 1, 1, 1,
-0.1424911, -0.2703638, -3.612063, 1, 1, 1, 1, 1,
-0.1403348, 0.9127396, -0.1146954, 1, 1, 1, 1, 1,
-0.1397401, 1.587272, -1.091358, 1, 1, 1, 1, 1,
-0.1381858, 0.7246453, -0.1017847, 1, 1, 1, 1, 1,
-0.133168, -0.7707549, -4.52108, 1, 1, 1, 1, 1,
-0.1312938, 0.1532967, -0.009113986, 0, 0, 1, 1, 1,
-0.1286879, 0.4894075, -0.1136281, 1, 0, 0, 1, 1,
-0.124792, 0.1706326, -1.83301, 1, 0, 0, 1, 1,
-0.1191525, -1.576184, -2.721521, 1, 0, 0, 1, 1,
-0.1189569, 1.049674, -0.769899, 1, 0, 0, 1, 1,
-0.1187587, -1.796548, -3.363883, 1, 0, 0, 1, 1,
-0.1149348, 0.1365334, 0.4982388, 0, 0, 0, 1, 1,
-0.1129486, 0.3158106, -0.2646578, 0, 0, 0, 1, 1,
-0.1077598, -0.5381572, -2.2901, 0, 0, 0, 1, 1,
-0.107371, 0.5167076, 1.3341, 0, 0, 0, 1, 1,
-0.1027038, -0.9319566, -2.213508, 0, 0, 0, 1, 1,
-0.09693263, -0.7507618, -2.361285, 0, 0, 0, 1, 1,
-0.0936157, -0.9189433, -2.000403, 0, 0, 0, 1, 1,
-0.09265824, -0.4505003, -4.868086, 1, 1, 1, 1, 1,
-0.08960509, 0.4279186, -0.1652122, 1, 1, 1, 1, 1,
-0.08729334, 1.289754, -0.8479671, 1, 1, 1, 1, 1,
-0.08431146, 0.03405062, -2.388007, 1, 1, 1, 1, 1,
-0.08207206, 0.5688581, -1.848193, 1, 1, 1, 1, 1,
-0.07924484, -0.4498189, -4.814126, 1, 1, 1, 1, 1,
-0.07503361, -0.3108266, -5.182377, 1, 1, 1, 1, 1,
-0.07133351, -1.074947, -3.747056, 1, 1, 1, 1, 1,
-0.06734971, -0.4612921, -3.168506, 1, 1, 1, 1, 1,
-0.06685214, 0.09491874, -1.261364, 1, 1, 1, 1, 1,
-0.06479599, 0.7835358, -1.15637, 1, 1, 1, 1, 1,
-0.06366795, -0.4576901, -2.111549, 1, 1, 1, 1, 1,
-0.06351095, -0.2889155, -2.74706, 1, 1, 1, 1, 1,
-0.06337129, 0.0916746, 0.7006865, 1, 1, 1, 1, 1,
-0.06320772, -0.7446811, -2.353548, 1, 1, 1, 1, 1,
-0.05908088, 2.356874, -0.707288, 0, 0, 1, 1, 1,
-0.05645103, 0.639899, 1.037353, 1, 0, 0, 1, 1,
-0.05579117, -1.137255, -1.855255, 1, 0, 0, 1, 1,
-0.05527115, 0.8503219, 0.2645695, 1, 0, 0, 1, 1,
-0.05347132, -1.240978, -3.510958, 1, 0, 0, 1, 1,
-0.05258131, 0.5789148, -0.2989269, 1, 0, 0, 1, 1,
-0.04806886, -1.962743, -4.652346, 0, 0, 0, 1, 1,
-0.04741634, -1.490465, -3.806351, 0, 0, 0, 1, 1,
-0.04517387, -0.452413, -2.399, 0, 0, 0, 1, 1,
-0.04382976, -0.1640199, -3.915653, 0, 0, 0, 1, 1,
-0.04295076, -0.5161636, -2.157459, 0, 0, 0, 1, 1,
-0.04251458, -0.3290895, -3.066961, 0, 0, 0, 1, 1,
-0.03755856, -0.1148766, -1.358485, 0, 0, 0, 1, 1,
-0.03096292, 1.207906, 0.2709754, 1, 1, 1, 1, 1,
-0.02977265, -1.04791, -3.462853, 1, 1, 1, 1, 1,
-0.02871387, -1.644595, -2.568241, 1, 1, 1, 1, 1,
-0.02307279, 0.5356295, 0.2559392, 1, 1, 1, 1, 1,
-0.0221595, 0.04239413, -0.6859061, 1, 1, 1, 1, 1,
-0.02066965, 1.222672, -0.2154437, 1, 1, 1, 1, 1,
-0.0193485, 1.186391, -0.4378895, 1, 1, 1, 1, 1,
-0.01688933, 0.6333277, 0.2016813, 1, 1, 1, 1, 1,
-0.01605768, 0.116698, 0.1668216, 1, 1, 1, 1, 1,
-0.01590871, -0.8826773, -3.47754, 1, 1, 1, 1, 1,
-0.01510054, 0.8574378, -0.6558176, 1, 1, 1, 1, 1,
-0.008988002, 0.9200687, 0.2239187, 1, 1, 1, 1, 1,
-0.0072854, 1.694376, 0.07638367, 1, 1, 1, 1, 1,
-0.006914221, -0.7367855, -3.16077, 1, 1, 1, 1, 1,
-0.004714204, 0.6312222, 0.1157411, 1, 1, 1, 1, 1,
-0.002624268, 0.4542989, -0.4258062, 0, 0, 1, 1, 1,
-0.002494897, -1.122614, -4.654008, 1, 0, 0, 1, 1,
-0.0006725141, 0.2444314, 0.5721967, 1, 0, 0, 1, 1,
0.002886303, 0.657585, -0.8712047, 1, 0, 0, 1, 1,
0.004912682, -0.9107225, 4.11168, 1, 0, 0, 1, 1,
0.006656705, -0.2422521, 3.942881, 1, 0, 0, 1, 1,
0.007089721, 0.4737199, -0.5528811, 0, 0, 0, 1, 1,
0.01451446, -0.6435465, 3.832505, 0, 0, 0, 1, 1,
0.02069388, 0.7480684, 1.30449, 0, 0, 0, 1, 1,
0.02191315, 0.2684545, 0.4217682, 0, 0, 0, 1, 1,
0.02207542, 0.1749753, -0.9054296, 0, 0, 0, 1, 1,
0.02613859, 0.3340766, 0.3541532, 0, 0, 0, 1, 1,
0.0282218, 0.2782797, -0.4895364, 0, 0, 0, 1, 1,
0.03020848, -0.4634201, 4.206001, 1, 1, 1, 1, 1,
0.0394408, -0.07250488, 2.73871, 1, 1, 1, 1, 1,
0.04610178, -0.2207123, 4.170831, 1, 1, 1, 1, 1,
0.04833459, -0.6863609, 2.840546, 1, 1, 1, 1, 1,
0.04927238, -0.4623644, 4.000451, 1, 1, 1, 1, 1,
0.05861536, 0.8648505, -0.2659014, 1, 1, 1, 1, 1,
0.0588803, -1.649797, 3.90152, 1, 1, 1, 1, 1,
0.06138296, -0.6981554, 1.709849, 1, 1, 1, 1, 1,
0.06586009, 0.5838823, -0.9891243, 1, 1, 1, 1, 1,
0.06624387, -0.8809796, 1.741911, 1, 1, 1, 1, 1,
0.06847692, 1.368638, -0.4322033, 1, 1, 1, 1, 1,
0.07220565, -0.6060352, 3.106174, 1, 1, 1, 1, 1,
0.0749834, 0.1910287, -0.1136294, 1, 1, 1, 1, 1,
0.07899087, 0.1279808, 0.05219779, 1, 1, 1, 1, 1,
0.08175652, 1.461848, 1.193811, 1, 1, 1, 1, 1,
0.08248672, -1.057436, 2.045903, 0, 0, 1, 1, 1,
0.08899476, -0.08460016, 3.446268, 1, 0, 0, 1, 1,
0.08899657, -0.6924702, 4.465515, 1, 0, 0, 1, 1,
0.09228443, -0.6659219, 2.290304, 1, 0, 0, 1, 1,
0.09656721, 1.976744, 1.877544, 1, 0, 0, 1, 1,
0.09689529, 0.9150276, 0.2338832, 1, 0, 0, 1, 1,
0.1029726, -0.9284059, 3.270967, 0, 0, 0, 1, 1,
0.1050506, 0.04901408, 0.5474627, 0, 0, 0, 1, 1,
0.105094, -0.8112712, 3.124774, 0, 0, 0, 1, 1,
0.1107921, 0.05037067, 1.791517, 0, 0, 0, 1, 1,
0.1146123, -0.704388, 0.8978887, 0, 0, 0, 1, 1,
0.1175582, 2.687509, -0.235368, 0, 0, 0, 1, 1,
0.118484, 0.1315003, 0.8472881, 0, 0, 0, 1, 1,
0.1211237, 1.890068, -0.7445954, 1, 1, 1, 1, 1,
0.1221458, 1.141872, 1.108128, 1, 1, 1, 1, 1,
0.122823, 0.6312588, 0.9652846, 1, 1, 1, 1, 1,
0.1267185, 0.6489858, -2.259513, 1, 1, 1, 1, 1,
0.1269033, 0.1062013, 0.3521873, 1, 1, 1, 1, 1,
0.1287731, -0.7185552, 2.604935, 1, 1, 1, 1, 1,
0.1317637, -0.2211505, 1.710723, 1, 1, 1, 1, 1,
0.1343219, -0.29361, 0.8063495, 1, 1, 1, 1, 1,
0.134787, 0.6947439, -0.4249828, 1, 1, 1, 1, 1,
0.1352917, -0.7947682, 1.713478, 1, 1, 1, 1, 1,
0.1387324, -0.1223438, 1.169702, 1, 1, 1, 1, 1,
0.1406921, -0.6132887, 2.965424, 1, 1, 1, 1, 1,
0.1447116, 1.083875, -0.02998983, 1, 1, 1, 1, 1,
0.1465895, -0.5120515, 3.789783, 1, 1, 1, 1, 1,
0.1479973, -0.2656519, 3.19228, 1, 1, 1, 1, 1,
0.1483754, -0.2912706, 2.663982, 0, 0, 1, 1, 1,
0.1488184, -0.9707237, 2.97161, 1, 0, 0, 1, 1,
0.1506331, 0.6001596, -0.7934212, 1, 0, 0, 1, 1,
0.1509481, -0.2103993, 3.340074, 1, 0, 0, 1, 1,
0.1524221, 0.1436624, 1.081628, 1, 0, 0, 1, 1,
0.1525901, 0.5882134, 1.099114, 1, 0, 0, 1, 1,
0.1530725, 0.5267531, 1.183786, 0, 0, 0, 1, 1,
0.1588673, -0.5081832, 1.744458, 0, 0, 0, 1, 1,
0.1615796, 0.7565631, 0.8344006, 0, 0, 0, 1, 1,
0.1623141, -0.9446034, 0.9637345, 0, 0, 0, 1, 1,
0.1626311, -0.480649, 1.639058, 0, 0, 0, 1, 1,
0.164182, -0.2378276, 2.934789, 0, 0, 0, 1, 1,
0.1642685, -0.3013181, 2.664021, 0, 0, 0, 1, 1,
0.1679177, -0.5911903, 1.139357, 1, 1, 1, 1, 1,
0.1800699, -0.9975761, 3.973602, 1, 1, 1, 1, 1,
0.1835758, 0.569942, 0.6431213, 1, 1, 1, 1, 1,
0.1836679, 1.717226, 0.1211602, 1, 1, 1, 1, 1,
0.184976, 0.8535106, 1.156917, 1, 1, 1, 1, 1,
0.1871275, 0.4124319, 1.298831, 1, 1, 1, 1, 1,
0.1878266, 1.116895, -3.221047, 1, 1, 1, 1, 1,
0.1884398, -0.5636483, 3.069272, 1, 1, 1, 1, 1,
0.1894957, 0.9954776, 0.8288779, 1, 1, 1, 1, 1,
0.1934461, -0.4364522, 3.039815, 1, 1, 1, 1, 1,
0.1944932, -1.560478, 3.195678, 1, 1, 1, 1, 1,
0.2018227, 0.9451228, -1.05528, 1, 1, 1, 1, 1,
0.2022958, 1.314795, 0.500177, 1, 1, 1, 1, 1,
0.202641, -0.9462783, 1.814086, 1, 1, 1, 1, 1,
0.203995, -0.5336655, 3.323469, 1, 1, 1, 1, 1,
0.2046585, 0.02916123, 2.691548, 0, 0, 1, 1, 1,
0.2056319, -0.2823356, 2.494931, 1, 0, 0, 1, 1,
0.2088643, -2.311131, 2.654394, 1, 0, 0, 1, 1,
0.2088771, 0.0668622, 1.215688, 1, 0, 0, 1, 1,
0.2129817, -0.5777248, 2.163279, 1, 0, 0, 1, 1,
0.2134394, -1.143215, 2.945571, 1, 0, 0, 1, 1,
0.2186912, -0.550142, 2.896474, 0, 0, 0, 1, 1,
0.2233743, 0.2908801, 0.8702233, 0, 0, 0, 1, 1,
0.2263363, -0.8648773, 2.25652, 0, 0, 0, 1, 1,
0.2312967, 0.7002884, 0.6724081, 0, 0, 0, 1, 1,
0.2350136, 1.955623, 0.525082, 0, 0, 0, 1, 1,
0.2352248, 1.933095, -0.03983678, 0, 0, 0, 1, 1,
0.237623, -0.8975554, 2.202555, 0, 0, 0, 1, 1,
0.238943, 0.7613359, -2.020172, 1, 1, 1, 1, 1,
0.239031, -1.483072, 2.678355, 1, 1, 1, 1, 1,
0.2406108, 1.538982, -0.4556371, 1, 1, 1, 1, 1,
0.2408541, 0.5906385, -1.842718, 1, 1, 1, 1, 1,
0.2417246, -0.461916, 3.098034, 1, 1, 1, 1, 1,
0.2422702, 0.6972159, -0.07175025, 1, 1, 1, 1, 1,
0.2428817, 0.35028, 1.3656, 1, 1, 1, 1, 1,
0.2455816, 0.2479711, 1.156775, 1, 1, 1, 1, 1,
0.2470699, -0.3632241, 1.545288, 1, 1, 1, 1, 1,
0.2499861, -0.314076, 2.009706, 1, 1, 1, 1, 1,
0.2572164, -2.496092, 3.251176, 1, 1, 1, 1, 1,
0.2581185, -0.963953, 3.018143, 1, 1, 1, 1, 1,
0.2623713, 0.5766318, 1.307909, 1, 1, 1, 1, 1,
0.2664746, 1.316521, -0.07675671, 1, 1, 1, 1, 1,
0.2687793, -1.674929, 2.079769, 1, 1, 1, 1, 1,
0.2703317, 0.4376866, 1.991001, 0, 0, 1, 1, 1,
0.2725528, 0.5813254, 0.3241646, 1, 0, 0, 1, 1,
0.2729886, 0.1271409, 0.4831854, 1, 0, 0, 1, 1,
0.2732816, 0.452767, 0.07472959, 1, 0, 0, 1, 1,
0.274223, 0.6111427, 0.864669, 1, 0, 0, 1, 1,
0.2754936, -0.3931763, 2.787234, 1, 0, 0, 1, 1,
0.2760901, 0.09968115, 0.1342356, 0, 0, 0, 1, 1,
0.2764698, -2.389756, 3.968849, 0, 0, 0, 1, 1,
0.28526, -0.4465868, 4.778195, 0, 0, 0, 1, 1,
0.2866774, -0.08073875, 1.59022, 0, 0, 0, 1, 1,
0.2877518, 0.1271936, 0.955297, 0, 0, 0, 1, 1,
0.2917263, 1.616008, 1.031227, 0, 0, 0, 1, 1,
0.2938907, 1.057171, 1.086964, 0, 0, 0, 1, 1,
0.2971815, 0.2383564, 1.057934, 1, 1, 1, 1, 1,
0.2979918, 0.2340762, -0.2006177, 1, 1, 1, 1, 1,
0.2994253, -0.01795887, 1.326761, 1, 1, 1, 1, 1,
0.299509, -0.6478933, 2.441862, 1, 1, 1, 1, 1,
0.3000162, 1.390156, 0.839298, 1, 1, 1, 1, 1,
0.3025543, 0.8367548, 1.712364, 1, 1, 1, 1, 1,
0.3048308, 0.005671273, 1.849193, 1, 1, 1, 1, 1,
0.3121432, -0.5679012, 1.857595, 1, 1, 1, 1, 1,
0.312269, -0.1620231, 0.4337679, 1, 1, 1, 1, 1,
0.3125021, -1.562499, 1.825378, 1, 1, 1, 1, 1,
0.31388, 0.5556258, 0.7504901, 1, 1, 1, 1, 1,
0.3174874, -1.751091, 2.176777, 1, 1, 1, 1, 1,
0.3191439, -0.03473892, 0.8819665, 1, 1, 1, 1, 1,
0.3210044, 0.7056734, 0.2719927, 1, 1, 1, 1, 1,
0.3286859, -1.002498, 2.774866, 1, 1, 1, 1, 1,
0.330624, -1.647342, 2.668909, 0, 0, 1, 1, 1,
0.3394471, -0.3514601, 1.338067, 1, 0, 0, 1, 1,
0.3396367, -0.5096506, 1.927316, 1, 0, 0, 1, 1,
0.3400956, 0.6410148, 0.1710607, 1, 0, 0, 1, 1,
0.3402406, 1.114679, -0.5761207, 1, 0, 0, 1, 1,
0.3422061, 1.176274, 1.664164, 1, 0, 0, 1, 1,
0.3432396, 0.3396893, -0.4966309, 0, 0, 0, 1, 1,
0.3455746, -0.5502948, 2.394703, 0, 0, 0, 1, 1,
0.3459313, -2.200142, 4.383867, 0, 0, 0, 1, 1,
0.346588, -0.9572443, 1.729363, 0, 0, 0, 1, 1,
0.349272, 0.9215651, -0.8820134, 0, 0, 0, 1, 1,
0.354228, 0.8955999, 0.2261333, 0, 0, 0, 1, 1,
0.3576455, -0.7672474, 2.213493, 0, 0, 0, 1, 1,
0.3652427, 0.1613234, -2.17241, 1, 1, 1, 1, 1,
0.3657992, 1.380825, -0.1822635, 1, 1, 1, 1, 1,
0.368768, 0.05834598, 0.8549234, 1, 1, 1, 1, 1,
0.3751436, -0.3875527, 2.387573, 1, 1, 1, 1, 1,
0.380415, -0.01162299, 3.110058, 1, 1, 1, 1, 1,
0.3825093, -0.8392673, 3.72328, 1, 1, 1, 1, 1,
0.3833566, 1.084529, 1.169216, 1, 1, 1, 1, 1,
0.3876497, 0.5392429, 0.957402, 1, 1, 1, 1, 1,
0.3927214, -0.348244, 3.143924, 1, 1, 1, 1, 1,
0.3993009, -0.7194121, 4.256982, 1, 1, 1, 1, 1,
0.4049038, -0.2056618, 1.053781, 1, 1, 1, 1, 1,
0.4070337, 0.9770785, -1.133215, 1, 1, 1, 1, 1,
0.408279, -0.3002226, 2.416241, 1, 1, 1, 1, 1,
0.4091417, 0.2738163, 0.1484637, 1, 1, 1, 1, 1,
0.4146163, -2.032944, 3.126391, 1, 1, 1, 1, 1,
0.426291, 0.7100134, 1.389263, 0, 0, 1, 1, 1,
0.4279833, 2.810011, 0.2619295, 1, 0, 0, 1, 1,
0.4284095, 0.08318312, 0.5812031, 1, 0, 0, 1, 1,
0.4310507, -0.7499002, 4.251163, 1, 0, 0, 1, 1,
0.4329771, 1.156613, 1.569083, 1, 0, 0, 1, 1,
0.4379214, -0.377362, 2.516787, 1, 0, 0, 1, 1,
0.4396244, 1.351945, -1.556513, 0, 0, 0, 1, 1,
0.4405177, 1.450895, 1.217898, 0, 0, 0, 1, 1,
0.453613, -0.9293783, 1.365004, 0, 0, 0, 1, 1,
0.4565899, 1.318315, -0.2479707, 0, 0, 0, 1, 1,
0.458311, 1.160424, 0.3573163, 0, 0, 0, 1, 1,
0.4598727, -0.2452656, 2.457575, 0, 0, 0, 1, 1,
0.4685198, 0.1589266, 0.3716057, 0, 0, 0, 1, 1,
0.4701649, -0.4791859, 1.955806, 1, 1, 1, 1, 1,
0.4735165, -0.9713202, 3.863638, 1, 1, 1, 1, 1,
0.4741679, -0.9804586, 3.284457, 1, 1, 1, 1, 1,
0.4790251, 2.375009, 1.210784, 1, 1, 1, 1, 1,
0.4798726, 0.2911093, 0.1371493, 1, 1, 1, 1, 1,
0.4873151, -1.2321, 2.499055, 1, 1, 1, 1, 1,
0.4876907, -0.1361102, 1.837139, 1, 1, 1, 1, 1,
0.4891424, -0.939859, 2.347401, 1, 1, 1, 1, 1,
0.4891773, 0.5942847, 0.6467342, 1, 1, 1, 1, 1,
0.4898083, 1.360194, -1.488693, 1, 1, 1, 1, 1,
0.4922268, -0.6814021, 1.887051, 1, 1, 1, 1, 1,
0.4924035, 0.7277278, 1.889868, 1, 1, 1, 1, 1,
0.4946159, 0.4268635, 0.9023969, 1, 1, 1, 1, 1,
0.4956639, 2.564509, -0.1769781, 1, 1, 1, 1, 1,
0.4960309, 1.063367, -0.07373669, 1, 1, 1, 1, 1,
0.500911, 1.384694, 0.943023, 0, 0, 1, 1, 1,
0.5021973, 0.2054947, 2.828802, 1, 0, 0, 1, 1,
0.5065659, 0.1240298, 0.856029, 1, 0, 0, 1, 1,
0.5067793, 2.257764, 1.00748, 1, 0, 0, 1, 1,
0.5080401, 2.390827, -0.7946093, 1, 0, 0, 1, 1,
0.5122804, -1.075653, 3.884123, 1, 0, 0, 1, 1,
0.512584, 2.24411, -0.01374471, 0, 0, 0, 1, 1,
0.5135033, -0.6316569, 1.724476, 0, 0, 0, 1, 1,
0.5163283, -1.198979, 4.675973, 0, 0, 0, 1, 1,
0.520489, -1.048873, 2.55673, 0, 0, 0, 1, 1,
0.5208131, -0.7034245, 3.146243, 0, 0, 0, 1, 1,
0.5230215, 0.714141, 0.6243222, 0, 0, 0, 1, 1,
0.5240964, -1.449677, 3.041668, 0, 0, 0, 1, 1,
0.5274041, 0.1251459, 1.911641, 1, 1, 1, 1, 1,
0.5329608, -0.2461133, 1.744224, 1, 1, 1, 1, 1,
0.5346859, 1.369991, 0.9285041, 1, 1, 1, 1, 1,
0.5386696, 0.1046447, 1.248975, 1, 1, 1, 1, 1,
0.5390685, 0.6553057, -1.021574, 1, 1, 1, 1, 1,
0.5391014, 0.3525302, 1.062088, 1, 1, 1, 1, 1,
0.5406213, 0.4760576, 0.5988026, 1, 1, 1, 1, 1,
0.5446104, 0.3345564, 0.7878568, 1, 1, 1, 1, 1,
0.5479946, -1.059513, 3.012011, 1, 1, 1, 1, 1,
0.5496508, 0.9624242, 1.826652, 1, 1, 1, 1, 1,
0.5569094, -1.303659, 1.991973, 1, 1, 1, 1, 1,
0.5613926, 0.2605208, 0.138242, 1, 1, 1, 1, 1,
0.5638831, -0.3036501, 2.165276, 1, 1, 1, 1, 1,
0.5669981, 2.069212, 1.928993, 1, 1, 1, 1, 1,
0.5714272, 0.4336307, 1.873966, 1, 1, 1, 1, 1,
0.5739486, -0.4829767, 0.657434, 0, 0, 1, 1, 1,
0.574519, 2.133453, 1.483532, 1, 0, 0, 1, 1,
0.5749941, 0.168353, 1.035444, 1, 0, 0, 1, 1,
0.5756614, 0.4816239, 0.1317548, 1, 0, 0, 1, 1,
0.5759587, -0.9149428, 3.155003, 1, 0, 0, 1, 1,
0.5787264, -0.6804822, 3.216487, 1, 0, 0, 1, 1,
0.5815341, -2.050503, 2.471488, 0, 0, 0, 1, 1,
0.5853348, -0.3880999, 2.808763, 0, 0, 0, 1, 1,
0.5862588, -1.56377, 2.677849, 0, 0, 0, 1, 1,
0.5873111, 0.6201039, 0.7432636, 0, 0, 0, 1, 1,
0.5926192, -0.6780885, 3.228325, 0, 0, 0, 1, 1,
0.59316, -1.603671, 2.635345, 0, 0, 0, 1, 1,
0.5962269, 0.6628543, 0.4400015, 0, 0, 0, 1, 1,
0.5962644, -0.4285153, 2.366004, 1, 1, 1, 1, 1,
0.6006603, 0.7585918, -0.2524564, 1, 1, 1, 1, 1,
0.6037664, -1.067451, 2.050096, 1, 1, 1, 1, 1,
0.6038728, -1.232991, 2.301584, 1, 1, 1, 1, 1,
0.6103515, -0.1711848, 2.609058, 1, 1, 1, 1, 1,
0.6133846, 0.6518968, 1.235407, 1, 1, 1, 1, 1,
0.6175763, -0.2241702, 1.659666, 1, 1, 1, 1, 1,
0.6196467, -0.6408415, 2.979256, 1, 1, 1, 1, 1,
0.6206142, 0.07211244, 1.646777, 1, 1, 1, 1, 1,
0.6213712, -2.327398, 1.758669, 1, 1, 1, 1, 1,
0.6216151, 1.950694, 0.2817399, 1, 1, 1, 1, 1,
0.6228155, 0.7191359, 0.1261519, 1, 1, 1, 1, 1,
0.6245957, 0.6757159, 0.001696019, 1, 1, 1, 1, 1,
0.6261644, -0.3110626, 3.72066, 1, 1, 1, 1, 1,
0.6270931, -0.6516075, 2.742299, 1, 1, 1, 1, 1,
0.6292682, -0.02326123, 2.586185, 0, 0, 1, 1, 1,
0.6379386, -1.237743, 1.905734, 1, 0, 0, 1, 1,
0.6413785, -1.304841, 3.944614, 1, 0, 0, 1, 1,
0.653517, 0.4860949, 1.760268, 1, 0, 0, 1, 1,
0.6570842, -1.403557, 3.758616, 1, 0, 0, 1, 1,
0.6631604, -1.912626, 3.488711, 1, 0, 0, 1, 1,
0.6655753, 1.388125, -0.8283269, 0, 0, 0, 1, 1,
0.6713217, -1.835782, 4.123663, 0, 0, 0, 1, 1,
0.6718642, -0.07081493, 2.184273, 0, 0, 0, 1, 1,
0.6769869, 0.1067203, 1.740689, 0, 0, 0, 1, 1,
0.6815017, 0.2551288, 0.7494849, 0, 0, 0, 1, 1,
0.6832689, -0.9244193, 3.680304, 0, 0, 0, 1, 1,
0.6866527, -0.1014694, 0.8637162, 0, 0, 0, 1, 1,
0.6958297, 0.7530252, 0.1652705, 1, 1, 1, 1, 1,
0.7019555, 1.365368, -1.696133, 1, 1, 1, 1, 1,
0.7042866, -2.213354, 1.665524, 1, 1, 1, 1, 1,
0.7090706, -0.5095514, 2.114662, 1, 1, 1, 1, 1,
0.717024, 1.169007, -0.9717029, 1, 1, 1, 1, 1,
0.7267241, -1.064605, 1.341117, 1, 1, 1, 1, 1,
0.7268067, -0.2112985, 2.670731, 1, 1, 1, 1, 1,
0.7280899, -0.4020501, 1.972774, 1, 1, 1, 1, 1,
0.7328953, 0.03204739, 0.7613023, 1, 1, 1, 1, 1,
0.7405699, -0.06268506, 0.9291974, 1, 1, 1, 1, 1,
0.7451616, 0.1954672, 2.531816, 1, 1, 1, 1, 1,
0.7548813, -0.1754697, 1.35149, 1, 1, 1, 1, 1,
0.7549697, -0.5730798, 3.538012, 1, 1, 1, 1, 1,
0.7596343, 0.0566796, 1.648123, 1, 1, 1, 1, 1,
0.7671015, 0.396125, 2.48503, 1, 1, 1, 1, 1,
0.7680951, 1.248879, 0.09209931, 0, 0, 1, 1, 1,
0.7686782, -1.055095, 2.278658, 1, 0, 0, 1, 1,
0.7801282, 0.5720367, 1.946543, 1, 0, 0, 1, 1,
0.7844567, 0.02576281, 2.52358, 1, 0, 0, 1, 1,
0.7860909, -0.1950752, 1.566586, 1, 0, 0, 1, 1,
0.7980035, -0.9102654, 0.8218209, 1, 0, 0, 1, 1,
0.8000785, 0.12684, 1.318407, 0, 0, 0, 1, 1,
0.8003513, 0.8304814, 0.417082, 0, 0, 0, 1, 1,
0.8178017, -0.2952375, 3.168503, 0, 0, 0, 1, 1,
0.8214126, -0.0967834, 0.892748, 0, 0, 0, 1, 1,
0.8229253, -0.1528187, 3.482422, 0, 0, 0, 1, 1,
0.8241708, -0.3665487, 2.576417, 0, 0, 0, 1, 1,
0.844474, -0.08418154, 1.766527, 0, 0, 0, 1, 1,
0.8478367, -3.101766, 2.975774, 1, 1, 1, 1, 1,
0.8525499, -0.08889429, 2.023153, 1, 1, 1, 1, 1,
0.8536986, 0.4876738, 1.838183, 1, 1, 1, 1, 1,
0.8551106, -0.2537647, 1.46448, 1, 1, 1, 1, 1,
0.8667139, 0.7613357, 0.6563396, 1, 1, 1, 1, 1,
0.8674309, 0.007801024, 1.577901, 1, 1, 1, 1, 1,
0.8684096, -1.361887, 3.0454, 1, 1, 1, 1, 1,
0.8693626, 0.5850497, -0.04631599, 1, 1, 1, 1, 1,
0.8730696, -0.3874796, 1.403438, 1, 1, 1, 1, 1,
0.8749654, 0.5099254, 0.8987601, 1, 1, 1, 1, 1,
0.8765805, 0.8839123, 0.6203768, 1, 1, 1, 1, 1,
0.8773564, 0.7597816, 0.746072, 1, 1, 1, 1, 1,
0.8782049, -0.9606231, 3.319363, 1, 1, 1, 1, 1,
0.8802414, -0.2597193, 2.532721, 1, 1, 1, 1, 1,
0.8821892, 1.418857, -0.9106652, 1, 1, 1, 1, 1,
0.8845486, 1.683033, 1.443419, 0, 0, 1, 1, 1,
0.8869109, -0.08705177, 1.181963, 1, 0, 0, 1, 1,
0.8870652, 0.07391006, 1.330257, 1, 0, 0, 1, 1,
0.8947025, -1.156723, 5.665237, 1, 0, 0, 1, 1,
0.8996364, -0.2802602, 2.919618, 1, 0, 0, 1, 1,
0.9014559, 0.7708506, 0.7035522, 1, 0, 0, 1, 1,
0.9042845, 1.428571, 0.1824366, 0, 0, 0, 1, 1,
0.9074804, 0.2067351, 1.343714, 0, 0, 0, 1, 1,
0.9094952, 0.8013569, 1.575078, 0, 0, 0, 1, 1,
0.9141203, 0.3358569, -0.2512954, 0, 0, 0, 1, 1,
0.916747, 0.9655238, 1.551356, 0, 0, 0, 1, 1,
0.9177219, 1.282411, -0.8575918, 0, 0, 0, 1, 1,
0.9180781, 0.3413171, 2.108083, 0, 0, 0, 1, 1,
0.9228093, -0.6733274, 1.209618, 1, 1, 1, 1, 1,
0.9307814, 1.78313, 0.3591619, 1, 1, 1, 1, 1,
0.9334412, -0.9700861, 3.161517, 1, 1, 1, 1, 1,
0.9364936, -0.4216841, 0.8620176, 1, 1, 1, 1, 1,
0.9377265, 1.058089, 1.934135, 1, 1, 1, 1, 1,
0.9408695, -0.05218018, 2.474322, 1, 1, 1, 1, 1,
0.9444083, 1.797474, 2.017017, 1, 1, 1, 1, 1,
0.9507238, 0.764697, 0.6774821, 1, 1, 1, 1, 1,
0.9565479, 1.690187, 1.267023, 1, 1, 1, 1, 1,
0.9585237, 0.6887731, -0.1065526, 1, 1, 1, 1, 1,
0.9602442, -1.482043, 1.659468, 1, 1, 1, 1, 1,
0.9678706, -0.1644097, 0.6093606, 1, 1, 1, 1, 1,
0.9748964, 0.2090251, -0.2874773, 1, 1, 1, 1, 1,
0.987912, -0.2642785, 1.818185, 1, 1, 1, 1, 1,
0.9923764, 0.2274317, 1.809696, 1, 1, 1, 1, 1,
0.9990601, 0.8846718, -0.02441114, 0, 0, 1, 1, 1,
1.001718, 0.3952701, -1.151197, 1, 0, 0, 1, 1,
1.00326, 1.987185, 2.754464, 1, 0, 0, 1, 1,
1.003859, 0.9216823, 1.033831, 1, 0, 0, 1, 1,
1.005401, 0.7993019, 1.771916, 1, 0, 0, 1, 1,
1.006406, -0.4784971, 2.879756, 1, 0, 0, 1, 1,
1.01671, 0.3954628, 2.1135, 0, 0, 0, 1, 1,
1.019519, -0.9172163, 2.024606, 0, 0, 0, 1, 1,
1.030721, -0.7711843, 2.213439, 0, 0, 0, 1, 1,
1.031087, 1.568351, 0.1006797, 0, 0, 0, 1, 1,
1.031722, 1.333019, 1.451961, 0, 0, 0, 1, 1,
1.039226, 0.8100338, 1.486443, 0, 0, 0, 1, 1,
1.044177, -1.098056, 3.528696, 0, 0, 0, 1, 1,
1.048764, -0.2636229, -0.5929155, 1, 1, 1, 1, 1,
1.050581, -1.773359, 3.520429, 1, 1, 1, 1, 1,
1.062992, 0.1633713, 2.060709, 1, 1, 1, 1, 1,
1.066219, 1.100296, 2.033824, 1, 1, 1, 1, 1,
1.075045, -1.978455, 3.515781, 1, 1, 1, 1, 1,
1.083501, -0.473395, 2.586735, 1, 1, 1, 1, 1,
1.085518, 0.5138643, 2.212103, 1, 1, 1, 1, 1,
1.086093, 0.7548804, 0.9224571, 1, 1, 1, 1, 1,
1.090469, 0.1561503, 2.014243, 1, 1, 1, 1, 1,
1.111326, 1.022296, 0.6831068, 1, 1, 1, 1, 1,
1.130765, 0.2448538, 2.026194, 1, 1, 1, 1, 1,
1.131538, 0.4125163, 1.726252, 1, 1, 1, 1, 1,
1.133908, -0.1741156, 0.4032684, 1, 1, 1, 1, 1,
1.136119, -2.185171, 3.25347, 1, 1, 1, 1, 1,
1.144219, -1.62096, 3.434263, 1, 1, 1, 1, 1,
1.14579, 0.07042672, 1.380694, 0, 0, 1, 1, 1,
1.151818, -0.2117791, 2.607955, 1, 0, 0, 1, 1,
1.15481, -0.06746849, 1.433157, 1, 0, 0, 1, 1,
1.161118, 0.8118824, 1.815091, 1, 0, 0, 1, 1,
1.167578, 1.299415, 0.7884169, 1, 0, 0, 1, 1,
1.177972, 0.7385188, 0.8163739, 1, 0, 0, 1, 1,
1.179507, -0.407457, 1.327901, 0, 0, 0, 1, 1,
1.190815, -1.489744, 2.225758, 0, 0, 0, 1, 1,
1.196117, 0.6919955, 2.061467, 0, 0, 0, 1, 1,
1.205893, -1.152847, 0.6149985, 0, 0, 0, 1, 1,
1.207523, -1.912972, 3.331452, 0, 0, 0, 1, 1,
1.209211, -0.9835951, 2.102047, 0, 0, 0, 1, 1,
1.212218, -0.2367802, 0.3895071, 0, 0, 0, 1, 1,
1.227275, 0.2081176, 0.5191653, 1, 1, 1, 1, 1,
1.23974, -0.4030204, 3.566622, 1, 1, 1, 1, 1,
1.241233, 1.107816, -0.1191131, 1, 1, 1, 1, 1,
1.247256, 1.407902, 1.616248, 1, 1, 1, 1, 1,
1.253831, 0.9520739, 1.692966, 1, 1, 1, 1, 1,
1.254519, 0.1744772, 0.1310164, 1, 1, 1, 1, 1,
1.258574, -0.07693411, 1.174007, 1, 1, 1, 1, 1,
1.268422, -1.152153, 2.622282, 1, 1, 1, 1, 1,
1.272024, 0.2750088, 1.560787, 1, 1, 1, 1, 1,
1.275237, 0.6250463, -0.1056462, 1, 1, 1, 1, 1,
1.281722, 1.524997, -0.2651735, 1, 1, 1, 1, 1,
1.284681, -1.575888, 1.537388, 1, 1, 1, 1, 1,
1.287584, 1.205384, 1.873523, 1, 1, 1, 1, 1,
1.293735, -0.437712, 1.749339, 1, 1, 1, 1, 1,
1.295935, -0.06703413, 1.076208, 1, 1, 1, 1, 1,
1.29666, 0.8870168, 0.4929119, 0, 0, 1, 1, 1,
1.298341, -1.415553, 3.360733, 1, 0, 0, 1, 1,
1.312624, 0.09312765, -0.004035515, 1, 0, 0, 1, 1,
1.313562, 0.5321563, 1.301596, 1, 0, 0, 1, 1,
1.323011, -0.9551422, 2.475432, 1, 0, 0, 1, 1,
1.335137, -1.532331, 5.113206, 1, 0, 0, 1, 1,
1.339206, -0.07273328, 2.773572, 0, 0, 0, 1, 1,
1.33999, 0.343544, -0.06165496, 0, 0, 0, 1, 1,
1.340985, -2.989598, 0.9762424, 0, 0, 0, 1, 1,
1.3423, 1.47085, -0.5154206, 0, 0, 0, 1, 1,
1.348479, 1.688819, 0.8757992, 0, 0, 0, 1, 1,
1.350817, -0.3941948, 0.9318455, 0, 0, 0, 1, 1,
1.360722, 0.1818919, 1.249009, 0, 0, 0, 1, 1,
1.369916, -1.778167, 1.050789, 1, 1, 1, 1, 1,
1.370499, -1.613595, 1.025972, 1, 1, 1, 1, 1,
1.376364, 0.4388898, 1.345888, 1, 1, 1, 1, 1,
1.378678, 2.231923, 0.3395585, 1, 1, 1, 1, 1,
1.380375, -0.520673, 2.146401, 1, 1, 1, 1, 1,
1.380757, 1.514025, 0.6151319, 1, 1, 1, 1, 1,
1.401258, 0.1804636, 2.518766, 1, 1, 1, 1, 1,
1.412875, -1.331999, 3.500495, 1, 1, 1, 1, 1,
1.429972, 0.7873346, 0.6678296, 1, 1, 1, 1, 1,
1.432126, -1.032491, 2.844846, 1, 1, 1, 1, 1,
1.435989, -0.2812462, 1.21079, 1, 1, 1, 1, 1,
1.437268, 0.2133256, 1.353692, 1, 1, 1, 1, 1,
1.476215, 1.482332, -1.363533, 1, 1, 1, 1, 1,
1.484745, 0.6321293, 0.8341591, 1, 1, 1, 1, 1,
1.488624, -1.326541, 1.234838, 1, 1, 1, 1, 1,
1.495714, 0.193241, 1.440296, 0, 0, 1, 1, 1,
1.495716, -0.4877327, 1.600492, 1, 0, 0, 1, 1,
1.499436, -0.2499517, 0.2270037, 1, 0, 0, 1, 1,
1.512521, -0.8117192, 2.890721, 1, 0, 0, 1, 1,
1.517201, -1.058496, 1.044719, 1, 0, 0, 1, 1,
1.529478, 0.3285032, 3.131507, 1, 0, 0, 1, 1,
1.530549, -1.080736, 2.658382, 0, 0, 0, 1, 1,
1.532288, -0.9106083, 0.4698677, 0, 0, 0, 1, 1,
1.542258, 0.2646383, 1.936815, 0, 0, 0, 1, 1,
1.547581, -2.044539, 2.459248, 0, 0, 0, 1, 1,
1.56045, -2.061176, 2.642455, 0, 0, 0, 1, 1,
1.56048, 0.68404, 0.9988562, 0, 0, 0, 1, 1,
1.575832, 0.1599242, -0.4251371, 0, 0, 0, 1, 1,
1.585567, -0.5747545, 1.723103, 1, 1, 1, 1, 1,
1.602957, -1.311811, 1.871267, 1, 1, 1, 1, 1,
1.605114, 1.928842, 1.076119, 1, 1, 1, 1, 1,
1.625042, -0.2321245, 2.008443, 1, 1, 1, 1, 1,
1.62823, 0.2854057, 0.3918373, 1, 1, 1, 1, 1,
1.629253, -0.3127998, 3.39186, 1, 1, 1, 1, 1,
1.638012, -0.2885137, 0.47955, 1, 1, 1, 1, 1,
1.640645, -0.1546694, 1.916211, 1, 1, 1, 1, 1,
1.648416, -0.5284745, 2.561152, 1, 1, 1, 1, 1,
1.651134, 0.1544024, 3.310156, 1, 1, 1, 1, 1,
1.655395, -0.6243622, 0.9951422, 1, 1, 1, 1, 1,
1.660246, 1.747289, -0.1123898, 1, 1, 1, 1, 1,
1.671919, 0.3089635, 1.296333, 1, 1, 1, 1, 1,
1.685336, 0.139732, 0.6640294, 1, 1, 1, 1, 1,
1.691464, -0.1703441, 2.687488, 1, 1, 1, 1, 1,
1.72886, 1.308901, 0.4482798, 0, 0, 1, 1, 1,
1.744717, -1.107723, 3.274471, 1, 0, 0, 1, 1,
1.747795, -0.7938548, 2.277916, 1, 0, 0, 1, 1,
1.750119, -0.9618477, 2.689439, 1, 0, 0, 1, 1,
1.753715, -0.8236372, 4.162529, 1, 0, 0, 1, 1,
1.755775, -0.5934978, 0.612152, 1, 0, 0, 1, 1,
1.771974, 0.1993356, 1.559097, 0, 0, 0, 1, 1,
1.80955, 0.2709973, 2.175072, 0, 0, 0, 1, 1,
1.818252, 0.160781, 3.278753, 0, 0, 0, 1, 1,
1.83013, 1.679392, 0.4919911, 0, 0, 0, 1, 1,
1.83952, -0.5806497, 2.404717, 0, 0, 0, 1, 1,
1.848077, -0.7674237, 3.357194, 0, 0, 0, 1, 1,
1.849547, -1.186385, 2.015457, 0, 0, 0, 1, 1,
1.850097, -1.848476, 1.104416, 1, 1, 1, 1, 1,
1.857666, -0.6965722, 2.642468, 1, 1, 1, 1, 1,
1.858133, -1.46735, 1.689118, 1, 1, 1, 1, 1,
1.867098, -0.8200706, 1.431537, 1, 1, 1, 1, 1,
1.871866, 1.369847, 0.5350304, 1, 1, 1, 1, 1,
1.896797, 0.5121737, 3.631265, 1, 1, 1, 1, 1,
1.917127, -1.045786, 2.832924, 1, 1, 1, 1, 1,
1.921003, -1.133535, 1.512033, 1, 1, 1, 1, 1,
1.935436, 0.1819483, 2.794882, 1, 1, 1, 1, 1,
1.936127, 0.6492982, 2.365787, 1, 1, 1, 1, 1,
1.948829, 2.393714, 1.365114, 1, 1, 1, 1, 1,
1.961104, 1.558718, 0.4329835, 1, 1, 1, 1, 1,
1.975329, -0.6999255, 1.547366, 1, 1, 1, 1, 1,
1.98187, 0.7820869, -0.02988739, 1, 1, 1, 1, 1,
1.993498, -0.1113328, 0.4563728, 1, 1, 1, 1, 1,
2.060051, 0.9561952, 2.554467, 0, 0, 1, 1, 1,
2.072522, -1.435305, 3.195584, 1, 0, 0, 1, 1,
2.112129, 0.973312, 0.5789574, 1, 0, 0, 1, 1,
2.114772, -0.479172, 2.923488, 1, 0, 0, 1, 1,
2.144244, 0.1264183, 1.477992, 1, 0, 0, 1, 1,
2.145614, 0.7396732, -1.43899, 1, 0, 0, 1, 1,
2.15094, -0.4915173, 1.788341, 0, 0, 0, 1, 1,
2.188851, -1.387884, 2.894101, 0, 0, 0, 1, 1,
2.191974, 0.6931551, 1.167094, 0, 0, 0, 1, 1,
2.200125, -1.220414, 2.046598, 0, 0, 0, 1, 1,
2.208721, -0.2471908, 2.757622, 0, 0, 0, 1, 1,
2.250492, -0.1133726, 1.043553, 0, 0, 0, 1, 1,
2.280252, -0.6215564, 1.020084, 0, 0, 0, 1, 1,
2.290072, -2.099143, 4.181489, 1, 1, 1, 1, 1,
2.293233, -0.1889477, 1.7652, 1, 1, 1, 1, 1,
2.345001, 0.3948342, 0.02147255, 1, 1, 1, 1, 1,
2.402284, 0.6357249, 0.5440587, 1, 1, 1, 1, 1,
2.611355, -0.7392783, 1.389039, 1, 1, 1, 1, 1,
2.633901, -0.9766453, 2.979337, 1, 1, 1, 1, 1,
2.71625, 1.118411, 2.169058, 1, 1, 1, 1, 1
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
var radius = 9.798842;
var distance = 34.41802;
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
mvMatrix.translate( 0.2224816, 0.2044747, 0.04272389 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.41802);
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
