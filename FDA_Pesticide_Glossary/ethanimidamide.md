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
-2.853557, -0.5833464, -2.803847, 1, 0, 0, 1,
-2.835217, -0.04945817, -1.735577, 1, 0.007843138, 0, 1,
-2.756135, 0.104592, -1.547807, 1, 0.01176471, 0, 1,
-2.644516, -0.4893136, -2.670731, 1, 0.01960784, 0, 1,
-2.621519, 0.2500384, -2.159336, 1, 0.02352941, 0, 1,
-2.366983, -0.7116003, -0.5442758, 1, 0.03137255, 0, 1,
-2.286191, 0.4808607, -1.193704, 1, 0.03529412, 0, 1,
-2.237618, -0.2394372, -1.354756, 1, 0.04313726, 0, 1,
-2.23725, -0.4113368, -1.244398, 1, 0.04705882, 0, 1,
-2.220194, -0.7100624, -2.351988, 1, 0.05490196, 0, 1,
-2.212137, 0.870466, -0.3978407, 1, 0.05882353, 0, 1,
-2.156629, 1.784662, 0.8822572, 1, 0.06666667, 0, 1,
-2.137279, 0.3832448, -2.076247, 1, 0.07058824, 0, 1,
-2.12892, -0.717001, -2.299893, 1, 0.07843138, 0, 1,
-2.09134, -0.8057392, -1.206871, 1, 0.08235294, 0, 1,
-2.044285, -0.6568077, -1.75798, 1, 0.09019608, 0, 1,
-2.02792, -1.219082, -0.9681453, 1, 0.09411765, 0, 1,
-2.011539, -0.1480643, -1.973556, 1, 0.1019608, 0, 1,
-1.992385, 1.109744, -2.873145, 1, 0.1098039, 0, 1,
-1.956903, -1.91273, -1.258539, 1, 0.1137255, 0, 1,
-1.952296, 0.8299246, -2.343781, 1, 0.1215686, 0, 1,
-1.914747, -0.8034303, -3.002066, 1, 0.1254902, 0, 1,
-1.900017, 0.2019922, -1.16012, 1, 0.1333333, 0, 1,
-1.868168, 1.067022, -0.3341133, 1, 0.1372549, 0, 1,
-1.861224, 0.5429217, 0.2638565, 1, 0.145098, 0, 1,
-1.85106, 0.005068373, -2.437079, 1, 0.1490196, 0, 1,
-1.837135, -0.6988637, -0.4144689, 1, 0.1568628, 0, 1,
-1.801855, -1.683843, -2.60453, 1, 0.1607843, 0, 1,
-1.792466, -1.060306, -1.254412, 1, 0.1686275, 0, 1,
-1.78219, 1.45841, -1.271566, 1, 0.172549, 0, 1,
-1.77723, 0.1698555, -3.185461, 1, 0.1803922, 0, 1,
-1.769861, 1.882117, 0.9342158, 1, 0.1843137, 0, 1,
-1.767299, 1.057518, -0.1642612, 1, 0.1921569, 0, 1,
-1.747765, -1.327088, -1.565484, 1, 0.1960784, 0, 1,
-1.740559, -0.7640083, -3.082155, 1, 0.2039216, 0, 1,
-1.725779, -0.9520583, -2.84802, 1, 0.2117647, 0, 1,
-1.689541, -1.438397, -2.603551, 1, 0.2156863, 0, 1,
-1.687127, -1.669211, -3.511964, 1, 0.2235294, 0, 1,
-1.683318, 0.4944361, -1.399151, 1, 0.227451, 0, 1,
-1.681543, 0.2121831, -0.952427, 1, 0.2352941, 0, 1,
-1.676292, 1.020717, -1.747312, 1, 0.2392157, 0, 1,
-1.67267, -0.4072672, -1.169519, 1, 0.2470588, 0, 1,
-1.663509, -0.1701188, -3.321317, 1, 0.2509804, 0, 1,
-1.66007, -0.5828934, -0.6989082, 1, 0.2588235, 0, 1,
-1.618148, 0.2423396, -0.8140628, 1, 0.2627451, 0, 1,
-1.58356, -1.754609, -3.605134, 1, 0.2705882, 0, 1,
-1.581889, -0.02429036, -0.9668595, 1, 0.2745098, 0, 1,
-1.56658, -0.1631334, -1.794561, 1, 0.282353, 0, 1,
-1.556661, 0.9750162, -1.908952, 1, 0.2862745, 0, 1,
-1.551307, -0.6998582, -2.583473, 1, 0.2941177, 0, 1,
-1.548199, 1.686319, 1.074796, 1, 0.3019608, 0, 1,
-1.547118, 1.246013, -1.141621, 1, 0.3058824, 0, 1,
-1.545018, -0.8906736, -1.906128, 1, 0.3137255, 0, 1,
-1.54439, 1.030326, 0.3891033, 1, 0.3176471, 0, 1,
-1.543045, -0.4940614, -1.946493, 1, 0.3254902, 0, 1,
-1.540587, -0.225552, -0.8796466, 1, 0.3294118, 0, 1,
-1.539884, 0.3901071, -1.787286, 1, 0.3372549, 0, 1,
-1.53412, 1.115895, -0.8090095, 1, 0.3411765, 0, 1,
-1.532062, 0.4467656, -2.679355, 1, 0.3490196, 0, 1,
-1.528817, 0.1737486, -0.1465258, 1, 0.3529412, 0, 1,
-1.515226, 0.2057254, -0.0006533012, 1, 0.3607843, 0, 1,
-1.509938, -1.049401, -2.924258, 1, 0.3647059, 0, 1,
-1.509801, 1.359195, 0.03335868, 1, 0.372549, 0, 1,
-1.505212, 0.5933083, -0.1153944, 1, 0.3764706, 0, 1,
-1.500712, -0.09666722, -1.484486, 1, 0.3843137, 0, 1,
-1.491301, 0.3441973, -1.801293, 1, 0.3882353, 0, 1,
-1.466483, -0.8386027, -2.360697, 1, 0.3960784, 0, 1,
-1.458929, -1.703978, -2.852173, 1, 0.4039216, 0, 1,
-1.453906, -0.3095988, -1.743672, 1, 0.4078431, 0, 1,
-1.453719, -2.189938, -2.67354, 1, 0.4156863, 0, 1,
-1.44114, 0.1877431, -0.7843202, 1, 0.4196078, 0, 1,
-1.435203, 1.456602, -0.8335711, 1, 0.427451, 0, 1,
-1.41962, 0.6407475, -3.941376, 1, 0.4313726, 0, 1,
-1.409234, -0.5291566, -2.795243, 1, 0.4392157, 0, 1,
-1.400174, -0.6662185, -2.788773, 1, 0.4431373, 0, 1,
-1.394481, 2.683952, 0.5803215, 1, 0.4509804, 0, 1,
-1.391441, -0.653385, -1.630513, 1, 0.454902, 0, 1,
-1.386961, -0.7633184, -3.256117, 1, 0.4627451, 0, 1,
-1.38523, 0.786382, -1.014861, 1, 0.4666667, 0, 1,
-1.369644, -0.07726771, -0.129266, 1, 0.4745098, 0, 1,
-1.361845, -1.686518, -2.94015, 1, 0.4784314, 0, 1,
-1.359778, 0.00965512, -0.3673177, 1, 0.4862745, 0, 1,
-1.351359, -0.7786313, -0.7077466, 1, 0.4901961, 0, 1,
-1.347647, 0.4691441, -0.5675449, 1, 0.4980392, 0, 1,
-1.344474, 0.6428722, 0.2428691, 1, 0.5058824, 0, 1,
-1.333718, -0.2744792, -1.59457, 1, 0.509804, 0, 1,
-1.330151, -0.5510472, -0.9804892, 1, 0.5176471, 0, 1,
-1.322583, 0.3088115, -2.0701, 1, 0.5215687, 0, 1,
-1.314595, -1.076134, -2.138412, 1, 0.5294118, 0, 1,
-1.313459, -0.2543761, -0.6104804, 1, 0.5333334, 0, 1,
-1.313363, -0.740267, -2.467239, 1, 0.5411765, 0, 1,
-1.311406, -0.7196124, -2.6612, 1, 0.5450981, 0, 1,
-1.294446, 0.4551831, -1.074641, 1, 0.5529412, 0, 1,
-1.289985, -0.2033252, -1.09957, 1, 0.5568628, 0, 1,
-1.289009, -1.484071, -3.323379, 1, 0.5647059, 0, 1,
-1.286969, 0.3957216, -0.1844449, 1, 0.5686275, 0, 1,
-1.283096, 0.750155, -0.8503888, 1, 0.5764706, 0, 1,
-1.28203, 0.05392772, -2.112735, 1, 0.5803922, 0, 1,
-1.269615, 0.4495686, -0.7976925, 1, 0.5882353, 0, 1,
-1.268812, 0.6316125, -0.01411294, 1, 0.5921569, 0, 1,
-1.264971, -1.528441, -3.044771, 1, 0.6, 0, 1,
-1.257882, 0.8169684, -0.4849875, 1, 0.6078432, 0, 1,
-1.233291, -1.751976, -1.654156, 1, 0.6117647, 0, 1,
-1.221392, -0.7248829, -1.912708, 1, 0.6196079, 0, 1,
-1.215072, -0.2963309, -0.1560228, 1, 0.6235294, 0, 1,
-1.201352, 0.5326778, -2.739414, 1, 0.6313726, 0, 1,
-1.195217, -0.4893022, -0.04520351, 1, 0.6352941, 0, 1,
-1.193161, -1.262437, -1.863706, 1, 0.6431373, 0, 1,
-1.190172, 0.07435784, -1.114358, 1, 0.6470588, 0, 1,
-1.186991, -1.486738, -2.383599, 1, 0.654902, 0, 1,
-1.183019, -0.06767258, -0.1029492, 1, 0.6588235, 0, 1,
-1.178143, 0.221306, -0.9848189, 1, 0.6666667, 0, 1,
-1.17442, 0.7457945, -2.119016, 1, 0.6705883, 0, 1,
-1.1705, -0.4770279, -2.433265, 1, 0.6784314, 0, 1,
-1.16738, -0.8552272, -1.377368, 1, 0.682353, 0, 1,
-1.163781, -0.2191691, -3.370172, 1, 0.6901961, 0, 1,
-1.155757, 0.740572, -1.767901, 1, 0.6941177, 0, 1,
-1.143401, -0.3598078, -3.317187, 1, 0.7019608, 0, 1,
-1.140342, -0.285659, -1.200882, 1, 0.7098039, 0, 1,
-1.136601, 0.831527, -0.4191756, 1, 0.7137255, 0, 1,
-1.134481, -0.5417941, 0.1668156, 1, 0.7215686, 0, 1,
-1.130893, 0.1926922, -1.450944, 1, 0.7254902, 0, 1,
-1.130884, 0.6626173, -3.3574, 1, 0.7333333, 0, 1,
-1.127298, 0.3727895, -2.622495, 1, 0.7372549, 0, 1,
-1.115733, 1.124968, -0.4383599, 1, 0.7450981, 0, 1,
-1.112399, 0.6342501, 0.01306684, 1, 0.7490196, 0, 1,
-1.111995, -0.272738, -1.381505, 1, 0.7568628, 0, 1,
-1.111881, 0.4507022, -1.217265, 1, 0.7607843, 0, 1,
-1.094266, -1.062973, -2.868666, 1, 0.7686275, 0, 1,
-1.093356, 0.5578759, -0.3237822, 1, 0.772549, 0, 1,
-1.09, 0.5216933, -1.432226, 1, 0.7803922, 0, 1,
-1.089223, 0.6058499, -0.2375913, 1, 0.7843137, 0, 1,
-1.08896, -0.9116407, -1.871648, 1, 0.7921569, 0, 1,
-1.088111, -1.41976, -1.354189, 1, 0.7960784, 0, 1,
-1.087433, -1.100984, -1.661447, 1, 0.8039216, 0, 1,
-1.086651, 0.7517491, -1.714215, 1, 0.8117647, 0, 1,
-1.084175, -0.8413394, -1.44587, 1, 0.8156863, 0, 1,
-1.079317, -0.1203192, -1.516791, 1, 0.8235294, 0, 1,
-1.074919, -0.2149266, -1.037117, 1, 0.827451, 0, 1,
-1.069439, -0.9734913, -1.371613, 1, 0.8352941, 0, 1,
-1.067907, 0.5977811, -0.857555, 1, 0.8392157, 0, 1,
-1.062337, 1.457703, -0.979876, 1, 0.8470588, 0, 1,
-1.057812, 0.3297112, -0.8151105, 1, 0.8509804, 0, 1,
-1.046832, 1.040556, -0.5138317, 1, 0.8588235, 0, 1,
-1.045721, -1.109663, -3.26176, 1, 0.8627451, 0, 1,
-1.0456, 1.44923, -0.5243165, 1, 0.8705882, 0, 1,
-1.045339, -0.143517, -3.826032, 1, 0.8745098, 0, 1,
-1.039875, 1.213665, 0.09384853, 1, 0.8823529, 0, 1,
-1.039697, 1.596803, 0.9696358, 1, 0.8862745, 0, 1,
-1.03937, -0.1011079, -2.54332, 1, 0.8941177, 0, 1,
-1.039208, -1.105975, -2.548299, 1, 0.8980392, 0, 1,
-1.034865, -0.7640074, -1.075713, 1, 0.9058824, 0, 1,
-1.034768, 1.638447, -2.434634, 1, 0.9137255, 0, 1,
-1.03334, 0.8809548, -0.8134164, 1, 0.9176471, 0, 1,
-1.031355, 1.190759, 0.05811279, 1, 0.9254902, 0, 1,
-1.028173, 0.03402635, -2.042043, 1, 0.9294118, 0, 1,
-1.02625, -0.1440817, -0.2996489, 1, 0.9372549, 0, 1,
-1.024365, -0.6945224, -3.182966, 1, 0.9411765, 0, 1,
-1.01957, -0.3582731, -2.706569, 1, 0.9490196, 0, 1,
-1.019294, 1.57598, -0.6084059, 1, 0.9529412, 0, 1,
-1.019217, -0.501815, -0.4666334, 1, 0.9607843, 0, 1,
-1.018365, -0.3545877, -1.877131, 1, 0.9647059, 0, 1,
-1.01724, 1.524708, 0.5286633, 1, 0.972549, 0, 1,
-1.014249, 0.6169692, -1.746846, 1, 0.9764706, 0, 1,
-1.00592, 1.388735, -2.680292, 1, 0.9843137, 0, 1,
-1.003655, -0.5841569, -0.7190259, 1, 0.9882353, 0, 1,
-0.990932, 0.7735442, -1.348007, 1, 0.9960784, 0, 1,
-0.9909218, -1.957792, -3.252457, 0.9960784, 1, 0, 1,
-0.9901013, 0.6959285, -0.9837195, 0.9921569, 1, 0, 1,
-0.9807468, 0.07987691, -2.881977, 0.9843137, 1, 0, 1,
-0.9792848, 1.298796, -1.4572, 0.9803922, 1, 0, 1,
-0.9781371, -0.38594, -1.691713, 0.972549, 1, 0, 1,
-0.9778835, -0.7989946, -3.073472, 0.9686275, 1, 0, 1,
-0.9676259, 0.295241, -1.276662, 0.9607843, 1, 0, 1,
-0.9648217, -0.413739, -1.611503, 0.9568627, 1, 0, 1,
-0.9565875, -0.681021, -1.695614, 0.9490196, 1, 0, 1,
-0.9520364, 1.540486, -1.32056, 0.945098, 1, 0, 1,
-0.9471149, 0.5819612, -0.8577125, 0.9372549, 1, 0, 1,
-0.9318104, -0.1021292, -1.172143, 0.9333333, 1, 0, 1,
-0.9316693, -1.042169, -2.111207, 0.9254902, 1, 0, 1,
-0.9242049, 1.519556, -0.6152892, 0.9215686, 1, 0, 1,
-0.9197846, 1.36451, -0.1556346, 0.9137255, 1, 0, 1,
-0.9145759, 1.002808, -0.8100242, 0.9098039, 1, 0, 1,
-0.9123923, -1.386364, -2.799803, 0.9019608, 1, 0, 1,
-0.912254, 2.739957, -1.311165, 0.8941177, 1, 0, 1,
-0.9110824, 2.523231, -0.8224314, 0.8901961, 1, 0, 1,
-0.9031999, 2.296888, -0.05125485, 0.8823529, 1, 0, 1,
-0.8944706, 1.303902, 0.0302357, 0.8784314, 1, 0, 1,
-0.8912018, 0.4073792, -3.27428, 0.8705882, 1, 0, 1,
-0.8894102, -2.272412, -3.487506, 0.8666667, 1, 0, 1,
-0.8852745, 0.2668652, -0.9558273, 0.8588235, 1, 0, 1,
-0.8712121, 0.4558499, -0.8466188, 0.854902, 1, 0, 1,
-0.8554538, 2.003968, -1.415723, 0.8470588, 1, 0, 1,
-0.8518769, -0.7708111, -3.793384, 0.8431373, 1, 0, 1,
-0.8512607, 1.945207, -2.023054, 0.8352941, 1, 0, 1,
-0.8450919, -0.9417179, -2.2965, 0.8313726, 1, 0, 1,
-0.8444757, 0.696251, -1.177817, 0.8235294, 1, 0, 1,
-0.8373082, -0.1357892, -3.262128, 0.8196079, 1, 0, 1,
-0.8342639, -0.5582874, -1.305402, 0.8117647, 1, 0, 1,
-0.8333193, -0.1737232, -1.494716, 0.8078431, 1, 0, 1,
-0.8304058, -0.5450809, -1.153366, 0.8, 1, 0, 1,
-0.8245202, -0.8280469, -2.02459, 0.7921569, 1, 0, 1,
-0.8241451, 0.1364124, -0.05917218, 0.7882353, 1, 0, 1,
-0.8178359, 0.8031814, -2.314616, 0.7803922, 1, 0, 1,
-0.8121457, 1.738682, -0.4589709, 0.7764706, 1, 0, 1,
-0.8106642, -0.7711325, -3.224038, 0.7686275, 1, 0, 1,
-0.8011348, 0.3354432, -1.528048, 0.7647059, 1, 0, 1,
-0.7972489, 0.3268223, -0.2652176, 0.7568628, 1, 0, 1,
-0.7945541, 1.919292, -0.7395272, 0.7529412, 1, 0, 1,
-0.7867426, 0.2482441, -2.844062, 0.7450981, 1, 0, 1,
-0.7865689, 1.619626, -0.9726337, 0.7411765, 1, 0, 1,
-0.7801839, -2.975468, -3.405897, 0.7333333, 1, 0, 1,
-0.7702847, -0.07533841, -1.124918, 0.7294118, 1, 0, 1,
-0.7460731, 0.05989156, -2.339373, 0.7215686, 1, 0, 1,
-0.7459373, 0.1166092, -0.4509678, 0.7176471, 1, 0, 1,
-0.7457023, 2.226404, -1.192998, 0.7098039, 1, 0, 1,
-0.7340943, -0.5251003, -2.902288, 0.7058824, 1, 0, 1,
-0.7318978, -0.5693869, -2.423127, 0.6980392, 1, 0, 1,
-0.725274, -0.6592709, -2.718426, 0.6901961, 1, 0, 1,
-0.7241982, -1.448927, -2.792046, 0.6862745, 1, 0, 1,
-0.7191986, -0.4713193, -2.160322, 0.6784314, 1, 0, 1,
-0.7165614, -0.4443501, -3.947454, 0.6745098, 1, 0, 1,
-0.7124031, 0.3762336, -0.1946105, 0.6666667, 1, 0, 1,
-0.7078211, 0.3658361, -1.945957, 0.6627451, 1, 0, 1,
-0.7020029, -0.687442, -1.77068, 0.654902, 1, 0, 1,
-0.7019274, -0.4392123, -2.24501, 0.6509804, 1, 0, 1,
-0.6859149, 2.30295, 0.7376022, 0.6431373, 1, 0, 1,
-0.6855735, -1.340498, -2.706889, 0.6392157, 1, 0, 1,
-0.6832579, 0.6120763, -2.594368, 0.6313726, 1, 0, 1,
-0.6827131, 0.2658871, -2.351368, 0.627451, 1, 0, 1,
-0.680876, -2.017022, -2.146315, 0.6196079, 1, 0, 1,
-0.675536, -1.061359, -4.066422, 0.6156863, 1, 0, 1,
-0.6626123, 0.1117453, -0.5046809, 0.6078432, 1, 0, 1,
-0.6612151, -0.4825084, -2.471828, 0.6039216, 1, 0, 1,
-0.660947, -0.8180569, -0.9601038, 0.5960785, 1, 0, 1,
-0.6601206, -0.6379928, -1.479289, 0.5882353, 1, 0, 1,
-0.6586258, -1.247086, -3.924503, 0.5843138, 1, 0, 1,
-0.6575664, -0.1777441, -1.813221, 0.5764706, 1, 0, 1,
-0.6557902, -0.7564871, -3.536257, 0.572549, 1, 0, 1,
-0.6512146, -0.4399557, -3.398311, 0.5647059, 1, 0, 1,
-0.650088, -0.5166363, -2.154039, 0.5607843, 1, 0, 1,
-0.6421288, 0.0231108, -2.127364, 0.5529412, 1, 0, 1,
-0.6386748, -0.3535488, -1.415866, 0.5490196, 1, 0, 1,
-0.6347556, -0.1808278, -1.858764, 0.5411765, 1, 0, 1,
-0.6345677, -0.9374394, -2.710261, 0.5372549, 1, 0, 1,
-0.6285459, 1.018662, 0.3563015, 0.5294118, 1, 0, 1,
-0.6276422, 0.3147293, -1.751556, 0.5254902, 1, 0, 1,
-0.6256831, -1.387195, -0.9153921, 0.5176471, 1, 0, 1,
-0.6247854, 0.9990978, 0.2674677, 0.5137255, 1, 0, 1,
-0.6237906, -0.8356928, -2.541343, 0.5058824, 1, 0, 1,
-0.6229906, 1.830407, -0.4659731, 0.5019608, 1, 0, 1,
-0.6179976, 0.5025746, -1.86938, 0.4941176, 1, 0, 1,
-0.6166475, -0.3959111, -1.749418, 0.4862745, 1, 0, 1,
-0.6162679, -0.2449905, -2.04388, 0.4823529, 1, 0, 1,
-0.6159195, 1.292328, -1.648631, 0.4745098, 1, 0, 1,
-0.6158556, 0.2254964, -1.364523, 0.4705882, 1, 0, 1,
-0.612291, 0.9035566, -1.183333, 0.4627451, 1, 0, 1,
-0.6098568, -0.3416709, -1.69392, 0.4588235, 1, 0, 1,
-0.608395, 0.7957941, -0.3018674, 0.4509804, 1, 0, 1,
-0.5979081, -0.4435944, -2.466221, 0.4470588, 1, 0, 1,
-0.5976085, 0.2567163, 0.3596114, 0.4392157, 1, 0, 1,
-0.5961411, 1.952818, -0.110846, 0.4352941, 1, 0, 1,
-0.5956281, 0.1682567, -0.1733466, 0.427451, 1, 0, 1,
-0.5898726, 0.4953627, -1.739504, 0.4235294, 1, 0, 1,
-0.5892534, -0.5516025, -0.5556519, 0.4156863, 1, 0, 1,
-0.5810354, 1.320231, -0.8637224, 0.4117647, 1, 0, 1,
-0.5774086, 0.08219983, 2.381204, 0.4039216, 1, 0, 1,
-0.5770845, 0.4480952, -2.471227, 0.3960784, 1, 0, 1,
-0.5730814, 0.719439, 0.4903055, 0.3921569, 1, 0, 1,
-0.5722845, -0.808479, -1.966224, 0.3843137, 1, 0, 1,
-0.5708924, -1.417997, -2.41588, 0.3803922, 1, 0, 1,
-0.5687381, -0.5335868, -1.876793, 0.372549, 1, 0, 1,
-0.5616931, -0.422778, -1.738969, 0.3686275, 1, 0, 1,
-0.5600181, -0.3044232, -1.694851, 0.3607843, 1, 0, 1,
-0.5589464, 0.3809279, -2.576422, 0.3568628, 1, 0, 1,
-0.5562468, -0.5879523, -1.848601, 0.3490196, 1, 0, 1,
-0.5555098, -1.352404, -1.021758, 0.345098, 1, 0, 1,
-0.555005, -0.1311597, -1.619319, 0.3372549, 1, 0, 1,
-0.5530499, -1.196633, -3.846251, 0.3333333, 1, 0, 1,
-0.5491038, 0.8689153, 0.8292419, 0.3254902, 1, 0, 1,
-0.5439126, 0.1048853, -2.122668, 0.3215686, 1, 0, 1,
-0.540612, 0.2640821, 0.1735674, 0.3137255, 1, 0, 1,
-0.5374405, 1.200161, 0.9132735, 0.3098039, 1, 0, 1,
-0.5323297, -0.6766999, -2.960607, 0.3019608, 1, 0, 1,
-0.5296467, -0.9967327, -3.325522, 0.2941177, 1, 0, 1,
-0.5279341, 1.725966, 1.322278, 0.2901961, 1, 0, 1,
-0.5148095, 0.07638215, -0.5020984, 0.282353, 1, 0, 1,
-0.5146071, -1.411796, -2.617518, 0.2784314, 1, 0, 1,
-0.5145604, 1.362908, -1.61894, 0.2705882, 1, 0, 1,
-0.5144334, 0.5343315, -0.687485, 0.2666667, 1, 0, 1,
-0.5059155, 0.4602351, -1.654157, 0.2588235, 1, 0, 1,
-0.5058407, -0.781099, -2.280936, 0.254902, 1, 0, 1,
-0.5043675, -0.3383726, -1.438868, 0.2470588, 1, 0, 1,
-0.5030888, -0.6390057, -1.120569, 0.2431373, 1, 0, 1,
-0.5030537, -0.4213169, -1.149272, 0.2352941, 1, 0, 1,
-0.4991375, 1.534805, -0.9728105, 0.2313726, 1, 0, 1,
-0.4961669, 1.019108, -0.2352819, 0.2235294, 1, 0, 1,
-0.4948197, -0.369177, -2.21363, 0.2196078, 1, 0, 1,
-0.4936588, 0.9370885, -2.104963, 0.2117647, 1, 0, 1,
-0.4932902, 0.7778409, -0.4284387, 0.2078431, 1, 0, 1,
-0.4898491, -1.114492, -2.069436, 0.2, 1, 0, 1,
-0.4885238, -1.294644, -2.680399, 0.1921569, 1, 0, 1,
-0.4852954, -0.5349495, -2.484887, 0.1882353, 1, 0, 1,
-0.4831944, -0.8929437, -3.040966, 0.1803922, 1, 0, 1,
-0.4822195, -0.002671046, -2.893493, 0.1764706, 1, 0, 1,
-0.4795788, -0.4409957, -2.030033, 0.1686275, 1, 0, 1,
-0.4789472, 2.498871, 0.05634414, 0.1647059, 1, 0, 1,
-0.4667759, -0.3805786, -1.992398, 0.1568628, 1, 0, 1,
-0.4654653, -0.9365866, -1.709675, 0.1529412, 1, 0, 1,
-0.4651877, -1.19986, -2.463466, 0.145098, 1, 0, 1,
-0.4637673, 1.789085, 0.9918227, 0.1411765, 1, 0, 1,
-0.4581829, -1.096623, -1.31575, 0.1333333, 1, 0, 1,
-0.4572072, 0.3657809, -0.3152755, 0.1294118, 1, 0, 1,
-0.4541005, 0.974443, -0.9990138, 0.1215686, 1, 0, 1,
-0.4533164, 0.5228736, -0.789211, 0.1176471, 1, 0, 1,
-0.4518992, -0.8699274, -2.931318, 0.1098039, 1, 0, 1,
-0.4466331, 0.1443234, -3.227584, 0.1058824, 1, 0, 1,
-0.4459273, -0.225753, -1.981675, 0.09803922, 1, 0, 1,
-0.4420901, 1.534281, -1.115785, 0.09019608, 1, 0, 1,
-0.4402434, -0.1961982, -4.11238, 0.08627451, 1, 0, 1,
-0.4380989, -0.2504449, -0.2347813, 0.07843138, 1, 0, 1,
-0.4380728, -0.3288569, -2.164823, 0.07450981, 1, 0, 1,
-0.4364397, -0.3950194, -3.144705, 0.06666667, 1, 0, 1,
-0.4350998, -0.9121558, -3.618235, 0.0627451, 1, 0, 1,
-0.4348542, 0.8922045, -1.876941, 0.05490196, 1, 0, 1,
-0.4317327, 0.2998085, -2.922437, 0.05098039, 1, 0, 1,
-0.4312963, 2.505857, -0.481758, 0.04313726, 1, 0, 1,
-0.4310238, 0.07687611, -3.367504, 0.03921569, 1, 0, 1,
-0.430925, 0.6386766, -0.8512993, 0.03137255, 1, 0, 1,
-0.430103, 0.7979685, -2.095269, 0.02745098, 1, 0, 1,
-0.4282819, 0.4896749, -2.509642, 0.01960784, 1, 0, 1,
-0.4157747, 0.06736784, -0.08336502, 0.01568628, 1, 0, 1,
-0.4084962, 0.2716362, 0.1823079, 0.007843138, 1, 0, 1,
-0.4072829, -0.2085334, -1.395148, 0.003921569, 1, 0, 1,
-0.3982825, -0.2152714, -2.031646, 0, 1, 0.003921569, 1,
-0.3958869, -0.665613, -1.125874, 0, 1, 0.01176471, 1,
-0.3958316, -0.6197253, -3.62957, 0, 1, 0.01568628, 1,
-0.3939861, -0.3136991, -1.915975, 0, 1, 0.02352941, 1,
-0.3879642, -2.00845, -4.174024, 0, 1, 0.02745098, 1,
-0.3877524, -1.161474, -3.865468, 0, 1, 0.03529412, 1,
-0.3871615, 1.052784, 0.09611942, 0, 1, 0.03921569, 1,
-0.3850749, 0.5582066, 0.4240485, 0, 1, 0.04705882, 1,
-0.3846197, 0.03795106, 0.4615618, 0, 1, 0.05098039, 1,
-0.3826948, -0.08298939, -3.024487, 0, 1, 0.05882353, 1,
-0.3821709, -0.3959868, -0.9502048, 0, 1, 0.0627451, 1,
-0.3814222, -1.042127, -3.359268, 0, 1, 0.07058824, 1,
-0.3755783, -0.01144135, -0.8938197, 0, 1, 0.07450981, 1,
-0.373565, 1.216929, -0.869271, 0, 1, 0.08235294, 1,
-0.3725747, 0.3213557, -1.123577, 0, 1, 0.08627451, 1,
-0.3679948, 1.022583, -0.9581783, 0, 1, 0.09411765, 1,
-0.3679186, 0.2132842, -1.981927, 0, 1, 0.1019608, 1,
-0.367461, -0.1251768, -2.42099, 0, 1, 0.1058824, 1,
-0.3663872, -1.94889, -1.94787, 0, 1, 0.1137255, 1,
-0.3623733, 0.831547, -0.6623523, 0, 1, 0.1176471, 1,
-0.3605744, 1.390583, 0.1688039, 0, 1, 0.1254902, 1,
-0.3582154, -0.1781766, -1.281447, 0, 1, 0.1294118, 1,
-0.3541241, -0.09556177, -0.04250563, 0, 1, 0.1372549, 1,
-0.3522617, 1.956033, 0.815219, 0, 1, 0.1411765, 1,
-0.344478, -2.043907, -3.265386, 0, 1, 0.1490196, 1,
-0.3425838, -0.1931608, 0.2128569, 0, 1, 0.1529412, 1,
-0.3393123, -0.8024659, -3.103406, 0, 1, 0.1607843, 1,
-0.3376557, -1.784377, -3.858668, 0, 1, 0.1647059, 1,
-0.3372795, -0.5469095, -1.841251, 0, 1, 0.172549, 1,
-0.3349352, 0.3243917, -1.298639, 0, 1, 0.1764706, 1,
-0.3302078, 2.687498, 0.5336679, 0, 1, 0.1843137, 1,
-0.3277794, -1.094688, -3.413427, 0, 1, 0.1882353, 1,
-0.3267187, 1.031844, -0.2642465, 0, 1, 0.1960784, 1,
-0.3230379, 0.1727542, -1.729886, 0, 1, 0.2039216, 1,
-0.3188769, 0.5180103, -2.171904, 0, 1, 0.2078431, 1,
-0.3145977, -0.8325296, -2.647618, 0, 1, 0.2156863, 1,
-0.314547, -1.163069, -2.583695, 0, 1, 0.2196078, 1,
-0.3142341, -0.4689678, -1.970758, 0, 1, 0.227451, 1,
-0.3096441, 0.2678584, -0.191915, 0, 1, 0.2313726, 1,
-0.3063208, 0.5290496, -0.1517655, 0, 1, 0.2392157, 1,
-0.3054396, 0.5497736, -2.983653, 0, 1, 0.2431373, 1,
-0.3008726, 0.5041742, -2.296763, 0, 1, 0.2509804, 1,
-0.2957987, -1.52214, -1.341902, 0, 1, 0.254902, 1,
-0.2896551, 1.121813, -1.446445, 0, 1, 0.2627451, 1,
-0.2890633, 0.4380915, -0.9807829, 0, 1, 0.2666667, 1,
-0.2858615, -1.061256, -2.90559, 0, 1, 0.2745098, 1,
-0.285476, -0.5291653, -2.972483, 0, 1, 0.2784314, 1,
-0.285459, 0.4374365, -0.6546317, 0, 1, 0.2862745, 1,
-0.2777689, 1.134322, 0.6475523, 0, 1, 0.2901961, 1,
-0.2770861, 1.139873, -0.4798398, 0, 1, 0.2980392, 1,
-0.2759804, -0.3983451, -2.579328, 0, 1, 0.3058824, 1,
-0.2746986, 1.122062, 1.216267, 0, 1, 0.3098039, 1,
-0.2701956, -0.3353937, -1.550962, 0, 1, 0.3176471, 1,
-0.2683386, -2.131381, -2.597314, 0, 1, 0.3215686, 1,
-0.2668069, -2.200982, -3.23115, 0, 1, 0.3294118, 1,
-0.2659467, 1.063837, -1.048879, 0, 1, 0.3333333, 1,
-0.2647633, -0.8639839, -3.386822, 0, 1, 0.3411765, 1,
-0.2634349, 0.09941527, -1.481521, 0, 1, 0.345098, 1,
-0.2629107, -0.7777104, -3.278956, 0, 1, 0.3529412, 1,
-0.2621379, 1.049119, 1.404674, 0, 1, 0.3568628, 1,
-0.2599469, -0.01605816, -1.397371, 0, 1, 0.3647059, 1,
-0.2592671, -0.7251685, -0.9226424, 0, 1, 0.3686275, 1,
-0.2538894, -0.2566752, -3.148933, 0, 1, 0.3764706, 1,
-0.2488308, 1.298994, 0.1128492, 0, 1, 0.3803922, 1,
-0.2480055, -2.537946, -2.05033, 0, 1, 0.3882353, 1,
-0.2471759, -0.4892764, -1.489043, 0, 1, 0.3921569, 1,
-0.2449983, -0.3277494, -4.04342, 0, 1, 0.4, 1,
-0.2432173, -0.431722, -2.162746, 0, 1, 0.4078431, 1,
-0.2399012, -0.1280059, -2.728536, 0, 1, 0.4117647, 1,
-0.2378889, 1.524914, 1.030341, 0, 1, 0.4196078, 1,
-0.2354318, 0.316349, -0.7181017, 0, 1, 0.4235294, 1,
-0.2307198, -0.6434979, -2.368576, 0, 1, 0.4313726, 1,
-0.2272463, 0.164064, -0.8455929, 0, 1, 0.4352941, 1,
-0.2161277, 0.02782103, -1.534411, 0, 1, 0.4431373, 1,
-0.2128248, 0.2232271, -2.707967, 0, 1, 0.4470588, 1,
-0.2090574, 1.009819, 2.246204, 0, 1, 0.454902, 1,
-0.2084303, 0.9003718, -1.081261, 0, 1, 0.4588235, 1,
-0.2076681, -0.4566919, -3.60764, 0, 1, 0.4666667, 1,
-0.2069189, 1.146539, 0.7128313, 0, 1, 0.4705882, 1,
-0.2057878, 0.914684, -0.1233161, 0, 1, 0.4784314, 1,
-0.2052563, -1.133609, -4.406488, 0, 1, 0.4823529, 1,
-0.2050213, -1.837154, -3.274549, 0, 1, 0.4901961, 1,
-0.1984717, -0.9108219, -3.922328, 0, 1, 0.4941176, 1,
-0.1923856, 0.19289, -1.833865, 0, 1, 0.5019608, 1,
-0.1916572, -0.3302399, -3.88235, 0, 1, 0.509804, 1,
-0.190011, 0.4501499, -0.2623689, 0, 1, 0.5137255, 1,
-0.1893846, -0.2882279, -1.800215, 0, 1, 0.5215687, 1,
-0.1808889, -0.7076974, -2.041898, 0, 1, 0.5254902, 1,
-0.1805311, -1.136226, -3.393553, 0, 1, 0.5333334, 1,
-0.1781972, 1.436124, 0.03293811, 0, 1, 0.5372549, 1,
-0.1780497, 0.05780014, -2.05331, 0, 1, 0.5450981, 1,
-0.1779855, -0.2743918, -1.386256, 0, 1, 0.5490196, 1,
-0.1690891, 0.05286138, -1.196685, 0, 1, 0.5568628, 1,
-0.1688907, 1.184207, -0.7142713, 0, 1, 0.5607843, 1,
-0.1674691, -0.2481111, -2.76837, 0, 1, 0.5686275, 1,
-0.1653465, 0.2778, -1.218784, 0, 1, 0.572549, 1,
-0.164665, -1.036196, -2.887923, 0, 1, 0.5803922, 1,
-0.1577672, 0.9416879, -0.7703805, 0, 1, 0.5843138, 1,
-0.1570631, -1.945668, -2.510079, 0, 1, 0.5921569, 1,
-0.156222, 0.7366269, 0.2026529, 0, 1, 0.5960785, 1,
-0.1536959, -0.1517372, -1.805889, 0, 1, 0.6039216, 1,
-0.1484974, -0.9741051, -2.429398, 0, 1, 0.6117647, 1,
-0.1482947, 1.040363, 0.3591918, 0, 1, 0.6156863, 1,
-0.1475691, 1.218568, -1.152402, 0, 1, 0.6235294, 1,
-0.1439158, 1.863357, 1.45482, 0, 1, 0.627451, 1,
-0.1395564, -0.5923205, -2.925199, 0, 1, 0.6352941, 1,
-0.1349963, 1.287265, -0.2084102, 0, 1, 0.6392157, 1,
-0.1328373, -0.5072701, -3.529278, 0, 1, 0.6470588, 1,
-0.1319297, 1.819505, 1.628626, 0, 1, 0.6509804, 1,
-0.1274215, -0.1745566, -2.174037, 0, 1, 0.6588235, 1,
-0.1273329, -0.08680483, -2.523176, 0, 1, 0.6627451, 1,
-0.124998, 0.4267449, -0.4629874, 0, 1, 0.6705883, 1,
-0.1239599, -0.8701672, -2.666211, 0, 1, 0.6745098, 1,
-0.1221039, -0.1154646, -2.458631, 0, 1, 0.682353, 1,
-0.1204736, 0.9738629, 0.3452514, 0, 1, 0.6862745, 1,
-0.119984, 0.2406941, -1.375242, 0, 1, 0.6941177, 1,
-0.1195026, -1.133941, -3.627886, 0, 1, 0.7019608, 1,
-0.1162692, 0.0947568, 0.7527018, 0, 1, 0.7058824, 1,
-0.1144705, -1.640436, -1.972608, 0, 1, 0.7137255, 1,
-0.1108908, -0.0588304, -2.023746, 0, 1, 0.7176471, 1,
-0.1073294, 0.3933759, -1.376618, 0, 1, 0.7254902, 1,
-0.1047238, -0.3193239, -3.224876, 0, 1, 0.7294118, 1,
-0.1036963, 0.2255299, -0.2369322, 0, 1, 0.7372549, 1,
-0.0995198, 1.216385, 0.9143669, 0, 1, 0.7411765, 1,
-0.09312189, 1.038353, -2.888482, 0, 1, 0.7490196, 1,
-0.09206712, 1.170781, -1.183946, 0, 1, 0.7529412, 1,
-0.08844487, -0.4240705, -4.368083, 0, 1, 0.7607843, 1,
-0.07904153, -0.1009719, -1.78354, 0, 1, 0.7647059, 1,
-0.07771444, -0.4971946, -3.770453, 0, 1, 0.772549, 1,
-0.07688414, 0.09049914, -1.947884, 0, 1, 0.7764706, 1,
-0.07489905, -1.48093, -2.336232, 0, 1, 0.7843137, 1,
-0.07323154, 0.03144595, -1.966696, 0, 1, 0.7882353, 1,
-0.06659971, -0.1289997, -3.452341, 0, 1, 0.7960784, 1,
-0.06468385, -0.111578, -2.143023, 0, 1, 0.8039216, 1,
-0.05725943, -1.900552, -2.105983, 0, 1, 0.8078431, 1,
-0.05643499, 1.373035, -0.5277746, 0, 1, 0.8156863, 1,
-0.05630313, -0.6050898, -2.546666, 0, 1, 0.8196079, 1,
-0.0560478, 0.5781053, 0.8453323, 0, 1, 0.827451, 1,
-0.05552079, 0.03024132, 0.5335138, 0, 1, 0.8313726, 1,
-0.05253492, -0.4298824, -3.773584, 0, 1, 0.8392157, 1,
-0.05130969, 1.020004, -0.7503219, 0, 1, 0.8431373, 1,
-0.04022702, 0.2058945, -0.3314162, 0, 1, 0.8509804, 1,
-0.0377518, 0.7937312, -0.2752768, 0, 1, 0.854902, 1,
-0.03594768, 1.908334, 1.998513, 0, 1, 0.8627451, 1,
-0.03447612, 0.6147425, -2.038069, 0, 1, 0.8666667, 1,
-0.03366155, -0.5500046, -2.537861, 0, 1, 0.8745098, 1,
-0.03258369, 0.08546406, -0.9088016, 0, 1, 0.8784314, 1,
-0.02690711, 1.619348, -0.7449899, 0, 1, 0.8862745, 1,
-0.02438283, 0.6814361, -0.002825905, 0, 1, 0.8901961, 1,
-0.02130997, -0.3018047, -1.522023, 0, 1, 0.8980392, 1,
-0.01110937, -0.7501053, -3.490065, 0, 1, 0.9058824, 1,
-0.005504533, 0.3680884, 0.04586292, 0, 1, 0.9098039, 1,
-0.004826867, -0.5208313, -2.481618, 0, 1, 0.9176471, 1,
0.0001525906, -0.1741749, 0.5009488, 0, 1, 0.9215686, 1,
0.002979015, -0.3024994, 2.456116, 0, 1, 0.9294118, 1,
0.003486271, 0.7590888, 0.7362089, 0, 1, 0.9333333, 1,
0.005922274, 1.266013, -0.7182771, 0, 1, 0.9411765, 1,
0.01022907, 0.2379519, 1.841723, 0, 1, 0.945098, 1,
0.01459774, 0.5476799, 0.1304799, 0, 1, 0.9529412, 1,
0.02041898, -0.490214, 1.602537, 0, 1, 0.9568627, 1,
0.02094233, -0.02687344, 3.438009, 0, 1, 0.9647059, 1,
0.02449978, 0.3961219, -0.2123997, 0, 1, 0.9686275, 1,
0.02469945, -1.146857, 3.13866, 0, 1, 0.9764706, 1,
0.02616528, 0.835054, 1.690018, 0, 1, 0.9803922, 1,
0.02869743, -0.2057044, 1.465758, 0, 1, 0.9882353, 1,
0.0312911, -1.167356, 4.827394, 0, 1, 0.9921569, 1,
0.03451542, -0.2078922, 3.840355, 0, 1, 1, 1,
0.03664993, 0.01152783, 0.04448746, 0, 0.9921569, 1, 1,
0.03887448, 0.678236, -1.201873, 0, 0.9882353, 1, 1,
0.0421862, 0.8910996, 0.4248231, 0, 0.9803922, 1, 1,
0.04811854, 1.279003, 2.307163, 0, 0.9764706, 1, 1,
0.04886765, 1.02029, 0.4343938, 0, 0.9686275, 1, 1,
0.04997797, -1.161744, 4.026378, 0, 0.9647059, 1, 1,
0.05369674, 0.06891152, -1.593128, 0, 0.9568627, 1, 1,
0.05444035, 0.1011794, -0.8292038, 0, 0.9529412, 1, 1,
0.05627131, -0.9063295, 3.144941, 0, 0.945098, 1, 1,
0.0565475, 0.5657435, 1.588696, 0, 0.9411765, 1, 1,
0.05765275, -0.1274039, 2.711179, 0, 0.9333333, 1, 1,
0.06511677, 1.005519, -0.5717497, 0, 0.9294118, 1, 1,
0.0692101, 0.2988728, 1.979972, 0, 0.9215686, 1, 1,
0.08201731, 0.5391136, -0.5478838, 0, 0.9176471, 1, 1,
0.08241883, 2.565747, 1.301204, 0, 0.9098039, 1, 1,
0.0887882, 0.8752966, -0.4075916, 0, 0.9058824, 1, 1,
0.09116308, 0.9578072, -1.589071, 0, 0.8980392, 1, 1,
0.09297366, -0.7623829, 3.040167, 0, 0.8901961, 1, 1,
0.09442835, -0.2040477, 3.444032, 0, 0.8862745, 1, 1,
0.09461611, -0.01255741, 0.9171202, 0, 0.8784314, 1, 1,
0.09595706, 0.8538377, 0.1666741, 0, 0.8745098, 1, 1,
0.09785574, 0.9112526, 0.6282458, 0, 0.8666667, 1, 1,
0.1010205, -0.5066668, 2.399413, 0, 0.8627451, 1, 1,
0.1067289, 1.006274, -0.4604114, 0, 0.854902, 1, 1,
0.1084505, -0.8757408, 3.4805, 0, 0.8509804, 1, 1,
0.1086578, 0.02219364, 2.037959, 0, 0.8431373, 1, 1,
0.1091304, 0.438097, -0.1172149, 0, 0.8392157, 1, 1,
0.1108373, -0.6351577, 2.188698, 0, 0.8313726, 1, 1,
0.1109152, -1.925107, 2.412708, 0, 0.827451, 1, 1,
0.1128106, -0.03311032, 0.9806562, 0, 0.8196079, 1, 1,
0.1149886, 0.05681128, 0.5969376, 0, 0.8156863, 1, 1,
0.1155159, 0.3027423, 2.887737, 0, 0.8078431, 1, 1,
0.116665, 0.1845235, 0.3691117, 0, 0.8039216, 1, 1,
0.1178074, 0.1269289, 1.548874, 0, 0.7960784, 1, 1,
0.121644, -0.5817494, 3.469662, 0, 0.7882353, 1, 1,
0.1221867, 0.1480831, -0.9137143, 0, 0.7843137, 1, 1,
0.1225262, 0.007089312, 0.3058853, 0, 0.7764706, 1, 1,
0.1259372, -0.5053822, 3.241421, 0, 0.772549, 1, 1,
0.1283796, -1.576706, 2.780145, 0, 0.7647059, 1, 1,
0.1293163, -1.418044, 3.876162, 0, 0.7607843, 1, 1,
0.1327454, -0.3268644, 2.135969, 0, 0.7529412, 1, 1,
0.1369535, 0.81797, 1.093232, 0, 0.7490196, 1, 1,
0.1400172, 1.006266, -0.3493176, 0, 0.7411765, 1, 1,
0.1402989, 1.30254, 1.253255, 0, 0.7372549, 1, 1,
0.1627986, 0.2704269, -0.6931205, 0, 0.7294118, 1, 1,
0.1633459, 0.1298536, 1.09618, 0, 0.7254902, 1, 1,
0.1642074, -0.6584613, 2.189127, 0, 0.7176471, 1, 1,
0.1651102, 0.7570903, 1.119061, 0, 0.7137255, 1, 1,
0.1677595, -2.021338, 3.43392, 0, 0.7058824, 1, 1,
0.1690457, -0.4702164, 2.395796, 0, 0.6980392, 1, 1,
0.1693008, -0.4810217, 3.568535, 0, 0.6941177, 1, 1,
0.1694767, 0.3664906, 0.1587009, 0, 0.6862745, 1, 1,
0.1709111, -2.16807, 3.607172, 0, 0.682353, 1, 1,
0.1713304, -1.14453, 3.16726, 0, 0.6745098, 1, 1,
0.1720424, 0.04373601, 0.9084416, 0, 0.6705883, 1, 1,
0.1729945, 0.01393114, 1.680157, 0, 0.6627451, 1, 1,
0.1733398, 0.8235619, 3.448066, 0, 0.6588235, 1, 1,
0.1784586, 0.6592314, 0.7734374, 0, 0.6509804, 1, 1,
0.182864, -1.324681, 3.10301, 0, 0.6470588, 1, 1,
0.1863737, -1.582535, 4.002695, 0, 0.6392157, 1, 1,
0.1878281, -0.3770589, 2.461059, 0, 0.6352941, 1, 1,
0.1909663, 0.7016835, 0.5743483, 0, 0.627451, 1, 1,
0.1917247, -1.470607, 4.239854, 0, 0.6235294, 1, 1,
0.1933541, -0.1070765, 2.411936, 0, 0.6156863, 1, 1,
0.1958688, 1.52244, -1.330972, 0, 0.6117647, 1, 1,
0.1958901, -0.8738048, 2.76686, 0, 0.6039216, 1, 1,
0.1977499, -0.840713, 2.307883, 0, 0.5960785, 1, 1,
0.2007778, 2.059518, -0.8045447, 0, 0.5921569, 1, 1,
0.2018795, 0.7771612, -1.114589, 0, 0.5843138, 1, 1,
0.2027703, -0.4893884, 4.210818, 0, 0.5803922, 1, 1,
0.2044878, 0.06503759, -0.8390777, 0, 0.572549, 1, 1,
0.20533, -1.19378, 1.718612, 0, 0.5686275, 1, 1,
0.2116955, -0.4240308, 3.561883, 0, 0.5607843, 1, 1,
0.2158575, 0.5968906, 1.457721, 0, 0.5568628, 1, 1,
0.2160258, -0.9998389, 4.206436, 0, 0.5490196, 1, 1,
0.2236567, -1.652325, 2.123397, 0, 0.5450981, 1, 1,
0.2248336, 0.9380329, 1.581474, 0, 0.5372549, 1, 1,
0.2277374, -0.5096815, 1.250454, 0, 0.5333334, 1, 1,
0.2282652, -0.4143, 3.96658, 0, 0.5254902, 1, 1,
0.2330137, -0.5720575, 3.154276, 0, 0.5215687, 1, 1,
0.2338153, 0.08897208, 1.968509, 0, 0.5137255, 1, 1,
0.2441394, 0.2758178, 0.6764533, 0, 0.509804, 1, 1,
0.2444709, 1.076376, -0.09028301, 0, 0.5019608, 1, 1,
0.2459684, -0.1340245, 5.416497, 0, 0.4941176, 1, 1,
0.2468934, 0.2597855, -1.086691, 0, 0.4901961, 1, 1,
0.248805, 0.7809295, 1.241682, 0, 0.4823529, 1, 1,
0.2526594, -0.9631106, 2.403507, 0, 0.4784314, 1, 1,
0.2541766, -0.393358, 3.80785, 0, 0.4705882, 1, 1,
0.2547087, 0.01485018, 0.02563011, 0, 0.4666667, 1, 1,
0.2548212, -0.7391225, 1.94891, 0, 0.4588235, 1, 1,
0.2551335, -0.237968, 1.631163, 0, 0.454902, 1, 1,
0.25529, 1.108405, -0.0765061, 0, 0.4470588, 1, 1,
0.2580307, -0.6945046, 1.121827, 0, 0.4431373, 1, 1,
0.2598098, 0.428666, 0.5249355, 0, 0.4352941, 1, 1,
0.2600797, 1.816019, 2.596124, 0, 0.4313726, 1, 1,
0.2632636, 0.5489548, -0.4391559, 0, 0.4235294, 1, 1,
0.2632659, 1.155082, 1.681364, 0, 0.4196078, 1, 1,
0.2642448, -0.9940594, 2.591753, 0, 0.4117647, 1, 1,
0.265064, 0.8551288, 1.756912, 0, 0.4078431, 1, 1,
0.2675323, -0.3066295, 3.699106, 0, 0.4, 1, 1,
0.271918, 0.1124008, 0.675396, 0, 0.3921569, 1, 1,
0.2719938, 0.3432651, 0.9880512, 0, 0.3882353, 1, 1,
0.2721203, 0.490148, 1.458092, 0, 0.3803922, 1, 1,
0.2760084, -0.1366132, 1.522173, 0, 0.3764706, 1, 1,
0.2798637, -0.706535, 3.853191, 0, 0.3686275, 1, 1,
0.2818384, -0.1833666, 0.4258848, 0, 0.3647059, 1, 1,
0.2861764, 0.8728761, -1.464968, 0, 0.3568628, 1, 1,
0.2873913, -0.09380345, 1.058003, 0, 0.3529412, 1, 1,
0.2914694, 0.06510768, 2.670265, 0, 0.345098, 1, 1,
0.2932686, 0.6646924, -0.5312836, 0, 0.3411765, 1, 1,
0.2936244, -1.297489, 3.032676, 0, 0.3333333, 1, 1,
0.2955068, -1.199939, 2.640394, 0, 0.3294118, 1, 1,
0.2997869, 0.4056346, 0.06844025, 0, 0.3215686, 1, 1,
0.3003128, -0.3037346, 2.207236, 0, 0.3176471, 1, 1,
0.3061101, -0.1600171, 2.370473, 0, 0.3098039, 1, 1,
0.3103407, 0.2996121, 0.4262079, 0, 0.3058824, 1, 1,
0.3117418, 0.9062907, -1.386754, 0, 0.2980392, 1, 1,
0.3158031, 0.6414853, 0.07907175, 0, 0.2901961, 1, 1,
0.3164705, 0.2902547, 0.4918649, 0, 0.2862745, 1, 1,
0.3196642, 0.09225817, 0.03100342, 0, 0.2784314, 1, 1,
0.3264039, 0.7668441, 0.6928464, 0, 0.2745098, 1, 1,
0.3264772, 1.041922, 1.053084, 0, 0.2666667, 1, 1,
0.3270909, 0.2217861, 0.6700039, 0, 0.2627451, 1, 1,
0.3285798, 0.4860669, 1.641579, 0, 0.254902, 1, 1,
0.3316837, 0.2978624, 1.40645, 0, 0.2509804, 1, 1,
0.3354192, -0.9898246, 2.856016, 0, 0.2431373, 1, 1,
0.3386966, 0.04084116, 1.17913, 0, 0.2392157, 1, 1,
0.3424226, 0.4126984, -0.5913461, 0, 0.2313726, 1, 1,
0.3458313, -0.3203274, 2.391656, 0, 0.227451, 1, 1,
0.3462462, 0.007051079, 0.5175889, 0, 0.2196078, 1, 1,
0.3475275, -0.3138376, 2.635851, 0, 0.2156863, 1, 1,
0.3518888, -1.17162, 1.873564, 0, 0.2078431, 1, 1,
0.3521852, 0.8200799, -0.9031772, 0, 0.2039216, 1, 1,
0.3529848, -0.4203636, 0.6932347, 0, 0.1960784, 1, 1,
0.3540286, 0.1012354, -1.666777, 0, 0.1882353, 1, 1,
0.3553776, -1.750832, 2.405221, 0, 0.1843137, 1, 1,
0.3585902, 0.4681967, 0.4544362, 0, 0.1764706, 1, 1,
0.3610627, 0.828207, 1.45358, 0, 0.172549, 1, 1,
0.3619044, -1.005665, 1.825288, 0, 0.1647059, 1, 1,
0.3627747, 1.295437, 1.670305, 0, 0.1607843, 1, 1,
0.3646925, 1.480231, -1.268612, 0, 0.1529412, 1, 1,
0.3651516, 0.1798031, 0.8864506, 0, 0.1490196, 1, 1,
0.3666366, 0.4519134, 0.9597346, 0, 0.1411765, 1, 1,
0.3700389, 1.309515, -1.720852, 0, 0.1372549, 1, 1,
0.3713758, -0.8415172, 2.671366, 0, 0.1294118, 1, 1,
0.3714705, 0.2034766, -0.02953196, 0, 0.1254902, 1, 1,
0.3717411, -0.2916171, 0.5943843, 0, 0.1176471, 1, 1,
0.3747841, 0.8354573, 0.6308022, 0, 0.1137255, 1, 1,
0.3748784, 1.242843, 0.7674453, 0, 0.1058824, 1, 1,
0.3837163, -0.9217927, 3.060144, 0, 0.09803922, 1, 1,
0.3840615, 0.4925544, 0.03074101, 0, 0.09411765, 1, 1,
0.3863971, -0.04826328, 1.852048, 0, 0.08627451, 1, 1,
0.3866942, 0.674985, 1.767183, 0, 0.08235294, 1, 1,
0.3913643, -1.768315, 2.265653, 0, 0.07450981, 1, 1,
0.3945232, 1.180386, 0.4616506, 0, 0.07058824, 1, 1,
0.4037748, 1.574909, 1.196781, 0, 0.0627451, 1, 1,
0.4076611, 0.2387036, 1.494265, 0, 0.05882353, 1, 1,
0.4081949, 0.4591144, 1.202851, 0, 0.05098039, 1, 1,
0.4085843, -0.02425101, 1.439149, 0, 0.04705882, 1, 1,
0.4147943, 0.3402943, 1.603092, 0, 0.03921569, 1, 1,
0.4201987, 0.5849581, -0.5410283, 0, 0.03529412, 1, 1,
0.4203817, -0.2404977, 1.661047, 0, 0.02745098, 1, 1,
0.4241116, 0.9847413, 0.1982862, 0, 0.02352941, 1, 1,
0.4316923, 0.9327711, 1.602841, 0, 0.01568628, 1, 1,
0.4349311, -0.121384, 4.112365, 0, 0.01176471, 1, 1,
0.4361415, -1.234887, 3.413373, 0, 0.003921569, 1, 1,
0.4373902, -0.1531945, 0.8787987, 0.003921569, 0, 1, 1,
0.4455873, 0.1864376, 1.39978, 0.007843138, 0, 1, 1,
0.4474508, -0.4149348, 1.89407, 0.01568628, 0, 1, 1,
0.4484247, -0.3631223, 1.839291, 0.01960784, 0, 1, 1,
0.4496123, 0.8683357, -1.243334, 0.02745098, 0, 1, 1,
0.4503092, 1.187903, 2.027754, 0.03137255, 0, 1, 1,
0.4510942, -0.4578612, 0.1998047, 0.03921569, 0, 1, 1,
0.4530167, -0.2916592, 3.754616, 0.04313726, 0, 1, 1,
0.4541542, 0.8475505, -0.8660452, 0.05098039, 0, 1, 1,
0.4544455, 1.53933, -0.0906697, 0.05490196, 0, 1, 1,
0.456134, 0.4416444, 1.424042, 0.0627451, 0, 1, 1,
0.4602079, -0.3751314, 1.269, 0.06666667, 0, 1, 1,
0.4608609, -1.019423, 1.119721, 0.07450981, 0, 1, 1,
0.4620501, -0.4760712, 3.361936, 0.07843138, 0, 1, 1,
0.464305, -0.167109, 0.1871483, 0.08627451, 0, 1, 1,
0.4659424, 1.59173, 0.7031576, 0.09019608, 0, 1, 1,
0.4700302, -1.151906, 2.221659, 0.09803922, 0, 1, 1,
0.4811102, -1.114384, 1.620752, 0.1058824, 0, 1, 1,
0.482478, -1.116137, 3.085902, 0.1098039, 0, 1, 1,
0.4865789, 0.339321, -0.4128045, 0.1176471, 0, 1, 1,
0.4927993, -0.1949988, 1.895212, 0.1215686, 0, 1, 1,
0.4936131, 1.576245, -0.1327608, 0.1294118, 0, 1, 1,
0.494871, 0.721064, 1.125803, 0.1333333, 0, 1, 1,
0.4958769, 0.2647838, 0.5578958, 0.1411765, 0, 1, 1,
0.5015803, -0.9437277, 2.454896, 0.145098, 0, 1, 1,
0.5016381, 0.9759063, 0.5365497, 0.1529412, 0, 1, 1,
0.5025397, 0.4238169, 0.08494992, 0.1568628, 0, 1, 1,
0.5031625, 0.6689407, 1.036503, 0.1647059, 0, 1, 1,
0.503453, 1.440623, -0.02353773, 0.1686275, 0, 1, 1,
0.5098867, 0.08986231, 2.15677, 0.1764706, 0, 1, 1,
0.5112566, 0.505872, -0.273538, 0.1803922, 0, 1, 1,
0.5113677, -0.2806695, 2.515924, 0.1882353, 0, 1, 1,
0.5130302, -0.953886, 2.047921, 0.1921569, 0, 1, 1,
0.5132701, 1.162132, 0.8434716, 0.2, 0, 1, 1,
0.5167173, -0.8091276, 4.675579, 0.2078431, 0, 1, 1,
0.5168626, -0.5812244, 3.057747, 0.2117647, 0, 1, 1,
0.5177642, -0.6768032, 2.560889, 0.2196078, 0, 1, 1,
0.5218024, -1.026566, 1.271377, 0.2235294, 0, 1, 1,
0.5289644, 2.458727, 0.1152619, 0.2313726, 0, 1, 1,
0.5366572, 1.683411, -1.020902, 0.2352941, 0, 1, 1,
0.538237, -0.7868958, 2.668874, 0.2431373, 0, 1, 1,
0.5395898, -1.016832, 2.012952, 0.2470588, 0, 1, 1,
0.5416806, 0.9086649, -0.1314021, 0.254902, 0, 1, 1,
0.5427727, 0.06880952, 3.335113, 0.2588235, 0, 1, 1,
0.5499522, 0.3281715, 1.452176, 0.2666667, 0, 1, 1,
0.5576642, -0.161783, 1.33779, 0.2705882, 0, 1, 1,
0.5577654, -0.04735444, 1.918411, 0.2784314, 0, 1, 1,
0.5580611, 0.3200419, 1.413294, 0.282353, 0, 1, 1,
0.5614696, 1.207197, 0.6535531, 0.2901961, 0, 1, 1,
0.5620568, 0.937202, 1.280352, 0.2941177, 0, 1, 1,
0.5655491, -0.6878948, 3.250552, 0.3019608, 0, 1, 1,
0.5658889, -0.9519771, 3.631514, 0.3098039, 0, 1, 1,
0.5681022, 1.352906, 0.3851255, 0.3137255, 0, 1, 1,
0.5706998, -1.089818, 3.872499, 0.3215686, 0, 1, 1,
0.5739184, -1.153758, 3.511036, 0.3254902, 0, 1, 1,
0.5793533, -0.1977953, 1.046082, 0.3333333, 0, 1, 1,
0.5816489, -0.5740029, 1.643994, 0.3372549, 0, 1, 1,
0.5843543, 0.09678499, 2.631029, 0.345098, 0, 1, 1,
0.5924706, 0.3196215, 1.917669, 0.3490196, 0, 1, 1,
0.5959002, -1.884598, 2.839394, 0.3568628, 0, 1, 1,
0.596246, -0.7906382, 3.048265, 0.3607843, 0, 1, 1,
0.5988167, 0.7711293, 0.7414479, 0.3686275, 0, 1, 1,
0.5994233, 2.313201, 0.2159251, 0.372549, 0, 1, 1,
0.5998841, 0.4364353, -2.213942, 0.3803922, 0, 1, 1,
0.6071867, 0.7671533, -0.37712, 0.3843137, 0, 1, 1,
0.6082395, 0.1731081, 2.969525, 0.3921569, 0, 1, 1,
0.6082976, 0.9865999, 0.1814397, 0.3960784, 0, 1, 1,
0.6085815, 0.5363237, 1.790115, 0.4039216, 0, 1, 1,
0.6160972, -2.104425, 2.204448, 0.4117647, 0, 1, 1,
0.622712, 0.008710007, 0.6898233, 0.4156863, 0, 1, 1,
0.6251892, -1.642051, 3.047197, 0.4235294, 0, 1, 1,
0.6285307, -0.5898384, 2.758149, 0.427451, 0, 1, 1,
0.6286543, -0.3596149, 1.029324, 0.4352941, 0, 1, 1,
0.6310496, -0.9210312, 2.877899, 0.4392157, 0, 1, 1,
0.6331756, -0.4737568, 1.471897, 0.4470588, 0, 1, 1,
0.6340925, 2.038413, -0.09719899, 0.4509804, 0, 1, 1,
0.6364363, 1.527001, -0.2838338, 0.4588235, 0, 1, 1,
0.6391543, -1.424808, 1.888154, 0.4627451, 0, 1, 1,
0.6405304, 0.1965257, -0.04252707, 0.4705882, 0, 1, 1,
0.6449113, -1.168309, 3.151321, 0.4745098, 0, 1, 1,
0.6496938, 0.1361002, 3.335721, 0.4823529, 0, 1, 1,
0.6575211, -0.5799427, 4.036209, 0.4862745, 0, 1, 1,
0.6585782, -0.445724, 2.557258, 0.4941176, 0, 1, 1,
0.6640675, 0.7110098, 1.067522, 0.5019608, 0, 1, 1,
0.6682374, -0.6322415, 2.29922, 0.5058824, 0, 1, 1,
0.6765888, -1.990357, 3.565994, 0.5137255, 0, 1, 1,
0.6787151, -0.7082839, 3.124626, 0.5176471, 0, 1, 1,
0.6828804, 1.001689, 1.546888, 0.5254902, 0, 1, 1,
0.6871983, 0.292531, 0.9520494, 0.5294118, 0, 1, 1,
0.6883702, 0.3427338, 1.288949, 0.5372549, 0, 1, 1,
0.6894287, 0.599834, -1.582144, 0.5411765, 0, 1, 1,
0.6965164, 1.034518, 2.755163, 0.5490196, 0, 1, 1,
0.6993307, 0.921613, 0.03602677, 0.5529412, 0, 1, 1,
0.6997396, -0.8650975, 0.8044561, 0.5607843, 0, 1, 1,
0.702785, -0.6559637, 2.517693, 0.5647059, 0, 1, 1,
0.7035187, 1.210567, 0.6050573, 0.572549, 0, 1, 1,
0.7043363, -1.043274, 3.839117, 0.5764706, 0, 1, 1,
0.7055001, 1.454715, 0.1702274, 0.5843138, 0, 1, 1,
0.706719, -0.4652694, 3.644817, 0.5882353, 0, 1, 1,
0.7110544, -0.7891874, 1.901067, 0.5960785, 0, 1, 1,
0.7110828, 0.3659506, 0.1479363, 0.6039216, 0, 1, 1,
0.7116224, -0.5661037, 1.443393, 0.6078432, 0, 1, 1,
0.7134419, 0.2231175, 0.1963546, 0.6156863, 0, 1, 1,
0.7136954, 0.05466437, 1.881554, 0.6196079, 0, 1, 1,
0.7150216, 1.838938, 1.079945, 0.627451, 0, 1, 1,
0.7169659, -0.7394409, 1.515756, 0.6313726, 0, 1, 1,
0.7173969, 1.463867, 2.280863, 0.6392157, 0, 1, 1,
0.7196429, -0.1882244, 1.739363, 0.6431373, 0, 1, 1,
0.725094, -0.260348, 2.579054, 0.6509804, 0, 1, 1,
0.734389, -0.2123783, 2.295849, 0.654902, 0, 1, 1,
0.7349213, -0.9527416, 3.798406, 0.6627451, 0, 1, 1,
0.7375965, 0.6430675, 1.376046, 0.6666667, 0, 1, 1,
0.7402204, -0.2038507, 0.7312706, 0.6745098, 0, 1, 1,
0.7421977, 0.2416642, 0.5834309, 0.6784314, 0, 1, 1,
0.7429853, -2.260683, 2.939051, 0.6862745, 0, 1, 1,
0.7440342, 1.682911, 0.9208676, 0.6901961, 0, 1, 1,
0.7444119, -1.245715, 3.281703, 0.6980392, 0, 1, 1,
0.7476337, 0.1136717, 0.4779728, 0.7058824, 0, 1, 1,
0.754441, 0.001507364, 0.8383142, 0.7098039, 0, 1, 1,
0.7576763, 0.1851016, 2.233514, 0.7176471, 0, 1, 1,
0.7634571, -0.3936058, 0.6845193, 0.7215686, 0, 1, 1,
0.7683054, 0.5569116, -0.5575628, 0.7294118, 0, 1, 1,
0.7691302, -0.4080986, 1.434876, 0.7333333, 0, 1, 1,
0.7709017, 0.58798, 0.8253577, 0.7411765, 0, 1, 1,
0.7714805, -0.4750918, 1.687309, 0.7450981, 0, 1, 1,
0.7753917, -1.902222, 1.779725, 0.7529412, 0, 1, 1,
0.7759997, 0.8553473, 0.3737151, 0.7568628, 0, 1, 1,
0.777473, -1.174696, 3.661512, 0.7647059, 0, 1, 1,
0.7930765, 2.304717, 1.169852, 0.7686275, 0, 1, 1,
0.7977128, -0.3072339, 2.544384, 0.7764706, 0, 1, 1,
0.7979627, -1.498536, 4.643247, 0.7803922, 0, 1, 1,
0.8052915, 0.2704383, 1.473662, 0.7882353, 0, 1, 1,
0.8057256, -0.08657119, 3.854075, 0.7921569, 0, 1, 1,
0.8060544, 0.4311347, 3.120893, 0.8, 0, 1, 1,
0.8071804, 0.4459214, 3.154997, 0.8078431, 0, 1, 1,
0.8094905, -0.05539497, 0.2201832, 0.8117647, 0, 1, 1,
0.8157107, 2.321681, 0.8505964, 0.8196079, 0, 1, 1,
0.8177286, -2.110878, 1.843566, 0.8235294, 0, 1, 1,
0.8186152, 0.2275227, 0.5389164, 0.8313726, 0, 1, 1,
0.8337612, -0.2268952, 1.711976, 0.8352941, 0, 1, 1,
0.8368312, 0.05995644, -0.405227, 0.8431373, 0, 1, 1,
0.8375005, 0.08725832, 1.168452, 0.8470588, 0, 1, 1,
0.839487, 0.7547068, 0.6539651, 0.854902, 0, 1, 1,
0.8396506, -0.2470743, 1.986673, 0.8588235, 0, 1, 1,
0.8418882, -0.1271423, 1.558744, 0.8666667, 0, 1, 1,
0.8429759, 0.4339344, 2.983354, 0.8705882, 0, 1, 1,
0.8460788, 0.02603122, 1.316318, 0.8784314, 0, 1, 1,
0.8494507, 1.24195, -0.1588837, 0.8823529, 0, 1, 1,
0.8509716, 0.05838866, 1.966064, 0.8901961, 0, 1, 1,
0.8676573, 0.293179, 2.07678, 0.8941177, 0, 1, 1,
0.8702638, 0.6296008, 1.851188, 0.9019608, 0, 1, 1,
0.8718618, 0.6775554, 2.868364, 0.9098039, 0, 1, 1,
0.8792065, 0.1148164, 1.095727, 0.9137255, 0, 1, 1,
0.8826895, -1.709143, 0.9649844, 0.9215686, 0, 1, 1,
0.8865591, -0.322573, 2.8382, 0.9254902, 0, 1, 1,
0.8936217, 2.203763, -0.2466387, 0.9333333, 0, 1, 1,
0.9069564, 0.522146, 0.3505659, 0.9372549, 0, 1, 1,
0.9131159, 1.038267, 0.1238924, 0.945098, 0, 1, 1,
0.9148908, -1.66356, 2.750504, 0.9490196, 0, 1, 1,
0.9190038, 0.2655926, 1.123481, 0.9568627, 0, 1, 1,
0.9223127, 0.945908, -1.64128, 0.9607843, 0, 1, 1,
0.9225302, -0.08614124, 3.107745, 0.9686275, 0, 1, 1,
0.9234139, 0.6800104, 1.06135, 0.972549, 0, 1, 1,
0.9283533, -1.145295, 0.9392888, 0.9803922, 0, 1, 1,
0.9290546, 0.169043, 1.351197, 0.9843137, 0, 1, 1,
0.9359607, -0.7516109, 1.882401, 0.9921569, 0, 1, 1,
0.9362136, 1.072601, 0.9545131, 0.9960784, 0, 1, 1,
0.9380921, 0.2103797, 1.983452, 1, 0, 0.9960784, 1,
0.938356, -1.219229, 3.561884, 1, 0, 0.9882353, 1,
0.9406284, 1.876655, -1.191832, 1, 0, 0.9843137, 1,
0.9547504, -1.678039, 2.070833, 1, 0, 0.9764706, 1,
0.9568351, -0.07473259, 0.6156648, 1, 0, 0.972549, 1,
0.9649884, 0.9379241, 0.004041044, 1, 0, 0.9647059, 1,
0.9654298, 0.5029002, 1.897787, 1, 0, 0.9607843, 1,
0.9657753, 0.02798243, 1.319612, 1, 0, 0.9529412, 1,
0.9756789, -0.3721514, 2.771757, 1, 0, 0.9490196, 1,
0.9792967, 0.8806211, 0.1391094, 1, 0, 0.9411765, 1,
0.984165, 0.5604903, 1.867831, 1, 0, 0.9372549, 1,
0.9919161, -1.593511, 2.018724, 1, 0, 0.9294118, 1,
0.9958999, -0.2868022, 2.104671, 1, 0, 0.9254902, 1,
0.997526, 0.9819901, 2.306562, 1, 0, 0.9176471, 1,
1.009178, -2.313704, 3.157094, 1, 0, 0.9137255, 1,
1.013762, 0.2447426, 1.240566, 1, 0, 0.9058824, 1,
1.015725, -0.5616728, 2.691563, 1, 0, 0.9019608, 1,
1.017446, 1.837297, -0.3223914, 1, 0, 0.8941177, 1,
1.039532, -2.081233, 1.584971, 1, 0, 0.8862745, 1,
1.040856, -0.4382269, 2.814846, 1, 0, 0.8823529, 1,
1.045274, -1.50062, 3.05368, 1, 0, 0.8745098, 1,
1.045655, 0.1115163, 2.732585, 1, 0, 0.8705882, 1,
1.046584, 0.5252171, 1.212742, 1, 0, 0.8627451, 1,
1.056505, 0.2888048, 1.424939, 1, 0, 0.8588235, 1,
1.060657, -0.1552913, 2.265729, 1, 0, 0.8509804, 1,
1.063553, 2.095977, -0.1666523, 1, 0, 0.8470588, 1,
1.065455, -1.123109, 2.085635, 1, 0, 0.8392157, 1,
1.080478, -0.9314649, 1.382074, 1, 0, 0.8352941, 1,
1.082074, -1.301528, 1.884172, 1, 0, 0.827451, 1,
1.082902, -0.0530996, 0.2394573, 1, 0, 0.8235294, 1,
1.087202, -0.4535775, 0.4166151, 1, 0, 0.8156863, 1,
1.0881, 1.002819, 1.025285, 1, 0, 0.8117647, 1,
1.089639, -2.73537, 2.870787, 1, 0, 0.8039216, 1,
1.096269, 0.1620575, 0.7869716, 1, 0, 0.7960784, 1,
1.101097, 0.8685142, 0.340602, 1, 0, 0.7921569, 1,
1.101596, 1.117748, 0.9571682, 1, 0, 0.7843137, 1,
1.10371, -0.1644205, 1.898562, 1, 0, 0.7803922, 1,
1.103786, 0.6574458, -0.4463734, 1, 0, 0.772549, 1,
1.10466, -0.8618334, -0.3465618, 1, 0, 0.7686275, 1,
1.108353, -1.404721, 2.315088, 1, 0, 0.7607843, 1,
1.110555, -0.6832277, 2.459082, 1, 0, 0.7568628, 1,
1.118799, -0.09157687, 0.5418025, 1, 0, 0.7490196, 1,
1.119573, -0.7078125, 2.863094, 1, 0, 0.7450981, 1,
1.122229, 0.8184208, 0.5996821, 1, 0, 0.7372549, 1,
1.130882, -0.3520844, 1.463511, 1, 0, 0.7333333, 1,
1.131805, -0.5507545, 2.291181, 1, 0, 0.7254902, 1,
1.132418, 0.8040512, 0.5936105, 1, 0, 0.7215686, 1,
1.132806, -0.7253093, 0.1172905, 1, 0, 0.7137255, 1,
1.132874, 0.0005877006, 3.311116, 1, 0, 0.7098039, 1,
1.137736, 0.9365846, 2.671103, 1, 0, 0.7019608, 1,
1.13997, -0.1420377, 2.899886, 1, 0, 0.6941177, 1,
1.15084, -1.527539, 1.143027, 1, 0, 0.6901961, 1,
1.152681, 0.6963211, 0.7873105, 1, 0, 0.682353, 1,
1.154353, 0.6277922, 1.456973, 1, 0, 0.6784314, 1,
1.15646, -1.461939, 1.326366, 1, 0, 0.6705883, 1,
1.161427, -0.359428, 3.161551, 1, 0, 0.6666667, 1,
1.164533, 0.5218686, 1.317255, 1, 0, 0.6588235, 1,
1.165159, 0.2538179, 0.7198491, 1, 0, 0.654902, 1,
1.178724, 0.1844873, 0.8194071, 1, 0, 0.6470588, 1,
1.182053, -0.9481898, 1.054195, 1, 0, 0.6431373, 1,
1.183123, -0.2469409, 1.130045, 1, 0, 0.6352941, 1,
1.18679, 0.7220204, 3.28251, 1, 0, 0.6313726, 1,
1.194508, 1.4774, 0.9450013, 1, 0, 0.6235294, 1,
1.208126, 2.054749, 0.8903325, 1, 0, 0.6196079, 1,
1.211641, 0.2923989, 2.033494, 1, 0, 0.6117647, 1,
1.213003, 0.5666221, 1.964121, 1, 0, 0.6078432, 1,
1.221015, -1.030071, 4.320494, 1, 0, 0.6, 1,
1.226674, 0.1422628, 3.008549, 1, 0, 0.5921569, 1,
1.232288, -0.6316567, 2.295401, 1, 0, 0.5882353, 1,
1.238718, 1.070507, 0.9702832, 1, 0, 0.5803922, 1,
1.256744, -0.6520184, 1.906692, 1, 0, 0.5764706, 1,
1.2568, -0.6882955, 3.406637, 1, 0, 0.5686275, 1,
1.262385, 1.4637, 0.9131178, 1, 0, 0.5647059, 1,
1.266218, -0.001088338, 3.081435, 1, 0, 0.5568628, 1,
1.267176, -2.41308, 2.60716, 1, 0, 0.5529412, 1,
1.26738, -0.5131867, 1.079178, 1, 0, 0.5450981, 1,
1.26766, -0.3627057, 2.130803, 1, 0, 0.5411765, 1,
1.269099, -1.879504, 3.070984, 1, 0, 0.5333334, 1,
1.274292, -0.1497155, 2.930981, 1, 0, 0.5294118, 1,
1.278389, -0.7614823, 0.1624148, 1, 0, 0.5215687, 1,
1.282868, 1.330261, -0.07265063, 1, 0, 0.5176471, 1,
1.285606, -1.112946, 1.743095, 1, 0, 0.509804, 1,
1.305993, -0.7550835, 2.295962, 1, 0, 0.5058824, 1,
1.309054, -0.4944841, 3.789592, 1, 0, 0.4980392, 1,
1.311908, 0.224577, 3.281348, 1, 0, 0.4901961, 1,
1.312363, -1.333782, 2.909272, 1, 0, 0.4862745, 1,
1.335101, -0.2870214, 2.520261, 1, 0, 0.4784314, 1,
1.33789, -1.084302, 2.53528, 1, 0, 0.4745098, 1,
1.3657, 1.212199, 1.423996, 1, 0, 0.4666667, 1,
1.366614, -1.676006, 1.856134, 1, 0, 0.4627451, 1,
1.366825, -1.534644, 0.9518706, 1, 0, 0.454902, 1,
1.372993, 1.982192, 1.180301, 1, 0, 0.4509804, 1,
1.386271, 0.5888028, 0.6433424, 1, 0, 0.4431373, 1,
1.388352, -1.487391, 3.642694, 1, 0, 0.4392157, 1,
1.394047, -0.3189119, 0.1972448, 1, 0, 0.4313726, 1,
1.3991, -0.7015332, 2.396685, 1, 0, 0.427451, 1,
1.403878, 0.8430403, 0.8539238, 1, 0, 0.4196078, 1,
1.408721, 1.032382, -0.4627752, 1, 0, 0.4156863, 1,
1.408731, 1.109995, -0.3650246, 1, 0, 0.4078431, 1,
1.415351, 1.318146, -0.6681679, 1, 0, 0.4039216, 1,
1.415605, 1.393356, 0.4505925, 1, 0, 0.3960784, 1,
1.435466, -0.804447, 2.5851, 1, 0, 0.3882353, 1,
1.440605, 0.738389, 1.733999, 1, 0, 0.3843137, 1,
1.46592, 0.4980577, 2.743298, 1, 0, 0.3764706, 1,
1.471672, 0.1656329, 1.568324, 1, 0, 0.372549, 1,
1.473767, 0.3941347, 1.602213, 1, 0, 0.3647059, 1,
1.475425, -0.2362195, 0.5187334, 1, 0, 0.3607843, 1,
1.491419, -1.203074, 2.646058, 1, 0, 0.3529412, 1,
1.508509, 0.8152155, 0.7001544, 1, 0, 0.3490196, 1,
1.509774, 1.137632, 1.211649, 1, 0, 0.3411765, 1,
1.514931, -0.8433822, 2.260566, 1, 0, 0.3372549, 1,
1.521439, -0.2355497, 1.353847, 1, 0, 0.3294118, 1,
1.528103, 0.2667525, 1.887525, 1, 0, 0.3254902, 1,
1.533393, -0.1139418, 1.938336, 1, 0, 0.3176471, 1,
1.534885, -1.391172, 2.349473, 1, 0, 0.3137255, 1,
1.53613, 1.083081, 0.8628962, 1, 0, 0.3058824, 1,
1.554829, -1.157742, 4.580402, 1, 0, 0.2980392, 1,
1.557446, -0.2254773, 0.9656892, 1, 0, 0.2941177, 1,
1.570172, 0.4213658, 1.857475, 1, 0, 0.2862745, 1,
1.572264, -0.7879232, 2.715167, 1, 0, 0.282353, 1,
1.574629, 0.1448996, 1.466235, 1, 0, 0.2745098, 1,
1.578123, -1.685678, 2.570097, 1, 0, 0.2705882, 1,
1.630525, 0.3466141, 1.625999, 1, 0, 0.2627451, 1,
1.637665, -0.5117497, 2.578622, 1, 0, 0.2588235, 1,
1.639785, 0.9229506, -0.1227173, 1, 0, 0.2509804, 1,
1.643624, 0.1782851, 1.534681, 1, 0, 0.2470588, 1,
1.649494, 1.364534, 1.413924, 1, 0, 0.2392157, 1,
1.665343, -1.462347, 2.644019, 1, 0, 0.2352941, 1,
1.689033, -2.189482, 2.997353, 1, 0, 0.227451, 1,
1.691282, 0.4162944, 2.449788, 1, 0, 0.2235294, 1,
1.72197, 0.8661675, 0.9400871, 1, 0, 0.2156863, 1,
1.7683, -0.120688, 1.583108, 1, 0, 0.2117647, 1,
1.774104, -0.5724435, 2.503326, 1, 0, 0.2039216, 1,
1.779962, 1.514011, 0.67263, 1, 0, 0.1960784, 1,
1.790707, 0.6933085, 0.8106297, 1, 0, 0.1921569, 1,
1.809803, -1.021515, 1.649374, 1, 0, 0.1843137, 1,
1.82621, -0.4596204, 0.5800853, 1, 0, 0.1803922, 1,
1.845048, -0.0284323, 2.502053, 1, 0, 0.172549, 1,
1.847285, -1.357314, 2.253902, 1, 0, 0.1686275, 1,
1.857234, -0.736429, 2.785781, 1, 0, 0.1607843, 1,
1.862259, -0.303499, 2.935426, 1, 0, 0.1568628, 1,
1.862388, 0.02359665, 2.204444, 1, 0, 0.1490196, 1,
1.892514, 0.7804369, 0.4677495, 1, 0, 0.145098, 1,
1.897003, 0.6878576, 1.228357, 1, 0, 0.1372549, 1,
1.903131, 0.3000535, 1.452217, 1, 0, 0.1333333, 1,
1.905646, 1.534187, 1.337197, 1, 0, 0.1254902, 1,
1.98176, -0.2327839, 1.905342, 1, 0, 0.1215686, 1,
1.998759, -0.004530159, 1.353321, 1, 0, 0.1137255, 1,
2.012947, -0.2655117, 1.537803, 1, 0, 0.1098039, 1,
2.030143, -0.6977417, 2.068443, 1, 0, 0.1019608, 1,
2.077277, 0.1717622, 3.451651, 1, 0, 0.09411765, 1,
2.131921, -1.672516, 2.443255, 1, 0, 0.09019608, 1,
2.146974, -1.087635, 3.230496, 1, 0, 0.08235294, 1,
2.162101, 0.382334, 3.652826, 1, 0, 0.07843138, 1,
2.167344, -0.06103425, -0.1749236, 1, 0, 0.07058824, 1,
2.193309, 1.493341, 2.082616, 1, 0, 0.06666667, 1,
2.261561, 1.953856, 1.21039, 1, 0, 0.05882353, 1,
2.309831, 0.1991966, -0.6789976, 1, 0, 0.05490196, 1,
2.407761, -0.6582388, 2.216208, 1, 0, 0.04705882, 1,
2.427847, -2.511097, 2.031001, 1, 0, 0.04313726, 1,
2.518413, -2.455898, 1.293228, 1, 0, 0.03529412, 1,
2.705612, 0.9090549, 0.9038498, 1, 0, 0.03137255, 1,
2.860464, -1.270007, 3.085156, 1, 0, 0.02352941, 1,
2.878869, 0.9415641, 2.059629, 1, 0, 0.01960784, 1,
3.074429, 0.16471, 0.5509384, 1, 0, 0.01176471, 1,
3.128969, -0.3017367, 3.182746, 1, 0, 0.007843138, 1
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
0.1377063, -3.944232, -6.071485, 0, -0.5, 0.5, 0.5,
0.1377063, -3.944232, -6.071485, 1, -0.5, 0.5, 0.5,
0.1377063, -3.944232, -6.071485, 1, 1.5, 0.5, 0.5,
0.1377063, -3.944232, -6.071485, 0, 1.5, 0.5, 0.5
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
-3.867595, -0.1177553, -6.071485, 0, -0.5, 0.5, 0.5,
-3.867595, -0.1177553, -6.071485, 1, -0.5, 0.5, 0.5,
-3.867595, -0.1177553, -6.071485, 1, 1.5, 0.5, 0.5,
-3.867595, -0.1177553, -6.071485, 0, 1.5, 0.5, 0.5
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
-3.867595, -3.944232, 0.5050044, 0, -0.5, 0.5, 0.5,
-3.867595, -3.944232, 0.5050044, 1, -0.5, 0.5, 0.5,
-3.867595, -3.944232, 0.5050044, 1, 1.5, 0.5, 0.5,
-3.867595, -3.944232, 0.5050044, 0, 1.5, 0.5, 0.5
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
-2, -3.061199, -4.553833,
3, -3.061199, -4.553833,
-2, -3.061199, -4.553833,
-2, -3.208371, -4.806775,
-1, -3.061199, -4.553833,
-1, -3.208371, -4.806775,
0, -3.061199, -4.553833,
0, -3.208371, -4.806775,
1, -3.061199, -4.553833,
1, -3.208371, -4.806775,
2, -3.061199, -4.553833,
2, -3.208371, -4.806775,
3, -3.061199, -4.553833,
3, -3.208371, -4.806775
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
-2, -3.502716, -5.312659, 0, -0.5, 0.5, 0.5,
-2, -3.502716, -5.312659, 1, -0.5, 0.5, 0.5,
-2, -3.502716, -5.312659, 1, 1.5, 0.5, 0.5,
-2, -3.502716, -5.312659, 0, 1.5, 0.5, 0.5,
-1, -3.502716, -5.312659, 0, -0.5, 0.5, 0.5,
-1, -3.502716, -5.312659, 1, -0.5, 0.5, 0.5,
-1, -3.502716, -5.312659, 1, 1.5, 0.5, 0.5,
-1, -3.502716, -5.312659, 0, 1.5, 0.5, 0.5,
0, -3.502716, -5.312659, 0, -0.5, 0.5, 0.5,
0, -3.502716, -5.312659, 1, -0.5, 0.5, 0.5,
0, -3.502716, -5.312659, 1, 1.5, 0.5, 0.5,
0, -3.502716, -5.312659, 0, 1.5, 0.5, 0.5,
1, -3.502716, -5.312659, 0, -0.5, 0.5, 0.5,
1, -3.502716, -5.312659, 1, -0.5, 0.5, 0.5,
1, -3.502716, -5.312659, 1, 1.5, 0.5, 0.5,
1, -3.502716, -5.312659, 0, 1.5, 0.5, 0.5,
2, -3.502716, -5.312659, 0, -0.5, 0.5, 0.5,
2, -3.502716, -5.312659, 1, -0.5, 0.5, 0.5,
2, -3.502716, -5.312659, 1, 1.5, 0.5, 0.5,
2, -3.502716, -5.312659, 0, 1.5, 0.5, 0.5,
3, -3.502716, -5.312659, 0, -0.5, 0.5, 0.5,
3, -3.502716, -5.312659, 1, -0.5, 0.5, 0.5,
3, -3.502716, -5.312659, 1, 1.5, 0.5, 0.5,
3, -3.502716, -5.312659, 0, 1.5, 0.5, 0.5
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
-2.943295, -2, -4.553833,
-2.943295, 2, -4.553833,
-2.943295, -2, -4.553833,
-3.097345, -2, -4.806775,
-2.943295, -1, -4.553833,
-3.097345, -1, -4.806775,
-2.943295, 0, -4.553833,
-3.097345, 0, -4.806775,
-2.943295, 1, -4.553833,
-3.097345, 1, -4.806775,
-2.943295, 2, -4.553833,
-3.097345, 2, -4.806775
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
-3.405445, -2, -5.312659, 0, -0.5, 0.5, 0.5,
-3.405445, -2, -5.312659, 1, -0.5, 0.5, 0.5,
-3.405445, -2, -5.312659, 1, 1.5, 0.5, 0.5,
-3.405445, -2, -5.312659, 0, 1.5, 0.5, 0.5,
-3.405445, -1, -5.312659, 0, -0.5, 0.5, 0.5,
-3.405445, -1, -5.312659, 1, -0.5, 0.5, 0.5,
-3.405445, -1, -5.312659, 1, 1.5, 0.5, 0.5,
-3.405445, -1, -5.312659, 0, 1.5, 0.5, 0.5,
-3.405445, 0, -5.312659, 0, -0.5, 0.5, 0.5,
-3.405445, 0, -5.312659, 1, -0.5, 0.5, 0.5,
-3.405445, 0, -5.312659, 1, 1.5, 0.5, 0.5,
-3.405445, 0, -5.312659, 0, 1.5, 0.5, 0.5,
-3.405445, 1, -5.312659, 0, -0.5, 0.5, 0.5,
-3.405445, 1, -5.312659, 1, -0.5, 0.5, 0.5,
-3.405445, 1, -5.312659, 1, 1.5, 0.5, 0.5,
-3.405445, 1, -5.312659, 0, 1.5, 0.5, 0.5,
-3.405445, 2, -5.312659, 0, -0.5, 0.5, 0.5,
-3.405445, 2, -5.312659, 1, -0.5, 0.5, 0.5,
-3.405445, 2, -5.312659, 1, 1.5, 0.5, 0.5,
-3.405445, 2, -5.312659, 0, 1.5, 0.5, 0.5
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
-2.943295, -3.061199, -4,
-2.943295, -3.061199, 4,
-2.943295, -3.061199, -4,
-3.097345, -3.208371, -4,
-2.943295, -3.061199, -2,
-3.097345, -3.208371, -2,
-2.943295, -3.061199, 0,
-3.097345, -3.208371, 0,
-2.943295, -3.061199, 2,
-3.097345, -3.208371, 2,
-2.943295, -3.061199, 4,
-3.097345, -3.208371, 4
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
-3.405445, -3.502716, -4, 0, -0.5, 0.5, 0.5,
-3.405445, -3.502716, -4, 1, -0.5, 0.5, 0.5,
-3.405445, -3.502716, -4, 1, 1.5, 0.5, 0.5,
-3.405445, -3.502716, -4, 0, 1.5, 0.5, 0.5,
-3.405445, -3.502716, -2, 0, -0.5, 0.5, 0.5,
-3.405445, -3.502716, -2, 1, -0.5, 0.5, 0.5,
-3.405445, -3.502716, -2, 1, 1.5, 0.5, 0.5,
-3.405445, -3.502716, -2, 0, 1.5, 0.5, 0.5,
-3.405445, -3.502716, 0, 0, -0.5, 0.5, 0.5,
-3.405445, -3.502716, 0, 1, -0.5, 0.5, 0.5,
-3.405445, -3.502716, 0, 1, 1.5, 0.5, 0.5,
-3.405445, -3.502716, 0, 0, 1.5, 0.5, 0.5,
-3.405445, -3.502716, 2, 0, -0.5, 0.5, 0.5,
-3.405445, -3.502716, 2, 1, -0.5, 0.5, 0.5,
-3.405445, -3.502716, 2, 1, 1.5, 0.5, 0.5,
-3.405445, -3.502716, 2, 0, 1.5, 0.5, 0.5,
-3.405445, -3.502716, 4, 0, -0.5, 0.5, 0.5,
-3.405445, -3.502716, 4, 1, -0.5, 0.5, 0.5,
-3.405445, -3.502716, 4, 1, 1.5, 0.5, 0.5,
-3.405445, -3.502716, 4, 0, 1.5, 0.5, 0.5
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
-2.943295, -3.061199, -4.553833,
-2.943295, 2.825688, -4.553833,
-2.943295, -3.061199, 5.563842,
-2.943295, 2.825688, 5.563842,
-2.943295, -3.061199, -4.553833,
-2.943295, -3.061199, 5.563842,
-2.943295, 2.825688, -4.553833,
-2.943295, 2.825688, 5.563842,
-2.943295, -3.061199, -4.553833,
3.218707, -3.061199, -4.553833,
-2.943295, -3.061199, 5.563842,
3.218707, -3.061199, 5.563842,
-2.943295, 2.825688, -4.553833,
3.218707, 2.825688, -4.553833,
-2.943295, 2.825688, 5.563842,
3.218707, 2.825688, 5.563842,
3.218707, -3.061199, -4.553833,
3.218707, 2.825688, -4.553833,
3.218707, -3.061199, 5.563842,
3.218707, 2.825688, 5.563842,
3.218707, -3.061199, -4.553833,
3.218707, -3.061199, 5.563842,
3.218707, 2.825688, -4.553833,
3.218707, 2.825688, 5.563842
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
var radius = 7.063759;
var distance = 31.42746;
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
mvMatrix.translate( -0.1377063, 0.1177553, -0.5050044 );
mvMatrix.scale( 1.239447, 1.297371, 0.7548646 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -31.42746);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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
ethanimidamide<-read.table("ethanimidamide.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethanimidamide$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethanimidamide' not found
```

```r
y<-ethanimidamide$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethanimidamide' not found
```

```r
z<-ethanimidamide$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethanimidamide' not found
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
-2.853557, -0.5833464, -2.803847, 0, 0, 1, 1, 1,
-2.835217, -0.04945817, -1.735577, 1, 0, 0, 1, 1,
-2.756135, 0.104592, -1.547807, 1, 0, 0, 1, 1,
-2.644516, -0.4893136, -2.670731, 1, 0, 0, 1, 1,
-2.621519, 0.2500384, -2.159336, 1, 0, 0, 1, 1,
-2.366983, -0.7116003, -0.5442758, 1, 0, 0, 1, 1,
-2.286191, 0.4808607, -1.193704, 0, 0, 0, 1, 1,
-2.237618, -0.2394372, -1.354756, 0, 0, 0, 1, 1,
-2.23725, -0.4113368, -1.244398, 0, 0, 0, 1, 1,
-2.220194, -0.7100624, -2.351988, 0, 0, 0, 1, 1,
-2.212137, 0.870466, -0.3978407, 0, 0, 0, 1, 1,
-2.156629, 1.784662, 0.8822572, 0, 0, 0, 1, 1,
-2.137279, 0.3832448, -2.076247, 0, 0, 0, 1, 1,
-2.12892, -0.717001, -2.299893, 1, 1, 1, 1, 1,
-2.09134, -0.8057392, -1.206871, 1, 1, 1, 1, 1,
-2.044285, -0.6568077, -1.75798, 1, 1, 1, 1, 1,
-2.02792, -1.219082, -0.9681453, 1, 1, 1, 1, 1,
-2.011539, -0.1480643, -1.973556, 1, 1, 1, 1, 1,
-1.992385, 1.109744, -2.873145, 1, 1, 1, 1, 1,
-1.956903, -1.91273, -1.258539, 1, 1, 1, 1, 1,
-1.952296, 0.8299246, -2.343781, 1, 1, 1, 1, 1,
-1.914747, -0.8034303, -3.002066, 1, 1, 1, 1, 1,
-1.900017, 0.2019922, -1.16012, 1, 1, 1, 1, 1,
-1.868168, 1.067022, -0.3341133, 1, 1, 1, 1, 1,
-1.861224, 0.5429217, 0.2638565, 1, 1, 1, 1, 1,
-1.85106, 0.005068373, -2.437079, 1, 1, 1, 1, 1,
-1.837135, -0.6988637, -0.4144689, 1, 1, 1, 1, 1,
-1.801855, -1.683843, -2.60453, 1, 1, 1, 1, 1,
-1.792466, -1.060306, -1.254412, 0, 0, 1, 1, 1,
-1.78219, 1.45841, -1.271566, 1, 0, 0, 1, 1,
-1.77723, 0.1698555, -3.185461, 1, 0, 0, 1, 1,
-1.769861, 1.882117, 0.9342158, 1, 0, 0, 1, 1,
-1.767299, 1.057518, -0.1642612, 1, 0, 0, 1, 1,
-1.747765, -1.327088, -1.565484, 1, 0, 0, 1, 1,
-1.740559, -0.7640083, -3.082155, 0, 0, 0, 1, 1,
-1.725779, -0.9520583, -2.84802, 0, 0, 0, 1, 1,
-1.689541, -1.438397, -2.603551, 0, 0, 0, 1, 1,
-1.687127, -1.669211, -3.511964, 0, 0, 0, 1, 1,
-1.683318, 0.4944361, -1.399151, 0, 0, 0, 1, 1,
-1.681543, 0.2121831, -0.952427, 0, 0, 0, 1, 1,
-1.676292, 1.020717, -1.747312, 0, 0, 0, 1, 1,
-1.67267, -0.4072672, -1.169519, 1, 1, 1, 1, 1,
-1.663509, -0.1701188, -3.321317, 1, 1, 1, 1, 1,
-1.66007, -0.5828934, -0.6989082, 1, 1, 1, 1, 1,
-1.618148, 0.2423396, -0.8140628, 1, 1, 1, 1, 1,
-1.58356, -1.754609, -3.605134, 1, 1, 1, 1, 1,
-1.581889, -0.02429036, -0.9668595, 1, 1, 1, 1, 1,
-1.56658, -0.1631334, -1.794561, 1, 1, 1, 1, 1,
-1.556661, 0.9750162, -1.908952, 1, 1, 1, 1, 1,
-1.551307, -0.6998582, -2.583473, 1, 1, 1, 1, 1,
-1.548199, 1.686319, 1.074796, 1, 1, 1, 1, 1,
-1.547118, 1.246013, -1.141621, 1, 1, 1, 1, 1,
-1.545018, -0.8906736, -1.906128, 1, 1, 1, 1, 1,
-1.54439, 1.030326, 0.3891033, 1, 1, 1, 1, 1,
-1.543045, -0.4940614, -1.946493, 1, 1, 1, 1, 1,
-1.540587, -0.225552, -0.8796466, 1, 1, 1, 1, 1,
-1.539884, 0.3901071, -1.787286, 0, 0, 1, 1, 1,
-1.53412, 1.115895, -0.8090095, 1, 0, 0, 1, 1,
-1.532062, 0.4467656, -2.679355, 1, 0, 0, 1, 1,
-1.528817, 0.1737486, -0.1465258, 1, 0, 0, 1, 1,
-1.515226, 0.2057254, -0.0006533012, 1, 0, 0, 1, 1,
-1.509938, -1.049401, -2.924258, 1, 0, 0, 1, 1,
-1.509801, 1.359195, 0.03335868, 0, 0, 0, 1, 1,
-1.505212, 0.5933083, -0.1153944, 0, 0, 0, 1, 1,
-1.500712, -0.09666722, -1.484486, 0, 0, 0, 1, 1,
-1.491301, 0.3441973, -1.801293, 0, 0, 0, 1, 1,
-1.466483, -0.8386027, -2.360697, 0, 0, 0, 1, 1,
-1.458929, -1.703978, -2.852173, 0, 0, 0, 1, 1,
-1.453906, -0.3095988, -1.743672, 0, 0, 0, 1, 1,
-1.453719, -2.189938, -2.67354, 1, 1, 1, 1, 1,
-1.44114, 0.1877431, -0.7843202, 1, 1, 1, 1, 1,
-1.435203, 1.456602, -0.8335711, 1, 1, 1, 1, 1,
-1.41962, 0.6407475, -3.941376, 1, 1, 1, 1, 1,
-1.409234, -0.5291566, -2.795243, 1, 1, 1, 1, 1,
-1.400174, -0.6662185, -2.788773, 1, 1, 1, 1, 1,
-1.394481, 2.683952, 0.5803215, 1, 1, 1, 1, 1,
-1.391441, -0.653385, -1.630513, 1, 1, 1, 1, 1,
-1.386961, -0.7633184, -3.256117, 1, 1, 1, 1, 1,
-1.38523, 0.786382, -1.014861, 1, 1, 1, 1, 1,
-1.369644, -0.07726771, -0.129266, 1, 1, 1, 1, 1,
-1.361845, -1.686518, -2.94015, 1, 1, 1, 1, 1,
-1.359778, 0.00965512, -0.3673177, 1, 1, 1, 1, 1,
-1.351359, -0.7786313, -0.7077466, 1, 1, 1, 1, 1,
-1.347647, 0.4691441, -0.5675449, 1, 1, 1, 1, 1,
-1.344474, 0.6428722, 0.2428691, 0, 0, 1, 1, 1,
-1.333718, -0.2744792, -1.59457, 1, 0, 0, 1, 1,
-1.330151, -0.5510472, -0.9804892, 1, 0, 0, 1, 1,
-1.322583, 0.3088115, -2.0701, 1, 0, 0, 1, 1,
-1.314595, -1.076134, -2.138412, 1, 0, 0, 1, 1,
-1.313459, -0.2543761, -0.6104804, 1, 0, 0, 1, 1,
-1.313363, -0.740267, -2.467239, 0, 0, 0, 1, 1,
-1.311406, -0.7196124, -2.6612, 0, 0, 0, 1, 1,
-1.294446, 0.4551831, -1.074641, 0, 0, 0, 1, 1,
-1.289985, -0.2033252, -1.09957, 0, 0, 0, 1, 1,
-1.289009, -1.484071, -3.323379, 0, 0, 0, 1, 1,
-1.286969, 0.3957216, -0.1844449, 0, 0, 0, 1, 1,
-1.283096, 0.750155, -0.8503888, 0, 0, 0, 1, 1,
-1.28203, 0.05392772, -2.112735, 1, 1, 1, 1, 1,
-1.269615, 0.4495686, -0.7976925, 1, 1, 1, 1, 1,
-1.268812, 0.6316125, -0.01411294, 1, 1, 1, 1, 1,
-1.264971, -1.528441, -3.044771, 1, 1, 1, 1, 1,
-1.257882, 0.8169684, -0.4849875, 1, 1, 1, 1, 1,
-1.233291, -1.751976, -1.654156, 1, 1, 1, 1, 1,
-1.221392, -0.7248829, -1.912708, 1, 1, 1, 1, 1,
-1.215072, -0.2963309, -0.1560228, 1, 1, 1, 1, 1,
-1.201352, 0.5326778, -2.739414, 1, 1, 1, 1, 1,
-1.195217, -0.4893022, -0.04520351, 1, 1, 1, 1, 1,
-1.193161, -1.262437, -1.863706, 1, 1, 1, 1, 1,
-1.190172, 0.07435784, -1.114358, 1, 1, 1, 1, 1,
-1.186991, -1.486738, -2.383599, 1, 1, 1, 1, 1,
-1.183019, -0.06767258, -0.1029492, 1, 1, 1, 1, 1,
-1.178143, 0.221306, -0.9848189, 1, 1, 1, 1, 1,
-1.17442, 0.7457945, -2.119016, 0, 0, 1, 1, 1,
-1.1705, -0.4770279, -2.433265, 1, 0, 0, 1, 1,
-1.16738, -0.8552272, -1.377368, 1, 0, 0, 1, 1,
-1.163781, -0.2191691, -3.370172, 1, 0, 0, 1, 1,
-1.155757, 0.740572, -1.767901, 1, 0, 0, 1, 1,
-1.143401, -0.3598078, -3.317187, 1, 0, 0, 1, 1,
-1.140342, -0.285659, -1.200882, 0, 0, 0, 1, 1,
-1.136601, 0.831527, -0.4191756, 0, 0, 0, 1, 1,
-1.134481, -0.5417941, 0.1668156, 0, 0, 0, 1, 1,
-1.130893, 0.1926922, -1.450944, 0, 0, 0, 1, 1,
-1.130884, 0.6626173, -3.3574, 0, 0, 0, 1, 1,
-1.127298, 0.3727895, -2.622495, 0, 0, 0, 1, 1,
-1.115733, 1.124968, -0.4383599, 0, 0, 0, 1, 1,
-1.112399, 0.6342501, 0.01306684, 1, 1, 1, 1, 1,
-1.111995, -0.272738, -1.381505, 1, 1, 1, 1, 1,
-1.111881, 0.4507022, -1.217265, 1, 1, 1, 1, 1,
-1.094266, -1.062973, -2.868666, 1, 1, 1, 1, 1,
-1.093356, 0.5578759, -0.3237822, 1, 1, 1, 1, 1,
-1.09, 0.5216933, -1.432226, 1, 1, 1, 1, 1,
-1.089223, 0.6058499, -0.2375913, 1, 1, 1, 1, 1,
-1.08896, -0.9116407, -1.871648, 1, 1, 1, 1, 1,
-1.088111, -1.41976, -1.354189, 1, 1, 1, 1, 1,
-1.087433, -1.100984, -1.661447, 1, 1, 1, 1, 1,
-1.086651, 0.7517491, -1.714215, 1, 1, 1, 1, 1,
-1.084175, -0.8413394, -1.44587, 1, 1, 1, 1, 1,
-1.079317, -0.1203192, -1.516791, 1, 1, 1, 1, 1,
-1.074919, -0.2149266, -1.037117, 1, 1, 1, 1, 1,
-1.069439, -0.9734913, -1.371613, 1, 1, 1, 1, 1,
-1.067907, 0.5977811, -0.857555, 0, 0, 1, 1, 1,
-1.062337, 1.457703, -0.979876, 1, 0, 0, 1, 1,
-1.057812, 0.3297112, -0.8151105, 1, 0, 0, 1, 1,
-1.046832, 1.040556, -0.5138317, 1, 0, 0, 1, 1,
-1.045721, -1.109663, -3.26176, 1, 0, 0, 1, 1,
-1.0456, 1.44923, -0.5243165, 1, 0, 0, 1, 1,
-1.045339, -0.143517, -3.826032, 0, 0, 0, 1, 1,
-1.039875, 1.213665, 0.09384853, 0, 0, 0, 1, 1,
-1.039697, 1.596803, 0.9696358, 0, 0, 0, 1, 1,
-1.03937, -0.1011079, -2.54332, 0, 0, 0, 1, 1,
-1.039208, -1.105975, -2.548299, 0, 0, 0, 1, 1,
-1.034865, -0.7640074, -1.075713, 0, 0, 0, 1, 1,
-1.034768, 1.638447, -2.434634, 0, 0, 0, 1, 1,
-1.03334, 0.8809548, -0.8134164, 1, 1, 1, 1, 1,
-1.031355, 1.190759, 0.05811279, 1, 1, 1, 1, 1,
-1.028173, 0.03402635, -2.042043, 1, 1, 1, 1, 1,
-1.02625, -0.1440817, -0.2996489, 1, 1, 1, 1, 1,
-1.024365, -0.6945224, -3.182966, 1, 1, 1, 1, 1,
-1.01957, -0.3582731, -2.706569, 1, 1, 1, 1, 1,
-1.019294, 1.57598, -0.6084059, 1, 1, 1, 1, 1,
-1.019217, -0.501815, -0.4666334, 1, 1, 1, 1, 1,
-1.018365, -0.3545877, -1.877131, 1, 1, 1, 1, 1,
-1.01724, 1.524708, 0.5286633, 1, 1, 1, 1, 1,
-1.014249, 0.6169692, -1.746846, 1, 1, 1, 1, 1,
-1.00592, 1.388735, -2.680292, 1, 1, 1, 1, 1,
-1.003655, -0.5841569, -0.7190259, 1, 1, 1, 1, 1,
-0.990932, 0.7735442, -1.348007, 1, 1, 1, 1, 1,
-0.9909218, -1.957792, -3.252457, 1, 1, 1, 1, 1,
-0.9901013, 0.6959285, -0.9837195, 0, 0, 1, 1, 1,
-0.9807468, 0.07987691, -2.881977, 1, 0, 0, 1, 1,
-0.9792848, 1.298796, -1.4572, 1, 0, 0, 1, 1,
-0.9781371, -0.38594, -1.691713, 1, 0, 0, 1, 1,
-0.9778835, -0.7989946, -3.073472, 1, 0, 0, 1, 1,
-0.9676259, 0.295241, -1.276662, 1, 0, 0, 1, 1,
-0.9648217, -0.413739, -1.611503, 0, 0, 0, 1, 1,
-0.9565875, -0.681021, -1.695614, 0, 0, 0, 1, 1,
-0.9520364, 1.540486, -1.32056, 0, 0, 0, 1, 1,
-0.9471149, 0.5819612, -0.8577125, 0, 0, 0, 1, 1,
-0.9318104, -0.1021292, -1.172143, 0, 0, 0, 1, 1,
-0.9316693, -1.042169, -2.111207, 0, 0, 0, 1, 1,
-0.9242049, 1.519556, -0.6152892, 0, 0, 0, 1, 1,
-0.9197846, 1.36451, -0.1556346, 1, 1, 1, 1, 1,
-0.9145759, 1.002808, -0.8100242, 1, 1, 1, 1, 1,
-0.9123923, -1.386364, -2.799803, 1, 1, 1, 1, 1,
-0.912254, 2.739957, -1.311165, 1, 1, 1, 1, 1,
-0.9110824, 2.523231, -0.8224314, 1, 1, 1, 1, 1,
-0.9031999, 2.296888, -0.05125485, 1, 1, 1, 1, 1,
-0.8944706, 1.303902, 0.0302357, 1, 1, 1, 1, 1,
-0.8912018, 0.4073792, -3.27428, 1, 1, 1, 1, 1,
-0.8894102, -2.272412, -3.487506, 1, 1, 1, 1, 1,
-0.8852745, 0.2668652, -0.9558273, 1, 1, 1, 1, 1,
-0.8712121, 0.4558499, -0.8466188, 1, 1, 1, 1, 1,
-0.8554538, 2.003968, -1.415723, 1, 1, 1, 1, 1,
-0.8518769, -0.7708111, -3.793384, 1, 1, 1, 1, 1,
-0.8512607, 1.945207, -2.023054, 1, 1, 1, 1, 1,
-0.8450919, -0.9417179, -2.2965, 1, 1, 1, 1, 1,
-0.8444757, 0.696251, -1.177817, 0, 0, 1, 1, 1,
-0.8373082, -0.1357892, -3.262128, 1, 0, 0, 1, 1,
-0.8342639, -0.5582874, -1.305402, 1, 0, 0, 1, 1,
-0.8333193, -0.1737232, -1.494716, 1, 0, 0, 1, 1,
-0.8304058, -0.5450809, -1.153366, 1, 0, 0, 1, 1,
-0.8245202, -0.8280469, -2.02459, 1, 0, 0, 1, 1,
-0.8241451, 0.1364124, -0.05917218, 0, 0, 0, 1, 1,
-0.8178359, 0.8031814, -2.314616, 0, 0, 0, 1, 1,
-0.8121457, 1.738682, -0.4589709, 0, 0, 0, 1, 1,
-0.8106642, -0.7711325, -3.224038, 0, 0, 0, 1, 1,
-0.8011348, 0.3354432, -1.528048, 0, 0, 0, 1, 1,
-0.7972489, 0.3268223, -0.2652176, 0, 0, 0, 1, 1,
-0.7945541, 1.919292, -0.7395272, 0, 0, 0, 1, 1,
-0.7867426, 0.2482441, -2.844062, 1, 1, 1, 1, 1,
-0.7865689, 1.619626, -0.9726337, 1, 1, 1, 1, 1,
-0.7801839, -2.975468, -3.405897, 1, 1, 1, 1, 1,
-0.7702847, -0.07533841, -1.124918, 1, 1, 1, 1, 1,
-0.7460731, 0.05989156, -2.339373, 1, 1, 1, 1, 1,
-0.7459373, 0.1166092, -0.4509678, 1, 1, 1, 1, 1,
-0.7457023, 2.226404, -1.192998, 1, 1, 1, 1, 1,
-0.7340943, -0.5251003, -2.902288, 1, 1, 1, 1, 1,
-0.7318978, -0.5693869, -2.423127, 1, 1, 1, 1, 1,
-0.725274, -0.6592709, -2.718426, 1, 1, 1, 1, 1,
-0.7241982, -1.448927, -2.792046, 1, 1, 1, 1, 1,
-0.7191986, -0.4713193, -2.160322, 1, 1, 1, 1, 1,
-0.7165614, -0.4443501, -3.947454, 1, 1, 1, 1, 1,
-0.7124031, 0.3762336, -0.1946105, 1, 1, 1, 1, 1,
-0.7078211, 0.3658361, -1.945957, 1, 1, 1, 1, 1,
-0.7020029, -0.687442, -1.77068, 0, 0, 1, 1, 1,
-0.7019274, -0.4392123, -2.24501, 1, 0, 0, 1, 1,
-0.6859149, 2.30295, 0.7376022, 1, 0, 0, 1, 1,
-0.6855735, -1.340498, -2.706889, 1, 0, 0, 1, 1,
-0.6832579, 0.6120763, -2.594368, 1, 0, 0, 1, 1,
-0.6827131, 0.2658871, -2.351368, 1, 0, 0, 1, 1,
-0.680876, -2.017022, -2.146315, 0, 0, 0, 1, 1,
-0.675536, -1.061359, -4.066422, 0, 0, 0, 1, 1,
-0.6626123, 0.1117453, -0.5046809, 0, 0, 0, 1, 1,
-0.6612151, -0.4825084, -2.471828, 0, 0, 0, 1, 1,
-0.660947, -0.8180569, -0.9601038, 0, 0, 0, 1, 1,
-0.6601206, -0.6379928, -1.479289, 0, 0, 0, 1, 1,
-0.6586258, -1.247086, -3.924503, 0, 0, 0, 1, 1,
-0.6575664, -0.1777441, -1.813221, 1, 1, 1, 1, 1,
-0.6557902, -0.7564871, -3.536257, 1, 1, 1, 1, 1,
-0.6512146, -0.4399557, -3.398311, 1, 1, 1, 1, 1,
-0.650088, -0.5166363, -2.154039, 1, 1, 1, 1, 1,
-0.6421288, 0.0231108, -2.127364, 1, 1, 1, 1, 1,
-0.6386748, -0.3535488, -1.415866, 1, 1, 1, 1, 1,
-0.6347556, -0.1808278, -1.858764, 1, 1, 1, 1, 1,
-0.6345677, -0.9374394, -2.710261, 1, 1, 1, 1, 1,
-0.6285459, 1.018662, 0.3563015, 1, 1, 1, 1, 1,
-0.6276422, 0.3147293, -1.751556, 1, 1, 1, 1, 1,
-0.6256831, -1.387195, -0.9153921, 1, 1, 1, 1, 1,
-0.6247854, 0.9990978, 0.2674677, 1, 1, 1, 1, 1,
-0.6237906, -0.8356928, -2.541343, 1, 1, 1, 1, 1,
-0.6229906, 1.830407, -0.4659731, 1, 1, 1, 1, 1,
-0.6179976, 0.5025746, -1.86938, 1, 1, 1, 1, 1,
-0.6166475, -0.3959111, -1.749418, 0, 0, 1, 1, 1,
-0.6162679, -0.2449905, -2.04388, 1, 0, 0, 1, 1,
-0.6159195, 1.292328, -1.648631, 1, 0, 0, 1, 1,
-0.6158556, 0.2254964, -1.364523, 1, 0, 0, 1, 1,
-0.612291, 0.9035566, -1.183333, 1, 0, 0, 1, 1,
-0.6098568, -0.3416709, -1.69392, 1, 0, 0, 1, 1,
-0.608395, 0.7957941, -0.3018674, 0, 0, 0, 1, 1,
-0.5979081, -0.4435944, -2.466221, 0, 0, 0, 1, 1,
-0.5976085, 0.2567163, 0.3596114, 0, 0, 0, 1, 1,
-0.5961411, 1.952818, -0.110846, 0, 0, 0, 1, 1,
-0.5956281, 0.1682567, -0.1733466, 0, 0, 0, 1, 1,
-0.5898726, 0.4953627, -1.739504, 0, 0, 0, 1, 1,
-0.5892534, -0.5516025, -0.5556519, 0, 0, 0, 1, 1,
-0.5810354, 1.320231, -0.8637224, 1, 1, 1, 1, 1,
-0.5774086, 0.08219983, 2.381204, 1, 1, 1, 1, 1,
-0.5770845, 0.4480952, -2.471227, 1, 1, 1, 1, 1,
-0.5730814, 0.719439, 0.4903055, 1, 1, 1, 1, 1,
-0.5722845, -0.808479, -1.966224, 1, 1, 1, 1, 1,
-0.5708924, -1.417997, -2.41588, 1, 1, 1, 1, 1,
-0.5687381, -0.5335868, -1.876793, 1, 1, 1, 1, 1,
-0.5616931, -0.422778, -1.738969, 1, 1, 1, 1, 1,
-0.5600181, -0.3044232, -1.694851, 1, 1, 1, 1, 1,
-0.5589464, 0.3809279, -2.576422, 1, 1, 1, 1, 1,
-0.5562468, -0.5879523, -1.848601, 1, 1, 1, 1, 1,
-0.5555098, -1.352404, -1.021758, 1, 1, 1, 1, 1,
-0.555005, -0.1311597, -1.619319, 1, 1, 1, 1, 1,
-0.5530499, -1.196633, -3.846251, 1, 1, 1, 1, 1,
-0.5491038, 0.8689153, 0.8292419, 1, 1, 1, 1, 1,
-0.5439126, 0.1048853, -2.122668, 0, 0, 1, 1, 1,
-0.540612, 0.2640821, 0.1735674, 1, 0, 0, 1, 1,
-0.5374405, 1.200161, 0.9132735, 1, 0, 0, 1, 1,
-0.5323297, -0.6766999, -2.960607, 1, 0, 0, 1, 1,
-0.5296467, -0.9967327, -3.325522, 1, 0, 0, 1, 1,
-0.5279341, 1.725966, 1.322278, 1, 0, 0, 1, 1,
-0.5148095, 0.07638215, -0.5020984, 0, 0, 0, 1, 1,
-0.5146071, -1.411796, -2.617518, 0, 0, 0, 1, 1,
-0.5145604, 1.362908, -1.61894, 0, 0, 0, 1, 1,
-0.5144334, 0.5343315, -0.687485, 0, 0, 0, 1, 1,
-0.5059155, 0.4602351, -1.654157, 0, 0, 0, 1, 1,
-0.5058407, -0.781099, -2.280936, 0, 0, 0, 1, 1,
-0.5043675, -0.3383726, -1.438868, 0, 0, 0, 1, 1,
-0.5030888, -0.6390057, -1.120569, 1, 1, 1, 1, 1,
-0.5030537, -0.4213169, -1.149272, 1, 1, 1, 1, 1,
-0.4991375, 1.534805, -0.9728105, 1, 1, 1, 1, 1,
-0.4961669, 1.019108, -0.2352819, 1, 1, 1, 1, 1,
-0.4948197, -0.369177, -2.21363, 1, 1, 1, 1, 1,
-0.4936588, 0.9370885, -2.104963, 1, 1, 1, 1, 1,
-0.4932902, 0.7778409, -0.4284387, 1, 1, 1, 1, 1,
-0.4898491, -1.114492, -2.069436, 1, 1, 1, 1, 1,
-0.4885238, -1.294644, -2.680399, 1, 1, 1, 1, 1,
-0.4852954, -0.5349495, -2.484887, 1, 1, 1, 1, 1,
-0.4831944, -0.8929437, -3.040966, 1, 1, 1, 1, 1,
-0.4822195, -0.002671046, -2.893493, 1, 1, 1, 1, 1,
-0.4795788, -0.4409957, -2.030033, 1, 1, 1, 1, 1,
-0.4789472, 2.498871, 0.05634414, 1, 1, 1, 1, 1,
-0.4667759, -0.3805786, -1.992398, 1, 1, 1, 1, 1,
-0.4654653, -0.9365866, -1.709675, 0, 0, 1, 1, 1,
-0.4651877, -1.19986, -2.463466, 1, 0, 0, 1, 1,
-0.4637673, 1.789085, 0.9918227, 1, 0, 0, 1, 1,
-0.4581829, -1.096623, -1.31575, 1, 0, 0, 1, 1,
-0.4572072, 0.3657809, -0.3152755, 1, 0, 0, 1, 1,
-0.4541005, 0.974443, -0.9990138, 1, 0, 0, 1, 1,
-0.4533164, 0.5228736, -0.789211, 0, 0, 0, 1, 1,
-0.4518992, -0.8699274, -2.931318, 0, 0, 0, 1, 1,
-0.4466331, 0.1443234, -3.227584, 0, 0, 0, 1, 1,
-0.4459273, -0.225753, -1.981675, 0, 0, 0, 1, 1,
-0.4420901, 1.534281, -1.115785, 0, 0, 0, 1, 1,
-0.4402434, -0.1961982, -4.11238, 0, 0, 0, 1, 1,
-0.4380989, -0.2504449, -0.2347813, 0, 0, 0, 1, 1,
-0.4380728, -0.3288569, -2.164823, 1, 1, 1, 1, 1,
-0.4364397, -0.3950194, -3.144705, 1, 1, 1, 1, 1,
-0.4350998, -0.9121558, -3.618235, 1, 1, 1, 1, 1,
-0.4348542, 0.8922045, -1.876941, 1, 1, 1, 1, 1,
-0.4317327, 0.2998085, -2.922437, 1, 1, 1, 1, 1,
-0.4312963, 2.505857, -0.481758, 1, 1, 1, 1, 1,
-0.4310238, 0.07687611, -3.367504, 1, 1, 1, 1, 1,
-0.430925, 0.6386766, -0.8512993, 1, 1, 1, 1, 1,
-0.430103, 0.7979685, -2.095269, 1, 1, 1, 1, 1,
-0.4282819, 0.4896749, -2.509642, 1, 1, 1, 1, 1,
-0.4157747, 0.06736784, -0.08336502, 1, 1, 1, 1, 1,
-0.4084962, 0.2716362, 0.1823079, 1, 1, 1, 1, 1,
-0.4072829, -0.2085334, -1.395148, 1, 1, 1, 1, 1,
-0.3982825, -0.2152714, -2.031646, 1, 1, 1, 1, 1,
-0.3958869, -0.665613, -1.125874, 1, 1, 1, 1, 1,
-0.3958316, -0.6197253, -3.62957, 0, 0, 1, 1, 1,
-0.3939861, -0.3136991, -1.915975, 1, 0, 0, 1, 1,
-0.3879642, -2.00845, -4.174024, 1, 0, 0, 1, 1,
-0.3877524, -1.161474, -3.865468, 1, 0, 0, 1, 1,
-0.3871615, 1.052784, 0.09611942, 1, 0, 0, 1, 1,
-0.3850749, 0.5582066, 0.4240485, 1, 0, 0, 1, 1,
-0.3846197, 0.03795106, 0.4615618, 0, 0, 0, 1, 1,
-0.3826948, -0.08298939, -3.024487, 0, 0, 0, 1, 1,
-0.3821709, -0.3959868, -0.9502048, 0, 0, 0, 1, 1,
-0.3814222, -1.042127, -3.359268, 0, 0, 0, 1, 1,
-0.3755783, -0.01144135, -0.8938197, 0, 0, 0, 1, 1,
-0.373565, 1.216929, -0.869271, 0, 0, 0, 1, 1,
-0.3725747, 0.3213557, -1.123577, 0, 0, 0, 1, 1,
-0.3679948, 1.022583, -0.9581783, 1, 1, 1, 1, 1,
-0.3679186, 0.2132842, -1.981927, 1, 1, 1, 1, 1,
-0.367461, -0.1251768, -2.42099, 1, 1, 1, 1, 1,
-0.3663872, -1.94889, -1.94787, 1, 1, 1, 1, 1,
-0.3623733, 0.831547, -0.6623523, 1, 1, 1, 1, 1,
-0.3605744, 1.390583, 0.1688039, 1, 1, 1, 1, 1,
-0.3582154, -0.1781766, -1.281447, 1, 1, 1, 1, 1,
-0.3541241, -0.09556177, -0.04250563, 1, 1, 1, 1, 1,
-0.3522617, 1.956033, 0.815219, 1, 1, 1, 1, 1,
-0.344478, -2.043907, -3.265386, 1, 1, 1, 1, 1,
-0.3425838, -0.1931608, 0.2128569, 1, 1, 1, 1, 1,
-0.3393123, -0.8024659, -3.103406, 1, 1, 1, 1, 1,
-0.3376557, -1.784377, -3.858668, 1, 1, 1, 1, 1,
-0.3372795, -0.5469095, -1.841251, 1, 1, 1, 1, 1,
-0.3349352, 0.3243917, -1.298639, 1, 1, 1, 1, 1,
-0.3302078, 2.687498, 0.5336679, 0, 0, 1, 1, 1,
-0.3277794, -1.094688, -3.413427, 1, 0, 0, 1, 1,
-0.3267187, 1.031844, -0.2642465, 1, 0, 0, 1, 1,
-0.3230379, 0.1727542, -1.729886, 1, 0, 0, 1, 1,
-0.3188769, 0.5180103, -2.171904, 1, 0, 0, 1, 1,
-0.3145977, -0.8325296, -2.647618, 1, 0, 0, 1, 1,
-0.314547, -1.163069, -2.583695, 0, 0, 0, 1, 1,
-0.3142341, -0.4689678, -1.970758, 0, 0, 0, 1, 1,
-0.3096441, 0.2678584, -0.191915, 0, 0, 0, 1, 1,
-0.3063208, 0.5290496, -0.1517655, 0, 0, 0, 1, 1,
-0.3054396, 0.5497736, -2.983653, 0, 0, 0, 1, 1,
-0.3008726, 0.5041742, -2.296763, 0, 0, 0, 1, 1,
-0.2957987, -1.52214, -1.341902, 0, 0, 0, 1, 1,
-0.2896551, 1.121813, -1.446445, 1, 1, 1, 1, 1,
-0.2890633, 0.4380915, -0.9807829, 1, 1, 1, 1, 1,
-0.2858615, -1.061256, -2.90559, 1, 1, 1, 1, 1,
-0.285476, -0.5291653, -2.972483, 1, 1, 1, 1, 1,
-0.285459, 0.4374365, -0.6546317, 1, 1, 1, 1, 1,
-0.2777689, 1.134322, 0.6475523, 1, 1, 1, 1, 1,
-0.2770861, 1.139873, -0.4798398, 1, 1, 1, 1, 1,
-0.2759804, -0.3983451, -2.579328, 1, 1, 1, 1, 1,
-0.2746986, 1.122062, 1.216267, 1, 1, 1, 1, 1,
-0.2701956, -0.3353937, -1.550962, 1, 1, 1, 1, 1,
-0.2683386, -2.131381, -2.597314, 1, 1, 1, 1, 1,
-0.2668069, -2.200982, -3.23115, 1, 1, 1, 1, 1,
-0.2659467, 1.063837, -1.048879, 1, 1, 1, 1, 1,
-0.2647633, -0.8639839, -3.386822, 1, 1, 1, 1, 1,
-0.2634349, 0.09941527, -1.481521, 1, 1, 1, 1, 1,
-0.2629107, -0.7777104, -3.278956, 0, 0, 1, 1, 1,
-0.2621379, 1.049119, 1.404674, 1, 0, 0, 1, 1,
-0.2599469, -0.01605816, -1.397371, 1, 0, 0, 1, 1,
-0.2592671, -0.7251685, -0.9226424, 1, 0, 0, 1, 1,
-0.2538894, -0.2566752, -3.148933, 1, 0, 0, 1, 1,
-0.2488308, 1.298994, 0.1128492, 1, 0, 0, 1, 1,
-0.2480055, -2.537946, -2.05033, 0, 0, 0, 1, 1,
-0.2471759, -0.4892764, -1.489043, 0, 0, 0, 1, 1,
-0.2449983, -0.3277494, -4.04342, 0, 0, 0, 1, 1,
-0.2432173, -0.431722, -2.162746, 0, 0, 0, 1, 1,
-0.2399012, -0.1280059, -2.728536, 0, 0, 0, 1, 1,
-0.2378889, 1.524914, 1.030341, 0, 0, 0, 1, 1,
-0.2354318, 0.316349, -0.7181017, 0, 0, 0, 1, 1,
-0.2307198, -0.6434979, -2.368576, 1, 1, 1, 1, 1,
-0.2272463, 0.164064, -0.8455929, 1, 1, 1, 1, 1,
-0.2161277, 0.02782103, -1.534411, 1, 1, 1, 1, 1,
-0.2128248, 0.2232271, -2.707967, 1, 1, 1, 1, 1,
-0.2090574, 1.009819, 2.246204, 1, 1, 1, 1, 1,
-0.2084303, 0.9003718, -1.081261, 1, 1, 1, 1, 1,
-0.2076681, -0.4566919, -3.60764, 1, 1, 1, 1, 1,
-0.2069189, 1.146539, 0.7128313, 1, 1, 1, 1, 1,
-0.2057878, 0.914684, -0.1233161, 1, 1, 1, 1, 1,
-0.2052563, -1.133609, -4.406488, 1, 1, 1, 1, 1,
-0.2050213, -1.837154, -3.274549, 1, 1, 1, 1, 1,
-0.1984717, -0.9108219, -3.922328, 1, 1, 1, 1, 1,
-0.1923856, 0.19289, -1.833865, 1, 1, 1, 1, 1,
-0.1916572, -0.3302399, -3.88235, 1, 1, 1, 1, 1,
-0.190011, 0.4501499, -0.2623689, 1, 1, 1, 1, 1,
-0.1893846, -0.2882279, -1.800215, 0, 0, 1, 1, 1,
-0.1808889, -0.7076974, -2.041898, 1, 0, 0, 1, 1,
-0.1805311, -1.136226, -3.393553, 1, 0, 0, 1, 1,
-0.1781972, 1.436124, 0.03293811, 1, 0, 0, 1, 1,
-0.1780497, 0.05780014, -2.05331, 1, 0, 0, 1, 1,
-0.1779855, -0.2743918, -1.386256, 1, 0, 0, 1, 1,
-0.1690891, 0.05286138, -1.196685, 0, 0, 0, 1, 1,
-0.1688907, 1.184207, -0.7142713, 0, 0, 0, 1, 1,
-0.1674691, -0.2481111, -2.76837, 0, 0, 0, 1, 1,
-0.1653465, 0.2778, -1.218784, 0, 0, 0, 1, 1,
-0.164665, -1.036196, -2.887923, 0, 0, 0, 1, 1,
-0.1577672, 0.9416879, -0.7703805, 0, 0, 0, 1, 1,
-0.1570631, -1.945668, -2.510079, 0, 0, 0, 1, 1,
-0.156222, 0.7366269, 0.2026529, 1, 1, 1, 1, 1,
-0.1536959, -0.1517372, -1.805889, 1, 1, 1, 1, 1,
-0.1484974, -0.9741051, -2.429398, 1, 1, 1, 1, 1,
-0.1482947, 1.040363, 0.3591918, 1, 1, 1, 1, 1,
-0.1475691, 1.218568, -1.152402, 1, 1, 1, 1, 1,
-0.1439158, 1.863357, 1.45482, 1, 1, 1, 1, 1,
-0.1395564, -0.5923205, -2.925199, 1, 1, 1, 1, 1,
-0.1349963, 1.287265, -0.2084102, 1, 1, 1, 1, 1,
-0.1328373, -0.5072701, -3.529278, 1, 1, 1, 1, 1,
-0.1319297, 1.819505, 1.628626, 1, 1, 1, 1, 1,
-0.1274215, -0.1745566, -2.174037, 1, 1, 1, 1, 1,
-0.1273329, -0.08680483, -2.523176, 1, 1, 1, 1, 1,
-0.124998, 0.4267449, -0.4629874, 1, 1, 1, 1, 1,
-0.1239599, -0.8701672, -2.666211, 1, 1, 1, 1, 1,
-0.1221039, -0.1154646, -2.458631, 1, 1, 1, 1, 1,
-0.1204736, 0.9738629, 0.3452514, 0, 0, 1, 1, 1,
-0.119984, 0.2406941, -1.375242, 1, 0, 0, 1, 1,
-0.1195026, -1.133941, -3.627886, 1, 0, 0, 1, 1,
-0.1162692, 0.0947568, 0.7527018, 1, 0, 0, 1, 1,
-0.1144705, -1.640436, -1.972608, 1, 0, 0, 1, 1,
-0.1108908, -0.0588304, -2.023746, 1, 0, 0, 1, 1,
-0.1073294, 0.3933759, -1.376618, 0, 0, 0, 1, 1,
-0.1047238, -0.3193239, -3.224876, 0, 0, 0, 1, 1,
-0.1036963, 0.2255299, -0.2369322, 0, 0, 0, 1, 1,
-0.0995198, 1.216385, 0.9143669, 0, 0, 0, 1, 1,
-0.09312189, 1.038353, -2.888482, 0, 0, 0, 1, 1,
-0.09206712, 1.170781, -1.183946, 0, 0, 0, 1, 1,
-0.08844487, -0.4240705, -4.368083, 0, 0, 0, 1, 1,
-0.07904153, -0.1009719, -1.78354, 1, 1, 1, 1, 1,
-0.07771444, -0.4971946, -3.770453, 1, 1, 1, 1, 1,
-0.07688414, 0.09049914, -1.947884, 1, 1, 1, 1, 1,
-0.07489905, -1.48093, -2.336232, 1, 1, 1, 1, 1,
-0.07323154, 0.03144595, -1.966696, 1, 1, 1, 1, 1,
-0.06659971, -0.1289997, -3.452341, 1, 1, 1, 1, 1,
-0.06468385, -0.111578, -2.143023, 1, 1, 1, 1, 1,
-0.05725943, -1.900552, -2.105983, 1, 1, 1, 1, 1,
-0.05643499, 1.373035, -0.5277746, 1, 1, 1, 1, 1,
-0.05630313, -0.6050898, -2.546666, 1, 1, 1, 1, 1,
-0.0560478, 0.5781053, 0.8453323, 1, 1, 1, 1, 1,
-0.05552079, 0.03024132, 0.5335138, 1, 1, 1, 1, 1,
-0.05253492, -0.4298824, -3.773584, 1, 1, 1, 1, 1,
-0.05130969, 1.020004, -0.7503219, 1, 1, 1, 1, 1,
-0.04022702, 0.2058945, -0.3314162, 1, 1, 1, 1, 1,
-0.0377518, 0.7937312, -0.2752768, 0, 0, 1, 1, 1,
-0.03594768, 1.908334, 1.998513, 1, 0, 0, 1, 1,
-0.03447612, 0.6147425, -2.038069, 1, 0, 0, 1, 1,
-0.03366155, -0.5500046, -2.537861, 1, 0, 0, 1, 1,
-0.03258369, 0.08546406, -0.9088016, 1, 0, 0, 1, 1,
-0.02690711, 1.619348, -0.7449899, 1, 0, 0, 1, 1,
-0.02438283, 0.6814361, -0.002825905, 0, 0, 0, 1, 1,
-0.02130997, -0.3018047, -1.522023, 0, 0, 0, 1, 1,
-0.01110937, -0.7501053, -3.490065, 0, 0, 0, 1, 1,
-0.005504533, 0.3680884, 0.04586292, 0, 0, 0, 1, 1,
-0.004826867, -0.5208313, -2.481618, 0, 0, 0, 1, 1,
0.0001525906, -0.1741749, 0.5009488, 0, 0, 0, 1, 1,
0.002979015, -0.3024994, 2.456116, 0, 0, 0, 1, 1,
0.003486271, 0.7590888, 0.7362089, 1, 1, 1, 1, 1,
0.005922274, 1.266013, -0.7182771, 1, 1, 1, 1, 1,
0.01022907, 0.2379519, 1.841723, 1, 1, 1, 1, 1,
0.01459774, 0.5476799, 0.1304799, 1, 1, 1, 1, 1,
0.02041898, -0.490214, 1.602537, 1, 1, 1, 1, 1,
0.02094233, -0.02687344, 3.438009, 1, 1, 1, 1, 1,
0.02449978, 0.3961219, -0.2123997, 1, 1, 1, 1, 1,
0.02469945, -1.146857, 3.13866, 1, 1, 1, 1, 1,
0.02616528, 0.835054, 1.690018, 1, 1, 1, 1, 1,
0.02869743, -0.2057044, 1.465758, 1, 1, 1, 1, 1,
0.0312911, -1.167356, 4.827394, 1, 1, 1, 1, 1,
0.03451542, -0.2078922, 3.840355, 1, 1, 1, 1, 1,
0.03664993, 0.01152783, 0.04448746, 1, 1, 1, 1, 1,
0.03887448, 0.678236, -1.201873, 1, 1, 1, 1, 1,
0.0421862, 0.8910996, 0.4248231, 1, 1, 1, 1, 1,
0.04811854, 1.279003, 2.307163, 0, 0, 1, 1, 1,
0.04886765, 1.02029, 0.4343938, 1, 0, 0, 1, 1,
0.04997797, -1.161744, 4.026378, 1, 0, 0, 1, 1,
0.05369674, 0.06891152, -1.593128, 1, 0, 0, 1, 1,
0.05444035, 0.1011794, -0.8292038, 1, 0, 0, 1, 1,
0.05627131, -0.9063295, 3.144941, 1, 0, 0, 1, 1,
0.0565475, 0.5657435, 1.588696, 0, 0, 0, 1, 1,
0.05765275, -0.1274039, 2.711179, 0, 0, 0, 1, 1,
0.06511677, 1.005519, -0.5717497, 0, 0, 0, 1, 1,
0.0692101, 0.2988728, 1.979972, 0, 0, 0, 1, 1,
0.08201731, 0.5391136, -0.5478838, 0, 0, 0, 1, 1,
0.08241883, 2.565747, 1.301204, 0, 0, 0, 1, 1,
0.0887882, 0.8752966, -0.4075916, 0, 0, 0, 1, 1,
0.09116308, 0.9578072, -1.589071, 1, 1, 1, 1, 1,
0.09297366, -0.7623829, 3.040167, 1, 1, 1, 1, 1,
0.09442835, -0.2040477, 3.444032, 1, 1, 1, 1, 1,
0.09461611, -0.01255741, 0.9171202, 1, 1, 1, 1, 1,
0.09595706, 0.8538377, 0.1666741, 1, 1, 1, 1, 1,
0.09785574, 0.9112526, 0.6282458, 1, 1, 1, 1, 1,
0.1010205, -0.5066668, 2.399413, 1, 1, 1, 1, 1,
0.1067289, 1.006274, -0.4604114, 1, 1, 1, 1, 1,
0.1084505, -0.8757408, 3.4805, 1, 1, 1, 1, 1,
0.1086578, 0.02219364, 2.037959, 1, 1, 1, 1, 1,
0.1091304, 0.438097, -0.1172149, 1, 1, 1, 1, 1,
0.1108373, -0.6351577, 2.188698, 1, 1, 1, 1, 1,
0.1109152, -1.925107, 2.412708, 1, 1, 1, 1, 1,
0.1128106, -0.03311032, 0.9806562, 1, 1, 1, 1, 1,
0.1149886, 0.05681128, 0.5969376, 1, 1, 1, 1, 1,
0.1155159, 0.3027423, 2.887737, 0, 0, 1, 1, 1,
0.116665, 0.1845235, 0.3691117, 1, 0, 0, 1, 1,
0.1178074, 0.1269289, 1.548874, 1, 0, 0, 1, 1,
0.121644, -0.5817494, 3.469662, 1, 0, 0, 1, 1,
0.1221867, 0.1480831, -0.9137143, 1, 0, 0, 1, 1,
0.1225262, 0.007089312, 0.3058853, 1, 0, 0, 1, 1,
0.1259372, -0.5053822, 3.241421, 0, 0, 0, 1, 1,
0.1283796, -1.576706, 2.780145, 0, 0, 0, 1, 1,
0.1293163, -1.418044, 3.876162, 0, 0, 0, 1, 1,
0.1327454, -0.3268644, 2.135969, 0, 0, 0, 1, 1,
0.1369535, 0.81797, 1.093232, 0, 0, 0, 1, 1,
0.1400172, 1.006266, -0.3493176, 0, 0, 0, 1, 1,
0.1402989, 1.30254, 1.253255, 0, 0, 0, 1, 1,
0.1627986, 0.2704269, -0.6931205, 1, 1, 1, 1, 1,
0.1633459, 0.1298536, 1.09618, 1, 1, 1, 1, 1,
0.1642074, -0.6584613, 2.189127, 1, 1, 1, 1, 1,
0.1651102, 0.7570903, 1.119061, 1, 1, 1, 1, 1,
0.1677595, -2.021338, 3.43392, 1, 1, 1, 1, 1,
0.1690457, -0.4702164, 2.395796, 1, 1, 1, 1, 1,
0.1693008, -0.4810217, 3.568535, 1, 1, 1, 1, 1,
0.1694767, 0.3664906, 0.1587009, 1, 1, 1, 1, 1,
0.1709111, -2.16807, 3.607172, 1, 1, 1, 1, 1,
0.1713304, -1.14453, 3.16726, 1, 1, 1, 1, 1,
0.1720424, 0.04373601, 0.9084416, 1, 1, 1, 1, 1,
0.1729945, 0.01393114, 1.680157, 1, 1, 1, 1, 1,
0.1733398, 0.8235619, 3.448066, 1, 1, 1, 1, 1,
0.1784586, 0.6592314, 0.7734374, 1, 1, 1, 1, 1,
0.182864, -1.324681, 3.10301, 1, 1, 1, 1, 1,
0.1863737, -1.582535, 4.002695, 0, 0, 1, 1, 1,
0.1878281, -0.3770589, 2.461059, 1, 0, 0, 1, 1,
0.1909663, 0.7016835, 0.5743483, 1, 0, 0, 1, 1,
0.1917247, -1.470607, 4.239854, 1, 0, 0, 1, 1,
0.1933541, -0.1070765, 2.411936, 1, 0, 0, 1, 1,
0.1958688, 1.52244, -1.330972, 1, 0, 0, 1, 1,
0.1958901, -0.8738048, 2.76686, 0, 0, 0, 1, 1,
0.1977499, -0.840713, 2.307883, 0, 0, 0, 1, 1,
0.2007778, 2.059518, -0.8045447, 0, 0, 0, 1, 1,
0.2018795, 0.7771612, -1.114589, 0, 0, 0, 1, 1,
0.2027703, -0.4893884, 4.210818, 0, 0, 0, 1, 1,
0.2044878, 0.06503759, -0.8390777, 0, 0, 0, 1, 1,
0.20533, -1.19378, 1.718612, 0, 0, 0, 1, 1,
0.2116955, -0.4240308, 3.561883, 1, 1, 1, 1, 1,
0.2158575, 0.5968906, 1.457721, 1, 1, 1, 1, 1,
0.2160258, -0.9998389, 4.206436, 1, 1, 1, 1, 1,
0.2236567, -1.652325, 2.123397, 1, 1, 1, 1, 1,
0.2248336, 0.9380329, 1.581474, 1, 1, 1, 1, 1,
0.2277374, -0.5096815, 1.250454, 1, 1, 1, 1, 1,
0.2282652, -0.4143, 3.96658, 1, 1, 1, 1, 1,
0.2330137, -0.5720575, 3.154276, 1, 1, 1, 1, 1,
0.2338153, 0.08897208, 1.968509, 1, 1, 1, 1, 1,
0.2441394, 0.2758178, 0.6764533, 1, 1, 1, 1, 1,
0.2444709, 1.076376, -0.09028301, 1, 1, 1, 1, 1,
0.2459684, -0.1340245, 5.416497, 1, 1, 1, 1, 1,
0.2468934, 0.2597855, -1.086691, 1, 1, 1, 1, 1,
0.248805, 0.7809295, 1.241682, 1, 1, 1, 1, 1,
0.2526594, -0.9631106, 2.403507, 1, 1, 1, 1, 1,
0.2541766, -0.393358, 3.80785, 0, 0, 1, 1, 1,
0.2547087, 0.01485018, 0.02563011, 1, 0, 0, 1, 1,
0.2548212, -0.7391225, 1.94891, 1, 0, 0, 1, 1,
0.2551335, -0.237968, 1.631163, 1, 0, 0, 1, 1,
0.25529, 1.108405, -0.0765061, 1, 0, 0, 1, 1,
0.2580307, -0.6945046, 1.121827, 1, 0, 0, 1, 1,
0.2598098, 0.428666, 0.5249355, 0, 0, 0, 1, 1,
0.2600797, 1.816019, 2.596124, 0, 0, 0, 1, 1,
0.2632636, 0.5489548, -0.4391559, 0, 0, 0, 1, 1,
0.2632659, 1.155082, 1.681364, 0, 0, 0, 1, 1,
0.2642448, -0.9940594, 2.591753, 0, 0, 0, 1, 1,
0.265064, 0.8551288, 1.756912, 0, 0, 0, 1, 1,
0.2675323, -0.3066295, 3.699106, 0, 0, 0, 1, 1,
0.271918, 0.1124008, 0.675396, 1, 1, 1, 1, 1,
0.2719938, 0.3432651, 0.9880512, 1, 1, 1, 1, 1,
0.2721203, 0.490148, 1.458092, 1, 1, 1, 1, 1,
0.2760084, -0.1366132, 1.522173, 1, 1, 1, 1, 1,
0.2798637, -0.706535, 3.853191, 1, 1, 1, 1, 1,
0.2818384, -0.1833666, 0.4258848, 1, 1, 1, 1, 1,
0.2861764, 0.8728761, -1.464968, 1, 1, 1, 1, 1,
0.2873913, -0.09380345, 1.058003, 1, 1, 1, 1, 1,
0.2914694, 0.06510768, 2.670265, 1, 1, 1, 1, 1,
0.2932686, 0.6646924, -0.5312836, 1, 1, 1, 1, 1,
0.2936244, -1.297489, 3.032676, 1, 1, 1, 1, 1,
0.2955068, -1.199939, 2.640394, 1, 1, 1, 1, 1,
0.2997869, 0.4056346, 0.06844025, 1, 1, 1, 1, 1,
0.3003128, -0.3037346, 2.207236, 1, 1, 1, 1, 1,
0.3061101, -0.1600171, 2.370473, 1, 1, 1, 1, 1,
0.3103407, 0.2996121, 0.4262079, 0, 0, 1, 1, 1,
0.3117418, 0.9062907, -1.386754, 1, 0, 0, 1, 1,
0.3158031, 0.6414853, 0.07907175, 1, 0, 0, 1, 1,
0.3164705, 0.2902547, 0.4918649, 1, 0, 0, 1, 1,
0.3196642, 0.09225817, 0.03100342, 1, 0, 0, 1, 1,
0.3264039, 0.7668441, 0.6928464, 1, 0, 0, 1, 1,
0.3264772, 1.041922, 1.053084, 0, 0, 0, 1, 1,
0.3270909, 0.2217861, 0.6700039, 0, 0, 0, 1, 1,
0.3285798, 0.4860669, 1.641579, 0, 0, 0, 1, 1,
0.3316837, 0.2978624, 1.40645, 0, 0, 0, 1, 1,
0.3354192, -0.9898246, 2.856016, 0, 0, 0, 1, 1,
0.3386966, 0.04084116, 1.17913, 0, 0, 0, 1, 1,
0.3424226, 0.4126984, -0.5913461, 0, 0, 0, 1, 1,
0.3458313, -0.3203274, 2.391656, 1, 1, 1, 1, 1,
0.3462462, 0.007051079, 0.5175889, 1, 1, 1, 1, 1,
0.3475275, -0.3138376, 2.635851, 1, 1, 1, 1, 1,
0.3518888, -1.17162, 1.873564, 1, 1, 1, 1, 1,
0.3521852, 0.8200799, -0.9031772, 1, 1, 1, 1, 1,
0.3529848, -0.4203636, 0.6932347, 1, 1, 1, 1, 1,
0.3540286, 0.1012354, -1.666777, 1, 1, 1, 1, 1,
0.3553776, -1.750832, 2.405221, 1, 1, 1, 1, 1,
0.3585902, 0.4681967, 0.4544362, 1, 1, 1, 1, 1,
0.3610627, 0.828207, 1.45358, 1, 1, 1, 1, 1,
0.3619044, -1.005665, 1.825288, 1, 1, 1, 1, 1,
0.3627747, 1.295437, 1.670305, 1, 1, 1, 1, 1,
0.3646925, 1.480231, -1.268612, 1, 1, 1, 1, 1,
0.3651516, 0.1798031, 0.8864506, 1, 1, 1, 1, 1,
0.3666366, 0.4519134, 0.9597346, 1, 1, 1, 1, 1,
0.3700389, 1.309515, -1.720852, 0, 0, 1, 1, 1,
0.3713758, -0.8415172, 2.671366, 1, 0, 0, 1, 1,
0.3714705, 0.2034766, -0.02953196, 1, 0, 0, 1, 1,
0.3717411, -0.2916171, 0.5943843, 1, 0, 0, 1, 1,
0.3747841, 0.8354573, 0.6308022, 1, 0, 0, 1, 1,
0.3748784, 1.242843, 0.7674453, 1, 0, 0, 1, 1,
0.3837163, -0.9217927, 3.060144, 0, 0, 0, 1, 1,
0.3840615, 0.4925544, 0.03074101, 0, 0, 0, 1, 1,
0.3863971, -0.04826328, 1.852048, 0, 0, 0, 1, 1,
0.3866942, 0.674985, 1.767183, 0, 0, 0, 1, 1,
0.3913643, -1.768315, 2.265653, 0, 0, 0, 1, 1,
0.3945232, 1.180386, 0.4616506, 0, 0, 0, 1, 1,
0.4037748, 1.574909, 1.196781, 0, 0, 0, 1, 1,
0.4076611, 0.2387036, 1.494265, 1, 1, 1, 1, 1,
0.4081949, 0.4591144, 1.202851, 1, 1, 1, 1, 1,
0.4085843, -0.02425101, 1.439149, 1, 1, 1, 1, 1,
0.4147943, 0.3402943, 1.603092, 1, 1, 1, 1, 1,
0.4201987, 0.5849581, -0.5410283, 1, 1, 1, 1, 1,
0.4203817, -0.2404977, 1.661047, 1, 1, 1, 1, 1,
0.4241116, 0.9847413, 0.1982862, 1, 1, 1, 1, 1,
0.4316923, 0.9327711, 1.602841, 1, 1, 1, 1, 1,
0.4349311, -0.121384, 4.112365, 1, 1, 1, 1, 1,
0.4361415, -1.234887, 3.413373, 1, 1, 1, 1, 1,
0.4373902, -0.1531945, 0.8787987, 1, 1, 1, 1, 1,
0.4455873, 0.1864376, 1.39978, 1, 1, 1, 1, 1,
0.4474508, -0.4149348, 1.89407, 1, 1, 1, 1, 1,
0.4484247, -0.3631223, 1.839291, 1, 1, 1, 1, 1,
0.4496123, 0.8683357, -1.243334, 1, 1, 1, 1, 1,
0.4503092, 1.187903, 2.027754, 0, 0, 1, 1, 1,
0.4510942, -0.4578612, 0.1998047, 1, 0, 0, 1, 1,
0.4530167, -0.2916592, 3.754616, 1, 0, 0, 1, 1,
0.4541542, 0.8475505, -0.8660452, 1, 0, 0, 1, 1,
0.4544455, 1.53933, -0.0906697, 1, 0, 0, 1, 1,
0.456134, 0.4416444, 1.424042, 1, 0, 0, 1, 1,
0.4602079, -0.3751314, 1.269, 0, 0, 0, 1, 1,
0.4608609, -1.019423, 1.119721, 0, 0, 0, 1, 1,
0.4620501, -0.4760712, 3.361936, 0, 0, 0, 1, 1,
0.464305, -0.167109, 0.1871483, 0, 0, 0, 1, 1,
0.4659424, 1.59173, 0.7031576, 0, 0, 0, 1, 1,
0.4700302, -1.151906, 2.221659, 0, 0, 0, 1, 1,
0.4811102, -1.114384, 1.620752, 0, 0, 0, 1, 1,
0.482478, -1.116137, 3.085902, 1, 1, 1, 1, 1,
0.4865789, 0.339321, -0.4128045, 1, 1, 1, 1, 1,
0.4927993, -0.1949988, 1.895212, 1, 1, 1, 1, 1,
0.4936131, 1.576245, -0.1327608, 1, 1, 1, 1, 1,
0.494871, 0.721064, 1.125803, 1, 1, 1, 1, 1,
0.4958769, 0.2647838, 0.5578958, 1, 1, 1, 1, 1,
0.5015803, -0.9437277, 2.454896, 1, 1, 1, 1, 1,
0.5016381, 0.9759063, 0.5365497, 1, 1, 1, 1, 1,
0.5025397, 0.4238169, 0.08494992, 1, 1, 1, 1, 1,
0.5031625, 0.6689407, 1.036503, 1, 1, 1, 1, 1,
0.503453, 1.440623, -0.02353773, 1, 1, 1, 1, 1,
0.5098867, 0.08986231, 2.15677, 1, 1, 1, 1, 1,
0.5112566, 0.505872, -0.273538, 1, 1, 1, 1, 1,
0.5113677, -0.2806695, 2.515924, 1, 1, 1, 1, 1,
0.5130302, -0.953886, 2.047921, 1, 1, 1, 1, 1,
0.5132701, 1.162132, 0.8434716, 0, 0, 1, 1, 1,
0.5167173, -0.8091276, 4.675579, 1, 0, 0, 1, 1,
0.5168626, -0.5812244, 3.057747, 1, 0, 0, 1, 1,
0.5177642, -0.6768032, 2.560889, 1, 0, 0, 1, 1,
0.5218024, -1.026566, 1.271377, 1, 0, 0, 1, 1,
0.5289644, 2.458727, 0.1152619, 1, 0, 0, 1, 1,
0.5366572, 1.683411, -1.020902, 0, 0, 0, 1, 1,
0.538237, -0.7868958, 2.668874, 0, 0, 0, 1, 1,
0.5395898, -1.016832, 2.012952, 0, 0, 0, 1, 1,
0.5416806, 0.9086649, -0.1314021, 0, 0, 0, 1, 1,
0.5427727, 0.06880952, 3.335113, 0, 0, 0, 1, 1,
0.5499522, 0.3281715, 1.452176, 0, 0, 0, 1, 1,
0.5576642, -0.161783, 1.33779, 0, 0, 0, 1, 1,
0.5577654, -0.04735444, 1.918411, 1, 1, 1, 1, 1,
0.5580611, 0.3200419, 1.413294, 1, 1, 1, 1, 1,
0.5614696, 1.207197, 0.6535531, 1, 1, 1, 1, 1,
0.5620568, 0.937202, 1.280352, 1, 1, 1, 1, 1,
0.5655491, -0.6878948, 3.250552, 1, 1, 1, 1, 1,
0.5658889, -0.9519771, 3.631514, 1, 1, 1, 1, 1,
0.5681022, 1.352906, 0.3851255, 1, 1, 1, 1, 1,
0.5706998, -1.089818, 3.872499, 1, 1, 1, 1, 1,
0.5739184, -1.153758, 3.511036, 1, 1, 1, 1, 1,
0.5793533, -0.1977953, 1.046082, 1, 1, 1, 1, 1,
0.5816489, -0.5740029, 1.643994, 1, 1, 1, 1, 1,
0.5843543, 0.09678499, 2.631029, 1, 1, 1, 1, 1,
0.5924706, 0.3196215, 1.917669, 1, 1, 1, 1, 1,
0.5959002, -1.884598, 2.839394, 1, 1, 1, 1, 1,
0.596246, -0.7906382, 3.048265, 1, 1, 1, 1, 1,
0.5988167, 0.7711293, 0.7414479, 0, 0, 1, 1, 1,
0.5994233, 2.313201, 0.2159251, 1, 0, 0, 1, 1,
0.5998841, 0.4364353, -2.213942, 1, 0, 0, 1, 1,
0.6071867, 0.7671533, -0.37712, 1, 0, 0, 1, 1,
0.6082395, 0.1731081, 2.969525, 1, 0, 0, 1, 1,
0.6082976, 0.9865999, 0.1814397, 1, 0, 0, 1, 1,
0.6085815, 0.5363237, 1.790115, 0, 0, 0, 1, 1,
0.6160972, -2.104425, 2.204448, 0, 0, 0, 1, 1,
0.622712, 0.008710007, 0.6898233, 0, 0, 0, 1, 1,
0.6251892, -1.642051, 3.047197, 0, 0, 0, 1, 1,
0.6285307, -0.5898384, 2.758149, 0, 0, 0, 1, 1,
0.6286543, -0.3596149, 1.029324, 0, 0, 0, 1, 1,
0.6310496, -0.9210312, 2.877899, 0, 0, 0, 1, 1,
0.6331756, -0.4737568, 1.471897, 1, 1, 1, 1, 1,
0.6340925, 2.038413, -0.09719899, 1, 1, 1, 1, 1,
0.6364363, 1.527001, -0.2838338, 1, 1, 1, 1, 1,
0.6391543, -1.424808, 1.888154, 1, 1, 1, 1, 1,
0.6405304, 0.1965257, -0.04252707, 1, 1, 1, 1, 1,
0.6449113, -1.168309, 3.151321, 1, 1, 1, 1, 1,
0.6496938, 0.1361002, 3.335721, 1, 1, 1, 1, 1,
0.6575211, -0.5799427, 4.036209, 1, 1, 1, 1, 1,
0.6585782, -0.445724, 2.557258, 1, 1, 1, 1, 1,
0.6640675, 0.7110098, 1.067522, 1, 1, 1, 1, 1,
0.6682374, -0.6322415, 2.29922, 1, 1, 1, 1, 1,
0.6765888, -1.990357, 3.565994, 1, 1, 1, 1, 1,
0.6787151, -0.7082839, 3.124626, 1, 1, 1, 1, 1,
0.6828804, 1.001689, 1.546888, 1, 1, 1, 1, 1,
0.6871983, 0.292531, 0.9520494, 1, 1, 1, 1, 1,
0.6883702, 0.3427338, 1.288949, 0, 0, 1, 1, 1,
0.6894287, 0.599834, -1.582144, 1, 0, 0, 1, 1,
0.6965164, 1.034518, 2.755163, 1, 0, 0, 1, 1,
0.6993307, 0.921613, 0.03602677, 1, 0, 0, 1, 1,
0.6997396, -0.8650975, 0.8044561, 1, 0, 0, 1, 1,
0.702785, -0.6559637, 2.517693, 1, 0, 0, 1, 1,
0.7035187, 1.210567, 0.6050573, 0, 0, 0, 1, 1,
0.7043363, -1.043274, 3.839117, 0, 0, 0, 1, 1,
0.7055001, 1.454715, 0.1702274, 0, 0, 0, 1, 1,
0.706719, -0.4652694, 3.644817, 0, 0, 0, 1, 1,
0.7110544, -0.7891874, 1.901067, 0, 0, 0, 1, 1,
0.7110828, 0.3659506, 0.1479363, 0, 0, 0, 1, 1,
0.7116224, -0.5661037, 1.443393, 0, 0, 0, 1, 1,
0.7134419, 0.2231175, 0.1963546, 1, 1, 1, 1, 1,
0.7136954, 0.05466437, 1.881554, 1, 1, 1, 1, 1,
0.7150216, 1.838938, 1.079945, 1, 1, 1, 1, 1,
0.7169659, -0.7394409, 1.515756, 1, 1, 1, 1, 1,
0.7173969, 1.463867, 2.280863, 1, 1, 1, 1, 1,
0.7196429, -0.1882244, 1.739363, 1, 1, 1, 1, 1,
0.725094, -0.260348, 2.579054, 1, 1, 1, 1, 1,
0.734389, -0.2123783, 2.295849, 1, 1, 1, 1, 1,
0.7349213, -0.9527416, 3.798406, 1, 1, 1, 1, 1,
0.7375965, 0.6430675, 1.376046, 1, 1, 1, 1, 1,
0.7402204, -0.2038507, 0.7312706, 1, 1, 1, 1, 1,
0.7421977, 0.2416642, 0.5834309, 1, 1, 1, 1, 1,
0.7429853, -2.260683, 2.939051, 1, 1, 1, 1, 1,
0.7440342, 1.682911, 0.9208676, 1, 1, 1, 1, 1,
0.7444119, -1.245715, 3.281703, 1, 1, 1, 1, 1,
0.7476337, 0.1136717, 0.4779728, 0, 0, 1, 1, 1,
0.754441, 0.001507364, 0.8383142, 1, 0, 0, 1, 1,
0.7576763, 0.1851016, 2.233514, 1, 0, 0, 1, 1,
0.7634571, -0.3936058, 0.6845193, 1, 0, 0, 1, 1,
0.7683054, 0.5569116, -0.5575628, 1, 0, 0, 1, 1,
0.7691302, -0.4080986, 1.434876, 1, 0, 0, 1, 1,
0.7709017, 0.58798, 0.8253577, 0, 0, 0, 1, 1,
0.7714805, -0.4750918, 1.687309, 0, 0, 0, 1, 1,
0.7753917, -1.902222, 1.779725, 0, 0, 0, 1, 1,
0.7759997, 0.8553473, 0.3737151, 0, 0, 0, 1, 1,
0.777473, -1.174696, 3.661512, 0, 0, 0, 1, 1,
0.7930765, 2.304717, 1.169852, 0, 0, 0, 1, 1,
0.7977128, -0.3072339, 2.544384, 0, 0, 0, 1, 1,
0.7979627, -1.498536, 4.643247, 1, 1, 1, 1, 1,
0.8052915, 0.2704383, 1.473662, 1, 1, 1, 1, 1,
0.8057256, -0.08657119, 3.854075, 1, 1, 1, 1, 1,
0.8060544, 0.4311347, 3.120893, 1, 1, 1, 1, 1,
0.8071804, 0.4459214, 3.154997, 1, 1, 1, 1, 1,
0.8094905, -0.05539497, 0.2201832, 1, 1, 1, 1, 1,
0.8157107, 2.321681, 0.8505964, 1, 1, 1, 1, 1,
0.8177286, -2.110878, 1.843566, 1, 1, 1, 1, 1,
0.8186152, 0.2275227, 0.5389164, 1, 1, 1, 1, 1,
0.8337612, -0.2268952, 1.711976, 1, 1, 1, 1, 1,
0.8368312, 0.05995644, -0.405227, 1, 1, 1, 1, 1,
0.8375005, 0.08725832, 1.168452, 1, 1, 1, 1, 1,
0.839487, 0.7547068, 0.6539651, 1, 1, 1, 1, 1,
0.8396506, -0.2470743, 1.986673, 1, 1, 1, 1, 1,
0.8418882, -0.1271423, 1.558744, 1, 1, 1, 1, 1,
0.8429759, 0.4339344, 2.983354, 0, 0, 1, 1, 1,
0.8460788, 0.02603122, 1.316318, 1, 0, 0, 1, 1,
0.8494507, 1.24195, -0.1588837, 1, 0, 0, 1, 1,
0.8509716, 0.05838866, 1.966064, 1, 0, 0, 1, 1,
0.8676573, 0.293179, 2.07678, 1, 0, 0, 1, 1,
0.8702638, 0.6296008, 1.851188, 1, 0, 0, 1, 1,
0.8718618, 0.6775554, 2.868364, 0, 0, 0, 1, 1,
0.8792065, 0.1148164, 1.095727, 0, 0, 0, 1, 1,
0.8826895, -1.709143, 0.9649844, 0, 0, 0, 1, 1,
0.8865591, -0.322573, 2.8382, 0, 0, 0, 1, 1,
0.8936217, 2.203763, -0.2466387, 0, 0, 0, 1, 1,
0.9069564, 0.522146, 0.3505659, 0, 0, 0, 1, 1,
0.9131159, 1.038267, 0.1238924, 0, 0, 0, 1, 1,
0.9148908, -1.66356, 2.750504, 1, 1, 1, 1, 1,
0.9190038, 0.2655926, 1.123481, 1, 1, 1, 1, 1,
0.9223127, 0.945908, -1.64128, 1, 1, 1, 1, 1,
0.9225302, -0.08614124, 3.107745, 1, 1, 1, 1, 1,
0.9234139, 0.6800104, 1.06135, 1, 1, 1, 1, 1,
0.9283533, -1.145295, 0.9392888, 1, 1, 1, 1, 1,
0.9290546, 0.169043, 1.351197, 1, 1, 1, 1, 1,
0.9359607, -0.7516109, 1.882401, 1, 1, 1, 1, 1,
0.9362136, 1.072601, 0.9545131, 1, 1, 1, 1, 1,
0.9380921, 0.2103797, 1.983452, 1, 1, 1, 1, 1,
0.938356, -1.219229, 3.561884, 1, 1, 1, 1, 1,
0.9406284, 1.876655, -1.191832, 1, 1, 1, 1, 1,
0.9547504, -1.678039, 2.070833, 1, 1, 1, 1, 1,
0.9568351, -0.07473259, 0.6156648, 1, 1, 1, 1, 1,
0.9649884, 0.9379241, 0.004041044, 1, 1, 1, 1, 1,
0.9654298, 0.5029002, 1.897787, 0, 0, 1, 1, 1,
0.9657753, 0.02798243, 1.319612, 1, 0, 0, 1, 1,
0.9756789, -0.3721514, 2.771757, 1, 0, 0, 1, 1,
0.9792967, 0.8806211, 0.1391094, 1, 0, 0, 1, 1,
0.984165, 0.5604903, 1.867831, 1, 0, 0, 1, 1,
0.9919161, -1.593511, 2.018724, 1, 0, 0, 1, 1,
0.9958999, -0.2868022, 2.104671, 0, 0, 0, 1, 1,
0.997526, 0.9819901, 2.306562, 0, 0, 0, 1, 1,
1.009178, -2.313704, 3.157094, 0, 0, 0, 1, 1,
1.013762, 0.2447426, 1.240566, 0, 0, 0, 1, 1,
1.015725, -0.5616728, 2.691563, 0, 0, 0, 1, 1,
1.017446, 1.837297, -0.3223914, 0, 0, 0, 1, 1,
1.039532, -2.081233, 1.584971, 0, 0, 0, 1, 1,
1.040856, -0.4382269, 2.814846, 1, 1, 1, 1, 1,
1.045274, -1.50062, 3.05368, 1, 1, 1, 1, 1,
1.045655, 0.1115163, 2.732585, 1, 1, 1, 1, 1,
1.046584, 0.5252171, 1.212742, 1, 1, 1, 1, 1,
1.056505, 0.2888048, 1.424939, 1, 1, 1, 1, 1,
1.060657, -0.1552913, 2.265729, 1, 1, 1, 1, 1,
1.063553, 2.095977, -0.1666523, 1, 1, 1, 1, 1,
1.065455, -1.123109, 2.085635, 1, 1, 1, 1, 1,
1.080478, -0.9314649, 1.382074, 1, 1, 1, 1, 1,
1.082074, -1.301528, 1.884172, 1, 1, 1, 1, 1,
1.082902, -0.0530996, 0.2394573, 1, 1, 1, 1, 1,
1.087202, -0.4535775, 0.4166151, 1, 1, 1, 1, 1,
1.0881, 1.002819, 1.025285, 1, 1, 1, 1, 1,
1.089639, -2.73537, 2.870787, 1, 1, 1, 1, 1,
1.096269, 0.1620575, 0.7869716, 1, 1, 1, 1, 1,
1.101097, 0.8685142, 0.340602, 0, 0, 1, 1, 1,
1.101596, 1.117748, 0.9571682, 1, 0, 0, 1, 1,
1.10371, -0.1644205, 1.898562, 1, 0, 0, 1, 1,
1.103786, 0.6574458, -0.4463734, 1, 0, 0, 1, 1,
1.10466, -0.8618334, -0.3465618, 1, 0, 0, 1, 1,
1.108353, -1.404721, 2.315088, 1, 0, 0, 1, 1,
1.110555, -0.6832277, 2.459082, 0, 0, 0, 1, 1,
1.118799, -0.09157687, 0.5418025, 0, 0, 0, 1, 1,
1.119573, -0.7078125, 2.863094, 0, 0, 0, 1, 1,
1.122229, 0.8184208, 0.5996821, 0, 0, 0, 1, 1,
1.130882, -0.3520844, 1.463511, 0, 0, 0, 1, 1,
1.131805, -0.5507545, 2.291181, 0, 0, 0, 1, 1,
1.132418, 0.8040512, 0.5936105, 0, 0, 0, 1, 1,
1.132806, -0.7253093, 0.1172905, 1, 1, 1, 1, 1,
1.132874, 0.0005877006, 3.311116, 1, 1, 1, 1, 1,
1.137736, 0.9365846, 2.671103, 1, 1, 1, 1, 1,
1.13997, -0.1420377, 2.899886, 1, 1, 1, 1, 1,
1.15084, -1.527539, 1.143027, 1, 1, 1, 1, 1,
1.152681, 0.6963211, 0.7873105, 1, 1, 1, 1, 1,
1.154353, 0.6277922, 1.456973, 1, 1, 1, 1, 1,
1.15646, -1.461939, 1.326366, 1, 1, 1, 1, 1,
1.161427, -0.359428, 3.161551, 1, 1, 1, 1, 1,
1.164533, 0.5218686, 1.317255, 1, 1, 1, 1, 1,
1.165159, 0.2538179, 0.7198491, 1, 1, 1, 1, 1,
1.178724, 0.1844873, 0.8194071, 1, 1, 1, 1, 1,
1.182053, -0.9481898, 1.054195, 1, 1, 1, 1, 1,
1.183123, -0.2469409, 1.130045, 1, 1, 1, 1, 1,
1.18679, 0.7220204, 3.28251, 1, 1, 1, 1, 1,
1.194508, 1.4774, 0.9450013, 0, 0, 1, 1, 1,
1.208126, 2.054749, 0.8903325, 1, 0, 0, 1, 1,
1.211641, 0.2923989, 2.033494, 1, 0, 0, 1, 1,
1.213003, 0.5666221, 1.964121, 1, 0, 0, 1, 1,
1.221015, -1.030071, 4.320494, 1, 0, 0, 1, 1,
1.226674, 0.1422628, 3.008549, 1, 0, 0, 1, 1,
1.232288, -0.6316567, 2.295401, 0, 0, 0, 1, 1,
1.238718, 1.070507, 0.9702832, 0, 0, 0, 1, 1,
1.256744, -0.6520184, 1.906692, 0, 0, 0, 1, 1,
1.2568, -0.6882955, 3.406637, 0, 0, 0, 1, 1,
1.262385, 1.4637, 0.9131178, 0, 0, 0, 1, 1,
1.266218, -0.001088338, 3.081435, 0, 0, 0, 1, 1,
1.267176, -2.41308, 2.60716, 0, 0, 0, 1, 1,
1.26738, -0.5131867, 1.079178, 1, 1, 1, 1, 1,
1.26766, -0.3627057, 2.130803, 1, 1, 1, 1, 1,
1.269099, -1.879504, 3.070984, 1, 1, 1, 1, 1,
1.274292, -0.1497155, 2.930981, 1, 1, 1, 1, 1,
1.278389, -0.7614823, 0.1624148, 1, 1, 1, 1, 1,
1.282868, 1.330261, -0.07265063, 1, 1, 1, 1, 1,
1.285606, -1.112946, 1.743095, 1, 1, 1, 1, 1,
1.305993, -0.7550835, 2.295962, 1, 1, 1, 1, 1,
1.309054, -0.4944841, 3.789592, 1, 1, 1, 1, 1,
1.311908, 0.224577, 3.281348, 1, 1, 1, 1, 1,
1.312363, -1.333782, 2.909272, 1, 1, 1, 1, 1,
1.335101, -0.2870214, 2.520261, 1, 1, 1, 1, 1,
1.33789, -1.084302, 2.53528, 1, 1, 1, 1, 1,
1.3657, 1.212199, 1.423996, 1, 1, 1, 1, 1,
1.366614, -1.676006, 1.856134, 1, 1, 1, 1, 1,
1.366825, -1.534644, 0.9518706, 0, 0, 1, 1, 1,
1.372993, 1.982192, 1.180301, 1, 0, 0, 1, 1,
1.386271, 0.5888028, 0.6433424, 1, 0, 0, 1, 1,
1.388352, -1.487391, 3.642694, 1, 0, 0, 1, 1,
1.394047, -0.3189119, 0.1972448, 1, 0, 0, 1, 1,
1.3991, -0.7015332, 2.396685, 1, 0, 0, 1, 1,
1.403878, 0.8430403, 0.8539238, 0, 0, 0, 1, 1,
1.408721, 1.032382, -0.4627752, 0, 0, 0, 1, 1,
1.408731, 1.109995, -0.3650246, 0, 0, 0, 1, 1,
1.415351, 1.318146, -0.6681679, 0, 0, 0, 1, 1,
1.415605, 1.393356, 0.4505925, 0, 0, 0, 1, 1,
1.435466, -0.804447, 2.5851, 0, 0, 0, 1, 1,
1.440605, 0.738389, 1.733999, 0, 0, 0, 1, 1,
1.46592, 0.4980577, 2.743298, 1, 1, 1, 1, 1,
1.471672, 0.1656329, 1.568324, 1, 1, 1, 1, 1,
1.473767, 0.3941347, 1.602213, 1, 1, 1, 1, 1,
1.475425, -0.2362195, 0.5187334, 1, 1, 1, 1, 1,
1.491419, -1.203074, 2.646058, 1, 1, 1, 1, 1,
1.508509, 0.8152155, 0.7001544, 1, 1, 1, 1, 1,
1.509774, 1.137632, 1.211649, 1, 1, 1, 1, 1,
1.514931, -0.8433822, 2.260566, 1, 1, 1, 1, 1,
1.521439, -0.2355497, 1.353847, 1, 1, 1, 1, 1,
1.528103, 0.2667525, 1.887525, 1, 1, 1, 1, 1,
1.533393, -0.1139418, 1.938336, 1, 1, 1, 1, 1,
1.534885, -1.391172, 2.349473, 1, 1, 1, 1, 1,
1.53613, 1.083081, 0.8628962, 1, 1, 1, 1, 1,
1.554829, -1.157742, 4.580402, 1, 1, 1, 1, 1,
1.557446, -0.2254773, 0.9656892, 1, 1, 1, 1, 1,
1.570172, 0.4213658, 1.857475, 0, 0, 1, 1, 1,
1.572264, -0.7879232, 2.715167, 1, 0, 0, 1, 1,
1.574629, 0.1448996, 1.466235, 1, 0, 0, 1, 1,
1.578123, -1.685678, 2.570097, 1, 0, 0, 1, 1,
1.630525, 0.3466141, 1.625999, 1, 0, 0, 1, 1,
1.637665, -0.5117497, 2.578622, 1, 0, 0, 1, 1,
1.639785, 0.9229506, -0.1227173, 0, 0, 0, 1, 1,
1.643624, 0.1782851, 1.534681, 0, 0, 0, 1, 1,
1.649494, 1.364534, 1.413924, 0, 0, 0, 1, 1,
1.665343, -1.462347, 2.644019, 0, 0, 0, 1, 1,
1.689033, -2.189482, 2.997353, 0, 0, 0, 1, 1,
1.691282, 0.4162944, 2.449788, 0, 0, 0, 1, 1,
1.72197, 0.8661675, 0.9400871, 0, 0, 0, 1, 1,
1.7683, -0.120688, 1.583108, 1, 1, 1, 1, 1,
1.774104, -0.5724435, 2.503326, 1, 1, 1, 1, 1,
1.779962, 1.514011, 0.67263, 1, 1, 1, 1, 1,
1.790707, 0.6933085, 0.8106297, 1, 1, 1, 1, 1,
1.809803, -1.021515, 1.649374, 1, 1, 1, 1, 1,
1.82621, -0.4596204, 0.5800853, 1, 1, 1, 1, 1,
1.845048, -0.0284323, 2.502053, 1, 1, 1, 1, 1,
1.847285, -1.357314, 2.253902, 1, 1, 1, 1, 1,
1.857234, -0.736429, 2.785781, 1, 1, 1, 1, 1,
1.862259, -0.303499, 2.935426, 1, 1, 1, 1, 1,
1.862388, 0.02359665, 2.204444, 1, 1, 1, 1, 1,
1.892514, 0.7804369, 0.4677495, 1, 1, 1, 1, 1,
1.897003, 0.6878576, 1.228357, 1, 1, 1, 1, 1,
1.903131, 0.3000535, 1.452217, 1, 1, 1, 1, 1,
1.905646, 1.534187, 1.337197, 1, 1, 1, 1, 1,
1.98176, -0.2327839, 1.905342, 0, 0, 1, 1, 1,
1.998759, -0.004530159, 1.353321, 1, 0, 0, 1, 1,
2.012947, -0.2655117, 1.537803, 1, 0, 0, 1, 1,
2.030143, -0.6977417, 2.068443, 1, 0, 0, 1, 1,
2.077277, 0.1717622, 3.451651, 1, 0, 0, 1, 1,
2.131921, -1.672516, 2.443255, 1, 0, 0, 1, 1,
2.146974, -1.087635, 3.230496, 0, 0, 0, 1, 1,
2.162101, 0.382334, 3.652826, 0, 0, 0, 1, 1,
2.167344, -0.06103425, -0.1749236, 0, 0, 0, 1, 1,
2.193309, 1.493341, 2.082616, 0, 0, 0, 1, 1,
2.261561, 1.953856, 1.21039, 0, 0, 0, 1, 1,
2.309831, 0.1991966, -0.6789976, 0, 0, 0, 1, 1,
2.407761, -0.6582388, 2.216208, 0, 0, 0, 1, 1,
2.427847, -2.511097, 2.031001, 1, 1, 1, 1, 1,
2.518413, -2.455898, 1.293228, 1, 1, 1, 1, 1,
2.705612, 0.9090549, 0.9038498, 1, 1, 1, 1, 1,
2.860464, -1.270007, 3.085156, 1, 1, 1, 1, 1,
2.878869, 0.9415641, 2.059629, 1, 1, 1, 1, 1,
3.074429, 0.16471, 0.5509384, 1, 1, 1, 1, 1,
3.128969, -0.3017367, 3.182746, 1, 1, 1, 1, 1
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
var radius = 8.920035;
var distance = 31.33125;
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
mvMatrix.translate( -0.1377063, 0.1177553, -0.5050044 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -31.33125);
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
