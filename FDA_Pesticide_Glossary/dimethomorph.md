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
-2.649397, -0.4184065, -1.856797, 1, 0, 0, 1,
-2.645543, -0.3030926, -2.461164, 1, 0.007843138, 0, 1,
-2.43055, 2.755496, -0.2170814, 1, 0.01176471, 0, 1,
-2.329216, -0.1909121, -2.545591, 1, 0.01960784, 0, 1,
-2.323877, 0.9808963, -1.483937, 1, 0.02352941, 0, 1,
-2.259348, 0.2205236, -2.76513, 1, 0.03137255, 0, 1,
-2.209829, 0.1872803, -1.329017, 1, 0.03529412, 0, 1,
-2.201602, 0.994893, -0.438233, 1, 0.04313726, 0, 1,
-2.131307, -0.9012772, -1.081895, 1, 0.04705882, 0, 1,
-2.084181, -1.223983, -1.489936, 1, 0.05490196, 0, 1,
-2.042009, -0.3774199, -1.212711, 1, 0.05882353, 0, 1,
-2.035607, -1.651344, -3.425937, 1, 0.06666667, 0, 1,
-2.028951, -0.3384456, -1.75954, 1, 0.07058824, 0, 1,
-2.028714, -0.6793497, -0.3627699, 1, 0.07843138, 0, 1,
-2.011199, -0.2295905, -0.8377379, 1, 0.08235294, 0, 1,
-1.986239, -1.092954, -1.839656, 1, 0.09019608, 0, 1,
-1.982274, -0.9402783, -2.813634, 1, 0.09411765, 0, 1,
-1.977311, -0.2470579, -1.006199, 1, 0.1019608, 0, 1,
-1.973426, 0.3824309, -0.6384632, 1, 0.1098039, 0, 1,
-1.971266, 0.5324831, 0.6185653, 1, 0.1137255, 0, 1,
-1.970487, -1.570229, -5.133187, 1, 0.1215686, 0, 1,
-1.968128, -0.1428695, -1.93956, 1, 0.1254902, 0, 1,
-1.960459, 0.6290923, -1.714811, 1, 0.1333333, 0, 1,
-1.943885, -0.3218164, -1.143686, 1, 0.1372549, 0, 1,
-1.919561, -1.057055, -3.659067, 1, 0.145098, 0, 1,
-1.916532, 2.148299, -0.9484635, 1, 0.1490196, 0, 1,
-1.909953, 0.3382274, -2.660539, 1, 0.1568628, 0, 1,
-1.903272, -0.9121506, -2.271148, 1, 0.1607843, 0, 1,
-1.887557, 0.3664015, -0.3052848, 1, 0.1686275, 0, 1,
-1.870134, 1.481395, 0.617187, 1, 0.172549, 0, 1,
-1.863239, 0.6341413, -0.706938, 1, 0.1803922, 0, 1,
-1.854819, 1.591954, -0.4494628, 1, 0.1843137, 0, 1,
-1.853559, 0.1177031, 0.1267929, 1, 0.1921569, 0, 1,
-1.850722, 0.3084263, -0.6957134, 1, 0.1960784, 0, 1,
-1.849388, 0.1840375, -0.9368982, 1, 0.2039216, 0, 1,
-1.798403, 0.09970071, -2.647121, 1, 0.2117647, 0, 1,
-1.788011, -0.5460412, -0.5956745, 1, 0.2156863, 0, 1,
-1.787831, 0.04635369, -0.1305773, 1, 0.2235294, 0, 1,
-1.782051, 0.798817, -1.644353, 1, 0.227451, 0, 1,
-1.7723, 1.454381, -3.180365, 1, 0.2352941, 0, 1,
-1.772297, 0.9153562, -1.366407, 1, 0.2392157, 0, 1,
-1.697548, 0.362481, -2.70935, 1, 0.2470588, 0, 1,
-1.680672, -0.598379, -0.91027, 1, 0.2509804, 0, 1,
-1.668912, 0.932453, -2.029809, 1, 0.2588235, 0, 1,
-1.660637, -0.009647346, -1.961872, 1, 0.2627451, 0, 1,
-1.642179, 2.316898, -0.5568195, 1, 0.2705882, 0, 1,
-1.636462, 0.6562619, -2.025417, 1, 0.2745098, 0, 1,
-1.61403, -0.09827691, -1.331603, 1, 0.282353, 0, 1,
-1.612808, 0.1318107, -1.129606, 1, 0.2862745, 0, 1,
-1.61277, -0.4402382, -1.800679, 1, 0.2941177, 0, 1,
-1.604498, -0.2845943, -1.78005, 1, 0.3019608, 0, 1,
-1.598262, 0.4200313, -0.3709651, 1, 0.3058824, 0, 1,
-1.582696, 0.8394524, -0.6521695, 1, 0.3137255, 0, 1,
-1.576085, 0.9302087, -2.078356, 1, 0.3176471, 0, 1,
-1.57531, -1.728368, -2.573529, 1, 0.3254902, 0, 1,
-1.571049, -0.1247604, -2.251129, 1, 0.3294118, 0, 1,
-1.569627, -0.6305442, -1.916868, 1, 0.3372549, 0, 1,
-1.530935, 0.9147188, -2.441679, 1, 0.3411765, 0, 1,
-1.50698, 0.6142415, -1.827279, 1, 0.3490196, 0, 1,
-1.5044, 1.192876, -1.464389, 1, 0.3529412, 0, 1,
-1.503107, 0.09392721, -1.16997, 1, 0.3607843, 0, 1,
-1.495017, 0.1862017, 0.03400031, 1, 0.3647059, 0, 1,
-1.492988, -1.089342, -0.4517514, 1, 0.372549, 0, 1,
-1.490447, -1.298775, -1.020233, 1, 0.3764706, 0, 1,
-1.483149, -1.560179, -2.623257, 1, 0.3843137, 0, 1,
-1.483025, 0.4677867, -0.8978864, 1, 0.3882353, 0, 1,
-1.478271, 0.678085, -1.154694, 1, 0.3960784, 0, 1,
-1.474797, 0.5261418, -1.285792, 1, 0.4039216, 0, 1,
-1.461962, 0.02028258, -1.970194, 1, 0.4078431, 0, 1,
-1.460917, -0.6751646, -1.752394, 1, 0.4156863, 0, 1,
-1.448975, -1.351017, -2.979696, 1, 0.4196078, 0, 1,
-1.434007, 1.585901, -0.8510367, 1, 0.427451, 0, 1,
-1.422722, 1.470515, -0.4081816, 1, 0.4313726, 0, 1,
-1.41369, 0.01819009, -2.503048, 1, 0.4392157, 0, 1,
-1.412472, 0.05927856, -0.4130409, 1, 0.4431373, 0, 1,
-1.410431, 1.318524, -1.696425, 1, 0.4509804, 0, 1,
-1.40694, 0.5111066, -2.174141, 1, 0.454902, 0, 1,
-1.39304, 0.3787956, -1.434729, 1, 0.4627451, 0, 1,
-1.383356, 0.2083908, -3.007958, 1, 0.4666667, 0, 1,
-1.37734, -0.194208, -1.687829, 1, 0.4745098, 0, 1,
-1.376153, 0.3258098, -0.8394902, 1, 0.4784314, 0, 1,
-1.373993, -1.902871, -2.512198, 1, 0.4862745, 0, 1,
-1.350062, 0.4461477, -0.880671, 1, 0.4901961, 0, 1,
-1.343243, 1.798398, -1.37144, 1, 0.4980392, 0, 1,
-1.336044, 0.3013299, 0.9818491, 1, 0.5058824, 0, 1,
-1.332972, -0.05799797, -1.638443, 1, 0.509804, 0, 1,
-1.328966, 0.08556299, -0.05461729, 1, 0.5176471, 0, 1,
-1.301664, 0.5487801, -2.023287, 1, 0.5215687, 0, 1,
-1.282046, -1.34648, -2.856938, 1, 0.5294118, 0, 1,
-1.277017, 0.1596867, -0.7578788, 1, 0.5333334, 0, 1,
-1.27687, -0.458698, -2.905736, 1, 0.5411765, 0, 1,
-1.259866, -1.586203, -2.47135, 1, 0.5450981, 0, 1,
-1.258923, -0.170222, -2.0294, 1, 0.5529412, 0, 1,
-1.235783, -0.6740828, -0.06457758, 1, 0.5568628, 0, 1,
-1.235142, -0.5351779, -2.202865, 1, 0.5647059, 0, 1,
-1.230614, 0.2678851, -0.2645099, 1, 0.5686275, 0, 1,
-1.228177, 0.8525114, -0.5802588, 1, 0.5764706, 0, 1,
-1.225475, 1.094937, -1.312898, 1, 0.5803922, 0, 1,
-1.216435, -0.4943546, -1.06319, 1, 0.5882353, 0, 1,
-1.21284, -0.2522003, -1.959948, 1, 0.5921569, 0, 1,
-1.211651, -0.9114024, -1.72142, 1, 0.6, 0, 1,
-1.210473, -0.2659633, -1.622353, 1, 0.6078432, 0, 1,
-1.209619, 0.2766648, -1.456491, 1, 0.6117647, 0, 1,
-1.205249, 0.9233702, 0.01821976, 1, 0.6196079, 0, 1,
-1.204444, 0.3757327, -1.798447, 1, 0.6235294, 0, 1,
-1.19293, -0.4514397, -0.7481774, 1, 0.6313726, 0, 1,
-1.189704, -2.052869, -2.430574, 1, 0.6352941, 0, 1,
-1.187859, -2.391774, -3.252412, 1, 0.6431373, 0, 1,
-1.186143, -0.5896804, -1.113459, 1, 0.6470588, 0, 1,
-1.18515, 0.4895802, -0.6630114, 1, 0.654902, 0, 1,
-1.182598, -1.107908, -4.229243, 1, 0.6588235, 0, 1,
-1.17096, -0.591729, -0.08614495, 1, 0.6666667, 0, 1,
-1.168009, -0.2517592, 0.04493381, 1, 0.6705883, 0, 1,
-1.166093, -1.320447, -4.232073, 1, 0.6784314, 0, 1,
-1.164285, 0.7998796, -0.1248422, 1, 0.682353, 0, 1,
-1.162551, -2.161119, -2.771483, 1, 0.6901961, 0, 1,
-1.162321, -0.8058451, -2.58884, 1, 0.6941177, 0, 1,
-1.161289, -0.5229489, -4.029804, 1, 0.7019608, 0, 1,
-1.161188, 2.130575, -1.466838, 1, 0.7098039, 0, 1,
-1.15854, 1.01423, -1.586483, 1, 0.7137255, 0, 1,
-1.14861, 1.056716, -1.317584, 1, 0.7215686, 0, 1,
-1.141715, -1.329898, -1.018923, 1, 0.7254902, 0, 1,
-1.13907, 0.8065987, -0.2335449, 1, 0.7333333, 0, 1,
-1.130676, -0.4526754, -1.970717, 1, 0.7372549, 0, 1,
-1.125618, -1.032231, -2.55823, 1, 0.7450981, 0, 1,
-1.114172, -1.059334, -1.706493, 1, 0.7490196, 0, 1,
-1.112535, 1.951367, 0.1912256, 1, 0.7568628, 0, 1,
-1.105546, 1.016942, -0.08669826, 1, 0.7607843, 0, 1,
-1.100594, -0.7182778, -2.856967, 1, 0.7686275, 0, 1,
-1.098918, 0.1908456, -3.171264, 1, 0.772549, 0, 1,
-1.094033, 0.1707334, -0.6492423, 1, 0.7803922, 0, 1,
-1.088965, -0.05221031, -1.355052, 1, 0.7843137, 0, 1,
-1.086686, -0.4556519, -1.284017, 1, 0.7921569, 0, 1,
-1.086369, -1.837228, -3.287086, 1, 0.7960784, 0, 1,
-1.085234, 0.5039726, -1.325205, 1, 0.8039216, 0, 1,
-1.082892, 0.8051037, -0.6066732, 1, 0.8117647, 0, 1,
-1.078063, 0.7488611, -0.3242171, 1, 0.8156863, 0, 1,
-1.076305, 0.5255542, -0.1610709, 1, 0.8235294, 0, 1,
-1.072532, 0.5379183, -1.167133, 1, 0.827451, 0, 1,
-1.071695, 1.158804, -0.7890885, 1, 0.8352941, 0, 1,
-1.065472, -0.3025912, -3.48981, 1, 0.8392157, 0, 1,
-1.062373, 0.4741023, 0.08340438, 1, 0.8470588, 0, 1,
-1.056866, 0.6584176, -1.439641, 1, 0.8509804, 0, 1,
-1.052934, -0.3313809, 0.5565532, 1, 0.8588235, 0, 1,
-1.047193, 0.2850322, 0.1690957, 1, 0.8627451, 0, 1,
-1.046752, 1.356, 0.3812496, 1, 0.8705882, 0, 1,
-1.044719, -1.302693, -1.640278, 1, 0.8745098, 0, 1,
-1.043365, 0.5251339, -0.0261233, 1, 0.8823529, 0, 1,
-1.037584, 1.695072, 1.29364, 1, 0.8862745, 0, 1,
-1.03659, -1.050823, -1.509828, 1, 0.8941177, 0, 1,
-1.034062, -1.298912, -1.689982, 1, 0.8980392, 0, 1,
-1.022021, 0.3442028, -0.3156409, 1, 0.9058824, 0, 1,
-1.001677, 0.08474141, -2.070578, 1, 0.9137255, 0, 1,
-1.00153, 0.2137968, -1.850033, 1, 0.9176471, 0, 1,
-0.9843817, -0.8502244, -5.228494, 1, 0.9254902, 0, 1,
-0.9759692, 0.1952382, -2.209295, 1, 0.9294118, 0, 1,
-0.9745015, -0.5063748, -1.195529, 1, 0.9372549, 0, 1,
-0.9735149, -0.9586274, -3.045976, 1, 0.9411765, 0, 1,
-0.9689408, -0.6490532, -3.16532, 1, 0.9490196, 0, 1,
-0.962617, 0.04472966, -0.0002850761, 1, 0.9529412, 0, 1,
-0.9621441, -0.1111073, -3.405261, 1, 0.9607843, 0, 1,
-0.9603047, 0.5219463, -1.804403, 1, 0.9647059, 0, 1,
-0.9560528, -0.9540858, -1.976846, 1, 0.972549, 0, 1,
-0.9542814, -0.9300678, -1.616021, 1, 0.9764706, 0, 1,
-0.9516947, 0.9210317, -1.038311, 1, 0.9843137, 0, 1,
-0.9511818, 1.020144, 1.006471, 1, 0.9882353, 0, 1,
-0.9495334, 0.09471951, -1.964577, 1, 0.9960784, 0, 1,
-0.9489954, 1.86996, -2.75913, 0.9960784, 1, 0, 1,
-0.9472185, -0.4547441, -2.981703, 0.9921569, 1, 0, 1,
-0.9434678, -1.480017, -1.995801, 0.9843137, 1, 0, 1,
-0.9407465, -0.5259194, -1.701988, 0.9803922, 1, 0, 1,
-0.9390556, -1.059875, -2.255257, 0.972549, 1, 0, 1,
-0.9358572, -1.225961, -3.975734, 0.9686275, 1, 0, 1,
-0.9351907, 0.4172789, -1.370766, 0.9607843, 1, 0, 1,
-0.9304124, -0.1230881, -1.399721, 0.9568627, 1, 0, 1,
-0.9260813, -0.4679853, -2.118755, 0.9490196, 1, 0, 1,
-0.925499, -1.060417, -0.5921325, 0.945098, 1, 0, 1,
-0.9252183, -0.4819625, -3.110939, 0.9372549, 1, 0, 1,
-0.9251902, 1.869031, 0.4227355, 0.9333333, 1, 0, 1,
-0.9209191, -0.2551087, -2.826073, 0.9254902, 1, 0, 1,
-0.9170805, 0.7468952, 0.8411712, 0.9215686, 1, 0, 1,
-0.9160407, -1.429483, -3.907869, 0.9137255, 1, 0, 1,
-0.9096863, -0.2761093, -3.542169, 0.9098039, 1, 0, 1,
-0.9065456, -0.5500248, -3.045178, 0.9019608, 1, 0, 1,
-0.9023708, 1.320895, 0.9648867, 0.8941177, 1, 0, 1,
-0.9003732, -0.2122289, -1.10475, 0.8901961, 1, 0, 1,
-0.898429, 0.03085651, -2.776902, 0.8823529, 1, 0, 1,
-0.8951816, -0.1212338, -3.110712, 0.8784314, 1, 0, 1,
-0.8922781, 0.3539336, 1.394318, 0.8705882, 1, 0, 1,
-0.8820068, 2.057201, 1.323516, 0.8666667, 1, 0, 1,
-0.8812584, -0.4362595, -3.62717, 0.8588235, 1, 0, 1,
-0.8700289, -1.502877, -1.597661, 0.854902, 1, 0, 1,
-0.8667212, -0.2313581, -1.186579, 0.8470588, 1, 0, 1,
-0.8656085, -0.8281156, -1.737244, 0.8431373, 1, 0, 1,
-0.864971, -0.3525503, -2.467532, 0.8352941, 1, 0, 1,
-0.8597956, 1.252886, -0.09422276, 0.8313726, 1, 0, 1,
-0.8554338, 1.645177, -1.000612, 0.8235294, 1, 0, 1,
-0.8374267, 0.5836947, 0.2873935, 0.8196079, 1, 0, 1,
-0.8306176, -0.07191519, 0.03216941, 0.8117647, 1, 0, 1,
-0.8262879, 0.5586523, -1.271125, 0.8078431, 1, 0, 1,
-0.8259742, 0.9399423, 0.1367334, 0.8, 1, 0, 1,
-0.8228595, 0.5355293, -2.043691, 0.7921569, 1, 0, 1,
-0.8181823, -0.05766224, -3.969372, 0.7882353, 1, 0, 1,
-0.8054579, 1.739955, -0.8727347, 0.7803922, 1, 0, 1,
-0.8006798, -0.2151202, -2.002193, 0.7764706, 1, 0, 1,
-0.7979863, -0.8676272, -1.152715, 0.7686275, 1, 0, 1,
-0.7976715, 0.4758071, -1.770504, 0.7647059, 1, 0, 1,
-0.7895905, -1.494966, -3.969298, 0.7568628, 1, 0, 1,
-0.7874987, -0.4727157, -2.785298, 0.7529412, 1, 0, 1,
-0.779691, -0.2227318, -1.41761, 0.7450981, 1, 0, 1,
-0.7645234, 0.7277076, -0.1388744, 0.7411765, 1, 0, 1,
-0.7641661, -0.196535, -2.429767, 0.7333333, 1, 0, 1,
-0.7539054, -0.3603641, -4.091722, 0.7294118, 1, 0, 1,
-0.7532518, 0.09710935, -2.17762, 0.7215686, 1, 0, 1,
-0.7526027, -2.502794, -2.400292, 0.7176471, 1, 0, 1,
-0.746637, -0.6955513, -2.948368, 0.7098039, 1, 0, 1,
-0.7447429, -0.7897583, -2.838929, 0.7058824, 1, 0, 1,
-0.7407335, -0.8507147, -1.583423, 0.6980392, 1, 0, 1,
-0.7396669, -0.398831, -3.953601, 0.6901961, 1, 0, 1,
-0.7342315, 0.7181501, -0.4386973, 0.6862745, 1, 0, 1,
-0.7332783, 0.3271974, -1.850125, 0.6784314, 1, 0, 1,
-0.7282815, 1.674492, 0.7761828, 0.6745098, 1, 0, 1,
-0.727419, 0.7293116, -0.5230691, 0.6666667, 1, 0, 1,
-0.7212901, 0.5027069, -2.427327, 0.6627451, 1, 0, 1,
-0.7209693, 1.361792, -0.03931694, 0.654902, 1, 0, 1,
-0.7185839, 0.2282365, -0.3861834, 0.6509804, 1, 0, 1,
-0.7171389, 0.3848677, -1.848167, 0.6431373, 1, 0, 1,
-0.7167635, 0.6197461, -0.6254804, 0.6392157, 1, 0, 1,
-0.7016686, 0.05173513, -0.4396917, 0.6313726, 1, 0, 1,
-0.7006552, -0.63164, -4.075341, 0.627451, 1, 0, 1,
-0.7001473, 0.3141817, -0.9336314, 0.6196079, 1, 0, 1,
-0.6992978, 0.5052858, 0.8394457, 0.6156863, 1, 0, 1,
-0.6979151, -1.049504, -1.494218, 0.6078432, 1, 0, 1,
-0.6929051, 1.09251, -0.7792805, 0.6039216, 1, 0, 1,
-0.6895102, -0.4684246, -2.346655, 0.5960785, 1, 0, 1,
-0.6878501, -1.156503, -1.780792, 0.5882353, 1, 0, 1,
-0.6825737, -1.548924, -2.006625, 0.5843138, 1, 0, 1,
-0.6819909, 1.798265, -0.6127756, 0.5764706, 1, 0, 1,
-0.6810747, -0.2422195, -0.9587679, 0.572549, 1, 0, 1,
-0.6748817, -1.087897, -3.53647, 0.5647059, 1, 0, 1,
-0.6729816, 0.7833008, -1.700071, 0.5607843, 1, 0, 1,
-0.6677089, 0.3875732, -2.989777, 0.5529412, 1, 0, 1,
-0.664312, 0.772527, -2.285026, 0.5490196, 1, 0, 1,
-0.6621711, -1.253255, -1.896207, 0.5411765, 1, 0, 1,
-0.6592643, 0.5894433, -1.745178, 0.5372549, 1, 0, 1,
-0.6578471, 1.475621, -0.9408411, 0.5294118, 1, 0, 1,
-0.6574257, 0.8917257, -0.7846975, 0.5254902, 1, 0, 1,
-0.6569126, 0.9577379, 0.9140955, 0.5176471, 1, 0, 1,
-0.6562492, 0.1782159, -2.637975, 0.5137255, 1, 0, 1,
-0.6554955, -1.447605, -2.848622, 0.5058824, 1, 0, 1,
-0.6534055, 0.8755552, 1.501238, 0.5019608, 1, 0, 1,
-0.6459934, -0.2266455, -2.766112, 0.4941176, 1, 0, 1,
-0.6356906, -1.207647, -3.608704, 0.4862745, 1, 0, 1,
-0.6342887, -0.2412195, -1.618594, 0.4823529, 1, 0, 1,
-0.6290939, 2.032492, 0.2873145, 0.4745098, 1, 0, 1,
-0.6255912, 1.27402, 0.09645961, 0.4705882, 1, 0, 1,
-0.6214551, 1.220692, -0.9644584, 0.4627451, 1, 0, 1,
-0.6195782, 0.3035998, -3.014426, 0.4588235, 1, 0, 1,
-0.6189519, 0.08829046, 0.6389638, 0.4509804, 1, 0, 1,
-0.6181077, -0.06608874, -0.8808784, 0.4470588, 1, 0, 1,
-0.6144431, -1.69694, -3.255529, 0.4392157, 1, 0, 1,
-0.6142661, -0.6730106, -1.495623, 0.4352941, 1, 0, 1,
-0.6125977, -0.2382428, -1.281469, 0.427451, 1, 0, 1,
-0.612265, -0.3975072, -2.555911, 0.4235294, 1, 0, 1,
-0.6099052, 0.4518813, -0.1578819, 0.4156863, 1, 0, 1,
-0.6097553, 0.9073016, -0.8424031, 0.4117647, 1, 0, 1,
-0.6091223, 0.3350344, -2.010509, 0.4039216, 1, 0, 1,
-0.6080837, 0.02905418, -1.961822, 0.3960784, 1, 0, 1,
-0.6061437, -1.013225, -0.6306621, 0.3921569, 1, 0, 1,
-0.6003096, -1.084561, -2.376616, 0.3843137, 1, 0, 1,
-0.5974234, 0.3101321, -1.433246, 0.3803922, 1, 0, 1,
-0.5968843, 0.8800395, -1.129518, 0.372549, 1, 0, 1,
-0.5963229, 2.493423, -0.1461043, 0.3686275, 1, 0, 1,
-0.5938397, -0.1497652, -0.4239096, 0.3607843, 1, 0, 1,
-0.5925879, 1.350533, -0.336357, 0.3568628, 1, 0, 1,
-0.591551, -2.303447, -2.696202, 0.3490196, 1, 0, 1,
-0.5848246, 0.2067573, -0.9221425, 0.345098, 1, 0, 1,
-0.5839528, -1.469333, -1.688389, 0.3372549, 1, 0, 1,
-0.5803554, -0.9682725, -2.780615, 0.3333333, 1, 0, 1,
-0.579974, 0.5969583, 0.6271163, 0.3254902, 1, 0, 1,
-0.5771844, 0.3845586, -0.3117538, 0.3215686, 1, 0, 1,
-0.575791, -1.740686, -1.644447, 0.3137255, 1, 0, 1,
-0.5750564, 1.576445, -0.4225768, 0.3098039, 1, 0, 1,
-0.573943, -0.6477879, -2.133476, 0.3019608, 1, 0, 1,
-0.5715592, -2.004769, -3.42972, 0.2941177, 1, 0, 1,
-0.5674681, -0.7292295, -2.722655, 0.2901961, 1, 0, 1,
-0.5655377, 0.4703133, -1.192288, 0.282353, 1, 0, 1,
-0.5653906, 0.282827, -0.1689818, 0.2784314, 1, 0, 1,
-0.564687, -0.4741427, -2.172964, 0.2705882, 1, 0, 1,
-0.5636141, -1.230372, -3.226072, 0.2666667, 1, 0, 1,
-0.5621046, 0.6492271, -0.9360608, 0.2588235, 1, 0, 1,
-0.5605618, -1.323984, -2.398432, 0.254902, 1, 0, 1,
-0.5602358, 0.4319582, -0.3845398, 0.2470588, 1, 0, 1,
-0.5599162, -0.2112755, -2.230769, 0.2431373, 1, 0, 1,
-0.5554157, -0.2922216, -2.039236, 0.2352941, 1, 0, 1,
-0.553956, 0.5897897, -0.4199122, 0.2313726, 1, 0, 1,
-0.5520169, -1.536851, -1.99109, 0.2235294, 1, 0, 1,
-0.5512181, -0.8718883, -1.963072, 0.2196078, 1, 0, 1,
-0.5503676, -1.031374, -3.60723, 0.2117647, 1, 0, 1,
-0.5500138, 1.615184, -0.07162553, 0.2078431, 1, 0, 1,
-0.5498981, -0.4339211, -2.735119, 0.2, 1, 0, 1,
-0.5454057, -0.3466228, -3.394014, 0.1921569, 1, 0, 1,
-0.5384623, -0.6065236, -2.552618, 0.1882353, 1, 0, 1,
-0.5368823, -1.390986, -3.033704, 0.1803922, 1, 0, 1,
-0.5356591, 1.647081, 2.298563, 0.1764706, 1, 0, 1,
-0.5294724, 0.7484486, -1.838017, 0.1686275, 1, 0, 1,
-0.5292482, -2.118135, -3.637705, 0.1647059, 1, 0, 1,
-0.5236619, 0.6394811, -2.645918, 0.1568628, 1, 0, 1,
-0.5161797, -0.1592379, -3.236573, 0.1529412, 1, 0, 1,
-0.5143355, 1.664208, -2.299569, 0.145098, 1, 0, 1,
-0.5133319, -1.732928, -2.848821, 0.1411765, 1, 0, 1,
-0.5117021, 0.1567494, -2.611374, 0.1333333, 1, 0, 1,
-0.5071264, -0.3283069, -0.7334292, 0.1294118, 1, 0, 1,
-0.5063267, 1.995157, 1.753863, 0.1215686, 1, 0, 1,
-0.5035541, 0.9847497, -1.099924, 0.1176471, 1, 0, 1,
-0.5023219, -0.5829648, -1.587688, 0.1098039, 1, 0, 1,
-0.5015162, 1.63856, 0.2759783, 0.1058824, 1, 0, 1,
-0.5008659, 0.2780546, -3.565882, 0.09803922, 1, 0, 1,
-0.4996423, -0.671307, -3.86603, 0.09019608, 1, 0, 1,
-0.4985385, -0.6403195, -1.616769, 0.08627451, 1, 0, 1,
-0.4968577, 1.860627, -0.6625195, 0.07843138, 1, 0, 1,
-0.496282, -0.7924591, -4.722361, 0.07450981, 1, 0, 1,
-0.4953239, -0.4132363, -1.406953, 0.06666667, 1, 0, 1,
-0.4953213, 0.2668662, -0.6417574, 0.0627451, 1, 0, 1,
-0.4949145, 1.513888, -0.7874131, 0.05490196, 1, 0, 1,
-0.4904773, 0.7176716, -1.560706, 0.05098039, 1, 0, 1,
-0.4902378, 1.187254, 1.145279, 0.04313726, 1, 0, 1,
-0.4893205, 1.820014, -0.7118398, 0.03921569, 1, 0, 1,
-0.4847486, -0.4061679, -2.417348, 0.03137255, 1, 0, 1,
-0.4845153, 0.4777941, -0.01966835, 0.02745098, 1, 0, 1,
-0.4833845, -0.9766858, -3.396446, 0.01960784, 1, 0, 1,
-0.4744407, 0.8808752, -0.5795636, 0.01568628, 1, 0, 1,
-0.4716262, 0.7095622, 0.001640455, 0.007843138, 1, 0, 1,
-0.4590579, -0.5052686, -2.853772, 0.003921569, 1, 0, 1,
-0.4586838, -0.06941433, -1.729205, 0, 1, 0.003921569, 1,
-0.451366, 1.819588, 1.25474, 0, 1, 0.01176471, 1,
-0.4509163, -0.4579279, -1.585099, 0, 1, 0.01568628, 1,
-0.4496427, -0.8975634, -4.140616, 0, 1, 0.02352941, 1,
-0.4474332, -1.302796, -4.565193, 0, 1, 0.02745098, 1,
-0.4430018, -0.5410714, -1.178667, 0, 1, 0.03529412, 1,
-0.4352363, -0.1007865, 0.5142437, 0, 1, 0.03921569, 1,
-0.4329249, 1.839224, 1.532476, 0, 1, 0.04705882, 1,
-0.428831, 0.8244707, -0.3581747, 0, 1, 0.05098039, 1,
-0.4225501, 0.1819467, -1.593267, 0, 1, 0.05882353, 1,
-0.4211564, 0.5952905, 0.1755721, 0, 1, 0.0627451, 1,
-0.4160344, 0.4030197, -1.136476, 0, 1, 0.07058824, 1,
-0.4158704, 0.531064, -1.65377, 0, 1, 0.07450981, 1,
-0.4074529, -0.6340167, -4.213926, 0, 1, 0.08235294, 1,
-0.4060055, -1.036472, -2.577619, 0, 1, 0.08627451, 1,
-0.402386, -1.137721, -2.705698, 0, 1, 0.09411765, 1,
-0.4019613, 0.3630358, -0.01231567, 0, 1, 0.1019608, 1,
-0.3983717, -0.1020903, -2.977562, 0, 1, 0.1058824, 1,
-0.3940802, -0.9875056, -2.919319, 0, 1, 0.1137255, 1,
-0.3934378, 0.8928475, -1.903047, 0, 1, 0.1176471, 1,
-0.3919995, 0.07940524, -1.421653, 0, 1, 0.1254902, 1,
-0.3918652, -0.8156862, -1.964528, 0, 1, 0.1294118, 1,
-0.3805841, -1.019239, -3.654698, 0, 1, 0.1372549, 1,
-0.3805119, -1.296151, -2.218704, 0, 1, 0.1411765, 1,
-0.3804785, -1.627662, -2.302525, 0, 1, 0.1490196, 1,
-0.3804514, -0.4098961, -2.238574, 0, 1, 0.1529412, 1,
-0.3804194, 1.205457, 0.3515526, 0, 1, 0.1607843, 1,
-0.3798054, 1.160983, 1.421502, 0, 1, 0.1647059, 1,
-0.3770406, 0.2147009, -2.625299, 0, 1, 0.172549, 1,
-0.3735219, -0.9850627, -3.965245, 0, 1, 0.1764706, 1,
-0.3707785, 0.1672943, 0.1676434, 0, 1, 0.1843137, 1,
-0.364065, 0.4204379, -0.7380328, 0, 1, 0.1882353, 1,
-0.3503504, -1.345839, -2.537561, 0, 1, 0.1960784, 1,
-0.3498695, 0.7111921, -0.1849943, 0, 1, 0.2039216, 1,
-0.3424629, 0.08142672, -1.779229, 0, 1, 0.2078431, 1,
-0.3415045, -0.824445, -3.41969, 0, 1, 0.2156863, 1,
-0.3404282, -0.2327052, -3.334103, 0, 1, 0.2196078, 1,
-0.3351741, 0.8228074, 1.351479, 0, 1, 0.227451, 1,
-0.335113, 0.1651368, -1.099789, 0, 1, 0.2313726, 1,
-0.3338657, 0.7850892, -0.9320978, 0, 1, 0.2392157, 1,
-0.3337646, 2.00355, 0.1196589, 0, 1, 0.2431373, 1,
-0.3337071, -0.1331595, -0.5897121, 0, 1, 0.2509804, 1,
-0.3302463, -1.620601, -2.846368, 0, 1, 0.254902, 1,
-0.3281586, 0.2727723, -0.3802797, 0, 1, 0.2627451, 1,
-0.3262663, 0.3096256, -2.550915, 0, 1, 0.2666667, 1,
-0.3258729, -1.248809, -3.238146, 0, 1, 0.2745098, 1,
-0.3195847, -0.5137013, -3.672382, 0, 1, 0.2784314, 1,
-0.3178642, 0.1465985, 0.2256712, 0, 1, 0.2862745, 1,
-0.3175173, 1.019658, -0.2627624, 0, 1, 0.2901961, 1,
-0.3147297, -0.1917487, -2.955415, 0, 1, 0.2980392, 1,
-0.3126619, -0.8881668, -1.570055, 0, 1, 0.3058824, 1,
-0.3121946, -0.417808, -2.243577, 0, 1, 0.3098039, 1,
-0.3080082, 1.555889, 0.03678086, 0, 1, 0.3176471, 1,
-0.3061383, 0.6302819, -0.4518263, 0, 1, 0.3215686, 1,
-0.3048115, 0.001144571, -0.7982768, 0, 1, 0.3294118, 1,
-0.2976805, -0.6934441, -1.756721, 0, 1, 0.3333333, 1,
-0.2957589, -2.654731, -2.359909, 0, 1, 0.3411765, 1,
-0.2957019, 1.552978, -0.1175735, 0, 1, 0.345098, 1,
-0.2946796, -0.2735742, -0.6992444, 0, 1, 0.3529412, 1,
-0.2934986, 0.07472027, -0.3124374, 0, 1, 0.3568628, 1,
-0.2934718, -1.456634, -2.510647, 0, 1, 0.3647059, 1,
-0.2896547, -0.9578083, -1.745756, 0, 1, 0.3686275, 1,
-0.2782195, 0.2832883, -2.476653, 0, 1, 0.3764706, 1,
-0.2768129, 0.2790909, -1.386979, 0, 1, 0.3803922, 1,
-0.2747746, 0.8728914, -0.2999585, 0, 1, 0.3882353, 1,
-0.2716265, -0.8535519, -2.981987, 0, 1, 0.3921569, 1,
-0.2708388, 0.7365889, -0.9286665, 0, 1, 0.4, 1,
-0.2655512, -2.29699, -3.060792, 0, 1, 0.4078431, 1,
-0.2644801, 0.3883059, -1.848664, 0, 1, 0.4117647, 1,
-0.2614318, -0.2363904, -0.3367261, 0, 1, 0.4196078, 1,
-0.2561285, -0.5460321, -4.260818, 0, 1, 0.4235294, 1,
-0.2514405, -0.9486341, -2.041979, 0, 1, 0.4313726, 1,
-0.2472744, 2.064647, -0.5551669, 0, 1, 0.4352941, 1,
-0.2422405, 0.6466033, -0.80871, 0, 1, 0.4431373, 1,
-0.2419865, -0.6707823, -4.509944, 0, 1, 0.4470588, 1,
-0.2410762, 1.234458, -0.1511992, 0, 1, 0.454902, 1,
-0.2406338, 0.8731879, -1.479673, 0, 1, 0.4588235, 1,
-0.2388585, 0.03866752, -1.534781, 0, 1, 0.4666667, 1,
-0.2358053, 1.351913, -0.01109814, 0, 1, 0.4705882, 1,
-0.2325297, -0.7300472, -3.09718, 0, 1, 0.4784314, 1,
-0.2310447, -1.301496, -3.749137, 0, 1, 0.4823529, 1,
-0.2306497, -0.2316581, -1.486147, 0, 1, 0.4901961, 1,
-0.2301955, -0.5933457, -1.764686, 0, 1, 0.4941176, 1,
-0.2289179, 0.09650284, -1.647488, 0, 1, 0.5019608, 1,
-0.2197119, 0.5024986, -1.164851, 0, 1, 0.509804, 1,
-0.2178251, 0.7134972, -1.018852, 0, 1, 0.5137255, 1,
-0.2148426, 0.7894745, 0.04568614, 0, 1, 0.5215687, 1,
-0.2146996, -0.6383185, -1.800982, 0, 1, 0.5254902, 1,
-0.2098487, 0.1226668, -0.407441, 0, 1, 0.5333334, 1,
-0.2096486, 1.754974, -0.8639741, 0, 1, 0.5372549, 1,
-0.2084826, 0.1053822, 1.197202, 0, 1, 0.5450981, 1,
-0.2079784, 1.793494, -0.8446578, 0, 1, 0.5490196, 1,
-0.2077219, -0.4641956, -3.89168, 0, 1, 0.5568628, 1,
-0.2063228, -0.856643, -2.260525, 0, 1, 0.5607843, 1,
-0.2042663, -0.1818874, -1.497772, 0, 1, 0.5686275, 1,
-0.2024031, -0.803816, -2.693307, 0, 1, 0.572549, 1,
-0.1958318, 0.2556985, -1.955382, 0, 1, 0.5803922, 1,
-0.1908341, -0.7016621, -3.45853, 0, 1, 0.5843138, 1,
-0.1824964, 0.4327332, -2.122857, 0, 1, 0.5921569, 1,
-0.1779017, 0.7427144, -0.05079284, 0, 1, 0.5960785, 1,
-0.1639315, 0.6502222, -2.119549, 0, 1, 0.6039216, 1,
-0.160219, 0.6838335, 0.4664969, 0, 1, 0.6117647, 1,
-0.1583342, 0.5720562, 0.4062527, 0, 1, 0.6156863, 1,
-0.1562093, 0.7653782, -1.170927, 0, 1, 0.6235294, 1,
-0.1540092, -0.5664751, -1.665265, 0, 1, 0.627451, 1,
-0.153121, -0.1657118, -2.513098, 0, 1, 0.6352941, 1,
-0.1496592, 1.22538, 1.614752, 0, 1, 0.6392157, 1,
-0.1443158, -0.2132212, -3.748505, 0, 1, 0.6470588, 1,
-0.1401156, 0.2986039, -0.8925632, 0, 1, 0.6509804, 1,
-0.1389444, -0.2805393, -3.211128, 0, 1, 0.6588235, 1,
-0.1374894, -0.344434, -1.324264, 0, 1, 0.6627451, 1,
-0.136389, -0.0589737, -0.7378159, 0, 1, 0.6705883, 1,
-0.1297743, -0.5644786, -1.940975, 0, 1, 0.6745098, 1,
-0.1268449, 0.04555773, -2.52561, 0, 1, 0.682353, 1,
-0.1265581, -1.349613, -3.087115, 0, 1, 0.6862745, 1,
-0.1261734, -0.6298376, -2.749604, 0, 1, 0.6941177, 1,
-0.1256377, -0.9948854, -0.7360119, 0, 1, 0.7019608, 1,
-0.1170775, 0.177212, -0.05854901, 0, 1, 0.7058824, 1,
-0.116522, 0.1164345, -1.242124, 0, 1, 0.7137255, 1,
-0.1087127, 1.365859, -0.6104694, 0, 1, 0.7176471, 1,
-0.1062974, -0.7574589, -5.142198, 0, 1, 0.7254902, 1,
-0.104866, -0.9836099, -3.495888, 0, 1, 0.7294118, 1,
-0.1035966, 0.6382763, -0.2437021, 0, 1, 0.7372549, 1,
-0.1029789, -0.3685732, -2.682489, 0, 1, 0.7411765, 1,
-0.1011273, -2.713968, -4.018512, 0, 1, 0.7490196, 1,
-0.0924394, -0.1186803, -3.426165, 0, 1, 0.7529412, 1,
-0.09171144, -0.4757293, -4.653983, 0, 1, 0.7607843, 1,
-0.08872078, 0.719269, -0.5102394, 0, 1, 0.7647059, 1,
-0.08834451, -0.1186985, -1.290155, 0, 1, 0.772549, 1,
-0.08529842, 1.209426, 0.2201905, 0, 1, 0.7764706, 1,
-0.08375965, 1.585446, -0.09694909, 0, 1, 0.7843137, 1,
-0.08184069, -0.762843, -1.991775, 0, 1, 0.7882353, 1,
-0.08130111, -0.1877875, -4.225373, 0, 1, 0.7960784, 1,
-0.07828924, 0.1695521, -0.2655451, 0, 1, 0.8039216, 1,
-0.07805867, 0.1795984, -0.8646643, 0, 1, 0.8078431, 1,
-0.07672758, -1.296918, -2.932811, 0, 1, 0.8156863, 1,
-0.07124297, -0.06420806, -2.225169, 0, 1, 0.8196079, 1,
-0.07008148, -1.0891, -2.421309, 0, 1, 0.827451, 1,
-0.06964575, 0.9828711, 0.5388473, 0, 1, 0.8313726, 1,
-0.06950763, -1.28748, -3.199179, 0, 1, 0.8392157, 1,
-0.06505615, 0.6208885, 0.1727498, 0, 1, 0.8431373, 1,
-0.06487958, -1.43823, -3.007284, 0, 1, 0.8509804, 1,
-0.06355444, 1.327717, 1.703071, 0, 1, 0.854902, 1,
-0.06103118, 0.3765604, 0.7041863, 0, 1, 0.8627451, 1,
-0.06026313, 1.221895, -0.02632704, 0, 1, 0.8666667, 1,
-0.05755327, 0.3764297, -1.850422, 0, 1, 0.8745098, 1,
-0.05261328, -0.7098342, -1.246407, 0, 1, 0.8784314, 1,
-0.04780288, 0.245298, -1.172608, 0, 1, 0.8862745, 1,
-0.04542556, -1.153685, -3.534127, 0, 1, 0.8901961, 1,
-0.0436141, 1.722588, -1.386426, 0, 1, 0.8980392, 1,
-0.03777803, -1.055429, -2.68089, 0, 1, 0.9058824, 1,
-0.03693058, -1.131592, -4.425071, 0, 1, 0.9098039, 1,
-0.03564002, 1.514835, -0.3600944, 0, 1, 0.9176471, 1,
-0.03479888, 0.4123258, -1.243783, 0, 1, 0.9215686, 1,
-0.02956217, -1.174825, -2.467389, 0, 1, 0.9294118, 1,
-0.02839645, 0.5006579, -1.222416, 0, 1, 0.9333333, 1,
-0.02095693, -0.7383628, -2.347932, 0, 1, 0.9411765, 1,
-0.02057519, 1.953172, -0.93924, 0, 1, 0.945098, 1,
-0.01752287, -0.8449468, -2.409002, 0, 1, 0.9529412, 1,
-0.01712698, 1.333712, 1.15713, 0, 1, 0.9568627, 1,
-0.01541159, 0.5551624, -1.112178, 0, 1, 0.9647059, 1,
-0.01172856, -0.9006419, -4.235706, 0, 1, 0.9686275, 1,
-0.009514607, -0.1176858, -2.992852, 0, 1, 0.9764706, 1,
-0.008054707, -0.1803367, -3.145366, 0, 1, 0.9803922, 1,
-0.007714715, 1.152614, -1.015098, 0, 1, 0.9882353, 1,
-0.007500339, 1.040194, -0.4363506, 0, 1, 0.9921569, 1,
-0.006486687, 0.24099, -0.3458983, 0, 1, 1, 1,
-0.00448285, 0.8535816, 0.03020055, 0, 0.9921569, 1, 1,
-0.002394096, 1.859717, -0.6158463, 0, 0.9882353, 1, 1,
0.004022206, -1.287024, 3.269942, 0, 0.9803922, 1, 1,
0.006619063, 0.4507245, -1.586572, 0, 0.9764706, 1, 1,
0.007134181, -0.2324589, 4.097438, 0, 0.9686275, 1, 1,
0.008330943, -0.5225196, 1.948264, 0, 0.9647059, 1, 1,
0.009305903, -0.9070749, 3.583129, 0, 0.9568627, 1, 1,
0.02192739, 2.365078, -1.423177, 0, 0.9529412, 1, 1,
0.02392758, -0.6639833, 4.86644, 0, 0.945098, 1, 1,
0.02483228, 0.6908162, -0.586657, 0, 0.9411765, 1, 1,
0.02505511, -0.8898516, 3.526433, 0, 0.9333333, 1, 1,
0.03054138, 0.3372441, 0.07983928, 0, 0.9294118, 1, 1,
0.0319294, 1.577992, -0.05696518, 0, 0.9215686, 1, 1,
0.03238194, -0.3341407, 0.8173447, 0, 0.9176471, 1, 1,
0.03259817, 0.5787121, -1.556289, 0, 0.9098039, 1, 1,
0.0339949, -0.8863019, 4.764327, 0, 0.9058824, 1, 1,
0.03655042, -0.2144636, 2.17255, 0, 0.8980392, 1, 1,
0.03710388, -0.8244921, 4.084918, 0, 0.8901961, 1, 1,
0.04187219, -0.6989238, 3.042191, 0, 0.8862745, 1, 1,
0.04318497, -0.02788862, 2.659698, 0, 0.8784314, 1, 1,
0.04560284, 1.591746, -0.5136942, 0, 0.8745098, 1, 1,
0.04720457, -0.1449292, 3.097522, 0, 0.8666667, 1, 1,
0.05070043, -0.7058574, 2.551353, 0, 0.8627451, 1, 1,
0.07035897, -0.9736069, 5.255057, 0, 0.854902, 1, 1,
0.07134984, 1.52391, -1.8807, 0, 0.8509804, 1, 1,
0.07297458, -1.004499, 4.24272, 0, 0.8431373, 1, 1,
0.07496409, 2.267077, -0.7595331, 0, 0.8392157, 1, 1,
0.07549433, -1.309452, 5.356254, 0, 0.8313726, 1, 1,
0.07601754, -0.198935, 1.32666, 0, 0.827451, 1, 1,
0.07896542, -0.7250597, 3.745911, 0, 0.8196079, 1, 1,
0.07981065, -0.6209499, 3.172478, 0, 0.8156863, 1, 1,
0.08049148, 1.125743, 0.2205819, 0, 0.8078431, 1, 1,
0.08054844, -1.385289, 4.251457, 0, 0.8039216, 1, 1,
0.08146843, 0.001263512, 1.626691, 0, 0.7960784, 1, 1,
0.08489885, -1.23169, 2.368441, 0, 0.7882353, 1, 1,
0.09519884, 0.280264, -0.6073416, 0, 0.7843137, 1, 1,
0.09640611, 2.428488, -3.029838, 0, 0.7764706, 1, 1,
0.09729826, 0.4407372, 2.613152, 0, 0.772549, 1, 1,
0.0979008, -1.146364, 2.837166, 0, 0.7647059, 1, 1,
0.1001447, 1.130902, 0.5633461, 0, 0.7607843, 1, 1,
0.1058146, 0.8487819, 0.2114198, 0, 0.7529412, 1, 1,
0.1064374, 1.043267, 1.668567, 0, 0.7490196, 1, 1,
0.1066539, -0.633374, 2.008028, 0, 0.7411765, 1, 1,
0.1114136, -0.5093571, 4.438355, 0, 0.7372549, 1, 1,
0.112324, -0.9104904, 2.670729, 0, 0.7294118, 1, 1,
0.1133643, 0.5870402, -1.758354, 0, 0.7254902, 1, 1,
0.1161785, 0.157673, -0.9958652, 0, 0.7176471, 1, 1,
0.1226256, 0.1901571, 0.1492917, 0, 0.7137255, 1, 1,
0.1232725, -0.09176045, 1.946628, 0, 0.7058824, 1, 1,
0.1233772, -0.02610824, 2.191001, 0, 0.6980392, 1, 1,
0.1250389, -0.661039, 1.302405, 0, 0.6941177, 1, 1,
0.1255777, -0.06810503, 2.435966, 0, 0.6862745, 1, 1,
0.1290599, 0.9255101, 0.7010322, 0, 0.682353, 1, 1,
0.1299451, -0.5964477, 1.382585, 0, 0.6745098, 1, 1,
0.1304728, 2.275537, 0.8391858, 0, 0.6705883, 1, 1,
0.131283, -0.2522303, -0.04459788, 0, 0.6627451, 1, 1,
0.1315281, -1.088342, 2.822939, 0, 0.6588235, 1, 1,
0.1338386, -0.7328447, 4.304815, 0, 0.6509804, 1, 1,
0.1350902, -0.1724936, 2.998479, 0, 0.6470588, 1, 1,
0.1430724, -0.3694785, 2.78127, 0, 0.6392157, 1, 1,
0.1453753, -0.9378546, 2.484306, 0, 0.6352941, 1, 1,
0.1476334, -0.8733547, 1.87301, 0, 0.627451, 1, 1,
0.1493791, -0.1791125, 2.212142, 0, 0.6235294, 1, 1,
0.1513015, 2.341254, -0.9653386, 0, 0.6156863, 1, 1,
0.1524797, 0.289128, -0.03763054, 0, 0.6117647, 1, 1,
0.1532081, -0.18458, 2.769992, 0, 0.6039216, 1, 1,
0.153903, -1.422198, 3.434981, 0, 0.5960785, 1, 1,
0.157904, 1.695285, -0.370887, 0, 0.5921569, 1, 1,
0.1605969, -1.290184, 3.891372, 0, 0.5843138, 1, 1,
0.1651757, -1.646456, 2.963536, 0, 0.5803922, 1, 1,
0.1652724, 0.06799009, 0.6670178, 0, 0.572549, 1, 1,
0.1683757, -0.5534962, 1.387065, 0, 0.5686275, 1, 1,
0.1696734, -1.306435, 3.582757, 0, 0.5607843, 1, 1,
0.1705752, 0.973047, -0.3098989, 0, 0.5568628, 1, 1,
0.1746037, -1.051401, 4.638482, 0, 0.5490196, 1, 1,
0.1759829, -0.5918943, 3.7642, 0, 0.5450981, 1, 1,
0.1772126, -1.376656, 4.836909, 0, 0.5372549, 1, 1,
0.1798298, -0.6727254, 3.613508, 0, 0.5333334, 1, 1,
0.1828453, 1.853091, -1.721367, 0, 0.5254902, 1, 1,
0.1881145, 0.6589801, 0.7306934, 0, 0.5215687, 1, 1,
0.1892619, -1.846613, 1.8126, 0, 0.5137255, 1, 1,
0.1925782, 1.065626, -1.032511, 0, 0.509804, 1, 1,
0.1963156, -1.163983, 2.683604, 0, 0.5019608, 1, 1,
0.1965087, -1.880996, 1.236069, 0, 0.4941176, 1, 1,
0.1974324, 0.8658609, -0.3034249, 0, 0.4901961, 1, 1,
0.1975, 0.9688376, -0.2632544, 0, 0.4823529, 1, 1,
0.1981128, -0.7262236, 4.168705, 0, 0.4784314, 1, 1,
0.1986265, 1.318107, 0.673331, 0, 0.4705882, 1, 1,
0.1989206, -1.084271, 1.306652, 0, 0.4666667, 1, 1,
0.2010909, -0.2622172, 0.9121596, 0, 0.4588235, 1, 1,
0.2074587, 0.3959677, 0.1020715, 0, 0.454902, 1, 1,
0.2090297, -1.171223, 2.067065, 0, 0.4470588, 1, 1,
0.2105925, -0.88909, 1.379307, 0, 0.4431373, 1, 1,
0.2114976, 1.747871, -0.6880581, 0, 0.4352941, 1, 1,
0.2126928, -0.3474075, 1.281504, 0, 0.4313726, 1, 1,
0.2145671, 0.6994683, 1.310103, 0, 0.4235294, 1, 1,
0.2178365, 1.318663, -0.3281831, 0, 0.4196078, 1, 1,
0.2179023, -0.7701605, 1.405761, 0, 0.4117647, 1, 1,
0.221216, -0.4267829, 2.949514, 0, 0.4078431, 1, 1,
0.2235419, -0.1310861, 1.339777, 0, 0.4, 1, 1,
0.2333855, 0.04862508, 1.478134, 0, 0.3921569, 1, 1,
0.2336297, -0.367413, 3.782399, 0, 0.3882353, 1, 1,
0.2374504, -2.05055, 1.32752, 0, 0.3803922, 1, 1,
0.2375001, -0.1040449, 2.950771, 0, 0.3764706, 1, 1,
0.2498951, -0.2666864, 1.836025, 0, 0.3686275, 1, 1,
0.250777, 1.558542, -0.2479898, 0, 0.3647059, 1, 1,
0.253572, 1.58456, -1.622996, 0, 0.3568628, 1, 1,
0.2572633, -0.4123791, 2.433959, 0, 0.3529412, 1, 1,
0.261018, -0.5966021, 1.588531, 0, 0.345098, 1, 1,
0.2646652, -0.9290042, 2.310917, 0, 0.3411765, 1, 1,
0.2649677, 0.7891071, 1.427169, 0, 0.3333333, 1, 1,
0.2651098, 2.483599, 1.229932, 0, 0.3294118, 1, 1,
0.2654036, -0.7146721, 3.573898, 0, 0.3215686, 1, 1,
0.2664337, -0.9668534, 2.919827, 0, 0.3176471, 1, 1,
0.2682627, -1.599062, 2.524828, 0, 0.3098039, 1, 1,
0.2696423, 1.545727, -0.7863232, 0, 0.3058824, 1, 1,
0.2763801, 1.430995, 0.1656563, 0, 0.2980392, 1, 1,
0.2814678, -0.2275785, 1.545778, 0, 0.2901961, 1, 1,
0.2879134, -0.4261639, 2.041342, 0, 0.2862745, 1, 1,
0.289622, 0.1578036, 1.901532, 0, 0.2784314, 1, 1,
0.2901246, 0.9740215, -0.5400209, 0, 0.2745098, 1, 1,
0.2929893, 2.111162, 1.464004, 0, 0.2666667, 1, 1,
0.294926, 0.7628086, -0.744123, 0, 0.2627451, 1, 1,
0.2990629, -1.249541, 4.07459, 0, 0.254902, 1, 1,
0.2991164, -0.3616144, 0.7902065, 0, 0.2509804, 1, 1,
0.3027498, -0.6632187, 1.311453, 0, 0.2431373, 1, 1,
0.3031733, 0.7479506, 1.852399, 0, 0.2392157, 1, 1,
0.3037888, -1.270863, 3.287238, 0, 0.2313726, 1, 1,
0.3096699, -1.059521, 3.534248, 0, 0.227451, 1, 1,
0.3113046, 0.8512143, 1.718815, 0, 0.2196078, 1, 1,
0.3165881, 0.05886972, 3.309531, 0, 0.2156863, 1, 1,
0.3171432, 0.897507, 0.294597, 0, 0.2078431, 1, 1,
0.3237064, 0.2931816, 2.785002, 0, 0.2039216, 1, 1,
0.3245728, -2.114364, 4.946929, 0, 0.1960784, 1, 1,
0.3301967, -1.292208, 5.355715, 0, 0.1882353, 1, 1,
0.3307272, -0.8814775, 4.623064, 0, 0.1843137, 1, 1,
0.3329622, 0.4857603, -0.2672356, 0, 0.1764706, 1, 1,
0.3359693, 0.4827296, 0.7472865, 0, 0.172549, 1, 1,
0.3397882, -0.2547952, 0.5251901, 0, 0.1647059, 1, 1,
0.3483386, -0.3244859, 1.650495, 0, 0.1607843, 1, 1,
0.3562966, -0.5742693, 3.12958, 0, 0.1529412, 1, 1,
0.3595092, -0.4248987, 3.458092, 0, 0.1490196, 1, 1,
0.366585, 1.329618, 0.587128, 0, 0.1411765, 1, 1,
0.3688416, -0.8674621, 3.266183, 0, 0.1372549, 1, 1,
0.3692164, -1.443944, 2.251539, 0, 0.1294118, 1, 1,
0.3714674, 0.7926876, -0.1082017, 0, 0.1254902, 1, 1,
0.3732714, -0.7831886, 2.329388, 0, 0.1176471, 1, 1,
0.3741265, 0.7995201, 0.743259, 0, 0.1137255, 1, 1,
0.3764189, 0.7350871, -1.728989, 0, 0.1058824, 1, 1,
0.377496, 1.572135, 1.594207, 0, 0.09803922, 1, 1,
0.3782298, 0.1425201, 0.4069184, 0, 0.09411765, 1, 1,
0.382419, -1.242739, 4.146712, 0, 0.08627451, 1, 1,
0.3902761, -1.830598, 5.576203, 0, 0.08235294, 1, 1,
0.3949476, -1.080683, 3.700715, 0, 0.07450981, 1, 1,
0.3952596, -1.127418, 2.563513, 0, 0.07058824, 1, 1,
0.3960927, -0.957725, 2.037777, 0, 0.0627451, 1, 1,
0.3974906, -0.6184691, 2.454455, 0, 0.05882353, 1, 1,
0.3992872, 0.677204, 0.1682608, 0, 0.05098039, 1, 1,
0.4024976, 1.441282, 0.1716073, 0, 0.04705882, 1, 1,
0.4041936, 1.588429, 0.7842858, 0, 0.03921569, 1, 1,
0.4043614, 1.105009, 0.2079376, 0, 0.03529412, 1, 1,
0.4093486, 2.144133, 0.9132322, 0, 0.02745098, 1, 1,
0.4142888, -1.243927, 4.350928, 0, 0.02352941, 1, 1,
0.4182435, 0.9989745, 0.2035971, 0, 0.01568628, 1, 1,
0.4207328, 2.480527, 1.354391, 0, 0.01176471, 1, 1,
0.4217655, -0.7448943, 1.22177, 0, 0.003921569, 1, 1,
0.4237627, -0.5315699, 4.483546, 0.003921569, 0, 1, 1,
0.4239093, -0.06053021, 2.277743, 0.007843138, 0, 1, 1,
0.4304964, 0.6693609, -0.2064105, 0.01568628, 0, 1, 1,
0.4309433, 1.04908, 0.3859007, 0.01960784, 0, 1, 1,
0.432575, -1.003373, 3.136649, 0.02745098, 0, 1, 1,
0.4377849, -0.1287043, 1.765349, 0.03137255, 0, 1, 1,
0.4460924, -0.5754111, 4.590392, 0.03921569, 0, 1, 1,
0.453111, -0.06436746, 0.6831815, 0.04313726, 0, 1, 1,
0.4592033, 0.06423861, 1.751782, 0.05098039, 0, 1, 1,
0.4635439, -0.1787363, 4.429383, 0.05490196, 0, 1, 1,
0.4637518, 0.2529043, 1.850037, 0.0627451, 0, 1, 1,
0.4706773, -0.2766128, 1.952753, 0.06666667, 0, 1, 1,
0.474228, -0.3592088, 1.259035, 0.07450981, 0, 1, 1,
0.4763473, -0.4691054, 1.120499, 0.07843138, 0, 1, 1,
0.4777627, 0.3664872, 1.978011, 0.08627451, 0, 1, 1,
0.4796145, 0.3458519, -0.5278195, 0.09019608, 0, 1, 1,
0.4842554, 2.559936, 0.9544115, 0.09803922, 0, 1, 1,
0.4960024, -0.5015768, 2.67599, 0.1058824, 0, 1, 1,
0.5067564, 0.3514882, -0.9188788, 0.1098039, 0, 1, 1,
0.5080789, 2.733365, 2.497914, 0.1176471, 0, 1, 1,
0.5174929, -0.789169, 3.656569, 0.1215686, 0, 1, 1,
0.5187163, -0.6388601, 2.676041, 0.1294118, 0, 1, 1,
0.5195871, 0.04100161, 0.2377329, 0.1333333, 0, 1, 1,
0.520968, -0.3982263, 2.701168, 0.1411765, 0, 1, 1,
0.5213387, 1.464516, 1.768707, 0.145098, 0, 1, 1,
0.5345591, -0.7944677, 1.109313, 0.1529412, 0, 1, 1,
0.5347023, 0.5612625, 1.033007, 0.1568628, 0, 1, 1,
0.5466617, 0.391751, 0.1613763, 0.1647059, 0, 1, 1,
0.5478235, 0.1576891, 1.613108, 0.1686275, 0, 1, 1,
0.5501702, -0.5135974, 0.5558188, 0.1764706, 0, 1, 1,
0.55055, 1.254511, 1.010926, 0.1803922, 0, 1, 1,
0.5569324, -0.1688438, 3.112776, 0.1882353, 0, 1, 1,
0.5575572, -0.3000802, 1.104464, 0.1921569, 0, 1, 1,
0.5705143, -0.2304987, 2.355226, 0.2, 0, 1, 1,
0.5706411, 1.058692, 0.7192149, 0.2078431, 0, 1, 1,
0.5712674, -0.1222554, 1.427791, 0.2117647, 0, 1, 1,
0.5774698, -1.571816, 2.384585, 0.2196078, 0, 1, 1,
0.581616, -0.3314262, 2.937955, 0.2235294, 0, 1, 1,
0.5945025, -0.3855367, 1.270595, 0.2313726, 0, 1, 1,
0.595435, 0.08997909, 1.02541, 0.2352941, 0, 1, 1,
0.6027887, -1.318401, 2.489234, 0.2431373, 0, 1, 1,
0.605303, -1.114496, 2.469918, 0.2470588, 0, 1, 1,
0.6095341, -0.7390493, 1.803521, 0.254902, 0, 1, 1,
0.6096455, -0.5950779, 3.409868, 0.2588235, 0, 1, 1,
0.612721, -0.6434465, 2.990764, 0.2666667, 0, 1, 1,
0.6134917, -0.5925027, 1.20568, 0.2705882, 0, 1, 1,
0.6143472, 0.1107458, 1.822256, 0.2784314, 0, 1, 1,
0.6196703, -0.008837149, 2.017505, 0.282353, 0, 1, 1,
0.6203782, 0.6159941, 0.8475882, 0.2901961, 0, 1, 1,
0.6233164, 0.3139085, 0.1444867, 0.2941177, 0, 1, 1,
0.6241955, -0.3123248, 3.580346, 0.3019608, 0, 1, 1,
0.6310034, -0.6542788, 2.863121, 0.3098039, 0, 1, 1,
0.6329433, -0.3534078, 2.61748, 0.3137255, 0, 1, 1,
0.6335552, 1.136679, -0.2945097, 0.3215686, 0, 1, 1,
0.6365902, 0.5519499, 0.6907688, 0.3254902, 0, 1, 1,
0.6379675, -0.5317472, 2.872113, 0.3333333, 0, 1, 1,
0.639132, 2.496873, -0.850459, 0.3372549, 0, 1, 1,
0.644112, -1.182824, 2.27292, 0.345098, 0, 1, 1,
0.6443092, -0.9068674, 1.763916, 0.3490196, 0, 1, 1,
0.6447262, 0.8248698, 0.551722, 0.3568628, 0, 1, 1,
0.6447738, -1.393523, 3.698703, 0.3607843, 0, 1, 1,
0.6455193, 0.5428871, 0.2965384, 0.3686275, 0, 1, 1,
0.6464181, 0.1202829, 1.524663, 0.372549, 0, 1, 1,
0.6548027, 1.057391, 0.1009195, 0.3803922, 0, 1, 1,
0.6655892, 0.4483368, 1.462072, 0.3843137, 0, 1, 1,
0.6725959, -0.5851328, 1.794266, 0.3921569, 0, 1, 1,
0.672667, 1.809188, 0.7071516, 0.3960784, 0, 1, 1,
0.6786717, 0.9403827, -0.459579, 0.4039216, 0, 1, 1,
0.6864326, -1.591131, 2.267772, 0.4117647, 0, 1, 1,
0.6870623, -0.275602, 1.517634, 0.4156863, 0, 1, 1,
0.6907492, -1.69459, 3.320744, 0.4235294, 0, 1, 1,
0.6910275, 0.819603, -0.9478062, 0.427451, 0, 1, 1,
0.6916038, -0.7008439, 3.511626, 0.4352941, 0, 1, 1,
0.6929724, 0.3675635, 1.430488, 0.4392157, 0, 1, 1,
0.6937141, 0.3009003, 3.003975, 0.4470588, 0, 1, 1,
0.6977529, -1.195934, 2.938945, 0.4509804, 0, 1, 1,
0.7002147, -1.31654, 3.647891, 0.4588235, 0, 1, 1,
0.7017198, 0.2880336, 3.413745, 0.4627451, 0, 1, 1,
0.7021195, -0.08936786, 0.3896001, 0.4705882, 0, 1, 1,
0.7081313, 0.1380383, 3.366244, 0.4745098, 0, 1, 1,
0.7088439, -0.8655514, 2.04197, 0.4823529, 0, 1, 1,
0.7091035, 1.094919, 0.9383073, 0.4862745, 0, 1, 1,
0.7159276, -0.7835239, 2.654361, 0.4941176, 0, 1, 1,
0.7162382, -1.293534, 2.625666, 0.5019608, 0, 1, 1,
0.722107, -0.03561232, 1.299639, 0.5058824, 0, 1, 1,
0.7231221, 1.569289, -0.4366686, 0.5137255, 0, 1, 1,
0.7286568, -1.793761, 3.043762, 0.5176471, 0, 1, 1,
0.7352369, -0.1260272, 1.631825, 0.5254902, 0, 1, 1,
0.7354558, -1.607156, 1.754489, 0.5294118, 0, 1, 1,
0.7368277, -1.424021, 2.041457, 0.5372549, 0, 1, 1,
0.741352, -0.4276365, 5.70694, 0.5411765, 0, 1, 1,
0.7447149, -0.2507494, 1.038383, 0.5490196, 0, 1, 1,
0.7458448, 0.2741382, -0.6254164, 0.5529412, 0, 1, 1,
0.748013, -0.5297054, 3.27497, 0.5607843, 0, 1, 1,
0.7505125, 0.5718321, -1.123825, 0.5647059, 0, 1, 1,
0.7564033, 1.682049, 0.456517, 0.572549, 0, 1, 1,
0.7601906, 1.426879, 0.4508696, 0.5764706, 0, 1, 1,
0.7619313, 0.03233384, 2.343786, 0.5843138, 0, 1, 1,
0.7632493, -1.650835, 2.512741, 0.5882353, 0, 1, 1,
0.7683623, 0.009288739, 1.340064, 0.5960785, 0, 1, 1,
0.7848164, 0.4692588, 0.2801853, 0.6039216, 0, 1, 1,
0.7854164, -0.2864281, 1.824535, 0.6078432, 0, 1, 1,
0.7857318, -0.4862464, 2.210158, 0.6156863, 0, 1, 1,
0.7913662, 0.5714508, 3.43148, 0.6196079, 0, 1, 1,
0.7940871, 0.9130372, 1.1325, 0.627451, 0, 1, 1,
0.7946714, -0.6346039, 0.8583508, 0.6313726, 0, 1, 1,
0.796683, -0.8857663, 3.715222, 0.6392157, 0, 1, 1,
0.7991834, -0.8036942, -0.5445402, 0.6431373, 0, 1, 1,
0.8076924, 0.8892741, -0.3685358, 0.6509804, 0, 1, 1,
0.8146034, 1.195172, 0.4862348, 0.654902, 0, 1, 1,
0.8258903, 0.08239146, 2.050094, 0.6627451, 0, 1, 1,
0.8289478, -1.33068, 3.146011, 0.6666667, 0, 1, 1,
0.8308944, -0.4782643, 2.465488, 0.6745098, 0, 1, 1,
0.8428475, 0.6780807, 1.924353, 0.6784314, 0, 1, 1,
0.8432041, 0.5862693, 0.4741876, 0.6862745, 0, 1, 1,
0.8500744, -0.6856663, 2.768991, 0.6901961, 0, 1, 1,
0.8572361, -2.925596, 3.862454, 0.6980392, 0, 1, 1,
0.8730139, -0.3624047, 3.165157, 0.7058824, 0, 1, 1,
0.8730195, -0.528511, 1.659213, 0.7098039, 0, 1, 1,
0.8732184, -1.321121, 2.997083, 0.7176471, 0, 1, 1,
0.8745953, 0.0807737, -0.2435045, 0.7215686, 0, 1, 1,
0.8820164, 1.245668, 0.3976562, 0.7294118, 0, 1, 1,
0.8953258, 0.5273794, 0.6139131, 0.7333333, 0, 1, 1,
0.8997307, 1.4977, 0.2320809, 0.7411765, 0, 1, 1,
0.9011062, -0.5327873, 4.105028, 0.7450981, 0, 1, 1,
0.901116, 0.5592024, 1.260012, 0.7529412, 0, 1, 1,
0.9019287, -0.3327968, 4.101909, 0.7568628, 0, 1, 1,
0.9023821, -0.1481226, 1.713819, 0.7647059, 0, 1, 1,
0.9043276, -1.566437, 3.276671, 0.7686275, 0, 1, 1,
0.9079468, 1.38852, -0.1759946, 0.7764706, 0, 1, 1,
0.9114584, -0.6153923, 2.276764, 0.7803922, 0, 1, 1,
0.9155331, -0.01945198, 1.680263, 0.7882353, 0, 1, 1,
0.920276, 0.04713996, 0.05013816, 0.7921569, 0, 1, 1,
0.9206127, 1.329524, -0.4537443, 0.8, 0, 1, 1,
0.9246519, -0.2008582, 2.615797, 0.8078431, 0, 1, 1,
0.9261236, -0.5794671, 2.56855, 0.8117647, 0, 1, 1,
0.9297774, -1.172578, 3.596664, 0.8196079, 0, 1, 1,
0.93264, -0.2488206, 0.8226693, 0.8235294, 0, 1, 1,
0.9354385, 0.8644578, 1.575376, 0.8313726, 0, 1, 1,
0.9382411, 0.5176129, 1.227737, 0.8352941, 0, 1, 1,
0.9389669, 0.001863468, 2.471869, 0.8431373, 0, 1, 1,
0.9461085, -0.773176, 0.9222432, 0.8470588, 0, 1, 1,
0.9500157, 0.385521, -0.371911, 0.854902, 0, 1, 1,
0.9538337, -0.05076717, 2.822971, 0.8588235, 0, 1, 1,
0.9593599, 1.541865, 1.130492, 0.8666667, 0, 1, 1,
0.9637845, 0.7119614, 0.4345937, 0.8705882, 0, 1, 1,
0.9692843, 1.054842, 0.8303329, 0.8784314, 0, 1, 1,
0.9717583, -0.03691368, 2.118409, 0.8823529, 0, 1, 1,
0.9724399, -0.4163698, 2.811188, 0.8901961, 0, 1, 1,
0.9765472, -0.1239331, 0.2977657, 0.8941177, 0, 1, 1,
0.9778327, -1.642916, 2.742124, 0.9019608, 0, 1, 1,
0.9873026, 1.285941, 0.351699, 0.9098039, 0, 1, 1,
0.9882205, 0.6109304, -0.9651897, 0.9137255, 0, 1, 1,
0.989241, -0.1683854, 0.4611845, 0.9215686, 0, 1, 1,
0.9911836, -1.06222, 2.432918, 0.9254902, 0, 1, 1,
0.9923958, 0.2217964, 0.1057065, 0.9333333, 0, 1, 1,
0.995006, -0.5180634, 1.781879, 0.9372549, 0, 1, 1,
0.9985325, -0.6667994, 1.733278, 0.945098, 0, 1, 1,
1.008143, -0.564609, 2.70919, 0.9490196, 0, 1, 1,
1.008378, -0.007794844, 2.355857, 0.9568627, 0, 1, 1,
1.014162, -1.425787, 1.918213, 0.9607843, 0, 1, 1,
1.015606, -1.301221, 3.237145, 0.9686275, 0, 1, 1,
1.023449, 0.9570675, 0.6198847, 0.972549, 0, 1, 1,
1.030903, 0.1275422, -0.9898033, 0.9803922, 0, 1, 1,
1.034272, 0.06880619, 1.146368, 0.9843137, 0, 1, 1,
1.035922, -0.7841539, 1.299447, 0.9921569, 0, 1, 1,
1.040588, -0.2797768, 3.622173, 0.9960784, 0, 1, 1,
1.043729, -0.4452768, 1.905051, 1, 0, 0.9960784, 1,
1.05378, 1.135791, 0.4931332, 1, 0, 0.9882353, 1,
1.053829, 0.2357045, 1.102954, 1, 0, 0.9843137, 1,
1.054379, 1.566553, 1.441841, 1, 0, 0.9764706, 1,
1.057476, -0.6487404, 2.305996, 1, 0, 0.972549, 1,
1.057674, -0.4969623, 3.520449, 1, 0, 0.9647059, 1,
1.065572, -0.9918684, 0.6217243, 1, 0, 0.9607843, 1,
1.069272, -0.7506304, 2.029664, 1, 0, 0.9529412, 1,
1.072634, -0.2604443, 2.287689, 1, 0, 0.9490196, 1,
1.07347, 0.06744325, 2.015601, 1, 0, 0.9411765, 1,
1.081331, 0.4850483, 1.996186, 1, 0, 0.9372549, 1,
1.085587, 0.539565, 2.0969, 1, 0, 0.9294118, 1,
1.085804, -1.136781, 3.038561, 1, 0, 0.9254902, 1,
1.088335, -0.7904369, 1.599459, 1, 0, 0.9176471, 1,
1.088559, -0.546339, 3.033022, 1, 0, 0.9137255, 1,
1.090404, 0.4580288, 2.442328, 1, 0, 0.9058824, 1,
1.091168, 0.8266323, 1.605222, 1, 0, 0.9019608, 1,
1.132205, 1.207549, 1.517207, 1, 0, 0.8941177, 1,
1.133625, 0.03228915, 2.377082, 1, 0, 0.8862745, 1,
1.13976, -1.293447, 3.031089, 1, 0, 0.8823529, 1,
1.146366, -0.188588, 2.768447, 1, 0, 0.8745098, 1,
1.146577, -0.04729699, 3.087424, 1, 0, 0.8705882, 1,
1.146749, -0.09886138, 2.980649, 1, 0, 0.8627451, 1,
1.147637, 2.191339, -0.6451316, 1, 0, 0.8588235, 1,
1.14791, -0.6660686, 2.277327, 1, 0, 0.8509804, 1,
1.159639, 0.8205583, 0.2373514, 1, 0, 0.8470588, 1,
1.160968, -0.7266552, 1.321301, 1, 0, 0.8392157, 1,
1.167404, -0.5067643, 3.036148, 1, 0, 0.8352941, 1,
1.177476, 0.6672701, 1.52683, 1, 0, 0.827451, 1,
1.197482, 0.05039822, 4.064632, 1, 0, 0.8235294, 1,
1.198115, -0.9776284, 1.286035, 1, 0, 0.8156863, 1,
1.20109, 0.6558794, 2.472988, 1, 0, 0.8117647, 1,
1.203756, -1.793079, 1.027962, 1, 0, 0.8039216, 1,
1.21359, 1.393553, 0.3092966, 1, 0, 0.7960784, 1,
1.214251, -0.360659, 2.201212, 1, 0, 0.7921569, 1,
1.21746, -2.230731, 4.162649, 1, 0, 0.7843137, 1,
1.220003, 1.433446, 1.259258, 1, 0, 0.7803922, 1,
1.220273, 0.2205544, 1.031737, 1, 0, 0.772549, 1,
1.221561, 1.016008, 1.94713, 1, 0, 0.7686275, 1,
1.225316, 1.888666, -0.206344, 1, 0, 0.7607843, 1,
1.23322, -0.5269377, 3.027639, 1, 0, 0.7568628, 1,
1.234511, -1.495003, 3.691418, 1, 0, 0.7490196, 1,
1.243161, -0.3304792, 0.5290066, 1, 0, 0.7450981, 1,
1.246667, 0.7205954, 0.7073869, 1, 0, 0.7372549, 1,
1.254911, -1.713455, 4.278601, 1, 0, 0.7333333, 1,
1.255279, -0.4609426, 2.072429, 1, 0, 0.7254902, 1,
1.260939, -2.310859, 3.076195, 1, 0, 0.7215686, 1,
1.268083, 0.03273073, 3.598396, 1, 0, 0.7137255, 1,
1.268866, -3.225952, 1.462327, 1, 0, 0.7098039, 1,
1.284538, -0.1341646, 1.733541, 1, 0, 0.7019608, 1,
1.288997, -1.180473, 3.655085, 1, 0, 0.6941177, 1,
1.296505, -0.7796335, 1.240404, 1, 0, 0.6901961, 1,
1.298565, 1.993345, 0.8437877, 1, 0, 0.682353, 1,
1.306077, -0.09498139, 2.696129, 1, 0, 0.6784314, 1,
1.309943, 0.7350628, 1.382097, 1, 0, 0.6705883, 1,
1.311797, -1.934196, 2.505767, 1, 0, 0.6666667, 1,
1.3167, 1.283941, -1.191627, 1, 0, 0.6588235, 1,
1.322216, 2.732853, 0.4952362, 1, 0, 0.654902, 1,
1.328918, 0.6042312, 1.536905, 1, 0, 0.6470588, 1,
1.334881, 1.945301, 0.918867, 1, 0, 0.6431373, 1,
1.339588, -0.2537695, 2.299761, 1, 0, 0.6352941, 1,
1.347897, 1.923806, -0.8900836, 1, 0, 0.6313726, 1,
1.355892, -2.267806, 3.204008, 1, 0, 0.6235294, 1,
1.369231, -2.087107, 2.282191, 1, 0, 0.6196079, 1,
1.371363, -0.7350108, 2.133796, 1, 0, 0.6117647, 1,
1.382352, -0.4829739, 1.116349, 1, 0, 0.6078432, 1,
1.387699, 1.170109, 0.7070568, 1, 0, 0.6, 1,
1.390134, -1.329077, 1.446899, 1, 0, 0.5921569, 1,
1.3931, 2.288106, 0.9975018, 1, 0, 0.5882353, 1,
1.40395, 1.063151, 0.05818699, 1, 0, 0.5803922, 1,
1.405816, -1.412798, 2.970904, 1, 0, 0.5764706, 1,
1.409712, 0.3856702, 2.827432, 1, 0, 0.5686275, 1,
1.41655, 1.377423, -0.2396204, 1, 0, 0.5647059, 1,
1.430262, -1.69219, 1.267769, 1, 0, 0.5568628, 1,
1.431435, 0.1762794, 2.790078, 1, 0, 0.5529412, 1,
1.453995, -0.2755881, 1.558516, 1, 0, 0.5450981, 1,
1.45978, -3.155494, 1.658678, 1, 0, 0.5411765, 1,
1.46175, -0.6006134, 1.837047, 1, 0, 0.5333334, 1,
1.493317, -1.066513, 1.296161, 1, 0, 0.5294118, 1,
1.504902, -1.40887, 0.7871228, 1, 0, 0.5215687, 1,
1.512062, -0.1746933, 2.681931, 1, 0, 0.5176471, 1,
1.512572, 1.915775, 0.4642409, 1, 0, 0.509804, 1,
1.519175, 1.034997, 0.0771091, 1, 0, 0.5058824, 1,
1.527927, 0.1760404, 0.8422021, 1, 0, 0.4980392, 1,
1.529697, 0.381777, 1.451625, 1, 0, 0.4901961, 1,
1.548443, -0.8778918, 1.489986, 1, 0, 0.4862745, 1,
1.54998, -0.8831877, 3.568945, 1, 0, 0.4784314, 1,
1.553377, 0.1353028, 3.5933, 1, 0, 0.4745098, 1,
1.561774, -1.503455, 1.978203, 1, 0, 0.4666667, 1,
1.56516, 0.4209007, 2.190704, 1, 0, 0.4627451, 1,
1.568212, -0.799698, 1.407639, 1, 0, 0.454902, 1,
1.573234, -0.5690691, 3.447568, 1, 0, 0.4509804, 1,
1.575798, 1.131207, -0.3498417, 1, 0, 0.4431373, 1,
1.57904, 0.9842363, -1.721955, 1, 0, 0.4392157, 1,
1.584638, -0.8239154, 4.063101, 1, 0, 0.4313726, 1,
1.586928, -2.329936, 0.8978963, 1, 0, 0.427451, 1,
1.603006, 0.4538414, -1.226909, 1, 0, 0.4196078, 1,
1.63859, -0.4350606, 4.582424, 1, 0, 0.4156863, 1,
1.644906, -1.299731, 1.619941, 1, 0, 0.4078431, 1,
1.648314, 0.7256884, 1.031819, 1, 0, 0.4039216, 1,
1.655579, 0.5774205, 1.396351, 1, 0, 0.3960784, 1,
1.657694, -1.358669, 1.983784, 1, 0, 0.3882353, 1,
1.683303, -0.2855316, 2.498537, 1, 0, 0.3843137, 1,
1.708092, 0.3330001, 1.210604, 1, 0, 0.3764706, 1,
1.711774, -0.657068, 2.701841, 1, 0, 0.372549, 1,
1.729067, 0.7665401, 0.6116592, 1, 0, 0.3647059, 1,
1.729425, 0.1208069, 0.3064469, 1, 0, 0.3607843, 1,
1.741079, 2.291525, 0.2588333, 1, 0, 0.3529412, 1,
1.742039, 1.139141, -0.552901, 1, 0, 0.3490196, 1,
1.743934, -1.554707, 2.628536, 1, 0, 0.3411765, 1,
1.757524, -0.4747432, 1.432348, 1, 0, 0.3372549, 1,
1.760583, 0.1126593, 2.729812, 1, 0, 0.3294118, 1,
1.762389, -0.1169917, 0.9884967, 1, 0, 0.3254902, 1,
1.777136, -0.6345468, 0.3816001, 1, 0, 0.3176471, 1,
1.791448, 0.6124344, 0.9069285, 1, 0, 0.3137255, 1,
1.796639, -1.994369, 1.731145, 1, 0, 0.3058824, 1,
1.798366, 0.7670644, 1.926049, 1, 0, 0.2980392, 1,
1.800653, 0.4612904, 1.944073, 1, 0, 0.2941177, 1,
1.800967, 0.5084171, 1.992679, 1, 0, 0.2862745, 1,
1.805592, -0.9405548, 0.07342106, 1, 0, 0.282353, 1,
1.82243, 1.943344, 0.801728, 1, 0, 0.2745098, 1,
1.828122, 0.3176354, 0.3053816, 1, 0, 0.2705882, 1,
1.852629, 1.314949, 1.354045, 1, 0, 0.2627451, 1,
1.862345, -1.252784, 3.38114, 1, 0, 0.2588235, 1,
1.863047, 1.384407, 1.125763, 1, 0, 0.2509804, 1,
1.917641, 0.1502354, 2.065673, 1, 0, 0.2470588, 1,
1.928177, 0.486856, 1.900001, 1, 0, 0.2392157, 1,
1.94644, 0.6206363, 1.932303, 1, 0, 0.2352941, 1,
1.979691, -0.07669747, 1.288735, 1, 0, 0.227451, 1,
1.98755, -1.30687, 2.015149, 1, 0, 0.2235294, 1,
2.004988, 0.1362398, 1.117117, 1, 0, 0.2156863, 1,
2.035829, 1.222191, 1.948806, 1, 0, 0.2117647, 1,
2.042928, -2.086199, 1.088788, 1, 0, 0.2039216, 1,
2.077864, -0.2673336, 3.00277, 1, 0, 0.1960784, 1,
2.082402, -0.3555162, 2.794748, 1, 0, 0.1921569, 1,
2.097673, -1.468448, 2.243988, 1, 0, 0.1843137, 1,
2.098032, 1.368034, 0.1744923, 1, 0, 0.1803922, 1,
2.104618, -0.1726039, 1.276554, 1, 0, 0.172549, 1,
2.106247, 0.9195513, 0.8101246, 1, 0, 0.1686275, 1,
2.121305, -0.08399599, 1.577787, 1, 0, 0.1607843, 1,
2.141605, -0.7576163, 2.655628, 1, 0, 0.1568628, 1,
2.14229, -0.3661141, 2.195626, 1, 0, 0.1490196, 1,
2.158442, 0.5810968, 0.00923716, 1, 0, 0.145098, 1,
2.191857, 0.08546435, 1.921999, 1, 0, 0.1372549, 1,
2.200395, -0.4454552, 3.236188, 1, 0, 0.1333333, 1,
2.219758, 1.752519, -0.04393492, 1, 0, 0.1254902, 1,
2.229889, -1.657322, 3.791351, 1, 0, 0.1215686, 1,
2.230266, 0.6512211, 1.072383, 1, 0, 0.1137255, 1,
2.257325, 1.960816, 0.2035488, 1, 0, 0.1098039, 1,
2.352743, 0.4027928, 1.111748, 1, 0, 0.1019608, 1,
2.375844, -0.9728251, 3.743947, 1, 0, 0.09411765, 1,
2.482732, 0.4126396, 1.305018, 1, 0, 0.09019608, 1,
2.491809, -0.0257948, 0.9207366, 1, 0, 0.08235294, 1,
2.525902, 1.544068, 1.763709, 1, 0, 0.07843138, 1,
2.567817, -1.399887, 1.251478, 1, 0, 0.07058824, 1,
2.575852, -0.2687913, 0.5395576, 1, 0, 0.06666667, 1,
2.613875, -2.491101, 1.591696, 1, 0, 0.05882353, 1,
2.626074, 0.8287077, 1.626442, 1, 0, 0.05490196, 1,
2.634994, 1.421046, 0.9106128, 1, 0, 0.04705882, 1,
2.658745, -0.3015362, 0.947615, 1, 0, 0.04313726, 1,
2.858254, -0.968101, 1.871147, 1, 0, 0.03529412, 1,
3.071595, -2.406851, 3.095759, 1, 0, 0.03137255, 1,
3.219512, -0.03736952, 0.7009572, 1, 0, 0.02352941, 1,
3.343261, 0.1834743, 2.075525, 1, 0, 0.01960784, 1,
3.721327, -0.5375206, 1.719013, 1, 0, 0.01176471, 1,
4.040862, -0.6853362, 2.684781, 1, 0, 0.007843138, 1
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
0.6957326, -4.239807, -7.08205, 0, -0.5, 0.5, 0.5,
0.6957326, -4.239807, -7.08205, 1, -0.5, 0.5, 0.5,
0.6957326, -4.239807, -7.08205, 1, 1.5, 0.5, 0.5,
0.6957326, -4.239807, -7.08205, 0, 1.5, 0.5, 0.5
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
-3.783396, -0.2352282, -7.08205, 0, -0.5, 0.5, 0.5,
-3.783396, -0.2352282, -7.08205, 1, -0.5, 0.5, 0.5,
-3.783396, -0.2352282, -7.08205, 1, 1.5, 0.5, 0.5,
-3.783396, -0.2352282, -7.08205, 0, 1.5, 0.5, 0.5
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
-3.783396, -4.239807, 0.239223, 0, -0.5, 0.5, 0.5,
-3.783396, -4.239807, 0.239223, 1, -0.5, 0.5, 0.5,
-3.783396, -4.239807, 0.239223, 1, 1.5, 0.5, 0.5,
-3.783396, -4.239807, 0.239223, 0, 1.5, 0.5, 0.5
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
-2, -3.315674, -5.392525,
4, -3.315674, -5.392525,
-2, -3.315674, -5.392525,
-2, -3.469696, -5.674113,
-1, -3.315674, -5.392525,
-1, -3.469696, -5.674113,
0, -3.315674, -5.392525,
0, -3.469696, -5.674113,
1, -3.315674, -5.392525,
1, -3.469696, -5.674113,
2, -3.315674, -5.392525,
2, -3.469696, -5.674113,
3, -3.315674, -5.392525,
3, -3.469696, -5.674113,
4, -3.315674, -5.392525,
4, -3.469696, -5.674113
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
"3",
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
-2, -3.77774, -6.237288, 0, -0.5, 0.5, 0.5,
-2, -3.77774, -6.237288, 1, -0.5, 0.5, 0.5,
-2, -3.77774, -6.237288, 1, 1.5, 0.5, 0.5,
-2, -3.77774, -6.237288, 0, 1.5, 0.5, 0.5,
-1, -3.77774, -6.237288, 0, -0.5, 0.5, 0.5,
-1, -3.77774, -6.237288, 1, -0.5, 0.5, 0.5,
-1, -3.77774, -6.237288, 1, 1.5, 0.5, 0.5,
-1, -3.77774, -6.237288, 0, 1.5, 0.5, 0.5,
0, -3.77774, -6.237288, 0, -0.5, 0.5, 0.5,
0, -3.77774, -6.237288, 1, -0.5, 0.5, 0.5,
0, -3.77774, -6.237288, 1, 1.5, 0.5, 0.5,
0, -3.77774, -6.237288, 0, 1.5, 0.5, 0.5,
1, -3.77774, -6.237288, 0, -0.5, 0.5, 0.5,
1, -3.77774, -6.237288, 1, -0.5, 0.5, 0.5,
1, -3.77774, -6.237288, 1, 1.5, 0.5, 0.5,
1, -3.77774, -6.237288, 0, 1.5, 0.5, 0.5,
2, -3.77774, -6.237288, 0, -0.5, 0.5, 0.5,
2, -3.77774, -6.237288, 1, -0.5, 0.5, 0.5,
2, -3.77774, -6.237288, 1, 1.5, 0.5, 0.5,
2, -3.77774, -6.237288, 0, 1.5, 0.5, 0.5,
3, -3.77774, -6.237288, 0, -0.5, 0.5, 0.5,
3, -3.77774, -6.237288, 1, -0.5, 0.5, 0.5,
3, -3.77774, -6.237288, 1, 1.5, 0.5, 0.5,
3, -3.77774, -6.237288, 0, 1.5, 0.5, 0.5,
4, -3.77774, -6.237288, 0, -0.5, 0.5, 0.5,
4, -3.77774, -6.237288, 1, -0.5, 0.5, 0.5,
4, -3.77774, -6.237288, 1, 1.5, 0.5, 0.5,
4, -3.77774, -6.237288, 0, 1.5, 0.5, 0.5
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
-2.749751, -3, -5.392525,
-2.749751, 2, -5.392525,
-2.749751, -3, -5.392525,
-2.922025, -3, -5.674113,
-2.749751, -2, -5.392525,
-2.922025, -2, -5.674113,
-2.749751, -1, -5.392525,
-2.922025, -1, -5.674113,
-2.749751, 0, -5.392525,
-2.922025, 0, -5.674113,
-2.749751, 1, -5.392525,
-2.922025, 1, -5.674113,
-2.749751, 2, -5.392525,
-2.922025, 2, -5.674113
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
-3.266573, -3, -6.237288, 0, -0.5, 0.5, 0.5,
-3.266573, -3, -6.237288, 1, -0.5, 0.5, 0.5,
-3.266573, -3, -6.237288, 1, 1.5, 0.5, 0.5,
-3.266573, -3, -6.237288, 0, 1.5, 0.5, 0.5,
-3.266573, -2, -6.237288, 0, -0.5, 0.5, 0.5,
-3.266573, -2, -6.237288, 1, -0.5, 0.5, 0.5,
-3.266573, -2, -6.237288, 1, 1.5, 0.5, 0.5,
-3.266573, -2, -6.237288, 0, 1.5, 0.5, 0.5,
-3.266573, -1, -6.237288, 0, -0.5, 0.5, 0.5,
-3.266573, -1, -6.237288, 1, -0.5, 0.5, 0.5,
-3.266573, -1, -6.237288, 1, 1.5, 0.5, 0.5,
-3.266573, -1, -6.237288, 0, 1.5, 0.5, 0.5,
-3.266573, 0, -6.237288, 0, -0.5, 0.5, 0.5,
-3.266573, 0, -6.237288, 1, -0.5, 0.5, 0.5,
-3.266573, 0, -6.237288, 1, 1.5, 0.5, 0.5,
-3.266573, 0, -6.237288, 0, 1.5, 0.5, 0.5,
-3.266573, 1, -6.237288, 0, -0.5, 0.5, 0.5,
-3.266573, 1, -6.237288, 1, -0.5, 0.5, 0.5,
-3.266573, 1, -6.237288, 1, 1.5, 0.5, 0.5,
-3.266573, 1, -6.237288, 0, 1.5, 0.5, 0.5,
-3.266573, 2, -6.237288, 0, -0.5, 0.5, 0.5,
-3.266573, 2, -6.237288, 1, -0.5, 0.5, 0.5,
-3.266573, 2, -6.237288, 1, 1.5, 0.5, 0.5,
-3.266573, 2, -6.237288, 0, 1.5, 0.5, 0.5
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
-2.749751, -3.315674, -4,
-2.749751, -3.315674, 4,
-2.749751, -3.315674, -4,
-2.922025, -3.469696, -4,
-2.749751, -3.315674, -2,
-2.922025, -3.469696, -2,
-2.749751, -3.315674, 0,
-2.922025, -3.469696, 0,
-2.749751, -3.315674, 2,
-2.922025, -3.469696, 2,
-2.749751, -3.315674, 4,
-2.922025, -3.469696, 4
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
-3.266573, -3.77774, -4, 0, -0.5, 0.5, 0.5,
-3.266573, -3.77774, -4, 1, -0.5, 0.5, 0.5,
-3.266573, -3.77774, -4, 1, 1.5, 0.5, 0.5,
-3.266573, -3.77774, -4, 0, 1.5, 0.5, 0.5,
-3.266573, -3.77774, -2, 0, -0.5, 0.5, 0.5,
-3.266573, -3.77774, -2, 1, -0.5, 0.5, 0.5,
-3.266573, -3.77774, -2, 1, 1.5, 0.5, 0.5,
-3.266573, -3.77774, -2, 0, 1.5, 0.5, 0.5,
-3.266573, -3.77774, 0, 0, -0.5, 0.5, 0.5,
-3.266573, -3.77774, 0, 1, -0.5, 0.5, 0.5,
-3.266573, -3.77774, 0, 1, 1.5, 0.5, 0.5,
-3.266573, -3.77774, 0, 0, 1.5, 0.5, 0.5,
-3.266573, -3.77774, 2, 0, -0.5, 0.5, 0.5,
-3.266573, -3.77774, 2, 1, -0.5, 0.5, 0.5,
-3.266573, -3.77774, 2, 1, 1.5, 0.5, 0.5,
-3.266573, -3.77774, 2, 0, 1.5, 0.5, 0.5,
-3.266573, -3.77774, 4, 0, -0.5, 0.5, 0.5,
-3.266573, -3.77774, 4, 1, -0.5, 0.5, 0.5,
-3.266573, -3.77774, 4, 1, 1.5, 0.5, 0.5,
-3.266573, -3.77774, 4, 0, 1.5, 0.5, 0.5
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
-2.749751, -3.315674, -5.392525,
-2.749751, 2.845217, -5.392525,
-2.749751, -3.315674, 5.870971,
-2.749751, 2.845217, 5.870971,
-2.749751, -3.315674, -5.392525,
-2.749751, -3.315674, 5.870971,
-2.749751, 2.845217, -5.392525,
-2.749751, 2.845217, 5.870971,
-2.749751, -3.315674, -5.392525,
4.141216, -3.315674, -5.392525,
-2.749751, -3.315674, 5.870971,
4.141216, -3.315674, 5.870971,
-2.749751, 2.845217, -5.392525,
4.141216, 2.845217, -5.392525,
-2.749751, 2.845217, 5.870971,
4.141216, 2.845217, 5.870971,
4.141216, -3.315674, -5.392525,
4.141216, 2.845217, -5.392525,
4.141216, -3.315674, 5.870971,
4.141216, 2.845217, 5.870971,
4.141216, -3.315674, -5.392525,
4.141216, -3.315674, 5.870971,
4.141216, 2.845217, -5.392525,
4.141216, 2.845217, 5.870971
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
var radius = 7.780527;
var distance = 34.61645;
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
mvMatrix.translate( -0.6957326, 0.2352282, -0.239223 );
mvMatrix.scale( 1.220795, 1.365461, 0.746878 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.61645);
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
dimethomorph<-read.table("dimethomorph.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-dimethomorph$V2
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
```

```r
y<-dimethomorph$V3
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
```

```r
z<-dimethomorph$V4
```

```
## Error in eval(expr, envir, enclos): object 'dimethomorph' not found
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
-2.649397, -0.4184065, -1.856797, 0, 0, 1, 1, 1,
-2.645543, -0.3030926, -2.461164, 1, 0, 0, 1, 1,
-2.43055, 2.755496, -0.2170814, 1, 0, 0, 1, 1,
-2.329216, -0.1909121, -2.545591, 1, 0, 0, 1, 1,
-2.323877, 0.9808963, -1.483937, 1, 0, 0, 1, 1,
-2.259348, 0.2205236, -2.76513, 1, 0, 0, 1, 1,
-2.209829, 0.1872803, -1.329017, 0, 0, 0, 1, 1,
-2.201602, 0.994893, -0.438233, 0, 0, 0, 1, 1,
-2.131307, -0.9012772, -1.081895, 0, 0, 0, 1, 1,
-2.084181, -1.223983, -1.489936, 0, 0, 0, 1, 1,
-2.042009, -0.3774199, -1.212711, 0, 0, 0, 1, 1,
-2.035607, -1.651344, -3.425937, 0, 0, 0, 1, 1,
-2.028951, -0.3384456, -1.75954, 0, 0, 0, 1, 1,
-2.028714, -0.6793497, -0.3627699, 1, 1, 1, 1, 1,
-2.011199, -0.2295905, -0.8377379, 1, 1, 1, 1, 1,
-1.986239, -1.092954, -1.839656, 1, 1, 1, 1, 1,
-1.982274, -0.9402783, -2.813634, 1, 1, 1, 1, 1,
-1.977311, -0.2470579, -1.006199, 1, 1, 1, 1, 1,
-1.973426, 0.3824309, -0.6384632, 1, 1, 1, 1, 1,
-1.971266, 0.5324831, 0.6185653, 1, 1, 1, 1, 1,
-1.970487, -1.570229, -5.133187, 1, 1, 1, 1, 1,
-1.968128, -0.1428695, -1.93956, 1, 1, 1, 1, 1,
-1.960459, 0.6290923, -1.714811, 1, 1, 1, 1, 1,
-1.943885, -0.3218164, -1.143686, 1, 1, 1, 1, 1,
-1.919561, -1.057055, -3.659067, 1, 1, 1, 1, 1,
-1.916532, 2.148299, -0.9484635, 1, 1, 1, 1, 1,
-1.909953, 0.3382274, -2.660539, 1, 1, 1, 1, 1,
-1.903272, -0.9121506, -2.271148, 1, 1, 1, 1, 1,
-1.887557, 0.3664015, -0.3052848, 0, 0, 1, 1, 1,
-1.870134, 1.481395, 0.617187, 1, 0, 0, 1, 1,
-1.863239, 0.6341413, -0.706938, 1, 0, 0, 1, 1,
-1.854819, 1.591954, -0.4494628, 1, 0, 0, 1, 1,
-1.853559, 0.1177031, 0.1267929, 1, 0, 0, 1, 1,
-1.850722, 0.3084263, -0.6957134, 1, 0, 0, 1, 1,
-1.849388, 0.1840375, -0.9368982, 0, 0, 0, 1, 1,
-1.798403, 0.09970071, -2.647121, 0, 0, 0, 1, 1,
-1.788011, -0.5460412, -0.5956745, 0, 0, 0, 1, 1,
-1.787831, 0.04635369, -0.1305773, 0, 0, 0, 1, 1,
-1.782051, 0.798817, -1.644353, 0, 0, 0, 1, 1,
-1.7723, 1.454381, -3.180365, 0, 0, 0, 1, 1,
-1.772297, 0.9153562, -1.366407, 0, 0, 0, 1, 1,
-1.697548, 0.362481, -2.70935, 1, 1, 1, 1, 1,
-1.680672, -0.598379, -0.91027, 1, 1, 1, 1, 1,
-1.668912, 0.932453, -2.029809, 1, 1, 1, 1, 1,
-1.660637, -0.009647346, -1.961872, 1, 1, 1, 1, 1,
-1.642179, 2.316898, -0.5568195, 1, 1, 1, 1, 1,
-1.636462, 0.6562619, -2.025417, 1, 1, 1, 1, 1,
-1.61403, -0.09827691, -1.331603, 1, 1, 1, 1, 1,
-1.612808, 0.1318107, -1.129606, 1, 1, 1, 1, 1,
-1.61277, -0.4402382, -1.800679, 1, 1, 1, 1, 1,
-1.604498, -0.2845943, -1.78005, 1, 1, 1, 1, 1,
-1.598262, 0.4200313, -0.3709651, 1, 1, 1, 1, 1,
-1.582696, 0.8394524, -0.6521695, 1, 1, 1, 1, 1,
-1.576085, 0.9302087, -2.078356, 1, 1, 1, 1, 1,
-1.57531, -1.728368, -2.573529, 1, 1, 1, 1, 1,
-1.571049, -0.1247604, -2.251129, 1, 1, 1, 1, 1,
-1.569627, -0.6305442, -1.916868, 0, 0, 1, 1, 1,
-1.530935, 0.9147188, -2.441679, 1, 0, 0, 1, 1,
-1.50698, 0.6142415, -1.827279, 1, 0, 0, 1, 1,
-1.5044, 1.192876, -1.464389, 1, 0, 0, 1, 1,
-1.503107, 0.09392721, -1.16997, 1, 0, 0, 1, 1,
-1.495017, 0.1862017, 0.03400031, 1, 0, 0, 1, 1,
-1.492988, -1.089342, -0.4517514, 0, 0, 0, 1, 1,
-1.490447, -1.298775, -1.020233, 0, 0, 0, 1, 1,
-1.483149, -1.560179, -2.623257, 0, 0, 0, 1, 1,
-1.483025, 0.4677867, -0.8978864, 0, 0, 0, 1, 1,
-1.478271, 0.678085, -1.154694, 0, 0, 0, 1, 1,
-1.474797, 0.5261418, -1.285792, 0, 0, 0, 1, 1,
-1.461962, 0.02028258, -1.970194, 0, 0, 0, 1, 1,
-1.460917, -0.6751646, -1.752394, 1, 1, 1, 1, 1,
-1.448975, -1.351017, -2.979696, 1, 1, 1, 1, 1,
-1.434007, 1.585901, -0.8510367, 1, 1, 1, 1, 1,
-1.422722, 1.470515, -0.4081816, 1, 1, 1, 1, 1,
-1.41369, 0.01819009, -2.503048, 1, 1, 1, 1, 1,
-1.412472, 0.05927856, -0.4130409, 1, 1, 1, 1, 1,
-1.410431, 1.318524, -1.696425, 1, 1, 1, 1, 1,
-1.40694, 0.5111066, -2.174141, 1, 1, 1, 1, 1,
-1.39304, 0.3787956, -1.434729, 1, 1, 1, 1, 1,
-1.383356, 0.2083908, -3.007958, 1, 1, 1, 1, 1,
-1.37734, -0.194208, -1.687829, 1, 1, 1, 1, 1,
-1.376153, 0.3258098, -0.8394902, 1, 1, 1, 1, 1,
-1.373993, -1.902871, -2.512198, 1, 1, 1, 1, 1,
-1.350062, 0.4461477, -0.880671, 1, 1, 1, 1, 1,
-1.343243, 1.798398, -1.37144, 1, 1, 1, 1, 1,
-1.336044, 0.3013299, 0.9818491, 0, 0, 1, 1, 1,
-1.332972, -0.05799797, -1.638443, 1, 0, 0, 1, 1,
-1.328966, 0.08556299, -0.05461729, 1, 0, 0, 1, 1,
-1.301664, 0.5487801, -2.023287, 1, 0, 0, 1, 1,
-1.282046, -1.34648, -2.856938, 1, 0, 0, 1, 1,
-1.277017, 0.1596867, -0.7578788, 1, 0, 0, 1, 1,
-1.27687, -0.458698, -2.905736, 0, 0, 0, 1, 1,
-1.259866, -1.586203, -2.47135, 0, 0, 0, 1, 1,
-1.258923, -0.170222, -2.0294, 0, 0, 0, 1, 1,
-1.235783, -0.6740828, -0.06457758, 0, 0, 0, 1, 1,
-1.235142, -0.5351779, -2.202865, 0, 0, 0, 1, 1,
-1.230614, 0.2678851, -0.2645099, 0, 0, 0, 1, 1,
-1.228177, 0.8525114, -0.5802588, 0, 0, 0, 1, 1,
-1.225475, 1.094937, -1.312898, 1, 1, 1, 1, 1,
-1.216435, -0.4943546, -1.06319, 1, 1, 1, 1, 1,
-1.21284, -0.2522003, -1.959948, 1, 1, 1, 1, 1,
-1.211651, -0.9114024, -1.72142, 1, 1, 1, 1, 1,
-1.210473, -0.2659633, -1.622353, 1, 1, 1, 1, 1,
-1.209619, 0.2766648, -1.456491, 1, 1, 1, 1, 1,
-1.205249, 0.9233702, 0.01821976, 1, 1, 1, 1, 1,
-1.204444, 0.3757327, -1.798447, 1, 1, 1, 1, 1,
-1.19293, -0.4514397, -0.7481774, 1, 1, 1, 1, 1,
-1.189704, -2.052869, -2.430574, 1, 1, 1, 1, 1,
-1.187859, -2.391774, -3.252412, 1, 1, 1, 1, 1,
-1.186143, -0.5896804, -1.113459, 1, 1, 1, 1, 1,
-1.18515, 0.4895802, -0.6630114, 1, 1, 1, 1, 1,
-1.182598, -1.107908, -4.229243, 1, 1, 1, 1, 1,
-1.17096, -0.591729, -0.08614495, 1, 1, 1, 1, 1,
-1.168009, -0.2517592, 0.04493381, 0, 0, 1, 1, 1,
-1.166093, -1.320447, -4.232073, 1, 0, 0, 1, 1,
-1.164285, 0.7998796, -0.1248422, 1, 0, 0, 1, 1,
-1.162551, -2.161119, -2.771483, 1, 0, 0, 1, 1,
-1.162321, -0.8058451, -2.58884, 1, 0, 0, 1, 1,
-1.161289, -0.5229489, -4.029804, 1, 0, 0, 1, 1,
-1.161188, 2.130575, -1.466838, 0, 0, 0, 1, 1,
-1.15854, 1.01423, -1.586483, 0, 0, 0, 1, 1,
-1.14861, 1.056716, -1.317584, 0, 0, 0, 1, 1,
-1.141715, -1.329898, -1.018923, 0, 0, 0, 1, 1,
-1.13907, 0.8065987, -0.2335449, 0, 0, 0, 1, 1,
-1.130676, -0.4526754, -1.970717, 0, 0, 0, 1, 1,
-1.125618, -1.032231, -2.55823, 0, 0, 0, 1, 1,
-1.114172, -1.059334, -1.706493, 1, 1, 1, 1, 1,
-1.112535, 1.951367, 0.1912256, 1, 1, 1, 1, 1,
-1.105546, 1.016942, -0.08669826, 1, 1, 1, 1, 1,
-1.100594, -0.7182778, -2.856967, 1, 1, 1, 1, 1,
-1.098918, 0.1908456, -3.171264, 1, 1, 1, 1, 1,
-1.094033, 0.1707334, -0.6492423, 1, 1, 1, 1, 1,
-1.088965, -0.05221031, -1.355052, 1, 1, 1, 1, 1,
-1.086686, -0.4556519, -1.284017, 1, 1, 1, 1, 1,
-1.086369, -1.837228, -3.287086, 1, 1, 1, 1, 1,
-1.085234, 0.5039726, -1.325205, 1, 1, 1, 1, 1,
-1.082892, 0.8051037, -0.6066732, 1, 1, 1, 1, 1,
-1.078063, 0.7488611, -0.3242171, 1, 1, 1, 1, 1,
-1.076305, 0.5255542, -0.1610709, 1, 1, 1, 1, 1,
-1.072532, 0.5379183, -1.167133, 1, 1, 1, 1, 1,
-1.071695, 1.158804, -0.7890885, 1, 1, 1, 1, 1,
-1.065472, -0.3025912, -3.48981, 0, 0, 1, 1, 1,
-1.062373, 0.4741023, 0.08340438, 1, 0, 0, 1, 1,
-1.056866, 0.6584176, -1.439641, 1, 0, 0, 1, 1,
-1.052934, -0.3313809, 0.5565532, 1, 0, 0, 1, 1,
-1.047193, 0.2850322, 0.1690957, 1, 0, 0, 1, 1,
-1.046752, 1.356, 0.3812496, 1, 0, 0, 1, 1,
-1.044719, -1.302693, -1.640278, 0, 0, 0, 1, 1,
-1.043365, 0.5251339, -0.0261233, 0, 0, 0, 1, 1,
-1.037584, 1.695072, 1.29364, 0, 0, 0, 1, 1,
-1.03659, -1.050823, -1.509828, 0, 0, 0, 1, 1,
-1.034062, -1.298912, -1.689982, 0, 0, 0, 1, 1,
-1.022021, 0.3442028, -0.3156409, 0, 0, 0, 1, 1,
-1.001677, 0.08474141, -2.070578, 0, 0, 0, 1, 1,
-1.00153, 0.2137968, -1.850033, 1, 1, 1, 1, 1,
-0.9843817, -0.8502244, -5.228494, 1, 1, 1, 1, 1,
-0.9759692, 0.1952382, -2.209295, 1, 1, 1, 1, 1,
-0.9745015, -0.5063748, -1.195529, 1, 1, 1, 1, 1,
-0.9735149, -0.9586274, -3.045976, 1, 1, 1, 1, 1,
-0.9689408, -0.6490532, -3.16532, 1, 1, 1, 1, 1,
-0.962617, 0.04472966, -0.0002850761, 1, 1, 1, 1, 1,
-0.9621441, -0.1111073, -3.405261, 1, 1, 1, 1, 1,
-0.9603047, 0.5219463, -1.804403, 1, 1, 1, 1, 1,
-0.9560528, -0.9540858, -1.976846, 1, 1, 1, 1, 1,
-0.9542814, -0.9300678, -1.616021, 1, 1, 1, 1, 1,
-0.9516947, 0.9210317, -1.038311, 1, 1, 1, 1, 1,
-0.9511818, 1.020144, 1.006471, 1, 1, 1, 1, 1,
-0.9495334, 0.09471951, -1.964577, 1, 1, 1, 1, 1,
-0.9489954, 1.86996, -2.75913, 1, 1, 1, 1, 1,
-0.9472185, -0.4547441, -2.981703, 0, 0, 1, 1, 1,
-0.9434678, -1.480017, -1.995801, 1, 0, 0, 1, 1,
-0.9407465, -0.5259194, -1.701988, 1, 0, 0, 1, 1,
-0.9390556, -1.059875, -2.255257, 1, 0, 0, 1, 1,
-0.9358572, -1.225961, -3.975734, 1, 0, 0, 1, 1,
-0.9351907, 0.4172789, -1.370766, 1, 0, 0, 1, 1,
-0.9304124, -0.1230881, -1.399721, 0, 0, 0, 1, 1,
-0.9260813, -0.4679853, -2.118755, 0, 0, 0, 1, 1,
-0.925499, -1.060417, -0.5921325, 0, 0, 0, 1, 1,
-0.9252183, -0.4819625, -3.110939, 0, 0, 0, 1, 1,
-0.9251902, 1.869031, 0.4227355, 0, 0, 0, 1, 1,
-0.9209191, -0.2551087, -2.826073, 0, 0, 0, 1, 1,
-0.9170805, 0.7468952, 0.8411712, 0, 0, 0, 1, 1,
-0.9160407, -1.429483, -3.907869, 1, 1, 1, 1, 1,
-0.9096863, -0.2761093, -3.542169, 1, 1, 1, 1, 1,
-0.9065456, -0.5500248, -3.045178, 1, 1, 1, 1, 1,
-0.9023708, 1.320895, 0.9648867, 1, 1, 1, 1, 1,
-0.9003732, -0.2122289, -1.10475, 1, 1, 1, 1, 1,
-0.898429, 0.03085651, -2.776902, 1, 1, 1, 1, 1,
-0.8951816, -0.1212338, -3.110712, 1, 1, 1, 1, 1,
-0.8922781, 0.3539336, 1.394318, 1, 1, 1, 1, 1,
-0.8820068, 2.057201, 1.323516, 1, 1, 1, 1, 1,
-0.8812584, -0.4362595, -3.62717, 1, 1, 1, 1, 1,
-0.8700289, -1.502877, -1.597661, 1, 1, 1, 1, 1,
-0.8667212, -0.2313581, -1.186579, 1, 1, 1, 1, 1,
-0.8656085, -0.8281156, -1.737244, 1, 1, 1, 1, 1,
-0.864971, -0.3525503, -2.467532, 1, 1, 1, 1, 1,
-0.8597956, 1.252886, -0.09422276, 1, 1, 1, 1, 1,
-0.8554338, 1.645177, -1.000612, 0, 0, 1, 1, 1,
-0.8374267, 0.5836947, 0.2873935, 1, 0, 0, 1, 1,
-0.8306176, -0.07191519, 0.03216941, 1, 0, 0, 1, 1,
-0.8262879, 0.5586523, -1.271125, 1, 0, 0, 1, 1,
-0.8259742, 0.9399423, 0.1367334, 1, 0, 0, 1, 1,
-0.8228595, 0.5355293, -2.043691, 1, 0, 0, 1, 1,
-0.8181823, -0.05766224, -3.969372, 0, 0, 0, 1, 1,
-0.8054579, 1.739955, -0.8727347, 0, 0, 0, 1, 1,
-0.8006798, -0.2151202, -2.002193, 0, 0, 0, 1, 1,
-0.7979863, -0.8676272, -1.152715, 0, 0, 0, 1, 1,
-0.7976715, 0.4758071, -1.770504, 0, 0, 0, 1, 1,
-0.7895905, -1.494966, -3.969298, 0, 0, 0, 1, 1,
-0.7874987, -0.4727157, -2.785298, 0, 0, 0, 1, 1,
-0.779691, -0.2227318, -1.41761, 1, 1, 1, 1, 1,
-0.7645234, 0.7277076, -0.1388744, 1, 1, 1, 1, 1,
-0.7641661, -0.196535, -2.429767, 1, 1, 1, 1, 1,
-0.7539054, -0.3603641, -4.091722, 1, 1, 1, 1, 1,
-0.7532518, 0.09710935, -2.17762, 1, 1, 1, 1, 1,
-0.7526027, -2.502794, -2.400292, 1, 1, 1, 1, 1,
-0.746637, -0.6955513, -2.948368, 1, 1, 1, 1, 1,
-0.7447429, -0.7897583, -2.838929, 1, 1, 1, 1, 1,
-0.7407335, -0.8507147, -1.583423, 1, 1, 1, 1, 1,
-0.7396669, -0.398831, -3.953601, 1, 1, 1, 1, 1,
-0.7342315, 0.7181501, -0.4386973, 1, 1, 1, 1, 1,
-0.7332783, 0.3271974, -1.850125, 1, 1, 1, 1, 1,
-0.7282815, 1.674492, 0.7761828, 1, 1, 1, 1, 1,
-0.727419, 0.7293116, -0.5230691, 1, 1, 1, 1, 1,
-0.7212901, 0.5027069, -2.427327, 1, 1, 1, 1, 1,
-0.7209693, 1.361792, -0.03931694, 0, 0, 1, 1, 1,
-0.7185839, 0.2282365, -0.3861834, 1, 0, 0, 1, 1,
-0.7171389, 0.3848677, -1.848167, 1, 0, 0, 1, 1,
-0.7167635, 0.6197461, -0.6254804, 1, 0, 0, 1, 1,
-0.7016686, 0.05173513, -0.4396917, 1, 0, 0, 1, 1,
-0.7006552, -0.63164, -4.075341, 1, 0, 0, 1, 1,
-0.7001473, 0.3141817, -0.9336314, 0, 0, 0, 1, 1,
-0.6992978, 0.5052858, 0.8394457, 0, 0, 0, 1, 1,
-0.6979151, -1.049504, -1.494218, 0, 0, 0, 1, 1,
-0.6929051, 1.09251, -0.7792805, 0, 0, 0, 1, 1,
-0.6895102, -0.4684246, -2.346655, 0, 0, 0, 1, 1,
-0.6878501, -1.156503, -1.780792, 0, 0, 0, 1, 1,
-0.6825737, -1.548924, -2.006625, 0, 0, 0, 1, 1,
-0.6819909, 1.798265, -0.6127756, 1, 1, 1, 1, 1,
-0.6810747, -0.2422195, -0.9587679, 1, 1, 1, 1, 1,
-0.6748817, -1.087897, -3.53647, 1, 1, 1, 1, 1,
-0.6729816, 0.7833008, -1.700071, 1, 1, 1, 1, 1,
-0.6677089, 0.3875732, -2.989777, 1, 1, 1, 1, 1,
-0.664312, 0.772527, -2.285026, 1, 1, 1, 1, 1,
-0.6621711, -1.253255, -1.896207, 1, 1, 1, 1, 1,
-0.6592643, 0.5894433, -1.745178, 1, 1, 1, 1, 1,
-0.6578471, 1.475621, -0.9408411, 1, 1, 1, 1, 1,
-0.6574257, 0.8917257, -0.7846975, 1, 1, 1, 1, 1,
-0.6569126, 0.9577379, 0.9140955, 1, 1, 1, 1, 1,
-0.6562492, 0.1782159, -2.637975, 1, 1, 1, 1, 1,
-0.6554955, -1.447605, -2.848622, 1, 1, 1, 1, 1,
-0.6534055, 0.8755552, 1.501238, 1, 1, 1, 1, 1,
-0.6459934, -0.2266455, -2.766112, 1, 1, 1, 1, 1,
-0.6356906, -1.207647, -3.608704, 0, 0, 1, 1, 1,
-0.6342887, -0.2412195, -1.618594, 1, 0, 0, 1, 1,
-0.6290939, 2.032492, 0.2873145, 1, 0, 0, 1, 1,
-0.6255912, 1.27402, 0.09645961, 1, 0, 0, 1, 1,
-0.6214551, 1.220692, -0.9644584, 1, 0, 0, 1, 1,
-0.6195782, 0.3035998, -3.014426, 1, 0, 0, 1, 1,
-0.6189519, 0.08829046, 0.6389638, 0, 0, 0, 1, 1,
-0.6181077, -0.06608874, -0.8808784, 0, 0, 0, 1, 1,
-0.6144431, -1.69694, -3.255529, 0, 0, 0, 1, 1,
-0.6142661, -0.6730106, -1.495623, 0, 0, 0, 1, 1,
-0.6125977, -0.2382428, -1.281469, 0, 0, 0, 1, 1,
-0.612265, -0.3975072, -2.555911, 0, 0, 0, 1, 1,
-0.6099052, 0.4518813, -0.1578819, 0, 0, 0, 1, 1,
-0.6097553, 0.9073016, -0.8424031, 1, 1, 1, 1, 1,
-0.6091223, 0.3350344, -2.010509, 1, 1, 1, 1, 1,
-0.6080837, 0.02905418, -1.961822, 1, 1, 1, 1, 1,
-0.6061437, -1.013225, -0.6306621, 1, 1, 1, 1, 1,
-0.6003096, -1.084561, -2.376616, 1, 1, 1, 1, 1,
-0.5974234, 0.3101321, -1.433246, 1, 1, 1, 1, 1,
-0.5968843, 0.8800395, -1.129518, 1, 1, 1, 1, 1,
-0.5963229, 2.493423, -0.1461043, 1, 1, 1, 1, 1,
-0.5938397, -0.1497652, -0.4239096, 1, 1, 1, 1, 1,
-0.5925879, 1.350533, -0.336357, 1, 1, 1, 1, 1,
-0.591551, -2.303447, -2.696202, 1, 1, 1, 1, 1,
-0.5848246, 0.2067573, -0.9221425, 1, 1, 1, 1, 1,
-0.5839528, -1.469333, -1.688389, 1, 1, 1, 1, 1,
-0.5803554, -0.9682725, -2.780615, 1, 1, 1, 1, 1,
-0.579974, 0.5969583, 0.6271163, 1, 1, 1, 1, 1,
-0.5771844, 0.3845586, -0.3117538, 0, 0, 1, 1, 1,
-0.575791, -1.740686, -1.644447, 1, 0, 0, 1, 1,
-0.5750564, 1.576445, -0.4225768, 1, 0, 0, 1, 1,
-0.573943, -0.6477879, -2.133476, 1, 0, 0, 1, 1,
-0.5715592, -2.004769, -3.42972, 1, 0, 0, 1, 1,
-0.5674681, -0.7292295, -2.722655, 1, 0, 0, 1, 1,
-0.5655377, 0.4703133, -1.192288, 0, 0, 0, 1, 1,
-0.5653906, 0.282827, -0.1689818, 0, 0, 0, 1, 1,
-0.564687, -0.4741427, -2.172964, 0, 0, 0, 1, 1,
-0.5636141, -1.230372, -3.226072, 0, 0, 0, 1, 1,
-0.5621046, 0.6492271, -0.9360608, 0, 0, 0, 1, 1,
-0.5605618, -1.323984, -2.398432, 0, 0, 0, 1, 1,
-0.5602358, 0.4319582, -0.3845398, 0, 0, 0, 1, 1,
-0.5599162, -0.2112755, -2.230769, 1, 1, 1, 1, 1,
-0.5554157, -0.2922216, -2.039236, 1, 1, 1, 1, 1,
-0.553956, 0.5897897, -0.4199122, 1, 1, 1, 1, 1,
-0.5520169, -1.536851, -1.99109, 1, 1, 1, 1, 1,
-0.5512181, -0.8718883, -1.963072, 1, 1, 1, 1, 1,
-0.5503676, -1.031374, -3.60723, 1, 1, 1, 1, 1,
-0.5500138, 1.615184, -0.07162553, 1, 1, 1, 1, 1,
-0.5498981, -0.4339211, -2.735119, 1, 1, 1, 1, 1,
-0.5454057, -0.3466228, -3.394014, 1, 1, 1, 1, 1,
-0.5384623, -0.6065236, -2.552618, 1, 1, 1, 1, 1,
-0.5368823, -1.390986, -3.033704, 1, 1, 1, 1, 1,
-0.5356591, 1.647081, 2.298563, 1, 1, 1, 1, 1,
-0.5294724, 0.7484486, -1.838017, 1, 1, 1, 1, 1,
-0.5292482, -2.118135, -3.637705, 1, 1, 1, 1, 1,
-0.5236619, 0.6394811, -2.645918, 1, 1, 1, 1, 1,
-0.5161797, -0.1592379, -3.236573, 0, 0, 1, 1, 1,
-0.5143355, 1.664208, -2.299569, 1, 0, 0, 1, 1,
-0.5133319, -1.732928, -2.848821, 1, 0, 0, 1, 1,
-0.5117021, 0.1567494, -2.611374, 1, 0, 0, 1, 1,
-0.5071264, -0.3283069, -0.7334292, 1, 0, 0, 1, 1,
-0.5063267, 1.995157, 1.753863, 1, 0, 0, 1, 1,
-0.5035541, 0.9847497, -1.099924, 0, 0, 0, 1, 1,
-0.5023219, -0.5829648, -1.587688, 0, 0, 0, 1, 1,
-0.5015162, 1.63856, 0.2759783, 0, 0, 0, 1, 1,
-0.5008659, 0.2780546, -3.565882, 0, 0, 0, 1, 1,
-0.4996423, -0.671307, -3.86603, 0, 0, 0, 1, 1,
-0.4985385, -0.6403195, -1.616769, 0, 0, 0, 1, 1,
-0.4968577, 1.860627, -0.6625195, 0, 0, 0, 1, 1,
-0.496282, -0.7924591, -4.722361, 1, 1, 1, 1, 1,
-0.4953239, -0.4132363, -1.406953, 1, 1, 1, 1, 1,
-0.4953213, 0.2668662, -0.6417574, 1, 1, 1, 1, 1,
-0.4949145, 1.513888, -0.7874131, 1, 1, 1, 1, 1,
-0.4904773, 0.7176716, -1.560706, 1, 1, 1, 1, 1,
-0.4902378, 1.187254, 1.145279, 1, 1, 1, 1, 1,
-0.4893205, 1.820014, -0.7118398, 1, 1, 1, 1, 1,
-0.4847486, -0.4061679, -2.417348, 1, 1, 1, 1, 1,
-0.4845153, 0.4777941, -0.01966835, 1, 1, 1, 1, 1,
-0.4833845, -0.9766858, -3.396446, 1, 1, 1, 1, 1,
-0.4744407, 0.8808752, -0.5795636, 1, 1, 1, 1, 1,
-0.4716262, 0.7095622, 0.001640455, 1, 1, 1, 1, 1,
-0.4590579, -0.5052686, -2.853772, 1, 1, 1, 1, 1,
-0.4586838, -0.06941433, -1.729205, 1, 1, 1, 1, 1,
-0.451366, 1.819588, 1.25474, 1, 1, 1, 1, 1,
-0.4509163, -0.4579279, -1.585099, 0, 0, 1, 1, 1,
-0.4496427, -0.8975634, -4.140616, 1, 0, 0, 1, 1,
-0.4474332, -1.302796, -4.565193, 1, 0, 0, 1, 1,
-0.4430018, -0.5410714, -1.178667, 1, 0, 0, 1, 1,
-0.4352363, -0.1007865, 0.5142437, 1, 0, 0, 1, 1,
-0.4329249, 1.839224, 1.532476, 1, 0, 0, 1, 1,
-0.428831, 0.8244707, -0.3581747, 0, 0, 0, 1, 1,
-0.4225501, 0.1819467, -1.593267, 0, 0, 0, 1, 1,
-0.4211564, 0.5952905, 0.1755721, 0, 0, 0, 1, 1,
-0.4160344, 0.4030197, -1.136476, 0, 0, 0, 1, 1,
-0.4158704, 0.531064, -1.65377, 0, 0, 0, 1, 1,
-0.4074529, -0.6340167, -4.213926, 0, 0, 0, 1, 1,
-0.4060055, -1.036472, -2.577619, 0, 0, 0, 1, 1,
-0.402386, -1.137721, -2.705698, 1, 1, 1, 1, 1,
-0.4019613, 0.3630358, -0.01231567, 1, 1, 1, 1, 1,
-0.3983717, -0.1020903, -2.977562, 1, 1, 1, 1, 1,
-0.3940802, -0.9875056, -2.919319, 1, 1, 1, 1, 1,
-0.3934378, 0.8928475, -1.903047, 1, 1, 1, 1, 1,
-0.3919995, 0.07940524, -1.421653, 1, 1, 1, 1, 1,
-0.3918652, -0.8156862, -1.964528, 1, 1, 1, 1, 1,
-0.3805841, -1.019239, -3.654698, 1, 1, 1, 1, 1,
-0.3805119, -1.296151, -2.218704, 1, 1, 1, 1, 1,
-0.3804785, -1.627662, -2.302525, 1, 1, 1, 1, 1,
-0.3804514, -0.4098961, -2.238574, 1, 1, 1, 1, 1,
-0.3804194, 1.205457, 0.3515526, 1, 1, 1, 1, 1,
-0.3798054, 1.160983, 1.421502, 1, 1, 1, 1, 1,
-0.3770406, 0.2147009, -2.625299, 1, 1, 1, 1, 1,
-0.3735219, -0.9850627, -3.965245, 1, 1, 1, 1, 1,
-0.3707785, 0.1672943, 0.1676434, 0, 0, 1, 1, 1,
-0.364065, 0.4204379, -0.7380328, 1, 0, 0, 1, 1,
-0.3503504, -1.345839, -2.537561, 1, 0, 0, 1, 1,
-0.3498695, 0.7111921, -0.1849943, 1, 0, 0, 1, 1,
-0.3424629, 0.08142672, -1.779229, 1, 0, 0, 1, 1,
-0.3415045, -0.824445, -3.41969, 1, 0, 0, 1, 1,
-0.3404282, -0.2327052, -3.334103, 0, 0, 0, 1, 1,
-0.3351741, 0.8228074, 1.351479, 0, 0, 0, 1, 1,
-0.335113, 0.1651368, -1.099789, 0, 0, 0, 1, 1,
-0.3338657, 0.7850892, -0.9320978, 0, 0, 0, 1, 1,
-0.3337646, 2.00355, 0.1196589, 0, 0, 0, 1, 1,
-0.3337071, -0.1331595, -0.5897121, 0, 0, 0, 1, 1,
-0.3302463, -1.620601, -2.846368, 0, 0, 0, 1, 1,
-0.3281586, 0.2727723, -0.3802797, 1, 1, 1, 1, 1,
-0.3262663, 0.3096256, -2.550915, 1, 1, 1, 1, 1,
-0.3258729, -1.248809, -3.238146, 1, 1, 1, 1, 1,
-0.3195847, -0.5137013, -3.672382, 1, 1, 1, 1, 1,
-0.3178642, 0.1465985, 0.2256712, 1, 1, 1, 1, 1,
-0.3175173, 1.019658, -0.2627624, 1, 1, 1, 1, 1,
-0.3147297, -0.1917487, -2.955415, 1, 1, 1, 1, 1,
-0.3126619, -0.8881668, -1.570055, 1, 1, 1, 1, 1,
-0.3121946, -0.417808, -2.243577, 1, 1, 1, 1, 1,
-0.3080082, 1.555889, 0.03678086, 1, 1, 1, 1, 1,
-0.3061383, 0.6302819, -0.4518263, 1, 1, 1, 1, 1,
-0.3048115, 0.001144571, -0.7982768, 1, 1, 1, 1, 1,
-0.2976805, -0.6934441, -1.756721, 1, 1, 1, 1, 1,
-0.2957589, -2.654731, -2.359909, 1, 1, 1, 1, 1,
-0.2957019, 1.552978, -0.1175735, 1, 1, 1, 1, 1,
-0.2946796, -0.2735742, -0.6992444, 0, 0, 1, 1, 1,
-0.2934986, 0.07472027, -0.3124374, 1, 0, 0, 1, 1,
-0.2934718, -1.456634, -2.510647, 1, 0, 0, 1, 1,
-0.2896547, -0.9578083, -1.745756, 1, 0, 0, 1, 1,
-0.2782195, 0.2832883, -2.476653, 1, 0, 0, 1, 1,
-0.2768129, 0.2790909, -1.386979, 1, 0, 0, 1, 1,
-0.2747746, 0.8728914, -0.2999585, 0, 0, 0, 1, 1,
-0.2716265, -0.8535519, -2.981987, 0, 0, 0, 1, 1,
-0.2708388, 0.7365889, -0.9286665, 0, 0, 0, 1, 1,
-0.2655512, -2.29699, -3.060792, 0, 0, 0, 1, 1,
-0.2644801, 0.3883059, -1.848664, 0, 0, 0, 1, 1,
-0.2614318, -0.2363904, -0.3367261, 0, 0, 0, 1, 1,
-0.2561285, -0.5460321, -4.260818, 0, 0, 0, 1, 1,
-0.2514405, -0.9486341, -2.041979, 1, 1, 1, 1, 1,
-0.2472744, 2.064647, -0.5551669, 1, 1, 1, 1, 1,
-0.2422405, 0.6466033, -0.80871, 1, 1, 1, 1, 1,
-0.2419865, -0.6707823, -4.509944, 1, 1, 1, 1, 1,
-0.2410762, 1.234458, -0.1511992, 1, 1, 1, 1, 1,
-0.2406338, 0.8731879, -1.479673, 1, 1, 1, 1, 1,
-0.2388585, 0.03866752, -1.534781, 1, 1, 1, 1, 1,
-0.2358053, 1.351913, -0.01109814, 1, 1, 1, 1, 1,
-0.2325297, -0.7300472, -3.09718, 1, 1, 1, 1, 1,
-0.2310447, -1.301496, -3.749137, 1, 1, 1, 1, 1,
-0.2306497, -0.2316581, -1.486147, 1, 1, 1, 1, 1,
-0.2301955, -0.5933457, -1.764686, 1, 1, 1, 1, 1,
-0.2289179, 0.09650284, -1.647488, 1, 1, 1, 1, 1,
-0.2197119, 0.5024986, -1.164851, 1, 1, 1, 1, 1,
-0.2178251, 0.7134972, -1.018852, 1, 1, 1, 1, 1,
-0.2148426, 0.7894745, 0.04568614, 0, 0, 1, 1, 1,
-0.2146996, -0.6383185, -1.800982, 1, 0, 0, 1, 1,
-0.2098487, 0.1226668, -0.407441, 1, 0, 0, 1, 1,
-0.2096486, 1.754974, -0.8639741, 1, 0, 0, 1, 1,
-0.2084826, 0.1053822, 1.197202, 1, 0, 0, 1, 1,
-0.2079784, 1.793494, -0.8446578, 1, 0, 0, 1, 1,
-0.2077219, -0.4641956, -3.89168, 0, 0, 0, 1, 1,
-0.2063228, -0.856643, -2.260525, 0, 0, 0, 1, 1,
-0.2042663, -0.1818874, -1.497772, 0, 0, 0, 1, 1,
-0.2024031, -0.803816, -2.693307, 0, 0, 0, 1, 1,
-0.1958318, 0.2556985, -1.955382, 0, 0, 0, 1, 1,
-0.1908341, -0.7016621, -3.45853, 0, 0, 0, 1, 1,
-0.1824964, 0.4327332, -2.122857, 0, 0, 0, 1, 1,
-0.1779017, 0.7427144, -0.05079284, 1, 1, 1, 1, 1,
-0.1639315, 0.6502222, -2.119549, 1, 1, 1, 1, 1,
-0.160219, 0.6838335, 0.4664969, 1, 1, 1, 1, 1,
-0.1583342, 0.5720562, 0.4062527, 1, 1, 1, 1, 1,
-0.1562093, 0.7653782, -1.170927, 1, 1, 1, 1, 1,
-0.1540092, -0.5664751, -1.665265, 1, 1, 1, 1, 1,
-0.153121, -0.1657118, -2.513098, 1, 1, 1, 1, 1,
-0.1496592, 1.22538, 1.614752, 1, 1, 1, 1, 1,
-0.1443158, -0.2132212, -3.748505, 1, 1, 1, 1, 1,
-0.1401156, 0.2986039, -0.8925632, 1, 1, 1, 1, 1,
-0.1389444, -0.2805393, -3.211128, 1, 1, 1, 1, 1,
-0.1374894, -0.344434, -1.324264, 1, 1, 1, 1, 1,
-0.136389, -0.0589737, -0.7378159, 1, 1, 1, 1, 1,
-0.1297743, -0.5644786, -1.940975, 1, 1, 1, 1, 1,
-0.1268449, 0.04555773, -2.52561, 1, 1, 1, 1, 1,
-0.1265581, -1.349613, -3.087115, 0, 0, 1, 1, 1,
-0.1261734, -0.6298376, -2.749604, 1, 0, 0, 1, 1,
-0.1256377, -0.9948854, -0.7360119, 1, 0, 0, 1, 1,
-0.1170775, 0.177212, -0.05854901, 1, 0, 0, 1, 1,
-0.116522, 0.1164345, -1.242124, 1, 0, 0, 1, 1,
-0.1087127, 1.365859, -0.6104694, 1, 0, 0, 1, 1,
-0.1062974, -0.7574589, -5.142198, 0, 0, 0, 1, 1,
-0.104866, -0.9836099, -3.495888, 0, 0, 0, 1, 1,
-0.1035966, 0.6382763, -0.2437021, 0, 0, 0, 1, 1,
-0.1029789, -0.3685732, -2.682489, 0, 0, 0, 1, 1,
-0.1011273, -2.713968, -4.018512, 0, 0, 0, 1, 1,
-0.0924394, -0.1186803, -3.426165, 0, 0, 0, 1, 1,
-0.09171144, -0.4757293, -4.653983, 0, 0, 0, 1, 1,
-0.08872078, 0.719269, -0.5102394, 1, 1, 1, 1, 1,
-0.08834451, -0.1186985, -1.290155, 1, 1, 1, 1, 1,
-0.08529842, 1.209426, 0.2201905, 1, 1, 1, 1, 1,
-0.08375965, 1.585446, -0.09694909, 1, 1, 1, 1, 1,
-0.08184069, -0.762843, -1.991775, 1, 1, 1, 1, 1,
-0.08130111, -0.1877875, -4.225373, 1, 1, 1, 1, 1,
-0.07828924, 0.1695521, -0.2655451, 1, 1, 1, 1, 1,
-0.07805867, 0.1795984, -0.8646643, 1, 1, 1, 1, 1,
-0.07672758, -1.296918, -2.932811, 1, 1, 1, 1, 1,
-0.07124297, -0.06420806, -2.225169, 1, 1, 1, 1, 1,
-0.07008148, -1.0891, -2.421309, 1, 1, 1, 1, 1,
-0.06964575, 0.9828711, 0.5388473, 1, 1, 1, 1, 1,
-0.06950763, -1.28748, -3.199179, 1, 1, 1, 1, 1,
-0.06505615, 0.6208885, 0.1727498, 1, 1, 1, 1, 1,
-0.06487958, -1.43823, -3.007284, 1, 1, 1, 1, 1,
-0.06355444, 1.327717, 1.703071, 0, 0, 1, 1, 1,
-0.06103118, 0.3765604, 0.7041863, 1, 0, 0, 1, 1,
-0.06026313, 1.221895, -0.02632704, 1, 0, 0, 1, 1,
-0.05755327, 0.3764297, -1.850422, 1, 0, 0, 1, 1,
-0.05261328, -0.7098342, -1.246407, 1, 0, 0, 1, 1,
-0.04780288, 0.245298, -1.172608, 1, 0, 0, 1, 1,
-0.04542556, -1.153685, -3.534127, 0, 0, 0, 1, 1,
-0.0436141, 1.722588, -1.386426, 0, 0, 0, 1, 1,
-0.03777803, -1.055429, -2.68089, 0, 0, 0, 1, 1,
-0.03693058, -1.131592, -4.425071, 0, 0, 0, 1, 1,
-0.03564002, 1.514835, -0.3600944, 0, 0, 0, 1, 1,
-0.03479888, 0.4123258, -1.243783, 0, 0, 0, 1, 1,
-0.02956217, -1.174825, -2.467389, 0, 0, 0, 1, 1,
-0.02839645, 0.5006579, -1.222416, 1, 1, 1, 1, 1,
-0.02095693, -0.7383628, -2.347932, 1, 1, 1, 1, 1,
-0.02057519, 1.953172, -0.93924, 1, 1, 1, 1, 1,
-0.01752287, -0.8449468, -2.409002, 1, 1, 1, 1, 1,
-0.01712698, 1.333712, 1.15713, 1, 1, 1, 1, 1,
-0.01541159, 0.5551624, -1.112178, 1, 1, 1, 1, 1,
-0.01172856, -0.9006419, -4.235706, 1, 1, 1, 1, 1,
-0.009514607, -0.1176858, -2.992852, 1, 1, 1, 1, 1,
-0.008054707, -0.1803367, -3.145366, 1, 1, 1, 1, 1,
-0.007714715, 1.152614, -1.015098, 1, 1, 1, 1, 1,
-0.007500339, 1.040194, -0.4363506, 1, 1, 1, 1, 1,
-0.006486687, 0.24099, -0.3458983, 1, 1, 1, 1, 1,
-0.00448285, 0.8535816, 0.03020055, 1, 1, 1, 1, 1,
-0.002394096, 1.859717, -0.6158463, 1, 1, 1, 1, 1,
0.004022206, -1.287024, 3.269942, 1, 1, 1, 1, 1,
0.006619063, 0.4507245, -1.586572, 0, 0, 1, 1, 1,
0.007134181, -0.2324589, 4.097438, 1, 0, 0, 1, 1,
0.008330943, -0.5225196, 1.948264, 1, 0, 0, 1, 1,
0.009305903, -0.9070749, 3.583129, 1, 0, 0, 1, 1,
0.02192739, 2.365078, -1.423177, 1, 0, 0, 1, 1,
0.02392758, -0.6639833, 4.86644, 1, 0, 0, 1, 1,
0.02483228, 0.6908162, -0.586657, 0, 0, 0, 1, 1,
0.02505511, -0.8898516, 3.526433, 0, 0, 0, 1, 1,
0.03054138, 0.3372441, 0.07983928, 0, 0, 0, 1, 1,
0.0319294, 1.577992, -0.05696518, 0, 0, 0, 1, 1,
0.03238194, -0.3341407, 0.8173447, 0, 0, 0, 1, 1,
0.03259817, 0.5787121, -1.556289, 0, 0, 0, 1, 1,
0.0339949, -0.8863019, 4.764327, 0, 0, 0, 1, 1,
0.03655042, -0.2144636, 2.17255, 1, 1, 1, 1, 1,
0.03710388, -0.8244921, 4.084918, 1, 1, 1, 1, 1,
0.04187219, -0.6989238, 3.042191, 1, 1, 1, 1, 1,
0.04318497, -0.02788862, 2.659698, 1, 1, 1, 1, 1,
0.04560284, 1.591746, -0.5136942, 1, 1, 1, 1, 1,
0.04720457, -0.1449292, 3.097522, 1, 1, 1, 1, 1,
0.05070043, -0.7058574, 2.551353, 1, 1, 1, 1, 1,
0.07035897, -0.9736069, 5.255057, 1, 1, 1, 1, 1,
0.07134984, 1.52391, -1.8807, 1, 1, 1, 1, 1,
0.07297458, -1.004499, 4.24272, 1, 1, 1, 1, 1,
0.07496409, 2.267077, -0.7595331, 1, 1, 1, 1, 1,
0.07549433, -1.309452, 5.356254, 1, 1, 1, 1, 1,
0.07601754, -0.198935, 1.32666, 1, 1, 1, 1, 1,
0.07896542, -0.7250597, 3.745911, 1, 1, 1, 1, 1,
0.07981065, -0.6209499, 3.172478, 1, 1, 1, 1, 1,
0.08049148, 1.125743, 0.2205819, 0, 0, 1, 1, 1,
0.08054844, -1.385289, 4.251457, 1, 0, 0, 1, 1,
0.08146843, 0.001263512, 1.626691, 1, 0, 0, 1, 1,
0.08489885, -1.23169, 2.368441, 1, 0, 0, 1, 1,
0.09519884, 0.280264, -0.6073416, 1, 0, 0, 1, 1,
0.09640611, 2.428488, -3.029838, 1, 0, 0, 1, 1,
0.09729826, 0.4407372, 2.613152, 0, 0, 0, 1, 1,
0.0979008, -1.146364, 2.837166, 0, 0, 0, 1, 1,
0.1001447, 1.130902, 0.5633461, 0, 0, 0, 1, 1,
0.1058146, 0.8487819, 0.2114198, 0, 0, 0, 1, 1,
0.1064374, 1.043267, 1.668567, 0, 0, 0, 1, 1,
0.1066539, -0.633374, 2.008028, 0, 0, 0, 1, 1,
0.1114136, -0.5093571, 4.438355, 0, 0, 0, 1, 1,
0.112324, -0.9104904, 2.670729, 1, 1, 1, 1, 1,
0.1133643, 0.5870402, -1.758354, 1, 1, 1, 1, 1,
0.1161785, 0.157673, -0.9958652, 1, 1, 1, 1, 1,
0.1226256, 0.1901571, 0.1492917, 1, 1, 1, 1, 1,
0.1232725, -0.09176045, 1.946628, 1, 1, 1, 1, 1,
0.1233772, -0.02610824, 2.191001, 1, 1, 1, 1, 1,
0.1250389, -0.661039, 1.302405, 1, 1, 1, 1, 1,
0.1255777, -0.06810503, 2.435966, 1, 1, 1, 1, 1,
0.1290599, 0.9255101, 0.7010322, 1, 1, 1, 1, 1,
0.1299451, -0.5964477, 1.382585, 1, 1, 1, 1, 1,
0.1304728, 2.275537, 0.8391858, 1, 1, 1, 1, 1,
0.131283, -0.2522303, -0.04459788, 1, 1, 1, 1, 1,
0.1315281, -1.088342, 2.822939, 1, 1, 1, 1, 1,
0.1338386, -0.7328447, 4.304815, 1, 1, 1, 1, 1,
0.1350902, -0.1724936, 2.998479, 1, 1, 1, 1, 1,
0.1430724, -0.3694785, 2.78127, 0, 0, 1, 1, 1,
0.1453753, -0.9378546, 2.484306, 1, 0, 0, 1, 1,
0.1476334, -0.8733547, 1.87301, 1, 0, 0, 1, 1,
0.1493791, -0.1791125, 2.212142, 1, 0, 0, 1, 1,
0.1513015, 2.341254, -0.9653386, 1, 0, 0, 1, 1,
0.1524797, 0.289128, -0.03763054, 1, 0, 0, 1, 1,
0.1532081, -0.18458, 2.769992, 0, 0, 0, 1, 1,
0.153903, -1.422198, 3.434981, 0, 0, 0, 1, 1,
0.157904, 1.695285, -0.370887, 0, 0, 0, 1, 1,
0.1605969, -1.290184, 3.891372, 0, 0, 0, 1, 1,
0.1651757, -1.646456, 2.963536, 0, 0, 0, 1, 1,
0.1652724, 0.06799009, 0.6670178, 0, 0, 0, 1, 1,
0.1683757, -0.5534962, 1.387065, 0, 0, 0, 1, 1,
0.1696734, -1.306435, 3.582757, 1, 1, 1, 1, 1,
0.1705752, 0.973047, -0.3098989, 1, 1, 1, 1, 1,
0.1746037, -1.051401, 4.638482, 1, 1, 1, 1, 1,
0.1759829, -0.5918943, 3.7642, 1, 1, 1, 1, 1,
0.1772126, -1.376656, 4.836909, 1, 1, 1, 1, 1,
0.1798298, -0.6727254, 3.613508, 1, 1, 1, 1, 1,
0.1828453, 1.853091, -1.721367, 1, 1, 1, 1, 1,
0.1881145, 0.6589801, 0.7306934, 1, 1, 1, 1, 1,
0.1892619, -1.846613, 1.8126, 1, 1, 1, 1, 1,
0.1925782, 1.065626, -1.032511, 1, 1, 1, 1, 1,
0.1963156, -1.163983, 2.683604, 1, 1, 1, 1, 1,
0.1965087, -1.880996, 1.236069, 1, 1, 1, 1, 1,
0.1974324, 0.8658609, -0.3034249, 1, 1, 1, 1, 1,
0.1975, 0.9688376, -0.2632544, 1, 1, 1, 1, 1,
0.1981128, -0.7262236, 4.168705, 1, 1, 1, 1, 1,
0.1986265, 1.318107, 0.673331, 0, 0, 1, 1, 1,
0.1989206, -1.084271, 1.306652, 1, 0, 0, 1, 1,
0.2010909, -0.2622172, 0.9121596, 1, 0, 0, 1, 1,
0.2074587, 0.3959677, 0.1020715, 1, 0, 0, 1, 1,
0.2090297, -1.171223, 2.067065, 1, 0, 0, 1, 1,
0.2105925, -0.88909, 1.379307, 1, 0, 0, 1, 1,
0.2114976, 1.747871, -0.6880581, 0, 0, 0, 1, 1,
0.2126928, -0.3474075, 1.281504, 0, 0, 0, 1, 1,
0.2145671, 0.6994683, 1.310103, 0, 0, 0, 1, 1,
0.2178365, 1.318663, -0.3281831, 0, 0, 0, 1, 1,
0.2179023, -0.7701605, 1.405761, 0, 0, 0, 1, 1,
0.221216, -0.4267829, 2.949514, 0, 0, 0, 1, 1,
0.2235419, -0.1310861, 1.339777, 0, 0, 0, 1, 1,
0.2333855, 0.04862508, 1.478134, 1, 1, 1, 1, 1,
0.2336297, -0.367413, 3.782399, 1, 1, 1, 1, 1,
0.2374504, -2.05055, 1.32752, 1, 1, 1, 1, 1,
0.2375001, -0.1040449, 2.950771, 1, 1, 1, 1, 1,
0.2498951, -0.2666864, 1.836025, 1, 1, 1, 1, 1,
0.250777, 1.558542, -0.2479898, 1, 1, 1, 1, 1,
0.253572, 1.58456, -1.622996, 1, 1, 1, 1, 1,
0.2572633, -0.4123791, 2.433959, 1, 1, 1, 1, 1,
0.261018, -0.5966021, 1.588531, 1, 1, 1, 1, 1,
0.2646652, -0.9290042, 2.310917, 1, 1, 1, 1, 1,
0.2649677, 0.7891071, 1.427169, 1, 1, 1, 1, 1,
0.2651098, 2.483599, 1.229932, 1, 1, 1, 1, 1,
0.2654036, -0.7146721, 3.573898, 1, 1, 1, 1, 1,
0.2664337, -0.9668534, 2.919827, 1, 1, 1, 1, 1,
0.2682627, -1.599062, 2.524828, 1, 1, 1, 1, 1,
0.2696423, 1.545727, -0.7863232, 0, 0, 1, 1, 1,
0.2763801, 1.430995, 0.1656563, 1, 0, 0, 1, 1,
0.2814678, -0.2275785, 1.545778, 1, 0, 0, 1, 1,
0.2879134, -0.4261639, 2.041342, 1, 0, 0, 1, 1,
0.289622, 0.1578036, 1.901532, 1, 0, 0, 1, 1,
0.2901246, 0.9740215, -0.5400209, 1, 0, 0, 1, 1,
0.2929893, 2.111162, 1.464004, 0, 0, 0, 1, 1,
0.294926, 0.7628086, -0.744123, 0, 0, 0, 1, 1,
0.2990629, -1.249541, 4.07459, 0, 0, 0, 1, 1,
0.2991164, -0.3616144, 0.7902065, 0, 0, 0, 1, 1,
0.3027498, -0.6632187, 1.311453, 0, 0, 0, 1, 1,
0.3031733, 0.7479506, 1.852399, 0, 0, 0, 1, 1,
0.3037888, -1.270863, 3.287238, 0, 0, 0, 1, 1,
0.3096699, -1.059521, 3.534248, 1, 1, 1, 1, 1,
0.3113046, 0.8512143, 1.718815, 1, 1, 1, 1, 1,
0.3165881, 0.05886972, 3.309531, 1, 1, 1, 1, 1,
0.3171432, 0.897507, 0.294597, 1, 1, 1, 1, 1,
0.3237064, 0.2931816, 2.785002, 1, 1, 1, 1, 1,
0.3245728, -2.114364, 4.946929, 1, 1, 1, 1, 1,
0.3301967, -1.292208, 5.355715, 1, 1, 1, 1, 1,
0.3307272, -0.8814775, 4.623064, 1, 1, 1, 1, 1,
0.3329622, 0.4857603, -0.2672356, 1, 1, 1, 1, 1,
0.3359693, 0.4827296, 0.7472865, 1, 1, 1, 1, 1,
0.3397882, -0.2547952, 0.5251901, 1, 1, 1, 1, 1,
0.3483386, -0.3244859, 1.650495, 1, 1, 1, 1, 1,
0.3562966, -0.5742693, 3.12958, 1, 1, 1, 1, 1,
0.3595092, -0.4248987, 3.458092, 1, 1, 1, 1, 1,
0.366585, 1.329618, 0.587128, 1, 1, 1, 1, 1,
0.3688416, -0.8674621, 3.266183, 0, 0, 1, 1, 1,
0.3692164, -1.443944, 2.251539, 1, 0, 0, 1, 1,
0.3714674, 0.7926876, -0.1082017, 1, 0, 0, 1, 1,
0.3732714, -0.7831886, 2.329388, 1, 0, 0, 1, 1,
0.3741265, 0.7995201, 0.743259, 1, 0, 0, 1, 1,
0.3764189, 0.7350871, -1.728989, 1, 0, 0, 1, 1,
0.377496, 1.572135, 1.594207, 0, 0, 0, 1, 1,
0.3782298, 0.1425201, 0.4069184, 0, 0, 0, 1, 1,
0.382419, -1.242739, 4.146712, 0, 0, 0, 1, 1,
0.3902761, -1.830598, 5.576203, 0, 0, 0, 1, 1,
0.3949476, -1.080683, 3.700715, 0, 0, 0, 1, 1,
0.3952596, -1.127418, 2.563513, 0, 0, 0, 1, 1,
0.3960927, -0.957725, 2.037777, 0, 0, 0, 1, 1,
0.3974906, -0.6184691, 2.454455, 1, 1, 1, 1, 1,
0.3992872, 0.677204, 0.1682608, 1, 1, 1, 1, 1,
0.4024976, 1.441282, 0.1716073, 1, 1, 1, 1, 1,
0.4041936, 1.588429, 0.7842858, 1, 1, 1, 1, 1,
0.4043614, 1.105009, 0.2079376, 1, 1, 1, 1, 1,
0.4093486, 2.144133, 0.9132322, 1, 1, 1, 1, 1,
0.4142888, -1.243927, 4.350928, 1, 1, 1, 1, 1,
0.4182435, 0.9989745, 0.2035971, 1, 1, 1, 1, 1,
0.4207328, 2.480527, 1.354391, 1, 1, 1, 1, 1,
0.4217655, -0.7448943, 1.22177, 1, 1, 1, 1, 1,
0.4237627, -0.5315699, 4.483546, 1, 1, 1, 1, 1,
0.4239093, -0.06053021, 2.277743, 1, 1, 1, 1, 1,
0.4304964, 0.6693609, -0.2064105, 1, 1, 1, 1, 1,
0.4309433, 1.04908, 0.3859007, 1, 1, 1, 1, 1,
0.432575, -1.003373, 3.136649, 1, 1, 1, 1, 1,
0.4377849, -0.1287043, 1.765349, 0, 0, 1, 1, 1,
0.4460924, -0.5754111, 4.590392, 1, 0, 0, 1, 1,
0.453111, -0.06436746, 0.6831815, 1, 0, 0, 1, 1,
0.4592033, 0.06423861, 1.751782, 1, 0, 0, 1, 1,
0.4635439, -0.1787363, 4.429383, 1, 0, 0, 1, 1,
0.4637518, 0.2529043, 1.850037, 1, 0, 0, 1, 1,
0.4706773, -0.2766128, 1.952753, 0, 0, 0, 1, 1,
0.474228, -0.3592088, 1.259035, 0, 0, 0, 1, 1,
0.4763473, -0.4691054, 1.120499, 0, 0, 0, 1, 1,
0.4777627, 0.3664872, 1.978011, 0, 0, 0, 1, 1,
0.4796145, 0.3458519, -0.5278195, 0, 0, 0, 1, 1,
0.4842554, 2.559936, 0.9544115, 0, 0, 0, 1, 1,
0.4960024, -0.5015768, 2.67599, 0, 0, 0, 1, 1,
0.5067564, 0.3514882, -0.9188788, 1, 1, 1, 1, 1,
0.5080789, 2.733365, 2.497914, 1, 1, 1, 1, 1,
0.5174929, -0.789169, 3.656569, 1, 1, 1, 1, 1,
0.5187163, -0.6388601, 2.676041, 1, 1, 1, 1, 1,
0.5195871, 0.04100161, 0.2377329, 1, 1, 1, 1, 1,
0.520968, -0.3982263, 2.701168, 1, 1, 1, 1, 1,
0.5213387, 1.464516, 1.768707, 1, 1, 1, 1, 1,
0.5345591, -0.7944677, 1.109313, 1, 1, 1, 1, 1,
0.5347023, 0.5612625, 1.033007, 1, 1, 1, 1, 1,
0.5466617, 0.391751, 0.1613763, 1, 1, 1, 1, 1,
0.5478235, 0.1576891, 1.613108, 1, 1, 1, 1, 1,
0.5501702, -0.5135974, 0.5558188, 1, 1, 1, 1, 1,
0.55055, 1.254511, 1.010926, 1, 1, 1, 1, 1,
0.5569324, -0.1688438, 3.112776, 1, 1, 1, 1, 1,
0.5575572, -0.3000802, 1.104464, 1, 1, 1, 1, 1,
0.5705143, -0.2304987, 2.355226, 0, 0, 1, 1, 1,
0.5706411, 1.058692, 0.7192149, 1, 0, 0, 1, 1,
0.5712674, -0.1222554, 1.427791, 1, 0, 0, 1, 1,
0.5774698, -1.571816, 2.384585, 1, 0, 0, 1, 1,
0.581616, -0.3314262, 2.937955, 1, 0, 0, 1, 1,
0.5945025, -0.3855367, 1.270595, 1, 0, 0, 1, 1,
0.595435, 0.08997909, 1.02541, 0, 0, 0, 1, 1,
0.6027887, -1.318401, 2.489234, 0, 0, 0, 1, 1,
0.605303, -1.114496, 2.469918, 0, 0, 0, 1, 1,
0.6095341, -0.7390493, 1.803521, 0, 0, 0, 1, 1,
0.6096455, -0.5950779, 3.409868, 0, 0, 0, 1, 1,
0.612721, -0.6434465, 2.990764, 0, 0, 0, 1, 1,
0.6134917, -0.5925027, 1.20568, 0, 0, 0, 1, 1,
0.6143472, 0.1107458, 1.822256, 1, 1, 1, 1, 1,
0.6196703, -0.008837149, 2.017505, 1, 1, 1, 1, 1,
0.6203782, 0.6159941, 0.8475882, 1, 1, 1, 1, 1,
0.6233164, 0.3139085, 0.1444867, 1, 1, 1, 1, 1,
0.6241955, -0.3123248, 3.580346, 1, 1, 1, 1, 1,
0.6310034, -0.6542788, 2.863121, 1, 1, 1, 1, 1,
0.6329433, -0.3534078, 2.61748, 1, 1, 1, 1, 1,
0.6335552, 1.136679, -0.2945097, 1, 1, 1, 1, 1,
0.6365902, 0.5519499, 0.6907688, 1, 1, 1, 1, 1,
0.6379675, -0.5317472, 2.872113, 1, 1, 1, 1, 1,
0.639132, 2.496873, -0.850459, 1, 1, 1, 1, 1,
0.644112, -1.182824, 2.27292, 1, 1, 1, 1, 1,
0.6443092, -0.9068674, 1.763916, 1, 1, 1, 1, 1,
0.6447262, 0.8248698, 0.551722, 1, 1, 1, 1, 1,
0.6447738, -1.393523, 3.698703, 1, 1, 1, 1, 1,
0.6455193, 0.5428871, 0.2965384, 0, 0, 1, 1, 1,
0.6464181, 0.1202829, 1.524663, 1, 0, 0, 1, 1,
0.6548027, 1.057391, 0.1009195, 1, 0, 0, 1, 1,
0.6655892, 0.4483368, 1.462072, 1, 0, 0, 1, 1,
0.6725959, -0.5851328, 1.794266, 1, 0, 0, 1, 1,
0.672667, 1.809188, 0.7071516, 1, 0, 0, 1, 1,
0.6786717, 0.9403827, -0.459579, 0, 0, 0, 1, 1,
0.6864326, -1.591131, 2.267772, 0, 0, 0, 1, 1,
0.6870623, -0.275602, 1.517634, 0, 0, 0, 1, 1,
0.6907492, -1.69459, 3.320744, 0, 0, 0, 1, 1,
0.6910275, 0.819603, -0.9478062, 0, 0, 0, 1, 1,
0.6916038, -0.7008439, 3.511626, 0, 0, 0, 1, 1,
0.6929724, 0.3675635, 1.430488, 0, 0, 0, 1, 1,
0.6937141, 0.3009003, 3.003975, 1, 1, 1, 1, 1,
0.6977529, -1.195934, 2.938945, 1, 1, 1, 1, 1,
0.7002147, -1.31654, 3.647891, 1, 1, 1, 1, 1,
0.7017198, 0.2880336, 3.413745, 1, 1, 1, 1, 1,
0.7021195, -0.08936786, 0.3896001, 1, 1, 1, 1, 1,
0.7081313, 0.1380383, 3.366244, 1, 1, 1, 1, 1,
0.7088439, -0.8655514, 2.04197, 1, 1, 1, 1, 1,
0.7091035, 1.094919, 0.9383073, 1, 1, 1, 1, 1,
0.7159276, -0.7835239, 2.654361, 1, 1, 1, 1, 1,
0.7162382, -1.293534, 2.625666, 1, 1, 1, 1, 1,
0.722107, -0.03561232, 1.299639, 1, 1, 1, 1, 1,
0.7231221, 1.569289, -0.4366686, 1, 1, 1, 1, 1,
0.7286568, -1.793761, 3.043762, 1, 1, 1, 1, 1,
0.7352369, -0.1260272, 1.631825, 1, 1, 1, 1, 1,
0.7354558, -1.607156, 1.754489, 1, 1, 1, 1, 1,
0.7368277, -1.424021, 2.041457, 0, 0, 1, 1, 1,
0.741352, -0.4276365, 5.70694, 1, 0, 0, 1, 1,
0.7447149, -0.2507494, 1.038383, 1, 0, 0, 1, 1,
0.7458448, 0.2741382, -0.6254164, 1, 0, 0, 1, 1,
0.748013, -0.5297054, 3.27497, 1, 0, 0, 1, 1,
0.7505125, 0.5718321, -1.123825, 1, 0, 0, 1, 1,
0.7564033, 1.682049, 0.456517, 0, 0, 0, 1, 1,
0.7601906, 1.426879, 0.4508696, 0, 0, 0, 1, 1,
0.7619313, 0.03233384, 2.343786, 0, 0, 0, 1, 1,
0.7632493, -1.650835, 2.512741, 0, 0, 0, 1, 1,
0.7683623, 0.009288739, 1.340064, 0, 0, 0, 1, 1,
0.7848164, 0.4692588, 0.2801853, 0, 0, 0, 1, 1,
0.7854164, -0.2864281, 1.824535, 0, 0, 0, 1, 1,
0.7857318, -0.4862464, 2.210158, 1, 1, 1, 1, 1,
0.7913662, 0.5714508, 3.43148, 1, 1, 1, 1, 1,
0.7940871, 0.9130372, 1.1325, 1, 1, 1, 1, 1,
0.7946714, -0.6346039, 0.8583508, 1, 1, 1, 1, 1,
0.796683, -0.8857663, 3.715222, 1, 1, 1, 1, 1,
0.7991834, -0.8036942, -0.5445402, 1, 1, 1, 1, 1,
0.8076924, 0.8892741, -0.3685358, 1, 1, 1, 1, 1,
0.8146034, 1.195172, 0.4862348, 1, 1, 1, 1, 1,
0.8258903, 0.08239146, 2.050094, 1, 1, 1, 1, 1,
0.8289478, -1.33068, 3.146011, 1, 1, 1, 1, 1,
0.8308944, -0.4782643, 2.465488, 1, 1, 1, 1, 1,
0.8428475, 0.6780807, 1.924353, 1, 1, 1, 1, 1,
0.8432041, 0.5862693, 0.4741876, 1, 1, 1, 1, 1,
0.8500744, -0.6856663, 2.768991, 1, 1, 1, 1, 1,
0.8572361, -2.925596, 3.862454, 1, 1, 1, 1, 1,
0.8730139, -0.3624047, 3.165157, 0, 0, 1, 1, 1,
0.8730195, -0.528511, 1.659213, 1, 0, 0, 1, 1,
0.8732184, -1.321121, 2.997083, 1, 0, 0, 1, 1,
0.8745953, 0.0807737, -0.2435045, 1, 0, 0, 1, 1,
0.8820164, 1.245668, 0.3976562, 1, 0, 0, 1, 1,
0.8953258, 0.5273794, 0.6139131, 1, 0, 0, 1, 1,
0.8997307, 1.4977, 0.2320809, 0, 0, 0, 1, 1,
0.9011062, -0.5327873, 4.105028, 0, 0, 0, 1, 1,
0.901116, 0.5592024, 1.260012, 0, 0, 0, 1, 1,
0.9019287, -0.3327968, 4.101909, 0, 0, 0, 1, 1,
0.9023821, -0.1481226, 1.713819, 0, 0, 0, 1, 1,
0.9043276, -1.566437, 3.276671, 0, 0, 0, 1, 1,
0.9079468, 1.38852, -0.1759946, 0, 0, 0, 1, 1,
0.9114584, -0.6153923, 2.276764, 1, 1, 1, 1, 1,
0.9155331, -0.01945198, 1.680263, 1, 1, 1, 1, 1,
0.920276, 0.04713996, 0.05013816, 1, 1, 1, 1, 1,
0.9206127, 1.329524, -0.4537443, 1, 1, 1, 1, 1,
0.9246519, -0.2008582, 2.615797, 1, 1, 1, 1, 1,
0.9261236, -0.5794671, 2.56855, 1, 1, 1, 1, 1,
0.9297774, -1.172578, 3.596664, 1, 1, 1, 1, 1,
0.93264, -0.2488206, 0.8226693, 1, 1, 1, 1, 1,
0.9354385, 0.8644578, 1.575376, 1, 1, 1, 1, 1,
0.9382411, 0.5176129, 1.227737, 1, 1, 1, 1, 1,
0.9389669, 0.001863468, 2.471869, 1, 1, 1, 1, 1,
0.9461085, -0.773176, 0.9222432, 1, 1, 1, 1, 1,
0.9500157, 0.385521, -0.371911, 1, 1, 1, 1, 1,
0.9538337, -0.05076717, 2.822971, 1, 1, 1, 1, 1,
0.9593599, 1.541865, 1.130492, 1, 1, 1, 1, 1,
0.9637845, 0.7119614, 0.4345937, 0, 0, 1, 1, 1,
0.9692843, 1.054842, 0.8303329, 1, 0, 0, 1, 1,
0.9717583, -0.03691368, 2.118409, 1, 0, 0, 1, 1,
0.9724399, -0.4163698, 2.811188, 1, 0, 0, 1, 1,
0.9765472, -0.1239331, 0.2977657, 1, 0, 0, 1, 1,
0.9778327, -1.642916, 2.742124, 1, 0, 0, 1, 1,
0.9873026, 1.285941, 0.351699, 0, 0, 0, 1, 1,
0.9882205, 0.6109304, -0.9651897, 0, 0, 0, 1, 1,
0.989241, -0.1683854, 0.4611845, 0, 0, 0, 1, 1,
0.9911836, -1.06222, 2.432918, 0, 0, 0, 1, 1,
0.9923958, 0.2217964, 0.1057065, 0, 0, 0, 1, 1,
0.995006, -0.5180634, 1.781879, 0, 0, 0, 1, 1,
0.9985325, -0.6667994, 1.733278, 0, 0, 0, 1, 1,
1.008143, -0.564609, 2.70919, 1, 1, 1, 1, 1,
1.008378, -0.007794844, 2.355857, 1, 1, 1, 1, 1,
1.014162, -1.425787, 1.918213, 1, 1, 1, 1, 1,
1.015606, -1.301221, 3.237145, 1, 1, 1, 1, 1,
1.023449, 0.9570675, 0.6198847, 1, 1, 1, 1, 1,
1.030903, 0.1275422, -0.9898033, 1, 1, 1, 1, 1,
1.034272, 0.06880619, 1.146368, 1, 1, 1, 1, 1,
1.035922, -0.7841539, 1.299447, 1, 1, 1, 1, 1,
1.040588, -0.2797768, 3.622173, 1, 1, 1, 1, 1,
1.043729, -0.4452768, 1.905051, 1, 1, 1, 1, 1,
1.05378, 1.135791, 0.4931332, 1, 1, 1, 1, 1,
1.053829, 0.2357045, 1.102954, 1, 1, 1, 1, 1,
1.054379, 1.566553, 1.441841, 1, 1, 1, 1, 1,
1.057476, -0.6487404, 2.305996, 1, 1, 1, 1, 1,
1.057674, -0.4969623, 3.520449, 1, 1, 1, 1, 1,
1.065572, -0.9918684, 0.6217243, 0, 0, 1, 1, 1,
1.069272, -0.7506304, 2.029664, 1, 0, 0, 1, 1,
1.072634, -0.2604443, 2.287689, 1, 0, 0, 1, 1,
1.07347, 0.06744325, 2.015601, 1, 0, 0, 1, 1,
1.081331, 0.4850483, 1.996186, 1, 0, 0, 1, 1,
1.085587, 0.539565, 2.0969, 1, 0, 0, 1, 1,
1.085804, -1.136781, 3.038561, 0, 0, 0, 1, 1,
1.088335, -0.7904369, 1.599459, 0, 0, 0, 1, 1,
1.088559, -0.546339, 3.033022, 0, 0, 0, 1, 1,
1.090404, 0.4580288, 2.442328, 0, 0, 0, 1, 1,
1.091168, 0.8266323, 1.605222, 0, 0, 0, 1, 1,
1.132205, 1.207549, 1.517207, 0, 0, 0, 1, 1,
1.133625, 0.03228915, 2.377082, 0, 0, 0, 1, 1,
1.13976, -1.293447, 3.031089, 1, 1, 1, 1, 1,
1.146366, -0.188588, 2.768447, 1, 1, 1, 1, 1,
1.146577, -0.04729699, 3.087424, 1, 1, 1, 1, 1,
1.146749, -0.09886138, 2.980649, 1, 1, 1, 1, 1,
1.147637, 2.191339, -0.6451316, 1, 1, 1, 1, 1,
1.14791, -0.6660686, 2.277327, 1, 1, 1, 1, 1,
1.159639, 0.8205583, 0.2373514, 1, 1, 1, 1, 1,
1.160968, -0.7266552, 1.321301, 1, 1, 1, 1, 1,
1.167404, -0.5067643, 3.036148, 1, 1, 1, 1, 1,
1.177476, 0.6672701, 1.52683, 1, 1, 1, 1, 1,
1.197482, 0.05039822, 4.064632, 1, 1, 1, 1, 1,
1.198115, -0.9776284, 1.286035, 1, 1, 1, 1, 1,
1.20109, 0.6558794, 2.472988, 1, 1, 1, 1, 1,
1.203756, -1.793079, 1.027962, 1, 1, 1, 1, 1,
1.21359, 1.393553, 0.3092966, 1, 1, 1, 1, 1,
1.214251, -0.360659, 2.201212, 0, 0, 1, 1, 1,
1.21746, -2.230731, 4.162649, 1, 0, 0, 1, 1,
1.220003, 1.433446, 1.259258, 1, 0, 0, 1, 1,
1.220273, 0.2205544, 1.031737, 1, 0, 0, 1, 1,
1.221561, 1.016008, 1.94713, 1, 0, 0, 1, 1,
1.225316, 1.888666, -0.206344, 1, 0, 0, 1, 1,
1.23322, -0.5269377, 3.027639, 0, 0, 0, 1, 1,
1.234511, -1.495003, 3.691418, 0, 0, 0, 1, 1,
1.243161, -0.3304792, 0.5290066, 0, 0, 0, 1, 1,
1.246667, 0.7205954, 0.7073869, 0, 0, 0, 1, 1,
1.254911, -1.713455, 4.278601, 0, 0, 0, 1, 1,
1.255279, -0.4609426, 2.072429, 0, 0, 0, 1, 1,
1.260939, -2.310859, 3.076195, 0, 0, 0, 1, 1,
1.268083, 0.03273073, 3.598396, 1, 1, 1, 1, 1,
1.268866, -3.225952, 1.462327, 1, 1, 1, 1, 1,
1.284538, -0.1341646, 1.733541, 1, 1, 1, 1, 1,
1.288997, -1.180473, 3.655085, 1, 1, 1, 1, 1,
1.296505, -0.7796335, 1.240404, 1, 1, 1, 1, 1,
1.298565, 1.993345, 0.8437877, 1, 1, 1, 1, 1,
1.306077, -0.09498139, 2.696129, 1, 1, 1, 1, 1,
1.309943, 0.7350628, 1.382097, 1, 1, 1, 1, 1,
1.311797, -1.934196, 2.505767, 1, 1, 1, 1, 1,
1.3167, 1.283941, -1.191627, 1, 1, 1, 1, 1,
1.322216, 2.732853, 0.4952362, 1, 1, 1, 1, 1,
1.328918, 0.6042312, 1.536905, 1, 1, 1, 1, 1,
1.334881, 1.945301, 0.918867, 1, 1, 1, 1, 1,
1.339588, -0.2537695, 2.299761, 1, 1, 1, 1, 1,
1.347897, 1.923806, -0.8900836, 1, 1, 1, 1, 1,
1.355892, -2.267806, 3.204008, 0, 0, 1, 1, 1,
1.369231, -2.087107, 2.282191, 1, 0, 0, 1, 1,
1.371363, -0.7350108, 2.133796, 1, 0, 0, 1, 1,
1.382352, -0.4829739, 1.116349, 1, 0, 0, 1, 1,
1.387699, 1.170109, 0.7070568, 1, 0, 0, 1, 1,
1.390134, -1.329077, 1.446899, 1, 0, 0, 1, 1,
1.3931, 2.288106, 0.9975018, 0, 0, 0, 1, 1,
1.40395, 1.063151, 0.05818699, 0, 0, 0, 1, 1,
1.405816, -1.412798, 2.970904, 0, 0, 0, 1, 1,
1.409712, 0.3856702, 2.827432, 0, 0, 0, 1, 1,
1.41655, 1.377423, -0.2396204, 0, 0, 0, 1, 1,
1.430262, -1.69219, 1.267769, 0, 0, 0, 1, 1,
1.431435, 0.1762794, 2.790078, 0, 0, 0, 1, 1,
1.453995, -0.2755881, 1.558516, 1, 1, 1, 1, 1,
1.45978, -3.155494, 1.658678, 1, 1, 1, 1, 1,
1.46175, -0.6006134, 1.837047, 1, 1, 1, 1, 1,
1.493317, -1.066513, 1.296161, 1, 1, 1, 1, 1,
1.504902, -1.40887, 0.7871228, 1, 1, 1, 1, 1,
1.512062, -0.1746933, 2.681931, 1, 1, 1, 1, 1,
1.512572, 1.915775, 0.4642409, 1, 1, 1, 1, 1,
1.519175, 1.034997, 0.0771091, 1, 1, 1, 1, 1,
1.527927, 0.1760404, 0.8422021, 1, 1, 1, 1, 1,
1.529697, 0.381777, 1.451625, 1, 1, 1, 1, 1,
1.548443, -0.8778918, 1.489986, 1, 1, 1, 1, 1,
1.54998, -0.8831877, 3.568945, 1, 1, 1, 1, 1,
1.553377, 0.1353028, 3.5933, 1, 1, 1, 1, 1,
1.561774, -1.503455, 1.978203, 1, 1, 1, 1, 1,
1.56516, 0.4209007, 2.190704, 1, 1, 1, 1, 1,
1.568212, -0.799698, 1.407639, 0, 0, 1, 1, 1,
1.573234, -0.5690691, 3.447568, 1, 0, 0, 1, 1,
1.575798, 1.131207, -0.3498417, 1, 0, 0, 1, 1,
1.57904, 0.9842363, -1.721955, 1, 0, 0, 1, 1,
1.584638, -0.8239154, 4.063101, 1, 0, 0, 1, 1,
1.586928, -2.329936, 0.8978963, 1, 0, 0, 1, 1,
1.603006, 0.4538414, -1.226909, 0, 0, 0, 1, 1,
1.63859, -0.4350606, 4.582424, 0, 0, 0, 1, 1,
1.644906, -1.299731, 1.619941, 0, 0, 0, 1, 1,
1.648314, 0.7256884, 1.031819, 0, 0, 0, 1, 1,
1.655579, 0.5774205, 1.396351, 0, 0, 0, 1, 1,
1.657694, -1.358669, 1.983784, 0, 0, 0, 1, 1,
1.683303, -0.2855316, 2.498537, 0, 0, 0, 1, 1,
1.708092, 0.3330001, 1.210604, 1, 1, 1, 1, 1,
1.711774, -0.657068, 2.701841, 1, 1, 1, 1, 1,
1.729067, 0.7665401, 0.6116592, 1, 1, 1, 1, 1,
1.729425, 0.1208069, 0.3064469, 1, 1, 1, 1, 1,
1.741079, 2.291525, 0.2588333, 1, 1, 1, 1, 1,
1.742039, 1.139141, -0.552901, 1, 1, 1, 1, 1,
1.743934, -1.554707, 2.628536, 1, 1, 1, 1, 1,
1.757524, -0.4747432, 1.432348, 1, 1, 1, 1, 1,
1.760583, 0.1126593, 2.729812, 1, 1, 1, 1, 1,
1.762389, -0.1169917, 0.9884967, 1, 1, 1, 1, 1,
1.777136, -0.6345468, 0.3816001, 1, 1, 1, 1, 1,
1.791448, 0.6124344, 0.9069285, 1, 1, 1, 1, 1,
1.796639, -1.994369, 1.731145, 1, 1, 1, 1, 1,
1.798366, 0.7670644, 1.926049, 1, 1, 1, 1, 1,
1.800653, 0.4612904, 1.944073, 1, 1, 1, 1, 1,
1.800967, 0.5084171, 1.992679, 0, 0, 1, 1, 1,
1.805592, -0.9405548, 0.07342106, 1, 0, 0, 1, 1,
1.82243, 1.943344, 0.801728, 1, 0, 0, 1, 1,
1.828122, 0.3176354, 0.3053816, 1, 0, 0, 1, 1,
1.852629, 1.314949, 1.354045, 1, 0, 0, 1, 1,
1.862345, -1.252784, 3.38114, 1, 0, 0, 1, 1,
1.863047, 1.384407, 1.125763, 0, 0, 0, 1, 1,
1.917641, 0.1502354, 2.065673, 0, 0, 0, 1, 1,
1.928177, 0.486856, 1.900001, 0, 0, 0, 1, 1,
1.94644, 0.6206363, 1.932303, 0, 0, 0, 1, 1,
1.979691, -0.07669747, 1.288735, 0, 0, 0, 1, 1,
1.98755, -1.30687, 2.015149, 0, 0, 0, 1, 1,
2.004988, 0.1362398, 1.117117, 0, 0, 0, 1, 1,
2.035829, 1.222191, 1.948806, 1, 1, 1, 1, 1,
2.042928, -2.086199, 1.088788, 1, 1, 1, 1, 1,
2.077864, -0.2673336, 3.00277, 1, 1, 1, 1, 1,
2.082402, -0.3555162, 2.794748, 1, 1, 1, 1, 1,
2.097673, -1.468448, 2.243988, 1, 1, 1, 1, 1,
2.098032, 1.368034, 0.1744923, 1, 1, 1, 1, 1,
2.104618, -0.1726039, 1.276554, 1, 1, 1, 1, 1,
2.106247, 0.9195513, 0.8101246, 1, 1, 1, 1, 1,
2.121305, -0.08399599, 1.577787, 1, 1, 1, 1, 1,
2.141605, -0.7576163, 2.655628, 1, 1, 1, 1, 1,
2.14229, -0.3661141, 2.195626, 1, 1, 1, 1, 1,
2.158442, 0.5810968, 0.00923716, 1, 1, 1, 1, 1,
2.191857, 0.08546435, 1.921999, 1, 1, 1, 1, 1,
2.200395, -0.4454552, 3.236188, 1, 1, 1, 1, 1,
2.219758, 1.752519, -0.04393492, 1, 1, 1, 1, 1,
2.229889, -1.657322, 3.791351, 0, 0, 1, 1, 1,
2.230266, 0.6512211, 1.072383, 1, 0, 0, 1, 1,
2.257325, 1.960816, 0.2035488, 1, 0, 0, 1, 1,
2.352743, 0.4027928, 1.111748, 1, 0, 0, 1, 1,
2.375844, -0.9728251, 3.743947, 1, 0, 0, 1, 1,
2.482732, 0.4126396, 1.305018, 1, 0, 0, 1, 1,
2.491809, -0.0257948, 0.9207366, 0, 0, 0, 1, 1,
2.525902, 1.544068, 1.763709, 0, 0, 0, 1, 1,
2.567817, -1.399887, 1.251478, 0, 0, 0, 1, 1,
2.575852, -0.2687913, 0.5395576, 0, 0, 0, 1, 1,
2.613875, -2.491101, 1.591696, 0, 0, 0, 1, 1,
2.626074, 0.8287077, 1.626442, 0, 0, 0, 1, 1,
2.634994, 1.421046, 0.9106128, 0, 0, 0, 1, 1,
2.658745, -0.3015362, 0.947615, 1, 1, 1, 1, 1,
2.858254, -0.968101, 1.871147, 1, 1, 1, 1, 1,
3.071595, -2.406851, 3.095759, 1, 1, 1, 1, 1,
3.219512, -0.03736952, 0.7009572, 1, 1, 1, 1, 1,
3.343261, 0.1834743, 2.075525, 1, 1, 1, 1, 1,
3.721327, -0.5375206, 1.719013, 1, 1, 1, 1, 1,
4.040862, -0.6853362, 2.684781, 1, 1, 1, 1, 1
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
var radius = 9.629706;
var distance = 33.82393;
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
mvMatrix.translate( -0.6957326, 0.2352283, -0.239223 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82393);
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
