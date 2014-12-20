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
-2.879014, -0.8548911, -0.6015751, 1, 0, 0, 1,
-2.760273, -0.7428113, -1.964012, 1, 0.007843138, 0, 1,
-2.6861, -0.7267879, -3.977453, 1, 0.01176471, 0, 1,
-2.481713, 0.4462441, -1.375939, 1, 0.01960784, 0, 1,
-2.396952, -0.319671, -3.381424, 1, 0.02352941, 0, 1,
-2.241038, -0.02088338, 0.4078883, 1, 0.03137255, 0, 1,
-2.186063, -0.1472637, -1.889154, 1, 0.03529412, 0, 1,
-2.184192, -0.282758, -1.616819, 1, 0.04313726, 0, 1,
-2.142715, -1.16188, -1.907865, 1, 0.04705882, 0, 1,
-2.122338, -1.644471, -1.776946, 1, 0.05490196, 0, 1,
-2.117227, 0.6866353, -2.809802, 1, 0.05882353, 0, 1,
-2.116024, 0.8768911, -2.739079, 1, 0.06666667, 0, 1,
-2.115023, -1.965201, -1.452243, 1, 0.07058824, 0, 1,
-2.101892, 0.211724, -2.845908, 1, 0.07843138, 0, 1,
-2.089478, 1.433561, 0.1747583, 1, 0.08235294, 0, 1,
-2.073291, 0.109238, -0.3770743, 1, 0.09019608, 0, 1,
-2.055811, 0.07677845, -1.887043, 1, 0.09411765, 0, 1,
-1.986263, 0.03071064, -1.370009, 1, 0.1019608, 0, 1,
-1.98411, 0.4335954, 0.1108171, 1, 0.1098039, 0, 1,
-1.950727, 0.7649719, 0.5274025, 1, 0.1137255, 0, 1,
-1.943372, -0.7881197, -1.446081, 1, 0.1215686, 0, 1,
-1.911749, -1.465847, -3.28427, 1, 0.1254902, 0, 1,
-1.909734, -0.09616882, -1.902219, 1, 0.1333333, 0, 1,
-1.876433, -0.6025141, -3.441198, 1, 0.1372549, 0, 1,
-1.874537, -1.010196, -0.636942, 1, 0.145098, 0, 1,
-1.872256, 0.2386421, -1.212373, 1, 0.1490196, 0, 1,
-1.867182, 0.5962015, 0.1692761, 1, 0.1568628, 0, 1,
-1.866715, -0.2980438, -1.18096, 1, 0.1607843, 0, 1,
-1.86473, -0.2359311, -3.060682, 1, 0.1686275, 0, 1,
-1.862646, -0.9207647, -0.6140031, 1, 0.172549, 0, 1,
-1.83687, 0.5620111, -1.995268, 1, 0.1803922, 0, 1,
-1.826116, 0.9538106, -2.161479, 1, 0.1843137, 0, 1,
-1.814128, 0.4976959, -0.8658926, 1, 0.1921569, 0, 1,
-1.801161, -1.557245, -2.626797, 1, 0.1960784, 0, 1,
-1.794706, 0.1685101, -0.268174, 1, 0.2039216, 0, 1,
-1.792116, 1.425075, -0.05266293, 1, 0.2117647, 0, 1,
-1.789275, 0.5365079, -1.443856, 1, 0.2156863, 0, 1,
-1.788015, 1.013724, 0.1467276, 1, 0.2235294, 0, 1,
-1.77051, -0.6377026, -3.388205, 1, 0.227451, 0, 1,
-1.765648, 0.9116561, -1.939151, 1, 0.2352941, 0, 1,
-1.740392, -1.277822, -3.108851, 1, 0.2392157, 0, 1,
-1.738963, -0.469144, -1.016684, 1, 0.2470588, 0, 1,
-1.734141, -0.7182453, -3.122088, 1, 0.2509804, 0, 1,
-1.707144, 1.230535, 0.4288359, 1, 0.2588235, 0, 1,
-1.693031, 0.9835221, -2.053159, 1, 0.2627451, 0, 1,
-1.656239, 0.03415691, -2.587059, 1, 0.2705882, 0, 1,
-1.621791, 1.739604, -1.003269, 1, 0.2745098, 0, 1,
-1.615679, 2.596583, -0.7667761, 1, 0.282353, 0, 1,
-1.606251, 0.5297408, -1.688627, 1, 0.2862745, 0, 1,
-1.595586, 0.146126, -2.740222, 1, 0.2941177, 0, 1,
-1.591071, 1.137311, -1.537532, 1, 0.3019608, 0, 1,
-1.585623, -0.3385721, -4.061213, 1, 0.3058824, 0, 1,
-1.583998, -0.8577896, -3.025084, 1, 0.3137255, 0, 1,
-1.582446, 0.395644, -1.924034, 1, 0.3176471, 0, 1,
-1.578095, 0.8117753, -1.792759, 1, 0.3254902, 0, 1,
-1.577102, -0.07573502, -0.4871966, 1, 0.3294118, 0, 1,
-1.574675, 0.4491658, -1.099735, 1, 0.3372549, 0, 1,
-1.573138, -0.228404, 0.2376407, 1, 0.3411765, 0, 1,
-1.561483, 0.6256976, -1.345615, 1, 0.3490196, 0, 1,
-1.554803, -1.797782, -1.998013, 1, 0.3529412, 0, 1,
-1.554587, 0.3464963, -1.291826, 1, 0.3607843, 0, 1,
-1.53836, -1.071792, -0.7257919, 1, 0.3647059, 0, 1,
-1.535693, 1.443029, 0.5330289, 1, 0.372549, 0, 1,
-1.533061, -1.165316, -1.635715, 1, 0.3764706, 0, 1,
-1.531212, -1.206717, -2.445348, 1, 0.3843137, 0, 1,
-1.524159, 0.1605032, -1.062713, 1, 0.3882353, 0, 1,
-1.512708, -1.059703, -1.51722, 1, 0.3960784, 0, 1,
-1.511739, -0.3157782, -1.75098, 1, 0.4039216, 0, 1,
-1.486381, 0.1933922, -1.014424, 1, 0.4078431, 0, 1,
-1.479794, 0.009861707, -1.726065, 1, 0.4156863, 0, 1,
-1.479167, -0.3546976, -2.797989, 1, 0.4196078, 0, 1,
-1.462065, -0.5834376, -0.805726, 1, 0.427451, 0, 1,
-1.457588, -0.2936998, -0.4387511, 1, 0.4313726, 0, 1,
-1.456034, -0.1327716, 0.03875235, 1, 0.4392157, 0, 1,
-1.454662, 1.152358, -1.996008, 1, 0.4431373, 0, 1,
-1.454497, 0.05530144, -1.80791, 1, 0.4509804, 0, 1,
-1.450989, 0.4196973, -2.237539, 1, 0.454902, 0, 1,
-1.436973, 0.2892198, -1.360914, 1, 0.4627451, 0, 1,
-1.436062, 1.494659, -3.061288, 1, 0.4666667, 0, 1,
-1.428031, -0.8686904, -1.362921, 1, 0.4745098, 0, 1,
-1.425366, 0.1711656, -1.742172, 1, 0.4784314, 0, 1,
-1.409145, 1.964856, 0.2468057, 1, 0.4862745, 0, 1,
-1.405331, 1.520669, -0.5533435, 1, 0.4901961, 0, 1,
-1.392736, 1.985775, 0.3751124, 1, 0.4980392, 0, 1,
-1.384848, -1.21306, -1.879607, 1, 0.5058824, 0, 1,
-1.384689, 0.3089429, -1.648066, 1, 0.509804, 0, 1,
-1.369678, -0.09770294, -2.909241, 1, 0.5176471, 0, 1,
-1.358323, -1.202999, -2.672517, 1, 0.5215687, 0, 1,
-1.346579, -0.1604417, -1.425979, 1, 0.5294118, 0, 1,
-1.339099, -0.3031085, -1.921831, 1, 0.5333334, 0, 1,
-1.329859, -0.0650102, -3.323752, 1, 0.5411765, 0, 1,
-1.326483, 0.7032086, 0.0951988, 1, 0.5450981, 0, 1,
-1.32144, -0.9784818, -2.583679, 1, 0.5529412, 0, 1,
-1.317757, 0.447701, -0.9868331, 1, 0.5568628, 0, 1,
-1.301049, -0.7149816, -3.157753, 1, 0.5647059, 0, 1,
-1.297475, 1.663283, 0.2590214, 1, 0.5686275, 0, 1,
-1.289755, 1.582511, -1.179813, 1, 0.5764706, 0, 1,
-1.28939, 2.935153, -2.032767, 1, 0.5803922, 0, 1,
-1.28589, -0.1106416, -1.678516, 1, 0.5882353, 0, 1,
-1.279831, 1.366645, -2.862003, 1, 0.5921569, 0, 1,
-1.27611, -0.08173531, -1.768866, 1, 0.6, 0, 1,
-1.272626, 1.038502, -2.121353, 1, 0.6078432, 0, 1,
-1.269205, 1.281632, -1.261249, 1, 0.6117647, 0, 1,
-1.240873, -0.809811, -1.699625, 1, 0.6196079, 0, 1,
-1.240053, -3.263635, -2.169166, 1, 0.6235294, 0, 1,
-1.238496, 0.9889064, -1.749976, 1, 0.6313726, 0, 1,
-1.236915, 0.1503033, -1.252666, 1, 0.6352941, 0, 1,
-1.230824, 0.6754984, -0.7181998, 1, 0.6431373, 0, 1,
-1.230337, 0.04117237, -1.086624, 1, 0.6470588, 0, 1,
-1.224928, -0.1840546, -3.233549, 1, 0.654902, 0, 1,
-1.215858, -0.03164745, -2.045065, 1, 0.6588235, 0, 1,
-1.208154, -0.2967723, -0.9367154, 1, 0.6666667, 0, 1,
-1.206983, -0.4061249, -1.699192, 1, 0.6705883, 0, 1,
-1.195878, -0.6916404, -3.199899, 1, 0.6784314, 0, 1,
-1.186191, -0.5356964, -0.819707, 1, 0.682353, 0, 1,
-1.18091, 0.05252706, -1.704625, 1, 0.6901961, 0, 1,
-1.179318, -0.6925011, -1.40268, 1, 0.6941177, 0, 1,
-1.175223, 2.088591, -1.494363, 1, 0.7019608, 0, 1,
-1.161546, -0.6267652, -0.8201565, 1, 0.7098039, 0, 1,
-1.160761, 1.270934, -0.7738164, 1, 0.7137255, 0, 1,
-1.158364, -0.3134147, -2.221673, 1, 0.7215686, 0, 1,
-1.157538, 1.047852, -0.2431782, 1, 0.7254902, 0, 1,
-1.150822, -0.103704, -0.9616848, 1, 0.7333333, 0, 1,
-1.133261, 1.477646, -1.912949, 1, 0.7372549, 0, 1,
-1.132459, -0.3032594, -1.79522, 1, 0.7450981, 0, 1,
-1.131984, 0.5822216, -0.0959745, 1, 0.7490196, 0, 1,
-1.123946, 0.6058513, -0.950676, 1, 0.7568628, 0, 1,
-1.118024, -1.272464, -2.914006, 1, 0.7607843, 0, 1,
-1.11454, -0.364101, -2.961747, 1, 0.7686275, 0, 1,
-1.112293, 0.4110149, -0.9037873, 1, 0.772549, 0, 1,
-1.11046, 0.6969292, -2.40251, 1, 0.7803922, 0, 1,
-1.109167, 0.4398265, 0.326993, 1, 0.7843137, 0, 1,
-1.106627, 1.043002, -1.14196, 1, 0.7921569, 0, 1,
-1.106183, -0.9600095, -2.07444, 1, 0.7960784, 0, 1,
-1.100857, 0.9890531, -2.382023, 1, 0.8039216, 0, 1,
-1.091243, 1.254165, -0.6634737, 1, 0.8117647, 0, 1,
-1.085402, 0.5450278, -2.438885, 1, 0.8156863, 0, 1,
-1.07637, 1.614445, -0.1415311, 1, 0.8235294, 0, 1,
-1.072771, 0.3184279, -1.324483, 1, 0.827451, 0, 1,
-1.071522, -0.2231916, -1.351077, 1, 0.8352941, 0, 1,
-1.062438, -0.7445977, -1.617883, 1, 0.8392157, 0, 1,
-1.061897, 1.335346, 1.34213, 1, 0.8470588, 0, 1,
-1.052072, 1.382273, -2.136867, 1, 0.8509804, 0, 1,
-1.049541, 0.683732, -1.546726, 1, 0.8588235, 0, 1,
-1.04787, 1.007354, 0.2950587, 1, 0.8627451, 0, 1,
-1.045208, 0.8427935, -1.229226, 1, 0.8705882, 0, 1,
-1.042821, 0.4794195, 0.2847531, 1, 0.8745098, 0, 1,
-1.040544, -1.658914, -3.62477, 1, 0.8823529, 0, 1,
-1.038407, 1.925503, 0.1988196, 1, 0.8862745, 0, 1,
-1.036366, -2.107986, -3.485359, 1, 0.8941177, 0, 1,
-1.027103, -1.259676, -3.970509, 1, 0.8980392, 0, 1,
-1.024241, 0.3877331, -2.183334, 1, 0.9058824, 0, 1,
-1.023787, -1.18084, -3.38359, 1, 0.9137255, 0, 1,
-1.02058, 0.4481238, -2.037516, 1, 0.9176471, 0, 1,
-1.013903, -0.7491816, -2.307813, 1, 0.9254902, 0, 1,
-1.012697, 0.5939396, -0.8436131, 1, 0.9294118, 0, 1,
-1.010234, 0.9006625, 0.203635, 1, 0.9372549, 0, 1,
-1.009762, -0.4783295, -0.8557393, 1, 0.9411765, 0, 1,
-1.003909, -0.3842883, -0.6072621, 1, 0.9490196, 0, 1,
-1.000653, 0.1925385, -0.7014208, 1, 0.9529412, 0, 1,
-0.9980329, 1.480834, 0.3597471, 1, 0.9607843, 0, 1,
-0.9974515, 0.4594982, -1.887169, 1, 0.9647059, 0, 1,
-0.9759145, -1.651048, -2.226594, 1, 0.972549, 0, 1,
-0.9755844, 0.7537867, -0.5636418, 1, 0.9764706, 0, 1,
-0.9699013, -0.3789838, -0.3044303, 1, 0.9843137, 0, 1,
-0.9617692, 1.11149, -0.1101712, 1, 0.9882353, 0, 1,
-0.9595237, 0.2773712, -1.162721, 1, 0.9960784, 0, 1,
-0.9566742, 1.407887, -0.4921974, 0.9960784, 1, 0, 1,
-0.9537292, -0.2323072, -3.614173, 0.9921569, 1, 0, 1,
-0.9494581, -0.8061731, -0.9773798, 0.9843137, 1, 0, 1,
-0.9494457, 0.1478561, -0.8922884, 0.9803922, 1, 0, 1,
-0.9415504, -0.6590835, -3.191114, 0.972549, 1, 0, 1,
-0.9366233, 0.399604, -2.880915, 0.9686275, 1, 0, 1,
-0.9234023, 1.004243, -1.60256, 0.9607843, 1, 0, 1,
-0.923149, 0.06105547, -1.968188, 0.9568627, 1, 0, 1,
-0.9227087, 2.784677, -0.5451929, 0.9490196, 1, 0, 1,
-0.9219084, 0.3375796, -1.533134, 0.945098, 1, 0, 1,
-0.9096377, 0.03660859, -1.285825, 0.9372549, 1, 0, 1,
-0.908956, -1.849234, -0.9529003, 0.9333333, 1, 0, 1,
-0.9073271, 0.1155609, 0.009520484, 0.9254902, 1, 0, 1,
-0.9002914, -0.764722, -1.894975, 0.9215686, 1, 0, 1,
-0.8996044, -0.5665915, -2.840761, 0.9137255, 1, 0, 1,
-0.8970638, -0.2412582, -1.788024, 0.9098039, 1, 0, 1,
-0.8948961, -0.7825269, -2.30139, 0.9019608, 1, 0, 1,
-0.8939776, -0.5303238, -0.3080402, 0.8941177, 1, 0, 1,
-0.8887284, 0.3137106, -1.944544, 0.8901961, 1, 0, 1,
-0.881145, -0.8096821, -2.684216, 0.8823529, 1, 0, 1,
-0.8777378, 0.5753363, -1.690636, 0.8784314, 1, 0, 1,
-0.8705884, -0.1523184, -3.656045, 0.8705882, 1, 0, 1,
-0.8608448, 0.5332758, 0.5883665, 0.8666667, 1, 0, 1,
-0.8602791, -0.8133028, -1.403303, 0.8588235, 1, 0, 1,
-0.8593661, -0.2917121, -0.6376827, 0.854902, 1, 0, 1,
-0.8583566, -0.8485122, -3.145951, 0.8470588, 1, 0, 1,
-0.8546493, 1.776634, -0.5552436, 0.8431373, 1, 0, 1,
-0.8517862, -0.5208927, -0.9113725, 0.8352941, 1, 0, 1,
-0.8511106, 1.433539, -1.260917, 0.8313726, 1, 0, 1,
-0.8507679, 0.5034654, -1.169022, 0.8235294, 1, 0, 1,
-0.838579, 0.1029699, -1.095729, 0.8196079, 1, 0, 1,
-0.8383219, 0.1071577, -1.400514, 0.8117647, 1, 0, 1,
-0.8364846, -0.8293946, -0.5591767, 0.8078431, 1, 0, 1,
-0.8345115, 0.9917671, 0.2219061, 0.8, 1, 0, 1,
-0.8335953, 0.2478754, 0.03607511, 0.7921569, 1, 0, 1,
-0.8272038, 0.06746687, -2.649215, 0.7882353, 1, 0, 1,
-0.8247365, 0.115892, -0.4341189, 0.7803922, 1, 0, 1,
-0.8210869, -1.78075, -3.182459, 0.7764706, 1, 0, 1,
-0.8180273, 0.5967553, -0.843967, 0.7686275, 1, 0, 1,
-0.8172213, -0.6075125, -3.444582, 0.7647059, 1, 0, 1,
-0.8159509, -0.8870658, -1.150304, 0.7568628, 1, 0, 1,
-0.8116596, -0.08142948, -0.2799376, 0.7529412, 1, 0, 1,
-0.8112977, 1.128257, 0.7457123, 0.7450981, 1, 0, 1,
-0.8109672, -1.39967, -3.063378, 0.7411765, 1, 0, 1,
-0.805501, -0.673472, -1.855667, 0.7333333, 1, 0, 1,
-0.7965829, 1.583767, -1.517967, 0.7294118, 1, 0, 1,
-0.7956405, 0.8913267, 1.416807, 0.7215686, 1, 0, 1,
-0.7896852, 1.204062, -0.07822271, 0.7176471, 1, 0, 1,
-0.789398, -1.38295, -1.076577, 0.7098039, 1, 0, 1,
-0.7892797, 0.09928667, -2.22264, 0.7058824, 1, 0, 1,
-0.7866442, -0.4172282, -1.898696, 0.6980392, 1, 0, 1,
-0.783893, 0.683847, -1.072871, 0.6901961, 1, 0, 1,
-0.7837791, 1.645589, -0.8446978, 0.6862745, 1, 0, 1,
-0.780951, 0.8868943, -1.316394, 0.6784314, 1, 0, 1,
-0.779354, 1.339751, -0.1447118, 0.6745098, 1, 0, 1,
-0.7748659, 1.15076, -0.9847839, 0.6666667, 1, 0, 1,
-0.7640726, -0.9658809, -2.023378, 0.6627451, 1, 0, 1,
-0.7627988, 0.8736398, -2.185479, 0.654902, 1, 0, 1,
-0.7589903, -0.5942745, -3.758805, 0.6509804, 1, 0, 1,
-0.7531496, 0.896453, 0.2406486, 0.6431373, 1, 0, 1,
-0.750689, 0.3198523, -1.532223, 0.6392157, 1, 0, 1,
-0.7477745, 0.1157589, -0.3074957, 0.6313726, 1, 0, 1,
-0.7450598, -0.467195, -2.277634, 0.627451, 1, 0, 1,
-0.7396291, 1.174414, -0.6458003, 0.6196079, 1, 0, 1,
-0.7376425, -0.2507671, -0.331462, 0.6156863, 1, 0, 1,
-0.7365127, -0.7881856, -1.858901, 0.6078432, 1, 0, 1,
-0.7299386, 0.128492, -0.1672613, 0.6039216, 1, 0, 1,
-0.7293728, 0.1496849, -1.109984, 0.5960785, 1, 0, 1,
-0.7280474, 0.04861161, -2.13959, 0.5882353, 1, 0, 1,
-0.7161431, 0.3915286, -1.841671, 0.5843138, 1, 0, 1,
-0.7156598, 1.074628, -1.051979, 0.5764706, 1, 0, 1,
-0.7143935, 1.146352, -0.2891954, 0.572549, 1, 0, 1,
-0.7053807, -1.150215, -1.310962, 0.5647059, 1, 0, 1,
-0.7020004, 0.2762475, -1.493545, 0.5607843, 1, 0, 1,
-0.6998565, -1.276508, -2.177165, 0.5529412, 1, 0, 1,
-0.6988007, -1.77212, -2.136002, 0.5490196, 1, 0, 1,
-0.6957963, -1.777574, -3.291184, 0.5411765, 1, 0, 1,
-0.6905259, -0.4551816, 0.4791128, 0.5372549, 1, 0, 1,
-0.689863, 2.519145, -1.511751, 0.5294118, 1, 0, 1,
-0.6892309, -0.634181, -2.939233, 0.5254902, 1, 0, 1,
-0.6885589, -0.4944994, -2.475351, 0.5176471, 1, 0, 1,
-0.6878695, -0.2961593, -3.45136, 0.5137255, 1, 0, 1,
-0.6843972, 0.132781, 0.4976058, 0.5058824, 1, 0, 1,
-0.6787207, -2.366037, -0.677669, 0.5019608, 1, 0, 1,
-0.6784444, -1.016466, -3.053194, 0.4941176, 1, 0, 1,
-0.6771551, 0.05045954, -1.219656, 0.4862745, 1, 0, 1,
-0.6766632, -1.480007, -2.320564, 0.4823529, 1, 0, 1,
-0.6759301, -0.5150818, -1.951475, 0.4745098, 1, 0, 1,
-0.6743111, -0.8596218, -0.8521851, 0.4705882, 1, 0, 1,
-0.6700334, 1.547813, 0.01087882, 0.4627451, 1, 0, 1,
-0.6666853, -0.9512359, -1.986425, 0.4588235, 1, 0, 1,
-0.6662372, -0.5165786, -3.894189, 0.4509804, 1, 0, 1,
-0.6653322, 1.080382, 0.1415138, 0.4470588, 1, 0, 1,
-0.6622056, 0.682517, 0.5518238, 0.4392157, 1, 0, 1,
-0.6591618, 0.09430702, -1.226025, 0.4352941, 1, 0, 1,
-0.658839, -0.6792987, -4.088225, 0.427451, 1, 0, 1,
-0.6565471, -0.5025687, -1.706065, 0.4235294, 1, 0, 1,
-0.6559204, 0.6430354, 0.3101422, 0.4156863, 1, 0, 1,
-0.6478732, -0.2161038, -0.4621423, 0.4117647, 1, 0, 1,
-0.6476352, 0.630714, -0.8841587, 0.4039216, 1, 0, 1,
-0.6466413, -0.3644413, -2.291182, 0.3960784, 1, 0, 1,
-0.6428193, 1.345994, -0.3715613, 0.3921569, 1, 0, 1,
-0.6368538, 2.279519, 0.5516847, 0.3843137, 1, 0, 1,
-0.6250147, 0.4067189, -1.609498, 0.3803922, 1, 0, 1,
-0.6179936, -0.2425762, -2.626788, 0.372549, 1, 0, 1,
-0.6155793, 0.04102973, -1.537169, 0.3686275, 1, 0, 1,
-0.6131781, 0.05139719, -2.34339, 0.3607843, 1, 0, 1,
-0.6126606, -1.445712, -3.655645, 0.3568628, 1, 0, 1,
-0.6110178, 2.209519, -0.07297606, 0.3490196, 1, 0, 1,
-0.6081101, 0.8432127, 0.1543283, 0.345098, 1, 0, 1,
-0.6053582, 1.181807, 0.2746588, 0.3372549, 1, 0, 1,
-0.6041397, 1.386274, -0.6076207, 0.3333333, 1, 0, 1,
-0.5922359, 1.21867, -1.529665, 0.3254902, 1, 0, 1,
-0.590136, -0.7893079, -2.042927, 0.3215686, 1, 0, 1,
-0.5849258, 1.375484, -0.9966183, 0.3137255, 1, 0, 1,
-0.5818966, -0.0822161, -2.697646, 0.3098039, 1, 0, 1,
-0.5746955, 2.324649, 1.613905, 0.3019608, 1, 0, 1,
-0.5719278, -0.4410273, -4.730167, 0.2941177, 1, 0, 1,
-0.568532, -1.744576, -2.699387, 0.2901961, 1, 0, 1,
-0.5657955, -0.3999836, -2.109006, 0.282353, 1, 0, 1,
-0.5614501, -0.8779179, -0.377386, 0.2784314, 1, 0, 1,
-0.5602475, -1.253153, -2.39975, 0.2705882, 1, 0, 1,
-0.5587656, -1.286736, -3.088178, 0.2666667, 1, 0, 1,
-0.556547, 1.65112, 0.4404365, 0.2588235, 1, 0, 1,
-0.5541884, -0.4100436, -5.036289, 0.254902, 1, 0, 1,
-0.5541818, 0.2022486, -2.95443, 0.2470588, 1, 0, 1,
-0.5540275, -0.3817252, -3.006271, 0.2431373, 1, 0, 1,
-0.5534355, 0.03071588, -0.6485469, 0.2352941, 1, 0, 1,
-0.54467, 1.059175, 0.7002265, 0.2313726, 1, 0, 1,
-0.5413598, -1.309025, -3.055405, 0.2235294, 1, 0, 1,
-0.540472, -2.083752, -3.996914, 0.2196078, 1, 0, 1,
-0.5356309, -1.235838, -0.8816649, 0.2117647, 1, 0, 1,
-0.5335814, -0.679915, -3.840395, 0.2078431, 1, 0, 1,
-0.5320729, 0.5776904, 1.123077, 0.2, 1, 0, 1,
-0.5320367, -0.5314708, -2.648342, 0.1921569, 1, 0, 1,
-0.530815, -0.1635488, -0.4744978, 0.1882353, 1, 0, 1,
-0.530482, 0.05851364, -2.339082, 0.1803922, 1, 0, 1,
-0.5296654, 0.4430399, 0.08285246, 0.1764706, 1, 0, 1,
-0.5273818, 0.1684086, -0.6277308, 0.1686275, 1, 0, 1,
-0.5270593, 0.4978825, -1.91438, 0.1647059, 1, 0, 1,
-0.5221376, -1.140625, -3.263307, 0.1568628, 1, 0, 1,
-0.518845, 2.579185, 0.7271238, 0.1529412, 1, 0, 1,
-0.5163791, 0.6795948, -1.03459, 0.145098, 1, 0, 1,
-0.5157018, -0.725535, -4.00568, 0.1411765, 1, 0, 1,
-0.5139568, 0.1054777, -0.8816261, 0.1333333, 1, 0, 1,
-0.5128405, -1.629059, -3.873459, 0.1294118, 1, 0, 1,
-0.5125585, -1.917514, -1.690945, 0.1215686, 1, 0, 1,
-0.5123811, -1.03175, -3.82983, 0.1176471, 1, 0, 1,
-0.5075315, -1.240419, -3.276856, 0.1098039, 1, 0, 1,
-0.5040861, -2.231116, -1.816946, 0.1058824, 1, 0, 1,
-0.5036324, 2.26588, 0.7116767, 0.09803922, 1, 0, 1,
-0.5020908, -0.2247395, -2.255351, 0.09019608, 1, 0, 1,
-0.5016041, 1.729085, -1.450107, 0.08627451, 1, 0, 1,
-0.4994316, 1.121369, -0.5080702, 0.07843138, 1, 0, 1,
-0.49462, 1.183912, -1.370484, 0.07450981, 1, 0, 1,
-0.4891193, -1.343223, -3.582825, 0.06666667, 1, 0, 1,
-0.4839665, -0.146802, -2.242656, 0.0627451, 1, 0, 1,
-0.4814814, 0.1931968, -1.865798, 0.05490196, 1, 0, 1,
-0.4795868, -1.542101, -4.956437, 0.05098039, 1, 0, 1,
-0.477742, -0.9238617, -1.991009, 0.04313726, 1, 0, 1,
-0.4766347, -0.7033742, -3.785277, 0.03921569, 1, 0, 1,
-0.475379, -0.009647626, -2.224449, 0.03137255, 1, 0, 1,
-0.4712659, 0.109191, 0.2569214, 0.02745098, 1, 0, 1,
-0.4692129, -0.8051357, -2.719254, 0.01960784, 1, 0, 1,
-0.4650079, -0.08857404, -2.199271, 0.01568628, 1, 0, 1,
-0.4556228, -0.3116284, -4.137242, 0.007843138, 1, 0, 1,
-0.4523734, 1.468623, 0.02281997, 0.003921569, 1, 0, 1,
-0.4515557, -1.394062, -1.118701, 0, 1, 0.003921569, 1,
-0.4490219, 1.969751, 0.6779248, 0, 1, 0.01176471, 1,
-0.4465343, -1.62301, -3.101007, 0, 1, 0.01568628, 1,
-0.4434378, -0.4131904, -2.039989, 0, 1, 0.02352941, 1,
-0.4393952, -0.1939252, -2.715208, 0, 1, 0.02745098, 1,
-0.4338037, -0.5189442, -4.543208, 0, 1, 0.03529412, 1,
-0.4327357, 0.1590845, -1.371024, 0, 1, 0.03921569, 1,
-0.4266304, -1.538458, -2.714554, 0, 1, 0.04705882, 1,
-0.4254636, 1.384467, -2.266057, 0, 1, 0.05098039, 1,
-0.4250294, -0.4740913, -2.122177, 0, 1, 0.05882353, 1,
-0.4232007, 0.7060208, -1.758279, 0, 1, 0.0627451, 1,
-0.4207966, 0.2566208, -1.766695, 0, 1, 0.07058824, 1,
-0.4106794, -0.5612737, -3.853013, 0, 1, 0.07450981, 1,
-0.4077154, -1.007016, -1.789953, 0, 1, 0.08235294, 1,
-0.4059188, -0.9508371, -2.944681, 0, 1, 0.08627451, 1,
-0.4059115, -0.1405249, -0.5675582, 0, 1, 0.09411765, 1,
-0.4048907, -2.060231, -1.316772, 0, 1, 0.1019608, 1,
-0.4029153, -0.1349093, -0.9748859, 0, 1, 0.1058824, 1,
-0.3951136, -0.2495693, -2.676422, 0, 1, 0.1137255, 1,
-0.3926881, 0.1803801, -1.629474, 0, 1, 0.1176471, 1,
-0.3885396, -0.6994328, -3.352578, 0, 1, 0.1254902, 1,
-0.3843867, 0.3390353, -1.013795, 0, 1, 0.1294118, 1,
-0.3824436, -0.2056148, -1.083557, 0, 1, 0.1372549, 1,
-0.3802434, 0.750244, -1.897945, 0, 1, 0.1411765, 1,
-0.3799143, -1.714501, -3.562294, 0, 1, 0.1490196, 1,
-0.379764, 2.09475, 0.04377725, 0, 1, 0.1529412, 1,
-0.3742803, 1.084055, -0.3148984, 0, 1, 0.1607843, 1,
-0.3694041, -0.1792555, -1.353789, 0, 1, 0.1647059, 1,
-0.3661448, 0.05294187, 0.02633262, 0, 1, 0.172549, 1,
-0.3640303, 0.2485649, -1.080594, 0, 1, 0.1764706, 1,
-0.3626247, -1.612382, -2.747883, 0, 1, 0.1843137, 1,
-0.3587111, -0.7866262, -3.467752, 0, 1, 0.1882353, 1,
-0.3536263, 2.421062, 0.3886379, 0, 1, 0.1960784, 1,
-0.3535072, -1.149091, -4.144268, 0, 1, 0.2039216, 1,
-0.3533563, 1.886309, -0.6091571, 0, 1, 0.2078431, 1,
-0.3416883, -0.07669255, -1.632354, 0, 1, 0.2156863, 1,
-0.3416632, -0.8470479, -0.992624, 0, 1, 0.2196078, 1,
-0.3394929, 0.01647546, -0.3340844, 0, 1, 0.227451, 1,
-0.337358, 1.013639, -0.7285374, 0, 1, 0.2313726, 1,
-0.3304192, 0.2116297, -1.192831, 0, 1, 0.2392157, 1,
-0.32968, 0.1236944, -1.781844, 0, 1, 0.2431373, 1,
-0.3262795, 1.024023, -0.2465694, 0, 1, 0.2509804, 1,
-0.322604, 0.05159329, -1.621318, 0, 1, 0.254902, 1,
-0.3147042, 0.3595698, -2.312897, 0, 1, 0.2627451, 1,
-0.3115258, 0.586663, -0.8364751, 0, 1, 0.2666667, 1,
-0.3072205, -1.453149, -2.570517, 0, 1, 0.2745098, 1,
-0.3071233, 0.05702793, -1.012805, 0, 1, 0.2784314, 1,
-0.3042184, 0.447379, -1.883265, 0, 1, 0.2862745, 1,
-0.2989279, 0.03555891, -1.088422, 0, 1, 0.2901961, 1,
-0.2985854, 2.725534, -0.2067772, 0, 1, 0.2980392, 1,
-0.2958497, -0.5414116, -1.731432, 0, 1, 0.3058824, 1,
-0.2948315, -0.007498633, -2.078979, 0, 1, 0.3098039, 1,
-0.2926269, 1.215846, -0.6164287, 0, 1, 0.3176471, 1,
-0.289672, -0.1256032, -1.78882, 0, 1, 0.3215686, 1,
-0.2889319, 0.196597, -1.461406, 0, 1, 0.3294118, 1,
-0.2867565, 0.4951887, -1.724482, 0, 1, 0.3333333, 1,
-0.2775491, -1.342981, -3.372705, 0, 1, 0.3411765, 1,
-0.2774934, 0.1911881, -2.160915, 0, 1, 0.345098, 1,
-0.2748147, 1.147219, 0.5868897, 0, 1, 0.3529412, 1,
-0.2726176, -1.361327, -4.466636, 0, 1, 0.3568628, 1,
-0.2711813, -0.08652356, -2.242314, 0, 1, 0.3647059, 1,
-0.268589, -0.2665208, -4.393427, 0, 1, 0.3686275, 1,
-0.2682844, -1.403173, -2.861127, 0, 1, 0.3764706, 1,
-0.2681572, 1.259445, 0.6416259, 0, 1, 0.3803922, 1,
-0.2675575, -0.1106069, -1.549354, 0, 1, 0.3882353, 1,
-0.2662703, 1.582958, 1.957857, 0, 1, 0.3921569, 1,
-0.2623366, 0.08901645, -1.985179, 0, 1, 0.4, 1,
-0.2574312, -1.054731, -2.437496, 0, 1, 0.4078431, 1,
-0.2560872, -0.3044288, -1.783123, 0, 1, 0.4117647, 1,
-0.2494669, -0.1772492, -2.558347, 0, 1, 0.4196078, 1,
-0.245842, 1.59061, -0.3860007, 0, 1, 0.4235294, 1,
-0.2456832, -0.7096542, -4.499322, 0, 1, 0.4313726, 1,
-0.2449469, -0.7196653, -1.396137, 0, 1, 0.4352941, 1,
-0.2395109, 0.3425193, -0.8803436, 0, 1, 0.4431373, 1,
-0.2393424, 0.5459476, -0.05255568, 0, 1, 0.4470588, 1,
-0.238617, 2.0937, -0.7069293, 0, 1, 0.454902, 1,
-0.2266433, -0.306527, -1.898402, 0, 1, 0.4588235, 1,
-0.2237124, 0.5939469, -0.8489043, 0, 1, 0.4666667, 1,
-0.223274, -0.3165965, -1.8681, 0, 1, 0.4705882, 1,
-0.2228518, -0.2522097, -3.281086, 0, 1, 0.4784314, 1,
-0.2149898, 2.151686, 0.2176388, 0, 1, 0.4823529, 1,
-0.2124864, -1.384367, -2.215147, 0, 1, 0.4901961, 1,
-0.2096178, -0.1543329, 0.4088149, 0, 1, 0.4941176, 1,
-0.1994153, -1.773683, -3.278743, 0, 1, 0.5019608, 1,
-0.1932453, 0.4066976, -2.054001, 0, 1, 0.509804, 1,
-0.1930366, -0.325826, -3.806973, 0, 1, 0.5137255, 1,
-0.1907455, 1.426321, -0.2819559, 0, 1, 0.5215687, 1,
-0.1869951, -0.4867331, -2.728295, 0, 1, 0.5254902, 1,
-0.1818412, -0.5134885, -4.813074, 0, 1, 0.5333334, 1,
-0.1784288, -0.5669844, -3.904104, 0, 1, 0.5372549, 1,
-0.1752516, -0.3597284, -1.118045, 0, 1, 0.5450981, 1,
-0.17288, -0.4816917, -2.3747, 0, 1, 0.5490196, 1,
-0.1728468, 0.7151583, -2.65453, 0, 1, 0.5568628, 1,
-0.1698034, -1.511948, -1.910661, 0, 1, 0.5607843, 1,
-0.1677805, -0.7875794, -4.943414, 0, 1, 0.5686275, 1,
-0.1625721, -0.3649704, -3.78772, 0, 1, 0.572549, 1,
-0.1601875, -3.011608, -2.063656, 0, 1, 0.5803922, 1,
-0.1599589, -2.064818, -3.509288, 0, 1, 0.5843138, 1,
-0.1597593, -0.8025244, -4.174918, 0, 1, 0.5921569, 1,
-0.1564295, 0.2681845, -0.8216347, 0, 1, 0.5960785, 1,
-0.1550012, -0.06742042, -1.57492, 0, 1, 0.6039216, 1,
-0.1514965, 1.098866, 0.3587031, 0, 1, 0.6117647, 1,
-0.1506166, 1.954978, -0.5921357, 0, 1, 0.6156863, 1,
-0.1438186, -0.2272089, -2.611091, 0, 1, 0.6235294, 1,
-0.1427483, -1.547529, -2.336542, 0, 1, 0.627451, 1,
-0.1357756, 1.207285, 0.2840646, 0, 1, 0.6352941, 1,
-0.1268851, -0.3764288, -2.768273, 0, 1, 0.6392157, 1,
-0.1212209, -1.17159, -2.141, 0, 1, 0.6470588, 1,
-0.118265, -0.9564641, -3.107812, 0, 1, 0.6509804, 1,
-0.1180302, -1.503739, -2.820702, 0, 1, 0.6588235, 1,
-0.1120766, -0.8874642, -1.638841, 0, 1, 0.6627451, 1,
-0.1073314, 0.1995511, -0.822502, 0, 1, 0.6705883, 1,
-0.1057035, 1.399524, -0.9085149, 0, 1, 0.6745098, 1,
-0.09991215, -1.648254, -3.115998, 0, 1, 0.682353, 1,
-0.09889487, 1.38309, -1.829412, 0, 1, 0.6862745, 1,
-0.09738561, 0.2088837, -0.7899978, 0, 1, 0.6941177, 1,
-0.09723098, -0.1421575, -1.558329, 0, 1, 0.7019608, 1,
-0.09690163, 0.5952984, 0.3391859, 0, 1, 0.7058824, 1,
-0.09299327, 0.791293, 0.4232335, 0, 1, 0.7137255, 1,
-0.09211824, -0.5060569, -3.425327, 0, 1, 0.7176471, 1,
-0.08894593, 0.007847648, -1.846474, 0, 1, 0.7254902, 1,
-0.07624935, -0.8674542, -4.447953, 0, 1, 0.7294118, 1,
-0.07497015, -0.6930436, -3.924394, 0, 1, 0.7372549, 1,
-0.07260252, 0.7128666, 1.576535, 0, 1, 0.7411765, 1,
-0.07181984, -0.6966458, -2.418093, 0, 1, 0.7490196, 1,
-0.06981952, -0.8349546, -3.091672, 0, 1, 0.7529412, 1,
-0.06835304, 3.010859, -0.5419966, 0, 1, 0.7607843, 1,
-0.06742225, -1.614255, -3.502494, 0, 1, 0.7647059, 1,
-0.06611897, 0.3892146, -1.582464, 0, 1, 0.772549, 1,
-0.06599991, 0.03528623, -1.938265, 0, 1, 0.7764706, 1,
-0.06362516, -1.929271, -4.056662, 0, 1, 0.7843137, 1,
-0.05948943, -1.758494, -2.703544, 0, 1, 0.7882353, 1,
-0.05897209, -1.569629, -2.334907, 0, 1, 0.7960784, 1,
-0.05391701, 1.487091, 1.202368, 0, 1, 0.8039216, 1,
-0.05288365, -1.266678, -4.706043, 0, 1, 0.8078431, 1,
-0.05245893, -0.4435482, -1.842883, 0, 1, 0.8156863, 1,
-0.04300636, 0.2158261, -0.08697533, 0, 1, 0.8196079, 1,
-0.04063138, -0.2387323, -4.296194, 0, 1, 0.827451, 1,
-0.0398059, -1.073059, -3.153304, 0, 1, 0.8313726, 1,
-0.03725712, -1.789503, -2.943815, 0, 1, 0.8392157, 1,
-0.03364022, 0.07856998, -0.193554, 0, 1, 0.8431373, 1,
-0.03326251, 0.9912418, -0.05028267, 0, 1, 0.8509804, 1,
-0.03245693, 0.5844522, 2.577784, 0, 1, 0.854902, 1,
-0.03185987, 1.014118, -0.8666595, 0, 1, 0.8627451, 1,
-0.03011351, -0.9697735, -2.999784, 0, 1, 0.8666667, 1,
-0.0275549, 2.440528, 0.09180048, 0, 1, 0.8745098, 1,
-0.02534005, 0.5998211, -0.4274148, 0, 1, 0.8784314, 1,
-0.02360038, 0.7059118, -1.51625, 0, 1, 0.8862745, 1,
-0.02252288, 1.160426, 0.3285247, 0, 1, 0.8901961, 1,
-0.01867712, 0.8085115, 0.2876403, 0, 1, 0.8980392, 1,
-0.01738006, 1.758748, -0.3631092, 0, 1, 0.9058824, 1,
-0.01535112, -1.762711, -2.932148, 0, 1, 0.9098039, 1,
-0.004822751, -1.030938, -3.82526, 0, 1, 0.9176471, 1,
-0.004488337, -1.858343, -2.660727, 0, 1, 0.9215686, 1,
-0.003833249, 0.119122, -1.350283, 0, 1, 0.9294118, 1,
-0.001275869, 1.553776, 0.08683955, 0, 1, 0.9333333, 1,
-0.0004035063, 1.143946, -1.226859, 0, 1, 0.9411765, 1,
0.0001655575, -0.2084999, 3.510311, 0, 1, 0.945098, 1,
0.0008818163, 1.061695, 0.009191241, 0, 1, 0.9529412, 1,
0.009037232, 0.945012, 1.015379, 0, 1, 0.9568627, 1,
0.009718367, -1.206174, 0.7538541, 0, 1, 0.9647059, 1,
0.01077211, 0.1605929, 0.007068519, 0, 1, 0.9686275, 1,
0.01678672, -0.7355506, 2.197719, 0, 1, 0.9764706, 1,
0.01699932, -0.5564025, 2.858711, 0, 1, 0.9803922, 1,
0.02420053, -0.8419321, 1.455959, 0, 1, 0.9882353, 1,
0.02873972, 0.8044878, -0.6678388, 0, 1, 0.9921569, 1,
0.02887053, 0.1479628, -0.4329534, 0, 1, 1, 1,
0.03014111, -1.172027, 2.154545, 0, 0.9921569, 1, 1,
0.03530863, -0.7839008, 3.480939, 0, 0.9882353, 1, 1,
0.03577456, -0.3692679, 3.292774, 0, 0.9803922, 1, 1,
0.04252353, 1.042413, -1.836262, 0, 0.9764706, 1, 1,
0.04330708, -0.05349982, 2.586264, 0, 0.9686275, 1, 1,
0.04544322, -0.7345391, 1.664768, 0, 0.9647059, 1, 1,
0.05047157, -0.8805902, 3.244143, 0, 0.9568627, 1, 1,
0.05236139, 0.254293, 0.1530128, 0, 0.9529412, 1, 1,
0.06122978, -0.08256464, 0.1206471, 0, 0.945098, 1, 1,
0.06444614, 0.09755344, -0.3007778, 0, 0.9411765, 1, 1,
0.06591666, 0.5080593, -0.1835653, 0, 0.9333333, 1, 1,
0.07021575, -1.314499, 4.537354, 0, 0.9294118, 1, 1,
0.07057597, -1.369598, 2.085472, 0, 0.9215686, 1, 1,
0.07916763, 0.07219657, 1.207883, 0, 0.9176471, 1, 1,
0.08435734, -0.4143798, 2.419528, 0, 0.9098039, 1, 1,
0.08436447, -0.5153875, 2.32343, 0, 0.9058824, 1, 1,
0.0869581, -0.5029396, 3.213398, 0, 0.8980392, 1, 1,
0.08740442, 0.5639668, 0.4143881, 0, 0.8901961, 1, 1,
0.09817482, -0.7221773, 3.17089, 0, 0.8862745, 1, 1,
0.09870674, 2.128702, 1.241307, 0, 0.8784314, 1, 1,
0.1020827, 1.365641, -0.175581, 0, 0.8745098, 1, 1,
0.112609, 2.808939, 0.1533541, 0, 0.8666667, 1, 1,
0.1154232, 0.5690672, -0.8084775, 0, 0.8627451, 1, 1,
0.1176547, -1.309751, 3.730203, 0, 0.854902, 1, 1,
0.1201784, 0.8873122, -0.01365995, 0, 0.8509804, 1, 1,
0.1202721, 0.4504329, 0.07576686, 0, 0.8431373, 1, 1,
0.1214407, -0.3325061, 2.183185, 0, 0.8392157, 1, 1,
0.1244076, 0.7077051, -0.7489627, 0, 0.8313726, 1, 1,
0.1285271, 1.725632, -0.9737163, 0, 0.827451, 1, 1,
0.1286391, -0.5964695, 1.629766, 0, 0.8196079, 1, 1,
0.1299366, -1.09435, 3.005254, 0, 0.8156863, 1, 1,
0.1303847, 0.362004, 0.8821642, 0, 0.8078431, 1, 1,
0.1304625, 0.07492714, 0.7484046, 0, 0.8039216, 1, 1,
0.1305122, 1.149755, -0.9342538, 0, 0.7960784, 1, 1,
0.1325473, 0.4127652, 0.7366075, 0, 0.7882353, 1, 1,
0.1333077, -1.658033, 3.001707, 0, 0.7843137, 1, 1,
0.1337724, 0.1217471, -0.8555156, 0, 0.7764706, 1, 1,
0.1340444, -1.347069, 5.370912, 0, 0.772549, 1, 1,
0.1424493, 0.732226, -0.06050973, 0, 0.7647059, 1, 1,
0.142569, 1.093938, -0.2232015, 0, 0.7607843, 1, 1,
0.1449039, 0.9981925, 0.8940887, 0, 0.7529412, 1, 1,
0.1462711, -0.4542452, 3.965908, 0, 0.7490196, 1, 1,
0.1554357, -2.470062, 1.682493, 0, 0.7411765, 1, 1,
0.1571066, -0.6305495, 2.851834, 0, 0.7372549, 1, 1,
0.1581874, 0.3261095, 0.5709148, 0, 0.7294118, 1, 1,
0.1594166, 0.063877, 2.113745, 0, 0.7254902, 1, 1,
0.1594748, 0.05745785, 2.104733, 0, 0.7176471, 1, 1,
0.1595, -0.3636729, 3.239668, 0, 0.7137255, 1, 1,
0.1599913, -0.8740089, 3.739599, 0, 0.7058824, 1, 1,
0.163325, -0.6933602, 2.772473, 0, 0.6980392, 1, 1,
0.1668169, -0.7994777, 2.294099, 0, 0.6941177, 1, 1,
0.1766403, -0.3855961, 2.494395, 0, 0.6862745, 1, 1,
0.178596, 0.634877, 0.6270087, 0, 0.682353, 1, 1,
0.1787237, -0.0787594, 1.266616, 0, 0.6745098, 1, 1,
0.1835794, -0.3823325, 2.042001, 0, 0.6705883, 1, 1,
0.1876717, -2.534212, 3.938998, 0, 0.6627451, 1, 1,
0.190875, 0.0320087, 2.72444, 0, 0.6588235, 1, 1,
0.198801, -2.272056, 2.925683, 0, 0.6509804, 1, 1,
0.1996639, -1.119966, 5.246387, 0, 0.6470588, 1, 1,
0.1999733, -1.988284, 3.796669, 0, 0.6392157, 1, 1,
0.2011564, -0.231775, 3.735389, 0, 0.6352941, 1, 1,
0.2014507, 0.7690807, 0.9884263, 0, 0.627451, 1, 1,
0.2057971, 1.62313, -0.494709, 0, 0.6235294, 1, 1,
0.2067689, 0.5078343, -0.3651394, 0, 0.6156863, 1, 1,
0.2074654, 1.317159, -0.2911182, 0, 0.6117647, 1, 1,
0.2091453, -0.1178226, 2.755885, 0, 0.6039216, 1, 1,
0.2098091, 0.03740392, 1.527823, 0, 0.5960785, 1, 1,
0.2108818, -1.667261, 3.530155, 0, 0.5921569, 1, 1,
0.2135177, 0.3944791, -0.3480963, 0, 0.5843138, 1, 1,
0.2166183, 1.615951, -1.39123, 0, 0.5803922, 1, 1,
0.2215265, -0.700728, 3.817416, 0, 0.572549, 1, 1,
0.2223287, -0.2506894, 1.807561, 0, 0.5686275, 1, 1,
0.2226212, 1.512157, -1.127161, 0, 0.5607843, 1, 1,
0.2265281, 0.7896839, -0.09023841, 0, 0.5568628, 1, 1,
0.2282025, -0.8736382, 2.857518, 0, 0.5490196, 1, 1,
0.2365227, -1.63912, 2.69768, 0, 0.5450981, 1, 1,
0.2392296, -0.01002981, 3.294389, 0, 0.5372549, 1, 1,
0.2424087, -0.1465627, 0.8577582, 0, 0.5333334, 1, 1,
0.2473881, -0.3152689, 2.450082, 0, 0.5254902, 1, 1,
0.2502715, 0.106418, 0.9754195, 0, 0.5215687, 1, 1,
0.2504984, 0.09878175, 1.479234, 0, 0.5137255, 1, 1,
0.251312, 1.208548, 0.09782392, 0, 0.509804, 1, 1,
0.2553396, -0.9336047, 2.63866, 0, 0.5019608, 1, 1,
0.2562256, -0.1654418, 1.450388, 0, 0.4941176, 1, 1,
0.2579979, 0.2082079, 2.237345, 0, 0.4901961, 1, 1,
0.2588639, -0.2151563, 0.9024639, 0, 0.4823529, 1, 1,
0.2597172, 1.34164, 0.9375289, 0, 0.4784314, 1, 1,
0.2657397, -0.04839841, 1.614785, 0, 0.4705882, 1, 1,
0.2676316, 0.05074042, 2.226944, 0, 0.4666667, 1, 1,
0.2707132, -1.74046, 2.741175, 0, 0.4588235, 1, 1,
0.2773245, -1.407586, 3.546816, 0, 0.454902, 1, 1,
0.2776063, -1.135794, 3.099575, 0, 0.4470588, 1, 1,
0.2848045, -0.7995628, 2.498571, 0, 0.4431373, 1, 1,
0.2865514, 1.287253, 0.4023322, 0, 0.4352941, 1, 1,
0.2879347, -1.374919, 2.483797, 0, 0.4313726, 1, 1,
0.2900632, 1.041034, -0.6599616, 0, 0.4235294, 1, 1,
0.2903238, -0.4438144, 2.469411, 0, 0.4196078, 1, 1,
0.2947466, -0.3453194, 3.476157, 0, 0.4117647, 1, 1,
0.3009641, -0.4713345, 0.858727, 0, 0.4078431, 1, 1,
0.3013721, -0.8447552, 4.206818, 0, 0.4, 1, 1,
0.3014002, -0.3713937, 3.109747, 0, 0.3921569, 1, 1,
0.3054612, 0.7269361, -0.6877063, 0, 0.3882353, 1, 1,
0.3085532, -0.002848188, 2.415729, 0, 0.3803922, 1, 1,
0.3093975, 0.6090573, -0.2346849, 0, 0.3764706, 1, 1,
0.3095116, 0.7282448, 1.389247, 0, 0.3686275, 1, 1,
0.3098702, -0.6680924, 2.309781, 0, 0.3647059, 1, 1,
0.3117225, 1.109651, -1.569317, 0, 0.3568628, 1, 1,
0.3189582, -1.362208, 1.146298, 0, 0.3529412, 1, 1,
0.3208699, -1.005887, 2.335967, 0, 0.345098, 1, 1,
0.3266548, 1.010517, 0.9048926, 0, 0.3411765, 1, 1,
0.3305629, 0.01412357, 2.239856, 0, 0.3333333, 1, 1,
0.3341111, -0.8776132, 2.248277, 0, 0.3294118, 1, 1,
0.3345593, -0.6882192, 2.189605, 0, 0.3215686, 1, 1,
0.3407094, -0.5349062, 1.041422, 0, 0.3176471, 1, 1,
0.3417721, 1.125208, -0.8250092, 0, 0.3098039, 1, 1,
0.3419151, -0.8926284, 2.481166, 0, 0.3058824, 1, 1,
0.342169, 0.7861769, 0.8259091, 0, 0.2980392, 1, 1,
0.3465234, 0.04921259, 1.58028, 0, 0.2901961, 1, 1,
0.3497459, -0.2204991, 2.03207, 0, 0.2862745, 1, 1,
0.3576958, -0.0391372, 2.313164, 0, 0.2784314, 1, 1,
0.3595923, 0.2569865, 2.929497, 0, 0.2745098, 1, 1,
0.3611114, 0.8017133, -0.944689, 0, 0.2666667, 1, 1,
0.3625165, -0.8486899, 3.479648, 0, 0.2627451, 1, 1,
0.3637603, 1.386435, -1.175284, 0, 0.254902, 1, 1,
0.3675187, -0.9018199, 2.606705, 0, 0.2509804, 1, 1,
0.3710625, -1.268137, 3.426295, 0, 0.2431373, 1, 1,
0.373793, 1.310261, 0.9056797, 0, 0.2392157, 1, 1,
0.3828575, 1.880987, -0.5132827, 0, 0.2313726, 1, 1,
0.3856852, 0.1343435, 0.9701422, 0, 0.227451, 1, 1,
0.3873078, -1.237031, 1.962093, 0, 0.2196078, 1, 1,
0.3876266, 1.788325, -0.4500956, 0, 0.2156863, 1, 1,
0.3884909, 0.3521955, 0.8166973, 0, 0.2078431, 1, 1,
0.3921504, 1.205829, -0.2148216, 0, 0.2039216, 1, 1,
0.398249, 0.218464, -0.06051475, 0, 0.1960784, 1, 1,
0.4002597, -0.6248512, 1.749112, 0, 0.1882353, 1, 1,
0.4044216, 0.3630465, 0.8811461, 0, 0.1843137, 1, 1,
0.4045029, 1.118377, 2.606857, 0, 0.1764706, 1, 1,
0.405489, -0.8069823, 3.949683, 0, 0.172549, 1, 1,
0.4115313, 0.9146016, -0.1020078, 0, 0.1647059, 1, 1,
0.4207365, -0.2671279, 2.530828, 0, 0.1607843, 1, 1,
0.4287325, -1.709741, 3.599242, 0, 0.1529412, 1, 1,
0.4317112, 0.2534756, 3.230053, 0, 0.1490196, 1, 1,
0.4343507, -0.6754483, 2.16482, 0, 0.1411765, 1, 1,
0.4356138, 1.158688, -0.2887679, 0, 0.1372549, 1, 1,
0.4410534, -1.707666, 2.305061, 0, 0.1294118, 1, 1,
0.4418556, 0.6041157, 0.392027, 0, 0.1254902, 1, 1,
0.4479225, -1.222049, 3.251459, 0, 0.1176471, 1, 1,
0.4513611, 1.440117, -0.3677306, 0, 0.1137255, 1, 1,
0.4519274, -0.3472924, 3.543559, 0, 0.1058824, 1, 1,
0.4526206, 0.512935, 0.9042404, 0, 0.09803922, 1, 1,
0.4555058, 1.034166, 0.5289968, 0, 0.09411765, 1, 1,
0.4595103, -0.04150116, 2.058345, 0, 0.08627451, 1, 1,
0.4647749, 0.3402338, -0.3326048, 0, 0.08235294, 1, 1,
0.4666502, 0.6069657, 0.5104888, 0, 0.07450981, 1, 1,
0.4674167, -0.7851934, 2.371587, 0, 0.07058824, 1, 1,
0.4693531, -0.7272754, 2.121521, 0, 0.0627451, 1, 1,
0.4726334, -1.031574, 2.270939, 0, 0.05882353, 1, 1,
0.4764575, 0.6005247, 0.5826816, 0, 0.05098039, 1, 1,
0.4833137, -1.118484, 3.207313, 0, 0.04705882, 1, 1,
0.4833443, -0.2849314, 1.809776, 0, 0.03921569, 1, 1,
0.4838186, 1.18513, 0.5626652, 0, 0.03529412, 1, 1,
0.485254, -1.222973, 3.735662, 0, 0.02745098, 1, 1,
0.4866085, -0.5186653, 2.319679, 0, 0.02352941, 1, 1,
0.4877815, -0.6052972, 2.206969, 0, 0.01568628, 1, 1,
0.4891015, 1.839857, -0.8114066, 0, 0.01176471, 1, 1,
0.4968834, 0.3097426, 2.739071, 0, 0.003921569, 1, 1,
0.4974859, -0.1139312, 1.937307, 0.003921569, 0, 1, 1,
0.50225, 0.6157188, 1.070988, 0.007843138, 0, 1, 1,
0.5035212, -0.3673388, 2.685956, 0.01568628, 0, 1, 1,
0.5050156, 0.9490932, 0.06188001, 0.01960784, 0, 1, 1,
0.5075793, -0.3818739, 1.589478, 0.02745098, 0, 1, 1,
0.516527, -2.007448, 4.537635, 0.03137255, 0, 1, 1,
0.5208061, 0.2451712, 2.099377, 0.03921569, 0, 1, 1,
0.5217636, 1.413682, 1.378154, 0.04313726, 0, 1, 1,
0.5221578, -0.3658018, 0.8115414, 0.05098039, 0, 1, 1,
0.5244781, 1.023316, 0.1614297, 0.05490196, 0, 1, 1,
0.526923, 1.770216, -0.3786457, 0.0627451, 0, 1, 1,
0.5270056, -1.370945, 3.493828, 0.06666667, 0, 1, 1,
0.5282381, -0.9671081, 3.040756, 0.07450981, 0, 1, 1,
0.5304089, -0.527424, 2.386337, 0.07843138, 0, 1, 1,
0.5316954, 0.8086998, 0.234381, 0.08627451, 0, 1, 1,
0.5359342, 0.5399047, 0.7122647, 0.09019608, 0, 1, 1,
0.5366961, 0.9282118, -0.7533818, 0.09803922, 0, 1, 1,
0.5410917, 0.5082336, -0.3841923, 0.1058824, 0, 1, 1,
0.5432706, -0.01085912, 1.759738, 0.1098039, 0, 1, 1,
0.5465848, 1.167648, 1.3357, 0.1176471, 0, 1, 1,
0.5504496, -0.2765377, 2.283136, 0.1215686, 0, 1, 1,
0.5508692, 0.6426823, -0.09754675, 0.1294118, 0, 1, 1,
0.5549942, 0.4267696, -0.08444223, 0.1333333, 0, 1, 1,
0.5573558, 0.8352344, 1.457068, 0.1411765, 0, 1, 1,
0.5597132, 1.361123, 0.1495466, 0.145098, 0, 1, 1,
0.5667201, 0.1372115, -0.03594054, 0.1529412, 0, 1, 1,
0.5667881, -0.2243649, 3.055845, 0.1568628, 0, 1, 1,
0.5682094, 0.4930657, 0.7166181, 0.1647059, 0, 1, 1,
0.5749521, 0.4663126, -0.6679021, 0.1686275, 0, 1, 1,
0.5771635, 0.5263455, 0.8634195, 0.1764706, 0, 1, 1,
0.5778285, 1.410997, -0.4485364, 0.1803922, 0, 1, 1,
0.5813345, 0.3275537, 0.8597301, 0.1882353, 0, 1, 1,
0.5817931, -0.5559418, 3.467158, 0.1921569, 0, 1, 1,
0.5865664, 0.06342977, 1.913708, 0.2, 0, 1, 1,
0.5876131, -0.2138787, 3.014742, 0.2078431, 0, 1, 1,
0.593075, -0.2187978, 2.891832, 0.2117647, 0, 1, 1,
0.5931706, 0.7775846, 2.309023, 0.2196078, 0, 1, 1,
0.6032771, 0.9079689, 0.5917597, 0.2235294, 0, 1, 1,
0.6044961, -1.040402, 2.203083, 0.2313726, 0, 1, 1,
0.6099502, 0.2116099, 0.8742132, 0.2352941, 0, 1, 1,
0.6126812, 0.3571001, 1.326231, 0.2431373, 0, 1, 1,
0.6127304, 0.5448925, -1.245513, 0.2470588, 0, 1, 1,
0.6199925, -2.826103, 3.010766, 0.254902, 0, 1, 1,
0.6343083, 0.9070787, -0.5817525, 0.2588235, 0, 1, 1,
0.6378197, -2.287056, 3.661549, 0.2666667, 0, 1, 1,
0.6385302, -0.787086, 2.818112, 0.2705882, 0, 1, 1,
0.6386972, -0.1394684, 1.959873, 0.2784314, 0, 1, 1,
0.6424768, -0.2445332, 2.711835, 0.282353, 0, 1, 1,
0.6436363, -1.332129, 2.553396, 0.2901961, 0, 1, 1,
0.6481074, 0.4058149, 0.6428537, 0.2941177, 0, 1, 1,
0.6489972, 0.8723376, 0.1502648, 0.3019608, 0, 1, 1,
0.6556762, 0.3417428, 1.071551, 0.3098039, 0, 1, 1,
0.6601148, 0.4900783, 1.124235, 0.3137255, 0, 1, 1,
0.6602499, 0.5528589, 1.425472, 0.3215686, 0, 1, 1,
0.6664656, -0.488899, 1.491361, 0.3254902, 0, 1, 1,
0.6673663, -1.46826, 4.017891, 0.3333333, 0, 1, 1,
0.6684537, -0.3961241, 2.507931, 0.3372549, 0, 1, 1,
0.6700872, 0.09061824, 1.054015, 0.345098, 0, 1, 1,
0.6709846, 0.6448009, 0.7962645, 0.3490196, 0, 1, 1,
0.6712327, 0.1528701, 2.226079, 0.3568628, 0, 1, 1,
0.6713248, -0.3466108, 2.651745, 0.3607843, 0, 1, 1,
0.6741887, -1.560176, 2.035379, 0.3686275, 0, 1, 1,
0.6743959, 0.3593082, 1.53669, 0.372549, 0, 1, 1,
0.676232, -0.3010901, 2.353819, 0.3803922, 0, 1, 1,
0.6831138, 0.3515099, 1.162107, 0.3843137, 0, 1, 1,
0.6832751, 2.483324, 2.382613, 0.3921569, 0, 1, 1,
0.6863959, -0.5052812, 3.236055, 0.3960784, 0, 1, 1,
0.6926773, -1.683123, 0.5625767, 0.4039216, 0, 1, 1,
0.6992661, -0.6676707, 2.398864, 0.4117647, 0, 1, 1,
0.7048246, 0.5990731, 0.9760904, 0.4156863, 0, 1, 1,
0.7077085, 0.2076441, 0.4683333, 0.4235294, 0, 1, 1,
0.7078466, -0.1403615, 0.3291039, 0.427451, 0, 1, 1,
0.7151642, -2.51054, 3.148265, 0.4352941, 0, 1, 1,
0.7167604, -0.01265022, 2.952848, 0.4392157, 0, 1, 1,
0.7209371, -0.2333036, 1.527962, 0.4470588, 0, 1, 1,
0.7217232, 1.135235, 0.5480836, 0.4509804, 0, 1, 1,
0.7230725, -0.9791929, 2.146258, 0.4588235, 0, 1, 1,
0.7245943, -0.9166078, 4.874659, 0.4627451, 0, 1, 1,
0.7250931, 1.392007, 0.3112328, 0.4705882, 0, 1, 1,
0.729543, -0.8563736, 1.49897, 0.4745098, 0, 1, 1,
0.7325455, 1.932193, 0.6585873, 0.4823529, 0, 1, 1,
0.732721, -0.4403384, 1.17937, 0.4862745, 0, 1, 1,
0.7336361, -0.5985753, 1.789542, 0.4941176, 0, 1, 1,
0.7362312, -0.4668229, 1.288646, 0.5019608, 0, 1, 1,
0.7381124, 1.085876, -1.174294, 0.5058824, 0, 1, 1,
0.7385833, -0.2688287, 1.581768, 0.5137255, 0, 1, 1,
0.7412678, -1.112775, 3.528722, 0.5176471, 0, 1, 1,
0.742303, -0.5098244, 3.724868, 0.5254902, 0, 1, 1,
0.7438325, -0.8775534, 2.416355, 0.5294118, 0, 1, 1,
0.745348, -1.323793, 3.335372, 0.5372549, 0, 1, 1,
0.7465734, 0.7632626, 2.34847, 0.5411765, 0, 1, 1,
0.7545648, -0.4853301, 3.55837, 0.5490196, 0, 1, 1,
0.7572958, -1.72189, 2.952397, 0.5529412, 0, 1, 1,
0.7609059, 1.360043, 0.5908153, 0.5607843, 0, 1, 1,
0.7617857, -1.096479, -0.03138874, 0.5647059, 0, 1, 1,
0.76724, -0.4199146, 0.02577534, 0.572549, 0, 1, 1,
0.7720633, -0.4770038, 2.877995, 0.5764706, 0, 1, 1,
0.7796334, -0.5393424, 3.931903, 0.5843138, 0, 1, 1,
0.781417, -0.4228607, 1.793523, 0.5882353, 0, 1, 1,
0.788766, 0.7799698, -1.605707, 0.5960785, 0, 1, 1,
0.7891641, -0.5642612, 3.656275, 0.6039216, 0, 1, 1,
0.7961069, 0.4649354, 0.2911003, 0.6078432, 0, 1, 1,
0.7997875, -1.931063, 1.995987, 0.6156863, 0, 1, 1,
0.8017368, -0.4577034, 1.541573, 0.6196079, 0, 1, 1,
0.8024313, -1.396218, 2.712799, 0.627451, 0, 1, 1,
0.8050049, -2.014926, 1.549044, 0.6313726, 0, 1, 1,
0.8096208, 2.08314, -0.3786044, 0.6392157, 0, 1, 1,
0.8100395, -0.5453587, 1.273194, 0.6431373, 0, 1, 1,
0.8112963, -0.3483994, 3.246349, 0.6509804, 0, 1, 1,
0.8147314, -0.3688391, 1.740995, 0.654902, 0, 1, 1,
0.8155226, -2.027281, 4.183599, 0.6627451, 0, 1, 1,
0.82386, 0.4806069, -0.8049722, 0.6666667, 0, 1, 1,
0.8239083, 1.13328, 0.432527, 0.6745098, 0, 1, 1,
0.8299164, 0.9190048, -0.3139114, 0.6784314, 0, 1, 1,
0.837346, -1.761169, 2.754258, 0.6862745, 0, 1, 1,
0.8449115, -1.418306, 0.7959521, 0.6901961, 0, 1, 1,
0.847609, -0.02612753, 1.717067, 0.6980392, 0, 1, 1,
0.8516836, -0.01407851, 2.330743, 0.7058824, 0, 1, 1,
0.8525822, -0.3286688, 2.20926, 0.7098039, 0, 1, 1,
0.8535904, -0.3228458, 1.784584, 0.7176471, 0, 1, 1,
0.8553564, 1.203632, 0.5779287, 0.7215686, 0, 1, 1,
0.8568001, 0.007121887, 1.933441, 0.7294118, 0, 1, 1,
0.8583656, 1.111632, 2.173278, 0.7333333, 0, 1, 1,
0.8630577, -0.1797316, 0.1574471, 0.7411765, 0, 1, 1,
0.8641677, 1.011653, 0.1798459, 0.7450981, 0, 1, 1,
0.8653435, 2.15278, -0.7090728, 0.7529412, 0, 1, 1,
0.8656886, -0.3122667, 2.158763, 0.7568628, 0, 1, 1,
0.8665888, -0.7898718, 3.498766, 0.7647059, 0, 1, 1,
0.8667679, -0.5037332, 2.83514, 0.7686275, 0, 1, 1,
0.8689641, 1.619669, 0.8132131, 0.7764706, 0, 1, 1,
0.8693562, 1.103237, 0.05521009, 0.7803922, 0, 1, 1,
0.8761585, -1.279137, 3.16136, 0.7882353, 0, 1, 1,
0.8764682, -2.156122, 3.035508, 0.7921569, 0, 1, 1,
0.8779309, 0.2527146, 1.261917, 0.8, 0, 1, 1,
0.8828897, -0.7863604, 2.609818, 0.8078431, 0, 1, 1,
0.8911363, 1.911672, -0.8661882, 0.8117647, 0, 1, 1,
0.8924959, 0.3033983, 0.1520678, 0.8196079, 0, 1, 1,
0.8946177, -0.8873582, 3.571067, 0.8235294, 0, 1, 1,
0.8961457, 0.438081, 1.668606, 0.8313726, 0, 1, 1,
0.896193, 0.08763863, 2.652554, 0.8352941, 0, 1, 1,
0.8970687, -1.265767, 1.531009, 0.8431373, 0, 1, 1,
0.899142, -0.9091588, 2.756143, 0.8470588, 0, 1, 1,
0.9008946, -1.04432, 2.520543, 0.854902, 0, 1, 1,
0.9091864, 0.8227283, -0.7563829, 0.8588235, 0, 1, 1,
0.9129676, -0.8045297, 3.463533, 0.8666667, 0, 1, 1,
0.9190626, 0.08695056, 2.373027, 0.8705882, 0, 1, 1,
0.9201066, 0.1403939, -0.01500206, 0.8784314, 0, 1, 1,
0.9220865, 0.1980101, 0.09116779, 0.8823529, 0, 1, 1,
0.9235075, -0.8402665, 3.553737, 0.8901961, 0, 1, 1,
0.9324672, 0.3427067, -0.9708527, 0.8941177, 0, 1, 1,
0.93506, 1.274044, 0.7508165, 0.9019608, 0, 1, 1,
0.9354982, -0.492255, 0.8406948, 0.9098039, 0, 1, 1,
0.9477254, 0.8305568, 0.7723917, 0.9137255, 0, 1, 1,
0.9486405, -1.512985, 1.659054, 0.9215686, 0, 1, 1,
0.9507205, 0.6829015, 1.002777, 0.9254902, 0, 1, 1,
0.9661918, 2.626301, -0.04123918, 0.9333333, 0, 1, 1,
0.966504, 0.7505436, 1.080474, 0.9372549, 0, 1, 1,
0.9675595, 1.578255, -0.6792144, 0.945098, 0, 1, 1,
0.9688756, -0.2715976, 1.349041, 0.9490196, 0, 1, 1,
0.9765535, 1.079862, 0.4445595, 0.9568627, 0, 1, 1,
0.9826739, 1.264422, -1.035241, 0.9607843, 0, 1, 1,
0.9953144, -0.6556553, 1.512498, 0.9686275, 0, 1, 1,
0.9959256, -1.360931, 0.6840679, 0.972549, 0, 1, 1,
1.00498, -0.3781415, 0.696242, 0.9803922, 0, 1, 1,
1.008721, 0.6606446, 1.625006, 0.9843137, 0, 1, 1,
1.011945, 1.365489, -0.5094464, 0.9921569, 0, 1, 1,
1.014483, 0.8126273, 1.626896, 0.9960784, 0, 1, 1,
1.01571, 0.5304797, -0.5658849, 1, 0, 0.9960784, 1,
1.017917, 0.5699573, 0.7418806, 1, 0, 0.9882353, 1,
1.020475, 0.1754132, 2.162907, 1, 0, 0.9843137, 1,
1.022554, -0.4679677, 2.287405, 1, 0, 0.9764706, 1,
1.024719, 0.5953149, 3.742852, 1, 0, 0.972549, 1,
1.034399, -0.2976189, 0.5923564, 1, 0, 0.9647059, 1,
1.040272, 0.5440395, 1.71989, 1, 0, 0.9607843, 1,
1.04968, -0.4043126, 2.602347, 1, 0, 0.9529412, 1,
1.049759, 0.0259722, 0.9295147, 1, 0, 0.9490196, 1,
1.06084, -0.3501415, 2.205683, 1, 0, 0.9411765, 1,
1.061104, 0.1220801, 1.770273, 1, 0, 0.9372549, 1,
1.064579, 0.6477683, 1.582014, 1, 0, 0.9294118, 1,
1.072594, 0.3798898, 1.708624, 1, 0, 0.9254902, 1,
1.075933, 1.518848, 0.4924649, 1, 0, 0.9176471, 1,
1.077681, -0.213755, 3.032852, 1, 0, 0.9137255, 1,
1.089611, -0.5426751, 2.436318, 1, 0, 0.9058824, 1,
1.092718, 0.2164434, 0.2616048, 1, 0, 0.9019608, 1,
1.10228, -0.2128339, 1.807857, 1, 0, 0.8941177, 1,
1.109934, -1.29036, 4.54605, 1, 0, 0.8862745, 1,
1.123277, 1.51181, -0.4152544, 1, 0, 0.8823529, 1,
1.128317, 0.4795597, -0.02816469, 1, 0, 0.8745098, 1,
1.131535, 1.373582, 0.04476411, 1, 0, 0.8705882, 1,
1.141115, 0.2387456, 1.623107, 1, 0, 0.8627451, 1,
1.14249, -0.544515, 2.796696, 1, 0, 0.8588235, 1,
1.142742, -0.7127407, 2.05694, 1, 0, 0.8509804, 1,
1.158028, -0.777749, 2.357448, 1, 0, 0.8470588, 1,
1.158518, 0.7577764, 0.6477301, 1, 0, 0.8392157, 1,
1.161349, 1.18208, 2.783828, 1, 0, 0.8352941, 1,
1.162016, -1.518316, 1.793864, 1, 0, 0.827451, 1,
1.166525, 1.746902, -0.1943873, 1, 0, 0.8235294, 1,
1.167869, -1.176486, 3.306103, 1, 0, 0.8156863, 1,
1.168052, -0.2643139, 0.4098822, 1, 0, 0.8117647, 1,
1.168859, -0.8976504, 3.519976, 1, 0, 0.8039216, 1,
1.176921, 0.3420821, 0.5061611, 1, 0, 0.7960784, 1,
1.176962, -0.5199356, 1.382723, 1, 0, 0.7921569, 1,
1.202351, 0.5769165, -0.3905764, 1, 0, 0.7843137, 1,
1.209533, -1.046055, 3.76329, 1, 0, 0.7803922, 1,
1.214707, 1.188785, 3.05937, 1, 0, 0.772549, 1,
1.219359, 0.3814661, 2.132829, 1, 0, 0.7686275, 1,
1.232192, 1.183175, 2.188228, 1, 0, 0.7607843, 1,
1.23242, -0.2786952, 2.257266, 1, 0, 0.7568628, 1,
1.237357, -0.9506277, 1.01416, 1, 0, 0.7490196, 1,
1.247186, 0.1935926, 2.058748, 1, 0, 0.7450981, 1,
1.254114, 0.8989496, 1.36648, 1, 0, 0.7372549, 1,
1.259334, 0.4562604, 1.412906, 1, 0, 0.7333333, 1,
1.26056, 0.3589553, 0.1636136, 1, 0, 0.7254902, 1,
1.26673, 1.688088, 0.6474816, 1, 0, 0.7215686, 1,
1.269912, 0.9196678, 0.4460891, 1, 0, 0.7137255, 1,
1.274069, -0.2650277, 1.335588, 1, 0, 0.7098039, 1,
1.276664, -0.9562891, 2.537814, 1, 0, 0.7019608, 1,
1.2851, 0.8699297, 2.20386, 1, 0, 0.6941177, 1,
1.28863, -0.7998526, 0.5068184, 1, 0, 0.6901961, 1,
1.308467, -0.8485289, 2.889848, 1, 0, 0.682353, 1,
1.308788, 0.2462577, 1.432778, 1, 0, 0.6784314, 1,
1.314383, -0.3784288, 1.819701, 1, 0, 0.6705883, 1,
1.32074, 0.4768133, 1.86368, 1, 0, 0.6666667, 1,
1.321529, 0.3257521, -0.07527586, 1, 0, 0.6588235, 1,
1.333478, 1.801903, -0.7233001, 1, 0, 0.654902, 1,
1.335858, -0.5362527, 0.2885345, 1, 0, 0.6470588, 1,
1.337417, 0.002610017, 2.832779, 1, 0, 0.6431373, 1,
1.338448, 0.9909592, 1.097537, 1, 0, 0.6352941, 1,
1.341533, 2.42756, 0.7523726, 1, 0, 0.6313726, 1,
1.344961, 1.92302, -0.02852085, 1, 0, 0.6235294, 1,
1.370194, -1.273907, 2.420612, 1, 0, 0.6196079, 1,
1.372864, 0.3589908, 1.825631, 1, 0, 0.6117647, 1,
1.384606, 0.5881801, -0.6169078, 1, 0, 0.6078432, 1,
1.391273, -1.038607, 1.106037, 1, 0, 0.6, 1,
1.392252, -0.2688133, 1.752719, 1, 0, 0.5921569, 1,
1.395817, 0.2987308, 1.570855, 1, 0, 0.5882353, 1,
1.399409, 1.490363, -0.2054274, 1, 0, 0.5803922, 1,
1.407071, 0.1706389, 2.048039, 1, 0, 0.5764706, 1,
1.414482, -0.3439534, 3.024698, 1, 0, 0.5686275, 1,
1.417474, 0.8989319, 1.160004, 1, 0, 0.5647059, 1,
1.425176, 0.9659104, -0.3793191, 1, 0, 0.5568628, 1,
1.426012, -0.2303406, 0.7284026, 1, 0, 0.5529412, 1,
1.430769, 2.038423, 0.8000095, 1, 0, 0.5450981, 1,
1.447061, -1.528036, 1.144808, 1, 0, 0.5411765, 1,
1.450536, 0.879354, 1.281887, 1, 0, 0.5333334, 1,
1.456617, -0.9272461, 4.403338, 1, 0, 0.5294118, 1,
1.477707, -1.159128, 2.824235, 1, 0, 0.5215687, 1,
1.483954, 0.3688455, 1.153674, 1, 0, 0.5176471, 1,
1.502825, -0.4643721, 3.169534, 1, 0, 0.509804, 1,
1.504564, -0.6577277, 4.044153, 1, 0, 0.5058824, 1,
1.513532, -0.6589887, 4.086299, 1, 0, 0.4980392, 1,
1.516804, -0.7851772, 2.717544, 1, 0, 0.4901961, 1,
1.521067, 0.03120551, 0.5585749, 1, 0, 0.4862745, 1,
1.521751, 0.1659016, 2.348366, 1, 0, 0.4784314, 1,
1.531623, -1.896412, 3.439172, 1, 0, 0.4745098, 1,
1.53619, -0.7114348, 2.081203, 1, 0, 0.4666667, 1,
1.540066, -0.5679058, 2.897767, 1, 0, 0.4627451, 1,
1.54791, 0.7026516, 0.847578, 1, 0, 0.454902, 1,
1.561119, 0.1336155, 2.572992, 1, 0, 0.4509804, 1,
1.564745, 0.3849649, 0.9420854, 1, 0, 0.4431373, 1,
1.568984, -0.9191393, 1.112973, 1, 0, 0.4392157, 1,
1.571472, -0.6844294, 2.184623, 1, 0, 0.4313726, 1,
1.573038, -1.305623, 3.114883, 1, 0, 0.427451, 1,
1.577372, -0.1956876, 3.568837, 1, 0, 0.4196078, 1,
1.58144, -1.651055, 2.810233, 1, 0, 0.4156863, 1,
1.601238, -1.078867, 1.355123, 1, 0, 0.4078431, 1,
1.609233, 1.000363, 1.012561, 1, 0, 0.4039216, 1,
1.61305, 0.7205967, 0.7495669, 1, 0, 0.3960784, 1,
1.614683, -0.8219002, 2.197597, 1, 0, 0.3882353, 1,
1.626685, 0.7038764, 0.4485433, 1, 0, 0.3843137, 1,
1.632636, -1.207713, 2.692749, 1, 0, 0.3764706, 1,
1.638964, 0.002049568, 1.568714, 1, 0, 0.372549, 1,
1.644871, -0.2602189, 1.688316, 1, 0, 0.3647059, 1,
1.648093, -0.6320891, 1.927627, 1, 0, 0.3607843, 1,
1.650928, -1.05471, 2.10517, 1, 0, 0.3529412, 1,
1.656385, 1.596429, 1.518749, 1, 0, 0.3490196, 1,
1.656765, -0.3838542, 3.000133, 1, 0, 0.3411765, 1,
1.660921, -0.2321137, 2.518653, 1, 0, 0.3372549, 1,
1.69986, 0.5840309, 1.407958, 1, 0, 0.3294118, 1,
1.711638, 0.2248495, 2.304412, 1, 0, 0.3254902, 1,
1.714382, 0.06109706, 1.073839, 1, 0, 0.3176471, 1,
1.724726, -0.9904861, 2.209289, 1, 0, 0.3137255, 1,
1.729226, -1.527358, 1.256176, 1, 0, 0.3058824, 1,
1.779334, -0.7275679, 2.7374, 1, 0, 0.2980392, 1,
1.783947, -2.620291, 1.939244, 1, 0, 0.2941177, 1,
1.787921, 0.3417861, 1.667468, 1, 0, 0.2862745, 1,
1.790766, -0.8686851, 2.793321, 1, 0, 0.282353, 1,
1.801852, -1.067772, 1.496906, 1, 0, 0.2745098, 1,
1.80279, -0.3609921, 2.503158, 1, 0, 0.2705882, 1,
1.810905, -1.705909, 1.336818, 1, 0, 0.2627451, 1,
1.81401, 1.345689, 2.439832, 1, 0, 0.2588235, 1,
1.816012, -0.5643599, 2.532119, 1, 0, 0.2509804, 1,
1.842059, -0.6636873, 0.2016492, 1, 0, 0.2470588, 1,
1.843881, -0.5078024, 0.9790996, 1, 0, 0.2392157, 1,
1.877915, -0.2777513, 1.608258, 1, 0, 0.2352941, 1,
1.889358, -1.313435, 1.701729, 1, 0, 0.227451, 1,
1.890075, 1.155843, 1.62324, 1, 0, 0.2235294, 1,
1.898793, -0.8336649, 1.487686, 1, 0, 0.2156863, 1,
1.918149, -0.07908873, 2.350011, 1, 0, 0.2117647, 1,
1.924672, -0.559382, 1.183679, 1, 0, 0.2039216, 1,
1.929392, -0.2479298, 1.605333, 1, 0, 0.1960784, 1,
1.937042, -0.7831092, 1.697601, 1, 0, 0.1921569, 1,
1.952047, -1.447919, 2.958434, 1, 0, 0.1843137, 1,
1.957466, -1.049016, 1.651486, 1, 0, 0.1803922, 1,
1.960932, 1.5989, 0.5600835, 1, 0, 0.172549, 1,
1.980461, -0.077759, 1.83049, 1, 0, 0.1686275, 1,
1.985375, -1.114851, 3.412098, 1, 0, 0.1607843, 1,
1.988087, -0.1324321, 0.6236939, 1, 0, 0.1568628, 1,
1.999158, -2.729612, 3.304453, 1, 0, 0.1490196, 1,
2.017084, -0.1592702, 1.148673, 1, 0, 0.145098, 1,
2.067199, -2.302608, 1.895503, 1, 0, 0.1372549, 1,
2.081404, 1.415298, 0.9219495, 1, 0, 0.1333333, 1,
2.085456, -0.08673607, 2.119463, 1, 0, 0.1254902, 1,
2.134964, -0.05637503, -1.148256, 1, 0, 0.1215686, 1,
2.168642, -0.4409223, 2.619759, 1, 0, 0.1137255, 1,
2.169762, -1.307897, 2.785833, 1, 0, 0.1098039, 1,
2.170367, -1.094319, 2.898842, 1, 0, 0.1019608, 1,
2.198609, -0.8936241, 1.661739, 1, 0, 0.09411765, 1,
2.265057, 0.3009557, 1.590623, 1, 0, 0.09019608, 1,
2.285456, 0.100968, 3.722356, 1, 0, 0.08235294, 1,
2.297808, -0.276786, 1.63757, 1, 0, 0.07843138, 1,
2.299774, 1.477313, 0.561716, 1, 0, 0.07058824, 1,
2.350188, 0.05326015, 3.415688, 1, 0, 0.06666667, 1,
2.361188, -0.8507237, 4.081518, 1, 0, 0.05882353, 1,
2.362958, 0.1179263, 0.553683, 1, 0, 0.05490196, 1,
2.372367, 0.4693796, 2.608254, 1, 0, 0.04705882, 1,
2.380576, -0.2349205, 1.735657, 1, 0, 0.04313726, 1,
2.388114, -0.8995387, 2.397058, 1, 0, 0.03529412, 1,
2.47764, -0.1887369, 3.237069, 1, 0, 0.03137255, 1,
2.618127, -0.1451118, 2.495239, 1, 0, 0.02352941, 1,
2.626511, 0.3731837, 1.471551, 1, 0, 0.01960784, 1,
2.677034, 0.05954905, 1.837231, 1, 0, 0.01176471, 1,
2.997641, 0.3038061, 2.50518, 1, 0, 0.007843138, 1
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
0.05931342, -4.327162, -6.800309, 0, -0.5, 0.5, 0.5,
0.05931342, -4.327162, -6.800309, 1, -0.5, 0.5, 0.5,
0.05931342, -4.327162, -6.800309, 1, 1.5, 0.5, 0.5,
0.05931342, -4.327162, -6.800309, 0, 1.5, 0.5, 0.5
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
-3.875108, -0.1263882, -6.800309, 0, -0.5, 0.5, 0.5,
-3.875108, -0.1263882, -6.800309, 1, -0.5, 0.5, 0.5,
-3.875108, -0.1263882, -6.800309, 1, 1.5, 0.5, 0.5,
-3.875108, -0.1263882, -6.800309, 0, 1.5, 0.5, 0.5
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
-3.875108, -4.327162, 0.1673117, 0, -0.5, 0.5, 0.5,
-3.875108, -4.327162, 0.1673117, 1, -0.5, 0.5, 0.5,
-3.875108, -4.327162, 0.1673117, 1, 1.5, 0.5, 0.5,
-3.875108, -4.327162, 0.1673117, 0, 1.5, 0.5, 0.5
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
-2, -3.357753, -5.192397,
2, -3.357753, -5.192397,
-2, -3.357753, -5.192397,
-2, -3.519321, -5.460382,
-1, -3.357753, -5.192397,
-1, -3.519321, -5.460382,
0, -3.357753, -5.192397,
0, -3.519321, -5.460382,
1, -3.357753, -5.192397,
1, -3.519321, -5.460382,
2, -3.357753, -5.192397,
2, -3.519321, -5.460382
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
-2, -3.842457, -5.996353, 0, -0.5, 0.5, 0.5,
-2, -3.842457, -5.996353, 1, -0.5, 0.5, 0.5,
-2, -3.842457, -5.996353, 1, 1.5, 0.5, 0.5,
-2, -3.842457, -5.996353, 0, 1.5, 0.5, 0.5,
-1, -3.842457, -5.996353, 0, -0.5, 0.5, 0.5,
-1, -3.842457, -5.996353, 1, -0.5, 0.5, 0.5,
-1, -3.842457, -5.996353, 1, 1.5, 0.5, 0.5,
-1, -3.842457, -5.996353, 0, 1.5, 0.5, 0.5,
0, -3.842457, -5.996353, 0, -0.5, 0.5, 0.5,
0, -3.842457, -5.996353, 1, -0.5, 0.5, 0.5,
0, -3.842457, -5.996353, 1, 1.5, 0.5, 0.5,
0, -3.842457, -5.996353, 0, 1.5, 0.5, 0.5,
1, -3.842457, -5.996353, 0, -0.5, 0.5, 0.5,
1, -3.842457, -5.996353, 1, -0.5, 0.5, 0.5,
1, -3.842457, -5.996353, 1, 1.5, 0.5, 0.5,
1, -3.842457, -5.996353, 0, 1.5, 0.5, 0.5,
2, -3.842457, -5.996353, 0, -0.5, 0.5, 0.5,
2, -3.842457, -5.996353, 1, -0.5, 0.5, 0.5,
2, -3.842457, -5.996353, 1, 1.5, 0.5, 0.5,
2, -3.842457, -5.996353, 0, 1.5, 0.5, 0.5
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
-2.967164, -3, -5.192397,
-2.967164, 3, -5.192397,
-2.967164, -3, -5.192397,
-3.118488, -3, -5.460382,
-2.967164, -2, -5.192397,
-3.118488, -2, -5.460382,
-2.967164, -1, -5.192397,
-3.118488, -1, -5.460382,
-2.967164, 0, -5.192397,
-3.118488, 0, -5.460382,
-2.967164, 1, -5.192397,
-3.118488, 1, -5.460382,
-2.967164, 2, -5.192397,
-3.118488, 2, -5.460382,
-2.967164, 3, -5.192397,
-3.118488, 3, -5.460382
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
-3.421136, -3, -5.996353, 0, -0.5, 0.5, 0.5,
-3.421136, -3, -5.996353, 1, -0.5, 0.5, 0.5,
-3.421136, -3, -5.996353, 1, 1.5, 0.5, 0.5,
-3.421136, -3, -5.996353, 0, 1.5, 0.5, 0.5,
-3.421136, -2, -5.996353, 0, -0.5, 0.5, 0.5,
-3.421136, -2, -5.996353, 1, -0.5, 0.5, 0.5,
-3.421136, -2, -5.996353, 1, 1.5, 0.5, 0.5,
-3.421136, -2, -5.996353, 0, 1.5, 0.5, 0.5,
-3.421136, -1, -5.996353, 0, -0.5, 0.5, 0.5,
-3.421136, -1, -5.996353, 1, -0.5, 0.5, 0.5,
-3.421136, -1, -5.996353, 1, 1.5, 0.5, 0.5,
-3.421136, -1, -5.996353, 0, 1.5, 0.5, 0.5,
-3.421136, 0, -5.996353, 0, -0.5, 0.5, 0.5,
-3.421136, 0, -5.996353, 1, -0.5, 0.5, 0.5,
-3.421136, 0, -5.996353, 1, 1.5, 0.5, 0.5,
-3.421136, 0, -5.996353, 0, 1.5, 0.5, 0.5,
-3.421136, 1, -5.996353, 0, -0.5, 0.5, 0.5,
-3.421136, 1, -5.996353, 1, -0.5, 0.5, 0.5,
-3.421136, 1, -5.996353, 1, 1.5, 0.5, 0.5,
-3.421136, 1, -5.996353, 0, 1.5, 0.5, 0.5,
-3.421136, 2, -5.996353, 0, -0.5, 0.5, 0.5,
-3.421136, 2, -5.996353, 1, -0.5, 0.5, 0.5,
-3.421136, 2, -5.996353, 1, 1.5, 0.5, 0.5,
-3.421136, 2, -5.996353, 0, 1.5, 0.5, 0.5,
-3.421136, 3, -5.996353, 0, -0.5, 0.5, 0.5,
-3.421136, 3, -5.996353, 1, -0.5, 0.5, 0.5,
-3.421136, 3, -5.996353, 1, 1.5, 0.5, 0.5,
-3.421136, 3, -5.996353, 0, 1.5, 0.5, 0.5
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
-2.967164, -3.357753, -4,
-2.967164, -3.357753, 4,
-2.967164, -3.357753, -4,
-3.118488, -3.519321, -4,
-2.967164, -3.357753, -2,
-3.118488, -3.519321, -2,
-2.967164, -3.357753, 0,
-3.118488, -3.519321, 0,
-2.967164, -3.357753, 2,
-3.118488, -3.519321, 2,
-2.967164, -3.357753, 4,
-3.118488, -3.519321, 4
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
-3.421136, -3.842457, -4, 0, -0.5, 0.5, 0.5,
-3.421136, -3.842457, -4, 1, -0.5, 0.5, 0.5,
-3.421136, -3.842457, -4, 1, 1.5, 0.5, 0.5,
-3.421136, -3.842457, -4, 0, 1.5, 0.5, 0.5,
-3.421136, -3.842457, -2, 0, -0.5, 0.5, 0.5,
-3.421136, -3.842457, -2, 1, -0.5, 0.5, 0.5,
-3.421136, -3.842457, -2, 1, 1.5, 0.5, 0.5,
-3.421136, -3.842457, -2, 0, 1.5, 0.5, 0.5,
-3.421136, -3.842457, 0, 0, -0.5, 0.5, 0.5,
-3.421136, -3.842457, 0, 1, -0.5, 0.5, 0.5,
-3.421136, -3.842457, 0, 1, 1.5, 0.5, 0.5,
-3.421136, -3.842457, 0, 0, 1.5, 0.5, 0.5,
-3.421136, -3.842457, 2, 0, -0.5, 0.5, 0.5,
-3.421136, -3.842457, 2, 1, -0.5, 0.5, 0.5,
-3.421136, -3.842457, 2, 1, 1.5, 0.5, 0.5,
-3.421136, -3.842457, 2, 0, 1.5, 0.5, 0.5,
-3.421136, -3.842457, 4, 0, -0.5, 0.5, 0.5,
-3.421136, -3.842457, 4, 1, -0.5, 0.5, 0.5,
-3.421136, -3.842457, 4, 1, 1.5, 0.5, 0.5,
-3.421136, -3.842457, 4, 0, 1.5, 0.5, 0.5
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
-2.967164, -3.357753, -5.192397,
-2.967164, 3.104976, -5.192397,
-2.967164, -3.357753, 5.52702,
-2.967164, 3.104976, 5.52702,
-2.967164, -3.357753, -5.192397,
-2.967164, -3.357753, 5.52702,
-2.967164, 3.104976, -5.192397,
-2.967164, 3.104976, 5.52702,
-2.967164, -3.357753, -5.192397,
3.085791, -3.357753, -5.192397,
-2.967164, -3.357753, 5.52702,
3.085791, -3.357753, 5.52702,
-2.967164, 3.104976, -5.192397,
3.085791, 3.104976, -5.192397,
-2.967164, 3.104976, 5.52702,
3.085791, 3.104976, 5.52702,
3.085791, -3.357753, -5.192397,
3.085791, 3.104976, -5.192397,
3.085791, -3.357753, 5.52702,
3.085791, 3.104976, 5.52702,
3.085791, -3.357753, -5.192397,
3.085791, -3.357753, 5.52702,
3.085791, 3.104976, -5.192397,
3.085791, 3.104976, 5.52702
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
var radius = 7.42427;
var distance = 33.03142;
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
mvMatrix.translate( -0.05931342, 0.1263882, -0.1673117 );
mvMatrix.scale( 1.326173, 1.242086, 0.7488529 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.03142);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
benzoylhydrazone<-read.table("benzoylhydrazone.xyz")
```

```
## Error in read.table("benzoylhydrazone.xyz"): no lines available in input
```

```r
x<-benzoylhydrazone$V2
```

```
## Error in eval(expr, envir, enclos): object 'benzoylhydrazone' not found
```

```r
y<-benzoylhydrazone$V3
```

```
## Error in eval(expr, envir, enclos): object 'benzoylhydrazone' not found
```

```r
z<-benzoylhydrazone$V4
```

```
## Error in eval(expr, envir, enclos): object 'benzoylhydrazone' not found
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
-2.879014, -0.8548911, -0.6015751, 0, 0, 1, 1, 1,
-2.760273, -0.7428113, -1.964012, 1, 0, 0, 1, 1,
-2.6861, -0.7267879, -3.977453, 1, 0, 0, 1, 1,
-2.481713, 0.4462441, -1.375939, 1, 0, 0, 1, 1,
-2.396952, -0.319671, -3.381424, 1, 0, 0, 1, 1,
-2.241038, -0.02088338, 0.4078883, 1, 0, 0, 1, 1,
-2.186063, -0.1472637, -1.889154, 0, 0, 0, 1, 1,
-2.184192, -0.282758, -1.616819, 0, 0, 0, 1, 1,
-2.142715, -1.16188, -1.907865, 0, 0, 0, 1, 1,
-2.122338, -1.644471, -1.776946, 0, 0, 0, 1, 1,
-2.117227, 0.6866353, -2.809802, 0, 0, 0, 1, 1,
-2.116024, 0.8768911, -2.739079, 0, 0, 0, 1, 1,
-2.115023, -1.965201, -1.452243, 0, 0, 0, 1, 1,
-2.101892, 0.211724, -2.845908, 1, 1, 1, 1, 1,
-2.089478, 1.433561, 0.1747583, 1, 1, 1, 1, 1,
-2.073291, 0.109238, -0.3770743, 1, 1, 1, 1, 1,
-2.055811, 0.07677845, -1.887043, 1, 1, 1, 1, 1,
-1.986263, 0.03071064, -1.370009, 1, 1, 1, 1, 1,
-1.98411, 0.4335954, 0.1108171, 1, 1, 1, 1, 1,
-1.950727, 0.7649719, 0.5274025, 1, 1, 1, 1, 1,
-1.943372, -0.7881197, -1.446081, 1, 1, 1, 1, 1,
-1.911749, -1.465847, -3.28427, 1, 1, 1, 1, 1,
-1.909734, -0.09616882, -1.902219, 1, 1, 1, 1, 1,
-1.876433, -0.6025141, -3.441198, 1, 1, 1, 1, 1,
-1.874537, -1.010196, -0.636942, 1, 1, 1, 1, 1,
-1.872256, 0.2386421, -1.212373, 1, 1, 1, 1, 1,
-1.867182, 0.5962015, 0.1692761, 1, 1, 1, 1, 1,
-1.866715, -0.2980438, -1.18096, 1, 1, 1, 1, 1,
-1.86473, -0.2359311, -3.060682, 0, 0, 1, 1, 1,
-1.862646, -0.9207647, -0.6140031, 1, 0, 0, 1, 1,
-1.83687, 0.5620111, -1.995268, 1, 0, 0, 1, 1,
-1.826116, 0.9538106, -2.161479, 1, 0, 0, 1, 1,
-1.814128, 0.4976959, -0.8658926, 1, 0, 0, 1, 1,
-1.801161, -1.557245, -2.626797, 1, 0, 0, 1, 1,
-1.794706, 0.1685101, -0.268174, 0, 0, 0, 1, 1,
-1.792116, 1.425075, -0.05266293, 0, 0, 0, 1, 1,
-1.789275, 0.5365079, -1.443856, 0, 0, 0, 1, 1,
-1.788015, 1.013724, 0.1467276, 0, 0, 0, 1, 1,
-1.77051, -0.6377026, -3.388205, 0, 0, 0, 1, 1,
-1.765648, 0.9116561, -1.939151, 0, 0, 0, 1, 1,
-1.740392, -1.277822, -3.108851, 0, 0, 0, 1, 1,
-1.738963, -0.469144, -1.016684, 1, 1, 1, 1, 1,
-1.734141, -0.7182453, -3.122088, 1, 1, 1, 1, 1,
-1.707144, 1.230535, 0.4288359, 1, 1, 1, 1, 1,
-1.693031, 0.9835221, -2.053159, 1, 1, 1, 1, 1,
-1.656239, 0.03415691, -2.587059, 1, 1, 1, 1, 1,
-1.621791, 1.739604, -1.003269, 1, 1, 1, 1, 1,
-1.615679, 2.596583, -0.7667761, 1, 1, 1, 1, 1,
-1.606251, 0.5297408, -1.688627, 1, 1, 1, 1, 1,
-1.595586, 0.146126, -2.740222, 1, 1, 1, 1, 1,
-1.591071, 1.137311, -1.537532, 1, 1, 1, 1, 1,
-1.585623, -0.3385721, -4.061213, 1, 1, 1, 1, 1,
-1.583998, -0.8577896, -3.025084, 1, 1, 1, 1, 1,
-1.582446, 0.395644, -1.924034, 1, 1, 1, 1, 1,
-1.578095, 0.8117753, -1.792759, 1, 1, 1, 1, 1,
-1.577102, -0.07573502, -0.4871966, 1, 1, 1, 1, 1,
-1.574675, 0.4491658, -1.099735, 0, 0, 1, 1, 1,
-1.573138, -0.228404, 0.2376407, 1, 0, 0, 1, 1,
-1.561483, 0.6256976, -1.345615, 1, 0, 0, 1, 1,
-1.554803, -1.797782, -1.998013, 1, 0, 0, 1, 1,
-1.554587, 0.3464963, -1.291826, 1, 0, 0, 1, 1,
-1.53836, -1.071792, -0.7257919, 1, 0, 0, 1, 1,
-1.535693, 1.443029, 0.5330289, 0, 0, 0, 1, 1,
-1.533061, -1.165316, -1.635715, 0, 0, 0, 1, 1,
-1.531212, -1.206717, -2.445348, 0, 0, 0, 1, 1,
-1.524159, 0.1605032, -1.062713, 0, 0, 0, 1, 1,
-1.512708, -1.059703, -1.51722, 0, 0, 0, 1, 1,
-1.511739, -0.3157782, -1.75098, 0, 0, 0, 1, 1,
-1.486381, 0.1933922, -1.014424, 0, 0, 0, 1, 1,
-1.479794, 0.009861707, -1.726065, 1, 1, 1, 1, 1,
-1.479167, -0.3546976, -2.797989, 1, 1, 1, 1, 1,
-1.462065, -0.5834376, -0.805726, 1, 1, 1, 1, 1,
-1.457588, -0.2936998, -0.4387511, 1, 1, 1, 1, 1,
-1.456034, -0.1327716, 0.03875235, 1, 1, 1, 1, 1,
-1.454662, 1.152358, -1.996008, 1, 1, 1, 1, 1,
-1.454497, 0.05530144, -1.80791, 1, 1, 1, 1, 1,
-1.450989, 0.4196973, -2.237539, 1, 1, 1, 1, 1,
-1.436973, 0.2892198, -1.360914, 1, 1, 1, 1, 1,
-1.436062, 1.494659, -3.061288, 1, 1, 1, 1, 1,
-1.428031, -0.8686904, -1.362921, 1, 1, 1, 1, 1,
-1.425366, 0.1711656, -1.742172, 1, 1, 1, 1, 1,
-1.409145, 1.964856, 0.2468057, 1, 1, 1, 1, 1,
-1.405331, 1.520669, -0.5533435, 1, 1, 1, 1, 1,
-1.392736, 1.985775, 0.3751124, 1, 1, 1, 1, 1,
-1.384848, -1.21306, -1.879607, 0, 0, 1, 1, 1,
-1.384689, 0.3089429, -1.648066, 1, 0, 0, 1, 1,
-1.369678, -0.09770294, -2.909241, 1, 0, 0, 1, 1,
-1.358323, -1.202999, -2.672517, 1, 0, 0, 1, 1,
-1.346579, -0.1604417, -1.425979, 1, 0, 0, 1, 1,
-1.339099, -0.3031085, -1.921831, 1, 0, 0, 1, 1,
-1.329859, -0.0650102, -3.323752, 0, 0, 0, 1, 1,
-1.326483, 0.7032086, 0.0951988, 0, 0, 0, 1, 1,
-1.32144, -0.9784818, -2.583679, 0, 0, 0, 1, 1,
-1.317757, 0.447701, -0.9868331, 0, 0, 0, 1, 1,
-1.301049, -0.7149816, -3.157753, 0, 0, 0, 1, 1,
-1.297475, 1.663283, 0.2590214, 0, 0, 0, 1, 1,
-1.289755, 1.582511, -1.179813, 0, 0, 0, 1, 1,
-1.28939, 2.935153, -2.032767, 1, 1, 1, 1, 1,
-1.28589, -0.1106416, -1.678516, 1, 1, 1, 1, 1,
-1.279831, 1.366645, -2.862003, 1, 1, 1, 1, 1,
-1.27611, -0.08173531, -1.768866, 1, 1, 1, 1, 1,
-1.272626, 1.038502, -2.121353, 1, 1, 1, 1, 1,
-1.269205, 1.281632, -1.261249, 1, 1, 1, 1, 1,
-1.240873, -0.809811, -1.699625, 1, 1, 1, 1, 1,
-1.240053, -3.263635, -2.169166, 1, 1, 1, 1, 1,
-1.238496, 0.9889064, -1.749976, 1, 1, 1, 1, 1,
-1.236915, 0.1503033, -1.252666, 1, 1, 1, 1, 1,
-1.230824, 0.6754984, -0.7181998, 1, 1, 1, 1, 1,
-1.230337, 0.04117237, -1.086624, 1, 1, 1, 1, 1,
-1.224928, -0.1840546, -3.233549, 1, 1, 1, 1, 1,
-1.215858, -0.03164745, -2.045065, 1, 1, 1, 1, 1,
-1.208154, -0.2967723, -0.9367154, 1, 1, 1, 1, 1,
-1.206983, -0.4061249, -1.699192, 0, 0, 1, 1, 1,
-1.195878, -0.6916404, -3.199899, 1, 0, 0, 1, 1,
-1.186191, -0.5356964, -0.819707, 1, 0, 0, 1, 1,
-1.18091, 0.05252706, -1.704625, 1, 0, 0, 1, 1,
-1.179318, -0.6925011, -1.40268, 1, 0, 0, 1, 1,
-1.175223, 2.088591, -1.494363, 1, 0, 0, 1, 1,
-1.161546, -0.6267652, -0.8201565, 0, 0, 0, 1, 1,
-1.160761, 1.270934, -0.7738164, 0, 0, 0, 1, 1,
-1.158364, -0.3134147, -2.221673, 0, 0, 0, 1, 1,
-1.157538, 1.047852, -0.2431782, 0, 0, 0, 1, 1,
-1.150822, -0.103704, -0.9616848, 0, 0, 0, 1, 1,
-1.133261, 1.477646, -1.912949, 0, 0, 0, 1, 1,
-1.132459, -0.3032594, -1.79522, 0, 0, 0, 1, 1,
-1.131984, 0.5822216, -0.0959745, 1, 1, 1, 1, 1,
-1.123946, 0.6058513, -0.950676, 1, 1, 1, 1, 1,
-1.118024, -1.272464, -2.914006, 1, 1, 1, 1, 1,
-1.11454, -0.364101, -2.961747, 1, 1, 1, 1, 1,
-1.112293, 0.4110149, -0.9037873, 1, 1, 1, 1, 1,
-1.11046, 0.6969292, -2.40251, 1, 1, 1, 1, 1,
-1.109167, 0.4398265, 0.326993, 1, 1, 1, 1, 1,
-1.106627, 1.043002, -1.14196, 1, 1, 1, 1, 1,
-1.106183, -0.9600095, -2.07444, 1, 1, 1, 1, 1,
-1.100857, 0.9890531, -2.382023, 1, 1, 1, 1, 1,
-1.091243, 1.254165, -0.6634737, 1, 1, 1, 1, 1,
-1.085402, 0.5450278, -2.438885, 1, 1, 1, 1, 1,
-1.07637, 1.614445, -0.1415311, 1, 1, 1, 1, 1,
-1.072771, 0.3184279, -1.324483, 1, 1, 1, 1, 1,
-1.071522, -0.2231916, -1.351077, 1, 1, 1, 1, 1,
-1.062438, -0.7445977, -1.617883, 0, 0, 1, 1, 1,
-1.061897, 1.335346, 1.34213, 1, 0, 0, 1, 1,
-1.052072, 1.382273, -2.136867, 1, 0, 0, 1, 1,
-1.049541, 0.683732, -1.546726, 1, 0, 0, 1, 1,
-1.04787, 1.007354, 0.2950587, 1, 0, 0, 1, 1,
-1.045208, 0.8427935, -1.229226, 1, 0, 0, 1, 1,
-1.042821, 0.4794195, 0.2847531, 0, 0, 0, 1, 1,
-1.040544, -1.658914, -3.62477, 0, 0, 0, 1, 1,
-1.038407, 1.925503, 0.1988196, 0, 0, 0, 1, 1,
-1.036366, -2.107986, -3.485359, 0, 0, 0, 1, 1,
-1.027103, -1.259676, -3.970509, 0, 0, 0, 1, 1,
-1.024241, 0.3877331, -2.183334, 0, 0, 0, 1, 1,
-1.023787, -1.18084, -3.38359, 0, 0, 0, 1, 1,
-1.02058, 0.4481238, -2.037516, 1, 1, 1, 1, 1,
-1.013903, -0.7491816, -2.307813, 1, 1, 1, 1, 1,
-1.012697, 0.5939396, -0.8436131, 1, 1, 1, 1, 1,
-1.010234, 0.9006625, 0.203635, 1, 1, 1, 1, 1,
-1.009762, -0.4783295, -0.8557393, 1, 1, 1, 1, 1,
-1.003909, -0.3842883, -0.6072621, 1, 1, 1, 1, 1,
-1.000653, 0.1925385, -0.7014208, 1, 1, 1, 1, 1,
-0.9980329, 1.480834, 0.3597471, 1, 1, 1, 1, 1,
-0.9974515, 0.4594982, -1.887169, 1, 1, 1, 1, 1,
-0.9759145, -1.651048, -2.226594, 1, 1, 1, 1, 1,
-0.9755844, 0.7537867, -0.5636418, 1, 1, 1, 1, 1,
-0.9699013, -0.3789838, -0.3044303, 1, 1, 1, 1, 1,
-0.9617692, 1.11149, -0.1101712, 1, 1, 1, 1, 1,
-0.9595237, 0.2773712, -1.162721, 1, 1, 1, 1, 1,
-0.9566742, 1.407887, -0.4921974, 1, 1, 1, 1, 1,
-0.9537292, -0.2323072, -3.614173, 0, 0, 1, 1, 1,
-0.9494581, -0.8061731, -0.9773798, 1, 0, 0, 1, 1,
-0.9494457, 0.1478561, -0.8922884, 1, 0, 0, 1, 1,
-0.9415504, -0.6590835, -3.191114, 1, 0, 0, 1, 1,
-0.9366233, 0.399604, -2.880915, 1, 0, 0, 1, 1,
-0.9234023, 1.004243, -1.60256, 1, 0, 0, 1, 1,
-0.923149, 0.06105547, -1.968188, 0, 0, 0, 1, 1,
-0.9227087, 2.784677, -0.5451929, 0, 0, 0, 1, 1,
-0.9219084, 0.3375796, -1.533134, 0, 0, 0, 1, 1,
-0.9096377, 0.03660859, -1.285825, 0, 0, 0, 1, 1,
-0.908956, -1.849234, -0.9529003, 0, 0, 0, 1, 1,
-0.9073271, 0.1155609, 0.009520484, 0, 0, 0, 1, 1,
-0.9002914, -0.764722, -1.894975, 0, 0, 0, 1, 1,
-0.8996044, -0.5665915, -2.840761, 1, 1, 1, 1, 1,
-0.8970638, -0.2412582, -1.788024, 1, 1, 1, 1, 1,
-0.8948961, -0.7825269, -2.30139, 1, 1, 1, 1, 1,
-0.8939776, -0.5303238, -0.3080402, 1, 1, 1, 1, 1,
-0.8887284, 0.3137106, -1.944544, 1, 1, 1, 1, 1,
-0.881145, -0.8096821, -2.684216, 1, 1, 1, 1, 1,
-0.8777378, 0.5753363, -1.690636, 1, 1, 1, 1, 1,
-0.8705884, -0.1523184, -3.656045, 1, 1, 1, 1, 1,
-0.8608448, 0.5332758, 0.5883665, 1, 1, 1, 1, 1,
-0.8602791, -0.8133028, -1.403303, 1, 1, 1, 1, 1,
-0.8593661, -0.2917121, -0.6376827, 1, 1, 1, 1, 1,
-0.8583566, -0.8485122, -3.145951, 1, 1, 1, 1, 1,
-0.8546493, 1.776634, -0.5552436, 1, 1, 1, 1, 1,
-0.8517862, -0.5208927, -0.9113725, 1, 1, 1, 1, 1,
-0.8511106, 1.433539, -1.260917, 1, 1, 1, 1, 1,
-0.8507679, 0.5034654, -1.169022, 0, 0, 1, 1, 1,
-0.838579, 0.1029699, -1.095729, 1, 0, 0, 1, 1,
-0.8383219, 0.1071577, -1.400514, 1, 0, 0, 1, 1,
-0.8364846, -0.8293946, -0.5591767, 1, 0, 0, 1, 1,
-0.8345115, 0.9917671, 0.2219061, 1, 0, 0, 1, 1,
-0.8335953, 0.2478754, 0.03607511, 1, 0, 0, 1, 1,
-0.8272038, 0.06746687, -2.649215, 0, 0, 0, 1, 1,
-0.8247365, 0.115892, -0.4341189, 0, 0, 0, 1, 1,
-0.8210869, -1.78075, -3.182459, 0, 0, 0, 1, 1,
-0.8180273, 0.5967553, -0.843967, 0, 0, 0, 1, 1,
-0.8172213, -0.6075125, -3.444582, 0, 0, 0, 1, 1,
-0.8159509, -0.8870658, -1.150304, 0, 0, 0, 1, 1,
-0.8116596, -0.08142948, -0.2799376, 0, 0, 0, 1, 1,
-0.8112977, 1.128257, 0.7457123, 1, 1, 1, 1, 1,
-0.8109672, -1.39967, -3.063378, 1, 1, 1, 1, 1,
-0.805501, -0.673472, -1.855667, 1, 1, 1, 1, 1,
-0.7965829, 1.583767, -1.517967, 1, 1, 1, 1, 1,
-0.7956405, 0.8913267, 1.416807, 1, 1, 1, 1, 1,
-0.7896852, 1.204062, -0.07822271, 1, 1, 1, 1, 1,
-0.789398, -1.38295, -1.076577, 1, 1, 1, 1, 1,
-0.7892797, 0.09928667, -2.22264, 1, 1, 1, 1, 1,
-0.7866442, -0.4172282, -1.898696, 1, 1, 1, 1, 1,
-0.783893, 0.683847, -1.072871, 1, 1, 1, 1, 1,
-0.7837791, 1.645589, -0.8446978, 1, 1, 1, 1, 1,
-0.780951, 0.8868943, -1.316394, 1, 1, 1, 1, 1,
-0.779354, 1.339751, -0.1447118, 1, 1, 1, 1, 1,
-0.7748659, 1.15076, -0.9847839, 1, 1, 1, 1, 1,
-0.7640726, -0.9658809, -2.023378, 1, 1, 1, 1, 1,
-0.7627988, 0.8736398, -2.185479, 0, 0, 1, 1, 1,
-0.7589903, -0.5942745, -3.758805, 1, 0, 0, 1, 1,
-0.7531496, 0.896453, 0.2406486, 1, 0, 0, 1, 1,
-0.750689, 0.3198523, -1.532223, 1, 0, 0, 1, 1,
-0.7477745, 0.1157589, -0.3074957, 1, 0, 0, 1, 1,
-0.7450598, -0.467195, -2.277634, 1, 0, 0, 1, 1,
-0.7396291, 1.174414, -0.6458003, 0, 0, 0, 1, 1,
-0.7376425, -0.2507671, -0.331462, 0, 0, 0, 1, 1,
-0.7365127, -0.7881856, -1.858901, 0, 0, 0, 1, 1,
-0.7299386, 0.128492, -0.1672613, 0, 0, 0, 1, 1,
-0.7293728, 0.1496849, -1.109984, 0, 0, 0, 1, 1,
-0.7280474, 0.04861161, -2.13959, 0, 0, 0, 1, 1,
-0.7161431, 0.3915286, -1.841671, 0, 0, 0, 1, 1,
-0.7156598, 1.074628, -1.051979, 1, 1, 1, 1, 1,
-0.7143935, 1.146352, -0.2891954, 1, 1, 1, 1, 1,
-0.7053807, -1.150215, -1.310962, 1, 1, 1, 1, 1,
-0.7020004, 0.2762475, -1.493545, 1, 1, 1, 1, 1,
-0.6998565, -1.276508, -2.177165, 1, 1, 1, 1, 1,
-0.6988007, -1.77212, -2.136002, 1, 1, 1, 1, 1,
-0.6957963, -1.777574, -3.291184, 1, 1, 1, 1, 1,
-0.6905259, -0.4551816, 0.4791128, 1, 1, 1, 1, 1,
-0.689863, 2.519145, -1.511751, 1, 1, 1, 1, 1,
-0.6892309, -0.634181, -2.939233, 1, 1, 1, 1, 1,
-0.6885589, -0.4944994, -2.475351, 1, 1, 1, 1, 1,
-0.6878695, -0.2961593, -3.45136, 1, 1, 1, 1, 1,
-0.6843972, 0.132781, 0.4976058, 1, 1, 1, 1, 1,
-0.6787207, -2.366037, -0.677669, 1, 1, 1, 1, 1,
-0.6784444, -1.016466, -3.053194, 1, 1, 1, 1, 1,
-0.6771551, 0.05045954, -1.219656, 0, 0, 1, 1, 1,
-0.6766632, -1.480007, -2.320564, 1, 0, 0, 1, 1,
-0.6759301, -0.5150818, -1.951475, 1, 0, 0, 1, 1,
-0.6743111, -0.8596218, -0.8521851, 1, 0, 0, 1, 1,
-0.6700334, 1.547813, 0.01087882, 1, 0, 0, 1, 1,
-0.6666853, -0.9512359, -1.986425, 1, 0, 0, 1, 1,
-0.6662372, -0.5165786, -3.894189, 0, 0, 0, 1, 1,
-0.6653322, 1.080382, 0.1415138, 0, 0, 0, 1, 1,
-0.6622056, 0.682517, 0.5518238, 0, 0, 0, 1, 1,
-0.6591618, 0.09430702, -1.226025, 0, 0, 0, 1, 1,
-0.658839, -0.6792987, -4.088225, 0, 0, 0, 1, 1,
-0.6565471, -0.5025687, -1.706065, 0, 0, 0, 1, 1,
-0.6559204, 0.6430354, 0.3101422, 0, 0, 0, 1, 1,
-0.6478732, -0.2161038, -0.4621423, 1, 1, 1, 1, 1,
-0.6476352, 0.630714, -0.8841587, 1, 1, 1, 1, 1,
-0.6466413, -0.3644413, -2.291182, 1, 1, 1, 1, 1,
-0.6428193, 1.345994, -0.3715613, 1, 1, 1, 1, 1,
-0.6368538, 2.279519, 0.5516847, 1, 1, 1, 1, 1,
-0.6250147, 0.4067189, -1.609498, 1, 1, 1, 1, 1,
-0.6179936, -0.2425762, -2.626788, 1, 1, 1, 1, 1,
-0.6155793, 0.04102973, -1.537169, 1, 1, 1, 1, 1,
-0.6131781, 0.05139719, -2.34339, 1, 1, 1, 1, 1,
-0.6126606, -1.445712, -3.655645, 1, 1, 1, 1, 1,
-0.6110178, 2.209519, -0.07297606, 1, 1, 1, 1, 1,
-0.6081101, 0.8432127, 0.1543283, 1, 1, 1, 1, 1,
-0.6053582, 1.181807, 0.2746588, 1, 1, 1, 1, 1,
-0.6041397, 1.386274, -0.6076207, 1, 1, 1, 1, 1,
-0.5922359, 1.21867, -1.529665, 1, 1, 1, 1, 1,
-0.590136, -0.7893079, -2.042927, 0, 0, 1, 1, 1,
-0.5849258, 1.375484, -0.9966183, 1, 0, 0, 1, 1,
-0.5818966, -0.0822161, -2.697646, 1, 0, 0, 1, 1,
-0.5746955, 2.324649, 1.613905, 1, 0, 0, 1, 1,
-0.5719278, -0.4410273, -4.730167, 1, 0, 0, 1, 1,
-0.568532, -1.744576, -2.699387, 1, 0, 0, 1, 1,
-0.5657955, -0.3999836, -2.109006, 0, 0, 0, 1, 1,
-0.5614501, -0.8779179, -0.377386, 0, 0, 0, 1, 1,
-0.5602475, -1.253153, -2.39975, 0, 0, 0, 1, 1,
-0.5587656, -1.286736, -3.088178, 0, 0, 0, 1, 1,
-0.556547, 1.65112, 0.4404365, 0, 0, 0, 1, 1,
-0.5541884, -0.4100436, -5.036289, 0, 0, 0, 1, 1,
-0.5541818, 0.2022486, -2.95443, 0, 0, 0, 1, 1,
-0.5540275, -0.3817252, -3.006271, 1, 1, 1, 1, 1,
-0.5534355, 0.03071588, -0.6485469, 1, 1, 1, 1, 1,
-0.54467, 1.059175, 0.7002265, 1, 1, 1, 1, 1,
-0.5413598, -1.309025, -3.055405, 1, 1, 1, 1, 1,
-0.540472, -2.083752, -3.996914, 1, 1, 1, 1, 1,
-0.5356309, -1.235838, -0.8816649, 1, 1, 1, 1, 1,
-0.5335814, -0.679915, -3.840395, 1, 1, 1, 1, 1,
-0.5320729, 0.5776904, 1.123077, 1, 1, 1, 1, 1,
-0.5320367, -0.5314708, -2.648342, 1, 1, 1, 1, 1,
-0.530815, -0.1635488, -0.4744978, 1, 1, 1, 1, 1,
-0.530482, 0.05851364, -2.339082, 1, 1, 1, 1, 1,
-0.5296654, 0.4430399, 0.08285246, 1, 1, 1, 1, 1,
-0.5273818, 0.1684086, -0.6277308, 1, 1, 1, 1, 1,
-0.5270593, 0.4978825, -1.91438, 1, 1, 1, 1, 1,
-0.5221376, -1.140625, -3.263307, 1, 1, 1, 1, 1,
-0.518845, 2.579185, 0.7271238, 0, 0, 1, 1, 1,
-0.5163791, 0.6795948, -1.03459, 1, 0, 0, 1, 1,
-0.5157018, -0.725535, -4.00568, 1, 0, 0, 1, 1,
-0.5139568, 0.1054777, -0.8816261, 1, 0, 0, 1, 1,
-0.5128405, -1.629059, -3.873459, 1, 0, 0, 1, 1,
-0.5125585, -1.917514, -1.690945, 1, 0, 0, 1, 1,
-0.5123811, -1.03175, -3.82983, 0, 0, 0, 1, 1,
-0.5075315, -1.240419, -3.276856, 0, 0, 0, 1, 1,
-0.5040861, -2.231116, -1.816946, 0, 0, 0, 1, 1,
-0.5036324, 2.26588, 0.7116767, 0, 0, 0, 1, 1,
-0.5020908, -0.2247395, -2.255351, 0, 0, 0, 1, 1,
-0.5016041, 1.729085, -1.450107, 0, 0, 0, 1, 1,
-0.4994316, 1.121369, -0.5080702, 0, 0, 0, 1, 1,
-0.49462, 1.183912, -1.370484, 1, 1, 1, 1, 1,
-0.4891193, -1.343223, -3.582825, 1, 1, 1, 1, 1,
-0.4839665, -0.146802, -2.242656, 1, 1, 1, 1, 1,
-0.4814814, 0.1931968, -1.865798, 1, 1, 1, 1, 1,
-0.4795868, -1.542101, -4.956437, 1, 1, 1, 1, 1,
-0.477742, -0.9238617, -1.991009, 1, 1, 1, 1, 1,
-0.4766347, -0.7033742, -3.785277, 1, 1, 1, 1, 1,
-0.475379, -0.009647626, -2.224449, 1, 1, 1, 1, 1,
-0.4712659, 0.109191, 0.2569214, 1, 1, 1, 1, 1,
-0.4692129, -0.8051357, -2.719254, 1, 1, 1, 1, 1,
-0.4650079, -0.08857404, -2.199271, 1, 1, 1, 1, 1,
-0.4556228, -0.3116284, -4.137242, 1, 1, 1, 1, 1,
-0.4523734, 1.468623, 0.02281997, 1, 1, 1, 1, 1,
-0.4515557, -1.394062, -1.118701, 1, 1, 1, 1, 1,
-0.4490219, 1.969751, 0.6779248, 1, 1, 1, 1, 1,
-0.4465343, -1.62301, -3.101007, 0, 0, 1, 1, 1,
-0.4434378, -0.4131904, -2.039989, 1, 0, 0, 1, 1,
-0.4393952, -0.1939252, -2.715208, 1, 0, 0, 1, 1,
-0.4338037, -0.5189442, -4.543208, 1, 0, 0, 1, 1,
-0.4327357, 0.1590845, -1.371024, 1, 0, 0, 1, 1,
-0.4266304, -1.538458, -2.714554, 1, 0, 0, 1, 1,
-0.4254636, 1.384467, -2.266057, 0, 0, 0, 1, 1,
-0.4250294, -0.4740913, -2.122177, 0, 0, 0, 1, 1,
-0.4232007, 0.7060208, -1.758279, 0, 0, 0, 1, 1,
-0.4207966, 0.2566208, -1.766695, 0, 0, 0, 1, 1,
-0.4106794, -0.5612737, -3.853013, 0, 0, 0, 1, 1,
-0.4077154, -1.007016, -1.789953, 0, 0, 0, 1, 1,
-0.4059188, -0.9508371, -2.944681, 0, 0, 0, 1, 1,
-0.4059115, -0.1405249, -0.5675582, 1, 1, 1, 1, 1,
-0.4048907, -2.060231, -1.316772, 1, 1, 1, 1, 1,
-0.4029153, -0.1349093, -0.9748859, 1, 1, 1, 1, 1,
-0.3951136, -0.2495693, -2.676422, 1, 1, 1, 1, 1,
-0.3926881, 0.1803801, -1.629474, 1, 1, 1, 1, 1,
-0.3885396, -0.6994328, -3.352578, 1, 1, 1, 1, 1,
-0.3843867, 0.3390353, -1.013795, 1, 1, 1, 1, 1,
-0.3824436, -0.2056148, -1.083557, 1, 1, 1, 1, 1,
-0.3802434, 0.750244, -1.897945, 1, 1, 1, 1, 1,
-0.3799143, -1.714501, -3.562294, 1, 1, 1, 1, 1,
-0.379764, 2.09475, 0.04377725, 1, 1, 1, 1, 1,
-0.3742803, 1.084055, -0.3148984, 1, 1, 1, 1, 1,
-0.3694041, -0.1792555, -1.353789, 1, 1, 1, 1, 1,
-0.3661448, 0.05294187, 0.02633262, 1, 1, 1, 1, 1,
-0.3640303, 0.2485649, -1.080594, 1, 1, 1, 1, 1,
-0.3626247, -1.612382, -2.747883, 0, 0, 1, 1, 1,
-0.3587111, -0.7866262, -3.467752, 1, 0, 0, 1, 1,
-0.3536263, 2.421062, 0.3886379, 1, 0, 0, 1, 1,
-0.3535072, -1.149091, -4.144268, 1, 0, 0, 1, 1,
-0.3533563, 1.886309, -0.6091571, 1, 0, 0, 1, 1,
-0.3416883, -0.07669255, -1.632354, 1, 0, 0, 1, 1,
-0.3416632, -0.8470479, -0.992624, 0, 0, 0, 1, 1,
-0.3394929, 0.01647546, -0.3340844, 0, 0, 0, 1, 1,
-0.337358, 1.013639, -0.7285374, 0, 0, 0, 1, 1,
-0.3304192, 0.2116297, -1.192831, 0, 0, 0, 1, 1,
-0.32968, 0.1236944, -1.781844, 0, 0, 0, 1, 1,
-0.3262795, 1.024023, -0.2465694, 0, 0, 0, 1, 1,
-0.322604, 0.05159329, -1.621318, 0, 0, 0, 1, 1,
-0.3147042, 0.3595698, -2.312897, 1, 1, 1, 1, 1,
-0.3115258, 0.586663, -0.8364751, 1, 1, 1, 1, 1,
-0.3072205, -1.453149, -2.570517, 1, 1, 1, 1, 1,
-0.3071233, 0.05702793, -1.012805, 1, 1, 1, 1, 1,
-0.3042184, 0.447379, -1.883265, 1, 1, 1, 1, 1,
-0.2989279, 0.03555891, -1.088422, 1, 1, 1, 1, 1,
-0.2985854, 2.725534, -0.2067772, 1, 1, 1, 1, 1,
-0.2958497, -0.5414116, -1.731432, 1, 1, 1, 1, 1,
-0.2948315, -0.007498633, -2.078979, 1, 1, 1, 1, 1,
-0.2926269, 1.215846, -0.6164287, 1, 1, 1, 1, 1,
-0.289672, -0.1256032, -1.78882, 1, 1, 1, 1, 1,
-0.2889319, 0.196597, -1.461406, 1, 1, 1, 1, 1,
-0.2867565, 0.4951887, -1.724482, 1, 1, 1, 1, 1,
-0.2775491, -1.342981, -3.372705, 1, 1, 1, 1, 1,
-0.2774934, 0.1911881, -2.160915, 1, 1, 1, 1, 1,
-0.2748147, 1.147219, 0.5868897, 0, 0, 1, 1, 1,
-0.2726176, -1.361327, -4.466636, 1, 0, 0, 1, 1,
-0.2711813, -0.08652356, -2.242314, 1, 0, 0, 1, 1,
-0.268589, -0.2665208, -4.393427, 1, 0, 0, 1, 1,
-0.2682844, -1.403173, -2.861127, 1, 0, 0, 1, 1,
-0.2681572, 1.259445, 0.6416259, 1, 0, 0, 1, 1,
-0.2675575, -0.1106069, -1.549354, 0, 0, 0, 1, 1,
-0.2662703, 1.582958, 1.957857, 0, 0, 0, 1, 1,
-0.2623366, 0.08901645, -1.985179, 0, 0, 0, 1, 1,
-0.2574312, -1.054731, -2.437496, 0, 0, 0, 1, 1,
-0.2560872, -0.3044288, -1.783123, 0, 0, 0, 1, 1,
-0.2494669, -0.1772492, -2.558347, 0, 0, 0, 1, 1,
-0.245842, 1.59061, -0.3860007, 0, 0, 0, 1, 1,
-0.2456832, -0.7096542, -4.499322, 1, 1, 1, 1, 1,
-0.2449469, -0.7196653, -1.396137, 1, 1, 1, 1, 1,
-0.2395109, 0.3425193, -0.8803436, 1, 1, 1, 1, 1,
-0.2393424, 0.5459476, -0.05255568, 1, 1, 1, 1, 1,
-0.238617, 2.0937, -0.7069293, 1, 1, 1, 1, 1,
-0.2266433, -0.306527, -1.898402, 1, 1, 1, 1, 1,
-0.2237124, 0.5939469, -0.8489043, 1, 1, 1, 1, 1,
-0.223274, -0.3165965, -1.8681, 1, 1, 1, 1, 1,
-0.2228518, -0.2522097, -3.281086, 1, 1, 1, 1, 1,
-0.2149898, 2.151686, 0.2176388, 1, 1, 1, 1, 1,
-0.2124864, -1.384367, -2.215147, 1, 1, 1, 1, 1,
-0.2096178, -0.1543329, 0.4088149, 1, 1, 1, 1, 1,
-0.1994153, -1.773683, -3.278743, 1, 1, 1, 1, 1,
-0.1932453, 0.4066976, -2.054001, 1, 1, 1, 1, 1,
-0.1930366, -0.325826, -3.806973, 1, 1, 1, 1, 1,
-0.1907455, 1.426321, -0.2819559, 0, 0, 1, 1, 1,
-0.1869951, -0.4867331, -2.728295, 1, 0, 0, 1, 1,
-0.1818412, -0.5134885, -4.813074, 1, 0, 0, 1, 1,
-0.1784288, -0.5669844, -3.904104, 1, 0, 0, 1, 1,
-0.1752516, -0.3597284, -1.118045, 1, 0, 0, 1, 1,
-0.17288, -0.4816917, -2.3747, 1, 0, 0, 1, 1,
-0.1728468, 0.7151583, -2.65453, 0, 0, 0, 1, 1,
-0.1698034, -1.511948, -1.910661, 0, 0, 0, 1, 1,
-0.1677805, -0.7875794, -4.943414, 0, 0, 0, 1, 1,
-0.1625721, -0.3649704, -3.78772, 0, 0, 0, 1, 1,
-0.1601875, -3.011608, -2.063656, 0, 0, 0, 1, 1,
-0.1599589, -2.064818, -3.509288, 0, 0, 0, 1, 1,
-0.1597593, -0.8025244, -4.174918, 0, 0, 0, 1, 1,
-0.1564295, 0.2681845, -0.8216347, 1, 1, 1, 1, 1,
-0.1550012, -0.06742042, -1.57492, 1, 1, 1, 1, 1,
-0.1514965, 1.098866, 0.3587031, 1, 1, 1, 1, 1,
-0.1506166, 1.954978, -0.5921357, 1, 1, 1, 1, 1,
-0.1438186, -0.2272089, -2.611091, 1, 1, 1, 1, 1,
-0.1427483, -1.547529, -2.336542, 1, 1, 1, 1, 1,
-0.1357756, 1.207285, 0.2840646, 1, 1, 1, 1, 1,
-0.1268851, -0.3764288, -2.768273, 1, 1, 1, 1, 1,
-0.1212209, -1.17159, -2.141, 1, 1, 1, 1, 1,
-0.118265, -0.9564641, -3.107812, 1, 1, 1, 1, 1,
-0.1180302, -1.503739, -2.820702, 1, 1, 1, 1, 1,
-0.1120766, -0.8874642, -1.638841, 1, 1, 1, 1, 1,
-0.1073314, 0.1995511, -0.822502, 1, 1, 1, 1, 1,
-0.1057035, 1.399524, -0.9085149, 1, 1, 1, 1, 1,
-0.09991215, -1.648254, -3.115998, 1, 1, 1, 1, 1,
-0.09889487, 1.38309, -1.829412, 0, 0, 1, 1, 1,
-0.09738561, 0.2088837, -0.7899978, 1, 0, 0, 1, 1,
-0.09723098, -0.1421575, -1.558329, 1, 0, 0, 1, 1,
-0.09690163, 0.5952984, 0.3391859, 1, 0, 0, 1, 1,
-0.09299327, 0.791293, 0.4232335, 1, 0, 0, 1, 1,
-0.09211824, -0.5060569, -3.425327, 1, 0, 0, 1, 1,
-0.08894593, 0.007847648, -1.846474, 0, 0, 0, 1, 1,
-0.07624935, -0.8674542, -4.447953, 0, 0, 0, 1, 1,
-0.07497015, -0.6930436, -3.924394, 0, 0, 0, 1, 1,
-0.07260252, 0.7128666, 1.576535, 0, 0, 0, 1, 1,
-0.07181984, -0.6966458, -2.418093, 0, 0, 0, 1, 1,
-0.06981952, -0.8349546, -3.091672, 0, 0, 0, 1, 1,
-0.06835304, 3.010859, -0.5419966, 0, 0, 0, 1, 1,
-0.06742225, -1.614255, -3.502494, 1, 1, 1, 1, 1,
-0.06611897, 0.3892146, -1.582464, 1, 1, 1, 1, 1,
-0.06599991, 0.03528623, -1.938265, 1, 1, 1, 1, 1,
-0.06362516, -1.929271, -4.056662, 1, 1, 1, 1, 1,
-0.05948943, -1.758494, -2.703544, 1, 1, 1, 1, 1,
-0.05897209, -1.569629, -2.334907, 1, 1, 1, 1, 1,
-0.05391701, 1.487091, 1.202368, 1, 1, 1, 1, 1,
-0.05288365, -1.266678, -4.706043, 1, 1, 1, 1, 1,
-0.05245893, -0.4435482, -1.842883, 1, 1, 1, 1, 1,
-0.04300636, 0.2158261, -0.08697533, 1, 1, 1, 1, 1,
-0.04063138, -0.2387323, -4.296194, 1, 1, 1, 1, 1,
-0.0398059, -1.073059, -3.153304, 1, 1, 1, 1, 1,
-0.03725712, -1.789503, -2.943815, 1, 1, 1, 1, 1,
-0.03364022, 0.07856998, -0.193554, 1, 1, 1, 1, 1,
-0.03326251, 0.9912418, -0.05028267, 1, 1, 1, 1, 1,
-0.03245693, 0.5844522, 2.577784, 0, 0, 1, 1, 1,
-0.03185987, 1.014118, -0.8666595, 1, 0, 0, 1, 1,
-0.03011351, -0.9697735, -2.999784, 1, 0, 0, 1, 1,
-0.0275549, 2.440528, 0.09180048, 1, 0, 0, 1, 1,
-0.02534005, 0.5998211, -0.4274148, 1, 0, 0, 1, 1,
-0.02360038, 0.7059118, -1.51625, 1, 0, 0, 1, 1,
-0.02252288, 1.160426, 0.3285247, 0, 0, 0, 1, 1,
-0.01867712, 0.8085115, 0.2876403, 0, 0, 0, 1, 1,
-0.01738006, 1.758748, -0.3631092, 0, 0, 0, 1, 1,
-0.01535112, -1.762711, -2.932148, 0, 0, 0, 1, 1,
-0.004822751, -1.030938, -3.82526, 0, 0, 0, 1, 1,
-0.004488337, -1.858343, -2.660727, 0, 0, 0, 1, 1,
-0.003833249, 0.119122, -1.350283, 0, 0, 0, 1, 1,
-0.001275869, 1.553776, 0.08683955, 1, 1, 1, 1, 1,
-0.0004035063, 1.143946, -1.226859, 1, 1, 1, 1, 1,
0.0001655575, -0.2084999, 3.510311, 1, 1, 1, 1, 1,
0.0008818163, 1.061695, 0.009191241, 1, 1, 1, 1, 1,
0.009037232, 0.945012, 1.015379, 1, 1, 1, 1, 1,
0.009718367, -1.206174, 0.7538541, 1, 1, 1, 1, 1,
0.01077211, 0.1605929, 0.007068519, 1, 1, 1, 1, 1,
0.01678672, -0.7355506, 2.197719, 1, 1, 1, 1, 1,
0.01699932, -0.5564025, 2.858711, 1, 1, 1, 1, 1,
0.02420053, -0.8419321, 1.455959, 1, 1, 1, 1, 1,
0.02873972, 0.8044878, -0.6678388, 1, 1, 1, 1, 1,
0.02887053, 0.1479628, -0.4329534, 1, 1, 1, 1, 1,
0.03014111, -1.172027, 2.154545, 1, 1, 1, 1, 1,
0.03530863, -0.7839008, 3.480939, 1, 1, 1, 1, 1,
0.03577456, -0.3692679, 3.292774, 1, 1, 1, 1, 1,
0.04252353, 1.042413, -1.836262, 0, 0, 1, 1, 1,
0.04330708, -0.05349982, 2.586264, 1, 0, 0, 1, 1,
0.04544322, -0.7345391, 1.664768, 1, 0, 0, 1, 1,
0.05047157, -0.8805902, 3.244143, 1, 0, 0, 1, 1,
0.05236139, 0.254293, 0.1530128, 1, 0, 0, 1, 1,
0.06122978, -0.08256464, 0.1206471, 1, 0, 0, 1, 1,
0.06444614, 0.09755344, -0.3007778, 0, 0, 0, 1, 1,
0.06591666, 0.5080593, -0.1835653, 0, 0, 0, 1, 1,
0.07021575, -1.314499, 4.537354, 0, 0, 0, 1, 1,
0.07057597, -1.369598, 2.085472, 0, 0, 0, 1, 1,
0.07916763, 0.07219657, 1.207883, 0, 0, 0, 1, 1,
0.08435734, -0.4143798, 2.419528, 0, 0, 0, 1, 1,
0.08436447, -0.5153875, 2.32343, 0, 0, 0, 1, 1,
0.0869581, -0.5029396, 3.213398, 1, 1, 1, 1, 1,
0.08740442, 0.5639668, 0.4143881, 1, 1, 1, 1, 1,
0.09817482, -0.7221773, 3.17089, 1, 1, 1, 1, 1,
0.09870674, 2.128702, 1.241307, 1, 1, 1, 1, 1,
0.1020827, 1.365641, -0.175581, 1, 1, 1, 1, 1,
0.112609, 2.808939, 0.1533541, 1, 1, 1, 1, 1,
0.1154232, 0.5690672, -0.8084775, 1, 1, 1, 1, 1,
0.1176547, -1.309751, 3.730203, 1, 1, 1, 1, 1,
0.1201784, 0.8873122, -0.01365995, 1, 1, 1, 1, 1,
0.1202721, 0.4504329, 0.07576686, 1, 1, 1, 1, 1,
0.1214407, -0.3325061, 2.183185, 1, 1, 1, 1, 1,
0.1244076, 0.7077051, -0.7489627, 1, 1, 1, 1, 1,
0.1285271, 1.725632, -0.9737163, 1, 1, 1, 1, 1,
0.1286391, -0.5964695, 1.629766, 1, 1, 1, 1, 1,
0.1299366, -1.09435, 3.005254, 1, 1, 1, 1, 1,
0.1303847, 0.362004, 0.8821642, 0, 0, 1, 1, 1,
0.1304625, 0.07492714, 0.7484046, 1, 0, 0, 1, 1,
0.1305122, 1.149755, -0.9342538, 1, 0, 0, 1, 1,
0.1325473, 0.4127652, 0.7366075, 1, 0, 0, 1, 1,
0.1333077, -1.658033, 3.001707, 1, 0, 0, 1, 1,
0.1337724, 0.1217471, -0.8555156, 1, 0, 0, 1, 1,
0.1340444, -1.347069, 5.370912, 0, 0, 0, 1, 1,
0.1424493, 0.732226, -0.06050973, 0, 0, 0, 1, 1,
0.142569, 1.093938, -0.2232015, 0, 0, 0, 1, 1,
0.1449039, 0.9981925, 0.8940887, 0, 0, 0, 1, 1,
0.1462711, -0.4542452, 3.965908, 0, 0, 0, 1, 1,
0.1554357, -2.470062, 1.682493, 0, 0, 0, 1, 1,
0.1571066, -0.6305495, 2.851834, 0, 0, 0, 1, 1,
0.1581874, 0.3261095, 0.5709148, 1, 1, 1, 1, 1,
0.1594166, 0.063877, 2.113745, 1, 1, 1, 1, 1,
0.1594748, 0.05745785, 2.104733, 1, 1, 1, 1, 1,
0.1595, -0.3636729, 3.239668, 1, 1, 1, 1, 1,
0.1599913, -0.8740089, 3.739599, 1, 1, 1, 1, 1,
0.163325, -0.6933602, 2.772473, 1, 1, 1, 1, 1,
0.1668169, -0.7994777, 2.294099, 1, 1, 1, 1, 1,
0.1766403, -0.3855961, 2.494395, 1, 1, 1, 1, 1,
0.178596, 0.634877, 0.6270087, 1, 1, 1, 1, 1,
0.1787237, -0.0787594, 1.266616, 1, 1, 1, 1, 1,
0.1835794, -0.3823325, 2.042001, 1, 1, 1, 1, 1,
0.1876717, -2.534212, 3.938998, 1, 1, 1, 1, 1,
0.190875, 0.0320087, 2.72444, 1, 1, 1, 1, 1,
0.198801, -2.272056, 2.925683, 1, 1, 1, 1, 1,
0.1996639, -1.119966, 5.246387, 1, 1, 1, 1, 1,
0.1999733, -1.988284, 3.796669, 0, 0, 1, 1, 1,
0.2011564, -0.231775, 3.735389, 1, 0, 0, 1, 1,
0.2014507, 0.7690807, 0.9884263, 1, 0, 0, 1, 1,
0.2057971, 1.62313, -0.494709, 1, 0, 0, 1, 1,
0.2067689, 0.5078343, -0.3651394, 1, 0, 0, 1, 1,
0.2074654, 1.317159, -0.2911182, 1, 0, 0, 1, 1,
0.2091453, -0.1178226, 2.755885, 0, 0, 0, 1, 1,
0.2098091, 0.03740392, 1.527823, 0, 0, 0, 1, 1,
0.2108818, -1.667261, 3.530155, 0, 0, 0, 1, 1,
0.2135177, 0.3944791, -0.3480963, 0, 0, 0, 1, 1,
0.2166183, 1.615951, -1.39123, 0, 0, 0, 1, 1,
0.2215265, -0.700728, 3.817416, 0, 0, 0, 1, 1,
0.2223287, -0.2506894, 1.807561, 0, 0, 0, 1, 1,
0.2226212, 1.512157, -1.127161, 1, 1, 1, 1, 1,
0.2265281, 0.7896839, -0.09023841, 1, 1, 1, 1, 1,
0.2282025, -0.8736382, 2.857518, 1, 1, 1, 1, 1,
0.2365227, -1.63912, 2.69768, 1, 1, 1, 1, 1,
0.2392296, -0.01002981, 3.294389, 1, 1, 1, 1, 1,
0.2424087, -0.1465627, 0.8577582, 1, 1, 1, 1, 1,
0.2473881, -0.3152689, 2.450082, 1, 1, 1, 1, 1,
0.2502715, 0.106418, 0.9754195, 1, 1, 1, 1, 1,
0.2504984, 0.09878175, 1.479234, 1, 1, 1, 1, 1,
0.251312, 1.208548, 0.09782392, 1, 1, 1, 1, 1,
0.2553396, -0.9336047, 2.63866, 1, 1, 1, 1, 1,
0.2562256, -0.1654418, 1.450388, 1, 1, 1, 1, 1,
0.2579979, 0.2082079, 2.237345, 1, 1, 1, 1, 1,
0.2588639, -0.2151563, 0.9024639, 1, 1, 1, 1, 1,
0.2597172, 1.34164, 0.9375289, 1, 1, 1, 1, 1,
0.2657397, -0.04839841, 1.614785, 0, 0, 1, 1, 1,
0.2676316, 0.05074042, 2.226944, 1, 0, 0, 1, 1,
0.2707132, -1.74046, 2.741175, 1, 0, 0, 1, 1,
0.2773245, -1.407586, 3.546816, 1, 0, 0, 1, 1,
0.2776063, -1.135794, 3.099575, 1, 0, 0, 1, 1,
0.2848045, -0.7995628, 2.498571, 1, 0, 0, 1, 1,
0.2865514, 1.287253, 0.4023322, 0, 0, 0, 1, 1,
0.2879347, -1.374919, 2.483797, 0, 0, 0, 1, 1,
0.2900632, 1.041034, -0.6599616, 0, 0, 0, 1, 1,
0.2903238, -0.4438144, 2.469411, 0, 0, 0, 1, 1,
0.2947466, -0.3453194, 3.476157, 0, 0, 0, 1, 1,
0.3009641, -0.4713345, 0.858727, 0, 0, 0, 1, 1,
0.3013721, -0.8447552, 4.206818, 0, 0, 0, 1, 1,
0.3014002, -0.3713937, 3.109747, 1, 1, 1, 1, 1,
0.3054612, 0.7269361, -0.6877063, 1, 1, 1, 1, 1,
0.3085532, -0.002848188, 2.415729, 1, 1, 1, 1, 1,
0.3093975, 0.6090573, -0.2346849, 1, 1, 1, 1, 1,
0.3095116, 0.7282448, 1.389247, 1, 1, 1, 1, 1,
0.3098702, -0.6680924, 2.309781, 1, 1, 1, 1, 1,
0.3117225, 1.109651, -1.569317, 1, 1, 1, 1, 1,
0.3189582, -1.362208, 1.146298, 1, 1, 1, 1, 1,
0.3208699, -1.005887, 2.335967, 1, 1, 1, 1, 1,
0.3266548, 1.010517, 0.9048926, 1, 1, 1, 1, 1,
0.3305629, 0.01412357, 2.239856, 1, 1, 1, 1, 1,
0.3341111, -0.8776132, 2.248277, 1, 1, 1, 1, 1,
0.3345593, -0.6882192, 2.189605, 1, 1, 1, 1, 1,
0.3407094, -0.5349062, 1.041422, 1, 1, 1, 1, 1,
0.3417721, 1.125208, -0.8250092, 1, 1, 1, 1, 1,
0.3419151, -0.8926284, 2.481166, 0, 0, 1, 1, 1,
0.342169, 0.7861769, 0.8259091, 1, 0, 0, 1, 1,
0.3465234, 0.04921259, 1.58028, 1, 0, 0, 1, 1,
0.3497459, -0.2204991, 2.03207, 1, 0, 0, 1, 1,
0.3576958, -0.0391372, 2.313164, 1, 0, 0, 1, 1,
0.3595923, 0.2569865, 2.929497, 1, 0, 0, 1, 1,
0.3611114, 0.8017133, -0.944689, 0, 0, 0, 1, 1,
0.3625165, -0.8486899, 3.479648, 0, 0, 0, 1, 1,
0.3637603, 1.386435, -1.175284, 0, 0, 0, 1, 1,
0.3675187, -0.9018199, 2.606705, 0, 0, 0, 1, 1,
0.3710625, -1.268137, 3.426295, 0, 0, 0, 1, 1,
0.373793, 1.310261, 0.9056797, 0, 0, 0, 1, 1,
0.3828575, 1.880987, -0.5132827, 0, 0, 0, 1, 1,
0.3856852, 0.1343435, 0.9701422, 1, 1, 1, 1, 1,
0.3873078, -1.237031, 1.962093, 1, 1, 1, 1, 1,
0.3876266, 1.788325, -0.4500956, 1, 1, 1, 1, 1,
0.3884909, 0.3521955, 0.8166973, 1, 1, 1, 1, 1,
0.3921504, 1.205829, -0.2148216, 1, 1, 1, 1, 1,
0.398249, 0.218464, -0.06051475, 1, 1, 1, 1, 1,
0.4002597, -0.6248512, 1.749112, 1, 1, 1, 1, 1,
0.4044216, 0.3630465, 0.8811461, 1, 1, 1, 1, 1,
0.4045029, 1.118377, 2.606857, 1, 1, 1, 1, 1,
0.405489, -0.8069823, 3.949683, 1, 1, 1, 1, 1,
0.4115313, 0.9146016, -0.1020078, 1, 1, 1, 1, 1,
0.4207365, -0.2671279, 2.530828, 1, 1, 1, 1, 1,
0.4287325, -1.709741, 3.599242, 1, 1, 1, 1, 1,
0.4317112, 0.2534756, 3.230053, 1, 1, 1, 1, 1,
0.4343507, -0.6754483, 2.16482, 1, 1, 1, 1, 1,
0.4356138, 1.158688, -0.2887679, 0, 0, 1, 1, 1,
0.4410534, -1.707666, 2.305061, 1, 0, 0, 1, 1,
0.4418556, 0.6041157, 0.392027, 1, 0, 0, 1, 1,
0.4479225, -1.222049, 3.251459, 1, 0, 0, 1, 1,
0.4513611, 1.440117, -0.3677306, 1, 0, 0, 1, 1,
0.4519274, -0.3472924, 3.543559, 1, 0, 0, 1, 1,
0.4526206, 0.512935, 0.9042404, 0, 0, 0, 1, 1,
0.4555058, 1.034166, 0.5289968, 0, 0, 0, 1, 1,
0.4595103, -0.04150116, 2.058345, 0, 0, 0, 1, 1,
0.4647749, 0.3402338, -0.3326048, 0, 0, 0, 1, 1,
0.4666502, 0.6069657, 0.5104888, 0, 0, 0, 1, 1,
0.4674167, -0.7851934, 2.371587, 0, 0, 0, 1, 1,
0.4693531, -0.7272754, 2.121521, 0, 0, 0, 1, 1,
0.4726334, -1.031574, 2.270939, 1, 1, 1, 1, 1,
0.4764575, 0.6005247, 0.5826816, 1, 1, 1, 1, 1,
0.4833137, -1.118484, 3.207313, 1, 1, 1, 1, 1,
0.4833443, -0.2849314, 1.809776, 1, 1, 1, 1, 1,
0.4838186, 1.18513, 0.5626652, 1, 1, 1, 1, 1,
0.485254, -1.222973, 3.735662, 1, 1, 1, 1, 1,
0.4866085, -0.5186653, 2.319679, 1, 1, 1, 1, 1,
0.4877815, -0.6052972, 2.206969, 1, 1, 1, 1, 1,
0.4891015, 1.839857, -0.8114066, 1, 1, 1, 1, 1,
0.4968834, 0.3097426, 2.739071, 1, 1, 1, 1, 1,
0.4974859, -0.1139312, 1.937307, 1, 1, 1, 1, 1,
0.50225, 0.6157188, 1.070988, 1, 1, 1, 1, 1,
0.5035212, -0.3673388, 2.685956, 1, 1, 1, 1, 1,
0.5050156, 0.9490932, 0.06188001, 1, 1, 1, 1, 1,
0.5075793, -0.3818739, 1.589478, 1, 1, 1, 1, 1,
0.516527, -2.007448, 4.537635, 0, 0, 1, 1, 1,
0.5208061, 0.2451712, 2.099377, 1, 0, 0, 1, 1,
0.5217636, 1.413682, 1.378154, 1, 0, 0, 1, 1,
0.5221578, -0.3658018, 0.8115414, 1, 0, 0, 1, 1,
0.5244781, 1.023316, 0.1614297, 1, 0, 0, 1, 1,
0.526923, 1.770216, -0.3786457, 1, 0, 0, 1, 1,
0.5270056, -1.370945, 3.493828, 0, 0, 0, 1, 1,
0.5282381, -0.9671081, 3.040756, 0, 0, 0, 1, 1,
0.5304089, -0.527424, 2.386337, 0, 0, 0, 1, 1,
0.5316954, 0.8086998, 0.234381, 0, 0, 0, 1, 1,
0.5359342, 0.5399047, 0.7122647, 0, 0, 0, 1, 1,
0.5366961, 0.9282118, -0.7533818, 0, 0, 0, 1, 1,
0.5410917, 0.5082336, -0.3841923, 0, 0, 0, 1, 1,
0.5432706, -0.01085912, 1.759738, 1, 1, 1, 1, 1,
0.5465848, 1.167648, 1.3357, 1, 1, 1, 1, 1,
0.5504496, -0.2765377, 2.283136, 1, 1, 1, 1, 1,
0.5508692, 0.6426823, -0.09754675, 1, 1, 1, 1, 1,
0.5549942, 0.4267696, -0.08444223, 1, 1, 1, 1, 1,
0.5573558, 0.8352344, 1.457068, 1, 1, 1, 1, 1,
0.5597132, 1.361123, 0.1495466, 1, 1, 1, 1, 1,
0.5667201, 0.1372115, -0.03594054, 1, 1, 1, 1, 1,
0.5667881, -0.2243649, 3.055845, 1, 1, 1, 1, 1,
0.5682094, 0.4930657, 0.7166181, 1, 1, 1, 1, 1,
0.5749521, 0.4663126, -0.6679021, 1, 1, 1, 1, 1,
0.5771635, 0.5263455, 0.8634195, 1, 1, 1, 1, 1,
0.5778285, 1.410997, -0.4485364, 1, 1, 1, 1, 1,
0.5813345, 0.3275537, 0.8597301, 1, 1, 1, 1, 1,
0.5817931, -0.5559418, 3.467158, 1, 1, 1, 1, 1,
0.5865664, 0.06342977, 1.913708, 0, 0, 1, 1, 1,
0.5876131, -0.2138787, 3.014742, 1, 0, 0, 1, 1,
0.593075, -0.2187978, 2.891832, 1, 0, 0, 1, 1,
0.5931706, 0.7775846, 2.309023, 1, 0, 0, 1, 1,
0.6032771, 0.9079689, 0.5917597, 1, 0, 0, 1, 1,
0.6044961, -1.040402, 2.203083, 1, 0, 0, 1, 1,
0.6099502, 0.2116099, 0.8742132, 0, 0, 0, 1, 1,
0.6126812, 0.3571001, 1.326231, 0, 0, 0, 1, 1,
0.6127304, 0.5448925, -1.245513, 0, 0, 0, 1, 1,
0.6199925, -2.826103, 3.010766, 0, 0, 0, 1, 1,
0.6343083, 0.9070787, -0.5817525, 0, 0, 0, 1, 1,
0.6378197, -2.287056, 3.661549, 0, 0, 0, 1, 1,
0.6385302, -0.787086, 2.818112, 0, 0, 0, 1, 1,
0.6386972, -0.1394684, 1.959873, 1, 1, 1, 1, 1,
0.6424768, -0.2445332, 2.711835, 1, 1, 1, 1, 1,
0.6436363, -1.332129, 2.553396, 1, 1, 1, 1, 1,
0.6481074, 0.4058149, 0.6428537, 1, 1, 1, 1, 1,
0.6489972, 0.8723376, 0.1502648, 1, 1, 1, 1, 1,
0.6556762, 0.3417428, 1.071551, 1, 1, 1, 1, 1,
0.6601148, 0.4900783, 1.124235, 1, 1, 1, 1, 1,
0.6602499, 0.5528589, 1.425472, 1, 1, 1, 1, 1,
0.6664656, -0.488899, 1.491361, 1, 1, 1, 1, 1,
0.6673663, -1.46826, 4.017891, 1, 1, 1, 1, 1,
0.6684537, -0.3961241, 2.507931, 1, 1, 1, 1, 1,
0.6700872, 0.09061824, 1.054015, 1, 1, 1, 1, 1,
0.6709846, 0.6448009, 0.7962645, 1, 1, 1, 1, 1,
0.6712327, 0.1528701, 2.226079, 1, 1, 1, 1, 1,
0.6713248, -0.3466108, 2.651745, 1, 1, 1, 1, 1,
0.6741887, -1.560176, 2.035379, 0, 0, 1, 1, 1,
0.6743959, 0.3593082, 1.53669, 1, 0, 0, 1, 1,
0.676232, -0.3010901, 2.353819, 1, 0, 0, 1, 1,
0.6831138, 0.3515099, 1.162107, 1, 0, 0, 1, 1,
0.6832751, 2.483324, 2.382613, 1, 0, 0, 1, 1,
0.6863959, -0.5052812, 3.236055, 1, 0, 0, 1, 1,
0.6926773, -1.683123, 0.5625767, 0, 0, 0, 1, 1,
0.6992661, -0.6676707, 2.398864, 0, 0, 0, 1, 1,
0.7048246, 0.5990731, 0.9760904, 0, 0, 0, 1, 1,
0.7077085, 0.2076441, 0.4683333, 0, 0, 0, 1, 1,
0.7078466, -0.1403615, 0.3291039, 0, 0, 0, 1, 1,
0.7151642, -2.51054, 3.148265, 0, 0, 0, 1, 1,
0.7167604, -0.01265022, 2.952848, 0, 0, 0, 1, 1,
0.7209371, -0.2333036, 1.527962, 1, 1, 1, 1, 1,
0.7217232, 1.135235, 0.5480836, 1, 1, 1, 1, 1,
0.7230725, -0.9791929, 2.146258, 1, 1, 1, 1, 1,
0.7245943, -0.9166078, 4.874659, 1, 1, 1, 1, 1,
0.7250931, 1.392007, 0.3112328, 1, 1, 1, 1, 1,
0.729543, -0.8563736, 1.49897, 1, 1, 1, 1, 1,
0.7325455, 1.932193, 0.6585873, 1, 1, 1, 1, 1,
0.732721, -0.4403384, 1.17937, 1, 1, 1, 1, 1,
0.7336361, -0.5985753, 1.789542, 1, 1, 1, 1, 1,
0.7362312, -0.4668229, 1.288646, 1, 1, 1, 1, 1,
0.7381124, 1.085876, -1.174294, 1, 1, 1, 1, 1,
0.7385833, -0.2688287, 1.581768, 1, 1, 1, 1, 1,
0.7412678, -1.112775, 3.528722, 1, 1, 1, 1, 1,
0.742303, -0.5098244, 3.724868, 1, 1, 1, 1, 1,
0.7438325, -0.8775534, 2.416355, 1, 1, 1, 1, 1,
0.745348, -1.323793, 3.335372, 0, 0, 1, 1, 1,
0.7465734, 0.7632626, 2.34847, 1, 0, 0, 1, 1,
0.7545648, -0.4853301, 3.55837, 1, 0, 0, 1, 1,
0.7572958, -1.72189, 2.952397, 1, 0, 0, 1, 1,
0.7609059, 1.360043, 0.5908153, 1, 0, 0, 1, 1,
0.7617857, -1.096479, -0.03138874, 1, 0, 0, 1, 1,
0.76724, -0.4199146, 0.02577534, 0, 0, 0, 1, 1,
0.7720633, -0.4770038, 2.877995, 0, 0, 0, 1, 1,
0.7796334, -0.5393424, 3.931903, 0, 0, 0, 1, 1,
0.781417, -0.4228607, 1.793523, 0, 0, 0, 1, 1,
0.788766, 0.7799698, -1.605707, 0, 0, 0, 1, 1,
0.7891641, -0.5642612, 3.656275, 0, 0, 0, 1, 1,
0.7961069, 0.4649354, 0.2911003, 0, 0, 0, 1, 1,
0.7997875, -1.931063, 1.995987, 1, 1, 1, 1, 1,
0.8017368, -0.4577034, 1.541573, 1, 1, 1, 1, 1,
0.8024313, -1.396218, 2.712799, 1, 1, 1, 1, 1,
0.8050049, -2.014926, 1.549044, 1, 1, 1, 1, 1,
0.8096208, 2.08314, -0.3786044, 1, 1, 1, 1, 1,
0.8100395, -0.5453587, 1.273194, 1, 1, 1, 1, 1,
0.8112963, -0.3483994, 3.246349, 1, 1, 1, 1, 1,
0.8147314, -0.3688391, 1.740995, 1, 1, 1, 1, 1,
0.8155226, -2.027281, 4.183599, 1, 1, 1, 1, 1,
0.82386, 0.4806069, -0.8049722, 1, 1, 1, 1, 1,
0.8239083, 1.13328, 0.432527, 1, 1, 1, 1, 1,
0.8299164, 0.9190048, -0.3139114, 1, 1, 1, 1, 1,
0.837346, -1.761169, 2.754258, 1, 1, 1, 1, 1,
0.8449115, -1.418306, 0.7959521, 1, 1, 1, 1, 1,
0.847609, -0.02612753, 1.717067, 1, 1, 1, 1, 1,
0.8516836, -0.01407851, 2.330743, 0, 0, 1, 1, 1,
0.8525822, -0.3286688, 2.20926, 1, 0, 0, 1, 1,
0.8535904, -0.3228458, 1.784584, 1, 0, 0, 1, 1,
0.8553564, 1.203632, 0.5779287, 1, 0, 0, 1, 1,
0.8568001, 0.007121887, 1.933441, 1, 0, 0, 1, 1,
0.8583656, 1.111632, 2.173278, 1, 0, 0, 1, 1,
0.8630577, -0.1797316, 0.1574471, 0, 0, 0, 1, 1,
0.8641677, 1.011653, 0.1798459, 0, 0, 0, 1, 1,
0.8653435, 2.15278, -0.7090728, 0, 0, 0, 1, 1,
0.8656886, -0.3122667, 2.158763, 0, 0, 0, 1, 1,
0.8665888, -0.7898718, 3.498766, 0, 0, 0, 1, 1,
0.8667679, -0.5037332, 2.83514, 0, 0, 0, 1, 1,
0.8689641, 1.619669, 0.8132131, 0, 0, 0, 1, 1,
0.8693562, 1.103237, 0.05521009, 1, 1, 1, 1, 1,
0.8761585, -1.279137, 3.16136, 1, 1, 1, 1, 1,
0.8764682, -2.156122, 3.035508, 1, 1, 1, 1, 1,
0.8779309, 0.2527146, 1.261917, 1, 1, 1, 1, 1,
0.8828897, -0.7863604, 2.609818, 1, 1, 1, 1, 1,
0.8911363, 1.911672, -0.8661882, 1, 1, 1, 1, 1,
0.8924959, 0.3033983, 0.1520678, 1, 1, 1, 1, 1,
0.8946177, -0.8873582, 3.571067, 1, 1, 1, 1, 1,
0.8961457, 0.438081, 1.668606, 1, 1, 1, 1, 1,
0.896193, 0.08763863, 2.652554, 1, 1, 1, 1, 1,
0.8970687, -1.265767, 1.531009, 1, 1, 1, 1, 1,
0.899142, -0.9091588, 2.756143, 1, 1, 1, 1, 1,
0.9008946, -1.04432, 2.520543, 1, 1, 1, 1, 1,
0.9091864, 0.8227283, -0.7563829, 1, 1, 1, 1, 1,
0.9129676, -0.8045297, 3.463533, 1, 1, 1, 1, 1,
0.9190626, 0.08695056, 2.373027, 0, 0, 1, 1, 1,
0.9201066, 0.1403939, -0.01500206, 1, 0, 0, 1, 1,
0.9220865, 0.1980101, 0.09116779, 1, 0, 0, 1, 1,
0.9235075, -0.8402665, 3.553737, 1, 0, 0, 1, 1,
0.9324672, 0.3427067, -0.9708527, 1, 0, 0, 1, 1,
0.93506, 1.274044, 0.7508165, 1, 0, 0, 1, 1,
0.9354982, -0.492255, 0.8406948, 0, 0, 0, 1, 1,
0.9477254, 0.8305568, 0.7723917, 0, 0, 0, 1, 1,
0.9486405, -1.512985, 1.659054, 0, 0, 0, 1, 1,
0.9507205, 0.6829015, 1.002777, 0, 0, 0, 1, 1,
0.9661918, 2.626301, -0.04123918, 0, 0, 0, 1, 1,
0.966504, 0.7505436, 1.080474, 0, 0, 0, 1, 1,
0.9675595, 1.578255, -0.6792144, 0, 0, 0, 1, 1,
0.9688756, -0.2715976, 1.349041, 1, 1, 1, 1, 1,
0.9765535, 1.079862, 0.4445595, 1, 1, 1, 1, 1,
0.9826739, 1.264422, -1.035241, 1, 1, 1, 1, 1,
0.9953144, -0.6556553, 1.512498, 1, 1, 1, 1, 1,
0.9959256, -1.360931, 0.6840679, 1, 1, 1, 1, 1,
1.00498, -0.3781415, 0.696242, 1, 1, 1, 1, 1,
1.008721, 0.6606446, 1.625006, 1, 1, 1, 1, 1,
1.011945, 1.365489, -0.5094464, 1, 1, 1, 1, 1,
1.014483, 0.8126273, 1.626896, 1, 1, 1, 1, 1,
1.01571, 0.5304797, -0.5658849, 1, 1, 1, 1, 1,
1.017917, 0.5699573, 0.7418806, 1, 1, 1, 1, 1,
1.020475, 0.1754132, 2.162907, 1, 1, 1, 1, 1,
1.022554, -0.4679677, 2.287405, 1, 1, 1, 1, 1,
1.024719, 0.5953149, 3.742852, 1, 1, 1, 1, 1,
1.034399, -0.2976189, 0.5923564, 1, 1, 1, 1, 1,
1.040272, 0.5440395, 1.71989, 0, 0, 1, 1, 1,
1.04968, -0.4043126, 2.602347, 1, 0, 0, 1, 1,
1.049759, 0.0259722, 0.9295147, 1, 0, 0, 1, 1,
1.06084, -0.3501415, 2.205683, 1, 0, 0, 1, 1,
1.061104, 0.1220801, 1.770273, 1, 0, 0, 1, 1,
1.064579, 0.6477683, 1.582014, 1, 0, 0, 1, 1,
1.072594, 0.3798898, 1.708624, 0, 0, 0, 1, 1,
1.075933, 1.518848, 0.4924649, 0, 0, 0, 1, 1,
1.077681, -0.213755, 3.032852, 0, 0, 0, 1, 1,
1.089611, -0.5426751, 2.436318, 0, 0, 0, 1, 1,
1.092718, 0.2164434, 0.2616048, 0, 0, 0, 1, 1,
1.10228, -0.2128339, 1.807857, 0, 0, 0, 1, 1,
1.109934, -1.29036, 4.54605, 0, 0, 0, 1, 1,
1.123277, 1.51181, -0.4152544, 1, 1, 1, 1, 1,
1.128317, 0.4795597, -0.02816469, 1, 1, 1, 1, 1,
1.131535, 1.373582, 0.04476411, 1, 1, 1, 1, 1,
1.141115, 0.2387456, 1.623107, 1, 1, 1, 1, 1,
1.14249, -0.544515, 2.796696, 1, 1, 1, 1, 1,
1.142742, -0.7127407, 2.05694, 1, 1, 1, 1, 1,
1.158028, -0.777749, 2.357448, 1, 1, 1, 1, 1,
1.158518, 0.7577764, 0.6477301, 1, 1, 1, 1, 1,
1.161349, 1.18208, 2.783828, 1, 1, 1, 1, 1,
1.162016, -1.518316, 1.793864, 1, 1, 1, 1, 1,
1.166525, 1.746902, -0.1943873, 1, 1, 1, 1, 1,
1.167869, -1.176486, 3.306103, 1, 1, 1, 1, 1,
1.168052, -0.2643139, 0.4098822, 1, 1, 1, 1, 1,
1.168859, -0.8976504, 3.519976, 1, 1, 1, 1, 1,
1.176921, 0.3420821, 0.5061611, 1, 1, 1, 1, 1,
1.176962, -0.5199356, 1.382723, 0, 0, 1, 1, 1,
1.202351, 0.5769165, -0.3905764, 1, 0, 0, 1, 1,
1.209533, -1.046055, 3.76329, 1, 0, 0, 1, 1,
1.214707, 1.188785, 3.05937, 1, 0, 0, 1, 1,
1.219359, 0.3814661, 2.132829, 1, 0, 0, 1, 1,
1.232192, 1.183175, 2.188228, 1, 0, 0, 1, 1,
1.23242, -0.2786952, 2.257266, 0, 0, 0, 1, 1,
1.237357, -0.9506277, 1.01416, 0, 0, 0, 1, 1,
1.247186, 0.1935926, 2.058748, 0, 0, 0, 1, 1,
1.254114, 0.8989496, 1.36648, 0, 0, 0, 1, 1,
1.259334, 0.4562604, 1.412906, 0, 0, 0, 1, 1,
1.26056, 0.3589553, 0.1636136, 0, 0, 0, 1, 1,
1.26673, 1.688088, 0.6474816, 0, 0, 0, 1, 1,
1.269912, 0.9196678, 0.4460891, 1, 1, 1, 1, 1,
1.274069, -0.2650277, 1.335588, 1, 1, 1, 1, 1,
1.276664, -0.9562891, 2.537814, 1, 1, 1, 1, 1,
1.2851, 0.8699297, 2.20386, 1, 1, 1, 1, 1,
1.28863, -0.7998526, 0.5068184, 1, 1, 1, 1, 1,
1.308467, -0.8485289, 2.889848, 1, 1, 1, 1, 1,
1.308788, 0.2462577, 1.432778, 1, 1, 1, 1, 1,
1.314383, -0.3784288, 1.819701, 1, 1, 1, 1, 1,
1.32074, 0.4768133, 1.86368, 1, 1, 1, 1, 1,
1.321529, 0.3257521, -0.07527586, 1, 1, 1, 1, 1,
1.333478, 1.801903, -0.7233001, 1, 1, 1, 1, 1,
1.335858, -0.5362527, 0.2885345, 1, 1, 1, 1, 1,
1.337417, 0.002610017, 2.832779, 1, 1, 1, 1, 1,
1.338448, 0.9909592, 1.097537, 1, 1, 1, 1, 1,
1.341533, 2.42756, 0.7523726, 1, 1, 1, 1, 1,
1.344961, 1.92302, -0.02852085, 0, 0, 1, 1, 1,
1.370194, -1.273907, 2.420612, 1, 0, 0, 1, 1,
1.372864, 0.3589908, 1.825631, 1, 0, 0, 1, 1,
1.384606, 0.5881801, -0.6169078, 1, 0, 0, 1, 1,
1.391273, -1.038607, 1.106037, 1, 0, 0, 1, 1,
1.392252, -0.2688133, 1.752719, 1, 0, 0, 1, 1,
1.395817, 0.2987308, 1.570855, 0, 0, 0, 1, 1,
1.399409, 1.490363, -0.2054274, 0, 0, 0, 1, 1,
1.407071, 0.1706389, 2.048039, 0, 0, 0, 1, 1,
1.414482, -0.3439534, 3.024698, 0, 0, 0, 1, 1,
1.417474, 0.8989319, 1.160004, 0, 0, 0, 1, 1,
1.425176, 0.9659104, -0.3793191, 0, 0, 0, 1, 1,
1.426012, -0.2303406, 0.7284026, 0, 0, 0, 1, 1,
1.430769, 2.038423, 0.8000095, 1, 1, 1, 1, 1,
1.447061, -1.528036, 1.144808, 1, 1, 1, 1, 1,
1.450536, 0.879354, 1.281887, 1, 1, 1, 1, 1,
1.456617, -0.9272461, 4.403338, 1, 1, 1, 1, 1,
1.477707, -1.159128, 2.824235, 1, 1, 1, 1, 1,
1.483954, 0.3688455, 1.153674, 1, 1, 1, 1, 1,
1.502825, -0.4643721, 3.169534, 1, 1, 1, 1, 1,
1.504564, -0.6577277, 4.044153, 1, 1, 1, 1, 1,
1.513532, -0.6589887, 4.086299, 1, 1, 1, 1, 1,
1.516804, -0.7851772, 2.717544, 1, 1, 1, 1, 1,
1.521067, 0.03120551, 0.5585749, 1, 1, 1, 1, 1,
1.521751, 0.1659016, 2.348366, 1, 1, 1, 1, 1,
1.531623, -1.896412, 3.439172, 1, 1, 1, 1, 1,
1.53619, -0.7114348, 2.081203, 1, 1, 1, 1, 1,
1.540066, -0.5679058, 2.897767, 1, 1, 1, 1, 1,
1.54791, 0.7026516, 0.847578, 0, 0, 1, 1, 1,
1.561119, 0.1336155, 2.572992, 1, 0, 0, 1, 1,
1.564745, 0.3849649, 0.9420854, 1, 0, 0, 1, 1,
1.568984, -0.9191393, 1.112973, 1, 0, 0, 1, 1,
1.571472, -0.6844294, 2.184623, 1, 0, 0, 1, 1,
1.573038, -1.305623, 3.114883, 1, 0, 0, 1, 1,
1.577372, -0.1956876, 3.568837, 0, 0, 0, 1, 1,
1.58144, -1.651055, 2.810233, 0, 0, 0, 1, 1,
1.601238, -1.078867, 1.355123, 0, 0, 0, 1, 1,
1.609233, 1.000363, 1.012561, 0, 0, 0, 1, 1,
1.61305, 0.7205967, 0.7495669, 0, 0, 0, 1, 1,
1.614683, -0.8219002, 2.197597, 0, 0, 0, 1, 1,
1.626685, 0.7038764, 0.4485433, 0, 0, 0, 1, 1,
1.632636, -1.207713, 2.692749, 1, 1, 1, 1, 1,
1.638964, 0.002049568, 1.568714, 1, 1, 1, 1, 1,
1.644871, -0.2602189, 1.688316, 1, 1, 1, 1, 1,
1.648093, -0.6320891, 1.927627, 1, 1, 1, 1, 1,
1.650928, -1.05471, 2.10517, 1, 1, 1, 1, 1,
1.656385, 1.596429, 1.518749, 1, 1, 1, 1, 1,
1.656765, -0.3838542, 3.000133, 1, 1, 1, 1, 1,
1.660921, -0.2321137, 2.518653, 1, 1, 1, 1, 1,
1.69986, 0.5840309, 1.407958, 1, 1, 1, 1, 1,
1.711638, 0.2248495, 2.304412, 1, 1, 1, 1, 1,
1.714382, 0.06109706, 1.073839, 1, 1, 1, 1, 1,
1.724726, -0.9904861, 2.209289, 1, 1, 1, 1, 1,
1.729226, -1.527358, 1.256176, 1, 1, 1, 1, 1,
1.779334, -0.7275679, 2.7374, 1, 1, 1, 1, 1,
1.783947, -2.620291, 1.939244, 1, 1, 1, 1, 1,
1.787921, 0.3417861, 1.667468, 0, 0, 1, 1, 1,
1.790766, -0.8686851, 2.793321, 1, 0, 0, 1, 1,
1.801852, -1.067772, 1.496906, 1, 0, 0, 1, 1,
1.80279, -0.3609921, 2.503158, 1, 0, 0, 1, 1,
1.810905, -1.705909, 1.336818, 1, 0, 0, 1, 1,
1.81401, 1.345689, 2.439832, 1, 0, 0, 1, 1,
1.816012, -0.5643599, 2.532119, 0, 0, 0, 1, 1,
1.842059, -0.6636873, 0.2016492, 0, 0, 0, 1, 1,
1.843881, -0.5078024, 0.9790996, 0, 0, 0, 1, 1,
1.877915, -0.2777513, 1.608258, 0, 0, 0, 1, 1,
1.889358, -1.313435, 1.701729, 0, 0, 0, 1, 1,
1.890075, 1.155843, 1.62324, 0, 0, 0, 1, 1,
1.898793, -0.8336649, 1.487686, 0, 0, 0, 1, 1,
1.918149, -0.07908873, 2.350011, 1, 1, 1, 1, 1,
1.924672, -0.559382, 1.183679, 1, 1, 1, 1, 1,
1.929392, -0.2479298, 1.605333, 1, 1, 1, 1, 1,
1.937042, -0.7831092, 1.697601, 1, 1, 1, 1, 1,
1.952047, -1.447919, 2.958434, 1, 1, 1, 1, 1,
1.957466, -1.049016, 1.651486, 1, 1, 1, 1, 1,
1.960932, 1.5989, 0.5600835, 1, 1, 1, 1, 1,
1.980461, -0.077759, 1.83049, 1, 1, 1, 1, 1,
1.985375, -1.114851, 3.412098, 1, 1, 1, 1, 1,
1.988087, -0.1324321, 0.6236939, 1, 1, 1, 1, 1,
1.999158, -2.729612, 3.304453, 1, 1, 1, 1, 1,
2.017084, -0.1592702, 1.148673, 1, 1, 1, 1, 1,
2.067199, -2.302608, 1.895503, 1, 1, 1, 1, 1,
2.081404, 1.415298, 0.9219495, 1, 1, 1, 1, 1,
2.085456, -0.08673607, 2.119463, 1, 1, 1, 1, 1,
2.134964, -0.05637503, -1.148256, 0, 0, 1, 1, 1,
2.168642, -0.4409223, 2.619759, 1, 0, 0, 1, 1,
2.169762, -1.307897, 2.785833, 1, 0, 0, 1, 1,
2.170367, -1.094319, 2.898842, 1, 0, 0, 1, 1,
2.198609, -0.8936241, 1.661739, 1, 0, 0, 1, 1,
2.265057, 0.3009557, 1.590623, 1, 0, 0, 1, 1,
2.285456, 0.100968, 3.722356, 0, 0, 0, 1, 1,
2.297808, -0.276786, 1.63757, 0, 0, 0, 1, 1,
2.299774, 1.477313, 0.561716, 0, 0, 0, 1, 1,
2.350188, 0.05326015, 3.415688, 0, 0, 0, 1, 1,
2.361188, -0.8507237, 4.081518, 0, 0, 0, 1, 1,
2.362958, 0.1179263, 0.553683, 0, 0, 0, 1, 1,
2.372367, 0.4693796, 2.608254, 0, 0, 0, 1, 1,
2.380576, -0.2349205, 1.735657, 1, 1, 1, 1, 1,
2.388114, -0.8995387, 2.397058, 1, 1, 1, 1, 1,
2.47764, -0.1887369, 3.237069, 1, 1, 1, 1, 1,
2.618127, -0.1451118, 2.495239, 1, 1, 1, 1, 1,
2.626511, 0.3731837, 1.471551, 1, 1, 1, 1, 1,
2.677034, 0.05954905, 1.837231, 1, 1, 1, 1, 1,
2.997641, 0.3038061, 2.50518, 1, 1, 1, 1, 1
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
var radius = 9.276066;
var distance = 32.58179;
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
mvMatrix.translate( -0.05931342, 0.1263883, -0.1673117 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.58179);
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
