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
-3.282407, -1.325058, -1.430378, 1, 0, 0, 1,
-3.224698, -0.4168483, -0.684539, 1, 0.007843138, 0, 1,
-3.041038, 0.2124286, -1.710188, 1, 0.01176471, 0, 1,
-2.695196, -1.896298, -1.111343, 1, 0.01960784, 0, 1,
-2.68545, -1.686523, -3.841193, 1, 0.02352941, 0, 1,
-2.561837, 1.059268, -2.942477, 1, 0.03137255, 0, 1,
-2.557882, 0.4954207, -0.4267507, 1, 0.03529412, 0, 1,
-2.481947, 0.5543393, -2.104344, 1, 0.04313726, 0, 1,
-2.437473, 0.4590524, 0.2555892, 1, 0.04705882, 0, 1,
-2.42805, -0.260722, -2.135868, 1, 0.05490196, 0, 1,
-2.314871, 0.1087929, -1.024817, 1, 0.05882353, 0, 1,
-2.308056, -1.6148, -2.636805, 1, 0.06666667, 0, 1,
-2.262339, 0.4922545, -1.41327, 1, 0.07058824, 0, 1,
-2.259741, -0.7235376, -0.8339416, 1, 0.07843138, 0, 1,
-2.209477, 0.9814189, -1.139399, 1, 0.08235294, 0, 1,
-2.194021, -0.5422691, -2.168235, 1, 0.09019608, 0, 1,
-2.183221, -0.8838085, -3.20002, 1, 0.09411765, 0, 1,
-2.131548, 0.1044044, -3.353841, 1, 0.1019608, 0, 1,
-2.097445, 0.2491766, -1.792859, 1, 0.1098039, 0, 1,
-2.092976, -0.612045, -0.1045521, 1, 0.1137255, 0, 1,
-2.079214, 2.303361, 0.9040434, 1, 0.1215686, 0, 1,
-2.07759, -0.3908226, -2.560378, 1, 0.1254902, 0, 1,
-2.028378, 0.2144357, -2.42702, 1, 0.1333333, 0, 1,
-2.027687, 1.448171, -1.506345, 1, 0.1372549, 0, 1,
-2.012103, -1.032189, -4.143014, 1, 0.145098, 0, 1,
-1.990509, 0.02211265, -0.6034964, 1, 0.1490196, 0, 1,
-1.984833, 0.1425025, -1.318541, 1, 0.1568628, 0, 1,
-1.960688, 0.5327682, -3.039752, 1, 0.1607843, 0, 1,
-1.889517, -2.211638, -0.6943592, 1, 0.1686275, 0, 1,
-1.85817, -1.531516, -1.307692, 1, 0.172549, 0, 1,
-1.847756, 0.3429495, -2.259081, 1, 0.1803922, 0, 1,
-1.835274, 1.085817, 0.01777873, 1, 0.1843137, 0, 1,
-1.820296, 0.5502841, -1.227937, 1, 0.1921569, 0, 1,
-1.806915, 0.26833, -0.9174008, 1, 0.1960784, 0, 1,
-1.800799, 2.296379, -0.5525006, 1, 0.2039216, 0, 1,
-1.795091, 0.5372114, -1.559018, 1, 0.2117647, 0, 1,
-1.786193, -0.01471302, -2.572579, 1, 0.2156863, 0, 1,
-1.75016, 0.2677879, -2.475063, 1, 0.2235294, 0, 1,
-1.747571, -0.1367065, -1.456351, 1, 0.227451, 0, 1,
-1.744365, 0.5739901, 0.04125116, 1, 0.2352941, 0, 1,
-1.71661, 0.595513, -1.178213, 1, 0.2392157, 0, 1,
-1.71562, 0.3405823, -2.510141, 1, 0.2470588, 0, 1,
-1.707416, 0.1610722, -0.8540745, 1, 0.2509804, 0, 1,
-1.692188, -0.1992418, -0.453471, 1, 0.2588235, 0, 1,
-1.691923, -0.3403072, -1.380355, 1, 0.2627451, 0, 1,
-1.646945, 1.461586, -0.2761081, 1, 0.2705882, 0, 1,
-1.641106, 0.1283718, -0.9225394, 1, 0.2745098, 0, 1,
-1.639245, 0.9183936, -0.24293, 1, 0.282353, 0, 1,
-1.632701, 1.361141, -1.737349, 1, 0.2862745, 0, 1,
-1.618557, 0.3225442, -0.8212789, 1, 0.2941177, 0, 1,
-1.614079, -0.3246239, -1.22403, 1, 0.3019608, 0, 1,
-1.603413, 0.6430923, -0.670299, 1, 0.3058824, 0, 1,
-1.603165, -1.488417, -1.94839, 1, 0.3137255, 0, 1,
-1.60251, 0.604646, -2.18106, 1, 0.3176471, 0, 1,
-1.601625, -1.416504, -2.054901, 1, 0.3254902, 0, 1,
-1.581726, -0.5491847, -0.5922791, 1, 0.3294118, 0, 1,
-1.569829, -1.124049, -4.222175, 1, 0.3372549, 0, 1,
-1.56447, -2.194512, -1.591046, 1, 0.3411765, 0, 1,
-1.561929, -0.7383727, -1.534238, 1, 0.3490196, 0, 1,
-1.547332, -1.295917, -3.092457, 1, 0.3529412, 0, 1,
-1.522582, -1.303703, -2.580727, 1, 0.3607843, 0, 1,
-1.515352, -1.13808, -1.75911, 1, 0.3647059, 0, 1,
-1.49725, 0.5354738, -2.234975, 1, 0.372549, 0, 1,
-1.493276, -0.09976845, -0.6398504, 1, 0.3764706, 0, 1,
-1.491894, 1.596092, -0.7425351, 1, 0.3843137, 0, 1,
-1.482866, 1.089246, -1.771695, 1, 0.3882353, 0, 1,
-1.452883, 2.282623, -0.6637968, 1, 0.3960784, 0, 1,
-1.4453, 0.2291316, -1.167697, 1, 0.4039216, 0, 1,
-1.43671, 0.07692603, -1.759522, 1, 0.4078431, 0, 1,
-1.432782, -0.4893205, -1.724838, 1, 0.4156863, 0, 1,
-1.429673, 0.5668681, -0.7297654, 1, 0.4196078, 0, 1,
-1.427857, -0.4501998, -2.391147, 1, 0.427451, 0, 1,
-1.4199, 0.6904588, -2.686224, 1, 0.4313726, 0, 1,
-1.41759, 0.6975724, -3.144575, 1, 0.4392157, 0, 1,
-1.417151, -0.4061255, -2.451176, 1, 0.4431373, 0, 1,
-1.40658, 0.9272571, -0.8333754, 1, 0.4509804, 0, 1,
-1.40255, 0.2653164, -3.181683, 1, 0.454902, 0, 1,
-1.38997, -1.076357, -2.925052, 1, 0.4627451, 0, 1,
-1.378658, 1.645815, -1.432582, 1, 0.4666667, 0, 1,
-1.348632, 2.912668, 0.1188661, 1, 0.4745098, 0, 1,
-1.348361, -1.194155, -1.899436, 1, 0.4784314, 0, 1,
-1.341577, -0.1281573, -1.96481, 1, 0.4862745, 0, 1,
-1.333585, 0.261689, -0.4617774, 1, 0.4901961, 0, 1,
-1.323734, -1.396092, -1.920199, 1, 0.4980392, 0, 1,
-1.32049, 1.068839, 0.005719794, 1, 0.5058824, 0, 1,
-1.318487, 1.447266, -1.509423, 1, 0.509804, 0, 1,
-1.316622, 1.579734, -0.8871278, 1, 0.5176471, 0, 1,
-1.306699, 0.2612815, -2.438711, 1, 0.5215687, 0, 1,
-1.306207, 0.09731424, -0.9247565, 1, 0.5294118, 0, 1,
-1.30335, 2.061342, -0.7187619, 1, 0.5333334, 0, 1,
-1.301163, 0.3023823, -1.732596, 1, 0.5411765, 0, 1,
-1.291673, 1.590538, -1.632443, 1, 0.5450981, 0, 1,
-1.281951, 1.22351, -0.8448357, 1, 0.5529412, 0, 1,
-1.269125, -0.07859682, -1.286999, 1, 0.5568628, 0, 1,
-1.264786, 0.6412281, -2.318366, 1, 0.5647059, 0, 1,
-1.263085, 0.1402528, -2.410436, 1, 0.5686275, 0, 1,
-1.262724, 0.7352126, -0.3776079, 1, 0.5764706, 0, 1,
-1.261211, -0.8480271, -2.966594, 1, 0.5803922, 0, 1,
-1.259409, 0.6943213, -1.516065, 1, 0.5882353, 0, 1,
-1.258577, 2.363063, -0.1617917, 1, 0.5921569, 0, 1,
-1.253959, -0.7257757, -3.435066, 1, 0.6, 0, 1,
-1.243398, 0.4975471, -0.1283731, 1, 0.6078432, 0, 1,
-1.226718, 1.003881, -2.466792, 1, 0.6117647, 0, 1,
-1.225976, -0.008597343, -1.621426, 1, 0.6196079, 0, 1,
-1.219765, -1.02448, -3.419159, 1, 0.6235294, 0, 1,
-1.210625, 1.267783, -0.3827156, 1, 0.6313726, 0, 1,
-1.192377, -0.7466876, -2.489123, 1, 0.6352941, 0, 1,
-1.187878, -0.6823796, -2.118382, 1, 0.6431373, 0, 1,
-1.181144, 1.364847, -0.4734669, 1, 0.6470588, 0, 1,
-1.165648, -0.06837989, -2.597458, 1, 0.654902, 0, 1,
-1.153248, -0.5952711, 0.2110789, 1, 0.6588235, 0, 1,
-1.151509, 0.03305518, -2.063256, 1, 0.6666667, 0, 1,
-1.129733, -1.627572, -2.551868, 1, 0.6705883, 0, 1,
-1.123254, -0.3870291, -0.7571446, 1, 0.6784314, 0, 1,
-1.121136, 0.1108945, -1.291152, 1, 0.682353, 0, 1,
-1.117625, -1.045038, -2.589264, 1, 0.6901961, 0, 1,
-1.109837, -1.278458, -1.870761, 1, 0.6941177, 0, 1,
-1.106028, 0.0265595, -0.07248463, 1, 0.7019608, 0, 1,
-1.100187, -0.8503562, -1.69269, 1, 0.7098039, 0, 1,
-1.099374, 1.118744, -0.003135771, 1, 0.7137255, 0, 1,
-1.098446, -1.129673, -1.796086, 1, 0.7215686, 0, 1,
-1.087189, -0.3414519, -0.9141829, 1, 0.7254902, 0, 1,
-1.085675, -0.8348286, -1.344761, 1, 0.7333333, 0, 1,
-1.073092, -0.4930556, -2.594863, 1, 0.7372549, 0, 1,
-1.069516, -1.083871, -3.65661, 1, 0.7450981, 0, 1,
-1.066491, -0.4754426, -1.571448, 1, 0.7490196, 0, 1,
-1.060824, 0.2170698, -0.9718288, 1, 0.7568628, 0, 1,
-1.049468, 0.5277368, -2.45118, 1, 0.7607843, 0, 1,
-1.043087, -1.188405, -4.557515, 1, 0.7686275, 0, 1,
-1.036763, -0.1571434, 0.08280322, 1, 0.772549, 0, 1,
-1.035655, 0.6450706, -2.127641, 1, 0.7803922, 0, 1,
-1.03209, -0.6301004, -2.892874, 1, 0.7843137, 0, 1,
-1.032027, 0.2451675, -1.390518, 1, 0.7921569, 0, 1,
-1.030432, 0.2643511, -2.592235, 1, 0.7960784, 0, 1,
-1.027338, -0.08285191, -2.927723, 1, 0.8039216, 0, 1,
-1.022599, -0.9635509, -2.222157, 1, 0.8117647, 0, 1,
-1.017997, -0.6590391, -3.548733, 1, 0.8156863, 0, 1,
-1.017315, -0.09498211, -0.001811874, 1, 0.8235294, 0, 1,
-1.0086, 1.369092, -0.4855203, 1, 0.827451, 0, 1,
-1.008249, -1.172181, -2.953402, 1, 0.8352941, 0, 1,
-0.9995619, 1.286688, -0.1840711, 1, 0.8392157, 0, 1,
-0.9974805, 1.085298, 0.131114, 1, 0.8470588, 0, 1,
-0.9956665, -0.4871009, -1.37856, 1, 0.8509804, 0, 1,
-0.993281, -1.18192, -3.185459, 1, 0.8588235, 0, 1,
-0.9858853, -1.170916, -1.278557, 1, 0.8627451, 0, 1,
-0.9842008, -0.8463171, -1.450988, 1, 0.8705882, 0, 1,
-0.9785375, 1.071982, -3.030566, 1, 0.8745098, 0, 1,
-0.9767113, 0.28446, -0.05932002, 1, 0.8823529, 0, 1,
-0.9759701, -1.674087, -4.827656, 1, 0.8862745, 0, 1,
-0.9729733, -0.8730028, -0.8739304, 1, 0.8941177, 0, 1,
-0.9657704, -0.8995796, -3.304528, 1, 0.8980392, 0, 1,
-0.9651199, 0.04845149, -0.2802213, 1, 0.9058824, 0, 1,
-0.9486281, 0.3950555, -1.710997, 1, 0.9137255, 0, 1,
-0.9454742, -0.2870789, -3.511396, 1, 0.9176471, 0, 1,
-0.9449994, 0.1525823, -2.339278, 1, 0.9254902, 0, 1,
-0.9415799, -1.551058, 0.01141991, 1, 0.9294118, 0, 1,
-0.9403467, 0.7179289, -0.8652492, 1, 0.9372549, 0, 1,
-0.9371921, 1.434574, -1.450623, 1, 0.9411765, 0, 1,
-0.9347263, -0.0164642, -2.128769, 1, 0.9490196, 0, 1,
-0.9345275, -1.041975, -3.473761, 1, 0.9529412, 0, 1,
-0.9324127, 0.6422822, -0.8730659, 1, 0.9607843, 0, 1,
-0.9308499, -0.1137967, -0.04702567, 1, 0.9647059, 0, 1,
-0.9281985, 1.099275, -0.3928143, 1, 0.972549, 0, 1,
-0.9266728, 0.2344074, -1.474261, 1, 0.9764706, 0, 1,
-0.923687, 1.806882, -2.039762, 1, 0.9843137, 0, 1,
-0.922321, -1.87605, -1.668197, 1, 0.9882353, 0, 1,
-0.9191105, 0.1765212, -2.115726, 1, 0.9960784, 0, 1,
-0.9113101, -1.608207, -1.711383, 0.9960784, 1, 0, 1,
-0.9063959, 0.03112898, -2.401748, 0.9921569, 1, 0, 1,
-0.9059131, -0.6968929, -4.566218, 0.9843137, 1, 0, 1,
-0.9047405, -0.0479995, -1.325942, 0.9803922, 1, 0, 1,
-0.9040989, 1.483388, -0.7627787, 0.972549, 1, 0, 1,
-0.9036195, 0.4402854, -1.99244, 0.9686275, 1, 0, 1,
-0.8996766, 2.873387, -0.7725155, 0.9607843, 1, 0, 1,
-0.8971279, 1.078357, 0.2971567, 0.9568627, 1, 0, 1,
-0.8924421, -0.3142882, -0.3313743, 0.9490196, 1, 0, 1,
-0.8892267, -0.6391265, -2.837827, 0.945098, 1, 0, 1,
-0.8880765, -0.5298053, -2.020799, 0.9372549, 1, 0, 1,
-0.8874607, -0.829926, -1.628114, 0.9333333, 1, 0, 1,
-0.8874536, -0.3144141, -1.748806, 0.9254902, 1, 0, 1,
-0.8853866, 2.755401, -0.09165109, 0.9215686, 1, 0, 1,
-0.8846452, 0.2003152, -3.347046, 0.9137255, 1, 0, 1,
-0.8833863, 1.853064, -1.860027, 0.9098039, 1, 0, 1,
-0.8814494, 0.5130005, -0.6293326, 0.9019608, 1, 0, 1,
-0.8798023, -0.953688, -2.438517, 0.8941177, 1, 0, 1,
-0.8763885, -0.6799127, -2.987083, 0.8901961, 1, 0, 1,
-0.8757397, -1.119263, -2.195452, 0.8823529, 1, 0, 1,
-0.8739672, -0.2119114, -2.46119, 0.8784314, 1, 0, 1,
-0.8682556, 0.8371258, 0.04371284, 0.8705882, 1, 0, 1,
-0.8603577, 0.0699454, -1.631534, 0.8666667, 1, 0, 1,
-0.8594334, 1.168851, -1.237996, 0.8588235, 1, 0, 1,
-0.8540646, -1.47569, -2.436705, 0.854902, 1, 0, 1,
-0.8501348, -0.3296493, -1.91196, 0.8470588, 1, 0, 1,
-0.8485017, -0.7649956, -3.332612, 0.8431373, 1, 0, 1,
-0.8407786, 0.3955603, -0.8282569, 0.8352941, 1, 0, 1,
-0.8385912, 1.712887, 0.4166272, 0.8313726, 1, 0, 1,
-0.8345607, 0.03024197, -2.801661, 0.8235294, 1, 0, 1,
-0.8339056, -0.1126343, -1.49241, 0.8196079, 1, 0, 1,
-0.8312458, 0.1235515, -1.458891, 0.8117647, 1, 0, 1,
-0.8296649, 0.9532985, -1.112447, 0.8078431, 1, 0, 1,
-0.8230726, 0.1623891, -0.4010012, 0.8, 1, 0, 1,
-0.8201275, -1.045843, -1.143389, 0.7921569, 1, 0, 1,
-0.8186601, -1.024049, -3.420171, 0.7882353, 1, 0, 1,
-0.8146709, -0.2043407, -1.871709, 0.7803922, 1, 0, 1,
-0.8001246, -1.496838, -0.1395385, 0.7764706, 1, 0, 1,
-0.7990903, -0.8832921, -2.88602, 0.7686275, 1, 0, 1,
-0.7965108, 1.314553, -0.4972112, 0.7647059, 1, 0, 1,
-0.795716, 2.391805, -0.7710361, 0.7568628, 1, 0, 1,
-0.7942196, 0.8820387, -0.2603712, 0.7529412, 1, 0, 1,
-0.7930975, 0.2236803, -0.89962, 0.7450981, 1, 0, 1,
-0.7875205, 0.8399177, 0.7677245, 0.7411765, 1, 0, 1,
-0.783529, -0.7363451, -2.611969, 0.7333333, 1, 0, 1,
-0.7808495, 0.4337151, -0.8424115, 0.7294118, 1, 0, 1,
-0.7787481, 0.4933852, -1.810344, 0.7215686, 1, 0, 1,
-0.7737903, 0.05048113, -1.298462, 0.7176471, 1, 0, 1,
-0.7710276, 1.233755, 1.567677, 0.7098039, 1, 0, 1,
-0.7700535, -1.026363, -2.85515, 0.7058824, 1, 0, 1,
-0.7699468, 0.1863658, -1.466267, 0.6980392, 1, 0, 1,
-0.7692586, -0.7977421, -4.113863, 0.6901961, 1, 0, 1,
-0.7659373, 0.01015623, -0.1155285, 0.6862745, 1, 0, 1,
-0.7614937, 1.195857, -0.3469382, 0.6784314, 1, 0, 1,
-0.7612345, -0.6321017, -3.333317, 0.6745098, 1, 0, 1,
-0.760033, 1.274544, -0.7549541, 0.6666667, 1, 0, 1,
-0.7544359, -1.49853, -4.570918, 0.6627451, 1, 0, 1,
-0.7391402, -1.531077, -2.884439, 0.654902, 1, 0, 1,
-0.7220891, 0.1515048, -0.9152863, 0.6509804, 1, 0, 1,
-0.7213632, 0.05307494, -0.804017, 0.6431373, 1, 0, 1,
-0.7198694, -0.0736836, -2.290316, 0.6392157, 1, 0, 1,
-0.7182124, -0.6116795, -2.967678, 0.6313726, 1, 0, 1,
-0.7133881, -0.9539529, -1.678413, 0.627451, 1, 0, 1,
-0.7056352, 0.08281361, -0.7061965, 0.6196079, 1, 0, 1,
-0.7053617, -0.57328, -0.9064397, 0.6156863, 1, 0, 1,
-0.7012154, 1.548818, -0.3425986, 0.6078432, 1, 0, 1,
-0.6947292, -0.6809424, -3.091225, 0.6039216, 1, 0, 1,
-0.6946935, 0.2398399, -0.5056115, 0.5960785, 1, 0, 1,
-0.6940064, -0.8846062, -1.925857, 0.5882353, 1, 0, 1,
-0.6931731, -0.5704438, -1.292755, 0.5843138, 1, 0, 1,
-0.6868822, 0.5495723, -0.9730461, 0.5764706, 1, 0, 1,
-0.6859068, 0.3859423, 0.008728671, 0.572549, 1, 0, 1,
-0.6804977, -0.6663073, -2.125165, 0.5647059, 1, 0, 1,
-0.6800093, -0.338729, -3.643574, 0.5607843, 1, 0, 1,
-0.6744371, 0.5671954, 0.2589214, 0.5529412, 1, 0, 1,
-0.6739835, 1.032866, 1.218821, 0.5490196, 1, 0, 1,
-0.6676162, -0.1320325, -1.093357, 0.5411765, 1, 0, 1,
-0.6673797, -0.4553917, -2.155776, 0.5372549, 1, 0, 1,
-0.6671749, -0.9235945, -3.552315, 0.5294118, 1, 0, 1,
-0.6630301, 0.8865173, -1.628246, 0.5254902, 1, 0, 1,
-0.6627685, -1.310577, -1.846202, 0.5176471, 1, 0, 1,
-0.6614695, 1.445059, -0.2567264, 0.5137255, 1, 0, 1,
-0.6584464, -0.02405966, -1.628721, 0.5058824, 1, 0, 1,
-0.6574628, -0.5504496, -2.688286, 0.5019608, 1, 0, 1,
-0.6574374, 0.2520827, -2.502417, 0.4941176, 1, 0, 1,
-0.6562147, -0.2737486, -2.153723, 0.4862745, 1, 0, 1,
-0.6524546, 0.7529455, -1.023902, 0.4823529, 1, 0, 1,
-0.6512336, -0.5460558, -2.826416, 0.4745098, 1, 0, 1,
-0.6494262, -0.6970903, -2.612376, 0.4705882, 1, 0, 1,
-0.6420321, -1.431627, -2.780911, 0.4627451, 1, 0, 1,
-0.6387708, 1.423797, -0.4519605, 0.4588235, 1, 0, 1,
-0.6318635, 1.05775, -1.075911, 0.4509804, 1, 0, 1,
-0.6318262, 1.483343, 0.2426949, 0.4470588, 1, 0, 1,
-0.631184, -0.6489567, -1.692982, 0.4392157, 1, 0, 1,
-0.6303678, 0.9684891, -0.32055, 0.4352941, 1, 0, 1,
-0.6299284, -0.3230958, -0.5940523, 0.427451, 1, 0, 1,
-0.6272444, -0.913707, -3.705698, 0.4235294, 1, 0, 1,
-0.6250638, -0.8229321, -2.556292, 0.4156863, 1, 0, 1,
-0.6037169, 0.567939, -1.256681, 0.4117647, 1, 0, 1,
-0.603555, -0.6907027, -3.303804, 0.4039216, 1, 0, 1,
-0.5996593, -0.7267708, -2.688016, 0.3960784, 1, 0, 1,
-0.5987561, 0.9223241, -0.9580144, 0.3921569, 1, 0, 1,
-0.5974195, -1.682647, -1.731438, 0.3843137, 1, 0, 1,
-0.5928885, -0.8625812, -1.504183, 0.3803922, 1, 0, 1,
-0.5899784, -0.05875479, -1.874596, 0.372549, 1, 0, 1,
-0.583159, 0.3865082, -2.090953, 0.3686275, 1, 0, 1,
-0.5800216, 0.5750608, 0.184838, 0.3607843, 1, 0, 1,
-0.5775285, 0.190274, 0.132003, 0.3568628, 1, 0, 1,
-0.5721934, 0.4069749, -1.246191, 0.3490196, 1, 0, 1,
-0.5712061, 1.119947, 0.2720168, 0.345098, 1, 0, 1,
-0.5705962, 0.2710837, -2.808213, 0.3372549, 1, 0, 1,
-0.5691553, -0.1991629, -1.960517, 0.3333333, 1, 0, 1,
-0.5669582, -0.136014, -1.687709, 0.3254902, 1, 0, 1,
-0.5651857, 0.1186079, -1.020306, 0.3215686, 1, 0, 1,
-0.5604672, 1.084048, -2.043867, 0.3137255, 1, 0, 1,
-0.5596877, -0.2564685, -2.029035, 0.3098039, 1, 0, 1,
-0.5561923, 0.2727459, -1.462575, 0.3019608, 1, 0, 1,
-0.5487747, 1.090696, -0.09163105, 0.2941177, 1, 0, 1,
-0.5424539, 0.5973552, -1.515703, 0.2901961, 1, 0, 1,
-0.5413439, 0.3722886, -1.533804, 0.282353, 1, 0, 1,
-0.5316806, -1.294089, -4.588729, 0.2784314, 1, 0, 1,
-0.5314213, -0.1912868, -1.336654, 0.2705882, 1, 0, 1,
-0.528506, -0.4319337, -2.084543, 0.2666667, 1, 0, 1,
-0.5267602, 0.5180026, -0.6006034, 0.2588235, 1, 0, 1,
-0.5253193, 1.139735, -1.343616, 0.254902, 1, 0, 1,
-0.5221951, -1.042399, -2.662595, 0.2470588, 1, 0, 1,
-0.5188444, -1.047869, -2.982007, 0.2431373, 1, 0, 1,
-0.5187843, 0.3511321, -0.07932182, 0.2352941, 1, 0, 1,
-0.5186186, -1.408187, -1.826772, 0.2313726, 1, 0, 1,
-0.5178704, -1.217391, -0.9248179, 0.2235294, 1, 0, 1,
-0.5141979, 0.989316, -0.5487541, 0.2196078, 1, 0, 1,
-0.5136665, -1.932835, -2.633606, 0.2117647, 1, 0, 1,
-0.5130036, 0.3232403, 0.4474853, 0.2078431, 1, 0, 1,
-0.5037702, -0.3616522, -2.514486, 0.2, 1, 0, 1,
-0.5003832, 2.022869, 1.030126, 0.1921569, 1, 0, 1,
-0.4927013, 0.6801325, -0.8597229, 0.1882353, 1, 0, 1,
-0.4848479, 0.3520869, -1.991775, 0.1803922, 1, 0, 1,
-0.4827287, -0.3599702, -1.106982, 0.1764706, 1, 0, 1,
-0.4773594, -0.1064877, -0.3678458, 0.1686275, 1, 0, 1,
-0.4763239, 0.2135926, -0.860161, 0.1647059, 1, 0, 1,
-0.475468, -0.3906032, -2.10113, 0.1568628, 1, 0, 1,
-0.4748887, 0.1915263, -1.495673, 0.1529412, 1, 0, 1,
-0.4748616, -0.07078476, -1.135753, 0.145098, 1, 0, 1,
-0.4708033, -0.5377928, -3.67616, 0.1411765, 1, 0, 1,
-0.4681302, -0.6911282, -3.62798, 0.1333333, 1, 0, 1,
-0.4642073, 0.7358893, 1.055262, 0.1294118, 1, 0, 1,
-0.4604128, -0.5122043, -2.874476, 0.1215686, 1, 0, 1,
-0.4535794, 0.2616672, 0.8566293, 0.1176471, 1, 0, 1,
-0.4448237, 0.5122775, -0.7635763, 0.1098039, 1, 0, 1,
-0.4421781, -0.6412302, -3.819532, 0.1058824, 1, 0, 1,
-0.4412694, 0.7625954, 0.1240496, 0.09803922, 1, 0, 1,
-0.4388999, -0.7487703, -2.439108, 0.09019608, 1, 0, 1,
-0.4361584, 0.4257726, -0.7855373, 0.08627451, 1, 0, 1,
-0.4349222, 1.58714, 0.5759915, 0.07843138, 1, 0, 1,
-0.4324509, 0.6890129, -0.5764405, 0.07450981, 1, 0, 1,
-0.4288543, -0.09346231, -2.585293, 0.06666667, 1, 0, 1,
-0.4272479, -1.648247, -2.84395, 0.0627451, 1, 0, 1,
-0.4259467, 0.4517803, -0.4636689, 0.05490196, 1, 0, 1,
-0.4209599, -0.955463, -1.117564, 0.05098039, 1, 0, 1,
-0.4204674, -0.2210055, -1.018031, 0.04313726, 1, 0, 1,
-0.4176188, 0.6632625, -1.897439, 0.03921569, 1, 0, 1,
-0.417047, -0.5564466, -3.19265, 0.03137255, 1, 0, 1,
-0.4137039, 0.4444628, 0.1659062, 0.02745098, 1, 0, 1,
-0.4116012, -0.7437345, -1.183017, 0.01960784, 1, 0, 1,
-0.4065277, 2.003256, -0.4957043, 0.01568628, 1, 0, 1,
-0.405722, 0.7360712, 0.5039331, 0.007843138, 1, 0, 1,
-0.4029703, 0.1362921, 1.417236, 0.003921569, 1, 0, 1,
-0.4022223, 1.04598, -1.031083, 0, 1, 0.003921569, 1,
-0.4001132, 1.107149, 0.6204162, 0, 1, 0.01176471, 1,
-0.3994647, 1.335593, -0.4483419, 0, 1, 0.01568628, 1,
-0.3968727, -0.8651314, -1.476993, 0, 1, 0.02352941, 1,
-0.3963586, 0.5598376, -0.2937163, 0, 1, 0.02745098, 1,
-0.3927224, -0.3374681, -2.135327, 0, 1, 0.03529412, 1,
-0.3901255, 0.04270177, -2.758772, 0, 1, 0.03921569, 1,
-0.3871263, -0.08869345, -2.316035, 0, 1, 0.04705882, 1,
-0.3855593, 0.9589112, 0.1144307, 0, 1, 0.05098039, 1,
-0.3819409, 1.020777, -1.107296, 0, 1, 0.05882353, 1,
-0.3816165, 0.8098429, -1.61668, 0, 1, 0.0627451, 1,
-0.3792968, 1.344195, -1.814706, 0, 1, 0.07058824, 1,
-0.3765898, 1.084927, -0.8648531, 0, 1, 0.07450981, 1,
-0.3750133, -0.5679291, -4.3543, 0, 1, 0.08235294, 1,
-0.3724993, 1.027257, -0.5113862, 0, 1, 0.08627451, 1,
-0.3719711, -1.59033, -3.498585, 0, 1, 0.09411765, 1,
-0.3689879, -0.3938897, -2.529776, 0, 1, 0.1019608, 1,
-0.3632899, 1.219789, 0.9796572, 0, 1, 0.1058824, 1,
-0.3631046, -1.314738, -3.802202, 0, 1, 0.1137255, 1,
-0.3601999, 0.7657577, -0.353024, 0, 1, 0.1176471, 1,
-0.359809, -1.559317, -3.004454, 0, 1, 0.1254902, 1,
-0.3539391, 0.975825, -0.159279, 0, 1, 0.1294118, 1,
-0.3500009, -1.492232, -3.889982, 0, 1, 0.1372549, 1,
-0.3492678, -1.114556, -2.150496, 0, 1, 0.1411765, 1,
-0.3446681, 0.9089179, -1.383045, 0, 1, 0.1490196, 1,
-0.3378911, 1.342236, -0.008999336, 0, 1, 0.1529412, 1,
-0.3281221, 0.9729683, -1.094682, 0, 1, 0.1607843, 1,
-0.3265886, -0.1481794, -1.101049, 0, 1, 0.1647059, 1,
-0.3239277, -0.1412964, -1.413285, 0, 1, 0.172549, 1,
-0.3207352, -0.516089, -2.470273, 0, 1, 0.1764706, 1,
-0.3196358, 0.1087109, -0.3402658, 0, 1, 0.1843137, 1,
-0.3193243, -0.580373, -3.886691, 0, 1, 0.1882353, 1,
-0.3177185, 1.538, -0.2470649, 0, 1, 0.1960784, 1,
-0.309873, -0.108913, 0.5654039, 0, 1, 0.2039216, 1,
-0.307702, -0.001909212, -1.013913, 0, 1, 0.2078431, 1,
-0.3075882, -1.225025, -2.004115, 0, 1, 0.2156863, 1,
-0.2973789, 0.0316814, -2.913341, 0, 1, 0.2196078, 1,
-0.2950248, -0.9711398, -2.812054, 0, 1, 0.227451, 1,
-0.2860574, -0.7810419, -2.784136, 0, 1, 0.2313726, 1,
-0.2849023, -0.06024081, -4.706963, 0, 1, 0.2392157, 1,
-0.2818674, -0.6883991, -2.225618, 0, 1, 0.2431373, 1,
-0.2762628, 0.1199899, -1.409568, 0, 1, 0.2509804, 1,
-0.274496, 1.380658, -0.8551463, 0, 1, 0.254902, 1,
-0.2702423, -0.02808053, -0.03992387, 0, 1, 0.2627451, 1,
-0.2684537, -1.505617, -1.719948, 0, 1, 0.2666667, 1,
-0.2664709, 1.275806, 0.2983723, 0, 1, 0.2745098, 1,
-0.2653277, 1.645073, -0.785832, 0, 1, 0.2784314, 1,
-0.2617324, 0.2870081, -0.9133881, 0, 1, 0.2862745, 1,
-0.2607788, -0.9217407, -3.057125, 0, 1, 0.2901961, 1,
-0.2578313, 0.6913454, 0.1279916, 0, 1, 0.2980392, 1,
-0.255391, 0.3003464, 0.2584129, 0, 1, 0.3058824, 1,
-0.254939, 0.4612619, -0.6500343, 0, 1, 0.3098039, 1,
-0.2504832, -0.9878296, -2.327959, 0, 1, 0.3176471, 1,
-0.2475039, -0.4678423, -4.342995, 0, 1, 0.3215686, 1,
-0.2403717, -0.1095895, -3.420278, 0, 1, 0.3294118, 1,
-0.2337849, -0.229321, -2.449037, 0, 1, 0.3333333, 1,
-0.2303489, -1.075069, -2.036947, 0, 1, 0.3411765, 1,
-0.2302825, -0.1599668, -2.123905, 0, 1, 0.345098, 1,
-0.2293747, -1.542184, -2.194423, 0, 1, 0.3529412, 1,
-0.2284204, -0.1151731, -2.083612, 0, 1, 0.3568628, 1,
-0.2277077, 0.4773879, 0.4887181, 0, 1, 0.3647059, 1,
-0.2217949, -1.626412, -3.964738, 0, 1, 0.3686275, 1,
-0.2172171, -0.4723638, -1.965108, 0, 1, 0.3764706, 1,
-0.2164117, 0.3437616, 0.2652173, 0, 1, 0.3803922, 1,
-0.2133419, -1.247603, -5.18574, 0, 1, 0.3882353, 1,
-0.2131669, -0.6735876, -2.210619, 0, 1, 0.3921569, 1,
-0.210787, -0.1824527, -3.318505, 0, 1, 0.4, 1,
-0.210076, -0.784879, -2.986519, 0, 1, 0.4078431, 1,
-0.2052452, 0.7618592, -1.279077, 0, 1, 0.4117647, 1,
-0.2044504, 0.8053835, 0.5856472, 0, 1, 0.4196078, 1,
-0.2029504, 0.3315757, -1.472976, 0, 1, 0.4235294, 1,
-0.1985231, -0.3532945, -1.456307, 0, 1, 0.4313726, 1,
-0.1981729, -1.179499, -3.213829, 0, 1, 0.4352941, 1,
-0.1978283, -1.763439, -2.805679, 0, 1, 0.4431373, 1,
-0.1958946, 0.4192453, -1.422849, 0, 1, 0.4470588, 1,
-0.1889895, -0.6054819, -2.412378, 0, 1, 0.454902, 1,
-0.1879061, 0.4108165, -0.9570925, 0, 1, 0.4588235, 1,
-0.1869858, 0.4667962, -0.7452062, 0, 1, 0.4666667, 1,
-0.1794678, 0.7751466, -1.322981, 0, 1, 0.4705882, 1,
-0.1700609, -0.6922156, -2.425988, 0, 1, 0.4784314, 1,
-0.1693294, 0.416679, 0.02239867, 0, 1, 0.4823529, 1,
-0.1682009, 1.042308, -0.3536731, 0, 1, 0.4901961, 1,
-0.1661697, -0.8897728, -2.365973, 0, 1, 0.4941176, 1,
-0.164951, -0.672637, -2.936002, 0, 1, 0.5019608, 1,
-0.1643636, -2.038908, -3.576999, 0, 1, 0.509804, 1,
-0.1632005, -0.03175801, -2.177387, 0, 1, 0.5137255, 1,
-0.1629753, 0.3848399, -0.3976744, 0, 1, 0.5215687, 1,
-0.155808, 0.8708242, 0.8902724, 0, 1, 0.5254902, 1,
-0.1542897, -2.162267, -4.128528, 0, 1, 0.5333334, 1,
-0.1518437, 0.3934016, 0.8782626, 0, 1, 0.5372549, 1,
-0.1516809, 2.528405, 0.1057457, 0, 1, 0.5450981, 1,
-0.1500127, 0.01515875, -0.6110845, 0, 1, 0.5490196, 1,
-0.1468552, -3.391779, -4.758265, 0, 1, 0.5568628, 1,
-0.1459665, 0.4335973, 1.556693, 0, 1, 0.5607843, 1,
-0.1456287, 0.7909082, -0.09627987, 0, 1, 0.5686275, 1,
-0.1455507, -0.4102209, -1.17197, 0, 1, 0.572549, 1,
-0.1393761, 0.3236228, 0.02120966, 0, 1, 0.5803922, 1,
-0.1371759, 0.7814519, 0.07122903, 0, 1, 0.5843138, 1,
-0.1331427, 0.7382086, -0.400489, 0, 1, 0.5921569, 1,
-0.1331077, -0.8751656, -1.130372, 0, 1, 0.5960785, 1,
-0.1325592, 0.8323263, -0.199212, 0, 1, 0.6039216, 1,
-0.1312893, 0.3518145, -0.6039633, 0, 1, 0.6117647, 1,
-0.1270801, -0.6264996, -1.494688, 0, 1, 0.6156863, 1,
-0.1095478, -0.2900169, -4.18328, 0, 1, 0.6235294, 1,
-0.1054324, -0.558313, -2.505149, 0, 1, 0.627451, 1,
-0.1013972, -0.8253433, -1.831541, 0, 1, 0.6352941, 1,
-0.1010658, 2.276274, -1.417587, 0, 1, 0.6392157, 1,
-0.09687984, 0.0506287, -3.050238, 0, 1, 0.6470588, 1,
-0.09046393, 0.5219089, -2.817442, 0, 1, 0.6509804, 1,
-0.0904451, 0.7914597, -0.02321866, 0, 1, 0.6588235, 1,
-0.09037776, -0.7992603, -3.384863, 0, 1, 0.6627451, 1,
-0.08673278, -1.333478, -3.49754, 0, 1, 0.6705883, 1,
-0.08630856, -0.345432, -1.650331, 0, 1, 0.6745098, 1,
-0.08082596, -0.3566413, -2.791683, 0, 1, 0.682353, 1,
-0.07863813, 0.3694264, 0.2705131, 0, 1, 0.6862745, 1,
-0.07211009, -0.5122622, -3.059524, 0, 1, 0.6941177, 1,
-0.07192347, 1.194142, -1.531446, 0, 1, 0.7019608, 1,
-0.0716864, -0.007539564, -2.615201, 0, 1, 0.7058824, 1,
-0.06986778, 0.8891069, -2.159815, 0, 1, 0.7137255, 1,
-0.06709318, -0.6755302, -1.954979, 0, 1, 0.7176471, 1,
-0.06382682, -1.811934, -2.990866, 0, 1, 0.7254902, 1,
-0.06013393, -1.101723, -2.936018, 0, 1, 0.7294118, 1,
-0.05186038, -0.3464943, -3.930944, 0, 1, 0.7372549, 1,
-0.05072737, -0.02562243, -3.800198, 0, 1, 0.7411765, 1,
-0.04886601, -0.5538515, -3.364627, 0, 1, 0.7490196, 1,
-0.04867103, 0.2092499, -0.5031974, 0, 1, 0.7529412, 1,
-0.04771003, 0.8746054, 0.2438399, 0, 1, 0.7607843, 1,
-0.0455418, 1.883694, 0.4704825, 0, 1, 0.7647059, 1,
-0.04403208, -0.4140366, -2.047815, 0, 1, 0.772549, 1,
-0.03749501, 0.9255903, -0.8180798, 0, 1, 0.7764706, 1,
-0.03592453, 0.9755935, 0.5541725, 0, 1, 0.7843137, 1,
-0.02953895, -0.5374202, -3.049629, 0, 1, 0.7882353, 1,
-0.02721945, -0.3434135, -3.571191, 0, 1, 0.7960784, 1,
-0.02697432, 0.5808036, -0.4821249, 0, 1, 0.8039216, 1,
-0.02629274, 0.3441558, -0.07777176, 0, 1, 0.8078431, 1,
-0.02518048, 0.5335439, -0.2346033, 0, 1, 0.8156863, 1,
-0.02053809, -0.0006384315, -1.938407, 0, 1, 0.8196079, 1,
-0.01846889, 2.485263, 0.8657681, 0, 1, 0.827451, 1,
-0.01576683, 0.8664139, -0.541146, 0, 1, 0.8313726, 1,
-0.01071795, 2.797908, -0.2235181, 0, 1, 0.8392157, 1,
-0.01024564, -1.481859, -4.003892, 0, 1, 0.8431373, 1,
-0.009057004, 1.351518, 0.3060496, 0, 1, 0.8509804, 1,
-0.008046592, 0.314555, -1.613276, 0, 1, 0.854902, 1,
-0.002085749, 1.455489, 0.21303, 0, 1, 0.8627451, 1,
0.005415635, -1.435072, 3.174809, 0, 1, 0.8666667, 1,
0.006153312, -0.4236374, 3.905812, 0, 1, 0.8745098, 1,
0.008032007, 1.336756, -0.9210649, 0, 1, 0.8784314, 1,
0.01152821, -0.9919739, 1.696839, 0, 1, 0.8862745, 1,
0.01628617, 1.952918, 0.2526946, 0, 1, 0.8901961, 1,
0.01694733, -0.3878477, 2.552762, 0, 1, 0.8980392, 1,
0.01915709, -0.01056399, -0.1109065, 0, 1, 0.9058824, 1,
0.02639843, -0.350018, 3.476029, 0, 1, 0.9098039, 1,
0.03552561, 1.233017, 0.1156783, 0, 1, 0.9176471, 1,
0.03556622, -1.634709, 1.204731, 0, 1, 0.9215686, 1,
0.03622435, 0.9625818, 1.012238, 0, 1, 0.9294118, 1,
0.0405016, -0.9921882, 4.053523, 0, 1, 0.9333333, 1,
0.04101991, -0.7535946, 3.870759, 0, 1, 0.9411765, 1,
0.04547241, 0.1915635, -0.9639366, 0, 1, 0.945098, 1,
0.04884343, 1.105004, -1.78608, 0, 1, 0.9529412, 1,
0.05667626, -1.481434, 3.758733, 0, 1, 0.9568627, 1,
0.05722778, 0.2393949, 0.3963257, 0, 1, 0.9647059, 1,
0.05822041, -0.4791904, 3.401934, 0, 1, 0.9686275, 1,
0.06476858, -1.127464, 3.536382, 0, 1, 0.9764706, 1,
0.06539022, 0.1172713, -0.2643026, 0, 1, 0.9803922, 1,
0.06655107, -0.8028753, 2.787524, 0, 1, 0.9882353, 1,
0.0665552, -1.152294, 3.560006, 0, 1, 0.9921569, 1,
0.06773105, 1.127471, 0.4697452, 0, 1, 1, 1,
0.06811529, -2.078952, 1.933195, 0, 0.9921569, 1, 1,
0.07093737, -0.1035411, 2.190725, 0, 0.9882353, 1, 1,
0.07155424, 0.7673216, 0.298519, 0, 0.9803922, 1, 1,
0.07316052, -0.7881148, 2.696527, 0, 0.9764706, 1, 1,
0.07542736, -0.4993866, 2.759029, 0, 0.9686275, 1, 1,
0.07589555, 1.289147, -1.622229, 0, 0.9647059, 1, 1,
0.08006153, 1.223912, 1.006099, 0, 0.9568627, 1, 1,
0.08091704, -1.813442, 3.751451, 0, 0.9529412, 1, 1,
0.0831598, 0.323046, 1.982215, 0, 0.945098, 1, 1,
0.08335688, -3.689867, 4.078993, 0, 0.9411765, 1, 1,
0.08461668, 0.4983654, 0.5813185, 0, 0.9333333, 1, 1,
0.08620106, 0.4164629, -0.2378526, 0, 0.9294118, 1, 1,
0.09160865, 1.243899, -1.025111, 0, 0.9215686, 1, 1,
0.0944322, 0.6402836, -0.242892, 0, 0.9176471, 1, 1,
0.09897617, 1.966537, -0.3275288, 0, 0.9098039, 1, 1,
0.1006413, 2.458479, 2.029359, 0, 0.9058824, 1, 1,
0.1014298, -0.1649291, 3.13073, 0, 0.8980392, 1, 1,
0.1034504, 0.8030159, -0.1356915, 0, 0.8901961, 1, 1,
0.1046948, -0.665738, 3.803662, 0, 0.8862745, 1, 1,
0.1086096, 0.1706551, -0.7727829, 0, 0.8784314, 1, 1,
0.1096773, -0.3351178, 1.880737, 0, 0.8745098, 1, 1,
0.109753, 1.681899, -0.4078047, 0, 0.8666667, 1, 1,
0.1097717, 0.02466071, 3.159997, 0, 0.8627451, 1, 1,
0.110463, -0.6789905, 2.067518, 0, 0.854902, 1, 1,
0.1171001, -1.117051, 1.881267, 0, 0.8509804, 1, 1,
0.1201179, -0.1343165, 2.254795, 0, 0.8431373, 1, 1,
0.1227614, 0.5501028, 0.7544987, 0, 0.8392157, 1, 1,
0.127285, -0.4770614, 4.496429, 0, 0.8313726, 1, 1,
0.1280086, 1.951088, -0.5823348, 0, 0.827451, 1, 1,
0.1362156, -0.0750018, 2.421393, 0, 0.8196079, 1, 1,
0.1375577, -0.7823473, 3.640523, 0, 0.8156863, 1, 1,
0.1401739, -0.02210331, 0.4997117, 0, 0.8078431, 1, 1,
0.1474852, 1.401598, -0.4240194, 0, 0.8039216, 1, 1,
0.1498533, 0.7486708, -0.07248274, 0, 0.7960784, 1, 1,
0.1504492, -0.5246199, 1.813768, 0, 0.7882353, 1, 1,
0.1517418, -1.090924, 3.641512, 0, 0.7843137, 1, 1,
0.1518195, -0.510596, 2.762536, 0, 0.7764706, 1, 1,
0.15357, -0.05602214, 2.52248, 0, 0.772549, 1, 1,
0.1594238, -0.4802031, 3.640839, 0, 0.7647059, 1, 1,
0.1630275, 0.1157783, -0.4014213, 0, 0.7607843, 1, 1,
0.1665799, -0.6035177, 3.270455, 0, 0.7529412, 1, 1,
0.1676709, -0.2523871, 2.905713, 0, 0.7490196, 1, 1,
0.1728594, 0.5660695, 0.4983889, 0, 0.7411765, 1, 1,
0.1736041, -0.006896222, 1.971673, 0, 0.7372549, 1, 1,
0.1757466, -1.449996, 1.952442, 0, 0.7294118, 1, 1,
0.178836, 2.409317, -1.095016, 0, 0.7254902, 1, 1,
0.1845897, -0.3712614, 3.48972, 0, 0.7176471, 1, 1,
0.1878014, 0.7421026, 1.013718, 0, 0.7137255, 1, 1,
0.1893578, 0.5468397, 1.348412, 0, 0.7058824, 1, 1,
0.1895166, 0.4415973, -1.412968, 0, 0.6980392, 1, 1,
0.1905798, 0.8938426, -0.8708769, 0, 0.6941177, 1, 1,
0.1920184, -0.3786621, 2.540298, 0, 0.6862745, 1, 1,
0.1925814, 0.6634113, -0.328826, 0, 0.682353, 1, 1,
0.1964611, -0.1354261, 2.511569, 0, 0.6745098, 1, 1,
0.1971495, 0.1456075, 2.195102, 0, 0.6705883, 1, 1,
0.2099547, 0.5570507, -0.5276331, 0, 0.6627451, 1, 1,
0.2124973, 0.2763646, 2.117157, 0, 0.6588235, 1, 1,
0.2135358, -0.6027462, 1.665314, 0, 0.6509804, 1, 1,
0.2143616, 0.6336811, -0.2894002, 0, 0.6470588, 1, 1,
0.2172193, -1.045462, 3.173403, 0, 0.6392157, 1, 1,
0.2183446, 0.6423792, -0.9080226, 0, 0.6352941, 1, 1,
0.2201795, -0.8251587, 3.408134, 0, 0.627451, 1, 1,
0.2211835, -0.7500044, 2.391595, 0, 0.6235294, 1, 1,
0.2233274, 1.136977, 0.4245686, 0, 0.6156863, 1, 1,
0.226521, 0.1991364, 1.875672, 0, 0.6117647, 1, 1,
0.2347995, -0.02208993, 2.409891, 0, 0.6039216, 1, 1,
0.236988, -0.2227035, 2.408456, 0, 0.5960785, 1, 1,
0.2384481, -1.133847, 2.747685, 0, 0.5921569, 1, 1,
0.2390636, -1.711781, 3.603193, 0, 0.5843138, 1, 1,
0.240677, -1.384933, 3.387234, 0, 0.5803922, 1, 1,
0.2471698, 0.04816503, 1.361063, 0, 0.572549, 1, 1,
0.2549366, -0.1596619, 3.805711, 0, 0.5686275, 1, 1,
0.2592192, 0.4808651, 0.555593, 0, 0.5607843, 1, 1,
0.2623973, -0.8734752, 3.638636, 0, 0.5568628, 1, 1,
0.2626655, 1.057408, 0.042819, 0, 0.5490196, 1, 1,
0.2686501, 1.475402, 0.9610487, 0, 0.5450981, 1, 1,
0.26966, 0.8492597, 1.469419, 0, 0.5372549, 1, 1,
0.2701785, 0.07660949, 2.219078, 0, 0.5333334, 1, 1,
0.2718644, 1.687284, -0.2086115, 0, 0.5254902, 1, 1,
0.2766561, 0.0517937, 3.424563, 0, 0.5215687, 1, 1,
0.2800689, 1.767993, 0.9358343, 0, 0.5137255, 1, 1,
0.2832097, 0.144277, 0.4457416, 0, 0.509804, 1, 1,
0.2888563, 0.789965, -0.06973522, 0, 0.5019608, 1, 1,
0.2919568, 0.469164, 0.1319801, 0, 0.4941176, 1, 1,
0.2929556, 0.7889756, 0.6437601, 0, 0.4901961, 1, 1,
0.3032557, -1.281614, 3.191523, 0, 0.4823529, 1, 1,
0.3122663, 0.1543124, 2.119942, 0, 0.4784314, 1, 1,
0.3125553, 1.154567, 2.261046, 0, 0.4705882, 1, 1,
0.3145708, -0.4454939, 1.860392, 0, 0.4666667, 1, 1,
0.3153651, -1.851261, 3.454335, 0, 0.4588235, 1, 1,
0.317772, 0.7551257, 0.07645296, 0, 0.454902, 1, 1,
0.3182141, -0.9781883, 1.424112, 0, 0.4470588, 1, 1,
0.318933, -0.899572, 2.902032, 0, 0.4431373, 1, 1,
0.3236284, 0.02964773, 1.102401, 0, 0.4352941, 1, 1,
0.3248714, -1.507385, 1.041505, 0, 0.4313726, 1, 1,
0.3268735, 0.7447482, -1.221996, 0, 0.4235294, 1, 1,
0.3287544, 0.7682804, 1.870995, 0, 0.4196078, 1, 1,
0.3291937, -0.2500787, 2.441898, 0, 0.4117647, 1, 1,
0.3375097, 0.260439, 0.8944387, 0, 0.4078431, 1, 1,
0.3382669, -1.544499, 1.937593, 0, 0.4, 1, 1,
0.3385475, -1.690736, 2.325943, 0, 0.3921569, 1, 1,
0.3426583, -0.2059992, 0.9729986, 0, 0.3882353, 1, 1,
0.3476879, -0.1029085, 1.097299, 0, 0.3803922, 1, 1,
0.348495, -1.099281, 2.674453, 0, 0.3764706, 1, 1,
0.3556983, -1.974041, 2.084887, 0, 0.3686275, 1, 1,
0.3581061, -0.9480467, 1.923877, 0, 0.3647059, 1, 1,
0.3642232, -0.4479692, 2.338749, 0, 0.3568628, 1, 1,
0.3659419, 2.075495, 0.7801272, 0, 0.3529412, 1, 1,
0.3659586, 0.6157979, -0.592813, 0, 0.345098, 1, 1,
0.3661786, 1.309808, 1.518831, 0, 0.3411765, 1, 1,
0.3688815, -1.003218, 2.912707, 0, 0.3333333, 1, 1,
0.3694475, -0.02234395, 1.279618, 0, 0.3294118, 1, 1,
0.3710233, 0.7400501, -0.05494335, 0, 0.3215686, 1, 1,
0.374425, -0.3178729, 2.896731, 0, 0.3176471, 1, 1,
0.3745004, 0.6271557, -1.445022, 0, 0.3098039, 1, 1,
0.384137, -0.8054851, 2.477141, 0, 0.3058824, 1, 1,
0.385758, 0.142426, 0.464737, 0, 0.2980392, 1, 1,
0.3882658, 1.358378, 1.708086, 0, 0.2901961, 1, 1,
0.3898771, 0.6311978, 1.072036, 0, 0.2862745, 1, 1,
0.3907233, 0.4490283, 0.1714932, 0, 0.2784314, 1, 1,
0.3931366, 0.7489949, 0.7799477, 0, 0.2745098, 1, 1,
0.3973857, -0.8540655, 3.337213, 0, 0.2666667, 1, 1,
0.3986299, 0.9445049, -0.5716702, 0, 0.2627451, 1, 1,
0.3995443, -1.147396, 3.529368, 0, 0.254902, 1, 1,
0.4003283, 1.328236, 0.1779455, 0, 0.2509804, 1, 1,
0.4025311, -0.2526752, 1.597362, 0, 0.2431373, 1, 1,
0.4036363, 1.312386, 0.2943526, 0, 0.2392157, 1, 1,
0.405013, 0.8256751, -0.5050725, 0, 0.2313726, 1, 1,
0.4060218, -0.1670454, 1.834875, 0, 0.227451, 1, 1,
0.4120387, -2.57996, 3.643311, 0, 0.2196078, 1, 1,
0.4149908, 1.114226, -1.183304, 0, 0.2156863, 1, 1,
0.4151271, -0.7454558, 2.703984, 0, 0.2078431, 1, 1,
0.41729, -1.199741, 3.634948, 0, 0.2039216, 1, 1,
0.4180413, 0.3169203, 1.134987, 0, 0.1960784, 1, 1,
0.4189421, 0.9833791, 1.180165, 0, 0.1882353, 1, 1,
0.4215081, 0.9381925, 0.04271864, 0, 0.1843137, 1, 1,
0.4243764, 1.814196, -1.077681, 0, 0.1764706, 1, 1,
0.4249522, -0.6791179, 4.151213, 0, 0.172549, 1, 1,
0.4255174, 1.201622, 1.476762, 0, 0.1647059, 1, 1,
0.4274877, -0.9134769, 3.246292, 0, 0.1607843, 1, 1,
0.4322039, 1.430647, 1.128733, 0, 0.1529412, 1, 1,
0.4356318, -0.3683586, 4.480485, 0, 0.1490196, 1, 1,
0.4373571, -0.5646971, 3.124429, 0, 0.1411765, 1, 1,
0.4377485, -0.8178584, 0.2612878, 0, 0.1372549, 1, 1,
0.4407591, -0.8317268, 1.92245, 0, 0.1294118, 1, 1,
0.446606, 0.4872997, -0.4618894, 0, 0.1254902, 1, 1,
0.4519404, 0.3004706, 1.400563, 0, 0.1176471, 1, 1,
0.4581847, 1.125951, 0.4461192, 0, 0.1137255, 1, 1,
0.458328, 1.191801, -1.045638, 0, 0.1058824, 1, 1,
0.4596941, -0.1091768, 0.4196274, 0, 0.09803922, 1, 1,
0.470329, 1.545112, -0.04941972, 0, 0.09411765, 1, 1,
0.4709104, -1.195158, 3.573527, 0, 0.08627451, 1, 1,
0.4742442, 1.117724, -0.6709121, 0, 0.08235294, 1, 1,
0.4751373, 0.5924545, 0.7462441, 0, 0.07450981, 1, 1,
0.4755547, 1.268706, -0.1883817, 0, 0.07058824, 1, 1,
0.4762804, 0.8109131, 2.397233, 0, 0.0627451, 1, 1,
0.4768985, -0.06135539, 2.304276, 0, 0.05882353, 1, 1,
0.4786375, 0.5691136, 1.697114, 0, 0.05098039, 1, 1,
0.4786438, 0.2950652, -0.3760886, 0, 0.04705882, 1, 1,
0.4829666, -0.6402369, 2.876911, 0, 0.03921569, 1, 1,
0.4840232, -0.5263954, 1.782127, 0, 0.03529412, 1, 1,
0.4919858, 1.126311, 0.669313, 0, 0.02745098, 1, 1,
0.4973918, -2.386966, 2.002963, 0, 0.02352941, 1, 1,
0.5017775, 0.1122103, 0.06659181, 0, 0.01568628, 1, 1,
0.5020576, 0.3897123, 0.8167347, 0, 0.01176471, 1, 1,
0.5068001, -0.9073551, 2.355265, 0, 0.003921569, 1, 1,
0.507274, 0.06059037, 2.1265, 0.003921569, 0, 1, 1,
0.5092162, -0.5646133, 1.288862, 0.007843138, 0, 1, 1,
0.52079, 0.1166102, 2.309927, 0.01568628, 0, 1, 1,
0.5229579, 1.608672, -0.3488878, 0.01960784, 0, 1, 1,
0.530466, 0.3179226, 1.013233, 0.02745098, 0, 1, 1,
0.5305813, -0.8655052, 2.850922, 0.03137255, 0, 1, 1,
0.5307219, 1.216756, 0.5722868, 0.03921569, 0, 1, 1,
0.5316504, 1.679131, 0.8100076, 0.04313726, 0, 1, 1,
0.5350726, -0.3181651, 3.396397, 0.05098039, 0, 1, 1,
0.5413356, -1.108127, 2.846709, 0.05490196, 0, 1, 1,
0.5448711, -0.1829797, 1.130489, 0.0627451, 0, 1, 1,
0.5459994, 0.1578967, 1.061357, 0.06666667, 0, 1, 1,
0.547839, -0.5228682, 2.778949, 0.07450981, 0, 1, 1,
0.5481547, 0.1119633, -0.633944, 0.07843138, 0, 1, 1,
0.551946, -0.006011291, 1.709034, 0.08627451, 0, 1, 1,
0.5547352, 0.1737392, -0.7770934, 0.09019608, 0, 1, 1,
0.5581444, -0.4866043, 4.630848, 0.09803922, 0, 1, 1,
0.5598481, -0.5452868, 3.030879, 0.1058824, 0, 1, 1,
0.5601892, 0.1667268, 2.468224, 0.1098039, 0, 1, 1,
0.560778, -1.724542, 1.85429, 0.1176471, 0, 1, 1,
0.5621711, 1.448367, 0.7778947, 0.1215686, 0, 1, 1,
0.5655681, -0.106616, 1.882857, 0.1294118, 0, 1, 1,
0.565951, 0.3455376, 2.170956, 0.1333333, 0, 1, 1,
0.5731206, 0.2752042, 1.737322, 0.1411765, 0, 1, 1,
0.5763319, -0.03121639, 4.477449, 0.145098, 0, 1, 1,
0.5825893, -1.435852, 3.191744, 0.1529412, 0, 1, 1,
0.5859988, 0.4050725, 2.064167, 0.1568628, 0, 1, 1,
0.5877182, 0.7938948, -0.5118084, 0.1647059, 0, 1, 1,
0.5886139, -1.073447, 1.688491, 0.1686275, 0, 1, 1,
0.5888665, -0.3524952, 2.250853, 0.1764706, 0, 1, 1,
0.5921959, 0.1770571, 0.6406811, 0.1803922, 0, 1, 1,
0.5939047, -0.08668083, 0.6949829, 0.1882353, 0, 1, 1,
0.5988403, 0.04593857, 1.391057, 0.1921569, 0, 1, 1,
0.6002977, 0.157951, -0.5003543, 0.2, 0, 1, 1,
0.6078675, 0.7216493, 1.405889, 0.2078431, 0, 1, 1,
0.6100917, 0.6346288, -0.4443035, 0.2117647, 0, 1, 1,
0.611971, 0.5139785, 1.13927, 0.2196078, 0, 1, 1,
0.6155431, -0.9213254, 1.972189, 0.2235294, 0, 1, 1,
0.6205838, -0.7645925, 2.20887, 0.2313726, 0, 1, 1,
0.6259711, -0.1402197, 1.463357, 0.2352941, 0, 1, 1,
0.6302046, -1.71666, 2.837001, 0.2431373, 0, 1, 1,
0.6317869, 0.1853663, 1.239488, 0.2470588, 0, 1, 1,
0.6396428, 0.7051086, -0.8203967, 0.254902, 0, 1, 1,
0.6476941, 2.36515, -0.2613979, 0.2588235, 0, 1, 1,
0.6494645, -0.1142543, 3.352467, 0.2666667, 0, 1, 1,
0.6521905, 0.8294736, -2.502705, 0.2705882, 0, 1, 1,
0.657629, 1.662518, -0.05067313, 0.2784314, 0, 1, 1,
0.6597169, -0.7085228, 1.951087, 0.282353, 0, 1, 1,
0.6607727, 1.581657, 1.267507, 0.2901961, 0, 1, 1,
0.6612258, 0.8714162, 0.2736999, 0.2941177, 0, 1, 1,
0.6677422, -0.07330853, 0.02411676, 0.3019608, 0, 1, 1,
0.6741961, 0.2896386, 1.030697, 0.3098039, 0, 1, 1,
0.684726, -1.649649, 2.017498, 0.3137255, 0, 1, 1,
0.6862076, 0.419346, 2.542728, 0.3215686, 0, 1, 1,
0.6891241, -1.562782, 3.221689, 0.3254902, 0, 1, 1,
0.6910883, 1.43041, 0.4557002, 0.3333333, 0, 1, 1,
0.6918651, 0.1233416, 0.96374, 0.3372549, 0, 1, 1,
0.6949463, 0.2841882, -0.1060091, 0.345098, 0, 1, 1,
0.6980408, -1.322467, 3.082634, 0.3490196, 0, 1, 1,
0.7014651, 1.709208, 1.08327, 0.3568628, 0, 1, 1,
0.7023332, -0.4207271, 0.101466, 0.3607843, 0, 1, 1,
0.7025756, -0.4557144, 1.619627, 0.3686275, 0, 1, 1,
0.7064999, -0.1371163, 2.172305, 0.372549, 0, 1, 1,
0.7068859, 1.125725, -0.6755462, 0.3803922, 0, 1, 1,
0.7080007, 1.875164, 0.4566286, 0.3843137, 0, 1, 1,
0.7124819, 1.124077, -0.04066052, 0.3921569, 0, 1, 1,
0.7125732, -0.3236924, 1.189841, 0.3960784, 0, 1, 1,
0.713875, -0.09849449, 1.075516, 0.4039216, 0, 1, 1,
0.7189127, 0.8400359, 0.3833466, 0.4117647, 0, 1, 1,
0.7204043, 0.4828139, 0.06909979, 0.4156863, 0, 1, 1,
0.7217902, 1.028277, 1.56238, 0.4235294, 0, 1, 1,
0.7220732, 1.661352, 1.604919, 0.427451, 0, 1, 1,
0.7241545, -0.5157402, 3.373769, 0.4352941, 0, 1, 1,
0.7249832, -0.5975315, 1.843935, 0.4392157, 0, 1, 1,
0.7276416, 2.062499, -0.3453559, 0.4470588, 0, 1, 1,
0.7283453, 0.6270406, -0.1601342, 0.4509804, 0, 1, 1,
0.7302818, 0.8186768, 1.159758, 0.4588235, 0, 1, 1,
0.7325353, 2.790405, 1.291314, 0.4627451, 0, 1, 1,
0.7330754, 1.366892, 0.6363279, 0.4705882, 0, 1, 1,
0.7341075, 2.057781, 1.583272, 0.4745098, 0, 1, 1,
0.7360267, -0.9507658, 3.061866, 0.4823529, 0, 1, 1,
0.736316, 0.748113, -0.3166312, 0.4862745, 0, 1, 1,
0.7378514, -0.4354926, 1.801055, 0.4941176, 0, 1, 1,
0.7474882, 0.5005442, 0.9083358, 0.5019608, 0, 1, 1,
0.7501093, -0.1990396, 3.92691, 0.5058824, 0, 1, 1,
0.7587851, -0.617511, 2.281565, 0.5137255, 0, 1, 1,
0.7619708, -0.2248926, 1.473072, 0.5176471, 0, 1, 1,
0.7663422, -0.8938881, 1.363639, 0.5254902, 0, 1, 1,
0.7715555, -1.107028, 1.265802, 0.5294118, 0, 1, 1,
0.7828068, 1.352487, 2.820778, 0.5372549, 0, 1, 1,
0.7837392, 0.4645779, 2.925914, 0.5411765, 0, 1, 1,
0.7862312, 0.2254376, 1.878126, 0.5490196, 0, 1, 1,
0.7878927, 0.7812426, 0.5348582, 0.5529412, 0, 1, 1,
0.8062688, -0.5833405, 2.732178, 0.5607843, 0, 1, 1,
0.8076619, -1.488837, 4.496263, 0.5647059, 0, 1, 1,
0.8081179, -1.178308, 3.197889, 0.572549, 0, 1, 1,
0.8094892, 0.5197684, 0.8716529, 0.5764706, 0, 1, 1,
0.8117762, -1.122597, 3.58311, 0.5843138, 0, 1, 1,
0.8153114, 0.03136119, 1.311608, 0.5882353, 0, 1, 1,
0.8179468, 0.5031952, -0.603632, 0.5960785, 0, 1, 1,
0.8187118, -0.4564644, 1.711426, 0.6039216, 0, 1, 1,
0.8194722, 0.682185, -0.7453025, 0.6078432, 0, 1, 1,
0.8251559, 0.4008685, 0.4041246, 0.6156863, 0, 1, 1,
0.828487, 0.06941004, 3.304682, 0.6196079, 0, 1, 1,
0.8348233, -0.6892893, 3.554963, 0.627451, 0, 1, 1,
0.8358661, -1.279251, 3.120049, 0.6313726, 0, 1, 1,
0.8363882, 0.4376192, 0.7515594, 0.6392157, 0, 1, 1,
0.8375496, 1.64541, -0.5894402, 0.6431373, 0, 1, 1,
0.8416098, -1.167769, 2.78266, 0.6509804, 0, 1, 1,
0.842052, -0.06348547, -1.534366, 0.654902, 0, 1, 1,
0.8555779, -0.483652, 2.859573, 0.6627451, 0, 1, 1,
0.8582105, 1.640599, -0.4678838, 0.6666667, 0, 1, 1,
0.8596748, 0.3669059, 1.067155, 0.6745098, 0, 1, 1,
0.8605564, 1.900821, 0.9324968, 0.6784314, 0, 1, 1,
0.8680558, 1.462294, 1.169013, 0.6862745, 0, 1, 1,
0.8680756, 0.1059615, 0.1918349, 0.6901961, 0, 1, 1,
0.8749623, -0.713663, 2.649026, 0.6980392, 0, 1, 1,
0.8850867, 0.2078996, 0.2151674, 0.7058824, 0, 1, 1,
0.9021078, 0.1488886, 0.4369746, 0.7098039, 0, 1, 1,
0.9049731, -0.6718246, 2.517031, 0.7176471, 0, 1, 1,
0.9049983, 1.371043, 0.01585012, 0.7215686, 0, 1, 1,
0.9063505, 0.3003337, 1.741053, 0.7294118, 0, 1, 1,
0.9248447, -0.4142226, 4.168863, 0.7333333, 0, 1, 1,
0.9349278, -2.720652, 3.84192, 0.7411765, 0, 1, 1,
0.938845, -0.4982173, 2.522379, 0.7450981, 0, 1, 1,
0.9425194, -0.3642661, 2.573001, 0.7529412, 0, 1, 1,
0.9476936, 0.3648608, 2.622249, 0.7568628, 0, 1, 1,
0.9526121, 1.131612, 0.1460281, 0.7647059, 0, 1, 1,
0.9601197, -1.922018, 3.527687, 0.7686275, 0, 1, 1,
0.9622558, 0.5609431, 2.745747, 0.7764706, 0, 1, 1,
0.9724968, 0.06617366, 1.703041, 0.7803922, 0, 1, 1,
0.9794568, -0.03511919, -0.2799807, 0.7882353, 0, 1, 1,
0.982448, 1.376611, 0.5064368, 0.7921569, 0, 1, 1,
0.9885259, -0.17175, 1.547185, 0.8, 0, 1, 1,
0.9912398, -0.9173758, 0.6756395, 0.8078431, 0, 1, 1,
0.9924393, -0.1067241, 2.249212, 0.8117647, 0, 1, 1,
1.001359, 0.635474, 1.64913, 0.8196079, 0, 1, 1,
1.004698, -0.03331743, 1.612333, 0.8235294, 0, 1, 1,
1.006032, -1.786258, 2.415297, 0.8313726, 0, 1, 1,
1.006695, 0.03153284, 1.564827, 0.8352941, 0, 1, 1,
1.011641, -0.02685432, 2.454088, 0.8431373, 0, 1, 1,
1.012352, -0.7745008, 2.729327, 0.8470588, 0, 1, 1,
1.013872, 0.1664816, -0.1869703, 0.854902, 0, 1, 1,
1.01651, 0.07106435, 2.259998, 0.8588235, 0, 1, 1,
1.017756, -0.04822494, -0.7087932, 0.8666667, 0, 1, 1,
1.020746, -0.6794226, 3.815416, 0.8705882, 0, 1, 1,
1.024737, 2.355888, 0.05907888, 0.8784314, 0, 1, 1,
1.031923, -0.002669714, 0.09665618, 0.8823529, 0, 1, 1,
1.037122, 0.8886493, 1.584504, 0.8901961, 0, 1, 1,
1.037124, 0.09049555, 0.952078, 0.8941177, 0, 1, 1,
1.038404, 0.3222556, 1.220503, 0.9019608, 0, 1, 1,
1.03896, -0.3440579, -0.6355301, 0.9098039, 0, 1, 1,
1.045176, -0.6722979, 1.935178, 0.9137255, 0, 1, 1,
1.050769, -0.1558932, 0.6835377, 0.9215686, 0, 1, 1,
1.056644, -0.339496, 0.8365677, 0.9254902, 0, 1, 1,
1.064512, -1.421956, 1.094655, 0.9333333, 0, 1, 1,
1.066266, 0.3634848, 0.2867438, 0.9372549, 0, 1, 1,
1.071008, 0.03009655, 0.8353377, 0.945098, 0, 1, 1,
1.076207, 1.407207, 2.171554, 0.9490196, 0, 1, 1,
1.077283, -0.3513164, 3.730892, 0.9568627, 0, 1, 1,
1.079501, -0.2755232, 1.682635, 0.9607843, 0, 1, 1,
1.09045, 0.00762128, 2.958128, 0.9686275, 0, 1, 1,
1.105886, 0.9973919, -0.7544649, 0.972549, 0, 1, 1,
1.118177, 0.2843344, 2.756617, 0.9803922, 0, 1, 1,
1.119578, -1.368547, 2.077604, 0.9843137, 0, 1, 1,
1.119909, -0.1278054, 2.060708, 0.9921569, 0, 1, 1,
1.122941, -2.242523, 3.01994, 0.9960784, 0, 1, 1,
1.125193, 0.1247524, 2.431694, 1, 0, 0.9960784, 1,
1.128374, 1.232648, 2.627806, 1, 0, 0.9882353, 1,
1.128959, -0.7470949, 1.266874, 1, 0, 0.9843137, 1,
1.13324, -1.529677, 4.378502, 1, 0, 0.9764706, 1,
1.145176, -1.723099, 3.435148, 1, 0, 0.972549, 1,
1.147867, 0.1104625, 0.912896, 1, 0, 0.9647059, 1,
1.151069, -0.3795736, 2.083637, 1, 0, 0.9607843, 1,
1.154013, -0.6589241, 2.131998, 1, 0, 0.9529412, 1,
1.155651, 0.5466864, 0.918211, 1, 0, 0.9490196, 1,
1.164728, -0.7278221, 2.620501, 1, 0, 0.9411765, 1,
1.173258, -0.1385365, 0.7030156, 1, 0, 0.9372549, 1,
1.174813, 0.09626622, 1.329662, 1, 0, 0.9294118, 1,
1.176944, -0.803493, 0.247221, 1, 0, 0.9254902, 1,
1.179006, -1.087618, 0.8396047, 1, 0, 0.9176471, 1,
1.179726, -0.2396291, 1.195104, 1, 0, 0.9137255, 1,
1.18806, 1.722558, 1.480204, 1, 0, 0.9058824, 1,
1.188554, -1.818198, 3.249432, 1, 0, 0.9019608, 1,
1.191653, -0.5862185, 1.74823, 1, 0, 0.8941177, 1,
1.19626, -0.951198, 2.171223, 1, 0, 0.8862745, 1,
1.196484, -0.01533637, 2.767973, 1, 0, 0.8823529, 1,
1.199962, 1.851092, 0.4473335, 1, 0, 0.8745098, 1,
1.204141, -0.1160961, 0.5198385, 1, 0, 0.8705882, 1,
1.209747, 0.3332839, 0.476606, 1, 0, 0.8627451, 1,
1.209839, -1.437317, 1.972801, 1, 0, 0.8588235, 1,
1.210848, 0.8796411, 2.708798, 1, 0, 0.8509804, 1,
1.21236, 1.202066, -0.546591, 1, 0, 0.8470588, 1,
1.215213, -0.7366614, 2.608139, 1, 0, 0.8392157, 1,
1.218934, 0.04894112, 3.54728, 1, 0, 0.8352941, 1,
1.227231, -0.01576431, 3.818531, 1, 0, 0.827451, 1,
1.230719, -0.6633527, 1.985324, 1, 0, 0.8235294, 1,
1.23541, -1.26245, 3.86599, 1, 0, 0.8156863, 1,
1.255495, 0.4916152, 2.933947, 1, 0, 0.8117647, 1,
1.265819, 0.8742661, 2.301919, 1, 0, 0.8039216, 1,
1.268026, 0.447331, 0.644513, 1, 0, 0.7960784, 1,
1.270666, -1.600872, 2.08196, 1, 0, 0.7921569, 1,
1.273964, -1.30164, 1.998961, 1, 0, 0.7843137, 1,
1.277961, 0.6972045, 1.648059, 1, 0, 0.7803922, 1,
1.278409, -0.284604, 0.8818176, 1, 0, 0.772549, 1,
1.279121, 2.829579, -1.054694, 1, 0, 0.7686275, 1,
1.291579, -0.526549, 2.327875, 1, 0, 0.7607843, 1,
1.293462, 0.1517863, 1.937025, 1, 0, 0.7568628, 1,
1.294657, -1.385244, 2.933954, 1, 0, 0.7490196, 1,
1.295743, -1.572063, 3.153843, 1, 0, 0.7450981, 1,
1.29688, 0.02538195, 1.912936, 1, 0, 0.7372549, 1,
1.300522, -0.7621386, 1.924063, 1, 0, 0.7333333, 1,
1.320891, 0.8542199, 1.570753, 1, 0, 0.7254902, 1,
1.326525, 0.2486773, 1.471759, 1, 0, 0.7215686, 1,
1.326734, 1.731364, -0.4706147, 1, 0, 0.7137255, 1,
1.332337, 1.135092, 0.6830209, 1, 0, 0.7098039, 1,
1.338102, 1.062329, 1.017629, 1, 0, 0.7019608, 1,
1.340289, -0.7689893, 2.011436, 1, 0, 0.6941177, 1,
1.349693, 0.299237, 1.852036, 1, 0, 0.6901961, 1,
1.353127, -1.841916, 2.107865, 1, 0, 0.682353, 1,
1.362896, 1.857235, -1.538874, 1, 0, 0.6784314, 1,
1.390029, -1.269427, 1.376005, 1, 0, 0.6705883, 1,
1.395059, 0.561609, 1.761779, 1, 0, 0.6666667, 1,
1.396499, -0.6850282, 2.367463, 1, 0, 0.6588235, 1,
1.401424, -0.6656401, 0.9655573, 1, 0, 0.654902, 1,
1.406464, 0.3466793, 1.5852, 1, 0, 0.6470588, 1,
1.406641, -0.7381349, 1.6317, 1, 0, 0.6431373, 1,
1.407183, 0.6238213, -0.6992232, 1, 0, 0.6352941, 1,
1.408357, 1.683134, -0.7838298, 1, 0, 0.6313726, 1,
1.41035, -0.07110669, 0.7590286, 1, 0, 0.6235294, 1,
1.411042, -0.7745839, 1.778545, 1, 0, 0.6196079, 1,
1.411782, -0.9572226, 3.784016, 1, 0, 0.6117647, 1,
1.419954, -0.4410244, 1.458487, 1, 0, 0.6078432, 1,
1.420384, -0.110862, 1.785119, 1, 0, 0.6, 1,
1.421953, -0.5003924, 3.171277, 1, 0, 0.5921569, 1,
1.424944, -1.239927, 2.678284, 1, 0, 0.5882353, 1,
1.426471, 2.094111, -0.6692711, 1, 0, 0.5803922, 1,
1.432811, 2.285707, -0.4608121, 1, 0, 0.5764706, 1,
1.433981, 1.802397, -0.5906643, 1, 0, 0.5686275, 1,
1.43515, 0.2574589, 0.5821819, 1, 0, 0.5647059, 1,
1.437736, -1.15495, 2.389236, 1, 0, 0.5568628, 1,
1.445893, 1.046493, 1.403361, 1, 0, 0.5529412, 1,
1.449009, 0.441582, 1.392791, 1, 0, 0.5450981, 1,
1.458036, 1.291006, 1.503985, 1, 0, 0.5411765, 1,
1.460915, 0.1082008, -1.07314, 1, 0, 0.5333334, 1,
1.46362, 1.020832, 1.350873, 1, 0, 0.5294118, 1,
1.470945, -0.7693453, 1.058657, 1, 0, 0.5215687, 1,
1.475637, 0.2096587, 1.161136, 1, 0, 0.5176471, 1,
1.483496, 0.8751537, 0.6546793, 1, 0, 0.509804, 1,
1.484765, -1.02171, 2.263853, 1, 0, 0.5058824, 1,
1.487023, 1.563367, -0.7730939, 1, 0, 0.4980392, 1,
1.490208, -0.9124002, 3.327076, 1, 0, 0.4901961, 1,
1.495053, -0.6474743, 3.443215, 1, 0, 0.4862745, 1,
1.506255, -0.1364035, 0.9317217, 1, 0, 0.4784314, 1,
1.506553, 0.8276378, -1.495617, 1, 0, 0.4745098, 1,
1.507768, -0.4327051, 3.796419, 1, 0, 0.4666667, 1,
1.513881, 0.8063082, -0.6646641, 1, 0, 0.4627451, 1,
1.522184, -0.04577366, 2.530543, 1, 0, 0.454902, 1,
1.523811, 2.610385, 0.6089085, 1, 0, 0.4509804, 1,
1.542111, 0.2732451, 2.574828, 1, 0, 0.4431373, 1,
1.545043, -0.3033899, 1.040441, 1, 0, 0.4392157, 1,
1.558234, -1.009169, -0.5659534, 1, 0, 0.4313726, 1,
1.558634, 0.4235252, 0.1519184, 1, 0, 0.427451, 1,
1.56952, -0.08669687, 2.156852, 1, 0, 0.4196078, 1,
1.577026, -0.5414382, 2.041556, 1, 0, 0.4156863, 1,
1.609981, -0.6464364, 2.343739, 1, 0, 0.4078431, 1,
1.616495, 0.5936989, 2.01645, 1, 0, 0.4039216, 1,
1.636283, 1.580489, 0.1544801, 1, 0, 0.3960784, 1,
1.641247, -0.5360671, 0.8563796, 1, 0, 0.3882353, 1,
1.642907, -0.7593945, 2.450301, 1, 0, 0.3843137, 1,
1.64379, -0.4731784, 0.7959303, 1, 0, 0.3764706, 1,
1.662749, -1.132749, 1.005008, 1, 0, 0.372549, 1,
1.664091, -0.5412657, 0.7597976, 1, 0, 0.3647059, 1,
1.664947, -0.02470188, 1.556746, 1, 0, 0.3607843, 1,
1.66677, -0.4722137, 1.668236, 1, 0, 0.3529412, 1,
1.671244, 1.576826, -1.071735, 1, 0, 0.3490196, 1,
1.685152, 1.013808, 0.8275743, 1, 0, 0.3411765, 1,
1.690788, 1.1418, 1.201695, 1, 0, 0.3372549, 1,
1.694539, 0.4069161, 0.6544251, 1, 0, 0.3294118, 1,
1.702481, -0.3139197, 1.940167, 1, 0, 0.3254902, 1,
1.704885, 1.06099, -0.2753922, 1, 0, 0.3176471, 1,
1.725024, 1.208273, 1.943877, 1, 0, 0.3137255, 1,
1.725147, 1.782737, 1.754097, 1, 0, 0.3058824, 1,
1.730545, -0.8123069, 2.977396, 1, 0, 0.2980392, 1,
1.733726, -0.6337596, 0.3456663, 1, 0, 0.2941177, 1,
1.751461, -0.7646639, 0.7046463, 1, 0, 0.2862745, 1,
1.752086, -0.1833781, 3.241833, 1, 0, 0.282353, 1,
1.767491, 1.663756, 1.551351, 1, 0, 0.2745098, 1,
1.76854, 0.5577049, 1.07942, 1, 0, 0.2705882, 1,
1.772756, -2.941492, 3.549428, 1, 0, 0.2627451, 1,
1.786691, -0.5475618, 2.783282, 1, 0, 0.2588235, 1,
1.796015, -1.787878, 1.902397, 1, 0, 0.2509804, 1,
1.804998, 1.97171, 0.579824, 1, 0, 0.2470588, 1,
1.807572, 1.133838, 0.898093, 1, 0, 0.2392157, 1,
1.820252, -1.652378, 0.951984, 1, 0, 0.2352941, 1,
1.832494, 0.08737697, 1.616677, 1, 0, 0.227451, 1,
1.869541, -0.1411212, 0.3994407, 1, 0, 0.2235294, 1,
1.874401, -0.3008715, 0.7508743, 1, 0, 0.2156863, 1,
1.883196, 0.253232, -0.3281963, 1, 0, 0.2117647, 1,
1.891915, -0.2746457, 2.148623, 1, 0, 0.2039216, 1,
1.90281, 0.1014605, 0.5500796, 1, 0, 0.1960784, 1,
1.916812, -0.3627336, 1.211875, 1, 0, 0.1921569, 1,
1.917139, 2.188373, 1.897055, 1, 0, 0.1843137, 1,
1.923004, 0.08870883, 2.422985, 1, 0, 0.1803922, 1,
1.929893, 0.7731671, -0.3172878, 1, 0, 0.172549, 1,
1.936156, 1.34896, 1.702423, 1, 0, 0.1686275, 1,
1.951313, 0.4186425, 2.371631, 1, 0, 0.1607843, 1,
1.952605, -1.312161, 1.611363, 1, 0, 0.1568628, 1,
1.960597, -0.3309278, 0.3166081, 1, 0, 0.1490196, 1,
1.962875, -0.9094003, 1.260624, 1, 0, 0.145098, 1,
1.983864, -0.6090118, 1.289802, 1, 0, 0.1372549, 1,
1.985303, 0.5160923, 2.613878, 1, 0, 0.1333333, 1,
2.014982, -0.02405323, 3.255869, 1, 0, 0.1254902, 1,
2.067311, -0.05469742, 1.121568, 1, 0, 0.1215686, 1,
2.070501, 0.2389926, 1.102037, 1, 0, 0.1137255, 1,
2.078263, -1.448507, 3.853719, 1, 0, 0.1098039, 1,
2.112919, 0.216335, 0.6818389, 1, 0, 0.1019608, 1,
2.170628, 1.136176, 1.548476, 1, 0, 0.09411765, 1,
2.185219, -0.8970155, 2.694443, 1, 0, 0.09019608, 1,
2.21216, -1.667151, 1.200621, 1, 0, 0.08235294, 1,
2.218804, 1.343351, 1.900155, 1, 0, 0.07843138, 1,
2.262802, -0.5257972, 0.401849, 1, 0, 0.07058824, 1,
2.263382, -1.149419, 1.221619, 1, 0, 0.06666667, 1,
2.303298, 0.1561325, 0.04388314, 1, 0, 0.05882353, 1,
2.308847, 0.4844825, 2.353953, 1, 0, 0.05490196, 1,
2.327138, -0.1489526, 1.527499, 1, 0, 0.04705882, 1,
2.34247, 1.365524, 0.2595403, 1, 0, 0.04313726, 1,
2.360401, 0.4477635, 2.381891, 1, 0, 0.03529412, 1,
2.400734, 1.103508, 2.323368, 1, 0, 0.03137255, 1,
2.516203, -0.8684379, 0.9830288, 1, 0, 0.02352941, 1,
2.598814, 2.647095, 1.977562, 1, 0, 0.01960784, 1,
2.720692, 0.832796, -0.228485, 1, 0, 0.01176471, 1,
2.812982, 1.3771, 0.01524221, 1, 0, 0.007843138, 1
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
-0.2347125, -4.808997, -6.849652, 0, -0.5, 0.5, 0.5,
-0.2347125, -4.808997, -6.849652, 1, -0.5, 0.5, 0.5,
-0.2347125, -4.808997, -6.849652, 1, 1.5, 0.5, 0.5,
-0.2347125, -4.808997, -6.849652, 0, 1.5, 0.5, 0.5
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
-4.315576, -0.3885994, -6.849652, 0, -0.5, 0.5, 0.5,
-4.315576, -0.3885994, -6.849652, 1, -0.5, 0.5, 0.5,
-4.315576, -0.3885994, -6.849652, 1, 1.5, 0.5, 0.5,
-4.315576, -0.3885994, -6.849652, 0, 1.5, 0.5, 0.5
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
-4.315576, -4.808997, -0.2774463, 0, -0.5, 0.5, 0.5,
-4.315576, -4.808997, -0.2774463, 1, -0.5, 0.5, 0.5,
-4.315576, -4.808997, -0.2774463, 1, 1.5, 0.5, 0.5,
-4.315576, -4.808997, -0.2774463, 0, 1.5, 0.5, 0.5
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
-3, -3.788905, -5.332989,
2, -3.788905, -5.332989,
-3, -3.788905, -5.332989,
-3, -3.95892, -5.585766,
-2, -3.788905, -5.332989,
-2, -3.95892, -5.585766,
-1, -3.788905, -5.332989,
-1, -3.95892, -5.585766,
0, -3.788905, -5.332989,
0, -3.95892, -5.585766,
1, -3.788905, -5.332989,
1, -3.95892, -5.585766,
2, -3.788905, -5.332989,
2, -3.95892, -5.585766
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
-3, -4.298951, -6.091321, 0, -0.5, 0.5, 0.5,
-3, -4.298951, -6.091321, 1, -0.5, 0.5, 0.5,
-3, -4.298951, -6.091321, 1, 1.5, 0.5, 0.5,
-3, -4.298951, -6.091321, 0, 1.5, 0.5, 0.5,
-2, -4.298951, -6.091321, 0, -0.5, 0.5, 0.5,
-2, -4.298951, -6.091321, 1, -0.5, 0.5, 0.5,
-2, -4.298951, -6.091321, 1, 1.5, 0.5, 0.5,
-2, -4.298951, -6.091321, 0, 1.5, 0.5, 0.5,
-1, -4.298951, -6.091321, 0, -0.5, 0.5, 0.5,
-1, -4.298951, -6.091321, 1, -0.5, 0.5, 0.5,
-1, -4.298951, -6.091321, 1, 1.5, 0.5, 0.5,
-1, -4.298951, -6.091321, 0, 1.5, 0.5, 0.5,
0, -4.298951, -6.091321, 0, -0.5, 0.5, 0.5,
0, -4.298951, -6.091321, 1, -0.5, 0.5, 0.5,
0, -4.298951, -6.091321, 1, 1.5, 0.5, 0.5,
0, -4.298951, -6.091321, 0, 1.5, 0.5, 0.5,
1, -4.298951, -6.091321, 0, -0.5, 0.5, 0.5,
1, -4.298951, -6.091321, 1, -0.5, 0.5, 0.5,
1, -4.298951, -6.091321, 1, 1.5, 0.5, 0.5,
1, -4.298951, -6.091321, 0, 1.5, 0.5, 0.5,
2, -4.298951, -6.091321, 0, -0.5, 0.5, 0.5,
2, -4.298951, -6.091321, 1, -0.5, 0.5, 0.5,
2, -4.298951, -6.091321, 1, 1.5, 0.5, 0.5,
2, -4.298951, -6.091321, 0, 1.5, 0.5, 0.5
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
-3.373838, -3, -5.332989,
-3.373838, 2, -5.332989,
-3.373838, -3, -5.332989,
-3.530794, -3, -5.585766,
-3.373838, -2, -5.332989,
-3.530794, -2, -5.585766,
-3.373838, -1, -5.332989,
-3.530794, -1, -5.585766,
-3.373838, 0, -5.332989,
-3.530794, 0, -5.585766,
-3.373838, 1, -5.332989,
-3.530794, 1, -5.585766,
-3.373838, 2, -5.332989,
-3.530794, 2, -5.585766
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
-3.844707, -3, -6.091321, 0, -0.5, 0.5, 0.5,
-3.844707, -3, -6.091321, 1, -0.5, 0.5, 0.5,
-3.844707, -3, -6.091321, 1, 1.5, 0.5, 0.5,
-3.844707, -3, -6.091321, 0, 1.5, 0.5, 0.5,
-3.844707, -2, -6.091321, 0, -0.5, 0.5, 0.5,
-3.844707, -2, -6.091321, 1, -0.5, 0.5, 0.5,
-3.844707, -2, -6.091321, 1, 1.5, 0.5, 0.5,
-3.844707, -2, -6.091321, 0, 1.5, 0.5, 0.5,
-3.844707, -1, -6.091321, 0, -0.5, 0.5, 0.5,
-3.844707, -1, -6.091321, 1, -0.5, 0.5, 0.5,
-3.844707, -1, -6.091321, 1, 1.5, 0.5, 0.5,
-3.844707, -1, -6.091321, 0, 1.5, 0.5, 0.5,
-3.844707, 0, -6.091321, 0, -0.5, 0.5, 0.5,
-3.844707, 0, -6.091321, 1, -0.5, 0.5, 0.5,
-3.844707, 0, -6.091321, 1, 1.5, 0.5, 0.5,
-3.844707, 0, -6.091321, 0, 1.5, 0.5, 0.5,
-3.844707, 1, -6.091321, 0, -0.5, 0.5, 0.5,
-3.844707, 1, -6.091321, 1, -0.5, 0.5, 0.5,
-3.844707, 1, -6.091321, 1, 1.5, 0.5, 0.5,
-3.844707, 1, -6.091321, 0, 1.5, 0.5, 0.5,
-3.844707, 2, -6.091321, 0, -0.5, 0.5, 0.5,
-3.844707, 2, -6.091321, 1, -0.5, 0.5, 0.5,
-3.844707, 2, -6.091321, 1, 1.5, 0.5, 0.5,
-3.844707, 2, -6.091321, 0, 1.5, 0.5, 0.5
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
-3.373838, -3.788905, -4,
-3.373838, -3.788905, 4,
-3.373838, -3.788905, -4,
-3.530794, -3.95892, -4,
-3.373838, -3.788905, -2,
-3.530794, -3.95892, -2,
-3.373838, -3.788905, 0,
-3.530794, -3.95892, 0,
-3.373838, -3.788905, 2,
-3.530794, -3.95892, 2,
-3.373838, -3.788905, 4,
-3.530794, -3.95892, 4
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
-3.844707, -4.298951, -4, 0, -0.5, 0.5, 0.5,
-3.844707, -4.298951, -4, 1, -0.5, 0.5, 0.5,
-3.844707, -4.298951, -4, 1, 1.5, 0.5, 0.5,
-3.844707, -4.298951, -4, 0, 1.5, 0.5, 0.5,
-3.844707, -4.298951, -2, 0, -0.5, 0.5, 0.5,
-3.844707, -4.298951, -2, 1, -0.5, 0.5, 0.5,
-3.844707, -4.298951, -2, 1, 1.5, 0.5, 0.5,
-3.844707, -4.298951, -2, 0, 1.5, 0.5, 0.5,
-3.844707, -4.298951, 0, 0, -0.5, 0.5, 0.5,
-3.844707, -4.298951, 0, 1, -0.5, 0.5, 0.5,
-3.844707, -4.298951, 0, 1, 1.5, 0.5, 0.5,
-3.844707, -4.298951, 0, 0, 1.5, 0.5, 0.5,
-3.844707, -4.298951, 2, 0, -0.5, 0.5, 0.5,
-3.844707, -4.298951, 2, 1, -0.5, 0.5, 0.5,
-3.844707, -4.298951, 2, 1, 1.5, 0.5, 0.5,
-3.844707, -4.298951, 2, 0, 1.5, 0.5, 0.5,
-3.844707, -4.298951, 4, 0, -0.5, 0.5, 0.5,
-3.844707, -4.298951, 4, 1, -0.5, 0.5, 0.5,
-3.844707, -4.298951, 4, 1, 1.5, 0.5, 0.5,
-3.844707, -4.298951, 4, 0, 1.5, 0.5, 0.5
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
-3.373838, -3.788905, -5.332989,
-3.373838, 3.011706, -5.332989,
-3.373838, -3.788905, 4.778097,
-3.373838, 3.011706, 4.778097,
-3.373838, -3.788905, -5.332989,
-3.373838, -3.788905, 4.778097,
-3.373838, 3.011706, -5.332989,
-3.373838, 3.011706, 4.778097,
-3.373838, -3.788905, -5.332989,
2.904413, -3.788905, -5.332989,
-3.373838, -3.788905, 4.778097,
2.904413, -3.788905, 4.778097,
-3.373838, 3.011706, -5.332989,
2.904413, 3.011706, -5.332989,
-3.373838, 3.011706, 4.778097,
2.904413, 3.011706, 4.778097,
2.904413, -3.788905, -5.332989,
2.904413, 3.011706, -5.332989,
2.904413, -3.788905, 4.778097,
2.904413, 3.011706, 4.778097,
2.904413, -3.788905, -5.332989,
2.904413, -3.788905, 4.778097,
2.904413, 3.011706, -5.332989,
2.904413, 3.011706, 4.778097
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
var radius = 7.319602;
var distance = 32.56573;
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
mvMatrix.translate( 0.2347125, 0.3885994, 0.2774463 );
mvMatrix.scale( 1.260558, 1.163733, 0.7827148 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.56573);
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
Zolone<-read.table("Zolone.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-Zolone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Zolone' not found
```

```r
y<-Zolone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Zolone' not found
```

```r
z<-Zolone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Zolone' not found
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
-3.282407, -1.325058, -1.430378, 0, 0, 1, 1, 1,
-3.224698, -0.4168483, -0.684539, 1, 0, 0, 1, 1,
-3.041038, 0.2124286, -1.710188, 1, 0, 0, 1, 1,
-2.695196, -1.896298, -1.111343, 1, 0, 0, 1, 1,
-2.68545, -1.686523, -3.841193, 1, 0, 0, 1, 1,
-2.561837, 1.059268, -2.942477, 1, 0, 0, 1, 1,
-2.557882, 0.4954207, -0.4267507, 0, 0, 0, 1, 1,
-2.481947, 0.5543393, -2.104344, 0, 0, 0, 1, 1,
-2.437473, 0.4590524, 0.2555892, 0, 0, 0, 1, 1,
-2.42805, -0.260722, -2.135868, 0, 0, 0, 1, 1,
-2.314871, 0.1087929, -1.024817, 0, 0, 0, 1, 1,
-2.308056, -1.6148, -2.636805, 0, 0, 0, 1, 1,
-2.262339, 0.4922545, -1.41327, 0, 0, 0, 1, 1,
-2.259741, -0.7235376, -0.8339416, 1, 1, 1, 1, 1,
-2.209477, 0.9814189, -1.139399, 1, 1, 1, 1, 1,
-2.194021, -0.5422691, -2.168235, 1, 1, 1, 1, 1,
-2.183221, -0.8838085, -3.20002, 1, 1, 1, 1, 1,
-2.131548, 0.1044044, -3.353841, 1, 1, 1, 1, 1,
-2.097445, 0.2491766, -1.792859, 1, 1, 1, 1, 1,
-2.092976, -0.612045, -0.1045521, 1, 1, 1, 1, 1,
-2.079214, 2.303361, 0.9040434, 1, 1, 1, 1, 1,
-2.07759, -0.3908226, -2.560378, 1, 1, 1, 1, 1,
-2.028378, 0.2144357, -2.42702, 1, 1, 1, 1, 1,
-2.027687, 1.448171, -1.506345, 1, 1, 1, 1, 1,
-2.012103, -1.032189, -4.143014, 1, 1, 1, 1, 1,
-1.990509, 0.02211265, -0.6034964, 1, 1, 1, 1, 1,
-1.984833, 0.1425025, -1.318541, 1, 1, 1, 1, 1,
-1.960688, 0.5327682, -3.039752, 1, 1, 1, 1, 1,
-1.889517, -2.211638, -0.6943592, 0, 0, 1, 1, 1,
-1.85817, -1.531516, -1.307692, 1, 0, 0, 1, 1,
-1.847756, 0.3429495, -2.259081, 1, 0, 0, 1, 1,
-1.835274, 1.085817, 0.01777873, 1, 0, 0, 1, 1,
-1.820296, 0.5502841, -1.227937, 1, 0, 0, 1, 1,
-1.806915, 0.26833, -0.9174008, 1, 0, 0, 1, 1,
-1.800799, 2.296379, -0.5525006, 0, 0, 0, 1, 1,
-1.795091, 0.5372114, -1.559018, 0, 0, 0, 1, 1,
-1.786193, -0.01471302, -2.572579, 0, 0, 0, 1, 1,
-1.75016, 0.2677879, -2.475063, 0, 0, 0, 1, 1,
-1.747571, -0.1367065, -1.456351, 0, 0, 0, 1, 1,
-1.744365, 0.5739901, 0.04125116, 0, 0, 0, 1, 1,
-1.71661, 0.595513, -1.178213, 0, 0, 0, 1, 1,
-1.71562, 0.3405823, -2.510141, 1, 1, 1, 1, 1,
-1.707416, 0.1610722, -0.8540745, 1, 1, 1, 1, 1,
-1.692188, -0.1992418, -0.453471, 1, 1, 1, 1, 1,
-1.691923, -0.3403072, -1.380355, 1, 1, 1, 1, 1,
-1.646945, 1.461586, -0.2761081, 1, 1, 1, 1, 1,
-1.641106, 0.1283718, -0.9225394, 1, 1, 1, 1, 1,
-1.639245, 0.9183936, -0.24293, 1, 1, 1, 1, 1,
-1.632701, 1.361141, -1.737349, 1, 1, 1, 1, 1,
-1.618557, 0.3225442, -0.8212789, 1, 1, 1, 1, 1,
-1.614079, -0.3246239, -1.22403, 1, 1, 1, 1, 1,
-1.603413, 0.6430923, -0.670299, 1, 1, 1, 1, 1,
-1.603165, -1.488417, -1.94839, 1, 1, 1, 1, 1,
-1.60251, 0.604646, -2.18106, 1, 1, 1, 1, 1,
-1.601625, -1.416504, -2.054901, 1, 1, 1, 1, 1,
-1.581726, -0.5491847, -0.5922791, 1, 1, 1, 1, 1,
-1.569829, -1.124049, -4.222175, 0, 0, 1, 1, 1,
-1.56447, -2.194512, -1.591046, 1, 0, 0, 1, 1,
-1.561929, -0.7383727, -1.534238, 1, 0, 0, 1, 1,
-1.547332, -1.295917, -3.092457, 1, 0, 0, 1, 1,
-1.522582, -1.303703, -2.580727, 1, 0, 0, 1, 1,
-1.515352, -1.13808, -1.75911, 1, 0, 0, 1, 1,
-1.49725, 0.5354738, -2.234975, 0, 0, 0, 1, 1,
-1.493276, -0.09976845, -0.6398504, 0, 0, 0, 1, 1,
-1.491894, 1.596092, -0.7425351, 0, 0, 0, 1, 1,
-1.482866, 1.089246, -1.771695, 0, 0, 0, 1, 1,
-1.452883, 2.282623, -0.6637968, 0, 0, 0, 1, 1,
-1.4453, 0.2291316, -1.167697, 0, 0, 0, 1, 1,
-1.43671, 0.07692603, -1.759522, 0, 0, 0, 1, 1,
-1.432782, -0.4893205, -1.724838, 1, 1, 1, 1, 1,
-1.429673, 0.5668681, -0.7297654, 1, 1, 1, 1, 1,
-1.427857, -0.4501998, -2.391147, 1, 1, 1, 1, 1,
-1.4199, 0.6904588, -2.686224, 1, 1, 1, 1, 1,
-1.41759, 0.6975724, -3.144575, 1, 1, 1, 1, 1,
-1.417151, -0.4061255, -2.451176, 1, 1, 1, 1, 1,
-1.40658, 0.9272571, -0.8333754, 1, 1, 1, 1, 1,
-1.40255, 0.2653164, -3.181683, 1, 1, 1, 1, 1,
-1.38997, -1.076357, -2.925052, 1, 1, 1, 1, 1,
-1.378658, 1.645815, -1.432582, 1, 1, 1, 1, 1,
-1.348632, 2.912668, 0.1188661, 1, 1, 1, 1, 1,
-1.348361, -1.194155, -1.899436, 1, 1, 1, 1, 1,
-1.341577, -0.1281573, -1.96481, 1, 1, 1, 1, 1,
-1.333585, 0.261689, -0.4617774, 1, 1, 1, 1, 1,
-1.323734, -1.396092, -1.920199, 1, 1, 1, 1, 1,
-1.32049, 1.068839, 0.005719794, 0, 0, 1, 1, 1,
-1.318487, 1.447266, -1.509423, 1, 0, 0, 1, 1,
-1.316622, 1.579734, -0.8871278, 1, 0, 0, 1, 1,
-1.306699, 0.2612815, -2.438711, 1, 0, 0, 1, 1,
-1.306207, 0.09731424, -0.9247565, 1, 0, 0, 1, 1,
-1.30335, 2.061342, -0.7187619, 1, 0, 0, 1, 1,
-1.301163, 0.3023823, -1.732596, 0, 0, 0, 1, 1,
-1.291673, 1.590538, -1.632443, 0, 0, 0, 1, 1,
-1.281951, 1.22351, -0.8448357, 0, 0, 0, 1, 1,
-1.269125, -0.07859682, -1.286999, 0, 0, 0, 1, 1,
-1.264786, 0.6412281, -2.318366, 0, 0, 0, 1, 1,
-1.263085, 0.1402528, -2.410436, 0, 0, 0, 1, 1,
-1.262724, 0.7352126, -0.3776079, 0, 0, 0, 1, 1,
-1.261211, -0.8480271, -2.966594, 1, 1, 1, 1, 1,
-1.259409, 0.6943213, -1.516065, 1, 1, 1, 1, 1,
-1.258577, 2.363063, -0.1617917, 1, 1, 1, 1, 1,
-1.253959, -0.7257757, -3.435066, 1, 1, 1, 1, 1,
-1.243398, 0.4975471, -0.1283731, 1, 1, 1, 1, 1,
-1.226718, 1.003881, -2.466792, 1, 1, 1, 1, 1,
-1.225976, -0.008597343, -1.621426, 1, 1, 1, 1, 1,
-1.219765, -1.02448, -3.419159, 1, 1, 1, 1, 1,
-1.210625, 1.267783, -0.3827156, 1, 1, 1, 1, 1,
-1.192377, -0.7466876, -2.489123, 1, 1, 1, 1, 1,
-1.187878, -0.6823796, -2.118382, 1, 1, 1, 1, 1,
-1.181144, 1.364847, -0.4734669, 1, 1, 1, 1, 1,
-1.165648, -0.06837989, -2.597458, 1, 1, 1, 1, 1,
-1.153248, -0.5952711, 0.2110789, 1, 1, 1, 1, 1,
-1.151509, 0.03305518, -2.063256, 1, 1, 1, 1, 1,
-1.129733, -1.627572, -2.551868, 0, 0, 1, 1, 1,
-1.123254, -0.3870291, -0.7571446, 1, 0, 0, 1, 1,
-1.121136, 0.1108945, -1.291152, 1, 0, 0, 1, 1,
-1.117625, -1.045038, -2.589264, 1, 0, 0, 1, 1,
-1.109837, -1.278458, -1.870761, 1, 0, 0, 1, 1,
-1.106028, 0.0265595, -0.07248463, 1, 0, 0, 1, 1,
-1.100187, -0.8503562, -1.69269, 0, 0, 0, 1, 1,
-1.099374, 1.118744, -0.003135771, 0, 0, 0, 1, 1,
-1.098446, -1.129673, -1.796086, 0, 0, 0, 1, 1,
-1.087189, -0.3414519, -0.9141829, 0, 0, 0, 1, 1,
-1.085675, -0.8348286, -1.344761, 0, 0, 0, 1, 1,
-1.073092, -0.4930556, -2.594863, 0, 0, 0, 1, 1,
-1.069516, -1.083871, -3.65661, 0, 0, 0, 1, 1,
-1.066491, -0.4754426, -1.571448, 1, 1, 1, 1, 1,
-1.060824, 0.2170698, -0.9718288, 1, 1, 1, 1, 1,
-1.049468, 0.5277368, -2.45118, 1, 1, 1, 1, 1,
-1.043087, -1.188405, -4.557515, 1, 1, 1, 1, 1,
-1.036763, -0.1571434, 0.08280322, 1, 1, 1, 1, 1,
-1.035655, 0.6450706, -2.127641, 1, 1, 1, 1, 1,
-1.03209, -0.6301004, -2.892874, 1, 1, 1, 1, 1,
-1.032027, 0.2451675, -1.390518, 1, 1, 1, 1, 1,
-1.030432, 0.2643511, -2.592235, 1, 1, 1, 1, 1,
-1.027338, -0.08285191, -2.927723, 1, 1, 1, 1, 1,
-1.022599, -0.9635509, -2.222157, 1, 1, 1, 1, 1,
-1.017997, -0.6590391, -3.548733, 1, 1, 1, 1, 1,
-1.017315, -0.09498211, -0.001811874, 1, 1, 1, 1, 1,
-1.0086, 1.369092, -0.4855203, 1, 1, 1, 1, 1,
-1.008249, -1.172181, -2.953402, 1, 1, 1, 1, 1,
-0.9995619, 1.286688, -0.1840711, 0, 0, 1, 1, 1,
-0.9974805, 1.085298, 0.131114, 1, 0, 0, 1, 1,
-0.9956665, -0.4871009, -1.37856, 1, 0, 0, 1, 1,
-0.993281, -1.18192, -3.185459, 1, 0, 0, 1, 1,
-0.9858853, -1.170916, -1.278557, 1, 0, 0, 1, 1,
-0.9842008, -0.8463171, -1.450988, 1, 0, 0, 1, 1,
-0.9785375, 1.071982, -3.030566, 0, 0, 0, 1, 1,
-0.9767113, 0.28446, -0.05932002, 0, 0, 0, 1, 1,
-0.9759701, -1.674087, -4.827656, 0, 0, 0, 1, 1,
-0.9729733, -0.8730028, -0.8739304, 0, 0, 0, 1, 1,
-0.9657704, -0.8995796, -3.304528, 0, 0, 0, 1, 1,
-0.9651199, 0.04845149, -0.2802213, 0, 0, 0, 1, 1,
-0.9486281, 0.3950555, -1.710997, 0, 0, 0, 1, 1,
-0.9454742, -0.2870789, -3.511396, 1, 1, 1, 1, 1,
-0.9449994, 0.1525823, -2.339278, 1, 1, 1, 1, 1,
-0.9415799, -1.551058, 0.01141991, 1, 1, 1, 1, 1,
-0.9403467, 0.7179289, -0.8652492, 1, 1, 1, 1, 1,
-0.9371921, 1.434574, -1.450623, 1, 1, 1, 1, 1,
-0.9347263, -0.0164642, -2.128769, 1, 1, 1, 1, 1,
-0.9345275, -1.041975, -3.473761, 1, 1, 1, 1, 1,
-0.9324127, 0.6422822, -0.8730659, 1, 1, 1, 1, 1,
-0.9308499, -0.1137967, -0.04702567, 1, 1, 1, 1, 1,
-0.9281985, 1.099275, -0.3928143, 1, 1, 1, 1, 1,
-0.9266728, 0.2344074, -1.474261, 1, 1, 1, 1, 1,
-0.923687, 1.806882, -2.039762, 1, 1, 1, 1, 1,
-0.922321, -1.87605, -1.668197, 1, 1, 1, 1, 1,
-0.9191105, 0.1765212, -2.115726, 1, 1, 1, 1, 1,
-0.9113101, -1.608207, -1.711383, 1, 1, 1, 1, 1,
-0.9063959, 0.03112898, -2.401748, 0, 0, 1, 1, 1,
-0.9059131, -0.6968929, -4.566218, 1, 0, 0, 1, 1,
-0.9047405, -0.0479995, -1.325942, 1, 0, 0, 1, 1,
-0.9040989, 1.483388, -0.7627787, 1, 0, 0, 1, 1,
-0.9036195, 0.4402854, -1.99244, 1, 0, 0, 1, 1,
-0.8996766, 2.873387, -0.7725155, 1, 0, 0, 1, 1,
-0.8971279, 1.078357, 0.2971567, 0, 0, 0, 1, 1,
-0.8924421, -0.3142882, -0.3313743, 0, 0, 0, 1, 1,
-0.8892267, -0.6391265, -2.837827, 0, 0, 0, 1, 1,
-0.8880765, -0.5298053, -2.020799, 0, 0, 0, 1, 1,
-0.8874607, -0.829926, -1.628114, 0, 0, 0, 1, 1,
-0.8874536, -0.3144141, -1.748806, 0, 0, 0, 1, 1,
-0.8853866, 2.755401, -0.09165109, 0, 0, 0, 1, 1,
-0.8846452, 0.2003152, -3.347046, 1, 1, 1, 1, 1,
-0.8833863, 1.853064, -1.860027, 1, 1, 1, 1, 1,
-0.8814494, 0.5130005, -0.6293326, 1, 1, 1, 1, 1,
-0.8798023, -0.953688, -2.438517, 1, 1, 1, 1, 1,
-0.8763885, -0.6799127, -2.987083, 1, 1, 1, 1, 1,
-0.8757397, -1.119263, -2.195452, 1, 1, 1, 1, 1,
-0.8739672, -0.2119114, -2.46119, 1, 1, 1, 1, 1,
-0.8682556, 0.8371258, 0.04371284, 1, 1, 1, 1, 1,
-0.8603577, 0.0699454, -1.631534, 1, 1, 1, 1, 1,
-0.8594334, 1.168851, -1.237996, 1, 1, 1, 1, 1,
-0.8540646, -1.47569, -2.436705, 1, 1, 1, 1, 1,
-0.8501348, -0.3296493, -1.91196, 1, 1, 1, 1, 1,
-0.8485017, -0.7649956, -3.332612, 1, 1, 1, 1, 1,
-0.8407786, 0.3955603, -0.8282569, 1, 1, 1, 1, 1,
-0.8385912, 1.712887, 0.4166272, 1, 1, 1, 1, 1,
-0.8345607, 0.03024197, -2.801661, 0, 0, 1, 1, 1,
-0.8339056, -0.1126343, -1.49241, 1, 0, 0, 1, 1,
-0.8312458, 0.1235515, -1.458891, 1, 0, 0, 1, 1,
-0.8296649, 0.9532985, -1.112447, 1, 0, 0, 1, 1,
-0.8230726, 0.1623891, -0.4010012, 1, 0, 0, 1, 1,
-0.8201275, -1.045843, -1.143389, 1, 0, 0, 1, 1,
-0.8186601, -1.024049, -3.420171, 0, 0, 0, 1, 1,
-0.8146709, -0.2043407, -1.871709, 0, 0, 0, 1, 1,
-0.8001246, -1.496838, -0.1395385, 0, 0, 0, 1, 1,
-0.7990903, -0.8832921, -2.88602, 0, 0, 0, 1, 1,
-0.7965108, 1.314553, -0.4972112, 0, 0, 0, 1, 1,
-0.795716, 2.391805, -0.7710361, 0, 0, 0, 1, 1,
-0.7942196, 0.8820387, -0.2603712, 0, 0, 0, 1, 1,
-0.7930975, 0.2236803, -0.89962, 1, 1, 1, 1, 1,
-0.7875205, 0.8399177, 0.7677245, 1, 1, 1, 1, 1,
-0.783529, -0.7363451, -2.611969, 1, 1, 1, 1, 1,
-0.7808495, 0.4337151, -0.8424115, 1, 1, 1, 1, 1,
-0.7787481, 0.4933852, -1.810344, 1, 1, 1, 1, 1,
-0.7737903, 0.05048113, -1.298462, 1, 1, 1, 1, 1,
-0.7710276, 1.233755, 1.567677, 1, 1, 1, 1, 1,
-0.7700535, -1.026363, -2.85515, 1, 1, 1, 1, 1,
-0.7699468, 0.1863658, -1.466267, 1, 1, 1, 1, 1,
-0.7692586, -0.7977421, -4.113863, 1, 1, 1, 1, 1,
-0.7659373, 0.01015623, -0.1155285, 1, 1, 1, 1, 1,
-0.7614937, 1.195857, -0.3469382, 1, 1, 1, 1, 1,
-0.7612345, -0.6321017, -3.333317, 1, 1, 1, 1, 1,
-0.760033, 1.274544, -0.7549541, 1, 1, 1, 1, 1,
-0.7544359, -1.49853, -4.570918, 1, 1, 1, 1, 1,
-0.7391402, -1.531077, -2.884439, 0, 0, 1, 1, 1,
-0.7220891, 0.1515048, -0.9152863, 1, 0, 0, 1, 1,
-0.7213632, 0.05307494, -0.804017, 1, 0, 0, 1, 1,
-0.7198694, -0.0736836, -2.290316, 1, 0, 0, 1, 1,
-0.7182124, -0.6116795, -2.967678, 1, 0, 0, 1, 1,
-0.7133881, -0.9539529, -1.678413, 1, 0, 0, 1, 1,
-0.7056352, 0.08281361, -0.7061965, 0, 0, 0, 1, 1,
-0.7053617, -0.57328, -0.9064397, 0, 0, 0, 1, 1,
-0.7012154, 1.548818, -0.3425986, 0, 0, 0, 1, 1,
-0.6947292, -0.6809424, -3.091225, 0, 0, 0, 1, 1,
-0.6946935, 0.2398399, -0.5056115, 0, 0, 0, 1, 1,
-0.6940064, -0.8846062, -1.925857, 0, 0, 0, 1, 1,
-0.6931731, -0.5704438, -1.292755, 0, 0, 0, 1, 1,
-0.6868822, 0.5495723, -0.9730461, 1, 1, 1, 1, 1,
-0.6859068, 0.3859423, 0.008728671, 1, 1, 1, 1, 1,
-0.6804977, -0.6663073, -2.125165, 1, 1, 1, 1, 1,
-0.6800093, -0.338729, -3.643574, 1, 1, 1, 1, 1,
-0.6744371, 0.5671954, 0.2589214, 1, 1, 1, 1, 1,
-0.6739835, 1.032866, 1.218821, 1, 1, 1, 1, 1,
-0.6676162, -0.1320325, -1.093357, 1, 1, 1, 1, 1,
-0.6673797, -0.4553917, -2.155776, 1, 1, 1, 1, 1,
-0.6671749, -0.9235945, -3.552315, 1, 1, 1, 1, 1,
-0.6630301, 0.8865173, -1.628246, 1, 1, 1, 1, 1,
-0.6627685, -1.310577, -1.846202, 1, 1, 1, 1, 1,
-0.6614695, 1.445059, -0.2567264, 1, 1, 1, 1, 1,
-0.6584464, -0.02405966, -1.628721, 1, 1, 1, 1, 1,
-0.6574628, -0.5504496, -2.688286, 1, 1, 1, 1, 1,
-0.6574374, 0.2520827, -2.502417, 1, 1, 1, 1, 1,
-0.6562147, -0.2737486, -2.153723, 0, 0, 1, 1, 1,
-0.6524546, 0.7529455, -1.023902, 1, 0, 0, 1, 1,
-0.6512336, -0.5460558, -2.826416, 1, 0, 0, 1, 1,
-0.6494262, -0.6970903, -2.612376, 1, 0, 0, 1, 1,
-0.6420321, -1.431627, -2.780911, 1, 0, 0, 1, 1,
-0.6387708, 1.423797, -0.4519605, 1, 0, 0, 1, 1,
-0.6318635, 1.05775, -1.075911, 0, 0, 0, 1, 1,
-0.6318262, 1.483343, 0.2426949, 0, 0, 0, 1, 1,
-0.631184, -0.6489567, -1.692982, 0, 0, 0, 1, 1,
-0.6303678, 0.9684891, -0.32055, 0, 0, 0, 1, 1,
-0.6299284, -0.3230958, -0.5940523, 0, 0, 0, 1, 1,
-0.6272444, -0.913707, -3.705698, 0, 0, 0, 1, 1,
-0.6250638, -0.8229321, -2.556292, 0, 0, 0, 1, 1,
-0.6037169, 0.567939, -1.256681, 1, 1, 1, 1, 1,
-0.603555, -0.6907027, -3.303804, 1, 1, 1, 1, 1,
-0.5996593, -0.7267708, -2.688016, 1, 1, 1, 1, 1,
-0.5987561, 0.9223241, -0.9580144, 1, 1, 1, 1, 1,
-0.5974195, -1.682647, -1.731438, 1, 1, 1, 1, 1,
-0.5928885, -0.8625812, -1.504183, 1, 1, 1, 1, 1,
-0.5899784, -0.05875479, -1.874596, 1, 1, 1, 1, 1,
-0.583159, 0.3865082, -2.090953, 1, 1, 1, 1, 1,
-0.5800216, 0.5750608, 0.184838, 1, 1, 1, 1, 1,
-0.5775285, 0.190274, 0.132003, 1, 1, 1, 1, 1,
-0.5721934, 0.4069749, -1.246191, 1, 1, 1, 1, 1,
-0.5712061, 1.119947, 0.2720168, 1, 1, 1, 1, 1,
-0.5705962, 0.2710837, -2.808213, 1, 1, 1, 1, 1,
-0.5691553, -0.1991629, -1.960517, 1, 1, 1, 1, 1,
-0.5669582, -0.136014, -1.687709, 1, 1, 1, 1, 1,
-0.5651857, 0.1186079, -1.020306, 0, 0, 1, 1, 1,
-0.5604672, 1.084048, -2.043867, 1, 0, 0, 1, 1,
-0.5596877, -0.2564685, -2.029035, 1, 0, 0, 1, 1,
-0.5561923, 0.2727459, -1.462575, 1, 0, 0, 1, 1,
-0.5487747, 1.090696, -0.09163105, 1, 0, 0, 1, 1,
-0.5424539, 0.5973552, -1.515703, 1, 0, 0, 1, 1,
-0.5413439, 0.3722886, -1.533804, 0, 0, 0, 1, 1,
-0.5316806, -1.294089, -4.588729, 0, 0, 0, 1, 1,
-0.5314213, -0.1912868, -1.336654, 0, 0, 0, 1, 1,
-0.528506, -0.4319337, -2.084543, 0, 0, 0, 1, 1,
-0.5267602, 0.5180026, -0.6006034, 0, 0, 0, 1, 1,
-0.5253193, 1.139735, -1.343616, 0, 0, 0, 1, 1,
-0.5221951, -1.042399, -2.662595, 0, 0, 0, 1, 1,
-0.5188444, -1.047869, -2.982007, 1, 1, 1, 1, 1,
-0.5187843, 0.3511321, -0.07932182, 1, 1, 1, 1, 1,
-0.5186186, -1.408187, -1.826772, 1, 1, 1, 1, 1,
-0.5178704, -1.217391, -0.9248179, 1, 1, 1, 1, 1,
-0.5141979, 0.989316, -0.5487541, 1, 1, 1, 1, 1,
-0.5136665, -1.932835, -2.633606, 1, 1, 1, 1, 1,
-0.5130036, 0.3232403, 0.4474853, 1, 1, 1, 1, 1,
-0.5037702, -0.3616522, -2.514486, 1, 1, 1, 1, 1,
-0.5003832, 2.022869, 1.030126, 1, 1, 1, 1, 1,
-0.4927013, 0.6801325, -0.8597229, 1, 1, 1, 1, 1,
-0.4848479, 0.3520869, -1.991775, 1, 1, 1, 1, 1,
-0.4827287, -0.3599702, -1.106982, 1, 1, 1, 1, 1,
-0.4773594, -0.1064877, -0.3678458, 1, 1, 1, 1, 1,
-0.4763239, 0.2135926, -0.860161, 1, 1, 1, 1, 1,
-0.475468, -0.3906032, -2.10113, 1, 1, 1, 1, 1,
-0.4748887, 0.1915263, -1.495673, 0, 0, 1, 1, 1,
-0.4748616, -0.07078476, -1.135753, 1, 0, 0, 1, 1,
-0.4708033, -0.5377928, -3.67616, 1, 0, 0, 1, 1,
-0.4681302, -0.6911282, -3.62798, 1, 0, 0, 1, 1,
-0.4642073, 0.7358893, 1.055262, 1, 0, 0, 1, 1,
-0.4604128, -0.5122043, -2.874476, 1, 0, 0, 1, 1,
-0.4535794, 0.2616672, 0.8566293, 0, 0, 0, 1, 1,
-0.4448237, 0.5122775, -0.7635763, 0, 0, 0, 1, 1,
-0.4421781, -0.6412302, -3.819532, 0, 0, 0, 1, 1,
-0.4412694, 0.7625954, 0.1240496, 0, 0, 0, 1, 1,
-0.4388999, -0.7487703, -2.439108, 0, 0, 0, 1, 1,
-0.4361584, 0.4257726, -0.7855373, 0, 0, 0, 1, 1,
-0.4349222, 1.58714, 0.5759915, 0, 0, 0, 1, 1,
-0.4324509, 0.6890129, -0.5764405, 1, 1, 1, 1, 1,
-0.4288543, -0.09346231, -2.585293, 1, 1, 1, 1, 1,
-0.4272479, -1.648247, -2.84395, 1, 1, 1, 1, 1,
-0.4259467, 0.4517803, -0.4636689, 1, 1, 1, 1, 1,
-0.4209599, -0.955463, -1.117564, 1, 1, 1, 1, 1,
-0.4204674, -0.2210055, -1.018031, 1, 1, 1, 1, 1,
-0.4176188, 0.6632625, -1.897439, 1, 1, 1, 1, 1,
-0.417047, -0.5564466, -3.19265, 1, 1, 1, 1, 1,
-0.4137039, 0.4444628, 0.1659062, 1, 1, 1, 1, 1,
-0.4116012, -0.7437345, -1.183017, 1, 1, 1, 1, 1,
-0.4065277, 2.003256, -0.4957043, 1, 1, 1, 1, 1,
-0.405722, 0.7360712, 0.5039331, 1, 1, 1, 1, 1,
-0.4029703, 0.1362921, 1.417236, 1, 1, 1, 1, 1,
-0.4022223, 1.04598, -1.031083, 1, 1, 1, 1, 1,
-0.4001132, 1.107149, 0.6204162, 1, 1, 1, 1, 1,
-0.3994647, 1.335593, -0.4483419, 0, 0, 1, 1, 1,
-0.3968727, -0.8651314, -1.476993, 1, 0, 0, 1, 1,
-0.3963586, 0.5598376, -0.2937163, 1, 0, 0, 1, 1,
-0.3927224, -0.3374681, -2.135327, 1, 0, 0, 1, 1,
-0.3901255, 0.04270177, -2.758772, 1, 0, 0, 1, 1,
-0.3871263, -0.08869345, -2.316035, 1, 0, 0, 1, 1,
-0.3855593, 0.9589112, 0.1144307, 0, 0, 0, 1, 1,
-0.3819409, 1.020777, -1.107296, 0, 0, 0, 1, 1,
-0.3816165, 0.8098429, -1.61668, 0, 0, 0, 1, 1,
-0.3792968, 1.344195, -1.814706, 0, 0, 0, 1, 1,
-0.3765898, 1.084927, -0.8648531, 0, 0, 0, 1, 1,
-0.3750133, -0.5679291, -4.3543, 0, 0, 0, 1, 1,
-0.3724993, 1.027257, -0.5113862, 0, 0, 0, 1, 1,
-0.3719711, -1.59033, -3.498585, 1, 1, 1, 1, 1,
-0.3689879, -0.3938897, -2.529776, 1, 1, 1, 1, 1,
-0.3632899, 1.219789, 0.9796572, 1, 1, 1, 1, 1,
-0.3631046, -1.314738, -3.802202, 1, 1, 1, 1, 1,
-0.3601999, 0.7657577, -0.353024, 1, 1, 1, 1, 1,
-0.359809, -1.559317, -3.004454, 1, 1, 1, 1, 1,
-0.3539391, 0.975825, -0.159279, 1, 1, 1, 1, 1,
-0.3500009, -1.492232, -3.889982, 1, 1, 1, 1, 1,
-0.3492678, -1.114556, -2.150496, 1, 1, 1, 1, 1,
-0.3446681, 0.9089179, -1.383045, 1, 1, 1, 1, 1,
-0.3378911, 1.342236, -0.008999336, 1, 1, 1, 1, 1,
-0.3281221, 0.9729683, -1.094682, 1, 1, 1, 1, 1,
-0.3265886, -0.1481794, -1.101049, 1, 1, 1, 1, 1,
-0.3239277, -0.1412964, -1.413285, 1, 1, 1, 1, 1,
-0.3207352, -0.516089, -2.470273, 1, 1, 1, 1, 1,
-0.3196358, 0.1087109, -0.3402658, 0, 0, 1, 1, 1,
-0.3193243, -0.580373, -3.886691, 1, 0, 0, 1, 1,
-0.3177185, 1.538, -0.2470649, 1, 0, 0, 1, 1,
-0.309873, -0.108913, 0.5654039, 1, 0, 0, 1, 1,
-0.307702, -0.001909212, -1.013913, 1, 0, 0, 1, 1,
-0.3075882, -1.225025, -2.004115, 1, 0, 0, 1, 1,
-0.2973789, 0.0316814, -2.913341, 0, 0, 0, 1, 1,
-0.2950248, -0.9711398, -2.812054, 0, 0, 0, 1, 1,
-0.2860574, -0.7810419, -2.784136, 0, 0, 0, 1, 1,
-0.2849023, -0.06024081, -4.706963, 0, 0, 0, 1, 1,
-0.2818674, -0.6883991, -2.225618, 0, 0, 0, 1, 1,
-0.2762628, 0.1199899, -1.409568, 0, 0, 0, 1, 1,
-0.274496, 1.380658, -0.8551463, 0, 0, 0, 1, 1,
-0.2702423, -0.02808053, -0.03992387, 1, 1, 1, 1, 1,
-0.2684537, -1.505617, -1.719948, 1, 1, 1, 1, 1,
-0.2664709, 1.275806, 0.2983723, 1, 1, 1, 1, 1,
-0.2653277, 1.645073, -0.785832, 1, 1, 1, 1, 1,
-0.2617324, 0.2870081, -0.9133881, 1, 1, 1, 1, 1,
-0.2607788, -0.9217407, -3.057125, 1, 1, 1, 1, 1,
-0.2578313, 0.6913454, 0.1279916, 1, 1, 1, 1, 1,
-0.255391, 0.3003464, 0.2584129, 1, 1, 1, 1, 1,
-0.254939, 0.4612619, -0.6500343, 1, 1, 1, 1, 1,
-0.2504832, -0.9878296, -2.327959, 1, 1, 1, 1, 1,
-0.2475039, -0.4678423, -4.342995, 1, 1, 1, 1, 1,
-0.2403717, -0.1095895, -3.420278, 1, 1, 1, 1, 1,
-0.2337849, -0.229321, -2.449037, 1, 1, 1, 1, 1,
-0.2303489, -1.075069, -2.036947, 1, 1, 1, 1, 1,
-0.2302825, -0.1599668, -2.123905, 1, 1, 1, 1, 1,
-0.2293747, -1.542184, -2.194423, 0, 0, 1, 1, 1,
-0.2284204, -0.1151731, -2.083612, 1, 0, 0, 1, 1,
-0.2277077, 0.4773879, 0.4887181, 1, 0, 0, 1, 1,
-0.2217949, -1.626412, -3.964738, 1, 0, 0, 1, 1,
-0.2172171, -0.4723638, -1.965108, 1, 0, 0, 1, 1,
-0.2164117, 0.3437616, 0.2652173, 1, 0, 0, 1, 1,
-0.2133419, -1.247603, -5.18574, 0, 0, 0, 1, 1,
-0.2131669, -0.6735876, -2.210619, 0, 0, 0, 1, 1,
-0.210787, -0.1824527, -3.318505, 0, 0, 0, 1, 1,
-0.210076, -0.784879, -2.986519, 0, 0, 0, 1, 1,
-0.2052452, 0.7618592, -1.279077, 0, 0, 0, 1, 1,
-0.2044504, 0.8053835, 0.5856472, 0, 0, 0, 1, 1,
-0.2029504, 0.3315757, -1.472976, 0, 0, 0, 1, 1,
-0.1985231, -0.3532945, -1.456307, 1, 1, 1, 1, 1,
-0.1981729, -1.179499, -3.213829, 1, 1, 1, 1, 1,
-0.1978283, -1.763439, -2.805679, 1, 1, 1, 1, 1,
-0.1958946, 0.4192453, -1.422849, 1, 1, 1, 1, 1,
-0.1889895, -0.6054819, -2.412378, 1, 1, 1, 1, 1,
-0.1879061, 0.4108165, -0.9570925, 1, 1, 1, 1, 1,
-0.1869858, 0.4667962, -0.7452062, 1, 1, 1, 1, 1,
-0.1794678, 0.7751466, -1.322981, 1, 1, 1, 1, 1,
-0.1700609, -0.6922156, -2.425988, 1, 1, 1, 1, 1,
-0.1693294, 0.416679, 0.02239867, 1, 1, 1, 1, 1,
-0.1682009, 1.042308, -0.3536731, 1, 1, 1, 1, 1,
-0.1661697, -0.8897728, -2.365973, 1, 1, 1, 1, 1,
-0.164951, -0.672637, -2.936002, 1, 1, 1, 1, 1,
-0.1643636, -2.038908, -3.576999, 1, 1, 1, 1, 1,
-0.1632005, -0.03175801, -2.177387, 1, 1, 1, 1, 1,
-0.1629753, 0.3848399, -0.3976744, 0, 0, 1, 1, 1,
-0.155808, 0.8708242, 0.8902724, 1, 0, 0, 1, 1,
-0.1542897, -2.162267, -4.128528, 1, 0, 0, 1, 1,
-0.1518437, 0.3934016, 0.8782626, 1, 0, 0, 1, 1,
-0.1516809, 2.528405, 0.1057457, 1, 0, 0, 1, 1,
-0.1500127, 0.01515875, -0.6110845, 1, 0, 0, 1, 1,
-0.1468552, -3.391779, -4.758265, 0, 0, 0, 1, 1,
-0.1459665, 0.4335973, 1.556693, 0, 0, 0, 1, 1,
-0.1456287, 0.7909082, -0.09627987, 0, 0, 0, 1, 1,
-0.1455507, -0.4102209, -1.17197, 0, 0, 0, 1, 1,
-0.1393761, 0.3236228, 0.02120966, 0, 0, 0, 1, 1,
-0.1371759, 0.7814519, 0.07122903, 0, 0, 0, 1, 1,
-0.1331427, 0.7382086, -0.400489, 0, 0, 0, 1, 1,
-0.1331077, -0.8751656, -1.130372, 1, 1, 1, 1, 1,
-0.1325592, 0.8323263, -0.199212, 1, 1, 1, 1, 1,
-0.1312893, 0.3518145, -0.6039633, 1, 1, 1, 1, 1,
-0.1270801, -0.6264996, -1.494688, 1, 1, 1, 1, 1,
-0.1095478, -0.2900169, -4.18328, 1, 1, 1, 1, 1,
-0.1054324, -0.558313, -2.505149, 1, 1, 1, 1, 1,
-0.1013972, -0.8253433, -1.831541, 1, 1, 1, 1, 1,
-0.1010658, 2.276274, -1.417587, 1, 1, 1, 1, 1,
-0.09687984, 0.0506287, -3.050238, 1, 1, 1, 1, 1,
-0.09046393, 0.5219089, -2.817442, 1, 1, 1, 1, 1,
-0.0904451, 0.7914597, -0.02321866, 1, 1, 1, 1, 1,
-0.09037776, -0.7992603, -3.384863, 1, 1, 1, 1, 1,
-0.08673278, -1.333478, -3.49754, 1, 1, 1, 1, 1,
-0.08630856, -0.345432, -1.650331, 1, 1, 1, 1, 1,
-0.08082596, -0.3566413, -2.791683, 1, 1, 1, 1, 1,
-0.07863813, 0.3694264, 0.2705131, 0, 0, 1, 1, 1,
-0.07211009, -0.5122622, -3.059524, 1, 0, 0, 1, 1,
-0.07192347, 1.194142, -1.531446, 1, 0, 0, 1, 1,
-0.0716864, -0.007539564, -2.615201, 1, 0, 0, 1, 1,
-0.06986778, 0.8891069, -2.159815, 1, 0, 0, 1, 1,
-0.06709318, -0.6755302, -1.954979, 1, 0, 0, 1, 1,
-0.06382682, -1.811934, -2.990866, 0, 0, 0, 1, 1,
-0.06013393, -1.101723, -2.936018, 0, 0, 0, 1, 1,
-0.05186038, -0.3464943, -3.930944, 0, 0, 0, 1, 1,
-0.05072737, -0.02562243, -3.800198, 0, 0, 0, 1, 1,
-0.04886601, -0.5538515, -3.364627, 0, 0, 0, 1, 1,
-0.04867103, 0.2092499, -0.5031974, 0, 0, 0, 1, 1,
-0.04771003, 0.8746054, 0.2438399, 0, 0, 0, 1, 1,
-0.0455418, 1.883694, 0.4704825, 1, 1, 1, 1, 1,
-0.04403208, -0.4140366, -2.047815, 1, 1, 1, 1, 1,
-0.03749501, 0.9255903, -0.8180798, 1, 1, 1, 1, 1,
-0.03592453, 0.9755935, 0.5541725, 1, 1, 1, 1, 1,
-0.02953895, -0.5374202, -3.049629, 1, 1, 1, 1, 1,
-0.02721945, -0.3434135, -3.571191, 1, 1, 1, 1, 1,
-0.02697432, 0.5808036, -0.4821249, 1, 1, 1, 1, 1,
-0.02629274, 0.3441558, -0.07777176, 1, 1, 1, 1, 1,
-0.02518048, 0.5335439, -0.2346033, 1, 1, 1, 1, 1,
-0.02053809, -0.0006384315, -1.938407, 1, 1, 1, 1, 1,
-0.01846889, 2.485263, 0.8657681, 1, 1, 1, 1, 1,
-0.01576683, 0.8664139, -0.541146, 1, 1, 1, 1, 1,
-0.01071795, 2.797908, -0.2235181, 1, 1, 1, 1, 1,
-0.01024564, -1.481859, -4.003892, 1, 1, 1, 1, 1,
-0.009057004, 1.351518, 0.3060496, 1, 1, 1, 1, 1,
-0.008046592, 0.314555, -1.613276, 0, 0, 1, 1, 1,
-0.002085749, 1.455489, 0.21303, 1, 0, 0, 1, 1,
0.005415635, -1.435072, 3.174809, 1, 0, 0, 1, 1,
0.006153312, -0.4236374, 3.905812, 1, 0, 0, 1, 1,
0.008032007, 1.336756, -0.9210649, 1, 0, 0, 1, 1,
0.01152821, -0.9919739, 1.696839, 1, 0, 0, 1, 1,
0.01628617, 1.952918, 0.2526946, 0, 0, 0, 1, 1,
0.01694733, -0.3878477, 2.552762, 0, 0, 0, 1, 1,
0.01915709, -0.01056399, -0.1109065, 0, 0, 0, 1, 1,
0.02639843, -0.350018, 3.476029, 0, 0, 0, 1, 1,
0.03552561, 1.233017, 0.1156783, 0, 0, 0, 1, 1,
0.03556622, -1.634709, 1.204731, 0, 0, 0, 1, 1,
0.03622435, 0.9625818, 1.012238, 0, 0, 0, 1, 1,
0.0405016, -0.9921882, 4.053523, 1, 1, 1, 1, 1,
0.04101991, -0.7535946, 3.870759, 1, 1, 1, 1, 1,
0.04547241, 0.1915635, -0.9639366, 1, 1, 1, 1, 1,
0.04884343, 1.105004, -1.78608, 1, 1, 1, 1, 1,
0.05667626, -1.481434, 3.758733, 1, 1, 1, 1, 1,
0.05722778, 0.2393949, 0.3963257, 1, 1, 1, 1, 1,
0.05822041, -0.4791904, 3.401934, 1, 1, 1, 1, 1,
0.06476858, -1.127464, 3.536382, 1, 1, 1, 1, 1,
0.06539022, 0.1172713, -0.2643026, 1, 1, 1, 1, 1,
0.06655107, -0.8028753, 2.787524, 1, 1, 1, 1, 1,
0.0665552, -1.152294, 3.560006, 1, 1, 1, 1, 1,
0.06773105, 1.127471, 0.4697452, 1, 1, 1, 1, 1,
0.06811529, -2.078952, 1.933195, 1, 1, 1, 1, 1,
0.07093737, -0.1035411, 2.190725, 1, 1, 1, 1, 1,
0.07155424, 0.7673216, 0.298519, 1, 1, 1, 1, 1,
0.07316052, -0.7881148, 2.696527, 0, 0, 1, 1, 1,
0.07542736, -0.4993866, 2.759029, 1, 0, 0, 1, 1,
0.07589555, 1.289147, -1.622229, 1, 0, 0, 1, 1,
0.08006153, 1.223912, 1.006099, 1, 0, 0, 1, 1,
0.08091704, -1.813442, 3.751451, 1, 0, 0, 1, 1,
0.0831598, 0.323046, 1.982215, 1, 0, 0, 1, 1,
0.08335688, -3.689867, 4.078993, 0, 0, 0, 1, 1,
0.08461668, 0.4983654, 0.5813185, 0, 0, 0, 1, 1,
0.08620106, 0.4164629, -0.2378526, 0, 0, 0, 1, 1,
0.09160865, 1.243899, -1.025111, 0, 0, 0, 1, 1,
0.0944322, 0.6402836, -0.242892, 0, 0, 0, 1, 1,
0.09897617, 1.966537, -0.3275288, 0, 0, 0, 1, 1,
0.1006413, 2.458479, 2.029359, 0, 0, 0, 1, 1,
0.1014298, -0.1649291, 3.13073, 1, 1, 1, 1, 1,
0.1034504, 0.8030159, -0.1356915, 1, 1, 1, 1, 1,
0.1046948, -0.665738, 3.803662, 1, 1, 1, 1, 1,
0.1086096, 0.1706551, -0.7727829, 1, 1, 1, 1, 1,
0.1096773, -0.3351178, 1.880737, 1, 1, 1, 1, 1,
0.109753, 1.681899, -0.4078047, 1, 1, 1, 1, 1,
0.1097717, 0.02466071, 3.159997, 1, 1, 1, 1, 1,
0.110463, -0.6789905, 2.067518, 1, 1, 1, 1, 1,
0.1171001, -1.117051, 1.881267, 1, 1, 1, 1, 1,
0.1201179, -0.1343165, 2.254795, 1, 1, 1, 1, 1,
0.1227614, 0.5501028, 0.7544987, 1, 1, 1, 1, 1,
0.127285, -0.4770614, 4.496429, 1, 1, 1, 1, 1,
0.1280086, 1.951088, -0.5823348, 1, 1, 1, 1, 1,
0.1362156, -0.0750018, 2.421393, 1, 1, 1, 1, 1,
0.1375577, -0.7823473, 3.640523, 1, 1, 1, 1, 1,
0.1401739, -0.02210331, 0.4997117, 0, 0, 1, 1, 1,
0.1474852, 1.401598, -0.4240194, 1, 0, 0, 1, 1,
0.1498533, 0.7486708, -0.07248274, 1, 0, 0, 1, 1,
0.1504492, -0.5246199, 1.813768, 1, 0, 0, 1, 1,
0.1517418, -1.090924, 3.641512, 1, 0, 0, 1, 1,
0.1518195, -0.510596, 2.762536, 1, 0, 0, 1, 1,
0.15357, -0.05602214, 2.52248, 0, 0, 0, 1, 1,
0.1594238, -0.4802031, 3.640839, 0, 0, 0, 1, 1,
0.1630275, 0.1157783, -0.4014213, 0, 0, 0, 1, 1,
0.1665799, -0.6035177, 3.270455, 0, 0, 0, 1, 1,
0.1676709, -0.2523871, 2.905713, 0, 0, 0, 1, 1,
0.1728594, 0.5660695, 0.4983889, 0, 0, 0, 1, 1,
0.1736041, -0.006896222, 1.971673, 0, 0, 0, 1, 1,
0.1757466, -1.449996, 1.952442, 1, 1, 1, 1, 1,
0.178836, 2.409317, -1.095016, 1, 1, 1, 1, 1,
0.1845897, -0.3712614, 3.48972, 1, 1, 1, 1, 1,
0.1878014, 0.7421026, 1.013718, 1, 1, 1, 1, 1,
0.1893578, 0.5468397, 1.348412, 1, 1, 1, 1, 1,
0.1895166, 0.4415973, -1.412968, 1, 1, 1, 1, 1,
0.1905798, 0.8938426, -0.8708769, 1, 1, 1, 1, 1,
0.1920184, -0.3786621, 2.540298, 1, 1, 1, 1, 1,
0.1925814, 0.6634113, -0.328826, 1, 1, 1, 1, 1,
0.1964611, -0.1354261, 2.511569, 1, 1, 1, 1, 1,
0.1971495, 0.1456075, 2.195102, 1, 1, 1, 1, 1,
0.2099547, 0.5570507, -0.5276331, 1, 1, 1, 1, 1,
0.2124973, 0.2763646, 2.117157, 1, 1, 1, 1, 1,
0.2135358, -0.6027462, 1.665314, 1, 1, 1, 1, 1,
0.2143616, 0.6336811, -0.2894002, 1, 1, 1, 1, 1,
0.2172193, -1.045462, 3.173403, 0, 0, 1, 1, 1,
0.2183446, 0.6423792, -0.9080226, 1, 0, 0, 1, 1,
0.2201795, -0.8251587, 3.408134, 1, 0, 0, 1, 1,
0.2211835, -0.7500044, 2.391595, 1, 0, 0, 1, 1,
0.2233274, 1.136977, 0.4245686, 1, 0, 0, 1, 1,
0.226521, 0.1991364, 1.875672, 1, 0, 0, 1, 1,
0.2347995, -0.02208993, 2.409891, 0, 0, 0, 1, 1,
0.236988, -0.2227035, 2.408456, 0, 0, 0, 1, 1,
0.2384481, -1.133847, 2.747685, 0, 0, 0, 1, 1,
0.2390636, -1.711781, 3.603193, 0, 0, 0, 1, 1,
0.240677, -1.384933, 3.387234, 0, 0, 0, 1, 1,
0.2471698, 0.04816503, 1.361063, 0, 0, 0, 1, 1,
0.2549366, -0.1596619, 3.805711, 0, 0, 0, 1, 1,
0.2592192, 0.4808651, 0.555593, 1, 1, 1, 1, 1,
0.2623973, -0.8734752, 3.638636, 1, 1, 1, 1, 1,
0.2626655, 1.057408, 0.042819, 1, 1, 1, 1, 1,
0.2686501, 1.475402, 0.9610487, 1, 1, 1, 1, 1,
0.26966, 0.8492597, 1.469419, 1, 1, 1, 1, 1,
0.2701785, 0.07660949, 2.219078, 1, 1, 1, 1, 1,
0.2718644, 1.687284, -0.2086115, 1, 1, 1, 1, 1,
0.2766561, 0.0517937, 3.424563, 1, 1, 1, 1, 1,
0.2800689, 1.767993, 0.9358343, 1, 1, 1, 1, 1,
0.2832097, 0.144277, 0.4457416, 1, 1, 1, 1, 1,
0.2888563, 0.789965, -0.06973522, 1, 1, 1, 1, 1,
0.2919568, 0.469164, 0.1319801, 1, 1, 1, 1, 1,
0.2929556, 0.7889756, 0.6437601, 1, 1, 1, 1, 1,
0.3032557, -1.281614, 3.191523, 1, 1, 1, 1, 1,
0.3122663, 0.1543124, 2.119942, 1, 1, 1, 1, 1,
0.3125553, 1.154567, 2.261046, 0, 0, 1, 1, 1,
0.3145708, -0.4454939, 1.860392, 1, 0, 0, 1, 1,
0.3153651, -1.851261, 3.454335, 1, 0, 0, 1, 1,
0.317772, 0.7551257, 0.07645296, 1, 0, 0, 1, 1,
0.3182141, -0.9781883, 1.424112, 1, 0, 0, 1, 1,
0.318933, -0.899572, 2.902032, 1, 0, 0, 1, 1,
0.3236284, 0.02964773, 1.102401, 0, 0, 0, 1, 1,
0.3248714, -1.507385, 1.041505, 0, 0, 0, 1, 1,
0.3268735, 0.7447482, -1.221996, 0, 0, 0, 1, 1,
0.3287544, 0.7682804, 1.870995, 0, 0, 0, 1, 1,
0.3291937, -0.2500787, 2.441898, 0, 0, 0, 1, 1,
0.3375097, 0.260439, 0.8944387, 0, 0, 0, 1, 1,
0.3382669, -1.544499, 1.937593, 0, 0, 0, 1, 1,
0.3385475, -1.690736, 2.325943, 1, 1, 1, 1, 1,
0.3426583, -0.2059992, 0.9729986, 1, 1, 1, 1, 1,
0.3476879, -0.1029085, 1.097299, 1, 1, 1, 1, 1,
0.348495, -1.099281, 2.674453, 1, 1, 1, 1, 1,
0.3556983, -1.974041, 2.084887, 1, 1, 1, 1, 1,
0.3581061, -0.9480467, 1.923877, 1, 1, 1, 1, 1,
0.3642232, -0.4479692, 2.338749, 1, 1, 1, 1, 1,
0.3659419, 2.075495, 0.7801272, 1, 1, 1, 1, 1,
0.3659586, 0.6157979, -0.592813, 1, 1, 1, 1, 1,
0.3661786, 1.309808, 1.518831, 1, 1, 1, 1, 1,
0.3688815, -1.003218, 2.912707, 1, 1, 1, 1, 1,
0.3694475, -0.02234395, 1.279618, 1, 1, 1, 1, 1,
0.3710233, 0.7400501, -0.05494335, 1, 1, 1, 1, 1,
0.374425, -0.3178729, 2.896731, 1, 1, 1, 1, 1,
0.3745004, 0.6271557, -1.445022, 1, 1, 1, 1, 1,
0.384137, -0.8054851, 2.477141, 0, 0, 1, 1, 1,
0.385758, 0.142426, 0.464737, 1, 0, 0, 1, 1,
0.3882658, 1.358378, 1.708086, 1, 0, 0, 1, 1,
0.3898771, 0.6311978, 1.072036, 1, 0, 0, 1, 1,
0.3907233, 0.4490283, 0.1714932, 1, 0, 0, 1, 1,
0.3931366, 0.7489949, 0.7799477, 1, 0, 0, 1, 1,
0.3973857, -0.8540655, 3.337213, 0, 0, 0, 1, 1,
0.3986299, 0.9445049, -0.5716702, 0, 0, 0, 1, 1,
0.3995443, -1.147396, 3.529368, 0, 0, 0, 1, 1,
0.4003283, 1.328236, 0.1779455, 0, 0, 0, 1, 1,
0.4025311, -0.2526752, 1.597362, 0, 0, 0, 1, 1,
0.4036363, 1.312386, 0.2943526, 0, 0, 0, 1, 1,
0.405013, 0.8256751, -0.5050725, 0, 0, 0, 1, 1,
0.4060218, -0.1670454, 1.834875, 1, 1, 1, 1, 1,
0.4120387, -2.57996, 3.643311, 1, 1, 1, 1, 1,
0.4149908, 1.114226, -1.183304, 1, 1, 1, 1, 1,
0.4151271, -0.7454558, 2.703984, 1, 1, 1, 1, 1,
0.41729, -1.199741, 3.634948, 1, 1, 1, 1, 1,
0.4180413, 0.3169203, 1.134987, 1, 1, 1, 1, 1,
0.4189421, 0.9833791, 1.180165, 1, 1, 1, 1, 1,
0.4215081, 0.9381925, 0.04271864, 1, 1, 1, 1, 1,
0.4243764, 1.814196, -1.077681, 1, 1, 1, 1, 1,
0.4249522, -0.6791179, 4.151213, 1, 1, 1, 1, 1,
0.4255174, 1.201622, 1.476762, 1, 1, 1, 1, 1,
0.4274877, -0.9134769, 3.246292, 1, 1, 1, 1, 1,
0.4322039, 1.430647, 1.128733, 1, 1, 1, 1, 1,
0.4356318, -0.3683586, 4.480485, 1, 1, 1, 1, 1,
0.4373571, -0.5646971, 3.124429, 1, 1, 1, 1, 1,
0.4377485, -0.8178584, 0.2612878, 0, 0, 1, 1, 1,
0.4407591, -0.8317268, 1.92245, 1, 0, 0, 1, 1,
0.446606, 0.4872997, -0.4618894, 1, 0, 0, 1, 1,
0.4519404, 0.3004706, 1.400563, 1, 0, 0, 1, 1,
0.4581847, 1.125951, 0.4461192, 1, 0, 0, 1, 1,
0.458328, 1.191801, -1.045638, 1, 0, 0, 1, 1,
0.4596941, -0.1091768, 0.4196274, 0, 0, 0, 1, 1,
0.470329, 1.545112, -0.04941972, 0, 0, 0, 1, 1,
0.4709104, -1.195158, 3.573527, 0, 0, 0, 1, 1,
0.4742442, 1.117724, -0.6709121, 0, 0, 0, 1, 1,
0.4751373, 0.5924545, 0.7462441, 0, 0, 0, 1, 1,
0.4755547, 1.268706, -0.1883817, 0, 0, 0, 1, 1,
0.4762804, 0.8109131, 2.397233, 0, 0, 0, 1, 1,
0.4768985, -0.06135539, 2.304276, 1, 1, 1, 1, 1,
0.4786375, 0.5691136, 1.697114, 1, 1, 1, 1, 1,
0.4786438, 0.2950652, -0.3760886, 1, 1, 1, 1, 1,
0.4829666, -0.6402369, 2.876911, 1, 1, 1, 1, 1,
0.4840232, -0.5263954, 1.782127, 1, 1, 1, 1, 1,
0.4919858, 1.126311, 0.669313, 1, 1, 1, 1, 1,
0.4973918, -2.386966, 2.002963, 1, 1, 1, 1, 1,
0.5017775, 0.1122103, 0.06659181, 1, 1, 1, 1, 1,
0.5020576, 0.3897123, 0.8167347, 1, 1, 1, 1, 1,
0.5068001, -0.9073551, 2.355265, 1, 1, 1, 1, 1,
0.507274, 0.06059037, 2.1265, 1, 1, 1, 1, 1,
0.5092162, -0.5646133, 1.288862, 1, 1, 1, 1, 1,
0.52079, 0.1166102, 2.309927, 1, 1, 1, 1, 1,
0.5229579, 1.608672, -0.3488878, 1, 1, 1, 1, 1,
0.530466, 0.3179226, 1.013233, 1, 1, 1, 1, 1,
0.5305813, -0.8655052, 2.850922, 0, 0, 1, 1, 1,
0.5307219, 1.216756, 0.5722868, 1, 0, 0, 1, 1,
0.5316504, 1.679131, 0.8100076, 1, 0, 0, 1, 1,
0.5350726, -0.3181651, 3.396397, 1, 0, 0, 1, 1,
0.5413356, -1.108127, 2.846709, 1, 0, 0, 1, 1,
0.5448711, -0.1829797, 1.130489, 1, 0, 0, 1, 1,
0.5459994, 0.1578967, 1.061357, 0, 0, 0, 1, 1,
0.547839, -0.5228682, 2.778949, 0, 0, 0, 1, 1,
0.5481547, 0.1119633, -0.633944, 0, 0, 0, 1, 1,
0.551946, -0.006011291, 1.709034, 0, 0, 0, 1, 1,
0.5547352, 0.1737392, -0.7770934, 0, 0, 0, 1, 1,
0.5581444, -0.4866043, 4.630848, 0, 0, 0, 1, 1,
0.5598481, -0.5452868, 3.030879, 0, 0, 0, 1, 1,
0.5601892, 0.1667268, 2.468224, 1, 1, 1, 1, 1,
0.560778, -1.724542, 1.85429, 1, 1, 1, 1, 1,
0.5621711, 1.448367, 0.7778947, 1, 1, 1, 1, 1,
0.5655681, -0.106616, 1.882857, 1, 1, 1, 1, 1,
0.565951, 0.3455376, 2.170956, 1, 1, 1, 1, 1,
0.5731206, 0.2752042, 1.737322, 1, 1, 1, 1, 1,
0.5763319, -0.03121639, 4.477449, 1, 1, 1, 1, 1,
0.5825893, -1.435852, 3.191744, 1, 1, 1, 1, 1,
0.5859988, 0.4050725, 2.064167, 1, 1, 1, 1, 1,
0.5877182, 0.7938948, -0.5118084, 1, 1, 1, 1, 1,
0.5886139, -1.073447, 1.688491, 1, 1, 1, 1, 1,
0.5888665, -0.3524952, 2.250853, 1, 1, 1, 1, 1,
0.5921959, 0.1770571, 0.6406811, 1, 1, 1, 1, 1,
0.5939047, -0.08668083, 0.6949829, 1, 1, 1, 1, 1,
0.5988403, 0.04593857, 1.391057, 1, 1, 1, 1, 1,
0.6002977, 0.157951, -0.5003543, 0, 0, 1, 1, 1,
0.6078675, 0.7216493, 1.405889, 1, 0, 0, 1, 1,
0.6100917, 0.6346288, -0.4443035, 1, 0, 0, 1, 1,
0.611971, 0.5139785, 1.13927, 1, 0, 0, 1, 1,
0.6155431, -0.9213254, 1.972189, 1, 0, 0, 1, 1,
0.6205838, -0.7645925, 2.20887, 1, 0, 0, 1, 1,
0.6259711, -0.1402197, 1.463357, 0, 0, 0, 1, 1,
0.6302046, -1.71666, 2.837001, 0, 0, 0, 1, 1,
0.6317869, 0.1853663, 1.239488, 0, 0, 0, 1, 1,
0.6396428, 0.7051086, -0.8203967, 0, 0, 0, 1, 1,
0.6476941, 2.36515, -0.2613979, 0, 0, 0, 1, 1,
0.6494645, -0.1142543, 3.352467, 0, 0, 0, 1, 1,
0.6521905, 0.8294736, -2.502705, 0, 0, 0, 1, 1,
0.657629, 1.662518, -0.05067313, 1, 1, 1, 1, 1,
0.6597169, -0.7085228, 1.951087, 1, 1, 1, 1, 1,
0.6607727, 1.581657, 1.267507, 1, 1, 1, 1, 1,
0.6612258, 0.8714162, 0.2736999, 1, 1, 1, 1, 1,
0.6677422, -0.07330853, 0.02411676, 1, 1, 1, 1, 1,
0.6741961, 0.2896386, 1.030697, 1, 1, 1, 1, 1,
0.684726, -1.649649, 2.017498, 1, 1, 1, 1, 1,
0.6862076, 0.419346, 2.542728, 1, 1, 1, 1, 1,
0.6891241, -1.562782, 3.221689, 1, 1, 1, 1, 1,
0.6910883, 1.43041, 0.4557002, 1, 1, 1, 1, 1,
0.6918651, 0.1233416, 0.96374, 1, 1, 1, 1, 1,
0.6949463, 0.2841882, -0.1060091, 1, 1, 1, 1, 1,
0.6980408, -1.322467, 3.082634, 1, 1, 1, 1, 1,
0.7014651, 1.709208, 1.08327, 1, 1, 1, 1, 1,
0.7023332, -0.4207271, 0.101466, 1, 1, 1, 1, 1,
0.7025756, -0.4557144, 1.619627, 0, 0, 1, 1, 1,
0.7064999, -0.1371163, 2.172305, 1, 0, 0, 1, 1,
0.7068859, 1.125725, -0.6755462, 1, 0, 0, 1, 1,
0.7080007, 1.875164, 0.4566286, 1, 0, 0, 1, 1,
0.7124819, 1.124077, -0.04066052, 1, 0, 0, 1, 1,
0.7125732, -0.3236924, 1.189841, 1, 0, 0, 1, 1,
0.713875, -0.09849449, 1.075516, 0, 0, 0, 1, 1,
0.7189127, 0.8400359, 0.3833466, 0, 0, 0, 1, 1,
0.7204043, 0.4828139, 0.06909979, 0, 0, 0, 1, 1,
0.7217902, 1.028277, 1.56238, 0, 0, 0, 1, 1,
0.7220732, 1.661352, 1.604919, 0, 0, 0, 1, 1,
0.7241545, -0.5157402, 3.373769, 0, 0, 0, 1, 1,
0.7249832, -0.5975315, 1.843935, 0, 0, 0, 1, 1,
0.7276416, 2.062499, -0.3453559, 1, 1, 1, 1, 1,
0.7283453, 0.6270406, -0.1601342, 1, 1, 1, 1, 1,
0.7302818, 0.8186768, 1.159758, 1, 1, 1, 1, 1,
0.7325353, 2.790405, 1.291314, 1, 1, 1, 1, 1,
0.7330754, 1.366892, 0.6363279, 1, 1, 1, 1, 1,
0.7341075, 2.057781, 1.583272, 1, 1, 1, 1, 1,
0.7360267, -0.9507658, 3.061866, 1, 1, 1, 1, 1,
0.736316, 0.748113, -0.3166312, 1, 1, 1, 1, 1,
0.7378514, -0.4354926, 1.801055, 1, 1, 1, 1, 1,
0.7474882, 0.5005442, 0.9083358, 1, 1, 1, 1, 1,
0.7501093, -0.1990396, 3.92691, 1, 1, 1, 1, 1,
0.7587851, -0.617511, 2.281565, 1, 1, 1, 1, 1,
0.7619708, -0.2248926, 1.473072, 1, 1, 1, 1, 1,
0.7663422, -0.8938881, 1.363639, 1, 1, 1, 1, 1,
0.7715555, -1.107028, 1.265802, 1, 1, 1, 1, 1,
0.7828068, 1.352487, 2.820778, 0, 0, 1, 1, 1,
0.7837392, 0.4645779, 2.925914, 1, 0, 0, 1, 1,
0.7862312, 0.2254376, 1.878126, 1, 0, 0, 1, 1,
0.7878927, 0.7812426, 0.5348582, 1, 0, 0, 1, 1,
0.8062688, -0.5833405, 2.732178, 1, 0, 0, 1, 1,
0.8076619, -1.488837, 4.496263, 1, 0, 0, 1, 1,
0.8081179, -1.178308, 3.197889, 0, 0, 0, 1, 1,
0.8094892, 0.5197684, 0.8716529, 0, 0, 0, 1, 1,
0.8117762, -1.122597, 3.58311, 0, 0, 0, 1, 1,
0.8153114, 0.03136119, 1.311608, 0, 0, 0, 1, 1,
0.8179468, 0.5031952, -0.603632, 0, 0, 0, 1, 1,
0.8187118, -0.4564644, 1.711426, 0, 0, 0, 1, 1,
0.8194722, 0.682185, -0.7453025, 0, 0, 0, 1, 1,
0.8251559, 0.4008685, 0.4041246, 1, 1, 1, 1, 1,
0.828487, 0.06941004, 3.304682, 1, 1, 1, 1, 1,
0.8348233, -0.6892893, 3.554963, 1, 1, 1, 1, 1,
0.8358661, -1.279251, 3.120049, 1, 1, 1, 1, 1,
0.8363882, 0.4376192, 0.7515594, 1, 1, 1, 1, 1,
0.8375496, 1.64541, -0.5894402, 1, 1, 1, 1, 1,
0.8416098, -1.167769, 2.78266, 1, 1, 1, 1, 1,
0.842052, -0.06348547, -1.534366, 1, 1, 1, 1, 1,
0.8555779, -0.483652, 2.859573, 1, 1, 1, 1, 1,
0.8582105, 1.640599, -0.4678838, 1, 1, 1, 1, 1,
0.8596748, 0.3669059, 1.067155, 1, 1, 1, 1, 1,
0.8605564, 1.900821, 0.9324968, 1, 1, 1, 1, 1,
0.8680558, 1.462294, 1.169013, 1, 1, 1, 1, 1,
0.8680756, 0.1059615, 0.1918349, 1, 1, 1, 1, 1,
0.8749623, -0.713663, 2.649026, 1, 1, 1, 1, 1,
0.8850867, 0.2078996, 0.2151674, 0, 0, 1, 1, 1,
0.9021078, 0.1488886, 0.4369746, 1, 0, 0, 1, 1,
0.9049731, -0.6718246, 2.517031, 1, 0, 0, 1, 1,
0.9049983, 1.371043, 0.01585012, 1, 0, 0, 1, 1,
0.9063505, 0.3003337, 1.741053, 1, 0, 0, 1, 1,
0.9248447, -0.4142226, 4.168863, 1, 0, 0, 1, 1,
0.9349278, -2.720652, 3.84192, 0, 0, 0, 1, 1,
0.938845, -0.4982173, 2.522379, 0, 0, 0, 1, 1,
0.9425194, -0.3642661, 2.573001, 0, 0, 0, 1, 1,
0.9476936, 0.3648608, 2.622249, 0, 0, 0, 1, 1,
0.9526121, 1.131612, 0.1460281, 0, 0, 0, 1, 1,
0.9601197, -1.922018, 3.527687, 0, 0, 0, 1, 1,
0.9622558, 0.5609431, 2.745747, 0, 0, 0, 1, 1,
0.9724968, 0.06617366, 1.703041, 1, 1, 1, 1, 1,
0.9794568, -0.03511919, -0.2799807, 1, 1, 1, 1, 1,
0.982448, 1.376611, 0.5064368, 1, 1, 1, 1, 1,
0.9885259, -0.17175, 1.547185, 1, 1, 1, 1, 1,
0.9912398, -0.9173758, 0.6756395, 1, 1, 1, 1, 1,
0.9924393, -0.1067241, 2.249212, 1, 1, 1, 1, 1,
1.001359, 0.635474, 1.64913, 1, 1, 1, 1, 1,
1.004698, -0.03331743, 1.612333, 1, 1, 1, 1, 1,
1.006032, -1.786258, 2.415297, 1, 1, 1, 1, 1,
1.006695, 0.03153284, 1.564827, 1, 1, 1, 1, 1,
1.011641, -0.02685432, 2.454088, 1, 1, 1, 1, 1,
1.012352, -0.7745008, 2.729327, 1, 1, 1, 1, 1,
1.013872, 0.1664816, -0.1869703, 1, 1, 1, 1, 1,
1.01651, 0.07106435, 2.259998, 1, 1, 1, 1, 1,
1.017756, -0.04822494, -0.7087932, 1, 1, 1, 1, 1,
1.020746, -0.6794226, 3.815416, 0, 0, 1, 1, 1,
1.024737, 2.355888, 0.05907888, 1, 0, 0, 1, 1,
1.031923, -0.002669714, 0.09665618, 1, 0, 0, 1, 1,
1.037122, 0.8886493, 1.584504, 1, 0, 0, 1, 1,
1.037124, 0.09049555, 0.952078, 1, 0, 0, 1, 1,
1.038404, 0.3222556, 1.220503, 1, 0, 0, 1, 1,
1.03896, -0.3440579, -0.6355301, 0, 0, 0, 1, 1,
1.045176, -0.6722979, 1.935178, 0, 0, 0, 1, 1,
1.050769, -0.1558932, 0.6835377, 0, 0, 0, 1, 1,
1.056644, -0.339496, 0.8365677, 0, 0, 0, 1, 1,
1.064512, -1.421956, 1.094655, 0, 0, 0, 1, 1,
1.066266, 0.3634848, 0.2867438, 0, 0, 0, 1, 1,
1.071008, 0.03009655, 0.8353377, 0, 0, 0, 1, 1,
1.076207, 1.407207, 2.171554, 1, 1, 1, 1, 1,
1.077283, -0.3513164, 3.730892, 1, 1, 1, 1, 1,
1.079501, -0.2755232, 1.682635, 1, 1, 1, 1, 1,
1.09045, 0.00762128, 2.958128, 1, 1, 1, 1, 1,
1.105886, 0.9973919, -0.7544649, 1, 1, 1, 1, 1,
1.118177, 0.2843344, 2.756617, 1, 1, 1, 1, 1,
1.119578, -1.368547, 2.077604, 1, 1, 1, 1, 1,
1.119909, -0.1278054, 2.060708, 1, 1, 1, 1, 1,
1.122941, -2.242523, 3.01994, 1, 1, 1, 1, 1,
1.125193, 0.1247524, 2.431694, 1, 1, 1, 1, 1,
1.128374, 1.232648, 2.627806, 1, 1, 1, 1, 1,
1.128959, -0.7470949, 1.266874, 1, 1, 1, 1, 1,
1.13324, -1.529677, 4.378502, 1, 1, 1, 1, 1,
1.145176, -1.723099, 3.435148, 1, 1, 1, 1, 1,
1.147867, 0.1104625, 0.912896, 1, 1, 1, 1, 1,
1.151069, -0.3795736, 2.083637, 0, 0, 1, 1, 1,
1.154013, -0.6589241, 2.131998, 1, 0, 0, 1, 1,
1.155651, 0.5466864, 0.918211, 1, 0, 0, 1, 1,
1.164728, -0.7278221, 2.620501, 1, 0, 0, 1, 1,
1.173258, -0.1385365, 0.7030156, 1, 0, 0, 1, 1,
1.174813, 0.09626622, 1.329662, 1, 0, 0, 1, 1,
1.176944, -0.803493, 0.247221, 0, 0, 0, 1, 1,
1.179006, -1.087618, 0.8396047, 0, 0, 0, 1, 1,
1.179726, -0.2396291, 1.195104, 0, 0, 0, 1, 1,
1.18806, 1.722558, 1.480204, 0, 0, 0, 1, 1,
1.188554, -1.818198, 3.249432, 0, 0, 0, 1, 1,
1.191653, -0.5862185, 1.74823, 0, 0, 0, 1, 1,
1.19626, -0.951198, 2.171223, 0, 0, 0, 1, 1,
1.196484, -0.01533637, 2.767973, 1, 1, 1, 1, 1,
1.199962, 1.851092, 0.4473335, 1, 1, 1, 1, 1,
1.204141, -0.1160961, 0.5198385, 1, 1, 1, 1, 1,
1.209747, 0.3332839, 0.476606, 1, 1, 1, 1, 1,
1.209839, -1.437317, 1.972801, 1, 1, 1, 1, 1,
1.210848, 0.8796411, 2.708798, 1, 1, 1, 1, 1,
1.21236, 1.202066, -0.546591, 1, 1, 1, 1, 1,
1.215213, -0.7366614, 2.608139, 1, 1, 1, 1, 1,
1.218934, 0.04894112, 3.54728, 1, 1, 1, 1, 1,
1.227231, -0.01576431, 3.818531, 1, 1, 1, 1, 1,
1.230719, -0.6633527, 1.985324, 1, 1, 1, 1, 1,
1.23541, -1.26245, 3.86599, 1, 1, 1, 1, 1,
1.255495, 0.4916152, 2.933947, 1, 1, 1, 1, 1,
1.265819, 0.8742661, 2.301919, 1, 1, 1, 1, 1,
1.268026, 0.447331, 0.644513, 1, 1, 1, 1, 1,
1.270666, -1.600872, 2.08196, 0, 0, 1, 1, 1,
1.273964, -1.30164, 1.998961, 1, 0, 0, 1, 1,
1.277961, 0.6972045, 1.648059, 1, 0, 0, 1, 1,
1.278409, -0.284604, 0.8818176, 1, 0, 0, 1, 1,
1.279121, 2.829579, -1.054694, 1, 0, 0, 1, 1,
1.291579, -0.526549, 2.327875, 1, 0, 0, 1, 1,
1.293462, 0.1517863, 1.937025, 0, 0, 0, 1, 1,
1.294657, -1.385244, 2.933954, 0, 0, 0, 1, 1,
1.295743, -1.572063, 3.153843, 0, 0, 0, 1, 1,
1.29688, 0.02538195, 1.912936, 0, 0, 0, 1, 1,
1.300522, -0.7621386, 1.924063, 0, 0, 0, 1, 1,
1.320891, 0.8542199, 1.570753, 0, 0, 0, 1, 1,
1.326525, 0.2486773, 1.471759, 0, 0, 0, 1, 1,
1.326734, 1.731364, -0.4706147, 1, 1, 1, 1, 1,
1.332337, 1.135092, 0.6830209, 1, 1, 1, 1, 1,
1.338102, 1.062329, 1.017629, 1, 1, 1, 1, 1,
1.340289, -0.7689893, 2.011436, 1, 1, 1, 1, 1,
1.349693, 0.299237, 1.852036, 1, 1, 1, 1, 1,
1.353127, -1.841916, 2.107865, 1, 1, 1, 1, 1,
1.362896, 1.857235, -1.538874, 1, 1, 1, 1, 1,
1.390029, -1.269427, 1.376005, 1, 1, 1, 1, 1,
1.395059, 0.561609, 1.761779, 1, 1, 1, 1, 1,
1.396499, -0.6850282, 2.367463, 1, 1, 1, 1, 1,
1.401424, -0.6656401, 0.9655573, 1, 1, 1, 1, 1,
1.406464, 0.3466793, 1.5852, 1, 1, 1, 1, 1,
1.406641, -0.7381349, 1.6317, 1, 1, 1, 1, 1,
1.407183, 0.6238213, -0.6992232, 1, 1, 1, 1, 1,
1.408357, 1.683134, -0.7838298, 1, 1, 1, 1, 1,
1.41035, -0.07110669, 0.7590286, 0, 0, 1, 1, 1,
1.411042, -0.7745839, 1.778545, 1, 0, 0, 1, 1,
1.411782, -0.9572226, 3.784016, 1, 0, 0, 1, 1,
1.419954, -0.4410244, 1.458487, 1, 0, 0, 1, 1,
1.420384, -0.110862, 1.785119, 1, 0, 0, 1, 1,
1.421953, -0.5003924, 3.171277, 1, 0, 0, 1, 1,
1.424944, -1.239927, 2.678284, 0, 0, 0, 1, 1,
1.426471, 2.094111, -0.6692711, 0, 0, 0, 1, 1,
1.432811, 2.285707, -0.4608121, 0, 0, 0, 1, 1,
1.433981, 1.802397, -0.5906643, 0, 0, 0, 1, 1,
1.43515, 0.2574589, 0.5821819, 0, 0, 0, 1, 1,
1.437736, -1.15495, 2.389236, 0, 0, 0, 1, 1,
1.445893, 1.046493, 1.403361, 0, 0, 0, 1, 1,
1.449009, 0.441582, 1.392791, 1, 1, 1, 1, 1,
1.458036, 1.291006, 1.503985, 1, 1, 1, 1, 1,
1.460915, 0.1082008, -1.07314, 1, 1, 1, 1, 1,
1.46362, 1.020832, 1.350873, 1, 1, 1, 1, 1,
1.470945, -0.7693453, 1.058657, 1, 1, 1, 1, 1,
1.475637, 0.2096587, 1.161136, 1, 1, 1, 1, 1,
1.483496, 0.8751537, 0.6546793, 1, 1, 1, 1, 1,
1.484765, -1.02171, 2.263853, 1, 1, 1, 1, 1,
1.487023, 1.563367, -0.7730939, 1, 1, 1, 1, 1,
1.490208, -0.9124002, 3.327076, 1, 1, 1, 1, 1,
1.495053, -0.6474743, 3.443215, 1, 1, 1, 1, 1,
1.506255, -0.1364035, 0.9317217, 1, 1, 1, 1, 1,
1.506553, 0.8276378, -1.495617, 1, 1, 1, 1, 1,
1.507768, -0.4327051, 3.796419, 1, 1, 1, 1, 1,
1.513881, 0.8063082, -0.6646641, 1, 1, 1, 1, 1,
1.522184, -0.04577366, 2.530543, 0, 0, 1, 1, 1,
1.523811, 2.610385, 0.6089085, 1, 0, 0, 1, 1,
1.542111, 0.2732451, 2.574828, 1, 0, 0, 1, 1,
1.545043, -0.3033899, 1.040441, 1, 0, 0, 1, 1,
1.558234, -1.009169, -0.5659534, 1, 0, 0, 1, 1,
1.558634, 0.4235252, 0.1519184, 1, 0, 0, 1, 1,
1.56952, -0.08669687, 2.156852, 0, 0, 0, 1, 1,
1.577026, -0.5414382, 2.041556, 0, 0, 0, 1, 1,
1.609981, -0.6464364, 2.343739, 0, 0, 0, 1, 1,
1.616495, 0.5936989, 2.01645, 0, 0, 0, 1, 1,
1.636283, 1.580489, 0.1544801, 0, 0, 0, 1, 1,
1.641247, -0.5360671, 0.8563796, 0, 0, 0, 1, 1,
1.642907, -0.7593945, 2.450301, 0, 0, 0, 1, 1,
1.64379, -0.4731784, 0.7959303, 1, 1, 1, 1, 1,
1.662749, -1.132749, 1.005008, 1, 1, 1, 1, 1,
1.664091, -0.5412657, 0.7597976, 1, 1, 1, 1, 1,
1.664947, -0.02470188, 1.556746, 1, 1, 1, 1, 1,
1.66677, -0.4722137, 1.668236, 1, 1, 1, 1, 1,
1.671244, 1.576826, -1.071735, 1, 1, 1, 1, 1,
1.685152, 1.013808, 0.8275743, 1, 1, 1, 1, 1,
1.690788, 1.1418, 1.201695, 1, 1, 1, 1, 1,
1.694539, 0.4069161, 0.6544251, 1, 1, 1, 1, 1,
1.702481, -0.3139197, 1.940167, 1, 1, 1, 1, 1,
1.704885, 1.06099, -0.2753922, 1, 1, 1, 1, 1,
1.725024, 1.208273, 1.943877, 1, 1, 1, 1, 1,
1.725147, 1.782737, 1.754097, 1, 1, 1, 1, 1,
1.730545, -0.8123069, 2.977396, 1, 1, 1, 1, 1,
1.733726, -0.6337596, 0.3456663, 1, 1, 1, 1, 1,
1.751461, -0.7646639, 0.7046463, 0, 0, 1, 1, 1,
1.752086, -0.1833781, 3.241833, 1, 0, 0, 1, 1,
1.767491, 1.663756, 1.551351, 1, 0, 0, 1, 1,
1.76854, 0.5577049, 1.07942, 1, 0, 0, 1, 1,
1.772756, -2.941492, 3.549428, 1, 0, 0, 1, 1,
1.786691, -0.5475618, 2.783282, 1, 0, 0, 1, 1,
1.796015, -1.787878, 1.902397, 0, 0, 0, 1, 1,
1.804998, 1.97171, 0.579824, 0, 0, 0, 1, 1,
1.807572, 1.133838, 0.898093, 0, 0, 0, 1, 1,
1.820252, -1.652378, 0.951984, 0, 0, 0, 1, 1,
1.832494, 0.08737697, 1.616677, 0, 0, 0, 1, 1,
1.869541, -0.1411212, 0.3994407, 0, 0, 0, 1, 1,
1.874401, -0.3008715, 0.7508743, 0, 0, 0, 1, 1,
1.883196, 0.253232, -0.3281963, 1, 1, 1, 1, 1,
1.891915, -0.2746457, 2.148623, 1, 1, 1, 1, 1,
1.90281, 0.1014605, 0.5500796, 1, 1, 1, 1, 1,
1.916812, -0.3627336, 1.211875, 1, 1, 1, 1, 1,
1.917139, 2.188373, 1.897055, 1, 1, 1, 1, 1,
1.923004, 0.08870883, 2.422985, 1, 1, 1, 1, 1,
1.929893, 0.7731671, -0.3172878, 1, 1, 1, 1, 1,
1.936156, 1.34896, 1.702423, 1, 1, 1, 1, 1,
1.951313, 0.4186425, 2.371631, 1, 1, 1, 1, 1,
1.952605, -1.312161, 1.611363, 1, 1, 1, 1, 1,
1.960597, -0.3309278, 0.3166081, 1, 1, 1, 1, 1,
1.962875, -0.9094003, 1.260624, 1, 1, 1, 1, 1,
1.983864, -0.6090118, 1.289802, 1, 1, 1, 1, 1,
1.985303, 0.5160923, 2.613878, 1, 1, 1, 1, 1,
2.014982, -0.02405323, 3.255869, 1, 1, 1, 1, 1,
2.067311, -0.05469742, 1.121568, 0, 0, 1, 1, 1,
2.070501, 0.2389926, 1.102037, 1, 0, 0, 1, 1,
2.078263, -1.448507, 3.853719, 1, 0, 0, 1, 1,
2.112919, 0.216335, 0.6818389, 1, 0, 0, 1, 1,
2.170628, 1.136176, 1.548476, 1, 0, 0, 1, 1,
2.185219, -0.8970155, 2.694443, 1, 0, 0, 1, 1,
2.21216, -1.667151, 1.200621, 0, 0, 0, 1, 1,
2.218804, 1.343351, 1.900155, 0, 0, 0, 1, 1,
2.262802, -0.5257972, 0.401849, 0, 0, 0, 1, 1,
2.263382, -1.149419, 1.221619, 0, 0, 0, 1, 1,
2.303298, 0.1561325, 0.04388314, 0, 0, 0, 1, 1,
2.308847, 0.4844825, 2.353953, 0, 0, 0, 1, 1,
2.327138, -0.1489526, 1.527499, 0, 0, 0, 1, 1,
2.34247, 1.365524, 0.2595403, 1, 1, 1, 1, 1,
2.360401, 0.4477635, 2.381891, 1, 1, 1, 1, 1,
2.400734, 1.103508, 2.323368, 1, 1, 1, 1, 1,
2.516203, -0.8684379, 0.9830288, 1, 1, 1, 1, 1,
2.598814, 2.647095, 1.977562, 1, 1, 1, 1, 1,
2.720692, 0.832796, -0.228485, 1, 1, 1, 1, 1,
2.812982, 1.3771, 0.01524221, 1, 1, 1, 1, 1
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
var radius = 9.189621;
var distance = 32.27816;
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
mvMatrix.translate( 0.2347124, 0.3885994, 0.2774463 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.27816);
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
