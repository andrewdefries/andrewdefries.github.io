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
-3.181803, 0.1953251, -0.9599032, 1, 0, 0, 1,
-2.755992, -1.012124, -1.902847, 1, 0.007843138, 0, 1,
-2.732409, 1.241167, -1.725619, 1, 0.01176471, 0, 1,
-2.724075, -0.7288345, -2.469841, 1, 0.01960784, 0, 1,
-2.460063, -1.014522, -2.813186, 1, 0.02352941, 0, 1,
-2.452345, -0.06728128, -0.6150477, 1, 0.03137255, 0, 1,
-2.415051, -2.054329, -2.535297, 1, 0.03529412, 0, 1,
-2.281916, 0.08969632, -1.572241, 1, 0.04313726, 0, 1,
-2.237029, -0.3806948, 0.08194847, 1, 0.04705882, 0, 1,
-2.112126, 0.292432, -2.723054, 1, 0.05490196, 0, 1,
-2.064382, 0.5610157, -0.1323459, 1, 0.05882353, 0, 1,
-2.046181, 1.026907, -0.396467, 1, 0.06666667, 0, 1,
-2.031497, -0.5401727, -5.471003, 1, 0.07058824, 0, 1,
-2.01519, -0.4916149, -1.892065, 1, 0.07843138, 0, 1,
-2.014459, 2.34411, -0.194868, 1, 0.08235294, 0, 1,
-2.007062, 0.8632365, -1.269924, 1, 0.09019608, 0, 1,
-1.982701, 0.1320658, -1.848478, 1, 0.09411765, 0, 1,
-1.978298, 0.07105598, -1.268215, 1, 0.1019608, 0, 1,
-1.974145, -1.811169, -0.9262489, 1, 0.1098039, 0, 1,
-1.950765, -1.418781, -3.682163, 1, 0.1137255, 0, 1,
-1.938471, -2.73509, -2.289853, 1, 0.1215686, 0, 1,
-1.923444, -1.269431, -1.673359, 1, 0.1254902, 0, 1,
-1.894555, -0.5514504, -1.671268, 1, 0.1333333, 0, 1,
-1.890246, 1.179491, 0.5426512, 1, 0.1372549, 0, 1,
-1.88094, -1.2273, -1.456293, 1, 0.145098, 0, 1,
-1.877394, -1.328244, -2.802143, 1, 0.1490196, 0, 1,
-1.861488, -0.62738, -0.6244414, 1, 0.1568628, 0, 1,
-1.861082, -1.403469, -1.105912, 1, 0.1607843, 0, 1,
-1.860586, 0.3126131, -2.14163, 1, 0.1686275, 0, 1,
-1.827738, 0.03746716, -0.4268993, 1, 0.172549, 0, 1,
-1.79595, 0.8613204, -1.80788, 1, 0.1803922, 0, 1,
-1.790664, -0.03489906, -3.982122, 1, 0.1843137, 0, 1,
-1.762446, -0.3670194, -1.075131, 1, 0.1921569, 0, 1,
-1.751038, -0.4225981, 0.4801858, 1, 0.1960784, 0, 1,
-1.743312, 0.02690389, -1.400902, 1, 0.2039216, 0, 1,
-1.742868, 0.4522326, -2.424545, 1, 0.2117647, 0, 1,
-1.701528, 0.5573798, -2.107897, 1, 0.2156863, 0, 1,
-1.700665, -0.3398892, -1.005902, 1, 0.2235294, 0, 1,
-1.697998, 2.541955, 0.2299752, 1, 0.227451, 0, 1,
-1.683668, -1.785516, -1.829782, 1, 0.2352941, 0, 1,
-1.676991, 1.420417, -0.4083612, 1, 0.2392157, 0, 1,
-1.672177, -0.9289439, -2.992208, 1, 0.2470588, 0, 1,
-1.663732, 1.255167, -1.134583, 1, 0.2509804, 0, 1,
-1.647505, -1.061723, -2.222799, 1, 0.2588235, 0, 1,
-1.618392, 0.5849506, -2.545715, 1, 0.2627451, 0, 1,
-1.611292, 0.3881189, -2.191231, 1, 0.2705882, 0, 1,
-1.610687, 1.258627, -1.928376, 1, 0.2745098, 0, 1,
-1.609407, -0.9593299, -2.941084, 1, 0.282353, 0, 1,
-1.59198, 1.44847, -1.595017, 1, 0.2862745, 0, 1,
-1.577726, 2.220144, -0.5969662, 1, 0.2941177, 0, 1,
-1.565774, -0.06013552, -2.464871, 1, 0.3019608, 0, 1,
-1.560031, -3.960864, -1.802129, 1, 0.3058824, 0, 1,
-1.542512, -0.205732, -1.333145, 1, 0.3137255, 0, 1,
-1.540046, 0.5500827, -2.45037, 1, 0.3176471, 0, 1,
-1.539145, 0.8243756, -2.379458, 1, 0.3254902, 0, 1,
-1.524374, -0.6643907, -1.906453, 1, 0.3294118, 0, 1,
-1.522012, -0.4227374, -0.906231, 1, 0.3372549, 0, 1,
-1.518655, 0.4211709, -1.396555, 1, 0.3411765, 0, 1,
-1.517861, 0.04200303, -0.8341982, 1, 0.3490196, 0, 1,
-1.48383, -0.6532295, -1.993165, 1, 0.3529412, 0, 1,
-1.47551, 0.6405637, -1.617269, 1, 0.3607843, 0, 1,
-1.47201, -0.7704965, -1.937108, 1, 0.3647059, 0, 1,
-1.465092, -1.546008, -0.7685691, 1, 0.372549, 0, 1,
-1.464231, -0.3597648, -3.124124, 1, 0.3764706, 0, 1,
-1.461203, 1.37306, -1.318659, 1, 0.3843137, 0, 1,
-1.419878, -0.3682128, -3.620472, 1, 0.3882353, 0, 1,
-1.41717, -0.4255236, -2.981648, 1, 0.3960784, 0, 1,
-1.416536, -0.6120001, -2.702674, 1, 0.4039216, 0, 1,
-1.4161, 0.3318447, -0.5366052, 1, 0.4078431, 0, 1,
-1.41074, -1.547915, -2.046801, 1, 0.4156863, 0, 1,
-1.407409, 0.808063, -0.4485973, 1, 0.4196078, 0, 1,
-1.388284, 0.3503376, -0.1342707, 1, 0.427451, 0, 1,
-1.387779, -1.30851, -2.972986, 1, 0.4313726, 0, 1,
-1.387282, 0.6566839, -1.989939, 1, 0.4392157, 0, 1,
-1.381219, -1.22047, -1.709356, 1, 0.4431373, 0, 1,
-1.381152, -0.05648447, -2.832995, 1, 0.4509804, 0, 1,
-1.37978, -1.188332, -1.3033, 1, 0.454902, 0, 1,
-1.370094, -0.4618865, -2.544255, 1, 0.4627451, 0, 1,
-1.368042, -0.9983003, -2.565202, 1, 0.4666667, 0, 1,
-1.359948, -0.2930032, -1.372271, 1, 0.4745098, 0, 1,
-1.352147, 0.7246247, -1.964524, 1, 0.4784314, 0, 1,
-1.345561, 0.2978153, -2.650437, 1, 0.4862745, 0, 1,
-1.337953, 2.637921, 0.06075174, 1, 0.4901961, 0, 1,
-1.318478, -0.5332779, -2.660525, 1, 0.4980392, 0, 1,
-1.318006, 0.5308365, 0.3275655, 1, 0.5058824, 0, 1,
-1.317583, -0.6964868, -0.6687555, 1, 0.509804, 0, 1,
-1.304996, -0.1708802, -0.8315046, 1, 0.5176471, 0, 1,
-1.304886, -2.034367, -3.618127, 1, 0.5215687, 0, 1,
-1.304388, -0.921901, -2.137477, 1, 0.5294118, 0, 1,
-1.297502, -1.14627, -2.414387, 1, 0.5333334, 0, 1,
-1.284296, 0.7607688, -2.210762, 1, 0.5411765, 0, 1,
-1.283169, -0.1994436, -2.051206, 1, 0.5450981, 0, 1,
-1.273453, 1.278826, -0.4985928, 1, 0.5529412, 0, 1,
-1.259735, -0.6367621, -0.5472289, 1, 0.5568628, 0, 1,
-1.258716, 2.144423, 0.2264459, 1, 0.5647059, 0, 1,
-1.254824, -0.6456977, -3.026046, 1, 0.5686275, 0, 1,
-1.24053, -0.12276, -0.857022, 1, 0.5764706, 0, 1,
-1.240111, 1.65429, -0.5803376, 1, 0.5803922, 0, 1,
-1.228059, 1.03657, -1.331669, 1, 0.5882353, 0, 1,
-1.220625, -0.4020465, -2.238907, 1, 0.5921569, 0, 1,
-1.203341, -0.1973044, -2.043562, 1, 0.6, 0, 1,
-1.201452, -0.6915597, 0.2416781, 1, 0.6078432, 0, 1,
-1.197764, -0.7564986, -1.299902, 1, 0.6117647, 0, 1,
-1.190492, 0.01915748, -1.695433, 1, 0.6196079, 0, 1,
-1.183941, -0.2556327, -2.440857, 1, 0.6235294, 0, 1,
-1.182687, -0.4165557, -2.352392, 1, 0.6313726, 0, 1,
-1.177773, 0.8486915, 0.6523385, 1, 0.6352941, 0, 1,
-1.172824, -0.5776197, -1.811047, 1, 0.6431373, 0, 1,
-1.168848, 1.448195, 0.6656002, 1, 0.6470588, 0, 1,
-1.165771, 1.461851, -0.7584761, 1, 0.654902, 0, 1,
-1.163833, -1.243838, -2.025187, 1, 0.6588235, 0, 1,
-1.163166, -1.951127, -2.607566, 1, 0.6666667, 0, 1,
-1.1624, -1.223795, -1.500502, 1, 0.6705883, 0, 1,
-1.160541, 0.3450295, -0.08699626, 1, 0.6784314, 0, 1,
-1.152764, 1.45841, 0.5428705, 1, 0.682353, 0, 1,
-1.15093, -0.04494339, -1.754209, 1, 0.6901961, 0, 1,
-1.138298, -0.3370228, -2.75317, 1, 0.6941177, 0, 1,
-1.134435, -0.3067188, -1.684207, 1, 0.7019608, 0, 1,
-1.133041, -0.8867702, -0.4907656, 1, 0.7098039, 0, 1,
-1.132121, -0.2082443, -1.261632, 1, 0.7137255, 0, 1,
-1.131468, -0.1458724, -0.9356168, 1, 0.7215686, 0, 1,
-1.130616, 0.6425837, -0.8624508, 1, 0.7254902, 0, 1,
-1.127047, 0.955514, 1.379046, 1, 0.7333333, 0, 1,
-1.118074, 0.2905118, -0.6892461, 1, 0.7372549, 0, 1,
-1.114685, -1.320856, -2.411875, 1, 0.7450981, 0, 1,
-1.113814, -1.053484, -1.540913, 1, 0.7490196, 0, 1,
-1.111001, 0.5414072, -2.051095, 1, 0.7568628, 0, 1,
-1.107826, -0.8424401, -2.129525, 1, 0.7607843, 0, 1,
-1.103459, -1.883709, -3.034228, 1, 0.7686275, 0, 1,
-1.095419, 0.5018679, -1.023782, 1, 0.772549, 0, 1,
-1.087557, -1.916243, -2.112984, 1, 0.7803922, 0, 1,
-1.08303, -1.136161, -2.634442, 1, 0.7843137, 0, 1,
-1.078171, -0.7412196, 0.2196653, 1, 0.7921569, 0, 1,
-1.074887, 0.5565133, -1.388838, 1, 0.7960784, 0, 1,
-1.071314, 0.5012787, -0.3783677, 1, 0.8039216, 0, 1,
-1.068878, -0.2871486, -3.015367, 1, 0.8117647, 0, 1,
-1.065811, 0.3591354, -0.7440218, 1, 0.8156863, 0, 1,
-1.060518, -1.900278, -4.06055, 1, 0.8235294, 0, 1,
-1.056711, -1.19524, -4.259692, 1, 0.827451, 0, 1,
-1.053369, -0.3337515, -2.130481, 1, 0.8352941, 0, 1,
-1.052698, -0.09842706, 0.4347731, 1, 0.8392157, 0, 1,
-1.050903, -0.7116127, -1.383144, 1, 0.8470588, 0, 1,
-1.0499, -0.8519552, -2.215285, 1, 0.8509804, 0, 1,
-1.041429, -1.503739, -2.281792, 1, 0.8588235, 0, 1,
-1.041296, 0.3640046, -2.277711, 1, 0.8627451, 0, 1,
-1.040682, 1.20968, -1.440941, 1, 0.8705882, 0, 1,
-1.035442, 0.2500064, -0.5105756, 1, 0.8745098, 0, 1,
-1.0323, 1.621654, -1.951264, 1, 0.8823529, 0, 1,
-1.022805, 1.459376, 1.036808, 1, 0.8862745, 0, 1,
-1.020272, -1.292768, -1.203558, 1, 0.8941177, 0, 1,
-1.019107, -1.408814, -1.067316, 1, 0.8980392, 0, 1,
-1.01373, 0.1496546, -1.264269, 1, 0.9058824, 0, 1,
-1.009382, -0.6257628, -1.265159, 1, 0.9137255, 0, 1,
-1.009228, -1.049607, -1.113885, 1, 0.9176471, 0, 1,
-1.007499, 0.2759693, -0.234529, 1, 0.9254902, 0, 1,
-0.9983811, -0.8650031, -2.333787, 1, 0.9294118, 0, 1,
-0.9940613, 1.328175, -0.6480898, 1, 0.9372549, 0, 1,
-0.9928764, 0.9724909, -1.346729, 1, 0.9411765, 0, 1,
-0.992413, 1.012507, -1.573607, 1, 0.9490196, 0, 1,
-0.9922154, 0.765263, -0.3839124, 1, 0.9529412, 0, 1,
-0.9916582, 1.056834, -0.2527923, 1, 0.9607843, 0, 1,
-0.9864417, -0.1129762, -1.634712, 1, 0.9647059, 0, 1,
-0.9862644, 1.215292, -0.9796222, 1, 0.972549, 0, 1,
-0.9843494, 1.083552, -2.36835, 1, 0.9764706, 0, 1,
-0.9765746, -1.869824, -2.322181, 1, 0.9843137, 0, 1,
-0.9755483, 0.6555648, -0.4327945, 1, 0.9882353, 0, 1,
-0.9730632, 0.2460735, -0.7945682, 1, 0.9960784, 0, 1,
-0.9713298, 0.1767976, -3.865787, 0.9960784, 1, 0, 1,
-0.9660165, -1.086831, -2.302429, 0.9921569, 1, 0, 1,
-0.9656856, -1.243551, -4.785482, 0.9843137, 1, 0, 1,
-0.9526309, 0.1366523, -1.621585, 0.9803922, 1, 0, 1,
-0.9510634, -0.831677, -2.933951, 0.972549, 1, 0, 1,
-0.9471676, -0.556655, -2.931195, 0.9686275, 1, 0, 1,
-0.9447187, -1.541178, -3.572733, 0.9607843, 1, 0, 1,
-0.9416254, -0.5188719, -2.543843, 0.9568627, 1, 0, 1,
-0.9377931, 1.689914, -0.9754257, 0.9490196, 1, 0, 1,
-0.9349987, -0.04817756, -1.034891, 0.945098, 1, 0, 1,
-0.9337327, -0.08795743, -1.278187, 0.9372549, 1, 0, 1,
-0.9317016, -0.2531172, -1.041104, 0.9333333, 1, 0, 1,
-0.9183047, 0.3487962, -0.8719203, 0.9254902, 1, 0, 1,
-0.9123048, 0.6831617, -0.6828987, 0.9215686, 1, 0, 1,
-0.9097924, -0.1133393, -0.4127944, 0.9137255, 1, 0, 1,
-0.9088907, 0.3549518, -0.6356214, 0.9098039, 1, 0, 1,
-0.9027234, -0.2160589, -1.582896, 0.9019608, 1, 0, 1,
-0.90008, -1.894021, -2.631607, 0.8941177, 1, 0, 1,
-0.8958917, 0.688369, -1.072621, 0.8901961, 1, 0, 1,
-0.8924415, 0.2341212, -0.3237985, 0.8823529, 1, 0, 1,
-0.8924156, 0.579469, -0.8576709, 0.8784314, 1, 0, 1,
-0.8891069, -0.9615585, -3.107165, 0.8705882, 1, 0, 1,
-0.8785848, -0.8895302, -2.233359, 0.8666667, 1, 0, 1,
-0.8756316, 0.5559171, -0.4424444, 0.8588235, 1, 0, 1,
-0.8648661, 0.9784262, -0.5885746, 0.854902, 1, 0, 1,
-0.860611, 0.9557638, -2.822389, 0.8470588, 1, 0, 1,
-0.8596529, -0.1610801, -0.6024724, 0.8431373, 1, 0, 1,
-0.8543796, -0.9362979, -1.739995, 0.8352941, 1, 0, 1,
-0.8532216, 0.8535782, -0.8548176, 0.8313726, 1, 0, 1,
-0.8512731, 0.3463558, -0.535136, 0.8235294, 1, 0, 1,
-0.8511556, -0.8814515, -3.428082, 0.8196079, 1, 0, 1,
-0.8482798, 0.3624769, 0.7927506, 0.8117647, 1, 0, 1,
-0.8473759, 0.4418501, 0.102708, 0.8078431, 1, 0, 1,
-0.8435273, -1.539661, -2.949118, 0.8, 1, 0, 1,
-0.8429646, 0.9488404, -2.81681, 0.7921569, 1, 0, 1,
-0.8421653, -0.4800765, -2.16566, 0.7882353, 1, 0, 1,
-0.8400683, -0.4464228, -3.976792, 0.7803922, 1, 0, 1,
-0.8370242, -2.146699, -2.267518, 0.7764706, 1, 0, 1,
-0.8300087, 0.320092, -2.398156, 0.7686275, 1, 0, 1,
-0.8274781, -0.3862049, -1.737978, 0.7647059, 1, 0, 1,
-0.8246995, -0.3685526, -1.383715, 0.7568628, 1, 0, 1,
-0.824024, 0.4019167, -2.381129, 0.7529412, 1, 0, 1,
-0.8171187, -1.002159, -2.817528, 0.7450981, 1, 0, 1,
-0.8149315, 0.3669767, 0.006447552, 0.7411765, 1, 0, 1,
-0.814414, 2.034551, 0.1634646, 0.7333333, 1, 0, 1,
-0.7990379, 0.6462719, -2.235635, 0.7294118, 1, 0, 1,
-0.7894194, -0.5476015, -0.573987, 0.7215686, 1, 0, 1,
-0.7865997, 0.1711166, -2.500799, 0.7176471, 1, 0, 1,
-0.7865696, -0.3217752, -2.246294, 0.7098039, 1, 0, 1,
-0.7840196, -1.880575, -3.244627, 0.7058824, 1, 0, 1,
-0.7764503, 1.444233, -2.010548, 0.6980392, 1, 0, 1,
-0.7722175, 0.05526102, -2.470744, 0.6901961, 1, 0, 1,
-0.7667589, 1.222244, -2.670401, 0.6862745, 1, 0, 1,
-0.7643304, -0.1029664, -1.818473, 0.6784314, 1, 0, 1,
-0.7550241, 1.08176, 0.2137806, 0.6745098, 1, 0, 1,
-0.751316, 0.5357082, -0.8619354, 0.6666667, 1, 0, 1,
-0.7479189, -0.1184221, -2.410686, 0.6627451, 1, 0, 1,
-0.747155, 1.219279, -1.582907, 0.654902, 1, 0, 1,
-0.7467397, 0.7205446, -0.52914, 0.6509804, 1, 0, 1,
-0.7458146, 0.3843471, -0.6605918, 0.6431373, 1, 0, 1,
-0.7455251, -0.3640442, -2.949303, 0.6392157, 1, 0, 1,
-0.7442787, 0.7476295, -2.3652, 0.6313726, 1, 0, 1,
-0.7438542, 0.1122473, -1.566258, 0.627451, 1, 0, 1,
-0.7434274, 0.947414, -0.3678263, 0.6196079, 1, 0, 1,
-0.7374483, 0.1501514, -1.789126, 0.6156863, 1, 0, 1,
-0.7365724, 0.1192279, -1.654021, 0.6078432, 1, 0, 1,
-0.7339628, 2.143576, -0.3379377, 0.6039216, 1, 0, 1,
-0.7302793, 0.6055247, -0.04993103, 0.5960785, 1, 0, 1,
-0.7291181, 0.8911132, -1.309361, 0.5882353, 1, 0, 1,
-0.7278183, -1.606295, -2.345019, 0.5843138, 1, 0, 1,
-0.7255363, -0.9565008, -2.406952, 0.5764706, 1, 0, 1,
-0.7236524, -0.7591701, -2.571343, 0.572549, 1, 0, 1,
-0.7221105, -0.2884163, -2.242049, 0.5647059, 1, 0, 1,
-0.7200632, 1.452146, -0.2148293, 0.5607843, 1, 0, 1,
-0.7186055, 0.6074475, 0.7395976, 0.5529412, 1, 0, 1,
-0.7144244, 0.1838959, -3.153703, 0.5490196, 1, 0, 1,
-0.7136301, 1.54276, -0.9933931, 0.5411765, 1, 0, 1,
-0.7118182, 0.5045018, -2.491407, 0.5372549, 1, 0, 1,
-0.7100271, 0.1179741, 0.4262311, 0.5294118, 1, 0, 1,
-0.7051285, 1.071457, 1.249248, 0.5254902, 1, 0, 1,
-0.6943791, 1.054336, 0.009761137, 0.5176471, 1, 0, 1,
-0.6894681, -0.1088749, -2.981936, 0.5137255, 1, 0, 1,
-0.6841695, 0.4061936, 0.129542, 0.5058824, 1, 0, 1,
-0.6800299, 1.573099, -1.996622, 0.5019608, 1, 0, 1,
-0.6791344, -1.20788, -2.946521, 0.4941176, 1, 0, 1,
-0.6710522, 0.3758719, -1.380538, 0.4862745, 1, 0, 1,
-0.6709542, 1.371015, 0.2878834, 0.4823529, 1, 0, 1,
-0.6686676, 1.842993, -0.18933, 0.4745098, 1, 0, 1,
-0.6668652, -1.484412, -5.136994, 0.4705882, 1, 0, 1,
-0.6664928, -0.1627774, -1.098035, 0.4627451, 1, 0, 1,
-0.664924, -1.25614, -1.900466, 0.4588235, 1, 0, 1,
-0.6640908, 0.3911968, -0.8274528, 0.4509804, 1, 0, 1,
-0.6626255, -0.5206424, -2.910246, 0.4470588, 1, 0, 1,
-0.6614191, -0.4298247, -1.216075, 0.4392157, 1, 0, 1,
-0.6583711, -0.6536173, -3.005725, 0.4352941, 1, 0, 1,
-0.6578037, 1.284027, -1.448325, 0.427451, 1, 0, 1,
-0.6502151, -1.591544, -3.056793, 0.4235294, 1, 0, 1,
-0.6455422, 2.565502, -0.1934843, 0.4156863, 1, 0, 1,
-0.644048, 1.013065, 0.5723076, 0.4117647, 1, 0, 1,
-0.6436064, -1.156858, -3.087288, 0.4039216, 1, 0, 1,
-0.639559, -0.006576024, -1.672759, 0.3960784, 1, 0, 1,
-0.6361583, 0.6514989, -0.385973, 0.3921569, 1, 0, 1,
-0.6346365, 0.2600851, -1.745819, 0.3843137, 1, 0, 1,
-0.6344762, 0.6809894, -0.8007855, 0.3803922, 1, 0, 1,
-0.6332612, 0.6995586, -0.3455051, 0.372549, 1, 0, 1,
-0.6196647, 0.4373262, -0.757098, 0.3686275, 1, 0, 1,
-0.6164653, -0.7483772, -1.041428, 0.3607843, 1, 0, 1,
-0.6135249, 0.8905116, 0.0784661, 0.3568628, 1, 0, 1,
-0.6126783, 0.6084558, -0.5019795, 0.3490196, 1, 0, 1,
-0.6103022, 1.166005, -0.9270863, 0.345098, 1, 0, 1,
-0.6066137, 0.5395113, -1.477251, 0.3372549, 1, 0, 1,
-0.5954338, -0.8855996, -2.362173, 0.3333333, 1, 0, 1,
-0.5861551, 2.153061, 0.446602, 0.3254902, 1, 0, 1,
-0.5854964, -0.5566439, -2.085275, 0.3215686, 1, 0, 1,
-0.5815492, 0.0103241, -3.316287, 0.3137255, 1, 0, 1,
-0.5788692, -0.3266487, -1.223632, 0.3098039, 1, 0, 1,
-0.5760795, 0.2373777, -1.378394, 0.3019608, 1, 0, 1,
-0.5718062, -1.085444, -3.198753, 0.2941177, 1, 0, 1,
-0.569383, 0.2855712, -0.9208435, 0.2901961, 1, 0, 1,
-0.5681034, 1.308103, -1.042122, 0.282353, 1, 0, 1,
-0.5649091, 1.259164, -0.03587015, 0.2784314, 1, 0, 1,
-0.564464, 1.173041, -0.8972213, 0.2705882, 1, 0, 1,
-0.5569011, 0.05043358, -1.379127, 0.2666667, 1, 0, 1,
-0.5510672, 1.291175, -0.1813055, 0.2588235, 1, 0, 1,
-0.5493957, -0.6527218, -3.037269, 0.254902, 1, 0, 1,
-0.5485775, -0.2484514, -0.9350592, 0.2470588, 1, 0, 1,
-0.5462563, 0.1442015, -0.2067422, 0.2431373, 1, 0, 1,
-0.5418532, 0.661751, -0.8012752, 0.2352941, 1, 0, 1,
-0.5363805, -1.328142, -4.816455, 0.2313726, 1, 0, 1,
-0.534021, -0.2422718, -3.921582, 0.2235294, 1, 0, 1,
-0.5323312, -0.3931988, -1.416115, 0.2196078, 1, 0, 1,
-0.5227209, -1.388415, -3.189454, 0.2117647, 1, 0, 1,
-0.5218711, 2.960341, 0.3666169, 0.2078431, 1, 0, 1,
-0.5154033, -0.6500908, -1.915541, 0.2, 1, 0, 1,
-0.5151799, 1.675852, -0.4132272, 0.1921569, 1, 0, 1,
-0.509837, -0.8417487, -3.460997, 0.1882353, 1, 0, 1,
-0.5071016, 0.1977521, -0.6090961, 0.1803922, 1, 0, 1,
-0.5070262, -0.03289234, -1.377152, 0.1764706, 1, 0, 1,
-0.5064261, -0.1556422, -2.894607, 0.1686275, 1, 0, 1,
-0.4993965, -0.6615638, -2.728485, 0.1647059, 1, 0, 1,
-0.4988148, 0.6889729, 0.5875685, 0.1568628, 1, 0, 1,
-0.4983896, 0.2994289, -1.156912, 0.1529412, 1, 0, 1,
-0.497445, 0.493021, 0.03061272, 0.145098, 1, 0, 1,
-0.4937894, -0.03864238, -1.257977, 0.1411765, 1, 0, 1,
-0.4917406, -0.09762207, -0.308133, 0.1333333, 1, 0, 1,
-0.4906757, 1.217186, 0.8251579, 0.1294118, 1, 0, 1,
-0.4876764, 2.651114, -0.1339176, 0.1215686, 1, 0, 1,
-0.4845993, 1.237687, -2.654593, 0.1176471, 1, 0, 1,
-0.483802, -1.247347, -2.444735, 0.1098039, 1, 0, 1,
-0.482371, -0.610453, -2.90573, 0.1058824, 1, 0, 1,
-0.4814494, -0.2538849, -1.454832, 0.09803922, 1, 0, 1,
-0.4778748, 0.1086, -0.1272147, 0.09019608, 1, 0, 1,
-0.4702052, -0.83018, -2.768563, 0.08627451, 1, 0, 1,
-0.466421, 1.963173, -2.257679, 0.07843138, 1, 0, 1,
-0.4651144, 0.919132, 0.6786344, 0.07450981, 1, 0, 1,
-0.4606855, 0.6881707, -1.458653, 0.06666667, 1, 0, 1,
-0.4573969, -1.974782, -4.202921, 0.0627451, 1, 0, 1,
-0.4569176, 0.6093663, -0.0391088, 0.05490196, 1, 0, 1,
-0.456571, 0.1194554, -2.643831, 0.05098039, 1, 0, 1,
-0.4559951, -1.892195, -3.265052, 0.04313726, 1, 0, 1,
-0.4510859, 0.2903244, 0.09917905, 0.03921569, 1, 0, 1,
-0.4493881, -0.3850622, -2.633406, 0.03137255, 1, 0, 1,
-0.4471537, 0.7715083, 0.1987802, 0.02745098, 1, 0, 1,
-0.4459813, -0.3834013, -3.00307, 0.01960784, 1, 0, 1,
-0.4440501, 0.06665373, -0.256411, 0.01568628, 1, 0, 1,
-0.4419794, -0.7462426, -2.949982, 0.007843138, 1, 0, 1,
-0.43987, 0.6223351, -0.6108242, 0.003921569, 1, 0, 1,
-0.4384621, 0.0167343, -2.737993, 0, 1, 0.003921569, 1,
-0.4383639, 0.9159285, 0.1721006, 0, 1, 0.01176471, 1,
-0.4342548, -0.1477291, -2.073971, 0, 1, 0.01568628, 1,
-0.427804, 1.436951, -1.254021, 0, 1, 0.02352941, 1,
-0.4274424, 0.09554919, -2.547306, 0, 1, 0.02745098, 1,
-0.4266227, -0.4589405, -1.673011, 0, 1, 0.03529412, 1,
-0.4240717, -1.103902, -3.964418, 0, 1, 0.03921569, 1,
-0.422417, 0.4483649, -0.8510787, 0, 1, 0.04705882, 1,
-0.4207937, -1.50412, -1.446832, 0, 1, 0.05098039, 1,
-0.4205429, 1.608068, -0.6724642, 0, 1, 0.05882353, 1,
-0.4159032, -1.342538, -5.316202, 0, 1, 0.0627451, 1,
-0.413469, 0.4552513, -0.1122845, 0, 1, 0.07058824, 1,
-0.413137, -0.5375476, -0.6478408, 0, 1, 0.07450981, 1,
-0.4075917, 0.7767818, -2.176079, 0, 1, 0.08235294, 1,
-0.4047681, -0.550793, -2.918205, 0, 1, 0.08627451, 1,
-0.3940117, 0.2127445, 0.04677647, 0, 1, 0.09411765, 1,
-0.39153, -1.366261, -1.441321, 0, 1, 0.1019608, 1,
-0.3904848, -0.344916, -1.724617, 0, 1, 0.1058824, 1,
-0.3877935, -1.315252, -0.6505222, 0, 1, 0.1137255, 1,
-0.3850583, -1.10264, -2.092678, 0, 1, 0.1176471, 1,
-0.383309, -0.1976877, -2.43078, 0, 1, 0.1254902, 1,
-0.3798713, 0.7995822, 1.404038, 0, 1, 0.1294118, 1,
-0.3743794, -0.6182917, -2.906101, 0, 1, 0.1372549, 1,
-0.3727629, 1.546344, 0.350327, 0, 1, 0.1411765, 1,
-0.3724245, 0.2111424, -0.3569393, 0, 1, 0.1490196, 1,
-0.3701995, -2.457563, -4.220106, 0, 1, 0.1529412, 1,
-0.3694391, -1.35972, -2.249762, 0, 1, 0.1607843, 1,
-0.3575329, -0.5931352, -2.351485, 0, 1, 0.1647059, 1,
-0.3562949, 0.6908579, 0.3144064, 0, 1, 0.172549, 1,
-0.3497066, -0.8427289, -2.509434, 0, 1, 0.1764706, 1,
-0.3491705, -0.4445229, -2.322545, 0, 1, 0.1843137, 1,
-0.3480971, -1.495667, -2.133725, 0, 1, 0.1882353, 1,
-0.3476598, 0.4968282, -1.075387, 0, 1, 0.1960784, 1,
-0.3435677, -0.09785973, 0.4674847, 0, 1, 0.2039216, 1,
-0.3426692, -0.02486528, -1.029371, 0, 1, 0.2078431, 1,
-0.3421783, -1.139261, -4.177169, 0, 1, 0.2156863, 1,
-0.3395467, 0.1217441, -0.5842231, 0, 1, 0.2196078, 1,
-0.3392412, -0.5893846, -1.647913, 0, 1, 0.227451, 1,
-0.3316186, 0.5041503, -0.4551281, 0, 1, 0.2313726, 1,
-0.3313124, 0.3870984, -0.6793581, 0, 1, 0.2392157, 1,
-0.3298646, 0.2783532, -2.441129, 0, 1, 0.2431373, 1,
-0.3250651, -0.2562667, -1.383754, 0, 1, 0.2509804, 1,
-0.3237921, -0.9180381, -2.75547, 0, 1, 0.254902, 1,
-0.3198077, 1.793194, -1.796963, 0, 1, 0.2627451, 1,
-0.3196448, -0.2676065, -3.599704, 0, 1, 0.2666667, 1,
-0.3142541, -1.497293, -3.389501, 0, 1, 0.2745098, 1,
-0.3142247, -1.075795, -2.507631, 0, 1, 0.2784314, 1,
-0.3103257, 1.457291, -2.05141, 0, 1, 0.2862745, 1,
-0.3099697, -1.221868, -3.928631, 0, 1, 0.2901961, 1,
-0.3086435, 1.713058, 1.780703, 0, 1, 0.2980392, 1,
-0.3085916, 1.28809, 0.2339534, 0, 1, 0.3058824, 1,
-0.3080954, 0.1787317, -0.3855019, 0, 1, 0.3098039, 1,
-0.3068812, -0.9131629, -3.740806, 0, 1, 0.3176471, 1,
-0.3046306, 2.251885, -1.111814, 0, 1, 0.3215686, 1,
-0.3020511, 0.1698713, 0.1734096, 0, 1, 0.3294118, 1,
-0.2955238, 0.2364941, -2.247556, 0, 1, 0.3333333, 1,
-0.2948495, -0.3249502, -3.341761, 0, 1, 0.3411765, 1,
-0.2902466, 0.1826806, -0.2081205, 0, 1, 0.345098, 1,
-0.2894194, -1.206082, -2.857725, 0, 1, 0.3529412, 1,
-0.2876458, -2.083946, -1.601176, 0, 1, 0.3568628, 1,
-0.287361, 0.1085144, -2.09429, 0, 1, 0.3647059, 1,
-0.2867388, -1.205927, -3.775883, 0, 1, 0.3686275, 1,
-0.2825198, 0.7069035, -1.404541, 0, 1, 0.3764706, 1,
-0.2761886, -0.2646693, -2.107335, 0, 1, 0.3803922, 1,
-0.2758331, -0.4708501, -1.125408, 0, 1, 0.3882353, 1,
-0.2675419, 1.900201, -0.03708178, 0, 1, 0.3921569, 1,
-0.267012, 0.367282, 1.342991, 0, 1, 0.4, 1,
-0.260536, -0.7118826, -5.195636, 0, 1, 0.4078431, 1,
-0.2584772, -0.8571968, -3.064977, 0, 1, 0.4117647, 1,
-0.252618, 1.068513, -0.4147282, 0, 1, 0.4196078, 1,
-0.2513687, -0.2227936, -0.8010012, 0, 1, 0.4235294, 1,
-0.2419983, -0.6393727, -3.70051, 0, 1, 0.4313726, 1,
-0.2399702, 0.7685075, -0.9897753, 0, 1, 0.4352941, 1,
-0.2359447, 1.82848, -1.382491, 0, 1, 0.4431373, 1,
-0.2357641, -0.2557694, -1.917088, 0, 1, 0.4470588, 1,
-0.2357635, 1.738055, -0.03705271, 0, 1, 0.454902, 1,
-0.233393, 0.5076692, -0.5022753, 0, 1, 0.4588235, 1,
-0.2281691, -0.5679998, -5.565636, 0, 1, 0.4666667, 1,
-0.2214681, -0.1571701, -2.029999, 0, 1, 0.4705882, 1,
-0.2197012, -0.005455991, -1.049886, 0, 1, 0.4784314, 1,
-0.2174399, 0.8204356, -1.96456, 0, 1, 0.4823529, 1,
-0.2171293, 1.381411, -1.255984, 0, 1, 0.4901961, 1,
-0.2118628, 0.5120484, 0.4690401, 0, 1, 0.4941176, 1,
-0.2118285, -1.810823, -3.686481, 0, 1, 0.5019608, 1,
-0.2112713, -0.2172136, -1.890886, 0, 1, 0.509804, 1,
-0.2098499, -0.8040878, -2.725847, 0, 1, 0.5137255, 1,
-0.2077167, -1.911865, -1.394067, 0, 1, 0.5215687, 1,
-0.2067824, 1.515147, -0.1384882, 0, 1, 0.5254902, 1,
-0.2050037, -0.3927878, -2.919609, 0, 1, 0.5333334, 1,
-0.2027953, 0.09302241, -0.410675, 0, 1, 0.5372549, 1,
-0.2027121, -1.687486, -3.526244, 0, 1, 0.5450981, 1,
-0.2024953, -1.292753, -3.496019, 0, 1, 0.5490196, 1,
-0.1989371, -0.03117908, -2.350422, 0, 1, 0.5568628, 1,
-0.1942729, -0.2608429, -2.73533, 0, 1, 0.5607843, 1,
-0.192174, 0.069062, -1.96481, 0, 1, 0.5686275, 1,
-0.1913509, -0.3403119, -2.549889, 0, 1, 0.572549, 1,
-0.1874569, 0.5652323, -3.069202, 0, 1, 0.5803922, 1,
-0.18741, 0.1385807, -1.973416, 0, 1, 0.5843138, 1,
-0.1872799, -1.644209, -1.435252, 0, 1, 0.5921569, 1,
-0.1792299, -0.2048939, -1.760785, 0, 1, 0.5960785, 1,
-0.1765124, 0.926411, 0.2130273, 0, 1, 0.6039216, 1,
-0.1720356, -0.08726411, -2.044971, 0, 1, 0.6117647, 1,
-0.1714005, 1.671066, -0.1477799, 0, 1, 0.6156863, 1,
-0.1709577, -0.03736642, -1.395254, 0, 1, 0.6235294, 1,
-0.1689545, 0.5115813, 0.05580734, 0, 1, 0.627451, 1,
-0.1683222, -0.1935297, -3.194267, 0, 1, 0.6352941, 1,
-0.1662147, -0.09200425, -2.324962, 0, 1, 0.6392157, 1,
-0.1583548, 0.4769319, -1.25698, 0, 1, 0.6470588, 1,
-0.1546207, -0.08587953, -2.678545, 0, 1, 0.6509804, 1,
-0.1506155, 0.4049618, -0.2292171, 0, 1, 0.6588235, 1,
-0.1448947, -0.3634171, -3.254237, 0, 1, 0.6627451, 1,
-0.1431032, -0.2304425, -3.23669, 0, 1, 0.6705883, 1,
-0.1399717, 2.414361, -0.7741909, 0, 1, 0.6745098, 1,
-0.1357844, 0.7985741, 0.8619469, 0, 1, 0.682353, 1,
-0.1304047, 0.3423682, 0.1193557, 0, 1, 0.6862745, 1,
-0.1278227, -1.821118, -2.445863, 0, 1, 0.6941177, 1,
-0.125761, 0.5495985, 0.1360947, 0, 1, 0.7019608, 1,
-0.1185066, 1.281008, -0.4770569, 0, 1, 0.7058824, 1,
-0.1148934, -0.2411889, -2.797988, 0, 1, 0.7137255, 1,
-0.113328, 0.6561142, -0.51011, 0, 1, 0.7176471, 1,
-0.1130417, 1.65245, -1.00538, 0, 1, 0.7254902, 1,
-0.1079505, -0.456457, -2.279837, 0, 1, 0.7294118, 1,
-0.1058617, -1.507663, -4.502157, 0, 1, 0.7372549, 1,
-0.104241, -0.7353132, -2.757993, 0, 1, 0.7411765, 1,
-0.1011415, 0.2300192, -1.830179, 0, 1, 0.7490196, 1,
-0.1003179, -1.352752, -3.338006, 0, 1, 0.7529412, 1,
-0.09950621, 0.6368003, -0.8189721, 0, 1, 0.7607843, 1,
-0.0989007, 0.02546883, -2.07921, 0, 1, 0.7647059, 1,
-0.09434415, 0.5368745, -1.746622, 0, 1, 0.772549, 1,
-0.09419961, 1.545437, -1.509181, 0, 1, 0.7764706, 1,
-0.09416281, -1.267541, -2.492484, 0, 1, 0.7843137, 1,
-0.09366675, 0.6529279, -0.7588143, 0, 1, 0.7882353, 1,
-0.09226727, 0.6344732, 1.494698, 0, 1, 0.7960784, 1,
-0.09143361, -0.3942415, -3.376199, 0, 1, 0.8039216, 1,
-0.09130891, -0.6398817, -2.526978, 0, 1, 0.8078431, 1,
-0.09076042, -0.3732429, -3.750148, 0, 1, 0.8156863, 1,
-0.08945525, 0.4588006, -0.1635707, 0, 1, 0.8196079, 1,
-0.07946417, -0.7331538, -3.751025, 0, 1, 0.827451, 1,
-0.07851586, -0.8844321, -3.485718, 0, 1, 0.8313726, 1,
-0.07765512, 0.5490437, -0.9420633, 0, 1, 0.8392157, 1,
-0.07741835, -0.1199235, -1.042663, 0, 1, 0.8431373, 1,
-0.07660941, 1.141523, -0.6528645, 0, 1, 0.8509804, 1,
-0.06757171, -0.7685905, -2.08848, 0, 1, 0.854902, 1,
-0.06531332, -0.1130441, -1.702437, 0, 1, 0.8627451, 1,
-0.06351996, -1.497066, -2.433299, 0, 1, 0.8666667, 1,
-0.0633305, 1.381547, -1.569891, 0, 1, 0.8745098, 1,
-0.06118146, 0.2846943, 0.00772024, 0, 1, 0.8784314, 1,
-0.05758623, -0.1524971, -3.14978, 0, 1, 0.8862745, 1,
-0.05754728, 0.6138784, 1.656091, 0, 1, 0.8901961, 1,
-0.05570551, -1.049348, -3.608088, 0, 1, 0.8980392, 1,
-0.05219423, 0.7826252, -0.4686476, 0, 1, 0.9058824, 1,
-0.04482361, -1.313801, -4.268675, 0, 1, 0.9098039, 1,
-0.04374623, -0.6126084, -3.2342, 0, 1, 0.9176471, 1,
-0.04018291, 0.3659946, -0.1785449, 0, 1, 0.9215686, 1,
-0.03974191, -0.01790013, -0.2171469, 0, 1, 0.9294118, 1,
-0.039563, -0.3879704, -4.856489, 0, 1, 0.9333333, 1,
-0.03854775, -0.979158, -2.207238, 0, 1, 0.9411765, 1,
-0.03811512, -1.478712, -3.013815, 0, 1, 0.945098, 1,
-0.03754079, 1.454652, -0.2003747, 0, 1, 0.9529412, 1,
-0.03737652, -0.7216733, -4.029603, 0, 1, 0.9568627, 1,
-0.03689564, -0.3187037, -1.560277, 0, 1, 0.9647059, 1,
-0.03343778, -1.372577, -2.859131, 0, 1, 0.9686275, 1,
-0.02123033, 0.1974217, 1.402149, 0, 1, 0.9764706, 1,
-0.01766019, -0.1868557, -3.221022, 0, 1, 0.9803922, 1,
-0.01277356, -0.2286624, -4.512836, 0, 1, 0.9882353, 1,
-0.01105643, 1.427297, 1.53885, 0, 1, 0.9921569, 1,
-0.01082672, 0.5321847, 0.3893932, 0, 1, 1, 1,
-0.01038285, -0.2612449, -1.15185, 0, 0.9921569, 1, 1,
-0.009989157, -0.2100948, -1.779815, 0, 0.9882353, 1, 1,
-0.009764237, -0.1536582, -3.884881, 0, 0.9803922, 1, 1,
-0.008806772, -0.6263016, -2.917194, 0, 0.9764706, 1, 1,
-0.008476384, 0.4734088, 0.6167328, 0, 0.9686275, 1, 1,
-0.005238995, 0.7685549, -1.271845, 0, 0.9647059, 1, 1,
-0.003860656, -0.3336925, -1.04476, 0, 0.9568627, 1, 1,
-0.002146394, 0.1812426, -1.104724, 0, 0.9529412, 1, 1,
0.004621767, 0.7381011, 0.6583338, 0, 0.945098, 1, 1,
0.005323455, 1.034014, 0.1597792, 0, 0.9411765, 1, 1,
0.00632196, 0.5868441, -0.8249109, 0, 0.9333333, 1, 1,
0.007791001, 0.09820095, 1.485004, 0, 0.9294118, 1, 1,
0.009508044, 0.7802103, 1.851163, 0, 0.9215686, 1, 1,
0.02547987, 1.064411, 0.615259, 0, 0.9176471, 1, 1,
0.02578433, 0.2416475, 0.2834076, 0, 0.9098039, 1, 1,
0.02756112, 1.850033, 0.07108309, 0, 0.9058824, 1, 1,
0.0316847, 0.7272555, -0.8942119, 0, 0.8980392, 1, 1,
0.04298038, 1.105192, 0.4405634, 0, 0.8901961, 1, 1,
0.04515855, 0.9614765, 1.491255, 0, 0.8862745, 1, 1,
0.04523024, -0.7399021, 2.952797, 0, 0.8784314, 1, 1,
0.04556217, 0.6250086, -0.7299511, 0, 0.8745098, 1, 1,
0.04612173, -0.3259425, 2.418811, 0, 0.8666667, 1, 1,
0.04953526, 0.3800235, 1.964706, 0, 0.8627451, 1, 1,
0.05101191, -1.891682, 2.111337, 0, 0.854902, 1, 1,
0.05499298, -0.6297428, 4.815081, 0, 0.8509804, 1, 1,
0.05881779, 1.288987, -0.529372, 0, 0.8431373, 1, 1,
0.06364881, 1.170998, 0.5396677, 0, 0.8392157, 1, 1,
0.06411436, 1.012588, 0.5897231, 0, 0.8313726, 1, 1,
0.06969461, -0.09517758, 1.745632, 0, 0.827451, 1, 1,
0.07161231, -0.3913074, 2.279922, 0, 0.8196079, 1, 1,
0.07272243, -2.077233, 2.204703, 0, 0.8156863, 1, 1,
0.07430412, -1.254607, 3.926425, 0, 0.8078431, 1, 1,
0.07890628, -0.009427782, 2.240479, 0, 0.8039216, 1, 1,
0.08195906, 1.074465, 1.643399, 0, 0.7960784, 1, 1,
0.08365228, -1.398214, 3.449856, 0, 0.7882353, 1, 1,
0.08845579, -1.308414, 4.796299, 0, 0.7843137, 1, 1,
0.08851422, 0.8216761, 0.5145917, 0, 0.7764706, 1, 1,
0.08881718, 2.029423, -0.6726465, 0, 0.772549, 1, 1,
0.08955236, 1.176413, -1.847316, 0, 0.7647059, 1, 1,
0.09166528, -0.1027939, 3.768778, 0, 0.7607843, 1, 1,
0.09230761, 0.4429821, 1.080059, 0, 0.7529412, 1, 1,
0.09527725, 1.472198, -0.3310111, 0, 0.7490196, 1, 1,
0.09622261, 0.3793441, -0.7331516, 0, 0.7411765, 1, 1,
0.09705426, 1.114622, 1.007249, 0, 0.7372549, 1, 1,
0.1001985, -0.7666502, 2.131282, 0, 0.7294118, 1, 1,
0.1031377, 0.2282771, 2.320678, 0, 0.7254902, 1, 1,
0.1032289, 0.2079762, 1.103838, 0, 0.7176471, 1, 1,
0.1034948, -0.2400365, 1.556931, 0, 0.7137255, 1, 1,
0.1043795, -1.850852, 4.121637, 0, 0.7058824, 1, 1,
0.1048272, -1.244801, 2.878524, 0, 0.6980392, 1, 1,
0.1057832, -1.466254, 2.838845, 0, 0.6941177, 1, 1,
0.1089221, -0.1727292, 2.784613, 0, 0.6862745, 1, 1,
0.1112429, -0.04244667, 2.343245, 0, 0.682353, 1, 1,
0.117295, 1.360295, 1.337901, 0, 0.6745098, 1, 1,
0.1197378, 0.4646396, -0.4802066, 0, 0.6705883, 1, 1,
0.1201396, -0.2586894, 3.054154, 0, 0.6627451, 1, 1,
0.1204842, -1.026553, 2.252386, 0, 0.6588235, 1, 1,
0.1222441, -0.2972624, 2.317604, 0, 0.6509804, 1, 1,
0.1228992, -0.2801015, 5.199042, 0, 0.6470588, 1, 1,
0.1241492, -0.6445736, 3.03313, 0, 0.6392157, 1, 1,
0.1258389, -0.1083905, 2.717199, 0, 0.6352941, 1, 1,
0.127303, -2.304906, 3.469886, 0, 0.627451, 1, 1,
0.1341596, 0.3035933, -0.5268008, 0, 0.6235294, 1, 1,
0.1348655, -0.7757108, 2.160869, 0, 0.6156863, 1, 1,
0.1362436, 0.7063589, -1.021392, 0, 0.6117647, 1, 1,
0.1412796, -0.07707161, 2.172565, 0, 0.6039216, 1, 1,
0.1427242, 1.251935, 0.1768681, 0, 0.5960785, 1, 1,
0.1430874, -1.098672, 0.748411, 0, 0.5921569, 1, 1,
0.1434368, 0.6203168, 1.238319, 0, 0.5843138, 1, 1,
0.1491698, 0.06666023, 0.6655734, 0, 0.5803922, 1, 1,
0.1512502, -1.27293, 1.99254, 0, 0.572549, 1, 1,
0.159012, 0.631422, -0.7273892, 0, 0.5686275, 1, 1,
0.1598693, -0.5713192, 1.04106, 0, 0.5607843, 1, 1,
0.1630789, -0.6006025, 2.752143, 0, 0.5568628, 1, 1,
0.1645474, -0.605234, 4.887251, 0, 0.5490196, 1, 1,
0.1648442, -1.093625, 2.951088, 0, 0.5450981, 1, 1,
0.1693249, -0.5055673, 2.760212, 0, 0.5372549, 1, 1,
0.1729627, -0.978192, 1.7659, 0, 0.5333334, 1, 1,
0.178333, -0.7318231, 2.808361, 0, 0.5254902, 1, 1,
0.1783611, -0.04303119, 2.871044, 0, 0.5215687, 1, 1,
0.1786173, 1.887226, -0.8659129, 0, 0.5137255, 1, 1,
0.1803444, 1.092825, 0.3197826, 0, 0.509804, 1, 1,
0.1815918, -1.816138, 0.7589178, 0, 0.5019608, 1, 1,
0.1851235, 0.3478024, 1.028504, 0, 0.4941176, 1, 1,
0.1898839, -0.6892821, 1.145327, 0, 0.4901961, 1, 1,
0.1907932, 1.161903, 0.5737004, 0, 0.4823529, 1, 1,
0.1950003, 0.1357654, 1.03757, 0, 0.4784314, 1, 1,
0.201631, 1.325245, -1.802863, 0, 0.4705882, 1, 1,
0.2026086, -0.6944757, 2.267053, 0, 0.4666667, 1, 1,
0.2030826, 0.3885374, 0.8603196, 0, 0.4588235, 1, 1,
0.2065621, -0.5486004, 3.666328, 0, 0.454902, 1, 1,
0.2073143, -1.019567, 3.202423, 0, 0.4470588, 1, 1,
0.2127132, -1.070542, 3.356, 0, 0.4431373, 1, 1,
0.2136319, 2.329507, 0.8319749, 0, 0.4352941, 1, 1,
0.2161453, 0.5533409, -0.09087966, 0, 0.4313726, 1, 1,
0.2222315, 0.5990188, 0.620133, 0, 0.4235294, 1, 1,
0.2259877, 0.4381247, 0.6486446, 0, 0.4196078, 1, 1,
0.2293236, 1.645127, -1.86825, 0, 0.4117647, 1, 1,
0.233403, 0.6115546, 2.231802, 0, 0.4078431, 1, 1,
0.240989, 0.322483, 0.04572998, 0, 0.4, 1, 1,
0.2464632, -0.9959707, 2.235736, 0, 0.3921569, 1, 1,
0.248742, 0.3953559, -0.8510507, 0, 0.3882353, 1, 1,
0.249161, 0.8197406, 0.9109228, 0, 0.3803922, 1, 1,
0.2493461, 0.1974019, 0.8048196, 0, 0.3764706, 1, 1,
0.2526489, -0.7283888, 3.393546, 0, 0.3686275, 1, 1,
0.253784, 0.1891976, 3.514017, 0, 0.3647059, 1, 1,
0.2539569, -0.3232412, 1.63989, 0, 0.3568628, 1, 1,
0.2565422, 0.6826159, 0.7273436, 0, 0.3529412, 1, 1,
0.25879, -0.4200126, 1.838944, 0, 0.345098, 1, 1,
0.258925, 2.139835, -1.354579, 0, 0.3411765, 1, 1,
0.2628006, -0.5031206, 2.622905, 0, 0.3333333, 1, 1,
0.2651574, 0.9812696, 1.160441, 0, 0.3294118, 1, 1,
0.2710312, 0.9419187, 0.5742378, 0, 0.3215686, 1, 1,
0.274097, -0.3711691, 3.681578, 0, 0.3176471, 1, 1,
0.2792858, 0.2369056, 0.4337182, 0, 0.3098039, 1, 1,
0.2801147, 0.1822515, 0.03577338, 0, 0.3058824, 1, 1,
0.287108, -0.366355, 3.560817, 0, 0.2980392, 1, 1,
0.2872702, -1.356623, 3.397665, 0, 0.2901961, 1, 1,
0.2881617, -0.8262748, 0.8486685, 0, 0.2862745, 1, 1,
0.2885305, -0.3766975, 1.970315, 0, 0.2784314, 1, 1,
0.2891719, 0.9623215, 0.7094172, 0, 0.2745098, 1, 1,
0.2925293, 0.08053559, 1.397364, 0, 0.2666667, 1, 1,
0.2948359, -0.7901394, 1.698118, 0, 0.2627451, 1, 1,
0.2952211, -1.921929, 2.79182, 0, 0.254902, 1, 1,
0.2977155, -0.133043, 1.233326, 0, 0.2509804, 1, 1,
0.2983248, 0.7184675, -0.7212056, 0, 0.2431373, 1, 1,
0.2999294, 0.814065, 0.6179895, 0, 0.2392157, 1, 1,
0.3012327, -0.7007402, 2.272566, 0, 0.2313726, 1, 1,
0.3016945, 0.1828954, 2.471496, 0, 0.227451, 1, 1,
0.3065342, -0.4155192, 2.179924, 0, 0.2196078, 1, 1,
0.3067264, -0.06954066, 1.093295, 0, 0.2156863, 1, 1,
0.3092837, 1.027879, -0.1427364, 0, 0.2078431, 1, 1,
0.3179762, 0.5613783, 1.363948, 0, 0.2039216, 1, 1,
0.3200223, -0.1241433, 2.069562, 0, 0.1960784, 1, 1,
0.3230399, 0.05296299, -0.5900865, 0, 0.1882353, 1, 1,
0.3273177, -0.08369596, 1.171959, 0, 0.1843137, 1, 1,
0.3275228, -1.50528, 3.586807, 0, 0.1764706, 1, 1,
0.3287576, 1.162923, 1.079491, 0, 0.172549, 1, 1,
0.3293153, 0.05075724, 0.839389, 0, 0.1647059, 1, 1,
0.3364117, 1.423772, -0.2042752, 0, 0.1607843, 1, 1,
0.3365034, 1.003079, 0.4069643, 0, 0.1529412, 1, 1,
0.3381377, 0.1810302, 1.59811, 0, 0.1490196, 1, 1,
0.345394, 0.9448133, 1.072157, 0, 0.1411765, 1, 1,
0.3467225, -0.6711075, 0.9291335, 0, 0.1372549, 1, 1,
0.3553789, -0.6348635, 3.939348, 0, 0.1294118, 1, 1,
0.363778, 0.07200302, 1.742162, 0, 0.1254902, 1, 1,
0.3658276, 0.09272861, -0.9205382, 0, 0.1176471, 1, 1,
0.3705988, -1.654997, 2.980232, 0, 0.1137255, 1, 1,
0.370886, 0.11327, 2.851211, 0, 0.1058824, 1, 1,
0.371721, -0.21877, 2.303944, 0, 0.09803922, 1, 1,
0.3748638, 0.2325232, 0.496611, 0, 0.09411765, 1, 1,
0.3783545, 0.8759413, 1.087104, 0, 0.08627451, 1, 1,
0.3790828, 0.7749919, -1.819295, 0, 0.08235294, 1, 1,
0.3801138, -1.093444, 3.503935, 0, 0.07450981, 1, 1,
0.3866308, 1.105651, -1.325073, 0, 0.07058824, 1, 1,
0.3879053, -0.2815284, 0.7901973, 0, 0.0627451, 1, 1,
0.3884025, 0.8772678, -0.2031846, 0, 0.05882353, 1, 1,
0.3884218, -0.7932197, 2.660196, 0, 0.05098039, 1, 1,
0.388936, -1.283762, 2.021288, 0, 0.04705882, 1, 1,
0.3919065, -0.4435161, 2.394529, 0, 0.03921569, 1, 1,
0.3959218, 0.05017021, 1.492909, 0, 0.03529412, 1, 1,
0.3969815, 0.7269062, 1.679625, 0, 0.02745098, 1, 1,
0.3991706, 0.5893404, -0.7215293, 0, 0.02352941, 1, 1,
0.3992518, -1.934347, 3.77434, 0, 0.01568628, 1, 1,
0.4001186, 2.086795, -0.3832497, 0, 0.01176471, 1, 1,
0.4048331, -1.310881, 3.831828, 0, 0.003921569, 1, 1,
0.4127408, -1.079592, 1.826012, 0.003921569, 0, 1, 1,
0.4128481, 1.046655, 1.306127, 0.007843138, 0, 1, 1,
0.4134989, -0.3215252, 2.422051, 0.01568628, 0, 1, 1,
0.4153613, -1.167643, 2.318588, 0.01960784, 0, 1, 1,
0.4214788, 0.5662, -1.701671, 0.02745098, 0, 1, 1,
0.4226529, -1.038895, 2.277318, 0.03137255, 0, 1, 1,
0.423467, -0.65688, 3.120948, 0.03921569, 0, 1, 1,
0.4235948, -0.1867482, 1.419832, 0.04313726, 0, 1, 1,
0.42369, -0.1117455, 0.7426187, 0.05098039, 0, 1, 1,
0.4282417, 0.562281, 1.310914, 0.05490196, 0, 1, 1,
0.4293257, 1.207681, -1.248975, 0.0627451, 0, 1, 1,
0.4302536, -0.2392156, 3.486861, 0.06666667, 0, 1, 1,
0.4303918, -2.523803, 3.57277, 0.07450981, 0, 1, 1,
0.4410098, -1.078024, 3.693104, 0.07843138, 0, 1, 1,
0.4413482, 0.06378736, 0.5186046, 0.08627451, 0, 1, 1,
0.4416574, 0.5544034, 2.138157, 0.09019608, 0, 1, 1,
0.4441002, -0.8009543, 2.708049, 0.09803922, 0, 1, 1,
0.4469992, 1.129004, 0.2477924, 0.1058824, 0, 1, 1,
0.4478648, 0.5393423, 0.9264578, 0.1098039, 0, 1, 1,
0.4506826, 1.128377, -0.03295592, 0.1176471, 0, 1, 1,
0.4518654, -0.7981114, 3.208917, 0.1215686, 0, 1, 1,
0.4520851, -0.09319241, 2.254401, 0.1294118, 0, 1, 1,
0.4527357, 1.692024, -0.2728595, 0.1333333, 0, 1, 1,
0.4530309, 1.998078, 0.3460379, 0.1411765, 0, 1, 1,
0.4619553, 0.8640445, 2.011882, 0.145098, 0, 1, 1,
0.4643444, 0.663156, 1.160432, 0.1529412, 0, 1, 1,
0.4657844, -0.4369954, 2.893083, 0.1568628, 0, 1, 1,
0.4687631, 2.794052, 1.032654, 0.1647059, 0, 1, 1,
0.4689492, -1.056832, 2.088827, 0.1686275, 0, 1, 1,
0.4691744, -3.450886, 5.532515, 0.1764706, 0, 1, 1,
0.4707799, -0.7549692, 2.682814, 0.1803922, 0, 1, 1,
0.4746311, 0.004553765, 0.671142, 0.1882353, 0, 1, 1,
0.4748288, 0.214943, 2.496388, 0.1921569, 0, 1, 1,
0.4749159, 0.125974, 2.485091, 0.2, 0, 1, 1,
0.4755059, 1.398529, 0.8659444, 0.2078431, 0, 1, 1,
0.4810514, 1.251597, 1.335005, 0.2117647, 0, 1, 1,
0.4827305, -0.0442028, 3.055431, 0.2196078, 0, 1, 1,
0.4828019, 0.8610515, 0.3209867, 0.2235294, 0, 1, 1,
0.4832856, -0.3565777, 1.894667, 0.2313726, 0, 1, 1,
0.4833845, 0.6899812, -0.4816465, 0.2352941, 0, 1, 1,
0.4836881, 1.94748, -0.8246227, 0.2431373, 0, 1, 1,
0.4838783, -1.27562, 2.18163, 0.2470588, 0, 1, 1,
0.4914338, -0.5092203, 3.396858, 0.254902, 0, 1, 1,
0.4947103, 0.4459547, -0.451587, 0.2588235, 0, 1, 1,
0.4984177, -0.6190714, 3.746249, 0.2666667, 0, 1, 1,
0.5052608, 0.9747086, 0.6115825, 0.2705882, 0, 1, 1,
0.5053926, 0.8598412, 0.3002738, 0.2784314, 0, 1, 1,
0.5075568, -1.6794, 4.353965, 0.282353, 0, 1, 1,
0.519696, 0.2694438, 1.191, 0.2901961, 0, 1, 1,
0.5239645, -0.8672963, 2.14747, 0.2941177, 0, 1, 1,
0.5263311, 0.8045275, 1.678728, 0.3019608, 0, 1, 1,
0.5280742, -0.8642614, 1.573699, 0.3098039, 0, 1, 1,
0.5299103, 1.215908, -1.773092, 0.3137255, 0, 1, 1,
0.5307755, -0.4019097, 0.03226865, 0.3215686, 0, 1, 1,
0.534913, 1.319721, -0.782607, 0.3254902, 0, 1, 1,
0.5381688, 0.7285866, 0.4686593, 0.3333333, 0, 1, 1,
0.55378, -0.07877652, 1.07946, 0.3372549, 0, 1, 1,
0.5644094, -2.694003, 3.852935, 0.345098, 0, 1, 1,
0.5682331, -0.4848472, 3.194366, 0.3490196, 0, 1, 1,
0.5754119, -1.123538, 2.617255, 0.3568628, 0, 1, 1,
0.6028748, 1.193958, -1.026525, 0.3607843, 0, 1, 1,
0.6058066, -1.079799, 1.866853, 0.3686275, 0, 1, 1,
0.6187083, -1.443391, 3.43658, 0.372549, 0, 1, 1,
0.6247296, 1.258805, 1.085673, 0.3803922, 0, 1, 1,
0.6258238, -0.3406575, 1.750414, 0.3843137, 0, 1, 1,
0.6395704, -1.720579, 4.170835, 0.3921569, 0, 1, 1,
0.647238, -0.2521618, 1.365022, 0.3960784, 0, 1, 1,
0.6494001, 1.683951, 0.4170974, 0.4039216, 0, 1, 1,
0.6566555, 0.6890842, 0.3916907, 0.4117647, 0, 1, 1,
0.6632953, -0.5201521, 2.348217, 0.4156863, 0, 1, 1,
0.6645148, 0.08458779, 4.113381, 0.4235294, 0, 1, 1,
0.6696056, 0.214986, 2.185328, 0.427451, 0, 1, 1,
0.6720843, -0.09443718, 2.511569, 0.4352941, 0, 1, 1,
0.6725201, -0.1998831, 3.144096, 0.4392157, 0, 1, 1,
0.6758044, -0.0423265, 3.350703, 0.4470588, 0, 1, 1,
0.6759561, -1.088519, 2.451231, 0.4509804, 0, 1, 1,
0.6851642, 0.4589727, 0.6948162, 0.4588235, 0, 1, 1,
0.6963877, 0.5538876, 1.810064, 0.4627451, 0, 1, 1,
0.7015043, -0.5661428, 2.709493, 0.4705882, 0, 1, 1,
0.7155028, -0.05380493, 1.739428, 0.4745098, 0, 1, 1,
0.7163648, 0.626729, -0.4843269, 0.4823529, 0, 1, 1,
0.7196529, 0.6933048, 1.583491, 0.4862745, 0, 1, 1,
0.7219428, -1.857748, 3.179546, 0.4941176, 0, 1, 1,
0.7236573, -2.423959, 3.957924, 0.5019608, 0, 1, 1,
0.7300786, -2.130878, 1.514228, 0.5058824, 0, 1, 1,
0.7373554, 0.1624968, -0.2196068, 0.5137255, 0, 1, 1,
0.7432047, 1.474659, 0.1669457, 0.5176471, 0, 1, 1,
0.7439476, -0.5944619, 2.816672, 0.5254902, 0, 1, 1,
0.7451068, 0.6984233, 0.5777681, 0.5294118, 0, 1, 1,
0.7465516, 0.2538081, 0.7789685, 0.5372549, 0, 1, 1,
0.7502255, -0.5650464, 3.578355, 0.5411765, 0, 1, 1,
0.7512454, 0.8456178, 0.2345413, 0.5490196, 0, 1, 1,
0.752885, 2.554566, 0.3338887, 0.5529412, 0, 1, 1,
0.7589718, 0.3600106, 1.446758, 0.5607843, 0, 1, 1,
0.7604979, 0.2661763, 0.1872038, 0.5647059, 0, 1, 1,
0.7642606, -1.322165, 2.980982, 0.572549, 0, 1, 1,
0.7653058, -1.217081, 3.377893, 0.5764706, 0, 1, 1,
0.7733698, -0.3652345, 2.006678, 0.5843138, 0, 1, 1,
0.773706, 0.8187945, 1.131002, 0.5882353, 0, 1, 1,
0.7737816, -0.2095438, 1.709866, 0.5960785, 0, 1, 1,
0.776729, 1.076265, 0.7286496, 0.6039216, 0, 1, 1,
0.7777013, -1.400651, 1.234177, 0.6078432, 0, 1, 1,
0.7839297, 0.7688656, -0.068289, 0.6156863, 0, 1, 1,
0.784933, 0.602161, 0.854361, 0.6196079, 0, 1, 1,
0.7853138, -0.8889254, 2.462806, 0.627451, 0, 1, 1,
0.7855248, 0.5284613, 0.3777222, 0.6313726, 0, 1, 1,
0.78828, -0.254966, 0.9563776, 0.6392157, 0, 1, 1,
0.7885274, 1.914099, -0.2659836, 0.6431373, 0, 1, 1,
0.7945108, 0.7547849, 1.481925, 0.6509804, 0, 1, 1,
0.7945129, 0.3298471, 0.8956881, 0.654902, 0, 1, 1,
0.7952822, -0.4767033, 3.508993, 0.6627451, 0, 1, 1,
0.8018842, 1.489683, 0.2761698, 0.6666667, 0, 1, 1,
0.804958, -0.7780805, 2.606681, 0.6745098, 0, 1, 1,
0.8087088, -0.3302258, 1.186098, 0.6784314, 0, 1, 1,
0.8126888, -0.3949701, 3.069102, 0.6862745, 0, 1, 1,
0.8133909, -0.2422953, 0.9882174, 0.6901961, 0, 1, 1,
0.8146753, -0.5670896, 2.528019, 0.6980392, 0, 1, 1,
0.817888, 1.486704, -0.821654, 0.7058824, 0, 1, 1,
0.8183762, -1.124138, 2.565949, 0.7098039, 0, 1, 1,
0.819779, -0.9021412, 2.67187, 0.7176471, 0, 1, 1,
0.8200551, -0.7445809, 2.970835, 0.7215686, 0, 1, 1,
0.8248658, -2.438959, 2.131868, 0.7294118, 0, 1, 1,
0.8260006, 1.683607, 0.5711246, 0.7333333, 0, 1, 1,
0.8277901, 1.485202, -1.280801, 0.7411765, 0, 1, 1,
0.8278039, 1.364881, -0.3386641, 0.7450981, 0, 1, 1,
0.8282412, 0.2329656, -0.01648653, 0.7529412, 0, 1, 1,
0.8292384, -1.020975, 2.340581, 0.7568628, 0, 1, 1,
0.8294836, -0.5807614, 2.076878, 0.7647059, 0, 1, 1,
0.8348448, -0.6496344, 2.852721, 0.7686275, 0, 1, 1,
0.8390394, 0.7663186, 1.212583, 0.7764706, 0, 1, 1,
0.8502408, -0.6183069, 2.994344, 0.7803922, 0, 1, 1,
0.8538655, 0.8021585, 1.377887, 0.7882353, 0, 1, 1,
0.8550754, -0.3705299, 3.245849, 0.7921569, 0, 1, 1,
0.8695386, -1.059323, 3.209921, 0.8, 0, 1, 1,
0.8728535, 0.6441463, 1.683163, 0.8078431, 0, 1, 1,
0.874432, -1.747466, 4.493193, 0.8117647, 0, 1, 1,
0.8755332, -0.3312899, 0.7876947, 0.8196079, 0, 1, 1,
0.8798408, 0.3857877, 1.674695, 0.8235294, 0, 1, 1,
0.8857228, 0.7194403, 1.72598, 0.8313726, 0, 1, 1,
0.8912165, -1.050695, 3.310476, 0.8352941, 0, 1, 1,
0.8923411, -0.3760149, 1.975993, 0.8431373, 0, 1, 1,
0.8939303, -0.319807, 1.566934, 0.8470588, 0, 1, 1,
0.8995799, 1.153358, -0.4902119, 0.854902, 0, 1, 1,
0.9004849, 1.07925, 1.376885, 0.8588235, 0, 1, 1,
0.9151541, 1.316112, 0.8028299, 0.8666667, 0, 1, 1,
0.9259257, -1.359735, 3.244394, 0.8705882, 0, 1, 1,
0.9312797, 0.487118, 1.777128, 0.8784314, 0, 1, 1,
0.9353286, -0.2955383, 1.486039, 0.8823529, 0, 1, 1,
0.9368421, -0.1904021, 0.9863751, 0.8901961, 0, 1, 1,
0.9381314, -0.2988747, 2.164618, 0.8941177, 0, 1, 1,
0.9400542, 0.7964228, 1.565033, 0.9019608, 0, 1, 1,
0.9492223, -0.3348502, 1.710557, 0.9098039, 0, 1, 1,
0.9589911, -0.9031767, 3.063696, 0.9137255, 0, 1, 1,
0.9613026, -0.426513, 0.7390576, 0.9215686, 0, 1, 1,
0.9619341, 0.0647587, 0.9360901, 0.9254902, 0, 1, 1,
0.9620872, -0.3218937, 2.246229, 0.9333333, 0, 1, 1,
0.9629657, -0.4817406, 1.827866, 0.9372549, 0, 1, 1,
0.9659294, 1.149809, 1.211082, 0.945098, 0, 1, 1,
0.9735876, -0.7788589, 1.899704, 0.9490196, 0, 1, 1,
0.9797155, -1.907179, 2.449578, 0.9568627, 0, 1, 1,
0.9803061, -0.1044575, 0.4342649, 0.9607843, 0, 1, 1,
0.9856598, 0.1565786, -0.4237396, 0.9686275, 0, 1, 1,
0.993359, -0.6550295, 2.019687, 0.972549, 0, 1, 1,
0.9995572, 0.7220714, 1.718357, 0.9803922, 0, 1, 1,
1.000302, -0.2043258, 1.319122, 0.9843137, 0, 1, 1,
1.001185, -1.168845, 3.198747, 0.9921569, 0, 1, 1,
1.011586, -0.1927146, 0.5611162, 0.9960784, 0, 1, 1,
1.01464, 1.896651, 1.094824, 1, 0, 0.9960784, 1,
1.022658, -0.2278005, 2.046479, 1, 0, 0.9882353, 1,
1.024507, 1.067546, 1.546649, 1, 0, 0.9843137, 1,
1.028909, 0.2607471, -0.1763017, 1, 0, 0.9764706, 1,
1.029916, -1.439926, 4.547928, 1, 0, 0.972549, 1,
1.035209, -0.2856696, 1.612526, 1, 0, 0.9647059, 1,
1.044212, 0.1146826, 0.8008122, 1, 0, 0.9607843, 1,
1.045957, 0.7167153, -0.2892589, 1, 0, 0.9529412, 1,
1.046046, -0.1531948, 2.249542, 1, 0, 0.9490196, 1,
1.052314, -0.5446671, 1.76607, 1, 0, 0.9411765, 1,
1.057746, -1.264246, 2.361933, 1, 0, 0.9372549, 1,
1.068182, -0.5587509, 2.035654, 1, 0, 0.9294118, 1,
1.07024, -0.9596059, 2.663774, 1, 0, 0.9254902, 1,
1.076159, -1.152996, 2.713455, 1, 0, 0.9176471, 1,
1.076172, -2.808792, 2.852749, 1, 0, 0.9137255, 1,
1.084122, -0.3311772, 1.698169, 1, 0, 0.9058824, 1,
1.087651, -1.073964, 2.314229, 1, 0, 0.9019608, 1,
1.092098, -0.3950685, 1.503967, 1, 0, 0.8941177, 1,
1.093285, -1.556561, 2.898741, 1, 0, 0.8862745, 1,
1.095573, 0.1896367, 2.599032, 1, 0, 0.8823529, 1,
1.101582, 0.1084857, 0.9853381, 1, 0, 0.8745098, 1,
1.10828, -0.738192, 1.9968, 1, 0, 0.8705882, 1,
1.117216, -0.7995507, 3.751288, 1, 0, 0.8627451, 1,
1.121592, 0.7274108, -0.1784466, 1, 0, 0.8588235, 1,
1.129933, -0.756516, 1.854916, 1, 0, 0.8509804, 1,
1.137077, 0.9551371, 2.280696, 1, 0, 0.8470588, 1,
1.139038, -0.3369181, 1.914174, 1, 0, 0.8392157, 1,
1.140425, -0.6603137, 1.062115, 1, 0, 0.8352941, 1,
1.141378, -0.2503805, 0.9959396, 1, 0, 0.827451, 1,
1.143777, 0.5619742, 1.814461, 1, 0, 0.8235294, 1,
1.14545, 1.200898, 1.596781, 1, 0, 0.8156863, 1,
1.157804, -1.717853, 1.957585, 1, 0, 0.8117647, 1,
1.15971, -0.515141, 1.735863, 1, 0, 0.8039216, 1,
1.167219, 0.1741164, 0.8950837, 1, 0, 0.7960784, 1,
1.16958, 1.569085, 0.1016102, 1, 0, 0.7921569, 1,
1.176535, 0.8760812, 0.5990432, 1, 0, 0.7843137, 1,
1.181593, -0.241402, 1.729627, 1, 0, 0.7803922, 1,
1.181682, -1.72041, 2.181832, 1, 0, 0.772549, 1,
1.187079, 2.122146, -0.02511595, 1, 0, 0.7686275, 1,
1.188455, 0.9779639, 2.087625, 1, 0, 0.7607843, 1,
1.19084, -0.4376966, 2.313127, 1, 0, 0.7568628, 1,
1.200823, 0.5380277, 1.26362, 1, 0, 0.7490196, 1,
1.201114, -1.078708, 2.402868, 1, 0, 0.7450981, 1,
1.212784, -1.680068, 3.573487, 1, 0, 0.7372549, 1,
1.215965, -0.8179386, 1.702517, 1, 0, 0.7333333, 1,
1.219165, -0.461921, 2.736136, 1, 0, 0.7254902, 1,
1.219291, -0.7171928, 0.7297116, 1, 0, 0.7215686, 1,
1.219472, -0.7604987, 1.487368, 1, 0, 0.7137255, 1,
1.220941, 0.760752, 0.4968826, 1, 0, 0.7098039, 1,
1.221013, -0.6553714, 2.915401, 1, 0, 0.7019608, 1,
1.225103, -0.2980954, 0.483615, 1, 0, 0.6941177, 1,
1.228685, -0.423565, -0.1131333, 1, 0, 0.6901961, 1,
1.236195, 0.9119546, 1.245838, 1, 0, 0.682353, 1,
1.238497, -0.4249381, 2.440453, 1, 0, 0.6784314, 1,
1.239957, 0.03052489, 0.1130021, 1, 0, 0.6705883, 1,
1.249333, -0.7367125, 1.624575, 1, 0, 0.6666667, 1,
1.252251, -0.1587765, 1.582855, 1, 0, 0.6588235, 1,
1.255351, 0.2426481, 1.058134, 1, 0, 0.654902, 1,
1.263035, 0.5925345, 1.934194, 1, 0, 0.6470588, 1,
1.26892, 0.5981516, 2.854018, 1, 0, 0.6431373, 1,
1.271107, 0.5907125, 2.065777, 1, 0, 0.6352941, 1,
1.272526, 0.8994309, -0.4961029, 1, 0, 0.6313726, 1,
1.272551, -0.04351675, 2.5734, 1, 0, 0.6235294, 1,
1.283744, -0.04220673, 0.2771532, 1, 0, 0.6196079, 1,
1.301157, 1.136357, 2.124606, 1, 0, 0.6117647, 1,
1.30236, 1.467912, -0.2125731, 1, 0, 0.6078432, 1,
1.319303, -0.650024, 1.104244, 1, 0, 0.6, 1,
1.328949, -0.8213525, 1.432408, 1, 0, 0.5921569, 1,
1.330471, 0.2360606, 0.8361513, 1, 0, 0.5882353, 1,
1.331371, -2.013226, 2.881141, 1, 0, 0.5803922, 1,
1.337733, -0.7655904, 1.716479, 1, 0, 0.5764706, 1,
1.337966, -1.825189, 2.356334, 1, 0, 0.5686275, 1,
1.340515, -0.7083972, 1.636101, 1, 0, 0.5647059, 1,
1.342808, 0.3920672, 1.407582, 1, 0, 0.5568628, 1,
1.366408, 0.1809727, 1.956767, 1, 0, 0.5529412, 1,
1.374302, -1.219858, 1.818997, 1, 0, 0.5450981, 1,
1.376405, -2.025331, 2.76375, 1, 0, 0.5411765, 1,
1.377173, -0.3087552, 0.4463345, 1, 0, 0.5333334, 1,
1.378375, 0.007661545, 2.011487, 1, 0, 0.5294118, 1,
1.379715, 1.11876, 0.6406559, 1, 0, 0.5215687, 1,
1.388722, 0.9703854, 2.529737, 1, 0, 0.5176471, 1,
1.402899, -0.2851816, 1.397592, 1, 0, 0.509804, 1,
1.406131, 0.3005471, 0.2537627, 1, 0, 0.5058824, 1,
1.407656, 1.037954, 1.22449, 1, 0, 0.4980392, 1,
1.426943, -0.2587566, 2.575238, 1, 0, 0.4901961, 1,
1.427871, 1.121107, 0.7838339, 1, 0, 0.4862745, 1,
1.430763, -0.09508381, 1.585102, 1, 0, 0.4784314, 1,
1.440008, -1.079086, 2.947728, 1, 0, 0.4745098, 1,
1.450232, 0.4208691, 1.846502, 1, 0, 0.4666667, 1,
1.459263, 0.06810395, 1.906641, 1, 0, 0.4627451, 1,
1.462521, -0.509753, 1.840406, 1, 0, 0.454902, 1,
1.47095, 0.2771336, 0.9260764, 1, 0, 0.4509804, 1,
1.48804, 0.2234988, 3.199438, 1, 0, 0.4431373, 1,
1.492281, 0.3113594, 0.8785236, 1, 0, 0.4392157, 1,
1.498868, 1.103217, 1.686122, 1, 0, 0.4313726, 1,
1.506299, -1.015222, 4.577603, 1, 0, 0.427451, 1,
1.51418, -0.3802111, 1.859152, 1, 0, 0.4196078, 1,
1.52947, -0.7114342, 0.8302031, 1, 0, 0.4156863, 1,
1.529954, -0.1120138, 1.358963, 1, 0, 0.4078431, 1,
1.536389, 0.5024797, 0.8635515, 1, 0, 0.4039216, 1,
1.536706, -1.35561, 2.812417, 1, 0, 0.3960784, 1,
1.541727, -2.098856, 2.893926, 1, 0, 0.3882353, 1,
1.545033, -1.259396, 0.3224545, 1, 0, 0.3843137, 1,
1.546847, -0.2512973, 2.159572, 1, 0, 0.3764706, 1,
1.558589, 0.9754032, 1.15483, 1, 0, 0.372549, 1,
1.572876, 2.042849, -0.5533446, 1, 0, 0.3647059, 1,
1.574447, 0.3899593, -0.1676585, 1, 0, 0.3607843, 1,
1.577017, -0.2423891, 2.511877, 1, 0, 0.3529412, 1,
1.590573, 1.595936, 0.1443211, 1, 0, 0.3490196, 1,
1.597903, 0.1880661, 1.020131, 1, 0, 0.3411765, 1,
1.618016, -0.1014122, 2.341254, 1, 0, 0.3372549, 1,
1.623909, -1.23949, 1.133541, 1, 0, 0.3294118, 1,
1.635584, 0.3440699, 1.308398, 1, 0, 0.3254902, 1,
1.651196, 0.3229872, 1.822765, 1, 0, 0.3176471, 1,
1.671337, 0.2924621, 1.077198, 1, 0, 0.3137255, 1,
1.685198, -0.8501202, 2.305532, 1, 0, 0.3058824, 1,
1.707386, 0.6157539, 2.069628, 1, 0, 0.2980392, 1,
1.710878, 2.244699, 0.6100107, 1, 0, 0.2941177, 1,
1.711007, 0.5675158, 1.541948, 1, 0, 0.2862745, 1,
1.728931, -0.9662194, 1.123188, 1, 0, 0.282353, 1,
1.76457, -0.5010327, 0.7400635, 1, 0, 0.2745098, 1,
1.772638, -0.7687399, 1.773988, 1, 0, 0.2705882, 1,
1.786624, 0.9618144, 2.739961, 1, 0, 0.2627451, 1,
1.788241, -0.2128005, 3.910681, 1, 0, 0.2588235, 1,
1.7941, -0.05675799, 1.216202, 1, 0, 0.2509804, 1,
1.796382, 0.8815689, 0.8487616, 1, 0, 0.2470588, 1,
1.796792, -0.3967493, 2.387221, 1, 0, 0.2392157, 1,
1.800205, 1.242241, -0.4439895, 1, 0, 0.2352941, 1,
1.806123, -0.847778, 1.511938, 1, 0, 0.227451, 1,
1.813009, -1.215005, 3.220959, 1, 0, 0.2235294, 1,
1.81681, 0.6708795, 1.180114, 1, 0, 0.2156863, 1,
1.836845, 0.05319383, 0.7878041, 1, 0, 0.2117647, 1,
1.854038, -0.8108596, 3.466794, 1, 0, 0.2039216, 1,
1.858683, -0.827047, -0.2255771, 1, 0, 0.1960784, 1,
1.862318, -0.4763238, 1.148128, 1, 0, 0.1921569, 1,
1.900024, -0.1165864, 0.9210243, 1, 0, 0.1843137, 1,
1.920128, -0.1392466, 2.546162, 1, 0, 0.1803922, 1,
1.939304, -1.238641, 3.455662, 1, 0, 0.172549, 1,
1.939608, -1.138698, 3.35277, 1, 0, 0.1686275, 1,
1.970779, 0.5541512, 0.1889525, 1, 0, 0.1607843, 1,
1.983986, -1.37599, 1.860357, 1, 0, 0.1568628, 1,
1.991216, -0.5690911, 2.57152, 1, 0, 0.1490196, 1,
2.005873, 0.5641441, 1.944557, 1, 0, 0.145098, 1,
2.00784, -1.273994, 2.710353, 1, 0, 0.1372549, 1,
2.011791, 0.6976639, 0.2976981, 1, 0, 0.1333333, 1,
2.019765, 0.5040213, 2.636929, 1, 0, 0.1254902, 1,
2.03929, -0.1751287, 1.121614, 1, 0, 0.1215686, 1,
2.043641, 0.05052937, -0.5765161, 1, 0, 0.1137255, 1,
2.054681, -0.3461839, 2.377701, 1, 0, 0.1098039, 1,
2.058513, 1.795658, 0.4111922, 1, 0, 0.1019608, 1,
2.068475, -0.3146154, 2.609535, 1, 0, 0.09411765, 1,
2.082452, 0.08178627, 1.233818, 1, 0, 0.09019608, 1,
2.083589, 0.398893, 2.207643, 1, 0, 0.08235294, 1,
2.104812, -0.1755442, 1.501695, 1, 0, 0.07843138, 1,
2.156613, 0.8830256, 2.816993, 1, 0, 0.07058824, 1,
2.172402, 0.6331496, 2.038275, 1, 0, 0.06666667, 1,
2.227356, -0.01779593, 2.31387, 1, 0, 0.05882353, 1,
2.239946, 0.2000867, 2.333784, 1, 0, 0.05490196, 1,
2.373983, -1.461275, 2.47613, 1, 0, 0.04705882, 1,
2.395212, -1.645669, 1.886448, 1, 0, 0.04313726, 1,
2.542999, -0.8141612, 4.028062, 1, 0, 0.03529412, 1,
2.570984, 1.651368, 1.702876, 1, 0, 0.03137255, 1,
2.674402, 1.252905, 0.3554028, 1, 0, 0.02352941, 1,
2.755218, 1.157607, -0.5216914, 1, 0, 0.01960784, 1,
2.9266, 0.4195305, -0.767207, 1, 0, 0.01176471, 1,
3.320659, 0.6387175, 1.291912, 1, 0, 0.007843138, 1
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
0.06942761, -5.134008, -7.446773, 0, -0.5, 0.5, 0.5,
0.06942761, -5.134008, -7.446773, 1, -0.5, 0.5, 0.5,
0.06942761, -5.134008, -7.446773, 1, 1.5, 0.5, 0.5,
0.06942761, -5.134008, -7.446773, 0, 1.5, 0.5, 0.5
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
-4.283971, -0.5002614, -7.446773, 0, -0.5, 0.5, 0.5,
-4.283971, -0.5002614, -7.446773, 1, -0.5, 0.5, 0.5,
-4.283971, -0.5002614, -7.446773, 1, 1.5, 0.5, 0.5,
-4.283971, -0.5002614, -7.446773, 0, 1.5, 0.5, 0.5
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
-4.283971, -5.134008, -0.01656055, 0, -0.5, 0.5, 0.5,
-4.283971, -5.134008, -0.01656055, 1, -0.5, 0.5, 0.5,
-4.283971, -5.134008, -0.01656055, 1, 1.5, 0.5, 0.5,
-4.283971, -5.134008, -0.01656055, 0, 1.5, 0.5, 0.5
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
-3, -4.064682, -5.732109,
3, -4.064682, -5.732109,
-3, -4.064682, -5.732109,
-3, -4.242903, -6.017886,
-2, -4.064682, -5.732109,
-2, -4.242903, -6.017886,
-1, -4.064682, -5.732109,
-1, -4.242903, -6.017886,
0, -4.064682, -5.732109,
0, -4.242903, -6.017886,
1, -4.064682, -5.732109,
1, -4.242903, -6.017886,
2, -4.064682, -5.732109,
2, -4.242903, -6.017886,
3, -4.064682, -5.732109,
3, -4.242903, -6.017886
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
-3, -4.599345, -6.589441, 0, -0.5, 0.5, 0.5,
-3, -4.599345, -6.589441, 1, -0.5, 0.5, 0.5,
-3, -4.599345, -6.589441, 1, 1.5, 0.5, 0.5,
-3, -4.599345, -6.589441, 0, 1.5, 0.5, 0.5,
-2, -4.599345, -6.589441, 0, -0.5, 0.5, 0.5,
-2, -4.599345, -6.589441, 1, -0.5, 0.5, 0.5,
-2, -4.599345, -6.589441, 1, 1.5, 0.5, 0.5,
-2, -4.599345, -6.589441, 0, 1.5, 0.5, 0.5,
-1, -4.599345, -6.589441, 0, -0.5, 0.5, 0.5,
-1, -4.599345, -6.589441, 1, -0.5, 0.5, 0.5,
-1, -4.599345, -6.589441, 1, 1.5, 0.5, 0.5,
-1, -4.599345, -6.589441, 0, 1.5, 0.5, 0.5,
0, -4.599345, -6.589441, 0, -0.5, 0.5, 0.5,
0, -4.599345, -6.589441, 1, -0.5, 0.5, 0.5,
0, -4.599345, -6.589441, 1, 1.5, 0.5, 0.5,
0, -4.599345, -6.589441, 0, 1.5, 0.5, 0.5,
1, -4.599345, -6.589441, 0, -0.5, 0.5, 0.5,
1, -4.599345, -6.589441, 1, -0.5, 0.5, 0.5,
1, -4.599345, -6.589441, 1, 1.5, 0.5, 0.5,
1, -4.599345, -6.589441, 0, 1.5, 0.5, 0.5,
2, -4.599345, -6.589441, 0, -0.5, 0.5, 0.5,
2, -4.599345, -6.589441, 1, -0.5, 0.5, 0.5,
2, -4.599345, -6.589441, 1, 1.5, 0.5, 0.5,
2, -4.599345, -6.589441, 0, 1.5, 0.5, 0.5,
3, -4.599345, -6.589441, 0, -0.5, 0.5, 0.5,
3, -4.599345, -6.589441, 1, -0.5, 0.5, 0.5,
3, -4.599345, -6.589441, 1, 1.5, 0.5, 0.5,
3, -4.599345, -6.589441, 0, 1.5, 0.5, 0.5
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
-3.279341, -3, -5.732109,
-3.279341, 2, -5.732109,
-3.279341, -3, -5.732109,
-3.446779, -3, -6.017886,
-3.279341, -2, -5.732109,
-3.446779, -2, -6.017886,
-3.279341, -1, -5.732109,
-3.446779, -1, -6.017886,
-3.279341, 0, -5.732109,
-3.446779, 0, -6.017886,
-3.279341, 1, -5.732109,
-3.446779, 1, -6.017886,
-3.279341, 2, -5.732109,
-3.446779, 2, -6.017886
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
-3.781656, -3, -6.589441, 0, -0.5, 0.5, 0.5,
-3.781656, -3, -6.589441, 1, -0.5, 0.5, 0.5,
-3.781656, -3, -6.589441, 1, 1.5, 0.5, 0.5,
-3.781656, -3, -6.589441, 0, 1.5, 0.5, 0.5,
-3.781656, -2, -6.589441, 0, -0.5, 0.5, 0.5,
-3.781656, -2, -6.589441, 1, -0.5, 0.5, 0.5,
-3.781656, -2, -6.589441, 1, 1.5, 0.5, 0.5,
-3.781656, -2, -6.589441, 0, 1.5, 0.5, 0.5,
-3.781656, -1, -6.589441, 0, -0.5, 0.5, 0.5,
-3.781656, -1, -6.589441, 1, -0.5, 0.5, 0.5,
-3.781656, -1, -6.589441, 1, 1.5, 0.5, 0.5,
-3.781656, -1, -6.589441, 0, 1.5, 0.5, 0.5,
-3.781656, 0, -6.589441, 0, -0.5, 0.5, 0.5,
-3.781656, 0, -6.589441, 1, -0.5, 0.5, 0.5,
-3.781656, 0, -6.589441, 1, 1.5, 0.5, 0.5,
-3.781656, 0, -6.589441, 0, 1.5, 0.5, 0.5,
-3.781656, 1, -6.589441, 0, -0.5, 0.5, 0.5,
-3.781656, 1, -6.589441, 1, -0.5, 0.5, 0.5,
-3.781656, 1, -6.589441, 1, 1.5, 0.5, 0.5,
-3.781656, 1, -6.589441, 0, 1.5, 0.5, 0.5,
-3.781656, 2, -6.589441, 0, -0.5, 0.5, 0.5,
-3.781656, 2, -6.589441, 1, -0.5, 0.5, 0.5,
-3.781656, 2, -6.589441, 1, 1.5, 0.5, 0.5,
-3.781656, 2, -6.589441, 0, 1.5, 0.5, 0.5
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
-3.279341, -4.064682, -4,
-3.279341, -4.064682, 4,
-3.279341, -4.064682, -4,
-3.446779, -4.242903, -4,
-3.279341, -4.064682, -2,
-3.446779, -4.242903, -2,
-3.279341, -4.064682, 0,
-3.446779, -4.242903, 0,
-3.279341, -4.064682, 2,
-3.446779, -4.242903, 2,
-3.279341, -4.064682, 4,
-3.446779, -4.242903, 4
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
-3.781656, -4.599345, -4, 0, -0.5, 0.5, 0.5,
-3.781656, -4.599345, -4, 1, -0.5, 0.5, 0.5,
-3.781656, -4.599345, -4, 1, 1.5, 0.5, 0.5,
-3.781656, -4.599345, -4, 0, 1.5, 0.5, 0.5,
-3.781656, -4.599345, -2, 0, -0.5, 0.5, 0.5,
-3.781656, -4.599345, -2, 1, -0.5, 0.5, 0.5,
-3.781656, -4.599345, -2, 1, 1.5, 0.5, 0.5,
-3.781656, -4.599345, -2, 0, 1.5, 0.5, 0.5,
-3.781656, -4.599345, 0, 0, -0.5, 0.5, 0.5,
-3.781656, -4.599345, 0, 1, -0.5, 0.5, 0.5,
-3.781656, -4.599345, 0, 1, 1.5, 0.5, 0.5,
-3.781656, -4.599345, 0, 0, 1.5, 0.5, 0.5,
-3.781656, -4.599345, 2, 0, -0.5, 0.5, 0.5,
-3.781656, -4.599345, 2, 1, -0.5, 0.5, 0.5,
-3.781656, -4.599345, 2, 1, 1.5, 0.5, 0.5,
-3.781656, -4.599345, 2, 0, 1.5, 0.5, 0.5,
-3.781656, -4.599345, 4, 0, -0.5, 0.5, 0.5,
-3.781656, -4.599345, 4, 1, -0.5, 0.5, 0.5,
-3.781656, -4.599345, 4, 1, 1.5, 0.5, 0.5,
-3.781656, -4.599345, 4, 0, 1.5, 0.5, 0.5
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
-3.279341, -4.064682, -5.732109,
-3.279341, 3.064159, -5.732109,
-3.279341, -4.064682, 5.698987,
-3.279341, 3.064159, 5.698987,
-3.279341, -4.064682, -5.732109,
-3.279341, -4.064682, 5.698987,
-3.279341, 3.064159, -5.732109,
-3.279341, 3.064159, 5.698987,
-3.279341, -4.064682, -5.732109,
3.418196, -4.064682, -5.732109,
-3.279341, -4.064682, 5.698987,
3.418196, -4.064682, 5.698987,
-3.279341, 3.064159, -5.732109,
3.418196, 3.064159, -5.732109,
-3.279341, 3.064159, 5.698987,
3.418196, 3.064159, 5.698987,
3.418196, -4.064682, -5.732109,
3.418196, 3.064159, -5.732109,
3.418196, -4.064682, 5.698987,
3.418196, 3.064159, 5.698987,
3.418196, -4.064682, -5.732109,
3.418196, -4.064682, 5.698987,
3.418196, 3.064159, -5.732109,
3.418196, 3.064159, 5.698987
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
var radius = 8.033654;
var distance = 35.74264;
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
mvMatrix.translate( -0.06942761, 0.5002614, 0.01656055 );
mvMatrix.scale( 1.296916, 1.218451, 0.7598698 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.74264);
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
calcium_arsenate_tri<-read.table("calcium_arsenate_tri.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 2 did not have 5 elements
```

```r
x<-calcium_arsenate_tri$V2
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
```

```r
y<-calcium_arsenate_tri$V3
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
```

```r
z<-calcium_arsenate_tri$V4
```

```
## Error in eval(expr, envir, enclos): object 'calcium_arsenate_tri' not found
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
-3.181803, 0.1953251, -0.9599032, 0, 0, 1, 1, 1,
-2.755992, -1.012124, -1.902847, 1, 0, 0, 1, 1,
-2.732409, 1.241167, -1.725619, 1, 0, 0, 1, 1,
-2.724075, -0.7288345, -2.469841, 1, 0, 0, 1, 1,
-2.460063, -1.014522, -2.813186, 1, 0, 0, 1, 1,
-2.452345, -0.06728128, -0.6150477, 1, 0, 0, 1, 1,
-2.415051, -2.054329, -2.535297, 0, 0, 0, 1, 1,
-2.281916, 0.08969632, -1.572241, 0, 0, 0, 1, 1,
-2.237029, -0.3806948, 0.08194847, 0, 0, 0, 1, 1,
-2.112126, 0.292432, -2.723054, 0, 0, 0, 1, 1,
-2.064382, 0.5610157, -0.1323459, 0, 0, 0, 1, 1,
-2.046181, 1.026907, -0.396467, 0, 0, 0, 1, 1,
-2.031497, -0.5401727, -5.471003, 0, 0, 0, 1, 1,
-2.01519, -0.4916149, -1.892065, 1, 1, 1, 1, 1,
-2.014459, 2.34411, -0.194868, 1, 1, 1, 1, 1,
-2.007062, 0.8632365, -1.269924, 1, 1, 1, 1, 1,
-1.982701, 0.1320658, -1.848478, 1, 1, 1, 1, 1,
-1.978298, 0.07105598, -1.268215, 1, 1, 1, 1, 1,
-1.974145, -1.811169, -0.9262489, 1, 1, 1, 1, 1,
-1.950765, -1.418781, -3.682163, 1, 1, 1, 1, 1,
-1.938471, -2.73509, -2.289853, 1, 1, 1, 1, 1,
-1.923444, -1.269431, -1.673359, 1, 1, 1, 1, 1,
-1.894555, -0.5514504, -1.671268, 1, 1, 1, 1, 1,
-1.890246, 1.179491, 0.5426512, 1, 1, 1, 1, 1,
-1.88094, -1.2273, -1.456293, 1, 1, 1, 1, 1,
-1.877394, -1.328244, -2.802143, 1, 1, 1, 1, 1,
-1.861488, -0.62738, -0.6244414, 1, 1, 1, 1, 1,
-1.861082, -1.403469, -1.105912, 1, 1, 1, 1, 1,
-1.860586, 0.3126131, -2.14163, 0, 0, 1, 1, 1,
-1.827738, 0.03746716, -0.4268993, 1, 0, 0, 1, 1,
-1.79595, 0.8613204, -1.80788, 1, 0, 0, 1, 1,
-1.790664, -0.03489906, -3.982122, 1, 0, 0, 1, 1,
-1.762446, -0.3670194, -1.075131, 1, 0, 0, 1, 1,
-1.751038, -0.4225981, 0.4801858, 1, 0, 0, 1, 1,
-1.743312, 0.02690389, -1.400902, 0, 0, 0, 1, 1,
-1.742868, 0.4522326, -2.424545, 0, 0, 0, 1, 1,
-1.701528, 0.5573798, -2.107897, 0, 0, 0, 1, 1,
-1.700665, -0.3398892, -1.005902, 0, 0, 0, 1, 1,
-1.697998, 2.541955, 0.2299752, 0, 0, 0, 1, 1,
-1.683668, -1.785516, -1.829782, 0, 0, 0, 1, 1,
-1.676991, 1.420417, -0.4083612, 0, 0, 0, 1, 1,
-1.672177, -0.9289439, -2.992208, 1, 1, 1, 1, 1,
-1.663732, 1.255167, -1.134583, 1, 1, 1, 1, 1,
-1.647505, -1.061723, -2.222799, 1, 1, 1, 1, 1,
-1.618392, 0.5849506, -2.545715, 1, 1, 1, 1, 1,
-1.611292, 0.3881189, -2.191231, 1, 1, 1, 1, 1,
-1.610687, 1.258627, -1.928376, 1, 1, 1, 1, 1,
-1.609407, -0.9593299, -2.941084, 1, 1, 1, 1, 1,
-1.59198, 1.44847, -1.595017, 1, 1, 1, 1, 1,
-1.577726, 2.220144, -0.5969662, 1, 1, 1, 1, 1,
-1.565774, -0.06013552, -2.464871, 1, 1, 1, 1, 1,
-1.560031, -3.960864, -1.802129, 1, 1, 1, 1, 1,
-1.542512, -0.205732, -1.333145, 1, 1, 1, 1, 1,
-1.540046, 0.5500827, -2.45037, 1, 1, 1, 1, 1,
-1.539145, 0.8243756, -2.379458, 1, 1, 1, 1, 1,
-1.524374, -0.6643907, -1.906453, 1, 1, 1, 1, 1,
-1.522012, -0.4227374, -0.906231, 0, 0, 1, 1, 1,
-1.518655, 0.4211709, -1.396555, 1, 0, 0, 1, 1,
-1.517861, 0.04200303, -0.8341982, 1, 0, 0, 1, 1,
-1.48383, -0.6532295, -1.993165, 1, 0, 0, 1, 1,
-1.47551, 0.6405637, -1.617269, 1, 0, 0, 1, 1,
-1.47201, -0.7704965, -1.937108, 1, 0, 0, 1, 1,
-1.465092, -1.546008, -0.7685691, 0, 0, 0, 1, 1,
-1.464231, -0.3597648, -3.124124, 0, 0, 0, 1, 1,
-1.461203, 1.37306, -1.318659, 0, 0, 0, 1, 1,
-1.419878, -0.3682128, -3.620472, 0, 0, 0, 1, 1,
-1.41717, -0.4255236, -2.981648, 0, 0, 0, 1, 1,
-1.416536, -0.6120001, -2.702674, 0, 0, 0, 1, 1,
-1.4161, 0.3318447, -0.5366052, 0, 0, 0, 1, 1,
-1.41074, -1.547915, -2.046801, 1, 1, 1, 1, 1,
-1.407409, 0.808063, -0.4485973, 1, 1, 1, 1, 1,
-1.388284, 0.3503376, -0.1342707, 1, 1, 1, 1, 1,
-1.387779, -1.30851, -2.972986, 1, 1, 1, 1, 1,
-1.387282, 0.6566839, -1.989939, 1, 1, 1, 1, 1,
-1.381219, -1.22047, -1.709356, 1, 1, 1, 1, 1,
-1.381152, -0.05648447, -2.832995, 1, 1, 1, 1, 1,
-1.37978, -1.188332, -1.3033, 1, 1, 1, 1, 1,
-1.370094, -0.4618865, -2.544255, 1, 1, 1, 1, 1,
-1.368042, -0.9983003, -2.565202, 1, 1, 1, 1, 1,
-1.359948, -0.2930032, -1.372271, 1, 1, 1, 1, 1,
-1.352147, 0.7246247, -1.964524, 1, 1, 1, 1, 1,
-1.345561, 0.2978153, -2.650437, 1, 1, 1, 1, 1,
-1.337953, 2.637921, 0.06075174, 1, 1, 1, 1, 1,
-1.318478, -0.5332779, -2.660525, 1, 1, 1, 1, 1,
-1.318006, 0.5308365, 0.3275655, 0, 0, 1, 1, 1,
-1.317583, -0.6964868, -0.6687555, 1, 0, 0, 1, 1,
-1.304996, -0.1708802, -0.8315046, 1, 0, 0, 1, 1,
-1.304886, -2.034367, -3.618127, 1, 0, 0, 1, 1,
-1.304388, -0.921901, -2.137477, 1, 0, 0, 1, 1,
-1.297502, -1.14627, -2.414387, 1, 0, 0, 1, 1,
-1.284296, 0.7607688, -2.210762, 0, 0, 0, 1, 1,
-1.283169, -0.1994436, -2.051206, 0, 0, 0, 1, 1,
-1.273453, 1.278826, -0.4985928, 0, 0, 0, 1, 1,
-1.259735, -0.6367621, -0.5472289, 0, 0, 0, 1, 1,
-1.258716, 2.144423, 0.2264459, 0, 0, 0, 1, 1,
-1.254824, -0.6456977, -3.026046, 0, 0, 0, 1, 1,
-1.24053, -0.12276, -0.857022, 0, 0, 0, 1, 1,
-1.240111, 1.65429, -0.5803376, 1, 1, 1, 1, 1,
-1.228059, 1.03657, -1.331669, 1, 1, 1, 1, 1,
-1.220625, -0.4020465, -2.238907, 1, 1, 1, 1, 1,
-1.203341, -0.1973044, -2.043562, 1, 1, 1, 1, 1,
-1.201452, -0.6915597, 0.2416781, 1, 1, 1, 1, 1,
-1.197764, -0.7564986, -1.299902, 1, 1, 1, 1, 1,
-1.190492, 0.01915748, -1.695433, 1, 1, 1, 1, 1,
-1.183941, -0.2556327, -2.440857, 1, 1, 1, 1, 1,
-1.182687, -0.4165557, -2.352392, 1, 1, 1, 1, 1,
-1.177773, 0.8486915, 0.6523385, 1, 1, 1, 1, 1,
-1.172824, -0.5776197, -1.811047, 1, 1, 1, 1, 1,
-1.168848, 1.448195, 0.6656002, 1, 1, 1, 1, 1,
-1.165771, 1.461851, -0.7584761, 1, 1, 1, 1, 1,
-1.163833, -1.243838, -2.025187, 1, 1, 1, 1, 1,
-1.163166, -1.951127, -2.607566, 1, 1, 1, 1, 1,
-1.1624, -1.223795, -1.500502, 0, 0, 1, 1, 1,
-1.160541, 0.3450295, -0.08699626, 1, 0, 0, 1, 1,
-1.152764, 1.45841, 0.5428705, 1, 0, 0, 1, 1,
-1.15093, -0.04494339, -1.754209, 1, 0, 0, 1, 1,
-1.138298, -0.3370228, -2.75317, 1, 0, 0, 1, 1,
-1.134435, -0.3067188, -1.684207, 1, 0, 0, 1, 1,
-1.133041, -0.8867702, -0.4907656, 0, 0, 0, 1, 1,
-1.132121, -0.2082443, -1.261632, 0, 0, 0, 1, 1,
-1.131468, -0.1458724, -0.9356168, 0, 0, 0, 1, 1,
-1.130616, 0.6425837, -0.8624508, 0, 0, 0, 1, 1,
-1.127047, 0.955514, 1.379046, 0, 0, 0, 1, 1,
-1.118074, 0.2905118, -0.6892461, 0, 0, 0, 1, 1,
-1.114685, -1.320856, -2.411875, 0, 0, 0, 1, 1,
-1.113814, -1.053484, -1.540913, 1, 1, 1, 1, 1,
-1.111001, 0.5414072, -2.051095, 1, 1, 1, 1, 1,
-1.107826, -0.8424401, -2.129525, 1, 1, 1, 1, 1,
-1.103459, -1.883709, -3.034228, 1, 1, 1, 1, 1,
-1.095419, 0.5018679, -1.023782, 1, 1, 1, 1, 1,
-1.087557, -1.916243, -2.112984, 1, 1, 1, 1, 1,
-1.08303, -1.136161, -2.634442, 1, 1, 1, 1, 1,
-1.078171, -0.7412196, 0.2196653, 1, 1, 1, 1, 1,
-1.074887, 0.5565133, -1.388838, 1, 1, 1, 1, 1,
-1.071314, 0.5012787, -0.3783677, 1, 1, 1, 1, 1,
-1.068878, -0.2871486, -3.015367, 1, 1, 1, 1, 1,
-1.065811, 0.3591354, -0.7440218, 1, 1, 1, 1, 1,
-1.060518, -1.900278, -4.06055, 1, 1, 1, 1, 1,
-1.056711, -1.19524, -4.259692, 1, 1, 1, 1, 1,
-1.053369, -0.3337515, -2.130481, 1, 1, 1, 1, 1,
-1.052698, -0.09842706, 0.4347731, 0, 0, 1, 1, 1,
-1.050903, -0.7116127, -1.383144, 1, 0, 0, 1, 1,
-1.0499, -0.8519552, -2.215285, 1, 0, 0, 1, 1,
-1.041429, -1.503739, -2.281792, 1, 0, 0, 1, 1,
-1.041296, 0.3640046, -2.277711, 1, 0, 0, 1, 1,
-1.040682, 1.20968, -1.440941, 1, 0, 0, 1, 1,
-1.035442, 0.2500064, -0.5105756, 0, 0, 0, 1, 1,
-1.0323, 1.621654, -1.951264, 0, 0, 0, 1, 1,
-1.022805, 1.459376, 1.036808, 0, 0, 0, 1, 1,
-1.020272, -1.292768, -1.203558, 0, 0, 0, 1, 1,
-1.019107, -1.408814, -1.067316, 0, 0, 0, 1, 1,
-1.01373, 0.1496546, -1.264269, 0, 0, 0, 1, 1,
-1.009382, -0.6257628, -1.265159, 0, 0, 0, 1, 1,
-1.009228, -1.049607, -1.113885, 1, 1, 1, 1, 1,
-1.007499, 0.2759693, -0.234529, 1, 1, 1, 1, 1,
-0.9983811, -0.8650031, -2.333787, 1, 1, 1, 1, 1,
-0.9940613, 1.328175, -0.6480898, 1, 1, 1, 1, 1,
-0.9928764, 0.9724909, -1.346729, 1, 1, 1, 1, 1,
-0.992413, 1.012507, -1.573607, 1, 1, 1, 1, 1,
-0.9922154, 0.765263, -0.3839124, 1, 1, 1, 1, 1,
-0.9916582, 1.056834, -0.2527923, 1, 1, 1, 1, 1,
-0.9864417, -0.1129762, -1.634712, 1, 1, 1, 1, 1,
-0.9862644, 1.215292, -0.9796222, 1, 1, 1, 1, 1,
-0.9843494, 1.083552, -2.36835, 1, 1, 1, 1, 1,
-0.9765746, -1.869824, -2.322181, 1, 1, 1, 1, 1,
-0.9755483, 0.6555648, -0.4327945, 1, 1, 1, 1, 1,
-0.9730632, 0.2460735, -0.7945682, 1, 1, 1, 1, 1,
-0.9713298, 0.1767976, -3.865787, 1, 1, 1, 1, 1,
-0.9660165, -1.086831, -2.302429, 0, 0, 1, 1, 1,
-0.9656856, -1.243551, -4.785482, 1, 0, 0, 1, 1,
-0.9526309, 0.1366523, -1.621585, 1, 0, 0, 1, 1,
-0.9510634, -0.831677, -2.933951, 1, 0, 0, 1, 1,
-0.9471676, -0.556655, -2.931195, 1, 0, 0, 1, 1,
-0.9447187, -1.541178, -3.572733, 1, 0, 0, 1, 1,
-0.9416254, -0.5188719, -2.543843, 0, 0, 0, 1, 1,
-0.9377931, 1.689914, -0.9754257, 0, 0, 0, 1, 1,
-0.9349987, -0.04817756, -1.034891, 0, 0, 0, 1, 1,
-0.9337327, -0.08795743, -1.278187, 0, 0, 0, 1, 1,
-0.9317016, -0.2531172, -1.041104, 0, 0, 0, 1, 1,
-0.9183047, 0.3487962, -0.8719203, 0, 0, 0, 1, 1,
-0.9123048, 0.6831617, -0.6828987, 0, 0, 0, 1, 1,
-0.9097924, -0.1133393, -0.4127944, 1, 1, 1, 1, 1,
-0.9088907, 0.3549518, -0.6356214, 1, 1, 1, 1, 1,
-0.9027234, -0.2160589, -1.582896, 1, 1, 1, 1, 1,
-0.90008, -1.894021, -2.631607, 1, 1, 1, 1, 1,
-0.8958917, 0.688369, -1.072621, 1, 1, 1, 1, 1,
-0.8924415, 0.2341212, -0.3237985, 1, 1, 1, 1, 1,
-0.8924156, 0.579469, -0.8576709, 1, 1, 1, 1, 1,
-0.8891069, -0.9615585, -3.107165, 1, 1, 1, 1, 1,
-0.8785848, -0.8895302, -2.233359, 1, 1, 1, 1, 1,
-0.8756316, 0.5559171, -0.4424444, 1, 1, 1, 1, 1,
-0.8648661, 0.9784262, -0.5885746, 1, 1, 1, 1, 1,
-0.860611, 0.9557638, -2.822389, 1, 1, 1, 1, 1,
-0.8596529, -0.1610801, -0.6024724, 1, 1, 1, 1, 1,
-0.8543796, -0.9362979, -1.739995, 1, 1, 1, 1, 1,
-0.8532216, 0.8535782, -0.8548176, 1, 1, 1, 1, 1,
-0.8512731, 0.3463558, -0.535136, 0, 0, 1, 1, 1,
-0.8511556, -0.8814515, -3.428082, 1, 0, 0, 1, 1,
-0.8482798, 0.3624769, 0.7927506, 1, 0, 0, 1, 1,
-0.8473759, 0.4418501, 0.102708, 1, 0, 0, 1, 1,
-0.8435273, -1.539661, -2.949118, 1, 0, 0, 1, 1,
-0.8429646, 0.9488404, -2.81681, 1, 0, 0, 1, 1,
-0.8421653, -0.4800765, -2.16566, 0, 0, 0, 1, 1,
-0.8400683, -0.4464228, -3.976792, 0, 0, 0, 1, 1,
-0.8370242, -2.146699, -2.267518, 0, 0, 0, 1, 1,
-0.8300087, 0.320092, -2.398156, 0, 0, 0, 1, 1,
-0.8274781, -0.3862049, -1.737978, 0, 0, 0, 1, 1,
-0.8246995, -0.3685526, -1.383715, 0, 0, 0, 1, 1,
-0.824024, 0.4019167, -2.381129, 0, 0, 0, 1, 1,
-0.8171187, -1.002159, -2.817528, 1, 1, 1, 1, 1,
-0.8149315, 0.3669767, 0.006447552, 1, 1, 1, 1, 1,
-0.814414, 2.034551, 0.1634646, 1, 1, 1, 1, 1,
-0.7990379, 0.6462719, -2.235635, 1, 1, 1, 1, 1,
-0.7894194, -0.5476015, -0.573987, 1, 1, 1, 1, 1,
-0.7865997, 0.1711166, -2.500799, 1, 1, 1, 1, 1,
-0.7865696, -0.3217752, -2.246294, 1, 1, 1, 1, 1,
-0.7840196, -1.880575, -3.244627, 1, 1, 1, 1, 1,
-0.7764503, 1.444233, -2.010548, 1, 1, 1, 1, 1,
-0.7722175, 0.05526102, -2.470744, 1, 1, 1, 1, 1,
-0.7667589, 1.222244, -2.670401, 1, 1, 1, 1, 1,
-0.7643304, -0.1029664, -1.818473, 1, 1, 1, 1, 1,
-0.7550241, 1.08176, 0.2137806, 1, 1, 1, 1, 1,
-0.751316, 0.5357082, -0.8619354, 1, 1, 1, 1, 1,
-0.7479189, -0.1184221, -2.410686, 1, 1, 1, 1, 1,
-0.747155, 1.219279, -1.582907, 0, 0, 1, 1, 1,
-0.7467397, 0.7205446, -0.52914, 1, 0, 0, 1, 1,
-0.7458146, 0.3843471, -0.6605918, 1, 0, 0, 1, 1,
-0.7455251, -0.3640442, -2.949303, 1, 0, 0, 1, 1,
-0.7442787, 0.7476295, -2.3652, 1, 0, 0, 1, 1,
-0.7438542, 0.1122473, -1.566258, 1, 0, 0, 1, 1,
-0.7434274, 0.947414, -0.3678263, 0, 0, 0, 1, 1,
-0.7374483, 0.1501514, -1.789126, 0, 0, 0, 1, 1,
-0.7365724, 0.1192279, -1.654021, 0, 0, 0, 1, 1,
-0.7339628, 2.143576, -0.3379377, 0, 0, 0, 1, 1,
-0.7302793, 0.6055247, -0.04993103, 0, 0, 0, 1, 1,
-0.7291181, 0.8911132, -1.309361, 0, 0, 0, 1, 1,
-0.7278183, -1.606295, -2.345019, 0, 0, 0, 1, 1,
-0.7255363, -0.9565008, -2.406952, 1, 1, 1, 1, 1,
-0.7236524, -0.7591701, -2.571343, 1, 1, 1, 1, 1,
-0.7221105, -0.2884163, -2.242049, 1, 1, 1, 1, 1,
-0.7200632, 1.452146, -0.2148293, 1, 1, 1, 1, 1,
-0.7186055, 0.6074475, 0.7395976, 1, 1, 1, 1, 1,
-0.7144244, 0.1838959, -3.153703, 1, 1, 1, 1, 1,
-0.7136301, 1.54276, -0.9933931, 1, 1, 1, 1, 1,
-0.7118182, 0.5045018, -2.491407, 1, 1, 1, 1, 1,
-0.7100271, 0.1179741, 0.4262311, 1, 1, 1, 1, 1,
-0.7051285, 1.071457, 1.249248, 1, 1, 1, 1, 1,
-0.6943791, 1.054336, 0.009761137, 1, 1, 1, 1, 1,
-0.6894681, -0.1088749, -2.981936, 1, 1, 1, 1, 1,
-0.6841695, 0.4061936, 0.129542, 1, 1, 1, 1, 1,
-0.6800299, 1.573099, -1.996622, 1, 1, 1, 1, 1,
-0.6791344, -1.20788, -2.946521, 1, 1, 1, 1, 1,
-0.6710522, 0.3758719, -1.380538, 0, 0, 1, 1, 1,
-0.6709542, 1.371015, 0.2878834, 1, 0, 0, 1, 1,
-0.6686676, 1.842993, -0.18933, 1, 0, 0, 1, 1,
-0.6668652, -1.484412, -5.136994, 1, 0, 0, 1, 1,
-0.6664928, -0.1627774, -1.098035, 1, 0, 0, 1, 1,
-0.664924, -1.25614, -1.900466, 1, 0, 0, 1, 1,
-0.6640908, 0.3911968, -0.8274528, 0, 0, 0, 1, 1,
-0.6626255, -0.5206424, -2.910246, 0, 0, 0, 1, 1,
-0.6614191, -0.4298247, -1.216075, 0, 0, 0, 1, 1,
-0.6583711, -0.6536173, -3.005725, 0, 0, 0, 1, 1,
-0.6578037, 1.284027, -1.448325, 0, 0, 0, 1, 1,
-0.6502151, -1.591544, -3.056793, 0, 0, 0, 1, 1,
-0.6455422, 2.565502, -0.1934843, 0, 0, 0, 1, 1,
-0.644048, 1.013065, 0.5723076, 1, 1, 1, 1, 1,
-0.6436064, -1.156858, -3.087288, 1, 1, 1, 1, 1,
-0.639559, -0.006576024, -1.672759, 1, 1, 1, 1, 1,
-0.6361583, 0.6514989, -0.385973, 1, 1, 1, 1, 1,
-0.6346365, 0.2600851, -1.745819, 1, 1, 1, 1, 1,
-0.6344762, 0.6809894, -0.8007855, 1, 1, 1, 1, 1,
-0.6332612, 0.6995586, -0.3455051, 1, 1, 1, 1, 1,
-0.6196647, 0.4373262, -0.757098, 1, 1, 1, 1, 1,
-0.6164653, -0.7483772, -1.041428, 1, 1, 1, 1, 1,
-0.6135249, 0.8905116, 0.0784661, 1, 1, 1, 1, 1,
-0.6126783, 0.6084558, -0.5019795, 1, 1, 1, 1, 1,
-0.6103022, 1.166005, -0.9270863, 1, 1, 1, 1, 1,
-0.6066137, 0.5395113, -1.477251, 1, 1, 1, 1, 1,
-0.5954338, -0.8855996, -2.362173, 1, 1, 1, 1, 1,
-0.5861551, 2.153061, 0.446602, 1, 1, 1, 1, 1,
-0.5854964, -0.5566439, -2.085275, 0, 0, 1, 1, 1,
-0.5815492, 0.0103241, -3.316287, 1, 0, 0, 1, 1,
-0.5788692, -0.3266487, -1.223632, 1, 0, 0, 1, 1,
-0.5760795, 0.2373777, -1.378394, 1, 0, 0, 1, 1,
-0.5718062, -1.085444, -3.198753, 1, 0, 0, 1, 1,
-0.569383, 0.2855712, -0.9208435, 1, 0, 0, 1, 1,
-0.5681034, 1.308103, -1.042122, 0, 0, 0, 1, 1,
-0.5649091, 1.259164, -0.03587015, 0, 0, 0, 1, 1,
-0.564464, 1.173041, -0.8972213, 0, 0, 0, 1, 1,
-0.5569011, 0.05043358, -1.379127, 0, 0, 0, 1, 1,
-0.5510672, 1.291175, -0.1813055, 0, 0, 0, 1, 1,
-0.5493957, -0.6527218, -3.037269, 0, 0, 0, 1, 1,
-0.5485775, -0.2484514, -0.9350592, 0, 0, 0, 1, 1,
-0.5462563, 0.1442015, -0.2067422, 1, 1, 1, 1, 1,
-0.5418532, 0.661751, -0.8012752, 1, 1, 1, 1, 1,
-0.5363805, -1.328142, -4.816455, 1, 1, 1, 1, 1,
-0.534021, -0.2422718, -3.921582, 1, 1, 1, 1, 1,
-0.5323312, -0.3931988, -1.416115, 1, 1, 1, 1, 1,
-0.5227209, -1.388415, -3.189454, 1, 1, 1, 1, 1,
-0.5218711, 2.960341, 0.3666169, 1, 1, 1, 1, 1,
-0.5154033, -0.6500908, -1.915541, 1, 1, 1, 1, 1,
-0.5151799, 1.675852, -0.4132272, 1, 1, 1, 1, 1,
-0.509837, -0.8417487, -3.460997, 1, 1, 1, 1, 1,
-0.5071016, 0.1977521, -0.6090961, 1, 1, 1, 1, 1,
-0.5070262, -0.03289234, -1.377152, 1, 1, 1, 1, 1,
-0.5064261, -0.1556422, -2.894607, 1, 1, 1, 1, 1,
-0.4993965, -0.6615638, -2.728485, 1, 1, 1, 1, 1,
-0.4988148, 0.6889729, 0.5875685, 1, 1, 1, 1, 1,
-0.4983896, 0.2994289, -1.156912, 0, 0, 1, 1, 1,
-0.497445, 0.493021, 0.03061272, 1, 0, 0, 1, 1,
-0.4937894, -0.03864238, -1.257977, 1, 0, 0, 1, 1,
-0.4917406, -0.09762207, -0.308133, 1, 0, 0, 1, 1,
-0.4906757, 1.217186, 0.8251579, 1, 0, 0, 1, 1,
-0.4876764, 2.651114, -0.1339176, 1, 0, 0, 1, 1,
-0.4845993, 1.237687, -2.654593, 0, 0, 0, 1, 1,
-0.483802, -1.247347, -2.444735, 0, 0, 0, 1, 1,
-0.482371, -0.610453, -2.90573, 0, 0, 0, 1, 1,
-0.4814494, -0.2538849, -1.454832, 0, 0, 0, 1, 1,
-0.4778748, 0.1086, -0.1272147, 0, 0, 0, 1, 1,
-0.4702052, -0.83018, -2.768563, 0, 0, 0, 1, 1,
-0.466421, 1.963173, -2.257679, 0, 0, 0, 1, 1,
-0.4651144, 0.919132, 0.6786344, 1, 1, 1, 1, 1,
-0.4606855, 0.6881707, -1.458653, 1, 1, 1, 1, 1,
-0.4573969, -1.974782, -4.202921, 1, 1, 1, 1, 1,
-0.4569176, 0.6093663, -0.0391088, 1, 1, 1, 1, 1,
-0.456571, 0.1194554, -2.643831, 1, 1, 1, 1, 1,
-0.4559951, -1.892195, -3.265052, 1, 1, 1, 1, 1,
-0.4510859, 0.2903244, 0.09917905, 1, 1, 1, 1, 1,
-0.4493881, -0.3850622, -2.633406, 1, 1, 1, 1, 1,
-0.4471537, 0.7715083, 0.1987802, 1, 1, 1, 1, 1,
-0.4459813, -0.3834013, -3.00307, 1, 1, 1, 1, 1,
-0.4440501, 0.06665373, -0.256411, 1, 1, 1, 1, 1,
-0.4419794, -0.7462426, -2.949982, 1, 1, 1, 1, 1,
-0.43987, 0.6223351, -0.6108242, 1, 1, 1, 1, 1,
-0.4384621, 0.0167343, -2.737993, 1, 1, 1, 1, 1,
-0.4383639, 0.9159285, 0.1721006, 1, 1, 1, 1, 1,
-0.4342548, -0.1477291, -2.073971, 0, 0, 1, 1, 1,
-0.427804, 1.436951, -1.254021, 1, 0, 0, 1, 1,
-0.4274424, 0.09554919, -2.547306, 1, 0, 0, 1, 1,
-0.4266227, -0.4589405, -1.673011, 1, 0, 0, 1, 1,
-0.4240717, -1.103902, -3.964418, 1, 0, 0, 1, 1,
-0.422417, 0.4483649, -0.8510787, 1, 0, 0, 1, 1,
-0.4207937, -1.50412, -1.446832, 0, 0, 0, 1, 1,
-0.4205429, 1.608068, -0.6724642, 0, 0, 0, 1, 1,
-0.4159032, -1.342538, -5.316202, 0, 0, 0, 1, 1,
-0.413469, 0.4552513, -0.1122845, 0, 0, 0, 1, 1,
-0.413137, -0.5375476, -0.6478408, 0, 0, 0, 1, 1,
-0.4075917, 0.7767818, -2.176079, 0, 0, 0, 1, 1,
-0.4047681, -0.550793, -2.918205, 0, 0, 0, 1, 1,
-0.3940117, 0.2127445, 0.04677647, 1, 1, 1, 1, 1,
-0.39153, -1.366261, -1.441321, 1, 1, 1, 1, 1,
-0.3904848, -0.344916, -1.724617, 1, 1, 1, 1, 1,
-0.3877935, -1.315252, -0.6505222, 1, 1, 1, 1, 1,
-0.3850583, -1.10264, -2.092678, 1, 1, 1, 1, 1,
-0.383309, -0.1976877, -2.43078, 1, 1, 1, 1, 1,
-0.3798713, 0.7995822, 1.404038, 1, 1, 1, 1, 1,
-0.3743794, -0.6182917, -2.906101, 1, 1, 1, 1, 1,
-0.3727629, 1.546344, 0.350327, 1, 1, 1, 1, 1,
-0.3724245, 0.2111424, -0.3569393, 1, 1, 1, 1, 1,
-0.3701995, -2.457563, -4.220106, 1, 1, 1, 1, 1,
-0.3694391, -1.35972, -2.249762, 1, 1, 1, 1, 1,
-0.3575329, -0.5931352, -2.351485, 1, 1, 1, 1, 1,
-0.3562949, 0.6908579, 0.3144064, 1, 1, 1, 1, 1,
-0.3497066, -0.8427289, -2.509434, 1, 1, 1, 1, 1,
-0.3491705, -0.4445229, -2.322545, 0, 0, 1, 1, 1,
-0.3480971, -1.495667, -2.133725, 1, 0, 0, 1, 1,
-0.3476598, 0.4968282, -1.075387, 1, 0, 0, 1, 1,
-0.3435677, -0.09785973, 0.4674847, 1, 0, 0, 1, 1,
-0.3426692, -0.02486528, -1.029371, 1, 0, 0, 1, 1,
-0.3421783, -1.139261, -4.177169, 1, 0, 0, 1, 1,
-0.3395467, 0.1217441, -0.5842231, 0, 0, 0, 1, 1,
-0.3392412, -0.5893846, -1.647913, 0, 0, 0, 1, 1,
-0.3316186, 0.5041503, -0.4551281, 0, 0, 0, 1, 1,
-0.3313124, 0.3870984, -0.6793581, 0, 0, 0, 1, 1,
-0.3298646, 0.2783532, -2.441129, 0, 0, 0, 1, 1,
-0.3250651, -0.2562667, -1.383754, 0, 0, 0, 1, 1,
-0.3237921, -0.9180381, -2.75547, 0, 0, 0, 1, 1,
-0.3198077, 1.793194, -1.796963, 1, 1, 1, 1, 1,
-0.3196448, -0.2676065, -3.599704, 1, 1, 1, 1, 1,
-0.3142541, -1.497293, -3.389501, 1, 1, 1, 1, 1,
-0.3142247, -1.075795, -2.507631, 1, 1, 1, 1, 1,
-0.3103257, 1.457291, -2.05141, 1, 1, 1, 1, 1,
-0.3099697, -1.221868, -3.928631, 1, 1, 1, 1, 1,
-0.3086435, 1.713058, 1.780703, 1, 1, 1, 1, 1,
-0.3085916, 1.28809, 0.2339534, 1, 1, 1, 1, 1,
-0.3080954, 0.1787317, -0.3855019, 1, 1, 1, 1, 1,
-0.3068812, -0.9131629, -3.740806, 1, 1, 1, 1, 1,
-0.3046306, 2.251885, -1.111814, 1, 1, 1, 1, 1,
-0.3020511, 0.1698713, 0.1734096, 1, 1, 1, 1, 1,
-0.2955238, 0.2364941, -2.247556, 1, 1, 1, 1, 1,
-0.2948495, -0.3249502, -3.341761, 1, 1, 1, 1, 1,
-0.2902466, 0.1826806, -0.2081205, 1, 1, 1, 1, 1,
-0.2894194, -1.206082, -2.857725, 0, 0, 1, 1, 1,
-0.2876458, -2.083946, -1.601176, 1, 0, 0, 1, 1,
-0.287361, 0.1085144, -2.09429, 1, 0, 0, 1, 1,
-0.2867388, -1.205927, -3.775883, 1, 0, 0, 1, 1,
-0.2825198, 0.7069035, -1.404541, 1, 0, 0, 1, 1,
-0.2761886, -0.2646693, -2.107335, 1, 0, 0, 1, 1,
-0.2758331, -0.4708501, -1.125408, 0, 0, 0, 1, 1,
-0.2675419, 1.900201, -0.03708178, 0, 0, 0, 1, 1,
-0.267012, 0.367282, 1.342991, 0, 0, 0, 1, 1,
-0.260536, -0.7118826, -5.195636, 0, 0, 0, 1, 1,
-0.2584772, -0.8571968, -3.064977, 0, 0, 0, 1, 1,
-0.252618, 1.068513, -0.4147282, 0, 0, 0, 1, 1,
-0.2513687, -0.2227936, -0.8010012, 0, 0, 0, 1, 1,
-0.2419983, -0.6393727, -3.70051, 1, 1, 1, 1, 1,
-0.2399702, 0.7685075, -0.9897753, 1, 1, 1, 1, 1,
-0.2359447, 1.82848, -1.382491, 1, 1, 1, 1, 1,
-0.2357641, -0.2557694, -1.917088, 1, 1, 1, 1, 1,
-0.2357635, 1.738055, -0.03705271, 1, 1, 1, 1, 1,
-0.233393, 0.5076692, -0.5022753, 1, 1, 1, 1, 1,
-0.2281691, -0.5679998, -5.565636, 1, 1, 1, 1, 1,
-0.2214681, -0.1571701, -2.029999, 1, 1, 1, 1, 1,
-0.2197012, -0.005455991, -1.049886, 1, 1, 1, 1, 1,
-0.2174399, 0.8204356, -1.96456, 1, 1, 1, 1, 1,
-0.2171293, 1.381411, -1.255984, 1, 1, 1, 1, 1,
-0.2118628, 0.5120484, 0.4690401, 1, 1, 1, 1, 1,
-0.2118285, -1.810823, -3.686481, 1, 1, 1, 1, 1,
-0.2112713, -0.2172136, -1.890886, 1, 1, 1, 1, 1,
-0.2098499, -0.8040878, -2.725847, 1, 1, 1, 1, 1,
-0.2077167, -1.911865, -1.394067, 0, 0, 1, 1, 1,
-0.2067824, 1.515147, -0.1384882, 1, 0, 0, 1, 1,
-0.2050037, -0.3927878, -2.919609, 1, 0, 0, 1, 1,
-0.2027953, 0.09302241, -0.410675, 1, 0, 0, 1, 1,
-0.2027121, -1.687486, -3.526244, 1, 0, 0, 1, 1,
-0.2024953, -1.292753, -3.496019, 1, 0, 0, 1, 1,
-0.1989371, -0.03117908, -2.350422, 0, 0, 0, 1, 1,
-0.1942729, -0.2608429, -2.73533, 0, 0, 0, 1, 1,
-0.192174, 0.069062, -1.96481, 0, 0, 0, 1, 1,
-0.1913509, -0.3403119, -2.549889, 0, 0, 0, 1, 1,
-0.1874569, 0.5652323, -3.069202, 0, 0, 0, 1, 1,
-0.18741, 0.1385807, -1.973416, 0, 0, 0, 1, 1,
-0.1872799, -1.644209, -1.435252, 0, 0, 0, 1, 1,
-0.1792299, -0.2048939, -1.760785, 1, 1, 1, 1, 1,
-0.1765124, 0.926411, 0.2130273, 1, 1, 1, 1, 1,
-0.1720356, -0.08726411, -2.044971, 1, 1, 1, 1, 1,
-0.1714005, 1.671066, -0.1477799, 1, 1, 1, 1, 1,
-0.1709577, -0.03736642, -1.395254, 1, 1, 1, 1, 1,
-0.1689545, 0.5115813, 0.05580734, 1, 1, 1, 1, 1,
-0.1683222, -0.1935297, -3.194267, 1, 1, 1, 1, 1,
-0.1662147, -0.09200425, -2.324962, 1, 1, 1, 1, 1,
-0.1583548, 0.4769319, -1.25698, 1, 1, 1, 1, 1,
-0.1546207, -0.08587953, -2.678545, 1, 1, 1, 1, 1,
-0.1506155, 0.4049618, -0.2292171, 1, 1, 1, 1, 1,
-0.1448947, -0.3634171, -3.254237, 1, 1, 1, 1, 1,
-0.1431032, -0.2304425, -3.23669, 1, 1, 1, 1, 1,
-0.1399717, 2.414361, -0.7741909, 1, 1, 1, 1, 1,
-0.1357844, 0.7985741, 0.8619469, 1, 1, 1, 1, 1,
-0.1304047, 0.3423682, 0.1193557, 0, 0, 1, 1, 1,
-0.1278227, -1.821118, -2.445863, 1, 0, 0, 1, 1,
-0.125761, 0.5495985, 0.1360947, 1, 0, 0, 1, 1,
-0.1185066, 1.281008, -0.4770569, 1, 0, 0, 1, 1,
-0.1148934, -0.2411889, -2.797988, 1, 0, 0, 1, 1,
-0.113328, 0.6561142, -0.51011, 1, 0, 0, 1, 1,
-0.1130417, 1.65245, -1.00538, 0, 0, 0, 1, 1,
-0.1079505, -0.456457, -2.279837, 0, 0, 0, 1, 1,
-0.1058617, -1.507663, -4.502157, 0, 0, 0, 1, 1,
-0.104241, -0.7353132, -2.757993, 0, 0, 0, 1, 1,
-0.1011415, 0.2300192, -1.830179, 0, 0, 0, 1, 1,
-0.1003179, -1.352752, -3.338006, 0, 0, 0, 1, 1,
-0.09950621, 0.6368003, -0.8189721, 0, 0, 0, 1, 1,
-0.0989007, 0.02546883, -2.07921, 1, 1, 1, 1, 1,
-0.09434415, 0.5368745, -1.746622, 1, 1, 1, 1, 1,
-0.09419961, 1.545437, -1.509181, 1, 1, 1, 1, 1,
-0.09416281, -1.267541, -2.492484, 1, 1, 1, 1, 1,
-0.09366675, 0.6529279, -0.7588143, 1, 1, 1, 1, 1,
-0.09226727, 0.6344732, 1.494698, 1, 1, 1, 1, 1,
-0.09143361, -0.3942415, -3.376199, 1, 1, 1, 1, 1,
-0.09130891, -0.6398817, -2.526978, 1, 1, 1, 1, 1,
-0.09076042, -0.3732429, -3.750148, 1, 1, 1, 1, 1,
-0.08945525, 0.4588006, -0.1635707, 1, 1, 1, 1, 1,
-0.07946417, -0.7331538, -3.751025, 1, 1, 1, 1, 1,
-0.07851586, -0.8844321, -3.485718, 1, 1, 1, 1, 1,
-0.07765512, 0.5490437, -0.9420633, 1, 1, 1, 1, 1,
-0.07741835, -0.1199235, -1.042663, 1, 1, 1, 1, 1,
-0.07660941, 1.141523, -0.6528645, 1, 1, 1, 1, 1,
-0.06757171, -0.7685905, -2.08848, 0, 0, 1, 1, 1,
-0.06531332, -0.1130441, -1.702437, 1, 0, 0, 1, 1,
-0.06351996, -1.497066, -2.433299, 1, 0, 0, 1, 1,
-0.0633305, 1.381547, -1.569891, 1, 0, 0, 1, 1,
-0.06118146, 0.2846943, 0.00772024, 1, 0, 0, 1, 1,
-0.05758623, -0.1524971, -3.14978, 1, 0, 0, 1, 1,
-0.05754728, 0.6138784, 1.656091, 0, 0, 0, 1, 1,
-0.05570551, -1.049348, -3.608088, 0, 0, 0, 1, 1,
-0.05219423, 0.7826252, -0.4686476, 0, 0, 0, 1, 1,
-0.04482361, -1.313801, -4.268675, 0, 0, 0, 1, 1,
-0.04374623, -0.6126084, -3.2342, 0, 0, 0, 1, 1,
-0.04018291, 0.3659946, -0.1785449, 0, 0, 0, 1, 1,
-0.03974191, -0.01790013, -0.2171469, 0, 0, 0, 1, 1,
-0.039563, -0.3879704, -4.856489, 1, 1, 1, 1, 1,
-0.03854775, -0.979158, -2.207238, 1, 1, 1, 1, 1,
-0.03811512, -1.478712, -3.013815, 1, 1, 1, 1, 1,
-0.03754079, 1.454652, -0.2003747, 1, 1, 1, 1, 1,
-0.03737652, -0.7216733, -4.029603, 1, 1, 1, 1, 1,
-0.03689564, -0.3187037, -1.560277, 1, 1, 1, 1, 1,
-0.03343778, -1.372577, -2.859131, 1, 1, 1, 1, 1,
-0.02123033, 0.1974217, 1.402149, 1, 1, 1, 1, 1,
-0.01766019, -0.1868557, -3.221022, 1, 1, 1, 1, 1,
-0.01277356, -0.2286624, -4.512836, 1, 1, 1, 1, 1,
-0.01105643, 1.427297, 1.53885, 1, 1, 1, 1, 1,
-0.01082672, 0.5321847, 0.3893932, 1, 1, 1, 1, 1,
-0.01038285, -0.2612449, -1.15185, 1, 1, 1, 1, 1,
-0.009989157, -0.2100948, -1.779815, 1, 1, 1, 1, 1,
-0.009764237, -0.1536582, -3.884881, 1, 1, 1, 1, 1,
-0.008806772, -0.6263016, -2.917194, 0, 0, 1, 1, 1,
-0.008476384, 0.4734088, 0.6167328, 1, 0, 0, 1, 1,
-0.005238995, 0.7685549, -1.271845, 1, 0, 0, 1, 1,
-0.003860656, -0.3336925, -1.04476, 1, 0, 0, 1, 1,
-0.002146394, 0.1812426, -1.104724, 1, 0, 0, 1, 1,
0.004621767, 0.7381011, 0.6583338, 1, 0, 0, 1, 1,
0.005323455, 1.034014, 0.1597792, 0, 0, 0, 1, 1,
0.00632196, 0.5868441, -0.8249109, 0, 0, 0, 1, 1,
0.007791001, 0.09820095, 1.485004, 0, 0, 0, 1, 1,
0.009508044, 0.7802103, 1.851163, 0, 0, 0, 1, 1,
0.02547987, 1.064411, 0.615259, 0, 0, 0, 1, 1,
0.02578433, 0.2416475, 0.2834076, 0, 0, 0, 1, 1,
0.02756112, 1.850033, 0.07108309, 0, 0, 0, 1, 1,
0.0316847, 0.7272555, -0.8942119, 1, 1, 1, 1, 1,
0.04298038, 1.105192, 0.4405634, 1, 1, 1, 1, 1,
0.04515855, 0.9614765, 1.491255, 1, 1, 1, 1, 1,
0.04523024, -0.7399021, 2.952797, 1, 1, 1, 1, 1,
0.04556217, 0.6250086, -0.7299511, 1, 1, 1, 1, 1,
0.04612173, -0.3259425, 2.418811, 1, 1, 1, 1, 1,
0.04953526, 0.3800235, 1.964706, 1, 1, 1, 1, 1,
0.05101191, -1.891682, 2.111337, 1, 1, 1, 1, 1,
0.05499298, -0.6297428, 4.815081, 1, 1, 1, 1, 1,
0.05881779, 1.288987, -0.529372, 1, 1, 1, 1, 1,
0.06364881, 1.170998, 0.5396677, 1, 1, 1, 1, 1,
0.06411436, 1.012588, 0.5897231, 1, 1, 1, 1, 1,
0.06969461, -0.09517758, 1.745632, 1, 1, 1, 1, 1,
0.07161231, -0.3913074, 2.279922, 1, 1, 1, 1, 1,
0.07272243, -2.077233, 2.204703, 1, 1, 1, 1, 1,
0.07430412, -1.254607, 3.926425, 0, 0, 1, 1, 1,
0.07890628, -0.009427782, 2.240479, 1, 0, 0, 1, 1,
0.08195906, 1.074465, 1.643399, 1, 0, 0, 1, 1,
0.08365228, -1.398214, 3.449856, 1, 0, 0, 1, 1,
0.08845579, -1.308414, 4.796299, 1, 0, 0, 1, 1,
0.08851422, 0.8216761, 0.5145917, 1, 0, 0, 1, 1,
0.08881718, 2.029423, -0.6726465, 0, 0, 0, 1, 1,
0.08955236, 1.176413, -1.847316, 0, 0, 0, 1, 1,
0.09166528, -0.1027939, 3.768778, 0, 0, 0, 1, 1,
0.09230761, 0.4429821, 1.080059, 0, 0, 0, 1, 1,
0.09527725, 1.472198, -0.3310111, 0, 0, 0, 1, 1,
0.09622261, 0.3793441, -0.7331516, 0, 0, 0, 1, 1,
0.09705426, 1.114622, 1.007249, 0, 0, 0, 1, 1,
0.1001985, -0.7666502, 2.131282, 1, 1, 1, 1, 1,
0.1031377, 0.2282771, 2.320678, 1, 1, 1, 1, 1,
0.1032289, 0.2079762, 1.103838, 1, 1, 1, 1, 1,
0.1034948, -0.2400365, 1.556931, 1, 1, 1, 1, 1,
0.1043795, -1.850852, 4.121637, 1, 1, 1, 1, 1,
0.1048272, -1.244801, 2.878524, 1, 1, 1, 1, 1,
0.1057832, -1.466254, 2.838845, 1, 1, 1, 1, 1,
0.1089221, -0.1727292, 2.784613, 1, 1, 1, 1, 1,
0.1112429, -0.04244667, 2.343245, 1, 1, 1, 1, 1,
0.117295, 1.360295, 1.337901, 1, 1, 1, 1, 1,
0.1197378, 0.4646396, -0.4802066, 1, 1, 1, 1, 1,
0.1201396, -0.2586894, 3.054154, 1, 1, 1, 1, 1,
0.1204842, -1.026553, 2.252386, 1, 1, 1, 1, 1,
0.1222441, -0.2972624, 2.317604, 1, 1, 1, 1, 1,
0.1228992, -0.2801015, 5.199042, 1, 1, 1, 1, 1,
0.1241492, -0.6445736, 3.03313, 0, 0, 1, 1, 1,
0.1258389, -0.1083905, 2.717199, 1, 0, 0, 1, 1,
0.127303, -2.304906, 3.469886, 1, 0, 0, 1, 1,
0.1341596, 0.3035933, -0.5268008, 1, 0, 0, 1, 1,
0.1348655, -0.7757108, 2.160869, 1, 0, 0, 1, 1,
0.1362436, 0.7063589, -1.021392, 1, 0, 0, 1, 1,
0.1412796, -0.07707161, 2.172565, 0, 0, 0, 1, 1,
0.1427242, 1.251935, 0.1768681, 0, 0, 0, 1, 1,
0.1430874, -1.098672, 0.748411, 0, 0, 0, 1, 1,
0.1434368, 0.6203168, 1.238319, 0, 0, 0, 1, 1,
0.1491698, 0.06666023, 0.6655734, 0, 0, 0, 1, 1,
0.1512502, -1.27293, 1.99254, 0, 0, 0, 1, 1,
0.159012, 0.631422, -0.7273892, 0, 0, 0, 1, 1,
0.1598693, -0.5713192, 1.04106, 1, 1, 1, 1, 1,
0.1630789, -0.6006025, 2.752143, 1, 1, 1, 1, 1,
0.1645474, -0.605234, 4.887251, 1, 1, 1, 1, 1,
0.1648442, -1.093625, 2.951088, 1, 1, 1, 1, 1,
0.1693249, -0.5055673, 2.760212, 1, 1, 1, 1, 1,
0.1729627, -0.978192, 1.7659, 1, 1, 1, 1, 1,
0.178333, -0.7318231, 2.808361, 1, 1, 1, 1, 1,
0.1783611, -0.04303119, 2.871044, 1, 1, 1, 1, 1,
0.1786173, 1.887226, -0.8659129, 1, 1, 1, 1, 1,
0.1803444, 1.092825, 0.3197826, 1, 1, 1, 1, 1,
0.1815918, -1.816138, 0.7589178, 1, 1, 1, 1, 1,
0.1851235, 0.3478024, 1.028504, 1, 1, 1, 1, 1,
0.1898839, -0.6892821, 1.145327, 1, 1, 1, 1, 1,
0.1907932, 1.161903, 0.5737004, 1, 1, 1, 1, 1,
0.1950003, 0.1357654, 1.03757, 1, 1, 1, 1, 1,
0.201631, 1.325245, -1.802863, 0, 0, 1, 1, 1,
0.2026086, -0.6944757, 2.267053, 1, 0, 0, 1, 1,
0.2030826, 0.3885374, 0.8603196, 1, 0, 0, 1, 1,
0.2065621, -0.5486004, 3.666328, 1, 0, 0, 1, 1,
0.2073143, -1.019567, 3.202423, 1, 0, 0, 1, 1,
0.2127132, -1.070542, 3.356, 1, 0, 0, 1, 1,
0.2136319, 2.329507, 0.8319749, 0, 0, 0, 1, 1,
0.2161453, 0.5533409, -0.09087966, 0, 0, 0, 1, 1,
0.2222315, 0.5990188, 0.620133, 0, 0, 0, 1, 1,
0.2259877, 0.4381247, 0.6486446, 0, 0, 0, 1, 1,
0.2293236, 1.645127, -1.86825, 0, 0, 0, 1, 1,
0.233403, 0.6115546, 2.231802, 0, 0, 0, 1, 1,
0.240989, 0.322483, 0.04572998, 0, 0, 0, 1, 1,
0.2464632, -0.9959707, 2.235736, 1, 1, 1, 1, 1,
0.248742, 0.3953559, -0.8510507, 1, 1, 1, 1, 1,
0.249161, 0.8197406, 0.9109228, 1, 1, 1, 1, 1,
0.2493461, 0.1974019, 0.8048196, 1, 1, 1, 1, 1,
0.2526489, -0.7283888, 3.393546, 1, 1, 1, 1, 1,
0.253784, 0.1891976, 3.514017, 1, 1, 1, 1, 1,
0.2539569, -0.3232412, 1.63989, 1, 1, 1, 1, 1,
0.2565422, 0.6826159, 0.7273436, 1, 1, 1, 1, 1,
0.25879, -0.4200126, 1.838944, 1, 1, 1, 1, 1,
0.258925, 2.139835, -1.354579, 1, 1, 1, 1, 1,
0.2628006, -0.5031206, 2.622905, 1, 1, 1, 1, 1,
0.2651574, 0.9812696, 1.160441, 1, 1, 1, 1, 1,
0.2710312, 0.9419187, 0.5742378, 1, 1, 1, 1, 1,
0.274097, -0.3711691, 3.681578, 1, 1, 1, 1, 1,
0.2792858, 0.2369056, 0.4337182, 1, 1, 1, 1, 1,
0.2801147, 0.1822515, 0.03577338, 0, 0, 1, 1, 1,
0.287108, -0.366355, 3.560817, 1, 0, 0, 1, 1,
0.2872702, -1.356623, 3.397665, 1, 0, 0, 1, 1,
0.2881617, -0.8262748, 0.8486685, 1, 0, 0, 1, 1,
0.2885305, -0.3766975, 1.970315, 1, 0, 0, 1, 1,
0.2891719, 0.9623215, 0.7094172, 1, 0, 0, 1, 1,
0.2925293, 0.08053559, 1.397364, 0, 0, 0, 1, 1,
0.2948359, -0.7901394, 1.698118, 0, 0, 0, 1, 1,
0.2952211, -1.921929, 2.79182, 0, 0, 0, 1, 1,
0.2977155, -0.133043, 1.233326, 0, 0, 0, 1, 1,
0.2983248, 0.7184675, -0.7212056, 0, 0, 0, 1, 1,
0.2999294, 0.814065, 0.6179895, 0, 0, 0, 1, 1,
0.3012327, -0.7007402, 2.272566, 0, 0, 0, 1, 1,
0.3016945, 0.1828954, 2.471496, 1, 1, 1, 1, 1,
0.3065342, -0.4155192, 2.179924, 1, 1, 1, 1, 1,
0.3067264, -0.06954066, 1.093295, 1, 1, 1, 1, 1,
0.3092837, 1.027879, -0.1427364, 1, 1, 1, 1, 1,
0.3179762, 0.5613783, 1.363948, 1, 1, 1, 1, 1,
0.3200223, -0.1241433, 2.069562, 1, 1, 1, 1, 1,
0.3230399, 0.05296299, -0.5900865, 1, 1, 1, 1, 1,
0.3273177, -0.08369596, 1.171959, 1, 1, 1, 1, 1,
0.3275228, -1.50528, 3.586807, 1, 1, 1, 1, 1,
0.3287576, 1.162923, 1.079491, 1, 1, 1, 1, 1,
0.3293153, 0.05075724, 0.839389, 1, 1, 1, 1, 1,
0.3364117, 1.423772, -0.2042752, 1, 1, 1, 1, 1,
0.3365034, 1.003079, 0.4069643, 1, 1, 1, 1, 1,
0.3381377, 0.1810302, 1.59811, 1, 1, 1, 1, 1,
0.345394, 0.9448133, 1.072157, 1, 1, 1, 1, 1,
0.3467225, -0.6711075, 0.9291335, 0, 0, 1, 1, 1,
0.3553789, -0.6348635, 3.939348, 1, 0, 0, 1, 1,
0.363778, 0.07200302, 1.742162, 1, 0, 0, 1, 1,
0.3658276, 0.09272861, -0.9205382, 1, 0, 0, 1, 1,
0.3705988, -1.654997, 2.980232, 1, 0, 0, 1, 1,
0.370886, 0.11327, 2.851211, 1, 0, 0, 1, 1,
0.371721, -0.21877, 2.303944, 0, 0, 0, 1, 1,
0.3748638, 0.2325232, 0.496611, 0, 0, 0, 1, 1,
0.3783545, 0.8759413, 1.087104, 0, 0, 0, 1, 1,
0.3790828, 0.7749919, -1.819295, 0, 0, 0, 1, 1,
0.3801138, -1.093444, 3.503935, 0, 0, 0, 1, 1,
0.3866308, 1.105651, -1.325073, 0, 0, 0, 1, 1,
0.3879053, -0.2815284, 0.7901973, 0, 0, 0, 1, 1,
0.3884025, 0.8772678, -0.2031846, 1, 1, 1, 1, 1,
0.3884218, -0.7932197, 2.660196, 1, 1, 1, 1, 1,
0.388936, -1.283762, 2.021288, 1, 1, 1, 1, 1,
0.3919065, -0.4435161, 2.394529, 1, 1, 1, 1, 1,
0.3959218, 0.05017021, 1.492909, 1, 1, 1, 1, 1,
0.3969815, 0.7269062, 1.679625, 1, 1, 1, 1, 1,
0.3991706, 0.5893404, -0.7215293, 1, 1, 1, 1, 1,
0.3992518, -1.934347, 3.77434, 1, 1, 1, 1, 1,
0.4001186, 2.086795, -0.3832497, 1, 1, 1, 1, 1,
0.4048331, -1.310881, 3.831828, 1, 1, 1, 1, 1,
0.4127408, -1.079592, 1.826012, 1, 1, 1, 1, 1,
0.4128481, 1.046655, 1.306127, 1, 1, 1, 1, 1,
0.4134989, -0.3215252, 2.422051, 1, 1, 1, 1, 1,
0.4153613, -1.167643, 2.318588, 1, 1, 1, 1, 1,
0.4214788, 0.5662, -1.701671, 1, 1, 1, 1, 1,
0.4226529, -1.038895, 2.277318, 0, 0, 1, 1, 1,
0.423467, -0.65688, 3.120948, 1, 0, 0, 1, 1,
0.4235948, -0.1867482, 1.419832, 1, 0, 0, 1, 1,
0.42369, -0.1117455, 0.7426187, 1, 0, 0, 1, 1,
0.4282417, 0.562281, 1.310914, 1, 0, 0, 1, 1,
0.4293257, 1.207681, -1.248975, 1, 0, 0, 1, 1,
0.4302536, -0.2392156, 3.486861, 0, 0, 0, 1, 1,
0.4303918, -2.523803, 3.57277, 0, 0, 0, 1, 1,
0.4410098, -1.078024, 3.693104, 0, 0, 0, 1, 1,
0.4413482, 0.06378736, 0.5186046, 0, 0, 0, 1, 1,
0.4416574, 0.5544034, 2.138157, 0, 0, 0, 1, 1,
0.4441002, -0.8009543, 2.708049, 0, 0, 0, 1, 1,
0.4469992, 1.129004, 0.2477924, 0, 0, 0, 1, 1,
0.4478648, 0.5393423, 0.9264578, 1, 1, 1, 1, 1,
0.4506826, 1.128377, -0.03295592, 1, 1, 1, 1, 1,
0.4518654, -0.7981114, 3.208917, 1, 1, 1, 1, 1,
0.4520851, -0.09319241, 2.254401, 1, 1, 1, 1, 1,
0.4527357, 1.692024, -0.2728595, 1, 1, 1, 1, 1,
0.4530309, 1.998078, 0.3460379, 1, 1, 1, 1, 1,
0.4619553, 0.8640445, 2.011882, 1, 1, 1, 1, 1,
0.4643444, 0.663156, 1.160432, 1, 1, 1, 1, 1,
0.4657844, -0.4369954, 2.893083, 1, 1, 1, 1, 1,
0.4687631, 2.794052, 1.032654, 1, 1, 1, 1, 1,
0.4689492, -1.056832, 2.088827, 1, 1, 1, 1, 1,
0.4691744, -3.450886, 5.532515, 1, 1, 1, 1, 1,
0.4707799, -0.7549692, 2.682814, 1, 1, 1, 1, 1,
0.4746311, 0.004553765, 0.671142, 1, 1, 1, 1, 1,
0.4748288, 0.214943, 2.496388, 1, 1, 1, 1, 1,
0.4749159, 0.125974, 2.485091, 0, 0, 1, 1, 1,
0.4755059, 1.398529, 0.8659444, 1, 0, 0, 1, 1,
0.4810514, 1.251597, 1.335005, 1, 0, 0, 1, 1,
0.4827305, -0.0442028, 3.055431, 1, 0, 0, 1, 1,
0.4828019, 0.8610515, 0.3209867, 1, 0, 0, 1, 1,
0.4832856, -0.3565777, 1.894667, 1, 0, 0, 1, 1,
0.4833845, 0.6899812, -0.4816465, 0, 0, 0, 1, 1,
0.4836881, 1.94748, -0.8246227, 0, 0, 0, 1, 1,
0.4838783, -1.27562, 2.18163, 0, 0, 0, 1, 1,
0.4914338, -0.5092203, 3.396858, 0, 0, 0, 1, 1,
0.4947103, 0.4459547, -0.451587, 0, 0, 0, 1, 1,
0.4984177, -0.6190714, 3.746249, 0, 0, 0, 1, 1,
0.5052608, 0.9747086, 0.6115825, 0, 0, 0, 1, 1,
0.5053926, 0.8598412, 0.3002738, 1, 1, 1, 1, 1,
0.5075568, -1.6794, 4.353965, 1, 1, 1, 1, 1,
0.519696, 0.2694438, 1.191, 1, 1, 1, 1, 1,
0.5239645, -0.8672963, 2.14747, 1, 1, 1, 1, 1,
0.5263311, 0.8045275, 1.678728, 1, 1, 1, 1, 1,
0.5280742, -0.8642614, 1.573699, 1, 1, 1, 1, 1,
0.5299103, 1.215908, -1.773092, 1, 1, 1, 1, 1,
0.5307755, -0.4019097, 0.03226865, 1, 1, 1, 1, 1,
0.534913, 1.319721, -0.782607, 1, 1, 1, 1, 1,
0.5381688, 0.7285866, 0.4686593, 1, 1, 1, 1, 1,
0.55378, -0.07877652, 1.07946, 1, 1, 1, 1, 1,
0.5644094, -2.694003, 3.852935, 1, 1, 1, 1, 1,
0.5682331, -0.4848472, 3.194366, 1, 1, 1, 1, 1,
0.5754119, -1.123538, 2.617255, 1, 1, 1, 1, 1,
0.6028748, 1.193958, -1.026525, 1, 1, 1, 1, 1,
0.6058066, -1.079799, 1.866853, 0, 0, 1, 1, 1,
0.6187083, -1.443391, 3.43658, 1, 0, 0, 1, 1,
0.6247296, 1.258805, 1.085673, 1, 0, 0, 1, 1,
0.6258238, -0.3406575, 1.750414, 1, 0, 0, 1, 1,
0.6395704, -1.720579, 4.170835, 1, 0, 0, 1, 1,
0.647238, -0.2521618, 1.365022, 1, 0, 0, 1, 1,
0.6494001, 1.683951, 0.4170974, 0, 0, 0, 1, 1,
0.6566555, 0.6890842, 0.3916907, 0, 0, 0, 1, 1,
0.6632953, -0.5201521, 2.348217, 0, 0, 0, 1, 1,
0.6645148, 0.08458779, 4.113381, 0, 0, 0, 1, 1,
0.6696056, 0.214986, 2.185328, 0, 0, 0, 1, 1,
0.6720843, -0.09443718, 2.511569, 0, 0, 0, 1, 1,
0.6725201, -0.1998831, 3.144096, 0, 0, 0, 1, 1,
0.6758044, -0.0423265, 3.350703, 1, 1, 1, 1, 1,
0.6759561, -1.088519, 2.451231, 1, 1, 1, 1, 1,
0.6851642, 0.4589727, 0.6948162, 1, 1, 1, 1, 1,
0.6963877, 0.5538876, 1.810064, 1, 1, 1, 1, 1,
0.7015043, -0.5661428, 2.709493, 1, 1, 1, 1, 1,
0.7155028, -0.05380493, 1.739428, 1, 1, 1, 1, 1,
0.7163648, 0.626729, -0.4843269, 1, 1, 1, 1, 1,
0.7196529, 0.6933048, 1.583491, 1, 1, 1, 1, 1,
0.7219428, -1.857748, 3.179546, 1, 1, 1, 1, 1,
0.7236573, -2.423959, 3.957924, 1, 1, 1, 1, 1,
0.7300786, -2.130878, 1.514228, 1, 1, 1, 1, 1,
0.7373554, 0.1624968, -0.2196068, 1, 1, 1, 1, 1,
0.7432047, 1.474659, 0.1669457, 1, 1, 1, 1, 1,
0.7439476, -0.5944619, 2.816672, 1, 1, 1, 1, 1,
0.7451068, 0.6984233, 0.5777681, 1, 1, 1, 1, 1,
0.7465516, 0.2538081, 0.7789685, 0, 0, 1, 1, 1,
0.7502255, -0.5650464, 3.578355, 1, 0, 0, 1, 1,
0.7512454, 0.8456178, 0.2345413, 1, 0, 0, 1, 1,
0.752885, 2.554566, 0.3338887, 1, 0, 0, 1, 1,
0.7589718, 0.3600106, 1.446758, 1, 0, 0, 1, 1,
0.7604979, 0.2661763, 0.1872038, 1, 0, 0, 1, 1,
0.7642606, -1.322165, 2.980982, 0, 0, 0, 1, 1,
0.7653058, -1.217081, 3.377893, 0, 0, 0, 1, 1,
0.7733698, -0.3652345, 2.006678, 0, 0, 0, 1, 1,
0.773706, 0.8187945, 1.131002, 0, 0, 0, 1, 1,
0.7737816, -0.2095438, 1.709866, 0, 0, 0, 1, 1,
0.776729, 1.076265, 0.7286496, 0, 0, 0, 1, 1,
0.7777013, -1.400651, 1.234177, 0, 0, 0, 1, 1,
0.7839297, 0.7688656, -0.068289, 1, 1, 1, 1, 1,
0.784933, 0.602161, 0.854361, 1, 1, 1, 1, 1,
0.7853138, -0.8889254, 2.462806, 1, 1, 1, 1, 1,
0.7855248, 0.5284613, 0.3777222, 1, 1, 1, 1, 1,
0.78828, -0.254966, 0.9563776, 1, 1, 1, 1, 1,
0.7885274, 1.914099, -0.2659836, 1, 1, 1, 1, 1,
0.7945108, 0.7547849, 1.481925, 1, 1, 1, 1, 1,
0.7945129, 0.3298471, 0.8956881, 1, 1, 1, 1, 1,
0.7952822, -0.4767033, 3.508993, 1, 1, 1, 1, 1,
0.8018842, 1.489683, 0.2761698, 1, 1, 1, 1, 1,
0.804958, -0.7780805, 2.606681, 1, 1, 1, 1, 1,
0.8087088, -0.3302258, 1.186098, 1, 1, 1, 1, 1,
0.8126888, -0.3949701, 3.069102, 1, 1, 1, 1, 1,
0.8133909, -0.2422953, 0.9882174, 1, 1, 1, 1, 1,
0.8146753, -0.5670896, 2.528019, 1, 1, 1, 1, 1,
0.817888, 1.486704, -0.821654, 0, 0, 1, 1, 1,
0.8183762, -1.124138, 2.565949, 1, 0, 0, 1, 1,
0.819779, -0.9021412, 2.67187, 1, 0, 0, 1, 1,
0.8200551, -0.7445809, 2.970835, 1, 0, 0, 1, 1,
0.8248658, -2.438959, 2.131868, 1, 0, 0, 1, 1,
0.8260006, 1.683607, 0.5711246, 1, 0, 0, 1, 1,
0.8277901, 1.485202, -1.280801, 0, 0, 0, 1, 1,
0.8278039, 1.364881, -0.3386641, 0, 0, 0, 1, 1,
0.8282412, 0.2329656, -0.01648653, 0, 0, 0, 1, 1,
0.8292384, -1.020975, 2.340581, 0, 0, 0, 1, 1,
0.8294836, -0.5807614, 2.076878, 0, 0, 0, 1, 1,
0.8348448, -0.6496344, 2.852721, 0, 0, 0, 1, 1,
0.8390394, 0.7663186, 1.212583, 0, 0, 0, 1, 1,
0.8502408, -0.6183069, 2.994344, 1, 1, 1, 1, 1,
0.8538655, 0.8021585, 1.377887, 1, 1, 1, 1, 1,
0.8550754, -0.3705299, 3.245849, 1, 1, 1, 1, 1,
0.8695386, -1.059323, 3.209921, 1, 1, 1, 1, 1,
0.8728535, 0.6441463, 1.683163, 1, 1, 1, 1, 1,
0.874432, -1.747466, 4.493193, 1, 1, 1, 1, 1,
0.8755332, -0.3312899, 0.7876947, 1, 1, 1, 1, 1,
0.8798408, 0.3857877, 1.674695, 1, 1, 1, 1, 1,
0.8857228, 0.7194403, 1.72598, 1, 1, 1, 1, 1,
0.8912165, -1.050695, 3.310476, 1, 1, 1, 1, 1,
0.8923411, -0.3760149, 1.975993, 1, 1, 1, 1, 1,
0.8939303, -0.319807, 1.566934, 1, 1, 1, 1, 1,
0.8995799, 1.153358, -0.4902119, 1, 1, 1, 1, 1,
0.9004849, 1.07925, 1.376885, 1, 1, 1, 1, 1,
0.9151541, 1.316112, 0.8028299, 1, 1, 1, 1, 1,
0.9259257, -1.359735, 3.244394, 0, 0, 1, 1, 1,
0.9312797, 0.487118, 1.777128, 1, 0, 0, 1, 1,
0.9353286, -0.2955383, 1.486039, 1, 0, 0, 1, 1,
0.9368421, -0.1904021, 0.9863751, 1, 0, 0, 1, 1,
0.9381314, -0.2988747, 2.164618, 1, 0, 0, 1, 1,
0.9400542, 0.7964228, 1.565033, 1, 0, 0, 1, 1,
0.9492223, -0.3348502, 1.710557, 0, 0, 0, 1, 1,
0.9589911, -0.9031767, 3.063696, 0, 0, 0, 1, 1,
0.9613026, -0.426513, 0.7390576, 0, 0, 0, 1, 1,
0.9619341, 0.0647587, 0.9360901, 0, 0, 0, 1, 1,
0.9620872, -0.3218937, 2.246229, 0, 0, 0, 1, 1,
0.9629657, -0.4817406, 1.827866, 0, 0, 0, 1, 1,
0.9659294, 1.149809, 1.211082, 0, 0, 0, 1, 1,
0.9735876, -0.7788589, 1.899704, 1, 1, 1, 1, 1,
0.9797155, -1.907179, 2.449578, 1, 1, 1, 1, 1,
0.9803061, -0.1044575, 0.4342649, 1, 1, 1, 1, 1,
0.9856598, 0.1565786, -0.4237396, 1, 1, 1, 1, 1,
0.993359, -0.6550295, 2.019687, 1, 1, 1, 1, 1,
0.9995572, 0.7220714, 1.718357, 1, 1, 1, 1, 1,
1.000302, -0.2043258, 1.319122, 1, 1, 1, 1, 1,
1.001185, -1.168845, 3.198747, 1, 1, 1, 1, 1,
1.011586, -0.1927146, 0.5611162, 1, 1, 1, 1, 1,
1.01464, 1.896651, 1.094824, 1, 1, 1, 1, 1,
1.022658, -0.2278005, 2.046479, 1, 1, 1, 1, 1,
1.024507, 1.067546, 1.546649, 1, 1, 1, 1, 1,
1.028909, 0.2607471, -0.1763017, 1, 1, 1, 1, 1,
1.029916, -1.439926, 4.547928, 1, 1, 1, 1, 1,
1.035209, -0.2856696, 1.612526, 1, 1, 1, 1, 1,
1.044212, 0.1146826, 0.8008122, 0, 0, 1, 1, 1,
1.045957, 0.7167153, -0.2892589, 1, 0, 0, 1, 1,
1.046046, -0.1531948, 2.249542, 1, 0, 0, 1, 1,
1.052314, -0.5446671, 1.76607, 1, 0, 0, 1, 1,
1.057746, -1.264246, 2.361933, 1, 0, 0, 1, 1,
1.068182, -0.5587509, 2.035654, 1, 0, 0, 1, 1,
1.07024, -0.9596059, 2.663774, 0, 0, 0, 1, 1,
1.076159, -1.152996, 2.713455, 0, 0, 0, 1, 1,
1.076172, -2.808792, 2.852749, 0, 0, 0, 1, 1,
1.084122, -0.3311772, 1.698169, 0, 0, 0, 1, 1,
1.087651, -1.073964, 2.314229, 0, 0, 0, 1, 1,
1.092098, -0.3950685, 1.503967, 0, 0, 0, 1, 1,
1.093285, -1.556561, 2.898741, 0, 0, 0, 1, 1,
1.095573, 0.1896367, 2.599032, 1, 1, 1, 1, 1,
1.101582, 0.1084857, 0.9853381, 1, 1, 1, 1, 1,
1.10828, -0.738192, 1.9968, 1, 1, 1, 1, 1,
1.117216, -0.7995507, 3.751288, 1, 1, 1, 1, 1,
1.121592, 0.7274108, -0.1784466, 1, 1, 1, 1, 1,
1.129933, -0.756516, 1.854916, 1, 1, 1, 1, 1,
1.137077, 0.9551371, 2.280696, 1, 1, 1, 1, 1,
1.139038, -0.3369181, 1.914174, 1, 1, 1, 1, 1,
1.140425, -0.6603137, 1.062115, 1, 1, 1, 1, 1,
1.141378, -0.2503805, 0.9959396, 1, 1, 1, 1, 1,
1.143777, 0.5619742, 1.814461, 1, 1, 1, 1, 1,
1.14545, 1.200898, 1.596781, 1, 1, 1, 1, 1,
1.157804, -1.717853, 1.957585, 1, 1, 1, 1, 1,
1.15971, -0.515141, 1.735863, 1, 1, 1, 1, 1,
1.167219, 0.1741164, 0.8950837, 1, 1, 1, 1, 1,
1.16958, 1.569085, 0.1016102, 0, 0, 1, 1, 1,
1.176535, 0.8760812, 0.5990432, 1, 0, 0, 1, 1,
1.181593, -0.241402, 1.729627, 1, 0, 0, 1, 1,
1.181682, -1.72041, 2.181832, 1, 0, 0, 1, 1,
1.187079, 2.122146, -0.02511595, 1, 0, 0, 1, 1,
1.188455, 0.9779639, 2.087625, 1, 0, 0, 1, 1,
1.19084, -0.4376966, 2.313127, 0, 0, 0, 1, 1,
1.200823, 0.5380277, 1.26362, 0, 0, 0, 1, 1,
1.201114, -1.078708, 2.402868, 0, 0, 0, 1, 1,
1.212784, -1.680068, 3.573487, 0, 0, 0, 1, 1,
1.215965, -0.8179386, 1.702517, 0, 0, 0, 1, 1,
1.219165, -0.461921, 2.736136, 0, 0, 0, 1, 1,
1.219291, -0.7171928, 0.7297116, 0, 0, 0, 1, 1,
1.219472, -0.7604987, 1.487368, 1, 1, 1, 1, 1,
1.220941, 0.760752, 0.4968826, 1, 1, 1, 1, 1,
1.221013, -0.6553714, 2.915401, 1, 1, 1, 1, 1,
1.225103, -0.2980954, 0.483615, 1, 1, 1, 1, 1,
1.228685, -0.423565, -0.1131333, 1, 1, 1, 1, 1,
1.236195, 0.9119546, 1.245838, 1, 1, 1, 1, 1,
1.238497, -0.4249381, 2.440453, 1, 1, 1, 1, 1,
1.239957, 0.03052489, 0.1130021, 1, 1, 1, 1, 1,
1.249333, -0.7367125, 1.624575, 1, 1, 1, 1, 1,
1.252251, -0.1587765, 1.582855, 1, 1, 1, 1, 1,
1.255351, 0.2426481, 1.058134, 1, 1, 1, 1, 1,
1.263035, 0.5925345, 1.934194, 1, 1, 1, 1, 1,
1.26892, 0.5981516, 2.854018, 1, 1, 1, 1, 1,
1.271107, 0.5907125, 2.065777, 1, 1, 1, 1, 1,
1.272526, 0.8994309, -0.4961029, 1, 1, 1, 1, 1,
1.272551, -0.04351675, 2.5734, 0, 0, 1, 1, 1,
1.283744, -0.04220673, 0.2771532, 1, 0, 0, 1, 1,
1.301157, 1.136357, 2.124606, 1, 0, 0, 1, 1,
1.30236, 1.467912, -0.2125731, 1, 0, 0, 1, 1,
1.319303, -0.650024, 1.104244, 1, 0, 0, 1, 1,
1.328949, -0.8213525, 1.432408, 1, 0, 0, 1, 1,
1.330471, 0.2360606, 0.8361513, 0, 0, 0, 1, 1,
1.331371, -2.013226, 2.881141, 0, 0, 0, 1, 1,
1.337733, -0.7655904, 1.716479, 0, 0, 0, 1, 1,
1.337966, -1.825189, 2.356334, 0, 0, 0, 1, 1,
1.340515, -0.7083972, 1.636101, 0, 0, 0, 1, 1,
1.342808, 0.3920672, 1.407582, 0, 0, 0, 1, 1,
1.366408, 0.1809727, 1.956767, 0, 0, 0, 1, 1,
1.374302, -1.219858, 1.818997, 1, 1, 1, 1, 1,
1.376405, -2.025331, 2.76375, 1, 1, 1, 1, 1,
1.377173, -0.3087552, 0.4463345, 1, 1, 1, 1, 1,
1.378375, 0.007661545, 2.011487, 1, 1, 1, 1, 1,
1.379715, 1.11876, 0.6406559, 1, 1, 1, 1, 1,
1.388722, 0.9703854, 2.529737, 1, 1, 1, 1, 1,
1.402899, -0.2851816, 1.397592, 1, 1, 1, 1, 1,
1.406131, 0.3005471, 0.2537627, 1, 1, 1, 1, 1,
1.407656, 1.037954, 1.22449, 1, 1, 1, 1, 1,
1.426943, -0.2587566, 2.575238, 1, 1, 1, 1, 1,
1.427871, 1.121107, 0.7838339, 1, 1, 1, 1, 1,
1.430763, -0.09508381, 1.585102, 1, 1, 1, 1, 1,
1.440008, -1.079086, 2.947728, 1, 1, 1, 1, 1,
1.450232, 0.4208691, 1.846502, 1, 1, 1, 1, 1,
1.459263, 0.06810395, 1.906641, 1, 1, 1, 1, 1,
1.462521, -0.509753, 1.840406, 0, 0, 1, 1, 1,
1.47095, 0.2771336, 0.9260764, 1, 0, 0, 1, 1,
1.48804, 0.2234988, 3.199438, 1, 0, 0, 1, 1,
1.492281, 0.3113594, 0.8785236, 1, 0, 0, 1, 1,
1.498868, 1.103217, 1.686122, 1, 0, 0, 1, 1,
1.506299, -1.015222, 4.577603, 1, 0, 0, 1, 1,
1.51418, -0.3802111, 1.859152, 0, 0, 0, 1, 1,
1.52947, -0.7114342, 0.8302031, 0, 0, 0, 1, 1,
1.529954, -0.1120138, 1.358963, 0, 0, 0, 1, 1,
1.536389, 0.5024797, 0.8635515, 0, 0, 0, 1, 1,
1.536706, -1.35561, 2.812417, 0, 0, 0, 1, 1,
1.541727, -2.098856, 2.893926, 0, 0, 0, 1, 1,
1.545033, -1.259396, 0.3224545, 0, 0, 0, 1, 1,
1.546847, -0.2512973, 2.159572, 1, 1, 1, 1, 1,
1.558589, 0.9754032, 1.15483, 1, 1, 1, 1, 1,
1.572876, 2.042849, -0.5533446, 1, 1, 1, 1, 1,
1.574447, 0.3899593, -0.1676585, 1, 1, 1, 1, 1,
1.577017, -0.2423891, 2.511877, 1, 1, 1, 1, 1,
1.590573, 1.595936, 0.1443211, 1, 1, 1, 1, 1,
1.597903, 0.1880661, 1.020131, 1, 1, 1, 1, 1,
1.618016, -0.1014122, 2.341254, 1, 1, 1, 1, 1,
1.623909, -1.23949, 1.133541, 1, 1, 1, 1, 1,
1.635584, 0.3440699, 1.308398, 1, 1, 1, 1, 1,
1.651196, 0.3229872, 1.822765, 1, 1, 1, 1, 1,
1.671337, 0.2924621, 1.077198, 1, 1, 1, 1, 1,
1.685198, -0.8501202, 2.305532, 1, 1, 1, 1, 1,
1.707386, 0.6157539, 2.069628, 1, 1, 1, 1, 1,
1.710878, 2.244699, 0.6100107, 1, 1, 1, 1, 1,
1.711007, 0.5675158, 1.541948, 0, 0, 1, 1, 1,
1.728931, -0.9662194, 1.123188, 1, 0, 0, 1, 1,
1.76457, -0.5010327, 0.7400635, 1, 0, 0, 1, 1,
1.772638, -0.7687399, 1.773988, 1, 0, 0, 1, 1,
1.786624, 0.9618144, 2.739961, 1, 0, 0, 1, 1,
1.788241, -0.2128005, 3.910681, 1, 0, 0, 1, 1,
1.7941, -0.05675799, 1.216202, 0, 0, 0, 1, 1,
1.796382, 0.8815689, 0.8487616, 0, 0, 0, 1, 1,
1.796792, -0.3967493, 2.387221, 0, 0, 0, 1, 1,
1.800205, 1.242241, -0.4439895, 0, 0, 0, 1, 1,
1.806123, -0.847778, 1.511938, 0, 0, 0, 1, 1,
1.813009, -1.215005, 3.220959, 0, 0, 0, 1, 1,
1.81681, 0.6708795, 1.180114, 0, 0, 0, 1, 1,
1.836845, 0.05319383, 0.7878041, 1, 1, 1, 1, 1,
1.854038, -0.8108596, 3.466794, 1, 1, 1, 1, 1,
1.858683, -0.827047, -0.2255771, 1, 1, 1, 1, 1,
1.862318, -0.4763238, 1.148128, 1, 1, 1, 1, 1,
1.900024, -0.1165864, 0.9210243, 1, 1, 1, 1, 1,
1.920128, -0.1392466, 2.546162, 1, 1, 1, 1, 1,
1.939304, -1.238641, 3.455662, 1, 1, 1, 1, 1,
1.939608, -1.138698, 3.35277, 1, 1, 1, 1, 1,
1.970779, 0.5541512, 0.1889525, 1, 1, 1, 1, 1,
1.983986, -1.37599, 1.860357, 1, 1, 1, 1, 1,
1.991216, -0.5690911, 2.57152, 1, 1, 1, 1, 1,
2.005873, 0.5641441, 1.944557, 1, 1, 1, 1, 1,
2.00784, -1.273994, 2.710353, 1, 1, 1, 1, 1,
2.011791, 0.6976639, 0.2976981, 1, 1, 1, 1, 1,
2.019765, 0.5040213, 2.636929, 1, 1, 1, 1, 1,
2.03929, -0.1751287, 1.121614, 0, 0, 1, 1, 1,
2.043641, 0.05052937, -0.5765161, 1, 0, 0, 1, 1,
2.054681, -0.3461839, 2.377701, 1, 0, 0, 1, 1,
2.058513, 1.795658, 0.4111922, 1, 0, 0, 1, 1,
2.068475, -0.3146154, 2.609535, 1, 0, 0, 1, 1,
2.082452, 0.08178627, 1.233818, 1, 0, 0, 1, 1,
2.083589, 0.398893, 2.207643, 0, 0, 0, 1, 1,
2.104812, -0.1755442, 1.501695, 0, 0, 0, 1, 1,
2.156613, 0.8830256, 2.816993, 0, 0, 0, 1, 1,
2.172402, 0.6331496, 2.038275, 0, 0, 0, 1, 1,
2.227356, -0.01779593, 2.31387, 0, 0, 0, 1, 1,
2.239946, 0.2000867, 2.333784, 0, 0, 0, 1, 1,
2.373983, -1.461275, 2.47613, 0, 0, 0, 1, 1,
2.395212, -1.645669, 1.886448, 1, 1, 1, 1, 1,
2.542999, -0.8141612, 4.028062, 1, 1, 1, 1, 1,
2.570984, 1.651368, 1.702876, 1, 1, 1, 1, 1,
2.674402, 1.252905, 0.3554028, 1, 1, 1, 1, 1,
2.755218, 1.157607, -0.5216914, 1, 1, 1, 1, 1,
2.9266, 0.4195305, -0.767207, 1, 1, 1, 1, 1,
3.320659, 0.6387175, 1.291912, 1, 1, 1, 1, 1
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
var radius = 9.891461;
var distance = 34.74334;
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
mvMatrix.translate( -0.06942749, 0.5002614, 0.01656055 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.74334);
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
