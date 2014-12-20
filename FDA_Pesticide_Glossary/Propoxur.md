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
-2.977367, -0.8257948, -2.931113, 1, 0, 0, 1,
-2.657896, 0.661424, -4.588154, 1, 0.007843138, 0, 1,
-2.641123, 2.452381, -2.624062, 1, 0.01176471, 0, 1,
-2.387325, -1.543469, -0.9966432, 1, 0.01960784, 0, 1,
-2.276636, 1.046774, -1.213794, 1, 0.02352941, 0, 1,
-2.269952, -1.281163, -2.559829, 1, 0.03137255, 0, 1,
-2.226037, 0.4338949, 0.1291743, 1, 0.03529412, 0, 1,
-2.190607, 1.27672, -1.56235, 1, 0.04313726, 0, 1,
-2.125235, -1.948556, -1.565158, 1, 0.04705882, 0, 1,
-2.116336, -1.166026, -4.68153, 1, 0.05490196, 0, 1,
-2.099038, 0.7658862, -2.504586, 1, 0.05882353, 0, 1,
-2.072073, -0.4498809, -1.36533, 1, 0.06666667, 0, 1,
-2.062228, -1.70296, -2.914414, 1, 0.07058824, 0, 1,
-2.040573, -1.494197, -1.860074, 1, 0.07843138, 0, 1,
-2.024102, 0.4212616, -1.383872, 1, 0.08235294, 0, 1,
-2.001709, 0.156268, -1.474471, 1, 0.09019608, 0, 1,
-2.001362, -0.1129425, -0.9423044, 1, 0.09411765, 0, 1,
-1.988181, -0.9234046, -4.317799, 1, 0.1019608, 0, 1,
-1.95426, 0.1706147, -1.366652, 1, 0.1098039, 0, 1,
-1.9214, -0.03009525, -3.067553, 1, 0.1137255, 0, 1,
-1.910357, -0.1525189, 0.9190533, 1, 0.1215686, 0, 1,
-1.904965, 1.117691, -3.037496, 1, 0.1254902, 0, 1,
-1.896315, 0.7181043, 0.4034264, 1, 0.1333333, 0, 1,
-1.891619, 0.09824079, -1.505622, 1, 0.1372549, 0, 1,
-1.861918, 0.03359821, 0.5317591, 1, 0.145098, 0, 1,
-1.856986, 0.6656082, -1.835241, 1, 0.1490196, 0, 1,
-1.820489, -0.1323961, -2.682594, 1, 0.1568628, 0, 1,
-1.805127, -0.4062665, -1.817627, 1, 0.1607843, 0, 1,
-1.805004, -1.736754, -1.582578, 1, 0.1686275, 0, 1,
-1.768441, -0.6840196, -2.020154, 1, 0.172549, 0, 1,
-1.760071, -2.201773, -3.277531, 1, 0.1803922, 0, 1,
-1.707005, 0.4962718, -1.578305, 1, 0.1843137, 0, 1,
-1.703309, 1.061283, -1.909988, 1, 0.1921569, 0, 1,
-1.701061, -0.02253187, -1.682547, 1, 0.1960784, 0, 1,
-1.693133, -0.8907666, -1.79861, 1, 0.2039216, 0, 1,
-1.691488, 0.01213856, -2.257432, 1, 0.2117647, 0, 1,
-1.677972, -2.181039, -3.685337, 1, 0.2156863, 0, 1,
-1.670899, 0.6859574, -1.356004, 1, 0.2235294, 0, 1,
-1.668469, 0.2296021, -2.703166, 1, 0.227451, 0, 1,
-1.662945, -1.068967, -4.580777, 1, 0.2352941, 0, 1,
-1.656715, -1.655173, -3.769817, 1, 0.2392157, 0, 1,
-1.654213, -1.098105, -1.511716, 1, 0.2470588, 0, 1,
-1.654172, 0.0479679, -3.735677, 1, 0.2509804, 0, 1,
-1.653955, 0.4067829, -3.178921, 1, 0.2588235, 0, 1,
-1.651841, -0.972457, -1.783374, 1, 0.2627451, 0, 1,
-1.634781, 0.8911131, -1.28871, 1, 0.2705882, 0, 1,
-1.633047, -0.4214495, -1.497528, 1, 0.2745098, 0, 1,
-1.616235, -0.3371024, -2.913304, 1, 0.282353, 0, 1,
-1.611392, 1.780852, 1.702098, 1, 0.2862745, 0, 1,
-1.606587, 0.4939006, -0.5838334, 1, 0.2941177, 0, 1,
-1.598565, -0.5943913, -1.803505, 1, 0.3019608, 0, 1,
-1.595325, 1.269905, -1.356099, 1, 0.3058824, 0, 1,
-1.588909, 0.9658094, 0.0938563, 1, 0.3137255, 0, 1,
-1.586318, 0.03343311, -0.8376499, 1, 0.3176471, 0, 1,
-1.5724, 0.6325439, -2.295878, 1, 0.3254902, 0, 1,
-1.546494, 0.1571403, -2.135556, 1, 0.3294118, 0, 1,
-1.53824, 1.77053, 0.07419838, 1, 0.3372549, 0, 1,
-1.522467, -0.587087, -2.76061, 1, 0.3411765, 0, 1,
-1.519169, 0.6988999, 0.4346032, 1, 0.3490196, 0, 1,
-1.511074, 0.2630336, -3.057521, 1, 0.3529412, 0, 1,
-1.500008, 0.3142343, -3.919374, 1, 0.3607843, 0, 1,
-1.497143, 1.424652, -0.03758818, 1, 0.3647059, 0, 1,
-1.493836, 1.331624, 0.4811462, 1, 0.372549, 0, 1,
-1.492682, 0.2775426, -3.390761, 1, 0.3764706, 0, 1,
-1.492479, -1.320115, -2.23687, 1, 0.3843137, 0, 1,
-1.488472, -0.7626308, -2.056658, 1, 0.3882353, 0, 1,
-1.487375, -1.57116, -1.79087, 1, 0.3960784, 0, 1,
-1.485504, -1.908785, -2.531293, 1, 0.4039216, 0, 1,
-1.471967, 1.257942, -0.9366168, 1, 0.4078431, 0, 1,
-1.461307, 1.959702, -1.950605, 1, 0.4156863, 0, 1,
-1.448967, 2.600504, 1.497802, 1, 0.4196078, 0, 1,
-1.426385, 1.050608, 2.03479, 1, 0.427451, 0, 1,
-1.418311, -0.08482852, -2.60555, 1, 0.4313726, 0, 1,
-1.417496, -0.4310315, -1.394462, 1, 0.4392157, 0, 1,
-1.412347, 0.3039011, -2.779801, 1, 0.4431373, 0, 1,
-1.391896, 1.288565, -1.149824, 1, 0.4509804, 0, 1,
-1.38765, -0.6681978, -1.799185, 1, 0.454902, 0, 1,
-1.381231, 0.5192944, -1.555362, 1, 0.4627451, 0, 1,
-1.377692, 0.607551, 1.751741, 1, 0.4666667, 0, 1,
-1.367844, -0.002134823, -0.05931674, 1, 0.4745098, 0, 1,
-1.363628, 2.969501, -0.5976167, 1, 0.4784314, 0, 1,
-1.362254, 1.407253, -1.197934, 1, 0.4862745, 0, 1,
-1.356439, 0.1760292, -0.3215279, 1, 0.4901961, 0, 1,
-1.356045, 0.3117755, -0.2849602, 1, 0.4980392, 0, 1,
-1.300648, -0.3019136, -1.904243, 1, 0.5058824, 0, 1,
-1.2971, 0.230046, -1.494895, 1, 0.509804, 0, 1,
-1.286191, -0.1831529, -0.8866543, 1, 0.5176471, 0, 1,
-1.266037, 0.4228466, -1.027731, 1, 0.5215687, 0, 1,
-1.260598, -0.09127628, -1.340845, 1, 0.5294118, 0, 1,
-1.260262, 0.5076318, -0.2339693, 1, 0.5333334, 0, 1,
-1.258026, 0.1419191, -2.704617, 1, 0.5411765, 0, 1,
-1.251065, 0.9741312, 1.042182, 1, 0.5450981, 0, 1,
-1.250441, -1.148859, -2.233342, 1, 0.5529412, 0, 1,
-1.250312, 1.155743, 0.3589163, 1, 0.5568628, 0, 1,
-1.248147, 0.674544, -1.160854, 1, 0.5647059, 0, 1,
-1.246892, 0.1480806, -0.4131396, 1, 0.5686275, 0, 1,
-1.243231, -2.043217, -2.385065, 1, 0.5764706, 0, 1,
-1.238, 0.7530703, 0.6033567, 1, 0.5803922, 0, 1,
-1.235438, 0.5159639, -1.202332, 1, 0.5882353, 0, 1,
-1.22443, -0.7466599, -2.103132, 1, 0.5921569, 0, 1,
-1.223042, 0.4668588, -0.4555108, 1, 0.6, 0, 1,
-1.221843, 2.260812, 1.79623, 1, 0.6078432, 0, 1,
-1.22154, 0.3108753, -1.73466, 1, 0.6117647, 0, 1,
-1.214046, 0.8122985, -1.639222, 1, 0.6196079, 0, 1,
-1.207041, -1.175768, -1.827012, 1, 0.6235294, 0, 1,
-1.205143, -1.407914, -2.099851, 1, 0.6313726, 0, 1,
-1.192196, 0.3982095, -1.656891, 1, 0.6352941, 0, 1,
-1.183556, -0.2903466, -0.9699193, 1, 0.6431373, 0, 1,
-1.182063, 2.890007, -1.127588, 1, 0.6470588, 0, 1,
-1.175931, -0.01316108, -1.08297, 1, 0.654902, 0, 1,
-1.174838, -1.53278, -1.137555, 1, 0.6588235, 0, 1,
-1.168165, -0.7554688, -2.867031, 1, 0.6666667, 0, 1,
-1.164683, -0.3635537, -3.105269, 1, 0.6705883, 0, 1,
-1.161994, -0.2435742, -1.591143, 1, 0.6784314, 0, 1,
-1.153498, 0.1231532, -2.227245, 1, 0.682353, 0, 1,
-1.152297, 0.297659, -1.421843, 1, 0.6901961, 0, 1,
-1.143687, -0.4544173, -1.611069, 1, 0.6941177, 0, 1,
-1.139643, 0.2043318, -1.6942, 1, 0.7019608, 0, 1,
-1.129666, 0.3833292, -1.512793, 1, 0.7098039, 0, 1,
-1.1271, -0.6710768, -1.52864, 1, 0.7137255, 0, 1,
-1.12332, 0.2114144, -1.228316, 1, 0.7215686, 0, 1,
-1.120958, 0.4672691, -0.08011692, 1, 0.7254902, 0, 1,
-1.120798, -0.02581869, -1.736006, 1, 0.7333333, 0, 1,
-1.100482, 1.690817, -1.016538, 1, 0.7372549, 0, 1,
-1.095054, 1.168972, -0.574012, 1, 0.7450981, 0, 1,
-1.093389, -0.1277417, -1.563196, 1, 0.7490196, 0, 1,
-1.072219, -1.05692, -3.379248, 1, 0.7568628, 0, 1,
-1.070391, -1.403533, -4.028405, 1, 0.7607843, 0, 1,
-1.069865, 0.7915366, -1.709141, 1, 0.7686275, 0, 1,
-1.065125, -1.824862, -1.759221, 1, 0.772549, 0, 1,
-1.065008, 0.1298274, -2.112858, 1, 0.7803922, 0, 1,
-1.064561, -0.8256575, -1.644785, 1, 0.7843137, 0, 1,
-1.064332, -1.319714, -0.69142, 1, 0.7921569, 0, 1,
-1.063054, 0.01712632, 0.09575936, 1, 0.7960784, 0, 1,
-1.061798, -1.136723, -2.70451, 1, 0.8039216, 0, 1,
-1.060209, -1.130378, -3.838558, 1, 0.8117647, 0, 1,
-1.053814, 0.2555604, -2.757182, 1, 0.8156863, 0, 1,
-1.053485, -1.734003, -4.073577, 1, 0.8235294, 0, 1,
-1.04601, 0.8144215, -0.5081828, 1, 0.827451, 0, 1,
-1.037431, -1.200843, -2.508528, 1, 0.8352941, 0, 1,
-1.036875, 1.735019, 0.6874069, 1, 0.8392157, 0, 1,
-1.034682, -1.832151, -1.702332, 1, 0.8470588, 0, 1,
-1.032627, -0.612054, -0.672581, 1, 0.8509804, 0, 1,
-1.030107, 0.1980223, 0.9714839, 1, 0.8588235, 0, 1,
-1.028538, 0.6113372, -1.428672, 1, 0.8627451, 0, 1,
-1.019586, -0.216472, -1.268253, 1, 0.8705882, 0, 1,
-1.015379, -2.574143, -3.808497, 1, 0.8745098, 0, 1,
-1.002037, -0.73807, -2.35027, 1, 0.8823529, 0, 1,
-0.9984003, -0.7969109, -1.08288, 1, 0.8862745, 0, 1,
-0.9957353, 0.6284621, -1.182898, 1, 0.8941177, 0, 1,
-0.9954028, 0.9676778, -1.315467, 1, 0.8980392, 0, 1,
-0.9883505, -0.06073853, -1.184481, 1, 0.9058824, 0, 1,
-0.9844096, 0.5086427, -2.735731, 1, 0.9137255, 0, 1,
-0.9829802, -0.1890568, -1.729534, 1, 0.9176471, 0, 1,
-0.9814821, 0.08863707, -2.326452, 1, 0.9254902, 0, 1,
-0.9723714, -0.5417366, -3.167294, 1, 0.9294118, 0, 1,
-0.9587439, -1.063802, -2.575721, 1, 0.9372549, 0, 1,
-0.9574293, 0.6656528, -1.009778, 1, 0.9411765, 0, 1,
-0.9561058, 0.2063563, -1.248631, 1, 0.9490196, 0, 1,
-0.9487376, 0.4133306, -0.01340411, 1, 0.9529412, 0, 1,
-0.9486521, -1.653437, -1.547771, 1, 0.9607843, 0, 1,
-0.9466817, 2.049, -1.439064, 1, 0.9647059, 0, 1,
-0.9443526, 0.7433894, -0.1737502, 1, 0.972549, 0, 1,
-0.9357248, 0.4812843, -2.983533, 1, 0.9764706, 0, 1,
-0.9354156, 2.271193, -2.69783, 1, 0.9843137, 0, 1,
-0.9256576, -0.582573, -2.223166, 1, 0.9882353, 0, 1,
-0.9248447, -0.484809, -1.624878, 1, 0.9960784, 0, 1,
-0.9076972, 0.759564, -0.6876624, 0.9960784, 1, 0, 1,
-0.9046838, 0.3699691, -1.495368, 0.9921569, 1, 0, 1,
-0.904415, 2.931478, -0.6696298, 0.9843137, 1, 0, 1,
-0.9038531, -1.333581, -1.499848, 0.9803922, 1, 0, 1,
-0.9016112, -0.2785713, -3.480762, 0.972549, 1, 0, 1,
-0.9007453, 0.8197706, -1.580502, 0.9686275, 1, 0, 1,
-0.8966587, 0.3907873, -2.541951, 0.9607843, 1, 0, 1,
-0.8922297, -0.2257437, -1.45511, 0.9568627, 1, 0, 1,
-0.8885629, -0.04926362, -2.622316, 0.9490196, 1, 0, 1,
-0.882717, -0.584478, 0.2817393, 0.945098, 1, 0, 1,
-0.8749363, -0.01826272, -0.6589505, 0.9372549, 1, 0, 1,
-0.8698863, 0.08906439, -1.139881, 0.9333333, 1, 0, 1,
-0.8627768, -0.5282348, -3.719664, 0.9254902, 1, 0, 1,
-0.8494614, 0.5605543, -1.146292, 0.9215686, 1, 0, 1,
-0.8343197, -0.08315635, -2.912271, 0.9137255, 1, 0, 1,
-0.8289506, 0.6105371, -3.112691, 0.9098039, 1, 0, 1,
-0.8284123, -1.679519, -2.612119, 0.9019608, 1, 0, 1,
-0.8224545, -0.08299716, -3.48041, 0.8941177, 1, 0, 1,
-0.8182753, -0.3869915, -0.8909379, 0.8901961, 1, 0, 1,
-0.8078327, -0.7616558, -3.191469, 0.8823529, 1, 0, 1,
-0.8038083, -0.627243, -3.650982, 0.8784314, 1, 0, 1,
-0.8029458, -0.01065638, 1.119662, 0.8705882, 1, 0, 1,
-0.8026297, -0.4094584, -2.361827, 0.8666667, 1, 0, 1,
-0.7906892, -0.9072319, -2.124681, 0.8588235, 1, 0, 1,
-0.7893265, -0.4580758, -1.661963, 0.854902, 1, 0, 1,
-0.7872173, 0.8346812, -0.9363625, 0.8470588, 1, 0, 1,
-0.7855375, 1.036797, -0.1199972, 0.8431373, 1, 0, 1,
-0.7772178, -1.011855, -2.114766, 0.8352941, 1, 0, 1,
-0.7741171, -1.132634, -1.978133, 0.8313726, 1, 0, 1,
-0.7727358, 0.6548644, -2.351222, 0.8235294, 1, 0, 1,
-0.7709096, -1.379385, -3.20195, 0.8196079, 1, 0, 1,
-0.7640059, -0.08268435, 0.08609601, 0.8117647, 1, 0, 1,
-0.7556667, 0.1350625, -1.212463, 0.8078431, 1, 0, 1,
-0.7547895, 0.9892094, -0.2098425, 0.8, 1, 0, 1,
-0.754783, 0.5382234, -1.166574, 0.7921569, 1, 0, 1,
-0.7502035, 1.153102, -0.283845, 0.7882353, 1, 0, 1,
-0.7480218, 0.8273205, 0.6220365, 0.7803922, 1, 0, 1,
-0.7456617, 1.253483, -1.953606, 0.7764706, 1, 0, 1,
-0.7443668, -0.3562404, -1.922177, 0.7686275, 1, 0, 1,
-0.7401955, -0.4351291, -2.803938, 0.7647059, 1, 0, 1,
-0.7398521, -0.9195982, -3.383607, 0.7568628, 1, 0, 1,
-0.7368629, -1.610561, -4.838085, 0.7529412, 1, 0, 1,
-0.7330723, -1.030053, -0.8187554, 0.7450981, 1, 0, 1,
-0.7278569, -0.7754544, -4.618736, 0.7411765, 1, 0, 1,
-0.7271211, 0.3614818, 0.9744326, 0.7333333, 1, 0, 1,
-0.7256439, 0.8015912, 0.2344633, 0.7294118, 1, 0, 1,
-0.7217681, -1.05721, -2.588309, 0.7215686, 1, 0, 1,
-0.7198098, 0.5270349, -0.9522085, 0.7176471, 1, 0, 1,
-0.7141771, -0.1125374, 0.5962623, 0.7098039, 1, 0, 1,
-0.710031, -0.7131487, -1.475725, 0.7058824, 1, 0, 1,
-0.7076945, 0.8614398, -0.4000575, 0.6980392, 1, 0, 1,
-0.7065215, 1.301307, 0.5964037, 0.6901961, 1, 0, 1,
-0.704368, -1.604944, -1.784325, 0.6862745, 1, 0, 1,
-0.7012889, -1.155089, -2.809175, 0.6784314, 1, 0, 1,
-0.70113, -0.7987525, -1.14805, 0.6745098, 1, 0, 1,
-0.7002995, 0.3890762, -2.497601, 0.6666667, 1, 0, 1,
-0.6979191, 1.195071, -0.6774808, 0.6627451, 1, 0, 1,
-0.6959418, 0.14598, -0.1661519, 0.654902, 1, 0, 1,
-0.6921366, 0.4634868, -1.865825, 0.6509804, 1, 0, 1,
-0.6896825, 0.418418, 0.997963, 0.6431373, 1, 0, 1,
-0.6875358, 0.9565874, -0.1507478, 0.6392157, 1, 0, 1,
-0.6827196, -0.6703837, -3.247376, 0.6313726, 1, 0, 1,
-0.6812154, 0.20678, -1.645574, 0.627451, 1, 0, 1,
-0.6795781, -1.258324, -2.994199, 0.6196079, 1, 0, 1,
-0.6769045, 0.2094778, -0.09696511, 0.6156863, 1, 0, 1,
-0.6733987, 0.5121866, -2.358544, 0.6078432, 1, 0, 1,
-0.6721663, -0.8523927, -1.845653, 0.6039216, 1, 0, 1,
-0.6706831, 0.3756011, -0.4655394, 0.5960785, 1, 0, 1,
-0.6679598, 0.2733682, -1.011632, 0.5882353, 1, 0, 1,
-0.6679545, 0.1990193, -0.8487487, 0.5843138, 1, 0, 1,
-0.6647083, 0.4840846, -0.3325632, 0.5764706, 1, 0, 1,
-0.6575305, 0.3739731, 0.4946391, 0.572549, 1, 0, 1,
-0.6509287, 0.853568, 0.3980691, 0.5647059, 1, 0, 1,
-0.6437927, -0.9375562, -3.655607, 0.5607843, 1, 0, 1,
-0.6362153, 0.6967201, -3.373848, 0.5529412, 1, 0, 1,
-0.6328803, 0.6432734, -1.545589, 0.5490196, 1, 0, 1,
-0.6285979, -0.9421434, -1.498385, 0.5411765, 1, 0, 1,
-0.6252213, -0.7494059, -1.850512, 0.5372549, 1, 0, 1,
-0.6219834, -0.3800516, -3.05558, 0.5294118, 1, 0, 1,
-0.620333, -2.372145, -4.574661, 0.5254902, 1, 0, 1,
-0.6175537, -2.97565, -1.126167, 0.5176471, 1, 0, 1,
-0.6173087, 0.3770737, -1.535748, 0.5137255, 1, 0, 1,
-0.6156874, 0.5159412, 0.2762685, 0.5058824, 1, 0, 1,
-0.6138661, 0.8443175, -2.398769, 0.5019608, 1, 0, 1,
-0.6040779, 0.02970208, -1.1714, 0.4941176, 1, 0, 1,
-0.602388, -0.1195127, -2.354541, 0.4862745, 1, 0, 1,
-0.6022679, -0.6516628, -3.605933, 0.4823529, 1, 0, 1,
-0.6017727, 1.630095, -0.5116214, 0.4745098, 1, 0, 1,
-0.5925149, 1.705464, -1.360464, 0.4705882, 1, 0, 1,
-0.5913474, 1.418797, 0.1754283, 0.4627451, 1, 0, 1,
-0.5913367, 0.9064237, -1.103498, 0.4588235, 1, 0, 1,
-0.5852241, 2.571194, 0.4931533, 0.4509804, 1, 0, 1,
-0.5848051, 0.3642706, -1.033264, 0.4470588, 1, 0, 1,
-0.5810542, -0.6285806, -2.525024, 0.4392157, 1, 0, 1,
-0.5782732, -1.086526, -2.582706, 0.4352941, 1, 0, 1,
-0.5733392, 1.077935, -1.421951, 0.427451, 1, 0, 1,
-0.5662101, 1.678511, -0.6251301, 0.4235294, 1, 0, 1,
-0.5656236, 0.01124137, -1.95692, 0.4156863, 1, 0, 1,
-0.5638172, 0.4989364, 0.1699898, 0.4117647, 1, 0, 1,
-0.5584413, -0.06045979, 0.3075896, 0.4039216, 1, 0, 1,
-0.5558849, 0.5629095, 2.075924, 0.3960784, 1, 0, 1,
-0.550563, -1.920216, -3.425857, 0.3921569, 1, 0, 1,
-0.5475478, 1.649228, -0.2311495, 0.3843137, 1, 0, 1,
-0.5475212, -0.3475951, -2.744846, 0.3803922, 1, 0, 1,
-0.5421817, 0.236994, -1.21242, 0.372549, 1, 0, 1,
-0.5415421, -1.028608, -2.457159, 0.3686275, 1, 0, 1,
-0.541369, -0.3875014, -2.011204, 0.3607843, 1, 0, 1,
-0.5361884, 0.09094992, 0.2784387, 0.3568628, 1, 0, 1,
-0.5361419, -0.13486, -1.837518, 0.3490196, 1, 0, 1,
-0.531811, -1.298625, -2.772469, 0.345098, 1, 0, 1,
-0.5291436, -0.9762132, -3.851636, 0.3372549, 1, 0, 1,
-0.5290743, -0.4770912, -3.220347, 0.3333333, 1, 0, 1,
-0.524327, 0.428322, -1.211246, 0.3254902, 1, 0, 1,
-0.5195262, 0.9821377, -0.2591394, 0.3215686, 1, 0, 1,
-0.5195062, 0.3725052, -1.020579, 0.3137255, 1, 0, 1,
-0.5189605, -0.1446465, -1.546496, 0.3098039, 1, 0, 1,
-0.516781, 1.295904, 0.248088, 0.3019608, 1, 0, 1,
-0.5153821, 0.1336298, -0.5030002, 0.2941177, 1, 0, 1,
-0.5128548, 0.2143382, -2.043815, 0.2901961, 1, 0, 1,
-0.5073336, -1.625292, -2.575013, 0.282353, 1, 0, 1,
-0.5049011, 0.5462537, -1.404289, 0.2784314, 1, 0, 1,
-0.5036166, 0.4433875, -0.8662703, 0.2705882, 1, 0, 1,
-0.4985999, 0.2950379, -1.691639, 0.2666667, 1, 0, 1,
-0.4979635, -0.09756035, -1.631994, 0.2588235, 1, 0, 1,
-0.4977718, 0.2762307, -0.9229017, 0.254902, 1, 0, 1,
-0.4940203, -1.802302, -3.715778, 0.2470588, 1, 0, 1,
-0.4935589, 0.2655508, -0.6655255, 0.2431373, 1, 0, 1,
-0.4905128, 0.4279094, -0.9757215, 0.2352941, 1, 0, 1,
-0.4890693, 0.262225, -3.01245, 0.2313726, 1, 0, 1,
-0.4868009, 0.5108081, -0.9144807, 0.2235294, 1, 0, 1,
-0.4855241, -0.3807529, -1.345205, 0.2196078, 1, 0, 1,
-0.4811769, -0.3621956, -3.593282, 0.2117647, 1, 0, 1,
-0.4803869, -1.362311, -4.616053, 0.2078431, 1, 0, 1,
-0.4737324, -0.5246842, -1.112766, 0.2, 1, 0, 1,
-0.4713923, -0.3473788, -1.148179, 0.1921569, 1, 0, 1,
-0.4674407, 1.622921, 0.4175771, 0.1882353, 1, 0, 1,
-0.4673321, 1.358414, 1.14849, 0.1803922, 1, 0, 1,
-0.4639019, 0.9518358, -0.3255807, 0.1764706, 1, 0, 1,
-0.4626929, -0.2247675, -0.6873132, 0.1686275, 1, 0, 1,
-0.4572633, -0.1145994, -2.286746, 0.1647059, 1, 0, 1,
-0.4570333, -0.9753968, -4.220665, 0.1568628, 1, 0, 1,
-0.4535228, 1.104145, -1.649266, 0.1529412, 1, 0, 1,
-0.4512696, 1.558088, -0.845739, 0.145098, 1, 0, 1,
-0.4506025, 0.5896574, -0.2383987, 0.1411765, 1, 0, 1,
-0.4453717, -0.752199, -0.5751492, 0.1333333, 1, 0, 1,
-0.444915, 0.7339782, -0.3295792, 0.1294118, 1, 0, 1,
-0.4416409, 0.1918122, 0.6468005, 0.1215686, 1, 0, 1,
-0.4388367, 1.259576, -0.9370128, 0.1176471, 1, 0, 1,
-0.436538, 0.4947844, 0.6159185, 0.1098039, 1, 0, 1,
-0.4360303, 0.1628899, -2.169245, 0.1058824, 1, 0, 1,
-0.4336873, 0.3030117, -0.3893013, 0.09803922, 1, 0, 1,
-0.4288851, -0.3430493, -2.841378, 0.09019608, 1, 0, 1,
-0.4286159, 0.7176294, 0.08320954, 0.08627451, 1, 0, 1,
-0.4272827, 1.797466, 3.291571, 0.07843138, 1, 0, 1,
-0.4212299, -0.1562312, -2.188597, 0.07450981, 1, 0, 1,
-0.4211734, 0.3228693, -0.5912145, 0.06666667, 1, 0, 1,
-0.4197856, 1.823522, 0.6752421, 0.0627451, 1, 0, 1,
-0.4193993, 0.2825271, -2.408741, 0.05490196, 1, 0, 1,
-0.4030869, -0.1869713, -0.7877274, 0.05098039, 1, 0, 1,
-0.3993456, 0.6768996, -3.376646, 0.04313726, 1, 0, 1,
-0.3949577, 0.1497279, -1.722236, 0.03921569, 1, 0, 1,
-0.3927061, -0.5520066, -2.035643, 0.03137255, 1, 0, 1,
-0.388011, -0.7507278, -3.465608, 0.02745098, 1, 0, 1,
-0.3872685, -1.516605, -3.159451, 0.01960784, 1, 0, 1,
-0.3810292, -1.836965, -2.90667, 0.01568628, 1, 0, 1,
-0.3808554, 1.630423, 0.8054681, 0.007843138, 1, 0, 1,
-0.3763452, -1.416165, -5.401546, 0.003921569, 1, 0, 1,
-0.3722906, -0.8164837, -1.606334, 0, 1, 0.003921569, 1,
-0.3711648, 0.4464895, -1.230128, 0, 1, 0.01176471, 1,
-0.3675613, 0.5872662, -0.8561274, 0, 1, 0.01568628, 1,
-0.3672509, 1.688095, 0.737784, 0, 1, 0.02352941, 1,
-0.3639492, 0.8980424, -2.303041, 0, 1, 0.02745098, 1,
-0.3636848, 0.139287, -1.804047, 0, 1, 0.03529412, 1,
-0.3613579, -0.01577004, -1.406989, 0, 1, 0.03921569, 1,
-0.352571, 0.001057335, -0.5267482, 0, 1, 0.04705882, 1,
-0.3517838, -0.1215672, -1.958956, 0, 1, 0.05098039, 1,
-0.350506, -0.4984952, -2.045042, 0, 1, 0.05882353, 1,
-0.349557, -1.715413, -3.134822, 0, 1, 0.0627451, 1,
-0.3489205, -0.2267518, -0.4811195, 0, 1, 0.07058824, 1,
-0.348526, 1.483771, 0.1751702, 0, 1, 0.07450981, 1,
-0.3472542, -1.581444, -4.529679, 0, 1, 0.08235294, 1,
-0.346167, 0.3045857, -2.012274, 0, 1, 0.08627451, 1,
-0.3418934, 0.8971875, 0.1314192, 0, 1, 0.09411765, 1,
-0.3401725, 0.1327475, 0.3723225, 0, 1, 0.1019608, 1,
-0.3342234, -2.13916, -2.439965, 0, 1, 0.1058824, 1,
-0.3299145, 1.058012, 0.4789611, 0, 1, 0.1137255, 1,
-0.3256396, -0.01190974, -1.636314, 0, 1, 0.1176471, 1,
-0.3247442, -0.5745517, -1.720282, 0, 1, 0.1254902, 1,
-0.3158097, 0.7547092, 0.05687862, 0, 1, 0.1294118, 1,
-0.3141061, -1.564878, -4.587735, 0, 1, 0.1372549, 1,
-0.3121558, -0.3341877, -3.276835, 0, 1, 0.1411765, 1,
-0.3116741, 0.6024532, -1.052675, 0, 1, 0.1490196, 1,
-0.3062545, -0.3825834, -2.730402, 0, 1, 0.1529412, 1,
-0.3032345, -0.5807985, -4.193285, 0, 1, 0.1607843, 1,
-0.3029746, 0.1285678, -1.258894, 0, 1, 0.1647059, 1,
-0.3002446, -0.6227074, -1.544665, 0, 1, 0.172549, 1,
-0.3000644, 1.620722, -1.445548, 0, 1, 0.1764706, 1,
-0.2981947, -0.8024566, -2.106265, 0, 1, 0.1843137, 1,
-0.2948594, -0.04007722, -0.7508979, 0, 1, 0.1882353, 1,
-0.293604, -1.130627, -1.935421, 0, 1, 0.1960784, 1,
-0.2871526, 0.7791194, 0.2632818, 0, 1, 0.2039216, 1,
-0.2787232, -0.4415078, -0.4324109, 0, 1, 0.2078431, 1,
-0.2773912, -0.1922636, -1.094207, 0, 1, 0.2156863, 1,
-0.2729102, 2.293262, -3.1253, 0, 1, 0.2196078, 1,
-0.2711912, -0.10207, -0.4230559, 0, 1, 0.227451, 1,
-0.2664885, -1.008821, -5.624723, 0, 1, 0.2313726, 1,
-0.2647865, -1.114037, -4.445704, 0, 1, 0.2392157, 1,
-0.2646033, -0.02034314, -1.623347, 0, 1, 0.2431373, 1,
-0.2641756, -1.637123, -2.126966, 0, 1, 0.2509804, 1,
-0.2587795, -1.658701, -3.180747, 0, 1, 0.254902, 1,
-0.2587416, -0.7294829, -3.424842, 0, 1, 0.2627451, 1,
-0.2561602, 0.7118686, -0.001978082, 0, 1, 0.2666667, 1,
-0.2560655, 0.7117382, -0.6778303, 0, 1, 0.2745098, 1,
-0.2542822, -1.208464, -2.025755, 0, 1, 0.2784314, 1,
-0.2477601, -1.305669, -2.909684, 0, 1, 0.2862745, 1,
-0.2471354, 0.6493185, 0.7685545, 0, 1, 0.2901961, 1,
-0.2451359, 0.2089552, -0.6529779, 0, 1, 0.2980392, 1,
-0.2450549, -0.6739693, -2.342379, 0, 1, 0.3058824, 1,
-0.2439268, -0.3462462, -1.047955, 0, 1, 0.3098039, 1,
-0.24253, 0.004406187, -4.003201, 0, 1, 0.3176471, 1,
-0.240742, -1.03156, -3.325679, 0, 1, 0.3215686, 1,
-0.2399496, -0.9625798, -2.262126, 0, 1, 0.3294118, 1,
-0.2373116, 1.014496, -0.6040382, 0, 1, 0.3333333, 1,
-0.2296733, 0.5899979, 1.21315, 0, 1, 0.3411765, 1,
-0.2258357, -1.009459, -5.868537, 0, 1, 0.345098, 1,
-0.2251975, 1.480627, -0.6956229, 0, 1, 0.3529412, 1,
-0.222829, -0.04718526, -1.381804, 0, 1, 0.3568628, 1,
-0.2216165, 0.6512338, 1.73186, 0, 1, 0.3647059, 1,
-0.2215995, 0.6358643, 1.60042, 0, 1, 0.3686275, 1,
-0.2204558, 1.197853, -0.1319793, 0, 1, 0.3764706, 1,
-0.2202961, 1.531978, -0.06406049, 0, 1, 0.3803922, 1,
-0.2122616, -1.289093, -2.997474, 0, 1, 0.3882353, 1,
-0.2103135, 0.4168501, 0.5500913, 0, 1, 0.3921569, 1,
-0.2082252, 0.8354075, -0.4543304, 0, 1, 0.4, 1,
-0.2067334, -0.4227468, -0.2278264, 0, 1, 0.4078431, 1,
-0.2043339, 0.009262124, -1.28195, 0, 1, 0.4117647, 1,
-0.2033322, -0.1005343, -1.297474, 0, 1, 0.4196078, 1,
-0.1997295, -0.2371551, -2.642557, 0, 1, 0.4235294, 1,
-0.1980264, 0.1650931, -0.8562077, 0, 1, 0.4313726, 1,
-0.1971851, 0.7024413, -0.5587173, 0, 1, 0.4352941, 1,
-0.1917051, 0.1957582, -0.7696221, 0, 1, 0.4431373, 1,
-0.1911533, 0.5695238, -1.734844, 0, 1, 0.4470588, 1,
-0.1907205, 0.4850065, -1.717958, 0, 1, 0.454902, 1,
-0.1894853, 1.605974, -0.01206766, 0, 1, 0.4588235, 1,
-0.1879367, -0.0800277, -1.611681, 0, 1, 0.4666667, 1,
-0.1862399, 0.6699545, -0.2483084, 0, 1, 0.4705882, 1,
-0.1800004, 0.6685099, 0.6210747, 0, 1, 0.4784314, 1,
-0.1774216, -0.05860566, -3.322192, 0, 1, 0.4823529, 1,
-0.1768682, -0.25605, -1.616628, 0, 1, 0.4901961, 1,
-0.1733077, -1.109619, -3.102467, 0, 1, 0.4941176, 1,
-0.1723501, 0.7712622, 1.491497, 0, 1, 0.5019608, 1,
-0.1716537, -1.5479, -3.435038, 0, 1, 0.509804, 1,
-0.1702497, -0.9736871, -3.935152, 0, 1, 0.5137255, 1,
-0.168228, 0.04664491, -1.305417, 0, 1, 0.5215687, 1,
-0.16095, -0.7089885, -3.476936, 0, 1, 0.5254902, 1,
-0.1575011, -1.252611, -3.947664, 0, 1, 0.5333334, 1,
-0.1535485, -0.7448208, -3.082094, 0, 1, 0.5372549, 1,
-0.1533759, 0.8689486, 0.8341903, 0, 1, 0.5450981, 1,
-0.146571, 0.8708938, -0.8203853, 0, 1, 0.5490196, 1,
-0.1443048, -0.1700154, -2.483484, 0, 1, 0.5568628, 1,
-0.1439793, 0.5222586, -1.572567, 0, 1, 0.5607843, 1,
-0.143051, 1.248091, 0.3452494, 0, 1, 0.5686275, 1,
-0.1419685, -0.5888138, -3.364955, 0, 1, 0.572549, 1,
-0.1388544, -0.5772706, -2.07818, 0, 1, 0.5803922, 1,
-0.137586, 0.4128745, -0.584312, 0, 1, 0.5843138, 1,
-0.1303372, -0.8089602, -2.243207, 0, 1, 0.5921569, 1,
-0.1289961, 0.5386148, 0.7001477, 0, 1, 0.5960785, 1,
-0.1288346, 0.149723, -0.8736954, 0, 1, 0.6039216, 1,
-0.1267291, 1.291491, -0.3037899, 0, 1, 0.6117647, 1,
-0.1183817, -0.1957991, -1.989556, 0, 1, 0.6156863, 1,
-0.1149155, 1.915786, -0.02517665, 0, 1, 0.6235294, 1,
-0.1119211, 1.91118, 1.176265, 0, 1, 0.627451, 1,
-0.1112025, 0.6290915, 0.589197, 0, 1, 0.6352941, 1,
-0.1108592, -1.98416, -1.932125, 0, 1, 0.6392157, 1,
-0.109709, 0.801228, 0.03482306, 0, 1, 0.6470588, 1,
-0.1095719, -0.09429632, -2.15236, 0, 1, 0.6509804, 1,
-0.1093144, 1.587578, -1.062225, 0, 1, 0.6588235, 1,
-0.1086424, -0.5345076, -2.213136, 0, 1, 0.6627451, 1,
-0.1083204, -0.9157654, -3.325114, 0, 1, 0.6705883, 1,
-0.1073747, -2.002699, -2.828938, 0, 1, 0.6745098, 1,
-0.105675, -1.031767, -4.139422, 0, 1, 0.682353, 1,
-0.1055721, -1.735492, -3.84463, 0, 1, 0.6862745, 1,
-0.09413005, -0.4237329, -2.074562, 0, 1, 0.6941177, 1,
-0.09068754, 1.160194, 0.07272086, 0, 1, 0.7019608, 1,
-0.08655725, 1.009715, -0.8355445, 0, 1, 0.7058824, 1,
-0.08521599, -1.202655, -1.751824, 0, 1, 0.7137255, 1,
-0.08305299, 1.678526, 0.3668292, 0, 1, 0.7176471, 1,
-0.07988174, 0.2167866, 0.2064909, 0, 1, 0.7254902, 1,
-0.07469154, -0.09089655, -3.333734, 0, 1, 0.7294118, 1,
-0.07372775, -0.4486954, -2.947536, 0, 1, 0.7372549, 1,
-0.07367947, 0.4420564, -1.706599, 0, 1, 0.7411765, 1,
-0.07026396, 0.847991, -0.3549408, 0, 1, 0.7490196, 1,
-0.07011288, -0.8136616, -3.454392, 0, 1, 0.7529412, 1,
-0.06864032, 1.751229, -2.024676, 0, 1, 0.7607843, 1,
-0.06752852, 0.5650631, -1.18789, 0, 1, 0.7647059, 1,
-0.05912312, 0.1890023, -0.6917208, 0, 1, 0.772549, 1,
-0.05751594, 0.3613805, 1.416223, 0, 1, 0.7764706, 1,
-0.05627098, 1.024194, 0.1002183, 0, 1, 0.7843137, 1,
-0.05410793, -0.8798534, -4.921166, 0, 1, 0.7882353, 1,
-0.05225066, 1.485787, 0.7843396, 0, 1, 0.7960784, 1,
-0.04354002, 0.231993, 0.7369025, 0, 1, 0.8039216, 1,
-0.04338775, 0.5386279, 0.0555059, 0, 1, 0.8078431, 1,
-0.04208275, -0.6187265, -2.320222, 0, 1, 0.8156863, 1,
-0.03607393, -1.829015, -2.391075, 0, 1, 0.8196079, 1,
-0.02973033, -0.1142199, -3.329717, 0, 1, 0.827451, 1,
-0.02652892, 1.092481, 0.7726964, 0, 1, 0.8313726, 1,
-0.01555348, -0.2946999, -3.231418, 0, 1, 0.8392157, 1,
-0.01495113, -0.09632389, -2.429174, 0, 1, 0.8431373, 1,
-0.01362836, 0.1322917, 0.6069584, 0, 1, 0.8509804, 1,
-0.01217815, -0.08986749, -4.581944, 0, 1, 0.854902, 1,
-0.008900482, -1.032004, -2.469969, 0, 1, 0.8627451, 1,
-0.007603327, 0.7917087, 1.243853, 0, 1, 0.8666667, 1,
-0.002158685, -0.2827963, -3.224399, 0, 1, 0.8745098, 1,
0.002013695, -0.7704961, 4.110733, 0, 1, 0.8784314, 1,
0.004685194, -0.7732726, 3.131541, 0, 1, 0.8862745, 1,
0.009255702, 0.2399184, -1.480714, 0, 1, 0.8901961, 1,
0.01004733, 0.9518141, 0.01085323, 0, 1, 0.8980392, 1,
0.01014744, 0.4878097, -1.395357, 0, 1, 0.9058824, 1,
0.01338849, 0.1837324, 0.3951021, 0, 1, 0.9098039, 1,
0.01674258, -0.3280995, 3.02759, 0, 1, 0.9176471, 1,
0.01876022, -1.06665, 2.609005, 0, 1, 0.9215686, 1,
0.02158499, -0.44943, 2.405851, 0, 1, 0.9294118, 1,
0.0243788, -1.020473, 2.052981, 0, 1, 0.9333333, 1,
0.02607441, -0.6533538, 3.953918, 0, 1, 0.9411765, 1,
0.02906028, -0.6084298, 5.337108, 0, 1, 0.945098, 1,
0.03288363, 1.751564, 0.9028205, 0, 1, 0.9529412, 1,
0.03579838, 0.2218871, 0.5061646, 0, 1, 0.9568627, 1,
0.04538406, 0.3461584, 0.4573333, 0, 1, 0.9647059, 1,
0.04553463, -0.9491746, 1.738012, 0, 1, 0.9686275, 1,
0.04732111, 0.06302432, 0.7001733, 0, 1, 0.9764706, 1,
0.04897358, -0.7085139, 3.358724, 0, 1, 0.9803922, 1,
0.05214714, -0.6515957, 4.040235, 0, 1, 0.9882353, 1,
0.05367611, 0.5128131, 0.3273978, 0, 1, 0.9921569, 1,
0.06076286, -2.1186, 5.11336, 0, 1, 1, 1,
0.06161462, -0.8177176, 3.11991, 0, 0.9921569, 1, 1,
0.06312598, 1.345289, -0.8281558, 0, 0.9882353, 1, 1,
0.0637428, 0.1345294, 1.233203, 0, 0.9803922, 1, 1,
0.06433483, 2.419827, 1.846588, 0, 0.9764706, 1, 1,
0.06972002, -0.1489085, 2.126131, 0, 0.9686275, 1, 1,
0.07063882, -0.4382013, 2.212612, 0, 0.9647059, 1, 1,
0.07114376, -0.221635, 2.529274, 0, 0.9568627, 1, 1,
0.0764306, 0.1572445, 1.423917, 0, 0.9529412, 1, 1,
0.07689114, 0.3406003, -0.6905187, 0, 0.945098, 1, 1,
0.08041982, -0.1547021, 2.579047, 0, 0.9411765, 1, 1,
0.08151054, -0.7986017, 2.1558, 0, 0.9333333, 1, 1,
0.08198104, 0.365125, 2.379914, 0, 0.9294118, 1, 1,
0.08868352, -0.05947393, 3.440904, 0, 0.9215686, 1, 1,
0.08937046, -1.67269, 3.446015, 0, 0.9176471, 1, 1,
0.09094092, -0.3637882, 2.270129, 0, 0.9098039, 1, 1,
0.09198554, 0.2580047, -0.7849975, 0, 0.9058824, 1, 1,
0.09722341, -0.21296, 3.001003, 0, 0.8980392, 1, 1,
0.09857456, 0.4190828, -0.2523126, 0, 0.8901961, 1, 1,
0.0993623, 0.53206, 0.7331635, 0, 0.8862745, 1, 1,
0.1001255, -0.9991885, 3.131312, 0, 0.8784314, 1, 1,
0.1016217, 1.676462, 0.909992, 0, 0.8745098, 1, 1,
0.103359, -0.441102, 1.921234, 0, 0.8666667, 1, 1,
0.1038687, 0.8270622, 1.24686, 0, 0.8627451, 1, 1,
0.1047413, 1.140056, 1.414204, 0, 0.854902, 1, 1,
0.1049883, 0.01729366, 2.458162, 0, 0.8509804, 1, 1,
0.1103836, 0.2819982, -1.151298, 0, 0.8431373, 1, 1,
0.1145208, 0.1015085, 1.360775, 0, 0.8392157, 1, 1,
0.1172243, -0.02125149, 2.31114, 0, 0.8313726, 1, 1,
0.1209933, -1.344465, 4.258153, 0, 0.827451, 1, 1,
0.1213297, -0.3500484, 4.277003, 0, 0.8196079, 1, 1,
0.1244127, 0.6761757, 0.4171647, 0, 0.8156863, 1, 1,
0.1248773, -1.584655, 3.839995, 0, 0.8078431, 1, 1,
0.1273403, -1.42878, 4.466517, 0, 0.8039216, 1, 1,
0.1311313, 0.3168987, -0.09574194, 0, 0.7960784, 1, 1,
0.1320577, 0.3098348, 0.3829575, 0, 0.7882353, 1, 1,
0.1369057, 0.5002562, -0.4456524, 0, 0.7843137, 1, 1,
0.1370761, 1.140361, -0.1119419, 0, 0.7764706, 1, 1,
0.1371328, -0.5958236, 1.007325, 0, 0.772549, 1, 1,
0.1381475, -0.2462967, 2.803534, 0, 0.7647059, 1, 1,
0.1396251, -1.209984, 3.166669, 0, 0.7607843, 1, 1,
0.1412034, -0.3534516, 3.836924, 0, 0.7529412, 1, 1,
0.1425717, -0.03600121, 3.937767, 0, 0.7490196, 1, 1,
0.1460829, -0.9000288, 2.772271, 0, 0.7411765, 1, 1,
0.1487405, 1.127986, 0.4789847, 0, 0.7372549, 1, 1,
0.154341, -0.3565469, 2.321401, 0, 0.7294118, 1, 1,
0.1547985, -0.7433162, 2.559868, 0, 0.7254902, 1, 1,
0.1553115, 0.1475676, -0.7383245, 0, 0.7176471, 1, 1,
0.1603477, -1.235286, 2.856022, 0, 0.7137255, 1, 1,
0.1621533, -0.1486323, 3.134463, 0, 0.7058824, 1, 1,
0.1624367, 0.2788268, -0.6169025, 0, 0.6980392, 1, 1,
0.1648173, -1.647168, 3.736387, 0, 0.6941177, 1, 1,
0.1674825, -0.6677868, 3.158131, 0, 0.6862745, 1, 1,
0.167695, -1.090307, 3.123437, 0, 0.682353, 1, 1,
0.1695335, -1.482921, 2.010414, 0, 0.6745098, 1, 1,
0.1716833, -0.01311828, 1.674532, 0, 0.6705883, 1, 1,
0.1788469, -0.6738183, 4.095595, 0, 0.6627451, 1, 1,
0.181174, 0.8829596, 0.6272272, 0, 0.6588235, 1, 1,
0.1829039, -2.634867, 1.960075, 0, 0.6509804, 1, 1,
0.1848394, 0.4007314, 1.003097, 0, 0.6470588, 1, 1,
0.1853154, -1.860721, 0.9033826, 0, 0.6392157, 1, 1,
0.1868703, -0.9184075, 3.316284, 0, 0.6352941, 1, 1,
0.1888086, -0.2510411, 4.062577, 0, 0.627451, 1, 1,
0.1892788, -0.328839, 3.395182, 0, 0.6235294, 1, 1,
0.1901826, -0.03893482, 3.045127, 0, 0.6156863, 1, 1,
0.190364, 0.2219216, 2.435475, 0, 0.6117647, 1, 1,
0.1903969, -0.2461749, 4.129741, 0, 0.6039216, 1, 1,
0.1912823, 1.960215, 0.2653987, 0, 0.5960785, 1, 1,
0.2004175, -0.04694332, 2.946288, 0, 0.5921569, 1, 1,
0.2006596, 0.1482734, -0.562573, 0, 0.5843138, 1, 1,
0.2059312, -0.8260828, 0.8838256, 0, 0.5803922, 1, 1,
0.2059971, -1.43996, 1.065427, 0, 0.572549, 1, 1,
0.2100224, -0.4325269, 2.072479, 0, 0.5686275, 1, 1,
0.2117026, -0.4290677, -0.214085, 0, 0.5607843, 1, 1,
0.2152795, -0.4753048, 4.665742, 0, 0.5568628, 1, 1,
0.2179572, -0.8892319, 4.137026, 0, 0.5490196, 1, 1,
0.2203313, -1.145434, 3.583047, 0, 0.5450981, 1, 1,
0.2213002, 1.39191, 0.1778475, 0, 0.5372549, 1, 1,
0.2219705, -0.8247303, 4.270599, 0, 0.5333334, 1, 1,
0.2262041, 0.498962, -0.7576807, 0, 0.5254902, 1, 1,
0.2282107, -0.4779161, 2.159021, 0, 0.5215687, 1, 1,
0.2294337, 1.229111, 0.01241253, 0, 0.5137255, 1, 1,
0.231071, -0.7721384, 1.666494, 0, 0.509804, 1, 1,
0.235528, -0.790368, 4.729506, 0, 0.5019608, 1, 1,
0.2358578, -0.4601248, 2.117641, 0, 0.4941176, 1, 1,
0.2376815, 0.2291014, 0.5153486, 0, 0.4901961, 1, 1,
0.2382097, 0.545459, 2.435548, 0, 0.4823529, 1, 1,
0.2405289, 0.197591, 1.568491, 0, 0.4784314, 1, 1,
0.2434469, 0.4422645, 0.1197579, 0, 0.4705882, 1, 1,
0.2538592, 2.613637, -1.300095, 0, 0.4666667, 1, 1,
0.2552453, -0.07588607, 2.800962, 0, 0.4588235, 1, 1,
0.2579067, 1.295595, -0.3572812, 0, 0.454902, 1, 1,
0.2586107, -0.3287771, 2.940802, 0, 0.4470588, 1, 1,
0.2641514, -2.361521, 3.917176, 0, 0.4431373, 1, 1,
0.2669761, 1.405574, 0.677739, 0, 0.4352941, 1, 1,
0.2672468, 0.3928232, -0.6163288, 0, 0.4313726, 1, 1,
0.2678235, -3.273011, 3.147676, 0, 0.4235294, 1, 1,
0.2690438, -1.076215, 1.481409, 0, 0.4196078, 1, 1,
0.2713787, -0.5294386, 4.201158, 0, 0.4117647, 1, 1,
0.2719201, 1.448096, -1.464115, 0, 0.4078431, 1, 1,
0.272076, 0.94921, -0.3599806, 0, 0.4, 1, 1,
0.2757516, 0.2171951, -0.4892764, 0, 0.3921569, 1, 1,
0.2768556, 0.3072153, 1.590049, 0, 0.3882353, 1, 1,
0.2795507, -1.024799, 4.606167, 0, 0.3803922, 1, 1,
0.2795634, 1.381201, 0.3153583, 0, 0.3764706, 1, 1,
0.2814642, 0.2193187, -0.1800064, 0, 0.3686275, 1, 1,
0.284012, 0.3860282, 0.6560539, 0, 0.3647059, 1, 1,
0.2850032, -0.5371615, 2.199628, 0, 0.3568628, 1, 1,
0.285184, 1.575469, -0.4366609, 0, 0.3529412, 1, 1,
0.2890621, -0.2844962, 2.415531, 0, 0.345098, 1, 1,
0.2908453, 0.7210321, -0.8693792, 0, 0.3411765, 1, 1,
0.2917723, -0.2916961, 1.337571, 0, 0.3333333, 1, 1,
0.2923208, 1.311686, -0.3977425, 0, 0.3294118, 1, 1,
0.2960676, -1.544152, 1.457657, 0, 0.3215686, 1, 1,
0.3004263, -0.6129981, 2.435151, 0, 0.3176471, 1, 1,
0.3018087, 0.369716, -0.2819783, 0, 0.3098039, 1, 1,
0.3021803, -0.6485718, 1.586077, 0, 0.3058824, 1, 1,
0.3064301, 0.2872154, 1.969205, 0, 0.2980392, 1, 1,
0.3070841, -0.3360118, 0.01803275, 0, 0.2901961, 1, 1,
0.3073986, 0.1928824, -0.02967729, 0, 0.2862745, 1, 1,
0.3102043, 1.602822, 0.08947716, 0, 0.2784314, 1, 1,
0.310288, -0.09055998, 3.63027, 0, 0.2745098, 1, 1,
0.3175809, -0.2143337, 2.840437, 0, 0.2666667, 1, 1,
0.3178517, -0.3568922, 1.178596, 0, 0.2627451, 1, 1,
0.3180338, -0.5194225, 3.28299, 0, 0.254902, 1, 1,
0.3191189, -1.444668, 3.085197, 0, 0.2509804, 1, 1,
0.3216226, 1.290439, 0.6124599, 0, 0.2431373, 1, 1,
0.3220375, -0.3077664, 3.03425, 0, 0.2392157, 1, 1,
0.3267281, -1.863273, 2.67899, 0, 0.2313726, 1, 1,
0.3274883, -1.212442, 3.695869, 0, 0.227451, 1, 1,
0.3276826, -0.6870373, 3.217839, 0, 0.2196078, 1, 1,
0.3293858, -0.5232369, 2.632811, 0, 0.2156863, 1, 1,
0.3325604, -0.1975091, 2.18614, 0, 0.2078431, 1, 1,
0.3364908, 1.707302, 0.1942195, 0, 0.2039216, 1, 1,
0.3436815, 1.760206, 0.5964561, 0, 0.1960784, 1, 1,
0.344905, 0.5198759, 1.361139, 0, 0.1882353, 1, 1,
0.3454469, -1.118222, 2.786246, 0, 0.1843137, 1, 1,
0.3470278, 0.6149061, 0.6269817, 0, 0.1764706, 1, 1,
0.3533539, 0.7129283, 0.6714689, 0, 0.172549, 1, 1,
0.3577652, 1.192661, 0.4228354, 0, 0.1647059, 1, 1,
0.3583812, 0.4639062, 0.7249166, 0, 0.1607843, 1, 1,
0.3597207, -1.415799, 1.684332, 0, 0.1529412, 1, 1,
0.3622493, 0.7746954, -0.6917761, 0, 0.1490196, 1, 1,
0.3659604, -1.676983, 4.939563, 0, 0.1411765, 1, 1,
0.3705672, 0.6922728, 0.8777027, 0, 0.1372549, 1, 1,
0.3719513, 0.9318153, -0.5219955, 0, 0.1294118, 1, 1,
0.3730312, -0.9558837, 2.517517, 0, 0.1254902, 1, 1,
0.3756992, 0.5018349, 1.97873, 0, 0.1176471, 1, 1,
0.3760991, -0.5776109, 1.164962, 0, 0.1137255, 1, 1,
0.3776954, 1.399916, 1.860212, 0, 0.1058824, 1, 1,
0.3951116, -1.573692, 2.820381, 0, 0.09803922, 1, 1,
0.3987057, 0.5000749, 1.17032, 0, 0.09411765, 1, 1,
0.3996677, -0.2614059, 2.283353, 0, 0.08627451, 1, 1,
0.4005621, 1.35627, -1.179669, 0, 0.08235294, 1, 1,
0.4012599, 0.5061662, -0.2680715, 0, 0.07450981, 1, 1,
0.4016767, 0.7631034, 1.009457, 0, 0.07058824, 1, 1,
0.4024662, -0.853524, 4.332461, 0, 0.0627451, 1, 1,
0.4077921, -0.518347, 1.135864, 0, 0.05882353, 1, 1,
0.4121506, 2.072926, -0.2753417, 0, 0.05098039, 1, 1,
0.4140297, -1.674546, 3.999135, 0, 0.04705882, 1, 1,
0.415462, 0.1678669, 2.233385, 0, 0.03921569, 1, 1,
0.4158414, 0.4516136, 0.5497882, 0, 0.03529412, 1, 1,
0.4167246, 0.5666615, -0.4763254, 0, 0.02745098, 1, 1,
0.4187123, -1.256205, 3.308797, 0, 0.02352941, 1, 1,
0.4197308, 0.9859158, -0.9900467, 0, 0.01568628, 1, 1,
0.4200216, 1.423383, 2.095419, 0, 0.01176471, 1, 1,
0.4207085, -0.4286368, 2.931652, 0, 0.003921569, 1, 1,
0.4219317, 1.078344, 2.067923, 0.003921569, 0, 1, 1,
0.4231396, 0.6545899, 1.190316, 0.007843138, 0, 1, 1,
0.4241886, 1.559589, 0.4953919, 0.01568628, 0, 1, 1,
0.424777, -1.33319, 2.077389, 0.01960784, 0, 1, 1,
0.4283108, 0.462244, 2.033083, 0.02745098, 0, 1, 1,
0.4316845, 0.5282723, -0.871914, 0.03137255, 0, 1, 1,
0.4319512, 0.04067101, 3.8318, 0.03921569, 0, 1, 1,
0.4337627, -1.213124, 3.946591, 0.04313726, 0, 1, 1,
0.4347868, 1.079225, 0.1257816, 0.05098039, 0, 1, 1,
0.4405681, 0.9443446, -2.194266, 0.05490196, 0, 1, 1,
0.4408132, -1.200628, 3.446326, 0.0627451, 0, 1, 1,
0.4408502, 0.3140366, 0.04700616, 0.06666667, 0, 1, 1,
0.4411359, -0.1303796, 2.407905, 0.07450981, 0, 1, 1,
0.4449815, 0.574227, 1.951355, 0.07843138, 0, 1, 1,
0.4477335, -0.6161857, 2.976174, 0.08627451, 0, 1, 1,
0.4491766, 1.418902, 1.497259, 0.09019608, 0, 1, 1,
0.4496539, -0.3200247, 2.156163, 0.09803922, 0, 1, 1,
0.4501, 1.438733, -0.3043362, 0.1058824, 0, 1, 1,
0.4522867, -2.947107, 2.669545, 0.1098039, 0, 1, 1,
0.4550596, 2.143417, 0.7981212, 0.1176471, 0, 1, 1,
0.457164, -0.3707209, 2.033784, 0.1215686, 0, 1, 1,
0.4572419, 1.009542, 2.053621, 0.1294118, 0, 1, 1,
0.46145, 0.7581617, 1.087403, 0.1333333, 0, 1, 1,
0.4638171, 0.9792781, 2.580037, 0.1411765, 0, 1, 1,
0.4664598, -1.017077, 2.922568, 0.145098, 0, 1, 1,
0.4669289, 0.6877479, 0.08851178, 0.1529412, 0, 1, 1,
0.4688704, -1.758101, 2.438081, 0.1568628, 0, 1, 1,
0.4767363, 2.290701, 0.9646743, 0.1647059, 0, 1, 1,
0.4777255, -0.3592441, 3.132075, 0.1686275, 0, 1, 1,
0.4817238, 0.9069743, 1.092951, 0.1764706, 0, 1, 1,
0.4836609, -0.1400976, 1.751873, 0.1803922, 0, 1, 1,
0.4851711, -0.2110582, 1.378671, 0.1882353, 0, 1, 1,
0.4902402, -1.040899, 2.530947, 0.1921569, 0, 1, 1,
0.4906017, 0.3812856, 0.4834699, 0.2, 0, 1, 1,
0.4920697, 1.578886, 0.4581278, 0.2078431, 0, 1, 1,
0.4937543, 0.06486528, 3.391348, 0.2117647, 0, 1, 1,
0.4950513, 1.975168, -0.8247297, 0.2196078, 0, 1, 1,
0.4973101, -0.4654657, 3.457849, 0.2235294, 0, 1, 1,
0.4990821, 0.3989667, 2.165532, 0.2313726, 0, 1, 1,
0.5009361, 1.411479, -1.256245, 0.2352941, 0, 1, 1,
0.5026371, -1.493187, 1.076805, 0.2431373, 0, 1, 1,
0.504673, -1.535569, 1.959611, 0.2470588, 0, 1, 1,
0.5049723, -0.4976244, 1.570425, 0.254902, 0, 1, 1,
0.5051719, 0.9591676, 0.4863303, 0.2588235, 0, 1, 1,
0.5073606, -1.62537, 2.784616, 0.2666667, 0, 1, 1,
0.5112971, 1.088522, 1.340358, 0.2705882, 0, 1, 1,
0.519367, 1.152793, 0.06926008, 0.2784314, 0, 1, 1,
0.5218593, 0.6356962, -0.1005098, 0.282353, 0, 1, 1,
0.5229943, -0.07385152, 0.4901941, 0.2901961, 0, 1, 1,
0.5352629, -0.2861013, 3.172009, 0.2941177, 0, 1, 1,
0.5356942, -0.3652964, 2.818982, 0.3019608, 0, 1, 1,
0.544755, -0.2880172, 2.720663, 0.3098039, 0, 1, 1,
0.5456049, -0.53378, 3.881554, 0.3137255, 0, 1, 1,
0.5531409, -0.6550876, 3.490735, 0.3215686, 0, 1, 1,
0.5572955, 0.8311992, 0.797652, 0.3254902, 0, 1, 1,
0.5599041, 1.076266, 1.391596, 0.3333333, 0, 1, 1,
0.5600121, 1.152227, 1.477749, 0.3372549, 0, 1, 1,
0.5700012, -1.293509, 2.738621, 0.345098, 0, 1, 1,
0.5741746, -0.9130975, 1.298717, 0.3490196, 0, 1, 1,
0.5816967, -0.1184444, 1.999799, 0.3568628, 0, 1, 1,
0.5850071, -0.3651995, 4.011754, 0.3607843, 0, 1, 1,
0.5851062, 1.074247, 0.781422, 0.3686275, 0, 1, 1,
0.5892681, -0.6259261, 2.792767, 0.372549, 0, 1, 1,
0.6010547, -0.288058, 2.820175, 0.3803922, 0, 1, 1,
0.6016138, 1.304436, 0.6741577, 0.3843137, 0, 1, 1,
0.6041573, -1.584401, 2.766045, 0.3921569, 0, 1, 1,
0.6046208, -1.01797, 3.836173, 0.3960784, 0, 1, 1,
0.6099591, 0.1236619, 2.252982, 0.4039216, 0, 1, 1,
0.6118817, 0.719972, 0.8593595, 0.4117647, 0, 1, 1,
0.6138785, 0.06748332, 2.936256, 0.4156863, 0, 1, 1,
0.6141532, 0.5001971, 2.623623, 0.4235294, 0, 1, 1,
0.6156468, -0.3582403, 0.31603, 0.427451, 0, 1, 1,
0.6249667, 0.20921, 1.907937, 0.4352941, 0, 1, 1,
0.6300583, 1.049695, 1.27598, 0.4392157, 0, 1, 1,
0.6308127, 0.6430571, 1.473393, 0.4470588, 0, 1, 1,
0.6378064, 0.9009525, 1.662761, 0.4509804, 0, 1, 1,
0.6392595, -0.1082653, 3.171434, 0.4588235, 0, 1, 1,
0.6446897, 0.9005818, 0.7487506, 0.4627451, 0, 1, 1,
0.6499572, -0.3885753, 1.473323, 0.4705882, 0, 1, 1,
0.6504065, -0.7936884, 1.379559, 0.4745098, 0, 1, 1,
0.6689782, 0.3277778, 2.524478, 0.4823529, 0, 1, 1,
0.6727256, -0.6578054, 2.927857, 0.4862745, 0, 1, 1,
0.6750127, -0.1788212, 0.8011708, 0.4941176, 0, 1, 1,
0.6768153, 1.684641, 2.112668, 0.5019608, 0, 1, 1,
0.685265, 1.624403, -0.01009837, 0.5058824, 0, 1, 1,
0.691052, 0.4904562, 1.021198, 0.5137255, 0, 1, 1,
0.6965952, -0.6522022, 1.360969, 0.5176471, 0, 1, 1,
0.7022853, -0.2333084, 2.21748, 0.5254902, 0, 1, 1,
0.7066328, -0.6319261, 2.572163, 0.5294118, 0, 1, 1,
0.7075931, -0.6032664, 2.405102, 0.5372549, 0, 1, 1,
0.7146413, -0.4896312, 1.693188, 0.5411765, 0, 1, 1,
0.7157657, 0.0009240909, 1.20224, 0.5490196, 0, 1, 1,
0.7160902, 0.4473589, 1.797357, 0.5529412, 0, 1, 1,
0.7263744, 0.3635434, 2.513711, 0.5607843, 0, 1, 1,
0.7285413, -0.7822761, 1.500126, 0.5647059, 0, 1, 1,
0.7301063, -0.7287544, 2.200241, 0.572549, 0, 1, 1,
0.7337755, 0.8107424, 3.063167, 0.5764706, 0, 1, 1,
0.7340485, 0.5551324, -0.06976525, 0.5843138, 0, 1, 1,
0.7391444, -0.8361366, 0.9902921, 0.5882353, 0, 1, 1,
0.7471337, 0.279253, 0.0940674, 0.5960785, 0, 1, 1,
0.7499375, 0.7947661, 2.002862, 0.6039216, 0, 1, 1,
0.7518099, 1.220715, 0.05605895, 0.6078432, 0, 1, 1,
0.7525727, 0.4193055, 2.270243, 0.6156863, 0, 1, 1,
0.7580007, 0.4937423, 1.202813, 0.6196079, 0, 1, 1,
0.7647191, 1.004279, 1.51398, 0.627451, 0, 1, 1,
0.7654687, 1.630967, -0.8986677, 0.6313726, 0, 1, 1,
0.7701521, 0.1056444, 1.719545, 0.6392157, 0, 1, 1,
0.7703902, 0.7571931, 0.9900291, 0.6431373, 0, 1, 1,
0.7706283, 1.289118, 1.504423, 0.6509804, 0, 1, 1,
0.772125, 0.6176262, 0.6425602, 0.654902, 0, 1, 1,
0.7804524, -0.002633256, 1.688024, 0.6627451, 0, 1, 1,
0.7840022, 0.3204681, 0.2659871, 0.6666667, 0, 1, 1,
0.7843843, -1.060289, 1.606997, 0.6745098, 0, 1, 1,
0.7856492, -1.308531, 1.276757, 0.6784314, 0, 1, 1,
0.7883857, 0.5308753, -0.2816666, 0.6862745, 0, 1, 1,
0.7918187, -1.070472, 2.595231, 0.6901961, 0, 1, 1,
0.7937887, -0.6766695, 2.420891, 0.6980392, 0, 1, 1,
0.8023359, 0.1964972, 1.846981, 0.7058824, 0, 1, 1,
0.8066869, -1.00368, 3.344489, 0.7098039, 0, 1, 1,
0.807583, -0.6529257, 1.272637, 0.7176471, 0, 1, 1,
0.8133399, 0.7653434, 1.561584, 0.7215686, 0, 1, 1,
0.8264969, -0.7054054, 1.911432, 0.7294118, 0, 1, 1,
0.8337041, 0.6726483, 2.360433, 0.7333333, 0, 1, 1,
0.8372188, -1.70584, 3.231011, 0.7411765, 0, 1, 1,
0.8399231, 0.4947238, 0.9483105, 0.7450981, 0, 1, 1,
0.8423753, 0.9649262, 0.4359892, 0.7529412, 0, 1, 1,
0.8424915, -0.5796039, 2.317285, 0.7568628, 0, 1, 1,
0.8429247, 0.6146463, 1.636696, 0.7647059, 0, 1, 1,
0.8469051, -1.601622, 2.807571, 0.7686275, 0, 1, 1,
0.8482819, -2.058187, 2.630048, 0.7764706, 0, 1, 1,
0.8517487, 0.1518527, 0.7903068, 0.7803922, 0, 1, 1,
0.8525121, -0.3955094, 0.4149631, 0.7882353, 0, 1, 1,
0.8610344, -0.2086719, 0.1868544, 0.7921569, 0, 1, 1,
0.8661457, -1.06421, 1.641543, 0.8, 0, 1, 1,
0.8675537, -0.21155, 1.665902, 0.8078431, 0, 1, 1,
0.8689905, 0.08524366, -0.5393175, 0.8117647, 0, 1, 1,
0.8798448, 0.04613797, 1.958708, 0.8196079, 0, 1, 1,
0.8811883, 0.02255419, 2.43269, 0.8235294, 0, 1, 1,
0.8832545, -0.8155293, 3.487151, 0.8313726, 0, 1, 1,
0.8864613, -0.4177769, 2.936567, 0.8352941, 0, 1, 1,
0.8883521, 0.01108872, 1.208791, 0.8431373, 0, 1, 1,
0.8891951, -1.127493, 3.227103, 0.8470588, 0, 1, 1,
0.895668, 0.1366643, 2.549316, 0.854902, 0, 1, 1,
0.9030552, 0.1943913, 1.117407, 0.8588235, 0, 1, 1,
0.9169311, -0.6545848, 1.563398, 0.8666667, 0, 1, 1,
0.9188554, 0.8826138, -2.027205, 0.8705882, 0, 1, 1,
0.9192837, 1.775862, -0.4069103, 0.8784314, 0, 1, 1,
0.922994, -0.5902383, 1.019036, 0.8823529, 0, 1, 1,
0.9233831, 1.455296, 0.8762423, 0.8901961, 0, 1, 1,
0.92508, -1.09661, 1.778369, 0.8941177, 0, 1, 1,
0.927465, 0.6829103, 1.007996, 0.9019608, 0, 1, 1,
0.9293965, -1.185718, 1.466578, 0.9098039, 0, 1, 1,
0.9299819, 0.8613022, 3.746637, 0.9137255, 0, 1, 1,
0.9300414, -0.1390267, 2.222091, 0.9215686, 0, 1, 1,
0.9367282, 0.94684, -0.6573824, 0.9254902, 0, 1, 1,
0.9395651, 0.1241514, 1.100387, 0.9333333, 0, 1, 1,
0.9404981, 0.5296066, 1.413759, 0.9372549, 0, 1, 1,
0.9433562, -0.5003456, 2.554807, 0.945098, 0, 1, 1,
0.9444294, 0.2485811, 1.721793, 0.9490196, 0, 1, 1,
0.9604058, -0.786305, 3.237094, 0.9568627, 0, 1, 1,
0.9609191, 0.5053595, 0.6983577, 0.9607843, 0, 1, 1,
0.9618152, -0.2417989, 2.126057, 0.9686275, 0, 1, 1,
0.9683096, 1.211185, 3.439456, 0.972549, 0, 1, 1,
0.9684048, -2.001118, 3.04987, 0.9803922, 0, 1, 1,
0.9713492, -0.1370005, 1.665648, 0.9843137, 0, 1, 1,
0.976731, 0.5990477, 1.603758, 0.9921569, 0, 1, 1,
0.9802088, -0.3575781, 1.382075, 0.9960784, 0, 1, 1,
0.9849821, -0.5753254, 3.323882, 1, 0, 0.9960784, 1,
0.9866808, 1.812956, 1.184738, 1, 0, 0.9882353, 1,
0.9981535, 0.3156977, 0.7107996, 1, 0, 0.9843137, 1,
0.9996186, 1.57162, -0.06089814, 1, 0, 0.9764706, 1,
1.00382, -0.8141131, 2.656714, 1, 0, 0.972549, 1,
1.003823, -0.6453769, 2.618102, 1, 0, 0.9647059, 1,
1.00426, -0.7051037, 0.5940462, 1, 0, 0.9607843, 1,
1.006454, 0.08645867, 0.2311085, 1, 0, 0.9529412, 1,
1.02222, 0.04566962, 1.506435, 1, 0, 0.9490196, 1,
1.03079, -0.04048761, 2.241266, 1, 0, 0.9411765, 1,
1.057045, -0.956447, 2.13221, 1, 0, 0.9372549, 1,
1.057489, -0.9049563, 3.835076, 1, 0, 0.9294118, 1,
1.060057, -0.02463975, 2.091032, 1, 0, 0.9254902, 1,
1.065451, -1.041048, 1.145839, 1, 0, 0.9176471, 1,
1.079964, -0.619172, 2.317249, 1, 0, 0.9137255, 1,
1.083316, -0.05560542, 1.303515, 1, 0, 0.9058824, 1,
1.08578, 1.04362, -0.4699452, 1, 0, 0.9019608, 1,
1.088155, 1.607258, -0.02013216, 1, 0, 0.8941177, 1,
1.090217, 1.011392, -0.1447882, 1, 0, 0.8862745, 1,
1.091049, 0.4433505, 1.98727, 1, 0, 0.8823529, 1,
1.092677, -0.1164624, 3.462878, 1, 0, 0.8745098, 1,
1.103435, -0.9044949, 1.900645, 1, 0, 0.8705882, 1,
1.105736, -0.133157, 2.000326, 1, 0, 0.8627451, 1,
1.115253, -0.2892931, 1.132197, 1, 0, 0.8588235, 1,
1.118217, 1.557132, 2.79993, 1, 0, 0.8509804, 1,
1.119186, 0.4984672, 1.334853, 1, 0, 0.8470588, 1,
1.129351, 0.3284257, 1.77384, 1, 0, 0.8392157, 1,
1.130969, -0.3959125, 2.190126, 1, 0, 0.8352941, 1,
1.136056, -0.1398209, 3.239976, 1, 0, 0.827451, 1,
1.1374, -0.08941783, 0.5161062, 1, 0, 0.8235294, 1,
1.1398, 1.31661, 0.929191, 1, 0, 0.8156863, 1,
1.146124, 0.2302693, 0.3370817, 1, 0, 0.8117647, 1,
1.149583, 1.065214, 2.737817, 1, 0, 0.8039216, 1,
1.150473, 0.308704, 1.417746, 1, 0, 0.7960784, 1,
1.159866, 0.1276426, 1.761722, 1, 0, 0.7921569, 1,
1.179519, -0.4910369, 1.885771, 1, 0, 0.7843137, 1,
1.182439, 0.2187639, 1.512151, 1, 0, 0.7803922, 1,
1.182993, -0.3462062, 3.270594, 1, 0, 0.772549, 1,
1.186123, 1.012562, 1.090403, 1, 0, 0.7686275, 1,
1.189254, 0.3674375, 2.143775, 1, 0, 0.7607843, 1,
1.206571, -0.8597869, 2.117068, 1, 0, 0.7568628, 1,
1.215992, 1.268086, 1.266768, 1, 0, 0.7490196, 1,
1.218873, -0.9808632, 0.6847127, 1, 0, 0.7450981, 1,
1.218913, -0.4152769, 2.028553, 1, 0, 0.7372549, 1,
1.219896, 0.4998098, -0.6527093, 1, 0, 0.7333333, 1,
1.22274, 0.8510769, 1.074709, 1, 0, 0.7254902, 1,
1.223933, 0.3525691, -0.08257461, 1, 0, 0.7215686, 1,
1.225528, -0.06787018, 0.5143718, 1, 0, 0.7137255, 1,
1.229568, -0.6621321, 2.253296, 1, 0, 0.7098039, 1,
1.245198, 0.4616892, 2.395628, 1, 0, 0.7019608, 1,
1.256161, 0.9363631, 0.4481556, 1, 0, 0.6941177, 1,
1.258448, 0.7635326, 0.519241, 1, 0, 0.6901961, 1,
1.277655, 0.07227649, 2.348048, 1, 0, 0.682353, 1,
1.288949, 0.2987078, 2.077289, 1, 0, 0.6784314, 1,
1.290082, 0.8519288, 1.29959, 1, 0, 0.6705883, 1,
1.298157, -0.005673153, 2.211983, 1, 0, 0.6666667, 1,
1.307658, -0.2236603, 2.320784, 1, 0, 0.6588235, 1,
1.312384, -0.8423054, 1.701228, 1, 0, 0.654902, 1,
1.326059, 0.6040362, 1.738703, 1, 0, 0.6470588, 1,
1.33658, -0.4973157, 2.926492, 1, 0, 0.6431373, 1,
1.341321, -0.4063694, 1.288553, 1, 0, 0.6352941, 1,
1.358948, -1.765884, 1.434965, 1, 0, 0.6313726, 1,
1.360641, -1.241284, 1.204715, 1, 0, 0.6235294, 1,
1.364317, 0.8465565, 1.313802, 1, 0, 0.6196079, 1,
1.374186, -0.3952852, 2.418649, 1, 0, 0.6117647, 1,
1.39819, -1.881436, 3.077942, 1, 0, 0.6078432, 1,
1.402541, 0.1915376, 1.822762, 1, 0, 0.6, 1,
1.403682, 0.3991838, 1.151816, 1, 0, 0.5921569, 1,
1.405778, 0.1666674, 0.5151146, 1, 0, 0.5882353, 1,
1.418596, 1.814761, 1.220379, 1, 0, 0.5803922, 1,
1.431286, -0.2086129, 1.69201, 1, 0, 0.5764706, 1,
1.432707, 0.8775266, -1.430035, 1, 0, 0.5686275, 1,
1.441761, 1.417254, -0.2192647, 1, 0, 0.5647059, 1,
1.459603, -0.5202219, 1.023088, 1, 0, 0.5568628, 1,
1.461991, -0.7007667, 3.464651, 1, 0, 0.5529412, 1,
1.471716, -0.8172613, 3.170713, 1, 0, 0.5450981, 1,
1.472389, 0.7641719, 0.4222846, 1, 0, 0.5411765, 1,
1.473049, 0.6706809, 0.8050625, 1, 0, 0.5333334, 1,
1.476699, -1.70699, 1.835681, 1, 0, 0.5294118, 1,
1.481172, 0.4972966, 1.108686, 1, 0, 0.5215687, 1,
1.49656, 1.2493, 0.7380075, 1, 0, 0.5176471, 1,
1.507088, -0.7482316, 1.067704, 1, 0, 0.509804, 1,
1.508787, 0.03649161, 2.177739, 1, 0, 0.5058824, 1,
1.512052, -0.1162148, 1.319953, 1, 0, 0.4980392, 1,
1.538533, 0.4400347, 1.669916, 1, 0, 0.4901961, 1,
1.540533, 0.8637381, 1.391953, 1, 0, 0.4862745, 1,
1.547446, 1.235259, 1.20467, 1, 0, 0.4784314, 1,
1.548517, 0.7989013, -0.653538, 1, 0, 0.4745098, 1,
1.552819, -0.2174421, 1.94077, 1, 0, 0.4666667, 1,
1.572812, -1.379427, 2.400234, 1, 0, 0.4627451, 1,
1.607537, -0.233426, 1.358033, 1, 0, 0.454902, 1,
1.608018, -0.6715705, 2.088006, 1, 0, 0.4509804, 1,
1.613579, -0.3426853, 0.4477417, 1, 0, 0.4431373, 1,
1.614117, 0.1374619, -0.02533913, 1, 0, 0.4392157, 1,
1.619436, 1.355862, 2.820065, 1, 0, 0.4313726, 1,
1.62188, 0.716814, 1.318332, 1, 0, 0.427451, 1,
1.625409, 0.3207172, 2.813736, 1, 0, 0.4196078, 1,
1.640215, 0.2105141, 3.216202, 1, 0, 0.4156863, 1,
1.641025, -1.021423, 1.853577, 1, 0, 0.4078431, 1,
1.645883, -0.7811716, 3.20005, 1, 0, 0.4039216, 1,
1.654026, 2.050972, 2.77646, 1, 0, 0.3960784, 1,
1.656331, -0.01399074, 3.210904, 1, 0, 0.3882353, 1,
1.658223, -0.02473422, -0.30395, 1, 0, 0.3843137, 1,
1.66397, -0.3352321, 0.2482274, 1, 0, 0.3764706, 1,
1.664677, 0.8692879, 1.723807, 1, 0, 0.372549, 1,
1.668107, 1.285205, -0.3244674, 1, 0, 0.3647059, 1,
1.688913, -0.491906, 2.51554, 1, 0, 0.3607843, 1,
1.693503, 1.086451, 1.741681, 1, 0, 0.3529412, 1,
1.718306, 2.115651, 0.02760771, 1, 0, 0.3490196, 1,
1.719306, 2.2098, -0.1374528, 1, 0, 0.3411765, 1,
1.721109, -0.3171133, 2.396055, 1, 0, 0.3372549, 1,
1.724187, 0.2568549, 0.3996441, 1, 0, 0.3294118, 1,
1.732841, -1.029461, 2.583743, 1, 0, 0.3254902, 1,
1.734156, 0.3675977, 0.08988962, 1, 0, 0.3176471, 1,
1.749516, 0.5494104, 1.036552, 1, 0, 0.3137255, 1,
1.754855, 1.979127, 0.6883138, 1, 0, 0.3058824, 1,
1.764551, 0.338999, 1.150202, 1, 0, 0.2980392, 1,
1.767344, -1.000796, 2.998978, 1, 0, 0.2941177, 1,
1.779195, 0.8140373, 1.726943, 1, 0, 0.2862745, 1,
1.792468, -0.8983887, 2.874285, 1, 0, 0.282353, 1,
1.794936, 1.01482, 0.7359191, 1, 0, 0.2745098, 1,
1.803424, 2.475963, 1.087493, 1, 0, 0.2705882, 1,
1.807575, -0.8426514, 1.881348, 1, 0, 0.2627451, 1,
1.8077, 0.09435324, 2.245074, 1, 0, 0.2588235, 1,
1.818608, 1.037801, 0.1654029, 1, 0, 0.2509804, 1,
1.819461, -0.5599937, 2.493216, 1, 0, 0.2470588, 1,
1.831599, 0.6291398, 1.420157, 1, 0, 0.2392157, 1,
1.847657, -1.080863, 0.1681977, 1, 0, 0.2352941, 1,
1.851206, -0.9629665, 1.65416, 1, 0, 0.227451, 1,
1.861109, 0.4198968, 1.674626, 1, 0, 0.2235294, 1,
1.861852, -0.5349212, 3.63344, 1, 0, 0.2156863, 1,
1.866082, 0.4377688, 1.696355, 1, 0, 0.2117647, 1,
1.893318, -1.526774, 2.042435, 1, 0, 0.2039216, 1,
1.926912, 0.1731674, 2.089072, 1, 0, 0.1960784, 1,
1.936461, 0.2013087, 2.182776, 1, 0, 0.1921569, 1,
1.949424, 1.301646, 0.9039969, 1, 0, 0.1843137, 1,
1.949596, -0.01935707, 0.8370023, 1, 0, 0.1803922, 1,
1.960805, 0.6762647, 2.133508, 1, 0, 0.172549, 1,
1.980932, 0.2626582, 1.18138, 1, 0, 0.1686275, 1,
1.983033, 0.4937003, 1.676797, 1, 0, 0.1607843, 1,
1.98795, -1.259656, 1.297163, 1, 0, 0.1568628, 1,
1.995424, -0.03491421, 0.4373802, 1, 0, 0.1490196, 1,
2.003422, -1.023045, 1.439378, 1, 0, 0.145098, 1,
2.005846, -0.06361709, 1.425232, 1, 0, 0.1372549, 1,
2.012261, -1.160135, 0.05399714, 1, 0, 0.1333333, 1,
2.106549, -0.5737964, 2.939755, 1, 0, 0.1254902, 1,
2.130734, -0.2066637, 2.307754, 1, 0, 0.1215686, 1,
2.183249, 1.224838, 0.5899463, 1, 0, 0.1137255, 1,
2.196323, 2.041306, -0.240352, 1, 0, 0.1098039, 1,
2.199238, 0.1660731, 1.544631, 1, 0, 0.1019608, 1,
2.221523, 0.3451942, 0.9139644, 1, 0, 0.09411765, 1,
2.260747, -0.285331, 1.654153, 1, 0, 0.09019608, 1,
2.299634, -0.500544, 1.748546, 1, 0, 0.08235294, 1,
2.389985, -0.5817572, 2.602203, 1, 0, 0.07843138, 1,
2.410724, -0.2343593, 2.878024, 1, 0, 0.07058824, 1,
2.439603, -1.521948, 2.907031, 1, 0, 0.06666667, 1,
2.450653, 1.58254, 2.346371, 1, 0, 0.05882353, 1,
2.45363, -0.03571713, 1.008822, 1, 0, 0.05490196, 1,
2.469324, -1.110775, 2.73292, 1, 0, 0.04705882, 1,
2.501425, -0.2607753, 1.373149, 1, 0, 0.04313726, 1,
2.519728, -2.139375, 2.422646, 1, 0, 0.03529412, 1,
2.570604, -0.09497645, 0.317515, 1, 0, 0.03137255, 1,
2.62046, 1.226914, 0.9057456, 1, 0, 0.02352941, 1,
2.948441, 0.3631639, 2.550745, 1, 0, 0.01960784, 1,
3.068155, -0.5448709, 0.9655039, 1, 0, 0.01176471, 1,
3.096136, 1.412623, 0.05574341, 1, 0, 0.007843138, 1
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
0.05938447, -4.331117, -7.767894, 0, -0.5, 0.5, 0.5,
0.05938447, -4.331117, -7.767894, 1, -0.5, 0.5, 0.5,
0.05938447, -4.331117, -7.767894, 1, 1.5, 0.5, 0.5,
0.05938447, -4.331117, -7.767894, 0, 1.5, 0.5, 0.5
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
-4.006825, -0.1517551, -7.767894, 0, -0.5, 0.5, 0.5,
-4.006825, -0.1517551, -7.767894, 1, -0.5, 0.5, 0.5,
-4.006825, -0.1517551, -7.767894, 1, 1.5, 0.5, 0.5,
-4.006825, -0.1517551, -7.767894, 0, 1.5, 0.5, 0.5
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
-4.006825, -4.331117, -0.2657146, 0, -0.5, 0.5, 0.5,
-4.006825, -4.331117, -0.2657146, 1, -0.5, 0.5, 0.5,
-4.006825, -4.331117, -0.2657146, 1, 1.5, 0.5, 0.5,
-4.006825, -4.331117, -0.2657146, 0, 1.5, 0.5, 0.5
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
-2, -3.366649, -6.036622,
3, -3.366649, -6.036622,
-2, -3.366649, -6.036622,
-2, -3.527394, -6.325167,
-1, -3.366649, -6.036622,
-1, -3.527394, -6.325167,
0, -3.366649, -6.036622,
0, -3.527394, -6.325167,
1, -3.366649, -6.036622,
1, -3.527394, -6.325167,
2, -3.366649, -6.036622,
2, -3.527394, -6.325167,
3, -3.366649, -6.036622,
3, -3.527394, -6.325167
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
-2, -3.848883, -6.902257, 0, -0.5, 0.5, 0.5,
-2, -3.848883, -6.902257, 1, -0.5, 0.5, 0.5,
-2, -3.848883, -6.902257, 1, 1.5, 0.5, 0.5,
-2, -3.848883, -6.902257, 0, 1.5, 0.5, 0.5,
-1, -3.848883, -6.902257, 0, -0.5, 0.5, 0.5,
-1, -3.848883, -6.902257, 1, -0.5, 0.5, 0.5,
-1, -3.848883, -6.902257, 1, 1.5, 0.5, 0.5,
-1, -3.848883, -6.902257, 0, 1.5, 0.5, 0.5,
0, -3.848883, -6.902257, 0, -0.5, 0.5, 0.5,
0, -3.848883, -6.902257, 1, -0.5, 0.5, 0.5,
0, -3.848883, -6.902257, 1, 1.5, 0.5, 0.5,
0, -3.848883, -6.902257, 0, 1.5, 0.5, 0.5,
1, -3.848883, -6.902257, 0, -0.5, 0.5, 0.5,
1, -3.848883, -6.902257, 1, -0.5, 0.5, 0.5,
1, -3.848883, -6.902257, 1, 1.5, 0.5, 0.5,
1, -3.848883, -6.902257, 0, 1.5, 0.5, 0.5,
2, -3.848883, -6.902257, 0, -0.5, 0.5, 0.5,
2, -3.848883, -6.902257, 1, -0.5, 0.5, 0.5,
2, -3.848883, -6.902257, 1, 1.5, 0.5, 0.5,
2, -3.848883, -6.902257, 0, 1.5, 0.5, 0.5,
3, -3.848883, -6.902257, 0, -0.5, 0.5, 0.5,
3, -3.848883, -6.902257, 1, -0.5, 0.5, 0.5,
3, -3.848883, -6.902257, 1, 1.5, 0.5, 0.5,
3, -3.848883, -6.902257, 0, 1.5, 0.5, 0.5
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
-3.068469, -3, -6.036622,
-3.068469, 2, -6.036622,
-3.068469, -3, -6.036622,
-3.224862, -3, -6.325167,
-3.068469, -2, -6.036622,
-3.224862, -2, -6.325167,
-3.068469, -1, -6.036622,
-3.224862, -1, -6.325167,
-3.068469, 0, -6.036622,
-3.224862, 0, -6.325167,
-3.068469, 1, -6.036622,
-3.224862, 1, -6.325167,
-3.068469, 2, -6.036622,
-3.224862, 2, -6.325167
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
-3.537647, -3, -6.902257, 0, -0.5, 0.5, 0.5,
-3.537647, -3, -6.902257, 1, -0.5, 0.5, 0.5,
-3.537647, -3, -6.902257, 1, 1.5, 0.5, 0.5,
-3.537647, -3, -6.902257, 0, 1.5, 0.5, 0.5,
-3.537647, -2, -6.902257, 0, -0.5, 0.5, 0.5,
-3.537647, -2, -6.902257, 1, -0.5, 0.5, 0.5,
-3.537647, -2, -6.902257, 1, 1.5, 0.5, 0.5,
-3.537647, -2, -6.902257, 0, 1.5, 0.5, 0.5,
-3.537647, -1, -6.902257, 0, -0.5, 0.5, 0.5,
-3.537647, -1, -6.902257, 1, -0.5, 0.5, 0.5,
-3.537647, -1, -6.902257, 1, 1.5, 0.5, 0.5,
-3.537647, -1, -6.902257, 0, 1.5, 0.5, 0.5,
-3.537647, 0, -6.902257, 0, -0.5, 0.5, 0.5,
-3.537647, 0, -6.902257, 1, -0.5, 0.5, 0.5,
-3.537647, 0, -6.902257, 1, 1.5, 0.5, 0.5,
-3.537647, 0, -6.902257, 0, 1.5, 0.5, 0.5,
-3.537647, 1, -6.902257, 0, -0.5, 0.5, 0.5,
-3.537647, 1, -6.902257, 1, -0.5, 0.5, 0.5,
-3.537647, 1, -6.902257, 1, 1.5, 0.5, 0.5,
-3.537647, 1, -6.902257, 0, 1.5, 0.5, 0.5,
-3.537647, 2, -6.902257, 0, -0.5, 0.5, 0.5,
-3.537647, 2, -6.902257, 1, -0.5, 0.5, 0.5,
-3.537647, 2, -6.902257, 1, 1.5, 0.5, 0.5,
-3.537647, 2, -6.902257, 0, 1.5, 0.5, 0.5
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
-3.068469, -3.366649, -4,
-3.068469, -3.366649, 4,
-3.068469, -3.366649, -4,
-3.224862, -3.527394, -4,
-3.068469, -3.366649, -2,
-3.224862, -3.527394, -2,
-3.068469, -3.366649, 0,
-3.224862, -3.527394, 0,
-3.068469, -3.366649, 2,
-3.224862, -3.527394, 2,
-3.068469, -3.366649, 4,
-3.224862, -3.527394, 4
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
-3.537647, -3.848883, -4, 0, -0.5, 0.5, 0.5,
-3.537647, -3.848883, -4, 1, -0.5, 0.5, 0.5,
-3.537647, -3.848883, -4, 1, 1.5, 0.5, 0.5,
-3.537647, -3.848883, -4, 0, 1.5, 0.5, 0.5,
-3.537647, -3.848883, -2, 0, -0.5, 0.5, 0.5,
-3.537647, -3.848883, -2, 1, -0.5, 0.5, 0.5,
-3.537647, -3.848883, -2, 1, 1.5, 0.5, 0.5,
-3.537647, -3.848883, -2, 0, 1.5, 0.5, 0.5,
-3.537647, -3.848883, 0, 0, -0.5, 0.5, 0.5,
-3.537647, -3.848883, 0, 1, -0.5, 0.5, 0.5,
-3.537647, -3.848883, 0, 1, 1.5, 0.5, 0.5,
-3.537647, -3.848883, 0, 0, 1.5, 0.5, 0.5,
-3.537647, -3.848883, 2, 0, -0.5, 0.5, 0.5,
-3.537647, -3.848883, 2, 1, -0.5, 0.5, 0.5,
-3.537647, -3.848883, 2, 1, 1.5, 0.5, 0.5,
-3.537647, -3.848883, 2, 0, 1.5, 0.5, 0.5,
-3.537647, -3.848883, 4, 0, -0.5, 0.5, 0.5,
-3.537647, -3.848883, 4, 1, -0.5, 0.5, 0.5,
-3.537647, -3.848883, 4, 1, 1.5, 0.5, 0.5,
-3.537647, -3.848883, 4, 0, 1.5, 0.5, 0.5
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
-3.068469, -3.366649, -6.036622,
-3.068469, 3.063139, -6.036622,
-3.068469, -3.366649, 5.505192,
-3.068469, 3.063139, 5.505192,
-3.068469, -3.366649, -6.036622,
-3.068469, -3.366649, 5.505192,
-3.068469, 3.063139, -6.036622,
-3.068469, 3.063139, 5.505192,
-3.068469, -3.366649, -6.036622,
3.187238, -3.366649, -6.036622,
-3.068469, -3.366649, 5.505192,
3.187238, -3.366649, 5.505192,
-3.068469, 3.063139, -6.036622,
3.187238, 3.063139, -6.036622,
-3.068469, 3.063139, 5.505192,
3.187238, 3.063139, 5.505192,
3.187238, -3.366649, -6.036622,
3.187238, 3.063139, -6.036622,
3.187238, -3.366649, 5.505192,
3.187238, 3.063139, 5.505192,
3.187238, -3.366649, -6.036622,
3.187238, -3.366649, 5.505192,
3.187238, 3.063139, -6.036622,
3.187238, 3.063139, 5.505192
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
var radius = 7.805794;
var distance = 34.72886;
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
mvMatrix.translate( -0.05938447, 0.1517551, 0.2657146 );
mvMatrix.scale( 1.349132, 1.312606, 0.7312349 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.72886);
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
Propoxur<-read.table("Propoxur.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Propoxur$V2
```

```
## Error in eval(expr, envir, enclos): object 'Propoxur' not found
```

```r
y<-Propoxur$V3
```

```
## Error in eval(expr, envir, enclos): object 'Propoxur' not found
```

```r
z<-Propoxur$V4
```

```
## Error in eval(expr, envir, enclos): object 'Propoxur' not found
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
-2.977367, -0.8257948, -2.931113, 0, 0, 1, 1, 1,
-2.657896, 0.661424, -4.588154, 1, 0, 0, 1, 1,
-2.641123, 2.452381, -2.624062, 1, 0, 0, 1, 1,
-2.387325, -1.543469, -0.9966432, 1, 0, 0, 1, 1,
-2.276636, 1.046774, -1.213794, 1, 0, 0, 1, 1,
-2.269952, -1.281163, -2.559829, 1, 0, 0, 1, 1,
-2.226037, 0.4338949, 0.1291743, 0, 0, 0, 1, 1,
-2.190607, 1.27672, -1.56235, 0, 0, 0, 1, 1,
-2.125235, -1.948556, -1.565158, 0, 0, 0, 1, 1,
-2.116336, -1.166026, -4.68153, 0, 0, 0, 1, 1,
-2.099038, 0.7658862, -2.504586, 0, 0, 0, 1, 1,
-2.072073, -0.4498809, -1.36533, 0, 0, 0, 1, 1,
-2.062228, -1.70296, -2.914414, 0, 0, 0, 1, 1,
-2.040573, -1.494197, -1.860074, 1, 1, 1, 1, 1,
-2.024102, 0.4212616, -1.383872, 1, 1, 1, 1, 1,
-2.001709, 0.156268, -1.474471, 1, 1, 1, 1, 1,
-2.001362, -0.1129425, -0.9423044, 1, 1, 1, 1, 1,
-1.988181, -0.9234046, -4.317799, 1, 1, 1, 1, 1,
-1.95426, 0.1706147, -1.366652, 1, 1, 1, 1, 1,
-1.9214, -0.03009525, -3.067553, 1, 1, 1, 1, 1,
-1.910357, -0.1525189, 0.9190533, 1, 1, 1, 1, 1,
-1.904965, 1.117691, -3.037496, 1, 1, 1, 1, 1,
-1.896315, 0.7181043, 0.4034264, 1, 1, 1, 1, 1,
-1.891619, 0.09824079, -1.505622, 1, 1, 1, 1, 1,
-1.861918, 0.03359821, 0.5317591, 1, 1, 1, 1, 1,
-1.856986, 0.6656082, -1.835241, 1, 1, 1, 1, 1,
-1.820489, -0.1323961, -2.682594, 1, 1, 1, 1, 1,
-1.805127, -0.4062665, -1.817627, 1, 1, 1, 1, 1,
-1.805004, -1.736754, -1.582578, 0, 0, 1, 1, 1,
-1.768441, -0.6840196, -2.020154, 1, 0, 0, 1, 1,
-1.760071, -2.201773, -3.277531, 1, 0, 0, 1, 1,
-1.707005, 0.4962718, -1.578305, 1, 0, 0, 1, 1,
-1.703309, 1.061283, -1.909988, 1, 0, 0, 1, 1,
-1.701061, -0.02253187, -1.682547, 1, 0, 0, 1, 1,
-1.693133, -0.8907666, -1.79861, 0, 0, 0, 1, 1,
-1.691488, 0.01213856, -2.257432, 0, 0, 0, 1, 1,
-1.677972, -2.181039, -3.685337, 0, 0, 0, 1, 1,
-1.670899, 0.6859574, -1.356004, 0, 0, 0, 1, 1,
-1.668469, 0.2296021, -2.703166, 0, 0, 0, 1, 1,
-1.662945, -1.068967, -4.580777, 0, 0, 0, 1, 1,
-1.656715, -1.655173, -3.769817, 0, 0, 0, 1, 1,
-1.654213, -1.098105, -1.511716, 1, 1, 1, 1, 1,
-1.654172, 0.0479679, -3.735677, 1, 1, 1, 1, 1,
-1.653955, 0.4067829, -3.178921, 1, 1, 1, 1, 1,
-1.651841, -0.972457, -1.783374, 1, 1, 1, 1, 1,
-1.634781, 0.8911131, -1.28871, 1, 1, 1, 1, 1,
-1.633047, -0.4214495, -1.497528, 1, 1, 1, 1, 1,
-1.616235, -0.3371024, -2.913304, 1, 1, 1, 1, 1,
-1.611392, 1.780852, 1.702098, 1, 1, 1, 1, 1,
-1.606587, 0.4939006, -0.5838334, 1, 1, 1, 1, 1,
-1.598565, -0.5943913, -1.803505, 1, 1, 1, 1, 1,
-1.595325, 1.269905, -1.356099, 1, 1, 1, 1, 1,
-1.588909, 0.9658094, 0.0938563, 1, 1, 1, 1, 1,
-1.586318, 0.03343311, -0.8376499, 1, 1, 1, 1, 1,
-1.5724, 0.6325439, -2.295878, 1, 1, 1, 1, 1,
-1.546494, 0.1571403, -2.135556, 1, 1, 1, 1, 1,
-1.53824, 1.77053, 0.07419838, 0, 0, 1, 1, 1,
-1.522467, -0.587087, -2.76061, 1, 0, 0, 1, 1,
-1.519169, 0.6988999, 0.4346032, 1, 0, 0, 1, 1,
-1.511074, 0.2630336, -3.057521, 1, 0, 0, 1, 1,
-1.500008, 0.3142343, -3.919374, 1, 0, 0, 1, 1,
-1.497143, 1.424652, -0.03758818, 1, 0, 0, 1, 1,
-1.493836, 1.331624, 0.4811462, 0, 0, 0, 1, 1,
-1.492682, 0.2775426, -3.390761, 0, 0, 0, 1, 1,
-1.492479, -1.320115, -2.23687, 0, 0, 0, 1, 1,
-1.488472, -0.7626308, -2.056658, 0, 0, 0, 1, 1,
-1.487375, -1.57116, -1.79087, 0, 0, 0, 1, 1,
-1.485504, -1.908785, -2.531293, 0, 0, 0, 1, 1,
-1.471967, 1.257942, -0.9366168, 0, 0, 0, 1, 1,
-1.461307, 1.959702, -1.950605, 1, 1, 1, 1, 1,
-1.448967, 2.600504, 1.497802, 1, 1, 1, 1, 1,
-1.426385, 1.050608, 2.03479, 1, 1, 1, 1, 1,
-1.418311, -0.08482852, -2.60555, 1, 1, 1, 1, 1,
-1.417496, -0.4310315, -1.394462, 1, 1, 1, 1, 1,
-1.412347, 0.3039011, -2.779801, 1, 1, 1, 1, 1,
-1.391896, 1.288565, -1.149824, 1, 1, 1, 1, 1,
-1.38765, -0.6681978, -1.799185, 1, 1, 1, 1, 1,
-1.381231, 0.5192944, -1.555362, 1, 1, 1, 1, 1,
-1.377692, 0.607551, 1.751741, 1, 1, 1, 1, 1,
-1.367844, -0.002134823, -0.05931674, 1, 1, 1, 1, 1,
-1.363628, 2.969501, -0.5976167, 1, 1, 1, 1, 1,
-1.362254, 1.407253, -1.197934, 1, 1, 1, 1, 1,
-1.356439, 0.1760292, -0.3215279, 1, 1, 1, 1, 1,
-1.356045, 0.3117755, -0.2849602, 1, 1, 1, 1, 1,
-1.300648, -0.3019136, -1.904243, 0, 0, 1, 1, 1,
-1.2971, 0.230046, -1.494895, 1, 0, 0, 1, 1,
-1.286191, -0.1831529, -0.8866543, 1, 0, 0, 1, 1,
-1.266037, 0.4228466, -1.027731, 1, 0, 0, 1, 1,
-1.260598, -0.09127628, -1.340845, 1, 0, 0, 1, 1,
-1.260262, 0.5076318, -0.2339693, 1, 0, 0, 1, 1,
-1.258026, 0.1419191, -2.704617, 0, 0, 0, 1, 1,
-1.251065, 0.9741312, 1.042182, 0, 0, 0, 1, 1,
-1.250441, -1.148859, -2.233342, 0, 0, 0, 1, 1,
-1.250312, 1.155743, 0.3589163, 0, 0, 0, 1, 1,
-1.248147, 0.674544, -1.160854, 0, 0, 0, 1, 1,
-1.246892, 0.1480806, -0.4131396, 0, 0, 0, 1, 1,
-1.243231, -2.043217, -2.385065, 0, 0, 0, 1, 1,
-1.238, 0.7530703, 0.6033567, 1, 1, 1, 1, 1,
-1.235438, 0.5159639, -1.202332, 1, 1, 1, 1, 1,
-1.22443, -0.7466599, -2.103132, 1, 1, 1, 1, 1,
-1.223042, 0.4668588, -0.4555108, 1, 1, 1, 1, 1,
-1.221843, 2.260812, 1.79623, 1, 1, 1, 1, 1,
-1.22154, 0.3108753, -1.73466, 1, 1, 1, 1, 1,
-1.214046, 0.8122985, -1.639222, 1, 1, 1, 1, 1,
-1.207041, -1.175768, -1.827012, 1, 1, 1, 1, 1,
-1.205143, -1.407914, -2.099851, 1, 1, 1, 1, 1,
-1.192196, 0.3982095, -1.656891, 1, 1, 1, 1, 1,
-1.183556, -0.2903466, -0.9699193, 1, 1, 1, 1, 1,
-1.182063, 2.890007, -1.127588, 1, 1, 1, 1, 1,
-1.175931, -0.01316108, -1.08297, 1, 1, 1, 1, 1,
-1.174838, -1.53278, -1.137555, 1, 1, 1, 1, 1,
-1.168165, -0.7554688, -2.867031, 1, 1, 1, 1, 1,
-1.164683, -0.3635537, -3.105269, 0, 0, 1, 1, 1,
-1.161994, -0.2435742, -1.591143, 1, 0, 0, 1, 1,
-1.153498, 0.1231532, -2.227245, 1, 0, 0, 1, 1,
-1.152297, 0.297659, -1.421843, 1, 0, 0, 1, 1,
-1.143687, -0.4544173, -1.611069, 1, 0, 0, 1, 1,
-1.139643, 0.2043318, -1.6942, 1, 0, 0, 1, 1,
-1.129666, 0.3833292, -1.512793, 0, 0, 0, 1, 1,
-1.1271, -0.6710768, -1.52864, 0, 0, 0, 1, 1,
-1.12332, 0.2114144, -1.228316, 0, 0, 0, 1, 1,
-1.120958, 0.4672691, -0.08011692, 0, 0, 0, 1, 1,
-1.120798, -0.02581869, -1.736006, 0, 0, 0, 1, 1,
-1.100482, 1.690817, -1.016538, 0, 0, 0, 1, 1,
-1.095054, 1.168972, -0.574012, 0, 0, 0, 1, 1,
-1.093389, -0.1277417, -1.563196, 1, 1, 1, 1, 1,
-1.072219, -1.05692, -3.379248, 1, 1, 1, 1, 1,
-1.070391, -1.403533, -4.028405, 1, 1, 1, 1, 1,
-1.069865, 0.7915366, -1.709141, 1, 1, 1, 1, 1,
-1.065125, -1.824862, -1.759221, 1, 1, 1, 1, 1,
-1.065008, 0.1298274, -2.112858, 1, 1, 1, 1, 1,
-1.064561, -0.8256575, -1.644785, 1, 1, 1, 1, 1,
-1.064332, -1.319714, -0.69142, 1, 1, 1, 1, 1,
-1.063054, 0.01712632, 0.09575936, 1, 1, 1, 1, 1,
-1.061798, -1.136723, -2.70451, 1, 1, 1, 1, 1,
-1.060209, -1.130378, -3.838558, 1, 1, 1, 1, 1,
-1.053814, 0.2555604, -2.757182, 1, 1, 1, 1, 1,
-1.053485, -1.734003, -4.073577, 1, 1, 1, 1, 1,
-1.04601, 0.8144215, -0.5081828, 1, 1, 1, 1, 1,
-1.037431, -1.200843, -2.508528, 1, 1, 1, 1, 1,
-1.036875, 1.735019, 0.6874069, 0, 0, 1, 1, 1,
-1.034682, -1.832151, -1.702332, 1, 0, 0, 1, 1,
-1.032627, -0.612054, -0.672581, 1, 0, 0, 1, 1,
-1.030107, 0.1980223, 0.9714839, 1, 0, 0, 1, 1,
-1.028538, 0.6113372, -1.428672, 1, 0, 0, 1, 1,
-1.019586, -0.216472, -1.268253, 1, 0, 0, 1, 1,
-1.015379, -2.574143, -3.808497, 0, 0, 0, 1, 1,
-1.002037, -0.73807, -2.35027, 0, 0, 0, 1, 1,
-0.9984003, -0.7969109, -1.08288, 0, 0, 0, 1, 1,
-0.9957353, 0.6284621, -1.182898, 0, 0, 0, 1, 1,
-0.9954028, 0.9676778, -1.315467, 0, 0, 0, 1, 1,
-0.9883505, -0.06073853, -1.184481, 0, 0, 0, 1, 1,
-0.9844096, 0.5086427, -2.735731, 0, 0, 0, 1, 1,
-0.9829802, -0.1890568, -1.729534, 1, 1, 1, 1, 1,
-0.9814821, 0.08863707, -2.326452, 1, 1, 1, 1, 1,
-0.9723714, -0.5417366, -3.167294, 1, 1, 1, 1, 1,
-0.9587439, -1.063802, -2.575721, 1, 1, 1, 1, 1,
-0.9574293, 0.6656528, -1.009778, 1, 1, 1, 1, 1,
-0.9561058, 0.2063563, -1.248631, 1, 1, 1, 1, 1,
-0.9487376, 0.4133306, -0.01340411, 1, 1, 1, 1, 1,
-0.9486521, -1.653437, -1.547771, 1, 1, 1, 1, 1,
-0.9466817, 2.049, -1.439064, 1, 1, 1, 1, 1,
-0.9443526, 0.7433894, -0.1737502, 1, 1, 1, 1, 1,
-0.9357248, 0.4812843, -2.983533, 1, 1, 1, 1, 1,
-0.9354156, 2.271193, -2.69783, 1, 1, 1, 1, 1,
-0.9256576, -0.582573, -2.223166, 1, 1, 1, 1, 1,
-0.9248447, -0.484809, -1.624878, 1, 1, 1, 1, 1,
-0.9076972, 0.759564, -0.6876624, 1, 1, 1, 1, 1,
-0.9046838, 0.3699691, -1.495368, 0, 0, 1, 1, 1,
-0.904415, 2.931478, -0.6696298, 1, 0, 0, 1, 1,
-0.9038531, -1.333581, -1.499848, 1, 0, 0, 1, 1,
-0.9016112, -0.2785713, -3.480762, 1, 0, 0, 1, 1,
-0.9007453, 0.8197706, -1.580502, 1, 0, 0, 1, 1,
-0.8966587, 0.3907873, -2.541951, 1, 0, 0, 1, 1,
-0.8922297, -0.2257437, -1.45511, 0, 0, 0, 1, 1,
-0.8885629, -0.04926362, -2.622316, 0, 0, 0, 1, 1,
-0.882717, -0.584478, 0.2817393, 0, 0, 0, 1, 1,
-0.8749363, -0.01826272, -0.6589505, 0, 0, 0, 1, 1,
-0.8698863, 0.08906439, -1.139881, 0, 0, 0, 1, 1,
-0.8627768, -0.5282348, -3.719664, 0, 0, 0, 1, 1,
-0.8494614, 0.5605543, -1.146292, 0, 0, 0, 1, 1,
-0.8343197, -0.08315635, -2.912271, 1, 1, 1, 1, 1,
-0.8289506, 0.6105371, -3.112691, 1, 1, 1, 1, 1,
-0.8284123, -1.679519, -2.612119, 1, 1, 1, 1, 1,
-0.8224545, -0.08299716, -3.48041, 1, 1, 1, 1, 1,
-0.8182753, -0.3869915, -0.8909379, 1, 1, 1, 1, 1,
-0.8078327, -0.7616558, -3.191469, 1, 1, 1, 1, 1,
-0.8038083, -0.627243, -3.650982, 1, 1, 1, 1, 1,
-0.8029458, -0.01065638, 1.119662, 1, 1, 1, 1, 1,
-0.8026297, -0.4094584, -2.361827, 1, 1, 1, 1, 1,
-0.7906892, -0.9072319, -2.124681, 1, 1, 1, 1, 1,
-0.7893265, -0.4580758, -1.661963, 1, 1, 1, 1, 1,
-0.7872173, 0.8346812, -0.9363625, 1, 1, 1, 1, 1,
-0.7855375, 1.036797, -0.1199972, 1, 1, 1, 1, 1,
-0.7772178, -1.011855, -2.114766, 1, 1, 1, 1, 1,
-0.7741171, -1.132634, -1.978133, 1, 1, 1, 1, 1,
-0.7727358, 0.6548644, -2.351222, 0, 0, 1, 1, 1,
-0.7709096, -1.379385, -3.20195, 1, 0, 0, 1, 1,
-0.7640059, -0.08268435, 0.08609601, 1, 0, 0, 1, 1,
-0.7556667, 0.1350625, -1.212463, 1, 0, 0, 1, 1,
-0.7547895, 0.9892094, -0.2098425, 1, 0, 0, 1, 1,
-0.754783, 0.5382234, -1.166574, 1, 0, 0, 1, 1,
-0.7502035, 1.153102, -0.283845, 0, 0, 0, 1, 1,
-0.7480218, 0.8273205, 0.6220365, 0, 0, 0, 1, 1,
-0.7456617, 1.253483, -1.953606, 0, 0, 0, 1, 1,
-0.7443668, -0.3562404, -1.922177, 0, 0, 0, 1, 1,
-0.7401955, -0.4351291, -2.803938, 0, 0, 0, 1, 1,
-0.7398521, -0.9195982, -3.383607, 0, 0, 0, 1, 1,
-0.7368629, -1.610561, -4.838085, 0, 0, 0, 1, 1,
-0.7330723, -1.030053, -0.8187554, 1, 1, 1, 1, 1,
-0.7278569, -0.7754544, -4.618736, 1, 1, 1, 1, 1,
-0.7271211, 0.3614818, 0.9744326, 1, 1, 1, 1, 1,
-0.7256439, 0.8015912, 0.2344633, 1, 1, 1, 1, 1,
-0.7217681, -1.05721, -2.588309, 1, 1, 1, 1, 1,
-0.7198098, 0.5270349, -0.9522085, 1, 1, 1, 1, 1,
-0.7141771, -0.1125374, 0.5962623, 1, 1, 1, 1, 1,
-0.710031, -0.7131487, -1.475725, 1, 1, 1, 1, 1,
-0.7076945, 0.8614398, -0.4000575, 1, 1, 1, 1, 1,
-0.7065215, 1.301307, 0.5964037, 1, 1, 1, 1, 1,
-0.704368, -1.604944, -1.784325, 1, 1, 1, 1, 1,
-0.7012889, -1.155089, -2.809175, 1, 1, 1, 1, 1,
-0.70113, -0.7987525, -1.14805, 1, 1, 1, 1, 1,
-0.7002995, 0.3890762, -2.497601, 1, 1, 1, 1, 1,
-0.6979191, 1.195071, -0.6774808, 1, 1, 1, 1, 1,
-0.6959418, 0.14598, -0.1661519, 0, 0, 1, 1, 1,
-0.6921366, 0.4634868, -1.865825, 1, 0, 0, 1, 1,
-0.6896825, 0.418418, 0.997963, 1, 0, 0, 1, 1,
-0.6875358, 0.9565874, -0.1507478, 1, 0, 0, 1, 1,
-0.6827196, -0.6703837, -3.247376, 1, 0, 0, 1, 1,
-0.6812154, 0.20678, -1.645574, 1, 0, 0, 1, 1,
-0.6795781, -1.258324, -2.994199, 0, 0, 0, 1, 1,
-0.6769045, 0.2094778, -0.09696511, 0, 0, 0, 1, 1,
-0.6733987, 0.5121866, -2.358544, 0, 0, 0, 1, 1,
-0.6721663, -0.8523927, -1.845653, 0, 0, 0, 1, 1,
-0.6706831, 0.3756011, -0.4655394, 0, 0, 0, 1, 1,
-0.6679598, 0.2733682, -1.011632, 0, 0, 0, 1, 1,
-0.6679545, 0.1990193, -0.8487487, 0, 0, 0, 1, 1,
-0.6647083, 0.4840846, -0.3325632, 1, 1, 1, 1, 1,
-0.6575305, 0.3739731, 0.4946391, 1, 1, 1, 1, 1,
-0.6509287, 0.853568, 0.3980691, 1, 1, 1, 1, 1,
-0.6437927, -0.9375562, -3.655607, 1, 1, 1, 1, 1,
-0.6362153, 0.6967201, -3.373848, 1, 1, 1, 1, 1,
-0.6328803, 0.6432734, -1.545589, 1, 1, 1, 1, 1,
-0.6285979, -0.9421434, -1.498385, 1, 1, 1, 1, 1,
-0.6252213, -0.7494059, -1.850512, 1, 1, 1, 1, 1,
-0.6219834, -0.3800516, -3.05558, 1, 1, 1, 1, 1,
-0.620333, -2.372145, -4.574661, 1, 1, 1, 1, 1,
-0.6175537, -2.97565, -1.126167, 1, 1, 1, 1, 1,
-0.6173087, 0.3770737, -1.535748, 1, 1, 1, 1, 1,
-0.6156874, 0.5159412, 0.2762685, 1, 1, 1, 1, 1,
-0.6138661, 0.8443175, -2.398769, 1, 1, 1, 1, 1,
-0.6040779, 0.02970208, -1.1714, 1, 1, 1, 1, 1,
-0.602388, -0.1195127, -2.354541, 0, 0, 1, 1, 1,
-0.6022679, -0.6516628, -3.605933, 1, 0, 0, 1, 1,
-0.6017727, 1.630095, -0.5116214, 1, 0, 0, 1, 1,
-0.5925149, 1.705464, -1.360464, 1, 0, 0, 1, 1,
-0.5913474, 1.418797, 0.1754283, 1, 0, 0, 1, 1,
-0.5913367, 0.9064237, -1.103498, 1, 0, 0, 1, 1,
-0.5852241, 2.571194, 0.4931533, 0, 0, 0, 1, 1,
-0.5848051, 0.3642706, -1.033264, 0, 0, 0, 1, 1,
-0.5810542, -0.6285806, -2.525024, 0, 0, 0, 1, 1,
-0.5782732, -1.086526, -2.582706, 0, 0, 0, 1, 1,
-0.5733392, 1.077935, -1.421951, 0, 0, 0, 1, 1,
-0.5662101, 1.678511, -0.6251301, 0, 0, 0, 1, 1,
-0.5656236, 0.01124137, -1.95692, 0, 0, 0, 1, 1,
-0.5638172, 0.4989364, 0.1699898, 1, 1, 1, 1, 1,
-0.5584413, -0.06045979, 0.3075896, 1, 1, 1, 1, 1,
-0.5558849, 0.5629095, 2.075924, 1, 1, 1, 1, 1,
-0.550563, -1.920216, -3.425857, 1, 1, 1, 1, 1,
-0.5475478, 1.649228, -0.2311495, 1, 1, 1, 1, 1,
-0.5475212, -0.3475951, -2.744846, 1, 1, 1, 1, 1,
-0.5421817, 0.236994, -1.21242, 1, 1, 1, 1, 1,
-0.5415421, -1.028608, -2.457159, 1, 1, 1, 1, 1,
-0.541369, -0.3875014, -2.011204, 1, 1, 1, 1, 1,
-0.5361884, 0.09094992, 0.2784387, 1, 1, 1, 1, 1,
-0.5361419, -0.13486, -1.837518, 1, 1, 1, 1, 1,
-0.531811, -1.298625, -2.772469, 1, 1, 1, 1, 1,
-0.5291436, -0.9762132, -3.851636, 1, 1, 1, 1, 1,
-0.5290743, -0.4770912, -3.220347, 1, 1, 1, 1, 1,
-0.524327, 0.428322, -1.211246, 1, 1, 1, 1, 1,
-0.5195262, 0.9821377, -0.2591394, 0, 0, 1, 1, 1,
-0.5195062, 0.3725052, -1.020579, 1, 0, 0, 1, 1,
-0.5189605, -0.1446465, -1.546496, 1, 0, 0, 1, 1,
-0.516781, 1.295904, 0.248088, 1, 0, 0, 1, 1,
-0.5153821, 0.1336298, -0.5030002, 1, 0, 0, 1, 1,
-0.5128548, 0.2143382, -2.043815, 1, 0, 0, 1, 1,
-0.5073336, -1.625292, -2.575013, 0, 0, 0, 1, 1,
-0.5049011, 0.5462537, -1.404289, 0, 0, 0, 1, 1,
-0.5036166, 0.4433875, -0.8662703, 0, 0, 0, 1, 1,
-0.4985999, 0.2950379, -1.691639, 0, 0, 0, 1, 1,
-0.4979635, -0.09756035, -1.631994, 0, 0, 0, 1, 1,
-0.4977718, 0.2762307, -0.9229017, 0, 0, 0, 1, 1,
-0.4940203, -1.802302, -3.715778, 0, 0, 0, 1, 1,
-0.4935589, 0.2655508, -0.6655255, 1, 1, 1, 1, 1,
-0.4905128, 0.4279094, -0.9757215, 1, 1, 1, 1, 1,
-0.4890693, 0.262225, -3.01245, 1, 1, 1, 1, 1,
-0.4868009, 0.5108081, -0.9144807, 1, 1, 1, 1, 1,
-0.4855241, -0.3807529, -1.345205, 1, 1, 1, 1, 1,
-0.4811769, -0.3621956, -3.593282, 1, 1, 1, 1, 1,
-0.4803869, -1.362311, -4.616053, 1, 1, 1, 1, 1,
-0.4737324, -0.5246842, -1.112766, 1, 1, 1, 1, 1,
-0.4713923, -0.3473788, -1.148179, 1, 1, 1, 1, 1,
-0.4674407, 1.622921, 0.4175771, 1, 1, 1, 1, 1,
-0.4673321, 1.358414, 1.14849, 1, 1, 1, 1, 1,
-0.4639019, 0.9518358, -0.3255807, 1, 1, 1, 1, 1,
-0.4626929, -0.2247675, -0.6873132, 1, 1, 1, 1, 1,
-0.4572633, -0.1145994, -2.286746, 1, 1, 1, 1, 1,
-0.4570333, -0.9753968, -4.220665, 1, 1, 1, 1, 1,
-0.4535228, 1.104145, -1.649266, 0, 0, 1, 1, 1,
-0.4512696, 1.558088, -0.845739, 1, 0, 0, 1, 1,
-0.4506025, 0.5896574, -0.2383987, 1, 0, 0, 1, 1,
-0.4453717, -0.752199, -0.5751492, 1, 0, 0, 1, 1,
-0.444915, 0.7339782, -0.3295792, 1, 0, 0, 1, 1,
-0.4416409, 0.1918122, 0.6468005, 1, 0, 0, 1, 1,
-0.4388367, 1.259576, -0.9370128, 0, 0, 0, 1, 1,
-0.436538, 0.4947844, 0.6159185, 0, 0, 0, 1, 1,
-0.4360303, 0.1628899, -2.169245, 0, 0, 0, 1, 1,
-0.4336873, 0.3030117, -0.3893013, 0, 0, 0, 1, 1,
-0.4288851, -0.3430493, -2.841378, 0, 0, 0, 1, 1,
-0.4286159, 0.7176294, 0.08320954, 0, 0, 0, 1, 1,
-0.4272827, 1.797466, 3.291571, 0, 0, 0, 1, 1,
-0.4212299, -0.1562312, -2.188597, 1, 1, 1, 1, 1,
-0.4211734, 0.3228693, -0.5912145, 1, 1, 1, 1, 1,
-0.4197856, 1.823522, 0.6752421, 1, 1, 1, 1, 1,
-0.4193993, 0.2825271, -2.408741, 1, 1, 1, 1, 1,
-0.4030869, -0.1869713, -0.7877274, 1, 1, 1, 1, 1,
-0.3993456, 0.6768996, -3.376646, 1, 1, 1, 1, 1,
-0.3949577, 0.1497279, -1.722236, 1, 1, 1, 1, 1,
-0.3927061, -0.5520066, -2.035643, 1, 1, 1, 1, 1,
-0.388011, -0.7507278, -3.465608, 1, 1, 1, 1, 1,
-0.3872685, -1.516605, -3.159451, 1, 1, 1, 1, 1,
-0.3810292, -1.836965, -2.90667, 1, 1, 1, 1, 1,
-0.3808554, 1.630423, 0.8054681, 1, 1, 1, 1, 1,
-0.3763452, -1.416165, -5.401546, 1, 1, 1, 1, 1,
-0.3722906, -0.8164837, -1.606334, 1, 1, 1, 1, 1,
-0.3711648, 0.4464895, -1.230128, 1, 1, 1, 1, 1,
-0.3675613, 0.5872662, -0.8561274, 0, 0, 1, 1, 1,
-0.3672509, 1.688095, 0.737784, 1, 0, 0, 1, 1,
-0.3639492, 0.8980424, -2.303041, 1, 0, 0, 1, 1,
-0.3636848, 0.139287, -1.804047, 1, 0, 0, 1, 1,
-0.3613579, -0.01577004, -1.406989, 1, 0, 0, 1, 1,
-0.352571, 0.001057335, -0.5267482, 1, 0, 0, 1, 1,
-0.3517838, -0.1215672, -1.958956, 0, 0, 0, 1, 1,
-0.350506, -0.4984952, -2.045042, 0, 0, 0, 1, 1,
-0.349557, -1.715413, -3.134822, 0, 0, 0, 1, 1,
-0.3489205, -0.2267518, -0.4811195, 0, 0, 0, 1, 1,
-0.348526, 1.483771, 0.1751702, 0, 0, 0, 1, 1,
-0.3472542, -1.581444, -4.529679, 0, 0, 0, 1, 1,
-0.346167, 0.3045857, -2.012274, 0, 0, 0, 1, 1,
-0.3418934, 0.8971875, 0.1314192, 1, 1, 1, 1, 1,
-0.3401725, 0.1327475, 0.3723225, 1, 1, 1, 1, 1,
-0.3342234, -2.13916, -2.439965, 1, 1, 1, 1, 1,
-0.3299145, 1.058012, 0.4789611, 1, 1, 1, 1, 1,
-0.3256396, -0.01190974, -1.636314, 1, 1, 1, 1, 1,
-0.3247442, -0.5745517, -1.720282, 1, 1, 1, 1, 1,
-0.3158097, 0.7547092, 0.05687862, 1, 1, 1, 1, 1,
-0.3141061, -1.564878, -4.587735, 1, 1, 1, 1, 1,
-0.3121558, -0.3341877, -3.276835, 1, 1, 1, 1, 1,
-0.3116741, 0.6024532, -1.052675, 1, 1, 1, 1, 1,
-0.3062545, -0.3825834, -2.730402, 1, 1, 1, 1, 1,
-0.3032345, -0.5807985, -4.193285, 1, 1, 1, 1, 1,
-0.3029746, 0.1285678, -1.258894, 1, 1, 1, 1, 1,
-0.3002446, -0.6227074, -1.544665, 1, 1, 1, 1, 1,
-0.3000644, 1.620722, -1.445548, 1, 1, 1, 1, 1,
-0.2981947, -0.8024566, -2.106265, 0, 0, 1, 1, 1,
-0.2948594, -0.04007722, -0.7508979, 1, 0, 0, 1, 1,
-0.293604, -1.130627, -1.935421, 1, 0, 0, 1, 1,
-0.2871526, 0.7791194, 0.2632818, 1, 0, 0, 1, 1,
-0.2787232, -0.4415078, -0.4324109, 1, 0, 0, 1, 1,
-0.2773912, -0.1922636, -1.094207, 1, 0, 0, 1, 1,
-0.2729102, 2.293262, -3.1253, 0, 0, 0, 1, 1,
-0.2711912, -0.10207, -0.4230559, 0, 0, 0, 1, 1,
-0.2664885, -1.008821, -5.624723, 0, 0, 0, 1, 1,
-0.2647865, -1.114037, -4.445704, 0, 0, 0, 1, 1,
-0.2646033, -0.02034314, -1.623347, 0, 0, 0, 1, 1,
-0.2641756, -1.637123, -2.126966, 0, 0, 0, 1, 1,
-0.2587795, -1.658701, -3.180747, 0, 0, 0, 1, 1,
-0.2587416, -0.7294829, -3.424842, 1, 1, 1, 1, 1,
-0.2561602, 0.7118686, -0.001978082, 1, 1, 1, 1, 1,
-0.2560655, 0.7117382, -0.6778303, 1, 1, 1, 1, 1,
-0.2542822, -1.208464, -2.025755, 1, 1, 1, 1, 1,
-0.2477601, -1.305669, -2.909684, 1, 1, 1, 1, 1,
-0.2471354, 0.6493185, 0.7685545, 1, 1, 1, 1, 1,
-0.2451359, 0.2089552, -0.6529779, 1, 1, 1, 1, 1,
-0.2450549, -0.6739693, -2.342379, 1, 1, 1, 1, 1,
-0.2439268, -0.3462462, -1.047955, 1, 1, 1, 1, 1,
-0.24253, 0.004406187, -4.003201, 1, 1, 1, 1, 1,
-0.240742, -1.03156, -3.325679, 1, 1, 1, 1, 1,
-0.2399496, -0.9625798, -2.262126, 1, 1, 1, 1, 1,
-0.2373116, 1.014496, -0.6040382, 1, 1, 1, 1, 1,
-0.2296733, 0.5899979, 1.21315, 1, 1, 1, 1, 1,
-0.2258357, -1.009459, -5.868537, 1, 1, 1, 1, 1,
-0.2251975, 1.480627, -0.6956229, 0, 0, 1, 1, 1,
-0.222829, -0.04718526, -1.381804, 1, 0, 0, 1, 1,
-0.2216165, 0.6512338, 1.73186, 1, 0, 0, 1, 1,
-0.2215995, 0.6358643, 1.60042, 1, 0, 0, 1, 1,
-0.2204558, 1.197853, -0.1319793, 1, 0, 0, 1, 1,
-0.2202961, 1.531978, -0.06406049, 1, 0, 0, 1, 1,
-0.2122616, -1.289093, -2.997474, 0, 0, 0, 1, 1,
-0.2103135, 0.4168501, 0.5500913, 0, 0, 0, 1, 1,
-0.2082252, 0.8354075, -0.4543304, 0, 0, 0, 1, 1,
-0.2067334, -0.4227468, -0.2278264, 0, 0, 0, 1, 1,
-0.2043339, 0.009262124, -1.28195, 0, 0, 0, 1, 1,
-0.2033322, -0.1005343, -1.297474, 0, 0, 0, 1, 1,
-0.1997295, -0.2371551, -2.642557, 0, 0, 0, 1, 1,
-0.1980264, 0.1650931, -0.8562077, 1, 1, 1, 1, 1,
-0.1971851, 0.7024413, -0.5587173, 1, 1, 1, 1, 1,
-0.1917051, 0.1957582, -0.7696221, 1, 1, 1, 1, 1,
-0.1911533, 0.5695238, -1.734844, 1, 1, 1, 1, 1,
-0.1907205, 0.4850065, -1.717958, 1, 1, 1, 1, 1,
-0.1894853, 1.605974, -0.01206766, 1, 1, 1, 1, 1,
-0.1879367, -0.0800277, -1.611681, 1, 1, 1, 1, 1,
-0.1862399, 0.6699545, -0.2483084, 1, 1, 1, 1, 1,
-0.1800004, 0.6685099, 0.6210747, 1, 1, 1, 1, 1,
-0.1774216, -0.05860566, -3.322192, 1, 1, 1, 1, 1,
-0.1768682, -0.25605, -1.616628, 1, 1, 1, 1, 1,
-0.1733077, -1.109619, -3.102467, 1, 1, 1, 1, 1,
-0.1723501, 0.7712622, 1.491497, 1, 1, 1, 1, 1,
-0.1716537, -1.5479, -3.435038, 1, 1, 1, 1, 1,
-0.1702497, -0.9736871, -3.935152, 1, 1, 1, 1, 1,
-0.168228, 0.04664491, -1.305417, 0, 0, 1, 1, 1,
-0.16095, -0.7089885, -3.476936, 1, 0, 0, 1, 1,
-0.1575011, -1.252611, -3.947664, 1, 0, 0, 1, 1,
-0.1535485, -0.7448208, -3.082094, 1, 0, 0, 1, 1,
-0.1533759, 0.8689486, 0.8341903, 1, 0, 0, 1, 1,
-0.146571, 0.8708938, -0.8203853, 1, 0, 0, 1, 1,
-0.1443048, -0.1700154, -2.483484, 0, 0, 0, 1, 1,
-0.1439793, 0.5222586, -1.572567, 0, 0, 0, 1, 1,
-0.143051, 1.248091, 0.3452494, 0, 0, 0, 1, 1,
-0.1419685, -0.5888138, -3.364955, 0, 0, 0, 1, 1,
-0.1388544, -0.5772706, -2.07818, 0, 0, 0, 1, 1,
-0.137586, 0.4128745, -0.584312, 0, 0, 0, 1, 1,
-0.1303372, -0.8089602, -2.243207, 0, 0, 0, 1, 1,
-0.1289961, 0.5386148, 0.7001477, 1, 1, 1, 1, 1,
-0.1288346, 0.149723, -0.8736954, 1, 1, 1, 1, 1,
-0.1267291, 1.291491, -0.3037899, 1, 1, 1, 1, 1,
-0.1183817, -0.1957991, -1.989556, 1, 1, 1, 1, 1,
-0.1149155, 1.915786, -0.02517665, 1, 1, 1, 1, 1,
-0.1119211, 1.91118, 1.176265, 1, 1, 1, 1, 1,
-0.1112025, 0.6290915, 0.589197, 1, 1, 1, 1, 1,
-0.1108592, -1.98416, -1.932125, 1, 1, 1, 1, 1,
-0.109709, 0.801228, 0.03482306, 1, 1, 1, 1, 1,
-0.1095719, -0.09429632, -2.15236, 1, 1, 1, 1, 1,
-0.1093144, 1.587578, -1.062225, 1, 1, 1, 1, 1,
-0.1086424, -0.5345076, -2.213136, 1, 1, 1, 1, 1,
-0.1083204, -0.9157654, -3.325114, 1, 1, 1, 1, 1,
-0.1073747, -2.002699, -2.828938, 1, 1, 1, 1, 1,
-0.105675, -1.031767, -4.139422, 1, 1, 1, 1, 1,
-0.1055721, -1.735492, -3.84463, 0, 0, 1, 1, 1,
-0.09413005, -0.4237329, -2.074562, 1, 0, 0, 1, 1,
-0.09068754, 1.160194, 0.07272086, 1, 0, 0, 1, 1,
-0.08655725, 1.009715, -0.8355445, 1, 0, 0, 1, 1,
-0.08521599, -1.202655, -1.751824, 1, 0, 0, 1, 1,
-0.08305299, 1.678526, 0.3668292, 1, 0, 0, 1, 1,
-0.07988174, 0.2167866, 0.2064909, 0, 0, 0, 1, 1,
-0.07469154, -0.09089655, -3.333734, 0, 0, 0, 1, 1,
-0.07372775, -0.4486954, -2.947536, 0, 0, 0, 1, 1,
-0.07367947, 0.4420564, -1.706599, 0, 0, 0, 1, 1,
-0.07026396, 0.847991, -0.3549408, 0, 0, 0, 1, 1,
-0.07011288, -0.8136616, -3.454392, 0, 0, 0, 1, 1,
-0.06864032, 1.751229, -2.024676, 0, 0, 0, 1, 1,
-0.06752852, 0.5650631, -1.18789, 1, 1, 1, 1, 1,
-0.05912312, 0.1890023, -0.6917208, 1, 1, 1, 1, 1,
-0.05751594, 0.3613805, 1.416223, 1, 1, 1, 1, 1,
-0.05627098, 1.024194, 0.1002183, 1, 1, 1, 1, 1,
-0.05410793, -0.8798534, -4.921166, 1, 1, 1, 1, 1,
-0.05225066, 1.485787, 0.7843396, 1, 1, 1, 1, 1,
-0.04354002, 0.231993, 0.7369025, 1, 1, 1, 1, 1,
-0.04338775, 0.5386279, 0.0555059, 1, 1, 1, 1, 1,
-0.04208275, -0.6187265, -2.320222, 1, 1, 1, 1, 1,
-0.03607393, -1.829015, -2.391075, 1, 1, 1, 1, 1,
-0.02973033, -0.1142199, -3.329717, 1, 1, 1, 1, 1,
-0.02652892, 1.092481, 0.7726964, 1, 1, 1, 1, 1,
-0.01555348, -0.2946999, -3.231418, 1, 1, 1, 1, 1,
-0.01495113, -0.09632389, -2.429174, 1, 1, 1, 1, 1,
-0.01362836, 0.1322917, 0.6069584, 1, 1, 1, 1, 1,
-0.01217815, -0.08986749, -4.581944, 0, 0, 1, 1, 1,
-0.008900482, -1.032004, -2.469969, 1, 0, 0, 1, 1,
-0.007603327, 0.7917087, 1.243853, 1, 0, 0, 1, 1,
-0.002158685, -0.2827963, -3.224399, 1, 0, 0, 1, 1,
0.002013695, -0.7704961, 4.110733, 1, 0, 0, 1, 1,
0.004685194, -0.7732726, 3.131541, 1, 0, 0, 1, 1,
0.009255702, 0.2399184, -1.480714, 0, 0, 0, 1, 1,
0.01004733, 0.9518141, 0.01085323, 0, 0, 0, 1, 1,
0.01014744, 0.4878097, -1.395357, 0, 0, 0, 1, 1,
0.01338849, 0.1837324, 0.3951021, 0, 0, 0, 1, 1,
0.01674258, -0.3280995, 3.02759, 0, 0, 0, 1, 1,
0.01876022, -1.06665, 2.609005, 0, 0, 0, 1, 1,
0.02158499, -0.44943, 2.405851, 0, 0, 0, 1, 1,
0.0243788, -1.020473, 2.052981, 1, 1, 1, 1, 1,
0.02607441, -0.6533538, 3.953918, 1, 1, 1, 1, 1,
0.02906028, -0.6084298, 5.337108, 1, 1, 1, 1, 1,
0.03288363, 1.751564, 0.9028205, 1, 1, 1, 1, 1,
0.03579838, 0.2218871, 0.5061646, 1, 1, 1, 1, 1,
0.04538406, 0.3461584, 0.4573333, 1, 1, 1, 1, 1,
0.04553463, -0.9491746, 1.738012, 1, 1, 1, 1, 1,
0.04732111, 0.06302432, 0.7001733, 1, 1, 1, 1, 1,
0.04897358, -0.7085139, 3.358724, 1, 1, 1, 1, 1,
0.05214714, -0.6515957, 4.040235, 1, 1, 1, 1, 1,
0.05367611, 0.5128131, 0.3273978, 1, 1, 1, 1, 1,
0.06076286, -2.1186, 5.11336, 1, 1, 1, 1, 1,
0.06161462, -0.8177176, 3.11991, 1, 1, 1, 1, 1,
0.06312598, 1.345289, -0.8281558, 1, 1, 1, 1, 1,
0.0637428, 0.1345294, 1.233203, 1, 1, 1, 1, 1,
0.06433483, 2.419827, 1.846588, 0, 0, 1, 1, 1,
0.06972002, -0.1489085, 2.126131, 1, 0, 0, 1, 1,
0.07063882, -0.4382013, 2.212612, 1, 0, 0, 1, 1,
0.07114376, -0.221635, 2.529274, 1, 0, 0, 1, 1,
0.0764306, 0.1572445, 1.423917, 1, 0, 0, 1, 1,
0.07689114, 0.3406003, -0.6905187, 1, 0, 0, 1, 1,
0.08041982, -0.1547021, 2.579047, 0, 0, 0, 1, 1,
0.08151054, -0.7986017, 2.1558, 0, 0, 0, 1, 1,
0.08198104, 0.365125, 2.379914, 0, 0, 0, 1, 1,
0.08868352, -0.05947393, 3.440904, 0, 0, 0, 1, 1,
0.08937046, -1.67269, 3.446015, 0, 0, 0, 1, 1,
0.09094092, -0.3637882, 2.270129, 0, 0, 0, 1, 1,
0.09198554, 0.2580047, -0.7849975, 0, 0, 0, 1, 1,
0.09722341, -0.21296, 3.001003, 1, 1, 1, 1, 1,
0.09857456, 0.4190828, -0.2523126, 1, 1, 1, 1, 1,
0.0993623, 0.53206, 0.7331635, 1, 1, 1, 1, 1,
0.1001255, -0.9991885, 3.131312, 1, 1, 1, 1, 1,
0.1016217, 1.676462, 0.909992, 1, 1, 1, 1, 1,
0.103359, -0.441102, 1.921234, 1, 1, 1, 1, 1,
0.1038687, 0.8270622, 1.24686, 1, 1, 1, 1, 1,
0.1047413, 1.140056, 1.414204, 1, 1, 1, 1, 1,
0.1049883, 0.01729366, 2.458162, 1, 1, 1, 1, 1,
0.1103836, 0.2819982, -1.151298, 1, 1, 1, 1, 1,
0.1145208, 0.1015085, 1.360775, 1, 1, 1, 1, 1,
0.1172243, -0.02125149, 2.31114, 1, 1, 1, 1, 1,
0.1209933, -1.344465, 4.258153, 1, 1, 1, 1, 1,
0.1213297, -0.3500484, 4.277003, 1, 1, 1, 1, 1,
0.1244127, 0.6761757, 0.4171647, 1, 1, 1, 1, 1,
0.1248773, -1.584655, 3.839995, 0, 0, 1, 1, 1,
0.1273403, -1.42878, 4.466517, 1, 0, 0, 1, 1,
0.1311313, 0.3168987, -0.09574194, 1, 0, 0, 1, 1,
0.1320577, 0.3098348, 0.3829575, 1, 0, 0, 1, 1,
0.1369057, 0.5002562, -0.4456524, 1, 0, 0, 1, 1,
0.1370761, 1.140361, -0.1119419, 1, 0, 0, 1, 1,
0.1371328, -0.5958236, 1.007325, 0, 0, 0, 1, 1,
0.1381475, -0.2462967, 2.803534, 0, 0, 0, 1, 1,
0.1396251, -1.209984, 3.166669, 0, 0, 0, 1, 1,
0.1412034, -0.3534516, 3.836924, 0, 0, 0, 1, 1,
0.1425717, -0.03600121, 3.937767, 0, 0, 0, 1, 1,
0.1460829, -0.9000288, 2.772271, 0, 0, 0, 1, 1,
0.1487405, 1.127986, 0.4789847, 0, 0, 0, 1, 1,
0.154341, -0.3565469, 2.321401, 1, 1, 1, 1, 1,
0.1547985, -0.7433162, 2.559868, 1, 1, 1, 1, 1,
0.1553115, 0.1475676, -0.7383245, 1, 1, 1, 1, 1,
0.1603477, -1.235286, 2.856022, 1, 1, 1, 1, 1,
0.1621533, -0.1486323, 3.134463, 1, 1, 1, 1, 1,
0.1624367, 0.2788268, -0.6169025, 1, 1, 1, 1, 1,
0.1648173, -1.647168, 3.736387, 1, 1, 1, 1, 1,
0.1674825, -0.6677868, 3.158131, 1, 1, 1, 1, 1,
0.167695, -1.090307, 3.123437, 1, 1, 1, 1, 1,
0.1695335, -1.482921, 2.010414, 1, 1, 1, 1, 1,
0.1716833, -0.01311828, 1.674532, 1, 1, 1, 1, 1,
0.1788469, -0.6738183, 4.095595, 1, 1, 1, 1, 1,
0.181174, 0.8829596, 0.6272272, 1, 1, 1, 1, 1,
0.1829039, -2.634867, 1.960075, 1, 1, 1, 1, 1,
0.1848394, 0.4007314, 1.003097, 1, 1, 1, 1, 1,
0.1853154, -1.860721, 0.9033826, 0, 0, 1, 1, 1,
0.1868703, -0.9184075, 3.316284, 1, 0, 0, 1, 1,
0.1888086, -0.2510411, 4.062577, 1, 0, 0, 1, 1,
0.1892788, -0.328839, 3.395182, 1, 0, 0, 1, 1,
0.1901826, -0.03893482, 3.045127, 1, 0, 0, 1, 1,
0.190364, 0.2219216, 2.435475, 1, 0, 0, 1, 1,
0.1903969, -0.2461749, 4.129741, 0, 0, 0, 1, 1,
0.1912823, 1.960215, 0.2653987, 0, 0, 0, 1, 1,
0.2004175, -0.04694332, 2.946288, 0, 0, 0, 1, 1,
0.2006596, 0.1482734, -0.562573, 0, 0, 0, 1, 1,
0.2059312, -0.8260828, 0.8838256, 0, 0, 0, 1, 1,
0.2059971, -1.43996, 1.065427, 0, 0, 0, 1, 1,
0.2100224, -0.4325269, 2.072479, 0, 0, 0, 1, 1,
0.2117026, -0.4290677, -0.214085, 1, 1, 1, 1, 1,
0.2152795, -0.4753048, 4.665742, 1, 1, 1, 1, 1,
0.2179572, -0.8892319, 4.137026, 1, 1, 1, 1, 1,
0.2203313, -1.145434, 3.583047, 1, 1, 1, 1, 1,
0.2213002, 1.39191, 0.1778475, 1, 1, 1, 1, 1,
0.2219705, -0.8247303, 4.270599, 1, 1, 1, 1, 1,
0.2262041, 0.498962, -0.7576807, 1, 1, 1, 1, 1,
0.2282107, -0.4779161, 2.159021, 1, 1, 1, 1, 1,
0.2294337, 1.229111, 0.01241253, 1, 1, 1, 1, 1,
0.231071, -0.7721384, 1.666494, 1, 1, 1, 1, 1,
0.235528, -0.790368, 4.729506, 1, 1, 1, 1, 1,
0.2358578, -0.4601248, 2.117641, 1, 1, 1, 1, 1,
0.2376815, 0.2291014, 0.5153486, 1, 1, 1, 1, 1,
0.2382097, 0.545459, 2.435548, 1, 1, 1, 1, 1,
0.2405289, 0.197591, 1.568491, 1, 1, 1, 1, 1,
0.2434469, 0.4422645, 0.1197579, 0, 0, 1, 1, 1,
0.2538592, 2.613637, -1.300095, 1, 0, 0, 1, 1,
0.2552453, -0.07588607, 2.800962, 1, 0, 0, 1, 1,
0.2579067, 1.295595, -0.3572812, 1, 0, 0, 1, 1,
0.2586107, -0.3287771, 2.940802, 1, 0, 0, 1, 1,
0.2641514, -2.361521, 3.917176, 1, 0, 0, 1, 1,
0.2669761, 1.405574, 0.677739, 0, 0, 0, 1, 1,
0.2672468, 0.3928232, -0.6163288, 0, 0, 0, 1, 1,
0.2678235, -3.273011, 3.147676, 0, 0, 0, 1, 1,
0.2690438, -1.076215, 1.481409, 0, 0, 0, 1, 1,
0.2713787, -0.5294386, 4.201158, 0, 0, 0, 1, 1,
0.2719201, 1.448096, -1.464115, 0, 0, 0, 1, 1,
0.272076, 0.94921, -0.3599806, 0, 0, 0, 1, 1,
0.2757516, 0.2171951, -0.4892764, 1, 1, 1, 1, 1,
0.2768556, 0.3072153, 1.590049, 1, 1, 1, 1, 1,
0.2795507, -1.024799, 4.606167, 1, 1, 1, 1, 1,
0.2795634, 1.381201, 0.3153583, 1, 1, 1, 1, 1,
0.2814642, 0.2193187, -0.1800064, 1, 1, 1, 1, 1,
0.284012, 0.3860282, 0.6560539, 1, 1, 1, 1, 1,
0.2850032, -0.5371615, 2.199628, 1, 1, 1, 1, 1,
0.285184, 1.575469, -0.4366609, 1, 1, 1, 1, 1,
0.2890621, -0.2844962, 2.415531, 1, 1, 1, 1, 1,
0.2908453, 0.7210321, -0.8693792, 1, 1, 1, 1, 1,
0.2917723, -0.2916961, 1.337571, 1, 1, 1, 1, 1,
0.2923208, 1.311686, -0.3977425, 1, 1, 1, 1, 1,
0.2960676, -1.544152, 1.457657, 1, 1, 1, 1, 1,
0.3004263, -0.6129981, 2.435151, 1, 1, 1, 1, 1,
0.3018087, 0.369716, -0.2819783, 1, 1, 1, 1, 1,
0.3021803, -0.6485718, 1.586077, 0, 0, 1, 1, 1,
0.3064301, 0.2872154, 1.969205, 1, 0, 0, 1, 1,
0.3070841, -0.3360118, 0.01803275, 1, 0, 0, 1, 1,
0.3073986, 0.1928824, -0.02967729, 1, 0, 0, 1, 1,
0.3102043, 1.602822, 0.08947716, 1, 0, 0, 1, 1,
0.310288, -0.09055998, 3.63027, 1, 0, 0, 1, 1,
0.3175809, -0.2143337, 2.840437, 0, 0, 0, 1, 1,
0.3178517, -0.3568922, 1.178596, 0, 0, 0, 1, 1,
0.3180338, -0.5194225, 3.28299, 0, 0, 0, 1, 1,
0.3191189, -1.444668, 3.085197, 0, 0, 0, 1, 1,
0.3216226, 1.290439, 0.6124599, 0, 0, 0, 1, 1,
0.3220375, -0.3077664, 3.03425, 0, 0, 0, 1, 1,
0.3267281, -1.863273, 2.67899, 0, 0, 0, 1, 1,
0.3274883, -1.212442, 3.695869, 1, 1, 1, 1, 1,
0.3276826, -0.6870373, 3.217839, 1, 1, 1, 1, 1,
0.3293858, -0.5232369, 2.632811, 1, 1, 1, 1, 1,
0.3325604, -0.1975091, 2.18614, 1, 1, 1, 1, 1,
0.3364908, 1.707302, 0.1942195, 1, 1, 1, 1, 1,
0.3436815, 1.760206, 0.5964561, 1, 1, 1, 1, 1,
0.344905, 0.5198759, 1.361139, 1, 1, 1, 1, 1,
0.3454469, -1.118222, 2.786246, 1, 1, 1, 1, 1,
0.3470278, 0.6149061, 0.6269817, 1, 1, 1, 1, 1,
0.3533539, 0.7129283, 0.6714689, 1, 1, 1, 1, 1,
0.3577652, 1.192661, 0.4228354, 1, 1, 1, 1, 1,
0.3583812, 0.4639062, 0.7249166, 1, 1, 1, 1, 1,
0.3597207, -1.415799, 1.684332, 1, 1, 1, 1, 1,
0.3622493, 0.7746954, -0.6917761, 1, 1, 1, 1, 1,
0.3659604, -1.676983, 4.939563, 1, 1, 1, 1, 1,
0.3705672, 0.6922728, 0.8777027, 0, 0, 1, 1, 1,
0.3719513, 0.9318153, -0.5219955, 1, 0, 0, 1, 1,
0.3730312, -0.9558837, 2.517517, 1, 0, 0, 1, 1,
0.3756992, 0.5018349, 1.97873, 1, 0, 0, 1, 1,
0.3760991, -0.5776109, 1.164962, 1, 0, 0, 1, 1,
0.3776954, 1.399916, 1.860212, 1, 0, 0, 1, 1,
0.3951116, -1.573692, 2.820381, 0, 0, 0, 1, 1,
0.3987057, 0.5000749, 1.17032, 0, 0, 0, 1, 1,
0.3996677, -0.2614059, 2.283353, 0, 0, 0, 1, 1,
0.4005621, 1.35627, -1.179669, 0, 0, 0, 1, 1,
0.4012599, 0.5061662, -0.2680715, 0, 0, 0, 1, 1,
0.4016767, 0.7631034, 1.009457, 0, 0, 0, 1, 1,
0.4024662, -0.853524, 4.332461, 0, 0, 0, 1, 1,
0.4077921, -0.518347, 1.135864, 1, 1, 1, 1, 1,
0.4121506, 2.072926, -0.2753417, 1, 1, 1, 1, 1,
0.4140297, -1.674546, 3.999135, 1, 1, 1, 1, 1,
0.415462, 0.1678669, 2.233385, 1, 1, 1, 1, 1,
0.4158414, 0.4516136, 0.5497882, 1, 1, 1, 1, 1,
0.4167246, 0.5666615, -0.4763254, 1, 1, 1, 1, 1,
0.4187123, -1.256205, 3.308797, 1, 1, 1, 1, 1,
0.4197308, 0.9859158, -0.9900467, 1, 1, 1, 1, 1,
0.4200216, 1.423383, 2.095419, 1, 1, 1, 1, 1,
0.4207085, -0.4286368, 2.931652, 1, 1, 1, 1, 1,
0.4219317, 1.078344, 2.067923, 1, 1, 1, 1, 1,
0.4231396, 0.6545899, 1.190316, 1, 1, 1, 1, 1,
0.4241886, 1.559589, 0.4953919, 1, 1, 1, 1, 1,
0.424777, -1.33319, 2.077389, 1, 1, 1, 1, 1,
0.4283108, 0.462244, 2.033083, 1, 1, 1, 1, 1,
0.4316845, 0.5282723, -0.871914, 0, 0, 1, 1, 1,
0.4319512, 0.04067101, 3.8318, 1, 0, 0, 1, 1,
0.4337627, -1.213124, 3.946591, 1, 0, 0, 1, 1,
0.4347868, 1.079225, 0.1257816, 1, 0, 0, 1, 1,
0.4405681, 0.9443446, -2.194266, 1, 0, 0, 1, 1,
0.4408132, -1.200628, 3.446326, 1, 0, 0, 1, 1,
0.4408502, 0.3140366, 0.04700616, 0, 0, 0, 1, 1,
0.4411359, -0.1303796, 2.407905, 0, 0, 0, 1, 1,
0.4449815, 0.574227, 1.951355, 0, 0, 0, 1, 1,
0.4477335, -0.6161857, 2.976174, 0, 0, 0, 1, 1,
0.4491766, 1.418902, 1.497259, 0, 0, 0, 1, 1,
0.4496539, -0.3200247, 2.156163, 0, 0, 0, 1, 1,
0.4501, 1.438733, -0.3043362, 0, 0, 0, 1, 1,
0.4522867, -2.947107, 2.669545, 1, 1, 1, 1, 1,
0.4550596, 2.143417, 0.7981212, 1, 1, 1, 1, 1,
0.457164, -0.3707209, 2.033784, 1, 1, 1, 1, 1,
0.4572419, 1.009542, 2.053621, 1, 1, 1, 1, 1,
0.46145, 0.7581617, 1.087403, 1, 1, 1, 1, 1,
0.4638171, 0.9792781, 2.580037, 1, 1, 1, 1, 1,
0.4664598, -1.017077, 2.922568, 1, 1, 1, 1, 1,
0.4669289, 0.6877479, 0.08851178, 1, 1, 1, 1, 1,
0.4688704, -1.758101, 2.438081, 1, 1, 1, 1, 1,
0.4767363, 2.290701, 0.9646743, 1, 1, 1, 1, 1,
0.4777255, -0.3592441, 3.132075, 1, 1, 1, 1, 1,
0.4817238, 0.9069743, 1.092951, 1, 1, 1, 1, 1,
0.4836609, -0.1400976, 1.751873, 1, 1, 1, 1, 1,
0.4851711, -0.2110582, 1.378671, 1, 1, 1, 1, 1,
0.4902402, -1.040899, 2.530947, 1, 1, 1, 1, 1,
0.4906017, 0.3812856, 0.4834699, 0, 0, 1, 1, 1,
0.4920697, 1.578886, 0.4581278, 1, 0, 0, 1, 1,
0.4937543, 0.06486528, 3.391348, 1, 0, 0, 1, 1,
0.4950513, 1.975168, -0.8247297, 1, 0, 0, 1, 1,
0.4973101, -0.4654657, 3.457849, 1, 0, 0, 1, 1,
0.4990821, 0.3989667, 2.165532, 1, 0, 0, 1, 1,
0.5009361, 1.411479, -1.256245, 0, 0, 0, 1, 1,
0.5026371, -1.493187, 1.076805, 0, 0, 0, 1, 1,
0.504673, -1.535569, 1.959611, 0, 0, 0, 1, 1,
0.5049723, -0.4976244, 1.570425, 0, 0, 0, 1, 1,
0.5051719, 0.9591676, 0.4863303, 0, 0, 0, 1, 1,
0.5073606, -1.62537, 2.784616, 0, 0, 0, 1, 1,
0.5112971, 1.088522, 1.340358, 0, 0, 0, 1, 1,
0.519367, 1.152793, 0.06926008, 1, 1, 1, 1, 1,
0.5218593, 0.6356962, -0.1005098, 1, 1, 1, 1, 1,
0.5229943, -0.07385152, 0.4901941, 1, 1, 1, 1, 1,
0.5352629, -0.2861013, 3.172009, 1, 1, 1, 1, 1,
0.5356942, -0.3652964, 2.818982, 1, 1, 1, 1, 1,
0.544755, -0.2880172, 2.720663, 1, 1, 1, 1, 1,
0.5456049, -0.53378, 3.881554, 1, 1, 1, 1, 1,
0.5531409, -0.6550876, 3.490735, 1, 1, 1, 1, 1,
0.5572955, 0.8311992, 0.797652, 1, 1, 1, 1, 1,
0.5599041, 1.076266, 1.391596, 1, 1, 1, 1, 1,
0.5600121, 1.152227, 1.477749, 1, 1, 1, 1, 1,
0.5700012, -1.293509, 2.738621, 1, 1, 1, 1, 1,
0.5741746, -0.9130975, 1.298717, 1, 1, 1, 1, 1,
0.5816967, -0.1184444, 1.999799, 1, 1, 1, 1, 1,
0.5850071, -0.3651995, 4.011754, 1, 1, 1, 1, 1,
0.5851062, 1.074247, 0.781422, 0, 0, 1, 1, 1,
0.5892681, -0.6259261, 2.792767, 1, 0, 0, 1, 1,
0.6010547, -0.288058, 2.820175, 1, 0, 0, 1, 1,
0.6016138, 1.304436, 0.6741577, 1, 0, 0, 1, 1,
0.6041573, -1.584401, 2.766045, 1, 0, 0, 1, 1,
0.6046208, -1.01797, 3.836173, 1, 0, 0, 1, 1,
0.6099591, 0.1236619, 2.252982, 0, 0, 0, 1, 1,
0.6118817, 0.719972, 0.8593595, 0, 0, 0, 1, 1,
0.6138785, 0.06748332, 2.936256, 0, 0, 0, 1, 1,
0.6141532, 0.5001971, 2.623623, 0, 0, 0, 1, 1,
0.6156468, -0.3582403, 0.31603, 0, 0, 0, 1, 1,
0.6249667, 0.20921, 1.907937, 0, 0, 0, 1, 1,
0.6300583, 1.049695, 1.27598, 0, 0, 0, 1, 1,
0.6308127, 0.6430571, 1.473393, 1, 1, 1, 1, 1,
0.6378064, 0.9009525, 1.662761, 1, 1, 1, 1, 1,
0.6392595, -0.1082653, 3.171434, 1, 1, 1, 1, 1,
0.6446897, 0.9005818, 0.7487506, 1, 1, 1, 1, 1,
0.6499572, -0.3885753, 1.473323, 1, 1, 1, 1, 1,
0.6504065, -0.7936884, 1.379559, 1, 1, 1, 1, 1,
0.6689782, 0.3277778, 2.524478, 1, 1, 1, 1, 1,
0.6727256, -0.6578054, 2.927857, 1, 1, 1, 1, 1,
0.6750127, -0.1788212, 0.8011708, 1, 1, 1, 1, 1,
0.6768153, 1.684641, 2.112668, 1, 1, 1, 1, 1,
0.685265, 1.624403, -0.01009837, 1, 1, 1, 1, 1,
0.691052, 0.4904562, 1.021198, 1, 1, 1, 1, 1,
0.6965952, -0.6522022, 1.360969, 1, 1, 1, 1, 1,
0.7022853, -0.2333084, 2.21748, 1, 1, 1, 1, 1,
0.7066328, -0.6319261, 2.572163, 1, 1, 1, 1, 1,
0.7075931, -0.6032664, 2.405102, 0, 0, 1, 1, 1,
0.7146413, -0.4896312, 1.693188, 1, 0, 0, 1, 1,
0.7157657, 0.0009240909, 1.20224, 1, 0, 0, 1, 1,
0.7160902, 0.4473589, 1.797357, 1, 0, 0, 1, 1,
0.7263744, 0.3635434, 2.513711, 1, 0, 0, 1, 1,
0.7285413, -0.7822761, 1.500126, 1, 0, 0, 1, 1,
0.7301063, -0.7287544, 2.200241, 0, 0, 0, 1, 1,
0.7337755, 0.8107424, 3.063167, 0, 0, 0, 1, 1,
0.7340485, 0.5551324, -0.06976525, 0, 0, 0, 1, 1,
0.7391444, -0.8361366, 0.9902921, 0, 0, 0, 1, 1,
0.7471337, 0.279253, 0.0940674, 0, 0, 0, 1, 1,
0.7499375, 0.7947661, 2.002862, 0, 0, 0, 1, 1,
0.7518099, 1.220715, 0.05605895, 0, 0, 0, 1, 1,
0.7525727, 0.4193055, 2.270243, 1, 1, 1, 1, 1,
0.7580007, 0.4937423, 1.202813, 1, 1, 1, 1, 1,
0.7647191, 1.004279, 1.51398, 1, 1, 1, 1, 1,
0.7654687, 1.630967, -0.8986677, 1, 1, 1, 1, 1,
0.7701521, 0.1056444, 1.719545, 1, 1, 1, 1, 1,
0.7703902, 0.7571931, 0.9900291, 1, 1, 1, 1, 1,
0.7706283, 1.289118, 1.504423, 1, 1, 1, 1, 1,
0.772125, 0.6176262, 0.6425602, 1, 1, 1, 1, 1,
0.7804524, -0.002633256, 1.688024, 1, 1, 1, 1, 1,
0.7840022, 0.3204681, 0.2659871, 1, 1, 1, 1, 1,
0.7843843, -1.060289, 1.606997, 1, 1, 1, 1, 1,
0.7856492, -1.308531, 1.276757, 1, 1, 1, 1, 1,
0.7883857, 0.5308753, -0.2816666, 1, 1, 1, 1, 1,
0.7918187, -1.070472, 2.595231, 1, 1, 1, 1, 1,
0.7937887, -0.6766695, 2.420891, 1, 1, 1, 1, 1,
0.8023359, 0.1964972, 1.846981, 0, 0, 1, 1, 1,
0.8066869, -1.00368, 3.344489, 1, 0, 0, 1, 1,
0.807583, -0.6529257, 1.272637, 1, 0, 0, 1, 1,
0.8133399, 0.7653434, 1.561584, 1, 0, 0, 1, 1,
0.8264969, -0.7054054, 1.911432, 1, 0, 0, 1, 1,
0.8337041, 0.6726483, 2.360433, 1, 0, 0, 1, 1,
0.8372188, -1.70584, 3.231011, 0, 0, 0, 1, 1,
0.8399231, 0.4947238, 0.9483105, 0, 0, 0, 1, 1,
0.8423753, 0.9649262, 0.4359892, 0, 0, 0, 1, 1,
0.8424915, -0.5796039, 2.317285, 0, 0, 0, 1, 1,
0.8429247, 0.6146463, 1.636696, 0, 0, 0, 1, 1,
0.8469051, -1.601622, 2.807571, 0, 0, 0, 1, 1,
0.8482819, -2.058187, 2.630048, 0, 0, 0, 1, 1,
0.8517487, 0.1518527, 0.7903068, 1, 1, 1, 1, 1,
0.8525121, -0.3955094, 0.4149631, 1, 1, 1, 1, 1,
0.8610344, -0.2086719, 0.1868544, 1, 1, 1, 1, 1,
0.8661457, -1.06421, 1.641543, 1, 1, 1, 1, 1,
0.8675537, -0.21155, 1.665902, 1, 1, 1, 1, 1,
0.8689905, 0.08524366, -0.5393175, 1, 1, 1, 1, 1,
0.8798448, 0.04613797, 1.958708, 1, 1, 1, 1, 1,
0.8811883, 0.02255419, 2.43269, 1, 1, 1, 1, 1,
0.8832545, -0.8155293, 3.487151, 1, 1, 1, 1, 1,
0.8864613, -0.4177769, 2.936567, 1, 1, 1, 1, 1,
0.8883521, 0.01108872, 1.208791, 1, 1, 1, 1, 1,
0.8891951, -1.127493, 3.227103, 1, 1, 1, 1, 1,
0.895668, 0.1366643, 2.549316, 1, 1, 1, 1, 1,
0.9030552, 0.1943913, 1.117407, 1, 1, 1, 1, 1,
0.9169311, -0.6545848, 1.563398, 1, 1, 1, 1, 1,
0.9188554, 0.8826138, -2.027205, 0, 0, 1, 1, 1,
0.9192837, 1.775862, -0.4069103, 1, 0, 0, 1, 1,
0.922994, -0.5902383, 1.019036, 1, 0, 0, 1, 1,
0.9233831, 1.455296, 0.8762423, 1, 0, 0, 1, 1,
0.92508, -1.09661, 1.778369, 1, 0, 0, 1, 1,
0.927465, 0.6829103, 1.007996, 1, 0, 0, 1, 1,
0.9293965, -1.185718, 1.466578, 0, 0, 0, 1, 1,
0.9299819, 0.8613022, 3.746637, 0, 0, 0, 1, 1,
0.9300414, -0.1390267, 2.222091, 0, 0, 0, 1, 1,
0.9367282, 0.94684, -0.6573824, 0, 0, 0, 1, 1,
0.9395651, 0.1241514, 1.100387, 0, 0, 0, 1, 1,
0.9404981, 0.5296066, 1.413759, 0, 0, 0, 1, 1,
0.9433562, -0.5003456, 2.554807, 0, 0, 0, 1, 1,
0.9444294, 0.2485811, 1.721793, 1, 1, 1, 1, 1,
0.9604058, -0.786305, 3.237094, 1, 1, 1, 1, 1,
0.9609191, 0.5053595, 0.6983577, 1, 1, 1, 1, 1,
0.9618152, -0.2417989, 2.126057, 1, 1, 1, 1, 1,
0.9683096, 1.211185, 3.439456, 1, 1, 1, 1, 1,
0.9684048, -2.001118, 3.04987, 1, 1, 1, 1, 1,
0.9713492, -0.1370005, 1.665648, 1, 1, 1, 1, 1,
0.976731, 0.5990477, 1.603758, 1, 1, 1, 1, 1,
0.9802088, -0.3575781, 1.382075, 1, 1, 1, 1, 1,
0.9849821, -0.5753254, 3.323882, 1, 1, 1, 1, 1,
0.9866808, 1.812956, 1.184738, 1, 1, 1, 1, 1,
0.9981535, 0.3156977, 0.7107996, 1, 1, 1, 1, 1,
0.9996186, 1.57162, -0.06089814, 1, 1, 1, 1, 1,
1.00382, -0.8141131, 2.656714, 1, 1, 1, 1, 1,
1.003823, -0.6453769, 2.618102, 1, 1, 1, 1, 1,
1.00426, -0.7051037, 0.5940462, 0, 0, 1, 1, 1,
1.006454, 0.08645867, 0.2311085, 1, 0, 0, 1, 1,
1.02222, 0.04566962, 1.506435, 1, 0, 0, 1, 1,
1.03079, -0.04048761, 2.241266, 1, 0, 0, 1, 1,
1.057045, -0.956447, 2.13221, 1, 0, 0, 1, 1,
1.057489, -0.9049563, 3.835076, 1, 0, 0, 1, 1,
1.060057, -0.02463975, 2.091032, 0, 0, 0, 1, 1,
1.065451, -1.041048, 1.145839, 0, 0, 0, 1, 1,
1.079964, -0.619172, 2.317249, 0, 0, 0, 1, 1,
1.083316, -0.05560542, 1.303515, 0, 0, 0, 1, 1,
1.08578, 1.04362, -0.4699452, 0, 0, 0, 1, 1,
1.088155, 1.607258, -0.02013216, 0, 0, 0, 1, 1,
1.090217, 1.011392, -0.1447882, 0, 0, 0, 1, 1,
1.091049, 0.4433505, 1.98727, 1, 1, 1, 1, 1,
1.092677, -0.1164624, 3.462878, 1, 1, 1, 1, 1,
1.103435, -0.9044949, 1.900645, 1, 1, 1, 1, 1,
1.105736, -0.133157, 2.000326, 1, 1, 1, 1, 1,
1.115253, -0.2892931, 1.132197, 1, 1, 1, 1, 1,
1.118217, 1.557132, 2.79993, 1, 1, 1, 1, 1,
1.119186, 0.4984672, 1.334853, 1, 1, 1, 1, 1,
1.129351, 0.3284257, 1.77384, 1, 1, 1, 1, 1,
1.130969, -0.3959125, 2.190126, 1, 1, 1, 1, 1,
1.136056, -0.1398209, 3.239976, 1, 1, 1, 1, 1,
1.1374, -0.08941783, 0.5161062, 1, 1, 1, 1, 1,
1.1398, 1.31661, 0.929191, 1, 1, 1, 1, 1,
1.146124, 0.2302693, 0.3370817, 1, 1, 1, 1, 1,
1.149583, 1.065214, 2.737817, 1, 1, 1, 1, 1,
1.150473, 0.308704, 1.417746, 1, 1, 1, 1, 1,
1.159866, 0.1276426, 1.761722, 0, 0, 1, 1, 1,
1.179519, -0.4910369, 1.885771, 1, 0, 0, 1, 1,
1.182439, 0.2187639, 1.512151, 1, 0, 0, 1, 1,
1.182993, -0.3462062, 3.270594, 1, 0, 0, 1, 1,
1.186123, 1.012562, 1.090403, 1, 0, 0, 1, 1,
1.189254, 0.3674375, 2.143775, 1, 0, 0, 1, 1,
1.206571, -0.8597869, 2.117068, 0, 0, 0, 1, 1,
1.215992, 1.268086, 1.266768, 0, 0, 0, 1, 1,
1.218873, -0.9808632, 0.6847127, 0, 0, 0, 1, 1,
1.218913, -0.4152769, 2.028553, 0, 0, 0, 1, 1,
1.219896, 0.4998098, -0.6527093, 0, 0, 0, 1, 1,
1.22274, 0.8510769, 1.074709, 0, 0, 0, 1, 1,
1.223933, 0.3525691, -0.08257461, 0, 0, 0, 1, 1,
1.225528, -0.06787018, 0.5143718, 1, 1, 1, 1, 1,
1.229568, -0.6621321, 2.253296, 1, 1, 1, 1, 1,
1.245198, 0.4616892, 2.395628, 1, 1, 1, 1, 1,
1.256161, 0.9363631, 0.4481556, 1, 1, 1, 1, 1,
1.258448, 0.7635326, 0.519241, 1, 1, 1, 1, 1,
1.277655, 0.07227649, 2.348048, 1, 1, 1, 1, 1,
1.288949, 0.2987078, 2.077289, 1, 1, 1, 1, 1,
1.290082, 0.8519288, 1.29959, 1, 1, 1, 1, 1,
1.298157, -0.005673153, 2.211983, 1, 1, 1, 1, 1,
1.307658, -0.2236603, 2.320784, 1, 1, 1, 1, 1,
1.312384, -0.8423054, 1.701228, 1, 1, 1, 1, 1,
1.326059, 0.6040362, 1.738703, 1, 1, 1, 1, 1,
1.33658, -0.4973157, 2.926492, 1, 1, 1, 1, 1,
1.341321, -0.4063694, 1.288553, 1, 1, 1, 1, 1,
1.358948, -1.765884, 1.434965, 1, 1, 1, 1, 1,
1.360641, -1.241284, 1.204715, 0, 0, 1, 1, 1,
1.364317, 0.8465565, 1.313802, 1, 0, 0, 1, 1,
1.374186, -0.3952852, 2.418649, 1, 0, 0, 1, 1,
1.39819, -1.881436, 3.077942, 1, 0, 0, 1, 1,
1.402541, 0.1915376, 1.822762, 1, 0, 0, 1, 1,
1.403682, 0.3991838, 1.151816, 1, 0, 0, 1, 1,
1.405778, 0.1666674, 0.5151146, 0, 0, 0, 1, 1,
1.418596, 1.814761, 1.220379, 0, 0, 0, 1, 1,
1.431286, -0.2086129, 1.69201, 0, 0, 0, 1, 1,
1.432707, 0.8775266, -1.430035, 0, 0, 0, 1, 1,
1.441761, 1.417254, -0.2192647, 0, 0, 0, 1, 1,
1.459603, -0.5202219, 1.023088, 0, 0, 0, 1, 1,
1.461991, -0.7007667, 3.464651, 0, 0, 0, 1, 1,
1.471716, -0.8172613, 3.170713, 1, 1, 1, 1, 1,
1.472389, 0.7641719, 0.4222846, 1, 1, 1, 1, 1,
1.473049, 0.6706809, 0.8050625, 1, 1, 1, 1, 1,
1.476699, -1.70699, 1.835681, 1, 1, 1, 1, 1,
1.481172, 0.4972966, 1.108686, 1, 1, 1, 1, 1,
1.49656, 1.2493, 0.7380075, 1, 1, 1, 1, 1,
1.507088, -0.7482316, 1.067704, 1, 1, 1, 1, 1,
1.508787, 0.03649161, 2.177739, 1, 1, 1, 1, 1,
1.512052, -0.1162148, 1.319953, 1, 1, 1, 1, 1,
1.538533, 0.4400347, 1.669916, 1, 1, 1, 1, 1,
1.540533, 0.8637381, 1.391953, 1, 1, 1, 1, 1,
1.547446, 1.235259, 1.20467, 1, 1, 1, 1, 1,
1.548517, 0.7989013, -0.653538, 1, 1, 1, 1, 1,
1.552819, -0.2174421, 1.94077, 1, 1, 1, 1, 1,
1.572812, -1.379427, 2.400234, 1, 1, 1, 1, 1,
1.607537, -0.233426, 1.358033, 0, 0, 1, 1, 1,
1.608018, -0.6715705, 2.088006, 1, 0, 0, 1, 1,
1.613579, -0.3426853, 0.4477417, 1, 0, 0, 1, 1,
1.614117, 0.1374619, -0.02533913, 1, 0, 0, 1, 1,
1.619436, 1.355862, 2.820065, 1, 0, 0, 1, 1,
1.62188, 0.716814, 1.318332, 1, 0, 0, 1, 1,
1.625409, 0.3207172, 2.813736, 0, 0, 0, 1, 1,
1.640215, 0.2105141, 3.216202, 0, 0, 0, 1, 1,
1.641025, -1.021423, 1.853577, 0, 0, 0, 1, 1,
1.645883, -0.7811716, 3.20005, 0, 0, 0, 1, 1,
1.654026, 2.050972, 2.77646, 0, 0, 0, 1, 1,
1.656331, -0.01399074, 3.210904, 0, 0, 0, 1, 1,
1.658223, -0.02473422, -0.30395, 0, 0, 0, 1, 1,
1.66397, -0.3352321, 0.2482274, 1, 1, 1, 1, 1,
1.664677, 0.8692879, 1.723807, 1, 1, 1, 1, 1,
1.668107, 1.285205, -0.3244674, 1, 1, 1, 1, 1,
1.688913, -0.491906, 2.51554, 1, 1, 1, 1, 1,
1.693503, 1.086451, 1.741681, 1, 1, 1, 1, 1,
1.718306, 2.115651, 0.02760771, 1, 1, 1, 1, 1,
1.719306, 2.2098, -0.1374528, 1, 1, 1, 1, 1,
1.721109, -0.3171133, 2.396055, 1, 1, 1, 1, 1,
1.724187, 0.2568549, 0.3996441, 1, 1, 1, 1, 1,
1.732841, -1.029461, 2.583743, 1, 1, 1, 1, 1,
1.734156, 0.3675977, 0.08988962, 1, 1, 1, 1, 1,
1.749516, 0.5494104, 1.036552, 1, 1, 1, 1, 1,
1.754855, 1.979127, 0.6883138, 1, 1, 1, 1, 1,
1.764551, 0.338999, 1.150202, 1, 1, 1, 1, 1,
1.767344, -1.000796, 2.998978, 1, 1, 1, 1, 1,
1.779195, 0.8140373, 1.726943, 0, 0, 1, 1, 1,
1.792468, -0.8983887, 2.874285, 1, 0, 0, 1, 1,
1.794936, 1.01482, 0.7359191, 1, 0, 0, 1, 1,
1.803424, 2.475963, 1.087493, 1, 0, 0, 1, 1,
1.807575, -0.8426514, 1.881348, 1, 0, 0, 1, 1,
1.8077, 0.09435324, 2.245074, 1, 0, 0, 1, 1,
1.818608, 1.037801, 0.1654029, 0, 0, 0, 1, 1,
1.819461, -0.5599937, 2.493216, 0, 0, 0, 1, 1,
1.831599, 0.6291398, 1.420157, 0, 0, 0, 1, 1,
1.847657, -1.080863, 0.1681977, 0, 0, 0, 1, 1,
1.851206, -0.9629665, 1.65416, 0, 0, 0, 1, 1,
1.861109, 0.4198968, 1.674626, 0, 0, 0, 1, 1,
1.861852, -0.5349212, 3.63344, 0, 0, 0, 1, 1,
1.866082, 0.4377688, 1.696355, 1, 1, 1, 1, 1,
1.893318, -1.526774, 2.042435, 1, 1, 1, 1, 1,
1.926912, 0.1731674, 2.089072, 1, 1, 1, 1, 1,
1.936461, 0.2013087, 2.182776, 1, 1, 1, 1, 1,
1.949424, 1.301646, 0.9039969, 1, 1, 1, 1, 1,
1.949596, -0.01935707, 0.8370023, 1, 1, 1, 1, 1,
1.960805, 0.6762647, 2.133508, 1, 1, 1, 1, 1,
1.980932, 0.2626582, 1.18138, 1, 1, 1, 1, 1,
1.983033, 0.4937003, 1.676797, 1, 1, 1, 1, 1,
1.98795, -1.259656, 1.297163, 1, 1, 1, 1, 1,
1.995424, -0.03491421, 0.4373802, 1, 1, 1, 1, 1,
2.003422, -1.023045, 1.439378, 1, 1, 1, 1, 1,
2.005846, -0.06361709, 1.425232, 1, 1, 1, 1, 1,
2.012261, -1.160135, 0.05399714, 1, 1, 1, 1, 1,
2.106549, -0.5737964, 2.939755, 1, 1, 1, 1, 1,
2.130734, -0.2066637, 2.307754, 0, 0, 1, 1, 1,
2.183249, 1.224838, 0.5899463, 1, 0, 0, 1, 1,
2.196323, 2.041306, -0.240352, 1, 0, 0, 1, 1,
2.199238, 0.1660731, 1.544631, 1, 0, 0, 1, 1,
2.221523, 0.3451942, 0.9139644, 1, 0, 0, 1, 1,
2.260747, -0.285331, 1.654153, 1, 0, 0, 1, 1,
2.299634, -0.500544, 1.748546, 0, 0, 0, 1, 1,
2.389985, -0.5817572, 2.602203, 0, 0, 0, 1, 1,
2.410724, -0.2343593, 2.878024, 0, 0, 0, 1, 1,
2.439603, -1.521948, 2.907031, 0, 0, 0, 1, 1,
2.450653, 1.58254, 2.346371, 0, 0, 0, 1, 1,
2.45363, -0.03571713, 1.008822, 0, 0, 0, 1, 1,
2.469324, -1.110775, 2.73292, 0, 0, 0, 1, 1,
2.501425, -0.2607753, 1.373149, 1, 1, 1, 1, 1,
2.519728, -2.139375, 2.422646, 1, 1, 1, 1, 1,
2.570604, -0.09497645, 0.317515, 1, 1, 1, 1, 1,
2.62046, 1.226914, 0.9057456, 1, 1, 1, 1, 1,
2.948441, 0.3631639, 2.550745, 1, 1, 1, 1, 1,
3.068155, -0.5448709, 0.9655039, 1, 1, 1, 1, 1,
3.096136, 1.412623, 0.05574341, 1, 1, 1, 1, 1
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
var radius = 9.644772;
var distance = 33.87685;
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
mvMatrix.translate( -0.05938447, 0.1517551, 0.2657146 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.87685);
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
