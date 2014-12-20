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
-3.017626, 0.4496683, -2.257685, 1, 0, 0, 1,
-2.833811, -1.116644, -2.275422, 1, 0.007843138, 0, 1,
-2.727104, 0.8697659, -3.156995, 1, 0.01176471, 0, 1,
-2.723338, 0.6640143, -1.620897, 1, 0.01960784, 0, 1,
-2.601513, 0.03631856, -1.381325, 1, 0.02352941, 0, 1,
-2.51156, 0.1655552, -3.227253, 1, 0.03137255, 0, 1,
-2.499316, -0.880365, -3.02652, 1, 0.03529412, 0, 1,
-2.462116, 1.411279, -1.465951, 1, 0.04313726, 0, 1,
-2.328309, -1.396543, -1.832279, 1, 0.04705882, 0, 1,
-2.325674, 3.217785, -1.698658, 1, 0.05490196, 0, 1,
-2.182298, 0.5163777, -1.724034, 1, 0.05882353, 0, 1,
-2.161445, -0.08707123, -2.937739, 1, 0.06666667, 0, 1,
-2.129698, -0.6899121, -0.4388386, 1, 0.07058824, 0, 1,
-2.106431, 0.7325822, -1.549782, 1, 0.07843138, 0, 1,
-2.097418, -1.305667, -2.629798, 1, 0.08235294, 0, 1,
-2.073847, 0.6513037, -0.6049223, 1, 0.09019608, 0, 1,
-2.061179, -0.3596384, -3.256907, 1, 0.09411765, 0, 1,
-2.042022, 1.537852, -1.761297, 1, 0.1019608, 0, 1,
-2.018048, 0.4982495, -2.808136, 1, 0.1098039, 0, 1,
-2.003917, -1.196013, -1.479712, 1, 0.1137255, 0, 1,
-1.98657, -2.687478, -2.739576, 1, 0.1215686, 0, 1,
-1.984962, -1.641911, -2.481654, 1, 0.1254902, 0, 1,
-1.97183, -1.302662, -1.609725, 1, 0.1333333, 0, 1,
-1.956627, -0.988914, -1.636185, 1, 0.1372549, 0, 1,
-1.933474, -0.9431344, -2.497548, 1, 0.145098, 0, 1,
-1.909407, -0.05884503, -2.484286, 1, 0.1490196, 0, 1,
-1.898694, 0.4074195, -1.639699, 1, 0.1568628, 0, 1,
-1.895432, -1.296151, -3.066177, 1, 0.1607843, 0, 1,
-1.845054, 1.330505, 0.4621748, 1, 0.1686275, 0, 1,
-1.840145, -0.3207702, -0.6694872, 1, 0.172549, 0, 1,
-1.833051, -0.62428, -0.7296688, 1, 0.1803922, 0, 1,
-1.827148, 0.348408, -3.68681, 1, 0.1843137, 0, 1,
-1.788619, 0.8058985, -0.3036434, 1, 0.1921569, 0, 1,
-1.774152, -0.05746183, -2.294671, 1, 0.1960784, 0, 1,
-1.764549, 0.06902637, 0.3672615, 1, 0.2039216, 0, 1,
-1.738584, -0.9539421, -1.742391, 1, 0.2117647, 0, 1,
-1.725919, -1.472037, -3.069419, 1, 0.2156863, 0, 1,
-1.71499, -0.773088, -2.328765, 1, 0.2235294, 0, 1,
-1.698201, 0.1939799, -0.5485175, 1, 0.227451, 0, 1,
-1.69609, -1.329924, -2.096234, 1, 0.2352941, 0, 1,
-1.695459, 0.4216121, -2.001246, 1, 0.2392157, 0, 1,
-1.685818, -1.622294, -1.320856, 1, 0.2470588, 0, 1,
-1.684241, 1.007298, 0.1432386, 1, 0.2509804, 0, 1,
-1.676125, -1.222569, -0.3443013, 1, 0.2588235, 0, 1,
-1.661422, 0.7090436, -2.716139, 1, 0.2627451, 0, 1,
-1.654165, -1.905452, -2.787313, 1, 0.2705882, 0, 1,
-1.648697, 0.4100959, -1.76467, 1, 0.2745098, 0, 1,
-1.648193, -1.987575, -2.955995, 1, 0.282353, 0, 1,
-1.64373, -2.481049, -1.687486, 1, 0.2862745, 0, 1,
-1.641469, -1.414782, -3.257639, 1, 0.2941177, 0, 1,
-1.605579, -0.1927956, -0.7502746, 1, 0.3019608, 0, 1,
-1.601824, -2.039822, -3.49427, 1, 0.3058824, 0, 1,
-1.596715, -0.04254516, -1.02154, 1, 0.3137255, 0, 1,
-1.570525, 1.090582, -0.03163774, 1, 0.3176471, 0, 1,
-1.561231, 0.9718802, -1.926314, 1, 0.3254902, 0, 1,
-1.551361, -1.153698, -3.136143, 1, 0.3294118, 0, 1,
-1.551268, -0.1152977, -0.3497221, 1, 0.3372549, 0, 1,
-1.534252, -0.03956642, -2.077866, 1, 0.3411765, 0, 1,
-1.533439, -2.106349, -0.8155627, 1, 0.3490196, 0, 1,
-1.513513, 2.653378, -0.08808041, 1, 0.3529412, 0, 1,
-1.503153, -0.7846935, -3.42101, 1, 0.3607843, 0, 1,
-1.496949, 2.668358, -2.841378, 1, 0.3647059, 0, 1,
-1.488026, -1.062549, -3.643445, 1, 0.372549, 0, 1,
-1.47986, 1.113793, -1.035167, 1, 0.3764706, 0, 1,
-1.478424, 1.31132, -0.9486083, 1, 0.3843137, 0, 1,
-1.47456, -0.4305425, -1.84928, 1, 0.3882353, 0, 1,
-1.470637, -0.2947507, -0.4575147, 1, 0.3960784, 0, 1,
-1.465446, -1.683564, -2.770833, 1, 0.4039216, 0, 1,
-1.452273, 0.4446826, -1.14871, 1, 0.4078431, 0, 1,
-1.443119, 1.518783, -0.2541071, 1, 0.4156863, 0, 1,
-1.439429, 0.6358257, -2.187893, 1, 0.4196078, 0, 1,
-1.43458, 0.06452105, -0.8359039, 1, 0.427451, 0, 1,
-1.434388, -0.5324103, -0.8843774, 1, 0.4313726, 0, 1,
-1.422483, -0.6844476, -3.139383, 1, 0.4392157, 0, 1,
-1.406007, -0.1049977, -0.7378665, 1, 0.4431373, 0, 1,
-1.401597, 1.318029, -1.464722, 1, 0.4509804, 0, 1,
-1.389977, 0.1055941, -1.204319, 1, 0.454902, 0, 1,
-1.389719, -0.1932585, -1.985183, 1, 0.4627451, 0, 1,
-1.389492, -0.1112449, -0.3031811, 1, 0.4666667, 0, 1,
-1.386509, 0.7245449, 0.5002332, 1, 0.4745098, 0, 1,
-1.382792, 1.517626, -0.2573947, 1, 0.4784314, 0, 1,
-1.379047, -0.4647036, -0.1045983, 1, 0.4862745, 0, 1,
-1.376585, -0.4187499, -1.363031, 1, 0.4901961, 0, 1,
-1.376112, 1.568449, 0.6271561, 1, 0.4980392, 0, 1,
-1.365389, -2.216302, -2.713202, 1, 0.5058824, 0, 1,
-1.360965, -1.295408, -1.309229, 1, 0.509804, 0, 1,
-1.358681, -0.2083144, -1.622554, 1, 0.5176471, 0, 1,
-1.354888, -0.7289272, -0.1356568, 1, 0.5215687, 0, 1,
-1.352338, -0.07626571, -1.908248, 1, 0.5294118, 0, 1,
-1.350325, -0.6563314, -1.457256, 1, 0.5333334, 0, 1,
-1.34556, 1.485638, -0.1816941, 1, 0.5411765, 0, 1,
-1.345133, 0.4054016, -0.7070347, 1, 0.5450981, 0, 1,
-1.341963, -1.131876, -2.782323, 1, 0.5529412, 0, 1,
-1.33952, 1.90771, -0.3807532, 1, 0.5568628, 0, 1,
-1.336239, -0.95499, -1.58349, 1, 0.5647059, 0, 1,
-1.322876, -0.04446438, -0.175781, 1, 0.5686275, 0, 1,
-1.31266, 0.8536124, -1.762474, 1, 0.5764706, 0, 1,
-1.305148, 1.448141, -0.8756348, 1, 0.5803922, 0, 1,
-1.295841, -0.6508831, -3.00787, 1, 0.5882353, 0, 1,
-1.287492, 1.704249, -1.054157, 1, 0.5921569, 0, 1,
-1.282059, 1.731399, -0.4734096, 1, 0.6, 0, 1,
-1.268753, 1.158798, -0.6270213, 1, 0.6078432, 0, 1,
-1.259857, 1.091182, -2.229451, 1, 0.6117647, 0, 1,
-1.25534, -0.2119713, -2.344597, 1, 0.6196079, 0, 1,
-1.253761, -0.9618596, -1.826406, 1, 0.6235294, 0, 1,
-1.251039, -0.5561211, -2.056892, 1, 0.6313726, 0, 1,
-1.250938, 0.7971205, 0.5023603, 1, 0.6352941, 0, 1,
-1.250277, 0.5602972, -0.2839908, 1, 0.6431373, 0, 1,
-1.249858, 1.172366, 0.02169205, 1, 0.6470588, 0, 1,
-1.247927, -1.510686, -4.117106, 1, 0.654902, 0, 1,
-1.234002, 1.030645, -0.913642, 1, 0.6588235, 0, 1,
-1.233463, -1.145359, -2.380622, 1, 0.6666667, 0, 1,
-1.226984, -0.5035247, -3.809608, 1, 0.6705883, 0, 1,
-1.203694, -0.5814579, -2.690385, 1, 0.6784314, 0, 1,
-1.194145, -1.950175, -2.980784, 1, 0.682353, 0, 1,
-1.185025, 2.410294, 0.06291575, 1, 0.6901961, 0, 1,
-1.184079, -0.624036, -2.15427, 1, 0.6941177, 0, 1,
-1.177298, 1.670914, -0.6395698, 1, 0.7019608, 0, 1,
-1.170665, -0.985808, -3.289979, 1, 0.7098039, 0, 1,
-1.168645, -0.4124463, -2.495306, 1, 0.7137255, 0, 1,
-1.156259, -0.3959706, -0.8334822, 1, 0.7215686, 0, 1,
-1.151963, 0.021627, -1.093084, 1, 0.7254902, 0, 1,
-1.151566, 1.648839, -0.05359618, 1, 0.7333333, 0, 1,
-1.146542, -0.3710307, 0.3275686, 1, 0.7372549, 0, 1,
-1.1374, 0.1600094, -1.086568, 1, 0.7450981, 0, 1,
-1.136833, -0.082669, -2.198234, 1, 0.7490196, 0, 1,
-1.134673, -0.01483051, -1.23091, 1, 0.7568628, 0, 1,
-1.126512, 0.7104642, -0.6720721, 1, 0.7607843, 0, 1,
-1.126075, 0.6315542, -0.2058891, 1, 0.7686275, 0, 1,
-1.124788, -1.607727, -1.129021, 1, 0.772549, 0, 1,
-1.116166, 0.6912742, -0.847476, 1, 0.7803922, 0, 1,
-1.114042, 0.08746042, -2.124128, 1, 0.7843137, 0, 1,
-1.111807, 1.603621, -1.05941, 1, 0.7921569, 0, 1,
-1.111601, -0.03946022, -2.224245, 1, 0.7960784, 0, 1,
-1.102926, -1.256424, -0.9815048, 1, 0.8039216, 0, 1,
-1.09974, 0.4267036, 0.2521149, 1, 0.8117647, 0, 1,
-1.090997, -1.992005, -2.307329, 1, 0.8156863, 0, 1,
-1.086767, -0.3355767, -1.124977, 1, 0.8235294, 0, 1,
-1.086702, 0.2368527, -0.06823462, 1, 0.827451, 0, 1,
-1.083643, -0.8105498, -0.5347814, 1, 0.8352941, 0, 1,
-1.081057, -0.1819484, -1.537784, 1, 0.8392157, 0, 1,
-1.0809, -0.5008258, -1.230059, 1, 0.8470588, 0, 1,
-1.06156, 0.5937295, -1.269236, 1, 0.8509804, 0, 1,
-1.059205, 0.3881807, -2.744897, 1, 0.8588235, 0, 1,
-1.048231, -1.009913, -2.022228, 1, 0.8627451, 0, 1,
-1.038046, -0.4346743, -1.248837, 1, 0.8705882, 0, 1,
-1.038007, 1.032988, 0.2533311, 1, 0.8745098, 0, 1,
-1.037434, -0.5236028, -2.1678, 1, 0.8823529, 0, 1,
-1.030294, 0.6611844, -0.4976563, 1, 0.8862745, 0, 1,
-1.025745, 0.4084568, -0.5645213, 1, 0.8941177, 0, 1,
-1.023379, -1.373976, -3.123287, 1, 0.8980392, 0, 1,
-1.022746, 1.700756, -1.143412, 1, 0.9058824, 0, 1,
-1.020073, 1.402127, 0.4543633, 1, 0.9137255, 0, 1,
-1.014222, 0.1395796, -1.629451, 1, 0.9176471, 0, 1,
-1.008216, -0.4211087, -1.264488, 1, 0.9254902, 0, 1,
-0.9986431, -0.8054585, -3.129905, 1, 0.9294118, 0, 1,
-0.9983798, 0.3698127, -0.5048138, 1, 0.9372549, 0, 1,
-0.9982603, 0.253442, 0.0685961, 1, 0.9411765, 0, 1,
-0.9957889, -1.220152, -5.350709, 1, 0.9490196, 0, 1,
-0.9921251, 0.01316438, -0.7410169, 1, 0.9529412, 0, 1,
-0.9913235, -0.06317636, -1.794483, 1, 0.9607843, 0, 1,
-0.9894453, 0.9103991, -0.04061826, 1, 0.9647059, 0, 1,
-0.9883342, -0.2354547, -1.207669, 1, 0.972549, 0, 1,
-0.9879979, -1.071549, -2.424387, 1, 0.9764706, 0, 1,
-0.9850466, 0.3996591, -0.7485487, 1, 0.9843137, 0, 1,
-0.9845055, 0.9823311, 0.113685, 1, 0.9882353, 0, 1,
-0.9834356, 1.672626, -0.9751136, 1, 0.9960784, 0, 1,
-0.9792948, -0.4156864, -1.314978, 0.9960784, 1, 0, 1,
-0.9772161, -0.7250984, -2.52362, 0.9921569, 1, 0, 1,
-0.9721677, -0.117606, -0.3819319, 0.9843137, 1, 0, 1,
-0.9642843, 0.5781572, -0.726132, 0.9803922, 1, 0, 1,
-0.9622424, 0.09397501, -1.47612, 0.972549, 1, 0, 1,
-0.9605241, -1.76804, -4.146903, 0.9686275, 1, 0, 1,
-0.9579861, -1.951825, -2.411737, 0.9607843, 1, 0, 1,
-0.9481453, 1.01805, 0.6103011, 0.9568627, 1, 0, 1,
-0.947989, 0.9666659, 0.9941545, 0.9490196, 1, 0, 1,
-0.9407861, 0.1914964, -1.729269, 0.945098, 1, 0, 1,
-0.9377739, -2.14387, -2.971605, 0.9372549, 1, 0, 1,
-0.937238, -2.929988, -1.649258, 0.9333333, 1, 0, 1,
-0.9355704, 0.9934516, -1.343075, 0.9254902, 1, 0, 1,
-0.931723, -0.3365129, -1.15649, 0.9215686, 1, 0, 1,
-0.9289231, 0.01286514, -1.04099, 0.9137255, 1, 0, 1,
-0.9274907, -0.3443243, -2.826473, 0.9098039, 1, 0, 1,
-0.9224327, -0.8677284, -1.590678, 0.9019608, 1, 0, 1,
-0.9207226, -1.099614, -2.547165, 0.8941177, 1, 0, 1,
-0.9183084, -0.4473829, -1.683093, 0.8901961, 1, 0, 1,
-0.913029, 0.533006, -1.373653, 0.8823529, 1, 0, 1,
-0.9013418, -0.1839355, -0.05333805, 0.8784314, 1, 0, 1,
-0.8949264, -0.4791814, -1.268826, 0.8705882, 1, 0, 1,
-0.8882945, -0.08254598, -0.798409, 0.8666667, 1, 0, 1,
-0.886776, 0.4606654, 0.1579462, 0.8588235, 1, 0, 1,
-0.8822997, 0.1873152, -2.048423, 0.854902, 1, 0, 1,
-0.8765098, 0.8829125, -0.9666463, 0.8470588, 1, 0, 1,
-0.874095, 1.252832, -0.5043113, 0.8431373, 1, 0, 1,
-0.8728059, -1.902524, -2.217919, 0.8352941, 1, 0, 1,
-0.8716973, -0.2348941, -1.617423, 0.8313726, 1, 0, 1,
-0.8660778, 1.857746, 0.342871, 0.8235294, 1, 0, 1,
-0.8659873, 1.333877, -0.09784379, 0.8196079, 1, 0, 1,
-0.8631353, -0.6615651, -2.114348, 0.8117647, 1, 0, 1,
-0.8606218, -0.03628509, 0.1484883, 0.8078431, 1, 0, 1,
-0.8545371, 0.8701875, -2.411995, 0.8, 1, 0, 1,
-0.8516067, 0.03258875, -2.004803, 0.7921569, 1, 0, 1,
-0.8511474, -0.5903827, -3.613106, 0.7882353, 1, 0, 1,
-0.8482845, -1.44837, -2.743437, 0.7803922, 1, 0, 1,
-0.8445399, -1.029935, -1.315483, 0.7764706, 1, 0, 1,
-0.8362612, 1.764301, -1.880535, 0.7686275, 1, 0, 1,
-0.8323215, -0.5601518, -2.411971, 0.7647059, 1, 0, 1,
-0.8280482, 0.09255666, -1.530695, 0.7568628, 1, 0, 1,
-0.8271835, -0.198823, -0.2702673, 0.7529412, 1, 0, 1,
-0.8251334, -0.4049075, -1.369139, 0.7450981, 1, 0, 1,
-0.8175949, 0.7221053, -1.990079, 0.7411765, 1, 0, 1,
-0.8165006, -0.2338499, -2.745213, 0.7333333, 1, 0, 1,
-0.8133961, -0.3887724, 0.1867938, 0.7294118, 1, 0, 1,
-0.8112498, -0.3326717, -3.252847, 0.7215686, 1, 0, 1,
-0.8084428, 0.5763755, -0.6901868, 0.7176471, 1, 0, 1,
-0.8059004, -0.8209699, -3.545062, 0.7098039, 1, 0, 1,
-0.7973291, -0.226139, -0.7656111, 0.7058824, 1, 0, 1,
-0.7973267, -0.2400137, -2.586452, 0.6980392, 1, 0, 1,
-0.7929596, -1.347453, -2.374621, 0.6901961, 1, 0, 1,
-0.7924652, -2.15231, -2.32076, 0.6862745, 1, 0, 1,
-0.7915769, -1.287795, -2.546788, 0.6784314, 1, 0, 1,
-0.7889157, 1.590863, 1.05544, 0.6745098, 1, 0, 1,
-0.7861903, 1.033556, -1.69339, 0.6666667, 1, 0, 1,
-0.7832752, 1.273095, -0.6966469, 0.6627451, 1, 0, 1,
-0.7808794, -0.6464869, -0.9214523, 0.654902, 1, 0, 1,
-0.7800652, -0.9257138, -3.535723, 0.6509804, 1, 0, 1,
-0.7759742, -0.04571741, -0.3990862, 0.6431373, 1, 0, 1,
-0.7751021, -0.5207792, -1.017538, 0.6392157, 1, 0, 1,
-0.7712292, 0.5695541, -1.704185, 0.6313726, 1, 0, 1,
-0.7693824, -0.8037528, -3.266612, 0.627451, 1, 0, 1,
-0.7658025, 0.342729, -0.8437774, 0.6196079, 1, 0, 1,
-0.7639199, -0.6004347, -1.635335, 0.6156863, 1, 0, 1,
-0.7622238, -0.7228189, -1.429143, 0.6078432, 1, 0, 1,
-0.7548228, 1.36203, -1.629851, 0.6039216, 1, 0, 1,
-0.7537617, -1.551867, -2.253397, 0.5960785, 1, 0, 1,
-0.7500464, 0.7505714, -2.43304, 0.5882353, 1, 0, 1,
-0.7463316, 1.06826, 0.9049994, 0.5843138, 1, 0, 1,
-0.7369933, -0.1862944, -3.281685, 0.5764706, 1, 0, 1,
-0.7346575, -2.134402, -4.327063, 0.572549, 1, 0, 1,
-0.7200825, -0.7262582, -3.427572, 0.5647059, 1, 0, 1,
-0.7150934, 0.3779555, 0.3020051, 0.5607843, 1, 0, 1,
-0.7123021, 0.02827448, -2.464303, 0.5529412, 1, 0, 1,
-0.7046942, 0.9256021, -0.9327341, 0.5490196, 1, 0, 1,
-0.7020198, 0.2686784, 0.1811327, 0.5411765, 1, 0, 1,
-0.697787, -1.448164, -3.617514, 0.5372549, 1, 0, 1,
-0.695882, -1.196774, -3.741336, 0.5294118, 1, 0, 1,
-0.6939736, -2.299722, -3.144413, 0.5254902, 1, 0, 1,
-0.6839623, 1.187814, 0.6124926, 0.5176471, 1, 0, 1,
-0.6820701, 1.50545, 0.4680796, 0.5137255, 1, 0, 1,
-0.6806709, 0.4573207, -0.5888373, 0.5058824, 1, 0, 1,
-0.6797668, -1.628677, -2.953471, 0.5019608, 1, 0, 1,
-0.6760791, 0.3560649, -1.318904, 0.4941176, 1, 0, 1,
-0.6738111, -0.5161676, -0.2698742, 0.4862745, 1, 0, 1,
-0.6707598, -1.446917, -3.023182, 0.4823529, 1, 0, 1,
-0.6700516, -1.437119, -2.678758, 0.4745098, 1, 0, 1,
-0.668543, -0.8591982, -3.608709, 0.4705882, 1, 0, 1,
-0.6648663, -0.2245578, -2.118133, 0.4627451, 1, 0, 1,
-0.6627886, 0.1795661, -3.120278, 0.4588235, 1, 0, 1,
-0.6534158, -0.5378968, -2.06507, 0.4509804, 1, 0, 1,
-0.6487944, -1.167037, -3.137759, 0.4470588, 1, 0, 1,
-0.6399063, -1.38245, -2.575441, 0.4392157, 1, 0, 1,
-0.6370488, -0.4676148, -2.274235, 0.4352941, 1, 0, 1,
-0.6361206, -0.4650755, -1.45316, 0.427451, 1, 0, 1,
-0.6313586, 0.05481101, -2.490852, 0.4235294, 1, 0, 1,
-0.6306367, -2.355382, -3.573112, 0.4156863, 1, 0, 1,
-0.6301378, -0.6339719, -1.381569, 0.4117647, 1, 0, 1,
-0.6273767, -0.570372, -2.622178, 0.4039216, 1, 0, 1,
-0.6251533, -0.9283245, -1.661222, 0.3960784, 1, 0, 1,
-0.6220723, 0.8584201, -0.5384497, 0.3921569, 1, 0, 1,
-0.6175591, -1.625034, -3.980865, 0.3843137, 1, 0, 1,
-0.6100628, -1.939057, -3.604901, 0.3803922, 1, 0, 1,
-0.6097384, 0.1422639, -1.486585, 0.372549, 1, 0, 1,
-0.6064175, -0.5246861, -0.9917533, 0.3686275, 1, 0, 1,
-0.6048714, -0.817752, -2.300632, 0.3607843, 1, 0, 1,
-0.6041617, -1.184554, -1.303175, 0.3568628, 1, 0, 1,
-0.6019679, -1.549852, -2.557573, 0.3490196, 1, 0, 1,
-0.5990932, 1.723197, -0.04432864, 0.345098, 1, 0, 1,
-0.597881, 0.3504595, -0.9728676, 0.3372549, 1, 0, 1,
-0.5874192, 0.5169533, -1.580839, 0.3333333, 1, 0, 1,
-0.58547, 0.2415199, -1.499228, 0.3254902, 1, 0, 1,
-0.5854456, -1.806008, -2.20578, 0.3215686, 1, 0, 1,
-0.5819632, 1.60377, -1.562011, 0.3137255, 1, 0, 1,
-0.580191, 1.400073, 0.2683487, 0.3098039, 1, 0, 1,
-0.5791005, 1.068931, 0.3493426, 0.3019608, 1, 0, 1,
-0.5757012, -0.5343435, -1.648075, 0.2941177, 1, 0, 1,
-0.5740809, 0.3804848, -0.9770119, 0.2901961, 1, 0, 1,
-0.5736996, 0.41773, -1.179822, 0.282353, 1, 0, 1,
-0.5649858, 0.2333254, 0.263191, 0.2784314, 1, 0, 1,
-0.5613083, 0.6988677, -1.401423, 0.2705882, 1, 0, 1,
-0.5609915, -0.9798171, -3.411823, 0.2666667, 1, 0, 1,
-0.5564611, 1.050451, -0.1978252, 0.2588235, 1, 0, 1,
-0.5550311, 0.5382432, 0.4739752, 0.254902, 1, 0, 1,
-0.5542107, 1.349439, 0.2187683, 0.2470588, 1, 0, 1,
-0.5523544, -0.1944662, -3.715764, 0.2431373, 1, 0, 1,
-0.5485203, 1.743819, -1.394818, 0.2352941, 1, 0, 1,
-0.5441388, 0.4524745, -0.9201869, 0.2313726, 1, 0, 1,
-0.5384404, -1.906289, -3.560034, 0.2235294, 1, 0, 1,
-0.5365595, -1.027277, -2.303192, 0.2196078, 1, 0, 1,
-0.5324478, -0.11538, -1.459712, 0.2117647, 1, 0, 1,
-0.5321328, 0.2584259, -2.320369, 0.2078431, 1, 0, 1,
-0.530368, 0.302756, -0.6532371, 0.2, 1, 0, 1,
-0.5270189, 1.587884, 0.2501085, 0.1921569, 1, 0, 1,
-0.5267712, -0.3013328, -1.728136, 0.1882353, 1, 0, 1,
-0.5225466, -0.8924382, -2.169132, 0.1803922, 1, 0, 1,
-0.5156447, -1.079229, -3.303124, 0.1764706, 1, 0, 1,
-0.513163, 0.9951419, -0.1515858, 0.1686275, 1, 0, 1,
-0.4949613, -0.8441345, -2.904589, 0.1647059, 1, 0, 1,
-0.4944377, 0.4377521, -0.9308707, 0.1568628, 1, 0, 1,
-0.4909838, -0.3303058, -2.052618, 0.1529412, 1, 0, 1,
-0.4908404, 1.356667, -1.606538, 0.145098, 1, 0, 1,
-0.4875548, -1.508899, -2.09502, 0.1411765, 1, 0, 1,
-0.4870545, 0.5489401, 0.07334992, 0.1333333, 1, 0, 1,
-0.4799615, 0.6935654, -1.305908, 0.1294118, 1, 0, 1,
-0.4796089, 0.6365633, -1.983512, 0.1215686, 1, 0, 1,
-0.4780619, 0.6025455, -0.8572282, 0.1176471, 1, 0, 1,
-0.4725942, 1.739013, -0.3460566, 0.1098039, 1, 0, 1,
-0.4715231, -1.409295, -3.782309, 0.1058824, 1, 0, 1,
-0.470221, -1.562777, -2.477225, 0.09803922, 1, 0, 1,
-0.4700552, -1.014273, -2.771145, 0.09019608, 1, 0, 1,
-0.4697477, -0.4578175, 0.4861235, 0.08627451, 1, 0, 1,
-0.4676847, 1.017125, -0.8097262, 0.07843138, 1, 0, 1,
-0.462822, 0.6634973, -0.2811018, 0.07450981, 1, 0, 1,
-0.4609409, -0.04104634, -3.790306, 0.06666667, 1, 0, 1,
-0.4543408, 0.4035112, -1.154736, 0.0627451, 1, 0, 1,
-0.4490611, -0.1033591, -3.019141, 0.05490196, 1, 0, 1,
-0.4482966, -2.286759, -2.708118, 0.05098039, 1, 0, 1,
-0.446376, -1.337353, -2.729658, 0.04313726, 1, 0, 1,
-0.4443322, 0.06274827, -3.36765, 0.03921569, 1, 0, 1,
-0.4432804, 0.5138709, -0.1302589, 0.03137255, 1, 0, 1,
-0.4403394, 1.790975, -0.7791741, 0.02745098, 1, 0, 1,
-0.4394361, -0.2097877, -3.153826, 0.01960784, 1, 0, 1,
-0.4368786, -1.249099, -2.972656, 0.01568628, 1, 0, 1,
-0.4362193, -0.6922256, -4.492849, 0.007843138, 1, 0, 1,
-0.435958, -2.49457, -2.993411, 0.003921569, 1, 0, 1,
-0.4339373, -1.291499, -3.059141, 0, 1, 0.003921569, 1,
-0.4330075, -0.1719234, -1.167893, 0, 1, 0.01176471, 1,
-0.4300076, -0.3596367, -3.524033, 0, 1, 0.01568628, 1,
-0.4234705, 0.2293082, -2.327179, 0, 1, 0.02352941, 1,
-0.4227904, 1.288074, 1.000974, 0, 1, 0.02745098, 1,
-0.4224568, 0.9808159, -0.4967439, 0, 1, 0.03529412, 1,
-0.4216592, 0.7195198, 0.1827943, 0, 1, 0.03921569, 1,
-0.4213413, -1.764073, -5.200463, 0, 1, 0.04705882, 1,
-0.4199741, -1.214361, -3.412316, 0, 1, 0.05098039, 1,
-0.4196165, 0.926872, -1.432705, 0, 1, 0.05882353, 1,
-0.4149446, 0.4776131, -1.155434, 0, 1, 0.0627451, 1,
-0.4138628, 0.9409368, -1.508592, 0, 1, 0.07058824, 1,
-0.4097762, -0.9287011, -3.366163, 0, 1, 0.07450981, 1,
-0.3978546, -0.7646662, -3.310096, 0, 1, 0.08235294, 1,
-0.39515, -0.1512555, -2.008271, 0, 1, 0.08627451, 1,
-0.3949266, -0.4939052, -1.868975, 0, 1, 0.09411765, 1,
-0.3918221, -0.1467525, -1.093933, 0, 1, 0.1019608, 1,
-0.3905688, -0.1054977, -1.520217, 0, 1, 0.1058824, 1,
-0.3872338, 0.7320634, -1.267848, 0, 1, 0.1137255, 1,
-0.3848301, 0.798146, 1.093727, 0, 1, 0.1176471, 1,
-0.3791225, -0.1794205, -0.2654036, 0, 1, 0.1254902, 1,
-0.3790836, 1.093765, -0.237624, 0, 1, 0.1294118, 1,
-0.3783235, 0.08898085, -2.685696, 0, 1, 0.1372549, 1,
-0.3782732, 0.7280657, 0.3193067, 0, 1, 0.1411765, 1,
-0.3747182, 0.6222984, -1.461533, 0, 1, 0.1490196, 1,
-0.3731515, 0.2561738, -0.572242, 0, 1, 0.1529412, 1,
-0.3707862, -0.4551991, -2.829205, 0, 1, 0.1607843, 1,
-0.3692697, -0.6801447, -3.939851, 0, 1, 0.1647059, 1,
-0.3637874, 2.197602, -0.2743067, 0, 1, 0.172549, 1,
-0.362502, 0.7756707, -2.389452, 0, 1, 0.1764706, 1,
-0.3617323, -0.275156, -2.458369, 0, 1, 0.1843137, 1,
-0.3604955, 1.008138, -0.7787437, 0, 1, 0.1882353, 1,
-0.3538148, -0.7612108, -2.451288, 0, 1, 0.1960784, 1,
-0.3511891, -0.80658, -3.768482, 0, 1, 0.2039216, 1,
-0.35085, 0.7050135, -0.5139307, 0, 1, 0.2078431, 1,
-0.3503258, -2.739961, -2.303004, 0, 1, 0.2156863, 1,
-0.3497642, -1.000659, -3.246192, 0, 1, 0.2196078, 1,
-0.3490092, -1.223328, -3.089628, 0, 1, 0.227451, 1,
-0.3461691, 0.6711321, -0.8196623, 0, 1, 0.2313726, 1,
-0.3449758, 0.9435489, -0.7444855, 0, 1, 0.2392157, 1,
-0.3439892, 0.2633778, -0.01361978, 0, 1, 0.2431373, 1,
-0.3392071, -1.197179, -2.481415, 0, 1, 0.2509804, 1,
-0.3367732, 0.7923196, -0.2555364, 0, 1, 0.254902, 1,
-0.3367658, 0.3507242, -1.401068, 0, 1, 0.2627451, 1,
-0.3343868, -0.3329615, -2.51631, 0, 1, 0.2666667, 1,
-0.3325785, 0.3146758, -1.08081, 0, 1, 0.2745098, 1,
-0.3320352, -0.8274996, -2.090564, 0, 1, 0.2784314, 1,
-0.3279259, 2.014119, 0.07147457, 0, 1, 0.2862745, 1,
-0.3247671, -1.25516, -3.397922, 0, 1, 0.2901961, 1,
-0.3245696, -2.291033, -2.56117, 0, 1, 0.2980392, 1,
-0.3240786, -0.2448974, -1.844573, 0, 1, 0.3058824, 1,
-0.3220319, -0.5192019, -2.352287, 0, 1, 0.3098039, 1,
-0.3138155, 0.0846065, -0.02107132, 0, 1, 0.3176471, 1,
-0.3119735, -0.601144, -3.575858, 0, 1, 0.3215686, 1,
-0.3114135, -0.3946629, -2.839573, 0, 1, 0.3294118, 1,
-0.3092899, -0.2705278, -1.886655, 0, 1, 0.3333333, 1,
-0.3082987, 1.174917, 0.1726645, 0, 1, 0.3411765, 1,
-0.3047666, 1.85521, -2.237492, 0, 1, 0.345098, 1,
-0.3041781, 0.3985733, -1.908288, 0, 1, 0.3529412, 1,
-0.2932005, 0.3231001, -0.4763504, 0, 1, 0.3568628, 1,
-0.2928481, 1.396693, 2.616202, 0, 1, 0.3647059, 1,
-0.2923858, 0.6466711, 0.1097878, 0, 1, 0.3686275, 1,
-0.289416, -0.576592, -2.556776, 0, 1, 0.3764706, 1,
-0.2877843, 0.3383848, 0.4827891, 0, 1, 0.3803922, 1,
-0.2864928, -0.5238199, -3.871813, 0, 1, 0.3882353, 1,
-0.2854685, 0.4586771, -0.8110352, 0, 1, 0.3921569, 1,
-0.2847442, 0.4144423, 0.06331156, 0, 1, 0.4, 1,
-0.2841757, 0.8052541, -0.7605005, 0, 1, 0.4078431, 1,
-0.280433, -0.2139359, -1.384604, 0, 1, 0.4117647, 1,
-0.2789456, -0.02236778, -2.49479, 0, 1, 0.4196078, 1,
-0.2758431, -0.3274982, -4.166375, 0, 1, 0.4235294, 1,
-0.2758117, -1.795857, -2.662593, 0, 1, 0.4313726, 1,
-0.2755394, 0.9157505, -0.5646152, 0, 1, 0.4352941, 1,
-0.2748117, -1.145734, -2.973724, 0, 1, 0.4431373, 1,
-0.2741185, 1.058784, -0.4236954, 0, 1, 0.4470588, 1,
-0.2727798, 0.1392459, -1.218577, 0, 1, 0.454902, 1,
-0.2721717, 0.2979193, -1.158332, 0, 1, 0.4588235, 1,
-0.2712266, -0.2170275, -0.05496313, 0, 1, 0.4666667, 1,
-0.2671354, 2.655864, -1.357132, 0, 1, 0.4705882, 1,
-0.2613155, 0.149009, -1.938823, 0, 1, 0.4784314, 1,
-0.2606491, -0.2792599, -3.056136, 0, 1, 0.4823529, 1,
-0.2596982, 0.4388451, -0.6098803, 0, 1, 0.4901961, 1,
-0.2595128, -0.5458091, -2.671586, 0, 1, 0.4941176, 1,
-0.2585461, -0.4239798, -3.503775, 0, 1, 0.5019608, 1,
-0.257244, 0.4124401, -1.329225, 0, 1, 0.509804, 1,
-0.2552983, 0.1046841, -1.727915, 0, 1, 0.5137255, 1,
-0.2550901, 0.136484, -2.112351, 0, 1, 0.5215687, 1,
-0.254939, 1.247715, -1.452782, 0, 1, 0.5254902, 1,
-0.2512655, 0.34879, 0.9892067, 0, 1, 0.5333334, 1,
-0.250991, 1.797317, -0.6760681, 0, 1, 0.5372549, 1,
-0.2502615, 0.3357476, 0.03766241, 0, 1, 0.5450981, 1,
-0.2500862, -0.02562808, -2.088059, 0, 1, 0.5490196, 1,
-0.2496478, 0.6242008, -0.4400086, 0, 1, 0.5568628, 1,
-0.2437262, 0.06403501, -2.553885, 0, 1, 0.5607843, 1,
-0.2380844, -0.08639205, -2.170543, 0, 1, 0.5686275, 1,
-0.2378497, -0.2735609, -3.908404, 0, 1, 0.572549, 1,
-0.2369744, 0.2638981, -2.161667, 0, 1, 0.5803922, 1,
-0.2324635, -1.088007, -2.900622, 0, 1, 0.5843138, 1,
-0.2290494, 0.271598, -0.6860577, 0, 1, 0.5921569, 1,
-0.224232, -1.218301, -2.840449, 0, 1, 0.5960785, 1,
-0.2229708, 0.03659429, 0.294783, 0, 1, 0.6039216, 1,
-0.2215915, -0.788842, -2.906992, 0, 1, 0.6117647, 1,
-0.2203642, -1.048392, -4.026654, 0, 1, 0.6156863, 1,
-0.2200243, -0.914445, -4.288198, 0, 1, 0.6235294, 1,
-0.2175741, -0.1335104, -3.456028, 0, 1, 0.627451, 1,
-0.2160111, 1.961886, 0.1654585, 0, 1, 0.6352941, 1,
-0.2156136, -0.1970029, -1.476658, 0, 1, 0.6392157, 1,
-0.2104215, 0.08664334, 0.07645571, 0, 1, 0.6470588, 1,
-0.2103977, 0.44996, -1.108792, 0, 1, 0.6509804, 1,
-0.2092044, -1.595744, -2.456483, 0, 1, 0.6588235, 1,
-0.2086062, 1.530339, -1.184351, 0, 1, 0.6627451, 1,
-0.207448, 0.3750065, -0.3880516, 0, 1, 0.6705883, 1,
-0.2058867, -0.4429204, -3.130913, 0, 1, 0.6745098, 1,
-0.2057835, 1.41443, 0.02468985, 0, 1, 0.682353, 1,
-0.2024304, 0.4057564, 0.6225984, 0, 1, 0.6862745, 1,
-0.2007529, 0.646409, 1.462481, 0, 1, 0.6941177, 1,
-0.1990585, 1.50479, 0.02945219, 0, 1, 0.7019608, 1,
-0.1959526, 0.1221009, 0.1790223, 0, 1, 0.7058824, 1,
-0.1947377, -1.095622, -1.955657, 0, 1, 0.7137255, 1,
-0.1928767, 0.7964566, -0.9968841, 0, 1, 0.7176471, 1,
-0.1894353, -0.06353776, -2.500415, 0, 1, 0.7254902, 1,
-0.1838202, 0.1583723, -1.31592, 0, 1, 0.7294118, 1,
-0.1824744, -0.8189498, -2.343507, 0, 1, 0.7372549, 1,
-0.1749329, -0.8595299, -2.468697, 0, 1, 0.7411765, 1,
-0.1733398, -0.5755883, -2.748035, 0, 1, 0.7490196, 1,
-0.16863, -1.247033, -3.002736, 0, 1, 0.7529412, 1,
-0.1667089, 1.119476, -1.265123, 0, 1, 0.7607843, 1,
-0.1640972, -0.09261033, -2.971039, 0, 1, 0.7647059, 1,
-0.1626576, -0.07254407, -1.572966, 0, 1, 0.772549, 1,
-0.1477908, -1.390633, -2.363689, 0, 1, 0.7764706, 1,
-0.1396506, -0.7148814, -2.681537, 0, 1, 0.7843137, 1,
-0.1392151, 0.01346382, -0.3363698, 0, 1, 0.7882353, 1,
-0.1221647, 0.9292631, -0.4472607, 0, 1, 0.7960784, 1,
-0.121172, -0.9301631, -2.530138, 0, 1, 0.8039216, 1,
-0.1160632, 0.1163627, -1.093491, 0, 1, 0.8078431, 1,
-0.1155555, -0.7285361, -3.716268, 0, 1, 0.8156863, 1,
-0.114687, -0.3762341, -3.221123, 0, 1, 0.8196079, 1,
-0.1131678, -0.3896322, -3.873384, 0, 1, 0.827451, 1,
-0.1077948, 1.396738, 1.05929, 0, 1, 0.8313726, 1,
-0.1042439, -0.2599933, -3.694662, 0, 1, 0.8392157, 1,
-0.1036847, 1.108211, 0.6810706, 0, 1, 0.8431373, 1,
-0.09611965, -0.1418876, -2.267637, 0, 1, 0.8509804, 1,
-0.09497246, 1.267832, 1.155056, 0, 1, 0.854902, 1,
-0.09246938, -0.517468, -3.208759, 0, 1, 0.8627451, 1,
-0.08980619, 0.5649707, -0.8932754, 0, 1, 0.8666667, 1,
-0.08898097, 0.9104044, 0.524775, 0, 1, 0.8745098, 1,
-0.08715869, -0.7775871, -2.449618, 0, 1, 0.8784314, 1,
-0.08518689, -0.2604728, -2.427886, 0, 1, 0.8862745, 1,
-0.08225829, -0.5726556, -4.024408, 0, 1, 0.8901961, 1,
-0.07969236, 1.020409, -1.395702, 0, 1, 0.8980392, 1,
-0.07714497, 0.9425997, 0.3961643, 0, 1, 0.9058824, 1,
-0.0738671, 1.809861, 1.453789, 0, 1, 0.9098039, 1,
-0.07254709, 0.2229119, -0.6572559, 0, 1, 0.9176471, 1,
-0.06721745, 1.109086, -0.297199, 0, 1, 0.9215686, 1,
-0.06504431, 1.636384, -0.06686101, 0, 1, 0.9294118, 1,
-0.06486506, 0.5909216, -0.2312803, 0, 1, 0.9333333, 1,
-0.06481482, -0.2134594, -2.250174, 0, 1, 0.9411765, 1,
-0.06434116, 1.204285, 0.588218, 0, 1, 0.945098, 1,
-0.06402478, -0.7443995, -2.490121, 0, 1, 0.9529412, 1,
-0.06267175, 0.2947392, 0.5762451, 0, 1, 0.9568627, 1,
-0.06083037, 0.3765446, -0.3985868, 0, 1, 0.9647059, 1,
-0.06005729, 0.5372493, 0.8433717, 0, 1, 0.9686275, 1,
-0.0594473, 0.4735907, -0.5559996, 0, 1, 0.9764706, 1,
-0.05731114, 0.840652, 0.08018383, 0, 1, 0.9803922, 1,
-0.05624214, 0.733131, -2.005379, 0, 1, 0.9882353, 1,
-0.05471098, 0.4456508, -0.2874486, 0, 1, 0.9921569, 1,
-0.05209817, 0.3282346, 0.3697501, 0, 1, 1, 1,
-0.0423526, 0.8709555, -0.2236391, 0, 0.9921569, 1, 1,
-0.03897186, -1.02343, -3.073428, 0, 0.9882353, 1, 1,
-0.0379779, -0.05488765, -1.853571, 0, 0.9803922, 1, 1,
-0.03766618, -0.2660453, -3.459687, 0, 0.9764706, 1, 1,
-0.03760759, 0.04494322, -0.5237996, 0, 0.9686275, 1, 1,
-0.03330175, 0.3067687, 0.2827312, 0, 0.9647059, 1, 1,
-0.03317692, 0.09658328, -0.9632768, 0, 0.9568627, 1, 1,
-0.03277571, 1.106392, -0.742554, 0, 0.9529412, 1, 1,
-0.03257075, -0.701751, -2.882138, 0, 0.945098, 1, 1,
-0.02891491, -0.5901831, -1.599833, 0, 0.9411765, 1, 1,
-0.0280784, -0.06033596, -3.817736, 0, 0.9333333, 1, 1,
-0.02367209, 0.349554, 0.7032956, 0, 0.9294118, 1, 1,
-0.02349728, -0.7420879, -3.539628, 0, 0.9215686, 1, 1,
-0.02235817, 0.5924357, 0.793059, 0, 0.9176471, 1, 1,
-0.02221234, -0.7502363, -3.517798, 0, 0.9098039, 1, 1,
-0.01942106, -0.2850191, -1.994979, 0, 0.9058824, 1, 1,
-0.01867226, 0.6363723, -0.3231559, 0, 0.8980392, 1, 1,
-0.01822855, -0.2820955, -4.358404, 0, 0.8901961, 1, 1,
-0.01788897, 2.148629, -0.8583692, 0, 0.8862745, 1, 1,
-0.01720593, -1.645402, -4.491367, 0, 0.8784314, 1, 1,
-0.01589404, 0.7856811, 1.16707, 0, 0.8745098, 1, 1,
-0.01183605, 1.531004, -0.6210411, 0, 0.8666667, 1, 1,
-0.01158274, -0.4248033, -2.464344, 0, 0.8627451, 1, 1,
-0.008171134, 0.6305416, 1.180094, 0, 0.854902, 1, 1,
-0.006139448, 0.2412708, 1.12549, 0, 0.8509804, 1, 1,
-0.004964557, -3.074968, -2.822253, 0, 0.8431373, 1, 1,
0.004010943, -0.1840685, 5.19894, 0, 0.8392157, 1, 1,
0.006384905, -2.236156, 3.569208, 0, 0.8313726, 1, 1,
0.007774577, -1.782361, 2.554926, 0, 0.827451, 1, 1,
0.01134624, -0.6071166, 4.479702, 0, 0.8196079, 1, 1,
0.01349872, 0.768085, 0.1323804, 0, 0.8156863, 1, 1,
0.01791574, -1.221284, 2.620679, 0, 0.8078431, 1, 1,
0.01995265, -0.5714294, 1.822488, 0, 0.8039216, 1, 1,
0.02047782, 0.1653801, 1.253636, 0, 0.7960784, 1, 1,
0.02463555, 1.017796, 1.306102, 0, 0.7882353, 1, 1,
0.02601435, 0.3691324, 0.03867862, 0, 0.7843137, 1, 1,
0.02880602, 0.6922747, -0.4873918, 0, 0.7764706, 1, 1,
0.02916784, -1.061899, 2.680439, 0, 0.772549, 1, 1,
0.03096426, 0.07776672, 1.310693, 0, 0.7647059, 1, 1,
0.03434232, 1.09611, -0.3308617, 0, 0.7607843, 1, 1,
0.03649246, 1.443741, -0.1757347, 0, 0.7529412, 1, 1,
0.04169407, -0.8618761, 3.601416, 0, 0.7490196, 1, 1,
0.04253168, 1.561149, 0.09024963, 0, 0.7411765, 1, 1,
0.04531094, 0.1312179, 0.6139568, 0, 0.7372549, 1, 1,
0.04964705, -0.03347223, 2.662736, 0, 0.7294118, 1, 1,
0.05205924, 0.3268793, 0.09460212, 0, 0.7254902, 1, 1,
0.05392513, -0.02156013, 0.3354919, 0, 0.7176471, 1, 1,
0.05425622, -0.5998586, 3.81, 0, 0.7137255, 1, 1,
0.05688113, -0.3672914, 0.6688759, 0, 0.7058824, 1, 1,
0.06065152, 0.6618721, 0.6612676, 0, 0.6980392, 1, 1,
0.06212144, 1.059405, 0.9242676, 0, 0.6941177, 1, 1,
0.06901555, 1.754622, -1.545896, 0, 0.6862745, 1, 1,
0.06940141, -0.5887658, 1.800662, 0, 0.682353, 1, 1,
0.07139425, 0.02976726, 0.3421206, 0, 0.6745098, 1, 1,
0.07482465, -0.351203, 1.191228, 0, 0.6705883, 1, 1,
0.07664123, -0.8696665, 2.211541, 0, 0.6627451, 1, 1,
0.08524953, -1.403746, 2.787445, 0, 0.6588235, 1, 1,
0.08615112, -1.431544, 2.428984, 0, 0.6509804, 1, 1,
0.09377967, 0.995764, 1.057814, 0, 0.6470588, 1, 1,
0.09915496, -0.281549, 3.152163, 0, 0.6392157, 1, 1,
0.1028917, -1.229261, 3.558524, 0, 0.6352941, 1, 1,
0.1042591, 1.092041, 0.8609906, 0, 0.627451, 1, 1,
0.1087903, -0.5624003, 4.087114, 0, 0.6235294, 1, 1,
0.1130514, -0.3385046, 2.848759, 0, 0.6156863, 1, 1,
0.1133734, 1.36207, -0.5533212, 0, 0.6117647, 1, 1,
0.1138628, -1.193471, 4.686048, 0, 0.6039216, 1, 1,
0.1202212, 0.5524604, 1.030513, 0, 0.5960785, 1, 1,
0.1209371, 2.495538, 0.8623798, 0, 0.5921569, 1, 1,
0.1336151, 0.4901654, -0.0229256, 0, 0.5843138, 1, 1,
0.1360735, 0.5175018, 0.5283767, 0, 0.5803922, 1, 1,
0.1470436, -0.9896708, 2.294743, 0, 0.572549, 1, 1,
0.1502343, 0.3577859, -0.4006201, 0, 0.5686275, 1, 1,
0.1526675, 0.4588005, 1.689813, 0, 0.5607843, 1, 1,
0.155382, 0.8712262, 0.2104435, 0, 0.5568628, 1, 1,
0.1591219, -0.6353617, 3.378364, 0, 0.5490196, 1, 1,
0.1621347, 1.762157, -0.7049924, 0, 0.5450981, 1, 1,
0.1636904, -2.209853, 2.209092, 0, 0.5372549, 1, 1,
0.1655739, 1.011525, -0.357015, 0, 0.5333334, 1, 1,
0.1663284, -1.92406, 4.580633, 0, 0.5254902, 1, 1,
0.1745309, 0.4796871, -0.5598883, 0, 0.5215687, 1, 1,
0.1747316, -1.889468, 0.5144883, 0, 0.5137255, 1, 1,
0.1781698, 1.947547, -2.028034, 0, 0.509804, 1, 1,
0.178713, 0.01600415, 1.054126, 0, 0.5019608, 1, 1,
0.1812279, -0.5348317, 2.550246, 0, 0.4941176, 1, 1,
0.1833453, -0.8504583, 2.905924, 0, 0.4901961, 1, 1,
0.1856062, 2.818043, -1.905034, 0, 0.4823529, 1, 1,
0.1894643, -3.828404, 3.102856, 0, 0.4784314, 1, 1,
0.1925689, -0.8669733, 5.186, 0, 0.4705882, 1, 1,
0.1942314, -0.004842165, 4.542137, 0, 0.4666667, 1, 1,
0.1950084, -0.9550558, 3.326778, 0, 0.4588235, 1, 1,
0.1951808, -0.8865676, 3.745273, 0, 0.454902, 1, 1,
0.1951935, 0.4027948, 2.267098, 0, 0.4470588, 1, 1,
0.1956926, -0.3666127, 3.010753, 0, 0.4431373, 1, 1,
0.1960882, 0.6131735, 2.642096, 0, 0.4352941, 1, 1,
0.1975961, 1.317158, -1.257651, 0, 0.4313726, 1, 1,
0.1984321, 1.584171, 0.6922516, 0, 0.4235294, 1, 1,
0.2007298, -0.8408273, 2.31701, 0, 0.4196078, 1, 1,
0.2064898, -0.00642365, 2.216124, 0, 0.4117647, 1, 1,
0.2084804, 0.3646376, 2.048003, 0, 0.4078431, 1, 1,
0.2103488, 1.357643, -0.6810857, 0, 0.4, 1, 1,
0.2145776, -0.859795, 3.723251, 0, 0.3921569, 1, 1,
0.2167894, 0.4075007, 0.3075741, 0, 0.3882353, 1, 1,
0.2199139, 1.890338, 0.03331631, 0, 0.3803922, 1, 1,
0.2199272, 1.306529, -0.1109646, 0, 0.3764706, 1, 1,
0.2201748, -0.7142072, 3.47526, 0, 0.3686275, 1, 1,
0.2204697, -0.2183408, 1.236533, 0, 0.3647059, 1, 1,
0.2298933, 0.7972755, 0.6365147, 0, 0.3568628, 1, 1,
0.232529, -0.4289365, 2.043858, 0, 0.3529412, 1, 1,
0.2334151, -0.752337, 2.37393, 0, 0.345098, 1, 1,
0.2381297, 0.3069826, 1.360347, 0, 0.3411765, 1, 1,
0.2387462, 1.009078, 0.3373386, 0, 0.3333333, 1, 1,
0.2424078, 0.2674901, 0.6259252, 0, 0.3294118, 1, 1,
0.2441376, 0.6001933, 0.1493841, 0, 0.3215686, 1, 1,
0.2462634, -0.2241935, 0.09833229, 0, 0.3176471, 1, 1,
0.2494437, 1.029783, 0.1290363, 0, 0.3098039, 1, 1,
0.2518615, -1.235648, 1.421625, 0, 0.3058824, 1, 1,
0.252988, -0.4141113, 2.45922, 0, 0.2980392, 1, 1,
0.2571985, -2.235053, 2.207237, 0, 0.2901961, 1, 1,
0.2585439, -0.1617254, 2.842144, 0, 0.2862745, 1, 1,
0.2620539, 1.372273, 1.271484, 0, 0.2784314, 1, 1,
0.2645045, -0.6784682, 0.7062472, 0, 0.2745098, 1, 1,
0.2661584, 0.03466223, 1.342701, 0, 0.2666667, 1, 1,
0.2713267, 1.102193, 0.05532592, 0, 0.2627451, 1, 1,
0.2730633, -0.6640174, 3.545521, 0, 0.254902, 1, 1,
0.2737138, -1.691311, 3.13294, 0, 0.2509804, 1, 1,
0.2742208, 1.150225, 1.073462, 0, 0.2431373, 1, 1,
0.2754375, 1.401381, 0.2052891, 0, 0.2392157, 1, 1,
0.283383, -1.401532, 2.255665, 0, 0.2313726, 1, 1,
0.2850655, -0.6893666, 2.330216, 0, 0.227451, 1, 1,
0.2892735, -0.805293, 3.268756, 0, 0.2196078, 1, 1,
0.290691, -1.71483, 4.290181, 0, 0.2156863, 1, 1,
0.2910951, -0.1136552, 1.956025, 0, 0.2078431, 1, 1,
0.2946422, 0.2379956, 2.170306, 0, 0.2039216, 1, 1,
0.2966147, 0.7298766, 1.10322, 0, 0.1960784, 1, 1,
0.2987773, 0.1677648, 0.9616805, 0, 0.1882353, 1, 1,
0.2987948, -0.1654963, 2.570892, 0, 0.1843137, 1, 1,
0.2989997, -0.2252505, -0.1499307, 0, 0.1764706, 1, 1,
0.2998784, 1.563453, 0.03936922, 0, 0.172549, 1, 1,
0.3007645, -0.1202206, 1.511675, 0, 0.1647059, 1, 1,
0.3061459, -2.644403, 2.627159, 0, 0.1607843, 1, 1,
0.3067027, -0.633358, 3.213542, 0, 0.1529412, 1, 1,
0.3116894, 0.08616806, 1.766317, 0, 0.1490196, 1, 1,
0.3120683, 0.4995989, 0.8009063, 0, 0.1411765, 1, 1,
0.3199753, -1.86553, 3.086166, 0, 0.1372549, 1, 1,
0.3202666, 0.7826747, 0.5789678, 0, 0.1294118, 1, 1,
0.3234734, 0.1458375, 0.7061343, 0, 0.1254902, 1, 1,
0.3241062, -0.7293249, 3.926997, 0, 0.1176471, 1, 1,
0.3254151, 0.2111253, 1.907197, 0, 0.1137255, 1, 1,
0.3271672, 0.03053431, 0.9157638, 0, 0.1058824, 1, 1,
0.3332686, -0.4696438, 3.927726, 0, 0.09803922, 1, 1,
0.3455581, 0.05826845, 2.723032, 0, 0.09411765, 1, 1,
0.3479552, -0.4819521, 1.94412, 0, 0.08627451, 1, 1,
0.3505794, -0.0306196, 0.365293, 0, 0.08235294, 1, 1,
0.3548404, 0.7625764, -0.7187629, 0, 0.07450981, 1, 1,
0.3568261, -0.528687, 3.811425, 0, 0.07058824, 1, 1,
0.3575133, 0.07592065, 1.871774, 0, 0.0627451, 1, 1,
0.3603338, -0.818696, 3.805297, 0, 0.05882353, 1, 1,
0.3647154, -1.181661, 2.448625, 0, 0.05098039, 1, 1,
0.3648842, 0.0095327, 1.677884, 0, 0.04705882, 1, 1,
0.3665795, -0.5196481, 3.600665, 0, 0.03921569, 1, 1,
0.3670411, -1.190637, 2.674755, 0, 0.03529412, 1, 1,
0.3673099, -0.7258987, 1.204067, 0, 0.02745098, 1, 1,
0.3780723, -0.8027586, 2.416663, 0, 0.02352941, 1, 1,
0.3836796, -0.1562043, 2.059237, 0, 0.01568628, 1, 1,
0.3886375, 0.3082733, 0.7011794, 0, 0.01176471, 1, 1,
0.3905655, -0.3323866, 2.740661, 0, 0.003921569, 1, 1,
0.3907577, -0.4155695, 3.101777, 0.003921569, 0, 1, 1,
0.392712, 0.6810992, 0.2173906, 0.007843138, 0, 1, 1,
0.3973751, -1.379445, 3.276318, 0.01568628, 0, 1, 1,
0.3980078, -0.2157344, 0.2483952, 0.01960784, 0, 1, 1,
0.3996056, 0.381864, 0.8648283, 0.02745098, 0, 1, 1,
0.4021102, 0.1884193, 0.9618189, 0.03137255, 0, 1, 1,
0.4065008, -0.5979915, 2.803213, 0.03921569, 0, 1, 1,
0.4083084, -0.3406621, 3.371439, 0.04313726, 0, 1, 1,
0.4100391, -0.1154247, 2.674237, 0.05098039, 0, 1, 1,
0.4142944, 0.06993803, 2.237238, 0.05490196, 0, 1, 1,
0.4163494, 0.4411048, 1.174143, 0.0627451, 0, 1, 1,
0.4165686, 0.713559, -0.2266218, 0.06666667, 0, 1, 1,
0.4181154, 0.9534683, 0.7583994, 0.07450981, 0, 1, 1,
0.4185351, -0.6683103, 0.8657894, 0.07843138, 0, 1, 1,
0.4210402, -0.06355074, -0.2830662, 0.08627451, 0, 1, 1,
0.4240431, 0.5494637, -0.4444441, 0.09019608, 0, 1, 1,
0.4248162, -0.9323965, 0.6035956, 0.09803922, 0, 1, 1,
0.4296764, 0.485137, 2.25063, 0.1058824, 0, 1, 1,
0.4450966, 1.58474, 1.433659, 0.1098039, 0, 1, 1,
0.4475428, 0.3085768, 1.595679, 0.1176471, 0, 1, 1,
0.4487345, 0.4280573, -0.04634221, 0.1215686, 0, 1, 1,
0.4490444, -0.6093382, 3.521691, 0.1294118, 0, 1, 1,
0.4494594, 0.5880165, 0.2454276, 0.1333333, 0, 1, 1,
0.4516667, 0.8670371, -0.03061048, 0.1411765, 0, 1, 1,
0.458087, -0.1883841, 1.847364, 0.145098, 0, 1, 1,
0.4585336, 1.132402, 1.689818, 0.1529412, 0, 1, 1,
0.4640604, -1.298452, 2.205112, 0.1568628, 0, 1, 1,
0.4671085, 1.873328, 0.7168488, 0.1647059, 0, 1, 1,
0.4711338, -0.8701269, 1.91079, 0.1686275, 0, 1, 1,
0.4763182, 0.04819375, 1.26395, 0.1764706, 0, 1, 1,
0.477089, -0.3887278, 0.2912215, 0.1803922, 0, 1, 1,
0.4825048, 0.08125737, 1.788762, 0.1882353, 0, 1, 1,
0.4884895, 0.2674935, 0.1577407, 0.1921569, 0, 1, 1,
0.4889998, 0.3289784, 1.303064, 0.2, 0, 1, 1,
0.493257, -0.5415958, 1.962094, 0.2078431, 0, 1, 1,
0.4952911, 0.9058106, -1.199942, 0.2117647, 0, 1, 1,
0.4977698, -1.095875, 4.000019, 0.2196078, 0, 1, 1,
0.4990867, -0.2563385, 0.7220221, 0.2235294, 0, 1, 1,
0.5032931, -1.21232, 0.5151988, 0.2313726, 0, 1, 1,
0.5043708, 0.1751992, 2.003732, 0.2352941, 0, 1, 1,
0.5087855, -1.331482, 1.39384, 0.2431373, 0, 1, 1,
0.5088995, -1.957112, 3.033558, 0.2470588, 0, 1, 1,
0.5127568, 0.7568327, 1.529786, 0.254902, 0, 1, 1,
0.5144693, -0.3935149, 1.800645, 0.2588235, 0, 1, 1,
0.5144745, 0.148611, 1.497036, 0.2666667, 0, 1, 1,
0.5148969, -1.504741, 2.13294, 0.2705882, 0, 1, 1,
0.5159515, -0.2350757, 2.006081, 0.2784314, 0, 1, 1,
0.5201458, -0.4595072, 1.613556, 0.282353, 0, 1, 1,
0.5335747, -1.028177, 2.17435, 0.2901961, 0, 1, 1,
0.5343123, -0.09557392, 1.780344, 0.2941177, 0, 1, 1,
0.5351299, -0.1759194, 1.284964, 0.3019608, 0, 1, 1,
0.5351409, 0.4041115, -0.4469135, 0.3098039, 0, 1, 1,
0.5473348, 1.089711, -0.2057196, 0.3137255, 0, 1, 1,
0.5496872, 0.02002638, 0.9420984, 0.3215686, 0, 1, 1,
0.5519682, -0.3152189, 0.9604099, 0.3254902, 0, 1, 1,
0.5548944, 1.070583, 1.106812, 0.3333333, 0, 1, 1,
0.5558224, -0.5630431, 3.287084, 0.3372549, 0, 1, 1,
0.5592031, -0.2077961, 2.414891, 0.345098, 0, 1, 1,
0.5608875, -1.770298, 2.471794, 0.3490196, 0, 1, 1,
0.5610585, -1.359848, 2.651074, 0.3568628, 0, 1, 1,
0.5628024, 1.354905, 0.3543208, 0.3607843, 0, 1, 1,
0.5633205, -0.1500072, 1.96534, 0.3686275, 0, 1, 1,
0.5648883, -1.465709, 3.651595, 0.372549, 0, 1, 1,
0.5698791, 0.1003978, -0.1014956, 0.3803922, 0, 1, 1,
0.573362, -0.8485625, 3.727927, 0.3843137, 0, 1, 1,
0.5755765, -1.694758, 3.042197, 0.3921569, 0, 1, 1,
0.583923, -0.6511937, 2.06357, 0.3960784, 0, 1, 1,
0.5856352, 0.3328023, 0.1236073, 0.4039216, 0, 1, 1,
0.587578, 1.184828, 0.4152309, 0.4117647, 0, 1, 1,
0.5924944, 0.3376149, 1.366738, 0.4156863, 0, 1, 1,
0.598836, -1.455423, 1.473052, 0.4235294, 0, 1, 1,
0.600705, -0.02289962, 1.909094, 0.427451, 0, 1, 1,
0.6033547, -0.01053819, 1.710633, 0.4352941, 0, 1, 1,
0.6076952, -1.681507, 1.415331, 0.4392157, 0, 1, 1,
0.6198456, -2.219473, 3.191983, 0.4470588, 0, 1, 1,
0.6233003, -0.5452228, 2.220347, 0.4509804, 0, 1, 1,
0.6233982, -0.787991, 3.024069, 0.4588235, 0, 1, 1,
0.6253846, -0.2847149, 1.119425, 0.4627451, 0, 1, 1,
0.6290175, -1.658348, 3.80817, 0.4705882, 0, 1, 1,
0.6295211, 0.6484948, -0.6703406, 0.4745098, 0, 1, 1,
0.6357585, 0.2401154, 2.100574, 0.4823529, 0, 1, 1,
0.6397834, -0.267812, 3.213288, 0.4862745, 0, 1, 1,
0.6405416, 0.8665462, 1.012484, 0.4941176, 0, 1, 1,
0.6406366, 0.8011082, -0.1614638, 0.5019608, 0, 1, 1,
0.6476019, 1.134794, 1.535614, 0.5058824, 0, 1, 1,
0.6598104, -0.7085932, 2.5432, 0.5137255, 0, 1, 1,
0.661144, -0.1309199, 0.3985576, 0.5176471, 0, 1, 1,
0.6620096, 0.5220067, 1.696343, 0.5254902, 0, 1, 1,
0.6621078, 1.730013, 0.1687568, 0.5294118, 0, 1, 1,
0.6634104, 1.647157, 2.390939, 0.5372549, 0, 1, 1,
0.6692529, 0.3783294, 0.5650535, 0.5411765, 0, 1, 1,
0.6728004, 0.2621647, 0.5726127, 0.5490196, 0, 1, 1,
0.6853272, 0.1781891, 1.488802, 0.5529412, 0, 1, 1,
0.687713, -0.04895831, 1.596438, 0.5607843, 0, 1, 1,
0.687816, -1.663895, 2.293464, 0.5647059, 0, 1, 1,
0.6922345, -0.3639238, 3.457107, 0.572549, 0, 1, 1,
0.6945605, 0.3432399, 3.293259, 0.5764706, 0, 1, 1,
0.6965365, 0.220286, 1.305522, 0.5843138, 0, 1, 1,
0.702935, -0.02148842, 0.9104674, 0.5882353, 0, 1, 1,
0.7048982, -1.176162, 1.48472, 0.5960785, 0, 1, 1,
0.7063315, -1.543466, 1.618711, 0.6039216, 0, 1, 1,
0.7101028, -0.9336125, 1.209442, 0.6078432, 0, 1, 1,
0.7143474, -0.4114003, 2.627506, 0.6156863, 0, 1, 1,
0.7155555, 0.8960212, 0.9696616, 0.6196079, 0, 1, 1,
0.7161395, 1.257804, 0.5965885, 0.627451, 0, 1, 1,
0.7257004, -0.7196615, 1.52775, 0.6313726, 0, 1, 1,
0.7258862, -0.5780492, 1.009349, 0.6392157, 0, 1, 1,
0.7270571, 2.245109, -0.08975107, 0.6431373, 0, 1, 1,
0.7286616, 0.2878275, 1.216817, 0.6509804, 0, 1, 1,
0.7287809, 0.8196756, 1.375009, 0.654902, 0, 1, 1,
0.7299433, -0.5725452, 0.8339837, 0.6627451, 0, 1, 1,
0.7319418, -0.5584936, 1.627677, 0.6666667, 0, 1, 1,
0.7347747, 2.022835, -0.3751135, 0.6745098, 0, 1, 1,
0.7348489, -1.194937, 3.739962, 0.6784314, 0, 1, 1,
0.7495075, 1.896656, 0.6663896, 0.6862745, 0, 1, 1,
0.7497314, -1.323063, 2.437375, 0.6901961, 0, 1, 1,
0.7606075, -1.858001, 2.656874, 0.6980392, 0, 1, 1,
0.7716683, 1.344431, -1.613572, 0.7058824, 0, 1, 1,
0.7729995, 0.2911033, 2.228984, 0.7098039, 0, 1, 1,
0.7737961, -0.5391836, 2.076485, 0.7176471, 0, 1, 1,
0.7748342, 0.5239102, 0.6117285, 0.7215686, 0, 1, 1,
0.7780841, 0.07861643, 0.05641889, 0.7294118, 0, 1, 1,
0.7782462, -1.326881, 2.395671, 0.7333333, 0, 1, 1,
0.780916, 0.585794, 1.098268, 0.7411765, 0, 1, 1,
0.7830835, -0.0611779, 2.11015, 0.7450981, 0, 1, 1,
0.7882448, -1.705868, 2.444541, 0.7529412, 0, 1, 1,
0.7903725, 0.8217901, 1.46587, 0.7568628, 0, 1, 1,
0.7932954, -1.494325, 2.420718, 0.7647059, 0, 1, 1,
0.8004661, -0.200581, 2.973464, 0.7686275, 0, 1, 1,
0.8034168, 1.015388, 0.607989, 0.7764706, 0, 1, 1,
0.8119601, 1.906238, -0.3977823, 0.7803922, 0, 1, 1,
0.815298, -2.158794, 1.978403, 0.7882353, 0, 1, 1,
0.8281141, -1.902564, 5.839211, 0.7921569, 0, 1, 1,
0.8308934, -0.2921379, 0.5869363, 0.8, 0, 1, 1,
0.8339922, -0.221649, 1.803387, 0.8078431, 0, 1, 1,
0.8363799, 0.5718959, 1.446448, 0.8117647, 0, 1, 1,
0.8416004, 0.7750239, 2.512319, 0.8196079, 0, 1, 1,
0.8419008, 0.8899823, 0.02975666, 0.8235294, 0, 1, 1,
0.8477954, -0.3096105, 3.09616, 0.8313726, 0, 1, 1,
0.8491377, -0.4943223, 0.1933288, 0.8352941, 0, 1, 1,
0.8493377, -0.6839011, -0.1016298, 0.8431373, 0, 1, 1,
0.8523316, -0.5889593, 2.749203, 0.8470588, 0, 1, 1,
0.8547767, 0.5394093, 0.9255257, 0.854902, 0, 1, 1,
0.8575894, 0.9501116, -0.4687698, 0.8588235, 0, 1, 1,
0.8592407, 0.8029068, 1.576751, 0.8666667, 0, 1, 1,
0.8719174, -0.9983148, 3.644139, 0.8705882, 0, 1, 1,
0.87192, 0.3523332, 1.654335, 0.8784314, 0, 1, 1,
0.879742, -0.7410702, -0.1656457, 0.8823529, 0, 1, 1,
0.8824627, -0.7772849, 1.131313, 0.8901961, 0, 1, 1,
0.8894404, 0.07405493, 1.30622, 0.8941177, 0, 1, 1,
0.8900545, -0.3070475, 0.67361, 0.9019608, 0, 1, 1,
0.8947289, 1.321705, 1.638459, 0.9098039, 0, 1, 1,
0.9034539, -1.513244, 2.700523, 0.9137255, 0, 1, 1,
0.9042143, -1.567498, 2.78374, 0.9215686, 0, 1, 1,
0.9136611, -0.4562354, 2.83673, 0.9254902, 0, 1, 1,
0.9152149, 0.9630329, 0.2995945, 0.9333333, 0, 1, 1,
0.9166645, 0.08936271, 2.607156, 0.9372549, 0, 1, 1,
0.9197068, -1.180317, 2.439158, 0.945098, 0, 1, 1,
0.9258052, -0.7282927, 2.280399, 0.9490196, 0, 1, 1,
0.9386474, 0.9206911, 1.698246, 0.9568627, 0, 1, 1,
0.941379, 0.2724666, 0.008594041, 0.9607843, 0, 1, 1,
0.9438648, -1.274405, 4.087937, 0.9686275, 0, 1, 1,
0.9453462, -0.8161802, 2.112217, 0.972549, 0, 1, 1,
0.9624828, 0.6647538, 0.9292583, 0.9803922, 0, 1, 1,
0.9635596, 0.4725007, 2.112975, 0.9843137, 0, 1, 1,
0.9650147, 0.7912694, 1.954756, 0.9921569, 0, 1, 1,
0.9703415, 1.005458, 1.523664, 0.9960784, 0, 1, 1,
0.9710537, 0.4642515, -1.449514, 1, 0, 0.9960784, 1,
0.9737453, -0.4572836, 0.2490796, 1, 0, 0.9882353, 1,
0.9794311, 0.5016301, 0.177768, 1, 0, 0.9843137, 1,
0.9795995, -1.219237, 2.652693, 1, 0, 0.9764706, 1,
0.9854801, 0.5029491, -0.112946, 1, 0, 0.972549, 1,
0.9866824, 1.422407, -1.337064, 1, 0, 0.9647059, 1,
0.9938981, -1.866419, 2.918437, 1, 0, 0.9607843, 1,
0.9998074, -0.2256522, 0.9425849, 1, 0, 0.9529412, 1,
1.00117, 0.707859, -0.3864067, 1, 0, 0.9490196, 1,
1.002316, -0.3329989, 2.554301, 1, 0, 0.9411765, 1,
1.015626, -1.333526, 2.972533, 1, 0, 0.9372549, 1,
1.020435, 0.487089, 0.8665745, 1, 0, 0.9294118, 1,
1.024361, -2.230907, 3.403774, 1, 0, 0.9254902, 1,
1.025779, 1.065886, 0.2891047, 1, 0, 0.9176471, 1,
1.041498, -0.8848355, 2.172317, 1, 0, 0.9137255, 1,
1.04398, 1.869782, 2.650689, 1, 0, 0.9058824, 1,
1.05087, 1.665837, 0.1596286, 1, 0, 0.9019608, 1,
1.055188, 0.2735236, 0.002992933, 1, 0, 0.8941177, 1,
1.060582, 0.1632168, 0.7252818, 1, 0, 0.8862745, 1,
1.063017, 0.3954521, 3.884113, 1, 0, 0.8823529, 1,
1.064618, -0.9218488, 2.206078, 1, 0, 0.8745098, 1,
1.069698, 0.8229089, 0.4859208, 1, 0, 0.8705882, 1,
1.075632, 0.9925272, 0.5716087, 1, 0, 0.8627451, 1,
1.078398, -0.5036435, 1.23508, 1, 0, 0.8588235, 1,
1.081014, -0.3857188, 2.105823, 1, 0, 0.8509804, 1,
1.084523, -0.528031, 2.911574, 1, 0, 0.8470588, 1,
1.091095, 0.7677634, 0.5667687, 1, 0, 0.8392157, 1,
1.094423, 0.7665634, 2.081656, 1, 0, 0.8352941, 1,
1.100861, -0.14991, 3.075748, 1, 0, 0.827451, 1,
1.101674, 0.02623919, 2.079473, 1, 0, 0.8235294, 1,
1.103792, 0.2657177, 2.231867, 1, 0, 0.8156863, 1,
1.10499, -1.227385, 1.445879, 1, 0, 0.8117647, 1,
1.113727, -0.01106587, 4.421965, 1, 0, 0.8039216, 1,
1.115522, 2.871757, 1.240576, 1, 0, 0.7960784, 1,
1.118125, -0.7073101, 2.308548, 1, 0, 0.7921569, 1,
1.124817, 0.6759801, 1.397266, 1, 0, 0.7843137, 1,
1.126943, 1.832196, 1.651333, 1, 0, 0.7803922, 1,
1.128507, 1.032361, 0.6131068, 1, 0, 0.772549, 1,
1.12895, 1.467127, 0.8786039, 1, 0, 0.7686275, 1,
1.135191, -0.3840305, 0.382707, 1, 0, 0.7607843, 1,
1.140129, 0.5503774, 1.096339, 1, 0, 0.7568628, 1,
1.166849, -0.04180168, 0.5559872, 1, 0, 0.7490196, 1,
1.167202, -0.608546, 2.5898, 1, 0, 0.7450981, 1,
1.169503, -0.4492483, 3.189166, 1, 0, 0.7372549, 1,
1.170967, -1.000847, 1.961008, 1, 0, 0.7333333, 1,
1.179905, 0.4747411, -0.02486927, 1, 0, 0.7254902, 1,
1.180176, 0.01502637, 2.794152, 1, 0, 0.7215686, 1,
1.181036, -0.3139787, 2.36367, 1, 0, 0.7137255, 1,
1.184687, -1.979653, 1.187258, 1, 0, 0.7098039, 1,
1.18993, -0.8938497, 2.851524, 1, 0, 0.7019608, 1,
1.201376, -1.422225, 1.948126, 1, 0, 0.6941177, 1,
1.204031, -2.04353, 0.9014344, 1, 0, 0.6901961, 1,
1.209935, 1.084128, 0.8223923, 1, 0, 0.682353, 1,
1.211043, 0.4962258, 0.9559606, 1, 0, 0.6784314, 1,
1.21839, -0.8551562, 1.667336, 1, 0, 0.6705883, 1,
1.230587, -0.5260168, 0.07542907, 1, 0, 0.6666667, 1,
1.233055, -0.58675, 2.519528, 1, 0, 0.6588235, 1,
1.233088, 0.7063739, 1.033921, 1, 0, 0.654902, 1,
1.236544, -0.3267915, 2.068916, 1, 0, 0.6470588, 1,
1.249038, -0.6307174, 2.03223, 1, 0, 0.6431373, 1,
1.251179, 0.4130636, 3.162256, 1, 0, 0.6352941, 1,
1.25629, -0.08940096, 2.54678, 1, 0, 0.6313726, 1,
1.257572, -0.4961303, 2.455187, 1, 0, 0.6235294, 1,
1.272916, -1.136454, 0.8969873, 1, 0, 0.6196079, 1,
1.278884, 0.06433955, 0.4370884, 1, 0, 0.6117647, 1,
1.280663, -0.8607558, 3.389589, 1, 0, 0.6078432, 1,
1.283021, 0.1302491, 0.3837822, 1, 0, 0.6, 1,
1.296067, 0.0009983229, 1.953608, 1, 0, 0.5921569, 1,
1.29627, 0.6054404, 0.01803814, 1, 0, 0.5882353, 1,
1.299324, -0.467941, 2.114741, 1, 0, 0.5803922, 1,
1.301324, 0.4568286, 0.9482304, 1, 0, 0.5764706, 1,
1.315628, 1.415035, 0.8974263, 1, 0, 0.5686275, 1,
1.318696, 0.2594653, 1.371081, 1, 0, 0.5647059, 1,
1.319467, -0.8129109, 3.006041, 1, 0, 0.5568628, 1,
1.320318, -0.1652065, 2.032354, 1, 0, 0.5529412, 1,
1.324469, -1.92403, 1.915059, 1, 0, 0.5450981, 1,
1.330273, -0.9019747, -0.2959121, 1, 0, 0.5411765, 1,
1.33774, 1.982256, 1.92658, 1, 0, 0.5333334, 1,
1.341747, -1.244558, 2.327502, 1, 0, 0.5294118, 1,
1.355067, 0.4041947, 2.924234, 1, 0, 0.5215687, 1,
1.361031, 0.9729142, 2.552364, 1, 0, 0.5176471, 1,
1.363678, -0.6015351, 2.784374, 1, 0, 0.509804, 1,
1.370876, 0.5307916, 0.9481268, 1, 0, 0.5058824, 1,
1.371059, -0.8205706, 2.594342, 1, 0, 0.4980392, 1,
1.373959, -0.8307846, 2.429879, 1, 0, 0.4901961, 1,
1.39902, 0.6523473, 1.788463, 1, 0, 0.4862745, 1,
1.416747, -0.903235, 1.529733, 1, 0, 0.4784314, 1,
1.418567, 1.080099, 1.753933, 1, 0, 0.4745098, 1,
1.423792, -0.05571068, 2.336805, 1, 0, 0.4666667, 1,
1.432339, 1.089787, 0.188693, 1, 0, 0.4627451, 1,
1.437523, -0.6182081, 1.795729, 1, 0, 0.454902, 1,
1.440025, -2.177825, 5.039593, 1, 0, 0.4509804, 1,
1.441655, -0.4660321, 3.310587, 1, 0, 0.4431373, 1,
1.443424, -0.6506466, 1.195689, 1, 0, 0.4392157, 1,
1.443791, 1.841788, 0.5002984, 1, 0, 0.4313726, 1,
1.446752, -0.7727134, 3.32679, 1, 0, 0.427451, 1,
1.455284, 0.0172622, 1.599157, 1, 0, 0.4196078, 1,
1.458948, -0.1877956, 0.9527627, 1, 0, 0.4156863, 1,
1.465456, -1.870018, 1.858926, 1, 0, 0.4078431, 1,
1.472086, -1.337927, 3.009591, 1, 0, 0.4039216, 1,
1.4749, 0.5868322, 1.401461, 1, 0, 0.3960784, 1,
1.49243, -1.336921, 3.27606, 1, 0, 0.3882353, 1,
1.492659, 0.3597704, 1.036555, 1, 0, 0.3843137, 1,
1.499264, 0.665834, 0.7304459, 1, 0, 0.3764706, 1,
1.502504, 0.2411034, 2.164603, 1, 0, 0.372549, 1,
1.504091, -0.1441255, 0.6962447, 1, 0, 0.3647059, 1,
1.50819, 0.5185292, 1.434924, 1, 0, 0.3607843, 1,
1.513711, -0.9951504, 3.353696, 1, 0, 0.3529412, 1,
1.516567, 0.4817136, 0.5847976, 1, 0, 0.3490196, 1,
1.525213, 0.4584612, 3.279432, 1, 0, 0.3411765, 1,
1.540258, 0.3205326, 1.747934, 1, 0, 0.3372549, 1,
1.550592, 0.343592, 1.56277, 1, 0, 0.3294118, 1,
1.558157, 0.2741761, 1.407437, 1, 0, 0.3254902, 1,
1.565456, -0.1203125, 1.025337, 1, 0, 0.3176471, 1,
1.566309, 2.267878, 0.5668187, 1, 0, 0.3137255, 1,
1.589641, 0.6141058, 2.264062, 1, 0, 0.3058824, 1,
1.591849, -0.6941828, 0.8675689, 1, 0, 0.2980392, 1,
1.609188, 1.579805, -1.038516, 1, 0, 0.2941177, 1,
1.621257, 0.9010189, -0.7736141, 1, 0, 0.2862745, 1,
1.63258, 0.7729658, 0.5527727, 1, 0, 0.282353, 1,
1.636001, -0.8839108, 1.869351, 1, 0, 0.2745098, 1,
1.63928, -0.1752262, 2.565452, 1, 0, 0.2705882, 1,
1.639695, -0.4491033, 1.02941, 1, 0, 0.2627451, 1,
1.639936, -0.2214422, 3.676459, 1, 0, 0.2588235, 1,
1.640442, 0.6776401, 1.080756, 1, 0, 0.2509804, 1,
1.644528, -0.5615659, 0.9608454, 1, 0, 0.2470588, 1,
1.652757, -0.88493, 3.702095, 1, 0, 0.2392157, 1,
1.696271, 1.984672, 0.5163658, 1, 0, 0.2352941, 1,
1.704714, 0.5465702, 1.569982, 1, 0, 0.227451, 1,
1.728831, -1.247975, 1.204349, 1, 0, 0.2235294, 1,
1.735826, 1.27345, 1.736011, 1, 0, 0.2156863, 1,
1.765631, 0.1426571, 1.658003, 1, 0, 0.2117647, 1,
1.788264, -1.651071, 5.082327, 1, 0, 0.2039216, 1,
1.798813, -1.784844, 2.052564, 1, 0, 0.1960784, 1,
1.813237, -0.3920582, 3.841502, 1, 0, 0.1921569, 1,
1.826002, 0.6562923, 0.4226307, 1, 0, 0.1843137, 1,
1.839206, 1.691014, -0.5496299, 1, 0, 0.1803922, 1,
1.856053, 1.242244, 1.418906, 1, 0, 0.172549, 1,
1.876621, -0.2466706, 0.7808809, 1, 0, 0.1686275, 1,
1.876843, 1.158898, 2.313685, 1, 0, 0.1607843, 1,
1.882948, -0.4404845, 1.231331, 1, 0, 0.1568628, 1,
1.896764, -1.655449, 1.857459, 1, 0, 0.1490196, 1,
1.899692, 0.8742471, 1.090763, 1, 0, 0.145098, 1,
1.932141, 0.1618768, 2.787981, 1, 0, 0.1372549, 1,
1.992008, 0.2093271, 2.285075, 1, 0, 0.1333333, 1,
2.009514, -2.303406, 2.744087, 1, 0, 0.1254902, 1,
2.018762, 0.1039041, 2.885978, 1, 0, 0.1215686, 1,
2.023899, 0.4125573, 0.8610653, 1, 0, 0.1137255, 1,
2.032128, -1.262846, 2.465064, 1, 0, 0.1098039, 1,
2.046601, 1.197086, 0.3696639, 1, 0, 0.1019608, 1,
2.049295, 0.3563237, 1.222855, 1, 0, 0.09411765, 1,
2.100349, -0.2894998, 1.435195, 1, 0, 0.09019608, 1,
2.151487, 0.0032211, 1.550368, 1, 0, 0.08235294, 1,
2.214634, 1.936134, 0.6755784, 1, 0, 0.07843138, 1,
2.241341, -1.527558, 3.649932, 1, 0, 0.07058824, 1,
2.322298, 1.412851, -1.372785, 1, 0, 0.06666667, 1,
2.325341, -0.6143007, 3.06956, 1, 0, 0.05882353, 1,
2.327565, -0.2959791, 0.07371471, 1, 0, 0.05490196, 1,
2.376857, 1.318425, -0.02254418, 1, 0, 0.04705882, 1,
2.469315, 0.6794738, 1.525784, 1, 0, 0.04313726, 1,
2.538551, -0.3360019, 2.742449, 1, 0, 0.03529412, 1,
2.640401, -0.1657583, 0.3019752, 1, 0, 0.03137255, 1,
2.695567, -0.4339752, 3.08206, 1, 0, 0.02352941, 1,
2.737897, -0.1227185, 1.655759, 1, 0, 0.01960784, 1,
2.96474, -0.3664978, 3.607376, 1, 0, 0.01176471, 1,
4.253649, 0.8444998, 1.931831, 1, 0, 0.007843138, 1
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
0.6180115, -5.022733, -7.2474, 0, -0.5, 0.5, 0.5,
0.6180115, -5.022733, -7.2474, 1, -0.5, 0.5, 0.5,
0.6180115, -5.022733, -7.2474, 1, 1.5, 0.5, 0.5,
0.6180115, -5.022733, -7.2474, 0, 1.5, 0.5, 0.5
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
-4.250107, -0.3053094, -7.2474, 0, -0.5, 0.5, 0.5,
-4.250107, -0.3053094, -7.2474, 1, -0.5, 0.5, 0.5,
-4.250107, -0.3053094, -7.2474, 1, 1.5, 0.5, 0.5,
-4.250107, -0.3053094, -7.2474, 0, 1.5, 0.5, 0.5
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
-4.250107, -5.022733, 0.2442508, 0, -0.5, 0.5, 0.5,
-4.250107, -5.022733, 0.2442508, 1, -0.5, 0.5, 0.5,
-4.250107, -5.022733, 0.2442508, 1, 1.5, 0.5, 0.5,
-4.250107, -5.022733, 0.2442508, 0, 1.5, 0.5, 0.5
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
-2, -3.934097, -5.518558,
4, -3.934097, -5.518558,
-2, -3.934097, -5.518558,
-2, -4.115536, -5.806698,
0, -3.934097, -5.518558,
0, -4.115536, -5.806698,
2, -3.934097, -5.518558,
2, -4.115536, -5.806698,
4, -3.934097, -5.518558,
4, -4.115536, -5.806698
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
-2, -4.478415, -6.382979, 0, -0.5, 0.5, 0.5,
-2, -4.478415, -6.382979, 1, -0.5, 0.5, 0.5,
-2, -4.478415, -6.382979, 1, 1.5, 0.5, 0.5,
-2, -4.478415, -6.382979, 0, 1.5, 0.5, 0.5,
0, -4.478415, -6.382979, 0, -0.5, 0.5, 0.5,
0, -4.478415, -6.382979, 1, -0.5, 0.5, 0.5,
0, -4.478415, -6.382979, 1, 1.5, 0.5, 0.5,
0, -4.478415, -6.382979, 0, 1.5, 0.5, 0.5,
2, -4.478415, -6.382979, 0, -0.5, 0.5, 0.5,
2, -4.478415, -6.382979, 1, -0.5, 0.5, 0.5,
2, -4.478415, -6.382979, 1, 1.5, 0.5, 0.5,
2, -4.478415, -6.382979, 0, 1.5, 0.5, 0.5,
4, -4.478415, -6.382979, 0, -0.5, 0.5, 0.5,
4, -4.478415, -6.382979, 1, -0.5, 0.5, 0.5,
4, -4.478415, -6.382979, 1, 1.5, 0.5, 0.5,
4, -4.478415, -6.382979, 0, 1.5, 0.5, 0.5
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
-3.126695, -2, -5.518558,
-3.126695, 2, -5.518558,
-3.126695, -2, -5.518558,
-3.31393, -2, -5.806698,
-3.126695, 0, -5.518558,
-3.31393, 0, -5.806698,
-3.126695, 2, -5.518558,
-3.31393, 2, -5.806698
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
-3.688401, -2, -6.382979, 0, -0.5, 0.5, 0.5,
-3.688401, -2, -6.382979, 1, -0.5, 0.5, 0.5,
-3.688401, -2, -6.382979, 1, 1.5, 0.5, 0.5,
-3.688401, -2, -6.382979, 0, 1.5, 0.5, 0.5,
-3.688401, 0, -6.382979, 0, -0.5, 0.5, 0.5,
-3.688401, 0, -6.382979, 1, -0.5, 0.5, 0.5,
-3.688401, 0, -6.382979, 1, 1.5, 0.5, 0.5,
-3.688401, 0, -6.382979, 0, 1.5, 0.5, 0.5,
-3.688401, 2, -6.382979, 0, -0.5, 0.5, 0.5,
-3.688401, 2, -6.382979, 1, -0.5, 0.5, 0.5,
-3.688401, 2, -6.382979, 1, 1.5, 0.5, 0.5,
-3.688401, 2, -6.382979, 0, 1.5, 0.5, 0.5
]);
for (var i=0; i<3; i++) 
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
8, 9, 10, 8, 10, 11
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
-3.126695, -3.934097, -4,
-3.126695, -3.934097, 4,
-3.126695, -3.934097, -4,
-3.31393, -4.115536, -4,
-3.126695, -3.934097, -2,
-3.31393, -4.115536, -2,
-3.126695, -3.934097, 0,
-3.31393, -4.115536, 0,
-3.126695, -3.934097, 2,
-3.31393, -4.115536, 2,
-3.126695, -3.934097, 4,
-3.31393, -4.115536, 4
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
-3.688401, -4.478415, -4, 0, -0.5, 0.5, 0.5,
-3.688401, -4.478415, -4, 1, -0.5, 0.5, 0.5,
-3.688401, -4.478415, -4, 1, 1.5, 0.5, 0.5,
-3.688401, -4.478415, -4, 0, 1.5, 0.5, 0.5,
-3.688401, -4.478415, -2, 0, -0.5, 0.5, 0.5,
-3.688401, -4.478415, -2, 1, -0.5, 0.5, 0.5,
-3.688401, -4.478415, -2, 1, 1.5, 0.5, 0.5,
-3.688401, -4.478415, -2, 0, 1.5, 0.5, 0.5,
-3.688401, -4.478415, 0, 0, -0.5, 0.5, 0.5,
-3.688401, -4.478415, 0, 1, -0.5, 0.5, 0.5,
-3.688401, -4.478415, 0, 1, 1.5, 0.5, 0.5,
-3.688401, -4.478415, 0, 0, 1.5, 0.5, 0.5,
-3.688401, -4.478415, 2, 0, -0.5, 0.5, 0.5,
-3.688401, -4.478415, 2, 1, -0.5, 0.5, 0.5,
-3.688401, -4.478415, 2, 1, 1.5, 0.5, 0.5,
-3.688401, -4.478415, 2, 0, 1.5, 0.5, 0.5,
-3.688401, -4.478415, 4, 0, -0.5, 0.5, 0.5,
-3.688401, -4.478415, 4, 1, -0.5, 0.5, 0.5,
-3.688401, -4.478415, 4, 1, 1.5, 0.5, 0.5,
-3.688401, -4.478415, 4, 0, 1.5, 0.5, 0.5
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
-3.126695, -3.934097, -5.518558,
-3.126695, 3.323478, -5.518558,
-3.126695, -3.934097, 6.007059,
-3.126695, 3.323478, 6.007059,
-3.126695, -3.934097, -5.518558,
-3.126695, -3.934097, 6.007059,
-3.126695, 3.323478, -5.518558,
-3.126695, 3.323478, 6.007059,
-3.126695, -3.934097, -5.518558,
4.362718, -3.934097, -5.518558,
-3.126695, -3.934097, 6.007059,
4.362718, -3.934097, 6.007059,
-3.126695, 3.323478, -5.518558,
4.362718, 3.323478, -5.518558,
-3.126695, 3.323478, 6.007059,
4.362718, 3.323478, 6.007059,
4.362718, -3.934097, -5.518558,
4.362718, 3.323478, -5.518558,
4.362718, -3.934097, 6.007059,
4.362718, 3.323478, 6.007059,
4.362718, -3.934097, -5.518558,
4.362718, -3.934097, 6.007059,
4.362718, 3.323478, -5.518558,
4.362718, 3.323478, 6.007059
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
var radius = 8.299981;
var distance = 36.92756;
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
mvMatrix.translate( -0.6180115, 0.3053094, -0.2442508 );
mvMatrix.scale( 1.198238, 1.236515, 0.7786223 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.92756);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
diamide<-read.table("diamide.xyz")
```

```
## Error in read.table("diamide.xyz"): no lines available in input
```

```r
x<-diamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'diamide' not found
```

```r
y<-diamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'diamide' not found
```

```r
z<-diamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'diamide' not found
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
-3.017626, 0.4496683, -2.257685, 0, 0, 1, 1, 1,
-2.833811, -1.116644, -2.275422, 1, 0, 0, 1, 1,
-2.727104, 0.8697659, -3.156995, 1, 0, 0, 1, 1,
-2.723338, 0.6640143, -1.620897, 1, 0, 0, 1, 1,
-2.601513, 0.03631856, -1.381325, 1, 0, 0, 1, 1,
-2.51156, 0.1655552, -3.227253, 1, 0, 0, 1, 1,
-2.499316, -0.880365, -3.02652, 0, 0, 0, 1, 1,
-2.462116, 1.411279, -1.465951, 0, 0, 0, 1, 1,
-2.328309, -1.396543, -1.832279, 0, 0, 0, 1, 1,
-2.325674, 3.217785, -1.698658, 0, 0, 0, 1, 1,
-2.182298, 0.5163777, -1.724034, 0, 0, 0, 1, 1,
-2.161445, -0.08707123, -2.937739, 0, 0, 0, 1, 1,
-2.129698, -0.6899121, -0.4388386, 0, 0, 0, 1, 1,
-2.106431, 0.7325822, -1.549782, 1, 1, 1, 1, 1,
-2.097418, -1.305667, -2.629798, 1, 1, 1, 1, 1,
-2.073847, 0.6513037, -0.6049223, 1, 1, 1, 1, 1,
-2.061179, -0.3596384, -3.256907, 1, 1, 1, 1, 1,
-2.042022, 1.537852, -1.761297, 1, 1, 1, 1, 1,
-2.018048, 0.4982495, -2.808136, 1, 1, 1, 1, 1,
-2.003917, -1.196013, -1.479712, 1, 1, 1, 1, 1,
-1.98657, -2.687478, -2.739576, 1, 1, 1, 1, 1,
-1.984962, -1.641911, -2.481654, 1, 1, 1, 1, 1,
-1.97183, -1.302662, -1.609725, 1, 1, 1, 1, 1,
-1.956627, -0.988914, -1.636185, 1, 1, 1, 1, 1,
-1.933474, -0.9431344, -2.497548, 1, 1, 1, 1, 1,
-1.909407, -0.05884503, -2.484286, 1, 1, 1, 1, 1,
-1.898694, 0.4074195, -1.639699, 1, 1, 1, 1, 1,
-1.895432, -1.296151, -3.066177, 1, 1, 1, 1, 1,
-1.845054, 1.330505, 0.4621748, 0, 0, 1, 1, 1,
-1.840145, -0.3207702, -0.6694872, 1, 0, 0, 1, 1,
-1.833051, -0.62428, -0.7296688, 1, 0, 0, 1, 1,
-1.827148, 0.348408, -3.68681, 1, 0, 0, 1, 1,
-1.788619, 0.8058985, -0.3036434, 1, 0, 0, 1, 1,
-1.774152, -0.05746183, -2.294671, 1, 0, 0, 1, 1,
-1.764549, 0.06902637, 0.3672615, 0, 0, 0, 1, 1,
-1.738584, -0.9539421, -1.742391, 0, 0, 0, 1, 1,
-1.725919, -1.472037, -3.069419, 0, 0, 0, 1, 1,
-1.71499, -0.773088, -2.328765, 0, 0, 0, 1, 1,
-1.698201, 0.1939799, -0.5485175, 0, 0, 0, 1, 1,
-1.69609, -1.329924, -2.096234, 0, 0, 0, 1, 1,
-1.695459, 0.4216121, -2.001246, 0, 0, 0, 1, 1,
-1.685818, -1.622294, -1.320856, 1, 1, 1, 1, 1,
-1.684241, 1.007298, 0.1432386, 1, 1, 1, 1, 1,
-1.676125, -1.222569, -0.3443013, 1, 1, 1, 1, 1,
-1.661422, 0.7090436, -2.716139, 1, 1, 1, 1, 1,
-1.654165, -1.905452, -2.787313, 1, 1, 1, 1, 1,
-1.648697, 0.4100959, -1.76467, 1, 1, 1, 1, 1,
-1.648193, -1.987575, -2.955995, 1, 1, 1, 1, 1,
-1.64373, -2.481049, -1.687486, 1, 1, 1, 1, 1,
-1.641469, -1.414782, -3.257639, 1, 1, 1, 1, 1,
-1.605579, -0.1927956, -0.7502746, 1, 1, 1, 1, 1,
-1.601824, -2.039822, -3.49427, 1, 1, 1, 1, 1,
-1.596715, -0.04254516, -1.02154, 1, 1, 1, 1, 1,
-1.570525, 1.090582, -0.03163774, 1, 1, 1, 1, 1,
-1.561231, 0.9718802, -1.926314, 1, 1, 1, 1, 1,
-1.551361, -1.153698, -3.136143, 1, 1, 1, 1, 1,
-1.551268, -0.1152977, -0.3497221, 0, 0, 1, 1, 1,
-1.534252, -0.03956642, -2.077866, 1, 0, 0, 1, 1,
-1.533439, -2.106349, -0.8155627, 1, 0, 0, 1, 1,
-1.513513, 2.653378, -0.08808041, 1, 0, 0, 1, 1,
-1.503153, -0.7846935, -3.42101, 1, 0, 0, 1, 1,
-1.496949, 2.668358, -2.841378, 1, 0, 0, 1, 1,
-1.488026, -1.062549, -3.643445, 0, 0, 0, 1, 1,
-1.47986, 1.113793, -1.035167, 0, 0, 0, 1, 1,
-1.478424, 1.31132, -0.9486083, 0, 0, 0, 1, 1,
-1.47456, -0.4305425, -1.84928, 0, 0, 0, 1, 1,
-1.470637, -0.2947507, -0.4575147, 0, 0, 0, 1, 1,
-1.465446, -1.683564, -2.770833, 0, 0, 0, 1, 1,
-1.452273, 0.4446826, -1.14871, 0, 0, 0, 1, 1,
-1.443119, 1.518783, -0.2541071, 1, 1, 1, 1, 1,
-1.439429, 0.6358257, -2.187893, 1, 1, 1, 1, 1,
-1.43458, 0.06452105, -0.8359039, 1, 1, 1, 1, 1,
-1.434388, -0.5324103, -0.8843774, 1, 1, 1, 1, 1,
-1.422483, -0.6844476, -3.139383, 1, 1, 1, 1, 1,
-1.406007, -0.1049977, -0.7378665, 1, 1, 1, 1, 1,
-1.401597, 1.318029, -1.464722, 1, 1, 1, 1, 1,
-1.389977, 0.1055941, -1.204319, 1, 1, 1, 1, 1,
-1.389719, -0.1932585, -1.985183, 1, 1, 1, 1, 1,
-1.389492, -0.1112449, -0.3031811, 1, 1, 1, 1, 1,
-1.386509, 0.7245449, 0.5002332, 1, 1, 1, 1, 1,
-1.382792, 1.517626, -0.2573947, 1, 1, 1, 1, 1,
-1.379047, -0.4647036, -0.1045983, 1, 1, 1, 1, 1,
-1.376585, -0.4187499, -1.363031, 1, 1, 1, 1, 1,
-1.376112, 1.568449, 0.6271561, 1, 1, 1, 1, 1,
-1.365389, -2.216302, -2.713202, 0, 0, 1, 1, 1,
-1.360965, -1.295408, -1.309229, 1, 0, 0, 1, 1,
-1.358681, -0.2083144, -1.622554, 1, 0, 0, 1, 1,
-1.354888, -0.7289272, -0.1356568, 1, 0, 0, 1, 1,
-1.352338, -0.07626571, -1.908248, 1, 0, 0, 1, 1,
-1.350325, -0.6563314, -1.457256, 1, 0, 0, 1, 1,
-1.34556, 1.485638, -0.1816941, 0, 0, 0, 1, 1,
-1.345133, 0.4054016, -0.7070347, 0, 0, 0, 1, 1,
-1.341963, -1.131876, -2.782323, 0, 0, 0, 1, 1,
-1.33952, 1.90771, -0.3807532, 0, 0, 0, 1, 1,
-1.336239, -0.95499, -1.58349, 0, 0, 0, 1, 1,
-1.322876, -0.04446438, -0.175781, 0, 0, 0, 1, 1,
-1.31266, 0.8536124, -1.762474, 0, 0, 0, 1, 1,
-1.305148, 1.448141, -0.8756348, 1, 1, 1, 1, 1,
-1.295841, -0.6508831, -3.00787, 1, 1, 1, 1, 1,
-1.287492, 1.704249, -1.054157, 1, 1, 1, 1, 1,
-1.282059, 1.731399, -0.4734096, 1, 1, 1, 1, 1,
-1.268753, 1.158798, -0.6270213, 1, 1, 1, 1, 1,
-1.259857, 1.091182, -2.229451, 1, 1, 1, 1, 1,
-1.25534, -0.2119713, -2.344597, 1, 1, 1, 1, 1,
-1.253761, -0.9618596, -1.826406, 1, 1, 1, 1, 1,
-1.251039, -0.5561211, -2.056892, 1, 1, 1, 1, 1,
-1.250938, 0.7971205, 0.5023603, 1, 1, 1, 1, 1,
-1.250277, 0.5602972, -0.2839908, 1, 1, 1, 1, 1,
-1.249858, 1.172366, 0.02169205, 1, 1, 1, 1, 1,
-1.247927, -1.510686, -4.117106, 1, 1, 1, 1, 1,
-1.234002, 1.030645, -0.913642, 1, 1, 1, 1, 1,
-1.233463, -1.145359, -2.380622, 1, 1, 1, 1, 1,
-1.226984, -0.5035247, -3.809608, 0, 0, 1, 1, 1,
-1.203694, -0.5814579, -2.690385, 1, 0, 0, 1, 1,
-1.194145, -1.950175, -2.980784, 1, 0, 0, 1, 1,
-1.185025, 2.410294, 0.06291575, 1, 0, 0, 1, 1,
-1.184079, -0.624036, -2.15427, 1, 0, 0, 1, 1,
-1.177298, 1.670914, -0.6395698, 1, 0, 0, 1, 1,
-1.170665, -0.985808, -3.289979, 0, 0, 0, 1, 1,
-1.168645, -0.4124463, -2.495306, 0, 0, 0, 1, 1,
-1.156259, -0.3959706, -0.8334822, 0, 0, 0, 1, 1,
-1.151963, 0.021627, -1.093084, 0, 0, 0, 1, 1,
-1.151566, 1.648839, -0.05359618, 0, 0, 0, 1, 1,
-1.146542, -0.3710307, 0.3275686, 0, 0, 0, 1, 1,
-1.1374, 0.1600094, -1.086568, 0, 0, 0, 1, 1,
-1.136833, -0.082669, -2.198234, 1, 1, 1, 1, 1,
-1.134673, -0.01483051, -1.23091, 1, 1, 1, 1, 1,
-1.126512, 0.7104642, -0.6720721, 1, 1, 1, 1, 1,
-1.126075, 0.6315542, -0.2058891, 1, 1, 1, 1, 1,
-1.124788, -1.607727, -1.129021, 1, 1, 1, 1, 1,
-1.116166, 0.6912742, -0.847476, 1, 1, 1, 1, 1,
-1.114042, 0.08746042, -2.124128, 1, 1, 1, 1, 1,
-1.111807, 1.603621, -1.05941, 1, 1, 1, 1, 1,
-1.111601, -0.03946022, -2.224245, 1, 1, 1, 1, 1,
-1.102926, -1.256424, -0.9815048, 1, 1, 1, 1, 1,
-1.09974, 0.4267036, 0.2521149, 1, 1, 1, 1, 1,
-1.090997, -1.992005, -2.307329, 1, 1, 1, 1, 1,
-1.086767, -0.3355767, -1.124977, 1, 1, 1, 1, 1,
-1.086702, 0.2368527, -0.06823462, 1, 1, 1, 1, 1,
-1.083643, -0.8105498, -0.5347814, 1, 1, 1, 1, 1,
-1.081057, -0.1819484, -1.537784, 0, 0, 1, 1, 1,
-1.0809, -0.5008258, -1.230059, 1, 0, 0, 1, 1,
-1.06156, 0.5937295, -1.269236, 1, 0, 0, 1, 1,
-1.059205, 0.3881807, -2.744897, 1, 0, 0, 1, 1,
-1.048231, -1.009913, -2.022228, 1, 0, 0, 1, 1,
-1.038046, -0.4346743, -1.248837, 1, 0, 0, 1, 1,
-1.038007, 1.032988, 0.2533311, 0, 0, 0, 1, 1,
-1.037434, -0.5236028, -2.1678, 0, 0, 0, 1, 1,
-1.030294, 0.6611844, -0.4976563, 0, 0, 0, 1, 1,
-1.025745, 0.4084568, -0.5645213, 0, 0, 0, 1, 1,
-1.023379, -1.373976, -3.123287, 0, 0, 0, 1, 1,
-1.022746, 1.700756, -1.143412, 0, 0, 0, 1, 1,
-1.020073, 1.402127, 0.4543633, 0, 0, 0, 1, 1,
-1.014222, 0.1395796, -1.629451, 1, 1, 1, 1, 1,
-1.008216, -0.4211087, -1.264488, 1, 1, 1, 1, 1,
-0.9986431, -0.8054585, -3.129905, 1, 1, 1, 1, 1,
-0.9983798, 0.3698127, -0.5048138, 1, 1, 1, 1, 1,
-0.9982603, 0.253442, 0.0685961, 1, 1, 1, 1, 1,
-0.9957889, -1.220152, -5.350709, 1, 1, 1, 1, 1,
-0.9921251, 0.01316438, -0.7410169, 1, 1, 1, 1, 1,
-0.9913235, -0.06317636, -1.794483, 1, 1, 1, 1, 1,
-0.9894453, 0.9103991, -0.04061826, 1, 1, 1, 1, 1,
-0.9883342, -0.2354547, -1.207669, 1, 1, 1, 1, 1,
-0.9879979, -1.071549, -2.424387, 1, 1, 1, 1, 1,
-0.9850466, 0.3996591, -0.7485487, 1, 1, 1, 1, 1,
-0.9845055, 0.9823311, 0.113685, 1, 1, 1, 1, 1,
-0.9834356, 1.672626, -0.9751136, 1, 1, 1, 1, 1,
-0.9792948, -0.4156864, -1.314978, 1, 1, 1, 1, 1,
-0.9772161, -0.7250984, -2.52362, 0, 0, 1, 1, 1,
-0.9721677, -0.117606, -0.3819319, 1, 0, 0, 1, 1,
-0.9642843, 0.5781572, -0.726132, 1, 0, 0, 1, 1,
-0.9622424, 0.09397501, -1.47612, 1, 0, 0, 1, 1,
-0.9605241, -1.76804, -4.146903, 1, 0, 0, 1, 1,
-0.9579861, -1.951825, -2.411737, 1, 0, 0, 1, 1,
-0.9481453, 1.01805, 0.6103011, 0, 0, 0, 1, 1,
-0.947989, 0.9666659, 0.9941545, 0, 0, 0, 1, 1,
-0.9407861, 0.1914964, -1.729269, 0, 0, 0, 1, 1,
-0.9377739, -2.14387, -2.971605, 0, 0, 0, 1, 1,
-0.937238, -2.929988, -1.649258, 0, 0, 0, 1, 1,
-0.9355704, 0.9934516, -1.343075, 0, 0, 0, 1, 1,
-0.931723, -0.3365129, -1.15649, 0, 0, 0, 1, 1,
-0.9289231, 0.01286514, -1.04099, 1, 1, 1, 1, 1,
-0.9274907, -0.3443243, -2.826473, 1, 1, 1, 1, 1,
-0.9224327, -0.8677284, -1.590678, 1, 1, 1, 1, 1,
-0.9207226, -1.099614, -2.547165, 1, 1, 1, 1, 1,
-0.9183084, -0.4473829, -1.683093, 1, 1, 1, 1, 1,
-0.913029, 0.533006, -1.373653, 1, 1, 1, 1, 1,
-0.9013418, -0.1839355, -0.05333805, 1, 1, 1, 1, 1,
-0.8949264, -0.4791814, -1.268826, 1, 1, 1, 1, 1,
-0.8882945, -0.08254598, -0.798409, 1, 1, 1, 1, 1,
-0.886776, 0.4606654, 0.1579462, 1, 1, 1, 1, 1,
-0.8822997, 0.1873152, -2.048423, 1, 1, 1, 1, 1,
-0.8765098, 0.8829125, -0.9666463, 1, 1, 1, 1, 1,
-0.874095, 1.252832, -0.5043113, 1, 1, 1, 1, 1,
-0.8728059, -1.902524, -2.217919, 1, 1, 1, 1, 1,
-0.8716973, -0.2348941, -1.617423, 1, 1, 1, 1, 1,
-0.8660778, 1.857746, 0.342871, 0, 0, 1, 1, 1,
-0.8659873, 1.333877, -0.09784379, 1, 0, 0, 1, 1,
-0.8631353, -0.6615651, -2.114348, 1, 0, 0, 1, 1,
-0.8606218, -0.03628509, 0.1484883, 1, 0, 0, 1, 1,
-0.8545371, 0.8701875, -2.411995, 1, 0, 0, 1, 1,
-0.8516067, 0.03258875, -2.004803, 1, 0, 0, 1, 1,
-0.8511474, -0.5903827, -3.613106, 0, 0, 0, 1, 1,
-0.8482845, -1.44837, -2.743437, 0, 0, 0, 1, 1,
-0.8445399, -1.029935, -1.315483, 0, 0, 0, 1, 1,
-0.8362612, 1.764301, -1.880535, 0, 0, 0, 1, 1,
-0.8323215, -0.5601518, -2.411971, 0, 0, 0, 1, 1,
-0.8280482, 0.09255666, -1.530695, 0, 0, 0, 1, 1,
-0.8271835, -0.198823, -0.2702673, 0, 0, 0, 1, 1,
-0.8251334, -0.4049075, -1.369139, 1, 1, 1, 1, 1,
-0.8175949, 0.7221053, -1.990079, 1, 1, 1, 1, 1,
-0.8165006, -0.2338499, -2.745213, 1, 1, 1, 1, 1,
-0.8133961, -0.3887724, 0.1867938, 1, 1, 1, 1, 1,
-0.8112498, -0.3326717, -3.252847, 1, 1, 1, 1, 1,
-0.8084428, 0.5763755, -0.6901868, 1, 1, 1, 1, 1,
-0.8059004, -0.8209699, -3.545062, 1, 1, 1, 1, 1,
-0.7973291, -0.226139, -0.7656111, 1, 1, 1, 1, 1,
-0.7973267, -0.2400137, -2.586452, 1, 1, 1, 1, 1,
-0.7929596, -1.347453, -2.374621, 1, 1, 1, 1, 1,
-0.7924652, -2.15231, -2.32076, 1, 1, 1, 1, 1,
-0.7915769, -1.287795, -2.546788, 1, 1, 1, 1, 1,
-0.7889157, 1.590863, 1.05544, 1, 1, 1, 1, 1,
-0.7861903, 1.033556, -1.69339, 1, 1, 1, 1, 1,
-0.7832752, 1.273095, -0.6966469, 1, 1, 1, 1, 1,
-0.7808794, -0.6464869, -0.9214523, 0, 0, 1, 1, 1,
-0.7800652, -0.9257138, -3.535723, 1, 0, 0, 1, 1,
-0.7759742, -0.04571741, -0.3990862, 1, 0, 0, 1, 1,
-0.7751021, -0.5207792, -1.017538, 1, 0, 0, 1, 1,
-0.7712292, 0.5695541, -1.704185, 1, 0, 0, 1, 1,
-0.7693824, -0.8037528, -3.266612, 1, 0, 0, 1, 1,
-0.7658025, 0.342729, -0.8437774, 0, 0, 0, 1, 1,
-0.7639199, -0.6004347, -1.635335, 0, 0, 0, 1, 1,
-0.7622238, -0.7228189, -1.429143, 0, 0, 0, 1, 1,
-0.7548228, 1.36203, -1.629851, 0, 0, 0, 1, 1,
-0.7537617, -1.551867, -2.253397, 0, 0, 0, 1, 1,
-0.7500464, 0.7505714, -2.43304, 0, 0, 0, 1, 1,
-0.7463316, 1.06826, 0.9049994, 0, 0, 0, 1, 1,
-0.7369933, -0.1862944, -3.281685, 1, 1, 1, 1, 1,
-0.7346575, -2.134402, -4.327063, 1, 1, 1, 1, 1,
-0.7200825, -0.7262582, -3.427572, 1, 1, 1, 1, 1,
-0.7150934, 0.3779555, 0.3020051, 1, 1, 1, 1, 1,
-0.7123021, 0.02827448, -2.464303, 1, 1, 1, 1, 1,
-0.7046942, 0.9256021, -0.9327341, 1, 1, 1, 1, 1,
-0.7020198, 0.2686784, 0.1811327, 1, 1, 1, 1, 1,
-0.697787, -1.448164, -3.617514, 1, 1, 1, 1, 1,
-0.695882, -1.196774, -3.741336, 1, 1, 1, 1, 1,
-0.6939736, -2.299722, -3.144413, 1, 1, 1, 1, 1,
-0.6839623, 1.187814, 0.6124926, 1, 1, 1, 1, 1,
-0.6820701, 1.50545, 0.4680796, 1, 1, 1, 1, 1,
-0.6806709, 0.4573207, -0.5888373, 1, 1, 1, 1, 1,
-0.6797668, -1.628677, -2.953471, 1, 1, 1, 1, 1,
-0.6760791, 0.3560649, -1.318904, 1, 1, 1, 1, 1,
-0.6738111, -0.5161676, -0.2698742, 0, 0, 1, 1, 1,
-0.6707598, -1.446917, -3.023182, 1, 0, 0, 1, 1,
-0.6700516, -1.437119, -2.678758, 1, 0, 0, 1, 1,
-0.668543, -0.8591982, -3.608709, 1, 0, 0, 1, 1,
-0.6648663, -0.2245578, -2.118133, 1, 0, 0, 1, 1,
-0.6627886, 0.1795661, -3.120278, 1, 0, 0, 1, 1,
-0.6534158, -0.5378968, -2.06507, 0, 0, 0, 1, 1,
-0.6487944, -1.167037, -3.137759, 0, 0, 0, 1, 1,
-0.6399063, -1.38245, -2.575441, 0, 0, 0, 1, 1,
-0.6370488, -0.4676148, -2.274235, 0, 0, 0, 1, 1,
-0.6361206, -0.4650755, -1.45316, 0, 0, 0, 1, 1,
-0.6313586, 0.05481101, -2.490852, 0, 0, 0, 1, 1,
-0.6306367, -2.355382, -3.573112, 0, 0, 0, 1, 1,
-0.6301378, -0.6339719, -1.381569, 1, 1, 1, 1, 1,
-0.6273767, -0.570372, -2.622178, 1, 1, 1, 1, 1,
-0.6251533, -0.9283245, -1.661222, 1, 1, 1, 1, 1,
-0.6220723, 0.8584201, -0.5384497, 1, 1, 1, 1, 1,
-0.6175591, -1.625034, -3.980865, 1, 1, 1, 1, 1,
-0.6100628, -1.939057, -3.604901, 1, 1, 1, 1, 1,
-0.6097384, 0.1422639, -1.486585, 1, 1, 1, 1, 1,
-0.6064175, -0.5246861, -0.9917533, 1, 1, 1, 1, 1,
-0.6048714, -0.817752, -2.300632, 1, 1, 1, 1, 1,
-0.6041617, -1.184554, -1.303175, 1, 1, 1, 1, 1,
-0.6019679, -1.549852, -2.557573, 1, 1, 1, 1, 1,
-0.5990932, 1.723197, -0.04432864, 1, 1, 1, 1, 1,
-0.597881, 0.3504595, -0.9728676, 1, 1, 1, 1, 1,
-0.5874192, 0.5169533, -1.580839, 1, 1, 1, 1, 1,
-0.58547, 0.2415199, -1.499228, 1, 1, 1, 1, 1,
-0.5854456, -1.806008, -2.20578, 0, 0, 1, 1, 1,
-0.5819632, 1.60377, -1.562011, 1, 0, 0, 1, 1,
-0.580191, 1.400073, 0.2683487, 1, 0, 0, 1, 1,
-0.5791005, 1.068931, 0.3493426, 1, 0, 0, 1, 1,
-0.5757012, -0.5343435, -1.648075, 1, 0, 0, 1, 1,
-0.5740809, 0.3804848, -0.9770119, 1, 0, 0, 1, 1,
-0.5736996, 0.41773, -1.179822, 0, 0, 0, 1, 1,
-0.5649858, 0.2333254, 0.263191, 0, 0, 0, 1, 1,
-0.5613083, 0.6988677, -1.401423, 0, 0, 0, 1, 1,
-0.5609915, -0.9798171, -3.411823, 0, 0, 0, 1, 1,
-0.5564611, 1.050451, -0.1978252, 0, 0, 0, 1, 1,
-0.5550311, 0.5382432, 0.4739752, 0, 0, 0, 1, 1,
-0.5542107, 1.349439, 0.2187683, 0, 0, 0, 1, 1,
-0.5523544, -0.1944662, -3.715764, 1, 1, 1, 1, 1,
-0.5485203, 1.743819, -1.394818, 1, 1, 1, 1, 1,
-0.5441388, 0.4524745, -0.9201869, 1, 1, 1, 1, 1,
-0.5384404, -1.906289, -3.560034, 1, 1, 1, 1, 1,
-0.5365595, -1.027277, -2.303192, 1, 1, 1, 1, 1,
-0.5324478, -0.11538, -1.459712, 1, 1, 1, 1, 1,
-0.5321328, 0.2584259, -2.320369, 1, 1, 1, 1, 1,
-0.530368, 0.302756, -0.6532371, 1, 1, 1, 1, 1,
-0.5270189, 1.587884, 0.2501085, 1, 1, 1, 1, 1,
-0.5267712, -0.3013328, -1.728136, 1, 1, 1, 1, 1,
-0.5225466, -0.8924382, -2.169132, 1, 1, 1, 1, 1,
-0.5156447, -1.079229, -3.303124, 1, 1, 1, 1, 1,
-0.513163, 0.9951419, -0.1515858, 1, 1, 1, 1, 1,
-0.4949613, -0.8441345, -2.904589, 1, 1, 1, 1, 1,
-0.4944377, 0.4377521, -0.9308707, 1, 1, 1, 1, 1,
-0.4909838, -0.3303058, -2.052618, 0, 0, 1, 1, 1,
-0.4908404, 1.356667, -1.606538, 1, 0, 0, 1, 1,
-0.4875548, -1.508899, -2.09502, 1, 0, 0, 1, 1,
-0.4870545, 0.5489401, 0.07334992, 1, 0, 0, 1, 1,
-0.4799615, 0.6935654, -1.305908, 1, 0, 0, 1, 1,
-0.4796089, 0.6365633, -1.983512, 1, 0, 0, 1, 1,
-0.4780619, 0.6025455, -0.8572282, 0, 0, 0, 1, 1,
-0.4725942, 1.739013, -0.3460566, 0, 0, 0, 1, 1,
-0.4715231, -1.409295, -3.782309, 0, 0, 0, 1, 1,
-0.470221, -1.562777, -2.477225, 0, 0, 0, 1, 1,
-0.4700552, -1.014273, -2.771145, 0, 0, 0, 1, 1,
-0.4697477, -0.4578175, 0.4861235, 0, 0, 0, 1, 1,
-0.4676847, 1.017125, -0.8097262, 0, 0, 0, 1, 1,
-0.462822, 0.6634973, -0.2811018, 1, 1, 1, 1, 1,
-0.4609409, -0.04104634, -3.790306, 1, 1, 1, 1, 1,
-0.4543408, 0.4035112, -1.154736, 1, 1, 1, 1, 1,
-0.4490611, -0.1033591, -3.019141, 1, 1, 1, 1, 1,
-0.4482966, -2.286759, -2.708118, 1, 1, 1, 1, 1,
-0.446376, -1.337353, -2.729658, 1, 1, 1, 1, 1,
-0.4443322, 0.06274827, -3.36765, 1, 1, 1, 1, 1,
-0.4432804, 0.5138709, -0.1302589, 1, 1, 1, 1, 1,
-0.4403394, 1.790975, -0.7791741, 1, 1, 1, 1, 1,
-0.4394361, -0.2097877, -3.153826, 1, 1, 1, 1, 1,
-0.4368786, -1.249099, -2.972656, 1, 1, 1, 1, 1,
-0.4362193, -0.6922256, -4.492849, 1, 1, 1, 1, 1,
-0.435958, -2.49457, -2.993411, 1, 1, 1, 1, 1,
-0.4339373, -1.291499, -3.059141, 1, 1, 1, 1, 1,
-0.4330075, -0.1719234, -1.167893, 1, 1, 1, 1, 1,
-0.4300076, -0.3596367, -3.524033, 0, 0, 1, 1, 1,
-0.4234705, 0.2293082, -2.327179, 1, 0, 0, 1, 1,
-0.4227904, 1.288074, 1.000974, 1, 0, 0, 1, 1,
-0.4224568, 0.9808159, -0.4967439, 1, 0, 0, 1, 1,
-0.4216592, 0.7195198, 0.1827943, 1, 0, 0, 1, 1,
-0.4213413, -1.764073, -5.200463, 1, 0, 0, 1, 1,
-0.4199741, -1.214361, -3.412316, 0, 0, 0, 1, 1,
-0.4196165, 0.926872, -1.432705, 0, 0, 0, 1, 1,
-0.4149446, 0.4776131, -1.155434, 0, 0, 0, 1, 1,
-0.4138628, 0.9409368, -1.508592, 0, 0, 0, 1, 1,
-0.4097762, -0.9287011, -3.366163, 0, 0, 0, 1, 1,
-0.3978546, -0.7646662, -3.310096, 0, 0, 0, 1, 1,
-0.39515, -0.1512555, -2.008271, 0, 0, 0, 1, 1,
-0.3949266, -0.4939052, -1.868975, 1, 1, 1, 1, 1,
-0.3918221, -0.1467525, -1.093933, 1, 1, 1, 1, 1,
-0.3905688, -0.1054977, -1.520217, 1, 1, 1, 1, 1,
-0.3872338, 0.7320634, -1.267848, 1, 1, 1, 1, 1,
-0.3848301, 0.798146, 1.093727, 1, 1, 1, 1, 1,
-0.3791225, -0.1794205, -0.2654036, 1, 1, 1, 1, 1,
-0.3790836, 1.093765, -0.237624, 1, 1, 1, 1, 1,
-0.3783235, 0.08898085, -2.685696, 1, 1, 1, 1, 1,
-0.3782732, 0.7280657, 0.3193067, 1, 1, 1, 1, 1,
-0.3747182, 0.6222984, -1.461533, 1, 1, 1, 1, 1,
-0.3731515, 0.2561738, -0.572242, 1, 1, 1, 1, 1,
-0.3707862, -0.4551991, -2.829205, 1, 1, 1, 1, 1,
-0.3692697, -0.6801447, -3.939851, 1, 1, 1, 1, 1,
-0.3637874, 2.197602, -0.2743067, 1, 1, 1, 1, 1,
-0.362502, 0.7756707, -2.389452, 1, 1, 1, 1, 1,
-0.3617323, -0.275156, -2.458369, 0, 0, 1, 1, 1,
-0.3604955, 1.008138, -0.7787437, 1, 0, 0, 1, 1,
-0.3538148, -0.7612108, -2.451288, 1, 0, 0, 1, 1,
-0.3511891, -0.80658, -3.768482, 1, 0, 0, 1, 1,
-0.35085, 0.7050135, -0.5139307, 1, 0, 0, 1, 1,
-0.3503258, -2.739961, -2.303004, 1, 0, 0, 1, 1,
-0.3497642, -1.000659, -3.246192, 0, 0, 0, 1, 1,
-0.3490092, -1.223328, -3.089628, 0, 0, 0, 1, 1,
-0.3461691, 0.6711321, -0.8196623, 0, 0, 0, 1, 1,
-0.3449758, 0.9435489, -0.7444855, 0, 0, 0, 1, 1,
-0.3439892, 0.2633778, -0.01361978, 0, 0, 0, 1, 1,
-0.3392071, -1.197179, -2.481415, 0, 0, 0, 1, 1,
-0.3367732, 0.7923196, -0.2555364, 0, 0, 0, 1, 1,
-0.3367658, 0.3507242, -1.401068, 1, 1, 1, 1, 1,
-0.3343868, -0.3329615, -2.51631, 1, 1, 1, 1, 1,
-0.3325785, 0.3146758, -1.08081, 1, 1, 1, 1, 1,
-0.3320352, -0.8274996, -2.090564, 1, 1, 1, 1, 1,
-0.3279259, 2.014119, 0.07147457, 1, 1, 1, 1, 1,
-0.3247671, -1.25516, -3.397922, 1, 1, 1, 1, 1,
-0.3245696, -2.291033, -2.56117, 1, 1, 1, 1, 1,
-0.3240786, -0.2448974, -1.844573, 1, 1, 1, 1, 1,
-0.3220319, -0.5192019, -2.352287, 1, 1, 1, 1, 1,
-0.3138155, 0.0846065, -0.02107132, 1, 1, 1, 1, 1,
-0.3119735, -0.601144, -3.575858, 1, 1, 1, 1, 1,
-0.3114135, -0.3946629, -2.839573, 1, 1, 1, 1, 1,
-0.3092899, -0.2705278, -1.886655, 1, 1, 1, 1, 1,
-0.3082987, 1.174917, 0.1726645, 1, 1, 1, 1, 1,
-0.3047666, 1.85521, -2.237492, 1, 1, 1, 1, 1,
-0.3041781, 0.3985733, -1.908288, 0, 0, 1, 1, 1,
-0.2932005, 0.3231001, -0.4763504, 1, 0, 0, 1, 1,
-0.2928481, 1.396693, 2.616202, 1, 0, 0, 1, 1,
-0.2923858, 0.6466711, 0.1097878, 1, 0, 0, 1, 1,
-0.289416, -0.576592, -2.556776, 1, 0, 0, 1, 1,
-0.2877843, 0.3383848, 0.4827891, 1, 0, 0, 1, 1,
-0.2864928, -0.5238199, -3.871813, 0, 0, 0, 1, 1,
-0.2854685, 0.4586771, -0.8110352, 0, 0, 0, 1, 1,
-0.2847442, 0.4144423, 0.06331156, 0, 0, 0, 1, 1,
-0.2841757, 0.8052541, -0.7605005, 0, 0, 0, 1, 1,
-0.280433, -0.2139359, -1.384604, 0, 0, 0, 1, 1,
-0.2789456, -0.02236778, -2.49479, 0, 0, 0, 1, 1,
-0.2758431, -0.3274982, -4.166375, 0, 0, 0, 1, 1,
-0.2758117, -1.795857, -2.662593, 1, 1, 1, 1, 1,
-0.2755394, 0.9157505, -0.5646152, 1, 1, 1, 1, 1,
-0.2748117, -1.145734, -2.973724, 1, 1, 1, 1, 1,
-0.2741185, 1.058784, -0.4236954, 1, 1, 1, 1, 1,
-0.2727798, 0.1392459, -1.218577, 1, 1, 1, 1, 1,
-0.2721717, 0.2979193, -1.158332, 1, 1, 1, 1, 1,
-0.2712266, -0.2170275, -0.05496313, 1, 1, 1, 1, 1,
-0.2671354, 2.655864, -1.357132, 1, 1, 1, 1, 1,
-0.2613155, 0.149009, -1.938823, 1, 1, 1, 1, 1,
-0.2606491, -0.2792599, -3.056136, 1, 1, 1, 1, 1,
-0.2596982, 0.4388451, -0.6098803, 1, 1, 1, 1, 1,
-0.2595128, -0.5458091, -2.671586, 1, 1, 1, 1, 1,
-0.2585461, -0.4239798, -3.503775, 1, 1, 1, 1, 1,
-0.257244, 0.4124401, -1.329225, 1, 1, 1, 1, 1,
-0.2552983, 0.1046841, -1.727915, 1, 1, 1, 1, 1,
-0.2550901, 0.136484, -2.112351, 0, 0, 1, 1, 1,
-0.254939, 1.247715, -1.452782, 1, 0, 0, 1, 1,
-0.2512655, 0.34879, 0.9892067, 1, 0, 0, 1, 1,
-0.250991, 1.797317, -0.6760681, 1, 0, 0, 1, 1,
-0.2502615, 0.3357476, 0.03766241, 1, 0, 0, 1, 1,
-0.2500862, -0.02562808, -2.088059, 1, 0, 0, 1, 1,
-0.2496478, 0.6242008, -0.4400086, 0, 0, 0, 1, 1,
-0.2437262, 0.06403501, -2.553885, 0, 0, 0, 1, 1,
-0.2380844, -0.08639205, -2.170543, 0, 0, 0, 1, 1,
-0.2378497, -0.2735609, -3.908404, 0, 0, 0, 1, 1,
-0.2369744, 0.2638981, -2.161667, 0, 0, 0, 1, 1,
-0.2324635, -1.088007, -2.900622, 0, 0, 0, 1, 1,
-0.2290494, 0.271598, -0.6860577, 0, 0, 0, 1, 1,
-0.224232, -1.218301, -2.840449, 1, 1, 1, 1, 1,
-0.2229708, 0.03659429, 0.294783, 1, 1, 1, 1, 1,
-0.2215915, -0.788842, -2.906992, 1, 1, 1, 1, 1,
-0.2203642, -1.048392, -4.026654, 1, 1, 1, 1, 1,
-0.2200243, -0.914445, -4.288198, 1, 1, 1, 1, 1,
-0.2175741, -0.1335104, -3.456028, 1, 1, 1, 1, 1,
-0.2160111, 1.961886, 0.1654585, 1, 1, 1, 1, 1,
-0.2156136, -0.1970029, -1.476658, 1, 1, 1, 1, 1,
-0.2104215, 0.08664334, 0.07645571, 1, 1, 1, 1, 1,
-0.2103977, 0.44996, -1.108792, 1, 1, 1, 1, 1,
-0.2092044, -1.595744, -2.456483, 1, 1, 1, 1, 1,
-0.2086062, 1.530339, -1.184351, 1, 1, 1, 1, 1,
-0.207448, 0.3750065, -0.3880516, 1, 1, 1, 1, 1,
-0.2058867, -0.4429204, -3.130913, 1, 1, 1, 1, 1,
-0.2057835, 1.41443, 0.02468985, 1, 1, 1, 1, 1,
-0.2024304, 0.4057564, 0.6225984, 0, 0, 1, 1, 1,
-0.2007529, 0.646409, 1.462481, 1, 0, 0, 1, 1,
-0.1990585, 1.50479, 0.02945219, 1, 0, 0, 1, 1,
-0.1959526, 0.1221009, 0.1790223, 1, 0, 0, 1, 1,
-0.1947377, -1.095622, -1.955657, 1, 0, 0, 1, 1,
-0.1928767, 0.7964566, -0.9968841, 1, 0, 0, 1, 1,
-0.1894353, -0.06353776, -2.500415, 0, 0, 0, 1, 1,
-0.1838202, 0.1583723, -1.31592, 0, 0, 0, 1, 1,
-0.1824744, -0.8189498, -2.343507, 0, 0, 0, 1, 1,
-0.1749329, -0.8595299, -2.468697, 0, 0, 0, 1, 1,
-0.1733398, -0.5755883, -2.748035, 0, 0, 0, 1, 1,
-0.16863, -1.247033, -3.002736, 0, 0, 0, 1, 1,
-0.1667089, 1.119476, -1.265123, 0, 0, 0, 1, 1,
-0.1640972, -0.09261033, -2.971039, 1, 1, 1, 1, 1,
-0.1626576, -0.07254407, -1.572966, 1, 1, 1, 1, 1,
-0.1477908, -1.390633, -2.363689, 1, 1, 1, 1, 1,
-0.1396506, -0.7148814, -2.681537, 1, 1, 1, 1, 1,
-0.1392151, 0.01346382, -0.3363698, 1, 1, 1, 1, 1,
-0.1221647, 0.9292631, -0.4472607, 1, 1, 1, 1, 1,
-0.121172, -0.9301631, -2.530138, 1, 1, 1, 1, 1,
-0.1160632, 0.1163627, -1.093491, 1, 1, 1, 1, 1,
-0.1155555, -0.7285361, -3.716268, 1, 1, 1, 1, 1,
-0.114687, -0.3762341, -3.221123, 1, 1, 1, 1, 1,
-0.1131678, -0.3896322, -3.873384, 1, 1, 1, 1, 1,
-0.1077948, 1.396738, 1.05929, 1, 1, 1, 1, 1,
-0.1042439, -0.2599933, -3.694662, 1, 1, 1, 1, 1,
-0.1036847, 1.108211, 0.6810706, 1, 1, 1, 1, 1,
-0.09611965, -0.1418876, -2.267637, 1, 1, 1, 1, 1,
-0.09497246, 1.267832, 1.155056, 0, 0, 1, 1, 1,
-0.09246938, -0.517468, -3.208759, 1, 0, 0, 1, 1,
-0.08980619, 0.5649707, -0.8932754, 1, 0, 0, 1, 1,
-0.08898097, 0.9104044, 0.524775, 1, 0, 0, 1, 1,
-0.08715869, -0.7775871, -2.449618, 1, 0, 0, 1, 1,
-0.08518689, -0.2604728, -2.427886, 1, 0, 0, 1, 1,
-0.08225829, -0.5726556, -4.024408, 0, 0, 0, 1, 1,
-0.07969236, 1.020409, -1.395702, 0, 0, 0, 1, 1,
-0.07714497, 0.9425997, 0.3961643, 0, 0, 0, 1, 1,
-0.0738671, 1.809861, 1.453789, 0, 0, 0, 1, 1,
-0.07254709, 0.2229119, -0.6572559, 0, 0, 0, 1, 1,
-0.06721745, 1.109086, -0.297199, 0, 0, 0, 1, 1,
-0.06504431, 1.636384, -0.06686101, 0, 0, 0, 1, 1,
-0.06486506, 0.5909216, -0.2312803, 1, 1, 1, 1, 1,
-0.06481482, -0.2134594, -2.250174, 1, 1, 1, 1, 1,
-0.06434116, 1.204285, 0.588218, 1, 1, 1, 1, 1,
-0.06402478, -0.7443995, -2.490121, 1, 1, 1, 1, 1,
-0.06267175, 0.2947392, 0.5762451, 1, 1, 1, 1, 1,
-0.06083037, 0.3765446, -0.3985868, 1, 1, 1, 1, 1,
-0.06005729, 0.5372493, 0.8433717, 1, 1, 1, 1, 1,
-0.0594473, 0.4735907, -0.5559996, 1, 1, 1, 1, 1,
-0.05731114, 0.840652, 0.08018383, 1, 1, 1, 1, 1,
-0.05624214, 0.733131, -2.005379, 1, 1, 1, 1, 1,
-0.05471098, 0.4456508, -0.2874486, 1, 1, 1, 1, 1,
-0.05209817, 0.3282346, 0.3697501, 1, 1, 1, 1, 1,
-0.0423526, 0.8709555, -0.2236391, 1, 1, 1, 1, 1,
-0.03897186, -1.02343, -3.073428, 1, 1, 1, 1, 1,
-0.0379779, -0.05488765, -1.853571, 1, 1, 1, 1, 1,
-0.03766618, -0.2660453, -3.459687, 0, 0, 1, 1, 1,
-0.03760759, 0.04494322, -0.5237996, 1, 0, 0, 1, 1,
-0.03330175, 0.3067687, 0.2827312, 1, 0, 0, 1, 1,
-0.03317692, 0.09658328, -0.9632768, 1, 0, 0, 1, 1,
-0.03277571, 1.106392, -0.742554, 1, 0, 0, 1, 1,
-0.03257075, -0.701751, -2.882138, 1, 0, 0, 1, 1,
-0.02891491, -0.5901831, -1.599833, 0, 0, 0, 1, 1,
-0.0280784, -0.06033596, -3.817736, 0, 0, 0, 1, 1,
-0.02367209, 0.349554, 0.7032956, 0, 0, 0, 1, 1,
-0.02349728, -0.7420879, -3.539628, 0, 0, 0, 1, 1,
-0.02235817, 0.5924357, 0.793059, 0, 0, 0, 1, 1,
-0.02221234, -0.7502363, -3.517798, 0, 0, 0, 1, 1,
-0.01942106, -0.2850191, -1.994979, 0, 0, 0, 1, 1,
-0.01867226, 0.6363723, -0.3231559, 1, 1, 1, 1, 1,
-0.01822855, -0.2820955, -4.358404, 1, 1, 1, 1, 1,
-0.01788897, 2.148629, -0.8583692, 1, 1, 1, 1, 1,
-0.01720593, -1.645402, -4.491367, 1, 1, 1, 1, 1,
-0.01589404, 0.7856811, 1.16707, 1, 1, 1, 1, 1,
-0.01183605, 1.531004, -0.6210411, 1, 1, 1, 1, 1,
-0.01158274, -0.4248033, -2.464344, 1, 1, 1, 1, 1,
-0.008171134, 0.6305416, 1.180094, 1, 1, 1, 1, 1,
-0.006139448, 0.2412708, 1.12549, 1, 1, 1, 1, 1,
-0.004964557, -3.074968, -2.822253, 1, 1, 1, 1, 1,
0.004010943, -0.1840685, 5.19894, 1, 1, 1, 1, 1,
0.006384905, -2.236156, 3.569208, 1, 1, 1, 1, 1,
0.007774577, -1.782361, 2.554926, 1, 1, 1, 1, 1,
0.01134624, -0.6071166, 4.479702, 1, 1, 1, 1, 1,
0.01349872, 0.768085, 0.1323804, 1, 1, 1, 1, 1,
0.01791574, -1.221284, 2.620679, 0, 0, 1, 1, 1,
0.01995265, -0.5714294, 1.822488, 1, 0, 0, 1, 1,
0.02047782, 0.1653801, 1.253636, 1, 0, 0, 1, 1,
0.02463555, 1.017796, 1.306102, 1, 0, 0, 1, 1,
0.02601435, 0.3691324, 0.03867862, 1, 0, 0, 1, 1,
0.02880602, 0.6922747, -0.4873918, 1, 0, 0, 1, 1,
0.02916784, -1.061899, 2.680439, 0, 0, 0, 1, 1,
0.03096426, 0.07776672, 1.310693, 0, 0, 0, 1, 1,
0.03434232, 1.09611, -0.3308617, 0, 0, 0, 1, 1,
0.03649246, 1.443741, -0.1757347, 0, 0, 0, 1, 1,
0.04169407, -0.8618761, 3.601416, 0, 0, 0, 1, 1,
0.04253168, 1.561149, 0.09024963, 0, 0, 0, 1, 1,
0.04531094, 0.1312179, 0.6139568, 0, 0, 0, 1, 1,
0.04964705, -0.03347223, 2.662736, 1, 1, 1, 1, 1,
0.05205924, 0.3268793, 0.09460212, 1, 1, 1, 1, 1,
0.05392513, -0.02156013, 0.3354919, 1, 1, 1, 1, 1,
0.05425622, -0.5998586, 3.81, 1, 1, 1, 1, 1,
0.05688113, -0.3672914, 0.6688759, 1, 1, 1, 1, 1,
0.06065152, 0.6618721, 0.6612676, 1, 1, 1, 1, 1,
0.06212144, 1.059405, 0.9242676, 1, 1, 1, 1, 1,
0.06901555, 1.754622, -1.545896, 1, 1, 1, 1, 1,
0.06940141, -0.5887658, 1.800662, 1, 1, 1, 1, 1,
0.07139425, 0.02976726, 0.3421206, 1, 1, 1, 1, 1,
0.07482465, -0.351203, 1.191228, 1, 1, 1, 1, 1,
0.07664123, -0.8696665, 2.211541, 1, 1, 1, 1, 1,
0.08524953, -1.403746, 2.787445, 1, 1, 1, 1, 1,
0.08615112, -1.431544, 2.428984, 1, 1, 1, 1, 1,
0.09377967, 0.995764, 1.057814, 1, 1, 1, 1, 1,
0.09915496, -0.281549, 3.152163, 0, 0, 1, 1, 1,
0.1028917, -1.229261, 3.558524, 1, 0, 0, 1, 1,
0.1042591, 1.092041, 0.8609906, 1, 0, 0, 1, 1,
0.1087903, -0.5624003, 4.087114, 1, 0, 0, 1, 1,
0.1130514, -0.3385046, 2.848759, 1, 0, 0, 1, 1,
0.1133734, 1.36207, -0.5533212, 1, 0, 0, 1, 1,
0.1138628, -1.193471, 4.686048, 0, 0, 0, 1, 1,
0.1202212, 0.5524604, 1.030513, 0, 0, 0, 1, 1,
0.1209371, 2.495538, 0.8623798, 0, 0, 0, 1, 1,
0.1336151, 0.4901654, -0.0229256, 0, 0, 0, 1, 1,
0.1360735, 0.5175018, 0.5283767, 0, 0, 0, 1, 1,
0.1470436, -0.9896708, 2.294743, 0, 0, 0, 1, 1,
0.1502343, 0.3577859, -0.4006201, 0, 0, 0, 1, 1,
0.1526675, 0.4588005, 1.689813, 1, 1, 1, 1, 1,
0.155382, 0.8712262, 0.2104435, 1, 1, 1, 1, 1,
0.1591219, -0.6353617, 3.378364, 1, 1, 1, 1, 1,
0.1621347, 1.762157, -0.7049924, 1, 1, 1, 1, 1,
0.1636904, -2.209853, 2.209092, 1, 1, 1, 1, 1,
0.1655739, 1.011525, -0.357015, 1, 1, 1, 1, 1,
0.1663284, -1.92406, 4.580633, 1, 1, 1, 1, 1,
0.1745309, 0.4796871, -0.5598883, 1, 1, 1, 1, 1,
0.1747316, -1.889468, 0.5144883, 1, 1, 1, 1, 1,
0.1781698, 1.947547, -2.028034, 1, 1, 1, 1, 1,
0.178713, 0.01600415, 1.054126, 1, 1, 1, 1, 1,
0.1812279, -0.5348317, 2.550246, 1, 1, 1, 1, 1,
0.1833453, -0.8504583, 2.905924, 1, 1, 1, 1, 1,
0.1856062, 2.818043, -1.905034, 1, 1, 1, 1, 1,
0.1894643, -3.828404, 3.102856, 1, 1, 1, 1, 1,
0.1925689, -0.8669733, 5.186, 0, 0, 1, 1, 1,
0.1942314, -0.004842165, 4.542137, 1, 0, 0, 1, 1,
0.1950084, -0.9550558, 3.326778, 1, 0, 0, 1, 1,
0.1951808, -0.8865676, 3.745273, 1, 0, 0, 1, 1,
0.1951935, 0.4027948, 2.267098, 1, 0, 0, 1, 1,
0.1956926, -0.3666127, 3.010753, 1, 0, 0, 1, 1,
0.1960882, 0.6131735, 2.642096, 0, 0, 0, 1, 1,
0.1975961, 1.317158, -1.257651, 0, 0, 0, 1, 1,
0.1984321, 1.584171, 0.6922516, 0, 0, 0, 1, 1,
0.2007298, -0.8408273, 2.31701, 0, 0, 0, 1, 1,
0.2064898, -0.00642365, 2.216124, 0, 0, 0, 1, 1,
0.2084804, 0.3646376, 2.048003, 0, 0, 0, 1, 1,
0.2103488, 1.357643, -0.6810857, 0, 0, 0, 1, 1,
0.2145776, -0.859795, 3.723251, 1, 1, 1, 1, 1,
0.2167894, 0.4075007, 0.3075741, 1, 1, 1, 1, 1,
0.2199139, 1.890338, 0.03331631, 1, 1, 1, 1, 1,
0.2199272, 1.306529, -0.1109646, 1, 1, 1, 1, 1,
0.2201748, -0.7142072, 3.47526, 1, 1, 1, 1, 1,
0.2204697, -0.2183408, 1.236533, 1, 1, 1, 1, 1,
0.2298933, 0.7972755, 0.6365147, 1, 1, 1, 1, 1,
0.232529, -0.4289365, 2.043858, 1, 1, 1, 1, 1,
0.2334151, -0.752337, 2.37393, 1, 1, 1, 1, 1,
0.2381297, 0.3069826, 1.360347, 1, 1, 1, 1, 1,
0.2387462, 1.009078, 0.3373386, 1, 1, 1, 1, 1,
0.2424078, 0.2674901, 0.6259252, 1, 1, 1, 1, 1,
0.2441376, 0.6001933, 0.1493841, 1, 1, 1, 1, 1,
0.2462634, -0.2241935, 0.09833229, 1, 1, 1, 1, 1,
0.2494437, 1.029783, 0.1290363, 1, 1, 1, 1, 1,
0.2518615, -1.235648, 1.421625, 0, 0, 1, 1, 1,
0.252988, -0.4141113, 2.45922, 1, 0, 0, 1, 1,
0.2571985, -2.235053, 2.207237, 1, 0, 0, 1, 1,
0.2585439, -0.1617254, 2.842144, 1, 0, 0, 1, 1,
0.2620539, 1.372273, 1.271484, 1, 0, 0, 1, 1,
0.2645045, -0.6784682, 0.7062472, 1, 0, 0, 1, 1,
0.2661584, 0.03466223, 1.342701, 0, 0, 0, 1, 1,
0.2713267, 1.102193, 0.05532592, 0, 0, 0, 1, 1,
0.2730633, -0.6640174, 3.545521, 0, 0, 0, 1, 1,
0.2737138, -1.691311, 3.13294, 0, 0, 0, 1, 1,
0.2742208, 1.150225, 1.073462, 0, 0, 0, 1, 1,
0.2754375, 1.401381, 0.2052891, 0, 0, 0, 1, 1,
0.283383, -1.401532, 2.255665, 0, 0, 0, 1, 1,
0.2850655, -0.6893666, 2.330216, 1, 1, 1, 1, 1,
0.2892735, -0.805293, 3.268756, 1, 1, 1, 1, 1,
0.290691, -1.71483, 4.290181, 1, 1, 1, 1, 1,
0.2910951, -0.1136552, 1.956025, 1, 1, 1, 1, 1,
0.2946422, 0.2379956, 2.170306, 1, 1, 1, 1, 1,
0.2966147, 0.7298766, 1.10322, 1, 1, 1, 1, 1,
0.2987773, 0.1677648, 0.9616805, 1, 1, 1, 1, 1,
0.2987948, -0.1654963, 2.570892, 1, 1, 1, 1, 1,
0.2989997, -0.2252505, -0.1499307, 1, 1, 1, 1, 1,
0.2998784, 1.563453, 0.03936922, 1, 1, 1, 1, 1,
0.3007645, -0.1202206, 1.511675, 1, 1, 1, 1, 1,
0.3061459, -2.644403, 2.627159, 1, 1, 1, 1, 1,
0.3067027, -0.633358, 3.213542, 1, 1, 1, 1, 1,
0.3116894, 0.08616806, 1.766317, 1, 1, 1, 1, 1,
0.3120683, 0.4995989, 0.8009063, 1, 1, 1, 1, 1,
0.3199753, -1.86553, 3.086166, 0, 0, 1, 1, 1,
0.3202666, 0.7826747, 0.5789678, 1, 0, 0, 1, 1,
0.3234734, 0.1458375, 0.7061343, 1, 0, 0, 1, 1,
0.3241062, -0.7293249, 3.926997, 1, 0, 0, 1, 1,
0.3254151, 0.2111253, 1.907197, 1, 0, 0, 1, 1,
0.3271672, 0.03053431, 0.9157638, 1, 0, 0, 1, 1,
0.3332686, -0.4696438, 3.927726, 0, 0, 0, 1, 1,
0.3455581, 0.05826845, 2.723032, 0, 0, 0, 1, 1,
0.3479552, -0.4819521, 1.94412, 0, 0, 0, 1, 1,
0.3505794, -0.0306196, 0.365293, 0, 0, 0, 1, 1,
0.3548404, 0.7625764, -0.7187629, 0, 0, 0, 1, 1,
0.3568261, -0.528687, 3.811425, 0, 0, 0, 1, 1,
0.3575133, 0.07592065, 1.871774, 0, 0, 0, 1, 1,
0.3603338, -0.818696, 3.805297, 1, 1, 1, 1, 1,
0.3647154, -1.181661, 2.448625, 1, 1, 1, 1, 1,
0.3648842, 0.0095327, 1.677884, 1, 1, 1, 1, 1,
0.3665795, -0.5196481, 3.600665, 1, 1, 1, 1, 1,
0.3670411, -1.190637, 2.674755, 1, 1, 1, 1, 1,
0.3673099, -0.7258987, 1.204067, 1, 1, 1, 1, 1,
0.3780723, -0.8027586, 2.416663, 1, 1, 1, 1, 1,
0.3836796, -0.1562043, 2.059237, 1, 1, 1, 1, 1,
0.3886375, 0.3082733, 0.7011794, 1, 1, 1, 1, 1,
0.3905655, -0.3323866, 2.740661, 1, 1, 1, 1, 1,
0.3907577, -0.4155695, 3.101777, 1, 1, 1, 1, 1,
0.392712, 0.6810992, 0.2173906, 1, 1, 1, 1, 1,
0.3973751, -1.379445, 3.276318, 1, 1, 1, 1, 1,
0.3980078, -0.2157344, 0.2483952, 1, 1, 1, 1, 1,
0.3996056, 0.381864, 0.8648283, 1, 1, 1, 1, 1,
0.4021102, 0.1884193, 0.9618189, 0, 0, 1, 1, 1,
0.4065008, -0.5979915, 2.803213, 1, 0, 0, 1, 1,
0.4083084, -0.3406621, 3.371439, 1, 0, 0, 1, 1,
0.4100391, -0.1154247, 2.674237, 1, 0, 0, 1, 1,
0.4142944, 0.06993803, 2.237238, 1, 0, 0, 1, 1,
0.4163494, 0.4411048, 1.174143, 1, 0, 0, 1, 1,
0.4165686, 0.713559, -0.2266218, 0, 0, 0, 1, 1,
0.4181154, 0.9534683, 0.7583994, 0, 0, 0, 1, 1,
0.4185351, -0.6683103, 0.8657894, 0, 0, 0, 1, 1,
0.4210402, -0.06355074, -0.2830662, 0, 0, 0, 1, 1,
0.4240431, 0.5494637, -0.4444441, 0, 0, 0, 1, 1,
0.4248162, -0.9323965, 0.6035956, 0, 0, 0, 1, 1,
0.4296764, 0.485137, 2.25063, 0, 0, 0, 1, 1,
0.4450966, 1.58474, 1.433659, 1, 1, 1, 1, 1,
0.4475428, 0.3085768, 1.595679, 1, 1, 1, 1, 1,
0.4487345, 0.4280573, -0.04634221, 1, 1, 1, 1, 1,
0.4490444, -0.6093382, 3.521691, 1, 1, 1, 1, 1,
0.4494594, 0.5880165, 0.2454276, 1, 1, 1, 1, 1,
0.4516667, 0.8670371, -0.03061048, 1, 1, 1, 1, 1,
0.458087, -0.1883841, 1.847364, 1, 1, 1, 1, 1,
0.4585336, 1.132402, 1.689818, 1, 1, 1, 1, 1,
0.4640604, -1.298452, 2.205112, 1, 1, 1, 1, 1,
0.4671085, 1.873328, 0.7168488, 1, 1, 1, 1, 1,
0.4711338, -0.8701269, 1.91079, 1, 1, 1, 1, 1,
0.4763182, 0.04819375, 1.26395, 1, 1, 1, 1, 1,
0.477089, -0.3887278, 0.2912215, 1, 1, 1, 1, 1,
0.4825048, 0.08125737, 1.788762, 1, 1, 1, 1, 1,
0.4884895, 0.2674935, 0.1577407, 1, 1, 1, 1, 1,
0.4889998, 0.3289784, 1.303064, 0, 0, 1, 1, 1,
0.493257, -0.5415958, 1.962094, 1, 0, 0, 1, 1,
0.4952911, 0.9058106, -1.199942, 1, 0, 0, 1, 1,
0.4977698, -1.095875, 4.000019, 1, 0, 0, 1, 1,
0.4990867, -0.2563385, 0.7220221, 1, 0, 0, 1, 1,
0.5032931, -1.21232, 0.5151988, 1, 0, 0, 1, 1,
0.5043708, 0.1751992, 2.003732, 0, 0, 0, 1, 1,
0.5087855, -1.331482, 1.39384, 0, 0, 0, 1, 1,
0.5088995, -1.957112, 3.033558, 0, 0, 0, 1, 1,
0.5127568, 0.7568327, 1.529786, 0, 0, 0, 1, 1,
0.5144693, -0.3935149, 1.800645, 0, 0, 0, 1, 1,
0.5144745, 0.148611, 1.497036, 0, 0, 0, 1, 1,
0.5148969, -1.504741, 2.13294, 0, 0, 0, 1, 1,
0.5159515, -0.2350757, 2.006081, 1, 1, 1, 1, 1,
0.5201458, -0.4595072, 1.613556, 1, 1, 1, 1, 1,
0.5335747, -1.028177, 2.17435, 1, 1, 1, 1, 1,
0.5343123, -0.09557392, 1.780344, 1, 1, 1, 1, 1,
0.5351299, -0.1759194, 1.284964, 1, 1, 1, 1, 1,
0.5351409, 0.4041115, -0.4469135, 1, 1, 1, 1, 1,
0.5473348, 1.089711, -0.2057196, 1, 1, 1, 1, 1,
0.5496872, 0.02002638, 0.9420984, 1, 1, 1, 1, 1,
0.5519682, -0.3152189, 0.9604099, 1, 1, 1, 1, 1,
0.5548944, 1.070583, 1.106812, 1, 1, 1, 1, 1,
0.5558224, -0.5630431, 3.287084, 1, 1, 1, 1, 1,
0.5592031, -0.2077961, 2.414891, 1, 1, 1, 1, 1,
0.5608875, -1.770298, 2.471794, 1, 1, 1, 1, 1,
0.5610585, -1.359848, 2.651074, 1, 1, 1, 1, 1,
0.5628024, 1.354905, 0.3543208, 1, 1, 1, 1, 1,
0.5633205, -0.1500072, 1.96534, 0, 0, 1, 1, 1,
0.5648883, -1.465709, 3.651595, 1, 0, 0, 1, 1,
0.5698791, 0.1003978, -0.1014956, 1, 0, 0, 1, 1,
0.573362, -0.8485625, 3.727927, 1, 0, 0, 1, 1,
0.5755765, -1.694758, 3.042197, 1, 0, 0, 1, 1,
0.583923, -0.6511937, 2.06357, 1, 0, 0, 1, 1,
0.5856352, 0.3328023, 0.1236073, 0, 0, 0, 1, 1,
0.587578, 1.184828, 0.4152309, 0, 0, 0, 1, 1,
0.5924944, 0.3376149, 1.366738, 0, 0, 0, 1, 1,
0.598836, -1.455423, 1.473052, 0, 0, 0, 1, 1,
0.600705, -0.02289962, 1.909094, 0, 0, 0, 1, 1,
0.6033547, -0.01053819, 1.710633, 0, 0, 0, 1, 1,
0.6076952, -1.681507, 1.415331, 0, 0, 0, 1, 1,
0.6198456, -2.219473, 3.191983, 1, 1, 1, 1, 1,
0.6233003, -0.5452228, 2.220347, 1, 1, 1, 1, 1,
0.6233982, -0.787991, 3.024069, 1, 1, 1, 1, 1,
0.6253846, -0.2847149, 1.119425, 1, 1, 1, 1, 1,
0.6290175, -1.658348, 3.80817, 1, 1, 1, 1, 1,
0.6295211, 0.6484948, -0.6703406, 1, 1, 1, 1, 1,
0.6357585, 0.2401154, 2.100574, 1, 1, 1, 1, 1,
0.6397834, -0.267812, 3.213288, 1, 1, 1, 1, 1,
0.6405416, 0.8665462, 1.012484, 1, 1, 1, 1, 1,
0.6406366, 0.8011082, -0.1614638, 1, 1, 1, 1, 1,
0.6476019, 1.134794, 1.535614, 1, 1, 1, 1, 1,
0.6598104, -0.7085932, 2.5432, 1, 1, 1, 1, 1,
0.661144, -0.1309199, 0.3985576, 1, 1, 1, 1, 1,
0.6620096, 0.5220067, 1.696343, 1, 1, 1, 1, 1,
0.6621078, 1.730013, 0.1687568, 1, 1, 1, 1, 1,
0.6634104, 1.647157, 2.390939, 0, 0, 1, 1, 1,
0.6692529, 0.3783294, 0.5650535, 1, 0, 0, 1, 1,
0.6728004, 0.2621647, 0.5726127, 1, 0, 0, 1, 1,
0.6853272, 0.1781891, 1.488802, 1, 0, 0, 1, 1,
0.687713, -0.04895831, 1.596438, 1, 0, 0, 1, 1,
0.687816, -1.663895, 2.293464, 1, 0, 0, 1, 1,
0.6922345, -0.3639238, 3.457107, 0, 0, 0, 1, 1,
0.6945605, 0.3432399, 3.293259, 0, 0, 0, 1, 1,
0.6965365, 0.220286, 1.305522, 0, 0, 0, 1, 1,
0.702935, -0.02148842, 0.9104674, 0, 0, 0, 1, 1,
0.7048982, -1.176162, 1.48472, 0, 0, 0, 1, 1,
0.7063315, -1.543466, 1.618711, 0, 0, 0, 1, 1,
0.7101028, -0.9336125, 1.209442, 0, 0, 0, 1, 1,
0.7143474, -0.4114003, 2.627506, 1, 1, 1, 1, 1,
0.7155555, 0.8960212, 0.9696616, 1, 1, 1, 1, 1,
0.7161395, 1.257804, 0.5965885, 1, 1, 1, 1, 1,
0.7257004, -0.7196615, 1.52775, 1, 1, 1, 1, 1,
0.7258862, -0.5780492, 1.009349, 1, 1, 1, 1, 1,
0.7270571, 2.245109, -0.08975107, 1, 1, 1, 1, 1,
0.7286616, 0.2878275, 1.216817, 1, 1, 1, 1, 1,
0.7287809, 0.8196756, 1.375009, 1, 1, 1, 1, 1,
0.7299433, -0.5725452, 0.8339837, 1, 1, 1, 1, 1,
0.7319418, -0.5584936, 1.627677, 1, 1, 1, 1, 1,
0.7347747, 2.022835, -0.3751135, 1, 1, 1, 1, 1,
0.7348489, -1.194937, 3.739962, 1, 1, 1, 1, 1,
0.7495075, 1.896656, 0.6663896, 1, 1, 1, 1, 1,
0.7497314, -1.323063, 2.437375, 1, 1, 1, 1, 1,
0.7606075, -1.858001, 2.656874, 1, 1, 1, 1, 1,
0.7716683, 1.344431, -1.613572, 0, 0, 1, 1, 1,
0.7729995, 0.2911033, 2.228984, 1, 0, 0, 1, 1,
0.7737961, -0.5391836, 2.076485, 1, 0, 0, 1, 1,
0.7748342, 0.5239102, 0.6117285, 1, 0, 0, 1, 1,
0.7780841, 0.07861643, 0.05641889, 1, 0, 0, 1, 1,
0.7782462, -1.326881, 2.395671, 1, 0, 0, 1, 1,
0.780916, 0.585794, 1.098268, 0, 0, 0, 1, 1,
0.7830835, -0.0611779, 2.11015, 0, 0, 0, 1, 1,
0.7882448, -1.705868, 2.444541, 0, 0, 0, 1, 1,
0.7903725, 0.8217901, 1.46587, 0, 0, 0, 1, 1,
0.7932954, -1.494325, 2.420718, 0, 0, 0, 1, 1,
0.8004661, -0.200581, 2.973464, 0, 0, 0, 1, 1,
0.8034168, 1.015388, 0.607989, 0, 0, 0, 1, 1,
0.8119601, 1.906238, -0.3977823, 1, 1, 1, 1, 1,
0.815298, -2.158794, 1.978403, 1, 1, 1, 1, 1,
0.8281141, -1.902564, 5.839211, 1, 1, 1, 1, 1,
0.8308934, -0.2921379, 0.5869363, 1, 1, 1, 1, 1,
0.8339922, -0.221649, 1.803387, 1, 1, 1, 1, 1,
0.8363799, 0.5718959, 1.446448, 1, 1, 1, 1, 1,
0.8416004, 0.7750239, 2.512319, 1, 1, 1, 1, 1,
0.8419008, 0.8899823, 0.02975666, 1, 1, 1, 1, 1,
0.8477954, -0.3096105, 3.09616, 1, 1, 1, 1, 1,
0.8491377, -0.4943223, 0.1933288, 1, 1, 1, 1, 1,
0.8493377, -0.6839011, -0.1016298, 1, 1, 1, 1, 1,
0.8523316, -0.5889593, 2.749203, 1, 1, 1, 1, 1,
0.8547767, 0.5394093, 0.9255257, 1, 1, 1, 1, 1,
0.8575894, 0.9501116, -0.4687698, 1, 1, 1, 1, 1,
0.8592407, 0.8029068, 1.576751, 1, 1, 1, 1, 1,
0.8719174, -0.9983148, 3.644139, 0, 0, 1, 1, 1,
0.87192, 0.3523332, 1.654335, 1, 0, 0, 1, 1,
0.879742, -0.7410702, -0.1656457, 1, 0, 0, 1, 1,
0.8824627, -0.7772849, 1.131313, 1, 0, 0, 1, 1,
0.8894404, 0.07405493, 1.30622, 1, 0, 0, 1, 1,
0.8900545, -0.3070475, 0.67361, 1, 0, 0, 1, 1,
0.8947289, 1.321705, 1.638459, 0, 0, 0, 1, 1,
0.9034539, -1.513244, 2.700523, 0, 0, 0, 1, 1,
0.9042143, -1.567498, 2.78374, 0, 0, 0, 1, 1,
0.9136611, -0.4562354, 2.83673, 0, 0, 0, 1, 1,
0.9152149, 0.9630329, 0.2995945, 0, 0, 0, 1, 1,
0.9166645, 0.08936271, 2.607156, 0, 0, 0, 1, 1,
0.9197068, -1.180317, 2.439158, 0, 0, 0, 1, 1,
0.9258052, -0.7282927, 2.280399, 1, 1, 1, 1, 1,
0.9386474, 0.9206911, 1.698246, 1, 1, 1, 1, 1,
0.941379, 0.2724666, 0.008594041, 1, 1, 1, 1, 1,
0.9438648, -1.274405, 4.087937, 1, 1, 1, 1, 1,
0.9453462, -0.8161802, 2.112217, 1, 1, 1, 1, 1,
0.9624828, 0.6647538, 0.9292583, 1, 1, 1, 1, 1,
0.9635596, 0.4725007, 2.112975, 1, 1, 1, 1, 1,
0.9650147, 0.7912694, 1.954756, 1, 1, 1, 1, 1,
0.9703415, 1.005458, 1.523664, 1, 1, 1, 1, 1,
0.9710537, 0.4642515, -1.449514, 1, 1, 1, 1, 1,
0.9737453, -0.4572836, 0.2490796, 1, 1, 1, 1, 1,
0.9794311, 0.5016301, 0.177768, 1, 1, 1, 1, 1,
0.9795995, -1.219237, 2.652693, 1, 1, 1, 1, 1,
0.9854801, 0.5029491, -0.112946, 1, 1, 1, 1, 1,
0.9866824, 1.422407, -1.337064, 1, 1, 1, 1, 1,
0.9938981, -1.866419, 2.918437, 0, 0, 1, 1, 1,
0.9998074, -0.2256522, 0.9425849, 1, 0, 0, 1, 1,
1.00117, 0.707859, -0.3864067, 1, 0, 0, 1, 1,
1.002316, -0.3329989, 2.554301, 1, 0, 0, 1, 1,
1.015626, -1.333526, 2.972533, 1, 0, 0, 1, 1,
1.020435, 0.487089, 0.8665745, 1, 0, 0, 1, 1,
1.024361, -2.230907, 3.403774, 0, 0, 0, 1, 1,
1.025779, 1.065886, 0.2891047, 0, 0, 0, 1, 1,
1.041498, -0.8848355, 2.172317, 0, 0, 0, 1, 1,
1.04398, 1.869782, 2.650689, 0, 0, 0, 1, 1,
1.05087, 1.665837, 0.1596286, 0, 0, 0, 1, 1,
1.055188, 0.2735236, 0.002992933, 0, 0, 0, 1, 1,
1.060582, 0.1632168, 0.7252818, 0, 0, 0, 1, 1,
1.063017, 0.3954521, 3.884113, 1, 1, 1, 1, 1,
1.064618, -0.9218488, 2.206078, 1, 1, 1, 1, 1,
1.069698, 0.8229089, 0.4859208, 1, 1, 1, 1, 1,
1.075632, 0.9925272, 0.5716087, 1, 1, 1, 1, 1,
1.078398, -0.5036435, 1.23508, 1, 1, 1, 1, 1,
1.081014, -0.3857188, 2.105823, 1, 1, 1, 1, 1,
1.084523, -0.528031, 2.911574, 1, 1, 1, 1, 1,
1.091095, 0.7677634, 0.5667687, 1, 1, 1, 1, 1,
1.094423, 0.7665634, 2.081656, 1, 1, 1, 1, 1,
1.100861, -0.14991, 3.075748, 1, 1, 1, 1, 1,
1.101674, 0.02623919, 2.079473, 1, 1, 1, 1, 1,
1.103792, 0.2657177, 2.231867, 1, 1, 1, 1, 1,
1.10499, -1.227385, 1.445879, 1, 1, 1, 1, 1,
1.113727, -0.01106587, 4.421965, 1, 1, 1, 1, 1,
1.115522, 2.871757, 1.240576, 1, 1, 1, 1, 1,
1.118125, -0.7073101, 2.308548, 0, 0, 1, 1, 1,
1.124817, 0.6759801, 1.397266, 1, 0, 0, 1, 1,
1.126943, 1.832196, 1.651333, 1, 0, 0, 1, 1,
1.128507, 1.032361, 0.6131068, 1, 0, 0, 1, 1,
1.12895, 1.467127, 0.8786039, 1, 0, 0, 1, 1,
1.135191, -0.3840305, 0.382707, 1, 0, 0, 1, 1,
1.140129, 0.5503774, 1.096339, 0, 0, 0, 1, 1,
1.166849, -0.04180168, 0.5559872, 0, 0, 0, 1, 1,
1.167202, -0.608546, 2.5898, 0, 0, 0, 1, 1,
1.169503, -0.4492483, 3.189166, 0, 0, 0, 1, 1,
1.170967, -1.000847, 1.961008, 0, 0, 0, 1, 1,
1.179905, 0.4747411, -0.02486927, 0, 0, 0, 1, 1,
1.180176, 0.01502637, 2.794152, 0, 0, 0, 1, 1,
1.181036, -0.3139787, 2.36367, 1, 1, 1, 1, 1,
1.184687, -1.979653, 1.187258, 1, 1, 1, 1, 1,
1.18993, -0.8938497, 2.851524, 1, 1, 1, 1, 1,
1.201376, -1.422225, 1.948126, 1, 1, 1, 1, 1,
1.204031, -2.04353, 0.9014344, 1, 1, 1, 1, 1,
1.209935, 1.084128, 0.8223923, 1, 1, 1, 1, 1,
1.211043, 0.4962258, 0.9559606, 1, 1, 1, 1, 1,
1.21839, -0.8551562, 1.667336, 1, 1, 1, 1, 1,
1.230587, -0.5260168, 0.07542907, 1, 1, 1, 1, 1,
1.233055, -0.58675, 2.519528, 1, 1, 1, 1, 1,
1.233088, 0.7063739, 1.033921, 1, 1, 1, 1, 1,
1.236544, -0.3267915, 2.068916, 1, 1, 1, 1, 1,
1.249038, -0.6307174, 2.03223, 1, 1, 1, 1, 1,
1.251179, 0.4130636, 3.162256, 1, 1, 1, 1, 1,
1.25629, -0.08940096, 2.54678, 1, 1, 1, 1, 1,
1.257572, -0.4961303, 2.455187, 0, 0, 1, 1, 1,
1.272916, -1.136454, 0.8969873, 1, 0, 0, 1, 1,
1.278884, 0.06433955, 0.4370884, 1, 0, 0, 1, 1,
1.280663, -0.8607558, 3.389589, 1, 0, 0, 1, 1,
1.283021, 0.1302491, 0.3837822, 1, 0, 0, 1, 1,
1.296067, 0.0009983229, 1.953608, 1, 0, 0, 1, 1,
1.29627, 0.6054404, 0.01803814, 0, 0, 0, 1, 1,
1.299324, -0.467941, 2.114741, 0, 0, 0, 1, 1,
1.301324, 0.4568286, 0.9482304, 0, 0, 0, 1, 1,
1.315628, 1.415035, 0.8974263, 0, 0, 0, 1, 1,
1.318696, 0.2594653, 1.371081, 0, 0, 0, 1, 1,
1.319467, -0.8129109, 3.006041, 0, 0, 0, 1, 1,
1.320318, -0.1652065, 2.032354, 0, 0, 0, 1, 1,
1.324469, -1.92403, 1.915059, 1, 1, 1, 1, 1,
1.330273, -0.9019747, -0.2959121, 1, 1, 1, 1, 1,
1.33774, 1.982256, 1.92658, 1, 1, 1, 1, 1,
1.341747, -1.244558, 2.327502, 1, 1, 1, 1, 1,
1.355067, 0.4041947, 2.924234, 1, 1, 1, 1, 1,
1.361031, 0.9729142, 2.552364, 1, 1, 1, 1, 1,
1.363678, -0.6015351, 2.784374, 1, 1, 1, 1, 1,
1.370876, 0.5307916, 0.9481268, 1, 1, 1, 1, 1,
1.371059, -0.8205706, 2.594342, 1, 1, 1, 1, 1,
1.373959, -0.8307846, 2.429879, 1, 1, 1, 1, 1,
1.39902, 0.6523473, 1.788463, 1, 1, 1, 1, 1,
1.416747, -0.903235, 1.529733, 1, 1, 1, 1, 1,
1.418567, 1.080099, 1.753933, 1, 1, 1, 1, 1,
1.423792, -0.05571068, 2.336805, 1, 1, 1, 1, 1,
1.432339, 1.089787, 0.188693, 1, 1, 1, 1, 1,
1.437523, -0.6182081, 1.795729, 0, 0, 1, 1, 1,
1.440025, -2.177825, 5.039593, 1, 0, 0, 1, 1,
1.441655, -0.4660321, 3.310587, 1, 0, 0, 1, 1,
1.443424, -0.6506466, 1.195689, 1, 0, 0, 1, 1,
1.443791, 1.841788, 0.5002984, 1, 0, 0, 1, 1,
1.446752, -0.7727134, 3.32679, 1, 0, 0, 1, 1,
1.455284, 0.0172622, 1.599157, 0, 0, 0, 1, 1,
1.458948, -0.1877956, 0.9527627, 0, 0, 0, 1, 1,
1.465456, -1.870018, 1.858926, 0, 0, 0, 1, 1,
1.472086, -1.337927, 3.009591, 0, 0, 0, 1, 1,
1.4749, 0.5868322, 1.401461, 0, 0, 0, 1, 1,
1.49243, -1.336921, 3.27606, 0, 0, 0, 1, 1,
1.492659, 0.3597704, 1.036555, 0, 0, 0, 1, 1,
1.499264, 0.665834, 0.7304459, 1, 1, 1, 1, 1,
1.502504, 0.2411034, 2.164603, 1, 1, 1, 1, 1,
1.504091, -0.1441255, 0.6962447, 1, 1, 1, 1, 1,
1.50819, 0.5185292, 1.434924, 1, 1, 1, 1, 1,
1.513711, -0.9951504, 3.353696, 1, 1, 1, 1, 1,
1.516567, 0.4817136, 0.5847976, 1, 1, 1, 1, 1,
1.525213, 0.4584612, 3.279432, 1, 1, 1, 1, 1,
1.540258, 0.3205326, 1.747934, 1, 1, 1, 1, 1,
1.550592, 0.343592, 1.56277, 1, 1, 1, 1, 1,
1.558157, 0.2741761, 1.407437, 1, 1, 1, 1, 1,
1.565456, -0.1203125, 1.025337, 1, 1, 1, 1, 1,
1.566309, 2.267878, 0.5668187, 1, 1, 1, 1, 1,
1.589641, 0.6141058, 2.264062, 1, 1, 1, 1, 1,
1.591849, -0.6941828, 0.8675689, 1, 1, 1, 1, 1,
1.609188, 1.579805, -1.038516, 1, 1, 1, 1, 1,
1.621257, 0.9010189, -0.7736141, 0, 0, 1, 1, 1,
1.63258, 0.7729658, 0.5527727, 1, 0, 0, 1, 1,
1.636001, -0.8839108, 1.869351, 1, 0, 0, 1, 1,
1.63928, -0.1752262, 2.565452, 1, 0, 0, 1, 1,
1.639695, -0.4491033, 1.02941, 1, 0, 0, 1, 1,
1.639936, -0.2214422, 3.676459, 1, 0, 0, 1, 1,
1.640442, 0.6776401, 1.080756, 0, 0, 0, 1, 1,
1.644528, -0.5615659, 0.9608454, 0, 0, 0, 1, 1,
1.652757, -0.88493, 3.702095, 0, 0, 0, 1, 1,
1.696271, 1.984672, 0.5163658, 0, 0, 0, 1, 1,
1.704714, 0.5465702, 1.569982, 0, 0, 0, 1, 1,
1.728831, -1.247975, 1.204349, 0, 0, 0, 1, 1,
1.735826, 1.27345, 1.736011, 0, 0, 0, 1, 1,
1.765631, 0.1426571, 1.658003, 1, 1, 1, 1, 1,
1.788264, -1.651071, 5.082327, 1, 1, 1, 1, 1,
1.798813, -1.784844, 2.052564, 1, 1, 1, 1, 1,
1.813237, -0.3920582, 3.841502, 1, 1, 1, 1, 1,
1.826002, 0.6562923, 0.4226307, 1, 1, 1, 1, 1,
1.839206, 1.691014, -0.5496299, 1, 1, 1, 1, 1,
1.856053, 1.242244, 1.418906, 1, 1, 1, 1, 1,
1.876621, -0.2466706, 0.7808809, 1, 1, 1, 1, 1,
1.876843, 1.158898, 2.313685, 1, 1, 1, 1, 1,
1.882948, -0.4404845, 1.231331, 1, 1, 1, 1, 1,
1.896764, -1.655449, 1.857459, 1, 1, 1, 1, 1,
1.899692, 0.8742471, 1.090763, 1, 1, 1, 1, 1,
1.932141, 0.1618768, 2.787981, 1, 1, 1, 1, 1,
1.992008, 0.2093271, 2.285075, 1, 1, 1, 1, 1,
2.009514, -2.303406, 2.744087, 1, 1, 1, 1, 1,
2.018762, 0.1039041, 2.885978, 0, 0, 1, 1, 1,
2.023899, 0.4125573, 0.8610653, 1, 0, 0, 1, 1,
2.032128, -1.262846, 2.465064, 1, 0, 0, 1, 1,
2.046601, 1.197086, 0.3696639, 1, 0, 0, 1, 1,
2.049295, 0.3563237, 1.222855, 1, 0, 0, 1, 1,
2.100349, -0.2894998, 1.435195, 1, 0, 0, 1, 1,
2.151487, 0.0032211, 1.550368, 0, 0, 0, 1, 1,
2.214634, 1.936134, 0.6755784, 0, 0, 0, 1, 1,
2.241341, -1.527558, 3.649932, 0, 0, 0, 1, 1,
2.322298, 1.412851, -1.372785, 0, 0, 0, 1, 1,
2.325341, -0.6143007, 3.06956, 0, 0, 0, 1, 1,
2.327565, -0.2959791, 0.07371471, 0, 0, 0, 1, 1,
2.376857, 1.318425, -0.02254418, 0, 0, 0, 1, 1,
2.469315, 0.6794738, 1.525784, 1, 1, 1, 1, 1,
2.538551, -0.3360019, 2.742449, 1, 1, 1, 1, 1,
2.640401, -0.1657583, 0.3019752, 1, 1, 1, 1, 1,
2.695567, -0.4339752, 3.08206, 1, 1, 1, 1, 1,
2.737897, -0.1227185, 1.655759, 1, 1, 1, 1, 1,
2.96474, -0.3664978, 3.607376, 1, 1, 1, 1, 1,
4.253649, 0.8444998, 1.931831, 1, 1, 1, 1, 1
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
var radius = 10.16777;
var distance = 35.71387;
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
mvMatrix.translate( -0.6180115, 0.3053095, -0.2442508 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.71387);
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
