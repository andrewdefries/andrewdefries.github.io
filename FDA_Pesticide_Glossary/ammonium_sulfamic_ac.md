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
-3.576466, -0.8230856, -3.564928, 1, 0, 0, 1,
-2.861365, 0.5741022, -1.154, 1, 0.007843138, 0, 1,
-2.781965, 0.6842532, -1.427306, 1, 0.01176471, 0, 1,
-2.72412, 0.3926097, -1.02628, 1, 0.01960784, 0, 1,
-2.602831, -0.4042034, -3.592424, 1, 0.02352941, 0, 1,
-2.55624, 0.4546267, -0.4939328, 1, 0.03137255, 0, 1,
-2.497531, -1.478084, -1.384653, 1, 0.03529412, 0, 1,
-2.34132, 0.06508438, -0.8705718, 1, 0.04313726, 0, 1,
-2.320764, -0.4334267, -0.8721434, 1, 0.04705882, 0, 1,
-2.293512, -0.5197513, -1.302345, 1, 0.05490196, 0, 1,
-2.235249, -0.2614073, -0.2041222, 1, 0.05882353, 0, 1,
-2.228034, 1.450402, -1.189658, 1, 0.06666667, 0, 1,
-2.218083, -0.5017797, -0.4307043, 1, 0.07058824, 0, 1,
-2.162979, -0.667214, -1.823701, 1, 0.07843138, 0, 1,
-2.155349, 0.6704032, -1.633199, 1, 0.08235294, 0, 1,
-2.149037, 1.277143, -1.8102, 1, 0.09019608, 0, 1,
-2.068173, 0.4574459, -0.8028401, 1, 0.09411765, 0, 1,
-2.067454, -1.345419, -1.982248, 1, 0.1019608, 0, 1,
-2.033135, -1.792782, -1.512283, 1, 0.1098039, 0, 1,
-1.990284, -0.3820162, -0.9723152, 1, 0.1137255, 0, 1,
-1.974266, -1.439639, -2.265787, 1, 0.1215686, 0, 1,
-1.96525, 0.9747654, -0.145687, 1, 0.1254902, 0, 1,
-1.9646, 1.271064, -0.5951648, 1, 0.1333333, 0, 1,
-1.918288, -0.1139632, -1.416195, 1, 0.1372549, 0, 1,
-1.913049, 0.8471324, 0.1598115, 1, 0.145098, 0, 1,
-1.872533, -0.8668149, -2.567071, 1, 0.1490196, 0, 1,
-1.848423, -0.7148409, -1.562632, 1, 0.1568628, 0, 1,
-1.84453, -0.2611915, -2.164718, 1, 0.1607843, 0, 1,
-1.841641, 0.8070013, 0.6451841, 1, 0.1686275, 0, 1,
-1.835161, -1.000283, -1.272666, 1, 0.172549, 0, 1,
-1.82112, -0.2098577, -1.779588, 1, 0.1803922, 0, 1,
-1.805341, -0.04118473, -0.7668293, 1, 0.1843137, 0, 1,
-1.791029, -2.056366, -2.956089, 1, 0.1921569, 0, 1,
-1.778564, -1.737445, -4.713627, 1, 0.1960784, 0, 1,
-1.773498, -1.769114, -4.105012, 1, 0.2039216, 0, 1,
-1.770124, 0.464897, -2.767587, 1, 0.2117647, 0, 1,
-1.763917, -0.9585876, -2.016608, 1, 0.2156863, 0, 1,
-1.721942, -1.479882, -1.778861, 1, 0.2235294, 0, 1,
-1.701152, -0.981286, -1.673316, 1, 0.227451, 0, 1,
-1.690169, 0.3194179, -0.1282876, 1, 0.2352941, 0, 1,
-1.684586, 0.2186963, -0.2372293, 1, 0.2392157, 0, 1,
-1.672408, -0.1260965, -3.192666, 1, 0.2470588, 0, 1,
-1.671811, 1.199342, -2.97607, 1, 0.2509804, 0, 1,
-1.668086, 0.798079, -1.294715, 1, 0.2588235, 0, 1,
-1.662054, 0.9894799, -0.5094807, 1, 0.2627451, 0, 1,
-1.661455, -0.1661541, -1.881298, 1, 0.2705882, 0, 1,
-1.649495, -0.7566507, -1.657167, 1, 0.2745098, 0, 1,
-1.649259, 0.7987535, -1.63808, 1, 0.282353, 0, 1,
-1.640597, 0.6650811, -0.6605852, 1, 0.2862745, 0, 1,
-1.637615, 0.1200337, -0.9421015, 1, 0.2941177, 0, 1,
-1.593728, -0.4830574, -1.098557, 1, 0.3019608, 0, 1,
-1.580647, -1.762175, 0.006446146, 1, 0.3058824, 0, 1,
-1.578815, 0.5724009, -2.047668, 1, 0.3137255, 0, 1,
-1.5765, -0.7716811, -2.643739, 1, 0.3176471, 0, 1,
-1.57275, -1.363068, -2.500263, 1, 0.3254902, 0, 1,
-1.553518, -0.7697625, -1.316029, 1, 0.3294118, 0, 1,
-1.552105, 2.137367, -0.6077461, 1, 0.3372549, 0, 1,
-1.550058, 0.3172119, -1.446334, 1, 0.3411765, 0, 1,
-1.541066, 0.1704239, -1.559213, 1, 0.3490196, 0, 1,
-1.525764, 0.1743775, -1.223185, 1, 0.3529412, 0, 1,
-1.516141, -1.628792, -1.842408, 1, 0.3607843, 0, 1,
-1.515101, -1.738086, -2.082569, 1, 0.3647059, 0, 1,
-1.504354, 1.32434, -0.3334325, 1, 0.372549, 0, 1,
-1.501961, 0.650719, -1.68267, 1, 0.3764706, 0, 1,
-1.495398, -1.007396, -2.687297, 1, 0.3843137, 0, 1,
-1.493395, 2.764985, -0.3986069, 1, 0.3882353, 0, 1,
-1.485484, 0.1416681, -0.4462016, 1, 0.3960784, 0, 1,
-1.484183, 0.348186, -0.7522, 1, 0.4039216, 0, 1,
-1.466131, 1.679775, 0.9730896, 1, 0.4078431, 0, 1,
-1.465137, -1.075063, -2.133075, 1, 0.4156863, 0, 1,
-1.442625, -1.283358, -3.371441, 1, 0.4196078, 0, 1,
-1.439788, -1.143997, 0.05538439, 1, 0.427451, 0, 1,
-1.432921, 1.865047, 0.3316673, 1, 0.4313726, 0, 1,
-1.430456, 0.8149094, -2.707812, 1, 0.4392157, 0, 1,
-1.423772, -0.7642899, -3.281491, 1, 0.4431373, 0, 1,
-1.423276, 1.029021, -1.959125, 1, 0.4509804, 0, 1,
-1.409696, 0.8901142, -0.9807976, 1, 0.454902, 0, 1,
-1.405087, -0.06071352, -2.426628, 1, 0.4627451, 0, 1,
-1.404673, 0.09997431, -0.532612, 1, 0.4666667, 0, 1,
-1.401013, -0.2774918, -2.745032, 1, 0.4745098, 0, 1,
-1.395765, 0.9829797, -0.5988766, 1, 0.4784314, 0, 1,
-1.390416, -1.710112, -2.428351, 1, 0.4862745, 0, 1,
-1.36573, 0.4167829, -1.6931, 1, 0.4901961, 0, 1,
-1.358656, 0.9102781, -0.5281734, 1, 0.4980392, 0, 1,
-1.353154, 0.2344973, 0.5694538, 1, 0.5058824, 0, 1,
-1.350888, -1.471201, -3.909345, 1, 0.509804, 0, 1,
-1.328269, 0.6696661, -1.305895, 1, 0.5176471, 0, 1,
-1.3258, 0.2947837, -1.11762, 1, 0.5215687, 0, 1,
-1.32092, -0.3404996, -4.354281, 1, 0.5294118, 0, 1,
-1.304586, -0.192069, 0.094294, 1, 0.5333334, 0, 1,
-1.293059, 0.1133465, -1.38705, 1, 0.5411765, 0, 1,
-1.280898, 0.5242046, -1.232065, 1, 0.5450981, 0, 1,
-1.280332, 1.851735, -0.1658661, 1, 0.5529412, 0, 1,
-1.279644, -0.3848922, -1.595788, 1, 0.5568628, 0, 1,
-1.275375, 0.08967713, -2.700917, 1, 0.5647059, 0, 1,
-1.257735, -1.711988, -3.175114, 1, 0.5686275, 0, 1,
-1.254798, 0.4459819, -2.608773, 1, 0.5764706, 0, 1,
-1.253219, 1.42518, -0.6163674, 1, 0.5803922, 0, 1,
-1.25048, -0.1882885, -2.192277, 1, 0.5882353, 0, 1,
-1.248879, -0.04822538, -0.08167334, 1, 0.5921569, 0, 1,
-1.245259, -0.02024909, -0.999366, 1, 0.6, 0, 1,
-1.243918, -0.8497495, -1.490944, 1, 0.6078432, 0, 1,
-1.240995, -0.7890095, -1.660264, 1, 0.6117647, 0, 1,
-1.236252, -1.360383, -2.614729, 1, 0.6196079, 0, 1,
-1.233674, -0.06043539, -1.293989, 1, 0.6235294, 0, 1,
-1.223753, 0.75004, -1.721715, 1, 0.6313726, 0, 1,
-1.223289, -0.1579503, -2.648957, 1, 0.6352941, 0, 1,
-1.222558, -0.2478431, -0.9898397, 1, 0.6431373, 0, 1,
-1.214034, -0.4162883, -3.207699, 1, 0.6470588, 0, 1,
-1.207592, -0.1637115, -0.7423424, 1, 0.654902, 0, 1,
-1.204631, -0.6118495, -1.980018, 1, 0.6588235, 0, 1,
-1.196328, 0.4788557, -1.208515, 1, 0.6666667, 0, 1,
-1.194092, 1.372249, -0.8336362, 1, 0.6705883, 0, 1,
-1.193396, -0.06001299, -1.7144, 1, 0.6784314, 0, 1,
-1.181225, -1.270047, -1.395556, 1, 0.682353, 0, 1,
-1.178597, -0.2271995, -2.225184, 1, 0.6901961, 0, 1,
-1.178325, -0.8001018, -2.690035, 1, 0.6941177, 0, 1,
-1.174605, -0.5297291, -1.706492, 1, 0.7019608, 0, 1,
-1.1729, -0.1032872, -2.844382, 1, 0.7098039, 0, 1,
-1.156345, -0.451591, -3.217253, 1, 0.7137255, 0, 1,
-1.153, 0.6235313, 0.1693325, 1, 0.7215686, 0, 1,
-1.152551, 0.8918379, -3.16151, 1, 0.7254902, 0, 1,
-1.151787, 1.564292, -1.921522, 1, 0.7333333, 0, 1,
-1.144957, 1.374139, -0.403423, 1, 0.7372549, 0, 1,
-1.143732, -0.390237, -1.399762, 1, 0.7450981, 0, 1,
-1.14027, 1.058868, -0.2375581, 1, 0.7490196, 0, 1,
-1.137947, 0.5173796, -0.2344108, 1, 0.7568628, 0, 1,
-1.132466, -1.811787, -2.75766, 1, 0.7607843, 0, 1,
-1.125576, -0.3800628, -2.470577, 1, 0.7686275, 0, 1,
-1.115214, 0.2736561, -1.351965, 1, 0.772549, 0, 1,
-1.112745, 0.6150301, -1.551337, 1, 0.7803922, 0, 1,
-1.110232, -1.125293, -3.107687, 1, 0.7843137, 0, 1,
-1.109487, 0.369085, -0.7976541, 1, 0.7921569, 0, 1,
-1.10781, 0.4270225, -0.8390819, 1, 0.7960784, 0, 1,
-1.105695, 1.158077, -2.015735, 1, 0.8039216, 0, 1,
-1.10547, 0.1073436, -3.932265, 1, 0.8117647, 0, 1,
-1.104152, -0.6216924, -3.747749, 1, 0.8156863, 0, 1,
-1.103996, -0.1892109, -1.405706, 1, 0.8235294, 0, 1,
-1.100346, 0.4649467, -3.322044, 1, 0.827451, 0, 1,
-1.098059, 0.6523357, -1.569916, 1, 0.8352941, 0, 1,
-1.097687, 1.013567, -1.033326, 1, 0.8392157, 0, 1,
-1.095742, 1.395397, -1.185167, 1, 0.8470588, 0, 1,
-1.085397, -1.28417, -2.139655, 1, 0.8509804, 0, 1,
-1.081728, 0.7058504, -0.2423686, 1, 0.8588235, 0, 1,
-1.079147, 1.436485, -0.180277, 1, 0.8627451, 0, 1,
-1.078346, 0.7399966, -1.450148, 1, 0.8705882, 0, 1,
-1.073377, -0.4647274, -2.794712, 1, 0.8745098, 0, 1,
-1.069975, 0.6007882, -0.7031973, 1, 0.8823529, 0, 1,
-1.066239, 0.8667454, -0.5435455, 1, 0.8862745, 0, 1,
-1.063517, 0.7306556, -1.43831, 1, 0.8941177, 0, 1,
-1.062755, 2.467671, 1.378889, 1, 0.8980392, 0, 1,
-1.052492, -0.8172873, -2.147846, 1, 0.9058824, 0, 1,
-1.050034, -2.016536, -1.486639, 1, 0.9137255, 0, 1,
-1.04132, -0.5565324, -2.476532, 1, 0.9176471, 0, 1,
-1.024967, -0.6755478, -2.272299, 1, 0.9254902, 0, 1,
-1.021661, -0.554854, -1.095965, 1, 0.9294118, 0, 1,
-1.013621, -1.341618, -1.716783, 1, 0.9372549, 0, 1,
-1.007359, -0.7854255, -1.640211, 1, 0.9411765, 0, 1,
-1.007164, -0.7522699, -0.8228877, 1, 0.9490196, 0, 1,
-1.004068, 0.4118221, -1.680033, 1, 0.9529412, 0, 1,
-0.9988158, -0.09090818, -0.2646225, 1, 0.9607843, 0, 1,
-0.9986769, -0.597207, -1.179447, 1, 0.9647059, 0, 1,
-0.9983512, -0.65452, -2.471449, 1, 0.972549, 0, 1,
-0.9965224, 1.148294, 1.042868, 1, 0.9764706, 0, 1,
-0.99457, 0.02440311, -2.189224, 1, 0.9843137, 0, 1,
-0.9923891, 0.130074, -1.838692, 1, 0.9882353, 0, 1,
-0.9848644, -0.827506, -3.082778, 1, 0.9960784, 0, 1,
-0.9844037, 0.8982246, -1.680084, 0.9960784, 1, 0, 1,
-0.9812526, 0.1969083, 1.017418, 0.9921569, 1, 0, 1,
-0.9751399, -1.193489, -2.002994, 0.9843137, 1, 0, 1,
-0.9735394, -0.3864992, -2.988632, 0.9803922, 1, 0, 1,
-0.9732839, 0.1213179, -2.06198, 0.972549, 1, 0, 1,
-0.9605714, -0.8803242, -2.223088, 0.9686275, 1, 0, 1,
-0.9586182, 0.1656467, -1.310179, 0.9607843, 1, 0, 1,
-0.9555563, 0.7577122, -0.3627184, 0.9568627, 1, 0, 1,
-0.9552295, 0.1764094, 0.3474745, 0.9490196, 1, 0, 1,
-0.9546598, -0.652427, -3.906172, 0.945098, 1, 0, 1,
-0.9525475, -2.044412, -3.319805, 0.9372549, 1, 0, 1,
-0.9480217, -0.2355997, -2.416781, 0.9333333, 1, 0, 1,
-0.9473286, -0.8227553, 0.02872713, 0.9254902, 1, 0, 1,
-0.9410671, 0.948984, -2.085975, 0.9215686, 1, 0, 1,
-0.9390392, 0.830493, -3.39504, 0.9137255, 1, 0, 1,
-0.9372032, -0.481508, -1.540241, 0.9098039, 1, 0, 1,
-0.9310338, 0.2612901, -2.090017, 0.9019608, 1, 0, 1,
-0.930771, 1.82489, -1.44506, 0.8941177, 1, 0, 1,
-0.9285525, -0.7987171, -3.596586, 0.8901961, 1, 0, 1,
-0.9230279, 0.485725, -1.32555, 0.8823529, 1, 0, 1,
-0.9208034, -0.3982471, -4.104958, 0.8784314, 1, 0, 1,
-0.9156876, 1.479129, -0.109626, 0.8705882, 1, 0, 1,
-0.8924605, -1.018422, -2.616237, 0.8666667, 1, 0, 1,
-0.8821113, 2.02154, -2.184466, 0.8588235, 1, 0, 1,
-0.8803388, 0.2503893, -2.900783, 0.854902, 1, 0, 1,
-0.8790594, 1.978186, 1.265258, 0.8470588, 1, 0, 1,
-0.8776413, -0.9732406, -2.299002, 0.8431373, 1, 0, 1,
-0.868643, 0.1245254, -2.1682, 0.8352941, 1, 0, 1,
-0.8642621, 0.1511124, -1.33255, 0.8313726, 1, 0, 1,
-0.8624947, 1.304981, -1.748441, 0.8235294, 1, 0, 1,
-0.8581055, 0.009732009, -3.984363, 0.8196079, 1, 0, 1,
-0.8504375, 0.1364971, -1.399406, 0.8117647, 1, 0, 1,
-0.8503793, 0.541632, -1.003938, 0.8078431, 1, 0, 1,
-0.8501651, 0.4179724, -0.5111479, 0.8, 1, 0, 1,
-0.8481383, 0.5083556, -0.09162441, 0.7921569, 1, 0, 1,
-0.8475149, 1.387248, -0.2353114, 0.7882353, 1, 0, 1,
-0.8431151, 0.3166195, -1.40374, 0.7803922, 1, 0, 1,
-0.8419769, 1.015636, -1.685872, 0.7764706, 1, 0, 1,
-0.8412762, -0.5993686, -2.678632, 0.7686275, 1, 0, 1,
-0.8398759, -0.6129221, -1.990056, 0.7647059, 1, 0, 1,
-0.8294336, 0.7673755, -1.230222, 0.7568628, 1, 0, 1,
-0.8272978, 1.1519, -0.1575265, 0.7529412, 1, 0, 1,
-0.8260384, -0.2971753, -1.208199, 0.7450981, 1, 0, 1,
-0.8193008, -0.04068717, -3.102573, 0.7411765, 1, 0, 1,
-0.8163033, 1.141638, 0.728181, 0.7333333, 1, 0, 1,
-0.8158938, -0.9009239, -1.745509, 0.7294118, 1, 0, 1,
-0.8147935, -1.987517, -2.953926, 0.7215686, 1, 0, 1,
-0.8068743, -0.8906708, -1.877499, 0.7176471, 1, 0, 1,
-0.8019657, -1.694967, -1.391269, 0.7098039, 1, 0, 1,
-0.8009527, -0.1127072, -2.000005, 0.7058824, 1, 0, 1,
-0.7977958, 0.5987601, -1.863534, 0.6980392, 1, 0, 1,
-0.7965155, -0.09371777, -1.12258, 0.6901961, 1, 0, 1,
-0.7963043, 0.2112455, -0.9159222, 0.6862745, 1, 0, 1,
-0.7958065, -1.68339, -2.928429, 0.6784314, 1, 0, 1,
-0.7953938, -0.01886021, 1.460191, 0.6745098, 1, 0, 1,
-0.7946158, -1.343338, -2.049595, 0.6666667, 1, 0, 1,
-0.7942458, 0.7054265, -0.8734244, 0.6627451, 1, 0, 1,
-0.7910699, 0.8927588, -1.793075, 0.654902, 1, 0, 1,
-0.7898771, -0.03479011, -2.295748, 0.6509804, 1, 0, 1,
-0.7884361, -0.6452572, -1.094338, 0.6431373, 1, 0, 1,
-0.7857034, 1.185467, -0.7095991, 0.6392157, 1, 0, 1,
-0.7855198, -0.9420016, -3.684702, 0.6313726, 1, 0, 1,
-0.7783831, 1.092711, -2.460745, 0.627451, 1, 0, 1,
-0.7760597, 1.192866, 0.7179042, 0.6196079, 1, 0, 1,
-0.7711112, -1.003201, -3.292025, 0.6156863, 1, 0, 1,
-0.7707254, 0.2733561, -2.893344, 0.6078432, 1, 0, 1,
-0.7690516, -0.4077951, -1.162682, 0.6039216, 1, 0, 1,
-0.768126, -0.09532678, -1.161902, 0.5960785, 1, 0, 1,
-0.767289, 1.148705, -0.5888437, 0.5882353, 1, 0, 1,
-0.7661378, 1.253304, 0.3766706, 0.5843138, 1, 0, 1,
-0.765982, -0.1512459, -1.740657, 0.5764706, 1, 0, 1,
-0.7643827, -0.7712128, -0.4189696, 0.572549, 1, 0, 1,
-0.764114, -0.9479409, -2.457107, 0.5647059, 1, 0, 1,
-0.7602585, -0.3530199, -2.769953, 0.5607843, 1, 0, 1,
-0.75439, -0.8929397, -3.322328, 0.5529412, 1, 0, 1,
-0.7519369, 0.8805942, -1.678568, 0.5490196, 1, 0, 1,
-0.7462895, 0.714552, -0.5803317, 0.5411765, 1, 0, 1,
-0.7451708, -1.073639, -0.6216565, 0.5372549, 1, 0, 1,
-0.7427282, -0.3887278, -2.191566, 0.5294118, 1, 0, 1,
-0.7356202, -1.346238, -2.388783, 0.5254902, 1, 0, 1,
-0.735245, 2.164371, -0.5268852, 0.5176471, 1, 0, 1,
-0.7348834, 0.3660775, 0.8438091, 0.5137255, 1, 0, 1,
-0.7338868, 0.8164915, 0.1068201, 0.5058824, 1, 0, 1,
-0.7328106, 0.1705773, -0.4307409, 0.5019608, 1, 0, 1,
-0.7272725, -1.207754, -2.976709, 0.4941176, 1, 0, 1,
-0.7246432, -0.2377179, -2.118913, 0.4862745, 1, 0, 1,
-0.7187662, 0.0651399, 0.1511144, 0.4823529, 1, 0, 1,
-0.7149451, -0.6133581, -2.716294, 0.4745098, 1, 0, 1,
-0.7127888, -0.5395555, -2.21456, 0.4705882, 1, 0, 1,
-0.7109343, 0.394571, -3.837248, 0.4627451, 1, 0, 1,
-0.7032265, 1.480445, -0.3618948, 0.4588235, 1, 0, 1,
-0.7031249, 0.2182263, -1.717183, 0.4509804, 1, 0, 1,
-0.6918411, 1.466871, 0.4543097, 0.4470588, 1, 0, 1,
-0.6916803, -0.100816, -0.137961, 0.4392157, 1, 0, 1,
-0.6911159, 0.6343319, 0.3413854, 0.4352941, 1, 0, 1,
-0.6893465, -0.9046953, -2.882537, 0.427451, 1, 0, 1,
-0.6877338, 0.2196419, -1.134311, 0.4235294, 1, 0, 1,
-0.6866311, 0.1490966, -1.401342, 0.4156863, 1, 0, 1,
-0.6794181, 0.2614795, -2.848259, 0.4117647, 1, 0, 1,
-0.6783553, 0.003440861, -1.42927, 0.4039216, 1, 0, 1,
-0.6750715, -0.3595911, -0.5357744, 0.3960784, 1, 0, 1,
-0.6736316, -0.3261484, -2.758398, 0.3921569, 1, 0, 1,
-0.6705111, -0.5132609, -1.319387, 0.3843137, 1, 0, 1,
-0.6634619, 0.5515911, 1.343854, 0.3803922, 1, 0, 1,
-0.6601687, -0.6321865, -2.979656, 0.372549, 1, 0, 1,
-0.6491335, -0.1573336, -0.5611139, 0.3686275, 1, 0, 1,
-0.6466544, -0.0353007, -1.186876, 0.3607843, 1, 0, 1,
-0.6454449, -0.7990927, -1.165323, 0.3568628, 1, 0, 1,
-0.644261, -0.465015, -1.618879, 0.3490196, 1, 0, 1,
-0.6415182, -0.2604068, -2.989797, 0.345098, 1, 0, 1,
-0.6387615, -0.9517472, -2.971191, 0.3372549, 1, 0, 1,
-0.6360098, 0.2078933, -2.247259, 0.3333333, 1, 0, 1,
-0.6311103, -0.9453297, -2.482334, 0.3254902, 1, 0, 1,
-0.6283821, -0.8008961, -2.354775, 0.3215686, 1, 0, 1,
-0.6268911, 1.414233, -0.6296535, 0.3137255, 1, 0, 1,
-0.6255985, 0.04950016, -3.201522, 0.3098039, 1, 0, 1,
-0.6212158, 0.3225641, -1.690995, 0.3019608, 1, 0, 1,
-0.6187634, 0.7675316, -1.085118, 0.2941177, 1, 0, 1,
-0.6151417, 0.8463048, -0.8211342, 0.2901961, 1, 0, 1,
-0.6121198, -0.7344298, -1.724253, 0.282353, 1, 0, 1,
-0.6116585, 0.1107358, -1.695408, 0.2784314, 1, 0, 1,
-0.6110652, -1.088865, -1.92204, 0.2705882, 1, 0, 1,
-0.6075422, -0.5144392, -1.607468, 0.2666667, 1, 0, 1,
-0.6075009, 1.294612, 0.2486219, 0.2588235, 1, 0, 1,
-0.6055495, 0.6500641, -1.238358, 0.254902, 1, 0, 1,
-0.6053705, -2.519847, -2.397298, 0.2470588, 1, 0, 1,
-0.6052518, 2.464042, -0.8472583, 0.2431373, 1, 0, 1,
-0.6049916, 0.1668448, -1.437535, 0.2352941, 1, 0, 1,
-0.604453, 0.3608411, -0.2413895, 0.2313726, 1, 0, 1,
-0.6033626, 1.039704, 0.8425325, 0.2235294, 1, 0, 1,
-0.6019509, 2.117847, -1.878545, 0.2196078, 1, 0, 1,
-0.6018913, -1.03132, -4.515866, 0.2117647, 1, 0, 1,
-0.5952052, -0.4977033, -1.716603, 0.2078431, 1, 0, 1,
-0.5941426, 1.096067, -1.14324, 0.2, 1, 0, 1,
-0.5899152, 1.276454, -1.031913, 0.1921569, 1, 0, 1,
-0.5892047, -0.8716639, -2.454327, 0.1882353, 1, 0, 1,
-0.5874643, 0.6162614, 1.239815, 0.1803922, 1, 0, 1,
-0.5844012, -1.583949, -2.289936, 0.1764706, 1, 0, 1,
-0.5837522, -0.315372, -2.12758, 0.1686275, 1, 0, 1,
-0.5824704, -1.490868, -2.912693, 0.1647059, 1, 0, 1,
-0.5801739, 1.379495, -0.526143, 0.1568628, 1, 0, 1,
-0.5798337, -1.573635, -2.406392, 0.1529412, 1, 0, 1,
-0.5757359, -0.7798288, -1.333632, 0.145098, 1, 0, 1,
-0.5755203, 0.3984176, -1.216711, 0.1411765, 1, 0, 1,
-0.5753792, 0.508975, -0.6243526, 0.1333333, 1, 0, 1,
-0.5717331, 0.07566422, -1.560758, 0.1294118, 1, 0, 1,
-0.569698, -0.4858187, -4.371899, 0.1215686, 1, 0, 1,
-0.5627269, -0.4866415, -1.703584, 0.1176471, 1, 0, 1,
-0.5621811, -0.3277103, -2.234511, 0.1098039, 1, 0, 1,
-0.551227, 0.3302067, -0.9687967, 0.1058824, 1, 0, 1,
-0.5474373, 0.7055539, -0.9256904, 0.09803922, 1, 0, 1,
-0.5473372, -1.401117, -1.908528, 0.09019608, 1, 0, 1,
-0.5462433, 0.02454806, -0.8881335, 0.08627451, 1, 0, 1,
-0.5430289, -2.530211, -2.420149, 0.07843138, 1, 0, 1,
-0.5401331, 0.1105599, -0.9236062, 0.07450981, 1, 0, 1,
-0.5370665, 0.02334194, -1.070318, 0.06666667, 1, 0, 1,
-0.5325325, -0.3299213, -1.608136, 0.0627451, 1, 0, 1,
-0.5308049, 0.9413666, 0.1822744, 0.05490196, 1, 0, 1,
-0.5303185, -0.1883494, -2.150814, 0.05098039, 1, 0, 1,
-0.5301242, 1.281257, 1.27024, 0.04313726, 1, 0, 1,
-0.5285204, 0.1648555, -1.113186, 0.03921569, 1, 0, 1,
-0.5279459, -0.4513348, -3.049602, 0.03137255, 1, 0, 1,
-0.5240328, -0.8724076, -4.802069, 0.02745098, 1, 0, 1,
-0.5188214, 1.056163, -1.165778, 0.01960784, 1, 0, 1,
-0.5111719, -1.672417, -1.555386, 0.01568628, 1, 0, 1,
-0.5069999, 0.4969566, -3.105334, 0.007843138, 1, 0, 1,
-0.5039027, -0.1262803, -1.781122, 0.003921569, 1, 0, 1,
-0.492594, -0.2889952, -2.897187, 0, 1, 0.003921569, 1,
-0.4918094, 1.407467, -1.754847, 0, 1, 0.01176471, 1,
-0.4892809, 0.8379576, -2.028874, 0, 1, 0.01568628, 1,
-0.4814099, -0.009022329, -0.9978684, 0, 1, 0.02352941, 1,
-0.4741163, 0.4235293, -1.923043, 0, 1, 0.02745098, 1,
-0.4730992, -0.001700522, -3.852026, 0, 1, 0.03529412, 1,
-0.4729054, 1.8038, 1.093073, 0, 1, 0.03921569, 1,
-0.4707871, -1.186723, -2.155007, 0, 1, 0.04705882, 1,
-0.4704166, 1.217822, -0.8191466, 0, 1, 0.05098039, 1,
-0.4687476, -2.463846, -3.811807, 0, 1, 0.05882353, 1,
-0.468732, -0.1714588, -1.00565, 0, 1, 0.0627451, 1,
-0.4685674, 0.3847943, -1.576934, 0, 1, 0.07058824, 1,
-0.463925, -1.008887, -1.847766, 0, 1, 0.07450981, 1,
-0.4626132, -0.3850437, -3.054493, 0, 1, 0.08235294, 1,
-0.4615049, -0.285796, -1.304711, 0, 1, 0.08627451, 1,
-0.4608997, 0.1997529, -2.641619, 0, 1, 0.09411765, 1,
-0.4574616, 0.5747906, -1.706019, 0, 1, 0.1019608, 1,
-0.4566102, -1.761545, -3.056731, 0, 1, 0.1058824, 1,
-0.4508204, -1.809854, -4.542154, 0, 1, 0.1137255, 1,
-0.450619, 1.322245, -0.2445041, 0, 1, 0.1176471, 1,
-0.4503207, -0.5004461, -1.106892, 0, 1, 0.1254902, 1,
-0.4469951, 0.5911213, -1.684687, 0, 1, 0.1294118, 1,
-0.4446006, -0.6332441, -1.949868, 0, 1, 0.1372549, 1,
-0.4427462, 0.05786314, -1.67172, 0, 1, 0.1411765, 1,
-0.4417713, 0.9373246, -2.516501, 0, 1, 0.1490196, 1,
-0.4414897, -1.468396, -2.431353, 0, 1, 0.1529412, 1,
-0.4400742, 0.7907732, -0.1978962, 0, 1, 0.1607843, 1,
-0.4285939, -0.210593, -4.316399, 0, 1, 0.1647059, 1,
-0.4270442, -2.154411, -3.753826, 0, 1, 0.172549, 1,
-0.4241604, -1.084279, -2.590542, 0, 1, 0.1764706, 1,
-0.4226282, -0.8159046, -1.1921, 0, 1, 0.1843137, 1,
-0.4192887, 0.4039273, -0.8514807, 0, 1, 0.1882353, 1,
-0.4169649, 1.510558, 0.2554633, 0, 1, 0.1960784, 1,
-0.4143906, -1.320844, -2.735263, 0, 1, 0.2039216, 1,
-0.4086179, 0.533601, -1.233559, 0, 1, 0.2078431, 1,
-0.406394, 0.2985622, -0.6328824, 0, 1, 0.2156863, 1,
-0.4056129, -0.01065456, -2.09018, 0, 1, 0.2196078, 1,
-0.4050902, -0.03030895, -1.310721, 0, 1, 0.227451, 1,
-0.4025296, -1.10626, -3.030717, 0, 1, 0.2313726, 1,
-0.3995833, 0.1642738, -2.522191, 0, 1, 0.2392157, 1,
-0.3961496, -0.4975802, -2.455234, 0, 1, 0.2431373, 1,
-0.3922437, 0.8733653, -0.02485724, 0, 1, 0.2509804, 1,
-0.3918259, 1.523052, -1.752979, 0, 1, 0.254902, 1,
-0.3918014, 0.9352409, 0.7638199, 0, 1, 0.2627451, 1,
-0.3885127, 1.721419, -1.027482, 0, 1, 0.2666667, 1,
-0.3862505, 1.100978, 0.4964401, 0, 1, 0.2745098, 1,
-0.3858043, 0.9253988, -0.2407474, 0, 1, 0.2784314, 1,
-0.3843741, -0.661091, -2.811307, 0, 1, 0.2862745, 1,
-0.3750918, -0.1461969, -2.335052, 0, 1, 0.2901961, 1,
-0.373024, -2.227481, -2.117897, 0, 1, 0.2980392, 1,
-0.3712689, -0.366962, -1.340449, 0, 1, 0.3058824, 1,
-0.3672418, -0.9515684, -2.570834, 0, 1, 0.3098039, 1,
-0.3650815, -1.621344, -1.820829, 0, 1, 0.3176471, 1,
-0.3609605, 0.837521, -1.469487, 0, 1, 0.3215686, 1,
-0.3606484, 0.1585205, -1.784536, 0, 1, 0.3294118, 1,
-0.3533216, 0.243804, -1.333183, 0, 1, 0.3333333, 1,
-0.3397537, 0.3423125, -2.50403, 0, 1, 0.3411765, 1,
-0.3387284, -0.9913385, -3.759059, 0, 1, 0.345098, 1,
-0.3382966, 1.331237, 0.4881736, 0, 1, 0.3529412, 1,
-0.3363015, 2.291946, 0.01840247, 0, 1, 0.3568628, 1,
-0.3304448, -1.038818, -3.200451, 0, 1, 0.3647059, 1,
-0.327657, 0.5058924, -0.448418, 0, 1, 0.3686275, 1,
-0.3271645, -0.30531, -2.447191, 0, 1, 0.3764706, 1,
-0.326667, 0.2697062, -1.100398, 0, 1, 0.3803922, 1,
-0.3261266, 0.3110698, -0.977111, 0, 1, 0.3882353, 1,
-0.3223889, 0.2313567, -0.2913537, 0, 1, 0.3921569, 1,
-0.320256, 0.5330065, 1.42535, 0, 1, 0.4, 1,
-0.3202205, -0.7390853, -2.768734, 0, 1, 0.4078431, 1,
-0.3187586, 0.2244374, -2.093321, 0, 1, 0.4117647, 1,
-0.3182774, -0.9187076, -0.9485269, 0, 1, 0.4196078, 1,
-0.3092534, 1.027661, 1.039044, 0, 1, 0.4235294, 1,
-0.3085034, -1.260189, -1.247714, 0, 1, 0.4313726, 1,
-0.3017564, 2.000352, -0.9193068, 0, 1, 0.4352941, 1,
-0.2991431, 1.145266, -0.9944926, 0, 1, 0.4431373, 1,
-0.2984434, 0.6433138, -0.01493042, 0, 1, 0.4470588, 1,
-0.2957892, 0.7719569, -0.03674064, 0, 1, 0.454902, 1,
-0.2938851, -0.4335943, -3.09462, 0, 1, 0.4588235, 1,
-0.2915504, 0.7466004, -0.02267977, 0, 1, 0.4666667, 1,
-0.2889582, -0.9702701, -2.000224, 0, 1, 0.4705882, 1,
-0.2841113, 1.220034, 0.09648661, 0, 1, 0.4784314, 1,
-0.2809391, -0.345177, -1.507026, 0, 1, 0.4823529, 1,
-0.2781578, 0.3477775, -0.1377233, 0, 1, 0.4901961, 1,
-0.2763413, 1.424448, -2.750837, 0, 1, 0.4941176, 1,
-0.2751425, -1.030765, -1.707998, 0, 1, 0.5019608, 1,
-0.2719273, 2.411003, -0.2573779, 0, 1, 0.509804, 1,
-0.2704088, 0.09448413, -3.070853, 0, 1, 0.5137255, 1,
-0.2700545, -1.209593, -3.27785, 0, 1, 0.5215687, 1,
-0.268318, 0.5807342, -0.2010721, 0, 1, 0.5254902, 1,
-0.2665763, -0.793295, -4.087417, 0, 1, 0.5333334, 1,
-0.2649495, -0.7633854, -3.464833, 0, 1, 0.5372549, 1,
-0.2643927, 1.304261, 0.9303252, 0, 1, 0.5450981, 1,
-0.2641033, 0.6309355, 0.3628154, 0, 1, 0.5490196, 1,
-0.2529798, -1.100065, -3.093998, 0, 1, 0.5568628, 1,
-0.2510459, 0.9234825, -1.586993, 0, 1, 0.5607843, 1,
-0.2506093, -0.5844215, -1.223721, 0, 1, 0.5686275, 1,
-0.2475395, 0.3539606, -0.7304046, 0, 1, 0.572549, 1,
-0.2469803, -1.004399, -3.282331, 0, 1, 0.5803922, 1,
-0.2435166, -0.4007978, -3.052957, 0, 1, 0.5843138, 1,
-0.2372096, -0.7990699, -3.198564, 0, 1, 0.5921569, 1,
-0.2367684, -0.3350499, -3.800883, 0, 1, 0.5960785, 1,
-0.2363903, 2.209812, -4.246577, 0, 1, 0.6039216, 1,
-0.2339729, 0.6009301, -1.169397, 0, 1, 0.6117647, 1,
-0.2339219, 0.5232993, -1.35103, 0, 1, 0.6156863, 1,
-0.2325799, 1.775605, 0.4511794, 0, 1, 0.6235294, 1,
-0.2259978, 0.790328, -0.9187908, 0, 1, 0.627451, 1,
-0.2248615, -1.034637, -2.996001, 0, 1, 0.6352941, 1,
-0.2228722, -0.4038028, -2.23038, 0, 1, 0.6392157, 1,
-0.2221243, -0.905601, -2.797977, 0, 1, 0.6470588, 1,
-0.2202661, -0.5721234, -3.300324, 0, 1, 0.6509804, 1,
-0.2197528, -1.016006, -1.294552, 0, 1, 0.6588235, 1,
-0.2165974, 0.4575473, -1.887231, 0, 1, 0.6627451, 1,
-0.2154227, -1.354421, -3.69035, 0, 1, 0.6705883, 1,
-0.2153964, 0.1457773, -1.262239, 0, 1, 0.6745098, 1,
-0.2146525, 0.1865863, -0.562718, 0, 1, 0.682353, 1,
-0.2133074, -0.7285151, -3.323324, 0, 1, 0.6862745, 1,
-0.2126615, -0.3461892, -2.755589, 0, 1, 0.6941177, 1,
-0.2044775, 0.06755581, 0.01370158, 0, 1, 0.7019608, 1,
-0.1998706, 1.13228, -0.2480686, 0, 1, 0.7058824, 1,
-0.1997788, -0.02906108, -3.149079, 0, 1, 0.7137255, 1,
-0.1988892, -0.2178457, -4.470369, 0, 1, 0.7176471, 1,
-0.1945268, 0.9017881, 0.1580904, 0, 1, 0.7254902, 1,
-0.194429, 0.3407709, -1.2415, 0, 1, 0.7294118, 1,
-0.1940542, -0.08966745, -1.337196, 0, 1, 0.7372549, 1,
-0.1915888, -0.09797689, -0.7289214, 0, 1, 0.7411765, 1,
-0.190617, -0.2265202, -3.3667, 0, 1, 0.7490196, 1,
-0.1892752, -1.176426, -2.589359, 0, 1, 0.7529412, 1,
-0.1876346, -0.6677003, -2.890096, 0, 1, 0.7607843, 1,
-0.1843872, -0.8306246, -4.281338, 0, 1, 0.7647059, 1,
-0.1830708, -0.5343195, -1.080422, 0, 1, 0.772549, 1,
-0.1603946, 0.2779612, -0.3207901, 0, 1, 0.7764706, 1,
-0.1588861, 0.1755002, 0.07715718, 0, 1, 0.7843137, 1,
-0.1537251, -1.054523, -1.943494, 0, 1, 0.7882353, 1,
-0.1523134, -0.4595033, -6.21318, 0, 1, 0.7960784, 1,
-0.1505605, 1.033108, 1.906368, 0, 1, 0.8039216, 1,
-0.1430962, -0.6327234, -3.071796, 0, 1, 0.8078431, 1,
-0.1402931, 0.04961306, -1.490274, 0, 1, 0.8156863, 1,
-0.1394151, -0.7476833, -2.870073, 0, 1, 0.8196079, 1,
-0.1363924, -0.7680859, -3.644774, 0, 1, 0.827451, 1,
-0.1343348, -1.290271, -5.304164, 0, 1, 0.8313726, 1,
-0.1290429, 0.02490188, -1.562793, 0, 1, 0.8392157, 1,
-0.1260149, 1.542086, -0.3588583, 0, 1, 0.8431373, 1,
-0.125694, -0.5304173, -3.162552, 0, 1, 0.8509804, 1,
-0.1217473, 0.9523821, -1.009906, 0, 1, 0.854902, 1,
-0.1179642, 0.1083095, 0.8463306, 0, 1, 0.8627451, 1,
-0.108572, 0.675378, 1.24877, 0, 1, 0.8666667, 1,
-0.1036092, -0.4551872, -3.398357, 0, 1, 0.8745098, 1,
-0.1034206, 1.482815, -2.056226, 0, 1, 0.8784314, 1,
-0.0898715, 0.6999608, -0.4209672, 0, 1, 0.8862745, 1,
-0.0876236, 0.5451941, 1.350764, 0, 1, 0.8901961, 1,
-0.08698626, -0.4902567, -2.577352, 0, 1, 0.8980392, 1,
-0.08131069, 0.3962744, -1.901892, 0, 1, 0.9058824, 1,
-0.08025948, -0.3655947, -3.023838, 0, 1, 0.9098039, 1,
-0.07893419, 0.1413099, -0.766252, 0, 1, 0.9176471, 1,
-0.07806627, -0.5859569, -3.792228, 0, 1, 0.9215686, 1,
-0.07318562, -0.09462135, -2.637266, 0, 1, 0.9294118, 1,
-0.07305203, -0.1234645, -3.158551, 0, 1, 0.9333333, 1,
-0.07259032, 0.902495, 1.442979, 0, 1, 0.9411765, 1,
-0.07194931, -0.3915161, -3.466003, 0, 1, 0.945098, 1,
-0.07063238, 0.7055343, 0.3306173, 0, 1, 0.9529412, 1,
-0.06971939, 0.456494, -2.049099, 0, 1, 0.9568627, 1,
-0.06961139, -1.365691, -3.229758, 0, 1, 0.9647059, 1,
-0.06515852, -1.794609, -3.297684, 0, 1, 0.9686275, 1,
-0.06021404, 1.343029, -0.0102877, 0, 1, 0.9764706, 1,
-0.05797195, 0.7237484, 0.5236342, 0, 1, 0.9803922, 1,
-0.05763628, 0.3323618, -0.3306425, 0, 1, 0.9882353, 1,
-0.05649202, -0.4957359, -2.292657, 0, 1, 0.9921569, 1,
-0.05319401, -2.478378, -3.412182, 0, 1, 1, 1,
-0.04746901, 0.3192025, 0.796369, 0, 0.9921569, 1, 1,
-0.04661425, 0.0252061, -1.150045, 0, 0.9882353, 1, 1,
-0.04287876, 0.1536988, -0.6491755, 0, 0.9803922, 1, 1,
-0.04183169, 0.5036763, 0.04751595, 0, 0.9764706, 1, 1,
-0.03487125, 0.0984322, 1.02862, 0, 0.9686275, 1, 1,
-0.03447999, -0.6498584, -2.394669, 0, 0.9647059, 1, 1,
-0.03260656, 0.957544, 0.6512746, 0, 0.9568627, 1, 1,
-0.02945424, -1.583575, -2.947932, 0, 0.9529412, 1, 1,
-0.0239607, 0.6111079, 0.2051138, 0, 0.945098, 1, 1,
-0.02377583, 0.3133537, -0.2897685, 0, 0.9411765, 1, 1,
-0.01910638, 0.1882768, 0.8678445, 0, 0.9333333, 1, 1,
-0.01903806, 0.7448381, -0.8759977, 0, 0.9294118, 1, 1,
-0.01421454, -1.263531, -5.539557, 0, 0.9215686, 1, 1,
-0.01102024, 0.01821083, -1.851398, 0, 0.9176471, 1, 1,
-0.01099347, 1.233218, 1.980747, 0, 0.9098039, 1, 1,
-0.008759691, -0.3860541, -2.387008, 0, 0.9058824, 1, 1,
-0.00404892, 0.7515697, 0.3218827, 0, 0.8980392, 1, 1,
-0.002277304, 0.1021872, -0.366368, 0, 0.8901961, 1, 1,
8.55898e-05, 0.2482891, 1.90977, 0, 0.8862745, 1, 1,
0.003856544, 0.09217972, -0.4683603, 0, 0.8784314, 1, 1,
0.005162986, -0.4110021, 4.34388, 0, 0.8745098, 1, 1,
0.005254063, -1.169546, 3.998184, 0, 0.8666667, 1, 1,
0.009531124, -0.7911031, 3.127482, 0, 0.8627451, 1, 1,
0.01372325, -0.5096819, 3.334338, 0, 0.854902, 1, 1,
0.01879149, 0.5800791, 0.5320823, 0, 0.8509804, 1, 1,
0.01931746, 0.8122694, 0.4070512, 0, 0.8431373, 1, 1,
0.02690201, -0.1434752, 2.756238, 0, 0.8392157, 1, 1,
0.03015955, 0.802724, 0.4049891, 0, 0.8313726, 1, 1,
0.03334678, 0.07590893, -0.02598306, 0, 0.827451, 1, 1,
0.0356623, -0.2537615, 3.594105, 0, 0.8196079, 1, 1,
0.04154348, 1.433423, 1.358858, 0, 0.8156863, 1, 1,
0.04174554, -1.530698, 2.169048, 0, 0.8078431, 1, 1,
0.04644116, 1.008817, -1.426144, 0, 0.8039216, 1, 1,
0.04730699, -1.1092, 5.071509, 0, 0.7960784, 1, 1,
0.04847233, 0.9758041, -0.4560489, 0, 0.7882353, 1, 1,
0.05028021, 1.725263, 0.7871655, 0, 0.7843137, 1, 1,
0.05944778, 0.8479383, 1.375055, 0, 0.7764706, 1, 1,
0.06004103, -0.006851698, 0.5520526, 0, 0.772549, 1, 1,
0.06042051, 0.8482986, -1.301947, 0, 0.7647059, 1, 1,
0.06074303, -0.7804339, 2.420937, 0, 0.7607843, 1, 1,
0.0617293, 2.144198, -0.5104402, 0, 0.7529412, 1, 1,
0.06506407, -1.071823, 3.436174, 0, 0.7490196, 1, 1,
0.06640136, -1.353451, 4.074781, 0, 0.7411765, 1, 1,
0.06824192, -0.2933994, 1.89839, 0, 0.7372549, 1, 1,
0.07475451, 1.18614, 1.023664, 0, 0.7294118, 1, 1,
0.07666986, -0.8605841, 4.427819, 0, 0.7254902, 1, 1,
0.07859129, -0.006206036, 1.856031, 0, 0.7176471, 1, 1,
0.07902921, 0.9208901, 0.4067762, 0, 0.7137255, 1, 1,
0.07968309, 0.201315, -0.4176056, 0, 0.7058824, 1, 1,
0.08455878, -1.021221, 3.739394, 0, 0.6980392, 1, 1,
0.08657911, 0.1724655, 0.6006809, 0, 0.6941177, 1, 1,
0.09757861, 0.2573301, -0.342888, 0, 0.6862745, 1, 1,
0.09773879, 0.5047904, 0.7527251, 0, 0.682353, 1, 1,
0.09776343, 2.407452, 0.01890569, 0, 0.6745098, 1, 1,
0.09817698, -0.4446977, 1.601487, 0, 0.6705883, 1, 1,
0.09961567, 1.239441, -0.61854, 0, 0.6627451, 1, 1,
0.1026918, 0.7826698, -1.114242, 0, 0.6588235, 1, 1,
0.1029722, -0.4891447, 3.779036, 0, 0.6509804, 1, 1,
0.1032271, 0.7314131, -1.219183, 0, 0.6470588, 1, 1,
0.1065758, 0.3680943, -0.9784753, 0, 0.6392157, 1, 1,
0.1098516, -1.750389, 2.530978, 0, 0.6352941, 1, 1,
0.1108994, -1.156702, 3.46443, 0, 0.627451, 1, 1,
0.1185864, 0.8833028, 0.1323286, 0, 0.6235294, 1, 1,
0.1268303, 0.5261341, 1.853441, 0, 0.6156863, 1, 1,
0.1292121, 0.5828243, 1.581994, 0, 0.6117647, 1, 1,
0.1308053, -2.293434, 4.152715, 0, 0.6039216, 1, 1,
0.132333, 0.5847757, 1.023117, 0, 0.5960785, 1, 1,
0.1335941, 0.06942488, 1.714726, 0, 0.5921569, 1, 1,
0.1342314, -0.2655948, 2.734172, 0, 0.5843138, 1, 1,
0.1369797, -2.456109, 2.483753, 0, 0.5803922, 1, 1,
0.1380488, -0.8836954, 0.9856964, 0, 0.572549, 1, 1,
0.1438914, -0.09459744, 1.972865, 0, 0.5686275, 1, 1,
0.1447785, -1.159743, 1.299376, 0, 0.5607843, 1, 1,
0.1483282, 0.3737115, -0.3420651, 0, 0.5568628, 1, 1,
0.1531055, 0.2904726, 0.3564402, 0, 0.5490196, 1, 1,
0.1596505, -0.4971364, 2.872557, 0, 0.5450981, 1, 1,
0.1603395, -0.1390922, 1.533965, 0, 0.5372549, 1, 1,
0.1622711, -0.9627607, 3.404185, 0, 0.5333334, 1, 1,
0.1631731, -2.974615, 4.441093, 0, 0.5254902, 1, 1,
0.1633602, -0.6214817, 4.343074, 0, 0.5215687, 1, 1,
0.1665969, -0.2477605, 4.386357, 0, 0.5137255, 1, 1,
0.1703265, -0.6825302, 2.816048, 0, 0.509804, 1, 1,
0.1724868, -1.668287, 2.894858, 0, 0.5019608, 1, 1,
0.1735904, 1.064288, -0.4047379, 0, 0.4941176, 1, 1,
0.1742109, -0.6908299, 3.240391, 0, 0.4901961, 1, 1,
0.1756614, -1.542437, 2.297224, 0, 0.4823529, 1, 1,
0.1762336, -0.06199162, 1.980865, 0, 0.4784314, 1, 1,
0.177467, -0.4274525, 2.242332, 0, 0.4705882, 1, 1,
0.1948874, 0.2808578, -0.7836917, 0, 0.4666667, 1, 1,
0.1983637, -0.3331389, 1.552734, 0, 0.4588235, 1, 1,
0.203512, 0.7811384, -0.17298, 0, 0.454902, 1, 1,
0.2096365, 0.2327341, 0.9193606, 0, 0.4470588, 1, 1,
0.2104316, 0.2946178, 1.364159, 0, 0.4431373, 1, 1,
0.2124777, -0.1388932, 2.489262, 0, 0.4352941, 1, 1,
0.2136159, 1.17652, 1.503441, 0, 0.4313726, 1, 1,
0.2146409, -1.540831, 4.416214, 0, 0.4235294, 1, 1,
0.2156566, 0.1455339, 1.014405, 0, 0.4196078, 1, 1,
0.2172816, -0.8262622, 4.149483, 0, 0.4117647, 1, 1,
0.2195543, 0.7841181, 0.6297992, 0, 0.4078431, 1, 1,
0.2252729, -1.790784, 3.924691, 0, 0.4, 1, 1,
0.2272557, 0.4572033, 2.139128, 0, 0.3921569, 1, 1,
0.2282687, -0.1705231, 2.213546, 0, 0.3882353, 1, 1,
0.2292317, -1.351587, 4.319277, 0, 0.3803922, 1, 1,
0.2293491, 0.5793089, 1.295175, 0, 0.3764706, 1, 1,
0.2306072, 0.05563007, 0.9419926, 0, 0.3686275, 1, 1,
0.23293, -0.9818998, 1.703485, 0, 0.3647059, 1, 1,
0.2346765, -0.127474, 2.514574, 0, 0.3568628, 1, 1,
0.2359765, 1.002692, -0.8157451, 0, 0.3529412, 1, 1,
0.2380527, -0.6820825, 2.832188, 0, 0.345098, 1, 1,
0.2412343, -0.8706838, 2.765004, 0, 0.3411765, 1, 1,
0.2440108, 0.7889226, 1.897299, 0, 0.3333333, 1, 1,
0.2447087, -0.6262903, 2.563582, 0, 0.3294118, 1, 1,
0.2551804, 0.1856342, 2.924231, 0, 0.3215686, 1, 1,
0.2563909, -1.169555, 4.438238, 0, 0.3176471, 1, 1,
0.2605916, 1.12984, 1.589958, 0, 0.3098039, 1, 1,
0.2627938, -0.08736055, 3.180392, 0, 0.3058824, 1, 1,
0.2638824, -0.6478692, 3.113842, 0, 0.2980392, 1, 1,
0.2715539, -0.6005773, 2.546201, 0, 0.2901961, 1, 1,
0.2715574, 0.03182461, 2.601254, 0, 0.2862745, 1, 1,
0.2716064, 0.0926087, 0.09504687, 0, 0.2784314, 1, 1,
0.2721916, -0.9542742, 2.103641, 0, 0.2745098, 1, 1,
0.273063, 0.9924282, 0.8682932, 0, 0.2666667, 1, 1,
0.2781999, -0.3872093, 2.399047, 0, 0.2627451, 1, 1,
0.2842903, 0.5440942, 1.646791, 0, 0.254902, 1, 1,
0.2846576, 0.8224835, -0.8203722, 0, 0.2509804, 1, 1,
0.2884679, 0.03138938, 1.429442, 0, 0.2431373, 1, 1,
0.2940809, -0.3439026, 3.551554, 0, 0.2392157, 1, 1,
0.2956888, -1.226422, 1.805385, 0, 0.2313726, 1, 1,
0.2958285, -0.2118833, 3.687428, 0, 0.227451, 1, 1,
0.2965225, 1.88242, 0.7968091, 0, 0.2196078, 1, 1,
0.2974168, -0.684217, 2.069331, 0, 0.2156863, 1, 1,
0.2986189, 0.4329102, 0.6170791, 0, 0.2078431, 1, 1,
0.3026946, 0.8229189, 2.366693, 0, 0.2039216, 1, 1,
0.3078696, -0.3938991, 1.838075, 0, 0.1960784, 1, 1,
0.30797, 0.8748921, 0.0006781924, 0, 0.1882353, 1, 1,
0.3102301, 0.2560812, 0.7322555, 0, 0.1843137, 1, 1,
0.3111941, 1.335189, -1.700556, 0, 0.1764706, 1, 1,
0.3138283, -0.1275376, 3.4744, 0, 0.172549, 1, 1,
0.3139895, 0.5884575, 0.6511903, 0, 0.1647059, 1, 1,
0.316716, -1.182312, 2.580916, 0, 0.1607843, 1, 1,
0.3253699, 0.8141056, 1.391587, 0, 0.1529412, 1, 1,
0.3299774, 0.3548633, -1.187513, 0, 0.1490196, 1, 1,
0.3370937, 0.2183924, -0.3950495, 0, 0.1411765, 1, 1,
0.3432829, 0.2563154, 0.2378694, 0, 0.1372549, 1, 1,
0.351604, 0.391027, 0.5535383, 0, 0.1294118, 1, 1,
0.3533979, 1.092414, 0.2017362, 0, 0.1254902, 1, 1,
0.3545541, -0.1359894, 2.563931, 0, 0.1176471, 1, 1,
0.3603607, 0.3503161, 0.08619037, 0, 0.1137255, 1, 1,
0.3634511, -1.326228, 2.409663, 0, 0.1058824, 1, 1,
0.3703465, -0.2365893, 0.4676055, 0, 0.09803922, 1, 1,
0.372941, 0.3433807, 0.4789328, 0, 0.09411765, 1, 1,
0.3776163, 1.189824, -0.8059533, 0, 0.08627451, 1, 1,
0.3786541, 0.1626137, -0.6971549, 0, 0.08235294, 1, 1,
0.3819602, -0.3264447, 2.640676, 0, 0.07450981, 1, 1,
0.3823846, -0.5452334, 1.639177, 0, 0.07058824, 1, 1,
0.388209, 0.5636707, 1.465032, 0, 0.0627451, 1, 1,
0.3906676, 0.0003138352, 1.00704, 0, 0.05882353, 1, 1,
0.3996251, -0.1273951, 1.503873, 0, 0.05098039, 1, 1,
0.399771, -1.318058, 2.108711, 0, 0.04705882, 1, 1,
0.4038239, -0.2768585, 2.066438, 0, 0.03921569, 1, 1,
0.4047143, -1.11911, 2.940851, 0, 0.03529412, 1, 1,
0.4049512, -0.1818829, 2.282419, 0, 0.02745098, 1, 1,
0.4100194, 2.532126, -1.825563, 0, 0.02352941, 1, 1,
0.4153748, -0.2129282, 2.252063, 0, 0.01568628, 1, 1,
0.4214774, 0.6514286, -0.6018869, 0, 0.01176471, 1, 1,
0.422423, -1.042599, 2.347082, 0, 0.003921569, 1, 1,
0.4237562, 0.5560733, 0.5984349, 0.003921569, 0, 1, 1,
0.4248294, -1.380188, 1.535261, 0.007843138, 0, 1, 1,
0.4252415, -1.196483, 2.586717, 0.01568628, 0, 1, 1,
0.425606, 1.611883, 1.102314, 0.01960784, 0, 1, 1,
0.4256422, -1.12353, 2.699023, 0.02745098, 0, 1, 1,
0.4277405, -0.09861679, -1.277862, 0.03137255, 0, 1, 1,
0.4286553, -0.7171902, 3.128445, 0.03921569, 0, 1, 1,
0.4316593, 0.3995619, 1.06902, 0.04313726, 0, 1, 1,
0.4342305, -0.4075219, 2.673882, 0.05098039, 0, 1, 1,
0.4382688, 0.9872823, -0.7382447, 0.05490196, 0, 1, 1,
0.4437939, -0.9487722, 2.978366, 0.0627451, 0, 1, 1,
0.4444765, -4.215492, 3.793131, 0.06666667, 0, 1, 1,
0.4519313, 1.994678, 1.520961, 0.07450981, 0, 1, 1,
0.4537078, -0.1134361, 1.186285, 0.07843138, 0, 1, 1,
0.4537876, 0.4298306, -1.091421, 0.08627451, 0, 1, 1,
0.4590143, 0.5833458, -1.391773, 0.09019608, 0, 1, 1,
0.4622216, -0.3822696, 1.24506, 0.09803922, 0, 1, 1,
0.4640984, 0.3091895, 0.1339777, 0.1058824, 0, 1, 1,
0.4778696, 1.0838, 0.1375097, 0.1098039, 0, 1, 1,
0.4784551, 0.590685, -0.3889496, 0.1176471, 0, 1, 1,
0.4798841, 0.1803371, 1.260916, 0.1215686, 0, 1, 1,
0.482393, -0.4140191, 2.208037, 0.1294118, 0, 1, 1,
0.4830475, -0.9813465, 3.099977, 0.1333333, 0, 1, 1,
0.4855731, -0.9152464, 1.157271, 0.1411765, 0, 1, 1,
0.486546, 1.805856, 0.8671024, 0.145098, 0, 1, 1,
0.4892503, 1.30464, 0.2340361, 0.1529412, 0, 1, 1,
0.4895479, 0.3673015, 1.847934, 0.1568628, 0, 1, 1,
0.4895602, 0.03455948, 1.914761, 0.1647059, 0, 1, 1,
0.4936815, 0.8108929, 1.311721, 0.1686275, 0, 1, 1,
0.5060448, -0.3650632, 1.646135, 0.1764706, 0, 1, 1,
0.5115548, 0.6976151, 1.05371, 0.1803922, 0, 1, 1,
0.5173764, -0.9600803, 4.51625, 0.1882353, 0, 1, 1,
0.5201719, -0.7860598, 2.595919, 0.1921569, 0, 1, 1,
0.5264056, 0.05877781, 2.239774, 0.2, 0, 1, 1,
0.527171, 1.660308, 1.700752, 0.2078431, 0, 1, 1,
0.5328678, 2.691149, 1.511361, 0.2117647, 0, 1, 1,
0.5333976, 2.42032, 1.38302, 0.2196078, 0, 1, 1,
0.5343437, 0.415572, -0.7451888, 0.2235294, 0, 1, 1,
0.5344305, -2.187323, 3.394557, 0.2313726, 0, 1, 1,
0.5379579, 0.6592053, 0.4497473, 0.2352941, 0, 1, 1,
0.5396694, 1.757074, 0.6380269, 0.2431373, 0, 1, 1,
0.5448312, 0.5536766, 1.962804, 0.2470588, 0, 1, 1,
0.5488347, 0.6703409, 0.1892279, 0.254902, 0, 1, 1,
0.5533206, 0.20377, 1.213338, 0.2588235, 0, 1, 1,
0.5550208, 0.6750935, -0.1260207, 0.2666667, 0, 1, 1,
0.5564215, -0.284495, 2.250756, 0.2705882, 0, 1, 1,
0.5571249, -0.5884798, 1.760657, 0.2784314, 0, 1, 1,
0.5575836, -0.1146376, 1.673548, 0.282353, 0, 1, 1,
0.5667564, -0.4109481, 2.424105, 0.2901961, 0, 1, 1,
0.5729541, -0.541916, 3.313359, 0.2941177, 0, 1, 1,
0.5744573, 0.510974, 2.677969, 0.3019608, 0, 1, 1,
0.5754896, -1.639949, 3.175806, 0.3098039, 0, 1, 1,
0.5755702, -0.1810314, 2.030638, 0.3137255, 0, 1, 1,
0.5759479, 0.9002127, 0.9128523, 0.3215686, 0, 1, 1,
0.5772327, 0.9542156, -1.638792, 0.3254902, 0, 1, 1,
0.5792847, -0.9114058, 0.7673641, 0.3333333, 0, 1, 1,
0.5805967, 0.6947759, -0.212495, 0.3372549, 0, 1, 1,
0.5865375, -0.1567675, 0.4600182, 0.345098, 0, 1, 1,
0.5866908, 2.104524, -0.8376692, 0.3490196, 0, 1, 1,
0.5872787, 0.9378463, -1.253276, 0.3568628, 0, 1, 1,
0.5880466, 0.08942652, 2.93813, 0.3607843, 0, 1, 1,
0.5894017, -1.756375, 2.91286, 0.3686275, 0, 1, 1,
0.5947539, 0.6039151, 1.97329, 0.372549, 0, 1, 1,
0.5959834, -1.671185, 0.5908375, 0.3803922, 0, 1, 1,
0.5975166, 1.010418, 2.441296, 0.3843137, 0, 1, 1,
0.598121, -2.369263, 1.810267, 0.3921569, 0, 1, 1,
0.59851, 0.7637851, 1.250245, 0.3960784, 0, 1, 1,
0.6032054, 1.950653, 0.1930342, 0.4039216, 0, 1, 1,
0.6057174, 1.03682, 0.9581475, 0.4117647, 0, 1, 1,
0.6073215, 1.852452, 0.6688738, 0.4156863, 0, 1, 1,
0.6083132, -0.54106, 1.555853, 0.4235294, 0, 1, 1,
0.6088461, -1.160168, 0.8466418, 0.427451, 0, 1, 1,
0.6089159, 0.2746296, 0.3233103, 0.4352941, 0, 1, 1,
0.611675, 0.1995201, -0.316668, 0.4392157, 0, 1, 1,
0.6123571, -1.423286, 2.539018, 0.4470588, 0, 1, 1,
0.6128964, 1.383567, -0.5698543, 0.4509804, 0, 1, 1,
0.6135107, -0.8181999, 3.078689, 0.4588235, 0, 1, 1,
0.615926, 0.7339714, 1.752638, 0.4627451, 0, 1, 1,
0.6189818, -0.5169561, 0.3807122, 0.4705882, 0, 1, 1,
0.6195548, 0.8377811, -0.2683885, 0.4745098, 0, 1, 1,
0.6210819, 1.071038, 0.4685445, 0.4823529, 0, 1, 1,
0.6219468, -0.3306112, 2.532272, 0.4862745, 0, 1, 1,
0.6232977, -0.1680852, 1.637523, 0.4941176, 0, 1, 1,
0.6357772, 2.602337, 0.8954704, 0.5019608, 0, 1, 1,
0.6395903, 1.278372, 0.2019788, 0.5058824, 0, 1, 1,
0.6447861, -0.3329756, 1.879995, 0.5137255, 0, 1, 1,
0.6460038, -0.9118073, 3.019056, 0.5176471, 0, 1, 1,
0.6486232, -0.4783913, 2.409137, 0.5254902, 0, 1, 1,
0.6507568, 1.16158, 1.034742, 0.5294118, 0, 1, 1,
0.6574581, 0.8149604, 0.03503324, 0.5372549, 0, 1, 1,
0.6610698, -0.4689015, 4.735115, 0.5411765, 0, 1, 1,
0.6626115, -1.368125, 0.518661, 0.5490196, 0, 1, 1,
0.6666838, -0.7854463, 0.9077286, 0.5529412, 0, 1, 1,
0.669067, -1.354585, 1.914702, 0.5607843, 0, 1, 1,
0.6702943, 1.137481, 1.21916, 0.5647059, 0, 1, 1,
0.6705926, 0.5002739, 2.568369, 0.572549, 0, 1, 1,
0.6731815, 0.05637054, 0.1287875, 0.5764706, 0, 1, 1,
0.6751269, -0.8944336, 2.117986, 0.5843138, 0, 1, 1,
0.6769133, 0.5587096, -0.7069058, 0.5882353, 0, 1, 1,
0.6800208, -0.2871434, 0.6902739, 0.5960785, 0, 1, 1,
0.6818919, 1.850759, 1.253242, 0.6039216, 0, 1, 1,
0.6843652, -1.203556, 2.812167, 0.6078432, 0, 1, 1,
0.6902806, 0.1780424, 0.5986901, 0.6156863, 0, 1, 1,
0.6932848, 1.024482, 1.867221, 0.6196079, 0, 1, 1,
0.6994644, 1.064883, 1.673889, 0.627451, 0, 1, 1,
0.7021302, 0.0781702, 1.756139, 0.6313726, 0, 1, 1,
0.7045145, -0.5125452, 2.067021, 0.6392157, 0, 1, 1,
0.7066813, -0.2373897, 1.987428, 0.6431373, 0, 1, 1,
0.7181559, -0.7671785, 1.411271, 0.6509804, 0, 1, 1,
0.7204893, -0.885031, 1.238014, 0.654902, 0, 1, 1,
0.7213214, -0.08928266, 2.300489, 0.6627451, 0, 1, 1,
0.7243631, 0.0879826, 2.042356, 0.6666667, 0, 1, 1,
0.7297325, 0.2725043, 1.594449, 0.6745098, 0, 1, 1,
0.7315481, 0.6225222, 0.5847665, 0.6784314, 0, 1, 1,
0.7334769, -0.9621531, 0.7326687, 0.6862745, 0, 1, 1,
0.73608, -1.360185, 3.460549, 0.6901961, 0, 1, 1,
0.7375261, 1.39358, 1.036145, 0.6980392, 0, 1, 1,
0.7381424, 0.276254, 0.2905819, 0.7058824, 0, 1, 1,
0.7390288, -0.6544293, 2.820137, 0.7098039, 0, 1, 1,
0.7392766, -0.1349636, 1.061723, 0.7176471, 0, 1, 1,
0.7407936, -0.2456684, 1.543632, 0.7215686, 0, 1, 1,
0.7411118, -0.5722582, 4.342374, 0.7294118, 0, 1, 1,
0.7426583, -1.051299, 3.314557, 0.7333333, 0, 1, 1,
0.7450746, 0.1963514, 1.748756, 0.7411765, 0, 1, 1,
0.7558998, -0.4853199, 3.114181, 0.7450981, 0, 1, 1,
0.7588729, 0.6783292, 0.861028, 0.7529412, 0, 1, 1,
0.7608442, 0.8986001, 1.548897, 0.7568628, 0, 1, 1,
0.762593, 0.5127459, 1.889748, 0.7647059, 0, 1, 1,
0.7650366, 0.6455529, 0.02679345, 0.7686275, 0, 1, 1,
0.7678182, -1.541939, 1.42243, 0.7764706, 0, 1, 1,
0.7801057, -1.121385, 2.27329, 0.7803922, 0, 1, 1,
0.7835128, -1.963628, 2.615557, 0.7882353, 0, 1, 1,
0.7875343, 0.136478, 1.365463, 0.7921569, 0, 1, 1,
0.7934223, -1.074017, 1.634886, 0.8, 0, 1, 1,
0.7944478, 0.1853653, 1.064334, 0.8078431, 0, 1, 1,
0.7946134, 1.35661, 1.81527, 0.8117647, 0, 1, 1,
0.795166, 0.8653985, 1.190776, 0.8196079, 0, 1, 1,
0.8062715, 0.8843351, 1.869591, 0.8235294, 0, 1, 1,
0.8151171, -0.4720337, 0.7576486, 0.8313726, 0, 1, 1,
0.8207428, 0.9746276, 0.3640588, 0.8352941, 0, 1, 1,
0.8288992, -0.3114784, 1.55751, 0.8431373, 0, 1, 1,
0.8290923, -0.4114814, 2.898259, 0.8470588, 0, 1, 1,
0.839744, 0.4470274, 1.168555, 0.854902, 0, 1, 1,
0.8409449, -0.7752422, 2.903622, 0.8588235, 0, 1, 1,
0.8440409, 0.0267193, 1.842828, 0.8666667, 0, 1, 1,
0.8446504, -0.5072634, 3.925913, 0.8705882, 0, 1, 1,
0.8467123, -1.425755, 2.261892, 0.8784314, 0, 1, 1,
0.8519327, 1.527745, -1.040558, 0.8823529, 0, 1, 1,
0.8541778, -1.99741, 3.480867, 0.8901961, 0, 1, 1,
0.8566846, 1.850003, -0.1287124, 0.8941177, 0, 1, 1,
0.868502, -0.9645626, 2.687442, 0.9019608, 0, 1, 1,
0.8756849, 0.5242112, 2.1092, 0.9098039, 0, 1, 1,
0.8788003, 0.1006623, 2.183616, 0.9137255, 0, 1, 1,
0.8909926, -0.1081492, 2.338037, 0.9215686, 0, 1, 1,
0.9023132, 0.2245546, 0.773232, 0.9254902, 0, 1, 1,
0.9024834, -0.2037362, 1.501863, 0.9333333, 0, 1, 1,
0.907798, -1.01771, 3.859699, 0.9372549, 0, 1, 1,
0.9123143, -0.5366759, 1.469679, 0.945098, 0, 1, 1,
0.9142975, -1.637164, 2.77843, 0.9490196, 0, 1, 1,
0.9160153, 0.7087572, -0.1424055, 0.9568627, 0, 1, 1,
0.9278501, 1.327803, 1.210596, 0.9607843, 0, 1, 1,
0.9322803, 1.338197, -0.3598863, 0.9686275, 0, 1, 1,
0.9377692, -0.3700074, 0.1740647, 0.972549, 0, 1, 1,
0.941512, -2.466551, 2.783973, 0.9803922, 0, 1, 1,
0.9417599, -1.538333, 2.284235, 0.9843137, 0, 1, 1,
0.9526767, 0.3008822, 0.5175936, 0.9921569, 0, 1, 1,
0.9545938, 1.744524, 0.1873644, 0.9960784, 0, 1, 1,
0.9557142, 0.8418207, -0.5315326, 1, 0, 0.9960784, 1,
0.957283, -1.201311, 1.920415, 1, 0, 0.9882353, 1,
0.963948, -0.1920523, 2.695948, 1, 0, 0.9843137, 1,
0.9672174, -0.8118008, 2.514115, 1, 0, 0.9764706, 1,
0.9724441, 0.4166684, 1.171559, 1, 0, 0.972549, 1,
0.9764525, 1.337685, -0.3454, 1, 0, 0.9647059, 1,
0.9803761, -0.9130628, 3.047106, 1, 0, 0.9607843, 1,
0.9819109, 0.06923559, 1.180288, 1, 0, 0.9529412, 1,
0.9840674, -0.5983771, 2.122188, 1, 0, 0.9490196, 1,
0.9892666, 0.09807717, 0.8997195, 1, 0, 0.9411765, 1,
0.9921384, -1.104657, 2.057801, 1, 0, 0.9372549, 1,
0.9923521, -0.5495893, 2.787175, 1, 0, 0.9294118, 1,
0.9969482, 0.4927916, 3.309039, 1, 0, 0.9254902, 1,
1.003023, -1.184253, 1.904306, 1, 0, 0.9176471, 1,
1.005718, -0.7029648, 2.796906, 1, 0, 0.9137255, 1,
1.015718, -0.1814215, -0.2139987, 1, 0, 0.9058824, 1,
1.016777, -0.2593363, 1.019308, 1, 0, 0.9019608, 1,
1.020149, 1.521437, 0.141709, 1, 0, 0.8941177, 1,
1.023937, 0.396365, -0.7924738, 1, 0, 0.8862745, 1,
1.026028, -1.417555, 2.904614, 1, 0, 0.8823529, 1,
1.027919, -0.7314745, 1.633274, 1, 0, 0.8745098, 1,
1.032777, 0.912757, -0.4435671, 1, 0, 0.8705882, 1,
1.051259, 0.5869525, 1.751567, 1, 0, 0.8627451, 1,
1.05243, -0.7433759, 1.713035, 1, 0, 0.8588235, 1,
1.053956, -0.707504, 1.661618, 1, 0, 0.8509804, 1,
1.058021, 0.105949, 2.269282, 1, 0, 0.8470588, 1,
1.072103, -1.758972, 3.498486, 1, 0, 0.8392157, 1,
1.07549, -0.9416386, 4.041426, 1, 0, 0.8352941, 1,
1.077036, 1.34123, -0.5959969, 1, 0, 0.827451, 1,
1.080639, 0.2887092, 2.004305, 1, 0, 0.8235294, 1,
1.09166, -0.6058978, 1.162411, 1, 0, 0.8156863, 1,
1.095123, -0.02984703, 1.366413, 1, 0, 0.8117647, 1,
1.096914, -0.8431702, 3.552468, 1, 0, 0.8039216, 1,
1.098495, 0.641139, 1.794149, 1, 0, 0.7960784, 1,
1.100101, -0.9718565, 1.284162, 1, 0, 0.7921569, 1,
1.111493, 0.1145965, 1.367551, 1, 0, 0.7843137, 1,
1.113985, 1.166635, 1.100148, 1, 0, 0.7803922, 1,
1.11899, 1.217773, 1.701257, 1, 0, 0.772549, 1,
1.120611, 1.470996, 0.9398422, 1, 0, 0.7686275, 1,
1.126623, 1.534614, 0.1859752, 1, 0, 0.7607843, 1,
1.128387, -0.9745207, 2.068121, 1, 0, 0.7568628, 1,
1.140927, -1.40935, 2.670008, 1, 0, 0.7490196, 1,
1.141395, -0.495955, 3.148753, 1, 0, 0.7450981, 1,
1.149823, -0.4129779, 2.11948, 1, 0, 0.7372549, 1,
1.151184, -1.38362, 3.3869, 1, 0, 0.7333333, 1,
1.151553, 1.20068, 1.089223, 1, 0, 0.7254902, 1,
1.153581, 0.05460287, 1.187422, 1, 0, 0.7215686, 1,
1.156321, -0.2084433, 2.662966, 1, 0, 0.7137255, 1,
1.163278, -0.6488547, 3.612869, 1, 0, 0.7098039, 1,
1.16923, 0.6941321, 1.474794, 1, 0, 0.7019608, 1,
1.169818, 0.6456308, 0.7724693, 1, 0, 0.6941177, 1,
1.171386, -1.684196, 2.318607, 1, 0, 0.6901961, 1,
1.175117, 1.28266, 0.6638052, 1, 0, 0.682353, 1,
1.182814, 2.503393, -0.04976914, 1, 0, 0.6784314, 1,
1.183177, -0.8844512, 0.4801646, 1, 0, 0.6705883, 1,
1.185531, 1.613986, 0.6079697, 1, 0, 0.6666667, 1,
1.186659, -1.037616, 0.8104993, 1, 0, 0.6588235, 1,
1.186798, 1.196628, -1.25599, 1, 0, 0.654902, 1,
1.189752, -1.256855, 1.248926, 1, 0, 0.6470588, 1,
1.193856, -1.693746, 2.734429, 1, 0, 0.6431373, 1,
1.202506, 0.5173203, 1.925185, 1, 0, 0.6352941, 1,
1.210356, -0.2988099, 2.815986, 1, 0, 0.6313726, 1,
1.232132, -0.2225514, 1.451283, 1, 0, 0.6235294, 1,
1.234486, 0.6862038, 0.9824083, 1, 0, 0.6196079, 1,
1.251585, -1.671752, 1.237897, 1, 0, 0.6117647, 1,
1.254439, -0.8373906, 0.5221939, 1, 0, 0.6078432, 1,
1.267879, 1.683742, 0.7897442, 1, 0, 0.6, 1,
1.272972, 1.035409, 1.05149, 1, 0, 0.5921569, 1,
1.27671, -0.1657054, 2.730483, 1, 0, 0.5882353, 1,
1.291477, -0.2761564, 2.777806, 1, 0, 0.5803922, 1,
1.29357, 0.30882, 1.705962, 1, 0, 0.5764706, 1,
1.30269, 0.3331097, 3.312024, 1, 0, 0.5686275, 1,
1.307744, -0.9559892, 3.12297, 1, 0, 0.5647059, 1,
1.312321, -0.5399011, 2.348702, 1, 0, 0.5568628, 1,
1.312824, 1.10639, 0.07566512, 1, 0, 0.5529412, 1,
1.32182, 0.7145836, 1.634873, 1, 0, 0.5450981, 1,
1.329166, 0.130674, 1.375998, 1, 0, 0.5411765, 1,
1.336048, 1.069889, -0.1534192, 1, 0, 0.5333334, 1,
1.340838, -0.9689894, 0.7062021, 1, 0, 0.5294118, 1,
1.346515, -0.1190798, 0.6216043, 1, 0, 0.5215687, 1,
1.357071, 0.06911104, -0.5629532, 1, 0, 0.5176471, 1,
1.35814, 1.29028, 1.407566, 1, 0, 0.509804, 1,
1.361624, 0.8354034, 2.109414, 1, 0, 0.5058824, 1,
1.372855, 1.757753, -0.1026417, 1, 0, 0.4980392, 1,
1.375603, -1.157114, 4.791375, 1, 0, 0.4901961, 1,
1.38708, 0.2772163, 1.517735, 1, 0, 0.4862745, 1,
1.388484, 0.4278699, 2.280438, 1, 0, 0.4784314, 1,
1.403353, 0.6250331, 0.6491929, 1, 0, 0.4745098, 1,
1.408868, 1.881083, -0.2856475, 1, 0, 0.4666667, 1,
1.409156, 0.7631865, 1.854997, 1, 0, 0.4627451, 1,
1.417118, 0.7687134, 2.059089, 1, 0, 0.454902, 1,
1.418408, -0.6480507, 2.417563, 1, 0, 0.4509804, 1,
1.421556, 0.8445995, 0.1886662, 1, 0, 0.4431373, 1,
1.432577, -1.661073, 3.027389, 1, 0, 0.4392157, 1,
1.463094, -0.3880262, -0.3655939, 1, 0, 0.4313726, 1,
1.463676, 0.1937265, 2.591574, 1, 0, 0.427451, 1,
1.473685, -0.9321241, 0.9225121, 1, 0, 0.4196078, 1,
1.477949, 0.2553329, 1.855645, 1, 0, 0.4156863, 1,
1.486236, 0.1292453, 1.368122, 1, 0, 0.4078431, 1,
1.48883, -0.9507403, 2.734283, 1, 0, 0.4039216, 1,
1.500709, -0.03991928, 2.318454, 1, 0, 0.3960784, 1,
1.514172, 1.167974, 0.3336696, 1, 0, 0.3882353, 1,
1.515439, 0.7904987, -0.4642557, 1, 0, 0.3843137, 1,
1.522303, 1.225091, 1.926926, 1, 0, 0.3764706, 1,
1.526646, 0.06660868, 2.047024, 1, 0, 0.372549, 1,
1.526876, -0.3510741, 3.181476, 1, 0, 0.3647059, 1,
1.527832, 0.1006614, 2.2692, 1, 0, 0.3607843, 1,
1.551182, -0.09221381, 1.878531, 1, 0, 0.3529412, 1,
1.558985, 0.4816547, 1.369314, 1, 0, 0.3490196, 1,
1.564725, 0.6778343, 0.7755332, 1, 0, 0.3411765, 1,
1.580991, 0.3579931, 3.065922, 1, 0, 0.3372549, 1,
1.591466, -2.038143, 1.414795, 1, 0, 0.3294118, 1,
1.594694, 0.6169367, 1.904211, 1, 0, 0.3254902, 1,
1.598115, -1.197499, 2.263101, 1, 0, 0.3176471, 1,
1.604895, -1.024139, 1.550068, 1, 0, 0.3137255, 1,
1.611752, -1.074178, 0.6936025, 1, 0, 0.3058824, 1,
1.618252, 1.377639, 1.961617, 1, 0, 0.2980392, 1,
1.622895, 0.01487478, 0.417634, 1, 0, 0.2941177, 1,
1.641608, -0.3023152, 0.348249, 1, 0, 0.2862745, 1,
1.647406, 1.146918, -0.3375416, 1, 0, 0.282353, 1,
1.661717, -0.07258604, 3.084316, 1, 0, 0.2745098, 1,
1.680019, 1.294436, 3.087343, 1, 0, 0.2705882, 1,
1.686208, 0.3036333, 1.380464, 1, 0, 0.2627451, 1,
1.694583, -0.4241547, 1.220182, 1, 0, 0.2588235, 1,
1.695583, -1.551727, 2.614343, 1, 0, 0.2509804, 1,
1.69785, 0.8040782, 1.046744, 1, 0, 0.2470588, 1,
1.713335, 0.9444574, -0.04117682, 1, 0, 0.2392157, 1,
1.716922, 1.24717, 1.358891, 1, 0, 0.2352941, 1,
1.729805, 1.738964, -0.220694, 1, 0, 0.227451, 1,
1.732802, -0.481499, 1.926092, 1, 0, 0.2235294, 1,
1.737206, 1.070639, -0.2149059, 1, 0, 0.2156863, 1,
1.741024, -0.3113733, 0.5528724, 1, 0, 0.2117647, 1,
1.744465, 0.7265387, -1.513085, 1, 0, 0.2039216, 1,
1.759515, 0.6886809, 1.362701, 1, 0, 0.1960784, 1,
1.788002, -1.229854, 2.011261, 1, 0, 0.1921569, 1,
1.793852, 0.670422, 2.170692, 1, 0, 0.1843137, 1,
1.803735, 1.703614, 0.9818074, 1, 0, 0.1803922, 1,
1.842949, -0.0196429, 3.09607, 1, 0, 0.172549, 1,
1.856525, 0.8707815, 3.358558, 1, 0, 0.1686275, 1,
1.875731, 0.7896153, 0.2665055, 1, 0, 0.1607843, 1,
1.897095, 0.9146545, 2.88607, 1, 0, 0.1568628, 1,
1.910597, 0.03956563, 1.128866, 1, 0, 0.1490196, 1,
1.921337, 0.1372526, 4.672855, 1, 0, 0.145098, 1,
1.932737, 1.370913, 0.1017465, 1, 0, 0.1372549, 1,
1.940278, -1.973246, 3.583087, 1, 0, 0.1333333, 1,
1.960277, 1.320088, -0.5588635, 1, 0, 0.1254902, 1,
1.967443, 0.8350423, 1.359492, 1, 0, 0.1215686, 1,
1.996569, -0.0619303, 2.76541, 1, 0, 0.1137255, 1,
2.04324, -0.9738445, 1.648193, 1, 0, 0.1098039, 1,
2.110383, 0.1371071, 0.1240827, 1, 0, 0.1019608, 1,
2.140116, -1.939903, 2.179627, 1, 0, 0.09411765, 1,
2.151487, -0.5860797, 1.157332, 1, 0, 0.09019608, 1,
2.157213, 0.2927437, 0.3408501, 1, 0, 0.08235294, 1,
2.166977, -2.744386, 2.728937, 1, 0, 0.07843138, 1,
2.195679, 0.5740783, 1.021232, 1, 0, 0.07058824, 1,
2.232169, 2.110168, -0.565742, 1, 0, 0.06666667, 1,
2.396891, 0.645362, 0.9834776, 1, 0, 0.05882353, 1,
2.405041, 0.8445072, 1.305289, 1, 0, 0.05490196, 1,
2.444779, -0.5359284, 0.840098, 1, 0, 0.04705882, 1,
2.492672, 0.9742749, 1.030042, 1, 0, 0.04313726, 1,
2.505294, -0.2437415, 2.161623, 1, 0, 0.03529412, 1,
2.538049, -1.374625, 2.402036, 1, 0, 0.03137255, 1,
2.575314, -0.1645864, 3.462386, 1, 0, 0.02352941, 1,
2.738941, 0.07180898, 1.78723, 1, 0, 0.01960784, 1,
3.055651, 1.000981, -0.3968719, 1, 0, 0.01176471, 1,
3.219813, 1.414457, 2.666993, 1, 0, 0.007843138, 1
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
-0.1783265, -5.398683, -8.125935, 0, -0.5, 0.5, 0.5,
-0.1783265, -5.398683, -8.125935, 1, -0.5, 0.5, 0.5,
-0.1783265, -5.398683, -8.125935, 1, 1.5, 0.5, 0.5,
-0.1783265, -5.398683, -8.125935, 0, 1.5, 0.5, 0.5
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
-4.728435, -0.7252535, -8.125935, 0, -0.5, 0.5, 0.5,
-4.728435, -0.7252535, -8.125935, 1, -0.5, 0.5, 0.5,
-4.728435, -0.7252535, -8.125935, 1, 1.5, 0.5, 0.5,
-4.728435, -0.7252535, -8.125935, 0, 1.5, 0.5, 0.5
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
-4.728435, -5.398683, -0.5708354, 0, -0.5, 0.5, 0.5,
-4.728435, -5.398683, -0.5708354, 1, -0.5, 0.5, 0.5,
-4.728435, -5.398683, -0.5708354, 1, 1.5, 0.5, 0.5,
-4.728435, -5.398683, -0.5708354, 0, 1.5, 0.5, 0.5
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
-3, -4.320199, -6.382451,
3, -4.320199, -6.382451,
-3, -4.320199, -6.382451,
-3, -4.499946, -6.673031,
-2, -4.320199, -6.382451,
-2, -4.499946, -6.673031,
-1, -4.320199, -6.382451,
-1, -4.499946, -6.673031,
0, -4.320199, -6.382451,
0, -4.499946, -6.673031,
1, -4.320199, -6.382451,
1, -4.499946, -6.673031,
2, -4.320199, -6.382451,
2, -4.499946, -6.673031,
3, -4.320199, -6.382451,
3, -4.499946, -6.673031
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
-3, -4.859441, -7.254193, 0, -0.5, 0.5, 0.5,
-3, -4.859441, -7.254193, 1, -0.5, 0.5, 0.5,
-3, -4.859441, -7.254193, 1, 1.5, 0.5, 0.5,
-3, -4.859441, -7.254193, 0, 1.5, 0.5, 0.5,
-2, -4.859441, -7.254193, 0, -0.5, 0.5, 0.5,
-2, -4.859441, -7.254193, 1, -0.5, 0.5, 0.5,
-2, -4.859441, -7.254193, 1, 1.5, 0.5, 0.5,
-2, -4.859441, -7.254193, 0, 1.5, 0.5, 0.5,
-1, -4.859441, -7.254193, 0, -0.5, 0.5, 0.5,
-1, -4.859441, -7.254193, 1, -0.5, 0.5, 0.5,
-1, -4.859441, -7.254193, 1, 1.5, 0.5, 0.5,
-1, -4.859441, -7.254193, 0, 1.5, 0.5, 0.5,
0, -4.859441, -7.254193, 0, -0.5, 0.5, 0.5,
0, -4.859441, -7.254193, 1, -0.5, 0.5, 0.5,
0, -4.859441, -7.254193, 1, 1.5, 0.5, 0.5,
0, -4.859441, -7.254193, 0, 1.5, 0.5, 0.5,
1, -4.859441, -7.254193, 0, -0.5, 0.5, 0.5,
1, -4.859441, -7.254193, 1, -0.5, 0.5, 0.5,
1, -4.859441, -7.254193, 1, 1.5, 0.5, 0.5,
1, -4.859441, -7.254193, 0, 1.5, 0.5, 0.5,
2, -4.859441, -7.254193, 0, -0.5, 0.5, 0.5,
2, -4.859441, -7.254193, 1, -0.5, 0.5, 0.5,
2, -4.859441, -7.254193, 1, 1.5, 0.5, 0.5,
2, -4.859441, -7.254193, 0, 1.5, 0.5, 0.5,
3, -4.859441, -7.254193, 0, -0.5, 0.5, 0.5,
3, -4.859441, -7.254193, 1, -0.5, 0.5, 0.5,
3, -4.859441, -7.254193, 1, 1.5, 0.5, 0.5,
3, -4.859441, -7.254193, 0, 1.5, 0.5, 0.5
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
-3.67841, -4, -6.382451,
-3.67841, 2, -6.382451,
-3.67841, -4, -6.382451,
-3.853414, -4, -6.673031,
-3.67841, -3, -6.382451,
-3.853414, -3, -6.673031,
-3.67841, -2, -6.382451,
-3.853414, -2, -6.673031,
-3.67841, -1, -6.382451,
-3.853414, -1, -6.673031,
-3.67841, 0, -6.382451,
-3.853414, 0, -6.673031,
-3.67841, 1, -6.382451,
-3.853414, 1, -6.673031,
-3.67841, 2, -6.382451,
-3.853414, 2, -6.673031
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
"-4",
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
-4.203422, -4, -7.254193, 0, -0.5, 0.5, 0.5,
-4.203422, -4, -7.254193, 1, -0.5, 0.5, 0.5,
-4.203422, -4, -7.254193, 1, 1.5, 0.5, 0.5,
-4.203422, -4, -7.254193, 0, 1.5, 0.5, 0.5,
-4.203422, -3, -7.254193, 0, -0.5, 0.5, 0.5,
-4.203422, -3, -7.254193, 1, -0.5, 0.5, 0.5,
-4.203422, -3, -7.254193, 1, 1.5, 0.5, 0.5,
-4.203422, -3, -7.254193, 0, 1.5, 0.5, 0.5,
-4.203422, -2, -7.254193, 0, -0.5, 0.5, 0.5,
-4.203422, -2, -7.254193, 1, -0.5, 0.5, 0.5,
-4.203422, -2, -7.254193, 1, 1.5, 0.5, 0.5,
-4.203422, -2, -7.254193, 0, 1.5, 0.5, 0.5,
-4.203422, -1, -7.254193, 0, -0.5, 0.5, 0.5,
-4.203422, -1, -7.254193, 1, -0.5, 0.5, 0.5,
-4.203422, -1, -7.254193, 1, 1.5, 0.5, 0.5,
-4.203422, -1, -7.254193, 0, 1.5, 0.5, 0.5,
-4.203422, 0, -7.254193, 0, -0.5, 0.5, 0.5,
-4.203422, 0, -7.254193, 1, -0.5, 0.5, 0.5,
-4.203422, 0, -7.254193, 1, 1.5, 0.5, 0.5,
-4.203422, 0, -7.254193, 0, 1.5, 0.5, 0.5,
-4.203422, 1, -7.254193, 0, -0.5, 0.5, 0.5,
-4.203422, 1, -7.254193, 1, -0.5, 0.5, 0.5,
-4.203422, 1, -7.254193, 1, 1.5, 0.5, 0.5,
-4.203422, 1, -7.254193, 0, 1.5, 0.5, 0.5,
-4.203422, 2, -7.254193, 0, -0.5, 0.5, 0.5,
-4.203422, 2, -7.254193, 1, -0.5, 0.5, 0.5,
-4.203422, 2, -7.254193, 1, 1.5, 0.5, 0.5,
-4.203422, 2, -7.254193, 0, 1.5, 0.5, 0.5
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
-3.67841, -4.320199, -6,
-3.67841, -4.320199, 4,
-3.67841, -4.320199, -6,
-3.853414, -4.499946, -6,
-3.67841, -4.320199, -4,
-3.853414, -4.499946, -4,
-3.67841, -4.320199, -2,
-3.853414, -4.499946, -2,
-3.67841, -4.320199, 0,
-3.853414, -4.499946, 0,
-3.67841, -4.320199, 2,
-3.853414, -4.499946, 2,
-3.67841, -4.320199, 4,
-3.853414, -4.499946, 4
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
"-6",
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
-4.203422, -4.859441, -6, 0, -0.5, 0.5, 0.5,
-4.203422, -4.859441, -6, 1, -0.5, 0.5, 0.5,
-4.203422, -4.859441, -6, 1, 1.5, 0.5, 0.5,
-4.203422, -4.859441, -6, 0, 1.5, 0.5, 0.5,
-4.203422, -4.859441, -4, 0, -0.5, 0.5, 0.5,
-4.203422, -4.859441, -4, 1, -0.5, 0.5, 0.5,
-4.203422, -4.859441, -4, 1, 1.5, 0.5, 0.5,
-4.203422, -4.859441, -4, 0, 1.5, 0.5, 0.5,
-4.203422, -4.859441, -2, 0, -0.5, 0.5, 0.5,
-4.203422, -4.859441, -2, 1, -0.5, 0.5, 0.5,
-4.203422, -4.859441, -2, 1, 1.5, 0.5, 0.5,
-4.203422, -4.859441, -2, 0, 1.5, 0.5, 0.5,
-4.203422, -4.859441, 0, 0, -0.5, 0.5, 0.5,
-4.203422, -4.859441, 0, 1, -0.5, 0.5, 0.5,
-4.203422, -4.859441, 0, 1, 1.5, 0.5, 0.5,
-4.203422, -4.859441, 0, 0, 1.5, 0.5, 0.5,
-4.203422, -4.859441, 2, 0, -0.5, 0.5, 0.5,
-4.203422, -4.859441, 2, 1, -0.5, 0.5, 0.5,
-4.203422, -4.859441, 2, 1, 1.5, 0.5, 0.5,
-4.203422, -4.859441, 2, 0, 1.5, 0.5, 0.5,
-4.203422, -4.859441, 4, 0, -0.5, 0.5, 0.5,
-4.203422, -4.859441, 4, 1, -0.5, 0.5, 0.5,
-4.203422, -4.859441, 4, 1, 1.5, 0.5, 0.5,
-4.203422, -4.859441, 4, 0, 1.5, 0.5, 0.5
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
-3.67841, -4.320199, -6.382451,
-3.67841, 2.869692, -6.382451,
-3.67841, -4.320199, 5.24078,
-3.67841, 2.869692, 5.24078,
-3.67841, -4.320199, -6.382451,
-3.67841, -4.320199, 5.24078,
-3.67841, 2.869692, -6.382451,
-3.67841, 2.869692, 5.24078,
-3.67841, -4.320199, -6.382451,
3.321757, -4.320199, -6.382451,
-3.67841, -4.320199, 5.24078,
3.321757, -4.320199, 5.24078,
-3.67841, 2.869692, -6.382451,
3.321757, 2.869692, -6.382451,
-3.67841, 2.869692, 5.24078,
3.321757, 2.869692, 5.24078,
3.321757, -4.320199, -6.382451,
3.321757, 2.869692, -6.382451,
3.321757, -4.320199, 5.24078,
3.321757, 2.869692, 5.24078,
3.321757, -4.320199, -6.382451,
3.321757, -4.320199, 5.24078,
3.321757, 2.869692, -6.382451,
3.321757, 2.869692, 5.24078
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
var radius = 8.199625;
var distance = 36.48106;
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
mvMatrix.translate( 0.1783265, 0.7252535, 0.5708354 );
mvMatrix.scale( 1.266483, 1.233064, 0.762748 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.48106);
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
ammonium_sulfamic_ac<-read.table("ammonium_sulfamic_ac.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ammonium_sulfamic_ac$V2
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamic_ac' not found
```

```r
y<-ammonium_sulfamic_ac$V3
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamic_ac' not found
```

```r
z<-ammonium_sulfamic_ac$V4
```

```
## Error in eval(expr, envir, enclos): object 'ammonium_sulfamic_ac' not found
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
-3.576466, -0.8230856, -3.564928, 0, 0, 1, 1, 1,
-2.861365, 0.5741022, -1.154, 1, 0, 0, 1, 1,
-2.781965, 0.6842532, -1.427306, 1, 0, 0, 1, 1,
-2.72412, 0.3926097, -1.02628, 1, 0, 0, 1, 1,
-2.602831, -0.4042034, -3.592424, 1, 0, 0, 1, 1,
-2.55624, 0.4546267, -0.4939328, 1, 0, 0, 1, 1,
-2.497531, -1.478084, -1.384653, 0, 0, 0, 1, 1,
-2.34132, 0.06508438, -0.8705718, 0, 0, 0, 1, 1,
-2.320764, -0.4334267, -0.8721434, 0, 0, 0, 1, 1,
-2.293512, -0.5197513, -1.302345, 0, 0, 0, 1, 1,
-2.235249, -0.2614073, -0.2041222, 0, 0, 0, 1, 1,
-2.228034, 1.450402, -1.189658, 0, 0, 0, 1, 1,
-2.218083, -0.5017797, -0.4307043, 0, 0, 0, 1, 1,
-2.162979, -0.667214, -1.823701, 1, 1, 1, 1, 1,
-2.155349, 0.6704032, -1.633199, 1, 1, 1, 1, 1,
-2.149037, 1.277143, -1.8102, 1, 1, 1, 1, 1,
-2.068173, 0.4574459, -0.8028401, 1, 1, 1, 1, 1,
-2.067454, -1.345419, -1.982248, 1, 1, 1, 1, 1,
-2.033135, -1.792782, -1.512283, 1, 1, 1, 1, 1,
-1.990284, -0.3820162, -0.9723152, 1, 1, 1, 1, 1,
-1.974266, -1.439639, -2.265787, 1, 1, 1, 1, 1,
-1.96525, 0.9747654, -0.145687, 1, 1, 1, 1, 1,
-1.9646, 1.271064, -0.5951648, 1, 1, 1, 1, 1,
-1.918288, -0.1139632, -1.416195, 1, 1, 1, 1, 1,
-1.913049, 0.8471324, 0.1598115, 1, 1, 1, 1, 1,
-1.872533, -0.8668149, -2.567071, 1, 1, 1, 1, 1,
-1.848423, -0.7148409, -1.562632, 1, 1, 1, 1, 1,
-1.84453, -0.2611915, -2.164718, 1, 1, 1, 1, 1,
-1.841641, 0.8070013, 0.6451841, 0, 0, 1, 1, 1,
-1.835161, -1.000283, -1.272666, 1, 0, 0, 1, 1,
-1.82112, -0.2098577, -1.779588, 1, 0, 0, 1, 1,
-1.805341, -0.04118473, -0.7668293, 1, 0, 0, 1, 1,
-1.791029, -2.056366, -2.956089, 1, 0, 0, 1, 1,
-1.778564, -1.737445, -4.713627, 1, 0, 0, 1, 1,
-1.773498, -1.769114, -4.105012, 0, 0, 0, 1, 1,
-1.770124, 0.464897, -2.767587, 0, 0, 0, 1, 1,
-1.763917, -0.9585876, -2.016608, 0, 0, 0, 1, 1,
-1.721942, -1.479882, -1.778861, 0, 0, 0, 1, 1,
-1.701152, -0.981286, -1.673316, 0, 0, 0, 1, 1,
-1.690169, 0.3194179, -0.1282876, 0, 0, 0, 1, 1,
-1.684586, 0.2186963, -0.2372293, 0, 0, 0, 1, 1,
-1.672408, -0.1260965, -3.192666, 1, 1, 1, 1, 1,
-1.671811, 1.199342, -2.97607, 1, 1, 1, 1, 1,
-1.668086, 0.798079, -1.294715, 1, 1, 1, 1, 1,
-1.662054, 0.9894799, -0.5094807, 1, 1, 1, 1, 1,
-1.661455, -0.1661541, -1.881298, 1, 1, 1, 1, 1,
-1.649495, -0.7566507, -1.657167, 1, 1, 1, 1, 1,
-1.649259, 0.7987535, -1.63808, 1, 1, 1, 1, 1,
-1.640597, 0.6650811, -0.6605852, 1, 1, 1, 1, 1,
-1.637615, 0.1200337, -0.9421015, 1, 1, 1, 1, 1,
-1.593728, -0.4830574, -1.098557, 1, 1, 1, 1, 1,
-1.580647, -1.762175, 0.006446146, 1, 1, 1, 1, 1,
-1.578815, 0.5724009, -2.047668, 1, 1, 1, 1, 1,
-1.5765, -0.7716811, -2.643739, 1, 1, 1, 1, 1,
-1.57275, -1.363068, -2.500263, 1, 1, 1, 1, 1,
-1.553518, -0.7697625, -1.316029, 1, 1, 1, 1, 1,
-1.552105, 2.137367, -0.6077461, 0, 0, 1, 1, 1,
-1.550058, 0.3172119, -1.446334, 1, 0, 0, 1, 1,
-1.541066, 0.1704239, -1.559213, 1, 0, 0, 1, 1,
-1.525764, 0.1743775, -1.223185, 1, 0, 0, 1, 1,
-1.516141, -1.628792, -1.842408, 1, 0, 0, 1, 1,
-1.515101, -1.738086, -2.082569, 1, 0, 0, 1, 1,
-1.504354, 1.32434, -0.3334325, 0, 0, 0, 1, 1,
-1.501961, 0.650719, -1.68267, 0, 0, 0, 1, 1,
-1.495398, -1.007396, -2.687297, 0, 0, 0, 1, 1,
-1.493395, 2.764985, -0.3986069, 0, 0, 0, 1, 1,
-1.485484, 0.1416681, -0.4462016, 0, 0, 0, 1, 1,
-1.484183, 0.348186, -0.7522, 0, 0, 0, 1, 1,
-1.466131, 1.679775, 0.9730896, 0, 0, 0, 1, 1,
-1.465137, -1.075063, -2.133075, 1, 1, 1, 1, 1,
-1.442625, -1.283358, -3.371441, 1, 1, 1, 1, 1,
-1.439788, -1.143997, 0.05538439, 1, 1, 1, 1, 1,
-1.432921, 1.865047, 0.3316673, 1, 1, 1, 1, 1,
-1.430456, 0.8149094, -2.707812, 1, 1, 1, 1, 1,
-1.423772, -0.7642899, -3.281491, 1, 1, 1, 1, 1,
-1.423276, 1.029021, -1.959125, 1, 1, 1, 1, 1,
-1.409696, 0.8901142, -0.9807976, 1, 1, 1, 1, 1,
-1.405087, -0.06071352, -2.426628, 1, 1, 1, 1, 1,
-1.404673, 0.09997431, -0.532612, 1, 1, 1, 1, 1,
-1.401013, -0.2774918, -2.745032, 1, 1, 1, 1, 1,
-1.395765, 0.9829797, -0.5988766, 1, 1, 1, 1, 1,
-1.390416, -1.710112, -2.428351, 1, 1, 1, 1, 1,
-1.36573, 0.4167829, -1.6931, 1, 1, 1, 1, 1,
-1.358656, 0.9102781, -0.5281734, 1, 1, 1, 1, 1,
-1.353154, 0.2344973, 0.5694538, 0, 0, 1, 1, 1,
-1.350888, -1.471201, -3.909345, 1, 0, 0, 1, 1,
-1.328269, 0.6696661, -1.305895, 1, 0, 0, 1, 1,
-1.3258, 0.2947837, -1.11762, 1, 0, 0, 1, 1,
-1.32092, -0.3404996, -4.354281, 1, 0, 0, 1, 1,
-1.304586, -0.192069, 0.094294, 1, 0, 0, 1, 1,
-1.293059, 0.1133465, -1.38705, 0, 0, 0, 1, 1,
-1.280898, 0.5242046, -1.232065, 0, 0, 0, 1, 1,
-1.280332, 1.851735, -0.1658661, 0, 0, 0, 1, 1,
-1.279644, -0.3848922, -1.595788, 0, 0, 0, 1, 1,
-1.275375, 0.08967713, -2.700917, 0, 0, 0, 1, 1,
-1.257735, -1.711988, -3.175114, 0, 0, 0, 1, 1,
-1.254798, 0.4459819, -2.608773, 0, 0, 0, 1, 1,
-1.253219, 1.42518, -0.6163674, 1, 1, 1, 1, 1,
-1.25048, -0.1882885, -2.192277, 1, 1, 1, 1, 1,
-1.248879, -0.04822538, -0.08167334, 1, 1, 1, 1, 1,
-1.245259, -0.02024909, -0.999366, 1, 1, 1, 1, 1,
-1.243918, -0.8497495, -1.490944, 1, 1, 1, 1, 1,
-1.240995, -0.7890095, -1.660264, 1, 1, 1, 1, 1,
-1.236252, -1.360383, -2.614729, 1, 1, 1, 1, 1,
-1.233674, -0.06043539, -1.293989, 1, 1, 1, 1, 1,
-1.223753, 0.75004, -1.721715, 1, 1, 1, 1, 1,
-1.223289, -0.1579503, -2.648957, 1, 1, 1, 1, 1,
-1.222558, -0.2478431, -0.9898397, 1, 1, 1, 1, 1,
-1.214034, -0.4162883, -3.207699, 1, 1, 1, 1, 1,
-1.207592, -0.1637115, -0.7423424, 1, 1, 1, 1, 1,
-1.204631, -0.6118495, -1.980018, 1, 1, 1, 1, 1,
-1.196328, 0.4788557, -1.208515, 1, 1, 1, 1, 1,
-1.194092, 1.372249, -0.8336362, 0, 0, 1, 1, 1,
-1.193396, -0.06001299, -1.7144, 1, 0, 0, 1, 1,
-1.181225, -1.270047, -1.395556, 1, 0, 0, 1, 1,
-1.178597, -0.2271995, -2.225184, 1, 0, 0, 1, 1,
-1.178325, -0.8001018, -2.690035, 1, 0, 0, 1, 1,
-1.174605, -0.5297291, -1.706492, 1, 0, 0, 1, 1,
-1.1729, -0.1032872, -2.844382, 0, 0, 0, 1, 1,
-1.156345, -0.451591, -3.217253, 0, 0, 0, 1, 1,
-1.153, 0.6235313, 0.1693325, 0, 0, 0, 1, 1,
-1.152551, 0.8918379, -3.16151, 0, 0, 0, 1, 1,
-1.151787, 1.564292, -1.921522, 0, 0, 0, 1, 1,
-1.144957, 1.374139, -0.403423, 0, 0, 0, 1, 1,
-1.143732, -0.390237, -1.399762, 0, 0, 0, 1, 1,
-1.14027, 1.058868, -0.2375581, 1, 1, 1, 1, 1,
-1.137947, 0.5173796, -0.2344108, 1, 1, 1, 1, 1,
-1.132466, -1.811787, -2.75766, 1, 1, 1, 1, 1,
-1.125576, -0.3800628, -2.470577, 1, 1, 1, 1, 1,
-1.115214, 0.2736561, -1.351965, 1, 1, 1, 1, 1,
-1.112745, 0.6150301, -1.551337, 1, 1, 1, 1, 1,
-1.110232, -1.125293, -3.107687, 1, 1, 1, 1, 1,
-1.109487, 0.369085, -0.7976541, 1, 1, 1, 1, 1,
-1.10781, 0.4270225, -0.8390819, 1, 1, 1, 1, 1,
-1.105695, 1.158077, -2.015735, 1, 1, 1, 1, 1,
-1.10547, 0.1073436, -3.932265, 1, 1, 1, 1, 1,
-1.104152, -0.6216924, -3.747749, 1, 1, 1, 1, 1,
-1.103996, -0.1892109, -1.405706, 1, 1, 1, 1, 1,
-1.100346, 0.4649467, -3.322044, 1, 1, 1, 1, 1,
-1.098059, 0.6523357, -1.569916, 1, 1, 1, 1, 1,
-1.097687, 1.013567, -1.033326, 0, 0, 1, 1, 1,
-1.095742, 1.395397, -1.185167, 1, 0, 0, 1, 1,
-1.085397, -1.28417, -2.139655, 1, 0, 0, 1, 1,
-1.081728, 0.7058504, -0.2423686, 1, 0, 0, 1, 1,
-1.079147, 1.436485, -0.180277, 1, 0, 0, 1, 1,
-1.078346, 0.7399966, -1.450148, 1, 0, 0, 1, 1,
-1.073377, -0.4647274, -2.794712, 0, 0, 0, 1, 1,
-1.069975, 0.6007882, -0.7031973, 0, 0, 0, 1, 1,
-1.066239, 0.8667454, -0.5435455, 0, 0, 0, 1, 1,
-1.063517, 0.7306556, -1.43831, 0, 0, 0, 1, 1,
-1.062755, 2.467671, 1.378889, 0, 0, 0, 1, 1,
-1.052492, -0.8172873, -2.147846, 0, 0, 0, 1, 1,
-1.050034, -2.016536, -1.486639, 0, 0, 0, 1, 1,
-1.04132, -0.5565324, -2.476532, 1, 1, 1, 1, 1,
-1.024967, -0.6755478, -2.272299, 1, 1, 1, 1, 1,
-1.021661, -0.554854, -1.095965, 1, 1, 1, 1, 1,
-1.013621, -1.341618, -1.716783, 1, 1, 1, 1, 1,
-1.007359, -0.7854255, -1.640211, 1, 1, 1, 1, 1,
-1.007164, -0.7522699, -0.8228877, 1, 1, 1, 1, 1,
-1.004068, 0.4118221, -1.680033, 1, 1, 1, 1, 1,
-0.9988158, -0.09090818, -0.2646225, 1, 1, 1, 1, 1,
-0.9986769, -0.597207, -1.179447, 1, 1, 1, 1, 1,
-0.9983512, -0.65452, -2.471449, 1, 1, 1, 1, 1,
-0.9965224, 1.148294, 1.042868, 1, 1, 1, 1, 1,
-0.99457, 0.02440311, -2.189224, 1, 1, 1, 1, 1,
-0.9923891, 0.130074, -1.838692, 1, 1, 1, 1, 1,
-0.9848644, -0.827506, -3.082778, 1, 1, 1, 1, 1,
-0.9844037, 0.8982246, -1.680084, 1, 1, 1, 1, 1,
-0.9812526, 0.1969083, 1.017418, 0, 0, 1, 1, 1,
-0.9751399, -1.193489, -2.002994, 1, 0, 0, 1, 1,
-0.9735394, -0.3864992, -2.988632, 1, 0, 0, 1, 1,
-0.9732839, 0.1213179, -2.06198, 1, 0, 0, 1, 1,
-0.9605714, -0.8803242, -2.223088, 1, 0, 0, 1, 1,
-0.9586182, 0.1656467, -1.310179, 1, 0, 0, 1, 1,
-0.9555563, 0.7577122, -0.3627184, 0, 0, 0, 1, 1,
-0.9552295, 0.1764094, 0.3474745, 0, 0, 0, 1, 1,
-0.9546598, -0.652427, -3.906172, 0, 0, 0, 1, 1,
-0.9525475, -2.044412, -3.319805, 0, 0, 0, 1, 1,
-0.9480217, -0.2355997, -2.416781, 0, 0, 0, 1, 1,
-0.9473286, -0.8227553, 0.02872713, 0, 0, 0, 1, 1,
-0.9410671, 0.948984, -2.085975, 0, 0, 0, 1, 1,
-0.9390392, 0.830493, -3.39504, 1, 1, 1, 1, 1,
-0.9372032, -0.481508, -1.540241, 1, 1, 1, 1, 1,
-0.9310338, 0.2612901, -2.090017, 1, 1, 1, 1, 1,
-0.930771, 1.82489, -1.44506, 1, 1, 1, 1, 1,
-0.9285525, -0.7987171, -3.596586, 1, 1, 1, 1, 1,
-0.9230279, 0.485725, -1.32555, 1, 1, 1, 1, 1,
-0.9208034, -0.3982471, -4.104958, 1, 1, 1, 1, 1,
-0.9156876, 1.479129, -0.109626, 1, 1, 1, 1, 1,
-0.8924605, -1.018422, -2.616237, 1, 1, 1, 1, 1,
-0.8821113, 2.02154, -2.184466, 1, 1, 1, 1, 1,
-0.8803388, 0.2503893, -2.900783, 1, 1, 1, 1, 1,
-0.8790594, 1.978186, 1.265258, 1, 1, 1, 1, 1,
-0.8776413, -0.9732406, -2.299002, 1, 1, 1, 1, 1,
-0.868643, 0.1245254, -2.1682, 1, 1, 1, 1, 1,
-0.8642621, 0.1511124, -1.33255, 1, 1, 1, 1, 1,
-0.8624947, 1.304981, -1.748441, 0, 0, 1, 1, 1,
-0.8581055, 0.009732009, -3.984363, 1, 0, 0, 1, 1,
-0.8504375, 0.1364971, -1.399406, 1, 0, 0, 1, 1,
-0.8503793, 0.541632, -1.003938, 1, 0, 0, 1, 1,
-0.8501651, 0.4179724, -0.5111479, 1, 0, 0, 1, 1,
-0.8481383, 0.5083556, -0.09162441, 1, 0, 0, 1, 1,
-0.8475149, 1.387248, -0.2353114, 0, 0, 0, 1, 1,
-0.8431151, 0.3166195, -1.40374, 0, 0, 0, 1, 1,
-0.8419769, 1.015636, -1.685872, 0, 0, 0, 1, 1,
-0.8412762, -0.5993686, -2.678632, 0, 0, 0, 1, 1,
-0.8398759, -0.6129221, -1.990056, 0, 0, 0, 1, 1,
-0.8294336, 0.7673755, -1.230222, 0, 0, 0, 1, 1,
-0.8272978, 1.1519, -0.1575265, 0, 0, 0, 1, 1,
-0.8260384, -0.2971753, -1.208199, 1, 1, 1, 1, 1,
-0.8193008, -0.04068717, -3.102573, 1, 1, 1, 1, 1,
-0.8163033, 1.141638, 0.728181, 1, 1, 1, 1, 1,
-0.8158938, -0.9009239, -1.745509, 1, 1, 1, 1, 1,
-0.8147935, -1.987517, -2.953926, 1, 1, 1, 1, 1,
-0.8068743, -0.8906708, -1.877499, 1, 1, 1, 1, 1,
-0.8019657, -1.694967, -1.391269, 1, 1, 1, 1, 1,
-0.8009527, -0.1127072, -2.000005, 1, 1, 1, 1, 1,
-0.7977958, 0.5987601, -1.863534, 1, 1, 1, 1, 1,
-0.7965155, -0.09371777, -1.12258, 1, 1, 1, 1, 1,
-0.7963043, 0.2112455, -0.9159222, 1, 1, 1, 1, 1,
-0.7958065, -1.68339, -2.928429, 1, 1, 1, 1, 1,
-0.7953938, -0.01886021, 1.460191, 1, 1, 1, 1, 1,
-0.7946158, -1.343338, -2.049595, 1, 1, 1, 1, 1,
-0.7942458, 0.7054265, -0.8734244, 1, 1, 1, 1, 1,
-0.7910699, 0.8927588, -1.793075, 0, 0, 1, 1, 1,
-0.7898771, -0.03479011, -2.295748, 1, 0, 0, 1, 1,
-0.7884361, -0.6452572, -1.094338, 1, 0, 0, 1, 1,
-0.7857034, 1.185467, -0.7095991, 1, 0, 0, 1, 1,
-0.7855198, -0.9420016, -3.684702, 1, 0, 0, 1, 1,
-0.7783831, 1.092711, -2.460745, 1, 0, 0, 1, 1,
-0.7760597, 1.192866, 0.7179042, 0, 0, 0, 1, 1,
-0.7711112, -1.003201, -3.292025, 0, 0, 0, 1, 1,
-0.7707254, 0.2733561, -2.893344, 0, 0, 0, 1, 1,
-0.7690516, -0.4077951, -1.162682, 0, 0, 0, 1, 1,
-0.768126, -0.09532678, -1.161902, 0, 0, 0, 1, 1,
-0.767289, 1.148705, -0.5888437, 0, 0, 0, 1, 1,
-0.7661378, 1.253304, 0.3766706, 0, 0, 0, 1, 1,
-0.765982, -0.1512459, -1.740657, 1, 1, 1, 1, 1,
-0.7643827, -0.7712128, -0.4189696, 1, 1, 1, 1, 1,
-0.764114, -0.9479409, -2.457107, 1, 1, 1, 1, 1,
-0.7602585, -0.3530199, -2.769953, 1, 1, 1, 1, 1,
-0.75439, -0.8929397, -3.322328, 1, 1, 1, 1, 1,
-0.7519369, 0.8805942, -1.678568, 1, 1, 1, 1, 1,
-0.7462895, 0.714552, -0.5803317, 1, 1, 1, 1, 1,
-0.7451708, -1.073639, -0.6216565, 1, 1, 1, 1, 1,
-0.7427282, -0.3887278, -2.191566, 1, 1, 1, 1, 1,
-0.7356202, -1.346238, -2.388783, 1, 1, 1, 1, 1,
-0.735245, 2.164371, -0.5268852, 1, 1, 1, 1, 1,
-0.7348834, 0.3660775, 0.8438091, 1, 1, 1, 1, 1,
-0.7338868, 0.8164915, 0.1068201, 1, 1, 1, 1, 1,
-0.7328106, 0.1705773, -0.4307409, 1, 1, 1, 1, 1,
-0.7272725, -1.207754, -2.976709, 1, 1, 1, 1, 1,
-0.7246432, -0.2377179, -2.118913, 0, 0, 1, 1, 1,
-0.7187662, 0.0651399, 0.1511144, 1, 0, 0, 1, 1,
-0.7149451, -0.6133581, -2.716294, 1, 0, 0, 1, 1,
-0.7127888, -0.5395555, -2.21456, 1, 0, 0, 1, 1,
-0.7109343, 0.394571, -3.837248, 1, 0, 0, 1, 1,
-0.7032265, 1.480445, -0.3618948, 1, 0, 0, 1, 1,
-0.7031249, 0.2182263, -1.717183, 0, 0, 0, 1, 1,
-0.6918411, 1.466871, 0.4543097, 0, 0, 0, 1, 1,
-0.6916803, -0.100816, -0.137961, 0, 0, 0, 1, 1,
-0.6911159, 0.6343319, 0.3413854, 0, 0, 0, 1, 1,
-0.6893465, -0.9046953, -2.882537, 0, 0, 0, 1, 1,
-0.6877338, 0.2196419, -1.134311, 0, 0, 0, 1, 1,
-0.6866311, 0.1490966, -1.401342, 0, 0, 0, 1, 1,
-0.6794181, 0.2614795, -2.848259, 1, 1, 1, 1, 1,
-0.6783553, 0.003440861, -1.42927, 1, 1, 1, 1, 1,
-0.6750715, -0.3595911, -0.5357744, 1, 1, 1, 1, 1,
-0.6736316, -0.3261484, -2.758398, 1, 1, 1, 1, 1,
-0.6705111, -0.5132609, -1.319387, 1, 1, 1, 1, 1,
-0.6634619, 0.5515911, 1.343854, 1, 1, 1, 1, 1,
-0.6601687, -0.6321865, -2.979656, 1, 1, 1, 1, 1,
-0.6491335, -0.1573336, -0.5611139, 1, 1, 1, 1, 1,
-0.6466544, -0.0353007, -1.186876, 1, 1, 1, 1, 1,
-0.6454449, -0.7990927, -1.165323, 1, 1, 1, 1, 1,
-0.644261, -0.465015, -1.618879, 1, 1, 1, 1, 1,
-0.6415182, -0.2604068, -2.989797, 1, 1, 1, 1, 1,
-0.6387615, -0.9517472, -2.971191, 1, 1, 1, 1, 1,
-0.6360098, 0.2078933, -2.247259, 1, 1, 1, 1, 1,
-0.6311103, -0.9453297, -2.482334, 1, 1, 1, 1, 1,
-0.6283821, -0.8008961, -2.354775, 0, 0, 1, 1, 1,
-0.6268911, 1.414233, -0.6296535, 1, 0, 0, 1, 1,
-0.6255985, 0.04950016, -3.201522, 1, 0, 0, 1, 1,
-0.6212158, 0.3225641, -1.690995, 1, 0, 0, 1, 1,
-0.6187634, 0.7675316, -1.085118, 1, 0, 0, 1, 1,
-0.6151417, 0.8463048, -0.8211342, 1, 0, 0, 1, 1,
-0.6121198, -0.7344298, -1.724253, 0, 0, 0, 1, 1,
-0.6116585, 0.1107358, -1.695408, 0, 0, 0, 1, 1,
-0.6110652, -1.088865, -1.92204, 0, 0, 0, 1, 1,
-0.6075422, -0.5144392, -1.607468, 0, 0, 0, 1, 1,
-0.6075009, 1.294612, 0.2486219, 0, 0, 0, 1, 1,
-0.6055495, 0.6500641, -1.238358, 0, 0, 0, 1, 1,
-0.6053705, -2.519847, -2.397298, 0, 0, 0, 1, 1,
-0.6052518, 2.464042, -0.8472583, 1, 1, 1, 1, 1,
-0.6049916, 0.1668448, -1.437535, 1, 1, 1, 1, 1,
-0.604453, 0.3608411, -0.2413895, 1, 1, 1, 1, 1,
-0.6033626, 1.039704, 0.8425325, 1, 1, 1, 1, 1,
-0.6019509, 2.117847, -1.878545, 1, 1, 1, 1, 1,
-0.6018913, -1.03132, -4.515866, 1, 1, 1, 1, 1,
-0.5952052, -0.4977033, -1.716603, 1, 1, 1, 1, 1,
-0.5941426, 1.096067, -1.14324, 1, 1, 1, 1, 1,
-0.5899152, 1.276454, -1.031913, 1, 1, 1, 1, 1,
-0.5892047, -0.8716639, -2.454327, 1, 1, 1, 1, 1,
-0.5874643, 0.6162614, 1.239815, 1, 1, 1, 1, 1,
-0.5844012, -1.583949, -2.289936, 1, 1, 1, 1, 1,
-0.5837522, -0.315372, -2.12758, 1, 1, 1, 1, 1,
-0.5824704, -1.490868, -2.912693, 1, 1, 1, 1, 1,
-0.5801739, 1.379495, -0.526143, 1, 1, 1, 1, 1,
-0.5798337, -1.573635, -2.406392, 0, 0, 1, 1, 1,
-0.5757359, -0.7798288, -1.333632, 1, 0, 0, 1, 1,
-0.5755203, 0.3984176, -1.216711, 1, 0, 0, 1, 1,
-0.5753792, 0.508975, -0.6243526, 1, 0, 0, 1, 1,
-0.5717331, 0.07566422, -1.560758, 1, 0, 0, 1, 1,
-0.569698, -0.4858187, -4.371899, 1, 0, 0, 1, 1,
-0.5627269, -0.4866415, -1.703584, 0, 0, 0, 1, 1,
-0.5621811, -0.3277103, -2.234511, 0, 0, 0, 1, 1,
-0.551227, 0.3302067, -0.9687967, 0, 0, 0, 1, 1,
-0.5474373, 0.7055539, -0.9256904, 0, 0, 0, 1, 1,
-0.5473372, -1.401117, -1.908528, 0, 0, 0, 1, 1,
-0.5462433, 0.02454806, -0.8881335, 0, 0, 0, 1, 1,
-0.5430289, -2.530211, -2.420149, 0, 0, 0, 1, 1,
-0.5401331, 0.1105599, -0.9236062, 1, 1, 1, 1, 1,
-0.5370665, 0.02334194, -1.070318, 1, 1, 1, 1, 1,
-0.5325325, -0.3299213, -1.608136, 1, 1, 1, 1, 1,
-0.5308049, 0.9413666, 0.1822744, 1, 1, 1, 1, 1,
-0.5303185, -0.1883494, -2.150814, 1, 1, 1, 1, 1,
-0.5301242, 1.281257, 1.27024, 1, 1, 1, 1, 1,
-0.5285204, 0.1648555, -1.113186, 1, 1, 1, 1, 1,
-0.5279459, -0.4513348, -3.049602, 1, 1, 1, 1, 1,
-0.5240328, -0.8724076, -4.802069, 1, 1, 1, 1, 1,
-0.5188214, 1.056163, -1.165778, 1, 1, 1, 1, 1,
-0.5111719, -1.672417, -1.555386, 1, 1, 1, 1, 1,
-0.5069999, 0.4969566, -3.105334, 1, 1, 1, 1, 1,
-0.5039027, -0.1262803, -1.781122, 1, 1, 1, 1, 1,
-0.492594, -0.2889952, -2.897187, 1, 1, 1, 1, 1,
-0.4918094, 1.407467, -1.754847, 1, 1, 1, 1, 1,
-0.4892809, 0.8379576, -2.028874, 0, 0, 1, 1, 1,
-0.4814099, -0.009022329, -0.9978684, 1, 0, 0, 1, 1,
-0.4741163, 0.4235293, -1.923043, 1, 0, 0, 1, 1,
-0.4730992, -0.001700522, -3.852026, 1, 0, 0, 1, 1,
-0.4729054, 1.8038, 1.093073, 1, 0, 0, 1, 1,
-0.4707871, -1.186723, -2.155007, 1, 0, 0, 1, 1,
-0.4704166, 1.217822, -0.8191466, 0, 0, 0, 1, 1,
-0.4687476, -2.463846, -3.811807, 0, 0, 0, 1, 1,
-0.468732, -0.1714588, -1.00565, 0, 0, 0, 1, 1,
-0.4685674, 0.3847943, -1.576934, 0, 0, 0, 1, 1,
-0.463925, -1.008887, -1.847766, 0, 0, 0, 1, 1,
-0.4626132, -0.3850437, -3.054493, 0, 0, 0, 1, 1,
-0.4615049, -0.285796, -1.304711, 0, 0, 0, 1, 1,
-0.4608997, 0.1997529, -2.641619, 1, 1, 1, 1, 1,
-0.4574616, 0.5747906, -1.706019, 1, 1, 1, 1, 1,
-0.4566102, -1.761545, -3.056731, 1, 1, 1, 1, 1,
-0.4508204, -1.809854, -4.542154, 1, 1, 1, 1, 1,
-0.450619, 1.322245, -0.2445041, 1, 1, 1, 1, 1,
-0.4503207, -0.5004461, -1.106892, 1, 1, 1, 1, 1,
-0.4469951, 0.5911213, -1.684687, 1, 1, 1, 1, 1,
-0.4446006, -0.6332441, -1.949868, 1, 1, 1, 1, 1,
-0.4427462, 0.05786314, -1.67172, 1, 1, 1, 1, 1,
-0.4417713, 0.9373246, -2.516501, 1, 1, 1, 1, 1,
-0.4414897, -1.468396, -2.431353, 1, 1, 1, 1, 1,
-0.4400742, 0.7907732, -0.1978962, 1, 1, 1, 1, 1,
-0.4285939, -0.210593, -4.316399, 1, 1, 1, 1, 1,
-0.4270442, -2.154411, -3.753826, 1, 1, 1, 1, 1,
-0.4241604, -1.084279, -2.590542, 1, 1, 1, 1, 1,
-0.4226282, -0.8159046, -1.1921, 0, 0, 1, 1, 1,
-0.4192887, 0.4039273, -0.8514807, 1, 0, 0, 1, 1,
-0.4169649, 1.510558, 0.2554633, 1, 0, 0, 1, 1,
-0.4143906, -1.320844, -2.735263, 1, 0, 0, 1, 1,
-0.4086179, 0.533601, -1.233559, 1, 0, 0, 1, 1,
-0.406394, 0.2985622, -0.6328824, 1, 0, 0, 1, 1,
-0.4056129, -0.01065456, -2.09018, 0, 0, 0, 1, 1,
-0.4050902, -0.03030895, -1.310721, 0, 0, 0, 1, 1,
-0.4025296, -1.10626, -3.030717, 0, 0, 0, 1, 1,
-0.3995833, 0.1642738, -2.522191, 0, 0, 0, 1, 1,
-0.3961496, -0.4975802, -2.455234, 0, 0, 0, 1, 1,
-0.3922437, 0.8733653, -0.02485724, 0, 0, 0, 1, 1,
-0.3918259, 1.523052, -1.752979, 0, 0, 0, 1, 1,
-0.3918014, 0.9352409, 0.7638199, 1, 1, 1, 1, 1,
-0.3885127, 1.721419, -1.027482, 1, 1, 1, 1, 1,
-0.3862505, 1.100978, 0.4964401, 1, 1, 1, 1, 1,
-0.3858043, 0.9253988, -0.2407474, 1, 1, 1, 1, 1,
-0.3843741, -0.661091, -2.811307, 1, 1, 1, 1, 1,
-0.3750918, -0.1461969, -2.335052, 1, 1, 1, 1, 1,
-0.373024, -2.227481, -2.117897, 1, 1, 1, 1, 1,
-0.3712689, -0.366962, -1.340449, 1, 1, 1, 1, 1,
-0.3672418, -0.9515684, -2.570834, 1, 1, 1, 1, 1,
-0.3650815, -1.621344, -1.820829, 1, 1, 1, 1, 1,
-0.3609605, 0.837521, -1.469487, 1, 1, 1, 1, 1,
-0.3606484, 0.1585205, -1.784536, 1, 1, 1, 1, 1,
-0.3533216, 0.243804, -1.333183, 1, 1, 1, 1, 1,
-0.3397537, 0.3423125, -2.50403, 1, 1, 1, 1, 1,
-0.3387284, -0.9913385, -3.759059, 1, 1, 1, 1, 1,
-0.3382966, 1.331237, 0.4881736, 0, 0, 1, 1, 1,
-0.3363015, 2.291946, 0.01840247, 1, 0, 0, 1, 1,
-0.3304448, -1.038818, -3.200451, 1, 0, 0, 1, 1,
-0.327657, 0.5058924, -0.448418, 1, 0, 0, 1, 1,
-0.3271645, -0.30531, -2.447191, 1, 0, 0, 1, 1,
-0.326667, 0.2697062, -1.100398, 1, 0, 0, 1, 1,
-0.3261266, 0.3110698, -0.977111, 0, 0, 0, 1, 1,
-0.3223889, 0.2313567, -0.2913537, 0, 0, 0, 1, 1,
-0.320256, 0.5330065, 1.42535, 0, 0, 0, 1, 1,
-0.3202205, -0.7390853, -2.768734, 0, 0, 0, 1, 1,
-0.3187586, 0.2244374, -2.093321, 0, 0, 0, 1, 1,
-0.3182774, -0.9187076, -0.9485269, 0, 0, 0, 1, 1,
-0.3092534, 1.027661, 1.039044, 0, 0, 0, 1, 1,
-0.3085034, -1.260189, -1.247714, 1, 1, 1, 1, 1,
-0.3017564, 2.000352, -0.9193068, 1, 1, 1, 1, 1,
-0.2991431, 1.145266, -0.9944926, 1, 1, 1, 1, 1,
-0.2984434, 0.6433138, -0.01493042, 1, 1, 1, 1, 1,
-0.2957892, 0.7719569, -0.03674064, 1, 1, 1, 1, 1,
-0.2938851, -0.4335943, -3.09462, 1, 1, 1, 1, 1,
-0.2915504, 0.7466004, -0.02267977, 1, 1, 1, 1, 1,
-0.2889582, -0.9702701, -2.000224, 1, 1, 1, 1, 1,
-0.2841113, 1.220034, 0.09648661, 1, 1, 1, 1, 1,
-0.2809391, -0.345177, -1.507026, 1, 1, 1, 1, 1,
-0.2781578, 0.3477775, -0.1377233, 1, 1, 1, 1, 1,
-0.2763413, 1.424448, -2.750837, 1, 1, 1, 1, 1,
-0.2751425, -1.030765, -1.707998, 1, 1, 1, 1, 1,
-0.2719273, 2.411003, -0.2573779, 1, 1, 1, 1, 1,
-0.2704088, 0.09448413, -3.070853, 1, 1, 1, 1, 1,
-0.2700545, -1.209593, -3.27785, 0, 0, 1, 1, 1,
-0.268318, 0.5807342, -0.2010721, 1, 0, 0, 1, 1,
-0.2665763, -0.793295, -4.087417, 1, 0, 0, 1, 1,
-0.2649495, -0.7633854, -3.464833, 1, 0, 0, 1, 1,
-0.2643927, 1.304261, 0.9303252, 1, 0, 0, 1, 1,
-0.2641033, 0.6309355, 0.3628154, 1, 0, 0, 1, 1,
-0.2529798, -1.100065, -3.093998, 0, 0, 0, 1, 1,
-0.2510459, 0.9234825, -1.586993, 0, 0, 0, 1, 1,
-0.2506093, -0.5844215, -1.223721, 0, 0, 0, 1, 1,
-0.2475395, 0.3539606, -0.7304046, 0, 0, 0, 1, 1,
-0.2469803, -1.004399, -3.282331, 0, 0, 0, 1, 1,
-0.2435166, -0.4007978, -3.052957, 0, 0, 0, 1, 1,
-0.2372096, -0.7990699, -3.198564, 0, 0, 0, 1, 1,
-0.2367684, -0.3350499, -3.800883, 1, 1, 1, 1, 1,
-0.2363903, 2.209812, -4.246577, 1, 1, 1, 1, 1,
-0.2339729, 0.6009301, -1.169397, 1, 1, 1, 1, 1,
-0.2339219, 0.5232993, -1.35103, 1, 1, 1, 1, 1,
-0.2325799, 1.775605, 0.4511794, 1, 1, 1, 1, 1,
-0.2259978, 0.790328, -0.9187908, 1, 1, 1, 1, 1,
-0.2248615, -1.034637, -2.996001, 1, 1, 1, 1, 1,
-0.2228722, -0.4038028, -2.23038, 1, 1, 1, 1, 1,
-0.2221243, -0.905601, -2.797977, 1, 1, 1, 1, 1,
-0.2202661, -0.5721234, -3.300324, 1, 1, 1, 1, 1,
-0.2197528, -1.016006, -1.294552, 1, 1, 1, 1, 1,
-0.2165974, 0.4575473, -1.887231, 1, 1, 1, 1, 1,
-0.2154227, -1.354421, -3.69035, 1, 1, 1, 1, 1,
-0.2153964, 0.1457773, -1.262239, 1, 1, 1, 1, 1,
-0.2146525, 0.1865863, -0.562718, 1, 1, 1, 1, 1,
-0.2133074, -0.7285151, -3.323324, 0, 0, 1, 1, 1,
-0.2126615, -0.3461892, -2.755589, 1, 0, 0, 1, 1,
-0.2044775, 0.06755581, 0.01370158, 1, 0, 0, 1, 1,
-0.1998706, 1.13228, -0.2480686, 1, 0, 0, 1, 1,
-0.1997788, -0.02906108, -3.149079, 1, 0, 0, 1, 1,
-0.1988892, -0.2178457, -4.470369, 1, 0, 0, 1, 1,
-0.1945268, 0.9017881, 0.1580904, 0, 0, 0, 1, 1,
-0.194429, 0.3407709, -1.2415, 0, 0, 0, 1, 1,
-0.1940542, -0.08966745, -1.337196, 0, 0, 0, 1, 1,
-0.1915888, -0.09797689, -0.7289214, 0, 0, 0, 1, 1,
-0.190617, -0.2265202, -3.3667, 0, 0, 0, 1, 1,
-0.1892752, -1.176426, -2.589359, 0, 0, 0, 1, 1,
-0.1876346, -0.6677003, -2.890096, 0, 0, 0, 1, 1,
-0.1843872, -0.8306246, -4.281338, 1, 1, 1, 1, 1,
-0.1830708, -0.5343195, -1.080422, 1, 1, 1, 1, 1,
-0.1603946, 0.2779612, -0.3207901, 1, 1, 1, 1, 1,
-0.1588861, 0.1755002, 0.07715718, 1, 1, 1, 1, 1,
-0.1537251, -1.054523, -1.943494, 1, 1, 1, 1, 1,
-0.1523134, -0.4595033, -6.21318, 1, 1, 1, 1, 1,
-0.1505605, 1.033108, 1.906368, 1, 1, 1, 1, 1,
-0.1430962, -0.6327234, -3.071796, 1, 1, 1, 1, 1,
-0.1402931, 0.04961306, -1.490274, 1, 1, 1, 1, 1,
-0.1394151, -0.7476833, -2.870073, 1, 1, 1, 1, 1,
-0.1363924, -0.7680859, -3.644774, 1, 1, 1, 1, 1,
-0.1343348, -1.290271, -5.304164, 1, 1, 1, 1, 1,
-0.1290429, 0.02490188, -1.562793, 1, 1, 1, 1, 1,
-0.1260149, 1.542086, -0.3588583, 1, 1, 1, 1, 1,
-0.125694, -0.5304173, -3.162552, 1, 1, 1, 1, 1,
-0.1217473, 0.9523821, -1.009906, 0, 0, 1, 1, 1,
-0.1179642, 0.1083095, 0.8463306, 1, 0, 0, 1, 1,
-0.108572, 0.675378, 1.24877, 1, 0, 0, 1, 1,
-0.1036092, -0.4551872, -3.398357, 1, 0, 0, 1, 1,
-0.1034206, 1.482815, -2.056226, 1, 0, 0, 1, 1,
-0.0898715, 0.6999608, -0.4209672, 1, 0, 0, 1, 1,
-0.0876236, 0.5451941, 1.350764, 0, 0, 0, 1, 1,
-0.08698626, -0.4902567, -2.577352, 0, 0, 0, 1, 1,
-0.08131069, 0.3962744, -1.901892, 0, 0, 0, 1, 1,
-0.08025948, -0.3655947, -3.023838, 0, 0, 0, 1, 1,
-0.07893419, 0.1413099, -0.766252, 0, 0, 0, 1, 1,
-0.07806627, -0.5859569, -3.792228, 0, 0, 0, 1, 1,
-0.07318562, -0.09462135, -2.637266, 0, 0, 0, 1, 1,
-0.07305203, -0.1234645, -3.158551, 1, 1, 1, 1, 1,
-0.07259032, 0.902495, 1.442979, 1, 1, 1, 1, 1,
-0.07194931, -0.3915161, -3.466003, 1, 1, 1, 1, 1,
-0.07063238, 0.7055343, 0.3306173, 1, 1, 1, 1, 1,
-0.06971939, 0.456494, -2.049099, 1, 1, 1, 1, 1,
-0.06961139, -1.365691, -3.229758, 1, 1, 1, 1, 1,
-0.06515852, -1.794609, -3.297684, 1, 1, 1, 1, 1,
-0.06021404, 1.343029, -0.0102877, 1, 1, 1, 1, 1,
-0.05797195, 0.7237484, 0.5236342, 1, 1, 1, 1, 1,
-0.05763628, 0.3323618, -0.3306425, 1, 1, 1, 1, 1,
-0.05649202, -0.4957359, -2.292657, 1, 1, 1, 1, 1,
-0.05319401, -2.478378, -3.412182, 1, 1, 1, 1, 1,
-0.04746901, 0.3192025, 0.796369, 1, 1, 1, 1, 1,
-0.04661425, 0.0252061, -1.150045, 1, 1, 1, 1, 1,
-0.04287876, 0.1536988, -0.6491755, 1, 1, 1, 1, 1,
-0.04183169, 0.5036763, 0.04751595, 0, 0, 1, 1, 1,
-0.03487125, 0.0984322, 1.02862, 1, 0, 0, 1, 1,
-0.03447999, -0.6498584, -2.394669, 1, 0, 0, 1, 1,
-0.03260656, 0.957544, 0.6512746, 1, 0, 0, 1, 1,
-0.02945424, -1.583575, -2.947932, 1, 0, 0, 1, 1,
-0.0239607, 0.6111079, 0.2051138, 1, 0, 0, 1, 1,
-0.02377583, 0.3133537, -0.2897685, 0, 0, 0, 1, 1,
-0.01910638, 0.1882768, 0.8678445, 0, 0, 0, 1, 1,
-0.01903806, 0.7448381, -0.8759977, 0, 0, 0, 1, 1,
-0.01421454, -1.263531, -5.539557, 0, 0, 0, 1, 1,
-0.01102024, 0.01821083, -1.851398, 0, 0, 0, 1, 1,
-0.01099347, 1.233218, 1.980747, 0, 0, 0, 1, 1,
-0.008759691, -0.3860541, -2.387008, 0, 0, 0, 1, 1,
-0.00404892, 0.7515697, 0.3218827, 1, 1, 1, 1, 1,
-0.002277304, 0.1021872, -0.366368, 1, 1, 1, 1, 1,
8.55898e-05, 0.2482891, 1.90977, 1, 1, 1, 1, 1,
0.003856544, 0.09217972, -0.4683603, 1, 1, 1, 1, 1,
0.005162986, -0.4110021, 4.34388, 1, 1, 1, 1, 1,
0.005254063, -1.169546, 3.998184, 1, 1, 1, 1, 1,
0.009531124, -0.7911031, 3.127482, 1, 1, 1, 1, 1,
0.01372325, -0.5096819, 3.334338, 1, 1, 1, 1, 1,
0.01879149, 0.5800791, 0.5320823, 1, 1, 1, 1, 1,
0.01931746, 0.8122694, 0.4070512, 1, 1, 1, 1, 1,
0.02690201, -0.1434752, 2.756238, 1, 1, 1, 1, 1,
0.03015955, 0.802724, 0.4049891, 1, 1, 1, 1, 1,
0.03334678, 0.07590893, -0.02598306, 1, 1, 1, 1, 1,
0.0356623, -0.2537615, 3.594105, 1, 1, 1, 1, 1,
0.04154348, 1.433423, 1.358858, 1, 1, 1, 1, 1,
0.04174554, -1.530698, 2.169048, 0, 0, 1, 1, 1,
0.04644116, 1.008817, -1.426144, 1, 0, 0, 1, 1,
0.04730699, -1.1092, 5.071509, 1, 0, 0, 1, 1,
0.04847233, 0.9758041, -0.4560489, 1, 0, 0, 1, 1,
0.05028021, 1.725263, 0.7871655, 1, 0, 0, 1, 1,
0.05944778, 0.8479383, 1.375055, 1, 0, 0, 1, 1,
0.06004103, -0.006851698, 0.5520526, 0, 0, 0, 1, 1,
0.06042051, 0.8482986, -1.301947, 0, 0, 0, 1, 1,
0.06074303, -0.7804339, 2.420937, 0, 0, 0, 1, 1,
0.0617293, 2.144198, -0.5104402, 0, 0, 0, 1, 1,
0.06506407, -1.071823, 3.436174, 0, 0, 0, 1, 1,
0.06640136, -1.353451, 4.074781, 0, 0, 0, 1, 1,
0.06824192, -0.2933994, 1.89839, 0, 0, 0, 1, 1,
0.07475451, 1.18614, 1.023664, 1, 1, 1, 1, 1,
0.07666986, -0.8605841, 4.427819, 1, 1, 1, 1, 1,
0.07859129, -0.006206036, 1.856031, 1, 1, 1, 1, 1,
0.07902921, 0.9208901, 0.4067762, 1, 1, 1, 1, 1,
0.07968309, 0.201315, -0.4176056, 1, 1, 1, 1, 1,
0.08455878, -1.021221, 3.739394, 1, 1, 1, 1, 1,
0.08657911, 0.1724655, 0.6006809, 1, 1, 1, 1, 1,
0.09757861, 0.2573301, -0.342888, 1, 1, 1, 1, 1,
0.09773879, 0.5047904, 0.7527251, 1, 1, 1, 1, 1,
0.09776343, 2.407452, 0.01890569, 1, 1, 1, 1, 1,
0.09817698, -0.4446977, 1.601487, 1, 1, 1, 1, 1,
0.09961567, 1.239441, -0.61854, 1, 1, 1, 1, 1,
0.1026918, 0.7826698, -1.114242, 1, 1, 1, 1, 1,
0.1029722, -0.4891447, 3.779036, 1, 1, 1, 1, 1,
0.1032271, 0.7314131, -1.219183, 1, 1, 1, 1, 1,
0.1065758, 0.3680943, -0.9784753, 0, 0, 1, 1, 1,
0.1098516, -1.750389, 2.530978, 1, 0, 0, 1, 1,
0.1108994, -1.156702, 3.46443, 1, 0, 0, 1, 1,
0.1185864, 0.8833028, 0.1323286, 1, 0, 0, 1, 1,
0.1268303, 0.5261341, 1.853441, 1, 0, 0, 1, 1,
0.1292121, 0.5828243, 1.581994, 1, 0, 0, 1, 1,
0.1308053, -2.293434, 4.152715, 0, 0, 0, 1, 1,
0.132333, 0.5847757, 1.023117, 0, 0, 0, 1, 1,
0.1335941, 0.06942488, 1.714726, 0, 0, 0, 1, 1,
0.1342314, -0.2655948, 2.734172, 0, 0, 0, 1, 1,
0.1369797, -2.456109, 2.483753, 0, 0, 0, 1, 1,
0.1380488, -0.8836954, 0.9856964, 0, 0, 0, 1, 1,
0.1438914, -0.09459744, 1.972865, 0, 0, 0, 1, 1,
0.1447785, -1.159743, 1.299376, 1, 1, 1, 1, 1,
0.1483282, 0.3737115, -0.3420651, 1, 1, 1, 1, 1,
0.1531055, 0.2904726, 0.3564402, 1, 1, 1, 1, 1,
0.1596505, -0.4971364, 2.872557, 1, 1, 1, 1, 1,
0.1603395, -0.1390922, 1.533965, 1, 1, 1, 1, 1,
0.1622711, -0.9627607, 3.404185, 1, 1, 1, 1, 1,
0.1631731, -2.974615, 4.441093, 1, 1, 1, 1, 1,
0.1633602, -0.6214817, 4.343074, 1, 1, 1, 1, 1,
0.1665969, -0.2477605, 4.386357, 1, 1, 1, 1, 1,
0.1703265, -0.6825302, 2.816048, 1, 1, 1, 1, 1,
0.1724868, -1.668287, 2.894858, 1, 1, 1, 1, 1,
0.1735904, 1.064288, -0.4047379, 1, 1, 1, 1, 1,
0.1742109, -0.6908299, 3.240391, 1, 1, 1, 1, 1,
0.1756614, -1.542437, 2.297224, 1, 1, 1, 1, 1,
0.1762336, -0.06199162, 1.980865, 1, 1, 1, 1, 1,
0.177467, -0.4274525, 2.242332, 0, 0, 1, 1, 1,
0.1948874, 0.2808578, -0.7836917, 1, 0, 0, 1, 1,
0.1983637, -0.3331389, 1.552734, 1, 0, 0, 1, 1,
0.203512, 0.7811384, -0.17298, 1, 0, 0, 1, 1,
0.2096365, 0.2327341, 0.9193606, 1, 0, 0, 1, 1,
0.2104316, 0.2946178, 1.364159, 1, 0, 0, 1, 1,
0.2124777, -0.1388932, 2.489262, 0, 0, 0, 1, 1,
0.2136159, 1.17652, 1.503441, 0, 0, 0, 1, 1,
0.2146409, -1.540831, 4.416214, 0, 0, 0, 1, 1,
0.2156566, 0.1455339, 1.014405, 0, 0, 0, 1, 1,
0.2172816, -0.8262622, 4.149483, 0, 0, 0, 1, 1,
0.2195543, 0.7841181, 0.6297992, 0, 0, 0, 1, 1,
0.2252729, -1.790784, 3.924691, 0, 0, 0, 1, 1,
0.2272557, 0.4572033, 2.139128, 1, 1, 1, 1, 1,
0.2282687, -0.1705231, 2.213546, 1, 1, 1, 1, 1,
0.2292317, -1.351587, 4.319277, 1, 1, 1, 1, 1,
0.2293491, 0.5793089, 1.295175, 1, 1, 1, 1, 1,
0.2306072, 0.05563007, 0.9419926, 1, 1, 1, 1, 1,
0.23293, -0.9818998, 1.703485, 1, 1, 1, 1, 1,
0.2346765, -0.127474, 2.514574, 1, 1, 1, 1, 1,
0.2359765, 1.002692, -0.8157451, 1, 1, 1, 1, 1,
0.2380527, -0.6820825, 2.832188, 1, 1, 1, 1, 1,
0.2412343, -0.8706838, 2.765004, 1, 1, 1, 1, 1,
0.2440108, 0.7889226, 1.897299, 1, 1, 1, 1, 1,
0.2447087, -0.6262903, 2.563582, 1, 1, 1, 1, 1,
0.2551804, 0.1856342, 2.924231, 1, 1, 1, 1, 1,
0.2563909, -1.169555, 4.438238, 1, 1, 1, 1, 1,
0.2605916, 1.12984, 1.589958, 1, 1, 1, 1, 1,
0.2627938, -0.08736055, 3.180392, 0, 0, 1, 1, 1,
0.2638824, -0.6478692, 3.113842, 1, 0, 0, 1, 1,
0.2715539, -0.6005773, 2.546201, 1, 0, 0, 1, 1,
0.2715574, 0.03182461, 2.601254, 1, 0, 0, 1, 1,
0.2716064, 0.0926087, 0.09504687, 1, 0, 0, 1, 1,
0.2721916, -0.9542742, 2.103641, 1, 0, 0, 1, 1,
0.273063, 0.9924282, 0.8682932, 0, 0, 0, 1, 1,
0.2781999, -0.3872093, 2.399047, 0, 0, 0, 1, 1,
0.2842903, 0.5440942, 1.646791, 0, 0, 0, 1, 1,
0.2846576, 0.8224835, -0.8203722, 0, 0, 0, 1, 1,
0.2884679, 0.03138938, 1.429442, 0, 0, 0, 1, 1,
0.2940809, -0.3439026, 3.551554, 0, 0, 0, 1, 1,
0.2956888, -1.226422, 1.805385, 0, 0, 0, 1, 1,
0.2958285, -0.2118833, 3.687428, 1, 1, 1, 1, 1,
0.2965225, 1.88242, 0.7968091, 1, 1, 1, 1, 1,
0.2974168, -0.684217, 2.069331, 1, 1, 1, 1, 1,
0.2986189, 0.4329102, 0.6170791, 1, 1, 1, 1, 1,
0.3026946, 0.8229189, 2.366693, 1, 1, 1, 1, 1,
0.3078696, -0.3938991, 1.838075, 1, 1, 1, 1, 1,
0.30797, 0.8748921, 0.0006781924, 1, 1, 1, 1, 1,
0.3102301, 0.2560812, 0.7322555, 1, 1, 1, 1, 1,
0.3111941, 1.335189, -1.700556, 1, 1, 1, 1, 1,
0.3138283, -0.1275376, 3.4744, 1, 1, 1, 1, 1,
0.3139895, 0.5884575, 0.6511903, 1, 1, 1, 1, 1,
0.316716, -1.182312, 2.580916, 1, 1, 1, 1, 1,
0.3253699, 0.8141056, 1.391587, 1, 1, 1, 1, 1,
0.3299774, 0.3548633, -1.187513, 1, 1, 1, 1, 1,
0.3370937, 0.2183924, -0.3950495, 1, 1, 1, 1, 1,
0.3432829, 0.2563154, 0.2378694, 0, 0, 1, 1, 1,
0.351604, 0.391027, 0.5535383, 1, 0, 0, 1, 1,
0.3533979, 1.092414, 0.2017362, 1, 0, 0, 1, 1,
0.3545541, -0.1359894, 2.563931, 1, 0, 0, 1, 1,
0.3603607, 0.3503161, 0.08619037, 1, 0, 0, 1, 1,
0.3634511, -1.326228, 2.409663, 1, 0, 0, 1, 1,
0.3703465, -0.2365893, 0.4676055, 0, 0, 0, 1, 1,
0.372941, 0.3433807, 0.4789328, 0, 0, 0, 1, 1,
0.3776163, 1.189824, -0.8059533, 0, 0, 0, 1, 1,
0.3786541, 0.1626137, -0.6971549, 0, 0, 0, 1, 1,
0.3819602, -0.3264447, 2.640676, 0, 0, 0, 1, 1,
0.3823846, -0.5452334, 1.639177, 0, 0, 0, 1, 1,
0.388209, 0.5636707, 1.465032, 0, 0, 0, 1, 1,
0.3906676, 0.0003138352, 1.00704, 1, 1, 1, 1, 1,
0.3996251, -0.1273951, 1.503873, 1, 1, 1, 1, 1,
0.399771, -1.318058, 2.108711, 1, 1, 1, 1, 1,
0.4038239, -0.2768585, 2.066438, 1, 1, 1, 1, 1,
0.4047143, -1.11911, 2.940851, 1, 1, 1, 1, 1,
0.4049512, -0.1818829, 2.282419, 1, 1, 1, 1, 1,
0.4100194, 2.532126, -1.825563, 1, 1, 1, 1, 1,
0.4153748, -0.2129282, 2.252063, 1, 1, 1, 1, 1,
0.4214774, 0.6514286, -0.6018869, 1, 1, 1, 1, 1,
0.422423, -1.042599, 2.347082, 1, 1, 1, 1, 1,
0.4237562, 0.5560733, 0.5984349, 1, 1, 1, 1, 1,
0.4248294, -1.380188, 1.535261, 1, 1, 1, 1, 1,
0.4252415, -1.196483, 2.586717, 1, 1, 1, 1, 1,
0.425606, 1.611883, 1.102314, 1, 1, 1, 1, 1,
0.4256422, -1.12353, 2.699023, 1, 1, 1, 1, 1,
0.4277405, -0.09861679, -1.277862, 0, 0, 1, 1, 1,
0.4286553, -0.7171902, 3.128445, 1, 0, 0, 1, 1,
0.4316593, 0.3995619, 1.06902, 1, 0, 0, 1, 1,
0.4342305, -0.4075219, 2.673882, 1, 0, 0, 1, 1,
0.4382688, 0.9872823, -0.7382447, 1, 0, 0, 1, 1,
0.4437939, -0.9487722, 2.978366, 1, 0, 0, 1, 1,
0.4444765, -4.215492, 3.793131, 0, 0, 0, 1, 1,
0.4519313, 1.994678, 1.520961, 0, 0, 0, 1, 1,
0.4537078, -0.1134361, 1.186285, 0, 0, 0, 1, 1,
0.4537876, 0.4298306, -1.091421, 0, 0, 0, 1, 1,
0.4590143, 0.5833458, -1.391773, 0, 0, 0, 1, 1,
0.4622216, -0.3822696, 1.24506, 0, 0, 0, 1, 1,
0.4640984, 0.3091895, 0.1339777, 0, 0, 0, 1, 1,
0.4778696, 1.0838, 0.1375097, 1, 1, 1, 1, 1,
0.4784551, 0.590685, -0.3889496, 1, 1, 1, 1, 1,
0.4798841, 0.1803371, 1.260916, 1, 1, 1, 1, 1,
0.482393, -0.4140191, 2.208037, 1, 1, 1, 1, 1,
0.4830475, -0.9813465, 3.099977, 1, 1, 1, 1, 1,
0.4855731, -0.9152464, 1.157271, 1, 1, 1, 1, 1,
0.486546, 1.805856, 0.8671024, 1, 1, 1, 1, 1,
0.4892503, 1.30464, 0.2340361, 1, 1, 1, 1, 1,
0.4895479, 0.3673015, 1.847934, 1, 1, 1, 1, 1,
0.4895602, 0.03455948, 1.914761, 1, 1, 1, 1, 1,
0.4936815, 0.8108929, 1.311721, 1, 1, 1, 1, 1,
0.5060448, -0.3650632, 1.646135, 1, 1, 1, 1, 1,
0.5115548, 0.6976151, 1.05371, 1, 1, 1, 1, 1,
0.5173764, -0.9600803, 4.51625, 1, 1, 1, 1, 1,
0.5201719, -0.7860598, 2.595919, 1, 1, 1, 1, 1,
0.5264056, 0.05877781, 2.239774, 0, 0, 1, 1, 1,
0.527171, 1.660308, 1.700752, 1, 0, 0, 1, 1,
0.5328678, 2.691149, 1.511361, 1, 0, 0, 1, 1,
0.5333976, 2.42032, 1.38302, 1, 0, 0, 1, 1,
0.5343437, 0.415572, -0.7451888, 1, 0, 0, 1, 1,
0.5344305, -2.187323, 3.394557, 1, 0, 0, 1, 1,
0.5379579, 0.6592053, 0.4497473, 0, 0, 0, 1, 1,
0.5396694, 1.757074, 0.6380269, 0, 0, 0, 1, 1,
0.5448312, 0.5536766, 1.962804, 0, 0, 0, 1, 1,
0.5488347, 0.6703409, 0.1892279, 0, 0, 0, 1, 1,
0.5533206, 0.20377, 1.213338, 0, 0, 0, 1, 1,
0.5550208, 0.6750935, -0.1260207, 0, 0, 0, 1, 1,
0.5564215, -0.284495, 2.250756, 0, 0, 0, 1, 1,
0.5571249, -0.5884798, 1.760657, 1, 1, 1, 1, 1,
0.5575836, -0.1146376, 1.673548, 1, 1, 1, 1, 1,
0.5667564, -0.4109481, 2.424105, 1, 1, 1, 1, 1,
0.5729541, -0.541916, 3.313359, 1, 1, 1, 1, 1,
0.5744573, 0.510974, 2.677969, 1, 1, 1, 1, 1,
0.5754896, -1.639949, 3.175806, 1, 1, 1, 1, 1,
0.5755702, -0.1810314, 2.030638, 1, 1, 1, 1, 1,
0.5759479, 0.9002127, 0.9128523, 1, 1, 1, 1, 1,
0.5772327, 0.9542156, -1.638792, 1, 1, 1, 1, 1,
0.5792847, -0.9114058, 0.7673641, 1, 1, 1, 1, 1,
0.5805967, 0.6947759, -0.212495, 1, 1, 1, 1, 1,
0.5865375, -0.1567675, 0.4600182, 1, 1, 1, 1, 1,
0.5866908, 2.104524, -0.8376692, 1, 1, 1, 1, 1,
0.5872787, 0.9378463, -1.253276, 1, 1, 1, 1, 1,
0.5880466, 0.08942652, 2.93813, 1, 1, 1, 1, 1,
0.5894017, -1.756375, 2.91286, 0, 0, 1, 1, 1,
0.5947539, 0.6039151, 1.97329, 1, 0, 0, 1, 1,
0.5959834, -1.671185, 0.5908375, 1, 0, 0, 1, 1,
0.5975166, 1.010418, 2.441296, 1, 0, 0, 1, 1,
0.598121, -2.369263, 1.810267, 1, 0, 0, 1, 1,
0.59851, 0.7637851, 1.250245, 1, 0, 0, 1, 1,
0.6032054, 1.950653, 0.1930342, 0, 0, 0, 1, 1,
0.6057174, 1.03682, 0.9581475, 0, 0, 0, 1, 1,
0.6073215, 1.852452, 0.6688738, 0, 0, 0, 1, 1,
0.6083132, -0.54106, 1.555853, 0, 0, 0, 1, 1,
0.6088461, -1.160168, 0.8466418, 0, 0, 0, 1, 1,
0.6089159, 0.2746296, 0.3233103, 0, 0, 0, 1, 1,
0.611675, 0.1995201, -0.316668, 0, 0, 0, 1, 1,
0.6123571, -1.423286, 2.539018, 1, 1, 1, 1, 1,
0.6128964, 1.383567, -0.5698543, 1, 1, 1, 1, 1,
0.6135107, -0.8181999, 3.078689, 1, 1, 1, 1, 1,
0.615926, 0.7339714, 1.752638, 1, 1, 1, 1, 1,
0.6189818, -0.5169561, 0.3807122, 1, 1, 1, 1, 1,
0.6195548, 0.8377811, -0.2683885, 1, 1, 1, 1, 1,
0.6210819, 1.071038, 0.4685445, 1, 1, 1, 1, 1,
0.6219468, -0.3306112, 2.532272, 1, 1, 1, 1, 1,
0.6232977, -0.1680852, 1.637523, 1, 1, 1, 1, 1,
0.6357772, 2.602337, 0.8954704, 1, 1, 1, 1, 1,
0.6395903, 1.278372, 0.2019788, 1, 1, 1, 1, 1,
0.6447861, -0.3329756, 1.879995, 1, 1, 1, 1, 1,
0.6460038, -0.9118073, 3.019056, 1, 1, 1, 1, 1,
0.6486232, -0.4783913, 2.409137, 1, 1, 1, 1, 1,
0.6507568, 1.16158, 1.034742, 1, 1, 1, 1, 1,
0.6574581, 0.8149604, 0.03503324, 0, 0, 1, 1, 1,
0.6610698, -0.4689015, 4.735115, 1, 0, 0, 1, 1,
0.6626115, -1.368125, 0.518661, 1, 0, 0, 1, 1,
0.6666838, -0.7854463, 0.9077286, 1, 0, 0, 1, 1,
0.669067, -1.354585, 1.914702, 1, 0, 0, 1, 1,
0.6702943, 1.137481, 1.21916, 1, 0, 0, 1, 1,
0.6705926, 0.5002739, 2.568369, 0, 0, 0, 1, 1,
0.6731815, 0.05637054, 0.1287875, 0, 0, 0, 1, 1,
0.6751269, -0.8944336, 2.117986, 0, 0, 0, 1, 1,
0.6769133, 0.5587096, -0.7069058, 0, 0, 0, 1, 1,
0.6800208, -0.2871434, 0.6902739, 0, 0, 0, 1, 1,
0.6818919, 1.850759, 1.253242, 0, 0, 0, 1, 1,
0.6843652, -1.203556, 2.812167, 0, 0, 0, 1, 1,
0.6902806, 0.1780424, 0.5986901, 1, 1, 1, 1, 1,
0.6932848, 1.024482, 1.867221, 1, 1, 1, 1, 1,
0.6994644, 1.064883, 1.673889, 1, 1, 1, 1, 1,
0.7021302, 0.0781702, 1.756139, 1, 1, 1, 1, 1,
0.7045145, -0.5125452, 2.067021, 1, 1, 1, 1, 1,
0.7066813, -0.2373897, 1.987428, 1, 1, 1, 1, 1,
0.7181559, -0.7671785, 1.411271, 1, 1, 1, 1, 1,
0.7204893, -0.885031, 1.238014, 1, 1, 1, 1, 1,
0.7213214, -0.08928266, 2.300489, 1, 1, 1, 1, 1,
0.7243631, 0.0879826, 2.042356, 1, 1, 1, 1, 1,
0.7297325, 0.2725043, 1.594449, 1, 1, 1, 1, 1,
0.7315481, 0.6225222, 0.5847665, 1, 1, 1, 1, 1,
0.7334769, -0.9621531, 0.7326687, 1, 1, 1, 1, 1,
0.73608, -1.360185, 3.460549, 1, 1, 1, 1, 1,
0.7375261, 1.39358, 1.036145, 1, 1, 1, 1, 1,
0.7381424, 0.276254, 0.2905819, 0, 0, 1, 1, 1,
0.7390288, -0.6544293, 2.820137, 1, 0, 0, 1, 1,
0.7392766, -0.1349636, 1.061723, 1, 0, 0, 1, 1,
0.7407936, -0.2456684, 1.543632, 1, 0, 0, 1, 1,
0.7411118, -0.5722582, 4.342374, 1, 0, 0, 1, 1,
0.7426583, -1.051299, 3.314557, 1, 0, 0, 1, 1,
0.7450746, 0.1963514, 1.748756, 0, 0, 0, 1, 1,
0.7558998, -0.4853199, 3.114181, 0, 0, 0, 1, 1,
0.7588729, 0.6783292, 0.861028, 0, 0, 0, 1, 1,
0.7608442, 0.8986001, 1.548897, 0, 0, 0, 1, 1,
0.762593, 0.5127459, 1.889748, 0, 0, 0, 1, 1,
0.7650366, 0.6455529, 0.02679345, 0, 0, 0, 1, 1,
0.7678182, -1.541939, 1.42243, 0, 0, 0, 1, 1,
0.7801057, -1.121385, 2.27329, 1, 1, 1, 1, 1,
0.7835128, -1.963628, 2.615557, 1, 1, 1, 1, 1,
0.7875343, 0.136478, 1.365463, 1, 1, 1, 1, 1,
0.7934223, -1.074017, 1.634886, 1, 1, 1, 1, 1,
0.7944478, 0.1853653, 1.064334, 1, 1, 1, 1, 1,
0.7946134, 1.35661, 1.81527, 1, 1, 1, 1, 1,
0.795166, 0.8653985, 1.190776, 1, 1, 1, 1, 1,
0.8062715, 0.8843351, 1.869591, 1, 1, 1, 1, 1,
0.8151171, -0.4720337, 0.7576486, 1, 1, 1, 1, 1,
0.8207428, 0.9746276, 0.3640588, 1, 1, 1, 1, 1,
0.8288992, -0.3114784, 1.55751, 1, 1, 1, 1, 1,
0.8290923, -0.4114814, 2.898259, 1, 1, 1, 1, 1,
0.839744, 0.4470274, 1.168555, 1, 1, 1, 1, 1,
0.8409449, -0.7752422, 2.903622, 1, 1, 1, 1, 1,
0.8440409, 0.0267193, 1.842828, 1, 1, 1, 1, 1,
0.8446504, -0.5072634, 3.925913, 0, 0, 1, 1, 1,
0.8467123, -1.425755, 2.261892, 1, 0, 0, 1, 1,
0.8519327, 1.527745, -1.040558, 1, 0, 0, 1, 1,
0.8541778, -1.99741, 3.480867, 1, 0, 0, 1, 1,
0.8566846, 1.850003, -0.1287124, 1, 0, 0, 1, 1,
0.868502, -0.9645626, 2.687442, 1, 0, 0, 1, 1,
0.8756849, 0.5242112, 2.1092, 0, 0, 0, 1, 1,
0.8788003, 0.1006623, 2.183616, 0, 0, 0, 1, 1,
0.8909926, -0.1081492, 2.338037, 0, 0, 0, 1, 1,
0.9023132, 0.2245546, 0.773232, 0, 0, 0, 1, 1,
0.9024834, -0.2037362, 1.501863, 0, 0, 0, 1, 1,
0.907798, -1.01771, 3.859699, 0, 0, 0, 1, 1,
0.9123143, -0.5366759, 1.469679, 0, 0, 0, 1, 1,
0.9142975, -1.637164, 2.77843, 1, 1, 1, 1, 1,
0.9160153, 0.7087572, -0.1424055, 1, 1, 1, 1, 1,
0.9278501, 1.327803, 1.210596, 1, 1, 1, 1, 1,
0.9322803, 1.338197, -0.3598863, 1, 1, 1, 1, 1,
0.9377692, -0.3700074, 0.1740647, 1, 1, 1, 1, 1,
0.941512, -2.466551, 2.783973, 1, 1, 1, 1, 1,
0.9417599, -1.538333, 2.284235, 1, 1, 1, 1, 1,
0.9526767, 0.3008822, 0.5175936, 1, 1, 1, 1, 1,
0.9545938, 1.744524, 0.1873644, 1, 1, 1, 1, 1,
0.9557142, 0.8418207, -0.5315326, 1, 1, 1, 1, 1,
0.957283, -1.201311, 1.920415, 1, 1, 1, 1, 1,
0.963948, -0.1920523, 2.695948, 1, 1, 1, 1, 1,
0.9672174, -0.8118008, 2.514115, 1, 1, 1, 1, 1,
0.9724441, 0.4166684, 1.171559, 1, 1, 1, 1, 1,
0.9764525, 1.337685, -0.3454, 1, 1, 1, 1, 1,
0.9803761, -0.9130628, 3.047106, 0, 0, 1, 1, 1,
0.9819109, 0.06923559, 1.180288, 1, 0, 0, 1, 1,
0.9840674, -0.5983771, 2.122188, 1, 0, 0, 1, 1,
0.9892666, 0.09807717, 0.8997195, 1, 0, 0, 1, 1,
0.9921384, -1.104657, 2.057801, 1, 0, 0, 1, 1,
0.9923521, -0.5495893, 2.787175, 1, 0, 0, 1, 1,
0.9969482, 0.4927916, 3.309039, 0, 0, 0, 1, 1,
1.003023, -1.184253, 1.904306, 0, 0, 0, 1, 1,
1.005718, -0.7029648, 2.796906, 0, 0, 0, 1, 1,
1.015718, -0.1814215, -0.2139987, 0, 0, 0, 1, 1,
1.016777, -0.2593363, 1.019308, 0, 0, 0, 1, 1,
1.020149, 1.521437, 0.141709, 0, 0, 0, 1, 1,
1.023937, 0.396365, -0.7924738, 0, 0, 0, 1, 1,
1.026028, -1.417555, 2.904614, 1, 1, 1, 1, 1,
1.027919, -0.7314745, 1.633274, 1, 1, 1, 1, 1,
1.032777, 0.912757, -0.4435671, 1, 1, 1, 1, 1,
1.051259, 0.5869525, 1.751567, 1, 1, 1, 1, 1,
1.05243, -0.7433759, 1.713035, 1, 1, 1, 1, 1,
1.053956, -0.707504, 1.661618, 1, 1, 1, 1, 1,
1.058021, 0.105949, 2.269282, 1, 1, 1, 1, 1,
1.072103, -1.758972, 3.498486, 1, 1, 1, 1, 1,
1.07549, -0.9416386, 4.041426, 1, 1, 1, 1, 1,
1.077036, 1.34123, -0.5959969, 1, 1, 1, 1, 1,
1.080639, 0.2887092, 2.004305, 1, 1, 1, 1, 1,
1.09166, -0.6058978, 1.162411, 1, 1, 1, 1, 1,
1.095123, -0.02984703, 1.366413, 1, 1, 1, 1, 1,
1.096914, -0.8431702, 3.552468, 1, 1, 1, 1, 1,
1.098495, 0.641139, 1.794149, 1, 1, 1, 1, 1,
1.100101, -0.9718565, 1.284162, 0, 0, 1, 1, 1,
1.111493, 0.1145965, 1.367551, 1, 0, 0, 1, 1,
1.113985, 1.166635, 1.100148, 1, 0, 0, 1, 1,
1.11899, 1.217773, 1.701257, 1, 0, 0, 1, 1,
1.120611, 1.470996, 0.9398422, 1, 0, 0, 1, 1,
1.126623, 1.534614, 0.1859752, 1, 0, 0, 1, 1,
1.128387, -0.9745207, 2.068121, 0, 0, 0, 1, 1,
1.140927, -1.40935, 2.670008, 0, 0, 0, 1, 1,
1.141395, -0.495955, 3.148753, 0, 0, 0, 1, 1,
1.149823, -0.4129779, 2.11948, 0, 0, 0, 1, 1,
1.151184, -1.38362, 3.3869, 0, 0, 0, 1, 1,
1.151553, 1.20068, 1.089223, 0, 0, 0, 1, 1,
1.153581, 0.05460287, 1.187422, 0, 0, 0, 1, 1,
1.156321, -0.2084433, 2.662966, 1, 1, 1, 1, 1,
1.163278, -0.6488547, 3.612869, 1, 1, 1, 1, 1,
1.16923, 0.6941321, 1.474794, 1, 1, 1, 1, 1,
1.169818, 0.6456308, 0.7724693, 1, 1, 1, 1, 1,
1.171386, -1.684196, 2.318607, 1, 1, 1, 1, 1,
1.175117, 1.28266, 0.6638052, 1, 1, 1, 1, 1,
1.182814, 2.503393, -0.04976914, 1, 1, 1, 1, 1,
1.183177, -0.8844512, 0.4801646, 1, 1, 1, 1, 1,
1.185531, 1.613986, 0.6079697, 1, 1, 1, 1, 1,
1.186659, -1.037616, 0.8104993, 1, 1, 1, 1, 1,
1.186798, 1.196628, -1.25599, 1, 1, 1, 1, 1,
1.189752, -1.256855, 1.248926, 1, 1, 1, 1, 1,
1.193856, -1.693746, 2.734429, 1, 1, 1, 1, 1,
1.202506, 0.5173203, 1.925185, 1, 1, 1, 1, 1,
1.210356, -0.2988099, 2.815986, 1, 1, 1, 1, 1,
1.232132, -0.2225514, 1.451283, 0, 0, 1, 1, 1,
1.234486, 0.6862038, 0.9824083, 1, 0, 0, 1, 1,
1.251585, -1.671752, 1.237897, 1, 0, 0, 1, 1,
1.254439, -0.8373906, 0.5221939, 1, 0, 0, 1, 1,
1.267879, 1.683742, 0.7897442, 1, 0, 0, 1, 1,
1.272972, 1.035409, 1.05149, 1, 0, 0, 1, 1,
1.27671, -0.1657054, 2.730483, 0, 0, 0, 1, 1,
1.291477, -0.2761564, 2.777806, 0, 0, 0, 1, 1,
1.29357, 0.30882, 1.705962, 0, 0, 0, 1, 1,
1.30269, 0.3331097, 3.312024, 0, 0, 0, 1, 1,
1.307744, -0.9559892, 3.12297, 0, 0, 0, 1, 1,
1.312321, -0.5399011, 2.348702, 0, 0, 0, 1, 1,
1.312824, 1.10639, 0.07566512, 0, 0, 0, 1, 1,
1.32182, 0.7145836, 1.634873, 1, 1, 1, 1, 1,
1.329166, 0.130674, 1.375998, 1, 1, 1, 1, 1,
1.336048, 1.069889, -0.1534192, 1, 1, 1, 1, 1,
1.340838, -0.9689894, 0.7062021, 1, 1, 1, 1, 1,
1.346515, -0.1190798, 0.6216043, 1, 1, 1, 1, 1,
1.357071, 0.06911104, -0.5629532, 1, 1, 1, 1, 1,
1.35814, 1.29028, 1.407566, 1, 1, 1, 1, 1,
1.361624, 0.8354034, 2.109414, 1, 1, 1, 1, 1,
1.372855, 1.757753, -0.1026417, 1, 1, 1, 1, 1,
1.375603, -1.157114, 4.791375, 1, 1, 1, 1, 1,
1.38708, 0.2772163, 1.517735, 1, 1, 1, 1, 1,
1.388484, 0.4278699, 2.280438, 1, 1, 1, 1, 1,
1.403353, 0.6250331, 0.6491929, 1, 1, 1, 1, 1,
1.408868, 1.881083, -0.2856475, 1, 1, 1, 1, 1,
1.409156, 0.7631865, 1.854997, 1, 1, 1, 1, 1,
1.417118, 0.7687134, 2.059089, 0, 0, 1, 1, 1,
1.418408, -0.6480507, 2.417563, 1, 0, 0, 1, 1,
1.421556, 0.8445995, 0.1886662, 1, 0, 0, 1, 1,
1.432577, -1.661073, 3.027389, 1, 0, 0, 1, 1,
1.463094, -0.3880262, -0.3655939, 1, 0, 0, 1, 1,
1.463676, 0.1937265, 2.591574, 1, 0, 0, 1, 1,
1.473685, -0.9321241, 0.9225121, 0, 0, 0, 1, 1,
1.477949, 0.2553329, 1.855645, 0, 0, 0, 1, 1,
1.486236, 0.1292453, 1.368122, 0, 0, 0, 1, 1,
1.48883, -0.9507403, 2.734283, 0, 0, 0, 1, 1,
1.500709, -0.03991928, 2.318454, 0, 0, 0, 1, 1,
1.514172, 1.167974, 0.3336696, 0, 0, 0, 1, 1,
1.515439, 0.7904987, -0.4642557, 0, 0, 0, 1, 1,
1.522303, 1.225091, 1.926926, 1, 1, 1, 1, 1,
1.526646, 0.06660868, 2.047024, 1, 1, 1, 1, 1,
1.526876, -0.3510741, 3.181476, 1, 1, 1, 1, 1,
1.527832, 0.1006614, 2.2692, 1, 1, 1, 1, 1,
1.551182, -0.09221381, 1.878531, 1, 1, 1, 1, 1,
1.558985, 0.4816547, 1.369314, 1, 1, 1, 1, 1,
1.564725, 0.6778343, 0.7755332, 1, 1, 1, 1, 1,
1.580991, 0.3579931, 3.065922, 1, 1, 1, 1, 1,
1.591466, -2.038143, 1.414795, 1, 1, 1, 1, 1,
1.594694, 0.6169367, 1.904211, 1, 1, 1, 1, 1,
1.598115, -1.197499, 2.263101, 1, 1, 1, 1, 1,
1.604895, -1.024139, 1.550068, 1, 1, 1, 1, 1,
1.611752, -1.074178, 0.6936025, 1, 1, 1, 1, 1,
1.618252, 1.377639, 1.961617, 1, 1, 1, 1, 1,
1.622895, 0.01487478, 0.417634, 1, 1, 1, 1, 1,
1.641608, -0.3023152, 0.348249, 0, 0, 1, 1, 1,
1.647406, 1.146918, -0.3375416, 1, 0, 0, 1, 1,
1.661717, -0.07258604, 3.084316, 1, 0, 0, 1, 1,
1.680019, 1.294436, 3.087343, 1, 0, 0, 1, 1,
1.686208, 0.3036333, 1.380464, 1, 0, 0, 1, 1,
1.694583, -0.4241547, 1.220182, 1, 0, 0, 1, 1,
1.695583, -1.551727, 2.614343, 0, 0, 0, 1, 1,
1.69785, 0.8040782, 1.046744, 0, 0, 0, 1, 1,
1.713335, 0.9444574, -0.04117682, 0, 0, 0, 1, 1,
1.716922, 1.24717, 1.358891, 0, 0, 0, 1, 1,
1.729805, 1.738964, -0.220694, 0, 0, 0, 1, 1,
1.732802, -0.481499, 1.926092, 0, 0, 0, 1, 1,
1.737206, 1.070639, -0.2149059, 0, 0, 0, 1, 1,
1.741024, -0.3113733, 0.5528724, 1, 1, 1, 1, 1,
1.744465, 0.7265387, -1.513085, 1, 1, 1, 1, 1,
1.759515, 0.6886809, 1.362701, 1, 1, 1, 1, 1,
1.788002, -1.229854, 2.011261, 1, 1, 1, 1, 1,
1.793852, 0.670422, 2.170692, 1, 1, 1, 1, 1,
1.803735, 1.703614, 0.9818074, 1, 1, 1, 1, 1,
1.842949, -0.0196429, 3.09607, 1, 1, 1, 1, 1,
1.856525, 0.8707815, 3.358558, 1, 1, 1, 1, 1,
1.875731, 0.7896153, 0.2665055, 1, 1, 1, 1, 1,
1.897095, 0.9146545, 2.88607, 1, 1, 1, 1, 1,
1.910597, 0.03956563, 1.128866, 1, 1, 1, 1, 1,
1.921337, 0.1372526, 4.672855, 1, 1, 1, 1, 1,
1.932737, 1.370913, 0.1017465, 1, 1, 1, 1, 1,
1.940278, -1.973246, 3.583087, 1, 1, 1, 1, 1,
1.960277, 1.320088, -0.5588635, 1, 1, 1, 1, 1,
1.967443, 0.8350423, 1.359492, 0, 0, 1, 1, 1,
1.996569, -0.0619303, 2.76541, 1, 0, 0, 1, 1,
2.04324, -0.9738445, 1.648193, 1, 0, 0, 1, 1,
2.110383, 0.1371071, 0.1240827, 1, 0, 0, 1, 1,
2.140116, -1.939903, 2.179627, 1, 0, 0, 1, 1,
2.151487, -0.5860797, 1.157332, 1, 0, 0, 1, 1,
2.157213, 0.2927437, 0.3408501, 0, 0, 0, 1, 1,
2.166977, -2.744386, 2.728937, 0, 0, 0, 1, 1,
2.195679, 0.5740783, 1.021232, 0, 0, 0, 1, 1,
2.232169, 2.110168, -0.565742, 0, 0, 0, 1, 1,
2.396891, 0.645362, 0.9834776, 0, 0, 0, 1, 1,
2.405041, 0.8445072, 1.305289, 0, 0, 0, 1, 1,
2.444779, -0.5359284, 0.840098, 0, 0, 0, 1, 1,
2.492672, 0.9742749, 1.030042, 1, 1, 1, 1, 1,
2.505294, -0.2437415, 2.161623, 1, 1, 1, 1, 1,
2.538049, -1.374625, 2.402036, 1, 1, 1, 1, 1,
2.575314, -0.1645864, 3.462386, 1, 1, 1, 1, 1,
2.738941, 0.07180898, 1.78723, 1, 1, 1, 1, 1,
3.055651, 1.000981, -0.3968719, 1, 1, 1, 1, 1,
3.219813, 1.414457, 2.666993, 1, 1, 1, 1, 1
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
var radius = 10.05923;
var distance = 35.33263;
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
mvMatrix.translate( 0.1783266, 0.7252535, 0.5708354 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.33263);
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
