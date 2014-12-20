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
-2.805467, 0.008566212, -1.393046, 1, 0, 0, 1,
-2.753884, 1.259549, -1.773384, 1, 0.007843138, 0, 1,
-2.697266, 1.656332, -0.4539922, 1, 0.01176471, 0, 1,
-2.688998, 0.4137268, -1.054814, 1, 0.01960784, 0, 1,
-2.658059, 2.045176, 0.6251534, 1, 0.02352941, 0, 1,
-2.578382, -2.579801, -2.764693, 1, 0.03137255, 0, 1,
-2.545917, 0.6184275, -1.184168, 1, 0.03529412, 0, 1,
-2.457751, 0.05826182, -3.207305, 1, 0.04313726, 0, 1,
-2.34216, 0.6968294, -0.5930853, 1, 0.04705882, 0, 1,
-2.318989, -1.948689, -3.989774, 1, 0.05490196, 0, 1,
-2.275281, -0.3947216, -1.627898, 1, 0.05882353, 0, 1,
-2.270019, -0.9910829, -1.466525, 1, 0.06666667, 0, 1,
-2.232145, 0.3803759, -1.508152, 1, 0.07058824, 0, 1,
-2.22927, 0.5570133, -2.22657, 1, 0.07843138, 0, 1,
-2.219761, -1.708026, -3.138478, 1, 0.08235294, 0, 1,
-2.213847, -0.06357824, -0.5626373, 1, 0.09019608, 0, 1,
-2.191813, -0.2081208, -2.641436, 1, 0.09411765, 0, 1,
-2.139955, 0.3649715, -0.5358534, 1, 0.1019608, 0, 1,
-2.137918, -1.464359, -1.302074, 1, 0.1098039, 0, 1,
-2.132242, -0.01839952, -0.4598698, 1, 0.1137255, 0, 1,
-2.096438, -0.2573664, -1.641919, 1, 0.1215686, 0, 1,
-2.022859, 0.9658975, 1.121142, 1, 0.1254902, 0, 1,
-2.004546, -0.1154043, -2.289115, 1, 0.1333333, 0, 1,
-1.973765, 0.34848, -1.544424, 1, 0.1372549, 0, 1,
-1.969555, -2.026744, -2.209735, 1, 0.145098, 0, 1,
-1.966903, 1.550074, -1.705081, 1, 0.1490196, 0, 1,
-1.962198, 0.5244679, -2.73982, 1, 0.1568628, 0, 1,
-1.939285, -0.2038345, -1.13922, 1, 0.1607843, 0, 1,
-1.933618, 0.5055344, -1.038234, 1, 0.1686275, 0, 1,
-1.932807, -0.9632985, -1.836791, 1, 0.172549, 0, 1,
-1.920084, 0.482128, -1.910007, 1, 0.1803922, 0, 1,
-1.911269, -0.08330288, -0.3516855, 1, 0.1843137, 0, 1,
-1.909942, -0.7421042, -1.451977, 1, 0.1921569, 0, 1,
-1.904539, 0.7952048, -1.845727, 1, 0.1960784, 0, 1,
-1.897052, 2.031545, -1.178504, 1, 0.2039216, 0, 1,
-1.882937, 0.5772145, -1.676484, 1, 0.2117647, 0, 1,
-1.879241, 0.8102016, 0.211879, 1, 0.2156863, 0, 1,
-1.853878, -1.650365, -1.497031, 1, 0.2235294, 0, 1,
-1.846169, 0.3680277, -2.840871, 1, 0.227451, 0, 1,
-1.841962, 2.428596, 0.7937697, 1, 0.2352941, 0, 1,
-1.833994, -0.5978257, -2.649997, 1, 0.2392157, 0, 1,
-1.832913, 0.9838381, -1.695905, 1, 0.2470588, 0, 1,
-1.827554, -0.9985351, -3.461481, 1, 0.2509804, 0, 1,
-1.814932, -0.2060815, -1.57794, 1, 0.2588235, 0, 1,
-1.814917, -1.193592, -4.46789, 1, 0.2627451, 0, 1,
-1.812303, 0.4894016, -0.8048286, 1, 0.2705882, 0, 1,
-1.804481, -0.01604291, -1.050342, 1, 0.2745098, 0, 1,
-1.801092, -1.400378, -2.914244, 1, 0.282353, 0, 1,
-1.786577, -0.3503325, -1.120082, 1, 0.2862745, 0, 1,
-1.767563, 0.9906762, -0.02533143, 1, 0.2941177, 0, 1,
-1.764132, -0.8764734, -1.357277, 1, 0.3019608, 0, 1,
-1.762286, 0.2590448, -0.9559708, 1, 0.3058824, 0, 1,
-1.756594, 0.5769659, -1.263554, 1, 0.3137255, 0, 1,
-1.732392, 2.432062, -0.6916709, 1, 0.3176471, 0, 1,
-1.727999, 2.462103, -0.9245519, 1, 0.3254902, 0, 1,
-1.716202, -0.9984236, -0.9344063, 1, 0.3294118, 0, 1,
-1.712308, -0.5562424, -2.191503, 1, 0.3372549, 0, 1,
-1.706484, 0.432992, -1.915348, 1, 0.3411765, 0, 1,
-1.703896, -0.5460954, -2.133072, 1, 0.3490196, 0, 1,
-1.690579, 1.307821, -0.1371546, 1, 0.3529412, 0, 1,
-1.684362, -1.47555, -1.159056, 1, 0.3607843, 0, 1,
-1.677464, 2.207632, 0.8357477, 1, 0.3647059, 0, 1,
-1.670089, 0.09892846, -2.15783, 1, 0.372549, 0, 1,
-1.667883, 0.5118816, -1.792684, 1, 0.3764706, 0, 1,
-1.656285, -0.3953094, -1.218923, 1, 0.3843137, 0, 1,
-1.625391, -0.391852, -1.361975, 1, 0.3882353, 0, 1,
-1.613789, 1.446254, -0.9115242, 1, 0.3960784, 0, 1,
-1.596578, -0.3501064, -2.505039, 1, 0.4039216, 0, 1,
-1.588631, 0.7596154, -0.9115276, 1, 0.4078431, 0, 1,
-1.578984, 1.584347, -0.9112943, 1, 0.4156863, 0, 1,
-1.556707, -0.4165919, -2.198983, 1, 0.4196078, 0, 1,
-1.553712, 0.1416247, -2.413653, 1, 0.427451, 0, 1,
-1.553284, 0.4214964, -1.744913, 1, 0.4313726, 0, 1,
-1.546952, -0.08391595, -1.591786, 1, 0.4392157, 0, 1,
-1.541386, -0.2071578, -1.630536, 1, 0.4431373, 0, 1,
-1.540424, 1.074242, -0.6669496, 1, 0.4509804, 0, 1,
-1.523776, -1.1892, -4.367851, 1, 0.454902, 0, 1,
-1.512295, 0.4087017, -0.9351097, 1, 0.4627451, 0, 1,
-1.507268, -1.762339, -2.028323, 1, 0.4666667, 0, 1,
-1.506752, -0.6084563, -2.273279, 1, 0.4745098, 0, 1,
-1.504143, -0.7029176, -0.8867075, 1, 0.4784314, 0, 1,
-1.503709, -1.877524, -1.954124, 1, 0.4862745, 0, 1,
-1.47123, 0.05600803, -0.3477981, 1, 0.4901961, 0, 1,
-1.459819, -1.699327, -2.761837, 1, 0.4980392, 0, 1,
-1.455012, -0.2385744, -2.160933, 1, 0.5058824, 0, 1,
-1.451505, 1.065684, -1.955175, 1, 0.509804, 0, 1,
-1.448129, 0.1003439, -0.4785256, 1, 0.5176471, 0, 1,
-1.446513, -0.09095971, -2.293416, 1, 0.5215687, 0, 1,
-1.419969, -0.1365655, -3.983034, 1, 0.5294118, 0, 1,
-1.405448, 0.5576479, -1.13313, 1, 0.5333334, 0, 1,
-1.401578, 0.9347574, -1.26275, 1, 0.5411765, 0, 1,
-1.396029, -0.8843994, -1.829629, 1, 0.5450981, 0, 1,
-1.382652, 1.313836, -2.043455, 1, 0.5529412, 0, 1,
-1.370857, 0.2527921, -2.980153, 1, 0.5568628, 0, 1,
-1.352136, 0.8299738, -1.048966, 1, 0.5647059, 0, 1,
-1.350592, -1.091553, -1.554191, 1, 0.5686275, 0, 1,
-1.338652, -0.5170144, -4.803765, 1, 0.5764706, 0, 1,
-1.332948, -0.6239004, -0.89275, 1, 0.5803922, 0, 1,
-1.327822, -1.603901, -1.182051, 1, 0.5882353, 0, 1,
-1.327485, -0.8226596, -1.284518, 1, 0.5921569, 0, 1,
-1.32415, -0.7052211, -1.257061, 1, 0.6, 0, 1,
-1.320742, 0.05098696, -2.366837, 1, 0.6078432, 0, 1,
-1.320003, 0.5831142, -2.540354, 1, 0.6117647, 0, 1,
-1.317338, 0.468405, -2.541045, 1, 0.6196079, 0, 1,
-1.312582, -0.5852996, -1.7569, 1, 0.6235294, 0, 1,
-1.311109, -2.091436, -1.636052, 1, 0.6313726, 0, 1,
-1.307042, -0.01250779, -2.052702, 1, 0.6352941, 0, 1,
-1.301877, 0.4034044, -0.2727069, 1, 0.6431373, 0, 1,
-1.299823, -1.317211, -2.893673, 1, 0.6470588, 0, 1,
-1.291531, 0.7375798, -1.291043, 1, 0.654902, 0, 1,
-1.289331, 0.4422179, 1.13861, 1, 0.6588235, 0, 1,
-1.287005, -0.9485077, -2.961884, 1, 0.6666667, 0, 1,
-1.286702, 0.3496667, -0.7954347, 1, 0.6705883, 0, 1,
-1.281967, 2.176619, -1.380409, 1, 0.6784314, 0, 1,
-1.280344, -0.1743403, -0.1734881, 1, 0.682353, 0, 1,
-1.276401, 0.9386135, -2.819457, 1, 0.6901961, 0, 1,
-1.275303, -0.3876417, -1.233908, 1, 0.6941177, 0, 1,
-1.275043, 1.104064, -1.124085, 1, 0.7019608, 0, 1,
-1.263808, -1.158399, -3.112725, 1, 0.7098039, 0, 1,
-1.261838, 0.690283, -0.2683338, 1, 0.7137255, 0, 1,
-1.253515, 0.5495034, -3.328032, 1, 0.7215686, 0, 1,
-1.252986, -2.179657, -3.014892, 1, 0.7254902, 0, 1,
-1.249396, 0.80542, -1.170407, 1, 0.7333333, 0, 1,
-1.244534, 0.1774428, -1.899965, 1, 0.7372549, 0, 1,
-1.234449, 0.03171049, -1.548394, 1, 0.7450981, 0, 1,
-1.224911, 0.9232391, -1.973343, 1, 0.7490196, 0, 1,
-1.221527, -0.1177195, -2.978455, 1, 0.7568628, 0, 1,
-1.219408, 1.2621, -0.9083462, 1, 0.7607843, 0, 1,
-1.207802, 0.9597601, -2.128772, 1, 0.7686275, 0, 1,
-1.199232, -0.641416, -2.396447, 1, 0.772549, 0, 1,
-1.197092, 0.2778389, -0.8777567, 1, 0.7803922, 0, 1,
-1.195672, 1.433275, 0.5886278, 1, 0.7843137, 0, 1,
-1.188856, 0.6587062, -0.3599834, 1, 0.7921569, 0, 1,
-1.187055, 0.5043613, -2.250406, 1, 0.7960784, 0, 1,
-1.181942, -1.476892, -2.722103, 1, 0.8039216, 0, 1,
-1.170265, -0.7345728, -2.281492, 1, 0.8117647, 0, 1,
-1.16417, 2.215777, -1.350069, 1, 0.8156863, 0, 1,
-1.159059, 0.1109743, -0.9908782, 1, 0.8235294, 0, 1,
-1.150593, 0.1201213, -2.086185, 1, 0.827451, 0, 1,
-1.143582, -0.1463917, -2.196739, 1, 0.8352941, 0, 1,
-1.143375, 0.3288746, -2.531765, 1, 0.8392157, 0, 1,
-1.137611, 0.3789217, -1.826984, 1, 0.8470588, 0, 1,
-1.135663, 0.25869, -1.931419, 1, 0.8509804, 0, 1,
-1.130249, 1.758031, 0.1590859, 1, 0.8588235, 0, 1,
-1.128662, 0.3910301, 0.138004, 1, 0.8627451, 0, 1,
-1.123604, -1.071954, -3.952906, 1, 0.8705882, 0, 1,
-1.121838, 0.5921018, -0.9506437, 1, 0.8745098, 0, 1,
-1.117214, 1.679072, 1.135082, 1, 0.8823529, 0, 1,
-1.116396, -0.1015243, -1.936113, 1, 0.8862745, 0, 1,
-1.112113, -3.325495, -3.236846, 1, 0.8941177, 0, 1,
-1.111692, -0.54343, -1.628071, 1, 0.8980392, 0, 1,
-1.109983, 0.2187375, -0.6442204, 1, 0.9058824, 0, 1,
-1.101751, -0.3341205, -1.589857, 1, 0.9137255, 0, 1,
-1.09823, 0.1102054, -2.784082, 1, 0.9176471, 0, 1,
-1.094226, 1.395908, 0.6722795, 1, 0.9254902, 0, 1,
-1.091003, 1.578724, -1.232489, 1, 0.9294118, 0, 1,
-1.090673, -0.257988, -2.810746, 1, 0.9372549, 0, 1,
-1.083466, -1.524465, -1.224636, 1, 0.9411765, 0, 1,
-1.081024, 1.298866, -1.765612, 1, 0.9490196, 0, 1,
-1.080165, -1.043349, -1.868026, 1, 0.9529412, 0, 1,
-1.076466, -1.788298, -3.130599, 1, 0.9607843, 0, 1,
-1.069198, 1.972028, -2.155272, 1, 0.9647059, 0, 1,
-1.065809, -1.345585, -3.001057, 1, 0.972549, 0, 1,
-1.063112, 0.8451538, -3.556896, 1, 0.9764706, 0, 1,
-1.045386, -1.598488, -2.950333, 1, 0.9843137, 0, 1,
-1.044099, -0.6548799, -1.718669, 1, 0.9882353, 0, 1,
-1.044064, -0.627091, 0.0978771, 1, 0.9960784, 0, 1,
-1.037017, 0.3600047, -1.842174, 0.9960784, 1, 0, 1,
-1.022295, 0.3715865, -2.700662, 0.9921569, 1, 0, 1,
-1.02076, -1.638472, -2.428237, 0.9843137, 1, 0, 1,
-1.019202, 2.375119, 0.8826255, 0.9803922, 1, 0, 1,
-1.006534, 0.6650146, -2.40539, 0.972549, 1, 0, 1,
-1.006085, 0.8876953, -0.5005279, 0.9686275, 1, 0, 1,
-1.005319, 0.1843855, -2.612625, 0.9607843, 1, 0, 1,
-0.9963225, -0.6983176, -1.406814, 0.9568627, 1, 0, 1,
-0.9845585, -0.8724725, -2.454605, 0.9490196, 1, 0, 1,
-0.9798573, 1.167418, -0.4200032, 0.945098, 1, 0, 1,
-0.9785415, -1.696329, -2.223906, 0.9372549, 1, 0, 1,
-0.9765397, 0.3247283, -2.058352, 0.9333333, 1, 0, 1,
-0.9736919, -0.8157777, -0.8516077, 0.9254902, 1, 0, 1,
-0.9701324, -0.5609586, -3.160174, 0.9215686, 1, 0, 1,
-0.9641557, 0.1698073, -1.122654, 0.9137255, 1, 0, 1,
-0.9594598, -0.2058653, -0.8454881, 0.9098039, 1, 0, 1,
-0.9584933, 0.08233787, -0.6557747, 0.9019608, 1, 0, 1,
-0.9577404, -2.052336, -3.346646, 0.8941177, 1, 0, 1,
-0.9545798, -0.2737936, -1.130728, 0.8901961, 1, 0, 1,
-0.9539342, 1.399395, -0.3638334, 0.8823529, 1, 0, 1,
-0.9522078, -2.499081, -2.276397, 0.8784314, 1, 0, 1,
-0.952127, 0.1436004, -1.703917, 0.8705882, 1, 0, 1,
-0.950251, 0.0472761, -0.9781377, 0.8666667, 1, 0, 1,
-0.9494447, -0.08375031, -0.7200329, 0.8588235, 1, 0, 1,
-0.9426662, -0.1728347, -2.809231, 0.854902, 1, 0, 1,
-0.9363467, -1.713068, -2.531341, 0.8470588, 1, 0, 1,
-0.9319488, 0.9417998, -2.596827, 0.8431373, 1, 0, 1,
-0.9310791, 1.173591, -0.8758082, 0.8352941, 1, 0, 1,
-0.9268115, -0.1609956, -1.296911, 0.8313726, 1, 0, 1,
-0.9263939, 0.4433181, 0.9893824, 0.8235294, 1, 0, 1,
-0.9201449, 0.9252952, -0.9288074, 0.8196079, 1, 0, 1,
-0.9199246, -0.3380525, -0.6088617, 0.8117647, 1, 0, 1,
-0.9181364, 1.209943, -1.86513, 0.8078431, 1, 0, 1,
-0.9163948, 0.09673836, -1.472928, 0.8, 1, 0, 1,
-0.9105989, -0.6624708, -0.7886016, 0.7921569, 1, 0, 1,
-0.9064707, -0.2643312, -2.257772, 0.7882353, 1, 0, 1,
-0.9050063, -1.083925, -3.115321, 0.7803922, 1, 0, 1,
-0.8904667, -0.6617838, -2.758647, 0.7764706, 1, 0, 1,
-0.8904419, -0.4912795, -2.100224, 0.7686275, 1, 0, 1,
-0.8896135, -0.4521243, -2.411402, 0.7647059, 1, 0, 1,
-0.8867636, 0.7603524, -2.487678, 0.7568628, 1, 0, 1,
-0.8847514, 1.415352, -0.3280742, 0.7529412, 1, 0, 1,
-0.8844451, -0.05659581, -2.494968, 0.7450981, 1, 0, 1,
-0.8840177, 1.275577, -3.083233, 0.7411765, 1, 0, 1,
-0.8804008, 0.1264861, -1.003625, 0.7333333, 1, 0, 1,
-0.8803689, 1.149161, -2.156666, 0.7294118, 1, 0, 1,
-0.8716447, 0.7973376, -0.8452406, 0.7215686, 1, 0, 1,
-0.8702325, -0.4272492, -2.079193, 0.7176471, 1, 0, 1,
-0.869808, -0.4679539, -4.085591, 0.7098039, 1, 0, 1,
-0.8688674, 0.2115352, -2.971296, 0.7058824, 1, 0, 1,
-0.8635858, 1.298145, -1.866161, 0.6980392, 1, 0, 1,
-0.8632157, -1.354798, -2.449134, 0.6901961, 1, 0, 1,
-0.8569896, 0.3527775, -0.865253, 0.6862745, 1, 0, 1,
-0.8506071, 0.003351006, -1.74503, 0.6784314, 1, 0, 1,
-0.8502027, -1.134961, -2.320299, 0.6745098, 1, 0, 1,
-0.8494678, -1.642472, -4.165785, 0.6666667, 1, 0, 1,
-0.842677, -1.168232, -3.990631, 0.6627451, 1, 0, 1,
-0.8320889, 1.004696, 0.9091698, 0.654902, 1, 0, 1,
-0.8309232, -1.119708, -2.154663, 0.6509804, 1, 0, 1,
-0.8264137, 0.8112194, -0.8146909, 0.6431373, 1, 0, 1,
-0.8262842, 0.4676668, 0.5575639, 0.6392157, 1, 0, 1,
-0.8207147, 0.6256318, -0.594869, 0.6313726, 1, 0, 1,
-0.8201235, 0.5027648, -0.8745927, 0.627451, 1, 0, 1,
-0.8196834, 1.171379, -0.8462576, 0.6196079, 1, 0, 1,
-0.8165201, 0.0433379, -2.441521, 0.6156863, 1, 0, 1,
-0.8103023, 0.06490291, -2.151497, 0.6078432, 1, 0, 1,
-0.8092335, 0.0805292, -0.007433522, 0.6039216, 1, 0, 1,
-0.808245, 0.0499858, -1.501738, 0.5960785, 1, 0, 1,
-0.8029329, 0.07763968, -0.1353591, 0.5882353, 1, 0, 1,
-0.8024694, 1.163012, -1.979863, 0.5843138, 1, 0, 1,
-0.7994294, -0.1074115, 0.235843, 0.5764706, 1, 0, 1,
-0.7963789, -0.1603139, -2.247862, 0.572549, 1, 0, 1,
-0.7929459, -0.6960702, -2.606843, 0.5647059, 1, 0, 1,
-0.7920506, -0.05618284, -3.516813, 0.5607843, 1, 0, 1,
-0.789364, 2.008291, 0.5106554, 0.5529412, 1, 0, 1,
-0.7874992, 0.8973659, -3.044935, 0.5490196, 1, 0, 1,
-0.7859982, -1.317036, -2.026027, 0.5411765, 1, 0, 1,
-0.7855167, 0.543253, -1.609798, 0.5372549, 1, 0, 1,
-0.7820166, -0.01616798, -2.095934, 0.5294118, 1, 0, 1,
-0.7805867, 0.9454507, -1.277199, 0.5254902, 1, 0, 1,
-0.7797433, 0.4027734, -2.173547, 0.5176471, 1, 0, 1,
-0.7766234, -0.05214393, -0.9054587, 0.5137255, 1, 0, 1,
-0.7728055, 0.9223691, 0.1769131, 0.5058824, 1, 0, 1,
-0.7726175, 0.1124144, -1.190237, 0.5019608, 1, 0, 1,
-0.7709591, -0.4080975, -3.422301, 0.4941176, 1, 0, 1,
-0.7707832, 0.02857198, -0.4556846, 0.4862745, 1, 0, 1,
-0.7687877, -0.2272742, -1.033617, 0.4823529, 1, 0, 1,
-0.7674916, -0.2214884, -1.656977, 0.4745098, 1, 0, 1,
-0.7629482, -0.6101667, -1.405803, 0.4705882, 1, 0, 1,
-0.7624581, 0.8771812, -1.430602, 0.4627451, 1, 0, 1,
-0.7584504, 0.3727605, -1.810854, 0.4588235, 1, 0, 1,
-0.7565394, 1.324186, 1.061747, 0.4509804, 1, 0, 1,
-0.7558239, -0.1231095, -2.512178, 0.4470588, 1, 0, 1,
-0.7515048, 0.985627, -0.6158474, 0.4392157, 1, 0, 1,
-0.7501593, -0.05207573, 0.02744988, 0.4352941, 1, 0, 1,
-0.7385213, 0.6061338, -1.496307, 0.427451, 1, 0, 1,
-0.7376245, -1.249942, -2.714776, 0.4235294, 1, 0, 1,
-0.7374262, -1.598054, -2.706223, 0.4156863, 1, 0, 1,
-0.7289262, 0.2353179, -3.274231, 0.4117647, 1, 0, 1,
-0.7262602, 0.2429412, -1.255994, 0.4039216, 1, 0, 1,
-0.7260123, -0.7451623, -1.954126, 0.3960784, 1, 0, 1,
-0.7236814, -0.1087447, -2.855042, 0.3921569, 1, 0, 1,
-0.7218261, -0.04249199, -2.769043, 0.3843137, 1, 0, 1,
-0.7203345, -0.5718611, -4.058448, 0.3803922, 1, 0, 1,
-0.7174476, -1.234081, -3.164848, 0.372549, 1, 0, 1,
-0.7146774, -0.02369908, -2.027094, 0.3686275, 1, 0, 1,
-0.7099415, -0.6606671, -1.380102, 0.3607843, 1, 0, 1,
-0.707453, 1.127686, 0.658841, 0.3568628, 1, 0, 1,
-0.7037019, 0.07594048, -0.4600637, 0.3490196, 1, 0, 1,
-0.6989843, 0.08720752, -1.326275, 0.345098, 1, 0, 1,
-0.6905287, 1.481192, -1.158782, 0.3372549, 1, 0, 1,
-0.6883966, -0.5868621, -3.334575, 0.3333333, 1, 0, 1,
-0.6821642, -0.487321, -2.356185, 0.3254902, 1, 0, 1,
-0.6819324, -0.001918826, -2.268861, 0.3215686, 1, 0, 1,
-0.6810062, -1.557236, -2.868304, 0.3137255, 1, 0, 1,
-0.6791934, -1.238374, -4.112303, 0.3098039, 1, 0, 1,
-0.6722709, -0.8945445, -2.46252, 0.3019608, 1, 0, 1,
-0.6702226, 0.5854081, 0.11799, 0.2941177, 1, 0, 1,
-0.6665365, -1.040468, -2.001755, 0.2901961, 1, 0, 1,
-0.6644673, -0.4563497, -1.686797, 0.282353, 1, 0, 1,
-0.6637641, 0.5612644, -1.382173, 0.2784314, 1, 0, 1,
-0.66372, -0.1528167, -0.8156599, 0.2705882, 1, 0, 1,
-0.6562623, 1.057089, -2.240612, 0.2666667, 1, 0, 1,
-0.6559055, 1.323116, 0.02407955, 0.2588235, 1, 0, 1,
-0.6558551, -0.03327755, 0.01907214, 0.254902, 1, 0, 1,
-0.6545671, -0.8444507, -3.427419, 0.2470588, 1, 0, 1,
-0.6534886, -0.247013, -1.885217, 0.2431373, 1, 0, 1,
-0.6465582, -0.2546348, -2.432009, 0.2352941, 1, 0, 1,
-0.6430327, 0.6124224, -0.9100087, 0.2313726, 1, 0, 1,
-0.6425886, 0.8186423, 0.02831366, 0.2235294, 1, 0, 1,
-0.6346372, -1.380845, -2.257429, 0.2196078, 1, 0, 1,
-0.6330435, -2.428051, -3.216476, 0.2117647, 1, 0, 1,
-0.6310518, 1.427079, 0.6286799, 0.2078431, 1, 0, 1,
-0.6254249, 1.892649, 1.304439, 0.2, 1, 0, 1,
-0.6131179, -1.439693, -2.640122, 0.1921569, 1, 0, 1,
-0.6117572, -0.413292, -2.854314, 0.1882353, 1, 0, 1,
-0.604997, 0.333499, -1.13706, 0.1803922, 1, 0, 1,
-0.5954101, 0.07523922, -0.2850923, 0.1764706, 1, 0, 1,
-0.5911168, -0.1615503, -3.840039, 0.1686275, 1, 0, 1,
-0.5882359, -0.2011631, -0.9163557, 0.1647059, 1, 0, 1,
-0.58808, -1.242607, -3.555531, 0.1568628, 1, 0, 1,
-0.5879681, -1.293867, -1.658327, 0.1529412, 1, 0, 1,
-0.5869179, -0.3243213, -2.896855, 0.145098, 1, 0, 1,
-0.5840104, -0.4860886, -0.8895345, 0.1411765, 1, 0, 1,
-0.5787995, -1.57752, -2.894168, 0.1333333, 1, 0, 1,
-0.5728171, 0.3282802, -1.602307, 0.1294118, 1, 0, 1,
-0.5719205, -0.6148478, -2.380985, 0.1215686, 1, 0, 1,
-0.5663919, -0.1543404, -1.687323, 0.1176471, 1, 0, 1,
-0.5652295, 0.4749032, 0.1039996, 0.1098039, 1, 0, 1,
-0.5643539, -0.701878, -1.938365, 0.1058824, 1, 0, 1,
-0.5619996, -0.2915789, -1.903562, 0.09803922, 1, 0, 1,
-0.5604228, 0.8032905, 0.1067698, 0.09019608, 1, 0, 1,
-0.5599681, 0.3818641, -2.007972, 0.08627451, 1, 0, 1,
-0.556771, -0.09039876, -0.2023824, 0.07843138, 1, 0, 1,
-0.5554686, -0.220691, -1.35291, 0.07450981, 1, 0, 1,
-0.5546721, -1.251272, -3.95873, 0.06666667, 1, 0, 1,
-0.5526494, -0.4374302, -2.339472, 0.0627451, 1, 0, 1,
-0.5505007, -0.3347518, -2.769931, 0.05490196, 1, 0, 1,
-0.5503946, 1.831289, -0.4600356, 0.05098039, 1, 0, 1,
-0.5441527, -0.7847216, -1.88636, 0.04313726, 1, 0, 1,
-0.5426009, 1.677811, -0.7447259, 0.03921569, 1, 0, 1,
-0.5358612, 2.302265, -0.8142242, 0.03137255, 1, 0, 1,
-0.5333434, -0.301585, -2.22677, 0.02745098, 1, 0, 1,
-0.5330824, 1.073549, -1.525941, 0.01960784, 1, 0, 1,
-0.5294218, -0.4808735, -1.516206, 0.01568628, 1, 0, 1,
-0.5279636, -0.4022194, -2.56617, 0.007843138, 1, 0, 1,
-0.5269886, -0.3623741, -0.9863912, 0.003921569, 1, 0, 1,
-0.5238207, -2.25543, -4.804769, 0, 1, 0.003921569, 1,
-0.5220115, 0.01265526, -1.286376, 0, 1, 0.01176471, 1,
-0.5210161, -1.36384, -2.524772, 0, 1, 0.01568628, 1,
-0.5200408, 0.209219, -0.8091104, 0, 1, 0.02352941, 1,
-0.5197535, 0.430175, -3.154975, 0, 1, 0.02745098, 1,
-0.5171228, -1.059874, -1.97889, 0, 1, 0.03529412, 1,
-0.5101076, 0.1464832, 0.8562329, 0, 1, 0.03921569, 1,
-0.5097064, 0.06451081, -0.4776061, 0, 1, 0.04705882, 1,
-0.5067262, -0.1838992, -0.8736382, 0, 1, 0.05098039, 1,
-0.5057556, -0.3547374, -2.280443, 0, 1, 0.05882353, 1,
-0.5015568, 0.2348385, -1.397535, 0, 1, 0.0627451, 1,
-0.498011, -0.2233596, -2.06806, 0, 1, 0.07058824, 1,
-0.4862952, 0.1585662, -1.167104, 0, 1, 0.07450981, 1,
-0.4835471, 1.801218, -0.595944, 0, 1, 0.08235294, 1,
-0.479474, 1.606309, 1.646219, 0, 1, 0.08627451, 1,
-0.464345, 1.934965, 1.576158, 0, 1, 0.09411765, 1,
-0.462295, -1.325508, -1.604557, 0, 1, 0.1019608, 1,
-0.4616814, -0.7628965, -1.010292, 0, 1, 0.1058824, 1,
-0.455, 1.285477, -0.3216725, 0, 1, 0.1137255, 1,
-0.4549929, 0.563852, -0.443339, 0, 1, 0.1176471, 1,
-0.4523047, -1.84187, -3.526615, 0, 1, 0.1254902, 1,
-0.4498785, 0.09766995, 0.6466613, 0, 1, 0.1294118, 1,
-0.4465925, 0.3777261, -0.2843463, 0, 1, 0.1372549, 1,
-0.443078, -0.4546397, -2.336545, 0, 1, 0.1411765, 1,
-0.4415334, -1.794789, -2.712207, 0, 1, 0.1490196, 1,
-0.4412695, -0.6152141, -3.49767, 0, 1, 0.1529412, 1,
-0.4400745, 0.8532358, 2.073651, 0, 1, 0.1607843, 1,
-0.4399693, 1.789969, 1.349482, 0, 1, 0.1647059, 1,
-0.4395759, 0.1419376, -0.1238941, 0, 1, 0.172549, 1,
-0.4376049, 0.4600824, -0.761725, 0, 1, 0.1764706, 1,
-0.4374275, -1.807621, -3.015143, 0, 1, 0.1843137, 1,
-0.4346648, -0.6370429, -3.278929, 0, 1, 0.1882353, 1,
-0.4307569, 0.4899888, -0.3914964, 0, 1, 0.1960784, 1,
-0.4292619, 1.44005, -0.1691512, 0, 1, 0.2039216, 1,
-0.4267484, -0.8400083, -4.565372, 0, 1, 0.2078431, 1,
-0.4266742, 0.5533014, 0.01229773, 0, 1, 0.2156863, 1,
-0.4253082, 0.2156438, 0.3829905, 0, 1, 0.2196078, 1,
-0.4210183, -0.4455036, -1.035662, 0, 1, 0.227451, 1,
-0.4186391, -1.395907, -3.259559, 0, 1, 0.2313726, 1,
-0.4163621, -0.01443457, -2.289428, 0, 1, 0.2392157, 1,
-0.3923418, 0.2309979, -0.8746849, 0, 1, 0.2431373, 1,
-0.3911791, 0.4599569, -1.041544, 0, 1, 0.2509804, 1,
-0.3894315, 0.7901565, -0.5066439, 0, 1, 0.254902, 1,
-0.3890045, 0.6056111, 0.5414759, 0, 1, 0.2627451, 1,
-0.386375, 0.5441831, -0.07199687, 0, 1, 0.2666667, 1,
-0.3835187, -1.686919, -3.169062, 0, 1, 0.2745098, 1,
-0.3828279, -2.357224, -2.353197, 0, 1, 0.2784314, 1,
-0.3809435, 0.6793579, -3.753102, 0, 1, 0.2862745, 1,
-0.3776701, 0.8497103, 0.156675, 0, 1, 0.2901961, 1,
-0.3753354, 2.001626, -0.3917544, 0, 1, 0.2980392, 1,
-0.3731336, 0.6871135, 0.8219817, 0, 1, 0.3058824, 1,
-0.3669078, 0.4575595, 1.020261, 0, 1, 0.3098039, 1,
-0.3660851, -0.07380955, -1.950922, 0, 1, 0.3176471, 1,
-0.3647974, -1.066095, -0.9099095, 0, 1, 0.3215686, 1,
-0.3564466, 0.5298548, 0.04341194, 0, 1, 0.3294118, 1,
-0.3528555, 1.191665, 0.8513252, 0, 1, 0.3333333, 1,
-0.343568, 0.2535376, -1.552679, 0, 1, 0.3411765, 1,
-0.335447, -0.5653505, -3.98898, 0, 1, 0.345098, 1,
-0.3353503, -1.714339, -3.145805, 0, 1, 0.3529412, 1,
-0.3347974, 0.2768757, -1.568899, 0, 1, 0.3568628, 1,
-0.3310514, 0.05212012, -0.04272238, 0, 1, 0.3647059, 1,
-0.3266377, -1.003648, -0.7494593, 0, 1, 0.3686275, 1,
-0.3252438, -0.2676279, -2.641433, 0, 1, 0.3764706, 1,
-0.3217213, -0.5900247, -2.851417, 0, 1, 0.3803922, 1,
-0.3187308, 0.7232535, -1.633777, 0, 1, 0.3882353, 1,
-0.3187234, 0.02282055, -1.180017, 0, 1, 0.3921569, 1,
-0.3173688, 0.05013525, -1.089281, 0, 1, 0.4, 1,
-0.3162796, -1.196152, -2.170625, 0, 1, 0.4078431, 1,
-0.3136236, -0.4182547, -1.546165, 0, 1, 0.4117647, 1,
-0.3118919, 0.4401222, -0.06409335, 0, 1, 0.4196078, 1,
-0.3096549, -0.9774184, -2.827926, 0, 1, 0.4235294, 1,
-0.3092726, 0.6051007, 0.2629115, 0, 1, 0.4313726, 1,
-0.3082058, -0.3829593, -1.254526, 0, 1, 0.4352941, 1,
-0.3058056, -0.579981, -4.546107, 0, 1, 0.4431373, 1,
-0.3020042, -1.585973, -3.220552, 0, 1, 0.4470588, 1,
-0.2956461, -1.628032, -1.825207, 0, 1, 0.454902, 1,
-0.2915752, 1.924162, 1.205048, 0, 1, 0.4588235, 1,
-0.2828253, 0.6173241, -0.9593118, 0, 1, 0.4666667, 1,
-0.28101, 0.2417359, -1.35937, 0, 1, 0.4705882, 1,
-0.2745719, -0.298629, -3.278875, 0, 1, 0.4784314, 1,
-0.2737257, -1.439265, -3.367641, 0, 1, 0.4823529, 1,
-0.27312, 0.2125361, -0.306983, 0, 1, 0.4901961, 1,
-0.272627, -0.8098307, -2.506452, 0, 1, 0.4941176, 1,
-0.2715847, -0.7864642, -4.076062, 0, 1, 0.5019608, 1,
-0.2713108, 1.026024, 0.5764219, 0, 1, 0.509804, 1,
-0.2681262, 1.345623, 1.199231, 0, 1, 0.5137255, 1,
-0.2659918, 1.438251, 1.966813, 0, 1, 0.5215687, 1,
-0.2641924, 1.484291, -0.2363359, 0, 1, 0.5254902, 1,
-0.2622366, 0.2062037, 0.4352252, 0, 1, 0.5333334, 1,
-0.259481, 1.366988, -0.3026286, 0, 1, 0.5372549, 1,
-0.2560135, 0.2890813, -0.8676546, 0, 1, 0.5450981, 1,
-0.2554675, -1.784945, -1.77489, 0, 1, 0.5490196, 1,
-0.255362, -0.1448435, -3.494883, 0, 1, 0.5568628, 1,
-0.2535922, 1.439441, -1.368853, 0, 1, 0.5607843, 1,
-0.2534673, 0.4072455, -0.7774642, 0, 1, 0.5686275, 1,
-0.253251, 1.256364, 1.739797, 0, 1, 0.572549, 1,
-0.2516328, 1.521355, -1.186654, 0, 1, 0.5803922, 1,
-0.2483948, -1.51303, -2.170766, 0, 1, 0.5843138, 1,
-0.2477665, -1.921895, -3.787427, 0, 1, 0.5921569, 1,
-0.2453926, 1.440306, -0.7554613, 0, 1, 0.5960785, 1,
-0.2448249, 1.587587, 1.164571, 0, 1, 0.6039216, 1,
-0.2391236, -0.8764259, -3.379002, 0, 1, 0.6117647, 1,
-0.2374974, 1.087828, 0.8166641, 0, 1, 0.6156863, 1,
-0.2356991, 0.6927773, -2.174382, 0, 1, 0.6235294, 1,
-0.2290644, 1.154837, -1.20652, 0, 1, 0.627451, 1,
-0.2277182, -0.3392454, -2.91551, 0, 1, 0.6352941, 1,
-0.2274831, -1.951422, -1.952754, 0, 1, 0.6392157, 1,
-0.2193471, 0.8058227, -1.361787, 0, 1, 0.6470588, 1,
-0.2094058, 0.4838616, 0.1258342, 0, 1, 0.6509804, 1,
-0.205812, 1.154618, 0.04859225, 0, 1, 0.6588235, 1,
-0.2022111, -0.6018088, -2.398909, 0, 1, 0.6627451, 1,
-0.2016474, 1.710026, -1.568741, 0, 1, 0.6705883, 1,
-0.1949374, -0.4346972, -3.301745, 0, 1, 0.6745098, 1,
-0.1940369, -1.001324, -1.732667, 0, 1, 0.682353, 1,
-0.192096, 0.2216194, 0.4045737, 0, 1, 0.6862745, 1,
-0.1890629, 0.8859922, -0.05414603, 0, 1, 0.6941177, 1,
-0.183282, 0.5435783, -2.272557, 0, 1, 0.7019608, 1,
-0.1816745, -1.594458, -2.959783, 0, 1, 0.7058824, 1,
-0.1806273, 0.1588089, -2.641666, 0, 1, 0.7137255, 1,
-0.1785224, 0.6679577, -1.633894, 0, 1, 0.7176471, 1,
-0.1735312, 0.6484269, -0.7959828, 0, 1, 0.7254902, 1,
-0.1721658, 0.2104647, -0.8910908, 0, 1, 0.7294118, 1,
-0.1702859, -0.3918557, -1.991928, 0, 1, 0.7372549, 1,
-0.1677207, 1.885002, -0.5558578, 0, 1, 0.7411765, 1,
-0.1602179, 0.4845418, -1.485888, 0, 1, 0.7490196, 1,
-0.1595514, -0.1978068, -2.494393, 0, 1, 0.7529412, 1,
-0.1552453, -0.06726905, -1.963932, 0, 1, 0.7607843, 1,
-0.1519794, 1.075571, -0.4373984, 0, 1, 0.7647059, 1,
-0.1505314, 1.49518, 0.6714705, 0, 1, 0.772549, 1,
-0.1444213, 1.111458, 0.931546, 0, 1, 0.7764706, 1,
-0.136133, 0.1162394, -1.320028, 0, 1, 0.7843137, 1,
-0.1341427, -1.704654, -4.715781, 0, 1, 0.7882353, 1,
-0.1339801, 0.08753289, -1.097888, 0, 1, 0.7960784, 1,
-0.1285276, -1.128248, -2.247516, 0, 1, 0.8039216, 1,
-0.1252532, 1.223425, -1.047463, 0, 1, 0.8078431, 1,
-0.1234759, -0.5371372, -2.880885, 0, 1, 0.8156863, 1,
-0.122792, -0.3541372, -2.299001, 0, 1, 0.8196079, 1,
-0.1212003, -0.2202138, -2.918557, 0, 1, 0.827451, 1,
-0.1156821, -2.556666, -2.955578, 0, 1, 0.8313726, 1,
-0.115132, -1.129357, -1.846209, 0, 1, 0.8392157, 1,
-0.1142436, -0.1078412, -2.308678, 0, 1, 0.8431373, 1,
-0.1070036, 0.2794334, -1.246432, 0, 1, 0.8509804, 1,
-0.1025916, -0.4029891, -1.857399, 0, 1, 0.854902, 1,
-0.1004739, 0.9892878, 1.1338, 0, 1, 0.8627451, 1,
-0.09930279, 0.9187838, -0.7455246, 0, 1, 0.8666667, 1,
-0.09837303, 0.03077923, -2.022871, 0, 1, 0.8745098, 1,
-0.09737494, 1.614068, -1.703579, 0, 1, 0.8784314, 1,
-0.09588459, -1.201778, -3.058634, 0, 1, 0.8862745, 1,
-0.08708195, 1.160856, 0.4726492, 0, 1, 0.8901961, 1,
-0.08290161, 1.905004, -0.7520935, 0, 1, 0.8980392, 1,
-0.07972337, -0.8248102, -3.8141, 0, 1, 0.9058824, 1,
-0.07847479, 0.6668878, -1.745638, 0, 1, 0.9098039, 1,
-0.07450426, -1.711992, -3.423737, 0, 1, 0.9176471, 1,
-0.07323853, 1.313349, -2.072208, 0, 1, 0.9215686, 1,
-0.07181747, 0.3330199, 0.008715695, 0, 1, 0.9294118, 1,
-0.06926903, 0.846741, -0.492359, 0, 1, 0.9333333, 1,
-0.06411127, -0.4909483, -3.908969, 0, 1, 0.9411765, 1,
-0.06317759, -1.43697, -3.117029, 0, 1, 0.945098, 1,
-0.05938669, 0.6764739, -0.7437088, 0, 1, 0.9529412, 1,
-0.05839162, -1.84313, -5.780281, 0, 1, 0.9568627, 1,
-0.05490312, -0.8604784, -2.441426, 0, 1, 0.9647059, 1,
-0.05153443, 1.343522, -0.8729784, 0, 1, 0.9686275, 1,
-0.04554409, 1.039335, 0.4263244, 0, 1, 0.9764706, 1,
-0.04413592, 1.59053, -0.4044202, 0, 1, 0.9803922, 1,
-0.04375691, -0.2919859, -3.214625, 0, 1, 0.9882353, 1,
-0.0339627, 0.2967764, 0.452235, 0, 1, 0.9921569, 1,
-0.03103178, 0.7698317, -0.3543959, 0, 1, 1, 1,
-0.02973016, -0.3611381, -3.754009, 0, 0.9921569, 1, 1,
-0.02259238, -0.120804, -2.526546, 0, 0.9882353, 1, 1,
-0.02191412, 0.06732601, -1.475295, 0, 0.9803922, 1, 1,
-0.02016923, -3.364517, -1.654656, 0, 0.9764706, 1, 1,
-0.007987097, -0.6244276, -2.604113, 0, 0.9686275, 1, 1,
-0.005802599, -0.4187025, -3.178601, 0, 0.9647059, 1, 1,
0.006286674, 1.295925, -0.8013885, 0, 0.9568627, 1, 1,
0.006521553, -1.129037, 4.254805, 0, 0.9529412, 1, 1,
0.01410065, 1.38484, 0.5341493, 0, 0.945098, 1, 1,
0.01575242, 0.3472141, 0.06225362, 0, 0.9411765, 1, 1,
0.01680543, -0.3123658, 2.212639, 0, 0.9333333, 1, 1,
0.01895026, 0.797511, 0.4004233, 0, 0.9294118, 1, 1,
0.0200271, 0.3272703, -0.0238611, 0, 0.9215686, 1, 1,
0.02560675, -1.055758, 3.181795, 0, 0.9176471, 1, 1,
0.02666002, -1.55673, 4.534977, 0, 0.9098039, 1, 1,
0.02924002, 0.7611886, -0.2920474, 0, 0.9058824, 1, 1,
0.0294768, -0.05470532, 4.002303, 0, 0.8980392, 1, 1,
0.02953633, -0.582123, 4.539893, 0, 0.8901961, 1, 1,
0.03109036, -0.4607396, 1.842638, 0, 0.8862745, 1, 1,
0.03460801, -0.009687315, -1.277362, 0, 0.8784314, 1, 1,
0.03506584, 0.818077, 0.3915326, 0, 0.8745098, 1, 1,
0.03591834, 2.852168, 0.02774588, 0, 0.8666667, 1, 1,
0.03683149, -1.173276, 1.77896, 0, 0.8627451, 1, 1,
0.03990141, -1.960571, 2.945493, 0, 0.854902, 1, 1,
0.04083554, -1.316861, 3.861154, 0, 0.8509804, 1, 1,
0.04317015, 1.253372, 1.232276, 0, 0.8431373, 1, 1,
0.0433549, 0.672216, -1.653945, 0, 0.8392157, 1, 1,
0.0457276, 0.1069276, -0.2533794, 0, 0.8313726, 1, 1,
0.04666477, -0.1707213, 1.245828, 0, 0.827451, 1, 1,
0.04853898, 0.8660263, -1.447686, 0, 0.8196079, 1, 1,
0.05296649, 0.4591575, 0.5571746, 0, 0.8156863, 1, 1,
0.06249753, -1.369805, 3.423047, 0, 0.8078431, 1, 1,
0.06644259, 1.202161, -1.140342, 0, 0.8039216, 1, 1,
0.06794122, -0.9026864, 3.043712, 0, 0.7960784, 1, 1,
0.07341115, 0.04505901, 0.956464, 0, 0.7882353, 1, 1,
0.07356391, -1.189604, 2.830475, 0, 0.7843137, 1, 1,
0.07653005, -2.056657, 4.602118, 0, 0.7764706, 1, 1,
0.07715623, 1.117665, -0.447111, 0, 0.772549, 1, 1,
0.08155403, 1.261751, 0.4311507, 0, 0.7647059, 1, 1,
0.0819957, -2.059586, 3.849108, 0, 0.7607843, 1, 1,
0.0834612, 0.04515784, 0.8154615, 0, 0.7529412, 1, 1,
0.08349837, -0.5656553, 2.752735, 0, 0.7490196, 1, 1,
0.08484671, 0.9312516, 0.6975709, 0, 0.7411765, 1, 1,
0.08771116, -0.603352, 3.017636, 0, 0.7372549, 1, 1,
0.08866795, 0.7048154, 0.8025541, 0, 0.7294118, 1, 1,
0.08887849, -0.8002521, 3.565843, 0, 0.7254902, 1, 1,
0.09015826, -0.06605794, 1.454311, 0, 0.7176471, 1, 1,
0.09181193, 1.685628, -0.4683563, 0, 0.7137255, 1, 1,
0.09404442, -0.712363, 3.612577, 0, 0.7058824, 1, 1,
0.09525759, -1.647633, 1.880656, 0, 0.6980392, 1, 1,
0.09540191, 1.063607, -0.1287514, 0, 0.6941177, 1, 1,
0.09889541, 0.9662601, 0.1390804, 0, 0.6862745, 1, 1,
0.09961379, -0.298584, 2.789821, 0, 0.682353, 1, 1,
0.1038001, -0.2813806, 2.638721, 0, 0.6745098, 1, 1,
0.1120357, -0.6895077, 1.073975, 0, 0.6705883, 1, 1,
0.1142768, -0.2720756, 4.21868, 0, 0.6627451, 1, 1,
0.1156576, -1.20869, 4.289291, 0, 0.6588235, 1, 1,
0.1164806, 0.7547316, 1.381755, 0, 0.6509804, 1, 1,
0.1171611, 0.05038347, 0.8942989, 0, 0.6470588, 1, 1,
0.1174417, 1.215218, -0.01038973, 0, 0.6392157, 1, 1,
0.1214652, -0.8292758, 4.290405, 0, 0.6352941, 1, 1,
0.1235815, -0.5935732, 2.188102, 0, 0.627451, 1, 1,
0.126024, -1.017947, 2.390383, 0, 0.6235294, 1, 1,
0.126248, -0.6788063, 2.174634, 0, 0.6156863, 1, 1,
0.1262912, 0.583638, 0.9883748, 0, 0.6117647, 1, 1,
0.1291643, -0.8545066, 2.204654, 0, 0.6039216, 1, 1,
0.1294338, -1.376722, 1.45476, 0, 0.5960785, 1, 1,
0.1308599, -1.056036, 3.9736, 0, 0.5921569, 1, 1,
0.1373395, 1.028114, -1.31244, 0, 0.5843138, 1, 1,
0.1386402, -0.4165447, 3.946501, 0, 0.5803922, 1, 1,
0.13907, 0.4539386, 0.05925938, 0, 0.572549, 1, 1,
0.1434592, -0.1270526, 2.532019, 0, 0.5686275, 1, 1,
0.1438729, -0.8588463, 3.047736, 0, 0.5607843, 1, 1,
0.144336, 0.2615088, 1.97822, 0, 0.5568628, 1, 1,
0.1485597, 1.335923, 1.69145, 0, 0.5490196, 1, 1,
0.1567345, 0.4427997, -0.6807546, 0, 0.5450981, 1, 1,
0.1573785, -0.9965678, 2.769568, 0, 0.5372549, 1, 1,
0.1592489, -1.058829, 3.556215, 0, 0.5333334, 1, 1,
0.1597825, 1.230619, 2.343127, 0, 0.5254902, 1, 1,
0.1659875, -1.471081, 2.578478, 0, 0.5215687, 1, 1,
0.1671862, 1.44609, -0.7422417, 0, 0.5137255, 1, 1,
0.1707139, 1.731733, -0.1589577, 0, 0.509804, 1, 1,
0.1747912, 0.465323, 0.7705027, 0, 0.5019608, 1, 1,
0.177823, -0.7051249, 4.11351, 0, 0.4941176, 1, 1,
0.1835712, 1.096788, -0.3702372, 0, 0.4901961, 1, 1,
0.185989, -1.05412, 3.540957, 0, 0.4823529, 1, 1,
0.186181, 1.638226, -1.195333, 0, 0.4784314, 1, 1,
0.1879829, -1.282391, 2.194274, 0, 0.4705882, 1, 1,
0.1885477, 0.1312139, 0.937449, 0, 0.4666667, 1, 1,
0.1897774, 0.2472787, 1.894458, 0, 0.4588235, 1, 1,
0.191431, 0.1910959, 1.50074, 0, 0.454902, 1, 1,
0.1915583, -0.8091986, 4.750881, 0, 0.4470588, 1, 1,
0.1938496, -0.1222926, 3.175325, 0, 0.4431373, 1, 1,
0.1939379, -1.239184, 2.326589, 0, 0.4352941, 1, 1,
0.1951605, 1.227842, 1.417681, 0, 0.4313726, 1, 1,
0.1979214, -1.726496, 2.089272, 0, 0.4235294, 1, 1,
0.1992257, -0.02286605, 2.255465, 0, 0.4196078, 1, 1,
0.2056423, -2.16553, 2.008638, 0, 0.4117647, 1, 1,
0.2090407, -1.993381, 3.294349, 0, 0.4078431, 1, 1,
0.2099945, 1.132521, 0.156657, 0, 0.4, 1, 1,
0.2158234, -0.7234723, 2.107412, 0, 0.3921569, 1, 1,
0.2182392, -1.885149, 2.608191, 0, 0.3882353, 1, 1,
0.2213599, -0.01531541, 0.9651344, 0, 0.3803922, 1, 1,
0.2274121, 0.5211977, 0.6008297, 0, 0.3764706, 1, 1,
0.2314044, 0.3902737, 0.7235517, 0, 0.3686275, 1, 1,
0.2349378, 0.703649, 0.7128171, 0, 0.3647059, 1, 1,
0.2358845, 1.344677, 1.684787, 0, 0.3568628, 1, 1,
0.2378107, -1.1832, 3.216702, 0, 0.3529412, 1, 1,
0.2415173, 1.155831, 0.8775548, 0, 0.345098, 1, 1,
0.2442095, 1.672916, 2.399344, 0, 0.3411765, 1, 1,
0.2450406, 0.6810464, -1.174329, 0, 0.3333333, 1, 1,
0.2496203, -0.04271713, 1.110045, 0, 0.3294118, 1, 1,
0.2549528, 0.07979018, 3.230834, 0, 0.3215686, 1, 1,
0.2549709, 0.8737792, 1.400534, 0, 0.3176471, 1, 1,
0.2557432, 0.6865467, 0.3629772, 0, 0.3098039, 1, 1,
0.2597037, 0.103605, 0.6045609, 0, 0.3058824, 1, 1,
0.2668628, 0.8221381, 1.451959, 0, 0.2980392, 1, 1,
0.2669316, 0.883294, -0.03662737, 0, 0.2901961, 1, 1,
0.2678015, 0.8429852, 1.244786, 0, 0.2862745, 1, 1,
0.2679962, 0.6389926, 0.3298765, 0, 0.2784314, 1, 1,
0.2684507, 1.653805, -1.108373, 0, 0.2745098, 1, 1,
0.2722622, 0.5252185, -0.7355903, 0, 0.2666667, 1, 1,
0.2739902, -0.973879, 2.459203, 0, 0.2627451, 1, 1,
0.2754489, -0.2934862, 3.174776, 0, 0.254902, 1, 1,
0.2762862, -0.923969, 2.951293, 0, 0.2509804, 1, 1,
0.2763745, 0.6453872, -1.307867, 0, 0.2431373, 1, 1,
0.2773613, 0.3042765, 0.9303391, 0, 0.2392157, 1, 1,
0.2787889, -0.1553396, 2.434667, 0, 0.2313726, 1, 1,
0.2792592, 0.2712068, 1.42818, 0, 0.227451, 1, 1,
0.279456, -2.131947, 4.422356, 0, 0.2196078, 1, 1,
0.2869496, 0.7550146, 0.7885811, 0, 0.2156863, 1, 1,
0.2879694, 0.2495154, 0.3532349, 0, 0.2078431, 1, 1,
0.2910401, 0.2725753, 1.494339, 0, 0.2039216, 1, 1,
0.293629, -0.9730905, 2.557995, 0, 0.1960784, 1, 1,
0.2945199, 0.2010143, 0.371701, 0, 0.1882353, 1, 1,
0.2976385, -0.3116791, 2.513725, 0, 0.1843137, 1, 1,
0.3036738, 0.5248617, -1.098392, 0, 0.1764706, 1, 1,
0.3105606, -0.605045, 2.36861, 0, 0.172549, 1, 1,
0.314175, -1.007039, 3.598635, 0, 0.1647059, 1, 1,
0.3146123, -0.239337, 1.29596, 0, 0.1607843, 1, 1,
0.3206866, -0.4627968, 3.413644, 0, 0.1529412, 1, 1,
0.3219991, -0.3198008, 0.1973936, 0, 0.1490196, 1, 1,
0.325789, -1.203331, 2.445705, 0, 0.1411765, 1, 1,
0.328497, 0.4913702, 0.5608563, 0, 0.1372549, 1, 1,
0.3287394, 0.4412341, 2.331702, 0, 0.1294118, 1, 1,
0.3307008, 1.487123, -0.6149098, 0, 0.1254902, 1, 1,
0.3318628, 1.311643, -0.6175566, 0, 0.1176471, 1, 1,
0.33504, 2.300773, -0.184245, 0, 0.1137255, 1, 1,
0.3426431, -0.1376953, 2.159763, 0, 0.1058824, 1, 1,
0.3459972, -0.1052663, 2.880276, 0, 0.09803922, 1, 1,
0.3562613, 0.3543223, -0.001637419, 0, 0.09411765, 1, 1,
0.3569, 1.004056, 0.8565019, 0, 0.08627451, 1, 1,
0.3683174, -0.1929659, 3.244513, 0, 0.08235294, 1, 1,
0.3720709, -0.09392343, 0.4026827, 0, 0.07450981, 1, 1,
0.3730446, -0.5759011, 2.285876, 0, 0.07058824, 1, 1,
0.3732014, 0.2214453, 0.2918577, 0, 0.0627451, 1, 1,
0.3865263, -2.728964, 3.275346, 0, 0.05882353, 1, 1,
0.3888715, -0.5009724, 2.949494, 0, 0.05098039, 1, 1,
0.388997, -0.3673433, 2.20863, 0, 0.04705882, 1, 1,
0.3904286, -0.3473561, 0.1149426, 0, 0.03921569, 1, 1,
0.3912617, -1.155612, 2.739268, 0, 0.03529412, 1, 1,
0.3983792, 0.3736489, 1.599716, 0, 0.02745098, 1, 1,
0.4026254, -1.283967, 2.832469, 0, 0.02352941, 1, 1,
0.4059297, -0.05999476, 1.246309, 0, 0.01568628, 1, 1,
0.4083148, -1.152784, 4.967798, 0, 0.01176471, 1, 1,
0.4087205, 0.1088166, 2.276141, 0, 0.003921569, 1, 1,
0.4122589, -0.5935352, 3.142157, 0.003921569, 0, 1, 1,
0.4129388, 1.236572, 0.3689543, 0.007843138, 0, 1, 1,
0.4134595, 2.281038, 0.7143145, 0.01568628, 0, 1, 1,
0.4179597, -0.4725513, 1.2319, 0.01960784, 0, 1, 1,
0.4182312, -0.7541024, 3.919339, 0.02745098, 0, 1, 1,
0.4192622, 1.184062, 1.649754, 0.03137255, 0, 1, 1,
0.4206537, -2.153642, 1.607451, 0.03921569, 0, 1, 1,
0.4230955, 0.4700048, -0.04698069, 0.04313726, 0, 1, 1,
0.4231619, 2.615954, -0.5998263, 0.05098039, 0, 1, 1,
0.4362678, 0.7739387, 2.496437, 0.05490196, 0, 1, 1,
0.4367734, 0.1068951, 1.940301, 0.0627451, 0, 1, 1,
0.4489057, -1.281478, 3.284919, 0.06666667, 0, 1, 1,
0.4526536, 1.079532, 1.879445, 0.07450981, 0, 1, 1,
0.4569755, 0.595716, 0.76739, 0.07843138, 0, 1, 1,
0.4596294, 0.4084889, 3.634186, 0.08627451, 0, 1, 1,
0.4599974, -1.157962, 2.186075, 0.09019608, 0, 1, 1,
0.460696, -1.977194, 3.654345, 0.09803922, 0, 1, 1,
0.465847, 0.932154, -0.3635054, 0.1058824, 0, 1, 1,
0.4673352, -1.151011, 2.406769, 0.1098039, 0, 1, 1,
0.4784264, -1.172261, 3.999467, 0.1176471, 0, 1, 1,
0.4825447, 1.489461, 0.9798796, 0.1215686, 0, 1, 1,
0.4831192, 0.8411065, 2.023878, 0.1294118, 0, 1, 1,
0.4835043, 0.2369014, 1.124564, 0.1333333, 0, 1, 1,
0.4849275, 0.6040336, 0.6139625, 0.1411765, 0, 1, 1,
0.4866071, -0.05905039, 1.781308, 0.145098, 0, 1, 1,
0.4905753, -1.615534, 2.903795, 0.1529412, 0, 1, 1,
0.4918762, 0.9677054, 0.3596568, 0.1568628, 0, 1, 1,
0.4919163, -0.3971682, 1.591672, 0.1647059, 0, 1, 1,
0.4928712, -2.934133, 3.080424, 0.1686275, 0, 1, 1,
0.4965353, -0.6856241, 1.439913, 0.1764706, 0, 1, 1,
0.498583, 1.972057, -0.05133693, 0.1803922, 0, 1, 1,
0.4991428, 0.2494154, 1.418256, 0.1882353, 0, 1, 1,
0.5017602, 0.4052693, -0.4705378, 0.1921569, 0, 1, 1,
0.5019063, 0.7076622, 1.736197, 0.2, 0, 1, 1,
0.5065958, -1.048679, 3.538527, 0.2078431, 0, 1, 1,
0.5078425, -1.118489, 4.825201, 0.2117647, 0, 1, 1,
0.5160848, -0.4227345, 3.545208, 0.2196078, 0, 1, 1,
0.5162728, 2.72398, 0.9102637, 0.2235294, 0, 1, 1,
0.5198123, 1.030057, 0.7380361, 0.2313726, 0, 1, 1,
0.5232604, 0.6825849, -0.9746953, 0.2352941, 0, 1, 1,
0.5253675, -2.179103, 2.556241, 0.2431373, 0, 1, 1,
0.5270367, 0.09765328, 1.181295, 0.2470588, 0, 1, 1,
0.5270575, 1.436748, 0.8244834, 0.254902, 0, 1, 1,
0.5297084, 0.4265451, -1.196404, 0.2588235, 0, 1, 1,
0.5319805, -1.308908, 2.90287, 0.2666667, 0, 1, 1,
0.534364, -0.1237331, 0.7914053, 0.2705882, 0, 1, 1,
0.5384509, -1.362503, 1.892475, 0.2784314, 0, 1, 1,
0.5406812, 1.032852, -0.8033828, 0.282353, 0, 1, 1,
0.540693, -0.1879171, 2.687991, 0.2901961, 0, 1, 1,
0.5439582, 0.09723612, 0.3139914, 0.2941177, 0, 1, 1,
0.5458575, -2.441958, 1.976291, 0.3019608, 0, 1, 1,
0.5460966, -1.076346, 1.430348, 0.3098039, 0, 1, 1,
0.5495967, 2.202667, -0.8661508, 0.3137255, 0, 1, 1,
0.549683, 0.04453107, 1.26821, 0.3215686, 0, 1, 1,
0.5503629, -1.665789, 2.957807, 0.3254902, 0, 1, 1,
0.5507352, 1.074004, -0.2232606, 0.3333333, 0, 1, 1,
0.5554778, -0.3838175, 4.853601, 0.3372549, 0, 1, 1,
0.5576406, 0.83107, -1.84919, 0.345098, 0, 1, 1,
0.5614137, 0.4419847, 1.582828, 0.3490196, 0, 1, 1,
0.5638366, -1.206648, 2.718121, 0.3568628, 0, 1, 1,
0.5649942, -0.8944411, 1.450206, 0.3607843, 0, 1, 1,
0.5681027, 0.9124917, 0.1251554, 0.3686275, 0, 1, 1,
0.5695677, 0.5028495, 0.874996, 0.372549, 0, 1, 1,
0.5747603, 1.101338, -0.13147, 0.3803922, 0, 1, 1,
0.5801064, -0.1833404, 3.697759, 0.3843137, 0, 1, 1,
0.5807412, 0.5639458, 2.100831, 0.3921569, 0, 1, 1,
0.5820817, -1.365823, 2.664733, 0.3960784, 0, 1, 1,
0.5857939, -0.951627, 1.868509, 0.4039216, 0, 1, 1,
0.5858244, -0.2333373, -0.2598231, 0.4117647, 0, 1, 1,
0.5871189, 0.6324268, 2.22215, 0.4156863, 0, 1, 1,
0.5901612, -1.188873, 2.912162, 0.4235294, 0, 1, 1,
0.5952599, -0.5150947, 1.755352, 0.427451, 0, 1, 1,
0.5977822, -0.6482436, 1.954753, 0.4352941, 0, 1, 1,
0.5996013, 0.3600102, -0.1084209, 0.4392157, 0, 1, 1,
0.6034265, -0.2348664, 1.149633, 0.4470588, 0, 1, 1,
0.6096047, -0.1514216, 2.83164, 0.4509804, 0, 1, 1,
0.6128091, 1.925532, 0.6197675, 0.4588235, 0, 1, 1,
0.6136079, 0.3977199, 0.6835012, 0.4627451, 0, 1, 1,
0.617368, -0.7161592, 5.467964, 0.4705882, 0, 1, 1,
0.6217642, 1.006307, 0.7140121, 0.4745098, 0, 1, 1,
0.6219239, 0.1768181, 1.134989, 0.4823529, 0, 1, 1,
0.6298226, -0.285176, 1.498015, 0.4862745, 0, 1, 1,
0.6308177, 0.3353026, 1.960004, 0.4941176, 0, 1, 1,
0.6321327, -1.881782, 1.721087, 0.5019608, 0, 1, 1,
0.6347892, 0.5508502, 0.9282748, 0.5058824, 0, 1, 1,
0.6384705, -1.263552, 1.864527, 0.5137255, 0, 1, 1,
0.6439125, 1.163691, 0.2972476, 0.5176471, 0, 1, 1,
0.6515097, 0.2590156, 2.983315, 0.5254902, 0, 1, 1,
0.6534423, -0.7232666, 3.125213, 0.5294118, 0, 1, 1,
0.653504, 1.451867, -0.07533359, 0.5372549, 0, 1, 1,
0.6564506, 0.2368024, -0.5044896, 0.5411765, 0, 1, 1,
0.656543, 1.584952, 0.9186625, 0.5490196, 0, 1, 1,
0.6604031, 1.648478, -0.2535454, 0.5529412, 0, 1, 1,
0.6638425, -1.008788, 2.51253, 0.5607843, 0, 1, 1,
0.6681566, 0.4981722, 1.17929, 0.5647059, 0, 1, 1,
0.6714384, 0.7705501, 1.386641, 0.572549, 0, 1, 1,
0.6782429, -0.4928356, 3.486138, 0.5764706, 0, 1, 1,
0.6802456, 0.4088639, 2.0915, 0.5843138, 0, 1, 1,
0.6819309, 1.494778, -0.5277276, 0.5882353, 0, 1, 1,
0.6886017, 1.341638, 1.919999, 0.5960785, 0, 1, 1,
0.6906602, 0.6027873, 0.003427638, 0.6039216, 0, 1, 1,
0.6921738, -0.7313167, 1.756187, 0.6078432, 0, 1, 1,
0.69473, -1.739604, 4.795331, 0.6156863, 0, 1, 1,
0.6961092, -0.1076709, 1.940861, 0.6196079, 0, 1, 1,
0.696545, 0.419917, -0.1743322, 0.627451, 0, 1, 1,
0.6991538, -0.4550318, 1.37819, 0.6313726, 0, 1, 1,
0.7027961, -0.6383703, 4.322832, 0.6392157, 0, 1, 1,
0.7031334, -0.3211835, 1.435795, 0.6431373, 0, 1, 1,
0.7050762, 0.9440414, 1.675246, 0.6509804, 0, 1, 1,
0.7099764, -0.7140802, 0.9650555, 0.654902, 0, 1, 1,
0.7137797, -0.2475989, 2.190757, 0.6627451, 0, 1, 1,
0.7154524, -1.496939, 3.312937, 0.6666667, 0, 1, 1,
0.7189771, 0.3832931, 0.4005108, 0.6745098, 0, 1, 1,
0.7192337, 1.253114, -0.884104, 0.6784314, 0, 1, 1,
0.721058, -0.6907182, 2.003804, 0.6862745, 0, 1, 1,
0.7284172, 0.06412652, 0.8524217, 0.6901961, 0, 1, 1,
0.732115, 0.04302508, 1.884968, 0.6980392, 0, 1, 1,
0.7382097, -0.2796622, 3.122213, 0.7058824, 0, 1, 1,
0.7425679, -2.303939, 2.129106, 0.7098039, 0, 1, 1,
0.747533, -2.738535, 2.469938, 0.7176471, 0, 1, 1,
0.7481309, -0.03689652, 1.394308, 0.7215686, 0, 1, 1,
0.7482756, -0.147892, 0.5952873, 0.7294118, 0, 1, 1,
0.748586, -0.9431532, 1.875831, 0.7333333, 0, 1, 1,
0.7533838, -0.333819, 1.362962, 0.7411765, 0, 1, 1,
0.756514, -0.002701169, 1.002628, 0.7450981, 0, 1, 1,
0.7612442, 0.9972297, -1.269249, 0.7529412, 0, 1, 1,
0.7623828, -0.6912583, 2.117174, 0.7568628, 0, 1, 1,
0.7644516, -0.4678645, 1.617336, 0.7647059, 0, 1, 1,
0.7689794, 0.8590504, 0.9217544, 0.7686275, 0, 1, 1,
0.7692846, -0.04197241, 1.380523, 0.7764706, 0, 1, 1,
0.7739367, 1.028756, -0.003312981, 0.7803922, 0, 1, 1,
0.7797779, 0.3122702, 2.608494, 0.7882353, 0, 1, 1,
0.7798199, 1.44961, -1.620161, 0.7921569, 0, 1, 1,
0.7824528, 0.03540964, 2.60693, 0.8, 0, 1, 1,
0.7869151, -1.580344, 0.6002836, 0.8078431, 0, 1, 1,
0.789267, 0.7461575, -0.618037, 0.8117647, 0, 1, 1,
0.7909536, -1.267043, 0.7145709, 0.8196079, 0, 1, 1,
0.7954674, -0.6917375, 1.65892, 0.8235294, 0, 1, 1,
0.7982107, -2.746401, 3.457855, 0.8313726, 0, 1, 1,
0.8015308, -0.703052, 1.020823, 0.8352941, 0, 1, 1,
0.8020863, -0.1293967, 2.362937, 0.8431373, 0, 1, 1,
0.8049234, 2.368834, 0.2860944, 0.8470588, 0, 1, 1,
0.8108681, -0.5777212, 1.981012, 0.854902, 0, 1, 1,
0.8119105, -0.6362795, -0.1696733, 0.8588235, 0, 1, 1,
0.8149893, 0.5601436, 2.114028, 0.8666667, 0, 1, 1,
0.8233874, 0.004254691, -0.6942595, 0.8705882, 0, 1, 1,
0.8248779, -2.962507, 3.289304, 0.8784314, 0, 1, 1,
0.8274508, -0.3704751, 0.82674, 0.8823529, 0, 1, 1,
0.827763, 1.206682, 1.854306, 0.8901961, 0, 1, 1,
0.8322387, -0.847871, 2.188747, 0.8941177, 0, 1, 1,
0.8360755, 0.4923058, 2.217935, 0.9019608, 0, 1, 1,
0.8434479, 1.916306, -1.521482, 0.9098039, 0, 1, 1,
0.8440059, -0.2365788, 1.888178, 0.9137255, 0, 1, 1,
0.8453683, -1.611156, 2.70422, 0.9215686, 0, 1, 1,
0.8453817, 0.3531096, 0.08252481, 0.9254902, 0, 1, 1,
0.8515656, -1.531566, 5.278596, 0.9333333, 0, 1, 1,
0.8542143, -0.01047424, 0.6409687, 0.9372549, 0, 1, 1,
0.8585878, 1.242386, 1.589396, 0.945098, 0, 1, 1,
0.8595802, -0.4402224, 0.9935117, 0.9490196, 0, 1, 1,
0.8629109, -0.9561208, 2.763701, 0.9568627, 0, 1, 1,
0.8631887, -0.6397774, 0.8006592, 0.9607843, 0, 1, 1,
0.8665321, 0.007924531, 1.388518, 0.9686275, 0, 1, 1,
0.867759, 0.9032044, 1.797469, 0.972549, 0, 1, 1,
0.867999, 0.6220201, 2.055068, 0.9803922, 0, 1, 1,
0.8680522, 1.118329, 1.25679, 0.9843137, 0, 1, 1,
0.8737594, -0.4045474, 3.438362, 0.9921569, 0, 1, 1,
0.8795075, -0.61862, 1.175427, 0.9960784, 0, 1, 1,
0.8799174, -0.5647359, 3.286551, 1, 0, 0.9960784, 1,
0.8956117, -0.5470404, 1.431709, 1, 0, 0.9882353, 1,
0.8981317, -0.00130833, 1.583272, 1, 0, 0.9843137, 1,
0.9036073, 0.769848, 1.901184, 1, 0, 0.9764706, 1,
0.9044483, 0.911708, 0.5870281, 1, 0, 0.972549, 1,
0.9080251, 0.5260593, 0.3870301, 1, 0, 0.9647059, 1,
0.9155935, -1.747388, 1.701545, 1, 0, 0.9607843, 1,
0.9341038, 0.0347026, 0.4781204, 1, 0, 0.9529412, 1,
0.9356153, 0.4881373, 0.8442695, 1, 0, 0.9490196, 1,
0.94587, -0.28153, 2.572598, 1, 0, 0.9411765, 1,
0.9478637, -0.5296616, 2.284083, 1, 0, 0.9372549, 1,
0.9564619, -0.6091177, 3.312075, 1, 0, 0.9294118, 1,
0.9590294, -0.9522192, 4.438604, 1, 0, 0.9254902, 1,
0.9625542, 1.443612, 1.313152, 1, 0, 0.9176471, 1,
0.9734955, 0.07795032, 0.7502992, 1, 0, 0.9137255, 1,
0.9774756, -1.337305, 3.328478, 1, 0, 0.9058824, 1,
0.9833677, 1.020061, 0.6214014, 1, 0, 0.9019608, 1,
0.984087, 1.114946, 2.396573, 1, 0, 0.8941177, 1,
0.987956, -2.464895, 3.568476, 1, 0, 0.8862745, 1,
0.9941623, 1.50007, 1.295481, 1, 0, 0.8823529, 1,
0.9985496, -0.9156234, 3.31028, 1, 0, 0.8745098, 1,
1.003348, -1.839704, 3.141237, 1, 0, 0.8705882, 1,
1.006467, -0.1568099, 3.676348, 1, 0, 0.8627451, 1,
1.008999, -3.017601, 1.875628, 1, 0, 0.8588235, 1,
1.010478, -0.9660583, 1.594082, 1, 0, 0.8509804, 1,
1.012678, -1.216396, 0.9206397, 1, 0, 0.8470588, 1,
1.012711, 0.4939764, 4.466278, 1, 0, 0.8392157, 1,
1.015267, -0.5123912, 1.222702, 1, 0, 0.8352941, 1,
1.016451, 0.01824159, 1.475614, 1, 0, 0.827451, 1,
1.016842, -0.2145287, 3.110642, 1, 0, 0.8235294, 1,
1.024431, 1.774066, 2.035782, 1, 0, 0.8156863, 1,
1.030342, 0.8755618, 2.267405, 1, 0, 0.8117647, 1,
1.03093, -0.531624, 3.822539, 1, 0, 0.8039216, 1,
1.035589, 0.5730138, 0.7146686, 1, 0, 0.7960784, 1,
1.038242, 0.6513872, 2.006727, 1, 0, 0.7921569, 1,
1.043757, 0.5774428, -1.427294, 1, 0, 0.7843137, 1,
1.051752, 0.03722139, 2.126448, 1, 0, 0.7803922, 1,
1.067442, -0.3395945, 2.367989, 1, 0, 0.772549, 1,
1.06943, -0.1055734, 4.060115, 1, 0, 0.7686275, 1,
1.071118, 0.7103151, 0.6757053, 1, 0, 0.7607843, 1,
1.077224, 0.4066707, -0.1815507, 1, 0, 0.7568628, 1,
1.084255, 0.06445409, 2.494745, 1, 0, 0.7490196, 1,
1.091308, -1.350002, 3.006101, 1, 0, 0.7450981, 1,
1.093802, 0.08226066, 1.065327, 1, 0, 0.7372549, 1,
1.102689, -1.342668, 2.733536, 1, 0, 0.7333333, 1,
1.103579, -0.1625347, 0.2624348, 1, 0, 0.7254902, 1,
1.12274, -0.9493638, 4.955924, 1, 0, 0.7215686, 1,
1.123742, 0.07563128, 2.220648, 1, 0, 0.7137255, 1,
1.125537, 0.583059, 1.141807, 1, 0, 0.7098039, 1,
1.126812, -0.7989957, 2.677743, 1, 0, 0.7019608, 1,
1.13096, -0.5157902, 0.8835694, 1, 0, 0.6941177, 1,
1.138007, -0.7088542, 2.685885, 1, 0, 0.6901961, 1,
1.139867, -1.924973, 2.829751, 1, 0, 0.682353, 1,
1.143272, 0.4567217, -0.06469455, 1, 0, 0.6784314, 1,
1.147624, -0.2757848, 1.298878, 1, 0, 0.6705883, 1,
1.150169, 0.1557159, 0.6142488, 1, 0, 0.6666667, 1,
1.165572, 0.6115003, 2.449041, 1, 0, 0.6588235, 1,
1.173564, -2.082125, 1.806715, 1, 0, 0.654902, 1,
1.174054, 0.4331053, 1.568715, 1, 0, 0.6470588, 1,
1.178589, 1.194416, 2.483704, 1, 0, 0.6431373, 1,
1.182503, 0.4230461, 1.130745, 1, 0, 0.6352941, 1,
1.186033, -0.3670679, 1.998129, 1, 0, 0.6313726, 1,
1.195, 2.151029, 1.067838, 1, 0, 0.6235294, 1,
1.199091, 0.4875505, 0.5022566, 1, 0, 0.6196079, 1,
1.19978, -0.06373183, 1.181793, 1, 0, 0.6117647, 1,
1.202144, -0.4240613, 1.861924, 1, 0, 0.6078432, 1,
1.20929, 0.4041701, 2.377701, 1, 0, 0.6, 1,
1.210304, 0.7256703, -0.6311873, 1, 0, 0.5921569, 1,
1.217295, -0.1761696, 2.588133, 1, 0, 0.5882353, 1,
1.232467, -1.9461, 2.572278, 1, 0, 0.5803922, 1,
1.237632, -0.4950714, 1.368687, 1, 0, 0.5764706, 1,
1.251989, 0.6964715, 1.541988, 1, 0, 0.5686275, 1,
1.263789, 0.591108, 1.592179, 1, 0, 0.5647059, 1,
1.264591, 2.136975, 0.1390829, 1, 0, 0.5568628, 1,
1.264771, 1.001321, 0.1513671, 1, 0, 0.5529412, 1,
1.265914, -0.02607048, 1.15314, 1, 0, 0.5450981, 1,
1.288148, -0.2994552, 1.69735, 1, 0, 0.5411765, 1,
1.288493, 0.4811219, 1.14697, 1, 0, 0.5333334, 1,
1.28961, 1.682247, 1.118734, 1, 0, 0.5294118, 1,
1.290433, 0.05588346, 3.803165, 1, 0, 0.5215687, 1,
1.319017, 0.1026977, 1.190829, 1, 0, 0.5176471, 1,
1.320381, -1.281934, 1.26109, 1, 0, 0.509804, 1,
1.325908, -0.1333979, 2.388592, 1, 0, 0.5058824, 1,
1.352802, 0.980783, 0.431916, 1, 0, 0.4980392, 1,
1.357713, 1.016896, -1.712018, 1, 0, 0.4901961, 1,
1.359134, 1.338174, 2.438063, 1, 0, 0.4862745, 1,
1.362697, -1.018583, 2.993713, 1, 0, 0.4784314, 1,
1.366268, 0.4815198, 0.659223, 1, 0, 0.4745098, 1,
1.383956, -2.009903, 1.599301, 1, 0, 0.4666667, 1,
1.386633, 2.085436, 1.141123, 1, 0, 0.4627451, 1,
1.388419, -0.4589912, 2.386386, 1, 0, 0.454902, 1,
1.389002, 1.04635, -0.1308488, 1, 0, 0.4509804, 1,
1.389487, -0.2184804, 1.152058, 1, 0, 0.4431373, 1,
1.389771, -0.8387371, 1.384797, 1, 0, 0.4392157, 1,
1.395351, 0.3207707, 0.7847714, 1, 0, 0.4313726, 1,
1.400494, 1.281097, 0.2627001, 1, 0, 0.427451, 1,
1.40099, 1.286515, 0.8663531, 1, 0, 0.4196078, 1,
1.418655, -0.7766272, 3.739266, 1, 0, 0.4156863, 1,
1.420261, -1.957718, 2.690408, 1, 0, 0.4078431, 1,
1.432863, -1.262891, 1.002024, 1, 0, 0.4039216, 1,
1.444387, -0.1613837, 2.123155, 1, 0, 0.3960784, 1,
1.444728, 1.111156, 0.3759844, 1, 0, 0.3882353, 1,
1.44808, -2.579806, 3.009616, 1, 0, 0.3843137, 1,
1.467922, 0.5392755, 2.394674, 1, 0, 0.3764706, 1,
1.470004, -0.6194145, 2.502073, 1, 0, 0.372549, 1,
1.478611, 0.8503258, 1.443907, 1, 0, 0.3647059, 1,
1.481416, 1.485763, -1.063404, 1, 0, 0.3607843, 1,
1.491459, 0.0522813, -0.4626504, 1, 0, 0.3529412, 1,
1.497598, 0.8179543, 0.2334035, 1, 0, 0.3490196, 1,
1.520789, 0.5045852, 2.056447, 1, 0, 0.3411765, 1,
1.549739, 1.69661, 1.585359, 1, 0, 0.3372549, 1,
1.55103, -0.1418342, 3.10742, 1, 0, 0.3294118, 1,
1.566066, -0.3433117, 1.755236, 1, 0, 0.3254902, 1,
1.567038, 0.7687818, 3.115068, 1, 0, 0.3176471, 1,
1.568024, -0.6243037, 1.825981, 1, 0, 0.3137255, 1,
1.568883, -0.7521294, 0.8178427, 1, 0, 0.3058824, 1,
1.569325, -0.5203395, 2.414439, 1, 0, 0.2980392, 1,
1.57363, -0.6283603, 2.171595, 1, 0, 0.2941177, 1,
1.589262, 0.03641843, -0.1290562, 1, 0, 0.2862745, 1,
1.59724, 2.361536, 0.4666483, 1, 0, 0.282353, 1,
1.598125, -1.160333, 1.562145, 1, 0, 0.2745098, 1,
1.60032, -1.039998, 1.315715, 1, 0, 0.2705882, 1,
1.603781, -0.4610165, 1.249576, 1, 0, 0.2627451, 1,
1.604552, 1.000211, 0.07733929, 1, 0, 0.2588235, 1,
1.611891, -0.7381386, 1.717103, 1, 0, 0.2509804, 1,
1.62369, 0.3120371, 2.305651, 1, 0, 0.2470588, 1,
1.638678, 0.7995369, -0.62074, 1, 0, 0.2392157, 1,
1.650747, 0.7343093, -0.2500381, 1, 0, 0.2352941, 1,
1.659819, -1.615299, 3.352638, 1, 0, 0.227451, 1,
1.664006, 1.108776, 1.777673, 1, 0, 0.2235294, 1,
1.689126, 0.6324349, 1.420208, 1, 0, 0.2156863, 1,
1.694827, -0.3758481, 2.826282, 1, 0, 0.2117647, 1,
1.725663, -1.235754, 0.7107869, 1, 0, 0.2039216, 1,
1.728204, 1.161889, 0.5578918, 1, 0, 0.1960784, 1,
1.744875, -1.848045, 1.635234, 1, 0, 0.1921569, 1,
1.749544, 0.3314725, 0.418733, 1, 0, 0.1843137, 1,
1.758802, 0.925106, 1.141024, 1, 0, 0.1803922, 1,
1.768711, -2.232034, 1.377393, 1, 0, 0.172549, 1,
1.774905, -0.2061333, 1.107578, 1, 0, 0.1686275, 1,
1.781493, -1.903559, 2.46963, 1, 0, 0.1607843, 1,
1.789249, 0.1786401, 1.931874, 1, 0, 0.1568628, 1,
1.812529, 0.3951286, 1.038352, 1, 0, 0.1490196, 1,
1.815419, -0.3078445, 2.162115, 1, 0, 0.145098, 1,
1.824936, 2.61411, -0.1094589, 1, 0, 0.1372549, 1,
1.826985, -1.377433, 2.558754, 1, 0, 0.1333333, 1,
1.837823, -0.4001403, -0.6581749, 1, 0, 0.1254902, 1,
1.839815, -1.047882, 1.183888, 1, 0, 0.1215686, 1,
1.864051, -0.722882, 2.488273, 1, 0, 0.1137255, 1,
1.869261, 0.5000169, 0.1982866, 1, 0, 0.1098039, 1,
1.901336, 0.9785026, 0.4946046, 1, 0, 0.1019608, 1,
1.92255, -0.867223, 1.676806, 1, 0, 0.09411765, 1,
1.935276, -0.4572085, 4.106997, 1, 0, 0.09019608, 1,
1.959605, 0.5204412, 0.3672164, 1, 0, 0.08235294, 1,
2.037401, 0.4460648, 1.324733, 1, 0, 0.07843138, 1,
2.062533, -0.534425, 1.754189, 1, 0, 0.07058824, 1,
2.151276, -0.2714432, 2.727013, 1, 0, 0.06666667, 1,
2.157962, -0.2825517, 1.498477, 1, 0, 0.05882353, 1,
2.165846, -0.1820156, 2.804781, 1, 0, 0.05490196, 1,
2.21055, -0.2193517, 0.01638, 1, 0, 0.04705882, 1,
2.220857, 0.8231272, 3.168802, 1, 0, 0.04313726, 1,
2.395567, 0.5922449, 1.312228, 1, 0, 0.03529412, 1,
2.51492, 0.6998603, 2.157606, 1, 0, 0.03137255, 1,
2.680561, 0.3703482, -0.2645865, 1, 0, 0.02352941, 1,
2.849684, -0.1531965, 2.837702, 1, 0, 0.01960784, 1,
2.90413, 0.406198, 0.9895788, 1, 0, 0.01176471, 1,
2.93546, 0.6910233, 0.8512001, 1, 0, 0.007843138, 1
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
0.06499648, -4.418245, -7.686858, 0, -0.5, 0.5, 0.5,
0.06499648, -4.418245, -7.686858, 1, -0.5, 0.5, 0.5,
0.06499648, -4.418245, -7.686858, 1, 1.5, 0.5, 0.5,
0.06499648, -4.418245, -7.686858, 0, 1.5, 0.5, 0.5
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
-3.778555, -0.2561744, -7.686858, 0, -0.5, 0.5, 0.5,
-3.778555, -0.2561744, -7.686858, 1, -0.5, 0.5, 0.5,
-3.778555, -0.2561744, -7.686858, 1, 1.5, 0.5, 0.5,
-3.778555, -0.2561744, -7.686858, 0, 1.5, 0.5, 0.5
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
-3.778555, -4.418245, -0.1561582, 0, -0.5, 0.5, 0.5,
-3.778555, -4.418245, -0.1561582, 1, -0.5, 0.5, 0.5,
-3.778555, -4.418245, -0.1561582, 1, 1.5, 0.5, 0.5,
-3.778555, -4.418245, -0.1561582, 0, 1.5, 0.5, 0.5
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
-2, -3.457767, -5.949004,
2, -3.457767, -5.949004,
-2, -3.457767, -5.949004,
-2, -3.617847, -6.238647,
-1, -3.457767, -5.949004,
-1, -3.617847, -6.238647,
0, -3.457767, -5.949004,
0, -3.617847, -6.238647,
1, -3.457767, -5.949004,
1, -3.617847, -6.238647,
2, -3.457767, -5.949004,
2, -3.617847, -6.238647
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
-2, -3.938006, -6.817931, 0, -0.5, 0.5, 0.5,
-2, -3.938006, -6.817931, 1, -0.5, 0.5, 0.5,
-2, -3.938006, -6.817931, 1, 1.5, 0.5, 0.5,
-2, -3.938006, -6.817931, 0, 1.5, 0.5, 0.5,
-1, -3.938006, -6.817931, 0, -0.5, 0.5, 0.5,
-1, -3.938006, -6.817931, 1, -0.5, 0.5, 0.5,
-1, -3.938006, -6.817931, 1, 1.5, 0.5, 0.5,
-1, -3.938006, -6.817931, 0, 1.5, 0.5, 0.5,
0, -3.938006, -6.817931, 0, -0.5, 0.5, 0.5,
0, -3.938006, -6.817931, 1, -0.5, 0.5, 0.5,
0, -3.938006, -6.817931, 1, 1.5, 0.5, 0.5,
0, -3.938006, -6.817931, 0, 1.5, 0.5, 0.5,
1, -3.938006, -6.817931, 0, -0.5, 0.5, 0.5,
1, -3.938006, -6.817931, 1, -0.5, 0.5, 0.5,
1, -3.938006, -6.817931, 1, 1.5, 0.5, 0.5,
1, -3.938006, -6.817931, 0, 1.5, 0.5, 0.5,
2, -3.938006, -6.817931, 0, -0.5, 0.5, 0.5,
2, -3.938006, -6.817931, 1, -0.5, 0.5, 0.5,
2, -3.938006, -6.817931, 1, 1.5, 0.5, 0.5,
2, -3.938006, -6.817931, 0, 1.5, 0.5, 0.5
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
-2.891581, -3, -5.949004,
-2.891581, 2, -5.949004,
-2.891581, -3, -5.949004,
-3.03941, -3, -6.238647,
-2.891581, -2, -5.949004,
-3.03941, -2, -6.238647,
-2.891581, -1, -5.949004,
-3.03941, -1, -6.238647,
-2.891581, 0, -5.949004,
-3.03941, 0, -6.238647,
-2.891581, 1, -5.949004,
-3.03941, 1, -6.238647,
-2.891581, 2, -5.949004,
-3.03941, 2, -6.238647
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
-3.335068, -3, -6.817931, 0, -0.5, 0.5, 0.5,
-3.335068, -3, -6.817931, 1, -0.5, 0.5, 0.5,
-3.335068, -3, -6.817931, 1, 1.5, 0.5, 0.5,
-3.335068, -3, -6.817931, 0, 1.5, 0.5, 0.5,
-3.335068, -2, -6.817931, 0, -0.5, 0.5, 0.5,
-3.335068, -2, -6.817931, 1, -0.5, 0.5, 0.5,
-3.335068, -2, -6.817931, 1, 1.5, 0.5, 0.5,
-3.335068, -2, -6.817931, 0, 1.5, 0.5, 0.5,
-3.335068, -1, -6.817931, 0, -0.5, 0.5, 0.5,
-3.335068, -1, -6.817931, 1, -0.5, 0.5, 0.5,
-3.335068, -1, -6.817931, 1, 1.5, 0.5, 0.5,
-3.335068, -1, -6.817931, 0, 1.5, 0.5, 0.5,
-3.335068, 0, -6.817931, 0, -0.5, 0.5, 0.5,
-3.335068, 0, -6.817931, 1, -0.5, 0.5, 0.5,
-3.335068, 0, -6.817931, 1, 1.5, 0.5, 0.5,
-3.335068, 0, -6.817931, 0, 1.5, 0.5, 0.5,
-3.335068, 1, -6.817931, 0, -0.5, 0.5, 0.5,
-3.335068, 1, -6.817931, 1, -0.5, 0.5, 0.5,
-3.335068, 1, -6.817931, 1, 1.5, 0.5, 0.5,
-3.335068, 1, -6.817931, 0, 1.5, 0.5, 0.5,
-3.335068, 2, -6.817931, 0, -0.5, 0.5, 0.5,
-3.335068, 2, -6.817931, 1, -0.5, 0.5, 0.5,
-3.335068, 2, -6.817931, 1, 1.5, 0.5, 0.5,
-3.335068, 2, -6.817931, 0, 1.5, 0.5, 0.5
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
-2.891581, -3.457767, -4,
-2.891581, -3.457767, 4,
-2.891581, -3.457767, -4,
-3.03941, -3.617847, -4,
-2.891581, -3.457767, -2,
-3.03941, -3.617847, -2,
-2.891581, -3.457767, 0,
-3.03941, -3.617847, 0,
-2.891581, -3.457767, 2,
-3.03941, -3.617847, 2,
-2.891581, -3.457767, 4,
-3.03941, -3.617847, 4
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
-3.335068, -3.938006, -4, 0, -0.5, 0.5, 0.5,
-3.335068, -3.938006, -4, 1, -0.5, 0.5, 0.5,
-3.335068, -3.938006, -4, 1, 1.5, 0.5, 0.5,
-3.335068, -3.938006, -4, 0, 1.5, 0.5, 0.5,
-3.335068, -3.938006, -2, 0, -0.5, 0.5, 0.5,
-3.335068, -3.938006, -2, 1, -0.5, 0.5, 0.5,
-3.335068, -3.938006, -2, 1, 1.5, 0.5, 0.5,
-3.335068, -3.938006, -2, 0, 1.5, 0.5, 0.5,
-3.335068, -3.938006, 0, 0, -0.5, 0.5, 0.5,
-3.335068, -3.938006, 0, 1, -0.5, 0.5, 0.5,
-3.335068, -3.938006, 0, 1, 1.5, 0.5, 0.5,
-3.335068, -3.938006, 0, 0, 1.5, 0.5, 0.5,
-3.335068, -3.938006, 2, 0, -0.5, 0.5, 0.5,
-3.335068, -3.938006, 2, 1, -0.5, 0.5, 0.5,
-3.335068, -3.938006, 2, 1, 1.5, 0.5, 0.5,
-3.335068, -3.938006, 2, 0, 1.5, 0.5, 0.5,
-3.335068, -3.938006, 4, 0, -0.5, 0.5, 0.5,
-3.335068, -3.938006, 4, 1, -0.5, 0.5, 0.5,
-3.335068, -3.938006, 4, 1, 1.5, 0.5, 0.5,
-3.335068, -3.938006, 4, 0, 1.5, 0.5, 0.5
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
-2.891581, -3.457767, -5.949004,
-2.891581, 2.945419, -5.949004,
-2.891581, -3.457767, 5.636688,
-2.891581, 2.945419, 5.636688,
-2.891581, -3.457767, -5.949004,
-2.891581, -3.457767, 5.636688,
-2.891581, 2.945419, -5.949004,
-2.891581, 2.945419, 5.636688,
-2.891581, -3.457767, -5.949004,
3.021574, -3.457767, -5.949004,
-2.891581, -3.457767, 5.636688,
3.021574, -3.457767, 5.636688,
-2.891581, 2.945419, -5.949004,
3.021574, 2.945419, -5.949004,
-2.891581, 2.945419, 5.636688,
3.021574, 2.945419, 5.636688,
3.021574, -3.457767, -5.949004,
3.021574, 2.945419, -5.949004,
3.021574, -3.457767, 5.636688,
3.021574, 2.945419, 5.636688,
3.021574, -3.457767, -5.949004,
3.021574, -3.457767, 5.636688,
3.021574, 2.945419, -5.949004,
3.021574, 2.945419, 5.636688
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
var radius = 7.741696;
var distance = 34.44368;
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
mvMatrix.translate( -0.06499648, 0.2561744, 0.1561582 );
mvMatrix.scale( 1.415568, 1.307236, 0.7224836 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.44368);
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
copper_carbonate_cop<-read.table("copper_carbonate_cop.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-copper_carbonate_cop$V2
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate_cop' not found
```

```r
y<-copper_carbonate_cop$V3
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate_cop' not found
```

```r
z<-copper_carbonate_cop$V4
```

```
## Error in eval(expr, envir, enclos): object 'copper_carbonate_cop' not found
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
-2.805467, 0.008566212, -1.393046, 0, 0, 1, 1, 1,
-2.753884, 1.259549, -1.773384, 1, 0, 0, 1, 1,
-2.697266, 1.656332, -0.4539922, 1, 0, 0, 1, 1,
-2.688998, 0.4137268, -1.054814, 1, 0, 0, 1, 1,
-2.658059, 2.045176, 0.6251534, 1, 0, 0, 1, 1,
-2.578382, -2.579801, -2.764693, 1, 0, 0, 1, 1,
-2.545917, 0.6184275, -1.184168, 0, 0, 0, 1, 1,
-2.457751, 0.05826182, -3.207305, 0, 0, 0, 1, 1,
-2.34216, 0.6968294, -0.5930853, 0, 0, 0, 1, 1,
-2.318989, -1.948689, -3.989774, 0, 0, 0, 1, 1,
-2.275281, -0.3947216, -1.627898, 0, 0, 0, 1, 1,
-2.270019, -0.9910829, -1.466525, 0, 0, 0, 1, 1,
-2.232145, 0.3803759, -1.508152, 0, 0, 0, 1, 1,
-2.22927, 0.5570133, -2.22657, 1, 1, 1, 1, 1,
-2.219761, -1.708026, -3.138478, 1, 1, 1, 1, 1,
-2.213847, -0.06357824, -0.5626373, 1, 1, 1, 1, 1,
-2.191813, -0.2081208, -2.641436, 1, 1, 1, 1, 1,
-2.139955, 0.3649715, -0.5358534, 1, 1, 1, 1, 1,
-2.137918, -1.464359, -1.302074, 1, 1, 1, 1, 1,
-2.132242, -0.01839952, -0.4598698, 1, 1, 1, 1, 1,
-2.096438, -0.2573664, -1.641919, 1, 1, 1, 1, 1,
-2.022859, 0.9658975, 1.121142, 1, 1, 1, 1, 1,
-2.004546, -0.1154043, -2.289115, 1, 1, 1, 1, 1,
-1.973765, 0.34848, -1.544424, 1, 1, 1, 1, 1,
-1.969555, -2.026744, -2.209735, 1, 1, 1, 1, 1,
-1.966903, 1.550074, -1.705081, 1, 1, 1, 1, 1,
-1.962198, 0.5244679, -2.73982, 1, 1, 1, 1, 1,
-1.939285, -0.2038345, -1.13922, 1, 1, 1, 1, 1,
-1.933618, 0.5055344, -1.038234, 0, 0, 1, 1, 1,
-1.932807, -0.9632985, -1.836791, 1, 0, 0, 1, 1,
-1.920084, 0.482128, -1.910007, 1, 0, 0, 1, 1,
-1.911269, -0.08330288, -0.3516855, 1, 0, 0, 1, 1,
-1.909942, -0.7421042, -1.451977, 1, 0, 0, 1, 1,
-1.904539, 0.7952048, -1.845727, 1, 0, 0, 1, 1,
-1.897052, 2.031545, -1.178504, 0, 0, 0, 1, 1,
-1.882937, 0.5772145, -1.676484, 0, 0, 0, 1, 1,
-1.879241, 0.8102016, 0.211879, 0, 0, 0, 1, 1,
-1.853878, -1.650365, -1.497031, 0, 0, 0, 1, 1,
-1.846169, 0.3680277, -2.840871, 0, 0, 0, 1, 1,
-1.841962, 2.428596, 0.7937697, 0, 0, 0, 1, 1,
-1.833994, -0.5978257, -2.649997, 0, 0, 0, 1, 1,
-1.832913, 0.9838381, -1.695905, 1, 1, 1, 1, 1,
-1.827554, -0.9985351, -3.461481, 1, 1, 1, 1, 1,
-1.814932, -0.2060815, -1.57794, 1, 1, 1, 1, 1,
-1.814917, -1.193592, -4.46789, 1, 1, 1, 1, 1,
-1.812303, 0.4894016, -0.8048286, 1, 1, 1, 1, 1,
-1.804481, -0.01604291, -1.050342, 1, 1, 1, 1, 1,
-1.801092, -1.400378, -2.914244, 1, 1, 1, 1, 1,
-1.786577, -0.3503325, -1.120082, 1, 1, 1, 1, 1,
-1.767563, 0.9906762, -0.02533143, 1, 1, 1, 1, 1,
-1.764132, -0.8764734, -1.357277, 1, 1, 1, 1, 1,
-1.762286, 0.2590448, -0.9559708, 1, 1, 1, 1, 1,
-1.756594, 0.5769659, -1.263554, 1, 1, 1, 1, 1,
-1.732392, 2.432062, -0.6916709, 1, 1, 1, 1, 1,
-1.727999, 2.462103, -0.9245519, 1, 1, 1, 1, 1,
-1.716202, -0.9984236, -0.9344063, 1, 1, 1, 1, 1,
-1.712308, -0.5562424, -2.191503, 0, 0, 1, 1, 1,
-1.706484, 0.432992, -1.915348, 1, 0, 0, 1, 1,
-1.703896, -0.5460954, -2.133072, 1, 0, 0, 1, 1,
-1.690579, 1.307821, -0.1371546, 1, 0, 0, 1, 1,
-1.684362, -1.47555, -1.159056, 1, 0, 0, 1, 1,
-1.677464, 2.207632, 0.8357477, 1, 0, 0, 1, 1,
-1.670089, 0.09892846, -2.15783, 0, 0, 0, 1, 1,
-1.667883, 0.5118816, -1.792684, 0, 0, 0, 1, 1,
-1.656285, -0.3953094, -1.218923, 0, 0, 0, 1, 1,
-1.625391, -0.391852, -1.361975, 0, 0, 0, 1, 1,
-1.613789, 1.446254, -0.9115242, 0, 0, 0, 1, 1,
-1.596578, -0.3501064, -2.505039, 0, 0, 0, 1, 1,
-1.588631, 0.7596154, -0.9115276, 0, 0, 0, 1, 1,
-1.578984, 1.584347, -0.9112943, 1, 1, 1, 1, 1,
-1.556707, -0.4165919, -2.198983, 1, 1, 1, 1, 1,
-1.553712, 0.1416247, -2.413653, 1, 1, 1, 1, 1,
-1.553284, 0.4214964, -1.744913, 1, 1, 1, 1, 1,
-1.546952, -0.08391595, -1.591786, 1, 1, 1, 1, 1,
-1.541386, -0.2071578, -1.630536, 1, 1, 1, 1, 1,
-1.540424, 1.074242, -0.6669496, 1, 1, 1, 1, 1,
-1.523776, -1.1892, -4.367851, 1, 1, 1, 1, 1,
-1.512295, 0.4087017, -0.9351097, 1, 1, 1, 1, 1,
-1.507268, -1.762339, -2.028323, 1, 1, 1, 1, 1,
-1.506752, -0.6084563, -2.273279, 1, 1, 1, 1, 1,
-1.504143, -0.7029176, -0.8867075, 1, 1, 1, 1, 1,
-1.503709, -1.877524, -1.954124, 1, 1, 1, 1, 1,
-1.47123, 0.05600803, -0.3477981, 1, 1, 1, 1, 1,
-1.459819, -1.699327, -2.761837, 1, 1, 1, 1, 1,
-1.455012, -0.2385744, -2.160933, 0, 0, 1, 1, 1,
-1.451505, 1.065684, -1.955175, 1, 0, 0, 1, 1,
-1.448129, 0.1003439, -0.4785256, 1, 0, 0, 1, 1,
-1.446513, -0.09095971, -2.293416, 1, 0, 0, 1, 1,
-1.419969, -0.1365655, -3.983034, 1, 0, 0, 1, 1,
-1.405448, 0.5576479, -1.13313, 1, 0, 0, 1, 1,
-1.401578, 0.9347574, -1.26275, 0, 0, 0, 1, 1,
-1.396029, -0.8843994, -1.829629, 0, 0, 0, 1, 1,
-1.382652, 1.313836, -2.043455, 0, 0, 0, 1, 1,
-1.370857, 0.2527921, -2.980153, 0, 0, 0, 1, 1,
-1.352136, 0.8299738, -1.048966, 0, 0, 0, 1, 1,
-1.350592, -1.091553, -1.554191, 0, 0, 0, 1, 1,
-1.338652, -0.5170144, -4.803765, 0, 0, 0, 1, 1,
-1.332948, -0.6239004, -0.89275, 1, 1, 1, 1, 1,
-1.327822, -1.603901, -1.182051, 1, 1, 1, 1, 1,
-1.327485, -0.8226596, -1.284518, 1, 1, 1, 1, 1,
-1.32415, -0.7052211, -1.257061, 1, 1, 1, 1, 1,
-1.320742, 0.05098696, -2.366837, 1, 1, 1, 1, 1,
-1.320003, 0.5831142, -2.540354, 1, 1, 1, 1, 1,
-1.317338, 0.468405, -2.541045, 1, 1, 1, 1, 1,
-1.312582, -0.5852996, -1.7569, 1, 1, 1, 1, 1,
-1.311109, -2.091436, -1.636052, 1, 1, 1, 1, 1,
-1.307042, -0.01250779, -2.052702, 1, 1, 1, 1, 1,
-1.301877, 0.4034044, -0.2727069, 1, 1, 1, 1, 1,
-1.299823, -1.317211, -2.893673, 1, 1, 1, 1, 1,
-1.291531, 0.7375798, -1.291043, 1, 1, 1, 1, 1,
-1.289331, 0.4422179, 1.13861, 1, 1, 1, 1, 1,
-1.287005, -0.9485077, -2.961884, 1, 1, 1, 1, 1,
-1.286702, 0.3496667, -0.7954347, 0, 0, 1, 1, 1,
-1.281967, 2.176619, -1.380409, 1, 0, 0, 1, 1,
-1.280344, -0.1743403, -0.1734881, 1, 0, 0, 1, 1,
-1.276401, 0.9386135, -2.819457, 1, 0, 0, 1, 1,
-1.275303, -0.3876417, -1.233908, 1, 0, 0, 1, 1,
-1.275043, 1.104064, -1.124085, 1, 0, 0, 1, 1,
-1.263808, -1.158399, -3.112725, 0, 0, 0, 1, 1,
-1.261838, 0.690283, -0.2683338, 0, 0, 0, 1, 1,
-1.253515, 0.5495034, -3.328032, 0, 0, 0, 1, 1,
-1.252986, -2.179657, -3.014892, 0, 0, 0, 1, 1,
-1.249396, 0.80542, -1.170407, 0, 0, 0, 1, 1,
-1.244534, 0.1774428, -1.899965, 0, 0, 0, 1, 1,
-1.234449, 0.03171049, -1.548394, 0, 0, 0, 1, 1,
-1.224911, 0.9232391, -1.973343, 1, 1, 1, 1, 1,
-1.221527, -0.1177195, -2.978455, 1, 1, 1, 1, 1,
-1.219408, 1.2621, -0.9083462, 1, 1, 1, 1, 1,
-1.207802, 0.9597601, -2.128772, 1, 1, 1, 1, 1,
-1.199232, -0.641416, -2.396447, 1, 1, 1, 1, 1,
-1.197092, 0.2778389, -0.8777567, 1, 1, 1, 1, 1,
-1.195672, 1.433275, 0.5886278, 1, 1, 1, 1, 1,
-1.188856, 0.6587062, -0.3599834, 1, 1, 1, 1, 1,
-1.187055, 0.5043613, -2.250406, 1, 1, 1, 1, 1,
-1.181942, -1.476892, -2.722103, 1, 1, 1, 1, 1,
-1.170265, -0.7345728, -2.281492, 1, 1, 1, 1, 1,
-1.16417, 2.215777, -1.350069, 1, 1, 1, 1, 1,
-1.159059, 0.1109743, -0.9908782, 1, 1, 1, 1, 1,
-1.150593, 0.1201213, -2.086185, 1, 1, 1, 1, 1,
-1.143582, -0.1463917, -2.196739, 1, 1, 1, 1, 1,
-1.143375, 0.3288746, -2.531765, 0, 0, 1, 1, 1,
-1.137611, 0.3789217, -1.826984, 1, 0, 0, 1, 1,
-1.135663, 0.25869, -1.931419, 1, 0, 0, 1, 1,
-1.130249, 1.758031, 0.1590859, 1, 0, 0, 1, 1,
-1.128662, 0.3910301, 0.138004, 1, 0, 0, 1, 1,
-1.123604, -1.071954, -3.952906, 1, 0, 0, 1, 1,
-1.121838, 0.5921018, -0.9506437, 0, 0, 0, 1, 1,
-1.117214, 1.679072, 1.135082, 0, 0, 0, 1, 1,
-1.116396, -0.1015243, -1.936113, 0, 0, 0, 1, 1,
-1.112113, -3.325495, -3.236846, 0, 0, 0, 1, 1,
-1.111692, -0.54343, -1.628071, 0, 0, 0, 1, 1,
-1.109983, 0.2187375, -0.6442204, 0, 0, 0, 1, 1,
-1.101751, -0.3341205, -1.589857, 0, 0, 0, 1, 1,
-1.09823, 0.1102054, -2.784082, 1, 1, 1, 1, 1,
-1.094226, 1.395908, 0.6722795, 1, 1, 1, 1, 1,
-1.091003, 1.578724, -1.232489, 1, 1, 1, 1, 1,
-1.090673, -0.257988, -2.810746, 1, 1, 1, 1, 1,
-1.083466, -1.524465, -1.224636, 1, 1, 1, 1, 1,
-1.081024, 1.298866, -1.765612, 1, 1, 1, 1, 1,
-1.080165, -1.043349, -1.868026, 1, 1, 1, 1, 1,
-1.076466, -1.788298, -3.130599, 1, 1, 1, 1, 1,
-1.069198, 1.972028, -2.155272, 1, 1, 1, 1, 1,
-1.065809, -1.345585, -3.001057, 1, 1, 1, 1, 1,
-1.063112, 0.8451538, -3.556896, 1, 1, 1, 1, 1,
-1.045386, -1.598488, -2.950333, 1, 1, 1, 1, 1,
-1.044099, -0.6548799, -1.718669, 1, 1, 1, 1, 1,
-1.044064, -0.627091, 0.0978771, 1, 1, 1, 1, 1,
-1.037017, 0.3600047, -1.842174, 1, 1, 1, 1, 1,
-1.022295, 0.3715865, -2.700662, 0, 0, 1, 1, 1,
-1.02076, -1.638472, -2.428237, 1, 0, 0, 1, 1,
-1.019202, 2.375119, 0.8826255, 1, 0, 0, 1, 1,
-1.006534, 0.6650146, -2.40539, 1, 0, 0, 1, 1,
-1.006085, 0.8876953, -0.5005279, 1, 0, 0, 1, 1,
-1.005319, 0.1843855, -2.612625, 1, 0, 0, 1, 1,
-0.9963225, -0.6983176, -1.406814, 0, 0, 0, 1, 1,
-0.9845585, -0.8724725, -2.454605, 0, 0, 0, 1, 1,
-0.9798573, 1.167418, -0.4200032, 0, 0, 0, 1, 1,
-0.9785415, -1.696329, -2.223906, 0, 0, 0, 1, 1,
-0.9765397, 0.3247283, -2.058352, 0, 0, 0, 1, 1,
-0.9736919, -0.8157777, -0.8516077, 0, 0, 0, 1, 1,
-0.9701324, -0.5609586, -3.160174, 0, 0, 0, 1, 1,
-0.9641557, 0.1698073, -1.122654, 1, 1, 1, 1, 1,
-0.9594598, -0.2058653, -0.8454881, 1, 1, 1, 1, 1,
-0.9584933, 0.08233787, -0.6557747, 1, 1, 1, 1, 1,
-0.9577404, -2.052336, -3.346646, 1, 1, 1, 1, 1,
-0.9545798, -0.2737936, -1.130728, 1, 1, 1, 1, 1,
-0.9539342, 1.399395, -0.3638334, 1, 1, 1, 1, 1,
-0.9522078, -2.499081, -2.276397, 1, 1, 1, 1, 1,
-0.952127, 0.1436004, -1.703917, 1, 1, 1, 1, 1,
-0.950251, 0.0472761, -0.9781377, 1, 1, 1, 1, 1,
-0.9494447, -0.08375031, -0.7200329, 1, 1, 1, 1, 1,
-0.9426662, -0.1728347, -2.809231, 1, 1, 1, 1, 1,
-0.9363467, -1.713068, -2.531341, 1, 1, 1, 1, 1,
-0.9319488, 0.9417998, -2.596827, 1, 1, 1, 1, 1,
-0.9310791, 1.173591, -0.8758082, 1, 1, 1, 1, 1,
-0.9268115, -0.1609956, -1.296911, 1, 1, 1, 1, 1,
-0.9263939, 0.4433181, 0.9893824, 0, 0, 1, 1, 1,
-0.9201449, 0.9252952, -0.9288074, 1, 0, 0, 1, 1,
-0.9199246, -0.3380525, -0.6088617, 1, 0, 0, 1, 1,
-0.9181364, 1.209943, -1.86513, 1, 0, 0, 1, 1,
-0.9163948, 0.09673836, -1.472928, 1, 0, 0, 1, 1,
-0.9105989, -0.6624708, -0.7886016, 1, 0, 0, 1, 1,
-0.9064707, -0.2643312, -2.257772, 0, 0, 0, 1, 1,
-0.9050063, -1.083925, -3.115321, 0, 0, 0, 1, 1,
-0.8904667, -0.6617838, -2.758647, 0, 0, 0, 1, 1,
-0.8904419, -0.4912795, -2.100224, 0, 0, 0, 1, 1,
-0.8896135, -0.4521243, -2.411402, 0, 0, 0, 1, 1,
-0.8867636, 0.7603524, -2.487678, 0, 0, 0, 1, 1,
-0.8847514, 1.415352, -0.3280742, 0, 0, 0, 1, 1,
-0.8844451, -0.05659581, -2.494968, 1, 1, 1, 1, 1,
-0.8840177, 1.275577, -3.083233, 1, 1, 1, 1, 1,
-0.8804008, 0.1264861, -1.003625, 1, 1, 1, 1, 1,
-0.8803689, 1.149161, -2.156666, 1, 1, 1, 1, 1,
-0.8716447, 0.7973376, -0.8452406, 1, 1, 1, 1, 1,
-0.8702325, -0.4272492, -2.079193, 1, 1, 1, 1, 1,
-0.869808, -0.4679539, -4.085591, 1, 1, 1, 1, 1,
-0.8688674, 0.2115352, -2.971296, 1, 1, 1, 1, 1,
-0.8635858, 1.298145, -1.866161, 1, 1, 1, 1, 1,
-0.8632157, -1.354798, -2.449134, 1, 1, 1, 1, 1,
-0.8569896, 0.3527775, -0.865253, 1, 1, 1, 1, 1,
-0.8506071, 0.003351006, -1.74503, 1, 1, 1, 1, 1,
-0.8502027, -1.134961, -2.320299, 1, 1, 1, 1, 1,
-0.8494678, -1.642472, -4.165785, 1, 1, 1, 1, 1,
-0.842677, -1.168232, -3.990631, 1, 1, 1, 1, 1,
-0.8320889, 1.004696, 0.9091698, 0, 0, 1, 1, 1,
-0.8309232, -1.119708, -2.154663, 1, 0, 0, 1, 1,
-0.8264137, 0.8112194, -0.8146909, 1, 0, 0, 1, 1,
-0.8262842, 0.4676668, 0.5575639, 1, 0, 0, 1, 1,
-0.8207147, 0.6256318, -0.594869, 1, 0, 0, 1, 1,
-0.8201235, 0.5027648, -0.8745927, 1, 0, 0, 1, 1,
-0.8196834, 1.171379, -0.8462576, 0, 0, 0, 1, 1,
-0.8165201, 0.0433379, -2.441521, 0, 0, 0, 1, 1,
-0.8103023, 0.06490291, -2.151497, 0, 0, 0, 1, 1,
-0.8092335, 0.0805292, -0.007433522, 0, 0, 0, 1, 1,
-0.808245, 0.0499858, -1.501738, 0, 0, 0, 1, 1,
-0.8029329, 0.07763968, -0.1353591, 0, 0, 0, 1, 1,
-0.8024694, 1.163012, -1.979863, 0, 0, 0, 1, 1,
-0.7994294, -0.1074115, 0.235843, 1, 1, 1, 1, 1,
-0.7963789, -0.1603139, -2.247862, 1, 1, 1, 1, 1,
-0.7929459, -0.6960702, -2.606843, 1, 1, 1, 1, 1,
-0.7920506, -0.05618284, -3.516813, 1, 1, 1, 1, 1,
-0.789364, 2.008291, 0.5106554, 1, 1, 1, 1, 1,
-0.7874992, 0.8973659, -3.044935, 1, 1, 1, 1, 1,
-0.7859982, -1.317036, -2.026027, 1, 1, 1, 1, 1,
-0.7855167, 0.543253, -1.609798, 1, 1, 1, 1, 1,
-0.7820166, -0.01616798, -2.095934, 1, 1, 1, 1, 1,
-0.7805867, 0.9454507, -1.277199, 1, 1, 1, 1, 1,
-0.7797433, 0.4027734, -2.173547, 1, 1, 1, 1, 1,
-0.7766234, -0.05214393, -0.9054587, 1, 1, 1, 1, 1,
-0.7728055, 0.9223691, 0.1769131, 1, 1, 1, 1, 1,
-0.7726175, 0.1124144, -1.190237, 1, 1, 1, 1, 1,
-0.7709591, -0.4080975, -3.422301, 1, 1, 1, 1, 1,
-0.7707832, 0.02857198, -0.4556846, 0, 0, 1, 1, 1,
-0.7687877, -0.2272742, -1.033617, 1, 0, 0, 1, 1,
-0.7674916, -0.2214884, -1.656977, 1, 0, 0, 1, 1,
-0.7629482, -0.6101667, -1.405803, 1, 0, 0, 1, 1,
-0.7624581, 0.8771812, -1.430602, 1, 0, 0, 1, 1,
-0.7584504, 0.3727605, -1.810854, 1, 0, 0, 1, 1,
-0.7565394, 1.324186, 1.061747, 0, 0, 0, 1, 1,
-0.7558239, -0.1231095, -2.512178, 0, 0, 0, 1, 1,
-0.7515048, 0.985627, -0.6158474, 0, 0, 0, 1, 1,
-0.7501593, -0.05207573, 0.02744988, 0, 0, 0, 1, 1,
-0.7385213, 0.6061338, -1.496307, 0, 0, 0, 1, 1,
-0.7376245, -1.249942, -2.714776, 0, 0, 0, 1, 1,
-0.7374262, -1.598054, -2.706223, 0, 0, 0, 1, 1,
-0.7289262, 0.2353179, -3.274231, 1, 1, 1, 1, 1,
-0.7262602, 0.2429412, -1.255994, 1, 1, 1, 1, 1,
-0.7260123, -0.7451623, -1.954126, 1, 1, 1, 1, 1,
-0.7236814, -0.1087447, -2.855042, 1, 1, 1, 1, 1,
-0.7218261, -0.04249199, -2.769043, 1, 1, 1, 1, 1,
-0.7203345, -0.5718611, -4.058448, 1, 1, 1, 1, 1,
-0.7174476, -1.234081, -3.164848, 1, 1, 1, 1, 1,
-0.7146774, -0.02369908, -2.027094, 1, 1, 1, 1, 1,
-0.7099415, -0.6606671, -1.380102, 1, 1, 1, 1, 1,
-0.707453, 1.127686, 0.658841, 1, 1, 1, 1, 1,
-0.7037019, 0.07594048, -0.4600637, 1, 1, 1, 1, 1,
-0.6989843, 0.08720752, -1.326275, 1, 1, 1, 1, 1,
-0.6905287, 1.481192, -1.158782, 1, 1, 1, 1, 1,
-0.6883966, -0.5868621, -3.334575, 1, 1, 1, 1, 1,
-0.6821642, -0.487321, -2.356185, 1, 1, 1, 1, 1,
-0.6819324, -0.001918826, -2.268861, 0, 0, 1, 1, 1,
-0.6810062, -1.557236, -2.868304, 1, 0, 0, 1, 1,
-0.6791934, -1.238374, -4.112303, 1, 0, 0, 1, 1,
-0.6722709, -0.8945445, -2.46252, 1, 0, 0, 1, 1,
-0.6702226, 0.5854081, 0.11799, 1, 0, 0, 1, 1,
-0.6665365, -1.040468, -2.001755, 1, 0, 0, 1, 1,
-0.6644673, -0.4563497, -1.686797, 0, 0, 0, 1, 1,
-0.6637641, 0.5612644, -1.382173, 0, 0, 0, 1, 1,
-0.66372, -0.1528167, -0.8156599, 0, 0, 0, 1, 1,
-0.6562623, 1.057089, -2.240612, 0, 0, 0, 1, 1,
-0.6559055, 1.323116, 0.02407955, 0, 0, 0, 1, 1,
-0.6558551, -0.03327755, 0.01907214, 0, 0, 0, 1, 1,
-0.6545671, -0.8444507, -3.427419, 0, 0, 0, 1, 1,
-0.6534886, -0.247013, -1.885217, 1, 1, 1, 1, 1,
-0.6465582, -0.2546348, -2.432009, 1, 1, 1, 1, 1,
-0.6430327, 0.6124224, -0.9100087, 1, 1, 1, 1, 1,
-0.6425886, 0.8186423, 0.02831366, 1, 1, 1, 1, 1,
-0.6346372, -1.380845, -2.257429, 1, 1, 1, 1, 1,
-0.6330435, -2.428051, -3.216476, 1, 1, 1, 1, 1,
-0.6310518, 1.427079, 0.6286799, 1, 1, 1, 1, 1,
-0.6254249, 1.892649, 1.304439, 1, 1, 1, 1, 1,
-0.6131179, -1.439693, -2.640122, 1, 1, 1, 1, 1,
-0.6117572, -0.413292, -2.854314, 1, 1, 1, 1, 1,
-0.604997, 0.333499, -1.13706, 1, 1, 1, 1, 1,
-0.5954101, 0.07523922, -0.2850923, 1, 1, 1, 1, 1,
-0.5911168, -0.1615503, -3.840039, 1, 1, 1, 1, 1,
-0.5882359, -0.2011631, -0.9163557, 1, 1, 1, 1, 1,
-0.58808, -1.242607, -3.555531, 1, 1, 1, 1, 1,
-0.5879681, -1.293867, -1.658327, 0, 0, 1, 1, 1,
-0.5869179, -0.3243213, -2.896855, 1, 0, 0, 1, 1,
-0.5840104, -0.4860886, -0.8895345, 1, 0, 0, 1, 1,
-0.5787995, -1.57752, -2.894168, 1, 0, 0, 1, 1,
-0.5728171, 0.3282802, -1.602307, 1, 0, 0, 1, 1,
-0.5719205, -0.6148478, -2.380985, 1, 0, 0, 1, 1,
-0.5663919, -0.1543404, -1.687323, 0, 0, 0, 1, 1,
-0.5652295, 0.4749032, 0.1039996, 0, 0, 0, 1, 1,
-0.5643539, -0.701878, -1.938365, 0, 0, 0, 1, 1,
-0.5619996, -0.2915789, -1.903562, 0, 0, 0, 1, 1,
-0.5604228, 0.8032905, 0.1067698, 0, 0, 0, 1, 1,
-0.5599681, 0.3818641, -2.007972, 0, 0, 0, 1, 1,
-0.556771, -0.09039876, -0.2023824, 0, 0, 0, 1, 1,
-0.5554686, -0.220691, -1.35291, 1, 1, 1, 1, 1,
-0.5546721, -1.251272, -3.95873, 1, 1, 1, 1, 1,
-0.5526494, -0.4374302, -2.339472, 1, 1, 1, 1, 1,
-0.5505007, -0.3347518, -2.769931, 1, 1, 1, 1, 1,
-0.5503946, 1.831289, -0.4600356, 1, 1, 1, 1, 1,
-0.5441527, -0.7847216, -1.88636, 1, 1, 1, 1, 1,
-0.5426009, 1.677811, -0.7447259, 1, 1, 1, 1, 1,
-0.5358612, 2.302265, -0.8142242, 1, 1, 1, 1, 1,
-0.5333434, -0.301585, -2.22677, 1, 1, 1, 1, 1,
-0.5330824, 1.073549, -1.525941, 1, 1, 1, 1, 1,
-0.5294218, -0.4808735, -1.516206, 1, 1, 1, 1, 1,
-0.5279636, -0.4022194, -2.56617, 1, 1, 1, 1, 1,
-0.5269886, -0.3623741, -0.9863912, 1, 1, 1, 1, 1,
-0.5238207, -2.25543, -4.804769, 1, 1, 1, 1, 1,
-0.5220115, 0.01265526, -1.286376, 1, 1, 1, 1, 1,
-0.5210161, -1.36384, -2.524772, 0, 0, 1, 1, 1,
-0.5200408, 0.209219, -0.8091104, 1, 0, 0, 1, 1,
-0.5197535, 0.430175, -3.154975, 1, 0, 0, 1, 1,
-0.5171228, -1.059874, -1.97889, 1, 0, 0, 1, 1,
-0.5101076, 0.1464832, 0.8562329, 1, 0, 0, 1, 1,
-0.5097064, 0.06451081, -0.4776061, 1, 0, 0, 1, 1,
-0.5067262, -0.1838992, -0.8736382, 0, 0, 0, 1, 1,
-0.5057556, -0.3547374, -2.280443, 0, 0, 0, 1, 1,
-0.5015568, 0.2348385, -1.397535, 0, 0, 0, 1, 1,
-0.498011, -0.2233596, -2.06806, 0, 0, 0, 1, 1,
-0.4862952, 0.1585662, -1.167104, 0, 0, 0, 1, 1,
-0.4835471, 1.801218, -0.595944, 0, 0, 0, 1, 1,
-0.479474, 1.606309, 1.646219, 0, 0, 0, 1, 1,
-0.464345, 1.934965, 1.576158, 1, 1, 1, 1, 1,
-0.462295, -1.325508, -1.604557, 1, 1, 1, 1, 1,
-0.4616814, -0.7628965, -1.010292, 1, 1, 1, 1, 1,
-0.455, 1.285477, -0.3216725, 1, 1, 1, 1, 1,
-0.4549929, 0.563852, -0.443339, 1, 1, 1, 1, 1,
-0.4523047, -1.84187, -3.526615, 1, 1, 1, 1, 1,
-0.4498785, 0.09766995, 0.6466613, 1, 1, 1, 1, 1,
-0.4465925, 0.3777261, -0.2843463, 1, 1, 1, 1, 1,
-0.443078, -0.4546397, -2.336545, 1, 1, 1, 1, 1,
-0.4415334, -1.794789, -2.712207, 1, 1, 1, 1, 1,
-0.4412695, -0.6152141, -3.49767, 1, 1, 1, 1, 1,
-0.4400745, 0.8532358, 2.073651, 1, 1, 1, 1, 1,
-0.4399693, 1.789969, 1.349482, 1, 1, 1, 1, 1,
-0.4395759, 0.1419376, -0.1238941, 1, 1, 1, 1, 1,
-0.4376049, 0.4600824, -0.761725, 1, 1, 1, 1, 1,
-0.4374275, -1.807621, -3.015143, 0, 0, 1, 1, 1,
-0.4346648, -0.6370429, -3.278929, 1, 0, 0, 1, 1,
-0.4307569, 0.4899888, -0.3914964, 1, 0, 0, 1, 1,
-0.4292619, 1.44005, -0.1691512, 1, 0, 0, 1, 1,
-0.4267484, -0.8400083, -4.565372, 1, 0, 0, 1, 1,
-0.4266742, 0.5533014, 0.01229773, 1, 0, 0, 1, 1,
-0.4253082, 0.2156438, 0.3829905, 0, 0, 0, 1, 1,
-0.4210183, -0.4455036, -1.035662, 0, 0, 0, 1, 1,
-0.4186391, -1.395907, -3.259559, 0, 0, 0, 1, 1,
-0.4163621, -0.01443457, -2.289428, 0, 0, 0, 1, 1,
-0.3923418, 0.2309979, -0.8746849, 0, 0, 0, 1, 1,
-0.3911791, 0.4599569, -1.041544, 0, 0, 0, 1, 1,
-0.3894315, 0.7901565, -0.5066439, 0, 0, 0, 1, 1,
-0.3890045, 0.6056111, 0.5414759, 1, 1, 1, 1, 1,
-0.386375, 0.5441831, -0.07199687, 1, 1, 1, 1, 1,
-0.3835187, -1.686919, -3.169062, 1, 1, 1, 1, 1,
-0.3828279, -2.357224, -2.353197, 1, 1, 1, 1, 1,
-0.3809435, 0.6793579, -3.753102, 1, 1, 1, 1, 1,
-0.3776701, 0.8497103, 0.156675, 1, 1, 1, 1, 1,
-0.3753354, 2.001626, -0.3917544, 1, 1, 1, 1, 1,
-0.3731336, 0.6871135, 0.8219817, 1, 1, 1, 1, 1,
-0.3669078, 0.4575595, 1.020261, 1, 1, 1, 1, 1,
-0.3660851, -0.07380955, -1.950922, 1, 1, 1, 1, 1,
-0.3647974, -1.066095, -0.9099095, 1, 1, 1, 1, 1,
-0.3564466, 0.5298548, 0.04341194, 1, 1, 1, 1, 1,
-0.3528555, 1.191665, 0.8513252, 1, 1, 1, 1, 1,
-0.343568, 0.2535376, -1.552679, 1, 1, 1, 1, 1,
-0.335447, -0.5653505, -3.98898, 1, 1, 1, 1, 1,
-0.3353503, -1.714339, -3.145805, 0, 0, 1, 1, 1,
-0.3347974, 0.2768757, -1.568899, 1, 0, 0, 1, 1,
-0.3310514, 0.05212012, -0.04272238, 1, 0, 0, 1, 1,
-0.3266377, -1.003648, -0.7494593, 1, 0, 0, 1, 1,
-0.3252438, -0.2676279, -2.641433, 1, 0, 0, 1, 1,
-0.3217213, -0.5900247, -2.851417, 1, 0, 0, 1, 1,
-0.3187308, 0.7232535, -1.633777, 0, 0, 0, 1, 1,
-0.3187234, 0.02282055, -1.180017, 0, 0, 0, 1, 1,
-0.3173688, 0.05013525, -1.089281, 0, 0, 0, 1, 1,
-0.3162796, -1.196152, -2.170625, 0, 0, 0, 1, 1,
-0.3136236, -0.4182547, -1.546165, 0, 0, 0, 1, 1,
-0.3118919, 0.4401222, -0.06409335, 0, 0, 0, 1, 1,
-0.3096549, -0.9774184, -2.827926, 0, 0, 0, 1, 1,
-0.3092726, 0.6051007, 0.2629115, 1, 1, 1, 1, 1,
-0.3082058, -0.3829593, -1.254526, 1, 1, 1, 1, 1,
-0.3058056, -0.579981, -4.546107, 1, 1, 1, 1, 1,
-0.3020042, -1.585973, -3.220552, 1, 1, 1, 1, 1,
-0.2956461, -1.628032, -1.825207, 1, 1, 1, 1, 1,
-0.2915752, 1.924162, 1.205048, 1, 1, 1, 1, 1,
-0.2828253, 0.6173241, -0.9593118, 1, 1, 1, 1, 1,
-0.28101, 0.2417359, -1.35937, 1, 1, 1, 1, 1,
-0.2745719, -0.298629, -3.278875, 1, 1, 1, 1, 1,
-0.2737257, -1.439265, -3.367641, 1, 1, 1, 1, 1,
-0.27312, 0.2125361, -0.306983, 1, 1, 1, 1, 1,
-0.272627, -0.8098307, -2.506452, 1, 1, 1, 1, 1,
-0.2715847, -0.7864642, -4.076062, 1, 1, 1, 1, 1,
-0.2713108, 1.026024, 0.5764219, 1, 1, 1, 1, 1,
-0.2681262, 1.345623, 1.199231, 1, 1, 1, 1, 1,
-0.2659918, 1.438251, 1.966813, 0, 0, 1, 1, 1,
-0.2641924, 1.484291, -0.2363359, 1, 0, 0, 1, 1,
-0.2622366, 0.2062037, 0.4352252, 1, 0, 0, 1, 1,
-0.259481, 1.366988, -0.3026286, 1, 0, 0, 1, 1,
-0.2560135, 0.2890813, -0.8676546, 1, 0, 0, 1, 1,
-0.2554675, -1.784945, -1.77489, 1, 0, 0, 1, 1,
-0.255362, -0.1448435, -3.494883, 0, 0, 0, 1, 1,
-0.2535922, 1.439441, -1.368853, 0, 0, 0, 1, 1,
-0.2534673, 0.4072455, -0.7774642, 0, 0, 0, 1, 1,
-0.253251, 1.256364, 1.739797, 0, 0, 0, 1, 1,
-0.2516328, 1.521355, -1.186654, 0, 0, 0, 1, 1,
-0.2483948, -1.51303, -2.170766, 0, 0, 0, 1, 1,
-0.2477665, -1.921895, -3.787427, 0, 0, 0, 1, 1,
-0.2453926, 1.440306, -0.7554613, 1, 1, 1, 1, 1,
-0.2448249, 1.587587, 1.164571, 1, 1, 1, 1, 1,
-0.2391236, -0.8764259, -3.379002, 1, 1, 1, 1, 1,
-0.2374974, 1.087828, 0.8166641, 1, 1, 1, 1, 1,
-0.2356991, 0.6927773, -2.174382, 1, 1, 1, 1, 1,
-0.2290644, 1.154837, -1.20652, 1, 1, 1, 1, 1,
-0.2277182, -0.3392454, -2.91551, 1, 1, 1, 1, 1,
-0.2274831, -1.951422, -1.952754, 1, 1, 1, 1, 1,
-0.2193471, 0.8058227, -1.361787, 1, 1, 1, 1, 1,
-0.2094058, 0.4838616, 0.1258342, 1, 1, 1, 1, 1,
-0.205812, 1.154618, 0.04859225, 1, 1, 1, 1, 1,
-0.2022111, -0.6018088, -2.398909, 1, 1, 1, 1, 1,
-0.2016474, 1.710026, -1.568741, 1, 1, 1, 1, 1,
-0.1949374, -0.4346972, -3.301745, 1, 1, 1, 1, 1,
-0.1940369, -1.001324, -1.732667, 1, 1, 1, 1, 1,
-0.192096, 0.2216194, 0.4045737, 0, 0, 1, 1, 1,
-0.1890629, 0.8859922, -0.05414603, 1, 0, 0, 1, 1,
-0.183282, 0.5435783, -2.272557, 1, 0, 0, 1, 1,
-0.1816745, -1.594458, -2.959783, 1, 0, 0, 1, 1,
-0.1806273, 0.1588089, -2.641666, 1, 0, 0, 1, 1,
-0.1785224, 0.6679577, -1.633894, 1, 0, 0, 1, 1,
-0.1735312, 0.6484269, -0.7959828, 0, 0, 0, 1, 1,
-0.1721658, 0.2104647, -0.8910908, 0, 0, 0, 1, 1,
-0.1702859, -0.3918557, -1.991928, 0, 0, 0, 1, 1,
-0.1677207, 1.885002, -0.5558578, 0, 0, 0, 1, 1,
-0.1602179, 0.4845418, -1.485888, 0, 0, 0, 1, 1,
-0.1595514, -0.1978068, -2.494393, 0, 0, 0, 1, 1,
-0.1552453, -0.06726905, -1.963932, 0, 0, 0, 1, 1,
-0.1519794, 1.075571, -0.4373984, 1, 1, 1, 1, 1,
-0.1505314, 1.49518, 0.6714705, 1, 1, 1, 1, 1,
-0.1444213, 1.111458, 0.931546, 1, 1, 1, 1, 1,
-0.136133, 0.1162394, -1.320028, 1, 1, 1, 1, 1,
-0.1341427, -1.704654, -4.715781, 1, 1, 1, 1, 1,
-0.1339801, 0.08753289, -1.097888, 1, 1, 1, 1, 1,
-0.1285276, -1.128248, -2.247516, 1, 1, 1, 1, 1,
-0.1252532, 1.223425, -1.047463, 1, 1, 1, 1, 1,
-0.1234759, -0.5371372, -2.880885, 1, 1, 1, 1, 1,
-0.122792, -0.3541372, -2.299001, 1, 1, 1, 1, 1,
-0.1212003, -0.2202138, -2.918557, 1, 1, 1, 1, 1,
-0.1156821, -2.556666, -2.955578, 1, 1, 1, 1, 1,
-0.115132, -1.129357, -1.846209, 1, 1, 1, 1, 1,
-0.1142436, -0.1078412, -2.308678, 1, 1, 1, 1, 1,
-0.1070036, 0.2794334, -1.246432, 1, 1, 1, 1, 1,
-0.1025916, -0.4029891, -1.857399, 0, 0, 1, 1, 1,
-0.1004739, 0.9892878, 1.1338, 1, 0, 0, 1, 1,
-0.09930279, 0.9187838, -0.7455246, 1, 0, 0, 1, 1,
-0.09837303, 0.03077923, -2.022871, 1, 0, 0, 1, 1,
-0.09737494, 1.614068, -1.703579, 1, 0, 0, 1, 1,
-0.09588459, -1.201778, -3.058634, 1, 0, 0, 1, 1,
-0.08708195, 1.160856, 0.4726492, 0, 0, 0, 1, 1,
-0.08290161, 1.905004, -0.7520935, 0, 0, 0, 1, 1,
-0.07972337, -0.8248102, -3.8141, 0, 0, 0, 1, 1,
-0.07847479, 0.6668878, -1.745638, 0, 0, 0, 1, 1,
-0.07450426, -1.711992, -3.423737, 0, 0, 0, 1, 1,
-0.07323853, 1.313349, -2.072208, 0, 0, 0, 1, 1,
-0.07181747, 0.3330199, 0.008715695, 0, 0, 0, 1, 1,
-0.06926903, 0.846741, -0.492359, 1, 1, 1, 1, 1,
-0.06411127, -0.4909483, -3.908969, 1, 1, 1, 1, 1,
-0.06317759, -1.43697, -3.117029, 1, 1, 1, 1, 1,
-0.05938669, 0.6764739, -0.7437088, 1, 1, 1, 1, 1,
-0.05839162, -1.84313, -5.780281, 1, 1, 1, 1, 1,
-0.05490312, -0.8604784, -2.441426, 1, 1, 1, 1, 1,
-0.05153443, 1.343522, -0.8729784, 1, 1, 1, 1, 1,
-0.04554409, 1.039335, 0.4263244, 1, 1, 1, 1, 1,
-0.04413592, 1.59053, -0.4044202, 1, 1, 1, 1, 1,
-0.04375691, -0.2919859, -3.214625, 1, 1, 1, 1, 1,
-0.0339627, 0.2967764, 0.452235, 1, 1, 1, 1, 1,
-0.03103178, 0.7698317, -0.3543959, 1, 1, 1, 1, 1,
-0.02973016, -0.3611381, -3.754009, 1, 1, 1, 1, 1,
-0.02259238, -0.120804, -2.526546, 1, 1, 1, 1, 1,
-0.02191412, 0.06732601, -1.475295, 1, 1, 1, 1, 1,
-0.02016923, -3.364517, -1.654656, 0, 0, 1, 1, 1,
-0.007987097, -0.6244276, -2.604113, 1, 0, 0, 1, 1,
-0.005802599, -0.4187025, -3.178601, 1, 0, 0, 1, 1,
0.006286674, 1.295925, -0.8013885, 1, 0, 0, 1, 1,
0.006521553, -1.129037, 4.254805, 1, 0, 0, 1, 1,
0.01410065, 1.38484, 0.5341493, 1, 0, 0, 1, 1,
0.01575242, 0.3472141, 0.06225362, 0, 0, 0, 1, 1,
0.01680543, -0.3123658, 2.212639, 0, 0, 0, 1, 1,
0.01895026, 0.797511, 0.4004233, 0, 0, 0, 1, 1,
0.0200271, 0.3272703, -0.0238611, 0, 0, 0, 1, 1,
0.02560675, -1.055758, 3.181795, 0, 0, 0, 1, 1,
0.02666002, -1.55673, 4.534977, 0, 0, 0, 1, 1,
0.02924002, 0.7611886, -0.2920474, 0, 0, 0, 1, 1,
0.0294768, -0.05470532, 4.002303, 1, 1, 1, 1, 1,
0.02953633, -0.582123, 4.539893, 1, 1, 1, 1, 1,
0.03109036, -0.4607396, 1.842638, 1, 1, 1, 1, 1,
0.03460801, -0.009687315, -1.277362, 1, 1, 1, 1, 1,
0.03506584, 0.818077, 0.3915326, 1, 1, 1, 1, 1,
0.03591834, 2.852168, 0.02774588, 1, 1, 1, 1, 1,
0.03683149, -1.173276, 1.77896, 1, 1, 1, 1, 1,
0.03990141, -1.960571, 2.945493, 1, 1, 1, 1, 1,
0.04083554, -1.316861, 3.861154, 1, 1, 1, 1, 1,
0.04317015, 1.253372, 1.232276, 1, 1, 1, 1, 1,
0.0433549, 0.672216, -1.653945, 1, 1, 1, 1, 1,
0.0457276, 0.1069276, -0.2533794, 1, 1, 1, 1, 1,
0.04666477, -0.1707213, 1.245828, 1, 1, 1, 1, 1,
0.04853898, 0.8660263, -1.447686, 1, 1, 1, 1, 1,
0.05296649, 0.4591575, 0.5571746, 1, 1, 1, 1, 1,
0.06249753, -1.369805, 3.423047, 0, 0, 1, 1, 1,
0.06644259, 1.202161, -1.140342, 1, 0, 0, 1, 1,
0.06794122, -0.9026864, 3.043712, 1, 0, 0, 1, 1,
0.07341115, 0.04505901, 0.956464, 1, 0, 0, 1, 1,
0.07356391, -1.189604, 2.830475, 1, 0, 0, 1, 1,
0.07653005, -2.056657, 4.602118, 1, 0, 0, 1, 1,
0.07715623, 1.117665, -0.447111, 0, 0, 0, 1, 1,
0.08155403, 1.261751, 0.4311507, 0, 0, 0, 1, 1,
0.0819957, -2.059586, 3.849108, 0, 0, 0, 1, 1,
0.0834612, 0.04515784, 0.8154615, 0, 0, 0, 1, 1,
0.08349837, -0.5656553, 2.752735, 0, 0, 0, 1, 1,
0.08484671, 0.9312516, 0.6975709, 0, 0, 0, 1, 1,
0.08771116, -0.603352, 3.017636, 0, 0, 0, 1, 1,
0.08866795, 0.7048154, 0.8025541, 1, 1, 1, 1, 1,
0.08887849, -0.8002521, 3.565843, 1, 1, 1, 1, 1,
0.09015826, -0.06605794, 1.454311, 1, 1, 1, 1, 1,
0.09181193, 1.685628, -0.4683563, 1, 1, 1, 1, 1,
0.09404442, -0.712363, 3.612577, 1, 1, 1, 1, 1,
0.09525759, -1.647633, 1.880656, 1, 1, 1, 1, 1,
0.09540191, 1.063607, -0.1287514, 1, 1, 1, 1, 1,
0.09889541, 0.9662601, 0.1390804, 1, 1, 1, 1, 1,
0.09961379, -0.298584, 2.789821, 1, 1, 1, 1, 1,
0.1038001, -0.2813806, 2.638721, 1, 1, 1, 1, 1,
0.1120357, -0.6895077, 1.073975, 1, 1, 1, 1, 1,
0.1142768, -0.2720756, 4.21868, 1, 1, 1, 1, 1,
0.1156576, -1.20869, 4.289291, 1, 1, 1, 1, 1,
0.1164806, 0.7547316, 1.381755, 1, 1, 1, 1, 1,
0.1171611, 0.05038347, 0.8942989, 1, 1, 1, 1, 1,
0.1174417, 1.215218, -0.01038973, 0, 0, 1, 1, 1,
0.1214652, -0.8292758, 4.290405, 1, 0, 0, 1, 1,
0.1235815, -0.5935732, 2.188102, 1, 0, 0, 1, 1,
0.126024, -1.017947, 2.390383, 1, 0, 0, 1, 1,
0.126248, -0.6788063, 2.174634, 1, 0, 0, 1, 1,
0.1262912, 0.583638, 0.9883748, 1, 0, 0, 1, 1,
0.1291643, -0.8545066, 2.204654, 0, 0, 0, 1, 1,
0.1294338, -1.376722, 1.45476, 0, 0, 0, 1, 1,
0.1308599, -1.056036, 3.9736, 0, 0, 0, 1, 1,
0.1373395, 1.028114, -1.31244, 0, 0, 0, 1, 1,
0.1386402, -0.4165447, 3.946501, 0, 0, 0, 1, 1,
0.13907, 0.4539386, 0.05925938, 0, 0, 0, 1, 1,
0.1434592, -0.1270526, 2.532019, 0, 0, 0, 1, 1,
0.1438729, -0.8588463, 3.047736, 1, 1, 1, 1, 1,
0.144336, 0.2615088, 1.97822, 1, 1, 1, 1, 1,
0.1485597, 1.335923, 1.69145, 1, 1, 1, 1, 1,
0.1567345, 0.4427997, -0.6807546, 1, 1, 1, 1, 1,
0.1573785, -0.9965678, 2.769568, 1, 1, 1, 1, 1,
0.1592489, -1.058829, 3.556215, 1, 1, 1, 1, 1,
0.1597825, 1.230619, 2.343127, 1, 1, 1, 1, 1,
0.1659875, -1.471081, 2.578478, 1, 1, 1, 1, 1,
0.1671862, 1.44609, -0.7422417, 1, 1, 1, 1, 1,
0.1707139, 1.731733, -0.1589577, 1, 1, 1, 1, 1,
0.1747912, 0.465323, 0.7705027, 1, 1, 1, 1, 1,
0.177823, -0.7051249, 4.11351, 1, 1, 1, 1, 1,
0.1835712, 1.096788, -0.3702372, 1, 1, 1, 1, 1,
0.185989, -1.05412, 3.540957, 1, 1, 1, 1, 1,
0.186181, 1.638226, -1.195333, 1, 1, 1, 1, 1,
0.1879829, -1.282391, 2.194274, 0, 0, 1, 1, 1,
0.1885477, 0.1312139, 0.937449, 1, 0, 0, 1, 1,
0.1897774, 0.2472787, 1.894458, 1, 0, 0, 1, 1,
0.191431, 0.1910959, 1.50074, 1, 0, 0, 1, 1,
0.1915583, -0.8091986, 4.750881, 1, 0, 0, 1, 1,
0.1938496, -0.1222926, 3.175325, 1, 0, 0, 1, 1,
0.1939379, -1.239184, 2.326589, 0, 0, 0, 1, 1,
0.1951605, 1.227842, 1.417681, 0, 0, 0, 1, 1,
0.1979214, -1.726496, 2.089272, 0, 0, 0, 1, 1,
0.1992257, -0.02286605, 2.255465, 0, 0, 0, 1, 1,
0.2056423, -2.16553, 2.008638, 0, 0, 0, 1, 1,
0.2090407, -1.993381, 3.294349, 0, 0, 0, 1, 1,
0.2099945, 1.132521, 0.156657, 0, 0, 0, 1, 1,
0.2158234, -0.7234723, 2.107412, 1, 1, 1, 1, 1,
0.2182392, -1.885149, 2.608191, 1, 1, 1, 1, 1,
0.2213599, -0.01531541, 0.9651344, 1, 1, 1, 1, 1,
0.2274121, 0.5211977, 0.6008297, 1, 1, 1, 1, 1,
0.2314044, 0.3902737, 0.7235517, 1, 1, 1, 1, 1,
0.2349378, 0.703649, 0.7128171, 1, 1, 1, 1, 1,
0.2358845, 1.344677, 1.684787, 1, 1, 1, 1, 1,
0.2378107, -1.1832, 3.216702, 1, 1, 1, 1, 1,
0.2415173, 1.155831, 0.8775548, 1, 1, 1, 1, 1,
0.2442095, 1.672916, 2.399344, 1, 1, 1, 1, 1,
0.2450406, 0.6810464, -1.174329, 1, 1, 1, 1, 1,
0.2496203, -0.04271713, 1.110045, 1, 1, 1, 1, 1,
0.2549528, 0.07979018, 3.230834, 1, 1, 1, 1, 1,
0.2549709, 0.8737792, 1.400534, 1, 1, 1, 1, 1,
0.2557432, 0.6865467, 0.3629772, 1, 1, 1, 1, 1,
0.2597037, 0.103605, 0.6045609, 0, 0, 1, 1, 1,
0.2668628, 0.8221381, 1.451959, 1, 0, 0, 1, 1,
0.2669316, 0.883294, -0.03662737, 1, 0, 0, 1, 1,
0.2678015, 0.8429852, 1.244786, 1, 0, 0, 1, 1,
0.2679962, 0.6389926, 0.3298765, 1, 0, 0, 1, 1,
0.2684507, 1.653805, -1.108373, 1, 0, 0, 1, 1,
0.2722622, 0.5252185, -0.7355903, 0, 0, 0, 1, 1,
0.2739902, -0.973879, 2.459203, 0, 0, 0, 1, 1,
0.2754489, -0.2934862, 3.174776, 0, 0, 0, 1, 1,
0.2762862, -0.923969, 2.951293, 0, 0, 0, 1, 1,
0.2763745, 0.6453872, -1.307867, 0, 0, 0, 1, 1,
0.2773613, 0.3042765, 0.9303391, 0, 0, 0, 1, 1,
0.2787889, -0.1553396, 2.434667, 0, 0, 0, 1, 1,
0.2792592, 0.2712068, 1.42818, 1, 1, 1, 1, 1,
0.279456, -2.131947, 4.422356, 1, 1, 1, 1, 1,
0.2869496, 0.7550146, 0.7885811, 1, 1, 1, 1, 1,
0.2879694, 0.2495154, 0.3532349, 1, 1, 1, 1, 1,
0.2910401, 0.2725753, 1.494339, 1, 1, 1, 1, 1,
0.293629, -0.9730905, 2.557995, 1, 1, 1, 1, 1,
0.2945199, 0.2010143, 0.371701, 1, 1, 1, 1, 1,
0.2976385, -0.3116791, 2.513725, 1, 1, 1, 1, 1,
0.3036738, 0.5248617, -1.098392, 1, 1, 1, 1, 1,
0.3105606, -0.605045, 2.36861, 1, 1, 1, 1, 1,
0.314175, -1.007039, 3.598635, 1, 1, 1, 1, 1,
0.3146123, -0.239337, 1.29596, 1, 1, 1, 1, 1,
0.3206866, -0.4627968, 3.413644, 1, 1, 1, 1, 1,
0.3219991, -0.3198008, 0.1973936, 1, 1, 1, 1, 1,
0.325789, -1.203331, 2.445705, 1, 1, 1, 1, 1,
0.328497, 0.4913702, 0.5608563, 0, 0, 1, 1, 1,
0.3287394, 0.4412341, 2.331702, 1, 0, 0, 1, 1,
0.3307008, 1.487123, -0.6149098, 1, 0, 0, 1, 1,
0.3318628, 1.311643, -0.6175566, 1, 0, 0, 1, 1,
0.33504, 2.300773, -0.184245, 1, 0, 0, 1, 1,
0.3426431, -0.1376953, 2.159763, 1, 0, 0, 1, 1,
0.3459972, -0.1052663, 2.880276, 0, 0, 0, 1, 1,
0.3562613, 0.3543223, -0.001637419, 0, 0, 0, 1, 1,
0.3569, 1.004056, 0.8565019, 0, 0, 0, 1, 1,
0.3683174, -0.1929659, 3.244513, 0, 0, 0, 1, 1,
0.3720709, -0.09392343, 0.4026827, 0, 0, 0, 1, 1,
0.3730446, -0.5759011, 2.285876, 0, 0, 0, 1, 1,
0.3732014, 0.2214453, 0.2918577, 0, 0, 0, 1, 1,
0.3865263, -2.728964, 3.275346, 1, 1, 1, 1, 1,
0.3888715, -0.5009724, 2.949494, 1, 1, 1, 1, 1,
0.388997, -0.3673433, 2.20863, 1, 1, 1, 1, 1,
0.3904286, -0.3473561, 0.1149426, 1, 1, 1, 1, 1,
0.3912617, -1.155612, 2.739268, 1, 1, 1, 1, 1,
0.3983792, 0.3736489, 1.599716, 1, 1, 1, 1, 1,
0.4026254, -1.283967, 2.832469, 1, 1, 1, 1, 1,
0.4059297, -0.05999476, 1.246309, 1, 1, 1, 1, 1,
0.4083148, -1.152784, 4.967798, 1, 1, 1, 1, 1,
0.4087205, 0.1088166, 2.276141, 1, 1, 1, 1, 1,
0.4122589, -0.5935352, 3.142157, 1, 1, 1, 1, 1,
0.4129388, 1.236572, 0.3689543, 1, 1, 1, 1, 1,
0.4134595, 2.281038, 0.7143145, 1, 1, 1, 1, 1,
0.4179597, -0.4725513, 1.2319, 1, 1, 1, 1, 1,
0.4182312, -0.7541024, 3.919339, 1, 1, 1, 1, 1,
0.4192622, 1.184062, 1.649754, 0, 0, 1, 1, 1,
0.4206537, -2.153642, 1.607451, 1, 0, 0, 1, 1,
0.4230955, 0.4700048, -0.04698069, 1, 0, 0, 1, 1,
0.4231619, 2.615954, -0.5998263, 1, 0, 0, 1, 1,
0.4362678, 0.7739387, 2.496437, 1, 0, 0, 1, 1,
0.4367734, 0.1068951, 1.940301, 1, 0, 0, 1, 1,
0.4489057, -1.281478, 3.284919, 0, 0, 0, 1, 1,
0.4526536, 1.079532, 1.879445, 0, 0, 0, 1, 1,
0.4569755, 0.595716, 0.76739, 0, 0, 0, 1, 1,
0.4596294, 0.4084889, 3.634186, 0, 0, 0, 1, 1,
0.4599974, -1.157962, 2.186075, 0, 0, 0, 1, 1,
0.460696, -1.977194, 3.654345, 0, 0, 0, 1, 1,
0.465847, 0.932154, -0.3635054, 0, 0, 0, 1, 1,
0.4673352, -1.151011, 2.406769, 1, 1, 1, 1, 1,
0.4784264, -1.172261, 3.999467, 1, 1, 1, 1, 1,
0.4825447, 1.489461, 0.9798796, 1, 1, 1, 1, 1,
0.4831192, 0.8411065, 2.023878, 1, 1, 1, 1, 1,
0.4835043, 0.2369014, 1.124564, 1, 1, 1, 1, 1,
0.4849275, 0.6040336, 0.6139625, 1, 1, 1, 1, 1,
0.4866071, -0.05905039, 1.781308, 1, 1, 1, 1, 1,
0.4905753, -1.615534, 2.903795, 1, 1, 1, 1, 1,
0.4918762, 0.9677054, 0.3596568, 1, 1, 1, 1, 1,
0.4919163, -0.3971682, 1.591672, 1, 1, 1, 1, 1,
0.4928712, -2.934133, 3.080424, 1, 1, 1, 1, 1,
0.4965353, -0.6856241, 1.439913, 1, 1, 1, 1, 1,
0.498583, 1.972057, -0.05133693, 1, 1, 1, 1, 1,
0.4991428, 0.2494154, 1.418256, 1, 1, 1, 1, 1,
0.5017602, 0.4052693, -0.4705378, 1, 1, 1, 1, 1,
0.5019063, 0.7076622, 1.736197, 0, 0, 1, 1, 1,
0.5065958, -1.048679, 3.538527, 1, 0, 0, 1, 1,
0.5078425, -1.118489, 4.825201, 1, 0, 0, 1, 1,
0.5160848, -0.4227345, 3.545208, 1, 0, 0, 1, 1,
0.5162728, 2.72398, 0.9102637, 1, 0, 0, 1, 1,
0.5198123, 1.030057, 0.7380361, 1, 0, 0, 1, 1,
0.5232604, 0.6825849, -0.9746953, 0, 0, 0, 1, 1,
0.5253675, -2.179103, 2.556241, 0, 0, 0, 1, 1,
0.5270367, 0.09765328, 1.181295, 0, 0, 0, 1, 1,
0.5270575, 1.436748, 0.8244834, 0, 0, 0, 1, 1,
0.5297084, 0.4265451, -1.196404, 0, 0, 0, 1, 1,
0.5319805, -1.308908, 2.90287, 0, 0, 0, 1, 1,
0.534364, -0.1237331, 0.7914053, 0, 0, 0, 1, 1,
0.5384509, -1.362503, 1.892475, 1, 1, 1, 1, 1,
0.5406812, 1.032852, -0.8033828, 1, 1, 1, 1, 1,
0.540693, -0.1879171, 2.687991, 1, 1, 1, 1, 1,
0.5439582, 0.09723612, 0.3139914, 1, 1, 1, 1, 1,
0.5458575, -2.441958, 1.976291, 1, 1, 1, 1, 1,
0.5460966, -1.076346, 1.430348, 1, 1, 1, 1, 1,
0.5495967, 2.202667, -0.8661508, 1, 1, 1, 1, 1,
0.549683, 0.04453107, 1.26821, 1, 1, 1, 1, 1,
0.5503629, -1.665789, 2.957807, 1, 1, 1, 1, 1,
0.5507352, 1.074004, -0.2232606, 1, 1, 1, 1, 1,
0.5554778, -0.3838175, 4.853601, 1, 1, 1, 1, 1,
0.5576406, 0.83107, -1.84919, 1, 1, 1, 1, 1,
0.5614137, 0.4419847, 1.582828, 1, 1, 1, 1, 1,
0.5638366, -1.206648, 2.718121, 1, 1, 1, 1, 1,
0.5649942, -0.8944411, 1.450206, 1, 1, 1, 1, 1,
0.5681027, 0.9124917, 0.1251554, 0, 0, 1, 1, 1,
0.5695677, 0.5028495, 0.874996, 1, 0, 0, 1, 1,
0.5747603, 1.101338, -0.13147, 1, 0, 0, 1, 1,
0.5801064, -0.1833404, 3.697759, 1, 0, 0, 1, 1,
0.5807412, 0.5639458, 2.100831, 1, 0, 0, 1, 1,
0.5820817, -1.365823, 2.664733, 1, 0, 0, 1, 1,
0.5857939, -0.951627, 1.868509, 0, 0, 0, 1, 1,
0.5858244, -0.2333373, -0.2598231, 0, 0, 0, 1, 1,
0.5871189, 0.6324268, 2.22215, 0, 0, 0, 1, 1,
0.5901612, -1.188873, 2.912162, 0, 0, 0, 1, 1,
0.5952599, -0.5150947, 1.755352, 0, 0, 0, 1, 1,
0.5977822, -0.6482436, 1.954753, 0, 0, 0, 1, 1,
0.5996013, 0.3600102, -0.1084209, 0, 0, 0, 1, 1,
0.6034265, -0.2348664, 1.149633, 1, 1, 1, 1, 1,
0.6096047, -0.1514216, 2.83164, 1, 1, 1, 1, 1,
0.6128091, 1.925532, 0.6197675, 1, 1, 1, 1, 1,
0.6136079, 0.3977199, 0.6835012, 1, 1, 1, 1, 1,
0.617368, -0.7161592, 5.467964, 1, 1, 1, 1, 1,
0.6217642, 1.006307, 0.7140121, 1, 1, 1, 1, 1,
0.6219239, 0.1768181, 1.134989, 1, 1, 1, 1, 1,
0.6298226, -0.285176, 1.498015, 1, 1, 1, 1, 1,
0.6308177, 0.3353026, 1.960004, 1, 1, 1, 1, 1,
0.6321327, -1.881782, 1.721087, 1, 1, 1, 1, 1,
0.6347892, 0.5508502, 0.9282748, 1, 1, 1, 1, 1,
0.6384705, -1.263552, 1.864527, 1, 1, 1, 1, 1,
0.6439125, 1.163691, 0.2972476, 1, 1, 1, 1, 1,
0.6515097, 0.2590156, 2.983315, 1, 1, 1, 1, 1,
0.6534423, -0.7232666, 3.125213, 1, 1, 1, 1, 1,
0.653504, 1.451867, -0.07533359, 0, 0, 1, 1, 1,
0.6564506, 0.2368024, -0.5044896, 1, 0, 0, 1, 1,
0.656543, 1.584952, 0.9186625, 1, 0, 0, 1, 1,
0.6604031, 1.648478, -0.2535454, 1, 0, 0, 1, 1,
0.6638425, -1.008788, 2.51253, 1, 0, 0, 1, 1,
0.6681566, 0.4981722, 1.17929, 1, 0, 0, 1, 1,
0.6714384, 0.7705501, 1.386641, 0, 0, 0, 1, 1,
0.6782429, -0.4928356, 3.486138, 0, 0, 0, 1, 1,
0.6802456, 0.4088639, 2.0915, 0, 0, 0, 1, 1,
0.6819309, 1.494778, -0.5277276, 0, 0, 0, 1, 1,
0.6886017, 1.341638, 1.919999, 0, 0, 0, 1, 1,
0.6906602, 0.6027873, 0.003427638, 0, 0, 0, 1, 1,
0.6921738, -0.7313167, 1.756187, 0, 0, 0, 1, 1,
0.69473, -1.739604, 4.795331, 1, 1, 1, 1, 1,
0.6961092, -0.1076709, 1.940861, 1, 1, 1, 1, 1,
0.696545, 0.419917, -0.1743322, 1, 1, 1, 1, 1,
0.6991538, -0.4550318, 1.37819, 1, 1, 1, 1, 1,
0.7027961, -0.6383703, 4.322832, 1, 1, 1, 1, 1,
0.7031334, -0.3211835, 1.435795, 1, 1, 1, 1, 1,
0.7050762, 0.9440414, 1.675246, 1, 1, 1, 1, 1,
0.7099764, -0.7140802, 0.9650555, 1, 1, 1, 1, 1,
0.7137797, -0.2475989, 2.190757, 1, 1, 1, 1, 1,
0.7154524, -1.496939, 3.312937, 1, 1, 1, 1, 1,
0.7189771, 0.3832931, 0.4005108, 1, 1, 1, 1, 1,
0.7192337, 1.253114, -0.884104, 1, 1, 1, 1, 1,
0.721058, -0.6907182, 2.003804, 1, 1, 1, 1, 1,
0.7284172, 0.06412652, 0.8524217, 1, 1, 1, 1, 1,
0.732115, 0.04302508, 1.884968, 1, 1, 1, 1, 1,
0.7382097, -0.2796622, 3.122213, 0, 0, 1, 1, 1,
0.7425679, -2.303939, 2.129106, 1, 0, 0, 1, 1,
0.747533, -2.738535, 2.469938, 1, 0, 0, 1, 1,
0.7481309, -0.03689652, 1.394308, 1, 0, 0, 1, 1,
0.7482756, -0.147892, 0.5952873, 1, 0, 0, 1, 1,
0.748586, -0.9431532, 1.875831, 1, 0, 0, 1, 1,
0.7533838, -0.333819, 1.362962, 0, 0, 0, 1, 1,
0.756514, -0.002701169, 1.002628, 0, 0, 0, 1, 1,
0.7612442, 0.9972297, -1.269249, 0, 0, 0, 1, 1,
0.7623828, -0.6912583, 2.117174, 0, 0, 0, 1, 1,
0.7644516, -0.4678645, 1.617336, 0, 0, 0, 1, 1,
0.7689794, 0.8590504, 0.9217544, 0, 0, 0, 1, 1,
0.7692846, -0.04197241, 1.380523, 0, 0, 0, 1, 1,
0.7739367, 1.028756, -0.003312981, 1, 1, 1, 1, 1,
0.7797779, 0.3122702, 2.608494, 1, 1, 1, 1, 1,
0.7798199, 1.44961, -1.620161, 1, 1, 1, 1, 1,
0.7824528, 0.03540964, 2.60693, 1, 1, 1, 1, 1,
0.7869151, -1.580344, 0.6002836, 1, 1, 1, 1, 1,
0.789267, 0.7461575, -0.618037, 1, 1, 1, 1, 1,
0.7909536, -1.267043, 0.7145709, 1, 1, 1, 1, 1,
0.7954674, -0.6917375, 1.65892, 1, 1, 1, 1, 1,
0.7982107, -2.746401, 3.457855, 1, 1, 1, 1, 1,
0.8015308, -0.703052, 1.020823, 1, 1, 1, 1, 1,
0.8020863, -0.1293967, 2.362937, 1, 1, 1, 1, 1,
0.8049234, 2.368834, 0.2860944, 1, 1, 1, 1, 1,
0.8108681, -0.5777212, 1.981012, 1, 1, 1, 1, 1,
0.8119105, -0.6362795, -0.1696733, 1, 1, 1, 1, 1,
0.8149893, 0.5601436, 2.114028, 1, 1, 1, 1, 1,
0.8233874, 0.004254691, -0.6942595, 0, 0, 1, 1, 1,
0.8248779, -2.962507, 3.289304, 1, 0, 0, 1, 1,
0.8274508, -0.3704751, 0.82674, 1, 0, 0, 1, 1,
0.827763, 1.206682, 1.854306, 1, 0, 0, 1, 1,
0.8322387, -0.847871, 2.188747, 1, 0, 0, 1, 1,
0.8360755, 0.4923058, 2.217935, 1, 0, 0, 1, 1,
0.8434479, 1.916306, -1.521482, 0, 0, 0, 1, 1,
0.8440059, -0.2365788, 1.888178, 0, 0, 0, 1, 1,
0.8453683, -1.611156, 2.70422, 0, 0, 0, 1, 1,
0.8453817, 0.3531096, 0.08252481, 0, 0, 0, 1, 1,
0.8515656, -1.531566, 5.278596, 0, 0, 0, 1, 1,
0.8542143, -0.01047424, 0.6409687, 0, 0, 0, 1, 1,
0.8585878, 1.242386, 1.589396, 0, 0, 0, 1, 1,
0.8595802, -0.4402224, 0.9935117, 1, 1, 1, 1, 1,
0.8629109, -0.9561208, 2.763701, 1, 1, 1, 1, 1,
0.8631887, -0.6397774, 0.8006592, 1, 1, 1, 1, 1,
0.8665321, 0.007924531, 1.388518, 1, 1, 1, 1, 1,
0.867759, 0.9032044, 1.797469, 1, 1, 1, 1, 1,
0.867999, 0.6220201, 2.055068, 1, 1, 1, 1, 1,
0.8680522, 1.118329, 1.25679, 1, 1, 1, 1, 1,
0.8737594, -0.4045474, 3.438362, 1, 1, 1, 1, 1,
0.8795075, -0.61862, 1.175427, 1, 1, 1, 1, 1,
0.8799174, -0.5647359, 3.286551, 1, 1, 1, 1, 1,
0.8956117, -0.5470404, 1.431709, 1, 1, 1, 1, 1,
0.8981317, -0.00130833, 1.583272, 1, 1, 1, 1, 1,
0.9036073, 0.769848, 1.901184, 1, 1, 1, 1, 1,
0.9044483, 0.911708, 0.5870281, 1, 1, 1, 1, 1,
0.9080251, 0.5260593, 0.3870301, 1, 1, 1, 1, 1,
0.9155935, -1.747388, 1.701545, 0, 0, 1, 1, 1,
0.9341038, 0.0347026, 0.4781204, 1, 0, 0, 1, 1,
0.9356153, 0.4881373, 0.8442695, 1, 0, 0, 1, 1,
0.94587, -0.28153, 2.572598, 1, 0, 0, 1, 1,
0.9478637, -0.5296616, 2.284083, 1, 0, 0, 1, 1,
0.9564619, -0.6091177, 3.312075, 1, 0, 0, 1, 1,
0.9590294, -0.9522192, 4.438604, 0, 0, 0, 1, 1,
0.9625542, 1.443612, 1.313152, 0, 0, 0, 1, 1,
0.9734955, 0.07795032, 0.7502992, 0, 0, 0, 1, 1,
0.9774756, -1.337305, 3.328478, 0, 0, 0, 1, 1,
0.9833677, 1.020061, 0.6214014, 0, 0, 0, 1, 1,
0.984087, 1.114946, 2.396573, 0, 0, 0, 1, 1,
0.987956, -2.464895, 3.568476, 0, 0, 0, 1, 1,
0.9941623, 1.50007, 1.295481, 1, 1, 1, 1, 1,
0.9985496, -0.9156234, 3.31028, 1, 1, 1, 1, 1,
1.003348, -1.839704, 3.141237, 1, 1, 1, 1, 1,
1.006467, -0.1568099, 3.676348, 1, 1, 1, 1, 1,
1.008999, -3.017601, 1.875628, 1, 1, 1, 1, 1,
1.010478, -0.9660583, 1.594082, 1, 1, 1, 1, 1,
1.012678, -1.216396, 0.9206397, 1, 1, 1, 1, 1,
1.012711, 0.4939764, 4.466278, 1, 1, 1, 1, 1,
1.015267, -0.5123912, 1.222702, 1, 1, 1, 1, 1,
1.016451, 0.01824159, 1.475614, 1, 1, 1, 1, 1,
1.016842, -0.2145287, 3.110642, 1, 1, 1, 1, 1,
1.024431, 1.774066, 2.035782, 1, 1, 1, 1, 1,
1.030342, 0.8755618, 2.267405, 1, 1, 1, 1, 1,
1.03093, -0.531624, 3.822539, 1, 1, 1, 1, 1,
1.035589, 0.5730138, 0.7146686, 1, 1, 1, 1, 1,
1.038242, 0.6513872, 2.006727, 0, 0, 1, 1, 1,
1.043757, 0.5774428, -1.427294, 1, 0, 0, 1, 1,
1.051752, 0.03722139, 2.126448, 1, 0, 0, 1, 1,
1.067442, -0.3395945, 2.367989, 1, 0, 0, 1, 1,
1.06943, -0.1055734, 4.060115, 1, 0, 0, 1, 1,
1.071118, 0.7103151, 0.6757053, 1, 0, 0, 1, 1,
1.077224, 0.4066707, -0.1815507, 0, 0, 0, 1, 1,
1.084255, 0.06445409, 2.494745, 0, 0, 0, 1, 1,
1.091308, -1.350002, 3.006101, 0, 0, 0, 1, 1,
1.093802, 0.08226066, 1.065327, 0, 0, 0, 1, 1,
1.102689, -1.342668, 2.733536, 0, 0, 0, 1, 1,
1.103579, -0.1625347, 0.2624348, 0, 0, 0, 1, 1,
1.12274, -0.9493638, 4.955924, 0, 0, 0, 1, 1,
1.123742, 0.07563128, 2.220648, 1, 1, 1, 1, 1,
1.125537, 0.583059, 1.141807, 1, 1, 1, 1, 1,
1.126812, -0.7989957, 2.677743, 1, 1, 1, 1, 1,
1.13096, -0.5157902, 0.8835694, 1, 1, 1, 1, 1,
1.138007, -0.7088542, 2.685885, 1, 1, 1, 1, 1,
1.139867, -1.924973, 2.829751, 1, 1, 1, 1, 1,
1.143272, 0.4567217, -0.06469455, 1, 1, 1, 1, 1,
1.147624, -0.2757848, 1.298878, 1, 1, 1, 1, 1,
1.150169, 0.1557159, 0.6142488, 1, 1, 1, 1, 1,
1.165572, 0.6115003, 2.449041, 1, 1, 1, 1, 1,
1.173564, -2.082125, 1.806715, 1, 1, 1, 1, 1,
1.174054, 0.4331053, 1.568715, 1, 1, 1, 1, 1,
1.178589, 1.194416, 2.483704, 1, 1, 1, 1, 1,
1.182503, 0.4230461, 1.130745, 1, 1, 1, 1, 1,
1.186033, -0.3670679, 1.998129, 1, 1, 1, 1, 1,
1.195, 2.151029, 1.067838, 0, 0, 1, 1, 1,
1.199091, 0.4875505, 0.5022566, 1, 0, 0, 1, 1,
1.19978, -0.06373183, 1.181793, 1, 0, 0, 1, 1,
1.202144, -0.4240613, 1.861924, 1, 0, 0, 1, 1,
1.20929, 0.4041701, 2.377701, 1, 0, 0, 1, 1,
1.210304, 0.7256703, -0.6311873, 1, 0, 0, 1, 1,
1.217295, -0.1761696, 2.588133, 0, 0, 0, 1, 1,
1.232467, -1.9461, 2.572278, 0, 0, 0, 1, 1,
1.237632, -0.4950714, 1.368687, 0, 0, 0, 1, 1,
1.251989, 0.6964715, 1.541988, 0, 0, 0, 1, 1,
1.263789, 0.591108, 1.592179, 0, 0, 0, 1, 1,
1.264591, 2.136975, 0.1390829, 0, 0, 0, 1, 1,
1.264771, 1.001321, 0.1513671, 0, 0, 0, 1, 1,
1.265914, -0.02607048, 1.15314, 1, 1, 1, 1, 1,
1.288148, -0.2994552, 1.69735, 1, 1, 1, 1, 1,
1.288493, 0.4811219, 1.14697, 1, 1, 1, 1, 1,
1.28961, 1.682247, 1.118734, 1, 1, 1, 1, 1,
1.290433, 0.05588346, 3.803165, 1, 1, 1, 1, 1,
1.319017, 0.1026977, 1.190829, 1, 1, 1, 1, 1,
1.320381, -1.281934, 1.26109, 1, 1, 1, 1, 1,
1.325908, -0.1333979, 2.388592, 1, 1, 1, 1, 1,
1.352802, 0.980783, 0.431916, 1, 1, 1, 1, 1,
1.357713, 1.016896, -1.712018, 1, 1, 1, 1, 1,
1.359134, 1.338174, 2.438063, 1, 1, 1, 1, 1,
1.362697, -1.018583, 2.993713, 1, 1, 1, 1, 1,
1.366268, 0.4815198, 0.659223, 1, 1, 1, 1, 1,
1.383956, -2.009903, 1.599301, 1, 1, 1, 1, 1,
1.386633, 2.085436, 1.141123, 1, 1, 1, 1, 1,
1.388419, -0.4589912, 2.386386, 0, 0, 1, 1, 1,
1.389002, 1.04635, -0.1308488, 1, 0, 0, 1, 1,
1.389487, -0.2184804, 1.152058, 1, 0, 0, 1, 1,
1.389771, -0.8387371, 1.384797, 1, 0, 0, 1, 1,
1.395351, 0.3207707, 0.7847714, 1, 0, 0, 1, 1,
1.400494, 1.281097, 0.2627001, 1, 0, 0, 1, 1,
1.40099, 1.286515, 0.8663531, 0, 0, 0, 1, 1,
1.418655, -0.7766272, 3.739266, 0, 0, 0, 1, 1,
1.420261, -1.957718, 2.690408, 0, 0, 0, 1, 1,
1.432863, -1.262891, 1.002024, 0, 0, 0, 1, 1,
1.444387, -0.1613837, 2.123155, 0, 0, 0, 1, 1,
1.444728, 1.111156, 0.3759844, 0, 0, 0, 1, 1,
1.44808, -2.579806, 3.009616, 0, 0, 0, 1, 1,
1.467922, 0.5392755, 2.394674, 1, 1, 1, 1, 1,
1.470004, -0.6194145, 2.502073, 1, 1, 1, 1, 1,
1.478611, 0.8503258, 1.443907, 1, 1, 1, 1, 1,
1.481416, 1.485763, -1.063404, 1, 1, 1, 1, 1,
1.491459, 0.0522813, -0.4626504, 1, 1, 1, 1, 1,
1.497598, 0.8179543, 0.2334035, 1, 1, 1, 1, 1,
1.520789, 0.5045852, 2.056447, 1, 1, 1, 1, 1,
1.549739, 1.69661, 1.585359, 1, 1, 1, 1, 1,
1.55103, -0.1418342, 3.10742, 1, 1, 1, 1, 1,
1.566066, -0.3433117, 1.755236, 1, 1, 1, 1, 1,
1.567038, 0.7687818, 3.115068, 1, 1, 1, 1, 1,
1.568024, -0.6243037, 1.825981, 1, 1, 1, 1, 1,
1.568883, -0.7521294, 0.8178427, 1, 1, 1, 1, 1,
1.569325, -0.5203395, 2.414439, 1, 1, 1, 1, 1,
1.57363, -0.6283603, 2.171595, 1, 1, 1, 1, 1,
1.589262, 0.03641843, -0.1290562, 0, 0, 1, 1, 1,
1.59724, 2.361536, 0.4666483, 1, 0, 0, 1, 1,
1.598125, -1.160333, 1.562145, 1, 0, 0, 1, 1,
1.60032, -1.039998, 1.315715, 1, 0, 0, 1, 1,
1.603781, -0.4610165, 1.249576, 1, 0, 0, 1, 1,
1.604552, 1.000211, 0.07733929, 1, 0, 0, 1, 1,
1.611891, -0.7381386, 1.717103, 0, 0, 0, 1, 1,
1.62369, 0.3120371, 2.305651, 0, 0, 0, 1, 1,
1.638678, 0.7995369, -0.62074, 0, 0, 0, 1, 1,
1.650747, 0.7343093, -0.2500381, 0, 0, 0, 1, 1,
1.659819, -1.615299, 3.352638, 0, 0, 0, 1, 1,
1.664006, 1.108776, 1.777673, 0, 0, 0, 1, 1,
1.689126, 0.6324349, 1.420208, 0, 0, 0, 1, 1,
1.694827, -0.3758481, 2.826282, 1, 1, 1, 1, 1,
1.725663, -1.235754, 0.7107869, 1, 1, 1, 1, 1,
1.728204, 1.161889, 0.5578918, 1, 1, 1, 1, 1,
1.744875, -1.848045, 1.635234, 1, 1, 1, 1, 1,
1.749544, 0.3314725, 0.418733, 1, 1, 1, 1, 1,
1.758802, 0.925106, 1.141024, 1, 1, 1, 1, 1,
1.768711, -2.232034, 1.377393, 1, 1, 1, 1, 1,
1.774905, -0.2061333, 1.107578, 1, 1, 1, 1, 1,
1.781493, -1.903559, 2.46963, 1, 1, 1, 1, 1,
1.789249, 0.1786401, 1.931874, 1, 1, 1, 1, 1,
1.812529, 0.3951286, 1.038352, 1, 1, 1, 1, 1,
1.815419, -0.3078445, 2.162115, 1, 1, 1, 1, 1,
1.824936, 2.61411, -0.1094589, 1, 1, 1, 1, 1,
1.826985, -1.377433, 2.558754, 1, 1, 1, 1, 1,
1.837823, -0.4001403, -0.6581749, 1, 1, 1, 1, 1,
1.839815, -1.047882, 1.183888, 0, 0, 1, 1, 1,
1.864051, -0.722882, 2.488273, 1, 0, 0, 1, 1,
1.869261, 0.5000169, 0.1982866, 1, 0, 0, 1, 1,
1.901336, 0.9785026, 0.4946046, 1, 0, 0, 1, 1,
1.92255, -0.867223, 1.676806, 1, 0, 0, 1, 1,
1.935276, -0.4572085, 4.106997, 1, 0, 0, 1, 1,
1.959605, 0.5204412, 0.3672164, 0, 0, 0, 1, 1,
2.037401, 0.4460648, 1.324733, 0, 0, 0, 1, 1,
2.062533, -0.534425, 1.754189, 0, 0, 0, 1, 1,
2.151276, -0.2714432, 2.727013, 0, 0, 0, 1, 1,
2.157962, -0.2825517, 1.498477, 0, 0, 0, 1, 1,
2.165846, -0.1820156, 2.804781, 0, 0, 0, 1, 1,
2.21055, -0.2193517, 0.01638, 0, 0, 0, 1, 1,
2.220857, 0.8231272, 3.168802, 1, 1, 1, 1, 1,
2.395567, 0.5922449, 1.312228, 1, 1, 1, 1, 1,
2.51492, 0.6998603, 2.157606, 1, 1, 1, 1, 1,
2.680561, 0.3703482, -0.2645865, 1, 1, 1, 1, 1,
2.849684, -0.1531965, 2.837702, 1, 1, 1, 1, 1,
2.90413, 0.406198, 0.9895788, 1, 1, 1, 1, 1,
2.93546, 0.6910233, 0.8512001, 1, 1, 1, 1, 1
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
var radius = 9.573032;
var distance = 33.62487;
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
mvMatrix.translate( -0.06499648, 0.2561744, 0.1561582 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.62487);
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
