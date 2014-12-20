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
-3.493493, 0.6784121, -3.55452, 1, 0, 0, 1,
-3.030018, -1.104624, -1.717299, 1, 0.007843138, 0, 1,
-2.813665, -0.6945738, -3.762409, 1, 0.01176471, 0, 1,
-2.745407, -1.077017, -1.128535, 1, 0.01960784, 0, 1,
-2.717183, -0.4117628, -2.771705, 1, 0.02352941, 0, 1,
-2.682647, -1.52321, -3.303802, 1, 0.03137255, 0, 1,
-2.637229, 1.200355, -0.4641425, 1, 0.03529412, 0, 1,
-2.624784, -1.067117, -1.169555, 1, 0.04313726, 0, 1,
-2.620804, -0.3317373, -2.27128, 1, 0.04705882, 0, 1,
-2.514971, 0.1890254, -1.514126, 1, 0.05490196, 0, 1,
-2.42683, -0.1363923, -1.271876, 1, 0.05882353, 0, 1,
-2.274287, -0.5388718, -0.7653794, 1, 0.06666667, 0, 1,
-2.227432, -0.3120341, -0.1933213, 1, 0.07058824, 0, 1,
-2.20809, 1.703572, -0.7297862, 1, 0.07843138, 0, 1,
-2.197544, -1.034474, -1.646321, 1, 0.08235294, 0, 1,
-2.17127, 1.184833, -0.3904883, 1, 0.09019608, 0, 1,
-2.137394, 0.5154477, -2.022099, 1, 0.09411765, 0, 1,
-2.127992, 0.3515563, -2.451382, 1, 0.1019608, 0, 1,
-2.098944, 2.325835, -0.5659571, 1, 0.1098039, 0, 1,
-2.080813, -0.8671123, -2.083508, 1, 0.1137255, 0, 1,
-2.077138, 0.2132929, -1.65492, 1, 0.1215686, 0, 1,
-2.052976, 0.9801081, -1.793877, 1, 0.1254902, 0, 1,
-1.996612, -1.491461, -0.9857382, 1, 0.1333333, 0, 1,
-1.990469, -0.3273336, -0.4392459, 1, 0.1372549, 0, 1,
-1.987717, -0.06414962, -1.703341, 1, 0.145098, 0, 1,
-1.982497, -0.5260966, -1.821187, 1, 0.1490196, 0, 1,
-1.946274, -1.623007, -1.212942, 1, 0.1568628, 0, 1,
-1.931038, 0.3909091, -0.9132129, 1, 0.1607843, 0, 1,
-1.927336, 0.6715279, 0.3299959, 1, 0.1686275, 0, 1,
-1.921003, -0.3884089, -2.974948, 1, 0.172549, 0, 1,
-1.88798, 0.5411961, -1.971635, 1, 0.1803922, 0, 1,
-1.867183, 1.194556, -1.893049, 1, 0.1843137, 0, 1,
-1.824456, -1.306386, -2.822449, 1, 0.1921569, 0, 1,
-1.795245, 0.6844125, -3.020261, 1, 0.1960784, 0, 1,
-1.775301, -0.4105652, -2.377725, 1, 0.2039216, 0, 1,
-1.766636, 0.5583825, -0.5556856, 1, 0.2117647, 0, 1,
-1.742685, -2.31077, -2.890857, 1, 0.2156863, 0, 1,
-1.726911, -0.2649399, -4.334031, 1, 0.2235294, 0, 1,
-1.694437, -0.1916522, -2.710215, 1, 0.227451, 0, 1,
-1.68214, 0.9981251, 0.5146263, 1, 0.2352941, 0, 1,
-1.674024, -0.5528097, -0.5462042, 1, 0.2392157, 0, 1,
-1.659626, 0.4144243, -1.674429, 1, 0.2470588, 0, 1,
-1.658126, 1.603486, -0.7051936, 1, 0.2509804, 0, 1,
-1.65153, 1.397916, -0.2623089, 1, 0.2588235, 0, 1,
-1.649317, -1.016134, -1.794371, 1, 0.2627451, 0, 1,
-1.639775, 0.815517, -1.547235, 1, 0.2705882, 0, 1,
-1.630709, -0.01068094, -0.7858538, 1, 0.2745098, 0, 1,
-1.620318, -0.3964507, -0.2525232, 1, 0.282353, 0, 1,
-1.618178, 2.154283, -0.7404218, 1, 0.2862745, 0, 1,
-1.609374, 0.6542089, -0.9023826, 1, 0.2941177, 0, 1,
-1.608175, -2.01244, -3.076059, 1, 0.3019608, 0, 1,
-1.602054, 1.529172, 0.1754546, 1, 0.3058824, 0, 1,
-1.600427, 0.4084799, -0.9272438, 1, 0.3137255, 0, 1,
-1.59593, -0.2718177, -0.1872894, 1, 0.3176471, 0, 1,
-1.592884, 1.083257, -1.650381, 1, 0.3254902, 0, 1,
-1.586788, 0.08891287, -0.8319318, 1, 0.3294118, 0, 1,
-1.586, 1.298917, -2.17991, 1, 0.3372549, 0, 1,
-1.58285, -0.2310231, 1.151574, 1, 0.3411765, 0, 1,
-1.578648, -0.8506852, -3.353849, 1, 0.3490196, 0, 1,
-1.569396, 0.350042, -2.287891, 1, 0.3529412, 0, 1,
-1.563442, 0.3619729, -1.247027, 1, 0.3607843, 0, 1,
-1.562427, -0.325667, -1.134668, 1, 0.3647059, 0, 1,
-1.53453, 0.1797703, -0.2386716, 1, 0.372549, 0, 1,
-1.530443, -0.5590672, -1.398195, 1, 0.3764706, 0, 1,
-1.528415, -0.4556644, -3.286655, 1, 0.3843137, 0, 1,
-1.507698, -1.98329, -3.370567, 1, 0.3882353, 0, 1,
-1.504543, -0.8383328, -1.268917, 1, 0.3960784, 0, 1,
-1.501472, 0.402406, -0.7501998, 1, 0.4039216, 0, 1,
-1.494349, 0.005008238, -0.5713586, 1, 0.4078431, 0, 1,
-1.491693, 0.7560222, -0.9115431, 1, 0.4156863, 0, 1,
-1.486014, -1.569657, -2.108256, 1, 0.4196078, 0, 1,
-1.466686, -1.845468, -1.89002, 1, 0.427451, 0, 1,
-1.460005, -2.199324, -2.320944, 1, 0.4313726, 0, 1,
-1.432104, -0.7396524, -1.881673, 1, 0.4392157, 0, 1,
-1.429378, 0.4747337, -1.074363, 1, 0.4431373, 0, 1,
-1.426244, -0.3265262, -0.4319761, 1, 0.4509804, 0, 1,
-1.42483, 0.6199529, -0.9991357, 1, 0.454902, 0, 1,
-1.413323, -1.584385, -3.170767, 1, 0.4627451, 0, 1,
-1.403556, -0.9577185, -3.779471, 1, 0.4666667, 0, 1,
-1.4015, 0.9004455, -0.9307467, 1, 0.4745098, 0, 1,
-1.399677, -1.852585, -3.593002, 1, 0.4784314, 0, 1,
-1.386064, 0.1514615, -3.71502, 1, 0.4862745, 0, 1,
-1.373045, -0.1202652, -1.597543, 1, 0.4901961, 0, 1,
-1.368565, -0.6635792, -2.200445, 1, 0.4980392, 0, 1,
-1.348332, -0.04284674, -2.716251, 1, 0.5058824, 0, 1,
-1.347758, -0.3071332, -2.533892, 1, 0.509804, 0, 1,
-1.347536, 0.4168615, 0.3294781, 1, 0.5176471, 0, 1,
-1.347175, 0.1789853, 0.2250027, 1, 0.5215687, 0, 1,
-1.345648, -0.1093472, -1.932786, 1, 0.5294118, 0, 1,
-1.336734, -2.102759, -2.086889, 1, 0.5333334, 0, 1,
-1.327672, -1.232616, -0.7696054, 1, 0.5411765, 0, 1,
-1.324687, -1.241239, -1.915803, 1, 0.5450981, 0, 1,
-1.318609, 2.421458, 1.384081, 1, 0.5529412, 0, 1,
-1.299862, -0.6451702, -0.576119, 1, 0.5568628, 0, 1,
-1.287941, 0.9625072, -1.424809, 1, 0.5647059, 0, 1,
-1.279484, -0.6874813, -2.271603, 1, 0.5686275, 0, 1,
-1.272298, -0.4577009, -2.253915, 1, 0.5764706, 0, 1,
-1.261695, -0.9697719, -3.423275, 1, 0.5803922, 0, 1,
-1.255736, -0.487695, -2.441224, 1, 0.5882353, 0, 1,
-1.245001, 0.04196597, -1.957336, 1, 0.5921569, 0, 1,
-1.236838, -1.36268, -0.912372, 1, 0.6, 0, 1,
-1.236729, 2.021037, -0.6925464, 1, 0.6078432, 0, 1,
-1.22927, 0.7861681, -1.218061, 1, 0.6117647, 0, 1,
-1.220854, -1.689439, -2.658775, 1, 0.6196079, 0, 1,
-1.207182, 0.3865312, -2.365248, 1, 0.6235294, 0, 1,
-1.192388, -0.1833955, -1.158878, 1, 0.6313726, 0, 1,
-1.189581, 0.343727, -0.8973848, 1, 0.6352941, 0, 1,
-1.189528, 0.8840688, -2.349237, 1, 0.6431373, 0, 1,
-1.185779, 0.3525727, -1.400831, 1, 0.6470588, 0, 1,
-1.184886, 0.8476365, -2.114401, 1, 0.654902, 0, 1,
-1.152964, -0.2271082, -1.22545, 1, 0.6588235, 0, 1,
-1.152832, -2.249693, -3.093468, 1, 0.6666667, 0, 1,
-1.14892, 0.9770448, -1.488653, 1, 0.6705883, 0, 1,
-1.147181, 0.2472065, -1.421825, 1, 0.6784314, 0, 1,
-1.1461, 0.6091082, -2.892139, 1, 0.682353, 0, 1,
-1.143886, -1.731245, -4.053859, 1, 0.6901961, 0, 1,
-1.138049, -0.1903539, -0.658042, 1, 0.6941177, 0, 1,
-1.135351, -0.00624972, -1.167854, 1, 0.7019608, 0, 1,
-1.134989, 0.2406845, 0.7911005, 1, 0.7098039, 0, 1,
-1.129658, 0.7737455, -1.762872, 1, 0.7137255, 0, 1,
-1.129511, 0.1327095, -2.723219, 1, 0.7215686, 0, 1,
-1.129494, 1.110872, -1.457713, 1, 0.7254902, 0, 1,
-1.126943, 0.7975065, -2.299315, 1, 0.7333333, 0, 1,
-1.125275, -1.302276, -0.973247, 1, 0.7372549, 0, 1,
-1.111302, 1.251669, -0.3223698, 1, 0.7450981, 0, 1,
-1.100755, -1.75836, -0.9522004, 1, 0.7490196, 0, 1,
-1.093936, -1.546926, -3.956572, 1, 0.7568628, 0, 1,
-1.091228, 0.1936135, -1.252193, 1, 0.7607843, 0, 1,
-1.089501, -0.8266586, -2.805392, 1, 0.7686275, 0, 1,
-1.086167, 0.08648901, -2.972122, 1, 0.772549, 0, 1,
-1.07654, 0.5894697, -2.839737, 1, 0.7803922, 0, 1,
-1.07618, -1.139538, -3.189513, 1, 0.7843137, 0, 1,
-1.07541, -0.2790923, -3.532492, 1, 0.7921569, 0, 1,
-1.074912, -0.1192095, -1.67672, 1, 0.7960784, 0, 1,
-1.069535, -1.113507, -3.627345, 1, 0.8039216, 0, 1,
-1.05993, 0.6423365, -1.684492, 1, 0.8117647, 0, 1,
-1.05639, -0.2375563, -2.290398, 1, 0.8156863, 0, 1,
-1.051342, -0.8526839, -1.563351, 1, 0.8235294, 0, 1,
-1.048658, -0.3903685, -2.176667, 1, 0.827451, 0, 1,
-1.043345, -0.2829437, -0.713344, 1, 0.8352941, 0, 1,
-1.020503, -1.664221, -2.150763, 1, 0.8392157, 0, 1,
-1.012675, 0.8968363, -2.458371, 1, 0.8470588, 0, 1,
-1.009486, -0.338741, -1.420549, 1, 0.8509804, 0, 1,
-1.001941, -1.41678, -1.699085, 1, 0.8588235, 0, 1,
-1.001535, 0.5564232, -3.830807, 1, 0.8627451, 0, 1,
-1.001263, -0.7133445, -2.26186, 1, 0.8705882, 0, 1,
-0.9885417, -0.4000163, -3.152057, 1, 0.8745098, 0, 1,
-0.9848821, 0.787016, -2.578033, 1, 0.8823529, 0, 1,
-0.9667722, -1.553017, -3.714536, 1, 0.8862745, 0, 1,
-0.9599817, -0.6953209, -3.741858, 1, 0.8941177, 0, 1,
-0.9510027, 1.420601, 2.019341, 1, 0.8980392, 0, 1,
-0.9321379, -0.05052845, -1.131051, 1, 0.9058824, 0, 1,
-0.929149, 0.7218571, -0.7935764, 1, 0.9137255, 0, 1,
-0.923871, -0.05969723, -0.4949864, 1, 0.9176471, 0, 1,
-0.9229637, -1.113739, -2.59855, 1, 0.9254902, 0, 1,
-0.9126318, -0.541811, -3.01103, 1, 0.9294118, 0, 1,
-0.9101135, 0.07972471, -2.181163, 1, 0.9372549, 0, 1,
-0.9067057, 0.6640508, -1.764442, 1, 0.9411765, 0, 1,
-0.9035603, 0.03058213, -2.013612, 1, 0.9490196, 0, 1,
-0.89477, 0.1049257, -2.473732, 1, 0.9529412, 0, 1,
-0.8866813, 0.2981192, -2.688432, 1, 0.9607843, 0, 1,
-0.8846992, -0.1176566, -2.243742, 1, 0.9647059, 0, 1,
-0.8842263, -0.8828655, -2.215864, 1, 0.972549, 0, 1,
-0.8737047, 0.4314414, -1.262973, 1, 0.9764706, 0, 1,
-0.8716553, 1.439687, -2.041362, 1, 0.9843137, 0, 1,
-0.8710217, -0.1854783, -2.08556, 1, 0.9882353, 0, 1,
-0.8637137, -0.2033674, -1.275073, 1, 0.9960784, 0, 1,
-0.8597676, -1.298478, -3.306576, 0.9960784, 1, 0, 1,
-0.8497495, 0.5166318, 0.1979065, 0.9921569, 1, 0, 1,
-0.848391, -1.320793, -1.413255, 0.9843137, 1, 0, 1,
-0.8470343, 0.5308489, -2.20601, 0.9803922, 1, 0, 1,
-0.8464709, -1.12208, -3.496773, 0.972549, 1, 0, 1,
-0.843896, 0.2210646, -2.070223, 0.9686275, 1, 0, 1,
-0.8388456, -0.3013816, -2.501733, 0.9607843, 1, 0, 1,
-0.8347801, 0.3441356, -0.939981, 0.9568627, 1, 0, 1,
-0.8328435, 1.482574, -1.040874, 0.9490196, 1, 0, 1,
-0.8301014, -0.7084964, -2.498359, 0.945098, 1, 0, 1,
-0.8294033, 0.07722534, -1.719588, 0.9372549, 1, 0, 1,
-0.8248914, 0.03187374, -0.701556, 0.9333333, 1, 0, 1,
-0.8238913, -0.4734549, -2.760985, 0.9254902, 1, 0, 1,
-0.8211157, 1.280472, -0.1827718, 0.9215686, 1, 0, 1,
-0.8202701, -0.4580564, -0.8414625, 0.9137255, 1, 0, 1,
-0.8129078, -1.796379, -3.211582, 0.9098039, 1, 0, 1,
-0.8100325, -0.1328324, -1.77921, 0.9019608, 1, 0, 1,
-0.8095165, 0.3256895, -0.5743747, 0.8941177, 1, 0, 1,
-0.8085381, 1.361724, -0.205171, 0.8901961, 1, 0, 1,
-0.8075933, 2.072152, 0.5807429, 0.8823529, 1, 0, 1,
-0.8031836, -0.3107511, -2.536641, 0.8784314, 1, 0, 1,
-0.8020015, 0.2678369, -1.344243, 0.8705882, 1, 0, 1,
-0.7940847, 0.4573657, -2.193876, 0.8666667, 1, 0, 1,
-0.7934395, -0.7786044, -2.443502, 0.8588235, 1, 0, 1,
-0.7899583, 0.1622211, -0.8122247, 0.854902, 1, 0, 1,
-0.7879707, -1.840738, -4.609105, 0.8470588, 1, 0, 1,
-0.7870209, -0.08950264, -2.11992, 0.8431373, 1, 0, 1,
-0.784165, 0.5553824, -3.823128, 0.8352941, 1, 0, 1,
-0.78293, -0.7515492, -1.419177, 0.8313726, 1, 0, 1,
-0.7822815, -0.3515385, -2.166587, 0.8235294, 1, 0, 1,
-0.7806397, 0.1520356, -0.7783726, 0.8196079, 1, 0, 1,
-0.7726851, -0.5119829, -0.8294197, 0.8117647, 1, 0, 1,
-0.7687497, -0.2953327, -0.09060479, 0.8078431, 1, 0, 1,
-0.7678143, 0.2278155, 0.1250612, 0.8, 1, 0, 1,
-0.7618554, -0.7682426, -2.826197, 0.7921569, 1, 0, 1,
-0.7575718, -0.03331706, -1.579381, 0.7882353, 1, 0, 1,
-0.7476996, -1.272155, -3.237686, 0.7803922, 1, 0, 1,
-0.7420738, 0.3810141, -0.8741857, 0.7764706, 1, 0, 1,
-0.7401014, -1.735478, -1.757768, 0.7686275, 1, 0, 1,
-0.7302606, 0.9146302, -0.06095575, 0.7647059, 1, 0, 1,
-0.7290228, 0.04111483, -1.748204, 0.7568628, 1, 0, 1,
-0.726593, 0.5153839, -0.2944058, 0.7529412, 1, 0, 1,
-0.725436, -1.360528, -2.030256, 0.7450981, 1, 0, 1,
-0.7247577, -0.05344764, -1.853104, 0.7411765, 1, 0, 1,
-0.7216309, -0.971366, -1.580091, 0.7333333, 1, 0, 1,
-0.7208042, 1.34097, 2.086389, 0.7294118, 1, 0, 1,
-0.7170909, 1.736851, 0.01325577, 0.7215686, 1, 0, 1,
-0.7161785, -0.3500086, -3.952133, 0.7176471, 1, 0, 1,
-0.7125029, -0.9106855, -2.459416, 0.7098039, 1, 0, 1,
-0.7090396, -0.526275, -2.616073, 0.7058824, 1, 0, 1,
-0.7081587, 0.6777209, -1.605489, 0.6980392, 1, 0, 1,
-0.7079283, 0.34567, -0.84183, 0.6901961, 1, 0, 1,
-0.6995737, 0.7663096, -1.034349, 0.6862745, 1, 0, 1,
-0.6957306, -0.002646852, -1.65286, 0.6784314, 1, 0, 1,
-0.6929077, 1.112928, -2.322436, 0.6745098, 1, 0, 1,
-0.6879499, -0.5596551, -2.724311, 0.6666667, 1, 0, 1,
-0.6833329, -0.2859041, -1.07487, 0.6627451, 1, 0, 1,
-0.6700255, 0.1670732, -0.8363507, 0.654902, 1, 0, 1,
-0.6678114, -1.901576, -2.169084, 0.6509804, 1, 0, 1,
-0.6654321, 2.889681, -0.7358388, 0.6431373, 1, 0, 1,
-0.6621405, -0.8194096, -2.040359, 0.6392157, 1, 0, 1,
-0.6591496, -0.7389154, -1.470381, 0.6313726, 1, 0, 1,
-0.6582232, 1.777013, -0.1248862, 0.627451, 1, 0, 1,
-0.6579316, -2.342049, -4.943661, 0.6196079, 1, 0, 1,
-0.6577916, -0.2680194, -2.282821, 0.6156863, 1, 0, 1,
-0.6486955, -0.08177131, -3.949745, 0.6078432, 1, 0, 1,
-0.6479861, 1.323728, -0.6024283, 0.6039216, 1, 0, 1,
-0.6463196, 1.082486, -1.165096, 0.5960785, 1, 0, 1,
-0.6418551, 0.07775043, -0.109268, 0.5882353, 1, 0, 1,
-0.6387486, -0.4560082, -1.746223, 0.5843138, 1, 0, 1,
-0.6382225, 0.0208782, -2.241526, 0.5764706, 1, 0, 1,
-0.6332442, -0.9765594, -2.252914, 0.572549, 1, 0, 1,
-0.6309716, 1.423982, -2.201775, 0.5647059, 1, 0, 1,
-0.6259517, 1.267789, 0.3085172, 0.5607843, 1, 0, 1,
-0.617562, -0.727042, -1.609115, 0.5529412, 1, 0, 1,
-0.6163535, -0.2541741, -0.7298226, 0.5490196, 1, 0, 1,
-0.6149752, -0.1132676, -2.233649, 0.5411765, 1, 0, 1,
-0.6102082, -0.1624079, -0.3829606, 0.5372549, 1, 0, 1,
-0.6078725, 0.283452, -2.12007, 0.5294118, 1, 0, 1,
-0.6074815, -0.2658203, -1.385549, 0.5254902, 1, 0, 1,
-0.6057187, -1.130976, -2.819314, 0.5176471, 1, 0, 1,
-0.6007796, -0.06485326, -1.725963, 0.5137255, 1, 0, 1,
-0.6005753, 0.3703009, -1.223659, 0.5058824, 1, 0, 1,
-0.5950189, 0.9046202, -1.326321, 0.5019608, 1, 0, 1,
-0.5946307, 0.9667718, -0.935334, 0.4941176, 1, 0, 1,
-0.5931246, 0.5181671, -0.1302449, 0.4862745, 1, 0, 1,
-0.5910539, -1.021227, -2.721079, 0.4823529, 1, 0, 1,
-0.5850332, -1.130133, -3.941391, 0.4745098, 1, 0, 1,
-0.5832828, -1.024038, -3.793006, 0.4705882, 1, 0, 1,
-0.5827764, 0.8090004, -0.6807781, 0.4627451, 1, 0, 1,
-0.5811862, -0.2113889, -2.565597, 0.4588235, 1, 0, 1,
-0.5771238, 0.373046, 0.05108091, 0.4509804, 1, 0, 1,
-0.5759398, 0.1108682, -2.125306, 0.4470588, 1, 0, 1,
-0.5745679, -0.2259661, -3.214031, 0.4392157, 1, 0, 1,
-0.5707542, -1.199639, -1.988989, 0.4352941, 1, 0, 1,
-0.5690549, -2.048547, -1.677484, 0.427451, 1, 0, 1,
-0.5579413, -0.1614839, -2.906972, 0.4235294, 1, 0, 1,
-0.5557384, 0.5504457, 0.1052068, 0.4156863, 1, 0, 1,
-0.5531767, -0.8612158, -3.122334, 0.4117647, 1, 0, 1,
-0.5406755, 0.3570113, 0.03236113, 0.4039216, 1, 0, 1,
-0.5390043, -0.6422333, -2.13586, 0.3960784, 1, 0, 1,
-0.5380501, 0.9842064, 0.3473221, 0.3921569, 1, 0, 1,
-0.5363679, 1.428219, -0.2456894, 0.3843137, 1, 0, 1,
-0.5310583, 0.5638149, -1.785968, 0.3803922, 1, 0, 1,
-0.5308362, -0.1513826, -2.133841, 0.372549, 1, 0, 1,
-0.5277371, 0.9037092, -1.425802, 0.3686275, 1, 0, 1,
-0.527563, -0.9741471, -1.655942, 0.3607843, 1, 0, 1,
-0.5273346, -0.07746431, -1.91777, 0.3568628, 1, 0, 1,
-0.525839, 1.274913, -0.3791052, 0.3490196, 1, 0, 1,
-0.5171664, -0.6494768, -1.478913, 0.345098, 1, 0, 1,
-0.5165238, 0.216068, -0.712886, 0.3372549, 1, 0, 1,
-0.5157192, 0.7043087, -2.206595, 0.3333333, 1, 0, 1,
-0.5071055, 0.6972675, -0.511499, 0.3254902, 1, 0, 1,
-0.5064306, 0.446768, 0.9069678, 0.3215686, 1, 0, 1,
-0.5050727, -1.144255, -1.891105, 0.3137255, 1, 0, 1,
-0.501662, 0.9516861, -0.4400211, 0.3098039, 1, 0, 1,
-0.5006528, 0.6415027, -1.936393, 0.3019608, 1, 0, 1,
-0.5000485, 1.669071, 0.36847, 0.2941177, 1, 0, 1,
-0.4961846, 1.305449, -2.197613, 0.2901961, 1, 0, 1,
-0.4949342, 0.3545869, 0.6338739, 0.282353, 1, 0, 1,
-0.4920211, -0.2011404, -3.016056, 0.2784314, 1, 0, 1,
-0.4917594, -1.481086, -5.173345, 0.2705882, 1, 0, 1,
-0.4855899, 0.04553641, -0.1811256, 0.2666667, 1, 0, 1,
-0.4850855, -0.411908, -0.9633238, 0.2588235, 1, 0, 1,
-0.4832457, -2.477011, -2.638588, 0.254902, 1, 0, 1,
-0.4784402, -0.9792442, 0.1043856, 0.2470588, 1, 0, 1,
-0.4754798, -0.3308078, -1.543987, 0.2431373, 1, 0, 1,
-0.4693526, 0.9953431, -0.134794, 0.2352941, 1, 0, 1,
-0.4683591, -0.4169255, -2.720427, 0.2313726, 1, 0, 1,
-0.4659398, -0.9828657, -1.145703, 0.2235294, 1, 0, 1,
-0.4637907, 1.234648, -1.114216, 0.2196078, 1, 0, 1,
-0.4626156, 0.114532, -1.876063, 0.2117647, 1, 0, 1,
-0.4622888, -0.2463358, -2.093724, 0.2078431, 1, 0, 1,
-0.4620676, 0.4081405, -0.8896366, 0.2, 1, 0, 1,
-0.4533384, 0.09290177, -2.514526, 0.1921569, 1, 0, 1,
-0.4525004, -0.3539715, -1.121595, 0.1882353, 1, 0, 1,
-0.4523546, -1.225453, -2.44633, 0.1803922, 1, 0, 1,
-0.4483251, -0.06806152, -3.16178, 0.1764706, 1, 0, 1,
-0.4426576, 1.208304, -1.905035, 0.1686275, 1, 0, 1,
-0.44209, -0.2780509, -2.585664, 0.1647059, 1, 0, 1,
-0.4380972, 0.3415884, -1.131181, 0.1568628, 1, 0, 1,
-0.4373235, -0.8628776, -2.636992, 0.1529412, 1, 0, 1,
-0.4351972, 0.2449039, -2.305294, 0.145098, 1, 0, 1,
-0.4327022, -0.665982, -2.413433, 0.1411765, 1, 0, 1,
-0.4305232, 0.4136687, -0.01641884, 0.1333333, 1, 0, 1,
-0.4303584, -0.3342074, -2.154752, 0.1294118, 1, 0, 1,
-0.4264936, 0.3274877, -1.75428, 0.1215686, 1, 0, 1,
-0.4245296, -0.6074824, -2.535009, 0.1176471, 1, 0, 1,
-0.4227338, -0.1518375, -3.137249, 0.1098039, 1, 0, 1,
-0.4214888, -1.129802, -4.09023, 0.1058824, 1, 0, 1,
-0.4174641, -0.1235497, -0.4459762, 0.09803922, 1, 0, 1,
-0.4110777, -1.828458, -3.586704, 0.09019608, 1, 0, 1,
-0.4066141, -0.1659099, -2.22955, 0.08627451, 1, 0, 1,
-0.4066132, -0.3693329, -2.245296, 0.07843138, 1, 0, 1,
-0.4058823, -0.2709193, -3.183566, 0.07450981, 1, 0, 1,
-0.4055194, 0.03074737, -1.108805, 0.06666667, 1, 0, 1,
-0.4052294, 0.7199475, -1.449899, 0.0627451, 1, 0, 1,
-0.4019576, 0.006750116, 0.03835182, 0.05490196, 1, 0, 1,
-0.3948568, -0.6746733, -1.947215, 0.05098039, 1, 0, 1,
-0.3923496, -1.090985, -2.67242, 0.04313726, 1, 0, 1,
-0.3923061, -1.572191, -4.623317, 0.03921569, 1, 0, 1,
-0.3879126, 0.6368372, 0.4494365, 0.03137255, 1, 0, 1,
-0.384082, 1.217955, -2.025858, 0.02745098, 1, 0, 1,
-0.3693365, 1.589435, -0.2086163, 0.01960784, 1, 0, 1,
-0.3664632, 0.4566211, -0.2325321, 0.01568628, 1, 0, 1,
-0.363817, -1.158328, -3.466786, 0.007843138, 1, 0, 1,
-0.3617139, 2.167601, -1.665309, 0.003921569, 1, 0, 1,
-0.3563195, 1.175063, 0.07462098, 0, 1, 0.003921569, 1,
-0.3555045, -2.372998, -3.764007, 0, 1, 0.01176471, 1,
-0.3526358, 0.5154699, -1.30868, 0, 1, 0.01568628, 1,
-0.3526151, 0.9582992, -0.5976071, 0, 1, 0.02352941, 1,
-0.3494703, -1.350379, -2.749331, 0, 1, 0.02745098, 1,
-0.3489268, -0.245666, -2.289192, 0, 1, 0.03529412, 1,
-0.3471251, 0.4519918, -0.1883251, 0, 1, 0.03921569, 1,
-0.3424754, -0.03731208, -2.939339, 0, 1, 0.04705882, 1,
-0.3419387, 0.7608783, -0.5470611, 0, 1, 0.05098039, 1,
-0.3413708, -0.009290093, -0.8961052, 0, 1, 0.05882353, 1,
-0.3413312, 0.8148675, 0.2141807, 0, 1, 0.0627451, 1,
-0.3412547, 1.619641, 0.5889868, 0, 1, 0.07058824, 1,
-0.340999, -0.921976, -1.790725, 0, 1, 0.07450981, 1,
-0.3391788, -0.1566287, 0.1109348, 0, 1, 0.08235294, 1,
-0.3355862, -0.7029025, -0.3825642, 0, 1, 0.08627451, 1,
-0.3342237, 0.246356, -1.266508, 0, 1, 0.09411765, 1,
-0.3264132, -0.8849609, -3.155876, 0, 1, 0.1019608, 1,
-0.3214277, -0.2314841, -2.611374, 0, 1, 0.1058824, 1,
-0.3183617, 0.6660761, -0.5186948, 0, 1, 0.1137255, 1,
-0.3159519, 0.2469465, 0.1947113, 0, 1, 0.1176471, 1,
-0.3096098, -0.3441838, -3.049083, 0, 1, 0.1254902, 1,
-0.308135, 2.07058, -1.378788, 0, 1, 0.1294118, 1,
-0.3079551, -1.696082, -3.080495, 0, 1, 0.1372549, 1,
-0.306462, -1.020185, -3.403226, 0, 1, 0.1411765, 1,
-0.304487, -0.04995152, -0.1570699, 0, 1, 0.1490196, 1,
-0.3042147, 0.8937499, -0.02967208, 0, 1, 0.1529412, 1,
-0.3036286, -0.6852316, -4.260058, 0, 1, 0.1607843, 1,
-0.2990878, -0.3453127, -1.714836, 0, 1, 0.1647059, 1,
-0.2870157, -0.3358578, -4.088954, 0, 1, 0.172549, 1,
-0.2862069, 1.442566, -0.03057289, 0, 1, 0.1764706, 1,
-0.2830625, 0.8197151, -0.9153476, 0, 1, 0.1843137, 1,
-0.2815481, 0.2977765, 1.329113, 0, 1, 0.1882353, 1,
-0.2803175, -0.4191452, -2.5447, 0, 1, 0.1960784, 1,
-0.2783959, 0.7628921, -1.533547, 0, 1, 0.2039216, 1,
-0.2779567, 1.589165, 0.1275998, 0, 1, 0.2078431, 1,
-0.2732091, 0.1087075, -3.063233, 0, 1, 0.2156863, 1,
-0.2729652, -1.225321, -2.498096, 0, 1, 0.2196078, 1,
-0.2719805, 0.4133413, 0.7210909, 0, 1, 0.227451, 1,
-0.2706811, -0.5014343, -2.416565, 0, 1, 0.2313726, 1,
-0.2686003, -0.3428085, -5.010864, 0, 1, 0.2392157, 1,
-0.2683662, 0.8833827, -0.731654, 0, 1, 0.2431373, 1,
-0.2679957, -0.03546641, -2.164759, 0, 1, 0.2509804, 1,
-0.2665113, 0.4688776, -0.274659, 0, 1, 0.254902, 1,
-0.2651792, 0.3441302, -1.312969, 0, 1, 0.2627451, 1,
-0.263419, 0.09819388, -1.732806, 0, 1, 0.2666667, 1,
-0.2623562, 0.3513267, -0.6999936, 0, 1, 0.2745098, 1,
-0.2615457, -2.16692, -3.971677, 0, 1, 0.2784314, 1,
-0.2589831, 0.5463299, -0.7242413, 0, 1, 0.2862745, 1,
-0.2527468, 0.424483, 0.09340857, 0, 1, 0.2901961, 1,
-0.2422433, 0.1785833, -2.267782, 0, 1, 0.2980392, 1,
-0.2404608, 0.4397858, -1.243413, 0, 1, 0.3058824, 1,
-0.2387629, -0.3593793, -2.881727, 0, 1, 0.3098039, 1,
-0.2382004, 0.8327512, -1.833708, 0, 1, 0.3176471, 1,
-0.2355979, -0.4536455, -1.654813, 0, 1, 0.3215686, 1,
-0.2329971, -1.008826, -4.028494, 0, 1, 0.3294118, 1,
-0.2317711, 2.04634, 0.5354892, 0, 1, 0.3333333, 1,
-0.2264766, 0.41947, -2.25742, 0, 1, 0.3411765, 1,
-0.2255027, 1.613532, 0.05099494, 0, 1, 0.345098, 1,
-0.2161678, 0.006748993, -2.618447, 0, 1, 0.3529412, 1,
-0.2094765, -0.5705377, -0.9044142, 0, 1, 0.3568628, 1,
-0.2023967, -0.8317393, -2.512884, 0, 1, 0.3647059, 1,
-0.1978735, 0.6704694, 1.834572, 0, 1, 0.3686275, 1,
-0.1963153, 1.098331, -0.3074402, 0, 1, 0.3764706, 1,
-0.196018, -0.1755729, -3.494426, 0, 1, 0.3803922, 1,
-0.1928314, -0.3680061, -1.277617, 0, 1, 0.3882353, 1,
-0.190935, 1.854642, 0.8479064, 0, 1, 0.3921569, 1,
-0.190071, 0.2451147, -1.328411, 0, 1, 0.4, 1,
-0.188859, 0.2634818, -0.8578271, 0, 1, 0.4078431, 1,
-0.1816337, -0.8060226, -2.70226, 0, 1, 0.4117647, 1,
-0.1615477, -0.6582745, -4.481857, 0, 1, 0.4196078, 1,
-0.1610945, 0.5489516, -1.417501, 0, 1, 0.4235294, 1,
-0.1552613, 0.1117292, -1.864473, 0, 1, 0.4313726, 1,
-0.1520712, -1.598047, -2.333571, 0, 1, 0.4352941, 1,
-0.150685, -1.72936, -1.472921, 0, 1, 0.4431373, 1,
-0.1471381, 0.9601478, -1.436444, 0, 1, 0.4470588, 1,
-0.1419428, 0.5392159, -0.1317825, 0, 1, 0.454902, 1,
-0.1407821, -0.7427996, -2.637149, 0, 1, 0.4588235, 1,
-0.1389602, 0.4618663, 0.7261415, 0, 1, 0.4666667, 1,
-0.1362487, 0.1441307, -0.903852, 0, 1, 0.4705882, 1,
-0.1362239, 0.7786149, 0.6866478, 0, 1, 0.4784314, 1,
-0.1317609, 0.06729488, -1.242223, 0, 1, 0.4823529, 1,
-0.1294482, -0.7665864, -3.824673, 0, 1, 0.4901961, 1,
-0.1288379, -0.3475333, -3.760361, 0, 1, 0.4941176, 1,
-0.1288093, 1.458919, -1.757462, 0, 1, 0.5019608, 1,
-0.1271718, -2.117671, -3.076144, 0, 1, 0.509804, 1,
-0.1253284, 2.434189, -0.2665979, 0, 1, 0.5137255, 1,
-0.1251107, 0.8541656, -1.376431, 0, 1, 0.5215687, 1,
-0.1246966, -0.2837378, -2.327955, 0, 1, 0.5254902, 1,
-0.1193884, 1.113346, -0.1191407, 0, 1, 0.5333334, 1,
-0.1185733, -0.9816388, -3.702182, 0, 1, 0.5372549, 1,
-0.1179062, -0.5567422, -4.369099, 0, 1, 0.5450981, 1,
-0.1156832, -0.4486229, -3.024854, 0, 1, 0.5490196, 1,
-0.1140471, -0.7052934, -3.142123, 0, 1, 0.5568628, 1,
-0.1025222, 0.5549198, -1.148488, 0, 1, 0.5607843, 1,
-0.09876666, 0.7778151, -0.1899466, 0, 1, 0.5686275, 1,
-0.09748106, 0.4598821, -0.6796069, 0, 1, 0.572549, 1,
-0.09551372, -0.2189172, -3.057064, 0, 1, 0.5803922, 1,
-0.09489602, 1.493684, -1.637464, 0, 1, 0.5843138, 1,
-0.09321111, 0.853435, 0.02454704, 0, 1, 0.5921569, 1,
-0.0911766, -0.5382112, -3.31672, 0, 1, 0.5960785, 1,
-0.08860316, 0.06914144, -0.8388239, 0, 1, 0.6039216, 1,
-0.08574548, -0.7240195, -3.134976, 0, 1, 0.6117647, 1,
-0.08501843, 0.7405449, -0.5604015, 0, 1, 0.6156863, 1,
-0.07608768, -1.342603, -2.293891, 0, 1, 0.6235294, 1,
-0.07586678, -0.3994661, -2.851627, 0, 1, 0.627451, 1,
-0.07487521, 1.881764, -0.7908025, 0, 1, 0.6352941, 1,
-0.07412105, -1.133011, -4.662538, 0, 1, 0.6392157, 1,
-0.07113513, 0.5398816, -0.1009469, 0, 1, 0.6470588, 1,
-0.07060932, 0.3152748, -0.4685709, 0, 1, 0.6509804, 1,
-0.06530457, 0.817241, 1.985673, 0, 1, 0.6588235, 1,
-0.0617597, 1.056555, -0.03494117, 0, 1, 0.6627451, 1,
-0.05924914, 3.013122, 0.8419236, 0, 1, 0.6705883, 1,
-0.05909839, 0.4527354, 0.8023562, 0, 1, 0.6745098, 1,
-0.05573625, -0.1441406, -3.834445, 0, 1, 0.682353, 1,
-0.05186601, -0.5027824, -2.393775, 0, 1, 0.6862745, 1,
-0.05090322, -0.04073219, -2.59638, 0, 1, 0.6941177, 1,
-0.04612688, -0.1337342, -1.858783, 0, 1, 0.7019608, 1,
-0.04611263, 0.2482214, -0.2296594, 0, 1, 0.7058824, 1,
-0.04003694, -0.5100696, -1.975439, 0, 1, 0.7137255, 1,
-0.03354068, -1.793933, -3.227418, 0, 1, 0.7176471, 1,
-0.0240398, -0.9098003, -3.882084, 0, 1, 0.7254902, 1,
-0.02402967, 0.6229592, -0.7065133, 0, 1, 0.7294118, 1,
-0.02207906, -1.475794, -2.829703, 0, 1, 0.7372549, 1,
-0.02010094, -0.173164, -3.14989, 0, 1, 0.7411765, 1,
-0.01003896, -1.057377, -2.054915, 0, 1, 0.7490196, 1,
-0.009121613, -0.8281813, -2.600368, 0, 1, 0.7529412, 1,
-0.008886356, -0.9355091, -3.80471, 0, 1, 0.7607843, 1,
-0.006457699, 1.571196, -0.1918782, 0, 1, 0.7647059, 1,
-0.004917014, 0.3910111, -0.06819883, 0, 1, 0.772549, 1,
-0.002433379, 0.7598633, 0.792722, 0, 1, 0.7764706, 1,
0.004830348, 0.8461373, -0.5691404, 0, 1, 0.7843137, 1,
0.005976697, -0.296406, 2.366559, 0, 1, 0.7882353, 1,
0.0105213, 0.5368409, 1.529611, 0, 1, 0.7960784, 1,
0.01223769, -0.7831433, 3.727321, 0, 1, 0.8039216, 1,
0.01818305, 1.825046, -0.2584686, 0, 1, 0.8078431, 1,
0.02064064, 1.260021, 1.343882, 0, 1, 0.8156863, 1,
0.02314876, -0.8209367, 2.515609, 0, 1, 0.8196079, 1,
0.02336293, -0.1194726, 4.114561, 0, 1, 0.827451, 1,
0.02535495, 1.399416, -1.124404, 0, 1, 0.8313726, 1,
0.02574072, -0.03400756, 3.892672, 0, 1, 0.8392157, 1,
0.0298123, 0.4978883, 0.009793786, 0, 1, 0.8431373, 1,
0.0364157, -0.02323539, 2.201326, 0, 1, 0.8509804, 1,
0.03897556, -0.8462692, 3.02321, 0, 1, 0.854902, 1,
0.04534235, 1.457688, 1.063037, 0, 1, 0.8627451, 1,
0.04726852, 1.936673, -1.933909, 0, 1, 0.8666667, 1,
0.05015585, 1.411473, 0.03856392, 0, 1, 0.8745098, 1,
0.05529283, -0.9018611, 3.293345, 0, 1, 0.8784314, 1,
0.05629078, -1.248938, 2.389921, 0, 1, 0.8862745, 1,
0.05639839, 1.483519, 0.3418403, 0, 1, 0.8901961, 1,
0.05927654, 0.8926661, 0.6173451, 0, 1, 0.8980392, 1,
0.06286484, -1.088411, 2.502815, 0, 1, 0.9058824, 1,
0.06651306, 0.3723733, -2.215026, 0, 1, 0.9098039, 1,
0.06737603, 1.379006, 0.2285864, 0, 1, 0.9176471, 1,
0.06850722, -1.470412, 3.027094, 0, 1, 0.9215686, 1,
0.07393159, 1.26246, 1.296876, 0, 1, 0.9294118, 1,
0.07661279, 0.1848705, 1.814976, 0, 1, 0.9333333, 1,
0.07703324, -0.09641248, 2.479645, 0, 1, 0.9411765, 1,
0.07778268, 1.29801, 0.6669354, 0, 1, 0.945098, 1,
0.08251945, -1.013194, 3.016676, 0, 1, 0.9529412, 1,
0.08687367, 0.3337906, -0.2838421, 0, 1, 0.9568627, 1,
0.0896749, -0.4042351, 3.255918, 0, 1, 0.9647059, 1,
0.09474489, -1.626814, 3.545153, 0, 1, 0.9686275, 1,
0.09493296, -0.9647649, 3.422682, 0, 1, 0.9764706, 1,
0.09658819, -0.7561541, 3.315068, 0, 1, 0.9803922, 1,
0.09758106, -1.078902, 2.054876, 0, 1, 0.9882353, 1,
0.09871257, -0.3159692, 3.750743, 0, 1, 0.9921569, 1,
0.1006907, 0.7833405, -0.7892334, 0, 1, 1, 1,
0.1015734, -0.726939, 1.807019, 0, 0.9921569, 1, 1,
0.1043457, 1.871147, -0.625701, 0, 0.9882353, 1, 1,
0.1043614, -2.765267, 1.309446, 0, 0.9803922, 1, 1,
0.1044379, -0.2340361, 2.238757, 0, 0.9764706, 1, 1,
0.1081919, 0.5698237, -0.7932374, 0, 0.9686275, 1, 1,
0.1091421, 0.9406711, 1.564839, 0, 0.9647059, 1, 1,
0.11408, 1.03306, 0.7841317, 0, 0.9568627, 1, 1,
0.1178369, -0.9799193, 3.402729, 0, 0.9529412, 1, 1,
0.1182503, 0.07167043, 1.017688, 0, 0.945098, 1, 1,
0.1194532, 1.192367, 0.6090392, 0, 0.9411765, 1, 1,
0.120762, -0.5933511, 3.204075, 0, 0.9333333, 1, 1,
0.1218739, 0.9622006, 0.2484063, 0, 0.9294118, 1, 1,
0.1254695, -0.963862, 2.156098, 0, 0.9215686, 1, 1,
0.1255139, -2.254324, 3.149698, 0, 0.9176471, 1, 1,
0.1303939, -0.09785517, 1.93197, 0, 0.9098039, 1, 1,
0.1305387, 0.7592171, 0.8245071, 0, 0.9058824, 1, 1,
0.1332949, 0.09688984, 0.8170339, 0, 0.8980392, 1, 1,
0.1336746, -0.9102525, 0.9972629, 0, 0.8901961, 1, 1,
0.1351994, 0.8288575, -0.1545502, 0, 0.8862745, 1, 1,
0.1378595, -0.5599537, 2.681478, 0, 0.8784314, 1, 1,
0.1421357, 0.3820086, -2.588518, 0, 0.8745098, 1, 1,
0.142791, -0.1148811, 4.125478, 0, 0.8666667, 1, 1,
0.1477346, 0.4923443, 0.8548272, 0, 0.8627451, 1, 1,
0.1489512, -0.03628692, 2.18231, 0, 0.854902, 1, 1,
0.1491909, -0.5057537, 4.160255, 0, 0.8509804, 1, 1,
0.151187, 1.031077, -0.53272, 0, 0.8431373, 1, 1,
0.1518631, 0.7352571, 1.428216, 0, 0.8392157, 1, 1,
0.1520343, 0.4281929, -0.5989836, 0, 0.8313726, 1, 1,
0.1533848, 0.7735618, 0.2266759, 0, 0.827451, 1, 1,
0.1535391, 1.001384, -1.092799, 0, 0.8196079, 1, 1,
0.1547713, 2.068547, 0.396858, 0, 0.8156863, 1, 1,
0.1569822, 2.202249, 0.3182269, 0, 0.8078431, 1, 1,
0.1631435, 0.8068588, -0.06605326, 0, 0.8039216, 1, 1,
0.1679529, -0.06806524, 2.789908, 0, 0.7960784, 1, 1,
0.173333, 0.9274553, 0.8920231, 0, 0.7882353, 1, 1,
0.1737423, 0.5703074, 0.8615445, 0, 0.7843137, 1, 1,
0.174764, -0.3509375, 2.37357, 0, 0.7764706, 1, 1,
0.1747645, -0.4100099, 3.675841, 0, 0.772549, 1, 1,
0.1767255, 0.6682478, 1.168856, 0, 0.7647059, 1, 1,
0.1786651, 0.03235326, 1.697014, 0, 0.7607843, 1, 1,
0.1841169, -0.710737, 3.379155, 0, 0.7529412, 1, 1,
0.1845742, -0.008353963, 1.901485, 0, 0.7490196, 1, 1,
0.1874997, 1.985063, 0.4228024, 0, 0.7411765, 1, 1,
0.1971654, -0.1934357, 3.55951, 0, 0.7372549, 1, 1,
0.197707, -0.2110786, 0.9966901, 0, 0.7294118, 1, 1,
0.1988457, -0.2911703, 3.21208, 0, 0.7254902, 1, 1,
0.1993111, 0.07508866, 2.665699, 0, 0.7176471, 1, 1,
0.2003572, -0.497866, 3.110466, 0, 0.7137255, 1, 1,
0.2017269, -0.724465, 4.490932, 0, 0.7058824, 1, 1,
0.202744, 0.839568, 1.070669, 0, 0.6980392, 1, 1,
0.2038361, -0.763582, 2.399487, 0, 0.6941177, 1, 1,
0.2048499, 0.5623433, -0.187734, 0, 0.6862745, 1, 1,
0.2090629, 0.1481024, 1.114355, 0, 0.682353, 1, 1,
0.2101036, -1.22706, 3.948561, 0, 0.6745098, 1, 1,
0.2112224, -1.402061, 2.47387, 0, 0.6705883, 1, 1,
0.2145928, 0.2060401, 1.371016, 0, 0.6627451, 1, 1,
0.217137, 0.7790604, 1.372961, 0, 0.6588235, 1, 1,
0.2175663, 1.313156, -0.9181831, 0, 0.6509804, 1, 1,
0.2185778, -1.182942, 4.130512, 0, 0.6470588, 1, 1,
0.2194757, 1.344677, -0.6010329, 0, 0.6392157, 1, 1,
0.2288423, -0.5107603, 3.574692, 0, 0.6352941, 1, 1,
0.2395781, 0.5166164, 0.2790773, 0, 0.627451, 1, 1,
0.2439099, -0.9485566, 1.653661, 0, 0.6235294, 1, 1,
0.2439373, 0.3311013, 1.654989, 0, 0.6156863, 1, 1,
0.2471747, -0.5895965, 3.944008, 0, 0.6117647, 1, 1,
0.2490127, 0.8757281, 1.620055, 0, 0.6039216, 1, 1,
0.2503223, 0.01771894, -0.3162985, 0, 0.5960785, 1, 1,
0.2537366, -0.9823256, 3.678501, 0, 0.5921569, 1, 1,
0.2544708, 0.3475334, 0.3405827, 0, 0.5843138, 1, 1,
0.2577989, 0.8979743, 1.097493, 0, 0.5803922, 1, 1,
0.2584638, -1.80606, 4.255217, 0, 0.572549, 1, 1,
0.2605055, -0.4497091, 2.454921, 0, 0.5686275, 1, 1,
0.2655415, 1.319533, 1.163488, 0, 0.5607843, 1, 1,
0.2693188, -0.1144605, 1.599895, 0, 0.5568628, 1, 1,
0.2712153, -1.647805, 1.902268, 0, 0.5490196, 1, 1,
0.2754827, -1.41021, 3.925227, 0, 0.5450981, 1, 1,
0.2756395, 0.7519729, 1.859285, 0, 0.5372549, 1, 1,
0.2759743, -0.3898545, 3.11594, 0, 0.5333334, 1, 1,
0.2820257, -0.8050018, 3.360483, 0, 0.5254902, 1, 1,
0.2820602, -1.855099, 2.772357, 0, 0.5215687, 1, 1,
0.2863525, 0.5899992, -0.03701506, 0, 0.5137255, 1, 1,
0.289061, 0.3412227, -0.6420756, 0, 0.509804, 1, 1,
0.289522, -0.8752159, 1.9891, 0, 0.5019608, 1, 1,
0.2927876, -0.3131244, 2.42287, 0, 0.4941176, 1, 1,
0.29343, 0.08307012, 1.477053, 0, 0.4901961, 1, 1,
0.2980259, -0.6288629, 3.19571, 0, 0.4823529, 1, 1,
0.3024248, 0.7710381, -1.114016, 0, 0.4784314, 1, 1,
0.3040092, 0.2535484, 0.9634396, 0, 0.4705882, 1, 1,
0.3054303, -0.4096937, 2.795021, 0, 0.4666667, 1, 1,
0.305814, 0.08003619, 0.7086529, 0, 0.4588235, 1, 1,
0.3086392, -1.223747, 4.73088, 0, 0.454902, 1, 1,
0.3099408, -0.4342331, 1.848415, 0, 0.4470588, 1, 1,
0.3103234, 0.6223546, -0.5632825, 0, 0.4431373, 1, 1,
0.3113041, 0.2104026, 0.3654445, 0, 0.4352941, 1, 1,
0.3159907, -1.560141, 3.001619, 0, 0.4313726, 1, 1,
0.3174224, -0.02577935, 1.293006, 0, 0.4235294, 1, 1,
0.32282, -1.07774, 1.054952, 0, 0.4196078, 1, 1,
0.3248178, 2.119586, 1.452349, 0, 0.4117647, 1, 1,
0.3303716, 0.5704002, 1.29442, 0, 0.4078431, 1, 1,
0.3306754, 0.2346766, 1.845948, 0, 0.4, 1, 1,
0.3309678, -0.1411007, 3.311393, 0, 0.3921569, 1, 1,
0.3347073, -0.6871896, 2.753033, 0, 0.3882353, 1, 1,
0.3398416, -0.1411785, 2.289877, 0, 0.3803922, 1, 1,
0.3401383, -0.501075, 4.670937, 0, 0.3764706, 1, 1,
0.3430515, 1.120659, 0.4564374, 0, 0.3686275, 1, 1,
0.3449034, -0.4552135, 2.474119, 0, 0.3647059, 1, 1,
0.3469113, 0.3579506, -0.2011007, 0, 0.3568628, 1, 1,
0.3498442, -0.9899765, 2.466067, 0, 0.3529412, 1, 1,
0.3551203, 0.8706735, -0.1990168, 0, 0.345098, 1, 1,
0.3582748, -0.5959736, 4.677154, 0, 0.3411765, 1, 1,
0.3641892, -1.094701, 3.714342, 0, 0.3333333, 1, 1,
0.3648156, -1.071194, 2.398759, 0, 0.3294118, 1, 1,
0.3705749, 0.4619666, 0.0970999, 0, 0.3215686, 1, 1,
0.370828, -0.2570774, 1.742785, 0, 0.3176471, 1, 1,
0.3713297, -0.4492836, 3.462112, 0, 0.3098039, 1, 1,
0.3730864, -0.04494026, 1.30033, 0, 0.3058824, 1, 1,
0.3757973, -1.331906, 3.858055, 0, 0.2980392, 1, 1,
0.3769298, 0.04295291, 1.908397, 0, 0.2901961, 1, 1,
0.3789704, -0.6757749, 3.972672, 0, 0.2862745, 1, 1,
0.3795354, 0.0534455, 0.9280924, 0, 0.2784314, 1, 1,
0.3974315, -0.6447968, 1.75402, 0, 0.2745098, 1, 1,
0.400474, 0.1783375, 2.401966, 0, 0.2666667, 1, 1,
0.4046853, -0.8751635, 1.662224, 0, 0.2627451, 1, 1,
0.4072886, 1.304023, -0.1441622, 0, 0.254902, 1, 1,
0.4195209, -1.237316, 3.54463, 0, 0.2509804, 1, 1,
0.4202653, 1.055094, 0.8283433, 0, 0.2431373, 1, 1,
0.4213826, -0.7593784, 2.7102, 0, 0.2392157, 1, 1,
0.4278928, -2.412355, 2.67755, 0, 0.2313726, 1, 1,
0.428836, -0.2808191, 3.051089, 0, 0.227451, 1, 1,
0.4302227, -1.177904, 3.404103, 0, 0.2196078, 1, 1,
0.4314471, 1.134755, 2.106557, 0, 0.2156863, 1, 1,
0.4333409, 0.1780127, 0.7571603, 0, 0.2078431, 1, 1,
0.4358934, -0.5687475, 1.913763, 0, 0.2039216, 1, 1,
0.4425298, -1.719253, 2.762946, 0, 0.1960784, 1, 1,
0.4503212, 0.3282958, 2.438235, 0, 0.1882353, 1, 1,
0.4528346, 1.191467, 0.4325867, 0, 0.1843137, 1, 1,
0.4529703, 0.6190478, 1.878855, 0, 0.1764706, 1, 1,
0.4567954, -1.177076, 1.24448, 0, 0.172549, 1, 1,
0.4568346, -0.01235131, 1.380551, 0, 0.1647059, 1, 1,
0.4581964, 0.2572061, 1.094269, 0, 0.1607843, 1, 1,
0.459969, 1.562751, -0.9491867, 0, 0.1529412, 1, 1,
0.4669741, -0.4116195, 2.496681, 0, 0.1490196, 1, 1,
0.4674253, -0.1037264, 2.289407, 0, 0.1411765, 1, 1,
0.467895, 0.6405189, 0.7092586, 0, 0.1372549, 1, 1,
0.4680996, 1.502025, 1.459409, 0, 0.1294118, 1, 1,
0.4725682, 0.5562431, 2.588436, 0, 0.1254902, 1, 1,
0.4737511, -0.8068496, 0.5436777, 0, 0.1176471, 1, 1,
0.47444, 0.3657779, 2.214459, 0, 0.1137255, 1, 1,
0.4746892, 0.4028707, 2.217489, 0, 0.1058824, 1, 1,
0.4850677, 0.1162268, 2.747773, 0, 0.09803922, 1, 1,
0.488575, -0.8018423, 3.041541, 0, 0.09411765, 1, 1,
0.4887837, -0.4986291, 0.2593897, 0, 0.08627451, 1, 1,
0.488807, 0.9958911, 0.1191802, 0, 0.08235294, 1, 1,
0.4896269, 0.9103683, 1.255824, 0, 0.07450981, 1, 1,
0.4898717, -0.9887193, 2.3584, 0, 0.07058824, 1, 1,
0.4968072, 1.887991, 1.084036, 0, 0.0627451, 1, 1,
0.4973433, 1.921299, -0.9340982, 0, 0.05882353, 1, 1,
0.5080599, 0.3018123, -0.5275555, 0, 0.05098039, 1, 1,
0.509365, -1.062362, 2.833006, 0, 0.04705882, 1, 1,
0.5163743, -0.6009912, 2.285258, 0, 0.03921569, 1, 1,
0.5169181, -0.2191516, 3.478076, 0, 0.03529412, 1, 1,
0.5193709, 0.8540227, 0.088898, 0, 0.02745098, 1, 1,
0.5212888, 0.1977022, 2.09662, 0, 0.02352941, 1, 1,
0.5229727, -0.5394276, 0.004350582, 0, 0.01568628, 1, 1,
0.5238084, 1.270713, 0.5310655, 0, 0.01176471, 1, 1,
0.5238785, -0.4728576, 2.13739, 0, 0.003921569, 1, 1,
0.5250026, 0.5967674, 1.04719, 0.003921569, 0, 1, 1,
0.5250856, -0.8552911, 4.31281, 0.007843138, 0, 1, 1,
0.5252912, 1.401215, 0.3425562, 0.01568628, 0, 1, 1,
0.5254723, 2.087892, 1.156202, 0.01960784, 0, 1, 1,
0.5260773, 0.09887286, 1.09687, 0.02745098, 0, 1, 1,
0.5261412, 1.276423, -0.07165473, 0.03137255, 0, 1, 1,
0.5298932, 1.182695, -0.9076917, 0.03921569, 0, 1, 1,
0.5336335, -0.5166468, -0.06909885, 0.04313726, 0, 1, 1,
0.5377471, 0.1245361, 2.390754, 0.05098039, 0, 1, 1,
0.5384251, 1.158717, 0.3782712, 0.05490196, 0, 1, 1,
0.538766, -1.287598, 3.231501, 0.0627451, 0, 1, 1,
0.5387816, -1.192667, 1.838862, 0.06666667, 0, 1, 1,
0.5510541, 0.427664, -0.08544209, 0.07450981, 0, 1, 1,
0.5553477, -0.1981602, 2.929636, 0.07843138, 0, 1, 1,
0.5569444, 2.252439, -0.1087616, 0.08627451, 0, 1, 1,
0.5609168, -0.03893464, 1.999774, 0.09019608, 0, 1, 1,
0.561404, 1.316695, 2.043156, 0.09803922, 0, 1, 1,
0.5643247, -0.7642578, 2.081667, 0.1058824, 0, 1, 1,
0.5668779, -1.013393, 2.27036, 0.1098039, 0, 1, 1,
0.5674901, -0.173766, 2.284596, 0.1176471, 0, 1, 1,
0.5685701, -0.2196683, 2.693459, 0.1215686, 0, 1, 1,
0.5734053, -0.2432543, 1.066338, 0.1294118, 0, 1, 1,
0.5742058, 0.31826, 1.082332, 0.1333333, 0, 1, 1,
0.5759791, 0.5101847, 2.817492, 0.1411765, 0, 1, 1,
0.5882074, -0.613605, 2.163411, 0.145098, 0, 1, 1,
0.5889207, -0.1065618, 2.920686, 0.1529412, 0, 1, 1,
0.5913747, -1.149792, 2.221684, 0.1568628, 0, 1, 1,
0.592039, -1.766213, 4.745744, 0.1647059, 0, 1, 1,
0.5955815, 0.360436, 1.180029, 0.1686275, 0, 1, 1,
0.5960829, -0.09221416, 0.1504323, 0.1764706, 0, 1, 1,
0.5981475, -2.246927, 1.491473, 0.1803922, 0, 1, 1,
0.6006222, -0.5699356, 0.8573275, 0.1882353, 0, 1, 1,
0.6006904, 0.209981, 0.9789507, 0.1921569, 0, 1, 1,
0.6121805, 0.1307209, 3.521278, 0.2, 0, 1, 1,
0.6169332, 0.2061407, 0.2131075, 0.2078431, 0, 1, 1,
0.6169996, 0.1720887, 0.3517079, 0.2117647, 0, 1, 1,
0.619433, 0.3702039, 1.147851, 0.2196078, 0, 1, 1,
0.6198989, 0.1508422, 0.7713758, 0.2235294, 0, 1, 1,
0.6217692, 0.2626107, 0.7145409, 0.2313726, 0, 1, 1,
0.6233726, 0.6491452, 1.106438, 0.2352941, 0, 1, 1,
0.6239077, 0.4196088, -0.06638621, 0.2431373, 0, 1, 1,
0.624543, 0.9390528, -0.4432639, 0.2470588, 0, 1, 1,
0.6302341, 0.1668547, 2.258875, 0.254902, 0, 1, 1,
0.6375273, 0.5157966, 1.357823, 0.2588235, 0, 1, 1,
0.6378174, -0.2500099, 3.122349, 0.2666667, 0, 1, 1,
0.6417761, 0.03712415, 2.790698, 0.2705882, 0, 1, 1,
0.6464776, -0.2178598, 1.064595, 0.2784314, 0, 1, 1,
0.6481604, -0.4629872, 1.592732, 0.282353, 0, 1, 1,
0.6500432, -1.673992, 3.907768, 0.2901961, 0, 1, 1,
0.6516639, 0.29021, 2.20925, 0.2941177, 0, 1, 1,
0.6530206, 0.5859392, 1.020076, 0.3019608, 0, 1, 1,
0.6572333, -0.1604519, 1.875494, 0.3098039, 0, 1, 1,
0.6578417, -0.8058383, 3.496803, 0.3137255, 0, 1, 1,
0.6586912, -0.4681799, 1.386884, 0.3215686, 0, 1, 1,
0.660522, 0.09467431, 0.7453723, 0.3254902, 0, 1, 1,
0.6625681, 1.196513, -0.2055265, 0.3333333, 0, 1, 1,
0.6629543, 0.01638333, 4.026524, 0.3372549, 0, 1, 1,
0.6639893, 1.248636, 0.3532736, 0.345098, 0, 1, 1,
0.6697065, -0.07514112, 2.266088, 0.3490196, 0, 1, 1,
0.681131, 0.4056233, -0.5904652, 0.3568628, 0, 1, 1,
0.6842501, 0.2974866, 4.179175, 0.3607843, 0, 1, 1,
0.6859948, -0.8969545, 0.8899107, 0.3686275, 0, 1, 1,
0.6888255, -1.633888, 3.099576, 0.372549, 0, 1, 1,
0.6905869, -0.1031976, 0.7938626, 0.3803922, 0, 1, 1,
0.6926927, -1.76106, 2.881204, 0.3843137, 0, 1, 1,
0.6990858, 0.4411434, -0.004846792, 0.3921569, 0, 1, 1,
0.7008959, -0.01015917, 0.9742996, 0.3960784, 0, 1, 1,
0.7031605, -2.05787, 2.183303, 0.4039216, 0, 1, 1,
0.7044378, 0.08655735, 0.2864048, 0.4117647, 0, 1, 1,
0.7068495, -0.8261023, 4.1157, 0.4156863, 0, 1, 1,
0.7110782, 1.373094, -1.233035, 0.4235294, 0, 1, 1,
0.7172672, 0.3370269, 0.9329895, 0.427451, 0, 1, 1,
0.7216741, 0.3777317, 0.8686296, 0.4352941, 0, 1, 1,
0.7222612, -0.8313915, 2.695719, 0.4392157, 0, 1, 1,
0.7243344, -1.473899, 3.358322, 0.4470588, 0, 1, 1,
0.7243879, 1.36913, 1.736407, 0.4509804, 0, 1, 1,
0.7260755, 0.7036847, 1.532399, 0.4588235, 0, 1, 1,
0.7281728, 1.159195, 3.27614, 0.4627451, 0, 1, 1,
0.7348927, -2.008799, 2.464657, 0.4705882, 0, 1, 1,
0.7363788, -0.5743825, 0.6853188, 0.4745098, 0, 1, 1,
0.7364281, -1.217116, 2.18297, 0.4823529, 0, 1, 1,
0.7444388, -1.396202, 3.569281, 0.4862745, 0, 1, 1,
0.7483307, 0.6677378, -0.4747913, 0.4941176, 0, 1, 1,
0.7513557, -0.7484827, 1.737186, 0.5019608, 0, 1, 1,
0.7552001, 0.09151559, 2.105747, 0.5058824, 0, 1, 1,
0.7589086, -1.002818, 1.87494, 0.5137255, 0, 1, 1,
0.7616999, -1.140706, 2.430326, 0.5176471, 0, 1, 1,
0.7633275, -0.2924711, 0.6165218, 0.5254902, 0, 1, 1,
0.7662146, -0.5651588, 3.419664, 0.5294118, 0, 1, 1,
0.7697836, 0.04112661, 1.951135, 0.5372549, 0, 1, 1,
0.7706613, -0.08164344, 2.42331, 0.5411765, 0, 1, 1,
0.7714409, -1.494381, 2.787895, 0.5490196, 0, 1, 1,
0.7718703, 0.7023344, 1.17705, 0.5529412, 0, 1, 1,
0.7780249, -1.212345, 2.706294, 0.5607843, 0, 1, 1,
0.7842477, -0.3664577, 1.528862, 0.5647059, 0, 1, 1,
0.7868412, -0.03468612, 2.007983, 0.572549, 0, 1, 1,
0.7871817, -0.5163163, 1.695618, 0.5764706, 0, 1, 1,
0.7931448, 0.7222874, 1.050035, 0.5843138, 0, 1, 1,
0.7950939, -0.7357424, 3.94671, 0.5882353, 0, 1, 1,
0.7997936, -1.926306, 2.695834, 0.5960785, 0, 1, 1,
0.8067259, -0.5823731, 4.984196, 0.6039216, 0, 1, 1,
0.809437, 1.460114, 0.154764, 0.6078432, 0, 1, 1,
0.8134754, -0.8693625, 1.908636, 0.6156863, 0, 1, 1,
0.8166245, -0.9226242, 1.065812, 0.6196079, 0, 1, 1,
0.8350053, -0.3632415, 2.274706, 0.627451, 0, 1, 1,
0.8416715, 1.201313, 0.8523636, 0.6313726, 0, 1, 1,
0.8417594, 0.1404998, 2.137683, 0.6392157, 0, 1, 1,
0.8461497, -0.9948568, 4.003151, 0.6431373, 0, 1, 1,
0.8490741, 0.5501676, 1.870245, 0.6509804, 0, 1, 1,
0.8543205, -0.894673, 2.195592, 0.654902, 0, 1, 1,
0.8551576, -0.0200066, 2.147266, 0.6627451, 0, 1, 1,
0.8568382, -1.365242, 2.296837, 0.6666667, 0, 1, 1,
0.8575118, 1.619733, -0.4077544, 0.6745098, 0, 1, 1,
0.860688, -0.4054016, 2.514681, 0.6784314, 0, 1, 1,
0.8620812, -0.04482268, 2.087537, 0.6862745, 0, 1, 1,
0.8626119, 0.5712896, 0.8662229, 0.6901961, 0, 1, 1,
0.8628569, 0.9411562, 3.108014, 0.6980392, 0, 1, 1,
0.8686948, 0.7625778, 1.285365, 0.7058824, 0, 1, 1,
0.8740756, 0.00834472, 1.16043, 0.7098039, 0, 1, 1,
0.8746771, -0.6753078, 4.872251, 0.7176471, 0, 1, 1,
0.8786345, 0.1907461, 1.488968, 0.7215686, 0, 1, 1,
0.8808615, 1.550235, 1.245876, 0.7294118, 0, 1, 1,
0.885401, -0.1592842, 2.534674, 0.7333333, 0, 1, 1,
0.8869904, -0.2282856, 1.941813, 0.7411765, 0, 1, 1,
0.8872582, 0.3801571, 0.1448197, 0.7450981, 0, 1, 1,
0.8939871, -0.5837982, 3.235943, 0.7529412, 0, 1, 1,
0.8963352, -0.5207171, 3.533011, 0.7568628, 0, 1, 1,
0.8984303, -0.7353994, 0.7567837, 0.7647059, 0, 1, 1,
0.9040897, -0.8895075, 3.408513, 0.7686275, 0, 1, 1,
0.9097824, 1.772592, -1.52851, 0.7764706, 0, 1, 1,
0.9098195, -0.9056466, 0.6453244, 0.7803922, 0, 1, 1,
0.9128382, -0.9068789, 3.822868, 0.7882353, 0, 1, 1,
0.9130692, 0.2393056, 0.7798432, 0.7921569, 0, 1, 1,
0.9206539, 0.3054549, 1.893008, 0.8, 0, 1, 1,
0.9250035, -0.3771313, 1.915496, 0.8078431, 0, 1, 1,
0.9314179, -0.2214824, 2.536385, 0.8117647, 0, 1, 1,
0.9350575, 0.007218854, 2.031686, 0.8196079, 0, 1, 1,
0.9426352, 0.5948837, 2.587686, 0.8235294, 0, 1, 1,
0.9426709, 0.8657582, 0.3615381, 0.8313726, 0, 1, 1,
0.9430358, 0.4525991, 1.495825, 0.8352941, 0, 1, 1,
0.9440456, -0.6105551, 1.499384, 0.8431373, 0, 1, 1,
0.9442831, 0.3813756, 0.4529793, 0.8470588, 0, 1, 1,
0.9445187, -0.5730754, 1.845839, 0.854902, 0, 1, 1,
0.9460178, 0.2468091, 1.740918, 0.8588235, 0, 1, 1,
0.9461929, 1.29535, 1.331161, 0.8666667, 0, 1, 1,
0.9495241, 1.226, 0.4688007, 0.8705882, 0, 1, 1,
0.9496336, -1.239773, 2.463405, 0.8784314, 0, 1, 1,
0.9501234, 0.6848145, 0.231521, 0.8823529, 0, 1, 1,
0.9556767, 0.6435884, 2.048697, 0.8901961, 0, 1, 1,
0.9735709, 0.3968429, 0.8219901, 0.8941177, 0, 1, 1,
0.9737339, 0.4800593, 2.136361, 0.9019608, 0, 1, 1,
0.9886011, -1.079112, 5.212303, 0.9098039, 0, 1, 1,
0.9920908, 1.355474, -0.3835996, 0.9137255, 0, 1, 1,
0.9961164, 0.805263, 0.5714928, 0.9215686, 0, 1, 1,
0.9965504, -0.803239, 1.469458, 0.9254902, 0, 1, 1,
1.004874, 0.7213002, 1.31761, 0.9333333, 0, 1, 1,
1.008253, -0.01022861, 1.35308, 0.9372549, 0, 1, 1,
1.012293, 1.315167, 1.935765, 0.945098, 0, 1, 1,
1.014175, 1.465737, 1.5964, 0.9490196, 0, 1, 1,
1.014488, 0.3248886, 0.08467802, 0.9568627, 0, 1, 1,
1.017572, 1.538124, 0.1607013, 0.9607843, 0, 1, 1,
1.018258, -0.5028499, 0.6911992, 0.9686275, 0, 1, 1,
1.018359, -1.397682, 4.534764, 0.972549, 0, 1, 1,
1.021404, 0.9745169, 0.8328281, 0.9803922, 0, 1, 1,
1.023172, 0.1547635, 2.534621, 0.9843137, 0, 1, 1,
1.024955, -0.9051859, 2.817784, 0.9921569, 0, 1, 1,
1.031416, -0.1288039, 3.278769, 0.9960784, 0, 1, 1,
1.03224, 1.678645, 0.6477814, 1, 0, 0.9960784, 1,
1.032545, -1.422808, 1.610283, 1, 0, 0.9882353, 1,
1.034033, -1.463101, 1.335703, 1, 0, 0.9843137, 1,
1.036834, -1.3472, 1.663286, 1, 0, 0.9764706, 1,
1.040546, 0.06082501, 2.260352, 1, 0, 0.972549, 1,
1.04345, 0.06800556, 1.602621, 1, 0, 0.9647059, 1,
1.043499, 0.09094486, 0.3600062, 1, 0, 0.9607843, 1,
1.051739, -0.1597193, 3.997956, 1, 0, 0.9529412, 1,
1.051865, -1.139646, 0.1833314, 1, 0, 0.9490196, 1,
1.05472, -0.7296422, 3.749943, 1, 0, 0.9411765, 1,
1.055967, -0.7229667, 1.86472, 1, 0, 0.9372549, 1,
1.057509, 0.1127982, 1.91549, 1, 0, 0.9294118, 1,
1.062817, -1.580604, 0.6423255, 1, 0, 0.9254902, 1,
1.069102, -0.8021065, 1.155685, 1, 0, 0.9176471, 1,
1.072598, -0.270518, 2.609403, 1, 0, 0.9137255, 1,
1.078169, -0.07526506, 1.568776, 1, 0, 0.9058824, 1,
1.078183, -0.9668332, 2.140291, 1, 0, 0.9019608, 1,
1.07844, 0.2499504, 0.3301328, 1, 0, 0.8941177, 1,
1.078814, 0.4423737, 1.855705, 1, 0, 0.8862745, 1,
1.090845, 1.941909, 1.113433, 1, 0, 0.8823529, 1,
1.095576, 0.2771681, 1.134472, 1, 0, 0.8745098, 1,
1.098374, 0.7917907, 0.1506582, 1, 0, 0.8705882, 1,
1.103804, 1.455271, 0.7086266, 1, 0, 0.8627451, 1,
1.10499, 2.080087, -1.071056, 1, 0, 0.8588235, 1,
1.115189, -0.3862953, 2.120294, 1, 0, 0.8509804, 1,
1.116633, 0.7803791, 1.0104, 1, 0, 0.8470588, 1,
1.124642, -0.5810473, 2.011445, 1, 0, 0.8392157, 1,
1.137766, 0.764335, 0.177416, 1, 0, 0.8352941, 1,
1.152616, 0.5758668, 1.587142, 1, 0, 0.827451, 1,
1.1541, 1.521134, -0.1509888, 1, 0, 0.8235294, 1,
1.157255, 0.8076881, 2.704142, 1, 0, 0.8156863, 1,
1.161289, 0.6367603, 1.703779, 1, 0, 0.8117647, 1,
1.172392, -1.826229, 1.586587, 1, 0, 0.8039216, 1,
1.172472, 0.01333019, 0.7206325, 1, 0, 0.7960784, 1,
1.17476, 0.1789013, 2.176301, 1, 0, 0.7921569, 1,
1.17824, 0.7426437, 0.7753077, 1, 0, 0.7843137, 1,
1.18486, 0.4908802, 0.6562971, 1, 0, 0.7803922, 1,
1.18486, -0.3752159, 0.8556932, 1, 0, 0.772549, 1,
1.197849, -0.3097298, 2.952548, 1, 0, 0.7686275, 1,
1.202552, -0.9827588, 1.510584, 1, 0, 0.7607843, 1,
1.21049, 0.2998422, 1.916174, 1, 0, 0.7568628, 1,
1.216051, 0.1307065, 1.706464, 1, 0, 0.7490196, 1,
1.220674, -0.5783638, 2.02126, 1, 0, 0.7450981, 1,
1.220836, -0.08954374, 1.896534, 1, 0, 0.7372549, 1,
1.228333, 1.69805, -0.3368441, 1, 0, 0.7333333, 1,
1.236213, 0.5843006, 0.02519474, 1, 0, 0.7254902, 1,
1.245471, 1.188473, 0.6828536, 1, 0, 0.7215686, 1,
1.25349, 0.4826699, 1.32435, 1, 0, 0.7137255, 1,
1.261195, 0.8074048, -1.85561, 1, 0, 0.7098039, 1,
1.265303, -0.8574736, 3.110187, 1, 0, 0.7019608, 1,
1.278107, -0.01847287, 1.236438, 1, 0, 0.6941177, 1,
1.287445, -0.4962313, 2.328142, 1, 0, 0.6901961, 1,
1.288407, -0.4013459, 1.657019, 1, 0, 0.682353, 1,
1.291789, -0.8024133, 1.338352, 1, 0, 0.6784314, 1,
1.302623, -0.1788703, 2.337374, 1, 0, 0.6705883, 1,
1.30418, -0.1126036, 0.6775867, 1, 0, 0.6666667, 1,
1.304891, -1.105881, 3.216462, 1, 0, 0.6588235, 1,
1.307815, -1.241029, 2.717941, 1, 0, 0.654902, 1,
1.314122, -0.3740345, 1.14744, 1, 0, 0.6470588, 1,
1.317523, 0.2822171, 0.8871601, 1, 0, 0.6431373, 1,
1.320333, 1.017785, 0.7344576, 1, 0, 0.6352941, 1,
1.32186, -1.022354, 1.809978, 1, 0, 0.6313726, 1,
1.324372, -0.6929602, 2.119051, 1, 0, 0.6235294, 1,
1.327154, -1.16059, 2.835363, 1, 0, 0.6196079, 1,
1.335074, -0.1866647, 2.667175, 1, 0, 0.6117647, 1,
1.335434, -0.4689454, 1.072945, 1, 0, 0.6078432, 1,
1.340559, 0.3538757, 0.5178007, 1, 0, 0.6, 1,
1.340638, -0.7891182, 1.120928, 1, 0, 0.5921569, 1,
1.349275, 2.096112, 0.9084501, 1, 0, 0.5882353, 1,
1.355364, -0.3554508, 1.240719, 1, 0, 0.5803922, 1,
1.358102, 0.06965214, 0.7710803, 1, 0, 0.5764706, 1,
1.382365, 1.069924, -0.4124744, 1, 0, 0.5686275, 1,
1.388018, -0.5974631, 1.338332, 1, 0, 0.5647059, 1,
1.400306, -1.486773, 3.147429, 1, 0, 0.5568628, 1,
1.400433, 2.507327, 1.532878, 1, 0, 0.5529412, 1,
1.401967, 0.3750149, 0.7046987, 1, 0, 0.5450981, 1,
1.405627, 1.15021, 0.592117, 1, 0, 0.5411765, 1,
1.407094, -0.03029288, 2.652776, 1, 0, 0.5333334, 1,
1.411247, -0.3486904, 1.781845, 1, 0, 0.5294118, 1,
1.416188, -0.4312429, 1.770612, 1, 0, 0.5215687, 1,
1.419196, -0.7962081, 2.864411, 1, 0, 0.5176471, 1,
1.420147, 0.4121396, 0.8102425, 1, 0, 0.509804, 1,
1.422675, -0.08197195, 3.476854, 1, 0, 0.5058824, 1,
1.430135, 0.2000366, 1.220287, 1, 0, 0.4980392, 1,
1.438067, 0.8163107, 3.462851, 1, 0, 0.4901961, 1,
1.441638, -0.638182, 2.695001, 1, 0, 0.4862745, 1,
1.44829, 0.1708629, 2.303319, 1, 0, 0.4784314, 1,
1.449156, 0.3965011, 1.587646, 1, 0, 0.4745098, 1,
1.466542, -0.7020133, 2.729017, 1, 0, 0.4666667, 1,
1.467685, -0.6979735, 2.358159, 1, 0, 0.4627451, 1,
1.477078, -1.25405, 2.631819, 1, 0, 0.454902, 1,
1.493124, 1.127265, 0.8698243, 1, 0, 0.4509804, 1,
1.496545, 0.6091554, 1.350884, 1, 0, 0.4431373, 1,
1.51121, -0.2545034, 2.288558, 1, 0, 0.4392157, 1,
1.517393, 0.2103124, 1.46856, 1, 0, 0.4313726, 1,
1.520067, -0.7167332, 2.297891, 1, 0, 0.427451, 1,
1.522879, -0.1028728, 3.05779, 1, 0, 0.4196078, 1,
1.523422, -0.07681414, 1.318533, 1, 0, 0.4156863, 1,
1.528798, -0.5898712, 1.788176, 1, 0, 0.4078431, 1,
1.542253, 1.321829, 3.878063, 1, 0, 0.4039216, 1,
1.545364, -1.362989, 1.210102, 1, 0, 0.3960784, 1,
1.55188, -1.445497, 2.309263, 1, 0, 0.3882353, 1,
1.557652, 0.09903002, 2.434964, 1, 0, 0.3843137, 1,
1.560216, 0.9113832, 1.774742, 1, 0, 0.3764706, 1,
1.560803, 1.633545, 0.3611927, 1, 0, 0.372549, 1,
1.569288, 0.08718717, 0.9903424, 1, 0, 0.3647059, 1,
1.571503, -1.387031, 1.327789, 1, 0, 0.3607843, 1,
1.573789, 0.3994096, 2.564569, 1, 0, 0.3529412, 1,
1.576723, -0.7556224, 2.877481, 1, 0, 0.3490196, 1,
1.589307, 2.650333, 0.7782245, 1, 0, 0.3411765, 1,
1.629803, -0.4643688, 2.280959, 1, 0, 0.3372549, 1,
1.635478, 0.08500013, 2.192093, 1, 0, 0.3294118, 1,
1.636791, -2.244797, 1.460797, 1, 0, 0.3254902, 1,
1.641065, -0.1847729, 0.8970695, 1, 0, 0.3176471, 1,
1.649975, 0.484547, 1.238597, 1, 0, 0.3137255, 1,
1.658323, -0.1473093, 2.590418, 1, 0, 0.3058824, 1,
1.65878, 0.9490219, 1.174594, 1, 0, 0.2980392, 1,
1.680371, -0.2524592, 4.141686, 1, 0, 0.2941177, 1,
1.690573, -0.1540202, 2.035748, 1, 0, 0.2862745, 1,
1.699688, -0.9215631, 2.852326, 1, 0, 0.282353, 1,
1.715265, 0.01446821, 2.309481, 1, 0, 0.2745098, 1,
1.717028, -2.482672, 2.639091, 1, 0, 0.2705882, 1,
1.720697, 0.5762179, 0.2567594, 1, 0, 0.2627451, 1,
1.761768, -1.686784, 2.973954, 1, 0, 0.2588235, 1,
1.778005, -1.00572, 0.9060849, 1, 0, 0.2509804, 1,
1.781031, -0.9706619, 2.031602, 1, 0, 0.2470588, 1,
1.797434, -1.098609, 1.500312, 1, 0, 0.2392157, 1,
1.825924, 0.2780313, 1.549638, 1, 0, 0.2352941, 1,
1.834347, 0.3955094, 0.7893364, 1, 0, 0.227451, 1,
1.843216, -0.6559948, 5.268013, 1, 0, 0.2235294, 1,
1.845729, 0.3130789, 0.2663791, 1, 0, 0.2156863, 1,
1.863539, 1.718713, 0.5078976, 1, 0, 0.2117647, 1,
1.864116, 1.485001, 1.572706, 1, 0, 0.2039216, 1,
1.887438, -0.3629715, 0.9942365, 1, 0, 0.1960784, 1,
1.889547, 0.1139201, 2.007468, 1, 0, 0.1921569, 1,
1.907299, 0.1057141, 2.604598, 1, 0, 0.1843137, 1,
1.914464, -1.262323, 1.626093, 1, 0, 0.1803922, 1,
1.917378, -1.042556, 0.9330764, 1, 0, 0.172549, 1,
1.964282, -1.527843, 1.541937, 1, 0, 0.1686275, 1,
1.964535, 0.4526531, -0.3522403, 1, 0, 0.1607843, 1,
1.982634, 1.87885, 1.663949, 1, 0, 0.1568628, 1,
1.998179, -0.4651498, 2.009443, 1, 0, 0.1490196, 1,
2.005229, 0.4745383, 0.5792112, 1, 0, 0.145098, 1,
2.020081, -0.5586159, 2.253128, 1, 0, 0.1372549, 1,
2.026944, 0.9011753, 0.5901822, 1, 0, 0.1333333, 1,
2.040465, -0.8112522, 2.135097, 1, 0, 0.1254902, 1,
2.050601, 0.275396, 2.445574, 1, 0, 0.1215686, 1,
2.057498, 1.22877, 0.4530164, 1, 0, 0.1137255, 1,
2.074867, 0.2911233, 1.118748, 1, 0, 0.1098039, 1,
2.089929, 0.03721211, 3.315845, 1, 0, 0.1019608, 1,
2.128073, 1.33728, 2.487244, 1, 0, 0.09411765, 1,
2.138597, -0.8194271, 2.451654, 1, 0, 0.09019608, 1,
2.17359, -0.5003501, 1.398674, 1, 0, 0.08235294, 1,
2.225041, 2.001879, 1.936027, 1, 0, 0.07843138, 1,
2.251391, 0.2191173, 0.09673242, 1, 0, 0.07058824, 1,
2.302521, -0.7922581, 0.6399348, 1, 0, 0.06666667, 1,
2.322227, -0.1617223, 1.488043, 1, 0, 0.05882353, 1,
2.330758, -0.3054666, 2.668519, 1, 0, 0.05490196, 1,
2.351509, 0.6436861, 2.004595, 1, 0, 0.04705882, 1,
2.440092, -0.3803132, 2.223888, 1, 0, 0.04313726, 1,
2.452096, -0.760209, 2.453769, 1, 0, 0.03529412, 1,
2.479291, -0.7037559, 2.127567, 1, 0, 0.03137255, 1,
2.524088, -0.295871, 1.027583, 1, 0, 0.02352941, 1,
2.535445, 1.243164, 1.38146, 1, 0, 0.01960784, 1,
2.646948, -0.131823, 3.486056, 1, 0, 0.01176471, 1,
2.754534, 0.06754752, 3.02824, 1, 0, 0.007843138, 1
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
-0.3694798, -3.744704, -6.943155, 0, -0.5, 0.5, 0.5,
-0.3694798, -3.744704, -6.943155, 1, -0.5, 0.5, 0.5,
-0.3694798, -3.744704, -6.943155, 1, 1.5, 0.5, 0.5,
-0.3694798, -3.744704, -6.943155, 0, 1.5, 0.5, 0.5
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
-4.552534, 0.1239276, -6.943155, 0, -0.5, 0.5, 0.5,
-4.552534, 0.1239276, -6.943155, 1, -0.5, 0.5, 0.5,
-4.552534, 0.1239276, -6.943155, 1, 1.5, 0.5, 0.5,
-4.552534, 0.1239276, -6.943155, 0, 1.5, 0.5, 0.5
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
-4.552534, -3.744704, 0.04733396, 0, -0.5, 0.5, 0.5,
-4.552534, -3.744704, 0.04733396, 1, -0.5, 0.5, 0.5,
-4.552534, -3.744704, 0.04733396, 1, 1.5, 0.5, 0.5,
-4.552534, -3.744704, 0.04733396, 0, 1.5, 0.5, 0.5
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
-3, -2.851943, -5.329966,
2, -2.851943, -5.329966,
-3, -2.851943, -5.329966,
-3, -3.000736, -5.59883,
-2, -2.851943, -5.329966,
-2, -3.000736, -5.59883,
-1, -2.851943, -5.329966,
-1, -3.000736, -5.59883,
0, -2.851943, -5.329966,
0, -3.000736, -5.59883,
1, -2.851943, -5.329966,
1, -3.000736, -5.59883,
2, -2.851943, -5.329966,
2, -3.000736, -5.59883
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
-3, -3.298323, -6.13656, 0, -0.5, 0.5, 0.5,
-3, -3.298323, -6.13656, 1, -0.5, 0.5, 0.5,
-3, -3.298323, -6.13656, 1, 1.5, 0.5, 0.5,
-3, -3.298323, -6.13656, 0, 1.5, 0.5, 0.5,
-2, -3.298323, -6.13656, 0, -0.5, 0.5, 0.5,
-2, -3.298323, -6.13656, 1, -0.5, 0.5, 0.5,
-2, -3.298323, -6.13656, 1, 1.5, 0.5, 0.5,
-2, -3.298323, -6.13656, 0, 1.5, 0.5, 0.5,
-1, -3.298323, -6.13656, 0, -0.5, 0.5, 0.5,
-1, -3.298323, -6.13656, 1, -0.5, 0.5, 0.5,
-1, -3.298323, -6.13656, 1, 1.5, 0.5, 0.5,
-1, -3.298323, -6.13656, 0, 1.5, 0.5, 0.5,
0, -3.298323, -6.13656, 0, -0.5, 0.5, 0.5,
0, -3.298323, -6.13656, 1, -0.5, 0.5, 0.5,
0, -3.298323, -6.13656, 1, 1.5, 0.5, 0.5,
0, -3.298323, -6.13656, 0, 1.5, 0.5, 0.5,
1, -3.298323, -6.13656, 0, -0.5, 0.5, 0.5,
1, -3.298323, -6.13656, 1, -0.5, 0.5, 0.5,
1, -3.298323, -6.13656, 1, 1.5, 0.5, 0.5,
1, -3.298323, -6.13656, 0, 1.5, 0.5, 0.5,
2, -3.298323, -6.13656, 0, -0.5, 0.5, 0.5,
2, -3.298323, -6.13656, 1, -0.5, 0.5, 0.5,
2, -3.298323, -6.13656, 1, 1.5, 0.5, 0.5,
2, -3.298323, -6.13656, 0, 1.5, 0.5, 0.5
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
-3.587214, -2, -5.329966,
-3.587214, 3, -5.329966,
-3.587214, -2, -5.329966,
-3.7481, -2, -5.59883,
-3.587214, -1, -5.329966,
-3.7481, -1, -5.59883,
-3.587214, 0, -5.329966,
-3.7481, 0, -5.59883,
-3.587214, 1, -5.329966,
-3.7481, 1, -5.59883,
-3.587214, 2, -5.329966,
-3.7481, 2, -5.59883,
-3.587214, 3, -5.329966,
-3.7481, 3, -5.59883
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
-4.069873, -2, -6.13656, 0, -0.5, 0.5, 0.5,
-4.069873, -2, -6.13656, 1, -0.5, 0.5, 0.5,
-4.069873, -2, -6.13656, 1, 1.5, 0.5, 0.5,
-4.069873, -2, -6.13656, 0, 1.5, 0.5, 0.5,
-4.069873, -1, -6.13656, 0, -0.5, 0.5, 0.5,
-4.069873, -1, -6.13656, 1, -0.5, 0.5, 0.5,
-4.069873, -1, -6.13656, 1, 1.5, 0.5, 0.5,
-4.069873, -1, -6.13656, 0, 1.5, 0.5, 0.5,
-4.069873, 0, -6.13656, 0, -0.5, 0.5, 0.5,
-4.069873, 0, -6.13656, 1, -0.5, 0.5, 0.5,
-4.069873, 0, -6.13656, 1, 1.5, 0.5, 0.5,
-4.069873, 0, -6.13656, 0, 1.5, 0.5, 0.5,
-4.069873, 1, -6.13656, 0, -0.5, 0.5, 0.5,
-4.069873, 1, -6.13656, 1, -0.5, 0.5, 0.5,
-4.069873, 1, -6.13656, 1, 1.5, 0.5, 0.5,
-4.069873, 1, -6.13656, 0, 1.5, 0.5, 0.5,
-4.069873, 2, -6.13656, 0, -0.5, 0.5, 0.5,
-4.069873, 2, -6.13656, 1, -0.5, 0.5, 0.5,
-4.069873, 2, -6.13656, 1, 1.5, 0.5, 0.5,
-4.069873, 2, -6.13656, 0, 1.5, 0.5, 0.5,
-4.069873, 3, -6.13656, 0, -0.5, 0.5, 0.5,
-4.069873, 3, -6.13656, 1, -0.5, 0.5, 0.5,
-4.069873, 3, -6.13656, 1, 1.5, 0.5, 0.5,
-4.069873, 3, -6.13656, 0, 1.5, 0.5, 0.5
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
-3.587214, -2.851943, -4,
-3.587214, -2.851943, 4,
-3.587214, -2.851943, -4,
-3.7481, -3.000736, -4,
-3.587214, -2.851943, -2,
-3.7481, -3.000736, -2,
-3.587214, -2.851943, 0,
-3.7481, -3.000736, 0,
-3.587214, -2.851943, 2,
-3.7481, -3.000736, 2,
-3.587214, -2.851943, 4,
-3.7481, -3.000736, 4
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
-4.069873, -3.298323, -4, 0, -0.5, 0.5, 0.5,
-4.069873, -3.298323, -4, 1, -0.5, 0.5, 0.5,
-4.069873, -3.298323, -4, 1, 1.5, 0.5, 0.5,
-4.069873, -3.298323, -4, 0, 1.5, 0.5, 0.5,
-4.069873, -3.298323, -2, 0, -0.5, 0.5, 0.5,
-4.069873, -3.298323, -2, 1, -0.5, 0.5, 0.5,
-4.069873, -3.298323, -2, 1, 1.5, 0.5, 0.5,
-4.069873, -3.298323, -2, 0, 1.5, 0.5, 0.5,
-4.069873, -3.298323, 0, 0, -0.5, 0.5, 0.5,
-4.069873, -3.298323, 0, 1, -0.5, 0.5, 0.5,
-4.069873, -3.298323, 0, 1, 1.5, 0.5, 0.5,
-4.069873, -3.298323, 0, 0, 1.5, 0.5, 0.5,
-4.069873, -3.298323, 2, 0, -0.5, 0.5, 0.5,
-4.069873, -3.298323, 2, 1, -0.5, 0.5, 0.5,
-4.069873, -3.298323, 2, 1, 1.5, 0.5, 0.5,
-4.069873, -3.298323, 2, 0, 1.5, 0.5, 0.5,
-4.069873, -3.298323, 4, 0, -0.5, 0.5, 0.5,
-4.069873, -3.298323, 4, 1, -0.5, 0.5, 0.5,
-4.069873, -3.298323, 4, 1, 1.5, 0.5, 0.5,
-4.069873, -3.298323, 4, 0, 1.5, 0.5, 0.5
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
-3.587214, -2.851943, -5.329966,
-3.587214, 3.099798, -5.329966,
-3.587214, -2.851943, 5.424634,
-3.587214, 3.099798, 5.424634,
-3.587214, -2.851943, -5.329966,
-3.587214, -2.851943, 5.424634,
-3.587214, 3.099798, -5.329966,
-3.587214, 3.099798, 5.424634,
-3.587214, -2.851943, -5.329966,
2.848254, -2.851943, -5.329966,
-3.587214, -2.851943, 5.424634,
2.848254, -2.851943, 5.424634,
-3.587214, 3.099798, -5.329966,
2.848254, 3.099798, -5.329966,
-3.587214, 3.099798, 5.424634,
2.848254, 3.099798, 5.424634,
2.848254, -2.851943, -5.329966,
2.848254, 3.099798, -5.329966,
2.848254, -2.851943, 5.424634,
2.848254, 3.099798, 5.424634,
2.848254, -2.851943, -5.329966,
2.848254, -2.851943, 5.424634,
2.848254, 3.099798, -5.329966,
2.848254, 3.099798, 5.424634
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
var radius = 7.408677;
var distance = 32.96204;
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
mvMatrix.translate( 0.3694798, -0.1239276, -0.04733396 );
mvMatrix.scale( 1.244728, 1.345893, 0.7448355 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.96204);
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
cycloxydim<-read.table("cycloxydim.xyz")
```

```
## Error in read.table("cycloxydim.xyz"): no lines available in input
```

```r
x<-cycloxydim$V2
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
```

```r
y<-cycloxydim$V3
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
```

```r
z<-cycloxydim$V4
```

```
## Error in eval(expr, envir, enclos): object 'cycloxydim' not found
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
-3.493493, 0.6784121, -3.55452, 0, 0, 1, 1, 1,
-3.030018, -1.104624, -1.717299, 1, 0, 0, 1, 1,
-2.813665, -0.6945738, -3.762409, 1, 0, 0, 1, 1,
-2.745407, -1.077017, -1.128535, 1, 0, 0, 1, 1,
-2.717183, -0.4117628, -2.771705, 1, 0, 0, 1, 1,
-2.682647, -1.52321, -3.303802, 1, 0, 0, 1, 1,
-2.637229, 1.200355, -0.4641425, 0, 0, 0, 1, 1,
-2.624784, -1.067117, -1.169555, 0, 0, 0, 1, 1,
-2.620804, -0.3317373, -2.27128, 0, 0, 0, 1, 1,
-2.514971, 0.1890254, -1.514126, 0, 0, 0, 1, 1,
-2.42683, -0.1363923, -1.271876, 0, 0, 0, 1, 1,
-2.274287, -0.5388718, -0.7653794, 0, 0, 0, 1, 1,
-2.227432, -0.3120341, -0.1933213, 0, 0, 0, 1, 1,
-2.20809, 1.703572, -0.7297862, 1, 1, 1, 1, 1,
-2.197544, -1.034474, -1.646321, 1, 1, 1, 1, 1,
-2.17127, 1.184833, -0.3904883, 1, 1, 1, 1, 1,
-2.137394, 0.5154477, -2.022099, 1, 1, 1, 1, 1,
-2.127992, 0.3515563, -2.451382, 1, 1, 1, 1, 1,
-2.098944, 2.325835, -0.5659571, 1, 1, 1, 1, 1,
-2.080813, -0.8671123, -2.083508, 1, 1, 1, 1, 1,
-2.077138, 0.2132929, -1.65492, 1, 1, 1, 1, 1,
-2.052976, 0.9801081, -1.793877, 1, 1, 1, 1, 1,
-1.996612, -1.491461, -0.9857382, 1, 1, 1, 1, 1,
-1.990469, -0.3273336, -0.4392459, 1, 1, 1, 1, 1,
-1.987717, -0.06414962, -1.703341, 1, 1, 1, 1, 1,
-1.982497, -0.5260966, -1.821187, 1, 1, 1, 1, 1,
-1.946274, -1.623007, -1.212942, 1, 1, 1, 1, 1,
-1.931038, 0.3909091, -0.9132129, 1, 1, 1, 1, 1,
-1.927336, 0.6715279, 0.3299959, 0, 0, 1, 1, 1,
-1.921003, -0.3884089, -2.974948, 1, 0, 0, 1, 1,
-1.88798, 0.5411961, -1.971635, 1, 0, 0, 1, 1,
-1.867183, 1.194556, -1.893049, 1, 0, 0, 1, 1,
-1.824456, -1.306386, -2.822449, 1, 0, 0, 1, 1,
-1.795245, 0.6844125, -3.020261, 1, 0, 0, 1, 1,
-1.775301, -0.4105652, -2.377725, 0, 0, 0, 1, 1,
-1.766636, 0.5583825, -0.5556856, 0, 0, 0, 1, 1,
-1.742685, -2.31077, -2.890857, 0, 0, 0, 1, 1,
-1.726911, -0.2649399, -4.334031, 0, 0, 0, 1, 1,
-1.694437, -0.1916522, -2.710215, 0, 0, 0, 1, 1,
-1.68214, 0.9981251, 0.5146263, 0, 0, 0, 1, 1,
-1.674024, -0.5528097, -0.5462042, 0, 0, 0, 1, 1,
-1.659626, 0.4144243, -1.674429, 1, 1, 1, 1, 1,
-1.658126, 1.603486, -0.7051936, 1, 1, 1, 1, 1,
-1.65153, 1.397916, -0.2623089, 1, 1, 1, 1, 1,
-1.649317, -1.016134, -1.794371, 1, 1, 1, 1, 1,
-1.639775, 0.815517, -1.547235, 1, 1, 1, 1, 1,
-1.630709, -0.01068094, -0.7858538, 1, 1, 1, 1, 1,
-1.620318, -0.3964507, -0.2525232, 1, 1, 1, 1, 1,
-1.618178, 2.154283, -0.7404218, 1, 1, 1, 1, 1,
-1.609374, 0.6542089, -0.9023826, 1, 1, 1, 1, 1,
-1.608175, -2.01244, -3.076059, 1, 1, 1, 1, 1,
-1.602054, 1.529172, 0.1754546, 1, 1, 1, 1, 1,
-1.600427, 0.4084799, -0.9272438, 1, 1, 1, 1, 1,
-1.59593, -0.2718177, -0.1872894, 1, 1, 1, 1, 1,
-1.592884, 1.083257, -1.650381, 1, 1, 1, 1, 1,
-1.586788, 0.08891287, -0.8319318, 1, 1, 1, 1, 1,
-1.586, 1.298917, -2.17991, 0, 0, 1, 1, 1,
-1.58285, -0.2310231, 1.151574, 1, 0, 0, 1, 1,
-1.578648, -0.8506852, -3.353849, 1, 0, 0, 1, 1,
-1.569396, 0.350042, -2.287891, 1, 0, 0, 1, 1,
-1.563442, 0.3619729, -1.247027, 1, 0, 0, 1, 1,
-1.562427, -0.325667, -1.134668, 1, 0, 0, 1, 1,
-1.53453, 0.1797703, -0.2386716, 0, 0, 0, 1, 1,
-1.530443, -0.5590672, -1.398195, 0, 0, 0, 1, 1,
-1.528415, -0.4556644, -3.286655, 0, 0, 0, 1, 1,
-1.507698, -1.98329, -3.370567, 0, 0, 0, 1, 1,
-1.504543, -0.8383328, -1.268917, 0, 0, 0, 1, 1,
-1.501472, 0.402406, -0.7501998, 0, 0, 0, 1, 1,
-1.494349, 0.005008238, -0.5713586, 0, 0, 0, 1, 1,
-1.491693, 0.7560222, -0.9115431, 1, 1, 1, 1, 1,
-1.486014, -1.569657, -2.108256, 1, 1, 1, 1, 1,
-1.466686, -1.845468, -1.89002, 1, 1, 1, 1, 1,
-1.460005, -2.199324, -2.320944, 1, 1, 1, 1, 1,
-1.432104, -0.7396524, -1.881673, 1, 1, 1, 1, 1,
-1.429378, 0.4747337, -1.074363, 1, 1, 1, 1, 1,
-1.426244, -0.3265262, -0.4319761, 1, 1, 1, 1, 1,
-1.42483, 0.6199529, -0.9991357, 1, 1, 1, 1, 1,
-1.413323, -1.584385, -3.170767, 1, 1, 1, 1, 1,
-1.403556, -0.9577185, -3.779471, 1, 1, 1, 1, 1,
-1.4015, 0.9004455, -0.9307467, 1, 1, 1, 1, 1,
-1.399677, -1.852585, -3.593002, 1, 1, 1, 1, 1,
-1.386064, 0.1514615, -3.71502, 1, 1, 1, 1, 1,
-1.373045, -0.1202652, -1.597543, 1, 1, 1, 1, 1,
-1.368565, -0.6635792, -2.200445, 1, 1, 1, 1, 1,
-1.348332, -0.04284674, -2.716251, 0, 0, 1, 1, 1,
-1.347758, -0.3071332, -2.533892, 1, 0, 0, 1, 1,
-1.347536, 0.4168615, 0.3294781, 1, 0, 0, 1, 1,
-1.347175, 0.1789853, 0.2250027, 1, 0, 0, 1, 1,
-1.345648, -0.1093472, -1.932786, 1, 0, 0, 1, 1,
-1.336734, -2.102759, -2.086889, 1, 0, 0, 1, 1,
-1.327672, -1.232616, -0.7696054, 0, 0, 0, 1, 1,
-1.324687, -1.241239, -1.915803, 0, 0, 0, 1, 1,
-1.318609, 2.421458, 1.384081, 0, 0, 0, 1, 1,
-1.299862, -0.6451702, -0.576119, 0, 0, 0, 1, 1,
-1.287941, 0.9625072, -1.424809, 0, 0, 0, 1, 1,
-1.279484, -0.6874813, -2.271603, 0, 0, 0, 1, 1,
-1.272298, -0.4577009, -2.253915, 0, 0, 0, 1, 1,
-1.261695, -0.9697719, -3.423275, 1, 1, 1, 1, 1,
-1.255736, -0.487695, -2.441224, 1, 1, 1, 1, 1,
-1.245001, 0.04196597, -1.957336, 1, 1, 1, 1, 1,
-1.236838, -1.36268, -0.912372, 1, 1, 1, 1, 1,
-1.236729, 2.021037, -0.6925464, 1, 1, 1, 1, 1,
-1.22927, 0.7861681, -1.218061, 1, 1, 1, 1, 1,
-1.220854, -1.689439, -2.658775, 1, 1, 1, 1, 1,
-1.207182, 0.3865312, -2.365248, 1, 1, 1, 1, 1,
-1.192388, -0.1833955, -1.158878, 1, 1, 1, 1, 1,
-1.189581, 0.343727, -0.8973848, 1, 1, 1, 1, 1,
-1.189528, 0.8840688, -2.349237, 1, 1, 1, 1, 1,
-1.185779, 0.3525727, -1.400831, 1, 1, 1, 1, 1,
-1.184886, 0.8476365, -2.114401, 1, 1, 1, 1, 1,
-1.152964, -0.2271082, -1.22545, 1, 1, 1, 1, 1,
-1.152832, -2.249693, -3.093468, 1, 1, 1, 1, 1,
-1.14892, 0.9770448, -1.488653, 0, 0, 1, 1, 1,
-1.147181, 0.2472065, -1.421825, 1, 0, 0, 1, 1,
-1.1461, 0.6091082, -2.892139, 1, 0, 0, 1, 1,
-1.143886, -1.731245, -4.053859, 1, 0, 0, 1, 1,
-1.138049, -0.1903539, -0.658042, 1, 0, 0, 1, 1,
-1.135351, -0.00624972, -1.167854, 1, 0, 0, 1, 1,
-1.134989, 0.2406845, 0.7911005, 0, 0, 0, 1, 1,
-1.129658, 0.7737455, -1.762872, 0, 0, 0, 1, 1,
-1.129511, 0.1327095, -2.723219, 0, 0, 0, 1, 1,
-1.129494, 1.110872, -1.457713, 0, 0, 0, 1, 1,
-1.126943, 0.7975065, -2.299315, 0, 0, 0, 1, 1,
-1.125275, -1.302276, -0.973247, 0, 0, 0, 1, 1,
-1.111302, 1.251669, -0.3223698, 0, 0, 0, 1, 1,
-1.100755, -1.75836, -0.9522004, 1, 1, 1, 1, 1,
-1.093936, -1.546926, -3.956572, 1, 1, 1, 1, 1,
-1.091228, 0.1936135, -1.252193, 1, 1, 1, 1, 1,
-1.089501, -0.8266586, -2.805392, 1, 1, 1, 1, 1,
-1.086167, 0.08648901, -2.972122, 1, 1, 1, 1, 1,
-1.07654, 0.5894697, -2.839737, 1, 1, 1, 1, 1,
-1.07618, -1.139538, -3.189513, 1, 1, 1, 1, 1,
-1.07541, -0.2790923, -3.532492, 1, 1, 1, 1, 1,
-1.074912, -0.1192095, -1.67672, 1, 1, 1, 1, 1,
-1.069535, -1.113507, -3.627345, 1, 1, 1, 1, 1,
-1.05993, 0.6423365, -1.684492, 1, 1, 1, 1, 1,
-1.05639, -0.2375563, -2.290398, 1, 1, 1, 1, 1,
-1.051342, -0.8526839, -1.563351, 1, 1, 1, 1, 1,
-1.048658, -0.3903685, -2.176667, 1, 1, 1, 1, 1,
-1.043345, -0.2829437, -0.713344, 1, 1, 1, 1, 1,
-1.020503, -1.664221, -2.150763, 0, 0, 1, 1, 1,
-1.012675, 0.8968363, -2.458371, 1, 0, 0, 1, 1,
-1.009486, -0.338741, -1.420549, 1, 0, 0, 1, 1,
-1.001941, -1.41678, -1.699085, 1, 0, 0, 1, 1,
-1.001535, 0.5564232, -3.830807, 1, 0, 0, 1, 1,
-1.001263, -0.7133445, -2.26186, 1, 0, 0, 1, 1,
-0.9885417, -0.4000163, -3.152057, 0, 0, 0, 1, 1,
-0.9848821, 0.787016, -2.578033, 0, 0, 0, 1, 1,
-0.9667722, -1.553017, -3.714536, 0, 0, 0, 1, 1,
-0.9599817, -0.6953209, -3.741858, 0, 0, 0, 1, 1,
-0.9510027, 1.420601, 2.019341, 0, 0, 0, 1, 1,
-0.9321379, -0.05052845, -1.131051, 0, 0, 0, 1, 1,
-0.929149, 0.7218571, -0.7935764, 0, 0, 0, 1, 1,
-0.923871, -0.05969723, -0.4949864, 1, 1, 1, 1, 1,
-0.9229637, -1.113739, -2.59855, 1, 1, 1, 1, 1,
-0.9126318, -0.541811, -3.01103, 1, 1, 1, 1, 1,
-0.9101135, 0.07972471, -2.181163, 1, 1, 1, 1, 1,
-0.9067057, 0.6640508, -1.764442, 1, 1, 1, 1, 1,
-0.9035603, 0.03058213, -2.013612, 1, 1, 1, 1, 1,
-0.89477, 0.1049257, -2.473732, 1, 1, 1, 1, 1,
-0.8866813, 0.2981192, -2.688432, 1, 1, 1, 1, 1,
-0.8846992, -0.1176566, -2.243742, 1, 1, 1, 1, 1,
-0.8842263, -0.8828655, -2.215864, 1, 1, 1, 1, 1,
-0.8737047, 0.4314414, -1.262973, 1, 1, 1, 1, 1,
-0.8716553, 1.439687, -2.041362, 1, 1, 1, 1, 1,
-0.8710217, -0.1854783, -2.08556, 1, 1, 1, 1, 1,
-0.8637137, -0.2033674, -1.275073, 1, 1, 1, 1, 1,
-0.8597676, -1.298478, -3.306576, 1, 1, 1, 1, 1,
-0.8497495, 0.5166318, 0.1979065, 0, 0, 1, 1, 1,
-0.848391, -1.320793, -1.413255, 1, 0, 0, 1, 1,
-0.8470343, 0.5308489, -2.20601, 1, 0, 0, 1, 1,
-0.8464709, -1.12208, -3.496773, 1, 0, 0, 1, 1,
-0.843896, 0.2210646, -2.070223, 1, 0, 0, 1, 1,
-0.8388456, -0.3013816, -2.501733, 1, 0, 0, 1, 1,
-0.8347801, 0.3441356, -0.939981, 0, 0, 0, 1, 1,
-0.8328435, 1.482574, -1.040874, 0, 0, 0, 1, 1,
-0.8301014, -0.7084964, -2.498359, 0, 0, 0, 1, 1,
-0.8294033, 0.07722534, -1.719588, 0, 0, 0, 1, 1,
-0.8248914, 0.03187374, -0.701556, 0, 0, 0, 1, 1,
-0.8238913, -0.4734549, -2.760985, 0, 0, 0, 1, 1,
-0.8211157, 1.280472, -0.1827718, 0, 0, 0, 1, 1,
-0.8202701, -0.4580564, -0.8414625, 1, 1, 1, 1, 1,
-0.8129078, -1.796379, -3.211582, 1, 1, 1, 1, 1,
-0.8100325, -0.1328324, -1.77921, 1, 1, 1, 1, 1,
-0.8095165, 0.3256895, -0.5743747, 1, 1, 1, 1, 1,
-0.8085381, 1.361724, -0.205171, 1, 1, 1, 1, 1,
-0.8075933, 2.072152, 0.5807429, 1, 1, 1, 1, 1,
-0.8031836, -0.3107511, -2.536641, 1, 1, 1, 1, 1,
-0.8020015, 0.2678369, -1.344243, 1, 1, 1, 1, 1,
-0.7940847, 0.4573657, -2.193876, 1, 1, 1, 1, 1,
-0.7934395, -0.7786044, -2.443502, 1, 1, 1, 1, 1,
-0.7899583, 0.1622211, -0.8122247, 1, 1, 1, 1, 1,
-0.7879707, -1.840738, -4.609105, 1, 1, 1, 1, 1,
-0.7870209, -0.08950264, -2.11992, 1, 1, 1, 1, 1,
-0.784165, 0.5553824, -3.823128, 1, 1, 1, 1, 1,
-0.78293, -0.7515492, -1.419177, 1, 1, 1, 1, 1,
-0.7822815, -0.3515385, -2.166587, 0, 0, 1, 1, 1,
-0.7806397, 0.1520356, -0.7783726, 1, 0, 0, 1, 1,
-0.7726851, -0.5119829, -0.8294197, 1, 0, 0, 1, 1,
-0.7687497, -0.2953327, -0.09060479, 1, 0, 0, 1, 1,
-0.7678143, 0.2278155, 0.1250612, 1, 0, 0, 1, 1,
-0.7618554, -0.7682426, -2.826197, 1, 0, 0, 1, 1,
-0.7575718, -0.03331706, -1.579381, 0, 0, 0, 1, 1,
-0.7476996, -1.272155, -3.237686, 0, 0, 0, 1, 1,
-0.7420738, 0.3810141, -0.8741857, 0, 0, 0, 1, 1,
-0.7401014, -1.735478, -1.757768, 0, 0, 0, 1, 1,
-0.7302606, 0.9146302, -0.06095575, 0, 0, 0, 1, 1,
-0.7290228, 0.04111483, -1.748204, 0, 0, 0, 1, 1,
-0.726593, 0.5153839, -0.2944058, 0, 0, 0, 1, 1,
-0.725436, -1.360528, -2.030256, 1, 1, 1, 1, 1,
-0.7247577, -0.05344764, -1.853104, 1, 1, 1, 1, 1,
-0.7216309, -0.971366, -1.580091, 1, 1, 1, 1, 1,
-0.7208042, 1.34097, 2.086389, 1, 1, 1, 1, 1,
-0.7170909, 1.736851, 0.01325577, 1, 1, 1, 1, 1,
-0.7161785, -0.3500086, -3.952133, 1, 1, 1, 1, 1,
-0.7125029, -0.9106855, -2.459416, 1, 1, 1, 1, 1,
-0.7090396, -0.526275, -2.616073, 1, 1, 1, 1, 1,
-0.7081587, 0.6777209, -1.605489, 1, 1, 1, 1, 1,
-0.7079283, 0.34567, -0.84183, 1, 1, 1, 1, 1,
-0.6995737, 0.7663096, -1.034349, 1, 1, 1, 1, 1,
-0.6957306, -0.002646852, -1.65286, 1, 1, 1, 1, 1,
-0.6929077, 1.112928, -2.322436, 1, 1, 1, 1, 1,
-0.6879499, -0.5596551, -2.724311, 1, 1, 1, 1, 1,
-0.6833329, -0.2859041, -1.07487, 1, 1, 1, 1, 1,
-0.6700255, 0.1670732, -0.8363507, 0, 0, 1, 1, 1,
-0.6678114, -1.901576, -2.169084, 1, 0, 0, 1, 1,
-0.6654321, 2.889681, -0.7358388, 1, 0, 0, 1, 1,
-0.6621405, -0.8194096, -2.040359, 1, 0, 0, 1, 1,
-0.6591496, -0.7389154, -1.470381, 1, 0, 0, 1, 1,
-0.6582232, 1.777013, -0.1248862, 1, 0, 0, 1, 1,
-0.6579316, -2.342049, -4.943661, 0, 0, 0, 1, 1,
-0.6577916, -0.2680194, -2.282821, 0, 0, 0, 1, 1,
-0.6486955, -0.08177131, -3.949745, 0, 0, 0, 1, 1,
-0.6479861, 1.323728, -0.6024283, 0, 0, 0, 1, 1,
-0.6463196, 1.082486, -1.165096, 0, 0, 0, 1, 1,
-0.6418551, 0.07775043, -0.109268, 0, 0, 0, 1, 1,
-0.6387486, -0.4560082, -1.746223, 0, 0, 0, 1, 1,
-0.6382225, 0.0208782, -2.241526, 1, 1, 1, 1, 1,
-0.6332442, -0.9765594, -2.252914, 1, 1, 1, 1, 1,
-0.6309716, 1.423982, -2.201775, 1, 1, 1, 1, 1,
-0.6259517, 1.267789, 0.3085172, 1, 1, 1, 1, 1,
-0.617562, -0.727042, -1.609115, 1, 1, 1, 1, 1,
-0.6163535, -0.2541741, -0.7298226, 1, 1, 1, 1, 1,
-0.6149752, -0.1132676, -2.233649, 1, 1, 1, 1, 1,
-0.6102082, -0.1624079, -0.3829606, 1, 1, 1, 1, 1,
-0.6078725, 0.283452, -2.12007, 1, 1, 1, 1, 1,
-0.6074815, -0.2658203, -1.385549, 1, 1, 1, 1, 1,
-0.6057187, -1.130976, -2.819314, 1, 1, 1, 1, 1,
-0.6007796, -0.06485326, -1.725963, 1, 1, 1, 1, 1,
-0.6005753, 0.3703009, -1.223659, 1, 1, 1, 1, 1,
-0.5950189, 0.9046202, -1.326321, 1, 1, 1, 1, 1,
-0.5946307, 0.9667718, -0.935334, 1, 1, 1, 1, 1,
-0.5931246, 0.5181671, -0.1302449, 0, 0, 1, 1, 1,
-0.5910539, -1.021227, -2.721079, 1, 0, 0, 1, 1,
-0.5850332, -1.130133, -3.941391, 1, 0, 0, 1, 1,
-0.5832828, -1.024038, -3.793006, 1, 0, 0, 1, 1,
-0.5827764, 0.8090004, -0.6807781, 1, 0, 0, 1, 1,
-0.5811862, -0.2113889, -2.565597, 1, 0, 0, 1, 1,
-0.5771238, 0.373046, 0.05108091, 0, 0, 0, 1, 1,
-0.5759398, 0.1108682, -2.125306, 0, 0, 0, 1, 1,
-0.5745679, -0.2259661, -3.214031, 0, 0, 0, 1, 1,
-0.5707542, -1.199639, -1.988989, 0, 0, 0, 1, 1,
-0.5690549, -2.048547, -1.677484, 0, 0, 0, 1, 1,
-0.5579413, -0.1614839, -2.906972, 0, 0, 0, 1, 1,
-0.5557384, 0.5504457, 0.1052068, 0, 0, 0, 1, 1,
-0.5531767, -0.8612158, -3.122334, 1, 1, 1, 1, 1,
-0.5406755, 0.3570113, 0.03236113, 1, 1, 1, 1, 1,
-0.5390043, -0.6422333, -2.13586, 1, 1, 1, 1, 1,
-0.5380501, 0.9842064, 0.3473221, 1, 1, 1, 1, 1,
-0.5363679, 1.428219, -0.2456894, 1, 1, 1, 1, 1,
-0.5310583, 0.5638149, -1.785968, 1, 1, 1, 1, 1,
-0.5308362, -0.1513826, -2.133841, 1, 1, 1, 1, 1,
-0.5277371, 0.9037092, -1.425802, 1, 1, 1, 1, 1,
-0.527563, -0.9741471, -1.655942, 1, 1, 1, 1, 1,
-0.5273346, -0.07746431, -1.91777, 1, 1, 1, 1, 1,
-0.525839, 1.274913, -0.3791052, 1, 1, 1, 1, 1,
-0.5171664, -0.6494768, -1.478913, 1, 1, 1, 1, 1,
-0.5165238, 0.216068, -0.712886, 1, 1, 1, 1, 1,
-0.5157192, 0.7043087, -2.206595, 1, 1, 1, 1, 1,
-0.5071055, 0.6972675, -0.511499, 1, 1, 1, 1, 1,
-0.5064306, 0.446768, 0.9069678, 0, 0, 1, 1, 1,
-0.5050727, -1.144255, -1.891105, 1, 0, 0, 1, 1,
-0.501662, 0.9516861, -0.4400211, 1, 0, 0, 1, 1,
-0.5006528, 0.6415027, -1.936393, 1, 0, 0, 1, 1,
-0.5000485, 1.669071, 0.36847, 1, 0, 0, 1, 1,
-0.4961846, 1.305449, -2.197613, 1, 0, 0, 1, 1,
-0.4949342, 0.3545869, 0.6338739, 0, 0, 0, 1, 1,
-0.4920211, -0.2011404, -3.016056, 0, 0, 0, 1, 1,
-0.4917594, -1.481086, -5.173345, 0, 0, 0, 1, 1,
-0.4855899, 0.04553641, -0.1811256, 0, 0, 0, 1, 1,
-0.4850855, -0.411908, -0.9633238, 0, 0, 0, 1, 1,
-0.4832457, -2.477011, -2.638588, 0, 0, 0, 1, 1,
-0.4784402, -0.9792442, 0.1043856, 0, 0, 0, 1, 1,
-0.4754798, -0.3308078, -1.543987, 1, 1, 1, 1, 1,
-0.4693526, 0.9953431, -0.134794, 1, 1, 1, 1, 1,
-0.4683591, -0.4169255, -2.720427, 1, 1, 1, 1, 1,
-0.4659398, -0.9828657, -1.145703, 1, 1, 1, 1, 1,
-0.4637907, 1.234648, -1.114216, 1, 1, 1, 1, 1,
-0.4626156, 0.114532, -1.876063, 1, 1, 1, 1, 1,
-0.4622888, -0.2463358, -2.093724, 1, 1, 1, 1, 1,
-0.4620676, 0.4081405, -0.8896366, 1, 1, 1, 1, 1,
-0.4533384, 0.09290177, -2.514526, 1, 1, 1, 1, 1,
-0.4525004, -0.3539715, -1.121595, 1, 1, 1, 1, 1,
-0.4523546, -1.225453, -2.44633, 1, 1, 1, 1, 1,
-0.4483251, -0.06806152, -3.16178, 1, 1, 1, 1, 1,
-0.4426576, 1.208304, -1.905035, 1, 1, 1, 1, 1,
-0.44209, -0.2780509, -2.585664, 1, 1, 1, 1, 1,
-0.4380972, 0.3415884, -1.131181, 1, 1, 1, 1, 1,
-0.4373235, -0.8628776, -2.636992, 0, 0, 1, 1, 1,
-0.4351972, 0.2449039, -2.305294, 1, 0, 0, 1, 1,
-0.4327022, -0.665982, -2.413433, 1, 0, 0, 1, 1,
-0.4305232, 0.4136687, -0.01641884, 1, 0, 0, 1, 1,
-0.4303584, -0.3342074, -2.154752, 1, 0, 0, 1, 1,
-0.4264936, 0.3274877, -1.75428, 1, 0, 0, 1, 1,
-0.4245296, -0.6074824, -2.535009, 0, 0, 0, 1, 1,
-0.4227338, -0.1518375, -3.137249, 0, 0, 0, 1, 1,
-0.4214888, -1.129802, -4.09023, 0, 0, 0, 1, 1,
-0.4174641, -0.1235497, -0.4459762, 0, 0, 0, 1, 1,
-0.4110777, -1.828458, -3.586704, 0, 0, 0, 1, 1,
-0.4066141, -0.1659099, -2.22955, 0, 0, 0, 1, 1,
-0.4066132, -0.3693329, -2.245296, 0, 0, 0, 1, 1,
-0.4058823, -0.2709193, -3.183566, 1, 1, 1, 1, 1,
-0.4055194, 0.03074737, -1.108805, 1, 1, 1, 1, 1,
-0.4052294, 0.7199475, -1.449899, 1, 1, 1, 1, 1,
-0.4019576, 0.006750116, 0.03835182, 1, 1, 1, 1, 1,
-0.3948568, -0.6746733, -1.947215, 1, 1, 1, 1, 1,
-0.3923496, -1.090985, -2.67242, 1, 1, 1, 1, 1,
-0.3923061, -1.572191, -4.623317, 1, 1, 1, 1, 1,
-0.3879126, 0.6368372, 0.4494365, 1, 1, 1, 1, 1,
-0.384082, 1.217955, -2.025858, 1, 1, 1, 1, 1,
-0.3693365, 1.589435, -0.2086163, 1, 1, 1, 1, 1,
-0.3664632, 0.4566211, -0.2325321, 1, 1, 1, 1, 1,
-0.363817, -1.158328, -3.466786, 1, 1, 1, 1, 1,
-0.3617139, 2.167601, -1.665309, 1, 1, 1, 1, 1,
-0.3563195, 1.175063, 0.07462098, 1, 1, 1, 1, 1,
-0.3555045, -2.372998, -3.764007, 1, 1, 1, 1, 1,
-0.3526358, 0.5154699, -1.30868, 0, 0, 1, 1, 1,
-0.3526151, 0.9582992, -0.5976071, 1, 0, 0, 1, 1,
-0.3494703, -1.350379, -2.749331, 1, 0, 0, 1, 1,
-0.3489268, -0.245666, -2.289192, 1, 0, 0, 1, 1,
-0.3471251, 0.4519918, -0.1883251, 1, 0, 0, 1, 1,
-0.3424754, -0.03731208, -2.939339, 1, 0, 0, 1, 1,
-0.3419387, 0.7608783, -0.5470611, 0, 0, 0, 1, 1,
-0.3413708, -0.009290093, -0.8961052, 0, 0, 0, 1, 1,
-0.3413312, 0.8148675, 0.2141807, 0, 0, 0, 1, 1,
-0.3412547, 1.619641, 0.5889868, 0, 0, 0, 1, 1,
-0.340999, -0.921976, -1.790725, 0, 0, 0, 1, 1,
-0.3391788, -0.1566287, 0.1109348, 0, 0, 0, 1, 1,
-0.3355862, -0.7029025, -0.3825642, 0, 0, 0, 1, 1,
-0.3342237, 0.246356, -1.266508, 1, 1, 1, 1, 1,
-0.3264132, -0.8849609, -3.155876, 1, 1, 1, 1, 1,
-0.3214277, -0.2314841, -2.611374, 1, 1, 1, 1, 1,
-0.3183617, 0.6660761, -0.5186948, 1, 1, 1, 1, 1,
-0.3159519, 0.2469465, 0.1947113, 1, 1, 1, 1, 1,
-0.3096098, -0.3441838, -3.049083, 1, 1, 1, 1, 1,
-0.308135, 2.07058, -1.378788, 1, 1, 1, 1, 1,
-0.3079551, -1.696082, -3.080495, 1, 1, 1, 1, 1,
-0.306462, -1.020185, -3.403226, 1, 1, 1, 1, 1,
-0.304487, -0.04995152, -0.1570699, 1, 1, 1, 1, 1,
-0.3042147, 0.8937499, -0.02967208, 1, 1, 1, 1, 1,
-0.3036286, -0.6852316, -4.260058, 1, 1, 1, 1, 1,
-0.2990878, -0.3453127, -1.714836, 1, 1, 1, 1, 1,
-0.2870157, -0.3358578, -4.088954, 1, 1, 1, 1, 1,
-0.2862069, 1.442566, -0.03057289, 1, 1, 1, 1, 1,
-0.2830625, 0.8197151, -0.9153476, 0, 0, 1, 1, 1,
-0.2815481, 0.2977765, 1.329113, 1, 0, 0, 1, 1,
-0.2803175, -0.4191452, -2.5447, 1, 0, 0, 1, 1,
-0.2783959, 0.7628921, -1.533547, 1, 0, 0, 1, 1,
-0.2779567, 1.589165, 0.1275998, 1, 0, 0, 1, 1,
-0.2732091, 0.1087075, -3.063233, 1, 0, 0, 1, 1,
-0.2729652, -1.225321, -2.498096, 0, 0, 0, 1, 1,
-0.2719805, 0.4133413, 0.7210909, 0, 0, 0, 1, 1,
-0.2706811, -0.5014343, -2.416565, 0, 0, 0, 1, 1,
-0.2686003, -0.3428085, -5.010864, 0, 0, 0, 1, 1,
-0.2683662, 0.8833827, -0.731654, 0, 0, 0, 1, 1,
-0.2679957, -0.03546641, -2.164759, 0, 0, 0, 1, 1,
-0.2665113, 0.4688776, -0.274659, 0, 0, 0, 1, 1,
-0.2651792, 0.3441302, -1.312969, 1, 1, 1, 1, 1,
-0.263419, 0.09819388, -1.732806, 1, 1, 1, 1, 1,
-0.2623562, 0.3513267, -0.6999936, 1, 1, 1, 1, 1,
-0.2615457, -2.16692, -3.971677, 1, 1, 1, 1, 1,
-0.2589831, 0.5463299, -0.7242413, 1, 1, 1, 1, 1,
-0.2527468, 0.424483, 0.09340857, 1, 1, 1, 1, 1,
-0.2422433, 0.1785833, -2.267782, 1, 1, 1, 1, 1,
-0.2404608, 0.4397858, -1.243413, 1, 1, 1, 1, 1,
-0.2387629, -0.3593793, -2.881727, 1, 1, 1, 1, 1,
-0.2382004, 0.8327512, -1.833708, 1, 1, 1, 1, 1,
-0.2355979, -0.4536455, -1.654813, 1, 1, 1, 1, 1,
-0.2329971, -1.008826, -4.028494, 1, 1, 1, 1, 1,
-0.2317711, 2.04634, 0.5354892, 1, 1, 1, 1, 1,
-0.2264766, 0.41947, -2.25742, 1, 1, 1, 1, 1,
-0.2255027, 1.613532, 0.05099494, 1, 1, 1, 1, 1,
-0.2161678, 0.006748993, -2.618447, 0, 0, 1, 1, 1,
-0.2094765, -0.5705377, -0.9044142, 1, 0, 0, 1, 1,
-0.2023967, -0.8317393, -2.512884, 1, 0, 0, 1, 1,
-0.1978735, 0.6704694, 1.834572, 1, 0, 0, 1, 1,
-0.1963153, 1.098331, -0.3074402, 1, 0, 0, 1, 1,
-0.196018, -0.1755729, -3.494426, 1, 0, 0, 1, 1,
-0.1928314, -0.3680061, -1.277617, 0, 0, 0, 1, 1,
-0.190935, 1.854642, 0.8479064, 0, 0, 0, 1, 1,
-0.190071, 0.2451147, -1.328411, 0, 0, 0, 1, 1,
-0.188859, 0.2634818, -0.8578271, 0, 0, 0, 1, 1,
-0.1816337, -0.8060226, -2.70226, 0, 0, 0, 1, 1,
-0.1615477, -0.6582745, -4.481857, 0, 0, 0, 1, 1,
-0.1610945, 0.5489516, -1.417501, 0, 0, 0, 1, 1,
-0.1552613, 0.1117292, -1.864473, 1, 1, 1, 1, 1,
-0.1520712, -1.598047, -2.333571, 1, 1, 1, 1, 1,
-0.150685, -1.72936, -1.472921, 1, 1, 1, 1, 1,
-0.1471381, 0.9601478, -1.436444, 1, 1, 1, 1, 1,
-0.1419428, 0.5392159, -0.1317825, 1, 1, 1, 1, 1,
-0.1407821, -0.7427996, -2.637149, 1, 1, 1, 1, 1,
-0.1389602, 0.4618663, 0.7261415, 1, 1, 1, 1, 1,
-0.1362487, 0.1441307, -0.903852, 1, 1, 1, 1, 1,
-0.1362239, 0.7786149, 0.6866478, 1, 1, 1, 1, 1,
-0.1317609, 0.06729488, -1.242223, 1, 1, 1, 1, 1,
-0.1294482, -0.7665864, -3.824673, 1, 1, 1, 1, 1,
-0.1288379, -0.3475333, -3.760361, 1, 1, 1, 1, 1,
-0.1288093, 1.458919, -1.757462, 1, 1, 1, 1, 1,
-0.1271718, -2.117671, -3.076144, 1, 1, 1, 1, 1,
-0.1253284, 2.434189, -0.2665979, 1, 1, 1, 1, 1,
-0.1251107, 0.8541656, -1.376431, 0, 0, 1, 1, 1,
-0.1246966, -0.2837378, -2.327955, 1, 0, 0, 1, 1,
-0.1193884, 1.113346, -0.1191407, 1, 0, 0, 1, 1,
-0.1185733, -0.9816388, -3.702182, 1, 0, 0, 1, 1,
-0.1179062, -0.5567422, -4.369099, 1, 0, 0, 1, 1,
-0.1156832, -0.4486229, -3.024854, 1, 0, 0, 1, 1,
-0.1140471, -0.7052934, -3.142123, 0, 0, 0, 1, 1,
-0.1025222, 0.5549198, -1.148488, 0, 0, 0, 1, 1,
-0.09876666, 0.7778151, -0.1899466, 0, 0, 0, 1, 1,
-0.09748106, 0.4598821, -0.6796069, 0, 0, 0, 1, 1,
-0.09551372, -0.2189172, -3.057064, 0, 0, 0, 1, 1,
-0.09489602, 1.493684, -1.637464, 0, 0, 0, 1, 1,
-0.09321111, 0.853435, 0.02454704, 0, 0, 0, 1, 1,
-0.0911766, -0.5382112, -3.31672, 1, 1, 1, 1, 1,
-0.08860316, 0.06914144, -0.8388239, 1, 1, 1, 1, 1,
-0.08574548, -0.7240195, -3.134976, 1, 1, 1, 1, 1,
-0.08501843, 0.7405449, -0.5604015, 1, 1, 1, 1, 1,
-0.07608768, -1.342603, -2.293891, 1, 1, 1, 1, 1,
-0.07586678, -0.3994661, -2.851627, 1, 1, 1, 1, 1,
-0.07487521, 1.881764, -0.7908025, 1, 1, 1, 1, 1,
-0.07412105, -1.133011, -4.662538, 1, 1, 1, 1, 1,
-0.07113513, 0.5398816, -0.1009469, 1, 1, 1, 1, 1,
-0.07060932, 0.3152748, -0.4685709, 1, 1, 1, 1, 1,
-0.06530457, 0.817241, 1.985673, 1, 1, 1, 1, 1,
-0.0617597, 1.056555, -0.03494117, 1, 1, 1, 1, 1,
-0.05924914, 3.013122, 0.8419236, 1, 1, 1, 1, 1,
-0.05909839, 0.4527354, 0.8023562, 1, 1, 1, 1, 1,
-0.05573625, -0.1441406, -3.834445, 1, 1, 1, 1, 1,
-0.05186601, -0.5027824, -2.393775, 0, 0, 1, 1, 1,
-0.05090322, -0.04073219, -2.59638, 1, 0, 0, 1, 1,
-0.04612688, -0.1337342, -1.858783, 1, 0, 0, 1, 1,
-0.04611263, 0.2482214, -0.2296594, 1, 0, 0, 1, 1,
-0.04003694, -0.5100696, -1.975439, 1, 0, 0, 1, 1,
-0.03354068, -1.793933, -3.227418, 1, 0, 0, 1, 1,
-0.0240398, -0.9098003, -3.882084, 0, 0, 0, 1, 1,
-0.02402967, 0.6229592, -0.7065133, 0, 0, 0, 1, 1,
-0.02207906, -1.475794, -2.829703, 0, 0, 0, 1, 1,
-0.02010094, -0.173164, -3.14989, 0, 0, 0, 1, 1,
-0.01003896, -1.057377, -2.054915, 0, 0, 0, 1, 1,
-0.009121613, -0.8281813, -2.600368, 0, 0, 0, 1, 1,
-0.008886356, -0.9355091, -3.80471, 0, 0, 0, 1, 1,
-0.006457699, 1.571196, -0.1918782, 1, 1, 1, 1, 1,
-0.004917014, 0.3910111, -0.06819883, 1, 1, 1, 1, 1,
-0.002433379, 0.7598633, 0.792722, 1, 1, 1, 1, 1,
0.004830348, 0.8461373, -0.5691404, 1, 1, 1, 1, 1,
0.005976697, -0.296406, 2.366559, 1, 1, 1, 1, 1,
0.0105213, 0.5368409, 1.529611, 1, 1, 1, 1, 1,
0.01223769, -0.7831433, 3.727321, 1, 1, 1, 1, 1,
0.01818305, 1.825046, -0.2584686, 1, 1, 1, 1, 1,
0.02064064, 1.260021, 1.343882, 1, 1, 1, 1, 1,
0.02314876, -0.8209367, 2.515609, 1, 1, 1, 1, 1,
0.02336293, -0.1194726, 4.114561, 1, 1, 1, 1, 1,
0.02535495, 1.399416, -1.124404, 1, 1, 1, 1, 1,
0.02574072, -0.03400756, 3.892672, 1, 1, 1, 1, 1,
0.0298123, 0.4978883, 0.009793786, 1, 1, 1, 1, 1,
0.0364157, -0.02323539, 2.201326, 1, 1, 1, 1, 1,
0.03897556, -0.8462692, 3.02321, 0, 0, 1, 1, 1,
0.04534235, 1.457688, 1.063037, 1, 0, 0, 1, 1,
0.04726852, 1.936673, -1.933909, 1, 0, 0, 1, 1,
0.05015585, 1.411473, 0.03856392, 1, 0, 0, 1, 1,
0.05529283, -0.9018611, 3.293345, 1, 0, 0, 1, 1,
0.05629078, -1.248938, 2.389921, 1, 0, 0, 1, 1,
0.05639839, 1.483519, 0.3418403, 0, 0, 0, 1, 1,
0.05927654, 0.8926661, 0.6173451, 0, 0, 0, 1, 1,
0.06286484, -1.088411, 2.502815, 0, 0, 0, 1, 1,
0.06651306, 0.3723733, -2.215026, 0, 0, 0, 1, 1,
0.06737603, 1.379006, 0.2285864, 0, 0, 0, 1, 1,
0.06850722, -1.470412, 3.027094, 0, 0, 0, 1, 1,
0.07393159, 1.26246, 1.296876, 0, 0, 0, 1, 1,
0.07661279, 0.1848705, 1.814976, 1, 1, 1, 1, 1,
0.07703324, -0.09641248, 2.479645, 1, 1, 1, 1, 1,
0.07778268, 1.29801, 0.6669354, 1, 1, 1, 1, 1,
0.08251945, -1.013194, 3.016676, 1, 1, 1, 1, 1,
0.08687367, 0.3337906, -0.2838421, 1, 1, 1, 1, 1,
0.0896749, -0.4042351, 3.255918, 1, 1, 1, 1, 1,
0.09474489, -1.626814, 3.545153, 1, 1, 1, 1, 1,
0.09493296, -0.9647649, 3.422682, 1, 1, 1, 1, 1,
0.09658819, -0.7561541, 3.315068, 1, 1, 1, 1, 1,
0.09758106, -1.078902, 2.054876, 1, 1, 1, 1, 1,
0.09871257, -0.3159692, 3.750743, 1, 1, 1, 1, 1,
0.1006907, 0.7833405, -0.7892334, 1, 1, 1, 1, 1,
0.1015734, -0.726939, 1.807019, 1, 1, 1, 1, 1,
0.1043457, 1.871147, -0.625701, 1, 1, 1, 1, 1,
0.1043614, -2.765267, 1.309446, 1, 1, 1, 1, 1,
0.1044379, -0.2340361, 2.238757, 0, 0, 1, 1, 1,
0.1081919, 0.5698237, -0.7932374, 1, 0, 0, 1, 1,
0.1091421, 0.9406711, 1.564839, 1, 0, 0, 1, 1,
0.11408, 1.03306, 0.7841317, 1, 0, 0, 1, 1,
0.1178369, -0.9799193, 3.402729, 1, 0, 0, 1, 1,
0.1182503, 0.07167043, 1.017688, 1, 0, 0, 1, 1,
0.1194532, 1.192367, 0.6090392, 0, 0, 0, 1, 1,
0.120762, -0.5933511, 3.204075, 0, 0, 0, 1, 1,
0.1218739, 0.9622006, 0.2484063, 0, 0, 0, 1, 1,
0.1254695, -0.963862, 2.156098, 0, 0, 0, 1, 1,
0.1255139, -2.254324, 3.149698, 0, 0, 0, 1, 1,
0.1303939, -0.09785517, 1.93197, 0, 0, 0, 1, 1,
0.1305387, 0.7592171, 0.8245071, 0, 0, 0, 1, 1,
0.1332949, 0.09688984, 0.8170339, 1, 1, 1, 1, 1,
0.1336746, -0.9102525, 0.9972629, 1, 1, 1, 1, 1,
0.1351994, 0.8288575, -0.1545502, 1, 1, 1, 1, 1,
0.1378595, -0.5599537, 2.681478, 1, 1, 1, 1, 1,
0.1421357, 0.3820086, -2.588518, 1, 1, 1, 1, 1,
0.142791, -0.1148811, 4.125478, 1, 1, 1, 1, 1,
0.1477346, 0.4923443, 0.8548272, 1, 1, 1, 1, 1,
0.1489512, -0.03628692, 2.18231, 1, 1, 1, 1, 1,
0.1491909, -0.5057537, 4.160255, 1, 1, 1, 1, 1,
0.151187, 1.031077, -0.53272, 1, 1, 1, 1, 1,
0.1518631, 0.7352571, 1.428216, 1, 1, 1, 1, 1,
0.1520343, 0.4281929, -0.5989836, 1, 1, 1, 1, 1,
0.1533848, 0.7735618, 0.2266759, 1, 1, 1, 1, 1,
0.1535391, 1.001384, -1.092799, 1, 1, 1, 1, 1,
0.1547713, 2.068547, 0.396858, 1, 1, 1, 1, 1,
0.1569822, 2.202249, 0.3182269, 0, 0, 1, 1, 1,
0.1631435, 0.8068588, -0.06605326, 1, 0, 0, 1, 1,
0.1679529, -0.06806524, 2.789908, 1, 0, 0, 1, 1,
0.173333, 0.9274553, 0.8920231, 1, 0, 0, 1, 1,
0.1737423, 0.5703074, 0.8615445, 1, 0, 0, 1, 1,
0.174764, -0.3509375, 2.37357, 1, 0, 0, 1, 1,
0.1747645, -0.4100099, 3.675841, 0, 0, 0, 1, 1,
0.1767255, 0.6682478, 1.168856, 0, 0, 0, 1, 1,
0.1786651, 0.03235326, 1.697014, 0, 0, 0, 1, 1,
0.1841169, -0.710737, 3.379155, 0, 0, 0, 1, 1,
0.1845742, -0.008353963, 1.901485, 0, 0, 0, 1, 1,
0.1874997, 1.985063, 0.4228024, 0, 0, 0, 1, 1,
0.1971654, -0.1934357, 3.55951, 0, 0, 0, 1, 1,
0.197707, -0.2110786, 0.9966901, 1, 1, 1, 1, 1,
0.1988457, -0.2911703, 3.21208, 1, 1, 1, 1, 1,
0.1993111, 0.07508866, 2.665699, 1, 1, 1, 1, 1,
0.2003572, -0.497866, 3.110466, 1, 1, 1, 1, 1,
0.2017269, -0.724465, 4.490932, 1, 1, 1, 1, 1,
0.202744, 0.839568, 1.070669, 1, 1, 1, 1, 1,
0.2038361, -0.763582, 2.399487, 1, 1, 1, 1, 1,
0.2048499, 0.5623433, -0.187734, 1, 1, 1, 1, 1,
0.2090629, 0.1481024, 1.114355, 1, 1, 1, 1, 1,
0.2101036, -1.22706, 3.948561, 1, 1, 1, 1, 1,
0.2112224, -1.402061, 2.47387, 1, 1, 1, 1, 1,
0.2145928, 0.2060401, 1.371016, 1, 1, 1, 1, 1,
0.217137, 0.7790604, 1.372961, 1, 1, 1, 1, 1,
0.2175663, 1.313156, -0.9181831, 1, 1, 1, 1, 1,
0.2185778, -1.182942, 4.130512, 1, 1, 1, 1, 1,
0.2194757, 1.344677, -0.6010329, 0, 0, 1, 1, 1,
0.2288423, -0.5107603, 3.574692, 1, 0, 0, 1, 1,
0.2395781, 0.5166164, 0.2790773, 1, 0, 0, 1, 1,
0.2439099, -0.9485566, 1.653661, 1, 0, 0, 1, 1,
0.2439373, 0.3311013, 1.654989, 1, 0, 0, 1, 1,
0.2471747, -0.5895965, 3.944008, 1, 0, 0, 1, 1,
0.2490127, 0.8757281, 1.620055, 0, 0, 0, 1, 1,
0.2503223, 0.01771894, -0.3162985, 0, 0, 0, 1, 1,
0.2537366, -0.9823256, 3.678501, 0, 0, 0, 1, 1,
0.2544708, 0.3475334, 0.3405827, 0, 0, 0, 1, 1,
0.2577989, 0.8979743, 1.097493, 0, 0, 0, 1, 1,
0.2584638, -1.80606, 4.255217, 0, 0, 0, 1, 1,
0.2605055, -0.4497091, 2.454921, 0, 0, 0, 1, 1,
0.2655415, 1.319533, 1.163488, 1, 1, 1, 1, 1,
0.2693188, -0.1144605, 1.599895, 1, 1, 1, 1, 1,
0.2712153, -1.647805, 1.902268, 1, 1, 1, 1, 1,
0.2754827, -1.41021, 3.925227, 1, 1, 1, 1, 1,
0.2756395, 0.7519729, 1.859285, 1, 1, 1, 1, 1,
0.2759743, -0.3898545, 3.11594, 1, 1, 1, 1, 1,
0.2820257, -0.8050018, 3.360483, 1, 1, 1, 1, 1,
0.2820602, -1.855099, 2.772357, 1, 1, 1, 1, 1,
0.2863525, 0.5899992, -0.03701506, 1, 1, 1, 1, 1,
0.289061, 0.3412227, -0.6420756, 1, 1, 1, 1, 1,
0.289522, -0.8752159, 1.9891, 1, 1, 1, 1, 1,
0.2927876, -0.3131244, 2.42287, 1, 1, 1, 1, 1,
0.29343, 0.08307012, 1.477053, 1, 1, 1, 1, 1,
0.2980259, -0.6288629, 3.19571, 1, 1, 1, 1, 1,
0.3024248, 0.7710381, -1.114016, 1, 1, 1, 1, 1,
0.3040092, 0.2535484, 0.9634396, 0, 0, 1, 1, 1,
0.3054303, -0.4096937, 2.795021, 1, 0, 0, 1, 1,
0.305814, 0.08003619, 0.7086529, 1, 0, 0, 1, 1,
0.3086392, -1.223747, 4.73088, 1, 0, 0, 1, 1,
0.3099408, -0.4342331, 1.848415, 1, 0, 0, 1, 1,
0.3103234, 0.6223546, -0.5632825, 1, 0, 0, 1, 1,
0.3113041, 0.2104026, 0.3654445, 0, 0, 0, 1, 1,
0.3159907, -1.560141, 3.001619, 0, 0, 0, 1, 1,
0.3174224, -0.02577935, 1.293006, 0, 0, 0, 1, 1,
0.32282, -1.07774, 1.054952, 0, 0, 0, 1, 1,
0.3248178, 2.119586, 1.452349, 0, 0, 0, 1, 1,
0.3303716, 0.5704002, 1.29442, 0, 0, 0, 1, 1,
0.3306754, 0.2346766, 1.845948, 0, 0, 0, 1, 1,
0.3309678, -0.1411007, 3.311393, 1, 1, 1, 1, 1,
0.3347073, -0.6871896, 2.753033, 1, 1, 1, 1, 1,
0.3398416, -0.1411785, 2.289877, 1, 1, 1, 1, 1,
0.3401383, -0.501075, 4.670937, 1, 1, 1, 1, 1,
0.3430515, 1.120659, 0.4564374, 1, 1, 1, 1, 1,
0.3449034, -0.4552135, 2.474119, 1, 1, 1, 1, 1,
0.3469113, 0.3579506, -0.2011007, 1, 1, 1, 1, 1,
0.3498442, -0.9899765, 2.466067, 1, 1, 1, 1, 1,
0.3551203, 0.8706735, -0.1990168, 1, 1, 1, 1, 1,
0.3582748, -0.5959736, 4.677154, 1, 1, 1, 1, 1,
0.3641892, -1.094701, 3.714342, 1, 1, 1, 1, 1,
0.3648156, -1.071194, 2.398759, 1, 1, 1, 1, 1,
0.3705749, 0.4619666, 0.0970999, 1, 1, 1, 1, 1,
0.370828, -0.2570774, 1.742785, 1, 1, 1, 1, 1,
0.3713297, -0.4492836, 3.462112, 1, 1, 1, 1, 1,
0.3730864, -0.04494026, 1.30033, 0, 0, 1, 1, 1,
0.3757973, -1.331906, 3.858055, 1, 0, 0, 1, 1,
0.3769298, 0.04295291, 1.908397, 1, 0, 0, 1, 1,
0.3789704, -0.6757749, 3.972672, 1, 0, 0, 1, 1,
0.3795354, 0.0534455, 0.9280924, 1, 0, 0, 1, 1,
0.3974315, -0.6447968, 1.75402, 1, 0, 0, 1, 1,
0.400474, 0.1783375, 2.401966, 0, 0, 0, 1, 1,
0.4046853, -0.8751635, 1.662224, 0, 0, 0, 1, 1,
0.4072886, 1.304023, -0.1441622, 0, 0, 0, 1, 1,
0.4195209, -1.237316, 3.54463, 0, 0, 0, 1, 1,
0.4202653, 1.055094, 0.8283433, 0, 0, 0, 1, 1,
0.4213826, -0.7593784, 2.7102, 0, 0, 0, 1, 1,
0.4278928, -2.412355, 2.67755, 0, 0, 0, 1, 1,
0.428836, -0.2808191, 3.051089, 1, 1, 1, 1, 1,
0.4302227, -1.177904, 3.404103, 1, 1, 1, 1, 1,
0.4314471, 1.134755, 2.106557, 1, 1, 1, 1, 1,
0.4333409, 0.1780127, 0.7571603, 1, 1, 1, 1, 1,
0.4358934, -0.5687475, 1.913763, 1, 1, 1, 1, 1,
0.4425298, -1.719253, 2.762946, 1, 1, 1, 1, 1,
0.4503212, 0.3282958, 2.438235, 1, 1, 1, 1, 1,
0.4528346, 1.191467, 0.4325867, 1, 1, 1, 1, 1,
0.4529703, 0.6190478, 1.878855, 1, 1, 1, 1, 1,
0.4567954, -1.177076, 1.24448, 1, 1, 1, 1, 1,
0.4568346, -0.01235131, 1.380551, 1, 1, 1, 1, 1,
0.4581964, 0.2572061, 1.094269, 1, 1, 1, 1, 1,
0.459969, 1.562751, -0.9491867, 1, 1, 1, 1, 1,
0.4669741, -0.4116195, 2.496681, 1, 1, 1, 1, 1,
0.4674253, -0.1037264, 2.289407, 1, 1, 1, 1, 1,
0.467895, 0.6405189, 0.7092586, 0, 0, 1, 1, 1,
0.4680996, 1.502025, 1.459409, 1, 0, 0, 1, 1,
0.4725682, 0.5562431, 2.588436, 1, 0, 0, 1, 1,
0.4737511, -0.8068496, 0.5436777, 1, 0, 0, 1, 1,
0.47444, 0.3657779, 2.214459, 1, 0, 0, 1, 1,
0.4746892, 0.4028707, 2.217489, 1, 0, 0, 1, 1,
0.4850677, 0.1162268, 2.747773, 0, 0, 0, 1, 1,
0.488575, -0.8018423, 3.041541, 0, 0, 0, 1, 1,
0.4887837, -0.4986291, 0.2593897, 0, 0, 0, 1, 1,
0.488807, 0.9958911, 0.1191802, 0, 0, 0, 1, 1,
0.4896269, 0.9103683, 1.255824, 0, 0, 0, 1, 1,
0.4898717, -0.9887193, 2.3584, 0, 0, 0, 1, 1,
0.4968072, 1.887991, 1.084036, 0, 0, 0, 1, 1,
0.4973433, 1.921299, -0.9340982, 1, 1, 1, 1, 1,
0.5080599, 0.3018123, -0.5275555, 1, 1, 1, 1, 1,
0.509365, -1.062362, 2.833006, 1, 1, 1, 1, 1,
0.5163743, -0.6009912, 2.285258, 1, 1, 1, 1, 1,
0.5169181, -0.2191516, 3.478076, 1, 1, 1, 1, 1,
0.5193709, 0.8540227, 0.088898, 1, 1, 1, 1, 1,
0.5212888, 0.1977022, 2.09662, 1, 1, 1, 1, 1,
0.5229727, -0.5394276, 0.004350582, 1, 1, 1, 1, 1,
0.5238084, 1.270713, 0.5310655, 1, 1, 1, 1, 1,
0.5238785, -0.4728576, 2.13739, 1, 1, 1, 1, 1,
0.5250026, 0.5967674, 1.04719, 1, 1, 1, 1, 1,
0.5250856, -0.8552911, 4.31281, 1, 1, 1, 1, 1,
0.5252912, 1.401215, 0.3425562, 1, 1, 1, 1, 1,
0.5254723, 2.087892, 1.156202, 1, 1, 1, 1, 1,
0.5260773, 0.09887286, 1.09687, 1, 1, 1, 1, 1,
0.5261412, 1.276423, -0.07165473, 0, 0, 1, 1, 1,
0.5298932, 1.182695, -0.9076917, 1, 0, 0, 1, 1,
0.5336335, -0.5166468, -0.06909885, 1, 0, 0, 1, 1,
0.5377471, 0.1245361, 2.390754, 1, 0, 0, 1, 1,
0.5384251, 1.158717, 0.3782712, 1, 0, 0, 1, 1,
0.538766, -1.287598, 3.231501, 1, 0, 0, 1, 1,
0.5387816, -1.192667, 1.838862, 0, 0, 0, 1, 1,
0.5510541, 0.427664, -0.08544209, 0, 0, 0, 1, 1,
0.5553477, -0.1981602, 2.929636, 0, 0, 0, 1, 1,
0.5569444, 2.252439, -0.1087616, 0, 0, 0, 1, 1,
0.5609168, -0.03893464, 1.999774, 0, 0, 0, 1, 1,
0.561404, 1.316695, 2.043156, 0, 0, 0, 1, 1,
0.5643247, -0.7642578, 2.081667, 0, 0, 0, 1, 1,
0.5668779, -1.013393, 2.27036, 1, 1, 1, 1, 1,
0.5674901, -0.173766, 2.284596, 1, 1, 1, 1, 1,
0.5685701, -0.2196683, 2.693459, 1, 1, 1, 1, 1,
0.5734053, -0.2432543, 1.066338, 1, 1, 1, 1, 1,
0.5742058, 0.31826, 1.082332, 1, 1, 1, 1, 1,
0.5759791, 0.5101847, 2.817492, 1, 1, 1, 1, 1,
0.5882074, -0.613605, 2.163411, 1, 1, 1, 1, 1,
0.5889207, -0.1065618, 2.920686, 1, 1, 1, 1, 1,
0.5913747, -1.149792, 2.221684, 1, 1, 1, 1, 1,
0.592039, -1.766213, 4.745744, 1, 1, 1, 1, 1,
0.5955815, 0.360436, 1.180029, 1, 1, 1, 1, 1,
0.5960829, -0.09221416, 0.1504323, 1, 1, 1, 1, 1,
0.5981475, -2.246927, 1.491473, 1, 1, 1, 1, 1,
0.6006222, -0.5699356, 0.8573275, 1, 1, 1, 1, 1,
0.6006904, 0.209981, 0.9789507, 1, 1, 1, 1, 1,
0.6121805, 0.1307209, 3.521278, 0, 0, 1, 1, 1,
0.6169332, 0.2061407, 0.2131075, 1, 0, 0, 1, 1,
0.6169996, 0.1720887, 0.3517079, 1, 0, 0, 1, 1,
0.619433, 0.3702039, 1.147851, 1, 0, 0, 1, 1,
0.6198989, 0.1508422, 0.7713758, 1, 0, 0, 1, 1,
0.6217692, 0.2626107, 0.7145409, 1, 0, 0, 1, 1,
0.6233726, 0.6491452, 1.106438, 0, 0, 0, 1, 1,
0.6239077, 0.4196088, -0.06638621, 0, 0, 0, 1, 1,
0.624543, 0.9390528, -0.4432639, 0, 0, 0, 1, 1,
0.6302341, 0.1668547, 2.258875, 0, 0, 0, 1, 1,
0.6375273, 0.5157966, 1.357823, 0, 0, 0, 1, 1,
0.6378174, -0.2500099, 3.122349, 0, 0, 0, 1, 1,
0.6417761, 0.03712415, 2.790698, 0, 0, 0, 1, 1,
0.6464776, -0.2178598, 1.064595, 1, 1, 1, 1, 1,
0.6481604, -0.4629872, 1.592732, 1, 1, 1, 1, 1,
0.6500432, -1.673992, 3.907768, 1, 1, 1, 1, 1,
0.6516639, 0.29021, 2.20925, 1, 1, 1, 1, 1,
0.6530206, 0.5859392, 1.020076, 1, 1, 1, 1, 1,
0.6572333, -0.1604519, 1.875494, 1, 1, 1, 1, 1,
0.6578417, -0.8058383, 3.496803, 1, 1, 1, 1, 1,
0.6586912, -0.4681799, 1.386884, 1, 1, 1, 1, 1,
0.660522, 0.09467431, 0.7453723, 1, 1, 1, 1, 1,
0.6625681, 1.196513, -0.2055265, 1, 1, 1, 1, 1,
0.6629543, 0.01638333, 4.026524, 1, 1, 1, 1, 1,
0.6639893, 1.248636, 0.3532736, 1, 1, 1, 1, 1,
0.6697065, -0.07514112, 2.266088, 1, 1, 1, 1, 1,
0.681131, 0.4056233, -0.5904652, 1, 1, 1, 1, 1,
0.6842501, 0.2974866, 4.179175, 1, 1, 1, 1, 1,
0.6859948, -0.8969545, 0.8899107, 0, 0, 1, 1, 1,
0.6888255, -1.633888, 3.099576, 1, 0, 0, 1, 1,
0.6905869, -0.1031976, 0.7938626, 1, 0, 0, 1, 1,
0.6926927, -1.76106, 2.881204, 1, 0, 0, 1, 1,
0.6990858, 0.4411434, -0.004846792, 1, 0, 0, 1, 1,
0.7008959, -0.01015917, 0.9742996, 1, 0, 0, 1, 1,
0.7031605, -2.05787, 2.183303, 0, 0, 0, 1, 1,
0.7044378, 0.08655735, 0.2864048, 0, 0, 0, 1, 1,
0.7068495, -0.8261023, 4.1157, 0, 0, 0, 1, 1,
0.7110782, 1.373094, -1.233035, 0, 0, 0, 1, 1,
0.7172672, 0.3370269, 0.9329895, 0, 0, 0, 1, 1,
0.7216741, 0.3777317, 0.8686296, 0, 0, 0, 1, 1,
0.7222612, -0.8313915, 2.695719, 0, 0, 0, 1, 1,
0.7243344, -1.473899, 3.358322, 1, 1, 1, 1, 1,
0.7243879, 1.36913, 1.736407, 1, 1, 1, 1, 1,
0.7260755, 0.7036847, 1.532399, 1, 1, 1, 1, 1,
0.7281728, 1.159195, 3.27614, 1, 1, 1, 1, 1,
0.7348927, -2.008799, 2.464657, 1, 1, 1, 1, 1,
0.7363788, -0.5743825, 0.6853188, 1, 1, 1, 1, 1,
0.7364281, -1.217116, 2.18297, 1, 1, 1, 1, 1,
0.7444388, -1.396202, 3.569281, 1, 1, 1, 1, 1,
0.7483307, 0.6677378, -0.4747913, 1, 1, 1, 1, 1,
0.7513557, -0.7484827, 1.737186, 1, 1, 1, 1, 1,
0.7552001, 0.09151559, 2.105747, 1, 1, 1, 1, 1,
0.7589086, -1.002818, 1.87494, 1, 1, 1, 1, 1,
0.7616999, -1.140706, 2.430326, 1, 1, 1, 1, 1,
0.7633275, -0.2924711, 0.6165218, 1, 1, 1, 1, 1,
0.7662146, -0.5651588, 3.419664, 1, 1, 1, 1, 1,
0.7697836, 0.04112661, 1.951135, 0, 0, 1, 1, 1,
0.7706613, -0.08164344, 2.42331, 1, 0, 0, 1, 1,
0.7714409, -1.494381, 2.787895, 1, 0, 0, 1, 1,
0.7718703, 0.7023344, 1.17705, 1, 0, 0, 1, 1,
0.7780249, -1.212345, 2.706294, 1, 0, 0, 1, 1,
0.7842477, -0.3664577, 1.528862, 1, 0, 0, 1, 1,
0.7868412, -0.03468612, 2.007983, 0, 0, 0, 1, 1,
0.7871817, -0.5163163, 1.695618, 0, 0, 0, 1, 1,
0.7931448, 0.7222874, 1.050035, 0, 0, 0, 1, 1,
0.7950939, -0.7357424, 3.94671, 0, 0, 0, 1, 1,
0.7997936, -1.926306, 2.695834, 0, 0, 0, 1, 1,
0.8067259, -0.5823731, 4.984196, 0, 0, 0, 1, 1,
0.809437, 1.460114, 0.154764, 0, 0, 0, 1, 1,
0.8134754, -0.8693625, 1.908636, 1, 1, 1, 1, 1,
0.8166245, -0.9226242, 1.065812, 1, 1, 1, 1, 1,
0.8350053, -0.3632415, 2.274706, 1, 1, 1, 1, 1,
0.8416715, 1.201313, 0.8523636, 1, 1, 1, 1, 1,
0.8417594, 0.1404998, 2.137683, 1, 1, 1, 1, 1,
0.8461497, -0.9948568, 4.003151, 1, 1, 1, 1, 1,
0.8490741, 0.5501676, 1.870245, 1, 1, 1, 1, 1,
0.8543205, -0.894673, 2.195592, 1, 1, 1, 1, 1,
0.8551576, -0.0200066, 2.147266, 1, 1, 1, 1, 1,
0.8568382, -1.365242, 2.296837, 1, 1, 1, 1, 1,
0.8575118, 1.619733, -0.4077544, 1, 1, 1, 1, 1,
0.860688, -0.4054016, 2.514681, 1, 1, 1, 1, 1,
0.8620812, -0.04482268, 2.087537, 1, 1, 1, 1, 1,
0.8626119, 0.5712896, 0.8662229, 1, 1, 1, 1, 1,
0.8628569, 0.9411562, 3.108014, 1, 1, 1, 1, 1,
0.8686948, 0.7625778, 1.285365, 0, 0, 1, 1, 1,
0.8740756, 0.00834472, 1.16043, 1, 0, 0, 1, 1,
0.8746771, -0.6753078, 4.872251, 1, 0, 0, 1, 1,
0.8786345, 0.1907461, 1.488968, 1, 0, 0, 1, 1,
0.8808615, 1.550235, 1.245876, 1, 0, 0, 1, 1,
0.885401, -0.1592842, 2.534674, 1, 0, 0, 1, 1,
0.8869904, -0.2282856, 1.941813, 0, 0, 0, 1, 1,
0.8872582, 0.3801571, 0.1448197, 0, 0, 0, 1, 1,
0.8939871, -0.5837982, 3.235943, 0, 0, 0, 1, 1,
0.8963352, -0.5207171, 3.533011, 0, 0, 0, 1, 1,
0.8984303, -0.7353994, 0.7567837, 0, 0, 0, 1, 1,
0.9040897, -0.8895075, 3.408513, 0, 0, 0, 1, 1,
0.9097824, 1.772592, -1.52851, 0, 0, 0, 1, 1,
0.9098195, -0.9056466, 0.6453244, 1, 1, 1, 1, 1,
0.9128382, -0.9068789, 3.822868, 1, 1, 1, 1, 1,
0.9130692, 0.2393056, 0.7798432, 1, 1, 1, 1, 1,
0.9206539, 0.3054549, 1.893008, 1, 1, 1, 1, 1,
0.9250035, -0.3771313, 1.915496, 1, 1, 1, 1, 1,
0.9314179, -0.2214824, 2.536385, 1, 1, 1, 1, 1,
0.9350575, 0.007218854, 2.031686, 1, 1, 1, 1, 1,
0.9426352, 0.5948837, 2.587686, 1, 1, 1, 1, 1,
0.9426709, 0.8657582, 0.3615381, 1, 1, 1, 1, 1,
0.9430358, 0.4525991, 1.495825, 1, 1, 1, 1, 1,
0.9440456, -0.6105551, 1.499384, 1, 1, 1, 1, 1,
0.9442831, 0.3813756, 0.4529793, 1, 1, 1, 1, 1,
0.9445187, -0.5730754, 1.845839, 1, 1, 1, 1, 1,
0.9460178, 0.2468091, 1.740918, 1, 1, 1, 1, 1,
0.9461929, 1.29535, 1.331161, 1, 1, 1, 1, 1,
0.9495241, 1.226, 0.4688007, 0, 0, 1, 1, 1,
0.9496336, -1.239773, 2.463405, 1, 0, 0, 1, 1,
0.9501234, 0.6848145, 0.231521, 1, 0, 0, 1, 1,
0.9556767, 0.6435884, 2.048697, 1, 0, 0, 1, 1,
0.9735709, 0.3968429, 0.8219901, 1, 0, 0, 1, 1,
0.9737339, 0.4800593, 2.136361, 1, 0, 0, 1, 1,
0.9886011, -1.079112, 5.212303, 0, 0, 0, 1, 1,
0.9920908, 1.355474, -0.3835996, 0, 0, 0, 1, 1,
0.9961164, 0.805263, 0.5714928, 0, 0, 0, 1, 1,
0.9965504, -0.803239, 1.469458, 0, 0, 0, 1, 1,
1.004874, 0.7213002, 1.31761, 0, 0, 0, 1, 1,
1.008253, -0.01022861, 1.35308, 0, 0, 0, 1, 1,
1.012293, 1.315167, 1.935765, 0, 0, 0, 1, 1,
1.014175, 1.465737, 1.5964, 1, 1, 1, 1, 1,
1.014488, 0.3248886, 0.08467802, 1, 1, 1, 1, 1,
1.017572, 1.538124, 0.1607013, 1, 1, 1, 1, 1,
1.018258, -0.5028499, 0.6911992, 1, 1, 1, 1, 1,
1.018359, -1.397682, 4.534764, 1, 1, 1, 1, 1,
1.021404, 0.9745169, 0.8328281, 1, 1, 1, 1, 1,
1.023172, 0.1547635, 2.534621, 1, 1, 1, 1, 1,
1.024955, -0.9051859, 2.817784, 1, 1, 1, 1, 1,
1.031416, -0.1288039, 3.278769, 1, 1, 1, 1, 1,
1.03224, 1.678645, 0.6477814, 1, 1, 1, 1, 1,
1.032545, -1.422808, 1.610283, 1, 1, 1, 1, 1,
1.034033, -1.463101, 1.335703, 1, 1, 1, 1, 1,
1.036834, -1.3472, 1.663286, 1, 1, 1, 1, 1,
1.040546, 0.06082501, 2.260352, 1, 1, 1, 1, 1,
1.04345, 0.06800556, 1.602621, 1, 1, 1, 1, 1,
1.043499, 0.09094486, 0.3600062, 0, 0, 1, 1, 1,
1.051739, -0.1597193, 3.997956, 1, 0, 0, 1, 1,
1.051865, -1.139646, 0.1833314, 1, 0, 0, 1, 1,
1.05472, -0.7296422, 3.749943, 1, 0, 0, 1, 1,
1.055967, -0.7229667, 1.86472, 1, 0, 0, 1, 1,
1.057509, 0.1127982, 1.91549, 1, 0, 0, 1, 1,
1.062817, -1.580604, 0.6423255, 0, 0, 0, 1, 1,
1.069102, -0.8021065, 1.155685, 0, 0, 0, 1, 1,
1.072598, -0.270518, 2.609403, 0, 0, 0, 1, 1,
1.078169, -0.07526506, 1.568776, 0, 0, 0, 1, 1,
1.078183, -0.9668332, 2.140291, 0, 0, 0, 1, 1,
1.07844, 0.2499504, 0.3301328, 0, 0, 0, 1, 1,
1.078814, 0.4423737, 1.855705, 0, 0, 0, 1, 1,
1.090845, 1.941909, 1.113433, 1, 1, 1, 1, 1,
1.095576, 0.2771681, 1.134472, 1, 1, 1, 1, 1,
1.098374, 0.7917907, 0.1506582, 1, 1, 1, 1, 1,
1.103804, 1.455271, 0.7086266, 1, 1, 1, 1, 1,
1.10499, 2.080087, -1.071056, 1, 1, 1, 1, 1,
1.115189, -0.3862953, 2.120294, 1, 1, 1, 1, 1,
1.116633, 0.7803791, 1.0104, 1, 1, 1, 1, 1,
1.124642, -0.5810473, 2.011445, 1, 1, 1, 1, 1,
1.137766, 0.764335, 0.177416, 1, 1, 1, 1, 1,
1.152616, 0.5758668, 1.587142, 1, 1, 1, 1, 1,
1.1541, 1.521134, -0.1509888, 1, 1, 1, 1, 1,
1.157255, 0.8076881, 2.704142, 1, 1, 1, 1, 1,
1.161289, 0.6367603, 1.703779, 1, 1, 1, 1, 1,
1.172392, -1.826229, 1.586587, 1, 1, 1, 1, 1,
1.172472, 0.01333019, 0.7206325, 1, 1, 1, 1, 1,
1.17476, 0.1789013, 2.176301, 0, 0, 1, 1, 1,
1.17824, 0.7426437, 0.7753077, 1, 0, 0, 1, 1,
1.18486, 0.4908802, 0.6562971, 1, 0, 0, 1, 1,
1.18486, -0.3752159, 0.8556932, 1, 0, 0, 1, 1,
1.197849, -0.3097298, 2.952548, 1, 0, 0, 1, 1,
1.202552, -0.9827588, 1.510584, 1, 0, 0, 1, 1,
1.21049, 0.2998422, 1.916174, 0, 0, 0, 1, 1,
1.216051, 0.1307065, 1.706464, 0, 0, 0, 1, 1,
1.220674, -0.5783638, 2.02126, 0, 0, 0, 1, 1,
1.220836, -0.08954374, 1.896534, 0, 0, 0, 1, 1,
1.228333, 1.69805, -0.3368441, 0, 0, 0, 1, 1,
1.236213, 0.5843006, 0.02519474, 0, 0, 0, 1, 1,
1.245471, 1.188473, 0.6828536, 0, 0, 0, 1, 1,
1.25349, 0.4826699, 1.32435, 1, 1, 1, 1, 1,
1.261195, 0.8074048, -1.85561, 1, 1, 1, 1, 1,
1.265303, -0.8574736, 3.110187, 1, 1, 1, 1, 1,
1.278107, -0.01847287, 1.236438, 1, 1, 1, 1, 1,
1.287445, -0.4962313, 2.328142, 1, 1, 1, 1, 1,
1.288407, -0.4013459, 1.657019, 1, 1, 1, 1, 1,
1.291789, -0.8024133, 1.338352, 1, 1, 1, 1, 1,
1.302623, -0.1788703, 2.337374, 1, 1, 1, 1, 1,
1.30418, -0.1126036, 0.6775867, 1, 1, 1, 1, 1,
1.304891, -1.105881, 3.216462, 1, 1, 1, 1, 1,
1.307815, -1.241029, 2.717941, 1, 1, 1, 1, 1,
1.314122, -0.3740345, 1.14744, 1, 1, 1, 1, 1,
1.317523, 0.2822171, 0.8871601, 1, 1, 1, 1, 1,
1.320333, 1.017785, 0.7344576, 1, 1, 1, 1, 1,
1.32186, -1.022354, 1.809978, 1, 1, 1, 1, 1,
1.324372, -0.6929602, 2.119051, 0, 0, 1, 1, 1,
1.327154, -1.16059, 2.835363, 1, 0, 0, 1, 1,
1.335074, -0.1866647, 2.667175, 1, 0, 0, 1, 1,
1.335434, -0.4689454, 1.072945, 1, 0, 0, 1, 1,
1.340559, 0.3538757, 0.5178007, 1, 0, 0, 1, 1,
1.340638, -0.7891182, 1.120928, 1, 0, 0, 1, 1,
1.349275, 2.096112, 0.9084501, 0, 0, 0, 1, 1,
1.355364, -0.3554508, 1.240719, 0, 0, 0, 1, 1,
1.358102, 0.06965214, 0.7710803, 0, 0, 0, 1, 1,
1.382365, 1.069924, -0.4124744, 0, 0, 0, 1, 1,
1.388018, -0.5974631, 1.338332, 0, 0, 0, 1, 1,
1.400306, -1.486773, 3.147429, 0, 0, 0, 1, 1,
1.400433, 2.507327, 1.532878, 0, 0, 0, 1, 1,
1.401967, 0.3750149, 0.7046987, 1, 1, 1, 1, 1,
1.405627, 1.15021, 0.592117, 1, 1, 1, 1, 1,
1.407094, -0.03029288, 2.652776, 1, 1, 1, 1, 1,
1.411247, -0.3486904, 1.781845, 1, 1, 1, 1, 1,
1.416188, -0.4312429, 1.770612, 1, 1, 1, 1, 1,
1.419196, -0.7962081, 2.864411, 1, 1, 1, 1, 1,
1.420147, 0.4121396, 0.8102425, 1, 1, 1, 1, 1,
1.422675, -0.08197195, 3.476854, 1, 1, 1, 1, 1,
1.430135, 0.2000366, 1.220287, 1, 1, 1, 1, 1,
1.438067, 0.8163107, 3.462851, 1, 1, 1, 1, 1,
1.441638, -0.638182, 2.695001, 1, 1, 1, 1, 1,
1.44829, 0.1708629, 2.303319, 1, 1, 1, 1, 1,
1.449156, 0.3965011, 1.587646, 1, 1, 1, 1, 1,
1.466542, -0.7020133, 2.729017, 1, 1, 1, 1, 1,
1.467685, -0.6979735, 2.358159, 1, 1, 1, 1, 1,
1.477078, -1.25405, 2.631819, 0, 0, 1, 1, 1,
1.493124, 1.127265, 0.8698243, 1, 0, 0, 1, 1,
1.496545, 0.6091554, 1.350884, 1, 0, 0, 1, 1,
1.51121, -0.2545034, 2.288558, 1, 0, 0, 1, 1,
1.517393, 0.2103124, 1.46856, 1, 0, 0, 1, 1,
1.520067, -0.7167332, 2.297891, 1, 0, 0, 1, 1,
1.522879, -0.1028728, 3.05779, 0, 0, 0, 1, 1,
1.523422, -0.07681414, 1.318533, 0, 0, 0, 1, 1,
1.528798, -0.5898712, 1.788176, 0, 0, 0, 1, 1,
1.542253, 1.321829, 3.878063, 0, 0, 0, 1, 1,
1.545364, -1.362989, 1.210102, 0, 0, 0, 1, 1,
1.55188, -1.445497, 2.309263, 0, 0, 0, 1, 1,
1.557652, 0.09903002, 2.434964, 0, 0, 0, 1, 1,
1.560216, 0.9113832, 1.774742, 1, 1, 1, 1, 1,
1.560803, 1.633545, 0.3611927, 1, 1, 1, 1, 1,
1.569288, 0.08718717, 0.9903424, 1, 1, 1, 1, 1,
1.571503, -1.387031, 1.327789, 1, 1, 1, 1, 1,
1.573789, 0.3994096, 2.564569, 1, 1, 1, 1, 1,
1.576723, -0.7556224, 2.877481, 1, 1, 1, 1, 1,
1.589307, 2.650333, 0.7782245, 1, 1, 1, 1, 1,
1.629803, -0.4643688, 2.280959, 1, 1, 1, 1, 1,
1.635478, 0.08500013, 2.192093, 1, 1, 1, 1, 1,
1.636791, -2.244797, 1.460797, 1, 1, 1, 1, 1,
1.641065, -0.1847729, 0.8970695, 1, 1, 1, 1, 1,
1.649975, 0.484547, 1.238597, 1, 1, 1, 1, 1,
1.658323, -0.1473093, 2.590418, 1, 1, 1, 1, 1,
1.65878, 0.9490219, 1.174594, 1, 1, 1, 1, 1,
1.680371, -0.2524592, 4.141686, 1, 1, 1, 1, 1,
1.690573, -0.1540202, 2.035748, 0, 0, 1, 1, 1,
1.699688, -0.9215631, 2.852326, 1, 0, 0, 1, 1,
1.715265, 0.01446821, 2.309481, 1, 0, 0, 1, 1,
1.717028, -2.482672, 2.639091, 1, 0, 0, 1, 1,
1.720697, 0.5762179, 0.2567594, 1, 0, 0, 1, 1,
1.761768, -1.686784, 2.973954, 1, 0, 0, 1, 1,
1.778005, -1.00572, 0.9060849, 0, 0, 0, 1, 1,
1.781031, -0.9706619, 2.031602, 0, 0, 0, 1, 1,
1.797434, -1.098609, 1.500312, 0, 0, 0, 1, 1,
1.825924, 0.2780313, 1.549638, 0, 0, 0, 1, 1,
1.834347, 0.3955094, 0.7893364, 0, 0, 0, 1, 1,
1.843216, -0.6559948, 5.268013, 0, 0, 0, 1, 1,
1.845729, 0.3130789, 0.2663791, 0, 0, 0, 1, 1,
1.863539, 1.718713, 0.5078976, 1, 1, 1, 1, 1,
1.864116, 1.485001, 1.572706, 1, 1, 1, 1, 1,
1.887438, -0.3629715, 0.9942365, 1, 1, 1, 1, 1,
1.889547, 0.1139201, 2.007468, 1, 1, 1, 1, 1,
1.907299, 0.1057141, 2.604598, 1, 1, 1, 1, 1,
1.914464, -1.262323, 1.626093, 1, 1, 1, 1, 1,
1.917378, -1.042556, 0.9330764, 1, 1, 1, 1, 1,
1.964282, -1.527843, 1.541937, 1, 1, 1, 1, 1,
1.964535, 0.4526531, -0.3522403, 1, 1, 1, 1, 1,
1.982634, 1.87885, 1.663949, 1, 1, 1, 1, 1,
1.998179, -0.4651498, 2.009443, 1, 1, 1, 1, 1,
2.005229, 0.4745383, 0.5792112, 1, 1, 1, 1, 1,
2.020081, -0.5586159, 2.253128, 1, 1, 1, 1, 1,
2.026944, 0.9011753, 0.5901822, 1, 1, 1, 1, 1,
2.040465, -0.8112522, 2.135097, 1, 1, 1, 1, 1,
2.050601, 0.275396, 2.445574, 0, 0, 1, 1, 1,
2.057498, 1.22877, 0.4530164, 1, 0, 0, 1, 1,
2.074867, 0.2911233, 1.118748, 1, 0, 0, 1, 1,
2.089929, 0.03721211, 3.315845, 1, 0, 0, 1, 1,
2.128073, 1.33728, 2.487244, 1, 0, 0, 1, 1,
2.138597, -0.8194271, 2.451654, 1, 0, 0, 1, 1,
2.17359, -0.5003501, 1.398674, 0, 0, 0, 1, 1,
2.225041, 2.001879, 1.936027, 0, 0, 0, 1, 1,
2.251391, 0.2191173, 0.09673242, 0, 0, 0, 1, 1,
2.302521, -0.7922581, 0.6399348, 0, 0, 0, 1, 1,
2.322227, -0.1617223, 1.488043, 0, 0, 0, 1, 1,
2.330758, -0.3054666, 2.668519, 0, 0, 0, 1, 1,
2.351509, 0.6436861, 2.004595, 0, 0, 0, 1, 1,
2.440092, -0.3803132, 2.223888, 1, 1, 1, 1, 1,
2.452096, -0.760209, 2.453769, 1, 1, 1, 1, 1,
2.479291, -0.7037559, 2.127567, 1, 1, 1, 1, 1,
2.524088, -0.295871, 1.027583, 1, 1, 1, 1, 1,
2.535445, 1.243164, 1.38146, 1, 1, 1, 1, 1,
2.646948, -0.131823, 3.486056, 1, 1, 1, 1, 1,
2.754534, 0.06754752, 3.02824, 1, 1, 1, 1, 1
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
var radius = 9.257673;
var distance = 32.51718;
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
mvMatrix.translate( 0.3694798, -0.1239276, -0.04733396 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.51718);
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
