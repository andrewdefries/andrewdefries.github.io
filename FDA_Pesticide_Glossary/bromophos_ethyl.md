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
-3.507867, -0.2919487, -1.375105, 1, 0, 0, 1,
-3.207734, 0.1775031, -3.446632, 1, 0.007843138, 0, 1,
-2.804204, 0.3735768, -0.9365864, 1, 0.01176471, 0, 1,
-2.712517, -1.411425, -2.223024, 1, 0.01960784, 0, 1,
-2.669504, 1.932321, -0.2071974, 1, 0.02352941, 0, 1,
-2.617384, 0.1409237, -0.992177, 1, 0.03137255, 0, 1,
-2.603931, 0.2354982, -0.4516557, 1, 0.03529412, 0, 1,
-2.570694, -0.1263309, -2.371799, 1, 0.04313726, 0, 1,
-2.520144, -0.535418, -1.804456, 1, 0.04705882, 0, 1,
-2.486483, 0.4456793, -1.473238, 1, 0.05490196, 0, 1,
-2.267479, 1.71513, 1.087453, 1, 0.05882353, 0, 1,
-2.241073, 1.059645, -2.423285, 1, 0.06666667, 0, 1,
-2.210754, 0.09477822, -2.80839, 1, 0.07058824, 0, 1,
-2.195729, -0.3304787, -2.979468, 1, 0.07843138, 0, 1,
-2.17809, 0.5434052, -1.241262, 1, 0.08235294, 0, 1,
-2.150735, 0.1273144, -1.976423, 1, 0.09019608, 0, 1,
-2.137921, -0.5587871, -0.7785499, 1, 0.09411765, 0, 1,
-2.132281, 2.071151, -0.6177709, 1, 0.1019608, 0, 1,
-2.103612, 1.124416, -1.039722, 1, 0.1098039, 0, 1,
-2.075141, 0.2536229, -3.292608, 1, 0.1137255, 0, 1,
-2.026619, 0.2128421, -1.122562, 1, 0.1215686, 0, 1,
-2.000838, -0.180626, -2.12815, 1, 0.1254902, 0, 1,
-1.961951, 1.754559, -1.272128, 1, 0.1333333, 0, 1,
-1.954564, 0.002643113, -1.756905, 1, 0.1372549, 0, 1,
-1.934285, 2.003166, 0.7826471, 1, 0.145098, 0, 1,
-1.922261, 0.1157329, -0.1371756, 1, 0.1490196, 0, 1,
-1.91494, 2.186512, -1.229512, 1, 0.1568628, 0, 1,
-1.914814, -1.776753, -2.535232, 1, 0.1607843, 0, 1,
-1.908833, 0.232088, -0.9887067, 1, 0.1686275, 0, 1,
-1.899928, 0.04610166, -0.5563804, 1, 0.172549, 0, 1,
-1.87916, -0.9581586, -0.9215857, 1, 0.1803922, 0, 1,
-1.877897, -0.1880739, -2.074118, 1, 0.1843137, 0, 1,
-1.853718, -1.330459, -2.658892, 1, 0.1921569, 0, 1,
-1.850024, -0.8562898, -0.4727598, 1, 0.1960784, 0, 1,
-1.836942, -0.2211524, -1.195059, 1, 0.2039216, 0, 1,
-1.808003, -0.9548694, -2.515175, 1, 0.2117647, 0, 1,
-1.786382, 0.5242513, 0.6071106, 1, 0.2156863, 0, 1,
-1.77267, -0.1072662, -0.02542039, 1, 0.2235294, 0, 1,
-1.768072, -0.09288426, -2.193022, 1, 0.227451, 0, 1,
-1.740756, -1.105746, -1.529133, 1, 0.2352941, 0, 1,
-1.716795, -0.8989696, -1.635638, 1, 0.2392157, 0, 1,
-1.69588, 0.9837883, -1.379729, 1, 0.2470588, 0, 1,
-1.692918, 0.6572576, -0.1217211, 1, 0.2509804, 0, 1,
-1.692147, 1.433193, -1.171324, 1, 0.2588235, 0, 1,
-1.681583, 0.5615776, -2.667063, 1, 0.2627451, 0, 1,
-1.673956, -1.124326, -1.376603, 1, 0.2705882, 0, 1,
-1.661394, -0.7123972, -2.991544, 1, 0.2745098, 0, 1,
-1.658648, -0.7484086, -0.3738908, 1, 0.282353, 0, 1,
-1.658123, -0.9301996, -2.426354, 1, 0.2862745, 0, 1,
-1.652181, 1.040769, -1.215873, 1, 0.2941177, 0, 1,
-1.63796, -1.518147, -1.654029, 1, 0.3019608, 0, 1,
-1.626415, 0.1749852, -2.358988, 1, 0.3058824, 0, 1,
-1.622477, -0.2222469, 0.2076144, 1, 0.3137255, 0, 1,
-1.613379, 1.178515, -0.9933916, 1, 0.3176471, 0, 1,
-1.611256, -0.4247554, -1.820653, 1, 0.3254902, 0, 1,
-1.589935, -0.4317184, -1.211184, 1, 0.3294118, 0, 1,
-1.587677, 2.46247, -0.8926149, 1, 0.3372549, 0, 1,
-1.561772, -0.465858, -1.430103, 1, 0.3411765, 0, 1,
-1.547783, -0.1144559, -0.9455927, 1, 0.3490196, 0, 1,
-1.546987, 0.1849982, -0.6409963, 1, 0.3529412, 0, 1,
-1.538044, -2.6406, -1.939333, 1, 0.3607843, 0, 1,
-1.517979, -0.6755102, -2.434582, 1, 0.3647059, 0, 1,
-1.51307, -1.871653, -2.159031, 1, 0.372549, 0, 1,
-1.5113, -0.610629, -0.5620527, 1, 0.3764706, 0, 1,
-1.501912, -0.1396043, -1.629272, 1, 0.3843137, 0, 1,
-1.479343, 0.2217576, -1.21871, 1, 0.3882353, 0, 1,
-1.477039, 1.253037, -3.282285, 1, 0.3960784, 0, 1,
-1.456448, -0.616493, -3.515285, 1, 0.4039216, 0, 1,
-1.439894, -0.5937044, -2.31348, 1, 0.4078431, 0, 1,
-1.432999, 1.86022, -0.6056393, 1, 0.4156863, 0, 1,
-1.420652, -0.09578557, -2.598774, 1, 0.4196078, 0, 1,
-1.413748, -0.009751691, -0.7327262, 1, 0.427451, 0, 1,
-1.40602, -0.8445584, -2.726501, 1, 0.4313726, 0, 1,
-1.388522, -0.2706218, -2.327406, 1, 0.4392157, 0, 1,
-1.383084, 1.090599, -1.675065, 1, 0.4431373, 0, 1,
-1.38149, -1.25405, -1.448632, 1, 0.4509804, 0, 1,
-1.381052, -0.3751255, -2.511622, 1, 0.454902, 0, 1,
-1.376198, 0.06863335, -2.759357, 1, 0.4627451, 0, 1,
-1.371705, 0.6314272, -3.000718, 1, 0.4666667, 0, 1,
-1.371216, 0.2596612, -0.2243146, 1, 0.4745098, 0, 1,
-1.347159, 0.6206845, 0.1243737, 1, 0.4784314, 0, 1,
-1.337193, 0.1450558, -0.7570653, 1, 0.4862745, 0, 1,
-1.336574, -0.225139, -1.570277, 1, 0.4901961, 0, 1,
-1.334097, -1.400543, -0.916612, 1, 0.4980392, 0, 1,
-1.33135, -0.871756, -0.3572405, 1, 0.5058824, 0, 1,
-1.325903, -0.6012346, -2.291102, 1, 0.509804, 0, 1,
-1.318829, 0.09599959, -2.305112, 1, 0.5176471, 0, 1,
-1.31584, 2.213945, 0.1697859, 1, 0.5215687, 0, 1,
-1.315452, 2.533329, -0.7950075, 1, 0.5294118, 0, 1,
-1.314842, -0.8151432, -1.309022, 1, 0.5333334, 0, 1,
-1.307581, 0.8211523, -0.2488899, 1, 0.5411765, 0, 1,
-1.301111, -0.1731598, -2.46306, 1, 0.5450981, 0, 1,
-1.300433, 0.08150932, -1.086173, 1, 0.5529412, 0, 1,
-1.299229, -0.8995612, -2.923212, 1, 0.5568628, 0, 1,
-1.297352, 0.3813175, -2.488346, 1, 0.5647059, 0, 1,
-1.293781, -1.33862, -2.521048, 1, 0.5686275, 0, 1,
-1.29074, 0.5396149, -2.872366, 1, 0.5764706, 0, 1,
-1.287931, -0.86333, -2.032663, 1, 0.5803922, 0, 1,
-1.283065, -2.978275, -3.291418, 1, 0.5882353, 0, 1,
-1.279601, -1.738498, -0.8362598, 1, 0.5921569, 0, 1,
-1.257399, 1.709074, 0.07696814, 1, 0.6, 0, 1,
-1.251921, 0.3612581, -0.4951801, 1, 0.6078432, 0, 1,
-1.251043, -2.025282, -2.212631, 1, 0.6117647, 0, 1,
-1.246084, 0.341289, -1.698637, 1, 0.6196079, 0, 1,
-1.243973, -0.5330293, -3.539182, 1, 0.6235294, 0, 1,
-1.235517, 0.07285642, -1.849424, 1, 0.6313726, 0, 1,
-1.23422, 0.1681199, 0.4211453, 1, 0.6352941, 0, 1,
-1.224292, 0.619361, 1.876204, 1, 0.6431373, 0, 1,
-1.223957, -1.161757, -2.55913, 1, 0.6470588, 0, 1,
-1.203153, 1.478752, 0.6427274, 1, 0.654902, 0, 1,
-1.200443, 0.1137238, 0.6476269, 1, 0.6588235, 0, 1,
-1.196094, 1.823759, -2.451829, 1, 0.6666667, 0, 1,
-1.19505, 1.351012, -0.9308391, 1, 0.6705883, 0, 1,
-1.192502, 0.4968407, -0.4414334, 1, 0.6784314, 0, 1,
-1.191561, 0.9006445, 0.9473116, 1, 0.682353, 0, 1,
-1.190311, -0.1736104, -1.32833, 1, 0.6901961, 0, 1,
-1.185697, 0.6692497, -1.803201, 1, 0.6941177, 0, 1,
-1.171855, 0.0635, -1.654341, 1, 0.7019608, 0, 1,
-1.167763, 1.027836, 1.226354, 1, 0.7098039, 0, 1,
-1.166113, -1.236849, 0.03376227, 1, 0.7137255, 0, 1,
-1.163658, 0.3049425, -2.248113, 1, 0.7215686, 0, 1,
-1.163182, 0.5700685, -0.3357182, 1, 0.7254902, 0, 1,
-1.157406, 0.03269032, -1.128078, 1, 0.7333333, 0, 1,
-1.144557, -0.1229718, -2.711218, 1, 0.7372549, 0, 1,
-1.142706, -0.3036703, -1.253715, 1, 0.7450981, 0, 1,
-1.142159, -0.3388201, -2.430863, 1, 0.7490196, 0, 1,
-1.12753, 0.472179, 0.6136862, 1, 0.7568628, 0, 1,
-1.124963, -2.055768, -2.473982, 1, 0.7607843, 0, 1,
-1.120685, 0.2888859, -0.8036065, 1, 0.7686275, 0, 1,
-1.116827, 0.6866839, -0.106609, 1, 0.772549, 0, 1,
-1.113559, 0.454605, -1.783727, 1, 0.7803922, 0, 1,
-1.110197, -0.6552624, -1.811254, 1, 0.7843137, 0, 1,
-1.109267, -0.4306321, 0.37026, 1, 0.7921569, 0, 1,
-1.10747, 1.605841, -0.8776029, 1, 0.7960784, 0, 1,
-1.099889, -0.4211543, -2.943581, 1, 0.8039216, 0, 1,
-1.098732, 0.06542588, -1.949266, 1, 0.8117647, 0, 1,
-1.097739, -0.1116279, -0.4420914, 1, 0.8156863, 0, 1,
-1.095579, -0.8255567, -1.246236, 1, 0.8235294, 0, 1,
-1.094366, 0.9953188, -1.69575, 1, 0.827451, 0, 1,
-1.087752, -1.006247, -3.135432, 1, 0.8352941, 0, 1,
-1.085426, 1.595191, 0.4266646, 1, 0.8392157, 0, 1,
-1.077991, 0.7250798, 0.5060477, 1, 0.8470588, 0, 1,
-1.073978, -0.9390664, -1.647936, 1, 0.8509804, 0, 1,
-1.073584, 1.316434, -0.9251657, 1, 0.8588235, 0, 1,
-1.072164, 0.4083881, 0.3516311, 1, 0.8627451, 0, 1,
-1.070796, 0.2087567, -1.061623, 1, 0.8705882, 0, 1,
-1.069543, -0.09283869, -2.473064, 1, 0.8745098, 0, 1,
-1.056097, 0.1304664, -3.310227, 1, 0.8823529, 0, 1,
-1.053098, -0.4593637, -3.06525, 1, 0.8862745, 0, 1,
-1.045198, 0.8774863, -0.01360665, 1, 0.8941177, 0, 1,
-1.044189, 0.8993416, 1.328019, 1, 0.8980392, 0, 1,
-1.03922, 0.1100219, -1.026049, 1, 0.9058824, 0, 1,
-1.038751, 2.238574, -0.9736834, 1, 0.9137255, 0, 1,
-1.037531, -0.5836598, -1.71402, 1, 0.9176471, 0, 1,
-1.030595, 0.3010457, -3.120525, 1, 0.9254902, 0, 1,
-1.025931, 0.3730447, -2.468191, 1, 0.9294118, 0, 1,
-1.021094, -0.7293503, -3.655738, 1, 0.9372549, 0, 1,
-1.020189, 0.4183653, -0.6859779, 1, 0.9411765, 0, 1,
-1.019949, 0.3467989, -2.197658, 1, 0.9490196, 0, 1,
-1.017876, -0.6534207, -2.700844, 1, 0.9529412, 0, 1,
-1.017397, 0.04132421, -1.733372, 1, 0.9607843, 0, 1,
-1.015443, 0.8821618, -0.442202, 1, 0.9647059, 0, 1,
-1.005345, -1.085351, -2.240466, 1, 0.972549, 0, 1,
-1.002961, -0.1454426, -1.766697, 1, 0.9764706, 0, 1,
-0.9953043, 0.03961288, -2.200238, 1, 0.9843137, 0, 1,
-0.9920698, 0.4663568, -1.489216, 1, 0.9882353, 0, 1,
-0.9903757, 1.047892, 0.08069405, 1, 0.9960784, 0, 1,
-0.9835443, 1.373459, 0.1651229, 0.9960784, 1, 0, 1,
-0.9818236, -0.8628107, -2.890096, 0.9921569, 1, 0, 1,
-0.9747655, -0.2274525, -0.3377865, 0.9843137, 1, 0, 1,
-0.9729456, 0.2322673, -0.7348954, 0.9803922, 1, 0, 1,
-0.968336, -1.560767, -3.460622, 0.972549, 1, 0, 1,
-0.9681525, 0.7573749, -0.7925197, 0.9686275, 1, 0, 1,
-0.967365, -0.741329, -0.5227809, 0.9607843, 1, 0, 1,
-0.9657108, -1.797656, -1.079612, 0.9568627, 1, 0, 1,
-0.960425, -1.221912, -2.907224, 0.9490196, 1, 0, 1,
-0.9590765, -0.2933858, -1.497603, 0.945098, 1, 0, 1,
-0.9573856, 0.6043295, -1.005897, 0.9372549, 1, 0, 1,
-0.9552198, 0.7590409, -1.294499, 0.9333333, 1, 0, 1,
-0.9521958, 0.484889, -2.253059, 0.9254902, 1, 0, 1,
-0.9489164, -1.122748, -1.942967, 0.9215686, 1, 0, 1,
-0.9421105, -1.284194, -3.1089, 0.9137255, 1, 0, 1,
-0.937265, 0.5605275, -1.89596, 0.9098039, 1, 0, 1,
-0.9348519, 1.312753, 0.6171066, 0.9019608, 1, 0, 1,
-0.9333191, -1.482236, -1.293421, 0.8941177, 1, 0, 1,
-0.9317487, 0.1242926, -0.6184956, 0.8901961, 1, 0, 1,
-0.9297125, 0.2570667, 0.6840823, 0.8823529, 1, 0, 1,
-0.9288687, -1.64335, -2.530673, 0.8784314, 1, 0, 1,
-0.9162542, -0.5974175, -2.865577, 0.8705882, 1, 0, 1,
-0.9085258, -0.8214464, -0.7598789, 0.8666667, 1, 0, 1,
-0.9072506, -0.8570324, 0.5814579, 0.8588235, 1, 0, 1,
-0.9056913, -0.7529154, -1.982945, 0.854902, 1, 0, 1,
-0.9025326, 1.29362, -1.301884, 0.8470588, 1, 0, 1,
-0.8944067, 0.1869122, -1.62427, 0.8431373, 1, 0, 1,
-0.8889961, -1.073513, -0.8441958, 0.8352941, 1, 0, 1,
-0.8850532, 1.413911, -0.02659701, 0.8313726, 1, 0, 1,
-0.8846609, -0.3681476, -0.1622598, 0.8235294, 1, 0, 1,
-0.8831233, -0.1686547, -2.885211, 0.8196079, 1, 0, 1,
-0.8737367, -0.1974094, -1.442393, 0.8117647, 1, 0, 1,
-0.8720271, 0.2355472, -3.196649, 0.8078431, 1, 0, 1,
-0.8705515, 0.196064, 0.3780648, 0.8, 1, 0, 1,
-0.8690554, 2.070408, -0.868994, 0.7921569, 1, 0, 1,
-0.8686013, -0.5375395, -2.689379, 0.7882353, 1, 0, 1,
-0.860189, 1.077061, -0.4430721, 0.7803922, 1, 0, 1,
-0.8599602, -0.3341857, -3.423015, 0.7764706, 1, 0, 1,
-0.8562953, -0.4250382, -1.498315, 0.7686275, 1, 0, 1,
-0.8553975, -0.6033632, -3.008441, 0.7647059, 1, 0, 1,
-0.8539039, -0.4736941, -4.091451, 0.7568628, 1, 0, 1,
-0.8523155, -1.52972, -2.022328, 0.7529412, 1, 0, 1,
-0.847243, 0.825134, -0.3427588, 0.7450981, 1, 0, 1,
-0.8296213, 0.1296465, -2.031375, 0.7411765, 1, 0, 1,
-0.8282744, -1.346381, -1.81436, 0.7333333, 1, 0, 1,
-0.8256716, -1.361362, -1.550053, 0.7294118, 1, 0, 1,
-0.8256354, -0.3057764, -0.8111722, 0.7215686, 1, 0, 1,
-0.8196635, -0.3493422, -2.515709, 0.7176471, 1, 0, 1,
-0.8187546, 0.5098871, -2.78331, 0.7098039, 1, 0, 1,
-0.813283, 1.357772, -0.7104216, 0.7058824, 1, 0, 1,
-0.809755, 0.4200426, -0.8462687, 0.6980392, 1, 0, 1,
-0.8020819, 2.11678, -2.185431, 0.6901961, 1, 0, 1,
-0.7961167, 0.8364941, -1.417981, 0.6862745, 1, 0, 1,
-0.7857672, 0.7577505, -0.6889667, 0.6784314, 1, 0, 1,
-0.7848108, -0.3677948, -2.501544, 0.6745098, 1, 0, 1,
-0.7822111, 1.438954, -0.8967906, 0.6666667, 1, 0, 1,
-0.7764884, 1.534692, 0.3168943, 0.6627451, 1, 0, 1,
-0.7761616, -0.8013414, -2.971267, 0.654902, 1, 0, 1,
-0.7759619, 0.4434303, 0.01825813, 0.6509804, 1, 0, 1,
-0.7697108, 0.4399692, -1.46215, 0.6431373, 1, 0, 1,
-0.769669, -0.6190616, -3.388196, 0.6392157, 1, 0, 1,
-0.7643178, 0.6661425, -1.949858, 0.6313726, 1, 0, 1,
-0.7636477, -1.214494, -2.249413, 0.627451, 1, 0, 1,
-0.7619663, 0.8188837, -0.6719298, 0.6196079, 1, 0, 1,
-0.7616609, -0.5191722, -1.620854, 0.6156863, 1, 0, 1,
-0.7543513, -2.460981, -2.416018, 0.6078432, 1, 0, 1,
-0.7530327, 0.6979505, -0.2625362, 0.6039216, 1, 0, 1,
-0.7522407, -0.1414711, -1.627974, 0.5960785, 1, 0, 1,
-0.7494203, -0.2645106, -2.199778, 0.5882353, 1, 0, 1,
-0.7469938, -1.158697, -3.18453, 0.5843138, 1, 0, 1,
-0.7436907, -0.4384364, -2.767009, 0.5764706, 1, 0, 1,
-0.742038, 0.258468, -1.016562, 0.572549, 1, 0, 1,
-0.7362578, -0.5653649, -2.923048, 0.5647059, 1, 0, 1,
-0.7353634, 0.5954169, 0.4913901, 0.5607843, 1, 0, 1,
-0.7234687, 0.6084025, -1.638795, 0.5529412, 1, 0, 1,
-0.7203482, -0.9331082, -0.8879578, 0.5490196, 1, 0, 1,
-0.7069737, -0.9736045, -2.974627, 0.5411765, 1, 0, 1,
-0.7067474, -0.1365544, -1.987049, 0.5372549, 1, 0, 1,
-0.7049216, 0.1439806, -1.59561, 0.5294118, 1, 0, 1,
-0.6979397, 1.685665, -1.063531, 0.5254902, 1, 0, 1,
-0.6975172, 1.021966, -0.1380259, 0.5176471, 1, 0, 1,
-0.6959343, 1.236085, -0.05994217, 0.5137255, 1, 0, 1,
-0.693718, 0.8080789, -0.001710453, 0.5058824, 1, 0, 1,
-0.6882497, 0.1708892, -1.780603, 0.5019608, 1, 0, 1,
-0.6873838, -0.2885094, -1.416752, 0.4941176, 1, 0, 1,
-0.6819634, 1.573042, 0.4492728, 0.4862745, 1, 0, 1,
-0.6819065, -0.4895793, -3.635696, 0.4823529, 1, 0, 1,
-0.681669, 1.266997, -1.003226, 0.4745098, 1, 0, 1,
-0.6733183, 1.628729, -0.6221157, 0.4705882, 1, 0, 1,
-0.6726589, 0.5124492, -0.9256429, 0.4627451, 1, 0, 1,
-0.6621816, -0.6743738, -3.13868, 0.4588235, 1, 0, 1,
-0.6592136, -1.705623, -1.399366, 0.4509804, 1, 0, 1,
-0.656129, 1.624853, -0.9505859, 0.4470588, 1, 0, 1,
-0.6555105, -0.6882024, -3.317983, 0.4392157, 1, 0, 1,
-0.6533907, 0.7227968, 2.217607, 0.4352941, 1, 0, 1,
-0.6462607, 2.739835, -0.1637122, 0.427451, 1, 0, 1,
-0.6456356, -1.239461, -3.072828, 0.4235294, 1, 0, 1,
-0.642814, -1.131145, -2.565526, 0.4156863, 1, 0, 1,
-0.6396721, -0.6395911, -2.820701, 0.4117647, 1, 0, 1,
-0.6355463, -0.3664966, -2.150253, 0.4039216, 1, 0, 1,
-0.6313894, -0.4233583, -1.923489, 0.3960784, 1, 0, 1,
-0.631225, -0.05327066, -1.532012, 0.3921569, 1, 0, 1,
-0.6304616, 0.2331635, -0.4643655, 0.3843137, 1, 0, 1,
-0.6268128, 1.767148, 1.741868, 0.3803922, 1, 0, 1,
-0.6267882, 0.003862653, -0.7949013, 0.372549, 1, 0, 1,
-0.6236613, -0.1179822, 0.150681, 0.3686275, 1, 0, 1,
-0.6139817, 0.4607413, -0.6687721, 0.3607843, 1, 0, 1,
-0.6119196, 1.224841, 0.1635293, 0.3568628, 1, 0, 1,
-0.6069838, 0.08531046, -1.70621, 0.3490196, 1, 0, 1,
-0.6063992, 0.1815575, -0.5756308, 0.345098, 1, 0, 1,
-0.5989322, 0.5888565, -1.222517, 0.3372549, 1, 0, 1,
-0.594534, 1.06364, 0.7979382, 0.3333333, 1, 0, 1,
-0.5871198, 1.286345, 0.6850474, 0.3254902, 1, 0, 1,
-0.582247, -0.02501469, -3.115611, 0.3215686, 1, 0, 1,
-0.5816718, -1.011656, -4.531515, 0.3137255, 1, 0, 1,
-0.5808392, 0.2346041, -1.631719, 0.3098039, 1, 0, 1,
-0.5775922, 0.5249732, -0.8385929, 0.3019608, 1, 0, 1,
-0.5755398, 0.2527052, -1.902884, 0.2941177, 1, 0, 1,
-0.5743147, 0.8247305, -1.562057, 0.2901961, 1, 0, 1,
-0.572871, 0.03587295, -2.537468, 0.282353, 1, 0, 1,
-0.5714467, -0.7110178, -2.482148, 0.2784314, 1, 0, 1,
-0.5659621, 1.0343, -0.0146098, 0.2705882, 1, 0, 1,
-0.5641844, 0.341913, -0.5721716, 0.2666667, 1, 0, 1,
-0.5575902, -0.777807, -4.158823, 0.2588235, 1, 0, 1,
-0.5527709, -1.868188, -0.9231975, 0.254902, 1, 0, 1,
-0.5507042, 1.688262, -1.001561, 0.2470588, 1, 0, 1,
-0.5480308, -1.072072, -4.839936, 0.2431373, 1, 0, 1,
-0.5462359, -0.2982978, -2.09322, 0.2352941, 1, 0, 1,
-0.5444758, -0.8606051, -3.234515, 0.2313726, 1, 0, 1,
-0.5406177, 0.4366772, -2.416557, 0.2235294, 1, 0, 1,
-0.5387738, 0.3758616, -1.005229, 0.2196078, 1, 0, 1,
-0.5320152, -0.1928703, -3.389585, 0.2117647, 1, 0, 1,
-0.5309041, 0.3673302, -1.983044, 0.2078431, 1, 0, 1,
-0.5246324, -0.647096, -1.390741, 0.2, 1, 0, 1,
-0.524129, -1.345629, -3.674382, 0.1921569, 1, 0, 1,
-0.523586, 0.5591393, -0.5877658, 0.1882353, 1, 0, 1,
-0.5229538, -1.919543, -1.709732, 0.1803922, 1, 0, 1,
-0.5218694, -0.2096214, -1.665446, 0.1764706, 1, 0, 1,
-0.5209016, 1.122695, -0.6207967, 0.1686275, 1, 0, 1,
-0.5187044, -0.3431577, -2.431039, 0.1647059, 1, 0, 1,
-0.517746, 0.6319253, -1.376194, 0.1568628, 1, 0, 1,
-0.516027, -0.5143161, -2.419103, 0.1529412, 1, 0, 1,
-0.5153879, 1.00596, -0.3350722, 0.145098, 1, 0, 1,
-0.511389, -0.3177024, -1.679922, 0.1411765, 1, 0, 1,
-0.5073887, -1.19856, -2.466294, 0.1333333, 1, 0, 1,
-0.5064688, 0.4856605, 0.06233288, 0.1294118, 1, 0, 1,
-0.5029596, 0.990125, -0.7704239, 0.1215686, 1, 0, 1,
-0.5020928, 0.5435501, -1.013796, 0.1176471, 1, 0, 1,
-0.5015603, -2.135596, -3.335891, 0.1098039, 1, 0, 1,
-0.5007855, 0.9285396, -1.689614, 0.1058824, 1, 0, 1,
-0.5002675, -0.3532112, -3.457594, 0.09803922, 1, 0, 1,
-0.4982728, 1.933795, -0.06911296, 0.09019608, 1, 0, 1,
-0.4953155, 0.04819113, -0.8280548, 0.08627451, 1, 0, 1,
-0.4944141, -0.1603708, -0.5126711, 0.07843138, 1, 0, 1,
-0.484032, -1.053115, -2.607054, 0.07450981, 1, 0, 1,
-0.4839601, -0.5225309, -2.866817, 0.06666667, 1, 0, 1,
-0.4810018, -0.6369906, -3.465973, 0.0627451, 1, 0, 1,
-0.4804045, -2.115258, -3.404965, 0.05490196, 1, 0, 1,
-0.4784722, 0.6936871, 0.0613573, 0.05098039, 1, 0, 1,
-0.4774097, 1.971472, 0.2435879, 0.04313726, 1, 0, 1,
-0.4765864, 0.4553649, 0.8947145, 0.03921569, 1, 0, 1,
-0.4746845, -1.847026, -3.240669, 0.03137255, 1, 0, 1,
-0.4667941, -0.5029416, -2.749087, 0.02745098, 1, 0, 1,
-0.4653621, 0.1760946, -0.9587041, 0.01960784, 1, 0, 1,
-0.4652115, -0.7277966, -2.214205, 0.01568628, 1, 0, 1,
-0.4635325, -0.6155727, -3.586608, 0.007843138, 1, 0, 1,
-0.4534991, -0.7693538, -2.523147, 0.003921569, 1, 0, 1,
-0.4409697, 1.352846, 0.1219026, 0, 1, 0.003921569, 1,
-0.439967, -0.2017259, -1.568938, 0, 1, 0.01176471, 1,
-0.4395143, -0.3992537, -0.913671, 0, 1, 0.01568628, 1,
-0.4368111, -0.7786659, -1.780321, 0, 1, 0.02352941, 1,
-0.4347349, 0.294143, -0.1676927, 0, 1, 0.02745098, 1,
-0.4261605, 0.52627, 1.231386, 0, 1, 0.03529412, 1,
-0.4232526, -1.278142, -2.97019, 0, 1, 0.03921569, 1,
-0.4205091, -0.2825362, -3.231059, 0, 1, 0.04705882, 1,
-0.4153966, -0.1400858, -1.384025, 0, 1, 0.05098039, 1,
-0.4122447, -1.131937, -2.512431, 0, 1, 0.05882353, 1,
-0.4118215, -2.396275, -2.716151, 0, 1, 0.0627451, 1,
-0.40525, -1.097703, -3.337106, 0, 1, 0.07058824, 1,
-0.4037009, -2.193372, -1.959827, 0, 1, 0.07450981, 1,
-0.4032826, 0.6955714, 0.01932205, 0, 1, 0.08235294, 1,
-0.4001522, -0.8402466, -3.257552, 0, 1, 0.08627451, 1,
-0.3995144, 0.2278431, -1.354077, 0, 1, 0.09411765, 1,
-0.3913655, -1.550504, -2.046393, 0, 1, 0.1019608, 1,
-0.3902587, -1.04789, -2.149332, 0, 1, 0.1058824, 1,
-0.3869595, 0.6685705, -2.340599, 0, 1, 0.1137255, 1,
-0.3859648, -0.1128878, -1.438334, 0, 1, 0.1176471, 1,
-0.3820694, -0.0228699, -2.744598, 0, 1, 0.1254902, 1,
-0.3800776, -0.5196484, -2.02694, 0, 1, 0.1294118, 1,
-0.3797455, -1.122894, -3.268098, 0, 1, 0.1372549, 1,
-0.3789768, 0.09691903, 0.7929384, 0, 1, 0.1411765, 1,
-0.3672677, -1.216415, -2.474384, 0, 1, 0.1490196, 1,
-0.366854, 0.1817758, -2.230193, 0, 1, 0.1529412, 1,
-0.3661961, 1.582004, 0.2293643, 0, 1, 0.1607843, 1,
-0.3641913, 0.7857338, -1.019578, 0, 1, 0.1647059, 1,
-0.3613032, -0.2803206, -2.419947, 0, 1, 0.172549, 1,
-0.3584743, 0.4569333, -0.4435136, 0, 1, 0.1764706, 1,
-0.355823, 0.4046205, 0.5428918, 0, 1, 0.1843137, 1,
-0.3541747, -0.7888364, -1.513512, 0, 1, 0.1882353, 1,
-0.3379706, -1.782593, -2.454642, 0, 1, 0.1960784, 1,
-0.3362716, -1.431323, -2.43285, 0, 1, 0.2039216, 1,
-0.3342498, -1.237274, -2.891474, 0, 1, 0.2078431, 1,
-0.3341027, -1.12187, -4.289001, 0, 1, 0.2156863, 1,
-0.3334044, -1.088816, -1.356084, 0, 1, 0.2196078, 1,
-0.3280477, -0.3422099, -2.673341, 0, 1, 0.227451, 1,
-0.3240605, 1.71619, -1.852252, 0, 1, 0.2313726, 1,
-0.3234453, -0.7901288, -2.153143, 0, 1, 0.2392157, 1,
-0.3221776, -1.601274, -3.561587, 0, 1, 0.2431373, 1,
-0.3186767, -1.405538, -3.383806, 0, 1, 0.2509804, 1,
-0.3125001, -1.644756, -4.737896, 0, 1, 0.254902, 1,
-0.3123701, -1.392008, -2.333413, 0, 1, 0.2627451, 1,
-0.3122719, 0.3609379, -1.083425, 0, 1, 0.2666667, 1,
-0.3065306, -0.5867588, -3.453378, 0, 1, 0.2745098, 1,
-0.3051175, -1.401351, -2.295986, 0, 1, 0.2784314, 1,
-0.2999255, -1.878545, -2.484682, 0, 1, 0.2862745, 1,
-0.299296, -0.8211882, -4.176427, 0, 1, 0.2901961, 1,
-0.296798, -0.7360551, -3.047591, 0, 1, 0.2980392, 1,
-0.2950497, -0.3323941, -2.507725, 0, 1, 0.3058824, 1,
-0.2884122, 1.119001, 1.584446, 0, 1, 0.3098039, 1,
-0.2801743, -0.1906563, -3.891951, 0, 1, 0.3176471, 1,
-0.2682897, 0.6039032, 1.44242, 0, 1, 0.3215686, 1,
-0.2643644, -0.7959538, -2.642445, 0, 1, 0.3294118, 1,
-0.2642887, -0.9507642, -2.225248, 0, 1, 0.3333333, 1,
-0.2632495, -0.7487146, -2.085623, 0, 1, 0.3411765, 1,
-0.2620899, -0.6440117, -3.077812, 0, 1, 0.345098, 1,
-0.2599345, 1.532994, -0.5961982, 0, 1, 0.3529412, 1,
-0.2569354, -1.288888, -3.396544, 0, 1, 0.3568628, 1,
-0.2468419, -0.5991684, -4.024669, 0, 1, 0.3647059, 1,
-0.2447042, 0.1441507, -0.7628025, 0, 1, 0.3686275, 1,
-0.239431, -1.022724, -5.488172, 0, 1, 0.3764706, 1,
-0.2388104, -0.149373, -3.502127, 0, 1, 0.3803922, 1,
-0.2381934, -0.3271569, -3.115954, 0, 1, 0.3882353, 1,
-0.2342603, 0.7327209, -1.889256, 0, 1, 0.3921569, 1,
-0.23291, 2.188751, -1.714252, 0, 1, 0.4, 1,
-0.2310836, 0.5266411, -0.6023941, 0, 1, 0.4078431, 1,
-0.2294748, 1.023517, 0.02386757, 0, 1, 0.4117647, 1,
-0.2290162, -0.07529348, -0.765524, 0, 1, 0.4196078, 1,
-0.2270357, 0.4979892, -0.2745646, 0, 1, 0.4235294, 1,
-0.2248738, 0.613565, 1.127272, 0, 1, 0.4313726, 1,
-0.2228635, -1.477702, -0.7588137, 0, 1, 0.4352941, 1,
-0.2214882, -0.5519937, -3.637684, 0, 1, 0.4431373, 1,
-0.2206111, 1.840816, 0.5163668, 0, 1, 0.4470588, 1,
-0.220422, 0.8681642, -0.600242, 0, 1, 0.454902, 1,
-0.2192733, -0.7528206, -4.168971, 0, 1, 0.4588235, 1,
-0.2175315, 0.5442803, 1.306068, 0, 1, 0.4666667, 1,
-0.2126307, -2.6742, -2.330431, 0, 1, 0.4705882, 1,
-0.212105, 1.05941, -1.255861, 0, 1, 0.4784314, 1,
-0.2111254, 1.0262, 0.07032308, 0, 1, 0.4823529, 1,
-0.2098899, 0.4798378, 0.08716926, 0, 1, 0.4901961, 1,
-0.2053588, 1.187674, -1.412491, 0, 1, 0.4941176, 1,
-0.2020854, -1.093472, -3.224944, 0, 1, 0.5019608, 1,
-0.2005578, 1.175464, 1.805308, 0, 1, 0.509804, 1,
-0.1991012, -1.059845, -2.983756, 0, 1, 0.5137255, 1,
-0.1981394, 1.634619, -2.076935, 0, 1, 0.5215687, 1,
-0.1935328, -2.06018, -0.9224826, 0, 1, 0.5254902, 1,
-0.1929519, 1.259324, -1.331465, 0, 1, 0.5333334, 1,
-0.1912674, 0.9250164, 0.802514, 0, 1, 0.5372549, 1,
-0.1897545, 0.3227465, -1.14425, 0, 1, 0.5450981, 1,
-0.189566, -2.052925, -4.612299, 0, 1, 0.5490196, 1,
-0.1886862, 0.09509845, -1.069819, 0, 1, 0.5568628, 1,
-0.1883351, -2.056963, -2.764144, 0, 1, 0.5607843, 1,
-0.1869244, 2.587816, 1.748526, 0, 1, 0.5686275, 1,
-0.1852181, 0.8935157, 1.061165, 0, 1, 0.572549, 1,
-0.1844714, 1.216617, -0.3900621, 0, 1, 0.5803922, 1,
-0.1812826, -0.0687409, -1.891592, 0, 1, 0.5843138, 1,
-0.1758171, 1.187541, -0.08444607, 0, 1, 0.5921569, 1,
-0.1748202, -0.7444605, -2.026853, 0, 1, 0.5960785, 1,
-0.1715453, -0.5305496, -2.432706, 0, 1, 0.6039216, 1,
-0.1666019, 1.465478, -0.3150885, 0, 1, 0.6117647, 1,
-0.1663451, 0.05920566, -1.547153, 0, 1, 0.6156863, 1,
-0.154631, 2.207058, -0.178094, 0, 1, 0.6235294, 1,
-0.1538849, -0.318232, -3.294088, 0, 1, 0.627451, 1,
-0.1513048, 0.2416487, -0.7379934, 0, 1, 0.6352941, 1,
-0.1506374, -1.142824, -2.476547, 0, 1, 0.6392157, 1,
-0.1463886, -0.7449896, -3.682877, 0, 1, 0.6470588, 1,
-0.1454649, -1.099577, -1.034593, 0, 1, 0.6509804, 1,
-0.1428041, 0.9178092, -0.1521389, 0, 1, 0.6588235, 1,
-0.1423091, -0.1327271, -2.4367, 0, 1, 0.6627451, 1,
-0.1391548, 0.2926071, 0.4047998, 0, 1, 0.6705883, 1,
-0.1370193, -2.422787, -2.637323, 0, 1, 0.6745098, 1,
-0.1300651, -1.0948, -1.859103, 0, 1, 0.682353, 1,
-0.1294798, -0.6608713, -2.851275, 0, 1, 0.6862745, 1,
-0.1268719, 0.1173725, 1.259801, 0, 1, 0.6941177, 1,
-0.1261073, 0.8467166, -0.4262429, 0, 1, 0.7019608, 1,
-0.1194274, 1.142081, -0.3285694, 0, 1, 0.7058824, 1,
-0.1171616, -1.059302, -1.881172, 0, 1, 0.7137255, 1,
-0.1165529, 1.409371, 0.8787051, 0, 1, 0.7176471, 1,
-0.1113121, 0.2273928, -0.08655228, 0, 1, 0.7254902, 1,
-0.1104142, 0.7130681, 1.843162, 0, 1, 0.7294118, 1,
-0.1082292, -0.7452461, -2.111745, 0, 1, 0.7372549, 1,
-0.1081375, -0.6964916, -2.486646, 0, 1, 0.7411765, 1,
-0.1077825, 1.98764, -0.1642932, 0, 1, 0.7490196, 1,
-0.1060634, -0.3543065, -2.802797, 0, 1, 0.7529412, 1,
-0.105052, 0.5483763, 0.6234311, 0, 1, 0.7607843, 1,
-0.1035075, -1.932661, -1.702717, 0, 1, 0.7647059, 1,
-0.103056, 0.5603236, 1.81718, 0, 1, 0.772549, 1,
-0.09891056, -0.4422691, -1.486828, 0, 1, 0.7764706, 1,
-0.09697018, -3.069844, -3.209843, 0, 1, 0.7843137, 1,
-0.09688238, 0.5843669, -0.7091507, 0, 1, 0.7882353, 1,
-0.09623577, -0.7343839, -3.495605, 0, 1, 0.7960784, 1,
-0.09333871, 0.5397887, -0.07979236, 0, 1, 0.8039216, 1,
-0.09331684, -1.681853, -3.881717, 0, 1, 0.8078431, 1,
-0.08405252, -2.028925, -1.750294, 0, 1, 0.8156863, 1,
-0.08223143, 1.225971, -0.4264825, 0, 1, 0.8196079, 1,
-0.08204811, 0.4537669, 0.06728079, 0, 1, 0.827451, 1,
-0.081212, -0.142132, -2.259795, 0, 1, 0.8313726, 1,
-0.07908439, -0.1061428, -2.691143, 0, 1, 0.8392157, 1,
-0.07891673, -1.207509, -2.88487, 0, 1, 0.8431373, 1,
-0.07672255, 1.324736, 0.1085019, 0, 1, 0.8509804, 1,
-0.07638267, 0.2516267, -0.9095725, 0, 1, 0.854902, 1,
-0.07488713, -0.203613, -2.659096, 0, 1, 0.8627451, 1,
-0.07124254, -1.670494, -2.087098, 0, 1, 0.8666667, 1,
-0.06776757, 0.8395359, 0.652391, 0, 1, 0.8745098, 1,
-0.05037588, -1.489455, -2.544173, 0, 1, 0.8784314, 1,
-0.0486175, 0.8393672, 2.59509, 0, 1, 0.8862745, 1,
-0.04852463, 1.147483, -0.49483, 0, 1, 0.8901961, 1,
-0.044374, -0.1553564, -2.720013, 0, 1, 0.8980392, 1,
-0.03746055, -1.887203, -1.959929, 0, 1, 0.9058824, 1,
-0.03662705, -0.4040291, -3.242348, 0, 1, 0.9098039, 1,
-0.03604685, 0.04321829, -1.554752, 0, 1, 0.9176471, 1,
-0.03323456, -0.1633013, -1.902707, 0, 1, 0.9215686, 1,
-0.02826614, 1.867506, -0.2302141, 0, 1, 0.9294118, 1,
-0.0279788, 0.3814003, -1.285527, 0, 1, 0.9333333, 1,
-0.02756571, 1.259594, -0.7802723, 0, 1, 0.9411765, 1,
-0.02724797, -0.2872095, -3.5192, 0, 1, 0.945098, 1,
-0.02707231, 0.6716893, 0.8489522, 0, 1, 0.9529412, 1,
-0.02530213, -0.376152, -4.887359, 0, 1, 0.9568627, 1,
-0.01083892, -2.211565, -1.798519, 0, 1, 0.9647059, 1,
-0.01006055, 0.4653912, -0.555537, 0, 1, 0.9686275, 1,
-0.008093767, -1.933227, -2.609131, 0, 1, 0.9764706, 1,
-0.007994078, -0.4715278, -4.020951, 0, 1, 0.9803922, 1,
-0.006785177, -0.3110759, -3.040232, 0, 1, 0.9882353, 1,
-0.00548947, 0.2886012, 0.1772508, 0, 1, 0.9921569, 1,
-0.005478681, -0.6994227, -2.690906, 0, 1, 1, 1,
-0.002438609, -0.8174867, -3.851629, 0, 0.9921569, 1, 1,
0.001399759, 1.424464, -1.312341, 0, 0.9882353, 1, 1,
0.0014384, 0.1182449, -1.702273, 0, 0.9803922, 1, 1,
0.002103552, 0.475401, -0.4413859, 0, 0.9764706, 1, 1,
0.002842925, 0.4452109, 0.6648611, 0, 0.9686275, 1, 1,
0.004046669, 0.3937684, 0.7369195, 0, 0.9647059, 1, 1,
0.004672574, -1.387351, 3.797132, 0, 0.9568627, 1, 1,
0.005338673, -1.771484, 1.628125, 0, 0.9529412, 1, 1,
0.0102608, 1.247714, -0.399131, 0, 0.945098, 1, 1,
0.01391709, -1.400646, 4.150093, 0, 0.9411765, 1, 1,
0.01545583, 1.078064, 0.6231862, 0, 0.9333333, 1, 1,
0.0197062, 0.6554584, 0.8585643, 0, 0.9294118, 1, 1,
0.02064417, 1.194114, -0.953393, 0, 0.9215686, 1, 1,
0.02162664, -0.4985769, 2.889561, 0, 0.9176471, 1, 1,
0.02300402, 0.3719158, -0.2361862, 0, 0.9098039, 1, 1,
0.03152021, 0.04762211, -0.5656063, 0, 0.9058824, 1, 1,
0.03185456, 0.7819001, 1.104199, 0, 0.8980392, 1, 1,
0.03414906, 1.904938, 0.2323892, 0, 0.8901961, 1, 1,
0.0351704, 1.531381, 0.7367937, 0, 0.8862745, 1, 1,
0.03619376, 1.144969, 1.133868, 0, 0.8784314, 1, 1,
0.04043648, -0.172693, 1.419375, 0, 0.8745098, 1, 1,
0.04074711, 0.01585262, 0.5894911, 0, 0.8666667, 1, 1,
0.04114866, -0.06979292, 3.973772, 0, 0.8627451, 1, 1,
0.04125516, -0.2347927, 3.915822, 0, 0.854902, 1, 1,
0.0452361, 0.4762906, 0.5241309, 0, 0.8509804, 1, 1,
0.04567303, -0.8307995, 2.687019, 0, 0.8431373, 1, 1,
0.04576131, -0.2474068, 2.858323, 0, 0.8392157, 1, 1,
0.04988616, -0.05995903, 4.111898, 0, 0.8313726, 1, 1,
0.05136756, -0.6581813, 2.981457, 0, 0.827451, 1, 1,
0.05220354, -0.1863417, 2.976985, 0, 0.8196079, 1, 1,
0.05355371, 0.0101654, 1.715275, 0, 0.8156863, 1, 1,
0.05694178, -0.02880997, 3.443143, 0, 0.8078431, 1, 1,
0.06055363, 2.030153, -0.2607415, 0, 0.8039216, 1, 1,
0.06185059, -0.5863764, 2.838493, 0, 0.7960784, 1, 1,
0.06735395, -0.5284777, 4.752992, 0, 0.7882353, 1, 1,
0.06942216, -0.5544293, 2.407783, 0, 0.7843137, 1, 1,
0.06959891, 1.348438, -1.045234, 0, 0.7764706, 1, 1,
0.07028022, 0.6707397, 2.260268, 0, 0.772549, 1, 1,
0.07091133, -0.9540871, 2.77502, 0, 0.7647059, 1, 1,
0.0716365, -1.499674, 3.038472, 0, 0.7607843, 1, 1,
0.08117934, 1.965187, 1.21534, 0, 0.7529412, 1, 1,
0.08259319, 0.2812425, 0.7406215, 0, 0.7490196, 1, 1,
0.08419042, -0.1056696, 1.907985, 0, 0.7411765, 1, 1,
0.08536223, 0.6288154, 0.5217203, 0, 0.7372549, 1, 1,
0.09037828, 0.1750396, 0.4509343, 0, 0.7294118, 1, 1,
0.09326132, -0.6541674, 3.249109, 0, 0.7254902, 1, 1,
0.09398018, 1.241279, -0.4691529, 0, 0.7176471, 1, 1,
0.09406588, 0.7350193, 0.7518215, 0, 0.7137255, 1, 1,
0.09566297, -1.639096, 3.085014, 0, 0.7058824, 1, 1,
0.0976906, 0.07063323, 1.499925, 0, 0.6980392, 1, 1,
0.09771648, -1.171704, 2.665206, 0, 0.6941177, 1, 1,
0.09800999, -1.596323, 3.149433, 0, 0.6862745, 1, 1,
0.0999411, -0.5137376, 3.484525, 0, 0.682353, 1, 1,
0.1018881, 0.1270996, 1.563297, 0, 0.6745098, 1, 1,
0.1043142, -0.2213985, 4.258264, 0, 0.6705883, 1, 1,
0.1079083, -0.2768339, 1.209746, 0, 0.6627451, 1, 1,
0.1111961, -1.301992, 1.926876, 0, 0.6588235, 1, 1,
0.1162531, 0.2970463, 0.5606784, 0, 0.6509804, 1, 1,
0.1175087, 0.1308082, -0.1981297, 0, 0.6470588, 1, 1,
0.117634, -0.1467151, 2.387555, 0, 0.6392157, 1, 1,
0.1193778, 0.9559857, -0.7271987, 0, 0.6352941, 1, 1,
0.1205597, -0.4805568, 2.629013, 0, 0.627451, 1, 1,
0.123033, -0.6188184, 2.902591, 0, 0.6235294, 1, 1,
0.1282074, 0.9743209, 0.02103454, 0, 0.6156863, 1, 1,
0.1285715, -0.994215, 5.21346, 0, 0.6117647, 1, 1,
0.1297557, 0.0932756, 1.288107, 0, 0.6039216, 1, 1,
0.1336168, -1.089585, 3.874943, 0, 0.5960785, 1, 1,
0.1424798, 1.542282, -0.8540146, 0, 0.5921569, 1, 1,
0.1427962, -1.984228, 3.514249, 0, 0.5843138, 1, 1,
0.144313, -0.4186102, 3.451413, 0, 0.5803922, 1, 1,
0.1474528, -0.9328105, 2.905305, 0, 0.572549, 1, 1,
0.1509003, -0.7236784, 2.705323, 0, 0.5686275, 1, 1,
0.1522177, -0.04930354, 0.2727561, 0, 0.5607843, 1, 1,
0.1534368, -0.4307038, 1.280272, 0, 0.5568628, 1, 1,
0.1549486, 0.3087555, 0.5748979, 0, 0.5490196, 1, 1,
0.1557387, 0.7297105, 2.773965, 0, 0.5450981, 1, 1,
0.1561225, -1.139072, 2.490487, 0, 0.5372549, 1, 1,
0.1589681, -0.1556302, 2.538886, 0, 0.5333334, 1, 1,
0.1623025, -1.504493, 3.528671, 0, 0.5254902, 1, 1,
0.1630492, -2.002074, 3.868566, 0, 0.5215687, 1, 1,
0.1660829, 0.4364089, -0.6977825, 0, 0.5137255, 1, 1,
0.1706507, 0.5645879, 1.480244, 0, 0.509804, 1, 1,
0.173786, -1.114975, 2.76124, 0, 0.5019608, 1, 1,
0.1743262, 0.7221914, -0.2224212, 0, 0.4941176, 1, 1,
0.1767194, 1.314392, -1.309171, 0, 0.4901961, 1, 1,
0.1799215, -0.1734397, 3.883209, 0, 0.4823529, 1, 1,
0.182575, 1.375121, -0.4913759, 0, 0.4784314, 1, 1,
0.1874332, -0.9927453, 2.529984, 0, 0.4705882, 1, 1,
0.1938349, -0.7632786, 2.810332, 0, 0.4666667, 1, 1,
0.194261, 0.215005, 0.5045865, 0, 0.4588235, 1, 1,
0.2027068, -0.4220523, 3.208483, 0, 0.454902, 1, 1,
0.203869, -0.07236623, 1.203716, 0, 0.4470588, 1, 1,
0.2100639, 1.396494, -1.150507, 0, 0.4431373, 1, 1,
0.2111835, -0.4746772, 2.876649, 0, 0.4352941, 1, 1,
0.2130989, 0.6228882, -0.803703, 0, 0.4313726, 1, 1,
0.2144529, -0.5201735, 3.42105, 0, 0.4235294, 1, 1,
0.2176737, 0.9796093, -1.056711, 0, 0.4196078, 1, 1,
0.2209195, 0.4494263, 0.7819839, 0, 0.4117647, 1, 1,
0.2218082, -0.6495214, 2.81438, 0, 0.4078431, 1, 1,
0.2246262, -1.024611, 1.82252, 0, 0.4, 1, 1,
0.2295973, -0.1686677, 2.300308, 0, 0.3921569, 1, 1,
0.2301782, -0.76635, 3.620919, 0, 0.3882353, 1, 1,
0.2306953, 1.578138, -0.4257377, 0, 0.3803922, 1, 1,
0.2328475, 0.8951619, 1.295008, 0, 0.3764706, 1, 1,
0.2391658, 0.2713663, -0.1495529, 0, 0.3686275, 1, 1,
0.239865, -1.239068, 3.75429, 0, 0.3647059, 1, 1,
0.2419663, -0.425001, 2.303898, 0, 0.3568628, 1, 1,
0.2421814, -0.7704853, 2.53842, 0, 0.3529412, 1, 1,
0.2442025, -0.5602996, 3.313926, 0, 0.345098, 1, 1,
0.2489827, 1.387097, -0.2666755, 0, 0.3411765, 1, 1,
0.2499045, -1.474993, 3.024837, 0, 0.3333333, 1, 1,
0.2510065, -1.585827, 3.06703, 0, 0.3294118, 1, 1,
0.252738, 1.551605, -1.066405, 0, 0.3215686, 1, 1,
0.2552562, -0.5531546, 2.308082, 0, 0.3176471, 1, 1,
0.2603931, 0.168701, 1.270491, 0, 0.3098039, 1, 1,
0.2750983, -1.765316, 2.981017, 0, 0.3058824, 1, 1,
0.2761727, 0.05082161, 1.011155, 0, 0.2980392, 1, 1,
0.2769879, 1.495451, 0.6227494, 0, 0.2901961, 1, 1,
0.2790771, -1.323344, 4.358968, 0, 0.2862745, 1, 1,
0.2807115, 1.319249, -0.1987591, 0, 0.2784314, 1, 1,
0.2834, -0.09486877, 1.83752, 0, 0.2745098, 1, 1,
0.2851015, -0.1867505, 1.832112, 0, 0.2666667, 1, 1,
0.2942385, -0.4256846, 2.218207, 0, 0.2627451, 1, 1,
0.2963844, -0.5326175, 1.963928, 0, 0.254902, 1, 1,
0.2976846, 0.5265365, 1.980908, 0, 0.2509804, 1, 1,
0.3001671, 0.7922527, -1.017754, 0, 0.2431373, 1, 1,
0.3063201, 0.8220986, 2.754363, 0, 0.2392157, 1, 1,
0.3082755, -0.1897237, 2.238353, 0, 0.2313726, 1, 1,
0.3094635, -0.7861577, 2.336884, 0, 0.227451, 1, 1,
0.3133011, -0.1328258, 1.843026, 0, 0.2196078, 1, 1,
0.3173015, -0.3690136, 2.369099, 0, 0.2156863, 1, 1,
0.3182098, 0.8221906, 1.134705, 0, 0.2078431, 1, 1,
0.3192482, -0.7688485, 4.056304, 0, 0.2039216, 1, 1,
0.3209711, 1.718192, 0.005917592, 0, 0.1960784, 1, 1,
0.3217254, 1.581986, 1.301155, 0, 0.1882353, 1, 1,
0.3225105, -0.1597167, 3.113907, 0, 0.1843137, 1, 1,
0.3235278, -0.02953604, 1.727708, 0, 0.1764706, 1, 1,
0.3239164, -1.137029, 4.006313, 0, 0.172549, 1, 1,
0.3260259, 0.9273869, -0.5438639, 0, 0.1647059, 1, 1,
0.3301813, -0.1145916, 2.039112, 0, 0.1607843, 1, 1,
0.3380239, 0.7747943, 0.6931404, 0, 0.1529412, 1, 1,
0.3390675, 0.6437037, 2.029835, 0, 0.1490196, 1, 1,
0.3407106, -0.9278846, 2.84578, 0, 0.1411765, 1, 1,
0.3463442, 1.534883, 1.875278, 0, 0.1372549, 1, 1,
0.34668, 1.290804, 0.6744058, 0, 0.1294118, 1, 1,
0.3494398, -2.51538, 4.069974, 0, 0.1254902, 1, 1,
0.3499646, -0.8272601, 1.941586, 0, 0.1176471, 1, 1,
0.3506424, -0.6315077, 3.863682, 0, 0.1137255, 1, 1,
0.3540643, 0.3348031, 0.2572064, 0, 0.1058824, 1, 1,
0.3604341, -0.4565245, 3.349737, 0, 0.09803922, 1, 1,
0.3629883, 0.0539969, 3.567256, 0, 0.09411765, 1, 1,
0.3642675, -0.1469047, 0.6972727, 0, 0.08627451, 1, 1,
0.3711522, -0.517635, 2.463234, 0, 0.08235294, 1, 1,
0.3735186, -0.701061, 3.289497, 0, 0.07450981, 1, 1,
0.3738091, -0.1679751, 0.6875114, 0, 0.07058824, 1, 1,
0.385372, 0.8143083, 1.206708, 0, 0.0627451, 1, 1,
0.3857732, -0.1762206, 2.580146, 0, 0.05882353, 1, 1,
0.3880025, -0.5416557, 1.703717, 0, 0.05098039, 1, 1,
0.3889144, 0.3546832, -0.721693, 0, 0.04705882, 1, 1,
0.3997822, 0.3059309, -0.3835302, 0, 0.03921569, 1, 1,
0.4030576, -0.1948575, 2.196, 0, 0.03529412, 1, 1,
0.4084614, 0.01922181, 0.2825328, 0, 0.02745098, 1, 1,
0.4085872, -0.5343313, 3.029099, 0, 0.02352941, 1, 1,
0.4115213, 0.681988, -1.259175, 0, 0.01568628, 1, 1,
0.4149452, 0.5701416, -0.436375, 0, 0.01176471, 1, 1,
0.4163736, 0.6579448, -0.008716204, 0, 0.003921569, 1, 1,
0.419659, -0.01796682, 1.310977, 0.003921569, 0, 1, 1,
0.4250501, -1.936205, 3.561232, 0.007843138, 0, 1, 1,
0.4276749, -2.206833, 2.418628, 0.01568628, 0, 1, 1,
0.4277034, 0.4935407, 1.714277, 0.01960784, 0, 1, 1,
0.4340797, -1.509995, 3.561923, 0.02745098, 0, 1, 1,
0.4341576, 0.7519673, 0.3039657, 0.03137255, 0, 1, 1,
0.4343399, -0.3544958, 1.94817, 0.03921569, 0, 1, 1,
0.4375341, 1.219817, 1.831468, 0.04313726, 0, 1, 1,
0.440093, 0.02630766, 1.63344, 0.05098039, 0, 1, 1,
0.4544944, 1.557045, -0.4528321, 0.05490196, 0, 1, 1,
0.4647824, 0.2386558, 2.043948, 0.0627451, 0, 1, 1,
0.464799, 0.6756547, 1.479985, 0.06666667, 0, 1, 1,
0.4648272, -1.039299, 1.720933, 0.07450981, 0, 1, 1,
0.4675463, -0.05260585, 2.350343, 0.07843138, 0, 1, 1,
0.4680443, 0.1594068, 2.075433, 0.08627451, 0, 1, 1,
0.4782455, -1.114192, 2.459366, 0.09019608, 0, 1, 1,
0.4787444, -1.683799, 1.882947, 0.09803922, 0, 1, 1,
0.480184, 1.111518, 2.662822, 0.1058824, 0, 1, 1,
0.4811153, -0.997206, 2.360476, 0.1098039, 0, 1, 1,
0.4882775, -0.4954127, 1.699433, 0.1176471, 0, 1, 1,
0.4907779, -1.347099, 1.535093, 0.1215686, 0, 1, 1,
0.4919032, -1.701, 2.745571, 0.1294118, 0, 1, 1,
0.4934367, -0.2161269, 3.437304, 0.1333333, 0, 1, 1,
0.4937932, 2.389283, 0.5726842, 0.1411765, 0, 1, 1,
0.496507, 1.185435, 0.2822331, 0.145098, 0, 1, 1,
0.4984398, -0.4874653, 1.662424, 0.1529412, 0, 1, 1,
0.4990034, 0.2998185, -0.2562831, 0.1568628, 0, 1, 1,
0.4993416, -0.4368513, 3.206579, 0.1647059, 0, 1, 1,
0.5004091, 0.9755152, 0.6669458, 0.1686275, 0, 1, 1,
0.5006244, -0.8274911, 3.758219, 0.1764706, 0, 1, 1,
0.5055654, 1.43295, -1.054403, 0.1803922, 0, 1, 1,
0.5060024, 1.223976, 1.231951, 0.1882353, 0, 1, 1,
0.506816, 0.7520383, 1.940193, 0.1921569, 0, 1, 1,
0.5080785, -0.9399012, 0.7789457, 0.2, 0, 1, 1,
0.5084327, -0.2103519, 1.657589, 0.2078431, 0, 1, 1,
0.5108524, 0.8520745, -0.7633637, 0.2117647, 0, 1, 1,
0.515225, -0.4599079, 1.995237, 0.2196078, 0, 1, 1,
0.5152453, 0.3406557, 1.221651, 0.2235294, 0, 1, 1,
0.5163773, -0.2784242, 3.133434, 0.2313726, 0, 1, 1,
0.5172479, 0.2170725, 0.04998526, 0.2352941, 0, 1, 1,
0.5177118, 1.092421, -0.6895691, 0.2431373, 0, 1, 1,
0.5178611, 1.789051, 0.6154298, 0.2470588, 0, 1, 1,
0.520734, -0.1052753, 2.572577, 0.254902, 0, 1, 1,
0.5211167, 0.3812591, 0.9290197, 0.2588235, 0, 1, 1,
0.5214286, -0.8598117, 3.33244, 0.2666667, 0, 1, 1,
0.5254232, 2.161794, 1.672209, 0.2705882, 0, 1, 1,
0.5327116, -0.4745921, 2.960429, 0.2784314, 0, 1, 1,
0.5363331, 1.326554, 0.7468339, 0.282353, 0, 1, 1,
0.5381232, 0.774902, 2.219748, 0.2901961, 0, 1, 1,
0.5386249, 0.4616982, -0.6165196, 0.2941177, 0, 1, 1,
0.5392862, -1.656218, 4.049137, 0.3019608, 0, 1, 1,
0.5464708, 0.4143312, 0.08283102, 0.3098039, 0, 1, 1,
0.5472417, -2.095118, 4.042174, 0.3137255, 0, 1, 1,
0.5474758, -0.07570185, 1.554727, 0.3215686, 0, 1, 1,
0.5525228, 0.8751338, 1.342194, 0.3254902, 0, 1, 1,
0.5534024, -0.8846444, 1.206201, 0.3333333, 0, 1, 1,
0.5537516, 1.132671, 1.018719, 0.3372549, 0, 1, 1,
0.5557931, -0.3396897, 1.833006, 0.345098, 0, 1, 1,
0.5585033, -0.0472588, -0.7680268, 0.3490196, 0, 1, 1,
0.5585538, 1.216738, -1.067769, 0.3568628, 0, 1, 1,
0.5619466, -1.977366, 2.194082, 0.3607843, 0, 1, 1,
0.5743469, 1.710715, -0.3878286, 0.3686275, 0, 1, 1,
0.578742, 0.03117008, 1.027493, 0.372549, 0, 1, 1,
0.585163, -0.05786908, 1.253224, 0.3803922, 0, 1, 1,
0.5854734, 0.2355477, 2.173688, 0.3843137, 0, 1, 1,
0.5991502, 0.5195869, 1.463827, 0.3921569, 0, 1, 1,
0.6039807, 0.2266473, 0.2897785, 0.3960784, 0, 1, 1,
0.6093885, -1.537565, 3.612139, 0.4039216, 0, 1, 1,
0.611903, 0.3205605, 2.519911, 0.4117647, 0, 1, 1,
0.6129963, -1.249372, 3.846521, 0.4156863, 0, 1, 1,
0.6137794, 0.1885916, 0.3178332, 0.4235294, 0, 1, 1,
0.6139519, -1.297902, 4.210185, 0.427451, 0, 1, 1,
0.6187505, -0.08112058, 0.9691175, 0.4352941, 0, 1, 1,
0.6230013, -0.27179, 1.658845, 0.4392157, 0, 1, 1,
0.6236253, 1.423691, -0.9046645, 0.4470588, 0, 1, 1,
0.6262475, -0.7166564, 2.855663, 0.4509804, 0, 1, 1,
0.6269715, 1.710169, 2.713572, 0.4588235, 0, 1, 1,
0.6378398, -0.2380174, 2.571415, 0.4627451, 0, 1, 1,
0.6382305, -0.8321233, 3.147488, 0.4705882, 0, 1, 1,
0.6447657, -1.064337, 2.557062, 0.4745098, 0, 1, 1,
0.6473659, -1.300334, 3.544373, 0.4823529, 0, 1, 1,
0.6477296, -1.088253, 0.9785885, 0.4862745, 0, 1, 1,
0.6497161, -1.746161, 2.846851, 0.4941176, 0, 1, 1,
0.6538535, 0.9853906, 1.559923, 0.5019608, 0, 1, 1,
0.6571595, 1.430795, 0.1198933, 0.5058824, 0, 1, 1,
0.6581357, -0.4515389, 2.491847, 0.5137255, 0, 1, 1,
0.6624213, -0.5549741, 2.047958, 0.5176471, 0, 1, 1,
0.6652005, 0.02185506, 2.174225, 0.5254902, 0, 1, 1,
0.6708323, -0.7430639, 1.881754, 0.5294118, 0, 1, 1,
0.6746958, 1.895361, -0.3495984, 0.5372549, 0, 1, 1,
0.6761644, 0.1210132, 1.279611, 0.5411765, 0, 1, 1,
0.6870639, -0.1262303, 2.450989, 0.5490196, 0, 1, 1,
0.6930673, 0.773186, 0.6311163, 0.5529412, 0, 1, 1,
0.6956174, 0.4632027, 0.404921, 0.5607843, 0, 1, 1,
0.6967503, 0.06391312, 2.499378, 0.5647059, 0, 1, 1,
0.6976539, -0.5581011, 1.941141, 0.572549, 0, 1, 1,
0.7029353, -1.182757, 4.461564, 0.5764706, 0, 1, 1,
0.7058799, -0.5063952, 0.3330241, 0.5843138, 0, 1, 1,
0.7099545, 1.268591, 0.8742932, 0.5882353, 0, 1, 1,
0.7117822, -1.133422, 2.151841, 0.5960785, 0, 1, 1,
0.7124628, 1.331933, -0.3785999, 0.6039216, 0, 1, 1,
0.7151138, -0.323722, 2.564907, 0.6078432, 0, 1, 1,
0.7152331, -1.084223, 3.742861, 0.6156863, 0, 1, 1,
0.7191011, -1.056937, 1.512114, 0.6196079, 0, 1, 1,
0.7236448, 1.750692, 3.289233, 0.627451, 0, 1, 1,
0.7276675, -0.6106448, 2.656169, 0.6313726, 0, 1, 1,
0.7297382, 0.7588252, 0.5089036, 0.6392157, 0, 1, 1,
0.7305579, -0.1674399, 0.3584246, 0.6431373, 0, 1, 1,
0.736173, -0.355119, 0.6035858, 0.6509804, 0, 1, 1,
0.7371456, -0.9967884, 1.475688, 0.654902, 0, 1, 1,
0.7392701, -0.7241943, 1.18757, 0.6627451, 0, 1, 1,
0.7412929, -0.2961887, 1.453787, 0.6666667, 0, 1, 1,
0.7461526, -0.1961614, 3.237541, 0.6745098, 0, 1, 1,
0.7509393, 1.13111, -0.5433798, 0.6784314, 0, 1, 1,
0.7636473, 0.2240416, 1.923936, 0.6862745, 0, 1, 1,
0.7718296, -0.4814591, 2.246675, 0.6901961, 0, 1, 1,
0.7724887, -1.654316, 3.804383, 0.6980392, 0, 1, 1,
0.7728029, 1.454707, 3.066503, 0.7058824, 0, 1, 1,
0.7732906, 0.1186034, 0.2827536, 0.7098039, 0, 1, 1,
0.7776926, 0.4658939, 0.3763228, 0.7176471, 0, 1, 1,
0.7832776, -0.1455191, 4.198348, 0.7215686, 0, 1, 1,
0.7882049, 1.197494, -0.2267733, 0.7294118, 0, 1, 1,
0.7940561, -0.8346108, 2.437012, 0.7333333, 0, 1, 1,
0.7953448, 1.295808, 0.7783146, 0.7411765, 0, 1, 1,
0.8089286, -1.111495, 2.902924, 0.7450981, 0, 1, 1,
0.8133439, -0.9500546, 2.872537, 0.7529412, 0, 1, 1,
0.8152311, 0.4201449, 1.507294, 0.7568628, 0, 1, 1,
0.8169215, -0.7742044, 1.710779, 0.7647059, 0, 1, 1,
0.8171996, 0.5538269, -0.5622281, 0.7686275, 0, 1, 1,
0.8202074, 0.9936211, -0.9190946, 0.7764706, 0, 1, 1,
0.8220743, -0.2689183, 2.385993, 0.7803922, 0, 1, 1,
0.8226725, 0.08741139, 2.059737, 0.7882353, 0, 1, 1,
0.8270066, -0.3561128, 1.806293, 0.7921569, 0, 1, 1,
0.8298311, -1.042035, 1.681073, 0.8, 0, 1, 1,
0.8320099, 2.55991, -0.7856126, 0.8078431, 0, 1, 1,
0.8348922, 1.158674, -0.7161433, 0.8117647, 0, 1, 1,
0.8442371, 1.185702, 0.8296841, 0.8196079, 0, 1, 1,
0.8457943, 0.4413461, 0.9164935, 0.8235294, 0, 1, 1,
0.84676, -0.4511769, 3.244777, 0.8313726, 0, 1, 1,
0.8476819, 3.045667, 1.644845, 0.8352941, 0, 1, 1,
0.8496238, -0.02745845, 1.191367, 0.8431373, 0, 1, 1,
0.8506634, 1.967879, 1.15509, 0.8470588, 0, 1, 1,
0.8549113, -0.2423858, 1.917917, 0.854902, 0, 1, 1,
0.8556466, 0.3395505, 1.109481, 0.8588235, 0, 1, 1,
0.8561957, -0.5305584, 1.193587, 0.8666667, 0, 1, 1,
0.8581049, -0.9469008, 2.665175, 0.8705882, 0, 1, 1,
0.8591991, -0.3986824, 2.23767, 0.8784314, 0, 1, 1,
0.8687471, 1.178418, 1.058111, 0.8823529, 0, 1, 1,
0.8763302, -2.075143, 2.373464, 0.8901961, 0, 1, 1,
0.8796244, 0.1111431, 1.759457, 0.8941177, 0, 1, 1,
0.880448, 1.527503, 1.395612, 0.9019608, 0, 1, 1,
0.8882592, 0.541595, 1.382323, 0.9098039, 0, 1, 1,
0.8937732, 0.6874869, 1.063347, 0.9137255, 0, 1, 1,
0.8951327, -0.6031609, 3.59832, 0.9215686, 0, 1, 1,
0.8960701, -0.8084393, 0.6277996, 0.9254902, 0, 1, 1,
0.8960703, -0.3160386, 2.631876, 0.9333333, 0, 1, 1,
0.8993623, 0.2923233, 1.099513, 0.9372549, 0, 1, 1,
0.8998101, 0.2049984, 0.6159742, 0.945098, 0, 1, 1,
0.9026312, 0.2871024, 1.726411, 0.9490196, 0, 1, 1,
0.9135087, 0.7216053, -0.0973779, 0.9568627, 0, 1, 1,
0.9194475, -0.2439409, 1.442314, 0.9607843, 0, 1, 1,
0.9243728, 1.4986, 0.1120748, 0.9686275, 0, 1, 1,
0.9304767, 0.4534914, 0.645134, 0.972549, 0, 1, 1,
0.936594, 0.3728674, 1.414195, 0.9803922, 0, 1, 1,
0.9403882, -0.8583078, 4.732063, 0.9843137, 0, 1, 1,
0.9404735, -0.5641509, 2.270381, 0.9921569, 0, 1, 1,
0.9416295, -0.2267573, 0.6354444, 0.9960784, 0, 1, 1,
0.9535945, -0.8039227, 1.895061, 1, 0, 0.9960784, 1,
0.9556617, -0.5074731, 1.210189, 1, 0, 0.9882353, 1,
0.9654034, -0.7199688, 3.473639, 1, 0, 0.9843137, 1,
0.9720079, 0.715293, -0.1435573, 1, 0, 0.9764706, 1,
0.9782094, 1.8668, 0.4872166, 1, 0, 0.972549, 1,
0.9783185, -1.246058, 2.47576, 1, 0, 0.9647059, 1,
0.9825014, 0.384729, -0.2717406, 1, 0, 0.9607843, 1,
0.9833089, 1.320477, -0.02183738, 1, 0, 0.9529412, 1,
0.9848515, -0.7701896, 5.436819, 1, 0, 0.9490196, 1,
0.9869021, -1.018381, 1.988369, 1, 0, 0.9411765, 1,
0.9875311, 0.1880858, 0.7011977, 1, 0, 0.9372549, 1,
0.9880778, -0.1291489, 2.611799, 1, 0, 0.9294118, 1,
0.9902273, -0.8626523, 1.205019, 1, 0, 0.9254902, 1,
0.9917474, -0.8761854, 0.3112094, 1, 0, 0.9176471, 1,
0.995575, -0.6052279, 2.517857, 1, 0, 0.9137255, 1,
1.000439, 1.619367, 2.459036, 1, 0, 0.9058824, 1,
1.00192, 0.1074034, 2.794084, 1, 0, 0.9019608, 1,
1.010669, -1.171717, 1.718216, 1, 0, 0.8941177, 1,
1.014148, 0.7719976, 0.8100473, 1, 0, 0.8862745, 1,
1.014702, 0.5973726, 1.851045, 1, 0, 0.8823529, 1,
1.01765, -1.683687, 2.254212, 1, 0, 0.8745098, 1,
1.020377, -1.034741, 2.811826, 1, 0, 0.8705882, 1,
1.021917, 0.7471846, 1.341224, 1, 0, 0.8627451, 1,
1.022284, 0.6110792, 1.263062, 1, 0, 0.8588235, 1,
1.022746, 0.1697285, -0.07798896, 1, 0, 0.8509804, 1,
1.023094, 1.001004, 1.277818, 1, 0, 0.8470588, 1,
1.024298, -0.1239244, 1.240283, 1, 0, 0.8392157, 1,
1.032674, -0.06775137, 2.21763, 1, 0, 0.8352941, 1,
1.037148, 1.294735, 2.053179, 1, 0, 0.827451, 1,
1.040127, 1.059769, -0.4820848, 1, 0, 0.8235294, 1,
1.045521, 1.060616, 1.390629, 1, 0, 0.8156863, 1,
1.046845, -0.669782, 0.4396711, 1, 0, 0.8117647, 1,
1.047097, -1.33569, 2.440001, 1, 0, 0.8039216, 1,
1.049902, -0.6198813, 2.908383, 1, 0, 0.7960784, 1,
1.052871, 0.7665384, -0.4853608, 1, 0, 0.7921569, 1,
1.063055, 1.330925, 0.6363879, 1, 0, 0.7843137, 1,
1.064974, 0.007826642, 1.224003, 1, 0, 0.7803922, 1,
1.065895, 0.2968517, 1.416232, 1, 0, 0.772549, 1,
1.067402, -0.709655, 2.083169, 1, 0, 0.7686275, 1,
1.069099, 1.08323, 0.6431196, 1, 0, 0.7607843, 1,
1.074901, 0.2433693, 1.094436, 1, 0, 0.7568628, 1,
1.078377, -0.9972908, 2.463673, 1, 0, 0.7490196, 1,
1.083422, -0.9928246, 2.567312, 1, 0, 0.7450981, 1,
1.093999, -1.05775, 1.304564, 1, 0, 0.7372549, 1,
1.096154, 1.808808, 3.417693, 1, 0, 0.7333333, 1,
1.101115, -0.5542337, 1.321067, 1, 0, 0.7254902, 1,
1.101449, -1.302852, 2.430822, 1, 0, 0.7215686, 1,
1.108065, 1.116651, -0.07228132, 1, 0, 0.7137255, 1,
1.114043, -0.3681752, 1.173637, 1, 0, 0.7098039, 1,
1.118079, -0.7967758, 2.269581, 1, 0, 0.7019608, 1,
1.121055, 0.1250761, 0.8026376, 1, 0, 0.6941177, 1,
1.122517, -0.5058035, 0.9339858, 1, 0, 0.6901961, 1,
1.129526, -0.3754474, 3.077858, 1, 0, 0.682353, 1,
1.133174, -0.2568863, 3.262974, 1, 0, 0.6784314, 1,
1.134558, 1.338161, 1.993269, 1, 0, 0.6705883, 1,
1.135094, 1.6369, 0.1293722, 1, 0, 0.6666667, 1,
1.143042, 1.39945, -0.8775852, 1, 0, 0.6588235, 1,
1.143575, 0.3093039, 2.755783, 1, 0, 0.654902, 1,
1.15861, -1.093328, 2.079401, 1, 0, 0.6470588, 1,
1.160798, 0.5592437, 0.7601824, 1, 0, 0.6431373, 1,
1.178201, 0.1894659, 1.952187, 1, 0, 0.6352941, 1,
1.184753, -0.6201999, 2.792055, 1, 0, 0.6313726, 1,
1.196538, 0.5665364, 0.8493193, 1, 0, 0.6235294, 1,
1.20239, -1.754934, 1.64344, 1, 0, 0.6196079, 1,
1.207678, 2.803796, 0.3854277, 1, 0, 0.6117647, 1,
1.212893, -1.017645, 3.584285, 1, 0, 0.6078432, 1,
1.213094, 0.208472, 1.950427, 1, 0, 0.6, 1,
1.217909, 0.850835, 1.620457, 1, 0, 0.5921569, 1,
1.219968, -1.286545, 3.347501, 1, 0, 0.5882353, 1,
1.222801, 1.092799, 0.301192, 1, 0, 0.5803922, 1,
1.225133, 1.344556, -0.07589867, 1, 0, 0.5764706, 1,
1.238947, -0.7448525, 2.897995, 1, 0, 0.5686275, 1,
1.24752, -1.135923, 2.353141, 1, 0, 0.5647059, 1,
1.251993, 1.115693, 2.266078, 1, 0, 0.5568628, 1,
1.264428, -0.4603049, 0.915751, 1, 0, 0.5529412, 1,
1.268258, -1.201253, 1.351024, 1, 0, 0.5450981, 1,
1.268873, -1.182671, 2.553792, 1, 0, 0.5411765, 1,
1.269483, -0.3504862, 1.100904, 1, 0, 0.5333334, 1,
1.275202, -0.6230475, 2.571007, 1, 0, 0.5294118, 1,
1.287778, 0.2109413, 1.62254, 1, 0, 0.5215687, 1,
1.289863, -0.1161271, 0.9442236, 1, 0, 0.5176471, 1,
1.295096, 0.3708128, 1.979485, 1, 0, 0.509804, 1,
1.302304, 0.09826551, 2.98868, 1, 0, 0.5058824, 1,
1.305092, 0.8805053, 0.7277475, 1, 0, 0.4980392, 1,
1.307095, -1.939191, 3.357242, 1, 0, 0.4901961, 1,
1.307407, 0.1247632, 0.8164742, 1, 0, 0.4862745, 1,
1.311207, 0.9431202, 1.556369, 1, 0, 0.4784314, 1,
1.320623, 0.6087961, 0.9490739, 1, 0, 0.4745098, 1,
1.321527, -0.3855311, 1.596175, 1, 0, 0.4666667, 1,
1.328159, 0.6986924, 0.339147, 1, 0, 0.4627451, 1,
1.328543, 1.457059, 1.950436, 1, 0, 0.454902, 1,
1.336187, -2.124956, 2.126578, 1, 0, 0.4509804, 1,
1.357601, 1.165843, 2.81679, 1, 0, 0.4431373, 1,
1.393218, 0.4195943, 2.524147, 1, 0, 0.4392157, 1,
1.395972, 0.4764355, 1.366193, 1, 0, 0.4313726, 1,
1.42698, 0.7023227, 1.952499, 1, 0, 0.427451, 1,
1.429669, 2.426307, 0.377264, 1, 0, 0.4196078, 1,
1.43333, 1.017899, 0.8415942, 1, 0, 0.4156863, 1,
1.43605, -0.5863655, 3.560703, 1, 0, 0.4078431, 1,
1.439444, -0.7426991, 2.704283, 1, 0, 0.4039216, 1,
1.439555, 0.0495022, 0.7600257, 1, 0, 0.3960784, 1,
1.445234, 0.4378609, 1.377205, 1, 0, 0.3882353, 1,
1.448256, -1.251732, 3.341094, 1, 0, 0.3843137, 1,
1.452447, -0.403811, 1.503297, 1, 0, 0.3764706, 1,
1.452492, -0.04083218, 2.866343, 1, 0, 0.372549, 1,
1.465974, -1.377651, 2.226198, 1, 0, 0.3647059, 1,
1.468556, -0.9095157, 0.663471, 1, 0, 0.3607843, 1,
1.47447, -0.7729628, 3.652775, 1, 0, 0.3529412, 1,
1.498854, -0.3116558, 2.580213, 1, 0, 0.3490196, 1,
1.525521, 0.6285837, -1.054717, 1, 0, 0.3411765, 1,
1.53258, -0.09514847, 1.75423, 1, 0, 0.3372549, 1,
1.549996, -0.1093321, 1.784187, 1, 0, 0.3294118, 1,
1.550792, -0.6916208, 2.812622, 1, 0, 0.3254902, 1,
1.555967, 0.4522597, 1.475466, 1, 0, 0.3176471, 1,
1.556201, -0.6785113, 2.175979, 1, 0, 0.3137255, 1,
1.556798, -0.06940113, 1.628913, 1, 0, 0.3058824, 1,
1.561773, -0.3181219, 2.747339, 1, 0, 0.2980392, 1,
1.565845, -1.10782, 4.574449, 1, 0, 0.2941177, 1,
1.583912, -0.8239002, 4.197075, 1, 0, 0.2862745, 1,
1.586325, 0.4172645, 1.76238, 1, 0, 0.282353, 1,
1.587899, -1.266395, 2.784555, 1, 0, 0.2745098, 1,
1.593936, 0.2474598, 2.236878, 1, 0, 0.2705882, 1,
1.602592, -0.2540048, 3.48249, 1, 0, 0.2627451, 1,
1.60288, 0.6592498, 2.51612, 1, 0, 0.2588235, 1,
1.622826, -0.8492296, 1.883047, 1, 0, 0.2509804, 1,
1.630001, -0.3488954, 1.731331, 1, 0, 0.2470588, 1,
1.668611, 1.393327, 1.818007, 1, 0, 0.2392157, 1,
1.67631, 0.3557377, 2.258607, 1, 0, 0.2352941, 1,
1.695291, 0.8174065, 2.471786, 1, 0, 0.227451, 1,
1.713112, 0.4110662, 0.4451781, 1, 0, 0.2235294, 1,
1.728262, -0.09603465, 2.339497, 1, 0, 0.2156863, 1,
1.729643, 0.2153822, 2.113953, 1, 0, 0.2117647, 1,
1.765523, 0.2964861, 1.438094, 1, 0, 0.2039216, 1,
1.766306, 0.6017051, -0.2981177, 1, 0, 0.1960784, 1,
1.768122, 0.08000623, 0.7400774, 1, 0, 0.1921569, 1,
1.791833, 1.070907, 2.240218, 1, 0, 0.1843137, 1,
1.796549, 0.1791158, 2.611546, 1, 0, 0.1803922, 1,
1.822927, -0.6177639, 1.462025, 1, 0, 0.172549, 1,
1.827251, -0.3383957, 1.477268, 1, 0, 0.1686275, 1,
1.840282, -1.096505, 1.783634, 1, 0, 0.1607843, 1,
1.84365, -0.6662577, 1.256835, 1, 0, 0.1568628, 1,
1.863876, -0.9891102, 3.346889, 1, 0, 0.1490196, 1,
1.863966, 1.047969, 0.7830448, 1, 0, 0.145098, 1,
1.920878, -0.1409723, 3.598032, 1, 0, 0.1372549, 1,
1.934284, 0.5634609, -0.401415, 1, 0, 0.1333333, 1,
2.054308, 1.247432, 2.710157, 1, 0, 0.1254902, 1,
2.082825, 1.835983, 1.024108, 1, 0, 0.1215686, 1,
2.129138, -1.450045, 1.714959, 1, 0, 0.1137255, 1,
2.129562, -0.1276628, 3.243202, 1, 0, 0.1098039, 1,
2.135722, 0.2777601, 3.583114, 1, 0, 0.1019608, 1,
2.141174, -0.2605671, 2.062272, 1, 0, 0.09411765, 1,
2.161006, 0.6596656, 0.2390266, 1, 0, 0.09019608, 1,
2.186381, -1.363382, 1.501978, 1, 0, 0.08235294, 1,
2.193797, -1.479235, 1.224625, 1, 0, 0.07843138, 1,
2.208327, 0.2603762, 2.369598, 1, 0, 0.07058824, 1,
2.255342, -0.9585961, 2.206082, 1, 0, 0.06666667, 1,
2.259944, 0.9720345, 2.733902, 1, 0, 0.05882353, 1,
2.29269, -0.7498519, 1.329323, 1, 0, 0.05490196, 1,
2.338142, 0.2697387, 0.400598, 1, 0, 0.04705882, 1,
2.366932, 2.199142, 0.8752999, 1, 0, 0.04313726, 1,
2.432172, 0.4647795, 0.4948966, 1, 0, 0.03529412, 1,
2.433316, -1.151338, 2.92497, 1, 0, 0.03137255, 1,
2.568158, 1.10081, -0.7912512, 1, 0, 0.02352941, 1,
2.602355, 0.0009027925, 0.4248387, 1, 0, 0.01960784, 1,
2.701964, -1.063717, 1.362364, 1, 0, 0.01176471, 1,
2.837031, -0.7487721, 0.4270049, 1, 0, 0.007843138, 1
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
-0.335418, -4.106423, -7.339958, 0, -0.5, 0.5, 0.5,
-0.335418, -4.106423, -7.339958, 1, -0.5, 0.5, 0.5,
-0.335418, -4.106423, -7.339958, 1, 1.5, 0.5, 0.5,
-0.335418, -4.106423, -7.339958, 0, 1.5, 0.5, 0.5
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
-4.583327, -0.01208866, -7.339958, 0, -0.5, 0.5, 0.5,
-4.583327, -0.01208866, -7.339958, 1, -0.5, 0.5, 0.5,
-4.583327, -0.01208866, -7.339958, 1, 1.5, 0.5, 0.5,
-4.583327, -0.01208866, -7.339958, 0, 1.5, 0.5, 0.5
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
-4.583327, -4.106423, -0.02567673, 0, -0.5, 0.5, 0.5,
-4.583327, -4.106423, -0.02567673, 1, -0.5, 0.5, 0.5,
-4.583327, -4.106423, -0.02567673, 1, 1.5, 0.5, 0.5,
-4.583327, -4.106423, -0.02567673, 0, 1.5, 0.5, 0.5
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
-3, -3.161577, -5.652047,
2, -3.161577, -5.652047,
-3, -3.161577, -5.652047,
-3, -3.319051, -5.933365,
-2, -3.161577, -5.652047,
-2, -3.319051, -5.933365,
-1, -3.161577, -5.652047,
-1, -3.319051, -5.933365,
0, -3.161577, -5.652047,
0, -3.319051, -5.933365,
1, -3.161577, -5.652047,
1, -3.319051, -5.933365,
2, -3.161577, -5.652047,
2, -3.319051, -5.933365
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
-3, -3.634, -6.496003, 0, -0.5, 0.5, 0.5,
-3, -3.634, -6.496003, 1, -0.5, 0.5, 0.5,
-3, -3.634, -6.496003, 1, 1.5, 0.5, 0.5,
-3, -3.634, -6.496003, 0, 1.5, 0.5, 0.5,
-2, -3.634, -6.496003, 0, -0.5, 0.5, 0.5,
-2, -3.634, -6.496003, 1, -0.5, 0.5, 0.5,
-2, -3.634, -6.496003, 1, 1.5, 0.5, 0.5,
-2, -3.634, -6.496003, 0, 1.5, 0.5, 0.5,
-1, -3.634, -6.496003, 0, -0.5, 0.5, 0.5,
-1, -3.634, -6.496003, 1, -0.5, 0.5, 0.5,
-1, -3.634, -6.496003, 1, 1.5, 0.5, 0.5,
-1, -3.634, -6.496003, 0, 1.5, 0.5, 0.5,
0, -3.634, -6.496003, 0, -0.5, 0.5, 0.5,
0, -3.634, -6.496003, 1, -0.5, 0.5, 0.5,
0, -3.634, -6.496003, 1, 1.5, 0.5, 0.5,
0, -3.634, -6.496003, 0, 1.5, 0.5, 0.5,
1, -3.634, -6.496003, 0, -0.5, 0.5, 0.5,
1, -3.634, -6.496003, 1, -0.5, 0.5, 0.5,
1, -3.634, -6.496003, 1, 1.5, 0.5, 0.5,
1, -3.634, -6.496003, 0, 1.5, 0.5, 0.5,
2, -3.634, -6.496003, 0, -0.5, 0.5, 0.5,
2, -3.634, -6.496003, 1, -0.5, 0.5, 0.5,
2, -3.634, -6.496003, 1, 1.5, 0.5, 0.5,
2, -3.634, -6.496003, 0, 1.5, 0.5, 0.5
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
-3.60304, -3, -5.652047,
-3.60304, 3, -5.652047,
-3.60304, -3, -5.652047,
-3.766421, -3, -5.933365,
-3.60304, -2, -5.652047,
-3.766421, -2, -5.933365,
-3.60304, -1, -5.652047,
-3.766421, -1, -5.933365,
-3.60304, 0, -5.652047,
-3.766421, 0, -5.933365,
-3.60304, 1, -5.652047,
-3.766421, 1, -5.933365,
-3.60304, 2, -5.652047,
-3.766421, 2, -5.933365,
-3.60304, 3, -5.652047,
-3.766421, 3, -5.933365
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
-4.093184, -3, -6.496003, 0, -0.5, 0.5, 0.5,
-4.093184, -3, -6.496003, 1, -0.5, 0.5, 0.5,
-4.093184, -3, -6.496003, 1, 1.5, 0.5, 0.5,
-4.093184, -3, -6.496003, 0, 1.5, 0.5, 0.5,
-4.093184, -2, -6.496003, 0, -0.5, 0.5, 0.5,
-4.093184, -2, -6.496003, 1, -0.5, 0.5, 0.5,
-4.093184, -2, -6.496003, 1, 1.5, 0.5, 0.5,
-4.093184, -2, -6.496003, 0, 1.5, 0.5, 0.5,
-4.093184, -1, -6.496003, 0, -0.5, 0.5, 0.5,
-4.093184, -1, -6.496003, 1, -0.5, 0.5, 0.5,
-4.093184, -1, -6.496003, 1, 1.5, 0.5, 0.5,
-4.093184, -1, -6.496003, 0, 1.5, 0.5, 0.5,
-4.093184, 0, -6.496003, 0, -0.5, 0.5, 0.5,
-4.093184, 0, -6.496003, 1, -0.5, 0.5, 0.5,
-4.093184, 0, -6.496003, 1, 1.5, 0.5, 0.5,
-4.093184, 0, -6.496003, 0, 1.5, 0.5, 0.5,
-4.093184, 1, -6.496003, 0, -0.5, 0.5, 0.5,
-4.093184, 1, -6.496003, 1, -0.5, 0.5, 0.5,
-4.093184, 1, -6.496003, 1, 1.5, 0.5, 0.5,
-4.093184, 1, -6.496003, 0, 1.5, 0.5, 0.5,
-4.093184, 2, -6.496003, 0, -0.5, 0.5, 0.5,
-4.093184, 2, -6.496003, 1, -0.5, 0.5, 0.5,
-4.093184, 2, -6.496003, 1, 1.5, 0.5, 0.5,
-4.093184, 2, -6.496003, 0, 1.5, 0.5, 0.5,
-4.093184, 3, -6.496003, 0, -0.5, 0.5, 0.5,
-4.093184, 3, -6.496003, 1, -0.5, 0.5, 0.5,
-4.093184, 3, -6.496003, 1, 1.5, 0.5, 0.5,
-4.093184, 3, -6.496003, 0, 1.5, 0.5, 0.5
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
-3.60304, -3.161577, -4,
-3.60304, -3.161577, 4,
-3.60304, -3.161577, -4,
-3.766421, -3.319051, -4,
-3.60304, -3.161577, -2,
-3.766421, -3.319051, -2,
-3.60304, -3.161577, 0,
-3.766421, -3.319051, 0,
-3.60304, -3.161577, 2,
-3.766421, -3.319051, 2,
-3.60304, -3.161577, 4,
-3.766421, -3.319051, 4
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
-4.093184, -3.634, -4, 0, -0.5, 0.5, 0.5,
-4.093184, -3.634, -4, 1, -0.5, 0.5, 0.5,
-4.093184, -3.634, -4, 1, 1.5, 0.5, 0.5,
-4.093184, -3.634, -4, 0, 1.5, 0.5, 0.5,
-4.093184, -3.634, -2, 0, -0.5, 0.5, 0.5,
-4.093184, -3.634, -2, 1, -0.5, 0.5, 0.5,
-4.093184, -3.634, -2, 1, 1.5, 0.5, 0.5,
-4.093184, -3.634, -2, 0, 1.5, 0.5, 0.5,
-4.093184, -3.634, 0, 0, -0.5, 0.5, 0.5,
-4.093184, -3.634, 0, 1, -0.5, 0.5, 0.5,
-4.093184, -3.634, 0, 1, 1.5, 0.5, 0.5,
-4.093184, -3.634, 0, 0, 1.5, 0.5, 0.5,
-4.093184, -3.634, 2, 0, -0.5, 0.5, 0.5,
-4.093184, -3.634, 2, 1, -0.5, 0.5, 0.5,
-4.093184, -3.634, 2, 1, 1.5, 0.5, 0.5,
-4.093184, -3.634, 2, 0, 1.5, 0.5, 0.5,
-4.093184, -3.634, 4, 0, -0.5, 0.5, 0.5,
-4.093184, -3.634, 4, 1, -0.5, 0.5, 0.5,
-4.093184, -3.634, 4, 1, 1.5, 0.5, 0.5,
-4.093184, -3.634, 4, 0, 1.5, 0.5, 0.5
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
-3.60304, -3.161577, -5.652047,
-3.60304, 3.1374, -5.652047,
-3.60304, -3.161577, 5.600693,
-3.60304, 3.1374, 5.600693,
-3.60304, -3.161577, -5.652047,
-3.60304, -3.161577, 5.600693,
-3.60304, 3.1374, -5.652047,
-3.60304, 3.1374, 5.600693,
-3.60304, -3.161577, -5.652047,
2.932204, -3.161577, -5.652047,
-3.60304, -3.161577, 5.600693,
2.932204, -3.161577, 5.600693,
-3.60304, 3.1374, -5.652047,
2.932204, 3.1374, -5.652047,
-3.60304, 3.1374, 5.600693,
2.932204, 3.1374, 5.600693,
2.932204, -3.161577, -5.652047,
2.932204, 3.1374, -5.652047,
2.932204, -3.161577, 5.600693,
2.932204, 3.1374, 5.600693,
2.932204, -3.161577, -5.652047,
2.932204, -3.161577, 5.600693,
2.932204, 3.1374, -5.652047,
2.932204, 3.1374, 5.600693
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
var radius = 7.719865;
var distance = 34.34655;
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
mvMatrix.translate( 0.335418, 0.01208866, 0.02567673 );
mvMatrix.scale( 1.277208, 1.325115, 0.7417632 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.34655);
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
bromophos_ethyl<-read.table("bromophos_ethyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-bromophos_ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'bromophos_ethyl' not found
```

```r
y<-bromophos_ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'bromophos_ethyl' not found
```

```r
z<-bromophos_ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'bromophos_ethyl' not found
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
-3.507867, -0.2919487, -1.375105, 0, 0, 1, 1, 1,
-3.207734, 0.1775031, -3.446632, 1, 0, 0, 1, 1,
-2.804204, 0.3735768, -0.9365864, 1, 0, 0, 1, 1,
-2.712517, -1.411425, -2.223024, 1, 0, 0, 1, 1,
-2.669504, 1.932321, -0.2071974, 1, 0, 0, 1, 1,
-2.617384, 0.1409237, -0.992177, 1, 0, 0, 1, 1,
-2.603931, 0.2354982, -0.4516557, 0, 0, 0, 1, 1,
-2.570694, -0.1263309, -2.371799, 0, 0, 0, 1, 1,
-2.520144, -0.535418, -1.804456, 0, 0, 0, 1, 1,
-2.486483, 0.4456793, -1.473238, 0, 0, 0, 1, 1,
-2.267479, 1.71513, 1.087453, 0, 0, 0, 1, 1,
-2.241073, 1.059645, -2.423285, 0, 0, 0, 1, 1,
-2.210754, 0.09477822, -2.80839, 0, 0, 0, 1, 1,
-2.195729, -0.3304787, -2.979468, 1, 1, 1, 1, 1,
-2.17809, 0.5434052, -1.241262, 1, 1, 1, 1, 1,
-2.150735, 0.1273144, -1.976423, 1, 1, 1, 1, 1,
-2.137921, -0.5587871, -0.7785499, 1, 1, 1, 1, 1,
-2.132281, 2.071151, -0.6177709, 1, 1, 1, 1, 1,
-2.103612, 1.124416, -1.039722, 1, 1, 1, 1, 1,
-2.075141, 0.2536229, -3.292608, 1, 1, 1, 1, 1,
-2.026619, 0.2128421, -1.122562, 1, 1, 1, 1, 1,
-2.000838, -0.180626, -2.12815, 1, 1, 1, 1, 1,
-1.961951, 1.754559, -1.272128, 1, 1, 1, 1, 1,
-1.954564, 0.002643113, -1.756905, 1, 1, 1, 1, 1,
-1.934285, 2.003166, 0.7826471, 1, 1, 1, 1, 1,
-1.922261, 0.1157329, -0.1371756, 1, 1, 1, 1, 1,
-1.91494, 2.186512, -1.229512, 1, 1, 1, 1, 1,
-1.914814, -1.776753, -2.535232, 1, 1, 1, 1, 1,
-1.908833, 0.232088, -0.9887067, 0, 0, 1, 1, 1,
-1.899928, 0.04610166, -0.5563804, 1, 0, 0, 1, 1,
-1.87916, -0.9581586, -0.9215857, 1, 0, 0, 1, 1,
-1.877897, -0.1880739, -2.074118, 1, 0, 0, 1, 1,
-1.853718, -1.330459, -2.658892, 1, 0, 0, 1, 1,
-1.850024, -0.8562898, -0.4727598, 1, 0, 0, 1, 1,
-1.836942, -0.2211524, -1.195059, 0, 0, 0, 1, 1,
-1.808003, -0.9548694, -2.515175, 0, 0, 0, 1, 1,
-1.786382, 0.5242513, 0.6071106, 0, 0, 0, 1, 1,
-1.77267, -0.1072662, -0.02542039, 0, 0, 0, 1, 1,
-1.768072, -0.09288426, -2.193022, 0, 0, 0, 1, 1,
-1.740756, -1.105746, -1.529133, 0, 0, 0, 1, 1,
-1.716795, -0.8989696, -1.635638, 0, 0, 0, 1, 1,
-1.69588, 0.9837883, -1.379729, 1, 1, 1, 1, 1,
-1.692918, 0.6572576, -0.1217211, 1, 1, 1, 1, 1,
-1.692147, 1.433193, -1.171324, 1, 1, 1, 1, 1,
-1.681583, 0.5615776, -2.667063, 1, 1, 1, 1, 1,
-1.673956, -1.124326, -1.376603, 1, 1, 1, 1, 1,
-1.661394, -0.7123972, -2.991544, 1, 1, 1, 1, 1,
-1.658648, -0.7484086, -0.3738908, 1, 1, 1, 1, 1,
-1.658123, -0.9301996, -2.426354, 1, 1, 1, 1, 1,
-1.652181, 1.040769, -1.215873, 1, 1, 1, 1, 1,
-1.63796, -1.518147, -1.654029, 1, 1, 1, 1, 1,
-1.626415, 0.1749852, -2.358988, 1, 1, 1, 1, 1,
-1.622477, -0.2222469, 0.2076144, 1, 1, 1, 1, 1,
-1.613379, 1.178515, -0.9933916, 1, 1, 1, 1, 1,
-1.611256, -0.4247554, -1.820653, 1, 1, 1, 1, 1,
-1.589935, -0.4317184, -1.211184, 1, 1, 1, 1, 1,
-1.587677, 2.46247, -0.8926149, 0, 0, 1, 1, 1,
-1.561772, -0.465858, -1.430103, 1, 0, 0, 1, 1,
-1.547783, -0.1144559, -0.9455927, 1, 0, 0, 1, 1,
-1.546987, 0.1849982, -0.6409963, 1, 0, 0, 1, 1,
-1.538044, -2.6406, -1.939333, 1, 0, 0, 1, 1,
-1.517979, -0.6755102, -2.434582, 1, 0, 0, 1, 1,
-1.51307, -1.871653, -2.159031, 0, 0, 0, 1, 1,
-1.5113, -0.610629, -0.5620527, 0, 0, 0, 1, 1,
-1.501912, -0.1396043, -1.629272, 0, 0, 0, 1, 1,
-1.479343, 0.2217576, -1.21871, 0, 0, 0, 1, 1,
-1.477039, 1.253037, -3.282285, 0, 0, 0, 1, 1,
-1.456448, -0.616493, -3.515285, 0, 0, 0, 1, 1,
-1.439894, -0.5937044, -2.31348, 0, 0, 0, 1, 1,
-1.432999, 1.86022, -0.6056393, 1, 1, 1, 1, 1,
-1.420652, -0.09578557, -2.598774, 1, 1, 1, 1, 1,
-1.413748, -0.009751691, -0.7327262, 1, 1, 1, 1, 1,
-1.40602, -0.8445584, -2.726501, 1, 1, 1, 1, 1,
-1.388522, -0.2706218, -2.327406, 1, 1, 1, 1, 1,
-1.383084, 1.090599, -1.675065, 1, 1, 1, 1, 1,
-1.38149, -1.25405, -1.448632, 1, 1, 1, 1, 1,
-1.381052, -0.3751255, -2.511622, 1, 1, 1, 1, 1,
-1.376198, 0.06863335, -2.759357, 1, 1, 1, 1, 1,
-1.371705, 0.6314272, -3.000718, 1, 1, 1, 1, 1,
-1.371216, 0.2596612, -0.2243146, 1, 1, 1, 1, 1,
-1.347159, 0.6206845, 0.1243737, 1, 1, 1, 1, 1,
-1.337193, 0.1450558, -0.7570653, 1, 1, 1, 1, 1,
-1.336574, -0.225139, -1.570277, 1, 1, 1, 1, 1,
-1.334097, -1.400543, -0.916612, 1, 1, 1, 1, 1,
-1.33135, -0.871756, -0.3572405, 0, 0, 1, 1, 1,
-1.325903, -0.6012346, -2.291102, 1, 0, 0, 1, 1,
-1.318829, 0.09599959, -2.305112, 1, 0, 0, 1, 1,
-1.31584, 2.213945, 0.1697859, 1, 0, 0, 1, 1,
-1.315452, 2.533329, -0.7950075, 1, 0, 0, 1, 1,
-1.314842, -0.8151432, -1.309022, 1, 0, 0, 1, 1,
-1.307581, 0.8211523, -0.2488899, 0, 0, 0, 1, 1,
-1.301111, -0.1731598, -2.46306, 0, 0, 0, 1, 1,
-1.300433, 0.08150932, -1.086173, 0, 0, 0, 1, 1,
-1.299229, -0.8995612, -2.923212, 0, 0, 0, 1, 1,
-1.297352, 0.3813175, -2.488346, 0, 0, 0, 1, 1,
-1.293781, -1.33862, -2.521048, 0, 0, 0, 1, 1,
-1.29074, 0.5396149, -2.872366, 0, 0, 0, 1, 1,
-1.287931, -0.86333, -2.032663, 1, 1, 1, 1, 1,
-1.283065, -2.978275, -3.291418, 1, 1, 1, 1, 1,
-1.279601, -1.738498, -0.8362598, 1, 1, 1, 1, 1,
-1.257399, 1.709074, 0.07696814, 1, 1, 1, 1, 1,
-1.251921, 0.3612581, -0.4951801, 1, 1, 1, 1, 1,
-1.251043, -2.025282, -2.212631, 1, 1, 1, 1, 1,
-1.246084, 0.341289, -1.698637, 1, 1, 1, 1, 1,
-1.243973, -0.5330293, -3.539182, 1, 1, 1, 1, 1,
-1.235517, 0.07285642, -1.849424, 1, 1, 1, 1, 1,
-1.23422, 0.1681199, 0.4211453, 1, 1, 1, 1, 1,
-1.224292, 0.619361, 1.876204, 1, 1, 1, 1, 1,
-1.223957, -1.161757, -2.55913, 1, 1, 1, 1, 1,
-1.203153, 1.478752, 0.6427274, 1, 1, 1, 1, 1,
-1.200443, 0.1137238, 0.6476269, 1, 1, 1, 1, 1,
-1.196094, 1.823759, -2.451829, 1, 1, 1, 1, 1,
-1.19505, 1.351012, -0.9308391, 0, 0, 1, 1, 1,
-1.192502, 0.4968407, -0.4414334, 1, 0, 0, 1, 1,
-1.191561, 0.9006445, 0.9473116, 1, 0, 0, 1, 1,
-1.190311, -0.1736104, -1.32833, 1, 0, 0, 1, 1,
-1.185697, 0.6692497, -1.803201, 1, 0, 0, 1, 1,
-1.171855, 0.0635, -1.654341, 1, 0, 0, 1, 1,
-1.167763, 1.027836, 1.226354, 0, 0, 0, 1, 1,
-1.166113, -1.236849, 0.03376227, 0, 0, 0, 1, 1,
-1.163658, 0.3049425, -2.248113, 0, 0, 0, 1, 1,
-1.163182, 0.5700685, -0.3357182, 0, 0, 0, 1, 1,
-1.157406, 0.03269032, -1.128078, 0, 0, 0, 1, 1,
-1.144557, -0.1229718, -2.711218, 0, 0, 0, 1, 1,
-1.142706, -0.3036703, -1.253715, 0, 0, 0, 1, 1,
-1.142159, -0.3388201, -2.430863, 1, 1, 1, 1, 1,
-1.12753, 0.472179, 0.6136862, 1, 1, 1, 1, 1,
-1.124963, -2.055768, -2.473982, 1, 1, 1, 1, 1,
-1.120685, 0.2888859, -0.8036065, 1, 1, 1, 1, 1,
-1.116827, 0.6866839, -0.106609, 1, 1, 1, 1, 1,
-1.113559, 0.454605, -1.783727, 1, 1, 1, 1, 1,
-1.110197, -0.6552624, -1.811254, 1, 1, 1, 1, 1,
-1.109267, -0.4306321, 0.37026, 1, 1, 1, 1, 1,
-1.10747, 1.605841, -0.8776029, 1, 1, 1, 1, 1,
-1.099889, -0.4211543, -2.943581, 1, 1, 1, 1, 1,
-1.098732, 0.06542588, -1.949266, 1, 1, 1, 1, 1,
-1.097739, -0.1116279, -0.4420914, 1, 1, 1, 1, 1,
-1.095579, -0.8255567, -1.246236, 1, 1, 1, 1, 1,
-1.094366, 0.9953188, -1.69575, 1, 1, 1, 1, 1,
-1.087752, -1.006247, -3.135432, 1, 1, 1, 1, 1,
-1.085426, 1.595191, 0.4266646, 0, 0, 1, 1, 1,
-1.077991, 0.7250798, 0.5060477, 1, 0, 0, 1, 1,
-1.073978, -0.9390664, -1.647936, 1, 0, 0, 1, 1,
-1.073584, 1.316434, -0.9251657, 1, 0, 0, 1, 1,
-1.072164, 0.4083881, 0.3516311, 1, 0, 0, 1, 1,
-1.070796, 0.2087567, -1.061623, 1, 0, 0, 1, 1,
-1.069543, -0.09283869, -2.473064, 0, 0, 0, 1, 1,
-1.056097, 0.1304664, -3.310227, 0, 0, 0, 1, 1,
-1.053098, -0.4593637, -3.06525, 0, 0, 0, 1, 1,
-1.045198, 0.8774863, -0.01360665, 0, 0, 0, 1, 1,
-1.044189, 0.8993416, 1.328019, 0, 0, 0, 1, 1,
-1.03922, 0.1100219, -1.026049, 0, 0, 0, 1, 1,
-1.038751, 2.238574, -0.9736834, 0, 0, 0, 1, 1,
-1.037531, -0.5836598, -1.71402, 1, 1, 1, 1, 1,
-1.030595, 0.3010457, -3.120525, 1, 1, 1, 1, 1,
-1.025931, 0.3730447, -2.468191, 1, 1, 1, 1, 1,
-1.021094, -0.7293503, -3.655738, 1, 1, 1, 1, 1,
-1.020189, 0.4183653, -0.6859779, 1, 1, 1, 1, 1,
-1.019949, 0.3467989, -2.197658, 1, 1, 1, 1, 1,
-1.017876, -0.6534207, -2.700844, 1, 1, 1, 1, 1,
-1.017397, 0.04132421, -1.733372, 1, 1, 1, 1, 1,
-1.015443, 0.8821618, -0.442202, 1, 1, 1, 1, 1,
-1.005345, -1.085351, -2.240466, 1, 1, 1, 1, 1,
-1.002961, -0.1454426, -1.766697, 1, 1, 1, 1, 1,
-0.9953043, 0.03961288, -2.200238, 1, 1, 1, 1, 1,
-0.9920698, 0.4663568, -1.489216, 1, 1, 1, 1, 1,
-0.9903757, 1.047892, 0.08069405, 1, 1, 1, 1, 1,
-0.9835443, 1.373459, 0.1651229, 1, 1, 1, 1, 1,
-0.9818236, -0.8628107, -2.890096, 0, 0, 1, 1, 1,
-0.9747655, -0.2274525, -0.3377865, 1, 0, 0, 1, 1,
-0.9729456, 0.2322673, -0.7348954, 1, 0, 0, 1, 1,
-0.968336, -1.560767, -3.460622, 1, 0, 0, 1, 1,
-0.9681525, 0.7573749, -0.7925197, 1, 0, 0, 1, 1,
-0.967365, -0.741329, -0.5227809, 1, 0, 0, 1, 1,
-0.9657108, -1.797656, -1.079612, 0, 0, 0, 1, 1,
-0.960425, -1.221912, -2.907224, 0, 0, 0, 1, 1,
-0.9590765, -0.2933858, -1.497603, 0, 0, 0, 1, 1,
-0.9573856, 0.6043295, -1.005897, 0, 0, 0, 1, 1,
-0.9552198, 0.7590409, -1.294499, 0, 0, 0, 1, 1,
-0.9521958, 0.484889, -2.253059, 0, 0, 0, 1, 1,
-0.9489164, -1.122748, -1.942967, 0, 0, 0, 1, 1,
-0.9421105, -1.284194, -3.1089, 1, 1, 1, 1, 1,
-0.937265, 0.5605275, -1.89596, 1, 1, 1, 1, 1,
-0.9348519, 1.312753, 0.6171066, 1, 1, 1, 1, 1,
-0.9333191, -1.482236, -1.293421, 1, 1, 1, 1, 1,
-0.9317487, 0.1242926, -0.6184956, 1, 1, 1, 1, 1,
-0.9297125, 0.2570667, 0.6840823, 1, 1, 1, 1, 1,
-0.9288687, -1.64335, -2.530673, 1, 1, 1, 1, 1,
-0.9162542, -0.5974175, -2.865577, 1, 1, 1, 1, 1,
-0.9085258, -0.8214464, -0.7598789, 1, 1, 1, 1, 1,
-0.9072506, -0.8570324, 0.5814579, 1, 1, 1, 1, 1,
-0.9056913, -0.7529154, -1.982945, 1, 1, 1, 1, 1,
-0.9025326, 1.29362, -1.301884, 1, 1, 1, 1, 1,
-0.8944067, 0.1869122, -1.62427, 1, 1, 1, 1, 1,
-0.8889961, -1.073513, -0.8441958, 1, 1, 1, 1, 1,
-0.8850532, 1.413911, -0.02659701, 1, 1, 1, 1, 1,
-0.8846609, -0.3681476, -0.1622598, 0, 0, 1, 1, 1,
-0.8831233, -0.1686547, -2.885211, 1, 0, 0, 1, 1,
-0.8737367, -0.1974094, -1.442393, 1, 0, 0, 1, 1,
-0.8720271, 0.2355472, -3.196649, 1, 0, 0, 1, 1,
-0.8705515, 0.196064, 0.3780648, 1, 0, 0, 1, 1,
-0.8690554, 2.070408, -0.868994, 1, 0, 0, 1, 1,
-0.8686013, -0.5375395, -2.689379, 0, 0, 0, 1, 1,
-0.860189, 1.077061, -0.4430721, 0, 0, 0, 1, 1,
-0.8599602, -0.3341857, -3.423015, 0, 0, 0, 1, 1,
-0.8562953, -0.4250382, -1.498315, 0, 0, 0, 1, 1,
-0.8553975, -0.6033632, -3.008441, 0, 0, 0, 1, 1,
-0.8539039, -0.4736941, -4.091451, 0, 0, 0, 1, 1,
-0.8523155, -1.52972, -2.022328, 0, 0, 0, 1, 1,
-0.847243, 0.825134, -0.3427588, 1, 1, 1, 1, 1,
-0.8296213, 0.1296465, -2.031375, 1, 1, 1, 1, 1,
-0.8282744, -1.346381, -1.81436, 1, 1, 1, 1, 1,
-0.8256716, -1.361362, -1.550053, 1, 1, 1, 1, 1,
-0.8256354, -0.3057764, -0.8111722, 1, 1, 1, 1, 1,
-0.8196635, -0.3493422, -2.515709, 1, 1, 1, 1, 1,
-0.8187546, 0.5098871, -2.78331, 1, 1, 1, 1, 1,
-0.813283, 1.357772, -0.7104216, 1, 1, 1, 1, 1,
-0.809755, 0.4200426, -0.8462687, 1, 1, 1, 1, 1,
-0.8020819, 2.11678, -2.185431, 1, 1, 1, 1, 1,
-0.7961167, 0.8364941, -1.417981, 1, 1, 1, 1, 1,
-0.7857672, 0.7577505, -0.6889667, 1, 1, 1, 1, 1,
-0.7848108, -0.3677948, -2.501544, 1, 1, 1, 1, 1,
-0.7822111, 1.438954, -0.8967906, 1, 1, 1, 1, 1,
-0.7764884, 1.534692, 0.3168943, 1, 1, 1, 1, 1,
-0.7761616, -0.8013414, -2.971267, 0, 0, 1, 1, 1,
-0.7759619, 0.4434303, 0.01825813, 1, 0, 0, 1, 1,
-0.7697108, 0.4399692, -1.46215, 1, 0, 0, 1, 1,
-0.769669, -0.6190616, -3.388196, 1, 0, 0, 1, 1,
-0.7643178, 0.6661425, -1.949858, 1, 0, 0, 1, 1,
-0.7636477, -1.214494, -2.249413, 1, 0, 0, 1, 1,
-0.7619663, 0.8188837, -0.6719298, 0, 0, 0, 1, 1,
-0.7616609, -0.5191722, -1.620854, 0, 0, 0, 1, 1,
-0.7543513, -2.460981, -2.416018, 0, 0, 0, 1, 1,
-0.7530327, 0.6979505, -0.2625362, 0, 0, 0, 1, 1,
-0.7522407, -0.1414711, -1.627974, 0, 0, 0, 1, 1,
-0.7494203, -0.2645106, -2.199778, 0, 0, 0, 1, 1,
-0.7469938, -1.158697, -3.18453, 0, 0, 0, 1, 1,
-0.7436907, -0.4384364, -2.767009, 1, 1, 1, 1, 1,
-0.742038, 0.258468, -1.016562, 1, 1, 1, 1, 1,
-0.7362578, -0.5653649, -2.923048, 1, 1, 1, 1, 1,
-0.7353634, 0.5954169, 0.4913901, 1, 1, 1, 1, 1,
-0.7234687, 0.6084025, -1.638795, 1, 1, 1, 1, 1,
-0.7203482, -0.9331082, -0.8879578, 1, 1, 1, 1, 1,
-0.7069737, -0.9736045, -2.974627, 1, 1, 1, 1, 1,
-0.7067474, -0.1365544, -1.987049, 1, 1, 1, 1, 1,
-0.7049216, 0.1439806, -1.59561, 1, 1, 1, 1, 1,
-0.6979397, 1.685665, -1.063531, 1, 1, 1, 1, 1,
-0.6975172, 1.021966, -0.1380259, 1, 1, 1, 1, 1,
-0.6959343, 1.236085, -0.05994217, 1, 1, 1, 1, 1,
-0.693718, 0.8080789, -0.001710453, 1, 1, 1, 1, 1,
-0.6882497, 0.1708892, -1.780603, 1, 1, 1, 1, 1,
-0.6873838, -0.2885094, -1.416752, 1, 1, 1, 1, 1,
-0.6819634, 1.573042, 0.4492728, 0, 0, 1, 1, 1,
-0.6819065, -0.4895793, -3.635696, 1, 0, 0, 1, 1,
-0.681669, 1.266997, -1.003226, 1, 0, 0, 1, 1,
-0.6733183, 1.628729, -0.6221157, 1, 0, 0, 1, 1,
-0.6726589, 0.5124492, -0.9256429, 1, 0, 0, 1, 1,
-0.6621816, -0.6743738, -3.13868, 1, 0, 0, 1, 1,
-0.6592136, -1.705623, -1.399366, 0, 0, 0, 1, 1,
-0.656129, 1.624853, -0.9505859, 0, 0, 0, 1, 1,
-0.6555105, -0.6882024, -3.317983, 0, 0, 0, 1, 1,
-0.6533907, 0.7227968, 2.217607, 0, 0, 0, 1, 1,
-0.6462607, 2.739835, -0.1637122, 0, 0, 0, 1, 1,
-0.6456356, -1.239461, -3.072828, 0, 0, 0, 1, 1,
-0.642814, -1.131145, -2.565526, 0, 0, 0, 1, 1,
-0.6396721, -0.6395911, -2.820701, 1, 1, 1, 1, 1,
-0.6355463, -0.3664966, -2.150253, 1, 1, 1, 1, 1,
-0.6313894, -0.4233583, -1.923489, 1, 1, 1, 1, 1,
-0.631225, -0.05327066, -1.532012, 1, 1, 1, 1, 1,
-0.6304616, 0.2331635, -0.4643655, 1, 1, 1, 1, 1,
-0.6268128, 1.767148, 1.741868, 1, 1, 1, 1, 1,
-0.6267882, 0.003862653, -0.7949013, 1, 1, 1, 1, 1,
-0.6236613, -0.1179822, 0.150681, 1, 1, 1, 1, 1,
-0.6139817, 0.4607413, -0.6687721, 1, 1, 1, 1, 1,
-0.6119196, 1.224841, 0.1635293, 1, 1, 1, 1, 1,
-0.6069838, 0.08531046, -1.70621, 1, 1, 1, 1, 1,
-0.6063992, 0.1815575, -0.5756308, 1, 1, 1, 1, 1,
-0.5989322, 0.5888565, -1.222517, 1, 1, 1, 1, 1,
-0.594534, 1.06364, 0.7979382, 1, 1, 1, 1, 1,
-0.5871198, 1.286345, 0.6850474, 1, 1, 1, 1, 1,
-0.582247, -0.02501469, -3.115611, 0, 0, 1, 1, 1,
-0.5816718, -1.011656, -4.531515, 1, 0, 0, 1, 1,
-0.5808392, 0.2346041, -1.631719, 1, 0, 0, 1, 1,
-0.5775922, 0.5249732, -0.8385929, 1, 0, 0, 1, 1,
-0.5755398, 0.2527052, -1.902884, 1, 0, 0, 1, 1,
-0.5743147, 0.8247305, -1.562057, 1, 0, 0, 1, 1,
-0.572871, 0.03587295, -2.537468, 0, 0, 0, 1, 1,
-0.5714467, -0.7110178, -2.482148, 0, 0, 0, 1, 1,
-0.5659621, 1.0343, -0.0146098, 0, 0, 0, 1, 1,
-0.5641844, 0.341913, -0.5721716, 0, 0, 0, 1, 1,
-0.5575902, -0.777807, -4.158823, 0, 0, 0, 1, 1,
-0.5527709, -1.868188, -0.9231975, 0, 0, 0, 1, 1,
-0.5507042, 1.688262, -1.001561, 0, 0, 0, 1, 1,
-0.5480308, -1.072072, -4.839936, 1, 1, 1, 1, 1,
-0.5462359, -0.2982978, -2.09322, 1, 1, 1, 1, 1,
-0.5444758, -0.8606051, -3.234515, 1, 1, 1, 1, 1,
-0.5406177, 0.4366772, -2.416557, 1, 1, 1, 1, 1,
-0.5387738, 0.3758616, -1.005229, 1, 1, 1, 1, 1,
-0.5320152, -0.1928703, -3.389585, 1, 1, 1, 1, 1,
-0.5309041, 0.3673302, -1.983044, 1, 1, 1, 1, 1,
-0.5246324, -0.647096, -1.390741, 1, 1, 1, 1, 1,
-0.524129, -1.345629, -3.674382, 1, 1, 1, 1, 1,
-0.523586, 0.5591393, -0.5877658, 1, 1, 1, 1, 1,
-0.5229538, -1.919543, -1.709732, 1, 1, 1, 1, 1,
-0.5218694, -0.2096214, -1.665446, 1, 1, 1, 1, 1,
-0.5209016, 1.122695, -0.6207967, 1, 1, 1, 1, 1,
-0.5187044, -0.3431577, -2.431039, 1, 1, 1, 1, 1,
-0.517746, 0.6319253, -1.376194, 1, 1, 1, 1, 1,
-0.516027, -0.5143161, -2.419103, 0, 0, 1, 1, 1,
-0.5153879, 1.00596, -0.3350722, 1, 0, 0, 1, 1,
-0.511389, -0.3177024, -1.679922, 1, 0, 0, 1, 1,
-0.5073887, -1.19856, -2.466294, 1, 0, 0, 1, 1,
-0.5064688, 0.4856605, 0.06233288, 1, 0, 0, 1, 1,
-0.5029596, 0.990125, -0.7704239, 1, 0, 0, 1, 1,
-0.5020928, 0.5435501, -1.013796, 0, 0, 0, 1, 1,
-0.5015603, -2.135596, -3.335891, 0, 0, 0, 1, 1,
-0.5007855, 0.9285396, -1.689614, 0, 0, 0, 1, 1,
-0.5002675, -0.3532112, -3.457594, 0, 0, 0, 1, 1,
-0.4982728, 1.933795, -0.06911296, 0, 0, 0, 1, 1,
-0.4953155, 0.04819113, -0.8280548, 0, 0, 0, 1, 1,
-0.4944141, -0.1603708, -0.5126711, 0, 0, 0, 1, 1,
-0.484032, -1.053115, -2.607054, 1, 1, 1, 1, 1,
-0.4839601, -0.5225309, -2.866817, 1, 1, 1, 1, 1,
-0.4810018, -0.6369906, -3.465973, 1, 1, 1, 1, 1,
-0.4804045, -2.115258, -3.404965, 1, 1, 1, 1, 1,
-0.4784722, 0.6936871, 0.0613573, 1, 1, 1, 1, 1,
-0.4774097, 1.971472, 0.2435879, 1, 1, 1, 1, 1,
-0.4765864, 0.4553649, 0.8947145, 1, 1, 1, 1, 1,
-0.4746845, -1.847026, -3.240669, 1, 1, 1, 1, 1,
-0.4667941, -0.5029416, -2.749087, 1, 1, 1, 1, 1,
-0.4653621, 0.1760946, -0.9587041, 1, 1, 1, 1, 1,
-0.4652115, -0.7277966, -2.214205, 1, 1, 1, 1, 1,
-0.4635325, -0.6155727, -3.586608, 1, 1, 1, 1, 1,
-0.4534991, -0.7693538, -2.523147, 1, 1, 1, 1, 1,
-0.4409697, 1.352846, 0.1219026, 1, 1, 1, 1, 1,
-0.439967, -0.2017259, -1.568938, 1, 1, 1, 1, 1,
-0.4395143, -0.3992537, -0.913671, 0, 0, 1, 1, 1,
-0.4368111, -0.7786659, -1.780321, 1, 0, 0, 1, 1,
-0.4347349, 0.294143, -0.1676927, 1, 0, 0, 1, 1,
-0.4261605, 0.52627, 1.231386, 1, 0, 0, 1, 1,
-0.4232526, -1.278142, -2.97019, 1, 0, 0, 1, 1,
-0.4205091, -0.2825362, -3.231059, 1, 0, 0, 1, 1,
-0.4153966, -0.1400858, -1.384025, 0, 0, 0, 1, 1,
-0.4122447, -1.131937, -2.512431, 0, 0, 0, 1, 1,
-0.4118215, -2.396275, -2.716151, 0, 0, 0, 1, 1,
-0.40525, -1.097703, -3.337106, 0, 0, 0, 1, 1,
-0.4037009, -2.193372, -1.959827, 0, 0, 0, 1, 1,
-0.4032826, 0.6955714, 0.01932205, 0, 0, 0, 1, 1,
-0.4001522, -0.8402466, -3.257552, 0, 0, 0, 1, 1,
-0.3995144, 0.2278431, -1.354077, 1, 1, 1, 1, 1,
-0.3913655, -1.550504, -2.046393, 1, 1, 1, 1, 1,
-0.3902587, -1.04789, -2.149332, 1, 1, 1, 1, 1,
-0.3869595, 0.6685705, -2.340599, 1, 1, 1, 1, 1,
-0.3859648, -0.1128878, -1.438334, 1, 1, 1, 1, 1,
-0.3820694, -0.0228699, -2.744598, 1, 1, 1, 1, 1,
-0.3800776, -0.5196484, -2.02694, 1, 1, 1, 1, 1,
-0.3797455, -1.122894, -3.268098, 1, 1, 1, 1, 1,
-0.3789768, 0.09691903, 0.7929384, 1, 1, 1, 1, 1,
-0.3672677, -1.216415, -2.474384, 1, 1, 1, 1, 1,
-0.366854, 0.1817758, -2.230193, 1, 1, 1, 1, 1,
-0.3661961, 1.582004, 0.2293643, 1, 1, 1, 1, 1,
-0.3641913, 0.7857338, -1.019578, 1, 1, 1, 1, 1,
-0.3613032, -0.2803206, -2.419947, 1, 1, 1, 1, 1,
-0.3584743, 0.4569333, -0.4435136, 1, 1, 1, 1, 1,
-0.355823, 0.4046205, 0.5428918, 0, 0, 1, 1, 1,
-0.3541747, -0.7888364, -1.513512, 1, 0, 0, 1, 1,
-0.3379706, -1.782593, -2.454642, 1, 0, 0, 1, 1,
-0.3362716, -1.431323, -2.43285, 1, 0, 0, 1, 1,
-0.3342498, -1.237274, -2.891474, 1, 0, 0, 1, 1,
-0.3341027, -1.12187, -4.289001, 1, 0, 0, 1, 1,
-0.3334044, -1.088816, -1.356084, 0, 0, 0, 1, 1,
-0.3280477, -0.3422099, -2.673341, 0, 0, 0, 1, 1,
-0.3240605, 1.71619, -1.852252, 0, 0, 0, 1, 1,
-0.3234453, -0.7901288, -2.153143, 0, 0, 0, 1, 1,
-0.3221776, -1.601274, -3.561587, 0, 0, 0, 1, 1,
-0.3186767, -1.405538, -3.383806, 0, 0, 0, 1, 1,
-0.3125001, -1.644756, -4.737896, 0, 0, 0, 1, 1,
-0.3123701, -1.392008, -2.333413, 1, 1, 1, 1, 1,
-0.3122719, 0.3609379, -1.083425, 1, 1, 1, 1, 1,
-0.3065306, -0.5867588, -3.453378, 1, 1, 1, 1, 1,
-0.3051175, -1.401351, -2.295986, 1, 1, 1, 1, 1,
-0.2999255, -1.878545, -2.484682, 1, 1, 1, 1, 1,
-0.299296, -0.8211882, -4.176427, 1, 1, 1, 1, 1,
-0.296798, -0.7360551, -3.047591, 1, 1, 1, 1, 1,
-0.2950497, -0.3323941, -2.507725, 1, 1, 1, 1, 1,
-0.2884122, 1.119001, 1.584446, 1, 1, 1, 1, 1,
-0.2801743, -0.1906563, -3.891951, 1, 1, 1, 1, 1,
-0.2682897, 0.6039032, 1.44242, 1, 1, 1, 1, 1,
-0.2643644, -0.7959538, -2.642445, 1, 1, 1, 1, 1,
-0.2642887, -0.9507642, -2.225248, 1, 1, 1, 1, 1,
-0.2632495, -0.7487146, -2.085623, 1, 1, 1, 1, 1,
-0.2620899, -0.6440117, -3.077812, 1, 1, 1, 1, 1,
-0.2599345, 1.532994, -0.5961982, 0, 0, 1, 1, 1,
-0.2569354, -1.288888, -3.396544, 1, 0, 0, 1, 1,
-0.2468419, -0.5991684, -4.024669, 1, 0, 0, 1, 1,
-0.2447042, 0.1441507, -0.7628025, 1, 0, 0, 1, 1,
-0.239431, -1.022724, -5.488172, 1, 0, 0, 1, 1,
-0.2388104, -0.149373, -3.502127, 1, 0, 0, 1, 1,
-0.2381934, -0.3271569, -3.115954, 0, 0, 0, 1, 1,
-0.2342603, 0.7327209, -1.889256, 0, 0, 0, 1, 1,
-0.23291, 2.188751, -1.714252, 0, 0, 0, 1, 1,
-0.2310836, 0.5266411, -0.6023941, 0, 0, 0, 1, 1,
-0.2294748, 1.023517, 0.02386757, 0, 0, 0, 1, 1,
-0.2290162, -0.07529348, -0.765524, 0, 0, 0, 1, 1,
-0.2270357, 0.4979892, -0.2745646, 0, 0, 0, 1, 1,
-0.2248738, 0.613565, 1.127272, 1, 1, 1, 1, 1,
-0.2228635, -1.477702, -0.7588137, 1, 1, 1, 1, 1,
-0.2214882, -0.5519937, -3.637684, 1, 1, 1, 1, 1,
-0.2206111, 1.840816, 0.5163668, 1, 1, 1, 1, 1,
-0.220422, 0.8681642, -0.600242, 1, 1, 1, 1, 1,
-0.2192733, -0.7528206, -4.168971, 1, 1, 1, 1, 1,
-0.2175315, 0.5442803, 1.306068, 1, 1, 1, 1, 1,
-0.2126307, -2.6742, -2.330431, 1, 1, 1, 1, 1,
-0.212105, 1.05941, -1.255861, 1, 1, 1, 1, 1,
-0.2111254, 1.0262, 0.07032308, 1, 1, 1, 1, 1,
-0.2098899, 0.4798378, 0.08716926, 1, 1, 1, 1, 1,
-0.2053588, 1.187674, -1.412491, 1, 1, 1, 1, 1,
-0.2020854, -1.093472, -3.224944, 1, 1, 1, 1, 1,
-0.2005578, 1.175464, 1.805308, 1, 1, 1, 1, 1,
-0.1991012, -1.059845, -2.983756, 1, 1, 1, 1, 1,
-0.1981394, 1.634619, -2.076935, 0, 0, 1, 1, 1,
-0.1935328, -2.06018, -0.9224826, 1, 0, 0, 1, 1,
-0.1929519, 1.259324, -1.331465, 1, 0, 0, 1, 1,
-0.1912674, 0.9250164, 0.802514, 1, 0, 0, 1, 1,
-0.1897545, 0.3227465, -1.14425, 1, 0, 0, 1, 1,
-0.189566, -2.052925, -4.612299, 1, 0, 0, 1, 1,
-0.1886862, 0.09509845, -1.069819, 0, 0, 0, 1, 1,
-0.1883351, -2.056963, -2.764144, 0, 0, 0, 1, 1,
-0.1869244, 2.587816, 1.748526, 0, 0, 0, 1, 1,
-0.1852181, 0.8935157, 1.061165, 0, 0, 0, 1, 1,
-0.1844714, 1.216617, -0.3900621, 0, 0, 0, 1, 1,
-0.1812826, -0.0687409, -1.891592, 0, 0, 0, 1, 1,
-0.1758171, 1.187541, -0.08444607, 0, 0, 0, 1, 1,
-0.1748202, -0.7444605, -2.026853, 1, 1, 1, 1, 1,
-0.1715453, -0.5305496, -2.432706, 1, 1, 1, 1, 1,
-0.1666019, 1.465478, -0.3150885, 1, 1, 1, 1, 1,
-0.1663451, 0.05920566, -1.547153, 1, 1, 1, 1, 1,
-0.154631, 2.207058, -0.178094, 1, 1, 1, 1, 1,
-0.1538849, -0.318232, -3.294088, 1, 1, 1, 1, 1,
-0.1513048, 0.2416487, -0.7379934, 1, 1, 1, 1, 1,
-0.1506374, -1.142824, -2.476547, 1, 1, 1, 1, 1,
-0.1463886, -0.7449896, -3.682877, 1, 1, 1, 1, 1,
-0.1454649, -1.099577, -1.034593, 1, 1, 1, 1, 1,
-0.1428041, 0.9178092, -0.1521389, 1, 1, 1, 1, 1,
-0.1423091, -0.1327271, -2.4367, 1, 1, 1, 1, 1,
-0.1391548, 0.2926071, 0.4047998, 1, 1, 1, 1, 1,
-0.1370193, -2.422787, -2.637323, 1, 1, 1, 1, 1,
-0.1300651, -1.0948, -1.859103, 1, 1, 1, 1, 1,
-0.1294798, -0.6608713, -2.851275, 0, 0, 1, 1, 1,
-0.1268719, 0.1173725, 1.259801, 1, 0, 0, 1, 1,
-0.1261073, 0.8467166, -0.4262429, 1, 0, 0, 1, 1,
-0.1194274, 1.142081, -0.3285694, 1, 0, 0, 1, 1,
-0.1171616, -1.059302, -1.881172, 1, 0, 0, 1, 1,
-0.1165529, 1.409371, 0.8787051, 1, 0, 0, 1, 1,
-0.1113121, 0.2273928, -0.08655228, 0, 0, 0, 1, 1,
-0.1104142, 0.7130681, 1.843162, 0, 0, 0, 1, 1,
-0.1082292, -0.7452461, -2.111745, 0, 0, 0, 1, 1,
-0.1081375, -0.6964916, -2.486646, 0, 0, 0, 1, 1,
-0.1077825, 1.98764, -0.1642932, 0, 0, 0, 1, 1,
-0.1060634, -0.3543065, -2.802797, 0, 0, 0, 1, 1,
-0.105052, 0.5483763, 0.6234311, 0, 0, 0, 1, 1,
-0.1035075, -1.932661, -1.702717, 1, 1, 1, 1, 1,
-0.103056, 0.5603236, 1.81718, 1, 1, 1, 1, 1,
-0.09891056, -0.4422691, -1.486828, 1, 1, 1, 1, 1,
-0.09697018, -3.069844, -3.209843, 1, 1, 1, 1, 1,
-0.09688238, 0.5843669, -0.7091507, 1, 1, 1, 1, 1,
-0.09623577, -0.7343839, -3.495605, 1, 1, 1, 1, 1,
-0.09333871, 0.5397887, -0.07979236, 1, 1, 1, 1, 1,
-0.09331684, -1.681853, -3.881717, 1, 1, 1, 1, 1,
-0.08405252, -2.028925, -1.750294, 1, 1, 1, 1, 1,
-0.08223143, 1.225971, -0.4264825, 1, 1, 1, 1, 1,
-0.08204811, 0.4537669, 0.06728079, 1, 1, 1, 1, 1,
-0.081212, -0.142132, -2.259795, 1, 1, 1, 1, 1,
-0.07908439, -0.1061428, -2.691143, 1, 1, 1, 1, 1,
-0.07891673, -1.207509, -2.88487, 1, 1, 1, 1, 1,
-0.07672255, 1.324736, 0.1085019, 1, 1, 1, 1, 1,
-0.07638267, 0.2516267, -0.9095725, 0, 0, 1, 1, 1,
-0.07488713, -0.203613, -2.659096, 1, 0, 0, 1, 1,
-0.07124254, -1.670494, -2.087098, 1, 0, 0, 1, 1,
-0.06776757, 0.8395359, 0.652391, 1, 0, 0, 1, 1,
-0.05037588, -1.489455, -2.544173, 1, 0, 0, 1, 1,
-0.0486175, 0.8393672, 2.59509, 1, 0, 0, 1, 1,
-0.04852463, 1.147483, -0.49483, 0, 0, 0, 1, 1,
-0.044374, -0.1553564, -2.720013, 0, 0, 0, 1, 1,
-0.03746055, -1.887203, -1.959929, 0, 0, 0, 1, 1,
-0.03662705, -0.4040291, -3.242348, 0, 0, 0, 1, 1,
-0.03604685, 0.04321829, -1.554752, 0, 0, 0, 1, 1,
-0.03323456, -0.1633013, -1.902707, 0, 0, 0, 1, 1,
-0.02826614, 1.867506, -0.2302141, 0, 0, 0, 1, 1,
-0.0279788, 0.3814003, -1.285527, 1, 1, 1, 1, 1,
-0.02756571, 1.259594, -0.7802723, 1, 1, 1, 1, 1,
-0.02724797, -0.2872095, -3.5192, 1, 1, 1, 1, 1,
-0.02707231, 0.6716893, 0.8489522, 1, 1, 1, 1, 1,
-0.02530213, -0.376152, -4.887359, 1, 1, 1, 1, 1,
-0.01083892, -2.211565, -1.798519, 1, 1, 1, 1, 1,
-0.01006055, 0.4653912, -0.555537, 1, 1, 1, 1, 1,
-0.008093767, -1.933227, -2.609131, 1, 1, 1, 1, 1,
-0.007994078, -0.4715278, -4.020951, 1, 1, 1, 1, 1,
-0.006785177, -0.3110759, -3.040232, 1, 1, 1, 1, 1,
-0.00548947, 0.2886012, 0.1772508, 1, 1, 1, 1, 1,
-0.005478681, -0.6994227, -2.690906, 1, 1, 1, 1, 1,
-0.002438609, -0.8174867, -3.851629, 1, 1, 1, 1, 1,
0.001399759, 1.424464, -1.312341, 1, 1, 1, 1, 1,
0.0014384, 0.1182449, -1.702273, 1, 1, 1, 1, 1,
0.002103552, 0.475401, -0.4413859, 0, 0, 1, 1, 1,
0.002842925, 0.4452109, 0.6648611, 1, 0, 0, 1, 1,
0.004046669, 0.3937684, 0.7369195, 1, 0, 0, 1, 1,
0.004672574, -1.387351, 3.797132, 1, 0, 0, 1, 1,
0.005338673, -1.771484, 1.628125, 1, 0, 0, 1, 1,
0.0102608, 1.247714, -0.399131, 1, 0, 0, 1, 1,
0.01391709, -1.400646, 4.150093, 0, 0, 0, 1, 1,
0.01545583, 1.078064, 0.6231862, 0, 0, 0, 1, 1,
0.0197062, 0.6554584, 0.8585643, 0, 0, 0, 1, 1,
0.02064417, 1.194114, -0.953393, 0, 0, 0, 1, 1,
0.02162664, -0.4985769, 2.889561, 0, 0, 0, 1, 1,
0.02300402, 0.3719158, -0.2361862, 0, 0, 0, 1, 1,
0.03152021, 0.04762211, -0.5656063, 0, 0, 0, 1, 1,
0.03185456, 0.7819001, 1.104199, 1, 1, 1, 1, 1,
0.03414906, 1.904938, 0.2323892, 1, 1, 1, 1, 1,
0.0351704, 1.531381, 0.7367937, 1, 1, 1, 1, 1,
0.03619376, 1.144969, 1.133868, 1, 1, 1, 1, 1,
0.04043648, -0.172693, 1.419375, 1, 1, 1, 1, 1,
0.04074711, 0.01585262, 0.5894911, 1, 1, 1, 1, 1,
0.04114866, -0.06979292, 3.973772, 1, 1, 1, 1, 1,
0.04125516, -0.2347927, 3.915822, 1, 1, 1, 1, 1,
0.0452361, 0.4762906, 0.5241309, 1, 1, 1, 1, 1,
0.04567303, -0.8307995, 2.687019, 1, 1, 1, 1, 1,
0.04576131, -0.2474068, 2.858323, 1, 1, 1, 1, 1,
0.04988616, -0.05995903, 4.111898, 1, 1, 1, 1, 1,
0.05136756, -0.6581813, 2.981457, 1, 1, 1, 1, 1,
0.05220354, -0.1863417, 2.976985, 1, 1, 1, 1, 1,
0.05355371, 0.0101654, 1.715275, 1, 1, 1, 1, 1,
0.05694178, -0.02880997, 3.443143, 0, 0, 1, 1, 1,
0.06055363, 2.030153, -0.2607415, 1, 0, 0, 1, 1,
0.06185059, -0.5863764, 2.838493, 1, 0, 0, 1, 1,
0.06735395, -0.5284777, 4.752992, 1, 0, 0, 1, 1,
0.06942216, -0.5544293, 2.407783, 1, 0, 0, 1, 1,
0.06959891, 1.348438, -1.045234, 1, 0, 0, 1, 1,
0.07028022, 0.6707397, 2.260268, 0, 0, 0, 1, 1,
0.07091133, -0.9540871, 2.77502, 0, 0, 0, 1, 1,
0.0716365, -1.499674, 3.038472, 0, 0, 0, 1, 1,
0.08117934, 1.965187, 1.21534, 0, 0, 0, 1, 1,
0.08259319, 0.2812425, 0.7406215, 0, 0, 0, 1, 1,
0.08419042, -0.1056696, 1.907985, 0, 0, 0, 1, 1,
0.08536223, 0.6288154, 0.5217203, 0, 0, 0, 1, 1,
0.09037828, 0.1750396, 0.4509343, 1, 1, 1, 1, 1,
0.09326132, -0.6541674, 3.249109, 1, 1, 1, 1, 1,
0.09398018, 1.241279, -0.4691529, 1, 1, 1, 1, 1,
0.09406588, 0.7350193, 0.7518215, 1, 1, 1, 1, 1,
0.09566297, -1.639096, 3.085014, 1, 1, 1, 1, 1,
0.0976906, 0.07063323, 1.499925, 1, 1, 1, 1, 1,
0.09771648, -1.171704, 2.665206, 1, 1, 1, 1, 1,
0.09800999, -1.596323, 3.149433, 1, 1, 1, 1, 1,
0.0999411, -0.5137376, 3.484525, 1, 1, 1, 1, 1,
0.1018881, 0.1270996, 1.563297, 1, 1, 1, 1, 1,
0.1043142, -0.2213985, 4.258264, 1, 1, 1, 1, 1,
0.1079083, -0.2768339, 1.209746, 1, 1, 1, 1, 1,
0.1111961, -1.301992, 1.926876, 1, 1, 1, 1, 1,
0.1162531, 0.2970463, 0.5606784, 1, 1, 1, 1, 1,
0.1175087, 0.1308082, -0.1981297, 1, 1, 1, 1, 1,
0.117634, -0.1467151, 2.387555, 0, 0, 1, 1, 1,
0.1193778, 0.9559857, -0.7271987, 1, 0, 0, 1, 1,
0.1205597, -0.4805568, 2.629013, 1, 0, 0, 1, 1,
0.123033, -0.6188184, 2.902591, 1, 0, 0, 1, 1,
0.1282074, 0.9743209, 0.02103454, 1, 0, 0, 1, 1,
0.1285715, -0.994215, 5.21346, 1, 0, 0, 1, 1,
0.1297557, 0.0932756, 1.288107, 0, 0, 0, 1, 1,
0.1336168, -1.089585, 3.874943, 0, 0, 0, 1, 1,
0.1424798, 1.542282, -0.8540146, 0, 0, 0, 1, 1,
0.1427962, -1.984228, 3.514249, 0, 0, 0, 1, 1,
0.144313, -0.4186102, 3.451413, 0, 0, 0, 1, 1,
0.1474528, -0.9328105, 2.905305, 0, 0, 0, 1, 1,
0.1509003, -0.7236784, 2.705323, 0, 0, 0, 1, 1,
0.1522177, -0.04930354, 0.2727561, 1, 1, 1, 1, 1,
0.1534368, -0.4307038, 1.280272, 1, 1, 1, 1, 1,
0.1549486, 0.3087555, 0.5748979, 1, 1, 1, 1, 1,
0.1557387, 0.7297105, 2.773965, 1, 1, 1, 1, 1,
0.1561225, -1.139072, 2.490487, 1, 1, 1, 1, 1,
0.1589681, -0.1556302, 2.538886, 1, 1, 1, 1, 1,
0.1623025, -1.504493, 3.528671, 1, 1, 1, 1, 1,
0.1630492, -2.002074, 3.868566, 1, 1, 1, 1, 1,
0.1660829, 0.4364089, -0.6977825, 1, 1, 1, 1, 1,
0.1706507, 0.5645879, 1.480244, 1, 1, 1, 1, 1,
0.173786, -1.114975, 2.76124, 1, 1, 1, 1, 1,
0.1743262, 0.7221914, -0.2224212, 1, 1, 1, 1, 1,
0.1767194, 1.314392, -1.309171, 1, 1, 1, 1, 1,
0.1799215, -0.1734397, 3.883209, 1, 1, 1, 1, 1,
0.182575, 1.375121, -0.4913759, 1, 1, 1, 1, 1,
0.1874332, -0.9927453, 2.529984, 0, 0, 1, 1, 1,
0.1938349, -0.7632786, 2.810332, 1, 0, 0, 1, 1,
0.194261, 0.215005, 0.5045865, 1, 0, 0, 1, 1,
0.2027068, -0.4220523, 3.208483, 1, 0, 0, 1, 1,
0.203869, -0.07236623, 1.203716, 1, 0, 0, 1, 1,
0.2100639, 1.396494, -1.150507, 1, 0, 0, 1, 1,
0.2111835, -0.4746772, 2.876649, 0, 0, 0, 1, 1,
0.2130989, 0.6228882, -0.803703, 0, 0, 0, 1, 1,
0.2144529, -0.5201735, 3.42105, 0, 0, 0, 1, 1,
0.2176737, 0.9796093, -1.056711, 0, 0, 0, 1, 1,
0.2209195, 0.4494263, 0.7819839, 0, 0, 0, 1, 1,
0.2218082, -0.6495214, 2.81438, 0, 0, 0, 1, 1,
0.2246262, -1.024611, 1.82252, 0, 0, 0, 1, 1,
0.2295973, -0.1686677, 2.300308, 1, 1, 1, 1, 1,
0.2301782, -0.76635, 3.620919, 1, 1, 1, 1, 1,
0.2306953, 1.578138, -0.4257377, 1, 1, 1, 1, 1,
0.2328475, 0.8951619, 1.295008, 1, 1, 1, 1, 1,
0.2391658, 0.2713663, -0.1495529, 1, 1, 1, 1, 1,
0.239865, -1.239068, 3.75429, 1, 1, 1, 1, 1,
0.2419663, -0.425001, 2.303898, 1, 1, 1, 1, 1,
0.2421814, -0.7704853, 2.53842, 1, 1, 1, 1, 1,
0.2442025, -0.5602996, 3.313926, 1, 1, 1, 1, 1,
0.2489827, 1.387097, -0.2666755, 1, 1, 1, 1, 1,
0.2499045, -1.474993, 3.024837, 1, 1, 1, 1, 1,
0.2510065, -1.585827, 3.06703, 1, 1, 1, 1, 1,
0.252738, 1.551605, -1.066405, 1, 1, 1, 1, 1,
0.2552562, -0.5531546, 2.308082, 1, 1, 1, 1, 1,
0.2603931, 0.168701, 1.270491, 1, 1, 1, 1, 1,
0.2750983, -1.765316, 2.981017, 0, 0, 1, 1, 1,
0.2761727, 0.05082161, 1.011155, 1, 0, 0, 1, 1,
0.2769879, 1.495451, 0.6227494, 1, 0, 0, 1, 1,
0.2790771, -1.323344, 4.358968, 1, 0, 0, 1, 1,
0.2807115, 1.319249, -0.1987591, 1, 0, 0, 1, 1,
0.2834, -0.09486877, 1.83752, 1, 0, 0, 1, 1,
0.2851015, -0.1867505, 1.832112, 0, 0, 0, 1, 1,
0.2942385, -0.4256846, 2.218207, 0, 0, 0, 1, 1,
0.2963844, -0.5326175, 1.963928, 0, 0, 0, 1, 1,
0.2976846, 0.5265365, 1.980908, 0, 0, 0, 1, 1,
0.3001671, 0.7922527, -1.017754, 0, 0, 0, 1, 1,
0.3063201, 0.8220986, 2.754363, 0, 0, 0, 1, 1,
0.3082755, -0.1897237, 2.238353, 0, 0, 0, 1, 1,
0.3094635, -0.7861577, 2.336884, 1, 1, 1, 1, 1,
0.3133011, -0.1328258, 1.843026, 1, 1, 1, 1, 1,
0.3173015, -0.3690136, 2.369099, 1, 1, 1, 1, 1,
0.3182098, 0.8221906, 1.134705, 1, 1, 1, 1, 1,
0.3192482, -0.7688485, 4.056304, 1, 1, 1, 1, 1,
0.3209711, 1.718192, 0.005917592, 1, 1, 1, 1, 1,
0.3217254, 1.581986, 1.301155, 1, 1, 1, 1, 1,
0.3225105, -0.1597167, 3.113907, 1, 1, 1, 1, 1,
0.3235278, -0.02953604, 1.727708, 1, 1, 1, 1, 1,
0.3239164, -1.137029, 4.006313, 1, 1, 1, 1, 1,
0.3260259, 0.9273869, -0.5438639, 1, 1, 1, 1, 1,
0.3301813, -0.1145916, 2.039112, 1, 1, 1, 1, 1,
0.3380239, 0.7747943, 0.6931404, 1, 1, 1, 1, 1,
0.3390675, 0.6437037, 2.029835, 1, 1, 1, 1, 1,
0.3407106, -0.9278846, 2.84578, 1, 1, 1, 1, 1,
0.3463442, 1.534883, 1.875278, 0, 0, 1, 1, 1,
0.34668, 1.290804, 0.6744058, 1, 0, 0, 1, 1,
0.3494398, -2.51538, 4.069974, 1, 0, 0, 1, 1,
0.3499646, -0.8272601, 1.941586, 1, 0, 0, 1, 1,
0.3506424, -0.6315077, 3.863682, 1, 0, 0, 1, 1,
0.3540643, 0.3348031, 0.2572064, 1, 0, 0, 1, 1,
0.3604341, -0.4565245, 3.349737, 0, 0, 0, 1, 1,
0.3629883, 0.0539969, 3.567256, 0, 0, 0, 1, 1,
0.3642675, -0.1469047, 0.6972727, 0, 0, 0, 1, 1,
0.3711522, -0.517635, 2.463234, 0, 0, 0, 1, 1,
0.3735186, -0.701061, 3.289497, 0, 0, 0, 1, 1,
0.3738091, -0.1679751, 0.6875114, 0, 0, 0, 1, 1,
0.385372, 0.8143083, 1.206708, 0, 0, 0, 1, 1,
0.3857732, -0.1762206, 2.580146, 1, 1, 1, 1, 1,
0.3880025, -0.5416557, 1.703717, 1, 1, 1, 1, 1,
0.3889144, 0.3546832, -0.721693, 1, 1, 1, 1, 1,
0.3997822, 0.3059309, -0.3835302, 1, 1, 1, 1, 1,
0.4030576, -0.1948575, 2.196, 1, 1, 1, 1, 1,
0.4084614, 0.01922181, 0.2825328, 1, 1, 1, 1, 1,
0.4085872, -0.5343313, 3.029099, 1, 1, 1, 1, 1,
0.4115213, 0.681988, -1.259175, 1, 1, 1, 1, 1,
0.4149452, 0.5701416, -0.436375, 1, 1, 1, 1, 1,
0.4163736, 0.6579448, -0.008716204, 1, 1, 1, 1, 1,
0.419659, -0.01796682, 1.310977, 1, 1, 1, 1, 1,
0.4250501, -1.936205, 3.561232, 1, 1, 1, 1, 1,
0.4276749, -2.206833, 2.418628, 1, 1, 1, 1, 1,
0.4277034, 0.4935407, 1.714277, 1, 1, 1, 1, 1,
0.4340797, -1.509995, 3.561923, 1, 1, 1, 1, 1,
0.4341576, 0.7519673, 0.3039657, 0, 0, 1, 1, 1,
0.4343399, -0.3544958, 1.94817, 1, 0, 0, 1, 1,
0.4375341, 1.219817, 1.831468, 1, 0, 0, 1, 1,
0.440093, 0.02630766, 1.63344, 1, 0, 0, 1, 1,
0.4544944, 1.557045, -0.4528321, 1, 0, 0, 1, 1,
0.4647824, 0.2386558, 2.043948, 1, 0, 0, 1, 1,
0.464799, 0.6756547, 1.479985, 0, 0, 0, 1, 1,
0.4648272, -1.039299, 1.720933, 0, 0, 0, 1, 1,
0.4675463, -0.05260585, 2.350343, 0, 0, 0, 1, 1,
0.4680443, 0.1594068, 2.075433, 0, 0, 0, 1, 1,
0.4782455, -1.114192, 2.459366, 0, 0, 0, 1, 1,
0.4787444, -1.683799, 1.882947, 0, 0, 0, 1, 1,
0.480184, 1.111518, 2.662822, 0, 0, 0, 1, 1,
0.4811153, -0.997206, 2.360476, 1, 1, 1, 1, 1,
0.4882775, -0.4954127, 1.699433, 1, 1, 1, 1, 1,
0.4907779, -1.347099, 1.535093, 1, 1, 1, 1, 1,
0.4919032, -1.701, 2.745571, 1, 1, 1, 1, 1,
0.4934367, -0.2161269, 3.437304, 1, 1, 1, 1, 1,
0.4937932, 2.389283, 0.5726842, 1, 1, 1, 1, 1,
0.496507, 1.185435, 0.2822331, 1, 1, 1, 1, 1,
0.4984398, -0.4874653, 1.662424, 1, 1, 1, 1, 1,
0.4990034, 0.2998185, -0.2562831, 1, 1, 1, 1, 1,
0.4993416, -0.4368513, 3.206579, 1, 1, 1, 1, 1,
0.5004091, 0.9755152, 0.6669458, 1, 1, 1, 1, 1,
0.5006244, -0.8274911, 3.758219, 1, 1, 1, 1, 1,
0.5055654, 1.43295, -1.054403, 1, 1, 1, 1, 1,
0.5060024, 1.223976, 1.231951, 1, 1, 1, 1, 1,
0.506816, 0.7520383, 1.940193, 1, 1, 1, 1, 1,
0.5080785, -0.9399012, 0.7789457, 0, 0, 1, 1, 1,
0.5084327, -0.2103519, 1.657589, 1, 0, 0, 1, 1,
0.5108524, 0.8520745, -0.7633637, 1, 0, 0, 1, 1,
0.515225, -0.4599079, 1.995237, 1, 0, 0, 1, 1,
0.5152453, 0.3406557, 1.221651, 1, 0, 0, 1, 1,
0.5163773, -0.2784242, 3.133434, 1, 0, 0, 1, 1,
0.5172479, 0.2170725, 0.04998526, 0, 0, 0, 1, 1,
0.5177118, 1.092421, -0.6895691, 0, 0, 0, 1, 1,
0.5178611, 1.789051, 0.6154298, 0, 0, 0, 1, 1,
0.520734, -0.1052753, 2.572577, 0, 0, 0, 1, 1,
0.5211167, 0.3812591, 0.9290197, 0, 0, 0, 1, 1,
0.5214286, -0.8598117, 3.33244, 0, 0, 0, 1, 1,
0.5254232, 2.161794, 1.672209, 0, 0, 0, 1, 1,
0.5327116, -0.4745921, 2.960429, 1, 1, 1, 1, 1,
0.5363331, 1.326554, 0.7468339, 1, 1, 1, 1, 1,
0.5381232, 0.774902, 2.219748, 1, 1, 1, 1, 1,
0.5386249, 0.4616982, -0.6165196, 1, 1, 1, 1, 1,
0.5392862, -1.656218, 4.049137, 1, 1, 1, 1, 1,
0.5464708, 0.4143312, 0.08283102, 1, 1, 1, 1, 1,
0.5472417, -2.095118, 4.042174, 1, 1, 1, 1, 1,
0.5474758, -0.07570185, 1.554727, 1, 1, 1, 1, 1,
0.5525228, 0.8751338, 1.342194, 1, 1, 1, 1, 1,
0.5534024, -0.8846444, 1.206201, 1, 1, 1, 1, 1,
0.5537516, 1.132671, 1.018719, 1, 1, 1, 1, 1,
0.5557931, -0.3396897, 1.833006, 1, 1, 1, 1, 1,
0.5585033, -0.0472588, -0.7680268, 1, 1, 1, 1, 1,
0.5585538, 1.216738, -1.067769, 1, 1, 1, 1, 1,
0.5619466, -1.977366, 2.194082, 1, 1, 1, 1, 1,
0.5743469, 1.710715, -0.3878286, 0, 0, 1, 1, 1,
0.578742, 0.03117008, 1.027493, 1, 0, 0, 1, 1,
0.585163, -0.05786908, 1.253224, 1, 0, 0, 1, 1,
0.5854734, 0.2355477, 2.173688, 1, 0, 0, 1, 1,
0.5991502, 0.5195869, 1.463827, 1, 0, 0, 1, 1,
0.6039807, 0.2266473, 0.2897785, 1, 0, 0, 1, 1,
0.6093885, -1.537565, 3.612139, 0, 0, 0, 1, 1,
0.611903, 0.3205605, 2.519911, 0, 0, 0, 1, 1,
0.6129963, -1.249372, 3.846521, 0, 0, 0, 1, 1,
0.6137794, 0.1885916, 0.3178332, 0, 0, 0, 1, 1,
0.6139519, -1.297902, 4.210185, 0, 0, 0, 1, 1,
0.6187505, -0.08112058, 0.9691175, 0, 0, 0, 1, 1,
0.6230013, -0.27179, 1.658845, 0, 0, 0, 1, 1,
0.6236253, 1.423691, -0.9046645, 1, 1, 1, 1, 1,
0.6262475, -0.7166564, 2.855663, 1, 1, 1, 1, 1,
0.6269715, 1.710169, 2.713572, 1, 1, 1, 1, 1,
0.6378398, -0.2380174, 2.571415, 1, 1, 1, 1, 1,
0.6382305, -0.8321233, 3.147488, 1, 1, 1, 1, 1,
0.6447657, -1.064337, 2.557062, 1, 1, 1, 1, 1,
0.6473659, -1.300334, 3.544373, 1, 1, 1, 1, 1,
0.6477296, -1.088253, 0.9785885, 1, 1, 1, 1, 1,
0.6497161, -1.746161, 2.846851, 1, 1, 1, 1, 1,
0.6538535, 0.9853906, 1.559923, 1, 1, 1, 1, 1,
0.6571595, 1.430795, 0.1198933, 1, 1, 1, 1, 1,
0.6581357, -0.4515389, 2.491847, 1, 1, 1, 1, 1,
0.6624213, -0.5549741, 2.047958, 1, 1, 1, 1, 1,
0.6652005, 0.02185506, 2.174225, 1, 1, 1, 1, 1,
0.6708323, -0.7430639, 1.881754, 1, 1, 1, 1, 1,
0.6746958, 1.895361, -0.3495984, 0, 0, 1, 1, 1,
0.6761644, 0.1210132, 1.279611, 1, 0, 0, 1, 1,
0.6870639, -0.1262303, 2.450989, 1, 0, 0, 1, 1,
0.6930673, 0.773186, 0.6311163, 1, 0, 0, 1, 1,
0.6956174, 0.4632027, 0.404921, 1, 0, 0, 1, 1,
0.6967503, 0.06391312, 2.499378, 1, 0, 0, 1, 1,
0.6976539, -0.5581011, 1.941141, 0, 0, 0, 1, 1,
0.7029353, -1.182757, 4.461564, 0, 0, 0, 1, 1,
0.7058799, -0.5063952, 0.3330241, 0, 0, 0, 1, 1,
0.7099545, 1.268591, 0.8742932, 0, 0, 0, 1, 1,
0.7117822, -1.133422, 2.151841, 0, 0, 0, 1, 1,
0.7124628, 1.331933, -0.3785999, 0, 0, 0, 1, 1,
0.7151138, -0.323722, 2.564907, 0, 0, 0, 1, 1,
0.7152331, -1.084223, 3.742861, 1, 1, 1, 1, 1,
0.7191011, -1.056937, 1.512114, 1, 1, 1, 1, 1,
0.7236448, 1.750692, 3.289233, 1, 1, 1, 1, 1,
0.7276675, -0.6106448, 2.656169, 1, 1, 1, 1, 1,
0.7297382, 0.7588252, 0.5089036, 1, 1, 1, 1, 1,
0.7305579, -0.1674399, 0.3584246, 1, 1, 1, 1, 1,
0.736173, -0.355119, 0.6035858, 1, 1, 1, 1, 1,
0.7371456, -0.9967884, 1.475688, 1, 1, 1, 1, 1,
0.7392701, -0.7241943, 1.18757, 1, 1, 1, 1, 1,
0.7412929, -0.2961887, 1.453787, 1, 1, 1, 1, 1,
0.7461526, -0.1961614, 3.237541, 1, 1, 1, 1, 1,
0.7509393, 1.13111, -0.5433798, 1, 1, 1, 1, 1,
0.7636473, 0.2240416, 1.923936, 1, 1, 1, 1, 1,
0.7718296, -0.4814591, 2.246675, 1, 1, 1, 1, 1,
0.7724887, -1.654316, 3.804383, 1, 1, 1, 1, 1,
0.7728029, 1.454707, 3.066503, 0, 0, 1, 1, 1,
0.7732906, 0.1186034, 0.2827536, 1, 0, 0, 1, 1,
0.7776926, 0.4658939, 0.3763228, 1, 0, 0, 1, 1,
0.7832776, -0.1455191, 4.198348, 1, 0, 0, 1, 1,
0.7882049, 1.197494, -0.2267733, 1, 0, 0, 1, 1,
0.7940561, -0.8346108, 2.437012, 1, 0, 0, 1, 1,
0.7953448, 1.295808, 0.7783146, 0, 0, 0, 1, 1,
0.8089286, -1.111495, 2.902924, 0, 0, 0, 1, 1,
0.8133439, -0.9500546, 2.872537, 0, 0, 0, 1, 1,
0.8152311, 0.4201449, 1.507294, 0, 0, 0, 1, 1,
0.8169215, -0.7742044, 1.710779, 0, 0, 0, 1, 1,
0.8171996, 0.5538269, -0.5622281, 0, 0, 0, 1, 1,
0.8202074, 0.9936211, -0.9190946, 0, 0, 0, 1, 1,
0.8220743, -0.2689183, 2.385993, 1, 1, 1, 1, 1,
0.8226725, 0.08741139, 2.059737, 1, 1, 1, 1, 1,
0.8270066, -0.3561128, 1.806293, 1, 1, 1, 1, 1,
0.8298311, -1.042035, 1.681073, 1, 1, 1, 1, 1,
0.8320099, 2.55991, -0.7856126, 1, 1, 1, 1, 1,
0.8348922, 1.158674, -0.7161433, 1, 1, 1, 1, 1,
0.8442371, 1.185702, 0.8296841, 1, 1, 1, 1, 1,
0.8457943, 0.4413461, 0.9164935, 1, 1, 1, 1, 1,
0.84676, -0.4511769, 3.244777, 1, 1, 1, 1, 1,
0.8476819, 3.045667, 1.644845, 1, 1, 1, 1, 1,
0.8496238, -0.02745845, 1.191367, 1, 1, 1, 1, 1,
0.8506634, 1.967879, 1.15509, 1, 1, 1, 1, 1,
0.8549113, -0.2423858, 1.917917, 1, 1, 1, 1, 1,
0.8556466, 0.3395505, 1.109481, 1, 1, 1, 1, 1,
0.8561957, -0.5305584, 1.193587, 1, 1, 1, 1, 1,
0.8581049, -0.9469008, 2.665175, 0, 0, 1, 1, 1,
0.8591991, -0.3986824, 2.23767, 1, 0, 0, 1, 1,
0.8687471, 1.178418, 1.058111, 1, 0, 0, 1, 1,
0.8763302, -2.075143, 2.373464, 1, 0, 0, 1, 1,
0.8796244, 0.1111431, 1.759457, 1, 0, 0, 1, 1,
0.880448, 1.527503, 1.395612, 1, 0, 0, 1, 1,
0.8882592, 0.541595, 1.382323, 0, 0, 0, 1, 1,
0.8937732, 0.6874869, 1.063347, 0, 0, 0, 1, 1,
0.8951327, -0.6031609, 3.59832, 0, 0, 0, 1, 1,
0.8960701, -0.8084393, 0.6277996, 0, 0, 0, 1, 1,
0.8960703, -0.3160386, 2.631876, 0, 0, 0, 1, 1,
0.8993623, 0.2923233, 1.099513, 0, 0, 0, 1, 1,
0.8998101, 0.2049984, 0.6159742, 0, 0, 0, 1, 1,
0.9026312, 0.2871024, 1.726411, 1, 1, 1, 1, 1,
0.9135087, 0.7216053, -0.0973779, 1, 1, 1, 1, 1,
0.9194475, -0.2439409, 1.442314, 1, 1, 1, 1, 1,
0.9243728, 1.4986, 0.1120748, 1, 1, 1, 1, 1,
0.9304767, 0.4534914, 0.645134, 1, 1, 1, 1, 1,
0.936594, 0.3728674, 1.414195, 1, 1, 1, 1, 1,
0.9403882, -0.8583078, 4.732063, 1, 1, 1, 1, 1,
0.9404735, -0.5641509, 2.270381, 1, 1, 1, 1, 1,
0.9416295, -0.2267573, 0.6354444, 1, 1, 1, 1, 1,
0.9535945, -0.8039227, 1.895061, 1, 1, 1, 1, 1,
0.9556617, -0.5074731, 1.210189, 1, 1, 1, 1, 1,
0.9654034, -0.7199688, 3.473639, 1, 1, 1, 1, 1,
0.9720079, 0.715293, -0.1435573, 1, 1, 1, 1, 1,
0.9782094, 1.8668, 0.4872166, 1, 1, 1, 1, 1,
0.9783185, -1.246058, 2.47576, 1, 1, 1, 1, 1,
0.9825014, 0.384729, -0.2717406, 0, 0, 1, 1, 1,
0.9833089, 1.320477, -0.02183738, 1, 0, 0, 1, 1,
0.9848515, -0.7701896, 5.436819, 1, 0, 0, 1, 1,
0.9869021, -1.018381, 1.988369, 1, 0, 0, 1, 1,
0.9875311, 0.1880858, 0.7011977, 1, 0, 0, 1, 1,
0.9880778, -0.1291489, 2.611799, 1, 0, 0, 1, 1,
0.9902273, -0.8626523, 1.205019, 0, 0, 0, 1, 1,
0.9917474, -0.8761854, 0.3112094, 0, 0, 0, 1, 1,
0.995575, -0.6052279, 2.517857, 0, 0, 0, 1, 1,
1.000439, 1.619367, 2.459036, 0, 0, 0, 1, 1,
1.00192, 0.1074034, 2.794084, 0, 0, 0, 1, 1,
1.010669, -1.171717, 1.718216, 0, 0, 0, 1, 1,
1.014148, 0.7719976, 0.8100473, 0, 0, 0, 1, 1,
1.014702, 0.5973726, 1.851045, 1, 1, 1, 1, 1,
1.01765, -1.683687, 2.254212, 1, 1, 1, 1, 1,
1.020377, -1.034741, 2.811826, 1, 1, 1, 1, 1,
1.021917, 0.7471846, 1.341224, 1, 1, 1, 1, 1,
1.022284, 0.6110792, 1.263062, 1, 1, 1, 1, 1,
1.022746, 0.1697285, -0.07798896, 1, 1, 1, 1, 1,
1.023094, 1.001004, 1.277818, 1, 1, 1, 1, 1,
1.024298, -0.1239244, 1.240283, 1, 1, 1, 1, 1,
1.032674, -0.06775137, 2.21763, 1, 1, 1, 1, 1,
1.037148, 1.294735, 2.053179, 1, 1, 1, 1, 1,
1.040127, 1.059769, -0.4820848, 1, 1, 1, 1, 1,
1.045521, 1.060616, 1.390629, 1, 1, 1, 1, 1,
1.046845, -0.669782, 0.4396711, 1, 1, 1, 1, 1,
1.047097, -1.33569, 2.440001, 1, 1, 1, 1, 1,
1.049902, -0.6198813, 2.908383, 1, 1, 1, 1, 1,
1.052871, 0.7665384, -0.4853608, 0, 0, 1, 1, 1,
1.063055, 1.330925, 0.6363879, 1, 0, 0, 1, 1,
1.064974, 0.007826642, 1.224003, 1, 0, 0, 1, 1,
1.065895, 0.2968517, 1.416232, 1, 0, 0, 1, 1,
1.067402, -0.709655, 2.083169, 1, 0, 0, 1, 1,
1.069099, 1.08323, 0.6431196, 1, 0, 0, 1, 1,
1.074901, 0.2433693, 1.094436, 0, 0, 0, 1, 1,
1.078377, -0.9972908, 2.463673, 0, 0, 0, 1, 1,
1.083422, -0.9928246, 2.567312, 0, 0, 0, 1, 1,
1.093999, -1.05775, 1.304564, 0, 0, 0, 1, 1,
1.096154, 1.808808, 3.417693, 0, 0, 0, 1, 1,
1.101115, -0.5542337, 1.321067, 0, 0, 0, 1, 1,
1.101449, -1.302852, 2.430822, 0, 0, 0, 1, 1,
1.108065, 1.116651, -0.07228132, 1, 1, 1, 1, 1,
1.114043, -0.3681752, 1.173637, 1, 1, 1, 1, 1,
1.118079, -0.7967758, 2.269581, 1, 1, 1, 1, 1,
1.121055, 0.1250761, 0.8026376, 1, 1, 1, 1, 1,
1.122517, -0.5058035, 0.9339858, 1, 1, 1, 1, 1,
1.129526, -0.3754474, 3.077858, 1, 1, 1, 1, 1,
1.133174, -0.2568863, 3.262974, 1, 1, 1, 1, 1,
1.134558, 1.338161, 1.993269, 1, 1, 1, 1, 1,
1.135094, 1.6369, 0.1293722, 1, 1, 1, 1, 1,
1.143042, 1.39945, -0.8775852, 1, 1, 1, 1, 1,
1.143575, 0.3093039, 2.755783, 1, 1, 1, 1, 1,
1.15861, -1.093328, 2.079401, 1, 1, 1, 1, 1,
1.160798, 0.5592437, 0.7601824, 1, 1, 1, 1, 1,
1.178201, 0.1894659, 1.952187, 1, 1, 1, 1, 1,
1.184753, -0.6201999, 2.792055, 1, 1, 1, 1, 1,
1.196538, 0.5665364, 0.8493193, 0, 0, 1, 1, 1,
1.20239, -1.754934, 1.64344, 1, 0, 0, 1, 1,
1.207678, 2.803796, 0.3854277, 1, 0, 0, 1, 1,
1.212893, -1.017645, 3.584285, 1, 0, 0, 1, 1,
1.213094, 0.208472, 1.950427, 1, 0, 0, 1, 1,
1.217909, 0.850835, 1.620457, 1, 0, 0, 1, 1,
1.219968, -1.286545, 3.347501, 0, 0, 0, 1, 1,
1.222801, 1.092799, 0.301192, 0, 0, 0, 1, 1,
1.225133, 1.344556, -0.07589867, 0, 0, 0, 1, 1,
1.238947, -0.7448525, 2.897995, 0, 0, 0, 1, 1,
1.24752, -1.135923, 2.353141, 0, 0, 0, 1, 1,
1.251993, 1.115693, 2.266078, 0, 0, 0, 1, 1,
1.264428, -0.4603049, 0.915751, 0, 0, 0, 1, 1,
1.268258, -1.201253, 1.351024, 1, 1, 1, 1, 1,
1.268873, -1.182671, 2.553792, 1, 1, 1, 1, 1,
1.269483, -0.3504862, 1.100904, 1, 1, 1, 1, 1,
1.275202, -0.6230475, 2.571007, 1, 1, 1, 1, 1,
1.287778, 0.2109413, 1.62254, 1, 1, 1, 1, 1,
1.289863, -0.1161271, 0.9442236, 1, 1, 1, 1, 1,
1.295096, 0.3708128, 1.979485, 1, 1, 1, 1, 1,
1.302304, 0.09826551, 2.98868, 1, 1, 1, 1, 1,
1.305092, 0.8805053, 0.7277475, 1, 1, 1, 1, 1,
1.307095, -1.939191, 3.357242, 1, 1, 1, 1, 1,
1.307407, 0.1247632, 0.8164742, 1, 1, 1, 1, 1,
1.311207, 0.9431202, 1.556369, 1, 1, 1, 1, 1,
1.320623, 0.6087961, 0.9490739, 1, 1, 1, 1, 1,
1.321527, -0.3855311, 1.596175, 1, 1, 1, 1, 1,
1.328159, 0.6986924, 0.339147, 1, 1, 1, 1, 1,
1.328543, 1.457059, 1.950436, 0, 0, 1, 1, 1,
1.336187, -2.124956, 2.126578, 1, 0, 0, 1, 1,
1.357601, 1.165843, 2.81679, 1, 0, 0, 1, 1,
1.393218, 0.4195943, 2.524147, 1, 0, 0, 1, 1,
1.395972, 0.4764355, 1.366193, 1, 0, 0, 1, 1,
1.42698, 0.7023227, 1.952499, 1, 0, 0, 1, 1,
1.429669, 2.426307, 0.377264, 0, 0, 0, 1, 1,
1.43333, 1.017899, 0.8415942, 0, 0, 0, 1, 1,
1.43605, -0.5863655, 3.560703, 0, 0, 0, 1, 1,
1.439444, -0.7426991, 2.704283, 0, 0, 0, 1, 1,
1.439555, 0.0495022, 0.7600257, 0, 0, 0, 1, 1,
1.445234, 0.4378609, 1.377205, 0, 0, 0, 1, 1,
1.448256, -1.251732, 3.341094, 0, 0, 0, 1, 1,
1.452447, -0.403811, 1.503297, 1, 1, 1, 1, 1,
1.452492, -0.04083218, 2.866343, 1, 1, 1, 1, 1,
1.465974, -1.377651, 2.226198, 1, 1, 1, 1, 1,
1.468556, -0.9095157, 0.663471, 1, 1, 1, 1, 1,
1.47447, -0.7729628, 3.652775, 1, 1, 1, 1, 1,
1.498854, -0.3116558, 2.580213, 1, 1, 1, 1, 1,
1.525521, 0.6285837, -1.054717, 1, 1, 1, 1, 1,
1.53258, -0.09514847, 1.75423, 1, 1, 1, 1, 1,
1.549996, -0.1093321, 1.784187, 1, 1, 1, 1, 1,
1.550792, -0.6916208, 2.812622, 1, 1, 1, 1, 1,
1.555967, 0.4522597, 1.475466, 1, 1, 1, 1, 1,
1.556201, -0.6785113, 2.175979, 1, 1, 1, 1, 1,
1.556798, -0.06940113, 1.628913, 1, 1, 1, 1, 1,
1.561773, -0.3181219, 2.747339, 1, 1, 1, 1, 1,
1.565845, -1.10782, 4.574449, 1, 1, 1, 1, 1,
1.583912, -0.8239002, 4.197075, 0, 0, 1, 1, 1,
1.586325, 0.4172645, 1.76238, 1, 0, 0, 1, 1,
1.587899, -1.266395, 2.784555, 1, 0, 0, 1, 1,
1.593936, 0.2474598, 2.236878, 1, 0, 0, 1, 1,
1.602592, -0.2540048, 3.48249, 1, 0, 0, 1, 1,
1.60288, 0.6592498, 2.51612, 1, 0, 0, 1, 1,
1.622826, -0.8492296, 1.883047, 0, 0, 0, 1, 1,
1.630001, -0.3488954, 1.731331, 0, 0, 0, 1, 1,
1.668611, 1.393327, 1.818007, 0, 0, 0, 1, 1,
1.67631, 0.3557377, 2.258607, 0, 0, 0, 1, 1,
1.695291, 0.8174065, 2.471786, 0, 0, 0, 1, 1,
1.713112, 0.4110662, 0.4451781, 0, 0, 0, 1, 1,
1.728262, -0.09603465, 2.339497, 0, 0, 0, 1, 1,
1.729643, 0.2153822, 2.113953, 1, 1, 1, 1, 1,
1.765523, 0.2964861, 1.438094, 1, 1, 1, 1, 1,
1.766306, 0.6017051, -0.2981177, 1, 1, 1, 1, 1,
1.768122, 0.08000623, 0.7400774, 1, 1, 1, 1, 1,
1.791833, 1.070907, 2.240218, 1, 1, 1, 1, 1,
1.796549, 0.1791158, 2.611546, 1, 1, 1, 1, 1,
1.822927, -0.6177639, 1.462025, 1, 1, 1, 1, 1,
1.827251, -0.3383957, 1.477268, 1, 1, 1, 1, 1,
1.840282, -1.096505, 1.783634, 1, 1, 1, 1, 1,
1.84365, -0.6662577, 1.256835, 1, 1, 1, 1, 1,
1.863876, -0.9891102, 3.346889, 1, 1, 1, 1, 1,
1.863966, 1.047969, 0.7830448, 1, 1, 1, 1, 1,
1.920878, -0.1409723, 3.598032, 1, 1, 1, 1, 1,
1.934284, 0.5634609, -0.401415, 1, 1, 1, 1, 1,
2.054308, 1.247432, 2.710157, 1, 1, 1, 1, 1,
2.082825, 1.835983, 1.024108, 0, 0, 1, 1, 1,
2.129138, -1.450045, 1.714959, 1, 0, 0, 1, 1,
2.129562, -0.1276628, 3.243202, 1, 0, 0, 1, 1,
2.135722, 0.2777601, 3.583114, 1, 0, 0, 1, 1,
2.141174, -0.2605671, 2.062272, 1, 0, 0, 1, 1,
2.161006, 0.6596656, 0.2390266, 1, 0, 0, 1, 1,
2.186381, -1.363382, 1.501978, 0, 0, 0, 1, 1,
2.193797, -1.479235, 1.224625, 0, 0, 0, 1, 1,
2.208327, 0.2603762, 2.369598, 0, 0, 0, 1, 1,
2.255342, -0.9585961, 2.206082, 0, 0, 0, 1, 1,
2.259944, 0.9720345, 2.733902, 0, 0, 0, 1, 1,
2.29269, -0.7498519, 1.329323, 0, 0, 0, 1, 1,
2.338142, 0.2697387, 0.400598, 0, 0, 0, 1, 1,
2.366932, 2.199142, 0.8752999, 1, 1, 1, 1, 1,
2.432172, 0.4647795, 0.4948966, 1, 1, 1, 1, 1,
2.433316, -1.151338, 2.92497, 1, 1, 1, 1, 1,
2.568158, 1.10081, -0.7912512, 1, 1, 1, 1, 1,
2.602355, 0.0009027925, 0.4248387, 1, 1, 1, 1, 1,
2.701964, -1.063717, 1.362364, 1, 1, 1, 1, 1,
2.837031, -0.7487721, 0.4270049, 1, 1, 1, 1, 1
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
var radius = 9.566747;
var distance = 33.60279;
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
mvMatrix.translate( 0.3354181, 0.01208878, 0.02567673 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.60279);
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
