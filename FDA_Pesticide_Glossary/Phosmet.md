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
-2.955981, -1.22295, -2.505735, 1, 0, 0, 1,
-2.793507, 0.06870841, -1.718512, 1, 0.007843138, 0, 1,
-2.634968, -0.5028544, -0.4600669, 1, 0.01176471, 0, 1,
-2.544824, 0.8769927, -1.360381, 1, 0.01960784, 0, 1,
-2.435376, 0.1380892, -0.1207532, 1, 0.02352941, 0, 1,
-2.423468, 1.833104, -0.8131003, 1, 0.03137255, 0, 1,
-2.3117, -0.4700303, -2.945989, 1, 0.03529412, 0, 1,
-2.253324, 0.3024476, -1.023176, 1, 0.04313726, 0, 1,
-2.209949, 0.08011122, -0.1764615, 1, 0.04705882, 0, 1,
-2.159783, 1.19514, -0.8922375, 1, 0.05490196, 0, 1,
-2.146178, -0.831756, -0.5064673, 1, 0.05882353, 0, 1,
-2.072436, -1.944252, -2.250979, 1, 0.06666667, 0, 1,
-2.038248, 0.3180183, -2.239269, 1, 0.07058824, 0, 1,
-2.031644, -0.6220077, -2.055154, 1, 0.07843138, 0, 1,
-2.017586, 1.284861, -1.219509, 1, 0.08235294, 0, 1,
-2.007129, -0.4181022, -2.016443, 1, 0.09019608, 0, 1,
-1.954201, 0.708581, 0.07439737, 1, 0.09411765, 0, 1,
-1.947635, 2.003096, -3.097447, 1, 0.1019608, 0, 1,
-1.933056, 2.466321, -1.318018, 1, 0.1098039, 0, 1,
-1.90923, -0.6179935, -2.983248, 1, 0.1137255, 0, 1,
-1.890201, -0.86019, -2.85508, 1, 0.1215686, 0, 1,
-1.888916, 0.4130378, -1.857983, 1, 0.1254902, 0, 1,
-1.86195, -0.9045167, -0.4261532, 1, 0.1333333, 0, 1,
-1.84191, 0.7612666, -0.830325, 1, 0.1372549, 0, 1,
-1.83412, 1.172756, -1.728415, 1, 0.145098, 0, 1,
-1.81327, 0.8978537, 1.065977, 1, 0.1490196, 0, 1,
-1.805973, 1.231007, -2.616221, 1, 0.1568628, 0, 1,
-1.738959, 0.06397485, -0.6137815, 1, 0.1607843, 0, 1,
-1.727279, -1.403242, -0.8686879, 1, 0.1686275, 0, 1,
-1.699181, -0.2595813, -1.32065, 1, 0.172549, 0, 1,
-1.677885, 0.2031393, -2.729413, 1, 0.1803922, 0, 1,
-1.657915, 1.31271, 0.344033, 1, 0.1843137, 0, 1,
-1.643407, 0.2039073, -0.2629835, 1, 0.1921569, 0, 1,
-1.636307, 1.469319, -1.835182, 1, 0.1960784, 0, 1,
-1.623068, 0.190505, -1.308756, 1, 0.2039216, 0, 1,
-1.621391, 1.203885, -1.952902, 1, 0.2117647, 0, 1,
-1.611243, 0.07055485, -1.404165, 1, 0.2156863, 0, 1,
-1.605356, -1.062637, -2.803091, 1, 0.2235294, 0, 1,
-1.604604, -1.753454, -3.90851, 1, 0.227451, 0, 1,
-1.600417, -0.1397716, -2.21253, 1, 0.2352941, 0, 1,
-1.587507, 0.2758809, -0.7829615, 1, 0.2392157, 0, 1,
-1.586396, 1.180604, -0.1216596, 1, 0.2470588, 0, 1,
-1.585003, -0.6891468, -2.616691, 1, 0.2509804, 0, 1,
-1.583664, 0.1912351, -0.8941113, 1, 0.2588235, 0, 1,
-1.572259, 1.484195, -1.44817, 1, 0.2627451, 0, 1,
-1.568053, -0.4695005, -1.924814, 1, 0.2705882, 0, 1,
-1.549731, 0.6398169, -3.101827, 1, 0.2745098, 0, 1,
-1.549249, 0.4023545, -0.8812499, 1, 0.282353, 0, 1,
-1.54501, 0.02146995, -1.515319, 1, 0.2862745, 0, 1,
-1.536634, -0.6007222, -0.4415367, 1, 0.2941177, 0, 1,
-1.535479, 0.03871506, -0.5985019, 1, 0.3019608, 0, 1,
-1.524319, -0.2140164, -1.337449, 1, 0.3058824, 0, 1,
-1.518086, 0.8193242, -0.6893358, 1, 0.3137255, 0, 1,
-1.515581, 0.6388197, 1.226932, 1, 0.3176471, 0, 1,
-1.509718, -0.01250176, -0.5927145, 1, 0.3254902, 0, 1,
-1.500806, 0.006564363, -2.58044, 1, 0.3294118, 0, 1,
-1.496714, -1.296979, -3.331603, 1, 0.3372549, 0, 1,
-1.492765, -0.9567904, -3.18764, 1, 0.3411765, 0, 1,
-1.485108, 0.2464655, -2.102549, 1, 0.3490196, 0, 1,
-1.480613, 0.1954832, -1.795252, 1, 0.3529412, 0, 1,
-1.469575, -0.5590765, -3.024314, 1, 0.3607843, 0, 1,
-1.467983, -1.171648, -0.9250996, 1, 0.3647059, 0, 1,
-1.458554, 0.5398173, -3.414519, 1, 0.372549, 0, 1,
-1.447106, -0.9889458, -3.043771, 1, 0.3764706, 0, 1,
-1.442217, -0.9743026, -1.69942, 1, 0.3843137, 0, 1,
-1.439573, -1.107964, 0.586425, 1, 0.3882353, 0, 1,
-1.438874, 1.546314, -2.102426, 1, 0.3960784, 0, 1,
-1.438865, -0.9184738, -2.22211, 1, 0.4039216, 0, 1,
-1.433261, 0.5875438, -1.16398, 1, 0.4078431, 0, 1,
-1.428527, -1.085498, -2.611764, 1, 0.4156863, 0, 1,
-1.42693, 0.08966868, -3.087669, 1, 0.4196078, 0, 1,
-1.419996, -0.07611927, -2.212955, 1, 0.427451, 0, 1,
-1.412684, 0.09499291, -0.318614, 1, 0.4313726, 0, 1,
-1.410098, 1.294191, -1.604098, 1, 0.4392157, 0, 1,
-1.396992, -0.8790256, -3.413247, 1, 0.4431373, 0, 1,
-1.378392, -0.1428675, -4.185218, 1, 0.4509804, 0, 1,
-1.377099, -1.343006, -2.6487, 1, 0.454902, 0, 1,
-1.374443, -0.4660993, -2.51862, 1, 0.4627451, 0, 1,
-1.370911, -0.004123004, -2.818846, 1, 0.4666667, 0, 1,
-1.370159, -1.295529, -0.9977253, 1, 0.4745098, 0, 1,
-1.368188, 0.1957207, -0.6225902, 1, 0.4784314, 0, 1,
-1.367059, 0.6488897, -1.750905, 1, 0.4862745, 0, 1,
-1.365421, 1.46246, -0.09694537, 1, 0.4901961, 0, 1,
-1.348619, -0.1501374, -1.57188, 1, 0.4980392, 0, 1,
-1.343229, 1.220724, -0.109474, 1, 0.5058824, 0, 1,
-1.342865, -1.204523, -2.471358, 1, 0.509804, 0, 1,
-1.34073, -0.1666734, -1.914184, 1, 0.5176471, 0, 1,
-1.331755, -0.3856902, -0.7415334, 1, 0.5215687, 0, 1,
-1.323071, -0.3035596, -2.240906, 1, 0.5294118, 0, 1,
-1.318468, -1.225992, -1.511419, 1, 0.5333334, 0, 1,
-1.315778, -0.02876655, -0.4756731, 1, 0.5411765, 0, 1,
-1.312658, 0.7908171, -1.284568, 1, 0.5450981, 0, 1,
-1.310086, 0.5814681, -0.001337529, 1, 0.5529412, 0, 1,
-1.303842, 0.5730197, -0.9495579, 1, 0.5568628, 0, 1,
-1.296615, -1.043316, -2.583296, 1, 0.5647059, 0, 1,
-1.278554, -0.955423, -2.040126, 1, 0.5686275, 0, 1,
-1.276485, -0.5106707, -1.302776, 1, 0.5764706, 0, 1,
-1.26589, -0.3897061, -2.610346, 1, 0.5803922, 0, 1,
-1.264959, -0.5463311, -2.122439, 1, 0.5882353, 0, 1,
-1.262229, 1.22995, -1.19849, 1, 0.5921569, 0, 1,
-1.256119, -1.863025, -1.853694, 1, 0.6, 0, 1,
-1.252476, -0.5904427, -1.517243, 1, 0.6078432, 0, 1,
-1.251011, 1.304498, -1.397656, 1, 0.6117647, 0, 1,
-1.246702, 0.3879805, -0.9904543, 1, 0.6196079, 0, 1,
-1.243534, 0.9722046, -1.601475, 1, 0.6235294, 0, 1,
-1.237922, 0.2628953, -0.705294, 1, 0.6313726, 0, 1,
-1.235257, 2.103203, -1.318554, 1, 0.6352941, 0, 1,
-1.230047, -0.5819082, -1.899013, 1, 0.6431373, 0, 1,
-1.229214, 0.3759743, 0.1149503, 1, 0.6470588, 0, 1,
-1.225726, 0.4001651, 1.538301, 1, 0.654902, 0, 1,
-1.223989, 0.02096746, -0.6935938, 1, 0.6588235, 0, 1,
-1.220329, 1.011788, -1.050447, 1, 0.6666667, 0, 1,
-1.218681, 0.1609228, -1.899569, 1, 0.6705883, 0, 1,
-1.216429, 0.9013792, 0.9793277, 1, 0.6784314, 0, 1,
-1.206542, 1.462528, 0.3226488, 1, 0.682353, 0, 1,
-1.18483, 1.656656, -0.8662025, 1, 0.6901961, 0, 1,
-1.182004, -0.03635338, -1.807688, 1, 0.6941177, 0, 1,
-1.171146, 0.09353995, 0.07437439, 1, 0.7019608, 0, 1,
-1.168826, 0.2483128, -1.803076, 1, 0.7098039, 0, 1,
-1.156853, -2.023949, -4.535047, 1, 0.7137255, 0, 1,
-1.155305, 1.069879, -0.3137192, 1, 0.7215686, 0, 1,
-1.147295, 0.650855, -1.55437, 1, 0.7254902, 0, 1,
-1.141212, -1.139815, -1.938045, 1, 0.7333333, 0, 1,
-1.141182, 0.5155396, -0.7234887, 1, 0.7372549, 0, 1,
-1.134061, 0.5657874, -1.192142, 1, 0.7450981, 0, 1,
-1.120559, -0.2880946, -1.573839, 1, 0.7490196, 0, 1,
-1.115929, 1.072648, 0.3248825, 1, 0.7568628, 0, 1,
-1.10817, 1.756675, -1.265852, 1, 0.7607843, 0, 1,
-1.107664, -0.3867191, -2.681439, 1, 0.7686275, 0, 1,
-1.10252, 0.01080747, -1.793798, 1, 0.772549, 0, 1,
-1.102028, 0.6410303, -1.216359, 1, 0.7803922, 0, 1,
-1.101452, 0.4759934, -0.3684292, 1, 0.7843137, 0, 1,
-1.092393, 1.390186, 1.593841, 1, 0.7921569, 0, 1,
-1.090275, 0.2421034, 0.3264874, 1, 0.7960784, 0, 1,
-1.069193, -0.4783842, -2.542642, 1, 0.8039216, 0, 1,
-1.062437, 0.07738674, -4.059332, 1, 0.8117647, 0, 1,
-1.061852, 0.1242663, 0.2573141, 1, 0.8156863, 0, 1,
-1.053719, -1.055673, -3.888766, 1, 0.8235294, 0, 1,
-1.051603, -0.8163742, -4.021815, 1, 0.827451, 0, 1,
-1.05158, 0.4168102, -2.25584, 1, 0.8352941, 0, 1,
-1.04445, -0.05187964, -1.086324, 1, 0.8392157, 0, 1,
-1.041676, -0.03672387, -0.6529193, 1, 0.8470588, 0, 1,
-1.03738, -1.332934, -2.016616, 1, 0.8509804, 0, 1,
-1.034459, -0.5741981, -3.830713, 1, 0.8588235, 0, 1,
-1.02524, 0.1336524, -0.8245406, 1, 0.8627451, 0, 1,
-1.017918, -0.3010682, -1.468783, 1, 0.8705882, 0, 1,
-1.016609, -0.7239295, -2.38223, 1, 0.8745098, 0, 1,
-1.013154, -1.033284, -1.476934, 1, 0.8823529, 0, 1,
-1.012577, 1.885914, -0.1800446, 1, 0.8862745, 0, 1,
-1.006814, -0.8999714, -2.612904, 1, 0.8941177, 0, 1,
-1.006176, -0.2881843, -1.966856, 1, 0.8980392, 0, 1,
-0.99218, 0.606251, -1.087439, 1, 0.9058824, 0, 1,
-0.9869151, -0.6737644, -3.267444, 1, 0.9137255, 0, 1,
-0.9859543, 0.6090644, -1.571506, 1, 0.9176471, 0, 1,
-0.9855007, -0.447749, -2.466689, 1, 0.9254902, 0, 1,
-0.9818721, 0.08687628, -1.303877, 1, 0.9294118, 0, 1,
-0.9772921, -0.2692858, -1.216622, 1, 0.9372549, 0, 1,
-0.9691522, 0.8181807, -1.859624, 1, 0.9411765, 0, 1,
-0.9610417, 0.4415928, -2.148513, 1, 0.9490196, 0, 1,
-0.9605926, 0.7253624, -1.676244, 1, 0.9529412, 0, 1,
-0.9579777, 1.228052, -1.709149, 1, 0.9607843, 0, 1,
-0.9519899, 0.04581787, -2.307025, 1, 0.9647059, 0, 1,
-0.9486296, 0.2344466, -2.098949, 1, 0.972549, 0, 1,
-0.9394169, 0.6372908, -1.791925, 1, 0.9764706, 0, 1,
-0.939252, -0.2831466, -2.031989, 1, 0.9843137, 0, 1,
-0.9371994, 0.1807879, -1.150434, 1, 0.9882353, 0, 1,
-0.9344889, -0.9107019, -3.647567, 1, 0.9960784, 0, 1,
-0.9319504, 0.8615056, -0.3493774, 0.9960784, 1, 0, 1,
-0.9287091, -1.568608, -2.205416, 0.9921569, 1, 0, 1,
-0.9246442, 2.162512, -0.471126, 0.9843137, 1, 0, 1,
-0.9232768, -1.249995, -1.834754, 0.9803922, 1, 0, 1,
-0.920644, -0.3428569, -3.085189, 0.972549, 1, 0, 1,
-0.9184329, -0.02406915, -2.836392, 0.9686275, 1, 0, 1,
-0.9178357, -0.7571217, -4.144281, 0.9607843, 1, 0, 1,
-0.9096053, -0.4094123, -2.562498, 0.9568627, 1, 0, 1,
-0.9071783, 0.6002549, 0.03406022, 0.9490196, 1, 0, 1,
-0.9040007, -0.3357655, -2.474755, 0.945098, 1, 0, 1,
-0.9004908, 0.6512147, -2.716357, 0.9372549, 1, 0, 1,
-0.9000345, -0.6594781, -1.708304, 0.9333333, 1, 0, 1,
-0.896152, 1.54068, -1.137019, 0.9254902, 1, 0, 1,
-0.8849069, -0.3538249, -3.533689, 0.9215686, 1, 0, 1,
-0.879343, 0.2015099, -1.193502, 0.9137255, 1, 0, 1,
-0.8774849, -1.971515, -1.733133, 0.9098039, 1, 0, 1,
-0.8729218, 0.6827489, -2.765121, 0.9019608, 1, 0, 1,
-0.8717867, -0.2296014, -3.125831, 0.8941177, 1, 0, 1,
-0.8710685, -0.0573724, -2.988163, 0.8901961, 1, 0, 1,
-0.8658246, 1.547274, -0.2230911, 0.8823529, 1, 0, 1,
-0.8657061, 1.239562, -0.7886655, 0.8784314, 1, 0, 1,
-0.8602036, 1.289354, -0.9910614, 0.8705882, 1, 0, 1,
-0.8599778, -1.157673, -2.108613, 0.8666667, 1, 0, 1,
-0.8595987, -0.1761547, -0.7684975, 0.8588235, 1, 0, 1,
-0.8517454, 0.2374915, 0.7454626, 0.854902, 1, 0, 1,
-0.8461382, 1.426086, -0.5602384, 0.8470588, 1, 0, 1,
-0.8433644, 0.8025229, -0.05446925, 0.8431373, 1, 0, 1,
-0.8423103, -2.019541, -1.283884, 0.8352941, 1, 0, 1,
-0.8405856, 1.289297, -1.180066, 0.8313726, 1, 0, 1,
-0.8393585, -0.3238945, -1.386756, 0.8235294, 1, 0, 1,
-0.8325152, -0.8721296, -3.379355, 0.8196079, 1, 0, 1,
-0.8267795, -1.059299, -1.429242, 0.8117647, 1, 0, 1,
-0.8193097, -0.5396087, -2.615046, 0.8078431, 1, 0, 1,
-0.8186241, 1.415951, 0.2809973, 0.8, 1, 0, 1,
-0.8047058, -0.3486777, -3.378726, 0.7921569, 1, 0, 1,
-0.7995332, -2.365524, -2.482852, 0.7882353, 1, 0, 1,
-0.7987671, -2.860613, -2.182294, 0.7803922, 1, 0, 1,
-0.7965395, -0.2219666, -1.722972, 0.7764706, 1, 0, 1,
-0.7944996, 0.4866086, -2.454726, 0.7686275, 1, 0, 1,
-0.7881598, 0.2847825, 0.5502826, 0.7647059, 1, 0, 1,
-0.7752676, 0.1563489, -0.9855902, 0.7568628, 1, 0, 1,
-0.7744663, 1.102128, -1.526214, 0.7529412, 1, 0, 1,
-0.7728875, -0.2807475, -1.736827, 0.7450981, 1, 0, 1,
-0.7713116, -0.1414407, -1.745824, 0.7411765, 1, 0, 1,
-0.7653995, 0.08664612, -4.338571, 0.7333333, 1, 0, 1,
-0.757255, -1.638723, -2.017645, 0.7294118, 1, 0, 1,
-0.7537082, 2.06843, 0.3476798, 0.7215686, 1, 0, 1,
-0.7536092, -1.595178, -2.337297, 0.7176471, 1, 0, 1,
-0.7514046, -1.048087, -2.439842, 0.7098039, 1, 0, 1,
-0.7504261, -0.6845281, -4.246467, 0.7058824, 1, 0, 1,
-0.7492594, 0.3024758, 0.1206501, 0.6980392, 1, 0, 1,
-0.743132, -0.3854243, -1.648358, 0.6901961, 1, 0, 1,
-0.7311488, -1.066581, -2.191079, 0.6862745, 1, 0, 1,
-0.7297696, 0.3921237, -0.5726659, 0.6784314, 1, 0, 1,
-0.7235518, -1.487697, -0.465754, 0.6745098, 1, 0, 1,
-0.7221447, 0.0956568, -0.8697776, 0.6666667, 1, 0, 1,
-0.7205804, -1.165933, -2.335168, 0.6627451, 1, 0, 1,
-0.7197922, -0.5569033, -2.179241, 0.654902, 1, 0, 1,
-0.7104446, -0.2245012, 0.1546483, 0.6509804, 1, 0, 1,
-0.7104174, 0.4999699, -1.640568, 0.6431373, 1, 0, 1,
-0.7070284, -2.161231, -2.249887, 0.6392157, 1, 0, 1,
-0.7063458, 1.480571, 0.5742366, 0.6313726, 1, 0, 1,
-0.7011776, -0.407289, -2.92081, 0.627451, 1, 0, 1,
-0.6930754, 0.604619, 0.4887612, 0.6196079, 1, 0, 1,
-0.6924884, 0.5087292, -0.4200431, 0.6156863, 1, 0, 1,
-0.6911486, -1.064603, -2.497726, 0.6078432, 1, 0, 1,
-0.6911425, -0.5161931, -1.80771, 0.6039216, 1, 0, 1,
-0.6801466, -0.1028505, -3.097025, 0.5960785, 1, 0, 1,
-0.6795289, -0.9042631, -4.03318, 0.5882353, 1, 0, 1,
-0.6787983, 0.1521774, -3.309238, 0.5843138, 1, 0, 1,
-0.678067, -0.2581193, -1.026386, 0.5764706, 1, 0, 1,
-0.6747515, 1.699132, -0.7246788, 0.572549, 1, 0, 1,
-0.6745656, 0.1782982, -1.601736, 0.5647059, 1, 0, 1,
-0.6676612, -0.003196385, -0.389621, 0.5607843, 1, 0, 1,
-0.6622816, 0.1769045, -2.66609, 0.5529412, 1, 0, 1,
-0.6599711, -1.178199, -2.723269, 0.5490196, 1, 0, 1,
-0.6540244, 1.992421, -1.767932, 0.5411765, 1, 0, 1,
-0.6489411, 0.1427056, 0.06176071, 0.5372549, 1, 0, 1,
-0.6343466, 0.3458874, -1.008552, 0.5294118, 1, 0, 1,
-0.6283395, -0.7393387, -3.340517, 0.5254902, 1, 0, 1,
-0.62638, 1.663759, -0.8262398, 0.5176471, 1, 0, 1,
-0.6261827, 0.09963503, -2.323666, 0.5137255, 1, 0, 1,
-0.6253076, -1.215358, -1.859684, 0.5058824, 1, 0, 1,
-0.616995, -1.587172, -3.408314, 0.5019608, 1, 0, 1,
-0.6157665, 0.1503874, -1.251056, 0.4941176, 1, 0, 1,
-0.6148037, -0.3521256, -3.403934, 0.4862745, 1, 0, 1,
-0.6136897, 0.6406466, -1.623265, 0.4823529, 1, 0, 1,
-0.6117989, 1.180644, 0.5013242, 0.4745098, 1, 0, 1,
-0.6104413, -0.7143648, -3.765132, 0.4705882, 1, 0, 1,
-0.6050204, -1.371794, -2.210489, 0.4627451, 1, 0, 1,
-0.6037208, 1.83997, 0.7818484, 0.4588235, 1, 0, 1,
-0.6022289, 0.8151707, 0.4670686, 0.4509804, 1, 0, 1,
-0.600304, -0.5123872, -3.597073, 0.4470588, 1, 0, 1,
-0.5959707, 0.3940654, 0.1690664, 0.4392157, 1, 0, 1,
-0.5951496, -1.930242, -2.476443, 0.4352941, 1, 0, 1,
-0.5947874, -0.4111925, -3.800282, 0.427451, 1, 0, 1,
-0.5931784, 0.4324225, 0.9562582, 0.4235294, 1, 0, 1,
-0.5918037, -0.6626626, -3.244104, 0.4156863, 1, 0, 1,
-0.5888466, 1.131404, -1.59883, 0.4117647, 1, 0, 1,
-0.5864552, 0.1706605, -3.054225, 0.4039216, 1, 0, 1,
-0.5849921, 0.9603161, -1.916715, 0.3960784, 1, 0, 1,
-0.5841761, -0.8545156, -3.108675, 0.3921569, 1, 0, 1,
-0.5768611, 1.375522, -0.7141638, 0.3843137, 1, 0, 1,
-0.5763976, -0.3898864, -2.269505, 0.3803922, 1, 0, 1,
-0.5761561, -1.435135, -1.948509, 0.372549, 1, 0, 1,
-0.5740619, 1.819674, 0.03423632, 0.3686275, 1, 0, 1,
-0.5739502, 0.8481884, -0.2817586, 0.3607843, 1, 0, 1,
-0.5722108, 0.5012703, -2.363009, 0.3568628, 1, 0, 1,
-0.5720066, -0.7912974, -4.189133, 0.3490196, 1, 0, 1,
-0.5698202, 0.04894181, -0.8342999, 0.345098, 1, 0, 1,
-0.5683642, -0.3059673, -1.840905, 0.3372549, 1, 0, 1,
-0.564898, 0.7262792, 0.3618753, 0.3333333, 1, 0, 1,
-0.5632116, -0.7370528, -4.443482, 0.3254902, 1, 0, 1,
-0.5626564, -0.4560193, -1.424284, 0.3215686, 1, 0, 1,
-0.5577977, -0.0726477, -0.9759417, 0.3137255, 1, 0, 1,
-0.5500568, -0.6606788, -3.665792, 0.3098039, 1, 0, 1,
-0.5466644, 0.00207772, -1.656765, 0.3019608, 1, 0, 1,
-0.5435684, -0.2260386, -2.834028, 0.2941177, 1, 0, 1,
-0.5420818, -1.133028, -2.472914, 0.2901961, 1, 0, 1,
-0.5390268, -0.9618865, -1.846426, 0.282353, 1, 0, 1,
-0.535951, -0.2629755, -2.504101, 0.2784314, 1, 0, 1,
-0.5356838, -1.620717, -5.518809, 0.2705882, 1, 0, 1,
-0.5325909, 0.6079007, -1.571053, 0.2666667, 1, 0, 1,
-0.5311608, 2.29029, 1.208196, 0.2588235, 1, 0, 1,
-0.5266371, -0.8619, -2.999801, 0.254902, 1, 0, 1,
-0.5189955, -0.4895598, -1.831242, 0.2470588, 1, 0, 1,
-0.5185633, 0.8385375, -1.346251, 0.2431373, 1, 0, 1,
-0.5161271, 0.9772893, 0.2922022, 0.2352941, 1, 0, 1,
-0.5139336, -0.1666794, -1.832444, 0.2313726, 1, 0, 1,
-0.5115066, 0.3782961, 0.1169, 0.2235294, 1, 0, 1,
-0.4977597, 0.5113689, -0.3708661, 0.2196078, 1, 0, 1,
-0.4976845, 1.458776, 0.33274, 0.2117647, 1, 0, 1,
-0.4976177, -0.3194443, -4.029768, 0.2078431, 1, 0, 1,
-0.4971417, 1.423405, 1.149348, 0.2, 1, 0, 1,
-0.496774, -0.2918882, -1.015815, 0.1921569, 1, 0, 1,
-0.4919915, -0.5110089, -2.24341, 0.1882353, 1, 0, 1,
-0.4919431, -0.6793307, -3.559609, 0.1803922, 1, 0, 1,
-0.4900919, -1.6454, -2.242069, 0.1764706, 1, 0, 1,
-0.4873219, 0.2489698, -0.8275777, 0.1686275, 1, 0, 1,
-0.4831355, -1.14998, -1.670287, 0.1647059, 1, 0, 1,
-0.4780644, -1.933832, -3.300181, 0.1568628, 1, 0, 1,
-0.4775267, -1.591317, -4.613074, 0.1529412, 1, 0, 1,
-0.4755672, 0.7412248, -1.314425, 0.145098, 1, 0, 1,
-0.474397, 0.03533474, -2.035819, 0.1411765, 1, 0, 1,
-0.4730221, -1.031936, -4.715882, 0.1333333, 1, 0, 1,
-0.4727278, -0.2891736, -0.9223521, 0.1294118, 1, 0, 1,
-0.4631513, -0.5904146, -2.898895, 0.1215686, 1, 0, 1,
-0.4592942, -0.7853751, -3.731511, 0.1176471, 1, 0, 1,
-0.4589717, 2.156461, -0.1668689, 0.1098039, 1, 0, 1,
-0.4567491, 0.6657371, -0.3080856, 0.1058824, 1, 0, 1,
-0.4554489, 1.282925, 0.3605814, 0.09803922, 1, 0, 1,
-0.4552589, -0.8422841, -1.96075, 0.09019608, 1, 0, 1,
-0.4501036, 1.068448, -1.060337, 0.08627451, 1, 0, 1,
-0.4479809, -0.5648208, -1.705811, 0.07843138, 1, 0, 1,
-0.4477429, -0.9147996, -1.856416, 0.07450981, 1, 0, 1,
-0.4460166, -0.9753728, -2.020143, 0.06666667, 1, 0, 1,
-0.4446316, 0.4770585, -0.8595304, 0.0627451, 1, 0, 1,
-0.440857, -1.864994, -3.0652, 0.05490196, 1, 0, 1,
-0.4288943, -1.235038, -4.181996, 0.05098039, 1, 0, 1,
-0.4272656, -0.4022551, -3.244782, 0.04313726, 1, 0, 1,
-0.4224495, -0.1609037, -2.582028, 0.03921569, 1, 0, 1,
-0.4221565, -1.760666, -2.094632, 0.03137255, 1, 0, 1,
-0.4185712, 0.08263442, -1.310471, 0.02745098, 1, 0, 1,
-0.418268, -1.270303, -3.139143, 0.01960784, 1, 0, 1,
-0.4113493, -0.1989575, -1.344408, 0.01568628, 1, 0, 1,
-0.4076025, -0.23102, -2.930074, 0.007843138, 1, 0, 1,
-0.406617, -1.422071, -4.018399, 0.003921569, 1, 0, 1,
-0.4047635, 0.7223255, -1.309904, 0, 1, 0.003921569, 1,
-0.4013406, -0.4282264, -1.562376, 0, 1, 0.01176471, 1,
-0.4011007, -0.4695151, -1.46437, 0, 1, 0.01568628, 1,
-0.4008194, -0.4549075, -3.952356, 0, 1, 0.02352941, 1,
-0.3951743, 0.1674164, 0.227111, 0, 1, 0.02745098, 1,
-0.3897047, 1.151731, -1.322222, 0, 1, 0.03529412, 1,
-0.3851107, -1.185915, -3.56861, 0, 1, 0.03921569, 1,
-0.3776692, -0.7783478, -2.638739, 0, 1, 0.04705882, 1,
-0.3733892, 0.1682711, 0.09841075, 0, 1, 0.05098039, 1,
-0.3731298, 0.2315877, -0.5920048, 0, 1, 0.05882353, 1,
-0.3663471, -0.2262156, -2.685985, 0, 1, 0.0627451, 1,
-0.3638021, -0.1917221, -3.972726, 0, 1, 0.07058824, 1,
-0.3628291, -2.293878, -4.12116, 0, 1, 0.07450981, 1,
-0.3612646, -0.2954472, -0.2447409, 0, 1, 0.08235294, 1,
-0.3590945, 1.008827, -0.8922707, 0, 1, 0.08627451, 1,
-0.3491832, -0.519442, -2.308602, 0, 1, 0.09411765, 1,
-0.3486744, 0.4317764, -1.424969, 0, 1, 0.1019608, 1,
-0.3470081, -0.003201928, -1.951488, 0, 1, 0.1058824, 1,
-0.346599, -1.830764, -4.896314, 0, 1, 0.1137255, 1,
-0.3449315, 1.654158, 0.1202952, 0, 1, 0.1176471, 1,
-0.34419, -1.388068, -1.746735, 0, 1, 0.1254902, 1,
-0.3414105, -0.2160372, -1.753029, 0, 1, 0.1294118, 1,
-0.3406096, 0.4561056, 0.08741048, 0, 1, 0.1372549, 1,
-0.3401569, 0.11306, -1.448942, 0, 1, 0.1411765, 1,
-0.3389554, -0.3143091, -1.249652, 0, 1, 0.1490196, 1,
-0.3387285, -0.0002435096, -2.331222, 0, 1, 0.1529412, 1,
-0.3364665, -0.8103961, -2.959479, 0, 1, 0.1607843, 1,
-0.3341416, -0.5059835, -1.503266, 0, 1, 0.1647059, 1,
-0.3296858, 1.118286, 1.492083, 0, 1, 0.172549, 1,
-0.3279878, 0.1425655, -2.055918, 0, 1, 0.1764706, 1,
-0.3276306, 0.5109471, 1.095574, 0, 1, 0.1843137, 1,
-0.3273599, 0.1324752, -1.734768, 0, 1, 0.1882353, 1,
-0.3264991, 0.04081209, -0.8405126, 0, 1, 0.1960784, 1,
-0.3252754, -1.19126, -2.674266, 0, 1, 0.2039216, 1,
-0.3247293, 0.525458, -0.6596794, 0, 1, 0.2078431, 1,
-0.3213288, 0.3591914, -1.554753, 0, 1, 0.2156863, 1,
-0.3174323, -0.3189421, -3.008764, 0, 1, 0.2196078, 1,
-0.3108826, 1.075107, 0.7816451, 0, 1, 0.227451, 1,
-0.3054302, 0.4369109, 2.33145, 0, 1, 0.2313726, 1,
-0.3033657, -0.8422199, -1.297117, 0, 1, 0.2392157, 1,
-0.302742, 2.129381, 0.6894369, 0, 1, 0.2431373, 1,
-0.2991027, -0.3041468, -5.004397, 0, 1, 0.2509804, 1,
-0.2989137, 0.1593693, -1.124043, 0, 1, 0.254902, 1,
-0.2959095, -1.129568, -2.852058, 0, 1, 0.2627451, 1,
-0.295829, -1.514717, -2.615013, 0, 1, 0.2666667, 1,
-0.2957532, 0.1809458, -0.4677174, 0, 1, 0.2745098, 1,
-0.2948361, 0.5284396, -2.153688, 0, 1, 0.2784314, 1,
-0.2940274, 0.1938058, -2.199494, 0, 1, 0.2862745, 1,
-0.2937035, -0.4103419, -2.435335, 0, 1, 0.2901961, 1,
-0.2813705, -1.67455, -1.297773, 0, 1, 0.2980392, 1,
-0.2810509, -0.1693923, 0.6408585, 0, 1, 0.3058824, 1,
-0.2778616, -0.4266392, -3.335938, 0, 1, 0.3098039, 1,
-0.2733054, 1.306232, -1.339995, 0, 1, 0.3176471, 1,
-0.2723631, 0.8059877, 0.0314736, 0, 1, 0.3215686, 1,
-0.2714587, -0.2704743, -1.219594, 0, 1, 0.3294118, 1,
-0.2678489, 1.204633, -1.040742, 0, 1, 0.3333333, 1,
-0.267785, -0.2026057, -2.740381, 0, 1, 0.3411765, 1,
-0.2673037, -0.2377071, -0.3724813, 0, 1, 0.345098, 1,
-0.2635537, 0.4914674, -0.5053974, 0, 1, 0.3529412, 1,
-0.2619832, -0.7209694, -0.08291087, 0, 1, 0.3568628, 1,
-0.2579974, -0.4028996, -3.935542, 0, 1, 0.3647059, 1,
-0.2555325, 0.5175396, 0.1226702, 0, 1, 0.3686275, 1,
-0.2548219, -0.6220423, -1.709268, 0, 1, 0.3764706, 1,
-0.253234, -0.2366169, -3.478093, 0, 1, 0.3803922, 1,
-0.2523029, 0.5324892, -0.3594449, 0, 1, 0.3882353, 1,
-0.2508743, 0.7282762, -0.3659563, 0, 1, 0.3921569, 1,
-0.2491674, 0.4689527, -0.1460799, 0, 1, 0.4, 1,
-0.2484784, 0.032043, -2.076272, 0, 1, 0.4078431, 1,
-0.2481074, 0.3370495, -1.646185, 0, 1, 0.4117647, 1,
-0.246647, 0.7695566, -0.4569272, 0, 1, 0.4196078, 1,
-0.2460215, -0.463331, -3.866631, 0, 1, 0.4235294, 1,
-0.243972, 1.259917, -1.165327, 0, 1, 0.4313726, 1,
-0.2434473, 1.4744, -0.970444, 0, 1, 0.4352941, 1,
-0.2419572, 1.043411, -0.5712714, 0, 1, 0.4431373, 1,
-0.2419138, 0.2390891, -2.105123, 0, 1, 0.4470588, 1,
-0.2402362, 0.2529152, -2.057329, 0, 1, 0.454902, 1,
-0.2400174, 0.4062215, 0.4838279, 0, 1, 0.4588235, 1,
-0.2370083, 0.5646934, 0.53369, 0, 1, 0.4666667, 1,
-0.2333115, 1.816382, -1.300647, 0, 1, 0.4705882, 1,
-0.2331198, -0.8834779, -2.562048, 0, 1, 0.4784314, 1,
-0.2326377, -2.093233, -2.524839, 0, 1, 0.4823529, 1,
-0.23258, 0.65126, 0.7203589, 0, 1, 0.4901961, 1,
-0.2299606, -0.8562354, -2.863074, 0, 1, 0.4941176, 1,
-0.2264617, -0.07185677, -1.255335, 0, 1, 0.5019608, 1,
-0.2237786, 0.1416482, -3.295717, 0, 1, 0.509804, 1,
-0.2215643, 2.443166, 0.8471499, 0, 1, 0.5137255, 1,
-0.2176762, -0.6217753, -4.139421, 0, 1, 0.5215687, 1,
-0.2148821, -0.4724502, -3.664142, 0, 1, 0.5254902, 1,
-0.2124026, -0.621759, -4.453081, 0, 1, 0.5333334, 1,
-0.208735, 1.21817, 1.799024, 0, 1, 0.5372549, 1,
-0.2016913, 2.517181, -0.3229323, 0, 1, 0.5450981, 1,
-0.1966439, -0.9395145, -1.784583, 0, 1, 0.5490196, 1,
-0.1961455, 0.2802253, -0.9906623, 0, 1, 0.5568628, 1,
-0.1868911, -1.702037, -2.470182, 0, 1, 0.5607843, 1,
-0.1861521, 1.211546, 1.000129, 0, 1, 0.5686275, 1,
-0.185714, 2.595557, -0.1424292, 0, 1, 0.572549, 1,
-0.1841094, -0.217892, -0.5832049, 0, 1, 0.5803922, 1,
-0.1758281, -1.205287, -4.045051, 0, 1, 0.5843138, 1,
-0.1723199, -0.03563913, -0.2094292, 0, 1, 0.5921569, 1,
-0.1684541, -0.3084647, -1.661863, 0, 1, 0.5960785, 1,
-0.1652887, 1.177177, 0.960295, 0, 1, 0.6039216, 1,
-0.1647562, 0.5253507, -0.1081776, 0, 1, 0.6117647, 1,
-0.1633683, -0.3806807, -1.459106, 0, 1, 0.6156863, 1,
-0.1629368, -0.1623181, -2.030975, 0, 1, 0.6235294, 1,
-0.1609554, 1.408428, -0.09671284, 0, 1, 0.627451, 1,
-0.1554328, -0.1352325, -2.687035, 0, 1, 0.6352941, 1,
-0.1546358, -1.329145, -1.57927, 0, 1, 0.6392157, 1,
-0.1531904, 0.03197553, -0.3989593, 0, 1, 0.6470588, 1,
-0.1507794, -0.02943898, -3.435789, 0, 1, 0.6509804, 1,
-0.1506201, 1.811502, 0.7149391, 0, 1, 0.6588235, 1,
-0.1476503, -0.9377206, -0.9678559, 0, 1, 0.6627451, 1,
-0.1399744, 0.7111915, -0.6039491, 0, 1, 0.6705883, 1,
-0.1390736, -1.017644, -2.271267, 0, 1, 0.6745098, 1,
-0.1385195, 1.310645, -0.787887, 0, 1, 0.682353, 1,
-0.1373775, 0.7474665, -0.3427438, 0, 1, 0.6862745, 1,
-0.1365176, -1.551061, -2.899141, 0, 1, 0.6941177, 1,
-0.1355031, 2.5007, -2.411321, 0, 1, 0.7019608, 1,
-0.1306105, -0.2259265, -3.345676, 0, 1, 0.7058824, 1,
-0.1303319, -0.6748205, -4.341269, 0, 1, 0.7137255, 1,
-0.1292971, 0.8165845, 0.6792557, 0, 1, 0.7176471, 1,
-0.1223705, -0.4943884, -0.7775689, 0, 1, 0.7254902, 1,
-0.1218744, -0.8052383, -1.966755, 0, 1, 0.7294118, 1,
-0.1203005, -0.9723855, -3.824421, 0, 1, 0.7372549, 1,
-0.1116587, -1.00589, -3.895484, 0, 1, 0.7411765, 1,
-0.1098051, -0.6249831, -2.936406, 0, 1, 0.7490196, 1,
-0.1072732, -1.516268, -3.506812, 0, 1, 0.7529412, 1,
-0.1043899, 0.2818797, -1.557596, 0, 1, 0.7607843, 1,
-0.1028791, 0.1487809, 0.3002605, 0, 1, 0.7647059, 1,
-0.09804442, 0.468252, -0.3042294, 0, 1, 0.772549, 1,
-0.08608951, 1.372665, 0.08087976, 0, 1, 0.7764706, 1,
-0.0826503, -1.313583, -4.698595, 0, 1, 0.7843137, 1,
-0.08225457, -1.709055, -2.523598, 0, 1, 0.7882353, 1,
-0.08207777, -1.152282, -3.818932, 0, 1, 0.7960784, 1,
-0.07642005, 0.8957092, 2.442452, 0, 1, 0.8039216, 1,
-0.07072357, -0.2063984, -3.625076, 0, 1, 0.8078431, 1,
-0.06299964, 0.8674079, 0.6640077, 0, 1, 0.8156863, 1,
-0.05960299, 0.6175045, 0.4090406, 0, 1, 0.8196079, 1,
-0.05897951, 1.04808, 0.1277952, 0, 1, 0.827451, 1,
-0.05181455, 0.08160514, -0.7766551, 0, 1, 0.8313726, 1,
-0.05027617, 1.196478, 0.8379815, 0, 1, 0.8392157, 1,
-0.04419369, 0.09686372, -1.495004, 0, 1, 0.8431373, 1,
-0.03594697, -0.02587781, -2.038269, 0, 1, 0.8509804, 1,
-0.03480097, 0.2408706, 0.9341187, 0, 1, 0.854902, 1,
-0.03178792, 1.342721, 0.2682305, 0, 1, 0.8627451, 1,
-0.03154945, 1.874331, 0.06633279, 0, 1, 0.8666667, 1,
-0.02975319, 0.578037, -1.330054, 0, 1, 0.8745098, 1,
-0.0266865, 0.6482167, 1.081435, 0, 1, 0.8784314, 1,
-0.026202, -0.3261079, -3.816563, 0, 1, 0.8862745, 1,
-0.02530625, 0.6801549, -0.8832108, 0, 1, 0.8901961, 1,
-0.0227684, -0.8982051, -3.728924, 0, 1, 0.8980392, 1,
-0.0155033, -1.046728, -1.539373, 0, 1, 0.9058824, 1,
-0.007978902, 0.06483021, -0.1831553, 0, 1, 0.9098039, 1,
-0.007866621, -0.02504787, -2.387854, 0, 1, 0.9176471, 1,
-0.002563021, 0.5353028, 0.5726063, 0, 1, 0.9215686, 1,
-0.001963106, -0.3269219, -2.934701, 0, 1, 0.9294118, 1,
0.0005149536, -0.5705485, 1.723637, 0, 1, 0.9333333, 1,
0.001082015, -0.7558929, 2.535399, 0, 1, 0.9411765, 1,
0.004013055, -0.9225702, 4.179262, 0, 1, 0.945098, 1,
0.004335554, 0.5282132, -2.00701, 0, 1, 0.9529412, 1,
0.00584372, 0.321924, -0.9847947, 0, 1, 0.9568627, 1,
0.01759543, -1.179926, 2.137293, 0, 1, 0.9647059, 1,
0.01906608, 1.346919, 0.348525, 0, 1, 0.9686275, 1,
0.02122021, -0.06887959, 3.021591, 0, 1, 0.9764706, 1,
0.02133528, 1.732989, -0.9380064, 0, 1, 0.9803922, 1,
0.02334963, -0.5853503, 2.730764, 0, 1, 0.9882353, 1,
0.0240634, 0.2614259, 0.01640628, 0, 1, 0.9921569, 1,
0.02666363, -0.2625285, 2.630252, 0, 1, 1, 1,
0.02723823, 0.8030556, 1.127201, 0, 0.9921569, 1, 1,
0.03219767, -0.5085229, 3.014394, 0, 0.9882353, 1, 1,
0.03430164, 0.04116861, 0.1667284, 0, 0.9803922, 1, 1,
0.03796908, 0.5364594, -0.5727648, 0, 0.9764706, 1, 1,
0.04002588, 1.147353, -0.4139827, 0, 0.9686275, 1, 1,
0.04390708, -0.6478418, 2.338057, 0, 0.9647059, 1, 1,
0.04662967, 2.444431, 0.7268703, 0, 0.9568627, 1, 1,
0.04694491, 2.067804, -0.5318022, 0, 0.9529412, 1, 1,
0.04720912, 0.08574466, 1.295865, 0, 0.945098, 1, 1,
0.04944415, 0.4593265, 0.6486037, 0, 0.9411765, 1, 1,
0.05736578, -0.6772037, 3.848351, 0, 0.9333333, 1, 1,
0.05836485, 0.774702, -0.7997684, 0, 0.9294118, 1, 1,
0.06157641, 0.5708545, 1.462337, 0, 0.9215686, 1, 1,
0.06504505, 0.057927, -1.089869, 0, 0.9176471, 1, 1,
0.06780768, -1.721699, 2.420036, 0, 0.9098039, 1, 1,
0.07289199, 0.1770944, -0.590894, 0, 0.9058824, 1, 1,
0.073034, 0.5969567, -0.7294924, 0, 0.8980392, 1, 1,
0.07561454, -0.2766676, 3.298857, 0, 0.8901961, 1, 1,
0.0778348, -1.550896, 4.440725, 0, 0.8862745, 1, 1,
0.08236264, 2.777048, 1.356854, 0, 0.8784314, 1, 1,
0.09561671, -0.6472892, 4.219061, 0, 0.8745098, 1, 1,
0.1017181, -0.4253964, 4.579823, 0, 0.8666667, 1, 1,
0.1018991, 0.7863073, 0.4269725, 0, 0.8627451, 1, 1,
0.1022951, -1.216426, 3.876614, 0, 0.854902, 1, 1,
0.1027013, -1.463073, 2.498752, 0, 0.8509804, 1, 1,
0.1031781, -0.7258094, 3.095046, 0, 0.8431373, 1, 1,
0.1063616, -0.5771821, 3.062777, 0, 0.8392157, 1, 1,
0.1064396, 1.222382, 0.6328131, 0, 0.8313726, 1, 1,
0.1118629, 2.164374, -1.610971, 0, 0.827451, 1, 1,
0.1150003, 0.2060823, -0.7444181, 0, 0.8196079, 1, 1,
0.1167105, -1.031485, 3.566307, 0, 0.8156863, 1, 1,
0.1181818, 0.9010509, -0.922036, 0, 0.8078431, 1, 1,
0.1267923, -0.7722134, 3.306704, 0, 0.8039216, 1, 1,
0.1281343, -0.5202593, 2.791756, 0, 0.7960784, 1, 1,
0.1292441, -1.613533, 2.635964, 0, 0.7882353, 1, 1,
0.130818, 1.812183, 2.898161, 0, 0.7843137, 1, 1,
0.1369621, 0.3448764, -0.7029518, 0, 0.7764706, 1, 1,
0.1418328, 0.2194694, 2.276376, 0, 0.772549, 1, 1,
0.1492364, 0.86959, -0.6941031, 0, 0.7647059, 1, 1,
0.1525955, -0.7537401, 1.991385, 0, 0.7607843, 1, 1,
0.1589753, 0.290712, 1.140441, 0, 0.7529412, 1, 1,
0.1592903, -1.250075, 2.42836, 0, 0.7490196, 1, 1,
0.1602569, -1.391459, 1.633877, 0, 0.7411765, 1, 1,
0.1609916, 1.509976, 0.6430097, 0, 0.7372549, 1, 1,
0.1646543, 0.215337, 0.04532171, 0, 0.7294118, 1, 1,
0.1649311, 0.2017496, 1.867201, 0, 0.7254902, 1, 1,
0.1671351, -0.2014994, 1.852862, 0, 0.7176471, 1, 1,
0.1674512, -2.156763, 3.312097, 0, 0.7137255, 1, 1,
0.1751576, 0.5706383, -0.1471862, 0, 0.7058824, 1, 1,
0.1782651, 0.4918439, 0.8033087, 0, 0.6980392, 1, 1,
0.1796909, -1.455353, 2.860982, 0, 0.6941177, 1, 1,
0.1804563, 1.29209, -0.8446799, 0, 0.6862745, 1, 1,
0.1837315, 0.2030421, 0.9450413, 0, 0.682353, 1, 1,
0.1840699, 0.8811366, 0.3668784, 0, 0.6745098, 1, 1,
0.1862425, -0.8831595, 2.024517, 0, 0.6705883, 1, 1,
0.1875249, -0.2717589, 1.437531, 0, 0.6627451, 1, 1,
0.1917395, 0.452834, 1.314465, 0, 0.6588235, 1, 1,
0.1919332, 0.002284821, 0.8792487, 0, 0.6509804, 1, 1,
0.1950638, 0.04562331, 2.234353, 0, 0.6470588, 1, 1,
0.1952534, -0.9773121, 4.2237, 0, 0.6392157, 1, 1,
0.1986338, 0.2725382, -1.03129, 0, 0.6352941, 1, 1,
0.2000993, 0.1513447, -0.3547788, 0, 0.627451, 1, 1,
0.2011012, -1.243716, 2.903676, 0, 0.6235294, 1, 1,
0.2017341, -1.375485, 4.236201, 0, 0.6156863, 1, 1,
0.2029568, -0.6075537, 1.416898, 0, 0.6117647, 1, 1,
0.2033536, 1.634969, -0.405717, 0, 0.6039216, 1, 1,
0.2073921, 0.3130113, -0.6525325, 0, 0.5960785, 1, 1,
0.2076719, 0.8118407, -0.4823076, 0, 0.5921569, 1, 1,
0.2107886, -2.191981, 1.817371, 0, 0.5843138, 1, 1,
0.2136519, 1.103694, 0.2492093, 0, 0.5803922, 1, 1,
0.2156394, -0.06413537, 1.79417, 0, 0.572549, 1, 1,
0.2182282, -0.2636772, 2.424704, 0, 0.5686275, 1, 1,
0.2231613, 1.611467, 2.171014, 0, 0.5607843, 1, 1,
0.2242352, -2.213011, 4.423343, 0, 0.5568628, 1, 1,
0.2242548, 0.5658713, -0.0036284, 0, 0.5490196, 1, 1,
0.2321869, 0.3347556, 1.529439, 0, 0.5450981, 1, 1,
0.2328731, -0.03178871, 1.096371, 0, 0.5372549, 1, 1,
0.2342095, 0.7342077, 0.6617886, 0, 0.5333334, 1, 1,
0.2347651, -0.9908177, 1.913945, 0, 0.5254902, 1, 1,
0.2360065, 0.2529282, 0.1310925, 0, 0.5215687, 1, 1,
0.2361493, -1.330969, 1.990939, 0, 0.5137255, 1, 1,
0.2398426, 0.7499591, 1.524156, 0, 0.509804, 1, 1,
0.2421072, -0.6648076, 2.083012, 0, 0.5019608, 1, 1,
0.243431, -0.1119312, 2.35388, 0, 0.4941176, 1, 1,
0.2445713, 1.189482, -1.111184, 0, 0.4901961, 1, 1,
0.2468023, -0.5440325, 4.424223, 0, 0.4823529, 1, 1,
0.2512456, 0.6271463, -1.131372, 0, 0.4784314, 1, 1,
0.2675176, -0.5868471, 2.683915, 0, 0.4705882, 1, 1,
0.2678987, -0.4854653, 0.8610905, 0, 0.4666667, 1, 1,
0.2702833, 1.143954, 0.8258528, 0, 0.4588235, 1, 1,
0.2709117, 0.2519261, 1.663609, 0, 0.454902, 1, 1,
0.2794077, -0.7361777, 2.130085, 0, 0.4470588, 1, 1,
0.2813318, 1.020066, -0.2883333, 0, 0.4431373, 1, 1,
0.2832134, 1.732622, -0.1429423, 0, 0.4352941, 1, 1,
0.2841598, 0.4190453, -0.5833262, 0, 0.4313726, 1, 1,
0.2850275, -1.02306, 4.173065, 0, 0.4235294, 1, 1,
0.2859464, 0.0735264, 1.186947, 0, 0.4196078, 1, 1,
0.2900989, -0.2552698, 2.571326, 0, 0.4117647, 1, 1,
0.292059, -0.9489453, 2.256234, 0, 0.4078431, 1, 1,
0.2956862, -2.22351, 2.869087, 0, 0.4, 1, 1,
0.2973011, -1.114663, 3.20144, 0, 0.3921569, 1, 1,
0.3000983, 0.1994129, 0.5815404, 0, 0.3882353, 1, 1,
0.3037912, -0.2690139, 2.207977, 0, 0.3803922, 1, 1,
0.3049537, -0.6655592, 3.587848, 0, 0.3764706, 1, 1,
0.3050619, -1.430608, 2.787512, 0, 0.3686275, 1, 1,
0.3063312, -1.490921, 2.63609, 0, 0.3647059, 1, 1,
0.3094766, -0.2823162, 1.885392, 0, 0.3568628, 1, 1,
0.3110863, 1.04242, 0.5578372, 0, 0.3529412, 1, 1,
0.3170691, 0.5624009, 1.87927, 0, 0.345098, 1, 1,
0.3200477, -1.516191, 1.800904, 0, 0.3411765, 1, 1,
0.3231603, 0.3654827, -0.07015719, 0, 0.3333333, 1, 1,
0.3235664, -0.26085, 2.954148, 0, 0.3294118, 1, 1,
0.3236058, 3.168086, -1.677494, 0, 0.3215686, 1, 1,
0.3301884, 0.1782799, 0.290121, 0, 0.3176471, 1, 1,
0.3320401, 0.3139552, 0.5455494, 0, 0.3098039, 1, 1,
0.3321824, 0.5467872, -0.1396402, 0, 0.3058824, 1, 1,
0.3336388, 0.3695734, -0.1911068, 0, 0.2980392, 1, 1,
0.3337716, 1.346431, 1.249759, 0, 0.2901961, 1, 1,
0.334024, 0.7778395, 0.8800421, 0, 0.2862745, 1, 1,
0.3360707, -0.9117559, 2.233728, 0, 0.2784314, 1, 1,
0.3374941, 0.6017266, 1.835765, 0, 0.2745098, 1, 1,
0.3436897, -0.02125134, 1.386507, 0, 0.2666667, 1, 1,
0.3443769, 0.3378285, -0.2914427, 0, 0.2627451, 1, 1,
0.3468262, 1.704856, 1.396724, 0, 0.254902, 1, 1,
0.3499696, -0.4814492, 1.478112, 0, 0.2509804, 1, 1,
0.3580329, -0.8011864, 4.640883, 0, 0.2431373, 1, 1,
0.3590148, -2.278448, 1.666107, 0, 0.2392157, 1, 1,
0.3615316, 0.3517036, 0.6381951, 0, 0.2313726, 1, 1,
0.3619781, 0.09533486, 2.530797, 0, 0.227451, 1, 1,
0.3625623, 1.452472, 1.221018, 0, 0.2196078, 1, 1,
0.3626175, -2.266482, 3.93452, 0, 0.2156863, 1, 1,
0.3642036, 2.006436, 0.6108927, 0, 0.2078431, 1, 1,
0.3669526, -0.06278998, 2.109668, 0, 0.2039216, 1, 1,
0.3688969, -0.6672433, 1.489656, 0, 0.1960784, 1, 1,
0.3693793, 1.240069, -0.3257872, 0, 0.1882353, 1, 1,
0.3695498, -1.236913, 4.232165, 0, 0.1843137, 1, 1,
0.3734082, 0.09103996, 3.490366, 0, 0.1764706, 1, 1,
0.3773188, -1.813605, 3.819317, 0, 0.172549, 1, 1,
0.3779813, -0.2122631, 4.070546, 0, 0.1647059, 1, 1,
0.3814704, -0.1279249, 1.124259, 0, 0.1607843, 1, 1,
0.3880275, 1.195466, 1.11985, 0, 0.1529412, 1, 1,
0.3889798, 1.165763, -0.4704176, 0, 0.1490196, 1, 1,
0.3908795, -0.5430412, 3.696756, 0, 0.1411765, 1, 1,
0.3909896, -0.5056739, 1.588422, 0, 0.1372549, 1, 1,
0.3976897, -1.525238, 2.18561, 0, 0.1294118, 1, 1,
0.4147387, -0.2292905, 2.324404, 0, 0.1254902, 1, 1,
0.4206231, -0.4731994, 4.471656, 0, 0.1176471, 1, 1,
0.4268544, 1.56945, 1.653919, 0, 0.1137255, 1, 1,
0.4276228, 0.4296087, 0.3794886, 0, 0.1058824, 1, 1,
0.4391156, 0.3552886, 1.225971, 0, 0.09803922, 1, 1,
0.4418628, 0.5249679, 0.5262215, 0, 0.09411765, 1, 1,
0.4442911, -0.1169249, 1.45763, 0, 0.08627451, 1, 1,
0.4453697, -0.1588162, 3.396351, 0, 0.08235294, 1, 1,
0.4460997, -2.3212, 4.65138, 0, 0.07450981, 1, 1,
0.4471487, 1.12282, 0.219167, 0, 0.07058824, 1, 1,
0.4523152, 1.320022, 0.7276111, 0, 0.0627451, 1, 1,
0.4526296, 0.29946, 1.041461, 0, 0.05882353, 1, 1,
0.4553268, 0.4877219, 1.598694, 0, 0.05098039, 1, 1,
0.4574161, -0.2709103, 1.552552, 0, 0.04705882, 1, 1,
0.4589929, 1.410069, 0.2135261, 0, 0.03921569, 1, 1,
0.4627254, 0.9572802, -0.6499822, 0, 0.03529412, 1, 1,
0.4627407, -1.20622, 2.124839, 0, 0.02745098, 1, 1,
0.4636528, -0.1208297, 1.908496, 0, 0.02352941, 1, 1,
0.4642276, 0.1119081, 0.3671185, 0, 0.01568628, 1, 1,
0.4681706, -0.1897238, 0.07813049, 0, 0.01176471, 1, 1,
0.4698934, 0.7534522, 1.179611, 0, 0.003921569, 1, 1,
0.472131, -0.5242637, 1.405576, 0.003921569, 0, 1, 1,
0.4801976, -1.41351, 3.631969, 0.007843138, 0, 1, 1,
0.4837838, 0.1354751, 1.649059, 0.01568628, 0, 1, 1,
0.4846881, 0.008447145, 1.729951, 0.01960784, 0, 1, 1,
0.4849655, 1.2076, -0.1077356, 0.02745098, 0, 1, 1,
0.4860969, -0.8745713, 1.09743, 0.03137255, 0, 1, 1,
0.4914129, 1.667217, 0.772285, 0.03921569, 0, 1, 1,
0.4971539, -1.360163, 2.367518, 0.04313726, 0, 1, 1,
0.4975455, -0.4189276, 1.671697, 0.05098039, 0, 1, 1,
0.5000228, -0.4698603, 2.392167, 0.05490196, 0, 1, 1,
0.5008419, -1.480014, 2.031932, 0.0627451, 0, 1, 1,
0.5011871, 0.4310994, -0.7847843, 0.06666667, 0, 1, 1,
0.5017663, -0.2186658, 2.153885, 0.07450981, 0, 1, 1,
0.5036473, 0.6426564, 1.637361, 0.07843138, 0, 1, 1,
0.5044609, 0.06258026, 2.400152, 0.08627451, 0, 1, 1,
0.5074156, -1.105244, 2.509403, 0.09019608, 0, 1, 1,
0.5117967, -1.419552, 1.769032, 0.09803922, 0, 1, 1,
0.514316, -1.94057, 4.416907, 0.1058824, 0, 1, 1,
0.5187814, 1.653804, 0.004396692, 0.1098039, 0, 1, 1,
0.5213526, -1.335077, 3.252443, 0.1176471, 0, 1, 1,
0.5248966, 0.9491095, 2.079957, 0.1215686, 0, 1, 1,
0.5362039, -0.3908251, 2.84254, 0.1294118, 0, 1, 1,
0.5376722, 0.4166096, 1.7783, 0.1333333, 0, 1, 1,
0.5396195, 0.3575566, 0.168084, 0.1411765, 0, 1, 1,
0.5405475, 0.5601429, 0.9339055, 0.145098, 0, 1, 1,
0.5410237, 1.216368, -0.5631455, 0.1529412, 0, 1, 1,
0.5434749, 0.6850084, 0.7227654, 0.1568628, 0, 1, 1,
0.54472, -0.1063609, 1.279677, 0.1647059, 0, 1, 1,
0.5490345, 0.8201619, 0.07587776, 0.1686275, 0, 1, 1,
0.5493318, 0.3617511, 0.5138006, 0.1764706, 0, 1, 1,
0.5504659, -1.619986, 4.005681, 0.1803922, 0, 1, 1,
0.5539687, -0.2594562, 3.245068, 0.1882353, 0, 1, 1,
0.5540471, 1.491834, -0.5754269, 0.1921569, 0, 1, 1,
0.556515, -0.09475464, 2.40837, 0.2, 0, 1, 1,
0.5596667, -2.326315, 3.019861, 0.2078431, 0, 1, 1,
0.5608392, -0.9685513, 3.879553, 0.2117647, 0, 1, 1,
0.561605, 0.9319832, -0.1266649, 0.2196078, 0, 1, 1,
0.5665667, -0.08177549, 2.334536, 0.2235294, 0, 1, 1,
0.5677852, -0.04270404, 1.572912, 0.2313726, 0, 1, 1,
0.5755808, -1.234585, 1.404273, 0.2352941, 0, 1, 1,
0.5757856, -0.6193553, 1.89059, 0.2431373, 0, 1, 1,
0.577391, 0.935204, 0.1683901, 0.2470588, 0, 1, 1,
0.5793265, 0.5764702, 0.01167725, 0.254902, 0, 1, 1,
0.5832922, 0.005228451, 2.712002, 0.2588235, 0, 1, 1,
0.5838923, 0.06355213, 1.057093, 0.2666667, 0, 1, 1,
0.5849233, 0.4018646, -0.4985607, 0.2705882, 0, 1, 1,
0.5851575, -0.3766428, 2.09999, 0.2784314, 0, 1, 1,
0.5876804, 0.09295341, -0.08065508, 0.282353, 0, 1, 1,
0.5923983, -1.084858, 3.550326, 0.2901961, 0, 1, 1,
0.5935524, -0.7579639, 1.863233, 0.2941177, 0, 1, 1,
0.5953544, 0.7626101, -0.2997062, 0.3019608, 0, 1, 1,
0.5976045, -1.991095, 4.249427, 0.3098039, 0, 1, 1,
0.6002851, -0.02250592, 0.1940215, 0.3137255, 0, 1, 1,
0.6003342, 0.237252, -0.9344558, 0.3215686, 0, 1, 1,
0.6021, -0.9229279, 1.9615, 0.3254902, 0, 1, 1,
0.6025335, 0.2255856, 2.440424, 0.3333333, 0, 1, 1,
0.6030073, -0.1910889, 2.46679, 0.3372549, 0, 1, 1,
0.6041315, -0.5343645, 1.550636, 0.345098, 0, 1, 1,
0.6050128, 1.114967, 0.5478513, 0.3490196, 0, 1, 1,
0.6079152, 0.9922213, 0.8508964, 0.3568628, 0, 1, 1,
0.6100585, -1.398176, 2.299684, 0.3607843, 0, 1, 1,
0.6129951, -0.04411701, 0.8651699, 0.3686275, 0, 1, 1,
0.6154554, 0.5616355, 0.8142493, 0.372549, 0, 1, 1,
0.6171119, -0.5674661, 1.038672, 0.3803922, 0, 1, 1,
0.6198082, -0.2232997, 1.397603, 0.3843137, 0, 1, 1,
0.6244676, -1.306039, 2.940585, 0.3921569, 0, 1, 1,
0.6305892, -0.5705529, 1.135834, 0.3960784, 0, 1, 1,
0.6334736, -0.9141185, 1.989824, 0.4039216, 0, 1, 1,
0.6343123, 1.532071, 1.199378, 0.4117647, 0, 1, 1,
0.639876, -0.07155782, 0.4662685, 0.4156863, 0, 1, 1,
0.6448654, 0.6453205, 2.61393, 0.4235294, 0, 1, 1,
0.6449553, 0.1085564, 3.103038, 0.427451, 0, 1, 1,
0.6473599, -1.185142, 1.919929, 0.4352941, 0, 1, 1,
0.6523337, 2.703404, 0.9285318, 0.4392157, 0, 1, 1,
0.6523779, -0.3733019, 2.853258, 0.4470588, 0, 1, 1,
0.6580011, -0.4491962, 1.757264, 0.4509804, 0, 1, 1,
0.6608905, -0.4628723, 3.071016, 0.4588235, 0, 1, 1,
0.6619419, 0.5904378, 3.237755, 0.4627451, 0, 1, 1,
0.662507, 0.7408326, -0.3212066, 0.4705882, 0, 1, 1,
0.6645601, 0.02050644, 1.174053, 0.4745098, 0, 1, 1,
0.6665238, -1.577207, 2.647916, 0.4823529, 0, 1, 1,
0.6779501, 1.629043, 1.655046, 0.4862745, 0, 1, 1,
0.6785664, -1.531802, 3.000531, 0.4941176, 0, 1, 1,
0.6786908, -1.245172, 2.859476, 0.5019608, 0, 1, 1,
0.6845625, -0.07445785, 1.062488, 0.5058824, 0, 1, 1,
0.6850827, -1.073627, 3.674627, 0.5137255, 0, 1, 1,
0.6908733, -1.123585, 1.224538, 0.5176471, 0, 1, 1,
0.6988533, 1.335194, 1.241952, 0.5254902, 0, 1, 1,
0.7004362, 0.4809657, 2.037384, 0.5294118, 0, 1, 1,
0.7014009, -0.3864814, 2.924374, 0.5372549, 0, 1, 1,
0.7018246, 0.06277925, 1.030982, 0.5411765, 0, 1, 1,
0.7066998, -0.6929139, -0.6382461, 0.5490196, 0, 1, 1,
0.7132748, 1.193315, -1.555409, 0.5529412, 0, 1, 1,
0.7155071, 0.02173269, 3.501538, 0.5607843, 0, 1, 1,
0.7227282, -1.571563, 1.886161, 0.5647059, 0, 1, 1,
0.7275355, -0.5876205, 1.396273, 0.572549, 0, 1, 1,
0.7343668, 0.8920776, 0.550499, 0.5764706, 0, 1, 1,
0.7407414, -0.8678316, 4.354151, 0.5843138, 0, 1, 1,
0.7410836, 0.5022573, -0.2037519, 0.5882353, 0, 1, 1,
0.7432516, -0.08713108, 3.106022, 0.5960785, 0, 1, 1,
0.7513093, 0.9243604, 2.406988, 0.6039216, 0, 1, 1,
0.7516322, 0.1665636, -1.253861, 0.6078432, 0, 1, 1,
0.7525929, -0.7879984, 2.492009, 0.6156863, 0, 1, 1,
0.7573789, -0.2427067, 1.366405, 0.6196079, 0, 1, 1,
0.7602344, 0.9277611, 0.3388091, 0.627451, 0, 1, 1,
0.7666811, -0.3736635, 1.26723, 0.6313726, 0, 1, 1,
0.7701194, 0.2074494, 1.943146, 0.6392157, 0, 1, 1,
0.7748456, 0.2952607, 0.1238225, 0.6431373, 0, 1, 1,
0.7769647, 0.2280653, 3.155323, 0.6509804, 0, 1, 1,
0.7789783, 0.6815743, 1.42868, 0.654902, 0, 1, 1,
0.7807014, 1.088105, 1.411628, 0.6627451, 0, 1, 1,
0.7864563, -0.4207465, 0.7092249, 0.6666667, 0, 1, 1,
0.7930855, 0.6050151, -0.1624702, 0.6745098, 0, 1, 1,
0.794007, -1.607904, 1.980326, 0.6784314, 0, 1, 1,
0.7989285, 0.0873097, 1.373813, 0.6862745, 0, 1, 1,
0.8056346, 0.2261338, 0.4185672, 0.6901961, 0, 1, 1,
0.8058186, 0.980435, 1.166447, 0.6980392, 0, 1, 1,
0.8116244, 1.620347, 0.5395952, 0.7058824, 0, 1, 1,
0.8129153, -0.1339738, 0.6089886, 0.7098039, 0, 1, 1,
0.8167325, 0.06340206, 2.063125, 0.7176471, 0, 1, 1,
0.8215944, 0.8701943, 0.6967245, 0.7215686, 0, 1, 1,
0.8290776, 0.2773556, 0.8320237, 0.7294118, 0, 1, 1,
0.8388665, 1.225754, 1.032356, 0.7333333, 0, 1, 1,
0.8424653, -0.7685714, 3.31545, 0.7411765, 0, 1, 1,
0.858617, -0.6668181, 3.375974, 0.7450981, 0, 1, 1,
0.858808, -1.41626, 2.220221, 0.7529412, 0, 1, 1,
0.8693506, -0.1101058, -0.1371025, 0.7568628, 0, 1, 1,
0.8699487, 0.7248724, 0.441453, 0.7647059, 0, 1, 1,
0.8761708, 0.9607036, 0.574612, 0.7686275, 0, 1, 1,
0.878204, 0.3113183, 0.4085722, 0.7764706, 0, 1, 1,
0.8814989, 0.9399049, 1.462776, 0.7803922, 0, 1, 1,
0.8886126, 0.2410157, 0.827865, 0.7882353, 0, 1, 1,
0.8948947, 1.475651, 1.448332, 0.7921569, 0, 1, 1,
0.8953571, -0.6593248, 2.591194, 0.8, 0, 1, 1,
0.8975727, 1.018595, 0.5300626, 0.8078431, 0, 1, 1,
0.8999403, -0.2569989, 3.160226, 0.8117647, 0, 1, 1,
0.9025564, 1.74566, -0.08969063, 0.8196079, 0, 1, 1,
0.904453, -0.6785951, 2.609845, 0.8235294, 0, 1, 1,
0.9063112, 0.01125642, 0.9151342, 0.8313726, 0, 1, 1,
0.9106226, 0.7127887, 1.023429, 0.8352941, 0, 1, 1,
0.911579, 0.1012432, 1.719828, 0.8431373, 0, 1, 1,
0.9151515, 0.7121432, 1.905207, 0.8470588, 0, 1, 1,
0.9184431, -0.9393393, 2.111792, 0.854902, 0, 1, 1,
0.9226475, -1.316802, 1.559062, 0.8588235, 0, 1, 1,
0.9239478, 0.9225802, 1.265346, 0.8666667, 0, 1, 1,
0.9274001, -0.708728, 3.041354, 0.8705882, 0, 1, 1,
0.9451256, -0.2762098, 1.798584, 0.8784314, 0, 1, 1,
0.9502049, -0.9062497, 2.757094, 0.8823529, 0, 1, 1,
0.9549319, 1.76835, -0.09725983, 0.8901961, 0, 1, 1,
0.9572745, 1.693396, 0.154022, 0.8941177, 0, 1, 1,
0.960274, 1.0311, 0.7167537, 0.9019608, 0, 1, 1,
0.9733676, 1.255677, 0.1735863, 0.9098039, 0, 1, 1,
0.9801902, 1.461059, 0.8568631, 0.9137255, 0, 1, 1,
0.9806371, -0.3834016, 0.78032, 0.9215686, 0, 1, 1,
0.9811797, -1.097028, 2.6413, 0.9254902, 0, 1, 1,
0.9815528, -0.2671669, 0.1374798, 0.9333333, 0, 1, 1,
0.9832032, 1.3598, 0.6957652, 0.9372549, 0, 1, 1,
0.9836284, 0.5777124, 1.625926, 0.945098, 0, 1, 1,
0.989109, -1.749476, 1.931585, 0.9490196, 0, 1, 1,
0.99086, -1.977792, 0.6963651, 0.9568627, 0, 1, 1,
0.9911833, 1.092842, 0.04268916, 0.9607843, 0, 1, 1,
0.9968606, 0.5486438, 1.713126, 0.9686275, 0, 1, 1,
0.997112, 0.8520338, -0.4179185, 0.972549, 0, 1, 1,
1.000218, -0.415908, 2.463746, 0.9803922, 0, 1, 1,
1.001703, 0.146511, 0.8925278, 0.9843137, 0, 1, 1,
1.006576, -0.245162, 2.742764, 0.9921569, 0, 1, 1,
1.00778, 1.240107, -0.4015656, 0.9960784, 0, 1, 1,
1.015106, 0.1308247, 1.529725, 1, 0, 0.9960784, 1,
1.017496, 0.3919358, 0.617714, 1, 0, 0.9882353, 1,
1.018656, 0.1719282, 1.429435, 1, 0, 0.9843137, 1,
1.036994, -1.314698, 2.965421, 1, 0, 0.9764706, 1,
1.039222, 0.2983772, -0.7610464, 1, 0, 0.972549, 1,
1.045954, 0.7898592, -0.252292, 1, 0, 0.9647059, 1,
1.04995, -1.219169, 2.161421, 1, 0, 0.9607843, 1,
1.050557, 0.3061423, 0.8038322, 1, 0, 0.9529412, 1,
1.057674, -1.319713, 2.885494, 1, 0, 0.9490196, 1,
1.061576, 0.07585489, 2.697511, 1, 0, 0.9411765, 1,
1.072297, 0.7777362, 2.231119, 1, 0, 0.9372549, 1,
1.078177, 2.173602, 1.1942, 1, 0, 0.9294118, 1,
1.081782, 0.9081791, 0.8549947, 1, 0, 0.9254902, 1,
1.085567, 3.185523, 1.260651, 1, 0, 0.9176471, 1,
1.089058, -0.3138028, 1.335516, 1, 0, 0.9137255, 1,
1.09433, 0.824302, 2.606785, 1, 0, 0.9058824, 1,
1.095735, -0.6206254, 3.268911, 1, 0, 0.9019608, 1,
1.097662, 1.724186, 0.1963986, 1, 0, 0.8941177, 1,
1.114563, 0.7125334, 0.3762047, 1, 0, 0.8862745, 1,
1.122891, -0.655122, 2.110924, 1, 0, 0.8823529, 1,
1.128526, -0.1684266, 0.322393, 1, 0, 0.8745098, 1,
1.129265, 0.4216475, 0.6167303, 1, 0, 0.8705882, 1,
1.132214, -1.169713, 1.759511, 1, 0, 0.8627451, 1,
1.132427, -1.658414, 1.472486, 1, 0, 0.8588235, 1,
1.135086, 0.4178327, 1.625157, 1, 0, 0.8509804, 1,
1.139458, -0.05714988, 1.061465, 1, 0, 0.8470588, 1,
1.142211, 0.9277562, 2.448206, 1, 0, 0.8392157, 1,
1.146107, 1.712933, 2.936009, 1, 0, 0.8352941, 1,
1.157029, -1.005323, 3.062336, 1, 0, 0.827451, 1,
1.165017, 0.4517533, 2.251346, 1, 0, 0.8235294, 1,
1.166681, -0.0981155, 2.899607, 1, 0, 0.8156863, 1,
1.171273, -0.9697435, 2.248212, 1, 0, 0.8117647, 1,
1.176324, 0.7403039, 1.124426, 1, 0, 0.8039216, 1,
1.180716, -1.408848, 0.3658214, 1, 0, 0.7960784, 1,
1.186836, -0.1796725, 1.160169, 1, 0, 0.7921569, 1,
1.192143, 0.4769405, 0.4016293, 1, 0, 0.7843137, 1,
1.196937, -1.407204, 0.9551349, 1, 0, 0.7803922, 1,
1.198346, -0.4095953, 1.752359, 1, 0, 0.772549, 1,
1.205093, -0.5454009, 2.944575, 1, 0, 0.7686275, 1,
1.208328, 0.08378841, -0.02547724, 1, 0, 0.7607843, 1,
1.208542, -0.8113572, 4.716832, 1, 0, 0.7568628, 1,
1.211836, -1.389132, 1.106637, 1, 0, 0.7490196, 1,
1.225097, -0.09689272, 2.416538, 1, 0, 0.7450981, 1,
1.225938, -0.5882887, 0.341285, 1, 0, 0.7372549, 1,
1.24238, 0.3127524, 0.3644802, 1, 0, 0.7333333, 1,
1.249272, 0.1491722, -0.5340744, 1, 0, 0.7254902, 1,
1.250446, -0.6819504, 4.102357, 1, 0, 0.7215686, 1,
1.25203, 0.9916926, 0.2367769, 1, 0, 0.7137255, 1,
1.287101, 0.5658821, 2.694974, 1, 0, 0.7098039, 1,
1.289178, 0.5400069, 1.462112, 1, 0, 0.7019608, 1,
1.293667, -0.06197551, 2.028898, 1, 0, 0.6941177, 1,
1.302194, 0.9314718, 1.017628, 1, 0, 0.6901961, 1,
1.306914, 0.3583167, 1.043788, 1, 0, 0.682353, 1,
1.312181, -3.060805, 4.058687, 1, 0, 0.6784314, 1,
1.322326, 0.737618, 0.4852142, 1, 0, 0.6705883, 1,
1.323711, -0.2345444, 1.819182, 1, 0, 0.6666667, 1,
1.329533, 0.3977155, 2.408638, 1, 0, 0.6588235, 1,
1.330056, 1.410043, 1.5364, 1, 0, 0.654902, 1,
1.332289, -1.314461, 2.912778, 1, 0, 0.6470588, 1,
1.336076, -0.4067506, 3.273497, 1, 0, 0.6431373, 1,
1.344386, 2.183529, 0.6537969, 1, 0, 0.6352941, 1,
1.348518, -2.630427, 3.639638, 1, 0, 0.6313726, 1,
1.351543, -0.237403, 0.5791379, 1, 0, 0.6235294, 1,
1.355008, 1.191765, -0.3075321, 1, 0, 0.6196079, 1,
1.355561, -2.381601, 4.688045, 1, 0, 0.6117647, 1,
1.358217, -1.283749, 2.866349, 1, 0, 0.6078432, 1,
1.363564, 0.2945817, 0.9828495, 1, 0, 0.6, 1,
1.364894, 1.514885, 0.2324809, 1, 0, 0.5921569, 1,
1.375852, -0.3161365, 1.012053, 1, 0, 0.5882353, 1,
1.375942, 1.342696, 0.3630498, 1, 0, 0.5803922, 1,
1.37832, 0.7112415, 0.3999117, 1, 0, 0.5764706, 1,
1.380642, 3.067417, -1.525851, 1, 0, 0.5686275, 1,
1.390483, 1.528815, 2.332386, 1, 0, 0.5647059, 1,
1.394605, -0.111269, 1.038509, 1, 0, 0.5568628, 1,
1.396418, -0.5151473, 3.427202, 1, 0, 0.5529412, 1,
1.396496, 0.5976458, 0.5593933, 1, 0, 0.5450981, 1,
1.412001, 0.3326309, 1.346199, 1, 0, 0.5411765, 1,
1.419068, -0.9714379, -0.02955672, 1, 0, 0.5333334, 1,
1.419192, -0.5080445, 1.252477, 1, 0, 0.5294118, 1,
1.426633, -0.2756723, 0.8882859, 1, 0, 0.5215687, 1,
1.435841, -0.4506283, 1.136336, 1, 0, 0.5176471, 1,
1.457023, -2.246293, 2.449499, 1, 0, 0.509804, 1,
1.462302, 0.3668196, 0.7638753, 1, 0, 0.5058824, 1,
1.477241, -1.769419, 3.256651, 1, 0, 0.4980392, 1,
1.481726, 1.36544, 1.274722, 1, 0, 0.4901961, 1,
1.484566, -0.6298811, 3.513395, 1, 0, 0.4862745, 1,
1.487062, 1.101632, -0.3660678, 1, 0, 0.4784314, 1,
1.491655, -1.04578, 1.557998, 1, 0, 0.4745098, 1,
1.497998, 1.479112, -1.458555, 1, 0, 0.4666667, 1,
1.501278, 0.1918657, -0.5561771, 1, 0, 0.4627451, 1,
1.509331, -0.5415665, 1.619395, 1, 0, 0.454902, 1,
1.510495, 0.1422251, 1.236106, 1, 0, 0.4509804, 1,
1.511119, 1.206165, 0.4631827, 1, 0, 0.4431373, 1,
1.543615, 1.625815, 0.9403949, 1, 0, 0.4392157, 1,
1.552431, -1.238787, 1.278348, 1, 0, 0.4313726, 1,
1.5613, -0.0116461, 0.2963639, 1, 0, 0.427451, 1,
1.573608, -0.192689, 0.9603711, 1, 0, 0.4196078, 1,
1.58335, 0.8778369, -0.8527467, 1, 0, 0.4156863, 1,
1.583355, 1.132161, 0.2913136, 1, 0, 0.4078431, 1,
1.583743, -0.04984759, 0.6533499, 1, 0, 0.4039216, 1,
1.591339, -0.8176249, 2.883296, 1, 0, 0.3960784, 1,
1.60857, 0.5697258, 2.298137, 1, 0, 0.3882353, 1,
1.613337, -1.554704, 2.349688, 1, 0, 0.3843137, 1,
1.625059, 0.8431848, 1.078859, 1, 0, 0.3764706, 1,
1.639024, 0.4857219, 0.8315452, 1, 0, 0.372549, 1,
1.645971, -0.9100121, 2.217489, 1, 0, 0.3647059, 1,
1.651459, -0.3720285, 2.903538, 1, 0, 0.3607843, 1,
1.651866, 0.4067363, 0.6992326, 1, 0, 0.3529412, 1,
1.664073, 2.055579, 0.04636068, 1, 0, 0.3490196, 1,
1.667738, -1.766856, 2.272396, 1, 0, 0.3411765, 1,
1.668772, -1.064312, 0.3799208, 1, 0, 0.3372549, 1,
1.691853, 0.3277973, 1.426676, 1, 0, 0.3294118, 1,
1.715059, -2.055094, 2.264289, 1, 0, 0.3254902, 1,
1.715974, 0.2411267, 2.928575, 1, 0, 0.3176471, 1,
1.72399, 1.325724, 0.5353203, 1, 0, 0.3137255, 1,
1.73029, 0.7547417, 1.574003, 1, 0, 0.3058824, 1,
1.733748, 1.244413, 3.136076, 1, 0, 0.2980392, 1,
1.734646, 0.4769377, 1.096217, 1, 0, 0.2941177, 1,
1.747785, 0.7284604, 0.6278052, 1, 0, 0.2862745, 1,
1.763269, -0.01507619, 1.516294, 1, 0, 0.282353, 1,
1.797246, -0.8194659, 1.218285, 1, 0, 0.2745098, 1,
1.797378, 0.290926, 0.2387591, 1, 0, 0.2705882, 1,
1.798446, -0.1214856, 2.01669, 1, 0, 0.2627451, 1,
1.798545, -1.120278, 2.643734, 1, 0, 0.2588235, 1,
1.801137, 0.798871, 0.3448665, 1, 0, 0.2509804, 1,
1.809251, -0.1927919, 2.166702, 1, 0, 0.2470588, 1,
1.812382, 0.3515951, 1.661755, 1, 0, 0.2392157, 1,
1.812918, 0.8395069, 1.263394, 1, 0, 0.2352941, 1,
1.815813, -0.431151, 2.640959, 1, 0, 0.227451, 1,
1.816197, 0.4109303, 1.202649, 1, 0, 0.2235294, 1,
1.82189, 1.211768, 1.163112, 1, 0, 0.2156863, 1,
1.840533, 1.607356, 1.378504, 1, 0, 0.2117647, 1,
1.861282, -0.1888384, 1.843536, 1, 0, 0.2039216, 1,
1.901934, 0.4145233, 0.2344131, 1, 0, 0.1960784, 1,
1.909831, -1.043313, 2.972484, 1, 0, 0.1921569, 1,
1.931611, 0.9103306, -1.207888, 1, 0, 0.1843137, 1,
1.987653, -0.560737, 0.5405705, 1, 0, 0.1803922, 1,
1.992121, -1.309497, 2.676364, 1, 0, 0.172549, 1,
2.024601, -0.7265432, 3.15419, 1, 0, 0.1686275, 1,
2.030501, 0.3787496, 2.948447, 1, 0, 0.1607843, 1,
2.037067, 1.343191, 0.7306005, 1, 0, 0.1568628, 1,
2.039657, -0.898649, 1.906982, 1, 0, 0.1490196, 1,
2.042706, -0.7151557, 1.344517, 1, 0, 0.145098, 1,
2.051767, -0.8747617, 2.574101, 1, 0, 0.1372549, 1,
2.069121, 0.5778989, 1.633289, 1, 0, 0.1333333, 1,
2.093192, 1.687695, 1.476524, 1, 0, 0.1254902, 1,
2.113771, 1.792258, 1.855089, 1, 0, 0.1215686, 1,
2.121408, 0.724026, 1.446228, 1, 0, 0.1137255, 1,
2.139682, 0.7535902, 0.7201152, 1, 0, 0.1098039, 1,
2.144749, -0.9254406, 1.493641, 1, 0, 0.1019608, 1,
2.1686, 0.7358408, 1.334935, 1, 0, 0.09411765, 1,
2.215351, -0.521678, 2.174402, 1, 0, 0.09019608, 1,
2.236862, -0.7132877, 1.332551, 1, 0, 0.08235294, 1,
2.238498, 2.0733, 0.9820476, 1, 0, 0.07843138, 1,
2.290657, 0.2673055, 0.7254848, 1, 0, 0.07058824, 1,
2.298697, -0.1876633, 1.64066, 1, 0, 0.06666667, 1,
2.358573, 1.095258, 1.992312, 1, 0, 0.05882353, 1,
2.421892, -0.9741969, 2.382811, 1, 0, 0.05490196, 1,
2.462547, 0.007711661, 4.10388, 1, 0, 0.04705882, 1,
2.645031, 0.3483188, 3.129424, 1, 0, 0.04313726, 1,
2.772809, 0.7061957, 0.7478645, 1, 0, 0.03529412, 1,
2.821887, 1.486151, 0.2359785, 1, 0, 0.03137255, 1,
2.937087, 0.4201125, 1.517412, 1, 0, 0.02352941, 1,
3.032477, 0.4046797, 1.381183, 1, 0, 0.01960784, 1,
3.223068, 0.902003, 0.2638892, 1, 0, 0.01176471, 1,
3.249028, -0.4181961, 1.515882, 1, 0, 0.007843138, 1
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
0.1465238, -4.119558, -7.25375, 0, -0.5, 0.5, 0.5,
0.1465238, -4.119558, -7.25375, 1, -0.5, 0.5, 0.5,
0.1465238, -4.119558, -7.25375, 1, 1.5, 0.5, 0.5,
0.1465238, -4.119558, -7.25375, 0, 1.5, 0.5, 0.5
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
-4.00773, 0.06235909, -7.25375, 0, -0.5, 0.5, 0.5,
-4.00773, 0.06235909, -7.25375, 1, -0.5, 0.5, 0.5,
-4.00773, 0.06235909, -7.25375, 1, 1.5, 0.5, 0.5,
-4.00773, 0.06235909, -7.25375, 0, 1.5, 0.5, 0.5
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
-4.00773, -4.119558, -0.4009888, 0, -0.5, 0.5, 0.5,
-4.00773, -4.119558, -0.4009888, 1, -0.5, 0.5, 0.5,
-4.00773, -4.119558, -0.4009888, 1, 1.5, 0.5, 0.5,
-4.00773, -4.119558, -0.4009888, 0, 1.5, 0.5, 0.5
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
-2, -3.1545, -5.672344,
3, -3.1545, -5.672344,
-2, -3.1545, -5.672344,
-2, -3.315343, -5.935912,
-1, -3.1545, -5.672344,
-1, -3.315343, -5.935912,
0, -3.1545, -5.672344,
0, -3.315343, -5.935912,
1, -3.1545, -5.672344,
1, -3.315343, -5.935912,
2, -3.1545, -5.672344,
2, -3.315343, -5.935912,
3, -3.1545, -5.672344,
3, -3.315343, -5.935912
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
-2, -3.637029, -6.463047, 0, -0.5, 0.5, 0.5,
-2, -3.637029, -6.463047, 1, -0.5, 0.5, 0.5,
-2, -3.637029, -6.463047, 1, 1.5, 0.5, 0.5,
-2, -3.637029, -6.463047, 0, 1.5, 0.5, 0.5,
-1, -3.637029, -6.463047, 0, -0.5, 0.5, 0.5,
-1, -3.637029, -6.463047, 1, -0.5, 0.5, 0.5,
-1, -3.637029, -6.463047, 1, 1.5, 0.5, 0.5,
-1, -3.637029, -6.463047, 0, 1.5, 0.5, 0.5,
0, -3.637029, -6.463047, 0, -0.5, 0.5, 0.5,
0, -3.637029, -6.463047, 1, -0.5, 0.5, 0.5,
0, -3.637029, -6.463047, 1, 1.5, 0.5, 0.5,
0, -3.637029, -6.463047, 0, 1.5, 0.5, 0.5,
1, -3.637029, -6.463047, 0, -0.5, 0.5, 0.5,
1, -3.637029, -6.463047, 1, -0.5, 0.5, 0.5,
1, -3.637029, -6.463047, 1, 1.5, 0.5, 0.5,
1, -3.637029, -6.463047, 0, 1.5, 0.5, 0.5,
2, -3.637029, -6.463047, 0, -0.5, 0.5, 0.5,
2, -3.637029, -6.463047, 1, -0.5, 0.5, 0.5,
2, -3.637029, -6.463047, 1, 1.5, 0.5, 0.5,
2, -3.637029, -6.463047, 0, 1.5, 0.5, 0.5,
3, -3.637029, -6.463047, 0, -0.5, 0.5, 0.5,
3, -3.637029, -6.463047, 1, -0.5, 0.5, 0.5,
3, -3.637029, -6.463047, 1, 1.5, 0.5, 0.5,
3, -3.637029, -6.463047, 0, 1.5, 0.5, 0.5
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
-3.049056, -3, -5.672344,
-3.049056, 3, -5.672344,
-3.049056, -3, -5.672344,
-3.208835, -3, -5.935912,
-3.049056, -2, -5.672344,
-3.208835, -2, -5.935912,
-3.049056, -1, -5.672344,
-3.208835, -1, -5.935912,
-3.049056, 0, -5.672344,
-3.208835, 0, -5.935912,
-3.049056, 1, -5.672344,
-3.208835, 1, -5.935912,
-3.049056, 2, -5.672344,
-3.208835, 2, -5.935912,
-3.049056, 3, -5.672344,
-3.208835, 3, -5.935912
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
-3.528393, -3, -6.463047, 0, -0.5, 0.5, 0.5,
-3.528393, -3, -6.463047, 1, -0.5, 0.5, 0.5,
-3.528393, -3, -6.463047, 1, 1.5, 0.5, 0.5,
-3.528393, -3, -6.463047, 0, 1.5, 0.5, 0.5,
-3.528393, -2, -6.463047, 0, -0.5, 0.5, 0.5,
-3.528393, -2, -6.463047, 1, -0.5, 0.5, 0.5,
-3.528393, -2, -6.463047, 1, 1.5, 0.5, 0.5,
-3.528393, -2, -6.463047, 0, 1.5, 0.5, 0.5,
-3.528393, -1, -6.463047, 0, -0.5, 0.5, 0.5,
-3.528393, -1, -6.463047, 1, -0.5, 0.5, 0.5,
-3.528393, -1, -6.463047, 1, 1.5, 0.5, 0.5,
-3.528393, -1, -6.463047, 0, 1.5, 0.5, 0.5,
-3.528393, 0, -6.463047, 0, -0.5, 0.5, 0.5,
-3.528393, 0, -6.463047, 1, -0.5, 0.5, 0.5,
-3.528393, 0, -6.463047, 1, 1.5, 0.5, 0.5,
-3.528393, 0, -6.463047, 0, 1.5, 0.5, 0.5,
-3.528393, 1, -6.463047, 0, -0.5, 0.5, 0.5,
-3.528393, 1, -6.463047, 1, -0.5, 0.5, 0.5,
-3.528393, 1, -6.463047, 1, 1.5, 0.5, 0.5,
-3.528393, 1, -6.463047, 0, 1.5, 0.5, 0.5,
-3.528393, 2, -6.463047, 0, -0.5, 0.5, 0.5,
-3.528393, 2, -6.463047, 1, -0.5, 0.5, 0.5,
-3.528393, 2, -6.463047, 1, 1.5, 0.5, 0.5,
-3.528393, 2, -6.463047, 0, 1.5, 0.5, 0.5,
-3.528393, 3, -6.463047, 0, -0.5, 0.5, 0.5,
-3.528393, 3, -6.463047, 1, -0.5, 0.5, 0.5,
-3.528393, 3, -6.463047, 1, 1.5, 0.5, 0.5,
-3.528393, 3, -6.463047, 0, 1.5, 0.5, 0.5
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
-3.049056, -3.1545, -4,
-3.049056, -3.1545, 4,
-3.049056, -3.1545, -4,
-3.208835, -3.315343, -4,
-3.049056, -3.1545, -2,
-3.208835, -3.315343, -2,
-3.049056, -3.1545, 0,
-3.208835, -3.315343, 0,
-3.049056, -3.1545, 2,
-3.208835, -3.315343, 2,
-3.049056, -3.1545, 4,
-3.208835, -3.315343, 4
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
-3.528393, -3.637029, -4, 0, -0.5, 0.5, 0.5,
-3.528393, -3.637029, -4, 1, -0.5, 0.5, 0.5,
-3.528393, -3.637029, -4, 1, 1.5, 0.5, 0.5,
-3.528393, -3.637029, -4, 0, 1.5, 0.5, 0.5,
-3.528393, -3.637029, -2, 0, -0.5, 0.5, 0.5,
-3.528393, -3.637029, -2, 1, -0.5, 0.5, 0.5,
-3.528393, -3.637029, -2, 1, 1.5, 0.5, 0.5,
-3.528393, -3.637029, -2, 0, 1.5, 0.5, 0.5,
-3.528393, -3.637029, 0, 0, -0.5, 0.5, 0.5,
-3.528393, -3.637029, 0, 1, -0.5, 0.5, 0.5,
-3.528393, -3.637029, 0, 1, 1.5, 0.5, 0.5,
-3.528393, -3.637029, 0, 0, 1.5, 0.5, 0.5,
-3.528393, -3.637029, 2, 0, -0.5, 0.5, 0.5,
-3.528393, -3.637029, 2, 1, -0.5, 0.5, 0.5,
-3.528393, -3.637029, 2, 1, 1.5, 0.5, 0.5,
-3.528393, -3.637029, 2, 0, 1.5, 0.5, 0.5,
-3.528393, -3.637029, 4, 0, -0.5, 0.5, 0.5,
-3.528393, -3.637029, 4, 1, -0.5, 0.5, 0.5,
-3.528393, -3.637029, 4, 1, 1.5, 0.5, 0.5,
-3.528393, -3.637029, 4, 0, 1.5, 0.5, 0.5
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
-3.049056, -3.1545, -5.672344,
-3.049056, 3.279218, -5.672344,
-3.049056, -3.1545, 4.870366,
-3.049056, 3.279218, 4.870366,
-3.049056, -3.1545, -5.672344,
-3.049056, -3.1545, 4.870366,
-3.049056, 3.279218, -5.672344,
-3.049056, 3.279218, 4.870366,
-3.049056, -3.1545, -5.672344,
3.342103, -3.1545, -5.672344,
-3.049056, -3.1545, 4.870366,
3.342103, -3.1545, 4.870366,
-3.049056, 3.279218, -5.672344,
3.342103, 3.279218, -5.672344,
-3.049056, 3.279218, 4.870366,
3.342103, 3.279218, 4.870366,
3.342103, -3.1545, -5.672344,
3.342103, 3.279218, -5.672344,
3.342103, -3.1545, 4.870366,
3.342103, 3.279218, 4.870366,
3.342103, -3.1545, -5.672344,
3.342103, -3.1545, 4.870366,
3.342103, 3.279218, -5.672344,
3.342103, 3.279218, 4.870366
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
var radius = 7.425756;
var distance = 33.03803;
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
mvMatrix.translate( -0.1465238, -0.06235909, 0.4009888 );
mvMatrix.scale( 1.256247, 1.247937, 0.7615568 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.03803);
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
Phosmet<-read.table("Phosmet.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Phosmet$V2
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
```

```r
y<-Phosmet$V3
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
```

```r
z<-Phosmet$V4
```

```
## Error in eval(expr, envir, enclos): object 'Phosmet' not found
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
-2.955981, -1.22295, -2.505735, 0, 0, 1, 1, 1,
-2.793507, 0.06870841, -1.718512, 1, 0, 0, 1, 1,
-2.634968, -0.5028544, -0.4600669, 1, 0, 0, 1, 1,
-2.544824, 0.8769927, -1.360381, 1, 0, 0, 1, 1,
-2.435376, 0.1380892, -0.1207532, 1, 0, 0, 1, 1,
-2.423468, 1.833104, -0.8131003, 1, 0, 0, 1, 1,
-2.3117, -0.4700303, -2.945989, 0, 0, 0, 1, 1,
-2.253324, 0.3024476, -1.023176, 0, 0, 0, 1, 1,
-2.209949, 0.08011122, -0.1764615, 0, 0, 0, 1, 1,
-2.159783, 1.19514, -0.8922375, 0, 0, 0, 1, 1,
-2.146178, -0.831756, -0.5064673, 0, 0, 0, 1, 1,
-2.072436, -1.944252, -2.250979, 0, 0, 0, 1, 1,
-2.038248, 0.3180183, -2.239269, 0, 0, 0, 1, 1,
-2.031644, -0.6220077, -2.055154, 1, 1, 1, 1, 1,
-2.017586, 1.284861, -1.219509, 1, 1, 1, 1, 1,
-2.007129, -0.4181022, -2.016443, 1, 1, 1, 1, 1,
-1.954201, 0.708581, 0.07439737, 1, 1, 1, 1, 1,
-1.947635, 2.003096, -3.097447, 1, 1, 1, 1, 1,
-1.933056, 2.466321, -1.318018, 1, 1, 1, 1, 1,
-1.90923, -0.6179935, -2.983248, 1, 1, 1, 1, 1,
-1.890201, -0.86019, -2.85508, 1, 1, 1, 1, 1,
-1.888916, 0.4130378, -1.857983, 1, 1, 1, 1, 1,
-1.86195, -0.9045167, -0.4261532, 1, 1, 1, 1, 1,
-1.84191, 0.7612666, -0.830325, 1, 1, 1, 1, 1,
-1.83412, 1.172756, -1.728415, 1, 1, 1, 1, 1,
-1.81327, 0.8978537, 1.065977, 1, 1, 1, 1, 1,
-1.805973, 1.231007, -2.616221, 1, 1, 1, 1, 1,
-1.738959, 0.06397485, -0.6137815, 1, 1, 1, 1, 1,
-1.727279, -1.403242, -0.8686879, 0, 0, 1, 1, 1,
-1.699181, -0.2595813, -1.32065, 1, 0, 0, 1, 1,
-1.677885, 0.2031393, -2.729413, 1, 0, 0, 1, 1,
-1.657915, 1.31271, 0.344033, 1, 0, 0, 1, 1,
-1.643407, 0.2039073, -0.2629835, 1, 0, 0, 1, 1,
-1.636307, 1.469319, -1.835182, 1, 0, 0, 1, 1,
-1.623068, 0.190505, -1.308756, 0, 0, 0, 1, 1,
-1.621391, 1.203885, -1.952902, 0, 0, 0, 1, 1,
-1.611243, 0.07055485, -1.404165, 0, 0, 0, 1, 1,
-1.605356, -1.062637, -2.803091, 0, 0, 0, 1, 1,
-1.604604, -1.753454, -3.90851, 0, 0, 0, 1, 1,
-1.600417, -0.1397716, -2.21253, 0, 0, 0, 1, 1,
-1.587507, 0.2758809, -0.7829615, 0, 0, 0, 1, 1,
-1.586396, 1.180604, -0.1216596, 1, 1, 1, 1, 1,
-1.585003, -0.6891468, -2.616691, 1, 1, 1, 1, 1,
-1.583664, 0.1912351, -0.8941113, 1, 1, 1, 1, 1,
-1.572259, 1.484195, -1.44817, 1, 1, 1, 1, 1,
-1.568053, -0.4695005, -1.924814, 1, 1, 1, 1, 1,
-1.549731, 0.6398169, -3.101827, 1, 1, 1, 1, 1,
-1.549249, 0.4023545, -0.8812499, 1, 1, 1, 1, 1,
-1.54501, 0.02146995, -1.515319, 1, 1, 1, 1, 1,
-1.536634, -0.6007222, -0.4415367, 1, 1, 1, 1, 1,
-1.535479, 0.03871506, -0.5985019, 1, 1, 1, 1, 1,
-1.524319, -0.2140164, -1.337449, 1, 1, 1, 1, 1,
-1.518086, 0.8193242, -0.6893358, 1, 1, 1, 1, 1,
-1.515581, 0.6388197, 1.226932, 1, 1, 1, 1, 1,
-1.509718, -0.01250176, -0.5927145, 1, 1, 1, 1, 1,
-1.500806, 0.006564363, -2.58044, 1, 1, 1, 1, 1,
-1.496714, -1.296979, -3.331603, 0, 0, 1, 1, 1,
-1.492765, -0.9567904, -3.18764, 1, 0, 0, 1, 1,
-1.485108, 0.2464655, -2.102549, 1, 0, 0, 1, 1,
-1.480613, 0.1954832, -1.795252, 1, 0, 0, 1, 1,
-1.469575, -0.5590765, -3.024314, 1, 0, 0, 1, 1,
-1.467983, -1.171648, -0.9250996, 1, 0, 0, 1, 1,
-1.458554, 0.5398173, -3.414519, 0, 0, 0, 1, 1,
-1.447106, -0.9889458, -3.043771, 0, 0, 0, 1, 1,
-1.442217, -0.9743026, -1.69942, 0, 0, 0, 1, 1,
-1.439573, -1.107964, 0.586425, 0, 0, 0, 1, 1,
-1.438874, 1.546314, -2.102426, 0, 0, 0, 1, 1,
-1.438865, -0.9184738, -2.22211, 0, 0, 0, 1, 1,
-1.433261, 0.5875438, -1.16398, 0, 0, 0, 1, 1,
-1.428527, -1.085498, -2.611764, 1, 1, 1, 1, 1,
-1.42693, 0.08966868, -3.087669, 1, 1, 1, 1, 1,
-1.419996, -0.07611927, -2.212955, 1, 1, 1, 1, 1,
-1.412684, 0.09499291, -0.318614, 1, 1, 1, 1, 1,
-1.410098, 1.294191, -1.604098, 1, 1, 1, 1, 1,
-1.396992, -0.8790256, -3.413247, 1, 1, 1, 1, 1,
-1.378392, -0.1428675, -4.185218, 1, 1, 1, 1, 1,
-1.377099, -1.343006, -2.6487, 1, 1, 1, 1, 1,
-1.374443, -0.4660993, -2.51862, 1, 1, 1, 1, 1,
-1.370911, -0.004123004, -2.818846, 1, 1, 1, 1, 1,
-1.370159, -1.295529, -0.9977253, 1, 1, 1, 1, 1,
-1.368188, 0.1957207, -0.6225902, 1, 1, 1, 1, 1,
-1.367059, 0.6488897, -1.750905, 1, 1, 1, 1, 1,
-1.365421, 1.46246, -0.09694537, 1, 1, 1, 1, 1,
-1.348619, -0.1501374, -1.57188, 1, 1, 1, 1, 1,
-1.343229, 1.220724, -0.109474, 0, 0, 1, 1, 1,
-1.342865, -1.204523, -2.471358, 1, 0, 0, 1, 1,
-1.34073, -0.1666734, -1.914184, 1, 0, 0, 1, 1,
-1.331755, -0.3856902, -0.7415334, 1, 0, 0, 1, 1,
-1.323071, -0.3035596, -2.240906, 1, 0, 0, 1, 1,
-1.318468, -1.225992, -1.511419, 1, 0, 0, 1, 1,
-1.315778, -0.02876655, -0.4756731, 0, 0, 0, 1, 1,
-1.312658, 0.7908171, -1.284568, 0, 0, 0, 1, 1,
-1.310086, 0.5814681, -0.001337529, 0, 0, 0, 1, 1,
-1.303842, 0.5730197, -0.9495579, 0, 0, 0, 1, 1,
-1.296615, -1.043316, -2.583296, 0, 0, 0, 1, 1,
-1.278554, -0.955423, -2.040126, 0, 0, 0, 1, 1,
-1.276485, -0.5106707, -1.302776, 0, 0, 0, 1, 1,
-1.26589, -0.3897061, -2.610346, 1, 1, 1, 1, 1,
-1.264959, -0.5463311, -2.122439, 1, 1, 1, 1, 1,
-1.262229, 1.22995, -1.19849, 1, 1, 1, 1, 1,
-1.256119, -1.863025, -1.853694, 1, 1, 1, 1, 1,
-1.252476, -0.5904427, -1.517243, 1, 1, 1, 1, 1,
-1.251011, 1.304498, -1.397656, 1, 1, 1, 1, 1,
-1.246702, 0.3879805, -0.9904543, 1, 1, 1, 1, 1,
-1.243534, 0.9722046, -1.601475, 1, 1, 1, 1, 1,
-1.237922, 0.2628953, -0.705294, 1, 1, 1, 1, 1,
-1.235257, 2.103203, -1.318554, 1, 1, 1, 1, 1,
-1.230047, -0.5819082, -1.899013, 1, 1, 1, 1, 1,
-1.229214, 0.3759743, 0.1149503, 1, 1, 1, 1, 1,
-1.225726, 0.4001651, 1.538301, 1, 1, 1, 1, 1,
-1.223989, 0.02096746, -0.6935938, 1, 1, 1, 1, 1,
-1.220329, 1.011788, -1.050447, 1, 1, 1, 1, 1,
-1.218681, 0.1609228, -1.899569, 0, 0, 1, 1, 1,
-1.216429, 0.9013792, 0.9793277, 1, 0, 0, 1, 1,
-1.206542, 1.462528, 0.3226488, 1, 0, 0, 1, 1,
-1.18483, 1.656656, -0.8662025, 1, 0, 0, 1, 1,
-1.182004, -0.03635338, -1.807688, 1, 0, 0, 1, 1,
-1.171146, 0.09353995, 0.07437439, 1, 0, 0, 1, 1,
-1.168826, 0.2483128, -1.803076, 0, 0, 0, 1, 1,
-1.156853, -2.023949, -4.535047, 0, 0, 0, 1, 1,
-1.155305, 1.069879, -0.3137192, 0, 0, 0, 1, 1,
-1.147295, 0.650855, -1.55437, 0, 0, 0, 1, 1,
-1.141212, -1.139815, -1.938045, 0, 0, 0, 1, 1,
-1.141182, 0.5155396, -0.7234887, 0, 0, 0, 1, 1,
-1.134061, 0.5657874, -1.192142, 0, 0, 0, 1, 1,
-1.120559, -0.2880946, -1.573839, 1, 1, 1, 1, 1,
-1.115929, 1.072648, 0.3248825, 1, 1, 1, 1, 1,
-1.10817, 1.756675, -1.265852, 1, 1, 1, 1, 1,
-1.107664, -0.3867191, -2.681439, 1, 1, 1, 1, 1,
-1.10252, 0.01080747, -1.793798, 1, 1, 1, 1, 1,
-1.102028, 0.6410303, -1.216359, 1, 1, 1, 1, 1,
-1.101452, 0.4759934, -0.3684292, 1, 1, 1, 1, 1,
-1.092393, 1.390186, 1.593841, 1, 1, 1, 1, 1,
-1.090275, 0.2421034, 0.3264874, 1, 1, 1, 1, 1,
-1.069193, -0.4783842, -2.542642, 1, 1, 1, 1, 1,
-1.062437, 0.07738674, -4.059332, 1, 1, 1, 1, 1,
-1.061852, 0.1242663, 0.2573141, 1, 1, 1, 1, 1,
-1.053719, -1.055673, -3.888766, 1, 1, 1, 1, 1,
-1.051603, -0.8163742, -4.021815, 1, 1, 1, 1, 1,
-1.05158, 0.4168102, -2.25584, 1, 1, 1, 1, 1,
-1.04445, -0.05187964, -1.086324, 0, 0, 1, 1, 1,
-1.041676, -0.03672387, -0.6529193, 1, 0, 0, 1, 1,
-1.03738, -1.332934, -2.016616, 1, 0, 0, 1, 1,
-1.034459, -0.5741981, -3.830713, 1, 0, 0, 1, 1,
-1.02524, 0.1336524, -0.8245406, 1, 0, 0, 1, 1,
-1.017918, -0.3010682, -1.468783, 1, 0, 0, 1, 1,
-1.016609, -0.7239295, -2.38223, 0, 0, 0, 1, 1,
-1.013154, -1.033284, -1.476934, 0, 0, 0, 1, 1,
-1.012577, 1.885914, -0.1800446, 0, 0, 0, 1, 1,
-1.006814, -0.8999714, -2.612904, 0, 0, 0, 1, 1,
-1.006176, -0.2881843, -1.966856, 0, 0, 0, 1, 1,
-0.99218, 0.606251, -1.087439, 0, 0, 0, 1, 1,
-0.9869151, -0.6737644, -3.267444, 0, 0, 0, 1, 1,
-0.9859543, 0.6090644, -1.571506, 1, 1, 1, 1, 1,
-0.9855007, -0.447749, -2.466689, 1, 1, 1, 1, 1,
-0.9818721, 0.08687628, -1.303877, 1, 1, 1, 1, 1,
-0.9772921, -0.2692858, -1.216622, 1, 1, 1, 1, 1,
-0.9691522, 0.8181807, -1.859624, 1, 1, 1, 1, 1,
-0.9610417, 0.4415928, -2.148513, 1, 1, 1, 1, 1,
-0.9605926, 0.7253624, -1.676244, 1, 1, 1, 1, 1,
-0.9579777, 1.228052, -1.709149, 1, 1, 1, 1, 1,
-0.9519899, 0.04581787, -2.307025, 1, 1, 1, 1, 1,
-0.9486296, 0.2344466, -2.098949, 1, 1, 1, 1, 1,
-0.9394169, 0.6372908, -1.791925, 1, 1, 1, 1, 1,
-0.939252, -0.2831466, -2.031989, 1, 1, 1, 1, 1,
-0.9371994, 0.1807879, -1.150434, 1, 1, 1, 1, 1,
-0.9344889, -0.9107019, -3.647567, 1, 1, 1, 1, 1,
-0.9319504, 0.8615056, -0.3493774, 1, 1, 1, 1, 1,
-0.9287091, -1.568608, -2.205416, 0, 0, 1, 1, 1,
-0.9246442, 2.162512, -0.471126, 1, 0, 0, 1, 1,
-0.9232768, -1.249995, -1.834754, 1, 0, 0, 1, 1,
-0.920644, -0.3428569, -3.085189, 1, 0, 0, 1, 1,
-0.9184329, -0.02406915, -2.836392, 1, 0, 0, 1, 1,
-0.9178357, -0.7571217, -4.144281, 1, 0, 0, 1, 1,
-0.9096053, -0.4094123, -2.562498, 0, 0, 0, 1, 1,
-0.9071783, 0.6002549, 0.03406022, 0, 0, 0, 1, 1,
-0.9040007, -0.3357655, -2.474755, 0, 0, 0, 1, 1,
-0.9004908, 0.6512147, -2.716357, 0, 0, 0, 1, 1,
-0.9000345, -0.6594781, -1.708304, 0, 0, 0, 1, 1,
-0.896152, 1.54068, -1.137019, 0, 0, 0, 1, 1,
-0.8849069, -0.3538249, -3.533689, 0, 0, 0, 1, 1,
-0.879343, 0.2015099, -1.193502, 1, 1, 1, 1, 1,
-0.8774849, -1.971515, -1.733133, 1, 1, 1, 1, 1,
-0.8729218, 0.6827489, -2.765121, 1, 1, 1, 1, 1,
-0.8717867, -0.2296014, -3.125831, 1, 1, 1, 1, 1,
-0.8710685, -0.0573724, -2.988163, 1, 1, 1, 1, 1,
-0.8658246, 1.547274, -0.2230911, 1, 1, 1, 1, 1,
-0.8657061, 1.239562, -0.7886655, 1, 1, 1, 1, 1,
-0.8602036, 1.289354, -0.9910614, 1, 1, 1, 1, 1,
-0.8599778, -1.157673, -2.108613, 1, 1, 1, 1, 1,
-0.8595987, -0.1761547, -0.7684975, 1, 1, 1, 1, 1,
-0.8517454, 0.2374915, 0.7454626, 1, 1, 1, 1, 1,
-0.8461382, 1.426086, -0.5602384, 1, 1, 1, 1, 1,
-0.8433644, 0.8025229, -0.05446925, 1, 1, 1, 1, 1,
-0.8423103, -2.019541, -1.283884, 1, 1, 1, 1, 1,
-0.8405856, 1.289297, -1.180066, 1, 1, 1, 1, 1,
-0.8393585, -0.3238945, -1.386756, 0, 0, 1, 1, 1,
-0.8325152, -0.8721296, -3.379355, 1, 0, 0, 1, 1,
-0.8267795, -1.059299, -1.429242, 1, 0, 0, 1, 1,
-0.8193097, -0.5396087, -2.615046, 1, 0, 0, 1, 1,
-0.8186241, 1.415951, 0.2809973, 1, 0, 0, 1, 1,
-0.8047058, -0.3486777, -3.378726, 1, 0, 0, 1, 1,
-0.7995332, -2.365524, -2.482852, 0, 0, 0, 1, 1,
-0.7987671, -2.860613, -2.182294, 0, 0, 0, 1, 1,
-0.7965395, -0.2219666, -1.722972, 0, 0, 0, 1, 1,
-0.7944996, 0.4866086, -2.454726, 0, 0, 0, 1, 1,
-0.7881598, 0.2847825, 0.5502826, 0, 0, 0, 1, 1,
-0.7752676, 0.1563489, -0.9855902, 0, 0, 0, 1, 1,
-0.7744663, 1.102128, -1.526214, 0, 0, 0, 1, 1,
-0.7728875, -0.2807475, -1.736827, 1, 1, 1, 1, 1,
-0.7713116, -0.1414407, -1.745824, 1, 1, 1, 1, 1,
-0.7653995, 0.08664612, -4.338571, 1, 1, 1, 1, 1,
-0.757255, -1.638723, -2.017645, 1, 1, 1, 1, 1,
-0.7537082, 2.06843, 0.3476798, 1, 1, 1, 1, 1,
-0.7536092, -1.595178, -2.337297, 1, 1, 1, 1, 1,
-0.7514046, -1.048087, -2.439842, 1, 1, 1, 1, 1,
-0.7504261, -0.6845281, -4.246467, 1, 1, 1, 1, 1,
-0.7492594, 0.3024758, 0.1206501, 1, 1, 1, 1, 1,
-0.743132, -0.3854243, -1.648358, 1, 1, 1, 1, 1,
-0.7311488, -1.066581, -2.191079, 1, 1, 1, 1, 1,
-0.7297696, 0.3921237, -0.5726659, 1, 1, 1, 1, 1,
-0.7235518, -1.487697, -0.465754, 1, 1, 1, 1, 1,
-0.7221447, 0.0956568, -0.8697776, 1, 1, 1, 1, 1,
-0.7205804, -1.165933, -2.335168, 1, 1, 1, 1, 1,
-0.7197922, -0.5569033, -2.179241, 0, 0, 1, 1, 1,
-0.7104446, -0.2245012, 0.1546483, 1, 0, 0, 1, 1,
-0.7104174, 0.4999699, -1.640568, 1, 0, 0, 1, 1,
-0.7070284, -2.161231, -2.249887, 1, 0, 0, 1, 1,
-0.7063458, 1.480571, 0.5742366, 1, 0, 0, 1, 1,
-0.7011776, -0.407289, -2.92081, 1, 0, 0, 1, 1,
-0.6930754, 0.604619, 0.4887612, 0, 0, 0, 1, 1,
-0.6924884, 0.5087292, -0.4200431, 0, 0, 0, 1, 1,
-0.6911486, -1.064603, -2.497726, 0, 0, 0, 1, 1,
-0.6911425, -0.5161931, -1.80771, 0, 0, 0, 1, 1,
-0.6801466, -0.1028505, -3.097025, 0, 0, 0, 1, 1,
-0.6795289, -0.9042631, -4.03318, 0, 0, 0, 1, 1,
-0.6787983, 0.1521774, -3.309238, 0, 0, 0, 1, 1,
-0.678067, -0.2581193, -1.026386, 1, 1, 1, 1, 1,
-0.6747515, 1.699132, -0.7246788, 1, 1, 1, 1, 1,
-0.6745656, 0.1782982, -1.601736, 1, 1, 1, 1, 1,
-0.6676612, -0.003196385, -0.389621, 1, 1, 1, 1, 1,
-0.6622816, 0.1769045, -2.66609, 1, 1, 1, 1, 1,
-0.6599711, -1.178199, -2.723269, 1, 1, 1, 1, 1,
-0.6540244, 1.992421, -1.767932, 1, 1, 1, 1, 1,
-0.6489411, 0.1427056, 0.06176071, 1, 1, 1, 1, 1,
-0.6343466, 0.3458874, -1.008552, 1, 1, 1, 1, 1,
-0.6283395, -0.7393387, -3.340517, 1, 1, 1, 1, 1,
-0.62638, 1.663759, -0.8262398, 1, 1, 1, 1, 1,
-0.6261827, 0.09963503, -2.323666, 1, 1, 1, 1, 1,
-0.6253076, -1.215358, -1.859684, 1, 1, 1, 1, 1,
-0.616995, -1.587172, -3.408314, 1, 1, 1, 1, 1,
-0.6157665, 0.1503874, -1.251056, 1, 1, 1, 1, 1,
-0.6148037, -0.3521256, -3.403934, 0, 0, 1, 1, 1,
-0.6136897, 0.6406466, -1.623265, 1, 0, 0, 1, 1,
-0.6117989, 1.180644, 0.5013242, 1, 0, 0, 1, 1,
-0.6104413, -0.7143648, -3.765132, 1, 0, 0, 1, 1,
-0.6050204, -1.371794, -2.210489, 1, 0, 0, 1, 1,
-0.6037208, 1.83997, 0.7818484, 1, 0, 0, 1, 1,
-0.6022289, 0.8151707, 0.4670686, 0, 0, 0, 1, 1,
-0.600304, -0.5123872, -3.597073, 0, 0, 0, 1, 1,
-0.5959707, 0.3940654, 0.1690664, 0, 0, 0, 1, 1,
-0.5951496, -1.930242, -2.476443, 0, 0, 0, 1, 1,
-0.5947874, -0.4111925, -3.800282, 0, 0, 0, 1, 1,
-0.5931784, 0.4324225, 0.9562582, 0, 0, 0, 1, 1,
-0.5918037, -0.6626626, -3.244104, 0, 0, 0, 1, 1,
-0.5888466, 1.131404, -1.59883, 1, 1, 1, 1, 1,
-0.5864552, 0.1706605, -3.054225, 1, 1, 1, 1, 1,
-0.5849921, 0.9603161, -1.916715, 1, 1, 1, 1, 1,
-0.5841761, -0.8545156, -3.108675, 1, 1, 1, 1, 1,
-0.5768611, 1.375522, -0.7141638, 1, 1, 1, 1, 1,
-0.5763976, -0.3898864, -2.269505, 1, 1, 1, 1, 1,
-0.5761561, -1.435135, -1.948509, 1, 1, 1, 1, 1,
-0.5740619, 1.819674, 0.03423632, 1, 1, 1, 1, 1,
-0.5739502, 0.8481884, -0.2817586, 1, 1, 1, 1, 1,
-0.5722108, 0.5012703, -2.363009, 1, 1, 1, 1, 1,
-0.5720066, -0.7912974, -4.189133, 1, 1, 1, 1, 1,
-0.5698202, 0.04894181, -0.8342999, 1, 1, 1, 1, 1,
-0.5683642, -0.3059673, -1.840905, 1, 1, 1, 1, 1,
-0.564898, 0.7262792, 0.3618753, 1, 1, 1, 1, 1,
-0.5632116, -0.7370528, -4.443482, 1, 1, 1, 1, 1,
-0.5626564, -0.4560193, -1.424284, 0, 0, 1, 1, 1,
-0.5577977, -0.0726477, -0.9759417, 1, 0, 0, 1, 1,
-0.5500568, -0.6606788, -3.665792, 1, 0, 0, 1, 1,
-0.5466644, 0.00207772, -1.656765, 1, 0, 0, 1, 1,
-0.5435684, -0.2260386, -2.834028, 1, 0, 0, 1, 1,
-0.5420818, -1.133028, -2.472914, 1, 0, 0, 1, 1,
-0.5390268, -0.9618865, -1.846426, 0, 0, 0, 1, 1,
-0.535951, -0.2629755, -2.504101, 0, 0, 0, 1, 1,
-0.5356838, -1.620717, -5.518809, 0, 0, 0, 1, 1,
-0.5325909, 0.6079007, -1.571053, 0, 0, 0, 1, 1,
-0.5311608, 2.29029, 1.208196, 0, 0, 0, 1, 1,
-0.5266371, -0.8619, -2.999801, 0, 0, 0, 1, 1,
-0.5189955, -0.4895598, -1.831242, 0, 0, 0, 1, 1,
-0.5185633, 0.8385375, -1.346251, 1, 1, 1, 1, 1,
-0.5161271, 0.9772893, 0.2922022, 1, 1, 1, 1, 1,
-0.5139336, -0.1666794, -1.832444, 1, 1, 1, 1, 1,
-0.5115066, 0.3782961, 0.1169, 1, 1, 1, 1, 1,
-0.4977597, 0.5113689, -0.3708661, 1, 1, 1, 1, 1,
-0.4976845, 1.458776, 0.33274, 1, 1, 1, 1, 1,
-0.4976177, -0.3194443, -4.029768, 1, 1, 1, 1, 1,
-0.4971417, 1.423405, 1.149348, 1, 1, 1, 1, 1,
-0.496774, -0.2918882, -1.015815, 1, 1, 1, 1, 1,
-0.4919915, -0.5110089, -2.24341, 1, 1, 1, 1, 1,
-0.4919431, -0.6793307, -3.559609, 1, 1, 1, 1, 1,
-0.4900919, -1.6454, -2.242069, 1, 1, 1, 1, 1,
-0.4873219, 0.2489698, -0.8275777, 1, 1, 1, 1, 1,
-0.4831355, -1.14998, -1.670287, 1, 1, 1, 1, 1,
-0.4780644, -1.933832, -3.300181, 1, 1, 1, 1, 1,
-0.4775267, -1.591317, -4.613074, 0, 0, 1, 1, 1,
-0.4755672, 0.7412248, -1.314425, 1, 0, 0, 1, 1,
-0.474397, 0.03533474, -2.035819, 1, 0, 0, 1, 1,
-0.4730221, -1.031936, -4.715882, 1, 0, 0, 1, 1,
-0.4727278, -0.2891736, -0.9223521, 1, 0, 0, 1, 1,
-0.4631513, -0.5904146, -2.898895, 1, 0, 0, 1, 1,
-0.4592942, -0.7853751, -3.731511, 0, 0, 0, 1, 1,
-0.4589717, 2.156461, -0.1668689, 0, 0, 0, 1, 1,
-0.4567491, 0.6657371, -0.3080856, 0, 0, 0, 1, 1,
-0.4554489, 1.282925, 0.3605814, 0, 0, 0, 1, 1,
-0.4552589, -0.8422841, -1.96075, 0, 0, 0, 1, 1,
-0.4501036, 1.068448, -1.060337, 0, 0, 0, 1, 1,
-0.4479809, -0.5648208, -1.705811, 0, 0, 0, 1, 1,
-0.4477429, -0.9147996, -1.856416, 1, 1, 1, 1, 1,
-0.4460166, -0.9753728, -2.020143, 1, 1, 1, 1, 1,
-0.4446316, 0.4770585, -0.8595304, 1, 1, 1, 1, 1,
-0.440857, -1.864994, -3.0652, 1, 1, 1, 1, 1,
-0.4288943, -1.235038, -4.181996, 1, 1, 1, 1, 1,
-0.4272656, -0.4022551, -3.244782, 1, 1, 1, 1, 1,
-0.4224495, -0.1609037, -2.582028, 1, 1, 1, 1, 1,
-0.4221565, -1.760666, -2.094632, 1, 1, 1, 1, 1,
-0.4185712, 0.08263442, -1.310471, 1, 1, 1, 1, 1,
-0.418268, -1.270303, -3.139143, 1, 1, 1, 1, 1,
-0.4113493, -0.1989575, -1.344408, 1, 1, 1, 1, 1,
-0.4076025, -0.23102, -2.930074, 1, 1, 1, 1, 1,
-0.406617, -1.422071, -4.018399, 1, 1, 1, 1, 1,
-0.4047635, 0.7223255, -1.309904, 1, 1, 1, 1, 1,
-0.4013406, -0.4282264, -1.562376, 1, 1, 1, 1, 1,
-0.4011007, -0.4695151, -1.46437, 0, 0, 1, 1, 1,
-0.4008194, -0.4549075, -3.952356, 1, 0, 0, 1, 1,
-0.3951743, 0.1674164, 0.227111, 1, 0, 0, 1, 1,
-0.3897047, 1.151731, -1.322222, 1, 0, 0, 1, 1,
-0.3851107, -1.185915, -3.56861, 1, 0, 0, 1, 1,
-0.3776692, -0.7783478, -2.638739, 1, 0, 0, 1, 1,
-0.3733892, 0.1682711, 0.09841075, 0, 0, 0, 1, 1,
-0.3731298, 0.2315877, -0.5920048, 0, 0, 0, 1, 1,
-0.3663471, -0.2262156, -2.685985, 0, 0, 0, 1, 1,
-0.3638021, -0.1917221, -3.972726, 0, 0, 0, 1, 1,
-0.3628291, -2.293878, -4.12116, 0, 0, 0, 1, 1,
-0.3612646, -0.2954472, -0.2447409, 0, 0, 0, 1, 1,
-0.3590945, 1.008827, -0.8922707, 0, 0, 0, 1, 1,
-0.3491832, -0.519442, -2.308602, 1, 1, 1, 1, 1,
-0.3486744, 0.4317764, -1.424969, 1, 1, 1, 1, 1,
-0.3470081, -0.003201928, -1.951488, 1, 1, 1, 1, 1,
-0.346599, -1.830764, -4.896314, 1, 1, 1, 1, 1,
-0.3449315, 1.654158, 0.1202952, 1, 1, 1, 1, 1,
-0.34419, -1.388068, -1.746735, 1, 1, 1, 1, 1,
-0.3414105, -0.2160372, -1.753029, 1, 1, 1, 1, 1,
-0.3406096, 0.4561056, 0.08741048, 1, 1, 1, 1, 1,
-0.3401569, 0.11306, -1.448942, 1, 1, 1, 1, 1,
-0.3389554, -0.3143091, -1.249652, 1, 1, 1, 1, 1,
-0.3387285, -0.0002435096, -2.331222, 1, 1, 1, 1, 1,
-0.3364665, -0.8103961, -2.959479, 1, 1, 1, 1, 1,
-0.3341416, -0.5059835, -1.503266, 1, 1, 1, 1, 1,
-0.3296858, 1.118286, 1.492083, 1, 1, 1, 1, 1,
-0.3279878, 0.1425655, -2.055918, 1, 1, 1, 1, 1,
-0.3276306, 0.5109471, 1.095574, 0, 0, 1, 1, 1,
-0.3273599, 0.1324752, -1.734768, 1, 0, 0, 1, 1,
-0.3264991, 0.04081209, -0.8405126, 1, 0, 0, 1, 1,
-0.3252754, -1.19126, -2.674266, 1, 0, 0, 1, 1,
-0.3247293, 0.525458, -0.6596794, 1, 0, 0, 1, 1,
-0.3213288, 0.3591914, -1.554753, 1, 0, 0, 1, 1,
-0.3174323, -0.3189421, -3.008764, 0, 0, 0, 1, 1,
-0.3108826, 1.075107, 0.7816451, 0, 0, 0, 1, 1,
-0.3054302, 0.4369109, 2.33145, 0, 0, 0, 1, 1,
-0.3033657, -0.8422199, -1.297117, 0, 0, 0, 1, 1,
-0.302742, 2.129381, 0.6894369, 0, 0, 0, 1, 1,
-0.2991027, -0.3041468, -5.004397, 0, 0, 0, 1, 1,
-0.2989137, 0.1593693, -1.124043, 0, 0, 0, 1, 1,
-0.2959095, -1.129568, -2.852058, 1, 1, 1, 1, 1,
-0.295829, -1.514717, -2.615013, 1, 1, 1, 1, 1,
-0.2957532, 0.1809458, -0.4677174, 1, 1, 1, 1, 1,
-0.2948361, 0.5284396, -2.153688, 1, 1, 1, 1, 1,
-0.2940274, 0.1938058, -2.199494, 1, 1, 1, 1, 1,
-0.2937035, -0.4103419, -2.435335, 1, 1, 1, 1, 1,
-0.2813705, -1.67455, -1.297773, 1, 1, 1, 1, 1,
-0.2810509, -0.1693923, 0.6408585, 1, 1, 1, 1, 1,
-0.2778616, -0.4266392, -3.335938, 1, 1, 1, 1, 1,
-0.2733054, 1.306232, -1.339995, 1, 1, 1, 1, 1,
-0.2723631, 0.8059877, 0.0314736, 1, 1, 1, 1, 1,
-0.2714587, -0.2704743, -1.219594, 1, 1, 1, 1, 1,
-0.2678489, 1.204633, -1.040742, 1, 1, 1, 1, 1,
-0.267785, -0.2026057, -2.740381, 1, 1, 1, 1, 1,
-0.2673037, -0.2377071, -0.3724813, 1, 1, 1, 1, 1,
-0.2635537, 0.4914674, -0.5053974, 0, 0, 1, 1, 1,
-0.2619832, -0.7209694, -0.08291087, 1, 0, 0, 1, 1,
-0.2579974, -0.4028996, -3.935542, 1, 0, 0, 1, 1,
-0.2555325, 0.5175396, 0.1226702, 1, 0, 0, 1, 1,
-0.2548219, -0.6220423, -1.709268, 1, 0, 0, 1, 1,
-0.253234, -0.2366169, -3.478093, 1, 0, 0, 1, 1,
-0.2523029, 0.5324892, -0.3594449, 0, 0, 0, 1, 1,
-0.2508743, 0.7282762, -0.3659563, 0, 0, 0, 1, 1,
-0.2491674, 0.4689527, -0.1460799, 0, 0, 0, 1, 1,
-0.2484784, 0.032043, -2.076272, 0, 0, 0, 1, 1,
-0.2481074, 0.3370495, -1.646185, 0, 0, 0, 1, 1,
-0.246647, 0.7695566, -0.4569272, 0, 0, 0, 1, 1,
-0.2460215, -0.463331, -3.866631, 0, 0, 0, 1, 1,
-0.243972, 1.259917, -1.165327, 1, 1, 1, 1, 1,
-0.2434473, 1.4744, -0.970444, 1, 1, 1, 1, 1,
-0.2419572, 1.043411, -0.5712714, 1, 1, 1, 1, 1,
-0.2419138, 0.2390891, -2.105123, 1, 1, 1, 1, 1,
-0.2402362, 0.2529152, -2.057329, 1, 1, 1, 1, 1,
-0.2400174, 0.4062215, 0.4838279, 1, 1, 1, 1, 1,
-0.2370083, 0.5646934, 0.53369, 1, 1, 1, 1, 1,
-0.2333115, 1.816382, -1.300647, 1, 1, 1, 1, 1,
-0.2331198, -0.8834779, -2.562048, 1, 1, 1, 1, 1,
-0.2326377, -2.093233, -2.524839, 1, 1, 1, 1, 1,
-0.23258, 0.65126, 0.7203589, 1, 1, 1, 1, 1,
-0.2299606, -0.8562354, -2.863074, 1, 1, 1, 1, 1,
-0.2264617, -0.07185677, -1.255335, 1, 1, 1, 1, 1,
-0.2237786, 0.1416482, -3.295717, 1, 1, 1, 1, 1,
-0.2215643, 2.443166, 0.8471499, 1, 1, 1, 1, 1,
-0.2176762, -0.6217753, -4.139421, 0, 0, 1, 1, 1,
-0.2148821, -0.4724502, -3.664142, 1, 0, 0, 1, 1,
-0.2124026, -0.621759, -4.453081, 1, 0, 0, 1, 1,
-0.208735, 1.21817, 1.799024, 1, 0, 0, 1, 1,
-0.2016913, 2.517181, -0.3229323, 1, 0, 0, 1, 1,
-0.1966439, -0.9395145, -1.784583, 1, 0, 0, 1, 1,
-0.1961455, 0.2802253, -0.9906623, 0, 0, 0, 1, 1,
-0.1868911, -1.702037, -2.470182, 0, 0, 0, 1, 1,
-0.1861521, 1.211546, 1.000129, 0, 0, 0, 1, 1,
-0.185714, 2.595557, -0.1424292, 0, 0, 0, 1, 1,
-0.1841094, -0.217892, -0.5832049, 0, 0, 0, 1, 1,
-0.1758281, -1.205287, -4.045051, 0, 0, 0, 1, 1,
-0.1723199, -0.03563913, -0.2094292, 0, 0, 0, 1, 1,
-0.1684541, -0.3084647, -1.661863, 1, 1, 1, 1, 1,
-0.1652887, 1.177177, 0.960295, 1, 1, 1, 1, 1,
-0.1647562, 0.5253507, -0.1081776, 1, 1, 1, 1, 1,
-0.1633683, -0.3806807, -1.459106, 1, 1, 1, 1, 1,
-0.1629368, -0.1623181, -2.030975, 1, 1, 1, 1, 1,
-0.1609554, 1.408428, -0.09671284, 1, 1, 1, 1, 1,
-0.1554328, -0.1352325, -2.687035, 1, 1, 1, 1, 1,
-0.1546358, -1.329145, -1.57927, 1, 1, 1, 1, 1,
-0.1531904, 0.03197553, -0.3989593, 1, 1, 1, 1, 1,
-0.1507794, -0.02943898, -3.435789, 1, 1, 1, 1, 1,
-0.1506201, 1.811502, 0.7149391, 1, 1, 1, 1, 1,
-0.1476503, -0.9377206, -0.9678559, 1, 1, 1, 1, 1,
-0.1399744, 0.7111915, -0.6039491, 1, 1, 1, 1, 1,
-0.1390736, -1.017644, -2.271267, 1, 1, 1, 1, 1,
-0.1385195, 1.310645, -0.787887, 1, 1, 1, 1, 1,
-0.1373775, 0.7474665, -0.3427438, 0, 0, 1, 1, 1,
-0.1365176, -1.551061, -2.899141, 1, 0, 0, 1, 1,
-0.1355031, 2.5007, -2.411321, 1, 0, 0, 1, 1,
-0.1306105, -0.2259265, -3.345676, 1, 0, 0, 1, 1,
-0.1303319, -0.6748205, -4.341269, 1, 0, 0, 1, 1,
-0.1292971, 0.8165845, 0.6792557, 1, 0, 0, 1, 1,
-0.1223705, -0.4943884, -0.7775689, 0, 0, 0, 1, 1,
-0.1218744, -0.8052383, -1.966755, 0, 0, 0, 1, 1,
-0.1203005, -0.9723855, -3.824421, 0, 0, 0, 1, 1,
-0.1116587, -1.00589, -3.895484, 0, 0, 0, 1, 1,
-0.1098051, -0.6249831, -2.936406, 0, 0, 0, 1, 1,
-0.1072732, -1.516268, -3.506812, 0, 0, 0, 1, 1,
-0.1043899, 0.2818797, -1.557596, 0, 0, 0, 1, 1,
-0.1028791, 0.1487809, 0.3002605, 1, 1, 1, 1, 1,
-0.09804442, 0.468252, -0.3042294, 1, 1, 1, 1, 1,
-0.08608951, 1.372665, 0.08087976, 1, 1, 1, 1, 1,
-0.0826503, -1.313583, -4.698595, 1, 1, 1, 1, 1,
-0.08225457, -1.709055, -2.523598, 1, 1, 1, 1, 1,
-0.08207777, -1.152282, -3.818932, 1, 1, 1, 1, 1,
-0.07642005, 0.8957092, 2.442452, 1, 1, 1, 1, 1,
-0.07072357, -0.2063984, -3.625076, 1, 1, 1, 1, 1,
-0.06299964, 0.8674079, 0.6640077, 1, 1, 1, 1, 1,
-0.05960299, 0.6175045, 0.4090406, 1, 1, 1, 1, 1,
-0.05897951, 1.04808, 0.1277952, 1, 1, 1, 1, 1,
-0.05181455, 0.08160514, -0.7766551, 1, 1, 1, 1, 1,
-0.05027617, 1.196478, 0.8379815, 1, 1, 1, 1, 1,
-0.04419369, 0.09686372, -1.495004, 1, 1, 1, 1, 1,
-0.03594697, -0.02587781, -2.038269, 1, 1, 1, 1, 1,
-0.03480097, 0.2408706, 0.9341187, 0, 0, 1, 1, 1,
-0.03178792, 1.342721, 0.2682305, 1, 0, 0, 1, 1,
-0.03154945, 1.874331, 0.06633279, 1, 0, 0, 1, 1,
-0.02975319, 0.578037, -1.330054, 1, 0, 0, 1, 1,
-0.0266865, 0.6482167, 1.081435, 1, 0, 0, 1, 1,
-0.026202, -0.3261079, -3.816563, 1, 0, 0, 1, 1,
-0.02530625, 0.6801549, -0.8832108, 0, 0, 0, 1, 1,
-0.0227684, -0.8982051, -3.728924, 0, 0, 0, 1, 1,
-0.0155033, -1.046728, -1.539373, 0, 0, 0, 1, 1,
-0.007978902, 0.06483021, -0.1831553, 0, 0, 0, 1, 1,
-0.007866621, -0.02504787, -2.387854, 0, 0, 0, 1, 1,
-0.002563021, 0.5353028, 0.5726063, 0, 0, 0, 1, 1,
-0.001963106, -0.3269219, -2.934701, 0, 0, 0, 1, 1,
0.0005149536, -0.5705485, 1.723637, 1, 1, 1, 1, 1,
0.001082015, -0.7558929, 2.535399, 1, 1, 1, 1, 1,
0.004013055, -0.9225702, 4.179262, 1, 1, 1, 1, 1,
0.004335554, 0.5282132, -2.00701, 1, 1, 1, 1, 1,
0.00584372, 0.321924, -0.9847947, 1, 1, 1, 1, 1,
0.01759543, -1.179926, 2.137293, 1, 1, 1, 1, 1,
0.01906608, 1.346919, 0.348525, 1, 1, 1, 1, 1,
0.02122021, -0.06887959, 3.021591, 1, 1, 1, 1, 1,
0.02133528, 1.732989, -0.9380064, 1, 1, 1, 1, 1,
0.02334963, -0.5853503, 2.730764, 1, 1, 1, 1, 1,
0.0240634, 0.2614259, 0.01640628, 1, 1, 1, 1, 1,
0.02666363, -0.2625285, 2.630252, 1, 1, 1, 1, 1,
0.02723823, 0.8030556, 1.127201, 1, 1, 1, 1, 1,
0.03219767, -0.5085229, 3.014394, 1, 1, 1, 1, 1,
0.03430164, 0.04116861, 0.1667284, 1, 1, 1, 1, 1,
0.03796908, 0.5364594, -0.5727648, 0, 0, 1, 1, 1,
0.04002588, 1.147353, -0.4139827, 1, 0, 0, 1, 1,
0.04390708, -0.6478418, 2.338057, 1, 0, 0, 1, 1,
0.04662967, 2.444431, 0.7268703, 1, 0, 0, 1, 1,
0.04694491, 2.067804, -0.5318022, 1, 0, 0, 1, 1,
0.04720912, 0.08574466, 1.295865, 1, 0, 0, 1, 1,
0.04944415, 0.4593265, 0.6486037, 0, 0, 0, 1, 1,
0.05736578, -0.6772037, 3.848351, 0, 0, 0, 1, 1,
0.05836485, 0.774702, -0.7997684, 0, 0, 0, 1, 1,
0.06157641, 0.5708545, 1.462337, 0, 0, 0, 1, 1,
0.06504505, 0.057927, -1.089869, 0, 0, 0, 1, 1,
0.06780768, -1.721699, 2.420036, 0, 0, 0, 1, 1,
0.07289199, 0.1770944, -0.590894, 0, 0, 0, 1, 1,
0.073034, 0.5969567, -0.7294924, 1, 1, 1, 1, 1,
0.07561454, -0.2766676, 3.298857, 1, 1, 1, 1, 1,
0.0778348, -1.550896, 4.440725, 1, 1, 1, 1, 1,
0.08236264, 2.777048, 1.356854, 1, 1, 1, 1, 1,
0.09561671, -0.6472892, 4.219061, 1, 1, 1, 1, 1,
0.1017181, -0.4253964, 4.579823, 1, 1, 1, 1, 1,
0.1018991, 0.7863073, 0.4269725, 1, 1, 1, 1, 1,
0.1022951, -1.216426, 3.876614, 1, 1, 1, 1, 1,
0.1027013, -1.463073, 2.498752, 1, 1, 1, 1, 1,
0.1031781, -0.7258094, 3.095046, 1, 1, 1, 1, 1,
0.1063616, -0.5771821, 3.062777, 1, 1, 1, 1, 1,
0.1064396, 1.222382, 0.6328131, 1, 1, 1, 1, 1,
0.1118629, 2.164374, -1.610971, 1, 1, 1, 1, 1,
0.1150003, 0.2060823, -0.7444181, 1, 1, 1, 1, 1,
0.1167105, -1.031485, 3.566307, 1, 1, 1, 1, 1,
0.1181818, 0.9010509, -0.922036, 0, 0, 1, 1, 1,
0.1267923, -0.7722134, 3.306704, 1, 0, 0, 1, 1,
0.1281343, -0.5202593, 2.791756, 1, 0, 0, 1, 1,
0.1292441, -1.613533, 2.635964, 1, 0, 0, 1, 1,
0.130818, 1.812183, 2.898161, 1, 0, 0, 1, 1,
0.1369621, 0.3448764, -0.7029518, 1, 0, 0, 1, 1,
0.1418328, 0.2194694, 2.276376, 0, 0, 0, 1, 1,
0.1492364, 0.86959, -0.6941031, 0, 0, 0, 1, 1,
0.1525955, -0.7537401, 1.991385, 0, 0, 0, 1, 1,
0.1589753, 0.290712, 1.140441, 0, 0, 0, 1, 1,
0.1592903, -1.250075, 2.42836, 0, 0, 0, 1, 1,
0.1602569, -1.391459, 1.633877, 0, 0, 0, 1, 1,
0.1609916, 1.509976, 0.6430097, 0, 0, 0, 1, 1,
0.1646543, 0.215337, 0.04532171, 1, 1, 1, 1, 1,
0.1649311, 0.2017496, 1.867201, 1, 1, 1, 1, 1,
0.1671351, -0.2014994, 1.852862, 1, 1, 1, 1, 1,
0.1674512, -2.156763, 3.312097, 1, 1, 1, 1, 1,
0.1751576, 0.5706383, -0.1471862, 1, 1, 1, 1, 1,
0.1782651, 0.4918439, 0.8033087, 1, 1, 1, 1, 1,
0.1796909, -1.455353, 2.860982, 1, 1, 1, 1, 1,
0.1804563, 1.29209, -0.8446799, 1, 1, 1, 1, 1,
0.1837315, 0.2030421, 0.9450413, 1, 1, 1, 1, 1,
0.1840699, 0.8811366, 0.3668784, 1, 1, 1, 1, 1,
0.1862425, -0.8831595, 2.024517, 1, 1, 1, 1, 1,
0.1875249, -0.2717589, 1.437531, 1, 1, 1, 1, 1,
0.1917395, 0.452834, 1.314465, 1, 1, 1, 1, 1,
0.1919332, 0.002284821, 0.8792487, 1, 1, 1, 1, 1,
0.1950638, 0.04562331, 2.234353, 1, 1, 1, 1, 1,
0.1952534, -0.9773121, 4.2237, 0, 0, 1, 1, 1,
0.1986338, 0.2725382, -1.03129, 1, 0, 0, 1, 1,
0.2000993, 0.1513447, -0.3547788, 1, 0, 0, 1, 1,
0.2011012, -1.243716, 2.903676, 1, 0, 0, 1, 1,
0.2017341, -1.375485, 4.236201, 1, 0, 0, 1, 1,
0.2029568, -0.6075537, 1.416898, 1, 0, 0, 1, 1,
0.2033536, 1.634969, -0.405717, 0, 0, 0, 1, 1,
0.2073921, 0.3130113, -0.6525325, 0, 0, 0, 1, 1,
0.2076719, 0.8118407, -0.4823076, 0, 0, 0, 1, 1,
0.2107886, -2.191981, 1.817371, 0, 0, 0, 1, 1,
0.2136519, 1.103694, 0.2492093, 0, 0, 0, 1, 1,
0.2156394, -0.06413537, 1.79417, 0, 0, 0, 1, 1,
0.2182282, -0.2636772, 2.424704, 0, 0, 0, 1, 1,
0.2231613, 1.611467, 2.171014, 1, 1, 1, 1, 1,
0.2242352, -2.213011, 4.423343, 1, 1, 1, 1, 1,
0.2242548, 0.5658713, -0.0036284, 1, 1, 1, 1, 1,
0.2321869, 0.3347556, 1.529439, 1, 1, 1, 1, 1,
0.2328731, -0.03178871, 1.096371, 1, 1, 1, 1, 1,
0.2342095, 0.7342077, 0.6617886, 1, 1, 1, 1, 1,
0.2347651, -0.9908177, 1.913945, 1, 1, 1, 1, 1,
0.2360065, 0.2529282, 0.1310925, 1, 1, 1, 1, 1,
0.2361493, -1.330969, 1.990939, 1, 1, 1, 1, 1,
0.2398426, 0.7499591, 1.524156, 1, 1, 1, 1, 1,
0.2421072, -0.6648076, 2.083012, 1, 1, 1, 1, 1,
0.243431, -0.1119312, 2.35388, 1, 1, 1, 1, 1,
0.2445713, 1.189482, -1.111184, 1, 1, 1, 1, 1,
0.2468023, -0.5440325, 4.424223, 1, 1, 1, 1, 1,
0.2512456, 0.6271463, -1.131372, 1, 1, 1, 1, 1,
0.2675176, -0.5868471, 2.683915, 0, 0, 1, 1, 1,
0.2678987, -0.4854653, 0.8610905, 1, 0, 0, 1, 1,
0.2702833, 1.143954, 0.8258528, 1, 0, 0, 1, 1,
0.2709117, 0.2519261, 1.663609, 1, 0, 0, 1, 1,
0.2794077, -0.7361777, 2.130085, 1, 0, 0, 1, 1,
0.2813318, 1.020066, -0.2883333, 1, 0, 0, 1, 1,
0.2832134, 1.732622, -0.1429423, 0, 0, 0, 1, 1,
0.2841598, 0.4190453, -0.5833262, 0, 0, 0, 1, 1,
0.2850275, -1.02306, 4.173065, 0, 0, 0, 1, 1,
0.2859464, 0.0735264, 1.186947, 0, 0, 0, 1, 1,
0.2900989, -0.2552698, 2.571326, 0, 0, 0, 1, 1,
0.292059, -0.9489453, 2.256234, 0, 0, 0, 1, 1,
0.2956862, -2.22351, 2.869087, 0, 0, 0, 1, 1,
0.2973011, -1.114663, 3.20144, 1, 1, 1, 1, 1,
0.3000983, 0.1994129, 0.5815404, 1, 1, 1, 1, 1,
0.3037912, -0.2690139, 2.207977, 1, 1, 1, 1, 1,
0.3049537, -0.6655592, 3.587848, 1, 1, 1, 1, 1,
0.3050619, -1.430608, 2.787512, 1, 1, 1, 1, 1,
0.3063312, -1.490921, 2.63609, 1, 1, 1, 1, 1,
0.3094766, -0.2823162, 1.885392, 1, 1, 1, 1, 1,
0.3110863, 1.04242, 0.5578372, 1, 1, 1, 1, 1,
0.3170691, 0.5624009, 1.87927, 1, 1, 1, 1, 1,
0.3200477, -1.516191, 1.800904, 1, 1, 1, 1, 1,
0.3231603, 0.3654827, -0.07015719, 1, 1, 1, 1, 1,
0.3235664, -0.26085, 2.954148, 1, 1, 1, 1, 1,
0.3236058, 3.168086, -1.677494, 1, 1, 1, 1, 1,
0.3301884, 0.1782799, 0.290121, 1, 1, 1, 1, 1,
0.3320401, 0.3139552, 0.5455494, 1, 1, 1, 1, 1,
0.3321824, 0.5467872, -0.1396402, 0, 0, 1, 1, 1,
0.3336388, 0.3695734, -0.1911068, 1, 0, 0, 1, 1,
0.3337716, 1.346431, 1.249759, 1, 0, 0, 1, 1,
0.334024, 0.7778395, 0.8800421, 1, 0, 0, 1, 1,
0.3360707, -0.9117559, 2.233728, 1, 0, 0, 1, 1,
0.3374941, 0.6017266, 1.835765, 1, 0, 0, 1, 1,
0.3436897, -0.02125134, 1.386507, 0, 0, 0, 1, 1,
0.3443769, 0.3378285, -0.2914427, 0, 0, 0, 1, 1,
0.3468262, 1.704856, 1.396724, 0, 0, 0, 1, 1,
0.3499696, -0.4814492, 1.478112, 0, 0, 0, 1, 1,
0.3580329, -0.8011864, 4.640883, 0, 0, 0, 1, 1,
0.3590148, -2.278448, 1.666107, 0, 0, 0, 1, 1,
0.3615316, 0.3517036, 0.6381951, 0, 0, 0, 1, 1,
0.3619781, 0.09533486, 2.530797, 1, 1, 1, 1, 1,
0.3625623, 1.452472, 1.221018, 1, 1, 1, 1, 1,
0.3626175, -2.266482, 3.93452, 1, 1, 1, 1, 1,
0.3642036, 2.006436, 0.6108927, 1, 1, 1, 1, 1,
0.3669526, -0.06278998, 2.109668, 1, 1, 1, 1, 1,
0.3688969, -0.6672433, 1.489656, 1, 1, 1, 1, 1,
0.3693793, 1.240069, -0.3257872, 1, 1, 1, 1, 1,
0.3695498, -1.236913, 4.232165, 1, 1, 1, 1, 1,
0.3734082, 0.09103996, 3.490366, 1, 1, 1, 1, 1,
0.3773188, -1.813605, 3.819317, 1, 1, 1, 1, 1,
0.3779813, -0.2122631, 4.070546, 1, 1, 1, 1, 1,
0.3814704, -0.1279249, 1.124259, 1, 1, 1, 1, 1,
0.3880275, 1.195466, 1.11985, 1, 1, 1, 1, 1,
0.3889798, 1.165763, -0.4704176, 1, 1, 1, 1, 1,
0.3908795, -0.5430412, 3.696756, 1, 1, 1, 1, 1,
0.3909896, -0.5056739, 1.588422, 0, 0, 1, 1, 1,
0.3976897, -1.525238, 2.18561, 1, 0, 0, 1, 1,
0.4147387, -0.2292905, 2.324404, 1, 0, 0, 1, 1,
0.4206231, -0.4731994, 4.471656, 1, 0, 0, 1, 1,
0.4268544, 1.56945, 1.653919, 1, 0, 0, 1, 1,
0.4276228, 0.4296087, 0.3794886, 1, 0, 0, 1, 1,
0.4391156, 0.3552886, 1.225971, 0, 0, 0, 1, 1,
0.4418628, 0.5249679, 0.5262215, 0, 0, 0, 1, 1,
0.4442911, -0.1169249, 1.45763, 0, 0, 0, 1, 1,
0.4453697, -0.1588162, 3.396351, 0, 0, 0, 1, 1,
0.4460997, -2.3212, 4.65138, 0, 0, 0, 1, 1,
0.4471487, 1.12282, 0.219167, 0, 0, 0, 1, 1,
0.4523152, 1.320022, 0.7276111, 0, 0, 0, 1, 1,
0.4526296, 0.29946, 1.041461, 1, 1, 1, 1, 1,
0.4553268, 0.4877219, 1.598694, 1, 1, 1, 1, 1,
0.4574161, -0.2709103, 1.552552, 1, 1, 1, 1, 1,
0.4589929, 1.410069, 0.2135261, 1, 1, 1, 1, 1,
0.4627254, 0.9572802, -0.6499822, 1, 1, 1, 1, 1,
0.4627407, -1.20622, 2.124839, 1, 1, 1, 1, 1,
0.4636528, -0.1208297, 1.908496, 1, 1, 1, 1, 1,
0.4642276, 0.1119081, 0.3671185, 1, 1, 1, 1, 1,
0.4681706, -0.1897238, 0.07813049, 1, 1, 1, 1, 1,
0.4698934, 0.7534522, 1.179611, 1, 1, 1, 1, 1,
0.472131, -0.5242637, 1.405576, 1, 1, 1, 1, 1,
0.4801976, -1.41351, 3.631969, 1, 1, 1, 1, 1,
0.4837838, 0.1354751, 1.649059, 1, 1, 1, 1, 1,
0.4846881, 0.008447145, 1.729951, 1, 1, 1, 1, 1,
0.4849655, 1.2076, -0.1077356, 1, 1, 1, 1, 1,
0.4860969, -0.8745713, 1.09743, 0, 0, 1, 1, 1,
0.4914129, 1.667217, 0.772285, 1, 0, 0, 1, 1,
0.4971539, -1.360163, 2.367518, 1, 0, 0, 1, 1,
0.4975455, -0.4189276, 1.671697, 1, 0, 0, 1, 1,
0.5000228, -0.4698603, 2.392167, 1, 0, 0, 1, 1,
0.5008419, -1.480014, 2.031932, 1, 0, 0, 1, 1,
0.5011871, 0.4310994, -0.7847843, 0, 0, 0, 1, 1,
0.5017663, -0.2186658, 2.153885, 0, 0, 0, 1, 1,
0.5036473, 0.6426564, 1.637361, 0, 0, 0, 1, 1,
0.5044609, 0.06258026, 2.400152, 0, 0, 0, 1, 1,
0.5074156, -1.105244, 2.509403, 0, 0, 0, 1, 1,
0.5117967, -1.419552, 1.769032, 0, 0, 0, 1, 1,
0.514316, -1.94057, 4.416907, 0, 0, 0, 1, 1,
0.5187814, 1.653804, 0.004396692, 1, 1, 1, 1, 1,
0.5213526, -1.335077, 3.252443, 1, 1, 1, 1, 1,
0.5248966, 0.9491095, 2.079957, 1, 1, 1, 1, 1,
0.5362039, -0.3908251, 2.84254, 1, 1, 1, 1, 1,
0.5376722, 0.4166096, 1.7783, 1, 1, 1, 1, 1,
0.5396195, 0.3575566, 0.168084, 1, 1, 1, 1, 1,
0.5405475, 0.5601429, 0.9339055, 1, 1, 1, 1, 1,
0.5410237, 1.216368, -0.5631455, 1, 1, 1, 1, 1,
0.5434749, 0.6850084, 0.7227654, 1, 1, 1, 1, 1,
0.54472, -0.1063609, 1.279677, 1, 1, 1, 1, 1,
0.5490345, 0.8201619, 0.07587776, 1, 1, 1, 1, 1,
0.5493318, 0.3617511, 0.5138006, 1, 1, 1, 1, 1,
0.5504659, -1.619986, 4.005681, 1, 1, 1, 1, 1,
0.5539687, -0.2594562, 3.245068, 1, 1, 1, 1, 1,
0.5540471, 1.491834, -0.5754269, 1, 1, 1, 1, 1,
0.556515, -0.09475464, 2.40837, 0, 0, 1, 1, 1,
0.5596667, -2.326315, 3.019861, 1, 0, 0, 1, 1,
0.5608392, -0.9685513, 3.879553, 1, 0, 0, 1, 1,
0.561605, 0.9319832, -0.1266649, 1, 0, 0, 1, 1,
0.5665667, -0.08177549, 2.334536, 1, 0, 0, 1, 1,
0.5677852, -0.04270404, 1.572912, 1, 0, 0, 1, 1,
0.5755808, -1.234585, 1.404273, 0, 0, 0, 1, 1,
0.5757856, -0.6193553, 1.89059, 0, 0, 0, 1, 1,
0.577391, 0.935204, 0.1683901, 0, 0, 0, 1, 1,
0.5793265, 0.5764702, 0.01167725, 0, 0, 0, 1, 1,
0.5832922, 0.005228451, 2.712002, 0, 0, 0, 1, 1,
0.5838923, 0.06355213, 1.057093, 0, 0, 0, 1, 1,
0.5849233, 0.4018646, -0.4985607, 0, 0, 0, 1, 1,
0.5851575, -0.3766428, 2.09999, 1, 1, 1, 1, 1,
0.5876804, 0.09295341, -0.08065508, 1, 1, 1, 1, 1,
0.5923983, -1.084858, 3.550326, 1, 1, 1, 1, 1,
0.5935524, -0.7579639, 1.863233, 1, 1, 1, 1, 1,
0.5953544, 0.7626101, -0.2997062, 1, 1, 1, 1, 1,
0.5976045, -1.991095, 4.249427, 1, 1, 1, 1, 1,
0.6002851, -0.02250592, 0.1940215, 1, 1, 1, 1, 1,
0.6003342, 0.237252, -0.9344558, 1, 1, 1, 1, 1,
0.6021, -0.9229279, 1.9615, 1, 1, 1, 1, 1,
0.6025335, 0.2255856, 2.440424, 1, 1, 1, 1, 1,
0.6030073, -0.1910889, 2.46679, 1, 1, 1, 1, 1,
0.6041315, -0.5343645, 1.550636, 1, 1, 1, 1, 1,
0.6050128, 1.114967, 0.5478513, 1, 1, 1, 1, 1,
0.6079152, 0.9922213, 0.8508964, 1, 1, 1, 1, 1,
0.6100585, -1.398176, 2.299684, 1, 1, 1, 1, 1,
0.6129951, -0.04411701, 0.8651699, 0, 0, 1, 1, 1,
0.6154554, 0.5616355, 0.8142493, 1, 0, 0, 1, 1,
0.6171119, -0.5674661, 1.038672, 1, 0, 0, 1, 1,
0.6198082, -0.2232997, 1.397603, 1, 0, 0, 1, 1,
0.6244676, -1.306039, 2.940585, 1, 0, 0, 1, 1,
0.6305892, -0.5705529, 1.135834, 1, 0, 0, 1, 1,
0.6334736, -0.9141185, 1.989824, 0, 0, 0, 1, 1,
0.6343123, 1.532071, 1.199378, 0, 0, 0, 1, 1,
0.639876, -0.07155782, 0.4662685, 0, 0, 0, 1, 1,
0.6448654, 0.6453205, 2.61393, 0, 0, 0, 1, 1,
0.6449553, 0.1085564, 3.103038, 0, 0, 0, 1, 1,
0.6473599, -1.185142, 1.919929, 0, 0, 0, 1, 1,
0.6523337, 2.703404, 0.9285318, 0, 0, 0, 1, 1,
0.6523779, -0.3733019, 2.853258, 1, 1, 1, 1, 1,
0.6580011, -0.4491962, 1.757264, 1, 1, 1, 1, 1,
0.6608905, -0.4628723, 3.071016, 1, 1, 1, 1, 1,
0.6619419, 0.5904378, 3.237755, 1, 1, 1, 1, 1,
0.662507, 0.7408326, -0.3212066, 1, 1, 1, 1, 1,
0.6645601, 0.02050644, 1.174053, 1, 1, 1, 1, 1,
0.6665238, -1.577207, 2.647916, 1, 1, 1, 1, 1,
0.6779501, 1.629043, 1.655046, 1, 1, 1, 1, 1,
0.6785664, -1.531802, 3.000531, 1, 1, 1, 1, 1,
0.6786908, -1.245172, 2.859476, 1, 1, 1, 1, 1,
0.6845625, -0.07445785, 1.062488, 1, 1, 1, 1, 1,
0.6850827, -1.073627, 3.674627, 1, 1, 1, 1, 1,
0.6908733, -1.123585, 1.224538, 1, 1, 1, 1, 1,
0.6988533, 1.335194, 1.241952, 1, 1, 1, 1, 1,
0.7004362, 0.4809657, 2.037384, 1, 1, 1, 1, 1,
0.7014009, -0.3864814, 2.924374, 0, 0, 1, 1, 1,
0.7018246, 0.06277925, 1.030982, 1, 0, 0, 1, 1,
0.7066998, -0.6929139, -0.6382461, 1, 0, 0, 1, 1,
0.7132748, 1.193315, -1.555409, 1, 0, 0, 1, 1,
0.7155071, 0.02173269, 3.501538, 1, 0, 0, 1, 1,
0.7227282, -1.571563, 1.886161, 1, 0, 0, 1, 1,
0.7275355, -0.5876205, 1.396273, 0, 0, 0, 1, 1,
0.7343668, 0.8920776, 0.550499, 0, 0, 0, 1, 1,
0.7407414, -0.8678316, 4.354151, 0, 0, 0, 1, 1,
0.7410836, 0.5022573, -0.2037519, 0, 0, 0, 1, 1,
0.7432516, -0.08713108, 3.106022, 0, 0, 0, 1, 1,
0.7513093, 0.9243604, 2.406988, 0, 0, 0, 1, 1,
0.7516322, 0.1665636, -1.253861, 0, 0, 0, 1, 1,
0.7525929, -0.7879984, 2.492009, 1, 1, 1, 1, 1,
0.7573789, -0.2427067, 1.366405, 1, 1, 1, 1, 1,
0.7602344, 0.9277611, 0.3388091, 1, 1, 1, 1, 1,
0.7666811, -0.3736635, 1.26723, 1, 1, 1, 1, 1,
0.7701194, 0.2074494, 1.943146, 1, 1, 1, 1, 1,
0.7748456, 0.2952607, 0.1238225, 1, 1, 1, 1, 1,
0.7769647, 0.2280653, 3.155323, 1, 1, 1, 1, 1,
0.7789783, 0.6815743, 1.42868, 1, 1, 1, 1, 1,
0.7807014, 1.088105, 1.411628, 1, 1, 1, 1, 1,
0.7864563, -0.4207465, 0.7092249, 1, 1, 1, 1, 1,
0.7930855, 0.6050151, -0.1624702, 1, 1, 1, 1, 1,
0.794007, -1.607904, 1.980326, 1, 1, 1, 1, 1,
0.7989285, 0.0873097, 1.373813, 1, 1, 1, 1, 1,
0.8056346, 0.2261338, 0.4185672, 1, 1, 1, 1, 1,
0.8058186, 0.980435, 1.166447, 1, 1, 1, 1, 1,
0.8116244, 1.620347, 0.5395952, 0, 0, 1, 1, 1,
0.8129153, -0.1339738, 0.6089886, 1, 0, 0, 1, 1,
0.8167325, 0.06340206, 2.063125, 1, 0, 0, 1, 1,
0.8215944, 0.8701943, 0.6967245, 1, 0, 0, 1, 1,
0.8290776, 0.2773556, 0.8320237, 1, 0, 0, 1, 1,
0.8388665, 1.225754, 1.032356, 1, 0, 0, 1, 1,
0.8424653, -0.7685714, 3.31545, 0, 0, 0, 1, 1,
0.858617, -0.6668181, 3.375974, 0, 0, 0, 1, 1,
0.858808, -1.41626, 2.220221, 0, 0, 0, 1, 1,
0.8693506, -0.1101058, -0.1371025, 0, 0, 0, 1, 1,
0.8699487, 0.7248724, 0.441453, 0, 0, 0, 1, 1,
0.8761708, 0.9607036, 0.574612, 0, 0, 0, 1, 1,
0.878204, 0.3113183, 0.4085722, 0, 0, 0, 1, 1,
0.8814989, 0.9399049, 1.462776, 1, 1, 1, 1, 1,
0.8886126, 0.2410157, 0.827865, 1, 1, 1, 1, 1,
0.8948947, 1.475651, 1.448332, 1, 1, 1, 1, 1,
0.8953571, -0.6593248, 2.591194, 1, 1, 1, 1, 1,
0.8975727, 1.018595, 0.5300626, 1, 1, 1, 1, 1,
0.8999403, -0.2569989, 3.160226, 1, 1, 1, 1, 1,
0.9025564, 1.74566, -0.08969063, 1, 1, 1, 1, 1,
0.904453, -0.6785951, 2.609845, 1, 1, 1, 1, 1,
0.9063112, 0.01125642, 0.9151342, 1, 1, 1, 1, 1,
0.9106226, 0.7127887, 1.023429, 1, 1, 1, 1, 1,
0.911579, 0.1012432, 1.719828, 1, 1, 1, 1, 1,
0.9151515, 0.7121432, 1.905207, 1, 1, 1, 1, 1,
0.9184431, -0.9393393, 2.111792, 1, 1, 1, 1, 1,
0.9226475, -1.316802, 1.559062, 1, 1, 1, 1, 1,
0.9239478, 0.9225802, 1.265346, 1, 1, 1, 1, 1,
0.9274001, -0.708728, 3.041354, 0, 0, 1, 1, 1,
0.9451256, -0.2762098, 1.798584, 1, 0, 0, 1, 1,
0.9502049, -0.9062497, 2.757094, 1, 0, 0, 1, 1,
0.9549319, 1.76835, -0.09725983, 1, 0, 0, 1, 1,
0.9572745, 1.693396, 0.154022, 1, 0, 0, 1, 1,
0.960274, 1.0311, 0.7167537, 1, 0, 0, 1, 1,
0.9733676, 1.255677, 0.1735863, 0, 0, 0, 1, 1,
0.9801902, 1.461059, 0.8568631, 0, 0, 0, 1, 1,
0.9806371, -0.3834016, 0.78032, 0, 0, 0, 1, 1,
0.9811797, -1.097028, 2.6413, 0, 0, 0, 1, 1,
0.9815528, -0.2671669, 0.1374798, 0, 0, 0, 1, 1,
0.9832032, 1.3598, 0.6957652, 0, 0, 0, 1, 1,
0.9836284, 0.5777124, 1.625926, 0, 0, 0, 1, 1,
0.989109, -1.749476, 1.931585, 1, 1, 1, 1, 1,
0.99086, -1.977792, 0.6963651, 1, 1, 1, 1, 1,
0.9911833, 1.092842, 0.04268916, 1, 1, 1, 1, 1,
0.9968606, 0.5486438, 1.713126, 1, 1, 1, 1, 1,
0.997112, 0.8520338, -0.4179185, 1, 1, 1, 1, 1,
1.000218, -0.415908, 2.463746, 1, 1, 1, 1, 1,
1.001703, 0.146511, 0.8925278, 1, 1, 1, 1, 1,
1.006576, -0.245162, 2.742764, 1, 1, 1, 1, 1,
1.00778, 1.240107, -0.4015656, 1, 1, 1, 1, 1,
1.015106, 0.1308247, 1.529725, 1, 1, 1, 1, 1,
1.017496, 0.3919358, 0.617714, 1, 1, 1, 1, 1,
1.018656, 0.1719282, 1.429435, 1, 1, 1, 1, 1,
1.036994, -1.314698, 2.965421, 1, 1, 1, 1, 1,
1.039222, 0.2983772, -0.7610464, 1, 1, 1, 1, 1,
1.045954, 0.7898592, -0.252292, 1, 1, 1, 1, 1,
1.04995, -1.219169, 2.161421, 0, 0, 1, 1, 1,
1.050557, 0.3061423, 0.8038322, 1, 0, 0, 1, 1,
1.057674, -1.319713, 2.885494, 1, 0, 0, 1, 1,
1.061576, 0.07585489, 2.697511, 1, 0, 0, 1, 1,
1.072297, 0.7777362, 2.231119, 1, 0, 0, 1, 1,
1.078177, 2.173602, 1.1942, 1, 0, 0, 1, 1,
1.081782, 0.9081791, 0.8549947, 0, 0, 0, 1, 1,
1.085567, 3.185523, 1.260651, 0, 0, 0, 1, 1,
1.089058, -0.3138028, 1.335516, 0, 0, 0, 1, 1,
1.09433, 0.824302, 2.606785, 0, 0, 0, 1, 1,
1.095735, -0.6206254, 3.268911, 0, 0, 0, 1, 1,
1.097662, 1.724186, 0.1963986, 0, 0, 0, 1, 1,
1.114563, 0.7125334, 0.3762047, 0, 0, 0, 1, 1,
1.122891, -0.655122, 2.110924, 1, 1, 1, 1, 1,
1.128526, -0.1684266, 0.322393, 1, 1, 1, 1, 1,
1.129265, 0.4216475, 0.6167303, 1, 1, 1, 1, 1,
1.132214, -1.169713, 1.759511, 1, 1, 1, 1, 1,
1.132427, -1.658414, 1.472486, 1, 1, 1, 1, 1,
1.135086, 0.4178327, 1.625157, 1, 1, 1, 1, 1,
1.139458, -0.05714988, 1.061465, 1, 1, 1, 1, 1,
1.142211, 0.9277562, 2.448206, 1, 1, 1, 1, 1,
1.146107, 1.712933, 2.936009, 1, 1, 1, 1, 1,
1.157029, -1.005323, 3.062336, 1, 1, 1, 1, 1,
1.165017, 0.4517533, 2.251346, 1, 1, 1, 1, 1,
1.166681, -0.0981155, 2.899607, 1, 1, 1, 1, 1,
1.171273, -0.9697435, 2.248212, 1, 1, 1, 1, 1,
1.176324, 0.7403039, 1.124426, 1, 1, 1, 1, 1,
1.180716, -1.408848, 0.3658214, 1, 1, 1, 1, 1,
1.186836, -0.1796725, 1.160169, 0, 0, 1, 1, 1,
1.192143, 0.4769405, 0.4016293, 1, 0, 0, 1, 1,
1.196937, -1.407204, 0.9551349, 1, 0, 0, 1, 1,
1.198346, -0.4095953, 1.752359, 1, 0, 0, 1, 1,
1.205093, -0.5454009, 2.944575, 1, 0, 0, 1, 1,
1.208328, 0.08378841, -0.02547724, 1, 0, 0, 1, 1,
1.208542, -0.8113572, 4.716832, 0, 0, 0, 1, 1,
1.211836, -1.389132, 1.106637, 0, 0, 0, 1, 1,
1.225097, -0.09689272, 2.416538, 0, 0, 0, 1, 1,
1.225938, -0.5882887, 0.341285, 0, 0, 0, 1, 1,
1.24238, 0.3127524, 0.3644802, 0, 0, 0, 1, 1,
1.249272, 0.1491722, -0.5340744, 0, 0, 0, 1, 1,
1.250446, -0.6819504, 4.102357, 0, 0, 0, 1, 1,
1.25203, 0.9916926, 0.2367769, 1, 1, 1, 1, 1,
1.287101, 0.5658821, 2.694974, 1, 1, 1, 1, 1,
1.289178, 0.5400069, 1.462112, 1, 1, 1, 1, 1,
1.293667, -0.06197551, 2.028898, 1, 1, 1, 1, 1,
1.302194, 0.9314718, 1.017628, 1, 1, 1, 1, 1,
1.306914, 0.3583167, 1.043788, 1, 1, 1, 1, 1,
1.312181, -3.060805, 4.058687, 1, 1, 1, 1, 1,
1.322326, 0.737618, 0.4852142, 1, 1, 1, 1, 1,
1.323711, -0.2345444, 1.819182, 1, 1, 1, 1, 1,
1.329533, 0.3977155, 2.408638, 1, 1, 1, 1, 1,
1.330056, 1.410043, 1.5364, 1, 1, 1, 1, 1,
1.332289, -1.314461, 2.912778, 1, 1, 1, 1, 1,
1.336076, -0.4067506, 3.273497, 1, 1, 1, 1, 1,
1.344386, 2.183529, 0.6537969, 1, 1, 1, 1, 1,
1.348518, -2.630427, 3.639638, 1, 1, 1, 1, 1,
1.351543, -0.237403, 0.5791379, 0, 0, 1, 1, 1,
1.355008, 1.191765, -0.3075321, 1, 0, 0, 1, 1,
1.355561, -2.381601, 4.688045, 1, 0, 0, 1, 1,
1.358217, -1.283749, 2.866349, 1, 0, 0, 1, 1,
1.363564, 0.2945817, 0.9828495, 1, 0, 0, 1, 1,
1.364894, 1.514885, 0.2324809, 1, 0, 0, 1, 1,
1.375852, -0.3161365, 1.012053, 0, 0, 0, 1, 1,
1.375942, 1.342696, 0.3630498, 0, 0, 0, 1, 1,
1.37832, 0.7112415, 0.3999117, 0, 0, 0, 1, 1,
1.380642, 3.067417, -1.525851, 0, 0, 0, 1, 1,
1.390483, 1.528815, 2.332386, 0, 0, 0, 1, 1,
1.394605, -0.111269, 1.038509, 0, 0, 0, 1, 1,
1.396418, -0.5151473, 3.427202, 0, 0, 0, 1, 1,
1.396496, 0.5976458, 0.5593933, 1, 1, 1, 1, 1,
1.412001, 0.3326309, 1.346199, 1, 1, 1, 1, 1,
1.419068, -0.9714379, -0.02955672, 1, 1, 1, 1, 1,
1.419192, -0.5080445, 1.252477, 1, 1, 1, 1, 1,
1.426633, -0.2756723, 0.8882859, 1, 1, 1, 1, 1,
1.435841, -0.4506283, 1.136336, 1, 1, 1, 1, 1,
1.457023, -2.246293, 2.449499, 1, 1, 1, 1, 1,
1.462302, 0.3668196, 0.7638753, 1, 1, 1, 1, 1,
1.477241, -1.769419, 3.256651, 1, 1, 1, 1, 1,
1.481726, 1.36544, 1.274722, 1, 1, 1, 1, 1,
1.484566, -0.6298811, 3.513395, 1, 1, 1, 1, 1,
1.487062, 1.101632, -0.3660678, 1, 1, 1, 1, 1,
1.491655, -1.04578, 1.557998, 1, 1, 1, 1, 1,
1.497998, 1.479112, -1.458555, 1, 1, 1, 1, 1,
1.501278, 0.1918657, -0.5561771, 1, 1, 1, 1, 1,
1.509331, -0.5415665, 1.619395, 0, 0, 1, 1, 1,
1.510495, 0.1422251, 1.236106, 1, 0, 0, 1, 1,
1.511119, 1.206165, 0.4631827, 1, 0, 0, 1, 1,
1.543615, 1.625815, 0.9403949, 1, 0, 0, 1, 1,
1.552431, -1.238787, 1.278348, 1, 0, 0, 1, 1,
1.5613, -0.0116461, 0.2963639, 1, 0, 0, 1, 1,
1.573608, -0.192689, 0.9603711, 0, 0, 0, 1, 1,
1.58335, 0.8778369, -0.8527467, 0, 0, 0, 1, 1,
1.583355, 1.132161, 0.2913136, 0, 0, 0, 1, 1,
1.583743, -0.04984759, 0.6533499, 0, 0, 0, 1, 1,
1.591339, -0.8176249, 2.883296, 0, 0, 0, 1, 1,
1.60857, 0.5697258, 2.298137, 0, 0, 0, 1, 1,
1.613337, -1.554704, 2.349688, 0, 0, 0, 1, 1,
1.625059, 0.8431848, 1.078859, 1, 1, 1, 1, 1,
1.639024, 0.4857219, 0.8315452, 1, 1, 1, 1, 1,
1.645971, -0.9100121, 2.217489, 1, 1, 1, 1, 1,
1.651459, -0.3720285, 2.903538, 1, 1, 1, 1, 1,
1.651866, 0.4067363, 0.6992326, 1, 1, 1, 1, 1,
1.664073, 2.055579, 0.04636068, 1, 1, 1, 1, 1,
1.667738, -1.766856, 2.272396, 1, 1, 1, 1, 1,
1.668772, -1.064312, 0.3799208, 1, 1, 1, 1, 1,
1.691853, 0.3277973, 1.426676, 1, 1, 1, 1, 1,
1.715059, -2.055094, 2.264289, 1, 1, 1, 1, 1,
1.715974, 0.2411267, 2.928575, 1, 1, 1, 1, 1,
1.72399, 1.325724, 0.5353203, 1, 1, 1, 1, 1,
1.73029, 0.7547417, 1.574003, 1, 1, 1, 1, 1,
1.733748, 1.244413, 3.136076, 1, 1, 1, 1, 1,
1.734646, 0.4769377, 1.096217, 1, 1, 1, 1, 1,
1.747785, 0.7284604, 0.6278052, 0, 0, 1, 1, 1,
1.763269, -0.01507619, 1.516294, 1, 0, 0, 1, 1,
1.797246, -0.8194659, 1.218285, 1, 0, 0, 1, 1,
1.797378, 0.290926, 0.2387591, 1, 0, 0, 1, 1,
1.798446, -0.1214856, 2.01669, 1, 0, 0, 1, 1,
1.798545, -1.120278, 2.643734, 1, 0, 0, 1, 1,
1.801137, 0.798871, 0.3448665, 0, 0, 0, 1, 1,
1.809251, -0.1927919, 2.166702, 0, 0, 0, 1, 1,
1.812382, 0.3515951, 1.661755, 0, 0, 0, 1, 1,
1.812918, 0.8395069, 1.263394, 0, 0, 0, 1, 1,
1.815813, -0.431151, 2.640959, 0, 0, 0, 1, 1,
1.816197, 0.4109303, 1.202649, 0, 0, 0, 1, 1,
1.82189, 1.211768, 1.163112, 0, 0, 0, 1, 1,
1.840533, 1.607356, 1.378504, 1, 1, 1, 1, 1,
1.861282, -0.1888384, 1.843536, 1, 1, 1, 1, 1,
1.901934, 0.4145233, 0.2344131, 1, 1, 1, 1, 1,
1.909831, -1.043313, 2.972484, 1, 1, 1, 1, 1,
1.931611, 0.9103306, -1.207888, 1, 1, 1, 1, 1,
1.987653, -0.560737, 0.5405705, 1, 1, 1, 1, 1,
1.992121, -1.309497, 2.676364, 1, 1, 1, 1, 1,
2.024601, -0.7265432, 3.15419, 1, 1, 1, 1, 1,
2.030501, 0.3787496, 2.948447, 1, 1, 1, 1, 1,
2.037067, 1.343191, 0.7306005, 1, 1, 1, 1, 1,
2.039657, -0.898649, 1.906982, 1, 1, 1, 1, 1,
2.042706, -0.7151557, 1.344517, 1, 1, 1, 1, 1,
2.051767, -0.8747617, 2.574101, 1, 1, 1, 1, 1,
2.069121, 0.5778989, 1.633289, 1, 1, 1, 1, 1,
2.093192, 1.687695, 1.476524, 1, 1, 1, 1, 1,
2.113771, 1.792258, 1.855089, 0, 0, 1, 1, 1,
2.121408, 0.724026, 1.446228, 1, 0, 0, 1, 1,
2.139682, 0.7535902, 0.7201152, 1, 0, 0, 1, 1,
2.144749, -0.9254406, 1.493641, 1, 0, 0, 1, 1,
2.1686, 0.7358408, 1.334935, 1, 0, 0, 1, 1,
2.215351, -0.521678, 2.174402, 1, 0, 0, 1, 1,
2.236862, -0.7132877, 1.332551, 0, 0, 0, 1, 1,
2.238498, 2.0733, 0.9820476, 0, 0, 0, 1, 1,
2.290657, 0.2673055, 0.7254848, 0, 0, 0, 1, 1,
2.298697, -0.1876633, 1.64066, 0, 0, 0, 1, 1,
2.358573, 1.095258, 1.992312, 0, 0, 0, 1, 1,
2.421892, -0.9741969, 2.382811, 0, 0, 0, 1, 1,
2.462547, 0.007711661, 4.10388, 0, 0, 0, 1, 1,
2.645031, 0.3483188, 3.129424, 1, 1, 1, 1, 1,
2.772809, 0.7061957, 0.7478645, 1, 1, 1, 1, 1,
2.821887, 1.486151, 0.2359785, 1, 1, 1, 1, 1,
2.937087, 0.4201125, 1.517412, 1, 1, 1, 1, 1,
3.032477, 0.4046797, 1.381183, 1, 1, 1, 1, 1,
3.223068, 0.902003, 0.2638892, 1, 1, 1, 1, 1,
3.249028, -0.4181961, 1.515882, 1, 1, 1, 1, 1
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
var radius = 9.285639;
var distance = 32.61541;
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
mvMatrix.translate( -0.1465237, -0.06235886, 0.4009888 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.61541);
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
