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
-2.950619, -2.020659, -1.746617, 1, 0, 0, 1,
-2.882946, -0.4880838, -2.269153, 1, 0.007843138, 0, 1,
-2.860579, -0.1537755, -2.407113, 1, 0.01176471, 0, 1,
-2.799913, 0.8041409, -1.439691, 1, 0.01960784, 0, 1,
-2.788056, 0.7940785, -2.626906, 1, 0.02352941, 0, 1,
-2.786055, 0.402027, -2.9663, 1, 0.03137255, 0, 1,
-2.776703, 1.075237, 1.421521, 1, 0.03529412, 0, 1,
-2.650131, -1.75679, -1.181525, 1, 0.04313726, 0, 1,
-2.582571, 0.2524178, -2.547376, 1, 0.04705882, 0, 1,
-2.414367, 2.210798, -1.576828, 1, 0.05490196, 0, 1,
-2.371285, 0.1916695, -0.9842822, 1, 0.05882353, 0, 1,
-2.263648, -2.592376, -3.174569, 1, 0.06666667, 0, 1,
-2.246608, -0.4389122, -2.068373, 1, 0.07058824, 0, 1,
-2.217126, -0.01482281, -2.592346, 1, 0.07843138, 0, 1,
-2.210901, 1.391825, -1.103758, 1, 0.08235294, 0, 1,
-2.144652, -0.7540196, -1.265012, 1, 0.09019608, 0, 1,
-2.136652, 0.1002365, -2.250725, 1, 0.09411765, 0, 1,
-2.122653, -0.011448, 0.259185, 1, 0.1019608, 0, 1,
-2.122169, -0.1987737, 0.5056549, 1, 0.1098039, 0, 1,
-2.063899, 1.171014, -0.4837191, 1, 0.1137255, 0, 1,
-2.063177, 1.287325, -0.9309441, 1, 0.1215686, 0, 1,
-2.051203, 0.2278038, -2.208551, 1, 0.1254902, 0, 1,
-2.01895, 1.402499, -1.797211, 1, 0.1333333, 0, 1,
-2.013464, 0.2568534, -1.655128, 1, 0.1372549, 0, 1,
-1.998673, 2.240065, -1.193935, 1, 0.145098, 0, 1,
-1.921174, -2.09652, -1.582058, 1, 0.1490196, 0, 1,
-1.900546, -0.8839211, -0.5463798, 1, 0.1568628, 0, 1,
-1.898557, -0.5467766, -2.63813, 1, 0.1607843, 0, 1,
-1.893899, 0.0915735, -1.066368, 1, 0.1686275, 0, 1,
-1.873417, -1.227407, -3.09974, 1, 0.172549, 0, 1,
-1.864213, 1.451571, -2.176118, 1, 0.1803922, 0, 1,
-1.841542, -0.3760506, -2.004527, 1, 0.1843137, 0, 1,
-1.813106, 0.7860616, -2.966774, 1, 0.1921569, 0, 1,
-1.796481, 0.9535806, 1.285558, 1, 0.1960784, 0, 1,
-1.791392, 2.517406, -0.3602059, 1, 0.2039216, 0, 1,
-1.790652, 0.007949892, -2.990551, 1, 0.2117647, 0, 1,
-1.78487, -0.4494082, -2.208943, 1, 0.2156863, 0, 1,
-1.759948, -0.8403693, -1.940292, 1, 0.2235294, 0, 1,
-1.747411, 0.5687714, -0.03277051, 1, 0.227451, 0, 1,
-1.712408, 0.334746, -1.09429, 1, 0.2352941, 0, 1,
-1.698219, -0.8626822, -2.294513, 1, 0.2392157, 0, 1,
-1.691085, 1.169831, -0.6620238, 1, 0.2470588, 0, 1,
-1.674857, 0.4999034, -2.434322, 1, 0.2509804, 0, 1,
-1.672339, 0.1347351, -1.670166, 1, 0.2588235, 0, 1,
-1.668756, -0.8265735, -3.011853, 1, 0.2627451, 0, 1,
-1.660171, 0.7450021, 0.06805507, 1, 0.2705882, 0, 1,
-1.650799, -1.187866, -2.254786, 1, 0.2745098, 0, 1,
-1.629328, -2.153974, -1.666304, 1, 0.282353, 0, 1,
-1.610306, 0.6920006, -1.568333, 1, 0.2862745, 0, 1,
-1.609395, 0.1060464, -1.765233, 1, 0.2941177, 0, 1,
-1.593655, -0.103511, -1.722693, 1, 0.3019608, 0, 1,
-1.584629, 0.4667739, -2.176726, 1, 0.3058824, 0, 1,
-1.560733, -0.08597347, -0.899442, 1, 0.3137255, 0, 1,
-1.55307, 0.8198469, 0.3462982, 1, 0.3176471, 0, 1,
-1.550415, -0.1356023, -0.8611868, 1, 0.3254902, 0, 1,
-1.546286, 0.03088766, -0.8415239, 1, 0.3294118, 0, 1,
-1.541183, 0.09757941, -1.149381, 1, 0.3372549, 0, 1,
-1.523496, 0.4179322, -1.029347, 1, 0.3411765, 0, 1,
-1.523044, -1.041055, -1.527342, 1, 0.3490196, 0, 1,
-1.503127, 1.222558, -0.3012729, 1, 0.3529412, 0, 1,
-1.498429, -0.09530399, -3.522744, 1, 0.3607843, 0, 1,
-1.493502, 1.002012, -1.690286, 1, 0.3647059, 0, 1,
-1.471341, 2.232991, 0.4101467, 1, 0.372549, 0, 1,
-1.460636, 0.6703227, -2.265938, 1, 0.3764706, 0, 1,
-1.458603, -1.119625, -2.022863, 1, 0.3843137, 0, 1,
-1.453727, 1.019566, -1.055237, 1, 0.3882353, 0, 1,
-1.444486, -0.817051, -2.653357, 1, 0.3960784, 0, 1,
-1.444143, -1.426965, -1.271293, 1, 0.4039216, 0, 1,
-1.442135, 2.467054, 1.278487, 1, 0.4078431, 0, 1,
-1.43131, -0.170553, -0.7154037, 1, 0.4156863, 0, 1,
-1.429531, 1.6572, -1.305052, 1, 0.4196078, 0, 1,
-1.411955, -0.6905119, -2.486754, 1, 0.427451, 0, 1,
-1.4053, 0.2676535, -2.630061, 1, 0.4313726, 0, 1,
-1.392088, 0.2922401, -1.265417, 1, 0.4392157, 0, 1,
-1.389145, 1.629108, -0.9675104, 1, 0.4431373, 0, 1,
-1.388839, -1.660629, -1.343816, 1, 0.4509804, 0, 1,
-1.38826, -0.1681228, -0.5624786, 1, 0.454902, 0, 1,
-1.383525, 0.1773974, -1.63891, 1, 0.4627451, 0, 1,
-1.381746, -0.8532896, -2.118453, 1, 0.4666667, 0, 1,
-1.378267, 1.492465, -1.889787, 1, 0.4745098, 0, 1,
-1.377781, 0.399852, -3.069614, 1, 0.4784314, 0, 1,
-1.358076, -0.02421284, -2.57086, 1, 0.4862745, 0, 1,
-1.345031, 0.8173385, -0.1870869, 1, 0.4901961, 0, 1,
-1.338322, 0.6533548, -2.905591, 1, 0.4980392, 0, 1,
-1.330431, -1.675802, -2.674486, 1, 0.5058824, 0, 1,
-1.322092, 0.04308532, -0.966664, 1, 0.509804, 0, 1,
-1.322078, -0.4223462, -1.481944, 1, 0.5176471, 0, 1,
-1.320123, -1.912326, -2.889472, 1, 0.5215687, 0, 1,
-1.289151, -0.09725174, -1.0719, 1, 0.5294118, 0, 1,
-1.288271, 0.360959, -0.5492623, 1, 0.5333334, 0, 1,
-1.284471, 0.2958345, -0.4523237, 1, 0.5411765, 0, 1,
-1.278237, -0.06784565, -1.319833, 1, 0.5450981, 0, 1,
-1.277866, -0.4700935, -0.6835321, 1, 0.5529412, 0, 1,
-1.274948, -1.231716, 1.198152, 1, 0.5568628, 0, 1,
-1.265805, 0.4955501, -1.161975, 1, 0.5647059, 0, 1,
-1.253326, 1.629785, -1.209248, 1, 0.5686275, 0, 1,
-1.247752, 0.3621219, -2.466983, 1, 0.5764706, 0, 1,
-1.242185, 0.07901541, -1.428626, 1, 0.5803922, 0, 1,
-1.234273, -1.31376, -2.356824, 1, 0.5882353, 0, 1,
-1.231784, -0.3620046, -1.877754, 1, 0.5921569, 0, 1,
-1.228364, 1.281473, -0.6964374, 1, 0.6, 0, 1,
-1.226998, -0.9228154, -1.352767, 1, 0.6078432, 0, 1,
-1.224548, -0.155672, -2.826707, 1, 0.6117647, 0, 1,
-1.214256, -0.1579737, -3.038337, 1, 0.6196079, 0, 1,
-1.213916, -0.10712, -0.2731533, 1, 0.6235294, 0, 1,
-1.210044, -0.553397, -2.108678, 1, 0.6313726, 0, 1,
-1.209477, -0.4982725, -2.774921, 1, 0.6352941, 0, 1,
-1.207772, 0.6535971, -1.801383, 1, 0.6431373, 0, 1,
-1.206013, 1.364186, -0.06684139, 1, 0.6470588, 0, 1,
-1.204698, 2.731238, -1.31048, 1, 0.654902, 0, 1,
-1.20425, 0.7825121, -0.7485701, 1, 0.6588235, 0, 1,
-1.204094, 1.145819, -1.113686, 1, 0.6666667, 0, 1,
-1.199116, -0.1550187, -1.823164, 1, 0.6705883, 0, 1,
-1.194987, 1.22047, 1.959829, 1, 0.6784314, 0, 1,
-1.186541, 0.1360226, -0.3513556, 1, 0.682353, 0, 1,
-1.184909, -0.1988718, -1.218106, 1, 0.6901961, 0, 1,
-1.181697, -0.1387511, -0.3809142, 1, 0.6941177, 0, 1,
-1.177712, 0.6231654, -1.136249, 1, 0.7019608, 0, 1,
-1.17715, -0.8361286, -2.344198, 1, 0.7098039, 0, 1,
-1.175125, -1.14438, -3.15955, 1, 0.7137255, 0, 1,
-1.169873, -0.5771599, -2.661109, 1, 0.7215686, 0, 1,
-1.169221, 1.615565, 1.286282, 1, 0.7254902, 0, 1,
-1.168969, -1.787825, -0.8782283, 1, 0.7333333, 0, 1,
-1.165247, 0.1280734, -1.403979, 1, 0.7372549, 0, 1,
-1.164528, 0.9720928, -0.7048219, 1, 0.7450981, 0, 1,
-1.162538, 0.7733744, 0.9367492, 1, 0.7490196, 0, 1,
-1.159051, -0.1169621, -2.113401, 1, 0.7568628, 0, 1,
-1.157073, -0.3876297, -2.347533, 1, 0.7607843, 0, 1,
-1.15219, -0.5989513, -2.119826, 1, 0.7686275, 0, 1,
-1.142223, 1.167452, -0.9740955, 1, 0.772549, 0, 1,
-1.137849, -0.3593585, -1.109094, 1, 0.7803922, 0, 1,
-1.130228, -1.232477, -3.851667, 1, 0.7843137, 0, 1,
-1.127248, -0.7797185, -2.174021, 1, 0.7921569, 0, 1,
-1.12522, 0.1229869, -1.314809, 1, 0.7960784, 0, 1,
-1.118168, -0.2523481, -2.256593, 1, 0.8039216, 0, 1,
-1.104298, 1.080938, -2.055994, 1, 0.8117647, 0, 1,
-1.098857, 0.9786977, -1.464068, 1, 0.8156863, 0, 1,
-1.090186, 0.1785096, -1.872091, 1, 0.8235294, 0, 1,
-1.087981, -1.149321, -1.598546, 1, 0.827451, 0, 1,
-1.085557, 2.036238, -0.0390439, 1, 0.8352941, 0, 1,
-1.084296, 0.002916947, -0.6574071, 1, 0.8392157, 0, 1,
-1.081355, 1.446319, 0.9535943, 1, 0.8470588, 0, 1,
-1.064336, 1.376177, -0.6109249, 1, 0.8509804, 0, 1,
-1.045791, -0.06403765, -2.580852, 1, 0.8588235, 0, 1,
-1.037234, 2.298601, -0.04334521, 1, 0.8627451, 0, 1,
-1.036667, -1.244605, 0.07701809, 1, 0.8705882, 0, 1,
-1.033551, -0.6820111, -0.6312034, 1, 0.8745098, 0, 1,
-1.028182, 0.4623005, -0.3795958, 1, 0.8823529, 0, 1,
-1.024987, -0.1115341, -2.273384, 1, 0.8862745, 0, 1,
-1.022909, 1.244364, -0.3286153, 1, 0.8941177, 0, 1,
-1.022369, 0.6162589, -2.50721, 1, 0.8980392, 0, 1,
-1.017607, 0.2140934, -2.172549, 1, 0.9058824, 0, 1,
-1.008421, -0.2400335, -1.887249, 1, 0.9137255, 0, 1,
-1.003134, 0.6062941, -2.000144, 1, 0.9176471, 0, 1,
-1.00038, 0.1605506, -0.6532294, 1, 0.9254902, 0, 1,
-0.9979554, 0.2326888, -2.042606, 1, 0.9294118, 0, 1,
-0.9954222, -0.6408046, -3.235315, 1, 0.9372549, 0, 1,
-0.9927024, -1.214828, -2.81684, 1, 0.9411765, 0, 1,
-0.9904471, -0.1479068, -1.886376, 1, 0.9490196, 0, 1,
-0.9756966, -0.2255442, -2.686821, 1, 0.9529412, 0, 1,
-0.9752793, 0.5446021, -1.728541, 1, 0.9607843, 0, 1,
-0.9731345, -1.064515, -3.552841, 1, 0.9647059, 0, 1,
-0.9678435, 1.531029, -0.6471927, 1, 0.972549, 0, 1,
-0.9664161, 0.8412229, -0.3877279, 1, 0.9764706, 0, 1,
-0.9540436, -0.7887897, -3.695008, 1, 0.9843137, 0, 1,
-0.947036, 0.3492169, 0.3352619, 1, 0.9882353, 0, 1,
-0.9453748, -0.5618411, -3.220794, 1, 0.9960784, 0, 1,
-0.9427989, 0.800847, -0.01482147, 0.9960784, 1, 0, 1,
-0.9418699, -1.644867, -3.014405, 0.9921569, 1, 0, 1,
-0.9413089, 1.619073, -2.594337, 0.9843137, 1, 0, 1,
-0.9280999, -0.9280892, -4.507747, 0.9803922, 1, 0, 1,
-0.9257173, -1.489571, -1.829135, 0.972549, 1, 0, 1,
-0.9233217, 1.842377, -1.820439, 0.9686275, 1, 0, 1,
-0.9220624, -0.3618859, -1.546324, 0.9607843, 1, 0, 1,
-0.9155409, 0.701894, -1.198156, 0.9568627, 1, 0, 1,
-0.9141133, 0.01446227, -1.248407, 0.9490196, 1, 0, 1,
-0.9140441, 2.215507, 0.05265013, 0.945098, 1, 0, 1,
-0.9060584, 0.4277033, -2.178197, 0.9372549, 1, 0, 1,
-0.9059328, 0.3537239, -1.724851, 0.9333333, 1, 0, 1,
-0.8837471, -0.3201037, -2.021726, 0.9254902, 1, 0, 1,
-0.8765732, 0.6042606, -1.387949, 0.9215686, 1, 0, 1,
-0.8743544, 1.891835, -0.3354229, 0.9137255, 1, 0, 1,
-0.8727722, 0.4299824, 0.6669825, 0.9098039, 1, 0, 1,
-0.8717193, 0.2904319, -1.340789, 0.9019608, 1, 0, 1,
-0.8677194, -0.9335421, -1.856168, 0.8941177, 1, 0, 1,
-0.8622599, 0.9562553, -1.311846, 0.8901961, 1, 0, 1,
-0.8596811, -1.886951, -2.752988, 0.8823529, 1, 0, 1,
-0.8552924, 0.07706335, 0.4531179, 0.8784314, 1, 0, 1,
-0.8532673, 0.4885801, -1.950038, 0.8705882, 1, 0, 1,
-0.8499881, -0.8566262, -2.390171, 0.8666667, 1, 0, 1,
-0.8490458, -1.069253, -1.694409, 0.8588235, 1, 0, 1,
-0.846628, -0.03548219, -0.2688188, 0.854902, 1, 0, 1,
-0.8452771, 1.640784, -0.9404053, 0.8470588, 1, 0, 1,
-0.8442276, 0.9946103, -0.2024291, 0.8431373, 1, 0, 1,
-0.8408732, -0.3159006, -1.929601, 0.8352941, 1, 0, 1,
-0.8403931, 0.04462774, -2.41156, 0.8313726, 1, 0, 1,
-0.838066, -0.3789344, -1.875863, 0.8235294, 1, 0, 1,
-0.8347695, -1.200468, -3.813528, 0.8196079, 1, 0, 1,
-0.834482, -0.2571377, -2.656689, 0.8117647, 1, 0, 1,
-0.833053, 0.7946408, -0.7364922, 0.8078431, 1, 0, 1,
-0.831597, -0.977411, -1.22618, 0.8, 1, 0, 1,
-0.8297848, -1.275894, -1.642082, 0.7921569, 1, 0, 1,
-0.8285302, -0.06895683, -1.381689, 0.7882353, 1, 0, 1,
-0.827767, -0.1816861, -2.910463, 0.7803922, 1, 0, 1,
-0.827704, -0.6664681, -2.06, 0.7764706, 1, 0, 1,
-0.8209105, -0.1222088, -2.806636, 0.7686275, 1, 0, 1,
-0.8138024, 1.131739, -0.7579671, 0.7647059, 1, 0, 1,
-0.813437, -1.222111, -1.433355, 0.7568628, 1, 0, 1,
-0.8084354, -0.6631616, -2.349712, 0.7529412, 1, 0, 1,
-0.8028053, -0.613087, -1.092961, 0.7450981, 1, 0, 1,
-0.8024234, -0.1437116, -1.989025, 0.7411765, 1, 0, 1,
-0.8012378, -1.373638, -1.269293, 0.7333333, 1, 0, 1,
-0.7986981, 1.297707, 0.1487888, 0.7294118, 1, 0, 1,
-0.7937223, 0.7246855, -1.519199, 0.7215686, 1, 0, 1,
-0.7875813, -0.608663, -2.199166, 0.7176471, 1, 0, 1,
-0.7767692, 0.4990361, -0.7178618, 0.7098039, 1, 0, 1,
-0.7755937, 0.8363934, 0.2286869, 0.7058824, 1, 0, 1,
-0.7734418, 0.7146505, 1.410228, 0.6980392, 1, 0, 1,
-0.7715955, -0.4738582, -1.618569, 0.6901961, 1, 0, 1,
-0.7657537, 0.4931716, -0.2292684, 0.6862745, 1, 0, 1,
-0.7645205, 1.5686, -0.8920701, 0.6784314, 1, 0, 1,
-0.7623632, -0.1627795, -0.4496132, 0.6745098, 1, 0, 1,
-0.7568228, 1.686695, -0.3921273, 0.6666667, 1, 0, 1,
-0.7494259, 0.8238004, -1.127782, 0.6627451, 1, 0, 1,
-0.7464272, 0.7714051, 0.5514578, 0.654902, 1, 0, 1,
-0.7448512, 0.08851981, -0.1770079, 0.6509804, 1, 0, 1,
-0.7409301, 0.09636205, -1.615292, 0.6431373, 1, 0, 1,
-0.7405037, 0.6126168, -1.239382, 0.6392157, 1, 0, 1,
-0.7388919, -2.272146, -1.836941, 0.6313726, 1, 0, 1,
-0.730272, -0.8096164, -2.661405, 0.627451, 1, 0, 1,
-0.7291317, 0.4884409, -2.438159, 0.6196079, 1, 0, 1,
-0.7272992, -1.649723, -3.592328, 0.6156863, 1, 0, 1,
-0.7156097, 2.323014, -0.5908101, 0.6078432, 1, 0, 1,
-0.7028989, -0.4723967, -2.613024, 0.6039216, 1, 0, 1,
-0.7010683, -0.5491756, -0.4192506, 0.5960785, 1, 0, 1,
-0.6979241, -0.3944536, -1.702174, 0.5882353, 1, 0, 1,
-0.6892308, 0.8121482, 0.9064623, 0.5843138, 1, 0, 1,
-0.688723, -0.5852839, -2.308753, 0.5764706, 1, 0, 1,
-0.687949, -0.7595851, -2.136462, 0.572549, 1, 0, 1,
-0.6853443, 0.715012, -2.694276, 0.5647059, 1, 0, 1,
-0.6811908, -0.7029645, -1.782832, 0.5607843, 1, 0, 1,
-0.6764262, 0.8554326, -1.883306, 0.5529412, 1, 0, 1,
-0.6716196, -1.266025, -2.687387, 0.5490196, 1, 0, 1,
-0.6681994, -0.3887974, -1.6242, 0.5411765, 1, 0, 1,
-0.662571, 0.9941067, -0.8974115, 0.5372549, 1, 0, 1,
-0.6621343, 0.783987, -0.8746052, 0.5294118, 1, 0, 1,
-0.6611533, -0.694633, -2.805312, 0.5254902, 1, 0, 1,
-0.6576495, -0.5771087, -2.24378, 0.5176471, 1, 0, 1,
-0.6571605, 0.5085228, -1.473604, 0.5137255, 1, 0, 1,
-0.6553403, -0.1385218, -2.52703, 0.5058824, 1, 0, 1,
-0.6437093, -0.4395089, -3.634167, 0.5019608, 1, 0, 1,
-0.6394252, -1.069547, -3.580148, 0.4941176, 1, 0, 1,
-0.6332259, -1.407418, -1.51962, 0.4862745, 1, 0, 1,
-0.6301779, 2.305746, 0.09402726, 0.4823529, 1, 0, 1,
-0.6297472, -0.3841273, -3.193368, 0.4745098, 1, 0, 1,
-0.6291247, 0.02180242, -2.148573, 0.4705882, 1, 0, 1,
-0.6289319, -0.3197648, -2.116251, 0.4627451, 1, 0, 1,
-0.6244306, -0.4448794, -3.347861, 0.4588235, 1, 0, 1,
-0.6223797, -0.8516992, -2.907588, 0.4509804, 1, 0, 1,
-0.6153207, -0.08591974, -1.802887, 0.4470588, 1, 0, 1,
-0.6151375, 0.3505744, -1.660584, 0.4392157, 1, 0, 1,
-0.6116506, 1.32309, 0.3346541, 0.4352941, 1, 0, 1,
-0.603145, -0.1514868, -1.985, 0.427451, 1, 0, 1,
-0.5994923, -1.143355, -2.90663, 0.4235294, 1, 0, 1,
-0.5978597, -0.4617181, -1.684614, 0.4156863, 1, 0, 1,
-0.5886301, 0.6714892, -1.965691, 0.4117647, 1, 0, 1,
-0.5871237, 0.6767876, -1.442634, 0.4039216, 1, 0, 1,
-0.5842077, -0.5445811, -3.379072, 0.3960784, 1, 0, 1,
-0.5828333, -0.4696686, -1.279335, 0.3921569, 1, 0, 1,
-0.5814248, -0.3546737, -1.531167, 0.3843137, 1, 0, 1,
-0.5812634, 1.312872, -1.241105, 0.3803922, 1, 0, 1,
-0.5803957, 0.1000045, -0.566497, 0.372549, 1, 0, 1,
-0.5790735, -1.65957, -1.95962, 0.3686275, 1, 0, 1,
-0.5787911, 0.3417846, -0.9527816, 0.3607843, 1, 0, 1,
-0.5781884, 2.269695, 0.5876571, 0.3568628, 1, 0, 1,
-0.5777805, -0.1820441, -0.643074, 0.3490196, 1, 0, 1,
-0.5773821, -0.02768337, 0.1322932, 0.345098, 1, 0, 1,
-0.5708839, -0.6494104, -2.841407, 0.3372549, 1, 0, 1,
-0.5706419, 0.0145823, -2.009447, 0.3333333, 1, 0, 1,
-0.5703568, 0.7762482, 0.02492614, 0.3254902, 1, 0, 1,
-0.5666533, -0.4347315, -2.036683, 0.3215686, 1, 0, 1,
-0.5649656, 0.629092, 1.289814, 0.3137255, 1, 0, 1,
-0.5600325, 1.368223, 1.567956, 0.3098039, 1, 0, 1,
-0.5576357, -0.6906296, -2.925232, 0.3019608, 1, 0, 1,
-0.5563717, -0.79958, -2.131077, 0.2941177, 1, 0, 1,
-0.5559718, 0.1635575, -0.3646467, 0.2901961, 1, 0, 1,
-0.550451, 1.080255, -0.4167688, 0.282353, 1, 0, 1,
-0.5500164, 0.8517815, -2.760972, 0.2784314, 1, 0, 1,
-0.5487729, 0.7314795, -1.548173, 0.2705882, 1, 0, 1,
-0.5456152, -0.6325122, -2.263638, 0.2666667, 1, 0, 1,
-0.5442568, -1.185794, -2.724001, 0.2588235, 1, 0, 1,
-0.5441264, -2.149639, -5.261015, 0.254902, 1, 0, 1,
-0.5440183, 0.8369212, -1.250627, 0.2470588, 1, 0, 1,
-0.5422812, -0.6315318, -2.135221, 0.2431373, 1, 0, 1,
-0.5401188, -2.153801, -4.73368, 0.2352941, 1, 0, 1,
-0.538868, -0.5408497, -3.893216, 0.2313726, 1, 0, 1,
-0.5382265, -0.1304153, -0.8020851, 0.2235294, 1, 0, 1,
-0.5374306, 0.1910518, -2.028512, 0.2196078, 1, 0, 1,
-0.5340515, -0.3356896, -2.446645, 0.2117647, 1, 0, 1,
-0.5335109, -0.4669093, -2.786726, 0.2078431, 1, 0, 1,
-0.5317153, 0.733041, -0.8092874, 0.2, 1, 0, 1,
-0.5289713, 1.002921, -0.4017064, 0.1921569, 1, 0, 1,
-0.5244383, 0.08158019, -1.638039, 0.1882353, 1, 0, 1,
-0.523796, 0.4559629, -1.059719, 0.1803922, 1, 0, 1,
-0.5230152, 0.1799577, -2.472908, 0.1764706, 1, 0, 1,
-0.5203815, -0.8778079, -3.464833, 0.1686275, 1, 0, 1,
-0.5156997, -1.588148, -1.065276, 0.1647059, 1, 0, 1,
-0.5098643, 0.2906792, -2.639379, 0.1568628, 1, 0, 1,
-0.5091786, 0.4269194, -0.5271764, 0.1529412, 1, 0, 1,
-0.5082163, 2.102448, 0.1761163, 0.145098, 1, 0, 1,
-0.505732, -0.5756646, -3.298795, 0.1411765, 1, 0, 1,
-0.5021644, 0.8867768, 0.5685824, 0.1333333, 1, 0, 1,
-0.5007301, 0.08797947, -1.43071, 0.1294118, 1, 0, 1,
-0.4998389, 1.040832, -2.35199, 0.1215686, 1, 0, 1,
-0.4982592, 0.8838127, -1.176297, 0.1176471, 1, 0, 1,
-0.498142, -0.1082393, -1.191174, 0.1098039, 1, 0, 1,
-0.49525, 0.5438034, -1.120577, 0.1058824, 1, 0, 1,
-0.4939164, 0.3118879, -2.372717, 0.09803922, 1, 0, 1,
-0.4917769, 2.710155, 0.555992, 0.09019608, 1, 0, 1,
-0.4894594, -0.5010727, -3.138395, 0.08627451, 1, 0, 1,
-0.4891074, -0.1642431, -3.142293, 0.07843138, 1, 0, 1,
-0.4876312, 0.9219127, -0.1132349, 0.07450981, 1, 0, 1,
-0.4856052, 0.9725762, -0.5150374, 0.06666667, 1, 0, 1,
-0.4834573, 0.1106193, -1.918142, 0.0627451, 1, 0, 1,
-0.4820525, -0.1149664, -2.29418, 0.05490196, 1, 0, 1,
-0.4819916, -1.175295, -2.107044, 0.05098039, 1, 0, 1,
-0.4800367, 1.510911, -1.859675, 0.04313726, 1, 0, 1,
-0.4766445, -0.6778485, -1.58651, 0.03921569, 1, 0, 1,
-0.4755679, 0.233175, 0.7886949, 0.03137255, 1, 0, 1,
-0.473691, -0.6531075, -2.018596, 0.02745098, 1, 0, 1,
-0.4722694, 0.4308706, 0.08325063, 0.01960784, 1, 0, 1,
-0.471833, 0.4939117, -0.1292636, 0.01568628, 1, 0, 1,
-0.4657726, 0.207304, -0.4939052, 0.007843138, 1, 0, 1,
-0.4649775, -0.6669003, -1.262074, 0.003921569, 1, 0, 1,
-0.4622544, 0.7391263, 0.4020006, 0, 1, 0.003921569, 1,
-0.4582053, -1.29555, -1.909446, 0, 1, 0.01176471, 1,
-0.4578134, -0.09441306, -0.447107, 0, 1, 0.01568628, 1,
-0.4534045, 1.778723, -1.620325, 0, 1, 0.02352941, 1,
-0.451632, -0.8098548, -2.475208, 0, 1, 0.02745098, 1,
-0.4514413, -0.1637101, -1.680323, 0, 1, 0.03529412, 1,
-0.450422, -0.8807662, -3.572668, 0, 1, 0.03921569, 1,
-0.4499052, -0.4733543, -2.461958, 0, 1, 0.04705882, 1,
-0.4488901, -0.140994, -3.993092, 0, 1, 0.05098039, 1,
-0.4470148, -1.251148, -3.194701, 0, 1, 0.05882353, 1,
-0.4466518, -0.3807626, -2.322219, 0, 1, 0.0627451, 1,
-0.4464369, 0.7764331, 0.6539501, 0, 1, 0.07058824, 1,
-0.4463581, 0.2041955, -1.780934, 0, 1, 0.07450981, 1,
-0.4462596, 0.6276063, -0.917172, 0, 1, 0.08235294, 1,
-0.4452035, -0.8334125, -2.751655, 0, 1, 0.08627451, 1,
-0.4423723, 0.6097207, -1.734845, 0, 1, 0.09411765, 1,
-0.4375699, -1.361016, -3.823178, 0, 1, 0.1019608, 1,
-0.437486, 0.3312919, -0.7472813, 0, 1, 0.1058824, 1,
-0.4367572, -0.6819, -3.38754, 0, 1, 0.1137255, 1,
-0.4359821, -0.1301651, -3.460372, 0, 1, 0.1176471, 1,
-0.4312874, 1.434216, 0.3496081, 0, 1, 0.1254902, 1,
-0.4234167, -1.741164, -3.487485, 0, 1, 0.1294118, 1,
-0.4202395, 0.6771383, -0.2222925, 0, 1, 0.1372549, 1,
-0.4170027, 2.11289, 0.8827911, 0, 1, 0.1411765, 1,
-0.4142728, 0.07766136, -0.7424812, 0, 1, 0.1490196, 1,
-0.4100571, -0.4706497, -1.940615, 0, 1, 0.1529412, 1,
-0.4026521, -1.347401, -3.290468, 0, 1, 0.1607843, 1,
-0.4013767, 0.1297938, -2.125261, 0, 1, 0.1647059, 1,
-0.3990982, 0.2157906, -1.75712, 0, 1, 0.172549, 1,
-0.3970686, 0.3728101, -0.6714742, 0, 1, 0.1764706, 1,
-0.3965811, -0.09703145, -2.195554, 0, 1, 0.1843137, 1,
-0.3937357, -1.437498, -3.20659, 0, 1, 0.1882353, 1,
-0.3936041, 0.3465851, -2.112064, 0, 1, 0.1960784, 1,
-0.3921807, 0.1634637, -0.189262, 0, 1, 0.2039216, 1,
-0.3901704, -0.3779312, -2.302639, 0, 1, 0.2078431, 1,
-0.3900989, -1.419085, -2.719895, 0, 1, 0.2156863, 1,
-0.3892082, -0.1589441, -1.565009, 0, 1, 0.2196078, 1,
-0.3874262, -0.2447723, -1.198201, 0, 1, 0.227451, 1,
-0.3851073, 0.9749424, -0.5844785, 0, 1, 0.2313726, 1,
-0.377041, -1.062423, -2.810308, 0, 1, 0.2392157, 1,
-0.3760352, 1.306984, -2.050669, 0, 1, 0.2431373, 1,
-0.3727622, -0.4433548, -2.631226, 0, 1, 0.2509804, 1,
-0.3721605, -1.173027, -4.553765, 0, 1, 0.254902, 1,
-0.3718888, 1.405042, 0.3158268, 0, 1, 0.2627451, 1,
-0.3698025, -0.5412814, -3.203431, 0, 1, 0.2666667, 1,
-0.3693139, -0.3417867, -1.445424, 0, 1, 0.2745098, 1,
-0.3575711, 0.709745, 1.82368, 0, 1, 0.2784314, 1,
-0.3564163, 0.186247, -1.775839, 0, 1, 0.2862745, 1,
-0.3539667, 1.557312, 0.624044, 0, 1, 0.2901961, 1,
-0.3536819, 2.127988, -0.1584207, 0, 1, 0.2980392, 1,
-0.3520582, 0.4583734, -1.911378, 0, 1, 0.3058824, 1,
-0.3495134, -1.544018, -5.386655, 0, 1, 0.3098039, 1,
-0.347624, -0.2075624, -2.435314, 0, 1, 0.3176471, 1,
-0.3463576, 2.190987, -1.352707, 0, 1, 0.3215686, 1,
-0.345919, -0.07981508, -0.4051557, 0, 1, 0.3294118, 1,
-0.3456965, -0.1313074, -1.736477, 0, 1, 0.3333333, 1,
-0.3417706, -0.5735456, -4.176232, 0, 1, 0.3411765, 1,
-0.3405399, -0.727197, -2.966962, 0, 1, 0.345098, 1,
-0.3391482, -1.896961, -3.010458, 0, 1, 0.3529412, 1,
-0.3382409, 0.5858597, -2.46565, 0, 1, 0.3568628, 1,
-0.3327797, 1.77098, 0.5184655, 0, 1, 0.3647059, 1,
-0.3297833, -0.7780398, -2.307898, 0, 1, 0.3686275, 1,
-0.3251624, 0.4386852, -1.773576, 0, 1, 0.3764706, 1,
-0.3205822, -0.7184237, -2.820831, 0, 1, 0.3803922, 1,
-0.314512, -1.215276, -3.798404, 0, 1, 0.3882353, 1,
-0.3070536, 0.6245976, -0.5860512, 0, 1, 0.3921569, 1,
-0.3050448, -1.167562, -2.601593, 0, 1, 0.4, 1,
-0.2996446, -0.5254471, -2.791154, 0, 1, 0.4078431, 1,
-0.297482, 0.6267436, -1.72423, 0, 1, 0.4117647, 1,
-0.2956499, 0.7168657, -1.081715, 0, 1, 0.4196078, 1,
-0.2939211, -0.361442, -1.735093, 0, 1, 0.4235294, 1,
-0.2871615, -0.0279199, -1.454075, 0, 1, 0.4313726, 1,
-0.2871488, 0.09714613, -0.4897408, 0, 1, 0.4352941, 1,
-0.2869427, -0.127969, -1.418334, 0, 1, 0.4431373, 1,
-0.2829204, -0.1025817, -3.305404, 0, 1, 0.4470588, 1,
-0.2824701, 0.331129, -1.785584, 0, 1, 0.454902, 1,
-0.2800012, -1.01559, -4.180028, 0, 1, 0.4588235, 1,
-0.2798257, 0.2778353, -0.5515994, 0, 1, 0.4666667, 1,
-0.2797239, -0.4444703, -2.594266, 0, 1, 0.4705882, 1,
-0.2739915, -0.2057736, -2.969093, 0, 1, 0.4784314, 1,
-0.2730765, 0.6398922, -0.3033495, 0, 1, 0.4823529, 1,
-0.2717177, 1.755512, 0.2468271, 0, 1, 0.4901961, 1,
-0.2713656, 1.132914, -0.06262237, 0, 1, 0.4941176, 1,
-0.2710142, -1.70732, -1.558883, 0, 1, 0.5019608, 1,
-0.2698173, 0.2390036, -0.02049732, 0, 1, 0.509804, 1,
-0.2633869, 0.08257299, 0.8447978, 0, 1, 0.5137255, 1,
-0.2578872, 0.1024697, -0.909125, 0, 1, 0.5215687, 1,
-0.2568111, -0.740042, -2.774372, 0, 1, 0.5254902, 1,
-0.2565868, -0.3217646, -2.304968, 0, 1, 0.5333334, 1,
-0.2563382, 0.9196128, 0.05218738, 0, 1, 0.5372549, 1,
-0.2528239, 0.9317927, -0.7489359, 0, 1, 0.5450981, 1,
-0.2519257, 0.2663505, 0.2028299, 0, 1, 0.5490196, 1,
-0.2501316, -0.2010149, -2.934325, 0, 1, 0.5568628, 1,
-0.2459023, 2.026067, 0.2622844, 0, 1, 0.5607843, 1,
-0.2433831, -1.248796, -4.132237, 0, 1, 0.5686275, 1,
-0.2418623, -1.564514, -4.281656, 0, 1, 0.572549, 1,
-0.2411372, 1.541729, 0.8553678, 0, 1, 0.5803922, 1,
-0.240678, 0.06562602, 0.1410598, 0, 1, 0.5843138, 1,
-0.232608, -1.794406, -3.339104, 0, 1, 0.5921569, 1,
-0.2303727, 0.2211854, 0.4682432, 0, 1, 0.5960785, 1,
-0.2271884, 1.573864, 0.6949069, 0, 1, 0.6039216, 1,
-0.2269869, 0.3839508, 0.4534028, 0, 1, 0.6117647, 1,
-0.2264072, 0.565239, 0.6665828, 0, 1, 0.6156863, 1,
-0.224554, 0.4594067, -0.01440945, 0, 1, 0.6235294, 1,
-0.223843, 1.80714, 0.8124785, 0, 1, 0.627451, 1,
-0.2231166, 0.7208394, -1.77731, 0, 1, 0.6352941, 1,
-0.218803, 0.9075502, 0.1496794, 0, 1, 0.6392157, 1,
-0.2098238, -0.434848, -2.574029, 0, 1, 0.6470588, 1,
-0.2084893, 1.032368, -0.5347599, 0, 1, 0.6509804, 1,
-0.203866, 0.343215, -2.4449, 0, 1, 0.6588235, 1,
-0.2028253, -1.444443, -2.690016, 0, 1, 0.6627451, 1,
-0.2018225, -0.8865937, -1.388944, 0, 1, 0.6705883, 1,
-0.1959015, -0.01101096, -1.343632, 0, 1, 0.6745098, 1,
-0.1920527, -0.8757114, -2.28806, 0, 1, 0.682353, 1,
-0.1834121, 0.6121837, 0.2505164, 0, 1, 0.6862745, 1,
-0.1788516, -0.5345469, -3.959624, 0, 1, 0.6941177, 1,
-0.1751864, 0.04471292, -0.7863535, 0, 1, 0.7019608, 1,
-0.1744603, -0.5536988, -2.208465, 0, 1, 0.7058824, 1,
-0.1694602, -0.1325587, -3.315235, 0, 1, 0.7137255, 1,
-0.1651806, -0.04168528, -3.029995, 0, 1, 0.7176471, 1,
-0.164609, 0.3680139, 0.450678, 0, 1, 0.7254902, 1,
-0.1630087, -0.8250043, -2.341901, 0, 1, 0.7294118, 1,
-0.1615668, -0.9299344, -2.275562, 0, 1, 0.7372549, 1,
-0.1611097, -1.07765, -3.026544, 0, 1, 0.7411765, 1,
-0.1562157, -0.6277539, -1.970783, 0, 1, 0.7490196, 1,
-0.1561609, -0.2173214, -2.523823, 0, 1, 0.7529412, 1,
-0.1518687, 0.9600379, 0.1284893, 0, 1, 0.7607843, 1,
-0.1425983, 0.1650339, 0.6968939, 0, 1, 0.7647059, 1,
-0.1399369, -0.8113441, -2.077665, 0, 1, 0.772549, 1,
-0.1399214, -0.2441304, -1.081186, 0, 1, 0.7764706, 1,
-0.1212912, -1.634498, -2.980646, 0, 1, 0.7843137, 1,
-0.119423, -1.113661, -2.711815, 0, 1, 0.7882353, 1,
-0.1193491, 2.726665, 0.6670196, 0, 1, 0.7960784, 1,
-0.1159448, 0.9214969, 1.476443, 0, 1, 0.8039216, 1,
-0.1113655, -0.806756, -3.278252, 0, 1, 0.8078431, 1,
-0.1051317, 1.298638, 0.1882036, 0, 1, 0.8156863, 1,
-0.1003789, -1.282996, -2.623142, 0, 1, 0.8196079, 1,
-0.09845612, 0.7453194, -0.4855953, 0, 1, 0.827451, 1,
-0.09351885, 0.1530807, -2.055979, 0, 1, 0.8313726, 1,
-0.09318699, -0.6220182, -4.447608, 0, 1, 0.8392157, 1,
-0.09254045, 0.8260171, -0.5172064, 0, 1, 0.8431373, 1,
-0.08894812, -0.339291, -4.847731, 0, 1, 0.8509804, 1,
-0.08879796, -0.9015552, -4.264653, 0, 1, 0.854902, 1,
-0.08550428, 0.438477, -1.568589, 0, 1, 0.8627451, 1,
-0.08245464, 0.6735592, 2.317131, 0, 1, 0.8666667, 1,
-0.07641478, 0.06388764, -1.982716, 0, 1, 0.8745098, 1,
-0.07357777, -0.4436849, -1.210558, 0, 1, 0.8784314, 1,
-0.07136757, -0.5369785, -1.907681, 0, 1, 0.8862745, 1,
-0.06872711, 0.8997467, 1.842618, 0, 1, 0.8901961, 1,
-0.0638843, -0.9106995, -2.265558, 0, 1, 0.8980392, 1,
-0.06346142, 1.28705, -0.6045133, 0, 1, 0.9058824, 1,
-0.05975241, 0.2998851, -0.1845154, 0, 1, 0.9098039, 1,
-0.05834129, 1.332331, -0.007285924, 0, 1, 0.9176471, 1,
-0.05581602, -0.06202674, -2.984205, 0, 1, 0.9215686, 1,
-0.0557725, 0.6986656, -0.2496748, 0, 1, 0.9294118, 1,
-0.05481825, -0.3731934, -4.005717, 0, 1, 0.9333333, 1,
-0.0520346, 1.097883, -0.3731749, 0, 1, 0.9411765, 1,
-0.05019584, -0.0426793, -2.149967, 0, 1, 0.945098, 1,
-0.04597139, 0.1012397, 0.106029, 0, 1, 0.9529412, 1,
-0.04553577, 1.984591, -0.3066048, 0, 1, 0.9568627, 1,
-0.04377865, -0.5376632, -4.54238, 0, 1, 0.9647059, 1,
-0.04173626, -0.9951189, -2.303439, 0, 1, 0.9686275, 1,
-0.03836666, 0.2536406, -1.133475, 0, 1, 0.9764706, 1,
-0.03099636, 0.1511648, -1.459749, 0, 1, 0.9803922, 1,
-0.0265394, -0.06946956, -3.451479, 0, 1, 0.9882353, 1,
-0.02314142, -0.3431827, -3.888353, 0, 1, 0.9921569, 1,
-0.02203664, 0.8414357, 1.198981, 0, 1, 1, 1,
-0.02164008, 0.03059773, -1.245437, 0, 0.9921569, 1, 1,
-0.0215969, -0.1238209, -3.743843, 0, 0.9882353, 1, 1,
-0.01854379, -0.8026826, -4.202366, 0, 0.9803922, 1, 1,
-0.01762662, -1.118288, -1.662453, 0, 0.9764706, 1, 1,
-0.01109775, 0.2711862, -1.009248, 0, 0.9686275, 1, 1,
-0.01072668, -0.2963697, -3.345364, 0, 0.9647059, 1, 1,
-0.008943521, -0.3332507, -4.254564, 0, 0.9568627, 1, 1,
-0.007167203, 1.147734, -0.452895, 0, 0.9529412, 1, 1,
-0.003071208, 0.2547529, -0.9794899, 0, 0.945098, 1, 1,
-0.002046486, -0.03502673, -3.298395, 0, 0.9411765, 1, 1,
-0.00110792, -0.3719907, -4.166069, 0, 0.9333333, 1, 1,
0.0007527613, -0.02889055, 3.095954, 0, 0.9294118, 1, 1,
0.001562941, -0.7936667, 2.512849, 0, 0.9215686, 1, 1,
0.001862975, -0.150642, 2.142893, 0, 0.9176471, 1, 1,
0.003312654, 0.9482068, -0.1364617, 0, 0.9098039, 1, 1,
0.004407701, -0.76789, 3.172028, 0, 0.9058824, 1, 1,
0.007753789, 1.135816, -1.181733, 0, 0.8980392, 1, 1,
0.01047419, 0.4707957, 0.8663039, 0, 0.8901961, 1, 1,
0.01336504, 0.4819079, -1.679177, 0, 0.8862745, 1, 1,
0.02128005, -0.1487094, 3.293357, 0, 0.8784314, 1, 1,
0.02183844, 1.048667, 0.6714302, 0, 0.8745098, 1, 1,
0.0226321, 0.8671826, -0.8106228, 0, 0.8666667, 1, 1,
0.02444609, -2.08865, 3.307124, 0, 0.8627451, 1, 1,
0.02792848, -1.331954, 2.994192, 0, 0.854902, 1, 1,
0.0294759, 0.5114608, 0.9016533, 0, 0.8509804, 1, 1,
0.02998084, 0.3876172, -1.726602, 0, 0.8431373, 1, 1,
0.0328757, 1.643628, -2.215897, 0, 0.8392157, 1, 1,
0.0375071, -0.6625183, 2.969928, 0, 0.8313726, 1, 1,
0.04222026, 2.401375, -0.5139865, 0, 0.827451, 1, 1,
0.04347227, 0.4133996, -1.17789, 0, 0.8196079, 1, 1,
0.05279026, -0.2816906, 2.770468, 0, 0.8156863, 1, 1,
0.05643131, -0.6906596, 3.468956, 0, 0.8078431, 1, 1,
0.06204762, -0.3757991, 4.060316, 0, 0.8039216, 1, 1,
0.06341387, 0.1600461, -0.7449786, 0, 0.7960784, 1, 1,
0.06578176, -0.06284729, 2.99229, 0, 0.7882353, 1, 1,
0.06797522, 1.20088, 1.573646, 0, 0.7843137, 1, 1,
0.07128451, 0.679586, 2.498199, 0, 0.7764706, 1, 1,
0.07134499, -0.2272604, 2.695649, 0, 0.772549, 1, 1,
0.07516301, 1.006489, -0.4737177, 0, 0.7647059, 1, 1,
0.07561423, -0.006520534, 1.637072, 0, 0.7607843, 1, 1,
0.08175269, 1.592279, -0.2452118, 0, 0.7529412, 1, 1,
0.08673798, 1.616802, 0.5961945, 0, 0.7490196, 1, 1,
0.08794063, 0.1483594, 0.4153023, 0, 0.7411765, 1, 1,
0.08821461, 1.843313, -0.1359799, 0, 0.7372549, 1, 1,
0.08990873, 0.03019875, 1.870191, 0, 0.7294118, 1, 1,
0.09081395, -0.4706495, 2.175193, 0, 0.7254902, 1, 1,
0.09543063, -1.260239, 2.084666, 0, 0.7176471, 1, 1,
0.1001679, -0.9875699, 4.031711, 0, 0.7137255, 1, 1,
0.1044369, 0.2291914, -1.016105, 0, 0.7058824, 1, 1,
0.1048596, 0.46988, 1.317971, 0, 0.6980392, 1, 1,
0.107225, 0.4821549, -0.1687845, 0, 0.6941177, 1, 1,
0.1093142, -0.5363631, 3.949335, 0, 0.6862745, 1, 1,
0.1140925, -0.7430766, 3.741932, 0, 0.682353, 1, 1,
0.1178952, 0.2509119, 1.278431, 0, 0.6745098, 1, 1,
0.1210706, 1.260213, -0.7713072, 0, 0.6705883, 1, 1,
0.1224566, 0.5408788, 0.6216804, 0, 0.6627451, 1, 1,
0.1260447, -0.1113058, 1.910491, 0, 0.6588235, 1, 1,
0.1303939, -1.039681, 2.043061, 0, 0.6509804, 1, 1,
0.1306505, -0.9697018, 2.493384, 0, 0.6470588, 1, 1,
0.1309613, -1.899795, 3.669794, 0, 0.6392157, 1, 1,
0.1340379, -0.1621193, 1.664103, 0, 0.6352941, 1, 1,
0.1349517, 0.7883855, -0.05017813, 0, 0.627451, 1, 1,
0.1367555, -0.0150117, 0.3655232, 0, 0.6235294, 1, 1,
0.1373449, 2.101692, 0.5912752, 0, 0.6156863, 1, 1,
0.138947, -0.3372738, 4.071047, 0, 0.6117647, 1, 1,
0.1391465, 0.5364634, -0.3865432, 0, 0.6039216, 1, 1,
0.1409526, 2.269455, -2.25172, 0, 0.5960785, 1, 1,
0.1440134, 0.3641094, -1.020851, 0, 0.5921569, 1, 1,
0.1527482, 1.66733, -1.268438, 0, 0.5843138, 1, 1,
0.1573786, -1.192721, 2.972419, 0, 0.5803922, 1, 1,
0.1575069, -2.007841, 2.982117, 0, 0.572549, 1, 1,
0.1578165, 0.05648032, 1.38895, 0, 0.5686275, 1, 1,
0.1591307, 1.479134, -0.6191543, 0, 0.5607843, 1, 1,
0.1596725, -2.254708, 2.595529, 0, 0.5568628, 1, 1,
0.1615351, -0.8201401, 1.528126, 0, 0.5490196, 1, 1,
0.1629616, -0.1579843, 3.357008, 0, 0.5450981, 1, 1,
0.1697584, 1.978122, 0.8340442, 0, 0.5372549, 1, 1,
0.1709555, 1.023593, 0.04516296, 0, 0.5333334, 1, 1,
0.1831494, 1.161215, -0.9328652, 0, 0.5254902, 1, 1,
0.192654, 0.2265223, 0.4947117, 0, 0.5215687, 1, 1,
0.197534, 0.70432, 0.1278827, 0, 0.5137255, 1, 1,
0.1979101, 0.9415219, 0.3566657, 0, 0.509804, 1, 1,
0.1986512, 2.532085, -0.8712946, 0, 0.5019608, 1, 1,
0.2005916, -0.003849576, 2.171161, 0, 0.4941176, 1, 1,
0.2045243, 0.7563745, 0.7317036, 0, 0.4901961, 1, 1,
0.2097984, -0.03599042, 2.060053, 0, 0.4823529, 1, 1,
0.2163276, -1.344273, 3.549053, 0, 0.4784314, 1, 1,
0.2196605, -0.3756708, 3.018196, 0, 0.4705882, 1, 1,
0.2263889, 0.1420919, 1.447734, 0, 0.4666667, 1, 1,
0.2267054, -1.258911, 2.385607, 0, 0.4588235, 1, 1,
0.2269052, -2.204671, 1.860626, 0, 0.454902, 1, 1,
0.2293476, -0.60225, 2.606176, 0, 0.4470588, 1, 1,
0.2322697, -0.4508336, 1.668336, 0, 0.4431373, 1, 1,
0.233965, -1.102572, 3.659274, 0, 0.4352941, 1, 1,
0.234615, -0.07229692, 1.691036, 0, 0.4313726, 1, 1,
0.2352587, 0.7174059, 0.1396206, 0, 0.4235294, 1, 1,
0.2367785, 3.030273, 0.4786192, 0, 0.4196078, 1, 1,
0.2410096, 0.2561502, 1.40238, 0, 0.4117647, 1, 1,
0.2441258, 0.8996028, 1.390545, 0, 0.4078431, 1, 1,
0.2454198, 1.771678, -0.6786619, 0, 0.4, 1, 1,
0.2477571, 0.9103326, 0.5229861, 0, 0.3921569, 1, 1,
0.2497309, -0.6806027, 2.524454, 0, 0.3882353, 1, 1,
0.2536582, 0.8837707, 2.315423, 0, 0.3803922, 1, 1,
0.2537682, 0.4892313, 1.349199, 0, 0.3764706, 1, 1,
0.2541855, 0.8897361, 0.6802203, 0, 0.3686275, 1, 1,
0.2545313, -0.7811483, 1.885982, 0, 0.3647059, 1, 1,
0.2545673, -0.5387681, 2.126813, 0, 0.3568628, 1, 1,
0.257109, 1.093908, 0.386247, 0, 0.3529412, 1, 1,
0.2585247, 1.154407, -0.2819588, 0, 0.345098, 1, 1,
0.2633175, -0.119828, 2.228316, 0, 0.3411765, 1, 1,
0.2672091, -0.2021976, 1.938289, 0, 0.3333333, 1, 1,
0.2699391, -0.07179032, 2.308352, 0, 0.3294118, 1, 1,
0.271928, -1.416207, 2.78712, 0, 0.3215686, 1, 1,
0.2819791, 0.7168073, 0.4895258, 0, 0.3176471, 1, 1,
0.2853364, -0.8496678, 2.114303, 0, 0.3098039, 1, 1,
0.2973844, 0.0987976, 0.7159851, 0, 0.3058824, 1, 1,
0.2987859, -0.7155821, 3.831575, 0, 0.2980392, 1, 1,
0.299302, 1.008452, -1.199901, 0, 0.2901961, 1, 1,
0.3051592, 0.8502269, 1.517284, 0, 0.2862745, 1, 1,
0.3070029, 0.02907946, 2.924943, 0, 0.2784314, 1, 1,
0.3075706, 0.4765208, -0.7791322, 0, 0.2745098, 1, 1,
0.3171996, -1.279831, 1.30561, 0, 0.2666667, 1, 1,
0.3247263, -0.3588093, 3.820739, 0, 0.2627451, 1, 1,
0.3250822, -0.8743312, 4.000774, 0, 0.254902, 1, 1,
0.3301823, -1.224289, 2.971764, 0, 0.2509804, 1, 1,
0.3307178, -0.7138963, 1.579569, 0, 0.2431373, 1, 1,
0.3335069, -0.02748965, 0.3636923, 0, 0.2392157, 1, 1,
0.3337551, 0.6608151, 0.6467261, 0, 0.2313726, 1, 1,
0.3375786, 0.2754045, 0.6315182, 0, 0.227451, 1, 1,
0.3383424, -0.5057994, 3.707556, 0, 0.2196078, 1, 1,
0.3401509, 1.293053, 0.9503327, 0, 0.2156863, 1, 1,
0.3408955, 0.4933126, 0.9542176, 0, 0.2078431, 1, 1,
0.3413153, 0.8698922, 0.2833046, 0, 0.2039216, 1, 1,
0.3418715, -1.095927, 3.169009, 0, 0.1960784, 1, 1,
0.3455743, 1.004697, 0.3453722, 0, 0.1882353, 1, 1,
0.3487124, 0.3205616, -0.1603075, 0, 0.1843137, 1, 1,
0.349399, 0.07592016, 2.615146, 0, 0.1764706, 1, 1,
0.3530906, -1.057747, 2.287355, 0, 0.172549, 1, 1,
0.3535376, 0.5750269, 0.2393178, 0, 0.1647059, 1, 1,
0.3561217, 0.4845359, -1.015525, 0, 0.1607843, 1, 1,
0.3564409, 0.2976695, -0.8637137, 0, 0.1529412, 1, 1,
0.3611703, 0.8455343, -0.5929924, 0, 0.1490196, 1, 1,
0.3615985, -0.6472067, 3.433034, 0, 0.1411765, 1, 1,
0.3619181, -0.9474303, 1.774741, 0, 0.1372549, 1, 1,
0.3631366, 0.2261859, 1.172893, 0, 0.1294118, 1, 1,
0.3636875, -1.923446, 3.494463, 0, 0.1254902, 1, 1,
0.3642867, -0.8192167, 3.438262, 0, 0.1176471, 1, 1,
0.3700584, 0.4119233, -0.8569081, 0, 0.1137255, 1, 1,
0.3704263, -0.01319646, 1.827827, 0, 0.1058824, 1, 1,
0.3716009, 1.256329, -1.534012, 0, 0.09803922, 1, 1,
0.3722349, -0.7525254, 3.187039, 0, 0.09411765, 1, 1,
0.3729081, -0.5064197, 1.417879, 0, 0.08627451, 1, 1,
0.3769232, -0.1081325, 1.059831, 0, 0.08235294, 1, 1,
0.37871, -2.767465, 3.366956, 0, 0.07450981, 1, 1,
0.3794012, 0.2200675, 0.2837046, 0, 0.07058824, 1, 1,
0.3819087, 0.0418302, 1.744541, 0, 0.0627451, 1, 1,
0.3844849, -0.9545348, 1.144786, 0, 0.05882353, 1, 1,
0.3865323, 0.3300662, -0.6897807, 0, 0.05098039, 1, 1,
0.3906879, -1.024829, 3.226055, 0, 0.04705882, 1, 1,
0.3929121, -0.3651755, 3.592327, 0, 0.03921569, 1, 1,
0.3982873, 1.480573, 1.536093, 0, 0.03529412, 1, 1,
0.4014285, -1.523506, 3.306636, 0, 0.02745098, 1, 1,
0.4034693, -2.087255, 1.603282, 0, 0.02352941, 1, 1,
0.4169944, -0.4966848, 3.490621, 0, 0.01568628, 1, 1,
0.4190147, 0.6122231, 0.2696773, 0, 0.01176471, 1, 1,
0.419957, -0.6593261, 1.716804, 0, 0.003921569, 1, 1,
0.4202273, 0.4630423, 0.6925576, 0.003921569, 0, 1, 1,
0.4291087, 0.2303584, 0.3905327, 0.007843138, 0, 1, 1,
0.437044, 0.4785643, -0.7172619, 0.01568628, 0, 1, 1,
0.437359, 0.4517998, -0.3264391, 0.01960784, 0, 1, 1,
0.4410574, -0.3864103, 4.582308, 0.02745098, 0, 1, 1,
0.4440528, 0.45983, 2.196476, 0.03137255, 0, 1, 1,
0.4470741, 0.8952849, 1.610478, 0.03921569, 0, 1, 1,
0.4481252, -0.6595461, 2.556674, 0.04313726, 0, 1, 1,
0.4499951, 0.963532, 0.5674591, 0.05098039, 0, 1, 1,
0.451339, 0.9599879, 0.8060132, 0.05490196, 0, 1, 1,
0.4589989, -1.316059, 3.722176, 0.0627451, 0, 1, 1,
0.4627623, 0.1635214, 2.084913, 0.06666667, 0, 1, 1,
0.468127, 1.843563, -0.7934703, 0.07450981, 0, 1, 1,
0.4707929, 1.095486, 0.3393937, 0.07843138, 0, 1, 1,
0.472227, -0.8585125, 4.543438, 0.08627451, 0, 1, 1,
0.4726886, 0.4669516, -0.6597835, 0.09019608, 0, 1, 1,
0.4736546, 1.414864, 0.2052541, 0.09803922, 0, 1, 1,
0.4744277, 0.4052861, 0.6846827, 0.1058824, 0, 1, 1,
0.474632, 1.067804, 2.978359, 0.1098039, 0, 1, 1,
0.4776063, 0.864373, -2.26064, 0.1176471, 0, 1, 1,
0.4797412, -0.1495368, 1.284859, 0.1215686, 0, 1, 1,
0.4884598, 0.2456048, 1.353569, 0.1294118, 0, 1, 1,
0.4898813, -1.71122, 1.809618, 0.1333333, 0, 1, 1,
0.4917576, 1.499394, -0.7646415, 0.1411765, 0, 1, 1,
0.4934177, -1.616938, 3.247952, 0.145098, 0, 1, 1,
0.4977122, -1.0637, 1.847662, 0.1529412, 0, 1, 1,
0.5078474, 0.8877213, 0.678398, 0.1568628, 0, 1, 1,
0.5106902, 0.3355439, 2.651277, 0.1647059, 0, 1, 1,
0.5140519, -0.1553953, 0.6619248, 0.1686275, 0, 1, 1,
0.5158198, 0.4180529, -0.9721594, 0.1764706, 0, 1, 1,
0.518415, -0.308071, 2.299832, 0.1803922, 0, 1, 1,
0.5217277, -1.220849, 1.483119, 0.1882353, 0, 1, 1,
0.5220243, -0.6410897, 1.937841, 0.1921569, 0, 1, 1,
0.5226578, -0.3059294, 1.932185, 0.2, 0, 1, 1,
0.5232067, 1.454616, -0.6990268, 0.2078431, 0, 1, 1,
0.528951, -0.1614148, -0.08411682, 0.2117647, 0, 1, 1,
0.5295007, 0.684101, 0.4096811, 0.2196078, 0, 1, 1,
0.5297828, 0.407554, 0.4406273, 0.2235294, 0, 1, 1,
0.5305446, 1.280097, 2.690299, 0.2313726, 0, 1, 1,
0.5317973, 1.124914, 0.8645195, 0.2352941, 0, 1, 1,
0.5336843, 1.868388, -2.018513, 0.2431373, 0, 1, 1,
0.5402653, -1.060617, 1.957056, 0.2470588, 0, 1, 1,
0.5480209, 0.4966832, 1.842203, 0.254902, 0, 1, 1,
0.5483139, 0.1103865, 1.409323, 0.2588235, 0, 1, 1,
0.5565087, -0.4535265, 3.440647, 0.2666667, 0, 1, 1,
0.5566413, 1.240816, 0.7591126, 0.2705882, 0, 1, 1,
0.5606102, 0.3801233, -0.1342823, 0.2784314, 0, 1, 1,
0.5609947, -0.08083207, 2.159933, 0.282353, 0, 1, 1,
0.5661423, 0.6131581, -0.5345712, 0.2901961, 0, 1, 1,
0.5667096, -1.360442, 0.09451226, 0.2941177, 0, 1, 1,
0.5691043, -1.546408, 3.642773, 0.3019608, 0, 1, 1,
0.5725554, 1.036448, 0.1319054, 0.3098039, 0, 1, 1,
0.5736699, -0.4627915, 1.894633, 0.3137255, 0, 1, 1,
0.5764846, -0.3669958, 1.15891, 0.3215686, 0, 1, 1,
0.5785577, -0.7476277, 2.372336, 0.3254902, 0, 1, 1,
0.5804273, 0.5473682, 0.8264528, 0.3333333, 0, 1, 1,
0.5827727, -0.6184179, 2.851597, 0.3372549, 0, 1, 1,
0.5862938, 1.008309, -0.3921694, 0.345098, 0, 1, 1,
0.5957782, 2.516666, -0.5799466, 0.3490196, 0, 1, 1,
0.5964978, -1.192002, 2.800378, 0.3568628, 0, 1, 1,
0.5978302, 1.882851, 1.506027, 0.3607843, 0, 1, 1,
0.5982968, -0.661383, 1.895461, 0.3686275, 0, 1, 1,
0.609265, 1.64836, -1.128078, 0.372549, 0, 1, 1,
0.6097829, 1.863663, 0.452911, 0.3803922, 0, 1, 1,
0.6123328, 0.8491861, 1.239969, 0.3843137, 0, 1, 1,
0.6142795, -0.7802511, 2.187538, 0.3921569, 0, 1, 1,
0.6201051, 0.1568394, 0.65897, 0.3960784, 0, 1, 1,
0.6207333, 1.14487, 0.3872546, 0.4039216, 0, 1, 1,
0.6222519, -1.814272, 1.387302, 0.4117647, 0, 1, 1,
0.6227437, -0.9833699, 3.012705, 0.4156863, 0, 1, 1,
0.6229296, 0.2806636, 0.8015746, 0.4235294, 0, 1, 1,
0.6245313, 0.0958038, 1.767221, 0.427451, 0, 1, 1,
0.62893, -0.8929768, 3.170929, 0.4352941, 0, 1, 1,
0.6383869, 1.410801, 3.637537, 0.4392157, 0, 1, 1,
0.6438342, -0.7429988, 2.675158, 0.4470588, 0, 1, 1,
0.6470064, 0.8025739, 0.5519871, 0.4509804, 0, 1, 1,
0.6489989, 0.1490601, 1.169165, 0.4588235, 0, 1, 1,
0.655751, -0.1035638, -0.002833869, 0.4627451, 0, 1, 1,
0.6569567, 0.8163304, 1.97505, 0.4705882, 0, 1, 1,
0.6590225, -0.05589537, 1.032334, 0.4745098, 0, 1, 1,
0.6590562, -1.530514, 1.791532, 0.4823529, 0, 1, 1,
0.6688073, 0.5087549, 0.09764431, 0.4862745, 0, 1, 1,
0.67037, -0.520184, 3.614354, 0.4941176, 0, 1, 1,
0.6706594, 0.3045501, 2.851423, 0.5019608, 0, 1, 1,
0.6913638, 1.353271, 0.5713024, 0.5058824, 0, 1, 1,
0.6915509, -0.004498698, 0.7080721, 0.5137255, 0, 1, 1,
0.693119, 0.2028946, 1.675372, 0.5176471, 0, 1, 1,
0.6943045, -1.406457, 1.677959, 0.5254902, 0, 1, 1,
0.7017515, -0.05913493, 1.700292, 0.5294118, 0, 1, 1,
0.7036029, 0.6772575, 2.668409, 0.5372549, 0, 1, 1,
0.7049963, 0.9397566, -1.134065, 0.5411765, 0, 1, 1,
0.7054679, 1.700261, 2.253328, 0.5490196, 0, 1, 1,
0.7106355, -1.688026, 4.568786, 0.5529412, 0, 1, 1,
0.7129785, 0.8021879, 0.4437791, 0.5607843, 0, 1, 1,
0.7134581, -0.6446277, 2.973444, 0.5647059, 0, 1, 1,
0.7179994, -0.7210962, 3.734324, 0.572549, 0, 1, 1,
0.7248199, -1.470331, 2.56706, 0.5764706, 0, 1, 1,
0.7295067, 0.8693429, 0.8566648, 0.5843138, 0, 1, 1,
0.7306941, 1.109772, -0.004135766, 0.5882353, 0, 1, 1,
0.7339094, -0.1501361, 0.7327933, 0.5960785, 0, 1, 1,
0.7386596, 0.09347167, 3.085571, 0.6039216, 0, 1, 1,
0.7437312, 0.05042565, 1.219718, 0.6078432, 0, 1, 1,
0.7439153, 1.374945, -1.040399, 0.6156863, 0, 1, 1,
0.7497794, -0.08990114, 2.497994, 0.6196079, 0, 1, 1,
0.7516325, -0.8710307, 2.643122, 0.627451, 0, 1, 1,
0.7590041, 2.174354, 0.8053488, 0.6313726, 0, 1, 1,
0.7632278, 1.446619, 1.186313, 0.6392157, 0, 1, 1,
0.7638201, 0.8726693, -0.2151513, 0.6431373, 0, 1, 1,
0.7638615, 1.842683, 0.5154606, 0.6509804, 0, 1, 1,
0.7656654, -1.055685, 2.172778, 0.654902, 0, 1, 1,
0.7726142, -1.141662, 1.298385, 0.6627451, 0, 1, 1,
0.7732992, -0.5881803, 1.296407, 0.6666667, 0, 1, 1,
0.7810454, 0.8159612, 1.016142, 0.6745098, 0, 1, 1,
0.7826911, 1.414957, -0.8898619, 0.6784314, 0, 1, 1,
0.7857147, 0.2628995, 2.225402, 0.6862745, 0, 1, 1,
0.7881411, -0.1514226, 0.4610737, 0.6901961, 0, 1, 1,
0.7916925, 0.8974432, 1.866483, 0.6980392, 0, 1, 1,
0.7946954, -1.77703, 2.146767, 0.7058824, 0, 1, 1,
0.7968241, 0.08209193, 3.155671, 0.7098039, 0, 1, 1,
0.7984113, -1.664747, 0.7041663, 0.7176471, 0, 1, 1,
0.819158, 0.7061556, 2.626807, 0.7215686, 0, 1, 1,
0.8233978, -0.0261245, 0.876018, 0.7294118, 0, 1, 1,
0.8234785, -0.06467536, 1.372306, 0.7333333, 0, 1, 1,
0.8281755, 1.462158, -1.256368, 0.7411765, 0, 1, 1,
0.8320357, 0.1602321, 0.8587279, 0.7450981, 0, 1, 1,
0.8321643, -0.4184848, 1.640911, 0.7529412, 0, 1, 1,
0.8324609, -0.9352338, 0.2508501, 0.7568628, 0, 1, 1,
0.8407861, -1.650617, 4.566452, 0.7647059, 0, 1, 1,
0.8408935, 0.382006, 1.246947, 0.7686275, 0, 1, 1,
0.8435818, -0.6419517, 1.36743, 0.7764706, 0, 1, 1,
0.8490036, 0.9080786, -0.1071247, 0.7803922, 0, 1, 1,
0.854168, -1.2055, 3.535102, 0.7882353, 0, 1, 1,
0.8578325, -2.183669, 0.9859543, 0.7921569, 0, 1, 1,
0.8584065, 0.4228728, -0.3390772, 0.8, 0, 1, 1,
0.8589255, -0.5946816, 1.256624, 0.8078431, 0, 1, 1,
0.8589864, -0.1073179, 1.001737, 0.8117647, 0, 1, 1,
0.8611522, 2.022649, 0.1918377, 0.8196079, 0, 1, 1,
0.8643795, -1.614276, 5.235925, 0.8235294, 0, 1, 1,
0.8649979, -0.008491027, -0.9570389, 0.8313726, 0, 1, 1,
0.865346, 0.1021979, 1.087342, 0.8352941, 0, 1, 1,
0.8711513, 1.572476, 1.95592, 0.8431373, 0, 1, 1,
0.8723463, 1.306686, 0.2489398, 0.8470588, 0, 1, 1,
0.8763455, -1.429824, 3.124736, 0.854902, 0, 1, 1,
0.8856027, 0.163385, 1.753405, 0.8588235, 0, 1, 1,
0.8959103, 0.1820856, 0.6434376, 0.8666667, 0, 1, 1,
0.896688, 0.6017449, 0.8331892, 0.8705882, 0, 1, 1,
0.905974, 0.3175273, 2.006715, 0.8784314, 0, 1, 1,
0.9089401, 0.08136224, 2.046849, 0.8823529, 0, 1, 1,
0.9154932, 0.2685309, -0.4120312, 0.8901961, 0, 1, 1,
0.9160793, -1.501533, 1.344231, 0.8941177, 0, 1, 1,
0.9164186, 0.7326534, -1.116374, 0.9019608, 0, 1, 1,
0.917663, 0.5433323, 2.693685, 0.9098039, 0, 1, 1,
0.9185626, -0.702462, 2.179348, 0.9137255, 0, 1, 1,
0.9247705, -0.9428658, 2.914278, 0.9215686, 0, 1, 1,
0.9266412, -1.287866, 3.417608, 0.9254902, 0, 1, 1,
0.928745, -1.249043, 2.820748, 0.9333333, 0, 1, 1,
0.9291114, -1.26524, 2.065526, 0.9372549, 0, 1, 1,
0.9329525, -0.2372928, 2.247467, 0.945098, 0, 1, 1,
0.9378628, 1.747268, 1.162547, 0.9490196, 0, 1, 1,
0.9416311, 0.1250315, 0.9856357, 0.9568627, 0, 1, 1,
0.9418799, -0.03774523, 1.389367, 0.9607843, 0, 1, 1,
0.9433149, 2.126555, 1.799876, 0.9686275, 0, 1, 1,
0.9449053, -0.9365226, 1.281014, 0.972549, 0, 1, 1,
0.9472392, 0.7176268, 2.311654, 0.9803922, 0, 1, 1,
0.9504788, -1.170256, 3.392452, 0.9843137, 0, 1, 1,
0.9522491, -0.9098856, 2.042723, 0.9921569, 0, 1, 1,
0.9535373, 0.0391386, 0.1481697, 0.9960784, 0, 1, 1,
0.9625213, 0.1879808, -0.008296523, 1, 0, 0.9960784, 1,
0.9631842, -0.5993179, 1.953039, 1, 0, 0.9882353, 1,
0.9726309, -0.1303556, 0.8876956, 1, 0, 0.9843137, 1,
0.9743009, 0.3877094, 0.2379025, 1, 0, 0.9764706, 1,
0.9767522, 1.183306, -0.01857309, 1, 0, 0.972549, 1,
0.9798014, 0.01467474, 1.683015, 1, 0, 0.9647059, 1,
0.9834129, 0.1361519, 0.4907661, 1, 0, 0.9607843, 1,
0.9865849, -0.6694496, -0.01417941, 1, 0, 0.9529412, 1,
0.9901664, 1.422048, -0.3230571, 1, 0, 0.9490196, 1,
0.9944635, -1.048117, 1.571617, 1, 0, 0.9411765, 1,
0.9952127, -0.6690731, 1.71747, 1, 0, 0.9372549, 1,
0.9955686, -0.2512228, 2.884649, 1, 0, 0.9294118, 1,
1.006105, -1.093551, 2.528869, 1, 0, 0.9254902, 1,
1.008488, -0.5791218, 3.257483, 1, 0, 0.9176471, 1,
1.010454, -1.989254, 3.900145, 1, 0, 0.9137255, 1,
1.013102, 0.145227, 1.098558, 1, 0, 0.9058824, 1,
1.013313, -1.410957, 2.925496, 1, 0, 0.9019608, 1,
1.018864, 0.6742726, -0.3760138, 1, 0, 0.8941177, 1,
1.024389, 0.892669, 2.367749, 1, 0, 0.8862745, 1,
1.024493, -0.3413167, 1.562818, 1, 0, 0.8823529, 1,
1.0351, -1.56674, 2.325117, 1, 0, 0.8745098, 1,
1.037257, -0.03441434, 0.5985074, 1, 0, 0.8705882, 1,
1.03951, -0.5615732, 2.31359, 1, 0, 0.8627451, 1,
1.042019, 0.8743035, 1.517052, 1, 0, 0.8588235, 1,
1.044383, 1.096346, 1.29416, 1, 0, 0.8509804, 1,
1.052142, -0.5448161, 1.680377, 1, 0, 0.8470588, 1,
1.06413, 0.08211657, 1.521794, 1, 0, 0.8392157, 1,
1.064204, 0.924257, 0.9870074, 1, 0, 0.8352941, 1,
1.065694, 0.4029439, -0.03316055, 1, 0, 0.827451, 1,
1.06804, 0.7673782, 0.5516791, 1, 0, 0.8235294, 1,
1.073097, -0.6384031, 3.045854, 1, 0, 0.8156863, 1,
1.078498, 1.644086, 0.1802677, 1, 0, 0.8117647, 1,
1.081422, -0.542023, 2.597157, 1, 0, 0.8039216, 1,
1.087145, -1.034693, 2.603553, 1, 0, 0.7960784, 1,
1.095857, -0.05430209, 1.887542, 1, 0, 0.7921569, 1,
1.097522, -0.4641451, 3.221972, 1, 0, 0.7843137, 1,
1.115319, -0.5775796, 3.34493, 1, 0, 0.7803922, 1,
1.11648, 0.5893025, -0.07593595, 1, 0, 0.772549, 1,
1.118307, 1.392031, 0.5229991, 1, 0, 0.7686275, 1,
1.123201, 0.5545076, 1.536933, 1, 0, 0.7607843, 1,
1.124741, -0.7490004, 2.151336, 1, 0, 0.7568628, 1,
1.127343, 0.1314831, 1.637754, 1, 0, 0.7490196, 1,
1.129619, 0.878013, 1.115765, 1, 0, 0.7450981, 1,
1.129811, 1.656083, 1.193651, 1, 0, 0.7372549, 1,
1.132672, 0.1912212, 1.740034, 1, 0, 0.7333333, 1,
1.148502, 0.04993862, 2.657766, 1, 0, 0.7254902, 1,
1.158094, 0.8783887, 1.029861, 1, 0, 0.7215686, 1,
1.161439, 0.8633001, 0.2659793, 1, 0, 0.7137255, 1,
1.164937, 1.663772, 2.020401, 1, 0, 0.7098039, 1,
1.165864, 0.5684026, 3.703926, 1, 0, 0.7019608, 1,
1.167047, 1.073812, 0.8414326, 1, 0, 0.6941177, 1,
1.168798, 0.5705563, 1.126695, 1, 0, 0.6901961, 1,
1.182217, -1.160063, 1.977777, 1, 0, 0.682353, 1,
1.186002, -0.3070999, 1.426283, 1, 0, 0.6784314, 1,
1.194554, -1.425646, 1.643148, 1, 0, 0.6705883, 1,
1.195137, 0.3951211, 0.4688733, 1, 0, 0.6666667, 1,
1.205867, 0.2567341, 1.048642, 1, 0, 0.6588235, 1,
1.212562, 0.9215571, 1.321471, 1, 0, 0.654902, 1,
1.214783, 0.3346878, 0.7593157, 1, 0, 0.6470588, 1,
1.220491, -0.2725807, 0.3582046, 1, 0, 0.6431373, 1,
1.221491, -1.127432, 0.8442474, 1, 0, 0.6352941, 1,
1.233339, -0.4370676, 3.219135, 1, 0, 0.6313726, 1,
1.244857, -0.4442813, 1.550869, 1, 0, 0.6235294, 1,
1.257676, -0.296954, 1.39077, 1, 0, 0.6196079, 1,
1.261883, 1.573463, 2.049202, 1, 0, 0.6117647, 1,
1.281228, 0.1466853, 1.19437, 1, 0, 0.6078432, 1,
1.307029, -0.421994, 1.582766, 1, 0, 0.6, 1,
1.316458, 0.41881, 1.766517, 1, 0, 0.5921569, 1,
1.340701, 0.2987199, 0.524725, 1, 0, 0.5882353, 1,
1.341156, 0.4864703, 0.6440183, 1, 0, 0.5803922, 1,
1.341532, -0.5162155, 2.108283, 1, 0, 0.5764706, 1,
1.368204, -0.8500796, 2.264175, 1, 0, 0.5686275, 1,
1.391989, -1.954301, 2.172723, 1, 0, 0.5647059, 1,
1.394648, 1.41326, 1.070902, 1, 0, 0.5568628, 1,
1.396311, -0.04020978, 0.8508057, 1, 0, 0.5529412, 1,
1.397216, 1.100239, 1.98723, 1, 0, 0.5450981, 1,
1.399355, 0.4617831, -0.8221379, 1, 0, 0.5411765, 1,
1.402666, -0.1783168, 1.728336, 1, 0, 0.5333334, 1,
1.413731, -1.179978, 2.817612, 1, 0, 0.5294118, 1,
1.421111, 0.3859962, 2.012789, 1, 0, 0.5215687, 1,
1.426797, 0.7857265, 0.3463389, 1, 0, 0.5176471, 1,
1.433441, 0.6651649, 1.752761, 1, 0, 0.509804, 1,
1.451486, 0.6476779, 2.450199, 1, 0, 0.5058824, 1,
1.451779, 0.8308081, -0.5521947, 1, 0, 0.4980392, 1,
1.454409, -0.2754103, 1.352645, 1, 0, 0.4901961, 1,
1.454738, -1.330995, 1.7259, 1, 0, 0.4862745, 1,
1.464166, 1.30653, -0.2689804, 1, 0, 0.4784314, 1,
1.466764, -1.160878, 2.2794, 1, 0, 0.4745098, 1,
1.476326, 0.2180673, 1.429412, 1, 0, 0.4666667, 1,
1.48639, -0.2048029, 0.703348, 1, 0, 0.4627451, 1,
1.491028, -0.3447168, 2.64618, 1, 0, 0.454902, 1,
1.493702, -0.1793845, 1.574764, 1, 0, 0.4509804, 1,
1.494583, -1.150654, 3.238889, 1, 0, 0.4431373, 1,
1.500201, -0.8255774, 2.509984, 1, 0, 0.4392157, 1,
1.520462, -0.3063291, 2.978802, 1, 0, 0.4313726, 1,
1.523101, 1.096917, -1.557363, 1, 0, 0.427451, 1,
1.523501, 1.629821, -1.414908, 1, 0, 0.4196078, 1,
1.535016, 0.6551982, 0.9952491, 1, 0, 0.4156863, 1,
1.537865, 0.7813247, 3.280455, 1, 0, 0.4078431, 1,
1.546218, 0.03285627, 2.228139, 1, 0, 0.4039216, 1,
1.546919, 0.1877467, 2.99264, 1, 0, 0.3960784, 1,
1.547916, -0.7727957, 3.701321, 1, 0, 0.3882353, 1,
1.554179, 0.6535995, 0.9797147, 1, 0, 0.3843137, 1,
1.568616, 1.40464, 1.068941, 1, 0, 0.3764706, 1,
1.578435, -0.0171934, 2.052044, 1, 0, 0.372549, 1,
1.584013, -0.2514899, 3.836983, 1, 0, 0.3647059, 1,
1.584847, 0.9588741, 0.1960239, 1, 0, 0.3607843, 1,
1.586709, -1.685238, 1.944345, 1, 0, 0.3529412, 1,
1.589682, -1.909259, 0.6713507, 1, 0, 0.3490196, 1,
1.591543, 1.081388, -0.1765265, 1, 0, 0.3411765, 1,
1.592373, 0.8114641, 2.67047, 1, 0, 0.3372549, 1,
1.59393, -1.529909, 3.466287, 1, 0, 0.3294118, 1,
1.598178, 0.3795159, 1.348998, 1, 0, 0.3254902, 1,
1.600301, -0.3807334, 0.6614307, 1, 0, 0.3176471, 1,
1.602822, -1.04248, 2.63157, 1, 0, 0.3137255, 1,
1.605952, -0.3734324, 1.618863, 1, 0, 0.3058824, 1,
1.646161, -1.198395, 1.942094, 1, 0, 0.2980392, 1,
1.653619, -0.03850431, 2.345913, 1, 0, 0.2941177, 1,
1.666116, 0.7346735, 1.669333, 1, 0, 0.2862745, 1,
1.680824, -0.346942, 1.709632, 1, 0, 0.282353, 1,
1.691344, -0.03638884, 1.556352, 1, 0, 0.2745098, 1,
1.693666, -1.70618, 4.25743, 1, 0, 0.2705882, 1,
1.73537, 0.217166, 2.331223, 1, 0, 0.2627451, 1,
1.748123, 0.6340066, 0.4923121, 1, 0, 0.2588235, 1,
1.755052, 2.544347, 1.665583, 1, 0, 0.2509804, 1,
1.758731, -0.335706, 2.577187, 1, 0, 0.2470588, 1,
1.764116, 0.1564236, 2.447861, 1, 0, 0.2392157, 1,
1.764884, -2.307489, 2.02809, 1, 0, 0.2352941, 1,
1.774059, -0.1394743, 0.6449186, 1, 0, 0.227451, 1,
1.798095, 0.3829478, 0.6285201, 1, 0, 0.2235294, 1,
1.817984, 1.46671, 1.800309, 1, 0, 0.2156863, 1,
1.824976, 0.7231647, 0.3958949, 1, 0, 0.2117647, 1,
1.843391, 0.8650701, 3.685091, 1, 0, 0.2039216, 1,
1.845784, -0.9528418, 2.716209, 1, 0, 0.1960784, 1,
1.865099, 0.9655062, 1.943748, 1, 0, 0.1921569, 1,
1.869265, -0.992768, 0.1035121, 1, 0, 0.1843137, 1,
1.873525, 0.7170635, -1.07463, 1, 0, 0.1803922, 1,
1.884309, -1.175248, 1.431517, 1, 0, 0.172549, 1,
1.885283, 1.863517, 1.748565, 1, 0, 0.1686275, 1,
1.890505, -0.6533822, 2.322371, 1, 0, 0.1607843, 1,
1.89095, 0.6379917, 1.177978, 1, 0, 0.1568628, 1,
1.912039, -0.1942775, 0.8918977, 1, 0, 0.1490196, 1,
1.920579, 0.2814499, 1.982976, 1, 0, 0.145098, 1,
1.924473, -1.137547, 1.706439, 1, 0, 0.1372549, 1,
1.925749, -0.7030824, 2.167834, 1, 0, 0.1333333, 1,
1.927898, -0.9462344, 2.894017, 1, 0, 0.1254902, 1,
1.928331, -0.1690161, 1.636956, 1, 0, 0.1215686, 1,
1.939037, 0.4921743, 0.8936127, 1, 0, 0.1137255, 1,
1.95008, -1.542346, 3.707269, 1, 0, 0.1098039, 1,
1.992957, 1.885421, 0.6787184, 1, 0, 0.1019608, 1,
2.039807, 1.16787, 1.395428, 1, 0, 0.09411765, 1,
2.109829, 0.7165288, 1.601102, 1, 0, 0.09019608, 1,
2.118046, 0.6056468, 2.515208, 1, 0, 0.08235294, 1,
2.134887, 1.552122, 2.637213, 1, 0, 0.07843138, 1,
2.211361, -0.01942794, 2.559655, 1, 0, 0.07058824, 1,
2.239286, -0.1739219, 1.4836, 1, 0, 0.06666667, 1,
2.246894, 1.388682, 1.459015, 1, 0, 0.05882353, 1,
2.387587, 1.997223, 1.757917, 1, 0, 0.05490196, 1,
2.422849, 0.7815846, 0.1889858, 1, 0, 0.04705882, 1,
2.487911, 0.8282942, 0.6401525, 1, 0, 0.04313726, 1,
2.504516, 1.087978, 0.06058463, 1, 0, 0.03529412, 1,
2.64228, -1.046626, 2.587375, 1, 0, 0.03137255, 1,
2.74993, -0.4170032, 1.81264, 1, 0, 0.02352941, 1,
2.898021, 0.4998975, 2.744141, 1, 0, 0.01960784, 1,
3.030255, 1.527391, 3.285756, 1, 0, 0.01176471, 1,
3.841482, 0.1396745, 0.05378824, 1, 0, 0.007843138, 1
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
0.4454316, -3.750182, -7.187182, 0, -0.5, 0.5, 0.5,
0.4454316, -3.750182, -7.187182, 1, -0.5, 0.5, 0.5,
0.4454316, -3.750182, -7.187182, 1, 1.5, 0.5, 0.5,
0.4454316, -3.750182, -7.187182, 0, 1.5, 0.5, 0.5
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
-4.10188, 0.1314039, -7.187182, 0, -0.5, 0.5, 0.5,
-4.10188, 0.1314039, -7.187182, 1, -0.5, 0.5, 0.5,
-4.10188, 0.1314039, -7.187182, 1, 1.5, 0.5, 0.5,
-4.10188, 0.1314039, -7.187182, 0, 1.5, 0.5, 0.5
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
-4.10188, -3.750182, -0.0753653, 0, -0.5, 0.5, 0.5,
-4.10188, -3.750182, -0.0753653, 1, -0.5, 0.5, 0.5,
-4.10188, -3.750182, -0.0753653, 1, 1.5, 0.5, 0.5,
-4.10188, -3.750182, -0.0753653, 0, 1.5, 0.5, 0.5
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
-2, -2.854431, -5.545994,
3, -2.854431, -5.545994,
-2, -2.854431, -5.545994,
-2, -3.003723, -5.819525,
-1, -2.854431, -5.545994,
-1, -3.003723, -5.819525,
0, -2.854431, -5.545994,
0, -3.003723, -5.819525,
1, -2.854431, -5.545994,
1, -3.003723, -5.819525,
2, -2.854431, -5.545994,
2, -3.003723, -5.819525,
3, -2.854431, -5.545994,
3, -3.003723, -5.819525
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
-2, -3.302306, -6.366588, 0, -0.5, 0.5, 0.5,
-2, -3.302306, -6.366588, 1, -0.5, 0.5, 0.5,
-2, -3.302306, -6.366588, 1, 1.5, 0.5, 0.5,
-2, -3.302306, -6.366588, 0, 1.5, 0.5, 0.5,
-1, -3.302306, -6.366588, 0, -0.5, 0.5, 0.5,
-1, -3.302306, -6.366588, 1, -0.5, 0.5, 0.5,
-1, -3.302306, -6.366588, 1, 1.5, 0.5, 0.5,
-1, -3.302306, -6.366588, 0, 1.5, 0.5, 0.5,
0, -3.302306, -6.366588, 0, -0.5, 0.5, 0.5,
0, -3.302306, -6.366588, 1, -0.5, 0.5, 0.5,
0, -3.302306, -6.366588, 1, 1.5, 0.5, 0.5,
0, -3.302306, -6.366588, 0, 1.5, 0.5, 0.5,
1, -3.302306, -6.366588, 0, -0.5, 0.5, 0.5,
1, -3.302306, -6.366588, 1, -0.5, 0.5, 0.5,
1, -3.302306, -6.366588, 1, 1.5, 0.5, 0.5,
1, -3.302306, -6.366588, 0, 1.5, 0.5, 0.5,
2, -3.302306, -6.366588, 0, -0.5, 0.5, 0.5,
2, -3.302306, -6.366588, 1, -0.5, 0.5, 0.5,
2, -3.302306, -6.366588, 1, 1.5, 0.5, 0.5,
2, -3.302306, -6.366588, 0, 1.5, 0.5, 0.5,
3, -3.302306, -6.366588, 0, -0.5, 0.5, 0.5,
3, -3.302306, -6.366588, 1, -0.5, 0.5, 0.5,
3, -3.302306, -6.366588, 1, 1.5, 0.5, 0.5,
3, -3.302306, -6.366588, 0, 1.5, 0.5, 0.5
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
-3.0525, -2, -5.545994,
-3.0525, 3, -5.545994,
-3.0525, -2, -5.545994,
-3.227397, -2, -5.819525,
-3.0525, -1, -5.545994,
-3.227397, -1, -5.819525,
-3.0525, 0, -5.545994,
-3.227397, 0, -5.819525,
-3.0525, 1, -5.545994,
-3.227397, 1, -5.819525,
-3.0525, 2, -5.545994,
-3.227397, 2, -5.819525,
-3.0525, 3, -5.545994,
-3.227397, 3, -5.819525
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
-3.57719, -2, -6.366588, 0, -0.5, 0.5, 0.5,
-3.57719, -2, -6.366588, 1, -0.5, 0.5, 0.5,
-3.57719, -2, -6.366588, 1, 1.5, 0.5, 0.5,
-3.57719, -2, -6.366588, 0, 1.5, 0.5, 0.5,
-3.57719, -1, -6.366588, 0, -0.5, 0.5, 0.5,
-3.57719, -1, -6.366588, 1, -0.5, 0.5, 0.5,
-3.57719, -1, -6.366588, 1, 1.5, 0.5, 0.5,
-3.57719, -1, -6.366588, 0, 1.5, 0.5, 0.5,
-3.57719, 0, -6.366588, 0, -0.5, 0.5, 0.5,
-3.57719, 0, -6.366588, 1, -0.5, 0.5, 0.5,
-3.57719, 0, -6.366588, 1, 1.5, 0.5, 0.5,
-3.57719, 0, -6.366588, 0, 1.5, 0.5, 0.5,
-3.57719, 1, -6.366588, 0, -0.5, 0.5, 0.5,
-3.57719, 1, -6.366588, 1, -0.5, 0.5, 0.5,
-3.57719, 1, -6.366588, 1, 1.5, 0.5, 0.5,
-3.57719, 1, -6.366588, 0, 1.5, 0.5, 0.5,
-3.57719, 2, -6.366588, 0, -0.5, 0.5, 0.5,
-3.57719, 2, -6.366588, 1, -0.5, 0.5, 0.5,
-3.57719, 2, -6.366588, 1, 1.5, 0.5, 0.5,
-3.57719, 2, -6.366588, 0, 1.5, 0.5, 0.5,
-3.57719, 3, -6.366588, 0, -0.5, 0.5, 0.5,
-3.57719, 3, -6.366588, 1, -0.5, 0.5, 0.5,
-3.57719, 3, -6.366588, 1, 1.5, 0.5, 0.5,
-3.57719, 3, -6.366588, 0, 1.5, 0.5, 0.5
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
-3.0525, -2.854431, -4,
-3.0525, -2.854431, 4,
-3.0525, -2.854431, -4,
-3.227397, -3.003723, -4,
-3.0525, -2.854431, -2,
-3.227397, -3.003723, -2,
-3.0525, -2.854431, 0,
-3.227397, -3.003723, 0,
-3.0525, -2.854431, 2,
-3.227397, -3.003723, 2,
-3.0525, -2.854431, 4,
-3.227397, -3.003723, 4
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
-3.57719, -3.302306, -4, 0, -0.5, 0.5, 0.5,
-3.57719, -3.302306, -4, 1, -0.5, 0.5, 0.5,
-3.57719, -3.302306, -4, 1, 1.5, 0.5, 0.5,
-3.57719, -3.302306, -4, 0, 1.5, 0.5, 0.5,
-3.57719, -3.302306, -2, 0, -0.5, 0.5, 0.5,
-3.57719, -3.302306, -2, 1, -0.5, 0.5, 0.5,
-3.57719, -3.302306, -2, 1, 1.5, 0.5, 0.5,
-3.57719, -3.302306, -2, 0, 1.5, 0.5, 0.5,
-3.57719, -3.302306, 0, 0, -0.5, 0.5, 0.5,
-3.57719, -3.302306, 0, 1, -0.5, 0.5, 0.5,
-3.57719, -3.302306, 0, 1, 1.5, 0.5, 0.5,
-3.57719, -3.302306, 0, 0, 1.5, 0.5, 0.5,
-3.57719, -3.302306, 2, 0, -0.5, 0.5, 0.5,
-3.57719, -3.302306, 2, 1, -0.5, 0.5, 0.5,
-3.57719, -3.302306, 2, 1, 1.5, 0.5, 0.5,
-3.57719, -3.302306, 2, 0, 1.5, 0.5, 0.5,
-3.57719, -3.302306, 4, 0, -0.5, 0.5, 0.5,
-3.57719, -3.302306, 4, 1, -0.5, 0.5, 0.5,
-3.57719, -3.302306, 4, 1, 1.5, 0.5, 0.5,
-3.57719, -3.302306, 4, 0, 1.5, 0.5, 0.5
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
-3.0525, -2.854431, -5.545994,
-3.0525, 3.117239, -5.545994,
-3.0525, -2.854431, 5.395263,
-3.0525, 3.117239, 5.395263,
-3.0525, -2.854431, -5.545994,
-3.0525, -2.854431, 5.395263,
-3.0525, 3.117239, -5.545994,
-3.0525, 3.117239, 5.395263,
-3.0525, -2.854431, -5.545994,
3.943364, -2.854431, -5.545994,
-3.0525, -2.854431, 5.395263,
3.943364, -2.854431, 5.395263,
-3.0525, 3.117239, -5.545994,
3.943364, 3.117239, -5.545994,
-3.0525, 3.117239, 5.395263,
3.943364, 3.117239, 5.395263,
3.943364, -2.854431, -5.545994,
3.943364, 3.117239, -5.545994,
3.943364, -2.854431, 5.395263,
3.943364, 3.117239, 5.395263,
3.943364, -2.854431, -5.545994,
3.943364, -2.854431, 5.395263,
3.943364, 3.117239, -5.545994,
3.943364, 3.117239, 5.395263
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
var radius = 7.632637;
var distance = 33.95846;
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
mvMatrix.translate( -0.4454316, -0.1314039, 0.0753653 );
mvMatrix.scale( 1.179634, 1.381951, 0.7542604 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.95846);
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
Tribufos<-read.table("Tribufos.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Tribufos$V2
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
```

```r
y<-Tribufos$V3
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
```

```r
z<-Tribufos$V4
```

```
## Error in eval(expr, envir, enclos): object 'Tribufos' not found
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
-2.950619, -2.020659, -1.746617, 0, 0, 1, 1, 1,
-2.882946, -0.4880838, -2.269153, 1, 0, 0, 1, 1,
-2.860579, -0.1537755, -2.407113, 1, 0, 0, 1, 1,
-2.799913, 0.8041409, -1.439691, 1, 0, 0, 1, 1,
-2.788056, 0.7940785, -2.626906, 1, 0, 0, 1, 1,
-2.786055, 0.402027, -2.9663, 1, 0, 0, 1, 1,
-2.776703, 1.075237, 1.421521, 0, 0, 0, 1, 1,
-2.650131, -1.75679, -1.181525, 0, 0, 0, 1, 1,
-2.582571, 0.2524178, -2.547376, 0, 0, 0, 1, 1,
-2.414367, 2.210798, -1.576828, 0, 0, 0, 1, 1,
-2.371285, 0.1916695, -0.9842822, 0, 0, 0, 1, 1,
-2.263648, -2.592376, -3.174569, 0, 0, 0, 1, 1,
-2.246608, -0.4389122, -2.068373, 0, 0, 0, 1, 1,
-2.217126, -0.01482281, -2.592346, 1, 1, 1, 1, 1,
-2.210901, 1.391825, -1.103758, 1, 1, 1, 1, 1,
-2.144652, -0.7540196, -1.265012, 1, 1, 1, 1, 1,
-2.136652, 0.1002365, -2.250725, 1, 1, 1, 1, 1,
-2.122653, -0.011448, 0.259185, 1, 1, 1, 1, 1,
-2.122169, -0.1987737, 0.5056549, 1, 1, 1, 1, 1,
-2.063899, 1.171014, -0.4837191, 1, 1, 1, 1, 1,
-2.063177, 1.287325, -0.9309441, 1, 1, 1, 1, 1,
-2.051203, 0.2278038, -2.208551, 1, 1, 1, 1, 1,
-2.01895, 1.402499, -1.797211, 1, 1, 1, 1, 1,
-2.013464, 0.2568534, -1.655128, 1, 1, 1, 1, 1,
-1.998673, 2.240065, -1.193935, 1, 1, 1, 1, 1,
-1.921174, -2.09652, -1.582058, 1, 1, 1, 1, 1,
-1.900546, -0.8839211, -0.5463798, 1, 1, 1, 1, 1,
-1.898557, -0.5467766, -2.63813, 1, 1, 1, 1, 1,
-1.893899, 0.0915735, -1.066368, 0, 0, 1, 1, 1,
-1.873417, -1.227407, -3.09974, 1, 0, 0, 1, 1,
-1.864213, 1.451571, -2.176118, 1, 0, 0, 1, 1,
-1.841542, -0.3760506, -2.004527, 1, 0, 0, 1, 1,
-1.813106, 0.7860616, -2.966774, 1, 0, 0, 1, 1,
-1.796481, 0.9535806, 1.285558, 1, 0, 0, 1, 1,
-1.791392, 2.517406, -0.3602059, 0, 0, 0, 1, 1,
-1.790652, 0.007949892, -2.990551, 0, 0, 0, 1, 1,
-1.78487, -0.4494082, -2.208943, 0, 0, 0, 1, 1,
-1.759948, -0.8403693, -1.940292, 0, 0, 0, 1, 1,
-1.747411, 0.5687714, -0.03277051, 0, 0, 0, 1, 1,
-1.712408, 0.334746, -1.09429, 0, 0, 0, 1, 1,
-1.698219, -0.8626822, -2.294513, 0, 0, 0, 1, 1,
-1.691085, 1.169831, -0.6620238, 1, 1, 1, 1, 1,
-1.674857, 0.4999034, -2.434322, 1, 1, 1, 1, 1,
-1.672339, 0.1347351, -1.670166, 1, 1, 1, 1, 1,
-1.668756, -0.8265735, -3.011853, 1, 1, 1, 1, 1,
-1.660171, 0.7450021, 0.06805507, 1, 1, 1, 1, 1,
-1.650799, -1.187866, -2.254786, 1, 1, 1, 1, 1,
-1.629328, -2.153974, -1.666304, 1, 1, 1, 1, 1,
-1.610306, 0.6920006, -1.568333, 1, 1, 1, 1, 1,
-1.609395, 0.1060464, -1.765233, 1, 1, 1, 1, 1,
-1.593655, -0.103511, -1.722693, 1, 1, 1, 1, 1,
-1.584629, 0.4667739, -2.176726, 1, 1, 1, 1, 1,
-1.560733, -0.08597347, -0.899442, 1, 1, 1, 1, 1,
-1.55307, 0.8198469, 0.3462982, 1, 1, 1, 1, 1,
-1.550415, -0.1356023, -0.8611868, 1, 1, 1, 1, 1,
-1.546286, 0.03088766, -0.8415239, 1, 1, 1, 1, 1,
-1.541183, 0.09757941, -1.149381, 0, 0, 1, 1, 1,
-1.523496, 0.4179322, -1.029347, 1, 0, 0, 1, 1,
-1.523044, -1.041055, -1.527342, 1, 0, 0, 1, 1,
-1.503127, 1.222558, -0.3012729, 1, 0, 0, 1, 1,
-1.498429, -0.09530399, -3.522744, 1, 0, 0, 1, 1,
-1.493502, 1.002012, -1.690286, 1, 0, 0, 1, 1,
-1.471341, 2.232991, 0.4101467, 0, 0, 0, 1, 1,
-1.460636, 0.6703227, -2.265938, 0, 0, 0, 1, 1,
-1.458603, -1.119625, -2.022863, 0, 0, 0, 1, 1,
-1.453727, 1.019566, -1.055237, 0, 0, 0, 1, 1,
-1.444486, -0.817051, -2.653357, 0, 0, 0, 1, 1,
-1.444143, -1.426965, -1.271293, 0, 0, 0, 1, 1,
-1.442135, 2.467054, 1.278487, 0, 0, 0, 1, 1,
-1.43131, -0.170553, -0.7154037, 1, 1, 1, 1, 1,
-1.429531, 1.6572, -1.305052, 1, 1, 1, 1, 1,
-1.411955, -0.6905119, -2.486754, 1, 1, 1, 1, 1,
-1.4053, 0.2676535, -2.630061, 1, 1, 1, 1, 1,
-1.392088, 0.2922401, -1.265417, 1, 1, 1, 1, 1,
-1.389145, 1.629108, -0.9675104, 1, 1, 1, 1, 1,
-1.388839, -1.660629, -1.343816, 1, 1, 1, 1, 1,
-1.38826, -0.1681228, -0.5624786, 1, 1, 1, 1, 1,
-1.383525, 0.1773974, -1.63891, 1, 1, 1, 1, 1,
-1.381746, -0.8532896, -2.118453, 1, 1, 1, 1, 1,
-1.378267, 1.492465, -1.889787, 1, 1, 1, 1, 1,
-1.377781, 0.399852, -3.069614, 1, 1, 1, 1, 1,
-1.358076, -0.02421284, -2.57086, 1, 1, 1, 1, 1,
-1.345031, 0.8173385, -0.1870869, 1, 1, 1, 1, 1,
-1.338322, 0.6533548, -2.905591, 1, 1, 1, 1, 1,
-1.330431, -1.675802, -2.674486, 0, 0, 1, 1, 1,
-1.322092, 0.04308532, -0.966664, 1, 0, 0, 1, 1,
-1.322078, -0.4223462, -1.481944, 1, 0, 0, 1, 1,
-1.320123, -1.912326, -2.889472, 1, 0, 0, 1, 1,
-1.289151, -0.09725174, -1.0719, 1, 0, 0, 1, 1,
-1.288271, 0.360959, -0.5492623, 1, 0, 0, 1, 1,
-1.284471, 0.2958345, -0.4523237, 0, 0, 0, 1, 1,
-1.278237, -0.06784565, -1.319833, 0, 0, 0, 1, 1,
-1.277866, -0.4700935, -0.6835321, 0, 0, 0, 1, 1,
-1.274948, -1.231716, 1.198152, 0, 0, 0, 1, 1,
-1.265805, 0.4955501, -1.161975, 0, 0, 0, 1, 1,
-1.253326, 1.629785, -1.209248, 0, 0, 0, 1, 1,
-1.247752, 0.3621219, -2.466983, 0, 0, 0, 1, 1,
-1.242185, 0.07901541, -1.428626, 1, 1, 1, 1, 1,
-1.234273, -1.31376, -2.356824, 1, 1, 1, 1, 1,
-1.231784, -0.3620046, -1.877754, 1, 1, 1, 1, 1,
-1.228364, 1.281473, -0.6964374, 1, 1, 1, 1, 1,
-1.226998, -0.9228154, -1.352767, 1, 1, 1, 1, 1,
-1.224548, -0.155672, -2.826707, 1, 1, 1, 1, 1,
-1.214256, -0.1579737, -3.038337, 1, 1, 1, 1, 1,
-1.213916, -0.10712, -0.2731533, 1, 1, 1, 1, 1,
-1.210044, -0.553397, -2.108678, 1, 1, 1, 1, 1,
-1.209477, -0.4982725, -2.774921, 1, 1, 1, 1, 1,
-1.207772, 0.6535971, -1.801383, 1, 1, 1, 1, 1,
-1.206013, 1.364186, -0.06684139, 1, 1, 1, 1, 1,
-1.204698, 2.731238, -1.31048, 1, 1, 1, 1, 1,
-1.20425, 0.7825121, -0.7485701, 1, 1, 1, 1, 1,
-1.204094, 1.145819, -1.113686, 1, 1, 1, 1, 1,
-1.199116, -0.1550187, -1.823164, 0, 0, 1, 1, 1,
-1.194987, 1.22047, 1.959829, 1, 0, 0, 1, 1,
-1.186541, 0.1360226, -0.3513556, 1, 0, 0, 1, 1,
-1.184909, -0.1988718, -1.218106, 1, 0, 0, 1, 1,
-1.181697, -0.1387511, -0.3809142, 1, 0, 0, 1, 1,
-1.177712, 0.6231654, -1.136249, 1, 0, 0, 1, 1,
-1.17715, -0.8361286, -2.344198, 0, 0, 0, 1, 1,
-1.175125, -1.14438, -3.15955, 0, 0, 0, 1, 1,
-1.169873, -0.5771599, -2.661109, 0, 0, 0, 1, 1,
-1.169221, 1.615565, 1.286282, 0, 0, 0, 1, 1,
-1.168969, -1.787825, -0.8782283, 0, 0, 0, 1, 1,
-1.165247, 0.1280734, -1.403979, 0, 0, 0, 1, 1,
-1.164528, 0.9720928, -0.7048219, 0, 0, 0, 1, 1,
-1.162538, 0.7733744, 0.9367492, 1, 1, 1, 1, 1,
-1.159051, -0.1169621, -2.113401, 1, 1, 1, 1, 1,
-1.157073, -0.3876297, -2.347533, 1, 1, 1, 1, 1,
-1.15219, -0.5989513, -2.119826, 1, 1, 1, 1, 1,
-1.142223, 1.167452, -0.9740955, 1, 1, 1, 1, 1,
-1.137849, -0.3593585, -1.109094, 1, 1, 1, 1, 1,
-1.130228, -1.232477, -3.851667, 1, 1, 1, 1, 1,
-1.127248, -0.7797185, -2.174021, 1, 1, 1, 1, 1,
-1.12522, 0.1229869, -1.314809, 1, 1, 1, 1, 1,
-1.118168, -0.2523481, -2.256593, 1, 1, 1, 1, 1,
-1.104298, 1.080938, -2.055994, 1, 1, 1, 1, 1,
-1.098857, 0.9786977, -1.464068, 1, 1, 1, 1, 1,
-1.090186, 0.1785096, -1.872091, 1, 1, 1, 1, 1,
-1.087981, -1.149321, -1.598546, 1, 1, 1, 1, 1,
-1.085557, 2.036238, -0.0390439, 1, 1, 1, 1, 1,
-1.084296, 0.002916947, -0.6574071, 0, 0, 1, 1, 1,
-1.081355, 1.446319, 0.9535943, 1, 0, 0, 1, 1,
-1.064336, 1.376177, -0.6109249, 1, 0, 0, 1, 1,
-1.045791, -0.06403765, -2.580852, 1, 0, 0, 1, 1,
-1.037234, 2.298601, -0.04334521, 1, 0, 0, 1, 1,
-1.036667, -1.244605, 0.07701809, 1, 0, 0, 1, 1,
-1.033551, -0.6820111, -0.6312034, 0, 0, 0, 1, 1,
-1.028182, 0.4623005, -0.3795958, 0, 0, 0, 1, 1,
-1.024987, -0.1115341, -2.273384, 0, 0, 0, 1, 1,
-1.022909, 1.244364, -0.3286153, 0, 0, 0, 1, 1,
-1.022369, 0.6162589, -2.50721, 0, 0, 0, 1, 1,
-1.017607, 0.2140934, -2.172549, 0, 0, 0, 1, 1,
-1.008421, -0.2400335, -1.887249, 0, 0, 0, 1, 1,
-1.003134, 0.6062941, -2.000144, 1, 1, 1, 1, 1,
-1.00038, 0.1605506, -0.6532294, 1, 1, 1, 1, 1,
-0.9979554, 0.2326888, -2.042606, 1, 1, 1, 1, 1,
-0.9954222, -0.6408046, -3.235315, 1, 1, 1, 1, 1,
-0.9927024, -1.214828, -2.81684, 1, 1, 1, 1, 1,
-0.9904471, -0.1479068, -1.886376, 1, 1, 1, 1, 1,
-0.9756966, -0.2255442, -2.686821, 1, 1, 1, 1, 1,
-0.9752793, 0.5446021, -1.728541, 1, 1, 1, 1, 1,
-0.9731345, -1.064515, -3.552841, 1, 1, 1, 1, 1,
-0.9678435, 1.531029, -0.6471927, 1, 1, 1, 1, 1,
-0.9664161, 0.8412229, -0.3877279, 1, 1, 1, 1, 1,
-0.9540436, -0.7887897, -3.695008, 1, 1, 1, 1, 1,
-0.947036, 0.3492169, 0.3352619, 1, 1, 1, 1, 1,
-0.9453748, -0.5618411, -3.220794, 1, 1, 1, 1, 1,
-0.9427989, 0.800847, -0.01482147, 1, 1, 1, 1, 1,
-0.9418699, -1.644867, -3.014405, 0, 0, 1, 1, 1,
-0.9413089, 1.619073, -2.594337, 1, 0, 0, 1, 1,
-0.9280999, -0.9280892, -4.507747, 1, 0, 0, 1, 1,
-0.9257173, -1.489571, -1.829135, 1, 0, 0, 1, 1,
-0.9233217, 1.842377, -1.820439, 1, 0, 0, 1, 1,
-0.9220624, -0.3618859, -1.546324, 1, 0, 0, 1, 1,
-0.9155409, 0.701894, -1.198156, 0, 0, 0, 1, 1,
-0.9141133, 0.01446227, -1.248407, 0, 0, 0, 1, 1,
-0.9140441, 2.215507, 0.05265013, 0, 0, 0, 1, 1,
-0.9060584, 0.4277033, -2.178197, 0, 0, 0, 1, 1,
-0.9059328, 0.3537239, -1.724851, 0, 0, 0, 1, 1,
-0.8837471, -0.3201037, -2.021726, 0, 0, 0, 1, 1,
-0.8765732, 0.6042606, -1.387949, 0, 0, 0, 1, 1,
-0.8743544, 1.891835, -0.3354229, 1, 1, 1, 1, 1,
-0.8727722, 0.4299824, 0.6669825, 1, 1, 1, 1, 1,
-0.8717193, 0.2904319, -1.340789, 1, 1, 1, 1, 1,
-0.8677194, -0.9335421, -1.856168, 1, 1, 1, 1, 1,
-0.8622599, 0.9562553, -1.311846, 1, 1, 1, 1, 1,
-0.8596811, -1.886951, -2.752988, 1, 1, 1, 1, 1,
-0.8552924, 0.07706335, 0.4531179, 1, 1, 1, 1, 1,
-0.8532673, 0.4885801, -1.950038, 1, 1, 1, 1, 1,
-0.8499881, -0.8566262, -2.390171, 1, 1, 1, 1, 1,
-0.8490458, -1.069253, -1.694409, 1, 1, 1, 1, 1,
-0.846628, -0.03548219, -0.2688188, 1, 1, 1, 1, 1,
-0.8452771, 1.640784, -0.9404053, 1, 1, 1, 1, 1,
-0.8442276, 0.9946103, -0.2024291, 1, 1, 1, 1, 1,
-0.8408732, -0.3159006, -1.929601, 1, 1, 1, 1, 1,
-0.8403931, 0.04462774, -2.41156, 1, 1, 1, 1, 1,
-0.838066, -0.3789344, -1.875863, 0, 0, 1, 1, 1,
-0.8347695, -1.200468, -3.813528, 1, 0, 0, 1, 1,
-0.834482, -0.2571377, -2.656689, 1, 0, 0, 1, 1,
-0.833053, 0.7946408, -0.7364922, 1, 0, 0, 1, 1,
-0.831597, -0.977411, -1.22618, 1, 0, 0, 1, 1,
-0.8297848, -1.275894, -1.642082, 1, 0, 0, 1, 1,
-0.8285302, -0.06895683, -1.381689, 0, 0, 0, 1, 1,
-0.827767, -0.1816861, -2.910463, 0, 0, 0, 1, 1,
-0.827704, -0.6664681, -2.06, 0, 0, 0, 1, 1,
-0.8209105, -0.1222088, -2.806636, 0, 0, 0, 1, 1,
-0.8138024, 1.131739, -0.7579671, 0, 0, 0, 1, 1,
-0.813437, -1.222111, -1.433355, 0, 0, 0, 1, 1,
-0.8084354, -0.6631616, -2.349712, 0, 0, 0, 1, 1,
-0.8028053, -0.613087, -1.092961, 1, 1, 1, 1, 1,
-0.8024234, -0.1437116, -1.989025, 1, 1, 1, 1, 1,
-0.8012378, -1.373638, -1.269293, 1, 1, 1, 1, 1,
-0.7986981, 1.297707, 0.1487888, 1, 1, 1, 1, 1,
-0.7937223, 0.7246855, -1.519199, 1, 1, 1, 1, 1,
-0.7875813, -0.608663, -2.199166, 1, 1, 1, 1, 1,
-0.7767692, 0.4990361, -0.7178618, 1, 1, 1, 1, 1,
-0.7755937, 0.8363934, 0.2286869, 1, 1, 1, 1, 1,
-0.7734418, 0.7146505, 1.410228, 1, 1, 1, 1, 1,
-0.7715955, -0.4738582, -1.618569, 1, 1, 1, 1, 1,
-0.7657537, 0.4931716, -0.2292684, 1, 1, 1, 1, 1,
-0.7645205, 1.5686, -0.8920701, 1, 1, 1, 1, 1,
-0.7623632, -0.1627795, -0.4496132, 1, 1, 1, 1, 1,
-0.7568228, 1.686695, -0.3921273, 1, 1, 1, 1, 1,
-0.7494259, 0.8238004, -1.127782, 1, 1, 1, 1, 1,
-0.7464272, 0.7714051, 0.5514578, 0, 0, 1, 1, 1,
-0.7448512, 0.08851981, -0.1770079, 1, 0, 0, 1, 1,
-0.7409301, 0.09636205, -1.615292, 1, 0, 0, 1, 1,
-0.7405037, 0.6126168, -1.239382, 1, 0, 0, 1, 1,
-0.7388919, -2.272146, -1.836941, 1, 0, 0, 1, 1,
-0.730272, -0.8096164, -2.661405, 1, 0, 0, 1, 1,
-0.7291317, 0.4884409, -2.438159, 0, 0, 0, 1, 1,
-0.7272992, -1.649723, -3.592328, 0, 0, 0, 1, 1,
-0.7156097, 2.323014, -0.5908101, 0, 0, 0, 1, 1,
-0.7028989, -0.4723967, -2.613024, 0, 0, 0, 1, 1,
-0.7010683, -0.5491756, -0.4192506, 0, 0, 0, 1, 1,
-0.6979241, -0.3944536, -1.702174, 0, 0, 0, 1, 1,
-0.6892308, 0.8121482, 0.9064623, 0, 0, 0, 1, 1,
-0.688723, -0.5852839, -2.308753, 1, 1, 1, 1, 1,
-0.687949, -0.7595851, -2.136462, 1, 1, 1, 1, 1,
-0.6853443, 0.715012, -2.694276, 1, 1, 1, 1, 1,
-0.6811908, -0.7029645, -1.782832, 1, 1, 1, 1, 1,
-0.6764262, 0.8554326, -1.883306, 1, 1, 1, 1, 1,
-0.6716196, -1.266025, -2.687387, 1, 1, 1, 1, 1,
-0.6681994, -0.3887974, -1.6242, 1, 1, 1, 1, 1,
-0.662571, 0.9941067, -0.8974115, 1, 1, 1, 1, 1,
-0.6621343, 0.783987, -0.8746052, 1, 1, 1, 1, 1,
-0.6611533, -0.694633, -2.805312, 1, 1, 1, 1, 1,
-0.6576495, -0.5771087, -2.24378, 1, 1, 1, 1, 1,
-0.6571605, 0.5085228, -1.473604, 1, 1, 1, 1, 1,
-0.6553403, -0.1385218, -2.52703, 1, 1, 1, 1, 1,
-0.6437093, -0.4395089, -3.634167, 1, 1, 1, 1, 1,
-0.6394252, -1.069547, -3.580148, 1, 1, 1, 1, 1,
-0.6332259, -1.407418, -1.51962, 0, 0, 1, 1, 1,
-0.6301779, 2.305746, 0.09402726, 1, 0, 0, 1, 1,
-0.6297472, -0.3841273, -3.193368, 1, 0, 0, 1, 1,
-0.6291247, 0.02180242, -2.148573, 1, 0, 0, 1, 1,
-0.6289319, -0.3197648, -2.116251, 1, 0, 0, 1, 1,
-0.6244306, -0.4448794, -3.347861, 1, 0, 0, 1, 1,
-0.6223797, -0.8516992, -2.907588, 0, 0, 0, 1, 1,
-0.6153207, -0.08591974, -1.802887, 0, 0, 0, 1, 1,
-0.6151375, 0.3505744, -1.660584, 0, 0, 0, 1, 1,
-0.6116506, 1.32309, 0.3346541, 0, 0, 0, 1, 1,
-0.603145, -0.1514868, -1.985, 0, 0, 0, 1, 1,
-0.5994923, -1.143355, -2.90663, 0, 0, 0, 1, 1,
-0.5978597, -0.4617181, -1.684614, 0, 0, 0, 1, 1,
-0.5886301, 0.6714892, -1.965691, 1, 1, 1, 1, 1,
-0.5871237, 0.6767876, -1.442634, 1, 1, 1, 1, 1,
-0.5842077, -0.5445811, -3.379072, 1, 1, 1, 1, 1,
-0.5828333, -0.4696686, -1.279335, 1, 1, 1, 1, 1,
-0.5814248, -0.3546737, -1.531167, 1, 1, 1, 1, 1,
-0.5812634, 1.312872, -1.241105, 1, 1, 1, 1, 1,
-0.5803957, 0.1000045, -0.566497, 1, 1, 1, 1, 1,
-0.5790735, -1.65957, -1.95962, 1, 1, 1, 1, 1,
-0.5787911, 0.3417846, -0.9527816, 1, 1, 1, 1, 1,
-0.5781884, 2.269695, 0.5876571, 1, 1, 1, 1, 1,
-0.5777805, -0.1820441, -0.643074, 1, 1, 1, 1, 1,
-0.5773821, -0.02768337, 0.1322932, 1, 1, 1, 1, 1,
-0.5708839, -0.6494104, -2.841407, 1, 1, 1, 1, 1,
-0.5706419, 0.0145823, -2.009447, 1, 1, 1, 1, 1,
-0.5703568, 0.7762482, 0.02492614, 1, 1, 1, 1, 1,
-0.5666533, -0.4347315, -2.036683, 0, 0, 1, 1, 1,
-0.5649656, 0.629092, 1.289814, 1, 0, 0, 1, 1,
-0.5600325, 1.368223, 1.567956, 1, 0, 0, 1, 1,
-0.5576357, -0.6906296, -2.925232, 1, 0, 0, 1, 1,
-0.5563717, -0.79958, -2.131077, 1, 0, 0, 1, 1,
-0.5559718, 0.1635575, -0.3646467, 1, 0, 0, 1, 1,
-0.550451, 1.080255, -0.4167688, 0, 0, 0, 1, 1,
-0.5500164, 0.8517815, -2.760972, 0, 0, 0, 1, 1,
-0.5487729, 0.7314795, -1.548173, 0, 0, 0, 1, 1,
-0.5456152, -0.6325122, -2.263638, 0, 0, 0, 1, 1,
-0.5442568, -1.185794, -2.724001, 0, 0, 0, 1, 1,
-0.5441264, -2.149639, -5.261015, 0, 0, 0, 1, 1,
-0.5440183, 0.8369212, -1.250627, 0, 0, 0, 1, 1,
-0.5422812, -0.6315318, -2.135221, 1, 1, 1, 1, 1,
-0.5401188, -2.153801, -4.73368, 1, 1, 1, 1, 1,
-0.538868, -0.5408497, -3.893216, 1, 1, 1, 1, 1,
-0.5382265, -0.1304153, -0.8020851, 1, 1, 1, 1, 1,
-0.5374306, 0.1910518, -2.028512, 1, 1, 1, 1, 1,
-0.5340515, -0.3356896, -2.446645, 1, 1, 1, 1, 1,
-0.5335109, -0.4669093, -2.786726, 1, 1, 1, 1, 1,
-0.5317153, 0.733041, -0.8092874, 1, 1, 1, 1, 1,
-0.5289713, 1.002921, -0.4017064, 1, 1, 1, 1, 1,
-0.5244383, 0.08158019, -1.638039, 1, 1, 1, 1, 1,
-0.523796, 0.4559629, -1.059719, 1, 1, 1, 1, 1,
-0.5230152, 0.1799577, -2.472908, 1, 1, 1, 1, 1,
-0.5203815, -0.8778079, -3.464833, 1, 1, 1, 1, 1,
-0.5156997, -1.588148, -1.065276, 1, 1, 1, 1, 1,
-0.5098643, 0.2906792, -2.639379, 1, 1, 1, 1, 1,
-0.5091786, 0.4269194, -0.5271764, 0, 0, 1, 1, 1,
-0.5082163, 2.102448, 0.1761163, 1, 0, 0, 1, 1,
-0.505732, -0.5756646, -3.298795, 1, 0, 0, 1, 1,
-0.5021644, 0.8867768, 0.5685824, 1, 0, 0, 1, 1,
-0.5007301, 0.08797947, -1.43071, 1, 0, 0, 1, 1,
-0.4998389, 1.040832, -2.35199, 1, 0, 0, 1, 1,
-0.4982592, 0.8838127, -1.176297, 0, 0, 0, 1, 1,
-0.498142, -0.1082393, -1.191174, 0, 0, 0, 1, 1,
-0.49525, 0.5438034, -1.120577, 0, 0, 0, 1, 1,
-0.4939164, 0.3118879, -2.372717, 0, 0, 0, 1, 1,
-0.4917769, 2.710155, 0.555992, 0, 0, 0, 1, 1,
-0.4894594, -0.5010727, -3.138395, 0, 0, 0, 1, 1,
-0.4891074, -0.1642431, -3.142293, 0, 0, 0, 1, 1,
-0.4876312, 0.9219127, -0.1132349, 1, 1, 1, 1, 1,
-0.4856052, 0.9725762, -0.5150374, 1, 1, 1, 1, 1,
-0.4834573, 0.1106193, -1.918142, 1, 1, 1, 1, 1,
-0.4820525, -0.1149664, -2.29418, 1, 1, 1, 1, 1,
-0.4819916, -1.175295, -2.107044, 1, 1, 1, 1, 1,
-0.4800367, 1.510911, -1.859675, 1, 1, 1, 1, 1,
-0.4766445, -0.6778485, -1.58651, 1, 1, 1, 1, 1,
-0.4755679, 0.233175, 0.7886949, 1, 1, 1, 1, 1,
-0.473691, -0.6531075, -2.018596, 1, 1, 1, 1, 1,
-0.4722694, 0.4308706, 0.08325063, 1, 1, 1, 1, 1,
-0.471833, 0.4939117, -0.1292636, 1, 1, 1, 1, 1,
-0.4657726, 0.207304, -0.4939052, 1, 1, 1, 1, 1,
-0.4649775, -0.6669003, -1.262074, 1, 1, 1, 1, 1,
-0.4622544, 0.7391263, 0.4020006, 1, 1, 1, 1, 1,
-0.4582053, -1.29555, -1.909446, 1, 1, 1, 1, 1,
-0.4578134, -0.09441306, -0.447107, 0, 0, 1, 1, 1,
-0.4534045, 1.778723, -1.620325, 1, 0, 0, 1, 1,
-0.451632, -0.8098548, -2.475208, 1, 0, 0, 1, 1,
-0.4514413, -0.1637101, -1.680323, 1, 0, 0, 1, 1,
-0.450422, -0.8807662, -3.572668, 1, 0, 0, 1, 1,
-0.4499052, -0.4733543, -2.461958, 1, 0, 0, 1, 1,
-0.4488901, -0.140994, -3.993092, 0, 0, 0, 1, 1,
-0.4470148, -1.251148, -3.194701, 0, 0, 0, 1, 1,
-0.4466518, -0.3807626, -2.322219, 0, 0, 0, 1, 1,
-0.4464369, 0.7764331, 0.6539501, 0, 0, 0, 1, 1,
-0.4463581, 0.2041955, -1.780934, 0, 0, 0, 1, 1,
-0.4462596, 0.6276063, -0.917172, 0, 0, 0, 1, 1,
-0.4452035, -0.8334125, -2.751655, 0, 0, 0, 1, 1,
-0.4423723, 0.6097207, -1.734845, 1, 1, 1, 1, 1,
-0.4375699, -1.361016, -3.823178, 1, 1, 1, 1, 1,
-0.437486, 0.3312919, -0.7472813, 1, 1, 1, 1, 1,
-0.4367572, -0.6819, -3.38754, 1, 1, 1, 1, 1,
-0.4359821, -0.1301651, -3.460372, 1, 1, 1, 1, 1,
-0.4312874, 1.434216, 0.3496081, 1, 1, 1, 1, 1,
-0.4234167, -1.741164, -3.487485, 1, 1, 1, 1, 1,
-0.4202395, 0.6771383, -0.2222925, 1, 1, 1, 1, 1,
-0.4170027, 2.11289, 0.8827911, 1, 1, 1, 1, 1,
-0.4142728, 0.07766136, -0.7424812, 1, 1, 1, 1, 1,
-0.4100571, -0.4706497, -1.940615, 1, 1, 1, 1, 1,
-0.4026521, -1.347401, -3.290468, 1, 1, 1, 1, 1,
-0.4013767, 0.1297938, -2.125261, 1, 1, 1, 1, 1,
-0.3990982, 0.2157906, -1.75712, 1, 1, 1, 1, 1,
-0.3970686, 0.3728101, -0.6714742, 1, 1, 1, 1, 1,
-0.3965811, -0.09703145, -2.195554, 0, 0, 1, 1, 1,
-0.3937357, -1.437498, -3.20659, 1, 0, 0, 1, 1,
-0.3936041, 0.3465851, -2.112064, 1, 0, 0, 1, 1,
-0.3921807, 0.1634637, -0.189262, 1, 0, 0, 1, 1,
-0.3901704, -0.3779312, -2.302639, 1, 0, 0, 1, 1,
-0.3900989, -1.419085, -2.719895, 1, 0, 0, 1, 1,
-0.3892082, -0.1589441, -1.565009, 0, 0, 0, 1, 1,
-0.3874262, -0.2447723, -1.198201, 0, 0, 0, 1, 1,
-0.3851073, 0.9749424, -0.5844785, 0, 0, 0, 1, 1,
-0.377041, -1.062423, -2.810308, 0, 0, 0, 1, 1,
-0.3760352, 1.306984, -2.050669, 0, 0, 0, 1, 1,
-0.3727622, -0.4433548, -2.631226, 0, 0, 0, 1, 1,
-0.3721605, -1.173027, -4.553765, 0, 0, 0, 1, 1,
-0.3718888, 1.405042, 0.3158268, 1, 1, 1, 1, 1,
-0.3698025, -0.5412814, -3.203431, 1, 1, 1, 1, 1,
-0.3693139, -0.3417867, -1.445424, 1, 1, 1, 1, 1,
-0.3575711, 0.709745, 1.82368, 1, 1, 1, 1, 1,
-0.3564163, 0.186247, -1.775839, 1, 1, 1, 1, 1,
-0.3539667, 1.557312, 0.624044, 1, 1, 1, 1, 1,
-0.3536819, 2.127988, -0.1584207, 1, 1, 1, 1, 1,
-0.3520582, 0.4583734, -1.911378, 1, 1, 1, 1, 1,
-0.3495134, -1.544018, -5.386655, 1, 1, 1, 1, 1,
-0.347624, -0.2075624, -2.435314, 1, 1, 1, 1, 1,
-0.3463576, 2.190987, -1.352707, 1, 1, 1, 1, 1,
-0.345919, -0.07981508, -0.4051557, 1, 1, 1, 1, 1,
-0.3456965, -0.1313074, -1.736477, 1, 1, 1, 1, 1,
-0.3417706, -0.5735456, -4.176232, 1, 1, 1, 1, 1,
-0.3405399, -0.727197, -2.966962, 1, 1, 1, 1, 1,
-0.3391482, -1.896961, -3.010458, 0, 0, 1, 1, 1,
-0.3382409, 0.5858597, -2.46565, 1, 0, 0, 1, 1,
-0.3327797, 1.77098, 0.5184655, 1, 0, 0, 1, 1,
-0.3297833, -0.7780398, -2.307898, 1, 0, 0, 1, 1,
-0.3251624, 0.4386852, -1.773576, 1, 0, 0, 1, 1,
-0.3205822, -0.7184237, -2.820831, 1, 0, 0, 1, 1,
-0.314512, -1.215276, -3.798404, 0, 0, 0, 1, 1,
-0.3070536, 0.6245976, -0.5860512, 0, 0, 0, 1, 1,
-0.3050448, -1.167562, -2.601593, 0, 0, 0, 1, 1,
-0.2996446, -0.5254471, -2.791154, 0, 0, 0, 1, 1,
-0.297482, 0.6267436, -1.72423, 0, 0, 0, 1, 1,
-0.2956499, 0.7168657, -1.081715, 0, 0, 0, 1, 1,
-0.2939211, -0.361442, -1.735093, 0, 0, 0, 1, 1,
-0.2871615, -0.0279199, -1.454075, 1, 1, 1, 1, 1,
-0.2871488, 0.09714613, -0.4897408, 1, 1, 1, 1, 1,
-0.2869427, -0.127969, -1.418334, 1, 1, 1, 1, 1,
-0.2829204, -0.1025817, -3.305404, 1, 1, 1, 1, 1,
-0.2824701, 0.331129, -1.785584, 1, 1, 1, 1, 1,
-0.2800012, -1.01559, -4.180028, 1, 1, 1, 1, 1,
-0.2798257, 0.2778353, -0.5515994, 1, 1, 1, 1, 1,
-0.2797239, -0.4444703, -2.594266, 1, 1, 1, 1, 1,
-0.2739915, -0.2057736, -2.969093, 1, 1, 1, 1, 1,
-0.2730765, 0.6398922, -0.3033495, 1, 1, 1, 1, 1,
-0.2717177, 1.755512, 0.2468271, 1, 1, 1, 1, 1,
-0.2713656, 1.132914, -0.06262237, 1, 1, 1, 1, 1,
-0.2710142, -1.70732, -1.558883, 1, 1, 1, 1, 1,
-0.2698173, 0.2390036, -0.02049732, 1, 1, 1, 1, 1,
-0.2633869, 0.08257299, 0.8447978, 1, 1, 1, 1, 1,
-0.2578872, 0.1024697, -0.909125, 0, 0, 1, 1, 1,
-0.2568111, -0.740042, -2.774372, 1, 0, 0, 1, 1,
-0.2565868, -0.3217646, -2.304968, 1, 0, 0, 1, 1,
-0.2563382, 0.9196128, 0.05218738, 1, 0, 0, 1, 1,
-0.2528239, 0.9317927, -0.7489359, 1, 0, 0, 1, 1,
-0.2519257, 0.2663505, 0.2028299, 1, 0, 0, 1, 1,
-0.2501316, -0.2010149, -2.934325, 0, 0, 0, 1, 1,
-0.2459023, 2.026067, 0.2622844, 0, 0, 0, 1, 1,
-0.2433831, -1.248796, -4.132237, 0, 0, 0, 1, 1,
-0.2418623, -1.564514, -4.281656, 0, 0, 0, 1, 1,
-0.2411372, 1.541729, 0.8553678, 0, 0, 0, 1, 1,
-0.240678, 0.06562602, 0.1410598, 0, 0, 0, 1, 1,
-0.232608, -1.794406, -3.339104, 0, 0, 0, 1, 1,
-0.2303727, 0.2211854, 0.4682432, 1, 1, 1, 1, 1,
-0.2271884, 1.573864, 0.6949069, 1, 1, 1, 1, 1,
-0.2269869, 0.3839508, 0.4534028, 1, 1, 1, 1, 1,
-0.2264072, 0.565239, 0.6665828, 1, 1, 1, 1, 1,
-0.224554, 0.4594067, -0.01440945, 1, 1, 1, 1, 1,
-0.223843, 1.80714, 0.8124785, 1, 1, 1, 1, 1,
-0.2231166, 0.7208394, -1.77731, 1, 1, 1, 1, 1,
-0.218803, 0.9075502, 0.1496794, 1, 1, 1, 1, 1,
-0.2098238, -0.434848, -2.574029, 1, 1, 1, 1, 1,
-0.2084893, 1.032368, -0.5347599, 1, 1, 1, 1, 1,
-0.203866, 0.343215, -2.4449, 1, 1, 1, 1, 1,
-0.2028253, -1.444443, -2.690016, 1, 1, 1, 1, 1,
-0.2018225, -0.8865937, -1.388944, 1, 1, 1, 1, 1,
-0.1959015, -0.01101096, -1.343632, 1, 1, 1, 1, 1,
-0.1920527, -0.8757114, -2.28806, 1, 1, 1, 1, 1,
-0.1834121, 0.6121837, 0.2505164, 0, 0, 1, 1, 1,
-0.1788516, -0.5345469, -3.959624, 1, 0, 0, 1, 1,
-0.1751864, 0.04471292, -0.7863535, 1, 0, 0, 1, 1,
-0.1744603, -0.5536988, -2.208465, 1, 0, 0, 1, 1,
-0.1694602, -0.1325587, -3.315235, 1, 0, 0, 1, 1,
-0.1651806, -0.04168528, -3.029995, 1, 0, 0, 1, 1,
-0.164609, 0.3680139, 0.450678, 0, 0, 0, 1, 1,
-0.1630087, -0.8250043, -2.341901, 0, 0, 0, 1, 1,
-0.1615668, -0.9299344, -2.275562, 0, 0, 0, 1, 1,
-0.1611097, -1.07765, -3.026544, 0, 0, 0, 1, 1,
-0.1562157, -0.6277539, -1.970783, 0, 0, 0, 1, 1,
-0.1561609, -0.2173214, -2.523823, 0, 0, 0, 1, 1,
-0.1518687, 0.9600379, 0.1284893, 0, 0, 0, 1, 1,
-0.1425983, 0.1650339, 0.6968939, 1, 1, 1, 1, 1,
-0.1399369, -0.8113441, -2.077665, 1, 1, 1, 1, 1,
-0.1399214, -0.2441304, -1.081186, 1, 1, 1, 1, 1,
-0.1212912, -1.634498, -2.980646, 1, 1, 1, 1, 1,
-0.119423, -1.113661, -2.711815, 1, 1, 1, 1, 1,
-0.1193491, 2.726665, 0.6670196, 1, 1, 1, 1, 1,
-0.1159448, 0.9214969, 1.476443, 1, 1, 1, 1, 1,
-0.1113655, -0.806756, -3.278252, 1, 1, 1, 1, 1,
-0.1051317, 1.298638, 0.1882036, 1, 1, 1, 1, 1,
-0.1003789, -1.282996, -2.623142, 1, 1, 1, 1, 1,
-0.09845612, 0.7453194, -0.4855953, 1, 1, 1, 1, 1,
-0.09351885, 0.1530807, -2.055979, 1, 1, 1, 1, 1,
-0.09318699, -0.6220182, -4.447608, 1, 1, 1, 1, 1,
-0.09254045, 0.8260171, -0.5172064, 1, 1, 1, 1, 1,
-0.08894812, -0.339291, -4.847731, 1, 1, 1, 1, 1,
-0.08879796, -0.9015552, -4.264653, 0, 0, 1, 1, 1,
-0.08550428, 0.438477, -1.568589, 1, 0, 0, 1, 1,
-0.08245464, 0.6735592, 2.317131, 1, 0, 0, 1, 1,
-0.07641478, 0.06388764, -1.982716, 1, 0, 0, 1, 1,
-0.07357777, -0.4436849, -1.210558, 1, 0, 0, 1, 1,
-0.07136757, -0.5369785, -1.907681, 1, 0, 0, 1, 1,
-0.06872711, 0.8997467, 1.842618, 0, 0, 0, 1, 1,
-0.0638843, -0.9106995, -2.265558, 0, 0, 0, 1, 1,
-0.06346142, 1.28705, -0.6045133, 0, 0, 0, 1, 1,
-0.05975241, 0.2998851, -0.1845154, 0, 0, 0, 1, 1,
-0.05834129, 1.332331, -0.007285924, 0, 0, 0, 1, 1,
-0.05581602, -0.06202674, -2.984205, 0, 0, 0, 1, 1,
-0.0557725, 0.6986656, -0.2496748, 0, 0, 0, 1, 1,
-0.05481825, -0.3731934, -4.005717, 1, 1, 1, 1, 1,
-0.0520346, 1.097883, -0.3731749, 1, 1, 1, 1, 1,
-0.05019584, -0.0426793, -2.149967, 1, 1, 1, 1, 1,
-0.04597139, 0.1012397, 0.106029, 1, 1, 1, 1, 1,
-0.04553577, 1.984591, -0.3066048, 1, 1, 1, 1, 1,
-0.04377865, -0.5376632, -4.54238, 1, 1, 1, 1, 1,
-0.04173626, -0.9951189, -2.303439, 1, 1, 1, 1, 1,
-0.03836666, 0.2536406, -1.133475, 1, 1, 1, 1, 1,
-0.03099636, 0.1511648, -1.459749, 1, 1, 1, 1, 1,
-0.0265394, -0.06946956, -3.451479, 1, 1, 1, 1, 1,
-0.02314142, -0.3431827, -3.888353, 1, 1, 1, 1, 1,
-0.02203664, 0.8414357, 1.198981, 1, 1, 1, 1, 1,
-0.02164008, 0.03059773, -1.245437, 1, 1, 1, 1, 1,
-0.0215969, -0.1238209, -3.743843, 1, 1, 1, 1, 1,
-0.01854379, -0.8026826, -4.202366, 1, 1, 1, 1, 1,
-0.01762662, -1.118288, -1.662453, 0, 0, 1, 1, 1,
-0.01109775, 0.2711862, -1.009248, 1, 0, 0, 1, 1,
-0.01072668, -0.2963697, -3.345364, 1, 0, 0, 1, 1,
-0.008943521, -0.3332507, -4.254564, 1, 0, 0, 1, 1,
-0.007167203, 1.147734, -0.452895, 1, 0, 0, 1, 1,
-0.003071208, 0.2547529, -0.9794899, 1, 0, 0, 1, 1,
-0.002046486, -0.03502673, -3.298395, 0, 0, 0, 1, 1,
-0.00110792, -0.3719907, -4.166069, 0, 0, 0, 1, 1,
0.0007527613, -0.02889055, 3.095954, 0, 0, 0, 1, 1,
0.001562941, -0.7936667, 2.512849, 0, 0, 0, 1, 1,
0.001862975, -0.150642, 2.142893, 0, 0, 0, 1, 1,
0.003312654, 0.9482068, -0.1364617, 0, 0, 0, 1, 1,
0.004407701, -0.76789, 3.172028, 0, 0, 0, 1, 1,
0.007753789, 1.135816, -1.181733, 1, 1, 1, 1, 1,
0.01047419, 0.4707957, 0.8663039, 1, 1, 1, 1, 1,
0.01336504, 0.4819079, -1.679177, 1, 1, 1, 1, 1,
0.02128005, -0.1487094, 3.293357, 1, 1, 1, 1, 1,
0.02183844, 1.048667, 0.6714302, 1, 1, 1, 1, 1,
0.0226321, 0.8671826, -0.8106228, 1, 1, 1, 1, 1,
0.02444609, -2.08865, 3.307124, 1, 1, 1, 1, 1,
0.02792848, -1.331954, 2.994192, 1, 1, 1, 1, 1,
0.0294759, 0.5114608, 0.9016533, 1, 1, 1, 1, 1,
0.02998084, 0.3876172, -1.726602, 1, 1, 1, 1, 1,
0.0328757, 1.643628, -2.215897, 1, 1, 1, 1, 1,
0.0375071, -0.6625183, 2.969928, 1, 1, 1, 1, 1,
0.04222026, 2.401375, -0.5139865, 1, 1, 1, 1, 1,
0.04347227, 0.4133996, -1.17789, 1, 1, 1, 1, 1,
0.05279026, -0.2816906, 2.770468, 1, 1, 1, 1, 1,
0.05643131, -0.6906596, 3.468956, 0, 0, 1, 1, 1,
0.06204762, -0.3757991, 4.060316, 1, 0, 0, 1, 1,
0.06341387, 0.1600461, -0.7449786, 1, 0, 0, 1, 1,
0.06578176, -0.06284729, 2.99229, 1, 0, 0, 1, 1,
0.06797522, 1.20088, 1.573646, 1, 0, 0, 1, 1,
0.07128451, 0.679586, 2.498199, 1, 0, 0, 1, 1,
0.07134499, -0.2272604, 2.695649, 0, 0, 0, 1, 1,
0.07516301, 1.006489, -0.4737177, 0, 0, 0, 1, 1,
0.07561423, -0.006520534, 1.637072, 0, 0, 0, 1, 1,
0.08175269, 1.592279, -0.2452118, 0, 0, 0, 1, 1,
0.08673798, 1.616802, 0.5961945, 0, 0, 0, 1, 1,
0.08794063, 0.1483594, 0.4153023, 0, 0, 0, 1, 1,
0.08821461, 1.843313, -0.1359799, 0, 0, 0, 1, 1,
0.08990873, 0.03019875, 1.870191, 1, 1, 1, 1, 1,
0.09081395, -0.4706495, 2.175193, 1, 1, 1, 1, 1,
0.09543063, -1.260239, 2.084666, 1, 1, 1, 1, 1,
0.1001679, -0.9875699, 4.031711, 1, 1, 1, 1, 1,
0.1044369, 0.2291914, -1.016105, 1, 1, 1, 1, 1,
0.1048596, 0.46988, 1.317971, 1, 1, 1, 1, 1,
0.107225, 0.4821549, -0.1687845, 1, 1, 1, 1, 1,
0.1093142, -0.5363631, 3.949335, 1, 1, 1, 1, 1,
0.1140925, -0.7430766, 3.741932, 1, 1, 1, 1, 1,
0.1178952, 0.2509119, 1.278431, 1, 1, 1, 1, 1,
0.1210706, 1.260213, -0.7713072, 1, 1, 1, 1, 1,
0.1224566, 0.5408788, 0.6216804, 1, 1, 1, 1, 1,
0.1260447, -0.1113058, 1.910491, 1, 1, 1, 1, 1,
0.1303939, -1.039681, 2.043061, 1, 1, 1, 1, 1,
0.1306505, -0.9697018, 2.493384, 1, 1, 1, 1, 1,
0.1309613, -1.899795, 3.669794, 0, 0, 1, 1, 1,
0.1340379, -0.1621193, 1.664103, 1, 0, 0, 1, 1,
0.1349517, 0.7883855, -0.05017813, 1, 0, 0, 1, 1,
0.1367555, -0.0150117, 0.3655232, 1, 0, 0, 1, 1,
0.1373449, 2.101692, 0.5912752, 1, 0, 0, 1, 1,
0.138947, -0.3372738, 4.071047, 1, 0, 0, 1, 1,
0.1391465, 0.5364634, -0.3865432, 0, 0, 0, 1, 1,
0.1409526, 2.269455, -2.25172, 0, 0, 0, 1, 1,
0.1440134, 0.3641094, -1.020851, 0, 0, 0, 1, 1,
0.1527482, 1.66733, -1.268438, 0, 0, 0, 1, 1,
0.1573786, -1.192721, 2.972419, 0, 0, 0, 1, 1,
0.1575069, -2.007841, 2.982117, 0, 0, 0, 1, 1,
0.1578165, 0.05648032, 1.38895, 0, 0, 0, 1, 1,
0.1591307, 1.479134, -0.6191543, 1, 1, 1, 1, 1,
0.1596725, -2.254708, 2.595529, 1, 1, 1, 1, 1,
0.1615351, -0.8201401, 1.528126, 1, 1, 1, 1, 1,
0.1629616, -0.1579843, 3.357008, 1, 1, 1, 1, 1,
0.1697584, 1.978122, 0.8340442, 1, 1, 1, 1, 1,
0.1709555, 1.023593, 0.04516296, 1, 1, 1, 1, 1,
0.1831494, 1.161215, -0.9328652, 1, 1, 1, 1, 1,
0.192654, 0.2265223, 0.4947117, 1, 1, 1, 1, 1,
0.197534, 0.70432, 0.1278827, 1, 1, 1, 1, 1,
0.1979101, 0.9415219, 0.3566657, 1, 1, 1, 1, 1,
0.1986512, 2.532085, -0.8712946, 1, 1, 1, 1, 1,
0.2005916, -0.003849576, 2.171161, 1, 1, 1, 1, 1,
0.2045243, 0.7563745, 0.7317036, 1, 1, 1, 1, 1,
0.2097984, -0.03599042, 2.060053, 1, 1, 1, 1, 1,
0.2163276, -1.344273, 3.549053, 1, 1, 1, 1, 1,
0.2196605, -0.3756708, 3.018196, 0, 0, 1, 1, 1,
0.2263889, 0.1420919, 1.447734, 1, 0, 0, 1, 1,
0.2267054, -1.258911, 2.385607, 1, 0, 0, 1, 1,
0.2269052, -2.204671, 1.860626, 1, 0, 0, 1, 1,
0.2293476, -0.60225, 2.606176, 1, 0, 0, 1, 1,
0.2322697, -0.4508336, 1.668336, 1, 0, 0, 1, 1,
0.233965, -1.102572, 3.659274, 0, 0, 0, 1, 1,
0.234615, -0.07229692, 1.691036, 0, 0, 0, 1, 1,
0.2352587, 0.7174059, 0.1396206, 0, 0, 0, 1, 1,
0.2367785, 3.030273, 0.4786192, 0, 0, 0, 1, 1,
0.2410096, 0.2561502, 1.40238, 0, 0, 0, 1, 1,
0.2441258, 0.8996028, 1.390545, 0, 0, 0, 1, 1,
0.2454198, 1.771678, -0.6786619, 0, 0, 0, 1, 1,
0.2477571, 0.9103326, 0.5229861, 1, 1, 1, 1, 1,
0.2497309, -0.6806027, 2.524454, 1, 1, 1, 1, 1,
0.2536582, 0.8837707, 2.315423, 1, 1, 1, 1, 1,
0.2537682, 0.4892313, 1.349199, 1, 1, 1, 1, 1,
0.2541855, 0.8897361, 0.6802203, 1, 1, 1, 1, 1,
0.2545313, -0.7811483, 1.885982, 1, 1, 1, 1, 1,
0.2545673, -0.5387681, 2.126813, 1, 1, 1, 1, 1,
0.257109, 1.093908, 0.386247, 1, 1, 1, 1, 1,
0.2585247, 1.154407, -0.2819588, 1, 1, 1, 1, 1,
0.2633175, -0.119828, 2.228316, 1, 1, 1, 1, 1,
0.2672091, -0.2021976, 1.938289, 1, 1, 1, 1, 1,
0.2699391, -0.07179032, 2.308352, 1, 1, 1, 1, 1,
0.271928, -1.416207, 2.78712, 1, 1, 1, 1, 1,
0.2819791, 0.7168073, 0.4895258, 1, 1, 1, 1, 1,
0.2853364, -0.8496678, 2.114303, 1, 1, 1, 1, 1,
0.2973844, 0.0987976, 0.7159851, 0, 0, 1, 1, 1,
0.2987859, -0.7155821, 3.831575, 1, 0, 0, 1, 1,
0.299302, 1.008452, -1.199901, 1, 0, 0, 1, 1,
0.3051592, 0.8502269, 1.517284, 1, 0, 0, 1, 1,
0.3070029, 0.02907946, 2.924943, 1, 0, 0, 1, 1,
0.3075706, 0.4765208, -0.7791322, 1, 0, 0, 1, 1,
0.3171996, -1.279831, 1.30561, 0, 0, 0, 1, 1,
0.3247263, -0.3588093, 3.820739, 0, 0, 0, 1, 1,
0.3250822, -0.8743312, 4.000774, 0, 0, 0, 1, 1,
0.3301823, -1.224289, 2.971764, 0, 0, 0, 1, 1,
0.3307178, -0.7138963, 1.579569, 0, 0, 0, 1, 1,
0.3335069, -0.02748965, 0.3636923, 0, 0, 0, 1, 1,
0.3337551, 0.6608151, 0.6467261, 0, 0, 0, 1, 1,
0.3375786, 0.2754045, 0.6315182, 1, 1, 1, 1, 1,
0.3383424, -0.5057994, 3.707556, 1, 1, 1, 1, 1,
0.3401509, 1.293053, 0.9503327, 1, 1, 1, 1, 1,
0.3408955, 0.4933126, 0.9542176, 1, 1, 1, 1, 1,
0.3413153, 0.8698922, 0.2833046, 1, 1, 1, 1, 1,
0.3418715, -1.095927, 3.169009, 1, 1, 1, 1, 1,
0.3455743, 1.004697, 0.3453722, 1, 1, 1, 1, 1,
0.3487124, 0.3205616, -0.1603075, 1, 1, 1, 1, 1,
0.349399, 0.07592016, 2.615146, 1, 1, 1, 1, 1,
0.3530906, -1.057747, 2.287355, 1, 1, 1, 1, 1,
0.3535376, 0.5750269, 0.2393178, 1, 1, 1, 1, 1,
0.3561217, 0.4845359, -1.015525, 1, 1, 1, 1, 1,
0.3564409, 0.2976695, -0.8637137, 1, 1, 1, 1, 1,
0.3611703, 0.8455343, -0.5929924, 1, 1, 1, 1, 1,
0.3615985, -0.6472067, 3.433034, 1, 1, 1, 1, 1,
0.3619181, -0.9474303, 1.774741, 0, 0, 1, 1, 1,
0.3631366, 0.2261859, 1.172893, 1, 0, 0, 1, 1,
0.3636875, -1.923446, 3.494463, 1, 0, 0, 1, 1,
0.3642867, -0.8192167, 3.438262, 1, 0, 0, 1, 1,
0.3700584, 0.4119233, -0.8569081, 1, 0, 0, 1, 1,
0.3704263, -0.01319646, 1.827827, 1, 0, 0, 1, 1,
0.3716009, 1.256329, -1.534012, 0, 0, 0, 1, 1,
0.3722349, -0.7525254, 3.187039, 0, 0, 0, 1, 1,
0.3729081, -0.5064197, 1.417879, 0, 0, 0, 1, 1,
0.3769232, -0.1081325, 1.059831, 0, 0, 0, 1, 1,
0.37871, -2.767465, 3.366956, 0, 0, 0, 1, 1,
0.3794012, 0.2200675, 0.2837046, 0, 0, 0, 1, 1,
0.3819087, 0.0418302, 1.744541, 0, 0, 0, 1, 1,
0.3844849, -0.9545348, 1.144786, 1, 1, 1, 1, 1,
0.3865323, 0.3300662, -0.6897807, 1, 1, 1, 1, 1,
0.3906879, -1.024829, 3.226055, 1, 1, 1, 1, 1,
0.3929121, -0.3651755, 3.592327, 1, 1, 1, 1, 1,
0.3982873, 1.480573, 1.536093, 1, 1, 1, 1, 1,
0.4014285, -1.523506, 3.306636, 1, 1, 1, 1, 1,
0.4034693, -2.087255, 1.603282, 1, 1, 1, 1, 1,
0.4169944, -0.4966848, 3.490621, 1, 1, 1, 1, 1,
0.4190147, 0.6122231, 0.2696773, 1, 1, 1, 1, 1,
0.419957, -0.6593261, 1.716804, 1, 1, 1, 1, 1,
0.4202273, 0.4630423, 0.6925576, 1, 1, 1, 1, 1,
0.4291087, 0.2303584, 0.3905327, 1, 1, 1, 1, 1,
0.437044, 0.4785643, -0.7172619, 1, 1, 1, 1, 1,
0.437359, 0.4517998, -0.3264391, 1, 1, 1, 1, 1,
0.4410574, -0.3864103, 4.582308, 1, 1, 1, 1, 1,
0.4440528, 0.45983, 2.196476, 0, 0, 1, 1, 1,
0.4470741, 0.8952849, 1.610478, 1, 0, 0, 1, 1,
0.4481252, -0.6595461, 2.556674, 1, 0, 0, 1, 1,
0.4499951, 0.963532, 0.5674591, 1, 0, 0, 1, 1,
0.451339, 0.9599879, 0.8060132, 1, 0, 0, 1, 1,
0.4589989, -1.316059, 3.722176, 1, 0, 0, 1, 1,
0.4627623, 0.1635214, 2.084913, 0, 0, 0, 1, 1,
0.468127, 1.843563, -0.7934703, 0, 0, 0, 1, 1,
0.4707929, 1.095486, 0.3393937, 0, 0, 0, 1, 1,
0.472227, -0.8585125, 4.543438, 0, 0, 0, 1, 1,
0.4726886, 0.4669516, -0.6597835, 0, 0, 0, 1, 1,
0.4736546, 1.414864, 0.2052541, 0, 0, 0, 1, 1,
0.4744277, 0.4052861, 0.6846827, 0, 0, 0, 1, 1,
0.474632, 1.067804, 2.978359, 1, 1, 1, 1, 1,
0.4776063, 0.864373, -2.26064, 1, 1, 1, 1, 1,
0.4797412, -0.1495368, 1.284859, 1, 1, 1, 1, 1,
0.4884598, 0.2456048, 1.353569, 1, 1, 1, 1, 1,
0.4898813, -1.71122, 1.809618, 1, 1, 1, 1, 1,
0.4917576, 1.499394, -0.7646415, 1, 1, 1, 1, 1,
0.4934177, -1.616938, 3.247952, 1, 1, 1, 1, 1,
0.4977122, -1.0637, 1.847662, 1, 1, 1, 1, 1,
0.5078474, 0.8877213, 0.678398, 1, 1, 1, 1, 1,
0.5106902, 0.3355439, 2.651277, 1, 1, 1, 1, 1,
0.5140519, -0.1553953, 0.6619248, 1, 1, 1, 1, 1,
0.5158198, 0.4180529, -0.9721594, 1, 1, 1, 1, 1,
0.518415, -0.308071, 2.299832, 1, 1, 1, 1, 1,
0.5217277, -1.220849, 1.483119, 1, 1, 1, 1, 1,
0.5220243, -0.6410897, 1.937841, 1, 1, 1, 1, 1,
0.5226578, -0.3059294, 1.932185, 0, 0, 1, 1, 1,
0.5232067, 1.454616, -0.6990268, 1, 0, 0, 1, 1,
0.528951, -0.1614148, -0.08411682, 1, 0, 0, 1, 1,
0.5295007, 0.684101, 0.4096811, 1, 0, 0, 1, 1,
0.5297828, 0.407554, 0.4406273, 1, 0, 0, 1, 1,
0.5305446, 1.280097, 2.690299, 1, 0, 0, 1, 1,
0.5317973, 1.124914, 0.8645195, 0, 0, 0, 1, 1,
0.5336843, 1.868388, -2.018513, 0, 0, 0, 1, 1,
0.5402653, -1.060617, 1.957056, 0, 0, 0, 1, 1,
0.5480209, 0.4966832, 1.842203, 0, 0, 0, 1, 1,
0.5483139, 0.1103865, 1.409323, 0, 0, 0, 1, 1,
0.5565087, -0.4535265, 3.440647, 0, 0, 0, 1, 1,
0.5566413, 1.240816, 0.7591126, 0, 0, 0, 1, 1,
0.5606102, 0.3801233, -0.1342823, 1, 1, 1, 1, 1,
0.5609947, -0.08083207, 2.159933, 1, 1, 1, 1, 1,
0.5661423, 0.6131581, -0.5345712, 1, 1, 1, 1, 1,
0.5667096, -1.360442, 0.09451226, 1, 1, 1, 1, 1,
0.5691043, -1.546408, 3.642773, 1, 1, 1, 1, 1,
0.5725554, 1.036448, 0.1319054, 1, 1, 1, 1, 1,
0.5736699, -0.4627915, 1.894633, 1, 1, 1, 1, 1,
0.5764846, -0.3669958, 1.15891, 1, 1, 1, 1, 1,
0.5785577, -0.7476277, 2.372336, 1, 1, 1, 1, 1,
0.5804273, 0.5473682, 0.8264528, 1, 1, 1, 1, 1,
0.5827727, -0.6184179, 2.851597, 1, 1, 1, 1, 1,
0.5862938, 1.008309, -0.3921694, 1, 1, 1, 1, 1,
0.5957782, 2.516666, -0.5799466, 1, 1, 1, 1, 1,
0.5964978, -1.192002, 2.800378, 1, 1, 1, 1, 1,
0.5978302, 1.882851, 1.506027, 1, 1, 1, 1, 1,
0.5982968, -0.661383, 1.895461, 0, 0, 1, 1, 1,
0.609265, 1.64836, -1.128078, 1, 0, 0, 1, 1,
0.6097829, 1.863663, 0.452911, 1, 0, 0, 1, 1,
0.6123328, 0.8491861, 1.239969, 1, 0, 0, 1, 1,
0.6142795, -0.7802511, 2.187538, 1, 0, 0, 1, 1,
0.6201051, 0.1568394, 0.65897, 1, 0, 0, 1, 1,
0.6207333, 1.14487, 0.3872546, 0, 0, 0, 1, 1,
0.6222519, -1.814272, 1.387302, 0, 0, 0, 1, 1,
0.6227437, -0.9833699, 3.012705, 0, 0, 0, 1, 1,
0.6229296, 0.2806636, 0.8015746, 0, 0, 0, 1, 1,
0.6245313, 0.0958038, 1.767221, 0, 0, 0, 1, 1,
0.62893, -0.8929768, 3.170929, 0, 0, 0, 1, 1,
0.6383869, 1.410801, 3.637537, 0, 0, 0, 1, 1,
0.6438342, -0.7429988, 2.675158, 1, 1, 1, 1, 1,
0.6470064, 0.8025739, 0.5519871, 1, 1, 1, 1, 1,
0.6489989, 0.1490601, 1.169165, 1, 1, 1, 1, 1,
0.655751, -0.1035638, -0.002833869, 1, 1, 1, 1, 1,
0.6569567, 0.8163304, 1.97505, 1, 1, 1, 1, 1,
0.6590225, -0.05589537, 1.032334, 1, 1, 1, 1, 1,
0.6590562, -1.530514, 1.791532, 1, 1, 1, 1, 1,
0.6688073, 0.5087549, 0.09764431, 1, 1, 1, 1, 1,
0.67037, -0.520184, 3.614354, 1, 1, 1, 1, 1,
0.6706594, 0.3045501, 2.851423, 1, 1, 1, 1, 1,
0.6913638, 1.353271, 0.5713024, 1, 1, 1, 1, 1,
0.6915509, -0.004498698, 0.7080721, 1, 1, 1, 1, 1,
0.693119, 0.2028946, 1.675372, 1, 1, 1, 1, 1,
0.6943045, -1.406457, 1.677959, 1, 1, 1, 1, 1,
0.7017515, -0.05913493, 1.700292, 1, 1, 1, 1, 1,
0.7036029, 0.6772575, 2.668409, 0, 0, 1, 1, 1,
0.7049963, 0.9397566, -1.134065, 1, 0, 0, 1, 1,
0.7054679, 1.700261, 2.253328, 1, 0, 0, 1, 1,
0.7106355, -1.688026, 4.568786, 1, 0, 0, 1, 1,
0.7129785, 0.8021879, 0.4437791, 1, 0, 0, 1, 1,
0.7134581, -0.6446277, 2.973444, 1, 0, 0, 1, 1,
0.7179994, -0.7210962, 3.734324, 0, 0, 0, 1, 1,
0.7248199, -1.470331, 2.56706, 0, 0, 0, 1, 1,
0.7295067, 0.8693429, 0.8566648, 0, 0, 0, 1, 1,
0.7306941, 1.109772, -0.004135766, 0, 0, 0, 1, 1,
0.7339094, -0.1501361, 0.7327933, 0, 0, 0, 1, 1,
0.7386596, 0.09347167, 3.085571, 0, 0, 0, 1, 1,
0.7437312, 0.05042565, 1.219718, 0, 0, 0, 1, 1,
0.7439153, 1.374945, -1.040399, 1, 1, 1, 1, 1,
0.7497794, -0.08990114, 2.497994, 1, 1, 1, 1, 1,
0.7516325, -0.8710307, 2.643122, 1, 1, 1, 1, 1,
0.7590041, 2.174354, 0.8053488, 1, 1, 1, 1, 1,
0.7632278, 1.446619, 1.186313, 1, 1, 1, 1, 1,
0.7638201, 0.8726693, -0.2151513, 1, 1, 1, 1, 1,
0.7638615, 1.842683, 0.5154606, 1, 1, 1, 1, 1,
0.7656654, -1.055685, 2.172778, 1, 1, 1, 1, 1,
0.7726142, -1.141662, 1.298385, 1, 1, 1, 1, 1,
0.7732992, -0.5881803, 1.296407, 1, 1, 1, 1, 1,
0.7810454, 0.8159612, 1.016142, 1, 1, 1, 1, 1,
0.7826911, 1.414957, -0.8898619, 1, 1, 1, 1, 1,
0.7857147, 0.2628995, 2.225402, 1, 1, 1, 1, 1,
0.7881411, -0.1514226, 0.4610737, 1, 1, 1, 1, 1,
0.7916925, 0.8974432, 1.866483, 1, 1, 1, 1, 1,
0.7946954, -1.77703, 2.146767, 0, 0, 1, 1, 1,
0.7968241, 0.08209193, 3.155671, 1, 0, 0, 1, 1,
0.7984113, -1.664747, 0.7041663, 1, 0, 0, 1, 1,
0.819158, 0.7061556, 2.626807, 1, 0, 0, 1, 1,
0.8233978, -0.0261245, 0.876018, 1, 0, 0, 1, 1,
0.8234785, -0.06467536, 1.372306, 1, 0, 0, 1, 1,
0.8281755, 1.462158, -1.256368, 0, 0, 0, 1, 1,
0.8320357, 0.1602321, 0.8587279, 0, 0, 0, 1, 1,
0.8321643, -0.4184848, 1.640911, 0, 0, 0, 1, 1,
0.8324609, -0.9352338, 0.2508501, 0, 0, 0, 1, 1,
0.8407861, -1.650617, 4.566452, 0, 0, 0, 1, 1,
0.8408935, 0.382006, 1.246947, 0, 0, 0, 1, 1,
0.8435818, -0.6419517, 1.36743, 0, 0, 0, 1, 1,
0.8490036, 0.9080786, -0.1071247, 1, 1, 1, 1, 1,
0.854168, -1.2055, 3.535102, 1, 1, 1, 1, 1,
0.8578325, -2.183669, 0.9859543, 1, 1, 1, 1, 1,
0.8584065, 0.4228728, -0.3390772, 1, 1, 1, 1, 1,
0.8589255, -0.5946816, 1.256624, 1, 1, 1, 1, 1,
0.8589864, -0.1073179, 1.001737, 1, 1, 1, 1, 1,
0.8611522, 2.022649, 0.1918377, 1, 1, 1, 1, 1,
0.8643795, -1.614276, 5.235925, 1, 1, 1, 1, 1,
0.8649979, -0.008491027, -0.9570389, 1, 1, 1, 1, 1,
0.865346, 0.1021979, 1.087342, 1, 1, 1, 1, 1,
0.8711513, 1.572476, 1.95592, 1, 1, 1, 1, 1,
0.8723463, 1.306686, 0.2489398, 1, 1, 1, 1, 1,
0.8763455, -1.429824, 3.124736, 1, 1, 1, 1, 1,
0.8856027, 0.163385, 1.753405, 1, 1, 1, 1, 1,
0.8959103, 0.1820856, 0.6434376, 1, 1, 1, 1, 1,
0.896688, 0.6017449, 0.8331892, 0, 0, 1, 1, 1,
0.905974, 0.3175273, 2.006715, 1, 0, 0, 1, 1,
0.9089401, 0.08136224, 2.046849, 1, 0, 0, 1, 1,
0.9154932, 0.2685309, -0.4120312, 1, 0, 0, 1, 1,
0.9160793, -1.501533, 1.344231, 1, 0, 0, 1, 1,
0.9164186, 0.7326534, -1.116374, 1, 0, 0, 1, 1,
0.917663, 0.5433323, 2.693685, 0, 0, 0, 1, 1,
0.9185626, -0.702462, 2.179348, 0, 0, 0, 1, 1,
0.9247705, -0.9428658, 2.914278, 0, 0, 0, 1, 1,
0.9266412, -1.287866, 3.417608, 0, 0, 0, 1, 1,
0.928745, -1.249043, 2.820748, 0, 0, 0, 1, 1,
0.9291114, -1.26524, 2.065526, 0, 0, 0, 1, 1,
0.9329525, -0.2372928, 2.247467, 0, 0, 0, 1, 1,
0.9378628, 1.747268, 1.162547, 1, 1, 1, 1, 1,
0.9416311, 0.1250315, 0.9856357, 1, 1, 1, 1, 1,
0.9418799, -0.03774523, 1.389367, 1, 1, 1, 1, 1,
0.9433149, 2.126555, 1.799876, 1, 1, 1, 1, 1,
0.9449053, -0.9365226, 1.281014, 1, 1, 1, 1, 1,
0.9472392, 0.7176268, 2.311654, 1, 1, 1, 1, 1,
0.9504788, -1.170256, 3.392452, 1, 1, 1, 1, 1,
0.9522491, -0.9098856, 2.042723, 1, 1, 1, 1, 1,
0.9535373, 0.0391386, 0.1481697, 1, 1, 1, 1, 1,
0.9625213, 0.1879808, -0.008296523, 1, 1, 1, 1, 1,
0.9631842, -0.5993179, 1.953039, 1, 1, 1, 1, 1,
0.9726309, -0.1303556, 0.8876956, 1, 1, 1, 1, 1,
0.9743009, 0.3877094, 0.2379025, 1, 1, 1, 1, 1,
0.9767522, 1.183306, -0.01857309, 1, 1, 1, 1, 1,
0.9798014, 0.01467474, 1.683015, 1, 1, 1, 1, 1,
0.9834129, 0.1361519, 0.4907661, 0, 0, 1, 1, 1,
0.9865849, -0.6694496, -0.01417941, 1, 0, 0, 1, 1,
0.9901664, 1.422048, -0.3230571, 1, 0, 0, 1, 1,
0.9944635, -1.048117, 1.571617, 1, 0, 0, 1, 1,
0.9952127, -0.6690731, 1.71747, 1, 0, 0, 1, 1,
0.9955686, -0.2512228, 2.884649, 1, 0, 0, 1, 1,
1.006105, -1.093551, 2.528869, 0, 0, 0, 1, 1,
1.008488, -0.5791218, 3.257483, 0, 0, 0, 1, 1,
1.010454, -1.989254, 3.900145, 0, 0, 0, 1, 1,
1.013102, 0.145227, 1.098558, 0, 0, 0, 1, 1,
1.013313, -1.410957, 2.925496, 0, 0, 0, 1, 1,
1.018864, 0.6742726, -0.3760138, 0, 0, 0, 1, 1,
1.024389, 0.892669, 2.367749, 0, 0, 0, 1, 1,
1.024493, -0.3413167, 1.562818, 1, 1, 1, 1, 1,
1.0351, -1.56674, 2.325117, 1, 1, 1, 1, 1,
1.037257, -0.03441434, 0.5985074, 1, 1, 1, 1, 1,
1.03951, -0.5615732, 2.31359, 1, 1, 1, 1, 1,
1.042019, 0.8743035, 1.517052, 1, 1, 1, 1, 1,
1.044383, 1.096346, 1.29416, 1, 1, 1, 1, 1,
1.052142, -0.5448161, 1.680377, 1, 1, 1, 1, 1,
1.06413, 0.08211657, 1.521794, 1, 1, 1, 1, 1,
1.064204, 0.924257, 0.9870074, 1, 1, 1, 1, 1,
1.065694, 0.4029439, -0.03316055, 1, 1, 1, 1, 1,
1.06804, 0.7673782, 0.5516791, 1, 1, 1, 1, 1,
1.073097, -0.6384031, 3.045854, 1, 1, 1, 1, 1,
1.078498, 1.644086, 0.1802677, 1, 1, 1, 1, 1,
1.081422, -0.542023, 2.597157, 1, 1, 1, 1, 1,
1.087145, -1.034693, 2.603553, 1, 1, 1, 1, 1,
1.095857, -0.05430209, 1.887542, 0, 0, 1, 1, 1,
1.097522, -0.4641451, 3.221972, 1, 0, 0, 1, 1,
1.115319, -0.5775796, 3.34493, 1, 0, 0, 1, 1,
1.11648, 0.5893025, -0.07593595, 1, 0, 0, 1, 1,
1.118307, 1.392031, 0.5229991, 1, 0, 0, 1, 1,
1.123201, 0.5545076, 1.536933, 1, 0, 0, 1, 1,
1.124741, -0.7490004, 2.151336, 0, 0, 0, 1, 1,
1.127343, 0.1314831, 1.637754, 0, 0, 0, 1, 1,
1.129619, 0.878013, 1.115765, 0, 0, 0, 1, 1,
1.129811, 1.656083, 1.193651, 0, 0, 0, 1, 1,
1.132672, 0.1912212, 1.740034, 0, 0, 0, 1, 1,
1.148502, 0.04993862, 2.657766, 0, 0, 0, 1, 1,
1.158094, 0.8783887, 1.029861, 0, 0, 0, 1, 1,
1.161439, 0.8633001, 0.2659793, 1, 1, 1, 1, 1,
1.164937, 1.663772, 2.020401, 1, 1, 1, 1, 1,
1.165864, 0.5684026, 3.703926, 1, 1, 1, 1, 1,
1.167047, 1.073812, 0.8414326, 1, 1, 1, 1, 1,
1.168798, 0.5705563, 1.126695, 1, 1, 1, 1, 1,
1.182217, -1.160063, 1.977777, 1, 1, 1, 1, 1,
1.186002, -0.3070999, 1.426283, 1, 1, 1, 1, 1,
1.194554, -1.425646, 1.643148, 1, 1, 1, 1, 1,
1.195137, 0.3951211, 0.4688733, 1, 1, 1, 1, 1,
1.205867, 0.2567341, 1.048642, 1, 1, 1, 1, 1,
1.212562, 0.9215571, 1.321471, 1, 1, 1, 1, 1,
1.214783, 0.3346878, 0.7593157, 1, 1, 1, 1, 1,
1.220491, -0.2725807, 0.3582046, 1, 1, 1, 1, 1,
1.221491, -1.127432, 0.8442474, 1, 1, 1, 1, 1,
1.233339, -0.4370676, 3.219135, 1, 1, 1, 1, 1,
1.244857, -0.4442813, 1.550869, 0, 0, 1, 1, 1,
1.257676, -0.296954, 1.39077, 1, 0, 0, 1, 1,
1.261883, 1.573463, 2.049202, 1, 0, 0, 1, 1,
1.281228, 0.1466853, 1.19437, 1, 0, 0, 1, 1,
1.307029, -0.421994, 1.582766, 1, 0, 0, 1, 1,
1.316458, 0.41881, 1.766517, 1, 0, 0, 1, 1,
1.340701, 0.2987199, 0.524725, 0, 0, 0, 1, 1,
1.341156, 0.4864703, 0.6440183, 0, 0, 0, 1, 1,
1.341532, -0.5162155, 2.108283, 0, 0, 0, 1, 1,
1.368204, -0.8500796, 2.264175, 0, 0, 0, 1, 1,
1.391989, -1.954301, 2.172723, 0, 0, 0, 1, 1,
1.394648, 1.41326, 1.070902, 0, 0, 0, 1, 1,
1.396311, -0.04020978, 0.8508057, 0, 0, 0, 1, 1,
1.397216, 1.100239, 1.98723, 1, 1, 1, 1, 1,
1.399355, 0.4617831, -0.8221379, 1, 1, 1, 1, 1,
1.402666, -0.1783168, 1.728336, 1, 1, 1, 1, 1,
1.413731, -1.179978, 2.817612, 1, 1, 1, 1, 1,
1.421111, 0.3859962, 2.012789, 1, 1, 1, 1, 1,
1.426797, 0.7857265, 0.3463389, 1, 1, 1, 1, 1,
1.433441, 0.6651649, 1.752761, 1, 1, 1, 1, 1,
1.451486, 0.6476779, 2.450199, 1, 1, 1, 1, 1,
1.451779, 0.8308081, -0.5521947, 1, 1, 1, 1, 1,
1.454409, -0.2754103, 1.352645, 1, 1, 1, 1, 1,
1.454738, -1.330995, 1.7259, 1, 1, 1, 1, 1,
1.464166, 1.30653, -0.2689804, 1, 1, 1, 1, 1,
1.466764, -1.160878, 2.2794, 1, 1, 1, 1, 1,
1.476326, 0.2180673, 1.429412, 1, 1, 1, 1, 1,
1.48639, -0.2048029, 0.703348, 1, 1, 1, 1, 1,
1.491028, -0.3447168, 2.64618, 0, 0, 1, 1, 1,
1.493702, -0.1793845, 1.574764, 1, 0, 0, 1, 1,
1.494583, -1.150654, 3.238889, 1, 0, 0, 1, 1,
1.500201, -0.8255774, 2.509984, 1, 0, 0, 1, 1,
1.520462, -0.3063291, 2.978802, 1, 0, 0, 1, 1,
1.523101, 1.096917, -1.557363, 1, 0, 0, 1, 1,
1.523501, 1.629821, -1.414908, 0, 0, 0, 1, 1,
1.535016, 0.6551982, 0.9952491, 0, 0, 0, 1, 1,
1.537865, 0.7813247, 3.280455, 0, 0, 0, 1, 1,
1.546218, 0.03285627, 2.228139, 0, 0, 0, 1, 1,
1.546919, 0.1877467, 2.99264, 0, 0, 0, 1, 1,
1.547916, -0.7727957, 3.701321, 0, 0, 0, 1, 1,
1.554179, 0.6535995, 0.9797147, 0, 0, 0, 1, 1,
1.568616, 1.40464, 1.068941, 1, 1, 1, 1, 1,
1.578435, -0.0171934, 2.052044, 1, 1, 1, 1, 1,
1.584013, -0.2514899, 3.836983, 1, 1, 1, 1, 1,
1.584847, 0.9588741, 0.1960239, 1, 1, 1, 1, 1,
1.586709, -1.685238, 1.944345, 1, 1, 1, 1, 1,
1.589682, -1.909259, 0.6713507, 1, 1, 1, 1, 1,
1.591543, 1.081388, -0.1765265, 1, 1, 1, 1, 1,
1.592373, 0.8114641, 2.67047, 1, 1, 1, 1, 1,
1.59393, -1.529909, 3.466287, 1, 1, 1, 1, 1,
1.598178, 0.3795159, 1.348998, 1, 1, 1, 1, 1,
1.600301, -0.3807334, 0.6614307, 1, 1, 1, 1, 1,
1.602822, -1.04248, 2.63157, 1, 1, 1, 1, 1,
1.605952, -0.3734324, 1.618863, 1, 1, 1, 1, 1,
1.646161, -1.198395, 1.942094, 1, 1, 1, 1, 1,
1.653619, -0.03850431, 2.345913, 1, 1, 1, 1, 1,
1.666116, 0.7346735, 1.669333, 0, 0, 1, 1, 1,
1.680824, -0.346942, 1.709632, 1, 0, 0, 1, 1,
1.691344, -0.03638884, 1.556352, 1, 0, 0, 1, 1,
1.693666, -1.70618, 4.25743, 1, 0, 0, 1, 1,
1.73537, 0.217166, 2.331223, 1, 0, 0, 1, 1,
1.748123, 0.6340066, 0.4923121, 1, 0, 0, 1, 1,
1.755052, 2.544347, 1.665583, 0, 0, 0, 1, 1,
1.758731, -0.335706, 2.577187, 0, 0, 0, 1, 1,
1.764116, 0.1564236, 2.447861, 0, 0, 0, 1, 1,
1.764884, -2.307489, 2.02809, 0, 0, 0, 1, 1,
1.774059, -0.1394743, 0.6449186, 0, 0, 0, 1, 1,
1.798095, 0.3829478, 0.6285201, 0, 0, 0, 1, 1,
1.817984, 1.46671, 1.800309, 0, 0, 0, 1, 1,
1.824976, 0.7231647, 0.3958949, 1, 1, 1, 1, 1,
1.843391, 0.8650701, 3.685091, 1, 1, 1, 1, 1,
1.845784, -0.9528418, 2.716209, 1, 1, 1, 1, 1,
1.865099, 0.9655062, 1.943748, 1, 1, 1, 1, 1,
1.869265, -0.992768, 0.1035121, 1, 1, 1, 1, 1,
1.873525, 0.7170635, -1.07463, 1, 1, 1, 1, 1,
1.884309, -1.175248, 1.431517, 1, 1, 1, 1, 1,
1.885283, 1.863517, 1.748565, 1, 1, 1, 1, 1,
1.890505, -0.6533822, 2.322371, 1, 1, 1, 1, 1,
1.89095, 0.6379917, 1.177978, 1, 1, 1, 1, 1,
1.912039, -0.1942775, 0.8918977, 1, 1, 1, 1, 1,
1.920579, 0.2814499, 1.982976, 1, 1, 1, 1, 1,
1.924473, -1.137547, 1.706439, 1, 1, 1, 1, 1,
1.925749, -0.7030824, 2.167834, 1, 1, 1, 1, 1,
1.927898, -0.9462344, 2.894017, 1, 1, 1, 1, 1,
1.928331, -0.1690161, 1.636956, 0, 0, 1, 1, 1,
1.939037, 0.4921743, 0.8936127, 1, 0, 0, 1, 1,
1.95008, -1.542346, 3.707269, 1, 0, 0, 1, 1,
1.992957, 1.885421, 0.6787184, 1, 0, 0, 1, 1,
2.039807, 1.16787, 1.395428, 1, 0, 0, 1, 1,
2.109829, 0.7165288, 1.601102, 1, 0, 0, 1, 1,
2.118046, 0.6056468, 2.515208, 0, 0, 0, 1, 1,
2.134887, 1.552122, 2.637213, 0, 0, 0, 1, 1,
2.211361, -0.01942794, 2.559655, 0, 0, 0, 1, 1,
2.239286, -0.1739219, 1.4836, 0, 0, 0, 1, 1,
2.246894, 1.388682, 1.459015, 0, 0, 0, 1, 1,
2.387587, 1.997223, 1.757917, 0, 0, 0, 1, 1,
2.422849, 0.7815846, 0.1889858, 0, 0, 0, 1, 1,
2.487911, 0.8282942, 0.6401525, 1, 1, 1, 1, 1,
2.504516, 1.087978, 0.06058463, 1, 1, 1, 1, 1,
2.64228, -1.046626, 2.587375, 1, 1, 1, 1, 1,
2.74993, -0.4170032, 1.81264, 1, 1, 1, 1, 1,
2.898021, 0.4998975, 2.744141, 1, 1, 1, 1, 1,
3.030255, 1.527391, 3.285756, 1, 1, 1, 1, 1,
3.841482, 0.1396745, 0.05378824, 1, 1, 1, 1, 1
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
var radius = 9.485472;
var distance = 33.31731;
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
mvMatrix.translate( -0.4454316, -0.1314039, 0.0753653 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.31731);
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