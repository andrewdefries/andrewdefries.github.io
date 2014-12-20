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
-3.298744, 1.343887, -1.198848, 1, 0, 0, 1,
-2.79217, 0.9107744, -2.052995, 1, 0.007843138, 0, 1,
-2.737812, -1.079955, -1.912229, 1, 0.01176471, 0, 1,
-2.721637, -0.5597402, -0.1971406, 1, 0.01960784, 0, 1,
-2.708014, 2.041552, 0.8006216, 1, 0.02352941, 0, 1,
-2.681312, 1.663631, -1.268177, 1, 0.03137255, 0, 1,
-2.63228, 1.45983, -0.7344644, 1, 0.03529412, 0, 1,
-2.558613, -0.1191445, -2.369399, 1, 0.04313726, 0, 1,
-2.495892, 0.949648, -0.54656, 1, 0.04705882, 0, 1,
-2.475357, -0.6639805, -2.004327, 1, 0.05490196, 0, 1,
-2.463908, -1.026496, -1.729221, 1, 0.05882353, 0, 1,
-2.422839, 0.003045835, -2.389306, 1, 0.06666667, 0, 1,
-2.259915, 1.43637, -1.739956, 1, 0.07058824, 0, 1,
-2.249865, -0.4828711, -2.319933, 1, 0.07843138, 0, 1,
-2.248958, -1.003925, 1.217062, 1, 0.08235294, 0, 1,
-2.156132, 0.4982232, -0.2996725, 1, 0.09019608, 0, 1,
-2.130851, 1.132394, -0.189199, 1, 0.09411765, 0, 1,
-2.127396, 0.9263622, -0.3139553, 1, 0.1019608, 0, 1,
-2.114056, -1.631479, -3.860902, 1, 0.1098039, 0, 1,
-2.081363, 0.4449798, -3.994019, 1, 0.1137255, 0, 1,
-2.057894, -0.1754769, -2.728273, 1, 0.1215686, 0, 1,
-2.054741, -0.2625344, -1.286696, 1, 0.1254902, 0, 1,
-2.048915, 0.4412038, -2.360975, 1, 0.1333333, 0, 1,
-2.0286, 0.4621622, -0.2466626, 1, 0.1372549, 0, 1,
-2.025365, -0.1997965, -1.535796, 1, 0.145098, 0, 1,
-2.017207, 1.918772, 0.07868981, 1, 0.1490196, 0, 1,
-1.964324, 2.551923, -1.30996, 1, 0.1568628, 0, 1,
-1.899251, -0.1938595, -1.975313, 1, 0.1607843, 0, 1,
-1.837601, 1.345735, -1.64805, 1, 0.1686275, 0, 1,
-1.818314, 0.1253548, -0.2336606, 1, 0.172549, 0, 1,
-1.815301, 0.8679159, -0.5293438, 1, 0.1803922, 0, 1,
-1.810002, 1.698842, -2.001825, 1, 0.1843137, 0, 1,
-1.808952, -0.3447277, -2.650094, 1, 0.1921569, 0, 1,
-1.777731, 0.2372217, -1.476679, 1, 0.1960784, 0, 1,
-1.770614, 1.135329, -0.6641695, 1, 0.2039216, 0, 1,
-1.767348, 1.020236, -1.519874, 1, 0.2117647, 0, 1,
-1.762895, 0.5280806, -1.234021, 1, 0.2156863, 0, 1,
-1.760976, -0.9970914, -2.309003, 1, 0.2235294, 0, 1,
-1.753531, 0.408399, -1.006799, 1, 0.227451, 0, 1,
-1.739343, -1.298529, -2.875619, 1, 0.2352941, 0, 1,
-1.724934, -1.475471, -0.2713579, 1, 0.2392157, 0, 1,
-1.722361, 0.7936108, -0.6805703, 1, 0.2470588, 0, 1,
-1.715513, -0.3236366, -2.436435, 1, 0.2509804, 0, 1,
-1.713103, -0.4688246, -0.4305411, 1, 0.2588235, 0, 1,
-1.710643, 0.2444043, -1.662134, 1, 0.2627451, 0, 1,
-1.707086, -0.4728315, -3.20737, 1, 0.2705882, 0, 1,
-1.686241, 1.206856, 0.4042015, 1, 0.2745098, 0, 1,
-1.680747, -1.009252, -1.579754, 1, 0.282353, 0, 1,
-1.677154, -1.24558, -2.892596, 1, 0.2862745, 0, 1,
-1.673596, 0.09453916, -1.402852, 1, 0.2941177, 0, 1,
-1.639246, 0.4305961, -2.8603, 1, 0.3019608, 0, 1,
-1.603921, -0.5951912, -1.301907, 1, 0.3058824, 0, 1,
-1.576571, 0.7382217, -2.493932, 1, 0.3137255, 0, 1,
-1.576146, -0.3885793, -0.5473998, 1, 0.3176471, 0, 1,
-1.574078, 0.1100411, -2.022588, 1, 0.3254902, 0, 1,
-1.570371, -1.133986, -1.145867, 1, 0.3294118, 0, 1,
-1.565044, 0.5078688, -1.762718, 1, 0.3372549, 0, 1,
-1.552192, 0.0960056, -0.5063585, 1, 0.3411765, 0, 1,
-1.537137, 0.7357336, -0.2779343, 1, 0.3490196, 0, 1,
-1.51978, 0.6841732, 0.2673994, 1, 0.3529412, 0, 1,
-1.51345, -0.01239067, -1.929566, 1, 0.3607843, 0, 1,
-1.493882, -0.2866872, -1.271913, 1, 0.3647059, 0, 1,
-1.487281, 0.1533529, -2.282146, 1, 0.372549, 0, 1,
-1.483592, -1.548439, -2.383632, 1, 0.3764706, 0, 1,
-1.481656, 0.7969495, 0.6354082, 1, 0.3843137, 0, 1,
-1.463526, -0.08307649, -2.270552, 1, 0.3882353, 0, 1,
-1.456578, 0.5368455, -2.115941, 1, 0.3960784, 0, 1,
-1.438224, 1.486791, -0.3614565, 1, 0.4039216, 0, 1,
-1.421566, 2.436374, -0.1123745, 1, 0.4078431, 0, 1,
-1.417368, -0.7165899, -1.414911, 1, 0.4156863, 0, 1,
-1.409515, 0.5649475, -0.1773704, 1, 0.4196078, 0, 1,
-1.406915, 0.06064767, -1.545277, 1, 0.427451, 0, 1,
-1.402151, 1.670092, -0.7906771, 1, 0.4313726, 0, 1,
-1.394009, -1.655812, -2.42583, 1, 0.4392157, 0, 1,
-1.393179, 0.02300547, -2.058773, 1, 0.4431373, 0, 1,
-1.39302, 0.3078623, -2.63768, 1, 0.4509804, 0, 1,
-1.386081, -0.1925277, -3.168345, 1, 0.454902, 0, 1,
-1.373447, -1.393104, -3.7293, 1, 0.4627451, 0, 1,
-1.370276, 0.848738, -0.8693642, 1, 0.4666667, 0, 1,
-1.342174, 1.463191, -0.5947109, 1, 0.4745098, 0, 1,
-1.341661, 0.4438883, -1.096695, 1, 0.4784314, 0, 1,
-1.340929, -0.3471979, -1.448127, 1, 0.4862745, 0, 1,
-1.324705, 0.2147083, -1.129652, 1, 0.4901961, 0, 1,
-1.322214, -0.1802461, -2.221026, 1, 0.4980392, 0, 1,
-1.31913, -0.7962233, -2.191007, 1, 0.5058824, 0, 1,
-1.318658, 0.8586269, -0.3078343, 1, 0.509804, 0, 1,
-1.316674, 0.4490853, -1.356636, 1, 0.5176471, 0, 1,
-1.308407, 0.7032467, 0.4534853, 1, 0.5215687, 0, 1,
-1.297858, -1.014676, -0.4342181, 1, 0.5294118, 0, 1,
-1.285537, 0.08856847, -1.291552, 1, 0.5333334, 0, 1,
-1.285298, 1.476235, 0.009861349, 1, 0.5411765, 0, 1,
-1.274774, 0.0901349, -1.68562, 1, 0.5450981, 0, 1,
-1.269293, 1.202277, 0.09722196, 1, 0.5529412, 0, 1,
-1.26606, 1.074178, -0.89314, 1, 0.5568628, 0, 1,
-1.263551, 1.295555, -2.586221, 1, 0.5647059, 0, 1,
-1.262359, 0.4081309, -2.572005, 1, 0.5686275, 0, 1,
-1.255332, 1.360113, -1.476698, 1, 0.5764706, 0, 1,
-1.252888, 0.1507132, -2.908506, 1, 0.5803922, 0, 1,
-1.219583, -3.16555, -3.85797, 1, 0.5882353, 0, 1,
-1.211534, -0.7234654, -3.338583, 1, 0.5921569, 0, 1,
-1.209655, -0.4365986, -1.042654, 1, 0.6, 0, 1,
-1.20862, 0.08392426, -0.8404719, 1, 0.6078432, 0, 1,
-1.206525, 0.3014339, -3.659587, 1, 0.6117647, 0, 1,
-1.189382, -1.861337, -2.498531, 1, 0.6196079, 0, 1,
-1.188826, -0.3172634, -2.998459, 1, 0.6235294, 0, 1,
-1.174152, -0.4660118, -0.7549459, 1, 0.6313726, 0, 1,
-1.172362, -0.3626319, -3.211442, 1, 0.6352941, 0, 1,
-1.167964, 1.166775, -0.3146851, 1, 0.6431373, 0, 1,
-1.165614, 0.1492499, -3.482885, 1, 0.6470588, 0, 1,
-1.157527, -0.05654956, -1.034258, 1, 0.654902, 0, 1,
-1.152584, -0.7536224, -1.910929, 1, 0.6588235, 0, 1,
-1.152005, 0.232734, -2.002342, 1, 0.6666667, 0, 1,
-1.144462, -1.271551, -3.048196, 1, 0.6705883, 0, 1,
-1.136785, -2.854698, -3.60086, 1, 0.6784314, 0, 1,
-1.132648, -1.490751, -2.115164, 1, 0.682353, 0, 1,
-1.132506, 1.672136, 0.2662092, 1, 0.6901961, 0, 1,
-1.131251, -0.9576327, -1.335741, 1, 0.6941177, 0, 1,
-1.131089, -0.3939369, -1.875004, 1, 0.7019608, 0, 1,
-1.130169, -1.178343, -3.279137, 1, 0.7098039, 0, 1,
-1.126551, 0.653717, -1.992142, 1, 0.7137255, 0, 1,
-1.124813, 0.3283705, -1.773219, 1, 0.7215686, 0, 1,
-1.118624, 0.7301391, -2.151467, 1, 0.7254902, 0, 1,
-1.118095, -0.8018588, -1.54133, 1, 0.7333333, 0, 1,
-1.117149, -2.756984, -5.087606, 1, 0.7372549, 0, 1,
-1.113595, 0.7246317, -1.856101, 1, 0.7450981, 0, 1,
-1.113468, 0.7674829, -2.344037, 1, 0.7490196, 0, 1,
-1.097218, 1.358415, 0.1109964, 1, 0.7568628, 0, 1,
-1.094845, 0.5189918, 0.08448291, 1, 0.7607843, 0, 1,
-1.09311, 0.1947037, -0.8359887, 1, 0.7686275, 0, 1,
-1.091073, -0.7179508, -2.037454, 1, 0.772549, 0, 1,
-1.08536, -0.07665744, -1.266837, 1, 0.7803922, 0, 1,
-1.083469, 0.3058857, -1.961275, 1, 0.7843137, 0, 1,
-1.071066, -0.3541826, -0.8741764, 1, 0.7921569, 0, 1,
-1.069719, 0.1171486, -0.04399731, 1, 0.7960784, 0, 1,
-1.068082, -0.07719672, -3.365735, 1, 0.8039216, 0, 1,
-1.053743, 1.266889, -0.8790376, 1, 0.8117647, 0, 1,
-1.050984, -0.6043319, -4.116205, 1, 0.8156863, 0, 1,
-1.049056, 1.427742, -0.01770819, 1, 0.8235294, 0, 1,
-1.044729, -0.4601115, -2.912463, 1, 0.827451, 0, 1,
-1.043297, 0.5701302, 0.710978, 1, 0.8352941, 0, 1,
-1.038298, 0.521731, -1.581903, 1, 0.8392157, 0, 1,
-1.033274, 0.5067321, -2.965377, 1, 0.8470588, 0, 1,
-1.02272, 0.6383703, -1.160699, 1, 0.8509804, 0, 1,
-1.022558, 0.3217515, 0.9546116, 1, 0.8588235, 0, 1,
-1.018485, -0.7127012, -2.852813, 1, 0.8627451, 0, 1,
-1.008892, -1.21456, -3.338679, 1, 0.8705882, 0, 1,
-1.002834, 0.3005379, -1.983398, 1, 0.8745098, 0, 1,
-1.002687, -0.05768205, -1.401382, 1, 0.8823529, 0, 1,
-1.00136, -0.2995429, -2.593584, 1, 0.8862745, 0, 1,
-0.9971969, -1.377434, -3.448244, 1, 0.8941177, 0, 1,
-0.996269, -0.9836714, -2.252532, 1, 0.8980392, 0, 1,
-0.9922646, 0.346819, -2.575522, 1, 0.9058824, 0, 1,
-0.9853578, -0.9198449, -1.599755, 1, 0.9137255, 0, 1,
-0.9838509, 0.1273057, -1.796597, 1, 0.9176471, 0, 1,
-0.9830711, 0.4705547, -1.650647, 1, 0.9254902, 0, 1,
-0.9804748, 0.486927, -0.8615676, 1, 0.9294118, 0, 1,
-0.95322, 1.664445, -0.5029896, 1, 0.9372549, 0, 1,
-0.9517355, 0.4570817, -1.426787, 1, 0.9411765, 0, 1,
-0.9362572, 0.7460975, -1.515105, 1, 0.9490196, 0, 1,
-0.9361219, -0.6425041, -1.749897, 1, 0.9529412, 0, 1,
-0.9293114, 0.3276648, -1.780116, 1, 0.9607843, 0, 1,
-0.9267156, 1.868712, -0.6578317, 1, 0.9647059, 0, 1,
-0.9264173, -1.783638, -2.752876, 1, 0.972549, 0, 1,
-0.9248381, -0.2317917, -0.05866225, 1, 0.9764706, 0, 1,
-0.924612, 0.5780715, -1.213804, 1, 0.9843137, 0, 1,
-0.9231457, -0.3392045, -3.846442, 1, 0.9882353, 0, 1,
-0.9178675, -1.322764, -3.143492, 1, 0.9960784, 0, 1,
-0.9157051, 0.4075419, 0.4989311, 0.9960784, 1, 0, 1,
-0.9083818, -0.6742018, -3.462225, 0.9921569, 1, 0, 1,
-0.9056683, -0.7801517, -3.967781, 0.9843137, 1, 0, 1,
-0.903362, -0.6409492, -4.15366, 0.9803922, 1, 0, 1,
-0.902581, 0.5212192, -0.9877561, 0.972549, 1, 0, 1,
-0.898351, 0.8875623, -1.101359, 0.9686275, 1, 0, 1,
-0.8953, -1.157293, -2.095046, 0.9607843, 1, 0, 1,
-0.8932149, 0.733763, -1.168012, 0.9568627, 1, 0, 1,
-0.8909056, -0.5104584, -4.091855, 0.9490196, 1, 0, 1,
-0.8879361, 0.7144416, 0.212131, 0.945098, 1, 0, 1,
-0.8877525, 0.5028998, 0.04914873, 0.9372549, 1, 0, 1,
-0.8869433, 1.172757, -1.167536, 0.9333333, 1, 0, 1,
-0.8823363, -0.8961171, -2.368951, 0.9254902, 1, 0, 1,
-0.8696797, -0.0750802, -2.197141, 0.9215686, 1, 0, 1,
-0.8689114, 1.36826, 0.7702655, 0.9137255, 1, 0, 1,
-0.8621153, -1.995528, -2.816938, 0.9098039, 1, 0, 1,
-0.8601192, -0.8719082, -1.94081, 0.9019608, 1, 0, 1,
-0.8560613, -0.333747, -2.322185, 0.8941177, 1, 0, 1,
-0.8549635, -1.53327, -2.176099, 0.8901961, 1, 0, 1,
-0.8544026, 0.4233769, -1.305861, 0.8823529, 1, 0, 1,
-0.8500526, -0.3939667, -3.846915, 0.8784314, 1, 0, 1,
-0.8477041, 0.4604892, -0.5582528, 0.8705882, 1, 0, 1,
-0.8468331, 0.3678822, -1.281183, 0.8666667, 1, 0, 1,
-0.8449184, -2.712359, -2.59987, 0.8588235, 1, 0, 1,
-0.844123, 0.237091, -0.1437763, 0.854902, 1, 0, 1,
-0.8354241, 1.175325, -1.480845, 0.8470588, 1, 0, 1,
-0.8310198, -0.7799519, -2.532929, 0.8431373, 1, 0, 1,
-0.8233701, -0.5355166, -2.256644, 0.8352941, 1, 0, 1,
-0.822831, -2.058018, -0.694688, 0.8313726, 1, 0, 1,
-0.8220364, -0.1750137, -1.534676, 0.8235294, 1, 0, 1,
-0.8205175, -0.8747398, -2.417426, 0.8196079, 1, 0, 1,
-0.818899, 0.3465832, -0.4093095, 0.8117647, 1, 0, 1,
-0.8178279, -0.5177856, -2.126281, 0.8078431, 1, 0, 1,
-0.8168686, -1.525184, -2.75512, 0.8, 1, 0, 1,
-0.8129829, 0.9029544, -1.322214, 0.7921569, 1, 0, 1,
-0.8118213, -0.3964827, -3.93533, 0.7882353, 1, 0, 1,
-0.8082023, 0.357003, -1.528835, 0.7803922, 1, 0, 1,
-0.8038337, 1.207468, -0.2220072, 0.7764706, 1, 0, 1,
-0.8036757, 0.302276, -1.609262, 0.7686275, 1, 0, 1,
-0.8036029, 1.93035, 0.5122018, 0.7647059, 1, 0, 1,
-0.8012899, 0.5016745, -0.2108211, 0.7568628, 1, 0, 1,
-0.7972209, 1.634041, -1.095923, 0.7529412, 1, 0, 1,
-0.7960121, -1.355196, -2.060169, 0.7450981, 1, 0, 1,
-0.7919307, 0.7243693, -2.60025, 0.7411765, 1, 0, 1,
-0.7915187, -0.8329276, -2.207268, 0.7333333, 1, 0, 1,
-0.7882209, -0.5018523, -1.813931, 0.7294118, 1, 0, 1,
-0.7845901, 0.9672103, 0.3448257, 0.7215686, 1, 0, 1,
-0.7836472, 0.1255573, -3.197641, 0.7176471, 1, 0, 1,
-0.774152, 1.080119, -0.5354151, 0.7098039, 1, 0, 1,
-0.7621452, -0.894846, -3.968465, 0.7058824, 1, 0, 1,
-0.7584866, -0.5052128, -2.098626, 0.6980392, 1, 0, 1,
-0.7517802, -0.1822475, -3.588522, 0.6901961, 1, 0, 1,
-0.7509663, 0.6526731, -0.3234983, 0.6862745, 1, 0, 1,
-0.7496423, 1.067354, -1.837295, 0.6784314, 1, 0, 1,
-0.7452711, -0.7711989, -2.345239, 0.6745098, 1, 0, 1,
-0.7395034, 0.9280058, -1.782412, 0.6666667, 1, 0, 1,
-0.7363094, 0.922368, 0.2632551, 0.6627451, 1, 0, 1,
-0.7305031, 0.5780776, -1.959319, 0.654902, 1, 0, 1,
-0.7160351, 0.06881955, -1.576627, 0.6509804, 1, 0, 1,
-0.7157306, 0.2558101, -0.9071506, 0.6431373, 1, 0, 1,
-0.7085775, -1.568557, -0.4428428, 0.6392157, 1, 0, 1,
-0.7065372, -0.1379664, -1.086673, 0.6313726, 1, 0, 1,
-0.706126, 0.7781524, -0.901171, 0.627451, 1, 0, 1,
-0.7034165, -0.4035928, -1.865703, 0.6196079, 1, 0, 1,
-0.6958361, 0.5746434, -0.4191088, 0.6156863, 1, 0, 1,
-0.6929011, -1.286083, -2.409008, 0.6078432, 1, 0, 1,
-0.6842106, 0.1654974, -3.663612, 0.6039216, 1, 0, 1,
-0.6802696, 0.7003385, -1.649499, 0.5960785, 1, 0, 1,
-0.6759297, 0.4180695, -1.53913, 0.5882353, 1, 0, 1,
-0.6754084, -0.3780794, -0.9381313, 0.5843138, 1, 0, 1,
-0.6752794, -1.079999, -3.065469, 0.5764706, 1, 0, 1,
-0.670689, 0.7375799, 0.764697, 0.572549, 1, 0, 1,
-0.6698164, 0.02857125, -0.1114476, 0.5647059, 1, 0, 1,
-0.6654799, -0.7131323, -2.093769, 0.5607843, 1, 0, 1,
-0.6633841, 0.3418436, -2.594126, 0.5529412, 1, 0, 1,
-0.6632509, 1.77338, -0.3804409, 0.5490196, 1, 0, 1,
-0.6618169, -0.297273, -3.591229, 0.5411765, 1, 0, 1,
-0.6610811, 0.1995515, -1.481728, 0.5372549, 1, 0, 1,
-0.6609254, -0.09086967, -1.066637, 0.5294118, 1, 0, 1,
-0.6604749, -1.234035, -2.070732, 0.5254902, 1, 0, 1,
-0.6603463, -1.773525, -4.303198, 0.5176471, 1, 0, 1,
-0.6561508, -1.366849, -2.492813, 0.5137255, 1, 0, 1,
-0.6549287, 0.4364146, -2.722299, 0.5058824, 1, 0, 1,
-0.6530621, -0.5370384, -4.108172, 0.5019608, 1, 0, 1,
-0.6499396, -0.6878242, -3.061464, 0.4941176, 1, 0, 1,
-0.6498273, 0.110695, -1.826413, 0.4862745, 1, 0, 1,
-0.6482172, 0.2459799, 0.1206741, 0.4823529, 1, 0, 1,
-0.6471443, 0.3961527, -2.170749, 0.4745098, 1, 0, 1,
-0.6457019, 0.785336, -0.5529731, 0.4705882, 1, 0, 1,
-0.6441883, -1.26728, -4.179377, 0.4627451, 1, 0, 1,
-0.6418729, -0.2345105, -2.389783, 0.4588235, 1, 0, 1,
-0.6408805, 1.381052, -0.3421209, 0.4509804, 1, 0, 1,
-0.6369848, -0.4035126, -2.15282, 0.4470588, 1, 0, 1,
-0.6350927, 2.520393, 0.5932801, 0.4392157, 1, 0, 1,
-0.632993, -1.169436, -2.577012, 0.4352941, 1, 0, 1,
-0.6306707, -1.063988, -2.011981, 0.427451, 1, 0, 1,
-0.6298938, 0.2909516, -0.2087385, 0.4235294, 1, 0, 1,
-0.6257549, 1.1905, -0.4418983, 0.4156863, 1, 0, 1,
-0.6253846, -1.47265, -4.363483, 0.4117647, 1, 0, 1,
-0.6211984, -0.4526707, -3.393659, 0.4039216, 1, 0, 1,
-0.6205043, -0.9488908, -2.549231, 0.3960784, 1, 0, 1,
-0.6176786, 1.815007, -1.930763, 0.3921569, 1, 0, 1,
-0.6058994, 0.06864296, -2.558964, 0.3843137, 1, 0, 1,
-0.6038996, -0.7049009, -1.567147, 0.3803922, 1, 0, 1,
-0.596631, 1.386087, 0.08899978, 0.372549, 1, 0, 1,
-0.5947977, 0.4231918, -0.5470607, 0.3686275, 1, 0, 1,
-0.593259, -1.092435, -2.523752, 0.3607843, 1, 0, 1,
-0.5890669, -0.3897165, -1.622582, 0.3568628, 1, 0, 1,
-0.5884179, 1.274496, 1.267762, 0.3490196, 1, 0, 1,
-0.5868213, 0.721181, -0.164601, 0.345098, 1, 0, 1,
-0.585561, -0.66584, -1.244603, 0.3372549, 1, 0, 1,
-0.5781748, -0.2635805, -0.8774188, 0.3333333, 1, 0, 1,
-0.577617, 1.32849, -0.073718, 0.3254902, 1, 0, 1,
-0.5728261, -0.3377637, -4.36631, 0.3215686, 1, 0, 1,
-0.5693959, 0.1616226, -1.888107, 0.3137255, 1, 0, 1,
-0.5635728, 0.137321, -0.5701331, 0.3098039, 1, 0, 1,
-0.5621847, 0.5518302, -0.9185897, 0.3019608, 1, 0, 1,
-0.5617551, 0.676742, -0.2432629, 0.2941177, 1, 0, 1,
-0.5616023, 0.106936, -0.4419464, 0.2901961, 1, 0, 1,
-0.5598861, -0.1222954, -1.456138, 0.282353, 1, 0, 1,
-0.5520367, 0.7438741, -1.60628, 0.2784314, 1, 0, 1,
-0.5492546, -0.7881392, -1.048724, 0.2705882, 1, 0, 1,
-0.5485892, -0.6261162, -2.646044, 0.2666667, 1, 0, 1,
-0.5467986, 0.4093045, -2.310421, 0.2588235, 1, 0, 1,
-0.5466713, 0.7412511, -1.47401, 0.254902, 1, 0, 1,
-0.5431859, 0.671314, -0.1579056, 0.2470588, 1, 0, 1,
-0.5421522, 0.9598241, 0.155629, 0.2431373, 1, 0, 1,
-0.5406969, -0.1699263, -2.79257, 0.2352941, 1, 0, 1,
-0.5394449, 0.0945562, -0.1234321, 0.2313726, 1, 0, 1,
-0.5382478, 0.388966, -0.7990637, 0.2235294, 1, 0, 1,
-0.536122, 0.1380141, -2.816222, 0.2196078, 1, 0, 1,
-0.5321104, -0.1101895, -1.629163, 0.2117647, 1, 0, 1,
-0.5260059, -0.0916129, -0.7046794, 0.2078431, 1, 0, 1,
-0.5204601, 1.872188, 0.3948151, 0.2, 1, 0, 1,
-0.5195459, 0.7604615, -0.0295597, 0.1921569, 1, 0, 1,
-0.5170637, 0.9438331, -0.8606631, 0.1882353, 1, 0, 1,
-0.5143973, 0.8493833, 0.2988045, 0.1803922, 1, 0, 1,
-0.5098459, 1.019032, -0.7217815, 0.1764706, 1, 0, 1,
-0.5073683, 1.602405, -0.9259071, 0.1686275, 1, 0, 1,
-0.5069389, 0.5344661, -1.19928, 0.1647059, 1, 0, 1,
-0.5018528, -1.154296, -1.913454, 0.1568628, 1, 0, 1,
-0.499245, 0.9936596, -0.06642827, 0.1529412, 1, 0, 1,
-0.4965383, 1.766351, 0.1215399, 0.145098, 1, 0, 1,
-0.4893118, -0.9351234, -3.858459, 0.1411765, 1, 0, 1,
-0.4890239, -0.4635311, -3.412023, 0.1333333, 1, 0, 1,
-0.48812, -0.1498547, -1.616746, 0.1294118, 1, 0, 1,
-0.4877827, -1.214697, -2.777277, 0.1215686, 1, 0, 1,
-0.4833866, 0.5154253, -1.140173, 0.1176471, 1, 0, 1,
-0.4833308, -0.6948699, -4.147567, 0.1098039, 1, 0, 1,
-0.4792938, 0.5776898, -2.720715, 0.1058824, 1, 0, 1,
-0.4776778, 0.4427588, -0.09998924, 0.09803922, 1, 0, 1,
-0.4772572, -0.5396727, -2.219666, 0.09019608, 1, 0, 1,
-0.4729559, 0.7421902, -0.6796336, 0.08627451, 1, 0, 1,
-0.4668938, -0.09629221, -1.869378, 0.07843138, 1, 0, 1,
-0.4645091, 0.3774003, -1.223554, 0.07450981, 1, 0, 1,
-0.4641805, 0.2127992, -0.9021191, 0.06666667, 1, 0, 1,
-0.4579385, -1.570659, -2.841958, 0.0627451, 1, 0, 1,
-0.4568715, 0.4970493, -1.24662, 0.05490196, 1, 0, 1,
-0.451952, -0.1244598, -2.092489, 0.05098039, 1, 0, 1,
-0.4480586, 1.354945, -1.569095, 0.04313726, 1, 0, 1,
-0.4477243, 1.449763, -0.5901256, 0.03921569, 1, 0, 1,
-0.4445531, 0.8992059, 1.709355, 0.03137255, 1, 0, 1,
-0.4445371, -0.579371, -3.380111, 0.02745098, 1, 0, 1,
-0.4326561, 0.8600548, -0.3386135, 0.01960784, 1, 0, 1,
-0.4301278, -0.6201537, -1.625284, 0.01568628, 1, 0, 1,
-0.4291961, -0.638773, -2.100165, 0.007843138, 1, 0, 1,
-0.4263685, 0.3421644, -1.030151, 0.003921569, 1, 0, 1,
-0.4226361, -0.1816529, 0.00630616, 0, 1, 0.003921569, 1,
-0.4222382, -0.2135996, -1.08396, 0, 1, 0.01176471, 1,
-0.4210871, -0.04317959, -0.4632421, 0, 1, 0.01568628, 1,
-0.420735, -1.027263, -3.50865, 0, 1, 0.02352941, 1,
-0.4184918, -1.01425, -2.600417, 0, 1, 0.02745098, 1,
-0.4180865, -0.3435868, -0.7588508, 0, 1, 0.03529412, 1,
-0.4172542, 0.3097787, -1.145539, 0, 1, 0.03921569, 1,
-0.4169568, 1.049733, -1.674576, 0, 1, 0.04705882, 1,
-0.4124389, 2.477561, -0.3340471, 0, 1, 0.05098039, 1,
-0.4076604, 0.3159081, -1.698534, 0, 1, 0.05882353, 1,
-0.4064491, -0.6750082, -1.25863, 0, 1, 0.0627451, 1,
-0.4041989, -0.007556096, -1.982978, 0, 1, 0.07058824, 1,
-0.4023486, 0.3462779, -2.466831, 0, 1, 0.07450981, 1,
-0.4013687, -1.466137, -2.091144, 0, 1, 0.08235294, 1,
-0.4010611, -0.6663323, -3.183648, 0, 1, 0.08627451, 1,
-0.3989097, 0.3266339, -1.237661, 0, 1, 0.09411765, 1,
-0.3986682, 0.9686865, -0.393639, 0, 1, 0.1019608, 1,
-0.3965014, -0.2984845, -1.843093, 0, 1, 0.1058824, 1,
-0.3905778, -0.899538, -1.681006, 0, 1, 0.1137255, 1,
-0.3897685, 0.01584353, -0.5627475, 0, 1, 0.1176471, 1,
-0.3798608, -2.057743, -2.698633, 0, 1, 0.1254902, 1,
-0.3784398, -1.488594, -3.534768, 0, 1, 0.1294118, 1,
-0.3741387, -0.7525527, -3.733238, 0, 1, 0.1372549, 1,
-0.3724613, 0.4409975, -1.075811, 0, 1, 0.1411765, 1,
-0.3723747, -1.758934, -2.446557, 0, 1, 0.1490196, 1,
-0.3586229, 0.9329693, -1.604993, 0, 1, 0.1529412, 1,
-0.3434534, -0.1202403, -2.598117, 0, 1, 0.1607843, 1,
-0.3366354, -1.121032, -4.056245, 0, 1, 0.1647059, 1,
-0.3357948, 0.03720665, -2.038799, 0, 1, 0.172549, 1,
-0.3344062, 0.7767093, -0.5220067, 0, 1, 0.1764706, 1,
-0.3339968, 0.1320157, -1.883828, 0, 1, 0.1843137, 1,
-0.3309755, 0.7753945, -0.1278738, 0, 1, 0.1882353, 1,
-0.3276972, -1.353405, -4.018233, 0, 1, 0.1960784, 1,
-0.3243829, -0.1305141, -1.952159, 0, 1, 0.2039216, 1,
-0.3208227, 0.8007081, -2.780888, 0, 1, 0.2078431, 1,
-0.3125764, 0.2150839, -0.08598949, 0, 1, 0.2156863, 1,
-0.3116135, 0.2288312, -1.083884, 0, 1, 0.2196078, 1,
-0.3097778, -1.045956, -3.440212, 0, 1, 0.227451, 1,
-0.3079545, 1.091623, 0.5749107, 0, 1, 0.2313726, 1,
-0.3073027, 1.419146, 0.5916554, 0, 1, 0.2392157, 1,
-0.3037862, 1.383799, -0.786798, 0, 1, 0.2431373, 1,
-0.3014255, -1.971279, -3.312333, 0, 1, 0.2509804, 1,
-0.3006292, 0.8810615, -0.4307635, 0, 1, 0.254902, 1,
-0.2992876, -1.208855, -2.785937, 0, 1, 0.2627451, 1,
-0.2937946, -0.9494491, -5.229167, 0, 1, 0.2666667, 1,
-0.2903307, -1.657558, -3.589333, 0, 1, 0.2745098, 1,
-0.2876961, 2.10293, -1.177876, 0, 1, 0.2784314, 1,
-0.2861938, 2.080642, -0.646585, 0, 1, 0.2862745, 1,
-0.2853076, 0.5344807, 2.208436, 0, 1, 0.2901961, 1,
-0.2837507, 1.004631, -0.701481, 0, 1, 0.2980392, 1,
-0.2833017, 0.4332211, -1.1583, 0, 1, 0.3058824, 1,
-0.27821, -0.7444897, -4.282074, 0, 1, 0.3098039, 1,
-0.2730612, 0.6233982, 1.35922, 0, 1, 0.3176471, 1,
-0.2718459, 1.538514, -1.567759, 0, 1, 0.3215686, 1,
-0.2717172, -2.4995, -4.104564, 0, 1, 0.3294118, 1,
-0.2684708, 0.3410368, -1.89838, 0, 1, 0.3333333, 1,
-0.2663311, 0.6058381, -1.394526, 0, 1, 0.3411765, 1,
-0.2630036, -1.123792, -3.653595, 0, 1, 0.345098, 1,
-0.2597159, -0.485424, -4.200163, 0, 1, 0.3529412, 1,
-0.2596768, -1.345195, -2.33188, 0, 1, 0.3568628, 1,
-0.2572719, 2.414526, -0.727571, 0, 1, 0.3647059, 1,
-0.2544748, -1.905037, -2.268282, 0, 1, 0.3686275, 1,
-0.2400373, -0.2720121, -1.695732, 0, 1, 0.3764706, 1,
-0.2284733, -1.191378, -2.861031, 0, 1, 0.3803922, 1,
-0.2269564, 0.235879, -1.642107, 0, 1, 0.3882353, 1,
-0.2213307, -0.3557837, -2.456654, 0, 1, 0.3921569, 1,
-0.2206922, -1.011944, -2.951298, 0, 1, 0.4, 1,
-0.2196265, 0.741844, 0.3359668, 0, 1, 0.4078431, 1,
-0.2162966, 1.37305, -0.5902293, 0, 1, 0.4117647, 1,
-0.2142881, -1.61573, -4.364017, 0, 1, 0.4196078, 1,
-0.2140336, -0.5581871, -2.050892, 0, 1, 0.4235294, 1,
-0.2020861, -1.143741, -2.938238, 0, 1, 0.4313726, 1,
-0.2000484, 0.6851181, -0.8516718, 0, 1, 0.4352941, 1,
-0.1988881, 1.340058, -0.1371656, 0, 1, 0.4431373, 1,
-0.1985396, -0.8243698, -3.989098, 0, 1, 0.4470588, 1,
-0.19425, -0.4490817, -4.229332, 0, 1, 0.454902, 1,
-0.1908853, -0.169604, -3.058029, 0, 1, 0.4588235, 1,
-0.1902162, 1.151199, 0.4041082, 0, 1, 0.4666667, 1,
-0.1892207, -0.1086344, -0.9667112, 0, 1, 0.4705882, 1,
-0.186497, -1.53869, -4.211699, 0, 1, 0.4784314, 1,
-0.1854306, 0.9073827, -1.257957, 0, 1, 0.4823529, 1,
-0.1849951, 0.03188245, -1.142115, 0, 1, 0.4901961, 1,
-0.183285, 0.6624091, -0.1481216, 0, 1, 0.4941176, 1,
-0.1796055, -0.5986488, -3.022272, 0, 1, 0.5019608, 1,
-0.1792785, -0.4766927, -4.351838, 0, 1, 0.509804, 1,
-0.1782741, 0.3119407, 1.0595, 0, 1, 0.5137255, 1,
-0.1724125, -0.4767225, -1.120501, 0, 1, 0.5215687, 1,
-0.1722287, 0.1378193, -1.149902, 0, 1, 0.5254902, 1,
-0.1639386, -1.705254, -3.334491, 0, 1, 0.5333334, 1,
-0.1628662, 0.003190433, -1.542789, 0, 1, 0.5372549, 1,
-0.1609048, 0.7132425, 1.407724, 0, 1, 0.5450981, 1,
-0.1555217, -1.220915, -4.040089, 0, 1, 0.5490196, 1,
-0.1553407, -1.14142, -4.015737, 0, 1, 0.5568628, 1,
-0.1505436, 3.34436, 0.7168829, 0, 1, 0.5607843, 1,
-0.1488382, -0.9807449, -2.862811, 0, 1, 0.5686275, 1,
-0.1423978, 0.9202179, 0.0112167, 0, 1, 0.572549, 1,
-0.1400129, 1.009345, 0.0432559, 0, 1, 0.5803922, 1,
-0.1396813, -0.0176493, -2.774446, 0, 1, 0.5843138, 1,
-0.1386183, -1.32948, -2.476832, 0, 1, 0.5921569, 1,
-0.1371938, 0.223723, 0.1911922, 0, 1, 0.5960785, 1,
-0.1308395, 0.3671317, 0.3894735, 0, 1, 0.6039216, 1,
-0.1304187, -2.532901, -2.65344, 0, 1, 0.6117647, 1,
-0.1303897, 1.263753, 0.932745, 0, 1, 0.6156863, 1,
-0.1291711, -1.091477, -3.055374, 0, 1, 0.6235294, 1,
-0.1260464, 0.2219508, -1.025339, 0, 1, 0.627451, 1,
-0.124628, -0.3977434, -3.201035, 0, 1, 0.6352941, 1,
-0.1234289, 0.2574172, -0.8779541, 0, 1, 0.6392157, 1,
-0.1207965, 0.7969667, -0.2325529, 0, 1, 0.6470588, 1,
-0.1188943, 1.595117, -0.2938383, 0, 1, 0.6509804, 1,
-0.1178193, -1.276171, -2.389723, 0, 1, 0.6588235, 1,
-0.115767, -1.313305, -5.286704, 0, 1, 0.6627451, 1,
-0.1151255, -0.3271064, -3.121773, 0, 1, 0.6705883, 1,
-0.1141522, -0.3936937, -3.754534, 0, 1, 0.6745098, 1,
-0.1132302, 1.79643, 0.485556, 0, 1, 0.682353, 1,
-0.1081728, -0.1921832, -2.573489, 0, 1, 0.6862745, 1,
-0.1081695, -0.190923, -2.31939, 0, 1, 0.6941177, 1,
-0.1081399, -1.289542, -4.935124, 0, 1, 0.7019608, 1,
-0.1065588, -0.6942857, -3.546462, 0, 1, 0.7058824, 1,
-0.1049611, 1.023971, -0.2114996, 0, 1, 0.7137255, 1,
-0.1021354, 1.258053, -0.8316845, 0, 1, 0.7176471, 1,
-0.1008625, -0.03162888, -1.103883, 0, 1, 0.7254902, 1,
-0.1001915, -1.234528, -4.066559, 0, 1, 0.7294118, 1,
-0.09956841, -1.016513, -3.732842, 0, 1, 0.7372549, 1,
-0.09948732, 0.371561, -1.223058, 0, 1, 0.7411765, 1,
-0.09761647, 0.198684, 0.2078874, 0, 1, 0.7490196, 1,
-0.09754107, -1.136502, -2.044971, 0, 1, 0.7529412, 1,
-0.09484342, -0.2154215, -1.669423, 0, 1, 0.7607843, 1,
-0.09237827, -1.53228, -2.584337, 0, 1, 0.7647059, 1,
-0.08599117, 1.241492, 1.294675, 0, 1, 0.772549, 1,
-0.08405521, 0.7591995, -0.4538427, 0, 1, 0.7764706, 1,
-0.08338493, 0.7777473, -0.3064159, 0, 1, 0.7843137, 1,
-0.08314612, 0.4092044, -0.1699082, 0, 1, 0.7882353, 1,
-0.0817292, 0.5310493, 0.1728496, 0, 1, 0.7960784, 1,
-0.08039264, 1.24777, 0.1031495, 0, 1, 0.8039216, 1,
-0.07342643, 0.1340645, -0.2074924, 0, 1, 0.8078431, 1,
-0.07205137, 0.7219931, 0.1810844, 0, 1, 0.8156863, 1,
-0.07140241, -0.689355, -3.04276, 0, 1, 0.8196079, 1,
-0.06758377, -0.1356546, -4.216735, 0, 1, 0.827451, 1,
-0.06209962, -0.5651463, -2.711169, 0, 1, 0.8313726, 1,
-0.06151255, 0.5835524, 0.5445047, 0, 1, 0.8392157, 1,
-0.05833358, -2.23825, -2.63611, 0, 1, 0.8431373, 1,
-0.05804073, 0.4843886, 1.170389, 0, 1, 0.8509804, 1,
-0.05051519, 0.98083, 0.3214645, 0, 1, 0.854902, 1,
-0.04645767, 0.03383322, -1.51123, 0, 1, 0.8627451, 1,
-0.04247329, -0.386469, -3.767059, 0, 1, 0.8666667, 1,
-0.04223161, -0.4022802, -2.29406, 0, 1, 0.8745098, 1,
-0.0362679, -1.056221, -2.262845, 0, 1, 0.8784314, 1,
-0.03519775, -0.5775344, -1.540934, 0, 1, 0.8862745, 1,
-0.03154189, 1.573119, -0.6911973, 0, 1, 0.8901961, 1,
-0.02978322, -0.9031063, -3.730283, 0, 1, 0.8980392, 1,
-0.02599264, -0.943031, -3.86412, 0, 1, 0.9058824, 1,
-0.01850612, -0.7755358, -4.652139, 0, 1, 0.9098039, 1,
-0.01808235, 1.338524, 0.01030049, 0, 1, 0.9176471, 1,
-0.01541439, -0.8174136, -2.351299, 0, 1, 0.9215686, 1,
-0.01491838, 0.06352606, 0.2190179, 0, 1, 0.9294118, 1,
-0.01385824, -1.125975, -2.25996, 0, 1, 0.9333333, 1,
-0.01015454, 0.2607601, -0.579747, 0, 1, 0.9411765, 1,
-0.007138499, -0.9448627, -3.150562, 0, 1, 0.945098, 1,
-0.00601751, -0.7549585, -1.825318, 0, 1, 0.9529412, 1,
-0.005843596, -0.79418, -3.459055, 0, 1, 0.9568627, 1,
-0.000664219, 0.9369518, 0.2674854, 0, 1, 0.9647059, 1,
-0.000246073, -1.706812, -2.433665, 0, 1, 0.9686275, 1,
0.0001601099, 0.3365801, -0.1423154, 0, 1, 0.9764706, 1,
0.0008275336, 1.913809, -0.7669544, 0, 1, 0.9803922, 1,
0.001433694, -0.2970427, 3.320212, 0, 1, 0.9882353, 1,
0.003748547, -0.2640626, 2.336176, 0, 1, 0.9921569, 1,
0.005750551, -0.07956102, 2.993165, 0, 1, 1, 1,
0.006040503, 0.1269952, 0.9996688, 0, 0.9921569, 1, 1,
0.007951492, -0.5875133, 3.857832, 0, 0.9882353, 1, 1,
0.01126263, -0.6086117, 4.475252, 0, 0.9803922, 1, 1,
0.0130102, 0.315814, -0.1708812, 0, 0.9764706, 1, 1,
0.01921384, 1.615842, 0.8377951, 0, 0.9686275, 1, 1,
0.01928035, 0.906683, -0.7516364, 0, 0.9647059, 1, 1,
0.02443969, 0.4296671, 0.57298, 0, 0.9568627, 1, 1,
0.02887976, -0.05022222, 2.752755, 0, 0.9529412, 1, 1,
0.03645539, -0.4613949, 0.3881854, 0, 0.945098, 1, 1,
0.0372776, 0.7607299, -0.9295678, 0, 0.9411765, 1, 1,
0.04133005, -0.9450579, 3.187066, 0, 0.9333333, 1, 1,
0.04255857, 1.627915, 2.080156, 0, 0.9294118, 1, 1,
0.04322221, 0.8374725, -0.5242729, 0, 0.9215686, 1, 1,
0.04815917, 0.6636037, 1.187039, 0, 0.9176471, 1, 1,
0.05000102, -0.1563913, 2.684273, 0, 0.9098039, 1, 1,
0.05748154, 0.2053463, 0.2612517, 0, 0.9058824, 1, 1,
0.05808164, 1.385447, 0.8482326, 0, 0.8980392, 1, 1,
0.05850154, -0.9052071, 5.362109, 0, 0.8901961, 1, 1,
0.05951752, 0.6310528, 1.049601, 0, 0.8862745, 1, 1,
0.06226851, -0.1716584, 1.469644, 0, 0.8784314, 1, 1,
0.06956409, 0.3137386, -1.796559, 0, 0.8745098, 1, 1,
0.07181761, -0.3191983, 2.344622, 0, 0.8666667, 1, 1,
0.07194486, -0.5065274, 4.819232, 0, 0.8627451, 1, 1,
0.07201002, 1.022889, 0.2159547, 0, 0.854902, 1, 1,
0.07301114, 0.5639353, 0.9338832, 0, 0.8509804, 1, 1,
0.07500964, 0.2753197, 1.25953, 0, 0.8431373, 1, 1,
0.08030925, -0.659744, 2.289098, 0, 0.8392157, 1, 1,
0.08189277, 1.244017, -0.2056656, 0, 0.8313726, 1, 1,
0.0832134, -0.8599325, 4.571592, 0, 0.827451, 1, 1,
0.08528958, 0.7792422, 1.645698, 0, 0.8196079, 1, 1,
0.08529767, 0.02102911, 2.112099, 0, 0.8156863, 1, 1,
0.08573831, -0.4292387, 3.977155, 0, 0.8078431, 1, 1,
0.09274717, 0.4574307, 3.412771, 0, 0.8039216, 1, 1,
0.0938189, -1.687005, 1.060784, 0, 0.7960784, 1, 1,
0.0941745, -0.02642852, 1.612374, 0, 0.7882353, 1, 1,
0.10081, 0.7647361, -0.001808122, 0, 0.7843137, 1, 1,
0.1010667, -1.38226, 2.078048, 0, 0.7764706, 1, 1,
0.1024292, 0.1439903, 0.5851457, 0, 0.772549, 1, 1,
0.1030691, -0.4182159, 1.645419, 0, 0.7647059, 1, 1,
0.1053591, 0.7657825, -1.88841, 0, 0.7607843, 1, 1,
0.1143841, -0.9410414, 3.034347, 0, 0.7529412, 1, 1,
0.1160518, -0.04417074, 0.8714662, 0, 0.7490196, 1, 1,
0.1161384, -0.6285139, 2.64573, 0, 0.7411765, 1, 1,
0.1193347, -0.2687742, 2.682461, 0, 0.7372549, 1, 1,
0.1213995, -1.911414, 3.693939, 0, 0.7294118, 1, 1,
0.1266704, 1.55727, 1.19339, 0, 0.7254902, 1, 1,
0.1273297, 0.1874894, 1.705457, 0, 0.7176471, 1, 1,
0.1299671, -1.561085, 4.348808, 0, 0.7137255, 1, 1,
0.1352581, -0.6883538, 1.923585, 0, 0.7058824, 1, 1,
0.1357143, 0.2102586, -0.7898994, 0, 0.6980392, 1, 1,
0.1358519, 0.5475652, -0.5791637, 0, 0.6941177, 1, 1,
0.1366943, -1.101231, 2.37885, 0, 0.6862745, 1, 1,
0.1374836, 0.9134759, -0.6477886, 0, 0.682353, 1, 1,
0.1444902, 1.363474, 2.268848, 0, 0.6745098, 1, 1,
0.1464299, 0.4669831, 0.8463016, 0, 0.6705883, 1, 1,
0.14839, -0.2519509, 2.382708, 0, 0.6627451, 1, 1,
0.1492929, -0.4374174, 3.780467, 0, 0.6588235, 1, 1,
0.1523416, 0.1235841, 1.129577, 0, 0.6509804, 1, 1,
0.1524687, 3.226153, 0.300932, 0, 0.6470588, 1, 1,
0.1527517, -0.1509491, 2.631134, 0, 0.6392157, 1, 1,
0.1532113, -1.239539, 3.710169, 0, 0.6352941, 1, 1,
0.1602933, -0.06885881, 1.573943, 0, 0.627451, 1, 1,
0.1622759, -2.071469, 3.560607, 0, 0.6235294, 1, 1,
0.1636051, -0.3524516, 2.998315, 0, 0.6156863, 1, 1,
0.1652186, -1.660643, 4.130927, 0, 0.6117647, 1, 1,
0.1670964, 0.9946668, 0.4078678, 0, 0.6039216, 1, 1,
0.1681268, -1.70627, 3.955185, 0, 0.5960785, 1, 1,
0.1682222, 0.9942155, 2.459529, 0, 0.5921569, 1, 1,
0.1683928, 0.439466, -0.04344606, 0, 0.5843138, 1, 1,
0.1693358, 0.7701218, 0.4144846, 0, 0.5803922, 1, 1,
0.1706403, -0.07345005, 2.111588, 0, 0.572549, 1, 1,
0.1713482, -1.589383, 3.339719, 0, 0.5686275, 1, 1,
0.1760886, -0.0426129, 1.485582, 0, 0.5607843, 1, 1,
0.178091, 2.250174, 0.3869432, 0, 0.5568628, 1, 1,
0.181479, 0.1202858, 1.344959, 0, 0.5490196, 1, 1,
0.1821458, -0.09815011, 3.740313, 0, 0.5450981, 1, 1,
0.183023, -0.1039483, 2.59491, 0, 0.5372549, 1, 1,
0.1873117, -1.611498, 4.891691, 0, 0.5333334, 1, 1,
0.1896129, 0.01967178, 1.478317, 0, 0.5254902, 1, 1,
0.1908032, -0.6591227, 2.810327, 0, 0.5215687, 1, 1,
0.1927945, -1.147495, 2.152081, 0, 0.5137255, 1, 1,
0.1950525, 0.003619296, -0.4434238, 0, 0.509804, 1, 1,
0.2026528, -0.2019525, 3.368078, 0, 0.5019608, 1, 1,
0.2028032, -1.200339, 3.435232, 0, 0.4941176, 1, 1,
0.205043, 0.5297077, -0.9803337, 0, 0.4901961, 1, 1,
0.2119182, 1.198099, -0.4529858, 0, 0.4823529, 1, 1,
0.214895, 0.4423445, 1.071226, 0, 0.4784314, 1, 1,
0.2161164, -0.8169903, 0.6947052, 0, 0.4705882, 1, 1,
0.218215, 1.299609, 1.760055, 0, 0.4666667, 1, 1,
0.2209687, -0.2294087, 0.4763156, 0, 0.4588235, 1, 1,
0.223393, 0.7815747, -1.240019, 0, 0.454902, 1, 1,
0.2258839, -2.758215, 3.444453, 0, 0.4470588, 1, 1,
0.2268039, -1.616602, 2.644596, 0, 0.4431373, 1, 1,
0.2268377, -0.3527768, 0.9018315, 0, 0.4352941, 1, 1,
0.2342778, 0.6908891, 0.3824922, 0, 0.4313726, 1, 1,
0.2353149, 1.508001, -0.4181643, 0, 0.4235294, 1, 1,
0.2358024, -0.09479242, 0.7780799, 0, 0.4196078, 1, 1,
0.2481912, 0.2516674, -0.6527922, 0, 0.4117647, 1, 1,
0.2541735, -0.6614355, 4.60879, 0, 0.4078431, 1, 1,
0.2542949, 0.1671724, 1.287663, 0, 0.4, 1, 1,
0.2548186, -1.418145, 1.69975, 0, 0.3921569, 1, 1,
0.2579197, -1.11886, 2.265968, 0, 0.3882353, 1, 1,
0.2582094, -0.5906849, 1.91384, 0, 0.3803922, 1, 1,
0.2588014, 0.1446021, 0.6629343, 0, 0.3764706, 1, 1,
0.2659472, 1.483455, 0.3697115, 0, 0.3686275, 1, 1,
0.2671149, 0.566856, 0.8486668, 0, 0.3647059, 1, 1,
0.2685986, -0.6486737, 2.846043, 0, 0.3568628, 1, 1,
0.2763888, -0.3942985, 2.406224, 0, 0.3529412, 1, 1,
0.2779218, -0.6774986, 2.801167, 0, 0.345098, 1, 1,
0.2779767, -0.2735168, 1.403198, 0, 0.3411765, 1, 1,
0.2810068, 0.6363766, 1.012377, 0, 0.3333333, 1, 1,
0.2810432, -2.11151, 3.012837, 0, 0.3294118, 1, 1,
0.2849044, 0.1947102, 0.4259815, 0, 0.3215686, 1, 1,
0.2861734, 0.1672945, 0.1064888, 0, 0.3176471, 1, 1,
0.2912982, -0.6295554, 1.695293, 0, 0.3098039, 1, 1,
0.2958369, 1.332484, -1.527347, 0, 0.3058824, 1, 1,
0.2969824, -0.6808085, 3.489225, 0, 0.2980392, 1, 1,
0.3004579, 0.7154178, 1.198838, 0, 0.2901961, 1, 1,
0.3013482, -0.2160438, 1.957134, 0, 0.2862745, 1, 1,
0.3015831, -0.4490417, 3.326482, 0, 0.2784314, 1, 1,
0.305112, 1.156146, 0.6724146, 0, 0.2745098, 1, 1,
0.3054813, 0.6889961, -0.7477606, 0, 0.2666667, 1, 1,
0.3167488, -0.613426, 4.327607, 0, 0.2627451, 1, 1,
0.3203269, -1.442623, 4.414837, 0, 0.254902, 1, 1,
0.3238988, -0.597712, 2.218751, 0, 0.2509804, 1, 1,
0.328207, -0.3275619, 1.807879, 0, 0.2431373, 1, 1,
0.3284986, -0.1605794, 1.783293, 0, 0.2392157, 1, 1,
0.3291457, 1.444019, 1.478219, 0, 0.2313726, 1, 1,
0.3294567, 0.238199, 1.707535, 0, 0.227451, 1, 1,
0.3306127, 0.3138483, 0.912608, 0, 0.2196078, 1, 1,
0.3376322, 0.7042757, 0.8490578, 0, 0.2156863, 1, 1,
0.3390691, -0.8853705, 3.272584, 0, 0.2078431, 1, 1,
0.3391592, -0.8946708, 3.426482, 0, 0.2039216, 1, 1,
0.3403787, 0.8753286, 0.6272698, 0, 0.1960784, 1, 1,
0.3408729, -0.03959617, 3.300122, 0, 0.1882353, 1, 1,
0.341753, 0.1024669, 3.398638, 0, 0.1843137, 1, 1,
0.3423592, 0.7491145, 0.4195691, 0, 0.1764706, 1, 1,
0.3428403, 0.3074255, 1.307764, 0, 0.172549, 1, 1,
0.3444364, 0.5596958, 0.4748802, 0, 0.1647059, 1, 1,
0.3457032, -0.2347838, 2.440213, 0, 0.1607843, 1, 1,
0.3471746, 0.4555404, 0.1824174, 0, 0.1529412, 1, 1,
0.3483691, -0.2716322, 3.156971, 0, 0.1490196, 1, 1,
0.3495021, -0.7963809, 3.641132, 0, 0.1411765, 1, 1,
0.3495821, 0.9437075, 0.5185313, 0, 0.1372549, 1, 1,
0.3531004, 0.1572907, 2.478278, 0, 0.1294118, 1, 1,
0.3549999, -0.3327448, 2.837006, 0, 0.1254902, 1, 1,
0.3550614, 0.5856899, 0.009290421, 0, 0.1176471, 1, 1,
0.3560168, -1.244242, 3.725674, 0, 0.1137255, 1, 1,
0.3606465, -0.3331161, 3.436429, 0, 0.1058824, 1, 1,
0.3623165, 0.6646985, 1.213246, 0, 0.09803922, 1, 1,
0.3636499, -0.7236241, 0.89764, 0, 0.09411765, 1, 1,
0.3647327, 0.09690126, 2.606379, 0, 0.08627451, 1, 1,
0.3673373, 1.001767, -1.641232, 0, 0.08235294, 1, 1,
0.3787111, 2.014092, 1.034672, 0, 0.07450981, 1, 1,
0.3796417, 0.5168738, 1.358176, 0, 0.07058824, 1, 1,
0.3818884, -0.4521216, 1.727788, 0, 0.0627451, 1, 1,
0.3831721, 0.7886685, -0.06099622, 0, 0.05882353, 1, 1,
0.3842413, 0.04817891, 3.23482, 0, 0.05098039, 1, 1,
0.3901094, -0.9482779, 2.14511, 0, 0.04705882, 1, 1,
0.3907963, -1.69932, 3.517223, 0, 0.03921569, 1, 1,
0.3941706, 1.228967, -0.5688833, 0, 0.03529412, 1, 1,
0.3947545, -0.3861631, 1.77844, 0, 0.02745098, 1, 1,
0.3973881, 0.1634625, 1.95985, 0, 0.02352941, 1, 1,
0.4014383, -0.4008153, 1.936466, 0, 0.01568628, 1, 1,
0.4070634, 0.2896269, 0.6921223, 0, 0.01176471, 1, 1,
0.4079291, -0.1301225, 0.194865, 0, 0.003921569, 1, 1,
0.4093109, 0.1542022, 2.57579, 0.003921569, 0, 1, 1,
0.4150828, 0.2511872, 0.6283854, 0.007843138, 0, 1, 1,
0.4189151, -0.3052156, 4.239153, 0.01568628, 0, 1, 1,
0.4292835, 0.7786952, -0.9765631, 0.01960784, 0, 1, 1,
0.4307465, -0.5281513, 3.135798, 0.02745098, 0, 1, 1,
0.4311172, 2.553656, 0.958485, 0.03137255, 0, 1, 1,
0.4326068, 0.3001493, 1.149406, 0.03921569, 0, 1, 1,
0.4362447, -1.190764, 1.147699, 0.04313726, 0, 1, 1,
0.4383048, -0.5935862, 3.016778, 0.05098039, 0, 1, 1,
0.4413351, -0.222719, 2.335483, 0.05490196, 0, 1, 1,
0.4419899, 0.3917929, 0.9898218, 0.0627451, 0, 1, 1,
0.4423317, -0.7013383, 2.364498, 0.06666667, 0, 1, 1,
0.4559166, -0.8715403, 2.792369, 0.07450981, 0, 1, 1,
0.4605012, -1.527732, 1.276739, 0.07843138, 0, 1, 1,
0.461588, -1.005772, 3.014635, 0.08627451, 0, 1, 1,
0.4627745, -0.7063682, 3.584189, 0.09019608, 0, 1, 1,
0.4676175, -0.4785593, 0.4868595, 0.09803922, 0, 1, 1,
0.4684164, 0.7607979, 1.249844, 0.1058824, 0, 1, 1,
0.4729377, -0.9495115, 4.743834, 0.1098039, 0, 1, 1,
0.4746125, 0.9932746, 0.1833593, 0.1176471, 0, 1, 1,
0.4763474, -2.337004, 3.000335, 0.1215686, 0, 1, 1,
0.4768859, -2.553442, 3.537897, 0.1294118, 0, 1, 1,
0.496551, 0.135367, 1.832795, 0.1333333, 0, 1, 1,
0.5040343, 0.3512365, 0.01359047, 0.1411765, 0, 1, 1,
0.5079293, -0.7142914, 1.733545, 0.145098, 0, 1, 1,
0.5134506, 0.6512637, 1.294921, 0.1529412, 0, 1, 1,
0.5199834, -1.244405, 3.98482, 0.1568628, 0, 1, 1,
0.5242252, -0.5797141, 1.123941, 0.1647059, 0, 1, 1,
0.5276332, -0.6573327, 3.616472, 0.1686275, 0, 1, 1,
0.5297517, 1.112716, -0.1098559, 0.1764706, 0, 1, 1,
0.53009, 0.1319118, 0.7227868, 0.1803922, 0, 1, 1,
0.5380915, 1.141881, 0.241354, 0.1882353, 0, 1, 1,
0.5391439, 0.8240257, 1.450631, 0.1921569, 0, 1, 1,
0.5472106, 0.6771717, 0.1723519, 0.2, 0, 1, 1,
0.547832, -1.033142, 3.86044, 0.2078431, 0, 1, 1,
0.5486786, -0.03491658, 0.2529444, 0.2117647, 0, 1, 1,
0.5517188, -1.795704, 2.476969, 0.2196078, 0, 1, 1,
0.5524563, 1.029067, -0.173587, 0.2235294, 0, 1, 1,
0.5533774, -0.4339492, 1.272505, 0.2313726, 0, 1, 1,
0.5539954, -0.3281332, 1.513695, 0.2352941, 0, 1, 1,
0.5543628, -1.079152, 3.13319, 0.2431373, 0, 1, 1,
0.5563577, 1.877763, -1.260023, 0.2470588, 0, 1, 1,
0.5574566, -0.3490352, -0.0246359, 0.254902, 0, 1, 1,
0.5591272, -0.1082824, 1.761906, 0.2588235, 0, 1, 1,
0.5670027, -0.2612805, 2.01609, 0.2666667, 0, 1, 1,
0.5677202, -1.235274, 2.675258, 0.2705882, 0, 1, 1,
0.5689263, -0.791644, 2.216921, 0.2784314, 0, 1, 1,
0.5703558, 0.5331444, 2.163343, 0.282353, 0, 1, 1,
0.5726088, -0.9317932, 3.196412, 0.2901961, 0, 1, 1,
0.5726951, -1.103265, 1.726722, 0.2941177, 0, 1, 1,
0.572754, 1.826433, -0.7795252, 0.3019608, 0, 1, 1,
0.5734112, -1.402912, 2.453372, 0.3098039, 0, 1, 1,
0.5764109, 0.1787804, 1.44238, 0.3137255, 0, 1, 1,
0.57675, -0.05786262, 2.572279, 0.3215686, 0, 1, 1,
0.5772003, 0.1177956, 0.6020913, 0.3254902, 0, 1, 1,
0.5781195, -0.4951043, 2.242064, 0.3333333, 0, 1, 1,
0.5787686, -0.3739131, 1.370271, 0.3372549, 0, 1, 1,
0.5820006, -0.3768863, 2.1437, 0.345098, 0, 1, 1,
0.582826, -1.186233, 1.918119, 0.3490196, 0, 1, 1,
0.58567, -0.4669138, 3.498703, 0.3568628, 0, 1, 1,
0.5881746, -0.7787483, 2.229002, 0.3607843, 0, 1, 1,
0.58864, 0.09564909, 1.675863, 0.3686275, 0, 1, 1,
0.5897088, -0.07366324, 2.084363, 0.372549, 0, 1, 1,
0.5907386, 0.1735855, 0.9424887, 0.3803922, 0, 1, 1,
0.594712, 1.580806, -0.9012899, 0.3843137, 0, 1, 1,
0.5995839, -0.9363959, 3.349868, 0.3921569, 0, 1, 1,
0.5997357, 0.3684389, 1.565891, 0.3960784, 0, 1, 1,
0.605534, 0.03804349, 2.537557, 0.4039216, 0, 1, 1,
0.6154285, 0.2272618, 1.622344, 0.4117647, 0, 1, 1,
0.6172416, 1.010842, 1.128131, 0.4156863, 0, 1, 1,
0.6184036, 0.09663941, 1.556283, 0.4235294, 0, 1, 1,
0.6223491, 0.4901281, 0.3884209, 0.427451, 0, 1, 1,
0.6252114, 0.8512296, 1.096724, 0.4352941, 0, 1, 1,
0.6262789, -0.7933092, 2.401114, 0.4392157, 0, 1, 1,
0.6428573, 0.7536862, 0.5081435, 0.4470588, 0, 1, 1,
0.6451873, 0.3398187, 0.9123036, 0.4509804, 0, 1, 1,
0.6456017, 1.362594, 0.8985299, 0.4588235, 0, 1, 1,
0.6463327, -0.5570633, 3.335643, 0.4627451, 0, 1, 1,
0.6506439, 1.838094, -0.05836768, 0.4705882, 0, 1, 1,
0.6510478, 0.07464628, 2.221213, 0.4745098, 0, 1, 1,
0.6522496, 0.5103808, 0.2732783, 0.4823529, 0, 1, 1,
0.6603631, -0.3700111, 3.199767, 0.4862745, 0, 1, 1,
0.661755, -0.6505848, 1.991869, 0.4941176, 0, 1, 1,
0.6632078, 0.8704602, 1.578589, 0.5019608, 0, 1, 1,
0.6714733, -1.10716, 4.461024, 0.5058824, 0, 1, 1,
0.675578, 1.09552, -0.2358708, 0.5137255, 0, 1, 1,
0.6765278, 0.2758592, 3.07189, 0.5176471, 0, 1, 1,
0.6807971, 0.07808574, 1.387527, 0.5254902, 0, 1, 1,
0.6927194, 0.2647812, 1.350791, 0.5294118, 0, 1, 1,
0.6953541, -1.243706, 3.696267, 0.5372549, 0, 1, 1,
0.6961712, -3.005468, 3.339146, 0.5411765, 0, 1, 1,
0.7013129, -0.8935194, 2.720116, 0.5490196, 0, 1, 1,
0.7055123, 0.8242396, 0.6814119, 0.5529412, 0, 1, 1,
0.7078655, 0.5029868, 0.9004447, 0.5607843, 0, 1, 1,
0.7091398, -0.3775477, 0.7135593, 0.5647059, 0, 1, 1,
0.7173707, 0.2849575, 1.5007, 0.572549, 0, 1, 1,
0.718256, -1.895465, 2.286573, 0.5764706, 0, 1, 1,
0.7184133, -0.3804262, 3.102782, 0.5843138, 0, 1, 1,
0.7190686, -0.9223265, 3.430011, 0.5882353, 0, 1, 1,
0.7235694, -0.2920663, 2.598733, 0.5960785, 0, 1, 1,
0.7286046, 1.028469, 0.7783571, 0.6039216, 0, 1, 1,
0.731199, -0.6045482, 1.892961, 0.6078432, 0, 1, 1,
0.7346985, -2.69573, -0.171172, 0.6156863, 0, 1, 1,
0.7382166, 1.067263, 0.4049797, 0.6196079, 0, 1, 1,
0.739678, 0.5093446, -0.2940144, 0.627451, 0, 1, 1,
0.7430746, -0.6394525, 0.709992, 0.6313726, 0, 1, 1,
0.7452254, 0.7421634, 1.425091, 0.6392157, 0, 1, 1,
0.7455942, -0.6714446, 2.191816, 0.6431373, 0, 1, 1,
0.7478609, 0.04317271, 2.365857, 0.6509804, 0, 1, 1,
0.7530787, 0.5795345, 0.3583772, 0.654902, 0, 1, 1,
0.7571587, -0.09429371, 1.233733, 0.6627451, 0, 1, 1,
0.7573488, 0.6006855, 1.611612, 0.6666667, 0, 1, 1,
0.7597045, -0.2462442, 2.636451, 0.6745098, 0, 1, 1,
0.7610787, -0.9271474, 2.592437, 0.6784314, 0, 1, 1,
0.7644086, -1.13008, 2.684036, 0.6862745, 0, 1, 1,
0.7652441, -0.3766974, 2.904804, 0.6901961, 0, 1, 1,
0.7662779, -0.1658209, 0.933874, 0.6980392, 0, 1, 1,
0.770096, -0.9548676, 3.127719, 0.7058824, 0, 1, 1,
0.7747557, -0.1313226, 2.342606, 0.7098039, 0, 1, 1,
0.7817358, 0.3340414, 0.3756374, 0.7176471, 0, 1, 1,
0.7849584, 0.3901631, 0.8596669, 0.7215686, 0, 1, 1,
0.7880396, 0.5730807, 0.4334137, 0.7294118, 0, 1, 1,
0.7883945, -0.05417308, 2.678643, 0.7333333, 0, 1, 1,
0.789858, -0.2091642, 2.138167, 0.7411765, 0, 1, 1,
0.7955245, -0.4545114, 1.764276, 0.7450981, 0, 1, 1,
0.7961405, -0.6111835, 1.310672, 0.7529412, 0, 1, 1,
0.7969161, -0.1335602, 0.6185316, 0.7568628, 0, 1, 1,
0.7971799, 0.07631843, 2.126684, 0.7647059, 0, 1, 1,
0.7988727, -0.7796963, 2.027691, 0.7686275, 0, 1, 1,
0.798972, 0.1674637, 0.9945072, 0.7764706, 0, 1, 1,
0.8054051, 2.516627, 1.007557, 0.7803922, 0, 1, 1,
0.8054157, 0.08852635, -0.07902633, 0.7882353, 0, 1, 1,
0.8078063, -0.2873287, 2.915349, 0.7921569, 0, 1, 1,
0.8086742, -0.6807286, 1.537987, 0.8, 0, 1, 1,
0.8093382, -0.2146005, 1.437967, 0.8078431, 0, 1, 1,
0.8094141, 0.01130694, 2.147402, 0.8117647, 0, 1, 1,
0.8125776, 2.059809, 1.764756, 0.8196079, 0, 1, 1,
0.8147858, -1.531437, 3.430158, 0.8235294, 0, 1, 1,
0.8148254, -0.2073574, 2.49634, 0.8313726, 0, 1, 1,
0.8164721, -0.8888473, 4.173807, 0.8352941, 0, 1, 1,
0.8198392, -0.05426333, 1.38223, 0.8431373, 0, 1, 1,
0.8219597, 0.009068266, 3.101524, 0.8470588, 0, 1, 1,
0.8240817, -0.02819848, 2.175124, 0.854902, 0, 1, 1,
0.8253327, -0.7758633, 1.99702, 0.8588235, 0, 1, 1,
0.827795, -0.630961, 2.696308, 0.8666667, 0, 1, 1,
0.8337781, 0.7511283, 2.932971, 0.8705882, 0, 1, 1,
0.8343781, -0.3950433, 0.6435887, 0.8784314, 0, 1, 1,
0.8347672, -0.3053588, 2.756825, 0.8823529, 0, 1, 1,
0.8356897, -0.2762662, 1.949572, 0.8901961, 0, 1, 1,
0.8367252, 0.709004, 0.409092, 0.8941177, 0, 1, 1,
0.8452195, -0.7211574, 4.128614, 0.9019608, 0, 1, 1,
0.8461838, -0.8789243, 3.988916, 0.9098039, 0, 1, 1,
0.8510019, 0.6112646, 2.84891, 0.9137255, 0, 1, 1,
0.8525812, 0.5870031, -0.3207348, 0.9215686, 0, 1, 1,
0.8536108, -0.2066472, 1.399571, 0.9254902, 0, 1, 1,
0.8546272, -0.671984, 2.601595, 0.9333333, 0, 1, 1,
0.8644403, -1.042027, 2.17287, 0.9372549, 0, 1, 1,
0.8689393, -0.2476246, 1.171654, 0.945098, 0, 1, 1,
0.8771929, -0.1352363, 1.945089, 0.9490196, 0, 1, 1,
0.879029, -0.001362828, 3.02454, 0.9568627, 0, 1, 1,
0.8907042, 0.8872979, 1.552563, 0.9607843, 0, 1, 1,
0.8996037, 0.6459683, 2.26249, 0.9686275, 0, 1, 1,
0.9025037, 0.6019911, 1.406512, 0.972549, 0, 1, 1,
0.9069887, 1.146529, -0.1004488, 0.9803922, 0, 1, 1,
0.9160883, -0.9177241, 3.856291, 0.9843137, 0, 1, 1,
0.9186338, -1.113072, 3.944311, 0.9921569, 0, 1, 1,
0.9192454, 0.6038372, 2.641614, 0.9960784, 0, 1, 1,
0.9209129, 0.6648904, -0.07703267, 1, 0, 0.9960784, 1,
0.9253005, 1.464312, 2.004281, 1, 0, 0.9882353, 1,
0.9306976, 1.223426, 1.108106, 1, 0, 0.9843137, 1,
0.9344037, 0.1053667, 0.8951441, 1, 0, 0.9764706, 1,
0.9355646, -1.163394, 3.022516, 1, 0, 0.972549, 1,
0.941527, 0.5609402, 1.290171, 1, 0, 0.9647059, 1,
0.943276, -0.6469397, -0.07377069, 1, 0, 0.9607843, 1,
0.94367, -0.5851826, 1.21511, 1, 0, 0.9529412, 1,
0.95086, 1.602664, -1.603542, 1, 0, 0.9490196, 1,
0.9556367, -1.222903, 4.053709, 1, 0, 0.9411765, 1,
0.9558583, -0.8261051, 1.345448, 1, 0, 0.9372549, 1,
0.9558957, 1.383808, 0.2526748, 1, 0, 0.9294118, 1,
0.9560449, 2.871111, 1.806254, 1, 0, 0.9254902, 1,
0.9784126, 0.3713608, 1.275525, 1, 0, 0.9176471, 1,
0.9822314, 0.8756436, 0.3537511, 1, 0, 0.9137255, 1,
0.99879, -0.7718882, 3.491906, 1, 0, 0.9058824, 1,
1.006314, 1.319308, -0.6672446, 1, 0, 0.9019608, 1,
1.008926, -0.03694255, 0.4738339, 1, 0, 0.8941177, 1,
1.012513, 1.07059, 1.559027, 1, 0, 0.8862745, 1,
1.017053, -0.1355579, 2.888823, 1, 0, 0.8823529, 1,
1.01737, 1.264491, -0.1622885, 1, 0, 0.8745098, 1,
1.020877, 0.6794991, 0.2964608, 1, 0, 0.8705882, 1,
1.021307, 1.049093, 0.8013009, 1, 0, 0.8627451, 1,
1.029058, 0.3850136, 0.8278022, 1, 0, 0.8588235, 1,
1.030777, 0.8692935, -0.861037, 1, 0, 0.8509804, 1,
1.033154, -0.9486458, 3.946203, 1, 0, 0.8470588, 1,
1.039599, -0.5318333, 1.741196, 1, 0, 0.8392157, 1,
1.042477, -0.6669542, 4.050197, 1, 0, 0.8352941, 1,
1.058551, -0.9024217, 0.1242692, 1, 0, 0.827451, 1,
1.062636, 0.981259, 0.6060517, 1, 0, 0.8235294, 1,
1.062809, -0.7712631, 3.113448, 1, 0, 0.8156863, 1,
1.07043, -1.701743, 2.66864, 1, 0, 0.8117647, 1,
1.08509, 1.900465, 0.6334053, 1, 0, 0.8039216, 1,
1.085162, -0.2542513, 1.091955, 1, 0, 0.7960784, 1,
1.094253, -0.5629209, 3.177197, 1, 0, 0.7921569, 1,
1.099963, -0.2437516, 2.361176, 1, 0, 0.7843137, 1,
1.108989, 0.6860167, 0.5475711, 1, 0, 0.7803922, 1,
1.111873, -0.2075723, 0.5145893, 1, 0, 0.772549, 1,
1.115392, -0.4158442, 2.461154, 1, 0, 0.7686275, 1,
1.124018, -0.2816906, 0.8868878, 1, 0, 0.7607843, 1,
1.132737, -0.5614355, 3.811788, 1, 0, 0.7568628, 1,
1.141711, -0.1435566, 1.34149, 1, 0, 0.7490196, 1,
1.143331, 0.6469218, 2.120702, 1, 0, 0.7450981, 1,
1.144246, 0.3833204, 2.559722, 1, 0, 0.7372549, 1,
1.14655, -0.2520783, 0.8406339, 1, 0, 0.7333333, 1,
1.148149, -0.8103239, 0.7019612, 1, 0, 0.7254902, 1,
1.149667, 1.702312, 0.8039323, 1, 0, 0.7215686, 1,
1.152111, 0.8521115, 0.01345502, 1, 0, 0.7137255, 1,
1.172152, -0.4122398, 1.002594, 1, 0, 0.7098039, 1,
1.172438, -0.3800356, 1.157436, 1, 0, 0.7019608, 1,
1.173442, -0.1536013, 1.725131, 1, 0, 0.6941177, 1,
1.175764, -0.5216396, 0.6035882, 1, 0, 0.6901961, 1,
1.178198, 0.3582172, 1.795544, 1, 0, 0.682353, 1,
1.178822, -2.05269, 0.8060659, 1, 0, 0.6784314, 1,
1.17926, 0.4655784, -0.1008972, 1, 0, 0.6705883, 1,
1.182024, -2.034181, 1.40816, 1, 0, 0.6666667, 1,
1.185638, -1.167432, 1.879542, 1, 0, 0.6588235, 1,
1.18663, 1.615482, 0.06873588, 1, 0, 0.654902, 1,
1.187506, -0.0487887, 2.215531, 1, 0, 0.6470588, 1,
1.188804, 0.3358081, -1.231106, 1, 0, 0.6431373, 1,
1.195273, 0.5255571, 2.173454, 1, 0, 0.6352941, 1,
1.200846, -0.8142766, 1.570746, 1, 0, 0.6313726, 1,
1.207753, -1.069586, 2.004408, 1, 0, 0.6235294, 1,
1.215213, -0.03294986, 1.247288, 1, 0, 0.6196079, 1,
1.215276, -0.8731831, 0.7600567, 1, 0, 0.6117647, 1,
1.216353, -0.1303096, 2.354408, 1, 0, 0.6078432, 1,
1.220146, -1.53509, 2.647996, 1, 0, 0.6, 1,
1.225261, 2.10415, 1.232893, 1, 0, 0.5921569, 1,
1.230456, 0.6129232, 1.139129, 1, 0, 0.5882353, 1,
1.231584, 1.434493, 0.9864439, 1, 0, 0.5803922, 1,
1.231712, -1.075083, 1.876376, 1, 0, 0.5764706, 1,
1.239245, 0.962519, 0.3798954, 1, 0, 0.5686275, 1,
1.242755, 0.9227563, 2.284438, 1, 0, 0.5647059, 1,
1.244645, -1.27821, 2.132787, 1, 0, 0.5568628, 1,
1.256127, 1.324862, -0.483059, 1, 0, 0.5529412, 1,
1.258473, 1.017764, 0.4039891, 1, 0, 0.5450981, 1,
1.263945, 1.243995, 1.594902, 1, 0, 0.5411765, 1,
1.265507, -0.2842352, 2.250822, 1, 0, 0.5333334, 1,
1.267719, 0.04446452, 2.477343, 1, 0, 0.5294118, 1,
1.279432, 0.1727391, 1.479687, 1, 0, 0.5215687, 1,
1.280452, 0.5358557, 2.680334, 1, 0, 0.5176471, 1,
1.282904, -0.2471506, 0.0466885, 1, 0, 0.509804, 1,
1.306911, -1.274978, 2.432388, 1, 0, 0.5058824, 1,
1.307377, -0.1816208, 1.674053, 1, 0, 0.4980392, 1,
1.316441, -0.6251372, 2.677317, 1, 0, 0.4901961, 1,
1.317772, -0.3779055, 2.305381, 1, 0, 0.4862745, 1,
1.327801, -0.07846227, 0.5306161, 1, 0, 0.4784314, 1,
1.337605, 0.5962226, 1.442046, 1, 0, 0.4745098, 1,
1.355231, 0.7148099, 1.443068, 1, 0, 0.4666667, 1,
1.357953, 1.132365, 1.212498, 1, 0, 0.4627451, 1,
1.373987, 1.226608, 2.031395, 1, 0, 0.454902, 1,
1.385015, 1.25309, 2.500437, 1, 0, 0.4509804, 1,
1.387547, -0.890053, 2.126858, 1, 0, 0.4431373, 1,
1.388992, 0.2142126, 1.814364, 1, 0, 0.4392157, 1,
1.393234, 0.1361522, 1.872484, 1, 0, 0.4313726, 1,
1.404359, -1.96125, 3.107895, 1, 0, 0.427451, 1,
1.411377, -0.6338076, 2.193621, 1, 0, 0.4196078, 1,
1.412831, -0.1643517, 1.495789, 1, 0, 0.4156863, 1,
1.424465, 1.878707, 0.3343076, 1, 0, 0.4078431, 1,
1.427321, -0.2935821, 1.219881, 1, 0, 0.4039216, 1,
1.433376, 1.175233, 2.141841, 1, 0, 0.3960784, 1,
1.436691, 0.3632942, -0.09045555, 1, 0, 0.3882353, 1,
1.438107, -2.371783, 3.766968, 1, 0, 0.3843137, 1,
1.439087, 0.527998, 0.655206, 1, 0, 0.3764706, 1,
1.4453, -0.3386132, -0.304457, 1, 0, 0.372549, 1,
1.447364, 1.223723, 2.420245, 1, 0, 0.3647059, 1,
1.453072, -2.003406, 1.721317, 1, 0, 0.3607843, 1,
1.456304, 0.7067613, 0.9275768, 1, 0, 0.3529412, 1,
1.45728, -0.3565916, 3.089015, 1, 0, 0.3490196, 1,
1.458805, -0.4601304, 1.654632, 1, 0, 0.3411765, 1,
1.460922, -0.4607549, 2.948709, 1, 0, 0.3372549, 1,
1.481576, 0.3970903, 3.153262, 1, 0, 0.3294118, 1,
1.492054, -0.2049848, 0.6685294, 1, 0, 0.3254902, 1,
1.494948, 1.129552, 1.408443, 1, 0, 0.3176471, 1,
1.50491, 0.3722363, 2.02782, 1, 0, 0.3137255, 1,
1.507703, -1.272699, 1.460773, 1, 0, 0.3058824, 1,
1.517104, 0.02719461, 1.97349, 1, 0, 0.2980392, 1,
1.524765, -0.8886743, 1.867786, 1, 0, 0.2941177, 1,
1.526168, -0.5968884, 2.298043, 1, 0, 0.2862745, 1,
1.531238, -2.498057, 1.797084, 1, 0, 0.282353, 1,
1.556735, -0.4052552, 4.088634, 1, 0, 0.2745098, 1,
1.566815, -0.4978393, 2.321504, 1, 0, 0.2705882, 1,
1.597635, -0.7371733, 1.375251, 1, 0, 0.2627451, 1,
1.653968, -0.1381148, -0.2631045, 1, 0, 0.2588235, 1,
1.665763, 1.79644, 0.7097995, 1, 0, 0.2509804, 1,
1.668486, 0.2634947, -0.1522653, 1, 0, 0.2470588, 1,
1.676247, 0.999669, 1.366425, 1, 0, 0.2392157, 1,
1.682675, 0.4412949, 0.8123449, 1, 0, 0.2352941, 1,
1.683535, -0.8927968, 1.93599, 1, 0, 0.227451, 1,
1.693568, 0.5627804, 1.354514, 1, 0, 0.2235294, 1,
1.697156, 0.4259807, 1.40194, 1, 0, 0.2156863, 1,
1.710168, -0.1123491, 1.795618, 1, 0, 0.2117647, 1,
1.72045, -1.270674, 2.137944, 1, 0, 0.2039216, 1,
1.737888, 0.2685342, 1.954261, 1, 0, 0.1960784, 1,
1.752017, -0.05943328, 0.02545922, 1, 0, 0.1921569, 1,
1.797163, 0.746188, 0.07569004, 1, 0, 0.1843137, 1,
1.806826, 0.5678086, 0.7002614, 1, 0, 0.1803922, 1,
1.818617, 1.415573, 0.4605975, 1, 0, 0.172549, 1,
1.826392, -0.8784445, 0.4934173, 1, 0, 0.1686275, 1,
1.833857, 0.146269, 1.245256, 1, 0, 0.1607843, 1,
1.859024, -0.221165, 0.8664716, 1, 0, 0.1568628, 1,
1.869432, -0.9983582, 2.040615, 1, 0, 0.1490196, 1,
1.877436, -1.234926, 2.634988, 1, 0, 0.145098, 1,
1.878922, 0.9375687, 2.358156, 1, 0, 0.1372549, 1,
1.889254, -0.2498963, 2.170723, 1, 0, 0.1333333, 1,
1.945329, -0.564796, 1.107502, 1, 0, 0.1254902, 1,
1.976231, -0.5914121, 1.548659, 1, 0, 0.1215686, 1,
1.991681, 1.293962, -0.1355548, 1, 0, 0.1137255, 1,
2.089181, 0.7977644, 1.616356, 1, 0, 0.1098039, 1,
2.100839, -0.4358761, -0.1807129, 1, 0, 0.1019608, 1,
2.140698, -0.3799686, 2.392082, 1, 0, 0.09411765, 1,
2.166279, 1.664848, 0.837169, 1, 0, 0.09019608, 1,
2.300322, -0.142908, 0.8890055, 1, 0, 0.08235294, 1,
2.307635, 1.061486, -0.3471272, 1, 0, 0.07843138, 1,
2.317234, 0.5237334, 0.7241331, 1, 0, 0.07058824, 1,
2.339696, 1.975521, -2.247729, 1, 0, 0.06666667, 1,
2.35879, -0.9367646, 1.83795, 1, 0, 0.05882353, 1,
2.3596, -2.147845, 0.8615408, 1, 0, 0.05490196, 1,
2.493123, 0.6977382, 0.008536263, 1, 0, 0.04705882, 1,
2.516575, -0.1067103, 2.270667, 1, 0, 0.04313726, 1,
2.557465, 0.9657586, 1.504075, 1, 0, 0.03529412, 1,
2.653618, 1.716994, 0.9929172, 1, 0, 0.03137255, 1,
2.70544, 1.146533, -0.120778, 1, 0, 0.02352941, 1,
2.86023, -1.602986, 2.807976, 1, 0, 0.01960784, 1,
2.923029, 1.210804, 0.0788364, 1, 0, 0.01176471, 1,
2.936373, -0.8042583, 1.816667, 1, 0, 0.007843138, 1
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
-0.1811854, -4.268981, -7.091678, 0, -0.5, 0.5, 0.5,
-0.1811854, -4.268981, -7.091678, 1, -0.5, 0.5, 0.5,
-0.1811854, -4.268981, -7.091678, 1, 1.5, 0.5, 0.5,
-0.1811854, -4.268981, -7.091678, 0, 1.5, 0.5, 0.5
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
-4.355597, 0.08940494, -7.091678, 0, -0.5, 0.5, 0.5,
-4.355597, 0.08940494, -7.091678, 1, -0.5, 0.5, 0.5,
-4.355597, 0.08940494, -7.091678, 1, 1.5, 0.5, 0.5,
-4.355597, 0.08940494, -7.091678, 0, 1.5, 0.5, 0.5
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
-4.355597, -4.268981, 0.03770232, 0, -0.5, 0.5, 0.5,
-4.355597, -4.268981, 0.03770232, 1, -0.5, 0.5, 0.5,
-4.355597, -4.268981, 0.03770232, 1, 1.5, 0.5, 0.5,
-4.355597, -4.268981, 0.03770232, 0, 1.5, 0.5, 0.5
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
-3, -3.263199, -5.446436,
2, -3.263199, -5.446436,
-3, -3.263199, -5.446436,
-3, -3.430829, -5.720643,
-2, -3.263199, -5.446436,
-2, -3.430829, -5.720643,
-1, -3.263199, -5.446436,
-1, -3.430829, -5.720643,
0, -3.263199, -5.446436,
0, -3.430829, -5.720643,
1, -3.263199, -5.446436,
1, -3.430829, -5.720643,
2, -3.263199, -5.446436,
2, -3.430829, -5.720643
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
-3, -3.76609, -6.269057, 0, -0.5, 0.5, 0.5,
-3, -3.76609, -6.269057, 1, -0.5, 0.5, 0.5,
-3, -3.76609, -6.269057, 1, 1.5, 0.5, 0.5,
-3, -3.76609, -6.269057, 0, 1.5, 0.5, 0.5,
-2, -3.76609, -6.269057, 0, -0.5, 0.5, 0.5,
-2, -3.76609, -6.269057, 1, -0.5, 0.5, 0.5,
-2, -3.76609, -6.269057, 1, 1.5, 0.5, 0.5,
-2, -3.76609, -6.269057, 0, 1.5, 0.5, 0.5,
-1, -3.76609, -6.269057, 0, -0.5, 0.5, 0.5,
-1, -3.76609, -6.269057, 1, -0.5, 0.5, 0.5,
-1, -3.76609, -6.269057, 1, 1.5, 0.5, 0.5,
-1, -3.76609, -6.269057, 0, 1.5, 0.5, 0.5,
0, -3.76609, -6.269057, 0, -0.5, 0.5, 0.5,
0, -3.76609, -6.269057, 1, -0.5, 0.5, 0.5,
0, -3.76609, -6.269057, 1, 1.5, 0.5, 0.5,
0, -3.76609, -6.269057, 0, 1.5, 0.5, 0.5,
1, -3.76609, -6.269057, 0, -0.5, 0.5, 0.5,
1, -3.76609, -6.269057, 1, -0.5, 0.5, 0.5,
1, -3.76609, -6.269057, 1, 1.5, 0.5, 0.5,
1, -3.76609, -6.269057, 0, 1.5, 0.5, 0.5,
2, -3.76609, -6.269057, 0, -0.5, 0.5, 0.5,
2, -3.76609, -6.269057, 1, -0.5, 0.5, 0.5,
2, -3.76609, -6.269057, 1, 1.5, 0.5, 0.5,
2, -3.76609, -6.269057, 0, 1.5, 0.5, 0.5
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
-3.392271, -3, -5.446436,
-3.392271, 3, -5.446436,
-3.392271, -3, -5.446436,
-3.552825, -3, -5.720643,
-3.392271, -2, -5.446436,
-3.552825, -2, -5.720643,
-3.392271, -1, -5.446436,
-3.552825, -1, -5.720643,
-3.392271, 0, -5.446436,
-3.552825, 0, -5.720643,
-3.392271, 1, -5.446436,
-3.552825, 1, -5.720643,
-3.392271, 2, -5.446436,
-3.552825, 2, -5.720643,
-3.392271, 3, -5.446436,
-3.552825, 3, -5.720643
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
-3.873934, -3, -6.269057, 0, -0.5, 0.5, 0.5,
-3.873934, -3, -6.269057, 1, -0.5, 0.5, 0.5,
-3.873934, -3, -6.269057, 1, 1.5, 0.5, 0.5,
-3.873934, -3, -6.269057, 0, 1.5, 0.5, 0.5,
-3.873934, -2, -6.269057, 0, -0.5, 0.5, 0.5,
-3.873934, -2, -6.269057, 1, -0.5, 0.5, 0.5,
-3.873934, -2, -6.269057, 1, 1.5, 0.5, 0.5,
-3.873934, -2, -6.269057, 0, 1.5, 0.5, 0.5,
-3.873934, -1, -6.269057, 0, -0.5, 0.5, 0.5,
-3.873934, -1, -6.269057, 1, -0.5, 0.5, 0.5,
-3.873934, -1, -6.269057, 1, 1.5, 0.5, 0.5,
-3.873934, -1, -6.269057, 0, 1.5, 0.5, 0.5,
-3.873934, 0, -6.269057, 0, -0.5, 0.5, 0.5,
-3.873934, 0, -6.269057, 1, -0.5, 0.5, 0.5,
-3.873934, 0, -6.269057, 1, 1.5, 0.5, 0.5,
-3.873934, 0, -6.269057, 0, 1.5, 0.5, 0.5,
-3.873934, 1, -6.269057, 0, -0.5, 0.5, 0.5,
-3.873934, 1, -6.269057, 1, -0.5, 0.5, 0.5,
-3.873934, 1, -6.269057, 1, 1.5, 0.5, 0.5,
-3.873934, 1, -6.269057, 0, 1.5, 0.5, 0.5,
-3.873934, 2, -6.269057, 0, -0.5, 0.5, 0.5,
-3.873934, 2, -6.269057, 1, -0.5, 0.5, 0.5,
-3.873934, 2, -6.269057, 1, 1.5, 0.5, 0.5,
-3.873934, 2, -6.269057, 0, 1.5, 0.5, 0.5,
-3.873934, 3, -6.269057, 0, -0.5, 0.5, 0.5,
-3.873934, 3, -6.269057, 1, -0.5, 0.5, 0.5,
-3.873934, 3, -6.269057, 1, 1.5, 0.5, 0.5,
-3.873934, 3, -6.269057, 0, 1.5, 0.5, 0.5
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
-3.392271, -3.263199, -4,
-3.392271, -3.263199, 4,
-3.392271, -3.263199, -4,
-3.552825, -3.430829, -4,
-3.392271, -3.263199, -2,
-3.552825, -3.430829, -2,
-3.392271, -3.263199, 0,
-3.552825, -3.430829, 0,
-3.392271, -3.263199, 2,
-3.552825, -3.430829, 2,
-3.392271, -3.263199, 4,
-3.552825, -3.430829, 4
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
-3.873934, -3.76609, -4, 0, -0.5, 0.5, 0.5,
-3.873934, -3.76609, -4, 1, -0.5, 0.5, 0.5,
-3.873934, -3.76609, -4, 1, 1.5, 0.5, 0.5,
-3.873934, -3.76609, -4, 0, 1.5, 0.5, 0.5,
-3.873934, -3.76609, -2, 0, -0.5, 0.5, 0.5,
-3.873934, -3.76609, -2, 1, -0.5, 0.5, 0.5,
-3.873934, -3.76609, -2, 1, 1.5, 0.5, 0.5,
-3.873934, -3.76609, -2, 0, 1.5, 0.5, 0.5,
-3.873934, -3.76609, 0, 0, -0.5, 0.5, 0.5,
-3.873934, -3.76609, 0, 1, -0.5, 0.5, 0.5,
-3.873934, -3.76609, 0, 1, 1.5, 0.5, 0.5,
-3.873934, -3.76609, 0, 0, 1.5, 0.5, 0.5,
-3.873934, -3.76609, 2, 0, -0.5, 0.5, 0.5,
-3.873934, -3.76609, 2, 1, -0.5, 0.5, 0.5,
-3.873934, -3.76609, 2, 1, 1.5, 0.5, 0.5,
-3.873934, -3.76609, 2, 0, 1.5, 0.5, 0.5,
-3.873934, -3.76609, 4, 0, -0.5, 0.5, 0.5,
-3.873934, -3.76609, 4, 1, -0.5, 0.5, 0.5,
-3.873934, -3.76609, 4, 1, 1.5, 0.5, 0.5,
-3.873934, -3.76609, 4, 0, 1.5, 0.5, 0.5
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
-3.392271, -3.263199, -5.446436,
-3.392271, 3.442009, -5.446436,
-3.392271, -3.263199, 5.521841,
-3.392271, 3.442009, 5.521841,
-3.392271, -3.263199, -5.446436,
-3.392271, -3.263199, 5.521841,
-3.392271, 3.442009, -5.446436,
-3.392271, 3.442009, 5.521841,
-3.392271, -3.263199, -5.446436,
3.0299, -3.263199, -5.446436,
-3.392271, -3.263199, 5.521841,
3.0299, -3.263199, 5.521841,
-3.392271, 3.442009, -5.446436,
3.0299, 3.442009, -5.446436,
-3.392271, 3.442009, 5.521841,
3.0299, 3.442009, 5.521841,
3.0299, -3.263199, -5.446436,
3.0299, 3.442009, -5.446436,
3.0299, -3.263199, 5.521841,
3.0299, 3.442009, 5.521841,
3.0299, -3.263199, -5.446436,
3.0299, -3.263199, 5.521841,
3.0299, 3.442009, -5.446436,
3.0299, 3.442009, 5.521841
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
var radius = 7.673492;
var distance = 34.14023;
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
mvMatrix.translate( 0.1811854, -0.08940494, -0.03770232 );
mvMatrix.scale( 1.291889, 1.237356, 0.7564297 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.14023);
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
diethyl_phosphate<-read.table("diethyl_phosphate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-diethyl_phosphate$V2
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_phosphate' not found
```

```r
y<-diethyl_phosphate$V3
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_phosphate' not found
```

```r
z<-diethyl_phosphate$V4
```

```
## Error in eval(expr, envir, enclos): object 'diethyl_phosphate' not found
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
-3.298744, 1.343887, -1.198848, 0, 0, 1, 1, 1,
-2.79217, 0.9107744, -2.052995, 1, 0, 0, 1, 1,
-2.737812, -1.079955, -1.912229, 1, 0, 0, 1, 1,
-2.721637, -0.5597402, -0.1971406, 1, 0, 0, 1, 1,
-2.708014, 2.041552, 0.8006216, 1, 0, 0, 1, 1,
-2.681312, 1.663631, -1.268177, 1, 0, 0, 1, 1,
-2.63228, 1.45983, -0.7344644, 0, 0, 0, 1, 1,
-2.558613, -0.1191445, -2.369399, 0, 0, 0, 1, 1,
-2.495892, 0.949648, -0.54656, 0, 0, 0, 1, 1,
-2.475357, -0.6639805, -2.004327, 0, 0, 0, 1, 1,
-2.463908, -1.026496, -1.729221, 0, 0, 0, 1, 1,
-2.422839, 0.003045835, -2.389306, 0, 0, 0, 1, 1,
-2.259915, 1.43637, -1.739956, 0, 0, 0, 1, 1,
-2.249865, -0.4828711, -2.319933, 1, 1, 1, 1, 1,
-2.248958, -1.003925, 1.217062, 1, 1, 1, 1, 1,
-2.156132, 0.4982232, -0.2996725, 1, 1, 1, 1, 1,
-2.130851, 1.132394, -0.189199, 1, 1, 1, 1, 1,
-2.127396, 0.9263622, -0.3139553, 1, 1, 1, 1, 1,
-2.114056, -1.631479, -3.860902, 1, 1, 1, 1, 1,
-2.081363, 0.4449798, -3.994019, 1, 1, 1, 1, 1,
-2.057894, -0.1754769, -2.728273, 1, 1, 1, 1, 1,
-2.054741, -0.2625344, -1.286696, 1, 1, 1, 1, 1,
-2.048915, 0.4412038, -2.360975, 1, 1, 1, 1, 1,
-2.0286, 0.4621622, -0.2466626, 1, 1, 1, 1, 1,
-2.025365, -0.1997965, -1.535796, 1, 1, 1, 1, 1,
-2.017207, 1.918772, 0.07868981, 1, 1, 1, 1, 1,
-1.964324, 2.551923, -1.30996, 1, 1, 1, 1, 1,
-1.899251, -0.1938595, -1.975313, 1, 1, 1, 1, 1,
-1.837601, 1.345735, -1.64805, 0, 0, 1, 1, 1,
-1.818314, 0.1253548, -0.2336606, 1, 0, 0, 1, 1,
-1.815301, 0.8679159, -0.5293438, 1, 0, 0, 1, 1,
-1.810002, 1.698842, -2.001825, 1, 0, 0, 1, 1,
-1.808952, -0.3447277, -2.650094, 1, 0, 0, 1, 1,
-1.777731, 0.2372217, -1.476679, 1, 0, 0, 1, 1,
-1.770614, 1.135329, -0.6641695, 0, 0, 0, 1, 1,
-1.767348, 1.020236, -1.519874, 0, 0, 0, 1, 1,
-1.762895, 0.5280806, -1.234021, 0, 0, 0, 1, 1,
-1.760976, -0.9970914, -2.309003, 0, 0, 0, 1, 1,
-1.753531, 0.408399, -1.006799, 0, 0, 0, 1, 1,
-1.739343, -1.298529, -2.875619, 0, 0, 0, 1, 1,
-1.724934, -1.475471, -0.2713579, 0, 0, 0, 1, 1,
-1.722361, 0.7936108, -0.6805703, 1, 1, 1, 1, 1,
-1.715513, -0.3236366, -2.436435, 1, 1, 1, 1, 1,
-1.713103, -0.4688246, -0.4305411, 1, 1, 1, 1, 1,
-1.710643, 0.2444043, -1.662134, 1, 1, 1, 1, 1,
-1.707086, -0.4728315, -3.20737, 1, 1, 1, 1, 1,
-1.686241, 1.206856, 0.4042015, 1, 1, 1, 1, 1,
-1.680747, -1.009252, -1.579754, 1, 1, 1, 1, 1,
-1.677154, -1.24558, -2.892596, 1, 1, 1, 1, 1,
-1.673596, 0.09453916, -1.402852, 1, 1, 1, 1, 1,
-1.639246, 0.4305961, -2.8603, 1, 1, 1, 1, 1,
-1.603921, -0.5951912, -1.301907, 1, 1, 1, 1, 1,
-1.576571, 0.7382217, -2.493932, 1, 1, 1, 1, 1,
-1.576146, -0.3885793, -0.5473998, 1, 1, 1, 1, 1,
-1.574078, 0.1100411, -2.022588, 1, 1, 1, 1, 1,
-1.570371, -1.133986, -1.145867, 1, 1, 1, 1, 1,
-1.565044, 0.5078688, -1.762718, 0, 0, 1, 1, 1,
-1.552192, 0.0960056, -0.5063585, 1, 0, 0, 1, 1,
-1.537137, 0.7357336, -0.2779343, 1, 0, 0, 1, 1,
-1.51978, 0.6841732, 0.2673994, 1, 0, 0, 1, 1,
-1.51345, -0.01239067, -1.929566, 1, 0, 0, 1, 1,
-1.493882, -0.2866872, -1.271913, 1, 0, 0, 1, 1,
-1.487281, 0.1533529, -2.282146, 0, 0, 0, 1, 1,
-1.483592, -1.548439, -2.383632, 0, 0, 0, 1, 1,
-1.481656, 0.7969495, 0.6354082, 0, 0, 0, 1, 1,
-1.463526, -0.08307649, -2.270552, 0, 0, 0, 1, 1,
-1.456578, 0.5368455, -2.115941, 0, 0, 0, 1, 1,
-1.438224, 1.486791, -0.3614565, 0, 0, 0, 1, 1,
-1.421566, 2.436374, -0.1123745, 0, 0, 0, 1, 1,
-1.417368, -0.7165899, -1.414911, 1, 1, 1, 1, 1,
-1.409515, 0.5649475, -0.1773704, 1, 1, 1, 1, 1,
-1.406915, 0.06064767, -1.545277, 1, 1, 1, 1, 1,
-1.402151, 1.670092, -0.7906771, 1, 1, 1, 1, 1,
-1.394009, -1.655812, -2.42583, 1, 1, 1, 1, 1,
-1.393179, 0.02300547, -2.058773, 1, 1, 1, 1, 1,
-1.39302, 0.3078623, -2.63768, 1, 1, 1, 1, 1,
-1.386081, -0.1925277, -3.168345, 1, 1, 1, 1, 1,
-1.373447, -1.393104, -3.7293, 1, 1, 1, 1, 1,
-1.370276, 0.848738, -0.8693642, 1, 1, 1, 1, 1,
-1.342174, 1.463191, -0.5947109, 1, 1, 1, 1, 1,
-1.341661, 0.4438883, -1.096695, 1, 1, 1, 1, 1,
-1.340929, -0.3471979, -1.448127, 1, 1, 1, 1, 1,
-1.324705, 0.2147083, -1.129652, 1, 1, 1, 1, 1,
-1.322214, -0.1802461, -2.221026, 1, 1, 1, 1, 1,
-1.31913, -0.7962233, -2.191007, 0, 0, 1, 1, 1,
-1.318658, 0.8586269, -0.3078343, 1, 0, 0, 1, 1,
-1.316674, 0.4490853, -1.356636, 1, 0, 0, 1, 1,
-1.308407, 0.7032467, 0.4534853, 1, 0, 0, 1, 1,
-1.297858, -1.014676, -0.4342181, 1, 0, 0, 1, 1,
-1.285537, 0.08856847, -1.291552, 1, 0, 0, 1, 1,
-1.285298, 1.476235, 0.009861349, 0, 0, 0, 1, 1,
-1.274774, 0.0901349, -1.68562, 0, 0, 0, 1, 1,
-1.269293, 1.202277, 0.09722196, 0, 0, 0, 1, 1,
-1.26606, 1.074178, -0.89314, 0, 0, 0, 1, 1,
-1.263551, 1.295555, -2.586221, 0, 0, 0, 1, 1,
-1.262359, 0.4081309, -2.572005, 0, 0, 0, 1, 1,
-1.255332, 1.360113, -1.476698, 0, 0, 0, 1, 1,
-1.252888, 0.1507132, -2.908506, 1, 1, 1, 1, 1,
-1.219583, -3.16555, -3.85797, 1, 1, 1, 1, 1,
-1.211534, -0.7234654, -3.338583, 1, 1, 1, 1, 1,
-1.209655, -0.4365986, -1.042654, 1, 1, 1, 1, 1,
-1.20862, 0.08392426, -0.8404719, 1, 1, 1, 1, 1,
-1.206525, 0.3014339, -3.659587, 1, 1, 1, 1, 1,
-1.189382, -1.861337, -2.498531, 1, 1, 1, 1, 1,
-1.188826, -0.3172634, -2.998459, 1, 1, 1, 1, 1,
-1.174152, -0.4660118, -0.7549459, 1, 1, 1, 1, 1,
-1.172362, -0.3626319, -3.211442, 1, 1, 1, 1, 1,
-1.167964, 1.166775, -0.3146851, 1, 1, 1, 1, 1,
-1.165614, 0.1492499, -3.482885, 1, 1, 1, 1, 1,
-1.157527, -0.05654956, -1.034258, 1, 1, 1, 1, 1,
-1.152584, -0.7536224, -1.910929, 1, 1, 1, 1, 1,
-1.152005, 0.232734, -2.002342, 1, 1, 1, 1, 1,
-1.144462, -1.271551, -3.048196, 0, 0, 1, 1, 1,
-1.136785, -2.854698, -3.60086, 1, 0, 0, 1, 1,
-1.132648, -1.490751, -2.115164, 1, 0, 0, 1, 1,
-1.132506, 1.672136, 0.2662092, 1, 0, 0, 1, 1,
-1.131251, -0.9576327, -1.335741, 1, 0, 0, 1, 1,
-1.131089, -0.3939369, -1.875004, 1, 0, 0, 1, 1,
-1.130169, -1.178343, -3.279137, 0, 0, 0, 1, 1,
-1.126551, 0.653717, -1.992142, 0, 0, 0, 1, 1,
-1.124813, 0.3283705, -1.773219, 0, 0, 0, 1, 1,
-1.118624, 0.7301391, -2.151467, 0, 0, 0, 1, 1,
-1.118095, -0.8018588, -1.54133, 0, 0, 0, 1, 1,
-1.117149, -2.756984, -5.087606, 0, 0, 0, 1, 1,
-1.113595, 0.7246317, -1.856101, 0, 0, 0, 1, 1,
-1.113468, 0.7674829, -2.344037, 1, 1, 1, 1, 1,
-1.097218, 1.358415, 0.1109964, 1, 1, 1, 1, 1,
-1.094845, 0.5189918, 0.08448291, 1, 1, 1, 1, 1,
-1.09311, 0.1947037, -0.8359887, 1, 1, 1, 1, 1,
-1.091073, -0.7179508, -2.037454, 1, 1, 1, 1, 1,
-1.08536, -0.07665744, -1.266837, 1, 1, 1, 1, 1,
-1.083469, 0.3058857, -1.961275, 1, 1, 1, 1, 1,
-1.071066, -0.3541826, -0.8741764, 1, 1, 1, 1, 1,
-1.069719, 0.1171486, -0.04399731, 1, 1, 1, 1, 1,
-1.068082, -0.07719672, -3.365735, 1, 1, 1, 1, 1,
-1.053743, 1.266889, -0.8790376, 1, 1, 1, 1, 1,
-1.050984, -0.6043319, -4.116205, 1, 1, 1, 1, 1,
-1.049056, 1.427742, -0.01770819, 1, 1, 1, 1, 1,
-1.044729, -0.4601115, -2.912463, 1, 1, 1, 1, 1,
-1.043297, 0.5701302, 0.710978, 1, 1, 1, 1, 1,
-1.038298, 0.521731, -1.581903, 0, 0, 1, 1, 1,
-1.033274, 0.5067321, -2.965377, 1, 0, 0, 1, 1,
-1.02272, 0.6383703, -1.160699, 1, 0, 0, 1, 1,
-1.022558, 0.3217515, 0.9546116, 1, 0, 0, 1, 1,
-1.018485, -0.7127012, -2.852813, 1, 0, 0, 1, 1,
-1.008892, -1.21456, -3.338679, 1, 0, 0, 1, 1,
-1.002834, 0.3005379, -1.983398, 0, 0, 0, 1, 1,
-1.002687, -0.05768205, -1.401382, 0, 0, 0, 1, 1,
-1.00136, -0.2995429, -2.593584, 0, 0, 0, 1, 1,
-0.9971969, -1.377434, -3.448244, 0, 0, 0, 1, 1,
-0.996269, -0.9836714, -2.252532, 0, 0, 0, 1, 1,
-0.9922646, 0.346819, -2.575522, 0, 0, 0, 1, 1,
-0.9853578, -0.9198449, -1.599755, 0, 0, 0, 1, 1,
-0.9838509, 0.1273057, -1.796597, 1, 1, 1, 1, 1,
-0.9830711, 0.4705547, -1.650647, 1, 1, 1, 1, 1,
-0.9804748, 0.486927, -0.8615676, 1, 1, 1, 1, 1,
-0.95322, 1.664445, -0.5029896, 1, 1, 1, 1, 1,
-0.9517355, 0.4570817, -1.426787, 1, 1, 1, 1, 1,
-0.9362572, 0.7460975, -1.515105, 1, 1, 1, 1, 1,
-0.9361219, -0.6425041, -1.749897, 1, 1, 1, 1, 1,
-0.9293114, 0.3276648, -1.780116, 1, 1, 1, 1, 1,
-0.9267156, 1.868712, -0.6578317, 1, 1, 1, 1, 1,
-0.9264173, -1.783638, -2.752876, 1, 1, 1, 1, 1,
-0.9248381, -0.2317917, -0.05866225, 1, 1, 1, 1, 1,
-0.924612, 0.5780715, -1.213804, 1, 1, 1, 1, 1,
-0.9231457, -0.3392045, -3.846442, 1, 1, 1, 1, 1,
-0.9178675, -1.322764, -3.143492, 1, 1, 1, 1, 1,
-0.9157051, 0.4075419, 0.4989311, 1, 1, 1, 1, 1,
-0.9083818, -0.6742018, -3.462225, 0, 0, 1, 1, 1,
-0.9056683, -0.7801517, -3.967781, 1, 0, 0, 1, 1,
-0.903362, -0.6409492, -4.15366, 1, 0, 0, 1, 1,
-0.902581, 0.5212192, -0.9877561, 1, 0, 0, 1, 1,
-0.898351, 0.8875623, -1.101359, 1, 0, 0, 1, 1,
-0.8953, -1.157293, -2.095046, 1, 0, 0, 1, 1,
-0.8932149, 0.733763, -1.168012, 0, 0, 0, 1, 1,
-0.8909056, -0.5104584, -4.091855, 0, 0, 0, 1, 1,
-0.8879361, 0.7144416, 0.212131, 0, 0, 0, 1, 1,
-0.8877525, 0.5028998, 0.04914873, 0, 0, 0, 1, 1,
-0.8869433, 1.172757, -1.167536, 0, 0, 0, 1, 1,
-0.8823363, -0.8961171, -2.368951, 0, 0, 0, 1, 1,
-0.8696797, -0.0750802, -2.197141, 0, 0, 0, 1, 1,
-0.8689114, 1.36826, 0.7702655, 1, 1, 1, 1, 1,
-0.8621153, -1.995528, -2.816938, 1, 1, 1, 1, 1,
-0.8601192, -0.8719082, -1.94081, 1, 1, 1, 1, 1,
-0.8560613, -0.333747, -2.322185, 1, 1, 1, 1, 1,
-0.8549635, -1.53327, -2.176099, 1, 1, 1, 1, 1,
-0.8544026, 0.4233769, -1.305861, 1, 1, 1, 1, 1,
-0.8500526, -0.3939667, -3.846915, 1, 1, 1, 1, 1,
-0.8477041, 0.4604892, -0.5582528, 1, 1, 1, 1, 1,
-0.8468331, 0.3678822, -1.281183, 1, 1, 1, 1, 1,
-0.8449184, -2.712359, -2.59987, 1, 1, 1, 1, 1,
-0.844123, 0.237091, -0.1437763, 1, 1, 1, 1, 1,
-0.8354241, 1.175325, -1.480845, 1, 1, 1, 1, 1,
-0.8310198, -0.7799519, -2.532929, 1, 1, 1, 1, 1,
-0.8233701, -0.5355166, -2.256644, 1, 1, 1, 1, 1,
-0.822831, -2.058018, -0.694688, 1, 1, 1, 1, 1,
-0.8220364, -0.1750137, -1.534676, 0, 0, 1, 1, 1,
-0.8205175, -0.8747398, -2.417426, 1, 0, 0, 1, 1,
-0.818899, 0.3465832, -0.4093095, 1, 0, 0, 1, 1,
-0.8178279, -0.5177856, -2.126281, 1, 0, 0, 1, 1,
-0.8168686, -1.525184, -2.75512, 1, 0, 0, 1, 1,
-0.8129829, 0.9029544, -1.322214, 1, 0, 0, 1, 1,
-0.8118213, -0.3964827, -3.93533, 0, 0, 0, 1, 1,
-0.8082023, 0.357003, -1.528835, 0, 0, 0, 1, 1,
-0.8038337, 1.207468, -0.2220072, 0, 0, 0, 1, 1,
-0.8036757, 0.302276, -1.609262, 0, 0, 0, 1, 1,
-0.8036029, 1.93035, 0.5122018, 0, 0, 0, 1, 1,
-0.8012899, 0.5016745, -0.2108211, 0, 0, 0, 1, 1,
-0.7972209, 1.634041, -1.095923, 0, 0, 0, 1, 1,
-0.7960121, -1.355196, -2.060169, 1, 1, 1, 1, 1,
-0.7919307, 0.7243693, -2.60025, 1, 1, 1, 1, 1,
-0.7915187, -0.8329276, -2.207268, 1, 1, 1, 1, 1,
-0.7882209, -0.5018523, -1.813931, 1, 1, 1, 1, 1,
-0.7845901, 0.9672103, 0.3448257, 1, 1, 1, 1, 1,
-0.7836472, 0.1255573, -3.197641, 1, 1, 1, 1, 1,
-0.774152, 1.080119, -0.5354151, 1, 1, 1, 1, 1,
-0.7621452, -0.894846, -3.968465, 1, 1, 1, 1, 1,
-0.7584866, -0.5052128, -2.098626, 1, 1, 1, 1, 1,
-0.7517802, -0.1822475, -3.588522, 1, 1, 1, 1, 1,
-0.7509663, 0.6526731, -0.3234983, 1, 1, 1, 1, 1,
-0.7496423, 1.067354, -1.837295, 1, 1, 1, 1, 1,
-0.7452711, -0.7711989, -2.345239, 1, 1, 1, 1, 1,
-0.7395034, 0.9280058, -1.782412, 1, 1, 1, 1, 1,
-0.7363094, 0.922368, 0.2632551, 1, 1, 1, 1, 1,
-0.7305031, 0.5780776, -1.959319, 0, 0, 1, 1, 1,
-0.7160351, 0.06881955, -1.576627, 1, 0, 0, 1, 1,
-0.7157306, 0.2558101, -0.9071506, 1, 0, 0, 1, 1,
-0.7085775, -1.568557, -0.4428428, 1, 0, 0, 1, 1,
-0.7065372, -0.1379664, -1.086673, 1, 0, 0, 1, 1,
-0.706126, 0.7781524, -0.901171, 1, 0, 0, 1, 1,
-0.7034165, -0.4035928, -1.865703, 0, 0, 0, 1, 1,
-0.6958361, 0.5746434, -0.4191088, 0, 0, 0, 1, 1,
-0.6929011, -1.286083, -2.409008, 0, 0, 0, 1, 1,
-0.6842106, 0.1654974, -3.663612, 0, 0, 0, 1, 1,
-0.6802696, 0.7003385, -1.649499, 0, 0, 0, 1, 1,
-0.6759297, 0.4180695, -1.53913, 0, 0, 0, 1, 1,
-0.6754084, -0.3780794, -0.9381313, 0, 0, 0, 1, 1,
-0.6752794, -1.079999, -3.065469, 1, 1, 1, 1, 1,
-0.670689, 0.7375799, 0.764697, 1, 1, 1, 1, 1,
-0.6698164, 0.02857125, -0.1114476, 1, 1, 1, 1, 1,
-0.6654799, -0.7131323, -2.093769, 1, 1, 1, 1, 1,
-0.6633841, 0.3418436, -2.594126, 1, 1, 1, 1, 1,
-0.6632509, 1.77338, -0.3804409, 1, 1, 1, 1, 1,
-0.6618169, -0.297273, -3.591229, 1, 1, 1, 1, 1,
-0.6610811, 0.1995515, -1.481728, 1, 1, 1, 1, 1,
-0.6609254, -0.09086967, -1.066637, 1, 1, 1, 1, 1,
-0.6604749, -1.234035, -2.070732, 1, 1, 1, 1, 1,
-0.6603463, -1.773525, -4.303198, 1, 1, 1, 1, 1,
-0.6561508, -1.366849, -2.492813, 1, 1, 1, 1, 1,
-0.6549287, 0.4364146, -2.722299, 1, 1, 1, 1, 1,
-0.6530621, -0.5370384, -4.108172, 1, 1, 1, 1, 1,
-0.6499396, -0.6878242, -3.061464, 1, 1, 1, 1, 1,
-0.6498273, 0.110695, -1.826413, 0, 0, 1, 1, 1,
-0.6482172, 0.2459799, 0.1206741, 1, 0, 0, 1, 1,
-0.6471443, 0.3961527, -2.170749, 1, 0, 0, 1, 1,
-0.6457019, 0.785336, -0.5529731, 1, 0, 0, 1, 1,
-0.6441883, -1.26728, -4.179377, 1, 0, 0, 1, 1,
-0.6418729, -0.2345105, -2.389783, 1, 0, 0, 1, 1,
-0.6408805, 1.381052, -0.3421209, 0, 0, 0, 1, 1,
-0.6369848, -0.4035126, -2.15282, 0, 0, 0, 1, 1,
-0.6350927, 2.520393, 0.5932801, 0, 0, 0, 1, 1,
-0.632993, -1.169436, -2.577012, 0, 0, 0, 1, 1,
-0.6306707, -1.063988, -2.011981, 0, 0, 0, 1, 1,
-0.6298938, 0.2909516, -0.2087385, 0, 0, 0, 1, 1,
-0.6257549, 1.1905, -0.4418983, 0, 0, 0, 1, 1,
-0.6253846, -1.47265, -4.363483, 1, 1, 1, 1, 1,
-0.6211984, -0.4526707, -3.393659, 1, 1, 1, 1, 1,
-0.6205043, -0.9488908, -2.549231, 1, 1, 1, 1, 1,
-0.6176786, 1.815007, -1.930763, 1, 1, 1, 1, 1,
-0.6058994, 0.06864296, -2.558964, 1, 1, 1, 1, 1,
-0.6038996, -0.7049009, -1.567147, 1, 1, 1, 1, 1,
-0.596631, 1.386087, 0.08899978, 1, 1, 1, 1, 1,
-0.5947977, 0.4231918, -0.5470607, 1, 1, 1, 1, 1,
-0.593259, -1.092435, -2.523752, 1, 1, 1, 1, 1,
-0.5890669, -0.3897165, -1.622582, 1, 1, 1, 1, 1,
-0.5884179, 1.274496, 1.267762, 1, 1, 1, 1, 1,
-0.5868213, 0.721181, -0.164601, 1, 1, 1, 1, 1,
-0.585561, -0.66584, -1.244603, 1, 1, 1, 1, 1,
-0.5781748, -0.2635805, -0.8774188, 1, 1, 1, 1, 1,
-0.577617, 1.32849, -0.073718, 1, 1, 1, 1, 1,
-0.5728261, -0.3377637, -4.36631, 0, 0, 1, 1, 1,
-0.5693959, 0.1616226, -1.888107, 1, 0, 0, 1, 1,
-0.5635728, 0.137321, -0.5701331, 1, 0, 0, 1, 1,
-0.5621847, 0.5518302, -0.9185897, 1, 0, 0, 1, 1,
-0.5617551, 0.676742, -0.2432629, 1, 0, 0, 1, 1,
-0.5616023, 0.106936, -0.4419464, 1, 0, 0, 1, 1,
-0.5598861, -0.1222954, -1.456138, 0, 0, 0, 1, 1,
-0.5520367, 0.7438741, -1.60628, 0, 0, 0, 1, 1,
-0.5492546, -0.7881392, -1.048724, 0, 0, 0, 1, 1,
-0.5485892, -0.6261162, -2.646044, 0, 0, 0, 1, 1,
-0.5467986, 0.4093045, -2.310421, 0, 0, 0, 1, 1,
-0.5466713, 0.7412511, -1.47401, 0, 0, 0, 1, 1,
-0.5431859, 0.671314, -0.1579056, 0, 0, 0, 1, 1,
-0.5421522, 0.9598241, 0.155629, 1, 1, 1, 1, 1,
-0.5406969, -0.1699263, -2.79257, 1, 1, 1, 1, 1,
-0.5394449, 0.0945562, -0.1234321, 1, 1, 1, 1, 1,
-0.5382478, 0.388966, -0.7990637, 1, 1, 1, 1, 1,
-0.536122, 0.1380141, -2.816222, 1, 1, 1, 1, 1,
-0.5321104, -0.1101895, -1.629163, 1, 1, 1, 1, 1,
-0.5260059, -0.0916129, -0.7046794, 1, 1, 1, 1, 1,
-0.5204601, 1.872188, 0.3948151, 1, 1, 1, 1, 1,
-0.5195459, 0.7604615, -0.0295597, 1, 1, 1, 1, 1,
-0.5170637, 0.9438331, -0.8606631, 1, 1, 1, 1, 1,
-0.5143973, 0.8493833, 0.2988045, 1, 1, 1, 1, 1,
-0.5098459, 1.019032, -0.7217815, 1, 1, 1, 1, 1,
-0.5073683, 1.602405, -0.9259071, 1, 1, 1, 1, 1,
-0.5069389, 0.5344661, -1.19928, 1, 1, 1, 1, 1,
-0.5018528, -1.154296, -1.913454, 1, 1, 1, 1, 1,
-0.499245, 0.9936596, -0.06642827, 0, 0, 1, 1, 1,
-0.4965383, 1.766351, 0.1215399, 1, 0, 0, 1, 1,
-0.4893118, -0.9351234, -3.858459, 1, 0, 0, 1, 1,
-0.4890239, -0.4635311, -3.412023, 1, 0, 0, 1, 1,
-0.48812, -0.1498547, -1.616746, 1, 0, 0, 1, 1,
-0.4877827, -1.214697, -2.777277, 1, 0, 0, 1, 1,
-0.4833866, 0.5154253, -1.140173, 0, 0, 0, 1, 1,
-0.4833308, -0.6948699, -4.147567, 0, 0, 0, 1, 1,
-0.4792938, 0.5776898, -2.720715, 0, 0, 0, 1, 1,
-0.4776778, 0.4427588, -0.09998924, 0, 0, 0, 1, 1,
-0.4772572, -0.5396727, -2.219666, 0, 0, 0, 1, 1,
-0.4729559, 0.7421902, -0.6796336, 0, 0, 0, 1, 1,
-0.4668938, -0.09629221, -1.869378, 0, 0, 0, 1, 1,
-0.4645091, 0.3774003, -1.223554, 1, 1, 1, 1, 1,
-0.4641805, 0.2127992, -0.9021191, 1, 1, 1, 1, 1,
-0.4579385, -1.570659, -2.841958, 1, 1, 1, 1, 1,
-0.4568715, 0.4970493, -1.24662, 1, 1, 1, 1, 1,
-0.451952, -0.1244598, -2.092489, 1, 1, 1, 1, 1,
-0.4480586, 1.354945, -1.569095, 1, 1, 1, 1, 1,
-0.4477243, 1.449763, -0.5901256, 1, 1, 1, 1, 1,
-0.4445531, 0.8992059, 1.709355, 1, 1, 1, 1, 1,
-0.4445371, -0.579371, -3.380111, 1, 1, 1, 1, 1,
-0.4326561, 0.8600548, -0.3386135, 1, 1, 1, 1, 1,
-0.4301278, -0.6201537, -1.625284, 1, 1, 1, 1, 1,
-0.4291961, -0.638773, -2.100165, 1, 1, 1, 1, 1,
-0.4263685, 0.3421644, -1.030151, 1, 1, 1, 1, 1,
-0.4226361, -0.1816529, 0.00630616, 1, 1, 1, 1, 1,
-0.4222382, -0.2135996, -1.08396, 1, 1, 1, 1, 1,
-0.4210871, -0.04317959, -0.4632421, 0, 0, 1, 1, 1,
-0.420735, -1.027263, -3.50865, 1, 0, 0, 1, 1,
-0.4184918, -1.01425, -2.600417, 1, 0, 0, 1, 1,
-0.4180865, -0.3435868, -0.7588508, 1, 0, 0, 1, 1,
-0.4172542, 0.3097787, -1.145539, 1, 0, 0, 1, 1,
-0.4169568, 1.049733, -1.674576, 1, 0, 0, 1, 1,
-0.4124389, 2.477561, -0.3340471, 0, 0, 0, 1, 1,
-0.4076604, 0.3159081, -1.698534, 0, 0, 0, 1, 1,
-0.4064491, -0.6750082, -1.25863, 0, 0, 0, 1, 1,
-0.4041989, -0.007556096, -1.982978, 0, 0, 0, 1, 1,
-0.4023486, 0.3462779, -2.466831, 0, 0, 0, 1, 1,
-0.4013687, -1.466137, -2.091144, 0, 0, 0, 1, 1,
-0.4010611, -0.6663323, -3.183648, 0, 0, 0, 1, 1,
-0.3989097, 0.3266339, -1.237661, 1, 1, 1, 1, 1,
-0.3986682, 0.9686865, -0.393639, 1, 1, 1, 1, 1,
-0.3965014, -0.2984845, -1.843093, 1, 1, 1, 1, 1,
-0.3905778, -0.899538, -1.681006, 1, 1, 1, 1, 1,
-0.3897685, 0.01584353, -0.5627475, 1, 1, 1, 1, 1,
-0.3798608, -2.057743, -2.698633, 1, 1, 1, 1, 1,
-0.3784398, -1.488594, -3.534768, 1, 1, 1, 1, 1,
-0.3741387, -0.7525527, -3.733238, 1, 1, 1, 1, 1,
-0.3724613, 0.4409975, -1.075811, 1, 1, 1, 1, 1,
-0.3723747, -1.758934, -2.446557, 1, 1, 1, 1, 1,
-0.3586229, 0.9329693, -1.604993, 1, 1, 1, 1, 1,
-0.3434534, -0.1202403, -2.598117, 1, 1, 1, 1, 1,
-0.3366354, -1.121032, -4.056245, 1, 1, 1, 1, 1,
-0.3357948, 0.03720665, -2.038799, 1, 1, 1, 1, 1,
-0.3344062, 0.7767093, -0.5220067, 1, 1, 1, 1, 1,
-0.3339968, 0.1320157, -1.883828, 0, 0, 1, 1, 1,
-0.3309755, 0.7753945, -0.1278738, 1, 0, 0, 1, 1,
-0.3276972, -1.353405, -4.018233, 1, 0, 0, 1, 1,
-0.3243829, -0.1305141, -1.952159, 1, 0, 0, 1, 1,
-0.3208227, 0.8007081, -2.780888, 1, 0, 0, 1, 1,
-0.3125764, 0.2150839, -0.08598949, 1, 0, 0, 1, 1,
-0.3116135, 0.2288312, -1.083884, 0, 0, 0, 1, 1,
-0.3097778, -1.045956, -3.440212, 0, 0, 0, 1, 1,
-0.3079545, 1.091623, 0.5749107, 0, 0, 0, 1, 1,
-0.3073027, 1.419146, 0.5916554, 0, 0, 0, 1, 1,
-0.3037862, 1.383799, -0.786798, 0, 0, 0, 1, 1,
-0.3014255, -1.971279, -3.312333, 0, 0, 0, 1, 1,
-0.3006292, 0.8810615, -0.4307635, 0, 0, 0, 1, 1,
-0.2992876, -1.208855, -2.785937, 1, 1, 1, 1, 1,
-0.2937946, -0.9494491, -5.229167, 1, 1, 1, 1, 1,
-0.2903307, -1.657558, -3.589333, 1, 1, 1, 1, 1,
-0.2876961, 2.10293, -1.177876, 1, 1, 1, 1, 1,
-0.2861938, 2.080642, -0.646585, 1, 1, 1, 1, 1,
-0.2853076, 0.5344807, 2.208436, 1, 1, 1, 1, 1,
-0.2837507, 1.004631, -0.701481, 1, 1, 1, 1, 1,
-0.2833017, 0.4332211, -1.1583, 1, 1, 1, 1, 1,
-0.27821, -0.7444897, -4.282074, 1, 1, 1, 1, 1,
-0.2730612, 0.6233982, 1.35922, 1, 1, 1, 1, 1,
-0.2718459, 1.538514, -1.567759, 1, 1, 1, 1, 1,
-0.2717172, -2.4995, -4.104564, 1, 1, 1, 1, 1,
-0.2684708, 0.3410368, -1.89838, 1, 1, 1, 1, 1,
-0.2663311, 0.6058381, -1.394526, 1, 1, 1, 1, 1,
-0.2630036, -1.123792, -3.653595, 1, 1, 1, 1, 1,
-0.2597159, -0.485424, -4.200163, 0, 0, 1, 1, 1,
-0.2596768, -1.345195, -2.33188, 1, 0, 0, 1, 1,
-0.2572719, 2.414526, -0.727571, 1, 0, 0, 1, 1,
-0.2544748, -1.905037, -2.268282, 1, 0, 0, 1, 1,
-0.2400373, -0.2720121, -1.695732, 1, 0, 0, 1, 1,
-0.2284733, -1.191378, -2.861031, 1, 0, 0, 1, 1,
-0.2269564, 0.235879, -1.642107, 0, 0, 0, 1, 1,
-0.2213307, -0.3557837, -2.456654, 0, 0, 0, 1, 1,
-0.2206922, -1.011944, -2.951298, 0, 0, 0, 1, 1,
-0.2196265, 0.741844, 0.3359668, 0, 0, 0, 1, 1,
-0.2162966, 1.37305, -0.5902293, 0, 0, 0, 1, 1,
-0.2142881, -1.61573, -4.364017, 0, 0, 0, 1, 1,
-0.2140336, -0.5581871, -2.050892, 0, 0, 0, 1, 1,
-0.2020861, -1.143741, -2.938238, 1, 1, 1, 1, 1,
-0.2000484, 0.6851181, -0.8516718, 1, 1, 1, 1, 1,
-0.1988881, 1.340058, -0.1371656, 1, 1, 1, 1, 1,
-0.1985396, -0.8243698, -3.989098, 1, 1, 1, 1, 1,
-0.19425, -0.4490817, -4.229332, 1, 1, 1, 1, 1,
-0.1908853, -0.169604, -3.058029, 1, 1, 1, 1, 1,
-0.1902162, 1.151199, 0.4041082, 1, 1, 1, 1, 1,
-0.1892207, -0.1086344, -0.9667112, 1, 1, 1, 1, 1,
-0.186497, -1.53869, -4.211699, 1, 1, 1, 1, 1,
-0.1854306, 0.9073827, -1.257957, 1, 1, 1, 1, 1,
-0.1849951, 0.03188245, -1.142115, 1, 1, 1, 1, 1,
-0.183285, 0.6624091, -0.1481216, 1, 1, 1, 1, 1,
-0.1796055, -0.5986488, -3.022272, 1, 1, 1, 1, 1,
-0.1792785, -0.4766927, -4.351838, 1, 1, 1, 1, 1,
-0.1782741, 0.3119407, 1.0595, 1, 1, 1, 1, 1,
-0.1724125, -0.4767225, -1.120501, 0, 0, 1, 1, 1,
-0.1722287, 0.1378193, -1.149902, 1, 0, 0, 1, 1,
-0.1639386, -1.705254, -3.334491, 1, 0, 0, 1, 1,
-0.1628662, 0.003190433, -1.542789, 1, 0, 0, 1, 1,
-0.1609048, 0.7132425, 1.407724, 1, 0, 0, 1, 1,
-0.1555217, -1.220915, -4.040089, 1, 0, 0, 1, 1,
-0.1553407, -1.14142, -4.015737, 0, 0, 0, 1, 1,
-0.1505436, 3.34436, 0.7168829, 0, 0, 0, 1, 1,
-0.1488382, -0.9807449, -2.862811, 0, 0, 0, 1, 1,
-0.1423978, 0.9202179, 0.0112167, 0, 0, 0, 1, 1,
-0.1400129, 1.009345, 0.0432559, 0, 0, 0, 1, 1,
-0.1396813, -0.0176493, -2.774446, 0, 0, 0, 1, 1,
-0.1386183, -1.32948, -2.476832, 0, 0, 0, 1, 1,
-0.1371938, 0.223723, 0.1911922, 1, 1, 1, 1, 1,
-0.1308395, 0.3671317, 0.3894735, 1, 1, 1, 1, 1,
-0.1304187, -2.532901, -2.65344, 1, 1, 1, 1, 1,
-0.1303897, 1.263753, 0.932745, 1, 1, 1, 1, 1,
-0.1291711, -1.091477, -3.055374, 1, 1, 1, 1, 1,
-0.1260464, 0.2219508, -1.025339, 1, 1, 1, 1, 1,
-0.124628, -0.3977434, -3.201035, 1, 1, 1, 1, 1,
-0.1234289, 0.2574172, -0.8779541, 1, 1, 1, 1, 1,
-0.1207965, 0.7969667, -0.2325529, 1, 1, 1, 1, 1,
-0.1188943, 1.595117, -0.2938383, 1, 1, 1, 1, 1,
-0.1178193, -1.276171, -2.389723, 1, 1, 1, 1, 1,
-0.115767, -1.313305, -5.286704, 1, 1, 1, 1, 1,
-0.1151255, -0.3271064, -3.121773, 1, 1, 1, 1, 1,
-0.1141522, -0.3936937, -3.754534, 1, 1, 1, 1, 1,
-0.1132302, 1.79643, 0.485556, 1, 1, 1, 1, 1,
-0.1081728, -0.1921832, -2.573489, 0, 0, 1, 1, 1,
-0.1081695, -0.190923, -2.31939, 1, 0, 0, 1, 1,
-0.1081399, -1.289542, -4.935124, 1, 0, 0, 1, 1,
-0.1065588, -0.6942857, -3.546462, 1, 0, 0, 1, 1,
-0.1049611, 1.023971, -0.2114996, 1, 0, 0, 1, 1,
-0.1021354, 1.258053, -0.8316845, 1, 0, 0, 1, 1,
-0.1008625, -0.03162888, -1.103883, 0, 0, 0, 1, 1,
-0.1001915, -1.234528, -4.066559, 0, 0, 0, 1, 1,
-0.09956841, -1.016513, -3.732842, 0, 0, 0, 1, 1,
-0.09948732, 0.371561, -1.223058, 0, 0, 0, 1, 1,
-0.09761647, 0.198684, 0.2078874, 0, 0, 0, 1, 1,
-0.09754107, -1.136502, -2.044971, 0, 0, 0, 1, 1,
-0.09484342, -0.2154215, -1.669423, 0, 0, 0, 1, 1,
-0.09237827, -1.53228, -2.584337, 1, 1, 1, 1, 1,
-0.08599117, 1.241492, 1.294675, 1, 1, 1, 1, 1,
-0.08405521, 0.7591995, -0.4538427, 1, 1, 1, 1, 1,
-0.08338493, 0.7777473, -0.3064159, 1, 1, 1, 1, 1,
-0.08314612, 0.4092044, -0.1699082, 1, 1, 1, 1, 1,
-0.0817292, 0.5310493, 0.1728496, 1, 1, 1, 1, 1,
-0.08039264, 1.24777, 0.1031495, 1, 1, 1, 1, 1,
-0.07342643, 0.1340645, -0.2074924, 1, 1, 1, 1, 1,
-0.07205137, 0.7219931, 0.1810844, 1, 1, 1, 1, 1,
-0.07140241, -0.689355, -3.04276, 1, 1, 1, 1, 1,
-0.06758377, -0.1356546, -4.216735, 1, 1, 1, 1, 1,
-0.06209962, -0.5651463, -2.711169, 1, 1, 1, 1, 1,
-0.06151255, 0.5835524, 0.5445047, 1, 1, 1, 1, 1,
-0.05833358, -2.23825, -2.63611, 1, 1, 1, 1, 1,
-0.05804073, 0.4843886, 1.170389, 1, 1, 1, 1, 1,
-0.05051519, 0.98083, 0.3214645, 0, 0, 1, 1, 1,
-0.04645767, 0.03383322, -1.51123, 1, 0, 0, 1, 1,
-0.04247329, -0.386469, -3.767059, 1, 0, 0, 1, 1,
-0.04223161, -0.4022802, -2.29406, 1, 0, 0, 1, 1,
-0.0362679, -1.056221, -2.262845, 1, 0, 0, 1, 1,
-0.03519775, -0.5775344, -1.540934, 1, 0, 0, 1, 1,
-0.03154189, 1.573119, -0.6911973, 0, 0, 0, 1, 1,
-0.02978322, -0.9031063, -3.730283, 0, 0, 0, 1, 1,
-0.02599264, -0.943031, -3.86412, 0, 0, 0, 1, 1,
-0.01850612, -0.7755358, -4.652139, 0, 0, 0, 1, 1,
-0.01808235, 1.338524, 0.01030049, 0, 0, 0, 1, 1,
-0.01541439, -0.8174136, -2.351299, 0, 0, 0, 1, 1,
-0.01491838, 0.06352606, 0.2190179, 0, 0, 0, 1, 1,
-0.01385824, -1.125975, -2.25996, 1, 1, 1, 1, 1,
-0.01015454, 0.2607601, -0.579747, 1, 1, 1, 1, 1,
-0.007138499, -0.9448627, -3.150562, 1, 1, 1, 1, 1,
-0.00601751, -0.7549585, -1.825318, 1, 1, 1, 1, 1,
-0.005843596, -0.79418, -3.459055, 1, 1, 1, 1, 1,
-0.000664219, 0.9369518, 0.2674854, 1, 1, 1, 1, 1,
-0.000246073, -1.706812, -2.433665, 1, 1, 1, 1, 1,
0.0001601099, 0.3365801, -0.1423154, 1, 1, 1, 1, 1,
0.0008275336, 1.913809, -0.7669544, 1, 1, 1, 1, 1,
0.001433694, -0.2970427, 3.320212, 1, 1, 1, 1, 1,
0.003748547, -0.2640626, 2.336176, 1, 1, 1, 1, 1,
0.005750551, -0.07956102, 2.993165, 1, 1, 1, 1, 1,
0.006040503, 0.1269952, 0.9996688, 1, 1, 1, 1, 1,
0.007951492, -0.5875133, 3.857832, 1, 1, 1, 1, 1,
0.01126263, -0.6086117, 4.475252, 1, 1, 1, 1, 1,
0.0130102, 0.315814, -0.1708812, 0, 0, 1, 1, 1,
0.01921384, 1.615842, 0.8377951, 1, 0, 0, 1, 1,
0.01928035, 0.906683, -0.7516364, 1, 0, 0, 1, 1,
0.02443969, 0.4296671, 0.57298, 1, 0, 0, 1, 1,
0.02887976, -0.05022222, 2.752755, 1, 0, 0, 1, 1,
0.03645539, -0.4613949, 0.3881854, 1, 0, 0, 1, 1,
0.0372776, 0.7607299, -0.9295678, 0, 0, 0, 1, 1,
0.04133005, -0.9450579, 3.187066, 0, 0, 0, 1, 1,
0.04255857, 1.627915, 2.080156, 0, 0, 0, 1, 1,
0.04322221, 0.8374725, -0.5242729, 0, 0, 0, 1, 1,
0.04815917, 0.6636037, 1.187039, 0, 0, 0, 1, 1,
0.05000102, -0.1563913, 2.684273, 0, 0, 0, 1, 1,
0.05748154, 0.2053463, 0.2612517, 0, 0, 0, 1, 1,
0.05808164, 1.385447, 0.8482326, 1, 1, 1, 1, 1,
0.05850154, -0.9052071, 5.362109, 1, 1, 1, 1, 1,
0.05951752, 0.6310528, 1.049601, 1, 1, 1, 1, 1,
0.06226851, -0.1716584, 1.469644, 1, 1, 1, 1, 1,
0.06956409, 0.3137386, -1.796559, 1, 1, 1, 1, 1,
0.07181761, -0.3191983, 2.344622, 1, 1, 1, 1, 1,
0.07194486, -0.5065274, 4.819232, 1, 1, 1, 1, 1,
0.07201002, 1.022889, 0.2159547, 1, 1, 1, 1, 1,
0.07301114, 0.5639353, 0.9338832, 1, 1, 1, 1, 1,
0.07500964, 0.2753197, 1.25953, 1, 1, 1, 1, 1,
0.08030925, -0.659744, 2.289098, 1, 1, 1, 1, 1,
0.08189277, 1.244017, -0.2056656, 1, 1, 1, 1, 1,
0.0832134, -0.8599325, 4.571592, 1, 1, 1, 1, 1,
0.08528958, 0.7792422, 1.645698, 1, 1, 1, 1, 1,
0.08529767, 0.02102911, 2.112099, 1, 1, 1, 1, 1,
0.08573831, -0.4292387, 3.977155, 0, 0, 1, 1, 1,
0.09274717, 0.4574307, 3.412771, 1, 0, 0, 1, 1,
0.0938189, -1.687005, 1.060784, 1, 0, 0, 1, 1,
0.0941745, -0.02642852, 1.612374, 1, 0, 0, 1, 1,
0.10081, 0.7647361, -0.001808122, 1, 0, 0, 1, 1,
0.1010667, -1.38226, 2.078048, 1, 0, 0, 1, 1,
0.1024292, 0.1439903, 0.5851457, 0, 0, 0, 1, 1,
0.1030691, -0.4182159, 1.645419, 0, 0, 0, 1, 1,
0.1053591, 0.7657825, -1.88841, 0, 0, 0, 1, 1,
0.1143841, -0.9410414, 3.034347, 0, 0, 0, 1, 1,
0.1160518, -0.04417074, 0.8714662, 0, 0, 0, 1, 1,
0.1161384, -0.6285139, 2.64573, 0, 0, 0, 1, 1,
0.1193347, -0.2687742, 2.682461, 0, 0, 0, 1, 1,
0.1213995, -1.911414, 3.693939, 1, 1, 1, 1, 1,
0.1266704, 1.55727, 1.19339, 1, 1, 1, 1, 1,
0.1273297, 0.1874894, 1.705457, 1, 1, 1, 1, 1,
0.1299671, -1.561085, 4.348808, 1, 1, 1, 1, 1,
0.1352581, -0.6883538, 1.923585, 1, 1, 1, 1, 1,
0.1357143, 0.2102586, -0.7898994, 1, 1, 1, 1, 1,
0.1358519, 0.5475652, -0.5791637, 1, 1, 1, 1, 1,
0.1366943, -1.101231, 2.37885, 1, 1, 1, 1, 1,
0.1374836, 0.9134759, -0.6477886, 1, 1, 1, 1, 1,
0.1444902, 1.363474, 2.268848, 1, 1, 1, 1, 1,
0.1464299, 0.4669831, 0.8463016, 1, 1, 1, 1, 1,
0.14839, -0.2519509, 2.382708, 1, 1, 1, 1, 1,
0.1492929, -0.4374174, 3.780467, 1, 1, 1, 1, 1,
0.1523416, 0.1235841, 1.129577, 1, 1, 1, 1, 1,
0.1524687, 3.226153, 0.300932, 1, 1, 1, 1, 1,
0.1527517, -0.1509491, 2.631134, 0, 0, 1, 1, 1,
0.1532113, -1.239539, 3.710169, 1, 0, 0, 1, 1,
0.1602933, -0.06885881, 1.573943, 1, 0, 0, 1, 1,
0.1622759, -2.071469, 3.560607, 1, 0, 0, 1, 1,
0.1636051, -0.3524516, 2.998315, 1, 0, 0, 1, 1,
0.1652186, -1.660643, 4.130927, 1, 0, 0, 1, 1,
0.1670964, 0.9946668, 0.4078678, 0, 0, 0, 1, 1,
0.1681268, -1.70627, 3.955185, 0, 0, 0, 1, 1,
0.1682222, 0.9942155, 2.459529, 0, 0, 0, 1, 1,
0.1683928, 0.439466, -0.04344606, 0, 0, 0, 1, 1,
0.1693358, 0.7701218, 0.4144846, 0, 0, 0, 1, 1,
0.1706403, -0.07345005, 2.111588, 0, 0, 0, 1, 1,
0.1713482, -1.589383, 3.339719, 0, 0, 0, 1, 1,
0.1760886, -0.0426129, 1.485582, 1, 1, 1, 1, 1,
0.178091, 2.250174, 0.3869432, 1, 1, 1, 1, 1,
0.181479, 0.1202858, 1.344959, 1, 1, 1, 1, 1,
0.1821458, -0.09815011, 3.740313, 1, 1, 1, 1, 1,
0.183023, -0.1039483, 2.59491, 1, 1, 1, 1, 1,
0.1873117, -1.611498, 4.891691, 1, 1, 1, 1, 1,
0.1896129, 0.01967178, 1.478317, 1, 1, 1, 1, 1,
0.1908032, -0.6591227, 2.810327, 1, 1, 1, 1, 1,
0.1927945, -1.147495, 2.152081, 1, 1, 1, 1, 1,
0.1950525, 0.003619296, -0.4434238, 1, 1, 1, 1, 1,
0.2026528, -0.2019525, 3.368078, 1, 1, 1, 1, 1,
0.2028032, -1.200339, 3.435232, 1, 1, 1, 1, 1,
0.205043, 0.5297077, -0.9803337, 1, 1, 1, 1, 1,
0.2119182, 1.198099, -0.4529858, 1, 1, 1, 1, 1,
0.214895, 0.4423445, 1.071226, 1, 1, 1, 1, 1,
0.2161164, -0.8169903, 0.6947052, 0, 0, 1, 1, 1,
0.218215, 1.299609, 1.760055, 1, 0, 0, 1, 1,
0.2209687, -0.2294087, 0.4763156, 1, 0, 0, 1, 1,
0.223393, 0.7815747, -1.240019, 1, 0, 0, 1, 1,
0.2258839, -2.758215, 3.444453, 1, 0, 0, 1, 1,
0.2268039, -1.616602, 2.644596, 1, 0, 0, 1, 1,
0.2268377, -0.3527768, 0.9018315, 0, 0, 0, 1, 1,
0.2342778, 0.6908891, 0.3824922, 0, 0, 0, 1, 1,
0.2353149, 1.508001, -0.4181643, 0, 0, 0, 1, 1,
0.2358024, -0.09479242, 0.7780799, 0, 0, 0, 1, 1,
0.2481912, 0.2516674, -0.6527922, 0, 0, 0, 1, 1,
0.2541735, -0.6614355, 4.60879, 0, 0, 0, 1, 1,
0.2542949, 0.1671724, 1.287663, 0, 0, 0, 1, 1,
0.2548186, -1.418145, 1.69975, 1, 1, 1, 1, 1,
0.2579197, -1.11886, 2.265968, 1, 1, 1, 1, 1,
0.2582094, -0.5906849, 1.91384, 1, 1, 1, 1, 1,
0.2588014, 0.1446021, 0.6629343, 1, 1, 1, 1, 1,
0.2659472, 1.483455, 0.3697115, 1, 1, 1, 1, 1,
0.2671149, 0.566856, 0.8486668, 1, 1, 1, 1, 1,
0.2685986, -0.6486737, 2.846043, 1, 1, 1, 1, 1,
0.2763888, -0.3942985, 2.406224, 1, 1, 1, 1, 1,
0.2779218, -0.6774986, 2.801167, 1, 1, 1, 1, 1,
0.2779767, -0.2735168, 1.403198, 1, 1, 1, 1, 1,
0.2810068, 0.6363766, 1.012377, 1, 1, 1, 1, 1,
0.2810432, -2.11151, 3.012837, 1, 1, 1, 1, 1,
0.2849044, 0.1947102, 0.4259815, 1, 1, 1, 1, 1,
0.2861734, 0.1672945, 0.1064888, 1, 1, 1, 1, 1,
0.2912982, -0.6295554, 1.695293, 1, 1, 1, 1, 1,
0.2958369, 1.332484, -1.527347, 0, 0, 1, 1, 1,
0.2969824, -0.6808085, 3.489225, 1, 0, 0, 1, 1,
0.3004579, 0.7154178, 1.198838, 1, 0, 0, 1, 1,
0.3013482, -0.2160438, 1.957134, 1, 0, 0, 1, 1,
0.3015831, -0.4490417, 3.326482, 1, 0, 0, 1, 1,
0.305112, 1.156146, 0.6724146, 1, 0, 0, 1, 1,
0.3054813, 0.6889961, -0.7477606, 0, 0, 0, 1, 1,
0.3167488, -0.613426, 4.327607, 0, 0, 0, 1, 1,
0.3203269, -1.442623, 4.414837, 0, 0, 0, 1, 1,
0.3238988, -0.597712, 2.218751, 0, 0, 0, 1, 1,
0.328207, -0.3275619, 1.807879, 0, 0, 0, 1, 1,
0.3284986, -0.1605794, 1.783293, 0, 0, 0, 1, 1,
0.3291457, 1.444019, 1.478219, 0, 0, 0, 1, 1,
0.3294567, 0.238199, 1.707535, 1, 1, 1, 1, 1,
0.3306127, 0.3138483, 0.912608, 1, 1, 1, 1, 1,
0.3376322, 0.7042757, 0.8490578, 1, 1, 1, 1, 1,
0.3390691, -0.8853705, 3.272584, 1, 1, 1, 1, 1,
0.3391592, -0.8946708, 3.426482, 1, 1, 1, 1, 1,
0.3403787, 0.8753286, 0.6272698, 1, 1, 1, 1, 1,
0.3408729, -0.03959617, 3.300122, 1, 1, 1, 1, 1,
0.341753, 0.1024669, 3.398638, 1, 1, 1, 1, 1,
0.3423592, 0.7491145, 0.4195691, 1, 1, 1, 1, 1,
0.3428403, 0.3074255, 1.307764, 1, 1, 1, 1, 1,
0.3444364, 0.5596958, 0.4748802, 1, 1, 1, 1, 1,
0.3457032, -0.2347838, 2.440213, 1, 1, 1, 1, 1,
0.3471746, 0.4555404, 0.1824174, 1, 1, 1, 1, 1,
0.3483691, -0.2716322, 3.156971, 1, 1, 1, 1, 1,
0.3495021, -0.7963809, 3.641132, 1, 1, 1, 1, 1,
0.3495821, 0.9437075, 0.5185313, 0, 0, 1, 1, 1,
0.3531004, 0.1572907, 2.478278, 1, 0, 0, 1, 1,
0.3549999, -0.3327448, 2.837006, 1, 0, 0, 1, 1,
0.3550614, 0.5856899, 0.009290421, 1, 0, 0, 1, 1,
0.3560168, -1.244242, 3.725674, 1, 0, 0, 1, 1,
0.3606465, -0.3331161, 3.436429, 1, 0, 0, 1, 1,
0.3623165, 0.6646985, 1.213246, 0, 0, 0, 1, 1,
0.3636499, -0.7236241, 0.89764, 0, 0, 0, 1, 1,
0.3647327, 0.09690126, 2.606379, 0, 0, 0, 1, 1,
0.3673373, 1.001767, -1.641232, 0, 0, 0, 1, 1,
0.3787111, 2.014092, 1.034672, 0, 0, 0, 1, 1,
0.3796417, 0.5168738, 1.358176, 0, 0, 0, 1, 1,
0.3818884, -0.4521216, 1.727788, 0, 0, 0, 1, 1,
0.3831721, 0.7886685, -0.06099622, 1, 1, 1, 1, 1,
0.3842413, 0.04817891, 3.23482, 1, 1, 1, 1, 1,
0.3901094, -0.9482779, 2.14511, 1, 1, 1, 1, 1,
0.3907963, -1.69932, 3.517223, 1, 1, 1, 1, 1,
0.3941706, 1.228967, -0.5688833, 1, 1, 1, 1, 1,
0.3947545, -0.3861631, 1.77844, 1, 1, 1, 1, 1,
0.3973881, 0.1634625, 1.95985, 1, 1, 1, 1, 1,
0.4014383, -0.4008153, 1.936466, 1, 1, 1, 1, 1,
0.4070634, 0.2896269, 0.6921223, 1, 1, 1, 1, 1,
0.4079291, -0.1301225, 0.194865, 1, 1, 1, 1, 1,
0.4093109, 0.1542022, 2.57579, 1, 1, 1, 1, 1,
0.4150828, 0.2511872, 0.6283854, 1, 1, 1, 1, 1,
0.4189151, -0.3052156, 4.239153, 1, 1, 1, 1, 1,
0.4292835, 0.7786952, -0.9765631, 1, 1, 1, 1, 1,
0.4307465, -0.5281513, 3.135798, 1, 1, 1, 1, 1,
0.4311172, 2.553656, 0.958485, 0, 0, 1, 1, 1,
0.4326068, 0.3001493, 1.149406, 1, 0, 0, 1, 1,
0.4362447, -1.190764, 1.147699, 1, 0, 0, 1, 1,
0.4383048, -0.5935862, 3.016778, 1, 0, 0, 1, 1,
0.4413351, -0.222719, 2.335483, 1, 0, 0, 1, 1,
0.4419899, 0.3917929, 0.9898218, 1, 0, 0, 1, 1,
0.4423317, -0.7013383, 2.364498, 0, 0, 0, 1, 1,
0.4559166, -0.8715403, 2.792369, 0, 0, 0, 1, 1,
0.4605012, -1.527732, 1.276739, 0, 0, 0, 1, 1,
0.461588, -1.005772, 3.014635, 0, 0, 0, 1, 1,
0.4627745, -0.7063682, 3.584189, 0, 0, 0, 1, 1,
0.4676175, -0.4785593, 0.4868595, 0, 0, 0, 1, 1,
0.4684164, 0.7607979, 1.249844, 0, 0, 0, 1, 1,
0.4729377, -0.9495115, 4.743834, 1, 1, 1, 1, 1,
0.4746125, 0.9932746, 0.1833593, 1, 1, 1, 1, 1,
0.4763474, -2.337004, 3.000335, 1, 1, 1, 1, 1,
0.4768859, -2.553442, 3.537897, 1, 1, 1, 1, 1,
0.496551, 0.135367, 1.832795, 1, 1, 1, 1, 1,
0.5040343, 0.3512365, 0.01359047, 1, 1, 1, 1, 1,
0.5079293, -0.7142914, 1.733545, 1, 1, 1, 1, 1,
0.5134506, 0.6512637, 1.294921, 1, 1, 1, 1, 1,
0.5199834, -1.244405, 3.98482, 1, 1, 1, 1, 1,
0.5242252, -0.5797141, 1.123941, 1, 1, 1, 1, 1,
0.5276332, -0.6573327, 3.616472, 1, 1, 1, 1, 1,
0.5297517, 1.112716, -0.1098559, 1, 1, 1, 1, 1,
0.53009, 0.1319118, 0.7227868, 1, 1, 1, 1, 1,
0.5380915, 1.141881, 0.241354, 1, 1, 1, 1, 1,
0.5391439, 0.8240257, 1.450631, 1, 1, 1, 1, 1,
0.5472106, 0.6771717, 0.1723519, 0, 0, 1, 1, 1,
0.547832, -1.033142, 3.86044, 1, 0, 0, 1, 1,
0.5486786, -0.03491658, 0.2529444, 1, 0, 0, 1, 1,
0.5517188, -1.795704, 2.476969, 1, 0, 0, 1, 1,
0.5524563, 1.029067, -0.173587, 1, 0, 0, 1, 1,
0.5533774, -0.4339492, 1.272505, 1, 0, 0, 1, 1,
0.5539954, -0.3281332, 1.513695, 0, 0, 0, 1, 1,
0.5543628, -1.079152, 3.13319, 0, 0, 0, 1, 1,
0.5563577, 1.877763, -1.260023, 0, 0, 0, 1, 1,
0.5574566, -0.3490352, -0.0246359, 0, 0, 0, 1, 1,
0.5591272, -0.1082824, 1.761906, 0, 0, 0, 1, 1,
0.5670027, -0.2612805, 2.01609, 0, 0, 0, 1, 1,
0.5677202, -1.235274, 2.675258, 0, 0, 0, 1, 1,
0.5689263, -0.791644, 2.216921, 1, 1, 1, 1, 1,
0.5703558, 0.5331444, 2.163343, 1, 1, 1, 1, 1,
0.5726088, -0.9317932, 3.196412, 1, 1, 1, 1, 1,
0.5726951, -1.103265, 1.726722, 1, 1, 1, 1, 1,
0.572754, 1.826433, -0.7795252, 1, 1, 1, 1, 1,
0.5734112, -1.402912, 2.453372, 1, 1, 1, 1, 1,
0.5764109, 0.1787804, 1.44238, 1, 1, 1, 1, 1,
0.57675, -0.05786262, 2.572279, 1, 1, 1, 1, 1,
0.5772003, 0.1177956, 0.6020913, 1, 1, 1, 1, 1,
0.5781195, -0.4951043, 2.242064, 1, 1, 1, 1, 1,
0.5787686, -0.3739131, 1.370271, 1, 1, 1, 1, 1,
0.5820006, -0.3768863, 2.1437, 1, 1, 1, 1, 1,
0.582826, -1.186233, 1.918119, 1, 1, 1, 1, 1,
0.58567, -0.4669138, 3.498703, 1, 1, 1, 1, 1,
0.5881746, -0.7787483, 2.229002, 1, 1, 1, 1, 1,
0.58864, 0.09564909, 1.675863, 0, 0, 1, 1, 1,
0.5897088, -0.07366324, 2.084363, 1, 0, 0, 1, 1,
0.5907386, 0.1735855, 0.9424887, 1, 0, 0, 1, 1,
0.594712, 1.580806, -0.9012899, 1, 0, 0, 1, 1,
0.5995839, -0.9363959, 3.349868, 1, 0, 0, 1, 1,
0.5997357, 0.3684389, 1.565891, 1, 0, 0, 1, 1,
0.605534, 0.03804349, 2.537557, 0, 0, 0, 1, 1,
0.6154285, 0.2272618, 1.622344, 0, 0, 0, 1, 1,
0.6172416, 1.010842, 1.128131, 0, 0, 0, 1, 1,
0.6184036, 0.09663941, 1.556283, 0, 0, 0, 1, 1,
0.6223491, 0.4901281, 0.3884209, 0, 0, 0, 1, 1,
0.6252114, 0.8512296, 1.096724, 0, 0, 0, 1, 1,
0.6262789, -0.7933092, 2.401114, 0, 0, 0, 1, 1,
0.6428573, 0.7536862, 0.5081435, 1, 1, 1, 1, 1,
0.6451873, 0.3398187, 0.9123036, 1, 1, 1, 1, 1,
0.6456017, 1.362594, 0.8985299, 1, 1, 1, 1, 1,
0.6463327, -0.5570633, 3.335643, 1, 1, 1, 1, 1,
0.6506439, 1.838094, -0.05836768, 1, 1, 1, 1, 1,
0.6510478, 0.07464628, 2.221213, 1, 1, 1, 1, 1,
0.6522496, 0.5103808, 0.2732783, 1, 1, 1, 1, 1,
0.6603631, -0.3700111, 3.199767, 1, 1, 1, 1, 1,
0.661755, -0.6505848, 1.991869, 1, 1, 1, 1, 1,
0.6632078, 0.8704602, 1.578589, 1, 1, 1, 1, 1,
0.6714733, -1.10716, 4.461024, 1, 1, 1, 1, 1,
0.675578, 1.09552, -0.2358708, 1, 1, 1, 1, 1,
0.6765278, 0.2758592, 3.07189, 1, 1, 1, 1, 1,
0.6807971, 0.07808574, 1.387527, 1, 1, 1, 1, 1,
0.6927194, 0.2647812, 1.350791, 1, 1, 1, 1, 1,
0.6953541, -1.243706, 3.696267, 0, 0, 1, 1, 1,
0.6961712, -3.005468, 3.339146, 1, 0, 0, 1, 1,
0.7013129, -0.8935194, 2.720116, 1, 0, 0, 1, 1,
0.7055123, 0.8242396, 0.6814119, 1, 0, 0, 1, 1,
0.7078655, 0.5029868, 0.9004447, 1, 0, 0, 1, 1,
0.7091398, -0.3775477, 0.7135593, 1, 0, 0, 1, 1,
0.7173707, 0.2849575, 1.5007, 0, 0, 0, 1, 1,
0.718256, -1.895465, 2.286573, 0, 0, 0, 1, 1,
0.7184133, -0.3804262, 3.102782, 0, 0, 0, 1, 1,
0.7190686, -0.9223265, 3.430011, 0, 0, 0, 1, 1,
0.7235694, -0.2920663, 2.598733, 0, 0, 0, 1, 1,
0.7286046, 1.028469, 0.7783571, 0, 0, 0, 1, 1,
0.731199, -0.6045482, 1.892961, 0, 0, 0, 1, 1,
0.7346985, -2.69573, -0.171172, 1, 1, 1, 1, 1,
0.7382166, 1.067263, 0.4049797, 1, 1, 1, 1, 1,
0.739678, 0.5093446, -0.2940144, 1, 1, 1, 1, 1,
0.7430746, -0.6394525, 0.709992, 1, 1, 1, 1, 1,
0.7452254, 0.7421634, 1.425091, 1, 1, 1, 1, 1,
0.7455942, -0.6714446, 2.191816, 1, 1, 1, 1, 1,
0.7478609, 0.04317271, 2.365857, 1, 1, 1, 1, 1,
0.7530787, 0.5795345, 0.3583772, 1, 1, 1, 1, 1,
0.7571587, -0.09429371, 1.233733, 1, 1, 1, 1, 1,
0.7573488, 0.6006855, 1.611612, 1, 1, 1, 1, 1,
0.7597045, -0.2462442, 2.636451, 1, 1, 1, 1, 1,
0.7610787, -0.9271474, 2.592437, 1, 1, 1, 1, 1,
0.7644086, -1.13008, 2.684036, 1, 1, 1, 1, 1,
0.7652441, -0.3766974, 2.904804, 1, 1, 1, 1, 1,
0.7662779, -0.1658209, 0.933874, 1, 1, 1, 1, 1,
0.770096, -0.9548676, 3.127719, 0, 0, 1, 1, 1,
0.7747557, -0.1313226, 2.342606, 1, 0, 0, 1, 1,
0.7817358, 0.3340414, 0.3756374, 1, 0, 0, 1, 1,
0.7849584, 0.3901631, 0.8596669, 1, 0, 0, 1, 1,
0.7880396, 0.5730807, 0.4334137, 1, 0, 0, 1, 1,
0.7883945, -0.05417308, 2.678643, 1, 0, 0, 1, 1,
0.789858, -0.2091642, 2.138167, 0, 0, 0, 1, 1,
0.7955245, -0.4545114, 1.764276, 0, 0, 0, 1, 1,
0.7961405, -0.6111835, 1.310672, 0, 0, 0, 1, 1,
0.7969161, -0.1335602, 0.6185316, 0, 0, 0, 1, 1,
0.7971799, 0.07631843, 2.126684, 0, 0, 0, 1, 1,
0.7988727, -0.7796963, 2.027691, 0, 0, 0, 1, 1,
0.798972, 0.1674637, 0.9945072, 0, 0, 0, 1, 1,
0.8054051, 2.516627, 1.007557, 1, 1, 1, 1, 1,
0.8054157, 0.08852635, -0.07902633, 1, 1, 1, 1, 1,
0.8078063, -0.2873287, 2.915349, 1, 1, 1, 1, 1,
0.8086742, -0.6807286, 1.537987, 1, 1, 1, 1, 1,
0.8093382, -0.2146005, 1.437967, 1, 1, 1, 1, 1,
0.8094141, 0.01130694, 2.147402, 1, 1, 1, 1, 1,
0.8125776, 2.059809, 1.764756, 1, 1, 1, 1, 1,
0.8147858, -1.531437, 3.430158, 1, 1, 1, 1, 1,
0.8148254, -0.2073574, 2.49634, 1, 1, 1, 1, 1,
0.8164721, -0.8888473, 4.173807, 1, 1, 1, 1, 1,
0.8198392, -0.05426333, 1.38223, 1, 1, 1, 1, 1,
0.8219597, 0.009068266, 3.101524, 1, 1, 1, 1, 1,
0.8240817, -0.02819848, 2.175124, 1, 1, 1, 1, 1,
0.8253327, -0.7758633, 1.99702, 1, 1, 1, 1, 1,
0.827795, -0.630961, 2.696308, 1, 1, 1, 1, 1,
0.8337781, 0.7511283, 2.932971, 0, 0, 1, 1, 1,
0.8343781, -0.3950433, 0.6435887, 1, 0, 0, 1, 1,
0.8347672, -0.3053588, 2.756825, 1, 0, 0, 1, 1,
0.8356897, -0.2762662, 1.949572, 1, 0, 0, 1, 1,
0.8367252, 0.709004, 0.409092, 1, 0, 0, 1, 1,
0.8452195, -0.7211574, 4.128614, 1, 0, 0, 1, 1,
0.8461838, -0.8789243, 3.988916, 0, 0, 0, 1, 1,
0.8510019, 0.6112646, 2.84891, 0, 0, 0, 1, 1,
0.8525812, 0.5870031, -0.3207348, 0, 0, 0, 1, 1,
0.8536108, -0.2066472, 1.399571, 0, 0, 0, 1, 1,
0.8546272, -0.671984, 2.601595, 0, 0, 0, 1, 1,
0.8644403, -1.042027, 2.17287, 0, 0, 0, 1, 1,
0.8689393, -0.2476246, 1.171654, 0, 0, 0, 1, 1,
0.8771929, -0.1352363, 1.945089, 1, 1, 1, 1, 1,
0.879029, -0.001362828, 3.02454, 1, 1, 1, 1, 1,
0.8907042, 0.8872979, 1.552563, 1, 1, 1, 1, 1,
0.8996037, 0.6459683, 2.26249, 1, 1, 1, 1, 1,
0.9025037, 0.6019911, 1.406512, 1, 1, 1, 1, 1,
0.9069887, 1.146529, -0.1004488, 1, 1, 1, 1, 1,
0.9160883, -0.9177241, 3.856291, 1, 1, 1, 1, 1,
0.9186338, -1.113072, 3.944311, 1, 1, 1, 1, 1,
0.9192454, 0.6038372, 2.641614, 1, 1, 1, 1, 1,
0.9209129, 0.6648904, -0.07703267, 1, 1, 1, 1, 1,
0.9253005, 1.464312, 2.004281, 1, 1, 1, 1, 1,
0.9306976, 1.223426, 1.108106, 1, 1, 1, 1, 1,
0.9344037, 0.1053667, 0.8951441, 1, 1, 1, 1, 1,
0.9355646, -1.163394, 3.022516, 1, 1, 1, 1, 1,
0.941527, 0.5609402, 1.290171, 1, 1, 1, 1, 1,
0.943276, -0.6469397, -0.07377069, 0, 0, 1, 1, 1,
0.94367, -0.5851826, 1.21511, 1, 0, 0, 1, 1,
0.95086, 1.602664, -1.603542, 1, 0, 0, 1, 1,
0.9556367, -1.222903, 4.053709, 1, 0, 0, 1, 1,
0.9558583, -0.8261051, 1.345448, 1, 0, 0, 1, 1,
0.9558957, 1.383808, 0.2526748, 1, 0, 0, 1, 1,
0.9560449, 2.871111, 1.806254, 0, 0, 0, 1, 1,
0.9784126, 0.3713608, 1.275525, 0, 0, 0, 1, 1,
0.9822314, 0.8756436, 0.3537511, 0, 0, 0, 1, 1,
0.99879, -0.7718882, 3.491906, 0, 0, 0, 1, 1,
1.006314, 1.319308, -0.6672446, 0, 0, 0, 1, 1,
1.008926, -0.03694255, 0.4738339, 0, 0, 0, 1, 1,
1.012513, 1.07059, 1.559027, 0, 0, 0, 1, 1,
1.017053, -0.1355579, 2.888823, 1, 1, 1, 1, 1,
1.01737, 1.264491, -0.1622885, 1, 1, 1, 1, 1,
1.020877, 0.6794991, 0.2964608, 1, 1, 1, 1, 1,
1.021307, 1.049093, 0.8013009, 1, 1, 1, 1, 1,
1.029058, 0.3850136, 0.8278022, 1, 1, 1, 1, 1,
1.030777, 0.8692935, -0.861037, 1, 1, 1, 1, 1,
1.033154, -0.9486458, 3.946203, 1, 1, 1, 1, 1,
1.039599, -0.5318333, 1.741196, 1, 1, 1, 1, 1,
1.042477, -0.6669542, 4.050197, 1, 1, 1, 1, 1,
1.058551, -0.9024217, 0.1242692, 1, 1, 1, 1, 1,
1.062636, 0.981259, 0.6060517, 1, 1, 1, 1, 1,
1.062809, -0.7712631, 3.113448, 1, 1, 1, 1, 1,
1.07043, -1.701743, 2.66864, 1, 1, 1, 1, 1,
1.08509, 1.900465, 0.6334053, 1, 1, 1, 1, 1,
1.085162, -0.2542513, 1.091955, 1, 1, 1, 1, 1,
1.094253, -0.5629209, 3.177197, 0, 0, 1, 1, 1,
1.099963, -0.2437516, 2.361176, 1, 0, 0, 1, 1,
1.108989, 0.6860167, 0.5475711, 1, 0, 0, 1, 1,
1.111873, -0.2075723, 0.5145893, 1, 0, 0, 1, 1,
1.115392, -0.4158442, 2.461154, 1, 0, 0, 1, 1,
1.124018, -0.2816906, 0.8868878, 1, 0, 0, 1, 1,
1.132737, -0.5614355, 3.811788, 0, 0, 0, 1, 1,
1.141711, -0.1435566, 1.34149, 0, 0, 0, 1, 1,
1.143331, 0.6469218, 2.120702, 0, 0, 0, 1, 1,
1.144246, 0.3833204, 2.559722, 0, 0, 0, 1, 1,
1.14655, -0.2520783, 0.8406339, 0, 0, 0, 1, 1,
1.148149, -0.8103239, 0.7019612, 0, 0, 0, 1, 1,
1.149667, 1.702312, 0.8039323, 0, 0, 0, 1, 1,
1.152111, 0.8521115, 0.01345502, 1, 1, 1, 1, 1,
1.172152, -0.4122398, 1.002594, 1, 1, 1, 1, 1,
1.172438, -0.3800356, 1.157436, 1, 1, 1, 1, 1,
1.173442, -0.1536013, 1.725131, 1, 1, 1, 1, 1,
1.175764, -0.5216396, 0.6035882, 1, 1, 1, 1, 1,
1.178198, 0.3582172, 1.795544, 1, 1, 1, 1, 1,
1.178822, -2.05269, 0.8060659, 1, 1, 1, 1, 1,
1.17926, 0.4655784, -0.1008972, 1, 1, 1, 1, 1,
1.182024, -2.034181, 1.40816, 1, 1, 1, 1, 1,
1.185638, -1.167432, 1.879542, 1, 1, 1, 1, 1,
1.18663, 1.615482, 0.06873588, 1, 1, 1, 1, 1,
1.187506, -0.0487887, 2.215531, 1, 1, 1, 1, 1,
1.188804, 0.3358081, -1.231106, 1, 1, 1, 1, 1,
1.195273, 0.5255571, 2.173454, 1, 1, 1, 1, 1,
1.200846, -0.8142766, 1.570746, 1, 1, 1, 1, 1,
1.207753, -1.069586, 2.004408, 0, 0, 1, 1, 1,
1.215213, -0.03294986, 1.247288, 1, 0, 0, 1, 1,
1.215276, -0.8731831, 0.7600567, 1, 0, 0, 1, 1,
1.216353, -0.1303096, 2.354408, 1, 0, 0, 1, 1,
1.220146, -1.53509, 2.647996, 1, 0, 0, 1, 1,
1.225261, 2.10415, 1.232893, 1, 0, 0, 1, 1,
1.230456, 0.6129232, 1.139129, 0, 0, 0, 1, 1,
1.231584, 1.434493, 0.9864439, 0, 0, 0, 1, 1,
1.231712, -1.075083, 1.876376, 0, 0, 0, 1, 1,
1.239245, 0.962519, 0.3798954, 0, 0, 0, 1, 1,
1.242755, 0.9227563, 2.284438, 0, 0, 0, 1, 1,
1.244645, -1.27821, 2.132787, 0, 0, 0, 1, 1,
1.256127, 1.324862, -0.483059, 0, 0, 0, 1, 1,
1.258473, 1.017764, 0.4039891, 1, 1, 1, 1, 1,
1.263945, 1.243995, 1.594902, 1, 1, 1, 1, 1,
1.265507, -0.2842352, 2.250822, 1, 1, 1, 1, 1,
1.267719, 0.04446452, 2.477343, 1, 1, 1, 1, 1,
1.279432, 0.1727391, 1.479687, 1, 1, 1, 1, 1,
1.280452, 0.5358557, 2.680334, 1, 1, 1, 1, 1,
1.282904, -0.2471506, 0.0466885, 1, 1, 1, 1, 1,
1.306911, -1.274978, 2.432388, 1, 1, 1, 1, 1,
1.307377, -0.1816208, 1.674053, 1, 1, 1, 1, 1,
1.316441, -0.6251372, 2.677317, 1, 1, 1, 1, 1,
1.317772, -0.3779055, 2.305381, 1, 1, 1, 1, 1,
1.327801, -0.07846227, 0.5306161, 1, 1, 1, 1, 1,
1.337605, 0.5962226, 1.442046, 1, 1, 1, 1, 1,
1.355231, 0.7148099, 1.443068, 1, 1, 1, 1, 1,
1.357953, 1.132365, 1.212498, 1, 1, 1, 1, 1,
1.373987, 1.226608, 2.031395, 0, 0, 1, 1, 1,
1.385015, 1.25309, 2.500437, 1, 0, 0, 1, 1,
1.387547, -0.890053, 2.126858, 1, 0, 0, 1, 1,
1.388992, 0.2142126, 1.814364, 1, 0, 0, 1, 1,
1.393234, 0.1361522, 1.872484, 1, 0, 0, 1, 1,
1.404359, -1.96125, 3.107895, 1, 0, 0, 1, 1,
1.411377, -0.6338076, 2.193621, 0, 0, 0, 1, 1,
1.412831, -0.1643517, 1.495789, 0, 0, 0, 1, 1,
1.424465, 1.878707, 0.3343076, 0, 0, 0, 1, 1,
1.427321, -0.2935821, 1.219881, 0, 0, 0, 1, 1,
1.433376, 1.175233, 2.141841, 0, 0, 0, 1, 1,
1.436691, 0.3632942, -0.09045555, 0, 0, 0, 1, 1,
1.438107, -2.371783, 3.766968, 0, 0, 0, 1, 1,
1.439087, 0.527998, 0.655206, 1, 1, 1, 1, 1,
1.4453, -0.3386132, -0.304457, 1, 1, 1, 1, 1,
1.447364, 1.223723, 2.420245, 1, 1, 1, 1, 1,
1.453072, -2.003406, 1.721317, 1, 1, 1, 1, 1,
1.456304, 0.7067613, 0.9275768, 1, 1, 1, 1, 1,
1.45728, -0.3565916, 3.089015, 1, 1, 1, 1, 1,
1.458805, -0.4601304, 1.654632, 1, 1, 1, 1, 1,
1.460922, -0.4607549, 2.948709, 1, 1, 1, 1, 1,
1.481576, 0.3970903, 3.153262, 1, 1, 1, 1, 1,
1.492054, -0.2049848, 0.6685294, 1, 1, 1, 1, 1,
1.494948, 1.129552, 1.408443, 1, 1, 1, 1, 1,
1.50491, 0.3722363, 2.02782, 1, 1, 1, 1, 1,
1.507703, -1.272699, 1.460773, 1, 1, 1, 1, 1,
1.517104, 0.02719461, 1.97349, 1, 1, 1, 1, 1,
1.524765, -0.8886743, 1.867786, 1, 1, 1, 1, 1,
1.526168, -0.5968884, 2.298043, 0, 0, 1, 1, 1,
1.531238, -2.498057, 1.797084, 1, 0, 0, 1, 1,
1.556735, -0.4052552, 4.088634, 1, 0, 0, 1, 1,
1.566815, -0.4978393, 2.321504, 1, 0, 0, 1, 1,
1.597635, -0.7371733, 1.375251, 1, 0, 0, 1, 1,
1.653968, -0.1381148, -0.2631045, 1, 0, 0, 1, 1,
1.665763, 1.79644, 0.7097995, 0, 0, 0, 1, 1,
1.668486, 0.2634947, -0.1522653, 0, 0, 0, 1, 1,
1.676247, 0.999669, 1.366425, 0, 0, 0, 1, 1,
1.682675, 0.4412949, 0.8123449, 0, 0, 0, 1, 1,
1.683535, -0.8927968, 1.93599, 0, 0, 0, 1, 1,
1.693568, 0.5627804, 1.354514, 0, 0, 0, 1, 1,
1.697156, 0.4259807, 1.40194, 0, 0, 0, 1, 1,
1.710168, -0.1123491, 1.795618, 1, 1, 1, 1, 1,
1.72045, -1.270674, 2.137944, 1, 1, 1, 1, 1,
1.737888, 0.2685342, 1.954261, 1, 1, 1, 1, 1,
1.752017, -0.05943328, 0.02545922, 1, 1, 1, 1, 1,
1.797163, 0.746188, 0.07569004, 1, 1, 1, 1, 1,
1.806826, 0.5678086, 0.7002614, 1, 1, 1, 1, 1,
1.818617, 1.415573, 0.4605975, 1, 1, 1, 1, 1,
1.826392, -0.8784445, 0.4934173, 1, 1, 1, 1, 1,
1.833857, 0.146269, 1.245256, 1, 1, 1, 1, 1,
1.859024, -0.221165, 0.8664716, 1, 1, 1, 1, 1,
1.869432, -0.9983582, 2.040615, 1, 1, 1, 1, 1,
1.877436, -1.234926, 2.634988, 1, 1, 1, 1, 1,
1.878922, 0.9375687, 2.358156, 1, 1, 1, 1, 1,
1.889254, -0.2498963, 2.170723, 1, 1, 1, 1, 1,
1.945329, -0.564796, 1.107502, 1, 1, 1, 1, 1,
1.976231, -0.5914121, 1.548659, 0, 0, 1, 1, 1,
1.991681, 1.293962, -0.1355548, 1, 0, 0, 1, 1,
2.089181, 0.7977644, 1.616356, 1, 0, 0, 1, 1,
2.100839, -0.4358761, -0.1807129, 1, 0, 0, 1, 1,
2.140698, -0.3799686, 2.392082, 1, 0, 0, 1, 1,
2.166279, 1.664848, 0.837169, 1, 0, 0, 1, 1,
2.300322, -0.142908, 0.8890055, 0, 0, 0, 1, 1,
2.307635, 1.061486, -0.3471272, 0, 0, 0, 1, 1,
2.317234, 0.5237334, 0.7241331, 0, 0, 0, 1, 1,
2.339696, 1.975521, -2.247729, 0, 0, 0, 1, 1,
2.35879, -0.9367646, 1.83795, 0, 0, 0, 1, 1,
2.3596, -2.147845, 0.8615408, 0, 0, 0, 1, 1,
2.493123, 0.6977382, 0.008536263, 0, 0, 0, 1, 1,
2.516575, -0.1067103, 2.270667, 1, 1, 1, 1, 1,
2.557465, 0.9657586, 1.504075, 1, 1, 1, 1, 1,
2.653618, 1.716994, 0.9929172, 1, 1, 1, 1, 1,
2.70544, 1.146533, -0.120778, 1, 1, 1, 1, 1,
2.86023, -1.602986, 2.807976, 1, 1, 1, 1, 1,
2.923029, 1.210804, 0.0788364, 1, 1, 1, 1, 1,
2.936373, -0.8042583, 1.816667, 1, 1, 1, 1, 1
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
var radius = 9.529902;
var distance = 33.47338;
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
mvMatrix.translate( 0.1811854, -0.08940506, -0.03770232 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47338);
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
