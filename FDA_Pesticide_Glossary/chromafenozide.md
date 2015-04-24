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
-2.837895, 0.781173, 0.1179385, 1, 0, 0, 1,
-2.720301, -0.2920183, -0.1546876, 1, 0.007843138, 0, 1,
-2.682028, 0.5676893, -0.2134839, 1, 0.01176471, 0, 1,
-2.676246, -0.6521596, -1.477078, 1, 0.01960784, 0, 1,
-2.55183, 0.1209483, -1.038847, 1, 0.02352941, 0, 1,
-2.54534, 0.1707775, -2.475437, 1, 0.03137255, 0, 1,
-2.438548, -0.4926087, -2.639494, 1, 0.03529412, 0, 1,
-2.414863, 1.019111, -1.258113, 1, 0.04313726, 0, 1,
-2.376943, -0.9485859, -1.170612, 1, 0.04705882, 0, 1,
-2.314389, 0.7567299, -0.8864152, 1, 0.05490196, 0, 1,
-2.309695, 0.5548448, -1.035777, 1, 0.05882353, 0, 1,
-2.254188, -0.02683938, -0.9544665, 1, 0.06666667, 0, 1,
-2.230232, 0.8317124, -1.056242, 1, 0.07058824, 0, 1,
-2.217124, 0.0323343, -0.3721468, 1, 0.07843138, 0, 1,
-2.198583, 1.415689, -1.298476, 1, 0.08235294, 0, 1,
-2.198545, -0.5937411, -3.02872, 1, 0.09019608, 0, 1,
-2.123364, 0.3825407, -1.968918, 1, 0.09411765, 0, 1,
-2.117559, 0.7413359, -2.666281, 1, 0.1019608, 0, 1,
-2.101891, 1.758213, -1.854646, 1, 0.1098039, 0, 1,
-2.072439, -0.06665928, -2.012874, 1, 0.1137255, 0, 1,
-2.055338, 0.2155607, -2.370644, 1, 0.1215686, 0, 1,
-2.043953, 0.2008844, -1.161221, 1, 0.1254902, 0, 1,
-2.012618, -1.914308, -3.354432, 1, 0.1333333, 0, 1,
-2.008527, -0.1387031, -2.099364, 1, 0.1372549, 0, 1,
-1.978763, 0.5897385, -0.5428545, 1, 0.145098, 0, 1,
-1.974404, -2.132524, -1.791051, 1, 0.1490196, 0, 1,
-1.971345, 0.05538478, -1.325247, 1, 0.1568628, 0, 1,
-1.872976, -0.06392603, -1.560956, 1, 0.1607843, 0, 1,
-1.849151, 0.5656093, -2.115521, 1, 0.1686275, 0, 1,
-1.8386, -1.523841, -3.458287, 1, 0.172549, 0, 1,
-1.836536, 0.2265984, -3.1257, 1, 0.1803922, 0, 1,
-1.834767, 0.9608529, -0.7430522, 1, 0.1843137, 0, 1,
-1.821175, 0.5079691, 0.3116416, 1, 0.1921569, 0, 1,
-1.821162, -0.6970925, -0.6754052, 1, 0.1960784, 0, 1,
-1.801478, 0.04415165, -1.007783, 1, 0.2039216, 0, 1,
-1.768781, 1.197422, -1.548299, 1, 0.2117647, 0, 1,
-1.731215, 0.09414463, -1.886945, 1, 0.2156863, 0, 1,
-1.728339, 1.356996, 0.1266076, 1, 0.2235294, 0, 1,
-1.71983, -0.09108301, -0.9146076, 1, 0.227451, 0, 1,
-1.713054, 0.1872392, 0.761191, 1, 0.2352941, 0, 1,
-1.711206, -1.035291, -3.430578, 1, 0.2392157, 0, 1,
-1.69832, -1.177163, -0.3655327, 1, 0.2470588, 0, 1,
-1.690544, 1.527957, -1.595874, 1, 0.2509804, 0, 1,
-1.679122, 1.161983, -1.450424, 1, 0.2588235, 0, 1,
-1.651052, 1.519283, -1.602971, 1, 0.2627451, 0, 1,
-1.645375, -1.807771, -3.366601, 1, 0.2705882, 0, 1,
-1.642529, 1.049501, -2.068586, 1, 0.2745098, 0, 1,
-1.640849, 1.199217, 0.4252346, 1, 0.282353, 0, 1,
-1.640751, 0.725049, 0.4308932, 1, 0.2862745, 0, 1,
-1.601297, 1.228876, -1.25503, 1, 0.2941177, 0, 1,
-1.575768, -1.197619, -1.234963, 1, 0.3019608, 0, 1,
-1.574227, 0.03946371, -1.457737, 1, 0.3058824, 0, 1,
-1.571229, 0.6104309, -1.409815, 1, 0.3137255, 0, 1,
-1.557716, 0.6604598, -0.8985298, 1, 0.3176471, 0, 1,
-1.541707, 0.2879165, -2.058129, 1, 0.3254902, 0, 1,
-1.531257, 1.101216, -2.878004, 1, 0.3294118, 0, 1,
-1.530287, -1.506488, -3.159359, 1, 0.3372549, 0, 1,
-1.491714, -0.159612, -1.044933, 1, 0.3411765, 0, 1,
-1.487878, -1.056632, -1.159658, 1, 0.3490196, 0, 1,
-1.4806, 0.432961, -1.396057, 1, 0.3529412, 0, 1,
-1.474299, -0.4804635, -0.7727818, 1, 0.3607843, 0, 1,
-1.474259, -0.5867031, -0.8974517, 1, 0.3647059, 0, 1,
-1.455496, -0.3738275, -1.439755, 1, 0.372549, 0, 1,
-1.45371, 0.1874973, -0.6537522, 1, 0.3764706, 0, 1,
-1.448316, -0.134259, -1.709806, 1, 0.3843137, 0, 1,
-1.445485, 0.7481265, 0.02345274, 1, 0.3882353, 0, 1,
-1.444144, 1.471138, -2.109088, 1, 0.3960784, 0, 1,
-1.429416, -0.7235661, -1.512331, 1, 0.4039216, 0, 1,
-1.425796, 1.958149, 1.35917, 1, 0.4078431, 0, 1,
-1.420595, -0.2985079, -1.180479, 1, 0.4156863, 0, 1,
-1.411714, -0.8318666, -1.339608, 1, 0.4196078, 0, 1,
-1.390868, -0.6588163, -2.406792, 1, 0.427451, 0, 1,
-1.389514, -1.127763, -2.015164, 1, 0.4313726, 0, 1,
-1.384546, 0.5295306, -0.8855681, 1, 0.4392157, 0, 1,
-1.384476, 0.1845595, -1.177368, 1, 0.4431373, 0, 1,
-1.383478, 0.4448758, -3.298392, 1, 0.4509804, 0, 1,
-1.379277, 0.1978807, -0.6924652, 1, 0.454902, 0, 1,
-1.358751, 0.7320807, -0.6352592, 1, 0.4627451, 0, 1,
-1.346622, 1.218612, -2.221052, 1, 0.4666667, 0, 1,
-1.340818, 0.1699515, -1.486573, 1, 0.4745098, 0, 1,
-1.337741, -0.7848174, -2.198857, 1, 0.4784314, 0, 1,
-1.333457, -0.1191015, -1.620244, 1, 0.4862745, 0, 1,
-1.32984, -0.8323938, -1.867674, 1, 0.4901961, 0, 1,
-1.321774, -0.1483323, -0.5098351, 1, 0.4980392, 0, 1,
-1.315036, 0.6380453, 0.04695291, 1, 0.5058824, 0, 1,
-1.310965, 0.1126161, -0.798485, 1, 0.509804, 0, 1,
-1.303393, -1.089282, -1.585566, 1, 0.5176471, 0, 1,
-1.286883, 0.6915219, -2.326807, 1, 0.5215687, 0, 1,
-1.28643, -0.6473041, -3.612373, 1, 0.5294118, 0, 1,
-1.284901, 0.5691532, -0.03858442, 1, 0.5333334, 0, 1,
-1.282915, 0.8041585, -2.620776, 1, 0.5411765, 0, 1,
-1.281168, 0.2817279, -0.1839975, 1, 0.5450981, 0, 1,
-1.268149, 0.2699279, 0.1829894, 1, 0.5529412, 0, 1,
-1.263582, 0.1111233, -0.2319799, 1, 0.5568628, 0, 1,
-1.262184, -1.321849, -1.693118, 1, 0.5647059, 0, 1,
-1.259286, -0.02546372, -2.752598, 1, 0.5686275, 0, 1,
-1.255802, 0.01475489, -0.8770906, 1, 0.5764706, 0, 1,
-1.25081, -0.7059317, 1.489412, 1, 0.5803922, 0, 1,
-1.250557, 0.349391, -0.4873628, 1, 0.5882353, 0, 1,
-1.250489, 0.9381887, -2.20363, 1, 0.5921569, 0, 1,
-1.248037, -0.4914951, -1.798494, 1, 0.6, 0, 1,
-1.242889, -1.567364, -3.670493, 1, 0.6078432, 0, 1,
-1.232346, 1.283599, -0.6492814, 1, 0.6117647, 0, 1,
-1.229733, 1.167599, -0.3574531, 1, 0.6196079, 0, 1,
-1.228392, -1.502362, -1.124726, 1, 0.6235294, 0, 1,
-1.226229, 1.449895, 0.3930235, 1, 0.6313726, 0, 1,
-1.21845, -2.355506, -2.888266, 1, 0.6352941, 0, 1,
-1.217387, -0.2161532, -1.938037, 1, 0.6431373, 0, 1,
-1.198056, 1.011919, -0.4414472, 1, 0.6470588, 0, 1,
-1.19748, 0.3328655, -0.08220988, 1, 0.654902, 0, 1,
-1.196712, 1.201708, -1.532646, 1, 0.6588235, 0, 1,
-1.1948, -1.699795, -1.337549, 1, 0.6666667, 0, 1,
-1.185549, 0.3002244, 0.6455387, 1, 0.6705883, 0, 1,
-1.179898, 0.4657051, -0.7841237, 1, 0.6784314, 0, 1,
-1.161775, -0.07967481, -2.16035, 1, 0.682353, 0, 1,
-1.160685, 0.5944022, -2.915021, 1, 0.6901961, 0, 1,
-1.159104, -0.3297597, -1.239963, 1, 0.6941177, 0, 1,
-1.159095, 0.4150716, -2.3176, 1, 0.7019608, 0, 1,
-1.157391, -1.395528, -2.620879, 1, 0.7098039, 0, 1,
-1.157237, 0.5379758, -2.180367, 1, 0.7137255, 0, 1,
-1.152519, 0.0647848, -0.8984933, 1, 0.7215686, 0, 1,
-1.150608, -1.928784, -2.580544, 1, 0.7254902, 0, 1,
-1.141872, 0.6475088, -1.591686, 1, 0.7333333, 0, 1,
-1.137193, 0.02927234, -0.8902905, 1, 0.7372549, 0, 1,
-1.135812, -0.4940337, -2.212081, 1, 0.7450981, 0, 1,
-1.124102, 0.1020082, -1.749418, 1, 0.7490196, 0, 1,
-1.111334, -0.8752304, -2.231596, 1, 0.7568628, 0, 1,
-1.103973, -0.3396994, -2.271405, 1, 0.7607843, 0, 1,
-1.099646, -0.1421674, -1.914907, 1, 0.7686275, 0, 1,
-1.087765, 0.6834702, -0.2430292, 1, 0.772549, 0, 1,
-1.086175, -0.4924309, -3.509467, 1, 0.7803922, 0, 1,
-1.083758, -0.5674486, -2.212292, 1, 0.7843137, 0, 1,
-1.071198, -0.7761977, -3.229146, 1, 0.7921569, 0, 1,
-1.066312, 0.4013527, -2.10832, 1, 0.7960784, 0, 1,
-1.065381, 1.901293, -0.9401457, 1, 0.8039216, 0, 1,
-1.059655, 1.227396, -2.730753, 1, 0.8117647, 0, 1,
-1.056402, 0.5315049, -1.254758, 1, 0.8156863, 0, 1,
-1.04724, 0.5009866, -2.417409, 1, 0.8235294, 0, 1,
-1.04005, -1.76328, -0.4309036, 1, 0.827451, 0, 1,
-1.027293, -0.7413333, -0.8695336, 1, 0.8352941, 0, 1,
-1.02402, 1.379526, 0.6311416, 1, 0.8392157, 0, 1,
-1.019029, 0.4050008, -1.991189, 1, 0.8470588, 0, 1,
-1.018452, -0.5311159, -2.243763, 1, 0.8509804, 0, 1,
-1.012959, 0.9826067, 0.4764728, 1, 0.8588235, 0, 1,
-1.011049, -0.6952897, -1.239564, 1, 0.8627451, 0, 1,
-1.008633, -0.8003008, -2.699832, 1, 0.8705882, 0, 1,
-1.006404, -1.215917, -2.386558, 1, 0.8745098, 0, 1,
-1.001806, -0.1072834, -2.139706, 1, 0.8823529, 0, 1,
-0.9902679, -0.1833445, -3.122352, 1, 0.8862745, 0, 1,
-0.9867281, -0.6364653, -2.841722, 1, 0.8941177, 0, 1,
-0.9850839, 0.008837056, -1.569881, 1, 0.8980392, 0, 1,
-0.9825366, -1.570851, -1.335918, 1, 0.9058824, 0, 1,
-0.9760921, -1.130584, -3.069847, 1, 0.9137255, 0, 1,
-0.9707333, -1.633461, -3.049532, 1, 0.9176471, 0, 1,
-0.9676486, 0.1251563, 1.618535, 1, 0.9254902, 0, 1,
-0.9651497, -1.049587, -1.988675, 1, 0.9294118, 0, 1,
-0.9648629, 0.7304395, 0.1195848, 1, 0.9372549, 0, 1,
-0.9634617, -2.179619, -2.308331, 1, 0.9411765, 0, 1,
-0.9630457, -1.766254, -2.577173, 1, 0.9490196, 0, 1,
-0.956319, -0.5411384, -2.292683, 1, 0.9529412, 0, 1,
-0.9557137, 0.1165055, -0.410122, 1, 0.9607843, 0, 1,
-0.9530736, 1.48498, -1.904997, 1, 0.9647059, 0, 1,
-0.9403512, -2.137321, -3.323521, 1, 0.972549, 0, 1,
-0.9354675, 1.036127, -0.946788, 1, 0.9764706, 0, 1,
-0.9318767, 0.325697, -0.2632666, 1, 0.9843137, 0, 1,
-0.9276775, -1.830018, -1.784825, 1, 0.9882353, 0, 1,
-0.9211478, 2.010794, 0.6598103, 1, 0.9960784, 0, 1,
-0.9138026, 1.254427, -0.9374031, 0.9960784, 1, 0, 1,
-0.9090036, -0.8265958, -2.353709, 0.9921569, 1, 0, 1,
-0.9085059, 0.290921, -1.630338, 0.9843137, 1, 0, 1,
-0.9053428, -0.257051, -1.426075, 0.9803922, 1, 0, 1,
-0.9039505, 2.436556, -2.428208, 0.972549, 1, 0, 1,
-0.9035732, 0.1499514, -1.448541, 0.9686275, 1, 0, 1,
-0.9020894, 0.0231719, -0.6774132, 0.9607843, 1, 0, 1,
-0.9006783, 0.08954117, -2.463762, 0.9568627, 1, 0, 1,
-0.8979545, 0.3557719, -1.911312, 0.9490196, 1, 0, 1,
-0.8960376, 0.3121669, -1.805661, 0.945098, 1, 0, 1,
-0.8938539, -1.487478, -1.4541, 0.9372549, 1, 0, 1,
-0.891674, 1.002342, 0.4278836, 0.9333333, 1, 0, 1,
-0.8882085, -0.6760882, -2.523938, 0.9254902, 1, 0, 1,
-0.8848006, 0.6325161, -0.5401454, 0.9215686, 1, 0, 1,
-0.8793023, 0.6592055, -0.5261648, 0.9137255, 1, 0, 1,
-0.8792585, 1.729984, -0.5463553, 0.9098039, 1, 0, 1,
-0.8717754, -0.3620352, -1.383909, 0.9019608, 1, 0, 1,
-0.870453, 0.7211897, -1.823693, 0.8941177, 1, 0, 1,
-0.8682575, -0.4068087, -3.088253, 0.8901961, 1, 0, 1,
-0.8672159, 0.2560477, -0.2687007, 0.8823529, 1, 0, 1,
-0.8668121, -0.5366516, -1.714685, 0.8784314, 1, 0, 1,
-0.8667507, -0.4399717, -2.45973, 0.8705882, 1, 0, 1,
-0.8618441, 1.938547, -0.262234, 0.8666667, 1, 0, 1,
-0.8598238, -0.4977947, -3.573644, 0.8588235, 1, 0, 1,
-0.8584874, -1.421897, -1.323088, 0.854902, 1, 0, 1,
-0.8553611, 0.09318656, -2.395226, 0.8470588, 1, 0, 1,
-0.854479, -0.430395, -3.258878, 0.8431373, 1, 0, 1,
-0.8495146, -0.7096819, -2.995187, 0.8352941, 1, 0, 1,
-0.8455061, -0.0505933, -3.155793, 0.8313726, 1, 0, 1,
-0.8428096, 1.043055, -0.3405981, 0.8235294, 1, 0, 1,
-0.8421855, 0.4203843, -0.1048771, 0.8196079, 1, 0, 1,
-0.8419631, -1.073942, -3.359473, 0.8117647, 1, 0, 1,
-0.8392566, 0.6274448, -1.702032, 0.8078431, 1, 0, 1,
-0.8386557, -0.04419434, -0.8609029, 0.8, 1, 0, 1,
-0.8385949, -0.5460619, -1.557604, 0.7921569, 1, 0, 1,
-0.8334905, -0.7079463, -0.3229786, 0.7882353, 1, 0, 1,
-0.829832, -1.040241, -1.979847, 0.7803922, 1, 0, 1,
-0.8236147, 0.5007201, -1.142534, 0.7764706, 1, 0, 1,
-0.8236023, -1.210688, -1.821182, 0.7686275, 1, 0, 1,
-0.8214478, 1.118583, -2.011761, 0.7647059, 1, 0, 1,
-0.8211872, 0.3575127, -2.680496, 0.7568628, 1, 0, 1,
-0.8195581, 0.1236046, -2.53749, 0.7529412, 1, 0, 1,
-0.8157084, -0.4108315, -1.088736, 0.7450981, 1, 0, 1,
-0.8108983, -0.543172, -2.859329, 0.7411765, 1, 0, 1,
-0.8102966, 1.485796, -0.6053774, 0.7333333, 1, 0, 1,
-0.8060055, 0.8101509, 0.8436086, 0.7294118, 1, 0, 1,
-0.8057045, -1.314026, -2.805413, 0.7215686, 1, 0, 1,
-0.8012576, -0.6230815, -2.721413, 0.7176471, 1, 0, 1,
-0.8002055, 1.175869, -1.406116, 0.7098039, 1, 0, 1,
-0.7971697, -0.365402, -0.6098729, 0.7058824, 1, 0, 1,
-0.7957525, 0.003248305, -1.613822, 0.6980392, 1, 0, 1,
-0.7917365, -0.6070449, -2.074473, 0.6901961, 1, 0, 1,
-0.7862675, 1.556416, -0.8984159, 0.6862745, 1, 0, 1,
-0.7782709, 1.663017, -0.5364128, 0.6784314, 1, 0, 1,
-0.7742425, 1.83826, 1.722504, 0.6745098, 1, 0, 1,
-0.7638934, 0.1280179, -1.905089, 0.6666667, 1, 0, 1,
-0.7634566, -1.296543, -1.210619, 0.6627451, 1, 0, 1,
-0.7598416, -1.363625, -3.133454, 0.654902, 1, 0, 1,
-0.7525275, 1.512025, -2.426859, 0.6509804, 1, 0, 1,
-0.7522041, 0.6512278, -0.6426222, 0.6431373, 1, 0, 1,
-0.7485943, 1.261284, -2.486648, 0.6392157, 1, 0, 1,
-0.7441577, 0.207545, -0.9734812, 0.6313726, 1, 0, 1,
-0.7399591, -0.9184097, -1.004354, 0.627451, 1, 0, 1,
-0.7396321, 1.131714, -1.466716, 0.6196079, 1, 0, 1,
-0.7378073, 0.09982093, -2.336112, 0.6156863, 1, 0, 1,
-0.7369354, 0.4168694, -1.670565, 0.6078432, 1, 0, 1,
-0.7365808, 0.4076267, -3.620229, 0.6039216, 1, 0, 1,
-0.7330293, 1.071333, -0.6801937, 0.5960785, 1, 0, 1,
-0.730464, -1.129153, -2.305753, 0.5882353, 1, 0, 1,
-0.7295266, 0.9262254, -1.059775, 0.5843138, 1, 0, 1,
-0.7292078, -1.447737, -3.833624, 0.5764706, 1, 0, 1,
-0.7276362, -0.6716806, -4.359624, 0.572549, 1, 0, 1,
-0.7271354, -0.4480186, -3.069715, 0.5647059, 1, 0, 1,
-0.7253093, 1.549215, -1.974192, 0.5607843, 1, 0, 1,
-0.7187081, 0.4401319, 0.6456372, 0.5529412, 1, 0, 1,
-0.7127413, 1.278951, 0.9559824, 0.5490196, 1, 0, 1,
-0.7081457, -0.01851783, -3.630878, 0.5411765, 1, 0, 1,
-0.7080575, 0.05841399, -2.783483, 0.5372549, 1, 0, 1,
-0.7070407, -1.00499, -3.885572, 0.5294118, 1, 0, 1,
-0.7060677, -0.5311048, -2.647455, 0.5254902, 1, 0, 1,
-0.7041048, -1.065593, -3.853862, 0.5176471, 1, 0, 1,
-0.6998626, 0.3327521, -0.4424612, 0.5137255, 1, 0, 1,
-0.6991693, 0.3637688, -0.6232515, 0.5058824, 1, 0, 1,
-0.6988013, 0.09438793, -2.012897, 0.5019608, 1, 0, 1,
-0.6962296, 0.5621732, -1.533017, 0.4941176, 1, 0, 1,
-0.6903098, 1.612449, -0.6748708, 0.4862745, 1, 0, 1,
-0.6900775, -0.5179613, -1.81895, 0.4823529, 1, 0, 1,
-0.6883663, 0.9010862, -0.8554882, 0.4745098, 1, 0, 1,
-0.6783205, 0.4965427, -0.5894122, 0.4705882, 1, 0, 1,
-0.6756787, 0.8300811, 0.7548238, 0.4627451, 1, 0, 1,
-0.6677717, -1.450076, -2.091161, 0.4588235, 1, 0, 1,
-0.6655371, -0.3766469, -3.218479, 0.4509804, 1, 0, 1,
-0.6635633, -0.5351458, -2.560482, 0.4470588, 1, 0, 1,
-0.6605884, -0.9522599, -1.137134, 0.4392157, 1, 0, 1,
-0.658871, 0.01992938, -2.673203, 0.4352941, 1, 0, 1,
-0.6566193, -0.4905308, -4.277202, 0.427451, 1, 0, 1,
-0.6503832, 1.190527, -0.8644368, 0.4235294, 1, 0, 1,
-0.6498552, -1.114221, -1.897093, 0.4156863, 1, 0, 1,
-0.6493374, -0.9158228, -4.361042, 0.4117647, 1, 0, 1,
-0.6482912, -0.5705331, -1.497477, 0.4039216, 1, 0, 1,
-0.6394802, -0.2072066, -0.6320527, 0.3960784, 1, 0, 1,
-0.6380028, 0.4928553, -1.590777, 0.3921569, 1, 0, 1,
-0.6349595, -0.4382276, -0.3817616, 0.3843137, 1, 0, 1,
-0.6240244, 0.2972072, -2.00176, 0.3803922, 1, 0, 1,
-0.6238267, 0.4665149, -0.7184491, 0.372549, 1, 0, 1,
-0.6225693, -0.09259202, -0.4507732, 0.3686275, 1, 0, 1,
-0.6212183, 0.4893531, -2.303668, 0.3607843, 1, 0, 1,
-0.621114, -0.7300178, -1.818412, 0.3568628, 1, 0, 1,
-0.618228, 0.04593438, -1.855114, 0.3490196, 1, 0, 1,
-0.6080413, -0.01870694, -1.171003, 0.345098, 1, 0, 1,
-0.605354, -0.03342587, -3.92623, 0.3372549, 1, 0, 1,
-0.602205, 0.7564278, -0.7336413, 0.3333333, 1, 0, 1,
-0.6020532, 1.360218, -0.9921488, 0.3254902, 1, 0, 1,
-0.5994542, -0.8157809, -3.092887, 0.3215686, 1, 0, 1,
-0.5885445, 0.7393028, -0.405581, 0.3137255, 1, 0, 1,
-0.5855955, 0.8338434, -2.291041, 0.3098039, 1, 0, 1,
-0.5845489, -1.346318, -4.275388, 0.3019608, 1, 0, 1,
-0.57783, -2.499049, -3.810076, 0.2941177, 1, 0, 1,
-0.5757099, 1.006113, -1.830632, 0.2901961, 1, 0, 1,
-0.5751083, -2.646163, -4.070498, 0.282353, 1, 0, 1,
-0.5746995, 0.09637005, -0.0728335, 0.2784314, 1, 0, 1,
-0.5726148, 0.6893666, -0.4124185, 0.2705882, 1, 0, 1,
-0.5696356, -0.4507153, -2.234325, 0.2666667, 1, 0, 1,
-0.5673516, -0.7711684, -1.901398, 0.2588235, 1, 0, 1,
-0.5636519, 0.7032635, -0.2546974, 0.254902, 1, 0, 1,
-0.5604026, -1.128141, -2.615546, 0.2470588, 1, 0, 1,
-0.5573452, 0.2792343, -3.417845, 0.2431373, 1, 0, 1,
-0.5502291, 0.763421, 1.009123, 0.2352941, 1, 0, 1,
-0.5458943, -0.7420779, -3.240196, 0.2313726, 1, 0, 1,
-0.5428525, -1.389959, -3.264343, 0.2235294, 1, 0, 1,
-0.5422722, -1.748601, -2.350717, 0.2196078, 1, 0, 1,
-0.5419413, 0.478074, -0.4746412, 0.2117647, 1, 0, 1,
-0.5413046, -0.6180652, -1.213919, 0.2078431, 1, 0, 1,
-0.5362958, 0.4439277, -1.1644, 0.2, 1, 0, 1,
-0.5292091, 1.445788, 0.9196168, 0.1921569, 1, 0, 1,
-0.5275723, -0.8731582, -3.00714, 0.1882353, 1, 0, 1,
-0.5218164, -0.3661568, -3.808382, 0.1803922, 1, 0, 1,
-0.5182726, -1.241227, -3.017657, 0.1764706, 1, 0, 1,
-0.5163865, -2.351056, -3.644979, 0.1686275, 1, 0, 1,
-0.5161036, -1.570038, -0.8958146, 0.1647059, 1, 0, 1,
-0.5045264, -2.237193, -2.138524, 0.1568628, 1, 0, 1,
-0.5038689, 0.6585785, 0.09035637, 0.1529412, 1, 0, 1,
-0.4975898, 0.02670838, -1.382204, 0.145098, 1, 0, 1,
-0.4965183, 1.273258, -0.08614314, 0.1411765, 1, 0, 1,
-0.4962857, -0.4027674, -1.333694, 0.1333333, 1, 0, 1,
-0.4949613, -1.25164, -3.497739, 0.1294118, 1, 0, 1,
-0.4906235, -0.03105722, -3.261352, 0.1215686, 1, 0, 1,
-0.4902357, 0.9486149, -0.6335639, 0.1176471, 1, 0, 1,
-0.4888468, 0.3433366, 0.210355, 0.1098039, 1, 0, 1,
-0.4882937, 0.1505621, 0.2261894, 0.1058824, 1, 0, 1,
-0.4861225, 0.1351468, -1.223929, 0.09803922, 1, 0, 1,
-0.4859639, 0.2417293, -0.6193902, 0.09019608, 1, 0, 1,
-0.4855649, 0.5596645, -0.8812118, 0.08627451, 1, 0, 1,
-0.485333, -1.476346, -4.110302, 0.07843138, 1, 0, 1,
-0.4836333, -0.1891498, -0.7176256, 0.07450981, 1, 0, 1,
-0.4830065, 0.07015632, -1.401674, 0.06666667, 1, 0, 1,
-0.4828811, -0.3917803, -0.8747155, 0.0627451, 1, 0, 1,
-0.4799674, -0.3176213, -2.315361, 0.05490196, 1, 0, 1,
-0.4730128, -0.05852246, -1.715163, 0.05098039, 1, 0, 1,
-0.4714084, 0.1149011, -0.9596574, 0.04313726, 1, 0, 1,
-0.4649133, 1.107549, -2.123239, 0.03921569, 1, 0, 1,
-0.4646001, 0.6491411, -0.4001831, 0.03137255, 1, 0, 1,
-0.4626369, -0.9459671, -3.004339, 0.02745098, 1, 0, 1,
-0.460676, -1.309633, -1.803039, 0.01960784, 1, 0, 1,
-0.4538316, -1.133643, -2.978977, 0.01568628, 1, 0, 1,
-0.4533673, 0.6330125, -1.205352, 0.007843138, 1, 0, 1,
-0.4509318, -0.5561447, -3.735459, 0.003921569, 1, 0, 1,
-0.4504097, 0.2219281, -0.3587439, 0, 1, 0.003921569, 1,
-0.4495078, 0.1753036, -2.197199, 0, 1, 0.01176471, 1,
-0.4494329, -0.2779855, -1.694865, 0, 1, 0.01568628, 1,
-0.4477132, 0.2640068, -2.19986, 0, 1, 0.02352941, 1,
-0.4465851, 0.7300436, 2.26704, 0, 1, 0.02745098, 1,
-0.4406495, 1.162283, -1.622778, 0, 1, 0.03529412, 1,
-0.4377604, 0.9472936, 0.1979243, 0, 1, 0.03921569, 1,
-0.4349745, 0.2566713, 1.325139, 0, 1, 0.04705882, 1,
-0.4342585, 0.1127736, -2.132569, 0, 1, 0.05098039, 1,
-0.4335873, 1.768854, -0.378608, 0, 1, 0.05882353, 1,
-0.4325337, 0.1396001, -0.5259901, 0, 1, 0.0627451, 1,
-0.4325061, 0.08465293, -1.94458, 0, 1, 0.07058824, 1,
-0.4280759, 1.21355, 0.2664249, 0, 1, 0.07450981, 1,
-0.4257821, 0.7380031, -0.05182763, 0, 1, 0.08235294, 1,
-0.4253856, -0.1199661, -2.841224, 0, 1, 0.08627451, 1,
-0.421825, 0.490987, -2.8602, 0, 1, 0.09411765, 1,
-0.4211325, -1.418194, -3.164617, 0, 1, 0.1019608, 1,
-0.417697, 1.119328, 0.2677045, 0, 1, 0.1058824, 1,
-0.4132855, 0.7200677, -1.28888, 0, 1, 0.1137255, 1,
-0.4092759, 1.200907, 1.117825, 0, 1, 0.1176471, 1,
-0.4065318, -0.3138962, -3.256269, 0, 1, 0.1254902, 1,
-0.406472, 0.1345611, -0.9090213, 0, 1, 0.1294118, 1,
-0.3998002, 0.9627329, -2.433301, 0, 1, 0.1372549, 1,
-0.3959346, -1.419137, -1.313599, 0, 1, 0.1411765, 1,
-0.3937537, 0.2403532, -1.40963, 0, 1, 0.1490196, 1,
-0.3936211, -0.1221911, -1.497479, 0, 1, 0.1529412, 1,
-0.3922944, 0.927903, -0.8838255, 0, 1, 0.1607843, 1,
-0.3841588, 0.6848955, 0.1090389, 0, 1, 0.1647059, 1,
-0.3826241, 0.2440161, -0.8454391, 0, 1, 0.172549, 1,
-0.3773301, 0.2708746, -0.5474129, 0, 1, 0.1764706, 1,
-0.3696181, -1.489852, -2.337242, 0, 1, 0.1843137, 1,
-0.3682869, 0.4501089, -1.438039, 0, 1, 0.1882353, 1,
-0.3677638, -0.595728, -1.097506, 0, 1, 0.1960784, 1,
-0.3668725, 0.1537371, -0.6215367, 0, 1, 0.2039216, 1,
-0.3653111, 0.9970996, -2.164287, 0, 1, 0.2078431, 1,
-0.3647597, -0.8018544, -1.631611, 0, 1, 0.2156863, 1,
-0.3630216, 0.7709244, 0.5370522, 0, 1, 0.2196078, 1,
-0.3619553, -1.815158, -4.118835, 0, 1, 0.227451, 1,
-0.3578106, 0.1254451, -2.527186, 0, 1, 0.2313726, 1,
-0.3561916, 1.050848, 1.088646, 0, 1, 0.2392157, 1,
-0.3553599, 0.5104693, -0.4877418, 0, 1, 0.2431373, 1,
-0.3451266, -0.687877, 0.9048129, 0, 1, 0.2509804, 1,
-0.3438499, -0.8912087, -3.884663, 0, 1, 0.254902, 1,
-0.3335185, 0.06998126, -1.68146, 0, 1, 0.2627451, 1,
-0.3318321, 1.622536, 0.5751573, 0, 1, 0.2666667, 1,
-0.330413, 0.5128707, 0.205922, 0, 1, 0.2745098, 1,
-0.3226958, -1.234345, -4.039981, 0, 1, 0.2784314, 1,
-0.3224996, 0.1623447, -0.3263639, 0, 1, 0.2862745, 1,
-0.3178123, -1.860973, -3.011314, 0, 1, 0.2901961, 1,
-0.3170324, 1.612571, -0.9649372, 0, 1, 0.2980392, 1,
-0.3155808, -0.1920753, -2.156703, 0, 1, 0.3058824, 1,
-0.3144223, -0.6713229, -5.10005, 0, 1, 0.3098039, 1,
-0.3132368, 0.9721836, 0.2127055, 0, 1, 0.3176471, 1,
-0.3108563, -0.03767176, -1.813778, 0, 1, 0.3215686, 1,
-0.3086177, -0.4285217, -2.931893, 0, 1, 0.3294118, 1,
-0.289426, 0.3728546, -1.461163, 0, 1, 0.3333333, 1,
-0.2872342, 1.883372, -1.226297, 0, 1, 0.3411765, 1,
-0.2836529, 0.4721075, 1.118691, 0, 1, 0.345098, 1,
-0.2756309, 0.9372054, 1.722064, 0, 1, 0.3529412, 1,
-0.2744024, -0.2796618, -0.8963559, 0, 1, 0.3568628, 1,
-0.2725962, 0.03669354, -1.43888, 0, 1, 0.3647059, 1,
-0.2673381, 1.268331, -0.02562254, 0, 1, 0.3686275, 1,
-0.2631678, -0.360916, -2.928466, 0, 1, 0.3764706, 1,
-0.2598706, -0.2352054, -2.164927, 0, 1, 0.3803922, 1,
-0.2590922, -0.1729569, -3.456415, 0, 1, 0.3882353, 1,
-0.2549463, 1.31166, 0.2096507, 0, 1, 0.3921569, 1,
-0.2511654, 0.02778149, -3.16598, 0, 1, 0.4, 1,
-0.2477931, 0.3245395, -0.1268013, 0, 1, 0.4078431, 1,
-0.2456577, -0.7311305, -2.002593, 0, 1, 0.4117647, 1,
-0.2455339, -0.2174204, -1.082832, 0, 1, 0.4196078, 1,
-0.238421, 0.7563463, -0.07850787, 0, 1, 0.4235294, 1,
-0.2354553, 0.4353721, 1.570558, 0, 1, 0.4313726, 1,
-0.2351967, 0.606284, 0.2669135, 0, 1, 0.4352941, 1,
-0.2333267, -0.2478838, -1.607402, 0, 1, 0.4431373, 1,
-0.230552, -0.1707186, -4.243376, 0, 1, 0.4470588, 1,
-0.2289494, -0.1069793, -4.335753, 0, 1, 0.454902, 1,
-0.2262416, -0.363707, -2.490618, 0, 1, 0.4588235, 1,
-0.2169161, 0.6902948, 0.1264986, 0, 1, 0.4666667, 1,
-0.2128059, -0.5570486, -1.443635, 0, 1, 0.4705882, 1,
-0.2113873, -0.2654281, -1.465296, 0, 1, 0.4784314, 1,
-0.2087894, -0.4228534, -3.617246, 0, 1, 0.4823529, 1,
-0.2063674, -0.7564437, -2.974619, 0, 1, 0.4901961, 1,
-0.2056663, -0.6262609, -1.935327, 0, 1, 0.4941176, 1,
-0.2054898, -0.5766487, -4.08855, 0, 1, 0.5019608, 1,
-0.2001373, -0.6180747, -1.715703, 0, 1, 0.509804, 1,
-0.1981844, 1.673297, -0.7264489, 0, 1, 0.5137255, 1,
-0.1966513, -1.165033, -1.886445, 0, 1, 0.5215687, 1,
-0.1937094, 0.1349181, -1.019958, 0, 1, 0.5254902, 1,
-0.1921759, -0.5283024, -3.996932, 0, 1, 0.5333334, 1,
-0.1910422, 0.045942, 0.1608973, 0, 1, 0.5372549, 1,
-0.1892625, 1.849775, -0.1007078, 0, 1, 0.5450981, 1,
-0.1838939, -1.026627, -2.846493, 0, 1, 0.5490196, 1,
-0.1834095, -1.525002, -2.681232, 0, 1, 0.5568628, 1,
-0.1775034, 0.9326277, -1.396769, 0, 1, 0.5607843, 1,
-0.1735942, 0.701871, -0.7633618, 0, 1, 0.5686275, 1,
-0.1674285, 0.9888746, -1.340229, 0, 1, 0.572549, 1,
-0.1604232, 0.05372849, -0.2852371, 0, 1, 0.5803922, 1,
-0.1596505, -0.8330834, -2.05671, 0, 1, 0.5843138, 1,
-0.155341, -1.224441, -4.720726, 0, 1, 0.5921569, 1,
-0.1553358, -0.5814615, -3.642369, 0, 1, 0.5960785, 1,
-0.1514567, -0.2029265, -3.018768, 0, 1, 0.6039216, 1,
-0.1361038, -2.064123, -4.396636, 0, 1, 0.6117647, 1,
-0.1358536, 0.1281502, -1.729765, 0, 1, 0.6156863, 1,
-0.1354066, -0.08988013, -2.811076, 0, 1, 0.6235294, 1,
-0.1333256, -1.440609, -2.24059, 0, 1, 0.627451, 1,
-0.1277763, -1.788474, -3.799167, 0, 1, 0.6352941, 1,
-0.1277035, 0.8680691, -1.359698, 0, 1, 0.6392157, 1,
-0.1253685, -0.6600379, -2.756761, 0, 1, 0.6470588, 1,
-0.1199009, 0.7349808, 0.09470743, 0, 1, 0.6509804, 1,
-0.1104222, 0.5652439, -0.8185208, 0, 1, 0.6588235, 1,
-0.1094542, 1.175472, -0.05172687, 0, 1, 0.6627451, 1,
-0.1066531, -1.420948, -3.10544, 0, 1, 0.6705883, 1,
-0.1061563, 0.6493229, -0.7399105, 0, 1, 0.6745098, 1,
-0.1040477, -1.201573, -1.442796, 0, 1, 0.682353, 1,
-0.09969643, 0.03925572, -0.7291679, 0, 1, 0.6862745, 1,
-0.09672852, -0.07402188, -2.029868, 0, 1, 0.6941177, 1,
-0.09623216, 0.3193383, -2.751694, 0, 1, 0.7019608, 1,
-0.09130743, 0.9989893, -0.07362066, 0, 1, 0.7058824, 1,
-0.08860819, 0.9249818, -0.7309404, 0, 1, 0.7137255, 1,
-0.08636408, -0.4377635, -4.30332, 0, 1, 0.7176471, 1,
-0.08104364, -0.2284051, -2.184848, 0, 1, 0.7254902, 1,
-0.07591389, -0.4427921, -2.754478, 0, 1, 0.7294118, 1,
-0.07318929, -0.8504868, -1.874829, 0, 1, 0.7372549, 1,
-0.07296912, -0.1704372, -2.056978, 0, 1, 0.7411765, 1,
-0.0725012, -0.8587351, -2.87312, 0, 1, 0.7490196, 1,
-0.07210097, 0.1295262, -0.5326375, 0, 1, 0.7529412, 1,
-0.07171208, -0.9258929, -4.226937, 0, 1, 0.7607843, 1,
-0.06905074, -0.01139061, -1.965325, 0, 1, 0.7647059, 1,
-0.06876428, -2.496188, -2.690424, 0, 1, 0.772549, 1,
-0.06286035, -0.4848893, -3.10492, 0, 1, 0.7764706, 1,
-0.06190325, -0.8196115, -2.003877, 0, 1, 0.7843137, 1,
-0.05607224, 0.0364823, -2.917013, 0, 1, 0.7882353, 1,
-0.05540206, -0.9828361, -3.237026, 0, 1, 0.7960784, 1,
-0.05360271, -0.195676, -3.297811, 0, 1, 0.8039216, 1,
-0.04689413, 0.3740832, -2.136361, 0, 1, 0.8078431, 1,
-0.04588012, -0.2324951, -2.636779, 0, 1, 0.8156863, 1,
-0.04282152, -1.05985, -4.32129, 0, 1, 0.8196079, 1,
-0.04250047, 0.8666735, -0.6173151, 0, 1, 0.827451, 1,
-0.04176497, -1.348177, -4.497027, 0, 1, 0.8313726, 1,
-0.04148359, 1.385939, -0.2897172, 0, 1, 0.8392157, 1,
-0.0322385, -0.6238662, -3.639069, 0, 1, 0.8431373, 1,
-0.03035196, -1.011402, -4.497799, 0, 1, 0.8509804, 1,
-0.02802644, -1.034358, -2.16478, 0, 1, 0.854902, 1,
-0.02757722, 0.1553562, -0.197368, 0, 1, 0.8627451, 1,
-0.02670533, -0.5561388, -3.858594, 0, 1, 0.8666667, 1,
-0.02632228, 0.2061244, -1.058126, 0, 1, 0.8745098, 1,
-0.02369583, -0.7694789, -3.959843, 0, 1, 0.8784314, 1,
-0.02347072, -0.3228023, -2.622091, 0, 1, 0.8862745, 1,
-0.02076456, 0.6935121, -1.031512, 0, 1, 0.8901961, 1,
-0.02049255, -3.231236, -2.845073, 0, 1, 0.8980392, 1,
-0.01768124, 1.418101, -0.09080122, 0, 1, 0.9058824, 1,
-0.01506683, -0.5991222, -1.828238, 0, 1, 0.9098039, 1,
-0.01074345, -0.4317504, -2.675232, 0, 1, 0.9176471, 1,
-0.01047635, 0.4275946, 0.7092583, 0, 1, 0.9215686, 1,
-0.005191173, 0.3081686, -0.4762347, 0, 1, 0.9294118, 1,
-0.003572129, 0.9762865, 2.030214, 0, 1, 0.9333333, 1,
-0.001512046, -0.1516997, -4.054358, 0, 1, 0.9411765, 1,
0.003758298, -0.4067669, 4.332674, 0, 1, 0.945098, 1,
0.005061531, 0.6025393, 0.02682677, 0, 1, 0.9529412, 1,
0.005147491, -0.692521, 2.785958, 0, 1, 0.9568627, 1,
0.008486814, 0.6177992, -0.4228685, 0, 1, 0.9647059, 1,
0.01135714, 0.4168738, 0.4766716, 0, 1, 0.9686275, 1,
0.02220398, -0.8141605, 2.950099, 0, 1, 0.9764706, 1,
0.02312713, 0.6275921, -1.199134, 0, 1, 0.9803922, 1,
0.02732881, -2.332859, 1.557574, 0, 1, 0.9882353, 1,
0.03029445, -0.8268799, 4.062825, 0, 1, 0.9921569, 1,
0.03141074, 0.4583205, 0.1385056, 0, 1, 1, 1,
0.03187769, -0.5747905, 4.686828, 0, 0.9921569, 1, 1,
0.03313399, 0.5986766, 0.5215096, 0, 0.9882353, 1, 1,
0.03835912, -0.3318473, 2.887529, 0, 0.9803922, 1, 1,
0.03972774, -1.146246, 3.772506, 0, 0.9764706, 1, 1,
0.04136693, -0.4560183, 2.345852, 0, 0.9686275, 1, 1,
0.05290113, -0.3845629, 2.646216, 0, 0.9647059, 1, 1,
0.06067593, 0.1145175, 2.970933, 0, 0.9568627, 1, 1,
0.06147802, 2.46588, 0.6468948, 0, 0.9529412, 1, 1,
0.06363098, 0.1281936, 1.008336, 0, 0.945098, 1, 1,
0.06408429, 0.1263203, 2.048868, 0, 0.9411765, 1, 1,
0.06575213, 0.8945077, 1.100347, 0, 0.9333333, 1, 1,
0.06671729, -0.4356821, 3.3243, 0, 0.9294118, 1, 1,
0.06928682, 2.669741, -1.572081, 0, 0.9215686, 1, 1,
0.0794393, -0.8164183, 3.330044, 0, 0.9176471, 1, 1,
0.08016676, -0.2311144, 0.4300072, 0, 0.9098039, 1, 1,
0.08312492, -1.01495, 4.898487, 0, 0.9058824, 1, 1,
0.08771529, 0.9507766, -0.4611846, 0, 0.8980392, 1, 1,
0.09280764, 0.4106126, -1.180572, 0, 0.8901961, 1, 1,
0.09584912, 0.490977, 0.9720026, 0, 0.8862745, 1, 1,
0.1020787, 0.6613509, -0.5315199, 0, 0.8784314, 1, 1,
0.1050273, -0.5623881, 2.781902, 0, 0.8745098, 1, 1,
0.1073306, 1.059927, 0.9800344, 0, 0.8666667, 1, 1,
0.1074487, -0.1054696, 0.9681979, 0, 0.8627451, 1, 1,
0.1103768, -0.1144715, -0.51331, 0, 0.854902, 1, 1,
0.1105539, 0.2463733, 1.222081, 0, 0.8509804, 1, 1,
0.1140522, -0.4077304, 3.807629, 0, 0.8431373, 1, 1,
0.1164742, 1.150646, 1.566201, 0, 0.8392157, 1, 1,
0.1175487, -0.8656323, 2.114832, 0, 0.8313726, 1, 1,
0.127338, -1.159988, 3.948209, 0, 0.827451, 1, 1,
0.1282308, -2.282177, 1.328578, 0, 0.8196079, 1, 1,
0.1294672, 2.121035, -0.6930648, 0, 0.8156863, 1, 1,
0.1297546, -1.045681, 1.873422, 0, 0.8078431, 1, 1,
0.1308958, -1.548849, 4.006192, 0, 0.8039216, 1, 1,
0.1311436, 0.301012, -0.3501904, 0, 0.7960784, 1, 1,
0.1374892, 1.551189, 0.7228851, 0, 0.7882353, 1, 1,
0.140456, 0.803907, 1.575837, 0, 0.7843137, 1, 1,
0.1445274, -0.004292272, 1.945843, 0, 0.7764706, 1, 1,
0.1479716, -1.456088, 3.101726, 0, 0.772549, 1, 1,
0.1480806, 0.09021759, 0.169616, 0, 0.7647059, 1, 1,
0.1498915, -0.5997601, 2.013134, 0, 0.7607843, 1, 1,
0.1549796, 1.943006, 2.120477, 0, 0.7529412, 1, 1,
0.1561261, -0.3281784, 0.8217046, 0, 0.7490196, 1, 1,
0.1585956, -0.4688804, 1.6701, 0, 0.7411765, 1, 1,
0.1622333, 2.171669, 1.292246, 0, 0.7372549, 1, 1,
0.1645871, 0.3833724, -0.586008, 0, 0.7294118, 1, 1,
0.1672425, 2.052389, -0.8540311, 0, 0.7254902, 1, 1,
0.1706651, 0.6455452, -0.4585191, 0, 0.7176471, 1, 1,
0.1739417, -0.6262441, 1.43771, 0, 0.7137255, 1, 1,
0.1752864, -1.272513, 1.876506, 0, 0.7058824, 1, 1,
0.1789979, -2.316029, 3.730582, 0, 0.6980392, 1, 1,
0.1825234, -0.0115741, 1.313871, 0, 0.6941177, 1, 1,
0.1887341, 0.1810208, 1.324487, 0, 0.6862745, 1, 1,
0.189257, 1.151988, -1.332815, 0, 0.682353, 1, 1,
0.1893618, 0.2817641, 0.3831151, 0, 0.6745098, 1, 1,
0.1950157, 2.247988, -0.5604246, 0, 0.6705883, 1, 1,
0.2005358, -0.9290801, 3.055443, 0, 0.6627451, 1, 1,
0.2066382, 0.4073326, 1.487314, 0, 0.6588235, 1, 1,
0.2111047, 0.5486995, 1.56101, 0, 0.6509804, 1, 1,
0.2111646, 2.137439, 0.2102637, 0, 0.6470588, 1, 1,
0.2112874, -0.154072, 3.040497, 0, 0.6392157, 1, 1,
0.213957, 0.08564931, 2.575958, 0, 0.6352941, 1, 1,
0.2214157, -0.8281468, 3.850292, 0, 0.627451, 1, 1,
0.2224973, -0.5549092, 3.661421, 0, 0.6235294, 1, 1,
0.2240476, 0.3633206, -0.01129765, 0, 0.6156863, 1, 1,
0.2241389, 1.911028, -2.039109, 0, 0.6117647, 1, 1,
0.2327646, 0.3619097, -0.9201136, 0, 0.6039216, 1, 1,
0.2364456, -0.9627249, 3.157369, 0, 0.5960785, 1, 1,
0.2370498, -0.3449957, 2.220368, 0, 0.5921569, 1, 1,
0.2395682, -0.3563653, 3.556535, 0, 0.5843138, 1, 1,
0.2462065, -0.1473971, 0.9840766, 0, 0.5803922, 1, 1,
0.2474432, -2.052524, 3.896446, 0, 0.572549, 1, 1,
0.2483435, -0.3452643, 3.160484, 0, 0.5686275, 1, 1,
0.2488917, -0.8554692, 2.219444, 0, 0.5607843, 1, 1,
0.250401, 0.01714276, 0.2040487, 0, 0.5568628, 1, 1,
0.2514615, 0.3742434, 1.333963, 0, 0.5490196, 1, 1,
0.2556534, 0.5435362, 0.6570684, 0, 0.5450981, 1, 1,
0.2563715, 0.8360946, -1.483736, 0, 0.5372549, 1, 1,
0.2609386, -0.09522702, 2.779276, 0, 0.5333334, 1, 1,
0.2612763, 0.8018923, 1.901074, 0, 0.5254902, 1, 1,
0.2635789, 0.6941538, 1.655667, 0, 0.5215687, 1, 1,
0.2656054, 0.5751768, 1.1016, 0, 0.5137255, 1, 1,
0.2718578, 0.777807, 0.1446005, 0, 0.509804, 1, 1,
0.27256, -0.7123744, 0.6265926, 0, 0.5019608, 1, 1,
0.2754388, -1.7658, 2.005697, 0, 0.4941176, 1, 1,
0.2770011, -1.063825, 0.8105441, 0, 0.4901961, 1, 1,
0.279551, 0.8115502, 0.7373183, 0, 0.4823529, 1, 1,
0.2829576, -0.02238199, 2.554025, 0, 0.4784314, 1, 1,
0.2887719, -0.7499697, 2.721171, 0, 0.4705882, 1, 1,
0.2919297, 1.523737, 0.4112421, 0, 0.4666667, 1, 1,
0.292367, 0.9470289, 1.688682, 0, 0.4588235, 1, 1,
0.2925837, -0.6900334, 3.002928, 0, 0.454902, 1, 1,
0.2985218, 1.267291, -0.6553987, 0, 0.4470588, 1, 1,
0.3048368, -0.6931803, 2.249873, 0, 0.4431373, 1, 1,
0.3077952, 0.8009138, -1.510689, 0, 0.4352941, 1, 1,
0.309135, 1.788003, 0.2515522, 0, 0.4313726, 1, 1,
0.3094209, 1.686072, -0.157701, 0, 0.4235294, 1, 1,
0.3127231, 0.2325855, 1.916902, 0, 0.4196078, 1, 1,
0.3167943, 1.217239, -0.9103973, 0, 0.4117647, 1, 1,
0.320199, 1.164065, 0.08927524, 0, 0.4078431, 1, 1,
0.3203669, 0.3886512, 1.13543, 0, 0.4, 1, 1,
0.3204361, 0.05997217, 1.784295, 0, 0.3921569, 1, 1,
0.3232807, 0.8558515, -1.010846, 0, 0.3882353, 1, 1,
0.3268596, 0.9407275, -0.04002202, 0, 0.3803922, 1, 1,
0.3271818, 0.9794059, 0.2459589, 0, 0.3764706, 1, 1,
0.3307142, 0.5064769, -0.09238082, 0, 0.3686275, 1, 1,
0.3354061, 1.711837, 1.041322, 0, 0.3647059, 1, 1,
0.336037, 4.017687, 0.13685, 0, 0.3568628, 1, 1,
0.3408235, 1.261989, 0.7472947, 0, 0.3529412, 1, 1,
0.3415869, 1.05242, 1.551363, 0, 0.345098, 1, 1,
0.3517846, 0.90597, 1.536411, 0, 0.3411765, 1, 1,
0.3527142, -0.01576478, 0.9338786, 0, 0.3333333, 1, 1,
0.3649472, -0.3435586, 2.140368, 0, 0.3294118, 1, 1,
0.3723895, -0.1583314, 1.176492, 0, 0.3215686, 1, 1,
0.3795215, -1.318941, 3.748235, 0, 0.3176471, 1, 1,
0.3829408, -0.4012965, 2.771885, 0, 0.3098039, 1, 1,
0.3836357, 1.694925, -1.617071, 0, 0.3058824, 1, 1,
0.3877069, -2.241595, 2.699005, 0, 0.2980392, 1, 1,
0.3877459, -0.8092682, 2.76036, 0, 0.2901961, 1, 1,
0.3912749, -0.2143083, 3.176092, 0, 0.2862745, 1, 1,
0.3971204, 0.3870282, 1.352316, 0, 0.2784314, 1, 1,
0.3979577, -1.566591, 2.204189, 0, 0.2745098, 1, 1,
0.4000291, 1.341736, 1.844018, 0, 0.2666667, 1, 1,
0.4027419, 1.561422, 0.4789138, 0, 0.2627451, 1, 1,
0.4067613, -0.3361928, 1.046808, 0, 0.254902, 1, 1,
0.4078839, -0.2581758, 1.515879, 0, 0.2509804, 1, 1,
0.4091843, -0.7599626, 2.066191, 0, 0.2431373, 1, 1,
0.4141214, -0.5108133, 1.260094, 0, 0.2392157, 1, 1,
0.4178891, -0.4384186, 0.7847732, 0, 0.2313726, 1, 1,
0.4195459, -0.9076418, 2.744979, 0, 0.227451, 1, 1,
0.419701, 0.7722524, 0.9283335, 0, 0.2196078, 1, 1,
0.4230655, -1.21437, 1.718964, 0, 0.2156863, 1, 1,
0.4269502, -1.304738, 2.133417, 0, 0.2078431, 1, 1,
0.4319335, 1.675053, -0.7721991, 0, 0.2039216, 1, 1,
0.4324434, -0.02474828, 0.6093173, 0, 0.1960784, 1, 1,
0.436125, -2.771355, 4.832834, 0, 0.1882353, 1, 1,
0.4390186, -0.1633623, 3.193089, 0, 0.1843137, 1, 1,
0.4394058, -0.8338741, 2.370055, 0, 0.1764706, 1, 1,
0.4416266, 0.7424191, 0.9731054, 0, 0.172549, 1, 1,
0.4428356, 0.3411063, 0.9109244, 0, 0.1647059, 1, 1,
0.4460825, -0.764718, 3.70672, 0, 0.1607843, 1, 1,
0.448177, -1.023804, 2.888395, 0, 0.1529412, 1, 1,
0.4509595, 1.063562, 0.1344873, 0, 0.1490196, 1, 1,
0.4514261, -2.212761, 2.608407, 0, 0.1411765, 1, 1,
0.4520512, 0.712056, 0.7070723, 0, 0.1372549, 1, 1,
0.453669, 1.030447, 1.769852, 0, 0.1294118, 1, 1,
0.4545797, -0.529069, 1.539865, 0, 0.1254902, 1, 1,
0.4546306, 0.6397679, -0.8467838, 0, 0.1176471, 1, 1,
0.4556698, 0.3029172, -0.4876659, 0, 0.1137255, 1, 1,
0.459611, 0.3372907, 1.802541, 0, 0.1058824, 1, 1,
0.4597179, -1.563318, 3.62483, 0, 0.09803922, 1, 1,
0.4651937, 0.03743274, 2.566163, 0, 0.09411765, 1, 1,
0.4697168, 1.29448, 1.448706, 0, 0.08627451, 1, 1,
0.470004, 0.2719889, 3.260373, 0, 0.08235294, 1, 1,
0.4742377, -3.10832, 4.886615, 0, 0.07450981, 1, 1,
0.4745399, -2.148318, 3.577608, 0, 0.07058824, 1, 1,
0.4824201, -0.926239, 2.805552, 0, 0.0627451, 1, 1,
0.4827766, -1.139243, 3.263789, 0, 0.05882353, 1, 1,
0.4887874, -0.6496075, 3.384867, 0, 0.05098039, 1, 1,
0.4906573, 0.6908646, 0.4085692, 0, 0.04705882, 1, 1,
0.4930115, 0.8309178, 0.9248223, 0, 0.03921569, 1, 1,
0.4930283, -1.993575, 5.470869, 0, 0.03529412, 1, 1,
0.4992381, 0.02512106, 1.146309, 0, 0.02745098, 1, 1,
0.5017694, -0.08084743, 3.324757, 0, 0.02352941, 1, 1,
0.5109115, -1.586156, 3.542839, 0, 0.01568628, 1, 1,
0.5133054, 0.7338716, 1.843819, 0, 0.01176471, 1, 1,
0.5136476, -0.9787562, 2.640154, 0, 0.003921569, 1, 1,
0.5196655, -0.3725637, 2.48822, 0.003921569, 0, 1, 1,
0.5287097, 1.579872, 1.647415, 0.007843138, 0, 1, 1,
0.5305359, -0.53282, 2.847315, 0.01568628, 0, 1, 1,
0.5326431, 2.242497, 1.28364, 0.01960784, 0, 1, 1,
0.5369762, 0.1823059, 1.130037, 0.02745098, 0, 1, 1,
0.5474975, 0.6486014, 0.3985307, 0.03137255, 0, 1, 1,
0.548535, 0.3860982, 0.697679, 0.03921569, 0, 1, 1,
0.5512421, -0.6218103, 2.51072, 0.04313726, 0, 1, 1,
0.5549716, -2.100322, 1.750834, 0.05098039, 0, 1, 1,
0.5563245, 0.9519483, -0.2098465, 0.05490196, 0, 1, 1,
0.5598451, 0.1743035, 1.590599, 0.0627451, 0, 1, 1,
0.5650288, -1.710066, 3.960095, 0.06666667, 0, 1, 1,
0.5689936, -0.7449144, 3.297206, 0.07450981, 0, 1, 1,
0.572808, 0.9914971, -1.338938, 0.07843138, 0, 1, 1,
0.5748883, -0.3728753, 2.153111, 0.08627451, 0, 1, 1,
0.5754853, -1.194478, 4.671492, 0.09019608, 0, 1, 1,
0.5804545, -1.767213, 3.855438, 0.09803922, 0, 1, 1,
0.5816172, -1.953632, 4.974682, 0.1058824, 0, 1, 1,
0.5836699, 1.511622, 1.421415, 0.1098039, 0, 1, 1,
0.5837888, 0.07955258, 1.058995, 0.1176471, 0, 1, 1,
0.5868991, -0.1826559, 0.7014415, 0.1215686, 0, 1, 1,
0.5893921, 0.5339609, 1.448688, 0.1294118, 0, 1, 1,
0.5894474, 1.551236, 1.6804, 0.1333333, 0, 1, 1,
0.5912423, 1.53831, 1.502299, 0.1411765, 0, 1, 1,
0.5921645, 0.6718892, 1.122597, 0.145098, 0, 1, 1,
0.5942127, 1.410404, 0.2551345, 0.1529412, 0, 1, 1,
0.5954461, 0.26127, 1.177198, 0.1568628, 0, 1, 1,
0.599407, -0.410883, 3.611558, 0.1647059, 0, 1, 1,
0.6041267, -0.2796076, 1.091275, 0.1686275, 0, 1, 1,
0.6096635, 0.2367163, 1.612751, 0.1764706, 0, 1, 1,
0.6104091, -1.108206, 4.507045, 0.1803922, 0, 1, 1,
0.6112323, 0.06697094, 2.004936, 0.1882353, 0, 1, 1,
0.6121985, 2.467987, 0.007216505, 0.1921569, 0, 1, 1,
0.616562, 0.62192, 1.104352, 0.2, 0, 1, 1,
0.617643, -1.896956, 2.355186, 0.2078431, 0, 1, 1,
0.6363689, 0.03942159, 1.8392, 0.2117647, 0, 1, 1,
0.6416419, -0.3731526, 2.476089, 0.2196078, 0, 1, 1,
0.6434457, -1.217113, 3.274662, 0.2235294, 0, 1, 1,
0.6525897, 0.9930078, 0.5429207, 0.2313726, 0, 1, 1,
0.6560701, 1.071417, 0.5669959, 0.2352941, 0, 1, 1,
0.6591882, 0.4350439, 1.274107, 0.2431373, 0, 1, 1,
0.6606641, 0.5354697, 0.2616296, 0.2470588, 0, 1, 1,
0.6613086, 2.638267, 0.4251594, 0.254902, 0, 1, 1,
0.6623091, -1.676752, 1.47245, 0.2588235, 0, 1, 1,
0.6756622, -0.261811, 3.153621, 0.2666667, 0, 1, 1,
0.6794798, 0.4838216, 1.335506, 0.2705882, 0, 1, 1,
0.6797517, 1.073825, -0.8511615, 0.2784314, 0, 1, 1,
0.6823988, -0.8014331, 1.892808, 0.282353, 0, 1, 1,
0.6851644, 0.6996974, 0.9187046, 0.2901961, 0, 1, 1,
0.685566, -1.480132, 2.57207, 0.2941177, 0, 1, 1,
0.6883029, 0.1920936, 0.8172063, 0.3019608, 0, 1, 1,
0.6892661, 0.5419447, -1.50191, 0.3098039, 0, 1, 1,
0.6902646, -0.2194403, 2.538693, 0.3137255, 0, 1, 1,
0.6931342, 0.765108, 0.303301, 0.3215686, 0, 1, 1,
0.6939127, 0.8526353, 0.08714562, 0.3254902, 0, 1, 1,
0.7028001, -1.682699, 1.421661, 0.3333333, 0, 1, 1,
0.7059005, 0.3674393, 1.826009, 0.3372549, 0, 1, 1,
0.7062448, -0.5927414, 1.47151, 0.345098, 0, 1, 1,
0.7115941, 0.8807446, -0.10488, 0.3490196, 0, 1, 1,
0.7116531, -0.6644229, 3.187198, 0.3568628, 0, 1, 1,
0.7193059, -0.2379652, 1.514848, 0.3607843, 0, 1, 1,
0.7228972, 0.4327513, 1.398946, 0.3686275, 0, 1, 1,
0.7245036, -0.3796739, 2.675317, 0.372549, 0, 1, 1,
0.7264257, -0.6939736, 2.660092, 0.3803922, 0, 1, 1,
0.7330424, -1.007939, 3.269524, 0.3843137, 0, 1, 1,
0.7349306, 1.406428, 0.736034, 0.3921569, 0, 1, 1,
0.7374062, -0.6585333, 2.47836, 0.3960784, 0, 1, 1,
0.7395953, -0.6119689, 3.545666, 0.4039216, 0, 1, 1,
0.7472457, 0.09726058, 0.7745474, 0.4117647, 0, 1, 1,
0.7482585, 1.106123, -1.159308, 0.4156863, 0, 1, 1,
0.7493787, 0.00563819, 0.05298073, 0.4235294, 0, 1, 1,
0.7544855, -1.893842, 3.444533, 0.427451, 0, 1, 1,
0.7583971, -0.1940323, 1.960352, 0.4352941, 0, 1, 1,
0.7638511, -1.960554, 4.388089, 0.4392157, 0, 1, 1,
0.7657636, 1.322871, 0.6148354, 0.4470588, 0, 1, 1,
0.7657992, 0.822153, 1.847105, 0.4509804, 0, 1, 1,
0.7670152, 0.9010525, 0.2030625, 0.4588235, 0, 1, 1,
0.76891, -0.3185484, 3.716814, 0.4627451, 0, 1, 1,
0.7704322, 0.8146598, 1.549511, 0.4705882, 0, 1, 1,
0.7711408, 0.05385087, 1.752425, 0.4745098, 0, 1, 1,
0.773785, -2.499031, 3.314723, 0.4823529, 0, 1, 1,
0.7799562, -0.00766928, 0.4416431, 0.4862745, 0, 1, 1,
0.7828051, 0.9408208, 0.08628036, 0.4941176, 0, 1, 1,
0.7829934, 0.8698438, 1.421592, 0.5019608, 0, 1, 1,
0.787034, -1.142744, 1.396293, 0.5058824, 0, 1, 1,
0.7920719, 0.1179864, 2.887101, 0.5137255, 0, 1, 1,
0.7986386, 1.493272, 0.8285661, 0.5176471, 0, 1, 1,
0.8005616, 1.121674, 0.1091216, 0.5254902, 0, 1, 1,
0.8020286, -0.9670452, 3.487892, 0.5294118, 0, 1, 1,
0.8110674, -0.2144666, 2.371714, 0.5372549, 0, 1, 1,
0.8120636, -0.5670442, 2.492508, 0.5411765, 0, 1, 1,
0.8130251, -0.5888269, 2.456086, 0.5490196, 0, 1, 1,
0.8163394, 0.918879, -0.8820328, 0.5529412, 0, 1, 1,
0.8167971, 1.572725, -0.819222, 0.5607843, 0, 1, 1,
0.8196539, -0.5384525, 0.9598517, 0.5647059, 0, 1, 1,
0.8218382, 1.459499, 0.3699244, 0.572549, 0, 1, 1,
0.822377, 1.070031, 0.3037392, 0.5764706, 0, 1, 1,
0.8256863, 1.713091, -0.5766526, 0.5843138, 0, 1, 1,
0.8300985, 1.231703, 0.5837311, 0.5882353, 0, 1, 1,
0.8307186, -0.6212956, 2.354933, 0.5960785, 0, 1, 1,
0.831011, -0.6508709, 3.396456, 0.6039216, 0, 1, 1,
0.8330649, -1.366448, 3.7959, 0.6078432, 0, 1, 1,
0.8346391, 0.6389013, 2.20144, 0.6156863, 0, 1, 1,
0.8419076, -0.05354938, 2.654062, 0.6196079, 0, 1, 1,
0.8428576, -1.119063, 1.099382, 0.627451, 0, 1, 1,
0.8460892, 0.1654375, 1.901936, 0.6313726, 0, 1, 1,
0.8500418, 0.4395265, 0.6784502, 0.6392157, 0, 1, 1,
0.8559375, 0.6782925, 0.01889972, 0.6431373, 0, 1, 1,
0.8628067, 0.5123907, 0.2668415, 0.6509804, 0, 1, 1,
0.8702846, 0.4372718, 0.2069798, 0.654902, 0, 1, 1,
0.8726821, -2.080324, 1.804185, 0.6627451, 0, 1, 1,
0.8747743, 0.9215259, -0.4240309, 0.6666667, 0, 1, 1,
0.8817222, -0.7220038, 1.91614, 0.6745098, 0, 1, 1,
0.884296, -1.089187, 2.056627, 0.6784314, 0, 1, 1,
0.889033, 0.9970369, 0.3088109, 0.6862745, 0, 1, 1,
0.8901165, 0.02128591, 1.531123, 0.6901961, 0, 1, 1,
0.8913248, -1.271752, 2.59763, 0.6980392, 0, 1, 1,
0.891565, 0.06331825, 0.8459095, 0.7058824, 0, 1, 1,
0.8921306, 0.5117205, 1.242813, 0.7098039, 0, 1, 1,
0.8984061, -1.734366, 2.3357, 0.7176471, 0, 1, 1,
0.8999575, 2.060343, 0.1823127, 0.7215686, 0, 1, 1,
0.9017522, 1.461784, -0.5434728, 0.7294118, 0, 1, 1,
0.903832, 2.24115, 0.2296677, 0.7333333, 0, 1, 1,
0.9063452, -0.477816, 1.86729, 0.7411765, 0, 1, 1,
0.9074299, 1.855383, -0.4834218, 0.7450981, 0, 1, 1,
0.9074445, 1.207928, 0.7174162, 0.7529412, 0, 1, 1,
0.9087479, -1.696055, 2.583965, 0.7568628, 0, 1, 1,
0.9099769, 0.2415842, 0.3264616, 0.7647059, 0, 1, 1,
0.9121816, 0.5044227, 0.3852098, 0.7686275, 0, 1, 1,
0.9131665, -1.293241, 3.58645, 0.7764706, 0, 1, 1,
0.9156096, -0.3160019, 1.827744, 0.7803922, 0, 1, 1,
0.9183722, 1.544779, -1.107093, 0.7882353, 0, 1, 1,
0.934972, -0.4695847, 2.552069, 0.7921569, 0, 1, 1,
0.9358686, -0.6113719, 2.443111, 0.8, 0, 1, 1,
0.9366329, 2.079854, -2.29178, 0.8078431, 0, 1, 1,
0.9435275, 1.397809, 1.319777, 0.8117647, 0, 1, 1,
0.9441225, 0.004656484, 1.026889, 0.8196079, 0, 1, 1,
0.9461901, -0.5003166, 1.463135, 0.8235294, 0, 1, 1,
0.9471722, -0.646156, 2.087958, 0.8313726, 0, 1, 1,
0.9481186, 0.04846001, 2.090756, 0.8352941, 0, 1, 1,
0.9518221, 0.1803777, 2.537427, 0.8431373, 0, 1, 1,
0.9533002, -1.713063, 3.004599, 0.8470588, 0, 1, 1,
0.9542574, -1.126816, 3.721429, 0.854902, 0, 1, 1,
0.9563887, 0.07376937, 2.493214, 0.8588235, 0, 1, 1,
0.9578756, 1.261081, 1.166945, 0.8666667, 0, 1, 1,
0.9617081, -0.6786284, 0.2122189, 0.8705882, 0, 1, 1,
0.9637309, 0.3614602, 3.506514, 0.8784314, 0, 1, 1,
0.9691167, 0.2788261, 2.541243, 0.8823529, 0, 1, 1,
0.9694116, -0.1282438, 1.496831, 0.8901961, 0, 1, 1,
0.97682, -0.515062, 2.097357, 0.8941177, 0, 1, 1,
0.9787401, -0.1607201, 0.8438864, 0.9019608, 0, 1, 1,
0.9795783, -1.027143, 2.544646, 0.9098039, 0, 1, 1,
0.9818173, 0.7777992, -0.3769098, 0.9137255, 0, 1, 1,
0.9820098, 0.2718796, 2.383746, 0.9215686, 0, 1, 1,
0.9834906, 1.203059, 0.6677014, 0.9254902, 0, 1, 1,
0.9893519, -1.372921, 1.796194, 0.9333333, 0, 1, 1,
0.9945492, -0.9193734, 2.943209, 0.9372549, 0, 1, 1,
0.9962747, -0.2361033, -0.04593844, 0.945098, 0, 1, 1,
0.9984627, 1.45652, 1.959111, 0.9490196, 0, 1, 1,
1.005715, 1.572964, 1.233755, 0.9568627, 0, 1, 1,
1.007607, -0.8890405, 1.16436, 0.9607843, 0, 1, 1,
1.007791, 0.6923895, 1.797159, 0.9686275, 0, 1, 1,
1.008004, -2.010477, 2.077946, 0.972549, 0, 1, 1,
1.009792, -0.3697561, 0.96567, 0.9803922, 0, 1, 1,
1.01285, 1.188554, 1.548943, 0.9843137, 0, 1, 1,
1.022797, -1.463816, 2.693174, 0.9921569, 0, 1, 1,
1.025842, 1.558138, 1.107121, 0.9960784, 0, 1, 1,
1.031324, -0.2703122, 2.142555, 1, 0, 0.9960784, 1,
1.034034, -1.542163, 3.395303, 1, 0, 0.9882353, 1,
1.034095, 0.4547225, 1.705719, 1, 0, 0.9843137, 1,
1.036423, -1.026152, 2.251676, 1, 0, 0.9764706, 1,
1.038065, -0.04577764, 1.310886, 1, 0, 0.972549, 1,
1.038357, 0.03338667, 0.7943857, 1, 0, 0.9647059, 1,
1.039381, 1.071246, 0.5014544, 1, 0, 0.9607843, 1,
1.048068, 0.5376192, -0.9177123, 1, 0, 0.9529412, 1,
1.052194, 1.125404, -0.2719822, 1, 0, 0.9490196, 1,
1.054774, 0.5696681, -0.3024912, 1, 0, 0.9411765, 1,
1.055811, -2.735345, 3.266048, 1, 0, 0.9372549, 1,
1.06499, 1.042979, 0.5571282, 1, 0, 0.9294118, 1,
1.069947, 0.2191589, 1.835044, 1, 0, 0.9254902, 1,
1.071934, -0.2286305, 1.881567, 1, 0, 0.9176471, 1,
1.078153, -0.3550057, 1.808345, 1, 0, 0.9137255, 1,
1.08267, -0.5710782, 1.842987, 1, 0, 0.9058824, 1,
1.085627, -0.7989651, 2.641642, 1, 0, 0.9019608, 1,
1.085756, 0.1552496, 0.9782059, 1, 0, 0.8941177, 1,
1.08642, 0.02898668, 1.322818, 1, 0, 0.8862745, 1,
1.090557, 1.755263, -0.2056231, 1, 0, 0.8823529, 1,
1.095632, 2.290118, -1.179995, 1, 0, 0.8745098, 1,
1.098223, -0.7024214, 3.934618, 1, 0, 0.8705882, 1,
1.105036, -2.304658, 2.56804, 1, 0, 0.8627451, 1,
1.108438, -0.5464725, 2.053532, 1, 0, 0.8588235, 1,
1.109403, 1.109704, -1.875544, 1, 0, 0.8509804, 1,
1.114361, 0.9567495, 0.78182, 1, 0, 0.8470588, 1,
1.122488, 0.7498587, 1.530453, 1, 0, 0.8392157, 1,
1.126675, 0.1611295, 3.792775, 1, 0, 0.8352941, 1,
1.128375, 0.7397975, 0.5848749, 1, 0, 0.827451, 1,
1.132404, -1.3533, 2.895439, 1, 0, 0.8235294, 1,
1.13529, 0.3543403, 1.3367, 1, 0, 0.8156863, 1,
1.137261, 0.4330159, 2.126389, 1, 0, 0.8117647, 1,
1.138101, -0.3380137, 1.733745, 1, 0, 0.8039216, 1,
1.138695, 1.04555, 0.7551047, 1, 0, 0.7960784, 1,
1.146817, -0.1605912, -0.06674594, 1, 0, 0.7921569, 1,
1.15065, -0.5819549, 2.999208, 1, 0, 0.7843137, 1,
1.159002, -1.329767, 3.155792, 1, 0, 0.7803922, 1,
1.170172, -1.306359, 3.906878, 1, 0, 0.772549, 1,
1.181867, 1.84872, 0.5512801, 1, 0, 0.7686275, 1,
1.182569, 0.4576834, -0.715638, 1, 0, 0.7607843, 1,
1.18411, 0.6855322, 1.324653, 1, 0, 0.7568628, 1,
1.187277, -0.0336663, 2.558639, 1, 0, 0.7490196, 1,
1.199873, -0.7409422, 2.461628, 1, 0, 0.7450981, 1,
1.203671, 0.713778, 3.065041, 1, 0, 0.7372549, 1,
1.204786, 1.656362, 2.495755, 1, 0, 0.7333333, 1,
1.206452, 1.317763, 0.8709013, 1, 0, 0.7254902, 1,
1.208423, -1.159974, 2.900184, 1, 0, 0.7215686, 1,
1.209849, 0.3023579, 0.8278142, 1, 0, 0.7137255, 1,
1.220833, -1.11459, 2.73123, 1, 0, 0.7098039, 1,
1.223862, 0.621974, 1.223928, 1, 0, 0.7019608, 1,
1.226737, 1.190903, 0.5597661, 1, 0, 0.6941177, 1,
1.227579, 0.177655, 1.984259, 1, 0, 0.6901961, 1,
1.23172, -0.02459733, 2.55857, 1, 0, 0.682353, 1,
1.235348, 0.03186593, 0.5686839, 1, 0, 0.6784314, 1,
1.235564, -0.6462992, 1.509126, 1, 0, 0.6705883, 1,
1.238518, 1.373266, -0.01089106, 1, 0, 0.6666667, 1,
1.246387, -1.288669, 1.938081, 1, 0, 0.6588235, 1,
1.260772, -1.030085, 3.562814, 1, 0, 0.654902, 1,
1.262154, 0.007177544, 1.955241, 1, 0, 0.6470588, 1,
1.264601, 0.4945524, 0.5495174, 1, 0, 0.6431373, 1,
1.268594, -0.4093109, 0.9453887, 1, 0, 0.6352941, 1,
1.269349, -0.3595535, 2.661347, 1, 0, 0.6313726, 1,
1.27298, -1.466099, 3.298692, 1, 0, 0.6235294, 1,
1.278665, -0.1569576, -0.3664311, 1, 0, 0.6196079, 1,
1.279117, -1.506436, 1.34082, 1, 0, 0.6117647, 1,
1.303371, -1.895902, 2.735645, 1, 0, 0.6078432, 1,
1.313214, 2.215083, 1.525853, 1, 0, 0.6, 1,
1.326988, 1.887338, -0.3858127, 1, 0, 0.5921569, 1,
1.330215, 0.5070767, 1.580576, 1, 0, 0.5882353, 1,
1.334033, 0.2013533, 1.221537, 1, 0, 0.5803922, 1,
1.342087, 0.1796324, 1.803231, 1, 0, 0.5764706, 1,
1.348541, -0.1194838, 0.5299119, 1, 0, 0.5686275, 1,
1.351555, -1.628003, 1.794444, 1, 0, 0.5647059, 1,
1.351855, -0.5527016, 2.302134, 1, 0, 0.5568628, 1,
1.393489, -0.09358738, 1.139991, 1, 0, 0.5529412, 1,
1.411787, 1.61581, 2.307014, 1, 0, 0.5450981, 1,
1.415273, -1.515641, 2.81221, 1, 0, 0.5411765, 1,
1.420909, 0.596722, -0.2394614, 1, 0, 0.5333334, 1,
1.42091, 1.306055, 1.772535, 1, 0, 0.5294118, 1,
1.43299, 1.330334, 1.660718, 1, 0, 0.5215687, 1,
1.446917, -0.3204699, 3.348191, 1, 0, 0.5176471, 1,
1.453473, 0.7897781, 0.7022853, 1, 0, 0.509804, 1,
1.456926, 1.606004, -0.7641445, 1, 0, 0.5058824, 1,
1.459565, 0.6749811, -0.7707349, 1, 0, 0.4980392, 1,
1.468612, -0.07636105, 0.5015953, 1, 0, 0.4901961, 1,
1.476877, 1.45146, 0.2450568, 1, 0, 0.4862745, 1,
1.482434, 0.06853609, 0.7666824, 1, 0, 0.4784314, 1,
1.495147, -0.05911189, 2.397917, 1, 0, 0.4745098, 1,
1.501245, -1.501949, 3.055109, 1, 0, 0.4666667, 1,
1.51516, -0.7616398, 2.657234, 1, 0, 0.4627451, 1,
1.515187, 0.3425604, 2.169417, 1, 0, 0.454902, 1,
1.515274, -0.3341582, 1.612044, 1, 0, 0.4509804, 1,
1.541506, 0.031639, 1.174439, 1, 0, 0.4431373, 1,
1.552259, -1.679004, 1.844858, 1, 0, 0.4392157, 1,
1.571732, -0.4419524, 1.547568, 1, 0, 0.4313726, 1,
1.575365, -1.876386, 2.530493, 1, 0, 0.427451, 1,
1.575638, 0.4536555, 0.1299977, 1, 0, 0.4196078, 1,
1.576676, 0.3595027, 1.739509, 1, 0, 0.4156863, 1,
1.577591, -1.678635, 4.936054, 1, 0, 0.4078431, 1,
1.58074, -1.384278, 3.111385, 1, 0, 0.4039216, 1,
1.587989, -0.6713043, 2.299392, 1, 0, 0.3960784, 1,
1.591567, -1.180404, 2.182876, 1, 0, 0.3882353, 1,
1.607734, 0.2670818, 1.519378, 1, 0, 0.3843137, 1,
1.619778, 0.9024481, -0.7095616, 1, 0, 0.3764706, 1,
1.630668, 0.4919674, 0.9772463, 1, 0, 0.372549, 1,
1.635027, -0.02418883, 1.669811, 1, 0, 0.3647059, 1,
1.642987, -0.0946621, -0.1262844, 1, 0, 0.3607843, 1,
1.648483, -0.1827323, 1.866647, 1, 0, 0.3529412, 1,
1.653823, -0.4468456, 1.501498, 1, 0, 0.3490196, 1,
1.661108, -0.4640393, 2.773801, 1, 0, 0.3411765, 1,
1.661119, -1.406618, 0.7121251, 1, 0, 0.3372549, 1,
1.670135, -0.9222115, 3.816475, 1, 0, 0.3294118, 1,
1.68385, 1.278144, 1.328013, 1, 0, 0.3254902, 1,
1.710136, 0.07329153, 1.895649, 1, 0, 0.3176471, 1,
1.714054, 1.531314, 0.3541265, 1, 0, 0.3137255, 1,
1.724816, 1.199528, 1.599531, 1, 0, 0.3058824, 1,
1.734784, 1.971366, 2.554418, 1, 0, 0.2980392, 1,
1.740963, 0.5918105, 0.5708981, 1, 0, 0.2941177, 1,
1.746655, 2.687698, -1.592635, 1, 0, 0.2862745, 1,
1.746889, -0.5259892, 1.757097, 1, 0, 0.282353, 1,
1.759652, 0.2279782, 0.02145724, 1, 0, 0.2745098, 1,
1.768211, 0.0742001, 1.246845, 1, 0, 0.2705882, 1,
1.805143, -0.6398062, 2.985194, 1, 0, 0.2627451, 1,
1.806563, 1.166779, 2.249073, 1, 0, 0.2588235, 1,
1.813302, -0.07058415, 3.219512, 1, 0, 0.2509804, 1,
1.814872, -0.8765095, 2.92391, 1, 0, 0.2470588, 1,
1.822702, 0.3001415, 2.335912, 1, 0, 0.2392157, 1,
1.852341, 0.3349118, 1.05127, 1, 0, 0.2352941, 1,
1.913472, -0.09065921, 1.583623, 1, 0, 0.227451, 1,
1.916525, 0.4410346, 3.562343, 1, 0, 0.2235294, 1,
1.926904, 2.676941, 1.269774, 1, 0, 0.2156863, 1,
1.9718, -0.1844956, 1.278829, 1, 0, 0.2117647, 1,
2.010355, -0.9072956, 2.386728, 1, 0, 0.2039216, 1,
2.010543, 0.1862044, 1.166993, 1, 0, 0.1960784, 1,
2.022528, -0.9667822, -0.4698962, 1, 0, 0.1921569, 1,
2.041721, -0.3485773, -0.3575976, 1, 0, 0.1843137, 1,
2.044466, -0.6536242, 0.1516303, 1, 0, 0.1803922, 1,
2.083674, 0.653254, 1.461838, 1, 0, 0.172549, 1,
2.16627, 0.409103, 0.00153463, 1, 0, 0.1686275, 1,
2.219916, 1.754917, 2.137264, 1, 0, 0.1607843, 1,
2.226096, -1.382744, 0.9252467, 1, 0, 0.1568628, 1,
2.263615, 0.3419878, 2.528555, 1, 0, 0.1490196, 1,
2.269551, 0.5815045, 1.753186, 1, 0, 0.145098, 1,
2.304374, -0.2290185, 2.673041, 1, 0, 0.1372549, 1,
2.306257, 1.643423, 0.7966491, 1, 0, 0.1333333, 1,
2.310423, -0.6201552, 2.558568, 1, 0, 0.1254902, 1,
2.324767, -0.3912881, -1.132556, 1, 0, 0.1215686, 1,
2.340791, -0.1472188, 1.677541, 1, 0, 0.1137255, 1,
2.353502, 1.553374, -0.5249624, 1, 0, 0.1098039, 1,
2.365079, 2.589585, 1.623043, 1, 0, 0.1019608, 1,
2.395053, 0.1245082, 1.760102, 1, 0, 0.09411765, 1,
2.398687, 0.5224016, 1.416762, 1, 0, 0.09019608, 1,
2.422581, -2.276878, 1.968359, 1, 0, 0.08235294, 1,
2.447869, 0.08646306, 2.914577, 1, 0, 0.07843138, 1,
2.457437, -0.5831789, 0.3074386, 1, 0, 0.07058824, 1,
2.45839, -1.604152, 3.041732, 1, 0, 0.06666667, 1,
2.47761, -0.1542807, 1.486665, 1, 0, 0.05882353, 1,
2.495632, -1.430636, 4.445064, 1, 0, 0.05490196, 1,
2.502232, -0.3106593, 1.526038, 1, 0, 0.04705882, 1,
2.561606, 0.6052532, 0.134261, 1, 0, 0.04313726, 1,
2.628995, 0.7946732, 0.7710002, 1, 0, 0.03529412, 1,
2.751521, -0.5204296, 2.560767, 1, 0, 0.03137255, 1,
2.790732, -1.903629, 1.471808, 1, 0, 0.02352941, 1,
2.960724, 1.337761, -0.2985394, 1, 0, 0.01960784, 1,
3.417037, 0.5555838, 1.311076, 1, 0, 0.01176471, 1,
3.666966, -0.3693132, 1.863048, 1, 0, 0.007843138, 1
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
0.4145358, -4.459928, -6.891821, 0, -0.5, 0.5, 0.5,
0.4145358, -4.459928, -6.891821, 1, -0.5, 0.5, 0.5,
0.4145358, -4.459928, -6.891821, 1, 1.5, 0.5, 0.5,
0.4145358, -4.459928, -6.891821, 0, 1.5, 0.5, 0.5
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
-3.940469, 0.3932258, -6.891821, 0, -0.5, 0.5, 0.5,
-3.940469, 0.3932258, -6.891821, 1, -0.5, 0.5, 0.5,
-3.940469, 0.3932258, -6.891821, 1, 1.5, 0.5, 0.5,
-3.940469, 0.3932258, -6.891821, 0, 1.5, 0.5, 0.5
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
-3.940469, -4.459928, 0.1854095, 0, -0.5, 0.5, 0.5,
-3.940469, -4.459928, 0.1854095, 1, -0.5, 0.5, 0.5,
-3.940469, -4.459928, 0.1854095, 1, 1.5, 0.5, 0.5,
-3.940469, -4.459928, 0.1854095, 0, 1.5, 0.5, 0.5
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
-2, -3.33997, -5.258614,
3, -3.33997, -5.258614,
-2, -3.33997, -5.258614,
-2, -3.526629, -5.530815,
-1, -3.33997, -5.258614,
-1, -3.526629, -5.530815,
0, -3.33997, -5.258614,
0, -3.526629, -5.530815,
1, -3.33997, -5.258614,
1, -3.526629, -5.530815,
2, -3.33997, -5.258614,
2, -3.526629, -5.530815,
3, -3.33997, -5.258614,
3, -3.526629, -5.530815
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
-2, -3.899949, -6.075217, 0, -0.5, 0.5, 0.5,
-2, -3.899949, -6.075217, 1, -0.5, 0.5, 0.5,
-2, -3.899949, -6.075217, 1, 1.5, 0.5, 0.5,
-2, -3.899949, -6.075217, 0, 1.5, 0.5, 0.5,
-1, -3.899949, -6.075217, 0, -0.5, 0.5, 0.5,
-1, -3.899949, -6.075217, 1, -0.5, 0.5, 0.5,
-1, -3.899949, -6.075217, 1, 1.5, 0.5, 0.5,
-1, -3.899949, -6.075217, 0, 1.5, 0.5, 0.5,
0, -3.899949, -6.075217, 0, -0.5, 0.5, 0.5,
0, -3.899949, -6.075217, 1, -0.5, 0.5, 0.5,
0, -3.899949, -6.075217, 1, 1.5, 0.5, 0.5,
0, -3.899949, -6.075217, 0, 1.5, 0.5, 0.5,
1, -3.899949, -6.075217, 0, -0.5, 0.5, 0.5,
1, -3.899949, -6.075217, 1, -0.5, 0.5, 0.5,
1, -3.899949, -6.075217, 1, 1.5, 0.5, 0.5,
1, -3.899949, -6.075217, 0, 1.5, 0.5, 0.5,
2, -3.899949, -6.075217, 0, -0.5, 0.5, 0.5,
2, -3.899949, -6.075217, 1, -0.5, 0.5, 0.5,
2, -3.899949, -6.075217, 1, 1.5, 0.5, 0.5,
2, -3.899949, -6.075217, 0, 1.5, 0.5, 0.5,
3, -3.899949, -6.075217, 0, -0.5, 0.5, 0.5,
3, -3.899949, -6.075217, 1, -0.5, 0.5, 0.5,
3, -3.899949, -6.075217, 1, 1.5, 0.5, 0.5,
3, -3.899949, -6.075217, 0, 1.5, 0.5, 0.5
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
-2.935467, -2, -5.258614,
-2.935467, 4, -5.258614,
-2.935467, -2, -5.258614,
-3.102968, -2, -5.530815,
-2.935467, 0, -5.258614,
-3.102968, 0, -5.530815,
-2.935467, 2, -5.258614,
-3.102968, 2, -5.530815,
-2.935467, 4, -5.258614,
-3.102968, 4, -5.530815
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
"0",
"2",
"4"
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
-3.437968, -2, -6.075217, 0, -0.5, 0.5, 0.5,
-3.437968, -2, -6.075217, 1, -0.5, 0.5, 0.5,
-3.437968, -2, -6.075217, 1, 1.5, 0.5, 0.5,
-3.437968, -2, -6.075217, 0, 1.5, 0.5, 0.5,
-3.437968, 0, -6.075217, 0, -0.5, 0.5, 0.5,
-3.437968, 0, -6.075217, 1, -0.5, 0.5, 0.5,
-3.437968, 0, -6.075217, 1, 1.5, 0.5, 0.5,
-3.437968, 0, -6.075217, 0, 1.5, 0.5, 0.5,
-3.437968, 2, -6.075217, 0, -0.5, 0.5, 0.5,
-3.437968, 2, -6.075217, 1, -0.5, 0.5, 0.5,
-3.437968, 2, -6.075217, 1, 1.5, 0.5, 0.5,
-3.437968, 2, -6.075217, 0, 1.5, 0.5, 0.5,
-3.437968, 4, -6.075217, 0, -0.5, 0.5, 0.5,
-3.437968, 4, -6.075217, 1, -0.5, 0.5, 0.5,
-3.437968, 4, -6.075217, 1, 1.5, 0.5, 0.5,
-3.437968, 4, -6.075217, 0, 1.5, 0.5, 0.5
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
-2.935467, -3.33997, -4,
-2.935467, -3.33997, 4,
-2.935467, -3.33997, -4,
-3.102968, -3.526629, -4,
-2.935467, -3.33997, -2,
-3.102968, -3.526629, -2,
-2.935467, -3.33997, 0,
-3.102968, -3.526629, 0,
-2.935467, -3.33997, 2,
-3.102968, -3.526629, 2,
-2.935467, -3.33997, 4,
-3.102968, -3.526629, 4
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
-3.437968, -3.899949, -4, 0, -0.5, 0.5, 0.5,
-3.437968, -3.899949, -4, 1, -0.5, 0.5, 0.5,
-3.437968, -3.899949, -4, 1, 1.5, 0.5, 0.5,
-3.437968, -3.899949, -4, 0, 1.5, 0.5, 0.5,
-3.437968, -3.899949, -2, 0, -0.5, 0.5, 0.5,
-3.437968, -3.899949, -2, 1, -0.5, 0.5, 0.5,
-3.437968, -3.899949, -2, 1, 1.5, 0.5, 0.5,
-3.437968, -3.899949, -2, 0, 1.5, 0.5, 0.5,
-3.437968, -3.899949, 0, 0, -0.5, 0.5, 0.5,
-3.437968, -3.899949, 0, 1, -0.5, 0.5, 0.5,
-3.437968, -3.899949, 0, 1, 1.5, 0.5, 0.5,
-3.437968, -3.899949, 0, 0, 1.5, 0.5, 0.5,
-3.437968, -3.899949, 2, 0, -0.5, 0.5, 0.5,
-3.437968, -3.899949, 2, 1, -0.5, 0.5, 0.5,
-3.437968, -3.899949, 2, 1, 1.5, 0.5, 0.5,
-3.437968, -3.899949, 2, 0, 1.5, 0.5, 0.5,
-3.437968, -3.899949, 4, 0, -0.5, 0.5, 0.5,
-3.437968, -3.899949, 4, 1, -0.5, 0.5, 0.5,
-3.437968, -3.899949, 4, 1, 1.5, 0.5, 0.5,
-3.437968, -3.899949, 4, 0, 1.5, 0.5, 0.5
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
-2.935467, -3.33997, -5.258614,
-2.935467, 4.126421, -5.258614,
-2.935467, -3.33997, 5.629433,
-2.935467, 4.126421, 5.629433,
-2.935467, -3.33997, -5.258614,
-2.935467, -3.33997, 5.629433,
-2.935467, 4.126421, -5.258614,
-2.935467, 4.126421, 5.629433,
-2.935467, -3.33997, -5.258614,
3.764539, -3.33997, -5.258614,
-2.935467, -3.33997, 5.629433,
3.764539, -3.33997, 5.629433,
-2.935467, 4.126421, -5.258614,
3.764539, 4.126421, -5.258614,
-2.935467, 4.126421, 5.629433,
3.764539, 4.126421, 5.629433,
3.764539, -3.33997, -5.258614,
3.764539, 4.126421, -5.258614,
3.764539, -3.33997, 5.629433,
3.764539, 4.126421, 5.629433,
3.764539, -3.33997, -5.258614,
3.764539, -3.33997, 5.629433,
3.764539, 4.126421, -5.258614,
3.764539, 4.126421, 5.629433
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
var radius = 7.905558;
var distance = 35.17272;
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
mvMatrix.translate( -0.4145358, -0.3932258, -0.1854095 );
mvMatrix.scale( 1.275766, 1.144816, 0.7850484 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.17272);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
chromafenozide<-read.table("chromafenozide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-chromafenozide$V2
```

```
## Error in eval(expr, envir, enclos): object 'chromafenozide' not found
```

```r
y<-chromafenozide$V3
```

```
## Error in eval(expr, envir, enclos): object 'chromafenozide' not found
```

```r
z<-chromafenozide$V4
```

```
## Error in eval(expr, envir, enclos): object 'chromafenozide' not found
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
-2.837895, 0.781173, 0.1179385, 0, 0, 1, 1, 1,
-2.720301, -0.2920183, -0.1546876, 1, 0, 0, 1, 1,
-2.682028, 0.5676893, -0.2134839, 1, 0, 0, 1, 1,
-2.676246, -0.6521596, -1.477078, 1, 0, 0, 1, 1,
-2.55183, 0.1209483, -1.038847, 1, 0, 0, 1, 1,
-2.54534, 0.1707775, -2.475437, 1, 0, 0, 1, 1,
-2.438548, -0.4926087, -2.639494, 0, 0, 0, 1, 1,
-2.414863, 1.019111, -1.258113, 0, 0, 0, 1, 1,
-2.376943, -0.9485859, -1.170612, 0, 0, 0, 1, 1,
-2.314389, 0.7567299, -0.8864152, 0, 0, 0, 1, 1,
-2.309695, 0.5548448, -1.035777, 0, 0, 0, 1, 1,
-2.254188, -0.02683938, -0.9544665, 0, 0, 0, 1, 1,
-2.230232, 0.8317124, -1.056242, 0, 0, 0, 1, 1,
-2.217124, 0.0323343, -0.3721468, 1, 1, 1, 1, 1,
-2.198583, 1.415689, -1.298476, 1, 1, 1, 1, 1,
-2.198545, -0.5937411, -3.02872, 1, 1, 1, 1, 1,
-2.123364, 0.3825407, -1.968918, 1, 1, 1, 1, 1,
-2.117559, 0.7413359, -2.666281, 1, 1, 1, 1, 1,
-2.101891, 1.758213, -1.854646, 1, 1, 1, 1, 1,
-2.072439, -0.06665928, -2.012874, 1, 1, 1, 1, 1,
-2.055338, 0.2155607, -2.370644, 1, 1, 1, 1, 1,
-2.043953, 0.2008844, -1.161221, 1, 1, 1, 1, 1,
-2.012618, -1.914308, -3.354432, 1, 1, 1, 1, 1,
-2.008527, -0.1387031, -2.099364, 1, 1, 1, 1, 1,
-1.978763, 0.5897385, -0.5428545, 1, 1, 1, 1, 1,
-1.974404, -2.132524, -1.791051, 1, 1, 1, 1, 1,
-1.971345, 0.05538478, -1.325247, 1, 1, 1, 1, 1,
-1.872976, -0.06392603, -1.560956, 1, 1, 1, 1, 1,
-1.849151, 0.5656093, -2.115521, 0, 0, 1, 1, 1,
-1.8386, -1.523841, -3.458287, 1, 0, 0, 1, 1,
-1.836536, 0.2265984, -3.1257, 1, 0, 0, 1, 1,
-1.834767, 0.9608529, -0.7430522, 1, 0, 0, 1, 1,
-1.821175, 0.5079691, 0.3116416, 1, 0, 0, 1, 1,
-1.821162, -0.6970925, -0.6754052, 1, 0, 0, 1, 1,
-1.801478, 0.04415165, -1.007783, 0, 0, 0, 1, 1,
-1.768781, 1.197422, -1.548299, 0, 0, 0, 1, 1,
-1.731215, 0.09414463, -1.886945, 0, 0, 0, 1, 1,
-1.728339, 1.356996, 0.1266076, 0, 0, 0, 1, 1,
-1.71983, -0.09108301, -0.9146076, 0, 0, 0, 1, 1,
-1.713054, 0.1872392, 0.761191, 0, 0, 0, 1, 1,
-1.711206, -1.035291, -3.430578, 0, 0, 0, 1, 1,
-1.69832, -1.177163, -0.3655327, 1, 1, 1, 1, 1,
-1.690544, 1.527957, -1.595874, 1, 1, 1, 1, 1,
-1.679122, 1.161983, -1.450424, 1, 1, 1, 1, 1,
-1.651052, 1.519283, -1.602971, 1, 1, 1, 1, 1,
-1.645375, -1.807771, -3.366601, 1, 1, 1, 1, 1,
-1.642529, 1.049501, -2.068586, 1, 1, 1, 1, 1,
-1.640849, 1.199217, 0.4252346, 1, 1, 1, 1, 1,
-1.640751, 0.725049, 0.4308932, 1, 1, 1, 1, 1,
-1.601297, 1.228876, -1.25503, 1, 1, 1, 1, 1,
-1.575768, -1.197619, -1.234963, 1, 1, 1, 1, 1,
-1.574227, 0.03946371, -1.457737, 1, 1, 1, 1, 1,
-1.571229, 0.6104309, -1.409815, 1, 1, 1, 1, 1,
-1.557716, 0.6604598, -0.8985298, 1, 1, 1, 1, 1,
-1.541707, 0.2879165, -2.058129, 1, 1, 1, 1, 1,
-1.531257, 1.101216, -2.878004, 1, 1, 1, 1, 1,
-1.530287, -1.506488, -3.159359, 0, 0, 1, 1, 1,
-1.491714, -0.159612, -1.044933, 1, 0, 0, 1, 1,
-1.487878, -1.056632, -1.159658, 1, 0, 0, 1, 1,
-1.4806, 0.432961, -1.396057, 1, 0, 0, 1, 1,
-1.474299, -0.4804635, -0.7727818, 1, 0, 0, 1, 1,
-1.474259, -0.5867031, -0.8974517, 1, 0, 0, 1, 1,
-1.455496, -0.3738275, -1.439755, 0, 0, 0, 1, 1,
-1.45371, 0.1874973, -0.6537522, 0, 0, 0, 1, 1,
-1.448316, -0.134259, -1.709806, 0, 0, 0, 1, 1,
-1.445485, 0.7481265, 0.02345274, 0, 0, 0, 1, 1,
-1.444144, 1.471138, -2.109088, 0, 0, 0, 1, 1,
-1.429416, -0.7235661, -1.512331, 0, 0, 0, 1, 1,
-1.425796, 1.958149, 1.35917, 0, 0, 0, 1, 1,
-1.420595, -0.2985079, -1.180479, 1, 1, 1, 1, 1,
-1.411714, -0.8318666, -1.339608, 1, 1, 1, 1, 1,
-1.390868, -0.6588163, -2.406792, 1, 1, 1, 1, 1,
-1.389514, -1.127763, -2.015164, 1, 1, 1, 1, 1,
-1.384546, 0.5295306, -0.8855681, 1, 1, 1, 1, 1,
-1.384476, 0.1845595, -1.177368, 1, 1, 1, 1, 1,
-1.383478, 0.4448758, -3.298392, 1, 1, 1, 1, 1,
-1.379277, 0.1978807, -0.6924652, 1, 1, 1, 1, 1,
-1.358751, 0.7320807, -0.6352592, 1, 1, 1, 1, 1,
-1.346622, 1.218612, -2.221052, 1, 1, 1, 1, 1,
-1.340818, 0.1699515, -1.486573, 1, 1, 1, 1, 1,
-1.337741, -0.7848174, -2.198857, 1, 1, 1, 1, 1,
-1.333457, -0.1191015, -1.620244, 1, 1, 1, 1, 1,
-1.32984, -0.8323938, -1.867674, 1, 1, 1, 1, 1,
-1.321774, -0.1483323, -0.5098351, 1, 1, 1, 1, 1,
-1.315036, 0.6380453, 0.04695291, 0, 0, 1, 1, 1,
-1.310965, 0.1126161, -0.798485, 1, 0, 0, 1, 1,
-1.303393, -1.089282, -1.585566, 1, 0, 0, 1, 1,
-1.286883, 0.6915219, -2.326807, 1, 0, 0, 1, 1,
-1.28643, -0.6473041, -3.612373, 1, 0, 0, 1, 1,
-1.284901, 0.5691532, -0.03858442, 1, 0, 0, 1, 1,
-1.282915, 0.8041585, -2.620776, 0, 0, 0, 1, 1,
-1.281168, 0.2817279, -0.1839975, 0, 0, 0, 1, 1,
-1.268149, 0.2699279, 0.1829894, 0, 0, 0, 1, 1,
-1.263582, 0.1111233, -0.2319799, 0, 0, 0, 1, 1,
-1.262184, -1.321849, -1.693118, 0, 0, 0, 1, 1,
-1.259286, -0.02546372, -2.752598, 0, 0, 0, 1, 1,
-1.255802, 0.01475489, -0.8770906, 0, 0, 0, 1, 1,
-1.25081, -0.7059317, 1.489412, 1, 1, 1, 1, 1,
-1.250557, 0.349391, -0.4873628, 1, 1, 1, 1, 1,
-1.250489, 0.9381887, -2.20363, 1, 1, 1, 1, 1,
-1.248037, -0.4914951, -1.798494, 1, 1, 1, 1, 1,
-1.242889, -1.567364, -3.670493, 1, 1, 1, 1, 1,
-1.232346, 1.283599, -0.6492814, 1, 1, 1, 1, 1,
-1.229733, 1.167599, -0.3574531, 1, 1, 1, 1, 1,
-1.228392, -1.502362, -1.124726, 1, 1, 1, 1, 1,
-1.226229, 1.449895, 0.3930235, 1, 1, 1, 1, 1,
-1.21845, -2.355506, -2.888266, 1, 1, 1, 1, 1,
-1.217387, -0.2161532, -1.938037, 1, 1, 1, 1, 1,
-1.198056, 1.011919, -0.4414472, 1, 1, 1, 1, 1,
-1.19748, 0.3328655, -0.08220988, 1, 1, 1, 1, 1,
-1.196712, 1.201708, -1.532646, 1, 1, 1, 1, 1,
-1.1948, -1.699795, -1.337549, 1, 1, 1, 1, 1,
-1.185549, 0.3002244, 0.6455387, 0, 0, 1, 1, 1,
-1.179898, 0.4657051, -0.7841237, 1, 0, 0, 1, 1,
-1.161775, -0.07967481, -2.16035, 1, 0, 0, 1, 1,
-1.160685, 0.5944022, -2.915021, 1, 0, 0, 1, 1,
-1.159104, -0.3297597, -1.239963, 1, 0, 0, 1, 1,
-1.159095, 0.4150716, -2.3176, 1, 0, 0, 1, 1,
-1.157391, -1.395528, -2.620879, 0, 0, 0, 1, 1,
-1.157237, 0.5379758, -2.180367, 0, 0, 0, 1, 1,
-1.152519, 0.0647848, -0.8984933, 0, 0, 0, 1, 1,
-1.150608, -1.928784, -2.580544, 0, 0, 0, 1, 1,
-1.141872, 0.6475088, -1.591686, 0, 0, 0, 1, 1,
-1.137193, 0.02927234, -0.8902905, 0, 0, 0, 1, 1,
-1.135812, -0.4940337, -2.212081, 0, 0, 0, 1, 1,
-1.124102, 0.1020082, -1.749418, 1, 1, 1, 1, 1,
-1.111334, -0.8752304, -2.231596, 1, 1, 1, 1, 1,
-1.103973, -0.3396994, -2.271405, 1, 1, 1, 1, 1,
-1.099646, -0.1421674, -1.914907, 1, 1, 1, 1, 1,
-1.087765, 0.6834702, -0.2430292, 1, 1, 1, 1, 1,
-1.086175, -0.4924309, -3.509467, 1, 1, 1, 1, 1,
-1.083758, -0.5674486, -2.212292, 1, 1, 1, 1, 1,
-1.071198, -0.7761977, -3.229146, 1, 1, 1, 1, 1,
-1.066312, 0.4013527, -2.10832, 1, 1, 1, 1, 1,
-1.065381, 1.901293, -0.9401457, 1, 1, 1, 1, 1,
-1.059655, 1.227396, -2.730753, 1, 1, 1, 1, 1,
-1.056402, 0.5315049, -1.254758, 1, 1, 1, 1, 1,
-1.04724, 0.5009866, -2.417409, 1, 1, 1, 1, 1,
-1.04005, -1.76328, -0.4309036, 1, 1, 1, 1, 1,
-1.027293, -0.7413333, -0.8695336, 1, 1, 1, 1, 1,
-1.02402, 1.379526, 0.6311416, 0, 0, 1, 1, 1,
-1.019029, 0.4050008, -1.991189, 1, 0, 0, 1, 1,
-1.018452, -0.5311159, -2.243763, 1, 0, 0, 1, 1,
-1.012959, 0.9826067, 0.4764728, 1, 0, 0, 1, 1,
-1.011049, -0.6952897, -1.239564, 1, 0, 0, 1, 1,
-1.008633, -0.8003008, -2.699832, 1, 0, 0, 1, 1,
-1.006404, -1.215917, -2.386558, 0, 0, 0, 1, 1,
-1.001806, -0.1072834, -2.139706, 0, 0, 0, 1, 1,
-0.9902679, -0.1833445, -3.122352, 0, 0, 0, 1, 1,
-0.9867281, -0.6364653, -2.841722, 0, 0, 0, 1, 1,
-0.9850839, 0.008837056, -1.569881, 0, 0, 0, 1, 1,
-0.9825366, -1.570851, -1.335918, 0, 0, 0, 1, 1,
-0.9760921, -1.130584, -3.069847, 0, 0, 0, 1, 1,
-0.9707333, -1.633461, -3.049532, 1, 1, 1, 1, 1,
-0.9676486, 0.1251563, 1.618535, 1, 1, 1, 1, 1,
-0.9651497, -1.049587, -1.988675, 1, 1, 1, 1, 1,
-0.9648629, 0.7304395, 0.1195848, 1, 1, 1, 1, 1,
-0.9634617, -2.179619, -2.308331, 1, 1, 1, 1, 1,
-0.9630457, -1.766254, -2.577173, 1, 1, 1, 1, 1,
-0.956319, -0.5411384, -2.292683, 1, 1, 1, 1, 1,
-0.9557137, 0.1165055, -0.410122, 1, 1, 1, 1, 1,
-0.9530736, 1.48498, -1.904997, 1, 1, 1, 1, 1,
-0.9403512, -2.137321, -3.323521, 1, 1, 1, 1, 1,
-0.9354675, 1.036127, -0.946788, 1, 1, 1, 1, 1,
-0.9318767, 0.325697, -0.2632666, 1, 1, 1, 1, 1,
-0.9276775, -1.830018, -1.784825, 1, 1, 1, 1, 1,
-0.9211478, 2.010794, 0.6598103, 1, 1, 1, 1, 1,
-0.9138026, 1.254427, -0.9374031, 1, 1, 1, 1, 1,
-0.9090036, -0.8265958, -2.353709, 0, 0, 1, 1, 1,
-0.9085059, 0.290921, -1.630338, 1, 0, 0, 1, 1,
-0.9053428, -0.257051, -1.426075, 1, 0, 0, 1, 1,
-0.9039505, 2.436556, -2.428208, 1, 0, 0, 1, 1,
-0.9035732, 0.1499514, -1.448541, 1, 0, 0, 1, 1,
-0.9020894, 0.0231719, -0.6774132, 1, 0, 0, 1, 1,
-0.9006783, 0.08954117, -2.463762, 0, 0, 0, 1, 1,
-0.8979545, 0.3557719, -1.911312, 0, 0, 0, 1, 1,
-0.8960376, 0.3121669, -1.805661, 0, 0, 0, 1, 1,
-0.8938539, -1.487478, -1.4541, 0, 0, 0, 1, 1,
-0.891674, 1.002342, 0.4278836, 0, 0, 0, 1, 1,
-0.8882085, -0.6760882, -2.523938, 0, 0, 0, 1, 1,
-0.8848006, 0.6325161, -0.5401454, 0, 0, 0, 1, 1,
-0.8793023, 0.6592055, -0.5261648, 1, 1, 1, 1, 1,
-0.8792585, 1.729984, -0.5463553, 1, 1, 1, 1, 1,
-0.8717754, -0.3620352, -1.383909, 1, 1, 1, 1, 1,
-0.870453, 0.7211897, -1.823693, 1, 1, 1, 1, 1,
-0.8682575, -0.4068087, -3.088253, 1, 1, 1, 1, 1,
-0.8672159, 0.2560477, -0.2687007, 1, 1, 1, 1, 1,
-0.8668121, -0.5366516, -1.714685, 1, 1, 1, 1, 1,
-0.8667507, -0.4399717, -2.45973, 1, 1, 1, 1, 1,
-0.8618441, 1.938547, -0.262234, 1, 1, 1, 1, 1,
-0.8598238, -0.4977947, -3.573644, 1, 1, 1, 1, 1,
-0.8584874, -1.421897, -1.323088, 1, 1, 1, 1, 1,
-0.8553611, 0.09318656, -2.395226, 1, 1, 1, 1, 1,
-0.854479, -0.430395, -3.258878, 1, 1, 1, 1, 1,
-0.8495146, -0.7096819, -2.995187, 1, 1, 1, 1, 1,
-0.8455061, -0.0505933, -3.155793, 1, 1, 1, 1, 1,
-0.8428096, 1.043055, -0.3405981, 0, 0, 1, 1, 1,
-0.8421855, 0.4203843, -0.1048771, 1, 0, 0, 1, 1,
-0.8419631, -1.073942, -3.359473, 1, 0, 0, 1, 1,
-0.8392566, 0.6274448, -1.702032, 1, 0, 0, 1, 1,
-0.8386557, -0.04419434, -0.8609029, 1, 0, 0, 1, 1,
-0.8385949, -0.5460619, -1.557604, 1, 0, 0, 1, 1,
-0.8334905, -0.7079463, -0.3229786, 0, 0, 0, 1, 1,
-0.829832, -1.040241, -1.979847, 0, 0, 0, 1, 1,
-0.8236147, 0.5007201, -1.142534, 0, 0, 0, 1, 1,
-0.8236023, -1.210688, -1.821182, 0, 0, 0, 1, 1,
-0.8214478, 1.118583, -2.011761, 0, 0, 0, 1, 1,
-0.8211872, 0.3575127, -2.680496, 0, 0, 0, 1, 1,
-0.8195581, 0.1236046, -2.53749, 0, 0, 0, 1, 1,
-0.8157084, -0.4108315, -1.088736, 1, 1, 1, 1, 1,
-0.8108983, -0.543172, -2.859329, 1, 1, 1, 1, 1,
-0.8102966, 1.485796, -0.6053774, 1, 1, 1, 1, 1,
-0.8060055, 0.8101509, 0.8436086, 1, 1, 1, 1, 1,
-0.8057045, -1.314026, -2.805413, 1, 1, 1, 1, 1,
-0.8012576, -0.6230815, -2.721413, 1, 1, 1, 1, 1,
-0.8002055, 1.175869, -1.406116, 1, 1, 1, 1, 1,
-0.7971697, -0.365402, -0.6098729, 1, 1, 1, 1, 1,
-0.7957525, 0.003248305, -1.613822, 1, 1, 1, 1, 1,
-0.7917365, -0.6070449, -2.074473, 1, 1, 1, 1, 1,
-0.7862675, 1.556416, -0.8984159, 1, 1, 1, 1, 1,
-0.7782709, 1.663017, -0.5364128, 1, 1, 1, 1, 1,
-0.7742425, 1.83826, 1.722504, 1, 1, 1, 1, 1,
-0.7638934, 0.1280179, -1.905089, 1, 1, 1, 1, 1,
-0.7634566, -1.296543, -1.210619, 1, 1, 1, 1, 1,
-0.7598416, -1.363625, -3.133454, 0, 0, 1, 1, 1,
-0.7525275, 1.512025, -2.426859, 1, 0, 0, 1, 1,
-0.7522041, 0.6512278, -0.6426222, 1, 0, 0, 1, 1,
-0.7485943, 1.261284, -2.486648, 1, 0, 0, 1, 1,
-0.7441577, 0.207545, -0.9734812, 1, 0, 0, 1, 1,
-0.7399591, -0.9184097, -1.004354, 1, 0, 0, 1, 1,
-0.7396321, 1.131714, -1.466716, 0, 0, 0, 1, 1,
-0.7378073, 0.09982093, -2.336112, 0, 0, 0, 1, 1,
-0.7369354, 0.4168694, -1.670565, 0, 0, 0, 1, 1,
-0.7365808, 0.4076267, -3.620229, 0, 0, 0, 1, 1,
-0.7330293, 1.071333, -0.6801937, 0, 0, 0, 1, 1,
-0.730464, -1.129153, -2.305753, 0, 0, 0, 1, 1,
-0.7295266, 0.9262254, -1.059775, 0, 0, 0, 1, 1,
-0.7292078, -1.447737, -3.833624, 1, 1, 1, 1, 1,
-0.7276362, -0.6716806, -4.359624, 1, 1, 1, 1, 1,
-0.7271354, -0.4480186, -3.069715, 1, 1, 1, 1, 1,
-0.7253093, 1.549215, -1.974192, 1, 1, 1, 1, 1,
-0.7187081, 0.4401319, 0.6456372, 1, 1, 1, 1, 1,
-0.7127413, 1.278951, 0.9559824, 1, 1, 1, 1, 1,
-0.7081457, -0.01851783, -3.630878, 1, 1, 1, 1, 1,
-0.7080575, 0.05841399, -2.783483, 1, 1, 1, 1, 1,
-0.7070407, -1.00499, -3.885572, 1, 1, 1, 1, 1,
-0.7060677, -0.5311048, -2.647455, 1, 1, 1, 1, 1,
-0.7041048, -1.065593, -3.853862, 1, 1, 1, 1, 1,
-0.6998626, 0.3327521, -0.4424612, 1, 1, 1, 1, 1,
-0.6991693, 0.3637688, -0.6232515, 1, 1, 1, 1, 1,
-0.6988013, 0.09438793, -2.012897, 1, 1, 1, 1, 1,
-0.6962296, 0.5621732, -1.533017, 1, 1, 1, 1, 1,
-0.6903098, 1.612449, -0.6748708, 0, 0, 1, 1, 1,
-0.6900775, -0.5179613, -1.81895, 1, 0, 0, 1, 1,
-0.6883663, 0.9010862, -0.8554882, 1, 0, 0, 1, 1,
-0.6783205, 0.4965427, -0.5894122, 1, 0, 0, 1, 1,
-0.6756787, 0.8300811, 0.7548238, 1, 0, 0, 1, 1,
-0.6677717, -1.450076, -2.091161, 1, 0, 0, 1, 1,
-0.6655371, -0.3766469, -3.218479, 0, 0, 0, 1, 1,
-0.6635633, -0.5351458, -2.560482, 0, 0, 0, 1, 1,
-0.6605884, -0.9522599, -1.137134, 0, 0, 0, 1, 1,
-0.658871, 0.01992938, -2.673203, 0, 0, 0, 1, 1,
-0.6566193, -0.4905308, -4.277202, 0, 0, 0, 1, 1,
-0.6503832, 1.190527, -0.8644368, 0, 0, 0, 1, 1,
-0.6498552, -1.114221, -1.897093, 0, 0, 0, 1, 1,
-0.6493374, -0.9158228, -4.361042, 1, 1, 1, 1, 1,
-0.6482912, -0.5705331, -1.497477, 1, 1, 1, 1, 1,
-0.6394802, -0.2072066, -0.6320527, 1, 1, 1, 1, 1,
-0.6380028, 0.4928553, -1.590777, 1, 1, 1, 1, 1,
-0.6349595, -0.4382276, -0.3817616, 1, 1, 1, 1, 1,
-0.6240244, 0.2972072, -2.00176, 1, 1, 1, 1, 1,
-0.6238267, 0.4665149, -0.7184491, 1, 1, 1, 1, 1,
-0.6225693, -0.09259202, -0.4507732, 1, 1, 1, 1, 1,
-0.6212183, 0.4893531, -2.303668, 1, 1, 1, 1, 1,
-0.621114, -0.7300178, -1.818412, 1, 1, 1, 1, 1,
-0.618228, 0.04593438, -1.855114, 1, 1, 1, 1, 1,
-0.6080413, -0.01870694, -1.171003, 1, 1, 1, 1, 1,
-0.605354, -0.03342587, -3.92623, 1, 1, 1, 1, 1,
-0.602205, 0.7564278, -0.7336413, 1, 1, 1, 1, 1,
-0.6020532, 1.360218, -0.9921488, 1, 1, 1, 1, 1,
-0.5994542, -0.8157809, -3.092887, 0, 0, 1, 1, 1,
-0.5885445, 0.7393028, -0.405581, 1, 0, 0, 1, 1,
-0.5855955, 0.8338434, -2.291041, 1, 0, 0, 1, 1,
-0.5845489, -1.346318, -4.275388, 1, 0, 0, 1, 1,
-0.57783, -2.499049, -3.810076, 1, 0, 0, 1, 1,
-0.5757099, 1.006113, -1.830632, 1, 0, 0, 1, 1,
-0.5751083, -2.646163, -4.070498, 0, 0, 0, 1, 1,
-0.5746995, 0.09637005, -0.0728335, 0, 0, 0, 1, 1,
-0.5726148, 0.6893666, -0.4124185, 0, 0, 0, 1, 1,
-0.5696356, -0.4507153, -2.234325, 0, 0, 0, 1, 1,
-0.5673516, -0.7711684, -1.901398, 0, 0, 0, 1, 1,
-0.5636519, 0.7032635, -0.2546974, 0, 0, 0, 1, 1,
-0.5604026, -1.128141, -2.615546, 0, 0, 0, 1, 1,
-0.5573452, 0.2792343, -3.417845, 1, 1, 1, 1, 1,
-0.5502291, 0.763421, 1.009123, 1, 1, 1, 1, 1,
-0.5458943, -0.7420779, -3.240196, 1, 1, 1, 1, 1,
-0.5428525, -1.389959, -3.264343, 1, 1, 1, 1, 1,
-0.5422722, -1.748601, -2.350717, 1, 1, 1, 1, 1,
-0.5419413, 0.478074, -0.4746412, 1, 1, 1, 1, 1,
-0.5413046, -0.6180652, -1.213919, 1, 1, 1, 1, 1,
-0.5362958, 0.4439277, -1.1644, 1, 1, 1, 1, 1,
-0.5292091, 1.445788, 0.9196168, 1, 1, 1, 1, 1,
-0.5275723, -0.8731582, -3.00714, 1, 1, 1, 1, 1,
-0.5218164, -0.3661568, -3.808382, 1, 1, 1, 1, 1,
-0.5182726, -1.241227, -3.017657, 1, 1, 1, 1, 1,
-0.5163865, -2.351056, -3.644979, 1, 1, 1, 1, 1,
-0.5161036, -1.570038, -0.8958146, 1, 1, 1, 1, 1,
-0.5045264, -2.237193, -2.138524, 1, 1, 1, 1, 1,
-0.5038689, 0.6585785, 0.09035637, 0, 0, 1, 1, 1,
-0.4975898, 0.02670838, -1.382204, 1, 0, 0, 1, 1,
-0.4965183, 1.273258, -0.08614314, 1, 0, 0, 1, 1,
-0.4962857, -0.4027674, -1.333694, 1, 0, 0, 1, 1,
-0.4949613, -1.25164, -3.497739, 1, 0, 0, 1, 1,
-0.4906235, -0.03105722, -3.261352, 1, 0, 0, 1, 1,
-0.4902357, 0.9486149, -0.6335639, 0, 0, 0, 1, 1,
-0.4888468, 0.3433366, 0.210355, 0, 0, 0, 1, 1,
-0.4882937, 0.1505621, 0.2261894, 0, 0, 0, 1, 1,
-0.4861225, 0.1351468, -1.223929, 0, 0, 0, 1, 1,
-0.4859639, 0.2417293, -0.6193902, 0, 0, 0, 1, 1,
-0.4855649, 0.5596645, -0.8812118, 0, 0, 0, 1, 1,
-0.485333, -1.476346, -4.110302, 0, 0, 0, 1, 1,
-0.4836333, -0.1891498, -0.7176256, 1, 1, 1, 1, 1,
-0.4830065, 0.07015632, -1.401674, 1, 1, 1, 1, 1,
-0.4828811, -0.3917803, -0.8747155, 1, 1, 1, 1, 1,
-0.4799674, -0.3176213, -2.315361, 1, 1, 1, 1, 1,
-0.4730128, -0.05852246, -1.715163, 1, 1, 1, 1, 1,
-0.4714084, 0.1149011, -0.9596574, 1, 1, 1, 1, 1,
-0.4649133, 1.107549, -2.123239, 1, 1, 1, 1, 1,
-0.4646001, 0.6491411, -0.4001831, 1, 1, 1, 1, 1,
-0.4626369, -0.9459671, -3.004339, 1, 1, 1, 1, 1,
-0.460676, -1.309633, -1.803039, 1, 1, 1, 1, 1,
-0.4538316, -1.133643, -2.978977, 1, 1, 1, 1, 1,
-0.4533673, 0.6330125, -1.205352, 1, 1, 1, 1, 1,
-0.4509318, -0.5561447, -3.735459, 1, 1, 1, 1, 1,
-0.4504097, 0.2219281, -0.3587439, 1, 1, 1, 1, 1,
-0.4495078, 0.1753036, -2.197199, 1, 1, 1, 1, 1,
-0.4494329, -0.2779855, -1.694865, 0, 0, 1, 1, 1,
-0.4477132, 0.2640068, -2.19986, 1, 0, 0, 1, 1,
-0.4465851, 0.7300436, 2.26704, 1, 0, 0, 1, 1,
-0.4406495, 1.162283, -1.622778, 1, 0, 0, 1, 1,
-0.4377604, 0.9472936, 0.1979243, 1, 0, 0, 1, 1,
-0.4349745, 0.2566713, 1.325139, 1, 0, 0, 1, 1,
-0.4342585, 0.1127736, -2.132569, 0, 0, 0, 1, 1,
-0.4335873, 1.768854, -0.378608, 0, 0, 0, 1, 1,
-0.4325337, 0.1396001, -0.5259901, 0, 0, 0, 1, 1,
-0.4325061, 0.08465293, -1.94458, 0, 0, 0, 1, 1,
-0.4280759, 1.21355, 0.2664249, 0, 0, 0, 1, 1,
-0.4257821, 0.7380031, -0.05182763, 0, 0, 0, 1, 1,
-0.4253856, -0.1199661, -2.841224, 0, 0, 0, 1, 1,
-0.421825, 0.490987, -2.8602, 1, 1, 1, 1, 1,
-0.4211325, -1.418194, -3.164617, 1, 1, 1, 1, 1,
-0.417697, 1.119328, 0.2677045, 1, 1, 1, 1, 1,
-0.4132855, 0.7200677, -1.28888, 1, 1, 1, 1, 1,
-0.4092759, 1.200907, 1.117825, 1, 1, 1, 1, 1,
-0.4065318, -0.3138962, -3.256269, 1, 1, 1, 1, 1,
-0.406472, 0.1345611, -0.9090213, 1, 1, 1, 1, 1,
-0.3998002, 0.9627329, -2.433301, 1, 1, 1, 1, 1,
-0.3959346, -1.419137, -1.313599, 1, 1, 1, 1, 1,
-0.3937537, 0.2403532, -1.40963, 1, 1, 1, 1, 1,
-0.3936211, -0.1221911, -1.497479, 1, 1, 1, 1, 1,
-0.3922944, 0.927903, -0.8838255, 1, 1, 1, 1, 1,
-0.3841588, 0.6848955, 0.1090389, 1, 1, 1, 1, 1,
-0.3826241, 0.2440161, -0.8454391, 1, 1, 1, 1, 1,
-0.3773301, 0.2708746, -0.5474129, 1, 1, 1, 1, 1,
-0.3696181, -1.489852, -2.337242, 0, 0, 1, 1, 1,
-0.3682869, 0.4501089, -1.438039, 1, 0, 0, 1, 1,
-0.3677638, -0.595728, -1.097506, 1, 0, 0, 1, 1,
-0.3668725, 0.1537371, -0.6215367, 1, 0, 0, 1, 1,
-0.3653111, 0.9970996, -2.164287, 1, 0, 0, 1, 1,
-0.3647597, -0.8018544, -1.631611, 1, 0, 0, 1, 1,
-0.3630216, 0.7709244, 0.5370522, 0, 0, 0, 1, 1,
-0.3619553, -1.815158, -4.118835, 0, 0, 0, 1, 1,
-0.3578106, 0.1254451, -2.527186, 0, 0, 0, 1, 1,
-0.3561916, 1.050848, 1.088646, 0, 0, 0, 1, 1,
-0.3553599, 0.5104693, -0.4877418, 0, 0, 0, 1, 1,
-0.3451266, -0.687877, 0.9048129, 0, 0, 0, 1, 1,
-0.3438499, -0.8912087, -3.884663, 0, 0, 0, 1, 1,
-0.3335185, 0.06998126, -1.68146, 1, 1, 1, 1, 1,
-0.3318321, 1.622536, 0.5751573, 1, 1, 1, 1, 1,
-0.330413, 0.5128707, 0.205922, 1, 1, 1, 1, 1,
-0.3226958, -1.234345, -4.039981, 1, 1, 1, 1, 1,
-0.3224996, 0.1623447, -0.3263639, 1, 1, 1, 1, 1,
-0.3178123, -1.860973, -3.011314, 1, 1, 1, 1, 1,
-0.3170324, 1.612571, -0.9649372, 1, 1, 1, 1, 1,
-0.3155808, -0.1920753, -2.156703, 1, 1, 1, 1, 1,
-0.3144223, -0.6713229, -5.10005, 1, 1, 1, 1, 1,
-0.3132368, 0.9721836, 0.2127055, 1, 1, 1, 1, 1,
-0.3108563, -0.03767176, -1.813778, 1, 1, 1, 1, 1,
-0.3086177, -0.4285217, -2.931893, 1, 1, 1, 1, 1,
-0.289426, 0.3728546, -1.461163, 1, 1, 1, 1, 1,
-0.2872342, 1.883372, -1.226297, 1, 1, 1, 1, 1,
-0.2836529, 0.4721075, 1.118691, 1, 1, 1, 1, 1,
-0.2756309, 0.9372054, 1.722064, 0, 0, 1, 1, 1,
-0.2744024, -0.2796618, -0.8963559, 1, 0, 0, 1, 1,
-0.2725962, 0.03669354, -1.43888, 1, 0, 0, 1, 1,
-0.2673381, 1.268331, -0.02562254, 1, 0, 0, 1, 1,
-0.2631678, -0.360916, -2.928466, 1, 0, 0, 1, 1,
-0.2598706, -0.2352054, -2.164927, 1, 0, 0, 1, 1,
-0.2590922, -0.1729569, -3.456415, 0, 0, 0, 1, 1,
-0.2549463, 1.31166, 0.2096507, 0, 0, 0, 1, 1,
-0.2511654, 0.02778149, -3.16598, 0, 0, 0, 1, 1,
-0.2477931, 0.3245395, -0.1268013, 0, 0, 0, 1, 1,
-0.2456577, -0.7311305, -2.002593, 0, 0, 0, 1, 1,
-0.2455339, -0.2174204, -1.082832, 0, 0, 0, 1, 1,
-0.238421, 0.7563463, -0.07850787, 0, 0, 0, 1, 1,
-0.2354553, 0.4353721, 1.570558, 1, 1, 1, 1, 1,
-0.2351967, 0.606284, 0.2669135, 1, 1, 1, 1, 1,
-0.2333267, -0.2478838, -1.607402, 1, 1, 1, 1, 1,
-0.230552, -0.1707186, -4.243376, 1, 1, 1, 1, 1,
-0.2289494, -0.1069793, -4.335753, 1, 1, 1, 1, 1,
-0.2262416, -0.363707, -2.490618, 1, 1, 1, 1, 1,
-0.2169161, 0.6902948, 0.1264986, 1, 1, 1, 1, 1,
-0.2128059, -0.5570486, -1.443635, 1, 1, 1, 1, 1,
-0.2113873, -0.2654281, -1.465296, 1, 1, 1, 1, 1,
-0.2087894, -0.4228534, -3.617246, 1, 1, 1, 1, 1,
-0.2063674, -0.7564437, -2.974619, 1, 1, 1, 1, 1,
-0.2056663, -0.6262609, -1.935327, 1, 1, 1, 1, 1,
-0.2054898, -0.5766487, -4.08855, 1, 1, 1, 1, 1,
-0.2001373, -0.6180747, -1.715703, 1, 1, 1, 1, 1,
-0.1981844, 1.673297, -0.7264489, 1, 1, 1, 1, 1,
-0.1966513, -1.165033, -1.886445, 0, 0, 1, 1, 1,
-0.1937094, 0.1349181, -1.019958, 1, 0, 0, 1, 1,
-0.1921759, -0.5283024, -3.996932, 1, 0, 0, 1, 1,
-0.1910422, 0.045942, 0.1608973, 1, 0, 0, 1, 1,
-0.1892625, 1.849775, -0.1007078, 1, 0, 0, 1, 1,
-0.1838939, -1.026627, -2.846493, 1, 0, 0, 1, 1,
-0.1834095, -1.525002, -2.681232, 0, 0, 0, 1, 1,
-0.1775034, 0.9326277, -1.396769, 0, 0, 0, 1, 1,
-0.1735942, 0.701871, -0.7633618, 0, 0, 0, 1, 1,
-0.1674285, 0.9888746, -1.340229, 0, 0, 0, 1, 1,
-0.1604232, 0.05372849, -0.2852371, 0, 0, 0, 1, 1,
-0.1596505, -0.8330834, -2.05671, 0, 0, 0, 1, 1,
-0.155341, -1.224441, -4.720726, 0, 0, 0, 1, 1,
-0.1553358, -0.5814615, -3.642369, 1, 1, 1, 1, 1,
-0.1514567, -0.2029265, -3.018768, 1, 1, 1, 1, 1,
-0.1361038, -2.064123, -4.396636, 1, 1, 1, 1, 1,
-0.1358536, 0.1281502, -1.729765, 1, 1, 1, 1, 1,
-0.1354066, -0.08988013, -2.811076, 1, 1, 1, 1, 1,
-0.1333256, -1.440609, -2.24059, 1, 1, 1, 1, 1,
-0.1277763, -1.788474, -3.799167, 1, 1, 1, 1, 1,
-0.1277035, 0.8680691, -1.359698, 1, 1, 1, 1, 1,
-0.1253685, -0.6600379, -2.756761, 1, 1, 1, 1, 1,
-0.1199009, 0.7349808, 0.09470743, 1, 1, 1, 1, 1,
-0.1104222, 0.5652439, -0.8185208, 1, 1, 1, 1, 1,
-0.1094542, 1.175472, -0.05172687, 1, 1, 1, 1, 1,
-0.1066531, -1.420948, -3.10544, 1, 1, 1, 1, 1,
-0.1061563, 0.6493229, -0.7399105, 1, 1, 1, 1, 1,
-0.1040477, -1.201573, -1.442796, 1, 1, 1, 1, 1,
-0.09969643, 0.03925572, -0.7291679, 0, 0, 1, 1, 1,
-0.09672852, -0.07402188, -2.029868, 1, 0, 0, 1, 1,
-0.09623216, 0.3193383, -2.751694, 1, 0, 0, 1, 1,
-0.09130743, 0.9989893, -0.07362066, 1, 0, 0, 1, 1,
-0.08860819, 0.9249818, -0.7309404, 1, 0, 0, 1, 1,
-0.08636408, -0.4377635, -4.30332, 1, 0, 0, 1, 1,
-0.08104364, -0.2284051, -2.184848, 0, 0, 0, 1, 1,
-0.07591389, -0.4427921, -2.754478, 0, 0, 0, 1, 1,
-0.07318929, -0.8504868, -1.874829, 0, 0, 0, 1, 1,
-0.07296912, -0.1704372, -2.056978, 0, 0, 0, 1, 1,
-0.0725012, -0.8587351, -2.87312, 0, 0, 0, 1, 1,
-0.07210097, 0.1295262, -0.5326375, 0, 0, 0, 1, 1,
-0.07171208, -0.9258929, -4.226937, 0, 0, 0, 1, 1,
-0.06905074, -0.01139061, -1.965325, 1, 1, 1, 1, 1,
-0.06876428, -2.496188, -2.690424, 1, 1, 1, 1, 1,
-0.06286035, -0.4848893, -3.10492, 1, 1, 1, 1, 1,
-0.06190325, -0.8196115, -2.003877, 1, 1, 1, 1, 1,
-0.05607224, 0.0364823, -2.917013, 1, 1, 1, 1, 1,
-0.05540206, -0.9828361, -3.237026, 1, 1, 1, 1, 1,
-0.05360271, -0.195676, -3.297811, 1, 1, 1, 1, 1,
-0.04689413, 0.3740832, -2.136361, 1, 1, 1, 1, 1,
-0.04588012, -0.2324951, -2.636779, 1, 1, 1, 1, 1,
-0.04282152, -1.05985, -4.32129, 1, 1, 1, 1, 1,
-0.04250047, 0.8666735, -0.6173151, 1, 1, 1, 1, 1,
-0.04176497, -1.348177, -4.497027, 1, 1, 1, 1, 1,
-0.04148359, 1.385939, -0.2897172, 1, 1, 1, 1, 1,
-0.0322385, -0.6238662, -3.639069, 1, 1, 1, 1, 1,
-0.03035196, -1.011402, -4.497799, 1, 1, 1, 1, 1,
-0.02802644, -1.034358, -2.16478, 0, 0, 1, 1, 1,
-0.02757722, 0.1553562, -0.197368, 1, 0, 0, 1, 1,
-0.02670533, -0.5561388, -3.858594, 1, 0, 0, 1, 1,
-0.02632228, 0.2061244, -1.058126, 1, 0, 0, 1, 1,
-0.02369583, -0.7694789, -3.959843, 1, 0, 0, 1, 1,
-0.02347072, -0.3228023, -2.622091, 1, 0, 0, 1, 1,
-0.02076456, 0.6935121, -1.031512, 0, 0, 0, 1, 1,
-0.02049255, -3.231236, -2.845073, 0, 0, 0, 1, 1,
-0.01768124, 1.418101, -0.09080122, 0, 0, 0, 1, 1,
-0.01506683, -0.5991222, -1.828238, 0, 0, 0, 1, 1,
-0.01074345, -0.4317504, -2.675232, 0, 0, 0, 1, 1,
-0.01047635, 0.4275946, 0.7092583, 0, 0, 0, 1, 1,
-0.005191173, 0.3081686, -0.4762347, 0, 0, 0, 1, 1,
-0.003572129, 0.9762865, 2.030214, 1, 1, 1, 1, 1,
-0.001512046, -0.1516997, -4.054358, 1, 1, 1, 1, 1,
0.003758298, -0.4067669, 4.332674, 1, 1, 1, 1, 1,
0.005061531, 0.6025393, 0.02682677, 1, 1, 1, 1, 1,
0.005147491, -0.692521, 2.785958, 1, 1, 1, 1, 1,
0.008486814, 0.6177992, -0.4228685, 1, 1, 1, 1, 1,
0.01135714, 0.4168738, 0.4766716, 1, 1, 1, 1, 1,
0.02220398, -0.8141605, 2.950099, 1, 1, 1, 1, 1,
0.02312713, 0.6275921, -1.199134, 1, 1, 1, 1, 1,
0.02732881, -2.332859, 1.557574, 1, 1, 1, 1, 1,
0.03029445, -0.8268799, 4.062825, 1, 1, 1, 1, 1,
0.03141074, 0.4583205, 0.1385056, 1, 1, 1, 1, 1,
0.03187769, -0.5747905, 4.686828, 1, 1, 1, 1, 1,
0.03313399, 0.5986766, 0.5215096, 1, 1, 1, 1, 1,
0.03835912, -0.3318473, 2.887529, 1, 1, 1, 1, 1,
0.03972774, -1.146246, 3.772506, 0, 0, 1, 1, 1,
0.04136693, -0.4560183, 2.345852, 1, 0, 0, 1, 1,
0.05290113, -0.3845629, 2.646216, 1, 0, 0, 1, 1,
0.06067593, 0.1145175, 2.970933, 1, 0, 0, 1, 1,
0.06147802, 2.46588, 0.6468948, 1, 0, 0, 1, 1,
0.06363098, 0.1281936, 1.008336, 1, 0, 0, 1, 1,
0.06408429, 0.1263203, 2.048868, 0, 0, 0, 1, 1,
0.06575213, 0.8945077, 1.100347, 0, 0, 0, 1, 1,
0.06671729, -0.4356821, 3.3243, 0, 0, 0, 1, 1,
0.06928682, 2.669741, -1.572081, 0, 0, 0, 1, 1,
0.0794393, -0.8164183, 3.330044, 0, 0, 0, 1, 1,
0.08016676, -0.2311144, 0.4300072, 0, 0, 0, 1, 1,
0.08312492, -1.01495, 4.898487, 0, 0, 0, 1, 1,
0.08771529, 0.9507766, -0.4611846, 1, 1, 1, 1, 1,
0.09280764, 0.4106126, -1.180572, 1, 1, 1, 1, 1,
0.09584912, 0.490977, 0.9720026, 1, 1, 1, 1, 1,
0.1020787, 0.6613509, -0.5315199, 1, 1, 1, 1, 1,
0.1050273, -0.5623881, 2.781902, 1, 1, 1, 1, 1,
0.1073306, 1.059927, 0.9800344, 1, 1, 1, 1, 1,
0.1074487, -0.1054696, 0.9681979, 1, 1, 1, 1, 1,
0.1103768, -0.1144715, -0.51331, 1, 1, 1, 1, 1,
0.1105539, 0.2463733, 1.222081, 1, 1, 1, 1, 1,
0.1140522, -0.4077304, 3.807629, 1, 1, 1, 1, 1,
0.1164742, 1.150646, 1.566201, 1, 1, 1, 1, 1,
0.1175487, -0.8656323, 2.114832, 1, 1, 1, 1, 1,
0.127338, -1.159988, 3.948209, 1, 1, 1, 1, 1,
0.1282308, -2.282177, 1.328578, 1, 1, 1, 1, 1,
0.1294672, 2.121035, -0.6930648, 1, 1, 1, 1, 1,
0.1297546, -1.045681, 1.873422, 0, 0, 1, 1, 1,
0.1308958, -1.548849, 4.006192, 1, 0, 0, 1, 1,
0.1311436, 0.301012, -0.3501904, 1, 0, 0, 1, 1,
0.1374892, 1.551189, 0.7228851, 1, 0, 0, 1, 1,
0.140456, 0.803907, 1.575837, 1, 0, 0, 1, 1,
0.1445274, -0.004292272, 1.945843, 1, 0, 0, 1, 1,
0.1479716, -1.456088, 3.101726, 0, 0, 0, 1, 1,
0.1480806, 0.09021759, 0.169616, 0, 0, 0, 1, 1,
0.1498915, -0.5997601, 2.013134, 0, 0, 0, 1, 1,
0.1549796, 1.943006, 2.120477, 0, 0, 0, 1, 1,
0.1561261, -0.3281784, 0.8217046, 0, 0, 0, 1, 1,
0.1585956, -0.4688804, 1.6701, 0, 0, 0, 1, 1,
0.1622333, 2.171669, 1.292246, 0, 0, 0, 1, 1,
0.1645871, 0.3833724, -0.586008, 1, 1, 1, 1, 1,
0.1672425, 2.052389, -0.8540311, 1, 1, 1, 1, 1,
0.1706651, 0.6455452, -0.4585191, 1, 1, 1, 1, 1,
0.1739417, -0.6262441, 1.43771, 1, 1, 1, 1, 1,
0.1752864, -1.272513, 1.876506, 1, 1, 1, 1, 1,
0.1789979, -2.316029, 3.730582, 1, 1, 1, 1, 1,
0.1825234, -0.0115741, 1.313871, 1, 1, 1, 1, 1,
0.1887341, 0.1810208, 1.324487, 1, 1, 1, 1, 1,
0.189257, 1.151988, -1.332815, 1, 1, 1, 1, 1,
0.1893618, 0.2817641, 0.3831151, 1, 1, 1, 1, 1,
0.1950157, 2.247988, -0.5604246, 1, 1, 1, 1, 1,
0.2005358, -0.9290801, 3.055443, 1, 1, 1, 1, 1,
0.2066382, 0.4073326, 1.487314, 1, 1, 1, 1, 1,
0.2111047, 0.5486995, 1.56101, 1, 1, 1, 1, 1,
0.2111646, 2.137439, 0.2102637, 1, 1, 1, 1, 1,
0.2112874, -0.154072, 3.040497, 0, 0, 1, 1, 1,
0.213957, 0.08564931, 2.575958, 1, 0, 0, 1, 1,
0.2214157, -0.8281468, 3.850292, 1, 0, 0, 1, 1,
0.2224973, -0.5549092, 3.661421, 1, 0, 0, 1, 1,
0.2240476, 0.3633206, -0.01129765, 1, 0, 0, 1, 1,
0.2241389, 1.911028, -2.039109, 1, 0, 0, 1, 1,
0.2327646, 0.3619097, -0.9201136, 0, 0, 0, 1, 1,
0.2364456, -0.9627249, 3.157369, 0, 0, 0, 1, 1,
0.2370498, -0.3449957, 2.220368, 0, 0, 0, 1, 1,
0.2395682, -0.3563653, 3.556535, 0, 0, 0, 1, 1,
0.2462065, -0.1473971, 0.9840766, 0, 0, 0, 1, 1,
0.2474432, -2.052524, 3.896446, 0, 0, 0, 1, 1,
0.2483435, -0.3452643, 3.160484, 0, 0, 0, 1, 1,
0.2488917, -0.8554692, 2.219444, 1, 1, 1, 1, 1,
0.250401, 0.01714276, 0.2040487, 1, 1, 1, 1, 1,
0.2514615, 0.3742434, 1.333963, 1, 1, 1, 1, 1,
0.2556534, 0.5435362, 0.6570684, 1, 1, 1, 1, 1,
0.2563715, 0.8360946, -1.483736, 1, 1, 1, 1, 1,
0.2609386, -0.09522702, 2.779276, 1, 1, 1, 1, 1,
0.2612763, 0.8018923, 1.901074, 1, 1, 1, 1, 1,
0.2635789, 0.6941538, 1.655667, 1, 1, 1, 1, 1,
0.2656054, 0.5751768, 1.1016, 1, 1, 1, 1, 1,
0.2718578, 0.777807, 0.1446005, 1, 1, 1, 1, 1,
0.27256, -0.7123744, 0.6265926, 1, 1, 1, 1, 1,
0.2754388, -1.7658, 2.005697, 1, 1, 1, 1, 1,
0.2770011, -1.063825, 0.8105441, 1, 1, 1, 1, 1,
0.279551, 0.8115502, 0.7373183, 1, 1, 1, 1, 1,
0.2829576, -0.02238199, 2.554025, 1, 1, 1, 1, 1,
0.2887719, -0.7499697, 2.721171, 0, 0, 1, 1, 1,
0.2919297, 1.523737, 0.4112421, 1, 0, 0, 1, 1,
0.292367, 0.9470289, 1.688682, 1, 0, 0, 1, 1,
0.2925837, -0.6900334, 3.002928, 1, 0, 0, 1, 1,
0.2985218, 1.267291, -0.6553987, 1, 0, 0, 1, 1,
0.3048368, -0.6931803, 2.249873, 1, 0, 0, 1, 1,
0.3077952, 0.8009138, -1.510689, 0, 0, 0, 1, 1,
0.309135, 1.788003, 0.2515522, 0, 0, 0, 1, 1,
0.3094209, 1.686072, -0.157701, 0, 0, 0, 1, 1,
0.3127231, 0.2325855, 1.916902, 0, 0, 0, 1, 1,
0.3167943, 1.217239, -0.9103973, 0, 0, 0, 1, 1,
0.320199, 1.164065, 0.08927524, 0, 0, 0, 1, 1,
0.3203669, 0.3886512, 1.13543, 0, 0, 0, 1, 1,
0.3204361, 0.05997217, 1.784295, 1, 1, 1, 1, 1,
0.3232807, 0.8558515, -1.010846, 1, 1, 1, 1, 1,
0.3268596, 0.9407275, -0.04002202, 1, 1, 1, 1, 1,
0.3271818, 0.9794059, 0.2459589, 1, 1, 1, 1, 1,
0.3307142, 0.5064769, -0.09238082, 1, 1, 1, 1, 1,
0.3354061, 1.711837, 1.041322, 1, 1, 1, 1, 1,
0.336037, 4.017687, 0.13685, 1, 1, 1, 1, 1,
0.3408235, 1.261989, 0.7472947, 1, 1, 1, 1, 1,
0.3415869, 1.05242, 1.551363, 1, 1, 1, 1, 1,
0.3517846, 0.90597, 1.536411, 1, 1, 1, 1, 1,
0.3527142, -0.01576478, 0.9338786, 1, 1, 1, 1, 1,
0.3649472, -0.3435586, 2.140368, 1, 1, 1, 1, 1,
0.3723895, -0.1583314, 1.176492, 1, 1, 1, 1, 1,
0.3795215, -1.318941, 3.748235, 1, 1, 1, 1, 1,
0.3829408, -0.4012965, 2.771885, 1, 1, 1, 1, 1,
0.3836357, 1.694925, -1.617071, 0, 0, 1, 1, 1,
0.3877069, -2.241595, 2.699005, 1, 0, 0, 1, 1,
0.3877459, -0.8092682, 2.76036, 1, 0, 0, 1, 1,
0.3912749, -0.2143083, 3.176092, 1, 0, 0, 1, 1,
0.3971204, 0.3870282, 1.352316, 1, 0, 0, 1, 1,
0.3979577, -1.566591, 2.204189, 1, 0, 0, 1, 1,
0.4000291, 1.341736, 1.844018, 0, 0, 0, 1, 1,
0.4027419, 1.561422, 0.4789138, 0, 0, 0, 1, 1,
0.4067613, -0.3361928, 1.046808, 0, 0, 0, 1, 1,
0.4078839, -0.2581758, 1.515879, 0, 0, 0, 1, 1,
0.4091843, -0.7599626, 2.066191, 0, 0, 0, 1, 1,
0.4141214, -0.5108133, 1.260094, 0, 0, 0, 1, 1,
0.4178891, -0.4384186, 0.7847732, 0, 0, 0, 1, 1,
0.4195459, -0.9076418, 2.744979, 1, 1, 1, 1, 1,
0.419701, 0.7722524, 0.9283335, 1, 1, 1, 1, 1,
0.4230655, -1.21437, 1.718964, 1, 1, 1, 1, 1,
0.4269502, -1.304738, 2.133417, 1, 1, 1, 1, 1,
0.4319335, 1.675053, -0.7721991, 1, 1, 1, 1, 1,
0.4324434, -0.02474828, 0.6093173, 1, 1, 1, 1, 1,
0.436125, -2.771355, 4.832834, 1, 1, 1, 1, 1,
0.4390186, -0.1633623, 3.193089, 1, 1, 1, 1, 1,
0.4394058, -0.8338741, 2.370055, 1, 1, 1, 1, 1,
0.4416266, 0.7424191, 0.9731054, 1, 1, 1, 1, 1,
0.4428356, 0.3411063, 0.9109244, 1, 1, 1, 1, 1,
0.4460825, -0.764718, 3.70672, 1, 1, 1, 1, 1,
0.448177, -1.023804, 2.888395, 1, 1, 1, 1, 1,
0.4509595, 1.063562, 0.1344873, 1, 1, 1, 1, 1,
0.4514261, -2.212761, 2.608407, 1, 1, 1, 1, 1,
0.4520512, 0.712056, 0.7070723, 0, 0, 1, 1, 1,
0.453669, 1.030447, 1.769852, 1, 0, 0, 1, 1,
0.4545797, -0.529069, 1.539865, 1, 0, 0, 1, 1,
0.4546306, 0.6397679, -0.8467838, 1, 0, 0, 1, 1,
0.4556698, 0.3029172, -0.4876659, 1, 0, 0, 1, 1,
0.459611, 0.3372907, 1.802541, 1, 0, 0, 1, 1,
0.4597179, -1.563318, 3.62483, 0, 0, 0, 1, 1,
0.4651937, 0.03743274, 2.566163, 0, 0, 0, 1, 1,
0.4697168, 1.29448, 1.448706, 0, 0, 0, 1, 1,
0.470004, 0.2719889, 3.260373, 0, 0, 0, 1, 1,
0.4742377, -3.10832, 4.886615, 0, 0, 0, 1, 1,
0.4745399, -2.148318, 3.577608, 0, 0, 0, 1, 1,
0.4824201, -0.926239, 2.805552, 0, 0, 0, 1, 1,
0.4827766, -1.139243, 3.263789, 1, 1, 1, 1, 1,
0.4887874, -0.6496075, 3.384867, 1, 1, 1, 1, 1,
0.4906573, 0.6908646, 0.4085692, 1, 1, 1, 1, 1,
0.4930115, 0.8309178, 0.9248223, 1, 1, 1, 1, 1,
0.4930283, -1.993575, 5.470869, 1, 1, 1, 1, 1,
0.4992381, 0.02512106, 1.146309, 1, 1, 1, 1, 1,
0.5017694, -0.08084743, 3.324757, 1, 1, 1, 1, 1,
0.5109115, -1.586156, 3.542839, 1, 1, 1, 1, 1,
0.5133054, 0.7338716, 1.843819, 1, 1, 1, 1, 1,
0.5136476, -0.9787562, 2.640154, 1, 1, 1, 1, 1,
0.5196655, -0.3725637, 2.48822, 1, 1, 1, 1, 1,
0.5287097, 1.579872, 1.647415, 1, 1, 1, 1, 1,
0.5305359, -0.53282, 2.847315, 1, 1, 1, 1, 1,
0.5326431, 2.242497, 1.28364, 1, 1, 1, 1, 1,
0.5369762, 0.1823059, 1.130037, 1, 1, 1, 1, 1,
0.5474975, 0.6486014, 0.3985307, 0, 0, 1, 1, 1,
0.548535, 0.3860982, 0.697679, 1, 0, 0, 1, 1,
0.5512421, -0.6218103, 2.51072, 1, 0, 0, 1, 1,
0.5549716, -2.100322, 1.750834, 1, 0, 0, 1, 1,
0.5563245, 0.9519483, -0.2098465, 1, 0, 0, 1, 1,
0.5598451, 0.1743035, 1.590599, 1, 0, 0, 1, 1,
0.5650288, -1.710066, 3.960095, 0, 0, 0, 1, 1,
0.5689936, -0.7449144, 3.297206, 0, 0, 0, 1, 1,
0.572808, 0.9914971, -1.338938, 0, 0, 0, 1, 1,
0.5748883, -0.3728753, 2.153111, 0, 0, 0, 1, 1,
0.5754853, -1.194478, 4.671492, 0, 0, 0, 1, 1,
0.5804545, -1.767213, 3.855438, 0, 0, 0, 1, 1,
0.5816172, -1.953632, 4.974682, 0, 0, 0, 1, 1,
0.5836699, 1.511622, 1.421415, 1, 1, 1, 1, 1,
0.5837888, 0.07955258, 1.058995, 1, 1, 1, 1, 1,
0.5868991, -0.1826559, 0.7014415, 1, 1, 1, 1, 1,
0.5893921, 0.5339609, 1.448688, 1, 1, 1, 1, 1,
0.5894474, 1.551236, 1.6804, 1, 1, 1, 1, 1,
0.5912423, 1.53831, 1.502299, 1, 1, 1, 1, 1,
0.5921645, 0.6718892, 1.122597, 1, 1, 1, 1, 1,
0.5942127, 1.410404, 0.2551345, 1, 1, 1, 1, 1,
0.5954461, 0.26127, 1.177198, 1, 1, 1, 1, 1,
0.599407, -0.410883, 3.611558, 1, 1, 1, 1, 1,
0.6041267, -0.2796076, 1.091275, 1, 1, 1, 1, 1,
0.6096635, 0.2367163, 1.612751, 1, 1, 1, 1, 1,
0.6104091, -1.108206, 4.507045, 1, 1, 1, 1, 1,
0.6112323, 0.06697094, 2.004936, 1, 1, 1, 1, 1,
0.6121985, 2.467987, 0.007216505, 1, 1, 1, 1, 1,
0.616562, 0.62192, 1.104352, 0, 0, 1, 1, 1,
0.617643, -1.896956, 2.355186, 1, 0, 0, 1, 1,
0.6363689, 0.03942159, 1.8392, 1, 0, 0, 1, 1,
0.6416419, -0.3731526, 2.476089, 1, 0, 0, 1, 1,
0.6434457, -1.217113, 3.274662, 1, 0, 0, 1, 1,
0.6525897, 0.9930078, 0.5429207, 1, 0, 0, 1, 1,
0.6560701, 1.071417, 0.5669959, 0, 0, 0, 1, 1,
0.6591882, 0.4350439, 1.274107, 0, 0, 0, 1, 1,
0.6606641, 0.5354697, 0.2616296, 0, 0, 0, 1, 1,
0.6613086, 2.638267, 0.4251594, 0, 0, 0, 1, 1,
0.6623091, -1.676752, 1.47245, 0, 0, 0, 1, 1,
0.6756622, -0.261811, 3.153621, 0, 0, 0, 1, 1,
0.6794798, 0.4838216, 1.335506, 0, 0, 0, 1, 1,
0.6797517, 1.073825, -0.8511615, 1, 1, 1, 1, 1,
0.6823988, -0.8014331, 1.892808, 1, 1, 1, 1, 1,
0.6851644, 0.6996974, 0.9187046, 1, 1, 1, 1, 1,
0.685566, -1.480132, 2.57207, 1, 1, 1, 1, 1,
0.6883029, 0.1920936, 0.8172063, 1, 1, 1, 1, 1,
0.6892661, 0.5419447, -1.50191, 1, 1, 1, 1, 1,
0.6902646, -0.2194403, 2.538693, 1, 1, 1, 1, 1,
0.6931342, 0.765108, 0.303301, 1, 1, 1, 1, 1,
0.6939127, 0.8526353, 0.08714562, 1, 1, 1, 1, 1,
0.7028001, -1.682699, 1.421661, 1, 1, 1, 1, 1,
0.7059005, 0.3674393, 1.826009, 1, 1, 1, 1, 1,
0.7062448, -0.5927414, 1.47151, 1, 1, 1, 1, 1,
0.7115941, 0.8807446, -0.10488, 1, 1, 1, 1, 1,
0.7116531, -0.6644229, 3.187198, 1, 1, 1, 1, 1,
0.7193059, -0.2379652, 1.514848, 1, 1, 1, 1, 1,
0.7228972, 0.4327513, 1.398946, 0, 0, 1, 1, 1,
0.7245036, -0.3796739, 2.675317, 1, 0, 0, 1, 1,
0.7264257, -0.6939736, 2.660092, 1, 0, 0, 1, 1,
0.7330424, -1.007939, 3.269524, 1, 0, 0, 1, 1,
0.7349306, 1.406428, 0.736034, 1, 0, 0, 1, 1,
0.7374062, -0.6585333, 2.47836, 1, 0, 0, 1, 1,
0.7395953, -0.6119689, 3.545666, 0, 0, 0, 1, 1,
0.7472457, 0.09726058, 0.7745474, 0, 0, 0, 1, 1,
0.7482585, 1.106123, -1.159308, 0, 0, 0, 1, 1,
0.7493787, 0.00563819, 0.05298073, 0, 0, 0, 1, 1,
0.7544855, -1.893842, 3.444533, 0, 0, 0, 1, 1,
0.7583971, -0.1940323, 1.960352, 0, 0, 0, 1, 1,
0.7638511, -1.960554, 4.388089, 0, 0, 0, 1, 1,
0.7657636, 1.322871, 0.6148354, 1, 1, 1, 1, 1,
0.7657992, 0.822153, 1.847105, 1, 1, 1, 1, 1,
0.7670152, 0.9010525, 0.2030625, 1, 1, 1, 1, 1,
0.76891, -0.3185484, 3.716814, 1, 1, 1, 1, 1,
0.7704322, 0.8146598, 1.549511, 1, 1, 1, 1, 1,
0.7711408, 0.05385087, 1.752425, 1, 1, 1, 1, 1,
0.773785, -2.499031, 3.314723, 1, 1, 1, 1, 1,
0.7799562, -0.00766928, 0.4416431, 1, 1, 1, 1, 1,
0.7828051, 0.9408208, 0.08628036, 1, 1, 1, 1, 1,
0.7829934, 0.8698438, 1.421592, 1, 1, 1, 1, 1,
0.787034, -1.142744, 1.396293, 1, 1, 1, 1, 1,
0.7920719, 0.1179864, 2.887101, 1, 1, 1, 1, 1,
0.7986386, 1.493272, 0.8285661, 1, 1, 1, 1, 1,
0.8005616, 1.121674, 0.1091216, 1, 1, 1, 1, 1,
0.8020286, -0.9670452, 3.487892, 1, 1, 1, 1, 1,
0.8110674, -0.2144666, 2.371714, 0, 0, 1, 1, 1,
0.8120636, -0.5670442, 2.492508, 1, 0, 0, 1, 1,
0.8130251, -0.5888269, 2.456086, 1, 0, 0, 1, 1,
0.8163394, 0.918879, -0.8820328, 1, 0, 0, 1, 1,
0.8167971, 1.572725, -0.819222, 1, 0, 0, 1, 1,
0.8196539, -0.5384525, 0.9598517, 1, 0, 0, 1, 1,
0.8218382, 1.459499, 0.3699244, 0, 0, 0, 1, 1,
0.822377, 1.070031, 0.3037392, 0, 0, 0, 1, 1,
0.8256863, 1.713091, -0.5766526, 0, 0, 0, 1, 1,
0.8300985, 1.231703, 0.5837311, 0, 0, 0, 1, 1,
0.8307186, -0.6212956, 2.354933, 0, 0, 0, 1, 1,
0.831011, -0.6508709, 3.396456, 0, 0, 0, 1, 1,
0.8330649, -1.366448, 3.7959, 0, 0, 0, 1, 1,
0.8346391, 0.6389013, 2.20144, 1, 1, 1, 1, 1,
0.8419076, -0.05354938, 2.654062, 1, 1, 1, 1, 1,
0.8428576, -1.119063, 1.099382, 1, 1, 1, 1, 1,
0.8460892, 0.1654375, 1.901936, 1, 1, 1, 1, 1,
0.8500418, 0.4395265, 0.6784502, 1, 1, 1, 1, 1,
0.8559375, 0.6782925, 0.01889972, 1, 1, 1, 1, 1,
0.8628067, 0.5123907, 0.2668415, 1, 1, 1, 1, 1,
0.8702846, 0.4372718, 0.2069798, 1, 1, 1, 1, 1,
0.8726821, -2.080324, 1.804185, 1, 1, 1, 1, 1,
0.8747743, 0.9215259, -0.4240309, 1, 1, 1, 1, 1,
0.8817222, -0.7220038, 1.91614, 1, 1, 1, 1, 1,
0.884296, -1.089187, 2.056627, 1, 1, 1, 1, 1,
0.889033, 0.9970369, 0.3088109, 1, 1, 1, 1, 1,
0.8901165, 0.02128591, 1.531123, 1, 1, 1, 1, 1,
0.8913248, -1.271752, 2.59763, 1, 1, 1, 1, 1,
0.891565, 0.06331825, 0.8459095, 0, 0, 1, 1, 1,
0.8921306, 0.5117205, 1.242813, 1, 0, 0, 1, 1,
0.8984061, -1.734366, 2.3357, 1, 0, 0, 1, 1,
0.8999575, 2.060343, 0.1823127, 1, 0, 0, 1, 1,
0.9017522, 1.461784, -0.5434728, 1, 0, 0, 1, 1,
0.903832, 2.24115, 0.2296677, 1, 0, 0, 1, 1,
0.9063452, -0.477816, 1.86729, 0, 0, 0, 1, 1,
0.9074299, 1.855383, -0.4834218, 0, 0, 0, 1, 1,
0.9074445, 1.207928, 0.7174162, 0, 0, 0, 1, 1,
0.9087479, -1.696055, 2.583965, 0, 0, 0, 1, 1,
0.9099769, 0.2415842, 0.3264616, 0, 0, 0, 1, 1,
0.9121816, 0.5044227, 0.3852098, 0, 0, 0, 1, 1,
0.9131665, -1.293241, 3.58645, 0, 0, 0, 1, 1,
0.9156096, -0.3160019, 1.827744, 1, 1, 1, 1, 1,
0.9183722, 1.544779, -1.107093, 1, 1, 1, 1, 1,
0.934972, -0.4695847, 2.552069, 1, 1, 1, 1, 1,
0.9358686, -0.6113719, 2.443111, 1, 1, 1, 1, 1,
0.9366329, 2.079854, -2.29178, 1, 1, 1, 1, 1,
0.9435275, 1.397809, 1.319777, 1, 1, 1, 1, 1,
0.9441225, 0.004656484, 1.026889, 1, 1, 1, 1, 1,
0.9461901, -0.5003166, 1.463135, 1, 1, 1, 1, 1,
0.9471722, -0.646156, 2.087958, 1, 1, 1, 1, 1,
0.9481186, 0.04846001, 2.090756, 1, 1, 1, 1, 1,
0.9518221, 0.1803777, 2.537427, 1, 1, 1, 1, 1,
0.9533002, -1.713063, 3.004599, 1, 1, 1, 1, 1,
0.9542574, -1.126816, 3.721429, 1, 1, 1, 1, 1,
0.9563887, 0.07376937, 2.493214, 1, 1, 1, 1, 1,
0.9578756, 1.261081, 1.166945, 1, 1, 1, 1, 1,
0.9617081, -0.6786284, 0.2122189, 0, 0, 1, 1, 1,
0.9637309, 0.3614602, 3.506514, 1, 0, 0, 1, 1,
0.9691167, 0.2788261, 2.541243, 1, 0, 0, 1, 1,
0.9694116, -0.1282438, 1.496831, 1, 0, 0, 1, 1,
0.97682, -0.515062, 2.097357, 1, 0, 0, 1, 1,
0.9787401, -0.1607201, 0.8438864, 1, 0, 0, 1, 1,
0.9795783, -1.027143, 2.544646, 0, 0, 0, 1, 1,
0.9818173, 0.7777992, -0.3769098, 0, 0, 0, 1, 1,
0.9820098, 0.2718796, 2.383746, 0, 0, 0, 1, 1,
0.9834906, 1.203059, 0.6677014, 0, 0, 0, 1, 1,
0.9893519, -1.372921, 1.796194, 0, 0, 0, 1, 1,
0.9945492, -0.9193734, 2.943209, 0, 0, 0, 1, 1,
0.9962747, -0.2361033, -0.04593844, 0, 0, 0, 1, 1,
0.9984627, 1.45652, 1.959111, 1, 1, 1, 1, 1,
1.005715, 1.572964, 1.233755, 1, 1, 1, 1, 1,
1.007607, -0.8890405, 1.16436, 1, 1, 1, 1, 1,
1.007791, 0.6923895, 1.797159, 1, 1, 1, 1, 1,
1.008004, -2.010477, 2.077946, 1, 1, 1, 1, 1,
1.009792, -0.3697561, 0.96567, 1, 1, 1, 1, 1,
1.01285, 1.188554, 1.548943, 1, 1, 1, 1, 1,
1.022797, -1.463816, 2.693174, 1, 1, 1, 1, 1,
1.025842, 1.558138, 1.107121, 1, 1, 1, 1, 1,
1.031324, -0.2703122, 2.142555, 1, 1, 1, 1, 1,
1.034034, -1.542163, 3.395303, 1, 1, 1, 1, 1,
1.034095, 0.4547225, 1.705719, 1, 1, 1, 1, 1,
1.036423, -1.026152, 2.251676, 1, 1, 1, 1, 1,
1.038065, -0.04577764, 1.310886, 1, 1, 1, 1, 1,
1.038357, 0.03338667, 0.7943857, 1, 1, 1, 1, 1,
1.039381, 1.071246, 0.5014544, 0, 0, 1, 1, 1,
1.048068, 0.5376192, -0.9177123, 1, 0, 0, 1, 1,
1.052194, 1.125404, -0.2719822, 1, 0, 0, 1, 1,
1.054774, 0.5696681, -0.3024912, 1, 0, 0, 1, 1,
1.055811, -2.735345, 3.266048, 1, 0, 0, 1, 1,
1.06499, 1.042979, 0.5571282, 1, 0, 0, 1, 1,
1.069947, 0.2191589, 1.835044, 0, 0, 0, 1, 1,
1.071934, -0.2286305, 1.881567, 0, 0, 0, 1, 1,
1.078153, -0.3550057, 1.808345, 0, 0, 0, 1, 1,
1.08267, -0.5710782, 1.842987, 0, 0, 0, 1, 1,
1.085627, -0.7989651, 2.641642, 0, 0, 0, 1, 1,
1.085756, 0.1552496, 0.9782059, 0, 0, 0, 1, 1,
1.08642, 0.02898668, 1.322818, 0, 0, 0, 1, 1,
1.090557, 1.755263, -0.2056231, 1, 1, 1, 1, 1,
1.095632, 2.290118, -1.179995, 1, 1, 1, 1, 1,
1.098223, -0.7024214, 3.934618, 1, 1, 1, 1, 1,
1.105036, -2.304658, 2.56804, 1, 1, 1, 1, 1,
1.108438, -0.5464725, 2.053532, 1, 1, 1, 1, 1,
1.109403, 1.109704, -1.875544, 1, 1, 1, 1, 1,
1.114361, 0.9567495, 0.78182, 1, 1, 1, 1, 1,
1.122488, 0.7498587, 1.530453, 1, 1, 1, 1, 1,
1.126675, 0.1611295, 3.792775, 1, 1, 1, 1, 1,
1.128375, 0.7397975, 0.5848749, 1, 1, 1, 1, 1,
1.132404, -1.3533, 2.895439, 1, 1, 1, 1, 1,
1.13529, 0.3543403, 1.3367, 1, 1, 1, 1, 1,
1.137261, 0.4330159, 2.126389, 1, 1, 1, 1, 1,
1.138101, -0.3380137, 1.733745, 1, 1, 1, 1, 1,
1.138695, 1.04555, 0.7551047, 1, 1, 1, 1, 1,
1.146817, -0.1605912, -0.06674594, 0, 0, 1, 1, 1,
1.15065, -0.5819549, 2.999208, 1, 0, 0, 1, 1,
1.159002, -1.329767, 3.155792, 1, 0, 0, 1, 1,
1.170172, -1.306359, 3.906878, 1, 0, 0, 1, 1,
1.181867, 1.84872, 0.5512801, 1, 0, 0, 1, 1,
1.182569, 0.4576834, -0.715638, 1, 0, 0, 1, 1,
1.18411, 0.6855322, 1.324653, 0, 0, 0, 1, 1,
1.187277, -0.0336663, 2.558639, 0, 0, 0, 1, 1,
1.199873, -0.7409422, 2.461628, 0, 0, 0, 1, 1,
1.203671, 0.713778, 3.065041, 0, 0, 0, 1, 1,
1.204786, 1.656362, 2.495755, 0, 0, 0, 1, 1,
1.206452, 1.317763, 0.8709013, 0, 0, 0, 1, 1,
1.208423, -1.159974, 2.900184, 0, 0, 0, 1, 1,
1.209849, 0.3023579, 0.8278142, 1, 1, 1, 1, 1,
1.220833, -1.11459, 2.73123, 1, 1, 1, 1, 1,
1.223862, 0.621974, 1.223928, 1, 1, 1, 1, 1,
1.226737, 1.190903, 0.5597661, 1, 1, 1, 1, 1,
1.227579, 0.177655, 1.984259, 1, 1, 1, 1, 1,
1.23172, -0.02459733, 2.55857, 1, 1, 1, 1, 1,
1.235348, 0.03186593, 0.5686839, 1, 1, 1, 1, 1,
1.235564, -0.6462992, 1.509126, 1, 1, 1, 1, 1,
1.238518, 1.373266, -0.01089106, 1, 1, 1, 1, 1,
1.246387, -1.288669, 1.938081, 1, 1, 1, 1, 1,
1.260772, -1.030085, 3.562814, 1, 1, 1, 1, 1,
1.262154, 0.007177544, 1.955241, 1, 1, 1, 1, 1,
1.264601, 0.4945524, 0.5495174, 1, 1, 1, 1, 1,
1.268594, -0.4093109, 0.9453887, 1, 1, 1, 1, 1,
1.269349, -0.3595535, 2.661347, 1, 1, 1, 1, 1,
1.27298, -1.466099, 3.298692, 0, 0, 1, 1, 1,
1.278665, -0.1569576, -0.3664311, 1, 0, 0, 1, 1,
1.279117, -1.506436, 1.34082, 1, 0, 0, 1, 1,
1.303371, -1.895902, 2.735645, 1, 0, 0, 1, 1,
1.313214, 2.215083, 1.525853, 1, 0, 0, 1, 1,
1.326988, 1.887338, -0.3858127, 1, 0, 0, 1, 1,
1.330215, 0.5070767, 1.580576, 0, 0, 0, 1, 1,
1.334033, 0.2013533, 1.221537, 0, 0, 0, 1, 1,
1.342087, 0.1796324, 1.803231, 0, 0, 0, 1, 1,
1.348541, -0.1194838, 0.5299119, 0, 0, 0, 1, 1,
1.351555, -1.628003, 1.794444, 0, 0, 0, 1, 1,
1.351855, -0.5527016, 2.302134, 0, 0, 0, 1, 1,
1.393489, -0.09358738, 1.139991, 0, 0, 0, 1, 1,
1.411787, 1.61581, 2.307014, 1, 1, 1, 1, 1,
1.415273, -1.515641, 2.81221, 1, 1, 1, 1, 1,
1.420909, 0.596722, -0.2394614, 1, 1, 1, 1, 1,
1.42091, 1.306055, 1.772535, 1, 1, 1, 1, 1,
1.43299, 1.330334, 1.660718, 1, 1, 1, 1, 1,
1.446917, -0.3204699, 3.348191, 1, 1, 1, 1, 1,
1.453473, 0.7897781, 0.7022853, 1, 1, 1, 1, 1,
1.456926, 1.606004, -0.7641445, 1, 1, 1, 1, 1,
1.459565, 0.6749811, -0.7707349, 1, 1, 1, 1, 1,
1.468612, -0.07636105, 0.5015953, 1, 1, 1, 1, 1,
1.476877, 1.45146, 0.2450568, 1, 1, 1, 1, 1,
1.482434, 0.06853609, 0.7666824, 1, 1, 1, 1, 1,
1.495147, -0.05911189, 2.397917, 1, 1, 1, 1, 1,
1.501245, -1.501949, 3.055109, 1, 1, 1, 1, 1,
1.51516, -0.7616398, 2.657234, 1, 1, 1, 1, 1,
1.515187, 0.3425604, 2.169417, 0, 0, 1, 1, 1,
1.515274, -0.3341582, 1.612044, 1, 0, 0, 1, 1,
1.541506, 0.031639, 1.174439, 1, 0, 0, 1, 1,
1.552259, -1.679004, 1.844858, 1, 0, 0, 1, 1,
1.571732, -0.4419524, 1.547568, 1, 0, 0, 1, 1,
1.575365, -1.876386, 2.530493, 1, 0, 0, 1, 1,
1.575638, 0.4536555, 0.1299977, 0, 0, 0, 1, 1,
1.576676, 0.3595027, 1.739509, 0, 0, 0, 1, 1,
1.577591, -1.678635, 4.936054, 0, 0, 0, 1, 1,
1.58074, -1.384278, 3.111385, 0, 0, 0, 1, 1,
1.587989, -0.6713043, 2.299392, 0, 0, 0, 1, 1,
1.591567, -1.180404, 2.182876, 0, 0, 0, 1, 1,
1.607734, 0.2670818, 1.519378, 0, 0, 0, 1, 1,
1.619778, 0.9024481, -0.7095616, 1, 1, 1, 1, 1,
1.630668, 0.4919674, 0.9772463, 1, 1, 1, 1, 1,
1.635027, -0.02418883, 1.669811, 1, 1, 1, 1, 1,
1.642987, -0.0946621, -0.1262844, 1, 1, 1, 1, 1,
1.648483, -0.1827323, 1.866647, 1, 1, 1, 1, 1,
1.653823, -0.4468456, 1.501498, 1, 1, 1, 1, 1,
1.661108, -0.4640393, 2.773801, 1, 1, 1, 1, 1,
1.661119, -1.406618, 0.7121251, 1, 1, 1, 1, 1,
1.670135, -0.9222115, 3.816475, 1, 1, 1, 1, 1,
1.68385, 1.278144, 1.328013, 1, 1, 1, 1, 1,
1.710136, 0.07329153, 1.895649, 1, 1, 1, 1, 1,
1.714054, 1.531314, 0.3541265, 1, 1, 1, 1, 1,
1.724816, 1.199528, 1.599531, 1, 1, 1, 1, 1,
1.734784, 1.971366, 2.554418, 1, 1, 1, 1, 1,
1.740963, 0.5918105, 0.5708981, 1, 1, 1, 1, 1,
1.746655, 2.687698, -1.592635, 0, 0, 1, 1, 1,
1.746889, -0.5259892, 1.757097, 1, 0, 0, 1, 1,
1.759652, 0.2279782, 0.02145724, 1, 0, 0, 1, 1,
1.768211, 0.0742001, 1.246845, 1, 0, 0, 1, 1,
1.805143, -0.6398062, 2.985194, 1, 0, 0, 1, 1,
1.806563, 1.166779, 2.249073, 1, 0, 0, 1, 1,
1.813302, -0.07058415, 3.219512, 0, 0, 0, 1, 1,
1.814872, -0.8765095, 2.92391, 0, 0, 0, 1, 1,
1.822702, 0.3001415, 2.335912, 0, 0, 0, 1, 1,
1.852341, 0.3349118, 1.05127, 0, 0, 0, 1, 1,
1.913472, -0.09065921, 1.583623, 0, 0, 0, 1, 1,
1.916525, 0.4410346, 3.562343, 0, 0, 0, 1, 1,
1.926904, 2.676941, 1.269774, 0, 0, 0, 1, 1,
1.9718, -0.1844956, 1.278829, 1, 1, 1, 1, 1,
2.010355, -0.9072956, 2.386728, 1, 1, 1, 1, 1,
2.010543, 0.1862044, 1.166993, 1, 1, 1, 1, 1,
2.022528, -0.9667822, -0.4698962, 1, 1, 1, 1, 1,
2.041721, -0.3485773, -0.3575976, 1, 1, 1, 1, 1,
2.044466, -0.6536242, 0.1516303, 1, 1, 1, 1, 1,
2.083674, 0.653254, 1.461838, 1, 1, 1, 1, 1,
2.16627, 0.409103, 0.00153463, 1, 1, 1, 1, 1,
2.219916, 1.754917, 2.137264, 1, 1, 1, 1, 1,
2.226096, -1.382744, 0.9252467, 1, 1, 1, 1, 1,
2.263615, 0.3419878, 2.528555, 1, 1, 1, 1, 1,
2.269551, 0.5815045, 1.753186, 1, 1, 1, 1, 1,
2.304374, -0.2290185, 2.673041, 1, 1, 1, 1, 1,
2.306257, 1.643423, 0.7966491, 1, 1, 1, 1, 1,
2.310423, -0.6201552, 2.558568, 1, 1, 1, 1, 1,
2.324767, -0.3912881, -1.132556, 0, 0, 1, 1, 1,
2.340791, -0.1472188, 1.677541, 1, 0, 0, 1, 1,
2.353502, 1.553374, -0.5249624, 1, 0, 0, 1, 1,
2.365079, 2.589585, 1.623043, 1, 0, 0, 1, 1,
2.395053, 0.1245082, 1.760102, 1, 0, 0, 1, 1,
2.398687, 0.5224016, 1.416762, 1, 0, 0, 1, 1,
2.422581, -2.276878, 1.968359, 0, 0, 0, 1, 1,
2.447869, 0.08646306, 2.914577, 0, 0, 0, 1, 1,
2.457437, -0.5831789, 0.3074386, 0, 0, 0, 1, 1,
2.45839, -1.604152, 3.041732, 0, 0, 0, 1, 1,
2.47761, -0.1542807, 1.486665, 0, 0, 0, 1, 1,
2.495632, -1.430636, 4.445064, 0, 0, 0, 1, 1,
2.502232, -0.3106593, 1.526038, 0, 0, 0, 1, 1,
2.561606, 0.6052532, 0.134261, 1, 1, 1, 1, 1,
2.628995, 0.7946732, 0.7710002, 1, 1, 1, 1, 1,
2.751521, -0.5204296, 2.560767, 1, 1, 1, 1, 1,
2.790732, -1.903629, 1.471808, 1, 1, 1, 1, 1,
2.960724, 1.337761, -0.2985394, 1, 1, 1, 1, 1,
3.417037, 0.5555838, 1.311076, 1, 1, 1, 1, 1,
3.666966, -0.3693132, 1.863048, 1, 1, 1, 1, 1
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
var radius = 9.775517;
var distance = 34.33609;
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
mvMatrix.translate( -0.4145359, -0.3932259, -0.1854095 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.33609);
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