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
-4.203554, -0.02593777, -0.5357602, 1, 0, 0, 1,
-2.720672, -1.195407, -3.541466, 1, 0.007843138, 0, 1,
-2.594471, -1.104305, 0.6593833, 1, 0.01176471, 0, 1,
-2.487297, 0.3033175, -1.371381, 1, 0.01960784, 0, 1,
-2.439618, -1.431214, -1.74266, 1, 0.02352941, 0, 1,
-2.408717, -0.7543525, -2.518777, 1, 0.03137255, 0, 1,
-2.373353, 1.492667, -0.208177, 1, 0.03529412, 0, 1,
-2.364086, -0.5945925, -2.657069, 1, 0.04313726, 0, 1,
-2.345937, -0.3376287, -2.468531, 1, 0.04705882, 0, 1,
-2.320533, -0.1698911, -2.534908, 1, 0.05490196, 0, 1,
-2.311357, 1.354935, -3.332847, 1, 0.05882353, 0, 1,
-2.24705, 0.9120313, 0.1790628, 1, 0.06666667, 0, 1,
-2.246655, 1.342876, -3.078663, 1, 0.07058824, 0, 1,
-2.154123, 0.8895461, -1.240468, 1, 0.07843138, 0, 1,
-2.152764, 1.647951, -1.114983, 1, 0.08235294, 0, 1,
-2.141001, 1.248782, -1.474438, 1, 0.09019608, 0, 1,
-2.137349, 2.114915, -0.25405, 1, 0.09411765, 0, 1,
-2.134954, 0.392304, -1.431454, 1, 0.1019608, 0, 1,
-2.103152, 0.1379176, -2.520087, 1, 0.1098039, 0, 1,
-2.057256, 0.4917219, -0.05925963, 1, 0.1137255, 0, 1,
-2.052644, 0.03845813, -1.376287, 1, 0.1215686, 0, 1,
-2.018896, 0.5802695, -3.708274, 1, 0.1254902, 0, 1,
-2.018519, -0.2560502, -0.4864517, 1, 0.1333333, 0, 1,
-2.011778, 1.852269, -0.5937592, 1, 0.1372549, 0, 1,
-2.004377, 0.9297007, -1.631647, 1, 0.145098, 0, 1,
-1.959918, -0.2457441, -1.995184, 1, 0.1490196, 0, 1,
-1.942088, -0.5119558, -1.838786, 1, 0.1568628, 0, 1,
-1.941136, 1.628099, -1.706861, 1, 0.1607843, 0, 1,
-1.909147, -1.789564, -3.540304, 1, 0.1686275, 0, 1,
-1.903707, -1.457315, -3.224093, 1, 0.172549, 0, 1,
-1.874774, -0.8597556, -2.762069, 1, 0.1803922, 0, 1,
-1.853607, -1.096223, -1.69818, 1, 0.1843137, 0, 1,
-1.842935, 0.03119566, -0.7798614, 1, 0.1921569, 0, 1,
-1.815593, -0.08124282, -1.099217, 1, 0.1960784, 0, 1,
-1.777716, -1.523789, -3.44048, 1, 0.2039216, 0, 1,
-1.772839, -0.9970179, -2.528025, 1, 0.2117647, 0, 1,
-1.734284, -0.8697502, -2.15921, 1, 0.2156863, 0, 1,
-1.730404, 1.316885, 0.6228486, 1, 0.2235294, 0, 1,
-1.726591, 0.3149863, -1.880327, 1, 0.227451, 0, 1,
-1.721531, 0.6743991, 0.4275663, 1, 0.2352941, 0, 1,
-1.700169, 0.9050748, -1.68604, 1, 0.2392157, 0, 1,
-1.690018, 2.11423, -2.533203, 1, 0.2470588, 0, 1,
-1.684429, -1.521415, -2.427794, 1, 0.2509804, 0, 1,
-1.673149, -1.358316, -2.285418, 1, 0.2588235, 0, 1,
-1.666638, -1.588537, -0.7248781, 1, 0.2627451, 0, 1,
-1.655678, -1.001235, -1.600514, 1, 0.2705882, 0, 1,
-1.640535, -0.9500754, -3.950391, 1, 0.2745098, 0, 1,
-1.632915, -0.9228317, 0.09222367, 1, 0.282353, 0, 1,
-1.594016, -1.375879, -2.528282, 1, 0.2862745, 0, 1,
-1.591794, -0.543037, -3.284961, 1, 0.2941177, 0, 1,
-1.588871, -0.08037546, -0.7167558, 1, 0.3019608, 0, 1,
-1.575767, 0.2131157, -2.139431, 1, 0.3058824, 0, 1,
-1.556178, 1.113718, -1.290433, 1, 0.3137255, 0, 1,
-1.55042, 0.4988475, -1.12539, 1, 0.3176471, 0, 1,
-1.547829, 0.8290274, -1.321741, 1, 0.3254902, 0, 1,
-1.543428, 1.175419, -0.609791, 1, 0.3294118, 0, 1,
-1.538775, -3.141536, -2.857995, 1, 0.3372549, 0, 1,
-1.537215, -0.3857507, -1.732977, 1, 0.3411765, 0, 1,
-1.529335, 1.854262, -0.1463875, 1, 0.3490196, 0, 1,
-1.52383, 1.063711, -1.749034, 1, 0.3529412, 0, 1,
-1.519643, -1.803747, -2.238583, 1, 0.3607843, 0, 1,
-1.509531, 0.4113331, -1.763348, 1, 0.3647059, 0, 1,
-1.50668, -0.4212442, -1.830534, 1, 0.372549, 0, 1,
-1.497388, -2.37252, -3.564666, 1, 0.3764706, 0, 1,
-1.492327, -0.6392121, -1.572451, 1, 0.3843137, 0, 1,
-1.487549, -0.5786135, -1.481623, 1, 0.3882353, 0, 1,
-1.482528, 0.3941563, -0.829731, 1, 0.3960784, 0, 1,
-1.465885, 2.861123, -2.284917, 1, 0.4039216, 0, 1,
-1.463602, 0.1585277, -2.222878, 1, 0.4078431, 0, 1,
-1.448174, -0.6849692, -3.981978, 1, 0.4156863, 0, 1,
-1.442175, -0.8728516, -2.788019, 1, 0.4196078, 0, 1,
-1.422757, 0.06219159, -1.182535, 1, 0.427451, 0, 1,
-1.421574, -2.1297, -3.211637, 1, 0.4313726, 0, 1,
-1.40262, -0.004407691, -1.040233, 1, 0.4392157, 0, 1,
-1.396442, -2.853255, -4.743045, 1, 0.4431373, 0, 1,
-1.395037, -0.7136565, -1.295947, 1, 0.4509804, 0, 1,
-1.390039, -1.0658, -2.437301, 1, 0.454902, 0, 1,
-1.367926, -0.8823499, -1.935529, 1, 0.4627451, 0, 1,
-1.364945, -1.246575, -3.066018, 1, 0.4666667, 0, 1,
-1.361113, 0.9971192, 0.5310639, 1, 0.4745098, 0, 1,
-1.34486, 0.5301718, -1.191869, 1, 0.4784314, 0, 1,
-1.333499, 0.5702294, -1.814205, 1, 0.4862745, 0, 1,
-1.310971, -2.205785, -3.620067, 1, 0.4901961, 0, 1,
-1.293845, 0.005909829, -1.416065, 1, 0.4980392, 0, 1,
-1.29232, -0.424172, -1.305006, 1, 0.5058824, 0, 1,
-1.289708, -1.892309, -1.753858, 1, 0.509804, 0, 1,
-1.288157, -1.555164, -3.341952, 1, 0.5176471, 0, 1,
-1.272475, -0.4849743, -1.219315, 1, 0.5215687, 0, 1,
-1.267785, 1.751209, 0.4968672, 1, 0.5294118, 0, 1,
-1.26565, -0.5972078, -3.34638, 1, 0.5333334, 0, 1,
-1.256379, -0.5634797, -2.824299, 1, 0.5411765, 0, 1,
-1.247395, -0.8118641, -2.25597, 1, 0.5450981, 0, 1,
-1.24138, 0.6218548, -1.110355, 1, 0.5529412, 0, 1,
-1.234448, -0.321833, -2.460269, 1, 0.5568628, 0, 1,
-1.216557, -2.958982, -2.914236, 1, 0.5647059, 0, 1,
-1.213363, 0.6454525, -1.969831, 1, 0.5686275, 0, 1,
-1.199911, 0.6203985, -1.055545, 1, 0.5764706, 0, 1,
-1.196972, -0.5550038, -1.960095, 1, 0.5803922, 0, 1,
-1.195191, -2.148205, -3.018746, 1, 0.5882353, 0, 1,
-1.190145, -0.452524, -0.8759798, 1, 0.5921569, 0, 1,
-1.188138, -0.2921368, -1.995405, 1, 0.6, 0, 1,
-1.186479, 0.9256938, -2.561586, 1, 0.6078432, 0, 1,
-1.173291, -0.834136, -3.653586, 1, 0.6117647, 0, 1,
-1.172311, -0.1143057, -2.084207, 1, 0.6196079, 0, 1,
-1.166334, -0.3846822, -1.165529, 1, 0.6235294, 0, 1,
-1.162591, -0.2685741, -0.5142347, 1, 0.6313726, 0, 1,
-1.150536, 0.9051495, -0.9685661, 1, 0.6352941, 0, 1,
-1.149243, 0.5624284, -3.901358, 1, 0.6431373, 0, 1,
-1.146842, -0.7174513, -2.728243, 1, 0.6470588, 0, 1,
-1.134138, -1.277461, -1.846248, 1, 0.654902, 0, 1,
-1.134031, 1.004531, -3.120038, 1, 0.6588235, 0, 1,
-1.132509, -0.5659573, -2.553832, 1, 0.6666667, 0, 1,
-1.124291, -0.05145081, -2.567271, 1, 0.6705883, 0, 1,
-1.123582, 0.2881062, -1.211035, 1, 0.6784314, 0, 1,
-1.122051, -2.171426, -2.246628, 1, 0.682353, 0, 1,
-1.12013, -1.530825, -3.556231, 1, 0.6901961, 0, 1,
-1.119556, 2.091739, 0.7082701, 1, 0.6941177, 0, 1,
-1.116305, 1.332577, -0.1810502, 1, 0.7019608, 0, 1,
-1.113247, 0.5015597, -3.109273, 1, 0.7098039, 0, 1,
-1.106974, 1.144954, -0.9273511, 1, 0.7137255, 0, 1,
-1.105381, 0.5347588, -0.8663658, 1, 0.7215686, 0, 1,
-1.10196, 1.956872, 0.5749726, 1, 0.7254902, 0, 1,
-1.099957, 0.03542306, -3.077553, 1, 0.7333333, 0, 1,
-1.097006, 2.296656, 0.1691825, 1, 0.7372549, 0, 1,
-1.086413, -0.4704649, -2.221987, 1, 0.7450981, 0, 1,
-1.078015, 0.3278418, -2.244389, 1, 0.7490196, 0, 1,
-1.072888, 0.8110397, -2.937222, 1, 0.7568628, 0, 1,
-1.072448, 1.183662, -1.755688, 1, 0.7607843, 0, 1,
-1.061684, -1.155469, -2.481586, 1, 0.7686275, 0, 1,
-1.058286, 0.8386188, 0.0235435, 1, 0.772549, 0, 1,
-1.054293, 1.203574, 0.1148496, 1, 0.7803922, 0, 1,
-1.052838, 0.4346851, 0.0714955, 1, 0.7843137, 0, 1,
-1.044578, -0.2678322, -1.279075, 1, 0.7921569, 0, 1,
-1.040717, -0.9140895, -1.873957, 1, 0.7960784, 0, 1,
-1.030723, 1.874089, -0.6124446, 1, 0.8039216, 0, 1,
-1.030564, -0.914126, -1.890196, 1, 0.8117647, 0, 1,
-1.027098, 1.026467, -0.9526576, 1, 0.8156863, 0, 1,
-1.026388, 0.897037, 0.4281011, 1, 0.8235294, 0, 1,
-1.023866, 0.4131504, -1.325178, 1, 0.827451, 0, 1,
-1.022274, -0.7363737, -1.724049, 1, 0.8352941, 0, 1,
-1.014597, -0.2400867, -2.73548, 1, 0.8392157, 0, 1,
-1.006771, 0.1490136, -1.579295, 1, 0.8470588, 0, 1,
-1.000393, 1.129132, 0.8168526, 1, 0.8509804, 0, 1,
-0.9990344, 0.7917219, -1.068184, 1, 0.8588235, 0, 1,
-0.996941, 1.369998, 0.4429621, 1, 0.8627451, 0, 1,
-0.9966765, -0.2425104, -2.896403, 1, 0.8705882, 0, 1,
-0.9949096, 0.01133524, -0.5107652, 1, 0.8745098, 0, 1,
-0.9922894, 1.147498, 0.4742039, 1, 0.8823529, 0, 1,
-0.9921589, 1.317311, 0.8657891, 1, 0.8862745, 0, 1,
-0.9854369, 0.1518596, -1.886147, 1, 0.8941177, 0, 1,
-0.9761041, -0.7244186, -1.789385, 1, 0.8980392, 0, 1,
-0.9688325, 0.1212912, -0.2412525, 1, 0.9058824, 0, 1,
-0.9654065, 0.1761784, -0.7228682, 1, 0.9137255, 0, 1,
-0.9645727, -0.007750559, -0.4080603, 1, 0.9176471, 0, 1,
-0.9612294, 2.171089, 0.4225191, 1, 0.9254902, 0, 1,
-0.9597366, -0.9026076, -2.001447, 1, 0.9294118, 0, 1,
-0.9451975, 0.8992679, -1.099619, 1, 0.9372549, 0, 1,
-0.9438347, 0.6629889, -1.09928, 1, 0.9411765, 0, 1,
-0.9401584, -0.485525, -0.4897515, 1, 0.9490196, 0, 1,
-0.938879, -0.6012284, -0.5011225, 1, 0.9529412, 0, 1,
-0.9377536, 1.062589, -3.028901, 1, 0.9607843, 0, 1,
-0.9372102, -0.7555795, -2.419177, 1, 0.9647059, 0, 1,
-0.9329609, -0.06870557, 0.5061927, 1, 0.972549, 0, 1,
-0.932181, -0.8365957, -3.140942, 1, 0.9764706, 0, 1,
-0.9246873, 0.8669014, -0.06187204, 1, 0.9843137, 0, 1,
-0.9173864, -2.587345, -0.8850643, 1, 0.9882353, 0, 1,
-0.9160768, 1.946398, -1.142808, 1, 0.9960784, 0, 1,
-0.910573, 0.1594821, -0.380341, 0.9960784, 1, 0, 1,
-0.906864, -0.5300325, -1.371028, 0.9921569, 1, 0, 1,
-0.9058567, -0.09411572, -2.819638, 0.9843137, 1, 0, 1,
-0.8999245, 0.03705022, -0.2510463, 0.9803922, 1, 0, 1,
-0.8919844, -0.1931048, -2.773836, 0.972549, 1, 0, 1,
-0.8894483, -1.203702, -2.917356, 0.9686275, 1, 0, 1,
-0.886753, 1.212925, -0.6639186, 0.9607843, 1, 0, 1,
-0.886032, 0.295372, -0.1450613, 0.9568627, 1, 0, 1,
-0.881464, 0.503265, -2.307946, 0.9490196, 1, 0, 1,
-0.8789582, 0.02884137, -2.242755, 0.945098, 1, 0, 1,
-0.8783388, 1.036593, -0.9842036, 0.9372549, 1, 0, 1,
-0.8765518, -0.6889953, -0.8355638, 0.9333333, 1, 0, 1,
-0.8755826, 0.8865346, -1.313486, 0.9254902, 1, 0, 1,
-0.8713809, 0.6059266, -1.319482, 0.9215686, 1, 0, 1,
-0.8691178, 0.5950625, -0.9910199, 0.9137255, 1, 0, 1,
-0.8619701, 1.398487, -0.5668573, 0.9098039, 1, 0, 1,
-0.8533328, -0.1974466, 0.04225733, 0.9019608, 1, 0, 1,
-0.8528544, -0.7361199, -3.848586, 0.8941177, 1, 0, 1,
-0.8500363, 1.33871, 0.9014853, 0.8901961, 1, 0, 1,
-0.8416854, -0.6910061, -0.3491238, 0.8823529, 1, 0, 1,
-0.8407154, 0.3492394, -0.3561, 0.8784314, 1, 0, 1,
-0.8384812, -0.2058724, -1.702376, 0.8705882, 1, 0, 1,
-0.8383613, 0.02827409, -0.3086993, 0.8666667, 1, 0, 1,
-0.8333408, 1.384541, -2.731424, 0.8588235, 1, 0, 1,
-0.8249558, -0.02696087, 0.4611868, 0.854902, 1, 0, 1,
-0.8185016, -0.4400627, -2.306804, 0.8470588, 1, 0, 1,
-0.8175266, 0.1926756, -2.796055, 0.8431373, 1, 0, 1,
-0.8092917, -0.2223039, -1.587141, 0.8352941, 1, 0, 1,
-0.8064015, -0.3093106, -3.404109, 0.8313726, 1, 0, 1,
-0.8061197, -0.1440952, -3.284718, 0.8235294, 1, 0, 1,
-0.8044747, -0.4400393, -3.596328, 0.8196079, 1, 0, 1,
-0.801071, 0.5336926, -1.257125, 0.8117647, 1, 0, 1,
-0.8009188, -1.86012, -3.433291, 0.8078431, 1, 0, 1,
-0.7955057, -0.8822007, -2.487899, 0.8, 1, 0, 1,
-0.7919886, 1.894442, -0.9799178, 0.7921569, 1, 0, 1,
-0.7854946, -0.4950675, -2.407513, 0.7882353, 1, 0, 1,
-0.7835122, -0.5799424, -0.881746, 0.7803922, 1, 0, 1,
-0.7802866, -1.225277, -2.943035, 0.7764706, 1, 0, 1,
-0.7793609, -0.5276274, -1.88703, 0.7686275, 1, 0, 1,
-0.772747, -0.1960575, -1.443097, 0.7647059, 1, 0, 1,
-0.7697797, 0.09403528, -0.6194533, 0.7568628, 1, 0, 1,
-0.7695256, -0.6957605, -1.611551, 0.7529412, 1, 0, 1,
-0.7636703, -1.601393, -2.046257, 0.7450981, 1, 0, 1,
-0.7609945, -0.5955767, -2.178771, 0.7411765, 1, 0, 1,
-0.7584267, -1.012201, -2.812164, 0.7333333, 1, 0, 1,
-0.7555544, 0.7888328, -1.545252, 0.7294118, 1, 0, 1,
-0.7549639, 0.6352381, -0.5742887, 0.7215686, 1, 0, 1,
-0.7525809, -0.462809, -2.248165, 0.7176471, 1, 0, 1,
-0.7519798, 0.2365748, -2.673932, 0.7098039, 1, 0, 1,
-0.746941, 0.1799365, -0.808082, 0.7058824, 1, 0, 1,
-0.7334669, -0.9674029, -3.184047, 0.6980392, 1, 0, 1,
-0.7295927, 1.318397, 0.7298985, 0.6901961, 1, 0, 1,
-0.7265694, -1.235062, -2.267174, 0.6862745, 1, 0, 1,
-0.7243893, 0.3279082, -0.6358919, 0.6784314, 1, 0, 1,
-0.7242369, 0.5929816, -1.021134, 0.6745098, 1, 0, 1,
-0.7158816, -0.2589368, -1.207291, 0.6666667, 1, 0, 1,
-0.7147865, 0.6159067, -0.6073462, 0.6627451, 1, 0, 1,
-0.708917, -0.978424, -3.167241, 0.654902, 1, 0, 1,
-0.7047309, 0.5861604, -2.609671, 0.6509804, 1, 0, 1,
-0.7042963, -1.725956, -1.231876, 0.6431373, 1, 0, 1,
-0.6976435, 0.7864559, -0.3202839, 0.6392157, 1, 0, 1,
-0.6957951, -0.2278539, -1.381141, 0.6313726, 1, 0, 1,
-0.6952097, -0.9457144, -3.475545, 0.627451, 1, 0, 1,
-0.6935636, 1.123964, -0.9321782, 0.6196079, 1, 0, 1,
-0.6905718, -0.007738183, -1.161548, 0.6156863, 1, 0, 1,
-0.6869835, -1.274582, -2.449898, 0.6078432, 1, 0, 1,
-0.6777702, 1.324168, 2.136161, 0.6039216, 1, 0, 1,
-0.6769387, -0.02018568, -1.894006, 0.5960785, 1, 0, 1,
-0.676147, -0.8598487, -1.860119, 0.5882353, 1, 0, 1,
-0.6751801, -1.470384, -2.579493, 0.5843138, 1, 0, 1,
-0.6745107, 0.3595493, -1.438826, 0.5764706, 1, 0, 1,
-0.6729925, 0.7225788, -1.240266, 0.572549, 1, 0, 1,
-0.6690422, -1.29518, -4.299231, 0.5647059, 1, 0, 1,
-0.6667473, -0.4807733, -2.825515, 0.5607843, 1, 0, 1,
-0.6628948, 0.1309528, -3.435936, 0.5529412, 1, 0, 1,
-0.662285, -0.1227857, -2.73805, 0.5490196, 1, 0, 1,
-0.6622249, 0.5490677, -0.352645, 0.5411765, 1, 0, 1,
-0.6605344, -0.18212, -3.277577, 0.5372549, 1, 0, 1,
-0.6546857, -0.430191, -3.272356, 0.5294118, 1, 0, 1,
-0.6498439, -0.6625579, -1.673292, 0.5254902, 1, 0, 1,
-0.647912, -0.5873228, -3.727756, 0.5176471, 1, 0, 1,
-0.6450111, -1.259509, -1.51418, 0.5137255, 1, 0, 1,
-0.6442743, -0.6052576, -3.349959, 0.5058824, 1, 0, 1,
-0.6385241, 1.201333, -0.7989591, 0.5019608, 1, 0, 1,
-0.6381243, -1.118203, -2.431253, 0.4941176, 1, 0, 1,
-0.6356605, -0.9826944, -2.914361, 0.4862745, 1, 0, 1,
-0.6316051, -0.3555829, -2.20948, 0.4823529, 1, 0, 1,
-0.6279104, -0.9006075, -2.136715, 0.4745098, 1, 0, 1,
-0.6273194, -0.03810552, -3.817526, 0.4705882, 1, 0, 1,
-0.6270634, -1.323114, -2.820137, 0.4627451, 1, 0, 1,
-0.6232917, 1.058562, -0.6143326, 0.4588235, 1, 0, 1,
-0.6109166, 1.128968, 0.04486503, 0.4509804, 1, 0, 1,
-0.610414, -0.2312531, 0.08796526, 0.4470588, 1, 0, 1,
-0.6080363, 1.227718, -0.8623435, 0.4392157, 1, 0, 1,
-0.607307, -1.004029, -1.689355, 0.4352941, 1, 0, 1,
-0.6066349, -0.9920612, -3.359493, 0.427451, 1, 0, 1,
-0.6042786, 1.812496, 0.2796794, 0.4235294, 1, 0, 1,
-0.601333, 1.048538, 0.4855297, 0.4156863, 1, 0, 1,
-0.5962657, 0.1634114, -1.125826, 0.4117647, 1, 0, 1,
-0.5960298, 0.3563267, 0.4629836, 0.4039216, 1, 0, 1,
-0.5946825, 1.304424, -1.585735, 0.3960784, 1, 0, 1,
-0.5925112, -0.799234, -2.023376, 0.3921569, 1, 0, 1,
-0.5920178, 0.8168035, -1.306144, 0.3843137, 1, 0, 1,
-0.5884649, -0.1377191, -3.963116, 0.3803922, 1, 0, 1,
-0.5879539, -0.5746276, -3.29951, 0.372549, 1, 0, 1,
-0.5827923, 0.1507086, -0.4873097, 0.3686275, 1, 0, 1,
-0.5790603, 0.5518817, -1.792586, 0.3607843, 1, 0, 1,
-0.5748785, 1.266496, 0.7041488, 0.3568628, 1, 0, 1,
-0.5744524, -0.3424339, -2.602022, 0.3490196, 1, 0, 1,
-0.5727752, 0.5979954, -1.404933, 0.345098, 1, 0, 1,
-0.5727114, 0.6543806, -0.767494, 0.3372549, 1, 0, 1,
-0.5721114, 0.8148546, -1.626506, 0.3333333, 1, 0, 1,
-0.5711296, 0.5260365, -1.314373, 0.3254902, 1, 0, 1,
-0.5706021, -0.5894529, 0.1405958, 0.3215686, 1, 0, 1,
-0.5703406, 0.2941779, -0.3945924, 0.3137255, 1, 0, 1,
-0.5653377, 1.708814, -1.683504, 0.3098039, 1, 0, 1,
-0.5651478, 0.7372331, 1.284215, 0.3019608, 1, 0, 1,
-0.5641395, -0.8456799, -3.704445, 0.2941177, 1, 0, 1,
-0.5571752, -0.2500942, -3.208662, 0.2901961, 1, 0, 1,
-0.5560247, -0.6079966, -4.322807, 0.282353, 1, 0, 1,
-0.549609, 0.564352, -1.443729, 0.2784314, 1, 0, 1,
-0.5454065, -1.189831, -3.125961, 0.2705882, 1, 0, 1,
-0.5453222, -1.092691, -2.625028, 0.2666667, 1, 0, 1,
-0.5418609, 0.006189645, -2.535208, 0.2588235, 1, 0, 1,
-0.5380992, -0.7504894, -3.42689, 0.254902, 1, 0, 1,
-0.5379952, -0.7396742, -2.771126, 0.2470588, 1, 0, 1,
-0.5373865, 0.4133972, 0.6239558, 0.2431373, 1, 0, 1,
-0.5347897, 0.9719869, -2.041052, 0.2352941, 1, 0, 1,
-0.5250145, 0.5336537, 0.6314124, 0.2313726, 1, 0, 1,
-0.5239156, 2.237771, 1.105727, 0.2235294, 1, 0, 1,
-0.5147675, -0.5720226, -2.786821, 0.2196078, 1, 0, 1,
-0.507976, -1.646168, -3.417381, 0.2117647, 1, 0, 1,
-0.5060078, 0.06288566, -2.612192, 0.2078431, 1, 0, 1,
-0.5049239, -0.2001471, -3.62759, 0.2, 1, 0, 1,
-0.499208, -0.4735925, -4.149705, 0.1921569, 1, 0, 1,
-0.492695, 0.2814761, -1.476373, 0.1882353, 1, 0, 1,
-0.4892459, 0.5535991, -1.499722, 0.1803922, 1, 0, 1,
-0.4842558, 0.2282547, -2.441116, 0.1764706, 1, 0, 1,
-0.4814826, 0.7542492, -0.3227304, 0.1686275, 1, 0, 1,
-0.4785366, 0.3642193, -0.9301524, 0.1647059, 1, 0, 1,
-0.4695584, -0.6046891, -0.6747438, 0.1568628, 1, 0, 1,
-0.46906, 0.7720494, -0.2324189, 0.1529412, 1, 0, 1,
-0.4673601, -0.2563705, -3.132687, 0.145098, 1, 0, 1,
-0.4665795, -1.930146, -2.667551, 0.1411765, 1, 0, 1,
-0.4646383, -0.2847233, -2.854272, 0.1333333, 1, 0, 1,
-0.4615847, 0.003491846, -1.116995, 0.1294118, 1, 0, 1,
-0.4552449, -1.716126, -4.13702, 0.1215686, 1, 0, 1,
-0.4522988, -0.2673611, -2.463591, 0.1176471, 1, 0, 1,
-0.4514177, -0.04972361, -2.921444, 0.1098039, 1, 0, 1,
-0.4497931, 1.799194, 0.06772647, 0.1058824, 1, 0, 1,
-0.4481227, -0.1640053, -0.5349741, 0.09803922, 1, 0, 1,
-0.4465625, 0.9173306, -0.2065404, 0.09019608, 1, 0, 1,
-0.4443598, -0.03691068, -1.689105, 0.08627451, 1, 0, 1,
-0.4416206, -1.407118, -2.966115, 0.07843138, 1, 0, 1,
-0.440507, 0.2987857, -0.2837024, 0.07450981, 1, 0, 1,
-0.4247346, -2.056393, -2.319207, 0.06666667, 1, 0, 1,
-0.4206932, -1.699252, -3.206841, 0.0627451, 1, 0, 1,
-0.4161758, -1.595856, -2.493898, 0.05490196, 1, 0, 1,
-0.4107075, 1.726759, -0.3320582, 0.05098039, 1, 0, 1,
-0.4096958, -0.6625409, -1.814794, 0.04313726, 1, 0, 1,
-0.4078774, -1.574379, -2.878974, 0.03921569, 1, 0, 1,
-0.4061914, 0.6313155, -0.04442357, 0.03137255, 1, 0, 1,
-0.3994786, 1.28599, -0.9329971, 0.02745098, 1, 0, 1,
-0.3937773, -0.863148, -3.601443, 0.01960784, 1, 0, 1,
-0.3937611, -2.621037, -3.648903, 0.01568628, 1, 0, 1,
-0.3919719, 0.5591685, -0.8584213, 0.007843138, 1, 0, 1,
-0.3915234, 0.2721976, -0.1537772, 0.003921569, 1, 0, 1,
-0.3854327, 0.5846036, -0.9731557, 0, 1, 0.003921569, 1,
-0.3729955, 0.763474, -0.2274698, 0, 1, 0.01176471, 1,
-0.3700436, -2.661638, -2.833711, 0, 1, 0.01568628, 1,
-0.3640607, 0.2110971, -1.666123, 0, 1, 0.02352941, 1,
-0.3614437, 0.6308711, 1.676434, 0, 1, 0.02745098, 1,
-0.3553499, -1.194716, -3.037945, 0, 1, 0.03529412, 1,
-0.3521631, 0.7413031, -0.3640606, 0, 1, 0.03921569, 1,
-0.3489421, -0.3345801, -2.148706, 0, 1, 0.04705882, 1,
-0.3433917, -0.5080642, -2.817391, 0, 1, 0.05098039, 1,
-0.3418269, 0.1981137, -0.1500629, 0, 1, 0.05882353, 1,
-0.3314036, -0.9203439, -4.186123, 0, 1, 0.0627451, 1,
-0.3285329, -0.05195001, -2.87093, 0, 1, 0.07058824, 1,
-0.3271146, -0.4454958, -2.830499, 0, 1, 0.07450981, 1,
-0.3261577, -0.7353135, -3.904395, 0, 1, 0.08235294, 1,
-0.3241388, -0.1034624, -0.5427732, 0, 1, 0.08627451, 1,
-0.3184218, -0.3599623, -3.37494, 0, 1, 0.09411765, 1,
-0.3174675, 0.807059, -0.2405082, 0, 1, 0.1019608, 1,
-0.311748, 2.037281, -2.222237, 0, 1, 0.1058824, 1,
-0.3066969, 0.1082152, -0.1448281, 0, 1, 0.1137255, 1,
-0.3059227, 2.373843, -0.4967951, 0, 1, 0.1176471, 1,
-0.3046193, -0.4992326, -3.620538, 0, 1, 0.1254902, 1,
-0.3044901, -0.2551224, -3.132622, 0, 1, 0.1294118, 1,
-0.3042733, -1.161183, -3.75947, 0, 1, 0.1372549, 1,
-0.3002852, 0.1032976, -1.914836, 0, 1, 0.1411765, 1,
-0.2999064, -2.281777, -1.829577, 0, 1, 0.1490196, 1,
-0.2972968, -1.241464, -3.119231, 0, 1, 0.1529412, 1,
-0.2953303, 1.452866, -0.6152062, 0, 1, 0.1607843, 1,
-0.293118, -0.1715309, -1.925789, 0, 1, 0.1647059, 1,
-0.2894196, -3.102758, -3.296792, 0, 1, 0.172549, 1,
-0.2872572, -0.5127622, -2.491045, 0, 1, 0.1764706, 1,
-0.285559, -0.1245472, -2.873403, 0, 1, 0.1843137, 1,
-0.2851862, -0.5426915, -2.867294, 0, 1, 0.1882353, 1,
-0.2843973, 0.8224987, -0.1840781, 0, 1, 0.1960784, 1,
-0.2798992, -0.8191653, -3.813675, 0, 1, 0.2039216, 1,
-0.2791743, 3.10479, -1.094074, 0, 1, 0.2078431, 1,
-0.2790014, -0.1611819, -1.797904, 0, 1, 0.2156863, 1,
-0.2733871, 0.6597514, -2.557744, 0, 1, 0.2196078, 1,
-0.2722929, -0.05257884, -1.48998, 0, 1, 0.227451, 1,
-0.2700374, -1.558805, -3.05239, 0, 1, 0.2313726, 1,
-0.2694233, 1.377399, -1.712507, 0, 1, 0.2392157, 1,
-0.2647775, -1.127497, -3.311604, 0, 1, 0.2431373, 1,
-0.2639233, -1.241459, -3.318362, 0, 1, 0.2509804, 1,
-0.2631981, 0.4382478, -0.8322543, 0, 1, 0.254902, 1,
-0.2614335, 0.394158, 0.7342282, 0, 1, 0.2627451, 1,
-0.2596069, -1.190269, -3.689851, 0, 1, 0.2666667, 1,
-0.2590912, -1.239717, -2.938271, 0, 1, 0.2745098, 1,
-0.2548863, 0.4631561, -1.064282, 0, 1, 0.2784314, 1,
-0.2474784, 0.5242357, 0.4671983, 0, 1, 0.2862745, 1,
-0.2453613, 0.5832543, -0.7739875, 0, 1, 0.2901961, 1,
-0.2438759, -0.5572717, -2.009762, 0, 1, 0.2980392, 1,
-0.2431406, 1.683197, 0.8495034, 0, 1, 0.3058824, 1,
-0.2381111, 0.5185713, -0.9811786, 0, 1, 0.3098039, 1,
-0.2290359, -0.3243336, -1.683107, 0, 1, 0.3176471, 1,
-0.2281372, 1.822821, -1.359125, 0, 1, 0.3215686, 1,
-0.2279945, -0.8538889, -2.690852, 0, 1, 0.3294118, 1,
-0.227226, -0.6584811, -2.242874, 0, 1, 0.3333333, 1,
-0.2214215, 0.4453547, -1.390619, 0, 1, 0.3411765, 1,
-0.2173542, 0.7707137, -0.584752, 0, 1, 0.345098, 1,
-0.213857, 1.730202, -1.16882, 0, 1, 0.3529412, 1,
-0.2138485, 0.1238066, -2.093847, 0, 1, 0.3568628, 1,
-0.212594, -0.05635762, -3.044762, 0, 1, 0.3647059, 1,
-0.2084841, 0.5795482, -1.252147, 0, 1, 0.3686275, 1,
-0.2006114, -1.312464, -2.811457, 0, 1, 0.3764706, 1,
-0.198301, -0.1101523, -1.922412, 0, 1, 0.3803922, 1,
-0.1963802, -0.2214143, -2.772074, 0, 1, 0.3882353, 1,
-0.1963076, -0.8438772, -2.634624, 0, 1, 0.3921569, 1,
-0.1957548, 1.428982, 1.569916, 0, 1, 0.4, 1,
-0.195608, -0.08770376, -1.074395, 0, 1, 0.4078431, 1,
-0.1898829, 0.2743416, 0.02467079, 0, 1, 0.4117647, 1,
-0.185532, -0.3331884, -2.889562, 0, 1, 0.4196078, 1,
-0.1823835, 2.083582, -0.0265905, 0, 1, 0.4235294, 1,
-0.1815926, 0.02431367, -0.8880064, 0, 1, 0.4313726, 1,
-0.1768323, 0.57916, -1.696351, 0, 1, 0.4352941, 1,
-0.1712195, -1.133282, -2.574529, 0, 1, 0.4431373, 1,
-0.1663877, -0.5577218, -5.673363, 0, 1, 0.4470588, 1,
-0.1630728, 0.2260466, -0.2922835, 0, 1, 0.454902, 1,
-0.158106, -1.36827, -2.299125, 0, 1, 0.4588235, 1,
-0.1571323, -0.2015927, -3.254436, 0, 1, 0.4666667, 1,
-0.1564424, -0.8882871, -2.385502, 0, 1, 0.4705882, 1,
-0.1559404, -1.331515, -4.137586, 0, 1, 0.4784314, 1,
-0.1522608, 0.02933786, -1.779607, 0, 1, 0.4823529, 1,
-0.1503458, 1.762548, -0.7363161, 0, 1, 0.4901961, 1,
-0.1500809, 0.1115862, 0.4547527, 0, 1, 0.4941176, 1,
-0.1496639, -1.020537, -4.143033, 0, 1, 0.5019608, 1,
-0.1475478, 1.154224, 0.6252925, 0, 1, 0.509804, 1,
-0.1452756, 0.4817668, 0.2146969, 0, 1, 0.5137255, 1,
-0.1413206, -0.2597719, -1.366952, 0, 1, 0.5215687, 1,
-0.1374199, -0.9230868, -3.213549, 0, 1, 0.5254902, 1,
-0.1354562, -0.9265537, -3.641494, 0, 1, 0.5333334, 1,
-0.1338241, -0.09701689, -4.027255, 0, 1, 0.5372549, 1,
-0.1332465, -0.5296404, -3.327769, 0, 1, 0.5450981, 1,
-0.1316727, -1.131005, -5.474895, 0, 1, 0.5490196, 1,
-0.1212698, -0.7846412, -3.475029, 0, 1, 0.5568628, 1,
-0.1165772, -0.698103, -3.768165, 0, 1, 0.5607843, 1,
-0.1163576, -0.6709256, -2.344329, 0, 1, 0.5686275, 1,
-0.1123664, 0.5793156, -1.666834, 0, 1, 0.572549, 1,
-0.1109611, 1.037106, -0.3659675, 0, 1, 0.5803922, 1,
-0.1081956, 1.8389, 0.7072552, 0, 1, 0.5843138, 1,
-0.1066622, 1.024231, -0.2092487, 0, 1, 0.5921569, 1,
-0.1042026, -1.052186, -2.100734, 0, 1, 0.5960785, 1,
-0.1031807, 0.185756, -0.1643592, 0, 1, 0.6039216, 1,
-0.102994, 0.9013086, 0.4398022, 0, 1, 0.6117647, 1,
-0.1013763, -0.68484, -5.580884, 0, 1, 0.6156863, 1,
-0.09953772, -1.6468, -1.640075, 0, 1, 0.6235294, 1,
-0.09857552, 0.006314676, -2.30151, 0, 1, 0.627451, 1,
-0.09811877, -1.066389, -1.473046, 0, 1, 0.6352941, 1,
-0.09396674, 1.126906, -0.3468131, 0, 1, 0.6392157, 1,
-0.0930535, -0.6855965, -3.109009, 0, 1, 0.6470588, 1,
-0.08925121, 1.883882, 1.811403, 0, 1, 0.6509804, 1,
-0.08759698, -1.455303, -2.219342, 0, 1, 0.6588235, 1,
-0.08602374, 0.5001459, -1.042691, 0, 1, 0.6627451, 1,
-0.08344901, -1.327453, -5.124117, 0, 1, 0.6705883, 1,
-0.08028708, -1.282512, -3.297401, 0, 1, 0.6745098, 1,
-0.07675244, 0.1497275, 1.159484, 0, 1, 0.682353, 1,
-0.07674254, 1.368146, -1.577404, 0, 1, 0.6862745, 1,
-0.07389429, -0.1429857, -1.12561, 0, 1, 0.6941177, 1,
-0.07132386, 0.9333079, -0.3442167, 0, 1, 0.7019608, 1,
-0.06920554, 0.2875814, 1.717529, 0, 1, 0.7058824, 1,
-0.06260616, -0.1705643, -1.678308, 0, 1, 0.7137255, 1,
-0.05894845, 0.9807131, -0.2930941, 0, 1, 0.7176471, 1,
-0.05689561, -1.640087, -2.67221, 0, 1, 0.7254902, 1,
-0.05677296, 0.5445911, -2.27379, 0, 1, 0.7294118, 1,
-0.05224181, 0.7528945, 1.120902, 0, 1, 0.7372549, 1,
-0.05145291, 0.3782686, 0.2612883, 0, 1, 0.7411765, 1,
-0.0478255, -0.9574906, -3.746711, 0, 1, 0.7490196, 1,
-0.03659302, 0.1681, 0.8890401, 0, 1, 0.7529412, 1,
-0.03623031, -1.169948, -2.753362, 0, 1, 0.7607843, 1,
-0.03598744, -0.9991405, -2.961396, 0, 1, 0.7647059, 1,
-0.02085342, -0.2224855, -3.797676, 0, 1, 0.772549, 1,
-0.01933434, -1.028733, -3.193015, 0, 1, 0.7764706, 1,
-0.01005706, -1.051227, -4.056115, 0, 1, 0.7843137, 1,
-0.007198367, 0.562523, 1.295701, 0, 1, 0.7882353, 1,
-0.005854131, -1.040211, -3.631714, 0, 1, 0.7960784, 1,
-0.004893603, -1.674922, -3.604277, 0, 1, 0.8039216, 1,
-0.0007770481, -2.704571, -4.17827, 0, 1, 0.8078431, 1,
0.001522186, 0.4515841, 1.018822, 0, 1, 0.8156863, 1,
0.00177597, 2.739541, 0.6272382, 0, 1, 0.8196079, 1,
0.002499267, -0.6674457, 2.484076, 0, 1, 0.827451, 1,
0.002866889, -1.035745, 3.256368, 0, 1, 0.8313726, 1,
0.006367035, -0.6812623, 2.010477, 0, 1, 0.8392157, 1,
0.008091472, 0.4687113, -2.375942, 0, 1, 0.8431373, 1,
0.008455527, 0.3213532, -2.089867, 0, 1, 0.8509804, 1,
0.008995246, -0.8899972, 3.90881, 0, 1, 0.854902, 1,
0.01036044, 0.2632909, -0.2622189, 0, 1, 0.8627451, 1,
0.01043838, 1.271129, 0.3477286, 0, 1, 0.8666667, 1,
0.01126587, 0.2716449, -1.463239, 0, 1, 0.8745098, 1,
0.01265253, 0.491095, 1.752086, 0, 1, 0.8784314, 1,
0.01424618, -2.04119, 2.800261, 0, 1, 0.8862745, 1,
0.01531501, -2.147171, 4.198843, 0, 1, 0.8901961, 1,
0.0183607, 1.408584, 0.7802413, 0, 1, 0.8980392, 1,
0.02366555, -0.6923792, 2.686359, 0, 1, 0.9058824, 1,
0.02521025, 0.1830506, 0.8694959, 0, 1, 0.9098039, 1,
0.02596515, -0.2306745, 2.380881, 0, 1, 0.9176471, 1,
0.0346176, -0.3543561, 3.315919, 0, 1, 0.9215686, 1,
0.03639189, 0.7194723, 0.04475328, 0, 1, 0.9294118, 1,
0.03966069, 0.1988349, -0.1987733, 0, 1, 0.9333333, 1,
0.04207777, 0.8030777, 1.359419, 0, 1, 0.9411765, 1,
0.04234225, -0.4248038, 3.3905, 0, 1, 0.945098, 1,
0.04280753, -0.1060013, 1.590974, 0, 1, 0.9529412, 1,
0.04653421, 0.5767164, 0.5694523, 0, 1, 0.9568627, 1,
0.05166719, -0.1465065, 2.324906, 0, 1, 0.9647059, 1,
0.05481012, -0.7578264, 4.385066, 0, 1, 0.9686275, 1,
0.05774563, 0.1717901, 0.6957059, 0, 1, 0.9764706, 1,
0.05921397, 0.7535173, 0.5577, 0, 1, 0.9803922, 1,
0.06170977, 0.97549, -2.385046, 0, 1, 0.9882353, 1,
0.06444176, -0.7405242, 2.794146, 0, 1, 0.9921569, 1,
0.06638764, 0.6490169, 1.311347, 0, 1, 1, 1,
0.06675915, 0.4795462, -0.8875982, 0, 0.9921569, 1, 1,
0.0694339, -1.174307, 3.002114, 0, 0.9882353, 1, 1,
0.07052211, 0.03492217, 1.836179, 0, 0.9803922, 1, 1,
0.0749226, 1.514008, -0.4786414, 0, 0.9764706, 1, 1,
0.07827746, 0.1775625, 2.186343, 0, 0.9686275, 1, 1,
0.08072302, -0.8961451, 2.547175, 0, 0.9647059, 1, 1,
0.08310655, 0.4594922, 0.9651396, 0, 0.9568627, 1, 1,
0.08586901, -0.6270394, 1.824217, 0, 0.9529412, 1, 1,
0.08702016, 0.4400153, -0.2334696, 0, 0.945098, 1, 1,
0.08884408, -1.54735, 1.229081, 0, 0.9411765, 1, 1,
0.09585053, 0.9144495, 1.688544, 0, 0.9333333, 1, 1,
0.09770274, -0.1084853, 0.7027133, 0, 0.9294118, 1, 1,
0.09797271, -0.6107326, 2.447806, 0, 0.9215686, 1, 1,
0.1003673, 1.229266, 0.2600174, 0, 0.9176471, 1, 1,
0.1015904, -1.106594, 3.799574, 0, 0.9098039, 1, 1,
0.1042611, -0.06207322, 0.003647752, 0, 0.9058824, 1, 1,
0.1046466, 2.129316, 0.8301179, 0, 0.8980392, 1, 1,
0.1060932, -0.4381248, 1.660091, 0, 0.8901961, 1, 1,
0.1071549, 0.5552047, -0.8158023, 0, 0.8862745, 1, 1,
0.1114537, -0.3689961, 3.187028, 0, 0.8784314, 1, 1,
0.1129096, 0.3192748, 1.639549, 0, 0.8745098, 1, 1,
0.1129494, -0.422382, 1.715254, 0, 0.8666667, 1, 1,
0.1151972, 0.7120637, 1.265199, 0, 0.8627451, 1, 1,
0.1154246, -0.7607167, 1.065252, 0, 0.854902, 1, 1,
0.1167044, -1.891629, 3.693639, 0, 0.8509804, 1, 1,
0.1169496, -0.9430869, 2.684498, 0, 0.8431373, 1, 1,
0.1190063, -0.9346315, 4.131114, 0, 0.8392157, 1, 1,
0.1190481, 0.7808838, -0.4186446, 0, 0.8313726, 1, 1,
0.1192169, 1.527491, 1.291787, 0, 0.827451, 1, 1,
0.126134, 0.9884047, -1.964082, 0, 0.8196079, 1, 1,
0.126666, 0.1430908, 0.4359763, 0, 0.8156863, 1, 1,
0.1281884, -0.7819096, 3.517538, 0, 0.8078431, 1, 1,
0.1288064, -1.544547, 1.127931, 0, 0.8039216, 1, 1,
0.1298326, -0.3995057, 2.864259, 0, 0.7960784, 1, 1,
0.1315241, 0.1134469, 0.8985342, 0, 0.7882353, 1, 1,
0.1365025, 1.370737, 0.5770566, 0, 0.7843137, 1, 1,
0.1387268, 0.8861623, 1.056041, 0, 0.7764706, 1, 1,
0.1424506, 0.06282797, 1.481, 0, 0.772549, 1, 1,
0.143392, -0.343939, 3.13163, 0, 0.7647059, 1, 1,
0.1493799, -0.2525624, 1.633152, 0, 0.7607843, 1, 1,
0.1499792, -1.881702, 3.196071, 0, 0.7529412, 1, 1,
0.1541022, -1.887401, 3.243931, 0, 0.7490196, 1, 1,
0.1545502, -2.360611, 2.043707, 0, 0.7411765, 1, 1,
0.1573324, -1.038175, 1.913947, 0, 0.7372549, 1, 1,
0.1589185, 0.4828923, -1.16735, 0, 0.7294118, 1, 1,
0.1666937, -0.2243281, 2.732412, 0, 0.7254902, 1, 1,
0.1672236, 0.9651913, 0.1847781, 0, 0.7176471, 1, 1,
0.1709822, 0.794987, -2.527463, 0, 0.7137255, 1, 1,
0.1735702, 0.003336548, 0.8637372, 0, 0.7058824, 1, 1,
0.1742465, 1.252567, -0.813836, 0, 0.6980392, 1, 1,
0.1789369, 0.2195581, 0.7396799, 0, 0.6941177, 1, 1,
0.1851235, -0.7205215, 1.072248, 0, 0.6862745, 1, 1,
0.1855162, 0.6721413, -0.3503121, 0, 0.682353, 1, 1,
0.189315, -1.400192, 3.396579, 0, 0.6745098, 1, 1,
0.1904446, 0.06305376, 3.120112, 0, 0.6705883, 1, 1,
0.1915236, 0.0170554, 2.138582, 0, 0.6627451, 1, 1,
0.1948591, -0.5912117, 1.413484, 0, 0.6588235, 1, 1,
0.1962066, -0.5029806, 2.251361, 0, 0.6509804, 1, 1,
0.1969145, 0.1224029, 0.02327132, 0, 0.6470588, 1, 1,
0.1969455, -1.385072, 3.889904, 0, 0.6392157, 1, 1,
0.1972793, -2.06188, 3.118716, 0, 0.6352941, 1, 1,
0.1972855, 0.03147631, 2.046986, 0, 0.627451, 1, 1,
0.1993982, 0.518589, 0.7404696, 0, 0.6235294, 1, 1,
0.2014491, -0.5238034, 1.957987, 0, 0.6156863, 1, 1,
0.201602, -1.648919, 2.825496, 0, 0.6117647, 1, 1,
0.202301, 1.45513, -0.8832113, 0, 0.6039216, 1, 1,
0.2023694, 0.5915997, 0.4450567, 0, 0.5960785, 1, 1,
0.2089776, 0.5770817, -0.485619, 0, 0.5921569, 1, 1,
0.2119021, -0.4039702, 2.561135, 0, 0.5843138, 1, 1,
0.2125416, 1.446937, 0.3329026, 0, 0.5803922, 1, 1,
0.2130071, 0.1737628, 0.8512444, 0, 0.572549, 1, 1,
0.2142616, -0.3318613, 3.329632, 0, 0.5686275, 1, 1,
0.2175728, -0.3317533, 1.689355, 0, 0.5607843, 1, 1,
0.2249649, 0.5859639, -0.4368297, 0, 0.5568628, 1, 1,
0.228524, -1.014556, 1.140465, 0, 0.5490196, 1, 1,
0.2285345, -0.4018845, 3.56858, 0, 0.5450981, 1, 1,
0.2307569, -1.984492, 3.270418, 0, 0.5372549, 1, 1,
0.2312299, -0.1603757, 0.1332114, 0, 0.5333334, 1, 1,
0.232555, 1.078613, -0.3586271, 0, 0.5254902, 1, 1,
0.2325829, -2.215799, 2.631136, 0, 0.5215687, 1, 1,
0.2341014, -0.7673481, 3.622366, 0, 0.5137255, 1, 1,
0.2357585, 0.4055398, 1.387089, 0, 0.509804, 1, 1,
0.2391059, 0.5383676, 0.3711932, 0, 0.5019608, 1, 1,
0.2392278, 2.398177, 1.350534, 0, 0.4941176, 1, 1,
0.242025, 2.229679, 0.3361768, 0, 0.4901961, 1, 1,
0.2435666, -0.5205629, 2.505734, 0, 0.4823529, 1, 1,
0.2468644, -1.811233, 4.156621, 0, 0.4784314, 1, 1,
0.2493424, 1.242095, 1.639892, 0, 0.4705882, 1, 1,
0.250963, 0.2737057, 0.2777686, 0, 0.4666667, 1, 1,
0.2561574, -1.313189, 2.848219, 0, 0.4588235, 1, 1,
0.2564872, 0.278683, 1.493816, 0, 0.454902, 1, 1,
0.2567123, 1.44863, -0.732621, 0, 0.4470588, 1, 1,
0.2577962, -1.100785, 2.167725, 0, 0.4431373, 1, 1,
0.2596473, 1.119951, 0.9538276, 0, 0.4352941, 1, 1,
0.2612444, 1.094407, 1.090897, 0, 0.4313726, 1, 1,
0.2651915, 0.7366226, -0.6831861, 0, 0.4235294, 1, 1,
0.2669711, -1.463407, 3.616585, 0, 0.4196078, 1, 1,
0.2672381, -0.4579543, 2.844649, 0, 0.4117647, 1, 1,
0.2681181, 1.650871, 1.706011, 0, 0.4078431, 1, 1,
0.2686555, 0.177374, 0.2797503, 0, 0.4, 1, 1,
0.2691368, 0.312727, 0.8011463, 0, 0.3921569, 1, 1,
0.2694908, 0.2765987, 1.013679, 0, 0.3882353, 1, 1,
0.2749957, 0.623496, -0.8136498, 0, 0.3803922, 1, 1,
0.2809713, -0.4298114, 2.430994, 0, 0.3764706, 1, 1,
0.2924137, 0.2006102, -0.7409295, 0, 0.3686275, 1, 1,
0.2938061, -0.5501879, 1.992425, 0, 0.3647059, 1, 1,
0.2939792, 0.8227415, 0.8549259, 0, 0.3568628, 1, 1,
0.2942505, 0.3920764, -0.3730029, 0, 0.3529412, 1, 1,
0.2947493, -0.2984999, 3.720846, 0, 0.345098, 1, 1,
0.295123, 0.7592731, 1.697916, 0, 0.3411765, 1, 1,
0.2957512, -1.429632, 2.952643, 0, 0.3333333, 1, 1,
0.2958561, -0.1078248, 1.044026, 0, 0.3294118, 1, 1,
0.2964345, 0.5845316, 1.073139, 0, 0.3215686, 1, 1,
0.2972986, 0.2508575, 0.8037905, 0, 0.3176471, 1, 1,
0.2976112, -0.06892689, 1.123568, 0, 0.3098039, 1, 1,
0.3010629, 2.24887, 0.6361941, 0, 0.3058824, 1, 1,
0.3085109, -0.4623989, 4.099086, 0, 0.2980392, 1, 1,
0.319945, 0.8232809, -0.2424664, 0, 0.2901961, 1, 1,
0.32113, 0.5628828, 0.7137804, 0, 0.2862745, 1, 1,
0.3215676, -0.1759672, 2.875649, 0, 0.2784314, 1, 1,
0.3381505, -1.143125, 2.513243, 0, 0.2745098, 1, 1,
0.3404849, 0.2174853, 1.008854, 0, 0.2666667, 1, 1,
0.343587, -0.5137509, 2.200525, 0, 0.2627451, 1, 1,
0.3453356, -1.057421, 3.780318, 0, 0.254902, 1, 1,
0.3453771, -0.6831136, 3.338696, 0, 0.2509804, 1, 1,
0.3475378, -0.6998153, 2.689517, 0, 0.2431373, 1, 1,
0.347996, 0.4329772, 0.05000399, 0, 0.2392157, 1, 1,
0.3505014, -1.618165, 2.015669, 0, 0.2313726, 1, 1,
0.3599583, 0.9879531, 0.06806698, 0, 0.227451, 1, 1,
0.3636532, 0.8865578, -0.3603831, 0, 0.2196078, 1, 1,
0.364423, -0.0877922, 1.872648, 0, 0.2156863, 1, 1,
0.3697884, -1.29293, 2.129153, 0, 0.2078431, 1, 1,
0.3715021, -1.816344, 1.945387, 0, 0.2039216, 1, 1,
0.3717714, 0.06277745, 1.861553, 0, 0.1960784, 1, 1,
0.3749412, 1.474394, -0.1514048, 0, 0.1882353, 1, 1,
0.3872798, -0.2568813, 2.687257, 0, 0.1843137, 1, 1,
0.3877892, -0.3453429, 2.979424, 0, 0.1764706, 1, 1,
0.3953844, 0.4883155, 2.074106, 0, 0.172549, 1, 1,
0.3985135, -2.37309, 2.632023, 0, 0.1647059, 1, 1,
0.3992712, -0.0303256, 0.03397171, 0, 0.1607843, 1, 1,
0.3995804, 0.7192034, -0.6774307, 0, 0.1529412, 1, 1,
0.4025218, -0.7788818, 2.075167, 0, 0.1490196, 1, 1,
0.4084388, 1.048757, 0.8153329, 0, 0.1411765, 1, 1,
0.41073, 0.6019899, 0.5061709, 0, 0.1372549, 1, 1,
0.417606, -1.859024, 1.81831, 0, 0.1294118, 1, 1,
0.4193329, -0.183227, 3.578097, 0, 0.1254902, 1, 1,
0.4237161, 0.5181223, 0.4323447, 0, 0.1176471, 1, 1,
0.4238006, -0.4614165, 1.07121, 0, 0.1137255, 1, 1,
0.4250514, -0.5605147, 2.94086, 0, 0.1058824, 1, 1,
0.4268829, 0.0735931, 4.105009, 0, 0.09803922, 1, 1,
0.4286535, -0.7457624, 3.352638, 0, 0.09411765, 1, 1,
0.4306598, -0.2200274, 4.039021, 0, 0.08627451, 1, 1,
0.4337001, 0.311008, 1.059534, 0, 0.08235294, 1, 1,
0.4364559, 0.1990115, 0.9776513, 0, 0.07450981, 1, 1,
0.4391624, -0.2548204, 1.241797, 0, 0.07058824, 1, 1,
0.4409444, -0.1821878, 0.8409386, 0, 0.0627451, 1, 1,
0.4410335, -0.852232, 0.8517872, 0, 0.05882353, 1, 1,
0.44157, 1.659681, -1.528728, 0, 0.05098039, 1, 1,
0.4416951, 1.139683, -0.9623663, 0, 0.04705882, 1, 1,
0.4445699, 0.1947782, 1.544612, 0, 0.03921569, 1, 1,
0.4491151, -0.9561244, 5.619737, 0, 0.03529412, 1, 1,
0.4491209, -0.5377092, 3.614569, 0, 0.02745098, 1, 1,
0.4498855, -0.9497948, 3.197135, 0, 0.02352941, 1, 1,
0.4506206, 0.7304899, 1.952422, 0, 0.01568628, 1, 1,
0.4519385, -0.3476917, 2.405966, 0, 0.01176471, 1, 1,
0.4566875, -0.4476642, 1.778712, 0, 0.003921569, 1, 1,
0.4568855, -0.9804136, 2.752661, 0.003921569, 0, 1, 1,
0.4584585, 0.9931257, -0.00265286, 0.007843138, 0, 1, 1,
0.4640226, 0.5823756, 0.68773, 0.01568628, 0, 1, 1,
0.4646738, 1.029145, -0.3301194, 0.01960784, 0, 1, 1,
0.4668564, 0.5518464, 0.8338788, 0.02745098, 0, 1, 1,
0.4670428, -0.5730458, 1.571743, 0.03137255, 0, 1, 1,
0.472114, 0.09910215, 2.194478, 0.03921569, 0, 1, 1,
0.4727701, -0.6254507, 1.666936, 0.04313726, 0, 1, 1,
0.4736694, 1.029849, -0.7163103, 0.05098039, 0, 1, 1,
0.4812052, -1.394528, 2.765882, 0.05490196, 0, 1, 1,
0.482244, -0.8380244, 2.434435, 0.0627451, 0, 1, 1,
0.485656, 0.7049296, 1.809538, 0.06666667, 0, 1, 1,
0.4872883, 0.7869967, 1.010326, 0.07450981, 0, 1, 1,
0.4888507, -0.8933612, 2.440284, 0.07843138, 0, 1, 1,
0.4903007, 0.2760474, -0.4246781, 0.08627451, 0, 1, 1,
0.4972923, 0.1277101, 1.039761, 0.09019608, 0, 1, 1,
0.4998801, 0.03137335, 0.7896414, 0.09803922, 0, 1, 1,
0.5069429, 1.177846, 0.1678025, 0.1058824, 0, 1, 1,
0.5128294, 0.01210869, 1.036307, 0.1098039, 0, 1, 1,
0.5141031, 0.4850518, 1.440708, 0.1176471, 0, 1, 1,
0.5184805, -1.75717, 1.1263, 0.1215686, 0, 1, 1,
0.5231206, 0.5957872, 0.5724826, 0.1294118, 0, 1, 1,
0.5255681, 0.2065801, -0.07445278, 0.1333333, 0, 1, 1,
0.5289961, -0.2990247, 1.603616, 0.1411765, 0, 1, 1,
0.5303494, -1.758549, 3.62324, 0.145098, 0, 1, 1,
0.5321558, -0.8517709, 3.201979, 0.1529412, 0, 1, 1,
0.5367005, 0.5388867, 0.05694037, 0.1568628, 0, 1, 1,
0.5391425, -0.7048502, 2.042266, 0.1647059, 0, 1, 1,
0.5425971, 0.09156429, 1.990319, 0.1686275, 0, 1, 1,
0.5450854, -0.06732304, 2.140433, 0.1764706, 0, 1, 1,
0.5461292, -0.4567831, 4.069167, 0.1803922, 0, 1, 1,
0.5487418, 1.624988, 0.5263172, 0.1882353, 0, 1, 1,
0.5515173, -0.0005068434, 2.935076, 0.1921569, 0, 1, 1,
0.554381, 0.01293786, -1.135201, 0.2, 0, 1, 1,
0.555158, -0.4438982, 2.039584, 0.2078431, 0, 1, 1,
0.556367, 0.1638004, 0.5843182, 0.2117647, 0, 1, 1,
0.5590187, -0.4666765, 3.36085, 0.2196078, 0, 1, 1,
0.5594061, -0.6016547, 2.949362, 0.2235294, 0, 1, 1,
0.56814, 0.4367546, 0.3567043, 0.2313726, 0, 1, 1,
0.5686797, 0.2319029, 1.406522, 0.2352941, 0, 1, 1,
0.5711709, -1.136333, 2.106608, 0.2431373, 0, 1, 1,
0.5716199, 0.04426526, 1.213555, 0.2470588, 0, 1, 1,
0.5823004, 0.4399665, 1.532551, 0.254902, 0, 1, 1,
0.5840274, -0.993117, 1.573957, 0.2588235, 0, 1, 1,
0.5841737, 1.451046, 0.08193282, 0.2666667, 0, 1, 1,
0.5856763, -0.3413396, 1.862435, 0.2705882, 0, 1, 1,
0.58571, 0.2215291, 2.944862, 0.2784314, 0, 1, 1,
0.5878752, 0.1123349, 2.196556, 0.282353, 0, 1, 1,
0.5884122, -0.6793848, 3.750257, 0.2901961, 0, 1, 1,
0.5893545, -0.1064505, 2.63605, 0.2941177, 0, 1, 1,
0.590387, -1.155627, 2.843397, 0.3019608, 0, 1, 1,
0.5916976, -0.4824512, 1.5445, 0.3098039, 0, 1, 1,
0.5965304, -0.8601938, 3.068594, 0.3137255, 0, 1, 1,
0.606036, 1.555022, 1.833241, 0.3215686, 0, 1, 1,
0.6092682, -0.195733, 1.625653, 0.3254902, 0, 1, 1,
0.6188591, -1.736731, 4.197006, 0.3333333, 0, 1, 1,
0.6218257, 0.6515686, 1.106767, 0.3372549, 0, 1, 1,
0.6270857, 1.619653, 0.7177482, 0.345098, 0, 1, 1,
0.6292527, 1.542934, 1.352798, 0.3490196, 0, 1, 1,
0.632012, 1.186259, 0.283116, 0.3568628, 0, 1, 1,
0.6454049, -1.991368, 2.950288, 0.3607843, 0, 1, 1,
0.6473739, -0.2861245, 1.514597, 0.3686275, 0, 1, 1,
0.6497452, 2.494236, 0.1061704, 0.372549, 0, 1, 1,
0.6500442, 0.911339, 1.755439, 0.3803922, 0, 1, 1,
0.6515875, -0.2957321, 2.612397, 0.3843137, 0, 1, 1,
0.6529914, -0.9762923, 1.850944, 0.3921569, 0, 1, 1,
0.6550022, 0.1659356, 0.690625, 0.3960784, 0, 1, 1,
0.6550692, -0.3229118, 0.5565298, 0.4039216, 0, 1, 1,
0.6591116, 0.709672, -1.110457, 0.4117647, 0, 1, 1,
0.659739, -1.026814, 2.620927, 0.4156863, 0, 1, 1,
0.6631747, 0.730068, 0.5758291, 0.4235294, 0, 1, 1,
0.6707777, -0.5399991, 4.09485, 0.427451, 0, 1, 1,
0.6771111, 0.1598599, 1.518668, 0.4352941, 0, 1, 1,
0.6771598, -0.7935137, 3.045829, 0.4392157, 0, 1, 1,
0.6773356, -1.08543, 3.46885, 0.4470588, 0, 1, 1,
0.6844716, -0.5024481, 3.085732, 0.4509804, 0, 1, 1,
0.6848378, 0.1612377, 1.074984, 0.4588235, 0, 1, 1,
0.6860641, 0.4156929, 2.136885, 0.4627451, 0, 1, 1,
0.6892377, 0.3919394, 1.272369, 0.4705882, 0, 1, 1,
0.6893308, 1.549181, 2.013422, 0.4745098, 0, 1, 1,
0.6897102, -0.4160591, 1.655297, 0.4823529, 0, 1, 1,
0.6918665, -1.522544, 1.64491, 0.4862745, 0, 1, 1,
0.692414, 1.111886, -0.7902054, 0.4941176, 0, 1, 1,
0.6933351, 0.6460747, -1.03734, 0.5019608, 0, 1, 1,
0.7114395, -0.721929, 1.49791, 0.5058824, 0, 1, 1,
0.7116309, -0.3923582, 2.416853, 0.5137255, 0, 1, 1,
0.7117133, -0.7464685, 3.161728, 0.5176471, 0, 1, 1,
0.7159118, -0.9132205, 1.574598, 0.5254902, 0, 1, 1,
0.7166018, -0.2332866, 2.322208, 0.5294118, 0, 1, 1,
0.7170611, 0.3749477, 1.691375, 0.5372549, 0, 1, 1,
0.7176728, -0.3994536, 3.218073, 0.5411765, 0, 1, 1,
0.7184831, -1.300534, 2.069893, 0.5490196, 0, 1, 1,
0.7208763, -1.069655, 0.589816, 0.5529412, 0, 1, 1,
0.7277932, -2.036387, 3.685324, 0.5607843, 0, 1, 1,
0.7286862, -1.13153, 4.551356, 0.5647059, 0, 1, 1,
0.7293226, 0.3241481, 0.4977968, 0.572549, 0, 1, 1,
0.7310115, 0.03674828, 1.106931, 0.5764706, 0, 1, 1,
0.7335823, 0.3098412, 1.249448, 0.5843138, 0, 1, 1,
0.7348337, -0.5452215, 1.747231, 0.5882353, 0, 1, 1,
0.7387401, 0.2342594, 2.236424, 0.5960785, 0, 1, 1,
0.7444025, -0.9569675, 2.338044, 0.6039216, 0, 1, 1,
0.7473745, -0.05356035, 2.598747, 0.6078432, 0, 1, 1,
0.7527091, -0.5483249, 2.200226, 0.6156863, 0, 1, 1,
0.765607, 1.290981, -0.3309757, 0.6196079, 0, 1, 1,
0.7675274, -0.199184, 1.897866, 0.627451, 0, 1, 1,
0.7691013, 0.9186008, 1.161445, 0.6313726, 0, 1, 1,
0.7717476, 0.204687, 0.9427164, 0.6392157, 0, 1, 1,
0.7738495, 2.267032, 0.6878654, 0.6431373, 0, 1, 1,
0.7738513, -0.6961548, 1.725723, 0.6509804, 0, 1, 1,
0.7750852, 1.77429, -1.246003, 0.654902, 0, 1, 1,
0.7754352, -1.264626, 3.765644, 0.6627451, 0, 1, 1,
0.7774503, 1.506291, 0.1916144, 0.6666667, 0, 1, 1,
0.7813581, -0.02969269, 1.870044, 0.6745098, 0, 1, 1,
0.7909768, -1.628902, 1.842519, 0.6784314, 0, 1, 1,
0.7923449, 2.395029, 1.134943, 0.6862745, 0, 1, 1,
0.7972507, -0.828626, 3.469462, 0.6901961, 0, 1, 1,
0.8008319, -1.041285, 2.623837, 0.6980392, 0, 1, 1,
0.8008968, 0.6573283, -0.258365, 0.7058824, 0, 1, 1,
0.8064014, -1.363916, 2.245101, 0.7098039, 0, 1, 1,
0.8076006, -1.392965, 1.385066, 0.7176471, 0, 1, 1,
0.8151577, 0.8599865, 1.018012, 0.7215686, 0, 1, 1,
0.8168612, -0.8830943, 1.299396, 0.7294118, 0, 1, 1,
0.8241736, 0.4890535, 0.9218452, 0.7333333, 0, 1, 1,
0.8254975, -0.8778453, 3.657868, 0.7411765, 0, 1, 1,
0.831454, 0.192447, 1.465681, 0.7450981, 0, 1, 1,
0.8381273, 0.5938384, 2.221939, 0.7529412, 0, 1, 1,
0.844683, 1.164789, 0.7061769, 0.7568628, 0, 1, 1,
0.8457755, -0.5969501, 2.655763, 0.7647059, 0, 1, 1,
0.8512322, 1.893921, -2.081218, 0.7686275, 0, 1, 1,
0.8532142, 0.2467224, 0.6606473, 0.7764706, 0, 1, 1,
0.8539479, 2.010214, 0.4964334, 0.7803922, 0, 1, 1,
0.8565335, -1.644638, 2.521096, 0.7882353, 0, 1, 1,
0.866558, -0.1650337, 2.610242, 0.7921569, 0, 1, 1,
0.8813188, -0.9454772, 2.709954, 0.8, 0, 1, 1,
0.8817294, 0.03658235, 2.418351, 0.8078431, 0, 1, 1,
0.8908306, 0.1132473, 1.760399, 0.8117647, 0, 1, 1,
0.8916864, 0.8932724, 2.393967, 0.8196079, 0, 1, 1,
0.891982, 0.8220073, 1.371817, 0.8235294, 0, 1, 1,
0.8949667, -0.1218267, 2.315531, 0.8313726, 0, 1, 1,
0.901561, -0.635273, 1.384154, 0.8352941, 0, 1, 1,
0.9044562, -1.492625, 2.797805, 0.8431373, 0, 1, 1,
0.9048522, 1.651229, 1.845418, 0.8470588, 0, 1, 1,
0.9105219, 0.4934346, 1.182026, 0.854902, 0, 1, 1,
0.9134466, -0.1962691, 1.352745, 0.8588235, 0, 1, 1,
0.923215, 1.16246, -0.2333103, 0.8666667, 0, 1, 1,
0.9270881, 0.642248, 0.1207865, 0.8705882, 0, 1, 1,
0.9277536, -1.304359, 1.443548, 0.8784314, 0, 1, 1,
0.9290757, 0.5611444, 3.139462, 0.8823529, 0, 1, 1,
0.9414396, 1.282518, 0.810688, 0.8901961, 0, 1, 1,
0.9465289, -0.9059307, 1.853471, 0.8941177, 0, 1, 1,
0.9481556, 1.21368, 0.529235, 0.9019608, 0, 1, 1,
0.9484992, -0.7903606, 2.659163, 0.9098039, 0, 1, 1,
0.9490084, 0.4035607, 0.3775191, 0.9137255, 0, 1, 1,
0.9505605, -0.4635122, 3.16965, 0.9215686, 0, 1, 1,
0.9513388, 0.629602, -0.2818936, 0.9254902, 0, 1, 1,
0.9626256, -1.03259, 3.113766, 0.9333333, 0, 1, 1,
0.9683955, 0.09280596, 0.9569833, 0.9372549, 0, 1, 1,
0.9708683, -1.420624, 1.121146, 0.945098, 0, 1, 1,
0.976815, 1.784387, 0.8427596, 0.9490196, 0, 1, 1,
0.97723, -1.770979, 3.206852, 0.9568627, 0, 1, 1,
0.9775215, 1.365261, 1.555389, 0.9607843, 0, 1, 1,
0.9803705, -0.2464646, 2.435705, 0.9686275, 0, 1, 1,
0.9870957, -1.898455, 2.294838, 0.972549, 0, 1, 1,
0.99472, -1.007778, 2.436835, 0.9803922, 0, 1, 1,
1.003679, 0.7082304, 0.7895271, 0.9843137, 0, 1, 1,
1.008391, -2.300036, 3.20052, 0.9921569, 0, 1, 1,
1.016967, 2.086271, 2.065478, 0.9960784, 0, 1, 1,
1.018238, -0.5383078, 0.911823, 1, 0, 0.9960784, 1,
1.038043, 0.4062182, 1.390106, 1, 0, 0.9882353, 1,
1.039693, -1.687475, 2.999855, 1, 0, 0.9843137, 1,
1.041609, 1.432061, -0.6127971, 1, 0, 0.9764706, 1,
1.043346, 1.062248, 0.826724, 1, 0, 0.972549, 1,
1.047132, -0.7263369, 3.36041, 1, 0, 0.9647059, 1,
1.047324, 0.4657847, 1.699506, 1, 0, 0.9607843, 1,
1.055133, 0.7674497, 0.2803595, 1, 0, 0.9529412, 1,
1.058559, 1.466253, -0.7135628, 1, 0, 0.9490196, 1,
1.06308, -0.5714893, 2.090944, 1, 0, 0.9411765, 1,
1.06617, -0.2550774, 0.8771295, 1, 0, 0.9372549, 1,
1.074358, 0.5968902, 0.8341186, 1, 0, 0.9294118, 1,
1.074811, 1.1261, 1.901426, 1, 0, 0.9254902, 1,
1.077836, 0.2426977, 1.755119, 1, 0, 0.9176471, 1,
1.081225, -0.997359, 2.56785, 1, 0, 0.9137255, 1,
1.087125, 0.3747863, 1.876932, 1, 0, 0.9058824, 1,
1.088656, -0.09584467, 0.7746466, 1, 0, 0.9019608, 1,
1.088874, -1.357156, 2.281925, 1, 0, 0.8941177, 1,
1.090272, 0.4366339, 1.43228, 1, 0, 0.8862745, 1,
1.097573, -0.2024951, 2.242003, 1, 0, 0.8823529, 1,
1.102653, 0.03466566, 0.3259331, 1, 0, 0.8745098, 1,
1.105699, -1.143854, 0.9205732, 1, 0, 0.8705882, 1,
1.112341, 0.7007848, 1.086552, 1, 0, 0.8627451, 1,
1.113804, -1.031309, 1.300461, 1, 0, 0.8588235, 1,
1.114768, 0.8290397, -0.09190704, 1, 0, 0.8509804, 1,
1.115423, -0.2312882, 3.448791, 1, 0, 0.8470588, 1,
1.115934, -0.53005, 1.076108, 1, 0, 0.8392157, 1,
1.117386, -0.446139, 1.652956, 1, 0, 0.8352941, 1,
1.12264, 0.0932195, 0.213147, 1, 0, 0.827451, 1,
1.123249, 1.571082, 1.62745, 1, 0, 0.8235294, 1,
1.130684, 0.9050977, 1.060539, 1, 0, 0.8156863, 1,
1.131568, 0.9306871, 0.2666492, 1, 0, 0.8117647, 1,
1.137267, 0.9466392, 2.10651, 1, 0, 0.8039216, 1,
1.138129, -0.7874565, 1.944432, 1, 0, 0.7960784, 1,
1.14103, -0.2680393, 0.956464, 1, 0, 0.7921569, 1,
1.143072, -0.2106321, 0.7303116, 1, 0, 0.7843137, 1,
1.147373, -0.4556577, 0.9216874, 1, 0, 0.7803922, 1,
1.1599, -0.6047925, 2.457781, 1, 0, 0.772549, 1,
1.16198, 0.1749227, 1.530469, 1, 0, 0.7686275, 1,
1.164369, -0.5978073, 1.513081, 1, 0, 0.7607843, 1,
1.169698, 0.4966908, 2.447994, 1, 0, 0.7568628, 1,
1.173286, -0.05030977, 0.4025876, 1, 0, 0.7490196, 1,
1.174546, 0.8983564, -0.2222242, 1, 0, 0.7450981, 1,
1.186151, -0.1367984, 1.171704, 1, 0, 0.7372549, 1,
1.195578, -0.03616229, 1.713353, 1, 0, 0.7333333, 1,
1.206149, 0.3412268, 0.6584221, 1, 0, 0.7254902, 1,
1.210706, -0.08147531, 2.657479, 1, 0, 0.7215686, 1,
1.243061, -0.01046484, 0.6332291, 1, 0, 0.7137255, 1,
1.243174, -1.520146, 0.89939, 1, 0, 0.7098039, 1,
1.251276, -0.2831973, 0.4457285, 1, 0, 0.7019608, 1,
1.253192, -2.139958, 1.937755, 1, 0, 0.6941177, 1,
1.25339, 1.920538, 0.7793488, 1, 0, 0.6901961, 1,
1.260374, -0.7167863, 2.104865, 1, 0, 0.682353, 1,
1.265303, 0.702921, 2.03846, 1, 0, 0.6784314, 1,
1.284635, 0.07884743, 1.277633, 1, 0, 0.6705883, 1,
1.295863, 0.2802362, 2.804676, 1, 0, 0.6666667, 1,
1.305094, 0.9867957, 2.168422, 1, 0, 0.6588235, 1,
1.306584, -0.1468832, 1.069612, 1, 0, 0.654902, 1,
1.307741, -0.833263, 2.052528, 1, 0, 0.6470588, 1,
1.308302, -0.2268281, -0.1364131, 1, 0, 0.6431373, 1,
1.318708, -1.128525, 1.251157, 1, 0, 0.6352941, 1,
1.320736, -1.587365, 3.964631, 1, 0, 0.6313726, 1,
1.327326, 0.7026349, 2.057243, 1, 0, 0.6235294, 1,
1.328185, -0.2314282, 2.222304, 1, 0, 0.6196079, 1,
1.328819, -0.5264643, 2.079924, 1, 0, 0.6117647, 1,
1.342557, 1.471829, -0.07624857, 1, 0, 0.6078432, 1,
1.346413, 0.3623452, 2.104122, 1, 0, 0.6, 1,
1.346553, -0.09172541, -0.3367957, 1, 0, 0.5921569, 1,
1.350657, -0.5117939, 0.3688886, 1, 0, 0.5882353, 1,
1.368854, -0.9134505, 2.88839, 1, 0, 0.5803922, 1,
1.375123, -0.5263246, -0.02973427, 1, 0, 0.5764706, 1,
1.377753, 0.2446241, 1.854, 1, 0, 0.5686275, 1,
1.387477, -0.1565505, 2.831889, 1, 0, 0.5647059, 1,
1.388996, -0.07462995, 1.027605, 1, 0, 0.5568628, 1,
1.39382, -1.132015, 4.120152, 1, 0, 0.5529412, 1,
1.395681, -0.9234442, 0.7957215, 1, 0, 0.5450981, 1,
1.399399, 0.3347045, 0.6745374, 1, 0, 0.5411765, 1,
1.408704, -1.187486, 3.580414, 1, 0, 0.5333334, 1,
1.413951, -1.096346, 3.004495, 1, 0, 0.5294118, 1,
1.417219, 0.5730879, 1.182523, 1, 0, 0.5215687, 1,
1.422991, 0.4874853, -0.2090032, 1, 0, 0.5176471, 1,
1.43279, 1.478927, -0.5328525, 1, 0, 0.509804, 1,
1.437286, -0.1147353, 0.6452702, 1, 0, 0.5058824, 1,
1.442287, -1.31573, 0.9697224, 1, 0, 0.4980392, 1,
1.445093, -0.8641438, 2.709185, 1, 0, 0.4901961, 1,
1.450285, 0.8248407, 0.8104654, 1, 0, 0.4862745, 1,
1.455799, -0.8168533, 1.784208, 1, 0, 0.4784314, 1,
1.460023, 0.5807021, 1.037914, 1, 0, 0.4745098, 1,
1.466221, -0.5681922, 1.443832, 1, 0, 0.4666667, 1,
1.46651, 1.510057, -0.1250006, 1, 0, 0.4627451, 1,
1.491821, 0.5440096, 2.420058, 1, 0, 0.454902, 1,
1.50662, -0.07488947, 1.875838, 1, 0, 0.4509804, 1,
1.540091, 0.08359451, -0.3217151, 1, 0, 0.4431373, 1,
1.54262, 1.23401, 0.1343939, 1, 0, 0.4392157, 1,
1.544391, -0.3728828, 2.494081, 1, 0, 0.4313726, 1,
1.547136, 1.523938, 1.149458, 1, 0, 0.427451, 1,
1.549899, -0.1510725, 2.217725, 1, 0, 0.4196078, 1,
1.560073, 0.05380024, 1.252829, 1, 0, 0.4156863, 1,
1.562094, -0.9441436, 3.601126, 1, 0, 0.4078431, 1,
1.562818, 1.901989, 0.7725688, 1, 0, 0.4039216, 1,
1.577678, 0.7777751, 0.005908533, 1, 0, 0.3960784, 1,
1.586836, 2.436995, 0.7454095, 1, 0, 0.3882353, 1,
1.588139, -0.08863573, 0.9929652, 1, 0, 0.3843137, 1,
1.606896, -0.4337357, 1.316268, 1, 0, 0.3764706, 1,
1.617155, 0.4670627, 1.845586, 1, 0, 0.372549, 1,
1.620078, 2.116092, 0.3379806, 1, 0, 0.3647059, 1,
1.62336, -1.331421, 2.037263, 1, 0, 0.3607843, 1,
1.645738, 1.601709, 1.651669, 1, 0, 0.3529412, 1,
1.647231, 0.8192798, 1.579239, 1, 0, 0.3490196, 1,
1.654849, 1.682845, 0.9331533, 1, 0, 0.3411765, 1,
1.661721, -1.059924, 1.891068, 1, 0, 0.3372549, 1,
1.682124, 2.006965, 0.7204257, 1, 0, 0.3294118, 1,
1.701629, -0.5521764, 1.753325, 1, 0, 0.3254902, 1,
1.70227, 0.0589355, 1.293405, 1, 0, 0.3176471, 1,
1.714751, 0.3707723, 0.4455454, 1, 0, 0.3137255, 1,
1.717184, -1.501064, 3.228596, 1, 0, 0.3058824, 1,
1.722209, -0.4110121, 1.242608, 1, 0, 0.2980392, 1,
1.723445, -0.7302693, 2.124966, 1, 0, 0.2941177, 1,
1.728074, -0.3025485, 2.078043, 1, 0, 0.2862745, 1,
1.7323, -0.6708021, 1.287062, 1, 0, 0.282353, 1,
1.772668, 0.4429111, 0.8120754, 1, 0, 0.2745098, 1,
1.781824, -0.2004111, 0.8406531, 1, 0, 0.2705882, 1,
1.781916, -1.125484, 1.498536, 1, 0, 0.2627451, 1,
1.79318, -2.711103, 2.48001, 1, 0, 0.2588235, 1,
1.811445, 1.043282, -0.2272154, 1, 0, 0.2509804, 1,
1.825927, 0.1827518, -0.6308088, 1, 0, 0.2470588, 1,
1.826809, -0.6547921, 1.908585, 1, 0, 0.2392157, 1,
1.832313, 1.541203, 0.8849041, 1, 0, 0.2352941, 1,
1.83916, 0.7501416, -0.8164269, 1, 0, 0.227451, 1,
1.878221, -0.03264406, 1.77931, 1, 0, 0.2235294, 1,
1.898245, 1.304596, 0.9268991, 1, 0, 0.2156863, 1,
1.898257, -0.4754844, 2.754226, 1, 0, 0.2117647, 1,
1.901168, -0.05186956, 2.212123, 1, 0, 0.2039216, 1,
1.901299, -0.2610019, 2.558137, 1, 0, 0.1960784, 1,
1.93072, 0.3715844, 1.726121, 1, 0, 0.1921569, 1,
1.940528, -1.074123, 2.627027, 1, 0, 0.1843137, 1,
1.950278, 1.460327, 0.2875156, 1, 0, 0.1803922, 1,
1.993011, 0.9743347, 1.224403, 1, 0, 0.172549, 1,
2.009616, -1.406557, 2.389692, 1, 0, 0.1686275, 1,
2.009802, 0.4533981, 1.69931, 1, 0, 0.1607843, 1,
2.01514, -0.5013618, 2.553761, 1, 0, 0.1568628, 1,
2.03587, -0.2057929, -0.1167214, 1, 0, 0.1490196, 1,
2.039755, -0.5180188, 0.788976, 1, 0, 0.145098, 1,
2.085943, -0.9425282, 3.420507, 1, 0, 0.1372549, 1,
2.11769, 0.6312372, 3.294671, 1, 0, 0.1333333, 1,
2.119567, 0.02758945, 2.653074, 1, 0, 0.1254902, 1,
2.137081, -0.0587388, -0.04874079, 1, 0, 0.1215686, 1,
2.145534, 0.5198134, -0.4218881, 1, 0, 0.1137255, 1,
2.146619, 0.1795121, 1.802317, 1, 0, 0.1098039, 1,
2.197202, -0.3712569, -0.4925231, 1, 0, 0.1019608, 1,
2.207072, 0.1946349, 2.978462, 1, 0, 0.09411765, 1,
2.216547, -1.255141, 3.729745, 1, 0, 0.09019608, 1,
2.270898, 1.035705, 1.392121, 1, 0, 0.08235294, 1,
2.279171, -0.3985376, 1.371249, 1, 0, 0.07843138, 1,
2.29635, 0.3475721, 1.99708, 1, 0, 0.07058824, 1,
2.302956, 0.02845363, 0.5295604, 1, 0, 0.06666667, 1,
2.321663, -2.067171, 2.522564, 1, 0, 0.05882353, 1,
2.32692, 1.01564, 2.579531, 1, 0, 0.05490196, 1,
2.357801, 0.2567029, 2.356107, 1, 0, 0.04705882, 1,
2.424597, 0.3107445, 0.8043029, 1, 0, 0.04313726, 1,
2.4391, -0.4416119, 1.563767, 1, 0, 0.03529412, 1,
2.455487, -0.634302, 2.281409, 1, 0, 0.03137255, 1,
2.537022, -0.3290944, 2.038216, 1, 0, 0.02352941, 1,
2.572889, 1.667619, -0.2330942, 1, 0, 0.01960784, 1,
2.994744, 0.09613288, 1.996338, 1, 0, 0.01176471, 1,
3.146845, -0.07709407, 1.429939, 1, 0, 0.007843138, 1
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
-0.5283545, -4.200288, -7.587543, 0, -0.5, 0.5, 0.5,
-0.5283545, -4.200288, -7.587543, 1, -0.5, 0.5, 0.5,
-0.5283545, -4.200288, -7.587543, 1, 1.5, 0.5, 0.5,
-0.5283545, -4.200288, -7.587543, 0, 1.5, 0.5, 0.5
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
-5.449446, -0.01837313, -7.587543, 0, -0.5, 0.5, 0.5,
-5.449446, -0.01837313, -7.587543, 1, -0.5, 0.5, 0.5,
-5.449446, -0.01837313, -7.587543, 1, 1.5, 0.5, 0.5,
-5.449446, -0.01837313, -7.587543, 0, 1.5, 0.5, 0.5
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
-5.449446, -4.200288, -0.02681279, 0, -0.5, 0.5, 0.5,
-5.449446, -4.200288, -0.02681279, 1, -0.5, 0.5, 0.5,
-5.449446, -4.200288, -0.02681279, 1, 1.5, 0.5, 0.5,
-5.449446, -4.200288, -0.02681279, 0, 1.5, 0.5, 0.5
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
-4, -3.235231, -5.842759,
2, -3.235231, -5.842759,
-4, -3.235231, -5.842759,
-4, -3.396074, -6.133556,
-2, -3.235231, -5.842759,
-2, -3.396074, -6.133556,
0, -3.235231, -5.842759,
0, -3.396074, -6.133556,
2, -3.235231, -5.842759,
2, -3.396074, -6.133556
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
"-4",
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
-4, -3.71776, -6.715151, 0, -0.5, 0.5, 0.5,
-4, -3.71776, -6.715151, 1, -0.5, 0.5, 0.5,
-4, -3.71776, -6.715151, 1, 1.5, 0.5, 0.5,
-4, -3.71776, -6.715151, 0, 1.5, 0.5, 0.5,
-2, -3.71776, -6.715151, 0, -0.5, 0.5, 0.5,
-2, -3.71776, -6.715151, 1, -0.5, 0.5, 0.5,
-2, -3.71776, -6.715151, 1, 1.5, 0.5, 0.5,
-2, -3.71776, -6.715151, 0, 1.5, 0.5, 0.5,
0, -3.71776, -6.715151, 0, -0.5, 0.5, 0.5,
0, -3.71776, -6.715151, 1, -0.5, 0.5, 0.5,
0, -3.71776, -6.715151, 1, 1.5, 0.5, 0.5,
0, -3.71776, -6.715151, 0, 1.5, 0.5, 0.5,
2, -3.71776, -6.715151, 0, -0.5, 0.5, 0.5,
2, -3.71776, -6.715151, 1, -0.5, 0.5, 0.5,
2, -3.71776, -6.715151, 1, 1.5, 0.5, 0.5,
2, -3.71776, -6.715151, 0, 1.5, 0.5, 0.5
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
-4.31381, -3, -5.842759,
-4.31381, 3, -5.842759,
-4.31381, -3, -5.842759,
-4.503082, -3, -6.133556,
-4.31381, -2, -5.842759,
-4.503082, -2, -6.133556,
-4.31381, -1, -5.842759,
-4.503082, -1, -6.133556,
-4.31381, 0, -5.842759,
-4.503082, 0, -6.133556,
-4.31381, 1, -5.842759,
-4.503082, 1, -6.133556,
-4.31381, 2, -5.842759,
-4.503082, 2, -6.133556,
-4.31381, 3, -5.842759,
-4.503082, 3, -6.133556
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
-4.881628, -3, -6.715151, 0, -0.5, 0.5, 0.5,
-4.881628, -3, -6.715151, 1, -0.5, 0.5, 0.5,
-4.881628, -3, -6.715151, 1, 1.5, 0.5, 0.5,
-4.881628, -3, -6.715151, 0, 1.5, 0.5, 0.5,
-4.881628, -2, -6.715151, 0, -0.5, 0.5, 0.5,
-4.881628, -2, -6.715151, 1, -0.5, 0.5, 0.5,
-4.881628, -2, -6.715151, 1, 1.5, 0.5, 0.5,
-4.881628, -2, -6.715151, 0, 1.5, 0.5, 0.5,
-4.881628, -1, -6.715151, 0, -0.5, 0.5, 0.5,
-4.881628, -1, -6.715151, 1, -0.5, 0.5, 0.5,
-4.881628, -1, -6.715151, 1, 1.5, 0.5, 0.5,
-4.881628, -1, -6.715151, 0, 1.5, 0.5, 0.5,
-4.881628, 0, -6.715151, 0, -0.5, 0.5, 0.5,
-4.881628, 0, -6.715151, 1, -0.5, 0.5, 0.5,
-4.881628, 0, -6.715151, 1, 1.5, 0.5, 0.5,
-4.881628, 0, -6.715151, 0, 1.5, 0.5, 0.5,
-4.881628, 1, -6.715151, 0, -0.5, 0.5, 0.5,
-4.881628, 1, -6.715151, 1, -0.5, 0.5, 0.5,
-4.881628, 1, -6.715151, 1, 1.5, 0.5, 0.5,
-4.881628, 1, -6.715151, 0, 1.5, 0.5, 0.5,
-4.881628, 2, -6.715151, 0, -0.5, 0.5, 0.5,
-4.881628, 2, -6.715151, 1, -0.5, 0.5, 0.5,
-4.881628, 2, -6.715151, 1, 1.5, 0.5, 0.5,
-4.881628, 2, -6.715151, 0, 1.5, 0.5, 0.5,
-4.881628, 3, -6.715151, 0, -0.5, 0.5, 0.5,
-4.881628, 3, -6.715151, 1, -0.5, 0.5, 0.5,
-4.881628, 3, -6.715151, 1, 1.5, 0.5, 0.5,
-4.881628, 3, -6.715151, 0, 1.5, 0.5, 0.5
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
-4.31381, -3.235231, -4,
-4.31381, -3.235231, 4,
-4.31381, -3.235231, -4,
-4.503082, -3.396074, -4,
-4.31381, -3.235231, -2,
-4.503082, -3.396074, -2,
-4.31381, -3.235231, 0,
-4.503082, -3.396074, 0,
-4.31381, -3.235231, 2,
-4.503082, -3.396074, 2,
-4.31381, -3.235231, 4,
-4.503082, -3.396074, 4
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
-4.881628, -3.71776, -4, 0, -0.5, 0.5, 0.5,
-4.881628, -3.71776, -4, 1, -0.5, 0.5, 0.5,
-4.881628, -3.71776, -4, 1, 1.5, 0.5, 0.5,
-4.881628, -3.71776, -4, 0, 1.5, 0.5, 0.5,
-4.881628, -3.71776, -2, 0, -0.5, 0.5, 0.5,
-4.881628, -3.71776, -2, 1, -0.5, 0.5, 0.5,
-4.881628, -3.71776, -2, 1, 1.5, 0.5, 0.5,
-4.881628, -3.71776, -2, 0, 1.5, 0.5, 0.5,
-4.881628, -3.71776, 0, 0, -0.5, 0.5, 0.5,
-4.881628, -3.71776, 0, 1, -0.5, 0.5, 0.5,
-4.881628, -3.71776, 0, 1, 1.5, 0.5, 0.5,
-4.881628, -3.71776, 0, 0, 1.5, 0.5, 0.5,
-4.881628, -3.71776, 2, 0, -0.5, 0.5, 0.5,
-4.881628, -3.71776, 2, 1, -0.5, 0.5, 0.5,
-4.881628, -3.71776, 2, 1, 1.5, 0.5, 0.5,
-4.881628, -3.71776, 2, 0, 1.5, 0.5, 0.5,
-4.881628, -3.71776, 4, 0, -0.5, 0.5, 0.5,
-4.881628, -3.71776, 4, 1, -0.5, 0.5, 0.5,
-4.881628, -3.71776, 4, 1, 1.5, 0.5, 0.5,
-4.881628, -3.71776, 4, 0, 1.5, 0.5, 0.5
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
-4.31381, -3.235231, -5.842759,
-4.31381, 3.198485, -5.842759,
-4.31381, -3.235231, 5.789134,
-4.31381, 3.198485, 5.789134,
-4.31381, -3.235231, -5.842759,
-4.31381, -3.235231, 5.789134,
-4.31381, 3.198485, -5.842759,
-4.31381, 3.198485, 5.789134,
-4.31381, -3.235231, -5.842759,
3.257101, -3.235231, -5.842759,
-4.31381, -3.235231, 5.789134,
3.257101, -3.235231, 5.789134,
-4.31381, 3.198485, -5.842759,
3.257101, 3.198485, -5.842759,
-4.31381, 3.198485, 5.789134,
3.257101, 3.198485, 5.789134,
3.257101, -3.235231, -5.842759,
3.257101, 3.198485, -5.842759,
3.257101, -3.235231, 5.789134,
3.257101, 3.198485, 5.789134,
3.257101, -3.235231, -5.842759,
3.257101, -3.235231, 5.789134,
3.257101, 3.198485, -5.842759,
3.257101, 3.198485, 5.789134
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
var radius = 8.168547;
var distance = 36.34279;
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
mvMatrix.translate( 0.5283545, 0.01837313, 0.02681279 );
mvMatrix.scale( 1.16657, 1.372767, 0.7592912 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.34279);
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
ethylbenzene<-read.table("ethylbenzene.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ethylbenzene$V2
```

```
## Error in eval(expr, envir, enclos): object 'ethylbenzene' not found
```

```r
y<-ethylbenzene$V3
```

```
## Error in eval(expr, envir, enclos): object 'ethylbenzene' not found
```

```r
z<-ethylbenzene$V4
```

```
## Error in eval(expr, envir, enclos): object 'ethylbenzene' not found
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
-4.203554, -0.02593777, -0.5357602, 0, 0, 1, 1, 1,
-2.720672, -1.195407, -3.541466, 1, 0, 0, 1, 1,
-2.594471, -1.104305, 0.6593833, 1, 0, 0, 1, 1,
-2.487297, 0.3033175, -1.371381, 1, 0, 0, 1, 1,
-2.439618, -1.431214, -1.74266, 1, 0, 0, 1, 1,
-2.408717, -0.7543525, -2.518777, 1, 0, 0, 1, 1,
-2.373353, 1.492667, -0.208177, 0, 0, 0, 1, 1,
-2.364086, -0.5945925, -2.657069, 0, 0, 0, 1, 1,
-2.345937, -0.3376287, -2.468531, 0, 0, 0, 1, 1,
-2.320533, -0.1698911, -2.534908, 0, 0, 0, 1, 1,
-2.311357, 1.354935, -3.332847, 0, 0, 0, 1, 1,
-2.24705, 0.9120313, 0.1790628, 0, 0, 0, 1, 1,
-2.246655, 1.342876, -3.078663, 0, 0, 0, 1, 1,
-2.154123, 0.8895461, -1.240468, 1, 1, 1, 1, 1,
-2.152764, 1.647951, -1.114983, 1, 1, 1, 1, 1,
-2.141001, 1.248782, -1.474438, 1, 1, 1, 1, 1,
-2.137349, 2.114915, -0.25405, 1, 1, 1, 1, 1,
-2.134954, 0.392304, -1.431454, 1, 1, 1, 1, 1,
-2.103152, 0.1379176, -2.520087, 1, 1, 1, 1, 1,
-2.057256, 0.4917219, -0.05925963, 1, 1, 1, 1, 1,
-2.052644, 0.03845813, -1.376287, 1, 1, 1, 1, 1,
-2.018896, 0.5802695, -3.708274, 1, 1, 1, 1, 1,
-2.018519, -0.2560502, -0.4864517, 1, 1, 1, 1, 1,
-2.011778, 1.852269, -0.5937592, 1, 1, 1, 1, 1,
-2.004377, 0.9297007, -1.631647, 1, 1, 1, 1, 1,
-1.959918, -0.2457441, -1.995184, 1, 1, 1, 1, 1,
-1.942088, -0.5119558, -1.838786, 1, 1, 1, 1, 1,
-1.941136, 1.628099, -1.706861, 1, 1, 1, 1, 1,
-1.909147, -1.789564, -3.540304, 0, 0, 1, 1, 1,
-1.903707, -1.457315, -3.224093, 1, 0, 0, 1, 1,
-1.874774, -0.8597556, -2.762069, 1, 0, 0, 1, 1,
-1.853607, -1.096223, -1.69818, 1, 0, 0, 1, 1,
-1.842935, 0.03119566, -0.7798614, 1, 0, 0, 1, 1,
-1.815593, -0.08124282, -1.099217, 1, 0, 0, 1, 1,
-1.777716, -1.523789, -3.44048, 0, 0, 0, 1, 1,
-1.772839, -0.9970179, -2.528025, 0, 0, 0, 1, 1,
-1.734284, -0.8697502, -2.15921, 0, 0, 0, 1, 1,
-1.730404, 1.316885, 0.6228486, 0, 0, 0, 1, 1,
-1.726591, 0.3149863, -1.880327, 0, 0, 0, 1, 1,
-1.721531, 0.6743991, 0.4275663, 0, 0, 0, 1, 1,
-1.700169, 0.9050748, -1.68604, 0, 0, 0, 1, 1,
-1.690018, 2.11423, -2.533203, 1, 1, 1, 1, 1,
-1.684429, -1.521415, -2.427794, 1, 1, 1, 1, 1,
-1.673149, -1.358316, -2.285418, 1, 1, 1, 1, 1,
-1.666638, -1.588537, -0.7248781, 1, 1, 1, 1, 1,
-1.655678, -1.001235, -1.600514, 1, 1, 1, 1, 1,
-1.640535, -0.9500754, -3.950391, 1, 1, 1, 1, 1,
-1.632915, -0.9228317, 0.09222367, 1, 1, 1, 1, 1,
-1.594016, -1.375879, -2.528282, 1, 1, 1, 1, 1,
-1.591794, -0.543037, -3.284961, 1, 1, 1, 1, 1,
-1.588871, -0.08037546, -0.7167558, 1, 1, 1, 1, 1,
-1.575767, 0.2131157, -2.139431, 1, 1, 1, 1, 1,
-1.556178, 1.113718, -1.290433, 1, 1, 1, 1, 1,
-1.55042, 0.4988475, -1.12539, 1, 1, 1, 1, 1,
-1.547829, 0.8290274, -1.321741, 1, 1, 1, 1, 1,
-1.543428, 1.175419, -0.609791, 1, 1, 1, 1, 1,
-1.538775, -3.141536, -2.857995, 0, 0, 1, 1, 1,
-1.537215, -0.3857507, -1.732977, 1, 0, 0, 1, 1,
-1.529335, 1.854262, -0.1463875, 1, 0, 0, 1, 1,
-1.52383, 1.063711, -1.749034, 1, 0, 0, 1, 1,
-1.519643, -1.803747, -2.238583, 1, 0, 0, 1, 1,
-1.509531, 0.4113331, -1.763348, 1, 0, 0, 1, 1,
-1.50668, -0.4212442, -1.830534, 0, 0, 0, 1, 1,
-1.497388, -2.37252, -3.564666, 0, 0, 0, 1, 1,
-1.492327, -0.6392121, -1.572451, 0, 0, 0, 1, 1,
-1.487549, -0.5786135, -1.481623, 0, 0, 0, 1, 1,
-1.482528, 0.3941563, -0.829731, 0, 0, 0, 1, 1,
-1.465885, 2.861123, -2.284917, 0, 0, 0, 1, 1,
-1.463602, 0.1585277, -2.222878, 0, 0, 0, 1, 1,
-1.448174, -0.6849692, -3.981978, 1, 1, 1, 1, 1,
-1.442175, -0.8728516, -2.788019, 1, 1, 1, 1, 1,
-1.422757, 0.06219159, -1.182535, 1, 1, 1, 1, 1,
-1.421574, -2.1297, -3.211637, 1, 1, 1, 1, 1,
-1.40262, -0.004407691, -1.040233, 1, 1, 1, 1, 1,
-1.396442, -2.853255, -4.743045, 1, 1, 1, 1, 1,
-1.395037, -0.7136565, -1.295947, 1, 1, 1, 1, 1,
-1.390039, -1.0658, -2.437301, 1, 1, 1, 1, 1,
-1.367926, -0.8823499, -1.935529, 1, 1, 1, 1, 1,
-1.364945, -1.246575, -3.066018, 1, 1, 1, 1, 1,
-1.361113, 0.9971192, 0.5310639, 1, 1, 1, 1, 1,
-1.34486, 0.5301718, -1.191869, 1, 1, 1, 1, 1,
-1.333499, 0.5702294, -1.814205, 1, 1, 1, 1, 1,
-1.310971, -2.205785, -3.620067, 1, 1, 1, 1, 1,
-1.293845, 0.005909829, -1.416065, 1, 1, 1, 1, 1,
-1.29232, -0.424172, -1.305006, 0, 0, 1, 1, 1,
-1.289708, -1.892309, -1.753858, 1, 0, 0, 1, 1,
-1.288157, -1.555164, -3.341952, 1, 0, 0, 1, 1,
-1.272475, -0.4849743, -1.219315, 1, 0, 0, 1, 1,
-1.267785, 1.751209, 0.4968672, 1, 0, 0, 1, 1,
-1.26565, -0.5972078, -3.34638, 1, 0, 0, 1, 1,
-1.256379, -0.5634797, -2.824299, 0, 0, 0, 1, 1,
-1.247395, -0.8118641, -2.25597, 0, 0, 0, 1, 1,
-1.24138, 0.6218548, -1.110355, 0, 0, 0, 1, 1,
-1.234448, -0.321833, -2.460269, 0, 0, 0, 1, 1,
-1.216557, -2.958982, -2.914236, 0, 0, 0, 1, 1,
-1.213363, 0.6454525, -1.969831, 0, 0, 0, 1, 1,
-1.199911, 0.6203985, -1.055545, 0, 0, 0, 1, 1,
-1.196972, -0.5550038, -1.960095, 1, 1, 1, 1, 1,
-1.195191, -2.148205, -3.018746, 1, 1, 1, 1, 1,
-1.190145, -0.452524, -0.8759798, 1, 1, 1, 1, 1,
-1.188138, -0.2921368, -1.995405, 1, 1, 1, 1, 1,
-1.186479, 0.9256938, -2.561586, 1, 1, 1, 1, 1,
-1.173291, -0.834136, -3.653586, 1, 1, 1, 1, 1,
-1.172311, -0.1143057, -2.084207, 1, 1, 1, 1, 1,
-1.166334, -0.3846822, -1.165529, 1, 1, 1, 1, 1,
-1.162591, -0.2685741, -0.5142347, 1, 1, 1, 1, 1,
-1.150536, 0.9051495, -0.9685661, 1, 1, 1, 1, 1,
-1.149243, 0.5624284, -3.901358, 1, 1, 1, 1, 1,
-1.146842, -0.7174513, -2.728243, 1, 1, 1, 1, 1,
-1.134138, -1.277461, -1.846248, 1, 1, 1, 1, 1,
-1.134031, 1.004531, -3.120038, 1, 1, 1, 1, 1,
-1.132509, -0.5659573, -2.553832, 1, 1, 1, 1, 1,
-1.124291, -0.05145081, -2.567271, 0, 0, 1, 1, 1,
-1.123582, 0.2881062, -1.211035, 1, 0, 0, 1, 1,
-1.122051, -2.171426, -2.246628, 1, 0, 0, 1, 1,
-1.12013, -1.530825, -3.556231, 1, 0, 0, 1, 1,
-1.119556, 2.091739, 0.7082701, 1, 0, 0, 1, 1,
-1.116305, 1.332577, -0.1810502, 1, 0, 0, 1, 1,
-1.113247, 0.5015597, -3.109273, 0, 0, 0, 1, 1,
-1.106974, 1.144954, -0.9273511, 0, 0, 0, 1, 1,
-1.105381, 0.5347588, -0.8663658, 0, 0, 0, 1, 1,
-1.10196, 1.956872, 0.5749726, 0, 0, 0, 1, 1,
-1.099957, 0.03542306, -3.077553, 0, 0, 0, 1, 1,
-1.097006, 2.296656, 0.1691825, 0, 0, 0, 1, 1,
-1.086413, -0.4704649, -2.221987, 0, 0, 0, 1, 1,
-1.078015, 0.3278418, -2.244389, 1, 1, 1, 1, 1,
-1.072888, 0.8110397, -2.937222, 1, 1, 1, 1, 1,
-1.072448, 1.183662, -1.755688, 1, 1, 1, 1, 1,
-1.061684, -1.155469, -2.481586, 1, 1, 1, 1, 1,
-1.058286, 0.8386188, 0.0235435, 1, 1, 1, 1, 1,
-1.054293, 1.203574, 0.1148496, 1, 1, 1, 1, 1,
-1.052838, 0.4346851, 0.0714955, 1, 1, 1, 1, 1,
-1.044578, -0.2678322, -1.279075, 1, 1, 1, 1, 1,
-1.040717, -0.9140895, -1.873957, 1, 1, 1, 1, 1,
-1.030723, 1.874089, -0.6124446, 1, 1, 1, 1, 1,
-1.030564, -0.914126, -1.890196, 1, 1, 1, 1, 1,
-1.027098, 1.026467, -0.9526576, 1, 1, 1, 1, 1,
-1.026388, 0.897037, 0.4281011, 1, 1, 1, 1, 1,
-1.023866, 0.4131504, -1.325178, 1, 1, 1, 1, 1,
-1.022274, -0.7363737, -1.724049, 1, 1, 1, 1, 1,
-1.014597, -0.2400867, -2.73548, 0, 0, 1, 1, 1,
-1.006771, 0.1490136, -1.579295, 1, 0, 0, 1, 1,
-1.000393, 1.129132, 0.8168526, 1, 0, 0, 1, 1,
-0.9990344, 0.7917219, -1.068184, 1, 0, 0, 1, 1,
-0.996941, 1.369998, 0.4429621, 1, 0, 0, 1, 1,
-0.9966765, -0.2425104, -2.896403, 1, 0, 0, 1, 1,
-0.9949096, 0.01133524, -0.5107652, 0, 0, 0, 1, 1,
-0.9922894, 1.147498, 0.4742039, 0, 0, 0, 1, 1,
-0.9921589, 1.317311, 0.8657891, 0, 0, 0, 1, 1,
-0.9854369, 0.1518596, -1.886147, 0, 0, 0, 1, 1,
-0.9761041, -0.7244186, -1.789385, 0, 0, 0, 1, 1,
-0.9688325, 0.1212912, -0.2412525, 0, 0, 0, 1, 1,
-0.9654065, 0.1761784, -0.7228682, 0, 0, 0, 1, 1,
-0.9645727, -0.007750559, -0.4080603, 1, 1, 1, 1, 1,
-0.9612294, 2.171089, 0.4225191, 1, 1, 1, 1, 1,
-0.9597366, -0.9026076, -2.001447, 1, 1, 1, 1, 1,
-0.9451975, 0.8992679, -1.099619, 1, 1, 1, 1, 1,
-0.9438347, 0.6629889, -1.09928, 1, 1, 1, 1, 1,
-0.9401584, -0.485525, -0.4897515, 1, 1, 1, 1, 1,
-0.938879, -0.6012284, -0.5011225, 1, 1, 1, 1, 1,
-0.9377536, 1.062589, -3.028901, 1, 1, 1, 1, 1,
-0.9372102, -0.7555795, -2.419177, 1, 1, 1, 1, 1,
-0.9329609, -0.06870557, 0.5061927, 1, 1, 1, 1, 1,
-0.932181, -0.8365957, -3.140942, 1, 1, 1, 1, 1,
-0.9246873, 0.8669014, -0.06187204, 1, 1, 1, 1, 1,
-0.9173864, -2.587345, -0.8850643, 1, 1, 1, 1, 1,
-0.9160768, 1.946398, -1.142808, 1, 1, 1, 1, 1,
-0.910573, 0.1594821, -0.380341, 1, 1, 1, 1, 1,
-0.906864, -0.5300325, -1.371028, 0, 0, 1, 1, 1,
-0.9058567, -0.09411572, -2.819638, 1, 0, 0, 1, 1,
-0.8999245, 0.03705022, -0.2510463, 1, 0, 0, 1, 1,
-0.8919844, -0.1931048, -2.773836, 1, 0, 0, 1, 1,
-0.8894483, -1.203702, -2.917356, 1, 0, 0, 1, 1,
-0.886753, 1.212925, -0.6639186, 1, 0, 0, 1, 1,
-0.886032, 0.295372, -0.1450613, 0, 0, 0, 1, 1,
-0.881464, 0.503265, -2.307946, 0, 0, 0, 1, 1,
-0.8789582, 0.02884137, -2.242755, 0, 0, 0, 1, 1,
-0.8783388, 1.036593, -0.9842036, 0, 0, 0, 1, 1,
-0.8765518, -0.6889953, -0.8355638, 0, 0, 0, 1, 1,
-0.8755826, 0.8865346, -1.313486, 0, 0, 0, 1, 1,
-0.8713809, 0.6059266, -1.319482, 0, 0, 0, 1, 1,
-0.8691178, 0.5950625, -0.9910199, 1, 1, 1, 1, 1,
-0.8619701, 1.398487, -0.5668573, 1, 1, 1, 1, 1,
-0.8533328, -0.1974466, 0.04225733, 1, 1, 1, 1, 1,
-0.8528544, -0.7361199, -3.848586, 1, 1, 1, 1, 1,
-0.8500363, 1.33871, 0.9014853, 1, 1, 1, 1, 1,
-0.8416854, -0.6910061, -0.3491238, 1, 1, 1, 1, 1,
-0.8407154, 0.3492394, -0.3561, 1, 1, 1, 1, 1,
-0.8384812, -0.2058724, -1.702376, 1, 1, 1, 1, 1,
-0.8383613, 0.02827409, -0.3086993, 1, 1, 1, 1, 1,
-0.8333408, 1.384541, -2.731424, 1, 1, 1, 1, 1,
-0.8249558, -0.02696087, 0.4611868, 1, 1, 1, 1, 1,
-0.8185016, -0.4400627, -2.306804, 1, 1, 1, 1, 1,
-0.8175266, 0.1926756, -2.796055, 1, 1, 1, 1, 1,
-0.8092917, -0.2223039, -1.587141, 1, 1, 1, 1, 1,
-0.8064015, -0.3093106, -3.404109, 1, 1, 1, 1, 1,
-0.8061197, -0.1440952, -3.284718, 0, 0, 1, 1, 1,
-0.8044747, -0.4400393, -3.596328, 1, 0, 0, 1, 1,
-0.801071, 0.5336926, -1.257125, 1, 0, 0, 1, 1,
-0.8009188, -1.86012, -3.433291, 1, 0, 0, 1, 1,
-0.7955057, -0.8822007, -2.487899, 1, 0, 0, 1, 1,
-0.7919886, 1.894442, -0.9799178, 1, 0, 0, 1, 1,
-0.7854946, -0.4950675, -2.407513, 0, 0, 0, 1, 1,
-0.7835122, -0.5799424, -0.881746, 0, 0, 0, 1, 1,
-0.7802866, -1.225277, -2.943035, 0, 0, 0, 1, 1,
-0.7793609, -0.5276274, -1.88703, 0, 0, 0, 1, 1,
-0.772747, -0.1960575, -1.443097, 0, 0, 0, 1, 1,
-0.7697797, 0.09403528, -0.6194533, 0, 0, 0, 1, 1,
-0.7695256, -0.6957605, -1.611551, 0, 0, 0, 1, 1,
-0.7636703, -1.601393, -2.046257, 1, 1, 1, 1, 1,
-0.7609945, -0.5955767, -2.178771, 1, 1, 1, 1, 1,
-0.7584267, -1.012201, -2.812164, 1, 1, 1, 1, 1,
-0.7555544, 0.7888328, -1.545252, 1, 1, 1, 1, 1,
-0.7549639, 0.6352381, -0.5742887, 1, 1, 1, 1, 1,
-0.7525809, -0.462809, -2.248165, 1, 1, 1, 1, 1,
-0.7519798, 0.2365748, -2.673932, 1, 1, 1, 1, 1,
-0.746941, 0.1799365, -0.808082, 1, 1, 1, 1, 1,
-0.7334669, -0.9674029, -3.184047, 1, 1, 1, 1, 1,
-0.7295927, 1.318397, 0.7298985, 1, 1, 1, 1, 1,
-0.7265694, -1.235062, -2.267174, 1, 1, 1, 1, 1,
-0.7243893, 0.3279082, -0.6358919, 1, 1, 1, 1, 1,
-0.7242369, 0.5929816, -1.021134, 1, 1, 1, 1, 1,
-0.7158816, -0.2589368, -1.207291, 1, 1, 1, 1, 1,
-0.7147865, 0.6159067, -0.6073462, 1, 1, 1, 1, 1,
-0.708917, -0.978424, -3.167241, 0, 0, 1, 1, 1,
-0.7047309, 0.5861604, -2.609671, 1, 0, 0, 1, 1,
-0.7042963, -1.725956, -1.231876, 1, 0, 0, 1, 1,
-0.6976435, 0.7864559, -0.3202839, 1, 0, 0, 1, 1,
-0.6957951, -0.2278539, -1.381141, 1, 0, 0, 1, 1,
-0.6952097, -0.9457144, -3.475545, 1, 0, 0, 1, 1,
-0.6935636, 1.123964, -0.9321782, 0, 0, 0, 1, 1,
-0.6905718, -0.007738183, -1.161548, 0, 0, 0, 1, 1,
-0.6869835, -1.274582, -2.449898, 0, 0, 0, 1, 1,
-0.6777702, 1.324168, 2.136161, 0, 0, 0, 1, 1,
-0.6769387, -0.02018568, -1.894006, 0, 0, 0, 1, 1,
-0.676147, -0.8598487, -1.860119, 0, 0, 0, 1, 1,
-0.6751801, -1.470384, -2.579493, 0, 0, 0, 1, 1,
-0.6745107, 0.3595493, -1.438826, 1, 1, 1, 1, 1,
-0.6729925, 0.7225788, -1.240266, 1, 1, 1, 1, 1,
-0.6690422, -1.29518, -4.299231, 1, 1, 1, 1, 1,
-0.6667473, -0.4807733, -2.825515, 1, 1, 1, 1, 1,
-0.6628948, 0.1309528, -3.435936, 1, 1, 1, 1, 1,
-0.662285, -0.1227857, -2.73805, 1, 1, 1, 1, 1,
-0.6622249, 0.5490677, -0.352645, 1, 1, 1, 1, 1,
-0.6605344, -0.18212, -3.277577, 1, 1, 1, 1, 1,
-0.6546857, -0.430191, -3.272356, 1, 1, 1, 1, 1,
-0.6498439, -0.6625579, -1.673292, 1, 1, 1, 1, 1,
-0.647912, -0.5873228, -3.727756, 1, 1, 1, 1, 1,
-0.6450111, -1.259509, -1.51418, 1, 1, 1, 1, 1,
-0.6442743, -0.6052576, -3.349959, 1, 1, 1, 1, 1,
-0.6385241, 1.201333, -0.7989591, 1, 1, 1, 1, 1,
-0.6381243, -1.118203, -2.431253, 1, 1, 1, 1, 1,
-0.6356605, -0.9826944, -2.914361, 0, 0, 1, 1, 1,
-0.6316051, -0.3555829, -2.20948, 1, 0, 0, 1, 1,
-0.6279104, -0.9006075, -2.136715, 1, 0, 0, 1, 1,
-0.6273194, -0.03810552, -3.817526, 1, 0, 0, 1, 1,
-0.6270634, -1.323114, -2.820137, 1, 0, 0, 1, 1,
-0.6232917, 1.058562, -0.6143326, 1, 0, 0, 1, 1,
-0.6109166, 1.128968, 0.04486503, 0, 0, 0, 1, 1,
-0.610414, -0.2312531, 0.08796526, 0, 0, 0, 1, 1,
-0.6080363, 1.227718, -0.8623435, 0, 0, 0, 1, 1,
-0.607307, -1.004029, -1.689355, 0, 0, 0, 1, 1,
-0.6066349, -0.9920612, -3.359493, 0, 0, 0, 1, 1,
-0.6042786, 1.812496, 0.2796794, 0, 0, 0, 1, 1,
-0.601333, 1.048538, 0.4855297, 0, 0, 0, 1, 1,
-0.5962657, 0.1634114, -1.125826, 1, 1, 1, 1, 1,
-0.5960298, 0.3563267, 0.4629836, 1, 1, 1, 1, 1,
-0.5946825, 1.304424, -1.585735, 1, 1, 1, 1, 1,
-0.5925112, -0.799234, -2.023376, 1, 1, 1, 1, 1,
-0.5920178, 0.8168035, -1.306144, 1, 1, 1, 1, 1,
-0.5884649, -0.1377191, -3.963116, 1, 1, 1, 1, 1,
-0.5879539, -0.5746276, -3.29951, 1, 1, 1, 1, 1,
-0.5827923, 0.1507086, -0.4873097, 1, 1, 1, 1, 1,
-0.5790603, 0.5518817, -1.792586, 1, 1, 1, 1, 1,
-0.5748785, 1.266496, 0.7041488, 1, 1, 1, 1, 1,
-0.5744524, -0.3424339, -2.602022, 1, 1, 1, 1, 1,
-0.5727752, 0.5979954, -1.404933, 1, 1, 1, 1, 1,
-0.5727114, 0.6543806, -0.767494, 1, 1, 1, 1, 1,
-0.5721114, 0.8148546, -1.626506, 1, 1, 1, 1, 1,
-0.5711296, 0.5260365, -1.314373, 1, 1, 1, 1, 1,
-0.5706021, -0.5894529, 0.1405958, 0, 0, 1, 1, 1,
-0.5703406, 0.2941779, -0.3945924, 1, 0, 0, 1, 1,
-0.5653377, 1.708814, -1.683504, 1, 0, 0, 1, 1,
-0.5651478, 0.7372331, 1.284215, 1, 0, 0, 1, 1,
-0.5641395, -0.8456799, -3.704445, 1, 0, 0, 1, 1,
-0.5571752, -0.2500942, -3.208662, 1, 0, 0, 1, 1,
-0.5560247, -0.6079966, -4.322807, 0, 0, 0, 1, 1,
-0.549609, 0.564352, -1.443729, 0, 0, 0, 1, 1,
-0.5454065, -1.189831, -3.125961, 0, 0, 0, 1, 1,
-0.5453222, -1.092691, -2.625028, 0, 0, 0, 1, 1,
-0.5418609, 0.006189645, -2.535208, 0, 0, 0, 1, 1,
-0.5380992, -0.7504894, -3.42689, 0, 0, 0, 1, 1,
-0.5379952, -0.7396742, -2.771126, 0, 0, 0, 1, 1,
-0.5373865, 0.4133972, 0.6239558, 1, 1, 1, 1, 1,
-0.5347897, 0.9719869, -2.041052, 1, 1, 1, 1, 1,
-0.5250145, 0.5336537, 0.6314124, 1, 1, 1, 1, 1,
-0.5239156, 2.237771, 1.105727, 1, 1, 1, 1, 1,
-0.5147675, -0.5720226, -2.786821, 1, 1, 1, 1, 1,
-0.507976, -1.646168, -3.417381, 1, 1, 1, 1, 1,
-0.5060078, 0.06288566, -2.612192, 1, 1, 1, 1, 1,
-0.5049239, -0.2001471, -3.62759, 1, 1, 1, 1, 1,
-0.499208, -0.4735925, -4.149705, 1, 1, 1, 1, 1,
-0.492695, 0.2814761, -1.476373, 1, 1, 1, 1, 1,
-0.4892459, 0.5535991, -1.499722, 1, 1, 1, 1, 1,
-0.4842558, 0.2282547, -2.441116, 1, 1, 1, 1, 1,
-0.4814826, 0.7542492, -0.3227304, 1, 1, 1, 1, 1,
-0.4785366, 0.3642193, -0.9301524, 1, 1, 1, 1, 1,
-0.4695584, -0.6046891, -0.6747438, 1, 1, 1, 1, 1,
-0.46906, 0.7720494, -0.2324189, 0, 0, 1, 1, 1,
-0.4673601, -0.2563705, -3.132687, 1, 0, 0, 1, 1,
-0.4665795, -1.930146, -2.667551, 1, 0, 0, 1, 1,
-0.4646383, -0.2847233, -2.854272, 1, 0, 0, 1, 1,
-0.4615847, 0.003491846, -1.116995, 1, 0, 0, 1, 1,
-0.4552449, -1.716126, -4.13702, 1, 0, 0, 1, 1,
-0.4522988, -0.2673611, -2.463591, 0, 0, 0, 1, 1,
-0.4514177, -0.04972361, -2.921444, 0, 0, 0, 1, 1,
-0.4497931, 1.799194, 0.06772647, 0, 0, 0, 1, 1,
-0.4481227, -0.1640053, -0.5349741, 0, 0, 0, 1, 1,
-0.4465625, 0.9173306, -0.2065404, 0, 0, 0, 1, 1,
-0.4443598, -0.03691068, -1.689105, 0, 0, 0, 1, 1,
-0.4416206, -1.407118, -2.966115, 0, 0, 0, 1, 1,
-0.440507, 0.2987857, -0.2837024, 1, 1, 1, 1, 1,
-0.4247346, -2.056393, -2.319207, 1, 1, 1, 1, 1,
-0.4206932, -1.699252, -3.206841, 1, 1, 1, 1, 1,
-0.4161758, -1.595856, -2.493898, 1, 1, 1, 1, 1,
-0.4107075, 1.726759, -0.3320582, 1, 1, 1, 1, 1,
-0.4096958, -0.6625409, -1.814794, 1, 1, 1, 1, 1,
-0.4078774, -1.574379, -2.878974, 1, 1, 1, 1, 1,
-0.4061914, 0.6313155, -0.04442357, 1, 1, 1, 1, 1,
-0.3994786, 1.28599, -0.9329971, 1, 1, 1, 1, 1,
-0.3937773, -0.863148, -3.601443, 1, 1, 1, 1, 1,
-0.3937611, -2.621037, -3.648903, 1, 1, 1, 1, 1,
-0.3919719, 0.5591685, -0.8584213, 1, 1, 1, 1, 1,
-0.3915234, 0.2721976, -0.1537772, 1, 1, 1, 1, 1,
-0.3854327, 0.5846036, -0.9731557, 1, 1, 1, 1, 1,
-0.3729955, 0.763474, -0.2274698, 1, 1, 1, 1, 1,
-0.3700436, -2.661638, -2.833711, 0, 0, 1, 1, 1,
-0.3640607, 0.2110971, -1.666123, 1, 0, 0, 1, 1,
-0.3614437, 0.6308711, 1.676434, 1, 0, 0, 1, 1,
-0.3553499, -1.194716, -3.037945, 1, 0, 0, 1, 1,
-0.3521631, 0.7413031, -0.3640606, 1, 0, 0, 1, 1,
-0.3489421, -0.3345801, -2.148706, 1, 0, 0, 1, 1,
-0.3433917, -0.5080642, -2.817391, 0, 0, 0, 1, 1,
-0.3418269, 0.1981137, -0.1500629, 0, 0, 0, 1, 1,
-0.3314036, -0.9203439, -4.186123, 0, 0, 0, 1, 1,
-0.3285329, -0.05195001, -2.87093, 0, 0, 0, 1, 1,
-0.3271146, -0.4454958, -2.830499, 0, 0, 0, 1, 1,
-0.3261577, -0.7353135, -3.904395, 0, 0, 0, 1, 1,
-0.3241388, -0.1034624, -0.5427732, 0, 0, 0, 1, 1,
-0.3184218, -0.3599623, -3.37494, 1, 1, 1, 1, 1,
-0.3174675, 0.807059, -0.2405082, 1, 1, 1, 1, 1,
-0.311748, 2.037281, -2.222237, 1, 1, 1, 1, 1,
-0.3066969, 0.1082152, -0.1448281, 1, 1, 1, 1, 1,
-0.3059227, 2.373843, -0.4967951, 1, 1, 1, 1, 1,
-0.3046193, -0.4992326, -3.620538, 1, 1, 1, 1, 1,
-0.3044901, -0.2551224, -3.132622, 1, 1, 1, 1, 1,
-0.3042733, -1.161183, -3.75947, 1, 1, 1, 1, 1,
-0.3002852, 0.1032976, -1.914836, 1, 1, 1, 1, 1,
-0.2999064, -2.281777, -1.829577, 1, 1, 1, 1, 1,
-0.2972968, -1.241464, -3.119231, 1, 1, 1, 1, 1,
-0.2953303, 1.452866, -0.6152062, 1, 1, 1, 1, 1,
-0.293118, -0.1715309, -1.925789, 1, 1, 1, 1, 1,
-0.2894196, -3.102758, -3.296792, 1, 1, 1, 1, 1,
-0.2872572, -0.5127622, -2.491045, 1, 1, 1, 1, 1,
-0.285559, -0.1245472, -2.873403, 0, 0, 1, 1, 1,
-0.2851862, -0.5426915, -2.867294, 1, 0, 0, 1, 1,
-0.2843973, 0.8224987, -0.1840781, 1, 0, 0, 1, 1,
-0.2798992, -0.8191653, -3.813675, 1, 0, 0, 1, 1,
-0.2791743, 3.10479, -1.094074, 1, 0, 0, 1, 1,
-0.2790014, -0.1611819, -1.797904, 1, 0, 0, 1, 1,
-0.2733871, 0.6597514, -2.557744, 0, 0, 0, 1, 1,
-0.2722929, -0.05257884, -1.48998, 0, 0, 0, 1, 1,
-0.2700374, -1.558805, -3.05239, 0, 0, 0, 1, 1,
-0.2694233, 1.377399, -1.712507, 0, 0, 0, 1, 1,
-0.2647775, -1.127497, -3.311604, 0, 0, 0, 1, 1,
-0.2639233, -1.241459, -3.318362, 0, 0, 0, 1, 1,
-0.2631981, 0.4382478, -0.8322543, 0, 0, 0, 1, 1,
-0.2614335, 0.394158, 0.7342282, 1, 1, 1, 1, 1,
-0.2596069, -1.190269, -3.689851, 1, 1, 1, 1, 1,
-0.2590912, -1.239717, -2.938271, 1, 1, 1, 1, 1,
-0.2548863, 0.4631561, -1.064282, 1, 1, 1, 1, 1,
-0.2474784, 0.5242357, 0.4671983, 1, 1, 1, 1, 1,
-0.2453613, 0.5832543, -0.7739875, 1, 1, 1, 1, 1,
-0.2438759, -0.5572717, -2.009762, 1, 1, 1, 1, 1,
-0.2431406, 1.683197, 0.8495034, 1, 1, 1, 1, 1,
-0.2381111, 0.5185713, -0.9811786, 1, 1, 1, 1, 1,
-0.2290359, -0.3243336, -1.683107, 1, 1, 1, 1, 1,
-0.2281372, 1.822821, -1.359125, 1, 1, 1, 1, 1,
-0.2279945, -0.8538889, -2.690852, 1, 1, 1, 1, 1,
-0.227226, -0.6584811, -2.242874, 1, 1, 1, 1, 1,
-0.2214215, 0.4453547, -1.390619, 1, 1, 1, 1, 1,
-0.2173542, 0.7707137, -0.584752, 1, 1, 1, 1, 1,
-0.213857, 1.730202, -1.16882, 0, 0, 1, 1, 1,
-0.2138485, 0.1238066, -2.093847, 1, 0, 0, 1, 1,
-0.212594, -0.05635762, -3.044762, 1, 0, 0, 1, 1,
-0.2084841, 0.5795482, -1.252147, 1, 0, 0, 1, 1,
-0.2006114, -1.312464, -2.811457, 1, 0, 0, 1, 1,
-0.198301, -0.1101523, -1.922412, 1, 0, 0, 1, 1,
-0.1963802, -0.2214143, -2.772074, 0, 0, 0, 1, 1,
-0.1963076, -0.8438772, -2.634624, 0, 0, 0, 1, 1,
-0.1957548, 1.428982, 1.569916, 0, 0, 0, 1, 1,
-0.195608, -0.08770376, -1.074395, 0, 0, 0, 1, 1,
-0.1898829, 0.2743416, 0.02467079, 0, 0, 0, 1, 1,
-0.185532, -0.3331884, -2.889562, 0, 0, 0, 1, 1,
-0.1823835, 2.083582, -0.0265905, 0, 0, 0, 1, 1,
-0.1815926, 0.02431367, -0.8880064, 1, 1, 1, 1, 1,
-0.1768323, 0.57916, -1.696351, 1, 1, 1, 1, 1,
-0.1712195, -1.133282, -2.574529, 1, 1, 1, 1, 1,
-0.1663877, -0.5577218, -5.673363, 1, 1, 1, 1, 1,
-0.1630728, 0.2260466, -0.2922835, 1, 1, 1, 1, 1,
-0.158106, -1.36827, -2.299125, 1, 1, 1, 1, 1,
-0.1571323, -0.2015927, -3.254436, 1, 1, 1, 1, 1,
-0.1564424, -0.8882871, -2.385502, 1, 1, 1, 1, 1,
-0.1559404, -1.331515, -4.137586, 1, 1, 1, 1, 1,
-0.1522608, 0.02933786, -1.779607, 1, 1, 1, 1, 1,
-0.1503458, 1.762548, -0.7363161, 1, 1, 1, 1, 1,
-0.1500809, 0.1115862, 0.4547527, 1, 1, 1, 1, 1,
-0.1496639, -1.020537, -4.143033, 1, 1, 1, 1, 1,
-0.1475478, 1.154224, 0.6252925, 1, 1, 1, 1, 1,
-0.1452756, 0.4817668, 0.2146969, 1, 1, 1, 1, 1,
-0.1413206, -0.2597719, -1.366952, 0, 0, 1, 1, 1,
-0.1374199, -0.9230868, -3.213549, 1, 0, 0, 1, 1,
-0.1354562, -0.9265537, -3.641494, 1, 0, 0, 1, 1,
-0.1338241, -0.09701689, -4.027255, 1, 0, 0, 1, 1,
-0.1332465, -0.5296404, -3.327769, 1, 0, 0, 1, 1,
-0.1316727, -1.131005, -5.474895, 1, 0, 0, 1, 1,
-0.1212698, -0.7846412, -3.475029, 0, 0, 0, 1, 1,
-0.1165772, -0.698103, -3.768165, 0, 0, 0, 1, 1,
-0.1163576, -0.6709256, -2.344329, 0, 0, 0, 1, 1,
-0.1123664, 0.5793156, -1.666834, 0, 0, 0, 1, 1,
-0.1109611, 1.037106, -0.3659675, 0, 0, 0, 1, 1,
-0.1081956, 1.8389, 0.7072552, 0, 0, 0, 1, 1,
-0.1066622, 1.024231, -0.2092487, 0, 0, 0, 1, 1,
-0.1042026, -1.052186, -2.100734, 1, 1, 1, 1, 1,
-0.1031807, 0.185756, -0.1643592, 1, 1, 1, 1, 1,
-0.102994, 0.9013086, 0.4398022, 1, 1, 1, 1, 1,
-0.1013763, -0.68484, -5.580884, 1, 1, 1, 1, 1,
-0.09953772, -1.6468, -1.640075, 1, 1, 1, 1, 1,
-0.09857552, 0.006314676, -2.30151, 1, 1, 1, 1, 1,
-0.09811877, -1.066389, -1.473046, 1, 1, 1, 1, 1,
-0.09396674, 1.126906, -0.3468131, 1, 1, 1, 1, 1,
-0.0930535, -0.6855965, -3.109009, 1, 1, 1, 1, 1,
-0.08925121, 1.883882, 1.811403, 1, 1, 1, 1, 1,
-0.08759698, -1.455303, -2.219342, 1, 1, 1, 1, 1,
-0.08602374, 0.5001459, -1.042691, 1, 1, 1, 1, 1,
-0.08344901, -1.327453, -5.124117, 1, 1, 1, 1, 1,
-0.08028708, -1.282512, -3.297401, 1, 1, 1, 1, 1,
-0.07675244, 0.1497275, 1.159484, 1, 1, 1, 1, 1,
-0.07674254, 1.368146, -1.577404, 0, 0, 1, 1, 1,
-0.07389429, -0.1429857, -1.12561, 1, 0, 0, 1, 1,
-0.07132386, 0.9333079, -0.3442167, 1, 0, 0, 1, 1,
-0.06920554, 0.2875814, 1.717529, 1, 0, 0, 1, 1,
-0.06260616, -0.1705643, -1.678308, 1, 0, 0, 1, 1,
-0.05894845, 0.9807131, -0.2930941, 1, 0, 0, 1, 1,
-0.05689561, -1.640087, -2.67221, 0, 0, 0, 1, 1,
-0.05677296, 0.5445911, -2.27379, 0, 0, 0, 1, 1,
-0.05224181, 0.7528945, 1.120902, 0, 0, 0, 1, 1,
-0.05145291, 0.3782686, 0.2612883, 0, 0, 0, 1, 1,
-0.0478255, -0.9574906, -3.746711, 0, 0, 0, 1, 1,
-0.03659302, 0.1681, 0.8890401, 0, 0, 0, 1, 1,
-0.03623031, -1.169948, -2.753362, 0, 0, 0, 1, 1,
-0.03598744, -0.9991405, -2.961396, 1, 1, 1, 1, 1,
-0.02085342, -0.2224855, -3.797676, 1, 1, 1, 1, 1,
-0.01933434, -1.028733, -3.193015, 1, 1, 1, 1, 1,
-0.01005706, -1.051227, -4.056115, 1, 1, 1, 1, 1,
-0.007198367, 0.562523, 1.295701, 1, 1, 1, 1, 1,
-0.005854131, -1.040211, -3.631714, 1, 1, 1, 1, 1,
-0.004893603, -1.674922, -3.604277, 1, 1, 1, 1, 1,
-0.0007770481, -2.704571, -4.17827, 1, 1, 1, 1, 1,
0.001522186, 0.4515841, 1.018822, 1, 1, 1, 1, 1,
0.00177597, 2.739541, 0.6272382, 1, 1, 1, 1, 1,
0.002499267, -0.6674457, 2.484076, 1, 1, 1, 1, 1,
0.002866889, -1.035745, 3.256368, 1, 1, 1, 1, 1,
0.006367035, -0.6812623, 2.010477, 1, 1, 1, 1, 1,
0.008091472, 0.4687113, -2.375942, 1, 1, 1, 1, 1,
0.008455527, 0.3213532, -2.089867, 1, 1, 1, 1, 1,
0.008995246, -0.8899972, 3.90881, 0, 0, 1, 1, 1,
0.01036044, 0.2632909, -0.2622189, 1, 0, 0, 1, 1,
0.01043838, 1.271129, 0.3477286, 1, 0, 0, 1, 1,
0.01126587, 0.2716449, -1.463239, 1, 0, 0, 1, 1,
0.01265253, 0.491095, 1.752086, 1, 0, 0, 1, 1,
0.01424618, -2.04119, 2.800261, 1, 0, 0, 1, 1,
0.01531501, -2.147171, 4.198843, 0, 0, 0, 1, 1,
0.0183607, 1.408584, 0.7802413, 0, 0, 0, 1, 1,
0.02366555, -0.6923792, 2.686359, 0, 0, 0, 1, 1,
0.02521025, 0.1830506, 0.8694959, 0, 0, 0, 1, 1,
0.02596515, -0.2306745, 2.380881, 0, 0, 0, 1, 1,
0.0346176, -0.3543561, 3.315919, 0, 0, 0, 1, 1,
0.03639189, 0.7194723, 0.04475328, 0, 0, 0, 1, 1,
0.03966069, 0.1988349, -0.1987733, 1, 1, 1, 1, 1,
0.04207777, 0.8030777, 1.359419, 1, 1, 1, 1, 1,
0.04234225, -0.4248038, 3.3905, 1, 1, 1, 1, 1,
0.04280753, -0.1060013, 1.590974, 1, 1, 1, 1, 1,
0.04653421, 0.5767164, 0.5694523, 1, 1, 1, 1, 1,
0.05166719, -0.1465065, 2.324906, 1, 1, 1, 1, 1,
0.05481012, -0.7578264, 4.385066, 1, 1, 1, 1, 1,
0.05774563, 0.1717901, 0.6957059, 1, 1, 1, 1, 1,
0.05921397, 0.7535173, 0.5577, 1, 1, 1, 1, 1,
0.06170977, 0.97549, -2.385046, 1, 1, 1, 1, 1,
0.06444176, -0.7405242, 2.794146, 1, 1, 1, 1, 1,
0.06638764, 0.6490169, 1.311347, 1, 1, 1, 1, 1,
0.06675915, 0.4795462, -0.8875982, 1, 1, 1, 1, 1,
0.0694339, -1.174307, 3.002114, 1, 1, 1, 1, 1,
0.07052211, 0.03492217, 1.836179, 1, 1, 1, 1, 1,
0.0749226, 1.514008, -0.4786414, 0, 0, 1, 1, 1,
0.07827746, 0.1775625, 2.186343, 1, 0, 0, 1, 1,
0.08072302, -0.8961451, 2.547175, 1, 0, 0, 1, 1,
0.08310655, 0.4594922, 0.9651396, 1, 0, 0, 1, 1,
0.08586901, -0.6270394, 1.824217, 1, 0, 0, 1, 1,
0.08702016, 0.4400153, -0.2334696, 1, 0, 0, 1, 1,
0.08884408, -1.54735, 1.229081, 0, 0, 0, 1, 1,
0.09585053, 0.9144495, 1.688544, 0, 0, 0, 1, 1,
0.09770274, -0.1084853, 0.7027133, 0, 0, 0, 1, 1,
0.09797271, -0.6107326, 2.447806, 0, 0, 0, 1, 1,
0.1003673, 1.229266, 0.2600174, 0, 0, 0, 1, 1,
0.1015904, -1.106594, 3.799574, 0, 0, 0, 1, 1,
0.1042611, -0.06207322, 0.003647752, 0, 0, 0, 1, 1,
0.1046466, 2.129316, 0.8301179, 1, 1, 1, 1, 1,
0.1060932, -0.4381248, 1.660091, 1, 1, 1, 1, 1,
0.1071549, 0.5552047, -0.8158023, 1, 1, 1, 1, 1,
0.1114537, -0.3689961, 3.187028, 1, 1, 1, 1, 1,
0.1129096, 0.3192748, 1.639549, 1, 1, 1, 1, 1,
0.1129494, -0.422382, 1.715254, 1, 1, 1, 1, 1,
0.1151972, 0.7120637, 1.265199, 1, 1, 1, 1, 1,
0.1154246, -0.7607167, 1.065252, 1, 1, 1, 1, 1,
0.1167044, -1.891629, 3.693639, 1, 1, 1, 1, 1,
0.1169496, -0.9430869, 2.684498, 1, 1, 1, 1, 1,
0.1190063, -0.9346315, 4.131114, 1, 1, 1, 1, 1,
0.1190481, 0.7808838, -0.4186446, 1, 1, 1, 1, 1,
0.1192169, 1.527491, 1.291787, 1, 1, 1, 1, 1,
0.126134, 0.9884047, -1.964082, 1, 1, 1, 1, 1,
0.126666, 0.1430908, 0.4359763, 1, 1, 1, 1, 1,
0.1281884, -0.7819096, 3.517538, 0, 0, 1, 1, 1,
0.1288064, -1.544547, 1.127931, 1, 0, 0, 1, 1,
0.1298326, -0.3995057, 2.864259, 1, 0, 0, 1, 1,
0.1315241, 0.1134469, 0.8985342, 1, 0, 0, 1, 1,
0.1365025, 1.370737, 0.5770566, 1, 0, 0, 1, 1,
0.1387268, 0.8861623, 1.056041, 1, 0, 0, 1, 1,
0.1424506, 0.06282797, 1.481, 0, 0, 0, 1, 1,
0.143392, -0.343939, 3.13163, 0, 0, 0, 1, 1,
0.1493799, -0.2525624, 1.633152, 0, 0, 0, 1, 1,
0.1499792, -1.881702, 3.196071, 0, 0, 0, 1, 1,
0.1541022, -1.887401, 3.243931, 0, 0, 0, 1, 1,
0.1545502, -2.360611, 2.043707, 0, 0, 0, 1, 1,
0.1573324, -1.038175, 1.913947, 0, 0, 0, 1, 1,
0.1589185, 0.4828923, -1.16735, 1, 1, 1, 1, 1,
0.1666937, -0.2243281, 2.732412, 1, 1, 1, 1, 1,
0.1672236, 0.9651913, 0.1847781, 1, 1, 1, 1, 1,
0.1709822, 0.794987, -2.527463, 1, 1, 1, 1, 1,
0.1735702, 0.003336548, 0.8637372, 1, 1, 1, 1, 1,
0.1742465, 1.252567, -0.813836, 1, 1, 1, 1, 1,
0.1789369, 0.2195581, 0.7396799, 1, 1, 1, 1, 1,
0.1851235, -0.7205215, 1.072248, 1, 1, 1, 1, 1,
0.1855162, 0.6721413, -0.3503121, 1, 1, 1, 1, 1,
0.189315, -1.400192, 3.396579, 1, 1, 1, 1, 1,
0.1904446, 0.06305376, 3.120112, 1, 1, 1, 1, 1,
0.1915236, 0.0170554, 2.138582, 1, 1, 1, 1, 1,
0.1948591, -0.5912117, 1.413484, 1, 1, 1, 1, 1,
0.1962066, -0.5029806, 2.251361, 1, 1, 1, 1, 1,
0.1969145, 0.1224029, 0.02327132, 1, 1, 1, 1, 1,
0.1969455, -1.385072, 3.889904, 0, 0, 1, 1, 1,
0.1972793, -2.06188, 3.118716, 1, 0, 0, 1, 1,
0.1972855, 0.03147631, 2.046986, 1, 0, 0, 1, 1,
0.1993982, 0.518589, 0.7404696, 1, 0, 0, 1, 1,
0.2014491, -0.5238034, 1.957987, 1, 0, 0, 1, 1,
0.201602, -1.648919, 2.825496, 1, 0, 0, 1, 1,
0.202301, 1.45513, -0.8832113, 0, 0, 0, 1, 1,
0.2023694, 0.5915997, 0.4450567, 0, 0, 0, 1, 1,
0.2089776, 0.5770817, -0.485619, 0, 0, 0, 1, 1,
0.2119021, -0.4039702, 2.561135, 0, 0, 0, 1, 1,
0.2125416, 1.446937, 0.3329026, 0, 0, 0, 1, 1,
0.2130071, 0.1737628, 0.8512444, 0, 0, 0, 1, 1,
0.2142616, -0.3318613, 3.329632, 0, 0, 0, 1, 1,
0.2175728, -0.3317533, 1.689355, 1, 1, 1, 1, 1,
0.2249649, 0.5859639, -0.4368297, 1, 1, 1, 1, 1,
0.228524, -1.014556, 1.140465, 1, 1, 1, 1, 1,
0.2285345, -0.4018845, 3.56858, 1, 1, 1, 1, 1,
0.2307569, -1.984492, 3.270418, 1, 1, 1, 1, 1,
0.2312299, -0.1603757, 0.1332114, 1, 1, 1, 1, 1,
0.232555, 1.078613, -0.3586271, 1, 1, 1, 1, 1,
0.2325829, -2.215799, 2.631136, 1, 1, 1, 1, 1,
0.2341014, -0.7673481, 3.622366, 1, 1, 1, 1, 1,
0.2357585, 0.4055398, 1.387089, 1, 1, 1, 1, 1,
0.2391059, 0.5383676, 0.3711932, 1, 1, 1, 1, 1,
0.2392278, 2.398177, 1.350534, 1, 1, 1, 1, 1,
0.242025, 2.229679, 0.3361768, 1, 1, 1, 1, 1,
0.2435666, -0.5205629, 2.505734, 1, 1, 1, 1, 1,
0.2468644, -1.811233, 4.156621, 1, 1, 1, 1, 1,
0.2493424, 1.242095, 1.639892, 0, 0, 1, 1, 1,
0.250963, 0.2737057, 0.2777686, 1, 0, 0, 1, 1,
0.2561574, -1.313189, 2.848219, 1, 0, 0, 1, 1,
0.2564872, 0.278683, 1.493816, 1, 0, 0, 1, 1,
0.2567123, 1.44863, -0.732621, 1, 0, 0, 1, 1,
0.2577962, -1.100785, 2.167725, 1, 0, 0, 1, 1,
0.2596473, 1.119951, 0.9538276, 0, 0, 0, 1, 1,
0.2612444, 1.094407, 1.090897, 0, 0, 0, 1, 1,
0.2651915, 0.7366226, -0.6831861, 0, 0, 0, 1, 1,
0.2669711, -1.463407, 3.616585, 0, 0, 0, 1, 1,
0.2672381, -0.4579543, 2.844649, 0, 0, 0, 1, 1,
0.2681181, 1.650871, 1.706011, 0, 0, 0, 1, 1,
0.2686555, 0.177374, 0.2797503, 0, 0, 0, 1, 1,
0.2691368, 0.312727, 0.8011463, 1, 1, 1, 1, 1,
0.2694908, 0.2765987, 1.013679, 1, 1, 1, 1, 1,
0.2749957, 0.623496, -0.8136498, 1, 1, 1, 1, 1,
0.2809713, -0.4298114, 2.430994, 1, 1, 1, 1, 1,
0.2924137, 0.2006102, -0.7409295, 1, 1, 1, 1, 1,
0.2938061, -0.5501879, 1.992425, 1, 1, 1, 1, 1,
0.2939792, 0.8227415, 0.8549259, 1, 1, 1, 1, 1,
0.2942505, 0.3920764, -0.3730029, 1, 1, 1, 1, 1,
0.2947493, -0.2984999, 3.720846, 1, 1, 1, 1, 1,
0.295123, 0.7592731, 1.697916, 1, 1, 1, 1, 1,
0.2957512, -1.429632, 2.952643, 1, 1, 1, 1, 1,
0.2958561, -0.1078248, 1.044026, 1, 1, 1, 1, 1,
0.2964345, 0.5845316, 1.073139, 1, 1, 1, 1, 1,
0.2972986, 0.2508575, 0.8037905, 1, 1, 1, 1, 1,
0.2976112, -0.06892689, 1.123568, 1, 1, 1, 1, 1,
0.3010629, 2.24887, 0.6361941, 0, 0, 1, 1, 1,
0.3085109, -0.4623989, 4.099086, 1, 0, 0, 1, 1,
0.319945, 0.8232809, -0.2424664, 1, 0, 0, 1, 1,
0.32113, 0.5628828, 0.7137804, 1, 0, 0, 1, 1,
0.3215676, -0.1759672, 2.875649, 1, 0, 0, 1, 1,
0.3381505, -1.143125, 2.513243, 1, 0, 0, 1, 1,
0.3404849, 0.2174853, 1.008854, 0, 0, 0, 1, 1,
0.343587, -0.5137509, 2.200525, 0, 0, 0, 1, 1,
0.3453356, -1.057421, 3.780318, 0, 0, 0, 1, 1,
0.3453771, -0.6831136, 3.338696, 0, 0, 0, 1, 1,
0.3475378, -0.6998153, 2.689517, 0, 0, 0, 1, 1,
0.347996, 0.4329772, 0.05000399, 0, 0, 0, 1, 1,
0.3505014, -1.618165, 2.015669, 0, 0, 0, 1, 1,
0.3599583, 0.9879531, 0.06806698, 1, 1, 1, 1, 1,
0.3636532, 0.8865578, -0.3603831, 1, 1, 1, 1, 1,
0.364423, -0.0877922, 1.872648, 1, 1, 1, 1, 1,
0.3697884, -1.29293, 2.129153, 1, 1, 1, 1, 1,
0.3715021, -1.816344, 1.945387, 1, 1, 1, 1, 1,
0.3717714, 0.06277745, 1.861553, 1, 1, 1, 1, 1,
0.3749412, 1.474394, -0.1514048, 1, 1, 1, 1, 1,
0.3872798, -0.2568813, 2.687257, 1, 1, 1, 1, 1,
0.3877892, -0.3453429, 2.979424, 1, 1, 1, 1, 1,
0.3953844, 0.4883155, 2.074106, 1, 1, 1, 1, 1,
0.3985135, -2.37309, 2.632023, 1, 1, 1, 1, 1,
0.3992712, -0.0303256, 0.03397171, 1, 1, 1, 1, 1,
0.3995804, 0.7192034, -0.6774307, 1, 1, 1, 1, 1,
0.4025218, -0.7788818, 2.075167, 1, 1, 1, 1, 1,
0.4084388, 1.048757, 0.8153329, 1, 1, 1, 1, 1,
0.41073, 0.6019899, 0.5061709, 0, 0, 1, 1, 1,
0.417606, -1.859024, 1.81831, 1, 0, 0, 1, 1,
0.4193329, -0.183227, 3.578097, 1, 0, 0, 1, 1,
0.4237161, 0.5181223, 0.4323447, 1, 0, 0, 1, 1,
0.4238006, -0.4614165, 1.07121, 1, 0, 0, 1, 1,
0.4250514, -0.5605147, 2.94086, 1, 0, 0, 1, 1,
0.4268829, 0.0735931, 4.105009, 0, 0, 0, 1, 1,
0.4286535, -0.7457624, 3.352638, 0, 0, 0, 1, 1,
0.4306598, -0.2200274, 4.039021, 0, 0, 0, 1, 1,
0.4337001, 0.311008, 1.059534, 0, 0, 0, 1, 1,
0.4364559, 0.1990115, 0.9776513, 0, 0, 0, 1, 1,
0.4391624, -0.2548204, 1.241797, 0, 0, 0, 1, 1,
0.4409444, -0.1821878, 0.8409386, 0, 0, 0, 1, 1,
0.4410335, -0.852232, 0.8517872, 1, 1, 1, 1, 1,
0.44157, 1.659681, -1.528728, 1, 1, 1, 1, 1,
0.4416951, 1.139683, -0.9623663, 1, 1, 1, 1, 1,
0.4445699, 0.1947782, 1.544612, 1, 1, 1, 1, 1,
0.4491151, -0.9561244, 5.619737, 1, 1, 1, 1, 1,
0.4491209, -0.5377092, 3.614569, 1, 1, 1, 1, 1,
0.4498855, -0.9497948, 3.197135, 1, 1, 1, 1, 1,
0.4506206, 0.7304899, 1.952422, 1, 1, 1, 1, 1,
0.4519385, -0.3476917, 2.405966, 1, 1, 1, 1, 1,
0.4566875, -0.4476642, 1.778712, 1, 1, 1, 1, 1,
0.4568855, -0.9804136, 2.752661, 1, 1, 1, 1, 1,
0.4584585, 0.9931257, -0.00265286, 1, 1, 1, 1, 1,
0.4640226, 0.5823756, 0.68773, 1, 1, 1, 1, 1,
0.4646738, 1.029145, -0.3301194, 1, 1, 1, 1, 1,
0.4668564, 0.5518464, 0.8338788, 1, 1, 1, 1, 1,
0.4670428, -0.5730458, 1.571743, 0, 0, 1, 1, 1,
0.472114, 0.09910215, 2.194478, 1, 0, 0, 1, 1,
0.4727701, -0.6254507, 1.666936, 1, 0, 0, 1, 1,
0.4736694, 1.029849, -0.7163103, 1, 0, 0, 1, 1,
0.4812052, -1.394528, 2.765882, 1, 0, 0, 1, 1,
0.482244, -0.8380244, 2.434435, 1, 0, 0, 1, 1,
0.485656, 0.7049296, 1.809538, 0, 0, 0, 1, 1,
0.4872883, 0.7869967, 1.010326, 0, 0, 0, 1, 1,
0.4888507, -0.8933612, 2.440284, 0, 0, 0, 1, 1,
0.4903007, 0.2760474, -0.4246781, 0, 0, 0, 1, 1,
0.4972923, 0.1277101, 1.039761, 0, 0, 0, 1, 1,
0.4998801, 0.03137335, 0.7896414, 0, 0, 0, 1, 1,
0.5069429, 1.177846, 0.1678025, 0, 0, 0, 1, 1,
0.5128294, 0.01210869, 1.036307, 1, 1, 1, 1, 1,
0.5141031, 0.4850518, 1.440708, 1, 1, 1, 1, 1,
0.5184805, -1.75717, 1.1263, 1, 1, 1, 1, 1,
0.5231206, 0.5957872, 0.5724826, 1, 1, 1, 1, 1,
0.5255681, 0.2065801, -0.07445278, 1, 1, 1, 1, 1,
0.5289961, -0.2990247, 1.603616, 1, 1, 1, 1, 1,
0.5303494, -1.758549, 3.62324, 1, 1, 1, 1, 1,
0.5321558, -0.8517709, 3.201979, 1, 1, 1, 1, 1,
0.5367005, 0.5388867, 0.05694037, 1, 1, 1, 1, 1,
0.5391425, -0.7048502, 2.042266, 1, 1, 1, 1, 1,
0.5425971, 0.09156429, 1.990319, 1, 1, 1, 1, 1,
0.5450854, -0.06732304, 2.140433, 1, 1, 1, 1, 1,
0.5461292, -0.4567831, 4.069167, 1, 1, 1, 1, 1,
0.5487418, 1.624988, 0.5263172, 1, 1, 1, 1, 1,
0.5515173, -0.0005068434, 2.935076, 1, 1, 1, 1, 1,
0.554381, 0.01293786, -1.135201, 0, 0, 1, 1, 1,
0.555158, -0.4438982, 2.039584, 1, 0, 0, 1, 1,
0.556367, 0.1638004, 0.5843182, 1, 0, 0, 1, 1,
0.5590187, -0.4666765, 3.36085, 1, 0, 0, 1, 1,
0.5594061, -0.6016547, 2.949362, 1, 0, 0, 1, 1,
0.56814, 0.4367546, 0.3567043, 1, 0, 0, 1, 1,
0.5686797, 0.2319029, 1.406522, 0, 0, 0, 1, 1,
0.5711709, -1.136333, 2.106608, 0, 0, 0, 1, 1,
0.5716199, 0.04426526, 1.213555, 0, 0, 0, 1, 1,
0.5823004, 0.4399665, 1.532551, 0, 0, 0, 1, 1,
0.5840274, -0.993117, 1.573957, 0, 0, 0, 1, 1,
0.5841737, 1.451046, 0.08193282, 0, 0, 0, 1, 1,
0.5856763, -0.3413396, 1.862435, 0, 0, 0, 1, 1,
0.58571, 0.2215291, 2.944862, 1, 1, 1, 1, 1,
0.5878752, 0.1123349, 2.196556, 1, 1, 1, 1, 1,
0.5884122, -0.6793848, 3.750257, 1, 1, 1, 1, 1,
0.5893545, -0.1064505, 2.63605, 1, 1, 1, 1, 1,
0.590387, -1.155627, 2.843397, 1, 1, 1, 1, 1,
0.5916976, -0.4824512, 1.5445, 1, 1, 1, 1, 1,
0.5965304, -0.8601938, 3.068594, 1, 1, 1, 1, 1,
0.606036, 1.555022, 1.833241, 1, 1, 1, 1, 1,
0.6092682, -0.195733, 1.625653, 1, 1, 1, 1, 1,
0.6188591, -1.736731, 4.197006, 1, 1, 1, 1, 1,
0.6218257, 0.6515686, 1.106767, 1, 1, 1, 1, 1,
0.6270857, 1.619653, 0.7177482, 1, 1, 1, 1, 1,
0.6292527, 1.542934, 1.352798, 1, 1, 1, 1, 1,
0.632012, 1.186259, 0.283116, 1, 1, 1, 1, 1,
0.6454049, -1.991368, 2.950288, 1, 1, 1, 1, 1,
0.6473739, -0.2861245, 1.514597, 0, 0, 1, 1, 1,
0.6497452, 2.494236, 0.1061704, 1, 0, 0, 1, 1,
0.6500442, 0.911339, 1.755439, 1, 0, 0, 1, 1,
0.6515875, -0.2957321, 2.612397, 1, 0, 0, 1, 1,
0.6529914, -0.9762923, 1.850944, 1, 0, 0, 1, 1,
0.6550022, 0.1659356, 0.690625, 1, 0, 0, 1, 1,
0.6550692, -0.3229118, 0.5565298, 0, 0, 0, 1, 1,
0.6591116, 0.709672, -1.110457, 0, 0, 0, 1, 1,
0.659739, -1.026814, 2.620927, 0, 0, 0, 1, 1,
0.6631747, 0.730068, 0.5758291, 0, 0, 0, 1, 1,
0.6707777, -0.5399991, 4.09485, 0, 0, 0, 1, 1,
0.6771111, 0.1598599, 1.518668, 0, 0, 0, 1, 1,
0.6771598, -0.7935137, 3.045829, 0, 0, 0, 1, 1,
0.6773356, -1.08543, 3.46885, 1, 1, 1, 1, 1,
0.6844716, -0.5024481, 3.085732, 1, 1, 1, 1, 1,
0.6848378, 0.1612377, 1.074984, 1, 1, 1, 1, 1,
0.6860641, 0.4156929, 2.136885, 1, 1, 1, 1, 1,
0.6892377, 0.3919394, 1.272369, 1, 1, 1, 1, 1,
0.6893308, 1.549181, 2.013422, 1, 1, 1, 1, 1,
0.6897102, -0.4160591, 1.655297, 1, 1, 1, 1, 1,
0.6918665, -1.522544, 1.64491, 1, 1, 1, 1, 1,
0.692414, 1.111886, -0.7902054, 1, 1, 1, 1, 1,
0.6933351, 0.6460747, -1.03734, 1, 1, 1, 1, 1,
0.7114395, -0.721929, 1.49791, 1, 1, 1, 1, 1,
0.7116309, -0.3923582, 2.416853, 1, 1, 1, 1, 1,
0.7117133, -0.7464685, 3.161728, 1, 1, 1, 1, 1,
0.7159118, -0.9132205, 1.574598, 1, 1, 1, 1, 1,
0.7166018, -0.2332866, 2.322208, 1, 1, 1, 1, 1,
0.7170611, 0.3749477, 1.691375, 0, 0, 1, 1, 1,
0.7176728, -0.3994536, 3.218073, 1, 0, 0, 1, 1,
0.7184831, -1.300534, 2.069893, 1, 0, 0, 1, 1,
0.7208763, -1.069655, 0.589816, 1, 0, 0, 1, 1,
0.7277932, -2.036387, 3.685324, 1, 0, 0, 1, 1,
0.7286862, -1.13153, 4.551356, 1, 0, 0, 1, 1,
0.7293226, 0.3241481, 0.4977968, 0, 0, 0, 1, 1,
0.7310115, 0.03674828, 1.106931, 0, 0, 0, 1, 1,
0.7335823, 0.3098412, 1.249448, 0, 0, 0, 1, 1,
0.7348337, -0.5452215, 1.747231, 0, 0, 0, 1, 1,
0.7387401, 0.2342594, 2.236424, 0, 0, 0, 1, 1,
0.7444025, -0.9569675, 2.338044, 0, 0, 0, 1, 1,
0.7473745, -0.05356035, 2.598747, 0, 0, 0, 1, 1,
0.7527091, -0.5483249, 2.200226, 1, 1, 1, 1, 1,
0.765607, 1.290981, -0.3309757, 1, 1, 1, 1, 1,
0.7675274, -0.199184, 1.897866, 1, 1, 1, 1, 1,
0.7691013, 0.9186008, 1.161445, 1, 1, 1, 1, 1,
0.7717476, 0.204687, 0.9427164, 1, 1, 1, 1, 1,
0.7738495, 2.267032, 0.6878654, 1, 1, 1, 1, 1,
0.7738513, -0.6961548, 1.725723, 1, 1, 1, 1, 1,
0.7750852, 1.77429, -1.246003, 1, 1, 1, 1, 1,
0.7754352, -1.264626, 3.765644, 1, 1, 1, 1, 1,
0.7774503, 1.506291, 0.1916144, 1, 1, 1, 1, 1,
0.7813581, -0.02969269, 1.870044, 1, 1, 1, 1, 1,
0.7909768, -1.628902, 1.842519, 1, 1, 1, 1, 1,
0.7923449, 2.395029, 1.134943, 1, 1, 1, 1, 1,
0.7972507, -0.828626, 3.469462, 1, 1, 1, 1, 1,
0.8008319, -1.041285, 2.623837, 1, 1, 1, 1, 1,
0.8008968, 0.6573283, -0.258365, 0, 0, 1, 1, 1,
0.8064014, -1.363916, 2.245101, 1, 0, 0, 1, 1,
0.8076006, -1.392965, 1.385066, 1, 0, 0, 1, 1,
0.8151577, 0.8599865, 1.018012, 1, 0, 0, 1, 1,
0.8168612, -0.8830943, 1.299396, 1, 0, 0, 1, 1,
0.8241736, 0.4890535, 0.9218452, 1, 0, 0, 1, 1,
0.8254975, -0.8778453, 3.657868, 0, 0, 0, 1, 1,
0.831454, 0.192447, 1.465681, 0, 0, 0, 1, 1,
0.8381273, 0.5938384, 2.221939, 0, 0, 0, 1, 1,
0.844683, 1.164789, 0.7061769, 0, 0, 0, 1, 1,
0.8457755, -0.5969501, 2.655763, 0, 0, 0, 1, 1,
0.8512322, 1.893921, -2.081218, 0, 0, 0, 1, 1,
0.8532142, 0.2467224, 0.6606473, 0, 0, 0, 1, 1,
0.8539479, 2.010214, 0.4964334, 1, 1, 1, 1, 1,
0.8565335, -1.644638, 2.521096, 1, 1, 1, 1, 1,
0.866558, -0.1650337, 2.610242, 1, 1, 1, 1, 1,
0.8813188, -0.9454772, 2.709954, 1, 1, 1, 1, 1,
0.8817294, 0.03658235, 2.418351, 1, 1, 1, 1, 1,
0.8908306, 0.1132473, 1.760399, 1, 1, 1, 1, 1,
0.8916864, 0.8932724, 2.393967, 1, 1, 1, 1, 1,
0.891982, 0.8220073, 1.371817, 1, 1, 1, 1, 1,
0.8949667, -0.1218267, 2.315531, 1, 1, 1, 1, 1,
0.901561, -0.635273, 1.384154, 1, 1, 1, 1, 1,
0.9044562, -1.492625, 2.797805, 1, 1, 1, 1, 1,
0.9048522, 1.651229, 1.845418, 1, 1, 1, 1, 1,
0.9105219, 0.4934346, 1.182026, 1, 1, 1, 1, 1,
0.9134466, -0.1962691, 1.352745, 1, 1, 1, 1, 1,
0.923215, 1.16246, -0.2333103, 1, 1, 1, 1, 1,
0.9270881, 0.642248, 0.1207865, 0, 0, 1, 1, 1,
0.9277536, -1.304359, 1.443548, 1, 0, 0, 1, 1,
0.9290757, 0.5611444, 3.139462, 1, 0, 0, 1, 1,
0.9414396, 1.282518, 0.810688, 1, 0, 0, 1, 1,
0.9465289, -0.9059307, 1.853471, 1, 0, 0, 1, 1,
0.9481556, 1.21368, 0.529235, 1, 0, 0, 1, 1,
0.9484992, -0.7903606, 2.659163, 0, 0, 0, 1, 1,
0.9490084, 0.4035607, 0.3775191, 0, 0, 0, 1, 1,
0.9505605, -0.4635122, 3.16965, 0, 0, 0, 1, 1,
0.9513388, 0.629602, -0.2818936, 0, 0, 0, 1, 1,
0.9626256, -1.03259, 3.113766, 0, 0, 0, 1, 1,
0.9683955, 0.09280596, 0.9569833, 0, 0, 0, 1, 1,
0.9708683, -1.420624, 1.121146, 0, 0, 0, 1, 1,
0.976815, 1.784387, 0.8427596, 1, 1, 1, 1, 1,
0.97723, -1.770979, 3.206852, 1, 1, 1, 1, 1,
0.9775215, 1.365261, 1.555389, 1, 1, 1, 1, 1,
0.9803705, -0.2464646, 2.435705, 1, 1, 1, 1, 1,
0.9870957, -1.898455, 2.294838, 1, 1, 1, 1, 1,
0.99472, -1.007778, 2.436835, 1, 1, 1, 1, 1,
1.003679, 0.7082304, 0.7895271, 1, 1, 1, 1, 1,
1.008391, -2.300036, 3.20052, 1, 1, 1, 1, 1,
1.016967, 2.086271, 2.065478, 1, 1, 1, 1, 1,
1.018238, -0.5383078, 0.911823, 1, 1, 1, 1, 1,
1.038043, 0.4062182, 1.390106, 1, 1, 1, 1, 1,
1.039693, -1.687475, 2.999855, 1, 1, 1, 1, 1,
1.041609, 1.432061, -0.6127971, 1, 1, 1, 1, 1,
1.043346, 1.062248, 0.826724, 1, 1, 1, 1, 1,
1.047132, -0.7263369, 3.36041, 1, 1, 1, 1, 1,
1.047324, 0.4657847, 1.699506, 0, 0, 1, 1, 1,
1.055133, 0.7674497, 0.2803595, 1, 0, 0, 1, 1,
1.058559, 1.466253, -0.7135628, 1, 0, 0, 1, 1,
1.06308, -0.5714893, 2.090944, 1, 0, 0, 1, 1,
1.06617, -0.2550774, 0.8771295, 1, 0, 0, 1, 1,
1.074358, 0.5968902, 0.8341186, 1, 0, 0, 1, 1,
1.074811, 1.1261, 1.901426, 0, 0, 0, 1, 1,
1.077836, 0.2426977, 1.755119, 0, 0, 0, 1, 1,
1.081225, -0.997359, 2.56785, 0, 0, 0, 1, 1,
1.087125, 0.3747863, 1.876932, 0, 0, 0, 1, 1,
1.088656, -0.09584467, 0.7746466, 0, 0, 0, 1, 1,
1.088874, -1.357156, 2.281925, 0, 0, 0, 1, 1,
1.090272, 0.4366339, 1.43228, 0, 0, 0, 1, 1,
1.097573, -0.2024951, 2.242003, 1, 1, 1, 1, 1,
1.102653, 0.03466566, 0.3259331, 1, 1, 1, 1, 1,
1.105699, -1.143854, 0.9205732, 1, 1, 1, 1, 1,
1.112341, 0.7007848, 1.086552, 1, 1, 1, 1, 1,
1.113804, -1.031309, 1.300461, 1, 1, 1, 1, 1,
1.114768, 0.8290397, -0.09190704, 1, 1, 1, 1, 1,
1.115423, -0.2312882, 3.448791, 1, 1, 1, 1, 1,
1.115934, -0.53005, 1.076108, 1, 1, 1, 1, 1,
1.117386, -0.446139, 1.652956, 1, 1, 1, 1, 1,
1.12264, 0.0932195, 0.213147, 1, 1, 1, 1, 1,
1.123249, 1.571082, 1.62745, 1, 1, 1, 1, 1,
1.130684, 0.9050977, 1.060539, 1, 1, 1, 1, 1,
1.131568, 0.9306871, 0.2666492, 1, 1, 1, 1, 1,
1.137267, 0.9466392, 2.10651, 1, 1, 1, 1, 1,
1.138129, -0.7874565, 1.944432, 1, 1, 1, 1, 1,
1.14103, -0.2680393, 0.956464, 0, 0, 1, 1, 1,
1.143072, -0.2106321, 0.7303116, 1, 0, 0, 1, 1,
1.147373, -0.4556577, 0.9216874, 1, 0, 0, 1, 1,
1.1599, -0.6047925, 2.457781, 1, 0, 0, 1, 1,
1.16198, 0.1749227, 1.530469, 1, 0, 0, 1, 1,
1.164369, -0.5978073, 1.513081, 1, 0, 0, 1, 1,
1.169698, 0.4966908, 2.447994, 0, 0, 0, 1, 1,
1.173286, -0.05030977, 0.4025876, 0, 0, 0, 1, 1,
1.174546, 0.8983564, -0.2222242, 0, 0, 0, 1, 1,
1.186151, -0.1367984, 1.171704, 0, 0, 0, 1, 1,
1.195578, -0.03616229, 1.713353, 0, 0, 0, 1, 1,
1.206149, 0.3412268, 0.6584221, 0, 0, 0, 1, 1,
1.210706, -0.08147531, 2.657479, 0, 0, 0, 1, 1,
1.243061, -0.01046484, 0.6332291, 1, 1, 1, 1, 1,
1.243174, -1.520146, 0.89939, 1, 1, 1, 1, 1,
1.251276, -0.2831973, 0.4457285, 1, 1, 1, 1, 1,
1.253192, -2.139958, 1.937755, 1, 1, 1, 1, 1,
1.25339, 1.920538, 0.7793488, 1, 1, 1, 1, 1,
1.260374, -0.7167863, 2.104865, 1, 1, 1, 1, 1,
1.265303, 0.702921, 2.03846, 1, 1, 1, 1, 1,
1.284635, 0.07884743, 1.277633, 1, 1, 1, 1, 1,
1.295863, 0.2802362, 2.804676, 1, 1, 1, 1, 1,
1.305094, 0.9867957, 2.168422, 1, 1, 1, 1, 1,
1.306584, -0.1468832, 1.069612, 1, 1, 1, 1, 1,
1.307741, -0.833263, 2.052528, 1, 1, 1, 1, 1,
1.308302, -0.2268281, -0.1364131, 1, 1, 1, 1, 1,
1.318708, -1.128525, 1.251157, 1, 1, 1, 1, 1,
1.320736, -1.587365, 3.964631, 1, 1, 1, 1, 1,
1.327326, 0.7026349, 2.057243, 0, 0, 1, 1, 1,
1.328185, -0.2314282, 2.222304, 1, 0, 0, 1, 1,
1.328819, -0.5264643, 2.079924, 1, 0, 0, 1, 1,
1.342557, 1.471829, -0.07624857, 1, 0, 0, 1, 1,
1.346413, 0.3623452, 2.104122, 1, 0, 0, 1, 1,
1.346553, -0.09172541, -0.3367957, 1, 0, 0, 1, 1,
1.350657, -0.5117939, 0.3688886, 0, 0, 0, 1, 1,
1.368854, -0.9134505, 2.88839, 0, 0, 0, 1, 1,
1.375123, -0.5263246, -0.02973427, 0, 0, 0, 1, 1,
1.377753, 0.2446241, 1.854, 0, 0, 0, 1, 1,
1.387477, -0.1565505, 2.831889, 0, 0, 0, 1, 1,
1.388996, -0.07462995, 1.027605, 0, 0, 0, 1, 1,
1.39382, -1.132015, 4.120152, 0, 0, 0, 1, 1,
1.395681, -0.9234442, 0.7957215, 1, 1, 1, 1, 1,
1.399399, 0.3347045, 0.6745374, 1, 1, 1, 1, 1,
1.408704, -1.187486, 3.580414, 1, 1, 1, 1, 1,
1.413951, -1.096346, 3.004495, 1, 1, 1, 1, 1,
1.417219, 0.5730879, 1.182523, 1, 1, 1, 1, 1,
1.422991, 0.4874853, -0.2090032, 1, 1, 1, 1, 1,
1.43279, 1.478927, -0.5328525, 1, 1, 1, 1, 1,
1.437286, -0.1147353, 0.6452702, 1, 1, 1, 1, 1,
1.442287, -1.31573, 0.9697224, 1, 1, 1, 1, 1,
1.445093, -0.8641438, 2.709185, 1, 1, 1, 1, 1,
1.450285, 0.8248407, 0.8104654, 1, 1, 1, 1, 1,
1.455799, -0.8168533, 1.784208, 1, 1, 1, 1, 1,
1.460023, 0.5807021, 1.037914, 1, 1, 1, 1, 1,
1.466221, -0.5681922, 1.443832, 1, 1, 1, 1, 1,
1.46651, 1.510057, -0.1250006, 1, 1, 1, 1, 1,
1.491821, 0.5440096, 2.420058, 0, 0, 1, 1, 1,
1.50662, -0.07488947, 1.875838, 1, 0, 0, 1, 1,
1.540091, 0.08359451, -0.3217151, 1, 0, 0, 1, 1,
1.54262, 1.23401, 0.1343939, 1, 0, 0, 1, 1,
1.544391, -0.3728828, 2.494081, 1, 0, 0, 1, 1,
1.547136, 1.523938, 1.149458, 1, 0, 0, 1, 1,
1.549899, -0.1510725, 2.217725, 0, 0, 0, 1, 1,
1.560073, 0.05380024, 1.252829, 0, 0, 0, 1, 1,
1.562094, -0.9441436, 3.601126, 0, 0, 0, 1, 1,
1.562818, 1.901989, 0.7725688, 0, 0, 0, 1, 1,
1.577678, 0.7777751, 0.005908533, 0, 0, 0, 1, 1,
1.586836, 2.436995, 0.7454095, 0, 0, 0, 1, 1,
1.588139, -0.08863573, 0.9929652, 0, 0, 0, 1, 1,
1.606896, -0.4337357, 1.316268, 1, 1, 1, 1, 1,
1.617155, 0.4670627, 1.845586, 1, 1, 1, 1, 1,
1.620078, 2.116092, 0.3379806, 1, 1, 1, 1, 1,
1.62336, -1.331421, 2.037263, 1, 1, 1, 1, 1,
1.645738, 1.601709, 1.651669, 1, 1, 1, 1, 1,
1.647231, 0.8192798, 1.579239, 1, 1, 1, 1, 1,
1.654849, 1.682845, 0.9331533, 1, 1, 1, 1, 1,
1.661721, -1.059924, 1.891068, 1, 1, 1, 1, 1,
1.682124, 2.006965, 0.7204257, 1, 1, 1, 1, 1,
1.701629, -0.5521764, 1.753325, 1, 1, 1, 1, 1,
1.70227, 0.0589355, 1.293405, 1, 1, 1, 1, 1,
1.714751, 0.3707723, 0.4455454, 1, 1, 1, 1, 1,
1.717184, -1.501064, 3.228596, 1, 1, 1, 1, 1,
1.722209, -0.4110121, 1.242608, 1, 1, 1, 1, 1,
1.723445, -0.7302693, 2.124966, 1, 1, 1, 1, 1,
1.728074, -0.3025485, 2.078043, 0, 0, 1, 1, 1,
1.7323, -0.6708021, 1.287062, 1, 0, 0, 1, 1,
1.772668, 0.4429111, 0.8120754, 1, 0, 0, 1, 1,
1.781824, -0.2004111, 0.8406531, 1, 0, 0, 1, 1,
1.781916, -1.125484, 1.498536, 1, 0, 0, 1, 1,
1.79318, -2.711103, 2.48001, 1, 0, 0, 1, 1,
1.811445, 1.043282, -0.2272154, 0, 0, 0, 1, 1,
1.825927, 0.1827518, -0.6308088, 0, 0, 0, 1, 1,
1.826809, -0.6547921, 1.908585, 0, 0, 0, 1, 1,
1.832313, 1.541203, 0.8849041, 0, 0, 0, 1, 1,
1.83916, 0.7501416, -0.8164269, 0, 0, 0, 1, 1,
1.878221, -0.03264406, 1.77931, 0, 0, 0, 1, 1,
1.898245, 1.304596, 0.9268991, 0, 0, 0, 1, 1,
1.898257, -0.4754844, 2.754226, 1, 1, 1, 1, 1,
1.901168, -0.05186956, 2.212123, 1, 1, 1, 1, 1,
1.901299, -0.2610019, 2.558137, 1, 1, 1, 1, 1,
1.93072, 0.3715844, 1.726121, 1, 1, 1, 1, 1,
1.940528, -1.074123, 2.627027, 1, 1, 1, 1, 1,
1.950278, 1.460327, 0.2875156, 1, 1, 1, 1, 1,
1.993011, 0.9743347, 1.224403, 1, 1, 1, 1, 1,
2.009616, -1.406557, 2.389692, 1, 1, 1, 1, 1,
2.009802, 0.4533981, 1.69931, 1, 1, 1, 1, 1,
2.01514, -0.5013618, 2.553761, 1, 1, 1, 1, 1,
2.03587, -0.2057929, -0.1167214, 1, 1, 1, 1, 1,
2.039755, -0.5180188, 0.788976, 1, 1, 1, 1, 1,
2.085943, -0.9425282, 3.420507, 1, 1, 1, 1, 1,
2.11769, 0.6312372, 3.294671, 1, 1, 1, 1, 1,
2.119567, 0.02758945, 2.653074, 1, 1, 1, 1, 1,
2.137081, -0.0587388, -0.04874079, 0, 0, 1, 1, 1,
2.145534, 0.5198134, -0.4218881, 1, 0, 0, 1, 1,
2.146619, 0.1795121, 1.802317, 1, 0, 0, 1, 1,
2.197202, -0.3712569, -0.4925231, 1, 0, 0, 1, 1,
2.207072, 0.1946349, 2.978462, 1, 0, 0, 1, 1,
2.216547, -1.255141, 3.729745, 1, 0, 0, 1, 1,
2.270898, 1.035705, 1.392121, 0, 0, 0, 1, 1,
2.279171, -0.3985376, 1.371249, 0, 0, 0, 1, 1,
2.29635, 0.3475721, 1.99708, 0, 0, 0, 1, 1,
2.302956, 0.02845363, 0.5295604, 0, 0, 0, 1, 1,
2.321663, -2.067171, 2.522564, 0, 0, 0, 1, 1,
2.32692, 1.01564, 2.579531, 0, 0, 0, 1, 1,
2.357801, 0.2567029, 2.356107, 0, 0, 0, 1, 1,
2.424597, 0.3107445, 0.8043029, 1, 1, 1, 1, 1,
2.4391, -0.4416119, 1.563767, 1, 1, 1, 1, 1,
2.455487, -0.634302, 2.281409, 1, 1, 1, 1, 1,
2.537022, -0.3290944, 2.038216, 1, 1, 1, 1, 1,
2.572889, 1.667619, -0.2330942, 1, 1, 1, 1, 1,
2.994744, 0.09613288, 1.996338, 1, 1, 1, 1, 1,
3.146845, -0.07709407, 1.429939, 1, 1, 1, 1, 1
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
var radius = 10.02356;
var distance = 35.20734;
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
mvMatrix.translate( 0.5283544, 0.01837325, 0.02681279 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.20734);
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
