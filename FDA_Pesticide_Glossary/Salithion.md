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
-3.525745, -0.8412822, -0.4357933, 1, 0, 0, 1,
-3.161044, 1.039763, -2.661769, 1, 0.007843138, 0, 1,
-2.853567, 1.004676, -2.191639, 1, 0.01176471, 0, 1,
-2.788198, 1.597854, -0.6290898, 1, 0.01960784, 0, 1,
-2.787007, 0.9105088, -3.1468, 1, 0.02352941, 0, 1,
-2.670882, -0.07686786, -1.595656, 1, 0.03137255, 0, 1,
-2.568922, -1.056492, -1.766529, 1, 0.03529412, 0, 1,
-2.552045, 0.4107967, -0.8044374, 1, 0.04313726, 0, 1,
-2.527401, 0.08038035, -0.7983877, 1, 0.04705882, 0, 1,
-2.49404, -0.2239236, -0.2024879, 1, 0.05490196, 0, 1,
-2.47696, 0.4342425, 0.002147389, 1, 0.05882353, 0, 1,
-2.379114, 1.077834, -2.415715, 1, 0.06666667, 0, 1,
-2.281787, 1.054561, -0.8899832, 1, 0.07058824, 0, 1,
-2.271957, 1.103737, -0.3901106, 1, 0.07843138, 0, 1,
-2.267352, -1.155996, -1.958173, 1, 0.08235294, 0, 1,
-2.227363, -0.8955024, -1.497025, 1, 0.09019608, 0, 1,
-2.2026, -0.5020781, -3.814457, 1, 0.09411765, 0, 1,
-2.14996, -0.452907, -2.877909, 1, 0.1019608, 0, 1,
-2.096284, -0.567786, -2.173556, 1, 0.1098039, 0, 1,
-2.083997, -0.3162861, -1.585478, 1, 0.1137255, 0, 1,
-2.076034, -0.2086379, -1.471693, 1, 0.1215686, 0, 1,
-2.072449, 0.214411, -0.5347215, 1, 0.1254902, 0, 1,
-2.065433, -0.3013945, -1.814946, 1, 0.1333333, 0, 1,
-2.046747, -0.803436, -2.261264, 1, 0.1372549, 0, 1,
-2.026717, -1.648049, -3.565068, 1, 0.145098, 0, 1,
-2.012636, 0.05811438, -1.326059, 1, 0.1490196, 0, 1,
-1.970026, 0.1633232, -2.8001, 1, 0.1568628, 0, 1,
-1.969355, -1.942256, -3.354802, 1, 0.1607843, 0, 1,
-1.950068, 0.6645924, -1.624261, 1, 0.1686275, 0, 1,
-1.932353, -0.06097429, -1.154252, 1, 0.172549, 0, 1,
-1.914365, 1.854903, -0.8067409, 1, 0.1803922, 0, 1,
-1.89568, -1.36025, -1.912794, 1, 0.1843137, 0, 1,
-1.895671, -1.229639, -0.6158532, 1, 0.1921569, 0, 1,
-1.840638, 0.4023023, -0.949627, 1, 0.1960784, 0, 1,
-1.834669, 1.005994, -0.104046, 1, 0.2039216, 0, 1,
-1.828621, 1.632105, 0.8177506, 1, 0.2117647, 0, 1,
-1.819882, 0.2926102, -2.443908, 1, 0.2156863, 0, 1,
-1.806774, -0.2836768, -3.89366, 1, 0.2235294, 0, 1,
-1.805644, 0.1412058, -1.366756, 1, 0.227451, 0, 1,
-1.7894, -1.358009, -2.884027, 1, 0.2352941, 0, 1,
-1.780859, -0.1350824, -2.102633, 1, 0.2392157, 0, 1,
-1.773847, -0.1598047, -1.987681, 1, 0.2470588, 0, 1,
-1.773481, -1.304253, -3.657937, 1, 0.2509804, 0, 1,
-1.767193, -0.9890527, -3.906434, 1, 0.2588235, 0, 1,
-1.736182, -2.690505, -1.208602, 1, 0.2627451, 0, 1,
-1.711397, 2.376751, 0.4202055, 1, 0.2705882, 0, 1,
-1.697359, -0.4650224, -1.004505, 1, 0.2745098, 0, 1,
-1.688668, 1.746032, -1.758008, 1, 0.282353, 0, 1,
-1.686985, 0.6591424, -2.681178, 1, 0.2862745, 0, 1,
-1.66055, 1.117298, -0.1011405, 1, 0.2941177, 0, 1,
-1.65246, 0.2427563, -2.058026, 1, 0.3019608, 0, 1,
-1.64005, -0.5390708, 1.05717, 1, 0.3058824, 0, 1,
-1.636835, -0.5185856, -1.705661, 1, 0.3137255, 0, 1,
-1.624716, 0.7535113, -1.643137, 1, 0.3176471, 0, 1,
-1.623997, -0.5624251, -1.571391, 1, 0.3254902, 0, 1,
-1.585238, 1.95163, -1.042384, 1, 0.3294118, 0, 1,
-1.575368, 0.6048051, -0.8019746, 1, 0.3372549, 0, 1,
-1.563857, -1.544158, -1.943933, 1, 0.3411765, 0, 1,
-1.536485, -0.1090626, -1.794501, 1, 0.3490196, 0, 1,
-1.52657, -0.5422259, -0.9288813, 1, 0.3529412, 0, 1,
-1.503996, 0.3385578, -2.65273, 1, 0.3607843, 0, 1,
-1.498238, -0.4218208, -0.5109678, 1, 0.3647059, 0, 1,
-1.494184, -0.3257547, -2.808031, 1, 0.372549, 0, 1,
-1.493777, 0.2993079, -1.875522, 1, 0.3764706, 0, 1,
-1.492706, -0.118611, -3.111603, 1, 0.3843137, 0, 1,
-1.488553, 1.505382, 2.205667, 1, 0.3882353, 0, 1,
-1.474471, -0.4218045, -2.496586, 1, 0.3960784, 0, 1,
-1.461331, -1.680155, -0.6747597, 1, 0.4039216, 0, 1,
-1.449108, -0.2858947, -1.789583, 1, 0.4078431, 0, 1,
-1.43689, -0.1171749, -1.322997, 1, 0.4156863, 0, 1,
-1.432832, 0.5216354, -0.172435, 1, 0.4196078, 0, 1,
-1.430669, 0.4022823, -1.416941, 1, 0.427451, 0, 1,
-1.425183, 0.1720262, -1.112738, 1, 0.4313726, 0, 1,
-1.419099, 0.8181509, -1.605902, 1, 0.4392157, 0, 1,
-1.417718, -1.261383, -2.739606, 1, 0.4431373, 0, 1,
-1.41621, 1.842786, -0.5597719, 1, 0.4509804, 0, 1,
-1.389489, 0.6043077, -2.242763, 1, 0.454902, 0, 1,
-1.387172, 0.6523029, -2.174888, 1, 0.4627451, 0, 1,
-1.385743, -0.5251322, -2.39518, 1, 0.4666667, 0, 1,
-1.378949, 0.228971, -2.169921, 1, 0.4745098, 0, 1,
-1.376633, -0.825101, -3.311784, 1, 0.4784314, 0, 1,
-1.369857, 3.055679, -0.1829706, 1, 0.4862745, 0, 1,
-1.368789, -0.3799839, -2.015039, 1, 0.4901961, 0, 1,
-1.367252, 0.3091989, -2.579009, 1, 0.4980392, 0, 1,
-1.360737, -0.8580887, -2.546533, 1, 0.5058824, 0, 1,
-1.356411, -0.2889456, -2.74476, 1, 0.509804, 0, 1,
-1.353874, 0.2964318, -1.373473, 1, 0.5176471, 0, 1,
-1.335774, 0.4964565, -0.5934332, 1, 0.5215687, 0, 1,
-1.301224, 0.1219984, -1.497028, 1, 0.5294118, 0, 1,
-1.287425, 0.02032994, -1.394088, 1, 0.5333334, 0, 1,
-1.286658, 1.131347, -1.207535, 1, 0.5411765, 0, 1,
-1.286354, -1.680515, -1.549443, 1, 0.5450981, 0, 1,
-1.270123, -0.9906845, -3.716923, 1, 0.5529412, 0, 1,
-1.264909, 1.346895, -0.3317905, 1, 0.5568628, 0, 1,
-1.258668, 0.3208641, -1.160676, 1, 0.5647059, 0, 1,
-1.249825, -1.44909, -3.374956, 1, 0.5686275, 0, 1,
-1.241039, -0.7956077, -1.278252, 1, 0.5764706, 0, 1,
-1.240281, 0.2139419, -1.63245, 1, 0.5803922, 0, 1,
-1.229341, 2.530094, 0.2824784, 1, 0.5882353, 0, 1,
-1.22863, -0.8481724, -2.675682, 1, 0.5921569, 0, 1,
-1.212527, 0.09897356, -0.8084213, 1, 0.6, 0, 1,
-1.207814, -1.190452, -4.05678, 1, 0.6078432, 0, 1,
-1.204299, 0.176506, -1.933948, 1, 0.6117647, 0, 1,
-1.202205, 0.7555707, -2.374055, 1, 0.6196079, 0, 1,
-1.198218, -0.1992716, -1.323972, 1, 0.6235294, 0, 1,
-1.182523, 0.1946255, -1.615087, 1, 0.6313726, 0, 1,
-1.176696, -0.2513348, -1.06151, 1, 0.6352941, 0, 1,
-1.171153, 1.233256, -0.5468026, 1, 0.6431373, 0, 1,
-1.165989, 0.7493459, -1.319261, 1, 0.6470588, 0, 1,
-1.155088, -0.7171761, -1.268077, 1, 0.654902, 0, 1,
-1.133879, 1.26816, -1.84589, 1, 0.6588235, 0, 1,
-1.132173, -0.3795304, -1.441378, 1, 0.6666667, 0, 1,
-1.128434, -0.3607501, -3.114646, 1, 0.6705883, 0, 1,
-1.126372, -0.03417745, -1.684304, 1, 0.6784314, 0, 1,
-1.121635, -1.543042, -1.210358, 1, 0.682353, 0, 1,
-1.117461, 0.2430466, -0.4794305, 1, 0.6901961, 0, 1,
-1.113044, 2.663304, 0.04329114, 1, 0.6941177, 0, 1,
-1.109658, 0.8574249, -2.055538, 1, 0.7019608, 0, 1,
-1.109255, -0.3233387, -1.29092, 1, 0.7098039, 0, 1,
-1.099304, 0.7356023, -2.348325, 1, 0.7137255, 0, 1,
-1.097016, 0.08188975, -1.159107, 1, 0.7215686, 0, 1,
-1.095491, 0.2804889, 0.4642103, 1, 0.7254902, 0, 1,
-1.091688, 1.893321, 0.989463, 1, 0.7333333, 0, 1,
-1.091018, 0.3918582, -1.658866, 1, 0.7372549, 0, 1,
-1.090286, 0.3256999, -1.580332, 1, 0.7450981, 0, 1,
-1.088484, 0.5404562, -1.069497, 1, 0.7490196, 0, 1,
-1.084844, -0.856477, -4.253657, 1, 0.7568628, 0, 1,
-1.083364, -0.002082493, -0.8173943, 1, 0.7607843, 0, 1,
-1.081143, -0.001186969, -2.511673, 1, 0.7686275, 0, 1,
-1.080952, -0.2850421, -1.200908, 1, 0.772549, 0, 1,
-1.07826, 1.950131, -0.7422522, 1, 0.7803922, 0, 1,
-1.077118, 0.9305691, -1.699239, 1, 0.7843137, 0, 1,
-1.070587, -0.0425378, -1.942827, 1, 0.7921569, 0, 1,
-1.059166, 0.3440641, -1.583547, 1, 0.7960784, 0, 1,
-1.058314, -1.005704, -2.902461, 1, 0.8039216, 0, 1,
-1.057184, -0.3524911, -2.085566, 1, 0.8117647, 0, 1,
-1.052405, 0.03859239, -1.892684, 1, 0.8156863, 0, 1,
-1.046475, -0.401722, -0.4992362, 1, 0.8235294, 0, 1,
-1.045494, -0.7903037, -0.1754241, 1, 0.827451, 0, 1,
-1.043676, -0.3390886, -1.99729, 1, 0.8352941, 0, 1,
-1.038838, 0.1728505, -0.5439884, 1, 0.8392157, 0, 1,
-1.033103, -0.33659, -0.4493032, 1, 0.8470588, 0, 1,
-1.030347, 2.003486, 0.2199642, 1, 0.8509804, 0, 1,
-1.029113, -1.262046, -3.89116, 1, 0.8588235, 0, 1,
-1.025025, -0.2037456, -2.461671, 1, 0.8627451, 0, 1,
-1.023165, -1.098217, -1.704895, 1, 0.8705882, 0, 1,
-1.013911, -1.664972, -2.853187, 1, 0.8745098, 0, 1,
-1.007669, 0.0332459, -2.29221, 1, 0.8823529, 0, 1,
-1.002678, -0.3270279, -0.7651807, 1, 0.8862745, 0, 1,
-0.9997671, 1.926199, 2.125784, 1, 0.8941177, 0, 1,
-0.9956771, 0.4142358, -0.9086155, 1, 0.8980392, 0, 1,
-0.9935673, 0.8359261, 0.2725958, 1, 0.9058824, 0, 1,
-0.9910256, 0.649617, -0.3093556, 1, 0.9137255, 0, 1,
-0.9889699, 1.44705, -0.02669493, 1, 0.9176471, 0, 1,
-0.9888294, -1.255512, -2.677544, 1, 0.9254902, 0, 1,
-0.9876337, 0.3701034, -1.343506, 1, 0.9294118, 0, 1,
-0.9848484, -0.5837499, -1.615904, 1, 0.9372549, 0, 1,
-0.9806179, -0.949421, -1.682049, 1, 0.9411765, 0, 1,
-0.9780452, -0.8293117, -3.884274, 1, 0.9490196, 0, 1,
-0.9771469, -0.05903066, -2.091572, 1, 0.9529412, 0, 1,
-0.9648715, -1.477862, -2.82139, 1, 0.9607843, 0, 1,
-0.9573278, 0.3391057, -2.075761, 1, 0.9647059, 0, 1,
-0.9497451, 0.1653142, -2.43574, 1, 0.972549, 0, 1,
-0.9349391, 1.267996, -0.5528918, 1, 0.9764706, 0, 1,
-0.9139155, -0.3933974, -3.577397, 1, 0.9843137, 0, 1,
-0.9133463, -0.483335, -1.98632, 1, 0.9882353, 0, 1,
-0.9108175, 0.3781308, -1.850201, 1, 0.9960784, 0, 1,
-0.9083082, 0.9819003, 0.7241527, 0.9960784, 1, 0, 1,
-0.903182, -0.2014931, -2.719221, 0.9921569, 1, 0, 1,
-0.9016507, -0.6896157, -4.033853, 0.9843137, 1, 0, 1,
-0.9014323, -2.226264, -4.695329, 0.9803922, 1, 0, 1,
-0.9010534, -2.371614, -4.349673, 0.972549, 1, 0, 1,
-0.9004349, 0.08713762, -1.669517, 0.9686275, 1, 0, 1,
-0.8941523, -1.514418, -2.544607, 0.9607843, 1, 0, 1,
-0.8907959, 0.4937315, -1.086841, 0.9568627, 1, 0, 1,
-0.8899329, -1.452444, -2.518355, 0.9490196, 1, 0, 1,
-0.8865814, 2.457834, -0.84908, 0.945098, 1, 0, 1,
-0.8858615, -1.113256, -3.195462, 0.9372549, 1, 0, 1,
-0.87997, 0.9860732, -0.8820947, 0.9333333, 1, 0, 1,
-0.8750188, -0.1177178, -1.819303, 0.9254902, 1, 0, 1,
-0.8662713, 1.874423, 0.008366044, 0.9215686, 1, 0, 1,
-0.8640577, -1.41433, -3.042721, 0.9137255, 1, 0, 1,
-0.8563465, -0.664403, -2.715287, 0.9098039, 1, 0, 1,
-0.8555889, 0.7163665, -0.1267821, 0.9019608, 1, 0, 1,
-0.8545038, 0.7463776, -0.01117047, 0.8941177, 1, 0, 1,
-0.8475208, -0.5359182, -0.996718, 0.8901961, 1, 0, 1,
-0.8466147, 1.852061, -0.2249721, 0.8823529, 1, 0, 1,
-0.8446439, -0.204631, -1.148697, 0.8784314, 1, 0, 1,
-0.8422884, -1.729818, -2.086793, 0.8705882, 1, 0, 1,
-0.8395405, 0.3607768, -2.759804, 0.8666667, 1, 0, 1,
-0.8328586, 0.0292858, -1.613444, 0.8588235, 1, 0, 1,
-0.8307173, 0.9303655, -1.079489, 0.854902, 1, 0, 1,
-0.8296092, -0.3259412, -3.855422, 0.8470588, 1, 0, 1,
-0.8239244, -0.1850151, -1.976827, 0.8431373, 1, 0, 1,
-0.8146204, 0.4497841, -1.148922, 0.8352941, 1, 0, 1,
-0.8136061, -2.043224, -2.567134, 0.8313726, 1, 0, 1,
-0.8113838, 2.624424, -0.4395941, 0.8235294, 1, 0, 1,
-0.8076483, -2.287689, -2.852502, 0.8196079, 1, 0, 1,
-0.8070656, 0.5105719, 0.3834961, 0.8117647, 1, 0, 1,
-0.8033543, 0.539544, -0.500771, 0.8078431, 1, 0, 1,
-0.8006033, 0.4980191, -0.2160021, 0.8, 1, 0, 1,
-0.7955446, 2.378302, 1.519892, 0.7921569, 1, 0, 1,
-0.7930886, -0.2574038, -0.1649521, 0.7882353, 1, 0, 1,
-0.7919625, -1.242899, -3.653763, 0.7803922, 1, 0, 1,
-0.7869625, -0.4386983, -2.206182, 0.7764706, 1, 0, 1,
-0.7841229, -0.4157827, -3.842702, 0.7686275, 1, 0, 1,
-0.7839454, 1.584901, 0.1354759, 0.7647059, 1, 0, 1,
-0.7802925, -0.2949618, -1.69875, 0.7568628, 1, 0, 1,
-0.7754098, 1.019547, -1.093504, 0.7529412, 1, 0, 1,
-0.7704931, 0.2649139, -1.583117, 0.7450981, 1, 0, 1,
-0.7704896, 0.5767587, 1.041392, 0.7411765, 1, 0, 1,
-0.7669698, -1.087743, -2.011289, 0.7333333, 1, 0, 1,
-0.7597064, 1.392087, 0.5649784, 0.7294118, 1, 0, 1,
-0.7585387, 1.346126, 0.4452438, 0.7215686, 1, 0, 1,
-0.7572958, 0.1130941, -1.217408, 0.7176471, 1, 0, 1,
-0.7565646, 0.3049769, -1.194039, 0.7098039, 1, 0, 1,
-0.7564877, 0.1522555, -2.086796, 0.7058824, 1, 0, 1,
-0.7555086, -1.504685, -1.674216, 0.6980392, 1, 0, 1,
-0.7550459, -1.610196, -1.666239, 0.6901961, 1, 0, 1,
-0.7536341, -0.9188864, -3.373036, 0.6862745, 1, 0, 1,
-0.7459624, 1.767011, 0.5240453, 0.6784314, 1, 0, 1,
-0.7450982, 0.5904748, -1.67707, 0.6745098, 1, 0, 1,
-0.7411619, -0.5571768, -2.609499, 0.6666667, 1, 0, 1,
-0.7408258, -0.2190491, -0.02746941, 0.6627451, 1, 0, 1,
-0.7399776, 0.9516702, 0.8977698, 0.654902, 1, 0, 1,
-0.7354664, 0.4250638, -0.8161395, 0.6509804, 1, 0, 1,
-0.7314893, -1.594332, -2.603786, 0.6431373, 1, 0, 1,
-0.728506, 1.903062, -0.1447684, 0.6392157, 1, 0, 1,
-0.7179558, 0.8368479, 0.06667636, 0.6313726, 1, 0, 1,
-0.7126843, -0.9953003, -3.549817, 0.627451, 1, 0, 1,
-0.7108082, 0.130536, -0.6654723, 0.6196079, 1, 0, 1,
-0.7029324, -0.4163633, -0.6265146, 0.6156863, 1, 0, 1,
-0.7002754, -0.5302904, -2.419625, 0.6078432, 1, 0, 1,
-0.6966355, -0.01432005, -2.046516, 0.6039216, 1, 0, 1,
-0.6953029, 0.9676567, -1.335896, 0.5960785, 1, 0, 1,
-0.6918564, -0.9113358, -3.582252, 0.5882353, 1, 0, 1,
-0.691407, 0.279226, 0.5655704, 0.5843138, 1, 0, 1,
-0.6905841, -0.1595421, -2.184192, 0.5764706, 1, 0, 1,
-0.6863886, 1.895949, 0.685454, 0.572549, 1, 0, 1,
-0.6752861, -0.2804093, 0.04479671, 0.5647059, 1, 0, 1,
-0.6687031, -1.092304, -0.7592252, 0.5607843, 1, 0, 1,
-0.6673983, 0.113537, -0.3535871, 0.5529412, 1, 0, 1,
-0.6662394, -0.4103854, -1.172992, 0.5490196, 1, 0, 1,
-0.6641197, -0.06392231, -2.347114, 0.5411765, 1, 0, 1,
-0.655064, 0.6194159, 0.6230798, 0.5372549, 1, 0, 1,
-0.6532878, -0.333126, -2.032863, 0.5294118, 1, 0, 1,
-0.6420213, -0.1024036, -0.7740039, 0.5254902, 1, 0, 1,
-0.6407155, -1.972355, -0.9950412, 0.5176471, 1, 0, 1,
-0.6388075, -1.100949, -2.72311, 0.5137255, 1, 0, 1,
-0.6365219, 1.589909, 1.079752, 0.5058824, 1, 0, 1,
-0.636158, 0.4508678, -0.5018926, 0.5019608, 1, 0, 1,
-0.6361371, -0.6321838, -1.981933, 0.4941176, 1, 0, 1,
-0.6353596, -0.9461173, -1.600558, 0.4862745, 1, 0, 1,
-0.6350134, 1.185508, 0.9353974, 0.4823529, 1, 0, 1,
-0.6346781, 1.457608, -0.8295756, 0.4745098, 1, 0, 1,
-0.6232858, 0.2711814, -0.2613314, 0.4705882, 1, 0, 1,
-0.615724, 0.5680135, -1.716322, 0.4627451, 1, 0, 1,
-0.611499, -1.15276, -4.608509, 0.4588235, 1, 0, 1,
-0.6109165, 1.867825, -0.08754762, 0.4509804, 1, 0, 1,
-0.6086659, 0.729196, -1.649132, 0.4470588, 1, 0, 1,
-0.6055197, 0.9869336, -0.1332608, 0.4392157, 1, 0, 1,
-0.6036988, -0.0834095, 0.2263024, 0.4352941, 1, 0, 1,
-0.6018921, 1.407828, -0.2706103, 0.427451, 1, 0, 1,
-0.6005967, 1.521367, 0.216572, 0.4235294, 1, 0, 1,
-0.5996877, -0.05522033, 0.1126279, 0.4156863, 1, 0, 1,
-0.5983939, -0.6178611, -2.74601, 0.4117647, 1, 0, 1,
-0.5966055, -0.5578913, -2.593704, 0.4039216, 1, 0, 1,
-0.5954219, -0.8752851, -3.752725, 0.3960784, 1, 0, 1,
-0.5915336, 2.501969, 0.7027005, 0.3921569, 1, 0, 1,
-0.5836089, 0.1873439, -1.17603, 0.3843137, 1, 0, 1,
-0.5820026, 0.1468851, -0.1658568, 0.3803922, 1, 0, 1,
-0.5779644, 2.5212, -0.4880703, 0.372549, 1, 0, 1,
-0.5746942, 0.3115017, -1.800019, 0.3686275, 1, 0, 1,
-0.5711172, -0.607909, -2.507539, 0.3607843, 1, 0, 1,
-0.5710948, 1.131401, -1.462385, 0.3568628, 1, 0, 1,
-0.5695628, -0.2171001, -0.5865949, 0.3490196, 1, 0, 1,
-0.5694549, -2.439203, -1.538922, 0.345098, 1, 0, 1,
-0.5678318, -0.2943766, -1.681472, 0.3372549, 1, 0, 1,
-0.5586075, 0.3593792, -1.314997, 0.3333333, 1, 0, 1,
-0.5558501, 0.4599178, -0.7447795, 0.3254902, 1, 0, 1,
-0.5545132, -0.5059008, -4.366885, 0.3215686, 1, 0, 1,
-0.5367188, -0.2156463, -0.7391775, 0.3137255, 1, 0, 1,
-0.5355755, 0.9110112, 0.4808374, 0.3098039, 1, 0, 1,
-0.5310824, 0.9724, 0.6848493, 0.3019608, 1, 0, 1,
-0.5288109, -0.4688988, -1.884611, 0.2941177, 1, 0, 1,
-0.5265785, -0.2902192, -2.453719, 0.2901961, 1, 0, 1,
-0.5230457, 0.51136, 0.1304397, 0.282353, 1, 0, 1,
-0.5102525, 0.8799779, -0.6383768, 0.2784314, 1, 0, 1,
-0.5064865, -0.6803701, -1.012401, 0.2705882, 1, 0, 1,
-0.5052562, -1.368823, -3.904275, 0.2666667, 1, 0, 1,
-0.4988765, -0.9983035, -1.119964, 0.2588235, 1, 0, 1,
-0.4971706, 0.3085069, -1.558745, 0.254902, 1, 0, 1,
-0.4962945, -0.7266545, -2.141093, 0.2470588, 1, 0, 1,
-0.4953524, -0.4699607, -3.652995, 0.2431373, 1, 0, 1,
-0.4889031, 0.2147217, -1.824517, 0.2352941, 1, 0, 1,
-0.4865088, 1.611374, 0.8624687, 0.2313726, 1, 0, 1,
-0.4849527, -0.4666742, -1.575586, 0.2235294, 1, 0, 1,
-0.4807255, -0.3330227, -2.641774, 0.2196078, 1, 0, 1,
-0.4761024, -1.428267, -1.92338, 0.2117647, 1, 0, 1,
-0.4630157, -0.8448444, -2.750523, 0.2078431, 1, 0, 1,
-0.4622897, 1.147797, 0.08927611, 0.2, 1, 0, 1,
-0.4581907, -1.088605, -3.42789, 0.1921569, 1, 0, 1,
-0.4547379, -0.1243878, -1.876421, 0.1882353, 1, 0, 1,
-0.4509331, -1.225571, -2.791584, 0.1803922, 1, 0, 1,
-0.449061, 1.210155, -0.1975223, 0.1764706, 1, 0, 1,
-0.4490496, -0.7310275, -1.228934, 0.1686275, 1, 0, 1,
-0.4471006, -0.2916281, -3.70407, 0.1647059, 1, 0, 1,
-0.4466845, -1.168873, -3.5817, 0.1568628, 1, 0, 1,
-0.4398232, -0.1053545, -0.2984782, 0.1529412, 1, 0, 1,
-0.4392514, -0.1052267, 1.150391e-05, 0.145098, 1, 0, 1,
-0.4384808, 0.3232481, -1.515472, 0.1411765, 1, 0, 1,
-0.437391, -0.7828959, -2.05286, 0.1333333, 1, 0, 1,
-0.4353005, -0.3636992, -2.172058, 0.1294118, 1, 0, 1,
-0.4334032, -0.9602298, -2.379801, 0.1215686, 1, 0, 1,
-0.4324526, -1.046162, -1.922025, 0.1176471, 1, 0, 1,
-0.4318397, 0.5085927, -1.592953, 0.1098039, 1, 0, 1,
-0.4276429, -1.718545, -3.108414, 0.1058824, 1, 0, 1,
-0.4273452, 0.9391987, -2.539844, 0.09803922, 1, 0, 1,
-0.4239318, -0.4817353, -2.924299, 0.09019608, 1, 0, 1,
-0.4236182, -0.3750895, -1.458686, 0.08627451, 1, 0, 1,
-0.4229427, 0.3040874, -1.497193, 0.07843138, 1, 0, 1,
-0.4221633, -0.649999, -3.522727, 0.07450981, 1, 0, 1,
-0.4212083, 0.8847402, 1.338422, 0.06666667, 1, 0, 1,
-0.4142824, -0.6287723, -1.865532, 0.0627451, 1, 0, 1,
-0.4106544, 1.76178, -0.1132293, 0.05490196, 1, 0, 1,
-0.4078338, -0.3820498, -1.01529, 0.05098039, 1, 0, 1,
-0.401996, 0.9501317, 0.8698271, 0.04313726, 1, 0, 1,
-0.3986097, 0.4944311, -0.9414336, 0.03921569, 1, 0, 1,
-0.3980275, 0.7332188, 0.05003671, 0.03137255, 1, 0, 1,
-0.3936703, -0.3346999, -2.46118, 0.02745098, 1, 0, 1,
-0.392842, 0.5125718, -1.727437, 0.01960784, 1, 0, 1,
-0.3924039, 1.481347, 0.8154992, 0.01568628, 1, 0, 1,
-0.3904028, 0.1042723, -0.00270471, 0.007843138, 1, 0, 1,
-0.3898963, 0.8581491, -0.9586996, 0.003921569, 1, 0, 1,
-0.3891762, -1.56902, -3.75834, 0, 1, 0.003921569, 1,
-0.387169, -0.2424407, -2.423424, 0, 1, 0.01176471, 1,
-0.386991, -1.793523, -2.74046, 0, 1, 0.01568628, 1,
-0.3862571, -1.044285, -3.463703, 0, 1, 0.02352941, 1,
-0.3856691, 2.248456, -0.6041968, 0, 1, 0.02745098, 1,
-0.3835589, 0.06079495, -1.516554, 0, 1, 0.03529412, 1,
-0.3804643, 2.42387, 0.9903125, 0, 1, 0.03921569, 1,
-0.3771693, 0.8347939, -1.071461, 0, 1, 0.04705882, 1,
-0.3724097, -1.851994, -3.268501, 0, 1, 0.05098039, 1,
-0.3706332, -1.722979, -2.854658, 0, 1, 0.05882353, 1,
-0.3699529, 0.1514484, -0.9877154, 0, 1, 0.0627451, 1,
-0.3681216, -0.3062885, -2.356744, 0, 1, 0.07058824, 1,
-0.3673161, 0.4291129, -0.6643175, 0, 1, 0.07450981, 1,
-0.3654867, 1.195055, -0.1040025, 0, 1, 0.08235294, 1,
-0.3650199, -0.7142326, -2.093971, 0, 1, 0.08627451, 1,
-0.3630091, 0.7778655, 0.06120376, 0, 1, 0.09411765, 1,
-0.3595732, -2.82196, -3.261206, 0, 1, 0.1019608, 1,
-0.3590683, 0.9560469, 0.1951663, 0, 1, 0.1058824, 1,
-0.3561392, -0.5481922, -2.443289, 0, 1, 0.1137255, 1,
-0.3559516, -0.2184464, -0.5715479, 0, 1, 0.1176471, 1,
-0.3555359, -1.977501, -3.528363, 0, 1, 0.1254902, 1,
-0.3527196, -0.6055849, -1.320101, 0, 1, 0.1294118, 1,
-0.3451863, -0.7418077, -2.923694, 0, 1, 0.1372549, 1,
-0.3358179, 1.857483, 0.004345631, 0, 1, 0.1411765, 1,
-0.3347138, -0.1444712, -1.033576, 0, 1, 0.1490196, 1,
-0.3329976, -0.3254462, -3.402546, 0, 1, 0.1529412, 1,
-0.3312683, -0.1359252, 0.2115481, 0, 1, 0.1607843, 1,
-0.3267322, 0.7741013, -0.5990884, 0, 1, 0.1647059, 1,
-0.3209147, -0.143614, -0.950202, 0, 1, 0.172549, 1,
-0.3205501, 1.182369, -1.145089, 0, 1, 0.1764706, 1,
-0.3144439, 1.195995, -2.422665, 0, 1, 0.1843137, 1,
-0.312954, 0.03859595, -1.179799, 0, 1, 0.1882353, 1,
-0.3051096, 1.331379, 0.05079904, 0, 1, 0.1960784, 1,
-0.30038, -1.889552, -2.700553, 0, 1, 0.2039216, 1,
-0.3000389, -0.08542878, -1.943112, 0, 1, 0.2078431, 1,
-0.2993765, -0.5111865, -2.524353, 0, 1, 0.2156863, 1,
-0.299121, -0.971632, -2.711884, 0, 1, 0.2196078, 1,
-0.2971062, -2.265602, -1.484048, 0, 1, 0.227451, 1,
-0.2955942, -0.1004748, -1.915355, 0, 1, 0.2313726, 1,
-0.2945015, 0.9510872, -1.875216, 0, 1, 0.2392157, 1,
-0.2836096, 0.68971, -0.8421761, 0, 1, 0.2431373, 1,
-0.2822241, -0.4691898, -2.084531, 0, 1, 0.2509804, 1,
-0.2817209, -2.23363, -2.722379, 0, 1, 0.254902, 1,
-0.2752776, 3.705008, -0.2140467, 0, 1, 0.2627451, 1,
-0.2729995, -0.5401263, -4.333439, 0, 1, 0.2666667, 1,
-0.2696725, 0.7320347, 0.3219098, 0, 1, 0.2745098, 1,
-0.2665704, -0.5326929, -2.949533, 0, 1, 0.2784314, 1,
-0.2665586, -0.03657467, -3.234687, 0, 1, 0.2862745, 1,
-0.258897, 0.5468138, 0.1313667, 0, 1, 0.2901961, 1,
-0.2564706, -0.4515904, -2.208169, 0, 1, 0.2980392, 1,
-0.2557519, 0.3247937, 0.3567213, 0, 1, 0.3058824, 1,
-0.2507608, -0.6943243, -3.412824, 0, 1, 0.3098039, 1,
-0.2466968, 0.9432874, -0.1357541, 0, 1, 0.3176471, 1,
-0.2436357, 1.501126, 0.4647393, 0, 1, 0.3215686, 1,
-0.2372339, 0.06106458, -0.9905953, 0, 1, 0.3294118, 1,
-0.2372065, 0.6933573, -0.08239536, 0, 1, 0.3333333, 1,
-0.2292685, 1.074442, 0.7282003, 0, 1, 0.3411765, 1,
-0.227932, -1.38027, -2.579602, 0, 1, 0.345098, 1,
-0.2263205, -0.05257832, -3.155771, 0, 1, 0.3529412, 1,
-0.2243233, -0.4031914, -4.064633, 0, 1, 0.3568628, 1,
-0.2230884, 0.785543, -0.3774232, 0, 1, 0.3647059, 1,
-0.2212612, 0.7627299, 0.4865701, 0, 1, 0.3686275, 1,
-0.2210448, -1.732262, -4.520179, 0, 1, 0.3764706, 1,
-0.2179824, 0.1880832, -0.002383492, 0, 1, 0.3803922, 1,
-0.214613, 0.2093748, 0.1416875, 0, 1, 0.3882353, 1,
-0.2141108, -0.585059, -2.10299, 0, 1, 0.3921569, 1,
-0.212256, -0.1863677, -1.759781, 0, 1, 0.4, 1,
-0.2066902, 0.8640423, 1.856453, 0, 1, 0.4078431, 1,
-0.2063521, -1.150927, -4.261696, 0, 1, 0.4117647, 1,
-0.2040593, 0.3126817, -0.8451297, 0, 1, 0.4196078, 1,
-0.2033225, 0.04581112, -0.4325984, 0, 1, 0.4235294, 1,
-0.200977, -0.9173213, -3.039816, 0, 1, 0.4313726, 1,
-0.1967185, 1.138643, -0.4891816, 0, 1, 0.4352941, 1,
-0.1947444, 0.04093281, -2.511862, 0, 1, 0.4431373, 1,
-0.1937048, 0.08207414, -0.5971155, 0, 1, 0.4470588, 1,
-0.1916378, 0.6614217, 0.699596, 0, 1, 0.454902, 1,
-0.1915909, -1.358511, -3.722292, 0, 1, 0.4588235, 1,
-0.1828677, -1.146287, -3.775172, 0, 1, 0.4666667, 1,
-0.1824679, -0.003949027, -2.717557, 0, 1, 0.4705882, 1,
-0.1811033, 1.071744, -1.923916, 0, 1, 0.4784314, 1,
-0.1804661, -0.1463686, -3.205677, 0, 1, 0.4823529, 1,
-0.1801099, -1.489128, -3.433422, 0, 1, 0.4901961, 1,
-0.1793988, 0.3144076, -0.1913576, 0, 1, 0.4941176, 1,
-0.1774208, 0.6645541, 0.1089492, 0, 1, 0.5019608, 1,
-0.1749305, 1.625989, 1.128543, 0, 1, 0.509804, 1,
-0.1666876, 1.021626, 0.1019342, 0, 1, 0.5137255, 1,
-0.1641647, -0.8324171, -2.823756, 0, 1, 0.5215687, 1,
-0.1613724, 1.178079, -0.2677559, 0, 1, 0.5254902, 1,
-0.160444, 2.005455, 0.4376112, 0, 1, 0.5333334, 1,
-0.1602815, 0.4211386, 0.08759505, 0, 1, 0.5372549, 1,
-0.1602172, -1.424866, -1.782089, 0, 1, 0.5450981, 1,
-0.1598081, 0.7427391, -1.14889, 0, 1, 0.5490196, 1,
-0.1594174, -1.554613, -2.198826, 0, 1, 0.5568628, 1,
-0.1560897, 0.7241127, -1.831896, 0, 1, 0.5607843, 1,
-0.1558675, 1.862277, 1.140167, 0, 1, 0.5686275, 1,
-0.1522794, 0.8913046, -0.1777238, 0, 1, 0.572549, 1,
-0.1509676, 0.4561977, -0.1819029, 0, 1, 0.5803922, 1,
-0.150687, -0.9968646, -3.468031, 0, 1, 0.5843138, 1,
-0.1438428, -0.6091688, -5.165456, 0, 1, 0.5921569, 1,
-0.1330844, -0.1945959, -2.044581, 0, 1, 0.5960785, 1,
-0.1325009, -0.5491065, -4.658754, 0, 1, 0.6039216, 1,
-0.1321872, -0.5329758, -2.093779, 0, 1, 0.6117647, 1,
-0.131268, 1.483755, -0.562585, 0, 1, 0.6156863, 1,
-0.1306233, -0.4927159, -2.220166, 0, 1, 0.6235294, 1,
-0.1293786, -0.2131438, -2.48525, 0, 1, 0.627451, 1,
-0.1261757, -1.289509, -3.903277, 0, 1, 0.6352941, 1,
-0.1214067, 1.021525, 0.2582392, 0, 1, 0.6392157, 1,
-0.1180673, -0.486096, -3.159765, 0, 1, 0.6470588, 1,
-0.1173954, 0.2318812, -1.785281, 0, 1, 0.6509804, 1,
-0.1160328, 0.3498925, -0.388677, 0, 1, 0.6588235, 1,
-0.1143434, 0.3776631, 0.290778, 0, 1, 0.6627451, 1,
-0.1143376, -1.16542, -2.621824, 0, 1, 0.6705883, 1,
-0.113272, -1.744968, -3.192058, 0, 1, 0.6745098, 1,
-0.113258, 0.5569018, -2.53475, 0, 1, 0.682353, 1,
-0.1110448, 0.4116544, -1.870868, 0, 1, 0.6862745, 1,
-0.110535, -0.1775432, -2.397413, 0, 1, 0.6941177, 1,
-0.1083531, 0.5068933, -0.2571019, 0, 1, 0.7019608, 1,
-0.1076724, -2.292551, -3.38351, 0, 1, 0.7058824, 1,
-0.1049161, -0.111688, -1.222735, 0, 1, 0.7137255, 1,
-0.1026947, -0.4766584, -3.524774, 0, 1, 0.7176471, 1,
-0.1017395, 0.04758427, 0.3872051, 0, 1, 0.7254902, 1,
-0.09207424, 1.157148, 1.626708, 0, 1, 0.7294118, 1,
-0.08236458, -1.49978, -4.746572, 0, 1, 0.7372549, 1,
-0.08137871, 0.3398617, -1.165793, 0, 1, 0.7411765, 1,
-0.08020735, 0.4183504, 1.144268, 0, 1, 0.7490196, 1,
-0.07870724, -0.6569884, -3.435093, 0, 1, 0.7529412, 1,
-0.07369761, -2.071666, -2.777354, 0, 1, 0.7607843, 1,
-0.07357897, 0.3622666, 0.240434, 0, 1, 0.7647059, 1,
-0.0730551, -1.75668, -5.537072, 0, 1, 0.772549, 1,
-0.06937527, -0.3802996, -3.6251, 0, 1, 0.7764706, 1,
-0.06640883, -0.2636166, -1.159825, 0, 1, 0.7843137, 1,
-0.06105106, -0.3036208, -3.254834, 0, 1, 0.7882353, 1,
-0.06078649, -1.581824, -5.038316, 0, 1, 0.7960784, 1,
-0.0597378, 0.742444, 0.6531187, 0, 1, 0.8039216, 1,
-0.05942361, 1.440547, 0.7306352, 0, 1, 0.8078431, 1,
-0.05763567, 1.076753, -1.049573, 0, 1, 0.8156863, 1,
-0.05428376, -0.7114779, -3.113193, 0, 1, 0.8196079, 1,
-0.05419468, -0.7727094, -2.620881, 0, 1, 0.827451, 1,
-0.05145926, 0.4783662, 0.3926244, 0, 1, 0.8313726, 1,
-0.04822711, -1.517562, -4.066429, 0, 1, 0.8392157, 1,
-0.04613557, -0.7171379, -5.478314, 0, 1, 0.8431373, 1,
-0.03886757, -0.8553467, -1.936096, 0, 1, 0.8509804, 1,
-0.03365962, -1.257779, -3.971328, 0, 1, 0.854902, 1,
-0.03235706, 0.258978, 0.3009175, 0, 1, 0.8627451, 1,
-0.02633244, -0.965242, -2.841242, 0, 1, 0.8666667, 1,
-0.01045592, 0.08620119, -0.5466939, 0, 1, 0.8745098, 1,
-0.01043181, -0.8895797, -3.894241, 0, 1, 0.8784314, 1,
-0.01037907, -0.9841784, -1.929843, 0, 1, 0.8862745, 1,
-0.01031919, -2.049314, -4.461537, 0, 1, 0.8901961, 1,
-0.008873292, 1.394624, 0.4320701, 0, 1, 0.8980392, 1,
-0.008141696, 0.7337173, 0.6017584, 0, 1, 0.9058824, 1,
-0.007801629, -0.7197627, -3.047802, 0, 1, 0.9098039, 1,
0.002755962, -0.1664371, 1.871608, 0, 1, 0.9176471, 1,
0.006083917, 0.9817198, -0.06945328, 0, 1, 0.9215686, 1,
0.00778351, -0.4831426, 2.136244, 0, 1, 0.9294118, 1,
0.0141968, -0.336629, 1.836584, 0, 1, 0.9333333, 1,
0.01542053, -0.6860854, 1.882306, 0, 1, 0.9411765, 1,
0.02153457, 0.7622052, -1.107641, 0, 1, 0.945098, 1,
0.02433784, 0.4821378, -0.5963857, 0, 1, 0.9529412, 1,
0.02492899, -0.8542975, 3.001343, 0, 1, 0.9568627, 1,
0.02528176, 0.3052035, 2.33624, 0, 1, 0.9647059, 1,
0.02635353, 1.513184, -0.006487565, 0, 1, 0.9686275, 1,
0.02752468, -0.6425271, 1.967969, 0, 1, 0.9764706, 1,
0.02832433, -1.034541, 2.278647, 0, 1, 0.9803922, 1,
0.0284319, -0.5305097, 2.465763, 0, 1, 0.9882353, 1,
0.02970678, 0.6046295, 1.565493, 0, 1, 0.9921569, 1,
0.03371199, -0.1081848, 2.868685, 0, 1, 1, 1,
0.03520336, 0.745716, -0.3194264, 0, 0.9921569, 1, 1,
0.03859208, 0.9571164, -2.13312, 0, 0.9882353, 1, 1,
0.04240523, 0.1598255, 1.117018, 0, 0.9803922, 1, 1,
0.04714327, -0.6951198, 1.766848, 0, 0.9764706, 1, 1,
0.05080821, -0.4524, 3.938987, 0, 0.9686275, 1, 1,
0.05121363, 1.748736, -1.327279, 0, 0.9647059, 1, 1,
0.05624871, 0.3238004, 1.369006, 0, 0.9568627, 1, 1,
0.05893046, 0.8674994, -0.9969927, 0, 0.9529412, 1, 1,
0.05907955, -0.4371174, 3.246921, 0, 0.945098, 1, 1,
0.05971907, -1.692212, 2.680325, 0, 0.9411765, 1, 1,
0.06515644, 0.8561345, 1.537286, 0, 0.9333333, 1, 1,
0.06777034, -0.3491999, 4.917706, 0, 0.9294118, 1, 1,
0.06984002, -0.115592, 2.58283, 0, 0.9215686, 1, 1,
0.07045117, 1.022542, 0.7593701, 0, 0.9176471, 1, 1,
0.07146809, -0.9272159, 3.661844, 0, 0.9098039, 1, 1,
0.07932472, -0.2247269, 1.388888, 0, 0.9058824, 1, 1,
0.08213149, 0.4142186, -1.173523, 0, 0.8980392, 1, 1,
0.08471263, -1.030648, 3.519999, 0, 0.8901961, 1, 1,
0.08826745, -0.1894372, 2.422417, 0, 0.8862745, 1, 1,
0.09074245, 0.08807397, -1.538799, 0, 0.8784314, 1, 1,
0.09443244, -0.6180612, 3.930011, 0, 0.8745098, 1, 1,
0.0945876, -0.2459449, 2.693257, 0, 0.8666667, 1, 1,
0.0985933, -0.4373736, 2.931607, 0, 0.8627451, 1, 1,
0.09922475, 0.3425727, 2.852289, 0, 0.854902, 1, 1,
0.1024859, -0.3618144, 3.854174, 0, 0.8509804, 1, 1,
0.1062384, -0.1063336, 2.863902, 0, 0.8431373, 1, 1,
0.1082137, -0.22329, 3.432515, 0, 0.8392157, 1, 1,
0.1097291, -0.2899017, 2.177032, 0, 0.8313726, 1, 1,
0.1113367, -1.1278, 3.033392, 0, 0.827451, 1, 1,
0.1135817, -0.2234408, 2.766761, 0, 0.8196079, 1, 1,
0.1136251, 1.510202, -0.2772963, 0, 0.8156863, 1, 1,
0.1151013, -0.7296509, 2.011801, 0, 0.8078431, 1, 1,
0.1168685, 0.5616667, -0.8885511, 0, 0.8039216, 1, 1,
0.1240734, 0.6512364, 0.3296709, 0, 0.7960784, 1, 1,
0.1241525, 2.130837, 1.132057, 0, 0.7882353, 1, 1,
0.1271449, 0.3382425, 1.975024, 0, 0.7843137, 1, 1,
0.1276202, 0.9824051, 0.03207592, 0, 0.7764706, 1, 1,
0.128338, 0.9768414, 0.1907279, 0, 0.772549, 1, 1,
0.1283632, 0.7426867, 0.9175667, 0, 0.7647059, 1, 1,
0.1291606, -0.510303, 3.984305, 0, 0.7607843, 1, 1,
0.1298647, -0.2436734, 2.431811, 0, 0.7529412, 1, 1,
0.1323627, 0.8016175, 0.04989211, 0, 0.7490196, 1, 1,
0.134341, 0.03623322, 2.007388, 0, 0.7411765, 1, 1,
0.1359697, 0.5291745, -2.249311, 0, 0.7372549, 1, 1,
0.1385474, -0.440243, 3.058133, 0, 0.7294118, 1, 1,
0.1386417, -0.227577, 3.394097, 0, 0.7254902, 1, 1,
0.1396772, -0.1631534, 0.8014672, 0, 0.7176471, 1, 1,
0.140381, 0.0543387, 1.103456, 0, 0.7137255, 1, 1,
0.1452129, 0.02102075, 1.010366, 0, 0.7058824, 1, 1,
0.1468441, 1.346503, 2.448869, 0, 0.6980392, 1, 1,
0.1488039, -0.6795772, 1.913855, 0, 0.6941177, 1, 1,
0.1509265, 0.3350011, 1.10595, 0, 0.6862745, 1, 1,
0.1519632, -0.1015478, 4.517861, 0, 0.682353, 1, 1,
0.1528251, 1.019421, -0.1372696, 0, 0.6745098, 1, 1,
0.1544236, 0.1583686, 1.115998, 0, 0.6705883, 1, 1,
0.1556525, -1.015232, 2.641062, 0, 0.6627451, 1, 1,
0.1568378, -0.2654017, 3.518654, 0, 0.6588235, 1, 1,
0.1570599, 0.8841283, -0.9979831, 0, 0.6509804, 1, 1,
0.1583435, -0.1856598, 2.406393, 0, 0.6470588, 1, 1,
0.1609823, -0.6665052, 4.549526, 0, 0.6392157, 1, 1,
0.166555, -0.5381036, 2.103515, 0, 0.6352941, 1, 1,
0.1715066, 1.685818, 0.0735656, 0, 0.627451, 1, 1,
0.1745306, -0.5208054, 2.692392, 0, 0.6235294, 1, 1,
0.1790623, 0.003365739, 2.146042, 0, 0.6156863, 1, 1,
0.1803529, 0.7054399, -0.9423283, 0, 0.6117647, 1, 1,
0.1812076, 1.020788, 2.393427, 0, 0.6039216, 1, 1,
0.1825178, 1.213246, 0.2073731, 0, 0.5960785, 1, 1,
0.1855721, -0.9998967, 3.341894, 0, 0.5921569, 1, 1,
0.1870649, -0.3734017, 3.535759, 0, 0.5843138, 1, 1,
0.1909187, 0.03436482, 0.9342521, 0, 0.5803922, 1, 1,
0.1929151, 0.8834722, -0.1444734, 0, 0.572549, 1, 1,
0.1966999, -0.01039689, 1.460261, 0, 0.5686275, 1, 1,
0.1984407, -0.6510369, 1.864231, 0, 0.5607843, 1, 1,
0.2037529, -0.968653, 3.233768, 0, 0.5568628, 1, 1,
0.2069542, -1.103513, 4.551842, 0, 0.5490196, 1, 1,
0.2071324, 0.7486317, 0.5919886, 0, 0.5450981, 1, 1,
0.2072338, 1.200971, -0.1532241, 0, 0.5372549, 1, 1,
0.2080227, 0.5070792, 1.039498, 0, 0.5333334, 1, 1,
0.2082836, 1.898103, 0.3939973, 0, 0.5254902, 1, 1,
0.2144576, 0.1374614, 0.7111531, 0, 0.5215687, 1, 1,
0.2154083, -0.1738974, 2.418658, 0, 0.5137255, 1, 1,
0.2158006, -0.820608, 2.617738, 0, 0.509804, 1, 1,
0.2163455, -0.3232661, 3.312995, 0, 0.5019608, 1, 1,
0.2188596, -0.4000348, 3.634582, 0, 0.4941176, 1, 1,
0.2217366, -0.341932, 3.456122, 0, 0.4901961, 1, 1,
0.2234684, -1.079341, 3.46176, 0, 0.4823529, 1, 1,
0.226788, -0.1985105, 2.752262, 0, 0.4784314, 1, 1,
0.2329216, -0.541464, 2.132455, 0, 0.4705882, 1, 1,
0.2331185, 0.1860284, 2.627669, 0, 0.4666667, 1, 1,
0.2335095, -0.0236016, 1.229284, 0, 0.4588235, 1, 1,
0.2375368, -0.5147529, 3.088459, 0, 0.454902, 1, 1,
0.2383811, 0.6403137, -0.5885409, 0, 0.4470588, 1, 1,
0.2458917, -0.3123549, 0.8299301, 0, 0.4431373, 1, 1,
0.246818, 0.02201723, 1.58348, 0, 0.4352941, 1, 1,
0.250883, 0.2628616, 0.1145018, 0, 0.4313726, 1, 1,
0.2539999, -2.236688, 2.390901, 0, 0.4235294, 1, 1,
0.2547125, 0.1444463, 1.742023, 0, 0.4196078, 1, 1,
0.2562642, 1.594372, -0.7698563, 0, 0.4117647, 1, 1,
0.2562776, 0.7846826, 0.2778024, 0, 0.4078431, 1, 1,
0.2577954, -1.021874, 3.693186, 0, 0.4, 1, 1,
0.2611958, 2.731861, -0.9033908, 0, 0.3921569, 1, 1,
0.2637407, 0.899105, 0.4709398, 0, 0.3882353, 1, 1,
0.2657889, 0.03982989, 2.841075, 0, 0.3803922, 1, 1,
0.2664829, 2.053785, -0.1541497, 0, 0.3764706, 1, 1,
0.2672448, -0.4759837, 2.168285, 0, 0.3686275, 1, 1,
0.2703442, 1.157732, 1.695541, 0, 0.3647059, 1, 1,
0.2735037, 1.543964, -0.001451969, 0, 0.3568628, 1, 1,
0.2741609, -0.8967755, 1.886084, 0, 0.3529412, 1, 1,
0.2814948, -0.08272521, -0.2785494, 0, 0.345098, 1, 1,
0.2838217, 0.1127223, 2.764883, 0, 0.3411765, 1, 1,
0.2936565, -0.03130697, 0.6808122, 0, 0.3333333, 1, 1,
0.2947295, 0.2275801, 1.219757, 0, 0.3294118, 1, 1,
0.2948836, 1.014093, -0.2340503, 0, 0.3215686, 1, 1,
0.302529, -0.4318796, 1.927603, 0, 0.3176471, 1, 1,
0.3046824, -0.1475833, 2.723597, 0, 0.3098039, 1, 1,
0.3084273, -1.568546, 3.915836, 0, 0.3058824, 1, 1,
0.3126628, 1.625899, -1.103692, 0, 0.2980392, 1, 1,
0.3143563, 1.055553, 0.4713033, 0, 0.2901961, 1, 1,
0.3150766, 0.7698535, 0.8340322, 0, 0.2862745, 1, 1,
0.3160824, -0.9275305, 3.301652, 0, 0.2784314, 1, 1,
0.3182014, -1.184784, 2.579549, 0, 0.2745098, 1, 1,
0.3194583, -0.203339, 3.338008, 0, 0.2666667, 1, 1,
0.3213129, -0.4956986, 2.703206, 0, 0.2627451, 1, 1,
0.3213184, -1.173926, 2.997001, 0, 0.254902, 1, 1,
0.3302491, -2.257324, 2.720619, 0, 0.2509804, 1, 1,
0.3449353, -1.103563, 2.951422, 0, 0.2431373, 1, 1,
0.3449557, -0.3242637, 2.399591, 0, 0.2392157, 1, 1,
0.3482906, -1.011476, 1.904197, 0, 0.2313726, 1, 1,
0.3502822, 2.033861, 0.131734, 0, 0.227451, 1, 1,
0.3546511, -0.9762465, 6.182991, 0, 0.2196078, 1, 1,
0.3568032, -0.01759608, 2.474577, 0, 0.2156863, 1, 1,
0.3588011, -1.473657, 3.349384, 0, 0.2078431, 1, 1,
0.3629544, -1.180123, 3.85399, 0, 0.2039216, 1, 1,
0.3635032, -1.487409, 4.426065, 0, 0.1960784, 1, 1,
0.3635675, 1.284357, 0.4751145, 0, 0.1882353, 1, 1,
0.3672172, -1.514684, 2.935154, 0, 0.1843137, 1, 1,
0.371758, -0.1251255, 2.118684, 0, 0.1764706, 1, 1,
0.3766025, -0.1237152, 3.893426, 0, 0.172549, 1, 1,
0.3783218, 1.151219, 0.3054644, 0, 0.1647059, 1, 1,
0.3862861, 1.749714, 0.2241817, 0, 0.1607843, 1, 1,
0.3903896, 1.311844, 0.352074, 0, 0.1529412, 1, 1,
0.4003895, 0.003701326, 1.801443, 0, 0.1490196, 1, 1,
0.4020355, 0.4588896, 1.193184, 0, 0.1411765, 1, 1,
0.4023879, 0.8179503, -0.1135024, 0, 0.1372549, 1, 1,
0.4052957, 0.1247649, 2.799469, 0, 0.1294118, 1, 1,
0.407481, -0.8227238, 3.14094, 0, 0.1254902, 1, 1,
0.414587, 0.8979474, 1.835194, 0, 0.1176471, 1, 1,
0.4168347, -0.1167611, 1.765184, 0, 0.1137255, 1, 1,
0.4173472, 0.3622817, 2.18298, 0, 0.1058824, 1, 1,
0.4188967, 0.7510582, -1.036551, 0, 0.09803922, 1, 1,
0.4270774, -1.182697, 2.063074, 0, 0.09411765, 1, 1,
0.4274827, -0.02048819, -0.03964786, 0, 0.08627451, 1, 1,
0.4277216, -0.8219526, 0.1266457, 0, 0.08235294, 1, 1,
0.4352056, 1.566261, -0.1599399, 0, 0.07450981, 1, 1,
0.4394314, -0.5675803, 1.709348, 0, 0.07058824, 1, 1,
0.4441628, 0.5704111, 0.902539, 0, 0.0627451, 1, 1,
0.4467849, 1.001358, -0.2930892, 0, 0.05882353, 1, 1,
0.4471506, 1.087832, -0.3670756, 0, 0.05098039, 1, 1,
0.4479576, 1.243384, -1.33754, 0, 0.04705882, 1, 1,
0.4479956, -1.063618, 2.200716, 0, 0.03921569, 1, 1,
0.4480107, 0.3549343, 1.368245, 0, 0.03529412, 1, 1,
0.4488452, 0.2165531, 1.631417, 0, 0.02745098, 1, 1,
0.4493695, 0.2985957, 1.95584, 0, 0.02352941, 1, 1,
0.4581051, -1.634146, 3.550146, 0, 0.01568628, 1, 1,
0.4591153, 1.569045, 0.8416352, 0, 0.01176471, 1, 1,
0.45919, -0.4103371, 1.221541, 0, 0.003921569, 1, 1,
0.4607978, -0.4043224, 1.90277, 0.003921569, 0, 1, 1,
0.4658756, 0.8110065, 0.8390257, 0.007843138, 0, 1, 1,
0.4713903, 2.397571, -0.8882792, 0.01568628, 0, 1, 1,
0.4792031, 1.885818, 1.614362, 0.01960784, 0, 1, 1,
0.4795537, -0.9914914, 1.817457, 0.02745098, 0, 1, 1,
0.4799249, 0.6197331, 0.4490417, 0.03137255, 0, 1, 1,
0.4805061, -0.04688489, -0.8459269, 0.03921569, 0, 1, 1,
0.4808507, 0.0266145, 3.439952, 0.04313726, 0, 1, 1,
0.4809353, -0.02903011, 2.609229, 0.05098039, 0, 1, 1,
0.4821439, 1.733526, 1.463983, 0.05490196, 0, 1, 1,
0.4880676, 0.6853091, 0.3465366, 0.0627451, 0, 1, 1,
0.4885889, 0.02422041, 2.022981, 0.06666667, 0, 1, 1,
0.4891254, -0.9530763, 3.316061, 0.07450981, 0, 1, 1,
0.4912794, -0.3127074, 1.716941, 0.07843138, 0, 1, 1,
0.4964177, -0.7363239, 3.653141, 0.08627451, 0, 1, 1,
0.4968507, -1.595817, 2.1044, 0.09019608, 0, 1, 1,
0.5002072, -1.232828, 1.4869, 0.09803922, 0, 1, 1,
0.5025542, -0.3263928, 0.3841722, 0.1058824, 0, 1, 1,
0.5101089, -1.938563, 3.886889, 0.1098039, 0, 1, 1,
0.5101354, 0.02251025, 2.262958, 0.1176471, 0, 1, 1,
0.5112093, 0.1994612, -0.149783, 0.1215686, 0, 1, 1,
0.5142772, 0.8385616, 0.6184309, 0.1294118, 0, 1, 1,
0.5175962, -0.587697, 2.148411, 0.1333333, 0, 1, 1,
0.519015, 0.2381541, 1.738202, 0.1411765, 0, 1, 1,
0.5208125, 2.675809, -0.4049399, 0.145098, 0, 1, 1,
0.5209236, 0.6916072, 2.31974, 0.1529412, 0, 1, 1,
0.5223569, -1.80029, 3.091693, 0.1568628, 0, 1, 1,
0.5316093, -1.345077, 3.45058, 0.1647059, 0, 1, 1,
0.5333195, 0.4830343, 2.323622, 0.1686275, 0, 1, 1,
0.5352132, 0.2407438, 1.619006, 0.1764706, 0, 1, 1,
0.5356079, -1.009255, 1.283578, 0.1803922, 0, 1, 1,
0.5383001, 0.3734305, -0.6229613, 0.1882353, 0, 1, 1,
0.5396015, 1.677892, 1.076738, 0.1921569, 0, 1, 1,
0.5401714, 1.938888, 0.3564143, 0.2, 0, 1, 1,
0.5411543, 1.74526, 1.951292, 0.2078431, 0, 1, 1,
0.5414486, 1.331217, -1.204885, 0.2117647, 0, 1, 1,
0.5433313, 1.2273, 0.2514045, 0.2196078, 0, 1, 1,
0.5503889, 0.6616329, 0.7583244, 0.2235294, 0, 1, 1,
0.5520777, -0.8415391, 1.126624, 0.2313726, 0, 1, 1,
0.554844, -0.9428346, 2.570356, 0.2352941, 0, 1, 1,
0.5554709, 1.080254, 1.848288, 0.2431373, 0, 1, 1,
0.5555572, 1.296897, 0.4293518, 0.2470588, 0, 1, 1,
0.5581293, 0.8654374, 2.206025, 0.254902, 0, 1, 1,
0.5581957, 0.373175, 0.3661849, 0.2588235, 0, 1, 1,
0.5609989, -0.220332, 2.573452, 0.2666667, 0, 1, 1,
0.56232, -0.5508698, 1.282143, 0.2705882, 0, 1, 1,
0.5627022, -1.620314, 3.680913, 0.2784314, 0, 1, 1,
0.5652058, -0.110454, 2.624911, 0.282353, 0, 1, 1,
0.5674174, 0.5371002, 0.9885933, 0.2901961, 0, 1, 1,
0.5701545, 1.602448, -0.380502, 0.2941177, 0, 1, 1,
0.570868, -0.2071543, 1.06552, 0.3019608, 0, 1, 1,
0.5713817, 0.9902101, 0.2350015, 0.3098039, 0, 1, 1,
0.5743102, 1.352525, 0.4946595, 0.3137255, 0, 1, 1,
0.5758417, -1.652549, 3.843521, 0.3215686, 0, 1, 1,
0.575855, 1.210611, 0.005638659, 0.3254902, 0, 1, 1,
0.5764853, -1.069439, 3.597808, 0.3333333, 0, 1, 1,
0.5769575, -1.49, 1.002876, 0.3372549, 0, 1, 1,
0.5781227, 1.447976, -0.2221387, 0.345098, 0, 1, 1,
0.5828777, 2.505972, -0.0203355, 0.3490196, 0, 1, 1,
0.5831395, 1.023191, 1.83955, 0.3568628, 0, 1, 1,
0.5941619, -0.7553545, 3.047548, 0.3607843, 0, 1, 1,
0.5954098, -1.337401, 2.546309, 0.3686275, 0, 1, 1,
0.5986201, 0.9385099, 0.5625317, 0.372549, 0, 1, 1,
0.6023176, -0.7351529, 2.101403, 0.3803922, 0, 1, 1,
0.6097128, -0.1896172, 2.223522, 0.3843137, 0, 1, 1,
0.6097159, -0.8425227, 1.902735, 0.3921569, 0, 1, 1,
0.609903, 2.297374, 0.6270946, 0.3960784, 0, 1, 1,
0.6120632, -1.262723, 2.9876, 0.4039216, 0, 1, 1,
0.6142578, -0.3981094, 3.198208, 0.4117647, 0, 1, 1,
0.6168195, 0.3618771, 0.6324194, 0.4156863, 0, 1, 1,
0.6241286, 0.4324578, 0.8593902, 0.4235294, 0, 1, 1,
0.625824, -0.295074, 1.436513, 0.427451, 0, 1, 1,
0.626821, 0.2211116, 0.9804082, 0.4352941, 0, 1, 1,
0.6274292, 1.09754, -0.6357211, 0.4392157, 0, 1, 1,
0.629838, -0.3621927, 1.659703, 0.4470588, 0, 1, 1,
0.6308123, -1.520115, 2.866227, 0.4509804, 0, 1, 1,
0.6359059, 0.2310907, 1.413906, 0.4588235, 0, 1, 1,
0.6402963, -1.053125, 1.673711, 0.4627451, 0, 1, 1,
0.6467879, -0.1849841, 2.471002, 0.4705882, 0, 1, 1,
0.6471847, 0.4963659, 1.273676, 0.4745098, 0, 1, 1,
0.6486938, -0.5879856, 1.18993, 0.4823529, 0, 1, 1,
0.6487611, 1.263296, -0.7309138, 0.4862745, 0, 1, 1,
0.6487634, -0.5066829, 1.385495, 0.4941176, 0, 1, 1,
0.6522352, -0.7751105, 0.9787113, 0.5019608, 0, 1, 1,
0.652352, -0.391668, 2.436411, 0.5058824, 0, 1, 1,
0.6531606, -0.237226, 1.651627, 0.5137255, 0, 1, 1,
0.6563382, 0.7063923, 1.441273, 0.5176471, 0, 1, 1,
0.6575943, 0.5164568, 0.6233816, 0.5254902, 0, 1, 1,
0.657771, -0.6157657, 3.467432, 0.5294118, 0, 1, 1,
0.6645813, -1.170702, 3.347134, 0.5372549, 0, 1, 1,
0.6685181, -0.4239268, 3.642425, 0.5411765, 0, 1, 1,
0.6689296, -1.335695, 1.382465, 0.5490196, 0, 1, 1,
0.6704525, -0.3488737, 3.033732, 0.5529412, 0, 1, 1,
0.6759831, 0.1729784, 1.063096, 0.5607843, 0, 1, 1,
0.6780079, 0.3270633, 0.8194174, 0.5647059, 0, 1, 1,
0.6791632, 1.452546, 0.2877929, 0.572549, 0, 1, 1,
0.6794978, 1.423188, -0.2122232, 0.5764706, 0, 1, 1,
0.6818263, -2.091888, 2.432893, 0.5843138, 0, 1, 1,
0.6842219, -1.613511, 3.753778, 0.5882353, 0, 1, 1,
0.6890708, 1.562814, 1.036927, 0.5960785, 0, 1, 1,
0.6922345, -1.406436, 4.79181, 0.6039216, 0, 1, 1,
0.6928604, -0.7490127, 2.174963, 0.6078432, 0, 1, 1,
0.7017785, 0.01077063, 1.328553, 0.6156863, 0, 1, 1,
0.7026308, -0.383288, 3.211324, 0.6196079, 0, 1, 1,
0.7026592, 0.7648398, 2.069893, 0.627451, 0, 1, 1,
0.707828, -0.2446286, 2.998807, 0.6313726, 0, 1, 1,
0.712388, -1.999451, 3.073016, 0.6392157, 0, 1, 1,
0.7130942, 1.363705, 1.708233, 0.6431373, 0, 1, 1,
0.72574, 0.8692199, 1.072907, 0.6509804, 0, 1, 1,
0.7264078, -0.9370691, 3.626195, 0.654902, 0, 1, 1,
0.7268898, -2.659598, 1.376857, 0.6627451, 0, 1, 1,
0.7303671, 0.2897356, 1.211922, 0.6666667, 0, 1, 1,
0.7307168, 1.221029, -0.2575203, 0.6745098, 0, 1, 1,
0.7308461, -2.182511, 2.043353, 0.6784314, 0, 1, 1,
0.7361168, 0.3767335, 0.5466969, 0.6862745, 0, 1, 1,
0.7371486, -1.620172, 2.693574, 0.6901961, 0, 1, 1,
0.7374976, 0.242037, 0.6859802, 0.6980392, 0, 1, 1,
0.7402462, 1.008762, 1.712001, 0.7058824, 0, 1, 1,
0.7413548, -0.3652613, 0.08520228, 0.7098039, 0, 1, 1,
0.7420698, -1.678248, 2.796153, 0.7176471, 0, 1, 1,
0.7477511, -1.189912, 3.95654, 0.7215686, 0, 1, 1,
0.752372, -1.284458, 3.09734, 0.7294118, 0, 1, 1,
0.7531174, 1.52838, 0.230909, 0.7333333, 0, 1, 1,
0.7533307, 0.7047519, -1.377077, 0.7411765, 0, 1, 1,
0.7567312, 1.757704, 0.1033542, 0.7450981, 0, 1, 1,
0.7578754, -1.510625, 1.136928, 0.7529412, 0, 1, 1,
0.7580839, -1.932899, 2.249281, 0.7568628, 0, 1, 1,
0.7677976, 0.1915974, 1.06422, 0.7647059, 0, 1, 1,
0.7691152, 0.3487965, 2.114831, 0.7686275, 0, 1, 1,
0.7746297, -0.5648829, 4.065526, 0.7764706, 0, 1, 1,
0.7763159, 0.379292, 1.119453, 0.7803922, 0, 1, 1,
0.7833196, -0.3948348, 3.948106, 0.7882353, 0, 1, 1,
0.7840536, -1.346246, 1.883817, 0.7921569, 0, 1, 1,
0.794952, 0.03058303, 2.552135, 0.8, 0, 1, 1,
0.7976188, -0.005450871, 2.288537, 0.8078431, 0, 1, 1,
0.8109713, 1.591486, 0.5849089, 0.8117647, 0, 1, 1,
0.8151186, 0.7916683, -1.767426, 0.8196079, 0, 1, 1,
0.8155674, 1.351995, 1.707966, 0.8235294, 0, 1, 1,
0.8254038, 1.230273, 1.558047, 0.8313726, 0, 1, 1,
0.8264411, 1.672482, -0.3864951, 0.8352941, 0, 1, 1,
0.8325223, -0.06785467, 1.167115, 0.8431373, 0, 1, 1,
0.8341899, 0.05553908, 2.289884, 0.8470588, 0, 1, 1,
0.8366632, 0.988072, 0.3779578, 0.854902, 0, 1, 1,
0.8381162, -0.5921128, 1.355743, 0.8588235, 0, 1, 1,
0.838878, -0.1246511, 3.845886, 0.8666667, 0, 1, 1,
0.8393618, 0.03991574, 0.626548, 0.8705882, 0, 1, 1,
0.8436962, 0.3514232, 1.003335, 0.8784314, 0, 1, 1,
0.8451179, -0.6905913, 3.582598, 0.8823529, 0, 1, 1,
0.8544541, 0.08339023, 1.95304, 0.8901961, 0, 1, 1,
0.8562629, -2.088457, 2.478507, 0.8941177, 0, 1, 1,
0.8602021, 0.3647729, 1.260829, 0.9019608, 0, 1, 1,
0.8613944, 2.016227, 0.6892823, 0.9098039, 0, 1, 1,
0.8664364, 1.835365, 1.07313, 0.9137255, 0, 1, 1,
0.8680277, 0.2103861, 0.5401192, 0.9215686, 0, 1, 1,
0.8698382, 0.03083179, 2.445947, 0.9254902, 0, 1, 1,
0.8716513, -0.8738806, 2.182589, 0.9333333, 0, 1, 1,
0.8825471, -1.002755, 2.521285, 0.9372549, 0, 1, 1,
0.8856705, 1.939146, 0.7533001, 0.945098, 0, 1, 1,
0.8913692, 0.5021446, 0.6468167, 0.9490196, 0, 1, 1,
0.8964332, -0.773406, 2.139301, 0.9568627, 0, 1, 1,
0.9032563, 1.423286, 0.3867149, 0.9607843, 0, 1, 1,
0.9037655, -0.3945516, 3.122993, 0.9686275, 0, 1, 1,
0.9071571, -0.8687527, 3.946443, 0.972549, 0, 1, 1,
0.9079087, 0.3772069, 3.252574, 0.9803922, 0, 1, 1,
0.9085575, -0.9428512, 3.062806, 0.9843137, 0, 1, 1,
0.9148566, -0.3643717, 2.94547, 0.9921569, 0, 1, 1,
0.9193664, -0.9695704, 2.449536, 0.9960784, 0, 1, 1,
0.9268393, 2.2095, -0.3389256, 1, 0, 0.9960784, 1,
0.9268643, -0.7881925, 1.27322, 1, 0, 0.9882353, 1,
0.9287242, -0.006866989, 1.701057, 1, 0, 0.9843137, 1,
0.9289836, 0.9819031, 0.5493563, 1, 0, 0.9764706, 1,
0.9315296, -0.1617598, 0.4148677, 1, 0, 0.972549, 1,
0.9315343, -2.079596, 3.640728, 1, 0, 0.9647059, 1,
0.9334665, 1.186062, 1.227605, 1, 0, 0.9607843, 1,
0.9338144, -0.1730026, 0.464639, 1, 0, 0.9529412, 1,
0.9385763, 1.66186, -0.8933495, 1, 0, 0.9490196, 1,
0.9387462, 0.4522954, 0.3207801, 1, 0, 0.9411765, 1,
0.9389991, -0.398309, 4.405695, 1, 0, 0.9372549, 1,
0.9407465, 0.7911438, 0.5522587, 1, 0, 0.9294118, 1,
0.943277, 0.6531516, 0.1983243, 1, 0, 0.9254902, 1,
0.9597145, 1.052148, 2.739731, 1, 0, 0.9176471, 1,
0.9711602, -0.7288754, 1.580534, 1, 0, 0.9137255, 1,
0.9735333, -1.518956, 2.252871, 1, 0, 0.9058824, 1,
0.9737254, -2.121037, 3.878259, 1, 0, 0.9019608, 1,
0.9741254, -1.493235, 2.87181, 1, 0, 0.8941177, 1,
0.9769543, -0.01837591, 1.318317, 1, 0, 0.8862745, 1,
0.9786259, -0.109139, 0.1984629, 1, 0, 0.8823529, 1,
0.9792314, -0.3840588, 2.556641, 1, 0, 0.8745098, 1,
0.9820931, -0.8849323, 2.198344, 1, 0, 0.8705882, 1,
0.9881079, -0.218546, -0.4483956, 1, 0, 0.8627451, 1,
0.9946481, 1.667613, -0.3432855, 1, 0, 0.8588235, 1,
1.009339, -0.831358, 1.06333, 1, 0, 0.8509804, 1,
1.010436, 0.003587552, 0.5774163, 1, 0, 0.8470588, 1,
1.015368, -1.659845, 4.494273, 1, 0, 0.8392157, 1,
1.017356, -0.3993968, 2.842798, 1, 0, 0.8352941, 1,
1.01756, 0.3165532, 1.507522, 1, 0, 0.827451, 1,
1.022638, 0.6887711, 1.468467, 1, 0, 0.8235294, 1,
1.027532, 0.1789756, 1.357196, 1, 0, 0.8156863, 1,
1.030125, 0.3760339, 1.602122, 1, 0, 0.8117647, 1,
1.039065, -1.181275, 1.86903, 1, 0, 0.8039216, 1,
1.04995, 0.01392686, 0.3991369, 1, 0, 0.7960784, 1,
1.05205, -1.337027, 4.013571, 1, 0, 0.7921569, 1,
1.052811, 0.7349653, 2.212286, 1, 0, 0.7843137, 1,
1.056011, 0.2320894, 0.2442214, 1, 0, 0.7803922, 1,
1.069922, 0.9974687, 1.749643, 1, 0, 0.772549, 1,
1.0799, 0.1105894, 0.9007055, 1, 0, 0.7686275, 1,
1.080227, 0.6931456, 1.717545, 1, 0, 0.7607843, 1,
1.083663, 0.07047435, 0.5641112, 1, 0, 0.7568628, 1,
1.090282, 0.1836742, 2.153744, 1, 0, 0.7490196, 1,
1.092734, -0.5171096, 1.044285, 1, 0, 0.7450981, 1,
1.09529, 1.364891, 0.1865836, 1, 0, 0.7372549, 1,
1.096059, 0.6822531, 1.271736, 1, 0, 0.7333333, 1,
1.100368, 2.649971, 1.33768, 1, 0, 0.7254902, 1,
1.112079, -0.860633, 1.929833, 1, 0, 0.7215686, 1,
1.116457, 0.3864047, -0.7293901, 1, 0, 0.7137255, 1,
1.12097, 0.01446547, 0.9977207, 1, 0, 0.7098039, 1,
1.124166, -0.6674033, 2.911986, 1, 0, 0.7019608, 1,
1.128448, -0.7587477, 2.029517, 1, 0, 0.6941177, 1,
1.131748, 0.02279655, 1.436925, 1, 0, 0.6901961, 1,
1.132354, -0.9138976, 3.014374, 1, 0, 0.682353, 1,
1.14571, 0.126809, -0.2593997, 1, 0, 0.6784314, 1,
1.148365, -0.05550543, 0.3022637, 1, 0, 0.6705883, 1,
1.149979, 0.6372149, 1.552793, 1, 0, 0.6666667, 1,
1.150322, 0.4192432, 1.910865, 1, 0, 0.6588235, 1,
1.163725, -0.2068352, 1.419667, 1, 0, 0.654902, 1,
1.171956, 0.07986894, 1.614957, 1, 0, 0.6470588, 1,
1.179687, 0.4614078, 1.249644, 1, 0, 0.6431373, 1,
1.195905, 1.280109, 3.340174, 1, 0, 0.6352941, 1,
1.200134, 0.6588646, 1.308146, 1, 0, 0.6313726, 1,
1.206045, 2.304177, -1.677994, 1, 0, 0.6235294, 1,
1.215302, -0.7367953, 1.098729, 1, 0, 0.6196079, 1,
1.215711, -0.986791, 2.626868, 1, 0, 0.6117647, 1,
1.226602, -1.140686, 2.202126, 1, 0, 0.6078432, 1,
1.230579, 1.073532, 1.094754, 1, 0, 0.6, 1,
1.230943, 0.8762149, 1.332352, 1, 0, 0.5921569, 1,
1.2333, 0.09885245, 0.8710682, 1, 0, 0.5882353, 1,
1.243165, -1.547397, 1.819317, 1, 0, 0.5803922, 1,
1.260265, 0.8538716, 0.6873539, 1, 0, 0.5764706, 1,
1.260659, -0.3687838, 2.184812, 1, 0, 0.5686275, 1,
1.264612, -0.1298585, 1.628807, 1, 0, 0.5647059, 1,
1.275427, -0.4742795, 2.118845, 1, 0, 0.5568628, 1,
1.280202, -0.3452792, 0.9047837, 1, 0, 0.5529412, 1,
1.285938, 0.6526076, 2.453128, 1, 0, 0.5450981, 1,
1.300578, 1.702181, -0.1623359, 1, 0, 0.5411765, 1,
1.303731, -1.511299, 5.019126, 1, 0, 0.5333334, 1,
1.312026, 0.02392268, 2.198772, 1, 0, 0.5294118, 1,
1.319088, 0.1769964, 2.758804, 1, 0, 0.5215687, 1,
1.336058, -0.7693304, 1.783198, 1, 0, 0.5176471, 1,
1.338348, -0.9483331, 1.537688, 1, 0, 0.509804, 1,
1.340812, -2.013973, 3.178311, 1, 0, 0.5058824, 1,
1.346769, -0.01619632, 0.67327, 1, 0, 0.4980392, 1,
1.361333, 1.390063, 3.475184, 1, 0, 0.4901961, 1,
1.368837, 0.8636242, 2.172145, 1, 0, 0.4862745, 1,
1.370701, 0.4652725, 2.305518, 1, 0, 0.4784314, 1,
1.372914, -1.035259, 1.385202, 1, 0, 0.4745098, 1,
1.378885, 0.7727969, 2.693839, 1, 0, 0.4666667, 1,
1.380538, -1.687837, 1.72717, 1, 0, 0.4627451, 1,
1.389255, -0.3712268, 3.480185, 1, 0, 0.454902, 1,
1.400055, 0.9406943, -0.9643008, 1, 0, 0.4509804, 1,
1.4071, 0.4986329, 2.499869, 1, 0, 0.4431373, 1,
1.411561, 0.5338725, 2.3525, 1, 0, 0.4392157, 1,
1.416588, 0.1216149, 1.230593, 1, 0, 0.4313726, 1,
1.421215, -0.1885602, 2.800124, 1, 0, 0.427451, 1,
1.423202, 1.461316, 2.761364, 1, 0, 0.4196078, 1,
1.4328, 1.674175, 1.546784, 1, 0, 0.4156863, 1,
1.441013, -0.2151836, 3.960463, 1, 0, 0.4078431, 1,
1.452379, -1.49752, 3.534893, 1, 0, 0.4039216, 1,
1.457272, 0.2872557, 1.032423, 1, 0, 0.3960784, 1,
1.476287, 0.5428711, 0.6793252, 1, 0, 0.3882353, 1,
1.495684, 1.225963, 0.8058797, 1, 0, 0.3843137, 1,
1.502143, -1.024356, 2.531263, 1, 0, 0.3764706, 1,
1.546779, -1.372396, 1.540592, 1, 0, 0.372549, 1,
1.5505, 0.1347271, 2.428806, 1, 0, 0.3647059, 1,
1.553389, -2.329047, 1.342631, 1, 0, 0.3607843, 1,
1.554566, -0.6815588, 3.536606, 1, 0, 0.3529412, 1,
1.559381, -1.14595, 1.821294, 1, 0, 0.3490196, 1,
1.560913, 0.2624386, -0.5424835, 1, 0, 0.3411765, 1,
1.562702, -0.7107021, 3.680155, 1, 0, 0.3372549, 1,
1.570745, -0.1586034, -1.08044, 1, 0, 0.3294118, 1,
1.581407, 2.190152, 0.7540401, 1, 0, 0.3254902, 1,
1.594705, 0.2291792, -0.3978304, 1, 0, 0.3176471, 1,
1.595791, 2.324678, 0.3328318, 1, 0, 0.3137255, 1,
1.616898, 0.8734081, 0.646973, 1, 0, 0.3058824, 1,
1.631476, -0.53873, 2.472366, 1, 0, 0.2980392, 1,
1.650617, 0.2580426, 1.483939, 1, 0, 0.2941177, 1,
1.687201, -0.7664247, 0.3104145, 1, 0, 0.2862745, 1,
1.692356, 0.1456448, 0.987642, 1, 0, 0.282353, 1,
1.695873, 0.5136679, 2.488693, 1, 0, 0.2745098, 1,
1.70023, -2.040364, 3.483955, 1, 0, 0.2705882, 1,
1.708038, 0.9255089, 3.263808, 1, 0, 0.2627451, 1,
1.710312, -0.3347781, 0.6952735, 1, 0, 0.2588235, 1,
1.730318, -0.7626595, 3.000634, 1, 0, 0.2509804, 1,
1.742092, -0.3817162, 2.217713, 1, 0, 0.2470588, 1,
1.759232, 0.543053, 1.320833, 1, 0, 0.2392157, 1,
1.802215, -1.19333, 3.716469, 1, 0, 0.2352941, 1,
1.804146, -0.3070866, 3.268684, 1, 0, 0.227451, 1,
1.8047, 1.689118, -0.3364711, 1, 0, 0.2235294, 1,
1.814043, 0.5577749, 1.095353, 1, 0, 0.2156863, 1,
1.814077, 0.4099191, 0.6521503, 1, 0, 0.2117647, 1,
1.82714, -1.147523, 3.464323, 1, 0, 0.2039216, 1,
1.832618, 1.277287, 0.7801514, 1, 0, 0.1960784, 1,
1.832637, 2.003596, 0.09729446, 1, 0, 0.1921569, 1,
1.845243, -0.461306, 0.9497883, 1, 0, 0.1843137, 1,
1.85613, -0.7678382, 1.425582, 1, 0, 0.1803922, 1,
1.871369, 0.4375848, 2.297932, 1, 0, 0.172549, 1,
1.883262, -0.4624707, -0.396294, 1, 0, 0.1686275, 1,
1.902872, 0.6529226, 2.467599, 1, 0, 0.1607843, 1,
1.91589, -0.3941211, 2.717616, 1, 0, 0.1568628, 1,
1.926827, -0.4728448, 1.717267, 1, 0, 0.1490196, 1,
1.940662, -1.551233, 0.6289219, 1, 0, 0.145098, 1,
1.94666, 1.015288, 0.9991082, 1, 0, 0.1372549, 1,
1.948479, 1.74695, 0.5143286, 1, 0, 0.1333333, 1,
1.948796, 0.53361, 0.668491, 1, 0, 0.1254902, 1,
1.96393, 1.831564, 1.734499, 1, 0, 0.1215686, 1,
1.98899, -0.7071804, 2.292942, 1, 0, 0.1137255, 1,
2.011732, 0.1707001, 2.70081, 1, 0, 0.1098039, 1,
2.020665, 0.2688489, 2.001683, 1, 0, 0.1019608, 1,
2.036721, -0.614935, 2.095894, 1, 0, 0.09411765, 1,
2.058451, 0.3704433, 2.388243, 1, 0, 0.09019608, 1,
2.066952, -0.003324305, 1.901944, 1, 0, 0.08235294, 1,
2.105307, -0.04573838, -1.137483, 1, 0, 0.07843138, 1,
2.108734, -1.263828, 3.035028, 1, 0, 0.07058824, 1,
2.199872, 1.167504, 0.3464534, 1, 0, 0.06666667, 1,
2.220654, -0.3253851, 0.5759867, 1, 0, 0.05882353, 1,
2.247087, 0.4255095, 1.94626, 1, 0, 0.05490196, 1,
2.35907, -0.7595551, 1.458, 1, 0, 0.04705882, 1,
2.365133, -1.171645, 2.511408, 1, 0, 0.04313726, 1,
2.370514, 0.9037453, -1.329849, 1, 0, 0.03529412, 1,
2.373352, 0.4561813, -1.388752, 1, 0, 0.03137255, 1,
2.697481, -0.2833152, 1.381129, 1, 0, 0.02352941, 1,
2.888803, -0.3765352, 1.443703, 1, 0, 0.01960784, 1,
2.972252, -1.345684, 2.699998, 1, 0, 0.01176471, 1,
3.317121, -1.750527, 1.804028, 1, 0, 0.007843138, 1
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
-0.1043122, -3.928281, -7.523622, 0, -0.5, 0.5, 0.5,
-0.1043122, -3.928281, -7.523622, 1, -0.5, 0.5, 0.5,
-0.1043122, -3.928281, -7.523622, 1, 1.5, 0.5, 0.5,
-0.1043122, -3.928281, -7.523622, 0, 1.5, 0.5, 0.5
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
-4.685611, 0.4415241, -7.523622, 0, -0.5, 0.5, 0.5,
-4.685611, 0.4415241, -7.523622, 1, -0.5, 0.5, 0.5,
-4.685611, 0.4415241, -7.523622, 1, 1.5, 0.5, 0.5,
-4.685611, 0.4415241, -7.523622, 0, 1.5, 0.5, 0.5
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
-4.685611, -3.928281, 0.3229594, 0, -0.5, 0.5, 0.5,
-4.685611, -3.928281, 0.3229594, 1, -0.5, 0.5, 0.5,
-4.685611, -3.928281, 0.3229594, 1, 1.5, 0.5, 0.5,
-4.685611, -3.928281, 0.3229594, 0, 1.5, 0.5, 0.5
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
-3, -2.919864, -5.712873,
3, -2.919864, -5.712873,
-3, -2.919864, -5.712873,
-3, -3.087934, -6.014664,
-2, -2.919864, -5.712873,
-2, -3.087934, -6.014664,
-1, -2.919864, -5.712873,
-1, -3.087934, -6.014664,
0, -2.919864, -5.712873,
0, -3.087934, -6.014664,
1, -2.919864, -5.712873,
1, -3.087934, -6.014664,
2, -2.919864, -5.712873,
2, -3.087934, -6.014664,
3, -2.919864, -5.712873,
3, -3.087934, -6.014664
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
-3, -3.424073, -6.618248, 0, -0.5, 0.5, 0.5,
-3, -3.424073, -6.618248, 1, -0.5, 0.5, 0.5,
-3, -3.424073, -6.618248, 1, 1.5, 0.5, 0.5,
-3, -3.424073, -6.618248, 0, 1.5, 0.5, 0.5,
-2, -3.424073, -6.618248, 0, -0.5, 0.5, 0.5,
-2, -3.424073, -6.618248, 1, -0.5, 0.5, 0.5,
-2, -3.424073, -6.618248, 1, 1.5, 0.5, 0.5,
-2, -3.424073, -6.618248, 0, 1.5, 0.5, 0.5,
-1, -3.424073, -6.618248, 0, -0.5, 0.5, 0.5,
-1, -3.424073, -6.618248, 1, -0.5, 0.5, 0.5,
-1, -3.424073, -6.618248, 1, 1.5, 0.5, 0.5,
-1, -3.424073, -6.618248, 0, 1.5, 0.5, 0.5,
0, -3.424073, -6.618248, 0, -0.5, 0.5, 0.5,
0, -3.424073, -6.618248, 1, -0.5, 0.5, 0.5,
0, -3.424073, -6.618248, 1, 1.5, 0.5, 0.5,
0, -3.424073, -6.618248, 0, 1.5, 0.5, 0.5,
1, -3.424073, -6.618248, 0, -0.5, 0.5, 0.5,
1, -3.424073, -6.618248, 1, -0.5, 0.5, 0.5,
1, -3.424073, -6.618248, 1, 1.5, 0.5, 0.5,
1, -3.424073, -6.618248, 0, 1.5, 0.5, 0.5,
2, -3.424073, -6.618248, 0, -0.5, 0.5, 0.5,
2, -3.424073, -6.618248, 1, -0.5, 0.5, 0.5,
2, -3.424073, -6.618248, 1, 1.5, 0.5, 0.5,
2, -3.424073, -6.618248, 0, 1.5, 0.5, 0.5,
3, -3.424073, -6.618248, 0, -0.5, 0.5, 0.5,
3, -3.424073, -6.618248, 1, -0.5, 0.5, 0.5,
3, -3.424073, -6.618248, 1, 1.5, 0.5, 0.5,
3, -3.424073, -6.618248, 0, 1.5, 0.5, 0.5
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
-3.628388, -2, -5.712873,
-3.628388, 3, -5.712873,
-3.628388, -2, -5.712873,
-3.804592, -2, -6.014664,
-3.628388, -1, -5.712873,
-3.804592, -1, -6.014664,
-3.628388, 0, -5.712873,
-3.804592, 0, -6.014664,
-3.628388, 1, -5.712873,
-3.804592, 1, -6.014664,
-3.628388, 2, -5.712873,
-3.804592, 2, -6.014664,
-3.628388, 3, -5.712873,
-3.804592, 3, -6.014664
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
-4.157, -2, -6.618248, 0, -0.5, 0.5, 0.5,
-4.157, -2, -6.618248, 1, -0.5, 0.5, 0.5,
-4.157, -2, -6.618248, 1, 1.5, 0.5, 0.5,
-4.157, -2, -6.618248, 0, 1.5, 0.5, 0.5,
-4.157, -1, -6.618248, 0, -0.5, 0.5, 0.5,
-4.157, -1, -6.618248, 1, -0.5, 0.5, 0.5,
-4.157, -1, -6.618248, 1, 1.5, 0.5, 0.5,
-4.157, -1, -6.618248, 0, 1.5, 0.5, 0.5,
-4.157, 0, -6.618248, 0, -0.5, 0.5, 0.5,
-4.157, 0, -6.618248, 1, -0.5, 0.5, 0.5,
-4.157, 0, -6.618248, 1, 1.5, 0.5, 0.5,
-4.157, 0, -6.618248, 0, 1.5, 0.5, 0.5,
-4.157, 1, -6.618248, 0, -0.5, 0.5, 0.5,
-4.157, 1, -6.618248, 1, -0.5, 0.5, 0.5,
-4.157, 1, -6.618248, 1, 1.5, 0.5, 0.5,
-4.157, 1, -6.618248, 0, 1.5, 0.5, 0.5,
-4.157, 2, -6.618248, 0, -0.5, 0.5, 0.5,
-4.157, 2, -6.618248, 1, -0.5, 0.5, 0.5,
-4.157, 2, -6.618248, 1, 1.5, 0.5, 0.5,
-4.157, 2, -6.618248, 0, 1.5, 0.5, 0.5,
-4.157, 3, -6.618248, 0, -0.5, 0.5, 0.5,
-4.157, 3, -6.618248, 1, -0.5, 0.5, 0.5,
-4.157, 3, -6.618248, 1, 1.5, 0.5, 0.5,
-4.157, 3, -6.618248, 0, 1.5, 0.5, 0.5
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
-3.628388, -2.919864, -4,
-3.628388, -2.919864, 6,
-3.628388, -2.919864, -4,
-3.804592, -3.087934, -4,
-3.628388, -2.919864, -2,
-3.804592, -3.087934, -2,
-3.628388, -2.919864, 0,
-3.804592, -3.087934, 0,
-3.628388, -2.919864, 2,
-3.804592, -3.087934, 2,
-3.628388, -2.919864, 4,
-3.804592, -3.087934, 4,
-3.628388, -2.919864, 6,
-3.804592, -3.087934, 6
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
-4.157, -3.424073, -4, 0, -0.5, 0.5, 0.5,
-4.157, -3.424073, -4, 1, -0.5, 0.5, 0.5,
-4.157, -3.424073, -4, 1, 1.5, 0.5, 0.5,
-4.157, -3.424073, -4, 0, 1.5, 0.5, 0.5,
-4.157, -3.424073, -2, 0, -0.5, 0.5, 0.5,
-4.157, -3.424073, -2, 1, -0.5, 0.5, 0.5,
-4.157, -3.424073, -2, 1, 1.5, 0.5, 0.5,
-4.157, -3.424073, -2, 0, 1.5, 0.5, 0.5,
-4.157, -3.424073, 0, 0, -0.5, 0.5, 0.5,
-4.157, -3.424073, 0, 1, -0.5, 0.5, 0.5,
-4.157, -3.424073, 0, 1, 1.5, 0.5, 0.5,
-4.157, -3.424073, 0, 0, 1.5, 0.5, 0.5,
-4.157, -3.424073, 2, 0, -0.5, 0.5, 0.5,
-4.157, -3.424073, 2, 1, -0.5, 0.5, 0.5,
-4.157, -3.424073, 2, 1, 1.5, 0.5, 0.5,
-4.157, -3.424073, 2, 0, 1.5, 0.5, 0.5,
-4.157, -3.424073, 4, 0, -0.5, 0.5, 0.5,
-4.157, -3.424073, 4, 1, -0.5, 0.5, 0.5,
-4.157, -3.424073, 4, 1, 1.5, 0.5, 0.5,
-4.157, -3.424073, 4, 0, 1.5, 0.5, 0.5,
-4.157, -3.424073, 6, 0, -0.5, 0.5, 0.5,
-4.157, -3.424073, 6, 1, -0.5, 0.5, 0.5,
-4.157, -3.424073, 6, 1, 1.5, 0.5, 0.5,
-4.157, -3.424073, 6, 0, 1.5, 0.5, 0.5
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
-3.628388, -2.919864, -5.712873,
-3.628388, 3.802913, -5.712873,
-3.628388, -2.919864, 6.358791,
-3.628388, 3.802913, 6.358791,
-3.628388, -2.919864, -5.712873,
-3.628388, -2.919864, 6.358791,
-3.628388, 3.802913, -5.712873,
-3.628388, 3.802913, 6.358791,
-3.628388, -2.919864, -5.712873,
3.419764, -2.919864, -5.712873,
-3.628388, -2.919864, 6.358791,
3.419764, -2.919864, 6.358791,
-3.628388, 3.802913, -5.712873,
3.419764, 3.802913, -5.712873,
-3.628388, 3.802913, 6.358791,
3.419764, 3.802913, 6.358791,
3.419764, -2.919864, -5.712873,
3.419764, 3.802913, -5.712873,
3.419764, -2.919864, 6.358791,
3.419764, 3.802913, 6.358791,
3.419764, -2.919864, -5.712873,
3.419764, -2.919864, 6.358791,
3.419764, 3.802913, -5.712873,
3.419764, 3.802913, 6.358791
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
var radius = 8.282678;
var distance = 36.85057;
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
mvMatrix.translate( 0.1043122, -0.4415241, -0.3229594 );
mvMatrix.scale( 1.270602, 1.332097, 0.7418525 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.85057);
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
Salithion<-read.table("Salithion.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Salithion$V2
```

```
## Error in eval(expr, envir, enclos): object 'Salithion' not found
```

```r
y<-Salithion$V3
```

```
## Error in eval(expr, envir, enclos): object 'Salithion' not found
```

```r
z<-Salithion$V4
```

```
## Error in eval(expr, envir, enclos): object 'Salithion' not found
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
-3.525745, -0.8412822, -0.4357933, 0, 0, 1, 1, 1,
-3.161044, 1.039763, -2.661769, 1, 0, 0, 1, 1,
-2.853567, 1.004676, -2.191639, 1, 0, 0, 1, 1,
-2.788198, 1.597854, -0.6290898, 1, 0, 0, 1, 1,
-2.787007, 0.9105088, -3.1468, 1, 0, 0, 1, 1,
-2.670882, -0.07686786, -1.595656, 1, 0, 0, 1, 1,
-2.568922, -1.056492, -1.766529, 0, 0, 0, 1, 1,
-2.552045, 0.4107967, -0.8044374, 0, 0, 0, 1, 1,
-2.527401, 0.08038035, -0.7983877, 0, 0, 0, 1, 1,
-2.49404, -0.2239236, -0.2024879, 0, 0, 0, 1, 1,
-2.47696, 0.4342425, 0.002147389, 0, 0, 0, 1, 1,
-2.379114, 1.077834, -2.415715, 0, 0, 0, 1, 1,
-2.281787, 1.054561, -0.8899832, 0, 0, 0, 1, 1,
-2.271957, 1.103737, -0.3901106, 1, 1, 1, 1, 1,
-2.267352, -1.155996, -1.958173, 1, 1, 1, 1, 1,
-2.227363, -0.8955024, -1.497025, 1, 1, 1, 1, 1,
-2.2026, -0.5020781, -3.814457, 1, 1, 1, 1, 1,
-2.14996, -0.452907, -2.877909, 1, 1, 1, 1, 1,
-2.096284, -0.567786, -2.173556, 1, 1, 1, 1, 1,
-2.083997, -0.3162861, -1.585478, 1, 1, 1, 1, 1,
-2.076034, -0.2086379, -1.471693, 1, 1, 1, 1, 1,
-2.072449, 0.214411, -0.5347215, 1, 1, 1, 1, 1,
-2.065433, -0.3013945, -1.814946, 1, 1, 1, 1, 1,
-2.046747, -0.803436, -2.261264, 1, 1, 1, 1, 1,
-2.026717, -1.648049, -3.565068, 1, 1, 1, 1, 1,
-2.012636, 0.05811438, -1.326059, 1, 1, 1, 1, 1,
-1.970026, 0.1633232, -2.8001, 1, 1, 1, 1, 1,
-1.969355, -1.942256, -3.354802, 1, 1, 1, 1, 1,
-1.950068, 0.6645924, -1.624261, 0, 0, 1, 1, 1,
-1.932353, -0.06097429, -1.154252, 1, 0, 0, 1, 1,
-1.914365, 1.854903, -0.8067409, 1, 0, 0, 1, 1,
-1.89568, -1.36025, -1.912794, 1, 0, 0, 1, 1,
-1.895671, -1.229639, -0.6158532, 1, 0, 0, 1, 1,
-1.840638, 0.4023023, -0.949627, 1, 0, 0, 1, 1,
-1.834669, 1.005994, -0.104046, 0, 0, 0, 1, 1,
-1.828621, 1.632105, 0.8177506, 0, 0, 0, 1, 1,
-1.819882, 0.2926102, -2.443908, 0, 0, 0, 1, 1,
-1.806774, -0.2836768, -3.89366, 0, 0, 0, 1, 1,
-1.805644, 0.1412058, -1.366756, 0, 0, 0, 1, 1,
-1.7894, -1.358009, -2.884027, 0, 0, 0, 1, 1,
-1.780859, -0.1350824, -2.102633, 0, 0, 0, 1, 1,
-1.773847, -0.1598047, -1.987681, 1, 1, 1, 1, 1,
-1.773481, -1.304253, -3.657937, 1, 1, 1, 1, 1,
-1.767193, -0.9890527, -3.906434, 1, 1, 1, 1, 1,
-1.736182, -2.690505, -1.208602, 1, 1, 1, 1, 1,
-1.711397, 2.376751, 0.4202055, 1, 1, 1, 1, 1,
-1.697359, -0.4650224, -1.004505, 1, 1, 1, 1, 1,
-1.688668, 1.746032, -1.758008, 1, 1, 1, 1, 1,
-1.686985, 0.6591424, -2.681178, 1, 1, 1, 1, 1,
-1.66055, 1.117298, -0.1011405, 1, 1, 1, 1, 1,
-1.65246, 0.2427563, -2.058026, 1, 1, 1, 1, 1,
-1.64005, -0.5390708, 1.05717, 1, 1, 1, 1, 1,
-1.636835, -0.5185856, -1.705661, 1, 1, 1, 1, 1,
-1.624716, 0.7535113, -1.643137, 1, 1, 1, 1, 1,
-1.623997, -0.5624251, -1.571391, 1, 1, 1, 1, 1,
-1.585238, 1.95163, -1.042384, 1, 1, 1, 1, 1,
-1.575368, 0.6048051, -0.8019746, 0, 0, 1, 1, 1,
-1.563857, -1.544158, -1.943933, 1, 0, 0, 1, 1,
-1.536485, -0.1090626, -1.794501, 1, 0, 0, 1, 1,
-1.52657, -0.5422259, -0.9288813, 1, 0, 0, 1, 1,
-1.503996, 0.3385578, -2.65273, 1, 0, 0, 1, 1,
-1.498238, -0.4218208, -0.5109678, 1, 0, 0, 1, 1,
-1.494184, -0.3257547, -2.808031, 0, 0, 0, 1, 1,
-1.493777, 0.2993079, -1.875522, 0, 0, 0, 1, 1,
-1.492706, -0.118611, -3.111603, 0, 0, 0, 1, 1,
-1.488553, 1.505382, 2.205667, 0, 0, 0, 1, 1,
-1.474471, -0.4218045, -2.496586, 0, 0, 0, 1, 1,
-1.461331, -1.680155, -0.6747597, 0, 0, 0, 1, 1,
-1.449108, -0.2858947, -1.789583, 0, 0, 0, 1, 1,
-1.43689, -0.1171749, -1.322997, 1, 1, 1, 1, 1,
-1.432832, 0.5216354, -0.172435, 1, 1, 1, 1, 1,
-1.430669, 0.4022823, -1.416941, 1, 1, 1, 1, 1,
-1.425183, 0.1720262, -1.112738, 1, 1, 1, 1, 1,
-1.419099, 0.8181509, -1.605902, 1, 1, 1, 1, 1,
-1.417718, -1.261383, -2.739606, 1, 1, 1, 1, 1,
-1.41621, 1.842786, -0.5597719, 1, 1, 1, 1, 1,
-1.389489, 0.6043077, -2.242763, 1, 1, 1, 1, 1,
-1.387172, 0.6523029, -2.174888, 1, 1, 1, 1, 1,
-1.385743, -0.5251322, -2.39518, 1, 1, 1, 1, 1,
-1.378949, 0.228971, -2.169921, 1, 1, 1, 1, 1,
-1.376633, -0.825101, -3.311784, 1, 1, 1, 1, 1,
-1.369857, 3.055679, -0.1829706, 1, 1, 1, 1, 1,
-1.368789, -0.3799839, -2.015039, 1, 1, 1, 1, 1,
-1.367252, 0.3091989, -2.579009, 1, 1, 1, 1, 1,
-1.360737, -0.8580887, -2.546533, 0, 0, 1, 1, 1,
-1.356411, -0.2889456, -2.74476, 1, 0, 0, 1, 1,
-1.353874, 0.2964318, -1.373473, 1, 0, 0, 1, 1,
-1.335774, 0.4964565, -0.5934332, 1, 0, 0, 1, 1,
-1.301224, 0.1219984, -1.497028, 1, 0, 0, 1, 1,
-1.287425, 0.02032994, -1.394088, 1, 0, 0, 1, 1,
-1.286658, 1.131347, -1.207535, 0, 0, 0, 1, 1,
-1.286354, -1.680515, -1.549443, 0, 0, 0, 1, 1,
-1.270123, -0.9906845, -3.716923, 0, 0, 0, 1, 1,
-1.264909, 1.346895, -0.3317905, 0, 0, 0, 1, 1,
-1.258668, 0.3208641, -1.160676, 0, 0, 0, 1, 1,
-1.249825, -1.44909, -3.374956, 0, 0, 0, 1, 1,
-1.241039, -0.7956077, -1.278252, 0, 0, 0, 1, 1,
-1.240281, 0.2139419, -1.63245, 1, 1, 1, 1, 1,
-1.229341, 2.530094, 0.2824784, 1, 1, 1, 1, 1,
-1.22863, -0.8481724, -2.675682, 1, 1, 1, 1, 1,
-1.212527, 0.09897356, -0.8084213, 1, 1, 1, 1, 1,
-1.207814, -1.190452, -4.05678, 1, 1, 1, 1, 1,
-1.204299, 0.176506, -1.933948, 1, 1, 1, 1, 1,
-1.202205, 0.7555707, -2.374055, 1, 1, 1, 1, 1,
-1.198218, -0.1992716, -1.323972, 1, 1, 1, 1, 1,
-1.182523, 0.1946255, -1.615087, 1, 1, 1, 1, 1,
-1.176696, -0.2513348, -1.06151, 1, 1, 1, 1, 1,
-1.171153, 1.233256, -0.5468026, 1, 1, 1, 1, 1,
-1.165989, 0.7493459, -1.319261, 1, 1, 1, 1, 1,
-1.155088, -0.7171761, -1.268077, 1, 1, 1, 1, 1,
-1.133879, 1.26816, -1.84589, 1, 1, 1, 1, 1,
-1.132173, -0.3795304, -1.441378, 1, 1, 1, 1, 1,
-1.128434, -0.3607501, -3.114646, 0, 0, 1, 1, 1,
-1.126372, -0.03417745, -1.684304, 1, 0, 0, 1, 1,
-1.121635, -1.543042, -1.210358, 1, 0, 0, 1, 1,
-1.117461, 0.2430466, -0.4794305, 1, 0, 0, 1, 1,
-1.113044, 2.663304, 0.04329114, 1, 0, 0, 1, 1,
-1.109658, 0.8574249, -2.055538, 1, 0, 0, 1, 1,
-1.109255, -0.3233387, -1.29092, 0, 0, 0, 1, 1,
-1.099304, 0.7356023, -2.348325, 0, 0, 0, 1, 1,
-1.097016, 0.08188975, -1.159107, 0, 0, 0, 1, 1,
-1.095491, 0.2804889, 0.4642103, 0, 0, 0, 1, 1,
-1.091688, 1.893321, 0.989463, 0, 0, 0, 1, 1,
-1.091018, 0.3918582, -1.658866, 0, 0, 0, 1, 1,
-1.090286, 0.3256999, -1.580332, 0, 0, 0, 1, 1,
-1.088484, 0.5404562, -1.069497, 1, 1, 1, 1, 1,
-1.084844, -0.856477, -4.253657, 1, 1, 1, 1, 1,
-1.083364, -0.002082493, -0.8173943, 1, 1, 1, 1, 1,
-1.081143, -0.001186969, -2.511673, 1, 1, 1, 1, 1,
-1.080952, -0.2850421, -1.200908, 1, 1, 1, 1, 1,
-1.07826, 1.950131, -0.7422522, 1, 1, 1, 1, 1,
-1.077118, 0.9305691, -1.699239, 1, 1, 1, 1, 1,
-1.070587, -0.0425378, -1.942827, 1, 1, 1, 1, 1,
-1.059166, 0.3440641, -1.583547, 1, 1, 1, 1, 1,
-1.058314, -1.005704, -2.902461, 1, 1, 1, 1, 1,
-1.057184, -0.3524911, -2.085566, 1, 1, 1, 1, 1,
-1.052405, 0.03859239, -1.892684, 1, 1, 1, 1, 1,
-1.046475, -0.401722, -0.4992362, 1, 1, 1, 1, 1,
-1.045494, -0.7903037, -0.1754241, 1, 1, 1, 1, 1,
-1.043676, -0.3390886, -1.99729, 1, 1, 1, 1, 1,
-1.038838, 0.1728505, -0.5439884, 0, 0, 1, 1, 1,
-1.033103, -0.33659, -0.4493032, 1, 0, 0, 1, 1,
-1.030347, 2.003486, 0.2199642, 1, 0, 0, 1, 1,
-1.029113, -1.262046, -3.89116, 1, 0, 0, 1, 1,
-1.025025, -0.2037456, -2.461671, 1, 0, 0, 1, 1,
-1.023165, -1.098217, -1.704895, 1, 0, 0, 1, 1,
-1.013911, -1.664972, -2.853187, 0, 0, 0, 1, 1,
-1.007669, 0.0332459, -2.29221, 0, 0, 0, 1, 1,
-1.002678, -0.3270279, -0.7651807, 0, 0, 0, 1, 1,
-0.9997671, 1.926199, 2.125784, 0, 0, 0, 1, 1,
-0.9956771, 0.4142358, -0.9086155, 0, 0, 0, 1, 1,
-0.9935673, 0.8359261, 0.2725958, 0, 0, 0, 1, 1,
-0.9910256, 0.649617, -0.3093556, 0, 0, 0, 1, 1,
-0.9889699, 1.44705, -0.02669493, 1, 1, 1, 1, 1,
-0.9888294, -1.255512, -2.677544, 1, 1, 1, 1, 1,
-0.9876337, 0.3701034, -1.343506, 1, 1, 1, 1, 1,
-0.9848484, -0.5837499, -1.615904, 1, 1, 1, 1, 1,
-0.9806179, -0.949421, -1.682049, 1, 1, 1, 1, 1,
-0.9780452, -0.8293117, -3.884274, 1, 1, 1, 1, 1,
-0.9771469, -0.05903066, -2.091572, 1, 1, 1, 1, 1,
-0.9648715, -1.477862, -2.82139, 1, 1, 1, 1, 1,
-0.9573278, 0.3391057, -2.075761, 1, 1, 1, 1, 1,
-0.9497451, 0.1653142, -2.43574, 1, 1, 1, 1, 1,
-0.9349391, 1.267996, -0.5528918, 1, 1, 1, 1, 1,
-0.9139155, -0.3933974, -3.577397, 1, 1, 1, 1, 1,
-0.9133463, -0.483335, -1.98632, 1, 1, 1, 1, 1,
-0.9108175, 0.3781308, -1.850201, 1, 1, 1, 1, 1,
-0.9083082, 0.9819003, 0.7241527, 1, 1, 1, 1, 1,
-0.903182, -0.2014931, -2.719221, 0, 0, 1, 1, 1,
-0.9016507, -0.6896157, -4.033853, 1, 0, 0, 1, 1,
-0.9014323, -2.226264, -4.695329, 1, 0, 0, 1, 1,
-0.9010534, -2.371614, -4.349673, 1, 0, 0, 1, 1,
-0.9004349, 0.08713762, -1.669517, 1, 0, 0, 1, 1,
-0.8941523, -1.514418, -2.544607, 1, 0, 0, 1, 1,
-0.8907959, 0.4937315, -1.086841, 0, 0, 0, 1, 1,
-0.8899329, -1.452444, -2.518355, 0, 0, 0, 1, 1,
-0.8865814, 2.457834, -0.84908, 0, 0, 0, 1, 1,
-0.8858615, -1.113256, -3.195462, 0, 0, 0, 1, 1,
-0.87997, 0.9860732, -0.8820947, 0, 0, 0, 1, 1,
-0.8750188, -0.1177178, -1.819303, 0, 0, 0, 1, 1,
-0.8662713, 1.874423, 0.008366044, 0, 0, 0, 1, 1,
-0.8640577, -1.41433, -3.042721, 1, 1, 1, 1, 1,
-0.8563465, -0.664403, -2.715287, 1, 1, 1, 1, 1,
-0.8555889, 0.7163665, -0.1267821, 1, 1, 1, 1, 1,
-0.8545038, 0.7463776, -0.01117047, 1, 1, 1, 1, 1,
-0.8475208, -0.5359182, -0.996718, 1, 1, 1, 1, 1,
-0.8466147, 1.852061, -0.2249721, 1, 1, 1, 1, 1,
-0.8446439, -0.204631, -1.148697, 1, 1, 1, 1, 1,
-0.8422884, -1.729818, -2.086793, 1, 1, 1, 1, 1,
-0.8395405, 0.3607768, -2.759804, 1, 1, 1, 1, 1,
-0.8328586, 0.0292858, -1.613444, 1, 1, 1, 1, 1,
-0.8307173, 0.9303655, -1.079489, 1, 1, 1, 1, 1,
-0.8296092, -0.3259412, -3.855422, 1, 1, 1, 1, 1,
-0.8239244, -0.1850151, -1.976827, 1, 1, 1, 1, 1,
-0.8146204, 0.4497841, -1.148922, 1, 1, 1, 1, 1,
-0.8136061, -2.043224, -2.567134, 1, 1, 1, 1, 1,
-0.8113838, 2.624424, -0.4395941, 0, 0, 1, 1, 1,
-0.8076483, -2.287689, -2.852502, 1, 0, 0, 1, 1,
-0.8070656, 0.5105719, 0.3834961, 1, 0, 0, 1, 1,
-0.8033543, 0.539544, -0.500771, 1, 0, 0, 1, 1,
-0.8006033, 0.4980191, -0.2160021, 1, 0, 0, 1, 1,
-0.7955446, 2.378302, 1.519892, 1, 0, 0, 1, 1,
-0.7930886, -0.2574038, -0.1649521, 0, 0, 0, 1, 1,
-0.7919625, -1.242899, -3.653763, 0, 0, 0, 1, 1,
-0.7869625, -0.4386983, -2.206182, 0, 0, 0, 1, 1,
-0.7841229, -0.4157827, -3.842702, 0, 0, 0, 1, 1,
-0.7839454, 1.584901, 0.1354759, 0, 0, 0, 1, 1,
-0.7802925, -0.2949618, -1.69875, 0, 0, 0, 1, 1,
-0.7754098, 1.019547, -1.093504, 0, 0, 0, 1, 1,
-0.7704931, 0.2649139, -1.583117, 1, 1, 1, 1, 1,
-0.7704896, 0.5767587, 1.041392, 1, 1, 1, 1, 1,
-0.7669698, -1.087743, -2.011289, 1, 1, 1, 1, 1,
-0.7597064, 1.392087, 0.5649784, 1, 1, 1, 1, 1,
-0.7585387, 1.346126, 0.4452438, 1, 1, 1, 1, 1,
-0.7572958, 0.1130941, -1.217408, 1, 1, 1, 1, 1,
-0.7565646, 0.3049769, -1.194039, 1, 1, 1, 1, 1,
-0.7564877, 0.1522555, -2.086796, 1, 1, 1, 1, 1,
-0.7555086, -1.504685, -1.674216, 1, 1, 1, 1, 1,
-0.7550459, -1.610196, -1.666239, 1, 1, 1, 1, 1,
-0.7536341, -0.9188864, -3.373036, 1, 1, 1, 1, 1,
-0.7459624, 1.767011, 0.5240453, 1, 1, 1, 1, 1,
-0.7450982, 0.5904748, -1.67707, 1, 1, 1, 1, 1,
-0.7411619, -0.5571768, -2.609499, 1, 1, 1, 1, 1,
-0.7408258, -0.2190491, -0.02746941, 1, 1, 1, 1, 1,
-0.7399776, 0.9516702, 0.8977698, 0, 0, 1, 1, 1,
-0.7354664, 0.4250638, -0.8161395, 1, 0, 0, 1, 1,
-0.7314893, -1.594332, -2.603786, 1, 0, 0, 1, 1,
-0.728506, 1.903062, -0.1447684, 1, 0, 0, 1, 1,
-0.7179558, 0.8368479, 0.06667636, 1, 0, 0, 1, 1,
-0.7126843, -0.9953003, -3.549817, 1, 0, 0, 1, 1,
-0.7108082, 0.130536, -0.6654723, 0, 0, 0, 1, 1,
-0.7029324, -0.4163633, -0.6265146, 0, 0, 0, 1, 1,
-0.7002754, -0.5302904, -2.419625, 0, 0, 0, 1, 1,
-0.6966355, -0.01432005, -2.046516, 0, 0, 0, 1, 1,
-0.6953029, 0.9676567, -1.335896, 0, 0, 0, 1, 1,
-0.6918564, -0.9113358, -3.582252, 0, 0, 0, 1, 1,
-0.691407, 0.279226, 0.5655704, 0, 0, 0, 1, 1,
-0.6905841, -0.1595421, -2.184192, 1, 1, 1, 1, 1,
-0.6863886, 1.895949, 0.685454, 1, 1, 1, 1, 1,
-0.6752861, -0.2804093, 0.04479671, 1, 1, 1, 1, 1,
-0.6687031, -1.092304, -0.7592252, 1, 1, 1, 1, 1,
-0.6673983, 0.113537, -0.3535871, 1, 1, 1, 1, 1,
-0.6662394, -0.4103854, -1.172992, 1, 1, 1, 1, 1,
-0.6641197, -0.06392231, -2.347114, 1, 1, 1, 1, 1,
-0.655064, 0.6194159, 0.6230798, 1, 1, 1, 1, 1,
-0.6532878, -0.333126, -2.032863, 1, 1, 1, 1, 1,
-0.6420213, -0.1024036, -0.7740039, 1, 1, 1, 1, 1,
-0.6407155, -1.972355, -0.9950412, 1, 1, 1, 1, 1,
-0.6388075, -1.100949, -2.72311, 1, 1, 1, 1, 1,
-0.6365219, 1.589909, 1.079752, 1, 1, 1, 1, 1,
-0.636158, 0.4508678, -0.5018926, 1, 1, 1, 1, 1,
-0.6361371, -0.6321838, -1.981933, 1, 1, 1, 1, 1,
-0.6353596, -0.9461173, -1.600558, 0, 0, 1, 1, 1,
-0.6350134, 1.185508, 0.9353974, 1, 0, 0, 1, 1,
-0.6346781, 1.457608, -0.8295756, 1, 0, 0, 1, 1,
-0.6232858, 0.2711814, -0.2613314, 1, 0, 0, 1, 1,
-0.615724, 0.5680135, -1.716322, 1, 0, 0, 1, 1,
-0.611499, -1.15276, -4.608509, 1, 0, 0, 1, 1,
-0.6109165, 1.867825, -0.08754762, 0, 0, 0, 1, 1,
-0.6086659, 0.729196, -1.649132, 0, 0, 0, 1, 1,
-0.6055197, 0.9869336, -0.1332608, 0, 0, 0, 1, 1,
-0.6036988, -0.0834095, 0.2263024, 0, 0, 0, 1, 1,
-0.6018921, 1.407828, -0.2706103, 0, 0, 0, 1, 1,
-0.6005967, 1.521367, 0.216572, 0, 0, 0, 1, 1,
-0.5996877, -0.05522033, 0.1126279, 0, 0, 0, 1, 1,
-0.5983939, -0.6178611, -2.74601, 1, 1, 1, 1, 1,
-0.5966055, -0.5578913, -2.593704, 1, 1, 1, 1, 1,
-0.5954219, -0.8752851, -3.752725, 1, 1, 1, 1, 1,
-0.5915336, 2.501969, 0.7027005, 1, 1, 1, 1, 1,
-0.5836089, 0.1873439, -1.17603, 1, 1, 1, 1, 1,
-0.5820026, 0.1468851, -0.1658568, 1, 1, 1, 1, 1,
-0.5779644, 2.5212, -0.4880703, 1, 1, 1, 1, 1,
-0.5746942, 0.3115017, -1.800019, 1, 1, 1, 1, 1,
-0.5711172, -0.607909, -2.507539, 1, 1, 1, 1, 1,
-0.5710948, 1.131401, -1.462385, 1, 1, 1, 1, 1,
-0.5695628, -0.2171001, -0.5865949, 1, 1, 1, 1, 1,
-0.5694549, -2.439203, -1.538922, 1, 1, 1, 1, 1,
-0.5678318, -0.2943766, -1.681472, 1, 1, 1, 1, 1,
-0.5586075, 0.3593792, -1.314997, 1, 1, 1, 1, 1,
-0.5558501, 0.4599178, -0.7447795, 1, 1, 1, 1, 1,
-0.5545132, -0.5059008, -4.366885, 0, 0, 1, 1, 1,
-0.5367188, -0.2156463, -0.7391775, 1, 0, 0, 1, 1,
-0.5355755, 0.9110112, 0.4808374, 1, 0, 0, 1, 1,
-0.5310824, 0.9724, 0.6848493, 1, 0, 0, 1, 1,
-0.5288109, -0.4688988, -1.884611, 1, 0, 0, 1, 1,
-0.5265785, -0.2902192, -2.453719, 1, 0, 0, 1, 1,
-0.5230457, 0.51136, 0.1304397, 0, 0, 0, 1, 1,
-0.5102525, 0.8799779, -0.6383768, 0, 0, 0, 1, 1,
-0.5064865, -0.6803701, -1.012401, 0, 0, 0, 1, 1,
-0.5052562, -1.368823, -3.904275, 0, 0, 0, 1, 1,
-0.4988765, -0.9983035, -1.119964, 0, 0, 0, 1, 1,
-0.4971706, 0.3085069, -1.558745, 0, 0, 0, 1, 1,
-0.4962945, -0.7266545, -2.141093, 0, 0, 0, 1, 1,
-0.4953524, -0.4699607, -3.652995, 1, 1, 1, 1, 1,
-0.4889031, 0.2147217, -1.824517, 1, 1, 1, 1, 1,
-0.4865088, 1.611374, 0.8624687, 1, 1, 1, 1, 1,
-0.4849527, -0.4666742, -1.575586, 1, 1, 1, 1, 1,
-0.4807255, -0.3330227, -2.641774, 1, 1, 1, 1, 1,
-0.4761024, -1.428267, -1.92338, 1, 1, 1, 1, 1,
-0.4630157, -0.8448444, -2.750523, 1, 1, 1, 1, 1,
-0.4622897, 1.147797, 0.08927611, 1, 1, 1, 1, 1,
-0.4581907, -1.088605, -3.42789, 1, 1, 1, 1, 1,
-0.4547379, -0.1243878, -1.876421, 1, 1, 1, 1, 1,
-0.4509331, -1.225571, -2.791584, 1, 1, 1, 1, 1,
-0.449061, 1.210155, -0.1975223, 1, 1, 1, 1, 1,
-0.4490496, -0.7310275, -1.228934, 1, 1, 1, 1, 1,
-0.4471006, -0.2916281, -3.70407, 1, 1, 1, 1, 1,
-0.4466845, -1.168873, -3.5817, 1, 1, 1, 1, 1,
-0.4398232, -0.1053545, -0.2984782, 0, 0, 1, 1, 1,
-0.4392514, -0.1052267, 1.150391e-05, 1, 0, 0, 1, 1,
-0.4384808, 0.3232481, -1.515472, 1, 0, 0, 1, 1,
-0.437391, -0.7828959, -2.05286, 1, 0, 0, 1, 1,
-0.4353005, -0.3636992, -2.172058, 1, 0, 0, 1, 1,
-0.4334032, -0.9602298, -2.379801, 1, 0, 0, 1, 1,
-0.4324526, -1.046162, -1.922025, 0, 0, 0, 1, 1,
-0.4318397, 0.5085927, -1.592953, 0, 0, 0, 1, 1,
-0.4276429, -1.718545, -3.108414, 0, 0, 0, 1, 1,
-0.4273452, 0.9391987, -2.539844, 0, 0, 0, 1, 1,
-0.4239318, -0.4817353, -2.924299, 0, 0, 0, 1, 1,
-0.4236182, -0.3750895, -1.458686, 0, 0, 0, 1, 1,
-0.4229427, 0.3040874, -1.497193, 0, 0, 0, 1, 1,
-0.4221633, -0.649999, -3.522727, 1, 1, 1, 1, 1,
-0.4212083, 0.8847402, 1.338422, 1, 1, 1, 1, 1,
-0.4142824, -0.6287723, -1.865532, 1, 1, 1, 1, 1,
-0.4106544, 1.76178, -0.1132293, 1, 1, 1, 1, 1,
-0.4078338, -0.3820498, -1.01529, 1, 1, 1, 1, 1,
-0.401996, 0.9501317, 0.8698271, 1, 1, 1, 1, 1,
-0.3986097, 0.4944311, -0.9414336, 1, 1, 1, 1, 1,
-0.3980275, 0.7332188, 0.05003671, 1, 1, 1, 1, 1,
-0.3936703, -0.3346999, -2.46118, 1, 1, 1, 1, 1,
-0.392842, 0.5125718, -1.727437, 1, 1, 1, 1, 1,
-0.3924039, 1.481347, 0.8154992, 1, 1, 1, 1, 1,
-0.3904028, 0.1042723, -0.00270471, 1, 1, 1, 1, 1,
-0.3898963, 0.8581491, -0.9586996, 1, 1, 1, 1, 1,
-0.3891762, -1.56902, -3.75834, 1, 1, 1, 1, 1,
-0.387169, -0.2424407, -2.423424, 1, 1, 1, 1, 1,
-0.386991, -1.793523, -2.74046, 0, 0, 1, 1, 1,
-0.3862571, -1.044285, -3.463703, 1, 0, 0, 1, 1,
-0.3856691, 2.248456, -0.6041968, 1, 0, 0, 1, 1,
-0.3835589, 0.06079495, -1.516554, 1, 0, 0, 1, 1,
-0.3804643, 2.42387, 0.9903125, 1, 0, 0, 1, 1,
-0.3771693, 0.8347939, -1.071461, 1, 0, 0, 1, 1,
-0.3724097, -1.851994, -3.268501, 0, 0, 0, 1, 1,
-0.3706332, -1.722979, -2.854658, 0, 0, 0, 1, 1,
-0.3699529, 0.1514484, -0.9877154, 0, 0, 0, 1, 1,
-0.3681216, -0.3062885, -2.356744, 0, 0, 0, 1, 1,
-0.3673161, 0.4291129, -0.6643175, 0, 0, 0, 1, 1,
-0.3654867, 1.195055, -0.1040025, 0, 0, 0, 1, 1,
-0.3650199, -0.7142326, -2.093971, 0, 0, 0, 1, 1,
-0.3630091, 0.7778655, 0.06120376, 1, 1, 1, 1, 1,
-0.3595732, -2.82196, -3.261206, 1, 1, 1, 1, 1,
-0.3590683, 0.9560469, 0.1951663, 1, 1, 1, 1, 1,
-0.3561392, -0.5481922, -2.443289, 1, 1, 1, 1, 1,
-0.3559516, -0.2184464, -0.5715479, 1, 1, 1, 1, 1,
-0.3555359, -1.977501, -3.528363, 1, 1, 1, 1, 1,
-0.3527196, -0.6055849, -1.320101, 1, 1, 1, 1, 1,
-0.3451863, -0.7418077, -2.923694, 1, 1, 1, 1, 1,
-0.3358179, 1.857483, 0.004345631, 1, 1, 1, 1, 1,
-0.3347138, -0.1444712, -1.033576, 1, 1, 1, 1, 1,
-0.3329976, -0.3254462, -3.402546, 1, 1, 1, 1, 1,
-0.3312683, -0.1359252, 0.2115481, 1, 1, 1, 1, 1,
-0.3267322, 0.7741013, -0.5990884, 1, 1, 1, 1, 1,
-0.3209147, -0.143614, -0.950202, 1, 1, 1, 1, 1,
-0.3205501, 1.182369, -1.145089, 1, 1, 1, 1, 1,
-0.3144439, 1.195995, -2.422665, 0, 0, 1, 1, 1,
-0.312954, 0.03859595, -1.179799, 1, 0, 0, 1, 1,
-0.3051096, 1.331379, 0.05079904, 1, 0, 0, 1, 1,
-0.30038, -1.889552, -2.700553, 1, 0, 0, 1, 1,
-0.3000389, -0.08542878, -1.943112, 1, 0, 0, 1, 1,
-0.2993765, -0.5111865, -2.524353, 1, 0, 0, 1, 1,
-0.299121, -0.971632, -2.711884, 0, 0, 0, 1, 1,
-0.2971062, -2.265602, -1.484048, 0, 0, 0, 1, 1,
-0.2955942, -0.1004748, -1.915355, 0, 0, 0, 1, 1,
-0.2945015, 0.9510872, -1.875216, 0, 0, 0, 1, 1,
-0.2836096, 0.68971, -0.8421761, 0, 0, 0, 1, 1,
-0.2822241, -0.4691898, -2.084531, 0, 0, 0, 1, 1,
-0.2817209, -2.23363, -2.722379, 0, 0, 0, 1, 1,
-0.2752776, 3.705008, -0.2140467, 1, 1, 1, 1, 1,
-0.2729995, -0.5401263, -4.333439, 1, 1, 1, 1, 1,
-0.2696725, 0.7320347, 0.3219098, 1, 1, 1, 1, 1,
-0.2665704, -0.5326929, -2.949533, 1, 1, 1, 1, 1,
-0.2665586, -0.03657467, -3.234687, 1, 1, 1, 1, 1,
-0.258897, 0.5468138, 0.1313667, 1, 1, 1, 1, 1,
-0.2564706, -0.4515904, -2.208169, 1, 1, 1, 1, 1,
-0.2557519, 0.3247937, 0.3567213, 1, 1, 1, 1, 1,
-0.2507608, -0.6943243, -3.412824, 1, 1, 1, 1, 1,
-0.2466968, 0.9432874, -0.1357541, 1, 1, 1, 1, 1,
-0.2436357, 1.501126, 0.4647393, 1, 1, 1, 1, 1,
-0.2372339, 0.06106458, -0.9905953, 1, 1, 1, 1, 1,
-0.2372065, 0.6933573, -0.08239536, 1, 1, 1, 1, 1,
-0.2292685, 1.074442, 0.7282003, 1, 1, 1, 1, 1,
-0.227932, -1.38027, -2.579602, 1, 1, 1, 1, 1,
-0.2263205, -0.05257832, -3.155771, 0, 0, 1, 1, 1,
-0.2243233, -0.4031914, -4.064633, 1, 0, 0, 1, 1,
-0.2230884, 0.785543, -0.3774232, 1, 0, 0, 1, 1,
-0.2212612, 0.7627299, 0.4865701, 1, 0, 0, 1, 1,
-0.2210448, -1.732262, -4.520179, 1, 0, 0, 1, 1,
-0.2179824, 0.1880832, -0.002383492, 1, 0, 0, 1, 1,
-0.214613, 0.2093748, 0.1416875, 0, 0, 0, 1, 1,
-0.2141108, -0.585059, -2.10299, 0, 0, 0, 1, 1,
-0.212256, -0.1863677, -1.759781, 0, 0, 0, 1, 1,
-0.2066902, 0.8640423, 1.856453, 0, 0, 0, 1, 1,
-0.2063521, -1.150927, -4.261696, 0, 0, 0, 1, 1,
-0.2040593, 0.3126817, -0.8451297, 0, 0, 0, 1, 1,
-0.2033225, 0.04581112, -0.4325984, 0, 0, 0, 1, 1,
-0.200977, -0.9173213, -3.039816, 1, 1, 1, 1, 1,
-0.1967185, 1.138643, -0.4891816, 1, 1, 1, 1, 1,
-0.1947444, 0.04093281, -2.511862, 1, 1, 1, 1, 1,
-0.1937048, 0.08207414, -0.5971155, 1, 1, 1, 1, 1,
-0.1916378, 0.6614217, 0.699596, 1, 1, 1, 1, 1,
-0.1915909, -1.358511, -3.722292, 1, 1, 1, 1, 1,
-0.1828677, -1.146287, -3.775172, 1, 1, 1, 1, 1,
-0.1824679, -0.003949027, -2.717557, 1, 1, 1, 1, 1,
-0.1811033, 1.071744, -1.923916, 1, 1, 1, 1, 1,
-0.1804661, -0.1463686, -3.205677, 1, 1, 1, 1, 1,
-0.1801099, -1.489128, -3.433422, 1, 1, 1, 1, 1,
-0.1793988, 0.3144076, -0.1913576, 1, 1, 1, 1, 1,
-0.1774208, 0.6645541, 0.1089492, 1, 1, 1, 1, 1,
-0.1749305, 1.625989, 1.128543, 1, 1, 1, 1, 1,
-0.1666876, 1.021626, 0.1019342, 1, 1, 1, 1, 1,
-0.1641647, -0.8324171, -2.823756, 0, 0, 1, 1, 1,
-0.1613724, 1.178079, -0.2677559, 1, 0, 0, 1, 1,
-0.160444, 2.005455, 0.4376112, 1, 0, 0, 1, 1,
-0.1602815, 0.4211386, 0.08759505, 1, 0, 0, 1, 1,
-0.1602172, -1.424866, -1.782089, 1, 0, 0, 1, 1,
-0.1598081, 0.7427391, -1.14889, 1, 0, 0, 1, 1,
-0.1594174, -1.554613, -2.198826, 0, 0, 0, 1, 1,
-0.1560897, 0.7241127, -1.831896, 0, 0, 0, 1, 1,
-0.1558675, 1.862277, 1.140167, 0, 0, 0, 1, 1,
-0.1522794, 0.8913046, -0.1777238, 0, 0, 0, 1, 1,
-0.1509676, 0.4561977, -0.1819029, 0, 0, 0, 1, 1,
-0.150687, -0.9968646, -3.468031, 0, 0, 0, 1, 1,
-0.1438428, -0.6091688, -5.165456, 0, 0, 0, 1, 1,
-0.1330844, -0.1945959, -2.044581, 1, 1, 1, 1, 1,
-0.1325009, -0.5491065, -4.658754, 1, 1, 1, 1, 1,
-0.1321872, -0.5329758, -2.093779, 1, 1, 1, 1, 1,
-0.131268, 1.483755, -0.562585, 1, 1, 1, 1, 1,
-0.1306233, -0.4927159, -2.220166, 1, 1, 1, 1, 1,
-0.1293786, -0.2131438, -2.48525, 1, 1, 1, 1, 1,
-0.1261757, -1.289509, -3.903277, 1, 1, 1, 1, 1,
-0.1214067, 1.021525, 0.2582392, 1, 1, 1, 1, 1,
-0.1180673, -0.486096, -3.159765, 1, 1, 1, 1, 1,
-0.1173954, 0.2318812, -1.785281, 1, 1, 1, 1, 1,
-0.1160328, 0.3498925, -0.388677, 1, 1, 1, 1, 1,
-0.1143434, 0.3776631, 0.290778, 1, 1, 1, 1, 1,
-0.1143376, -1.16542, -2.621824, 1, 1, 1, 1, 1,
-0.113272, -1.744968, -3.192058, 1, 1, 1, 1, 1,
-0.113258, 0.5569018, -2.53475, 1, 1, 1, 1, 1,
-0.1110448, 0.4116544, -1.870868, 0, 0, 1, 1, 1,
-0.110535, -0.1775432, -2.397413, 1, 0, 0, 1, 1,
-0.1083531, 0.5068933, -0.2571019, 1, 0, 0, 1, 1,
-0.1076724, -2.292551, -3.38351, 1, 0, 0, 1, 1,
-0.1049161, -0.111688, -1.222735, 1, 0, 0, 1, 1,
-0.1026947, -0.4766584, -3.524774, 1, 0, 0, 1, 1,
-0.1017395, 0.04758427, 0.3872051, 0, 0, 0, 1, 1,
-0.09207424, 1.157148, 1.626708, 0, 0, 0, 1, 1,
-0.08236458, -1.49978, -4.746572, 0, 0, 0, 1, 1,
-0.08137871, 0.3398617, -1.165793, 0, 0, 0, 1, 1,
-0.08020735, 0.4183504, 1.144268, 0, 0, 0, 1, 1,
-0.07870724, -0.6569884, -3.435093, 0, 0, 0, 1, 1,
-0.07369761, -2.071666, -2.777354, 0, 0, 0, 1, 1,
-0.07357897, 0.3622666, 0.240434, 1, 1, 1, 1, 1,
-0.0730551, -1.75668, -5.537072, 1, 1, 1, 1, 1,
-0.06937527, -0.3802996, -3.6251, 1, 1, 1, 1, 1,
-0.06640883, -0.2636166, -1.159825, 1, 1, 1, 1, 1,
-0.06105106, -0.3036208, -3.254834, 1, 1, 1, 1, 1,
-0.06078649, -1.581824, -5.038316, 1, 1, 1, 1, 1,
-0.0597378, 0.742444, 0.6531187, 1, 1, 1, 1, 1,
-0.05942361, 1.440547, 0.7306352, 1, 1, 1, 1, 1,
-0.05763567, 1.076753, -1.049573, 1, 1, 1, 1, 1,
-0.05428376, -0.7114779, -3.113193, 1, 1, 1, 1, 1,
-0.05419468, -0.7727094, -2.620881, 1, 1, 1, 1, 1,
-0.05145926, 0.4783662, 0.3926244, 1, 1, 1, 1, 1,
-0.04822711, -1.517562, -4.066429, 1, 1, 1, 1, 1,
-0.04613557, -0.7171379, -5.478314, 1, 1, 1, 1, 1,
-0.03886757, -0.8553467, -1.936096, 1, 1, 1, 1, 1,
-0.03365962, -1.257779, -3.971328, 0, 0, 1, 1, 1,
-0.03235706, 0.258978, 0.3009175, 1, 0, 0, 1, 1,
-0.02633244, -0.965242, -2.841242, 1, 0, 0, 1, 1,
-0.01045592, 0.08620119, -0.5466939, 1, 0, 0, 1, 1,
-0.01043181, -0.8895797, -3.894241, 1, 0, 0, 1, 1,
-0.01037907, -0.9841784, -1.929843, 1, 0, 0, 1, 1,
-0.01031919, -2.049314, -4.461537, 0, 0, 0, 1, 1,
-0.008873292, 1.394624, 0.4320701, 0, 0, 0, 1, 1,
-0.008141696, 0.7337173, 0.6017584, 0, 0, 0, 1, 1,
-0.007801629, -0.7197627, -3.047802, 0, 0, 0, 1, 1,
0.002755962, -0.1664371, 1.871608, 0, 0, 0, 1, 1,
0.006083917, 0.9817198, -0.06945328, 0, 0, 0, 1, 1,
0.00778351, -0.4831426, 2.136244, 0, 0, 0, 1, 1,
0.0141968, -0.336629, 1.836584, 1, 1, 1, 1, 1,
0.01542053, -0.6860854, 1.882306, 1, 1, 1, 1, 1,
0.02153457, 0.7622052, -1.107641, 1, 1, 1, 1, 1,
0.02433784, 0.4821378, -0.5963857, 1, 1, 1, 1, 1,
0.02492899, -0.8542975, 3.001343, 1, 1, 1, 1, 1,
0.02528176, 0.3052035, 2.33624, 1, 1, 1, 1, 1,
0.02635353, 1.513184, -0.006487565, 1, 1, 1, 1, 1,
0.02752468, -0.6425271, 1.967969, 1, 1, 1, 1, 1,
0.02832433, -1.034541, 2.278647, 1, 1, 1, 1, 1,
0.0284319, -0.5305097, 2.465763, 1, 1, 1, 1, 1,
0.02970678, 0.6046295, 1.565493, 1, 1, 1, 1, 1,
0.03371199, -0.1081848, 2.868685, 1, 1, 1, 1, 1,
0.03520336, 0.745716, -0.3194264, 1, 1, 1, 1, 1,
0.03859208, 0.9571164, -2.13312, 1, 1, 1, 1, 1,
0.04240523, 0.1598255, 1.117018, 1, 1, 1, 1, 1,
0.04714327, -0.6951198, 1.766848, 0, 0, 1, 1, 1,
0.05080821, -0.4524, 3.938987, 1, 0, 0, 1, 1,
0.05121363, 1.748736, -1.327279, 1, 0, 0, 1, 1,
0.05624871, 0.3238004, 1.369006, 1, 0, 0, 1, 1,
0.05893046, 0.8674994, -0.9969927, 1, 0, 0, 1, 1,
0.05907955, -0.4371174, 3.246921, 1, 0, 0, 1, 1,
0.05971907, -1.692212, 2.680325, 0, 0, 0, 1, 1,
0.06515644, 0.8561345, 1.537286, 0, 0, 0, 1, 1,
0.06777034, -0.3491999, 4.917706, 0, 0, 0, 1, 1,
0.06984002, -0.115592, 2.58283, 0, 0, 0, 1, 1,
0.07045117, 1.022542, 0.7593701, 0, 0, 0, 1, 1,
0.07146809, -0.9272159, 3.661844, 0, 0, 0, 1, 1,
0.07932472, -0.2247269, 1.388888, 0, 0, 0, 1, 1,
0.08213149, 0.4142186, -1.173523, 1, 1, 1, 1, 1,
0.08471263, -1.030648, 3.519999, 1, 1, 1, 1, 1,
0.08826745, -0.1894372, 2.422417, 1, 1, 1, 1, 1,
0.09074245, 0.08807397, -1.538799, 1, 1, 1, 1, 1,
0.09443244, -0.6180612, 3.930011, 1, 1, 1, 1, 1,
0.0945876, -0.2459449, 2.693257, 1, 1, 1, 1, 1,
0.0985933, -0.4373736, 2.931607, 1, 1, 1, 1, 1,
0.09922475, 0.3425727, 2.852289, 1, 1, 1, 1, 1,
0.1024859, -0.3618144, 3.854174, 1, 1, 1, 1, 1,
0.1062384, -0.1063336, 2.863902, 1, 1, 1, 1, 1,
0.1082137, -0.22329, 3.432515, 1, 1, 1, 1, 1,
0.1097291, -0.2899017, 2.177032, 1, 1, 1, 1, 1,
0.1113367, -1.1278, 3.033392, 1, 1, 1, 1, 1,
0.1135817, -0.2234408, 2.766761, 1, 1, 1, 1, 1,
0.1136251, 1.510202, -0.2772963, 1, 1, 1, 1, 1,
0.1151013, -0.7296509, 2.011801, 0, 0, 1, 1, 1,
0.1168685, 0.5616667, -0.8885511, 1, 0, 0, 1, 1,
0.1240734, 0.6512364, 0.3296709, 1, 0, 0, 1, 1,
0.1241525, 2.130837, 1.132057, 1, 0, 0, 1, 1,
0.1271449, 0.3382425, 1.975024, 1, 0, 0, 1, 1,
0.1276202, 0.9824051, 0.03207592, 1, 0, 0, 1, 1,
0.128338, 0.9768414, 0.1907279, 0, 0, 0, 1, 1,
0.1283632, 0.7426867, 0.9175667, 0, 0, 0, 1, 1,
0.1291606, -0.510303, 3.984305, 0, 0, 0, 1, 1,
0.1298647, -0.2436734, 2.431811, 0, 0, 0, 1, 1,
0.1323627, 0.8016175, 0.04989211, 0, 0, 0, 1, 1,
0.134341, 0.03623322, 2.007388, 0, 0, 0, 1, 1,
0.1359697, 0.5291745, -2.249311, 0, 0, 0, 1, 1,
0.1385474, -0.440243, 3.058133, 1, 1, 1, 1, 1,
0.1386417, -0.227577, 3.394097, 1, 1, 1, 1, 1,
0.1396772, -0.1631534, 0.8014672, 1, 1, 1, 1, 1,
0.140381, 0.0543387, 1.103456, 1, 1, 1, 1, 1,
0.1452129, 0.02102075, 1.010366, 1, 1, 1, 1, 1,
0.1468441, 1.346503, 2.448869, 1, 1, 1, 1, 1,
0.1488039, -0.6795772, 1.913855, 1, 1, 1, 1, 1,
0.1509265, 0.3350011, 1.10595, 1, 1, 1, 1, 1,
0.1519632, -0.1015478, 4.517861, 1, 1, 1, 1, 1,
0.1528251, 1.019421, -0.1372696, 1, 1, 1, 1, 1,
0.1544236, 0.1583686, 1.115998, 1, 1, 1, 1, 1,
0.1556525, -1.015232, 2.641062, 1, 1, 1, 1, 1,
0.1568378, -0.2654017, 3.518654, 1, 1, 1, 1, 1,
0.1570599, 0.8841283, -0.9979831, 1, 1, 1, 1, 1,
0.1583435, -0.1856598, 2.406393, 1, 1, 1, 1, 1,
0.1609823, -0.6665052, 4.549526, 0, 0, 1, 1, 1,
0.166555, -0.5381036, 2.103515, 1, 0, 0, 1, 1,
0.1715066, 1.685818, 0.0735656, 1, 0, 0, 1, 1,
0.1745306, -0.5208054, 2.692392, 1, 0, 0, 1, 1,
0.1790623, 0.003365739, 2.146042, 1, 0, 0, 1, 1,
0.1803529, 0.7054399, -0.9423283, 1, 0, 0, 1, 1,
0.1812076, 1.020788, 2.393427, 0, 0, 0, 1, 1,
0.1825178, 1.213246, 0.2073731, 0, 0, 0, 1, 1,
0.1855721, -0.9998967, 3.341894, 0, 0, 0, 1, 1,
0.1870649, -0.3734017, 3.535759, 0, 0, 0, 1, 1,
0.1909187, 0.03436482, 0.9342521, 0, 0, 0, 1, 1,
0.1929151, 0.8834722, -0.1444734, 0, 0, 0, 1, 1,
0.1966999, -0.01039689, 1.460261, 0, 0, 0, 1, 1,
0.1984407, -0.6510369, 1.864231, 1, 1, 1, 1, 1,
0.2037529, -0.968653, 3.233768, 1, 1, 1, 1, 1,
0.2069542, -1.103513, 4.551842, 1, 1, 1, 1, 1,
0.2071324, 0.7486317, 0.5919886, 1, 1, 1, 1, 1,
0.2072338, 1.200971, -0.1532241, 1, 1, 1, 1, 1,
0.2080227, 0.5070792, 1.039498, 1, 1, 1, 1, 1,
0.2082836, 1.898103, 0.3939973, 1, 1, 1, 1, 1,
0.2144576, 0.1374614, 0.7111531, 1, 1, 1, 1, 1,
0.2154083, -0.1738974, 2.418658, 1, 1, 1, 1, 1,
0.2158006, -0.820608, 2.617738, 1, 1, 1, 1, 1,
0.2163455, -0.3232661, 3.312995, 1, 1, 1, 1, 1,
0.2188596, -0.4000348, 3.634582, 1, 1, 1, 1, 1,
0.2217366, -0.341932, 3.456122, 1, 1, 1, 1, 1,
0.2234684, -1.079341, 3.46176, 1, 1, 1, 1, 1,
0.226788, -0.1985105, 2.752262, 1, 1, 1, 1, 1,
0.2329216, -0.541464, 2.132455, 0, 0, 1, 1, 1,
0.2331185, 0.1860284, 2.627669, 1, 0, 0, 1, 1,
0.2335095, -0.0236016, 1.229284, 1, 0, 0, 1, 1,
0.2375368, -0.5147529, 3.088459, 1, 0, 0, 1, 1,
0.2383811, 0.6403137, -0.5885409, 1, 0, 0, 1, 1,
0.2458917, -0.3123549, 0.8299301, 1, 0, 0, 1, 1,
0.246818, 0.02201723, 1.58348, 0, 0, 0, 1, 1,
0.250883, 0.2628616, 0.1145018, 0, 0, 0, 1, 1,
0.2539999, -2.236688, 2.390901, 0, 0, 0, 1, 1,
0.2547125, 0.1444463, 1.742023, 0, 0, 0, 1, 1,
0.2562642, 1.594372, -0.7698563, 0, 0, 0, 1, 1,
0.2562776, 0.7846826, 0.2778024, 0, 0, 0, 1, 1,
0.2577954, -1.021874, 3.693186, 0, 0, 0, 1, 1,
0.2611958, 2.731861, -0.9033908, 1, 1, 1, 1, 1,
0.2637407, 0.899105, 0.4709398, 1, 1, 1, 1, 1,
0.2657889, 0.03982989, 2.841075, 1, 1, 1, 1, 1,
0.2664829, 2.053785, -0.1541497, 1, 1, 1, 1, 1,
0.2672448, -0.4759837, 2.168285, 1, 1, 1, 1, 1,
0.2703442, 1.157732, 1.695541, 1, 1, 1, 1, 1,
0.2735037, 1.543964, -0.001451969, 1, 1, 1, 1, 1,
0.2741609, -0.8967755, 1.886084, 1, 1, 1, 1, 1,
0.2814948, -0.08272521, -0.2785494, 1, 1, 1, 1, 1,
0.2838217, 0.1127223, 2.764883, 1, 1, 1, 1, 1,
0.2936565, -0.03130697, 0.6808122, 1, 1, 1, 1, 1,
0.2947295, 0.2275801, 1.219757, 1, 1, 1, 1, 1,
0.2948836, 1.014093, -0.2340503, 1, 1, 1, 1, 1,
0.302529, -0.4318796, 1.927603, 1, 1, 1, 1, 1,
0.3046824, -0.1475833, 2.723597, 1, 1, 1, 1, 1,
0.3084273, -1.568546, 3.915836, 0, 0, 1, 1, 1,
0.3126628, 1.625899, -1.103692, 1, 0, 0, 1, 1,
0.3143563, 1.055553, 0.4713033, 1, 0, 0, 1, 1,
0.3150766, 0.7698535, 0.8340322, 1, 0, 0, 1, 1,
0.3160824, -0.9275305, 3.301652, 1, 0, 0, 1, 1,
0.3182014, -1.184784, 2.579549, 1, 0, 0, 1, 1,
0.3194583, -0.203339, 3.338008, 0, 0, 0, 1, 1,
0.3213129, -0.4956986, 2.703206, 0, 0, 0, 1, 1,
0.3213184, -1.173926, 2.997001, 0, 0, 0, 1, 1,
0.3302491, -2.257324, 2.720619, 0, 0, 0, 1, 1,
0.3449353, -1.103563, 2.951422, 0, 0, 0, 1, 1,
0.3449557, -0.3242637, 2.399591, 0, 0, 0, 1, 1,
0.3482906, -1.011476, 1.904197, 0, 0, 0, 1, 1,
0.3502822, 2.033861, 0.131734, 1, 1, 1, 1, 1,
0.3546511, -0.9762465, 6.182991, 1, 1, 1, 1, 1,
0.3568032, -0.01759608, 2.474577, 1, 1, 1, 1, 1,
0.3588011, -1.473657, 3.349384, 1, 1, 1, 1, 1,
0.3629544, -1.180123, 3.85399, 1, 1, 1, 1, 1,
0.3635032, -1.487409, 4.426065, 1, 1, 1, 1, 1,
0.3635675, 1.284357, 0.4751145, 1, 1, 1, 1, 1,
0.3672172, -1.514684, 2.935154, 1, 1, 1, 1, 1,
0.371758, -0.1251255, 2.118684, 1, 1, 1, 1, 1,
0.3766025, -0.1237152, 3.893426, 1, 1, 1, 1, 1,
0.3783218, 1.151219, 0.3054644, 1, 1, 1, 1, 1,
0.3862861, 1.749714, 0.2241817, 1, 1, 1, 1, 1,
0.3903896, 1.311844, 0.352074, 1, 1, 1, 1, 1,
0.4003895, 0.003701326, 1.801443, 1, 1, 1, 1, 1,
0.4020355, 0.4588896, 1.193184, 1, 1, 1, 1, 1,
0.4023879, 0.8179503, -0.1135024, 0, 0, 1, 1, 1,
0.4052957, 0.1247649, 2.799469, 1, 0, 0, 1, 1,
0.407481, -0.8227238, 3.14094, 1, 0, 0, 1, 1,
0.414587, 0.8979474, 1.835194, 1, 0, 0, 1, 1,
0.4168347, -0.1167611, 1.765184, 1, 0, 0, 1, 1,
0.4173472, 0.3622817, 2.18298, 1, 0, 0, 1, 1,
0.4188967, 0.7510582, -1.036551, 0, 0, 0, 1, 1,
0.4270774, -1.182697, 2.063074, 0, 0, 0, 1, 1,
0.4274827, -0.02048819, -0.03964786, 0, 0, 0, 1, 1,
0.4277216, -0.8219526, 0.1266457, 0, 0, 0, 1, 1,
0.4352056, 1.566261, -0.1599399, 0, 0, 0, 1, 1,
0.4394314, -0.5675803, 1.709348, 0, 0, 0, 1, 1,
0.4441628, 0.5704111, 0.902539, 0, 0, 0, 1, 1,
0.4467849, 1.001358, -0.2930892, 1, 1, 1, 1, 1,
0.4471506, 1.087832, -0.3670756, 1, 1, 1, 1, 1,
0.4479576, 1.243384, -1.33754, 1, 1, 1, 1, 1,
0.4479956, -1.063618, 2.200716, 1, 1, 1, 1, 1,
0.4480107, 0.3549343, 1.368245, 1, 1, 1, 1, 1,
0.4488452, 0.2165531, 1.631417, 1, 1, 1, 1, 1,
0.4493695, 0.2985957, 1.95584, 1, 1, 1, 1, 1,
0.4581051, -1.634146, 3.550146, 1, 1, 1, 1, 1,
0.4591153, 1.569045, 0.8416352, 1, 1, 1, 1, 1,
0.45919, -0.4103371, 1.221541, 1, 1, 1, 1, 1,
0.4607978, -0.4043224, 1.90277, 1, 1, 1, 1, 1,
0.4658756, 0.8110065, 0.8390257, 1, 1, 1, 1, 1,
0.4713903, 2.397571, -0.8882792, 1, 1, 1, 1, 1,
0.4792031, 1.885818, 1.614362, 1, 1, 1, 1, 1,
0.4795537, -0.9914914, 1.817457, 1, 1, 1, 1, 1,
0.4799249, 0.6197331, 0.4490417, 0, 0, 1, 1, 1,
0.4805061, -0.04688489, -0.8459269, 1, 0, 0, 1, 1,
0.4808507, 0.0266145, 3.439952, 1, 0, 0, 1, 1,
0.4809353, -0.02903011, 2.609229, 1, 0, 0, 1, 1,
0.4821439, 1.733526, 1.463983, 1, 0, 0, 1, 1,
0.4880676, 0.6853091, 0.3465366, 1, 0, 0, 1, 1,
0.4885889, 0.02422041, 2.022981, 0, 0, 0, 1, 1,
0.4891254, -0.9530763, 3.316061, 0, 0, 0, 1, 1,
0.4912794, -0.3127074, 1.716941, 0, 0, 0, 1, 1,
0.4964177, -0.7363239, 3.653141, 0, 0, 0, 1, 1,
0.4968507, -1.595817, 2.1044, 0, 0, 0, 1, 1,
0.5002072, -1.232828, 1.4869, 0, 0, 0, 1, 1,
0.5025542, -0.3263928, 0.3841722, 0, 0, 0, 1, 1,
0.5101089, -1.938563, 3.886889, 1, 1, 1, 1, 1,
0.5101354, 0.02251025, 2.262958, 1, 1, 1, 1, 1,
0.5112093, 0.1994612, -0.149783, 1, 1, 1, 1, 1,
0.5142772, 0.8385616, 0.6184309, 1, 1, 1, 1, 1,
0.5175962, -0.587697, 2.148411, 1, 1, 1, 1, 1,
0.519015, 0.2381541, 1.738202, 1, 1, 1, 1, 1,
0.5208125, 2.675809, -0.4049399, 1, 1, 1, 1, 1,
0.5209236, 0.6916072, 2.31974, 1, 1, 1, 1, 1,
0.5223569, -1.80029, 3.091693, 1, 1, 1, 1, 1,
0.5316093, -1.345077, 3.45058, 1, 1, 1, 1, 1,
0.5333195, 0.4830343, 2.323622, 1, 1, 1, 1, 1,
0.5352132, 0.2407438, 1.619006, 1, 1, 1, 1, 1,
0.5356079, -1.009255, 1.283578, 1, 1, 1, 1, 1,
0.5383001, 0.3734305, -0.6229613, 1, 1, 1, 1, 1,
0.5396015, 1.677892, 1.076738, 1, 1, 1, 1, 1,
0.5401714, 1.938888, 0.3564143, 0, 0, 1, 1, 1,
0.5411543, 1.74526, 1.951292, 1, 0, 0, 1, 1,
0.5414486, 1.331217, -1.204885, 1, 0, 0, 1, 1,
0.5433313, 1.2273, 0.2514045, 1, 0, 0, 1, 1,
0.5503889, 0.6616329, 0.7583244, 1, 0, 0, 1, 1,
0.5520777, -0.8415391, 1.126624, 1, 0, 0, 1, 1,
0.554844, -0.9428346, 2.570356, 0, 0, 0, 1, 1,
0.5554709, 1.080254, 1.848288, 0, 0, 0, 1, 1,
0.5555572, 1.296897, 0.4293518, 0, 0, 0, 1, 1,
0.5581293, 0.8654374, 2.206025, 0, 0, 0, 1, 1,
0.5581957, 0.373175, 0.3661849, 0, 0, 0, 1, 1,
0.5609989, -0.220332, 2.573452, 0, 0, 0, 1, 1,
0.56232, -0.5508698, 1.282143, 0, 0, 0, 1, 1,
0.5627022, -1.620314, 3.680913, 1, 1, 1, 1, 1,
0.5652058, -0.110454, 2.624911, 1, 1, 1, 1, 1,
0.5674174, 0.5371002, 0.9885933, 1, 1, 1, 1, 1,
0.5701545, 1.602448, -0.380502, 1, 1, 1, 1, 1,
0.570868, -0.2071543, 1.06552, 1, 1, 1, 1, 1,
0.5713817, 0.9902101, 0.2350015, 1, 1, 1, 1, 1,
0.5743102, 1.352525, 0.4946595, 1, 1, 1, 1, 1,
0.5758417, -1.652549, 3.843521, 1, 1, 1, 1, 1,
0.575855, 1.210611, 0.005638659, 1, 1, 1, 1, 1,
0.5764853, -1.069439, 3.597808, 1, 1, 1, 1, 1,
0.5769575, -1.49, 1.002876, 1, 1, 1, 1, 1,
0.5781227, 1.447976, -0.2221387, 1, 1, 1, 1, 1,
0.5828777, 2.505972, -0.0203355, 1, 1, 1, 1, 1,
0.5831395, 1.023191, 1.83955, 1, 1, 1, 1, 1,
0.5941619, -0.7553545, 3.047548, 1, 1, 1, 1, 1,
0.5954098, -1.337401, 2.546309, 0, 0, 1, 1, 1,
0.5986201, 0.9385099, 0.5625317, 1, 0, 0, 1, 1,
0.6023176, -0.7351529, 2.101403, 1, 0, 0, 1, 1,
0.6097128, -0.1896172, 2.223522, 1, 0, 0, 1, 1,
0.6097159, -0.8425227, 1.902735, 1, 0, 0, 1, 1,
0.609903, 2.297374, 0.6270946, 1, 0, 0, 1, 1,
0.6120632, -1.262723, 2.9876, 0, 0, 0, 1, 1,
0.6142578, -0.3981094, 3.198208, 0, 0, 0, 1, 1,
0.6168195, 0.3618771, 0.6324194, 0, 0, 0, 1, 1,
0.6241286, 0.4324578, 0.8593902, 0, 0, 0, 1, 1,
0.625824, -0.295074, 1.436513, 0, 0, 0, 1, 1,
0.626821, 0.2211116, 0.9804082, 0, 0, 0, 1, 1,
0.6274292, 1.09754, -0.6357211, 0, 0, 0, 1, 1,
0.629838, -0.3621927, 1.659703, 1, 1, 1, 1, 1,
0.6308123, -1.520115, 2.866227, 1, 1, 1, 1, 1,
0.6359059, 0.2310907, 1.413906, 1, 1, 1, 1, 1,
0.6402963, -1.053125, 1.673711, 1, 1, 1, 1, 1,
0.6467879, -0.1849841, 2.471002, 1, 1, 1, 1, 1,
0.6471847, 0.4963659, 1.273676, 1, 1, 1, 1, 1,
0.6486938, -0.5879856, 1.18993, 1, 1, 1, 1, 1,
0.6487611, 1.263296, -0.7309138, 1, 1, 1, 1, 1,
0.6487634, -0.5066829, 1.385495, 1, 1, 1, 1, 1,
0.6522352, -0.7751105, 0.9787113, 1, 1, 1, 1, 1,
0.652352, -0.391668, 2.436411, 1, 1, 1, 1, 1,
0.6531606, -0.237226, 1.651627, 1, 1, 1, 1, 1,
0.6563382, 0.7063923, 1.441273, 1, 1, 1, 1, 1,
0.6575943, 0.5164568, 0.6233816, 1, 1, 1, 1, 1,
0.657771, -0.6157657, 3.467432, 1, 1, 1, 1, 1,
0.6645813, -1.170702, 3.347134, 0, 0, 1, 1, 1,
0.6685181, -0.4239268, 3.642425, 1, 0, 0, 1, 1,
0.6689296, -1.335695, 1.382465, 1, 0, 0, 1, 1,
0.6704525, -0.3488737, 3.033732, 1, 0, 0, 1, 1,
0.6759831, 0.1729784, 1.063096, 1, 0, 0, 1, 1,
0.6780079, 0.3270633, 0.8194174, 1, 0, 0, 1, 1,
0.6791632, 1.452546, 0.2877929, 0, 0, 0, 1, 1,
0.6794978, 1.423188, -0.2122232, 0, 0, 0, 1, 1,
0.6818263, -2.091888, 2.432893, 0, 0, 0, 1, 1,
0.6842219, -1.613511, 3.753778, 0, 0, 0, 1, 1,
0.6890708, 1.562814, 1.036927, 0, 0, 0, 1, 1,
0.6922345, -1.406436, 4.79181, 0, 0, 0, 1, 1,
0.6928604, -0.7490127, 2.174963, 0, 0, 0, 1, 1,
0.7017785, 0.01077063, 1.328553, 1, 1, 1, 1, 1,
0.7026308, -0.383288, 3.211324, 1, 1, 1, 1, 1,
0.7026592, 0.7648398, 2.069893, 1, 1, 1, 1, 1,
0.707828, -0.2446286, 2.998807, 1, 1, 1, 1, 1,
0.712388, -1.999451, 3.073016, 1, 1, 1, 1, 1,
0.7130942, 1.363705, 1.708233, 1, 1, 1, 1, 1,
0.72574, 0.8692199, 1.072907, 1, 1, 1, 1, 1,
0.7264078, -0.9370691, 3.626195, 1, 1, 1, 1, 1,
0.7268898, -2.659598, 1.376857, 1, 1, 1, 1, 1,
0.7303671, 0.2897356, 1.211922, 1, 1, 1, 1, 1,
0.7307168, 1.221029, -0.2575203, 1, 1, 1, 1, 1,
0.7308461, -2.182511, 2.043353, 1, 1, 1, 1, 1,
0.7361168, 0.3767335, 0.5466969, 1, 1, 1, 1, 1,
0.7371486, -1.620172, 2.693574, 1, 1, 1, 1, 1,
0.7374976, 0.242037, 0.6859802, 1, 1, 1, 1, 1,
0.7402462, 1.008762, 1.712001, 0, 0, 1, 1, 1,
0.7413548, -0.3652613, 0.08520228, 1, 0, 0, 1, 1,
0.7420698, -1.678248, 2.796153, 1, 0, 0, 1, 1,
0.7477511, -1.189912, 3.95654, 1, 0, 0, 1, 1,
0.752372, -1.284458, 3.09734, 1, 0, 0, 1, 1,
0.7531174, 1.52838, 0.230909, 1, 0, 0, 1, 1,
0.7533307, 0.7047519, -1.377077, 0, 0, 0, 1, 1,
0.7567312, 1.757704, 0.1033542, 0, 0, 0, 1, 1,
0.7578754, -1.510625, 1.136928, 0, 0, 0, 1, 1,
0.7580839, -1.932899, 2.249281, 0, 0, 0, 1, 1,
0.7677976, 0.1915974, 1.06422, 0, 0, 0, 1, 1,
0.7691152, 0.3487965, 2.114831, 0, 0, 0, 1, 1,
0.7746297, -0.5648829, 4.065526, 0, 0, 0, 1, 1,
0.7763159, 0.379292, 1.119453, 1, 1, 1, 1, 1,
0.7833196, -0.3948348, 3.948106, 1, 1, 1, 1, 1,
0.7840536, -1.346246, 1.883817, 1, 1, 1, 1, 1,
0.794952, 0.03058303, 2.552135, 1, 1, 1, 1, 1,
0.7976188, -0.005450871, 2.288537, 1, 1, 1, 1, 1,
0.8109713, 1.591486, 0.5849089, 1, 1, 1, 1, 1,
0.8151186, 0.7916683, -1.767426, 1, 1, 1, 1, 1,
0.8155674, 1.351995, 1.707966, 1, 1, 1, 1, 1,
0.8254038, 1.230273, 1.558047, 1, 1, 1, 1, 1,
0.8264411, 1.672482, -0.3864951, 1, 1, 1, 1, 1,
0.8325223, -0.06785467, 1.167115, 1, 1, 1, 1, 1,
0.8341899, 0.05553908, 2.289884, 1, 1, 1, 1, 1,
0.8366632, 0.988072, 0.3779578, 1, 1, 1, 1, 1,
0.8381162, -0.5921128, 1.355743, 1, 1, 1, 1, 1,
0.838878, -0.1246511, 3.845886, 1, 1, 1, 1, 1,
0.8393618, 0.03991574, 0.626548, 0, 0, 1, 1, 1,
0.8436962, 0.3514232, 1.003335, 1, 0, 0, 1, 1,
0.8451179, -0.6905913, 3.582598, 1, 0, 0, 1, 1,
0.8544541, 0.08339023, 1.95304, 1, 0, 0, 1, 1,
0.8562629, -2.088457, 2.478507, 1, 0, 0, 1, 1,
0.8602021, 0.3647729, 1.260829, 1, 0, 0, 1, 1,
0.8613944, 2.016227, 0.6892823, 0, 0, 0, 1, 1,
0.8664364, 1.835365, 1.07313, 0, 0, 0, 1, 1,
0.8680277, 0.2103861, 0.5401192, 0, 0, 0, 1, 1,
0.8698382, 0.03083179, 2.445947, 0, 0, 0, 1, 1,
0.8716513, -0.8738806, 2.182589, 0, 0, 0, 1, 1,
0.8825471, -1.002755, 2.521285, 0, 0, 0, 1, 1,
0.8856705, 1.939146, 0.7533001, 0, 0, 0, 1, 1,
0.8913692, 0.5021446, 0.6468167, 1, 1, 1, 1, 1,
0.8964332, -0.773406, 2.139301, 1, 1, 1, 1, 1,
0.9032563, 1.423286, 0.3867149, 1, 1, 1, 1, 1,
0.9037655, -0.3945516, 3.122993, 1, 1, 1, 1, 1,
0.9071571, -0.8687527, 3.946443, 1, 1, 1, 1, 1,
0.9079087, 0.3772069, 3.252574, 1, 1, 1, 1, 1,
0.9085575, -0.9428512, 3.062806, 1, 1, 1, 1, 1,
0.9148566, -0.3643717, 2.94547, 1, 1, 1, 1, 1,
0.9193664, -0.9695704, 2.449536, 1, 1, 1, 1, 1,
0.9268393, 2.2095, -0.3389256, 1, 1, 1, 1, 1,
0.9268643, -0.7881925, 1.27322, 1, 1, 1, 1, 1,
0.9287242, -0.006866989, 1.701057, 1, 1, 1, 1, 1,
0.9289836, 0.9819031, 0.5493563, 1, 1, 1, 1, 1,
0.9315296, -0.1617598, 0.4148677, 1, 1, 1, 1, 1,
0.9315343, -2.079596, 3.640728, 1, 1, 1, 1, 1,
0.9334665, 1.186062, 1.227605, 0, 0, 1, 1, 1,
0.9338144, -0.1730026, 0.464639, 1, 0, 0, 1, 1,
0.9385763, 1.66186, -0.8933495, 1, 0, 0, 1, 1,
0.9387462, 0.4522954, 0.3207801, 1, 0, 0, 1, 1,
0.9389991, -0.398309, 4.405695, 1, 0, 0, 1, 1,
0.9407465, 0.7911438, 0.5522587, 1, 0, 0, 1, 1,
0.943277, 0.6531516, 0.1983243, 0, 0, 0, 1, 1,
0.9597145, 1.052148, 2.739731, 0, 0, 0, 1, 1,
0.9711602, -0.7288754, 1.580534, 0, 0, 0, 1, 1,
0.9735333, -1.518956, 2.252871, 0, 0, 0, 1, 1,
0.9737254, -2.121037, 3.878259, 0, 0, 0, 1, 1,
0.9741254, -1.493235, 2.87181, 0, 0, 0, 1, 1,
0.9769543, -0.01837591, 1.318317, 0, 0, 0, 1, 1,
0.9786259, -0.109139, 0.1984629, 1, 1, 1, 1, 1,
0.9792314, -0.3840588, 2.556641, 1, 1, 1, 1, 1,
0.9820931, -0.8849323, 2.198344, 1, 1, 1, 1, 1,
0.9881079, -0.218546, -0.4483956, 1, 1, 1, 1, 1,
0.9946481, 1.667613, -0.3432855, 1, 1, 1, 1, 1,
1.009339, -0.831358, 1.06333, 1, 1, 1, 1, 1,
1.010436, 0.003587552, 0.5774163, 1, 1, 1, 1, 1,
1.015368, -1.659845, 4.494273, 1, 1, 1, 1, 1,
1.017356, -0.3993968, 2.842798, 1, 1, 1, 1, 1,
1.01756, 0.3165532, 1.507522, 1, 1, 1, 1, 1,
1.022638, 0.6887711, 1.468467, 1, 1, 1, 1, 1,
1.027532, 0.1789756, 1.357196, 1, 1, 1, 1, 1,
1.030125, 0.3760339, 1.602122, 1, 1, 1, 1, 1,
1.039065, -1.181275, 1.86903, 1, 1, 1, 1, 1,
1.04995, 0.01392686, 0.3991369, 1, 1, 1, 1, 1,
1.05205, -1.337027, 4.013571, 0, 0, 1, 1, 1,
1.052811, 0.7349653, 2.212286, 1, 0, 0, 1, 1,
1.056011, 0.2320894, 0.2442214, 1, 0, 0, 1, 1,
1.069922, 0.9974687, 1.749643, 1, 0, 0, 1, 1,
1.0799, 0.1105894, 0.9007055, 1, 0, 0, 1, 1,
1.080227, 0.6931456, 1.717545, 1, 0, 0, 1, 1,
1.083663, 0.07047435, 0.5641112, 0, 0, 0, 1, 1,
1.090282, 0.1836742, 2.153744, 0, 0, 0, 1, 1,
1.092734, -0.5171096, 1.044285, 0, 0, 0, 1, 1,
1.09529, 1.364891, 0.1865836, 0, 0, 0, 1, 1,
1.096059, 0.6822531, 1.271736, 0, 0, 0, 1, 1,
1.100368, 2.649971, 1.33768, 0, 0, 0, 1, 1,
1.112079, -0.860633, 1.929833, 0, 0, 0, 1, 1,
1.116457, 0.3864047, -0.7293901, 1, 1, 1, 1, 1,
1.12097, 0.01446547, 0.9977207, 1, 1, 1, 1, 1,
1.124166, -0.6674033, 2.911986, 1, 1, 1, 1, 1,
1.128448, -0.7587477, 2.029517, 1, 1, 1, 1, 1,
1.131748, 0.02279655, 1.436925, 1, 1, 1, 1, 1,
1.132354, -0.9138976, 3.014374, 1, 1, 1, 1, 1,
1.14571, 0.126809, -0.2593997, 1, 1, 1, 1, 1,
1.148365, -0.05550543, 0.3022637, 1, 1, 1, 1, 1,
1.149979, 0.6372149, 1.552793, 1, 1, 1, 1, 1,
1.150322, 0.4192432, 1.910865, 1, 1, 1, 1, 1,
1.163725, -0.2068352, 1.419667, 1, 1, 1, 1, 1,
1.171956, 0.07986894, 1.614957, 1, 1, 1, 1, 1,
1.179687, 0.4614078, 1.249644, 1, 1, 1, 1, 1,
1.195905, 1.280109, 3.340174, 1, 1, 1, 1, 1,
1.200134, 0.6588646, 1.308146, 1, 1, 1, 1, 1,
1.206045, 2.304177, -1.677994, 0, 0, 1, 1, 1,
1.215302, -0.7367953, 1.098729, 1, 0, 0, 1, 1,
1.215711, -0.986791, 2.626868, 1, 0, 0, 1, 1,
1.226602, -1.140686, 2.202126, 1, 0, 0, 1, 1,
1.230579, 1.073532, 1.094754, 1, 0, 0, 1, 1,
1.230943, 0.8762149, 1.332352, 1, 0, 0, 1, 1,
1.2333, 0.09885245, 0.8710682, 0, 0, 0, 1, 1,
1.243165, -1.547397, 1.819317, 0, 0, 0, 1, 1,
1.260265, 0.8538716, 0.6873539, 0, 0, 0, 1, 1,
1.260659, -0.3687838, 2.184812, 0, 0, 0, 1, 1,
1.264612, -0.1298585, 1.628807, 0, 0, 0, 1, 1,
1.275427, -0.4742795, 2.118845, 0, 0, 0, 1, 1,
1.280202, -0.3452792, 0.9047837, 0, 0, 0, 1, 1,
1.285938, 0.6526076, 2.453128, 1, 1, 1, 1, 1,
1.300578, 1.702181, -0.1623359, 1, 1, 1, 1, 1,
1.303731, -1.511299, 5.019126, 1, 1, 1, 1, 1,
1.312026, 0.02392268, 2.198772, 1, 1, 1, 1, 1,
1.319088, 0.1769964, 2.758804, 1, 1, 1, 1, 1,
1.336058, -0.7693304, 1.783198, 1, 1, 1, 1, 1,
1.338348, -0.9483331, 1.537688, 1, 1, 1, 1, 1,
1.340812, -2.013973, 3.178311, 1, 1, 1, 1, 1,
1.346769, -0.01619632, 0.67327, 1, 1, 1, 1, 1,
1.361333, 1.390063, 3.475184, 1, 1, 1, 1, 1,
1.368837, 0.8636242, 2.172145, 1, 1, 1, 1, 1,
1.370701, 0.4652725, 2.305518, 1, 1, 1, 1, 1,
1.372914, -1.035259, 1.385202, 1, 1, 1, 1, 1,
1.378885, 0.7727969, 2.693839, 1, 1, 1, 1, 1,
1.380538, -1.687837, 1.72717, 1, 1, 1, 1, 1,
1.389255, -0.3712268, 3.480185, 0, 0, 1, 1, 1,
1.400055, 0.9406943, -0.9643008, 1, 0, 0, 1, 1,
1.4071, 0.4986329, 2.499869, 1, 0, 0, 1, 1,
1.411561, 0.5338725, 2.3525, 1, 0, 0, 1, 1,
1.416588, 0.1216149, 1.230593, 1, 0, 0, 1, 1,
1.421215, -0.1885602, 2.800124, 1, 0, 0, 1, 1,
1.423202, 1.461316, 2.761364, 0, 0, 0, 1, 1,
1.4328, 1.674175, 1.546784, 0, 0, 0, 1, 1,
1.441013, -0.2151836, 3.960463, 0, 0, 0, 1, 1,
1.452379, -1.49752, 3.534893, 0, 0, 0, 1, 1,
1.457272, 0.2872557, 1.032423, 0, 0, 0, 1, 1,
1.476287, 0.5428711, 0.6793252, 0, 0, 0, 1, 1,
1.495684, 1.225963, 0.8058797, 0, 0, 0, 1, 1,
1.502143, -1.024356, 2.531263, 1, 1, 1, 1, 1,
1.546779, -1.372396, 1.540592, 1, 1, 1, 1, 1,
1.5505, 0.1347271, 2.428806, 1, 1, 1, 1, 1,
1.553389, -2.329047, 1.342631, 1, 1, 1, 1, 1,
1.554566, -0.6815588, 3.536606, 1, 1, 1, 1, 1,
1.559381, -1.14595, 1.821294, 1, 1, 1, 1, 1,
1.560913, 0.2624386, -0.5424835, 1, 1, 1, 1, 1,
1.562702, -0.7107021, 3.680155, 1, 1, 1, 1, 1,
1.570745, -0.1586034, -1.08044, 1, 1, 1, 1, 1,
1.581407, 2.190152, 0.7540401, 1, 1, 1, 1, 1,
1.594705, 0.2291792, -0.3978304, 1, 1, 1, 1, 1,
1.595791, 2.324678, 0.3328318, 1, 1, 1, 1, 1,
1.616898, 0.8734081, 0.646973, 1, 1, 1, 1, 1,
1.631476, -0.53873, 2.472366, 1, 1, 1, 1, 1,
1.650617, 0.2580426, 1.483939, 1, 1, 1, 1, 1,
1.687201, -0.7664247, 0.3104145, 0, 0, 1, 1, 1,
1.692356, 0.1456448, 0.987642, 1, 0, 0, 1, 1,
1.695873, 0.5136679, 2.488693, 1, 0, 0, 1, 1,
1.70023, -2.040364, 3.483955, 1, 0, 0, 1, 1,
1.708038, 0.9255089, 3.263808, 1, 0, 0, 1, 1,
1.710312, -0.3347781, 0.6952735, 1, 0, 0, 1, 1,
1.730318, -0.7626595, 3.000634, 0, 0, 0, 1, 1,
1.742092, -0.3817162, 2.217713, 0, 0, 0, 1, 1,
1.759232, 0.543053, 1.320833, 0, 0, 0, 1, 1,
1.802215, -1.19333, 3.716469, 0, 0, 0, 1, 1,
1.804146, -0.3070866, 3.268684, 0, 0, 0, 1, 1,
1.8047, 1.689118, -0.3364711, 0, 0, 0, 1, 1,
1.814043, 0.5577749, 1.095353, 0, 0, 0, 1, 1,
1.814077, 0.4099191, 0.6521503, 1, 1, 1, 1, 1,
1.82714, -1.147523, 3.464323, 1, 1, 1, 1, 1,
1.832618, 1.277287, 0.7801514, 1, 1, 1, 1, 1,
1.832637, 2.003596, 0.09729446, 1, 1, 1, 1, 1,
1.845243, -0.461306, 0.9497883, 1, 1, 1, 1, 1,
1.85613, -0.7678382, 1.425582, 1, 1, 1, 1, 1,
1.871369, 0.4375848, 2.297932, 1, 1, 1, 1, 1,
1.883262, -0.4624707, -0.396294, 1, 1, 1, 1, 1,
1.902872, 0.6529226, 2.467599, 1, 1, 1, 1, 1,
1.91589, -0.3941211, 2.717616, 1, 1, 1, 1, 1,
1.926827, -0.4728448, 1.717267, 1, 1, 1, 1, 1,
1.940662, -1.551233, 0.6289219, 1, 1, 1, 1, 1,
1.94666, 1.015288, 0.9991082, 1, 1, 1, 1, 1,
1.948479, 1.74695, 0.5143286, 1, 1, 1, 1, 1,
1.948796, 0.53361, 0.668491, 1, 1, 1, 1, 1,
1.96393, 1.831564, 1.734499, 0, 0, 1, 1, 1,
1.98899, -0.7071804, 2.292942, 1, 0, 0, 1, 1,
2.011732, 0.1707001, 2.70081, 1, 0, 0, 1, 1,
2.020665, 0.2688489, 2.001683, 1, 0, 0, 1, 1,
2.036721, -0.614935, 2.095894, 1, 0, 0, 1, 1,
2.058451, 0.3704433, 2.388243, 1, 0, 0, 1, 1,
2.066952, -0.003324305, 1.901944, 0, 0, 0, 1, 1,
2.105307, -0.04573838, -1.137483, 0, 0, 0, 1, 1,
2.108734, -1.263828, 3.035028, 0, 0, 0, 1, 1,
2.199872, 1.167504, 0.3464534, 0, 0, 0, 1, 1,
2.220654, -0.3253851, 0.5759867, 0, 0, 0, 1, 1,
2.247087, 0.4255095, 1.94626, 0, 0, 0, 1, 1,
2.35907, -0.7595551, 1.458, 0, 0, 0, 1, 1,
2.365133, -1.171645, 2.511408, 1, 1, 1, 1, 1,
2.370514, 0.9037453, -1.329849, 1, 1, 1, 1, 1,
2.373352, 0.4561813, -1.388752, 1, 1, 1, 1, 1,
2.697481, -0.2833152, 1.381129, 1, 1, 1, 1, 1,
2.888803, -0.3765352, 1.443703, 1, 1, 1, 1, 1,
2.972252, -1.345684, 2.699998, 1, 1, 1, 1, 1,
3.317121, -1.750527, 1.804028, 1, 1, 1, 1, 1
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
var radius = 10.12875;
var distance = 35.5768;
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
mvMatrix.translate( 0.1043122, -0.4415243, -0.3229594 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.5768);
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
