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
-3.45137, 1.093695, -0.3656383, 1, 0, 0, 1,
-2.944164, 0.5210329, -1.561047, 1, 0.007843138, 0, 1,
-2.886092, -0.14081, -3.158501, 1, 0.01176471, 0, 1,
-2.869289, -0.7837961, -3.334001, 1, 0.01960784, 0, 1,
-2.818871, -0.7231686, -1.188326, 1, 0.02352941, 0, 1,
-2.758403, -0.0859794, -1.043292, 1, 0.03137255, 0, 1,
-2.742639, -0.331043, -1.826476, 1, 0.03529412, 0, 1,
-2.678991, -0.9648486, -1.483678, 1, 0.04313726, 0, 1,
-2.600321, 0.1462092, -1.454687, 1, 0.04705882, 0, 1,
-2.549652, -0.6074955, -2.549205, 1, 0.05490196, 0, 1,
-2.514888, 1.170235, -2.883786, 1, 0.05882353, 0, 1,
-2.469874, -1.843324, -3.171754, 1, 0.06666667, 0, 1,
-2.442654, 1.447443, -2.42883, 1, 0.07058824, 0, 1,
-2.278138, -1.20036, -4.578537, 1, 0.07843138, 0, 1,
-2.237525, 0.2690278, -0.9949634, 1, 0.08235294, 0, 1,
-2.230774, 1.531569, -0.4402802, 1, 0.09019608, 0, 1,
-2.222966, -0.1076737, -2.439226, 1, 0.09411765, 0, 1,
-2.2028, 1.354784, 0.4067709, 1, 0.1019608, 0, 1,
-2.174033, -0.8423426, -1.097395, 1, 0.1098039, 0, 1,
-2.140128, -0.5272464, -3.815018, 1, 0.1137255, 0, 1,
-2.127954, 0.4016134, -0.6926914, 1, 0.1215686, 0, 1,
-2.127407, 0.728527, -1.796175, 1, 0.1254902, 0, 1,
-2.096889, -0.1238113, -3.406689, 1, 0.1333333, 0, 1,
-2.082003, -0.1636411, -0.6933702, 1, 0.1372549, 0, 1,
-2.066623, 0.7574275, -0.4865998, 1, 0.145098, 0, 1,
-2.042382, 0.7630672, -2.62393, 1, 0.1490196, 0, 1,
-2.038702, -0.1438723, -2.558026, 1, 0.1568628, 0, 1,
-2.01644, -0.7183656, -2.495789, 1, 0.1607843, 0, 1,
-1.992963, 0.3967613, -1.257362, 1, 0.1686275, 0, 1,
-1.992206, 0.07041332, -1.595022, 1, 0.172549, 0, 1,
-1.987244, 0.5129794, -2.395292, 1, 0.1803922, 0, 1,
-1.980728, 0.0001091667, -1.490193, 1, 0.1843137, 0, 1,
-1.973895, 0.1953845, -0.00789822, 1, 0.1921569, 0, 1,
-1.966586, -0.8910336, -0.8399653, 1, 0.1960784, 0, 1,
-1.962858, 0.2189097, -0.1948872, 1, 0.2039216, 0, 1,
-1.911821, 0.4575161, -0.7698162, 1, 0.2117647, 0, 1,
-1.862779, 1.678082, -1.44084, 1, 0.2156863, 0, 1,
-1.855891, 0.02738825, -1.419629, 1, 0.2235294, 0, 1,
-1.817011, 1.254583, -2.489671, 1, 0.227451, 0, 1,
-1.811325, 0.5466792, -0.247122, 1, 0.2352941, 0, 1,
-1.793139, 1.079187, -0.9563238, 1, 0.2392157, 0, 1,
-1.791471, 0.3294976, 0.7114269, 1, 0.2470588, 0, 1,
-1.787129, -0.5885507, -1.02652, 1, 0.2509804, 0, 1,
-1.778834, -0.9131433, -1.002309, 1, 0.2588235, 0, 1,
-1.773858, 0.6217079, 0.6239721, 1, 0.2627451, 0, 1,
-1.768002, 0.4091463, -2.47071, 1, 0.2705882, 0, 1,
-1.756961, 0.5430281, -0.7605247, 1, 0.2745098, 0, 1,
-1.743869, 2.116589, -0.9653577, 1, 0.282353, 0, 1,
-1.737975, -1.025749, -3.21613, 1, 0.2862745, 0, 1,
-1.73329, -0.1225288, -1.857411, 1, 0.2941177, 0, 1,
-1.731655, -1.374429, -2.733223, 1, 0.3019608, 0, 1,
-1.72984, 0.118682, -1.282072, 1, 0.3058824, 0, 1,
-1.728205, 1.736447, -1.471871, 1, 0.3137255, 0, 1,
-1.714793, -1.680403, -1.984223, 1, 0.3176471, 0, 1,
-1.712687, 0.3807719, -0.190396, 1, 0.3254902, 0, 1,
-1.706221, 0.03710965, -1.731016, 1, 0.3294118, 0, 1,
-1.674734, -0.00482002, -1.539578, 1, 0.3372549, 0, 1,
-1.671017, -1.588649, -3.907141, 1, 0.3411765, 0, 1,
-1.665621, -1.451544, -1.740629, 1, 0.3490196, 0, 1,
-1.663408, -0.7174599, -1.059774, 1, 0.3529412, 0, 1,
-1.662915, 1.176049, -1.065699, 1, 0.3607843, 0, 1,
-1.637912, 1.613267, -1.312869, 1, 0.3647059, 0, 1,
-1.625912, 0.601023, -2.263493, 1, 0.372549, 0, 1,
-1.62051, -0.1617118, 0.1905484, 1, 0.3764706, 0, 1,
-1.61607, -0.2030142, -0.8090143, 1, 0.3843137, 0, 1,
-1.613992, 0.6517192, -1.334338, 1, 0.3882353, 0, 1,
-1.61352, -0.1255768, -3.012489, 1, 0.3960784, 0, 1,
-1.593492, -2.75941, -4.079459, 1, 0.4039216, 0, 1,
-1.586366, -0.1883582, -2.397776, 1, 0.4078431, 0, 1,
-1.581106, -0.847571, -1.820784, 1, 0.4156863, 0, 1,
-1.580069, -1.162363, -0.5657839, 1, 0.4196078, 0, 1,
-1.545563, 0.1488763, -3.141244, 1, 0.427451, 0, 1,
-1.545003, -0.6673954, -2.540754, 1, 0.4313726, 0, 1,
-1.544185, 0.02546669, -1.056702, 1, 0.4392157, 0, 1,
-1.537017, 0.7858676, -0.1347582, 1, 0.4431373, 0, 1,
-1.530497, -1.885013, -4.059336, 1, 0.4509804, 0, 1,
-1.522524, 0.7885761, -2.671309, 1, 0.454902, 0, 1,
-1.519806, -0.8936561, -3.259253, 1, 0.4627451, 0, 1,
-1.502139, 0.1947716, -4.005466, 1, 0.4666667, 0, 1,
-1.501073, 0.9157661, -2.499244, 1, 0.4745098, 0, 1,
-1.498343, 1.290501, 0.1088073, 1, 0.4784314, 0, 1,
-1.490924, 0.2857815, -2.271227, 1, 0.4862745, 0, 1,
-1.489537, -0.4814616, -4.105381, 1, 0.4901961, 0, 1,
-1.488336, 0.4767194, 0.07026133, 1, 0.4980392, 0, 1,
-1.485683, 0.2449329, -0.6226934, 1, 0.5058824, 0, 1,
-1.483488, -1.348116, -2.900995, 1, 0.509804, 0, 1,
-1.481455, 1.31793, -0.3513491, 1, 0.5176471, 0, 1,
-1.458377, 0.1483816, -1.779542, 1, 0.5215687, 0, 1,
-1.412335, 0.2943075, -1.516144, 1, 0.5294118, 0, 1,
-1.407974, 0.7898856, -0.04333012, 1, 0.5333334, 0, 1,
-1.403767, 0.6428792, -2.238414, 1, 0.5411765, 0, 1,
-1.398692, 0.7391802, -0.8438387, 1, 0.5450981, 0, 1,
-1.386938, 1.031217, -1.513917, 1, 0.5529412, 0, 1,
-1.38456, -0.05334303, -3.447056, 1, 0.5568628, 0, 1,
-1.380605, -0.7746631, -4.113279, 1, 0.5647059, 0, 1,
-1.380429, -0.7927113, -2.057023, 1, 0.5686275, 0, 1,
-1.379048, -1.052162, -3.018249, 1, 0.5764706, 0, 1,
-1.371385, -0.5597071, -3.403636, 1, 0.5803922, 0, 1,
-1.339994, 0.3925104, -1.301757, 1, 0.5882353, 0, 1,
-1.33094, -0.258756, -1.497799, 1, 0.5921569, 0, 1,
-1.32356, -0.02624748, -0.9292375, 1, 0.6, 0, 1,
-1.31978, 0.07450047, 0.6072795, 1, 0.6078432, 0, 1,
-1.306415, -0.3272456, -2.232091, 1, 0.6117647, 0, 1,
-1.298718, 1.144387, -1.884604, 1, 0.6196079, 0, 1,
-1.296582, 1.197827, -1.974584, 1, 0.6235294, 0, 1,
-1.292266, 1.398851, -0.4744619, 1, 0.6313726, 0, 1,
-1.290518, -0.5643762, -1.950631, 1, 0.6352941, 0, 1,
-1.287113, -0.7868725, -0.1711099, 1, 0.6431373, 0, 1,
-1.280038, -0.03278185, -1.695864, 1, 0.6470588, 0, 1,
-1.268209, -0.1771367, -2.640779, 1, 0.654902, 0, 1,
-1.258707, -1.993052, -2.493925, 1, 0.6588235, 0, 1,
-1.249618, -1.109412, -1.75386, 1, 0.6666667, 0, 1,
-1.243632, -1.501586, -4.39089, 1, 0.6705883, 0, 1,
-1.234057, -0.1696193, -0.08101042, 1, 0.6784314, 0, 1,
-1.230634, -0.1557985, -2.981924, 1, 0.682353, 0, 1,
-1.219677, -1.222288, -2.853294, 1, 0.6901961, 0, 1,
-1.202953, 1.545766, -0.1197685, 1, 0.6941177, 0, 1,
-1.202488, 0.002819952, -2.128948, 1, 0.7019608, 0, 1,
-1.20193, -0.7894319, -2.026865, 1, 0.7098039, 0, 1,
-1.193571, 1.403263, -1.704214, 1, 0.7137255, 0, 1,
-1.189096, -1.025073, -3.251291, 1, 0.7215686, 0, 1,
-1.187464, -1.199518, -0.9692535, 1, 0.7254902, 0, 1,
-1.184046, -0.8554347, -2.427717, 1, 0.7333333, 0, 1,
-1.180658, 1.412135, -0.9029359, 1, 0.7372549, 0, 1,
-1.174836, 0.2693166, -0.5943751, 1, 0.7450981, 0, 1,
-1.16371, 0.5791402, -0.4435532, 1, 0.7490196, 0, 1,
-1.155562, 1.082293, -1.376975, 1, 0.7568628, 0, 1,
-1.151889, -0.00587593, -1.304149, 1, 0.7607843, 0, 1,
-1.151735, -1.559113, -3.418171, 1, 0.7686275, 0, 1,
-1.151361, -1.126868, -2.382719, 1, 0.772549, 0, 1,
-1.146667, -0.01740016, -1.022716, 1, 0.7803922, 0, 1,
-1.146303, 0.8319758, -1.366748, 1, 0.7843137, 0, 1,
-1.140331, -0.1510374, -2.482122, 1, 0.7921569, 0, 1,
-1.138746, 0.3288953, 0.3548161, 1, 0.7960784, 0, 1,
-1.132359, -0.07162984, -1.953832, 1, 0.8039216, 0, 1,
-1.126929, 0.3287322, -1.804775, 1, 0.8117647, 0, 1,
-1.121722, -0.4165453, -2.517025, 1, 0.8156863, 0, 1,
-1.120167, 1.009153, -2.9098, 1, 0.8235294, 0, 1,
-1.111577, 0.8479944, -0.6905966, 1, 0.827451, 0, 1,
-1.108802, -1.03707, -2.442302, 1, 0.8352941, 0, 1,
-1.097365, -2.397096, -2.866424, 1, 0.8392157, 0, 1,
-1.094064, -0.2608437, -3.475422, 1, 0.8470588, 0, 1,
-1.089279, -1.068868, -2.327221, 1, 0.8509804, 0, 1,
-1.087972, -0.4895939, -1.426233, 1, 0.8588235, 0, 1,
-1.086654, -0.5380853, -1.893655, 1, 0.8627451, 0, 1,
-1.084927, -0.8735154, -0.5931736, 1, 0.8705882, 0, 1,
-1.083533, -1.055093, -2.933391, 1, 0.8745098, 0, 1,
-1.076124, -1.264615, -2.041796, 1, 0.8823529, 0, 1,
-1.073189, -0.2374216, -2.183619, 1, 0.8862745, 0, 1,
-1.072183, 0.0109669, -0.7184898, 1, 0.8941177, 0, 1,
-1.070838, -1.469912, -1.697445, 1, 0.8980392, 0, 1,
-1.056345, -1.324831, -3.280252, 1, 0.9058824, 0, 1,
-1.053046, 0.9889268, -0.2640128, 1, 0.9137255, 0, 1,
-1.050857, -0.8242936, -1.680832, 1, 0.9176471, 0, 1,
-1.038669, 0.360658, 0.4414236, 1, 0.9254902, 0, 1,
-1.032372, 0.5273331, -0.6032627, 1, 0.9294118, 0, 1,
-1.025578, 0.008949811, 0.3366152, 1, 0.9372549, 0, 1,
-1.01724, 1.294779, -0.777183, 1, 0.9411765, 0, 1,
-1.015476, 0.1843887, -1.12069, 1, 0.9490196, 0, 1,
-1.015043, 1.524257, -0.2715895, 1, 0.9529412, 0, 1,
-1.013626, -0.5960585, -0.2395084, 1, 0.9607843, 0, 1,
-1.002271, 1.253952, -0.5557463, 1, 0.9647059, 0, 1,
-1.000586, 0.6336579, -2.229942, 1, 0.972549, 0, 1,
-0.9905441, 0.4793777, 0.1254174, 1, 0.9764706, 0, 1,
-0.9873343, 0.872831, -0.6313289, 1, 0.9843137, 0, 1,
-0.9861313, 0.4792858, -2.504696, 1, 0.9882353, 0, 1,
-0.9788044, 0.9737691, -0.1921352, 1, 0.9960784, 0, 1,
-0.9768212, -0.5667864, -2.359802, 0.9960784, 1, 0, 1,
-0.9755796, 0.408693, -2.714261, 0.9921569, 1, 0, 1,
-0.9749392, -0.2387727, -2.421191, 0.9843137, 1, 0, 1,
-0.9746535, -0.8953393, -3.16217, 0.9803922, 1, 0, 1,
-0.9722401, 0.9045843, -1.782914, 0.972549, 1, 0, 1,
-0.9721944, 0.1859634, 0.2039333, 0.9686275, 1, 0, 1,
-0.9624081, 0.9852368, -1.69733, 0.9607843, 1, 0, 1,
-0.9578867, -0.6237918, -3.052406, 0.9568627, 1, 0, 1,
-0.9541225, 1.141786, -1.430703, 0.9490196, 1, 0, 1,
-0.9461077, 0.1128686, -1.180999, 0.945098, 1, 0, 1,
-0.9451794, -0.2005705, -0.5844585, 0.9372549, 1, 0, 1,
-0.9425129, 1.055036, -1.588482, 0.9333333, 1, 0, 1,
-0.9405882, -0.3987727, -2.389207, 0.9254902, 1, 0, 1,
-0.9401171, -1.021575, -1.823666, 0.9215686, 1, 0, 1,
-0.936213, -0.7567798, -3.396294, 0.9137255, 1, 0, 1,
-0.9357121, -0.612348, -3.527415, 0.9098039, 1, 0, 1,
-0.9355679, 0.7703752, -1.726765, 0.9019608, 1, 0, 1,
-0.9344443, -0.6644442, -1.59282, 0.8941177, 1, 0, 1,
-0.9343388, -0.7277061, -1.361662, 0.8901961, 1, 0, 1,
-0.9311329, 1.139655, 0.8768098, 0.8823529, 1, 0, 1,
-0.9293991, 0.3366595, -0.6255265, 0.8784314, 1, 0, 1,
-0.9238526, -0.1240873, -0.01903844, 0.8705882, 1, 0, 1,
-0.9225919, -0.958271, -2.597062, 0.8666667, 1, 0, 1,
-0.916336, 1.186409, 2.939511, 0.8588235, 1, 0, 1,
-0.9105234, 0.003763834, -1.797591, 0.854902, 1, 0, 1,
-0.9082612, 2.086024, -0.6203827, 0.8470588, 1, 0, 1,
-0.9079764, -1.158354, -3.525953, 0.8431373, 1, 0, 1,
-0.903756, -1.071102, -2.89024, 0.8352941, 1, 0, 1,
-0.9017293, 0.01756985, -1.062522, 0.8313726, 1, 0, 1,
-0.9009528, -1.334069, -3.525236, 0.8235294, 1, 0, 1,
-0.8981316, 0.7424544, -0.1414889, 0.8196079, 1, 0, 1,
-0.8960176, -1.512343, -2.936696, 0.8117647, 1, 0, 1,
-0.8944396, 0.2865266, -1.040561, 0.8078431, 1, 0, 1,
-0.8924962, -0.04095421, -1.871944, 0.8, 1, 0, 1,
-0.8922186, 0.2196168, -0.7251679, 0.7921569, 1, 0, 1,
-0.8888662, 1.084349, -2.785485, 0.7882353, 1, 0, 1,
-0.884392, -0.3594992, -1.756358, 0.7803922, 1, 0, 1,
-0.8782226, -2.614478, -3.467223, 0.7764706, 1, 0, 1,
-0.8769665, 1.077601, -1.355784, 0.7686275, 1, 0, 1,
-0.872765, 0.7642198, -0.04883962, 0.7647059, 1, 0, 1,
-0.8624065, 0.5721037, -2.766653, 0.7568628, 1, 0, 1,
-0.8579457, -0.6030518, 0.2131916, 0.7529412, 1, 0, 1,
-0.8511898, -0.534865, -3.130219, 0.7450981, 1, 0, 1,
-0.8449211, -0.5438931, -1.783386, 0.7411765, 1, 0, 1,
-0.8436906, 1.390172, 0.3030616, 0.7333333, 1, 0, 1,
-0.8428088, 0.01268616, -1.272863, 0.7294118, 1, 0, 1,
-0.8340362, -2.260347, -1.960271, 0.7215686, 1, 0, 1,
-0.8323809, -1.867009, -2.061937, 0.7176471, 1, 0, 1,
-0.8230658, -1.247278, -1.326661, 0.7098039, 1, 0, 1,
-0.8220113, 2.420416, 0.5038348, 0.7058824, 1, 0, 1,
-0.8199141, -0.361684, -4.261198, 0.6980392, 1, 0, 1,
-0.8197051, 1.223543, -0.3345232, 0.6901961, 1, 0, 1,
-0.8172766, 0.495977, -2.843433, 0.6862745, 1, 0, 1,
-0.8167694, -0.5641649, -2.811752, 0.6784314, 1, 0, 1,
-0.8122182, -1.773892, -2.176044, 0.6745098, 1, 0, 1,
-0.8071048, 1.327027, -0.6161718, 0.6666667, 1, 0, 1,
-0.8068321, -0.9107265, -4.651315, 0.6627451, 1, 0, 1,
-0.8026826, -0.2384635, -0.5290743, 0.654902, 1, 0, 1,
-0.8020521, -1.472642, -3.582635, 0.6509804, 1, 0, 1,
-0.7984638, -1.109123, -2.095335, 0.6431373, 1, 0, 1,
-0.7929146, -1.106156, -1.920422, 0.6392157, 1, 0, 1,
-0.7911883, -1.055687, -3.048025, 0.6313726, 1, 0, 1,
-0.7902145, -0.3848414, -2.588027, 0.627451, 1, 0, 1,
-0.7891375, 0.4537968, -0.2244533, 0.6196079, 1, 0, 1,
-0.7830084, -1.820941, -2.732437, 0.6156863, 1, 0, 1,
-0.7773045, 0.335574, -1.050236, 0.6078432, 1, 0, 1,
-0.7738061, 3.164264, 0.1699696, 0.6039216, 1, 0, 1,
-0.7582135, 1.100664, 0.3584293, 0.5960785, 1, 0, 1,
-0.7573971, -0.3727049, -2.226463, 0.5882353, 1, 0, 1,
-0.7488119, 1.280439, 0.6904454, 0.5843138, 1, 0, 1,
-0.7474693, -2.170416, -1.474207, 0.5764706, 1, 0, 1,
-0.7442763, 0.9524102, 0.6667315, 0.572549, 1, 0, 1,
-0.7430345, 0.5993299, 0.5618612, 0.5647059, 1, 0, 1,
-0.7427244, -1.117051, -0.9495023, 0.5607843, 1, 0, 1,
-0.7387645, 0.2645035, -0.9329529, 0.5529412, 1, 0, 1,
-0.737542, -0.1517361, -3.243286, 0.5490196, 1, 0, 1,
-0.7267716, 1.825481, 0.2507354, 0.5411765, 1, 0, 1,
-0.7264726, 1.156007, 1.682214, 0.5372549, 1, 0, 1,
-0.723219, -1.539013, -2.648674, 0.5294118, 1, 0, 1,
-0.7181867, -0.6571603, -1.818469, 0.5254902, 1, 0, 1,
-0.7138013, -0.9497547, -3.754368, 0.5176471, 1, 0, 1,
-0.6983551, 2.577758, -2.092115, 0.5137255, 1, 0, 1,
-0.6940169, -0.488803, -1.5925, 0.5058824, 1, 0, 1,
-0.6864192, -1.027899, -1.837821, 0.5019608, 1, 0, 1,
-0.680083, 0.518701, -0.4305457, 0.4941176, 1, 0, 1,
-0.6705952, 0.4231071, -1.597925, 0.4862745, 1, 0, 1,
-0.6613296, 1.577259, 0.2282542, 0.4823529, 1, 0, 1,
-0.6557131, 1.388299, 0.1024052, 0.4745098, 1, 0, 1,
-0.6549761, 0.03361141, -0.04777801, 0.4705882, 1, 0, 1,
-0.6546255, 0.5473928, -0.8760169, 0.4627451, 1, 0, 1,
-0.6537464, 1.682302, -0.1266487, 0.4588235, 1, 0, 1,
-0.6519955, 0.7807043, -2.177717, 0.4509804, 1, 0, 1,
-0.6510747, -1.579777, -3.743212, 0.4470588, 1, 0, 1,
-0.6429976, 0.1297508, -1.242887, 0.4392157, 1, 0, 1,
-0.6390406, -0.1611411, -3.2398, 0.4352941, 1, 0, 1,
-0.6388443, -0.6700581, -1.822832, 0.427451, 1, 0, 1,
-0.6375152, -1.038113, -1.925214, 0.4235294, 1, 0, 1,
-0.6331935, 1.896584, 0.7635285, 0.4156863, 1, 0, 1,
-0.6312416, -0.1052986, -0.9716483, 0.4117647, 1, 0, 1,
-0.629564, 0.7494766, -1.338519, 0.4039216, 1, 0, 1,
-0.6288803, -0.7670206, -0.9402196, 0.3960784, 1, 0, 1,
-0.6255817, 0.5296448, -1.588523, 0.3921569, 1, 0, 1,
-0.6222973, 0.01138643, -1.028271, 0.3843137, 1, 0, 1,
-0.6218528, -0.5952696, -3.208504, 0.3803922, 1, 0, 1,
-0.6216999, 0.3781762, 0.1009618, 0.372549, 1, 0, 1,
-0.6195552, -0.7796413, -2.0357, 0.3686275, 1, 0, 1,
-0.6166418, -0.2053545, -2.501015, 0.3607843, 1, 0, 1,
-0.6143741, 0.2342552, -0.6040146, 0.3568628, 1, 0, 1,
-0.6139112, -0.03249861, -1.364444, 0.3490196, 1, 0, 1,
-0.6119058, -0.9589561, -1.319921, 0.345098, 1, 0, 1,
-0.60879, 0.05289029, -0.5403583, 0.3372549, 1, 0, 1,
-0.6061568, -0.2031746, -2.930654, 0.3333333, 1, 0, 1,
-0.6059408, -0.1568826, -0.595616, 0.3254902, 1, 0, 1,
-0.5995354, 0.234408, -1.149903, 0.3215686, 1, 0, 1,
-0.5971282, 0.768041, -0.7640077, 0.3137255, 1, 0, 1,
-0.5961182, -0.8338138, -1.347991, 0.3098039, 1, 0, 1,
-0.5934023, 0.1056276, -1.920903, 0.3019608, 1, 0, 1,
-0.5886789, 1.452025, 0.8061242, 0.2941177, 1, 0, 1,
-0.5872096, -1.030396, -0.7530205, 0.2901961, 1, 0, 1,
-0.5860693, -0.919917, -1.027552, 0.282353, 1, 0, 1,
-0.5860347, 0.4480673, -0.2122272, 0.2784314, 1, 0, 1,
-0.584982, 0.4514686, 0.1265091, 0.2705882, 1, 0, 1,
-0.5832613, -2.279088, -3.836789, 0.2666667, 1, 0, 1,
-0.5819926, 0.3167852, -0.05901439, 0.2588235, 1, 0, 1,
-0.5794369, -1.157411, -0.9904553, 0.254902, 1, 0, 1,
-0.577184, 1.129004, -0.3388439, 0.2470588, 1, 0, 1,
-0.5767285, 0.1461018, -2.411642, 0.2431373, 1, 0, 1,
-0.5694523, 1.368214, -0.4616293, 0.2352941, 1, 0, 1,
-0.5694111, -3.084613, -2.768873, 0.2313726, 1, 0, 1,
-0.5597937, 1.861699, 0.2349877, 0.2235294, 1, 0, 1,
-0.5557091, 0.1308516, -0.560256, 0.2196078, 1, 0, 1,
-0.5551133, 1.304785, -0.1550764, 0.2117647, 1, 0, 1,
-0.5545811, -1.17255, -3.538569, 0.2078431, 1, 0, 1,
-0.5536697, 0.9546456, -0.8978819, 0.2, 1, 0, 1,
-0.5532698, -1.941971, -2.920438, 0.1921569, 1, 0, 1,
-0.5528563, 0.4132376, -2.325011, 0.1882353, 1, 0, 1,
-0.5527077, 0.4523319, -0.4504569, 0.1803922, 1, 0, 1,
-0.5523107, 1.164771, 0.109055, 0.1764706, 1, 0, 1,
-0.5464073, 0.6750764, -1.328423, 0.1686275, 1, 0, 1,
-0.543208, -1.190972, -2.778053, 0.1647059, 1, 0, 1,
-0.5426627, -0.8133133, -2.266575, 0.1568628, 1, 0, 1,
-0.5387923, -0.3592986, -0.8002086, 0.1529412, 1, 0, 1,
-0.5386456, 1.274866, 1.193596, 0.145098, 1, 0, 1,
-0.5334186, 0.1344277, -1.033364, 0.1411765, 1, 0, 1,
-0.5332676, 1.354706, 1.378687, 0.1333333, 1, 0, 1,
-0.5313335, -0.9346046, -2.449747, 0.1294118, 1, 0, 1,
-0.5264841, 0.2439746, -2.782921, 0.1215686, 1, 0, 1,
-0.5262361, 0.7871154, -0.2063379, 0.1176471, 1, 0, 1,
-0.5257748, 0.6986268, -1.356212, 0.1098039, 1, 0, 1,
-0.5243544, 0.8072371, -1.741224, 0.1058824, 1, 0, 1,
-0.5239836, -1.630276, -2.947235, 0.09803922, 1, 0, 1,
-0.5229434, -0.02161305, -0.7270803, 0.09019608, 1, 0, 1,
-0.519095, 0.1850438, -1.225078, 0.08627451, 1, 0, 1,
-0.5139869, 0.6753434, -2.01763, 0.07843138, 1, 0, 1,
-0.5131961, -0.1338684, -2.214034, 0.07450981, 1, 0, 1,
-0.5093233, -0.854532, -2.251418, 0.06666667, 1, 0, 1,
-0.5079657, -0.9756364, -2.346454, 0.0627451, 1, 0, 1,
-0.5046487, 0.2396813, -0.6738058, 0.05490196, 1, 0, 1,
-0.5027624, 0.007060757, -2.071973, 0.05098039, 1, 0, 1,
-0.5018024, 0.4738124, -0.5155986, 0.04313726, 1, 0, 1,
-0.5017194, 0.4787864, 1.604468, 0.03921569, 1, 0, 1,
-0.5006558, 1.246974, -0.2355993, 0.03137255, 1, 0, 1,
-0.498645, -0.3519905, -2.437828, 0.02745098, 1, 0, 1,
-0.4983364, 0.412708, -0.403387, 0.01960784, 1, 0, 1,
-0.4891327, -0.7521249, -0.2741954, 0.01568628, 1, 0, 1,
-0.4874785, 0.9169413, -1.654379, 0.007843138, 1, 0, 1,
-0.487373, 0.4142044, -2.081991, 0.003921569, 1, 0, 1,
-0.4852434, -0.07963206, -0.198249, 0, 1, 0.003921569, 1,
-0.4830343, -1.048996, -2.79592, 0, 1, 0.01176471, 1,
-0.4796348, -0.8941561, -2.506595, 0, 1, 0.01568628, 1,
-0.4695372, -0.4506219, -0.7520007, 0, 1, 0.02352941, 1,
-0.4681901, 0.781783, -0.4902916, 0, 1, 0.02745098, 1,
-0.4676408, -1.650842, -2.358095, 0, 1, 0.03529412, 1,
-0.4651802, 0.9486452, -0.2511128, 0, 1, 0.03921569, 1,
-0.4520923, 1.446722, -1.778661, 0, 1, 0.04705882, 1,
-0.4420464, -1.937605, -3.077636, 0, 1, 0.05098039, 1,
-0.4415009, -0.4650361, -1.575299, 0, 1, 0.05882353, 1,
-0.4287034, 2.767088, 0.7205973, 0, 1, 0.0627451, 1,
-0.4273865, 0.4838745, 1.338422, 0, 1, 0.07058824, 1,
-0.4268703, 0.5616366, -1.917005, 0, 1, 0.07450981, 1,
-0.4267198, -3.182533, -3.814214, 0, 1, 0.08235294, 1,
-0.4243612, 0.7686109, -1.210358, 0, 1, 0.08627451, 1,
-0.4209346, 1.101444, 0.4457243, 0, 1, 0.09411765, 1,
-0.41629, -0.03700498, -1.548438, 0, 1, 0.1019608, 1,
-0.4158859, -3.460933, -4.185068, 0, 1, 0.1058824, 1,
-0.4138361, -0.4463934, -3.290511, 0, 1, 0.1137255, 1,
-0.4138046, 0.8829831, 0.2779924, 0, 1, 0.1176471, 1,
-0.4101854, 0.04528164, -2.094076, 0, 1, 0.1254902, 1,
-0.4080392, -2.07567, -3.118441, 0, 1, 0.1294118, 1,
-0.4045927, 1.614763, -1.767892, 0, 1, 0.1372549, 1,
-0.4037424, -2.799135, -2.822837, 0, 1, 0.1411765, 1,
-0.4010839, 1.553765, 0.1318091, 0, 1, 0.1490196, 1,
-0.3948379, -0.8922263, -3.854364, 0, 1, 0.1529412, 1,
-0.3882851, 0.2339062, -1.286535, 0, 1, 0.1607843, 1,
-0.3860779, 0.5042754, -2.304553, 0, 1, 0.1647059, 1,
-0.3857402, 0.6372082, -0.513851, 0, 1, 0.172549, 1,
-0.3855947, 0.8260192, -1.439052, 0, 1, 0.1764706, 1,
-0.38145, -0.8564097, -2.536393, 0, 1, 0.1843137, 1,
-0.3747235, 0.04928862, -1.879877, 0, 1, 0.1882353, 1,
-0.3735991, 0.05325701, -2.053977, 0, 1, 0.1960784, 1,
-0.3686585, 0.5199092, -1.158319, 0, 1, 0.2039216, 1,
-0.3629939, 0.3845541, -0.05619996, 0, 1, 0.2078431, 1,
-0.3626129, -0.3017061, -1.182709, 0, 1, 0.2156863, 1,
-0.3593476, -1.523656, -4.01148, 0, 1, 0.2196078, 1,
-0.3584537, -0.7944034, -4.07306, 0, 1, 0.227451, 1,
-0.3564368, -0.2203389, -1.849085, 0, 1, 0.2313726, 1,
-0.3553827, 0.7268125, 0.2145651, 0, 1, 0.2392157, 1,
-0.3514503, 2.135688, 0.3171972, 0, 1, 0.2431373, 1,
-0.3456531, -0.1166021, -1.696194, 0, 1, 0.2509804, 1,
-0.3454487, 1.239027, -0.4924621, 0, 1, 0.254902, 1,
-0.3451575, -1.657385, -2.600874, 0, 1, 0.2627451, 1,
-0.3366872, -2.15868, -3.893424, 0, 1, 0.2666667, 1,
-0.3358799, 0.03452168, -0.4918281, 0, 1, 0.2745098, 1,
-0.3336282, -0.7121183, -2.401112, 0, 1, 0.2784314, 1,
-0.3316274, 0.5091097, 0.407233, 0, 1, 0.2862745, 1,
-0.3250786, -0.3332294, -1.927577, 0, 1, 0.2901961, 1,
-0.3208496, -1.675063, -3.20521, 0, 1, 0.2980392, 1,
-0.3198756, 0.7150955, 0.5879335, 0, 1, 0.3058824, 1,
-0.3185622, -2.088338, -3.667882, 0, 1, 0.3098039, 1,
-0.3154596, -2.09172, -2.982233, 0, 1, 0.3176471, 1,
-0.3138545, 1.040273, -0.8776973, 0, 1, 0.3215686, 1,
-0.3121457, 0.0534278, -0.8737357, 0, 1, 0.3294118, 1,
-0.3107699, 0.1909204, 0.2756184, 0, 1, 0.3333333, 1,
-0.3081318, -2.206048, -2.429534, 0, 1, 0.3411765, 1,
-0.3066622, -1.071301, -1.865619, 0, 1, 0.345098, 1,
-0.302381, -1.510206, -3.218448, 0, 1, 0.3529412, 1,
-0.3010665, -0.2823691, -1.631769, 0, 1, 0.3568628, 1,
-0.3001955, 1.975393, -0.07303006, 0, 1, 0.3647059, 1,
-0.2968812, 2.010794, 1.112112, 0, 1, 0.3686275, 1,
-0.2964939, -1.624473, -4.114573, 0, 1, 0.3764706, 1,
-0.2958385, 0.02412053, -0.7459279, 0, 1, 0.3803922, 1,
-0.2938401, -2.114018, -4.129591, 0, 1, 0.3882353, 1,
-0.2934726, -0.08706512, -0.1866191, 0, 1, 0.3921569, 1,
-0.2932416, -0.2637236, -2.769991, 0, 1, 0.4, 1,
-0.2887465, -0.6495573, -2.610832, 0, 1, 0.4078431, 1,
-0.288288, -0.3091526, -2.435712, 0, 1, 0.4117647, 1,
-0.2856272, 2.445904, -1.699924, 0, 1, 0.4196078, 1,
-0.2833482, 0.3681885, -0.07229391, 0, 1, 0.4235294, 1,
-0.2818477, 2.232241, -0.9102905, 0, 1, 0.4313726, 1,
-0.2804092, -0.1845914, -2.113682, 0, 1, 0.4352941, 1,
-0.2797647, -0.2869053, -2.621457, 0, 1, 0.4431373, 1,
-0.2779628, -1.789516, -2.189891, 0, 1, 0.4470588, 1,
-0.2747184, 0.7949355, -0.7004964, 0, 1, 0.454902, 1,
-0.2680787, 1.432006, 0.4721429, 0, 1, 0.4588235, 1,
-0.2665674, 1.073017, -1.006484, 0, 1, 0.4666667, 1,
-0.2640725, 0.1055004, -2.861868, 0, 1, 0.4705882, 1,
-0.2628534, 2.003287, 0.6362468, 0, 1, 0.4784314, 1,
-0.2569059, 0.6300725, 2.4128, 0, 1, 0.4823529, 1,
-0.252222, 0.346084, 1.156155, 0, 1, 0.4901961, 1,
-0.2477819, 0.7525576, 0.6275056, 0, 1, 0.4941176, 1,
-0.2473262, 1.178327, -0.6016721, 0, 1, 0.5019608, 1,
-0.2456173, -2.095762, -3.28831, 0, 1, 0.509804, 1,
-0.2450509, -0.02706566, -3.268159, 0, 1, 0.5137255, 1,
-0.2408618, 0.7969512, -0.09640453, 0, 1, 0.5215687, 1,
-0.2310895, -1.066025, -1.467617, 0, 1, 0.5254902, 1,
-0.2273712, -0.7152447, -2.833779, 0, 1, 0.5333334, 1,
-0.2260106, -1.172742, -1.985416, 0, 1, 0.5372549, 1,
-0.2244636, 0.5765197, -2.071849, 0, 1, 0.5450981, 1,
-0.2223268, 0.08524949, -0.7956558, 0, 1, 0.5490196, 1,
-0.2218157, 0.4906851, 0.7736923, 0, 1, 0.5568628, 1,
-0.2207809, 0.1097498, -2.182639, 0, 1, 0.5607843, 1,
-0.217941, -0.2152043, -4.600716, 0, 1, 0.5686275, 1,
-0.2118303, -0.340817, -2.39954, 0, 1, 0.572549, 1,
-0.2116909, 1.429687, -1.706634, 0, 1, 0.5803922, 1,
-0.2057619, -0.2739673, -1.508833, 0, 1, 0.5843138, 1,
-0.2035893, 0.3296993, -0.3785572, 0, 1, 0.5921569, 1,
-0.2003559, -0.2160508, -2.648632, 0, 1, 0.5960785, 1,
-0.1997866, -0.7465955, -4.749343, 0, 1, 0.6039216, 1,
-0.1992762, -0.6424907, -1.151134, 0, 1, 0.6117647, 1,
-0.1990547, 1.112682, 0.08345783, 0, 1, 0.6156863, 1,
-0.1988937, 1.613615, 0.539887, 0, 1, 0.6235294, 1,
-0.1963641, 1.841384, 0.191912, 0, 1, 0.627451, 1,
-0.1963294, -1.606291, -3.780926, 0, 1, 0.6352941, 1,
-0.1926259, -0.1016774, -2.699248, 0, 1, 0.6392157, 1,
-0.1909939, -0.4224139, -1.255638, 0, 1, 0.6470588, 1,
-0.1907586, -0.2566981, -1.406363, 0, 1, 0.6509804, 1,
-0.1902294, -1.152521, -5.509425, 0, 1, 0.6588235, 1,
-0.1878219, -0.4230938, -3.127007, 0, 1, 0.6627451, 1,
-0.1840303, -1.147794, -3.28007, 0, 1, 0.6705883, 1,
-0.1822415, -1.758492, -3.804223, 0, 1, 0.6745098, 1,
-0.17843, 1.533805, -0.2938047, 0, 1, 0.682353, 1,
-0.1774783, -0.6456208, -2.089399, 0, 1, 0.6862745, 1,
-0.1745009, 0.01648265, 0.4205271, 0, 1, 0.6941177, 1,
-0.1713592, 0.07710797, -1.217157, 0, 1, 0.7019608, 1,
-0.163887, -0.2769525, -1.9264, 0, 1, 0.7058824, 1,
-0.1637267, 1.284724, 0.3582562, 0, 1, 0.7137255, 1,
-0.1629594, 1.254911, 0.1510013, 0, 1, 0.7176471, 1,
-0.1617237, -1.325917, -4.233746, 0, 1, 0.7254902, 1,
-0.1612431, 0.9295713, 2.56287, 0, 1, 0.7294118, 1,
-0.1580112, 1.636621, -0.9478328, 0, 1, 0.7372549, 1,
-0.1578896, 0.3257981, -1.943256, 0, 1, 0.7411765, 1,
-0.1555395, -0.7523094, -3.569809, 0, 1, 0.7490196, 1,
-0.1518283, -1.037892, -4.309112, 0, 1, 0.7529412, 1,
-0.1517199, 0.1549082, -2.539557, 0, 1, 0.7607843, 1,
-0.1503491, -0.3379915, -1.701254, 0, 1, 0.7647059, 1,
-0.1492587, -0.9333947, -3.80025, 0, 1, 0.772549, 1,
-0.148696, 0.2085773, -1.907102, 0, 1, 0.7764706, 1,
-0.1486303, -1.04719, -3.573476, 0, 1, 0.7843137, 1,
-0.1483963, 1.535098, -0.3216383, 0, 1, 0.7882353, 1,
-0.1469698, -1.210191, -3.449548, 0, 1, 0.7960784, 1,
-0.1450815, 1.041265, -0.9363279, 0, 1, 0.8039216, 1,
-0.143637, -1.014184, -3.958939, 0, 1, 0.8078431, 1,
-0.1402494, 1.718613, 0.6558723, 0, 1, 0.8156863, 1,
-0.1312661, 1.243301, 1.087447, 0, 1, 0.8196079, 1,
-0.1304703, -0.3432949, -2.628594, 0, 1, 0.827451, 1,
-0.1226972, -1.630889, -3.18259, 0, 1, 0.8313726, 1,
-0.1223401, 0.6910875, -0.4626713, 0, 1, 0.8392157, 1,
-0.1217819, 0.4692042, 0.4759417, 0, 1, 0.8431373, 1,
-0.1187209, -0.1876329, -2.372514, 0, 1, 0.8509804, 1,
-0.1176656, -0.2691443, -3.326886, 0, 1, 0.854902, 1,
-0.1170882, -0.7476133, -2.537265, 0, 1, 0.8627451, 1,
-0.1009563, -0.7525403, -3.733237, 0, 1, 0.8666667, 1,
-0.1003567, -1.370857, -1.974913, 0, 1, 0.8745098, 1,
-0.09841371, 0.130591, -1.155059, 0, 1, 0.8784314, 1,
-0.09478338, -1.410235, -2.745106, 0, 1, 0.8862745, 1,
-0.09283827, -1.2561, -2.598557, 0, 1, 0.8901961, 1,
-0.09220009, 0.5338778, 0.7612826, 0, 1, 0.8980392, 1,
-0.09063808, -0.1765231, -3.060759, 0, 1, 0.9058824, 1,
-0.08955057, -0.4654111, -3.099846, 0, 1, 0.9098039, 1,
-0.0879413, -0.2521576, -2.189898, 0, 1, 0.9176471, 1,
-0.08755653, -0.1103048, -1.978318, 0, 1, 0.9215686, 1,
-0.07674044, -1.969207, -3.041453, 0, 1, 0.9294118, 1,
-0.07279123, 1.427402, 1.055357, 0, 1, 0.9333333, 1,
-0.07185124, -0.3448468, -1.435072, 0, 1, 0.9411765, 1,
-0.07145164, 0.6991384, -1.624247, 0, 1, 0.945098, 1,
-0.06950179, -0.965219, -3.759701, 0, 1, 0.9529412, 1,
-0.06260095, -0.4459796, -2.069406, 0, 1, 0.9568627, 1,
-0.06246486, 1.797913, 0.5368639, 0, 1, 0.9647059, 1,
-0.0610308, -0.01155509, -2.097207, 0, 1, 0.9686275, 1,
-0.06046349, -2.029269, -4.374028, 0, 1, 0.9764706, 1,
-0.05870588, 0.6079552, 0.5301572, 0, 1, 0.9803922, 1,
-0.058539, -0.01409812, -2.119862, 0, 1, 0.9882353, 1,
-0.0561543, 0.5603098, -1.11932, 0, 1, 0.9921569, 1,
-0.05528064, 1.029241, 1.298357, 0, 1, 1, 1,
-0.05387189, 1.269584, -0.9205072, 0, 0.9921569, 1, 1,
-0.05284961, 2.783, 1.270611, 0, 0.9882353, 1, 1,
-0.05022975, 0.6703491, 0.2191946, 0, 0.9803922, 1, 1,
-0.04930775, -0.7336329, -4.137913, 0, 0.9764706, 1, 1,
-0.04840005, 0.8373733, -1.18341, 0, 0.9686275, 1, 1,
-0.04807515, 0.4711624, 0.490895, 0, 0.9647059, 1, 1,
-0.04704858, -0.1425282, -3.53173, 0, 0.9568627, 1, 1,
-0.04696082, -0.1557502, -3.432805, 0, 0.9529412, 1, 1,
-0.04660228, 0.1420161, -1.393526, 0, 0.945098, 1, 1,
-0.04581855, -0.5993047, -3.010136, 0, 0.9411765, 1, 1,
-0.0449544, -0.5021248, -2.295128, 0, 0.9333333, 1, 1,
-0.04246428, 1.076735, -0.08250754, 0, 0.9294118, 1, 1,
-0.04039207, -1.071783, -2.86967, 0, 0.9215686, 1, 1,
-0.03667065, -0.05494159, -1.604562, 0, 0.9176471, 1, 1,
-0.03641018, -0.09065451, -2.856894, 0, 0.9098039, 1, 1,
-0.03177735, 1.1316, 0.7488415, 0, 0.9058824, 1, 1,
-0.03101867, -1.04704, -1.764948, 0, 0.8980392, 1, 1,
-0.02577738, 0.5594096, -0.9868448, 0, 0.8901961, 1, 1,
-0.02373634, -0.7050515, -4.821699, 0, 0.8862745, 1, 1,
-0.02284966, 0.5701088, 0.2701362, 0, 0.8784314, 1, 1,
-0.01743146, 1.792849, 1.063856, 0, 0.8745098, 1, 1,
-0.01696593, -2.574185, -4.260141, 0, 0.8666667, 1, 1,
-0.01480695, 0.06316841, 1.030086, 0, 0.8627451, 1, 1,
-0.01249944, -1.856001, -2.98247, 0, 0.854902, 1, 1,
-0.01091869, 0.4699062, -1.406535, 0, 0.8509804, 1, 1,
-0.009800702, 0.6262007, 1.261086, 0, 0.8431373, 1, 1,
-0.008134166, -0.5684504, -3.91664, 0, 0.8392157, 1, 1,
-0.006115743, -0.0999391, -4.817111, 0, 0.8313726, 1, 1,
-0.004034715, 0.8487832, 0.1093078, 0, 0.827451, 1, 1,
-0.0007068213, -2.457273, -3.951221, 0, 0.8196079, 1, 1,
-3.167321e-05, -0.06357332, -3.113941, 0, 0.8156863, 1, 1,
0.001504823, 2.131723, 1.214171, 0, 0.8078431, 1, 1,
0.006138945, 1.606529, 1.219054, 0, 0.8039216, 1, 1,
0.01078776, 0.5127217, 2.684452, 0, 0.7960784, 1, 1,
0.01220294, -0.7073604, 2.986399, 0, 0.7882353, 1, 1,
0.01461129, 0.640285, 1.154755, 0, 0.7843137, 1, 1,
0.01547438, -0.007259931, 2.497602, 0, 0.7764706, 1, 1,
0.016365, -1.195592, 3.702388, 0, 0.772549, 1, 1,
0.0183455, 0.9599746, -0.7196434, 0, 0.7647059, 1, 1,
0.02095605, 1.305846, 1.208328, 0, 0.7607843, 1, 1,
0.02390051, -1.040105, 2.253287, 0, 0.7529412, 1, 1,
0.02994027, -1.11569, 2.682765, 0, 0.7490196, 1, 1,
0.03854693, 1.546203, 1.607121, 0, 0.7411765, 1, 1,
0.03985026, -0.3046992, 4.270679, 0, 0.7372549, 1, 1,
0.0437215, -1.508615, 3.217566, 0, 0.7294118, 1, 1,
0.0469235, 0.5962981, -0.8295683, 0, 0.7254902, 1, 1,
0.04810274, -0.3925093, 4.281497, 0, 0.7176471, 1, 1,
0.05056919, -0.685357, 1.95687, 0, 0.7137255, 1, 1,
0.05099718, -0.8954399, 1.923204, 0, 0.7058824, 1, 1,
0.05222025, 0.04124038, 1.188626, 0, 0.6980392, 1, 1,
0.0553121, -1.259774, 4.276092, 0, 0.6941177, 1, 1,
0.05762299, -0.3087098, 0.8203745, 0, 0.6862745, 1, 1,
0.06250072, 0.9448324, 1.853989, 0, 0.682353, 1, 1,
0.06302416, -0.2180715, 3.561893, 0, 0.6745098, 1, 1,
0.06603654, 0.2170426, -0.5027891, 0, 0.6705883, 1, 1,
0.07192399, -1.174151, 2.947117, 0, 0.6627451, 1, 1,
0.07552936, 0.1984099, 1.844005, 0, 0.6588235, 1, 1,
0.07724889, 0.913353, -0.6219206, 0, 0.6509804, 1, 1,
0.07756722, -0.2326529, 1.218158, 0, 0.6470588, 1, 1,
0.07827596, 1.246969, -1.05368, 0, 0.6392157, 1, 1,
0.07905385, 1.223327, 0.49261, 0, 0.6352941, 1, 1,
0.07952645, -0.2030873, 2.055464, 0, 0.627451, 1, 1,
0.09081221, -0.2235813, 3.72716, 0, 0.6235294, 1, 1,
0.09282409, -0.2019798, 2.680628, 0, 0.6156863, 1, 1,
0.09369053, 2.469465, -0.6111592, 0, 0.6117647, 1, 1,
0.09476462, 1.492642, 0.7692512, 0, 0.6039216, 1, 1,
0.09606806, 0.4870353, 0.8022189, 0, 0.5960785, 1, 1,
0.09820979, 0.8709153, 0.7869865, 0, 0.5921569, 1, 1,
0.1060232, -1.096833, 4.06585, 0, 0.5843138, 1, 1,
0.106864, 2.138774, 0.0346159, 0, 0.5803922, 1, 1,
0.1099006, 0.3193071, -0.9001523, 0, 0.572549, 1, 1,
0.1107799, 0.521677, 0.6172488, 0, 0.5686275, 1, 1,
0.1125396, 0.4579856, 1.005145, 0, 0.5607843, 1, 1,
0.1155616, -0.6763088, 3.454057, 0, 0.5568628, 1, 1,
0.1163234, 0.6126776, 0.3497065, 0, 0.5490196, 1, 1,
0.1211627, -0.1638943, 2.504117, 0, 0.5450981, 1, 1,
0.1213578, 0.007191931, 1.831122, 0, 0.5372549, 1, 1,
0.1259788, -2.067485, 3.629218, 0, 0.5333334, 1, 1,
0.1286319, 0.1666922, 0.3369074, 0, 0.5254902, 1, 1,
0.1301514, 1.653021, -1.324745, 0, 0.5215687, 1, 1,
0.1310499, -1.615986, 2.725963, 0, 0.5137255, 1, 1,
0.1353903, 0.1060082, 0.8158231, 0, 0.509804, 1, 1,
0.1368104, -0.3049399, 4.48954, 0, 0.5019608, 1, 1,
0.1386428, 0.9930893, -0.3596474, 0, 0.4941176, 1, 1,
0.1422202, -0.9367173, 2.23445, 0, 0.4901961, 1, 1,
0.1458584, -0.5030218, 3.807552, 0, 0.4823529, 1, 1,
0.1502886, 0.995221, -0.4548896, 0, 0.4784314, 1, 1,
0.1569023, -0.08006302, 1.53626, 0, 0.4705882, 1, 1,
0.1587187, -0.5001055, 2.341462, 0, 0.4666667, 1, 1,
0.1596689, -2.234751, 3.867768, 0, 0.4588235, 1, 1,
0.1654196, 0.4463673, -0.1978634, 0, 0.454902, 1, 1,
0.1663324, 1.557147, -0.3981911, 0, 0.4470588, 1, 1,
0.1673891, -1.363426, 3.266556, 0, 0.4431373, 1, 1,
0.1687818, 0.9943409, 0.7404112, 0, 0.4352941, 1, 1,
0.1692246, 0.5632496, 0.5750554, 0, 0.4313726, 1, 1,
0.1704085, -0.2724232, 2.310085, 0, 0.4235294, 1, 1,
0.1716161, -0.2945153, 4.094304, 0, 0.4196078, 1, 1,
0.1723572, -0.2418231, 3.5052, 0, 0.4117647, 1, 1,
0.174601, -1.148341, 1.953903, 0, 0.4078431, 1, 1,
0.1757244, 0.1386535, -0.08419797, 0, 0.4, 1, 1,
0.1777305, -1.54267, 4.891776, 0, 0.3921569, 1, 1,
0.1787586, -0.2364388, 1.862785, 0, 0.3882353, 1, 1,
0.1833644, 0.5032129, -1.296701, 0, 0.3803922, 1, 1,
0.1884589, 0.7039762, -0.4442442, 0, 0.3764706, 1, 1,
0.189444, -0.7405065, 3.566961, 0, 0.3686275, 1, 1,
0.1906281, 1.228052, 1.067482, 0, 0.3647059, 1, 1,
0.1913177, 0.7182723, -0.9156592, 0, 0.3568628, 1, 1,
0.1992095, 0.5989098, 2.181506, 0, 0.3529412, 1, 1,
0.2001023, 0.1984704, 0.3668128, 0, 0.345098, 1, 1,
0.2003343, -0.8384925, 2.482398, 0, 0.3411765, 1, 1,
0.2061762, 0.5602161, -0.3369227, 0, 0.3333333, 1, 1,
0.2216095, 0.3563356, 1.556543, 0, 0.3294118, 1, 1,
0.2245064, 0.228847, -0.4346786, 0, 0.3215686, 1, 1,
0.2260499, -0.8847145, 2.601539, 0, 0.3176471, 1, 1,
0.2281447, 0.7158834, 0.5438637, 0, 0.3098039, 1, 1,
0.2321185, -0.8923397, 1.790563, 0, 0.3058824, 1, 1,
0.23719, -1.209602, 3.802158, 0, 0.2980392, 1, 1,
0.2400174, 1.432036, 0.1201165, 0, 0.2901961, 1, 1,
0.2425853, 1.438798, -1.511605, 0, 0.2862745, 1, 1,
0.2426725, 0.3362581, -0.3867419, 0, 0.2784314, 1, 1,
0.2432818, -0.2349659, 4.093414, 0, 0.2745098, 1, 1,
0.2584941, -0.6205161, 2.247862, 0, 0.2666667, 1, 1,
0.2616214, 1.011769, -0.09337954, 0, 0.2627451, 1, 1,
0.2626778, -2.204623, 2.346378, 0, 0.254902, 1, 1,
0.263998, -1.089381, 1.116519, 0, 0.2509804, 1, 1,
0.2771567, -0.916809, 1.853555, 0, 0.2431373, 1, 1,
0.2775751, -2.03569, 3.122679, 0, 0.2392157, 1, 1,
0.2785263, -0.4197531, 3.354706, 0, 0.2313726, 1, 1,
0.2829857, -0.8685472, 2.198567, 0, 0.227451, 1, 1,
0.283229, -1.022147, 2.693349, 0, 0.2196078, 1, 1,
0.2842253, 0.7841188, -0.8407237, 0, 0.2156863, 1, 1,
0.287644, -0.1948356, -0.2158479, 0, 0.2078431, 1, 1,
0.2919287, 2.049949, -0.04851396, 0, 0.2039216, 1, 1,
0.2937698, -0.02304073, 0.4233198, 0, 0.1960784, 1, 1,
0.3000211, 0.3424489, -0.6272844, 0, 0.1882353, 1, 1,
0.3025985, 1.54875, 0.0651653, 0, 0.1843137, 1, 1,
0.306043, 0.9196571, -0.9839898, 0, 0.1764706, 1, 1,
0.3064764, -0.2140553, 1.784729, 0, 0.172549, 1, 1,
0.3075356, 0.9922298, -0.9334189, 0, 0.1647059, 1, 1,
0.3077582, -0.003301032, 2.065215, 0, 0.1607843, 1, 1,
0.3124621, 0.5149562, 3.34669, 0, 0.1529412, 1, 1,
0.3134319, -0.5334266, 3.454399, 0, 0.1490196, 1, 1,
0.3164913, -0.8327862, 4.226763, 0, 0.1411765, 1, 1,
0.3223905, 1.732379, -0.1787542, 0, 0.1372549, 1, 1,
0.3242459, 0.3640688, 1.01131, 0, 0.1294118, 1, 1,
0.3256743, -0.766476, 4.263848, 0, 0.1254902, 1, 1,
0.3269972, -1.422313, 2.246605, 0, 0.1176471, 1, 1,
0.3294609, -0.1250931, 2.395148, 0, 0.1137255, 1, 1,
0.3299595, 0.2907394, 0.3155063, 0, 0.1058824, 1, 1,
0.3382095, -1.711169, 3.417477, 0, 0.09803922, 1, 1,
0.3397358, 0.5443112, 1.837973, 0, 0.09411765, 1, 1,
0.3480278, -1.07698, 2.412707, 0, 0.08627451, 1, 1,
0.3505768, 0.08257896, 1.438387, 0, 0.08235294, 1, 1,
0.3532205, -0.9970835, 2.20436, 0, 0.07450981, 1, 1,
0.3575875, -1.430077, 2.86085, 0, 0.07058824, 1, 1,
0.3587733, 0.2440457, 2.610173, 0, 0.0627451, 1, 1,
0.3592378, -1.977424, 3.986868, 0, 0.05882353, 1, 1,
0.3623418, -1.452014, 3.266034, 0, 0.05098039, 1, 1,
0.3635422, -0.8217945, 3.573645, 0, 0.04705882, 1, 1,
0.3674031, -0.3564354, 1.193544, 0, 0.03921569, 1, 1,
0.3685647, 0.457986, 1.492143, 0, 0.03529412, 1, 1,
0.371376, -2.025675, 3.582451, 0, 0.02745098, 1, 1,
0.3717718, 1.838071, 0.935118, 0, 0.02352941, 1, 1,
0.3739723, 1.285071, 0.592629, 0, 0.01568628, 1, 1,
0.374676, -1.700232, 1.412575, 0, 0.01176471, 1, 1,
0.380852, 0.1437161, 3.036115, 0, 0.003921569, 1, 1,
0.3815385, 1.360544, 0.7453816, 0.003921569, 0, 1, 1,
0.3841043, 0.7345582, 0.9693094, 0.007843138, 0, 1, 1,
0.3845632, 1.015759, 0.7430869, 0.01568628, 0, 1, 1,
0.3878673, -1.18179, 3.292322, 0.01960784, 0, 1, 1,
0.3888183, 0.4370815, 0.6772366, 0.02745098, 0, 1, 1,
0.3936282, 0.1072016, 1.17046, 0.03137255, 0, 1, 1,
0.3936421, -0.1038655, 0.9662431, 0.03921569, 0, 1, 1,
0.3954042, -1.88178, 2.75143, 0.04313726, 0, 1, 1,
0.395668, 1.105374, 1.272632, 0.05098039, 0, 1, 1,
0.396585, -0.3976071, 3.926989, 0.05490196, 0, 1, 1,
0.4045118, 0.9984995, 0.973057, 0.0627451, 0, 1, 1,
0.4069511, -0.0497403, 0.1777838, 0.06666667, 0, 1, 1,
0.4092176, -1.401747, 4.924868, 0.07450981, 0, 1, 1,
0.4117847, -1.831639, 4.960274, 0.07843138, 0, 1, 1,
0.4125748, -1.195217, 3.72463, 0.08627451, 0, 1, 1,
0.4189471, 1.230399, -0.6780533, 0.09019608, 0, 1, 1,
0.4195424, -0.1762387, 2.775011, 0.09803922, 0, 1, 1,
0.4198187, 0.6606359, -1.451478, 0.1058824, 0, 1, 1,
0.4199933, 0.1541243, 1.688102, 0.1098039, 0, 1, 1,
0.4207219, -0.02217809, 0.9324773, 0.1176471, 0, 1, 1,
0.4231575, 0.08923492, -0.5320671, 0.1215686, 0, 1, 1,
0.4290356, -0.7809663, 2.799933, 0.1294118, 0, 1, 1,
0.4314753, -0.6902274, 0.7209274, 0.1333333, 0, 1, 1,
0.4316163, 0.005062058, -0.2411394, 0.1411765, 0, 1, 1,
0.4336048, -0.8639336, 2.624683, 0.145098, 0, 1, 1,
0.4339006, -0.07065803, 1.636307, 0.1529412, 0, 1, 1,
0.4346712, 0.4151556, 0.5367763, 0.1568628, 0, 1, 1,
0.43694, 0.4589657, 0.05806682, 0.1647059, 0, 1, 1,
0.4375151, -1.595579, 1.413304, 0.1686275, 0, 1, 1,
0.4426965, 0.03227669, 3.762583, 0.1764706, 0, 1, 1,
0.4434499, 0.62538, 1.11311, 0.1803922, 0, 1, 1,
0.4439819, -2.536237, 2.493762, 0.1882353, 0, 1, 1,
0.4447478, -1.003804, 1.827435, 0.1921569, 0, 1, 1,
0.4464303, 1.304818, 0.4521858, 0.2, 0, 1, 1,
0.4485994, 0.6962174, 0.3239346, 0.2078431, 0, 1, 1,
0.4593883, -0.06797361, 2.457204, 0.2117647, 0, 1, 1,
0.4599016, -1.597397, 1.126746, 0.2196078, 0, 1, 1,
0.462405, -0.681111, 2.354383, 0.2235294, 0, 1, 1,
0.4667486, -1.960145, 3.172724, 0.2313726, 0, 1, 1,
0.4691366, 0.1588776, 1.782596, 0.2352941, 0, 1, 1,
0.4775123, 0.1744783, 1.036038, 0.2431373, 0, 1, 1,
0.4779011, -0.2297829, 2.715353, 0.2470588, 0, 1, 1,
0.482376, -0.7525681, 1.779945, 0.254902, 0, 1, 1,
0.4840201, -0.5662784, 2.813978, 0.2588235, 0, 1, 1,
0.4857926, -0.1272635, 1.33461, 0.2666667, 0, 1, 1,
0.4864068, 0.2520239, 1.228916, 0.2705882, 0, 1, 1,
0.4990515, 0.08977793, 1.777021, 0.2784314, 0, 1, 1,
0.5022388, 0.1063716, 0.6963751, 0.282353, 0, 1, 1,
0.5037903, -0.00891574, 1.071196, 0.2901961, 0, 1, 1,
0.5088095, -1.109171, 3.630803, 0.2941177, 0, 1, 1,
0.511417, -0.9593701, 2.307849, 0.3019608, 0, 1, 1,
0.5115277, 0.3682697, 2.775921, 0.3098039, 0, 1, 1,
0.5261776, -1.173041, 1.405504, 0.3137255, 0, 1, 1,
0.5393652, 0.2086663, 1.75205, 0.3215686, 0, 1, 1,
0.5464841, -0.5105757, 2.769707, 0.3254902, 0, 1, 1,
0.554888, 0.08999068, 0.8112499, 0.3333333, 0, 1, 1,
0.5565487, -0.5359553, 2.500824, 0.3372549, 0, 1, 1,
0.5577862, -0.3342558, 2.073359, 0.345098, 0, 1, 1,
0.5643067, -0.1680211, 1.583334, 0.3490196, 0, 1, 1,
0.5656033, 1.355181, 1.923491, 0.3568628, 0, 1, 1,
0.5664106, 1.681737, -0.3355168, 0.3607843, 0, 1, 1,
0.5690165, -0.1432489, 2.422371, 0.3686275, 0, 1, 1,
0.5717983, -0.2139834, 2.309301, 0.372549, 0, 1, 1,
0.5722176, -0.5394398, 0.983773, 0.3803922, 0, 1, 1,
0.5766038, -0.2904045, 2.674599, 0.3843137, 0, 1, 1,
0.5773933, 1.092961, 0.245572, 0.3921569, 0, 1, 1,
0.5902919, -0.1977895, 3.261142, 0.3960784, 0, 1, 1,
0.591719, 0.2643826, 1.665216, 0.4039216, 0, 1, 1,
0.593175, 0.06012538, 2.800335, 0.4117647, 0, 1, 1,
0.59802, 1.863227, 0.02094804, 0.4156863, 0, 1, 1,
0.6022144, 1.124783, 0.03614278, 0.4235294, 0, 1, 1,
0.6029596, -1.318829, 2.444098, 0.427451, 0, 1, 1,
0.6061426, 1.030702, -0.699971, 0.4352941, 0, 1, 1,
0.6069387, 0.2867717, 0.8703805, 0.4392157, 0, 1, 1,
0.6089943, -0.3462297, 0.2079784, 0.4470588, 0, 1, 1,
0.60922, 0.3913654, 0.2702301, 0.4509804, 0, 1, 1,
0.6094757, -0.4598207, 3.15525, 0.4588235, 0, 1, 1,
0.6115805, 1.015843, 1.918551, 0.4627451, 0, 1, 1,
0.6119975, -1.443005, 3.190323, 0.4705882, 0, 1, 1,
0.6152954, -2.754213, 2.338026, 0.4745098, 0, 1, 1,
0.6253929, -0.0240506, 2.162355, 0.4823529, 0, 1, 1,
0.6260856, -0.01191482, 1.258069, 0.4862745, 0, 1, 1,
0.6261609, -0.5143566, 1.970467, 0.4941176, 0, 1, 1,
0.6291809, -0.443742, 2.447144, 0.5019608, 0, 1, 1,
0.6317137, 0.3121606, 2.371263, 0.5058824, 0, 1, 1,
0.6351275, -0.09500295, 2.624971, 0.5137255, 0, 1, 1,
0.6379692, -0.2890641, 1.950186, 0.5176471, 0, 1, 1,
0.6409585, -0.9895061, 2.568134, 0.5254902, 0, 1, 1,
0.6426212, -0.3236154, 2.047554, 0.5294118, 0, 1, 1,
0.6468289, -0.8455687, 3.52812, 0.5372549, 0, 1, 1,
0.651213, 1.337212, 1.860221, 0.5411765, 0, 1, 1,
0.6609036, -1.28486, 1.846709, 0.5490196, 0, 1, 1,
0.6726285, -0.2909513, 2.825472, 0.5529412, 0, 1, 1,
0.6754826, -1.532729, 3.084485, 0.5607843, 0, 1, 1,
0.676451, 0.7779641, 1.707144, 0.5647059, 0, 1, 1,
0.6795945, 2.471689, -0.231637, 0.572549, 0, 1, 1,
0.6810597, -0.1463509, 0.486666, 0.5764706, 0, 1, 1,
0.6832016, -0.1611708, 2.767527, 0.5843138, 0, 1, 1,
0.6875923, 1.779612, 1.150894, 0.5882353, 0, 1, 1,
0.6919191, 0.4496045, 1.8873, 0.5960785, 0, 1, 1,
0.6930854, 0.04741368, 1.317326, 0.6039216, 0, 1, 1,
0.6934401, 0.08262286, -0.05915986, 0.6078432, 0, 1, 1,
0.695276, -0.6124799, 1.640604, 0.6156863, 0, 1, 1,
0.7032392, 0.03920865, 0.07846455, 0.6196079, 0, 1, 1,
0.7047266, 0.7094548, 0.4742823, 0.627451, 0, 1, 1,
0.7161326, 0.6974158, 0.2155551, 0.6313726, 0, 1, 1,
0.7183225, -0.6844035, 2.063691, 0.6392157, 0, 1, 1,
0.7205664, 0.7816163, 1.989427, 0.6431373, 0, 1, 1,
0.7224851, -0.7313591, 2.066809, 0.6509804, 0, 1, 1,
0.7232046, -1.441588, 3.631513, 0.654902, 0, 1, 1,
0.7234589, -0.9285179, 1.461089, 0.6627451, 0, 1, 1,
0.7250617, -1.239062, 2.763196, 0.6666667, 0, 1, 1,
0.7290595, 0.2153226, 0.9434251, 0.6745098, 0, 1, 1,
0.7338503, -0.6120827, 2.674935, 0.6784314, 0, 1, 1,
0.7435945, 0.2700664, 1.548212, 0.6862745, 0, 1, 1,
0.7442525, -0.7705371, 2.698453, 0.6901961, 0, 1, 1,
0.7451434, 0.3440585, -0.6044617, 0.6980392, 0, 1, 1,
0.7457616, 1.345706, -0.5748865, 0.7058824, 0, 1, 1,
0.7462113, 0.4811472, 1.007207, 0.7098039, 0, 1, 1,
0.7465069, -1.231533, 2.728535, 0.7176471, 0, 1, 1,
0.7625558, -0.1913292, 1.137829, 0.7215686, 0, 1, 1,
0.7627712, 1.664649, 1.41884, 0.7294118, 0, 1, 1,
0.7628133, 1.048419, 0.5968035, 0.7333333, 0, 1, 1,
0.7660754, -0.007902124, -0.4681972, 0.7411765, 0, 1, 1,
0.7691849, 0.1899028, 1.594252, 0.7450981, 0, 1, 1,
0.7720695, 1.67637, -1.626662, 0.7529412, 0, 1, 1,
0.7740833, 0.5153134, 2.057374, 0.7568628, 0, 1, 1,
0.7741047, -0.3592754, 1.915955, 0.7647059, 0, 1, 1,
0.775428, -0.3671636, 2.133646, 0.7686275, 0, 1, 1,
0.7822012, -0.1223844, 0.3415163, 0.7764706, 0, 1, 1,
0.7839225, -0.2561042, 0.7602675, 0.7803922, 0, 1, 1,
0.788801, 0.7932408, 2.005747, 0.7882353, 0, 1, 1,
0.7891091, -1.587767, 2.28536, 0.7921569, 0, 1, 1,
0.7892899, 0.1092185, 1.361875, 0.8, 0, 1, 1,
0.7954751, -0.5100102, 1.080292, 0.8078431, 0, 1, 1,
0.7981065, 0.6932135, 0.6326697, 0.8117647, 0, 1, 1,
0.804676, -0.7594569, 0.3597458, 0.8196079, 0, 1, 1,
0.8072278, -0.4569738, 3.035162, 0.8235294, 0, 1, 1,
0.8092042, 0.1009065, 2.744368, 0.8313726, 0, 1, 1,
0.8198705, -0.9716194, 4.423222, 0.8352941, 0, 1, 1,
0.8236406, -0.8988257, 2.56658, 0.8431373, 0, 1, 1,
0.8294448, 0.860284, 1.283878, 0.8470588, 0, 1, 1,
0.8350076, 1.722446, 1.02616, 0.854902, 0, 1, 1,
0.8359209, -1.315137, 4.201696, 0.8588235, 0, 1, 1,
0.8363073, 0.2724233, 2.172552, 0.8666667, 0, 1, 1,
0.8437439, -0.6092436, 2.744298, 0.8705882, 0, 1, 1,
0.8515223, -0.1741999, 2.422276, 0.8784314, 0, 1, 1,
0.8557964, 2.266698, -0.6866588, 0.8823529, 0, 1, 1,
0.8561673, -0.3776531, 1.968982, 0.8901961, 0, 1, 1,
0.8575622, 0.2037027, 2.145792, 0.8941177, 0, 1, 1,
0.8587523, -0.3429721, 1.08201, 0.9019608, 0, 1, 1,
0.8617773, 0.01254934, 1.092794, 0.9098039, 0, 1, 1,
0.8628455, 0.9385033, 2.083336, 0.9137255, 0, 1, 1,
0.8641964, -0.3728203, 2.062028, 0.9215686, 0, 1, 1,
0.8687724, 0.2264476, 1.419665, 0.9254902, 0, 1, 1,
0.8714392, -0.3060414, -0.6526133, 0.9333333, 0, 1, 1,
0.8715762, -0.7764003, 2.916162, 0.9372549, 0, 1, 1,
0.8717294, 0.6732289, 2.280921, 0.945098, 0, 1, 1,
0.8727036, -0.217285, 2.674783, 0.9490196, 0, 1, 1,
0.876431, 1.59516, 0.9498804, 0.9568627, 0, 1, 1,
0.8864421, -1.222206, 3.825374, 0.9607843, 0, 1, 1,
0.8866655, 0.6436682, 2.719455, 0.9686275, 0, 1, 1,
0.8902668, -0.1482708, 1.949647, 0.972549, 0, 1, 1,
0.8905054, 0.4860429, 1.196759, 0.9803922, 0, 1, 1,
0.8949177, 1.604327, 0.4822637, 0.9843137, 0, 1, 1,
0.9046609, -1.353877, 3.746883, 0.9921569, 0, 1, 1,
0.9116462, 0.03063853, 2.617065, 0.9960784, 0, 1, 1,
0.9129251, -1.475138, 3.364637, 1, 0, 0.9960784, 1,
0.91865, -0.2976773, 2.082057, 1, 0, 0.9882353, 1,
0.9192807, -0.9173623, 1.261945, 1, 0, 0.9843137, 1,
0.9261309, -0.6393574, 0.8442602, 1, 0, 0.9764706, 1,
0.9264551, -0.7998802, 1.217202, 1, 0, 0.972549, 1,
0.9272636, -0.1770909, 2.114989, 1, 0, 0.9647059, 1,
0.9286032, 0.0102229, 1.412879, 1, 0, 0.9607843, 1,
0.932115, 1.26859, 0.8301443, 1, 0, 0.9529412, 1,
0.937919, 0.7634079, 1.629246, 1, 0, 0.9490196, 1,
0.9397365, -0.5821305, 1.234018, 1, 0, 0.9411765, 1,
0.9476748, -0.1225322, 1.402375, 1, 0, 0.9372549, 1,
0.9624223, -0.1473152, 2.960904, 1, 0, 0.9294118, 1,
0.9686582, 0.3803297, 0.6915994, 1, 0, 0.9254902, 1,
0.9718214, 0.631793, 0.8418733, 1, 0, 0.9176471, 1,
0.9835126, -1.235246, 4.410757, 1, 0, 0.9137255, 1,
0.9851349, 1.560043, 2.078249, 1, 0, 0.9058824, 1,
0.9876129, -0.361209, 0.4687488, 1, 0, 0.9019608, 1,
0.9928934, 0.8155522, 1.853764, 1, 0, 0.8941177, 1,
0.9931986, 1.375987, 0.4027895, 1, 0, 0.8862745, 1,
1.000206, 0.05604886, 0.1645756, 1, 0, 0.8823529, 1,
1.004261, 0.4793031, 1.75787, 1, 0, 0.8745098, 1,
1.012378, -2.259611, 1.159173, 1, 0, 0.8705882, 1,
1.016502, -0.4574997, 2.262435, 1, 0, 0.8627451, 1,
1.025212, 0.715453, 1.013779, 1, 0, 0.8588235, 1,
1.027373, 0.9783342, 0.194755, 1, 0, 0.8509804, 1,
1.031903, 0.2410233, 1.571275, 1, 0, 0.8470588, 1,
1.033217, 0.1688375, 0.9928594, 1, 0, 0.8392157, 1,
1.035839, 1.162101, 1.762934, 1, 0, 0.8352941, 1,
1.037403, 1.998861, 0.08446757, 1, 0, 0.827451, 1,
1.038258, -0.01977498, 1.181064, 1, 0, 0.8235294, 1,
1.040658, 0.4133735, 0.8286436, 1, 0, 0.8156863, 1,
1.053313, -1.610284, 3.266319, 1, 0, 0.8117647, 1,
1.053494, -0.2613348, 3.235011, 1, 0, 0.8039216, 1,
1.061946, -2.292297, 2.367999, 1, 0, 0.7960784, 1,
1.065344, 0.4995415, 2.183201, 1, 0, 0.7921569, 1,
1.068241, 0.6169938, 1.287339, 1, 0, 0.7843137, 1,
1.070334, 0.2083749, 0.9852522, 1, 0, 0.7803922, 1,
1.079387, 0.2361821, 1.027566, 1, 0, 0.772549, 1,
1.089014, -0.8061575, 1.935196, 1, 0, 0.7686275, 1,
1.095146, 0.2062098, 1.740793, 1, 0, 0.7607843, 1,
1.101181, 0.4188961, 1.163186, 1, 0, 0.7568628, 1,
1.109719, 0.179305, 0.4949131, 1, 0, 0.7490196, 1,
1.114344, 0.5750537, -0.328809, 1, 0, 0.7450981, 1,
1.116824, -1.214802, 2.036396, 1, 0, 0.7372549, 1,
1.12612, -0.2562745, 1.072853, 1, 0, 0.7333333, 1,
1.133195, -0.0472368, 3.5842, 1, 0, 0.7254902, 1,
1.137312, 0.7749432, 2.587523, 1, 0, 0.7215686, 1,
1.141564, 0.1017695, 2.065518, 1, 0, 0.7137255, 1,
1.147919, 1.487316, 0.4778793, 1, 0, 0.7098039, 1,
1.154257, -0.2769636, 2.050351, 1, 0, 0.7019608, 1,
1.157672, -1.759474, 3.82898, 1, 0, 0.6941177, 1,
1.160269, -0.4475087, 0.6877206, 1, 0, 0.6901961, 1,
1.160963, -1.632306, 4.048801, 1, 0, 0.682353, 1,
1.177354, 1.344866, 1.00794, 1, 0, 0.6784314, 1,
1.187974, -0.9071434, -0.5270449, 1, 0, 0.6705883, 1,
1.195434, 1.716283, 2.518087, 1, 0, 0.6666667, 1,
1.196509, 0.5501424, -0.3440552, 1, 0, 0.6588235, 1,
1.209744, 2.258048, 0.3160885, 1, 0, 0.654902, 1,
1.211915, 1.594447, 1.416964, 1, 0, 0.6470588, 1,
1.220567, 0.4254768, -0.3882223, 1, 0, 0.6431373, 1,
1.221389, 0.02859139, 1.206533, 1, 0, 0.6352941, 1,
1.23123, -0.09842278, 0.3747225, 1, 0, 0.6313726, 1,
1.249964, 0.2909954, 1.538144, 1, 0, 0.6235294, 1,
1.250999, 0.7670094, -0.1048032, 1, 0, 0.6196079, 1,
1.251165, -0.5931587, 2.105945, 1, 0, 0.6117647, 1,
1.253472, -1.086225, 2.908024, 1, 0, 0.6078432, 1,
1.257057, -0.0602929, 0.05252831, 1, 0, 0.6, 1,
1.257914, -0.2616207, 3.274268, 1, 0, 0.5921569, 1,
1.258722, 1.173655, 0.5100356, 1, 0, 0.5882353, 1,
1.259849, 0.1922767, 0.6826541, 1, 0, 0.5803922, 1,
1.262661, 1.033862, 1.148207, 1, 0, 0.5764706, 1,
1.266702, 2.792819, -0.08147801, 1, 0, 0.5686275, 1,
1.269975, -0.185531, 0.8145263, 1, 0, 0.5647059, 1,
1.27778, 1.306179, -1.04072, 1, 0, 0.5568628, 1,
1.282204, 0.4875749, 2.085702, 1, 0, 0.5529412, 1,
1.296752, 1.330231, 0.4219576, 1, 0, 0.5450981, 1,
1.30823, -0.8291812, 1.078251, 1, 0, 0.5411765, 1,
1.318284, 0.07320819, 1.110188, 1, 0, 0.5333334, 1,
1.326884, 0.3613675, 1.038195, 1, 0, 0.5294118, 1,
1.330754, -0.7361486, 1.721492, 1, 0, 0.5215687, 1,
1.334199, -0.7862904, 2.452836, 1, 0, 0.5176471, 1,
1.336818, -1.426524, 4.020756, 1, 0, 0.509804, 1,
1.337463, -0.7672427, 0.5232372, 1, 0, 0.5058824, 1,
1.337706, 1.548501, 0.2726465, 1, 0, 0.4980392, 1,
1.345872, -0.5895984, 1.226166, 1, 0, 0.4901961, 1,
1.357251, 0.9646919, 1.212582, 1, 0, 0.4862745, 1,
1.371445, 0.3723559, 1.726681, 1, 0, 0.4784314, 1,
1.37266, -0.04657895, 1.991614, 1, 0, 0.4745098, 1,
1.376399, -2.183695, 3.831327, 1, 0, 0.4666667, 1,
1.380405, 0.5830312, 1.881745, 1, 0, 0.4627451, 1,
1.381542, -0.2109523, 2.701387, 1, 0, 0.454902, 1,
1.385166, 0.358438, 4.251752, 1, 0, 0.4509804, 1,
1.390804, 0.5294793, -0.4144267, 1, 0, 0.4431373, 1,
1.393041, -0.01655015, 1.489332, 1, 0, 0.4392157, 1,
1.403235, 1.077292, 0.3065208, 1, 0, 0.4313726, 1,
1.409711, -1.781265, 2.017497, 1, 0, 0.427451, 1,
1.409716, -0.6754771, 3.780356, 1, 0, 0.4196078, 1,
1.412581, -0.9573641, 1.338458, 1, 0, 0.4156863, 1,
1.432997, 1.014636, 0.7577326, 1, 0, 0.4078431, 1,
1.440911, -0.7494037, 2.727982, 1, 0, 0.4039216, 1,
1.442721, 0.2445454, 1.945153, 1, 0, 0.3960784, 1,
1.457636, -0.01210637, 1.984833, 1, 0, 0.3882353, 1,
1.461071, 0.8776457, -0.1515174, 1, 0, 0.3843137, 1,
1.461702, 1.850493, 2.190095, 1, 0, 0.3764706, 1,
1.466321, -0.833696, 1.117401, 1, 0, 0.372549, 1,
1.471522, 1.142887, -0.6488944, 1, 0, 0.3647059, 1,
1.480013, 0.03301271, -1.440779, 1, 0, 0.3607843, 1,
1.492413, -0.2283499, 0.7308641, 1, 0, 0.3529412, 1,
1.497896, -1.061351, 1.669601, 1, 0, 0.3490196, 1,
1.511573, 0.2833282, 1.270297, 1, 0, 0.3411765, 1,
1.519225, 0.3799082, 0.6443, 1, 0, 0.3372549, 1,
1.521522, 0.05138487, 1.026022, 1, 0, 0.3294118, 1,
1.522089, -1.143576, 1.416872, 1, 0, 0.3254902, 1,
1.526049, -1.592573, 2.778995, 1, 0, 0.3176471, 1,
1.52981, -0.08867867, 1.372706, 1, 0, 0.3137255, 1,
1.531092, 2.20604, 1.772868, 1, 0, 0.3058824, 1,
1.546562, 0.2136069, 2.850076, 1, 0, 0.2980392, 1,
1.562822, -1.496524, 2.002731, 1, 0, 0.2941177, 1,
1.569503, -0.01574817, 1.990999, 1, 0, 0.2862745, 1,
1.599846, 1.027971, 0.3220529, 1, 0, 0.282353, 1,
1.634953, -0.8361273, 4.118765, 1, 0, 0.2745098, 1,
1.671409, 0.5182944, 1.579226, 1, 0, 0.2705882, 1,
1.671638, -1.150851, 3.184971, 1, 0, 0.2627451, 1,
1.672333, 0.4508696, 1.953828, 1, 0, 0.2588235, 1,
1.673551, -0.3771037, 1.8221, 1, 0, 0.2509804, 1,
1.674337, -0.2598337, 2.81305, 1, 0, 0.2470588, 1,
1.701329, -0.2030657, 2.615932, 1, 0, 0.2392157, 1,
1.722943, -2.797148, 2.471184, 1, 0, 0.2352941, 1,
1.731389, 0.6745129, 0.6272416, 1, 0, 0.227451, 1,
1.741128, 0.7127956, 1.195188, 1, 0, 0.2235294, 1,
1.742365, 1.170488, -1.48066, 1, 0, 0.2156863, 1,
1.745636, -1.771238, 3.213504, 1, 0, 0.2117647, 1,
1.752837, -0.3496908, 1.491232, 1, 0, 0.2039216, 1,
1.764659, 0.1135454, 0.7933863, 1, 0, 0.1960784, 1,
1.774286, 0.3415937, 1.04739, 1, 0, 0.1921569, 1,
1.774874, -0.7185706, 2.16815, 1, 0, 0.1843137, 1,
1.809151, 0.5397658, 1.306013, 1, 0, 0.1803922, 1,
1.831683, 0.5903108, 0.9422693, 1, 0, 0.172549, 1,
1.85676, -0.3520656, 0.7538805, 1, 0, 0.1686275, 1,
1.858161, 1.591215, 3.224133, 1, 0, 0.1607843, 1,
1.871296, 0.9275036, -0.1131353, 1, 0, 0.1568628, 1,
1.882827, -0.08470959, 1.617856, 1, 0, 0.1490196, 1,
1.910066, -0.1098776, 0.9483383, 1, 0, 0.145098, 1,
1.943884, 1.233667, 0.5698749, 1, 0, 0.1372549, 1,
1.985828, -0.6778729, 3.935318, 1, 0, 0.1333333, 1,
1.990398, 0.174599, 1.802521, 1, 0, 0.1254902, 1,
1.994578, -1.596796, 5.237543, 1, 0, 0.1215686, 1,
1.999497, 1.391428, 0.85984, 1, 0, 0.1137255, 1,
2.063743, 1.038078, 1.557055, 1, 0, 0.1098039, 1,
2.072066, 0.02257909, 1.88796, 1, 0, 0.1019608, 1,
2.076621, -1.713727, 0.8981276, 1, 0, 0.09411765, 1,
2.102827, 1.157075, 0.5056074, 1, 0, 0.09019608, 1,
2.103444, 2.44803, -1.159105, 1, 0, 0.08235294, 1,
2.107329, -0.1208196, 1.162607, 1, 0, 0.07843138, 1,
2.127618, 2.366931, 3.729196, 1, 0, 0.07058824, 1,
2.235574, 0.234101, 2.430977, 1, 0, 0.06666667, 1,
2.273502, 1.810596, 2.068218, 1, 0, 0.05882353, 1,
2.339221, 0.8240228, 1.750403, 1, 0, 0.05490196, 1,
2.355116, -2.209062, 2.283096, 1, 0, 0.04705882, 1,
2.449837, -1.545375, 2.490652, 1, 0, 0.04313726, 1,
2.531103, -0.695095, 2.042529, 1, 0, 0.03529412, 1,
2.767239, 0.1237497, 0.752109, 1, 0, 0.03137255, 1,
2.809453, 0.1586859, 0.6739411, 1, 0, 0.02352941, 1,
2.968285, 0.4132259, 0.3825586, 1, 0, 0.01960784, 1,
3.31577, 1.163898, -0.592069, 1, 0, 0.01176471, 1,
4.142094, -0.7861543, 2.269183, 1, 0, 0.007843138, 1
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
0.3453621, -4.583904, -7.331036, 0, -0.5, 0.5, 0.5,
0.3453621, -4.583904, -7.331036, 1, -0.5, 0.5, 0.5,
0.3453621, -4.583904, -7.331036, 1, 1.5, 0.5, 0.5,
0.3453621, -4.583904, -7.331036, 0, 1.5, 0.5, 0.5
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
-4.738462, -0.1483349, -7.331036, 0, -0.5, 0.5, 0.5,
-4.738462, -0.1483349, -7.331036, 1, -0.5, 0.5, 0.5,
-4.738462, -0.1483349, -7.331036, 1, 1.5, 0.5, 0.5,
-4.738462, -0.1483349, -7.331036, 0, 1.5, 0.5, 0.5
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
-4.738462, -4.583904, -0.1359413, 0, -0.5, 0.5, 0.5,
-4.738462, -4.583904, -0.1359413, 1, -0.5, 0.5, 0.5,
-4.738462, -4.583904, -0.1359413, 1, 1.5, 0.5, 0.5,
-4.738462, -4.583904, -0.1359413, 0, 1.5, 0.5, 0.5
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
-2, -3.560311, -5.67063,
4, -3.560311, -5.67063,
-2, -3.560311, -5.67063,
-2, -3.73091, -5.947364,
0, -3.560311, -5.67063,
0, -3.73091, -5.947364,
2, -3.560311, -5.67063,
2, -3.73091, -5.947364,
4, -3.560311, -5.67063,
4, -3.73091, -5.947364
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
"0",
"2",
"4"
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
-2, -4.072108, -6.500833, 0, -0.5, 0.5, 0.5,
-2, -4.072108, -6.500833, 1, -0.5, 0.5, 0.5,
-2, -4.072108, -6.500833, 1, 1.5, 0.5, 0.5,
-2, -4.072108, -6.500833, 0, 1.5, 0.5, 0.5,
0, -4.072108, -6.500833, 0, -0.5, 0.5, 0.5,
0, -4.072108, -6.500833, 1, -0.5, 0.5, 0.5,
0, -4.072108, -6.500833, 1, 1.5, 0.5, 0.5,
0, -4.072108, -6.500833, 0, 1.5, 0.5, 0.5,
2, -4.072108, -6.500833, 0, -0.5, 0.5, 0.5,
2, -4.072108, -6.500833, 1, -0.5, 0.5, 0.5,
2, -4.072108, -6.500833, 1, 1.5, 0.5, 0.5,
2, -4.072108, -6.500833, 0, 1.5, 0.5, 0.5,
4, -4.072108, -6.500833, 0, -0.5, 0.5, 0.5,
4, -4.072108, -6.500833, 1, -0.5, 0.5, 0.5,
4, -4.072108, -6.500833, 1, 1.5, 0.5, 0.5,
4, -4.072108, -6.500833, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<4; i++) 
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
12, 13, 14, 12, 14, 15
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
-3.565272, -3, -5.67063,
-3.565272, 3, -5.67063,
-3.565272, -3, -5.67063,
-3.760804, -3, -5.947364,
-3.565272, -2, -5.67063,
-3.760804, -2, -5.947364,
-3.565272, -1, -5.67063,
-3.760804, -1, -5.947364,
-3.565272, 0, -5.67063,
-3.760804, 0, -5.947364,
-3.565272, 1, -5.67063,
-3.760804, 1, -5.947364,
-3.565272, 2, -5.67063,
-3.760804, 2, -5.947364,
-3.565272, 3, -5.67063,
-3.760804, 3, -5.947364
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
-4.151867, -3, -6.500833, 0, -0.5, 0.5, 0.5,
-4.151867, -3, -6.500833, 1, -0.5, 0.5, 0.5,
-4.151867, -3, -6.500833, 1, 1.5, 0.5, 0.5,
-4.151867, -3, -6.500833, 0, 1.5, 0.5, 0.5,
-4.151867, -2, -6.500833, 0, -0.5, 0.5, 0.5,
-4.151867, -2, -6.500833, 1, -0.5, 0.5, 0.5,
-4.151867, -2, -6.500833, 1, 1.5, 0.5, 0.5,
-4.151867, -2, -6.500833, 0, 1.5, 0.5, 0.5,
-4.151867, -1, -6.500833, 0, -0.5, 0.5, 0.5,
-4.151867, -1, -6.500833, 1, -0.5, 0.5, 0.5,
-4.151867, -1, -6.500833, 1, 1.5, 0.5, 0.5,
-4.151867, -1, -6.500833, 0, 1.5, 0.5, 0.5,
-4.151867, 0, -6.500833, 0, -0.5, 0.5, 0.5,
-4.151867, 0, -6.500833, 1, -0.5, 0.5, 0.5,
-4.151867, 0, -6.500833, 1, 1.5, 0.5, 0.5,
-4.151867, 0, -6.500833, 0, 1.5, 0.5, 0.5,
-4.151867, 1, -6.500833, 0, -0.5, 0.5, 0.5,
-4.151867, 1, -6.500833, 1, -0.5, 0.5, 0.5,
-4.151867, 1, -6.500833, 1, 1.5, 0.5, 0.5,
-4.151867, 1, -6.500833, 0, 1.5, 0.5, 0.5,
-4.151867, 2, -6.500833, 0, -0.5, 0.5, 0.5,
-4.151867, 2, -6.500833, 1, -0.5, 0.5, 0.5,
-4.151867, 2, -6.500833, 1, 1.5, 0.5, 0.5,
-4.151867, 2, -6.500833, 0, 1.5, 0.5, 0.5,
-4.151867, 3, -6.500833, 0, -0.5, 0.5, 0.5,
-4.151867, 3, -6.500833, 1, -0.5, 0.5, 0.5,
-4.151867, 3, -6.500833, 1, 1.5, 0.5, 0.5,
-4.151867, 3, -6.500833, 0, 1.5, 0.5, 0.5
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
-3.565272, -3.560311, -4,
-3.565272, -3.560311, 4,
-3.565272, -3.560311, -4,
-3.760804, -3.73091, -4,
-3.565272, -3.560311, -2,
-3.760804, -3.73091, -2,
-3.565272, -3.560311, 0,
-3.760804, -3.73091, 0,
-3.565272, -3.560311, 2,
-3.760804, -3.73091, 2,
-3.565272, -3.560311, 4,
-3.760804, -3.73091, 4
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
-4.151867, -4.072108, -4, 0, -0.5, 0.5, 0.5,
-4.151867, -4.072108, -4, 1, -0.5, 0.5, 0.5,
-4.151867, -4.072108, -4, 1, 1.5, 0.5, 0.5,
-4.151867, -4.072108, -4, 0, 1.5, 0.5, 0.5,
-4.151867, -4.072108, -2, 0, -0.5, 0.5, 0.5,
-4.151867, -4.072108, -2, 1, -0.5, 0.5, 0.5,
-4.151867, -4.072108, -2, 1, 1.5, 0.5, 0.5,
-4.151867, -4.072108, -2, 0, 1.5, 0.5, 0.5,
-4.151867, -4.072108, 0, 0, -0.5, 0.5, 0.5,
-4.151867, -4.072108, 0, 1, -0.5, 0.5, 0.5,
-4.151867, -4.072108, 0, 1, 1.5, 0.5, 0.5,
-4.151867, -4.072108, 0, 0, 1.5, 0.5, 0.5,
-4.151867, -4.072108, 2, 0, -0.5, 0.5, 0.5,
-4.151867, -4.072108, 2, 1, -0.5, 0.5, 0.5,
-4.151867, -4.072108, 2, 1, 1.5, 0.5, 0.5,
-4.151867, -4.072108, 2, 0, 1.5, 0.5, 0.5,
-4.151867, -4.072108, 4, 0, -0.5, 0.5, 0.5,
-4.151867, -4.072108, 4, 1, -0.5, 0.5, 0.5,
-4.151867, -4.072108, 4, 1, 1.5, 0.5, 0.5,
-4.151867, -4.072108, 4, 0, 1.5, 0.5, 0.5
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
-3.565272, -3.560311, -5.67063,
-3.565272, 3.263642, -5.67063,
-3.565272, -3.560311, 5.398747,
-3.565272, 3.263642, 5.398747,
-3.565272, -3.560311, -5.67063,
-3.565272, -3.560311, 5.398747,
-3.565272, 3.263642, -5.67063,
-3.565272, 3.263642, 5.398747,
-3.565272, -3.560311, -5.67063,
4.255996, -3.560311, -5.67063,
-3.565272, -3.560311, 5.398747,
4.255996, -3.560311, 5.398747,
-3.565272, 3.263642, -5.67063,
4.255996, 3.263642, -5.67063,
-3.565272, 3.263642, 5.398747,
4.255996, 3.263642, 5.398747,
4.255996, -3.560311, -5.67063,
4.255996, 3.263642, -5.67063,
4.255996, -3.560311, 5.398747,
4.255996, 3.263642, 5.398747,
4.255996, -3.560311, -5.67063,
4.255996, -3.560311, 5.398747,
4.255996, 3.263642, -5.67063,
4.255996, 3.263642, 5.398747
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
var radius = 8.102963;
var distance = 36.051;
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
mvMatrix.translate( -0.3453621, 0.1483349, 0.1359413 );
mvMatrix.scale( 1.120161, 1.283872, 0.7914702 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.051);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
azide<-read.table("azide.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-azide$V2
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
```

```r
y<-azide$V3
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
```

```r
z<-azide$V4
```

```
## Error in eval(expr, envir, enclos): object 'azide' not found
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
-3.45137, 1.093695, -0.3656383, 0, 0, 1, 1, 1,
-2.944164, 0.5210329, -1.561047, 1, 0, 0, 1, 1,
-2.886092, -0.14081, -3.158501, 1, 0, 0, 1, 1,
-2.869289, -0.7837961, -3.334001, 1, 0, 0, 1, 1,
-2.818871, -0.7231686, -1.188326, 1, 0, 0, 1, 1,
-2.758403, -0.0859794, -1.043292, 1, 0, 0, 1, 1,
-2.742639, -0.331043, -1.826476, 0, 0, 0, 1, 1,
-2.678991, -0.9648486, -1.483678, 0, 0, 0, 1, 1,
-2.600321, 0.1462092, -1.454687, 0, 0, 0, 1, 1,
-2.549652, -0.6074955, -2.549205, 0, 0, 0, 1, 1,
-2.514888, 1.170235, -2.883786, 0, 0, 0, 1, 1,
-2.469874, -1.843324, -3.171754, 0, 0, 0, 1, 1,
-2.442654, 1.447443, -2.42883, 0, 0, 0, 1, 1,
-2.278138, -1.20036, -4.578537, 1, 1, 1, 1, 1,
-2.237525, 0.2690278, -0.9949634, 1, 1, 1, 1, 1,
-2.230774, 1.531569, -0.4402802, 1, 1, 1, 1, 1,
-2.222966, -0.1076737, -2.439226, 1, 1, 1, 1, 1,
-2.2028, 1.354784, 0.4067709, 1, 1, 1, 1, 1,
-2.174033, -0.8423426, -1.097395, 1, 1, 1, 1, 1,
-2.140128, -0.5272464, -3.815018, 1, 1, 1, 1, 1,
-2.127954, 0.4016134, -0.6926914, 1, 1, 1, 1, 1,
-2.127407, 0.728527, -1.796175, 1, 1, 1, 1, 1,
-2.096889, -0.1238113, -3.406689, 1, 1, 1, 1, 1,
-2.082003, -0.1636411, -0.6933702, 1, 1, 1, 1, 1,
-2.066623, 0.7574275, -0.4865998, 1, 1, 1, 1, 1,
-2.042382, 0.7630672, -2.62393, 1, 1, 1, 1, 1,
-2.038702, -0.1438723, -2.558026, 1, 1, 1, 1, 1,
-2.01644, -0.7183656, -2.495789, 1, 1, 1, 1, 1,
-1.992963, 0.3967613, -1.257362, 0, 0, 1, 1, 1,
-1.992206, 0.07041332, -1.595022, 1, 0, 0, 1, 1,
-1.987244, 0.5129794, -2.395292, 1, 0, 0, 1, 1,
-1.980728, 0.0001091667, -1.490193, 1, 0, 0, 1, 1,
-1.973895, 0.1953845, -0.00789822, 1, 0, 0, 1, 1,
-1.966586, -0.8910336, -0.8399653, 1, 0, 0, 1, 1,
-1.962858, 0.2189097, -0.1948872, 0, 0, 0, 1, 1,
-1.911821, 0.4575161, -0.7698162, 0, 0, 0, 1, 1,
-1.862779, 1.678082, -1.44084, 0, 0, 0, 1, 1,
-1.855891, 0.02738825, -1.419629, 0, 0, 0, 1, 1,
-1.817011, 1.254583, -2.489671, 0, 0, 0, 1, 1,
-1.811325, 0.5466792, -0.247122, 0, 0, 0, 1, 1,
-1.793139, 1.079187, -0.9563238, 0, 0, 0, 1, 1,
-1.791471, 0.3294976, 0.7114269, 1, 1, 1, 1, 1,
-1.787129, -0.5885507, -1.02652, 1, 1, 1, 1, 1,
-1.778834, -0.9131433, -1.002309, 1, 1, 1, 1, 1,
-1.773858, 0.6217079, 0.6239721, 1, 1, 1, 1, 1,
-1.768002, 0.4091463, -2.47071, 1, 1, 1, 1, 1,
-1.756961, 0.5430281, -0.7605247, 1, 1, 1, 1, 1,
-1.743869, 2.116589, -0.9653577, 1, 1, 1, 1, 1,
-1.737975, -1.025749, -3.21613, 1, 1, 1, 1, 1,
-1.73329, -0.1225288, -1.857411, 1, 1, 1, 1, 1,
-1.731655, -1.374429, -2.733223, 1, 1, 1, 1, 1,
-1.72984, 0.118682, -1.282072, 1, 1, 1, 1, 1,
-1.728205, 1.736447, -1.471871, 1, 1, 1, 1, 1,
-1.714793, -1.680403, -1.984223, 1, 1, 1, 1, 1,
-1.712687, 0.3807719, -0.190396, 1, 1, 1, 1, 1,
-1.706221, 0.03710965, -1.731016, 1, 1, 1, 1, 1,
-1.674734, -0.00482002, -1.539578, 0, 0, 1, 1, 1,
-1.671017, -1.588649, -3.907141, 1, 0, 0, 1, 1,
-1.665621, -1.451544, -1.740629, 1, 0, 0, 1, 1,
-1.663408, -0.7174599, -1.059774, 1, 0, 0, 1, 1,
-1.662915, 1.176049, -1.065699, 1, 0, 0, 1, 1,
-1.637912, 1.613267, -1.312869, 1, 0, 0, 1, 1,
-1.625912, 0.601023, -2.263493, 0, 0, 0, 1, 1,
-1.62051, -0.1617118, 0.1905484, 0, 0, 0, 1, 1,
-1.61607, -0.2030142, -0.8090143, 0, 0, 0, 1, 1,
-1.613992, 0.6517192, -1.334338, 0, 0, 0, 1, 1,
-1.61352, -0.1255768, -3.012489, 0, 0, 0, 1, 1,
-1.593492, -2.75941, -4.079459, 0, 0, 0, 1, 1,
-1.586366, -0.1883582, -2.397776, 0, 0, 0, 1, 1,
-1.581106, -0.847571, -1.820784, 1, 1, 1, 1, 1,
-1.580069, -1.162363, -0.5657839, 1, 1, 1, 1, 1,
-1.545563, 0.1488763, -3.141244, 1, 1, 1, 1, 1,
-1.545003, -0.6673954, -2.540754, 1, 1, 1, 1, 1,
-1.544185, 0.02546669, -1.056702, 1, 1, 1, 1, 1,
-1.537017, 0.7858676, -0.1347582, 1, 1, 1, 1, 1,
-1.530497, -1.885013, -4.059336, 1, 1, 1, 1, 1,
-1.522524, 0.7885761, -2.671309, 1, 1, 1, 1, 1,
-1.519806, -0.8936561, -3.259253, 1, 1, 1, 1, 1,
-1.502139, 0.1947716, -4.005466, 1, 1, 1, 1, 1,
-1.501073, 0.9157661, -2.499244, 1, 1, 1, 1, 1,
-1.498343, 1.290501, 0.1088073, 1, 1, 1, 1, 1,
-1.490924, 0.2857815, -2.271227, 1, 1, 1, 1, 1,
-1.489537, -0.4814616, -4.105381, 1, 1, 1, 1, 1,
-1.488336, 0.4767194, 0.07026133, 1, 1, 1, 1, 1,
-1.485683, 0.2449329, -0.6226934, 0, 0, 1, 1, 1,
-1.483488, -1.348116, -2.900995, 1, 0, 0, 1, 1,
-1.481455, 1.31793, -0.3513491, 1, 0, 0, 1, 1,
-1.458377, 0.1483816, -1.779542, 1, 0, 0, 1, 1,
-1.412335, 0.2943075, -1.516144, 1, 0, 0, 1, 1,
-1.407974, 0.7898856, -0.04333012, 1, 0, 0, 1, 1,
-1.403767, 0.6428792, -2.238414, 0, 0, 0, 1, 1,
-1.398692, 0.7391802, -0.8438387, 0, 0, 0, 1, 1,
-1.386938, 1.031217, -1.513917, 0, 0, 0, 1, 1,
-1.38456, -0.05334303, -3.447056, 0, 0, 0, 1, 1,
-1.380605, -0.7746631, -4.113279, 0, 0, 0, 1, 1,
-1.380429, -0.7927113, -2.057023, 0, 0, 0, 1, 1,
-1.379048, -1.052162, -3.018249, 0, 0, 0, 1, 1,
-1.371385, -0.5597071, -3.403636, 1, 1, 1, 1, 1,
-1.339994, 0.3925104, -1.301757, 1, 1, 1, 1, 1,
-1.33094, -0.258756, -1.497799, 1, 1, 1, 1, 1,
-1.32356, -0.02624748, -0.9292375, 1, 1, 1, 1, 1,
-1.31978, 0.07450047, 0.6072795, 1, 1, 1, 1, 1,
-1.306415, -0.3272456, -2.232091, 1, 1, 1, 1, 1,
-1.298718, 1.144387, -1.884604, 1, 1, 1, 1, 1,
-1.296582, 1.197827, -1.974584, 1, 1, 1, 1, 1,
-1.292266, 1.398851, -0.4744619, 1, 1, 1, 1, 1,
-1.290518, -0.5643762, -1.950631, 1, 1, 1, 1, 1,
-1.287113, -0.7868725, -0.1711099, 1, 1, 1, 1, 1,
-1.280038, -0.03278185, -1.695864, 1, 1, 1, 1, 1,
-1.268209, -0.1771367, -2.640779, 1, 1, 1, 1, 1,
-1.258707, -1.993052, -2.493925, 1, 1, 1, 1, 1,
-1.249618, -1.109412, -1.75386, 1, 1, 1, 1, 1,
-1.243632, -1.501586, -4.39089, 0, 0, 1, 1, 1,
-1.234057, -0.1696193, -0.08101042, 1, 0, 0, 1, 1,
-1.230634, -0.1557985, -2.981924, 1, 0, 0, 1, 1,
-1.219677, -1.222288, -2.853294, 1, 0, 0, 1, 1,
-1.202953, 1.545766, -0.1197685, 1, 0, 0, 1, 1,
-1.202488, 0.002819952, -2.128948, 1, 0, 0, 1, 1,
-1.20193, -0.7894319, -2.026865, 0, 0, 0, 1, 1,
-1.193571, 1.403263, -1.704214, 0, 0, 0, 1, 1,
-1.189096, -1.025073, -3.251291, 0, 0, 0, 1, 1,
-1.187464, -1.199518, -0.9692535, 0, 0, 0, 1, 1,
-1.184046, -0.8554347, -2.427717, 0, 0, 0, 1, 1,
-1.180658, 1.412135, -0.9029359, 0, 0, 0, 1, 1,
-1.174836, 0.2693166, -0.5943751, 0, 0, 0, 1, 1,
-1.16371, 0.5791402, -0.4435532, 1, 1, 1, 1, 1,
-1.155562, 1.082293, -1.376975, 1, 1, 1, 1, 1,
-1.151889, -0.00587593, -1.304149, 1, 1, 1, 1, 1,
-1.151735, -1.559113, -3.418171, 1, 1, 1, 1, 1,
-1.151361, -1.126868, -2.382719, 1, 1, 1, 1, 1,
-1.146667, -0.01740016, -1.022716, 1, 1, 1, 1, 1,
-1.146303, 0.8319758, -1.366748, 1, 1, 1, 1, 1,
-1.140331, -0.1510374, -2.482122, 1, 1, 1, 1, 1,
-1.138746, 0.3288953, 0.3548161, 1, 1, 1, 1, 1,
-1.132359, -0.07162984, -1.953832, 1, 1, 1, 1, 1,
-1.126929, 0.3287322, -1.804775, 1, 1, 1, 1, 1,
-1.121722, -0.4165453, -2.517025, 1, 1, 1, 1, 1,
-1.120167, 1.009153, -2.9098, 1, 1, 1, 1, 1,
-1.111577, 0.8479944, -0.6905966, 1, 1, 1, 1, 1,
-1.108802, -1.03707, -2.442302, 1, 1, 1, 1, 1,
-1.097365, -2.397096, -2.866424, 0, 0, 1, 1, 1,
-1.094064, -0.2608437, -3.475422, 1, 0, 0, 1, 1,
-1.089279, -1.068868, -2.327221, 1, 0, 0, 1, 1,
-1.087972, -0.4895939, -1.426233, 1, 0, 0, 1, 1,
-1.086654, -0.5380853, -1.893655, 1, 0, 0, 1, 1,
-1.084927, -0.8735154, -0.5931736, 1, 0, 0, 1, 1,
-1.083533, -1.055093, -2.933391, 0, 0, 0, 1, 1,
-1.076124, -1.264615, -2.041796, 0, 0, 0, 1, 1,
-1.073189, -0.2374216, -2.183619, 0, 0, 0, 1, 1,
-1.072183, 0.0109669, -0.7184898, 0, 0, 0, 1, 1,
-1.070838, -1.469912, -1.697445, 0, 0, 0, 1, 1,
-1.056345, -1.324831, -3.280252, 0, 0, 0, 1, 1,
-1.053046, 0.9889268, -0.2640128, 0, 0, 0, 1, 1,
-1.050857, -0.8242936, -1.680832, 1, 1, 1, 1, 1,
-1.038669, 0.360658, 0.4414236, 1, 1, 1, 1, 1,
-1.032372, 0.5273331, -0.6032627, 1, 1, 1, 1, 1,
-1.025578, 0.008949811, 0.3366152, 1, 1, 1, 1, 1,
-1.01724, 1.294779, -0.777183, 1, 1, 1, 1, 1,
-1.015476, 0.1843887, -1.12069, 1, 1, 1, 1, 1,
-1.015043, 1.524257, -0.2715895, 1, 1, 1, 1, 1,
-1.013626, -0.5960585, -0.2395084, 1, 1, 1, 1, 1,
-1.002271, 1.253952, -0.5557463, 1, 1, 1, 1, 1,
-1.000586, 0.6336579, -2.229942, 1, 1, 1, 1, 1,
-0.9905441, 0.4793777, 0.1254174, 1, 1, 1, 1, 1,
-0.9873343, 0.872831, -0.6313289, 1, 1, 1, 1, 1,
-0.9861313, 0.4792858, -2.504696, 1, 1, 1, 1, 1,
-0.9788044, 0.9737691, -0.1921352, 1, 1, 1, 1, 1,
-0.9768212, -0.5667864, -2.359802, 1, 1, 1, 1, 1,
-0.9755796, 0.408693, -2.714261, 0, 0, 1, 1, 1,
-0.9749392, -0.2387727, -2.421191, 1, 0, 0, 1, 1,
-0.9746535, -0.8953393, -3.16217, 1, 0, 0, 1, 1,
-0.9722401, 0.9045843, -1.782914, 1, 0, 0, 1, 1,
-0.9721944, 0.1859634, 0.2039333, 1, 0, 0, 1, 1,
-0.9624081, 0.9852368, -1.69733, 1, 0, 0, 1, 1,
-0.9578867, -0.6237918, -3.052406, 0, 0, 0, 1, 1,
-0.9541225, 1.141786, -1.430703, 0, 0, 0, 1, 1,
-0.9461077, 0.1128686, -1.180999, 0, 0, 0, 1, 1,
-0.9451794, -0.2005705, -0.5844585, 0, 0, 0, 1, 1,
-0.9425129, 1.055036, -1.588482, 0, 0, 0, 1, 1,
-0.9405882, -0.3987727, -2.389207, 0, 0, 0, 1, 1,
-0.9401171, -1.021575, -1.823666, 0, 0, 0, 1, 1,
-0.936213, -0.7567798, -3.396294, 1, 1, 1, 1, 1,
-0.9357121, -0.612348, -3.527415, 1, 1, 1, 1, 1,
-0.9355679, 0.7703752, -1.726765, 1, 1, 1, 1, 1,
-0.9344443, -0.6644442, -1.59282, 1, 1, 1, 1, 1,
-0.9343388, -0.7277061, -1.361662, 1, 1, 1, 1, 1,
-0.9311329, 1.139655, 0.8768098, 1, 1, 1, 1, 1,
-0.9293991, 0.3366595, -0.6255265, 1, 1, 1, 1, 1,
-0.9238526, -0.1240873, -0.01903844, 1, 1, 1, 1, 1,
-0.9225919, -0.958271, -2.597062, 1, 1, 1, 1, 1,
-0.916336, 1.186409, 2.939511, 1, 1, 1, 1, 1,
-0.9105234, 0.003763834, -1.797591, 1, 1, 1, 1, 1,
-0.9082612, 2.086024, -0.6203827, 1, 1, 1, 1, 1,
-0.9079764, -1.158354, -3.525953, 1, 1, 1, 1, 1,
-0.903756, -1.071102, -2.89024, 1, 1, 1, 1, 1,
-0.9017293, 0.01756985, -1.062522, 1, 1, 1, 1, 1,
-0.9009528, -1.334069, -3.525236, 0, 0, 1, 1, 1,
-0.8981316, 0.7424544, -0.1414889, 1, 0, 0, 1, 1,
-0.8960176, -1.512343, -2.936696, 1, 0, 0, 1, 1,
-0.8944396, 0.2865266, -1.040561, 1, 0, 0, 1, 1,
-0.8924962, -0.04095421, -1.871944, 1, 0, 0, 1, 1,
-0.8922186, 0.2196168, -0.7251679, 1, 0, 0, 1, 1,
-0.8888662, 1.084349, -2.785485, 0, 0, 0, 1, 1,
-0.884392, -0.3594992, -1.756358, 0, 0, 0, 1, 1,
-0.8782226, -2.614478, -3.467223, 0, 0, 0, 1, 1,
-0.8769665, 1.077601, -1.355784, 0, 0, 0, 1, 1,
-0.872765, 0.7642198, -0.04883962, 0, 0, 0, 1, 1,
-0.8624065, 0.5721037, -2.766653, 0, 0, 0, 1, 1,
-0.8579457, -0.6030518, 0.2131916, 0, 0, 0, 1, 1,
-0.8511898, -0.534865, -3.130219, 1, 1, 1, 1, 1,
-0.8449211, -0.5438931, -1.783386, 1, 1, 1, 1, 1,
-0.8436906, 1.390172, 0.3030616, 1, 1, 1, 1, 1,
-0.8428088, 0.01268616, -1.272863, 1, 1, 1, 1, 1,
-0.8340362, -2.260347, -1.960271, 1, 1, 1, 1, 1,
-0.8323809, -1.867009, -2.061937, 1, 1, 1, 1, 1,
-0.8230658, -1.247278, -1.326661, 1, 1, 1, 1, 1,
-0.8220113, 2.420416, 0.5038348, 1, 1, 1, 1, 1,
-0.8199141, -0.361684, -4.261198, 1, 1, 1, 1, 1,
-0.8197051, 1.223543, -0.3345232, 1, 1, 1, 1, 1,
-0.8172766, 0.495977, -2.843433, 1, 1, 1, 1, 1,
-0.8167694, -0.5641649, -2.811752, 1, 1, 1, 1, 1,
-0.8122182, -1.773892, -2.176044, 1, 1, 1, 1, 1,
-0.8071048, 1.327027, -0.6161718, 1, 1, 1, 1, 1,
-0.8068321, -0.9107265, -4.651315, 1, 1, 1, 1, 1,
-0.8026826, -0.2384635, -0.5290743, 0, 0, 1, 1, 1,
-0.8020521, -1.472642, -3.582635, 1, 0, 0, 1, 1,
-0.7984638, -1.109123, -2.095335, 1, 0, 0, 1, 1,
-0.7929146, -1.106156, -1.920422, 1, 0, 0, 1, 1,
-0.7911883, -1.055687, -3.048025, 1, 0, 0, 1, 1,
-0.7902145, -0.3848414, -2.588027, 1, 0, 0, 1, 1,
-0.7891375, 0.4537968, -0.2244533, 0, 0, 0, 1, 1,
-0.7830084, -1.820941, -2.732437, 0, 0, 0, 1, 1,
-0.7773045, 0.335574, -1.050236, 0, 0, 0, 1, 1,
-0.7738061, 3.164264, 0.1699696, 0, 0, 0, 1, 1,
-0.7582135, 1.100664, 0.3584293, 0, 0, 0, 1, 1,
-0.7573971, -0.3727049, -2.226463, 0, 0, 0, 1, 1,
-0.7488119, 1.280439, 0.6904454, 0, 0, 0, 1, 1,
-0.7474693, -2.170416, -1.474207, 1, 1, 1, 1, 1,
-0.7442763, 0.9524102, 0.6667315, 1, 1, 1, 1, 1,
-0.7430345, 0.5993299, 0.5618612, 1, 1, 1, 1, 1,
-0.7427244, -1.117051, -0.9495023, 1, 1, 1, 1, 1,
-0.7387645, 0.2645035, -0.9329529, 1, 1, 1, 1, 1,
-0.737542, -0.1517361, -3.243286, 1, 1, 1, 1, 1,
-0.7267716, 1.825481, 0.2507354, 1, 1, 1, 1, 1,
-0.7264726, 1.156007, 1.682214, 1, 1, 1, 1, 1,
-0.723219, -1.539013, -2.648674, 1, 1, 1, 1, 1,
-0.7181867, -0.6571603, -1.818469, 1, 1, 1, 1, 1,
-0.7138013, -0.9497547, -3.754368, 1, 1, 1, 1, 1,
-0.6983551, 2.577758, -2.092115, 1, 1, 1, 1, 1,
-0.6940169, -0.488803, -1.5925, 1, 1, 1, 1, 1,
-0.6864192, -1.027899, -1.837821, 1, 1, 1, 1, 1,
-0.680083, 0.518701, -0.4305457, 1, 1, 1, 1, 1,
-0.6705952, 0.4231071, -1.597925, 0, 0, 1, 1, 1,
-0.6613296, 1.577259, 0.2282542, 1, 0, 0, 1, 1,
-0.6557131, 1.388299, 0.1024052, 1, 0, 0, 1, 1,
-0.6549761, 0.03361141, -0.04777801, 1, 0, 0, 1, 1,
-0.6546255, 0.5473928, -0.8760169, 1, 0, 0, 1, 1,
-0.6537464, 1.682302, -0.1266487, 1, 0, 0, 1, 1,
-0.6519955, 0.7807043, -2.177717, 0, 0, 0, 1, 1,
-0.6510747, -1.579777, -3.743212, 0, 0, 0, 1, 1,
-0.6429976, 0.1297508, -1.242887, 0, 0, 0, 1, 1,
-0.6390406, -0.1611411, -3.2398, 0, 0, 0, 1, 1,
-0.6388443, -0.6700581, -1.822832, 0, 0, 0, 1, 1,
-0.6375152, -1.038113, -1.925214, 0, 0, 0, 1, 1,
-0.6331935, 1.896584, 0.7635285, 0, 0, 0, 1, 1,
-0.6312416, -0.1052986, -0.9716483, 1, 1, 1, 1, 1,
-0.629564, 0.7494766, -1.338519, 1, 1, 1, 1, 1,
-0.6288803, -0.7670206, -0.9402196, 1, 1, 1, 1, 1,
-0.6255817, 0.5296448, -1.588523, 1, 1, 1, 1, 1,
-0.6222973, 0.01138643, -1.028271, 1, 1, 1, 1, 1,
-0.6218528, -0.5952696, -3.208504, 1, 1, 1, 1, 1,
-0.6216999, 0.3781762, 0.1009618, 1, 1, 1, 1, 1,
-0.6195552, -0.7796413, -2.0357, 1, 1, 1, 1, 1,
-0.6166418, -0.2053545, -2.501015, 1, 1, 1, 1, 1,
-0.6143741, 0.2342552, -0.6040146, 1, 1, 1, 1, 1,
-0.6139112, -0.03249861, -1.364444, 1, 1, 1, 1, 1,
-0.6119058, -0.9589561, -1.319921, 1, 1, 1, 1, 1,
-0.60879, 0.05289029, -0.5403583, 1, 1, 1, 1, 1,
-0.6061568, -0.2031746, -2.930654, 1, 1, 1, 1, 1,
-0.6059408, -0.1568826, -0.595616, 1, 1, 1, 1, 1,
-0.5995354, 0.234408, -1.149903, 0, 0, 1, 1, 1,
-0.5971282, 0.768041, -0.7640077, 1, 0, 0, 1, 1,
-0.5961182, -0.8338138, -1.347991, 1, 0, 0, 1, 1,
-0.5934023, 0.1056276, -1.920903, 1, 0, 0, 1, 1,
-0.5886789, 1.452025, 0.8061242, 1, 0, 0, 1, 1,
-0.5872096, -1.030396, -0.7530205, 1, 0, 0, 1, 1,
-0.5860693, -0.919917, -1.027552, 0, 0, 0, 1, 1,
-0.5860347, 0.4480673, -0.2122272, 0, 0, 0, 1, 1,
-0.584982, 0.4514686, 0.1265091, 0, 0, 0, 1, 1,
-0.5832613, -2.279088, -3.836789, 0, 0, 0, 1, 1,
-0.5819926, 0.3167852, -0.05901439, 0, 0, 0, 1, 1,
-0.5794369, -1.157411, -0.9904553, 0, 0, 0, 1, 1,
-0.577184, 1.129004, -0.3388439, 0, 0, 0, 1, 1,
-0.5767285, 0.1461018, -2.411642, 1, 1, 1, 1, 1,
-0.5694523, 1.368214, -0.4616293, 1, 1, 1, 1, 1,
-0.5694111, -3.084613, -2.768873, 1, 1, 1, 1, 1,
-0.5597937, 1.861699, 0.2349877, 1, 1, 1, 1, 1,
-0.5557091, 0.1308516, -0.560256, 1, 1, 1, 1, 1,
-0.5551133, 1.304785, -0.1550764, 1, 1, 1, 1, 1,
-0.5545811, -1.17255, -3.538569, 1, 1, 1, 1, 1,
-0.5536697, 0.9546456, -0.8978819, 1, 1, 1, 1, 1,
-0.5532698, -1.941971, -2.920438, 1, 1, 1, 1, 1,
-0.5528563, 0.4132376, -2.325011, 1, 1, 1, 1, 1,
-0.5527077, 0.4523319, -0.4504569, 1, 1, 1, 1, 1,
-0.5523107, 1.164771, 0.109055, 1, 1, 1, 1, 1,
-0.5464073, 0.6750764, -1.328423, 1, 1, 1, 1, 1,
-0.543208, -1.190972, -2.778053, 1, 1, 1, 1, 1,
-0.5426627, -0.8133133, -2.266575, 1, 1, 1, 1, 1,
-0.5387923, -0.3592986, -0.8002086, 0, 0, 1, 1, 1,
-0.5386456, 1.274866, 1.193596, 1, 0, 0, 1, 1,
-0.5334186, 0.1344277, -1.033364, 1, 0, 0, 1, 1,
-0.5332676, 1.354706, 1.378687, 1, 0, 0, 1, 1,
-0.5313335, -0.9346046, -2.449747, 1, 0, 0, 1, 1,
-0.5264841, 0.2439746, -2.782921, 1, 0, 0, 1, 1,
-0.5262361, 0.7871154, -0.2063379, 0, 0, 0, 1, 1,
-0.5257748, 0.6986268, -1.356212, 0, 0, 0, 1, 1,
-0.5243544, 0.8072371, -1.741224, 0, 0, 0, 1, 1,
-0.5239836, -1.630276, -2.947235, 0, 0, 0, 1, 1,
-0.5229434, -0.02161305, -0.7270803, 0, 0, 0, 1, 1,
-0.519095, 0.1850438, -1.225078, 0, 0, 0, 1, 1,
-0.5139869, 0.6753434, -2.01763, 0, 0, 0, 1, 1,
-0.5131961, -0.1338684, -2.214034, 1, 1, 1, 1, 1,
-0.5093233, -0.854532, -2.251418, 1, 1, 1, 1, 1,
-0.5079657, -0.9756364, -2.346454, 1, 1, 1, 1, 1,
-0.5046487, 0.2396813, -0.6738058, 1, 1, 1, 1, 1,
-0.5027624, 0.007060757, -2.071973, 1, 1, 1, 1, 1,
-0.5018024, 0.4738124, -0.5155986, 1, 1, 1, 1, 1,
-0.5017194, 0.4787864, 1.604468, 1, 1, 1, 1, 1,
-0.5006558, 1.246974, -0.2355993, 1, 1, 1, 1, 1,
-0.498645, -0.3519905, -2.437828, 1, 1, 1, 1, 1,
-0.4983364, 0.412708, -0.403387, 1, 1, 1, 1, 1,
-0.4891327, -0.7521249, -0.2741954, 1, 1, 1, 1, 1,
-0.4874785, 0.9169413, -1.654379, 1, 1, 1, 1, 1,
-0.487373, 0.4142044, -2.081991, 1, 1, 1, 1, 1,
-0.4852434, -0.07963206, -0.198249, 1, 1, 1, 1, 1,
-0.4830343, -1.048996, -2.79592, 1, 1, 1, 1, 1,
-0.4796348, -0.8941561, -2.506595, 0, 0, 1, 1, 1,
-0.4695372, -0.4506219, -0.7520007, 1, 0, 0, 1, 1,
-0.4681901, 0.781783, -0.4902916, 1, 0, 0, 1, 1,
-0.4676408, -1.650842, -2.358095, 1, 0, 0, 1, 1,
-0.4651802, 0.9486452, -0.2511128, 1, 0, 0, 1, 1,
-0.4520923, 1.446722, -1.778661, 1, 0, 0, 1, 1,
-0.4420464, -1.937605, -3.077636, 0, 0, 0, 1, 1,
-0.4415009, -0.4650361, -1.575299, 0, 0, 0, 1, 1,
-0.4287034, 2.767088, 0.7205973, 0, 0, 0, 1, 1,
-0.4273865, 0.4838745, 1.338422, 0, 0, 0, 1, 1,
-0.4268703, 0.5616366, -1.917005, 0, 0, 0, 1, 1,
-0.4267198, -3.182533, -3.814214, 0, 0, 0, 1, 1,
-0.4243612, 0.7686109, -1.210358, 0, 0, 0, 1, 1,
-0.4209346, 1.101444, 0.4457243, 1, 1, 1, 1, 1,
-0.41629, -0.03700498, -1.548438, 1, 1, 1, 1, 1,
-0.4158859, -3.460933, -4.185068, 1, 1, 1, 1, 1,
-0.4138361, -0.4463934, -3.290511, 1, 1, 1, 1, 1,
-0.4138046, 0.8829831, 0.2779924, 1, 1, 1, 1, 1,
-0.4101854, 0.04528164, -2.094076, 1, 1, 1, 1, 1,
-0.4080392, -2.07567, -3.118441, 1, 1, 1, 1, 1,
-0.4045927, 1.614763, -1.767892, 1, 1, 1, 1, 1,
-0.4037424, -2.799135, -2.822837, 1, 1, 1, 1, 1,
-0.4010839, 1.553765, 0.1318091, 1, 1, 1, 1, 1,
-0.3948379, -0.8922263, -3.854364, 1, 1, 1, 1, 1,
-0.3882851, 0.2339062, -1.286535, 1, 1, 1, 1, 1,
-0.3860779, 0.5042754, -2.304553, 1, 1, 1, 1, 1,
-0.3857402, 0.6372082, -0.513851, 1, 1, 1, 1, 1,
-0.3855947, 0.8260192, -1.439052, 1, 1, 1, 1, 1,
-0.38145, -0.8564097, -2.536393, 0, 0, 1, 1, 1,
-0.3747235, 0.04928862, -1.879877, 1, 0, 0, 1, 1,
-0.3735991, 0.05325701, -2.053977, 1, 0, 0, 1, 1,
-0.3686585, 0.5199092, -1.158319, 1, 0, 0, 1, 1,
-0.3629939, 0.3845541, -0.05619996, 1, 0, 0, 1, 1,
-0.3626129, -0.3017061, -1.182709, 1, 0, 0, 1, 1,
-0.3593476, -1.523656, -4.01148, 0, 0, 0, 1, 1,
-0.3584537, -0.7944034, -4.07306, 0, 0, 0, 1, 1,
-0.3564368, -0.2203389, -1.849085, 0, 0, 0, 1, 1,
-0.3553827, 0.7268125, 0.2145651, 0, 0, 0, 1, 1,
-0.3514503, 2.135688, 0.3171972, 0, 0, 0, 1, 1,
-0.3456531, -0.1166021, -1.696194, 0, 0, 0, 1, 1,
-0.3454487, 1.239027, -0.4924621, 0, 0, 0, 1, 1,
-0.3451575, -1.657385, -2.600874, 1, 1, 1, 1, 1,
-0.3366872, -2.15868, -3.893424, 1, 1, 1, 1, 1,
-0.3358799, 0.03452168, -0.4918281, 1, 1, 1, 1, 1,
-0.3336282, -0.7121183, -2.401112, 1, 1, 1, 1, 1,
-0.3316274, 0.5091097, 0.407233, 1, 1, 1, 1, 1,
-0.3250786, -0.3332294, -1.927577, 1, 1, 1, 1, 1,
-0.3208496, -1.675063, -3.20521, 1, 1, 1, 1, 1,
-0.3198756, 0.7150955, 0.5879335, 1, 1, 1, 1, 1,
-0.3185622, -2.088338, -3.667882, 1, 1, 1, 1, 1,
-0.3154596, -2.09172, -2.982233, 1, 1, 1, 1, 1,
-0.3138545, 1.040273, -0.8776973, 1, 1, 1, 1, 1,
-0.3121457, 0.0534278, -0.8737357, 1, 1, 1, 1, 1,
-0.3107699, 0.1909204, 0.2756184, 1, 1, 1, 1, 1,
-0.3081318, -2.206048, -2.429534, 1, 1, 1, 1, 1,
-0.3066622, -1.071301, -1.865619, 1, 1, 1, 1, 1,
-0.302381, -1.510206, -3.218448, 0, 0, 1, 1, 1,
-0.3010665, -0.2823691, -1.631769, 1, 0, 0, 1, 1,
-0.3001955, 1.975393, -0.07303006, 1, 0, 0, 1, 1,
-0.2968812, 2.010794, 1.112112, 1, 0, 0, 1, 1,
-0.2964939, -1.624473, -4.114573, 1, 0, 0, 1, 1,
-0.2958385, 0.02412053, -0.7459279, 1, 0, 0, 1, 1,
-0.2938401, -2.114018, -4.129591, 0, 0, 0, 1, 1,
-0.2934726, -0.08706512, -0.1866191, 0, 0, 0, 1, 1,
-0.2932416, -0.2637236, -2.769991, 0, 0, 0, 1, 1,
-0.2887465, -0.6495573, -2.610832, 0, 0, 0, 1, 1,
-0.288288, -0.3091526, -2.435712, 0, 0, 0, 1, 1,
-0.2856272, 2.445904, -1.699924, 0, 0, 0, 1, 1,
-0.2833482, 0.3681885, -0.07229391, 0, 0, 0, 1, 1,
-0.2818477, 2.232241, -0.9102905, 1, 1, 1, 1, 1,
-0.2804092, -0.1845914, -2.113682, 1, 1, 1, 1, 1,
-0.2797647, -0.2869053, -2.621457, 1, 1, 1, 1, 1,
-0.2779628, -1.789516, -2.189891, 1, 1, 1, 1, 1,
-0.2747184, 0.7949355, -0.7004964, 1, 1, 1, 1, 1,
-0.2680787, 1.432006, 0.4721429, 1, 1, 1, 1, 1,
-0.2665674, 1.073017, -1.006484, 1, 1, 1, 1, 1,
-0.2640725, 0.1055004, -2.861868, 1, 1, 1, 1, 1,
-0.2628534, 2.003287, 0.6362468, 1, 1, 1, 1, 1,
-0.2569059, 0.6300725, 2.4128, 1, 1, 1, 1, 1,
-0.252222, 0.346084, 1.156155, 1, 1, 1, 1, 1,
-0.2477819, 0.7525576, 0.6275056, 1, 1, 1, 1, 1,
-0.2473262, 1.178327, -0.6016721, 1, 1, 1, 1, 1,
-0.2456173, -2.095762, -3.28831, 1, 1, 1, 1, 1,
-0.2450509, -0.02706566, -3.268159, 1, 1, 1, 1, 1,
-0.2408618, 0.7969512, -0.09640453, 0, 0, 1, 1, 1,
-0.2310895, -1.066025, -1.467617, 1, 0, 0, 1, 1,
-0.2273712, -0.7152447, -2.833779, 1, 0, 0, 1, 1,
-0.2260106, -1.172742, -1.985416, 1, 0, 0, 1, 1,
-0.2244636, 0.5765197, -2.071849, 1, 0, 0, 1, 1,
-0.2223268, 0.08524949, -0.7956558, 1, 0, 0, 1, 1,
-0.2218157, 0.4906851, 0.7736923, 0, 0, 0, 1, 1,
-0.2207809, 0.1097498, -2.182639, 0, 0, 0, 1, 1,
-0.217941, -0.2152043, -4.600716, 0, 0, 0, 1, 1,
-0.2118303, -0.340817, -2.39954, 0, 0, 0, 1, 1,
-0.2116909, 1.429687, -1.706634, 0, 0, 0, 1, 1,
-0.2057619, -0.2739673, -1.508833, 0, 0, 0, 1, 1,
-0.2035893, 0.3296993, -0.3785572, 0, 0, 0, 1, 1,
-0.2003559, -0.2160508, -2.648632, 1, 1, 1, 1, 1,
-0.1997866, -0.7465955, -4.749343, 1, 1, 1, 1, 1,
-0.1992762, -0.6424907, -1.151134, 1, 1, 1, 1, 1,
-0.1990547, 1.112682, 0.08345783, 1, 1, 1, 1, 1,
-0.1988937, 1.613615, 0.539887, 1, 1, 1, 1, 1,
-0.1963641, 1.841384, 0.191912, 1, 1, 1, 1, 1,
-0.1963294, -1.606291, -3.780926, 1, 1, 1, 1, 1,
-0.1926259, -0.1016774, -2.699248, 1, 1, 1, 1, 1,
-0.1909939, -0.4224139, -1.255638, 1, 1, 1, 1, 1,
-0.1907586, -0.2566981, -1.406363, 1, 1, 1, 1, 1,
-0.1902294, -1.152521, -5.509425, 1, 1, 1, 1, 1,
-0.1878219, -0.4230938, -3.127007, 1, 1, 1, 1, 1,
-0.1840303, -1.147794, -3.28007, 1, 1, 1, 1, 1,
-0.1822415, -1.758492, -3.804223, 1, 1, 1, 1, 1,
-0.17843, 1.533805, -0.2938047, 1, 1, 1, 1, 1,
-0.1774783, -0.6456208, -2.089399, 0, 0, 1, 1, 1,
-0.1745009, 0.01648265, 0.4205271, 1, 0, 0, 1, 1,
-0.1713592, 0.07710797, -1.217157, 1, 0, 0, 1, 1,
-0.163887, -0.2769525, -1.9264, 1, 0, 0, 1, 1,
-0.1637267, 1.284724, 0.3582562, 1, 0, 0, 1, 1,
-0.1629594, 1.254911, 0.1510013, 1, 0, 0, 1, 1,
-0.1617237, -1.325917, -4.233746, 0, 0, 0, 1, 1,
-0.1612431, 0.9295713, 2.56287, 0, 0, 0, 1, 1,
-0.1580112, 1.636621, -0.9478328, 0, 0, 0, 1, 1,
-0.1578896, 0.3257981, -1.943256, 0, 0, 0, 1, 1,
-0.1555395, -0.7523094, -3.569809, 0, 0, 0, 1, 1,
-0.1518283, -1.037892, -4.309112, 0, 0, 0, 1, 1,
-0.1517199, 0.1549082, -2.539557, 0, 0, 0, 1, 1,
-0.1503491, -0.3379915, -1.701254, 1, 1, 1, 1, 1,
-0.1492587, -0.9333947, -3.80025, 1, 1, 1, 1, 1,
-0.148696, 0.2085773, -1.907102, 1, 1, 1, 1, 1,
-0.1486303, -1.04719, -3.573476, 1, 1, 1, 1, 1,
-0.1483963, 1.535098, -0.3216383, 1, 1, 1, 1, 1,
-0.1469698, -1.210191, -3.449548, 1, 1, 1, 1, 1,
-0.1450815, 1.041265, -0.9363279, 1, 1, 1, 1, 1,
-0.143637, -1.014184, -3.958939, 1, 1, 1, 1, 1,
-0.1402494, 1.718613, 0.6558723, 1, 1, 1, 1, 1,
-0.1312661, 1.243301, 1.087447, 1, 1, 1, 1, 1,
-0.1304703, -0.3432949, -2.628594, 1, 1, 1, 1, 1,
-0.1226972, -1.630889, -3.18259, 1, 1, 1, 1, 1,
-0.1223401, 0.6910875, -0.4626713, 1, 1, 1, 1, 1,
-0.1217819, 0.4692042, 0.4759417, 1, 1, 1, 1, 1,
-0.1187209, -0.1876329, -2.372514, 1, 1, 1, 1, 1,
-0.1176656, -0.2691443, -3.326886, 0, 0, 1, 1, 1,
-0.1170882, -0.7476133, -2.537265, 1, 0, 0, 1, 1,
-0.1009563, -0.7525403, -3.733237, 1, 0, 0, 1, 1,
-0.1003567, -1.370857, -1.974913, 1, 0, 0, 1, 1,
-0.09841371, 0.130591, -1.155059, 1, 0, 0, 1, 1,
-0.09478338, -1.410235, -2.745106, 1, 0, 0, 1, 1,
-0.09283827, -1.2561, -2.598557, 0, 0, 0, 1, 1,
-0.09220009, 0.5338778, 0.7612826, 0, 0, 0, 1, 1,
-0.09063808, -0.1765231, -3.060759, 0, 0, 0, 1, 1,
-0.08955057, -0.4654111, -3.099846, 0, 0, 0, 1, 1,
-0.0879413, -0.2521576, -2.189898, 0, 0, 0, 1, 1,
-0.08755653, -0.1103048, -1.978318, 0, 0, 0, 1, 1,
-0.07674044, -1.969207, -3.041453, 0, 0, 0, 1, 1,
-0.07279123, 1.427402, 1.055357, 1, 1, 1, 1, 1,
-0.07185124, -0.3448468, -1.435072, 1, 1, 1, 1, 1,
-0.07145164, 0.6991384, -1.624247, 1, 1, 1, 1, 1,
-0.06950179, -0.965219, -3.759701, 1, 1, 1, 1, 1,
-0.06260095, -0.4459796, -2.069406, 1, 1, 1, 1, 1,
-0.06246486, 1.797913, 0.5368639, 1, 1, 1, 1, 1,
-0.0610308, -0.01155509, -2.097207, 1, 1, 1, 1, 1,
-0.06046349, -2.029269, -4.374028, 1, 1, 1, 1, 1,
-0.05870588, 0.6079552, 0.5301572, 1, 1, 1, 1, 1,
-0.058539, -0.01409812, -2.119862, 1, 1, 1, 1, 1,
-0.0561543, 0.5603098, -1.11932, 1, 1, 1, 1, 1,
-0.05528064, 1.029241, 1.298357, 1, 1, 1, 1, 1,
-0.05387189, 1.269584, -0.9205072, 1, 1, 1, 1, 1,
-0.05284961, 2.783, 1.270611, 1, 1, 1, 1, 1,
-0.05022975, 0.6703491, 0.2191946, 1, 1, 1, 1, 1,
-0.04930775, -0.7336329, -4.137913, 0, 0, 1, 1, 1,
-0.04840005, 0.8373733, -1.18341, 1, 0, 0, 1, 1,
-0.04807515, 0.4711624, 0.490895, 1, 0, 0, 1, 1,
-0.04704858, -0.1425282, -3.53173, 1, 0, 0, 1, 1,
-0.04696082, -0.1557502, -3.432805, 1, 0, 0, 1, 1,
-0.04660228, 0.1420161, -1.393526, 1, 0, 0, 1, 1,
-0.04581855, -0.5993047, -3.010136, 0, 0, 0, 1, 1,
-0.0449544, -0.5021248, -2.295128, 0, 0, 0, 1, 1,
-0.04246428, 1.076735, -0.08250754, 0, 0, 0, 1, 1,
-0.04039207, -1.071783, -2.86967, 0, 0, 0, 1, 1,
-0.03667065, -0.05494159, -1.604562, 0, 0, 0, 1, 1,
-0.03641018, -0.09065451, -2.856894, 0, 0, 0, 1, 1,
-0.03177735, 1.1316, 0.7488415, 0, 0, 0, 1, 1,
-0.03101867, -1.04704, -1.764948, 1, 1, 1, 1, 1,
-0.02577738, 0.5594096, -0.9868448, 1, 1, 1, 1, 1,
-0.02373634, -0.7050515, -4.821699, 1, 1, 1, 1, 1,
-0.02284966, 0.5701088, 0.2701362, 1, 1, 1, 1, 1,
-0.01743146, 1.792849, 1.063856, 1, 1, 1, 1, 1,
-0.01696593, -2.574185, -4.260141, 1, 1, 1, 1, 1,
-0.01480695, 0.06316841, 1.030086, 1, 1, 1, 1, 1,
-0.01249944, -1.856001, -2.98247, 1, 1, 1, 1, 1,
-0.01091869, 0.4699062, -1.406535, 1, 1, 1, 1, 1,
-0.009800702, 0.6262007, 1.261086, 1, 1, 1, 1, 1,
-0.008134166, -0.5684504, -3.91664, 1, 1, 1, 1, 1,
-0.006115743, -0.0999391, -4.817111, 1, 1, 1, 1, 1,
-0.004034715, 0.8487832, 0.1093078, 1, 1, 1, 1, 1,
-0.0007068213, -2.457273, -3.951221, 1, 1, 1, 1, 1,
-3.167321e-05, -0.06357332, -3.113941, 1, 1, 1, 1, 1,
0.001504823, 2.131723, 1.214171, 0, 0, 1, 1, 1,
0.006138945, 1.606529, 1.219054, 1, 0, 0, 1, 1,
0.01078776, 0.5127217, 2.684452, 1, 0, 0, 1, 1,
0.01220294, -0.7073604, 2.986399, 1, 0, 0, 1, 1,
0.01461129, 0.640285, 1.154755, 1, 0, 0, 1, 1,
0.01547438, -0.007259931, 2.497602, 1, 0, 0, 1, 1,
0.016365, -1.195592, 3.702388, 0, 0, 0, 1, 1,
0.0183455, 0.9599746, -0.7196434, 0, 0, 0, 1, 1,
0.02095605, 1.305846, 1.208328, 0, 0, 0, 1, 1,
0.02390051, -1.040105, 2.253287, 0, 0, 0, 1, 1,
0.02994027, -1.11569, 2.682765, 0, 0, 0, 1, 1,
0.03854693, 1.546203, 1.607121, 0, 0, 0, 1, 1,
0.03985026, -0.3046992, 4.270679, 0, 0, 0, 1, 1,
0.0437215, -1.508615, 3.217566, 1, 1, 1, 1, 1,
0.0469235, 0.5962981, -0.8295683, 1, 1, 1, 1, 1,
0.04810274, -0.3925093, 4.281497, 1, 1, 1, 1, 1,
0.05056919, -0.685357, 1.95687, 1, 1, 1, 1, 1,
0.05099718, -0.8954399, 1.923204, 1, 1, 1, 1, 1,
0.05222025, 0.04124038, 1.188626, 1, 1, 1, 1, 1,
0.0553121, -1.259774, 4.276092, 1, 1, 1, 1, 1,
0.05762299, -0.3087098, 0.8203745, 1, 1, 1, 1, 1,
0.06250072, 0.9448324, 1.853989, 1, 1, 1, 1, 1,
0.06302416, -0.2180715, 3.561893, 1, 1, 1, 1, 1,
0.06603654, 0.2170426, -0.5027891, 1, 1, 1, 1, 1,
0.07192399, -1.174151, 2.947117, 1, 1, 1, 1, 1,
0.07552936, 0.1984099, 1.844005, 1, 1, 1, 1, 1,
0.07724889, 0.913353, -0.6219206, 1, 1, 1, 1, 1,
0.07756722, -0.2326529, 1.218158, 1, 1, 1, 1, 1,
0.07827596, 1.246969, -1.05368, 0, 0, 1, 1, 1,
0.07905385, 1.223327, 0.49261, 1, 0, 0, 1, 1,
0.07952645, -0.2030873, 2.055464, 1, 0, 0, 1, 1,
0.09081221, -0.2235813, 3.72716, 1, 0, 0, 1, 1,
0.09282409, -0.2019798, 2.680628, 1, 0, 0, 1, 1,
0.09369053, 2.469465, -0.6111592, 1, 0, 0, 1, 1,
0.09476462, 1.492642, 0.7692512, 0, 0, 0, 1, 1,
0.09606806, 0.4870353, 0.8022189, 0, 0, 0, 1, 1,
0.09820979, 0.8709153, 0.7869865, 0, 0, 0, 1, 1,
0.1060232, -1.096833, 4.06585, 0, 0, 0, 1, 1,
0.106864, 2.138774, 0.0346159, 0, 0, 0, 1, 1,
0.1099006, 0.3193071, -0.9001523, 0, 0, 0, 1, 1,
0.1107799, 0.521677, 0.6172488, 0, 0, 0, 1, 1,
0.1125396, 0.4579856, 1.005145, 1, 1, 1, 1, 1,
0.1155616, -0.6763088, 3.454057, 1, 1, 1, 1, 1,
0.1163234, 0.6126776, 0.3497065, 1, 1, 1, 1, 1,
0.1211627, -0.1638943, 2.504117, 1, 1, 1, 1, 1,
0.1213578, 0.007191931, 1.831122, 1, 1, 1, 1, 1,
0.1259788, -2.067485, 3.629218, 1, 1, 1, 1, 1,
0.1286319, 0.1666922, 0.3369074, 1, 1, 1, 1, 1,
0.1301514, 1.653021, -1.324745, 1, 1, 1, 1, 1,
0.1310499, -1.615986, 2.725963, 1, 1, 1, 1, 1,
0.1353903, 0.1060082, 0.8158231, 1, 1, 1, 1, 1,
0.1368104, -0.3049399, 4.48954, 1, 1, 1, 1, 1,
0.1386428, 0.9930893, -0.3596474, 1, 1, 1, 1, 1,
0.1422202, -0.9367173, 2.23445, 1, 1, 1, 1, 1,
0.1458584, -0.5030218, 3.807552, 1, 1, 1, 1, 1,
0.1502886, 0.995221, -0.4548896, 1, 1, 1, 1, 1,
0.1569023, -0.08006302, 1.53626, 0, 0, 1, 1, 1,
0.1587187, -0.5001055, 2.341462, 1, 0, 0, 1, 1,
0.1596689, -2.234751, 3.867768, 1, 0, 0, 1, 1,
0.1654196, 0.4463673, -0.1978634, 1, 0, 0, 1, 1,
0.1663324, 1.557147, -0.3981911, 1, 0, 0, 1, 1,
0.1673891, -1.363426, 3.266556, 1, 0, 0, 1, 1,
0.1687818, 0.9943409, 0.7404112, 0, 0, 0, 1, 1,
0.1692246, 0.5632496, 0.5750554, 0, 0, 0, 1, 1,
0.1704085, -0.2724232, 2.310085, 0, 0, 0, 1, 1,
0.1716161, -0.2945153, 4.094304, 0, 0, 0, 1, 1,
0.1723572, -0.2418231, 3.5052, 0, 0, 0, 1, 1,
0.174601, -1.148341, 1.953903, 0, 0, 0, 1, 1,
0.1757244, 0.1386535, -0.08419797, 0, 0, 0, 1, 1,
0.1777305, -1.54267, 4.891776, 1, 1, 1, 1, 1,
0.1787586, -0.2364388, 1.862785, 1, 1, 1, 1, 1,
0.1833644, 0.5032129, -1.296701, 1, 1, 1, 1, 1,
0.1884589, 0.7039762, -0.4442442, 1, 1, 1, 1, 1,
0.189444, -0.7405065, 3.566961, 1, 1, 1, 1, 1,
0.1906281, 1.228052, 1.067482, 1, 1, 1, 1, 1,
0.1913177, 0.7182723, -0.9156592, 1, 1, 1, 1, 1,
0.1992095, 0.5989098, 2.181506, 1, 1, 1, 1, 1,
0.2001023, 0.1984704, 0.3668128, 1, 1, 1, 1, 1,
0.2003343, -0.8384925, 2.482398, 1, 1, 1, 1, 1,
0.2061762, 0.5602161, -0.3369227, 1, 1, 1, 1, 1,
0.2216095, 0.3563356, 1.556543, 1, 1, 1, 1, 1,
0.2245064, 0.228847, -0.4346786, 1, 1, 1, 1, 1,
0.2260499, -0.8847145, 2.601539, 1, 1, 1, 1, 1,
0.2281447, 0.7158834, 0.5438637, 1, 1, 1, 1, 1,
0.2321185, -0.8923397, 1.790563, 0, 0, 1, 1, 1,
0.23719, -1.209602, 3.802158, 1, 0, 0, 1, 1,
0.2400174, 1.432036, 0.1201165, 1, 0, 0, 1, 1,
0.2425853, 1.438798, -1.511605, 1, 0, 0, 1, 1,
0.2426725, 0.3362581, -0.3867419, 1, 0, 0, 1, 1,
0.2432818, -0.2349659, 4.093414, 1, 0, 0, 1, 1,
0.2584941, -0.6205161, 2.247862, 0, 0, 0, 1, 1,
0.2616214, 1.011769, -0.09337954, 0, 0, 0, 1, 1,
0.2626778, -2.204623, 2.346378, 0, 0, 0, 1, 1,
0.263998, -1.089381, 1.116519, 0, 0, 0, 1, 1,
0.2771567, -0.916809, 1.853555, 0, 0, 0, 1, 1,
0.2775751, -2.03569, 3.122679, 0, 0, 0, 1, 1,
0.2785263, -0.4197531, 3.354706, 0, 0, 0, 1, 1,
0.2829857, -0.8685472, 2.198567, 1, 1, 1, 1, 1,
0.283229, -1.022147, 2.693349, 1, 1, 1, 1, 1,
0.2842253, 0.7841188, -0.8407237, 1, 1, 1, 1, 1,
0.287644, -0.1948356, -0.2158479, 1, 1, 1, 1, 1,
0.2919287, 2.049949, -0.04851396, 1, 1, 1, 1, 1,
0.2937698, -0.02304073, 0.4233198, 1, 1, 1, 1, 1,
0.3000211, 0.3424489, -0.6272844, 1, 1, 1, 1, 1,
0.3025985, 1.54875, 0.0651653, 1, 1, 1, 1, 1,
0.306043, 0.9196571, -0.9839898, 1, 1, 1, 1, 1,
0.3064764, -0.2140553, 1.784729, 1, 1, 1, 1, 1,
0.3075356, 0.9922298, -0.9334189, 1, 1, 1, 1, 1,
0.3077582, -0.003301032, 2.065215, 1, 1, 1, 1, 1,
0.3124621, 0.5149562, 3.34669, 1, 1, 1, 1, 1,
0.3134319, -0.5334266, 3.454399, 1, 1, 1, 1, 1,
0.3164913, -0.8327862, 4.226763, 1, 1, 1, 1, 1,
0.3223905, 1.732379, -0.1787542, 0, 0, 1, 1, 1,
0.3242459, 0.3640688, 1.01131, 1, 0, 0, 1, 1,
0.3256743, -0.766476, 4.263848, 1, 0, 0, 1, 1,
0.3269972, -1.422313, 2.246605, 1, 0, 0, 1, 1,
0.3294609, -0.1250931, 2.395148, 1, 0, 0, 1, 1,
0.3299595, 0.2907394, 0.3155063, 1, 0, 0, 1, 1,
0.3382095, -1.711169, 3.417477, 0, 0, 0, 1, 1,
0.3397358, 0.5443112, 1.837973, 0, 0, 0, 1, 1,
0.3480278, -1.07698, 2.412707, 0, 0, 0, 1, 1,
0.3505768, 0.08257896, 1.438387, 0, 0, 0, 1, 1,
0.3532205, -0.9970835, 2.20436, 0, 0, 0, 1, 1,
0.3575875, -1.430077, 2.86085, 0, 0, 0, 1, 1,
0.3587733, 0.2440457, 2.610173, 0, 0, 0, 1, 1,
0.3592378, -1.977424, 3.986868, 1, 1, 1, 1, 1,
0.3623418, -1.452014, 3.266034, 1, 1, 1, 1, 1,
0.3635422, -0.8217945, 3.573645, 1, 1, 1, 1, 1,
0.3674031, -0.3564354, 1.193544, 1, 1, 1, 1, 1,
0.3685647, 0.457986, 1.492143, 1, 1, 1, 1, 1,
0.371376, -2.025675, 3.582451, 1, 1, 1, 1, 1,
0.3717718, 1.838071, 0.935118, 1, 1, 1, 1, 1,
0.3739723, 1.285071, 0.592629, 1, 1, 1, 1, 1,
0.374676, -1.700232, 1.412575, 1, 1, 1, 1, 1,
0.380852, 0.1437161, 3.036115, 1, 1, 1, 1, 1,
0.3815385, 1.360544, 0.7453816, 1, 1, 1, 1, 1,
0.3841043, 0.7345582, 0.9693094, 1, 1, 1, 1, 1,
0.3845632, 1.015759, 0.7430869, 1, 1, 1, 1, 1,
0.3878673, -1.18179, 3.292322, 1, 1, 1, 1, 1,
0.3888183, 0.4370815, 0.6772366, 1, 1, 1, 1, 1,
0.3936282, 0.1072016, 1.17046, 0, 0, 1, 1, 1,
0.3936421, -0.1038655, 0.9662431, 1, 0, 0, 1, 1,
0.3954042, -1.88178, 2.75143, 1, 0, 0, 1, 1,
0.395668, 1.105374, 1.272632, 1, 0, 0, 1, 1,
0.396585, -0.3976071, 3.926989, 1, 0, 0, 1, 1,
0.4045118, 0.9984995, 0.973057, 1, 0, 0, 1, 1,
0.4069511, -0.0497403, 0.1777838, 0, 0, 0, 1, 1,
0.4092176, -1.401747, 4.924868, 0, 0, 0, 1, 1,
0.4117847, -1.831639, 4.960274, 0, 0, 0, 1, 1,
0.4125748, -1.195217, 3.72463, 0, 0, 0, 1, 1,
0.4189471, 1.230399, -0.6780533, 0, 0, 0, 1, 1,
0.4195424, -0.1762387, 2.775011, 0, 0, 0, 1, 1,
0.4198187, 0.6606359, -1.451478, 0, 0, 0, 1, 1,
0.4199933, 0.1541243, 1.688102, 1, 1, 1, 1, 1,
0.4207219, -0.02217809, 0.9324773, 1, 1, 1, 1, 1,
0.4231575, 0.08923492, -0.5320671, 1, 1, 1, 1, 1,
0.4290356, -0.7809663, 2.799933, 1, 1, 1, 1, 1,
0.4314753, -0.6902274, 0.7209274, 1, 1, 1, 1, 1,
0.4316163, 0.005062058, -0.2411394, 1, 1, 1, 1, 1,
0.4336048, -0.8639336, 2.624683, 1, 1, 1, 1, 1,
0.4339006, -0.07065803, 1.636307, 1, 1, 1, 1, 1,
0.4346712, 0.4151556, 0.5367763, 1, 1, 1, 1, 1,
0.43694, 0.4589657, 0.05806682, 1, 1, 1, 1, 1,
0.4375151, -1.595579, 1.413304, 1, 1, 1, 1, 1,
0.4426965, 0.03227669, 3.762583, 1, 1, 1, 1, 1,
0.4434499, 0.62538, 1.11311, 1, 1, 1, 1, 1,
0.4439819, -2.536237, 2.493762, 1, 1, 1, 1, 1,
0.4447478, -1.003804, 1.827435, 1, 1, 1, 1, 1,
0.4464303, 1.304818, 0.4521858, 0, 0, 1, 1, 1,
0.4485994, 0.6962174, 0.3239346, 1, 0, 0, 1, 1,
0.4593883, -0.06797361, 2.457204, 1, 0, 0, 1, 1,
0.4599016, -1.597397, 1.126746, 1, 0, 0, 1, 1,
0.462405, -0.681111, 2.354383, 1, 0, 0, 1, 1,
0.4667486, -1.960145, 3.172724, 1, 0, 0, 1, 1,
0.4691366, 0.1588776, 1.782596, 0, 0, 0, 1, 1,
0.4775123, 0.1744783, 1.036038, 0, 0, 0, 1, 1,
0.4779011, -0.2297829, 2.715353, 0, 0, 0, 1, 1,
0.482376, -0.7525681, 1.779945, 0, 0, 0, 1, 1,
0.4840201, -0.5662784, 2.813978, 0, 0, 0, 1, 1,
0.4857926, -0.1272635, 1.33461, 0, 0, 0, 1, 1,
0.4864068, 0.2520239, 1.228916, 0, 0, 0, 1, 1,
0.4990515, 0.08977793, 1.777021, 1, 1, 1, 1, 1,
0.5022388, 0.1063716, 0.6963751, 1, 1, 1, 1, 1,
0.5037903, -0.00891574, 1.071196, 1, 1, 1, 1, 1,
0.5088095, -1.109171, 3.630803, 1, 1, 1, 1, 1,
0.511417, -0.9593701, 2.307849, 1, 1, 1, 1, 1,
0.5115277, 0.3682697, 2.775921, 1, 1, 1, 1, 1,
0.5261776, -1.173041, 1.405504, 1, 1, 1, 1, 1,
0.5393652, 0.2086663, 1.75205, 1, 1, 1, 1, 1,
0.5464841, -0.5105757, 2.769707, 1, 1, 1, 1, 1,
0.554888, 0.08999068, 0.8112499, 1, 1, 1, 1, 1,
0.5565487, -0.5359553, 2.500824, 1, 1, 1, 1, 1,
0.5577862, -0.3342558, 2.073359, 1, 1, 1, 1, 1,
0.5643067, -0.1680211, 1.583334, 1, 1, 1, 1, 1,
0.5656033, 1.355181, 1.923491, 1, 1, 1, 1, 1,
0.5664106, 1.681737, -0.3355168, 1, 1, 1, 1, 1,
0.5690165, -0.1432489, 2.422371, 0, 0, 1, 1, 1,
0.5717983, -0.2139834, 2.309301, 1, 0, 0, 1, 1,
0.5722176, -0.5394398, 0.983773, 1, 0, 0, 1, 1,
0.5766038, -0.2904045, 2.674599, 1, 0, 0, 1, 1,
0.5773933, 1.092961, 0.245572, 1, 0, 0, 1, 1,
0.5902919, -0.1977895, 3.261142, 1, 0, 0, 1, 1,
0.591719, 0.2643826, 1.665216, 0, 0, 0, 1, 1,
0.593175, 0.06012538, 2.800335, 0, 0, 0, 1, 1,
0.59802, 1.863227, 0.02094804, 0, 0, 0, 1, 1,
0.6022144, 1.124783, 0.03614278, 0, 0, 0, 1, 1,
0.6029596, -1.318829, 2.444098, 0, 0, 0, 1, 1,
0.6061426, 1.030702, -0.699971, 0, 0, 0, 1, 1,
0.6069387, 0.2867717, 0.8703805, 0, 0, 0, 1, 1,
0.6089943, -0.3462297, 0.2079784, 1, 1, 1, 1, 1,
0.60922, 0.3913654, 0.2702301, 1, 1, 1, 1, 1,
0.6094757, -0.4598207, 3.15525, 1, 1, 1, 1, 1,
0.6115805, 1.015843, 1.918551, 1, 1, 1, 1, 1,
0.6119975, -1.443005, 3.190323, 1, 1, 1, 1, 1,
0.6152954, -2.754213, 2.338026, 1, 1, 1, 1, 1,
0.6253929, -0.0240506, 2.162355, 1, 1, 1, 1, 1,
0.6260856, -0.01191482, 1.258069, 1, 1, 1, 1, 1,
0.6261609, -0.5143566, 1.970467, 1, 1, 1, 1, 1,
0.6291809, -0.443742, 2.447144, 1, 1, 1, 1, 1,
0.6317137, 0.3121606, 2.371263, 1, 1, 1, 1, 1,
0.6351275, -0.09500295, 2.624971, 1, 1, 1, 1, 1,
0.6379692, -0.2890641, 1.950186, 1, 1, 1, 1, 1,
0.6409585, -0.9895061, 2.568134, 1, 1, 1, 1, 1,
0.6426212, -0.3236154, 2.047554, 1, 1, 1, 1, 1,
0.6468289, -0.8455687, 3.52812, 0, 0, 1, 1, 1,
0.651213, 1.337212, 1.860221, 1, 0, 0, 1, 1,
0.6609036, -1.28486, 1.846709, 1, 0, 0, 1, 1,
0.6726285, -0.2909513, 2.825472, 1, 0, 0, 1, 1,
0.6754826, -1.532729, 3.084485, 1, 0, 0, 1, 1,
0.676451, 0.7779641, 1.707144, 1, 0, 0, 1, 1,
0.6795945, 2.471689, -0.231637, 0, 0, 0, 1, 1,
0.6810597, -0.1463509, 0.486666, 0, 0, 0, 1, 1,
0.6832016, -0.1611708, 2.767527, 0, 0, 0, 1, 1,
0.6875923, 1.779612, 1.150894, 0, 0, 0, 1, 1,
0.6919191, 0.4496045, 1.8873, 0, 0, 0, 1, 1,
0.6930854, 0.04741368, 1.317326, 0, 0, 0, 1, 1,
0.6934401, 0.08262286, -0.05915986, 0, 0, 0, 1, 1,
0.695276, -0.6124799, 1.640604, 1, 1, 1, 1, 1,
0.7032392, 0.03920865, 0.07846455, 1, 1, 1, 1, 1,
0.7047266, 0.7094548, 0.4742823, 1, 1, 1, 1, 1,
0.7161326, 0.6974158, 0.2155551, 1, 1, 1, 1, 1,
0.7183225, -0.6844035, 2.063691, 1, 1, 1, 1, 1,
0.7205664, 0.7816163, 1.989427, 1, 1, 1, 1, 1,
0.7224851, -0.7313591, 2.066809, 1, 1, 1, 1, 1,
0.7232046, -1.441588, 3.631513, 1, 1, 1, 1, 1,
0.7234589, -0.9285179, 1.461089, 1, 1, 1, 1, 1,
0.7250617, -1.239062, 2.763196, 1, 1, 1, 1, 1,
0.7290595, 0.2153226, 0.9434251, 1, 1, 1, 1, 1,
0.7338503, -0.6120827, 2.674935, 1, 1, 1, 1, 1,
0.7435945, 0.2700664, 1.548212, 1, 1, 1, 1, 1,
0.7442525, -0.7705371, 2.698453, 1, 1, 1, 1, 1,
0.7451434, 0.3440585, -0.6044617, 1, 1, 1, 1, 1,
0.7457616, 1.345706, -0.5748865, 0, 0, 1, 1, 1,
0.7462113, 0.4811472, 1.007207, 1, 0, 0, 1, 1,
0.7465069, -1.231533, 2.728535, 1, 0, 0, 1, 1,
0.7625558, -0.1913292, 1.137829, 1, 0, 0, 1, 1,
0.7627712, 1.664649, 1.41884, 1, 0, 0, 1, 1,
0.7628133, 1.048419, 0.5968035, 1, 0, 0, 1, 1,
0.7660754, -0.007902124, -0.4681972, 0, 0, 0, 1, 1,
0.7691849, 0.1899028, 1.594252, 0, 0, 0, 1, 1,
0.7720695, 1.67637, -1.626662, 0, 0, 0, 1, 1,
0.7740833, 0.5153134, 2.057374, 0, 0, 0, 1, 1,
0.7741047, -0.3592754, 1.915955, 0, 0, 0, 1, 1,
0.775428, -0.3671636, 2.133646, 0, 0, 0, 1, 1,
0.7822012, -0.1223844, 0.3415163, 0, 0, 0, 1, 1,
0.7839225, -0.2561042, 0.7602675, 1, 1, 1, 1, 1,
0.788801, 0.7932408, 2.005747, 1, 1, 1, 1, 1,
0.7891091, -1.587767, 2.28536, 1, 1, 1, 1, 1,
0.7892899, 0.1092185, 1.361875, 1, 1, 1, 1, 1,
0.7954751, -0.5100102, 1.080292, 1, 1, 1, 1, 1,
0.7981065, 0.6932135, 0.6326697, 1, 1, 1, 1, 1,
0.804676, -0.7594569, 0.3597458, 1, 1, 1, 1, 1,
0.8072278, -0.4569738, 3.035162, 1, 1, 1, 1, 1,
0.8092042, 0.1009065, 2.744368, 1, 1, 1, 1, 1,
0.8198705, -0.9716194, 4.423222, 1, 1, 1, 1, 1,
0.8236406, -0.8988257, 2.56658, 1, 1, 1, 1, 1,
0.8294448, 0.860284, 1.283878, 1, 1, 1, 1, 1,
0.8350076, 1.722446, 1.02616, 1, 1, 1, 1, 1,
0.8359209, -1.315137, 4.201696, 1, 1, 1, 1, 1,
0.8363073, 0.2724233, 2.172552, 1, 1, 1, 1, 1,
0.8437439, -0.6092436, 2.744298, 0, 0, 1, 1, 1,
0.8515223, -0.1741999, 2.422276, 1, 0, 0, 1, 1,
0.8557964, 2.266698, -0.6866588, 1, 0, 0, 1, 1,
0.8561673, -0.3776531, 1.968982, 1, 0, 0, 1, 1,
0.8575622, 0.2037027, 2.145792, 1, 0, 0, 1, 1,
0.8587523, -0.3429721, 1.08201, 1, 0, 0, 1, 1,
0.8617773, 0.01254934, 1.092794, 0, 0, 0, 1, 1,
0.8628455, 0.9385033, 2.083336, 0, 0, 0, 1, 1,
0.8641964, -0.3728203, 2.062028, 0, 0, 0, 1, 1,
0.8687724, 0.2264476, 1.419665, 0, 0, 0, 1, 1,
0.8714392, -0.3060414, -0.6526133, 0, 0, 0, 1, 1,
0.8715762, -0.7764003, 2.916162, 0, 0, 0, 1, 1,
0.8717294, 0.6732289, 2.280921, 0, 0, 0, 1, 1,
0.8727036, -0.217285, 2.674783, 1, 1, 1, 1, 1,
0.876431, 1.59516, 0.9498804, 1, 1, 1, 1, 1,
0.8864421, -1.222206, 3.825374, 1, 1, 1, 1, 1,
0.8866655, 0.6436682, 2.719455, 1, 1, 1, 1, 1,
0.8902668, -0.1482708, 1.949647, 1, 1, 1, 1, 1,
0.8905054, 0.4860429, 1.196759, 1, 1, 1, 1, 1,
0.8949177, 1.604327, 0.4822637, 1, 1, 1, 1, 1,
0.9046609, -1.353877, 3.746883, 1, 1, 1, 1, 1,
0.9116462, 0.03063853, 2.617065, 1, 1, 1, 1, 1,
0.9129251, -1.475138, 3.364637, 1, 1, 1, 1, 1,
0.91865, -0.2976773, 2.082057, 1, 1, 1, 1, 1,
0.9192807, -0.9173623, 1.261945, 1, 1, 1, 1, 1,
0.9261309, -0.6393574, 0.8442602, 1, 1, 1, 1, 1,
0.9264551, -0.7998802, 1.217202, 1, 1, 1, 1, 1,
0.9272636, -0.1770909, 2.114989, 1, 1, 1, 1, 1,
0.9286032, 0.0102229, 1.412879, 0, 0, 1, 1, 1,
0.932115, 1.26859, 0.8301443, 1, 0, 0, 1, 1,
0.937919, 0.7634079, 1.629246, 1, 0, 0, 1, 1,
0.9397365, -0.5821305, 1.234018, 1, 0, 0, 1, 1,
0.9476748, -0.1225322, 1.402375, 1, 0, 0, 1, 1,
0.9624223, -0.1473152, 2.960904, 1, 0, 0, 1, 1,
0.9686582, 0.3803297, 0.6915994, 0, 0, 0, 1, 1,
0.9718214, 0.631793, 0.8418733, 0, 0, 0, 1, 1,
0.9835126, -1.235246, 4.410757, 0, 0, 0, 1, 1,
0.9851349, 1.560043, 2.078249, 0, 0, 0, 1, 1,
0.9876129, -0.361209, 0.4687488, 0, 0, 0, 1, 1,
0.9928934, 0.8155522, 1.853764, 0, 0, 0, 1, 1,
0.9931986, 1.375987, 0.4027895, 0, 0, 0, 1, 1,
1.000206, 0.05604886, 0.1645756, 1, 1, 1, 1, 1,
1.004261, 0.4793031, 1.75787, 1, 1, 1, 1, 1,
1.012378, -2.259611, 1.159173, 1, 1, 1, 1, 1,
1.016502, -0.4574997, 2.262435, 1, 1, 1, 1, 1,
1.025212, 0.715453, 1.013779, 1, 1, 1, 1, 1,
1.027373, 0.9783342, 0.194755, 1, 1, 1, 1, 1,
1.031903, 0.2410233, 1.571275, 1, 1, 1, 1, 1,
1.033217, 0.1688375, 0.9928594, 1, 1, 1, 1, 1,
1.035839, 1.162101, 1.762934, 1, 1, 1, 1, 1,
1.037403, 1.998861, 0.08446757, 1, 1, 1, 1, 1,
1.038258, -0.01977498, 1.181064, 1, 1, 1, 1, 1,
1.040658, 0.4133735, 0.8286436, 1, 1, 1, 1, 1,
1.053313, -1.610284, 3.266319, 1, 1, 1, 1, 1,
1.053494, -0.2613348, 3.235011, 1, 1, 1, 1, 1,
1.061946, -2.292297, 2.367999, 1, 1, 1, 1, 1,
1.065344, 0.4995415, 2.183201, 0, 0, 1, 1, 1,
1.068241, 0.6169938, 1.287339, 1, 0, 0, 1, 1,
1.070334, 0.2083749, 0.9852522, 1, 0, 0, 1, 1,
1.079387, 0.2361821, 1.027566, 1, 0, 0, 1, 1,
1.089014, -0.8061575, 1.935196, 1, 0, 0, 1, 1,
1.095146, 0.2062098, 1.740793, 1, 0, 0, 1, 1,
1.101181, 0.4188961, 1.163186, 0, 0, 0, 1, 1,
1.109719, 0.179305, 0.4949131, 0, 0, 0, 1, 1,
1.114344, 0.5750537, -0.328809, 0, 0, 0, 1, 1,
1.116824, -1.214802, 2.036396, 0, 0, 0, 1, 1,
1.12612, -0.2562745, 1.072853, 0, 0, 0, 1, 1,
1.133195, -0.0472368, 3.5842, 0, 0, 0, 1, 1,
1.137312, 0.7749432, 2.587523, 0, 0, 0, 1, 1,
1.141564, 0.1017695, 2.065518, 1, 1, 1, 1, 1,
1.147919, 1.487316, 0.4778793, 1, 1, 1, 1, 1,
1.154257, -0.2769636, 2.050351, 1, 1, 1, 1, 1,
1.157672, -1.759474, 3.82898, 1, 1, 1, 1, 1,
1.160269, -0.4475087, 0.6877206, 1, 1, 1, 1, 1,
1.160963, -1.632306, 4.048801, 1, 1, 1, 1, 1,
1.177354, 1.344866, 1.00794, 1, 1, 1, 1, 1,
1.187974, -0.9071434, -0.5270449, 1, 1, 1, 1, 1,
1.195434, 1.716283, 2.518087, 1, 1, 1, 1, 1,
1.196509, 0.5501424, -0.3440552, 1, 1, 1, 1, 1,
1.209744, 2.258048, 0.3160885, 1, 1, 1, 1, 1,
1.211915, 1.594447, 1.416964, 1, 1, 1, 1, 1,
1.220567, 0.4254768, -0.3882223, 1, 1, 1, 1, 1,
1.221389, 0.02859139, 1.206533, 1, 1, 1, 1, 1,
1.23123, -0.09842278, 0.3747225, 1, 1, 1, 1, 1,
1.249964, 0.2909954, 1.538144, 0, 0, 1, 1, 1,
1.250999, 0.7670094, -0.1048032, 1, 0, 0, 1, 1,
1.251165, -0.5931587, 2.105945, 1, 0, 0, 1, 1,
1.253472, -1.086225, 2.908024, 1, 0, 0, 1, 1,
1.257057, -0.0602929, 0.05252831, 1, 0, 0, 1, 1,
1.257914, -0.2616207, 3.274268, 1, 0, 0, 1, 1,
1.258722, 1.173655, 0.5100356, 0, 0, 0, 1, 1,
1.259849, 0.1922767, 0.6826541, 0, 0, 0, 1, 1,
1.262661, 1.033862, 1.148207, 0, 0, 0, 1, 1,
1.266702, 2.792819, -0.08147801, 0, 0, 0, 1, 1,
1.269975, -0.185531, 0.8145263, 0, 0, 0, 1, 1,
1.27778, 1.306179, -1.04072, 0, 0, 0, 1, 1,
1.282204, 0.4875749, 2.085702, 0, 0, 0, 1, 1,
1.296752, 1.330231, 0.4219576, 1, 1, 1, 1, 1,
1.30823, -0.8291812, 1.078251, 1, 1, 1, 1, 1,
1.318284, 0.07320819, 1.110188, 1, 1, 1, 1, 1,
1.326884, 0.3613675, 1.038195, 1, 1, 1, 1, 1,
1.330754, -0.7361486, 1.721492, 1, 1, 1, 1, 1,
1.334199, -0.7862904, 2.452836, 1, 1, 1, 1, 1,
1.336818, -1.426524, 4.020756, 1, 1, 1, 1, 1,
1.337463, -0.7672427, 0.5232372, 1, 1, 1, 1, 1,
1.337706, 1.548501, 0.2726465, 1, 1, 1, 1, 1,
1.345872, -0.5895984, 1.226166, 1, 1, 1, 1, 1,
1.357251, 0.9646919, 1.212582, 1, 1, 1, 1, 1,
1.371445, 0.3723559, 1.726681, 1, 1, 1, 1, 1,
1.37266, -0.04657895, 1.991614, 1, 1, 1, 1, 1,
1.376399, -2.183695, 3.831327, 1, 1, 1, 1, 1,
1.380405, 0.5830312, 1.881745, 1, 1, 1, 1, 1,
1.381542, -0.2109523, 2.701387, 0, 0, 1, 1, 1,
1.385166, 0.358438, 4.251752, 1, 0, 0, 1, 1,
1.390804, 0.5294793, -0.4144267, 1, 0, 0, 1, 1,
1.393041, -0.01655015, 1.489332, 1, 0, 0, 1, 1,
1.403235, 1.077292, 0.3065208, 1, 0, 0, 1, 1,
1.409711, -1.781265, 2.017497, 1, 0, 0, 1, 1,
1.409716, -0.6754771, 3.780356, 0, 0, 0, 1, 1,
1.412581, -0.9573641, 1.338458, 0, 0, 0, 1, 1,
1.432997, 1.014636, 0.7577326, 0, 0, 0, 1, 1,
1.440911, -0.7494037, 2.727982, 0, 0, 0, 1, 1,
1.442721, 0.2445454, 1.945153, 0, 0, 0, 1, 1,
1.457636, -0.01210637, 1.984833, 0, 0, 0, 1, 1,
1.461071, 0.8776457, -0.1515174, 0, 0, 0, 1, 1,
1.461702, 1.850493, 2.190095, 1, 1, 1, 1, 1,
1.466321, -0.833696, 1.117401, 1, 1, 1, 1, 1,
1.471522, 1.142887, -0.6488944, 1, 1, 1, 1, 1,
1.480013, 0.03301271, -1.440779, 1, 1, 1, 1, 1,
1.492413, -0.2283499, 0.7308641, 1, 1, 1, 1, 1,
1.497896, -1.061351, 1.669601, 1, 1, 1, 1, 1,
1.511573, 0.2833282, 1.270297, 1, 1, 1, 1, 1,
1.519225, 0.3799082, 0.6443, 1, 1, 1, 1, 1,
1.521522, 0.05138487, 1.026022, 1, 1, 1, 1, 1,
1.522089, -1.143576, 1.416872, 1, 1, 1, 1, 1,
1.526049, -1.592573, 2.778995, 1, 1, 1, 1, 1,
1.52981, -0.08867867, 1.372706, 1, 1, 1, 1, 1,
1.531092, 2.20604, 1.772868, 1, 1, 1, 1, 1,
1.546562, 0.2136069, 2.850076, 1, 1, 1, 1, 1,
1.562822, -1.496524, 2.002731, 1, 1, 1, 1, 1,
1.569503, -0.01574817, 1.990999, 0, 0, 1, 1, 1,
1.599846, 1.027971, 0.3220529, 1, 0, 0, 1, 1,
1.634953, -0.8361273, 4.118765, 1, 0, 0, 1, 1,
1.671409, 0.5182944, 1.579226, 1, 0, 0, 1, 1,
1.671638, -1.150851, 3.184971, 1, 0, 0, 1, 1,
1.672333, 0.4508696, 1.953828, 1, 0, 0, 1, 1,
1.673551, -0.3771037, 1.8221, 0, 0, 0, 1, 1,
1.674337, -0.2598337, 2.81305, 0, 0, 0, 1, 1,
1.701329, -0.2030657, 2.615932, 0, 0, 0, 1, 1,
1.722943, -2.797148, 2.471184, 0, 0, 0, 1, 1,
1.731389, 0.6745129, 0.6272416, 0, 0, 0, 1, 1,
1.741128, 0.7127956, 1.195188, 0, 0, 0, 1, 1,
1.742365, 1.170488, -1.48066, 0, 0, 0, 1, 1,
1.745636, -1.771238, 3.213504, 1, 1, 1, 1, 1,
1.752837, -0.3496908, 1.491232, 1, 1, 1, 1, 1,
1.764659, 0.1135454, 0.7933863, 1, 1, 1, 1, 1,
1.774286, 0.3415937, 1.04739, 1, 1, 1, 1, 1,
1.774874, -0.7185706, 2.16815, 1, 1, 1, 1, 1,
1.809151, 0.5397658, 1.306013, 1, 1, 1, 1, 1,
1.831683, 0.5903108, 0.9422693, 1, 1, 1, 1, 1,
1.85676, -0.3520656, 0.7538805, 1, 1, 1, 1, 1,
1.858161, 1.591215, 3.224133, 1, 1, 1, 1, 1,
1.871296, 0.9275036, -0.1131353, 1, 1, 1, 1, 1,
1.882827, -0.08470959, 1.617856, 1, 1, 1, 1, 1,
1.910066, -0.1098776, 0.9483383, 1, 1, 1, 1, 1,
1.943884, 1.233667, 0.5698749, 1, 1, 1, 1, 1,
1.985828, -0.6778729, 3.935318, 1, 1, 1, 1, 1,
1.990398, 0.174599, 1.802521, 1, 1, 1, 1, 1,
1.994578, -1.596796, 5.237543, 0, 0, 1, 1, 1,
1.999497, 1.391428, 0.85984, 1, 0, 0, 1, 1,
2.063743, 1.038078, 1.557055, 1, 0, 0, 1, 1,
2.072066, 0.02257909, 1.88796, 1, 0, 0, 1, 1,
2.076621, -1.713727, 0.8981276, 1, 0, 0, 1, 1,
2.102827, 1.157075, 0.5056074, 1, 0, 0, 1, 1,
2.103444, 2.44803, -1.159105, 0, 0, 0, 1, 1,
2.107329, -0.1208196, 1.162607, 0, 0, 0, 1, 1,
2.127618, 2.366931, 3.729196, 0, 0, 0, 1, 1,
2.235574, 0.234101, 2.430977, 0, 0, 0, 1, 1,
2.273502, 1.810596, 2.068218, 0, 0, 0, 1, 1,
2.339221, 0.8240228, 1.750403, 0, 0, 0, 1, 1,
2.355116, -2.209062, 2.283096, 0, 0, 0, 1, 1,
2.449837, -1.545375, 2.490652, 1, 1, 1, 1, 1,
2.531103, -0.695095, 2.042529, 1, 1, 1, 1, 1,
2.767239, 0.1237497, 0.752109, 1, 1, 1, 1, 1,
2.809453, 0.1586859, 0.6739411, 1, 1, 1, 1, 1,
2.968285, 0.4132259, 0.3825586, 1, 1, 1, 1, 1,
3.31577, 1.163898, -0.592069, 1, 1, 1, 1, 1,
4.142094, -0.7861543, 2.269183, 1, 1, 1, 1, 1
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
var radius = 9.974789;
var distance = 35.03602;
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
mvMatrix.translate( -0.3453619, 0.148335, 0.1359413 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.03602);
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
