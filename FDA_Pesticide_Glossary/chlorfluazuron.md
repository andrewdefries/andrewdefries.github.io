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
-3.942657, -0.8510774, -2.299493, 1, 0, 0, 1,
-2.977016, 1.024131, 0.541514, 1, 0.007843138, 0, 1,
-2.955127, -0.4285089, -0.1648739, 1, 0.01176471, 0, 1,
-2.876135, -0.3154928, -1.542314, 1, 0.01960784, 0, 1,
-2.777893, -1.228659, -2.241484, 1, 0.02352941, 0, 1,
-2.585501, 1.216393, -0.7298223, 1, 0.03137255, 0, 1,
-2.572951, 0.7545739, -1.127267, 1, 0.03529412, 0, 1,
-2.457133, 0.659934, -2.909449, 1, 0.04313726, 0, 1,
-2.280023, 0.4617198, -1.297501, 1, 0.04705882, 0, 1,
-2.234846, -0.0207017, -2.655753, 1, 0.05490196, 0, 1,
-2.206383, -0.01289286, -2.74956, 1, 0.05882353, 0, 1,
-2.204382, 1.542182, -0.2389951, 1, 0.06666667, 0, 1,
-2.128104, 3.072694, -0.1692604, 1, 0.07058824, 0, 1,
-2.110983, 0.3006766, -1.314145, 1, 0.07843138, 0, 1,
-2.092476, 0.2051394, -2.410537, 1, 0.08235294, 0, 1,
-2.082989, 0.2870098, -2.368626, 1, 0.09019608, 0, 1,
-2.036007, -0.1405515, -2.636673, 1, 0.09411765, 0, 1,
-2.031431, 0.2232462, -1.538095, 1, 0.1019608, 0, 1,
-2.012762, 0.6746939, -0.2011572, 1, 0.1098039, 0, 1,
-2.007924, 2.696183, 1.470569, 1, 0.1137255, 0, 1,
-1.991042, 0.08761762, -2.063517, 1, 0.1215686, 0, 1,
-1.984583, 0.6313326, -1.741165, 1, 0.1254902, 0, 1,
-1.983783, -0.9190425, -2.03631, 1, 0.1333333, 0, 1,
-1.974334, -0.872734, -1.187762, 1, 0.1372549, 0, 1,
-1.943207, -0.5656717, -1.97774, 1, 0.145098, 0, 1,
-1.932232, 0.06237345, -0.5385057, 1, 0.1490196, 0, 1,
-1.916901, -1.63002, -2.322427, 1, 0.1568628, 0, 1,
-1.896371, 0.4745411, 0.9111351, 1, 0.1607843, 0, 1,
-1.864549, 0.4844505, -1.844525, 1, 0.1686275, 0, 1,
-1.835992, 1.098694, -0.9039703, 1, 0.172549, 0, 1,
-1.828513, 0.5695447, -1.691497, 1, 0.1803922, 0, 1,
-1.795874, 1.198477, -1.942023, 1, 0.1843137, 0, 1,
-1.779223, 0.4580739, -1.727006, 1, 0.1921569, 0, 1,
-1.765707, -0.05814458, -3.547292, 1, 0.1960784, 0, 1,
-1.756214, -1.558198, -2.553913, 1, 0.2039216, 0, 1,
-1.728804, 1.623155, -0.7775825, 1, 0.2117647, 0, 1,
-1.722861, -0.4487761, -2.214525, 1, 0.2156863, 0, 1,
-1.706207, -1.16496, -2.007598, 1, 0.2235294, 0, 1,
-1.703829, 0.4739448, -1.784554, 1, 0.227451, 0, 1,
-1.686424, 0.06213777, -1.856988, 1, 0.2352941, 0, 1,
-1.684704, 0.07804249, -1.354124, 1, 0.2392157, 0, 1,
-1.673465, -0.8899516, -0.5179199, 1, 0.2470588, 0, 1,
-1.663592, -0.8603739, -3.177339, 1, 0.2509804, 0, 1,
-1.657478, 1.083227, 0.5931225, 1, 0.2588235, 0, 1,
-1.655536, 0.3302625, 0.2023096, 1, 0.2627451, 0, 1,
-1.652628, 0.03199491, -3.169345, 1, 0.2705882, 0, 1,
-1.642146, 0.4854335, 0.3856587, 1, 0.2745098, 0, 1,
-1.640932, -0.2713311, -2.587962, 1, 0.282353, 0, 1,
-1.633387, 0.338302, 0.4969914, 1, 0.2862745, 0, 1,
-1.63094, -0.8163314, -2.031584, 1, 0.2941177, 0, 1,
-1.623901, -1.12687, -1.62867, 1, 0.3019608, 0, 1,
-1.609226, 0.3634879, -0.04249318, 1, 0.3058824, 0, 1,
-1.607573, 0.9386882, -0.1201809, 1, 0.3137255, 0, 1,
-1.59865, -0.1179836, -3.519292, 1, 0.3176471, 0, 1,
-1.597777, -0.9638924, -1.476697, 1, 0.3254902, 0, 1,
-1.595759, 0.0345113, -0.4426588, 1, 0.3294118, 0, 1,
-1.593771, -0.460549, -1.608553, 1, 0.3372549, 0, 1,
-1.577945, 0.01489738, -2.46745, 1, 0.3411765, 0, 1,
-1.56678, 0.2063386, -1.241242, 1, 0.3490196, 0, 1,
-1.556863, 1.787941, -0.9293289, 1, 0.3529412, 0, 1,
-1.555158, -1.684043, -2.807204, 1, 0.3607843, 0, 1,
-1.554293, -0.06177978, -0.9514647, 1, 0.3647059, 0, 1,
-1.551416, 0.1228426, -1.656492, 1, 0.372549, 0, 1,
-1.547991, 0.3211852, -0.9983484, 1, 0.3764706, 0, 1,
-1.546834, 0.1691898, -1.725373, 1, 0.3843137, 0, 1,
-1.529796, 0.4055825, -1.632537, 1, 0.3882353, 0, 1,
-1.521274, 1.723357, -0.2799274, 1, 0.3960784, 0, 1,
-1.515015, -0.02492693, -0.8686951, 1, 0.4039216, 0, 1,
-1.513816, 0.07894456, -2.802974, 1, 0.4078431, 0, 1,
-1.511405, -1.144559, -1.821019, 1, 0.4156863, 0, 1,
-1.479468, 1.576349, -2.536747, 1, 0.4196078, 0, 1,
-1.450438, -1.138188, -3.103468, 1, 0.427451, 0, 1,
-1.442557, 0.01967526, -0.4438034, 1, 0.4313726, 0, 1,
-1.442158, -1.213983, -2.279191, 1, 0.4392157, 0, 1,
-1.43336, 1.72968, 0.1249433, 1, 0.4431373, 0, 1,
-1.430787, 0.4001659, -1.059586, 1, 0.4509804, 0, 1,
-1.427125, -0.2529065, -0.7920032, 1, 0.454902, 0, 1,
-1.42584, 1.313487, 0.6307204, 1, 0.4627451, 0, 1,
-1.42313, 0.5391919, -0.3824997, 1, 0.4666667, 0, 1,
-1.422059, -1.167449, -3.215152, 1, 0.4745098, 0, 1,
-1.417632, -1.084411, -3.073814, 1, 0.4784314, 0, 1,
-1.415383, -0.117795, -1.944789, 1, 0.4862745, 0, 1,
-1.408713, -0.08728918, -0.3414488, 1, 0.4901961, 0, 1,
-1.381749, 1.274911, 0.2368423, 1, 0.4980392, 0, 1,
-1.380817, 0.5426052, -0.9510078, 1, 0.5058824, 0, 1,
-1.378232, 0.4183459, -1.142409, 1, 0.509804, 0, 1,
-1.377054, -1.78177, -3.755949, 1, 0.5176471, 0, 1,
-1.367853, -0.3524818, -2.183886, 1, 0.5215687, 0, 1,
-1.362028, 0.8140403, -0.5081143, 1, 0.5294118, 0, 1,
-1.348027, 0.2787792, -0.9694639, 1, 0.5333334, 0, 1,
-1.347057, -0.5261078, -2.208483, 1, 0.5411765, 0, 1,
-1.324005, -0.9748284, -0.5292296, 1, 0.5450981, 0, 1,
-1.315144, 0.6717852, -1.200461, 1, 0.5529412, 0, 1,
-1.305539, -0.6967669, -1.856963, 1, 0.5568628, 0, 1,
-1.303279, 0.8110104, -0.8653213, 1, 0.5647059, 0, 1,
-1.300468, -0.8697711, -2.252927, 1, 0.5686275, 0, 1,
-1.299308, -0.1086853, -2.155051, 1, 0.5764706, 0, 1,
-1.294997, -0.6597494, -2.2752, 1, 0.5803922, 0, 1,
-1.292073, 2.322452, -2.433142, 1, 0.5882353, 0, 1,
-1.285288, -1.863546, -3.867004, 1, 0.5921569, 0, 1,
-1.280586, 0.2184004, -2.466731, 1, 0.6, 0, 1,
-1.280536, 1.353901, -0.9637426, 1, 0.6078432, 0, 1,
-1.263185, 0.3585549, -0.4762394, 1, 0.6117647, 0, 1,
-1.262763, -0.05161021, -1.077628, 1, 0.6196079, 0, 1,
-1.254167, 2.21696, -1.3489, 1, 0.6235294, 0, 1,
-1.251323, -1.037748, -1.701511, 1, 0.6313726, 0, 1,
-1.239896, 1.622937, 1.014268, 1, 0.6352941, 0, 1,
-1.238416, -0.1221117, -1.584222, 1, 0.6431373, 0, 1,
-1.233139, 0.5129169, 0.2177301, 1, 0.6470588, 0, 1,
-1.232641, -0.6535867, -2.122541, 1, 0.654902, 0, 1,
-1.231069, 0.4205014, -2.767151, 1, 0.6588235, 0, 1,
-1.221682, 1.321322, 0.227526, 1, 0.6666667, 0, 1,
-1.215322, 0.9022168, -0.61678, 1, 0.6705883, 0, 1,
-1.208745, 0.656814, -0.5831574, 1, 0.6784314, 0, 1,
-1.208387, -0.7397342, -2.875425, 1, 0.682353, 0, 1,
-1.201001, 1.481089, 0.0418752, 1, 0.6901961, 0, 1,
-1.200237, 1.19207, -1.166646, 1, 0.6941177, 0, 1,
-1.193488, -2.753909, -1.772704, 1, 0.7019608, 0, 1,
-1.187613, 0.8998187, -0.3373297, 1, 0.7098039, 0, 1,
-1.187534, -0.9184191, -3.623419, 1, 0.7137255, 0, 1,
-1.182726, 1.098507, -1.612976, 1, 0.7215686, 0, 1,
-1.174449, -0.4730861, -1.749046, 1, 0.7254902, 0, 1,
-1.171714, 0.6151773, 0.4056553, 1, 0.7333333, 0, 1,
-1.170516, 0.828001, -0.8397163, 1, 0.7372549, 0, 1,
-1.16991, -0.9420973, -2.2083, 1, 0.7450981, 0, 1,
-1.165248, -0.7682119, -2.675243, 1, 0.7490196, 0, 1,
-1.162009, 0.2326741, 0.3127943, 1, 0.7568628, 0, 1,
-1.146407, 1.375819, -0.3046097, 1, 0.7607843, 0, 1,
-1.140607, -0.4338795, -2.161832, 1, 0.7686275, 0, 1,
-1.13635, -0.3999392, -2.952607, 1, 0.772549, 0, 1,
-1.134236, -0.1149416, -0.9860075, 1, 0.7803922, 0, 1,
-1.131386, -2.1287, -1.919943, 1, 0.7843137, 0, 1,
-1.12281, 0.3728323, -1.29864, 1, 0.7921569, 0, 1,
-1.11669, -0.5008432, -2.874706, 1, 0.7960784, 0, 1,
-1.116651, -0.5832032, -2.846189, 1, 0.8039216, 0, 1,
-1.111539, 0.1411054, -0.06637815, 1, 0.8117647, 0, 1,
-1.109102, 1.680578, -1.704254, 1, 0.8156863, 0, 1,
-1.092064, -0.9064456, -2.35525, 1, 0.8235294, 0, 1,
-1.089826, 0.7354512, -0.09903658, 1, 0.827451, 0, 1,
-1.086298, 1.028415, -0.4004686, 1, 0.8352941, 0, 1,
-1.084343, 1.587921, -0.00901698, 1, 0.8392157, 0, 1,
-1.079614, 0.00734841, -2.699583, 1, 0.8470588, 0, 1,
-1.072457, 2.513658, -2.231715, 1, 0.8509804, 0, 1,
-1.04698, 1.209059, -0.9284379, 1, 0.8588235, 0, 1,
-1.044605, -0.7526899, -1.957846, 1, 0.8627451, 0, 1,
-1.044075, -0.370353, -2.145365, 1, 0.8705882, 0, 1,
-1.039379, -1.288401, -3.877153, 1, 0.8745098, 0, 1,
-1.0299, -0.0051058, -1.452648, 1, 0.8823529, 0, 1,
-1.027531, 0.7249507, -2.183747, 1, 0.8862745, 0, 1,
-1.019928, -0.08064453, -2.22441, 1, 0.8941177, 0, 1,
-1.01506, -0.01582535, -2.173635, 1, 0.8980392, 0, 1,
-1.014529, 1.119001, 0.800382, 1, 0.9058824, 0, 1,
-1.014128, -1.952014, -2.747184, 1, 0.9137255, 0, 1,
-1.00149, 0.3308243, -1.013644, 1, 0.9176471, 0, 1,
-0.9998531, 1.810507, 0.9299662, 1, 0.9254902, 0, 1,
-0.9937623, -0.2197587, -1.432939, 1, 0.9294118, 0, 1,
-0.9875172, 0.3737863, -2.523504, 1, 0.9372549, 0, 1,
-0.9873945, 0.6321134, -0.6669544, 1, 0.9411765, 0, 1,
-0.986032, -1.028124, -3.745697, 1, 0.9490196, 0, 1,
-0.9800926, 0.2058402, -2.776903, 1, 0.9529412, 0, 1,
-0.9766197, -1.233198, -3.717559, 1, 0.9607843, 0, 1,
-0.970519, -0.001341763, -2.672905, 1, 0.9647059, 0, 1,
-0.9674847, 0.1191069, -2.804657, 1, 0.972549, 0, 1,
-0.9661496, 0.4648081, 1.333906, 1, 0.9764706, 0, 1,
-0.9626628, 0.3025949, -0.760309, 1, 0.9843137, 0, 1,
-0.957414, 0.3508556, -2.195851, 1, 0.9882353, 0, 1,
-0.9560471, -1.518658, -2.912065, 1, 0.9960784, 0, 1,
-0.9541805, 1.507028, -1.160786, 0.9960784, 1, 0, 1,
-0.9526396, 0.04953343, -1.533734, 0.9921569, 1, 0, 1,
-0.9500217, -1.085513, -0.01085684, 0.9843137, 1, 0, 1,
-0.9488859, -1.417912, -1.097619, 0.9803922, 1, 0, 1,
-0.9439664, 2.027753, 0.03350579, 0.972549, 1, 0, 1,
-0.9412143, 1.054591, -0.07615571, 0.9686275, 1, 0, 1,
-0.9394727, -0.6192744, -3.735758, 0.9607843, 1, 0, 1,
-0.936655, 0.127942, -2.752007, 0.9568627, 1, 0, 1,
-0.9353357, -0.7042776, -3.107867, 0.9490196, 1, 0, 1,
-0.9338384, 1.174695, -0.1494115, 0.945098, 1, 0, 1,
-0.9167535, -0.1771297, -0.5442409, 0.9372549, 1, 0, 1,
-0.9133964, 1.388828, -0.291088, 0.9333333, 1, 0, 1,
-0.9124359, 0.2623783, -1.818254, 0.9254902, 1, 0, 1,
-0.9089877, 1.246259, -0.5654712, 0.9215686, 1, 0, 1,
-0.9086997, 1.423177, -0.1155604, 0.9137255, 1, 0, 1,
-0.908388, 0.2151778, -2.69978, 0.9098039, 1, 0, 1,
-0.9077814, 0.8517475, -1.294027, 0.9019608, 1, 0, 1,
-0.9066957, 1.235889, 0.04333657, 0.8941177, 1, 0, 1,
-0.9066286, -0.06130563, -2.00426, 0.8901961, 1, 0, 1,
-0.9059007, -1.384258, -2.139416, 0.8823529, 1, 0, 1,
-0.9007022, 0.2473746, -2.38388, 0.8784314, 1, 0, 1,
-0.899389, 0.8708467, -2.174724, 0.8705882, 1, 0, 1,
-0.8928004, 0.450795, -1.596598, 0.8666667, 1, 0, 1,
-0.8841825, 1.072708, -1.759416, 0.8588235, 1, 0, 1,
-0.8793918, 0.9487325, -0.4606988, 0.854902, 1, 0, 1,
-0.8768538, 0.9395817, 0.004671149, 0.8470588, 1, 0, 1,
-0.8759546, -1.111935, -2.68415, 0.8431373, 1, 0, 1,
-0.8751112, -0.07327765, -3.59945, 0.8352941, 1, 0, 1,
-0.8733069, -0.782025, -3.093343, 0.8313726, 1, 0, 1,
-0.8668436, -1.062565, -3.37828, 0.8235294, 1, 0, 1,
-0.8458476, 0.6907106, -1.065308, 0.8196079, 1, 0, 1,
-0.8440692, -0.3333581, -2.677725, 0.8117647, 1, 0, 1,
-0.843435, 0.6457875, -0.02485504, 0.8078431, 1, 0, 1,
-0.8419441, 0.8388625, 1.040542, 0.8, 1, 0, 1,
-0.8412796, -1.687086, -3.586541, 0.7921569, 1, 0, 1,
-0.8407335, 0.4375774, -1.473042, 0.7882353, 1, 0, 1,
-0.8392631, -0.8009193, -1.2822, 0.7803922, 1, 0, 1,
-0.8373016, 0.7594512, -1.067892, 0.7764706, 1, 0, 1,
-0.8304409, -1.035876, -1.0231, 0.7686275, 1, 0, 1,
-0.8249676, 1.486445, 0.09187371, 0.7647059, 1, 0, 1,
-0.8227304, -1.162915, -3.138964, 0.7568628, 1, 0, 1,
-0.8169009, -0.2173914, -1.453511, 0.7529412, 1, 0, 1,
-0.8163489, -0.9234155, -1.762672, 0.7450981, 1, 0, 1,
-0.8062617, -0.2944463, -2.194265, 0.7411765, 1, 0, 1,
-0.8043588, -1.536191, -1.491595, 0.7333333, 1, 0, 1,
-0.8006057, 0.1971887, -3.059615, 0.7294118, 1, 0, 1,
-0.7945693, 1.424742, -1.189656, 0.7215686, 1, 0, 1,
-0.7904028, 1.079613, -1.701134, 0.7176471, 1, 0, 1,
-0.7838274, -1.195044, -3.931092, 0.7098039, 1, 0, 1,
-0.7813848, 0.962769, -1.14289, 0.7058824, 1, 0, 1,
-0.7804571, -2.527672, -3.406636, 0.6980392, 1, 0, 1,
-0.7745789, -0.2477765, -2.332595, 0.6901961, 1, 0, 1,
-0.7716821, 0.2557794, -1.679053, 0.6862745, 1, 0, 1,
-0.7705356, 0.4033887, -1.878227, 0.6784314, 1, 0, 1,
-0.7697083, 0.3607641, 1.289006, 0.6745098, 1, 0, 1,
-0.7693005, -0.2209735, -0.5619937, 0.6666667, 1, 0, 1,
-0.7655767, -2.869959, -1.140593, 0.6627451, 1, 0, 1,
-0.7641981, -0.3590908, -3.249701, 0.654902, 1, 0, 1,
-0.7504389, -0.3452515, -3.491067, 0.6509804, 1, 0, 1,
-0.7414365, -0.1534765, -1.275685, 0.6431373, 1, 0, 1,
-0.7396379, 0.7792548, -2.789951, 0.6392157, 1, 0, 1,
-0.7340257, -0.1887175, -1.886007, 0.6313726, 1, 0, 1,
-0.7322828, 0.5812813, -2.425875, 0.627451, 1, 0, 1,
-0.7320904, 2.227103, -0.6681942, 0.6196079, 1, 0, 1,
-0.7256835, 1.4448, 0.1278489, 0.6156863, 1, 0, 1,
-0.720759, 0.3708665, -1.21489, 0.6078432, 1, 0, 1,
-0.719, 0.06605814, -1.204233, 0.6039216, 1, 0, 1,
-0.7180856, -0.1012522, -0.8200558, 0.5960785, 1, 0, 1,
-0.717352, 0.290283, -3.525812, 0.5882353, 1, 0, 1,
-0.7102109, 0.3363232, -1.521187, 0.5843138, 1, 0, 1,
-0.7095562, 1.278027, -0.06569398, 0.5764706, 1, 0, 1,
-0.7089233, 0.2557545, -3.512198, 0.572549, 1, 0, 1,
-0.6958061, -0.1276664, -1.657095, 0.5647059, 1, 0, 1,
-0.6931905, -0.4047009, -1.788804, 0.5607843, 1, 0, 1,
-0.6913481, -1.393144, -3.726237, 0.5529412, 1, 0, 1,
-0.6903782, -0.0249333, -2.514057, 0.5490196, 1, 0, 1,
-0.6864551, -1.4, -3.583149, 0.5411765, 1, 0, 1,
-0.6849298, 0.2411565, -0.2719182, 0.5372549, 1, 0, 1,
-0.6729919, -0.4854953, -2.899106, 0.5294118, 1, 0, 1,
-0.669818, 1.345127, -0.2901856, 0.5254902, 1, 0, 1,
-0.668764, -0.7439373, -2.510295, 0.5176471, 1, 0, 1,
-0.6678156, -1.967782, -3.206319, 0.5137255, 1, 0, 1,
-0.6673145, 1.491401, -0.7321171, 0.5058824, 1, 0, 1,
-0.6625646, -0.8737109, -3.356281, 0.5019608, 1, 0, 1,
-0.6617301, 0.3345476, 1.75382, 0.4941176, 1, 0, 1,
-0.6556334, 0.476047, -0.8500635, 0.4862745, 1, 0, 1,
-0.6542813, 0.9576373, -0.7559154, 0.4823529, 1, 0, 1,
-0.6542106, -0.2452657, -2.655896, 0.4745098, 1, 0, 1,
-0.649584, -0.6410176, -0.9549103, 0.4705882, 1, 0, 1,
-0.6494988, 1.733043, -0.1648332, 0.4627451, 1, 0, 1,
-0.6403361, 1.081726, -0.1069451, 0.4588235, 1, 0, 1,
-0.6312903, -1.158228, -2.822006, 0.4509804, 1, 0, 1,
-0.6254678, 0.5730518, -0.5920452, 0.4470588, 1, 0, 1,
-0.6197761, -0.6909353, -4.165645, 0.4392157, 1, 0, 1,
-0.6167876, 0.182144, -1.825562, 0.4352941, 1, 0, 1,
-0.6145378, 0.3044723, -2.554335, 0.427451, 1, 0, 1,
-0.6125716, 1.122816, -1.973311, 0.4235294, 1, 0, 1,
-0.611648, 1.191802, -1.278459, 0.4156863, 1, 0, 1,
-0.6100121, 0.7371182, -1.747957, 0.4117647, 1, 0, 1,
-0.6071819, -0.4334721, -3.685237, 0.4039216, 1, 0, 1,
-0.6036463, 0.4220436, -1.832198, 0.3960784, 1, 0, 1,
-0.6033018, 1.931286, -0.06538253, 0.3921569, 1, 0, 1,
-0.5956349, 0.2945853, -0.8799118, 0.3843137, 1, 0, 1,
-0.595466, -1.418285, -2.523787, 0.3803922, 1, 0, 1,
-0.5938641, -1.160093, -4.511419, 0.372549, 1, 0, 1,
-0.5920656, -0.4760185, -1.699241, 0.3686275, 1, 0, 1,
-0.5883455, -1.467124, -2.967124, 0.3607843, 1, 0, 1,
-0.5880156, -0.07879763, -1.72558, 0.3568628, 1, 0, 1,
-0.5819902, -0.7372485, -2.988706, 0.3490196, 1, 0, 1,
-0.581975, -0.9547005, -0.8380075, 0.345098, 1, 0, 1,
-0.575927, 0.8892259, 0.7128671, 0.3372549, 1, 0, 1,
-0.5725157, -0.4640245, -2.258078, 0.3333333, 1, 0, 1,
-0.5650586, 0.0273736, -1.904209, 0.3254902, 1, 0, 1,
-0.5573817, 0.7511606, 0.06757335, 0.3215686, 1, 0, 1,
-0.5563892, 0.1651679, -2.24459, 0.3137255, 1, 0, 1,
-0.5552899, 1.162651, 0.5793777, 0.3098039, 1, 0, 1,
-0.5528854, -1.310563, -2.971881, 0.3019608, 1, 0, 1,
-0.5500357, 0.5981457, -1.672232, 0.2941177, 1, 0, 1,
-0.5486419, 0.759151, 0.3378742, 0.2901961, 1, 0, 1,
-0.5448399, 0.5363967, -1.884998, 0.282353, 1, 0, 1,
-0.5442687, 0.4715212, -0.7174202, 0.2784314, 1, 0, 1,
-0.5374201, -0.3851197, -2.83261, 0.2705882, 1, 0, 1,
-0.5370805, 0.3691559, -2.102276, 0.2666667, 1, 0, 1,
-0.5367503, 0.2587146, -1.193676, 0.2588235, 1, 0, 1,
-0.5355997, 0.1133152, -1.768057, 0.254902, 1, 0, 1,
-0.5339751, 1.030607, -0.8753088, 0.2470588, 1, 0, 1,
-0.5332232, -1.252583, -2.553914, 0.2431373, 1, 0, 1,
-0.5315465, 0.5055628, -0.5675848, 0.2352941, 1, 0, 1,
-0.5301759, 2.607916, -0.2486909, 0.2313726, 1, 0, 1,
-0.5284128, 0.103494, -0.1249703, 0.2235294, 1, 0, 1,
-0.5234742, 1.087375, -0.6880062, 0.2196078, 1, 0, 1,
-0.5216348, -0.7688044, -3.403638, 0.2117647, 1, 0, 1,
-0.5211828, -0.3654628, -1.483228, 0.2078431, 1, 0, 1,
-0.5211402, 0.6199759, -0.2765396, 0.2, 1, 0, 1,
-0.5207175, 0.6089077, -0.3564653, 0.1921569, 1, 0, 1,
-0.5171856, 0.6708979, -1.578426, 0.1882353, 1, 0, 1,
-0.5157632, 0.3184097, -1.255935, 0.1803922, 1, 0, 1,
-0.5148547, -2.434837, -3.113524, 0.1764706, 1, 0, 1,
-0.5146545, -1.731239, -2.722003, 0.1686275, 1, 0, 1,
-0.5142159, 1.452752, -0.963437, 0.1647059, 1, 0, 1,
-0.5139912, 1.856276, -1.09586, 0.1568628, 1, 0, 1,
-0.5098289, -0.7033179, -3.983923, 0.1529412, 1, 0, 1,
-0.5071029, -0.6549482, -1.668139, 0.145098, 1, 0, 1,
-0.5046761, 1.318578, -0.9930168, 0.1411765, 1, 0, 1,
-0.5038258, -0.2319049, -2.171548, 0.1333333, 1, 0, 1,
-0.5030359, 0.365261, 0.5659219, 0.1294118, 1, 0, 1,
-0.4937854, -1.070331, -3.376594, 0.1215686, 1, 0, 1,
-0.4929647, -0.2650629, -2.210271, 0.1176471, 1, 0, 1,
-0.4892567, -0.3583435, -2.524222, 0.1098039, 1, 0, 1,
-0.4879021, -0.3631187, -1.198127, 0.1058824, 1, 0, 1,
-0.483584, 1.744821, 0.9507324, 0.09803922, 1, 0, 1,
-0.4831659, -1.840468, -1.912513, 0.09019608, 1, 0, 1,
-0.4822399, -0.729885, -2.913783, 0.08627451, 1, 0, 1,
-0.479846, -0.8917534, -0.7382615, 0.07843138, 1, 0, 1,
-0.4783324, -0.0162081, -0.7835674, 0.07450981, 1, 0, 1,
-0.4764114, 0.229136, -0.9375046, 0.06666667, 1, 0, 1,
-0.4733269, -1.00618, -4.150482, 0.0627451, 1, 0, 1,
-0.4733183, 1.444026, -0.8723024, 0.05490196, 1, 0, 1,
-0.4707473, 2.071492, -1.655091, 0.05098039, 1, 0, 1,
-0.4689076, -0.965553, -2.325577, 0.04313726, 1, 0, 1,
-0.4655878, -2.083512, -2.91399, 0.03921569, 1, 0, 1,
-0.464992, -1.29937, -2.616757, 0.03137255, 1, 0, 1,
-0.4596637, -0.7113726, -1.703474, 0.02745098, 1, 0, 1,
-0.4593832, -1.695168, -2.291305, 0.01960784, 1, 0, 1,
-0.4589279, 0.1107245, -0.05498334, 0.01568628, 1, 0, 1,
-0.457078, 0.2058017, 1.056061, 0.007843138, 1, 0, 1,
-0.4540671, -0.5347003, -2.796049, 0.003921569, 1, 0, 1,
-0.4484144, 0.5846466, -0.6133331, 0, 1, 0.003921569, 1,
-0.4475532, -1.772044, -3.045041, 0, 1, 0.01176471, 1,
-0.4473524, -0.5318589, -2.327443, 0, 1, 0.01568628, 1,
-0.4453196, -1.627037, -3.058327, 0, 1, 0.02352941, 1,
-0.4438674, 0.6659395, 0.1544906, 0, 1, 0.02745098, 1,
-0.4435443, 0.4144734, -1.637938, 0, 1, 0.03529412, 1,
-0.4431789, -0.468412, -1.692194, 0, 1, 0.03921569, 1,
-0.4424109, -1.125403, -0.3463333, 0, 1, 0.04705882, 1,
-0.4404636, 0.8621106, 0.4069265, 0, 1, 0.05098039, 1,
-0.4357786, 0.1927423, -0.03287232, 0, 1, 0.05882353, 1,
-0.4350348, 0.9170482, -0.365958, 0, 1, 0.0627451, 1,
-0.4327391, -0.05364487, -1.129958, 0, 1, 0.07058824, 1,
-0.4319523, 0.6745183, -0.7946121, 0, 1, 0.07450981, 1,
-0.4314286, 2.382757, -0.397078, 0, 1, 0.08235294, 1,
-0.4278267, -0.861529, -2.271313, 0, 1, 0.08627451, 1,
-0.4267085, -0.2861078, -2.274863, 0, 1, 0.09411765, 1,
-0.4244741, 1.109361, 1.379137, 0, 1, 0.1019608, 1,
-0.4129479, -0.7284813, -2.505344, 0, 1, 0.1058824, 1,
-0.4111604, 0.08826639, -0.6096772, 0, 1, 0.1137255, 1,
-0.4081858, -0.7287022, -2.776676, 0, 1, 0.1176471, 1,
-0.4072881, -1.310802, -4.254183, 0, 1, 0.1254902, 1,
-0.4064831, -0.661126, -3.144435, 0, 1, 0.1294118, 1,
-0.3982753, 1.135206, 0.6857468, 0, 1, 0.1372549, 1,
-0.394718, 1.089368, -2.539243, 0, 1, 0.1411765, 1,
-0.3874575, 0.6220885, -1.034433, 0, 1, 0.1490196, 1,
-0.3861092, -0.5753283, -3.311958, 0, 1, 0.1529412, 1,
-0.3859259, 0.1448304, -0.6917626, 0, 1, 0.1607843, 1,
-0.381009, -0.639891, -2.205345, 0, 1, 0.1647059, 1,
-0.3762254, -1.042758, -3.416839, 0, 1, 0.172549, 1,
-0.3759665, -0.1385709, -1.017469, 0, 1, 0.1764706, 1,
-0.3737508, 1.323812, -0.6747245, 0, 1, 0.1843137, 1,
-0.3725717, -0.5780268, -2.502135, 0, 1, 0.1882353, 1,
-0.3716967, -1.475841, -3.186851, 0, 1, 0.1960784, 1,
-0.3694741, -2.660893, -3.646159, 0, 1, 0.2039216, 1,
-0.3694522, -0.757423, -2.358166, 0, 1, 0.2078431, 1,
-0.3685854, -1.857539, -1.372751, 0, 1, 0.2156863, 1,
-0.3684528, -0.395004, -2.128293, 0, 1, 0.2196078, 1,
-0.3678263, -0.3021833, -0.5114829, 0, 1, 0.227451, 1,
-0.363171, 0.3242225, -2.297306, 0, 1, 0.2313726, 1,
-0.3625359, 0.3735089, 0.231494, 0, 1, 0.2392157, 1,
-0.3594572, -0.586453, -2.530042, 0, 1, 0.2431373, 1,
-0.3555987, -1.403989, -3.06458, 0, 1, 0.2509804, 1,
-0.3532668, 0.01236248, -2.509426, 0, 1, 0.254902, 1,
-0.3532333, 1.61322, -0.1280592, 0, 1, 0.2627451, 1,
-0.3529768, 0.4846929, -0.5919591, 0, 1, 0.2666667, 1,
-0.3500183, 0.7352229, 0.5409315, 0, 1, 0.2745098, 1,
-0.3495795, -0.8716105, -2.335223, 0, 1, 0.2784314, 1,
-0.3487825, -0.2485089, -3.080791, 0, 1, 0.2862745, 1,
-0.3482739, -0.5155731, -1.9436, 0, 1, 0.2901961, 1,
-0.3452643, -1.06779, -2.179002, 0, 1, 0.2980392, 1,
-0.3437714, 0.2329887, -1.531566, 0, 1, 0.3058824, 1,
-0.3375638, 0.8819953, 1.596976, 0, 1, 0.3098039, 1,
-0.33678, -0.2711504, -2.31676, 0, 1, 0.3176471, 1,
-0.3359124, -0.7138996, -2.703461, 0, 1, 0.3215686, 1,
-0.3248302, 1.525031, 0.1436036, 0, 1, 0.3294118, 1,
-0.3245144, -0.08296207, -2.117656, 0, 1, 0.3333333, 1,
-0.3218524, 0.6270028, -1.233679, 0, 1, 0.3411765, 1,
-0.3201452, 0.8702691, -1.848144, 0, 1, 0.345098, 1,
-0.3200581, 0.01783422, -2.48399, 0, 1, 0.3529412, 1,
-0.3193807, 0.474341, -1.336543, 0, 1, 0.3568628, 1,
-0.3181872, -0.7981162, -2.444741, 0, 1, 0.3647059, 1,
-0.3178148, 1.150349, -1.576924, 0, 1, 0.3686275, 1,
-0.3169632, -2.211257, -1.621595, 0, 1, 0.3764706, 1,
-0.3155838, 0.7918785, -1.14404, 0, 1, 0.3803922, 1,
-0.3139249, -0.04945225, -1.707523, 0, 1, 0.3882353, 1,
-0.3107446, 0.1162528, -1.588621, 0, 1, 0.3921569, 1,
-0.3101798, -0.05158563, -2.306738, 0, 1, 0.4, 1,
-0.3064084, -0.08152796, -2.782815, 0, 1, 0.4078431, 1,
-0.3034071, -0.184165, -2.767378, 0, 1, 0.4117647, 1,
-0.3032391, 0.8589548, -0.192687, 0, 1, 0.4196078, 1,
-0.3009778, -0.713701, -2.818309, 0, 1, 0.4235294, 1,
-0.2992828, -0.02845638, -2.865614, 0, 1, 0.4313726, 1,
-0.2986669, -1.209296, -5.060542, 0, 1, 0.4352941, 1,
-0.294406, 3.148125, -1.113096, 0, 1, 0.4431373, 1,
-0.2921333, -1.191394, -3.310277, 0, 1, 0.4470588, 1,
-0.2857119, 0.5939826, 1.219481, 0, 1, 0.454902, 1,
-0.2833333, -0.3639346, -3.678671, 0, 1, 0.4588235, 1,
-0.2831012, -0.5859807, -2.756051, 0, 1, 0.4666667, 1,
-0.282636, -0.939761, -4.403169, 0, 1, 0.4705882, 1,
-0.2811223, -0.8859946, -3.76008, 0, 1, 0.4784314, 1,
-0.2759019, -0.2428349, -1.553305, 0, 1, 0.4823529, 1,
-0.2718673, -1.201019, -3.412855, 0, 1, 0.4901961, 1,
-0.2705321, 0.1006773, -2.65943, 0, 1, 0.4941176, 1,
-0.2703675, -1.685009, -3.40422, 0, 1, 0.5019608, 1,
-0.2660588, 0.1441108, 0.08998384, 0, 1, 0.509804, 1,
-0.2651869, -0.07143853, -1.978102, 0, 1, 0.5137255, 1,
-0.2578094, 0.6424958, -1.383274, 0, 1, 0.5215687, 1,
-0.2436101, 0.2508429, -0.6555041, 0, 1, 0.5254902, 1,
-0.2395314, 1.254985, -0.6998528, 0, 1, 0.5333334, 1,
-0.2387478, 0.4133223, -1.710229, 0, 1, 0.5372549, 1,
-0.2379446, -1.254905, -3.604074, 0, 1, 0.5450981, 1,
-0.2379029, -0.2954974, -2.94597, 0, 1, 0.5490196, 1,
-0.2371726, 1.392846, 0.4754564, 0, 1, 0.5568628, 1,
-0.2307435, -0.715463, -3.368505, 0, 1, 0.5607843, 1,
-0.2230657, -1.526173, -4.634404, 0, 1, 0.5686275, 1,
-0.2177861, -0.2369259, -1.638014, 0, 1, 0.572549, 1,
-0.2176709, 0.8245456, -0.6175194, 0, 1, 0.5803922, 1,
-0.2155085, 0.364225, -1.340041, 0, 1, 0.5843138, 1,
-0.2139178, 0.004810879, -2.914989, 0, 1, 0.5921569, 1,
-0.2124723, 0.2206949, -1.199788, 0, 1, 0.5960785, 1,
-0.2078685, -0.9407778, -3.401672, 0, 1, 0.6039216, 1,
-0.2052241, 0.09171327, -1.094228, 0, 1, 0.6117647, 1,
-0.2050847, -1.851551, -3.918749, 0, 1, 0.6156863, 1,
-0.2046845, 1.545704, 0.3115765, 0, 1, 0.6235294, 1,
-0.2015752, 1.010684, -0.4938912, 0, 1, 0.627451, 1,
-0.1946615, -0.3885374, -2.035246, 0, 1, 0.6352941, 1,
-0.1946233, 0.8294411, -1.673526, 0, 1, 0.6392157, 1,
-0.1919591, -1.010616, -2.296496, 0, 1, 0.6470588, 1,
-0.1843697, -1.78788, -3.808761, 0, 1, 0.6509804, 1,
-0.1818574, -0.4908673, -3.771338, 0, 1, 0.6588235, 1,
-0.1813852, 0.3867233, -1.106897, 0, 1, 0.6627451, 1,
-0.1782682, 0.6897321, 0.3284024, 0, 1, 0.6705883, 1,
-0.1766741, 0.2195125, -0.9912543, 0, 1, 0.6745098, 1,
-0.1764373, -1.8436, -2.19566, 0, 1, 0.682353, 1,
-0.1725266, -2.468692, -2.899443, 0, 1, 0.6862745, 1,
-0.1717792, 1.288815, -2.090889, 0, 1, 0.6941177, 1,
-0.169166, -0.8114049, -3.84583, 0, 1, 0.7019608, 1,
-0.16644, 0.4087636, -1.408544, 0, 1, 0.7058824, 1,
-0.1642607, -1.870697, -3.084364, 0, 1, 0.7137255, 1,
-0.1637048, -0.8016666, -2.798505, 0, 1, 0.7176471, 1,
-0.157909, -0.12397, -2.470893, 0, 1, 0.7254902, 1,
-0.1553843, 2.261383, 0.7019107, 0, 1, 0.7294118, 1,
-0.1537295, -0.8395239, -1.793713, 0, 1, 0.7372549, 1,
-0.1516879, -0.08371912, -2.145734, 0, 1, 0.7411765, 1,
-0.1491142, 0.04260093, -0.3041361, 0, 1, 0.7490196, 1,
-0.1490047, -1.148709, -2.616489, 0, 1, 0.7529412, 1,
-0.14439, 0.7367988, -0.6741118, 0, 1, 0.7607843, 1,
-0.1415329, -1.150942, -3.258693, 0, 1, 0.7647059, 1,
-0.1401084, 0.4106069, -1.6251, 0, 1, 0.772549, 1,
-0.1391997, -1.050783, -2.254898, 0, 1, 0.7764706, 1,
-0.137186, -0.920241, -4.046887, 0, 1, 0.7843137, 1,
-0.136742, -1.79328, -2.11635, 0, 1, 0.7882353, 1,
-0.1366728, 0.4846084, -1.052944, 0, 1, 0.7960784, 1,
-0.1333005, -0.3859912, -3.327813, 0, 1, 0.8039216, 1,
-0.1246374, 2.175719, -1.322242, 0, 1, 0.8078431, 1,
-0.1237086, -0.3931423, -1.19548, 0, 1, 0.8156863, 1,
-0.1234822, 0.8777873, -0.5149339, 0, 1, 0.8196079, 1,
-0.120912, -0.6039736, -2.846703, 0, 1, 0.827451, 1,
-0.1114226, -1.103171, -0.3031701, 0, 1, 0.8313726, 1,
-0.1113864, 0.1320951, -1.728489, 0, 1, 0.8392157, 1,
-0.1105157, -0.889858, -2.061063, 0, 1, 0.8431373, 1,
-0.1072111, 0.1460775, 0.104775, 0, 1, 0.8509804, 1,
-0.1071529, -0.01851773, -1.167726, 0, 1, 0.854902, 1,
-0.1058748, -0.005690081, -2.290584, 0, 1, 0.8627451, 1,
-0.1038215, 0.5891451, 0.7857326, 0, 1, 0.8666667, 1,
-0.102836, 0.4901934, 1.575099, 0, 1, 0.8745098, 1,
-0.102743, 0.1420894, 0.08649223, 0, 1, 0.8784314, 1,
-0.1014435, -1.431254, -4.355236, 0, 1, 0.8862745, 1,
-0.09774955, -0.5220364, -2.161634, 0, 1, 0.8901961, 1,
-0.09551752, -0.9538748, -2.87627, 0, 1, 0.8980392, 1,
-0.09458718, 1.214569, -0.4849763, 0, 1, 0.9058824, 1,
-0.08870659, -0.7714121, -2.296887, 0, 1, 0.9098039, 1,
-0.0873523, -0.3623366, -3.324909, 0, 1, 0.9176471, 1,
-0.08576335, 1.642679, -1.066036, 0, 1, 0.9215686, 1,
-0.08538038, 0.4635699, -0.1277223, 0, 1, 0.9294118, 1,
-0.08301834, -1.516967, -2.893543, 0, 1, 0.9333333, 1,
-0.08087064, 0.1217122, -1.181957, 0, 1, 0.9411765, 1,
-0.07715338, -1.964443, -3.179593, 0, 1, 0.945098, 1,
-0.07475863, 0.8473526, -0.6182356, 0, 1, 0.9529412, 1,
-0.0740879, 0.3523647, -0.4787331, 0, 1, 0.9568627, 1,
-0.07024916, -1.739159, -5.888511, 0, 1, 0.9647059, 1,
-0.06668568, 0.6976221, 0.5050635, 0, 1, 0.9686275, 1,
-0.06462029, -0.6340955, -3.623841, 0, 1, 0.9764706, 1,
-0.06394853, -0.8336862, -2.917997, 0, 1, 0.9803922, 1,
-0.06347375, 0.0812896, -0.0510236, 0, 1, 0.9882353, 1,
-0.05546874, -1.382413, -4.774155, 0, 1, 0.9921569, 1,
-0.05532776, 0.8931485, -0.3260149, 0, 1, 1, 1,
-0.0543486, 1.208211, -0.9851453, 0, 0.9921569, 1, 1,
-0.05393998, 1.669167, 0.9394696, 0, 0.9882353, 1, 1,
-0.05304352, 1.009253, -1.546784, 0, 0.9803922, 1, 1,
-0.05175815, -0.2142416, -3.216077, 0, 0.9764706, 1, 1,
-0.05116376, -0.03662676, -4.077228, 0, 0.9686275, 1, 1,
-0.05047556, -0.5715231, -2.842006, 0, 0.9647059, 1, 1,
-0.05028992, -1.15967, -2.487216, 0, 0.9568627, 1, 1,
-0.04846565, 1.292649, 0.1516909, 0, 0.9529412, 1, 1,
-0.04323468, -1.365356, -2.326833, 0, 0.945098, 1, 1,
-0.0428418, 0.9699575, -0.3368986, 0, 0.9411765, 1, 1,
-0.04065443, 0.989767, 0.2156773, 0, 0.9333333, 1, 1,
-0.03774426, 0.3961508, -0.673258, 0, 0.9294118, 1, 1,
-0.03402292, -0.9726226, -2.929818, 0, 0.9215686, 1, 1,
-0.02833955, 0.2689831, -1.204318, 0, 0.9176471, 1, 1,
-0.02767362, -0.8819233, -3.616146, 0, 0.9098039, 1, 1,
-0.02366045, -1.563673, -3.596116, 0, 0.9058824, 1, 1,
-0.02261427, 0.1087077, -0.2014982, 0, 0.8980392, 1, 1,
-0.02034443, 2.061703, 0.6519387, 0, 0.8901961, 1, 1,
-0.01929605, 0.825505, -0.8536382, 0, 0.8862745, 1, 1,
-0.01277343, -1.39501, -3.317347, 0, 0.8784314, 1, 1,
-0.01235477, 2.05794, 0.01978851, 0, 0.8745098, 1, 1,
-0.01064612, -1.566938, -3.64304, 0, 0.8666667, 1, 1,
-0.01032962, -1.098857, -2.6705, 0, 0.8627451, 1, 1,
-0.002952666, 0.2830782, -0.8501001, 0, 0.854902, 1, 1,
-0.002597587, 1.421773, 0.5249559, 0, 0.8509804, 1, 1,
-0.001010664, 0.3574479, -0.4610702, 0, 0.8431373, 1, 1,
0.003848496, 1.620518, -0.5466545, 0, 0.8392157, 1, 1,
0.006195159, 1.575115, -0.8313345, 0, 0.8313726, 1, 1,
0.009593611, -0.6368873, 2.144971, 0, 0.827451, 1, 1,
0.01672927, 0.6738442, 1.713465, 0, 0.8196079, 1, 1,
0.0197534, -0.01594585, 0.8892583, 0, 0.8156863, 1, 1,
0.02007508, 2.049138, -1.283325, 0, 0.8078431, 1, 1,
0.02030607, 0.747875, 0.09345642, 0, 0.8039216, 1, 1,
0.0212246, 1.081192, 0.6091034, 0, 0.7960784, 1, 1,
0.02457196, -1.106582, 1.67172, 0, 0.7882353, 1, 1,
0.0264047, -0.06748509, 3.670809, 0, 0.7843137, 1, 1,
0.02866211, -0.59727, 2.722569, 0, 0.7764706, 1, 1,
0.02907937, -0.8312439, 2.425503, 0, 0.772549, 1, 1,
0.03122226, 0.6815822, 1.523325, 0, 0.7647059, 1, 1,
0.03387205, -0.3730949, 3.720829, 0, 0.7607843, 1, 1,
0.0341209, -0.5797131, 2.835457, 0, 0.7529412, 1, 1,
0.03476411, -0.37126, 2.066221, 0, 0.7490196, 1, 1,
0.04403177, 0.1261384, -0.8549849, 0, 0.7411765, 1, 1,
0.04499372, -0.4368176, 3.213074, 0, 0.7372549, 1, 1,
0.04504487, 0.5916729, -0.3363667, 0, 0.7294118, 1, 1,
0.04775918, -0.3634027, 4.200263, 0, 0.7254902, 1, 1,
0.04843609, 0.2290544, -0.8052893, 0, 0.7176471, 1, 1,
0.04989162, -0.5907702, 2.583562, 0, 0.7137255, 1, 1,
0.05080566, 0.2767718, -2.079463, 0, 0.7058824, 1, 1,
0.05277993, -0.02126717, 1.848113, 0, 0.6980392, 1, 1,
0.05345674, -1.286414, 3.209734, 0, 0.6941177, 1, 1,
0.05349841, -0.6070474, 3.522231, 0, 0.6862745, 1, 1,
0.05434331, 0.01794066, 1.912211, 0, 0.682353, 1, 1,
0.05789526, 1.811556, -0.9820207, 0, 0.6745098, 1, 1,
0.07214667, 0.7991181, -0.07930632, 0, 0.6705883, 1, 1,
0.07666138, 0.689234, -0.5125229, 0, 0.6627451, 1, 1,
0.07815238, -0.7406884, 1.063325, 0, 0.6588235, 1, 1,
0.0812917, -0.3009141, 4.908132, 0, 0.6509804, 1, 1,
0.08160572, -0.4985443, 2.750463, 0, 0.6470588, 1, 1,
0.08175541, -1.150033, 3.298076, 0, 0.6392157, 1, 1,
0.08581613, 1.672717, -1.292927, 0, 0.6352941, 1, 1,
0.08988425, 0.8827962, 1.750587, 0, 0.627451, 1, 1,
0.09026998, -1.599627, 2.39053, 0, 0.6235294, 1, 1,
0.090813, -1.877812, 4.393822, 0, 0.6156863, 1, 1,
0.09464766, 1.076621, -0.04412823, 0, 0.6117647, 1, 1,
0.0956279, -0.2099333, 2.316607, 0, 0.6039216, 1, 1,
0.1040749, 1.531806, 0.3333704, 0, 0.5960785, 1, 1,
0.1059195, 0.7255858, -0.5889034, 0, 0.5921569, 1, 1,
0.1194024, -1.664838, 1.725502, 0, 0.5843138, 1, 1,
0.1217836, -0.07334866, 1.738213, 0, 0.5803922, 1, 1,
0.1223359, -0.3290596, 2.57197, 0, 0.572549, 1, 1,
0.1232085, 1.36382, -0.3365466, 0, 0.5686275, 1, 1,
0.1258071, -1.530816, 1.7602, 0, 0.5607843, 1, 1,
0.1280447, 0.08910285, 1.360055, 0, 0.5568628, 1, 1,
0.1297407, 0.8780491, 0.1588473, 0, 0.5490196, 1, 1,
0.1335928, 0.3289271, -0.6088322, 0, 0.5450981, 1, 1,
0.1343974, -0.4869516, 3.389702, 0, 0.5372549, 1, 1,
0.1344279, 1.502333, -1.320717, 0, 0.5333334, 1, 1,
0.136947, 0.4445718, -0.568066, 0, 0.5254902, 1, 1,
0.1397572, 1.937585, 0.6625823, 0, 0.5215687, 1, 1,
0.1410175, -0.1627229, 1.448445, 0, 0.5137255, 1, 1,
0.1456333, -0.6021432, 2.776954, 0, 0.509804, 1, 1,
0.1458224, -1.72547, 1.376258, 0, 0.5019608, 1, 1,
0.1466615, 1.716565, -0.3642476, 0, 0.4941176, 1, 1,
0.147547, -0.9105209, 1.60589, 0, 0.4901961, 1, 1,
0.1495024, 0.3033734, 0.904682, 0, 0.4823529, 1, 1,
0.1514896, -1.082699, 3.673283, 0, 0.4784314, 1, 1,
0.1527001, 0.09468084, -0.9130393, 0, 0.4705882, 1, 1,
0.1535927, 0.5907221, 1.888941, 0, 0.4666667, 1, 1,
0.1605969, -1.218248, 2.923493, 0, 0.4588235, 1, 1,
0.1614841, 0.06191187, 0.5623813, 0, 0.454902, 1, 1,
0.1642959, 2.133202, 3.112952, 0, 0.4470588, 1, 1,
0.1701547, -0.9138721, 1.666835, 0, 0.4431373, 1, 1,
0.1705877, 0.1598709, 0.5602869, 0, 0.4352941, 1, 1,
0.1724883, 1.319042, -0.2230065, 0, 0.4313726, 1, 1,
0.173368, -1.167902, 4.782459, 0, 0.4235294, 1, 1,
0.1744937, -1.753994, 2.143868, 0, 0.4196078, 1, 1,
0.178085, -0.4082066, 3.149399, 0, 0.4117647, 1, 1,
0.1789863, -0.2895102, 1.996518, 0, 0.4078431, 1, 1,
0.1828973, 0.1824754, 1.520776, 0, 0.4, 1, 1,
0.1834576, 0.7875849, 2.134398, 0, 0.3921569, 1, 1,
0.188798, 0.6725518, 0.5370754, 0, 0.3882353, 1, 1,
0.193966, 0.9739039, 0.1223861, 0, 0.3803922, 1, 1,
0.1946937, -0.677048, 3.215459, 0, 0.3764706, 1, 1,
0.1981769, -0.7214726, 3.424857, 0, 0.3686275, 1, 1,
0.1994291, -0.1686522, 2.190395, 0, 0.3647059, 1, 1,
0.2104725, 0.2836808, 0.6617679, 0, 0.3568628, 1, 1,
0.2136046, 0.3097023, 1.959522, 0, 0.3529412, 1, 1,
0.215954, 1.262408, 2.01508, 0, 0.345098, 1, 1,
0.2220244, 1.364393, 0.08848464, 0, 0.3411765, 1, 1,
0.2236967, -0.38315, 2.561799, 0, 0.3333333, 1, 1,
0.2268172, 1.115093, -0.7842825, 0, 0.3294118, 1, 1,
0.227352, -0.6675726, 2.349089, 0, 0.3215686, 1, 1,
0.2280022, 1.66604, 0.166789, 0, 0.3176471, 1, 1,
0.2288518, 2.359303, -1.00796, 0, 0.3098039, 1, 1,
0.2301361, 0.7439766, 0.7423198, 0, 0.3058824, 1, 1,
0.2327892, -0.5246671, 2.638611, 0, 0.2980392, 1, 1,
0.2341157, -0.180685, 1.411296, 0, 0.2901961, 1, 1,
0.2405296, -0.3546046, 1.038468, 0, 0.2862745, 1, 1,
0.2444687, 0.6964257, -0.2253445, 0, 0.2784314, 1, 1,
0.2460623, 0.3885255, 1.225094, 0, 0.2745098, 1, 1,
0.2483659, 0.7482179, -0.2057342, 0, 0.2666667, 1, 1,
0.2491495, 0.196064, 0.4254658, 0, 0.2627451, 1, 1,
0.2533398, 2.047141, 2.35484, 0, 0.254902, 1, 1,
0.2568886, -0.1419025, 2.113428, 0, 0.2509804, 1, 1,
0.2640638, -0.3937563, 1.695099, 0, 0.2431373, 1, 1,
0.2718269, -0.6050608, 3.066012, 0, 0.2392157, 1, 1,
0.2769162, 0.01072542, 1.390082, 0, 0.2313726, 1, 1,
0.2783601, -1.466714, 2.42445, 0, 0.227451, 1, 1,
0.2798625, -0.07117691, 1.189002, 0, 0.2196078, 1, 1,
0.2822559, -1.075886, 2.167304, 0, 0.2156863, 1, 1,
0.2839184, 0.2218106, 0.7068781, 0, 0.2078431, 1, 1,
0.2876598, -1.466658, 2.109487, 0, 0.2039216, 1, 1,
0.2887716, 0.4472973, 1.458097, 0, 0.1960784, 1, 1,
0.2957667, -2.032506, 5.049139, 0, 0.1882353, 1, 1,
0.298692, -1.399052, 0.4778608, 0, 0.1843137, 1, 1,
0.3036325, -0.07679747, 2.593713, 0, 0.1764706, 1, 1,
0.3094057, -0.4472436, 3.73569, 0, 0.172549, 1, 1,
0.3128094, 0.9951199, -0.7015756, 0, 0.1647059, 1, 1,
0.3174238, -0.597244, 1.462918, 0, 0.1607843, 1, 1,
0.3182545, -1.609556, 4.082548, 0, 0.1529412, 1, 1,
0.3198977, -1.857306, 4.088698, 0, 0.1490196, 1, 1,
0.3216988, -0.3532389, 2.576952, 0, 0.1411765, 1, 1,
0.3304842, -1.647017, 2.510691, 0, 0.1372549, 1, 1,
0.332527, 1.098708, -0.2571841, 0, 0.1294118, 1, 1,
0.3374255, 1.361241, 0.4695578, 0, 0.1254902, 1, 1,
0.3386078, -0.01358628, 0.5253844, 0, 0.1176471, 1, 1,
0.3442044, 1.036024, 1.241838, 0, 0.1137255, 1, 1,
0.3451741, -0.4150951, 1.696106, 0, 0.1058824, 1, 1,
0.3455704, 0.8653246, -0.4814366, 0, 0.09803922, 1, 1,
0.3466935, 0.299463, 0.1953021, 0, 0.09411765, 1, 1,
0.3473943, 0.5029327, 0.6393921, 0, 0.08627451, 1, 1,
0.3503288, 1.566806, -0.4377903, 0, 0.08235294, 1, 1,
0.3512402, -0.0426368, 0.5968051, 0, 0.07450981, 1, 1,
0.3550867, 0.3741058, -0.2018146, 0, 0.07058824, 1, 1,
0.3571584, 0.2850654, 1.795437, 0, 0.0627451, 1, 1,
0.3600325, -0.5241106, 1.907163, 0, 0.05882353, 1, 1,
0.3715602, -0.1550925, 1.274455, 0, 0.05098039, 1, 1,
0.3751757, 0.2305476, 0.7430694, 0, 0.04705882, 1, 1,
0.3804062, -1.240228, 2.859701, 0, 0.03921569, 1, 1,
0.3821872, -0.371132, 2.442814, 0, 0.03529412, 1, 1,
0.3830804, 1.168068, -1.461876, 0, 0.02745098, 1, 1,
0.3909441, 0.7894517, 1.203827, 0, 0.02352941, 1, 1,
0.398048, 0.2623576, 0.2973172, 0, 0.01568628, 1, 1,
0.3986369, -0.08044609, -0.1135604, 0, 0.01176471, 1, 1,
0.4044039, 1.435307, 0.1526736, 0, 0.003921569, 1, 1,
0.4082934, -0.3601894, 3.307533, 0.003921569, 0, 1, 1,
0.409485, 0.6788231, -0.307819, 0.007843138, 0, 1, 1,
0.4098676, 1.814736, -0.2489571, 0.01568628, 0, 1, 1,
0.4107794, 0.8133206, 1.068886, 0.01960784, 0, 1, 1,
0.4153779, 1.538028, -0.9216714, 0.02745098, 0, 1, 1,
0.4193021, 1.115083, 1.519741, 0.03137255, 0, 1, 1,
0.4219722, 0.2433594, 0.4556839, 0.03921569, 0, 1, 1,
0.4248864, -1.086615, 2.122323, 0.04313726, 0, 1, 1,
0.4271376, -1.360535, 0.9869227, 0.05098039, 0, 1, 1,
0.4370928, 0.2419476, 1.883259, 0.05490196, 0, 1, 1,
0.4378596, 1.389103, 0.7698559, 0.0627451, 0, 1, 1,
0.4426317, -0.3093275, 1.433324, 0.06666667, 0, 1, 1,
0.4443662, -0.4019141, 1.956921, 0.07450981, 0, 1, 1,
0.4520663, 0.4249207, -0.5405471, 0.07843138, 0, 1, 1,
0.4520788, -1.336778, 1.334115, 0.08627451, 0, 1, 1,
0.4547772, 0.01659658, 1.311397, 0.09019608, 0, 1, 1,
0.456131, 0.5912861, 0.9884229, 0.09803922, 0, 1, 1,
0.4641895, -1.744725, 4.083396, 0.1058824, 0, 1, 1,
0.4780024, 1.725307, 0.1766848, 0.1098039, 0, 1, 1,
0.4834726, -1.008465, 1.330176, 0.1176471, 0, 1, 1,
0.4842323, -0.2207358, 2.737944, 0.1215686, 0, 1, 1,
0.4911015, 0.9100843, 0.1880044, 0.1294118, 0, 1, 1,
0.492478, 1.173118, -0.3787749, 0.1333333, 0, 1, 1,
0.4956875, 1.012043, -0.6861059, 0.1411765, 0, 1, 1,
0.4995312, 1.425263, -0.3200072, 0.145098, 0, 1, 1,
0.5010128, 0.7397794, 1.322454, 0.1529412, 0, 1, 1,
0.5043561, -0.2489393, 2.276292, 0.1568628, 0, 1, 1,
0.5045324, 0.2643831, 1.907891, 0.1647059, 0, 1, 1,
0.5058988, 1.023981, 0.4107742, 0.1686275, 0, 1, 1,
0.5092816, -0.4459346, 2.972781, 0.1764706, 0, 1, 1,
0.5113037, -1.157236, 1.879419, 0.1803922, 0, 1, 1,
0.5116901, -0.9041138, 4.187668, 0.1882353, 0, 1, 1,
0.5129404, -0.5999117, 2.871962, 0.1921569, 0, 1, 1,
0.516087, -1.632429, 3.62874, 0.2, 0, 1, 1,
0.5203214, -1.299922, 2.023264, 0.2078431, 0, 1, 1,
0.5236771, -0.08199273, 0.8003244, 0.2117647, 0, 1, 1,
0.5263739, -1.036957, 2.43391, 0.2196078, 0, 1, 1,
0.5264319, -0.6967602, 3.297741, 0.2235294, 0, 1, 1,
0.5275607, -0.4370764, 2.254936, 0.2313726, 0, 1, 1,
0.5294238, -1.007297, 2.757861, 0.2352941, 0, 1, 1,
0.5294974, -0.8901803, 2.472456, 0.2431373, 0, 1, 1,
0.5296003, -0.3045333, 2.270014, 0.2470588, 0, 1, 1,
0.5301453, 1.901423, -0.07482373, 0.254902, 0, 1, 1,
0.533315, 0.3196619, 1.684148, 0.2588235, 0, 1, 1,
0.5382043, 0.6541911, 0.9675978, 0.2666667, 0, 1, 1,
0.5409734, 0.316412, -0.1944425, 0.2705882, 0, 1, 1,
0.5524844, -1.166014, 3.478036, 0.2784314, 0, 1, 1,
0.558956, -0.3365988, 2.281965, 0.282353, 0, 1, 1,
0.5602381, 0.4348223, 1.062366, 0.2901961, 0, 1, 1,
0.5607891, 0.683558, -0.6281736, 0.2941177, 0, 1, 1,
0.5658128, -1.102859, 1.677931, 0.3019608, 0, 1, 1,
0.5712763, 0.5378496, -0.2035247, 0.3098039, 0, 1, 1,
0.5720433, 0.1729172, 1.459098, 0.3137255, 0, 1, 1,
0.576142, 0.4163787, 0.5963013, 0.3215686, 0, 1, 1,
0.5785636, 0.01545943, 3.09594, 0.3254902, 0, 1, 1,
0.5810884, 0.7401872, 0.5080221, 0.3333333, 0, 1, 1,
0.5827431, -0.6581904, 4.221077, 0.3372549, 0, 1, 1,
0.5838856, -0.1240756, 2.45357, 0.345098, 0, 1, 1,
0.5876025, 1.724019, 1.865632, 0.3490196, 0, 1, 1,
0.5886882, 1.040859, 0.6280137, 0.3568628, 0, 1, 1,
0.5902165, 0.1504787, 3.114665, 0.3607843, 0, 1, 1,
0.5972985, -0.1234284, 2.798159, 0.3686275, 0, 1, 1,
0.5973592, 0.8043385, 1.976786, 0.372549, 0, 1, 1,
0.5974209, 1.53321, -0.5326105, 0.3803922, 0, 1, 1,
0.5980762, -0.08938833, 2.995097, 0.3843137, 0, 1, 1,
0.598499, -0.07052619, 1.967797, 0.3921569, 0, 1, 1,
0.6010921, -1.371587, 2.870165, 0.3960784, 0, 1, 1,
0.6014536, -1.676602, 3.653636, 0.4039216, 0, 1, 1,
0.604179, 0.8984403, 0.1082384, 0.4117647, 0, 1, 1,
0.6043941, -0.6502793, 0.6512069, 0.4156863, 0, 1, 1,
0.6057708, 0.4512264, -0.4267607, 0.4235294, 0, 1, 1,
0.6090679, -0.7071404, 2.523958, 0.427451, 0, 1, 1,
0.6135358, 0.2267113, 2.124381, 0.4352941, 0, 1, 1,
0.6200866, -1.332408, 2.66113, 0.4392157, 0, 1, 1,
0.6212828, 1.594493, -0.8402407, 0.4470588, 0, 1, 1,
0.6237916, -0.3709414, 0.9986721, 0.4509804, 0, 1, 1,
0.6247788, -0.7030199, 3.075533, 0.4588235, 0, 1, 1,
0.6292921, -1.547734, 2.473396, 0.4627451, 0, 1, 1,
0.6293377, -0.02922777, 0.4262537, 0.4705882, 0, 1, 1,
0.6318923, -0.2549083, 2.658844, 0.4745098, 0, 1, 1,
0.634359, -0.2433586, 3.015762, 0.4823529, 0, 1, 1,
0.6501644, 0.3385441, 1.624817, 0.4862745, 0, 1, 1,
0.6559401, -2.012655, 4.350357, 0.4941176, 0, 1, 1,
0.6559618, 0.2994694, 1.423539, 0.5019608, 0, 1, 1,
0.6642357, -0.9895576, 3.556626, 0.5058824, 0, 1, 1,
0.6661065, -0.5511366, 1.572249, 0.5137255, 0, 1, 1,
0.6683362, 0.03091643, 1.168043, 0.5176471, 0, 1, 1,
0.6697934, -0.7281835, 1.318774, 0.5254902, 0, 1, 1,
0.6700611, 0.01707937, 1.143631, 0.5294118, 0, 1, 1,
0.6719922, 0.1008735, 2.234642, 0.5372549, 0, 1, 1,
0.6723487, 1.2566, 2.651547, 0.5411765, 0, 1, 1,
0.6724785, -0.5141041, 4.068513, 0.5490196, 0, 1, 1,
0.6736048, -0.4496701, 2.463214, 0.5529412, 0, 1, 1,
0.6739269, -0.05530913, 1.347933, 0.5607843, 0, 1, 1,
0.6768913, 1.147794, -1.423307, 0.5647059, 0, 1, 1,
0.6793581, 0.6610532, 0.4680378, 0.572549, 0, 1, 1,
0.68334, 1.178364, 1.612856, 0.5764706, 0, 1, 1,
0.6871937, -1.690846, 3.095716, 0.5843138, 0, 1, 1,
0.6945082, -0.3475295, 1.970543, 0.5882353, 0, 1, 1,
0.6966504, -0.6742067, 0.7068865, 0.5960785, 0, 1, 1,
0.6978139, 1.517005, 0.6422236, 0.6039216, 0, 1, 1,
0.7072605, -0.08219054, 2.419735, 0.6078432, 0, 1, 1,
0.7134022, 0.777231, 1.986647, 0.6156863, 0, 1, 1,
0.7156525, 0.4306819, 0.3335975, 0.6196079, 0, 1, 1,
0.717539, -0.007839816, 1.735799, 0.627451, 0, 1, 1,
0.7183498, 0.2574357, 2.63395, 0.6313726, 0, 1, 1,
0.7243434, -2.042754, 2.532374, 0.6392157, 0, 1, 1,
0.7312627, 0.6673133, 2.399958, 0.6431373, 0, 1, 1,
0.7354429, 0.3875883, 1.243075, 0.6509804, 0, 1, 1,
0.7412776, -0.9396286, 2.510535, 0.654902, 0, 1, 1,
0.7434614, -0.1232262, 2.31848, 0.6627451, 0, 1, 1,
0.7440938, 0.8332535, -0.02454121, 0.6666667, 0, 1, 1,
0.74452, 1.11502, 1.619704, 0.6745098, 0, 1, 1,
0.7530771, 0.4636725, 0.9466397, 0.6784314, 0, 1, 1,
0.7533869, -0.03649085, 3.067436, 0.6862745, 0, 1, 1,
0.7546834, 1.490265, -0.840348, 0.6901961, 0, 1, 1,
0.7612558, -0.2473938, 1.154679, 0.6980392, 0, 1, 1,
0.7634988, 0.3976283, 1.511447, 0.7058824, 0, 1, 1,
0.7720704, 1.956721, 1.001717, 0.7098039, 0, 1, 1,
0.7736093, -0.3509177, 2.848408, 0.7176471, 0, 1, 1,
0.7750521, 0.2963805, 0.7572922, 0.7215686, 0, 1, 1,
0.7825809, -1.146766, 2.46709, 0.7294118, 0, 1, 1,
0.7897983, -0.2392033, 1.367461, 0.7333333, 0, 1, 1,
0.7919231, -1.461062, 3.573063, 0.7411765, 0, 1, 1,
0.7931437, -0.5385067, 1.854277, 0.7450981, 0, 1, 1,
0.7972614, -2.636665, 4.299793, 0.7529412, 0, 1, 1,
0.8216202, 0.6905315, 2.149885, 0.7568628, 0, 1, 1,
0.8242772, 0.8372506, 1.61143, 0.7647059, 0, 1, 1,
0.8259091, -0.5301523, 2.17362, 0.7686275, 0, 1, 1,
0.8288251, -0.2215926, 2.858206, 0.7764706, 0, 1, 1,
0.8318735, 1.747586, 0.6402514, 0.7803922, 0, 1, 1,
0.8350891, 0.156611, 2.537376, 0.7882353, 0, 1, 1,
0.8506793, -0.8650606, 2.600559, 0.7921569, 0, 1, 1,
0.8511575, -0.926283, 1.599, 0.8, 0, 1, 1,
0.8517011, 0.4797707, 1.105821, 0.8078431, 0, 1, 1,
0.8525939, 0.8773762, 1.598798, 0.8117647, 0, 1, 1,
0.8548316, -0.499145, 3.537072, 0.8196079, 0, 1, 1,
0.8590268, 1.039589, 0.8731721, 0.8235294, 0, 1, 1,
0.8593031, 0.08171429, 1.036356, 0.8313726, 0, 1, 1,
0.8779133, 0.607911, 1.199163, 0.8352941, 0, 1, 1,
0.8783351, 0.09012407, 1.456281, 0.8431373, 0, 1, 1,
0.8797281, 0.3113198, 1.569824, 0.8470588, 0, 1, 1,
0.8801808, 0.3054343, 0.1824141, 0.854902, 0, 1, 1,
0.8812472, -0.6622673, 2.780721, 0.8588235, 0, 1, 1,
0.8832485, -0.2369688, 3.868702, 0.8666667, 0, 1, 1,
0.8840215, 1.323056, 1.78353, 0.8705882, 0, 1, 1,
0.8844468, -0.103299, 0.5046754, 0.8784314, 0, 1, 1,
0.8876062, 0.3122469, 3.06291, 0.8823529, 0, 1, 1,
0.8893065, 2.24007, -0.05183284, 0.8901961, 0, 1, 1,
0.8932388, -0.3625666, 3.367637, 0.8941177, 0, 1, 1,
0.8972107, -0.1547659, 2.004624, 0.9019608, 0, 1, 1,
0.8995481, -0.9041705, 3.304881, 0.9098039, 0, 1, 1,
0.9045498, -0.0905287, 1.543626, 0.9137255, 0, 1, 1,
0.9095274, -1.556453, 1.664241, 0.9215686, 0, 1, 1,
0.9097112, 0.4100418, 1.169722, 0.9254902, 0, 1, 1,
0.917833, -0.05891399, 1.860743, 0.9333333, 0, 1, 1,
0.9194027, -0.2097179, 1.05316, 0.9372549, 0, 1, 1,
0.9225355, 1.82849, -0.5722243, 0.945098, 0, 1, 1,
0.925452, 0.4418053, 3.119542, 0.9490196, 0, 1, 1,
0.9261013, 1.667498, 1.691092, 0.9568627, 0, 1, 1,
0.9274324, -0.5874554, 3.104512, 0.9607843, 0, 1, 1,
0.9290408, -0.6976399, 4.108501, 0.9686275, 0, 1, 1,
0.9323972, 0.0121459, 3.171467, 0.972549, 0, 1, 1,
0.9348761, -0.4093625, 1.108209, 0.9803922, 0, 1, 1,
0.9351866, -0.2788642, 1.997213, 0.9843137, 0, 1, 1,
0.9391806, 1.683658, 2.088805, 0.9921569, 0, 1, 1,
0.9461679, 0.409334, -0.3768646, 0.9960784, 0, 1, 1,
0.9464838, -1.190064, 2.850181, 1, 0, 0.9960784, 1,
0.9485884, -1.504806, 2.025394, 1, 0, 0.9882353, 1,
0.9744039, -0.2415814, 2.17731, 1, 0, 0.9843137, 1,
0.975433, -0.9497277, 1.637746, 1, 0, 0.9764706, 1,
0.9850773, 0.2982998, -0.2897027, 1, 0, 0.972549, 1,
0.9870465, 1.298307, 0.8024926, 1, 0, 0.9647059, 1,
0.9874591, 0.2703153, -0.1311294, 1, 0, 0.9607843, 1,
0.9913946, -0.9469634, 1.65711, 1, 0, 0.9529412, 1,
0.9930761, -0.04507186, -0.1784882, 1, 0, 0.9490196, 1,
0.9939113, -2.25714, 3.820697, 1, 0, 0.9411765, 1,
0.9957507, 1.194941, 1.003216, 1, 0, 0.9372549, 1,
1.000247, 0.3320158, 1.082885, 1, 0, 0.9294118, 1,
1.000739, -0.4563303, 2.330485, 1, 0, 0.9254902, 1,
1.004789, 0.4408514, 1.734547, 1, 0, 0.9176471, 1,
1.005054, -0.9892427, 1.467008, 1, 0, 0.9137255, 1,
1.015547, -0.250956, 0.4409129, 1, 0, 0.9058824, 1,
1.016404, 1.497568, 0.2792232, 1, 0, 0.9019608, 1,
1.02057, -1.036435, 2.430663, 1, 0, 0.8941177, 1,
1.02265, -1.152292, 2.221786, 1, 0, 0.8862745, 1,
1.0229, -1.671707, 3.731224, 1, 0, 0.8823529, 1,
1.025865, -2.053394, 2.412079, 1, 0, 0.8745098, 1,
1.033852, 0.5591094, 1.629531, 1, 0, 0.8705882, 1,
1.041418, -0.3457603, 2.349538, 1, 0, 0.8627451, 1,
1.043852, -0.9240246, 0.2286486, 1, 0, 0.8588235, 1,
1.046818, -0.5022662, 2.174623, 1, 0, 0.8509804, 1,
1.048072, 0.4694208, 1.906026, 1, 0, 0.8470588, 1,
1.049585, -0.07111242, 3.865342, 1, 0, 0.8392157, 1,
1.051433, 0.9221998, -1.201329, 1, 0, 0.8352941, 1,
1.052148, -0.4279498, 2.832779, 1, 0, 0.827451, 1,
1.052603, 1.041613, -1.46963, 1, 0, 0.8235294, 1,
1.055969, 0.5247071, -0.1546596, 1, 0, 0.8156863, 1,
1.07082, 0.03273995, 0.8429655, 1, 0, 0.8117647, 1,
1.077861, -1.21413, 2.531227, 1, 0, 0.8039216, 1,
1.078526, 0.0684547, 1.518574, 1, 0, 0.7960784, 1,
1.081744, 0.995531, 0.9682888, 1, 0, 0.7921569, 1,
1.087646, 0.149252, 1.720823, 1, 0, 0.7843137, 1,
1.092832, 1.787899, 0.4853183, 1, 0, 0.7803922, 1,
1.094947, -0.06499649, 2.380386, 1, 0, 0.772549, 1,
1.09567, -0.1203833, -0.146892, 1, 0, 0.7686275, 1,
1.100723, -1.344249, 4.061022, 1, 0, 0.7607843, 1,
1.111966, -0.7855268, 1.36893, 1, 0, 0.7568628, 1,
1.116474, -1.03335, 3.015516, 1, 0, 0.7490196, 1,
1.120026, 0.5831358, 1.010387, 1, 0, 0.7450981, 1,
1.122067, -1.216184, 3.170664, 1, 0, 0.7372549, 1,
1.124899, 0.01694127, 1.556501, 1, 0, 0.7333333, 1,
1.124937, 1.398098, 0.949272, 1, 0, 0.7254902, 1,
1.127618, -2.123994, 1.028659, 1, 0, 0.7215686, 1,
1.12913, -0.01288678, 1.385122, 1, 0, 0.7137255, 1,
1.132246, -1.023722, 2.553021, 1, 0, 0.7098039, 1,
1.13239, 0.6876842, 1.943869, 1, 0, 0.7019608, 1,
1.136265, -2.001176, 2.902229, 1, 0, 0.6941177, 1,
1.137283, 0.4402308, 1.404, 1, 0, 0.6901961, 1,
1.151266, -1.478019, 1.756003, 1, 0, 0.682353, 1,
1.153637, 0.36837, 0.1936454, 1, 0, 0.6784314, 1,
1.156528, 0.4231083, 2.329618, 1, 0, 0.6705883, 1,
1.157286, 1.397781, 0.4558985, 1, 0, 0.6666667, 1,
1.158774, -2.632714, 2.803921, 1, 0, 0.6588235, 1,
1.180362, 0.7696213, 0.1945078, 1, 0, 0.654902, 1,
1.186334, -0.6981437, 1.036236, 1, 0, 0.6470588, 1,
1.190598, 0.5560785, 2.783496, 1, 0, 0.6431373, 1,
1.194513, 0.1420005, -0.7344496, 1, 0, 0.6352941, 1,
1.194901, 0.1231807, 0.7976384, 1, 0, 0.6313726, 1,
1.220521, -0.4028853, 2.191176, 1, 0, 0.6235294, 1,
1.225026, 1.098242, 2.097259, 1, 0, 0.6196079, 1,
1.23231, -0.3181446, 1.098126, 1, 0, 0.6117647, 1,
1.234889, 0.005948327, 0.7195285, 1, 0, 0.6078432, 1,
1.243642, -1.42397, 3.828577, 1, 0, 0.6, 1,
1.253499, 1.807509, 0.1238654, 1, 0, 0.5921569, 1,
1.258782, 0.1219544, 2.344885, 1, 0, 0.5882353, 1,
1.264167, -0.9136867, 2.235875, 1, 0, 0.5803922, 1,
1.265859, 0.5973185, -0.1963999, 1, 0, 0.5764706, 1,
1.26741, 0.9121678, 0.05036775, 1, 0, 0.5686275, 1,
1.269708, 0.2158121, 0.4457957, 1, 0, 0.5647059, 1,
1.272208, 1.444039, 0.6511909, 1, 0, 0.5568628, 1,
1.275685, 0.7481355, 0.597433, 1, 0, 0.5529412, 1,
1.276326, 0.3589775, -0.3454522, 1, 0, 0.5450981, 1,
1.281424, -0.1064033, -0.7448034, 1, 0, 0.5411765, 1,
1.283707, 1.090645, -0.5922841, 1, 0, 0.5333334, 1,
1.289, 0.2834558, 1.399775, 1, 0, 0.5294118, 1,
1.290169, 0.8108283, 1.066317, 1, 0, 0.5215687, 1,
1.309186, -0.4095061, 0.4899019, 1, 0, 0.5176471, 1,
1.314736, -0.1108681, -1.080658, 1, 0, 0.509804, 1,
1.346346, -1.637615, 4.417459, 1, 0, 0.5058824, 1,
1.351519, -0.7471666, 3.257051, 1, 0, 0.4980392, 1,
1.352806, -0.918862, 3.02995, 1, 0, 0.4901961, 1,
1.360615, -1.399034, 1.9169, 1, 0, 0.4862745, 1,
1.36127, -1.865219, 2.855426, 1, 0, 0.4784314, 1,
1.362411, -1.596487, 2.823514, 1, 0, 0.4745098, 1,
1.368603, -0.5862408, 0.991621, 1, 0, 0.4666667, 1,
1.380639, 0.5447044, 1.632521, 1, 0, 0.4627451, 1,
1.386621, 2.799749, -0.1401784, 1, 0, 0.454902, 1,
1.396448, -0.01555934, 1.371077, 1, 0, 0.4509804, 1,
1.397233, -1.386196, 3.841173, 1, 0, 0.4431373, 1,
1.397311, 0.834284, -0.3416867, 1, 0, 0.4392157, 1,
1.41455, 0.8539943, 1.9694, 1, 0, 0.4313726, 1,
1.415999, -1.865505, 2.905613, 1, 0, 0.427451, 1,
1.424383, 1.410556, 0.7381501, 1, 0, 0.4196078, 1,
1.430048, 0.219367, 0.7099089, 1, 0, 0.4156863, 1,
1.434851, 1.338966, 1.203867, 1, 0, 0.4078431, 1,
1.436337, 0.8302793, 1.676798, 1, 0, 0.4039216, 1,
1.446109, -0.3684284, 0.2891778, 1, 0, 0.3960784, 1,
1.452668, 0.8947135, 1.05621, 1, 0, 0.3882353, 1,
1.45491, -1.646842, 2.192583, 1, 0, 0.3843137, 1,
1.456801, -0.8851461, 2.994669, 1, 0, 0.3764706, 1,
1.468872, 0.902305, 0.7646464, 1, 0, 0.372549, 1,
1.473942, -1.645616, 4.035788, 1, 0, 0.3647059, 1,
1.47474, -0.6023986, 2.136528, 1, 0, 0.3607843, 1,
1.477559, 0.3388633, 1.806963, 1, 0, 0.3529412, 1,
1.484026, -0.7025078, 2.023814, 1, 0, 0.3490196, 1,
1.484166, -0.249688, 1.754191, 1, 0, 0.3411765, 1,
1.502953, 1.355673, 2.861245, 1, 0, 0.3372549, 1,
1.511448, -0.4149699, 2.580351, 1, 0, 0.3294118, 1,
1.53355, -0.4140301, 1.199028, 1, 0, 0.3254902, 1,
1.54143, -0.5686778, 2.300532, 1, 0, 0.3176471, 1,
1.542674, 1.346794, -0.7069072, 1, 0, 0.3137255, 1,
1.555175, -2.602983, 1.870987, 1, 0, 0.3058824, 1,
1.55732, -0.2296027, 3.425796, 1, 0, 0.2980392, 1,
1.564449, -0.7560239, 2.440646, 1, 0, 0.2941177, 1,
1.607095, -1.181406, 2.863941, 1, 0, 0.2862745, 1,
1.616265, -0.906123, 2.224054, 1, 0, 0.282353, 1,
1.618549, 0.7984479, 1.384238, 1, 0, 0.2745098, 1,
1.618852, 1.278622, 1.336787, 1, 0, 0.2705882, 1,
1.620088, -1.136159, 2.944062, 1, 0, 0.2627451, 1,
1.620792, 0.9896941, 0.5631772, 1, 0, 0.2588235, 1,
1.656358, 1.652303, 1.408615, 1, 0, 0.2509804, 1,
1.671883, -0.1890617, 1.879376, 1, 0, 0.2470588, 1,
1.671983, 0.3935944, 1.95774, 1, 0, 0.2392157, 1,
1.675891, 1.442828, 3.109643, 1, 0, 0.2352941, 1,
1.678069, 0.2152331, 0.2133036, 1, 0, 0.227451, 1,
1.685968, -0.5700461, 2.125561, 1, 0, 0.2235294, 1,
1.686311, -0.6715349, 1.802735, 1, 0, 0.2156863, 1,
1.708637, 0.4403926, 2.106831, 1, 0, 0.2117647, 1,
1.721481, -1.783972, 3.441929, 1, 0, 0.2039216, 1,
1.734396, -1.286746, 2.965787, 1, 0, 0.1960784, 1,
1.736913, 1.315501, 0.722719, 1, 0, 0.1921569, 1,
1.769109, -1.057117, 1.494555, 1, 0, 0.1843137, 1,
1.788297, 1.152267, 1.170553, 1, 0, 0.1803922, 1,
1.793931, -0.2425085, 0.3483353, 1, 0, 0.172549, 1,
1.805989, -1.410942, -0.7985438, 1, 0, 0.1686275, 1,
1.808657, 1.114255, 0.4831104, 1, 0, 0.1607843, 1,
1.812491, -0.8202788, 1.690102, 1, 0, 0.1568628, 1,
1.848006, -0.6406567, 3.09964, 1, 0, 0.1490196, 1,
1.849878, 0.5187149, 1.289868, 1, 0, 0.145098, 1,
1.863345, 0.05449901, 1.290629, 1, 0, 0.1372549, 1,
1.865765, 0.1202469, 2.896442, 1, 0, 0.1333333, 1,
1.90273, -1.155098, 3.174825, 1, 0, 0.1254902, 1,
1.916693, 0.1505178, 0.211273, 1, 0, 0.1215686, 1,
1.921154, 0.513467, 1.308072, 1, 0, 0.1137255, 1,
1.921824, 0.1524822, 1.534511, 1, 0, 0.1098039, 1,
1.943848, -0.4003506, 2.498325, 1, 0, 0.1019608, 1,
1.967626, 1.713766, -0.6581287, 1, 0, 0.09411765, 1,
1.982716, 0.9736625, 3.805658, 1, 0, 0.09019608, 1,
2.008658, -1.76854, 2.767825, 1, 0, 0.08235294, 1,
2.0238, -1.962492, 3.801576, 1, 0, 0.07843138, 1,
2.03595, 0.4246118, 1.698878, 1, 0, 0.07058824, 1,
2.037134, 0.03059268, 2.698558, 1, 0, 0.06666667, 1,
2.081542, -1.866013, 1.914558, 1, 0, 0.05882353, 1,
2.086238, -0.4207072, 0.9050388, 1, 0, 0.05490196, 1,
2.151986, 0.9206985, 0.8985942, 1, 0, 0.04705882, 1,
2.158196, -1.178005, 3.033376, 1, 0, 0.04313726, 1,
2.195402, 0.5775269, 2.372086, 1, 0, 0.03529412, 1,
2.205123, 0.1114694, 1.612895, 1, 0, 0.03137255, 1,
2.574127, -0.1135017, 3.581022, 1, 0, 0.02352941, 1,
2.593074, -0.1770265, 2.236149, 1, 0, 0.01960784, 1,
2.652372, 1.976103, 0.3724543, 1, 0, 0.01176471, 1,
2.863631, 1.570497, 0.6815875, 1, 0, 0.007843138, 1
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
-0.5395126, -3.890024, -7.742442, 0, -0.5, 0.5, 0.5,
-0.5395126, -3.890024, -7.742442, 1, -0.5, 0.5, 0.5,
-0.5395126, -3.890024, -7.742442, 1, 1.5, 0.5, 0.5,
-0.5395126, -3.890024, -7.742442, 0, 1.5, 0.5, 0.5
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
-5.096323, 0.1390828, -7.742442, 0, -0.5, 0.5, 0.5,
-5.096323, 0.1390828, -7.742442, 1, -0.5, 0.5, 0.5,
-5.096323, 0.1390828, -7.742442, 1, 1.5, 0.5, 0.5,
-5.096323, 0.1390828, -7.742442, 0, 1.5, 0.5, 0.5
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
-5.096323, -3.890024, -0.4196861, 0, -0.5, 0.5, 0.5,
-5.096323, -3.890024, -0.4196861, 1, -0.5, 0.5, 0.5,
-5.096323, -3.890024, -0.4196861, 1, 1.5, 0.5, 0.5,
-5.096323, -3.890024, -0.4196861, 0, 1.5, 0.5, 0.5
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
-3, -2.96023, -6.052576,
2, -2.96023, -6.052576,
-3, -2.96023, -6.052576,
-3, -3.115196, -6.33422,
-2, -2.96023, -6.052576,
-2, -3.115196, -6.33422,
-1, -2.96023, -6.052576,
-1, -3.115196, -6.33422,
0, -2.96023, -6.052576,
0, -3.115196, -6.33422,
1, -2.96023, -6.052576,
1, -3.115196, -6.33422,
2, -2.96023, -6.052576,
2, -3.115196, -6.33422
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
-3, -3.425127, -6.897509, 0, -0.5, 0.5, 0.5,
-3, -3.425127, -6.897509, 1, -0.5, 0.5, 0.5,
-3, -3.425127, -6.897509, 1, 1.5, 0.5, 0.5,
-3, -3.425127, -6.897509, 0, 1.5, 0.5, 0.5,
-2, -3.425127, -6.897509, 0, -0.5, 0.5, 0.5,
-2, -3.425127, -6.897509, 1, -0.5, 0.5, 0.5,
-2, -3.425127, -6.897509, 1, 1.5, 0.5, 0.5,
-2, -3.425127, -6.897509, 0, 1.5, 0.5, 0.5,
-1, -3.425127, -6.897509, 0, -0.5, 0.5, 0.5,
-1, -3.425127, -6.897509, 1, -0.5, 0.5, 0.5,
-1, -3.425127, -6.897509, 1, 1.5, 0.5, 0.5,
-1, -3.425127, -6.897509, 0, 1.5, 0.5, 0.5,
0, -3.425127, -6.897509, 0, -0.5, 0.5, 0.5,
0, -3.425127, -6.897509, 1, -0.5, 0.5, 0.5,
0, -3.425127, -6.897509, 1, 1.5, 0.5, 0.5,
0, -3.425127, -6.897509, 0, 1.5, 0.5, 0.5,
1, -3.425127, -6.897509, 0, -0.5, 0.5, 0.5,
1, -3.425127, -6.897509, 1, -0.5, 0.5, 0.5,
1, -3.425127, -6.897509, 1, 1.5, 0.5, 0.5,
1, -3.425127, -6.897509, 0, 1.5, 0.5, 0.5,
2, -3.425127, -6.897509, 0, -0.5, 0.5, 0.5,
2, -3.425127, -6.897509, 1, -0.5, 0.5, 0.5,
2, -3.425127, -6.897509, 1, 1.5, 0.5, 0.5,
2, -3.425127, -6.897509, 0, 1.5, 0.5, 0.5
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
-4.044751, -2, -6.052576,
-4.044751, 3, -6.052576,
-4.044751, -2, -6.052576,
-4.220013, -2, -6.33422,
-4.044751, -1, -6.052576,
-4.220013, -1, -6.33422,
-4.044751, 0, -6.052576,
-4.220013, 0, -6.33422,
-4.044751, 1, -6.052576,
-4.220013, 1, -6.33422,
-4.044751, 2, -6.052576,
-4.220013, 2, -6.33422,
-4.044751, 3, -6.052576,
-4.220013, 3, -6.33422
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
-4.570537, -2, -6.897509, 0, -0.5, 0.5, 0.5,
-4.570537, -2, -6.897509, 1, -0.5, 0.5, 0.5,
-4.570537, -2, -6.897509, 1, 1.5, 0.5, 0.5,
-4.570537, -2, -6.897509, 0, 1.5, 0.5, 0.5,
-4.570537, -1, -6.897509, 0, -0.5, 0.5, 0.5,
-4.570537, -1, -6.897509, 1, -0.5, 0.5, 0.5,
-4.570537, -1, -6.897509, 1, 1.5, 0.5, 0.5,
-4.570537, -1, -6.897509, 0, 1.5, 0.5, 0.5,
-4.570537, 0, -6.897509, 0, -0.5, 0.5, 0.5,
-4.570537, 0, -6.897509, 1, -0.5, 0.5, 0.5,
-4.570537, 0, -6.897509, 1, 1.5, 0.5, 0.5,
-4.570537, 0, -6.897509, 0, 1.5, 0.5, 0.5,
-4.570537, 1, -6.897509, 0, -0.5, 0.5, 0.5,
-4.570537, 1, -6.897509, 1, -0.5, 0.5, 0.5,
-4.570537, 1, -6.897509, 1, 1.5, 0.5, 0.5,
-4.570537, 1, -6.897509, 0, 1.5, 0.5, 0.5,
-4.570537, 2, -6.897509, 0, -0.5, 0.5, 0.5,
-4.570537, 2, -6.897509, 1, -0.5, 0.5, 0.5,
-4.570537, 2, -6.897509, 1, 1.5, 0.5, 0.5,
-4.570537, 2, -6.897509, 0, 1.5, 0.5, 0.5,
-4.570537, 3, -6.897509, 0, -0.5, 0.5, 0.5,
-4.570537, 3, -6.897509, 1, -0.5, 0.5, 0.5,
-4.570537, 3, -6.897509, 1, 1.5, 0.5, 0.5,
-4.570537, 3, -6.897509, 0, 1.5, 0.5, 0.5
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
-4.044751, -2.96023, -4,
-4.044751, -2.96023, 4,
-4.044751, -2.96023, -4,
-4.220013, -3.115196, -4,
-4.044751, -2.96023, -2,
-4.220013, -3.115196, -2,
-4.044751, -2.96023, 0,
-4.220013, -3.115196, 0,
-4.044751, -2.96023, 2,
-4.220013, -3.115196, 2,
-4.044751, -2.96023, 4,
-4.220013, -3.115196, 4
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
-4.570537, -3.425127, -4, 0, -0.5, 0.5, 0.5,
-4.570537, -3.425127, -4, 1, -0.5, 0.5, 0.5,
-4.570537, -3.425127, -4, 1, 1.5, 0.5, 0.5,
-4.570537, -3.425127, -4, 0, 1.5, 0.5, 0.5,
-4.570537, -3.425127, -2, 0, -0.5, 0.5, 0.5,
-4.570537, -3.425127, -2, 1, -0.5, 0.5, 0.5,
-4.570537, -3.425127, -2, 1, 1.5, 0.5, 0.5,
-4.570537, -3.425127, -2, 0, 1.5, 0.5, 0.5,
-4.570537, -3.425127, 0, 0, -0.5, 0.5, 0.5,
-4.570537, -3.425127, 0, 1, -0.5, 0.5, 0.5,
-4.570537, -3.425127, 0, 1, 1.5, 0.5, 0.5,
-4.570537, -3.425127, 0, 0, 1.5, 0.5, 0.5,
-4.570537, -3.425127, 2, 0, -0.5, 0.5, 0.5,
-4.570537, -3.425127, 2, 1, -0.5, 0.5, 0.5,
-4.570537, -3.425127, 2, 1, 1.5, 0.5, 0.5,
-4.570537, -3.425127, 2, 0, 1.5, 0.5, 0.5,
-4.570537, -3.425127, 4, 0, -0.5, 0.5, 0.5,
-4.570537, -3.425127, 4, 1, -0.5, 0.5, 0.5,
-4.570537, -3.425127, 4, 1, 1.5, 0.5, 0.5,
-4.570537, -3.425127, 4, 0, 1.5, 0.5, 0.5
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
-4.044751, -2.96023, -6.052576,
-4.044751, 3.238396, -6.052576,
-4.044751, -2.96023, 5.213203,
-4.044751, 3.238396, 5.213203,
-4.044751, -2.96023, -6.052576,
-4.044751, -2.96023, 5.213203,
-4.044751, 3.238396, -6.052576,
-4.044751, 3.238396, 5.213203,
-4.044751, -2.96023, -6.052576,
2.965726, -2.96023, -6.052576,
-4.044751, -2.96023, 5.213203,
2.965726, -2.96023, 5.213203,
-4.044751, 3.238396, -6.052576,
2.965726, 3.238396, -6.052576,
-4.044751, 3.238396, 5.213203,
2.965726, 3.238396, 5.213203,
2.965726, -2.96023, -6.052576,
2.965726, 3.238396, -6.052576,
2.965726, -2.96023, 5.213203,
2.965726, 3.238396, 5.213203,
2.965726, -2.96023, -6.052576,
2.965726, -2.96023, 5.213203,
2.965726, 3.238396, -6.052576,
2.965726, 3.238396, 5.213203
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
var radius = 7.820355;
var distance = 34.79365;
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
mvMatrix.translate( 0.5395126, -0.1390828, 0.4196861 );
mvMatrix.scale( 1.206126, 1.364096, 0.7505492 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79365);
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
chlorfluazuron<-read.table("chlorfluazuron.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chlorfluazuron$V2
```

```
## Error in eval(expr, envir, enclos): object 'chlorfluazuron' not found
```

```r
y<-chlorfluazuron$V3
```

```
## Error in eval(expr, envir, enclos): object 'chlorfluazuron' not found
```

```r
z<-chlorfluazuron$V4
```

```
## Error in eval(expr, envir, enclos): object 'chlorfluazuron' not found
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
-3.942657, -0.8510774, -2.299493, 0, 0, 1, 1, 1,
-2.977016, 1.024131, 0.541514, 1, 0, 0, 1, 1,
-2.955127, -0.4285089, -0.1648739, 1, 0, 0, 1, 1,
-2.876135, -0.3154928, -1.542314, 1, 0, 0, 1, 1,
-2.777893, -1.228659, -2.241484, 1, 0, 0, 1, 1,
-2.585501, 1.216393, -0.7298223, 1, 0, 0, 1, 1,
-2.572951, 0.7545739, -1.127267, 0, 0, 0, 1, 1,
-2.457133, 0.659934, -2.909449, 0, 0, 0, 1, 1,
-2.280023, 0.4617198, -1.297501, 0, 0, 0, 1, 1,
-2.234846, -0.0207017, -2.655753, 0, 0, 0, 1, 1,
-2.206383, -0.01289286, -2.74956, 0, 0, 0, 1, 1,
-2.204382, 1.542182, -0.2389951, 0, 0, 0, 1, 1,
-2.128104, 3.072694, -0.1692604, 0, 0, 0, 1, 1,
-2.110983, 0.3006766, -1.314145, 1, 1, 1, 1, 1,
-2.092476, 0.2051394, -2.410537, 1, 1, 1, 1, 1,
-2.082989, 0.2870098, -2.368626, 1, 1, 1, 1, 1,
-2.036007, -0.1405515, -2.636673, 1, 1, 1, 1, 1,
-2.031431, 0.2232462, -1.538095, 1, 1, 1, 1, 1,
-2.012762, 0.6746939, -0.2011572, 1, 1, 1, 1, 1,
-2.007924, 2.696183, 1.470569, 1, 1, 1, 1, 1,
-1.991042, 0.08761762, -2.063517, 1, 1, 1, 1, 1,
-1.984583, 0.6313326, -1.741165, 1, 1, 1, 1, 1,
-1.983783, -0.9190425, -2.03631, 1, 1, 1, 1, 1,
-1.974334, -0.872734, -1.187762, 1, 1, 1, 1, 1,
-1.943207, -0.5656717, -1.97774, 1, 1, 1, 1, 1,
-1.932232, 0.06237345, -0.5385057, 1, 1, 1, 1, 1,
-1.916901, -1.63002, -2.322427, 1, 1, 1, 1, 1,
-1.896371, 0.4745411, 0.9111351, 1, 1, 1, 1, 1,
-1.864549, 0.4844505, -1.844525, 0, 0, 1, 1, 1,
-1.835992, 1.098694, -0.9039703, 1, 0, 0, 1, 1,
-1.828513, 0.5695447, -1.691497, 1, 0, 0, 1, 1,
-1.795874, 1.198477, -1.942023, 1, 0, 0, 1, 1,
-1.779223, 0.4580739, -1.727006, 1, 0, 0, 1, 1,
-1.765707, -0.05814458, -3.547292, 1, 0, 0, 1, 1,
-1.756214, -1.558198, -2.553913, 0, 0, 0, 1, 1,
-1.728804, 1.623155, -0.7775825, 0, 0, 0, 1, 1,
-1.722861, -0.4487761, -2.214525, 0, 0, 0, 1, 1,
-1.706207, -1.16496, -2.007598, 0, 0, 0, 1, 1,
-1.703829, 0.4739448, -1.784554, 0, 0, 0, 1, 1,
-1.686424, 0.06213777, -1.856988, 0, 0, 0, 1, 1,
-1.684704, 0.07804249, -1.354124, 0, 0, 0, 1, 1,
-1.673465, -0.8899516, -0.5179199, 1, 1, 1, 1, 1,
-1.663592, -0.8603739, -3.177339, 1, 1, 1, 1, 1,
-1.657478, 1.083227, 0.5931225, 1, 1, 1, 1, 1,
-1.655536, 0.3302625, 0.2023096, 1, 1, 1, 1, 1,
-1.652628, 0.03199491, -3.169345, 1, 1, 1, 1, 1,
-1.642146, 0.4854335, 0.3856587, 1, 1, 1, 1, 1,
-1.640932, -0.2713311, -2.587962, 1, 1, 1, 1, 1,
-1.633387, 0.338302, 0.4969914, 1, 1, 1, 1, 1,
-1.63094, -0.8163314, -2.031584, 1, 1, 1, 1, 1,
-1.623901, -1.12687, -1.62867, 1, 1, 1, 1, 1,
-1.609226, 0.3634879, -0.04249318, 1, 1, 1, 1, 1,
-1.607573, 0.9386882, -0.1201809, 1, 1, 1, 1, 1,
-1.59865, -0.1179836, -3.519292, 1, 1, 1, 1, 1,
-1.597777, -0.9638924, -1.476697, 1, 1, 1, 1, 1,
-1.595759, 0.0345113, -0.4426588, 1, 1, 1, 1, 1,
-1.593771, -0.460549, -1.608553, 0, 0, 1, 1, 1,
-1.577945, 0.01489738, -2.46745, 1, 0, 0, 1, 1,
-1.56678, 0.2063386, -1.241242, 1, 0, 0, 1, 1,
-1.556863, 1.787941, -0.9293289, 1, 0, 0, 1, 1,
-1.555158, -1.684043, -2.807204, 1, 0, 0, 1, 1,
-1.554293, -0.06177978, -0.9514647, 1, 0, 0, 1, 1,
-1.551416, 0.1228426, -1.656492, 0, 0, 0, 1, 1,
-1.547991, 0.3211852, -0.9983484, 0, 0, 0, 1, 1,
-1.546834, 0.1691898, -1.725373, 0, 0, 0, 1, 1,
-1.529796, 0.4055825, -1.632537, 0, 0, 0, 1, 1,
-1.521274, 1.723357, -0.2799274, 0, 0, 0, 1, 1,
-1.515015, -0.02492693, -0.8686951, 0, 0, 0, 1, 1,
-1.513816, 0.07894456, -2.802974, 0, 0, 0, 1, 1,
-1.511405, -1.144559, -1.821019, 1, 1, 1, 1, 1,
-1.479468, 1.576349, -2.536747, 1, 1, 1, 1, 1,
-1.450438, -1.138188, -3.103468, 1, 1, 1, 1, 1,
-1.442557, 0.01967526, -0.4438034, 1, 1, 1, 1, 1,
-1.442158, -1.213983, -2.279191, 1, 1, 1, 1, 1,
-1.43336, 1.72968, 0.1249433, 1, 1, 1, 1, 1,
-1.430787, 0.4001659, -1.059586, 1, 1, 1, 1, 1,
-1.427125, -0.2529065, -0.7920032, 1, 1, 1, 1, 1,
-1.42584, 1.313487, 0.6307204, 1, 1, 1, 1, 1,
-1.42313, 0.5391919, -0.3824997, 1, 1, 1, 1, 1,
-1.422059, -1.167449, -3.215152, 1, 1, 1, 1, 1,
-1.417632, -1.084411, -3.073814, 1, 1, 1, 1, 1,
-1.415383, -0.117795, -1.944789, 1, 1, 1, 1, 1,
-1.408713, -0.08728918, -0.3414488, 1, 1, 1, 1, 1,
-1.381749, 1.274911, 0.2368423, 1, 1, 1, 1, 1,
-1.380817, 0.5426052, -0.9510078, 0, 0, 1, 1, 1,
-1.378232, 0.4183459, -1.142409, 1, 0, 0, 1, 1,
-1.377054, -1.78177, -3.755949, 1, 0, 0, 1, 1,
-1.367853, -0.3524818, -2.183886, 1, 0, 0, 1, 1,
-1.362028, 0.8140403, -0.5081143, 1, 0, 0, 1, 1,
-1.348027, 0.2787792, -0.9694639, 1, 0, 0, 1, 1,
-1.347057, -0.5261078, -2.208483, 0, 0, 0, 1, 1,
-1.324005, -0.9748284, -0.5292296, 0, 0, 0, 1, 1,
-1.315144, 0.6717852, -1.200461, 0, 0, 0, 1, 1,
-1.305539, -0.6967669, -1.856963, 0, 0, 0, 1, 1,
-1.303279, 0.8110104, -0.8653213, 0, 0, 0, 1, 1,
-1.300468, -0.8697711, -2.252927, 0, 0, 0, 1, 1,
-1.299308, -0.1086853, -2.155051, 0, 0, 0, 1, 1,
-1.294997, -0.6597494, -2.2752, 1, 1, 1, 1, 1,
-1.292073, 2.322452, -2.433142, 1, 1, 1, 1, 1,
-1.285288, -1.863546, -3.867004, 1, 1, 1, 1, 1,
-1.280586, 0.2184004, -2.466731, 1, 1, 1, 1, 1,
-1.280536, 1.353901, -0.9637426, 1, 1, 1, 1, 1,
-1.263185, 0.3585549, -0.4762394, 1, 1, 1, 1, 1,
-1.262763, -0.05161021, -1.077628, 1, 1, 1, 1, 1,
-1.254167, 2.21696, -1.3489, 1, 1, 1, 1, 1,
-1.251323, -1.037748, -1.701511, 1, 1, 1, 1, 1,
-1.239896, 1.622937, 1.014268, 1, 1, 1, 1, 1,
-1.238416, -0.1221117, -1.584222, 1, 1, 1, 1, 1,
-1.233139, 0.5129169, 0.2177301, 1, 1, 1, 1, 1,
-1.232641, -0.6535867, -2.122541, 1, 1, 1, 1, 1,
-1.231069, 0.4205014, -2.767151, 1, 1, 1, 1, 1,
-1.221682, 1.321322, 0.227526, 1, 1, 1, 1, 1,
-1.215322, 0.9022168, -0.61678, 0, 0, 1, 1, 1,
-1.208745, 0.656814, -0.5831574, 1, 0, 0, 1, 1,
-1.208387, -0.7397342, -2.875425, 1, 0, 0, 1, 1,
-1.201001, 1.481089, 0.0418752, 1, 0, 0, 1, 1,
-1.200237, 1.19207, -1.166646, 1, 0, 0, 1, 1,
-1.193488, -2.753909, -1.772704, 1, 0, 0, 1, 1,
-1.187613, 0.8998187, -0.3373297, 0, 0, 0, 1, 1,
-1.187534, -0.9184191, -3.623419, 0, 0, 0, 1, 1,
-1.182726, 1.098507, -1.612976, 0, 0, 0, 1, 1,
-1.174449, -0.4730861, -1.749046, 0, 0, 0, 1, 1,
-1.171714, 0.6151773, 0.4056553, 0, 0, 0, 1, 1,
-1.170516, 0.828001, -0.8397163, 0, 0, 0, 1, 1,
-1.16991, -0.9420973, -2.2083, 0, 0, 0, 1, 1,
-1.165248, -0.7682119, -2.675243, 1, 1, 1, 1, 1,
-1.162009, 0.2326741, 0.3127943, 1, 1, 1, 1, 1,
-1.146407, 1.375819, -0.3046097, 1, 1, 1, 1, 1,
-1.140607, -0.4338795, -2.161832, 1, 1, 1, 1, 1,
-1.13635, -0.3999392, -2.952607, 1, 1, 1, 1, 1,
-1.134236, -0.1149416, -0.9860075, 1, 1, 1, 1, 1,
-1.131386, -2.1287, -1.919943, 1, 1, 1, 1, 1,
-1.12281, 0.3728323, -1.29864, 1, 1, 1, 1, 1,
-1.11669, -0.5008432, -2.874706, 1, 1, 1, 1, 1,
-1.116651, -0.5832032, -2.846189, 1, 1, 1, 1, 1,
-1.111539, 0.1411054, -0.06637815, 1, 1, 1, 1, 1,
-1.109102, 1.680578, -1.704254, 1, 1, 1, 1, 1,
-1.092064, -0.9064456, -2.35525, 1, 1, 1, 1, 1,
-1.089826, 0.7354512, -0.09903658, 1, 1, 1, 1, 1,
-1.086298, 1.028415, -0.4004686, 1, 1, 1, 1, 1,
-1.084343, 1.587921, -0.00901698, 0, 0, 1, 1, 1,
-1.079614, 0.00734841, -2.699583, 1, 0, 0, 1, 1,
-1.072457, 2.513658, -2.231715, 1, 0, 0, 1, 1,
-1.04698, 1.209059, -0.9284379, 1, 0, 0, 1, 1,
-1.044605, -0.7526899, -1.957846, 1, 0, 0, 1, 1,
-1.044075, -0.370353, -2.145365, 1, 0, 0, 1, 1,
-1.039379, -1.288401, -3.877153, 0, 0, 0, 1, 1,
-1.0299, -0.0051058, -1.452648, 0, 0, 0, 1, 1,
-1.027531, 0.7249507, -2.183747, 0, 0, 0, 1, 1,
-1.019928, -0.08064453, -2.22441, 0, 0, 0, 1, 1,
-1.01506, -0.01582535, -2.173635, 0, 0, 0, 1, 1,
-1.014529, 1.119001, 0.800382, 0, 0, 0, 1, 1,
-1.014128, -1.952014, -2.747184, 0, 0, 0, 1, 1,
-1.00149, 0.3308243, -1.013644, 1, 1, 1, 1, 1,
-0.9998531, 1.810507, 0.9299662, 1, 1, 1, 1, 1,
-0.9937623, -0.2197587, -1.432939, 1, 1, 1, 1, 1,
-0.9875172, 0.3737863, -2.523504, 1, 1, 1, 1, 1,
-0.9873945, 0.6321134, -0.6669544, 1, 1, 1, 1, 1,
-0.986032, -1.028124, -3.745697, 1, 1, 1, 1, 1,
-0.9800926, 0.2058402, -2.776903, 1, 1, 1, 1, 1,
-0.9766197, -1.233198, -3.717559, 1, 1, 1, 1, 1,
-0.970519, -0.001341763, -2.672905, 1, 1, 1, 1, 1,
-0.9674847, 0.1191069, -2.804657, 1, 1, 1, 1, 1,
-0.9661496, 0.4648081, 1.333906, 1, 1, 1, 1, 1,
-0.9626628, 0.3025949, -0.760309, 1, 1, 1, 1, 1,
-0.957414, 0.3508556, -2.195851, 1, 1, 1, 1, 1,
-0.9560471, -1.518658, -2.912065, 1, 1, 1, 1, 1,
-0.9541805, 1.507028, -1.160786, 1, 1, 1, 1, 1,
-0.9526396, 0.04953343, -1.533734, 0, 0, 1, 1, 1,
-0.9500217, -1.085513, -0.01085684, 1, 0, 0, 1, 1,
-0.9488859, -1.417912, -1.097619, 1, 0, 0, 1, 1,
-0.9439664, 2.027753, 0.03350579, 1, 0, 0, 1, 1,
-0.9412143, 1.054591, -0.07615571, 1, 0, 0, 1, 1,
-0.9394727, -0.6192744, -3.735758, 1, 0, 0, 1, 1,
-0.936655, 0.127942, -2.752007, 0, 0, 0, 1, 1,
-0.9353357, -0.7042776, -3.107867, 0, 0, 0, 1, 1,
-0.9338384, 1.174695, -0.1494115, 0, 0, 0, 1, 1,
-0.9167535, -0.1771297, -0.5442409, 0, 0, 0, 1, 1,
-0.9133964, 1.388828, -0.291088, 0, 0, 0, 1, 1,
-0.9124359, 0.2623783, -1.818254, 0, 0, 0, 1, 1,
-0.9089877, 1.246259, -0.5654712, 0, 0, 0, 1, 1,
-0.9086997, 1.423177, -0.1155604, 1, 1, 1, 1, 1,
-0.908388, 0.2151778, -2.69978, 1, 1, 1, 1, 1,
-0.9077814, 0.8517475, -1.294027, 1, 1, 1, 1, 1,
-0.9066957, 1.235889, 0.04333657, 1, 1, 1, 1, 1,
-0.9066286, -0.06130563, -2.00426, 1, 1, 1, 1, 1,
-0.9059007, -1.384258, -2.139416, 1, 1, 1, 1, 1,
-0.9007022, 0.2473746, -2.38388, 1, 1, 1, 1, 1,
-0.899389, 0.8708467, -2.174724, 1, 1, 1, 1, 1,
-0.8928004, 0.450795, -1.596598, 1, 1, 1, 1, 1,
-0.8841825, 1.072708, -1.759416, 1, 1, 1, 1, 1,
-0.8793918, 0.9487325, -0.4606988, 1, 1, 1, 1, 1,
-0.8768538, 0.9395817, 0.004671149, 1, 1, 1, 1, 1,
-0.8759546, -1.111935, -2.68415, 1, 1, 1, 1, 1,
-0.8751112, -0.07327765, -3.59945, 1, 1, 1, 1, 1,
-0.8733069, -0.782025, -3.093343, 1, 1, 1, 1, 1,
-0.8668436, -1.062565, -3.37828, 0, 0, 1, 1, 1,
-0.8458476, 0.6907106, -1.065308, 1, 0, 0, 1, 1,
-0.8440692, -0.3333581, -2.677725, 1, 0, 0, 1, 1,
-0.843435, 0.6457875, -0.02485504, 1, 0, 0, 1, 1,
-0.8419441, 0.8388625, 1.040542, 1, 0, 0, 1, 1,
-0.8412796, -1.687086, -3.586541, 1, 0, 0, 1, 1,
-0.8407335, 0.4375774, -1.473042, 0, 0, 0, 1, 1,
-0.8392631, -0.8009193, -1.2822, 0, 0, 0, 1, 1,
-0.8373016, 0.7594512, -1.067892, 0, 0, 0, 1, 1,
-0.8304409, -1.035876, -1.0231, 0, 0, 0, 1, 1,
-0.8249676, 1.486445, 0.09187371, 0, 0, 0, 1, 1,
-0.8227304, -1.162915, -3.138964, 0, 0, 0, 1, 1,
-0.8169009, -0.2173914, -1.453511, 0, 0, 0, 1, 1,
-0.8163489, -0.9234155, -1.762672, 1, 1, 1, 1, 1,
-0.8062617, -0.2944463, -2.194265, 1, 1, 1, 1, 1,
-0.8043588, -1.536191, -1.491595, 1, 1, 1, 1, 1,
-0.8006057, 0.1971887, -3.059615, 1, 1, 1, 1, 1,
-0.7945693, 1.424742, -1.189656, 1, 1, 1, 1, 1,
-0.7904028, 1.079613, -1.701134, 1, 1, 1, 1, 1,
-0.7838274, -1.195044, -3.931092, 1, 1, 1, 1, 1,
-0.7813848, 0.962769, -1.14289, 1, 1, 1, 1, 1,
-0.7804571, -2.527672, -3.406636, 1, 1, 1, 1, 1,
-0.7745789, -0.2477765, -2.332595, 1, 1, 1, 1, 1,
-0.7716821, 0.2557794, -1.679053, 1, 1, 1, 1, 1,
-0.7705356, 0.4033887, -1.878227, 1, 1, 1, 1, 1,
-0.7697083, 0.3607641, 1.289006, 1, 1, 1, 1, 1,
-0.7693005, -0.2209735, -0.5619937, 1, 1, 1, 1, 1,
-0.7655767, -2.869959, -1.140593, 1, 1, 1, 1, 1,
-0.7641981, -0.3590908, -3.249701, 0, 0, 1, 1, 1,
-0.7504389, -0.3452515, -3.491067, 1, 0, 0, 1, 1,
-0.7414365, -0.1534765, -1.275685, 1, 0, 0, 1, 1,
-0.7396379, 0.7792548, -2.789951, 1, 0, 0, 1, 1,
-0.7340257, -0.1887175, -1.886007, 1, 0, 0, 1, 1,
-0.7322828, 0.5812813, -2.425875, 1, 0, 0, 1, 1,
-0.7320904, 2.227103, -0.6681942, 0, 0, 0, 1, 1,
-0.7256835, 1.4448, 0.1278489, 0, 0, 0, 1, 1,
-0.720759, 0.3708665, -1.21489, 0, 0, 0, 1, 1,
-0.719, 0.06605814, -1.204233, 0, 0, 0, 1, 1,
-0.7180856, -0.1012522, -0.8200558, 0, 0, 0, 1, 1,
-0.717352, 0.290283, -3.525812, 0, 0, 0, 1, 1,
-0.7102109, 0.3363232, -1.521187, 0, 0, 0, 1, 1,
-0.7095562, 1.278027, -0.06569398, 1, 1, 1, 1, 1,
-0.7089233, 0.2557545, -3.512198, 1, 1, 1, 1, 1,
-0.6958061, -0.1276664, -1.657095, 1, 1, 1, 1, 1,
-0.6931905, -0.4047009, -1.788804, 1, 1, 1, 1, 1,
-0.6913481, -1.393144, -3.726237, 1, 1, 1, 1, 1,
-0.6903782, -0.0249333, -2.514057, 1, 1, 1, 1, 1,
-0.6864551, -1.4, -3.583149, 1, 1, 1, 1, 1,
-0.6849298, 0.2411565, -0.2719182, 1, 1, 1, 1, 1,
-0.6729919, -0.4854953, -2.899106, 1, 1, 1, 1, 1,
-0.669818, 1.345127, -0.2901856, 1, 1, 1, 1, 1,
-0.668764, -0.7439373, -2.510295, 1, 1, 1, 1, 1,
-0.6678156, -1.967782, -3.206319, 1, 1, 1, 1, 1,
-0.6673145, 1.491401, -0.7321171, 1, 1, 1, 1, 1,
-0.6625646, -0.8737109, -3.356281, 1, 1, 1, 1, 1,
-0.6617301, 0.3345476, 1.75382, 1, 1, 1, 1, 1,
-0.6556334, 0.476047, -0.8500635, 0, 0, 1, 1, 1,
-0.6542813, 0.9576373, -0.7559154, 1, 0, 0, 1, 1,
-0.6542106, -0.2452657, -2.655896, 1, 0, 0, 1, 1,
-0.649584, -0.6410176, -0.9549103, 1, 0, 0, 1, 1,
-0.6494988, 1.733043, -0.1648332, 1, 0, 0, 1, 1,
-0.6403361, 1.081726, -0.1069451, 1, 0, 0, 1, 1,
-0.6312903, -1.158228, -2.822006, 0, 0, 0, 1, 1,
-0.6254678, 0.5730518, -0.5920452, 0, 0, 0, 1, 1,
-0.6197761, -0.6909353, -4.165645, 0, 0, 0, 1, 1,
-0.6167876, 0.182144, -1.825562, 0, 0, 0, 1, 1,
-0.6145378, 0.3044723, -2.554335, 0, 0, 0, 1, 1,
-0.6125716, 1.122816, -1.973311, 0, 0, 0, 1, 1,
-0.611648, 1.191802, -1.278459, 0, 0, 0, 1, 1,
-0.6100121, 0.7371182, -1.747957, 1, 1, 1, 1, 1,
-0.6071819, -0.4334721, -3.685237, 1, 1, 1, 1, 1,
-0.6036463, 0.4220436, -1.832198, 1, 1, 1, 1, 1,
-0.6033018, 1.931286, -0.06538253, 1, 1, 1, 1, 1,
-0.5956349, 0.2945853, -0.8799118, 1, 1, 1, 1, 1,
-0.595466, -1.418285, -2.523787, 1, 1, 1, 1, 1,
-0.5938641, -1.160093, -4.511419, 1, 1, 1, 1, 1,
-0.5920656, -0.4760185, -1.699241, 1, 1, 1, 1, 1,
-0.5883455, -1.467124, -2.967124, 1, 1, 1, 1, 1,
-0.5880156, -0.07879763, -1.72558, 1, 1, 1, 1, 1,
-0.5819902, -0.7372485, -2.988706, 1, 1, 1, 1, 1,
-0.581975, -0.9547005, -0.8380075, 1, 1, 1, 1, 1,
-0.575927, 0.8892259, 0.7128671, 1, 1, 1, 1, 1,
-0.5725157, -0.4640245, -2.258078, 1, 1, 1, 1, 1,
-0.5650586, 0.0273736, -1.904209, 1, 1, 1, 1, 1,
-0.5573817, 0.7511606, 0.06757335, 0, 0, 1, 1, 1,
-0.5563892, 0.1651679, -2.24459, 1, 0, 0, 1, 1,
-0.5552899, 1.162651, 0.5793777, 1, 0, 0, 1, 1,
-0.5528854, -1.310563, -2.971881, 1, 0, 0, 1, 1,
-0.5500357, 0.5981457, -1.672232, 1, 0, 0, 1, 1,
-0.5486419, 0.759151, 0.3378742, 1, 0, 0, 1, 1,
-0.5448399, 0.5363967, -1.884998, 0, 0, 0, 1, 1,
-0.5442687, 0.4715212, -0.7174202, 0, 0, 0, 1, 1,
-0.5374201, -0.3851197, -2.83261, 0, 0, 0, 1, 1,
-0.5370805, 0.3691559, -2.102276, 0, 0, 0, 1, 1,
-0.5367503, 0.2587146, -1.193676, 0, 0, 0, 1, 1,
-0.5355997, 0.1133152, -1.768057, 0, 0, 0, 1, 1,
-0.5339751, 1.030607, -0.8753088, 0, 0, 0, 1, 1,
-0.5332232, -1.252583, -2.553914, 1, 1, 1, 1, 1,
-0.5315465, 0.5055628, -0.5675848, 1, 1, 1, 1, 1,
-0.5301759, 2.607916, -0.2486909, 1, 1, 1, 1, 1,
-0.5284128, 0.103494, -0.1249703, 1, 1, 1, 1, 1,
-0.5234742, 1.087375, -0.6880062, 1, 1, 1, 1, 1,
-0.5216348, -0.7688044, -3.403638, 1, 1, 1, 1, 1,
-0.5211828, -0.3654628, -1.483228, 1, 1, 1, 1, 1,
-0.5211402, 0.6199759, -0.2765396, 1, 1, 1, 1, 1,
-0.5207175, 0.6089077, -0.3564653, 1, 1, 1, 1, 1,
-0.5171856, 0.6708979, -1.578426, 1, 1, 1, 1, 1,
-0.5157632, 0.3184097, -1.255935, 1, 1, 1, 1, 1,
-0.5148547, -2.434837, -3.113524, 1, 1, 1, 1, 1,
-0.5146545, -1.731239, -2.722003, 1, 1, 1, 1, 1,
-0.5142159, 1.452752, -0.963437, 1, 1, 1, 1, 1,
-0.5139912, 1.856276, -1.09586, 1, 1, 1, 1, 1,
-0.5098289, -0.7033179, -3.983923, 0, 0, 1, 1, 1,
-0.5071029, -0.6549482, -1.668139, 1, 0, 0, 1, 1,
-0.5046761, 1.318578, -0.9930168, 1, 0, 0, 1, 1,
-0.5038258, -0.2319049, -2.171548, 1, 0, 0, 1, 1,
-0.5030359, 0.365261, 0.5659219, 1, 0, 0, 1, 1,
-0.4937854, -1.070331, -3.376594, 1, 0, 0, 1, 1,
-0.4929647, -0.2650629, -2.210271, 0, 0, 0, 1, 1,
-0.4892567, -0.3583435, -2.524222, 0, 0, 0, 1, 1,
-0.4879021, -0.3631187, -1.198127, 0, 0, 0, 1, 1,
-0.483584, 1.744821, 0.9507324, 0, 0, 0, 1, 1,
-0.4831659, -1.840468, -1.912513, 0, 0, 0, 1, 1,
-0.4822399, -0.729885, -2.913783, 0, 0, 0, 1, 1,
-0.479846, -0.8917534, -0.7382615, 0, 0, 0, 1, 1,
-0.4783324, -0.0162081, -0.7835674, 1, 1, 1, 1, 1,
-0.4764114, 0.229136, -0.9375046, 1, 1, 1, 1, 1,
-0.4733269, -1.00618, -4.150482, 1, 1, 1, 1, 1,
-0.4733183, 1.444026, -0.8723024, 1, 1, 1, 1, 1,
-0.4707473, 2.071492, -1.655091, 1, 1, 1, 1, 1,
-0.4689076, -0.965553, -2.325577, 1, 1, 1, 1, 1,
-0.4655878, -2.083512, -2.91399, 1, 1, 1, 1, 1,
-0.464992, -1.29937, -2.616757, 1, 1, 1, 1, 1,
-0.4596637, -0.7113726, -1.703474, 1, 1, 1, 1, 1,
-0.4593832, -1.695168, -2.291305, 1, 1, 1, 1, 1,
-0.4589279, 0.1107245, -0.05498334, 1, 1, 1, 1, 1,
-0.457078, 0.2058017, 1.056061, 1, 1, 1, 1, 1,
-0.4540671, -0.5347003, -2.796049, 1, 1, 1, 1, 1,
-0.4484144, 0.5846466, -0.6133331, 1, 1, 1, 1, 1,
-0.4475532, -1.772044, -3.045041, 1, 1, 1, 1, 1,
-0.4473524, -0.5318589, -2.327443, 0, 0, 1, 1, 1,
-0.4453196, -1.627037, -3.058327, 1, 0, 0, 1, 1,
-0.4438674, 0.6659395, 0.1544906, 1, 0, 0, 1, 1,
-0.4435443, 0.4144734, -1.637938, 1, 0, 0, 1, 1,
-0.4431789, -0.468412, -1.692194, 1, 0, 0, 1, 1,
-0.4424109, -1.125403, -0.3463333, 1, 0, 0, 1, 1,
-0.4404636, 0.8621106, 0.4069265, 0, 0, 0, 1, 1,
-0.4357786, 0.1927423, -0.03287232, 0, 0, 0, 1, 1,
-0.4350348, 0.9170482, -0.365958, 0, 0, 0, 1, 1,
-0.4327391, -0.05364487, -1.129958, 0, 0, 0, 1, 1,
-0.4319523, 0.6745183, -0.7946121, 0, 0, 0, 1, 1,
-0.4314286, 2.382757, -0.397078, 0, 0, 0, 1, 1,
-0.4278267, -0.861529, -2.271313, 0, 0, 0, 1, 1,
-0.4267085, -0.2861078, -2.274863, 1, 1, 1, 1, 1,
-0.4244741, 1.109361, 1.379137, 1, 1, 1, 1, 1,
-0.4129479, -0.7284813, -2.505344, 1, 1, 1, 1, 1,
-0.4111604, 0.08826639, -0.6096772, 1, 1, 1, 1, 1,
-0.4081858, -0.7287022, -2.776676, 1, 1, 1, 1, 1,
-0.4072881, -1.310802, -4.254183, 1, 1, 1, 1, 1,
-0.4064831, -0.661126, -3.144435, 1, 1, 1, 1, 1,
-0.3982753, 1.135206, 0.6857468, 1, 1, 1, 1, 1,
-0.394718, 1.089368, -2.539243, 1, 1, 1, 1, 1,
-0.3874575, 0.6220885, -1.034433, 1, 1, 1, 1, 1,
-0.3861092, -0.5753283, -3.311958, 1, 1, 1, 1, 1,
-0.3859259, 0.1448304, -0.6917626, 1, 1, 1, 1, 1,
-0.381009, -0.639891, -2.205345, 1, 1, 1, 1, 1,
-0.3762254, -1.042758, -3.416839, 1, 1, 1, 1, 1,
-0.3759665, -0.1385709, -1.017469, 1, 1, 1, 1, 1,
-0.3737508, 1.323812, -0.6747245, 0, 0, 1, 1, 1,
-0.3725717, -0.5780268, -2.502135, 1, 0, 0, 1, 1,
-0.3716967, -1.475841, -3.186851, 1, 0, 0, 1, 1,
-0.3694741, -2.660893, -3.646159, 1, 0, 0, 1, 1,
-0.3694522, -0.757423, -2.358166, 1, 0, 0, 1, 1,
-0.3685854, -1.857539, -1.372751, 1, 0, 0, 1, 1,
-0.3684528, -0.395004, -2.128293, 0, 0, 0, 1, 1,
-0.3678263, -0.3021833, -0.5114829, 0, 0, 0, 1, 1,
-0.363171, 0.3242225, -2.297306, 0, 0, 0, 1, 1,
-0.3625359, 0.3735089, 0.231494, 0, 0, 0, 1, 1,
-0.3594572, -0.586453, -2.530042, 0, 0, 0, 1, 1,
-0.3555987, -1.403989, -3.06458, 0, 0, 0, 1, 1,
-0.3532668, 0.01236248, -2.509426, 0, 0, 0, 1, 1,
-0.3532333, 1.61322, -0.1280592, 1, 1, 1, 1, 1,
-0.3529768, 0.4846929, -0.5919591, 1, 1, 1, 1, 1,
-0.3500183, 0.7352229, 0.5409315, 1, 1, 1, 1, 1,
-0.3495795, -0.8716105, -2.335223, 1, 1, 1, 1, 1,
-0.3487825, -0.2485089, -3.080791, 1, 1, 1, 1, 1,
-0.3482739, -0.5155731, -1.9436, 1, 1, 1, 1, 1,
-0.3452643, -1.06779, -2.179002, 1, 1, 1, 1, 1,
-0.3437714, 0.2329887, -1.531566, 1, 1, 1, 1, 1,
-0.3375638, 0.8819953, 1.596976, 1, 1, 1, 1, 1,
-0.33678, -0.2711504, -2.31676, 1, 1, 1, 1, 1,
-0.3359124, -0.7138996, -2.703461, 1, 1, 1, 1, 1,
-0.3248302, 1.525031, 0.1436036, 1, 1, 1, 1, 1,
-0.3245144, -0.08296207, -2.117656, 1, 1, 1, 1, 1,
-0.3218524, 0.6270028, -1.233679, 1, 1, 1, 1, 1,
-0.3201452, 0.8702691, -1.848144, 1, 1, 1, 1, 1,
-0.3200581, 0.01783422, -2.48399, 0, 0, 1, 1, 1,
-0.3193807, 0.474341, -1.336543, 1, 0, 0, 1, 1,
-0.3181872, -0.7981162, -2.444741, 1, 0, 0, 1, 1,
-0.3178148, 1.150349, -1.576924, 1, 0, 0, 1, 1,
-0.3169632, -2.211257, -1.621595, 1, 0, 0, 1, 1,
-0.3155838, 0.7918785, -1.14404, 1, 0, 0, 1, 1,
-0.3139249, -0.04945225, -1.707523, 0, 0, 0, 1, 1,
-0.3107446, 0.1162528, -1.588621, 0, 0, 0, 1, 1,
-0.3101798, -0.05158563, -2.306738, 0, 0, 0, 1, 1,
-0.3064084, -0.08152796, -2.782815, 0, 0, 0, 1, 1,
-0.3034071, -0.184165, -2.767378, 0, 0, 0, 1, 1,
-0.3032391, 0.8589548, -0.192687, 0, 0, 0, 1, 1,
-0.3009778, -0.713701, -2.818309, 0, 0, 0, 1, 1,
-0.2992828, -0.02845638, -2.865614, 1, 1, 1, 1, 1,
-0.2986669, -1.209296, -5.060542, 1, 1, 1, 1, 1,
-0.294406, 3.148125, -1.113096, 1, 1, 1, 1, 1,
-0.2921333, -1.191394, -3.310277, 1, 1, 1, 1, 1,
-0.2857119, 0.5939826, 1.219481, 1, 1, 1, 1, 1,
-0.2833333, -0.3639346, -3.678671, 1, 1, 1, 1, 1,
-0.2831012, -0.5859807, -2.756051, 1, 1, 1, 1, 1,
-0.282636, -0.939761, -4.403169, 1, 1, 1, 1, 1,
-0.2811223, -0.8859946, -3.76008, 1, 1, 1, 1, 1,
-0.2759019, -0.2428349, -1.553305, 1, 1, 1, 1, 1,
-0.2718673, -1.201019, -3.412855, 1, 1, 1, 1, 1,
-0.2705321, 0.1006773, -2.65943, 1, 1, 1, 1, 1,
-0.2703675, -1.685009, -3.40422, 1, 1, 1, 1, 1,
-0.2660588, 0.1441108, 0.08998384, 1, 1, 1, 1, 1,
-0.2651869, -0.07143853, -1.978102, 1, 1, 1, 1, 1,
-0.2578094, 0.6424958, -1.383274, 0, 0, 1, 1, 1,
-0.2436101, 0.2508429, -0.6555041, 1, 0, 0, 1, 1,
-0.2395314, 1.254985, -0.6998528, 1, 0, 0, 1, 1,
-0.2387478, 0.4133223, -1.710229, 1, 0, 0, 1, 1,
-0.2379446, -1.254905, -3.604074, 1, 0, 0, 1, 1,
-0.2379029, -0.2954974, -2.94597, 1, 0, 0, 1, 1,
-0.2371726, 1.392846, 0.4754564, 0, 0, 0, 1, 1,
-0.2307435, -0.715463, -3.368505, 0, 0, 0, 1, 1,
-0.2230657, -1.526173, -4.634404, 0, 0, 0, 1, 1,
-0.2177861, -0.2369259, -1.638014, 0, 0, 0, 1, 1,
-0.2176709, 0.8245456, -0.6175194, 0, 0, 0, 1, 1,
-0.2155085, 0.364225, -1.340041, 0, 0, 0, 1, 1,
-0.2139178, 0.004810879, -2.914989, 0, 0, 0, 1, 1,
-0.2124723, 0.2206949, -1.199788, 1, 1, 1, 1, 1,
-0.2078685, -0.9407778, -3.401672, 1, 1, 1, 1, 1,
-0.2052241, 0.09171327, -1.094228, 1, 1, 1, 1, 1,
-0.2050847, -1.851551, -3.918749, 1, 1, 1, 1, 1,
-0.2046845, 1.545704, 0.3115765, 1, 1, 1, 1, 1,
-0.2015752, 1.010684, -0.4938912, 1, 1, 1, 1, 1,
-0.1946615, -0.3885374, -2.035246, 1, 1, 1, 1, 1,
-0.1946233, 0.8294411, -1.673526, 1, 1, 1, 1, 1,
-0.1919591, -1.010616, -2.296496, 1, 1, 1, 1, 1,
-0.1843697, -1.78788, -3.808761, 1, 1, 1, 1, 1,
-0.1818574, -0.4908673, -3.771338, 1, 1, 1, 1, 1,
-0.1813852, 0.3867233, -1.106897, 1, 1, 1, 1, 1,
-0.1782682, 0.6897321, 0.3284024, 1, 1, 1, 1, 1,
-0.1766741, 0.2195125, -0.9912543, 1, 1, 1, 1, 1,
-0.1764373, -1.8436, -2.19566, 1, 1, 1, 1, 1,
-0.1725266, -2.468692, -2.899443, 0, 0, 1, 1, 1,
-0.1717792, 1.288815, -2.090889, 1, 0, 0, 1, 1,
-0.169166, -0.8114049, -3.84583, 1, 0, 0, 1, 1,
-0.16644, 0.4087636, -1.408544, 1, 0, 0, 1, 1,
-0.1642607, -1.870697, -3.084364, 1, 0, 0, 1, 1,
-0.1637048, -0.8016666, -2.798505, 1, 0, 0, 1, 1,
-0.157909, -0.12397, -2.470893, 0, 0, 0, 1, 1,
-0.1553843, 2.261383, 0.7019107, 0, 0, 0, 1, 1,
-0.1537295, -0.8395239, -1.793713, 0, 0, 0, 1, 1,
-0.1516879, -0.08371912, -2.145734, 0, 0, 0, 1, 1,
-0.1491142, 0.04260093, -0.3041361, 0, 0, 0, 1, 1,
-0.1490047, -1.148709, -2.616489, 0, 0, 0, 1, 1,
-0.14439, 0.7367988, -0.6741118, 0, 0, 0, 1, 1,
-0.1415329, -1.150942, -3.258693, 1, 1, 1, 1, 1,
-0.1401084, 0.4106069, -1.6251, 1, 1, 1, 1, 1,
-0.1391997, -1.050783, -2.254898, 1, 1, 1, 1, 1,
-0.137186, -0.920241, -4.046887, 1, 1, 1, 1, 1,
-0.136742, -1.79328, -2.11635, 1, 1, 1, 1, 1,
-0.1366728, 0.4846084, -1.052944, 1, 1, 1, 1, 1,
-0.1333005, -0.3859912, -3.327813, 1, 1, 1, 1, 1,
-0.1246374, 2.175719, -1.322242, 1, 1, 1, 1, 1,
-0.1237086, -0.3931423, -1.19548, 1, 1, 1, 1, 1,
-0.1234822, 0.8777873, -0.5149339, 1, 1, 1, 1, 1,
-0.120912, -0.6039736, -2.846703, 1, 1, 1, 1, 1,
-0.1114226, -1.103171, -0.3031701, 1, 1, 1, 1, 1,
-0.1113864, 0.1320951, -1.728489, 1, 1, 1, 1, 1,
-0.1105157, -0.889858, -2.061063, 1, 1, 1, 1, 1,
-0.1072111, 0.1460775, 0.104775, 1, 1, 1, 1, 1,
-0.1071529, -0.01851773, -1.167726, 0, 0, 1, 1, 1,
-0.1058748, -0.005690081, -2.290584, 1, 0, 0, 1, 1,
-0.1038215, 0.5891451, 0.7857326, 1, 0, 0, 1, 1,
-0.102836, 0.4901934, 1.575099, 1, 0, 0, 1, 1,
-0.102743, 0.1420894, 0.08649223, 1, 0, 0, 1, 1,
-0.1014435, -1.431254, -4.355236, 1, 0, 0, 1, 1,
-0.09774955, -0.5220364, -2.161634, 0, 0, 0, 1, 1,
-0.09551752, -0.9538748, -2.87627, 0, 0, 0, 1, 1,
-0.09458718, 1.214569, -0.4849763, 0, 0, 0, 1, 1,
-0.08870659, -0.7714121, -2.296887, 0, 0, 0, 1, 1,
-0.0873523, -0.3623366, -3.324909, 0, 0, 0, 1, 1,
-0.08576335, 1.642679, -1.066036, 0, 0, 0, 1, 1,
-0.08538038, 0.4635699, -0.1277223, 0, 0, 0, 1, 1,
-0.08301834, -1.516967, -2.893543, 1, 1, 1, 1, 1,
-0.08087064, 0.1217122, -1.181957, 1, 1, 1, 1, 1,
-0.07715338, -1.964443, -3.179593, 1, 1, 1, 1, 1,
-0.07475863, 0.8473526, -0.6182356, 1, 1, 1, 1, 1,
-0.0740879, 0.3523647, -0.4787331, 1, 1, 1, 1, 1,
-0.07024916, -1.739159, -5.888511, 1, 1, 1, 1, 1,
-0.06668568, 0.6976221, 0.5050635, 1, 1, 1, 1, 1,
-0.06462029, -0.6340955, -3.623841, 1, 1, 1, 1, 1,
-0.06394853, -0.8336862, -2.917997, 1, 1, 1, 1, 1,
-0.06347375, 0.0812896, -0.0510236, 1, 1, 1, 1, 1,
-0.05546874, -1.382413, -4.774155, 1, 1, 1, 1, 1,
-0.05532776, 0.8931485, -0.3260149, 1, 1, 1, 1, 1,
-0.0543486, 1.208211, -0.9851453, 1, 1, 1, 1, 1,
-0.05393998, 1.669167, 0.9394696, 1, 1, 1, 1, 1,
-0.05304352, 1.009253, -1.546784, 1, 1, 1, 1, 1,
-0.05175815, -0.2142416, -3.216077, 0, 0, 1, 1, 1,
-0.05116376, -0.03662676, -4.077228, 1, 0, 0, 1, 1,
-0.05047556, -0.5715231, -2.842006, 1, 0, 0, 1, 1,
-0.05028992, -1.15967, -2.487216, 1, 0, 0, 1, 1,
-0.04846565, 1.292649, 0.1516909, 1, 0, 0, 1, 1,
-0.04323468, -1.365356, -2.326833, 1, 0, 0, 1, 1,
-0.0428418, 0.9699575, -0.3368986, 0, 0, 0, 1, 1,
-0.04065443, 0.989767, 0.2156773, 0, 0, 0, 1, 1,
-0.03774426, 0.3961508, -0.673258, 0, 0, 0, 1, 1,
-0.03402292, -0.9726226, -2.929818, 0, 0, 0, 1, 1,
-0.02833955, 0.2689831, -1.204318, 0, 0, 0, 1, 1,
-0.02767362, -0.8819233, -3.616146, 0, 0, 0, 1, 1,
-0.02366045, -1.563673, -3.596116, 0, 0, 0, 1, 1,
-0.02261427, 0.1087077, -0.2014982, 1, 1, 1, 1, 1,
-0.02034443, 2.061703, 0.6519387, 1, 1, 1, 1, 1,
-0.01929605, 0.825505, -0.8536382, 1, 1, 1, 1, 1,
-0.01277343, -1.39501, -3.317347, 1, 1, 1, 1, 1,
-0.01235477, 2.05794, 0.01978851, 1, 1, 1, 1, 1,
-0.01064612, -1.566938, -3.64304, 1, 1, 1, 1, 1,
-0.01032962, -1.098857, -2.6705, 1, 1, 1, 1, 1,
-0.002952666, 0.2830782, -0.8501001, 1, 1, 1, 1, 1,
-0.002597587, 1.421773, 0.5249559, 1, 1, 1, 1, 1,
-0.001010664, 0.3574479, -0.4610702, 1, 1, 1, 1, 1,
0.003848496, 1.620518, -0.5466545, 1, 1, 1, 1, 1,
0.006195159, 1.575115, -0.8313345, 1, 1, 1, 1, 1,
0.009593611, -0.6368873, 2.144971, 1, 1, 1, 1, 1,
0.01672927, 0.6738442, 1.713465, 1, 1, 1, 1, 1,
0.0197534, -0.01594585, 0.8892583, 1, 1, 1, 1, 1,
0.02007508, 2.049138, -1.283325, 0, 0, 1, 1, 1,
0.02030607, 0.747875, 0.09345642, 1, 0, 0, 1, 1,
0.0212246, 1.081192, 0.6091034, 1, 0, 0, 1, 1,
0.02457196, -1.106582, 1.67172, 1, 0, 0, 1, 1,
0.0264047, -0.06748509, 3.670809, 1, 0, 0, 1, 1,
0.02866211, -0.59727, 2.722569, 1, 0, 0, 1, 1,
0.02907937, -0.8312439, 2.425503, 0, 0, 0, 1, 1,
0.03122226, 0.6815822, 1.523325, 0, 0, 0, 1, 1,
0.03387205, -0.3730949, 3.720829, 0, 0, 0, 1, 1,
0.0341209, -0.5797131, 2.835457, 0, 0, 0, 1, 1,
0.03476411, -0.37126, 2.066221, 0, 0, 0, 1, 1,
0.04403177, 0.1261384, -0.8549849, 0, 0, 0, 1, 1,
0.04499372, -0.4368176, 3.213074, 0, 0, 0, 1, 1,
0.04504487, 0.5916729, -0.3363667, 1, 1, 1, 1, 1,
0.04775918, -0.3634027, 4.200263, 1, 1, 1, 1, 1,
0.04843609, 0.2290544, -0.8052893, 1, 1, 1, 1, 1,
0.04989162, -0.5907702, 2.583562, 1, 1, 1, 1, 1,
0.05080566, 0.2767718, -2.079463, 1, 1, 1, 1, 1,
0.05277993, -0.02126717, 1.848113, 1, 1, 1, 1, 1,
0.05345674, -1.286414, 3.209734, 1, 1, 1, 1, 1,
0.05349841, -0.6070474, 3.522231, 1, 1, 1, 1, 1,
0.05434331, 0.01794066, 1.912211, 1, 1, 1, 1, 1,
0.05789526, 1.811556, -0.9820207, 1, 1, 1, 1, 1,
0.07214667, 0.7991181, -0.07930632, 1, 1, 1, 1, 1,
0.07666138, 0.689234, -0.5125229, 1, 1, 1, 1, 1,
0.07815238, -0.7406884, 1.063325, 1, 1, 1, 1, 1,
0.0812917, -0.3009141, 4.908132, 1, 1, 1, 1, 1,
0.08160572, -0.4985443, 2.750463, 1, 1, 1, 1, 1,
0.08175541, -1.150033, 3.298076, 0, 0, 1, 1, 1,
0.08581613, 1.672717, -1.292927, 1, 0, 0, 1, 1,
0.08988425, 0.8827962, 1.750587, 1, 0, 0, 1, 1,
0.09026998, -1.599627, 2.39053, 1, 0, 0, 1, 1,
0.090813, -1.877812, 4.393822, 1, 0, 0, 1, 1,
0.09464766, 1.076621, -0.04412823, 1, 0, 0, 1, 1,
0.0956279, -0.2099333, 2.316607, 0, 0, 0, 1, 1,
0.1040749, 1.531806, 0.3333704, 0, 0, 0, 1, 1,
0.1059195, 0.7255858, -0.5889034, 0, 0, 0, 1, 1,
0.1194024, -1.664838, 1.725502, 0, 0, 0, 1, 1,
0.1217836, -0.07334866, 1.738213, 0, 0, 0, 1, 1,
0.1223359, -0.3290596, 2.57197, 0, 0, 0, 1, 1,
0.1232085, 1.36382, -0.3365466, 0, 0, 0, 1, 1,
0.1258071, -1.530816, 1.7602, 1, 1, 1, 1, 1,
0.1280447, 0.08910285, 1.360055, 1, 1, 1, 1, 1,
0.1297407, 0.8780491, 0.1588473, 1, 1, 1, 1, 1,
0.1335928, 0.3289271, -0.6088322, 1, 1, 1, 1, 1,
0.1343974, -0.4869516, 3.389702, 1, 1, 1, 1, 1,
0.1344279, 1.502333, -1.320717, 1, 1, 1, 1, 1,
0.136947, 0.4445718, -0.568066, 1, 1, 1, 1, 1,
0.1397572, 1.937585, 0.6625823, 1, 1, 1, 1, 1,
0.1410175, -0.1627229, 1.448445, 1, 1, 1, 1, 1,
0.1456333, -0.6021432, 2.776954, 1, 1, 1, 1, 1,
0.1458224, -1.72547, 1.376258, 1, 1, 1, 1, 1,
0.1466615, 1.716565, -0.3642476, 1, 1, 1, 1, 1,
0.147547, -0.9105209, 1.60589, 1, 1, 1, 1, 1,
0.1495024, 0.3033734, 0.904682, 1, 1, 1, 1, 1,
0.1514896, -1.082699, 3.673283, 1, 1, 1, 1, 1,
0.1527001, 0.09468084, -0.9130393, 0, 0, 1, 1, 1,
0.1535927, 0.5907221, 1.888941, 1, 0, 0, 1, 1,
0.1605969, -1.218248, 2.923493, 1, 0, 0, 1, 1,
0.1614841, 0.06191187, 0.5623813, 1, 0, 0, 1, 1,
0.1642959, 2.133202, 3.112952, 1, 0, 0, 1, 1,
0.1701547, -0.9138721, 1.666835, 1, 0, 0, 1, 1,
0.1705877, 0.1598709, 0.5602869, 0, 0, 0, 1, 1,
0.1724883, 1.319042, -0.2230065, 0, 0, 0, 1, 1,
0.173368, -1.167902, 4.782459, 0, 0, 0, 1, 1,
0.1744937, -1.753994, 2.143868, 0, 0, 0, 1, 1,
0.178085, -0.4082066, 3.149399, 0, 0, 0, 1, 1,
0.1789863, -0.2895102, 1.996518, 0, 0, 0, 1, 1,
0.1828973, 0.1824754, 1.520776, 0, 0, 0, 1, 1,
0.1834576, 0.7875849, 2.134398, 1, 1, 1, 1, 1,
0.188798, 0.6725518, 0.5370754, 1, 1, 1, 1, 1,
0.193966, 0.9739039, 0.1223861, 1, 1, 1, 1, 1,
0.1946937, -0.677048, 3.215459, 1, 1, 1, 1, 1,
0.1981769, -0.7214726, 3.424857, 1, 1, 1, 1, 1,
0.1994291, -0.1686522, 2.190395, 1, 1, 1, 1, 1,
0.2104725, 0.2836808, 0.6617679, 1, 1, 1, 1, 1,
0.2136046, 0.3097023, 1.959522, 1, 1, 1, 1, 1,
0.215954, 1.262408, 2.01508, 1, 1, 1, 1, 1,
0.2220244, 1.364393, 0.08848464, 1, 1, 1, 1, 1,
0.2236967, -0.38315, 2.561799, 1, 1, 1, 1, 1,
0.2268172, 1.115093, -0.7842825, 1, 1, 1, 1, 1,
0.227352, -0.6675726, 2.349089, 1, 1, 1, 1, 1,
0.2280022, 1.66604, 0.166789, 1, 1, 1, 1, 1,
0.2288518, 2.359303, -1.00796, 1, 1, 1, 1, 1,
0.2301361, 0.7439766, 0.7423198, 0, 0, 1, 1, 1,
0.2327892, -0.5246671, 2.638611, 1, 0, 0, 1, 1,
0.2341157, -0.180685, 1.411296, 1, 0, 0, 1, 1,
0.2405296, -0.3546046, 1.038468, 1, 0, 0, 1, 1,
0.2444687, 0.6964257, -0.2253445, 1, 0, 0, 1, 1,
0.2460623, 0.3885255, 1.225094, 1, 0, 0, 1, 1,
0.2483659, 0.7482179, -0.2057342, 0, 0, 0, 1, 1,
0.2491495, 0.196064, 0.4254658, 0, 0, 0, 1, 1,
0.2533398, 2.047141, 2.35484, 0, 0, 0, 1, 1,
0.2568886, -0.1419025, 2.113428, 0, 0, 0, 1, 1,
0.2640638, -0.3937563, 1.695099, 0, 0, 0, 1, 1,
0.2718269, -0.6050608, 3.066012, 0, 0, 0, 1, 1,
0.2769162, 0.01072542, 1.390082, 0, 0, 0, 1, 1,
0.2783601, -1.466714, 2.42445, 1, 1, 1, 1, 1,
0.2798625, -0.07117691, 1.189002, 1, 1, 1, 1, 1,
0.2822559, -1.075886, 2.167304, 1, 1, 1, 1, 1,
0.2839184, 0.2218106, 0.7068781, 1, 1, 1, 1, 1,
0.2876598, -1.466658, 2.109487, 1, 1, 1, 1, 1,
0.2887716, 0.4472973, 1.458097, 1, 1, 1, 1, 1,
0.2957667, -2.032506, 5.049139, 1, 1, 1, 1, 1,
0.298692, -1.399052, 0.4778608, 1, 1, 1, 1, 1,
0.3036325, -0.07679747, 2.593713, 1, 1, 1, 1, 1,
0.3094057, -0.4472436, 3.73569, 1, 1, 1, 1, 1,
0.3128094, 0.9951199, -0.7015756, 1, 1, 1, 1, 1,
0.3174238, -0.597244, 1.462918, 1, 1, 1, 1, 1,
0.3182545, -1.609556, 4.082548, 1, 1, 1, 1, 1,
0.3198977, -1.857306, 4.088698, 1, 1, 1, 1, 1,
0.3216988, -0.3532389, 2.576952, 1, 1, 1, 1, 1,
0.3304842, -1.647017, 2.510691, 0, 0, 1, 1, 1,
0.332527, 1.098708, -0.2571841, 1, 0, 0, 1, 1,
0.3374255, 1.361241, 0.4695578, 1, 0, 0, 1, 1,
0.3386078, -0.01358628, 0.5253844, 1, 0, 0, 1, 1,
0.3442044, 1.036024, 1.241838, 1, 0, 0, 1, 1,
0.3451741, -0.4150951, 1.696106, 1, 0, 0, 1, 1,
0.3455704, 0.8653246, -0.4814366, 0, 0, 0, 1, 1,
0.3466935, 0.299463, 0.1953021, 0, 0, 0, 1, 1,
0.3473943, 0.5029327, 0.6393921, 0, 0, 0, 1, 1,
0.3503288, 1.566806, -0.4377903, 0, 0, 0, 1, 1,
0.3512402, -0.0426368, 0.5968051, 0, 0, 0, 1, 1,
0.3550867, 0.3741058, -0.2018146, 0, 0, 0, 1, 1,
0.3571584, 0.2850654, 1.795437, 0, 0, 0, 1, 1,
0.3600325, -0.5241106, 1.907163, 1, 1, 1, 1, 1,
0.3715602, -0.1550925, 1.274455, 1, 1, 1, 1, 1,
0.3751757, 0.2305476, 0.7430694, 1, 1, 1, 1, 1,
0.3804062, -1.240228, 2.859701, 1, 1, 1, 1, 1,
0.3821872, -0.371132, 2.442814, 1, 1, 1, 1, 1,
0.3830804, 1.168068, -1.461876, 1, 1, 1, 1, 1,
0.3909441, 0.7894517, 1.203827, 1, 1, 1, 1, 1,
0.398048, 0.2623576, 0.2973172, 1, 1, 1, 1, 1,
0.3986369, -0.08044609, -0.1135604, 1, 1, 1, 1, 1,
0.4044039, 1.435307, 0.1526736, 1, 1, 1, 1, 1,
0.4082934, -0.3601894, 3.307533, 1, 1, 1, 1, 1,
0.409485, 0.6788231, -0.307819, 1, 1, 1, 1, 1,
0.4098676, 1.814736, -0.2489571, 1, 1, 1, 1, 1,
0.4107794, 0.8133206, 1.068886, 1, 1, 1, 1, 1,
0.4153779, 1.538028, -0.9216714, 1, 1, 1, 1, 1,
0.4193021, 1.115083, 1.519741, 0, 0, 1, 1, 1,
0.4219722, 0.2433594, 0.4556839, 1, 0, 0, 1, 1,
0.4248864, -1.086615, 2.122323, 1, 0, 0, 1, 1,
0.4271376, -1.360535, 0.9869227, 1, 0, 0, 1, 1,
0.4370928, 0.2419476, 1.883259, 1, 0, 0, 1, 1,
0.4378596, 1.389103, 0.7698559, 1, 0, 0, 1, 1,
0.4426317, -0.3093275, 1.433324, 0, 0, 0, 1, 1,
0.4443662, -0.4019141, 1.956921, 0, 0, 0, 1, 1,
0.4520663, 0.4249207, -0.5405471, 0, 0, 0, 1, 1,
0.4520788, -1.336778, 1.334115, 0, 0, 0, 1, 1,
0.4547772, 0.01659658, 1.311397, 0, 0, 0, 1, 1,
0.456131, 0.5912861, 0.9884229, 0, 0, 0, 1, 1,
0.4641895, -1.744725, 4.083396, 0, 0, 0, 1, 1,
0.4780024, 1.725307, 0.1766848, 1, 1, 1, 1, 1,
0.4834726, -1.008465, 1.330176, 1, 1, 1, 1, 1,
0.4842323, -0.2207358, 2.737944, 1, 1, 1, 1, 1,
0.4911015, 0.9100843, 0.1880044, 1, 1, 1, 1, 1,
0.492478, 1.173118, -0.3787749, 1, 1, 1, 1, 1,
0.4956875, 1.012043, -0.6861059, 1, 1, 1, 1, 1,
0.4995312, 1.425263, -0.3200072, 1, 1, 1, 1, 1,
0.5010128, 0.7397794, 1.322454, 1, 1, 1, 1, 1,
0.5043561, -0.2489393, 2.276292, 1, 1, 1, 1, 1,
0.5045324, 0.2643831, 1.907891, 1, 1, 1, 1, 1,
0.5058988, 1.023981, 0.4107742, 1, 1, 1, 1, 1,
0.5092816, -0.4459346, 2.972781, 1, 1, 1, 1, 1,
0.5113037, -1.157236, 1.879419, 1, 1, 1, 1, 1,
0.5116901, -0.9041138, 4.187668, 1, 1, 1, 1, 1,
0.5129404, -0.5999117, 2.871962, 1, 1, 1, 1, 1,
0.516087, -1.632429, 3.62874, 0, 0, 1, 1, 1,
0.5203214, -1.299922, 2.023264, 1, 0, 0, 1, 1,
0.5236771, -0.08199273, 0.8003244, 1, 0, 0, 1, 1,
0.5263739, -1.036957, 2.43391, 1, 0, 0, 1, 1,
0.5264319, -0.6967602, 3.297741, 1, 0, 0, 1, 1,
0.5275607, -0.4370764, 2.254936, 1, 0, 0, 1, 1,
0.5294238, -1.007297, 2.757861, 0, 0, 0, 1, 1,
0.5294974, -0.8901803, 2.472456, 0, 0, 0, 1, 1,
0.5296003, -0.3045333, 2.270014, 0, 0, 0, 1, 1,
0.5301453, 1.901423, -0.07482373, 0, 0, 0, 1, 1,
0.533315, 0.3196619, 1.684148, 0, 0, 0, 1, 1,
0.5382043, 0.6541911, 0.9675978, 0, 0, 0, 1, 1,
0.5409734, 0.316412, -0.1944425, 0, 0, 0, 1, 1,
0.5524844, -1.166014, 3.478036, 1, 1, 1, 1, 1,
0.558956, -0.3365988, 2.281965, 1, 1, 1, 1, 1,
0.5602381, 0.4348223, 1.062366, 1, 1, 1, 1, 1,
0.5607891, 0.683558, -0.6281736, 1, 1, 1, 1, 1,
0.5658128, -1.102859, 1.677931, 1, 1, 1, 1, 1,
0.5712763, 0.5378496, -0.2035247, 1, 1, 1, 1, 1,
0.5720433, 0.1729172, 1.459098, 1, 1, 1, 1, 1,
0.576142, 0.4163787, 0.5963013, 1, 1, 1, 1, 1,
0.5785636, 0.01545943, 3.09594, 1, 1, 1, 1, 1,
0.5810884, 0.7401872, 0.5080221, 1, 1, 1, 1, 1,
0.5827431, -0.6581904, 4.221077, 1, 1, 1, 1, 1,
0.5838856, -0.1240756, 2.45357, 1, 1, 1, 1, 1,
0.5876025, 1.724019, 1.865632, 1, 1, 1, 1, 1,
0.5886882, 1.040859, 0.6280137, 1, 1, 1, 1, 1,
0.5902165, 0.1504787, 3.114665, 1, 1, 1, 1, 1,
0.5972985, -0.1234284, 2.798159, 0, 0, 1, 1, 1,
0.5973592, 0.8043385, 1.976786, 1, 0, 0, 1, 1,
0.5974209, 1.53321, -0.5326105, 1, 0, 0, 1, 1,
0.5980762, -0.08938833, 2.995097, 1, 0, 0, 1, 1,
0.598499, -0.07052619, 1.967797, 1, 0, 0, 1, 1,
0.6010921, -1.371587, 2.870165, 1, 0, 0, 1, 1,
0.6014536, -1.676602, 3.653636, 0, 0, 0, 1, 1,
0.604179, 0.8984403, 0.1082384, 0, 0, 0, 1, 1,
0.6043941, -0.6502793, 0.6512069, 0, 0, 0, 1, 1,
0.6057708, 0.4512264, -0.4267607, 0, 0, 0, 1, 1,
0.6090679, -0.7071404, 2.523958, 0, 0, 0, 1, 1,
0.6135358, 0.2267113, 2.124381, 0, 0, 0, 1, 1,
0.6200866, -1.332408, 2.66113, 0, 0, 0, 1, 1,
0.6212828, 1.594493, -0.8402407, 1, 1, 1, 1, 1,
0.6237916, -0.3709414, 0.9986721, 1, 1, 1, 1, 1,
0.6247788, -0.7030199, 3.075533, 1, 1, 1, 1, 1,
0.6292921, -1.547734, 2.473396, 1, 1, 1, 1, 1,
0.6293377, -0.02922777, 0.4262537, 1, 1, 1, 1, 1,
0.6318923, -0.2549083, 2.658844, 1, 1, 1, 1, 1,
0.634359, -0.2433586, 3.015762, 1, 1, 1, 1, 1,
0.6501644, 0.3385441, 1.624817, 1, 1, 1, 1, 1,
0.6559401, -2.012655, 4.350357, 1, 1, 1, 1, 1,
0.6559618, 0.2994694, 1.423539, 1, 1, 1, 1, 1,
0.6642357, -0.9895576, 3.556626, 1, 1, 1, 1, 1,
0.6661065, -0.5511366, 1.572249, 1, 1, 1, 1, 1,
0.6683362, 0.03091643, 1.168043, 1, 1, 1, 1, 1,
0.6697934, -0.7281835, 1.318774, 1, 1, 1, 1, 1,
0.6700611, 0.01707937, 1.143631, 1, 1, 1, 1, 1,
0.6719922, 0.1008735, 2.234642, 0, 0, 1, 1, 1,
0.6723487, 1.2566, 2.651547, 1, 0, 0, 1, 1,
0.6724785, -0.5141041, 4.068513, 1, 0, 0, 1, 1,
0.6736048, -0.4496701, 2.463214, 1, 0, 0, 1, 1,
0.6739269, -0.05530913, 1.347933, 1, 0, 0, 1, 1,
0.6768913, 1.147794, -1.423307, 1, 0, 0, 1, 1,
0.6793581, 0.6610532, 0.4680378, 0, 0, 0, 1, 1,
0.68334, 1.178364, 1.612856, 0, 0, 0, 1, 1,
0.6871937, -1.690846, 3.095716, 0, 0, 0, 1, 1,
0.6945082, -0.3475295, 1.970543, 0, 0, 0, 1, 1,
0.6966504, -0.6742067, 0.7068865, 0, 0, 0, 1, 1,
0.6978139, 1.517005, 0.6422236, 0, 0, 0, 1, 1,
0.7072605, -0.08219054, 2.419735, 0, 0, 0, 1, 1,
0.7134022, 0.777231, 1.986647, 1, 1, 1, 1, 1,
0.7156525, 0.4306819, 0.3335975, 1, 1, 1, 1, 1,
0.717539, -0.007839816, 1.735799, 1, 1, 1, 1, 1,
0.7183498, 0.2574357, 2.63395, 1, 1, 1, 1, 1,
0.7243434, -2.042754, 2.532374, 1, 1, 1, 1, 1,
0.7312627, 0.6673133, 2.399958, 1, 1, 1, 1, 1,
0.7354429, 0.3875883, 1.243075, 1, 1, 1, 1, 1,
0.7412776, -0.9396286, 2.510535, 1, 1, 1, 1, 1,
0.7434614, -0.1232262, 2.31848, 1, 1, 1, 1, 1,
0.7440938, 0.8332535, -0.02454121, 1, 1, 1, 1, 1,
0.74452, 1.11502, 1.619704, 1, 1, 1, 1, 1,
0.7530771, 0.4636725, 0.9466397, 1, 1, 1, 1, 1,
0.7533869, -0.03649085, 3.067436, 1, 1, 1, 1, 1,
0.7546834, 1.490265, -0.840348, 1, 1, 1, 1, 1,
0.7612558, -0.2473938, 1.154679, 1, 1, 1, 1, 1,
0.7634988, 0.3976283, 1.511447, 0, 0, 1, 1, 1,
0.7720704, 1.956721, 1.001717, 1, 0, 0, 1, 1,
0.7736093, -0.3509177, 2.848408, 1, 0, 0, 1, 1,
0.7750521, 0.2963805, 0.7572922, 1, 0, 0, 1, 1,
0.7825809, -1.146766, 2.46709, 1, 0, 0, 1, 1,
0.7897983, -0.2392033, 1.367461, 1, 0, 0, 1, 1,
0.7919231, -1.461062, 3.573063, 0, 0, 0, 1, 1,
0.7931437, -0.5385067, 1.854277, 0, 0, 0, 1, 1,
0.7972614, -2.636665, 4.299793, 0, 0, 0, 1, 1,
0.8216202, 0.6905315, 2.149885, 0, 0, 0, 1, 1,
0.8242772, 0.8372506, 1.61143, 0, 0, 0, 1, 1,
0.8259091, -0.5301523, 2.17362, 0, 0, 0, 1, 1,
0.8288251, -0.2215926, 2.858206, 0, 0, 0, 1, 1,
0.8318735, 1.747586, 0.6402514, 1, 1, 1, 1, 1,
0.8350891, 0.156611, 2.537376, 1, 1, 1, 1, 1,
0.8506793, -0.8650606, 2.600559, 1, 1, 1, 1, 1,
0.8511575, -0.926283, 1.599, 1, 1, 1, 1, 1,
0.8517011, 0.4797707, 1.105821, 1, 1, 1, 1, 1,
0.8525939, 0.8773762, 1.598798, 1, 1, 1, 1, 1,
0.8548316, -0.499145, 3.537072, 1, 1, 1, 1, 1,
0.8590268, 1.039589, 0.8731721, 1, 1, 1, 1, 1,
0.8593031, 0.08171429, 1.036356, 1, 1, 1, 1, 1,
0.8779133, 0.607911, 1.199163, 1, 1, 1, 1, 1,
0.8783351, 0.09012407, 1.456281, 1, 1, 1, 1, 1,
0.8797281, 0.3113198, 1.569824, 1, 1, 1, 1, 1,
0.8801808, 0.3054343, 0.1824141, 1, 1, 1, 1, 1,
0.8812472, -0.6622673, 2.780721, 1, 1, 1, 1, 1,
0.8832485, -0.2369688, 3.868702, 1, 1, 1, 1, 1,
0.8840215, 1.323056, 1.78353, 0, 0, 1, 1, 1,
0.8844468, -0.103299, 0.5046754, 1, 0, 0, 1, 1,
0.8876062, 0.3122469, 3.06291, 1, 0, 0, 1, 1,
0.8893065, 2.24007, -0.05183284, 1, 0, 0, 1, 1,
0.8932388, -0.3625666, 3.367637, 1, 0, 0, 1, 1,
0.8972107, -0.1547659, 2.004624, 1, 0, 0, 1, 1,
0.8995481, -0.9041705, 3.304881, 0, 0, 0, 1, 1,
0.9045498, -0.0905287, 1.543626, 0, 0, 0, 1, 1,
0.9095274, -1.556453, 1.664241, 0, 0, 0, 1, 1,
0.9097112, 0.4100418, 1.169722, 0, 0, 0, 1, 1,
0.917833, -0.05891399, 1.860743, 0, 0, 0, 1, 1,
0.9194027, -0.2097179, 1.05316, 0, 0, 0, 1, 1,
0.9225355, 1.82849, -0.5722243, 0, 0, 0, 1, 1,
0.925452, 0.4418053, 3.119542, 1, 1, 1, 1, 1,
0.9261013, 1.667498, 1.691092, 1, 1, 1, 1, 1,
0.9274324, -0.5874554, 3.104512, 1, 1, 1, 1, 1,
0.9290408, -0.6976399, 4.108501, 1, 1, 1, 1, 1,
0.9323972, 0.0121459, 3.171467, 1, 1, 1, 1, 1,
0.9348761, -0.4093625, 1.108209, 1, 1, 1, 1, 1,
0.9351866, -0.2788642, 1.997213, 1, 1, 1, 1, 1,
0.9391806, 1.683658, 2.088805, 1, 1, 1, 1, 1,
0.9461679, 0.409334, -0.3768646, 1, 1, 1, 1, 1,
0.9464838, -1.190064, 2.850181, 1, 1, 1, 1, 1,
0.9485884, -1.504806, 2.025394, 1, 1, 1, 1, 1,
0.9744039, -0.2415814, 2.17731, 1, 1, 1, 1, 1,
0.975433, -0.9497277, 1.637746, 1, 1, 1, 1, 1,
0.9850773, 0.2982998, -0.2897027, 1, 1, 1, 1, 1,
0.9870465, 1.298307, 0.8024926, 1, 1, 1, 1, 1,
0.9874591, 0.2703153, -0.1311294, 0, 0, 1, 1, 1,
0.9913946, -0.9469634, 1.65711, 1, 0, 0, 1, 1,
0.9930761, -0.04507186, -0.1784882, 1, 0, 0, 1, 1,
0.9939113, -2.25714, 3.820697, 1, 0, 0, 1, 1,
0.9957507, 1.194941, 1.003216, 1, 0, 0, 1, 1,
1.000247, 0.3320158, 1.082885, 1, 0, 0, 1, 1,
1.000739, -0.4563303, 2.330485, 0, 0, 0, 1, 1,
1.004789, 0.4408514, 1.734547, 0, 0, 0, 1, 1,
1.005054, -0.9892427, 1.467008, 0, 0, 0, 1, 1,
1.015547, -0.250956, 0.4409129, 0, 0, 0, 1, 1,
1.016404, 1.497568, 0.2792232, 0, 0, 0, 1, 1,
1.02057, -1.036435, 2.430663, 0, 0, 0, 1, 1,
1.02265, -1.152292, 2.221786, 0, 0, 0, 1, 1,
1.0229, -1.671707, 3.731224, 1, 1, 1, 1, 1,
1.025865, -2.053394, 2.412079, 1, 1, 1, 1, 1,
1.033852, 0.5591094, 1.629531, 1, 1, 1, 1, 1,
1.041418, -0.3457603, 2.349538, 1, 1, 1, 1, 1,
1.043852, -0.9240246, 0.2286486, 1, 1, 1, 1, 1,
1.046818, -0.5022662, 2.174623, 1, 1, 1, 1, 1,
1.048072, 0.4694208, 1.906026, 1, 1, 1, 1, 1,
1.049585, -0.07111242, 3.865342, 1, 1, 1, 1, 1,
1.051433, 0.9221998, -1.201329, 1, 1, 1, 1, 1,
1.052148, -0.4279498, 2.832779, 1, 1, 1, 1, 1,
1.052603, 1.041613, -1.46963, 1, 1, 1, 1, 1,
1.055969, 0.5247071, -0.1546596, 1, 1, 1, 1, 1,
1.07082, 0.03273995, 0.8429655, 1, 1, 1, 1, 1,
1.077861, -1.21413, 2.531227, 1, 1, 1, 1, 1,
1.078526, 0.0684547, 1.518574, 1, 1, 1, 1, 1,
1.081744, 0.995531, 0.9682888, 0, 0, 1, 1, 1,
1.087646, 0.149252, 1.720823, 1, 0, 0, 1, 1,
1.092832, 1.787899, 0.4853183, 1, 0, 0, 1, 1,
1.094947, -0.06499649, 2.380386, 1, 0, 0, 1, 1,
1.09567, -0.1203833, -0.146892, 1, 0, 0, 1, 1,
1.100723, -1.344249, 4.061022, 1, 0, 0, 1, 1,
1.111966, -0.7855268, 1.36893, 0, 0, 0, 1, 1,
1.116474, -1.03335, 3.015516, 0, 0, 0, 1, 1,
1.120026, 0.5831358, 1.010387, 0, 0, 0, 1, 1,
1.122067, -1.216184, 3.170664, 0, 0, 0, 1, 1,
1.124899, 0.01694127, 1.556501, 0, 0, 0, 1, 1,
1.124937, 1.398098, 0.949272, 0, 0, 0, 1, 1,
1.127618, -2.123994, 1.028659, 0, 0, 0, 1, 1,
1.12913, -0.01288678, 1.385122, 1, 1, 1, 1, 1,
1.132246, -1.023722, 2.553021, 1, 1, 1, 1, 1,
1.13239, 0.6876842, 1.943869, 1, 1, 1, 1, 1,
1.136265, -2.001176, 2.902229, 1, 1, 1, 1, 1,
1.137283, 0.4402308, 1.404, 1, 1, 1, 1, 1,
1.151266, -1.478019, 1.756003, 1, 1, 1, 1, 1,
1.153637, 0.36837, 0.1936454, 1, 1, 1, 1, 1,
1.156528, 0.4231083, 2.329618, 1, 1, 1, 1, 1,
1.157286, 1.397781, 0.4558985, 1, 1, 1, 1, 1,
1.158774, -2.632714, 2.803921, 1, 1, 1, 1, 1,
1.180362, 0.7696213, 0.1945078, 1, 1, 1, 1, 1,
1.186334, -0.6981437, 1.036236, 1, 1, 1, 1, 1,
1.190598, 0.5560785, 2.783496, 1, 1, 1, 1, 1,
1.194513, 0.1420005, -0.7344496, 1, 1, 1, 1, 1,
1.194901, 0.1231807, 0.7976384, 1, 1, 1, 1, 1,
1.220521, -0.4028853, 2.191176, 0, 0, 1, 1, 1,
1.225026, 1.098242, 2.097259, 1, 0, 0, 1, 1,
1.23231, -0.3181446, 1.098126, 1, 0, 0, 1, 1,
1.234889, 0.005948327, 0.7195285, 1, 0, 0, 1, 1,
1.243642, -1.42397, 3.828577, 1, 0, 0, 1, 1,
1.253499, 1.807509, 0.1238654, 1, 0, 0, 1, 1,
1.258782, 0.1219544, 2.344885, 0, 0, 0, 1, 1,
1.264167, -0.9136867, 2.235875, 0, 0, 0, 1, 1,
1.265859, 0.5973185, -0.1963999, 0, 0, 0, 1, 1,
1.26741, 0.9121678, 0.05036775, 0, 0, 0, 1, 1,
1.269708, 0.2158121, 0.4457957, 0, 0, 0, 1, 1,
1.272208, 1.444039, 0.6511909, 0, 0, 0, 1, 1,
1.275685, 0.7481355, 0.597433, 0, 0, 0, 1, 1,
1.276326, 0.3589775, -0.3454522, 1, 1, 1, 1, 1,
1.281424, -0.1064033, -0.7448034, 1, 1, 1, 1, 1,
1.283707, 1.090645, -0.5922841, 1, 1, 1, 1, 1,
1.289, 0.2834558, 1.399775, 1, 1, 1, 1, 1,
1.290169, 0.8108283, 1.066317, 1, 1, 1, 1, 1,
1.309186, -0.4095061, 0.4899019, 1, 1, 1, 1, 1,
1.314736, -0.1108681, -1.080658, 1, 1, 1, 1, 1,
1.346346, -1.637615, 4.417459, 1, 1, 1, 1, 1,
1.351519, -0.7471666, 3.257051, 1, 1, 1, 1, 1,
1.352806, -0.918862, 3.02995, 1, 1, 1, 1, 1,
1.360615, -1.399034, 1.9169, 1, 1, 1, 1, 1,
1.36127, -1.865219, 2.855426, 1, 1, 1, 1, 1,
1.362411, -1.596487, 2.823514, 1, 1, 1, 1, 1,
1.368603, -0.5862408, 0.991621, 1, 1, 1, 1, 1,
1.380639, 0.5447044, 1.632521, 1, 1, 1, 1, 1,
1.386621, 2.799749, -0.1401784, 0, 0, 1, 1, 1,
1.396448, -0.01555934, 1.371077, 1, 0, 0, 1, 1,
1.397233, -1.386196, 3.841173, 1, 0, 0, 1, 1,
1.397311, 0.834284, -0.3416867, 1, 0, 0, 1, 1,
1.41455, 0.8539943, 1.9694, 1, 0, 0, 1, 1,
1.415999, -1.865505, 2.905613, 1, 0, 0, 1, 1,
1.424383, 1.410556, 0.7381501, 0, 0, 0, 1, 1,
1.430048, 0.219367, 0.7099089, 0, 0, 0, 1, 1,
1.434851, 1.338966, 1.203867, 0, 0, 0, 1, 1,
1.436337, 0.8302793, 1.676798, 0, 0, 0, 1, 1,
1.446109, -0.3684284, 0.2891778, 0, 0, 0, 1, 1,
1.452668, 0.8947135, 1.05621, 0, 0, 0, 1, 1,
1.45491, -1.646842, 2.192583, 0, 0, 0, 1, 1,
1.456801, -0.8851461, 2.994669, 1, 1, 1, 1, 1,
1.468872, 0.902305, 0.7646464, 1, 1, 1, 1, 1,
1.473942, -1.645616, 4.035788, 1, 1, 1, 1, 1,
1.47474, -0.6023986, 2.136528, 1, 1, 1, 1, 1,
1.477559, 0.3388633, 1.806963, 1, 1, 1, 1, 1,
1.484026, -0.7025078, 2.023814, 1, 1, 1, 1, 1,
1.484166, -0.249688, 1.754191, 1, 1, 1, 1, 1,
1.502953, 1.355673, 2.861245, 1, 1, 1, 1, 1,
1.511448, -0.4149699, 2.580351, 1, 1, 1, 1, 1,
1.53355, -0.4140301, 1.199028, 1, 1, 1, 1, 1,
1.54143, -0.5686778, 2.300532, 1, 1, 1, 1, 1,
1.542674, 1.346794, -0.7069072, 1, 1, 1, 1, 1,
1.555175, -2.602983, 1.870987, 1, 1, 1, 1, 1,
1.55732, -0.2296027, 3.425796, 1, 1, 1, 1, 1,
1.564449, -0.7560239, 2.440646, 1, 1, 1, 1, 1,
1.607095, -1.181406, 2.863941, 0, 0, 1, 1, 1,
1.616265, -0.906123, 2.224054, 1, 0, 0, 1, 1,
1.618549, 0.7984479, 1.384238, 1, 0, 0, 1, 1,
1.618852, 1.278622, 1.336787, 1, 0, 0, 1, 1,
1.620088, -1.136159, 2.944062, 1, 0, 0, 1, 1,
1.620792, 0.9896941, 0.5631772, 1, 0, 0, 1, 1,
1.656358, 1.652303, 1.408615, 0, 0, 0, 1, 1,
1.671883, -0.1890617, 1.879376, 0, 0, 0, 1, 1,
1.671983, 0.3935944, 1.95774, 0, 0, 0, 1, 1,
1.675891, 1.442828, 3.109643, 0, 0, 0, 1, 1,
1.678069, 0.2152331, 0.2133036, 0, 0, 0, 1, 1,
1.685968, -0.5700461, 2.125561, 0, 0, 0, 1, 1,
1.686311, -0.6715349, 1.802735, 0, 0, 0, 1, 1,
1.708637, 0.4403926, 2.106831, 1, 1, 1, 1, 1,
1.721481, -1.783972, 3.441929, 1, 1, 1, 1, 1,
1.734396, -1.286746, 2.965787, 1, 1, 1, 1, 1,
1.736913, 1.315501, 0.722719, 1, 1, 1, 1, 1,
1.769109, -1.057117, 1.494555, 1, 1, 1, 1, 1,
1.788297, 1.152267, 1.170553, 1, 1, 1, 1, 1,
1.793931, -0.2425085, 0.3483353, 1, 1, 1, 1, 1,
1.805989, -1.410942, -0.7985438, 1, 1, 1, 1, 1,
1.808657, 1.114255, 0.4831104, 1, 1, 1, 1, 1,
1.812491, -0.8202788, 1.690102, 1, 1, 1, 1, 1,
1.848006, -0.6406567, 3.09964, 1, 1, 1, 1, 1,
1.849878, 0.5187149, 1.289868, 1, 1, 1, 1, 1,
1.863345, 0.05449901, 1.290629, 1, 1, 1, 1, 1,
1.865765, 0.1202469, 2.896442, 1, 1, 1, 1, 1,
1.90273, -1.155098, 3.174825, 1, 1, 1, 1, 1,
1.916693, 0.1505178, 0.211273, 0, 0, 1, 1, 1,
1.921154, 0.513467, 1.308072, 1, 0, 0, 1, 1,
1.921824, 0.1524822, 1.534511, 1, 0, 0, 1, 1,
1.943848, -0.4003506, 2.498325, 1, 0, 0, 1, 1,
1.967626, 1.713766, -0.6581287, 1, 0, 0, 1, 1,
1.982716, 0.9736625, 3.805658, 1, 0, 0, 1, 1,
2.008658, -1.76854, 2.767825, 0, 0, 0, 1, 1,
2.0238, -1.962492, 3.801576, 0, 0, 0, 1, 1,
2.03595, 0.4246118, 1.698878, 0, 0, 0, 1, 1,
2.037134, 0.03059268, 2.698558, 0, 0, 0, 1, 1,
2.081542, -1.866013, 1.914558, 0, 0, 0, 1, 1,
2.086238, -0.4207072, 0.9050388, 0, 0, 0, 1, 1,
2.151986, 0.9206985, 0.8985942, 0, 0, 0, 1, 1,
2.158196, -1.178005, 3.033376, 1, 1, 1, 1, 1,
2.195402, 0.5775269, 2.372086, 1, 1, 1, 1, 1,
2.205123, 0.1114694, 1.612895, 1, 1, 1, 1, 1,
2.574127, -0.1135017, 3.581022, 1, 1, 1, 1, 1,
2.593074, -0.1770265, 2.236149, 1, 1, 1, 1, 1,
2.652372, 1.976103, 0.3724543, 1, 1, 1, 1, 1,
2.863631, 1.570497, 0.6815875, 1, 1, 1, 1, 1
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
var radius = 9.671608;
var distance = 33.97111;
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
mvMatrix.translate( 0.5395125, -0.1390828, 0.4196861 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.97111);
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
