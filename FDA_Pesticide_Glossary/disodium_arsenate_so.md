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
-3.893208, -1.382105, -0.8631225, 1, 0, 0, 1,
-3.114543, -1.339046, -2.873102, 1, 0.007843138, 0, 1,
-3.033027, -1.175341, -1.820426, 1, 0.01176471, 0, 1,
-3.010445, 0.4108992, -0.8551149, 1, 0.01960784, 0, 1,
-2.915229, -0.4523079, -2.355904, 1, 0.02352941, 0, 1,
-2.62378, -0.5229204, 0.4677565, 1, 0.03137255, 0, 1,
-2.594598, 0.9996544, -0.9611004, 1, 0.03529412, 0, 1,
-2.494998, 0.2429223, -2.585912, 1, 0.04313726, 0, 1,
-2.485771, 0.544215, -1.068196, 1, 0.04705882, 0, 1,
-2.403278, -0.210545, -1.825913, 1, 0.05490196, 0, 1,
-2.382768, -0.09079377, -1.752632, 1, 0.05882353, 0, 1,
-2.375424, -0.1813405, -2.254833, 1, 0.06666667, 0, 1,
-2.365874, -1.392495, -2.028352, 1, 0.07058824, 0, 1,
-2.357182, 0.8986835, -0.1543451, 1, 0.07843138, 0, 1,
-2.34433, -0.913614, -1.928534, 1, 0.08235294, 0, 1,
-2.338685, 0.4117035, -1.319252, 1, 0.09019608, 0, 1,
-2.303122, 0.7437943, -1.702379, 1, 0.09411765, 0, 1,
-2.287869, -0.7323647, -2.44332, 1, 0.1019608, 0, 1,
-2.258735, -0.6915634, -1.194656, 1, 0.1098039, 0, 1,
-2.253224, 0.05992185, -1.636408, 1, 0.1137255, 0, 1,
-2.252017, -0.9598577, -2.215392, 1, 0.1215686, 0, 1,
-2.179374, -0.8799418, -1.886036, 1, 0.1254902, 0, 1,
-2.16283, 0.05109611, -2.341218, 1, 0.1333333, 0, 1,
-2.160982, 0.8415149, -0.3238544, 1, 0.1372549, 0, 1,
-2.120201, -0.08415809, -1.986824, 1, 0.145098, 0, 1,
-2.0932, -0.210489, -0.4009245, 1, 0.1490196, 0, 1,
-1.982116, -0.535416, -2.593712, 1, 0.1568628, 0, 1,
-1.927259, -2.056071, -2.42996, 1, 0.1607843, 0, 1,
-1.90751, 0.4236283, -2.235754, 1, 0.1686275, 0, 1,
-1.894478, 0.5929371, -0.2168996, 1, 0.172549, 0, 1,
-1.88909, 0.9599648, -2.322608, 1, 0.1803922, 0, 1,
-1.885453, -1.209542, -4.169856, 1, 0.1843137, 0, 1,
-1.884524, -0.433927, -0.06417346, 1, 0.1921569, 0, 1,
-1.877105, 0.08140542, -1.462546, 1, 0.1960784, 0, 1,
-1.865882, 0.2342618, -1.014082, 1, 0.2039216, 0, 1,
-1.80301, 0.8414236, -0.56893, 1, 0.2117647, 0, 1,
-1.80164, -0.2029815, -1.032415, 1, 0.2156863, 0, 1,
-1.777889, 1.68352, 0.5351532, 1, 0.2235294, 0, 1,
-1.766284, -0.05009024, -1.233489, 1, 0.227451, 0, 1,
-1.763011, 1.296559, -0.5346501, 1, 0.2352941, 0, 1,
-1.7444, 0.4151238, -1.662659, 1, 0.2392157, 0, 1,
-1.708691, -0.3779386, 0.2616459, 1, 0.2470588, 0, 1,
-1.704734, -1.16741, -3.500436, 1, 0.2509804, 0, 1,
-1.699175, 1.577127, -1.298268, 1, 0.2588235, 0, 1,
-1.696902, 2.134905, -0.4273756, 1, 0.2627451, 0, 1,
-1.690782, 0.2407438, -1.198642, 1, 0.2705882, 0, 1,
-1.684056, -0.377409, -1.592045, 1, 0.2745098, 0, 1,
-1.68121, 0.1498283, -2.643101, 1, 0.282353, 0, 1,
-1.670404, 0.6639023, -1.704338, 1, 0.2862745, 0, 1,
-1.667003, 0.4037737, -0.9399561, 1, 0.2941177, 0, 1,
-1.665616, 0.3384601, -1.650395, 1, 0.3019608, 0, 1,
-1.639407, -1.200918, -1.193525, 1, 0.3058824, 0, 1,
-1.63355, -0.6672938, -1.862237, 1, 0.3137255, 0, 1,
-1.623789, -0.05674962, -2.368233, 1, 0.3176471, 0, 1,
-1.612607, 0.8619004, -0.3981732, 1, 0.3254902, 0, 1,
-1.603732, -0.9714178, -2.031505, 1, 0.3294118, 0, 1,
-1.593861, 0.1935197, -1.870407, 1, 0.3372549, 0, 1,
-1.572585, -0.3193341, -0.2467286, 1, 0.3411765, 0, 1,
-1.568441, -1.013836, -2.243074, 1, 0.3490196, 0, 1,
-1.56355, 0.2343916, -1.841936, 1, 0.3529412, 0, 1,
-1.562534, 0.308688, -0.2569084, 1, 0.3607843, 0, 1,
-1.541029, 0.1581407, -2.726146, 1, 0.3647059, 0, 1,
-1.540329, 0.3195165, -2.067342, 1, 0.372549, 0, 1,
-1.534741, 0.07408701, -3.08999, 1, 0.3764706, 0, 1,
-1.529311, -2.243658, -3.380586, 1, 0.3843137, 0, 1,
-1.525172, 1.033771, -0.6184143, 1, 0.3882353, 0, 1,
-1.506144, -1.454297, -0.5629134, 1, 0.3960784, 0, 1,
-1.492463, -0.4250707, -2.953726, 1, 0.4039216, 0, 1,
-1.489525, 0.1277654, -1.665087, 1, 0.4078431, 0, 1,
-1.461229, 0.2757766, -2.382389, 1, 0.4156863, 0, 1,
-1.460852, 1.419371, -1.679844, 1, 0.4196078, 0, 1,
-1.452429, 2.332435, -0.03621688, 1, 0.427451, 0, 1,
-1.446347, 0.08983682, -1.393557, 1, 0.4313726, 0, 1,
-1.438485, -0.3239687, -2.14727, 1, 0.4392157, 0, 1,
-1.435843, -1.647569, -2.814428, 1, 0.4431373, 0, 1,
-1.428337, 0.8989147, -0.9458062, 1, 0.4509804, 0, 1,
-1.426003, -0.08264336, -2.40673, 1, 0.454902, 0, 1,
-1.42456, 0.5252237, -0.9779866, 1, 0.4627451, 0, 1,
-1.423897, -0.6873178, -2.446904, 1, 0.4666667, 0, 1,
-1.423462, 0.5481502, -3.263296, 1, 0.4745098, 0, 1,
-1.396966, -0.4634275, -1.156447, 1, 0.4784314, 0, 1,
-1.382458, 1.540225, -0.4932046, 1, 0.4862745, 0, 1,
-1.374053, -1.057076, -2.378185, 1, 0.4901961, 0, 1,
-1.367985, 0.8782276, -0.1949939, 1, 0.4980392, 0, 1,
-1.353139, -0.09922817, -2.28072, 1, 0.5058824, 0, 1,
-1.341354, -1.863843, -3.494247, 1, 0.509804, 0, 1,
-1.33979, -1.146527, -1.847742, 1, 0.5176471, 0, 1,
-1.336296, -0.5620545, 0.2849208, 1, 0.5215687, 0, 1,
-1.327084, -0.9976127, -2.743354, 1, 0.5294118, 0, 1,
-1.321687, 0.8329369, -0.43172, 1, 0.5333334, 0, 1,
-1.316245, -1.086837, -1.955972, 1, 0.5411765, 0, 1,
-1.311969, -2.871496, -1.593237, 1, 0.5450981, 0, 1,
-1.295796, -1.331743, -3.402096, 1, 0.5529412, 0, 1,
-1.289001, 0.6242152, -1.425135, 1, 0.5568628, 0, 1,
-1.275253, -0.2487787, -2.99959, 1, 0.5647059, 0, 1,
-1.269074, -0.1883302, -1.54453, 1, 0.5686275, 0, 1,
-1.26885, -1.24185, -2.475027, 1, 0.5764706, 0, 1,
-1.265068, 0.2453298, -3.030149, 1, 0.5803922, 0, 1,
-1.256481, -1.427425, -4.304041, 1, 0.5882353, 0, 1,
-1.255821, 1.981787, -0.9042869, 1, 0.5921569, 0, 1,
-1.251147, 0.7267178, -0.7156421, 1, 0.6, 0, 1,
-1.247872, -1.36545, -1.155064, 1, 0.6078432, 0, 1,
-1.236442, 0.749551, -0.6023692, 1, 0.6117647, 0, 1,
-1.234864, -0.7863658, -2.22765, 1, 0.6196079, 0, 1,
-1.228342, -0.3563522, -2.613485, 1, 0.6235294, 0, 1,
-1.224534, -1.712925, -1.549138, 1, 0.6313726, 0, 1,
-1.21125, -0.3934507, -0.7008567, 1, 0.6352941, 0, 1,
-1.211174, 1.545392, -1.905505, 1, 0.6431373, 0, 1,
-1.20435, -0.1770476, -2.292317, 1, 0.6470588, 0, 1,
-1.203309, -1.77759, -1.402375, 1, 0.654902, 0, 1,
-1.201614, 2.363192, -2.413491, 1, 0.6588235, 0, 1,
-1.200832, 1.363382, -0.8191553, 1, 0.6666667, 0, 1,
-1.189521, -0.3265439, -2.828854, 1, 0.6705883, 0, 1,
-1.186724, -0.2887275, -1.387257, 1, 0.6784314, 0, 1,
-1.177798, 0.4796766, -2.432504, 1, 0.682353, 0, 1,
-1.155501, -0.2409834, -2.787426, 1, 0.6901961, 0, 1,
-1.151815, -1.330444, -3.249073, 1, 0.6941177, 0, 1,
-1.146341, -1.290651, -2.136477, 1, 0.7019608, 0, 1,
-1.137046, -0.6253713, -1.083755, 1, 0.7098039, 0, 1,
-1.135453, 0.6710296, 0.07133134, 1, 0.7137255, 0, 1,
-1.135083, 0.6218475, -0.4141449, 1, 0.7215686, 0, 1,
-1.134905, 1.506114, -2.170914, 1, 0.7254902, 0, 1,
-1.13184, -1.064405, -2.528184, 1, 0.7333333, 0, 1,
-1.124392, -0.302298, -3.968932, 1, 0.7372549, 0, 1,
-1.124111, 0.5650631, -2.582899, 1, 0.7450981, 0, 1,
-1.118045, -0.511015, -1.368783, 1, 0.7490196, 0, 1,
-1.11751, 1.836859, -1.962235, 1, 0.7568628, 0, 1,
-1.115627, 0.7571623, -1.53658, 1, 0.7607843, 0, 1,
-1.10408, -0.121721, -1.354524, 1, 0.7686275, 0, 1,
-1.100381, -0.1611112, -2.767521, 1, 0.772549, 0, 1,
-1.09411, -0.7195216, -1.460387, 1, 0.7803922, 0, 1,
-1.093307, -1.305293, -1.274849, 1, 0.7843137, 0, 1,
-1.091682, 1.7202, -0.5387325, 1, 0.7921569, 0, 1,
-1.084339, 0.1174132, -1.570382, 1, 0.7960784, 0, 1,
-1.083443, -0.01133626, -1.931509, 1, 0.8039216, 0, 1,
-1.08167, 2.133309, -0.03759572, 1, 0.8117647, 0, 1,
-1.072478, 0.2006462, -0.7458761, 1, 0.8156863, 0, 1,
-1.071364, -0.9866595, -2.131877, 1, 0.8235294, 0, 1,
-1.070678, -0.5501937, -1.369757, 1, 0.827451, 0, 1,
-1.059572, -0.0667533, -2.783077, 1, 0.8352941, 0, 1,
-1.053506, -0.5869259, -2.440361, 1, 0.8392157, 0, 1,
-1.048772, 1.173964, -1.534979, 1, 0.8470588, 0, 1,
-1.046035, 0.2313308, -0.7878182, 1, 0.8509804, 0, 1,
-1.039363, -0.5366753, -1.840225, 1, 0.8588235, 0, 1,
-1.037432, 0.5584207, -0.2355097, 1, 0.8627451, 0, 1,
-1.037406, 0.4109259, -1.882955, 1, 0.8705882, 0, 1,
-1.030225, 0.1886357, -1.107232, 1, 0.8745098, 0, 1,
-1.03001, -0.188222, -2.400429, 1, 0.8823529, 0, 1,
-1.020577, 0.06415775, 0.5012726, 1, 0.8862745, 0, 1,
-1.014829, -1.560813, -0.4442857, 1, 0.8941177, 0, 1,
-1.014637, 0.1237599, -1.524073, 1, 0.8980392, 0, 1,
-1.008574, 0.5817229, -0.6809023, 1, 0.9058824, 0, 1,
-1.002749, 1.532704, -0.05805962, 1, 0.9137255, 0, 1,
-0.9992251, -1.284258, -1.86249, 1, 0.9176471, 0, 1,
-0.9931938, -2.410812, -3.24258, 1, 0.9254902, 0, 1,
-0.9905773, 1.216227, -2.142703, 1, 0.9294118, 0, 1,
-0.9855583, -1.149437, -0.4306944, 1, 0.9372549, 0, 1,
-0.9846223, -0.3371308, -1.411572, 1, 0.9411765, 0, 1,
-0.9839093, 0.1345734, -1.724138, 1, 0.9490196, 0, 1,
-0.9835131, -0.125358, -1.594866, 1, 0.9529412, 0, 1,
-0.9795213, 1.94676, 0.03538122, 1, 0.9607843, 0, 1,
-0.9705845, 0.3464076, -2.373773, 1, 0.9647059, 0, 1,
-0.9697194, 0.7630643, -2.242723, 1, 0.972549, 0, 1,
-0.9642264, 1.053559, 0.08408057, 1, 0.9764706, 0, 1,
-0.9618556, -0.6570534, -2.151758, 1, 0.9843137, 0, 1,
-0.9611272, 0.2982636, 0.776341, 1, 0.9882353, 0, 1,
-0.9586042, -1.843204, -2.725911, 1, 0.9960784, 0, 1,
-0.9501627, 0.4133007, -1.412372, 0.9960784, 1, 0, 1,
-0.9488893, 1.886637, -0.8690687, 0.9921569, 1, 0, 1,
-0.9457312, 0.2249487, -2.201272, 0.9843137, 1, 0, 1,
-0.9363477, 0.5999621, -2.026253, 0.9803922, 1, 0, 1,
-0.9349933, 0.5749612, -2.495627, 0.972549, 1, 0, 1,
-0.9311815, 1.041042, -0.2265331, 0.9686275, 1, 0, 1,
-0.9225308, -0.339731, -1.914633, 0.9607843, 1, 0, 1,
-0.9158454, 1.407128, 0.4820739, 0.9568627, 1, 0, 1,
-0.9155568, 0.8018972, -0.1667348, 0.9490196, 1, 0, 1,
-0.908837, 0.5571402, -2.446553, 0.945098, 1, 0, 1,
-0.9084646, 0.8070921, -0.657653, 0.9372549, 1, 0, 1,
-0.9018871, 0.3557191, -1.856954, 0.9333333, 1, 0, 1,
-0.896656, -0.1139352, -1.579429, 0.9254902, 1, 0, 1,
-0.8901166, -2.235277, -2.323035, 0.9215686, 1, 0, 1,
-0.8813442, -0.1239248, -1.80824, 0.9137255, 1, 0, 1,
-0.8752371, -0.0831056, -1.283296, 0.9098039, 1, 0, 1,
-0.8737062, 0.5743674, -1.299727, 0.9019608, 1, 0, 1,
-0.8633068, -0.09639867, -3.193383, 0.8941177, 1, 0, 1,
-0.8631319, -0.5123056, -2.445965, 0.8901961, 1, 0, 1,
-0.8625864, 0.02028011, -1.304854, 0.8823529, 1, 0, 1,
-0.8578942, -0.8005391, -3.615327, 0.8784314, 1, 0, 1,
-0.8571692, 0.5050913, -1.05013, 0.8705882, 1, 0, 1,
-0.8569918, -0.3292694, -3.301071, 0.8666667, 1, 0, 1,
-0.8521086, -0.8951558, -1.728851, 0.8588235, 1, 0, 1,
-0.8515812, 0.9524232, 0.9662563, 0.854902, 1, 0, 1,
-0.8502941, -1.563075, -2.875135, 0.8470588, 1, 0, 1,
-0.8489279, -0.2200977, -1.98787, 0.8431373, 1, 0, 1,
-0.8466165, -0.5178587, -2.461202, 0.8352941, 1, 0, 1,
-0.8410558, -1.709236, -3.977554, 0.8313726, 1, 0, 1,
-0.8349255, 0.6010075, -1.028608, 0.8235294, 1, 0, 1,
-0.8348153, -1.089084, -1.209057, 0.8196079, 1, 0, 1,
-0.8264209, 0.557499, -1.081277, 0.8117647, 1, 0, 1,
-0.8183299, 0.5495282, -1.445775, 0.8078431, 1, 0, 1,
-0.8097824, -0.04150732, -0.9563445, 0.8, 1, 0, 1,
-0.8089886, 0.8859819, -1.574145, 0.7921569, 1, 0, 1,
-0.8071271, -0.03606822, -1.575145, 0.7882353, 1, 0, 1,
-0.8040051, -0.3761012, -2.57875, 0.7803922, 1, 0, 1,
-0.8027959, -1.182336, -4.348203, 0.7764706, 1, 0, 1,
-0.801529, 0.08024106, -1.962531, 0.7686275, 1, 0, 1,
-0.8005702, 2.109529, 0.007948468, 0.7647059, 1, 0, 1,
-0.7965534, -0.5032554, -0.5542773, 0.7568628, 1, 0, 1,
-0.7931874, 0.1573864, -0.7174122, 0.7529412, 1, 0, 1,
-0.7892271, 0.2370095, 0.1166495, 0.7450981, 1, 0, 1,
-0.7842936, -1.450799, -5.261888, 0.7411765, 1, 0, 1,
-0.7824584, -0.07813094, -2.152826, 0.7333333, 1, 0, 1,
-0.7764409, 1.674524, -0.1067122, 0.7294118, 1, 0, 1,
-0.7755175, 1.618506, -0.5004747, 0.7215686, 1, 0, 1,
-0.765802, -0.4955179, -2.741251, 0.7176471, 1, 0, 1,
-0.7551942, 1.703141, -0.4203565, 0.7098039, 1, 0, 1,
-0.7517511, 1.459078, -2.546613, 0.7058824, 1, 0, 1,
-0.7468687, -0.09774163, -1.975436, 0.6980392, 1, 0, 1,
-0.7420639, -0.6091087, -4.524609, 0.6901961, 1, 0, 1,
-0.7390962, -0.2447969, -1.389823, 0.6862745, 1, 0, 1,
-0.7365561, 1.768097, -2.82207, 0.6784314, 1, 0, 1,
-0.7347181, 0.6479291, -1.693989, 0.6745098, 1, 0, 1,
-0.7319919, -1.640837, -2.521857, 0.6666667, 1, 0, 1,
-0.7290236, -0.2826165, -2.315907, 0.6627451, 1, 0, 1,
-0.7259579, 0.6392951, -1.447305, 0.654902, 1, 0, 1,
-0.7252012, 0.5086263, 0.2010649, 0.6509804, 1, 0, 1,
-0.7204587, -0.3717593, -3.281284, 0.6431373, 1, 0, 1,
-0.7191822, 0.7200434, -0.4091558, 0.6392157, 1, 0, 1,
-0.7162359, 0.2963738, -0.2073778, 0.6313726, 1, 0, 1,
-0.7132224, -0.6126685, 1.672454, 0.627451, 1, 0, 1,
-0.7114032, -0.8418539, -2.059716, 0.6196079, 1, 0, 1,
-0.7059301, -0.9022473, -4.096002, 0.6156863, 1, 0, 1,
-0.7021751, -1.399078, -2.493569, 0.6078432, 1, 0, 1,
-0.6974575, -0.6535792, -2.895274, 0.6039216, 1, 0, 1,
-0.6945229, -0.2429994, -1.220657, 0.5960785, 1, 0, 1,
-0.6936432, -1.206092, -1.898255, 0.5882353, 1, 0, 1,
-0.6903605, 0.03172741, 0.009538093, 0.5843138, 1, 0, 1,
-0.688884, 0.8246543, 0.1967507, 0.5764706, 1, 0, 1,
-0.6857117, -0.8114209, -3.382953, 0.572549, 1, 0, 1,
-0.6777647, -1.10042, -1.893283, 0.5647059, 1, 0, 1,
-0.675589, -0.5841063, -3.357426, 0.5607843, 1, 0, 1,
-0.6749853, 0.5654799, 0.6240432, 0.5529412, 1, 0, 1,
-0.6731305, 1.436966, -0.04500327, 0.5490196, 1, 0, 1,
-0.6718909, 0.6231741, -0.5965318, 0.5411765, 1, 0, 1,
-0.6683171, 0.3314346, 0.6501263, 0.5372549, 1, 0, 1,
-0.667616, 0.956181, -1.171634, 0.5294118, 1, 0, 1,
-0.66751, 0.6025174, -0.3742616, 0.5254902, 1, 0, 1,
-0.6644115, 0.7256404, 0.1099768, 0.5176471, 1, 0, 1,
-0.6636977, 0.1537868, -2.675042, 0.5137255, 1, 0, 1,
-0.6609327, 2.015793, 0.3041118, 0.5058824, 1, 0, 1,
-0.6586995, -1.445285, -2.238444, 0.5019608, 1, 0, 1,
-0.6569895, 0.7218596, -1.729552, 0.4941176, 1, 0, 1,
-0.6549613, 1.00142, -1.647139, 0.4862745, 1, 0, 1,
-0.6521749, 0.5491527, 0.3824044, 0.4823529, 1, 0, 1,
-0.6513088, -0.2181629, -3.121853, 0.4745098, 1, 0, 1,
-0.6512851, 1.153584, 1.642128, 0.4705882, 1, 0, 1,
-0.6498746, 1.301982, -0.9491131, 0.4627451, 1, 0, 1,
-0.649538, -0.01739814, -1.237799, 0.4588235, 1, 0, 1,
-0.6431929, 1.449194, 0.06600191, 0.4509804, 1, 0, 1,
-0.6419453, 0.524527, -0.8196046, 0.4470588, 1, 0, 1,
-0.641786, 0.6977099, -1.558979, 0.4392157, 1, 0, 1,
-0.6390639, -0.4215548, -1.801028, 0.4352941, 1, 0, 1,
-0.6355625, 1.484602, -0.7638956, 0.427451, 1, 0, 1,
-0.62901, 0.5735858, -0.526111, 0.4235294, 1, 0, 1,
-0.6228748, -0.1924179, -3.073377, 0.4156863, 1, 0, 1,
-0.6224325, -0.2207097, -0.1706358, 0.4117647, 1, 0, 1,
-0.6217411, -1.687316, -1.829377, 0.4039216, 1, 0, 1,
-0.6213987, -1.38299, -4.356857, 0.3960784, 1, 0, 1,
-0.619467, -0.7971144, -3.432121, 0.3921569, 1, 0, 1,
-0.6148298, -0.3014882, -1.702608, 0.3843137, 1, 0, 1,
-0.609358, -0.9638284, -2.275824, 0.3803922, 1, 0, 1,
-0.6052903, -0.04638689, -1.845709, 0.372549, 1, 0, 1,
-0.5940475, -2.342341, -4.37816, 0.3686275, 1, 0, 1,
-0.5939435, 0.05195097, -2.188604, 0.3607843, 1, 0, 1,
-0.5939166, 1.14275, 0.2654656, 0.3568628, 1, 0, 1,
-0.5903162, 1.097208, 1.560717, 0.3490196, 1, 0, 1,
-0.589836, 0.2612895, -0.5975174, 0.345098, 1, 0, 1,
-0.5872238, -0.2074367, -1.055583, 0.3372549, 1, 0, 1,
-0.5868891, -0.6505044, -3.603862, 0.3333333, 1, 0, 1,
-0.5867946, -0.06692, -1.566906, 0.3254902, 1, 0, 1,
-0.5839701, 0.6206972, 0.1649645, 0.3215686, 1, 0, 1,
-0.582934, 0.9504182, -0.4464862, 0.3137255, 1, 0, 1,
-0.5794291, 0.7561175, -0.6074795, 0.3098039, 1, 0, 1,
-0.5774292, -1.930325, -3.204008, 0.3019608, 1, 0, 1,
-0.5769871, -0.2403896, -1.72895, 0.2941177, 1, 0, 1,
-0.5765088, -0.5485889, -0.4386326, 0.2901961, 1, 0, 1,
-0.5749335, -0.06481474, -1.896781, 0.282353, 1, 0, 1,
-0.5744305, 0.1029749, -2.611899, 0.2784314, 1, 0, 1,
-0.5734772, -0.3297516, -2.463861, 0.2705882, 1, 0, 1,
-0.5727267, 0.3153196, -0.5006739, 0.2666667, 1, 0, 1,
-0.5715976, 1.665877, -0.7181493, 0.2588235, 1, 0, 1,
-0.5620824, -0.5834684, -1.277693, 0.254902, 1, 0, 1,
-0.559676, -0.6775295, -1.936325, 0.2470588, 1, 0, 1,
-0.5542198, 2.054959, 0.6436231, 0.2431373, 1, 0, 1,
-0.5530317, -0.2983341, -2.741558, 0.2352941, 1, 0, 1,
-0.5517215, -1.973464, -3.486561, 0.2313726, 1, 0, 1,
-0.5512971, 0.08218653, 0.03372057, 0.2235294, 1, 0, 1,
-0.5509252, 0.07925728, -2.626362, 0.2196078, 1, 0, 1,
-0.5499927, 1.094924, 0.2961324, 0.2117647, 1, 0, 1,
-0.5485559, 0.2953252, -1.169584, 0.2078431, 1, 0, 1,
-0.5351705, 0.2765654, -0.299503, 0.2, 1, 0, 1,
-0.5334678, -1.512576, -3.626852, 0.1921569, 1, 0, 1,
-0.5334016, 0.2000626, -2.092135, 0.1882353, 1, 0, 1,
-0.5305535, 2.293399, -0.407217, 0.1803922, 1, 0, 1,
-0.5281057, 0.5070303, -2.137088, 0.1764706, 1, 0, 1,
-0.5246678, -0.6887141, -3.857395, 0.1686275, 1, 0, 1,
-0.5165176, -0.2811627, -2.157502, 0.1647059, 1, 0, 1,
-0.5119466, 2.287005, 0.2154076, 0.1568628, 1, 0, 1,
-0.5105941, 0.3772048, -0.3367043, 0.1529412, 1, 0, 1,
-0.5039845, 1.192434, 0.3182055, 0.145098, 1, 0, 1,
-0.5009087, -0.3193451, -1.808721, 0.1411765, 1, 0, 1,
-0.5003518, 0.6702766, 1.244055, 0.1333333, 1, 0, 1,
-0.5003223, 0.1372817, -2.179913, 0.1294118, 1, 0, 1,
-0.4998468, -0.4157905, -3.262916, 0.1215686, 1, 0, 1,
-0.4987918, -0.3502671, -2.731476, 0.1176471, 1, 0, 1,
-0.49716, 0.2828435, 0.3386686, 0.1098039, 1, 0, 1,
-0.492436, 0.922546, -0.5066921, 0.1058824, 1, 0, 1,
-0.4902939, -0.9892339, -4.30852, 0.09803922, 1, 0, 1,
-0.489513, 2.004087, -2.27296, 0.09019608, 1, 0, 1,
-0.4815276, 1.179997, 0.2646281, 0.08627451, 1, 0, 1,
-0.4776061, -0.9517512, -4.353234, 0.07843138, 1, 0, 1,
-0.4757569, -0.6423232, -3.266718, 0.07450981, 1, 0, 1,
-0.4739231, 0.9011897, -1.69408, 0.06666667, 1, 0, 1,
-0.4724908, 0.02972049, -1.458928, 0.0627451, 1, 0, 1,
-0.469494, 0.1559659, -1.326071, 0.05490196, 1, 0, 1,
-0.4680143, -0.4442896, -2.70522, 0.05098039, 1, 0, 1,
-0.4627804, -1.805104, -3.052064, 0.04313726, 1, 0, 1,
-0.4583038, 0.7934053, 0.8209142, 0.03921569, 1, 0, 1,
-0.4514363, 0.4965425, -0.4482339, 0.03137255, 1, 0, 1,
-0.4489973, 1.64376, -0.1108071, 0.02745098, 1, 0, 1,
-0.4482352, -0.6979628, -0.8285172, 0.01960784, 1, 0, 1,
-0.4451862, 1.044, 0.2493178, 0.01568628, 1, 0, 1,
-0.4446796, 0.40147, -0.3354394, 0.007843138, 1, 0, 1,
-0.4418193, -0.6337975, -3.788086, 0.003921569, 1, 0, 1,
-0.4415844, 0.02872558, 0.02813875, 0, 1, 0.003921569, 1,
-0.4359497, -0.5417509, -0.3502753, 0, 1, 0.01176471, 1,
-0.4344717, -0.09664546, -1.783846, 0, 1, 0.01568628, 1,
-0.4301916, -1.926087, -2.819323, 0, 1, 0.02352941, 1,
-0.4279154, 0.1162027, -0.358304, 0, 1, 0.02745098, 1,
-0.4272672, 2.001423, 0.09262342, 0, 1, 0.03529412, 1,
-0.425041, 0.379843, -0.548328, 0, 1, 0.03921569, 1,
-0.4203649, 0.7246497, 0.2228453, 0, 1, 0.04705882, 1,
-0.4199111, 0.3668438, -0.3625919, 0, 1, 0.05098039, 1,
-0.4195206, 1.454133, 0.9862247, 0, 1, 0.05882353, 1,
-0.4132987, 0.9176958, -0.7476478, 0, 1, 0.0627451, 1,
-0.4072102, 2.36032, -1.844244, 0, 1, 0.07058824, 1,
-0.4064652, -0.9754403, -2.421556, 0, 1, 0.07450981, 1,
-0.4050494, -0.08546897, -1.285303, 0, 1, 0.08235294, 1,
-0.4044281, 0.05542211, -1.830384, 0, 1, 0.08627451, 1,
-0.3957911, -0.01593232, -2.677166, 0, 1, 0.09411765, 1,
-0.3895538, -0.4382209, -2.368917, 0, 1, 0.1019608, 1,
-0.3870819, 0.8840447, -1.701881, 0, 1, 0.1058824, 1,
-0.3863106, 0.4128504, -2.813869, 0, 1, 0.1137255, 1,
-0.3821906, 1.060351, 0.5840605, 0, 1, 0.1176471, 1,
-0.3809728, -1.296821, -1.750665, 0, 1, 0.1254902, 1,
-0.3760499, -0.8750862, -2.443833, 0, 1, 0.1294118, 1,
-0.3703, -0.78604, -2.680897, 0, 1, 0.1372549, 1,
-0.369183, 1.068418, 0.2994984, 0, 1, 0.1411765, 1,
-0.3680115, 1.486452, -0.2855612, 0, 1, 0.1490196, 1,
-0.3664963, -0.4589396, -1.479455, 0, 1, 0.1529412, 1,
-0.3630476, -0.6690804, -3.376323, 0, 1, 0.1607843, 1,
-0.358279, 0.7222698, -0.2713498, 0, 1, 0.1647059, 1,
-0.3565995, 0.9441407, -1.375252, 0, 1, 0.172549, 1,
-0.3514671, 0.1804174, 0.8682171, 0, 1, 0.1764706, 1,
-0.3514017, -0.1531143, -3.047762, 0, 1, 0.1843137, 1,
-0.3486698, 0.4415791, -1.526548, 0, 1, 0.1882353, 1,
-0.3452249, -0.7938294, -3.463609, 0, 1, 0.1960784, 1,
-0.3439867, -0.5319751, -2.452816, 0, 1, 0.2039216, 1,
-0.3435251, -0.292466, -2.086445, 0, 1, 0.2078431, 1,
-0.3426903, -0.1019181, -1.386685, 0, 1, 0.2156863, 1,
-0.3405708, -1.153302, -2.785681, 0, 1, 0.2196078, 1,
-0.3362431, -0.4750378, -1.56916, 0, 1, 0.227451, 1,
-0.3355998, -2.14222, -1.429553, 0, 1, 0.2313726, 1,
-0.3343283, -1.596834, -4.020856, 0, 1, 0.2392157, 1,
-0.331026, 0.3573301, 0.7537053, 0, 1, 0.2431373, 1,
-0.3281842, 0.737368, -0.1472429, 0, 1, 0.2509804, 1,
-0.3265161, 0.6129886, 0.2377713, 0, 1, 0.254902, 1,
-0.3257489, -0.7687954, -1.472818, 0, 1, 0.2627451, 1,
-0.3247213, 0.3513534, -0.8686991, 0, 1, 0.2666667, 1,
-0.3240777, 0.7696558, -1.283142, 0, 1, 0.2745098, 1,
-0.322441, -0.5115501, -1.084661, 0, 1, 0.2784314, 1,
-0.321748, -0.2321468, -2.173576, 0, 1, 0.2862745, 1,
-0.3197703, 0.06073437, -0.857382, 0, 1, 0.2901961, 1,
-0.3192774, -0.02976783, -0.9192466, 0, 1, 0.2980392, 1,
-0.3190586, -1.545168, -3.856031, 0, 1, 0.3058824, 1,
-0.3187268, 2.087349, 0.3511486, 0, 1, 0.3098039, 1,
-0.3160655, 1.354665, -0.2498664, 0, 1, 0.3176471, 1,
-0.3121799, -1.546511, -2.130191, 0, 1, 0.3215686, 1,
-0.3027599, 0.003870178, -2.712795, 0, 1, 0.3294118, 1,
-0.2991822, -0.3531819, -3.036164, 0, 1, 0.3333333, 1,
-0.2980306, -0.02581665, -2.203667, 0, 1, 0.3411765, 1,
-0.2935213, -1.561474, -2.325351, 0, 1, 0.345098, 1,
-0.2856701, 1.229592, -0.6184804, 0, 1, 0.3529412, 1,
-0.2843985, -1.090532, -4.419265, 0, 1, 0.3568628, 1,
-0.277882, -0.3358989, -1.950201, 0, 1, 0.3647059, 1,
-0.2749746, -0.3942859, -1.432252, 0, 1, 0.3686275, 1,
-0.2737997, 0.3424478, 0.08101477, 0, 1, 0.3764706, 1,
-0.2710205, -2.303654, -4.442635, 0, 1, 0.3803922, 1,
-0.2708273, 1.003928, 0.7483388, 0, 1, 0.3882353, 1,
-0.2652023, 1.673632, 0.4268555, 0, 1, 0.3921569, 1,
-0.2577716, 0.3165679, -0.09608735, 0, 1, 0.4, 1,
-0.2565535, 0.4766223, -1.568232, 0, 1, 0.4078431, 1,
-0.255939, -0.4779287, -1.365646, 0, 1, 0.4117647, 1,
-0.2553705, 0.7275413, -1.029168, 0, 1, 0.4196078, 1,
-0.2512264, -0.03830253, -4.738406, 0, 1, 0.4235294, 1,
-0.250192, -1.62863, -3.045799, 0, 1, 0.4313726, 1,
-0.2492234, -0.7570174, -3.499524, 0, 1, 0.4352941, 1,
-0.2456978, -0.5231485, -4.127856, 0, 1, 0.4431373, 1,
-0.244519, 0.8582321, 1.207164, 0, 1, 0.4470588, 1,
-0.2420846, 0.622375, 0.3021228, 0, 1, 0.454902, 1,
-0.2336746, -0.4209299, -2.483893, 0, 1, 0.4588235, 1,
-0.2284826, -0.9712036, -3.681986, 0, 1, 0.4666667, 1,
-0.2234895, 1.505783, 0.08534666, 0, 1, 0.4705882, 1,
-0.2197818, 1.361442, -0.1178485, 0, 1, 0.4784314, 1,
-0.2182375, 1.129368, -1.641475, 0, 1, 0.4823529, 1,
-0.2175576, 0.6358446, -2.541783, 0, 1, 0.4901961, 1,
-0.215541, -0.1615877, -2.676737, 0, 1, 0.4941176, 1,
-0.2155082, 0.5051849, -1.088915, 0, 1, 0.5019608, 1,
-0.2118653, 0.07267971, -1.90088, 0, 1, 0.509804, 1,
-0.2098144, 0.5740775, 1.45232, 0, 1, 0.5137255, 1,
-0.2089527, -0.1233104, -3.055618, 0, 1, 0.5215687, 1,
-0.2048001, 0.3407323, -0.7560846, 0, 1, 0.5254902, 1,
-0.2038617, 0.3414055, 0.7181661, 0, 1, 0.5333334, 1,
-0.2035871, -0.8820356, -1.953705, 0, 1, 0.5372549, 1,
-0.1999052, 0.3217708, -1.118531, 0, 1, 0.5450981, 1,
-0.1952917, 1.893749, -1.281611, 0, 1, 0.5490196, 1,
-0.1897519, -1.797183, -2.386321, 0, 1, 0.5568628, 1,
-0.18543, 0.2279265, -0.569365, 0, 1, 0.5607843, 1,
-0.1787155, -1.690645, -1.643131, 0, 1, 0.5686275, 1,
-0.1778008, -0.1006797, -1.209152, 0, 1, 0.572549, 1,
-0.1716602, -1.135916, -4.128603, 0, 1, 0.5803922, 1,
-0.1694568, -0.4691396, -2.176544, 0, 1, 0.5843138, 1,
-0.1681085, 1.559469, 0.3106538, 0, 1, 0.5921569, 1,
-0.1672448, 1.342197, 0.4128475, 0, 1, 0.5960785, 1,
-0.1575041, -0.1417236, -2.070957, 0, 1, 0.6039216, 1,
-0.1566288, -0.7319195, -2.310891, 0, 1, 0.6117647, 1,
-0.1563747, 0.3633866, -0.1824077, 0, 1, 0.6156863, 1,
-0.1553899, 0.3671763, 1.683457, 0, 1, 0.6235294, 1,
-0.1482511, -0.003663321, 1.391766, 0, 1, 0.627451, 1,
-0.1478493, 0.1136229, -0.8094899, 0, 1, 0.6352941, 1,
-0.1454838, 0.8517232, -0.5989491, 0, 1, 0.6392157, 1,
-0.1434671, 0.2986897, 0.2904897, 0, 1, 0.6470588, 1,
-0.1427456, -0.535263, -2.323569, 0, 1, 0.6509804, 1,
-0.1407021, -0.4786865, -3.927705, 0, 1, 0.6588235, 1,
-0.13802, -0.2434848, -1.82429, 0, 1, 0.6627451, 1,
-0.1379177, -0.003163824, -0.07046515, 0, 1, 0.6705883, 1,
-0.136875, -0.510983, -2.026828, 0, 1, 0.6745098, 1,
-0.1322715, 1.338466, -1.275226, 0, 1, 0.682353, 1,
-0.130532, -0.8122447, -3.082887, 0, 1, 0.6862745, 1,
-0.1284525, -0.4702375, -2.818896, 0, 1, 0.6941177, 1,
-0.1244703, 0.1821356, -1.118369, 0, 1, 0.7019608, 1,
-0.1200961, 2.29195, -1.161686, 0, 1, 0.7058824, 1,
-0.1156528, -1.910404, -1.046646, 0, 1, 0.7137255, 1,
-0.11362, 1.175067, -0.5810999, 0, 1, 0.7176471, 1,
-0.1123381, -0.4112228, -3.321072, 0, 1, 0.7254902, 1,
-0.1120577, -1.394923, -4.073008, 0, 1, 0.7294118, 1,
-0.109644, -1.294794, -3.554497, 0, 1, 0.7372549, 1,
-0.1052189, -0.7085769, -3.061182, 0, 1, 0.7411765, 1,
-0.1032949, -1.162836, -1.647124, 0, 1, 0.7490196, 1,
-0.09602972, -2.211097, -2.039844, 0, 1, 0.7529412, 1,
-0.09441035, 0.8704156, -0.08791021, 0, 1, 0.7607843, 1,
-0.0940226, -0.1691055, -1.284951, 0, 1, 0.7647059, 1,
-0.09123624, 1.313072, -0.1426069, 0, 1, 0.772549, 1,
-0.0909415, 0.7137383, -1.45572, 0, 1, 0.7764706, 1,
-0.08956163, -1.905141, -1.732369, 0, 1, 0.7843137, 1,
-0.08590891, 1.402893, 1.11954, 0, 1, 0.7882353, 1,
-0.08060633, -0.8314346, -0.787104, 0, 1, 0.7960784, 1,
-0.07739098, 0.2791417, -1.846603, 0, 1, 0.8039216, 1,
-0.06753357, -0.2828437, -1.586915, 0, 1, 0.8078431, 1,
-0.06628682, 0.507692, -0.3568519, 0, 1, 0.8156863, 1,
-0.06328681, 0.4634313, -1.467315, 0, 1, 0.8196079, 1,
-0.06080954, -1.053102, -2.812574, 0, 1, 0.827451, 1,
-0.06029219, 0.1240255, -1.295695, 0, 1, 0.8313726, 1,
-0.05927536, 1.524226, -0.06893332, 0, 1, 0.8392157, 1,
-0.05907055, 1.054592, 1.382812, 0, 1, 0.8431373, 1,
-0.05291958, -1.075269, -3.154043, 0, 1, 0.8509804, 1,
-0.05158724, 1.73038, -0.138091, 0, 1, 0.854902, 1,
-0.05100787, 0.903879, -0.8656104, 0, 1, 0.8627451, 1,
-0.04787025, 1.050202, 2.027958, 0, 1, 0.8666667, 1,
-0.04304275, 0.3949672, -1.526047, 0, 1, 0.8745098, 1,
-0.03729187, 1.173959, -0.9490488, 0, 1, 0.8784314, 1,
-0.03552851, -2.106907, -1.914985, 0, 1, 0.8862745, 1,
-0.03443097, 1.540708, 0.08546569, 0, 1, 0.8901961, 1,
-0.0343141, 0.7712037, 0.3257162, 0, 1, 0.8980392, 1,
-0.02914076, 0.8704285, -0.9590161, 0, 1, 0.9058824, 1,
-0.02814049, -0.03766, -2.393589, 0, 1, 0.9098039, 1,
-0.02684367, -0.1849387, -3.264609, 0, 1, 0.9176471, 1,
-0.02210733, -1.142502, -4.06753, 0, 1, 0.9215686, 1,
-0.01966334, 0.6393044, -1.118938, 0, 1, 0.9294118, 1,
-0.01731064, 0.5374554, -0.1774452, 0, 1, 0.9333333, 1,
-0.008163719, 0.268457, 0.1452308, 0, 1, 0.9411765, 1,
-0.004257794, 1.349083, -0.05314776, 0, 1, 0.945098, 1,
-0.003222595, 0.4652948, 0.2056836, 0, 1, 0.9529412, 1,
-0.00320736, -1.11758, -3.233523, 0, 1, 0.9568627, 1,
-0.001163547, -0.8382807, -4.189671, 0, 1, 0.9647059, 1,
-0.00102246, 1.515599, -0.5927438, 0, 1, 0.9686275, 1,
0.0007307872, -1.40057, 5.555691, 0, 1, 0.9764706, 1,
0.002191878, 0.8053319, 0.221164, 0, 1, 0.9803922, 1,
0.003199147, 0.5242998, -0.03144137, 0, 1, 0.9882353, 1,
0.003473064, 0.377824, 1.127611, 0, 1, 0.9921569, 1,
0.007199299, -0.1126419, 4.164554, 0, 1, 1, 1,
0.01026145, 2.17016, 0.8180918, 0, 0.9921569, 1, 1,
0.01040941, 0.999704, -0.6614025, 0, 0.9882353, 1, 1,
0.01058019, 0.3634742, 0.1794694, 0, 0.9803922, 1, 1,
0.01118396, -0.3526666, 2.428328, 0, 0.9764706, 1, 1,
0.01137423, 1.577219, -0.155905, 0, 0.9686275, 1, 1,
0.01531102, 0.9913673, 1.445025, 0, 0.9647059, 1, 1,
0.0209513, 1.553231, -0.834007, 0, 0.9568627, 1, 1,
0.02251135, 0.2479543, 1.117369, 0, 0.9529412, 1, 1,
0.02308225, -0.5764637, 3.670807, 0, 0.945098, 1, 1,
0.02703226, -0.324823, 4.258636, 0, 0.9411765, 1, 1,
0.03179013, -0.1406924, 3.150995, 0, 0.9333333, 1, 1,
0.03290052, 0.149768, 2.098804, 0, 0.9294118, 1, 1,
0.0351696, 0.3698393, 0.7253072, 0, 0.9215686, 1, 1,
0.0370234, 1.10147, 0.2730485, 0, 0.9176471, 1, 1,
0.0407552, 0.9827921, 1.564018, 0, 0.9098039, 1, 1,
0.04121935, -0.890423, 1.294756, 0, 0.9058824, 1, 1,
0.04384753, -0.9386111, 2.410865, 0, 0.8980392, 1, 1,
0.04586314, 0.1834222, 0.06002957, 0, 0.8901961, 1, 1,
0.04927524, 0.8453197, 0.3420427, 0, 0.8862745, 1, 1,
0.05247077, -0.9877924, 3.687223, 0, 0.8784314, 1, 1,
0.05437941, -1.819365, 3.914771, 0, 0.8745098, 1, 1,
0.06592251, 2.689394, -1.356845, 0, 0.8666667, 1, 1,
0.06601202, -0.9820278, 4.728248, 0, 0.8627451, 1, 1,
0.07101824, 0.3053112, 0.7751564, 0, 0.854902, 1, 1,
0.07306788, 0.4566321, 1.562528, 0, 0.8509804, 1, 1,
0.07451745, 0.8013219, -0.3735846, 0, 0.8431373, 1, 1,
0.074883, -2.513371, 3.142624, 0, 0.8392157, 1, 1,
0.07955938, 1.018644, -0.07233083, 0, 0.8313726, 1, 1,
0.08014953, 1.063338, 0.6718735, 0, 0.827451, 1, 1,
0.0873908, 0.08383147, 0.1924348, 0, 0.8196079, 1, 1,
0.08898494, -0.966059, 3.267257, 0, 0.8156863, 1, 1,
0.09026349, -1.821585, 3.456984, 0, 0.8078431, 1, 1,
0.09190828, 0.805972, 1.264256, 0, 0.8039216, 1, 1,
0.09230645, -0.2458748, 0.6062178, 0, 0.7960784, 1, 1,
0.09240643, 1.822778, -0.1063846, 0, 0.7882353, 1, 1,
0.1048751, -0.009572963, 1.642283, 0, 0.7843137, 1, 1,
0.1054315, -0.006752164, 1.551942, 0, 0.7764706, 1, 1,
0.1077104, -1.208359, 2.552178, 0, 0.772549, 1, 1,
0.1077111, -0.1554047, 2.364945, 0, 0.7647059, 1, 1,
0.1124449, -0.6742626, 2.241767, 0, 0.7607843, 1, 1,
0.1146396, -1.784902, 3.979742, 0, 0.7529412, 1, 1,
0.1155276, 0.02568013, 0.6429964, 0, 0.7490196, 1, 1,
0.1217201, 0.4075295, -1.713293, 0, 0.7411765, 1, 1,
0.1217566, -1.64371, 3.199665, 0, 0.7372549, 1, 1,
0.1242981, -0.2944984, 3.182769, 0, 0.7294118, 1, 1,
0.1266331, -0.5569959, 1.779912, 0, 0.7254902, 1, 1,
0.1269378, -1.378227, 3.218207, 0, 0.7176471, 1, 1,
0.1269817, -0.2316846, 1.330817, 0, 0.7137255, 1, 1,
0.1276424, 0.3055899, 1.040746, 0, 0.7058824, 1, 1,
0.1281021, 0.08639593, -0.2870588, 0, 0.6980392, 1, 1,
0.1302491, -0.07591952, 2.385337, 0, 0.6941177, 1, 1,
0.1319378, 0.2535023, 1.93368, 0, 0.6862745, 1, 1,
0.1364831, 0.5350749, 0.2028804, 0, 0.682353, 1, 1,
0.1389402, -0.1506217, 1.714559, 0, 0.6745098, 1, 1,
0.140126, 1.017322, -0.5626787, 0, 0.6705883, 1, 1,
0.1405713, -0.4842533, 3.312477, 0, 0.6627451, 1, 1,
0.1453899, -1.129862, 4.053308, 0, 0.6588235, 1, 1,
0.1503527, 1.13462, -0.6050767, 0, 0.6509804, 1, 1,
0.1534756, 1.287193, 2.039675, 0, 0.6470588, 1, 1,
0.1555018, 1.312607, -2.454719, 0, 0.6392157, 1, 1,
0.1593083, 1.872434, -0.5121923, 0, 0.6352941, 1, 1,
0.1690543, 1.323068, 0.2732559, 0, 0.627451, 1, 1,
0.1705109, -0.3132192, 1.437129, 0, 0.6235294, 1, 1,
0.1727737, 1.90381, 0.7658227, 0, 0.6156863, 1, 1,
0.1728886, 0.5156008, 0.675593, 0, 0.6117647, 1, 1,
0.1728988, -0.4849742, 2.92328, 0, 0.6039216, 1, 1,
0.1741072, 1.271004, -1.108019, 0, 0.5960785, 1, 1,
0.1855712, -0.1719089, 2.963716, 0, 0.5921569, 1, 1,
0.1874808, 1.17445, -1.566088, 0, 0.5843138, 1, 1,
0.1894818, 0.8559511, 0.4048856, 0, 0.5803922, 1, 1,
0.1909173, -0.9113492, 0.9797352, 0, 0.572549, 1, 1,
0.1944474, -0.1592182, 3.121962, 0, 0.5686275, 1, 1,
0.1973394, -0.4220869, 1.223591, 0, 0.5607843, 1, 1,
0.2006794, -0.08372575, 2.412467, 0, 0.5568628, 1, 1,
0.2014111, 1.119897, -1.554572, 0, 0.5490196, 1, 1,
0.2014385, 0.08737362, -0.4688122, 0, 0.5450981, 1, 1,
0.2028083, 0.2024401, -0.3671413, 0, 0.5372549, 1, 1,
0.2043461, 0.3666084, 1.703122, 0, 0.5333334, 1, 1,
0.2060788, 1.110036, 1.394667, 0, 0.5254902, 1, 1,
0.2111004, -3.312046, 2.485131, 0, 0.5215687, 1, 1,
0.2133382, -1.056116, 0.3262731, 0, 0.5137255, 1, 1,
0.2161731, -0.1445385, 3.172595, 0, 0.509804, 1, 1,
0.2166384, -1.55162, 4.869236, 0, 0.5019608, 1, 1,
0.2190261, -0.1164868, 2.618429, 0, 0.4941176, 1, 1,
0.2199433, 1.365865, 0.581352, 0, 0.4901961, 1, 1,
0.219992, -0.05805809, 2.722034, 0, 0.4823529, 1, 1,
0.2258221, -0.7825314, 3.961345, 0, 0.4784314, 1, 1,
0.2407681, 1.608566, -0.4895836, 0, 0.4705882, 1, 1,
0.2422882, -1.007813, 1.630154, 0, 0.4666667, 1, 1,
0.2426556, -0.4982648, 1.957657, 0, 0.4588235, 1, 1,
0.2435649, 1.043023, -0.07553736, 0, 0.454902, 1, 1,
0.2473091, -0.057477, 2.115897, 0, 0.4470588, 1, 1,
0.2491946, 0.1565203, 1.955705, 0, 0.4431373, 1, 1,
0.2500099, -0.4523998, 2.341337, 0, 0.4352941, 1, 1,
0.2509073, 0.722396, -0.9910729, 0, 0.4313726, 1, 1,
0.2514383, -0.7758322, 0.8169626, 0, 0.4235294, 1, 1,
0.2591991, 0.1228618, -0.03158541, 0, 0.4196078, 1, 1,
0.2613535, 1.417487, -2.222799, 0, 0.4117647, 1, 1,
0.2669191, -0.4812117, 2.505908, 0, 0.4078431, 1, 1,
0.2691763, -1.385932, 2.462216, 0, 0.4, 1, 1,
0.2708745, 0.3565119, -0.9820647, 0, 0.3921569, 1, 1,
0.2751487, -0.4044445, 2.338856, 0, 0.3882353, 1, 1,
0.2801085, -0.1646912, 4.513636, 0, 0.3803922, 1, 1,
0.2825311, 1.730442, 0.9665486, 0, 0.3764706, 1, 1,
0.2883411, 1.572285, 0.5881462, 0, 0.3686275, 1, 1,
0.2900645, 0.09411611, 4.639957, 0, 0.3647059, 1, 1,
0.2912445, 0.01136466, 2.806031, 0, 0.3568628, 1, 1,
0.2935366, -1.181252, 2.056557, 0, 0.3529412, 1, 1,
0.2954887, -0.2741436, 3.432093, 0, 0.345098, 1, 1,
0.3007339, 0.5783386, 0.7297065, 0, 0.3411765, 1, 1,
0.3053103, 0.3543536, 2.541017, 0, 0.3333333, 1, 1,
0.3116758, 0.3271212, 1.066914, 0, 0.3294118, 1, 1,
0.3120689, 0.7087284, 1.502772, 0, 0.3215686, 1, 1,
0.3122094, -0.9461821, 2.369729, 0, 0.3176471, 1, 1,
0.3124939, -1.861706, 3.644862, 0, 0.3098039, 1, 1,
0.3134287, -0.2689574, 2.464787, 0, 0.3058824, 1, 1,
0.3172015, 0.2029269, 0.7431826, 0, 0.2980392, 1, 1,
0.3172162, -2.11772, 3.939351, 0, 0.2901961, 1, 1,
0.3177715, -2.211705, 1.348734, 0, 0.2862745, 1, 1,
0.3181147, 0.4825716, -0.4665031, 0, 0.2784314, 1, 1,
0.3182408, -0.3395697, 0.9725381, 0, 0.2745098, 1, 1,
0.3199275, 2.471277, 0.08798023, 0, 0.2666667, 1, 1,
0.3210352, -0.8092369, 4.407749, 0, 0.2627451, 1, 1,
0.3227853, 0.0546808, 0.3664267, 0, 0.254902, 1, 1,
0.3240885, -1.064177, 3.553731, 0, 0.2509804, 1, 1,
0.3327852, -2.042197, 2.834487, 0, 0.2431373, 1, 1,
0.333689, 1.432019, 1.297346, 0, 0.2392157, 1, 1,
0.3374225, 0.6102337, 0.3011051, 0, 0.2313726, 1, 1,
0.3382879, -1.357344, 2.740116, 0, 0.227451, 1, 1,
0.3441827, 0.4698876, 1.509304, 0, 0.2196078, 1, 1,
0.3450904, 1.520332, 0.3201615, 0, 0.2156863, 1, 1,
0.3464833, -0.7741868, 2.009127, 0, 0.2078431, 1, 1,
0.3468283, -0.1512722, 2.053336, 0, 0.2039216, 1, 1,
0.3486908, -1.167652, 3.670567, 0, 0.1960784, 1, 1,
0.3507656, -1.175174, 3.248267, 0, 0.1882353, 1, 1,
0.3523508, -0.40165, 2.624643, 0, 0.1843137, 1, 1,
0.3524901, -1.529833, 2.393951, 0, 0.1764706, 1, 1,
0.3611524, -0.1813588, 1.026848, 0, 0.172549, 1, 1,
0.3638698, -0.4762487, 4.177338, 0, 0.1647059, 1, 1,
0.3643557, -0.07388779, 3.262477, 0, 0.1607843, 1, 1,
0.3667943, -0.609415, 3.708564, 0, 0.1529412, 1, 1,
0.3668375, 0.7235059, 0.9709432, 0, 0.1490196, 1, 1,
0.3715369, 1.389026, 1.988306, 0, 0.1411765, 1, 1,
0.3739111, 0.2620673, -0.1423161, 0, 0.1372549, 1, 1,
0.3745722, -2.188448, 2.638118, 0, 0.1294118, 1, 1,
0.3745728, 0.2204919, -0.1329776, 0, 0.1254902, 1, 1,
0.3753883, -0.3227795, 1.627412, 0, 0.1176471, 1, 1,
0.3754254, 0.7647255, 0.7239494, 0, 0.1137255, 1, 1,
0.3766034, 1.130383, 0.5268357, 0, 0.1058824, 1, 1,
0.3808236, -1.280687, 1.57991, 0, 0.09803922, 1, 1,
0.3808871, -0.3794549, 3.12929, 0, 0.09411765, 1, 1,
0.3814061, 0.8630614, 1.459779, 0, 0.08627451, 1, 1,
0.3819072, 0.8169044, 2.213469, 0, 0.08235294, 1, 1,
0.3823649, -1.674989, 3.885556, 0, 0.07450981, 1, 1,
0.3847867, 0.9401102, -0.8112876, 0, 0.07058824, 1, 1,
0.3870011, -1.351817, 1.799383, 0, 0.0627451, 1, 1,
0.3870719, 0.2992417, 1.42512, 0, 0.05882353, 1, 1,
0.3883848, -0.2835866, 1.573175, 0, 0.05098039, 1, 1,
0.389153, 0.2077908, 3.246859, 0, 0.04705882, 1, 1,
0.3895434, -0.005366602, 1.783649, 0, 0.03921569, 1, 1,
0.396925, 1.150382, 2.054082, 0, 0.03529412, 1, 1,
0.3972159, -0.3786106, 0.4970424, 0, 0.02745098, 1, 1,
0.4024196, 2.552429, 0.235954, 0, 0.02352941, 1, 1,
0.407304, -1.38429, 4.012757, 0, 0.01568628, 1, 1,
0.4091022, -2.198943, 3.752943, 0, 0.01176471, 1, 1,
0.4112982, -0.5122324, 3.290729, 0, 0.003921569, 1, 1,
0.4124476, -0.01232862, 1.34475, 0.003921569, 0, 1, 1,
0.4129559, 0.2252734, 0.9932379, 0.007843138, 0, 1, 1,
0.4148504, -0.09142215, 1.373168, 0.01568628, 0, 1, 1,
0.4300727, 0.4383031, 0.8504728, 0.01960784, 0, 1, 1,
0.4309604, 0.1154683, 0.3610861, 0.02745098, 0, 1, 1,
0.4387985, 0.5609217, 0.4750619, 0.03137255, 0, 1, 1,
0.4390201, -0.04642247, 1.970765, 0.03921569, 0, 1, 1,
0.4431273, 0.2914796, 0.5450727, 0.04313726, 0, 1, 1,
0.4507304, 1.29484, 1.165694, 0.05098039, 0, 1, 1,
0.4523307, 0.9942372, -0.7859964, 0.05490196, 0, 1, 1,
0.4532473, 0.7206512, -0.03110164, 0.0627451, 0, 1, 1,
0.4536798, -0.6460469, 1.989424, 0.06666667, 0, 1, 1,
0.4538501, 0.9118972, 0.3127221, 0.07450981, 0, 1, 1,
0.4557526, 0.8265623, 1.261348, 0.07843138, 0, 1, 1,
0.4584471, -2.252504, 2.515406, 0.08627451, 0, 1, 1,
0.4671644, -1.941097, 4.75076, 0.09019608, 0, 1, 1,
0.4675952, 0.3036822, 0.5850672, 0.09803922, 0, 1, 1,
0.4678401, 0.1339422, -0.2867629, 0.1058824, 0, 1, 1,
0.4688394, -0.4710802, 2.953544, 0.1098039, 0, 1, 1,
0.4799123, 0.268899, 1.494976, 0.1176471, 0, 1, 1,
0.4805798, 0.2787422, 0.5529295, 0.1215686, 0, 1, 1,
0.4827817, -1.470103, 4.593718, 0.1294118, 0, 1, 1,
0.4849736, -0.9006922, 1.899991, 0.1333333, 0, 1, 1,
0.4882075, -0.001391965, 1.913732, 0.1411765, 0, 1, 1,
0.4895732, 0.07602911, 1.281222, 0.145098, 0, 1, 1,
0.4903383, 0.47264, 1.993373, 0.1529412, 0, 1, 1,
0.4914586, -1.659841, 3.339356, 0.1568628, 0, 1, 1,
0.4915848, -0.4716862, 2.409755, 0.1647059, 0, 1, 1,
0.4917728, 0.7212209, -0.5648438, 0.1686275, 0, 1, 1,
0.4921494, -0.6846303, 4.321244, 0.1764706, 0, 1, 1,
0.4925944, -1.278635, 3.818397, 0.1803922, 0, 1, 1,
0.4937724, 2.297298, 0.3079046, 0.1882353, 0, 1, 1,
0.5005003, -0.6182515, 2.148985, 0.1921569, 0, 1, 1,
0.5111905, -1.368301, 2.490929, 0.2, 0, 1, 1,
0.5117386, 1.949777, 0.658645, 0.2078431, 0, 1, 1,
0.5170894, 0.446962, 1.681329, 0.2117647, 0, 1, 1,
0.5233032, -1.29575, 2.452856, 0.2196078, 0, 1, 1,
0.5319188, 0.6040489, -0.4850965, 0.2235294, 0, 1, 1,
0.5359483, 1.293166, -1.257945, 0.2313726, 0, 1, 1,
0.5389962, -1.69084, 1.710688, 0.2352941, 0, 1, 1,
0.5392108, 0.7251371, -0.3822748, 0.2431373, 0, 1, 1,
0.5429068, -0.4834447, 1.430636, 0.2470588, 0, 1, 1,
0.5465971, -1.850713, 1.465952, 0.254902, 0, 1, 1,
0.5469171, 0.2208115, 0.5908493, 0.2588235, 0, 1, 1,
0.5543978, 0.9250071, 0.2021425, 0.2666667, 0, 1, 1,
0.5545024, 1.654525, -0.1546227, 0.2705882, 0, 1, 1,
0.5571532, 0.115849, 2.746454, 0.2784314, 0, 1, 1,
0.5629893, 0.2605896, 1.455628, 0.282353, 0, 1, 1,
0.5634896, -0.3001131, 2.745283, 0.2901961, 0, 1, 1,
0.5647657, 0.964286, 0.9034076, 0.2941177, 0, 1, 1,
0.5658186, -1.141365, 1.64853, 0.3019608, 0, 1, 1,
0.5662055, -0.03225703, 3.40424, 0.3098039, 0, 1, 1,
0.5691646, 1.190111, -0.5020582, 0.3137255, 0, 1, 1,
0.5692741, 0.1687205, 0.7038811, 0.3215686, 0, 1, 1,
0.5702205, -0.7771303, 2.29109, 0.3254902, 0, 1, 1,
0.5716289, -1.251522, 4.215268, 0.3333333, 0, 1, 1,
0.5845933, -0.4272693, 3.336906, 0.3372549, 0, 1, 1,
0.5850482, 0.2388708, 2.651023, 0.345098, 0, 1, 1,
0.5917829, 0.8551614, 0.8280425, 0.3490196, 0, 1, 1,
0.5937859, -0.6082577, 3.034899, 0.3568628, 0, 1, 1,
0.5956159, -0.6258627, 2.314202, 0.3607843, 0, 1, 1,
0.6010752, -1.87986, 1.327335, 0.3686275, 0, 1, 1,
0.6028348, -0.1178186, 1.391848, 0.372549, 0, 1, 1,
0.6065514, -0.1985617, 2.24422, 0.3803922, 0, 1, 1,
0.6126314, 1.574694, -0.5825395, 0.3843137, 0, 1, 1,
0.6126897, -0.5869454, 2.150476, 0.3921569, 0, 1, 1,
0.6176105, 1.214422, 2.37141, 0.3960784, 0, 1, 1,
0.617855, 2.021839, 0.118736, 0.4039216, 0, 1, 1,
0.6271325, -0.8420199, 1.042977, 0.4117647, 0, 1, 1,
0.6276729, -0.1303774, 2.311461, 0.4156863, 0, 1, 1,
0.6331914, 0.4313921, 2.242878, 0.4235294, 0, 1, 1,
0.634729, -0.692498, 3.210865, 0.427451, 0, 1, 1,
0.6407635, -0.36076, 1.224494, 0.4352941, 0, 1, 1,
0.6413718, -0.3319991, 3.660532, 0.4392157, 0, 1, 1,
0.6446741, -0.04583142, 2.929295, 0.4470588, 0, 1, 1,
0.6546838, 1.727982, 1.686201, 0.4509804, 0, 1, 1,
0.6571445, 0.4341978, 2.327715, 0.4588235, 0, 1, 1,
0.6601815, -0.7996143, 2.703631, 0.4627451, 0, 1, 1,
0.6668268, 0.2933103, 0.9967843, 0.4705882, 0, 1, 1,
0.6679496, 0.1265951, 0.2887796, 0.4745098, 0, 1, 1,
0.6711159, 0.08062518, 1.995598, 0.4823529, 0, 1, 1,
0.6747293, 1.72345, -0.8885774, 0.4862745, 0, 1, 1,
0.6761252, 0.009323728, 2.824329, 0.4941176, 0, 1, 1,
0.6764775, -0.6648422, 2.97052, 0.5019608, 0, 1, 1,
0.6908717, 0.09490511, 1.497727, 0.5058824, 0, 1, 1,
0.6909553, -0.6412242, 1.90553, 0.5137255, 0, 1, 1,
0.6936144, 1.138996, 1.225132, 0.5176471, 0, 1, 1,
0.6986846, 0.3408757, -0.8742993, 0.5254902, 0, 1, 1,
0.7005659, -1.95292, 3.04615, 0.5294118, 0, 1, 1,
0.7063475, -0.5089086, 1.990404, 0.5372549, 0, 1, 1,
0.7076052, -0.2683237, 2.356473, 0.5411765, 0, 1, 1,
0.7091872, 0.878106, 0.5451598, 0.5490196, 0, 1, 1,
0.7095083, 0.2486043, 3.64289, 0.5529412, 0, 1, 1,
0.7138854, -1.956432, 2.993058, 0.5607843, 0, 1, 1,
0.7174641, -0.3090655, 1.567587, 0.5647059, 0, 1, 1,
0.7451262, -0.8751575, 2.322071, 0.572549, 0, 1, 1,
0.7514598, -0.9217955, 3.520594, 0.5764706, 0, 1, 1,
0.7566614, -0.3119182, 2.681033, 0.5843138, 0, 1, 1,
0.7592887, -0.4021273, 3.469464, 0.5882353, 0, 1, 1,
0.7602962, 1.113859, -0.440159, 0.5960785, 0, 1, 1,
0.7609007, -1.582989, 2.807482, 0.6039216, 0, 1, 1,
0.7612928, -0.1517933, 1.873544, 0.6078432, 0, 1, 1,
0.7647703, -1.560739, 3.136352, 0.6156863, 0, 1, 1,
0.7647862, 1.130201, -0.714802, 0.6196079, 0, 1, 1,
0.7723768, -0.6681644, 3.861701, 0.627451, 0, 1, 1,
0.7777502, -0.09211998, 1.767289, 0.6313726, 0, 1, 1,
0.7777656, -0.2996278, 2.014388, 0.6392157, 0, 1, 1,
0.7794864, 1.088609, 2.11573, 0.6431373, 0, 1, 1,
0.7828768, 0.9508778, -1.001501, 0.6509804, 0, 1, 1,
0.7835043, -0.1735166, 3.266328, 0.654902, 0, 1, 1,
0.7851122, -1.353541, 3.395161, 0.6627451, 0, 1, 1,
0.7911911, -0.9661228, 3.716716, 0.6666667, 0, 1, 1,
0.7962148, -0.2192533, -0.1538432, 0.6745098, 0, 1, 1,
0.8044683, -1.061966, 0.01858199, 0.6784314, 0, 1, 1,
0.8056999, 0.1533858, 1.608913, 0.6862745, 0, 1, 1,
0.8085087, 0.2369464, 0.220069, 0.6901961, 0, 1, 1,
0.8106506, -0.7177801, 2.806582, 0.6980392, 0, 1, 1,
0.8123332, 0.5433205, 1.587838, 0.7058824, 0, 1, 1,
0.8157986, 1.526429, 0.1064168, 0.7098039, 0, 1, 1,
0.8161978, -1.629371, 2.142249, 0.7176471, 0, 1, 1,
0.8209184, -0.5621667, 1.899206, 0.7215686, 0, 1, 1,
0.8233209, -2.337747, 2.88029, 0.7294118, 0, 1, 1,
0.8244905, 0.7830015, -0.7241845, 0.7333333, 0, 1, 1,
0.8246936, -1.058173, 2.925786, 0.7411765, 0, 1, 1,
0.8277606, -0.7712609, 3.025962, 0.7450981, 0, 1, 1,
0.8318066, -0.643478, 3.068368, 0.7529412, 0, 1, 1,
0.8327161, 1.81152, -0.1444589, 0.7568628, 0, 1, 1,
0.8355084, -0.7531798, 2.140852, 0.7647059, 0, 1, 1,
0.8435981, -0.04849688, 1.271936, 0.7686275, 0, 1, 1,
0.8469892, -0.4611, 1.15806, 0.7764706, 0, 1, 1,
0.8485062, 0.6989285, 1.60553, 0.7803922, 0, 1, 1,
0.8554395, -0.1386286, 2.5674, 0.7882353, 0, 1, 1,
0.855895, -1.773711, 2.709738, 0.7921569, 0, 1, 1,
0.8610267, 1.09269, 0.3432124, 0.8, 0, 1, 1,
0.8667284, -0.6844554, 1.483407, 0.8078431, 0, 1, 1,
0.869657, -0.07548082, 0.7982274, 0.8117647, 0, 1, 1,
0.8697829, 0.8823209, 1.242318, 0.8196079, 0, 1, 1,
0.8703275, 1.646398, 1.249409, 0.8235294, 0, 1, 1,
0.8708186, 1.116803, 1.332833, 0.8313726, 0, 1, 1,
0.8817313, 1.113694, 0.7360638, 0.8352941, 0, 1, 1,
0.8839883, -1.451572, 2.321887, 0.8431373, 0, 1, 1,
0.8900486, 1.582043, -1.363645, 0.8470588, 0, 1, 1,
0.9003156, 0.6617731, 0.3122175, 0.854902, 0, 1, 1,
0.9016055, 1.003188, 1.677436, 0.8588235, 0, 1, 1,
0.9148731, -1.914944, 2.445304, 0.8666667, 0, 1, 1,
0.9180114, 0.8178113, 0.6082072, 0.8705882, 0, 1, 1,
0.9212231, 0.4173618, -0.3391764, 0.8784314, 0, 1, 1,
0.9265526, -1.202398, 0.3693903, 0.8823529, 0, 1, 1,
0.9282381, -0.48477, 3.38366, 0.8901961, 0, 1, 1,
0.9312948, 1.074987, 0.1210899, 0.8941177, 0, 1, 1,
0.9336031, -0.1205294, 2.146172, 0.9019608, 0, 1, 1,
0.935379, -0.2954305, 1.52505, 0.9098039, 0, 1, 1,
0.9420303, 1.433811, 0.9342871, 0.9137255, 0, 1, 1,
0.9421388, -1.13337, 1.975187, 0.9215686, 0, 1, 1,
0.9450299, 0.8596064, 2.463776, 0.9254902, 0, 1, 1,
0.9468222, -1.210369, 1.549352, 0.9333333, 0, 1, 1,
0.958971, 0.6298512, 2.295275, 0.9372549, 0, 1, 1,
0.9592357, 0.04357591, 0.6282927, 0.945098, 0, 1, 1,
0.9619235, -0.2931703, 0.8633978, 0.9490196, 0, 1, 1,
0.9711281, 1.158097, 0.4224092, 0.9568627, 0, 1, 1,
0.9757341, 0.01339199, 0.7896155, 0.9607843, 0, 1, 1,
0.9761366, -0.3540523, 2.366904, 0.9686275, 0, 1, 1,
0.9790117, 1.592001, 1.015089, 0.972549, 0, 1, 1,
0.9794852, -1.503901, 0.9049164, 0.9803922, 0, 1, 1,
0.980749, -0.09651772, 0.8486874, 0.9843137, 0, 1, 1,
0.9849963, 1.158426, 0.8160067, 0.9921569, 0, 1, 1,
0.9861419, 0.305413, 0.899123, 0.9960784, 0, 1, 1,
0.99143, 2.065808, 1.725265, 1, 0, 0.9960784, 1,
0.9930698, -1.371786, 1.942937, 1, 0, 0.9882353, 1,
0.99433, -1.246667, 3.122802, 1, 0, 0.9843137, 1,
0.9953296, 0.575465, 0.6514776, 1, 0, 0.9764706, 1,
0.9960924, -1.571795, 2.422973, 1, 0, 0.972549, 1,
1.007332, 1.278572, 1.202512, 1, 0, 0.9647059, 1,
1.009819, 0.1605012, 1.316034, 1, 0, 0.9607843, 1,
1.011288, -1.239851, 1.536995, 1, 0, 0.9529412, 1,
1.017626, -0.883177, 3.690587, 1, 0, 0.9490196, 1,
1.020291, -0.2708112, 1.83898, 1, 0, 0.9411765, 1,
1.022358, -0.9155056, 1.524612, 1, 0, 0.9372549, 1,
1.027658, -0.6244475, 0.191909, 1, 0, 0.9294118, 1,
1.037848, 0.5958762, 0.3155416, 1, 0, 0.9254902, 1,
1.039313, -0.5391853, 2.012191, 1, 0, 0.9176471, 1,
1.040705, -0.6323969, 2.79348, 1, 0, 0.9137255, 1,
1.048581, -0.08008886, 3.142398, 1, 0, 0.9058824, 1,
1.049067, 0.431085, 0.9453561, 1, 0, 0.9019608, 1,
1.054203, -0.2655303, 3.436801, 1, 0, 0.8941177, 1,
1.056813, -1.819128, 5.984228, 1, 0, 0.8862745, 1,
1.058703, 0.646264, -0.481029, 1, 0, 0.8823529, 1,
1.06662, -0.05797697, 0.1071774, 1, 0, 0.8745098, 1,
1.069856, 1.511846, 1.543222, 1, 0, 0.8705882, 1,
1.074634, 1.13944, -0.2464148, 1, 0, 0.8627451, 1,
1.082264, 0.6723044, 4.399577, 1, 0, 0.8588235, 1,
1.088574, -0.5120558, 0.6371408, 1, 0, 0.8509804, 1,
1.092284, 0.5215592, 0.6382968, 1, 0, 0.8470588, 1,
1.104235, -1.188987, 0.5020978, 1, 0, 0.8392157, 1,
1.106234, 0.08620365, 0.2549428, 1, 0, 0.8352941, 1,
1.108099, -0.1265831, 1.461263, 1, 0, 0.827451, 1,
1.108702, -0.290807, 1.997315, 1, 0, 0.8235294, 1,
1.11453, -0.08505048, 1.047108, 1, 0, 0.8156863, 1,
1.125462, -2.319953, 4.880672, 1, 0, 0.8117647, 1,
1.133693, 1.226033, -0.4366651, 1, 0, 0.8039216, 1,
1.138201, -0.7146554, 1.07939, 1, 0, 0.7960784, 1,
1.143239, -2.023291, 2.641739, 1, 0, 0.7921569, 1,
1.145527, 0.1604742, 1.036578, 1, 0, 0.7843137, 1,
1.162704, -0.1020401, 1.98059, 1, 0, 0.7803922, 1,
1.163203, 0.01979519, 2.771059, 1, 0, 0.772549, 1,
1.166076, 0.9370692, 0.6586649, 1, 0, 0.7686275, 1,
1.16625, 0.7762635, 0.2852558, 1, 0, 0.7607843, 1,
1.172259, -0.2237358, 2.083366, 1, 0, 0.7568628, 1,
1.174935, 1.722497, 0.4848634, 1, 0, 0.7490196, 1,
1.176247, 0.8808656, -0.2994701, 1, 0, 0.7450981, 1,
1.18166, -0.6300111, 1.350756, 1, 0, 0.7372549, 1,
1.187519, 0.1457769, 3.333338, 1, 0, 0.7333333, 1,
1.189951, 0.7366919, 2.068376, 1, 0, 0.7254902, 1,
1.192124, 0.4110475, 1.452085, 1, 0, 0.7215686, 1,
1.197277, 1.51267, 1.991549, 1, 0, 0.7137255, 1,
1.200048, 0.02453729, 0.04407226, 1, 0, 0.7098039, 1,
1.218008, -0.1892175, 1.204975, 1, 0, 0.7019608, 1,
1.223774, 1.23371, 1.972076, 1, 0, 0.6941177, 1,
1.224625, 1.500778, 2.853116, 1, 0, 0.6901961, 1,
1.236919, -0.8297861, 0.5701598, 1, 0, 0.682353, 1,
1.238658, -0.9390442, 3.644728, 1, 0, 0.6784314, 1,
1.254107, -0.6687595, -0.02247396, 1, 0, 0.6705883, 1,
1.255126, 1.304094, 0.2427349, 1, 0, 0.6666667, 1,
1.257224, -0.6669891, 1.534371, 1, 0, 0.6588235, 1,
1.261734, 0.5900196, -0.2077524, 1, 0, 0.654902, 1,
1.267759, -0.827992, 2.70419, 1, 0, 0.6470588, 1,
1.267876, 0.3869611, 2.777856, 1, 0, 0.6431373, 1,
1.269169, 1.25845, -0.926932, 1, 0, 0.6352941, 1,
1.269237, -0.5784636, 2.692407, 1, 0, 0.6313726, 1,
1.274709, -0.8024473, 1.682309, 1, 0, 0.6235294, 1,
1.277812, 1.033974, 1.406638, 1, 0, 0.6196079, 1,
1.278048, -1.204171, 3.549388, 1, 0, 0.6117647, 1,
1.281661, -0.8916805, 2.46146, 1, 0, 0.6078432, 1,
1.297942, -0.1877396, 1.758013, 1, 0, 0.6, 1,
1.3058, -0.2631907, 2.762906, 1, 0, 0.5921569, 1,
1.307851, 0.7106358, 2.989806, 1, 0, 0.5882353, 1,
1.330651, 0.126779, 1.037658, 1, 0, 0.5803922, 1,
1.332894, -0.6323229, 1.001062, 1, 0, 0.5764706, 1,
1.336264, 0.002411088, 2.680057, 1, 0, 0.5686275, 1,
1.340447, 0.295309, 1.795425, 1, 0, 0.5647059, 1,
1.34278, 0.1500559, 0.02485878, 1, 0, 0.5568628, 1,
1.347171, -0.5983325, -0.7986075, 1, 0, 0.5529412, 1,
1.350428, 0.1665482, 2.449242, 1, 0, 0.5450981, 1,
1.356015, -0.5700125, 1.30408, 1, 0, 0.5411765, 1,
1.364729, 0.05263022, 1.749074, 1, 0, 0.5333334, 1,
1.365497, -1.772818, 2.145147, 1, 0, 0.5294118, 1,
1.385766, -1.155589, 1.914106, 1, 0, 0.5215687, 1,
1.391216, 1.329508, 2.272152, 1, 0, 0.5176471, 1,
1.393675, -0.7797272, 1.262043, 1, 0, 0.509804, 1,
1.395719, -0.487906, 2.217623, 1, 0, 0.5058824, 1,
1.396821, -1.720772, 1.799603, 1, 0, 0.4980392, 1,
1.40169, -0.2238903, 2.459439, 1, 0, 0.4901961, 1,
1.422546, -0.1056731, 1.581488, 1, 0, 0.4862745, 1,
1.431137, -0.3417988, 0.9626058, 1, 0, 0.4784314, 1,
1.450585, -0.220196, 1.897356, 1, 0, 0.4745098, 1,
1.454842, -1.341936, 3.494468, 1, 0, 0.4666667, 1,
1.458073, -1.142035, 3.070051, 1, 0, 0.4627451, 1,
1.461786, -0.723045, 3.143509, 1, 0, 0.454902, 1,
1.464656, -0.9940671, 2.499216, 1, 0, 0.4509804, 1,
1.470048, 1.101917, -0.1843499, 1, 0, 0.4431373, 1,
1.484044, 1.148659, 2.537958, 1, 0, 0.4392157, 1,
1.489503, 0.6090381, 0.7572249, 1, 0, 0.4313726, 1,
1.52541, -0.2212734, 0.958872, 1, 0, 0.427451, 1,
1.52668, -0.4252969, 2.101972, 1, 0, 0.4196078, 1,
1.536677, 1.20424, -0.3996271, 1, 0, 0.4156863, 1,
1.562328, -0.3033345, 3.930216, 1, 0, 0.4078431, 1,
1.569505, 0.4332685, 0.4173887, 1, 0, 0.4039216, 1,
1.589673, 0.2587411, -0.7593853, 1, 0, 0.3960784, 1,
1.593665, -0.2116602, 2.897707, 1, 0, 0.3882353, 1,
1.606181, -0.2518491, 2.730297, 1, 0, 0.3843137, 1,
1.614722, 2.024029, 0.6045434, 1, 0, 0.3764706, 1,
1.618087, -0.703303, 2.374223, 1, 0, 0.372549, 1,
1.629041, -0.8171473, 2.45733, 1, 0, 0.3647059, 1,
1.629597, -0.3606429, 1.325164, 1, 0, 0.3607843, 1,
1.63174, 1.766387, -0.5249805, 1, 0, 0.3529412, 1,
1.652721, 1.22087, -1.527289, 1, 0, 0.3490196, 1,
1.653149, -0.8571382, 1.333414, 1, 0, 0.3411765, 1,
1.654131, 3.102813, 0.5650449, 1, 0, 0.3372549, 1,
1.654616, -0.4777166, 2.245906, 1, 0, 0.3294118, 1,
1.662637, -0.7294107, 2.597003, 1, 0, 0.3254902, 1,
1.671957, -2.788274, 3.27385, 1, 0, 0.3176471, 1,
1.672249, -0.3569465, 0.8030801, 1, 0, 0.3137255, 1,
1.67898, 0.8897735, 0.7182745, 1, 0, 0.3058824, 1,
1.68907, -0.4434178, 1.896609, 1, 0, 0.2980392, 1,
1.691843, 0.07637242, 1.665825, 1, 0, 0.2941177, 1,
1.694332, -0.05411757, 1.68549, 1, 0, 0.2862745, 1,
1.703772, 1.191275, 0.6915922, 1, 0, 0.282353, 1,
1.70586, -1.038822, 2.437372, 1, 0, 0.2745098, 1,
1.708881, 0.5292171, 3.319892, 1, 0, 0.2705882, 1,
1.729082, -0.7081987, 3.016976, 1, 0, 0.2627451, 1,
1.746613, -0.1964403, 0.4924982, 1, 0, 0.2588235, 1,
1.748846, -0.1392092, 3.073428, 1, 0, 0.2509804, 1,
1.751741, -0.3267226, 1.248865, 1, 0, 0.2470588, 1,
1.761346, -0.2722621, 3.307499, 1, 0, 0.2392157, 1,
1.776868, 0.9155458, 1.536212, 1, 0, 0.2352941, 1,
1.783537, 0.7937827, -0.001569644, 1, 0, 0.227451, 1,
1.80169, 0.09631708, 1.152332, 1, 0, 0.2235294, 1,
1.803029, 0.72522, 1.465625, 1, 0, 0.2156863, 1,
1.810387, -2.072903, 2.007829, 1, 0, 0.2117647, 1,
1.820605, 1.296869, 0.3765128, 1, 0, 0.2039216, 1,
1.821174, -0.3972267, 0.2382823, 1, 0, 0.1960784, 1,
1.843454, 0.396384, 2.083867, 1, 0, 0.1921569, 1,
1.848041, -1.942651, 4.422337, 1, 0, 0.1843137, 1,
1.856111, -0.3111271, 2.619291, 1, 0, 0.1803922, 1,
1.888702, 0.1825356, 0.7606689, 1, 0, 0.172549, 1,
1.915558, -0.6605228, 3.026624, 1, 0, 0.1686275, 1,
1.916448, -0.4184089, 3.144979, 1, 0, 0.1607843, 1,
1.920659, 0.3476688, 1.195908, 1, 0, 0.1568628, 1,
1.943181, -0.9503123, 2.576966, 1, 0, 0.1490196, 1,
1.943508, -0.6072577, 2.125426, 1, 0, 0.145098, 1,
1.956433, 0.476209, 0.1222972, 1, 0, 0.1372549, 1,
1.987552, 0.9148071, 0.6707472, 1, 0, 0.1333333, 1,
2.002908, -1.960828, 2.518568, 1, 0, 0.1254902, 1,
2.023436, -0.909076, 1.315719, 1, 0, 0.1215686, 1,
2.038907, -1.377149, 2.949538, 1, 0, 0.1137255, 1,
2.067146, -1.076913, 0.5477355, 1, 0, 0.1098039, 1,
2.175148, -0.05130243, 0.829905, 1, 0, 0.1019608, 1,
2.181369, 0.3866534, 1.343395, 1, 0, 0.09411765, 1,
2.199903, 0.390657, 2.848972, 1, 0, 0.09019608, 1,
2.206059, 0.8607025, 1.253606, 1, 0, 0.08235294, 1,
2.288762, 1.419661, 1.676762, 1, 0, 0.07843138, 1,
2.322468, 1.855754, 1.418464, 1, 0, 0.07058824, 1,
2.338669, 0.05649465, 3.32875, 1, 0, 0.06666667, 1,
2.354896, 2.634572, 1.022846, 1, 0, 0.05882353, 1,
2.403976, 1.163821, 1.078326, 1, 0, 0.05490196, 1,
2.424153, -0.2405828, 0.3656677, 1, 0, 0.04705882, 1,
2.441227, -1.446134, 0.8678893, 1, 0, 0.04313726, 1,
2.460095, -0.3560182, 2.025116, 1, 0, 0.03529412, 1,
2.528344, 1.966748, 0.7446878, 1, 0, 0.03137255, 1,
2.727356, 0.9139219, 1.958658, 1, 0, 0.02352941, 1,
3.110335, -1.812864, 2.955364, 1, 0, 0.01960784, 1,
3.51526, 0.4219093, 1.716736, 1, 0, 0.01176471, 1,
3.52599, 1.49129, 1.314696, 1, 0, 0.007843138, 1
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
-0.1836089, -4.399364, -7.168104, 0, -0.5, 0.5, 0.5,
-0.1836089, -4.399364, -7.168104, 1, -0.5, 0.5, 0.5,
-0.1836089, -4.399364, -7.168104, 1, 1.5, 0.5, 0.5,
-0.1836089, -4.399364, -7.168104, 0, 1.5, 0.5, 0.5
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
-5.150762, -0.1046165, -7.168104, 0, -0.5, 0.5, 0.5,
-5.150762, -0.1046165, -7.168104, 1, -0.5, 0.5, 0.5,
-5.150762, -0.1046165, -7.168104, 1, 1.5, 0.5, 0.5,
-5.150762, -0.1046165, -7.168104, 0, 1.5, 0.5, 0.5
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
-5.150762, -4.399364, 0.3611703, 0, -0.5, 0.5, 0.5,
-5.150762, -4.399364, 0.3611703, 1, -0.5, 0.5, 0.5,
-5.150762, -4.399364, 0.3611703, 1, 1.5, 0.5, 0.5,
-5.150762, -4.399364, 0.3611703, 0, 1.5, 0.5, 0.5
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
-2, -3.408269, -5.430579,
2, -3.408269, -5.430579,
-2, -3.408269, -5.430579,
-2, -3.573451, -5.720167,
0, -3.408269, -5.430579,
0, -3.573451, -5.720167,
2, -3.408269, -5.430579,
2, -3.573451, -5.720167
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
-2, -3.903816, -6.299342, 0, -0.5, 0.5, 0.5,
-2, -3.903816, -6.299342, 1, -0.5, 0.5, 0.5,
-2, -3.903816, -6.299342, 1, 1.5, 0.5, 0.5,
-2, -3.903816, -6.299342, 0, 1.5, 0.5, 0.5,
0, -3.903816, -6.299342, 0, -0.5, 0.5, 0.5,
0, -3.903816, -6.299342, 1, -0.5, 0.5, 0.5,
0, -3.903816, -6.299342, 1, 1.5, 0.5, 0.5,
0, -3.903816, -6.299342, 0, 1.5, 0.5, 0.5,
2, -3.903816, -6.299342, 0, -0.5, 0.5, 0.5,
2, -3.903816, -6.299342, 1, -0.5, 0.5, 0.5,
2, -3.903816, -6.299342, 1, 1.5, 0.5, 0.5,
2, -3.903816, -6.299342, 0, 1.5, 0.5, 0.5
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
-4.004496, -3, -5.430579,
-4.004496, 3, -5.430579,
-4.004496, -3, -5.430579,
-4.19554, -3, -5.720167,
-4.004496, -2, -5.430579,
-4.19554, -2, -5.720167,
-4.004496, -1, -5.430579,
-4.19554, -1, -5.720167,
-4.004496, 0, -5.430579,
-4.19554, 0, -5.720167,
-4.004496, 1, -5.430579,
-4.19554, 1, -5.720167,
-4.004496, 2, -5.430579,
-4.19554, 2, -5.720167,
-4.004496, 3, -5.430579,
-4.19554, 3, -5.720167
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
-4.577629, -3, -6.299342, 0, -0.5, 0.5, 0.5,
-4.577629, -3, -6.299342, 1, -0.5, 0.5, 0.5,
-4.577629, -3, -6.299342, 1, 1.5, 0.5, 0.5,
-4.577629, -3, -6.299342, 0, 1.5, 0.5, 0.5,
-4.577629, -2, -6.299342, 0, -0.5, 0.5, 0.5,
-4.577629, -2, -6.299342, 1, -0.5, 0.5, 0.5,
-4.577629, -2, -6.299342, 1, 1.5, 0.5, 0.5,
-4.577629, -2, -6.299342, 0, 1.5, 0.5, 0.5,
-4.577629, -1, -6.299342, 0, -0.5, 0.5, 0.5,
-4.577629, -1, -6.299342, 1, -0.5, 0.5, 0.5,
-4.577629, -1, -6.299342, 1, 1.5, 0.5, 0.5,
-4.577629, -1, -6.299342, 0, 1.5, 0.5, 0.5,
-4.577629, 0, -6.299342, 0, -0.5, 0.5, 0.5,
-4.577629, 0, -6.299342, 1, -0.5, 0.5, 0.5,
-4.577629, 0, -6.299342, 1, 1.5, 0.5, 0.5,
-4.577629, 0, -6.299342, 0, 1.5, 0.5, 0.5,
-4.577629, 1, -6.299342, 0, -0.5, 0.5, 0.5,
-4.577629, 1, -6.299342, 1, -0.5, 0.5, 0.5,
-4.577629, 1, -6.299342, 1, 1.5, 0.5, 0.5,
-4.577629, 1, -6.299342, 0, 1.5, 0.5, 0.5,
-4.577629, 2, -6.299342, 0, -0.5, 0.5, 0.5,
-4.577629, 2, -6.299342, 1, -0.5, 0.5, 0.5,
-4.577629, 2, -6.299342, 1, 1.5, 0.5, 0.5,
-4.577629, 2, -6.299342, 0, 1.5, 0.5, 0.5,
-4.577629, 3, -6.299342, 0, -0.5, 0.5, 0.5,
-4.577629, 3, -6.299342, 1, -0.5, 0.5, 0.5,
-4.577629, 3, -6.299342, 1, 1.5, 0.5, 0.5,
-4.577629, 3, -6.299342, 0, 1.5, 0.5, 0.5
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
-4.004496, -3.408269, -4,
-4.004496, -3.408269, 4,
-4.004496, -3.408269, -4,
-4.19554, -3.573451, -4,
-4.004496, -3.408269, -2,
-4.19554, -3.573451, -2,
-4.004496, -3.408269, 0,
-4.19554, -3.573451, 0,
-4.004496, -3.408269, 2,
-4.19554, -3.573451, 2,
-4.004496, -3.408269, 4,
-4.19554, -3.573451, 4
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
-4.577629, -3.903816, -4, 0, -0.5, 0.5, 0.5,
-4.577629, -3.903816, -4, 1, -0.5, 0.5, 0.5,
-4.577629, -3.903816, -4, 1, 1.5, 0.5, 0.5,
-4.577629, -3.903816, -4, 0, 1.5, 0.5, 0.5,
-4.577629, -3.903816, -2, 0, -0.5, 0.5, 0.5,
-4.577629, -3.903816, -2, 1, -0.5, 0.5, 0.5,
-4.577629, -3.903816, -2, 1, 1.5, 0.5, 0.5,
-4.577629, -3.903816, -2, 0, 1.5, 0.5, 0.5,
-4.577629, -3.903816, 0, 0, -0.5, 0.5, 0.5,
-4.577629, -3.903816, 0, 1, -0.5, 0.5, 0.5,
-4.577629, -3.903816, 0, 1, 1.5, 0.5, 0.5,
-4.577629, -3.903816, 0, 0, 1.5, 0.5, 0.5,
-4.577629, -3.903816, 2, 0, -0.5, 0.5, 0.5,
-4.577629, -3.903816, 2, 1, -0.5, 0.5, 0.5,
-4.577629, -3.903816, 2, 1, 1.5, 0.5, 0.5,
-4.577629, -3.903816, 2, 0, 1.5, 0.5, 0.5,
-4.577629, -3.903816, 4, 0, -0.5, 0.5, 0.5,
-4.577629, -3.903816, 4, 1, -0.5, 0.5, 0.5,
-4.577629, -3.903816, 4, 1, 1.5, 0.5, 0.5,
-4.577629, -3.903816, 4, 0, 1.5, 0.5, 0.5
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
-4.004496, -3.408269, -5.430579,
-4.004496, 3.199036, -5.430579,
-4.004496, -3.408269, 6.15292,
-4.004496, 3.199036, 6.15292,
-4.004496, -3.408269, -5.430579,
-4.004496, -3.408269, 6.15292,
-4.004496, 3.199036, -5.430579,
-4.004496, 3.199036, 6.15292,
-4.004496, -3.408269, -5.430579,
3.637278, -3.408269, -5.430579,
-4.004496, -3.408269, 6.15292,
3.637278, -3.408269, 6.15292,
-4.004496, 3.199036, -5.430579,
3.637278, 3.199036, -5.430579,
-4.004496, 3.199036, 6.15292,
3.637278, 3.199036, 6.15292,
3.637278, -3.408269, -5.430579,
3.637278, 3.199036, -5.430579,
3.637278, -3.408269, 6.15292,
3.637278, 3.199036, 6.15292,
3.637278, -3.408269, -5.430579,
3.637278, -3.408269, 6.15292,
3.637278, 3.199036, -5.430579,
3.637278, 3.199036, 6.15292
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
var radius = 8.207173;
var distance = 36.51464;
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
mvMatrix.translate( 0.1836089, 0.1046165, -0.3611703 );
mvMatrix.scale( 1.161217, 1.343022, 0.7660687 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.51464);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
disodium_arsenate_so<-read.table("disodium_arsenate_so.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 5 elements
```

```r
x<-disodium_arsenate_so$V2
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
```

```r
y<-disodium_arsenate_so$V3
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
```

```r
z<-disodium_arsenate_so$V4
```

```
## Error in eval(expr, envir, enclos): object 'disodium_arsenate_so' not found
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
-3.893208, -1.382105, -0.8631225, 0, 0, 1, 1, 1,
-3.114543, -1.339046, -2.873102, 1, 0, 0, 1, 1,
-3.033027, -1.175341, -1.820426, 1, 0, 0, 1, 1,
-3.010445, 0.4108992, -0.8551149, 1, 0, 0, 1, 1,
-2.915229, -0.4523079, -2.355904, 1, 0, 0, 1, 1,
-2.62378, -0.5229204, 0.4677565, 1, 0, 0, 1, 1,
-2.594598, 0.9996544, -0.9611004, 0, 0, 0, 1, 1,
-2.494998, 0.2429223, -2.585912, 0, 0, 0, 1, 1,
-2.485771, 0.544215, -1.068196, 0, 0, 0, 1, 1,
-2.403278, -0.210545, -1.825913, 0, 0, 0, 1, 1,
-2.382768, -0.09079377, -1.752632, 0, 0, 0, 1, 1,
-2.375424, -0.1813405, -2.254833, 0, 0, 0, 1, 1,
-2.365874, -1.392495, -2.028352, 0, 0, 0, 1, 1,
-2.357182, 0.8986835, -0.1543451, 1, 1, 1, 1, 1,
-2.34433, -0.913614, -1.928534, 1, 1, 1, 1, 1,
-2.338685, 0.4117035, -1.319252, 1, 1, 1, 1, 1,
-2.303122, 0.7437943, -1.702379, 1, 1, 1, 1, 1,
-2.287869, -0.7323647, -2.44332, 1, 1, 1, 1, 1,
-2.258735, -0.6915634, -1.194656, 1, 1, 1, 1, 1,
-2.253224, 0.05992185, -1.636408, 1, 1, 1, 1, 1,
-2.252017, -0.9598577, -2.215392, 1, 1, 1, 1, 1,
-2.179374, -0.8799418, -1.886036, 1, 1, 1, 1, 1,
-2.16283, 0.05109611, -2.341218, 1, 1, 1, 1, 1,
-2.160982, 0.8415149, -0.3238544, 1, 1, 1, 1, 1,
-2.120201, -0.08415809, -1.986824, 1, 1, 1, 1, 1,
-2.0932, -0.210489, -0.4009245, 1, 1, 1, 1, 1,
-1.982116, -0.535416, -2.593712, 1, 1, 1, 1, 1,
-1.927259, -2.056071, -2.42996, 1, 1, 1, 1, 1,
-1.90751, 0.4236283, -2.235754, 0, 0, 1, 1, 1,
-1.894478, 0.5929371, -0.2168996, 1, 0, 0, 1, 1,
-1.88909, 0.9599648, -2.322608, 1, 0, 0, 1, 1,
-1.885453, -1.209542, -4.169856, 1, 0, 0, 1, 1,
-1.884524, -0.433927, -0.06417346, 1, 0, 0, 1, 1,
-1.877105, 0.08140542, -1.462546, 1, 0, 0, 1, 1,
-1.865882, 0.2342618, -1.014082, 0, 0, 0, 1, 1,
-1.80301, 0.8414236, -0.56893, 0, 0, 0, 1, 1,
-1.80164, -0.2029815, -1.032415, 0, 0, 0, 1, 1,
-1.777889, 1.68352, 0.5351532, 0, 0, 0, 1, 1,
-1.766284, -0.05009024, -1.233489, 0, 0, 0, 1, 1,
-1.763011, 1.296559, -0.5346501, 0, 0, 0, 1, 1,
-1.7444, 0.4151238, -1.662659, 0, 0, 0, 1, 1,
-1.708691, -0.3779386, 0.2616459, 1, 1, 1, 1, 1,
-1.704734, -1.16741, -3.500436, 1, 1, 1, 1, 1,
-1.699175, 1.577127, -1.298268, 1, 1, 1, 1, 1,
-1.696902, 2.134905, -0.4273756, 1, 1, 1, 1, 1,
-1.690782, 0.2407438, -1.198642, 1, 1, 1, 1, 1,
-1.684056, -0.377409, -1.592045, 1, 1, 1, 1, 1,
-1.68121, 0.1498283, -2.643101, 1, 1, 1, 1, 1,
-1.670404, 0.6639023, -1.704338, 1, 1, 1, 1, 1,
-1.667003, 0.4037737, -0.9399561, 1, 1, 1, 1, 1,
-1.665616, 0.3384601, -1.650395, 1, 1, 1, 1, 1,
-1.639407, -1.200918, -1.193525, 1, 1, 1, 1, 1,
-1.63355, -0.6672938, -1.862237, 1, 1, 1, 1, 1,
-1.623789, -0.05674962, -2.368233, 1, 1, 1, 1, 1,
-1.612607, 0.8619004, -0.3981732, 1, 1, 1, 1, 1,
-1.603732, -0.9714178, -2.031505, 1, 1, 1, 1, 1,
-1.593861, 0.1935197, -1.870407, 0, 0, 1, 1, 1,
-1.572585, -0.3193341, -0.2467286, 1, 0, 0, 1, 1,
-1.568441, -1.013836, -2.243074, 1, 0, 0, 1, 1,
-1.56355, 0.2343916, -1.841936, 1, 0, 0, 1, 1,
-1.562534, 0.308688, -0.2569084, 1, 0, 0, 1, 1,
-1.541029, 0.1581407, -2.726146, 1, 0, 0, 1, 1,
-1.540329, 0.3195165, -2.067342, 0, 0, 0, 1, 1,
-1.534741, 0.07408701, -3.08999, 0, 0, 0, 1, 1,
-1.529311, -2.243658, -3.380586, 0, 0, 0, 1, 1,
-1.525172, 1.033771, -0.6184143, 0, 0, 0, 1, 1,
-1.506144, -1.454297, -0.5629134, 0, 0, 0, 1, 1,
-1.492463, -0.4250707, -2.953726, 0, 0, 0, 1, 1,
-1.489525, 0.1277654, -1.665087, 0, 0, 0, 1, 1,
-1.461229, 0.2757766, -2.382389, 1, 1, 1, 1, 1,
-1.460852, 1.419371, -1.679844, 1, 1, 1, 1, 1,
-1.452429, 2.332435, -0.03621688, 1, 1, 1, 1, 1,
-1.446347, 0.08983682, -1.393557, 1, 1, 1, 1, 1,
-1.438485, -0.3239687, -2.14727, 1, 1, 1, 1, 1,
-1.435843, -1.647569, -2.814428, 1, 1, 1, 1, 1,
-1.428337, 0.8989147, -0.9458062, 1, 1, 1, 1, 1,
-1.426003, -0.08264336, -2.40673, 1, 1, 1, 1, 1,
-1.42456, 0.5252237, -0.9779866, 1, 1, 1, 1, 1,
-1.423897, -0.6873178, -2.446904, 1, 1, 1, 1, 1,
-1.423462, 0.5481502, -3.263296, 1, 1, 1, 1, 1,
-1.396966, -0.4634275, -1.156447, 1, 1, 1, 1, 1,
-1.382458, 1.540225, -0.4932046, 1, 1, 1, 1, 1,
-1.374053, -1.057076, -2.378185, 1, 1, 1, 1, 1,
-1.367985, 0.8782276, -0.1949939, 1, 1, 1, 1, 1,
-1.353139, -0.09922817, -2.28072, 0, 0, 1, 1, 1,
-1.341354, -1.863843, -3.494247, 1, 0, 0, 1, 1,
-1.33979, -1.146527, -1.847742, 1, 0, 0, 1, 1,
-1.336296, -0.5620545, 0.2849208, 1, 0, 0, 1, 1,
-1.327084, -0.9976127, -2.743354, 1, 0, 0, 1, 1,
-1.321687, 0.8329369, -0.43172, 1, 0, 0, 1, 1,
-1.316245, -1.086837, -1.955972, 0, 0, 0, 1, 1,
-1.311969, -2.871496, -1.593237, 0, 0, 0, 1, 1,
-1.295796, -1.331743, -3.402096, 0, 0, 0, 1, 1,
-1.289001, 0.6242152, -1.425135, 0, 0, 0, 1, 1,
-1.275253, -0.2487787, -2.99959, 0, 0, 0, 1, 1,
-1.269074, -0.1883302, -1.54453, 0, 0, 0, 1, 1,
-1.26885, -1.24185, -2.475027, 0, 0, 0, 1, 1,
-1.265068, 0.2453298, -3.030149, 1, 1, 1, 1, 1,
-1.256481, -1.427425, -4.304041, 1, 1, 1, 1, 1,
-1.255821, 1.981787, -0.9042869, 1, 1, 1, 1, 1,
-1.251147, 0.7267178, -0.7156421, 1, 1, 1, 1, 1,
-1.247872, -1.36545, -1.155064, 1, 1, 1, 1, 1,
-1.236442, 0.749551, -0.6023692, 1, 1, 1, 1, 1,
-1.234864, -0.7863658, -2.22765, 1, 1, 1, 1, 1,
-1.228342, -0.3563522, -2.613485, 1, 1, 1, 1, 1,
-1.224534, -1.712925, -1.549138, 1, 1, 1, 1, 1,
-1.21125, -0.3934507, -0.7008567, 1, 1, 1, 1, 1,
-1.211174, 1.545392, -1.905505, 1, 1, 1, 1, 1,
-1.20435, -0.1770476, -2.292317, 1, 1, 1, 1, 1,
-1.203309, -1.77759, -1.402375, 1, 1, 1, 1, 1,
-1.201614, 2.363192, -2.413491, 1, 1, 1, 1, 1,
-1.200832, 1.363382, -0.8191553, 1, 1, 1, 1, 1,
-1.189521, -0.3265439, -2.828854, 0, 0, 1, 1, 1,
-1.186724, -0.2887275, -1.387257, 1, 0, 0, 1, 1,
-1.177798, 0.4796766, -2.432504, 1, 0, 0, 1, 1,
-1.155501, -0.2409834, -2.787426, 1, 0, 0, 1, 1,
-1.151815, -1.330444, -3.249073, 1, 0, 0, 1, 1,
-1.146341, -1.290651, -2.136477, 1, 0, 0, 1, 1,
-1.137046, -0.6253713, -1.083755, 0, 0, 0, 1, 1,
-1.135453, 0.6710296, 0.07133134, 0, 0, 0, 1, 1,
-1.135083, 0.6218475, -0.4141449, 0, 0, 0, 1, 1,
-1.134905, 1.506114, -2.170914, 0, 0, 0, 1, 1,
-1.13184, -1.064405, -2.528184, 0, 0, 0, 1, 1,
-1.124392, -0.302298, -3.968932, 0, 0, 0, 1, 1,
-1.124111, 0.5650631, -2.582899, 0, 0, 0, 1, 1,
-1.118045, -0.511015, -1.368783, 1, 1, 1, 1, 1,
-1.11751, 1.836859, -1.962235, 1, 1, 1, 1, 1,
-1.115627, 0.7571623, -1.53658, 1, 1, 1, 1, 1,
-1.10408, -0.121721, -1.354524, 1, 1, 1, 1, 1,
-1.100381, -0.1611112, -2.767521, 1, 1, 1, 1, 1,
-1.09411, -0.7195216, -1.460387, 1, 1, 1, 1, 1,
-1.093307, -1.305293, -1.274849, 1, 1, 1, 1, 1,
-1.091682, 1.7202, -0.5387325, 1, 1, 1, 1, 1,
-1.084339, 0.1174132, -1.570382, 1, 1, 1, 1, 1,
-1.083443, -0.01133626, -1.931509, 1, 1, 1, 1, 1,
-1.08167, 2.133309, -0.03759572, 1, 1, 1, 1, 1,
-1.072478, 0.2006462, -0.7458761, 1, 1, 1, 1, 1,
-1.071364, -0.9866595, -2.131877, 1, 1, 1, 1, 1,
-1.070678, -0.5501937, -1.369757, 1, 1, 1, 1, 1,
-1.059572, -0.0667533, -2.783077, 1, 1, 1, 1, 1,
-1.053506, -0.5869259, -2.440361, 0, 0, 1, 1, 1,
-1.048772, 1.173964, -1.534979, 1, 0, 0, 1, 1,
-1.046035, 0.2313308, -0.7878182, 1, 0, 0, 1, 1,
-1.039363, -0.5366753, -1.840225, 1, 0, 0, 1, 1,
-1.037432, 0.5584207, -0.2355097, 1, 0, 0, 1, 1,
-1.037406, 0.4109259, -1.882955, 1, 0, 0, 1, 1,
-1.030225, 0.1886357, -1.107232, 0, 0, 0, 1, 1,
-1.03001, -0.188222, -2.400429, 0, 0, 0, 1, 1,
-1.020577, 0.06415775, 0.5012726, 0, 0, 0, 1, 1,
-1.014829, -1.560813, -0.4442857, 0, 0, 0, 1, 1,
-1.014637, 0.1237599, -1.524073, 0, 0, 0, 1, 1,
-1.008574, 0.5817229, -0.6809023, 0, 0, 0, 1, 1,
-1.002749, 1.532704, -0.05805962, 0, 0, 0, 1, 1,
-0.9992251, -1.284258, -1.86249, 1, 1, 1, 1, 1,
-0.9931938, -2.410812, -3.24258, 1, 1, 1, 1, 1,
-0.9905773, 1.216227, -2.142703, 1, 1, 1, 1, 1,
-0.9855583, -1.149437, -0.4306944, 1, 1, 1, 1, 1,
-0.9846223, -0.3371308, -1.411572, 1, 1, 1, 1, 1,
-0.9839093, 0.1345734, -1.724138, 1, 1, 1, 1, 1,
-0.9835131, -0.125358, -1.594866, 1, 1, 1, 1, 1,
-0.9795213, 1.94676, 0.03538122, 1, 1, 1, 1, 1,
-0.9705845, 0.3464076, -2.373773, 1, 1, 1, 1, 1,
-0.9697194, 0.7630643, -2.242723, 1, 1, 1, 1, 1,
-0.9642264, 1.053559, 0.08408057, 1, 1, 1, 1, 1,
-0.9618556, -0.6570534, -2.151758, 1, 1, 1, 1, 1,
-0.9611272, 0.2982636, 0.776341, 1, 1, 1, 1, 1,
-0.9586042, -1.843204, -2.725911, 1, 1, 1, 1, 1,
-0.9501627, 0.4133007, -1.412372, 1, 1, 1, 1, 1,
-0.9488893, 1.886637, -0.8690687, 0, 0, 1, 1, 1,
-0.9457312, 0.2249487, -2.201272, 1, 0, 0, 1, 1,
-0.9363477, 0.5999621, -2.026253, 1, 0, 0, 1, 1,
-0.9349933, 0.5749612, -2.495627, 1, 0, 0, 1, 1,
-0.9311815, 1.041042, -0.2265331, 1, 0, 0, 1, 1,
-0.9225308, -0.339731, -1.914633, 1, 0, 0, 1, 1,
-0.9158454, 1.407128, 0.4820739, 0, 0, 0, 1, 1,
-0.9155568, 0.8018972, -0.1667348, 0, 0, 0, 1, 1,
-0.908837, 0.5571402, -2.446553, 0, 0, 0, 1, 1,
-0.9084646, 0.8070921, -0.657653, 0, 0, 0, 1, 1,
-0.9018871, 0.3557191, -1.856954, 0, 0, 0, 1, 1,
-0.896656, -0.1139352, -1.579429, 0, 0, 0, 1, 1,
-0.8901166, -2.235277, -2.323035, 0, 0, 0, 1, 1,
-0.8813442, -0.1239248, -1.80824, 1, 1, 1, 1, 1,
-0.8752371, -0.0831056, -1.283296, 1, 1, 1, 1, 1,
-0.8737062, 0.5743674, -1.299727, 1, 1, 1, 1, 1,
-0.8633068, -0.09639867, -3.193383, 1, 1, 1, 1, 1,
-0.8631319, -0.5123056, -2.445965, 1, 1, 1, 1, 1,
-0.8625864, 0.02028011, -1.304854, 1, 1, 1, 1, 1,
-0.8578942, -0.8005391, -3.615327, 1, 1, 1, 1, 1,
-0.8571692, 0.5050913, -1.05013, 1, 1, 1, 1, 1,
-0.8569918, -0.3292694, -3.301071, 1, 1, 1, 1, 1,
-0.8521086, -0.8951558, -1.728851, 1, 1, 1, 1, 1,
-0.8515812, 0.9524232, 0.9662563, 1, 1, 1, 1, 1,
-0.8502941, -1.563075, -2.875135, 1, 1, 1, 1, 1,
-0.8489279, -0.2200977, -1.98787, 1, 1, 1, 1, 1,
-0.8466165, -0.5178587, -2.461202, 1, 1, 1, 1, 1,
-0.8410558, -1.709236, -3.977554, 1, 1, 1, 1, 1,
-0.8349255, 0.6010075, -1.028608, 0, 0, 1, 1, 1,
-0.8348153, -1.089084, -1.209057, 1, 0, 0, 1, 1,
-0.8264209, 0.557499, -1.081277, 1, 0, 0, 1, 1,
-0.8183299, 0.5495282, -1.445775, 1, 0, 0, 1, 1,
-0.8097824, -0.04150732, -0.9563445, 1, 0, 0, 1, 1,
-0.8089886, 0.8859819, -1.574145, 1, 0, 0, 1, 1,
-0.8071271, -0.03606822, -1.575145, 0, 0, 0, 1, 1,
-0.8040051, -0.3761012, -2.57875, 0, 0, 0, 1, 1,
-0.8027959, -1.182336, -4.348203, 0, 0, 0, 1, 1,
-0.801529, 0.08024106, -1.962531, 0, 0, 0, 1, 1,
-0.8005702, 2.109529, 0.007948468, 0, 0, 0, 1, 1,
-0.7965534, -0.5032554, -0.5542773, 0, 0, 0, 1, 1,
-0.7931874, 0.1573864, -0.7174122, 0, 0, 0, 1, 1,
-0.7892271, 0.2370095, 0.1166495, 1, 1, 1, 1, 1,
-0.7842936, -1.450799, -5.261888, 1, 1, 1, 1, 1,
-0.7824584, -0.07813094, -2.152826, 1, 1, 1, 1, 1,
-0.7764409, 1.674524, -0.1067122, 1, 1, 1, 1, 1,
-0.7755175, 1.618506, -0.5004747, 1, 1, 1, 1, 1,
-0.765802, -0.4955179, -2.741251, 1, 1, 1, 1, 1,
-0.7551942, 1.703141, -0.4203565, 1, 1, 1, 1, 1,
-0.7517511, 1.459078, -2.546613, 1, 1, 1, 1, 1,
-0.7468687, -0.09774163, -1.975436, 1, 1, 1, 1, 1,
-0.7420639, -0.6091087, -4.524609, 1, 1, 1, 1, 1,
-0.7390962, -0.2447969, -1.389823, 1, 1, 1, 1, 1,
-0.7365561, 1.768097, -2.82207, 1, 1, 1, 1, 1,
-0.7347181, 0.6479291, -1.693989, 1, 1, 1, 1, 1,
-0.7319919, -1.640837, -2.521857, 1, 1, 1, 1, 1,
-0.7290236, -0.2826165, -2.315907, 1, 1, 1, 1, 1,
-0.7259579, 0.6392951, -1.447305, 0, 0, 1, 1, 1,
-0.7252012, 0.5086263, 0.2010649, 1, 0, 0, 1, 1,
-0.7204587, -0.3717593, -3.281284, 1, 0, 0, 1, 1,
-0.7191822, 0.7200434, -0.4091558, 1, 0, 0, 1, 1,
-0.7162359, 0.2963738, -0.2073778, 1, 0, 0, 1, 1,
-0.7132224, -0.6126685, 1.672454, 1, 0, 0, 1, 1,
-0.7114032, -0.8418539, -2.059716, 0, 0, 0, 1, 1,
-0.7059301, -0.9022473, -4.096002, 0, 0, 0, 1, 1,
-0.7021751, -1.399078, -2.493569, 0, 0, 0, 1, 1,
-0.6974575, -0.6535792, -2.895274, 0, 0, 0, 1, 1,
-0.6945229, -0.2429994, -1.220657, 0, 0, 0, 1, 1,
-0.6936432, -1.206092, -1.898255, 0, 0, 0, 1, 1,
-0.6903605, 0.03172741, 0.009538093, 0, 0, 0, 1, 1,
-0.688884, 0.8246543, 0.1967507, 1, 1, 1, 1, 1,
-0.6857117, -0.8114209, -3.382953, 1, 1, 1, 1, 1,
-0.6777647, -1.10042, -1.893283, 1, 1, 1, 1, 1,
-0.675589, -0.5841063, -3.357426, 1, 1, 1, 1, 1,
-0.6749853, 0.5654799, 0.6240432, 1, 1, 1, 1, 1,
-0.6731305, 1.436966, -0.04500327, 1, 1, 1, 1, 1,
-0.6718909, 0.6231741, -0.5965318, 1, 1, 1, 1, 1,
-0.6683171, 0.3314346, 0.6501263, 1, 1, 1, 1, 1,
-0.667616, 0.956181, -1.171634, 1, 1, 1, 1, 1,
-0.66751, 0.6025174, -0.3742616, 1, 1, 1, 1, 1,
-0.6644115, 0.7256404, 0.1099768, 1, 1, 1, 1, 1,
-0.6636977, 0.1537868, -2.675042, 1, 1, 1, 1, 1,
-0.6609327, 2.015793, 0.3041118, 1, 1, 1, 1, 1,
-0.6586995, -1.445285, -2.238444, 1, 1, 1, 1, 1,
-0.6569895, 0.7218596, -1.729552, 1, 1, 1, 1, 1,
-0.6549613, 1.00142, -1.647139, 0, 0, 1, 1, 1,
-0.6521749, 0.5491527, 0.3824044, 1, 0, 0, 1, 1,
-0.6513088, -0.2181629, -3.121853, 1, 0, 0, 1, 1,
-0.6512851, 1.153584, 1.642128, 1, 0, 0, 1, 1,
-0.6498746, 1.301982, -0.9491131, 1, 0, 0, 1, 1,
-0.649538, -0.01739814, -1.237799, 1, 0, 0, 1, 1,
-0.6431929, 1.449194, 0.06600191, 0, 0, 0, 1, 1,
-0.6419453, 0.524527, -0.8196046, 0, 0, 0, 1, 1,
-0.641786, 0.6977099, -1.558979, 0, 0, 0, 1, 1,
-0.6390639, -0.4215548, -1.801028, 0, 0, 0, 1, 1,
-0.6355625, 1.484602, -0.7638956, 0, 0, 0, 1, 1,
-0.62901, 0.5735858, -0.526111, 0, 0, 0, 1, 1,
-0.6228748, -0.1924179, -3.073377, 0, 0, 0, 1, 1,
-0.6224325, -0.2207097, -0.1706358, 1, 1, 1, 1, 1,
-0.6217411, -1.687316, -1.829377, 1, 1, 1, 1, 1,
-0.6213987, -1.38299, -4.356857, 1, 1, 1, 1, 1,
-0.619467, -0.7971144, -3.432121, 1, 1, 1, 1, 1,
-0.6148298, -0.3014882, -1.702608, 1, 1, 1, 1, 1,
-0.609358, -0.9638284, -2.275824, 1, 1, 1, 1, 1,
-0.6052903, -0.04638689, -1.845709, 1, 1, 1, 1, 1,
-0.5940475, -2.342341, -4.37816, 1, 1, 1, 1, 1,
-0.5939435, 0.05195097, -2.188604, 1, 1, 1, 1, 1,
-0.5939166, 1.14275, 0.2654656, 1, 1, 1, 1, 1,
-0.5903162, 1.097208, 1.560717, 1, 1, 1, 1, 1,
-0.589836, 0.2612895, -0.5975174, 1, 1, 1, 1, 1,
-0.5872238, -0.2074367, -1.055583, 1, 1, 1, 1, 1,
-0.5868891, -0.6505044, -3.603862, 1, 1, 1, 1, 1,
-0.5867946, -0.06692, -1.566906, 1, 1, 1, 1, 1,
-0.5839701, 0.6206972, 0.1649645, 0, 0, 1, 1, 1,
-0.582934, 0.9504182, -0.4464862, 1, 0, 0, 1, 1,
-0.5794291, 0.7561175, -0.6074795, 1, 0, 0, 1, 1,
-0.5774292, -1.930325, -3.204008, 1, 0, 0, 1, 1,
-0.5769871, -0.2403896, -1.72895, 1, 0, 0, 1, 1,
-0.5765088, -0.5485889, -0.4386326, 1, 0, 0, 1, 1,
-0.5749335, -0.06481474, -1.896781, 0, 0, 0, 1, 1,
-0.5744305, 0.1029749, -2.611899, 0, 0, 0, 1, 1,
-0.5734772, -0.3297516, -2.463861, 0, 0, 0, 1, 1,
-0.5727267, 0.3153196, -0.5006739, 0, 0, 0, 1, 1,
-0.5715976, 1.665877, -0.7181493, 0, 0, 0, 1, 1,
-0.5620824, -0.5834684, -1.277693, 0, 0, 0, 1, 1,
-0.559676, -0.6775295, -1.936325, 0, 0, 0, 1, 1,
-0.5542198, 2.054959, 0.6436231, 1, 1, 1, 1, 1,
-0.5530317, -0.2983341, -2.741558, 1, 1, 1, 1, 1,
-0.5517215, -1.973464, -3.486561, 1, 1, 1, 1, 1,
-0.5512971, 0.08218653, 0.03372057, 1, 1, 1, 1, 1,
-0.5509252, 0.07925728, -2.626362, 1, 1, 1, 1, 1,
-0.5499927, 1.094924, 0.2961324, 1, 1, 1, 1, 1,
-0.5485559, 0.2953252, -1.169584, 1, 1, 1, 1, 1,
-0.5351705, 0.2765654, -0.299503, 1, 1, 1, 1, 1,
-0.5334678, -1.512576, -3.626852, 1, 1, 1, 1, 1,
-0.5334016, 0.2000626, -2.092135, 1, 1, 1, 1, 1,
-0.5305535, 2.293399, -0.407217, 1, 1, 1, 1, 1,
-0.5281057, 0.5070303, -2.137088, 1, 1, 1, 1, 1,
-0.5246678, -0.6887141, -3.857395, 1, 1, 1, 1, 1,
-0.5165176, -0.2811627, -2.157502, 1, 1, 1, 1, 1,
-0.5119466, 2.287005, 0.2154076, 1, 1, 1, 1, 1,
-0.5105941, 0.3772048, -0.3367043, 0, 0, 1, 1, 1,
-0.5039845, 1.192434, 0.3182055, 1, 0, 0, 1, 1,
-0.5009087, -0.3193451, -1.808721, 1, 0, 0, 1, 1,
-0.5003518, 0.6702766, 1.244055, 1, 0, 0, 1, 1,
-0.5003223, 0.1372817, -2.179913, 1, 0, 0, 1, 1,
-0.4998468, -0.4157905, -3.262916, 1, 0, 0, 1, 1,
-0.4987918, -0.3502671, -2.731476, 0, 0, 0, 1, 1,
-0.49716, 0.2828435, 0.3386686, 0, 0, 0, 1, 1,
-0.492436, 0.922546, -0.5066921, 0, 0, 0, 1, 1,
-0.4902939, -0.9892339, -4.30852, 0, 0, 0, 1, 1,
-0.489513, 2.004087, -2.27296, 0, 0, 0, 1, 1,
-0.4815276, 1.179997, 0.2646281, 0, 0, 0, 1, 1,
-0.4776061, -0.9517512, -4.353234, 0, 0, 0, 1, 1,
-0.4757569, -0.6423232, -3.266718, 1, 1, 1, 1, 1,
-0.4739231, 0.9011897, -1.69408, 1, 1, 1, 1, 1,
-0.4724908, 0.02972049, -1.458928, 1, 1, 1, 1, 1,
-0.469494, 0.1559659, -1.326071, 1, 1, 1, 1, 1,
-0.4680143, -0.4442896, -2.70522, 1, 1, 1, 1, 1,
-0.4627804, -1.805104, -3.052064, 1, 1, 1, 1, 1,
-0.4583038, 0.7934053, 0.8209142, 1, 1, 1, 1, 1,
-0.4514363, 0.4965425, -0.4482339, 1, 1, 1, 1, 1,
-0.4489973, 1.64376, -0.1108071, 1, 1, 1, 1, 1,
-0.4482352, -0.6979628, -0.8285172, 1, 1, 1, 1, 1,
-0.4451862, 1.044, 0.2493178, 1, 1, 1, 1, 1,
-0.4446796, 0.40147, -0.3354394, 1, 1, 1, 1, 1,
-0.4418193, -0.6337975, -3.788086, 1, 1, 1, 1, 1,
-0.4415844, 0.02872558, 0.02813875, 1, 1, 1, 1, 1,
-0.4359497, -0.5417509, -0.3502753, 1, 1, 1, 1, 1,
-0.4344717, -0.09664546, -1.783846, 0, 0, 1, 1, 1,
-0.4301916, -1.926087, -2.819323, 1, 0, 0, 1, 1,
-0.4279154, 0.1162027, -0.358304, 1, 0, 0, 1, 1,
-0.4272672, 2.001423, 0.09262342, 1, 0, 0, 1, 1,
-0.425041, 0.379843, -0.548328, 1, 0, 0, 1, 1,
-0.4203649, 0.7246497, 0.2228453, 1, 0, 0, 1, 1,
-0.4199111, 0.3668438, -0.3625919, 0, 0, 0, 1, 1,
-0.4195206, 1.454133, 0.9862247, 0, 0, 0, 1, 1,
-0.4132987, 0.9176958, -0.7476478, 0, 0, 0, 1, 1,
-0.4072102, 2.36032, -1.844244, 0, 0, 0, 1, 1,
-0.4064652, -0.9754403, -2.421556, 0, 0, 0, 1, 1,
-0.4050494, -0.08546897, -1.285303, 0, 0, 0, 1, 1,
-0.4044281, 0.05542211, -1.830384, 0, 0, 0, 1, 1,
-0.3957911, -0.01593232, -2.677166, 1, 1, 1, 1, 1,
-0.3895538, -0.4382209, -2.368917, 1, 1, 1, 1, 1,
-0.3870819, 0.8840447, -1.701881, 1, 1, 1, 1, 1,
-0.3863106, 0.4128504, -2.813869, 1, 1, 1, 1, 1,
-0.3821906, 1.060351, 0.5840605, 1, 1, 1, 1, 1,
-0.3809728, -1.296821, -1.750665, 1, 1, 1, 1, 1,
-0.3760499, -0.8750862, -2.443833, 1, 1, 1, 1, 1,
-0.3703, -0.78604, -2.680897, 1, 1, 1, 1, 1,
-0.369183, 1.068418, 0.2994984, 1, 1, 1, 1, 1,
-0.3680115, 1.486452, -0.2855612, 1, 1, 1, 1, 1,
-0.3664963, -0.4589396, -1.479455, 1, 1, 1, 1, 1,
-0.3630476, -0.6690804, -3.376323, 1, 1, 1, 1, 1,
-0.358279, 0.7222698, -0.2713498, 1, 1, 1, 1, 1,
-0.3565995, 0.9441407, -1.375252, 1, 1, 1, 1, 1,
-0.3514671, 0.1804174, 0.8682171, 1, 1, 1, 1, 1,
-0.3514017, -0.1531143, -3.047762, 0, 0, 1, 1, 1,
-0.3486698, 0.4415791, -1.526548, 1, 0, 0, 1, 1,
-0.3452249, -0.7938294, -3.463609, 1, 0, 0, 1, 1,
-0.3439867, -0.5319751, -2.452816, 1, 0, 0, 1, 1,
-0.3435251, -0.292466, -2.086445, 1, 0, 0, 1, 1,
-0.3426903, -0.1019181, -1.386685, 1, 0, 0, 1, 1,
-0.3405708, -1.153302, -2.785681, 0, 0, 0, 1, 1,
-0.3362431, -0.4750378, -1.56916, 0, 0, 0, 1, 1,
-0.3355998, -2.14222, -1.429553, 0, 0, 0, 1, 1,
-0.3343283, -1.596834, -4.020856, 0, 0, 0, 1, 1,
-0.331026, 0.3573301, 0.7537053, 0, 0, 0, 1, 1,
-0.3281842, 0.737368, -0.1472429, 0, 0, 0, 1, 1,
-0.3265161, 0.6129886, 0.2377713, 0, 0, 0, 1, 1,
-0.3257489, -0.7687954, -1.472818, 1, 1, 1, 1, 1,
-0.3247213, 0.3513534, -0.8686991, 1, 1, 1, 1, 1,
-0.3240777, 0.7696558, -1.283142, 1, 1, 1, 1, 1,
-0.322441, -0.5115501, -1.084661, 1, 1, 1, 1, 1,
-0.321748, -0.2321468, -2.173576, 1, 1, 1, 1, 1,
-0.3197703, 0.06073437, -0.857382, 1, 1, 1, 1, 1,
-0.3192774, -0.02976783, -0.9192466, 1, 1, 1, 1, 1,
-0.3190586, -1.545168, -3.856031, 1, 1, 1, 1, 1,
-0.3187268, 2.087349, 0.3511486, 1, 1, 1, 1, 1,
-0.3160655, 1.354665, -0.2498664, 1, 1, 1, 1, 1,
-0.3121799, -1.546511, -2.130191, 1, 1, 1, 1, 1,
-0.3027599, 0.003870178, -2.712795, 1, 1, 1, 1, 1,
-0.2991822, -0.3531819, -3.036164, 1, 1, 1, 1, 1,
-0.2980306, -0.02581665, -2.203667, 1, 1, 1, 1, 1,
-0.2935213, -1.561474, -2.325351, 1, 1, 1, 1, 1,
-0.2856701, 1.229592, -0.6184804, 0, 0, 1, 1, 1,
-0.2843985, -1.090532, -4.419265, 1, 0, 0, 1, 1,
-0.277882, -0.3358989, -1.950201, 1, 0, 0, 1, 1,
-0.2749746, -0.3942859, -1.432252, 1, 0, 0, 1, 1,
-0.2737997, 0.3424478, 0.08101477, 1, 0, 0, 1, 1,
-0.2710205, -2.303654, -4.442635, 1, 0, 0, 1, 1,
-0.2708273, 1.003928, 0.7483388, 0, 0, 0, 1, 1,
-0.2652023, 1.673632, 0.4268555, 0, 0, 0, 1, 1,
-0.2577716, 0.3165679, -0.09608735, 0, 0, 0, 1, 1,
-0.2565535, 0.4766223, -1.568232, 0, 0, 0, 1, 1,
-0.255939, -0.4779287, -1.365646, 0, 0, 0, 1, 1,
-0.2553705, 0.7275413, -1.029168, 0, 0, 0, 1, 1,
-0.2512264, -0.03830253, -4.738406, 0, 0, 0, 1, 1,
-0.250192, -1.62863, -3.045799, 1, 1, 1, 1, 1,
-0.2492234, -0.7570174, -3.499524, 1, 1, 1, 1, 1,
-0.2456978, -0.5231485, -4.127856, 1, 1, 1, 1, 1,
-0.244519, 0.8582321, 1.207164, 1, 1, 1, 1, 1,
-0.2420846, 0.622375, 0.3021228, 1, 1, 1, 1, 1,
-0.2336746, -0.4209299, -2.483893, 1, 1, 1, 1, 1,
-0.2284826, -0.9712036, -3.681986, 1, 1, 1, 1, 1,
-0.2234895, 1.505783, 0.08534666, 1, 1, 1, 1, 1,
-0.2197818, 1.361442, -0.1178485, 1, 1, 1, 1, 1,
-0.2182375, 1.129368, -1.641475, 1, 1, 1, 1, 1,
-0.2175576, 0.6358446, -2.541783, 1, 1, 1, 1, 1,
-0.215541, -0.1615877, -2.676737, 1, 1, 1, 1, 1,
-0.2155082, 0.5051849, -1.088915, 1, 1, 1, 1, 1,
-0.2118653, 0.07267971, -1.90088, 1, 1, 1, 1, 1,
-0.2098144, 0.5740775, 1.45232, 1, 1, 1, 1, 1,
-0.2089527, -0.1233104, -3.055618, 0, 0, 1, 1, 1,
-0.2048001, 0.3407323, -0.7560846, 1, 0, 0, 1, 1,
-0.2038617, 0.3414055, 0.7181661, 1, 0, 0, 1, 1,
-0.2035871, -0.8820356, -1.953705, 1, 0, 0, 1, 1,
-0.1999052, 0.3217708, -1.118531, 1, 0, 0, 1, 1,
-0.1952917, 1.893749, -1.281611, 1, 0, 0, 1, 1,
-0.1897519, -1.797183, -2.386321, 0, 0, 0, 1, 1,
-0.18543, 0.2279265, -0.569365, 0, 0, 0, 1, 1,
-0.1787155, -1.690645, -1.643131, 0, 0, 0, 1, 1,
-0.1778008, -0.1006797, -1.209152, 0, 0, 0, 1, 1,
-0.1716602, -1.135916, -4.128603, 0, 0, 0, 1, 1,
-0.1694568, -0.4691396, -2.176544, 0, 0, 0, 1, 1,
-0.1681085, 1.559469, 0.3106538, 0, 0, 0, 1, 1,
-0.1672448, 1.342197, 0.4128475, 1, 1, 1, 1, 1,
-0.1575041, -0.1417236, -2.070957, 1, 1, 1, 1, 1,
-0.1566288, -0.7319195, -2.310891, 1, 1, 1, 1, 1,
-0.1563747, 0.3633866, -0.1824077, 1, 1, 1, 1, 1,
-0.1553899, 0.3671763, 1.683457, 1, 1, 1, 1, 1,
-0.1482511, -0.003663321, 1.391766, 1, 1, 1, 1, 1,
-0.1478493, 0.1136229, -0.8094899, 1, 1, 1, 1, 1,
-0.1454838, 0.8517232, -0.5989491, 1, 1, 1, 1, 1,
-0.1434671, 0.2986897, 0.2904897, 1, 1, 1, 1, 1,
-0.1427456, -0.535263, -2.323569, 1, 1, 1, 1, 1,
-0.1407021, -0.4786865, -3.927705, 1, 1, 1, 1, 1,
-0.13802, -0.2434848, -1.82429, 1, 1, 1, 1, 1,
-0.1379177, -0.003163824, -0.07046515, 1, 1, 1, 1, 1,
-0.136875, -0.510983, -2.026828, 1, 1, 1, 1, 1,
-0.1322715, 1.338466, -1.275226, 1, 1, 1, 1, 1,
-0.130532, -0.8122447, -3.082887, 0, 0, 1, 1, 1,
-0.1284525, -0.4702375, -2.818896, 1, 0, 0, 1, 1,
-0.1244703, 0.1821356, -1.118369, 1, 0, 0, 1, 1,
-0.1200961, 2.29195, -1.161686, 1, 0, 0, 1, 1,
-0.1156528, -1.910404, -1.046646, 1, 0, 0, 1, 1,
-0.11362, 1.175067, -0.5810999, 1, 0, 0, 1, 1,
-0.1123381, -0.4112228, -3.321072, 0, 0, 0, 1, 1,
-0.1120577, -1.394923, -4.073008, 0, 0, 0, 1, 1,
-0.109644, -1.294794, -3.554497, 0, 0, 0, 1, 1,
-0.1052189, -0.7085769, -3.061182, 0, 0, 0, 1, 1,
-0.1032949, -1.162836, -1.647124, 0, 0, 0, 1, 1,
-0.09602972, -2.211097, -2.039844, 0, 0, 0, 1, 1,
-0.09441035, 0.8704156, -0.08791021, 0, 0, 0, 1, 1,
-0.0940226, -0.1691055, -1.284951, 1, 1, 1, 1, 1,
-0.09123624, 1.313072, -0.1426069, 1, 1, 1, 1, 1,
-0.0909415, 0.7137383, -1.45572, 1, 1, 1, 1, 1,
-0.08956163, -1.905141, -1.732369, 1, 1, 1, 1, 1,
-0.08590891, 1.402893, 1.11954, 1, 1, 1, 1, 1,
-0.08060633, -0.8314346, -0.787104, 1, 1, 1, 1, 1,
-0.07739098, 0.2791417, -1.846603, 1, 1, 1, 1, 1,
-0.06753357, -0.2828437, -1.586915, 1, 1, 1, 1, 1,
-0.06628682, 0.507692, -0.3568519, 1, 1, 1, 1, 1,
-0.06328681, 0.4634313, -1.467315, 1, 1, 1, 1, 1,
-0.06080954, -1.053102, -2.812574, 1, 1, 1, 1, 1,
-0.06029219, 0.1240255, -1.295695, 1, 1, 1, 1, 1,
-0.05927536, 1.524226, -0.06893332, 1, 1, 1, 1, 1,
-0.05907055, 1.054592, 1.382812, 1, 1, 1, 1, 1,
-0.05291958, -1.075269, -3.154043, 1, 1, 1, 1, 1,
-0.05158724, 1.73038, -0.138091, 0, 0, 1, 1, 1,
-0.05100787, 0.903879, -0.8656104, 1, 0, 0, 1, 1,
-0.04787025, 1.050202, 2.027958, 1, 0, 0, 1, 1,
-0.04304275, 0.3949672, -1.526047, 1, 0, 0, 1, 1,
-0.03729187, 1.173959, -0.9490488, 1, 0, 0, 1, 1,
-0.03552851, -2.106907, -1.914985, 1, 0, 0, 1, 1,
-0.03443097, 1.540708, 0.08546569, 0, 0, 0, 1, 1,
-0.0343141, 0.7712037, 0.3257162, 0, 0, 0, 1, 1,
-0.02914076, 0.8704285, -0.9590161, 0, 0, 0, 1, 1,
-0.02814049, -0.03766, -2.393589, 0, 0, 0, 1, 1,
-0.02684367, -0.1849387, -3.264609, 0, 0, 0, 1, 1,
-0.02210733, -1.142502, -4.06753, 0, 0, 0, 1, 1,
-0.01966334, 0.6393044, -1.118938, 0, 0, 0, 1, 1,
-0.01731064, 0.5374554, -0.1774452, 1, 1, 1, 1, 1,
-0.008163719, 0.268457, 0.1452308, 1, 1, 1, 1, 1,
-0.004257794, 1.349083, -0.05314776, 1, 1, 1, 1, 1,
-0.003222595, 0.4652948, 0.2056836, 1, 1, 1, 1, 1,
-0.00320736, -1.11758, -3.233523, 1, 1, 1, 1, 1,
-0.001163547, -0.8382807, -4.189671, 1, 1, 1, 1, 1,
-0.00102246, 1.515599, -0.5927438, 1, 1, 1, 1, 1,
0.0007307872, -1.40057, 5.555691, 1, 1, 1, 1, 1,
0.002191878, 0.8053319, 0.221164, 1, 1, 1, 1, 1,
0.003199147, 0.5242998, -0.03144137, 1, 1, 1, 1, 1,
0.003473064, 0.377824, 1.127611, 1, 1, 1, 1, 1,
0.007199299, -0.1126419, 4.164554, 1, 1, 1, 1, 1,
0.01026145, 2.17016, 0.8180918, 1, 1, 1, 1, 1,
0.01040941, 0.999704, -0.6614025, 1, 1, 1, 1, 1,
0.01058019, 0.3634742, 0.1794694, 1, 1, 1, 1, 1,
0.01118396, -0.3526666, 2.428328, 0, 0, 1, 1, 1,
0.01137423, 1.577219, -0.155905, 1, 0, 0, 1, 1,
0.01531102, 0.9913673, 1.445025, 1, 0, 0, 1, 1,
0.0209513, 1.553231, -0.834007, 1, 0, 0, 1, 1,
0.02251135, 0.2479543, 1.117369, 1, 0, 0, 1, 1,
0.02308225, -0.5764637, 3.670807, 1, 0, 0, 1, 1,
0.02703226, -0.324823, 4.258636, 0, 0, 0, 1, 1,
0.03179013, -0.1406924, 3.150995, 0, 0, 0, 1, 1,
0.03290052, 0.149768, 2.098804, 0, 0, 0, 1, 1,
0.0351696, 0.3698393, 0.7253072, 0, 0, 0, 1, 1,
0.0370234, 1.10147, 0.2730485, 0, 0, 0, 1, 1,
0.0407552, 0.9827921, 1.564018, 0, 0, 0, 1, 1,
0.04121935, -0.890423, 1.294756, 0, 0, 0, 1, 1,
0.04384753, -0.9386111, 2.410865, 1, 1, 1, 1, 1,
0.04586314, 0.1834222, 0.06002957, 1, 1, 1, 1, 1,
0.04927524, 0.8453197, 0.3420427, 1, 1, 1, 1, 1,
0.05247077, -0.9877924, 3.687223, 1, 1, 1, 1, 1,
0.05437941, -1.819365, 3.914771, 1, 1, 1, 1, 1,
0.06592251, 2.689394, -1.356845, 1, 1, 1, 1, 1,
0.06601202, -0.9820278, 4.728248, 1, 1, 1, 1, 1,
0.07101824, 0.3053112, 0.7751564, 1, 1, 1, 1, 1,
0.07306788, 0.4566321, 1.562528, 1, 1, 1, 1, 1,
0.07451745, 0.8013219, -0.3735846, 1, 1, 1, 1, 1,
0.074883, -2.513371, 3.142624, 1, 1, 1, 1, 1,
0.07955938, 1.018644, -0.07233083, 1, 1, 1, 1, 1,
0.08014953, 1.063338, 0.6718735, 1, 1, 1, 1, 1,
0.0873908, 0.08383147, 0.1924348, 1, 1, 1, 1, 1,
0.08898494, -0.966059, 3.267257, 1, 1, 1, 1, 1,
0.09026349, -1.821585, 3.456984, 0, 0, 1, 1, 1,
0.09190828, 0.805972, 1.264256, 1, 0, 0, 1, 1,
0.09230645, -0.2458748, 0.6062178, 1, 0, 0, 1, 1,
0.09240643, 1.822778, -0.1063846, 1, 0, 0, 1, 1,
0.1048751, -0.009572963, 1.642283, 1, 0, 0, 1, 1,
0.1054315, -0.006752164, 1.551942, 1, 0, 0, 1, 1,
0.1077104, -1.208359, 2.552178, 0, 0, 0, 1, 1,
0.1077111, -0.1554047, 2.364945, 0, 0, 0, 1, 1,
0.1124449, -0.6742626, 2.241767, 0, 0, 0, 1, 1,
0.1146396, -1.784902, 3.979742, 0, 0, 0, 1, 1,
0.1155276, 0.02568013, 0.6429964, 0, 0, 0, 1, 1,
0.1217201, 0.4075295, -1.713293, 0, 0, 0, 1, 1,
0.1217566, -1.64371, 3.199665, 0, 0, 0, 1, 1,
0.1242981, -0.2944984, 3.182769, 1, 1, 1, 1, 1,
0.1266331, -0.5569959, 1.779912, 1, 1, 1, 1, 1,
0.1269378, -1.378227, 3.218207, 1, 1, 1, 1, 1,
0.1269817, -0.2316846, 1.330817, 1, 1, 1, 1, 1,
0.1276424, 0.3055899, 1.040746, 1, 1, 1, 1, 1,
0.1281021, 0.08639593, -0.2870588, 1, 1, 1, 1, 1,
0.1302491, -0.07591952, 2.385337, 1, 1, 1, 1, 1,
0.1319378, 0.2535023, 1.93368, 1, 1, 1, 1, 1,
0.1364831, 0.5350749, 0.2028804, 1, 1, 1, 1, 1,
0.1389402, -0.1506217, 1.714559, 1, 1, 1, 1, 1,
0.140126, 1.017322, -0.5626787, 1, 1, 1, 1, 1,
0.1405713, -0.4842533, 3.312477, 1, 1, 1, 1, 1,
0.1453899, -1.129862, 4.053308, 1, 1, 1, 1, 1,
0.1503527, 1.13462, -0.6050767, 1, 1, 1, 1, 1,
0.1534756, 1.287193, 2.039675, 1, 1, 1, 1, 1,
0.1555018, 1.312607, -2.454719, 0, 0, 1, 1, 1,
0.1593083, 1.872434, -0.5121923, 1, 0, 0, 1, 1,
0.1690543, 1.323068, 0.2732559, 1, 0, 0, 1, 1,
0.1705109, -0.3132192, 1.437129, 1, 0, 0, 1, 1,
0.1727737, 1.90381, 0.7658227, 1, 0, 0, 1, 1,
0.1728886, 0.5156008, 0.675593, 1, 0, 0, 1, 1,
0.1728988, -0.4849742, 2.92328, 0, 0, 0, 1, 1,
0.1741072, 1.271004, -1.108019, 0, 0, 0, 1, 1,
0.1855712, -0.1719089, 2.963716, 0, 0, 0, 1, 1,
0.1874808, 1.17445, -1.566088, 0, 0, 0, 1, 1,
0.1894818, 0.8559511, 0.4048856, 0, 0, 0, 1, 1,
0.1909173, -0.9113492, 0.9797352, 0, 0, 0, 1, 1,
0.1944474, -0.1592182, 3.121962, 0, 0, 0, 1, 1,
0.1973394, -0.4220869, 1.223591, 1, 1, 1, 1, 1,
0.2006794, -0.08372575, 2.412467, 1, 1, 1, 1, 1,
0.2014111, 1.119897, -1.554572, 1, 1, 1, 1, 1,
0.2014385, 0.08737362, -0.4688122, 1, 1, 1, 1, 1,
0.2028083, 0.2024401, -0.3671413, 1, 1, 1, 1, 1,
0.2043461, 0.3666084, 1.703122, 1, 1, 1, 1, 1,
0.2060788, 1.110036, 1.394667, 1, 1, 1, 1, 1,
0.2111004, -3.312046, 2.485131, 1, 1, 1, 1, 1,
0.2133382, -1.056116, 0.3262731, 1, 1, 1, 1, 1,
0.2161731, -0.1445385, 3.172595, 1, 1, 1, 1, 1,
0.2166384, -1.55162, 4.869236, 1, 1, 1, 1, 1,
0.2190261, -0.1164868, 2.618429, 1, 1, 1, 1, 1,
0.2199433, 1.365865, 0.581352, 1, 1, 1, 1, 1,
0.219992, -0.05805809, 2.722034, 1, 1, 1, 1, 1,
0.2258221, -0.7825314, 3.961345, 1, 1, 1, 1, 1,
0.2407681, 1.608566, -0.4895836, 0, 0, 1, 1, 1,
0.2422882, -1.007813, 1.630154, 1, 0, 0, 1, 1,
0.2426556, -0.4982648, 1.957657, 1, 0, 0, 1, 1,
0.2435649, 1.043023, -0.07553736, 1, 0, 0, 1, 1,
0.2473091, -0.057477, 2.115897, 1, 0, 0, 1, 1,
0.2491946, 0.1565203, 1.955705, 1, 0, 0, 1, 1,
0.2500099, -0.4523998, 2.341337, 0, 0, 0, 1, 1,
0.2509073, 0.722396, -0.9910729, 0, 0, 0, 1, 1,
0.2514383, -0.7758322, 0.8169626, 0, 0, 0, 1, 1,
0.2591991, 0.1228618, -0.03158541, 0, 0, 0, 1, 1,
0.2613535, 1.417487, -2.222799, 0, 0, 0, 1, 1,
0.2669191, -0.4812117, 2.505908, 0, 0, 0, 1, 1,
0.2691763, -1.385932, 2.462216, 0, 0, 0, 1, 1,
0.2708745, 0.3565119, -0.9820647, 1, 1, 1, 1, 1,
0.2751487, -0.4044445, 2.338856, 1, 1, 1, 1, 1,
0.2801085, -0.1646912, 4.513636, 1, 1, 1, 1, 1,
0.2825311, 1.730442, 0.9665486, 1, 1, 1, 1, 1,
0.2883411, 1.572285, 0.5881462, 1, 1, 1, 1, 1,
0.2900645, 0.09411611, 4.639957, 1, 1, 1, 1, 1,
0.2912445, 0.01136466, 2.806031, 1, 1, 1, 1, 1,
0.2935366, -1.181252, 2.056557, 1, 1, 1, 1, 1,
0.2954887, -0.2741436, 3.432093, 1, 1, 1, 1, 1,
0.3007339, 0.5783386, 0.7297065, 1, 1, 1, 1, 1,
0.3053103, 0.3543536, 2.541017, 1, 1, 1, 1, 1,
0.3116758, 0.3271212, 1.066914, 1, 1, 1, 1, 1,
0.3120689, 0.7087284, 1.502772, 1, 1, 1, 1, 1,
0.3122094, -0.9461821, 2.369729, 1, 1, 1, 1, 1,
0.3124939, -1.861706, 3.644862, 1, 1, 1, 1, 1,
0.3134287, -0.2689574, 2.464787, 0, 0, 1, 1, 1,
0.3172015, 0.2029269, 0.7431826, 1, 0, 0, 1, 1,
0.3172162, -2.11772, 3.939351, 1, 0, 0, 1, 1,
0.3177715, -2.211705, 1.348734, 1, 0, 0, 1, 1,
0.3181147, 0.4825716, -0.4665031, 1, 0, 0, 1, 1,
0.3182408, -0.3395697, 0.9725381, 1, 0, 0, 1, 1,
0.3199275, 2.471277, 0.08798023, 0, 0, 0, 1, 1,
0.3210352, -0.8092369, 4.407749, 0, 0, 0, 1, 1,
0.3227853, 0.0546808, 0.3664267, 0, 0, 0, 1, 1,
0.3240885, -1.064177, 3.553731, 0, 0, 0, 1, 1,
0.3327852, -2.042197, 2.834487, 0, 0, 0, 1, 1,
0.333689, 1.432019, 1.297346, 0, 0, 0, 1, 1,
0.3374225, 0.6102337, 0.3011051, 0, 0, 0, 1, 1,
0.3382879, -1.357344, 2.740116, 1, 1, 1, 1, 1,
0.3441827, 0.4698876, 1.509304, 1, 1, 1, 1, 1,
0.3450904, 1.520332, 0.3201615, 1, 1, 1, 1, 1,
0.3464833, -0.7741868, 2.009127, 1, 1, 1, 1, 1,
0.3468283, -0.1512722, 2.053336, 1, 1, 1, 1, 1,
0.3486908, -1.167652, 3.670567, 1, 1, 1, 1, 1,
0.3507656, -1.175174, 3.248267, 1, 1, 1, 1, 1,
0.3523508, -0.40165, 2.624643, 1, 1, 1, 1, 1,
0.3524901, -1.529833, 2.393951, 1, 1, 1, 1, 1,
0.3611524, -0.1813588, 1.026848, 1, 1, 1, 1, 1,
0.3638698, -0.4762487, 4.177338, 1, 1, 1, 1, 1,
0.3643557, -0.07388779, 3.262477, 1, 1, 1, 1, 1,
0.3667943, -0.609415, 3.708564, 1, 1, 1, 1, 1,
0.3668375, 0.7235059, 0.9709432, 1, 1, 1, 1, 1,
0.3715369, 1.389026, 1.988306, 1, 1, 1, 1, 1,
0.3739111, 0.2620673, -0.1423161, 0, 0, 1, 1, 1,
0.3745722, -2.188448, 2.638118, 1, 0, 0, 1, 1,
0.3745728, 0.2204919, -0.1329776, 1, 0, 0, 1, 1,
0.3753883, -0.3227795, 1.627412, 1, 0, 0, 1, 1,
0.3754254, 0.7647255, 0.7239494, 1, 0, 0, 1, 1,
0.3766034, 1.130383, 0.5268357, 1, 0, 0, 1, 1,
0.3808236, -1.280687, 1.57991, 0, 0, 0, 1, 1,
0.3808871, -0.3794549, 3.12929, 0, 0, 0, 1, 1,
0.3814061, 0.8630614, 1.459779, 0, 0, 0, 1, 1,
0.3819072, 0.8169044, 2.213469, 0, 0, 0, 1, 1,
0.3823649, -1.674989, 3.885556, 0, 0, 0, 1, 1,
0.3847867, 0.9401102, -0.8112876, 0, 0, 0, 1, 1,
0.3870011, -1.351817, 1.799383, 0, 0, 0, 1, 1,
0.3870719, 0.2992417, 1.42512, 1, 1, 1, 1, 1,
0.3883848, -0.2835866, 1.573175, 1, 1, 1, 1, 1,
0.389153, 0.2077908, 3.246859, 1, 1, 1, 1, 1,
0.3895434, -0.005366602, 1.783649, 1, 1, 1, 1, 1,
0.396925, 1.150382, 2.054082, 1, 1, 1, 1, 1,
0.3972159, -0.3786106, 0.4970424, 1, 1, 1, 1, 1,
0.4024196, 2.552429, 0.235954, 1, 1, 1, 1, 1,
0.407304, -1.38429, 4.012757, 1, 1, 1, 1, 1,
0.4091022, -2.198943, 3.752943, 1, 1, 1, 1, 1,
0.4112982, -0.5122324, 3.290729, 1, 1, 1, 1, 1,
0.4124476, -0.01232862, 1.34475, 1, 1, 1, 1, 1,
0.4129559, 0.2252734, 0.9932379, 1, 1, 1, 1, 1,
0.4148504, -0.09142215, 1.373168, 1, 1, 1, 1, 1,
0.4300727, 0.4383031, 0.8504728, 1, 1, 1, 1, 1,
0.4309604, 0.1154683, 0.3610861, 1, 1, 1, 1, 1,
0.4387985, 0.5609217, 0.4750619, 0, 0, 1, 1, 1,
0.4390201, -0.04642247, 1.970765, 1, 0, 0, 1, 1,
0.4431273, 0.2914796, 0.5450727, 1, 0, 0, 1, 1,
0.4507304, 1.29484, 1.165694, 1, 0, 0, 1, 1,
0.4523307, 0.9942372, -0.7859964, 1, 0, 0, 1, 1,
0.4532473, 0.7206512, -0.03110164, 1, 0, 0, 1, 1,
0.4536798, -0.6460469, 1.989424, 0, 0, 0, 1, 1,
0.4538501, 0.9118972, 0.3127221, 0, 0, 0, 1, 1,
0.4557526, 0.8265623, 1.261348, 0, 0, 0, 1, 1,
0.4584471, -2.252504, 2.515406, 0, 0, 0, 1, 1,
0.4671644, -1.941097, 4.75076, 0, 0, 0, 1, 1,
0.4675952, 0.3036822, 0.5850672, 0, 0, 0, 1, 1,
0.4678401, 0.1339422, -0.2867629, 0, 0, 0, 1, 1,
0.4688394, -0.4710802, 2.953544, 1, 1, 1, 1, 1,
0.4799123, 0.268899, 1.494976, 1, 1, 1, 1, 1,
0.4805798, 0.2787422, 0.5529295, 1, 1, 1, 1, 1,
0.4827817, -1.470103, 4.593718, 1, 1, 1, 1, 1,
0.4849736, -0.9006922, 1.899991, 1, 1, 1, 1, 1,
0.4882075, -0.001391965, 1.913732, 1, 1, 1, 1, 1,
0.4895732, 0.07602911, 1.281222, 1, 1, 1, 1, 1,
0.4903383, 0.47264, 1.993373, 1, 1, 1, 1, 1,
0.4914586, -1.659841, 3.339356, 1, 1, 1, 1, 1,
0.4915848, -0.4716862, 2.409755, 1, 1, 1, 1, 1,
0.4917728, 0.7212209, -0.5648438, 1, 1, 1, 1, 1,
0.4921494, -0.6846303, 4.321244, 1, 1, 1, 1, 1,
0.4925944, -1.278635, 3.818397, 1, 1, 1, 1, 1,
0.4937724, 2.297298, 0.3079046, 1, 1, 1, 1, 1,
0.5005003, -0.6182515, 2.148985, 1, 1, 1, 1, 1,
0.5111905, -1.368301, 2.490929, 0, 0, 1, 1, 1,
0.5117386, 1.949777, 0.658645, 1, 0, 0, 1, 1,
0.5170894, 0.446962, 1.681329, 1, 0, 0, 1, 1,
0.5233032, -1.29575, 2.452856, 1, 0, 0, 1, 1,
0.5319188, 0.6040489, -0.4850965, 1, 0, 0, 1, 1,
0.5359483, 1.293166, -1.257945, 1, 0, 0, 1, 1,
0.5389962, -1.69084, 1.710688, 0, 0, 0, 1, 1,
0.5392108, 0.7251371, -0.3822748, 0, 0, 0, 1, 1,
0.5429068, -0.4834447, 1.430636, 0, 0, 0, 1, 1,
0.5465971, -1.850713, 1.465952, 0, 0, 0, 1, 1,
0.5469171, 0.2208115, 0.5908493, 0, 0, 0, 1, 1,
0.5543978, 0.9250071, 0.2021425, 0, 0, 0, 1, 1,
0.5545024, 1.654525, -0.1546227, 0, 0, 0, 1, 1,
0.5571532, 0.115849, 2.746454, 1, 1, 1, 1, 1,
0.5629893, 0.2605896, 1.455628, 1, 1, 1, 1, 1,
0.5634896, -0.3001131, 2.745283, 1, 1, 1, 1, 1,
0.5647657, 0.964286, 0.9034076, 1, 1, 1, 1, 1,
0.5658186, -1.141365, 1.64853, 1, 1, 1, 1, 1,
0.5662055, -0.03225703, 3.40424, 1, 1, 1, 1, 1,
0.5691646, 1.190111, -0.5020582, 1, 1, 1, 1, 1,
0.5692741, 0.1687205, 0.7038811, 1, 1, 1, 1, 1,
0.5702205, -0.7771303, 2.29109, 1, 1, 1, 1, 1,
0.5716289, -1.251522, 4.215268, 1, 1, 1, 1, 1,
0.5845933, -0.4272693, 3.336906, 1, 1, 1, 1, 1,
0.5850482, 0.2388708, 2.651023, 1, 1, 1, 1, 1,
0.5917829, 0.8551614, 0.8280425, 1, 1, 1, 1, 1,
0.5937859, -0.6082577, 3.034899, 1, 1, 1, 1, 1,
0.5956159, -0.6258627, 2.314202, 1, 1, 1, 1, 1,
0.6010752, -1.87986, 1.327335, 0, 0, 1, 1, 1,
0.6028348, -0.1178186, 1.391848, 1, 0, 0, 1, 1,
0.6065514, -0.1985617, 2.24422, 1, 0, 0, 1, 1,
0.6126314, 1.574694, -0.5825395, 1, 0, 0, 1, 1,
0.6126897, -0.5869454, 2.150476, 1, 0, 0, 1, 1,
0.6176105, 1.214422, 2.37141, 1, 0, 0, 1, 1,
0.617855, 2.021839, 0.118736, 0, 0, 0, 1, 1,
0.6271325, -0.8420199, 1.042977, 0, 0, 0, 1, 1,
0.6276729, -0.1303774, 2.311461, 0, 0, 0, 1, 1,
0.6331914, 0.4313921, 2.242878, 0, 0, 0, 1, 1,
0.634729, -0.692498, 3.210865, 0, 0, 0, 1, 1,
0.6407635, -0.36076, 1.224494, 0, 0, 0, 1, 1,
0.6413718, -0.3319991, 3.660532, 0, 0, 0, 1, 1,
0.6446741, -0.04583142, 2.929295, 1, 1, 1, 1, 1,
0.6546838, 1.727982, 1.686201, 1, 1, 1, 1, 1,
0.6571445, 0.4341978, 2.327715, 1, 1, 1, 1, 1,
0.6601815, -0.7996143, 2.703631, 1, 1, 1, 1, 1,
0.6668268, 0.2933103, 0.9967843, 1, 1, 1, 1, 1,
0.6679496, 0.1265951, 0.2887796, 1, 1, 1, 1, 1,
0.6711159, 0.08062518, 1.995598, 1, 1, 1, 1, 1,
0.6747293, 1.72345, -0.8885774, 1, 1, 1, 1, 1,
0.6761252, 0.009323728, 2.824329, 1, 1, 1, 1, 1,
0.6764775, -0.6648422, 2.97052, 1, 1, 1, 1, 1,
0.6908717, 0.09490511, 1.497727, 1, 1, 1, 1, 1,
0.6909553, -0.6412242, 1.90553, 1, 1, 1, 1, 1,
0.6936144, 1.138996, 1.225132, 1, 1, 1, 1, 1,
0.6986846, 0.3408757, -0.8742993, 1, 1, 1, 1, 1,
0.7005659, -1.95292, 3.04615, 1, 1, 1, 1, 1,
0.7063475, -0.5089086, 1.990404, 0, 0, 1, 1, 1,
0.7076052, -0.2683237, 2.356473, 1, 0, 0, 1, 1,
0.7091872, 0.878106, 0.5451598, 1, 0, 0, 1, 1,
0.7095083, 0.2486043, 3.64289, 1, 0, 0, 1, 1,
0.7138854, -1.956432, 2.993058, 1, 0, 0, 1, 1,
0.7174641, -0.3090655, 1.567587, 1, 0, 0, 1, 1,
0.7451262, -0.8751575, 2.322071, 0, 0, 0, 1, 1,
0.7514598, -0.9217955, 3.520594, 0, 0, 0, 1, 1,
0.7566614, -0.3119182, 2.681033, 0, 0, 0, 1, 1,
0.7592887, -0.4021273, 3.469464, 0, 0, 0, 1, 1,
0.7602962, 1.113859, -0.440159, 0, 0, 0, 1, 1,
0.7609007, -1.582989, 2.807482, 0, 0, 0, 1, 1,
0.7612928, -0.1517933, 1.873544, 0, 0, 0, 1, 1,
0.7647703, -1.560739, 3.136352, 1, 1, 1, 1, 1,
0.7647862, 1.130201, -0.714802, 1, 1, 1, 1, 1,
0.7723768, -0.6681644, 3.861701, 1, 1, 1, 1, 1,
0.7777502, -0.09211998, 1.767289, 1, 1, 1, 1, 1,
0.7777656, -0.2996278, 2.014388, 1, 1, 1, 1, 1,
0.7794864, 1.088609, 2.11573, 1, 1, 1, 1, 1,
0.7828768, 0.9508778, -1.001501, 1, 1, 1, 1, 1,
0.7835043, -0.1735166, 3.266328, 1, 1, 1, 1, 1,
0.7851122, -1.353541, 3.395161, 1, 1, 1, 1, 1,
0.7911911, -0.9661228, 3.716716, 1, 1, 1, 1, 1,
0.7962148, -0.2192533, -0.1538432, 1, 1, 1, 1, 1,
0.8044683, -1.061966, 0.01858199, 1, 1, 1, 1, 1,
0.8056999, 0.1533858, 1.608913, 1, 1, 1, 1, 1,
0.8085087, 0.2369464, 0.220069, 1, 1, 1, 1, 1,
0.8106506, -0.7177801, 2.806582, 1, 1, 1, 1, 1,
0.8123332, 0.5433205, 1.587838, 0, 0, 1, 1, 1,
0.8157986, 1.526429, 0.1064168, 1, 0, 0, 1, 1,
0.8161978, -1.629371, 2.142249, 1, 0, 0, 1, 1,
0.8209184, -0.5621667, 1.899206, 1, 0, 0, 1, 1,
0.8233209, -2.337747, 2.88029, 1, 0, 0, 1, 1,
0.8244905, 0.7830015, -0.7241845, 1, 0, 0, 1, 1,
0.8246936, -1.058173, 2.925786, 0, 0, 0, 1, 1,
0.8277606, -0.7712609, 3.025962, 0, 0, 0, 1, 1,
0.8318066, -0.643478, 3.068368, 0, 0, 0, 1, 1,
0.8327161, 1.81152, -0.1444589, 0, 0, 0, 1, 1,
0.8355084, -0.7531798, 2.140852, 0, 0, 0, 1, 1,
0.8435981, -0.04849688, 1.271936, 0, 0, 0, 1, 1,
0.8469892, -0.4611, 1.15806, 0, 0, 0, 1, 1,
0.8485062, 0.6989285, 1.60553, 1, 1, 1, 1, 1,
0.8554395, -0.1386286, 2.5674, 1, 1, 1, 1, 1,
0.855895, -1.773711, 2.709738, 1, 1, 1, 1, 1,
0.8610267, 1.09269, 0.3432124, 1, 1, 1, 1, 1,
0.8667284, -0.6844554, 1.483407, 1, 1, 1, 1, 1,
0.869657, -0.07548082, 0.7982274, 1, 1, 1, 1, 1,
0.8697829, 0.8823209, 1.242318, 1, 1, 1, 1, 1,
0.8703275, 1.646398, 1.249409, 1, 1, 1, 1, 1,
0.8708186, 1.116803, 1.332833, 1, 1, 1, 1, 1,
0.8817313, 1.113694, 0.7360638, 1, 1, 1, 1, 1,
0.8839883, -1.451572, 2.321887, 1, 1, 1, 1, 1,
0.8900486, 1.582043, -1.363645, 1, 1, 1, 1, 1,
0.9003156, 0.6617731, 0.3122175, 1, 1, 1, 1, 1,
0.9016055, 1.003188, 1.677436, 1, 1, 1, 1, 1,
0.9148731, -1.914944, 2.445304, 1, 1, 1, 1, 1,
0.9180114, 0.8178113, 0.6082072, 0, 0, 1, 1, 1,
0.9212231, 0.4173618, -0.3391764, 1, 0, 0, 1, 1,
0.9265526, -1.202398, 0.3693903, 1, 0, 0, 1, 1,
0.9282381, -0.48477, 3.38366, 1, 0, 0, 1, 1,
0.9312948, 1.074987, 0.1210899, 1, 0, 0, 1, 1,
0.9336031, -0.1205294, 2.146172, 1, 0, 0, 1, 1,
0.935379, -0.2954305, 1.52505, 0, 0, 0, 1, 1,
0.9420303, 1.433811, 0.9342871, 0, 0, 0, 1, 1,
0.9421388, -1.13337, 1.975187, 0, 0, 0, 1, 1,
0.9450299, 0.8596064, 2.463776, 0, 0, 0, 1, 1,
0.9468222, -1.210369, 1.549352, 0, 0, 0, 1, 1,
0.958971, 0.6298512, 2.295275, 0, 0, 0, 1, 1,
0.9592357, 0.04357591, 0.6282927, 0, 0, 0, 1, 1,
0.9619235, -0.2931703, 0.8633978, 1, 1, 1, 1, 1,
0.9711281, 1.158097, 0.4224092, 1, 1, 1, 1, 1,
0.9757341, 0.01339199, 0.7896155, 1, 1, 1, 1, 1,
0.9761366, -0.3540523, 2.366904, 1, 1, 1, 1, 1,
0.9790117, 1.592001, 1.015089, 1, 1, 1, 1, 1,
0.9794852, -1.503901, 0.9049164, 1, 1, 1, 1, 1,
0.980749, -0.09651772, 0.8486874, 1, 1, 1, 1, 1,
0.9849963, 1.158426, 0.8160067, 1, 1, 1, 1, 1,
0.9861419, 0.305413, 0.899123, 1, 1, 1, 1, 1,
0.99143, 2.065808, 1.725265, 1, 1, 1, 1, 1,
0.9930698, -1.371786, 1.942937, 1, 1, 1, 1, 1,
0.99433, -1.246667, 3.122802, 1, 1, 1, 1, 1,
0.9953296, 0.575465, 0.6514776, 1, 1, 1, 1, 1,
0.9960924, -1.571795, 2.422973, 1, 1, 1, 1, 1,
1.007332, 1.278572, 1.202512, 1, 1, 1, 1, 1,
1.009819, 0.1605012, 1.316034, 0, 0, 1, 1, 1,
1.011288, -1.239851, 1.536995, 1, 0, 0, 1, 1,
1.017626, -0.883177, 3.690587, 1, 0, 0, 1, 1,
1.020291, -0.2708112, 1.83898, 1, 0, 0, 1, 1,
1.022358, -0.9155056, 1.524612, 1, 0, 0, 1, 1,
1.027658, -0.6244475, 0.191909, 1, 0, 0, 1, 1,
1.037848, 0.5958762, 0.3155416, 0, 0, 0, 1, 1,
1.039313, -0.5391853, 2.012191, 0, 0, 0, 1, 1,
1.040705, -0.6323969, 2.79348, 0, 0, 0, 1, 1,
1.048581, -0.08008886, 3.142398, 0, 0, 0, 1, 1,
1.049067, 0.431085, 0.9453561, 0, 0, 0, 1, 1,
1.054203, -0.2655303, 3.436801, 0, 0, 0, 1, 1,
1.056813, -1.819128, 5.984228, 0, 0, 0, 1, 1,
1.058703, 0.646264, -0.481029, 1, 1, 1, 1, 1,
1.06662, -0.05797697, 0.1071774, 1, 1, 1, 1, 1,
1.069856, 1.511846, 1.543222, 1, 1, 1, 1, 1,
1.074634, 1.13944, -0.2464148, 1, 1, 1, 1, 1,
1.082264, 0.6723044, 4.399577, 1, 1, 1, 1, 1,
1.088574, -0.5120558, 0.6371408, 1, 1, 1, 1, 1,
1.092284, 0.5215592, 0.6382968, 1, 1, 1, 1, 1,
1.104235, -1.188987, 0.5020978, 1, 1, 1, 1, 1,
1.106234, 0.08620365, 0.2549428, 1, 1, 1, 1, 1,
1.108099, -0.1265831, 1.461263, 1, 1, 1, 1, 1,
1.108702, -0.290807, 1.997315, 1, 1, 1, 1, 1,
1.11453, -0.08505048, 1.047108, 1, 1, 1, 1, 1,
1.125462, -2.319953, 4.880672, 1, 1, 1, 1, 1,
1.133693, 1.226033, -0.4366651, 1, 1, 1, 1, 1,
1.138201, -0.7146554, 1.07939, 1, 1, 1, 1, 1,
1.143239, -2.023291, 2.641739, 0, 0, 1, 1, 1,
1.145527, 0.1604742, 1.036578, 1, 0, 0, 1, 1,
1.162704, -0.1020401, 1.98059, 1, 0, 0, 1, 1,
1.163203, 0.01979519, 2.771059, 1, 0, 0, 1, 1,
1.166076, 0.9370692, 0.6586649, 1, 0, 0, 1, 1,
1.16625, 0.7762635, 0.2852558, 1, 0, 0, 1, 1,
1.172259, -0.2237358, 2.083366, 0, 0, 0, 1, 1,
1.174935, 1.722497, 0.4848634, 0, 0, 0, 1, 1,
1.176247, 0.8808656, -0.2994701, 0, 0, 0, 1, 1,
1.18166, -0.6300111, 1.350756, 0, 0, 0, 1, 1,
1.187519, 0.1457769, 3.333338, 0, 0, 0, 1, 1,
1.189951, 0.7366919, 2.068376, 0, 0, 0, 1, 1,
1.192124, 0.4110475, 1.452085, 0, 0, 0, 1, 1,
1.197277, 1.51267, 1.991549, 1, 1, 1, 1, 1,
1.200048, 0.02453729, 0.04407226, 1, 1, 1, 1, 1,
1.218008, -0.1892175, 1.204975, 1, 1, 1, 1, 1,
1.223774, 1.23371, 1.972076, 1, 1, 1, 1, 1,
1.224625, 1.500778, 2.853116, 1, 1, 1, 1, 1,
1.236919, -0.8297861, 0.5701598, 1, 1, 1, 1, 1,
1.238658, -0.9390442, 3.644728, 1, 1, 1, 1, 1,
1.254107, -0.6687595, -0.02247396, 1, 1, 1, 1, 1,
1.255126, 1.304094, 0.2427349, 1, 1, 1, 1, 1,
1.257224, -0.6669891, 1.534371, 1, 1, 1, 1, 1,
1.261734, 0.5900196, -0.2077524, 1, 1, 1, 1, 1,
1.267759, -0.827992, 2.70419, 1, 1, 1, 1, 1,
1.267876, 0.3869611, 2.777856, 1, 1, 1, 1, 1,
1.269169, 1.25845, -0.926932, 1, 1, 1, 1, 1,
1.269237, -0.5784636, 2.692407, 1, 1, 1, 1, 1,
1.274709, -0.8024473, 1.682309, 0, 0, 1, 1, 1,
1.277812, 1.033974, 1.406638, 1, 0, 0, 1, 1,
1.278048, -1.204171, 3.549388, 1, 0, 0, 1, 1,
1.281661, -0.8916805, 2.46146, 1, 0, 0, 1, 1,
1.297942, -0.1877396, 1.758013, 1, 0, 0, 1, 1,
1.3058, -0.2631907, 2.762906, 1, 0, 0, 1, 1,
1.307851, 0.7106358, 2.989806, 0, 0, 0, 1, 1,
1.330651, 0.126779, 1.037658, 0, 0, 0, 1, 1,
1.332894, -0.6323229, 1.001062, 0, 0, 0, 1, 1,
1.336264, 0.002411088, 2.680057, 0, 0, 0, 1, 1,
1.340447, 0.295309, 1.795425, 0, 0, 0, 1, 1,
1.34278, 0.1500559, 0.02485878, 0, 0, 0, 1, 1,
1.347171, -0.5983325, -0.7986075, 0, 0, 0, 1, 1,
1.350428, 0.1665482, 2.449242, 1, 1, 1, 1, 1,
1.356015, -0.5700125, 1.30408, 1, 1, 1, 1, 1,
1.364729, 0.05263022, 1.749074, 1, 1, 1, 1, 1,
1.365497, -1.772818, 2.145147, 1, 1, 1, 1, 1,
1.385766, -1.155589, 1.914106, 1, 1, 1, 1, 1,
1.391216, 1.329508, 2.272152, 1, 1, 1, 1, 1,
1.393675, -0.7797272, 1.262043, 1, 1, 1, 1, 1,
1.395719, -0.487906, 2.217623, 1, 1, 1, 1, 1,
1.396821, -1.720772, 1.799603, 1, 1, 1, 1, 1,
1.40169, -0.2238903, 2.459439, 1, 1, 1, 1, 1,
1.422546, -0.1056731, 1.581488, 1, 1, 1, 1, 1,
1.431137, -0.3417988, 0.9626058, 1, 1, 1, 1, 1,
1.450585, -0.220196, 1.897356, 1, 1, 1, 1, 1,
1.454842, -1.341936, 3.494468, 1, 1, 1, 1, 1,
1.458073, -1.142035, 3.070051, 1, 1, 1, 1, 1,
1.461786, -0.723045, 3.143509, 0, 0, 1, 1, 1,
1.464656, -0.9940671, 2.499216, 1, 0, 0, 1, 1,
1.470048, 1.101917, -0.1843499, 1, 0, 0, 1, 1,
1.484044, 1.148659, 2.537958, 1, 0, 0, 1, 1,
1.489503, 0.6090381, 0.7572249, 1, 0, 0, 1, 1,
1.52541, -0.2212734, 0.958872, 1, 0, 0, 1, 1,
1.52668, -0.4252969, 2.101972, 0, 0, 0, 1, 1,
1.536677, 1.20424, -0.3996271, 0, 0, 0, 1, 1,
1.562328, -0.3033345, 3.930216, 0, 0, 0, 1, 1,
1.569505, 0.4332685, 0.4173887, 0, 0, 0, 1, 1,
1.589673, 0.2587411, -0.7593853, 0, 0, 0, 1, 1,
1.593665, -0.2116602, 2.897707, 0, 0, 0, 1, 1,
1.606181, -0.2518491, 2.730297, 0, 0, 0, 1, 1,
1.614722, 2.024029, 0.6045434, 1, 1, 1, 1, 1,
1.618087, -0.703303, 2.374223, 1, 1, 1, 1, 1,
1.629041, -0.8171473, 2.45733, 1, 1, 1, 1, 1,
1.629597, -0.3606429, 1.325164, 1, 1, 1, 1, 1,
1.63174, 1.766387, -0.5249805, 1, 1, 1, 1, 1,
1.652721, 1.22087, -1.527289, 1, 1, 1, 1, 1,
1.653149, -0.8571382, 1.333414, 1, 1, 1, 1, 1,
1.654131, 3.102813, 0.5650449, 1, 1, 1, 1, 1,
1.654616, -0.4777166, 2.245906, 1, 1, 1, 1, 1,
1.662637, -0.7294107, 2.597003, 1, 1, 1, 1, 1,
1.671957, -2.788274, 3.27385, 1, 1, 1, 1, 1,
1.672249, -0.3569465, 0.8030801, 1, 1, 1, 1, 1,
1.67898, 0.8897735, 0.7182745, 1, 1, 1, 1, 1,
1.68907, -0.4434178, 1.896609, 1, 1, 1, 1, 1,
1.691843, 0.07637242, 1.665825, 1, 1, 1, 1, 1,
1.694332, -0.05411757, 1.68549, 0, 0, 1, 1, 1,
1.703772, 1.191275, 0.6915922, 1, 0, 0, 1, 1,
1.70586, -1.038822, 2.437372, 1, 0, 0, 1, 1,
1.708881, 0.5292171, 3.319892, 1, 0, 0, 1, 1,
1.729082, -0.7081987, 3.016976, 1, 0, 0, 1, 1,
1.746613, -0.1964403, 0.4924982, 1, 0, 0, 1, 1,
1.748846, -0.1392092, 3.073428, 0, 0, 0, 1, 1,
1.751741, -0.3267226, 1.248865, 0, 0, 0, 1, 1,
1.761346, -0.2722621, 3.307499, 0, 0, 0, 1, 1,
1.776868, 0.9155458, 1.536212, 0, 0, 0, 1, 1,
1.783537, 0.7937827, -0.001569644, 0, 0, 0, 1, 1,
1.80169, 0.09631708, 1.152332, 0, 0, 0, 1, 1,
1.803029, 0.72522, 1.465625, 0, 0, 0, 1, 1,
1.810387, -2.072903, 2.007829, 1, 1, 1, 1, 1,
1.820605, 1.296869, 0.3765128, 1, 1, 1, 1, 1,
1.821174, -0.3972267, 0.2382823, 1, 1, 1, 1, 1,
1.843454, 0.396384, 2.083867, 1, 1, 1, 1, 1,
1.848041, -1.942651, 4.422337, 1, 1, 1, 1, 1,
1.856111, -0.3111271, 2.619291, 1, 1, 1, 1, 1,
1.888702, 0.1825356, 0.7606689, 1, 1, 1, 1, 1,
1.915558, -0.6605228, 3.026624, 1, 1, 1, 1, 1,
1.916448, -0.4184089, 3.144979, 1, 1, 1, 1, 1,
1.920659, 0.3476688, 1.195908, 1, 1, 1, 1, 1,
1.943181, -0.9503123, 2.576966, 1, 1, 1, 1, 1,
1.943508, -0.6072577, 2.125426, 1, 1, 1, 1, 1,
1.956433, 0.476209, 0.1222972, 1, 1, 1, 1, 1,
1.987552, 0.9148071, 0.6707472, 1, 1, 1, 1, 1,
2.002908, -1.960828, 2.518568, 1, 1, 1, 1, 1,
2.023436, -0.909076, 1.315719, 0, 0, 1, 1, 1,
2.038907, -1.377149, 2.949538, 1, 0, 0, 1, 1,
2.067146, -1.076913, 0.5477355, 1, 0, 0, 1, 1,
2.175148, -0.05130243, 0.829905, 1, 0, 0, 1, 1,
2.181369, 0.3866534, 1.343395, 1, 0, 0, 1, 1,
2.199903, 0.390657, 2.848972, 1, 0, 0, 1, 1,
2.206059, 0.8607025, 1.253606, 0, 0, 0, 1, 1,
2.288762, 1.419661, 1.676762, 0, 0, 0, 1, 1,
2.322468, 1.855754, 1.418464, 0, 0, 0, 1, 1,
2.338669, 0.05649465, 3.32875, 0, 0, 0, 1, 1,
2.354896, 2.634572, 1.022846, 0, 0, 0, 1, 1,
2.403976, 1.163821, 1.078326, 0, 0, 0, 1, 1,
2.424153, -0.2405828, 0.3656677, 0, 0, 0, 1, 1,
2.441227, -1.446134, 0.8678893, 1, 1, 1, 1, 1,
2.460095, -0.3560182, 2.025116, 1, 1, 1, 1, 1,
2.528344, 1.966748, 0.7446878, 1, 1, 1, 1, 1,
2.727356, 0.9139219, 1.958658, 1, 1, 1, 1, 1,
3.110335, -1.812864, 2.955364, 1, 1, 1, 1, 1,
3.51526, 0.4219093, 1.716736, 1, 1, 1, 1, 1,
3.52599, 1.49129, 1.314696, 1, 1, 1, 1, 1
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
var radius = 10.06651;
var distance = 35.3582;
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
mvMatrix.translate( 0.1836088, 0.1046166, -0.3611703 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.3582);
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
