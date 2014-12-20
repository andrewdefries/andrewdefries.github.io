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
-3.088804, -0.3647309, 1.411473, 1, 0, 0, 1,
-2.730268, -0.317447, -1.996991, 1, 0.007843138, 0, 1,
-2.647475, -0.6951247, -0.7158441, 1, 0.01176471, 0, 1,
-2.607814, -0.3368641, -0.736878, 1, 0.01960784, 0, 1,
-2.607311, 1.252725, -1.302686, 1, 0.02352941, 0, 1,
-2.50606, -1.189926, -2.408117, 1, 0.03137255, 0, 1,
-2.50032, -0.3285628, -0.9669286, 1, 0.03529412, 0, 1,
-2.49318, -0.402767, -1.41821, 1, 0.04313726, 0, 1,
-2.411924, -0.2378612, -2.508704, 1, 0.04705882, 0, 1,
-2.280784, 0.1025869, -2.039915, 1, 0.05490196, 0, 1,
-2.171126, -0.9757433, -2.452014, 1, 0.05882353, 0, 1,
-2.168825, -0.1699042, -1.721488, 1, 0.06666667, 0, 1,
-2.141572, -0.5820852, -2.668761, 1, 0.07058824, 0, 1,
-2.108181, -0.4386461, -1.943358, 1, 0.07843138, 0, 1,
-2.105932, 1.251523, -1.042082, 1, 0.08235294, 0, 1,
-2.073473, -1.264536, -1.390616, 1, 0.09019608, 0, 1,
-2.071998, 0.2450773, 0.08990069, 1, 0.09411765, 0, 1,
-2.065464, 0.7482541, -2.871173, 1, 0.1019608, 0, 1,
-2.029326, -0.1671933, -2.513891, 1, 0.1098039, 0, 1,
-1.996644, 2.188978, -1.077503, 1, 0.1137255, 0, 1,
-1.982628, -0.1640992, -2.090672, 1, 0.1215686, 0, 1,
-1.953366, 0.3259928, -1.120192, 1, 0.1254902, 0, 1,
-1.939477, -0.24743, -3.253582, 1, 0.1333333, 0, 1,
-1.919382, -0.1011641, -1.537013, 1, 0.1372549, 0, 1,
-1.907628, 0.3528441, -2.066397, 1, 0.145098, 0, 1,
-1.872888, -0.1661553, -0.6586648, 1, 0.1490196, 0, 1,
-1.872603, 0.8661754, -0.4309375, 1, 0.1568628, 0, 1,
-1.826751, -2.716558, -2.302624, 1, 0.1607843, 0, 1,
-1.824691, -0.8669248, -2.078011, 1, 0.1686275, 0, 1,
-1.809495, 1.164085, 0.5787811, 1, 0.172549, 0, 1,
-1.80681, -0.4411547, -2.93729, 1, 0.1803922, 0, 1,
-1.787812, -0.6919869, -1.416857, 1, 0.1843137, 0, 1,
-1.754631, -0.8090341, -3.250947, 1, 0.1921569, 0, 1,
-1.749995, -1.01266, -2.294356, 1, 0.1960784, 0, 1,
-1.748541, 0.1354696, -2.77814, 1, 0.2039216, 0, 1,
-1.730049, 1.652132, -0.8102438, 1, 0.2117647, 0, 1,
-1.729158, -0.5953618, -2.489135, 1, 0.2156863, 0, 1,
-1.722454, 1.062962, -1.52933, 1, 0.2235294, 0, 1,
-1.718118, -0.8289647, -2.647972, 1, 0.227451, 0, 1,
-1.692194, 1.316772, -0.6930864, 1, 0.2352941, 0, 1,
-1.669369, -0.8537157, -1.463332, 1, 0.2392157, 0, 1,
-1.646294, -0.943424, -0.4752001, 1, 0.2470588, 0, 1,
-1.642891, 1.369179, -0.4574445, 1, 0.2509804, 0, 1,
-1.642433, -1.289538, -1.606745, 1, 0.2588235, 0, 1,
-1.626698, 1.107047, -2.134766, 1, 0.2627451, 0, 1,
-1.624465, -0.8921229, -0.8614301, 1, 0.2705882, 0, 1,
-1.595864, -1.965213, -2.121021, 1, 0.2745098, 0, 1,
-1.59552, -2.856939, -1.730962, 1, 0.282353, 0, 1,
-1.578214, -0.6508411, 0.1459094, 1, 0.2862745, 0, 1,
-1.561173, 0.05318964, -1.642751, 1, 0.2941177, 0, 1,
-1.553198, 1.09798, -2.04307, 1, 0.3019608, 0, 1,
-1.541405, 1.429384, -1.531654, 1, 0.3058824, 0, 1,
-1.538924, -1.385766, -1.735909, 1, 0.3137255, 0, 1,
-1.530586, -0.6067223, -1.839053, 1, 0.3176471, 0, 1,
-1.523515, 1.370434, -0.149016, 1, 0.3254902, 0, 1,
-1.522263, -0.06899846, -0.6881182, 1, 0.3294118, 0, 1,
-1.51429, -0.4231679, -2.386797, 1, 0.3372549, 0, 1,
-1.509764, -0.1477686, -0.2103506, 1, 0.3411765, 0, 1,
-1.508603, 0.5917624, -0.6538637, 1, 0.3490196, 0, 1,
-1.505963, -0.0697024, -2.101104, 1, 0.3529412, 0, 1,
-1.497776, -0.518835, -1.018216, 1, 0.3607843, 0, 1,
-1.492955, -0.2542245, -1.150843, 1, 0.3647059, 0, 1,
-1.487297, 0.2691816, -1.241689, 1, 0.372549, 0, 1,
-1.478981, -0.5211383, -2.921492, 1, 0.3764706, 0, 1,
-1.475731, -0.8969432, -3.769237, 1, 0.3843137, 0, 1,
-1.457409, -1.032753, -1.94489, 1, 0.3882353, 0, 1,
-1.454703, 1.610374, -0.4303249, 1, 0.3960784, 0, 1,
-1.440834, 3.002039, -0.8308669, 1, 0.4039216, 0, 1,
-1.438612, -0.2786016, -1.94876, 1, 0.4078431, 0, 1,
-1.431322, 0.04455947, -0.02039552, 1, 0.4156863, 0, 1,
-1.412633, 0.1154532, -2.626873, 1, 0.4196078, 0, 1,
-1.408818, -0.3477801, -3.786892, 1, 0.427451, 0, 1,
-1.403939, -0.1323632, -2.4546, 1, 0.4313726, 0, 1,
-1.396648, -2.262284, -2.617895, 1, 0.4392157, 0, 1,
-1.389575, 0.7122869, -2.617915, 1, 0.4431373, 0, 1,
-1.374219, -0.6299062, -1.559451, 1, 0.4509804, 0, 1,
-1.369456, 0.2767667, -1.66886, 1, 0.454902, 0, 1,
-1.366873, -1.200727, -1.668304, 1, 0.4627451, 0, 1,
-1.365352, -0.7935039, -2.70925, 1, 0.4666667, 0, 1,
-1.356683, 1.429661, 1.256388, 1, 0.4745098, 0, 1,
-1.355643, 0.587595, -1.036323, 1, 0.4784314, 0, 1,
-1.340012, -0.09114534, 0.4204911, 1, 0.4862745, 0, 1,
-1.338887, 1.011154, -2.364194, 1, 0.4901961, 0, 1,
-1.337789, -0.5537111, -1.076778, 1, 0.4980392, 0, 1,
-1.337377, -0.4804451, -1.583535, 1, 0.5058824, 0, 1,
-1.337307, 1.454412, -0.7183797, 1, 0.509804, 0, 1,
-1.316349, 0.2514758, -0.6783912, 1, 0.5176471, 0, 1,
-1.312935, 0.9536566, -1.566408, 1, 0.5215687, 0, 1,
-1.312736, -0.9333205, -1.976446, 1, 0.5294118, 0, 1,
-1.308017, 0.005776839, 0.168269, 1, 0.5333334, 0, 1,
-1.305662, -0.6294162, -2.204952, 1, 0.5411765, 0, 1,
-1.296735, -0.6031181, -2.239248, 1, 0.5450981, 0, 1,
-1.292014, 0.06807651, -2.784274, 1, 0.5529412, 0, 1,
-1.286452, -0.6220405, -2.037898, 1, 0.5568628, 0, 1,
-1.283191, 0.5379893, -1.616677, 1, 0.5647059, 0, 1,
-1.279187, -2.487678, -2.405627, 1, 0.5686275, 0, 1,
-1.274341, -1.327323, -3.028155, 1, 0.5764706, 0, 1,
-1.265384, -0.1048103, -1.16827, 1, 0.5803922, 0, 1,
-1.263322, 1.2991, -1.52261, 1, 0.5882353, 0, 1,
-1.262974, -0.7701288, -2.42351, 1, 0.5921569, 0, 1,
-1.260824, -0.2315165, -2.636892, 1, 0.6, 0, 1,
-1.256769, -1.94434, -2.782434, 1, 0.6078432, 0, 1,
-1.249854, 0.00960631, -1.657575, 1, 0.6117647, 0, 1,
-1.247208, 0.4730617, -0.869323, 1, 0.6196079, 0, 1,
-1.236272, -1.5845, -2.917146, 1, 0.6235294, 0, 1,
-1.23252, -0.1892552, -0.9107912, 1, 0.6313726, 0, 1,
-1.217378, 0.2159014, -1.179468, 1, 0.6352941, 0, 1,
-1.209812, -0.8166039, -2.210655, 1, 0.6431373, 0, 1,
-1.208242, 0.2933748, -0.7576439, 1, 0.6470588, 0, 1,
-1.197483, 0.7237466, -0.1132245, 1, 0.654902, 0, 1,
-1.194726, 0.2918421, -1.951706, 1, 0.6588235, 0, 1,
-1.188159, 1.22197, 0.1297609, 1, 0.6666667, 0, 1,
-1.187621, -0.176426, -0.3721153, 1, 0.6705883, 0, 1,
-1.186038, -0.1404953, -1.132577, 1, 0.6784314, 0, 1,
-1.182515, 0.8875464, -0.6807068, 1, 0.682353, 0, 1,
-1.181481, -0.1381235, -1.345919, 1, 0.6901961, 0, 1,
-1.177169, -0.6359286, -2.138027, 1, 0.6941177, 0, 1,
-1.16979, 1.691919, 0.2017976, 1, 0.7019608, 0, 1,
-1.169072, -0.3729822, -2.374913, 1, 0.7098039, 0, 1,
-1.167171, 0.9653303, -1.673522, 1, 0.7137255, 0, 1,
-1.157693, 0.09662198, -0.2957938, 1, 0.7215686, 0, 1,
-1.156029, -0.5350856, -3.527561, 1, 0.7254902, 0, 1,
-1.144603, -1.169623, -3.124819, 1, 0.7333333, 0, 1,
-1.139696, -0.7269747, -2.15885, 1, 0.7372549, 0, 1,
-1.13482, -0.05772891, -4.087582, 1, 0.7450981, 0, 1,
-1.129618, 1.081422, -0.04452179, 1, 0.7490196, 0, 1,
-1.122534, -0.8274811, -1.463931, 1, 0.7568628, 0, 1,
-1.120863, -1.32375, -2.606196, 1, 0.7607843, 0, 1,
-1.119275, 0.9887156, -1.178895, 1, 0.7686275, 0, 1,
-1.114301, -0.4135388, -2.891633, 1, 0.772549, 0, 1,
-1.113788, -0.0634862, -2.504353, 1, 0.7803922, 0, 1,
-1.113069, -0.3530708, -1.844289, 1, 0.7843137, 0, 1,
-1.112331, 0.473447, -1.941553, 1, 0.7921569, 0, 1,
-1.110111, -0.6155068, -1.407329, 1, 0.7960784, 0, 1,
-1.107728, 0.3178724, -2.821159, 1, 0.8039216, 0, 1,
-1.096159, -1.125625, -0.6346932, 1, 0.8117647, 0, 1,
-1.094, -0.3892606, -3.53715, 1, 0.8156863, 0, 1,
-1.090924, -0.855337, -3.846629, 1, 0.8235294, 0, 1,
-1.09077, 0.3004402, 1.4027, 1, 0.827451, 0, 1,
-1.090049, -0.2125606, -1.032034, 1, 0.8352941, 0, 1,
-1.08921, 0.2636435, -2.335285, 1, 0.8392157, 0, 1,
-1.088115, 2.018906, -1.403283, 1, 0.8470588, 0, 1,
-1.085584, 1.180131, 0.3329717, 1, 0.8509804, 0, 1,
-1.08357, -0.9576832, -3.792035, 1, 0.8588235, 0, 1,
-1.081146, -0.9576382, -1.716668, 1, 0.8627451, 0, 1,
-1.079999, 0.2594626, -2.715445, 1, 0.8705882, 0, 1,
-1.06005, 0.7446064, 0.2783891, 1, 0.8745098, 0, 1,
-1.058207, 0.2139255, -2.046548, 1, 0.8823529, 0, 1,
-1.057224, -0.701817, -1.972258, 1, 0.8862745, 0, 1,
-1.055443, 0.03874011, -1.505192, 1, 0.8941177, 0, 1,
-1.055245, 0.5825841, -1.275675, 1, 0.8980392, 0, 1,
-1.043623, 0.6074952, -0.9313506, 1, 0.9058824, 0, 1,
-1.042358, 0.1226039, -1.688463, 1, 0.9137255, 0, 1,
-1.037109, 0.4879731, -1.510767, 1, 0.9176471, 0, 1,
-1.0353, -1.478043, -1.983235, 1, 0.9254902, 0, 1,
-1.031027, 0.06525394, -1.576124, 1, 0.9294118, 0, 1,
-1.030661, 0.3831967, -1.222132, 1, 0.9372549, 0, 1,
-1.026275, -0.3389041, -2.089359, 1, 0.9411765, 0, 1,
-1.025148, -0.4325027, -2.097878, 1, 0.9490196, 0, 1,
-1.023979, -0.7897857, -3.75824, 1, 0.9529412, 0, 1,
-1.023409, 0.6012178, -0.4922196, 1, 0.9607843, 0, 1,
-1.014592, 0.5599324, -0.1883731, 1, 0.9647059, 0, 1,
-1.012129, -0.7985734, -1.260628, 1, 0.972549, 0, 1,
-1.011181, -0.1365816, -2.295616, 1, 0.9764706, 0, 1,
-0.9931621, -0.9725785, -2.015047, 1, 0.9843137, 0, 1,
-0.9895271, 0.969651, -0.667186, 1, 0.9882353, 0, 1,
-0.9853088, 0.4963515, -0.8787786, 1, 0.9960784, 0, 1,
-0.9818627, 1.250344, 0.2991138, 0.9960784, 1, 0, 1,
-0.9812246, -2.240592, -1.304347, 0.9921569, 1, 0, 1,
-0.9783906, -0.450784, -1.613121, 0.9843137, 1, 0, 1,
-0.9770842, -0.4095812, -2.353074, 0.9803922, 1, 0, 1,
-0.9765296, -0.104572, -1.181736, 0.972549, 1, 0, 1,
-0.9748685, -1.284517, -3.590938, 0.9686275, 1, 0, 1,
-0.972307, 0.5929126, -0.488448, 0.9607843, 1, 0, 1,
-0.9643292, 0.1090126, -2.923985, 0.9568627, 1, 0, 1,
-0.958707, -0.1799475, -1.68224, 0.9490196, 1, 0, 1,
-0.9560395, 0.7287523, -1.539226, 0.945098, 1, 0, 1,
-0.9506911, 1.047245, 0.7848275, 0.9372549, 1, 0, 1,
-0.9500838, -0.8328071, -1.417386, 0.9333333, 1, 0, 1,
-0.9424218, 0.8027554, -2.248377, 0.9254902, 1, 0, 1,
-0.9400223, 0.8574831, -1.645276, 0.9215686, 1, 0, 1,
-0.9390529, 1.041724, -1.157896, 0.9137255, 1, 0, 1,
-0.9266596, 0.4397043, -0.1156203, 0.9098039, 1, 0, 1,
-0.9205136, 0.326469, -1.304208, 0.9019608, 1, 0, 1,
-0.9168126, -1.652388, -3.19938, 0.8941177, 1, 0, 1,
-0.9164774, -0.2953491, -2.381532, 0.8901961, 1, 0, 1,
-0.908246, 0.6566156, -1.459991, 0.8823529, 1, 0, 1,
-0.894056, 0.03745329, -1.078711, 0.8784314, 1, 0, 1,
-0.8906654, -1.161052, -1.635597, 0.8705882, 1, 0, 1,
-0.8897051, -0.4853531, -2.428353, 0.8666667, 1, 0, 1,
-0.88947, -0.2427728, -2.056144, 0.8588235, 1, 0, 1,
-0.8839538, 1.303392, -0.2162818, 0.854902, 1, 0, 1,
-0.8827574, -0.809926, -0.3311768, 0.8470588, 1, 0, 1,
-0.8822544, -1.613339, -2.66136, 0.8431373, 1, 0, 1,
-0.8773685, -0.7016874, -2.01116, 0.8352941, 1, 0, 1,
-0.8746082, -0.8220214, -2.686002, 0.8313726, 1, 0, 1,
-0.874066, -0.7378113, -2.016865, 0.8235294, 1, 0, 1,
-0.8720977, -0.6380172, -2.212292, 0.8196079, 1, 0, 1,
-0.8577342, -0.4613847, -0.5278773, 0.8117647, 1, 0, 1,
-0.8573406, 0.621741, 1.47621, 0.8078431, 1, 0, 1,
-0.8514194, -0.4596991, -0.9139476, 0.8, 1, 0, 1,
-0.8511772, 0.9631634, 0.1928993, 0.7921569, 1, 0, 1,
-0.8462964, -1.423533, -4.512478, 0.7882353, 1, 0, 1,
-0.8375743, 0.781036, -0.566857, 0.7803922, 1, 0, 1,
-0.8362243, 0.9753253, -0.932528, 0.7764706, 1, 0, 1,
-0.8328859, -0.7338691, -3.120982, 0.7686275, 1, 0, 1,
-0.8261889, -0.2011926, -2.953797, 0.7647059, 1, 0, 1,
-0.8214995, 1.595104, 0.1736151, 0.7568628, 1, 0, 1,
-0.8214941, 0.07837977, -0.1328905, 0.7529412, 1, 0, 1,
-0.8198272, -0.1596231, -1.007928, 0.7450981, 1, 0, 1,
-0.8184036, -0.2415779, -1.373593, 0.7411765, 1, 0, 1,
-0.8167845, 0.3945971, -0.7698925, 0.7333333, 1, 0, 1,
-0.8138729, -1.017027, -1.821292, 0.7294118, 1, 0, 1,
-0.8124949, -0.5382018, -2.558645, 0.7215686, 1, 0, 1,
-0.8066564, -0.02849314, -2.210782, 0.7176471, 1, 0, 1,
-0.8055647, -0.2449846, -1.639441, 0.7098039, 1, 0, 1,
-0.8046085, -1.980562, -2.805453, 0.7058824, 1, 0, 1,
-0.8032806, -1.167969, -3.76906, 0.6980392, 1, 0, 1,
-0.80323, -0.2321524, -0.541756, 0.6901961, 1, 0, 1,
-0.7991582, 0.3359753, 0.5433486, 0.6862745, 1, 0, 1,
-0.7984501, -0.3614602, -3.839963, 0.6784314, 1, 0, 1,
-0.7951065, 0.09990747, -0.7061497, 0.6745098, 1, 0, 1,
-0.7946668, -0.4553667, -1.539956, 0.6666667, 1, 0, 1,
-0.7943009, 0.8912666, -0.2637618, 0.6627451, 1, 0, 1,
-0.7857816, -1.750764, -2.425064, 0.654902, 1, 0, 1,
-0.779332, 1.096356, -1.258611, 0.6509804, 1, 0, 1,
-0.7787365, -0.3277805, -1.317861, 0.6431373, 1, 0, 1,
-0.777951, 0.2829579, -0.2111025, 0.6392157, 1, 0, 1,
-0.774014, -0.6690704, -2.088121, 0.6313726, 1, 0, 1,
-0.764422, -0.5627081, -2.003643, 0.627451, 1, 0, 1,
-0.7604904, -1.63318, -2.309597, 0.6196079, 1, 0, 1,
-0.7594255, -0.03917609, -1.961261, 0.6156863, 1, 0, 1,
-0.7560636, 1.136948, 0.2204715, 0.6078432, 1, 0, 1,
-0.7559594, 0.3357437, -0.3359592, 0.6039216, 1, 0, 1,
-0.7463422, 0.1552169, -2.200177, 0.5960785, 1, 0, 1,
-0.7330808, 0.6055411, -1.832114, 0.5882353, 1, 0, 1,
-0.7292331, -0.8940021, -4.041002, 0.5843138, 1, 0, 1,
-0.727084, -0.7934166, -3.202227, 0.5764706, 1, 0, 1,
-0.7258265, -0.1934356, -1.093932, 0.572549, 1, 0, 1,
-0.7232396, -1.063643, -2.216755, 0.5647059, 1, 0, 1,
-0.7135707, -0.3092549, -1.596521, 0.5607843, 1, 0, 1,
-0.6996487, -0.1870309, -2.74796, 0.5529412, 1, 0, 1,
-0.6993974, -1.916552, -4.157409, 0.5490196, 1, 0, 1,
-0.6987053, -0.8306904, -0.447142, 0.5411765, 1, 0, 1,
-0.6979013, -1.068302, -1.933323, 0.5372549, 1, 0, 1,
-0.6968455, -0.7831949, -2.541422, 0.5294118, 1, 0, 1,
-0.6967692, -0.5957043, -1.08221, 0.5254902, 1, 0, 1,
-0.6957483, 0.2367948, -1.113834, 0.5176471, 1, 0, 1,
-0.6927192, -0.771497, -2.006327, 0.5137255, 1, 0, 1,
-0.6891551, 0.8550788, -0.7618373, 0.5058824, 1, 0, 1,
-0.6861418, 1.768371, 1.499382, 0.5019608, 1, 0, 1,
-0.6856421, -1.449325, -2.264181, 0.4941176, 1, 0, 1,
-0.6819498, 0.9317911, -1.278546, 0.4862745, 1, 0, 1,
-0.6780988, 0.02273122, 0.5380264, 0.4823529, 1, 0, 1,
-0.6769007, 0.4953427, -1.618886, 0.4745098, 1, 0, 1,
-0.6760876, 0.5095659, -2.86735, 0.4705882, 1, 0, 1,
-0.671935, 0.2221, -1.51977, 0.4627451, 1, 0, 1,
-0.6625806, 0.3881043, -0.2023674, 0.4588235, 1, 0, 1,
-0.6620709, -0.2724071, -2.447131, 0.4509804, 1, 0, 1,
-0.6568035, -1.235804, -4.029238, 0.4470588, 1, 0, 1,
-0.6553798, 0.9428891, -1.985437, 0.4392157, 1, 0, 1,
-0.6534529, -1.117795, -2.145908, 0.4352941, 1, 0, 1,
-0.647243, -0.3531122, 0.001799125, 0.427451, 1, 0, 1,
-0.6469021, -1.033016, -1.228647, 0.4235294, 1, 0, 1,
-0.6449558, -1.238809, -2.790889, 0.4156863, 1, 0, 1,
-0.6374359, -0.5181052, -0.837635, 0.4117647, 1, 0, 1,
-0.6365359, -0.8256932, -0.6964723, 0.4039216, 1, 0, 1,
-0.6345062, 0.3234012, -1.313134, 0.3960784, 1, 0, 1,
-0.6330366, 0.1342636, -1.501486, 0.3921569, 1, 0, 1,
-0.6256744, -0.2812429, -3.742265, 0.3843137, 1, 0, 1,
-0.6232906, 1.284753, -0.4084931, 0.3803922, 1, 0, 1,
-0.6139618, -0.9473342, -2.485038, 0.372549, 1, 0, 1,
-0.6136338, 1.05895, 0.3539124, 0.3686275, 1, 0, 1,
-0.6131592, 0.6098282, -1.471051, 0.3607843, 1, 0, 1,
-0.6089683, 1.760524, -1.549663, 0.3568628, 1, 0, 1,
-0.6075138, 0.1975106, -1.502603, 0.3490196, 1, 0, 1,
-0.6074291, 1.718929, -1.018924, 0.345098, 1, 0, 1,
-0.606384, 2.327547, -0.73602, 0.3372549, 1, 0, 1,
-0.6053216, 1.508718, 0.04964143, 0.3333333, 1, 0, 1,
-0.6003956, 0.1662211, -2.805477, 0.3254902, 1, 0, 1,
-0.6003039, 0.08261365, -1.878445, 0.3215686, 1, 0, 1,
-0.5962585, 0.7794743, -0.175254, 0.3137255, 1, 0, 1,
-0.5939763, 1.164932, 0.4705637, 0.3098039, 1, 0, 1,
-0.5913411, -2.545174, -2.469599, 0.3019608, 1, 0, 1,
-0.5903513, 0.1201165, -2.225199, 0.2941177, 1, 0, 1,
-0.5900456, 0.8927439, 0.7261164, 0.2901961, 1, 0, 1,
-0.5834491, 0.8434654, -2.091282, 0.282353, 1, 0, 1,
-0.582744, -0.4397783, -3.330019, 0.2784314, 1, 0, 1,
-0.5736014, -0.1998102, -2.376215, 0.2705882, 1, 0, 1,
-0.5693219, -0.4582205, -2.69491, 0.2666667, 1, 0, 1,
-0.5663066, 0.2042008, -1.741206, 0.2588235, 1, 0, 1,
-0.5662088, -0.9756728, -2.120405, 0.254902, 1, 0, 1,
-0.5636164, 0.346538, 0.4121796, 0.2470588, 1, 0, 1,
-0.5553586, 0.5626215, -0.1775931, 0.2431373, 1, 0, 1,
-0.5548436, -1.343435, -4.238379, 0.2352941, 1, 0, 1,
-0.5534707, 0.7409937, -0.2122224, 0.2313726, 1, 0, 1,
-0.5529247, 0.4901246, 0.2681945, 0.2235294, 1, 0, 1,
-0.5528544, 1.400692, 0.3844774, 0.2196078, 1, 0, 1,
-0.5502504, 1.486104, -0.9504638, 0.2117647, 1, 0, 1,
-0.5463447, -0.7144725, -2.125768, 0.2078431, 1, 0, 1,
-0.5425186, -0.6678874, -2.213721, 0.2, 1, 0, 1,
-0.5405436, 0.4785935, 0.02571619, 0.1921569, 1, 0, 1,
-0.5399384, 0.1878748, -2.073223, 0.1882353, 1, 0, 1,
-0.5340141, 0.17397, -0.8882107, 0.1803922, 1, 0, 1,
-0.5292442, 0.387837, 1.212368, 0.1764706, 1, 0, 1,
-0.5245317, -0.1255825, -2.36388, 0.1686275, 1, 0, 1,
-0.5244984, -0.2862808, -1.394031, 0.1647059, 1, 0, 1,
-0.522423, -0.4484757, -3.160642, 0.1568628, 1, 0, 1,
-0.5164539, 0.2848422, -1.401486, 0.1529412, 1, 0, 1,
-0.5158444, -0.2331427, -2.805181, 0.145098, 1, 0, 1,
-0.5113923, 0.1870014, -1.559389, 0.1411765, 1, 0, 1,
-0.5047325, 0.3463761, 1.051465, 0.1333333, 1, 0, 1,
-0.4987191, -0.5663525, -2.469021, 0.1294118, 1, 0, 1,
-0.4922729, -1.498943, -4.553688, 0.1215686, 1, 0, 1,
-0.4894828, 0.1983133, -1.790023, 0.1176471, 1, 0, 1,
-0.4863036, -0.4124385, -2.70725, 0.1098039, 1, 0, 1,
-0.4836518, -0.02906657, 0.3904049, 0.1058824, 1, 0, 1,
-0.4821885, -0.8017157, -2.786845, 0.09803922, 1, 0, 1,
-0.4820248, -0.5833002, -2.680709, 0.09019608, 1, 0, 1,
-0.4789687, -0.4796562, -3.605557, 0.08627451, 1, 0, 1,
-0.4763474, 1.190678, 0.03508669, 0.07843138, 1, 0, 1,
-0.4731414, -1.027383, -3.260488, 0.07450981, 1, 0, 1,
-0.4713753, -0.4085876, -2.880286, 0.06666667, 1, 0, 1,
-0.4685089, -1.683196, -2.276943, 0.0627451, 1, 0, 1,
-0.4657362, -1.337453, -1.97506, 0.05490196, 1, 0, 1,
-0.4642333, 1.417296, 0.0009795452, 0.05098039, 1, 0, 1,
-0.4560857, 2.198773, -0.7070745, 0.04313726, 1, 0, 1,
-0.4512956, -0.5605435, -3.644456, 0.03921569, 1, 0, 1,
-0.451077, 1.048325, 1.287049, 0.03137255, 1, 0, 1,
-0.4417908, 0.05608541, -1.042808, 0.02745098, 1, 0, 1,
-0.4346568, -1.191192, -2.620783, 0.01960784, 1, 0, 1,
-0.4312211, -0.668821, -1.184232, 0.01568628, 1, 0, 1,
-0.4309397, -0.9629331, -1.872522, 0.007843138, 1, 0, 1,
-0.4286323, 0.1595021, -1.024231, 0.003921569, 1, 0, 1,
-0.4285282, 1.538554, 0.2818213, 0, 1, 0.003921569, 1,
-0.4272332, 0.5573505, -2.542922, 0, 1, 0.01176471, 1,
-0.4145433, -0.9101354, -1.05711, 0, 1, 0.01568628, 1,
-0.4059993, 0.3639119, -0.3627222, 0, 1, 0.02352941, 1,
-0.4036613, 0.5158112, -0.9430087, 0, 1, 0.02745098, 1,
-0.4026744, -0.004498851, -1.85029, 0, 1, 0.03529412, 1,
-0.3979862, 0.5030622, -1.013279, 0, 1, 0.03921569, 1,
-0.3976786, -0.03230424, -2.571287, 0, 1, 0.04705882, 1,
-0.3932281, -0.295496, -1.434318, 0, 1, 0.05098039, 1,
-0.3920619, 0.2485513, -0.2934878, 0, 1, 0.05882353, 1,
-0.3868534, 0.1460186, -0.78369, 0, 1, 0.0627451, 1,
-0.3865519, 0.8808767, -0.5274234, 0, 1, 0.07058824, 1,
-0.3839474, 1.547127, -0.9551873, 0, 1, 0.07450981, 1,
-0.3839028, -0.1312529, -2.992669, 0, 1, 0.08235294, 1,
-0.3798538, 0.4896942, -1.224164, 0, 1, 0.08627451, 1,
-0.3786824, -0.1916138, -1.46036, 0, 1, 0.09411765, 1,
-0.3780195, 0.1255068, -1.502678, 0, 1, 0.1019608, 1,
-0.3772779, -0.08140576, -3.428431, 0, 1, 0.1058824, 1,
-0.3764718, -1.654961, -2.899862, 0, 1, 0.1137255, 1,
-0.3737183, -0.07135518, -3.420724, 0, 1, 0.1176471, 1,
-0.3724094, -0.3637688, -3.386879, 0, 1, 0.1254902, 1,
-0.3698528, 0.4270445, -2.383685, 0, 1, 0.1294118, 1,
-0.3694048, 1.211084, -0.2847253, 0, 1, 0.1372549, 1,
-0.367692, -1.208426, -2.146685, 0, 1, 0.1411765, 1,
-0.366675, 0.5453479, 1.055459, 0, 1, 0.1490196, 1,
-0.3653585, -1.685965, -4.952364, 0, 1, 0.1529412, 1,
-0.3651721, -1.696525, -4.52892, 0, 1, 0.1607843, 1,
-0.3526069, 0.4772123, -1.147372, 0, 1, 0.1647059, 1,
-0.3521645, -0.9628769, -2.30343, 0, 1, 0.172549, 1,
-0.3508965, 0.5744741, -0.7948009, 0, 1, 0.1764706, 1,
-0.3484896, -1.307301, -1.715571, 0, 1, 0.1843137, 1,
-0.3469583, 1.073033, 0.4159351, 0, 1, 0.1882353, 1,
-0.3444479, -0.3713904, -2.406677, 0, 1, 0.1960784, 1,
-0.3409636, -0.7816252, -0.6765045, 0, 1, 0.2039216, 1,
-0.3391723, 0.1390378, -0.4984567, 0, 1, 0.2078431, 1,
-0.3288722, -1.51581, -1.946938, 0, 1, 0.2156863, 1,
-0.3269478, -0.8035253, -3.206029, 0, 1, 0.2196078, 1,
-0.3256289, -0.7109016, -3.717869, 0, 1, 0.227451, 1,
-0.3233039, 1.361196, -3.312389, 0, 1, 0.2313726, 1,
-0.3220541, 0.9084767, -1.307641, 0, 1, 0.2392157, 1,
-0.317216, -1.510262, -2.024886, 0, 1, 0.2431373, 1,
-0.3102603, -0.1125201, -1.204506, 0, 1, 0.2509804, 1,
-0.299282, 2.021549, -0.4523603, 0, 1, 0.254902, 1,
-0.2977574, -0.2953308, -3.010653, 0, 1, 0.2627451, 1,
-0.2974604, 0.521692, -0.3397583, 0, 1, 0.2666667, 1,
-0.2951779, -1.16655, -0.7636454, 0, 1, 0.2745098, 1,
-0.2862413, -0.2638645, -3.186179, 0, 1, 0.2784314, 1,
-0.285148, 0.4414086, -0.9048246, 0, 1, 0.2862745, 1,
-0.2850306, 0.2514466, -0.8035135, 0, 1, 0.2901961, 1,
-0.2829789, -0.06579952, -1.106491, 0, 1, 0.2980392, 1,
-0.2806972, -0.9732269, -2.344059, 0, 1, 0.3058824, 1,
-0.2795309, -0.74635, -3.028241, 0, 1, 0.3098039, 1,
-0.2674119, -0.266714, -2.09333, 0, 1, 0.3176471, 1,
-0.2670647, -0.1820264, -2.657034, 0, 1, 0.3215686, 1,
-0.2593151, -0.01177335, -2.236903, 0, 1, 0.3294118, 1,
-0.2482789, -0.06924421, -2.12372, 0, 1, 0.3333333, 1,
-0.2407774, 1.509851, -0.04004075, 0, 1, 0.3411765, 1,
-0.2363985, 0.4502534, -1.131047, 0, 1, 0.345098, 1,
-0.2363752, 0.05805048, -1.213784, 0, 1, 0.3529412, 1,
-0.235468, 0.04520591, -1.715631, 0, 1, 0.3568628, 1,
-0.2350148, 2.209078, 0.07767763, 0, 1, 0.3647059, 1,
-0.2278304, 0.9492401, 0.307345, 0, 1, 0.3686275, 1,
-0.2259265, -0.984848, -3.008286, 0, 1, 0.3764706, 1,
-0.2234308, 0.1966648, -0.6816029, 0, 1, 0.3803922, 1,
-0.2216587, 0.7531039, -0.1271231, 0, 1, 0.3882353, 1,
-0.2199448, -1.389738, -2.01286, 0, 1, 0.3921569, 1,
-0.2148444, -1.121858, -2.014718, 0, 1, 0.4, 1,
-0.2100195, 0.2572275, -1.776, 0, 1, 0.4078431, 1,
-0.2059638, 0.3201161, -1.734559, 0, 1, 0.4117647, 1,
-0.2058976, 1.938275, -0.6580757, 0, 1, 0.4196078, 1,
-0.1998808, -0.9131618, -2.745946, 0, 1, 0.4235294, 1,
-0.1971692, 0.651692, -2.05939, 0, 1, 0.4313726, 1,
-0.1857803, -0.2546599, -2.052011, 0, 1, 0.4352941, 1,
-0.1857764, -1.12062, -0.7943376, 0, 1, 0.4431373, 1,
-0.1817477, 0.6349303, -0.08422196, 0, 1, 0.4470588, 1,
-0.1798495, -0.7412305, -1.646784, 0, 1, 0.454902, 1,
-0.1777111, -0.5209311, -3.468755, 0, 1, 0.4588235, 1,
-0.1775553, 0.1971698, -0.4349092, 0, 1, 0.4666667, 1,
-0.1767546, 0.1282706, -2.571429, 0, 1, 0.4705882, 1,
-0.176662, 0.1127447, -0.2726604, 0, 1, 0.4784314, 1,
-0.1766367, -0.6544964, -2.760017, 0, 1, 0.4823529, 1,
-0.1760181, -1.332881, -2.049541, 0, 1, 0.4901961, 1,
-0.1710553, 0.7489291, -1.466499, 0, 1, 0.4941176, 1,
-0.1703613, 0.5059608, -0.8760135, 0, 1, 0.5019608, 1,
-0.1699348, 0.169371, -1.638648, 0, 1, 0.509804, 1,
-0.1564619, 0.9351569, -1.390006, 0, 1, 0.5137255, 1,
-0.155142, -0.2380023, -3.712029, 0, 1, 0.5215687, 1,
-0.1537347, 0.3395272, -0.8991152, 0, 1, 0.5254902, 1,
-0.1524964, 0.4143656, -0.7410955, 0, 1, 0.5333334, 1,
-0.1459921, 0.245274, -0.9431009, 0, 1, 0.5372549, 1,
-0.1438796, 0.6210189, 0.2523907, 0, 1, 0.5450981, 1,
-0.1360728, -0.9502175, -3.484033, 0, 1, 0.5490196, 1,
-0.1327801, 1.66621, 0.5249551, 0, 1, 0.5568628, 1,
-0.1310884, -0.995068, -3.370538, 0, 1, 0.5607843, 1,
-0.1308465, -1.008776, -3.854064, 0, 1, 0.5686275, 1,
-0.1295089, -1.106343, -2.881335, 0, 1, 0.572549, 1,
-0.1287482, 0.1311494, 0.3093526, 0, 1, 0.5803922, 1,
-0.1250067, -0.101985, -1.317544, 0, 1, 0.5843138, 1,
-0.1212165, -1.209707, -2.982165, 0, 1, 0.5921569, 1,
-0.1205406, 0.8215949, -1.4971, 0, 1, 0.5960785, 1,
-0.1173029, 0.5433378, -0.1945461, 0, 1, 0.6039216, 1,
-0.1162001, 1.702192, 0.003682483, 0, 1, 0.6117647, 1,
-0.1156459, 0.4592027, -0.05004999, 0, 1, 0.6156863, 1,
-0.1130156, 0.381561, -0.9101858, 0, 1, 0.6235294, 1,
-0.1126145, 1.152229, 1.585913, 0, 1, 0.627451, 1,
-0.1060392, -0.9556828, -3.203027, 0, 1, 0.6352941, 1,
-0.1016805, 0.4717082, 0.3489666, 0, 1, 0.6392157, 1,
-0.1011754, -0.0395195, -1.887798, 0, 1, 0.6470588, 1,
-0.09849688, 0.4214848, -1.052289, 0, 1, 0.6509804, 1,
-0.09805226, -1.641051, -4.033625, 0, 1, 0.6588235, 1,
-0.09711233, -1.296213, -1.322731, 0, 1, 0.6627451, 1,
-0.09446052, 0.1450328, 0.2762594, 0, 1, 0.6705883, 1,
-0.09344323, -0.8169801, -4.414004, 0, 1, 0.6745098, 1,
-0.09327023, -0.4024565, -1.38025, 0, 1, 0.682353, 1,
-0.0928678, 1.663964, 0.104684, 0, 1, 0.6862745, 1,
-0.09257036, -1.425845, -2.369685, 0, 1, 0.6941177, 1,
-0.08720108, 1.222004, 1.384819, 0, 1, 0.7019608, 1,
-0.08637804, 1.139426, -0.2301047, 0, 1, 0.7058824, 1,
-0.08616932, -0.5876273, -3.578363, 0, 1, 0.7137255, 1,
-0.08558421, 0.0274771, 0.02034219, 0, 1, 0.7176471, 1,
-0.08187424, -0.3539385, -1.653318, 0, 1, 0.7254902, 1,
-0.08142986, -0.270081, -2.429601, 0, 1, 0.7294118, 1,
-0.08132977, 1.860708, -1.095945, 0, 1, 0.7372549, 1,
-0.08127846, -0.405041, -2.554333, 0, 1, 0.7411765, 1,
-0.0805584, 1.001173, -1.271514, 0, 1, 0.7490196, 1,
-0.08027531, 1.099061, 0.5733246, 0, 1, 0.7529412, 1,
-0.07833437, -0.8256474, -2.877256, 0, 1, 0.7607843, 1,
-0.07466632, -0.7764584, -2.682279, 0, 1, 0.7647059, 1,
-0.07108355, 0.6301703, 0.1156602, 0, 1, 0.772549, 1,
-0.05764785, 0.4642449, -1.747897, 0, 1, 0.7764706, 1,
-0.05613291, -0.9234987, -2.153152, 0, 1, 0.7843137, 1,
-0.04907837, 2.14451, -0.6056819, 0, 1, 0.7882353, 1,
-0.04800446, -0.1644709, -2.4585, 0, 1, 0.7960784, 1,
-0.04604379, -1.038352, -5.079379, 0, 1, 0.8039216, 1,
-0.04120319, -0.2454652, -2.55577, 0, 1, 0.8078431, 1,
-0.04014785, -0.2449408, -2.15521, 0, 1, 0.8156863, 1,
-0.0372476, -1.569168, -4.220263, 0, 1, 0.8196079, 1,
-0.03583784, -0.3445405, -1.800901, 0, 1, 0.827451, 1,
-0.03341449, -0.3310184, -3.592918, 0, 1, 0.8313726, 1,
-0.03191058, 0.9212144, 0.0669535, 0, 1, 0.8392157, 1,
-0.03043736, -1.458617, -2.03866, 0, 1, 0.8431373, 1,
-0.02995048, -0.1207994, -3.452639, 0, 1, 0.8509804, 1,
-0.02632478, 0.3605779, -0.4683806, 0, 1, 0.854902, 1,
-0.02605684, -0.1484144, -2.385611, 0, 1, 0.8627451, 1,
-0.02465741, 0.595394, -1.193458, 0, 1, 0.8666667, 1,
-0.02297782, -0.4867363, -3.526191, 0, 1, 0.8745098, 1,
-0.02217192, 0.8687297, 0.3990019, 0, 1, 0.8784314, 1,
-0.01999267, 0.2596781, -0.4829491, 0, 1, 0.8862745, 1,
-0.01867751, -0.1546386, -2.624305, 0, 1, 0.8901961, 1,
-0.01390401, 1.492451, 0.7143351, 0, 1, 0.8980392, 1,
-0.01358537, -0.3922253, -3.906243, 0, 1, 0.9058824, 1,
-0.01300059, 1.833533, 1.07378, 0, 1, 0.9098039, 1,
-0.01215048, -2.268426, -2.745756, 0, 1, 0.9176471, 1,
-0.008106294, 0.01883499, -0.08265424, 0, 1, 0.9215686, 1,
-0.007746544, 0.03123736, 1.01473, 0, 1, 0.9294118, 1,
-0.005379413, -1.084482, -2.015834, 0, 1, 0.9333333, 1,
-0.002010663, 0.578817, -1.638849, 0, 1, 0.9411765, 1,
-0.001443113, -0.8341346, -3.040853, 0, 1, 0.945098, 1,
0.0007916734, 0.6699089, 0.8843874, 0, 1, 0.9529412, 1,
0.003908086, 1.470702, -1.01808, 0, 1, 0.9568627, 1,
0.004705024, 0.6945191, 2.062306, 0, 1, 0.9647059, 1,
0.01056307, 1.016456, -0.9133861, 0, 1, 0.9686275, 1,
0.01286771, -0.3784831, 1.217234, 0, 1, 0.9764706, 1,
0.01287322, -0.3809371, 1.276204, 0, 1, 0.9803922, 1,
0.01343729, -0.4354886, 3.537784, 0, 1, 0.9882353, 1,
0.01508476, -0.4327355, 4.243968, 0, 1, 0.9921569, 1,
0.01569693, -0.7314739, 4.187726, 0, 1, 1, 1,
0.01579089, -0.6796997, 2.160661, 0, 0.9921569, 1, 1,
0.01686733, 0.405082, -0.04272919, 0, 0.9882353, 1, 1,
0.01798138, -1.103274, 2.614274, 0, 0.9803922, 1, 1,
0.01874821, 1.482542, -0.695769, 0, 0.9764706, 1, 1,
0.02258247, 1.510106, 1.125, 0, 0.9686275, 1, 1,
0.02547578, 0.223884, -0.1257467, 0, 0.9647059, 1, 1,
0.02669866, 0.1627092, 0.01333628, 0, 0.9568627, 1, 1,
0.03387249, 1.866853, 1.426628, 0, 0.9529412, 1, 1,
0.03947488, 0.4831096, 0.4550843, 0, 0.945098, 1, 1,
0.04314086, 0.0261685, 1.826558, 0, 0.9411765, 1, 1,
0.04550361, -0.9307406, 3.422699, 0, 0.9333333, 1, 1,
0.04565085, -0.8747315, 2.566261, 0, 0.9294118, 1, 1,
0.04709218, -1.245963, 2.136086, 0, 0.9215686, 1, 1,
0.04736859, -0.1975388, 3.017469, 0, 0.9176471, 1, 1,
0.05049028, 0.5635037, -1.265527, 0, 0.9098039, 1, 1,
0.05297505, 0.3750045, 1.235605, 0, 0.9058824, 1, 1,
0.05712527, -0.3751079, 3.005157, 0, 0.8980392, 1, 1,
0.07895366, 1.073172, -2.17066, 0, 0.8901961, 1, 1,
0.07995793, -0.02589053, 2.20441, 0, 0.8862745, 1, 1,
0.08209004, 1.895158, 1.555663, 0, 0.8784314, 1, 1,
0.08339624, 1.195091, -0.5826921, 0, 0.8745098, 1, 1,
0.08637136, -1.855541, 2.861832, 0, 0.8666667, 1, 1,
0.09088763, -0.2379957, 2.524846, 0, 0.8627451, 1, 1,
0.09396049, -0.5015652, 3.368054, 0, 0.854902, 1, 1,
0.09590723, 0.7905045, -0.01668776, 0, 0.8509804, 1, 1,
0.09773035, 0.555104, -0.2805392, 0, 0.8431373, 1, 1,
0.09803084, 0.140427, -0.3623928, 0, 0.8392157, 1, 1,
0.102309, 0.2938023, 0.4551403, 0, 0.8313726, 1, 1,
0.107224, 0.8784678, -0.3028361, 0, 0.827451, 1, 1,
0.1073716, 0.8166301, 1.330968, 0, 0.8196079, 1, 1,
0.1077663, -2.098507, 2.802461, 0, 0.8156863, 1, 1,
0.1091952, 0.6164399, -0.6573828, 0, 0.8078431, 1, 1,
0.1127477, -0.4740185, 3.667675, 0, 0.8039216, 1, 1,
0.1153957, -0.0003746943, -0.1247473, 0, 0.7960784, 1, 1,
0.1157245, -0.4786086, 2.987063, 0, 0.7882353, 1, 1,
0.1180621, -0.2612239, 2.417202, 0, 0.7843137, 1, 1,
0.1193042, -1.038569, 3.116632, 0, 0.7764706, 1, 1,
0.1249136, 0.1087901, 0.3101508, 0, 0.772549, 1, 1,
0.1249541, -0.814411, 1.579886, 0, 0.7647059, 1, 1,
0.1314544, -1.835559, 3.080475, 0, 0.7607843, 1, 1,
0.1408279, -0.1820108, 1.874404, 0, 0.7529412, 1, 1,
0.1474208, 0.5354976, -0.3470067, 0, 0.7490196, 1, 1,
0.1501488, -0.1328501, 2.106422, 0, 0.7411765, 1, 1,
0.1530148, -0.5846685, 2.441423, 0, 0.7372549, 1, 1,
0.1540371, -1.487516, 2.623872, 0, 0.7294118, 1, 1,
0.1553239, -1.111296, 2.71718, 0, 0.7254902, 1, 1,
0.1553925, 0.01353005, 1.92925, 0, 0.7176471, 1, 1,
0.1561069, 1.704131, 0.329068, 0, 0.7137255, 1, 1,
0.156292, 0.500036, -1.007092, 0, 0.7058824, 1, 1,
0.1582099, -1.699322, 3.666269, 0, 0.6980392, 1, 1,
0.1646024, 0.1622224, 1.486062, 0, 0.6941177, 1, 1,
0.1694161, 1.757438, -0.6275081, 0, 0.6862745, 1, 1,
0.175754, 1.243245, 1.665051, 0, 0.682353, 1, 1,
0.1781681, 0.5506455, 1.133552, 0, 0.6745098, 1, 1,
0.1829599, 0.9958779, -0.7537462, 0, 0.6705883, 1, 1,
0.1872474, 0.3561024, -0.05783445, 0, 0.6627451, 1, 1,
0.189544, 0.7234566, -0.2246212, 0, 0.6588235, 1, 1,
0.1900024, 0.1328771, 0.7833986, 0, 0.6509804, 1, 1,
0.1909858, 0.4085709, 0.8755693, 0, 0.6470588, 1, 1,
0.1953979, -0.4301873, 3.158271, 0, 0.6392157, 1, 1,
0.1974138, -0.08576851, 2.532483, 0, 0.6352941, 1, 1,
0.1995915, -0.4264399, 1.794937, 0, 0.627451, 1, 1,
0.2024493, -0.7960503, 2.911654, 0, 0.6235294, 1, 1,
0.2041302, 1.641522, 1.700908, 0, 0.6156863, 1, 1,
0.2060051, -0.9660296, 2.08358, 0, 0.6117647, 1, 1,
0.2069194, 0.6799862, -1.103064, 0, 0.6039216, 1, 1,
0.2085501, 0.09478372, 1.351829, 0, 0.5960785, 1, 1,
0.2100783, 0.2758946, 1.272701, 0, 0.5921569, 1, 1,
0.210386, 0.04071172, 1.245206, 0, 0.5843138, 1, 1,
0.2105585, 0.3848224, 1.02596, 0, 0.5803922, 1, 1,
0.2137036, -0.4273935, 2.781794, 0, 0.572549, 1, 1,
0.2248592, -0.1749788, 2.22438, 0, 0.5686275, 1, 1,
0.2262009, 0.2614553, 0.6547602, 0, 0.5607843, 1, 1,
0.2292099, 1.807092, 0.3811243, 0, 0.5568628, 1, 1,
0.2358193, 0.9984705, -1.630977, 0, 0.5490196, 1, 1,
0.2406701, 1.824682, 0.267323, 0, 0.5450981, 1, 1,
0.2410775, 0.9878598, 1.087808, 0, 0.5372549, 1, 1,
0.242854, 0.1905373, 2.009434, 0, 0.5333334, 1, 1,
0.2490766, -0.9787863, 4.37165, 0, 0.5254902, 1, 1,
0.2510364, -0.2660847, 2.027044, 0, 0.5215687, 1, 1,
0.2522224, -1.307892, 1.431513, 0, 0.5137255, 1, 1,
0.252425, -1.355855, 2.271973, 0, 0.509804, 1, 1,
0.2554197, -0.9605173, 2.960661, 0, 0.5019608, 1, 1,
0.2559269, 0.2385538, -0.2101082, 0, 0.4941176, 1, 1,
0.2575917, -0.8578678, 2.964313, 0, 0.4901961, 1, 1,
0.2577684, -0.800835, 2.161845, 0, 0.4823529, 1, 1,
0.2606308, -0.2398783, 1.295514, 0, 0.4784314, 1, 1,
0.2638936, -1.246545, 1.518795, 0, 0.4705882, 1, 1,
0.2642927, 1.338102, -1.376435, 0, 0.4666667, 1, 1,
0.269546, -0.1778374, 0.3845272, 0, 0.4588235, 1, 1,
0.2704139, -0.4714198, 2.801391, 0, 0.454902, 1, 1,
0.2830764, -0.6774842, 2.341579, 0, 0.4470588, 1, 1,
0.2870561, -0.4893126, 1.696108, 0, 0.4431373, 1, 1,
0.2898802, -2.281142, 3.886862, 0, 0.4352941, 1, 1,
0.2907744, -0.7582388, 2.74553, 0, 0.4313726, 1, 1,
0.2921664, 0.7162901, -1.319379, 0, 0.4235294, 1, 1,
0.2939012, -2.069658, 3.447856, 0, 0.4196078, 1, 1,
0.2941152, -0.8018101, 1.674536, 0, 0.4117647, 1, 1,
0.2965447, -0.9152518, 1.728243, 0, 0.4078431, 1, 1,
0.299643, 1.607622, 0.5438737, 0, 0.4, 1, 1,
0.3013028, -0.6396492, 2.599817, 0, 0.3921569, 1, 1,
0.3045705, -1.511423, 1.66217, 0, 0.3882353, 1, 1,
0.3080897, -0.7509968, 3.005276, 0, 0.3803922, 1, 1,
0.3106032, 1.061367, 0.1402664, 0, 0.3764706, 1, 1,
0.3132783, 0.5436673, 1.113209, 0, 0.3686275, 1, 1,
0.3158275, -0.4965588, 3.318588, 0, 0.3647059, 1, 1,
0.3166953, -0.3446225, 3.536623, 0, 0.3568628, 1, 1,
0.3190369, -0.8501417, 3.224085, 0, 0.3529412, 1, 1,
0.3205825, -1.288609, 2.952005, 0, 0.345098, 1, 1,
0.3233044, -0.9845846, 2.571467, 0, 0.3411765, 1, 1,
0.330328, -1.354171, 1.440392, 0, 0.3333333, 1, 1,
0.3331372, 0.2468901, 1.868297, 0, 0.3294118, 1, 1,
0.3344831, -0.4511529, 3.007949, 0, 0.3215686, 1, 1,
0.3389888, 0.5448962, -0.2363389, 0, 0.3176471, 1, 1,
0.3402984, -0.5051251, 1.950207, 0, 0.3098039, 1, 1,
0.3407677, -0.7229502, 2.244862, 0, 0.3058824, 1, 1,
0.3409332, -0.01745279, 3.430844, 0, 0.2980392, 1, 1,
0.3428772, 0.4791847, 0.3143523, 0, 0.2901961, 1, 1,
0.3441981, -1.760813, 2.620973, 0, 0.2862745, 1, 1,
0.345818, -0.5918261, 0.4809901, 0, 0.2784314, 1, 1,
0.3459038, -0.2477627, -0.09140116, 0, 0.2745098, 1, 1,
0.3463362, 0.2847245, 0.1647508, 0, 0.2666667, 1, 1,
0.3486171, -0.8973026, 3.520226, 0, 0.2627451, 1, 1,
0.3496374, -1.516728, 3.117817, 0, 0.254902, 1, 1,
0.3525536, -0.8525826, 3.722336, 0, 0.2509804, 1, 1,
0.3559459, 2.763897, 0.06977118, 0, 0.2431373, 1, 1,
0.3562133, 0.04001679, 3.285805, 0, 0.2392157, 1, 1,
0.3587589, 1.983066, 1.132497, 0, 0.2313726, 1, 1,
0.3587928, 0.02605301, 0.9292416, 0, 0.227451, 1, 1,
0.358848, -1.526697, 1.844119, 0, 0.2196078, 1, 1,
0.3618803, 0.149214, 2.321504, 0, 0.2156863, 1, 1,
0.3644985, -0.3059698, 2.60323, 0, 0.2078431, 1, 1,
0.3666756, -0.1536302, 2.872741, 0, 0.2039216, 1, 1,
0.3694854, 1.882918, -0.4868945, 0, 0.1960784, 1, 1,
0.3765967, 2.730655, -0.1898844, 0, 0.1882353, 1, 1,
0.3772273, -0.6123567, 2.555241, 0, 0.1843137, 1, 1,
0.3776142, 1.421161, 0.5480964, 0, 0.1764706, 1, 1,
0.3783022, 0.9739736, 0.4448349, 0, 0.172549, 1, 1,
0.3794328, 0.1771727, 0.136308, 0, 0.1647059, 1, 1,
0.382823, 2.041804, -0.7104145, 0, 0.1607843, 1, 1,
0.3829581, -0.7175574, 2.473827, 0, 0.1529412, 1, 1,
0.3837606, -1.326485, 2.799462, 0, 0.1490196, 1, 1,
0.3842309, -0.2550204, 1.819302, 0, 0.1411765, 1, 1,
0.3863521, 0.05948797, 1.881205, 0, 0.1372549, 1, 1,
0.3898679, -0.509991, 2.493735, 0, 0.1294118, 1, 1,
0.3921838, 0.03706671, 2.241413, 0, 0.1254902, 1, 1,
0.394516, 2.014623, -0.6472542, 0, 0.1176471, 1, 1,
0.3951766, -1.124814, 2.319082, 0, 0.1137255, 1, 1,
0.3967476, 0.3953265, -0.3313018, 0, 0.1058824, 1, 1,
0.3998717, 0.1793143, -0.2483017, 0, 0.09803922, 1, 1,
0.4054387, -0.4289712, 0.7153628, 0, 0.09411765, 1, 1,
0.4094423, -1.556292, 2.534309, 0, 0.08627451, 1, 1,
0.409859, -0.7073947, 3.988154, 0, 0.08235294, 1, 1,
0.4099093, 0.4010719, -0.896973, 0, 0.07450981, 1, 1,
0.4140069, 0.5486709, -0.4273531, 0, 0.07058824, 1, 1,
0.4179044, 0.3275232, 0.3988509, 0, 0.0627451, 1, 1,
0.4185077, -0.1283405, 2.882303, 0, 0.05882353, 1, 1,
0.4193393, -0.2112187, 0.9683577, 0, 0.05098039, 1, 1,
0.42079, 0.4162647, 0.6726809, 0, 0.04705882, 1, 1,
0.4291127, 0.1625841, 0.6781328, 0, 0.03921569, 1, 1,
0.4297193, 0.4590428, 2.9331, 0, 0.03529412, 1, 1,
0.4349719, -0.7402813, 3.251829, 0, 0.02745098, 1, 1,
0.438521, 0.4498511, 0.333309, 0, 0.02352941, 1, 1,
0.439135, -0.08116813, 1.872532, 0, 0.01568628, 1, 1,
0.4448865, 1.843763, -0.2152935, 0, 0.01176471, 1, 1,
0.4497122, 1.463466, -0.4794335, 0, 0.003921569, 1, 1,
0.4507933, -0.8846321, 3.437722, 0.003921569, 0, 1, 1,
0.4515493, -0.01343236, 1.784887, 0.007843138, 0, 1, 1,
0.4539723, 1.066777, 1.031003, 0.01568628, 0, 1, 1,
0.4609685, 0.3480813, -0.04199007, 0.01960784, 0, 1, 1,
0.4666, 0.8177131, -0.1158106, 0.02745098, 0, 1, 1,
0.4691286, 0.3000155, 1.055889, 0.03137255, 0, 1, 1,
0.4779581, 0.9850376, -0.1652429, 0.03921569, 0, 1, 1,
0.4802806, -0.4262467, 1.751933, 0.04313726, 0, 1, 1,
0.4827232, -0.4954784, 2.80599, 0.05098039, 0, 1, 1,
0.4837886, 0.5231589, 2.386529, 0.05490196, 0, 1, 1,
0.4900999, -0.4464443, 2.875669, 0.0627451, 0, 1, 1,
0.492072, -0.7509197, 2.068342, 0.06666667, 0, 1, 1,
0.4952157, -0.2724248, 3.801276, 0.07450981, 0, 1, 1,
0.502198, -0.08231598, 1.386116, 0.07843138, 0, 1, 1,
0.5025756, 1.242945, 1.766068, 0.08627451, 0, 1, 1,
0.5030648, -0.1226298, 2.424911, 0.09019608, 0, 1, 1,
0.5047109, 1.376054, 0.2024512, 0.09803922, 0, 1, 1,
0.5077802, -0.3238389, 2.504787, 0.1058824, 0, 1, 1,
0.5077885, -0.5966979, 4.37747, 0.1098039, 0, 1, 1,
0.5098674, 1.108328, 2.224233, 0.1176471, 0, 1, 1,
0.5185553, -0.9264472, 4.175256, 0.1215686, 0, 1, 1,
0.523641, 0.7009494, 1.404759, 0.1294118, 0, 1, 1,
0.5289497, 2.111657, 3.549955, 0.1333333, 0, 1, 1,
0.5304195, -0.2531437, 2.701399, 0.1411765, 0, 1, 1,
0.5386643, -1.856125, 2.14849, 0.145098, 0, 1, 1,
0.540355, 1.720203, 2.389031, 0.1529412, 0, 1, 1,
0.5407494, 1.082776, -1.198271, 0.1568628, 0, 1, 1,
0.5416839, 0.5537031, 1.462229, 0.1647059, 0, 1, 1,
0.5422039, -0.9047601, 2.544484, 0.1686275, 0, 1, 1,
0.5474296, 0.4821268, 1.128667, 0.1764706, 0, 1, 1,
0.5494103, -0.5051324, 1.432039, 0.1803922, 0, 1, 1,
0.5528203, -0.2889841, 2.780962, 0.1882353, 0, 1, 1,
0.5534962, -0.06924463, 1.13378, 0.1921569, 0, 1, 1,
0.5554648, -0.4762473, 2.298764, 0.2, 0, 1, 1,
0.5607458, -1.144189, 4.018901, 0.2078431, 0, 1, 1,
0.5613909, 1.068104, 0.2281415, 0.2117647, 0, 1, 1,
0.5637978, 0.9391341, 1.066617, 0.2196078, 0, 1, 1,
0.5665794, -0.893785, 3.032524, 0.2235294, 0, 1, 1,
0.5682581, 0.78999, 1.102961, 0.2313726, 0, 1, 1,
0.5741221, -1.610582, 3.560726, 0.2352941, 0, 1, 1,
0.5746552, 0.1358264, 3.714629, 0.2431373, 0, 1, 1,
0.5772209, 0.2359346, 0.3225853, 0.2470588, 0, 1, 1,
0.5821252, -0.3437504, 2.529066, 0.254902, 0, 1, 1,
0.5827535, 0.1952694, 0.6280174, 0.2588235, 0, 1, 1,
0.5831129, -0.8992301, 1.90607, 0.2666667, 0, 1, 1,
0.5846543, -0.5632048, 0.9574309, 0.2705882, 0, 1, 1,
0.5905427, -0.9673913, 1.421789, 0.2784314, 0, 1, 1,
0.5909031, 1.179905, -1.497244, 0.282353, 0, 1, 1,
0.5924518, 1.089038, 0.7147754, 0.2901961, 0, 1, 1,
0.5966802, -0.8955431, 1.89659, 0.2941177, 0, 1, 1,
0.5984641, 1.256697, -0.5993477, 0.3019608, 0, 1, 1,
0.6003571, -1.727002, 2.767585, 0.3098039, 0, 1, 1,
0.6122356, -1.194134, 2.831901, 0.3137255, 0, 1, 1,
0.6194822, 2.27959, -0.1199003, 0.3215686, 0, 1, 1,
0.62817, 1.974963, -1.89202, 0.3254902, 0, 1, 1,
0.6287351, -0.1461482, 2.95022, 0.3333333, 0, 1, 1,
0.6287575, 0.6701179, 2.028236, 0.3372549, 0, 1, 1,
0.6293323, -1.991491, 3.144126, 0.345098, 0, 1, 1,
0.6310068, -0.3683798, 2.264776, 0.3490196, 0, 1, 1,
0.6311973, -0.4954309, 1.915766, 0.3568628, 0, 1, 1,
0.634267, -0.55778, 3.751977, 0.3607843, 0, 1, 1,
0.6354282, -1.402735, 1.657822, 0.3686275, 0, 1, 1,
0.6381899, 0.2947924, -0.9632168, 0.372549, 0, 1, 1,
0.6389816, -0.2228072, 2.071818, 0.3803922, 0, 1, 1,
0.6403565, -0.6972185, 4.281591, 0.3843137, 0, 1, 1,
0.6424485, -0.2797876, 2.58539, 0.3921569, 0, 1, 1,
0.6434894, 0.4208677, 2.711596, 0.3960784, 0, 1, 1,
0.64434, 1.316589, -0.1059133, 0.4039216, 0, 1, 1,
0.6444476, -0.9910256, 3.407649, 0.4117647, 0, 1, 1,
0.653227, -0.2346642, 1.459683, 0.4156863, 0, 1, 1,
0.6534717, 1.29813, 0.02057153, 0.4235294, 0, 1, 1,
0.6541718, -1.248619, 4.812023, 0.427451, 0, 1, 1,
0.6556196, 0.4068072, 0.6290678, 0.4352941, 0, 1, 1,
0.6568709, 0.5034051, 0.9387919, 0.4392157, 0, 1, 1,
0.6576976, -1.611386, 1.452855, 0.4470588, 0, 1, 1,
0.6578506, -0.1983824, 1.595062, 0.4509804, 0, 1, 1,
0.6611483, -1.146871, 2.107275, 0.4588235, 0, 1, 1,
0.6617671, -0.8372132, 1.711033, 0.4627451, 0, 1, 1,
0.6622133, 1.136971, 1.47731, 0.4705882, 0, 1, 1,
0.6661112, 2.325056, 0.6118068, 0.4745098, 0, 1, 1,
0.6686208, -1.367005, 0.9308288, 0.4823529, 0, 1, 1,
0.6687908, 0.8833544, 2.201684, 0.4862745, 0, 1, 1,
0.6690052, -1.567906, 4.676804, 0.4941176, 0, 1, 1,
0.6768967, -0.03447612, 0.7799379, 0.5019608, 0, 1, 1,
0.678974, 0.9376225, -0.7315322, 0.5058824, 0, 1, 1,
0.6834582, -0.05876127, 0.9637592, 0.5137255, 0, 1, 1,
0.6904203, 1.749851, 1.852191, 0.5176471, 0, 1, 1,
0.6939709, 0.4303383, -0.302396, 0.5254902, 0, 1, 1,
0.6946284, -1.174069, 3.436944, 0.5294118, 0, 1, 1,
0.7032272, 1.946108, 1.214344, 0.5372549, 0, 1, 1,
0.7119787, 1.285136, 0.5206605, 0.5411765, 0, 1, 1,
0.7130898, -1.290695, 2.7451, 0.5490196, 0, 1, 1,
0.7153996, 0.3296695, 0.8364685, 0.5529412, 0, 1, 1,
0.7157666, 1.149812, -0.3183369, 0.5607843, 0, 1, 1,
0.7186457, 1.034157, 0.5550005, 0.5647059, 0, 1, 1,
0.7197005, 0.2400454, 1.819775, 0.572549, 0, 1, 1,
0.719793, 0.1816174, 0.1193688, 0.5764706, 0, 1, 1,
0.7213624, -1.296804, 2.611133, 0.5843138, 0, 1, 1,
0.7213956, -0.3311435, 1.646428, 0.5882353, 0, 1, 1,
0.7236193, 0.8781208, 0.8724838, 0.5960785, 0, 1, 1,
0.7278361, 1.248924, -0.2605136, 0.6039216, 0, 1, 1,
0.7300323, -1.071064, 4.630472, 0.6078432, 0, 1, 1,
0.7327248, 0.09747663, 0.8517483, 0.6156863, 0, 1, 1,
0.7337279, -0.1179457, 3.50943, 0.6196079, 0, 1, 1,
0.7361693, -1.196481, 2.405897, 0.627451, 0, 1, 1,
0.7365881, -0.08779364, 1.228808, 0.6313726, 0, 1, 1,
0.7390671, 0.3591834, 1.184862, 0.6392157, 0, 1, 1,
0.7421557, 0.009410461, 0.9318029, 0.6431373, 0, 1, 1,
0.7431805, 0.08357994, 1.848078, 0.6509804, 0, 1, 1,
0.7459283, -0.2564381, 1.855167, 0.654902, 0, 1, 1,
0.7471974, -0.2278045, -0.2946611, 0.6627451, 0, 1, 1,
0.7562606, 0.4201157, 3.386336, 0.6666667, 0, 1, 1,
0.7607689, -1.291369, 1.942061, 0.6745098, 0, 1, 1,
0.7718774, -2.093962, 1.335844, 0.6784314, 0, 1, 1,
0.7720409, -1.164744, 4.625398, 0.6862745, 0, 1, 1,
0.7779565, -0.567116, 2.241214, 0.6901961, 0, 1, 1,
0.7805749, -1.334543, 2.141212, 0.6980392, 0, 1, 1,
0.7828916, 0.7832768, 1.378009, 0.7058824, 0, 1, 1,
0.7855241, 0.5817196, 0.3482412, 0.7098039, 0, 1, 1,
0.8012304, -0.3101877, 2.842455, 0.7176471, 0, 1, 1,
0.8035552, -0.6837073, 1.698993, 0.7215686, 0, 1, 1,
0.8039513, -0.6255813, 1.58148, 0.7294118, 0, 1, 1,
0.806901, 0.7733604, -0.04871148, 0.7333333, 0, 1, 1,
0.8072237, 1.308669, 0.5246243, 0.7411765, 0, 1, 1,
0.8153172, -0.8800355, 2.509664, 0.7450981, 0, 1, 1,
0.8161647, -0.1716556, 2.188762, 0.7529412, 0, 1, 1,
0.8192161, -0.2726974, 1.792241, 0.7568628, 0, 1, 1,
0.8235879, -0.8471776, 2.349569, 0.7647059, 0, 1, 1,
0.8257393, 0.2188971, 0.9354164, 0.7686275, 0, 1, 1,
0.8285766, -0.6044701, 2.79045, 0.7764706, 0, 1, 1,
0.8287733, -0.0144079, -0.5768997, 0.7803922, 0, 1, 1,
0.8362647, 0.8713276, 0.7968326, 0.7882353, 0, 1, 1,
0.8372167, 0.03681267, 1.154875, 0.7921569, 0, 1, 1,
0.8413442, 0.4478015, 0.7939067, 0.8, 0, 1, 1,
0.8473564, -0.4404899, 1.396471, 0.8078431, 0, 1, 1,
0.8486398, 0.1061664, 0.2750143, 0.8117647, 0, 1, 1,
0.8585874, -1.995002, 1.960939, 0.8196079, 0, 1, 1,
0.860458, -0.4973817, 2.770263, 0.8235294, 0, 1, 1,
0.8624326, -0.8971202, 2.006379, 0.8313726, 0, 1, 1,
0.8671909, -0.3430308, 1.042433, 0.8352941, 0, 1, 1,
0.8681598, -0.3856264, 3.968204, 0.8431373, 0, 1, 1,
0.8708366, -0.5949557, 1.729845, 0.8470588, 0, 1, 1,
0.8755807, -0.595843, 1.638861, 0.854902, 0, 1, 1,
0.8774802, -0.4901718, 2.939881, 0.8588235, 0, 1, 1,
0.8787152, 1.035662, 2.340918, 0.8666667, 0, 1, 1,
0.8788285, -1.332026, 2.188127, 0.8705882, 0, 1, 1,
0.8795549, 1.367296, -0.1697816, 0.8784314, 0, 1, 1,
0.882695, 2.02109, -0.2383855, 0.8823529, 0, 1, 1,
0.8872621, 1.164202, 1.409207, 0.8901961, 0, 1, 1,
0.8892333, 0.5664651, 1.001316, 0.8941177, 0, 1, 1,
0.8906518, 1.1107, 0.687011, 0.9019608, 0, 1, 1,
0.8975527, -1.281991, 4.031194, 0.9098039, 0, 1, 1,
0.8976226, 0.2860554, 0.9209064, 0.9137255, 0, 1, 1,
0.9037116, 0.7957923, -0.6753662, 0.9215686, 0, 1, 1,
0.9108121, 1.20189, 0.2641513, 0.9254902, 0, 1, 1,
0.9155734, 0.4919838, -0.2954049, 0.9333333, 0, 1, 1,
0.9177561, 0.03423965, 1.986861, 0.9372549, 0, 1, 1,
0.9185743, -0.4341726, 2.174634, 0.945098, 0, 1, 1,
0.9284913, -0.7661569, 4.445483, 0.9490196, 0, 1, 1,
0.9313597, -0.4987792, 4.192688, 0.9568627, 0, 1, 1,
0.9324414, 0.1508148, 0.9655191, 0.9607843, 0, 1, 1,
0.9329057, -0.9042028, 4.101705, 0.9686275, 0, 1, 1,
0.9342644, -0.8460751, 1.336303, 0.972549, 0, 1, 1,
0.9388861, -0.7938787, 1.993272, 0.9803922, 0, 1, 1,
0.9453543, 1.034363, 0.8027868, 0.9843137, 0, 1, 1,
0.9465829, -0.9896342, 2.513232, 0.9921569, 0, 1, 1,
0.9564644, 0.2049863, 1.779988, 0.9960784, 0, 1, 1,
0.9564899, 1.098213, 1.439221, 1, 0, 0.9960784, 1,
0.9588796, 1.099088, 1.025562, 1, 0, 0.9882353, 1,
0.9590647, -1.908581, 2.680952, 1, 0, 0.9843137, 1,
0.9679101, -0.1091482, 2.203141, 1, 0, 0.9764706, 1,
0.970596, -1.882127, 1.9704, 1, 0, 0.972549, 1,
0.9722831, 0.8559711, 0.6566814, 1, 0, 0.9647059, 1,
0.9751655, 0.2233606, 1.876891, 1, 0, 0.9607843, 1,
0.9789979, -0.08087352, 2.599803, 1, 0, 0.9529412, 1,
0.9806706, 0.8596449, 2.177365, 1, 0, 0.9490196, 1,
0.9864618, 0.517133, 1.058925, 1, 0, 0.9411765, 1,
0.9957483, -0.3419217, 2.043058, 1, 0, 0.9372549, 1,
0.9969538, -0.183181, 2.731466, 1, 0, 0.9294118, 1,
0.999809, 0.4824553, 0.9726437, 1, 0, 0.9254902, 1,
1.00324, 1.501458, 2.142366, 1, 0, 0.9176471, 1,
1.005063, 0.05744015, 1.233321, 1, 0, 0.9137255, 1,
1.009841, 0.3628461, 0.3906446, 1, 0, 0.9058824, 1,
1.011702, 1.731708, 0.5817436, 1, 0, 0.9019608, 1,
1.014445, -0.4109282, 1.664884, 1, 0, 0.8941177, 1,
1.022686, -1.15338, 4.305071, 1, 0, 0.8862745, 1,
1.023195, -1.363516, 1.636006, 1, 0, 0.8823529, 1,
1.027358, -1.055246, 1.730017, 1, 0, 0.8745098, 1,
1.034843, -1.066585, 3.487391, 1, 0, 0.8705882, 1,
1.037067, 0.5761354, 0.1464663, 1, 0, 0.8627451, 1,
1.037203, 2.241944, -0.6809134, 1, 0, 0.8588235, 1,
1.040117, 0.271168, 1.318715, 1, 0, 0.8509804, 1,
1.040447, 0.7671515, 0.06908143, 1, 0, 0.8470588, 1,
1.041635, 0.05169581, 1.039682, 1, 0, 0.8392157, 1,
1.057738, 0.04135374, 0.5144355, 1, 0, 0.8352941, 1,
1.060565, -1.166074, 2.016199, 1, 0, 0.827451, 1,
1.081149, 0.3196258, 0.6500915, 1, 0, 0.8235294, 1,
1.088398, -0.2840372, 1.356541, 1, 0, 0.8156863, 1,
1.104036, -0.7958525, 3.006045, 1, 0, 0.8117647, 1,
1.121114, -0.8310718, 2.821166, 1, 0, 0.8039216, 1,
1.121862, 1.361347, -0.4079421, 1, 0, 0.7960784, 1,
1.126026, -1.133063, 3.941667, 1, 0, 0.7921569, 1,
1.129252, 1.649113, -0.4576347, 1, 0, 0.7843137, 1,
1.132506, 0.3008568, 1.285738, 1, 0, 0.7803922, 1,
1.133842, -0.9966872, 2.113487, 1, 0, 0.772549, 1,
1.144253, 0.494635, 2.398869, 1, 0, 0.7686275, 1,
1.144408, -0.69602, 1.207661, 1, 0, 0.7607843, 1,
1.145467, 0.2473216, 1.680096, 1, 0, 0.7568628, 1,
1.153401, -1.457304, 3.302862, 1, 0, 0.7490196, 1,
1.154192, -1.048019, 1.541316, 1, 0, 0.7450981, 1,
1.156098, -0.2287676, 2.595417, 1, 0, 0.7372549, 1,
1.165064, 0.1272276, 0.04261728, 1, 0, 0.7333333, 1,
1.16799, 0.4634548, -0.3647012, 1, 0, 0.7254902, 1,
1.170073, -2.077463, 3.334654, 1, 0, 0.7215686, 1,
1.172442, -1.485616, 1.56426, 1, 0, 0.7137255, 1,
1.180618, -0.5398661, 4.299591, 1, 0, 0.7098039, 1,
1.180658, 0.01096911, 2.042952, 1, 0, 0.7019608, 1,
1.186049, -0.2045144, 0.1013271, 1, 0, 0.6941177, 1,
1.190667, 2.387979, 1.228051, 1, 0, 0.6901961, 1,
1.193034, 0.6205744, 1.199815, 1, 0, 0.682353, 1,
1.200606, -0.3761512, 1.923748, 1, 0, 0.6784314, 1,
1.201982, 0.06243042, 1.827193, 1, 0, 0.6705883, 1,
1.202199, 1.199907, 0.148692, 1, 0, 0.6666667, 1,
1.206261, 0.2540901, 1.503319, 1, 0, 0.6588235, 1,
1.206261, -0.4175462, 2.684009, 1, 0, 0.654902, 1,
1.236114, -1.424896, 1.147131, 1, 0, 0.6470588, 1,
1.243445, -0.2789075, 1.204316, 1, 0, 0.6431373, 1,
1.243683, -0.9088976, 3.535326, 1, 0, 0.6352941, 1,
1.243942, 0.4175175, 1.192476, 1, 0, 0.6313726, 1,
1.252163, -0.2024662, 1.593552, 1, 0, 0.6235294, 1,
1.258593, 0.8969973, 1.107789, 1, 0, 0.6196079, 1,
1.26301, 0.7056252, 0.8347178, 1, 0, 0.6117647, 1,
1.264605, 0.9245031, 1.242043, 1, 0, 0.6078432, 1,
1.269247, -0.9429651, 2.085108, 1, 0, 0.6, 1,
1.272227, 0.5856015, -0.7270577, 1, 0, 0.5921569, 1,
1.284657, -0.7854013, 2.002166, 1, 0, 0.5882353, 1,
1.285357, 1.297717, 0.09894472, 1, 0, 0.5803922, 1,
1.29331, -0.8562229, 2.673894, 1, 0, 0.5764706, 1,
1.294846, -0.9778757, 4.004229, 1, 0, 0.5686275, 1,
1.296115, 0.2362983, 0.4392444, 1, 0, 0.5647059, 1,
1.30396, -0.1620969, 1.008217, 1, 0, 0.5568628, 1,
1.30698, 0.9352198, 0.6945789, 1, 0, 0.5529412, 1,
1.30775, 2.153692, -0.2685376, 1, 0, 0.5450981, 1,
1.313395, 0.5742927, 2.178807, 1, 0, 0.5411765, 1,
1.319807, -0.7726057, -0.7260029, 1, 0, 0.5333334, 1,
1.330656, -1.77087, 2.443802, 1, 0, 0.5294118, 1,
1.332253, 1.172952, 3.095644, 1, 0, 0.5215687, 1,
1.33463, -0.3150189, 0.2576424, 1, 0, 0.5176471, 1,
1.345676, -0.7339882, -0.4396991, 1, 0, 0.509804, 1,
1.349913, 0.4705154, 0.2958004, 1, 0, 0.5058824, 1,
1.352265, 0.1577582, 2.238818, 1, 0, 0.4980392, 1,
1.363477, -1.176926, 1.148432, 1, 0, 0.4901961, 1,
1.370725, 1.420658, 1.334558, 1, 0, 0.4862745, 1,
1.372512, 0.7473363, 1.696263, 1, 0, 0.4784314, 1,
1.373369, -1.877862, 2.115935, 1, 0, 0.4745098, 1,
1.374285, -0.02229663, 4.026212, 1, 0, 0.4666667, 1,
1.379628, -0.2513889, 1.164664, 1, 0, 0.4627451, 1,
1.393858, 0.1249057, 1.180356, 1, 0, 0.454902, 1,
1.405738, 1.730239, 0.3524713, 1, 0, 0.4509804, 1,
1.423026, 1.569613, 1.439592, 1, 0, 0.4431373, 1,
1.429125, 2.033742, 0.803775, 1, 0, 0.4392157, 1,
1.431537, 1.144466, 1.080972, 1, 0, 0.4313726, 1,
1.441727, -0.02929496, 2.364875, 1, 0, 0.427451, 1,
1.443819, -0.1919972, 2.062068, 1, 0, 0.4196078, 1,
1.444532, -1.573931, 1.798719, 1, 0, 0.4156863, 1,
1.450787, 0.8833605, 0.5395011, 1, 0, 0.4078431, 1,
1.450857, 1.850214, 1.233668, 1, 0, 0.4039216, 1,
1.455509, -1.512051, 1.978136, 1, 0, 0.3960784, 1,
1.472098, 0.5575083, 0.5999925, 1, 0, 0.3882353, 1,
1.477837, -0.8647999, 2.883193, 1, 0, 0.3843137, 1,
1.47909, -1.536247, 0.7558082, 1, 0, 0.3764706, 1,
1.483207, -0.2439435, 1.991026, 1, 0, 0.372549, 1,
1.497181, 1.529189, 1.792468, 1, 0, 0.3647059, 1,
1.501385, -1.066083, 2.30072, 1, 0, 0.3607843, 1,
1.50263, -0.6048841, 3.208856, 1, 0, 0.3529412, 1,
1.512594, -0.8603108, 2.723661, 1, 0, 0.3490196, 1,
1.528851, -1.019869, 2.872485, 1, 0, 0.3411765, 1,
1.538931, 0.4383807, 0.4743869, 1, 0, 0.3372549, 1,
1.542742, -0.6322339, 3.032588, 1, 0, 0.3294118, 1,
1.563253, 0.3071223, 0.1830884, 1, 0, 0.3254902, 1,
1.577185, 0.08820871, 0.4179419, 1, 0, 0.3176471, 1,
1.584983, 0.8101988, 1.424874, 1, 0, 0.3137255, 1,
1.590384, -1.64178, 2.604394, 1, 0, 0.3058824, 1,
1.592417, 0.5956452, 0.4884382, 1, 0, 0.2980392, 1,
1.592983, -0.8936929, 1.48907, 1, 0, 0.2941177, 1,
1.601038, 0.7361729, 1.251052, 1, 0, 0.2862745, 1,
1.606398, -0.218158, 2.361687, 1, 0, 0.282353, 1,
1.610527, -1.455343, 3.062357, 1, 0, 0.2745098, 1,
1.613939, 0.4123206, -1.211299, 1, 0, 0.2705882, 1,
1.626062, 0.4681927, 0.4500351, 1, 0, 0.2627451, 1,
1.634687, 1.265432, 1.016077, 1, 0, 0.2588235, 1,
1.64949, 1.944555, 1.947735, 1, 0, 0.2509804, 1,
1.650796, 1.181506, 0.4684642, 1, 0, 0.2470588, 1,
1.668971, -0.0933219, 0.5164649, 1, 0, 0.2392157, 1,
1.67782, -0.2979503, 1.606085, 1, 0, 0.2352941, 1,
1.680994, -0.1272488, 2.13602, 1, 0, 0.227451, 1,
1.681208, 1.268514, 1.989759, 1, 0, 0.2235294, 1,
1.714368, -0.03621525, -0.2214426, 1, 0, 0.2156863, 1,
1.736185, -1.449883, 0.9311176, 1, 0, 0.2117647, 1,
1.740714, -0.09704646, 0.2258177, 1, 0, 0.2039216, 1,
1.741697, 0.6058869, 0.4805584, 1, 0, 0.1960784, 1,
1.752636, -0.829726, 3.608145, 1, 0, 0.1921569, 1,
1.768696, 0.1632802, 2.277196, 1, 0, 0.1843137, 1,
1.771656, -0.3037241, 3.083699, 1, 0, 0.1803922, 1,
1.80085, 1.107322, 0.8433979, 1, 0, 0.172549, 1,
1.817799, -0.06865281, 1.947068, 1, 0, 0.1686275, 1,
1.832154, -0.06956494, 2.81827, 1, 0, 0.1607843, 1,
1.832776, -0.04328595, 1.435182, 1, 0, 0.1568628, 1,
1.835114, 0.04834387, 0.4220945, 1, 0, 0.1490196, 1,
1.880629, -0.6954415, 3.60007, 1, 0, 0.145098, 1,
1.880995, 0.4261135, 0.9327325, 1, 0, 0.1372549, 1,
1.89775, 0.07062486, 1.880441, 1, 0, 0.1333333, 1,
1.904553, -0.08805905, 1.234967, 1, 0, 0.1254902, 1,
1.932127, -0.5330216, 2.577551, 1, 0, 0.1215686, 1,
1.980857, -1.41767, 2.410712, 1, 0, 0.1137255, 1,
2.018835, 1.047993, 3.313867, 1, 0, 0.1098039, 1,
2.072144, -0.4089482, 2.562186, 1, 0, 0.1019608, 1,
2.080035, -1.693999, 1.767465, 1, 0, 0.09411765, 1,
2.089262, 0.918187, 1.775078, 1, 0, 0.09019608, 1,
2.099962, 0.6779213, 1.028327, 1, 0, 0.08235294, 1,
2.128282, -2.126979, 2.117431, 1, 0, 0.07843138, 1,
2.165652, 0.8652949, 1.796349, 1, 0, 0.07058824, 1,
2.170892, 0.03739412, 1.415812, 1, 0, 0.06666667, 1,
2.171149, 1.222297, 1.139012, 1, 0, 0.05882353, 1,
2.196272, 2.843609, 0.8358431, 1, 0, 0.05490196, 1,
2.250855, -0.5080875, 0.4711777, 1, 0, 0.04705882, 1,
2.427496, -0.3029002, 0.2834762, 1, 0, 0.04313726, 1,
2.489151, 0.7213278, 0.8925192, 1, 0, 0.03529412, 1,
2.492269, 1.217893, 0.532655, 1, 0, 0.03137255, 1,
2.877102, 0.3591268, -0.007910782, 1, 0, 0.02352941, 1,
2.960729, -0.995079, 3.352268, 1, 0, 0.01960784, 1,
3.347183, 1.910561, 0.7457446, 1, 0, 0.01176471, 1,
3.395832, -0.6490779, 2.262322, 1, 0, 0.007843138, 1
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
0.153514, -3.850036, -6.755972, 0, -0.5, 0.5, 0.5,
0.153514, -3.850036, -6.755972, 1, -0.5, 0.5, 0.5,
0.153514, -3.850036, -6.755972, 1, 1.5, 0.5, 0.5,
0.153514, -3.850036, -6.755972, 0, 1.5, 0.5, 0.5
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
-4.18795, 0.07254994, -6.755972, 0, -0.5, 0.5, 0.5,
-4.18795, 0.07254994, -6.755972, 1, -0.5, 0.5, 0.5,
-4.18795, 0.07254994, -6.755972, 1, 1.5, 0.5, 0.5,
-4.18795, 0.07254994, -6.755972, 0, 1.5, 0.5, 0.5
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
-4.18795, -3.850036, -0.133678, 0, -0.5, 0.5, 0.5,
-4.18795, -3.850036, -0.133678, 1, -0.5, 0.5, 0.5,
-4.18795, -3.850036, -0.133678, 1, 1.5, 0.5, 0.5,
-4.18795, -3.850036, -0.133678, 0, 1.5, 0.5, 0.5
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
-3, -2.944824, -5.22775,
3, -2.944824, -5.22775,
-3, -2.944824, -5.22775,
-3, -3.095692, -5.482454,
-2, -2.944824, -5.22775,
-2, -3.095692, -5.482454,
-1, -2.944824, -5.22775,
-1, -3.095692, -5.482454,
0, -2.944824, -5.22775,
0, -3.095692, -5.482454,
1, -2.944824, -5.22775,
1, -3.095692, -5.482454,
2, -2.944824, -5.22775,
2, -3.095692, -5.482454,
3, -2.944824, -5.22775,
3, -3.095692, -5.482454
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
-3, -3.39743, -5.991861, 0, -0.5, 0.5, 0.5,
-3, -3.39743, -5.991861, 1, -0.5, 0.5, 0.5,
-3, -3.39743, -5.991861, 1, 1.5, 0.5, 0.5,
-3, -3.39743, -5.991861, 0, 1.5, 0.5, 0.5,
-2, -3.39743, -5.991861, 0, -0.5, 0.5, 0.5,
-2, -3.39743, -5.991861, 1, -0.5, 0.5, 0.5,
-2, -3.39743, -5.991861, 1, 1.5, 0.5, 0.5,
-2, -3.39743, -5.991861, 0, 1.5, 0.5, 0.5,
-1, -3.39743, -5.991861, 0, -0.5, 0.5, 0.5,
-1, -3.39743, -5.991861, 1, -0.5, 0.5, 0.5,
-1, -3.39743, -5.991861, 1, 1.5, 0.5, 0.5,
-1, -3.39743, -5.991861, 0, 1.5, 0.5, 0.5,
0, -3.39743, -5.991861, 0, -0.5, 0.5, 0.5,
0, -3.39743, -5.991861, 1, -0.5, 0.5, 0.5,
0, -3.39743, -5.991861, 1, 1.5, 0.5, 0.5,
0, -3.39743, -5.991861, 0, 1.5, 0.5, 0.5,
1, -3.39743, -5.991861, 0, -0.5, 0.5, 0.5,
1, -3.39743, -5.991861, 1, -0.5, 0.5, 0.5,
1, -3.39743, -5.991861, 1, 1.5, 0.5, 0.5,
1, -3.39743, -5.991861, 0, 1.5, 0.5, 0.5,
2, -3.39743, -5.991861, 0, -0.5, 0.5, 0.5,
2, -3.39743, -5.991861, 1, -0.5, 0.5, 0.5,
2, -3.39743, -5.991861, 1, 1.5, 0.5, 0.5,
2, -3.39743, -5.991861, 0, 1.5, 0.5, 0.5,
3, -3.39743, -5.991861, 0, -0.5, 0.5, 0.5,
3, -3.39743, -5.991861, 1, -0.5, 0.5, 0.5,
3, -3.39743, -5.991861, 1, 1.5, 0.5, 0.5,
3, -3.39743, -5.991861, 0, 1.5, 0.5, 0.5
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
-3.186074, -2, -5.22775,
-3.186074, 3, -5.22775,
-3.186074, -2, -5.22775,
-3.353053, -2, -5.482454,
-3.186074, -1, -5.22775,
-3.353053, -1, -5.482454,
-3.186074, 0, -5.22775,
-3.353053, 0, -5.482454,
-3.186074, 1, -5.22775,
-3.353053, 1, -5.482454,
-3.186074, 2, -5.22775,
-3.353053, 2, -5.482454,
-3.186074, 3, -5.22775,
-3.353053, 3, -5.482454
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
-3.687012, -2, -5.991861, 0, -0.5, 0.5, 0.5,
-3.687012, -2, -5.991861, 1, -0.5, 0.5, 0.5,
-3.687012, -2, -5.991861, 1, 1.5, 0.5, 0.5,
-3.687012, -2, -5.991861, 0, 1.5, 0.5, 0.5,
-3.687012, -1, -5.991861, 0, -0.5, 0.5, 0.5,
-3.687012, -1, -5.991861, 1, -0.5, 0.5, 0.5,
-3.687012, -1, -5.991861, 1, 1.5, 0.5, 0.5,
-3.687012, -1, -5.991861, 0, 1.5, 0.5, 0.5,
-3.687012, 0, -5.991861, 0, -0.5, 0.5, 0.5,
-3.687012, 0, -5.991861, 1, -0.5, 0.5, 0.5,
-3.687012, 0, -5.991861, 1, 1.5, 0.5, 0.5,
-3.687012, 0, -5.991861, 0, 1.5, 0.5, 0.5,
-3.687012, 1, -5.991861, 0, -0.5, 0.5, 0.5,
-3.687012, 1, -5.991861, 1, -0.5, 0.5, 0.5,
-3.687012, 1, -5.991861, 1, 1.5, 0.5, 0.5,
-3.687012, 1, -5.991861, 0, 1.5, 0.5, 0.5,
-3.687012, 2, -5.991861, 0, -0.5, 0.5, 0.5,
-3.687012, 2, -5.991861, 1, -0.5, 0.5, 0.5,
-3.687012, 2, -5.991861, 1, 1.5, 0.5, 0.5,
-3.687012, 2, -5.991861, 0, 1.5, 0.5, 0.5,
-3.687012, 3, -5.991861, 0, -0.5, 0.5, 0.5,
-3.687012, 3, -5.991861, 1, -0.5, 0.5, 0.5,
-3.687012, 3, -5.991861, 1, 1.5, 0.5, 0.5,
-3.687012, 3, -5.991861, 0, 1.5, 0.5, 0.5
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
-3.186074, -2.944824, -4,
-3.186074, -2.944824, 4,
-3.186074, -2.944824, -4,
-3.353053, -3.095692, -4,
-3.186074, -2.944824, -2,
-3.353053, -3.095692, -2,
-3.186074, -2.944824, 0,
-3.353053, -3.095692, 0,
-3.186074, -2.944824, 2,
-3.353053, -3.095692, 2,
-3.186074, -2.944824, 4,
-3.353053, -3.095692, 4
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
-3.687012, -3.39743, -4, 0, -0.5, 0.5, 0.5,
-3.687012, -3.39743, -4, 1, -0.5, 0.5, 0.5,
-3.687012, -3.39743, -4, 1, 1.5, 0.5, 0.5,
-3.687012, -3.39743, -4, 0, 1.5, 0.5, 0.5,
-3.687012, -3.39743, -2, 0, -0.5, 0.5, 0.5,
-3.687012, -3.39743, -2, 1, -0.5, 0.5, 0.5,
-3.687012, -3.39743, -2, 1, 1.5, 0.5, 0.5,
-3.687012, -3.39743, -2, 0, 1.5, 0.5, 0.5,
-3.687012, -3.39743, 0, 0, -0.5, 0.5, 0.5,
-3.687012, -3.39743, 0, 1, -0.5, 0.5, 0.5,
-3.687012, -3.39743, 0, 1, 1.5, 0.5, 0.5,
-3.687012, -3.39743, 0, 0, 1.5, 0.5, 0.5,
-3.687012, -3.39743, 2, 0, -0.5, 0.5, 0.5,
-3.687012, -3.39743, 2, 1, -0.5, 0.5, 0.5,
-3.687012, -3.39743, 2, 1, 1.5, 0.5, 0.5,
-3.687012, -3.39743, 2, 0, 1.5, 0.5, 0.5,
-3.687012, -3.39743, 4, 0, -0.5, 0.5, 0.5,
-3.687012, -3.39743, 4, 1, -0.5, 0.5, 0.5,
-3.687012, -3.39743, 4, 1, 1.5, 0.5, 0.5,
-3.687012, -3.39743, 4, 0, 1.5, 0.5, 0.5
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
-3.186074, -2.944824, -5.22775,
-3.186074, 3.089924, -5.22775,
-3.186074, -2.944824, 4.960394,
-3.186074, 3.089924, 4.960394,
-3.186074, -2.944824, -5.22775,
-3.186074, -2.944824, 4.960394,
-3.186074, 3.089924, -5.22775,
-3.186074, 3.089924, 4.960394,
-3.186074, -2.944824, -5.22775,
3.493102, -2.944824, -5.22775,
-3.186074, -2.944824, 4.960394,
3.493102, -2.944824, 4.960394,
-3.186074, 3.089924, -5.22775,
3.493102, 3.089924, -5.22775,
-3.186074, 3.089924, 4.960394,
3.493102, 3.089924, 4.960394,
3.493102, -2.944824, -5.22775,
3.493102, 3.089924, -5.22775,
3.493102, -2.944824, 4.960394,
3.493102, 3.089924, 4.960394,
3.493102, -2.944824, -5.22775,
3.493102, -2.944824, 4.960394,
3.493102, 3.089924, -5.22775,
3.493102, 3.089924, 4.960394
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
var radius = 7.259541;
var distance = 32.29852;
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
mvMatrix.translate( -0.153514, -0.07254994, 0.133678 );
mvMatrix.scale( 1.175169, 1.300661, 0.7704208 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.29852);
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
Talstar<-read.table("Talstar.xyz")
```

```
## Error in read.table("Talstar.xyz"): no lines available in input
```

```r
x<-Talstar$V2
```

```
## Error in eval(expr, envir, enclos): object 'Talstar' not found
```

```r
y<-Talstar$V3
```

```
## Error in eval(expr, envir, enclos): object 'Talstar' not found
```

```r
z<-Talstar$V4
```

```
## Error in eval(expr, envir, enclos): object 'Talstar' not found
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
-3.088804, -0.3647309, 1.411473, 0, 0, 1, 1, 1,
-2.730268, -0.317447, -1.996991, 1, 0, 0, 1, 1,
-2.647475, -0.6951247, -0.7158441, 1, 0, 0, 1, 1,
-2.607814, -0.3368641, -0.736878, 1, 0, 0, 1, 1,
-2.607311, 1.252725, -1.302686, 1, 0, 0, 1, 1,
-2.50606, -1.189926, -2.408117, 1, 0, 0, 1, 1,
-2.50032, -0.3285628, -0.9669286, 0, 0, 0, 1, 1,
-2.49318, -0.402767, -1.41821, 0, 0, 0, 1, 1,
-2.411924, -0.2378612, -2.508704, 0, 0, 0, 1, 1,
-2.280784, 0.1025869, -2.039915, 0, 0, 0, 1, 1,
-2.171126, -0.9757433, -2.452014, 0, 0, 0, 1, 1,
-2.168825, -0.1699042, -1.721488, 0, 0, 0, 1, 1,
-2.141572, -0.5820852, -2.668761, 0, 0, 0, 1, 1,
-2.108181, -0.4386461, -1.943358, 1, 1, 1, 1, 1,
-2.105932, 1.251523, -1.042082, 1, 1, 1, 1, 1,
-2.073473, -1.264536, -1.390616, 1, 1, 1, 1, 1,
-2.071998, 0.2450773, 0.08990069, 1, 1, 1, 1, 1,
-2.065464, 0.7482541, -2.871173, 1, 1, 1, 1, 1,
-2.029326, -0.1671933, -2.513891, 1, 1, 1, 1, 1,
-1.996644, 2.188978, -1.077503, 1, 1, 1, 1, 1,
-1.982628, -0.1640992, -2.090672, 1, 1, 1, 1, 1,
-1.953366, 0.3259928, -1.120192, 1, 1, 1, 1, 1,
-1.939477, -0.24743, -3.253582, 1, 1, 1, 1, 1,
-1.919382, -0.1011641, -1.537013, 1, 1, 1, 1, 1,
-1.907628, 0.3528441, -2.066397, 1, 1, 1, 1, 1,
-1.872888, -0.1661553, -0.6586648, 1, 1, 1, 1, 1,
-1.872603, 0.8661754, -0.4309375, 1, 1, 1, 1, 1,
-1.826751, -2.716558, -2.302624, 1, 1, 1, 1, 1,
-1.824691, -0.8669248, -2.078011, 0, 0, 1, 1, 1,
-1.809495, 1.164085, 0.5787811, 1, 0, 0, 1, 1,
-1.80681, -0.4411547, -2.93729, 1, 0, 0, 1, 1,
-1.787812, -0.6919869, -1.416857, 1, 0, 0, 1, 1,
-1.754631, -0.8090341, -3.250947, 1, 0, 0, 1, 1,
-1.749995, -1.01266, -2.294356, 1, 0, 0, 1, 1,
-1.748541, 0.1354696, -2.77814, 0, 0, 0, 1, 1,
-1.730049, 1.652132, -0.8102438, 0, 0, 0, 1, 1,
-1.729158, -0.5953618, -2.489135, 0, 0, 0, 1, 1,
-1.722454, 1.062962, -1.52933, 0, 0, 0, 1, 1,
-1.718118, -0.8289647, -2.647972, 0, 0, 0, 1, 1,
-1.692194, 1.316772, -0.6930864, 0, 0, 0, 1, 1,
-1.669369, -0.8537157, -1.463332, 0, 0, 0, 1, 1,
-1.646294, -0.943424, -0.4752001, 1, 1, 1, 1, 1,
-1.642891, 1.369179, -0.4574445, 1, 1, 1, 1, 1,
-1.642433, -1.289538, -1.606745, 1, 1, 1, 1, 1,
-1.626698, 1.107047, -2.134766, 1, 1, 1, 1, 1,
-1.624465, -0.8921229, -0.8614301, 1, 1, 1, 1, 1,
-1.595864, -1.965213, -2.121021, 1, 1, 1, 1, 1,
-1.59552, -2.856939, -1.730962, 1, 1, 1, 1, 1,
-1.578214, -0.6508411, 0.1459094, 1, 1, 1, 1, 1,
-1.561173, 0.05318964, -1.642751, 1, 1, 1, 1, 1,
-1.553198, 1.09798, -2.04307, 1, 1, 1, 1, 1,
-1.541405, 1.429384, -1.531654, 1, 1, 1, 1, 1,
-1.538924, -1.385766, -1.735909, 1, 1, 1, 1, 1,
-1.530586, -0.6067223, -1.839053, 1, 1, 1, 1, 1,
-1.523515, 1.370434, -0.149016, 1, 1, 1, 1, 1,
-1.522263, -0.06899846, -0.6881182, 1, 1, 1, 1, 1,
-1.51429, -0.4231679, -2.386797, 0, 0, 1, 1, 1,
-1.509764, -0.1477686, -0.2103506, 1, 0, 0, 1, 1,
-1.508603, 0.5917624, -0.6538637, 1, 0, 0, 1, 1,
-1.505963, -0.0697024, -2.101104, 1, 0, 0, 1, 1,
-1.497776, -0.518835, -1.018216, 1, 0, 0, 1, 1,
-1.492955, -0.2542245, -1.150843, 1, 0, 0, 1, 1,
-1.487297, 0.2691816, -1.241689, 0, 0, 0, 1, 1,
-1.478981, -0.5211383, -2.921492, 0, 0, 0, 1, 1,
-1.475731, -0.8969432, -3.769237, 0, 0, 0, 1, 1,
-1.457409, -1.032753, -1.94489, 0, 0, 0, 1, 1,
-1.454703, 1.610374, -0.4303249, 0, 0, 0, 1, 1,
-1.440834, 3.002039, -0.8308669, 0, 0, 0, 1, 1,
-1.438612, -0.2786016, -1.94876, 0, 0, 0, 1, 1,
-1.431322, 0.04455947, -0.02039552, 1, 1, 1, 1, 1,
-1.412633, 0.1154532, -2.626873, 1, 1, 1, 1, 1,
-1.408818, -0.3477801, -3.786892, 1, 1, 1, 1, 1,
-1.403939, -0.1323632, -2.4546, 1, 1, 1, 1, 1,
-1.396648, -2.262284, -2.617895, 1, 1, 1, 1, 1,
-1.389575, 0.7122869, -2.617915, 1, 1, 1, 1, 1,
-1.374219, -0.6299062, -1.559451, 1, 1, 1, 1, 1,
-1.369456, 0.2767667, -1.66886, 1, 1, 1, 1, 1,
-1.366873, -1.200727, -1.668304, 1, 1, 1, 1, 1,
-1.365352, -0.7935039, -2.70925, 1, 1, 1, 1, 1,
-1.356683, 1.429661, 1.256388, 1, 1, 1, 1, 1,
-1.355643, 0.587595, -1.036323, 1, 1, 1, 1, 1,
-1.340012, -0.09114534, 0.4204911, 1, 1, 1, 1, 1,
-1.338887, 1.011154, -2.364194, 1, 1, 1, 1, 1,
-1.337789, -0.5537111, -1.076778, 1, 1, 1, 1, 1,
-1.337377, -0.4804451, -1.583535, 0, 0, 1, 1, 1,
-1.337307, 1.454412, -0.7183797, 1, 0, 0, 1, 1,
-1.316349, 0.2514758, -0.6783912, 1, 0, 0, 1, 1,
-1.312935, 0.9536566, -1.566408, 1, 0, 0, 1, 1,
-1.312736, -0.9333205, -1.976446, 1, 0, 0, 1, 1,
-1.308017, 0.005776839, 0.168269, 1, 0, 0, 1, 1,
-1.305662, -0.6294162, -2.204952, 0, 0, 0, 1, 1,
-1.296735, -0.6031181, -2.239248, 0, 0, 0, 1, 1,
-1.292014, 0.06807651, -2.784274, 0, 0, 0, 1, 1,
-1.286452, -0.6220405, -2.037898, 0, 0, 0, 1, 1,
-1.283191, 0.5379893, -1.616677, 0, 0, 0, 1, 1,
-1.279187, -2.487678, -2.405627, 0, 0, 0, 1, 1,
-1.274341, -1.327323, -3.028155, 0, 0, 0, 1, 1,
-1.265384, -0.1048103, -1.16827, 1, 1, 1, 1, 1,
-1.263322, 1.2991, -1.52261, 1, 1, 1, 1, 1,
-1.262974, -0.7701288, -2.42351, 1, 1, 1, 1, 1,
-1.260824, -0.2315165, -2.636892, 1, 1, 1, 1, 1,
-1.256769, -1.94434, -2.782434, 1, 1, 1, 1, 1,
-1.249854, 0.00960631, -1.657575, 1, 1, 1, 1, 1,
-1.247208, 0.4730617, -0.869323, 1, 1, 1, 1, 1,
-1.236272, -1.5845, -2.917146, 1, 1, 1, 1, 1,
-1.23252, -0.1892552, -0.9107912, 1, 1, 1, 1, 1,
-1.217378, 0.2159014, -1.179468, 1, 1, 1, 1, 1,
-1.209812, -0.8166039, -2.210655, 1, 1, 1, 1, 1,
-1.208242, 0.2933748, -0.7576439, 1, 1, 1, 1, 1,
-1.197483, 0.7237466, -0.1132245, 1, 1, 1, 1, 1,
-1.194726, 0.2918421, -1.951706, 1, 1, 1, 1, 1,
-1.188159, 1.22197, 0.1297609, 1, 1, 1, 1, 1,
-1.187621, -0.176426, -0.3721153, 0, 0, 1, 1, 1,
-1.186038, -0.1404953, -1.132577, 1, 0, 0, 1, 1,
-1.182515, 0.8875464, -0.6807068, 1, 0, 0, 1, 1,
-1.181481, -0.1381235, -1.345919, 1, 0, 0, 1, 1,
-1.177169, -0.6359286, -2.138027, 1, 0, 0, 1, 1,
-1.16979, 1.691919, 0.2017976, 1, 0, 0, 1, 1,
-1.169072, -0.3729822, -2.374913, 0, 0, 0, 1, 1,
-1.167171, 0.9653303, -1.673522, 0, 0, 0, 1, 1,
-1.157693, 0.09662198, -0.2957938, 0, 0, 0, 1, 1,
-1.156029, -0.5350856, -3.527561, 0, 0, 0, 1, 1,
-1.144603, -1.169623, -3.124819, 0, 0, 0, 1, 1,
-1.139696, -0.7269747, -2.15885, 0, 0, 0, 1, 1,
-1.13482, -0.05772891, -4.087582, 0, 0, 0, 1, 1,
-1.129618, 1.081422, -0.04452179, 1, 1, 1, 1, 1,
-1.122534, -0.8274811, -1.463931, 1, 1, 1, 1, 1,
-1.120863, -1.32375, -2.606196, 1, 1, 1, 1, 1,
-1.119275, 0.9887156, -1.178895, 1, 1, 1, 1, 1,
-1.114301, -0.4135388, -2.891633, 1, 1, 1, 1, 1,
-1.113788, -0.0634862, -2.504353, 1, 1, 1, 1, 1,
-1.113069, -0.3530708, -1.844289, 1, 1, 1, 1, 1,
-1.112331, 0.473447, -1.941553, 1, 1, 1, 1, 1,
-1.110111, -0.6155068, -1.407329, 1, 1, 1, 1, 1,
-1.107728, 0.3178724, -2.821159, 1, 1, 1, 1, 1,
-1.096159, -1.125625, -0.6346932, 1, 1, 1, 1, 1,
-1.094, -0.3892606, -3.53715, 1, 1, 1, 1, 1,
-1.090924, -0.855337, -3.846629, 1, 1, 1, 1, 1,
-1.09077, 0.3004402, 1.4027, 1, 1, 1, 1, 1,
-1.090049, -0.2125606, -1.032034, 1, 1, 1, 1, 1,
-1.08921, 0.2636435, -2.335285, 0, 0, 1, 1, 1,
-1.088115, 2.018906, -1.403283, 1, 0, 0, 1, 1,
-1.085584, 1.180131, 0.3329717, 1, 0, 0, 1, 1,
-1.08357, -0.9576832, -3.792035, 1, 0, 0, 1, 1,
-1.081146, -0.9576382, -1.716668, 1, 0, 0, 1, 1,
-1.079999, 0.2594626, -2.715445, 1, 0, 0, 1, 1,
-1.06005, 0.7446064, 0.2783891, 0, 0, 0, 1, 1,
-1.058207, 0.2139255, -2.046548, 0, 0, 0, 1, 1,
-1.057224, -0.701817, -1.972258, 0, 0, 0, 1, 1,
-1.055443, 0.03874011, -1.505192, 0, 0, 0, 1, 1,
-1.055245, 0.5825841, -1.275675, 0, 0, 0, 1, 1,
-1.043623, 0.6074952, -0.9313506, 0, 0, 0, 1, 1,
-1.042358, 0.1226039, -1.688463, 0, 0, 0, 1, 1,
-1.037109, 0.4879731, -1.510767, 1, 1, 1, 1, 1,
-1.0353, -1.478043, -1.983235, 1, 1, 1, 1, 1,
-1.031027, 0.06525394, -1.576124, 1, 1, 1, 1, 1,
-1.030661, 0.3831967, -1.222132, 1, 1, 1, 1, 1,
-1.026275, -0.3389041, -2.089359, 1, 1, 1, 1, 1,
-1.025148, -0.4325027, -2.097878, 1, 1, 1, 1, 1,
-1.023979, -0.7897857, -3.75824, 1, 1, 1, 1, 1,
-1.023409, 0.6012178, -0.4922196, 1, 1, 1, 1, 1,
-1.014592, 0.5599324, -0.1883731, 1, 1, 1, 1, 1,
-1.012129, -0.7985734, -1.260628, 1, 1, 1, 1, 1,
-1.011181, -0.1365816, -2.295616, 1, 1, 1, 1, 1,
-0.9931621, -0.9725785, -2.015047, 1, 1, 1, 1, 1,
-0.9895271, 0.969651, -0.667186, 1, 1, 1, 1, 1,
-0.9853088, 0.4963515, -0.8787786, 1, 1, 1, 1, 1,
-0.9818627, 1.250344, 0.2991138, 1, 1, 1, 1, 1,
-0.9812246, -2.240592, -1.304347, 0, 0, 1, 1, 1,
-0.9783906, -0.450784, -1.613121, 1, 0, 0, 1, 1,
-0.9770842, -0.4095812, -2.353074, 1, 0, 0, 1, 1,
-0.9765296, -0.104572, -1.181736, 1, 0, 0, 1, 1,
-0.9748685, -1.284517, -3.590938, 1, 0, 0, 1, 1,
-0.972307, 0.5929126, -0.488448, 1, 0, 0, 1, 1,
-0.9643292, 0.1090126, -2.923985, 0, 0, 0, 1, 1,
-0.958707, -0.1799475, -1.68224, 0, 0, 0, 1, 1,
-0.9560395, 0.7287523, -1.539226, 0, 0, 0, 1, 1,
-0.9506911, 1.047245, 0.7848275, 0, 0, 0, 1, 1,
-0.9500838, -0.8328071, -1.417386, 0, 0, 0, 1, 1,
-0.9424218, 0.8027554, -2.248377, 0, 0, 0, 1, 1,
-0.9400223, 0.8574831, -1.645276, 0, 0, 0, 1, 1,
-0.9390529, 1.041724, -1.157896, 1, 1, 1, 1, 1,
-0.9266596, 0.4397043, -0.1156203, 1, 1, 1, 1, 1,
-0.9205136, 0.326469, -1.304208, 1, 1, 1, 1, 1,
-0.9168126, -1.652388, -3.19938, 1, 1, 1, 1, 1,
-0.9164774, -0.2953491, -2.381532, 1, 1, 1, 1, 1,
-0.908246, 0.6566156, -1.459991, 1, 1, 1, 1, 1,
-0.894056, 0.03745329, -1.078711, 1, 1, 1, 1, 1,
-0.8906654, -1.161052, -1.635597, 1, 1, 1, 1, 1,
-0.8897051, -0.4853531, -2.428353, 1, 1, 1, 1, 1,
-0.88947, -0.2427728, -2.056144, 1, 1, 1, 1, 1,
-0.8839538, 1.303392, -0.2162818, 1, 1, 1, 1, 1,
-0.8827574, -0.809926, -0.3311768, 1, 1, 1, 1, 1,
-0.8822544, -1.613339, -2.66136, 1, 1, 1, 1, 1,
-0.8773685, -0.7016874, -2.01116, 1, 1, 1, 1, 1,
-0.8746082, -0.8220214, -2.686002, 1, 1, 1, 1, 1,
-0.874066, -0.7378113, -2.016865, 0, 0, 1, 1, 1,
-0.8720977, -0.6380172, -2.212292, 1, 0, 0, 1, 1,
-0.8577342, -0.4613847, -0.5278773, 1, 0, 0, 1, 1,
-0.8573406, 0.621741, 1.47621, 1, 0, 0, 1, 1,
-0.8514194, -0.4596991, -0.9139476, 1, 0, 0, 1, 1,
-0.8511772, 0.9631634, 0.1928993, 1, 0, 0, 1, 1,
-0.8462964, -1.423533, -4.512478, 0, 0, 0, 1, 1,
-0.8375743, 0.781036, -0.566857, 0, 0, 0, 1, 1,
-0.8362243, 0.9753253, -0.932528, 0, 0, 0, 1, 1,
-0.8328859, -0.7338691, -3.120982, 0, 0, 0, 1, 1,
-0.8261889, -0.2011926, -2.953797, 0, 0, 0, 1, 1,
-0.8214995, 1.595104, 0.1736151, 0, 0, 0, 1, 1,
-0.8214941, 0.07837977, -0.1328905, 0, 0, 0, 1, 1,
-0.8198272, -0.1596231, -1.007928, 1, 1, 1, 1, 1,
-0.8184036, -0.2415779, -1.373593, 1, 1, 1, 1, 1,
-0.8167845, 0.3945971, -0.7698925, 1, 1, 1, 1, 1,
-0.8138729, -1.017027, -1.821292, 1, 1, 1, 1, 1,
-0.8124949, -0.5382018, -2.558645, 1, 1, 1, 1, 1,
-0.8066564, -0.02849314, -2.210782, 1, 1, 1, 1, 1,
-0.8055647, -0.2449846, -1.639441, 1, 1, 1, 1, 1,
-0.8046085, -1.980562, -2.805453, 1, 1, 1, 1, 1,
-0.8032806, -1.167969, -3.76906, 1, 1, 1, 1, 1,
-0.80323, -0.2321524, -0.541756, 1, 1, 1, 1, 1,
-0.7991582, 0.3359753, 0.5433486, 1, 1, 1, 1, 1,
-0.7984501, -0.3614602, -3.839963, 1, 1, 1, 1, 1,
-0.7951065, 0.09990747, -0.7061497, 1, 1, 1, 1, 1,
-0.7946668, -0.4553667, -1.539956, 1, 1, 1, 1, 1,
-0.7943009, 0.8912666, -0.2637618, 1, 1, 1, 1, 1,
-0.7857816, -1.750764, -2.425064, 0, 0, 1, 1, 1,
-0.779332, 1.096356, -1.258611, 1, 0, 0, 1, 1,
-0.7787365, -0.3277805, -1.317861, 1, 0, 0, 1, 1,
-0.777951, 0.2829579, -0.2111025, 1, 0, 0, 1, 1,
-0.774014, -0.6690704, -2.088121, 1, 0, 0, 1, 1,
-0.764422, -0.5627081, -2.003643, 1, 0, 0, 1, 1,
-0.7604904, -1.63318, -2.309597, 0, 0, 0, 1, 1,
-0.7594255, -0.03917609, -1.961261, 0, 0, 0, 1, 1,
-0.7560636, 1.136948, 0.2204715, 0, 0, 0, 1, 1,
-0.7559594, 0.3357437, -0.3359592, 0, 0, 0, 1, 1,
-0.7463422, 0.1552169, -2.200177, 0, 0, 0, 1, 1,
-0.7330808, 0.6055411, -1.832114, 0, 0, 0, 1, 1,
-0.7292331, -0.8940021, -4.041002, 0, 0, 0, 1, 1,
-0.727084, -0.7934166, -3.202227, 1, 1, 1, 1, 1,
-0.7258265, -0.1934356, -1.093932, 1, 1, 1, 1, 1,
-0.7232396, -1.063643, -2.216755, 1, 1, 1, 1, 1,
-0.7135707, -0.3092549, -1.596521, 1, 1, 1, 1, 1,
-0.6996487, -0.1870309, -2.74796, 1, 1, 1, 1, 1,
-0.6993974, -1.916552, -4.157409, 1, 1, 1, 1, 1,
-0.6987053, -0.8306904, -0.447142, 1, 1, 1, 1, 1,
-0.6979013, -1.068302, -1.933323, 1, 1, 1, 1, 1,
-0.6968455, -0.7831949, -2.541422, 1, 1, 1, 1, 1,
-0.6967692, -0.5957043, -1.08221, 1, 1, 1, 1, 1,
-0.6957483, 0.2367948, -1.113834, 1, 1, 1, 1, 1,
-0.6927192, -0.771497, -2.006327, 1, 1, 1, 1, 1,
-0.6891551, 0.8550788, -0.7618373, 1, 1, 1, 1, 1,
-0.6861418, 1.768371, 1.499382, 1, 1, 1, 1, 1,
-0.6856421, -1.449325, -2.264181, 1, 1, 1, 1, 1,
-0.6819498, 0.9317911, -1.278546, 0, 0, 1, 1, 1,
-0.6780988, 0.02273122, 0.5380264, 1, 0, 0, 1, 1,
-0.6769007, 0.4953427, -1.618886, 1, 0, 0, 1, 1,
-0.6760876, 0.5095659, -2.86735, 1, 0, 0, 1, 1,
-0.671935, 0.2221, -1.51977, 1, 0, 0, 1, 1,
-0.6625806, 0.3881043, -0.2023674, 1, 0, 0, 1, 1,
-0.6620709, -0.2724071, -2.447131, 0, 0, 0, 1, 1,
-0.6568035, -1.235804, -4.029238, 0, 0, 0, 1, 1,
-0.6553798, 0.9428891, -1.985437, 0, 0, 0, 1, 1,
-0.6534529, -1.117795, -2.145908, 0, 0, 0, 1, 1,
-0.647243, -0.3531122, 0.001799125, 0, 0, 0, 1, 1,
-0.6469021, -1.033016, -1.228647, 0, 0, 0, 1, 1,
-0.6449558, -1.238809, -2.790889, 0, 0, 0, 1, 1,
-0.6374359, -0.5181052, -0.837635, 1, 1, 1, 1, 1,
-0.6365359, -0.8256932, -0.6964723, 1, 1, 1, 1, 1,
-0.6345062, 0.3234012, -1.313134, 1, 1, 1, 1, 1,
-0.6330366, 0.1342636, -1.501486, 1, 1, 1, 1, 1,
-0.6256744, -0.2812429, -3.742265, 1, 1, 1, 1, 1,
-0.6232906, 1.284753, -0.4084931, 1, 1, 1, 1, 1,
-0.6139618, -0.9473342, -2.485038, 1, 1, 1, 1, 1,
-0.6136338, 1.05895, 0.3539124, 1, 1, 1, 1, 1,
-0.6131592, 0.6098282, -1.471051, 1, 1, 1, 1, 1,
-0.6089683, 1.760524, -1.549663, 1, 1, 1, 1, 1,
-0.6075138, 0.1975106, -1.502603, 1, 1, 1, 1, 1,
-0.6074291, 1.718929, -1.018924, 1, 1, 1, 1, 1,
-0.606384, 2.327547, -0.73602, 1, 1, 1, 1, 1,
-0.6053216, 1.508718, 0.04964143, 1, 1, 1, 1, 1,
-0.6003956, 0.1662211, -2.805477, 1, 1, 1, 1, 1,
-0.6003039, 0.08261365, -1.878445, 0, 0, 1, 1, 1,
-0.5962585, 0.7794743, -0.175254, 1, 0, 0, 1, 1,
-0.5939763, 1.164932, 0.4705637, 1, 0, 0, 1, 1,
-0.5913411, -2.545174, -2.469599, 1, 0, 0, 1, 1,
-0.5903513, 0.1201165, -2.225199, 1, 0, 0, 1, 1,
-0.5900456, 0.8927439, 0.7261164, 1, 0, 0, 1, 1,
-0.5834491, 0.8434654, -2.091282, 0, 0, 0, 1, 1,
-0.582744, -0.4397783, -3.330019, 0, 0, 0, 1, 1,
-0.5736014, -0.1998102, -2.376215, 0, 0, 0, 1, 1,
-0.5693219, -0.4582205, -2.69491, 0, 0, 0, 1, 1,
-0.5663066, 0.2042008, -1.741206, 0, 0, 0, 1, 1,
-0.5662088, -0.9756728, -2.120405, 0, 0, 0, 1, 1,
-0.5636164, 0.346538, 0.4121796, 0, 0, 0, 1, 1,
-0.5553586, 0.5626215, -0.1775931, 1, 1, 1, 1, 1,
-0.5548436, -1.343435, -4.238379, 1, 1, 1, 1, 1,
-0.5534707, 0.7409937, -0.2122224, 1, 1, 1, 1, 1,
-0.5529247, 0.4901246, 0.2681945, 1, 1, 1, 1, 1,
-0.5528544, 1.400692, 0.3844774, 1, 1, 1, 1, 1,
-0.5502504, 1.486104, -0.9504638, 1, 1, 1, 1, 1,
-0.5463447, -0.7144725, -2.125768, 1, 1, 1, 1, 1,
-0.5425186, -0.6678874, -2.213721, 1, 1, 1, 1, 1,
-0.5405436, 0.4785935, 0.02571619, 1, 1, 1, 1, 1,
-0.5399384, 0.1878748, -2.073223, 1, 1, 1, 1, 1,
-0.5340141, 0.17397, -0.8882107, 1, 1, 1, 1, 1,
-0.5292442, 0.387837, 1.212368, 1, 1, 1, 1, 1,
-0.5245317, -0.1255825, -2.36388, 1, 1, 1, 1, 1,
-0.5244984, -0.2862808, -1.394031, 1, 1, 1, 1, 1,
-0.522423, -0.4484757, -3.160642, 1, 1, 1, 1, 1,
-0.5164539, 0.2848422, -1.401486, 0, 0, 1, 1, 1,
-0.5158444, -0.2331427, -2.805181, 1, 0, 0, 1, 1,
-0.5113923, 0.1870014, -1.559389, 1, 0, 0, 1, 1,
-0.5047325, 0.3463761, 1.051465, 1, 0, 0, 1, 1,
-0.4987191, -0.5663525, -2.469021, 1, 0, 0, 1, 1,
-0.4922729, -1.498943, -4.553688, 1, 0, 0, 1, 1,
-0.4894828, 0.1983133, -1.790023, 0, 0, 0, 1, 1,
-0.4863036, -0.4124385, -2.70725, 0, 0, 0, 1, 1,
-0.4836518, -0.02906657, 0.3904049, 0, 0, 0, 1, 1,
-0.4821885, -0.8017157, -2.786845, 0, 0, 0, 1, 1,
-0.4820248, -0.5833002, -2.680709, 0, 0, 0, 1, 1,
-0.4789687, -0.4796562, -3.605557, 0, 0, 0, 1, 1,
-0.4763474, 1.190678, 0.03508669, 0, 0, 0, 1, 1,
-0.4731414, -1.027383, -3.260488, 1, 1, 1, 1, 1,
-0.4713753, -0.4085876, -2.880286, 1, 1, 1, 1, 1,
-0.4685089, -1.683196, -2.276943, 1, 1, 1, 1, 1,
-0.4657362, -1.337453, -1.97506, 1, 1, 1, 1, 1,
-0.4642333, 1.417296, 0.0009795452, 1, 1, 1, 1, 1,
-0.4560857, 2.198773, -0.7070745, 1, 1, 1, 1, 1,
-0.4512956, -0.5605435, -3.644456, 1, 1, 1, 1, 1,
-0.451077, 1.048325, 1.287049, 1, 1, 1, 1, 1,
-0.4417908, 0.05608541, -1.042808, 1, 1, 1, 1, 1,
-0.4346568, -1.191192, -2.620783, 1, 1, 1, 1, 1,
-0.4312211, -0.668821, -1.184232, 1, 1, 1, 1, 1,
-0.4309397, -0.9629331, -1.872522, 1, 1, 1, 1, 1,
-0.4286323, 0.1595021, -1.024231, 1, 1, 1, 1, 1,
-0.4285282, 1.538554, 0.2818213, 1, 1, 1, 1, 1,
-0.4272332, 0.5573505, -2.542922, 1, 1, 1, 1, 1,
-0.4145433, -0.9101354, -1.05711, 0, 0, 1, 1, 1,
-0.4059993, 0.3639119, -0.3627222, 1, 0, 0, 1, 1,
-0.4036613, 0.5158112, -0.9430087, 1, 0, 0, 1, 1,
-0.4026744, -0.004498851, -1.85029, 1, 0, 0, 1, 1,
-0.3979862, 0.5030622, -1.013279, 1, 0, 0, 1, 1,
-0.3976786, -0.03230424, -2.571287, 1, 0, 0, 1, 1,
-0.3932281, -0.295496, -1.434318, 0, 0, 0, 1, 1,
-0.3920619, 0.2485513, -0.2934878, 0, 0, 0, 1, 1,
-0.3868534, 0.1460186, -0.78369, 0, 0, 0, 1, 1,
-0.3865519, 0.8808767, -0.5274234, 0, 0, 0, 1, 1,
-0.3839474, 1.547127, -0.9551873, 0, 0, 0, 1, 1,
-0.3839028, -0.1312529, -2.992669, 0, 0, 0, 1, 1,
-0.3798538, 0.4896942, -1.224164, 0, 0, 0, 1, 1,
-0.3786824, -0.1916138, -1.46036, 1, 1, 1, 1, 1,
-0.3780195, 0.1255068, -1.502678, 1, 1, 1, 1, 1,
-0.3772779, -0.08140576, -3.428431, 1, 1, 1, 1, 1,
-0.3764718, -1.654961, -2.899862, 1, 1, 1, 1, 1,
-0.3737183, -0.07135518, -3.420724, 1, 1, 1, 1, 1,
-0.3724094, -0.3637688, -3.386879, 1, 1, 1, 1, 1,
-0.3698528, 0.4270445, -2.383685, 1, 1, 1, 1, 1,
-0.3694048, 1.211084, -0.2847253, 1, 1, 1, 1, 1,
-0.367692, -1.208426, -2.146685, 1, 1, 1, 1, 1,
-0.366675, 0.5453479, 1.055459, 1, 1, 1, 1, 1,
-0.3653585, -1.685965, -4.952364, 1, 1, 1, 1, 1,
-0.3651721, -1.696525, -4.52892, 1, 1, 1, 1, 1,
-0.3526069, 0.4772123, -1.147372, 1, 1, 1, 1, 1,
-0.3521645, -0.9628769, -2.30343, 1, 1, 1, 1, 1,
-0.3508965, 0.5744741, -0.7948009, 1, 1, 1, 1, 1,
-0.3484896, -1.307301, -1.715571, 0, 0, 1, 1, 1,
-0.3469583, 1.073033, 0.4159351, 1, 0, 0, 1, 1,
-0.3444479, -0.3713904, -2.406677, 1, 0, 0, 1, 1,
-0.3409636, -0.7816252, -0.6765045, 1, 0, 0, 1, 1,
-0.3391723, 0.1390378, -0.4984567, 1, 0, 0, 1, 1,
-0.3288722, -1.51581, -1.946938, 1, 0, 0, 1, 1,
-0.3269478, -0.8035253, -3.206029, 0, 0, 0, 1, 1,
-0.3256289, -0.7109016, -3.717869, 0, 0, 0, 1, 1,
-0.3233039, 1.361196, -3.312389, 0, 0, 0, 1, 1,
-0.3220541, 0.9084767, -1.307641, 0, 0, 0, 1, 1,
-0.317216, -1.510262, -2.024886, 0, 0, 0, 1, 1,
-0.3102603, -0.1125201, -1.204506, 0, 0, 0, 1, 1,
-0.299282, 2.021549, -0.4523603, 0, 0, 0, 1, 1,
-0.2977574, -0.2953308, -3.010653, 1, 1, 1, 1, 1,
-0.2974604, 0.521692, -0.3397583, 1, 1, 1, 1, 1,
-0.2951779, -1.16655, -0.7636454, 1, 1, 1, 1, 1,
-0.2862413, -0.2638645, -3.186179, 1, 1, 1, 1, 1,
-0.285148, 0.4414086, -0.9048246, 1, 1, 1, 1, 1,
-0.2850306, 0.2514466, -0.8035135, 1, 1, 1, 1, 1,
-0.2829789, -0.06579952, -1.106491, 1, 1, 1, 1, 1,
-0.2806972, -0.9732269, -2.344059, 1, 1, 1, 1, 1,
-0.2795309, -0.74635, -3.028241, 1, 1, 1, 1, 1,
-0.2674119, -0.266714, -2.09333, 1, 1, 1, 1, 1,
-0.2670647, -0.1820264, -2.657034, 1, 1, 1, 1, 1,
-0.2593151, -0.01177335, -2.236903, 1, 1, 1, 1, 1,
-0.2482789, -0.06924421, -2.12372, 1, 1, 1, 1, 1,
-0.2407774, 1.509851, -0.04004075, 1, 1, 1, 1, 1,
-0.2363985, 0.4502534, -1.131047, 1, 1, 1, 1, 1,
-0.2363752, 0.05805048, -1.213784, 0, 0, 1, 1, 1,
-0.235468, 0.04520591, -1.715631, 1, 0, 0, 1, 1,
-0.2350148, 2.209078, 0.07767763, 1, 0, 0, 1, 1,
-0.2278304, 0.9492401, 0.307345, 1, 0, 0, 1, 1,
-0.2259265, -0.984848, -3.008286, 1, 0, 0, 1, 1,
-0.2234308, 0.1966648, -0.6816029, 1, 0, 0, 1, 1,
-0.2216587, 0.7531039, -0.1271231, 0, 0, 0, 1, 1,
-0.2199448, -1.389738, -2.01286, 0, 0, 0, 1, 1,
-0.2148444, -1.121858, -2.014718, 0, 0, 0, 1, 1,
-0.2100195, 0.2572275, -1.776, 0, 0, 0, 1, 1,
-0.2059638, 0.3201161, -1.734559, 0, 0, 0, 1, 1,
-0.2058976, 1.938275, -0.6580757, 0, 0, 0, 1, 1,
-0.1998808, -0.9131618, -2.745946, 0, 0, 0, 1, 1,
-0.1971692, 0.651692, -2.05939, 1, 1, 1, 1, 1,
-0.1857803, -0.2546599, -2.052011, 1, 1, 1, 1, 1,
-0.1857764, -1.12062, -0.7943376, 1, 1, 1, 1, 1,
-0.1817477, 0.6349303, -0.08422196, 1, 1, 1, 1, 1,
-0.1798495, -0.7412305, -1.646784, 1, 1, 1, 1, 1,
-0.1777111, -0.5209311, -3.468755, 1, 1, 1, 1, 1,
-0.1775553, 0.1971698, -0.4349092, 1, 1, 1, 1, 1,
-0.1767546, 0.1282706, -2.571429, 1, 1, 1, 1, 1,
-0.176662, 0.1127447, -0.2726604, 1, 1, 1, 1, 1,
-0.1766367, -0.6544964, -2.760017, 1, 1, 1, 1, 1,
-0.1760181, -1.332881, -2.049541, 1, 1, 1, 1, 1,
-0.1710553, 0.7489291, -1.466499, 1, 1, 1, 1, 1,
-0.1703613, 0.5059608, -0.8760135, 1, 1, 1, 1, 1,
-0.1699348, 0.169371, -1.638648, 1, 1, 1, 1, 1,
-0.1564619, 0.9351569, -1.390006, 1, 1, 1, 1, 1,
-0.155142, -0.2380023, -3.712029, 0, 0, 1, 1, 1,
-0.1537347, 0.3395272, -0.8991152, 1, 0, 0, 1, 1,
-0.1524964, 0.4143656, -0.7410955, 1, 0, 0, 1, 1,
-0.1459921, 0.245274, -0.9431009, 1, 0, 0, 1, 1,
-0.1438796, 0.6210189, 0.2523907, 1, 0, 0, 1, 1,
-0.1360728, -0.9502175, -3.484033, 1, 0, 0, 1, 1,
-0.1327801, 1.66621, 0.5249551, 0, 0, 0, 1, 1,
-0.1310884, -0.995068, -3.370538, 0, 0, 0, 1, 1,
-0.1308465, -1.008776, -3.854064, 0, 0, 0, 1, 1,
-0.1295089, -1.106343, -2.881335, 0, 0, 0, 1, 1,
-0.1287482, 0.1311494, 0.3093526, 0, 0, 0, 1, 1,
-0.1250067, -0.101985, -1.317544, 0, 0, 0, 1, 1,
-0.1212165, -1.209707, -2.982165, 0, 0, 0, 1, 1,
-0.1205406, 0.8215949, -1.4971, 1, 1, 1, 1, 1,
-0.1173029, 0.5433378, -0.1945461, 1, 1, 1, 1, 1,
-0.1162001, 1.702192, 0.003682483, 1, 1, 1, 1, 1,
-0.1156459, 0.4592027, -0.05004999, 1, 1, 1, 1, 1,
-0.1130156, 0.381561, -0.9101858, 1, 1, 1, 1, 1,
-0.1126145, 1.152229, 1.585913, 1, 1, 1, 1, 1,
-0.1060392, -0.9556828, -3.203027, 1, 1, 1, 1, 1,
-0.1016805, 0.4717082, 0.3489666, 1, 1, 1, 1, 1,
-0.1011754, -0.0395195, -1.887798, 1, 1, 1, 1, 1,
-0.09849688, 0.4214848, -1.052289, 1, 1, 1, 1, 1,
-0.09805226, -1.641051, -4.033625, 1, 1, 1, 1, 1,
-0.09711233, -1.296213, -1.322731, 1, 1, 1, 1, 1,
-0.09446052, 0.1450328, 0.2762594, 1, 1, 1, 1, 1,
-0.09344323, -0.8169801, -4.414004, 1, 1, 1, 1, 1,
-0.09327023, -0.4024565, -1.38025, 1, 1, 1, 1, 1,
-0.0928678, 1.663964, 0.104684, 0, 0, 1, 1, 1,
-0.09257036, -1.425845, -2.369685, 1, 0, 0, 1, 1,
-0.08720108, 1.222004, 1.384819, 1, 0, 0, 1, 1,
-0.08637804, 1.139426, -0.2301047, 1, 0, 0, 1, 1,
-0.08616932, -0.5876273, -3.578363, 1, 0, 0, 1, 1,
-0.08558421, 0.0274771, 0.02034219, 1, 0, 0, 1, 1,
-0.08187424, -0.3539385, -1.653318, 0, 0, 0, 1, 1,
-0.08142986, -0.270081, -2.429601, 0, 0, 0, 1, 1,
-0.08132977, 1.860708, -1.095945, 0, 0, 0, 1, 1,
-0.08127846, -0.405041, -2.554333, 0, 0, 0, 1, 1,
-0.0805584, 1.001173, -1.271514, 0, 0, 0, 1, 1,
-0.08027531, 1.099061, 0.5733246, 0, 0, 0, 1, 1,
-0.07833437, -0.8256474, -2.877256, 0, 0, 0, 1, 1,
-0.07466632, -0.7764584, -2.682279, 1, 1, 1, 1, 1,
-0.07108355, 0.6301703, 0.1156602, 1, 1, 1, 1, 1,
-0.05764785, 0.4642449, -1.747897, 1, 1, 1, 1, 1,
-0.05613291, -0.9234987, -2.153152, 1, 1, 1, 1, 1,
-0.04907837, 2.14451, -0.6056819, 1, 1, 1, 1, 1,
-0.04800446, -0.1644709, -2.4585, 1, 1, 1, 1, 1,
-0.04604379, -1.038352, -5.079379, 1, 1, 1, 1, 1,
-0.04120319, -0.2454652, -2.55577, 1, 1, 1, 1, 1,
-0.04014785, -0.2449408, -2.15521, 1, 1, 1, 1, 1,
-0.0372476, -1.569168, -4.220263, 1, 1, 1, 1, 1,
-0.03583784, -0.3445405, -1.800901, 1, 1, 1, 1, 1,
-0.03341449, -0.3310184, -3.592918, 1, 1, 1, 1, 1,
-0.03191058, 0.9212144, 0.0669535, 1, 1, 1, 1, 1,
-0.03043736, -1.458617, -2.03866, 1, 1, 1, 1, 1,
-0.02995048, -0.1207994, -3.452639, 1, 1, 1, 1, 1,
-0.02632478, 0.3605779, -0.4683806, 0, 0, 1, 1, 1,
-0.02605684, -0.1484144, -2.385611, 1, 0, 0, 1, 1,
-0.02465741, 0.595394, -1.193458, 1, 0, 0, 1, 1,
-0.02297782, -0.4867363, -3.526191, 1, 0, 0, 1, 1,
-0.02217192, 0.8687297, 0.3990019, 1, 0, 0, 1, 1,
-0.01999267, 0.2596781, -0.4829491, 1, 0, 0, 1, 1,
-0.01867751, -0.1546386, -2.624305, 0, 0, 0, 1, 1,
-0.01390401, 1.492451, 0.7143351, 0, 0, 0, 1, 1,
-0.01358537, -0.3922253, -3.906243, 0, 0, 0, 1, 1,
-0.01300059, 1.833533, 1.07378, 0, 0, 0, 1, 1,
-0.01215048, -2.268426, -2.745756, 0, 0, 0, 1, 1,
-0.008106294, 0.01883499, -0.08265424, 0, 0, 0, 1, 1,
-0.007746544, 0.03123736, 1.01473, 0, 0, 0, 1, 1,
-0.005379413, -1.084482, -2.015834, 1, 1, 1, 1, 1,
-0.002010663, 0.578817, -1.638849, 1, 1, 1, 1, 1,
-0.001443113, -0.8341346, -3.040853, 1, 1, 1, 1, 1,
0.0007916734, 0.6699089, 0.8843874, 1, 1, 1, 1, 1,
0.003908086, 1.470702, -1.01808, 1, 1, 1, 1, 1,
0.004705024, 0.6945191, 2.062306, 1, 1, 1, 1, 1,
0.01056307, 1.016456, -0.9133861, 1, 1, 1, 1, 1,
0.01286771, -0.3784831, 1.217234, 1, 1, 1, 1, 1,
0.01287322, -0.3809371, 1.276204, 1, 1, 1, 1, 1,
0.01343729, -0.4354886, 3.537784, 1, 1, 1, 1, 1,
0.01508476, -0.4327355, 4.243968, 1, 1, 1, 1, 1,
0.01569693, -0.7314739, 4.187726, 1, 1, 1, 1, 1,
0.01579089, -0.6796997, 2.160661, 1, 1, 1, 1, 1,
0.01686733, 0.405082, -0.04272919, 1, 1, 1, 1, 1,
0.01798138, -1.103274, 2.614274, 1, 1, 1, 1, 1,
0.01874821, 1.482542, -0.695769, 0, 0, 1, 1, 1,
0.02258247, 1.510106, 1.125, 1, 0, 0, 1, 1,
0.02547578, 0.223884, -0.1257467, 1, 0, 0, 1, 1,
0.02669866, 0.1627092, 0.01333628, 1, 0, 0, 1, 1,
0.03387249, 1.866853, 1.426628, 1, 0, 0, 1, 1,
0.03947488, 0.4831096, 0.4550843, 1, 0, 0, 1, 1,
0.04314086, 0.0261685, 1.826558, 0, 0, 0, 1, 1,
0.04550361, -0.9307406, 3.422699, 0, 0, 0, 1, 1,
0.04565085, -0.8747315, 2.566261, 0, 0, 0, 1, 1,
0.04709218, -1.245963, 2.136086, 0, 0, 0, 1, 1,
0.04736859, -0.1975388, 3.017469, 0, 0, 0, 1, 1,
0.05049028, 0.5635037, -1.265527, 0, 0, 0, 1, 1,
0.05297505, 0.3750045, 1.235605, 0, 0, 0, 1, 1,
0.05712527, -0.3751079, 3.005157, 1, 1, 1, 1, 1,
0.07895366, 1.073172, -2.17066, 1, 1, 1, 1, 1,
0.07995793, -0.02589053, 2.20441, 1, 1, 1, 1, 1,
0.08209004, 1.895158, 1.555663, 1, 1, 1, 1, 1,
0.08339624, 1.195091, -0.5826921, 1, 1, 1, 1, 1,
0.08637136, -1.855541, 2.861832, 1, 1, 1, 1, 1,
0.09088763, -0.2379957, 2.524846, 1, 1, 1, 1, 1,
0.09396049, -0.5015652, 3.368054, 1, 1, 1, 1, 1,
0.09590723, 0.7905045, -0.01668776, 1, 1, 1, 1, 1,
0.09773035, 0.555104, -0.2805392, 1, 1, 1, 1, 1,
0.09803084, 0.140427, -0.3623928, 1, 1, 1, 1, 1,
0.102309, 0.2938023, 0.4551403, 1, 1, 1, 1, 1,
0.107224, 0.8784678, -0.3028361, 1, 1, 1, 1, 1,
0.1073716, 0.8166301, 1.330968, 1, 1, 1, 1, 1,
0.1077663, -2.098507, 2.802461, 1, 1, 1, 1, 1,
0.1091952, 0.6164399, -0.6573828, 0, 0, 1, 1, 1,
0.1127477, -0.4740185, 3.667675, 1, 0, 0, 1, 1,
0.1153957, -0.0003746943, -0.1247473, 1, 0, 0, 1, 1,
0.1157245, -0.4786086, 2.987063, 1, 0, 0, 1, 1,
0.1180621, -0.2612239, 2.417202, 1, 0, 0, 1, 1,
0.1193042, -1.038569, 3.116632, 1, 0, 0, 1, 1,
0.1249136, 0.1087901, 0.3101508, 0, 0, 0, 1, 1,
0.1249541, -0.814411, 1.579886, 0, 0, 0, 1, 1,
0.1314544, -1.835559, 3.080475, 0, 0, 0, 1, 1,
0.1408279, -0.1820108, 1.874404, 0, 0, 0, 1, 1,
0.1474208, 0.5354976, -0.3470067, 0, 0, 0, 1, 1,
0.1501488, -0.1328501, 2.106422, 0, 0, 0, 1, 1,
0.1530148, -0.5846685, 2.441423, 0, 0, 0, 1, 1,
0.1540371, -1.487516, 2.623872, 1, 1, 1, 1, 1,
0.1553239, -1.111296, 2.71718, 1, 1, 1, 1, 1,
0.1553925, 0.01353005, 1.92925, 1, 1, 1, 1, 1,
0.1561069, 1.704131, 0.329068, 1, 1, 1, 1, 1,
0.156292, 0.500036, -1.007092, 1, 1, 1, 1, 1,
0.1582099, -1.699322, 3.666269, 1, 1, 1, 1, 1,
0.1646024, 0.1622224, 1.486062, 1, 1, 1, 1, 1,
0.1694161, 1.757438, -0.6275081, 1, 1, 1, 1, 1,
0.175754, 1.243245, 1.665051, 1, 1, 1, 1, 1,
0.1781681, 0.5506455, 1.133552, 1, 1, 1, 1, 1,
0.1829599, 0.9958779, -0.7537462, 1, 1, 1, 1, 1,
0.1872474, 0.3561024, -0.05783445, 1, 1, 1, 1, 1,
0.189544, 0.7234566, -0.2246212, 1, 1, 1, 1, 1,
0.1900024, 0.1328771, 0.7833986, 1, 1, 1, 1, 1,
0.1909858, 0.4085709, 0.8755693, 1, 1, 1, 1, 1,
0.1953979, -0.4301873, 3.158271, 0, 0, 1, 1, 1,
0.1974138, -0.08576851, 2.532483, 1, 0, 0, 1, 1,
0.1995915, -0.4264399, 1.794937, 1, 0, 0, 1, 1,
0.2024493, -0.7960503, 2.911654, 1, 0, 0, 1, 1,
0.2041302, 1.641522, 1.700908, 1, 0, 0, 1, 1,
0.2060051, -0.9660296, 2.08358, 1, 0, 0, 1, 1,
0.2069194, 0.6799862, -1.103064, 0, 0, 0, 1, 1,
0.2085501, 0.09478372, 1.351829, 0, 0, 0, 1, 1,
0.2100783, 0.2758946, 1.272701, 0, 0, 0, 1, 1,
0.210386, 0.04071172, 1.245206, 0, 0, 0, 1, 1,
0.2105585, 0.3848224, 1.02596, 0, 0, 0, 1, 1,
0.2137036, -0.4273935, 2.781794, 0, 0, 0, 1, 1,
0.2248592, -0.1749788, 2.22438, 0, 0, 0, 1, 1,
0.2262009, 0.2614553, 0.6547602, 1, 1, 1, 1, 1,
0.2292099, 1.807092, 0.3811243, 1, 1, 1, 1, 1,
0.2358193, 0.9984705, -1.630977, 1, 1, 1, 1, 1,
0.2406701, 1.824682, 0.267323, 1, 1, 1, 1, 1,
0.2410775, 0.9878598, 1.087808, 1, 1, 1, 1, 1,
0.242854, 0.1905373, 2.009434, 1, 1, 1, 1, 1,
0.2490766, -0.9787863, 4.37165, 1, 1, 1, 1, 1,
0.2510364, -0.2660847, 2.027044, 1, 1, 1, 1, 1,
0.2522224, -1.307892, 1.431513, 1, 1, 1, 1, 1,
0.252425, -1.355855, 2.271973, 1, 1, 1, 1, 1,
0.2554197, -0.9605173, 2.960661, 1, 1, 1, 1, 1,
0.2559269, 0.2385538, -0.2101082, 1, 1, 1, 1, 1,
0.2575917, -0.8578678, 2.964313, 1, 1, 1, 1, 1,
0.2577684, -0.800835, 2.161845, 1, 1, 1, 1, 1,
0.2606308, -0.2398783, 1.295514, 1, 1, 1, 1, 1,
0.2638936, -1.246545, 1.518795, 0, 0, 1, 1, 1,
0.2642927, 1.338102, -1.376435, 1, 0, 0, 1, 1,
0.269546, -0.1778374, 0.3845272, 1, 0, 0, 1, 1,
0.2704139, -0.4714198, 2.801391, 1, 0, 0, 1, 1,
0.2830764, -0.6774842, 2.341579, 1, 0, 0, 1, 1,
0.2870561, -0.4893126, 1.696108, 1, 0, 0, 1, 1,
0.2898802, -2.281142, 3.886862, 0, 0, 0, 1, 1,
0.2907744, -0.7582388, 2.74553, 0, 0, 0, 1, 1,
0.2921664, 0.7162901, -1.319379, 0, 0, 0, 1, 1,
0.2939012, -2.069658, 3.447856, 0, 0, 0, 1, 1,
0.2941152, -0.8018101, 1.674536, 0, 0, 0, 1, 1,
0.2965447, -0.9152518, 1.728243, 0, 0, 0, 1, 1,
0.299643, 1.607622, 0.5438737, 0, 0, 0, 1, 1,
0.3013028, -0.6396492, 2.599817, 1, 1, 1, 1, 1,
0.3045705, -1.511423, 1.66217, 1, 1, 1, 1, 1,
0.3080897, -0.7509968, 3.005276, 1, 1, 1, 1, 1,
0.3106032, 1.061367, 0.1402664, 1, 1, 1, 1, 1,
0.3132783, 0.5436673, 1.113209, 1, 1, 1, 1, 1,
0.3158275, -0.4965588, 3.318588, 1, 1, 1, 1, 1,
0.3166953, -0.3446225, 3.536623, 1, 1, 1, 1, 1,
0.3190369, -0.8501417, 3.224085, 1, 1, 1, 1, 1,
0.3205825, -1.288609, 2.952005, 1, 1, 1, 1, 1,
0.3233044, -0.9845846, 2.571467, 1, 1, 1, 1, 1,
0.330328, -1.354171, 1.440392, 1, 1, 1, 1, 1,
0.3331372, 0.2468901, 1.868297, 1, 1, 1, 1, 1,
0.3344831, -0.4511529, 3.007949, 1, 1, 1, 1, 1,
0.3389888, 0.5448962, -0.2363389, 1, 1, 1, 1, 1,
0.3402984, -0.5051251, 1.950207, 1, 1, 1, 1, 1,
0.3407677, -0.7229502, 2.244862, 0, 0, 1, 1, 1,
0.3409332, -0.01745279, 3.430844, 1, 0, 0, 1, 1,
0.3428772, 0.4791847, 0.3143523, 1, 0, 0, 1, 1,
0.3441981, -1.760813, 2.620973, 1, 0, 0, 1, 1,
0.345818, -0.5918261, 0.4809901, 1, 0, 0, 1, 1,
0.3459038, -0.2477627, -0.09140116, 1, 0, 0, 1, 1,
0.3463362, 0.2847245, 0.1647508, 0, 0, 0, 1, 1,
0.3486171, -0.8973026, 3.520226, 0, 0, 0, 1, 1,
0.3496374, -1.516728, 3.117817, 0, 0, 0, 1, 1,
0.3525536, -0.8525826, 3.722336, 0, 0, 0, 1, 1,
0.3559459, 2.763897, 0.06977118, 0, 0, 0, 1, 1,
0.3562133, 0.04001679, 3.285805, 0, 0, 0, 1, 1,
0.3587589, 1.983066, 1.132497, 0, 0, 0, 1, 1,
0.3587928, 0.02605301, 0.9292416, 1, 1, 1, 1, 1,
0.358848, -1.526697, 1.844119, 1, 1, 1, 1, 1,
0.3618803, 0.149214, 2.321504, 1, 1, 1, 1, 1,
0.3644985, -0.3059698, 2.60323, 1, 1, 1, 1, 1,
0.3666756, -0.1536302, 2.872741, 1, 1, 1, 1, 1,
0.3694854, 1.882918, -0.4868945, 1, 1, 1, 1, 1,
0.3765967, 2.730655, -0.1898844, 1, 1, 1, 1, 1,
0.3772273, -0.6123567, 2.555241, 1, 1, 1, 1, 1,
0.3776142, 1.421161, 0.5480964, 1, 1, 1, 1, 1,
0.3783022, 0.9739736, 0.4448349, 1, 1, 1, 1, 1,
0.3794328, 0.1771727, 0.136308, 1, 1, 1, 1, 1,
0.382823, 2.041804, -0.7104145, 1, 1, 1, 1, 1,
0.3829581, -0.7175574, 2.473827, 1, 1, 1, 1, 1,
0.3837606, -1.326485, 2.799462, 1, 1, 1, 1, 1,
0.3842309, -0.2550204, 1.819302, 1, 1, 1, 1, 1,
0.3863521, 0.05948797, 1.881205, 0, 0, 1, 1, 1,
0.3898679, -0.509991, 2.493735, 1, 0, 0, 1, 1,
0.3921838, 0.03706671, 2.241413, 1, 0, 0, 1, 1,
0.394516, 2.014623, -0.6472542, 1, 0, 0, 1, 1,
0.3951766, -1.124814, 2.319082, 1, 0, 0, 1, 1,
0.3967476, 0.3953265, -0.3313018, 1, 0, 0, 1, 1,
0.3998717, 0.1793143, -0.2483017, 0, 0, 0, 1, 1,
0.4054387, -0.4289712, 0.7153628, 0, 0, 0, 1, 1,
0.4094423, -1.556292, 2.534309, 0, 0, 0, 1, 1,
0.409859, -0.7073947, 3.988154, 0, 0, 0, 1, 1,
0.4099093, 0.4010719, -0.896973, 0, 0, 0, 1, 1,
0.4140069, 0.5486709, -0.4273531, 0, 0, 0, 1, 1,
0.4179044, 0.3275232, 0.3988509, 0, 0, 0, 1, 1,
0.4185077, -0.1283405, 2.882303, 1, 1, 1, 1, 1,
0.4193393, -0.2112187, 0.9683577, 1, 1, 1, 1, 1,
0.42079, 0.4162647, 0.6726809, 1, 1, 1, 1, 1,
0.4291127, 0.1625841, 0.6781328, 1, 1, 1, 1, 1,
0.4297193, 0.4590428, 2.9331, 1, 1, 1, 1, 1,
0.4349719, -0.7402813, 3.251829, 1, 1, 1, 1, 1,
0.438521, 0.4498511, 0.333309, 1, 1, 1, 1, 1,
0.439135, -0.08116813, 1.872532, 1, 1, 1, 1, 1,
0.4448865, 1.843763, -0.2152935, 1, 1, 1, 1, 1,
0.4497122, 1.463466, -0.4794335, 1, 1, 1, 1, 1,
0.4507933, -0.8846321, 3.437722, 1, 1, 1, 1, 1,
0.4515493, -0.01343236, 1.784887, 1, 1, 1, 1, 1,
0.4539723, 1.066777, 1.031003, 1, 1, 1, 1, 1,
0.4609685, 0.3480813, -0.04199007, 1, 1, 1, 1, 1,
0.4666, 0.8177131, -0.1158106, 1, 1, 1, 1, 1,
0.4691286, 0.3000155, 1.055889, 0, 0, 1, 1, 1,
0.4779581, 0.9850376, -0.1652429, 1, 0, 0, 1, 1,
0.4802806, -0.4262467, 1.751933, 1, 0, 0, 1, 1,
0.4827232, -0.4954784, 2.80599, 1, 0, 0, 1, 1,
0.4837886, 0.5231589, 2.386529, 1, 0, 0, 1, 1,
0.4900999, -0.4464443, 2.875669, 1, 0, 0, 1, 1,
0.492072, -0.7509197, 2.068342, 0, 0, 0, 1, 1,
0.4952157, -0.2724248, 3.801276, 0, 0, 0, 1, 1,
0.502198, -0.08231598, 1.386116, 0, 0, 0, 1, 1,
0.5025756, 1.242945, 1.766068, 0, 0, 0, 1, 1,
0.5030648, -0.1226298, 2.424911, 0, 0, 0, 1, 1,
0.5047109, 1.376054, 0.2024512, 0, 0, 0, 1, 1,
0.5077802, -0.3238389, 2.504787, 0, 0, 0, 1, 1,
0.5077885, -0.5966979, 4.37747, 1, 1, 1, 1, 1,
0.5098674, 1.108328, 2.224233, 1, 1, 1, 1, 1,
0.5185553, -0.9264472, 4.175256, 1, 1, 1, 1, 1,
0.523641, 0.7009494, 1.404759, 1, 1, 1, 1, 1,
0.5289497, 2.111657, 3.549955, 1, 1, 1, 1, 1,
0.5304195, -0.2531437, 2.701399, 1, 1, 1, 1, 1,
0.5386643, -1.856125, 2.14849, 1, 1, 1, 1, 1,
0.540355, 1.720203, 2.389031, 1, 1, 1, 1, 1,
0.5407494, 1.082776, -1.198271, 1, 1, 1, 1, 1,
0.5416839, 0.5537031, 1.462229, 1, 1, 1, 1, 1,
0.5422039, -0.9047601, 2.544484, 1, 1, 1, 1, 1,
0.5474296, 0.4821268, 1.128667, 1, 1, 1, 1, 1,
0.5494103, -0.5051324, 1.432039, 1, 1, 1, 1, 1,
0.5528203, -0.2889841, 2.780962, 1, 1, 1, 1, 1,
0.5534962, -0.06924463, 1.13378, 1, 1, 1, 1, 1,
0.5554648, -0.4762473, 2.298764, 0, 0, 1, 1, 1,
0.5607458, -1.144189, 4.018901, 1, 0, 0, 1, 1,
0.5613909, 1.068104, 0.2281415, 1, 0, 0, 1, 1,
0.5637978, 0.9391341, 1.066617, 1, 0, 0, 1, 1,
0.5665794, -0.893785, 3.032524, 1, 0, 0, 1, 1,
0.5682581, 0.78999, 1.102961, 1, 0, 0, 1, 1,
0.5741221, -1.610582, 3.560726, 0, 0, 0, 1, 1,
0.5746552, 0.1358264, 3.714629, 0, 0, 0, 1, 1,
0.5772209, 0.2359346, 0.3225853, 0, 0, 0, 1, 1,
0.5821252, -0.3437504, 2.529066, 0, 0, 0, 1, 1,
0.5827535, 0.1952694, 0.6280174, 0, 0, 0, 1, 1,
0.5831129, -0.8992301, 1.90607, 0, 0, 0, 1, 1,
0.5846543, -0.5632048, 0.9574309, 0, 0, 0, 1, 1,
0.5905427, -0.9673913, 1.421789, 1, 1, 1, 1, 1,
0.5909031, 1.179905, -1.497244, 1, 1, 1, 1, 1,
0.5924518, 1.089038, 0.7147754, 1, 1, 1, 1, 1,
0.5966802, -0.8955431, 1.89659, 1, 1, 1, 1, 1,
0.5984641, 1.256697, -0.5993477, 1, 1, 1, 1, 1,
0.6003571, -1.727002, 2.767585, 1, 1, 1, 1, 1,
0.6122356, -1.194134, 2.831901, 1, 1, 1, 1, 1,
0.6194822, 2.27959, -0.1199003, 1, 1, 1, 1, 1,
0.62817, 1.974963, -1.89202, 1, 1, 1, 1, 1,
0.6287351, -0.1461482, 2.95022, 1, 1, 1, 1, 1,
0.6287575, 0.6701179, 2.028236, 1, 1, 1, 1, 1,
0.6293323, -1.991491, 3.144126, 1, 1, 1, 1, 1,
0.6310068, -0.3683798, 2.264776, 1, 1, 1, 1, 1,
0.6311973, -0.4954309, 1.915766, 1, 1, 1, 1, 1,
0.634267, -0.55778, 3.751977, 1, 1, 1, 1, 1,
0.6354282, -1.402735, 1.657822, 0, 0, 1, 1, 1,
0.6381899, 0.2947924, -0.9632168, 1, 0, 0, 1, 1,
0.6389816, -0.2228072, 2.071818, 1, 0, 0, 1, 1,
0.6403565, -0.6972185, 4.281591, 1, 0, 0, 1, 1,
0.6424485, -0.2797876, 2.58539, 1, 0, 0, 1, 1,
0.6434894, 0.4208677, 2.711596, 1, 0, 0, 1, 1,
0.64434, 1.316589, -0.1059133, 0, 0, 0, 1, 1,
0.6444476, -0.9910256, 3.407649, 0, 0, 0, 1, 1,
0.653227, -0.2346642, 1.459683, 0, 0, 0, 1, 1,
0.6534717, 1.29813, 0.02057153, 0, 0, 0, 1, 1,
0.6541718, -1.248619, 4.812023, 0, 0, 0, 1, 1,
0.6556196, 0.4068072, 0.6290678, 0, 0, 0, 1, 1,
0.6568709, 0.5034051, 0.9387919, 0, 0, 0, 1, 1,
0.6576976, -1.611386, 1.452855, 1, 1, 1, 1, 1,
0.6578506, -0.1983824, 1.595062, 1, 1, 1, 1, 1,
0.6611483, -1.146871, 2.107275, 1, 1, 1, 1, 1,
0.6617671, -0.8372132, 1.711033, 1, 1, 1, 1, 1,
0.6622133, 1.136971, 1.47731, 1, 1, 1, 1, 1,
0.6661112, 2.325056, 0.6118068, 1, 1, 1, 1, 1,
0.6686208, -1.367005, 0.9308288, 1, 1, 1, 1, 1,
0.6687908, 0.8833544, 2.201684, 1, 1, 1, 1, 1,
0.6690052, -1.567906, 4.676804, 1, 1, 1, 1, 1,
0.6768967, -0.03447612, 0.7799379, 1, 1, 1, 1, 1,
0.678974, 0.9376225, -0.7315322, 1, 1, 1, 1, 1,
0.6834582, -0.05876127, 0.9637592, 1, 1, 1, 1, 1,
0.6904203, 1.749851, 1.852191, 1, 1, 1, 1, 1,
0.6939709, 0.4303383, -0.302396, 1, 1, 1, 1, 1,
0.6946284, -1.174069, 3.436944, 1, 1, 1, 1, 1,
0.7032272, 1.946108, 1.214344, 0, 0, 1, 1, 1,
0.7119787, 1.285136, 0.5206605, 1, 0, 0, 1, 1,
0.7130898, -1.290695, 2.7451, 1, 0, 0, 1, 1,
0.7153996, 0.3296695, 0.8364685, 1, 0, 0, 1, 1,
0.7157666, 1.149812, -0.3183369, 1, 0, 0, 1, 1,
0.7186457, 1.034157, 0.5550005, 1, 0, 0, 1, 1,
0.7197005, 0.2400454, 1.819775, 0, 0, 0, 1, 1,
0.719793, 0.1816174, 0.1193688, 0, 0, 0, 1, 1,
0.7213624, -1.296804, 2.611133, 0, 0, 0, 1, 1,
0.7213956, -0.3311435, 1.646428, 0, 0, 0, 1, 1,
0.7236193, 0.8781208, 0.8724838, 0, 0, 0, 1, 1,
0.7278361, 1.248924, -0.2605136, 0, 0, 0, 1, 1,
0.7300323, -1.071064, 4.630472, 0, 0, 0, 1, 1,
0.7327248, 0.09747663, 0.8517483, 1, 1, 1, 1, 1,
0.7337279, -0.1179457, 3.50943, 1, 1, 1, 1, 1,
0.7361693, -1.196481, 2.405897, 1, 1, 1, 1, 1,
0.7365881, -0.08779364, 1.228808, 1, 1, 1, 1, 1,
0.7390671, 0.3591834, 1.184862, 1, 1, 1, 1, 1,
0.7421557, 0.009410461, 0.9318029, 1, 1, 1, 1, 1,
0.7431805, 0.08357994, 1.848078, 1, 1, 1, 1, 1,
0.7459283, -0.2564381, 1.855167, 1, 1, 1, 1, 1,
0.7471974, -0.2278045, -0.2946611, 1, 1, 1, 1, 1,
0.7562606, 0.4201157, 3.386336, 1, 1, 1, 1, 1,
0.7607689, -1.291369, 1.942061, 1, 1, 1, 1, 1,
0.7718774, -2.093962, 1.335844, 1, 1, 1, 1, 1,
0.7720409, -1.164744, 4.625398, 1, 1, 1, 1, 1,
0.7779565, -0.567116, 2.241214, 1, 1, 1, 1, 1,
0.7805749, -1.334543, 2.141212, 1, 1, 1, 1, 1,
0.7828916, 0.7832768, 1.378009, 0, 0, 1, 1, 1,
0.7855241, 0.5817196, 0.3482412, 1, 0, 0, 1, 1,
0.8012304, -0.3101877, 2.842455, 1, 0, 0, 1, 1,
0.8035552, -0.6837073, 1.698993, 1, 0, 0, 1, 1,
0.8039513, -0.6255813, 1.58148, 1, 0, 0, 1, 1,
0.806901, 0.7733604, -0.04871148, 1, 0, 0, 1, 1,
0.8072237, 1.308669, 0.5246243, 0, 0, 0, 1, 1,
0.8153172, -0.8800355, 2.509664, 0, 0, 0, 1, 1,
0.8161647, -0.1716556, 2.188762, 0, 0, 0, 1, 1,
0.8192161, -0.2726974, 1.792241, 0, 0, 0, 1, 1,
0.8235879, -0.8471776, 2.349569, 0, 0, 0, 1, 1,
0.8257393, 0.2188971, 0.9354164, 0, 0, 0, 1, 1,
0.8285766, -0.6044701, 2.79045, 0, 0, 0, 1, 1,
0.8287733, -0.0144079, -0.5768997, 1, 1, 1, 1, 1,
0.8362647, 0.8713276, 0.7968326, 1, 1, 1, 1, 1,
0.8372167, 0.03681267, 1.154875, 1, 1, 1, 1, 1,
0.8413442, 0.4478015, 0.7939067, 1, 1, 1, 1, 1,
0.8473564, -0.4404899, 1.396471, 1, 1, 1, 1, 1,
0.8486398, 0.1061664, 0.2750143, 1, 1, 1, 1, 1,
0.8585874, -1.995002, 1.960939, 1, 1, 1, 1, 1,
0.860458, -0.4973817, 2.770263, 1, 1, 1, 1, 1,
0.8624326, -0.8971202, 2.006379, 1, 1, 1, 1, 1,
0.8671909, -0.3430308, 1.042433, 1, 1, 1, 1, 1,
0.8681598, -0.3856264, 3.968204, 1, 1, 1, 1, 1,
0.8708366, -0.5949557, 1.729845, 1, 1, 1, 1, 1,
0.8755807, -0.595843, 1.638861, 1, 1, 1, 1, 1,
0.8774802, -0.4901718, 2.939881, 1, 1, 1, 1, 1,
0.8787152, 1.035662, 2.340918, 1, 1, 1, 1, 1,
0.8788285, -1.332026, 2.188127, 0, 0, 1, 1, 1,
0.8795549, 1.367296, -0.1697816, 1, 0, 0, 1, 1,
0.882695, 2.02109, -0.2383855, 1, 0, 0, 1, 1,
0.8872621, 1.164202, 1.409207, 1, 0, 0, 1, 1,
0.8892333, 0.5664651, 1.001316, 1, 0, 0, 1, 1,
0.8906518, 1.1107, 0.687011, 1, 0, 0, 1, 1,
0.8975527, -1.281991, 4.031194, 0, 0, 0, 1, 1,
0.8976226, 0.2860554, 0.9209064, 0, 0, 0, 1, 1,
0.9037116, 0.7957923, -0.6753662, 0, 0, 0, 1, 1,
0.9108121, 1.20189, 0.2641513, 0, 0, 0, 1, 1,
0.9155734, 0.4919838, -0.2954049, 0, 0, 0, 1, 1,
0.9177561, 0.03423965, 1.986861, 0, 0, 0, 1, 1,
0.9185743, -0.4341726, 2.174634, 0, 0, 0, 1, 1,
0.9284913, -0.7661569, 4.445483, 1, 1, 1, 1, 1,
0.9313597, -0.4987792, 4.192688, 1, 1, 1, 1, 1,
0.9324414, 0.1508148, 0.9655191, 1, 1, 1, 1, 1,
0.9329057, -0.9042028, 4.101705, 1, 1, 1, 1, 1,
0.9342644, -0.8460751, 1.336303, 1, 1, 1, 1, 1,
0.9388861, -0.7938787, 1.993272, 1, 1, 1, 1, 1,
0.9453543, 1.034363, 0.8027868, 1, 1, 1, 1, 1,
0.9465829, -0.9896342, 2.513232, 1, 1, 1, 1, 1,
0.9564644, 0.2049863, 1.779988, 1, 1, 1, 1, 1,
0.9564899, 1.098213, 1.439221, 1, 1, 1, 1, 1,
0.9588796, 1.099088, 1.025562, 1, 1, 1, 1, 1,
0.9590647, -1.908581, 2.680952, 1, 1, 1, 1, 1,
0.9679101, -0.1091482, 2.203141, 1, 1, 1, 1, 1,
0.970596, -1.882127, 1.9704, 1, 1, 1, 1, 1,
0.9722831, 0.8559711, 0.6566814, 1, 1, 1, 1, 1,
0.9751655, 0.2233606, 1.876891, 0, 0, 1, 1, 1,
0.9789979, -0.08087352, 2.599803, 1, 0, 0, 1, 1,
0.9806706, 0.8596449, 2.177365, 1, 0, 0, 1, 1,
0.9864618, 0.517133, 1.058925, 1, 0, 0, 1, 1,
0.9957483, -0.3419217, 2.043058, 1, 0, 0, 1, 1,
0.9969538, -0.183181, 2.731466, 1, 0, 0, 1, 1,
0.999809, 0.4824553, 0.9726437, 0, 0, 0, 1, 1,
1.00324, 1.501458, 2.142366, 0, 0, 0, 1, 1,
1.005063, 0.05744015, 1.233321, 0, 0, 0, 1, 1,
1.009841, 0.3628461, 0.3906446, 0, 0, 0, 1, 1,
1.011702, 1.731708, 0.5817436, 0, 0, 0, 1, 1,
1.014445, -0.4109282, 1.664884, 0, 0, 0, 1, 1,
1.022686, -1.15338, 4.305071, 0, 0, 0, 1, 1,
1.023195, -1.363516, 1.636006, 1, 1, 1, 1, 1,
1.027358, -1.055246, 1.730017, 1, 1, 1, 1, 1,
1.034843, -1.066585, 3.487391, 1, 1, 1, 1, 1,
1.037067, 0.5761354, 0.1464663, 1, 1, 1, 1, 1,
1.037203, 2.241944, -0.6809134, 1, 1, 1, 1, 1,
1.040117, 0.271168, 1.318715, 1, 1, 1, 1, 1,
1.040447, 0.7671515, 0.06908143, 1, 1, 1, 1, 1,
1.041635, 0.05169581, 1.039682, 1, 1, 1, 1, 1,
1.057738, 0.04135374, 0.5144355, 1, 1, 1, 1, 1,
1.060565, -1.166074, 2.016199, 1, 1, 1, 1, 1,
1.081149, 0.3196258, 0.6500915, 1, 1, 1, 1, 1,
1.088398, -0.2840372, 1.356541, 1, 1, 1, 1, 1,
1.104036, -0.7958525, 3.006045, 1, 1, 1, 1, 1,
1.121114, -0.8310718, 2.821166, 1, 1, 1, 1, 1,
1.121862, 1.361347, -0.4079421, 1, 1, 1, 1, 1,
1.126026, -1.133063, 3.941667, 0, 0, 1, 1, 1,
1.129252, 1.649113, -0.4576347, 1, 0, 0, 1, 1,
1.132506, 0.3008568, 1.285738, 1, 0, 0, 1, 1,
1.133842, -0.9966872, 2.113487, 1, 0, 0, 1, 1,
1.144253, 0.494635, 2.398869, 1, 0, 0, 1, 1,
1.144408, -0.69602, 1.207661, 1, 0, 0, 1, 1,
1.145467, 0.2473216, 1.680096, 0, 0, 0, 1, 1,
1.153401, -1.457304, 3.302862, 0, 0, 0, 1, 1,
1.154192, -1.048019, 1.541316, 0, 0, 0, 1, 1,
1.156098, -0.2287676, 2.595417, 0, 0, 0, 1, 1,
1.165064, 0.1272276, 0.04261728, 0, 0, 0, 1, 1,
1.16799, 0.4634548, -0.3647012, 0, 0, 0, 1, 1,
1.170073, -2.077463, 3.334654, 0, 0, 0, 1, 1,
1.172442, -1.485616, 1.56426, 1, 1, 1, 1, 1,
1.180618, -0.5398661, 4.299591, 1, 1, 1, 1, 1,
1.180658, 0.01096911, 2.042952, 1, 1, 1, 1, 1,
1.186049, -0.2045144, 0.1013271, 1, 1, 1, 1, 1,
1.190667, 2.387979, 1.228051, 1, 1, 1, 1, 1,
1.193034, 0.6205744, 1.199815, 1, 1, 1, 1, 1,
1.200606, -0.3761512, 1.923748, 1, 1, 1, 1, 1,
1.201982, 0.06243042, 1.827193, 1, 1, 1, 1, 1,
1.202199, 1.199907, 0.148692, 1, 1, 1, 1, 1,
1.206261, 0.2540901, 1.503319, 1, 1, 1, 1, 1,
1.206261, -0.4175462, 2.684009, 1, 1, 1, 1, 1,
1.236114, -1.424896, 1.147131, 1, 1, 1, 1, 1,
1.243445, -0.2789075, 1.204316, 1, 1, 1, 1, 1,
1.243683, -0.9088976, 3.535326, 1, 1, 1, 1, 1,
1.243942, 0.4175175, 1.192476, 1, 1, 1, 1, 1,
1.252163, -0.2024662, 1.593552, 0, 0, 1, 1, 1,
1.258593, 0.8969973, 1.107789, 1, 0, 0, 1, 1,
1.26301, 0.7056252, 0.8347178, 1, 0, 0, 1, 1,
1.264605, 0.9245031, 1.242043, 1, 0, 0, 1, 1,
1.269247, -0.9429651, 2.085108, 1, 0, 0, 1, 1,
1.272227, 0.5856015, -0.7270577, 1, 0, 0, 1, 1,
1.284657, -0.7854013, 2.002166, 0, 0, 0, 1, 1,
1.285357, 1.297717, 0.09894472, 0, 0, 0, 1, 1,
1.29331, -0.8562229, 2.673894, 0, 0, 0, 1, 1,
1.294846, -0.9778757, 4.004229, 0, 0, 0, 1, 1,
1.296115, 0.2362983, 0.4392444, 0, 0, 0, 1, 1,
1.30396, -0.1620969, 1.008217, 0, 0, 0, 1, 1,
1.30698, 0.9352198, 0.6945789, 0, 0, 0, 1, 1,
1.30775, 2.153692, -0.2685376, 1, 1, 1, 1, 1,
1.313395, 0.5742927, 2.178807, 1, 1, 1, 1, 1,
1.319807, -0.7726057, -0.7260029, 1, 1, 1, 1, 1,
1.330656, -1.77087, 2.443802, 1, 1, 1, 1, 1,
1.332253, 1.172952, 3.095644, 1, 1, 1, 1, 1,
1.33463, -0.3150189, 0.2576424, 1, 1, 1, 1, 1,
1.345676, -0.7339882, -0.4396991, 1, 1, 1, 1, 1,
1.349913, 0.4705154, 0.2958004, 1, 1, 1, 1, 1,
1.352265, 0.1577582, 2.238818, 1, 1, 1, 1, 1,
1.363477, -1.176926, 1.148432, 1, 1, 1, 1, 1,
1.370725, 1.420658, 1.334558, 1, 1, 1, 1, 1,
1.372512, 0.7473363, 1.696263, 1, 1, 1, 1, 1,
1.373369, -1.877862, 2.115935, 1, 1, 1, 1, 1,
1.374285, -0.02229663, 4.026212, 1, 1, 1, 1, 1,
1.379628, -0.2513889, 1.164664, 1, 1, 1, 1, 1,
1.393858, 0.1249057, 1.180356, 0, 0, 1, 1, 1,
1.405738, 1.730239, 0.3524713, 1, 0, 0, 1, 1,
1.423026, 1.569613, 1.439592, 1, 0, 0, 1, 1,
1.429125, 2.033742, 0.803775, 1, 0, 0, 1, 1,
1.431537, 1.144466, 1.080972, 1, 0, 0, 1, 1,
1.441727, -0.02929496, 2.364875, 1, 0, 0, 1, 1,
1.443819, -0.1919972, 2.062068, 0, 0, 0, 1, 1,
1.444532, -1.573931, 1.798719, 0, 0, 0, 1, 1,
1.450787, 0.8833605, 0.5395011, 0, 0, 0, 1, 1,
1.450857, 1.850214, 1.233668, 0, 0, 0, 1, 1,
1.455509, -1.512051, 1.978136, 0, 0, 0, 1, 1,
1.472098, 0.5575083, 0.5999925, 0, 0, 0, 1, 1,
1.477837, -0.8647999, 2.883193, 0, 0, 0, 1, 1,
1.47909, -1.536247, 0.7558082, 1, 1, 1, 1, 1,
1.483207, -0.2439435, 1.991026, 1, 1, 1, 1, 1,
1.497181, 1.529189, 1.792468, 1, 1, 1, 1, 1,
1.501385, -1.066083, 2.30072, 1, 1, 1, 1, 1,
1.50263, -0.6048841, 3.208856, 1, 1, 1, 1, 1,
1.512594, -0.8603108, 2.723661, 1, 1, 1, 1, 1,
1.528851, -1.019869, 2.872485, 1, 1, 1, 1, 1,
1.538931, 0.4383807, 0.4743869, 1, 1, 1, 1, 1,
1.542742, -0.6322339, 3.032588, 1, 1, 1, 1, 1,
1.563253, 0.3071223, 0.1830884, 1, 1, 1, 1, 1,
1.577185, 0.08820871, 0.4179419, 1, 1, 1, 1, 1,
1.584983, 0.8101988, 1.424874, 1, 1, 1, 1, 1,
1.590384, -1.64178, 2.604394, 1, 1, 1, 1, 1,
1.592417, 0.5956452, 0.4884382, 1, 1, 1, 1, 1,
1.592983, -0.8936929, 1.48907, 1, 1, 1, 1, 1,
1.601038, 0.7361729, 1.251052, 0, 0, 1, 1, 1,
1.606398, -0.218158, 2.361687, 1, 0, 0, 1, 1,
1.610527, -1.455343, 3.062357, 1, 0, 0, 1, 1,
1.613939, 0.4123206, -1.211299, 1, 0, 0, 1, 1,
1.626062, 0.4681927, 0.4500351, 1, 0, 0, 1, 1,
1.634687, 1.265432, 1.016077, 1, 0, 0, 1, 1,
1.64949, 1.944555, 1.947735, 0, 0, 0, 1, 1,
1.650796, 1.181506, 0.4684642, 0, 0, 0, 1, 1,
1.668971, -0.0933219, 0.5164649, 0, 0, 0, 1, 1,
1.67782, -0.2979503, 1.606085, 0, 0, 0, 1, 1,
1.680994, -0.1272488, 2.13602, 0, 0, 0, 1, 1,
1.681208, 1.268514, 1.989759, 0, 0, 0, 1, 1,
1.714368, -0.03621525, -0.2214426, 0, 0, 0, 1, 1,
1.736185, -1.449883, 0.9311176, 1, 1, 1, 1, 1,
1.740714, -0.09704646, 0.2258177, 1, 1, 1, 1, 1,
1.741697, 0.6058869, 0.4805584, 1, 1, 1, 1, 1,
1.752636, -0.829726, 3.608145, 1, 1, 1, 1, 1,
1.768696, 0.1632802, 2.277196, 1, 1, 1, 1, 1,
1.771656, -0.3037241, 3.083699, 1, 1, 1, 1, 1,
1.80085, 1.107322, 0.8433979, 1, 1, 1, 1, 1,
1.817799, -0.06865281, 1.947068, 1, 1, 1, 1, 1,
1.832154, -0.06956494, 2.81827, 1, 1, 1, 1, 1,
1.832776, -0.04328595, 1.435182, 1, 1, 1, 1, 1,
1.835114, 0.04834387, 0.4220945, 1, 1, 1, 1, 1,
1.880629, -0.6954415, 3.60007, 1, 1, 1, 1, 1,
1.880995, 0.4261135, 0.9327325, 1, 1, 1, 1, 1,
1.89775, 0.07062486, 1.880441, 1, 1, 1, 1, 1,
1.904553, -0.08805905, 1.234967, 1, 1, 1, 1, 1,
1.932127, -0.5330216, 2.577551, 0, 0, 1, 1, 1,
1.980857, -1.41767, 2.410712, 1, 0, 0, 1, 1,
2.018835, 1.047993, 3.313867, 1, 0, 0, 1, 1,
2.072144, -0.4089482, 2.562186, 1, 0, 0, 1, 1,
2.080035, -1.693999, 1.767465, 1, 0, 0, 1, 1,
2.089262, 0.918187, 1.775078, 1, 0, 0, 1, 1,
2.099962, 0.6779213, 1.028327, 0, 0, 0, 1, 1,
2.128282, -2.126979, 2.117431, 0, 0, 0, 1, 1,
2.165652, 0.8652949, 1.796349, 0, 0, 0, 1, 1,
2.170892, 0.03739412, 1.415812, 0, 0, 0, 1, 1,
2.171149, 1.222297, 1.139012, 0, 0, 0, 1, 1,
2.196272, 2.843609, 0.8358431, 0, 0, 0, 1, 1,
2.250855, -0.5080875, 0.4711777, 0, 0, 0, 1, 1,
2.427496, -0.3029002, 0.2834762, 1, 1, 1, 1, 1,
2.489151, 0.7213278, 0.8925192, 1, 1, 1, 1, 1,
2.492269, 1.217893, 0.532655, 1, 1, 1, 1, 1,
2.877102, 0.3591268, -0.007910782, 1, 1, 1, 1, 1,
2.960729, -0.995079, 3.352268, 1, 1, 1, 1, 1,
3.347183, 1.910561, 0.7457446, 1, 1, 1, 1, 1,
3.395832, -0.6490779, 2.262322, 1, 1, 1, 1, 1
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
var radius = 9.123339;
var distance = 32.04534;
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
mvMatrix.translate( -0.1535139, -0.07254994, 0.133678 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.04534);
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
