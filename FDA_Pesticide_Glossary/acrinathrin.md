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
-3.06685, -0.6869075, -2.217831, 1, 0, 0, 1,
-2.972086, -1.462651, -1.965007, 1, 0.007843138, 0, 1,
-2.803211, 0.6776385, -1.390957, 1, 0.01176471, 0, 1,
-2.765396, -0.5965441, 0.2506994, 1, 0.01960784, 0, 1,
-2.612894, -2.697349, -2.113965, 1, 0.02352941, 0, 1,
-2.548964, -1.104716, -2.1377, 1, 0.03137255, 0, 1,
-2.464057, -0.3712361, -2.602316, 1, 0.03529412, 0, 1,
-2.439422, 0.4219407, -2.127709, 1, 0.04313726, 0, 1,
-2.433315, -0.2428629, -1.833432, 1, 0.04705882, 0, 1,
-2.292547, -0.8344225, -1.150309, 1, 0.05490196, 0, 1,
-2.291526, 0.3451052, -1.834648, 1, 0.05882353, 0, 1,
-2.2405, -0.0812818, -2.029566, 1, 0.06666667, 0, 1,
-2.240139, 3.300377, -1.037143, 1, 0.07058824, 0, 1,
-2.202033, -0.605058, -1.845948, 1, 0.07843138, 0, 1,
-2.200973, 0.4373309, -0.5750057, 1, 0.08235294, 0, 1,
-2.125448, -2.215555, -3.270968, 1, 0.09019608, 0, 1,
-2.117644, -0.1886338, -1.737829, 1, 0.09411765, 0, 1,
-2.084719, -0.7237607, -2.454621, 1, 0.1019608, 0, 1,
-2.080474, -0.6060408, -3.066145, 1, 0.1098039, 0, 1,
-2.069328, -1.135137, -1.379727, 1, 0.1137255, 0, 1,
-2.039808, 0.8364777, -1.349348, 1, 0.1215686, 0, 1,
-1.994748, -0.5423687, -3.10139, 1, 0.1254902, 0, 1,
-1.992392, -1.394235, -2.803932, 1, 0.1333333, 0, 1,
-1.969258, -0.6528396, -2.251165, 1, 0.1372549, 0, 1,
-1.956059, 0.7334728, -2.013471, 1, 0.145098, 0, 1,
-1.930083, -1.376246, -1.45078, 1, 0.1490196, 0, 1,
-1.915319, -0.4916924, -2.145843, 1, 0.1568628, 0, 1,
-1.905068, 0.3706046, -3.590489, 1, 0.1607843, 0, 1,
-1.89608, 0.02146418, -0.847078, 1, 0.1686275, 0, 1,
-1.883852, 0.5311816, -2.012168, 1, 0.172549, 0, 1,
-1.871876, -0.08327968, -2.512256, 1, 0.1803922, 0, 1,
-1.86398, 0.01675189, -1.906838, 1, 0.1843137, 0, 1,
-1.843951, 1.399934, -0.1099404, 1, 0.1921569, 0, 1,
-1.843628, 0.5274418, -1.490691, 1, 0.1960784, 0, 1,
-1.840304, -1.410294, -3.007539, 1, 0.2039216, 0, 1,
-1.81418, 0.3935218, -2.212273, 1, 0.2117647, 0, 1,
-1.788389, 1.442317, 2.700691, 1, 0.2156863, 0, 1,
-1.748438, 0.8902849, -0.6858116, 1, 0.2235294, 0, 1,
-1.734782, 1.404245, -0.6624529, 1, 0.227451, 0, 1,
-1.724449, -0.169476, -1.404102, 1, 0.2352941, 0, 1,
-1.718452, -1.298221, -2.205238, 1, 0.2392157, 0, 1,
-1.717275, -0.5556405, -2.414505, 1, 0.2470588, 0, 1,
-1.69736, 1.127915, -0.6625348, 1, 0.2509804, 0, 1,
-1.690638, -1.470714, -1.01854, 1, 0.2588235, 0, 1,
-1.677293, -1.767942, -3.361678, 1, 0.2627451, 0, 1,
-1.668227, -0.8515687, -0.7366687, 1, 0.2705882, 0, 1,
-1.666531, -1.162681, -3.156571, 1, 0.2745098, 0, 1,
-1.656924, 0.7345535, -0.7968631, 1, 0.282353, 0, 1,
-1.649543, -0.5625238, -1.515081, 1, 0.2862745, 0, 1,
-1.647601, 0.9460714, -0.5774027, 1, 0.2941177, 0, 1,
-1.627151, 1.514784, -0.4725112, 1, 0.3019608, 0, 1,
-1.621712, 1.377279, -1.030595, 1, 0.3058824, 0, 1,
-1.576201, 1.10409, 1.54673, 1, 0.3137255, 0, 1,
-1.560117, 0.1818139, -0.800481, 1, 0.3176471, 0, 1,
-1.559391, -0.6481592, -1.496154, 1, 0.3254902, 0, 1,
-1.556464, 0.03548682, -0.06738552, 1, 0.3294118, 0, 1,
-1.551167, -1.327737, -2.461728, 1, 0.3372549, 0, 1,
-1.550296, 1.337847, 0.3042325, 1, 0.3411765, 0, 1,
-1.537003, -0.7006177, -3.475084, 1, 0.3490196, 0, 1,
-1.536297, -0.9803987, -2.341074, 1, 0.3529412, 0, 1,
-1.529378, 1.387966, -0.7053101, 1, 0.3607843, 0, 1,
-1.517037, 0.5875997, -1.980875, 1, 0.3647059, 0, 1,
-1.497798, 1.393502, 1.698699, 1, 0.372549, 0, 1,
-1.497456, 0.9591602, -2.145809, 1, 0.3764706, 0, 1,
-1.485748, -1.419084, -1.107954, 1, 0.3843137, 0, 1,
-1.482603, 0.5239776, 0.5967746, 1, 0.3882353, 0, 1,
-1.480294, 0.3076793, -2.467171, 1, 0.3960784, 0, 1,
-1.480258, -0.2838733, -0.6588724, 1, 0.4039216, 0, 1,
-1.477814, 0.3183902, -2.779381, 1, 0.4078431, 0, 1,
-1.476229, 0.5870315, -0.04552804, 1, 0.4156863, 0, 1,
-1.475157, 0.5388474, -0.8250097, 1, 0.4196078, 0, 1,
-1.473216, -1.400568, -3.530291, 1, 0.427451, 0, 1,
-1.469978, -0.1446199, -0.7883874, 1, 0.4313726, 0, 1,
-1.469174, 0.3591303, -1.956051, 1, 0.4392157, 0, 1,
-1.458539, -0.7651424, -0.4328933, 1, 0.4431373, 0, 1,
-1.455213, 2.129185, -0.7765108, 1, 0.4509804, 0, 1,
-1.454099, 2.70507, -1.863649, 1, 0.454902, 0, 1,
-1.453808, -1.400942, -2.47415, 1, 0.4627451, 0, 1,
-1.443511, 0.06059344, -1.155562, 1, 0.4666667, 0, 1,
-1.428165, 0.5604837, -3.372355, 1, 0.4745098, 0, 1,
-1.425799, -1.507107, -0.9391225, 1, 0.4784314, 0, 1,
-1.418532, 1.091466, -1.627432, 1, 0.4862745, 0, 1,
-1.412024, -0.6788409, -2.50922, 1, 0.4901961, 0, 1,
-1.409314, 1.095151, -1.187083, 1, 0.4980392, 0, 1,
-1.405468, -1.008178, -1.11904, 1, 0.5058824, 0, 1,
-1.40354, 0.3618512, -1.5715, 1, 0.509804, 0, 1,
-1.398254, -0.05608358, -2.091211, 1, 0.5176471, 0, 1,
-1.377234, -0.1741731, -1.909376, 1, 0.5215687, 0, 1,
-1.372355, 1.623856, 0.6314154, 1, 0.5294118, 0, 1,
-1.362557, -0.03226602, -1.858766, 1, 0.5333334, 0, 1,
-1.361158, -1.667889, -1.163812, 1, 0.5411765, 0, 1,
-1.350845, -0.6185236, -2.412255, 1, 0.5450981, 0, 1,
-1.344105, 1.393438, -1.69892, 1, 0.5529412, 0, 1,
-1.338807, -1.264899, -2.835367, 1, 0.5568628, 0, 1,
-1.323136, -0.4571089, -0.7387471, 1, 0.5647059, 0, 1,
-1.320742, 1.916247, 0.2679351, 1, 0.5686275, 0, 1,
-1.318599, 0.01546603, -2.412566, 1, 0.5764706, 0, 1,
-1.310259, 1.388854, -0.6779421, 1, 0.5803922, 0, 1,
-1.30847, -1.514249, -1.941201, 1, 0.5882353, 0, 1,
-1.30414, 0.7787639, -1.509801, 1, 0.5921569, 0, 1,
-1.30266, -0.5122011, -0.6295878, 1, 0.6, 0, 1,
-1.301147, 0.3247878, -1.128979, 1, 0.6078432, 0, 1,
-1.301026, -0.07888962, -1.534468, 1, 0.6117647, 0, 1,
-1.298386, 0.3301899, -1.753592, 1, 0.6196079, 0, 1,
-1.293304, -0.2222755, -2.184936, 1, 0.6235294, 0, 1,
-1.292225, 0.7999573, -1.398435, 1, 0.6313726, 0, 1,
-1.289944, -0.1712062, -2.599364, 1, 0.6352941, 0, 1,
-1.280855, -0.2461008, -2.031831, 1, 0.6431373, 0, 1,
-1.276788, 1.337419, -0.6652933, 1, 0.6470588, 0, 1,
-1.272587, -1.353936, -0.8823721, 1, 0.654902, 0, 1,
-1.263513, 1.551495, -1.88303, 1, 0.6588235, 0, 1,
-1.25697, -0.5885276, -1.668511, 1, 0.6666667, 0, 1,
-1.255228, -2.401149, -4.523712, 1, 0.6705883, 0, 1,
-1.248011, 0.9579377, -1.872163, 1, 0.6784314, 0, 1,
-1.245005, -0.6605027, -1.985036, 1, 0.682353, 0, 1,
-1.23698, 1.151398, -1.276734, 1, 0.6901961, 0, 1,
-1.228947, -0.3840067, -0.1819293, 1, 0.6941177, 0, 1,
-1.22591, 1.698673, -0.6672119, 1, 0.7019608, 0, 1,
-1.221441, -0.4672772, -1.718602, 1, 0.7098039, 0, 1,
-1.21572, 0.620164, -2.526605, 1, 0.7137255, 0, 1,
-1.210477, 0.1198513, -0.4253214, 1, 0.7215686, 0, 1,
-1.209259, -0.2200234, -0.8785893, 1, 0.7254902, 0, 1,
-1.190688, 0.03531753, -2.657663, 1, 0.7333333, 0, 1,
-1.188281, -0.09469949, -2.028826, 1, 0.7372549, 0, 1,
-1.181162, 0.9009663, 0.1506746, 1, 0.7450981, 0, 1,
-1.173558, -0.01355985, -2.801615, 1, 0.7490196, 0, 1,
-1.172746, -0.7548503, -1.252483, 1, 0.7568628, 0, 1,
-1.144073, 0.2665432, -2.576274, 1, 0.7607843, 0, 1,
-1.143762, 0.4241601, -0.8587821, 1, 0.7686275, 0, 1,
-1.130835, -0.5648216, -3.507083, 1, 0.772549, 0, 1,
-1.130083, -1.577146, -3.20176, 1, 0.7803922, 0, 1,
-1.122024, 0.1157713, -1.665114, 1, 0.7843137, 0, 1,
-1.121803, 1.099481, -0.2724105, 1, 0.7921569, 0, 1,
-1.12166, -0.1978369, -1.645615, 1, 0.7960784, 0, 1,
-1.117807, -0.5050605, -3.873803, 1, 0.8039216, 0, 1,
-1.115499, 0.8123519, -1.456717, 1, 0.8117647, 0, 1,
-1.111795, -0.5699542, -1.53603, 1, 0.8156863, 0, 1,
-1.098515, -1.851989, -3.838598, 1, 0.8235294, 0, 1,
-1.09619, -1.53522, -1.943249, 1, 0.827451, 0, 1,
-1.087908, 1.811329, -0.804628, 1, 0.8352941, 0, 1,
-1.078168, -0.3806904, -0.6787008, 1, 0.8392157, 0, 1,
-1.072476, -0.06176824, -1.080457, 1, 0.8470588, 0, 1,
-1.070379, -0.8885855, -1.79831, 1, 0.8509804, 0, 1,
-1.063785, -0.6311817, -1.632064, 1, 0.8588235, 0, 1,
-1.058525, 0.1088628, -1.84808, 1, 0.8627451, 0, 1,
-1.058068, -0.05543386, -0.6795558, 1, 0.8705882, 0, 1,
-1.054868, 0.07867421, -2.501929, 1, 0.8745098, 0, 1,
-1.051588, -0.1440877, -0.9275079, 1, 0.8823529, 0, 1,
-1.030966, 0.09237719, -0.1810908, 1, 0.8862745, 0, 1,
-1.029538, 0.8520015, -1.194237, 1, 0.8941177, 0, 1,
-1.012331, -1.442002, -2.147518, 1, 0.8980392, 0, 1,
-0.9922764, 0.5579666, 0.02536961, 1, 0.9058824, 0, 1,
-0.9902049, 1.703217, -0.7851818, 1, 0.9137255, 0, 1,
-0.9900653, 0.8670622, -0.500791, 1, 0.9176471, 0, 1,
-0.9866059, -0.5838592, -1.275293, 1, 0.9254902, 0, 1,
-0.9808216, -0.9078349, -3.877881, 1, 0.9294118, 0, 1,
-0.9639134, 1.638991, 0.3453749, 1, 0.9372549, 0, 1,
-0.9630884, -0.3218347, -3.522186, 1, 0.9411765, 0, 1,
-0.9600371, 0.4101003, -0.4043839, 1, 0.9490196, 0, 1,
-0.953553, 1.604024, -0.3517954, 1, 0.9529412, 0, 1,
-0.9491398, 0.4785727, -1.084722, 1, 0.9607843, 0, 1,
-0.945237, -0.1497254, -3.888548, 1, 0.9647059, 0, 1,
-0.9397396, -0.4697636, -1.337499, 1, 0.972549, 0, 1,
-0.9324179, -1.513644, -1.744362, 1, 0.9764706, 0, 1,
-0.9313163, -1.15166, -1.28647, 1, 0.9843137, 0, 1,
-0.9294524, -1.488401, -1.827138, 1, 0.9882353, 0, 1,
-0.9249281, 0.1444207, -0.7968165, 1, 0.9960784, 0, 1,
-0.9099218, -0.8622447, -2.648098, 0.9960784, 1, 0, 1,
-0.9072524, -0.5328956, -2.04523, 0.9921569, 1, 0, 1,
-0.9072387, 2.026822, -0.5464914, 0.9843137, 1, 0, 1,
-0.9005741, 0.6102172, -0.9195943, 0.9803922, 1, 0, 1,
-0.8966089, 1.146983, -2.068063, 0.972549, 1, 0, 1,
-0.8957886, -1.150355, -2.731204, 0.9686275, 1, 0, 1,
-0.8925622, 0.9971987, -2.012432, 0.9607843, 1, 0, 1,
-0.8920773, 1.038241, -0.9099903, 0.9568627, 1, 0, 1,
-0.8879588, -0.4086688, -0.5826768, 0.9490196, 1, 0, 1,
-0.886299, 0.105794, -2.944272, 0.945098, 1, 0, 1,
-0.8848005, 0.7077439, -0.8078539, 0.9372549, 1, 0, 1,
-0.8838355, -0.5880111, -1.32624, 0.9333333, 1, 0, 1,
-0.8735973, 0.1053617, -1.615787, 0.9254902, 1, 0, 1,
-0.8676863, -1.259802, -3.528882, 0.9215686, 1, 0, 1,
-0.8658607, -0.2164878, -2.993928, 0.9137255, 1, 0, 1,
-0.8624016, 0.005056943, -0.1053246, 0.9098039, 1, 0, 1,
-0.8586326, 1.129196, 0.3316483, 0.9019608, 1, 0, 1,
-0.8574547, 0.5718448, -0.5182216, 0.8941177, 1, 0, 1,
-0.8549739, -0.01437703, -1.701241, 0.8901961, 1, 0, 1,
-0.8547713, 1.06027, -1.130085, 0.8823529, 1, 0, 1,
-0.8496802, 1.763595, 0.5905122, 0.8784314, 1, 0, 1,
-0.8496642, 0.6334021, -1.860627, 0.8705882, 1, 0, 1,
-0.8436514, 0.7467207, -1.43261, 0.8666667, 1, 0, 1,
-0.843315, -0.1973537, -3.476781, 0.8588235, 1, 0, 1,
-0.8416132, 0.9521739, -1.900993, 0.854902, 1, 0, 1,
-0.8410035, 0.403357, -0.7099811, 0.8470588, 1, 0, 1,
-0.8388975, -0.6515282, -1.466731, 0.8431373, 1, 0, 1,
-0.8362114, -1.730533, -3.980526, 0.8352941, 1, 0, 1,
-0.8334439, 1.198864, -0.7611383, 0.8313726, 1, 0, 1,
-0.8252571, 0.6659989, -0.5564288, 0.8235294, 1, 0, 1,
-0.8238351, -0.6599646, -0.5085863, 0.8196079, 1, 0, 1,
-0.8231035, 0.08583958, -1.842723, 0.8117647, 1, 0, 1,
-0.8196279, 1.033967, -0.5932016, 0.8078431, 1, 0, 1,
-0.8105972, -1.403402, -3.397771, 0.8, 1, 0, 1,
-0.8035401, -1.410448, -2.415427, 0.7921569, 1, 0, 1,
-0.796002, -0.1070374, -1.639019, 0.7882353, 1, 0, 1,
-0.7914901, -1.794544, -2.8391, 0.7803922, 1, 0, 1,
-0.7912673, -0.1146611, -2.329685, 0.7764706, 1, 0, 1,
-0.7851151, -0.3573897, -3.064193, 0.7686275, 1, 0, 1,
-0.7831597, -0.1293689, -1.223176, 0.7647059, 1, 0, 1,
-0.7779646, 0.558037, -0.07579319, 0.7568628, 1, 0, 1,
-0.7755277, 0.3633664, -1.218658, 0.7529412, 1, 0, 1,
-0.772245, -0.3272235, -1.376267, 0.7450981, 1, 0, 1,
-0.7713668, 1.899556, 1.083922, 0.7411765, 1, 0, 1,
-0.7676703, 0.274481, -2.225425, 0.7333333, 1, 0, 1,
-0.7671383, -0.07469889, -1.087056, 0.7294118, 1, 0, 1,
-0.7669242, -0.9597793, -1.071131, 0.7215686, 1, 0, 1,
-0.7581801, -1.008369, -1.663688, 0.7176471, 1, 0, 1,
-0.7373251, 0.2066799, -1.455309, 0.7098039, 1, 0, 1,
-0.7345966, -1.100938, -2.585467, 0.7058824, 1, 0, 1,
-0.7342284, 0.4250375, -0.932681, 0.6980392, 1, 0, 1,
-0.7310887, 0.2069882, -0.6770242, 0.6901961, 1, 0, 1,
-0.7303435, -0.8558671, -1.305136, 0.6862745, 1, 0, 1,
-0.7295969, -0.3838797, -2.042368, 0.6784314, 1, 0, 1,
-0.7290515, 0.9644949, 0.3928246, 0.6745098, 1, 0, 1,
-0.7236094, -1.462472, -2.50645, 0.6666667, 1, 0, 1,
-0.7163948, 0.5677975, -1.897851, 0.6627451, 1, 0, 1,
-0.705058, 1.037994, -0.2272165, 0.654902, 1, 0, 1,
-0.7027697, 0.4139416, -1.642029, 0.6509804, 1, 0, 1,
-0.6934729, 0.1162943, -1.377101, 0.6431373, 1, 0, 1,
-0.6926388, 0.9118308, 0.2024923, 0.6392157, 1, 0, 1,
-0.6895537, -0.7852837, -2.078424, 0.6313726, 1, 0, 1,
-0.6846262, 0.3030739, 0.8917353, 0.627451, 1, 0, 1,
-0.6809133, -0.1259878, -1.742935, 0.6196079, 1, 0, 1,
-0.6760552, 0.1627541, -1.704864, 0.6156863, 1, 0, 1,
-0.6756125, -1.4752e-05, -1.275556, 0.6078432, 1, 0, 1,
-0.6742308, -0.5657168, -3.105912, 0.6039216, 1, 0, 1,
-0.6699553, 0.7981625, -0.781709, 0.5960785, 1, 0, 1,
-0.6684479, 0.5900443, 0.04622052, 0.5882353, 1, 0, 1,
-0.667456, -0.270263, -0.386393, 0.5843138, 1, 0, 1,
-0.6633687, -0.1684365, -3.143742, 0.5764706, 1, 0, 1,
-0.6590335, 1.491937, 0.1112283, 0.572549, 1, 0, 1,
-0.6589586, -0.2722903, -0.8998888, 0.5647059, 1, 0, 1,
-0.6520249, -1.325383, -1.614926, 0.5607843, 1, 0, 1,
-0.6509424, -1.312921, -2.936412, 0.5529412, 1, 0, 1,
-0.6448963, -0.386396, -2.063206, 0.5490196, 1, 0, 1,
-0.6438138, 0.06805722, -1.941813, 0.5411765, 1, 0, 1,
-0.6409763, -0.8442595, -3.722053, 0.5372549, 1, 0, 1,
-0.6341076, 0.3035545, -0.6684418, 0.5294118, 1, 0, 1,
-0.6284992, -0.009616232, -1.167531, 0.5254902, 1, 0, 1,
-0.6250126, -0.5907465, -2.553552, 0.5176471, 1, 0, 1,
-0.6233343, -1.580676, -1.709248, 0.5137255, 1, 0, 1,
-0.6175895, -1.070749, -1.285228, 0.5058824, 1, 0, 1,
-0.6149574, -0.1269109, -1.371375, 0.5019608, 1, 0, 1,
-0.61261, 0.5434125, -0.5268981, 0.4941176, 1, 0, 1,
-0.6109289, 1.004293, -0.2851953, 0.4862745, 1, 0, 1,
-0.6087732, -0.2423071, -2.652929, 0.4823529, 1, 0, 1,
-0.6075935, 0.8967689, -1.049542, 0.4745098, 1, 0, 1,
-0.603032, 0.07724375, -2.494509, 0.4705882, 1, 0, 1,
-0.6004599, 1.212856, 0.4115496, 0.4627451, 1, 0, 1,
-0.5984572, 1.002039, -0.7262363, 0.4588235, 1, 0, 1,
-0.5949323, 0.3948528, -1.155042, 0.4509804, 1, 0, 1,
-0.5948914, 0.8615515, -1.283789, 0.4470588, 1, 0, 1,
-0.5936975, 0.1843416, -4.148287, 0.4392157, 1, 0, 1,
-0.5908184, 0.2124566, -2.731966, 0.4352941, 1, 0, 1,
-0.5866116, -0.589428, -1.807486, 0.427451, 1, 0, 1,
-0.5801042, 1.465758, 0.3871621, 0.4235294, 1, 0, 1,
-0.578701, -1.456959, -3.166926, 0.4156863, 1, 0, 1,
-0.5780954, -0.6499679, -1.527927, 0.4117647, 1, 0, 1,
-0.5676113, -1.153478, -1.906896, 0.4039216, 1, 0, 1,
-0.5634946, 0.06024046, -2.67152, 0.3960784, 1, 0, 1,
-0.5611655, -0.06746129, -2.958653, 0.3921569, 1, 0, 1,
-0.5600088, 1.911797, 1.921686, 0.3843137, 1, 0, 1,
-0.560001, 1.141431, 0.01440466, 0.3803922, 1, 0, 1,
-0.5583128, 0.6942346, -1.52991, 0.372549, 1, 0, 1,
-0.5571729, 0.4499546, -1.591928, 0.3686275, 1, 0, 1,
-0.5527708, -0.5639643, -2.770673, 0.3607843, 1, 0, 1,
-0.5518789, 1.05212, -0.5897713, 0.3568628, 1, 0, 1,
-0.5421116, 1.58303, -0.6934253, 0.3490196, 1, 0, 1,
-0.5390515, -0.9466655, -2.467267, 0.345098, 1, 0, 1,
-0.5336888, -1.10425, -3.036319, 0.3372549, 1, 0, 1,
-0.5318298, -0.1713702, 0.2665263, 0.3333333, 1, 0, 1,
-0.5272346, 0.8412202, -0.9804096, 0.3254902, 1, 0, 1,
-0.5262374, -0.9769606, -1.893439, 0.3215686, 1, 0, 1,
-0.5248748, 1.243057, 0.8001876, 0.3137255, 1, 0, 1,
-0.5244009, -0.9144358, -0.913591, 0.3098039, 1, 0, 1,
-0.5228024, -1.294273, -2.239896, 0.3019608, 1, 0, 1,
-0.516982, 0.2755281, -2.02633, 0.2941177, 1, 0, 1,
-0.5165243, -0.5267447, -2.369937, 0.2901961, 1, 0, 1,
-0.5081367, -0.2696309, -2.826293, 0.282353, 1, 0, 1,
-0.5076918, 0.1718308, -0.1190583, 0.2784314, 1, 0, 1,
-0.502879, 0.1133106, -1.581602, 0.2705882, 1, 0, 1,
-0.4990189, 0.9627353, -0.843501, 0.2666667, 1, 0, 1,
-0.4989357, -1.026341, -1.034005, 0.2588235, 1, 0, 1,
-0.4880603, -0.2190234, -2.529136, 0.254902, 1, 0, 1,
-0.4810831, -0.3927731, -2.003567, 0.2470588, 1, 0, 1,
-0.4751991, 0.2483547, 0.5406724, 0.2431373, 1, 0, 1,
-0.4751226, 0.6699921, -0.9871256, 0.2352941, 1, 0, 1,
-0.470441, -0.3139208, -2.766434, 0.2313726, 1, 0, 1,
-0.4702508, -0.8790213, -2.739176, 0.2235294, 1, 0, 1,
-0.4666182, -0.4166107, -2.955658, 0.2196078, 1, 0, 1,
-0.4639214, 1.187262, -1.77514, 0.2117647, 1, 0, 1,
-0.462677, -1.18241, -2.156506, 0.2078431, 1, 0, 1,
-0.4604554, 0.2973857, -1.963761, 0.2, 1, 0, 1,
-0.4584436, 0.4957335, -0.2450441, 0.1921569, 1, 0, 1,
-0.4576777, 0.2667502, -0.5391634, 0.1882353, 1, 0, 1,
-0.4524395, -1.021196, -3.414143, 0.1803922, 1, 0, 1,
-0.4480492, -1.026841, -2.741022, 0.1764706, 1, 0, 1,
-0.4473913, 1.650299, -0.3751698, 0.1686275, 1, 0, 1,
-0.4472426, 0.7882279, -0.9392463, 0.1647059, 1, 0, 1,
-0.4443213, 1.158584, -1.279997, 0.1568628, 1, 0, 1,
-0.4348276, 0.4989285, 0.1890469, 0.1529412, 1, 0, 1,
-0.4325268, 0.4514708, -0.9495643, 0.145098, 1, 0, 1,
-0.4305792, -1.537937, -1.158279, 0.1411765, 1, 0, 1,
-0.4305648, 0.04170201, -2.082123, 0.1333333, 1, 0, 1,
-0.4283582, -1.065466, -3.24172, 0.1294118, 1, 0, 1,
-0.4230373, -0.5345137, -2.684416, 0.1215686, 1, 0, 1,
-0.4176748, -1.880878, -2.931466, 0.1176471, 1, 0, 1,
-0.4064127, -0.3086234, -2.176728, 0.1098039, 1, 0, 1,
-0.4057433, -0.3870744, -3.297467, 0.1058824, 1, 0, 1,
-0.401683, 1.378775, -0.0400129, 0.09803922, 1, 0, 1,
-0.3966599, 0.8267333, 0.06285699, 0.09019608, 1, 0, 1,
-0.3965919, 2.431922, -1.505495, 0.08627451, 1, 0, 1,
-0.3910686, -1.785897, -2.478405, 0.07843138, 1, 0, 1,
-0.3861341, 1.743057, -0.6135623, 0.07450981, 1, 0, 1,
-0.3851887, -0.004699807, -1.084379, 0.06666667, 1, 0, 1,
-0.3840227, 0.7435899, -0.1020892, 0.0627451, 1, 0, 1,
-0.37887, 0.453207, -0.5945922, 0.05490196, 1, 0, 1,
-0.3752714, 1.254093, -1.350837, 0.05098039, 1, 0, 1,
-0.3749334, -0.4712618, -2.422886, 0.04313726, 1, 0, 1,
-0.3732183, -0.5883269, -2.771078, 0.03921569, 1, 0, 1,
-0.3697239, 1.242898, -1.216385, 0.03137255, 1, 0, 1,
-0.3679617, -1.197389, -2.237513, 0.02745098, 1, 0, 1,
-0.3673385, 1.406003, -2.418573, 0.01960784, 1, 0, 1,
-0.3657817, 0.7285954, 1.074426, 0.01568628, 1, 0, 1,
-0.3648412, -1.458745, -1.971688, 0.007843138, 1, 0, 1,
-0.3627029, 1.244424, 0.582001, 0.003921569, 1, 0, 1,
-0.3622226, -0.8942771, -3.49155, 0, 1, 0.003921569, 1,
-0.3613905, -1.321429, -3.549866, 0, 1, 0.01176471, 1,
-0.3613684, -0.649685, -2.276678, 0, 1, 0.01568628, 1,
-0.3613218, 0.6015018, -0.001956628, 0, 1, 0.02352941, 1,
-0.3602964, -0.74712, -2.918065, 0, 1, 0.02745098, 1,
-0.3601163, 0.9092479, 0.9947697, 0, 1, 0.03529412, 1,
-0.3566848, 1.137232, -0.8406447, 0, 1, 0.03921569, 1,
-0.3558794, -0.1035024, -0.2056227, 0, 1, 0.04705882, 1,
-0.3494629, -1.327777, -3.978273, 0, 1, 0.05098039, 1,
-0.3458942, 0.8692425, -0.2560808, 0, 1, 0.05882353, 1,
-0.3441219, -0.08968753, -1.296763, 0, 1, 0.0627451, 1,
-0.3418289, -0.2014739, -2.851398, 0, 1, 0.07058824, 1,
-0.341017, -1.939988, -3.356164, 0, 1, 0.07450981, 1,
-0.3408306, 1.086816, -0.3525302, 0, 1, 0.08235294, 1,
-0.339612, 0.5352203, 1.893174, 0, 1, 0.08627451, 1,
-0.3394691, 2.654958, 0.5546312, 0, 1, 0.09411765, 1,
-0.3362039, 0.311802, -0.2779191, 0, 1, 0.1019608, 1,
-0.3360972, 0.6492571, 1.162785, 0, 1, 0.1058824, 1,
-0.3292465, -0.4225607, -4.490309, 0, 1, 0.1137255, 1,
-0.3258546, 0.5411842, 0.3460602, 0, 1, 0.1176471, 1,
-0.3251154, 0.5073889, -1.152081, 0, 1, 0.1254902, 1,
-0.3220283, -1.035357, -1.368654, 0, 1, 0.1294118, 1,
-0.3197339, 1.646639, -2.589519, 0, 1, 0.1372549, 1,
-0.3191172, -0.7605829, -2.214712, 0, 1, 0.1411765, 1,
-0.312315, 0.7365006, 0.06561781, 0, 1, 0.1490196, 1,
-0.3090385, 0.5315968, 0.8316281, 0, 1, 0.1529412, 1,
-0.3009284, -0.8730326, -3.642944, 0, 1, 0.1607843, 1,
-0.2964885, -0.7522804, -1.085669, 0, 1, 0.1647059, 1,
-0.2891122, 0.08875193, -1.217017, 0, 1, 0.172549, 1,
-0.2861504, 0.7966529, -2.190516, 0, 1, 0.1764706, 1,
-0.2838854, 0.8692775, -0.7581525, 0, 1, 0.1843137, 1,
-0.2836991, -0.5662508, -4.227773, 0, 1, 0.1882353, 1,
-0.277258, 0.357631, -1.963295, 0, 1, 0.1960784, 1,
-0.2735566, 1.394196, -0.5303239, 0, 1, 0.2039216, 1,
-0.2707894, 0.1289419, -2.386038, 0, 1, 0.2078431, 1,
-0.2698165, 0.6973373, -0.2878349, 0, 1, 0.2156863, 1,
-0.2677553, -0.4624538, -1.831976, 0, 1, 0.2196078, 1,
-0.2603626, 0.2249245, -0.8562765, 0, 1, 0.227451, 1,
-0.2595378, -0.04492988, -3.402665, 0, 1, 0.2313726, 1,
-0.2571588, -0.02432978, -2.06375, 0, 1, 0.2392157, 1,
-0.2566606, 0.1530223, -0.3090034, 0, 1, 0.2431373, 1,
-0.2566128, -1.222846, -4.246757, 0, 1, 0.2509804, 1,
-0.253706, -1.168605, -4.949422, 0, 1, 0.254902, 1,
-0.2492947, 0.08555024, -0.4224844, 0, 1, 0.2627451, 1,
-0.241567, -0.4971009, -2.496465, 0, 1, 0.2666667, 1,
-0.2359332, -0.3058738, -1.851323, 0, 1, 0.2745098, 1,
-0.2355844, -1.31365, -4.501796, 0, 1, 0.2784314, 1,
-0.2355264, 1.206689, -0.8623527, 0, 1, 0.2862745, 1,
-0.2327013, -0.08000919, -2.277311, 0, 1, 0.2901961, 1,
-0.231547, -0.9484444, -2.385594, 0, 1, 0.2980392, 1,
-0.2245075, -0.1118271, -3.852413, 0, 1, 0.3058824, 1,
-0.2161075, -0.8082888, -2.814746, 0, 1, 0.3098039, 1,
-0.2153427, 1.000837, 0.7606326, 0, 1, 0.3176471, 1,
-0.215158, -0.2451173, -3.365706, 0, 1, 0.3215686, 1,
-0.2142519, 0.02883267, -1.627348, 0, 1, 0.3294118, 1,
-0.2132234, -0.5292895, -3.07002, 0, 1, 0.3333333, 1,
-0.2107996, -1.581407, -3.670297, 0, 1, 0.3411765, 1,
-0.1935933, -0.5796435, -2.688058, 0, 1, 0.345098, 1,
-0.1866645, -1.928492, -2.264282, 0, 1, 0.3529412, 1,
-0.1818944, -0.9217143, -3.626901, 0, 1, 0.3568628, 1,
-0.1787641, -0.05066007, -0.4648206, 0, 1, 0.3647059, 1,
-0.1782139, 1.247382, 1.029509, 0, 1, 0.3686275, 1,
-0.1776652, -1.780787, -3.811599, 0, 1, 0.3764706, 1,
-0.1755855, 0.02601868, -1.404867, 0, 1, 0.3803922, 1,
-0.1713808, 0.0852402, -0.1062226, 0, 1, 0.3882353, 1,
-0.1688123, 0.4811544, 0.02948674, 0, 1, 0.3921569, 1,
-0.1653983, 0.6949758, -1.538896, 0, 1, 0.4, 1,
-0.1637776, -0.07551681, -1.610611, 0, 1, 0.4078431, 1,
-0.1612387, -0.1375308, -1.586022, 0, 1, 0.4117647, 1,
-0.1535541, 0.4988695, 0.7135812, 0, 1, 0.4196078, 1,
-0.1533588, -1.672218, -3.914227, 0, 1, 0.4235294, 1,
-0.1528639, 0.7290866, 0.9362268, 0, 1, 0.4313726, 1,
-0.1511456, 1.732756, 1.139027, 0, 1, 0.4352941, 1,
-0.1501273, -0.6421954, -3.255787, 0, 1, 0.4431373, 1,
-0.1482483, -1.389275, -2.560111, 0, 1, 0.4470588, 1,
-0.1450591, -0.2440409, -3.465478, 0, 1, 0.454902, 1,
-0.1422014, 0.4198426, 0.3996989, 0, 1, 0.4588235, 1,
-0.1391974, -0.04708246, -1.448846, 0, 1, 0.4666667, 1,
-0.1368641, 0.1345662, -1.958547, 0, 1, 0.4705882, 1,
-0.1326809, 0.1414763, -0.06200019, 0, 1, 0.4784314, 1,
-0.131393, -0.1585715, 0.7093414, 0, 1, 0.4823529, 1,
-0.1230853, 0.9832812, -0.6980505, 0, 1, 0.4901961, 1,
-0.1192493, 0.2137552, -1.653226, 0, 1, 0.4941176, 1,
-0.1183797, 0.259655, -1.949339, 0, 1, 0.5019608, 1,
-0.1177454, 1.502986, -1.068921, 0, 1, 0.509804, 1,
-0.1171732, 0.3563095, -2.287838, 0, 1, 0.5137255, 1,
-0.1114709, 1.290238, -0.5724998, 0, 1, 0.5215687, 1,
-0.10914, -0.7230831, -3.389948, 0, 1, 0.5254902, 1,
-0.1002371, 0.2261793, 0.04331147, 0, 1, 0.5333334, 1,
-0.09789159, -0.1657307, -0.9279135, 0, 1, 0.5372549, 1,
-0.09641812, -0.353688, -4.314927, 0, 1, 0.5450981, 1,
-0.09521932, -0.1499617, -3.222106, 0, 1, 0.5490196, 1,
-0.09117414, -1.186883, -1.928483, 0, 1, 0.5568628, 1,
-0.09014353, -1.16931, -3.476928, 0, 1, 0.5607843, 1,
-0.08754645, -1.031385, -2.755753, 0, 1, 0.5686275, 1,
-0.08714569, -0.2996269, -3.044539, 0, 1, 0.572549, 1,
-0.0834282, -0.7820935, -2.993393, 0, 1, 0.5803922, 1,
-0.08029004, -0.05479683, -0.7189276, 0, 1, 0.5843138, 1,
-0.07983941, 1.07301, -0.9442702, 0, 1, 0.5921569, 1,
-0.07781018, -0.9815587, -2.797362, 0, 1, 0.5960785, 1,
-0.07264488, -0.4634044, -3.092285, 0, 1, 0.6039216, 1,
-0.07034091, -1.223033, -2.797173, 0, 1, 0.6117647, 1,
-0.06597133, -0.1174425, -1.875975, 0, 1, 0.6156863, 1,
-0.0558279, -0.2292398, -5.11473, 0, 1, 0.6235294, 1,
-0.05502818, 0.9877296, 0.6677713, 0, 1, 0.627451, 1,
-0.05489964, 0.8764347, -1.401272, 0, 1, 0.6352941, 1,
-0.05355596, 0.7225283, 0.815066, 0, 1, 0.6392157, 1,
-0.0522674, 0.723726, -1.459738, 0, 1, 0.6470588, 1,
-0.05187558, 0.7000375, 1.144674, 0, 1, 0.6509804, 1,
-0.0512289, -0.9393469, -2.831887, 0, 1, 0.6588235, 1,
-0.04796604, -2.120478, -5.461401, 0, 1, 0.6627451, 1,
-0.04535274, 0.4971015, 0.493885, 0, 1, 0.6705883, 1,
-0.04421471, 1.818808, 0.2329404, 0, 1, 0.6745098, 1,
-0.04369316, 0.7432466, 0.2963468, 0, 1, 0.682353, 1,
-0.04321615, -1.809913, -3.416258, 0, 1, 0.6862745, 1,
-0.04265602, 0.6586716, -1.362888, 0, 1, 0.6941177, 1,
-0.03846515, -0.3960086, -3.081137, 0, 1, 0.7019608, 1,
-0.03837115, 0.5992154, -1.410212, 0, 1, 0.7058824, 1,
-0.025427, -0.619947, -0.9769454, 0, 1, 0.7137255, 1,
-0.02505646, -1.471059, -2.895972, 0, 1, 0.7176471, 1,
-0.02141523, -1.524959, -1.431367, 0, 1, 0.7254902, 1,
-0.02111124, -0.1354432, -4.346582, 0, 1, 0.7294118, 1,
-0.01486958, 0.1084037, 0.834353, 0, 1, 0.7372549, 1,
-0.01358187, -2.164716, -3.301629, 0, 1, 0.7411765, 1,
-0.01172788, 0.6854433, -1.337033, 0, 1, 0.7490196, 1,
-0.006860884, 0.3201289, -1.417966, 0, 1, 0.7529412, 1,
-0.006018684, 0.1130671, -1.234807, 0, 1, 0.7607843, 1,
-0.005302821, -0.4040065, -4.383013, 0, 1, 0.7647059, 1,
-0.003750359, 0.1330236, 0.2094284, 0, 1, 0.772549, 1,
-0.0002213207, 1.853432, -1.063172, 0, 1, 0.7764706, 1,
0.003637174, -1.396333, 3.508965, 0, 1, 0.7843137, 1,
0.00533511, -0.1218895, 3.252244, 0, 1, 0.7882353, 1,
0.006732372, -0.6526946, 2.963084, 0, 1, 0.7960784, 1,
0.00724426, -0.02455597, 2.840271, 0, 1, 0.8039216, 1,
0.008942484, -0.03624782, 3.184581, 0, 1, 0.8078431, 1,
0.00989373, -1.088425, 3.444582, 0, 1, 0.8156863, 1,
0.01074047, 0.173326, -1.411642, 0, 1, 0.8196079, 1,
0.0130419, 0.1106722, -0.1746458, 0, 1, 0.827451, 1,
0.01415563, -0.8384471, 3.497824, 0, 1, 0.8313726, 1,
0.01589877, -1.428157, 2.242968, 0, 1, 0.8392157, 1,
0.01673598, 1.574698, -0.7885656, 0, 1, 0.8431373, 1,
0.01813569, 0.440891, -0.3215267, 0, 1, 0.8509804, 1,
0.01878705, 1.97256, 0.4140675, 0, 1, 0.854902, 1,
0.02280848, 0.33958, 0.0972145, 0, 1, 0.8627451, 1,
0.02375107, 1.513286, -1.82485, 0, 1, 0.8666667, 1,
0.0269783, -0.7162386, 1.607563, 0, 1, 0.8745098, 1,
0.02841226, -1.345601, 3.621552, 0, 1, 0.8784314, 1,
0.02847415, -0.09122196, 4.145765, 0, 1, 0.8862745, 1,
0.02912149, 1.166369, 1.190186, 0, 1, 0.8901961, 1,
0.03947538, -0.1101695, 2.006424, 0, 1, 0.8980392, 1,
0.04003547, 1.528656, -1.265647, 0, 1, 0.9058824, 1,
0.04069371, 1.844888, 1.273787, 0, 1, 0.9098039, 1,
0.0456792, 1.314651, -0.8746678, 0, 1, 0.9176471, 1,
0.04781492, 0.8475323, -1.702161, 0, 1, 0.9215686, 1,
0.04963666, 0.2416692, -0.04760153, 0, 1, 0.9294118, 1,
0.05080315, -0.06271667, 1.437802, 0, 1, 0.9333333, 1,
0.05179537, 0.5757247, -0.600973, 0, 1, 0.9411765, 1,
0.05274045, -0.2779957, 1.5057, 0, 1, 0.945098, 1,
0.05407314, -1.882624, 2.417091, 0, 1, 0.9529412, 1,
0.05450939, 1.991794, 2.082469, 0, 1, 0.9568627, 1,
0.05871894, -0.4934488, 3.902232, 0, 1, 0.9647059, 1,
0.06292138, -0.6558416, 2.09894, 0, 1, 0.9686275, 1,
0.06591273, 0.6819025, 2.252437, 0, 1, 0.9764706, 1,
0.06690075, -1.039273, 4.05758, 0, 1, 0.9803922, 1,
0.07215922, -0.8982337, 4.087758, 0, 1, 0.9882353, 1,
0.07335573, 0.2213283, 1.3994, 0, 1, 0.9921569, 1,
0.07336719, 0.6995925, 0.3585252, 0, 1, 1, 1,
0.07587562, -0.9966112, 2.221221, 0, 0.9921569, 1, 1,
0.07829279, -0.09864937, 1.688969, 0, 0.9882353, 1, 1,
0.08170907, 0.1462489, 1.411995, 0, 0.9803922, 1, 1,
0.08804761, 1.233773, -0.4024604, 0, 0.9764706, 1, 1,
0.08855651, 0.2953311, -0.8206673, 0, 0.9686275, 1, 1,
0.0893915, -0.513684, 2.659938, 0, 0.9647059, 1, 1,
0.09413718, 0.1962162, 0.9645413, 0, 0.9568627, 1, 1,
0.100952, 0.4756399, 0.1869873, 0, 0.9529412, 1, 1,
0.1015071, -1.328248, 2.56282, 0, 0.945098, 1, 1,
0.1041486, -0.9657635, 4.781078, 0, 0.9411765, 1, 1,
0.1061428, 0.5134867, 0.1193699, 0, 0.9333333, 1, 1,
0.1103512, 1.48002, 0.9568748, 0, 0.9294118, 1, 1,
0.1103647, -0.1104084, 3.15158, 0, 0.9215686, 1, 1,
0.116216, -0.8698012, 3.983856, 0, 0.9176471, 1, 1,
0.1165188, 1.716885, 0.7272583, 0, 0.9098039, 1, 1,
0.1184945, -0.3456284, 3.370491, 0, 0.9058824, 1, 1,
0.1209419, 0.7990524, -1.003742, 0, 0.8980392, 1, 1,
0.123227, -0.5426715, 3.868947, 0, 0.8901961, 1, 1,
0.1249597, 0.0895459, 1.233661, 0, 0.8862745, 1, 1,
0.1338973, 0.01060649, 1.395275, 0, 0.8784314, 1, 1,
0.1341724, 0.2430629, 0.2706846, 0, 0.8745098, 1, 1,
0.1411233, 0.1135518, 0.2576107, 0, 0.8666667, 1, 1,
0.1440354, 1.122989, -1.132211, 0, 0.8627451, 1, 1,
0.1471937, 0.4178628, -0.02119287, 0, 0.854902, 1, 1,
0.1473128, -0.4382671, 3.123045, 0, 0.8509804, 1, 1,
0.1487039, -0.6647891, 2.730799, 0, 0.8431373, 1, 1,
0.1524013, -2.168258, 4.314853, 0, 0.8392157, 1, 1,
0.1580878, 0.6392657, 0.3469232, 0, 0.8313726, 1, 1,
0.1619181, 1.095607, 0.7446807, 0, 0.827451, 1, 1,
0.1664061, -0.07673571, 1.657322, 0, 0.8196079, 1, 1,
0.166775, -0.5266021, 2.151734, 0, 0.8156863, 1, 1,
0.1671761, -1.321772, 4.999217, 0, 0.8078431, 1, 1,
0.1673869, 0.9729918, 0.9163049, 0, 0.8039216, 1, 1,
0.1686847, -0.3211382, 3.497005, 0, 0.7960784, 1, 1,
0.1687741, 0.315438, 1.640741, 0, 0.7882353, 1, 1,
0.1800981, -0.2696022, 3.000416, 0, 0.7843137, 1, 1,
0.1825602, -0.6424607, 2.011473, 0, 0.7764706, 1, 1,
0.1834154, 0.1249128, -0.3084691, 0, 0.772549, 1, 1,
0.1836914, -0.08150262, 2.140045, 0, 0.7647059, 1, 1,
0.1838588, -1.052763, 3.946264, 0, 0.7607843, 1, 1,
0.1844783, -0.2337182, 2.44661, 0, 0.7529412, 1, 1,
0.1855227, -0.1197048, 4.288521, 0, 0.7490196, 1, 1,
0.1858087, -0.4179679, 1.56864, 0, 0.7411765, 1, 1,
0.1867499, -1.46728, 2.401403, 0, 0.7372549, 1, 1,
0.1873525, 0.1286906, 0.1960774, 0, 0.7294118, 1, 1,
0.187435, -0.877158, 1.32532, 0, 0.7254902, 1, 1,
0.1905842, -3.209479, 3.475298, 0, 0.7176471, 1, 1,
0.1940326, -0.6800671, 3.553735, 0, 0.7137255, 1, 1,
0.1954979, -1.861573, 4.011201, 0, 0.7058824, 1, 1,
0.1970873, 0.2703028, 0.6435662, 0, 0.6980392, 1, 1,
0.1976927, 2.303175, 0.6906545, 0, 0.6941177, 1, 1,
0.1979958, -0.6568961, 2.374216, 0, 0.6862745, 1, 1,
0.1983288, -0.2892382, 1.30024, 0, 0.682353, 1, 1,
0.1987858, -0.567394, -0.3295761, 0, 0.6745098, 1, 1,
0.1996267, 0.3710708, 0.229509, 0, 0.6705883, 1, 1,
0.2017966, -0.1538597, 3.751715, 0, 0.6627451, 1, 1,
0.2041155, 0.8010729, 0.1667137, 0, 0.6588235, 1, 1,
0.2047311, -1.926064, 2.567192, 0, 0.6509804, 1, 1,
0.2064839, 0.6339579, -0.2921008, 0, 0.6470588, 1, 1,
0.2082442, -1.340717, 2.646263, 0, 0.6392157, 1, 1,
0.2083663, -1.396349, 2.106215, 0, 0.6352941, 1, 1,
0.2146232, -0.3029199, 3.328308, 0, 0.627451, 1, 1,
0.2212483, 0.03557348, 2.128231, 0, 0.6235294, 1, 1,
0.2248324, 0.7368304, -1.646114, 0, 0.6156863, 1, 1,
0.2265019, -0.3144272, 2.339408, 0, 0.6117647, 1, 1,
0.2282249, -0.9271058, 3.940282, 0, 0.6039216, 1, 1,
0.231628, -0.02448797, 1.615012, 0, 0.5960785, 1, 1,
0.2316772, 0.2968967, 0.7164307, 0, 0.5921569, 1, 1,
0.232165, -0.4419038, 2.431604, 0, 0.5843138, 1, 1,
0.2336979, -1.002983, 4.625888, 0, 0.5803922, 1, 1,
0.2351896, -2.086842, 2.164481, 0, 0.572549, 1, 1,
0.235328, 0.4976901, 2.205032, 0, 0.5686275, 1, 1,
0.2356018, -1.007248, 1.31839, 0, 0.5607843, 1, 1,
0.239313, 0.8074175, 1.06699, 0, 0.5568628, 1, 1,
0.2403336, -0.8631523, 2.49354, 0, 0.5490196, 1, 1,
0.2428802, -0.1049798, 1.173512, 0, 0.5450981, 1, 1,
0.2430637, -0.8325984, 1.75339, 0, 0.5372549, 1, 1,
0.2432831, -0.9407014, 3.907985, 0, 0.5333334, 1, 1,
0.2438528, 0.3805963, -1.964324, 0, 0.5254902, 1, 1,
0.2449156, 0.4177744, -0.9240872, 0, 0.5215687, 1, 1,
0.2464332, 0.03565011, 2.111828, 0, 0.5137255, 1, 1,
0.2496562, 0.1912017, 0.5721949, 0, 0.509804, 1, 1,
0.2545723, -0.1455705, 3.173213, 0, 0.5019608, 1, 1,
0.2561116, 0.9684256, 2.104018, 0, 0.4941176, 1, 1,
0.2561544, 0.05395467, 1.985064, 0, 0.4901961, 1, 1,
0.2578084, 0.04895558, 3.334585, 0, 0.4823529, 1, 1,
0.2579911, 0.3338355, 0.7441599, 0, 0.4784314, 1, 1,
0.2677384, 0.9662382, 2.23342, 0, 0.4705882, 1, 1,
0.270315, -0.1438413, 4.256245, 0, 0.4666667, 1, 1,
0.2705365, -0.342234, 1.912594, 0, 0.4588235, 1, 1,
0.276385, -0.09050996, 1.712984, 0, 0.454902, 1, 1,
0.2800997, -0.2671695, 2.29616, 0, 0.4470588, 1, 1,
0.2841246, -0.6097871, 2.178289, 0, 0.4431373, 1, 1,
0.2888502, -0.4752325, 2.554247, 0, 0.4352941, 1, 1,
0.2897062, -1.374776, 3.201535, 0, 0.4313726, 1, 1,
0.2900032, -1.868657, 3.552925, 0, 0.4235294, 1, 1,
0.3042741, -1.899495, 1.624126, 0, 0.4196078, 1, 1,
0.3099645, -1.175125, 2.474159, 0, 0.4117647, 1, 1,
0.310644, 0.3322343, -0.08618261, 0, 0.4078431, 1, 1,
0.3165752, 0.2208462, 0.295042, 0, 0.4, 1, 1,
0.3186342, 1.698385, 1.267058, 0, 0.3921569, 1, 1,
0.3192402, 1.496743, -1.592982, 0, 0.3882353, 1, 1,
0.320816, 0.5247567, -0.8730291, 0, 0.3803922, 1, 1,
0.3220885, 0.05613214, 0.8100959, 0, 0.3764706, 1, 1,
0.3273217, -0.379398, 3.223081, 0, 0.3686275, 1, 1,
0.3303976, -0.4871818, 4.156932, 0, 0.3647059, 1, 1,
0.3316164, 1.017352, -0.02512089, 0, 0.3568628, 1, 1,
0.3334953, -1.12244, 2.642392, 0, 0.3529412, 1, 1,
0.3337443, 1.255171, 0.07973196, 0, 0.345098, 1, 1,
0.3360789, -0.9049784, 2.12949, 0, 0.3411765, 1, 1,
0.3415087, 2.290349, -0.09855717, 0, 0.3333333, 1, 1,
0.3425263, 0.2459514, 1.767712, 0, 0.3294118, 1, 1,
0.3491961, 0.1945897, 0.003695466, 0, 0.3215686, 1, 1,
0.3562322, 0.7064903, 0.1421717, 0, 0.3176471, 1, 1,
0.3635669, 0.9183626, 0.2606343, 0, 0.3098039, 1, 1,
0.3636154, 1.754089, 0.8438904, 0, 0.3058824, 1, 1,
0.3639221, -2.79888, 2.388001, 0, 0.2980392, 1, 1,
0.3649641, 1.312415, 0.4104194, 0, 0.2901961, 1, 1,
0.3682691, -1.375168, 2.016041, 0, 0.2862745, 1, 1,
0.3716034, 0.4156032, -0.1566512, 0, 0.2784314, 1, 1,
0.3771713, 0.4462118, 0.8921541, 0, 0.2745098, 1, 1,
0.3772792, -0.6133823, 1.851682, 0, 0.2666667, 1, 1,
0.3821903, -0.3678741, 2.066535, 0, 0.2627451, 1, 1,
0.3824013, -1.074744, 3.89411, 0, 0.254902, 1, 1,
0.3863261, -0.8685802, 2.684876, 0, 0.2509804, 1, 1,
0.3870297, -0.9274834, 1.188354, 0, 0.2431373, 1, 1,
0.3876209, -1.84328, 2.802863, 0, 0.2392157, 1, 1,
0.3876482, -0.5842575, 2.72631, 0, 0.2313726, 1, 1,
0.3880018, -0.1104059, 3.651968, 0, 0.227451, 1, 1,
0.3900532, -1.777638, 2.002998, 0, 0.2196078, 1, 1,
0.3929729, -0.7954634, 1.834984, 0, 0.2156863, 1, 1,
0.3945721, -0.669512, 2.417892, 0, 0.2078431, 1, 1,
0.3968047, -1.455256, 2.412025, 0, 0.2039216, 1, 1,
0.3974885, -0.9908744, 1.682988, 0, 0.1960784, 1, 1,
0.400346, 0.8830981, -0.4333181, 0, 0.1882353, 1, 1,
0.4013618, -1.946832, 2.007401, 0, 0.1843137, 1, 1,
0.4026986, -0.5196258, 3.622095, 0, 0.1764706, 1, 1,
0.404304, -0.470279, 2.451159, 0, 0.172549, 1, 1,
0.4082606, 0.4603581, 1.015844, 0, 0.1647059, 1, 1,
0.4099736, 0.6780359, 1.979331, 0, 0.1607843, 1, 1,
0.4148419, 0.2049039, 2.029967, 0, 0.1529412, 1, 1,
0.420638, 0.4984787, 1.112387, 0, 0.1490196, 1, 1,
0.4245807, 0.886507, 0.1985762, 0, 0.1411765, 1, 1,
0.4247525, 0.171333, 2.407531, 0, 0.1372549, 1, 1,
0.4263819, 0.9808553, -0.7325423, 0, 0.1294118, 1, 1,
0.4273123, 1.810448, 1.320975, 0, 0.1254902, 1, 1,
0.4292317, -0.5679622, 3.300771, 0, 0.1176471, 1, 1,
0.4337575, -0.3142033, 2.038237, 0, 0.1137255, 1, 1,
0.4383995, -0.3759071, 2.904353, 0, 0.1058824, 1, 1,
0.439149, 0.2556945, 0.5555639, 0, 0.09803922, 1, 1,
0.4392746, -0.1385459, 1.680845, 0, 0.09411765, 1, 1,
0.4405015, 1.190369, 0.8207765, 0, 0.08627451, 1, 1,
0.441606, -1.213746, 3.395, 0, 0.08235294, 1, 1,
0.4428529, -0.3624127, 2.573822, 0, 0.07450981, 1, 1,
0.4454776, 1.11465, 0.4335362, 0, 0.07058824, 1, 1,
0.4467724, -0.4622989, 1.229135, 0, 0.0627451, 1, 1,
0.4474761, -2.2083, 2.916006, 0, 0.05882353, 1, 1,
0.4492625, 2.407189, -0.427207, 0, 0.05098039, 1, 1,
0.4505606, -0.6400888, 2.741775, 0, 0.04705882, 1, 1,
0.4512698, 0.2655732, 1.796176, 0, 0.03921569, 1, 1,
0.4531623, -1.583938, 4.84603, 0, 0.03529412, 1, 1,
0.4537202, 1.05407, 0.03869522, 0, 0.02745098, 1, 1,
0.4552755, 0.4504958, -0.7822608, 0, 0.02352941, 1, 1,
0.4576696, 0.3689635, 1.018828, 0, 0.01568628, 1, 1,
0.4581991, 0.1659662, 0.5697817, 0, 0.01176471, 1, 1,
0.4628753, 0.3911597, 1.336788, 0, 0.003921569, 1, 1,
0.4653855, -0.8347713, 1.190565, 0.003921569, 0, 1, 1,
0.4697132, 0.8028096, -0.923745, 0.007843138, 0, 1, 1,
0.4717622, 1.624001, 0.4405023, 0.01568628, 0, 1, 1,
0.4808123, 0.07927284, 0.1091597, 0.01960784, 0, 1, 1,
0.4816639, 2.714051, 1.432467, 0.02745098, 0, 1, 1,
0.4820115, 0.4272191, 0.8501391, 0.03137255, 0, 1, 1,
0.4834863, -0.6262308, 1.788378, 0.03921569, 0, 1, 1,
0.4841288, 1.78737, -1.262847, 0.04313726, 0, 1, 1,
0.4883435, -0.9763315, 3.1215, 0.05098039, 0, 1, 1,
0.489166, -0.8130128, 1.349939, 0.05490196, 0, 1, 1,
0.4894085, -0.6872233, 3.405924, 0.0627451, 0, 1, 1,
0.4902315, -1.85041, 1.887552, 0.06666667, 0, 1, 1,
0.4949585, -0.3798367, 2.324529, 0.07450981, 0, 1, 1,
0.4955647, 0.696895, -0.2404196, 0.07843138, 0, 1, 1,
0.4962169, -0.4210607, 1.093685, 0.08627451, 0, 1, 1,
0.4976362, 2.137432, -0.3668737, 0.09019608, 0, 1, 1,
0.5062864, 0.9781234, 1.421065, 0.09803922, 0, 1, 1,
0.5063832, 1.205469, 0.2895907, 0.1058824, 0, 1, 1,
0.5074255, -0.567269, 1.312025, 0.1098039, 0, 1, 1,
0.5083575, 0.3553135, 1.17356, 0.1176471, 0, 1, 1,
0.5102473, 0.1978568, -0.9894542, 0.1215686, 0, 1, 1,
0.5109696, 0.3896487, -0.5192655, 0.1294118, 0, 1, 1,
0.5167304, 0.3634763, 1.146687, 0.1333333, 0, 1, 1,
0.5196329, -1.534817, 4.47106, 0.1411765, 0, 1, 1,
0.5223036, 0.7900202, -0.2363561, 0.145098, 0, 1, 1,
0.5267668, 0.1824947, 2.45168, 0.1529412, 0, 1, 1,
0.5268623, -1.088571, 4.557585, 0.1568628, 0, 1, 1,
0.532745, 0.2558238, -0.01108437, 0.1647059, 0, 1, 1,
0.5328532, 2.615377, -1.791735, 0.1686275, 0, 1, 1,
0.5363989, 0.552715, 0.3294806, 0.1764706, 0, 1, 1,
0.5383814, -0.9301245, 3.702161, 0.1803922, 0, 1, 1,
0.5403556, 0.1635606, 0.339035, 0.1882353, 0, 1, 1,
0.5412523, 1.760077, -1.100253, 0.1921569, 0, 1, 1,
0.5413693, 0.5810102, 1.024562, 0.2, 0, 1, 1,
0.5447822, 0.4188811, 2.189773, 0.2078431, 0, 1, 1,
0.5449879, 1.380053, -0.7394381, 0.2117647, 0, 1, 1,
0.5470398, 0.7065681, 1.238559, 0.2196078, 0, 1, 1,
0.5505385, -0.3773809, 2.690057, 0.2235294, 0, 1, 1,
0.5518426, 0.3532059, 0.8447624, 0.2313726, 0, 1, 1,
0.5577009, -1.244784, 2.783144, 0.2352941, 0, 1, 1,
0.5578589, 0.332046, 0.9876227, 0.2431373, 0, 1, 1,
0.5607563, -0.1647862, 1.920253, 0.2470588, 0, 1, 1,
0.5627117, -0.8946523, 3.646662, 0.254902, 0, 1, 1,
0.5652531, 0.3805546, 1.883596, 0.2588235, 0, 1, 1,
0.5721926, -0.471062, 2.426073, 0.2666667, 0, 1, 1,
0.5776152, 1.988099, 1.129556, 0.2705882, 0, 1, 1,
0.5797037, -0.357115, 0.5787893, 0.2784314, 0, 1, 1,
0.5867433, -0.08436846, 1.850688, 0.282353, 0, 1, 1,
0.5868762, 0.2753092, 2.17886, 0.2901961, 0, 1, 1,
0.5958422, 1.458085, -1.371503, 0.2941177, 0, 1, 1,
0.5968161, -0.152757, 1.415083, 0.3019608, 0, 1, 1,
0.5999274, -1.248946, 3.870943, 0.3098039, 0, 1, 1,
0.6026013, -0.8600532, 4.824102, 0.3137255, 0, 1, 1,
0.6029383, -1.289756, 2.868643, 0.3215686, 0, 1, 1,
0.6055357, 1.472868, 0.3462106, 0.3254902, 0, 1, 1,
0.6067785, -0.05054694, -0.2227009, 0.3333333, 0, 1, 1,
0.6078413, 1.405599, 0.8043681, 0.3372549, 0, 1, 1,
0.6172428, -0.7214239, 1.372437, 0.345098, 0, 1, 1,
0.6211868, 0.7693542, -1.582311, 0.3490196, 0, 1, 1,
0.6318536, 0.8734584, 0.3071619, 0.3568628, 0, 1, 1,
0.6346589, -0.6069781, 3.12229, 0.3607843, 0, 1, 1,
0.6356617, -1.506844, 3.051749, 0.3686275, 0, 1, 1,
0.6363779, -0.9707035, 1.722812, 0.372549, 0, 1, 1,
0.638712, -0.9801853, 3.018871, 0.3803922, 0, 1, 1,
0.6401022, 0.2642886, 0.1740399, 0.3843137, 0, 1, 1,
0.6415272, -0.3800431, 1.835971, 0.3921569, 0, 1, 1,
0.6419276, 0.5815905, 1.69606, 0.3960784, 0, 1, 1,
0.643617, 1.949399, -0.3817787, 0.4039216, 0, 1, 1,
0.6445403, -0.5839601, 2.684521, 0.4117647, 0, 1, 1,
0.6461263, -0.6157712, 3.800985, 0.4156863, 0, 1, 1,
0.6469678, 2.396433, 1.743532, 0.4235294, 0, 1, 1,
0.6503597, 0.02124921, 1.870182, 0.427451, 0, 1, 1,
0.6520802, 0.4462285, 1.90451, 0.4352941, 0, 1, 1,
0.6570648, -0.1506364, 0.9556925, 0.4392157, 0, 1, 1,
0.6639164, 0.954111, 2.338758, 0.4470588, 0, 1, 1,
0.6675583, -0.6434167, 2.087477, 0.4509804, 0, 1, 1,
0.6707501, 1.704278, -0.1783385, 0.4588235, 0, 1, 1,
0.6739177, -1.221929, 1.903558, 0.4627451, 0, 1, 1,
0.6754804, 0.8995742, 0.8322169, 0.4705882, 0, 1, 1,
0.6804237, 1.213042, 0.7230566, 0.4745098, 0, 1, 1,
0.6806011, 0.3059723, 1.341895, 0.4823529, 0, 1, 1,
0.6919155, -0.3328316, 1.447128, 0.4862745, 0, 1, 1,
0.6929559, -0.03181272, 2.632824, 0.4941176, 0, 1, 1,
0.6945839, -0.08376889, 1.529672, 0.5019608, 0, 1, 1,
0.6979972, -0.8801101, 4.494585, 0.5058824, 0, 1, 1,
0.6980308, -1.896452, 3.53475, 0.5137255, 0, 1, 1,
0.6985546, 0.1090282, 1.777586, 0.5176471, 0, 1, 1,
0.6998997, -0.1030968, 4.039282, 0.5254902, 0, 1, 1,
0.7001412, -0.03347144, 1.896025, 0.5294118, 0, 1, 1,
0.702606, 0.03673883, 1.172698, 0.5372549, 0, 1, 1,
0.7121776, -0.5743612, 2.032737, 0.5411765, 0, 1, 1,
0.7124478, -0.3922804, 3.81044, 0.5490196, 0, 1, 1,
0.7144745, -0.141604, 2.319458, 0.5529412, 0, 1, 1,
0.7196012, 0.2807428, 1.396358, 0.5607843, 0, 1, 1,
0.7209767, 1.305001, 1.309684, 0.5647059, 0, 1, 1,
0.7261732, 1.030977, 1.066124, 0.572549, 0, 1, 1,
0.7372527, 2.217443, -0.9370212, 0.5764706, 0, 1, 1,
0.7443967, -0.6028289, 2.326837, 0.5843138, 0, 1, 1,
0.7461891, 0.5329697, 0.2025563, 0.5882353, 0, 1, 1,
0.7550033, 1.465215, 1.143935, 0.5960785, 0, 1, 1,
0.7567649, 1.117336, 1.043252, 0.6039216, 0, 1, 1,
0.7619175, -1.151901, 2.099563, 0.6078432, 0, 1, 1,
0.7648601, 1.658521, 1.056562, 0.6156863, 0, 1, 1,
0.7705368, 0.2692923, -0.6193088, 0.6196079, 0, 1, 1,
0.7727464, 0.5968375, 1.667556, 0.627451, 0, 1, 1,
0.7732162, 0.4762015, 0.1311626, 0.6313726, 0, 1, 1,
0.7732236, -1.587382, 3.06375, 0.6392157, 0, 1, 1,
0.7733458, 0.00843237, 4.258681, 0.6431373, 0, 1, 1,
0.7749059, 1.135974, 0.5376955, 0.6509804, 0, 1, 1,
0.7792474, 0.6458275, 0.526684, 0.654902, 0, 1, 1,
0.7808809, -0.2857513, 1.674806, 0.6627451, 0, 1, 1,
0.7935886, 0.8476756, 1.53715, 0.6666667, 0, 1, 1,
0.7960238, -1.150385, 3.286918, 0.6745098, 0, 1, 1,
0.796828, 0.8340768, -0.8841712, 0.6784314, 0, 1, 1,
0.8127517, -2.093284, 3.256017, 0.6862745, 0, 1, 1,
0.8132754, -0.5008353, 4.178954, 0.6901961, 0, 1, 1,
0.8133324, 0.4271969, 0.8211727, 0.6980392, 0, 1, 1,
0.8165278, -0.5403067, 0.9453717, 0.7058824, 0, 1, 1,
0.8167234, -0.4083983, 2.496058, 0.7098039, 0, 1, 1,
0.8171329, -1.039171, 1.450452, 0.7176471, 0, 1, 1,
0.8181868, 1.53487, 2.267028, 0.7215686, 0, 1, 1,
0.819818, -0.4520927, 1.006591, 0.7294118, 0, 1, 1,
0.8204011, 1.39109, -0.2416081, 0.7333333, 0, 1, 1,
0.829032, -0.2754204, 1.00418, 0.7411765, 0, 1, 1,
0.8300458, 0.2426296, 1.213718, 0.7450981, 0, 1, 1,
0.831733, -0.5726447, 2.755124, 0.7529412, 0, 1, 1,
0.835968, 1.969021, 0.794935, 0.7568628, 0, 1, 1,
0.8410959, -1.6532, 3.786638, 0.7647059, 0, 1, 1,
0.8446767, -0.5442295, 2.772043, 0.7686275, 0, 1, 1,
0.8476731, -0.7717965, 1.26262, 0.7764706, 0, 1, 1,
0.8480876, 0.1067626, 0.7170351, 0.7803922, 0, 1, 1,
0.8497283, 1.005813, 1.123036, 0.7882353, 0, 1, 1,
0.8504736, 0.7590572, 0.9286941, 0.7921569, 0, 1, 1,
0.8524057, 0.9563011, 0.198638, 0.8, 0, 1, 1,
0.8576305, -0.4165669, 2.571908, 0.8078431, 0, 1, 1,
0.8667126, -1.225321, 2.001457, 0.8117647, 0, 1, 1,
0.8748465, -0.6572878, 2.791666, 0.8196079, 0, 1, 1,
0.8769661, 0.4474136, 0.5140681, 0.8235294, 0, 1, 1,
0.8773124, -1.556551, 2.168238, 0.8313726, 0, 1, 1,
0.8774143, 0.1756093, -0.09006643, 0.8352941, 0, 1, 1,
0.8796372, -0.1389662, 0.9343817, 0.8431373, 0, 1, 1,
0.8825768, 0.9936106, 1.160443, 0.8470588, 0, 1, 1,
0.8832316, -0.2171829, 0.6275904, 0.854902, 0, 1, 1,
0.8875642, 1.565509, 0.9882475, 0.8588235, 0, 1, 1,
0.8897394, -0.9949702, 3.723408, 0.8666667, 0, 1, 1,
0.8924766, -1.804671, 2.915251, 0.8705882, 0, 1, 1,
0.8933701, -0.2771702, 1.128767, 0.8784314, 0, 1, 1,
0.9005052, 1.357074, 1.990537, 0.8823529, 0, 1, 1,
0.9063358, 0.03379187, 4.334509, 0.8901961, 0, 1, 1,
0.9116433, -0.5812881, 1.72121, 0.8941177, 0, 1, 1,
0.911863, -0.7425278, 0.6443675, 0.9019608, 0, 1, 1,
0.9139222, 0.8462996, 2.444875, 0.9098039, 0, 1, 1,
0.9206582, -0.0241697, 3.263212, 0.9137255, 0, 1, 1,
0.9331691, 1.585104, -0.9508482, 0.9215686, 0, 1, 1,
0.9394102, -0.6447412, 3.230517, 0.9254902, 0, 1, 1,
0.9416152, -0.7857168, 3.866772, 0.9333333, 0, 1, 1,
0.9515312, 0.3838502, -0.06875855, 0.9372549, 0, 1, 1,
0.9543999, 0.2255901, 0.742681, 0.945098, 0, 1, 1,
0.9612234, -0.9896887, 2.794875, 0.9490196, 0, 1, 1,
0.9619026, -0.3046878, 3.129656, 0.9568627, 0, 1, 1,
0.9682719, -0.3576131, 0.8858654, 0.9607843, 0, 1, 1,
0.9725702, 0.9151714, 1.302457, 0.9686275, 0, 1, 1,
0.9754212, -0.9819974, 2.582192, 0.972549, 0, 1, 1,
0.9789514, -0.9324479, 2.66042, 0.9803922, 0, 1, 1,
0.9807637, 0.9063068, 0.08415206, 0.9843137, 0, 1, 1,
0.9821658, -0.3089598, 1.686984, 0.9921569, 0, 1, 1,
0.9927588, -0.1696524, 2.401159, 0.9960784, 0, 1, 1,
0.9968812, -0.06019029, 1.544192, 1, 0, 0.9960784, 1,
1.013603, 1.207481, 0.5509546, 1, 0, 0.9882353, 1,
1.015003, -1.157927, 2.652413, 1, 0, 0.9843137, 1,
1.017203, 1.170715, 0.8949729, 1, 0, 0.9764706, 1,
1.025327, -0.9010982, 2.915869, 1, 0, 0.972549, 1,
1.026638, -0.4978378, 2.674072, 1, 0, 0.9647059, 1,
1.0275, 0.09926421, 0.807639, 1, 0, 0.9607843, 1,
1.031996, 0.2028798, 0.5954984, 1, 0, 0.9529412, 1,
1.042382, -0.1225243, 2.743427, 1, 0, 0.9490196, 1,
1.042562, -1.523154, 2.475191, 1, 0, 0.9411765, 1,
1.047602, -0.5878007, 2.220812, 1, 0, 0.9372549, 1,
1.050761, -0.1074774, 1.974897, 1, 0, 0.9294118, 1,
1.053682, 0.4304227, 1.678915, 1, 0, 0.9254902, 1,
1.06416, 1.213927, 0.4194792, 1, 0, 0.9176471, 1,
1.064436, 0.003487608, 1.082454, 1, 0, 0.9137255, 1,
1.067888, -0.8918583, 2.714869, 1, 0, 0.9058824, 1,
1.067897, -0.03775106, 2.333204, 1, 0, 0.9019608, 1,
1.069762, -0.7212234, 2.644993, 1, 0, 0.8941177, 1,
1.073918, -1.555092, 4.116314, 1, 0, 0.8862745, 1,
1.08955, -0.948738, 3.056816, 1, 0, 0.8823529, 1,
1.095196, -0.8007363, 1.028808, 1, 0, 0.8745098, 1,
1.102129, -1.146066, 3.025839, 1, 0, 0.8705882, 1,
1.108133, -0.34294, 2.512668, 1, 0, 0.8627451, 1,
1.114742, -0.4551634, 2.883497, 1, 0, 0.8588235, 1,
1.11478, -1.928446, 3.927383, 1, 0, 0.8509804, 1,
1.116631, 0.2020617, 1.613491, 1, 0, 0.8470588, 1,
1.118062, -0.8995107, 2.098268, 1, 0, 0.8392157, 1,
1.121191, 0.9324054, -0.09866422, 1, 0, 0.8352941, 1,
1.126424, -0.4865517, 1.516917, 1, 0, 0.827451, 1,
1.127278, -2.09976, 3.88876, 1, 0, 0.8235294, 1,
1.132005, -0.4962074, 3.649175, 1, 0, 0.8156863, 1,
1.135512, -0.2471154, 1.129628, 1, 0, 0.8117647, 1,
1.137098, -0.1671944, 1.93053, 1, 0, 0.8039216, 1,
1.14611, 1.115499, 1.033474, 1, 0, 0.7960784, 1,
1.161732, 0.9740266, 0.1797336, 1, 0, 0.7921569, 1,
1.164505, -0.244042, 2.435582, 1, 0, 0.7843137, 1,
1.166309, 0.5114319, 1.403764, 1, 0, 0.7803922, 1,
1.171225, 0.1322955, 1.885341, 1, 0, 0.772549, 1,
1.172141, 0.7339955, 1.950459, 1, 0, 0.7686275, 1,
1.17719, 0.8158264, 0.01718053, 1, 0, 0.7607843, 1,
1.183095, -0.3353375, 0.8685616, 1, 0, 0.7568628, 1,
1.183744, -1.366031, 3.153484, 1, 0, 0.7490196, 1,
1.185132, -0.1744586, 1.533289, 1, 0, 0.7450981, 1,
1.188969, 0.6449039, 0.5367082, 1, 0, 0.7372549, 1,
1.193726, -0.2470236, 1.435491, 1, 0, 0.7333333, 1,
1.198836, 0.1514471, 0.9422176, 1, 0, 0.7254902, 1,
1.199832, -0.3767969, 3.248986, 1, 0, 0.7215686, 1,
1.200969, -0.2184369, 0.4195423, 1, 0, 0.7137255, 1,
1.210394, 1.598156, -0.1427985, 1, 0, 0.7098039, 1,
1.21771, 0.1012178, 1.334173, 1, 0, 0.7019608, 1,
1.21951, 0.8171116, 2.461424, 1, 0, 0.6941177, 1,
1.235228, 0.9210877, 0.9237798, 1, 0, 0.6901961, 1,
1.240305, 1.341401, 1.175921, 1, 0, 0.682353, 1,
1.242547, 0.4647201, 0.4537675, 1, 0, 0.6784314, 1,
1.259057, -1.187449, 2.793751, 1, 0, 0.6705883, 1,
1.267088, 1.899429, 0.3889613, 1, 0, 0.6666667, 1,
1.270654, -0.4245019, 1.730523, 1, 0, 0.6588235, 1,
1.28295, 0.9807837, 1.317448, 1, 0, 0.654902, 1,
1.288254, -1.021781, 3.042468, 1, 0, 0.6470588, 1,
1.291538, 1.342753, -0.5206127, 1, 0, 0.6431373, 1,
1.300783, -1.186496, 3.448095, 1, 0, 0.6352941, 1,
1.302512, -0.4795977, 0.5829598, 1, 0, 0.6313726, 1,
1.311047, 1.19427, 2.006771, 1, 0, 0.6235294, 1,
1.312824, -0.4691258, 2.070068, 1, 0, 0.6196079, 1,
1.315592, 0.5478855, 1.572213, 1, 0, 0.6117647, 1,
1.318277, 0.8516425, -0.02796399, 1, 0, 0.6078432, 1,
1.322051, 0.6254296, 1.210052, 1, 0, 0.6, 1,
1.32768, 0.4914929, 2.328576, 1, 0, 0.5921569, 1,
1.332086, 1.88235, 0.6210954, 1, 0, 0.5882353, 1,
1.341555, -0.9157457, 0.5050722, 1, 0, 0.5803922, 1,
1.34631, -0.6701742, 2.393909, 1, 0, 0.5764706, 1,
1.350262, 0.6266926, 0.764088, 1, 0, 0.5686275, 1,
1.364149, 2.021491, -0.2188012, 1, 0, 0.5647059, 1,
1.372349, 0.8946941, 0.3658489, 1, 0, 0.5568628, 1,
1.373719, -1.595733, 0.9621613, 1, 0, 0.5529412, 1,
1.374854, -0.9818306, 0.8287942, 1, 0, 0.5450981, 1,
1.390822, -2.462616, 1.043336, 1, 0, 0.5411765, 1,
1.394094, -0.7158716, 2.810408, 1, 0, 0.5333334, 1,
1.399315, -0.3650545, 1.347641, 1, 0, 0.5294118, 1,
1.409553, 0.6308132, 0.1598275, 1, 0, 0.5215687, 1,
1.411911, 0.6855251, 1.662301, 1, 0, 0.5176471, 1,
1.414513, 1.126515, 1.166282, 1, 0, 0.509804, 1,
1.417636, 0.2466214, 1.963129, 1, 0, 0.5058824, 1,
1.418101, -0.7352114, 2.531305, 1, 0, 0.4980392, 1,
1.427765, 0.138319, 3.184804, 1, 0, 0.4901961, 1,
1.438695, 0.8889104, -0.1535132, 1, 0, 0.4862745, 1,
1.444041, -0.2871318, 1.276703, 1, 0, 0.4784314, 1,
1.467929, 0.2628863, 2.437768, 1, 0, 0.4745098, 1,
1.470092, 1.585056, 0.9432669, 1, 0, 0.4666667, 1,
1.471957, 0.136514, 0.9065005, 1, 0, 0.4627451, 1,
1.479931, -0.3325669, 2.222706, 1, 0, 0.454902, 1,
1.481214, 0.5283945, 1.272172, 1, 0, 0.4509804, 1,
1.485029, -0.6181248, 2.75448, 1, 0, 0.4431373, 1,
1.48531, 0.8423417, 1.805231, 1, 0, 0.4392157, 1,
1.487754, -1.158673, 1.377666, 1, 0, 0.4313726, 1,
1.494013, -2.81785, 4.258072, 1, 0, 0.427451, 1,
1.498836, 2.103101, 0.2219518, 1, 0, 0.4196078, 1,
1.504062, -0.3012652, 2.16169, 1, 0, 0.4156863, 1,
1.50954, -1.387796, 3.278929, 1, 0, 0.4078431, 1,
1.513136, -0.777207, 1.313303, 1, 0, 0.4039216, 1,
1.517086, -2.732166, 2.413005, 1, 0, 0.3960784, 1,
1.521858, 1.863206, 1.914627, 1, 0, 0.3882353, 1,
1.530844, -0.1397182, 1.695982, 1, 0, 0.3843137, 1,
1.532243, -1.120559, 0.9975862, 1, 0, 0.3764706, 1,
1.532321, -2.741208, 2.469576, 1, 0, 0.372549, 1,
1.533651, 1.10263, 0.5429528, 1, 0, 0.3647059, 1,
1.536417, -1.126117, 3.067892, 1, 0, 0.3607843, 1,
1.543515, -1.103865, 1.209836, 1, 0, 0.3529412, 1,
1.544264, -0.4490757, 2.332489, 1, 0, 0.3490196, 1,
1.567271, 0.293729, 1.333918, 1, 0, 0.3411765, 1,
1.568231, -0.3160376, 2.85836, 1, 0, 0.3372549, 1,
1.572122, -0.1106197, 0.7573286, 1, 0, 0.3294118, 1,
1.579043, 2.54023, 1.670306, 1, 0, 0.3254902, 1,
1.591259, -0.3766056, 1.774373, 1, 0, 0.3176471, 1,
1.596988, -0.194165, 0.2305126, 1, 0, 0.3137255, 1,
1.598508, 0.3203469, 2.153805, 1, 0, 0.3058824, 1,
1.600881, 0.4497937, 0.7071338, 1, 0, 0.2980392, 1,
1.626529, -0.5271649, 3.388038, 1, 0, 0.2941177, 1,
1.647361, 0.2691536, 2.304437, 1, 0, 0.2862745, 1,
1.670156, -0.6664464, 1.999792, 1, 0, 0.282353, 1,
1.674978, -0.12445, 1.160675, 1, 0, 0.2745098, 1,
1.684362, 1.179813, 0.6732805, 1, 0, 0.2705882, 1,
1.685956, -0.7530431, 1.703181, 1, 0, 0.2627451, 1,
1.688439, -0.6070706, 0.9644703, 1, 0, 0.2588235, 1,
1.691797, -1.688623, 1.449368, 1, 0, 0.2509804, 1,
1.70411, -1.059146, 1.976794, 1, 0, 0.2470588, 1,
1.704394, 0.9697772, 1.907294, 1, 0, 0.2392157, 1,
1.704983, -0.6009933, 2.025653, 1, 0, 0.2352941, 1,
1.712756, 1.305449, 0.9463331, 1, 0, 0.227451, 1,
1.732017, 1.345034, 1.32953, 1, 0, 0.2235294, 1,
1.743466, -0.2940229, 2.837985, 1, 0, 0.2156863, 1,
1.756039, -0.5582455, 3.027609, 1, 0, 0.2117647, 1,
1.785976, 0.7010892, 0.3247713, 1, 0, 0.2039216, 1,
1.788818, -0.3598183, 1.875344, 1, 0, 0.1960784, 1,
1.819784, -1.498012, 1.615485, 1, 0, 0.1921569, 1,
1.827634, -0.6884426, 1.998065, 1, 0, 0.1843137, 1,
1.873634, -0.8588974, 1.307626, 1, 0, 0.1803922, 1,
1.882572, 0.01478301, 1.705101, 1, 0, 0.172549, 1,
1.889426, -0.2420275, 1.679058, 1, 0, 0.1686275, 1,
1.896071, 0.5086387, 1.178692, 1, 0, 0.1607843, 1,
1.903167, 0.3658007, 2.404215, 1, 0, 0.1568628, 1,
1.903285, 0.7693131, 0.1561233, 1, 0, 0.1490196, 1,
1.920084, -1.873551, 1.660418, 1, 0, 0.145098, 1,
1.920969, 0.743793, 1.544871, 1, 0, 0.1372549, 1,
1.926049, 1.316508, 1.368982, 1, 0, 0.1333333, 1,
1.950077, 0.886192, 0.3949797, 1, 0, 0.1254902, 1,
2.005233, -0.08479199, 0.5235475, 1, 0, 0.1215686, 1,
2.074196, -0.9387311, 2.952626, 1, 0, 0.1137255, 1,
2.07607, -1.414826, 2.656494, 1, 0, 0.1098039, 1,
2.089469, -0.3993479, 1.809461, 1, 0, 0.1019608, 1,
2.092498, -0.4933824, 3.5878, 1, 0, 0.09411765, 1,
2.100338, -0.04324428, 0.00849506, 1, 0, 0.09019608, 1,
2.107985, -0.05494856, 1.252704, 1, 0, 0.08235294, 1,
2.169135, -1.244772, 2.218944, 1, 0, 0.07843138, 1,
2.221867, -1.315047, 3.597454, 1, 0, 0.07058824, 1,
2.262776, -1.050591, 2.053837, 1, 0, 0.06666667, 1,
2.265834, -0.1956079, 2.611101, 1, 0, 0.05882353, 1,
2.35257, -1.49577, 3.424044, 1, 0, 0.05490196, 1,
2.389507, -0.9916152, 1.842668, 1, 0, 0.04705882, 1,
2.405747, 1.472005, 0.02487411, 1, 0, 0.04313726, 1,
2.504243, -0.03571843, 3.089545, 1, 0, 0.03529412, 1,
2.624477, 1.151395, -0.0316472, 1, 0, 0.03137255, 1,
2.682029, 1.821569, 0.07560018, 1, 0, 0.02352941, 1,
3.153402, -1.186473, 3.278973, 1, 0, 0.01960784, 1,
3.299104, -1.19316, 3.350087, 1, 0, 0.01176471, 1,
3.452195, -0.4570282, 3.203924, 1, 0, 0.007843138, 1
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
0.1926727, -4.3129, -7.234476, 0, -0.5, 0.5, 0.5,
0.1926727, -4.3129, -7.234476, 1, -0.5, 0.5, 0.5,
0.1926727, -4.3129, -7.234476, 1, 1.5, 0.5, 0.5,
0.1926727, -4.3129, -7.234476, 0, 1.5, 0.5, 0.5
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
-4.171828, 0.0454489, -7.234476, 0, -0.5, 0.5, 0.5,
-4.171828, 0.0454489, -7.234476, 1, -0.5, 0.5, 0.5,
-4.171828, 0.0454489, -7.234476, 1, 1.5, 0.5, 0.5,
-4.171828, 0.0454489, -7.234476, 0, 1.5, 0.5, 0.5
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
-4.171828, -4.3129, -0.2310925, 0, -0.5, 0.5, 0.5,
-4.171828, -4.3129, -0.2310925, 1, -0.5, 0.5, 0.5,
-4.171828, -4.3129, -0.2310925, 1, 1.5, 0.5, 0.5,
-4.171828, -4.3129, -0.2310925, 0, 1.5, 0.5, 0.5
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
-3, -3.307127, -5.618311,
3, -3.307127, -5.618311,
-3, -3.307127, -5.618311,
-3, -3.474756, -5.887671,
-2, -3.307127, -5.618311,
-2, -3.474756, -5.887671,
-1, -3.307127, -5.618311,
-1, -3.474756, -5.887671,
0, -3.307127, -5.618311,
0, -3.474756, -5.887671,
1, -3.307127, -5.618311,
1, -3.474756, -5.887671,
2, -3.307127, -5.618311,
2, -3.474756, -5.887671,
3, -3.307127, -5.618311,
3, -3.474756, -5.887671
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
-3, -3.810014, -6.426394, 0, -0.5, 0.5, 0.5,
-3, -3.810014, -6.426394, 1, -0.5, 0.5, 0.5,
-3, -3.810014, -6.426394, 1, 1.5, 0.5, 0.5,
-3, -3.810014, -6.426394, 0, 1.5, 0.5, 0.5,
-2, -3.810014, -6.426394, 0, -0.5, 0.5, 0.5,
-2, -3.810014, -6.426394, 1, -0.5, 0.5, 0.5,
-2, -3.810014, -6.426394, 1, 1.5, 0.5, 0.5,
-2, -3.810014, -6.426394, 0, 1.5, 0.5, 0.5,
-1, -3.810014, -6.426394, 0, -0.5, 0.5, 0.5,
-1, -3.810014, -6.426394, 1, -0.5, 0.5, 0.5,
-1, -3.810014, -6.426394, 1, 1.5, 0.5, 0.5,
-1, -3.810014, -6.426394, 0, 1.5, 0.5, 0.5,
0, -3.810014, -6.426394, 0, -0.5, 0.5, 0.5,
0, -3.810014, -6.426394, 1, -0.5, 0.5, 0.5,
0, -3.810014, -6.426394, 1, 1.5, 0.5, 0.5,
0, -3.810014, -6.426394, 0, 1.5, 0.5, 0.5,
1, -3.810014, -6.426394, 0, -0.5, 0.5, 0.5,
1, -3.810014, -6.426394, 1, -0.5, 0.5, 0.5,
1, -3.810014, -6.426394, 1, 1.5, 0.5, 0.5,
1, -3.810014, -6.426394, 0, 1.5, 0.5, 0.5,
2, -3.810014, -6.426394, 0, -0.5, 0.5, 0.5,
2, -3.810014, -6.426394, 1, -0.5, 0.5, 0.5,
2, -3.810014, -6.426394, 1, 1.5, 0.5, 0.5,
2, -3.810014, -6.426394, 0, 1.5, 0.5, 0.5,
3, -3.810014, -6.426394, 0, -0.5, 0.5, 0.5,
3, -3.810014, -6.426394, 1, -0.5, 0.5, 0.5,
3, -3.810014, -6.426394, 1, 1.5, 0.5, 0.5,
3, -3.810014, -6.426394, 0, 1.5, 0.5, 0.5
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
-3.164635, -3, -5.618311,
-3.164635, 3, -5.618311,
-3.164635, -3, -5.618311,
-3.332501, -3, -5.887671,
-3.164635, -2, -5.618311,
-3.332501, -2, -5.887671,
-3.164635, -1, -5.618311,
-3.332501, -1, -5.887671,
-3.164635, 0, -5.618311,
-3.332501, 0, -5.887671,
-3.164635, 1, -5.618311,
-3.332501, 1, -5.887671,
-3.164635, 2, -5.618311,
-3.332501, 2, -5.887671,
-3.164635, 3, -5.618311,
-3.332501, 3, -5.887671
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
-3.668231, -3, -6.426394, 0, -0.5, 0.5, 0.5,
-3.668231, -3, -6.426394, 1, -0.5, 0.5, 0.5,
-3.668231, -3, -6.426394, 1, 1.5, 0.5, 0.5,
-3.668231, -3, -6.426394, 0, 1.5, 0.5, 0.5,
-3.668231, -2, -6.426394, 0, -0.5, 0.5, 0.5,
-3.668231, -2, -6.426394, 1, -0.5, 0.5, 0.5,
-3.668231, -2, -6.426394, 1, 1.5, 0.5, 0.5,
-3.668231, -2, -6.426394, 0, 1.5, 0.5, 0.5,
-3.668231, -1, -6.426394, 0, -0.5, 0.5, 0.5,
-3.668231, -1, -6.426394, 1, -0.5, 0.5, 0.5,
-3.668231, -1, -6.426394, 1, 1.5, 0.5, 0.5,
-3.668231, -1, -6.426394, 0, 1.5, 0.5, 0.5,
-3.668231, 0, -6.426394, 0, -0.5, 0.5, 0.5,
-3.668231, 0, -6.426394, 1, -0.5, 0.5, 0.5,
-3.668231, 0, -6.426394, 1, 1.5, 0.5, 0.5,
-3.668231, 0, -6.426394, 0, 1.5, 0.5, 0.5,
-3.668231, 1, -6.426394, 0, -0.5, 0.5, 0.5,
-3.668231, 1, -6.426394, 1, -0.5, 0.5, 0.5,
-3.668231, 1, -6.426394, 1, 1.5, 0.5, 0.5,
-3.668231, 1, -6.426394, 0, 1.5, 0.5, 0.5,
-3.668231, 2, -6.426394, 0, -0.5, 0.5, 0.5,
-3.668231, 2, -6.426394, 1, -0.5, 0.5, 0.5,
-3.668231, 2, -6.426394, 1, 1.5, 0.5, 0.5,
-3.668231, 2, -6.426394, 0, 1.5, 0.5, 0.5,
-3.668231, 3, -6.426394, 0, -0.5, 0.5, 0.5,
-3.668231, 3, -6.426394, 1, -0.5, 0.5, 0.5,
-3.668231, 3, -6.426394, 1, 1.5, 0.5, 0.5,
-3.668231, 3, -6.426394, 0, 1.5, 0.5, 0.5
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
-3.164635, -3.307127, -4,
-3.164635, -3.307127, 4,
-3.164635, -3.307127, -4,
-3.332501, -3.474756, -4,
-3.164635, -3.307127, -2,
-3.332501, -3.474756, -2,
-3.164635, -3.307127, 0,
-3.332501, -3.474756, 0,
-3.164635, -3.307127, 2,
-3.332501, -3.474756, 2,
-3.164635, -3.307127, 4,
-3.332501, -3.474756, 4
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
-3.668231, -3.810014, -4, 0, -0.5, 0.5, 0.5,
-3.668231, -3.810014, -4, 1, -0.5, 0.5, 0.5,
-3.668231, -3.810014, -4, 1, 1.5, 0.5, 0.5,
-3.668231, -3.810014, -4, 0, 1.5, 0.5, 0.5,
-3.668231, -3.810014, -2, 0, -0.5, 0.5, 0.5,
-3.668231, -3.810014, -2, 1, -0.5, 0.5, 0.5,
-3.668231, -3.810014, -2, 1, 1.5, 0.5, 0.5,
-3.668231, -3.810014, -2, 0, 1.5, 0.5, 0.5,
-3.668231, -3.810014, 0, 0, -0.5, 0.5, 0.5,
-3.668231, -3.810014, 0, 1, -0.5, 0.5, 0.5,
-3.668231, -3.810014, 0, 1, 1.5, 0.5, 0.5,
-3.668231, -3.810014, 0, 0, 1.5, 0.5, 0.5,
-3.668231, -3.810014, 2, 0, -0.5, 0.5, 0.5,
-3.668231, -3.810014, 2, 1, -0.5, 0.5, 0.5,
-3.668231, -3.810014, 2, 1, 1.5, 0.5, 0.5,
-3.668231, -3.810014, 2, 0, 1.5, 0.5, 0.5,
-3.668231, -3.810014, 4, 0, -0.5, 0.5, 0.5,
-3.668231, -3.810014, 4, 1, -0.5, 0.5, 0.5,
-3.668231, -3.810014, 4, 1, 1.5, 0.5, 0.5,
-3.668231, -3.810014, 4, 0, 1.5, 0.5, 0.5
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
-3.164635, -3.307127, -5.618311,
-3.164635, 3.398025, -5.618311,
-3.164635, -3.307127, 5.156126,
-3.164635, 3.398025, 5.156126,
-3.164635, -3.307127, -5.618311,
-3.164635, -3.307127, 5.156126,
-3.164635, 3.398025, -5.618311,
-3.164635, 3.398025, 5.156126,
-3.164635, -3.307127, -5.618311,
3.549981, -3.307127, -5.618311,
-3.164635, -3.307127, 5.156126,
3.549981, -3.307127, 5.156126,
-3.164635, 3.398025, -5.618311,
3.549981, 3.398025, -5.618311,
-3.164635, 3.398025, 5.156126,
3.549981, 3.398025, 5.156126,
3.549981, -3.307127, -5.618311,
3.549981, 3.398025, -5.618311,
3.549981, -3.307127, 5.156126,
3.549981, 3.398025, 5.156126,
3.549981, -3.307127, -5.618311,
3.549981, -3.307127, 5.156126,
3.549981, 3.398025, -5.618311,
3.549981, 3.398025, 5.156126
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
var radius = 7.666548;
var distance = 34.10934;
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
mvMatrix.translate( -0.1926727, -0.0454489, 0.2310925 );
mvMatrix.scale( 1.234504, 1.236247, 0.7693416 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.10934);
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
acrinathrin<-read.table("acrinathrin.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-acrinathrin$V2
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
```

```r
y<-acrinathrin$V3
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
```

```r
z<-acrinathrin$V4
```

```
## Error in eval(expr, envir, enclos): object 'acrinathrin' not found
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
-3.06685, -0.6869075, -2.217831, 0, 0, 1, 1, 1,
-2.972086, -1.462651, -1.965007, 1, 0, 0, 1, 1,
-2.803211, 0.6776385, -1.390957, 1, 0, 0, 1, 1,
-2.765396, -0.5965441, 0.2506994, 1, 0, 0, 1, 1,
-2.612894, -2.697349, -2.113965, 1, 0, 0, 1, 1,
-2.548964, -1.104716, -2.1377, 1, 0, 0, 1, 1,
-2.464057, -0.3712361, -2.602316, 0, 0, 0, 1, 1,
-2.439422, 0.4219407, -2.127709, 0, 0, 0, 1, 1,
-2.433315, -0.2428629, -1.833432, 0, 0, 0, 1, 1,
-2.292547, -0.8344225, -1.150309, 0, 0, 0, 1, 1,
-2.291526, 0.3451052, -1.834648, 0, 0, 0, 1, 1,
-2.2405, -0.0812818, -2.029566, 0, 0, 0, 1, 1,
-2.240139, 3.300377, -1.037143, 0, 0, 0, 1, 1,
-2.202033, -0.605058, -1.845948, 1, 1, 1, 1, 1,
-2.200973, 0.4373309, -0.5750057, 1, 1, 1, 1, 1,
-2.125448, -2.215555, -3.270968, 1, 1, 1, 1, 1,
-2.117644, -0.1886338, -1.737829, 1, 1, 1, 1, 1,
-2.084719, -0.7237607, -2.454621, 1, 1, 1, 1, 1,
-2.080474, -0.6060408, -3.066145, 1, 1, 1, 1, 1,
-2.069328, -1.135137, -1.379727, 1, 1, 1, 1, 1,
-2.039808, 0.8364777, -1.349348, 1, 1, 1, 1, 1,
-1.994748, -0.5423687, -3.10139, 1, 1, 1, 1, 1,
-1.992392, -1.394235, -2.803932, 1, 1, 1, 1, 1,
-1.969258, -0.6528396, -2.251165, 1, 1, 1, 1, 1,
-1.956059, 0.7334728, -2.013471, 1, 1, 1, 1, 1,
-1.930083, -1.376246, -1.45078, 1, 1, 1, 1, 1,
-1.915319, -0.4916924, -2.145843, 1, 1, 1, 1, 1,
-1.905068, 0.3706046, -3.590489, 1, 1, 1, 1, 1,
-1.89608, 0.02146418, -0.847078, 0, 0, 1, 1, 1,
-1.883852, 0.5311816, -2.012168, 1, 0, 0, 1, 1,
-1.871876, -0.08327968, -2.512256, 1, 0, 0, 1, 1,
-1.86398, 0.01675189, -1.906838, 1, 0, 0, 1, 1,
-1.843951, 1.399934, -0.1099404, 1, 0, 0, 1, 1,
-1.843628, 0.5274418, -1.490691, 1, 0, 0, 1, 1,
-1.840304, -1.410294, -3.007539, 0, 0, 0, 1, 1,
-1.81418, 0.3935218, -2.212273, 0, 0, 0, 1, 1,
-1.788389, 1.442317, 2.700691, 0, 0, 0, 1, 1,
-1.748438, 0.8902849, -0.6858116, 0, 0, 0, 1, 1,
-1.734782, 1.404245, -0.6624529, 0, 0, 0, 1, 1,
-1.724449, -0.169476, -1.404102, 0, 0, 0, 1, 1,
-1.718452, -1.298221, -2.205238, 0, 0, 0, 1, 1,
-1.717275, -0.5556405, -2.414505, 1, 1, 1, 1, 1,
-1.69736, 1.127915, -0.6625348, 1, 1, 1, 1, 1,
-1.690638, -1.470714, -1.01854, 1, 1, 1, 1, 1,
-1.677293, -1.767942, -3.361678, 1, 1, 1, 1, 1,
-1.668227, -0.8515687, -0.7366687, 1, 1, 1, 1, 1,
-1.666531, -1.162681, -3.156571, 1, 1, 1, 1, 1,
-1.656924, 0.7345535, -0.7968631, 1, 1, 1, 1, 1,
-1.649543, -0.5625238, -1.515081, 1, 1, 1, 1, 1,
-1.647601, 0.9460714, -0.5774027, 1, 1, 1, 1, 1,
-1.627151, 1.514784, -0.4725112, 1, 1, 1, 1, 1,
-1.621712, 1.377279, -1.030595, 1, 1, 1, 1, 1,
-1.576201, 1.10409, 1.54673, 1, 1, 1, 1, 1,
-1.560117, 0.1818139, -0.800481, 1, 1, 1, 1, 1,
-1.559391, -0.6481592, -1.496154, 1, 1, 1, 1, 1,
-1.556464, 0.03548682, -0.06738552, 1, 1, 1, 1, 1,
-1.551167, -1.327737, -2.461728, 0, 0, 1, 1, 1,
-1.550296, 1.337847, 0.3042325, 1, 0, 0, 1, 1,
-1.537003, -0.7006177, -3.475084, 1, 0, 0, 1, 1,
-1.536297, -0.9803987, -2.341074, 1, 0, 0, 1, 1,
-1.529378, 1.387966, -0.7053101, 1, 0, 0, 1, 1,
-1.517037, 0.5875997, -1.980875, 1, 0, 0, 1, 1,
-1.497798, 1.393502, 1.698699, 0, 0, 0, 1, 1,
-1.497456, 0.9591602, -2.145809, 0, 0, 0, 1, 1,
-1.485748, -1.419084, -1.107954, 0, 0, 0, 1, 1,
-1.482603, 0.5239776, 0.5967746, 0, 0, 0, 1, 1,
-1.480294, 0.3076793, -2.467171, 0, 0, 0, 1, 1,
-1.480258, -0.2838733, -0.6588724, 0, 0, 0, 1, 1,
-1.477814, 0.3183902, -2.779381, 0, 0, 0, 1, 1,
-1.476229, 0.5870315, -0.04552804, 1, 1, 1, 1, 1,
-1.475157, 0.5388474, -0.8250097, 1, 1, 1, 1, 1,
-1.473216, -1.400568, -3.530291, 1, 1, 1, 1, 1,
-1.469978, -0.1446199, -0.7883874, 1, 1, 1, 1, 1,
-1.469174, 0.3591303, -1.956051, 1, 1, 1, 1, 1,
-1.458539, -0.7651424, -0.4328933, 1, 1, 1, 1, 1,
-1.455213, 2.129185, -0.7765108, 1, 1, 1, 1, 1,
-1.454099, 2.70507, -1.863649, 1, 1, 1, 1, 1,
-1.453808, -1.400942, -2.47415, 1, 1, 1, 1, 1,
-1.443511, 0.06059344, -1.155562, 1, 1, 1, 1, 1,
-1.428165, 0.5604837, -3.372355, 1, 1, 1, 1, 1,
-1.425799, -1.507107, -0.9391225, 1, 1, 1, 1, 1,
-1.418532, 1.091466, -1.627432, 1, 1, 1, 1, 1,
-1.412024, -0.6788409, -2.50922, 1, 1, 1, 1, 1,
-1.409314, 1.095151, -1.187083, 1, 1, 1, 1, 1,
-1.405468, -1.008178, -1.11904, 0, 0, 1, 1, 1,
-1.40354, 0.3618512, -1.5715, 1, 0, 0, 1, 1,
-1.398254, -0.05608358, -2.091211, 1, 0, 0, 1, 1,
-1.377234, -0.1741731, -1.909376, 1, 0, 0, 1, 1,
-1.372355, 1.623856, 0.6314154, 1, 0, 0, 1, 1,
-1.362557, -0.03226602, -1.858766, 1, 0, 0, 1, 1,
-1.361158, -1.667889, -1.163812, 0, 0, 0, 1, 1,
-1.350845, -0.6185236, -2.412255, 0, 0, 0, 1, 1,
-1.344105, 1.393438, -1.69892, 0, 0, 0, 1, 1,
-1.338807, -1.264899, -2.835367, 0, 0, 0, 1, 1,
-1.323136, -0.4571089, -0.7387471, 0, 0, 0, 1, 1,
-1.320742, 1.916247, 0.2679351, 0, 0, 0, 1, 1,
-1.318599, 0.01546603, -2.412566, 0, 0, 0, 1, 1,
-1.310259, 1.388854, -0.6779421, 1, 1, 1, 1, 1,
-1.30847, -1.514249, -1.941201, 1, 1, 1, 1, 1,
-1.30414, 0.7787639, -1.509801, 1, 1, 1, 1, 1,
-1.30266, -0.5122011, -0.6295878, 1, 1, 1, 1, 1,
-1.301147, 0.3247878, -1.128979, 1, 1, 1, 1, 1,
-1.301026, -0.07888962, -1.534468, 1, 1, 1, 1, 1,
-1.298386, 0.3301899, -1.753592, 1, 1, 1, 1, 1,
-1.293304, -0.2222755, -2.184936, 1, 1, 1, 1, 1,
-1.292225, 0.7999573, -1.398435, 1, 1, 1, 1, 1,
-1.289944, -0.1712062, -2.599364, 1, 1, 1, 1, 1,
-1.280855, -0.2461008, -2.031831, 1, 1, 1, 1, 1,
-1.276788, 1.337419, -0.6652933, 1, 1, 1, 1, 1,
-1.272587, -1.353936, -0.8823721, 1, 1, 1, 1, 1,
-1.263513, 1.551495, -1.88303, 1, 1, 1, 1, 1,
-1.25697, -0.5885276, -1.668511, 1, 1, 1, 1, 1,
-1.255228, -2.401149, -4.523712, 0, 0, 1, 1, 1,
-1.248011, 0.9579377, -1.872163, 1, 0, 0, 1, 1,
-1.245005, -0.6605027, -1.985036, 1, 0, 0, 1, 1,
-1.23698, 1.151398, -1.276734, 1, 0, 0, 1, 1,
-1.228947, -0.3840067, -0.1819293, 1, 0, 0, 1, 1,
-1.22591, 1.698673, -0.6672119, 1, 0, 0, 1, 1,
-1.221441, -0.4672772, -1.718602, 0, 0, 0, 1, 1,
-1.21572, 0.620164, -2.526605, 0, 0, 0, 1, 1,
-1.210477, 0.1198513, -0.4253214, 0, 0, 0, 1, 1,
-1.209259, -0.2200234, -0.8785893, 0, 0, 0, 1, 1,
-1.190688, 0.03531753, -2.657663, 0, 0, 0, 1, 1,
-1.188281, -0.09469949, -2.028826, 0, 0, 0, 1, 1,
-1.181162, 0.9009663, 0.1506746, 0, 0, 0, 1, 1,
-1.173558, -0.01355985, -2.801615, 1, 1, 1, 1, 1,
-1.172746, -0.7548503, -1.252483, 1, 1, 1, 1, 1,
-1.144073, 0.2665432, -2.576274, 1, 1, 1, 1, 1,
-1.143762, 0.4241601, -0.8587821, 1, 1, 1, 1, 1,
-1.130835, -0.5648216, -3.507083, 1, 1, 1, 1, 1,
-1.130083, -1.577146, -3.20176, 1, 1, 1, 1, 1,
-1.122024, 0.1157713, -1.665114, 1, 1, 1, 1, 1,
-1.121803, 1.099481, -0.2724105, 1, 1, 1, 1, 1,
-1.12166, -0.1978369, -1.645615, 1, 1, 1, 1, 1,
-1.117807, -0.5050605, -3.873803, 1, 1, 1, 1, 1,
-1.115499, 0.8123519, -1.456717, 1, 1, 1, 1, 1,
-1.111795, -0.5699542, -1.53603, 1, 1, 1, 1, 1,
-1.098515, -1.851989, -3.838598, 1, 1, 1, 1, 1,
-1.09619, -1.53522, -1.943249, 1, 1, 1, 1, 1,
-1.087908, 1.811329, -0.804628, 1, 1, 1, 1, 1,
-1.078168, -0.3806904, -0.6787008, 0, 0, 1, 1, 1,
-1.072476, -0.06176824, -1.080457, 1, 0, 0, 1, 1,
-1.070379, -0.8885855, -1.79831, 1, 0, 0, 1, 1,
-1.063785, -0.6311817, -1.632064, 1, 0, 0, 1, 1,
-1.058525, 0.1088628, -1.84808, 1, 0, 0, 1, 1,
-1.058068, -0.05543386, -0.6795558, 1, 0, 0, 1, 1,
-1.054868, 0.07867421, -2.501929, 0, 0, 0, 1, 1,
-1.051588, -0.1440877, -0.9275079, 0, 0, 0, 1, 1,
-1.030966, 0.09237719, -0.1810908, 0, 0, 0, 1, 1,
-1.029538, 0.8520015, -1.194237, 0, 0, 0, 1, 1,
-1.012331, -1.442002, -2.147518, 0, 0, 0, 1, 1,
-0.9922764, 0.5579666, 0.02536961, 0, 0, 0, 1, 1,
-0.9902049, 1.703217, -0.7851818, 0, 0, 0, 1, 1,
-0.9900653, 0.8670622, -0.500791, 1, 1, 1, 1, 1,
-0.9866059, -0.5838592, -1.275293, 1, 1, 1, 1, 1,
-0.9808216, -0.9078349, -3.877881, 1, 1, 1, 1, 1,
-0.9639134, 1.638991, 0.3453749, 1, 1, 1, 1, 1,
-0.9630884, -0.3218347, -3.522186, 1, 1, 1, 1, 1,
-0.9600371, 0.4101003, -0.4043839, 1, 1, 1, 1, 1,
-0.953553, 1.604024, -0.3517954, 1, 1, 1, 1, 1,
-0.9491398, 0.4785727, -1.084722, 1, 1, 1, 1, 1,
-0.945237, -0.1497254, -3.888548, 1, 1, 1, 1, 1,
-0.9397396, -0.4697636, -1.337499, 1, 1, 1, 1, 1,
-0.9324179, -1.513644, -1.744362, 1, 1, 1, 1, 1,
-0.9313163, -1.15166, -1.28647, 1, 1, 1, 1, 1,
-0.9294524, -1.488401, -1.827138, 1, 1, 1, 1, 1,
-0.9249281, 0.1444207, -0.7968165, 1, 1, 1, 1, 1,
-0.9099218, -0.8622447, -2.648098, 1, 1, 1, 1, 1,
-0.9072524, -0.5328956, -2.04523, 0, 0, 1, 1, 1,
-0.9072387, 2.026822, -0.5464914, 1, 0, 0, 1, 1,
-0.9005741, 0.6102172, -0.9195943, 1, 0, 0, 1, 1,
-0.8966089, 1.146983, -2.068063, 1, 0, 0, 1, 1,
-0.8957886, -1.150355, -2.731204, 1, 0, 0, 1, 1,
-0.8925622, 0.9971987, -2.012432, 1, 0, 0, 1, 1,
-0.8920773, 1.038241, -0.9099903, 0, 0, 0, 1, 1,
-0.8879588, -0.4086688, -0.5826768, 0, 0, 0, 1, 1,
-0.886299, 0.105794, -2.944272, 0, 0, 0, 1, 1,
-0.8848005, 0.7077439, -0.8078539, 0, 0, 0, 1, 1,
-0.8838355, -0.5880111, -1.32624, 0, 0, 0, 1, 1,
-0.8735973, 0.1053617, -1.615787, 0, 0, 0, 1, 1,
-0.8676863, -1.259802, -3.528882, 0, 0, 0, 1, 1,
-0.8658607, -0.2164878, -2.993928, 1, 1, 1, 1, 1,
-0.8624016, 0.005056943, -0.1053246, 1, 1, 1, 1, 1,
-0.8586326, 1.129196, 0.3316483, 1, 1, 1, 1, 1,
-0.8574547, 0.5718448, -0.5182216, 1, 1, 1, 1, 1,
-0.8549739, -0.01437703, -1.701241, 1, 1, 1, 1, 1,
-0.8547713, 1.06027, -1.130085, 1, 1, 1, 1, 1,
-0.8496802, 1.763595, 0.5905122, 1, 1, 1, 1, 1,
-0.8496642, 0.6334021, -1.860627, 1, 1, 1, 1, 1,
-0.8436514, 0.7467207, -1.43261, 1, 1, 1, 1, 1,
-0.843315, -0.1973537, -3.476781, 1, 1, 1, 1, 1,
-0.8416132, 0.9521739, -1.900993, 1, 1, 1, 1, 1,
-0.8410035, 0.403357, -0.7099811, 1, 1, 1, 1, 1,
-0.8388975, -0.6515282, -1.466731, 1, 1, 1, 1, 1,
-0.8362114, -1.730533, -3.980526, 1, 1, 1, 1, 1,
-0.8334439, 1.198864, -0.7611383, 1, 1, 1, 1, 1,
-0.8252571, 0.6659989, -0.5564288, 0, 0, 1, 1, 1,
-0.8238351, -0.6599646, -0.5085863, 1, 0, 0, 1, 1,
-0.8231035, 0.08583958, -1.842723, 1, 0, 0, 1, 1,
-0.8196279, 1.033967, -0.5932016, 1, 0, 0, 1, 1,
-0.8105972, -1.403402, -3.397771, 1, 0, 0, 1, 1,
-0.8035401, -1.410448, -2.415427, 1, 0, 0, 1, 1,
-0.796002, -0.1070374, -1.639019, 0, 0, 0, 1, 1,
-0.7914901, -1.794544, -2.8391, 0, 0, 0, 1, 1,
-0.7912673, -0.1146611, -2.329685, 0, 0, 0, 1, 1,
-0.7851151, -0.3573897, -3.064193, 0, 0, 0, 1, 1,
-0.7831597, -0.1293689, -1.223176, 0, 0, 0, 1, 1,
-0.7779646, 0.558037, -0.07579319, 0, 0, 0, 1, 1,
-0.7755277, 0.3633664, -1.218658, 0, 0, 0, 1, 1,
-0.772245, -0.3272235, -1.376267, 1, 1, 1, 1, 1,
-0.7713668, 1.899556, 1.083922, 1, 1, 1, 1, 1,
-0.7676703, 0.274481, -2.225425, 1, 1, 1, 1, 1,
-0.7671383, -0.07469889, -1.087056, 1, 1, 1, 1, 1,
-0.7669242, -0.9597793, -1.071131, 1, 1, 1, 1, 1,
-0.7581801, -1.008369, -1.663688, 1, 1, 1, 1, 1,
-0.7373251, 0.2066799, -1.455309, 1, 1, 1, 1, 1,
-0.7345966, -1.100938, -2.585467, 1, 1, 1, 1, 1,
-0.7342284, 0.4250375, -0.932681, 1, 1, 1, 1, 1,
-0.7310887, 0.2069882, -0.6770242, 1, 1, 1, 1, 1,
-0.7303435, -0.8558671, -1.305136, 1, 1, 1, 1, 1,
-0.7295969, -0.3838797, -2.042368, 1, 1, 1, 1, 1,
-0.7290515, 0.9644949, 0.3928246, 1, 1, 1, 1, 1,
-0.7236094, -1.462472, -2.50645, 1, 1, 1, 1, 1,
-0.7163948, 0.5677975, -1.897851, 1, 1, 1, 1, 1,
-0.705058, 1.037994, -0.2272165, 0, 0, 1, 1, 1,
-0.7027697, 0.4139416, -1.642029, 1, 0, 0, 1, 1,
-0.6934729, 0.1162943, -1.377101, 1, 0, 0, 1, 1,
-0.6926388, 0.9118308, 0.2024923, 1, 0, 0, 1, 1,
-0.6895537, -0.7852837, -2.078424, 1, 0, 0, 1, 1,
-0.6846262, 0.3030739, 0.8917353, 1, 0, 0, 1, 1,
-0.6809133, -0.1259878, -1.742935, 0, 0, 0, 1, 1,
-0.6760552, 0.1627541, -1.704864, 0, 0, 0, 1, 1,
-0.6756125, -1.4752e-05, -1.275556, 0, 0, 0, 1, 1,
-0.6742308, -0.5657168, -3.105912, 0, 0, 0, 1, 1,
-0.6699553, 0.7981625, -0.781709, 0, 0, 0, 1, 1,
-0.6684479, 0.5900443, 0.04622052, 0, 0, 0, 1, 1,
-0.667456, -0.270263, -0.386393, 0, 0, 0, 1, 1,
-0.6633687, -0.1684365, -3.143742, 1, 1, 1, 1, 1,
-0.6590335, 1.491937, 0.1112283, 1, 1, 1, 1, 1,
-0.6589586, -0.2722903, -0.8998888, 1, 1, 1, 1, 1,
-0.6520249, -1.325383, -1.614926, 1, 1, 1, 1, 1,
-0.6509424, -1.312921, -2.936412, 1, 1, 1, 1, 1,
-0.6448963, -0.386396, -2.063206, 1, 1, 1, 1, 1,
-0.6438138, 0.06805722, -1.941813, 1, 1, 1, 1, 1,
-0.6409763, -0.8442595, -3.722053, 1, 1, 1, 1, 1,
-0.6341076, 0.3035545, -0.6684418, 1, 1, 1, 1, 1,
-0.6284992, -0.009616232, -1.167531, 1, 1, 1, 1, 1,
-0.6250126, -0.5907465, -2.553552, 1, 1, 1, 1, 1,
-0.6233343, -1.580676, -1.709248, 1, 1, 1, 1, 1,
-0.6175895, -1.070749, -1.285228, 1, 1, 1, 1, 1,
-0.6149574, -0.1269109, -1.371375, 1, 1, 1, 1, 1,
-0.61261, 0.5434125, -0.5268981, 1, 1, 1, 1, 1,
-0.6109289, 1.004293, -0.2851953, 0, 0, 1, 1, 1,
-0.6087732, -0.2423071, -2.652929, 1, 0, 0, 1, 1,
-0.6075935, 0.8967689, -1.049542, 1, 0, 0, 1, 1,
-0.603032, 0.07724375, -2.494509, 1, 0, 0, 1, 1,
-0.6004599, 1.212856, 0.4115496, 1, 0, 0, 1, 1,
-0.5984572, 1.002039, -0.7262363, 1, 0, 0, 1, 1,
-0.5949323, 0.3948528, -1.155042, 0, 0, 0, 1, 1,
-0.5948914, 0.8615515, -1.283789, 0, 0, 0, 1, 1,
-0.5936975, 0.1843416, -4.148287, 0, 0, 0, 1, 1,
-0.5908184, 0.2124566, -2.731966, 0, 0, 0, 1, 1,
-0.5866116, -0.589428, -1.807486, 0, 0, 0, 1, 1,
-0.5801042, 1.465758, 0.3871621, 0, 0, 0, 1, 1,
-0.578701, -1.456959, -3.166926, 0, 0, 0, 1, 1,
-0.5780954, -0.6499679, -1.527927, 1, 1, 1, 1, 1,
-0.5676113, -1.153478, -1.906896, 1, 1, 1, 1, 1,
-0.5634946, 0.06024046, -2.67152, 1, 1, 1, 1, 1,
-0.5611655, -0.06746129, -2.958653, 1, 1, 1, 1, 1,
-0.5600088, 1.911797, 1.921686, 1, 1, 1, 1, 1,
-0.560001, 1.141431, 0.01440466, 1, 1, 1, 1, 1,
-0.5583128, 0.6942346, -1.52991, 1, 1, 1, 1, 1,
-0.5571729, 0.4499546, -1.591928, 1, 1, 1, 1, 1,
-0.5527708, -0.5639643, -2.770673, 1, 1, 1, 1, 1,
-0.5518789, 1.05212, -0.5897713, 1, 1, 1, 1, 1,
-0.5421116, 1.58303, -0.6934253, 1, 1, 1, 1, 1,
-0.5390515, -0.9466655, -2.467267, 1, 1, 1, 1, 1,
-0.5336888, -1.10425, -3.036319, 1, 1, 1, 1, 1,
-0.5318298, -0.1713702, 0.2665263, 1, 1, 1, 1, 1,
-0.5272346, 0.8412202, -0.9804096, 1, 1, 1, 1, 1,
-0.5262374, -0.9769606, -1.893439, 0, 0, 1, 1, 1,
-0.5248748, 1.243057, 0.8001876, 1, 0, 0, 1, 1,
-0.5244009, -0.9144358, -0.913591, 1, 0, 0, 1, 1,
-0.5228024, -1.294273, -2.239896, 1, 0, 0, 1, 1,
-0.516982, 0.2755281, -2.02633, 1, 0, 0, 1, 1,
-0.5165243, -0.5267447, -2.369937, 1, 0, 0, 1, 1,
-0.5081367, -0.2696309, -2.826293, 0, 0, 0, 1, 1,
-0.5076918, 0.1718308, -0.1190583, 0, 0, 0, 1, 1,
-0.502879, 0.1133106, -1.581602, 0, 0, 0, 1, 1,
-0.4990189, 0.9627353, -0.843501, 0, 0, 0, 1, 1,
-0.4989357, -1.026341, -1.034005, 0, 0, 0, 1, 1,
-0.4880603, -0.2190234, -2.529136, 0, 0, 0, 1, 1,
-0.4810831, -0.3927731, -2.003567, 0, 0, 0, 1, 1,
-0.4751991, 0.2483547, 0.5406724, 1, 1, 1, 1, 1,
-0.4751226, 0.6699921, -0.9871256, 1, 1, 1, 1, 1,
-0.470441, -0.3139208, -2.766434, 1, 1, 1, 1, 1,
-0.4702508, -0.8790213, -2.739176, 1, 1, 1, 1, 1,
-0.4666182, -0.4166107, -2.955658, 1, 1, 1, 1, 1,
-0.4639214, 1.187262, -1.77514, 1, 1, 1, 1, 1,
-0.462677, -1.18241, -2.156506, 1, 1, 1, 1, 1,
-0.4604554, 0.2973857, -1.963761, 1, 1, 1, 1, 1,
-0.4584436, 0.4957335, -0.2450441, 1, 1, 1, 1, 1,
-0.4576777, 0.2667502, -0.5391634, 1, 1, 1, 1, 1,
-0.4524395, -1.021196, -3.414143, 1, 1, 1, 1, 1,
-0.4480492, -1.026841, -2.741022, 1, 1, 1, 1, 1,
-0.4473913, 1.650299, -0.3751698, 1, 1, 1, 1, 1,
-0.4472426, 0.7882279, -0.9392463, 1, 1, 1, 1, 1,
-0.4443213, 1.158584, -1.279997, 1, 1, 1, 1, 1,
-0.4348276, 0.4989285, 0.1890469, 0, 0, 1, 1, 1,
-0.4325268, 0.4514708, -0.9495643, 1, 0, 0, 1, 1,
-0.4305792, -1.537937, -1.158279, 1, 0, 0, 1, 1,
-0.4305648, 0.04170201, -2.082123, 1, 0, 0, 1, 1,
-0.4283582, -1.065466, -3.24172, 1, 0, 0, 1, 1,
-0.4230373, -0.5345137, -2.684416, 1, 0, 0, 1, 1,
-0.4176748, -1.880878, -2.931466, 0, 0, 0, 1, 1,
-0.4064127, -0.3086234, -2.176728, 0, 0, 0, 1, 1,
-0.4057433, -0.3870744, -3.297467, 0, 0, 0, 1, 1,
-0.401683, 1.378775, -0.0400129, 0, 0, 0, 1, 1,
-0.3966599, 0.8267333, 0.06285699, 0, 0, 0, 1, 1,
-0.3965919, 2.431922, -1.505495, 0, 0, 0, 1, 1,
-0.3910686, -1.785897, -2.478405, 0, 0, 0, 1, 1,
-0.3861341, 1.743057, -0.6135623, 1, 1, 1, 1, 1,
-0.3851887, -0.004699807, -1.084379, 1, 1, 1, 1, 1,
-0.3840227, 0.7435899, -0.1020892, 1, 1, 1, 1, 1,
-0.37887, 0.453207, -0.5945922, 1, 1, 1, 1, 1,
-0.3752714, 1.254093, -1.350837, 1, 1, 1, 1, 1,
-0.3749334, -0.4712618, -2.422886, 1, 1, 1, 1, 1,
-0.3732183, -0.5883269, -2.771078, 1, 1, 1, 1, 1,
-0.3697239, 1.242898, -1.216385, 1, 1, 1, 1, 1,
-0.3679617, -1.197389, -2.237513, 1, 1, 1, 1, 1,
-0.3673385, 1.406003, -2.418573, 1, 1, 1, 1, 1,
-0.3657817, 0.7285954, 1.074426, 1, 1, 1, 1, 1,
-0.3648412, -1.458745, -1.971688, 1, 1, 1, 1, 1,
-0.3627029, 1.244424, 0.582001, 1, 1, 1, 1, 1,
-0.3622226, -0.8942771, -3.49155, 1, 1, 1, 1, 1,
-0.3613905, -1.321429, -3.549866, 1, 1, 1, 1, 1,
-0.3613684, -0.649685, -2.276678, 0, 0, 1, 1, 1,
-0.3613218, 0.6015018, -0.001956628, 1, 0, 0, 1, 1,
-0.3602964, -0.74712, -2.918065, 1, 0, 0, 1, 1,
-0.3601163, 0.9092479, 0.9947697, 1, 0, 0, 1, 1,
-0.3566848, 1.137232, -0.8406447, 1, 0, 0, 1, 1,
-0.3558794, -0.1035024, -0.2056227, 1, 0, 0, 1, 1,
-0.3494629, -1.327777, -3.978273, 0, 0, 0, 1, 1,
-0.3458942, 0.8692425, -0.2560808, 0, 0, 0, 1, 1,
-0.3441219, -0.08968753, -1.296763, 0, 0, 0, 1, 1,
-0.3418289, -0.2014739, -2.851398, 0, 0, 0, 1, 1,
-0.341017, -1.939988, -3.356164, 0, 0, 0, 1, 1,
-0.3408306, 1.086816, -0.3525302, 0, 0, 0, 1, 1,
-0.339612, 0.5352203, 1.893174, 0, 0, 0, 1, 1,
-0.3394691, 2.654958, 0.5546312, 1, 1, 1, 1, 1,
-0.3362039, 0.311802, -0.2779191, 1, 1, 1, 1, 1,
-0.3360972, 0.6492571, 1.162785, 1, 1, 1, 1, 1,
-0.3292465, -0.4225607, -4.490309, 1, 1, 1, 1, 1,
-0.3258546, 0.5411842, 0.3460602, 1, 1, 1, 1, 1,
-0.3251154, 0.5073889, -1.152081, 1, 1, 1, 1, 1,
-0.3220283, -1.035357, -1.368654, 1, 1, 1, 1, 1,
-0.3197339, 1.646639, -2.589519, 1, 1, 1, 1, 1,
-0.3191172, -0.7605829, -2.214712, 1, 1, 1, 1, 1,
-0.312315, 0.7365006, 0.06561781, 1, 1, 1, 1, 1,
-0.3090385, 0.5315968, 0.8316281, 1, 1, 1, 1, 1,
-0.3009284, -0.8730326, -3.642944, 1, 1, 1, 1, 1,
-0.2964885, -0.7522804, -1.085669, 1, 1, 1, 1, 1,
-0.2891122, 0.08875193, -1.217017, 1, 1, 1, 1, 1,
-0.2861504, 0.7966529, -2.190516, 1, 1, 1, 1, 1,
-0.2838854, 0.8692775, -0.7581525, 0, 0, 1, 1, 1,
-0.2836991, -0.5662508, -4.227773, 1, 0, 0, 1, 1,
-0.277258, 0.357631, -1.963295, 1, 0, 0, 1, 1,
-0.2735566, 1.394196, -0.5303239, 1, 0, 0, 1, 1,
-0.2707894, 0.1289419, -2.386038, 1, 0, 0, 1, 1,
-0.2698165, 0.6973373, -0.2878349, 1, 0, 0, 1, 1,
-0.2677553, -0.4624538, -1.831976, 0, 0, 0, 1, 1,
-0.2603626, 0.2249245, -0.8562765, 0, 0, 0, 1, 1,
-0.2595378, -0.04492988, -3.402665, 0, 0, 0, 1, 1,
-0.2571588, -0.02432978, -2.06375, 0, 0, 0, 1, 1,
-0.2566606, 0.1530223, -0.3090034, 0, 0, 0, 1, 1,
-0.2566128, -1.222846, -4.246757, 0, 0, 0, 1, 1,
-0.253706, -1.168605, -4.949422, 0, 0, 0, 1, 1,
-0.2492947, 0.08555024, -0.4224844, 1, 1, 1, 1, 1,
-0.241567, -0.4971009, -2.496465, 1, 1, 1, 1, 1,
-0.2359332, -0.3058738, -1.851323, 1, 1, 1, 1, 1,
-0.2355844, -1.31365, -4.501796, 1, 1, 1, 1, 1,
-0.2355264, 1.206689, -0.8623527, 1, 1, 1, 1, 1,
-0.2327013, -0.08000919, -2.277311, 1, 1, 1, 1, 1,
-0.231547, -0.9484444, -2.385594, 1, 1, 1, 1, 1,
-0.2245075, -0.1118271, -3.852413, 1, 1, 1, 1, 1,
-0.2161075, -0.8082888, -2.814746, 1, 1, 1, 1, 1,
-0.2153427, 1.000837, 0.7606326, 1, 1, 1, 1, 1,
-0.215158, -0.2451173, -3.365706, 1, 1, 1, 1, 1,
-0.2142519, 0.02883267, -1.627348, 1, 1, 1, 1, 1,
-0.2132234, -0.5292895, -3.07002, 1, 1, 1, 1, 1,
-0.2107996, -1.581407, -3.670297, 1, 1, 1, 1, 1,
-0.1935933, -0.5796435, -2.688058, 1, 1, 1, 1, 1,
-0.1866645, -1.928492, -2.264282, 0, 0, 1, 1, 1,
-0.1818944, -0.9217143, -3.626901, 1, 0, 0, 1, 1,
-0.1787641, -0.05066007, -0.4648206, 1, 0, 0, 1, 1,
-0.1782139, 1.247382, 1.029509, 1, 0, 0, 1, 1,
-0.1776652, -1.780787, -3.811599, 1, 0, 0, 1, 1,
-0.1755855, 0.02601868, -1.404867, 1, 0, 0, 1, 1,
-0.1713808, 0.0852402, -0.1062226, 0, 0, 0, 1, 1,
-0.1688123, 0.4811544, 0.02948674, 0, 0, 0, 1, 1,
-0.1653983, 0.6949758, -1.538896, 0, 0, 0, 1, 1,
-0.1637776, -0.07551681, -1.610611, 0, 0, 0, 1, 1,
-0.1612387, -0.1375308, -1.586022, 0, 0, 0, 1, 1,
-0.1535541, 0.4988695, 0.7135812, 0, 0, 0, 1, 1,
-0.1533588, -1.672218, -3.914227, 0, 0, 0, 1, 1,
-0.1528639, 0.7290866, 0.9362268, 1, 1, 1, 1, 1,
-0.1511456, 1.732756, 1.139027, 1, 1, 1, 1, 1,
-0.1501273, -0.6421954, -3.255787, 1, 1, 1, 1, 1,
-0.1482483, -1.389275, -2.560111, 1, 1, 1, 1, 1,
-0.1450591, -0.2440409, -3.465478, 1, 1, 1, 1, 1,
-0.1422014, 0.4198426, 0.3996989, 1, 1, 1, 1, 1,
-0.1391974, -0.04708246, -1.448846, 1, 1, 1, 1, 1,
-0.1368641, 0.1345662, -1.958547, 1, 1, 1, 1, 1,
-0.1326809, 0.1414763, -0.06200019, 1, 1, 1, 1, 1,
-0.131393, -0.1585715, 0.7093414, 1, 1, 1, 1, 1,
-0.1230853, 0.9832812, -0.6980505, 1, 1, 1, 1, 1,
-0.1192493, 0.2137552, -1.653226, 1, 1, 1, 1, 1,
-0.1183797, 0.259655, -1.949339, 1, 1, 1, 1, 1,
-0.1177454, 1.502986, -1.068921, 1, 1, 1, 1, 1,
-0.1171732, 0.3563095, -2.287838, 1, 1, 1, 1, 1,
-0.1114709, 1.290238, -0.5724998, 0, 0, 1, 1, 1,
-0.10914, -0.7230831, -3.389948, 1, 0, 0, 1, 1,
-0.1002371, 0.2261793, 0.04331147, 1, 0, 0, 1, 1,
-0.09789159, -0.1657307, -0.9279135, 1, 0, 0, 1, 1,
-0.09641812, -0.353688, -4.314927, 1, 0, 0, 1, 1,
-0.09521932, -0.1499617, -3.222106, 1, 0, 0, 1, 1,
-0.09117414, -1.186883, -1.928483, 0, 0, 0, 1, 1,
-0.09014353, -1.16931, -3.476928, 0, 0, 0, 1, 1,
-0.08754645, -1.031385, -2.755753, 0, 0, 0, 1, 1,
-0.08714569, -0.2996269, -3.044539, 0, 0, 0, 1, 1,
-0.0834282, -0.7820935, -2.993393, 0, 0, 0, 1, 1,
-0.08029004, -0.05479683, -0.7189276, 0, 0, 0, 1, 1,
-0.07983941, 1.07301, -0.9442702, 0, 0, 0, 1, 1,
-0.07781018, -0.9815587, -2.797362, 1, 1, 1, 1, 1,
-0.07264488, -0.4634044, -3.092285, 1, 1, 1, 1, 1,
-0.07034091, -1.223033, -2.797173, 1, 1, 1, 1, 1,
-0.06597133, -0.1174425, -1.875975, 1, 1, 1, 1, 1,
-0.0558279, -0.2292398, -5.11473, 1, 1, 1, 1, 1,
-0.05502818, 0.9877296, 0.6677713, 1, 1, 1, 1, 1,
-0.05489964, 0.8764347, -1.401272, 1, 1, 1, 1, 1,
-0.05355596, 0.7225283, 0.815066, 1, 1, 1, 1, 1,
-0.0522674, 0.723726, -1.459738, 1, 1, 1, 1, 1,
-0.05187558, 0.7000375, 1.144674, 1, 1, 1, 1, 1,
-0.0512289, -0.9393469, -2.831887, 1, 1, 1, 1, 1,
-0.04796604, -2.120478, -5.461401, 1, 1, 1, 1, 1,
-0.04535274, 0.4971015, 0.493885, 1, 1, 1, 1, 1,
-0.04421471, 1.818808, 0.2329404, 1, 1, 1, 1, 1,
-0.04369316, 0.7432466, 0.2963468, 1, 1, 1, 1, 1,
-0.04321615, -1.809913, -3.416258, 0, 0, 1, 1, 1,
-0.04265602, 0.6586716, -1.362888, 1, 0, 0, 1, 1,
-0.03846515, -0.3960086, -3.081137, 1, 0, 0, 1, 1,
-0.03837115, 0.5992154, -1.410212, 1, 0, 0, 1, 1,
-0.025427, -0.619947, -0.9769454, 1, 0, 0, 1, 1,
-0.02505646, -1.471059, -2.895972, 1, 0, 0, 1, 1,
-0.02141523, -1.524959, -1.431367, 0, 0, 0, 1, 1,
-0.02111124, -0.1354432, -4.346582, 0, 0, 0, 1, 1,
-0.01486958, 0.1084037, 0.834353, 0, 0, 0, 1, 1,
-0.01358187, -2.164716, -3.301629, 0, 0, 0, 1, 1,
-0.01172788, 0.6854433, -1.337033, 0, 0, 0, 1, 1,
-0.006860884, 0.3201289, -1.417966, 0, 0, 0, 1, 1,
-0.006018684, 0.1130671, -1.234807, 0, 0, 0, 1, 1,
-0.005302821, -0.4040065, -4.383013, 1, 1, 1, 1, 1,
-0.003750359, 0.1330236, 0.2094284, 1, 1, 1, 1, 1,
-0.0002213207, 1.853432, -1.063172, 1, 1, 1, 1, 1,
0.003637174, -1.396333, 3.508965, 1, 1, 1, 1, 1,
0.00533511, -0.1218895, 3.252244, 1, 1, 1, 1, 1,
0.006732372, -0.6526946, 2.963084, 1, 1, 1, 1, 1,
0.00724426, -0.02455597, 2.840271, 1, 1, 1, 1, 1,
0.008942484, -0.03624782, 3.184581, 1, 1, 1, 1, 1,
0.00989373, -1.088425, 3.444582, 1, 1, 1, 1, 1,
0.01074047, 0.173326, -1.411642, 1, 1, 1, 1, 1,
0.0130419, 0.1106722, -0.1746458, 1, 1, 1, 1, 1,
0.01415563, -0.8384471, 3.497824, 1, 1, 1, 1, 1,
0.01589877, -1.428157, 2.242968, 1, 1, 1, 1, 1,
0.01673598, 1.574698, -0.7885656, 1, 1, 1, 1, 1,
0.01813569, 0.440891, -0.3215267, 1, 1, 1, 1, 1,
0.01878705, 1.97256, 0.4140675, 0, 0, 1, 1, 1,
0.02280848, 0.33958, 0.0972145, 1, 0, 0, 1, 1,
0.02375107, 1.513286, -1.82485, 1, 0, 0, 1, 1,
0.0269783, -0.7162386, 1.607563, 1, 0, 0, 1, 1,
0.02841226, -1.345601, 3.621552, 1, 0, 0, 1, 1,
0.02847415, -0.09122196, 4.145765, 1, 0, 0, 1, 1,
0.02912149, 1.166369, 1.190186, 0, 0, 0, 1, 1,
0.03947538, -0.1101695, 2.006424, 0, 0, 0, 1, 1,
0.04003547, 1.528656, -1.265647, 0, 0, 0, 1, 1,
0.04069371, 1.844888, 1.273787, 0, 0, 0, 1, 1,
0.0456792, 1.314651, -0.8746678, 0, 0, 0, 1, 1,
0.04781492, 0.8475323, -1.702161, 0, 0, 0, 1, 1,
0.04963666, 0.2416692, -0.04760153, 0, 0, 0, 1, 1,
0.05080315, -0.06271667, 1.437802, 1, 1, 1, 1, 1,
0.05179537, 0.5757247, -0.600973, 1, 1, 1, 1, 1,
0.05274045, -0.2779957, 1.5057, 1, 1, 1, 1, 1,
0.05407314, -1.882624, 2.417091, 1, 1, 1, 1, 1,
0.05450939, 1.991794, 2.082469, 1, 1, 1, 1, 1,
0.05871894, -0.4934488, 3.902232, 1, 1, 1, 1, 1,
0.06292138, -0.6558416, 2.09894, 1, 1, 1, 1, 1,
0.06591273, 0.6819025, 2.252437, 1, 1, 1, 1, 1,
0.06690075, -1.039273, 4.05758, 1, 1, 1, 1, 1,
0.07215922, -0.8982337, 4.087758, 1, 1, 1, 1, 1,
0.07335573, 0.2213283, 1.3994, 1, 1, 1, 1, 1,
0.07336719, 0.6995925, 0.3585252, 1, 1, 1, 1, 1,
0.07587562, -0.9966112, 2.221221, 1, 1, 1, 1, 1,
0.07829279, -0.09864937, 1.688969, 1, 1, 1, 1, 1,
0.08170907, 0.1462489, 1.411995, 1, 1, 1, 1, 1,
0.08804761, 1.233773, -0.4024604, 0, 0, 1, 1, 1,
0.08855651, 0.2953311, -0.8206673, 1, 0, 0, 1, 1,
0.0893915, -0.513684, 2.659938, 1, 0, 0, 1, 1,
0.09413718, 0.1962162, 0.9645413, 1, 0, 0, 1, 1,
0.100952, 0.4756399, 0.1869873, 1, 0, 0, 1, 1,
0.1015071, -1.328248, 2.56282, 1, 0, 0, 1, 1,
0.1041486, -0.9657635, 4.781078, 0, 0, 0, 1, 1,
0.1061428, 0.5134867, 0.1193699, 0, 0, 0, 1, 1,
0.1103512, 1.48002, 0.9568748, 0, 0, 0, 1, 1,
0.1103647, -0.1104084, 3.15158, 0, 0, 0, 1, 1,
0.116216, -0.8698012, 3.983856, 0, 0, 0, 1, 1,
0.1165188, 1.716885, 0.7272583, 0, 0, 0, 1, 1,
0.1184945, -0.3456284, 3.370491, 0, 0, 0, 1, 1,
0.1209419, 0.7990524, -1.003742, 1, 1, 1, 1, 1,
0.123227, -0.5426715, 3.868947, 1, 1, 1, 1, 1,
0.1249597, 0.0895459, 1.233661, 1, 1, 1, 1, 1,
0.1338973, 0.01060649, 1.395275, 1, 1, 1, 1, 1,
0.1341724, 0.2430629, 0.2706846, 1, 1, 1, 1, 1,
0.1411233, 0.1135518, 0.2576107, 1, 1, 1, 1, 1,
0.1440354, 1.122989, -1.132211, 1, 1, 1, 1, 1,
0.1471937, 0.4178628, -0.02119287, 1, 1, 1, 1, 1,
0.1473128, -0.4382671, 3.123045, 1, 1, 1, 1, 1,
0.1487039, -0.6647891, 2.730799, 1, 1, 1, 1, 1,
0.1524013, -2.168258, 4.314853, 1, 1, 1, 1, 1,
0.1580878, 0.6392657, 0.3469232, 1, 1, 1, 1, 1,
0.1619181, 1.095607, 0.7446807, 1, 1, 1, 1, 1,
0.1664061, -0.07673571, 1.657322, 1, 1, 1, 1, 1,
0.166775, -0.5266021, 2.151734, 1, 1, 1, 1, 1,
0.1671761, -1.321772, 4.999217, 0, 0, 1, 1, 1,
0.1673869, 0.9729918, 0.9163049, 1, 0, 0, 1, 1,
0.1686847, -0.3211382, 3.497005, 1, 0, 0, 1, 1,
0.1687741, 0.315438, 1.640741, 1, 0, 0, 1, 1,
0.1800981, -0.2696022, 3.000416, 1, 0, 0, 1, 1,
0.1825602, -0.6424607, 2.011473, 1, 0, 0, 1, 1,
0.1834154, 0.1249128, -0.3084691, 0, 0, 0, 1, 1,
0.1836914, -0.08150262, 2.140045, 0, 0, 0, 1, 1,
0.1838588, -1.052763, 3.946264, 0, 0, 0, 1, 1,
0.1844783, -0.2337182, 2.44661, 0, 0, 0, 1, 1,
0.1855227, -0.1197048, 4.288521, 0, 0, 0, 1, 1,
0.1858087, -0.4179679, 1.56864, 0, 0, 0, 1, 1,
0.1867499, -1.46728, 2.401403, 0, 0, 0, 1, 1,
0.1873525, 0.1286906, 0.1960774, 1, 1, 1, 1, 1,
0.187435, -0.877158, 1.32532, 1, 1, 1, 1, 1,
0.1905842, -3.209479, 3.475298, 1, 1, 1, 1, 1,
0.1940326, -0.6800671, 3.553735, 1, 1, 1, 1, 1,
0.1954979, -1.861573, 4.011201, 1, 1, 1, 1, 1,
0.1970873, 0.2703028, 0.6435662, 1, 1, 1, 1, 1,
0.1976927, 2.303175, 0.6906545, 1, 1, 1, 1, 1,
0.1979958, -0.6568961, 2.374216, 1, 1, 1, 1, 1,
0.1983288, -0.2892382, 1.30024, 1, 1, 1, 1, 1,
0.1987858, -0.567394, -0.3295761, 1, 1, 1, 1, 1,
0.1996267, 0.3710708, 0.229509, 1, 1, 1, 1, 1,
0.2017966, -0.1538597, 3.751715, 1, 1, 1, 1, 1,
0.2041155, 0.8010729, 0.1667137, 1, 1, 1, 1, 1,
0.2047311, -1.926064, 2.567192, 1, 1, 1, 1, 1,
0.2064839, 0.6339579, -0.2921008, 1, 1, 1, 1, 1,
0.2082442, -1.340717, 2.646263, 0, 0, 1, 1, 1,
0.2083663, -1.396349, 2.106215, 1, 0, 0, 1, 1,
0.2146232, -0.3029199, 3.328308, 1, 0, 0, 1, 1,
0.2212483, 0.03557348, 2.128231, 1, 0, 0, 1, 1,
0.2248324, 0.7368304, -1.646114, 1, 0, 0, 1, 1,
0.2265019, -0.3144272, 2.339408, 1, 0, 0, 1, 1,
0.2282249, -0.9271058, 3.940282, 0, 0, 0, 1, 1,
0.231628, -0.02448797, 1.615012, 0, 0, 0, 1, 1,
0.2316772, 0.2968967, 0.7164307, 0, 0, 0, 1, 1,
0.232165, -0.4419038, 2.431604, 0, 0, 0, 1, 1,
0.2336979, -1.002983, 4.625888, 0, 0, 0, 1, 1,
0.2351896, -2.086842, 2.164481, 0, 0, 0, 1, 1,
0.235328, 0.4976901, 2.205032, 0, 0, 0, 1, 1,
0.2356018, -1.007248, 1.31839, 1, 1, 1, 1, 1,
0.239313, 0.8074175, 1.06699, 1, 1, 1, 1, 1,
0.2403336, -0.8631523, 2.49354, 1, 1, 1, 1, 1,
0.2428802, -0.1049798, 1.173512, 1, 1, 1, 1, 1,
0.2430637, -0.8325984, 1.75339, 1, 1, 1, 1, 1,
0.2432831, -0.9407014, 3.907985, 1, 1, 1, 1, 1,
0.2438528, 0.3805963, -1.964324, 1, 1, 1, 1, 1,
0.2449156, 0.4177744, -0.9240872, 1, 1, 1, 1, 1,
0.2464332, 0.03565011, 2.111828, 1, 1, 1, 1, 1,
0.2496562, 0.1912017, 0.5721949, 1, 1, 1, 1, 1,
0.2545723, -0.1455705, 3.173213, 1, 1, 1, 1, 1,
0.2561116, 0.9684256, 2.104018, 1, 1, 1, 1, 1,
0.2561544, 0.05395467, 1.985064, 1, 1, 1, 1, 1,
0.2578084, 0.04895558, 3.334585, 1, 1, 1, 1, 1,
0.2579911, 0.3338355, 0.7441599, 1, 1, 1, 1, 1,
0.2677384, 0.9662382, 2.23342, 0, 0, 1, 1, 1,
0.270315, -0.1438413, 4.256245, 1, 0, 0, 1, 1,
0.2705365, -0.342234, 1.912594, 1, 0, 0, 1, 1,
0.276385, -0.09050996, 1.712984, 1, 0, 0, 1, 1,
0.2800997, -0.2671695, 2.29616, 1, 0, 0, 1, 1,
0.2841246, -0.6097871, 2.178289, 1, 0, 0, 1, 1,
0.2888502, -0.4752325, 2.554247, 0, 0, 0, 1, 1,
0.2897062, -1.374776, 3.201535, 0, 0, 0, 1, 1,
0.2900032, -1.868657, 3.552925, 0, 0, 0, 1, 1,
0.3042741, -1.899495, 1.624126, 0, 0, 0, 1, 1,
0.3099645, -1.175125, 2.474159, 0, 0, 0, 1, 1,
0.310644, 0.3322343, -0.08618261, 0, 0, 0, 1, 1,
0.3165752, 0.2208462, 0.295042, 0, 0, 0, 1, 1,
0.3186342, 1.698385, 1.267058, 1, 1, 1, 1, 1,
0.3192402, 1.496743, -1.592982, 1, 1, 1, 1, 1,
0.320816, 0.5247567, -0.8730291, 1, 1, 1, 1, 1,
0.3220885, 0.05613214, 0.8100959, 1, 1, 1, 1, 1,
0.3273217, -0.379398, 3.223081, 1, 1, 1, 1, 1,
0.3303976, -0.4871818, 4.156932, 1, 1, 1, 1, 1,
0.3316164, 1.017352, -0.02512089, 1, 1, 1, 1, 1,
0.3334953, -1.12244, 2.642392, 1, 1, 1, 1, 1,
0.3337443, 1.255171, 0.07973196, 1, 1, 1, 1, 1,
0.3360789, -0.9049784, 2.12949, 1, 1, 1, 1, 1,
0.3415087, 2.290349, -0.09855717, 1, 1, 1, 1, 1,
0.3425263, 0.2459514, 1.767712, 1, 1, 1, 1, 1,
0.3491961, 0.1945897, 0.003695466, 1, 1, 1, 1, 1,
0.3562322, 0.7064903, 0.1421717, 1, 1, 1, 1, 1,
0.3635669, 0.9183626, 0.2606343, 1, 1, 1, 1, 1,
0.3636154, 1.754089, 0.8438904, 0, 0, 1, 1, 1,
0.3639221, -2.79888, 2.388001, 1, 0, 0, 1, 1,
0.3649641, 1.312415, 0.4104194, 1, 0, 0, 1, 1,
0.3682691, -1.375168, 2.016041, 1, 0, 0, 1, 1,
0.3716034, 0.4156032, -0.1566512, 1, 0, 0, 1, 1,
0.3771713, 0.4462118, 0.8921541, 1, 0, 0, 1, 1,
0.3772792, -0.6133823, 1.851682, 0, 0, 0, 1, 1,
0.3821903, -0.3678741, 2.066535, 0, 0, 0, 1, 1,
0.3824013, -1.074744, 3.89411, 0, 0, 0, 1, 1,
0.3863261, -0.8685802, 2.684876, 0, 0, 0, 1, 1,
0.3870297, -0.9274834, 1.188354, 0, 0, 0, 1, 1,
0.3876209, -1.84328, 2.802863, 0, 0, 0, 1, 1,
0.3876482, -0.5842575, 2.72631, 0, 0, 0, 1, 1,
0.3880018, -0.1104059, 3.651968, 1, 1, 1, 1, 1,
0.3900532, -1.777638, 2.002998, 1, 1, 1, 1, 1,
0.3929729, -0.7954634, 1.834984, 1, 1, 1, 1, 1,
0.3945721, -0.669512, 2.417892, 1, 1, 1, 1, 1,
0.3968047, -1.455256, 2.412025, 1, 1, 1, 1, 1,
0.3974885, -0.9908744, 1.682988, 1, 1, 1, 1, 1,
0.400346, 0.8830981, -0.4333181, 1, 1, 1, 1, 1,
0.4013618, -1.946832, 2.007401, 1, 1, 1, 1, 1,
0.4026986, -0.5196258, 3.622095, 1, 1, 1, 1, 1,
0.404304, -0.470279, 2.451159, 1, 1, 1, 1, 1,
0.4082606, 0.4603581, 1.015844, 1, 1, 1, 1, 1,
0.4099736, 0.6780359, 1.979331, 1, 1, 1, 1, 1,
0.4148419, 0.2049039, 2.029967, 1, 1, 1, 1, 1,
0.420638, 0.4984787, 1.112387, 1, 1, 1, 1, 1,
0.4245807, 0.886507, 0.1985762, 1, 1, 1, 1, 1,
0.4247525, 0.171333, 2.407531, 0, 0, 1, 1, 1,
0.4263819, 0.9808553, -0.7325423, 1, 0, 0, 1, 1,
0.4273123, 1.810448, 1.320975, 1, 0, 0, 1, 1,
0.4292317, -0.5679622, 3.300771, 1, 0, 0, 1, 1,
0.4337575, -0.3142033, 2.038237, 1, 0, 0, 1, 1,
0.4383995, -0.3759071, 2.904353, 1, 0, 0, 1, 1,
0.439149, 0.2556945, 0.5555639, 0, 0, 0, 1, 1,
0.4392746, -0.1385459, 1.680845, 0, 0, 0, 1, 1,
0.4405015, 1.190369, 0.8207765, 0, 0, 0, 1, 1,
0.441606, -1.213746, 3.395, 0, 0, 0, 1, 1,
0.4428529, -0.3624127, 2.573822, 0, 0, 0, 1, 1,
0.4454776, 1.11465, 0.4335362, 0, 0, 0, 1, 1,
0.4467724, -0.4622989, 1.229135, 0, 0, 0, 1, 1,
0.4474761, -2.2083, 2.916006, 1, 1, 1, 1, 1,
0.4492625, 2.407189, -0.427207, 1, 1, 1, 1, 1,
0.4505606, -0.6400888, 2.741775, 1, 1, 1, 1, 1,
0.4512698, 0.2655732, 1.796176, 1, 1, 1, 1, 1,
0.4531623, -1.583938, 4.84603, 1, 1, 1, 1, 1,
0.4537202, 1.05407, 0.03869522, 1, 1, 1, 1, 1,
0.4552755, 0.4504958, -0.7822608, 1, 1, 1, 1, 1,
0.4576696, 0.3689635, 1.018828, 1, 1, 1, 1, 1,
0.4581991, 0.1659662, 0.5697817, 1, 1, 1, 1, 1,
0.4628753, 0.3911597, 1.336788, 1, 1, 1, 1, 1,
0.4653855, -0.8347713, 1.190565, 1, 1, 1, 1, 1,
0.4697132, 0.8028096, -0.923745, 1, 1, 1, 1, 1,
0.4717622, 1.624001, 0.4405023, 1, 1, 1, 1, 1,
0.4808123, 0.07927284, 0.1091597, 1, 1, 1, 1, 1,
0.4816639, 2.714051, 1.432467, 1, 1, 1, 1, 1,
0.4820115, 0.4272191, 0.8501391, 0, 0, 1, 1, 1,
0.4834863, -0.6262308, 1.788378, 1, 0, 0, 1, 1,
0.4841288, 1.78737, -1.262847, 1, 0, 0, 1, 1,
0.4883435, -0.9763315, 3.1215, 1, 0, 0, 1, 1,
0.489166, -0.8130128, 1.349939, 1, 0, 0, 1, 1,
0.4894085, -0.6872233, 3.405924, 1, 0, 0, 1, 1,
0.4902315, -1.85041, 1.887552, 0, 0, 0, 1, 1,
0.4949585, -0.3798367, 2.324529, 0, 0, 0, 1, 1,
0.4955647, 0.696895, -0.2404196, 0, 0, 0, 1, 1,
0.4962169, -0.4210607, 1.093685, 0, 0, 0, 1, 1,
0.4976362, 2.137432, -0.3668737, 0, 0, 0, 1, 1,
0.5062864, 0.9781234, 1.421065, 0, 0, 0, 1, 1,
0.5063832, 1.205469, 0.2895907, 0, 0, 0, 1, 1,
0.5074255, -0.567269, 1.312025, 1, 1, 1, 1, 1,
0.5083575, 0.3553135, 1.17356, 1, 1, 1, 1, 1,
0.5102473, 0.1978568, -0.9894542, 1, 1, 1, 1, 1,
0.5109696, 0.3896487, -0.5192655, 1, 1, 1, 1, 1,
0.5167304, 0.3634763, 1.146687, 1, 1, 1, 1, 1,
0.5196329, -1.534817, 4.47106, 1, 1, 1, 1, 1,
0.5223036, 0.7900202, -0.2363561, 1, 1, 1, 1, 1,
0.5267668, 0.1824947, 2.45168, 1, 1, 1, 1, 1,
0.5268623, -1.088571, 4.557585, 1, 1, 1, 1, 1,
0.532745, 0.2558238, -0.01108437, 1, 1, 1, 1, 1,
0.5328532, 2.615377, -1.791735, 1, 1, 1, 1, 1,
0.5363989, 0.552715, 0.3294806, 1, 1, 1, 1, 1,
0.5383814, -0.9301245, 3.702161, 1, 1, 1, 1, 1,
0.5403556, 0.1635606, 0.339035, 1, 1, 1, 1, 1,
0.5412523, 1.760077, -1.100253, 1, 1, 1, 1, 1,
0.5413693, 0.5810102, 1.024562, 0, 0, 1, 1, 1,
0.5447822, 0.4188811, 2.189773, 1, 0, 0, 1, 1,
0.5449879, 1.380053, -0.7394381, 1, 0, 0, 1, 1,
0.5470398, 0.7065681, 1.238559, 1, 0, 0, 1, 1,
0.5505385, -0.3773809, 2.690057, 1, 0, 0, 1, 1,
0.5518426, 0.3532059, 0.8447624, 1, 0, 0, 1, 1,
0.5577009, -1.244784, 2.783144, 0, 0, 0, 1, 1,
0.5578589, 0.332046, 0.9876227, 0, 0, 0, 1, 1,
0.5607563, -0.1647862, 1.920253, 0, 0, 0, 1, 1,
0.5627117, -0.8946523, 3.646662, 0, 0, 0, 1, 1,
0.5652531, 0.3805546, 1.883596, 0, 0, 0, 1, 1,
0.5721926, -0.471062, 2.426073, 0, 0, 0, 1, 1,
0.5776152, 1.988099, 1.129556, 0, 0, 0, 1, 1,
0.5797037, -0.357115, 0.5787893, 1, 1, 1, 1, 1,
0.5867433, -0.08436846, 1.850688, 1, 1, 1, 1, 1,
0.5868762, 0.2753092, 2.17886, 1, 1, 1, 1, 1,
0.5958422, 1.458085, -1.371503, 1, 1, 1, 1, 1,
0.5968161, -0.152757, 1.415083, 1, 1, 1, 1, 1,
0.5999274, -1.248946, 3.870943, 1, 1, 1, 1, 1,
0.6026013, -0.8600532, 4.824102, 1, 1, 1, 1, 1,
0.6029383, -1.289756, 2.868643, 1, 1, 1, 1, 1,
0.6055357, 1.472868, 0.3462106, 1, 1, 1, 1, 1,
0.6067785, -0.05054694, -0.2227009, 1, 1, 1, 1, 1,
0.6078413, 1.405599, 0.8043681, 1, 1, 1, 1, 1,
0.6172428, -0.7214239, 1.372437, 1, 1, 1, 1, 1,
0.6211868, 0.7693542, -1.582311, 1, 1, 1, 1, 1,
0.6318536, 0.8734584, 0.3071619, 1, 1, 1, 1, 1,
0.6346589, -0.6069781, 3.12229, 1, 1, 1, 1, 1,
0.6356617, -1.506844, 3.051749, 0, 0, 1, 1, 1,
0.6363779, -0.9707035, 1.722812, 1, 0, 0, 1, 1,
0.638712, -0.9801853, 3.018871, 1, 0, 0, 1, 1,
0.6401022, 0.2642886, 0.1740399, 1, 0, 0, 1, 1,
0.6415272, -0.3800431, 1.835971, 1, 0, 0, 1, 1,
0.6419276, 0.5815905, 1.69606, 1, 0, 0, 1, 1,
0.643617, 1.949399, -0.3817787, 0, 0, 0, 1, 1,
0.6445403, -0.5839601, 2.684521, 0, 0, 0, 1, 1,
0.6461263, -0.6157712, 3.800985, 0, 0, 0, 1, 1,
0.6469678, 2.396433, 1.743532, 0, 0, 0, 1, 1,
0.6503597, 0.02124921, 1.870182, 0, 0, 0, 1, 1,
0.6520802, 0.4462285, 1.90451, 0, 0, 0, 1, 1,
0.6570648, -0.1506364, 0.9556925, 0, 0, 0, 1, 1,
0.6639164, 0.954111, 2.338758, 1, 1, 1, 1, 1,
0.6675583, -0.6434167, 2.087477, 1, 1, 1, 1, 1,
0.6707501, 1.704278, -0.1783385, 1, 1, 1, 1, 1,
0.6739177, -1.221929, 1.903558, 1, 1, 1, 1, 1,
0.6754804, 0.8995742, 0.8322169, 1, 1, 1, 1, 1,
0.6804237, 1.213042, 0.7230566, 1, 1, 1, 1, 1,
0.6806011, 0.3059723, 1.341895, 1, 1, 1, 1, 1,
0.6919155, -0.3328316, 1.447128, 1, 1, 1, 1, 1,
0.6929559, -0.03181272, 2.632824, 1, 1, 1, 1, 1,
0.6945839, -0.08376889, 1.529672, 1, 1, 1, 1, 1,
0.6979972, -0.8801101, 4.494585, 1, 1, 1, 1, 1,
0.6980308, -1.896452, 3.53475, 1, 1, 1, 1, 1,
0.6985546, 0.1090282, 1.777586, 1, 1, 1, 1, 1,
0.6998997, -0.1030968, 4.039282, 1, 1, 1, 1, 1,
0.7001412, -0.03347144, 1.896025, 1, 1, 1, 1, 1,
0.702606, 0.03673883, 1.172698, 0, 0, 1, 1, 1,
0.7121776, -0.5743612, 2.032737, 1, 0, 0, 1, 1,
0.7124478, -0.3922804, 3.81044, 1, 0, 0, 1, 1,
0.7144745, -0.141604, 2.319458, 1, 0, 0, 1, 1,
0.7196012, 0.2807428, 1.396358, 1, 0, 0, 1, 1,
0.7209767, 1.305001, 1.309684, 1, 0, 0, 1, 1,
0.7261732, 1.030977, 1.066124, 0, 0, 0, 1, 1,
0.7372527, 2.217443, -0.9370212, 0, 0, 0, 1, 1,
0.7443967, -0.6028289, 2.326837, 0, 0, 0, 1, 1,
0.7461891, 0.5329697, 0.2025563, 0, 0, 0, 1, 1,
0.7550033, 1.465215, 1.143935, 0, 0, 0, 1, 1,
0.7567649, 1.117336, 1.043252, 0, 0, 0, 1, 1,
0.7619175, -1.151901, 2.099563, 0, 0, 0, 1, 1,
0.7648601, 1.658521, 1.056562, 1, 1, 1, 1, 1,
0.7705368, 0.2692923, -0.6193088, 1, 1, 1, 1, 1,
0.7727464, 0.5968375, 1.667556, 1, 1, 1, 1, 1,
0.7732162, 0.4762015, 0.1311626, 1, 1, 1, 1, 1,
0.7732236, -1.587382, 3.06375, 1, 1, 1, 1, 1,
0.7733458, 0.00843237, 4.258681, 1, 1, 1, 1, 1,
0.7749059, 1.135974, 0.5376955, 1, 1, 1, 1, 1,
0.7792474, 0.6458275, 0.526684, 1, 1, 1, 1, 1,
0.7808809, -0.2857513, 1.674806, 1, 1, 1, 1, 1,
0.7935886, 0.8476756, 1.53715, 1, 1, 1, 1, 1,
0.7960238, -1.150385, 3.286918, 1, 1, 1, 1, 1,
0.796828, 0.8340768, -0.8841712, 1, 1, 1, 1, 1,
0.8127517, -2.093284, 3.256017, 1, 1, 1, 1, 1,
0.8132754, -0.5008353, 4.178954, 1, 1, 1, 1, 1,
0.8133324, 0.4271969, 0.8211727, 1, 1, 1, 1, 1,
0.8165278, -0.5403067, 0.9453717, 0, 0, 1, 1, 1,
0.8167234, -0.4083983, 2.496058, 1, 0, 0, 1, 1,
0.8171329, -1.039171, 1.450452, 1, 0, 0, 1, 1,
0.8181868, 1.53487, 2.267028, 1, 0, 0, 1, 1,
0.819818, -0.4520927, 1.006591, 1, 0, 0, 1, 1,
0.8204011, 1.39109, -0.2416081, 1, 0, 0, 1, 1,
0.829032, -0.2754204, 1.00418, 0, 0, 0, 1, 1,
0.8300458, 0.2426296, 1.213718, 0, 0, 0, 1, 1,
0.831733, -0.5726447, 2.755124, 0, 0, 0, 1, 1,
0.835968, 1.969021, 0.794935, 0, 0, 0, 1, 1,
0.8410959, -1.6532, 3.786638, 0, 0, 0, 1, 1,
0.8446767, -0.5442295, 2.772043, 0, 0, 0, 1, 1,
0.8476731, -0.7717965, 1.26262, 0, 0, 0, 1, 1,
0.8480876, 0.1067626, 0.7170351, 1, 1, 1, 1, 1,
0.8497283, 1.005813, 1.123036, 1, 1, 1, 1, 1,
0.8504736, 0.7590572, 0.9286941, 1, 1, 1, 1, 1,
0.8524057, 0.9563011, 0.198638, 1, 1, 1, 1, 1,
0.8576305, -0.4165669, 2.571908, 1, 1, 1, 1, 1,
0.8667126, -1.225321, 2.001457, 1, 1, 1, 1, 1,
0.8748465, -0.6572878, 2.791666, 1, 1, 1, 1, 1,
0.8769661, 0.4474136, 0.5140681, 1, 1, 1, 1, 1,
0.8773124, -1.556551, 2.168238, 1, 1, 1, 1, 1,
0.8774143, 0.1756093, -0.09006643, 1, 1, 1, 1, 1,
0.8796372, -0.1389662, 0.9343817, 1, 1, 1, 1, 1,
0.8825768, 0.9936106, 1.160443, 1, 1, 1, 1, 1,
0.8832316, -0.2171829, 0.6275904, 1, 1, 1, 1, 1,
0.8875642, 1.565509, 0.9882475, 1, 1, 1, 1, 1,
0.8897394, -0.9949702, 3.723408, 1, 1, 1, 1, 1,
0.8924766, -1.804671, 2.915251, 0, 0, 1, 1, 1,
0.8933701, -0.2771702, 1.128767, 1, 0, 0, 1, 1,
0.9005052, 1.357074, 1.990537, 1, 0, 0, 1, 1,
0.9063358, 0.03379187, 4.334509, 1, 0, 0, 1, 1,
0.9116433, -0.5812881, 1.72121, 1, 0, 0, 1, 1,
0.911863, -0.7425278, 0.6443675, 1, 0, 0, 1, 1,
0.9139222, 0.8462996, 2.444875, 0, 0, 0, 1, 1,
0.9206582, -0.0241697, 3.263212, 0, 0, 0, 1, 1,
0.9331691, 1.585104, -0.9508482, 0, 0, 0, 1, 1,
0.9394102, -0.6447412, 3.230517, 0, 0, 0, 1, 1,
0.9416152, -0.7857168, 3.866772, 0, 0, 0, 1, 1,
0.9515312, 0.3838502, -0.06875855, 0, 0, 0, 1, 1,
0.9543999, 0.2255901, 0.742681, 0, 0, 0, 1, 1,
0.9612234, -0.9896887, 2.794875, 1, 1, 1, 1, 1,
0.9619026, -0.3046878, 3.129656, 1, 1, 1, 1, 1,
0.9682719, -0.3576131, 0.8858654, 1, 1, 1, 1, 1,
0.9725702, 0.9151714, 1.302457, 1, 1, 1, 1, 1,
0.9754212, -0.9819974, 2.582192, 1, 1, 1, 1, 1,
0.9789514, -0.9324479, 2.66042, 1, 1, 1, 1, 1,
0.9807637, 0.9063068, 0.08415206, 1, 1, 1, 1, 1,
0.9821658, -0.3089598, 1.686984, 1, 1, 1, 1, 1,
0.9927588, -0.1696524, 2.401159, 1, 1, 1, 1, 1,
0.9968812, -0.06019029, 1.544192, 1, 1, 1, 1, 1,
1.013603, 1.207481, 0.5509546, 1, 1, 1, 1, 1,
1.015003, -1.157927, 2.652413, 1, 1, 1, 1, 1,
1.017203, 1.170715, 0.8949729, 1, 1, 1, 1, 1,
1.025327, -0.9010982, 2.915869, 1, 1, 1, 1, 1,
1.026638, -0.4978378, 2.674072, 1, 1, 1, 1, 1,
1.0275, 0.09926421, 0.807639, 0, 0, 1, 1, 1,
1.031996, 0.2028798, 0.5954984, 1, 0, 0, 1, 1,
1.042382, -0.1225243, 2.743427, 1, 0, 0, 1, 1,
1.042562, -1.523154, 2.475191, 1, 0, 0, 1, 1,
1.047602, -0.5878007, 2.220812, 1, 0, 0, 1, 1,
1.050761, -0.1074774, 1.974897, 1, 0, 0, 1, 1,
1.053682, 0.4304227, 1.678915, 0, 0, 0, 1, 1,
1.06416, 1.213927, 0.4194792, 0, 0, 0, 1, 1,
1.064436, 0.003487608, 1.082454, 0, 0, 0, 1, 1,
1.067888, -0.8918583, 2.714869, 0, 0, 0, 1, 1,
1.067897, -0.03775106, 2.333204, 0, 0, 0, 1, 1,
1.069762, -0.7212234, 2.644993, 0, 0, 0, 1, 1,
1.073918, -1.555092, 4.116314, 0, 0, 0, 1, 1,
1.08955, -0.948738, 3.056816, 1, 1, 1, 1, 1,
1.095196, -0.8007363, 1.028808, 1, 1, 1, 1, 1,
1.102129, -1.146066, 3.025839, 1, 1, 1, 1, 1,
1.108133, -0.34294, 2.512668, 1, 1, 1, 1, 1,
1.114742, -0.4551634, 2.883497, 1, 1, 1, 1, 1,
1.11478, -1.928446, 3.927383, 1, 1, 1, 1, 1,
1.116631, 0.2020617, 1.613491, 1, 1, 1, 1, 1,
1.118062, -0.8995107, 2.098268, 1, 1, 1, 1, 1,
1.121191, 0.9324054, -0.09866422, 1, 1, 1, 1, 1,
1.126424, -0.4865517, 1.516917, 1, 1, 1, 1, 1,
1.127278, -2.09976, 3.88876, 1, 1, 1, 1, 1,
1.132005, -0.4962074, 3.649175, 1, 1, 1, 1, 1,
1.135512, -0.2471154, 1.129628, 1, 1, 1, 1, 1,
1.137098, -0.1671944, 1.93053, 1, 1, 1, 1, 1,
1.14611, 1.115499, 1.033474, 1, 1, 1, 1, 1,
1.161732, 0.9740266, 0.1797336, 0, 0, 1, 1, 1,
1.164505, -0.244042, 2.435582, 1, 0, 0, 1, 1,
1.166309, 0.5114319, 1.403764, 1, 0, 0, 1, 1,
1.171225, 0.1322955, 1.885341, 1, 0, 0, 1, 1,
1.172141, 0.7339955, 1.950459, 1, 0, 0, 1, 1,
1.17719, 0.8158264, 0.01718053, 1, 0, 0, 1, 1,
1.183095, -0.3353375, 0.8685616, 0, 0, 0, 1, 1,
1.183744, -1.366031, 3.153484, 0, 0, 0, 1, 1,
1.185132, -0.1744586, 1.533289, 0, 0, 0, 1, 1,
1.188969, 0.6449039, 0.5367082, 0, 0, 0, 1, 1,
1.193726, -0.2470236, 1.435491, 0, 0, 0, 1, 1,
1.198836, 0.1514471, 0.9422176, 0, 0, 0, 1, 1,
1.199832, -0.3767969, 3.248986, 0, 0, 0, 1, 1,
1.200969, -0.2184369, 0.4195423, 1, 1, 1, 1, 1,
1.210394, 1.598156, -0.1427985, 1, 1, 1, 1, 1,
1.21771, 0.1012178, 1.334173, 1, 1, 1, 1, 1,
1.21951, 0.8171116, 2.461424, 1, 1, 1, 1, 1,
1.235228, 0.9210877, 0.9237798, 1, 1, 1, 1, 1,
1.240305, 1.341401, 1.175921, 1, 1, 1, 1, 1,
1.242547, 0.4647201, 0.4537675, 1, 1, 1, 1, 1,
1.259057, -1.187449, 2.793751, 1, 1, 1, 1, 1,
1.267088, 1.899429, 0.3889613, 1, 1, 1, 1, 1,
1.270654, -0.4245019, 1.730523, 1, 1, 1, 1, 1,
1.28295, 0.9807837, 1.317448, 1, 1, 1, 1, 1,
1.288254, -1.021781, 3.042468, 1, 1, 1, 1, 1,
1.291538, 1.342753, -0.5206127, 1, 1, 1, 1, 1,
1.300783, -1.186496, 3.448095, 1, 1, 1, 1, 1,
1.302512, -0.4795977, 0.5829598, 1, 1, 1, 1, 1,
1.311047, 1.19427, 2.006771, 0, 0, 1, 1, 1,
1.312824, -0.4691258, 2.070068, 1, 0, 0, 1, 1,
1.315592, 0.5478855, 1.572213, 1, 0, 0, 1, 1,
1.318277, 0.8516425, -0.02796399, 1, 0, 0, 1, 1,
1.322051, 0.6254296, 1.210052, 1, 0, 0, 1, 1,
1.32768, 0.4914929, 2.328576, 1, 0, 0, 1, 1,
1.332086, 1.88235, 0.6210954, 0, 0, 0, 1, 1,
1.341555, -0.9157457, 0.5050722, 0, 0, 0, 1, 1,
1.34631, -0.6701742, 2.393909, 0, 0, 0, 1, 1,
1.350262, 0.6266926, 0.764088, 0, 0, 0, 1, 1,
1.364149, 2.021491, -0.2188012, 0, 0, 0, 1, 1,
1.372349, 0.8946941, 0.3658489, 0, 0, 0, 1, 1,
1.373719, -1.595733, 0.9621613, 0, 0, 0, 1, 1,
1.374854, -0.9818306, 0.8287942, 1, 1, 1, 1, 1,
1.390822, -2.462616, 1.043336, 1, 1, 1, 1, 1,
1.394094, -0.7158716, 2.810408, 1, 1, 1, 1, 1,
1.399315, -0.3650545, 1.347641, 1, 1, 1, 1, 1,
1.409553, 0.6308132, 0.1598275, 1, 1, 1, 1, 1,
1.411911, 0.6855251, 1.662301, 1, 1, 1, 1, 1,
1.414513, 1.126515, 1.166282, 1, 1, 1, 1, 1,
1.417636, 0.2466214, 1.963129, 1, 1, 1, 1, 1,
1.418101, -0.7352114, 2.531305, 1, 1, 1, 1, 1,
1.427765, 0.138319, 3.184804, 1, 1, 1, 1, 1,
1.438695, 0.8889104, -0.1535132, 1, 1, 1, 1, 1,
1.444041, -0.2871318, 1.276703, 1, 1, 1, 1, 1,
1.467929, 0.2628863, 2.437768, 1, 1, 1, 1, 1,
1.470092, 1.585056, 0.9432669, 1, 1, 1, 1, 1,
1.471957, 0.136514, 0.9065005, 1, 1, 1, 1, 1,
1.479931, -0.3325669, 2.222706, 0, 0, 1, 1, 1,
1.481214, 0.5283945, 1.272172, 1, 0, 0, 1, 1,
1.485029, -0.6181248, 2.75448, 1, 0, 0, 1, 1,
1.48531, 0.8423417, 1.805231, 1, 0, 0, 1, 1,
1.487754, -1.158673, 1.377666, 1, 0, 0, 1, 1,
1.494013, -2.81785, 4.258072, 1, 0, 0, 1, 1,
1.498836, 2.103101, 0.2219518, 0, 0, 0, 1, 1,
1.504062, -0.3012652, 2.16169, 0, 0, 0, 1, 1,
1.50954, -1.387796, 3.278929, 0, 0, 0, 1, 1,
1.513136, -0.777207, 1.313303, 0, 0, 0, 1, 1,
1.517086, -2.732166, 2.413005, 0, 0, 0, 1, 1,
1.521858, 1.863206, 1.914627, 0, 0, 0, 1, 1,
1.530844, -0.1397182, 1.695982, 0, 0, 0, 1, 1,
1.532243, -1.120559, 0.9975862, 1, 1, 1, 1, 1,
1.532321, -2.741208, 2.469576, 1, 1, 1, 1, 1,
1.533651, 1.10263, 0.5429528, 1, 1, 1, 1, 1,
1.536417, -1.126117, 3.067892, 1, 1, 1, 1, 1,
1.543515, -1.103865, 1.209836, 1, 1, 1, 1, 1,
1.544264, -0.4490757, 2.332489, 1, 1, 1, 1, 1,
1.567271, 0.293729, 1.333918, 1, 1, 1, 1, 1,
1.568231, -0.3160376, 2.85836, 1, 1, 1, 1, 1,
1.572122, -0.1106197, 0.7573286, 1, 1, 1, 1, 1,
1.579043, 2.54023, 1.670306, 1, 1, 1, 1, 1,
1.591259, -0.3766056, 1.774373, 1, 1, 1, 1, 1,
1.596988, -0.194165, 0.2305126, 1, 1, 1, 1, 1,
1.598508, 0.3203469, 2.153805, 1, 1, 1, 1, 1,
1.600881, 0.4497937, 0.7071338, 1, 1, 1, 1, 1,
1.626529, -0.5271649, 3.388038, 1, 1, 1, 1, 1,
1.647361, 0.2691536, 2.304437, 0, 0, 1, 1, 1,
1.670156, -0.6664464, 1.999792, 1, 0, 0, 1, 1,
1.674978, -0.12445, 1.160675, 1, 0, 0, 1, 1,
1.684362, 1.179813, 0.6732805, 1, 0, 0, 1, 1,
1.685956, -0.7530431, 1.703181, 1, 0, 0, 1, 1,
1.688439, -0.6070706, 0.9644703, 1, 0, 0, 1, 1,
1.691797, -1.688623, 1.449368, 0, 0, 0, 1, 1,
1.70411, -1.059146, 1.976794, 0, 0, 0, 1, 1,
1.704394, 0.9697772, 1.907294, 0, 0, 0, 1, 1,
1.704983, -0.6009933, 2.025653, 0, 0, 0, 1, 1,
1.712756, 1.305449, 0.9463331, 0, 0, 0, 1, 1,
1.732017, 1.345034, 1.32953, 0, 0, 0, 1, 1,
1.743466, -0.2940229, 2.837985, 0, 0, 0, 1, 1,
1.756039, -0.5582455, 3.027609, 1, 1, 1, 1, 1,
1.785976, 0.7010892, 0.3247713, 1, 1, 1, 1, 1,
1.788818, -0.3598183, 1.875344, 1, 1, 1, 1, 1,
1.819784, -1.498012, 1.615485, 1, 1, 1, 1, 1,
1.827634, -0.6884426, 1.998065, 1, 1, 1, 1, 1,
1.873634, -0.8588974, 1.307626, 1, 1, 1, 1, 1,
1.882572, 0.01478301, 1.705101, 1, 1, 1, 1, 1,
1.889426, -0.2420275, 1.679058, 1, 1, 1, 1, 1,
1.896071, 0.5086387, 1.178692, 1, 1, 1, 1, 1,
1.903167, 0.3658007, 2.404215, 1, 1, 1, 1, 1,
1.903285, 0.7693131, 0.1561233, 1, 1, 1, 1, 1,
1.920084, -1.873551, 1.660418, 1, 1, 1, 1, 1,
1.920969, 0.743793, 1.544871, 1, 1, 1, 1, 1,
1.926049, 1.316508, 1.368982, 1, 1, 1, 1, 1,
1.950077, 0.886192, 0.3949797, 1, 1, 1, 1, 1,
2.005233, -0.08479199, 0.5235475, 0, 0, 1, 1, 1,
2.074196, -0.9387311, 2.952626, 1, 0, 0, 1, 1,
2.07607, -1.414826, 2.656494, 1, 0, 0, 1, 1,
2.089469, -0.3993479, 1.809461, 1, 0, 0, 1, 1,
2.092498, -0.4933824, 3.5878, 1, 0, 0, 1, 1,
2.100338, -0.04324428, 0.00849506, 1, 0, 0, 1, 1,
2.107985, -0.05494856, 1.252704, 0, 0, 0, 1, 1,
2.169135, -1.244772, 2.218944, 0, 0, 0, 1, 1,
2.221867, -1.315047, 3.597454, 0, 0, 0, 1, 1,
2.262776, -1.050591, 2.053837, 0, 0, 0, 1, 1,
2.265834, -0.1956079, 2.611101, 0, 0, 0, 1, 1,
2.35257, -1.49577, 3.424044, 0, 0, 0, 1, 1,
2.389507, -0.9916152, 1.842668, 0, 0, 0, 1, 1,
2.405747, 1.472005, 0.02487411, 1, 1, 1, 1, 1,
2.504243, -0.03571843, 3.089545, 1, 1, 1, 1, 1,
2.624477, 1.151395, -0.0316472, 1, 1, 1, 1, 1,
2.682029, 1.821569, 0.07560018, 1, 1, 1, 1, 1,
3.153402, -1.186473, 3.278973, 1, 1, 1, 1, 1,
3.299104, -1.19316, 3.350087, 1, 1, 1, 1, 1,
3.452195, -0.4570282, 3.203924, 1, 1, 1, 1, 1
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
var radius = 9.530387;
var distance = 33.47508;
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
mvMatrix.translate( -0.1926727, -0.04544878, 0.2310925 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47508);
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
