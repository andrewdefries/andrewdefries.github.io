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
-3.083026, -1.399182, -1.165954, 1, 0, 0, 1,
-2.904122, 0.2025382, -1.24853, 1, 0.007843138, 0, 1,
-2.886469, -1.926084, -1.39681, 1, 0.01176471, 0, 1,
-2.786429, -0.843095, -1.143436, 1, 0.01960784, 0, 1,
-2.714162, 1.233217, -0.9334931, 1, 0.02352941, 0, 1,
-2.620337, -0.842898, -2.445787, 1, 0.03137255, 0, 1,
-2.51581, -1.220354, -2.685047, 1, 0.03529412, 0, 1,
-2.436122, 0.2903852, -1.20523, 1, 0.04313726, 0, 1,
-2.295649, -0.4235948, -3.203792, 1, 0.04705882, 0, 1,
-2.292346, 0.6166276, -0.6172048, 1, 0.05490196, 0, 1,
-2.266722, -0.8878737, -1.011215, 1, 0.05882353, 0, 1,
-2.209803, 0.5520214, -1.770325, 1, 0.06666667, 0, 1,
-2.198015, -1.038828, -2.514657, 1, 0.07058824, 0, 1,
-2.193496, -0.9356037, -4.381601, 1, 0.07843138, 0, 1,
-2.079233, -1.659606, -4.631307, 1, 0.08235294, 0, 1,
-2.033063, 1.224946, -0.5303628, 1, 0.09019608, 0, 1,
-2.032695, -0.6804988, -1.78678, 1, 0.09411765, 0, 1,
-2.028906, 1.06727, -0.6083804, 1, 0.1019608, 0, 1,
-2.020561, -1.149932, -2.570519, 1, 0.1098039, 0, 1,
-2.004452, 2.084003, -0.1724294, 1, 0.1137255, 0, 1,
-2.000758, 0.9142884, -1.327964, 1, 0.1215686, 0, 1,
-1.993621, 0.1219261, -1.290502, 1, 0.1254902, 0, 1,
-1.982759, -0.8081321, -1.842459, 1, 0.1333333, 0, 1,
-1.972188, -0.3986065, -1.929119, 1, 0.1372549, 0, 1,
-1.969398, -1.472319, -2.11442, 1, 0.145098, 0, 1,
-1.959452, -0.3281708, -0.7459779, 1, 0.1490196, 0, 1,
-1.944939, -1.223605, -1.302835, 1, 0.1568628, 0, 1,
-1.891912, -0.4646884, -1.15198, 1, 0.1607843, 0, 1,
-1.887928, -1.311037, -0.4852644, 1, 0.1686275, 0, 1,
-1.877504, 1.897974, -1.093767, 1, 0.172549, 0, 1,
-1.873344, 0.8205481, 0.1628868, 1, 0.1803922, 0, 1,
-1.870265, -1.200773, -2.46651, 1, 0.1843137, 0, 1,
-1.86031, -0.323696, -2.660817, 1, 0.1921569, 0, 1,
-1.824718, -0.1667004, -1.683165, 1, 0.1960784, 0, 1,
-1.807643, -1.615313, -1.476507, 1, 0.2039216, 0, 1,
-1.780967, -0.05912229, -0.5332891, 1, 0.2117647, 0, 1,
-1.776184, 0.02406387, -3.411235, 1, 0.2156863, 0, 1,
-1.764642, -0.05205188, -1.844429, 1, 0.2235294, 0, 1,
-1.749764, -3.376005, -2.225128, 1, 0.227451, 0, 1,
-1.741628, 1.661722, -1.208403, 1, 0.2352941, 0, 1,
-1.732083, -0.7029292, -1.922269, 1, 0.2392157, 0, 1,
-1.71156, 0.537235, -1.181596, 1, 0.2470588, 0, 1,
-1.703935, 0.1617133, -1.581169, 1, 0.2509804, 0, 1,
-1.680111, -1.38415, -1.675243, 1, 0.2588235, 0, 1,
-1.679207, -0.1207503, -0.1804386, 1, 0.2627451, 0, 1,
-1.673527, -0.3842448, -0.8113965, 1, 0.2705882, 0, 1,
-1.670875, 0.5453137, -0.6085683, 1, 0.2745098, 0, 1,
-1.664707, -0.2232086, -2.538286, 1, 0.282353, 0, 1,
-1.66192, -1.065547, -0.6523718, 1, 0.2862745, 0, 1,
-1.652903, 1.14889, -1.550239, 1, 0.2941177, 0, 1,
-1.641297, 1.137373, -0.242679, 1, 0.3019608, 0, 1,
-1.627553, 0.9636151, -0.1678723, 1, 0.3058824, 0, 1,
-1.62501, -0.9901369, -3.877428, 1, 0.3137255, 0, 1,
-1.624159, 0.3393609, -1.727703, 1, 0.3176471, 0, 1,
-1.603763, 0.3846222, -0.3200629, 1, 0.3254902, 0, 1,
-1.600904, -0.5069743, -1.750746, 1, 0.3294118, 0, 1,
-1.596843, 1.083187, -1.685597, 1, 0.3372549, 0, 1,
-1.57322, -1.784861, -2.457398, 1, 0.3411765, 0, 1,
-1.565195, -0.4576359, -2.170414, 1, 0.3490196, 0, 1,
-1.547429, -0.4237302, -1.446675, 1, 0.3529412, 0, 1,
-1.546151, -0.01213161, -2.74798, 1, 0.3607843, 0, 1,
-1.539343, -0.3105801, -3.97944, 1, 0.3647059, 0, 1,
-1.525724, 1.202622, -0.9691623, 1, 0.372549, 0, 1,
-1.518018, -0.01794163, -0.1800893, 1, 0.3764706, 0, 1,
-1.510446, 0.1160678, -1.258276, 1, 0.3843137, 0, 1,
-1.509704, -0.6157364, -2.286982, 1, 0.3882353, 0, 1,
-1.506538, 0.363595, -0.1049668, 1, 0.3960784, 0, 1,
-1.496388, -1.290091, -1.568879, 1, 0.4039216, 0, 1,
-1.494593, -0.2881697, -2.201243, 1, 0.4078431, 0, 1,
-1.493487, 0.50269, -2.238138, 1, 0.4156863, 0, 1,
-1.488661, -0.238048, -3.202326, 1, 0.4196078, 0, 1,
-1.484102, 0.07420508, -3.596939, 1, 0.427451, 0, 1,
-1.47798, 0.6458193, -0.9378178, 1, 0.4313726, 0, 1,
-1.468855, -0.1772139, 0.2491641, 1, 0.4392157, 0, 1,
-1.468568, -2.477296, -2.782016, 1, 0.4431373, 0, 1,
-1.460673, 1.372363, -0.9663727, 1, 0.4509804, 0, 1,
-1.449663, -0.9261591, -4.216558, 1, 0.454902, 0, 1,
-1.44313, 0.1027198, -0.9886743, 1, 0.4627451, 0, 1,
-1.442427, 0.4589888, -1.901143, 1, 0.4666667, 0, 1,
-1.435033, 0.3284004, -1.921133, 1, 0.4745098, 0, 1,
-1.433903, 0.5964813, -3.655044, 1, 0.4784314, 0, 1,
-1.428931, -1.401723, -2.703075, 1, 0.4862745, 0, 1,
-1.428409, 1.462966, -1.099646, 1, 0.4901961, 0, 1,
-1.424371, 0.7000517, -0.3930478, 1, 0.4980392, 0, 1,
-1.422485, -0.6289727, -2.606581, 1, 0.5058824, 0, 1,
-1.408511, 1.216638, -1.210165, 1, 0.509804, 0, 1,
-1.391701, 0.9526167, 0.5021706, 1, 0.5176471, 0, 1,
-1.383168, 1.484176, -0.8636678, 1, 0.5215687, 0, 1,
-1.382122, -0.1970747, -2.271383, 1, 0.5294118, 0, 1,
-1.372274, -0.05573312, -2.099206, 1, 0.5333334, 0, 1,
-1.369165, 2.284889, -2.740404, 1, 0.5411765, 0, 1,
-1.365083, 1.540157, -0.8856965, 1, 0.5450981, 0, 1,
-1.358577, -0.1893813, -1.745704, 1, 0.5529412, 0, 1,
-1.352648, 0.9732112, 0.3380159, 1, 0.5568628, 0, 1,
-1.336518, -0.7501746, -1.794468, 1, 0.5647059, 0, 1,
-1.334774, 0.7881757, -1.396612, 1, 0.5686275, 0, 1,
-1.327678, 1.263727, -1.351449, 1, 0.5764706, 0, 1,
-1.32355, -0.870369, -2.812637, 1, 0.5803922, 0, 1,
-1.322972, 0.4831194, 0.06518856, 1, 0.5882353, 0, 1,
-1.315934, 1.134275, -1.928334, 1, 0.5921569, 0, 1,
-1.29967, 0.1827292, -1.96819, 1, 0.6, 0, 1,
-1.299563, 1.732606, -1.44017, 1, 0.6078432, 0, 1,
-1.291915, -1.349259, -1.432652, 1, 0.6117647, 0, 1,
-1.274753, -1.340567, -2.732697, 1, 0.6196079, 0, 1,
-1.272932, 0.04763791, -2.376808, 1, 0.6235294, 0, 1,
-1.266354, 0.717934, -2.00724, 1, 0.6313726, 0, 1,
-1.264552, 1.258577, -3.35838, 1, 0.6352941, 0, 1,
-1.261948, 0.5168057, -2.476723, 1, 0.6431373, 0, 1,
-1.256838, 2.071175, -1.458139, 1, 0.6470588, 0, 1,
-1.254477, -1.987428, -4.232731, 1, 0.654902, 0, 1,
-1.253973, 0.09271897, -1.356228, 1, 0.6588235, 0, 1,
-1.252455, -0.1435471, -2.825327, 1, 0.6666667, 0, 1,
-1.241779, 0.9311147, -0.7996001, 1, 0.6705883, 0, 1,
-1.240834, 0.434556, -1.646633, 1, 0.6784314, 0, 1,
-1.237312, -0.8988436, -1.076641, 1, 0.682353, 0, 1,
-1.237234, 0.1770905, -1.681766, 1, 0.6901961, 0, 1,
-1.227165, -0.2614537, -1.925595, 1, 0.6941177, 0, 1,
-1.225358, 0.2701025, -0.7861806, 1, 0.7019608, 0, 1,
-1.220863, -0.0371014, 0.7981202, 1, 0.7098039, 0, 1,
-1.212652, -0.2483223, -1.336913, 1, 0.7137255, 0, 1,
-1.211627, 0.9230044, -0.3408448, 1, 0.7215686, 0, 1,
-1.207603, 0.009125842, -1.854675, 1, 0.7254902, 0, 1,
-1.206449, -0.1481964, -1.705851, 1, 0.7333333, 0, 1,
-1.204022, -0.53176, -2.038989, 1, 0.7372549, 0, 1,
-1.200898, 0.04849123, -3.193455, 1, 0.7450981, 0, 1,
-1.182081, 0.3182345, -1.113011, 1, 0.7490196, 0, 1,
-1.179798, -0.02566566, -1.497701, 1, 0.7568628, 0, 1,
-1.167166, 0.3744089, 0.5711422, 1, 0.7607843, 0, 1,
-1.166536, -0.3566907, -1.599029, 1, 0.7686275, 0, 1,
-1.165693, 0.5620147, -2.65707, 1, 0.772549, 0, 1,
-1.161223, 0.1572549, -0.3859587, 1, 0.7803922, 0, 1,
-1.160208, 1.369316, -0.2041391, 1, 0.7843137, 0, 1,
-1.15509, 1.079754, 0.6003886, 1, 0.7921569, 0, 1,
-1.152668, -0.9531756, -2.349035, 1, 0.7960784, 0, 1,
-1.134954, 0.1341918, -1.632637, 1, 0.8039216, 0, 1,
-1.124653, -0.343215, -1.969586, 1, 0.8117647, 0, 1,
-1.11795, -1.186306, -1.821546, 1, 0.8156863, 0, 1,
-1.114055, -1.021604, -4.946609, 1, 0.8235294, 0, 1,
-1.108661, 0.2180935, 0.7344432, 1, 0.827451, 0, 1,
-1.098081, -1.150705, -2.337256, 1, 0.8352941, 0, 1,
-1.091916, -0.02612517, -1.117106, 1, 0.8392157, 0, 1,
-1.089637, 0.5964379, -0.9149445, 1, 0.8470588, 0, 1,
-1.088547, -0.9267929, -1.458226, 1, 0.8509804, 0, 1,
-1.076659, 1.98672, -1.789831, 1, 0.8588235, 0, 1,
-1.07416, -0.32016, -2.562771, 1, 0.8627451, 0, 1,
-1.068332, 1.529715, -1.058021, 1, 0.8705882, 0, 1,
-1.065474, 1.149827, 0.549486, 1, 0.8745098, 0, 1,
-1.064734, -0.5139984, -2.581582, 1, 0.8823529, 0, 1,
-1.057792, -1.533309, -3.396869, 1, 0.8862745, 0, 1,
-1.044451, -0.03195704, -0.4373427, 1, 0.8941177, 0, 1,
-1.040111, -0.2173132, -1.316069, 1, 0.8980392, 0, 1,
-1.037137, 0.216534, -3.37527, 1, 0.9058824, 0, 1,
-1.028499, 0.2535617, -0.7292943, 1, 0.9137255, 0, 1,
-1.020294, 0.7706143, -2.183525, 1, 0.9176471, 0, 1,
-1.020257, 1.824931, -0.784407, 1, 0.9254902, 0, 1,
-1.007669, -0.9104774, -3.853243, 1, 0.9294118, 0, 1,
-1.004964, 1.273442, -2.417939, 1, 0.9372549, 0, 1,
-0.9985499, 0.1196758, -1.176616, 1, 0.9411765, 0, 1,
-0.9917858, 0.8904377, -0.3214521, 1, 0.9490196, 0, 1,
-0.9899407, 0.3791269, -2.714954, 1, 0.9529412, 0, 1,
-0.9871204, 1.679283, -2.396212, 1, 0.9607843, 0, 1,
-0.9797196, -0.7311831, -3.103438, 1, 0.9647059, 0, 1,
-0.9627648, -0.8174134, -2.347941, 1, 0.972549, 0, 1,
-0.9619157, 0.1906768, -1.698538, 1, 0.9764706, 0, 1,
-0.9618055, 0.09656569, -2.015602, 1, 0.9843137, 0, 1,
-0.9599432, 0.7479448, 1.976979, 1, 0.9882353, 0, 1,
-0.9597795, 0.2334759, -2.068212, 1, 0.9960784, 0, 1,
-0.957747, -2.204714, -3.649936, 0.9960784, 1, 0, 1,
-0.9576169, -0.299521, -1.161623, 0.9921569, 1, 0, 1,
-0.95173, -0.4991882, -2.81567, 0.9843137, 1, 0, 1,
-0.9517136, 0.7746807, -0.884909, 0.9803922, 1, 0, 1,
-0.9487404, -1.377779, -1.610525, 0.972549, 1, 0, 1,
-0.9477711, -1.179787, -1.9964, 0.9686275, 1, 0, 1,
-0.9413229, 0.2321167, -1.38053, 0.9607843, 1, 0, 1,
-0.9356602, -0.2026917, 0.9324889, 0.9568627, 1, 0, 1,
-0.9250405, -1.470391, -4.781281, 0.9490196, 1, 0, 1,
-0.9225916, 1.397199, -1.104623, 0.945098, 1, 0, 1,
-0.9213916, 2.978664, -1.552464, 0.9372549, 1, 0, 1,
-0.9143593, -0.8274022, -2.696334, 0.9333333, 1, 0, 1,
-0.9123942, -0.826925, -1.99092, 0.9254902, 1, 0, 1,
-0.9100063, -1.506465, -2.586169, 0.9215686, 1, 0, 1,
-0.9062093, 1.183663, 0.3707949, 0.9137255, 1, 0, 1,
-0.9053106, 1.345699, -0.3261494, 0.9098039, 1, 0, 1,
-0.8979928, -0.7051392, -4.031407, 0.9019608, 1, 0, 1,
-0.8924133, -0.632025, -1.990242, 0.8941177, 1, 0, 1,
-0.8870655, -0.6379319, -2.05658, 0.8901961, 1, 0, 1,
-0.8751945, -0.1163554, -1.130611, 0.8823529, 1, 0, 1,
-0.8749632, -0.01463342, -2.283451, 0.8784314, 1, 0, 1,
-0.868357, -1.875633, -3.736768, 0.8705882, 1, 0, 1,
-0.8679432, 0.1865987, 0.3129946, 0.8666667, 1, 0, 1,
-0.8677786, 0.1249939, -0.7227809, 0.8588235, 1, 0, 1,
-0.8662366, -0.9671602, -2.046141, 0.854902, 1, 0, 1,
-0.8656731, -0.6755837, -1.072665, 0.8470588, 1, 0, 1,
-0.8648543, -0.4952255, -1.659276, 0.8431373, 1, 0, 1,
-0.8646778, 0.9541233, -0.8583484, 0.8352941, 1, 0, 1,
-0.8496285, -0.5676067, -1.412761, 0.8313726, 1, 0, 1,
-0.8480823, 0.7341528, -1.810238, 0.8235294, 1, 0, 1,
-0.8437225, 2.042269, -2.291927, 0.8196079, 1, 0, 1,
-0.8431114, 0.4008337, -0.9158548, 0.8117647, 1, 0, 1,
-0.8416449, -0.4416652, -1.129222, 0.8078431, 1, 0, 1,
-0.8377348, 0.3367791, -1.662109, 0.8, 1, 0, 1,
-0.8349447, -1.074811, -3.516914, 0.7921569, 1, 0, 1,
-0.8344691, -0.1606902, -1.989711, 0.7882353, 1, 0, 1,
-0.8337878, 0.8142669, -1.549974, 0.7803922, 1, 0, 1,
-0.8325982, -0.1817058, -2.999189, 0.7764706, 1, 0, 1,
-0.8297335, 0.2563982, -1.858171, 0.7686275, 1, 0, 1,
-0.8281563, 0.09095823, -0.5259565, 0.7647059, 1, 0, 1,
-0.8240187, 0.7608636, -0.3564001, 0.7568628, 1, 0, 1,
-0.8163972, 1.426417, -2.477648, 0.7529412, 1, 0, 1,
-0.8157323, 1.526702, -1.242438, 0.7450981, 1, 0, 1,
-0.813439, 0.8671859, -1.63054, 0.7411765, 1, 0, 1,
-0.8085065, 1.632869, -0.215913, 0.7333333, 1, 0, 1,
-0.8065016, -0.4248253, -2.868747, 0.7294118, 1, 0, 1,
-0.8057629, 0.6892921, -1.577977, 0.7215686, 1, 0, 1,
-0.8038689, 1.240986, -0.9917706, 0.7176471, 1, 0, 1,
-0.8032307, -0.6797775, -3.240596, 0.7098039, 1, 0, 1,
-0.8028241, 0.5458182, -1.098007, 0.7058824, 1, 0, 1,
-0.7999275, -0.7948378, -1.93141, 0.6980392, 1, 0, 1,
-0.7981791, -2.144128, -3.479647, 0.6901961, 1, 0, 1,
-0.7964705, 1.36579, -1.509268, 0.6862745, 1, 0, 1,
-0.7962878, -0.1453496, -1.645632, 0.6784314, 1, 0, 1,
-0.7961896, -0.1511766, -0.4578614, 0.6745098, 1, 0, 1,
-0.7940938, -0.2406799, -2.203205, 0.6666667, 1, 0, 1,
-0.7935911, 0.1439559, -2.196362, 0.6627451, 1, 0, 1,
-0.7894018, -2.669995, -4.0215, 0.654902, 1, 0, 1,
-0.7877926, -2.117571, -2.736771, 0.6509804, 1, 0, 1,
-0.7862005, -2.340282, -2.774397, 0.6431373, 1, 0, 1,
-0.7815781, -1.075568, -1.584898, 0.6392157, 1, 0, 1,
-0.7661228, -1.810177, -3.120581, 0.6313726, 1, 0, 1,
-0.7653938, -0.4861926, -2.044439, 0.627451, 1, 0, 1,
-0.7580831, -0.8027338, -2.335467, 0.6196079, 1, 0, 1,
-0.7465785, -0.2988328, -2.197437, 0.6156863, 1, 0, 1,
-0.7385618, 1.411507, 0.3371346, 0.6078432, 1, 0, 1,
-0.7325469, -1.591787, -2.676744, 0.6039216, 1, 0, 1,
-0.7323973, 0.4281807, -0.7356533, 0.5960785, 1, 0, 1,
-0.7264652, -1.116614, -2.194165, 0.5882353, 1, 0, 1,
-0.7213504, -0.3223035, -1.354034, 0.5843138, 1, 0, 1,
-0.7201318, 1.200661, -1.654924, 0.5764706, 1, 0, 1,
-0.7168429, -0.5586044, -3.144103, 0.572549, 1, 0, 1,
-0.7081853, -0.3364363, -1.90937, 0.5647059, 1, 0, 1,
-0.7001654, -1.462893, -2.870186, 0.5607843, 1, 0, 1,
-0.6964782, 0.4125991, 0.159318, 0.5529412, 1, 0, 1,
-0.6937762, -0.288168, -3.241323, 0.5490196, 1, 0, 1,
-0.6889514, 0.1482936, 0.1591471, 0.5411765, 1, 0, 1,
-0.6881419, 1.711503, -2.464261, 0.5372549, 1, 0, 1,
-0.6848022, 0.9739335, -0.7270703, 0.5294118, 1, 0, 1,
-0.6827363, -0.5880015, -2.834985, 0.5254902, 1, 0, 1,
-0.6815538, -1.049832, -2.10072, 0.5176471, 1, 0, 1,
-0.6803288, 1.585372, -0.534516, 0.5137255, 1, 0, 1,
-0.6775703, 0.6398119, -0.1697539, 0.5058824, 1, 0, 1,
-0.668231, -1.452973, -4.303337, 0.5019608, 1, 0, 1,
-0.6664832, 0.231261, -1.158304, 0.4941176, 1, 0, 1,
-0.6635955, 1.714975, 0.1105555, 0.4862745, 1, 0, 1,
-0.6597572, 0.1118899, -1.287994, 0.4823529, 1, 0, 1,
-0.6578213, -0.09546091, -2.552669, 0.4745098, 1, 0, 1,
-0.6536055, -1.46618, -0.4772728, 0.4705882, 1, 0, 1,
-0.652899, -0.4650807, -0.5082825, 0.4627451, 1, 0, 1,
-0.6458031, 0.02998153, -2.676314, 0.4588235, 1, 0, 1,
-0.6445121, 0.04625093, -1.14763, 0.4509804, 1, 0, 1,
-0.6418951, -0.0392969, -1.204789, 0.4470588, 1, 0, 1,
-0.6414792, 0.06946511, -1.033799, 0.4392157, 1, 0, 1,
-0.6410921, -0.2055609, -1.008544, 0.4352941, 1, 0, 1,
-0.6326429, 0.8429832, -1.042329, 0.427451, 1, 0, 1,
-0.6279553, -0.1744581, -1.724262, 0.4235294, 1, 0, 1,
-0.6279477, 2.819722, 1.191828, 0.4156863, 1, 0, 1,
-0.6246588, 0.6550575, -1.662352, 0.4117647, 1, 0, 1,
-0.6241311, 0.4285409, -0.1971044, 0.4039216, 1, 0, 1,
-0.6239153, -0.07717391, -1.53589, 0.3960784, 1, 0, 1,
-0.6204467, 1.0468, -2.31706, 0.3921569, 1, 0, 1,
-0.6192282, -0.6202853, -3.986529, 0.3843137, 1, 0, 1,
-0.6172827, -0.1127285, -1.571651, 0.3803922, 1, 0, 1,
-0.6171095, -0.6639166, -1.831302, 0.372549, 1, 0, 1,
-0.6129656, 0.2604254, -0.7339602, 0.3686275, 1, 0, 1,
-0.6122052, 0.2225371, -3.381519, 0.3607843, 1, 0, 1,
-0.6056116, -0.8944859, -1.634686, 0.3568628, 1, 0, 1,
-0.6034187, 0.8717403, -1.200996, 0.3490196, 1, 0, 1,
-0.598263, 0.8927152, -0.9308597, 0.345098, 1, 0, 1,
-0.5962836, 0.5593118, -1.814515, 0.3372549, 1, 0, 1,
-0.595952, -0.6562997, -4.25042, 0.3333333, 1, 0, 1,
-0.5940688, -1.126364, -6.369761, 0.3254902, 1, 0, 1,
-0.5934689, -1.097533, 0.4015583, 0.3215686, 1, 0, 1,
-0.5886231, -0.01164602, -0.953196, 0.3137255, 1, 0, 1,
-0.5879601, 1.429679, 0.5948288, 0.3098039, 1, 0, 1,
-0.5860819, 0.3524816, -1.860567, 0.3019608, 1, 0, 1,
-0.5838466, 0.6292002, -0.6486232, 0.2941177, 1, 0, 1,
-0.583406, 0.7922562, -1.785985, 0.2901961, 1, 0, 1,
-0.5811206, -0.4730317, -0.5831159, 0.282353, 1, 0, 1,
-0.5799227, 2.05122, 0.9418736, 0.2784314, 1, 0, 1,
-0.5799097, 0.1085667, -2.066457, 0.2705882, 1, 0, 1,
-0.5758148, 0.9101053, 0.3996486, 0.2666667, 1, 0, 1,
-0.5688791, -1.009506, -3.16536, 0.2588235, 1, 0, 1,
-0.5671596, -0.1173737, -2.106516, 0.254902, 1, 0, 1,
-0.554493, 0.9937269, -0.07451865, 0.2470588, 1, 0, 1,
-0.5512649, -1.282951, -2.221161, 0.2431373, 1, 0, 1,
-0.5473132, 0.2684092, -2.226159, 0.2352941, 1, 0, 1,
-0.5435753, 0.07777111, -2.138821, 0.2313726, 1, 0, 1,
-0.5182586, 0.1808566, -0.498244, 0.2235294, 1, 0, 1,
-0.5165884, -0.4104848, -3.044062, 0.2196078, 1, 0, 1,
-0.5123647, 0.9263927, -1.356892, 0.2117647, 1, 0, 1,
-0.5104004, 0.795734, -0.5386805, 0.2078431, 1, 0, 1,
-0.5061535, -1.739948, -4.493822, 0.2, 1, 0, 1,
-0.5061171, -0.3383517, -1.857003, 0.1921569, 1, 0, 1,
-0.503819, 0.390254, -0.6034091, 0.1882353, 1, 0, 1,
-0.5031734, 1.649737, -0.8097519, 0.1803922, 1, 0, 1,
-0.5011088, 0.9165043, -2.098311, 0.1764706, 1, 0, 1,
-0.5008782, -1.109102, -0.8970168, 0.1686275, 1, 0, 1,
-0.5003191, -0.6919487, -2.159256, 0.1647059, 1, 0, 1,
-0.4987416, 0.5438561, -2.592435, 0.1568628, 1, 0, 1,
-0.4982813, 0.5346901, -1.615403, 0.1529412, 1, 0, 1,
-0.4979207, 0.9950554, 0.197273, 0.145098, 1, 0, 1,
-0.4944783, -0.2154579, -2.517365, 0.1411765, 1, 0, 1,
-0.4922536, -0.4550215, -3.434967, 0.1333333, 1, 0, 1,
-0.4896532, 0.3693934, -1.457682, 0.1294118, 1, 0, 1,
-0.4893821, -1.547237, -2.262828, 0.1215686, 1, 0, 1,
-0.4856019, -0.2525686, -3.055385, 0.1176471, 1, 0, 1,
-0.4825579, -1.718473, -2.460589, 0.1098039, 1, 0, 1,
-0.4810472, 0.09991772, -1.514456, 0.1058824, 1, 0, 1,
-0.4797131, -0.3975883, -2.452884, 0.09803922, 1, 0, 1,
-0.478781, -0.1738155, -0.8906127, 0.09019608, 1, 0, 1,
-0.4786417, -1.644238, -3.434101, 0.08627451, 1, 0, 1,
-0.4747877, -1.141089, -1.794665, 0.07843138, 1, 0, 1,
-0.4699077, -1.216431, -3.364603, 0.07450981, 1, 0, 1,
-0.4698452, 0.7286622, -0.4970916, 0.06666667, 1, 0, 1,
-0.4693156, -0.05875633, -1.238828, 0.0627451, 1, 0, 1,
-0.4678725, 0.5030229, 0.2938953, 0.05490196, 1, 0, 1,
-0.463546, -1.342938, -4.695939, 0.05098039, 1, 0, 1,
-0.4634223, 0.9378092, -0.3174519, 0.04313726, 1, 0, 1,
-0.4604974, -1.066641, -1.630703, 0.03921569, 1, 0, 1,
-0.4604092, 0.3536445, -0.6796481, 0.03137255, 1, 0, 1,
-0.4584086, 1.64925, -0.3276951, 0.02745098, 1, 0, 1,
-0.4555122, -0.3912955, -2.286874, 0.01960784, 1, 0, 1,
-0.4552621, -1.16355, -2.982447, 0.01568628, 1, 0, 1,
-0.4538133, 0.522567, -0.8988107, 0.007843138, 1, 0, 1,
-0.4536547, -0.2181362, -2.637561, 0.003921569, 1, 0, 1,
-0.450838, 0.7857346, -0.1299414, 0, 1, 0.003921569, 1,
-0.4388383, -0.9783275, -2.29994, 0, 1, 0.01176471, 1,
-0.4387144, -1.789233, -3.059553, 0, 1, 0.01568628, 1,
-0.4364458, -0.3706802, -1.437558, 0, 1, 0.02352941, 1,
-0.4325901, 0.5419905, 0.3697026, 0, 1, 0.02745098, 1,
-0.4201144, -1.86758, -4.894084, 0, 1, 0.03529412, 1,
-0.4123798, 1.252416, -0.2684795, 0, 1, 0.03921569, 1,
-0.4071774, 1.701262, 1.644961, 0, 1, 0.04705882, 1,
-0.4071605, -1.112052, -3.721194, 0, 1, 0.05098039, 1,
-0.4047031, 0.8159325, -0.8932344, 0, 1, 0.05882353, 1,
-0.4037848, 0.09091134, -1.521443, 0, 1, 0.0627451, 1,
-0.4023937, -0.2125635, -2.331988, 0, 1, 0.07058824, 1,
-0.3979632, -1.151489, -1.333104, 0, 1, 0.07450981, 1,
-0.397372, 1.577156, -0.09823986, 0, 1, 0.08235294, 1,
-0.3905304, 1.990214, -0.8139778, 0, 1, 0.08627451, 1,
-0.3887813, -1.536587, -3.836621, 0, 1, 0.09411765, 1,
-0.3840624, 0.6171489, -1.272643, 0, 1, 0.1019608, 1,
-0.3809551, 0.3918453, -1.271711, 0, 1, 0.1058824, 1,
-0.3768297, -1.210194, -1.487373, 0, 1, 0.1137255, 1,
-0.3685648, 0.5534688, -0.3245877, 0, 1, 0.1176471, 1,
-0.3677096, 0.804923, -0.5807514, 0, 1, 0.1254902, 1,
-0.3676114, -0.3542244, -3.022748, 0, 1, 0.1294118, 1,
-0.3637348, -0.7511384, -4.176682, 0, 1, 0.1372549, 1,
-0.3591955, -0.0269472, -2.532412, 0, 1, 0.1411765, 1,
-0.3575401, 0.5322608, 1.312952, 0, 1, 0.1490196, 1,
-0.3555595, -0.692144, -1.847617, 0, 1, 0.1529412, 1,
-0.3549648, 0.2839482, -1.792298, 0, 1, 0.1607843, 1,
-0.3466136, 0.1862589, -0.4545532, 0, 1, 0.1647059, 1,
-0.345932, 0.1870272, -0.1807363, 0, 1, 0.172549, 1,
-0.3451639, -0.09776454, -3.269918, 0, 1, 0.1764706, 1,
-0.3434711, 0.2058202, 0.3801948, 0, 1, 0.1843137, 1,
-0.3423386, -0.3108289, -2.438028, 0, 1, 0.1882353, 1,
-0.3388213, -0.9070885, -2.417234, 0, 1, 0.1960784, 1,
-0.3297101, 0.1981982, -0.3527143, 0, 1, 0.2039216, 1,
-0.3256686, -0.08249078, -0.06813449, 0, 1, 0.2078431, 1,
-0.3253945, 1.588843, 0.08280858, 0, 1, 0.2156863, 1,
-0.3247057, 0.5199149, -0.3568148, 0, 1, 0.2196078, 1,
-0.323844, -1.718738, -3.292284, 0, 1, 0.227451, 1,
-0.3203134, -0.06747651, -0.7279814, 0, 1, 0.2313726, 1,
-0.3181761, 1.298432, -1.119882, 0, 1, 0.2392157, 1,
-0.3118948, -2.129164, -3.851842, 0, 1, 0.2431373, 1,
-0.3118939, -0.8533059, -2.273848, 0, 1, 0.2509804, 1,
-0.311592, -0.8387299, -1.333956, 0, 1, 0.254902, 1,
-0.3113586, -1.318596, -1.804956, 0, 1, 0.2627451, 1,
-0.3038883, -0.2940456, -2.497195, 0, 1, 0.2666667, 1,
-0.3023549, 0.811325, -0.3033674, 0, 1, 0.2745098, 1,
-0.2971275, 0.4829786, 1.119111, 0, 1, 0.2784314, 1,
-0.2961979, 0.4607667, -1.53458, 0, 1, 0.2862745, 1,
-0.2908573, 0.3465071, -1.128412, 0, 1, 0.2901961, 1,
-0.2884396, -1.863362, -3.545218, 0, 1, 0.2980392, 1,
-0.2882228, 1.565202, 0.2508695, 0, 1, 0.3058824, 1,
-0.2850106, -0.163526, -2.308043, 0, 1, 0.3098039, 1,
-0.2839542, -0.2398255, -3.148932, 0, 1, 0.3176471, 1,
-0.2731746, -1.287276, -2.267884, 0, 1, 0.3215686, 1,
-0.2700268, 0.02899771, -1.563351, 0, 1, 0.3294118, 1,
-0.2667226, 0.1529011, -2.30889, 0, 1, 0.3333333, 1,
-0.26507, -0.5370031, -1.024338, 0, 1, 0.3411765, 1,
-0.2638702, -1.085103, -3.214255, 0, 1, 0.345098, 1,
-0.2626874, -0.1450184, -2.990602, 0, 1, 0.3529412, 1,
-0.2599216, -0.581591, -3.586451, 0, 1, 0.3568628, 1,
-0.2597196, -0.8267464, -2.731098, 0, 1, 0.3647059, 1,
-0.2568206, -0.2531637, -2.83117, 0, 1, 0.3686275, 1,
-0.2567871, 1.065437, -1.764888, 0, 1, 0.3764706, 1,
-0.2561462, 1.030724, 0.6072987, 0, 1, 0.3803922, 1,
-0.2548293, 1.500554, 2.310823, 0, 1, 0.3882353, 1,
-0.251209, 1.018847, -0.2381425, 0, 1, 0.3921569, 1,
-0.2496138, 0.727753, -1.15661, 0, 1, 0.4, 1,
-0.2457221, 0.6060378, -1.279011, 0, 1, 0.4078431, 1,
-0.2454405, -1.456665, -4.536128, 0, 1, 0.4117647, 1,
-0.2448597, 0.414967, -0.6201428, 0, 1, 0.4196078, 1,
-0.2437902, 0.4809861, 0.06640155, 0, 1, 0.4235294, 1,
-0.2423305, -0.8847734, -2.513404, 0, 1, 0.4313726, 1,
-0.2417574, -0.9070385, -3.040998, 0, 1, 0.4352941, 1,
-0.2406315, 0.03946431, -1.679186, 0, 1, 0.4431373, 1,
-0.2390371, -1.082707, -0.9460077, 0, 1, 0.4470588, 1,
-0.2386821, 0.07885756, -1.659478, 0, 1, 0.454902, 1,
-0.2347343, -0.008999791, 0.1419981, 0, 1, 0.4588235, 1,
-0.2345472, 0.6502102, -1.27726, 0, 1, 0.4666667, 1,
-0.2323318, 0.4977451, -0.1624374, 0, 1, 0.4705882, 1,
-0.2312973, 2.19689, 0.1928279, 0, 1, 0.4784314, 1,
-0.2310918, 0.6130973, -0.8101208, 0, 1, 0.4823529, 1,
-0.2289051, -0.5736254, -4.561297, 0, 1, 0.4901961, 1,
-0.2268538, 1.062209, 1.04154, 0, 1, 0.4941176, 1,
-0.2257438, 1.062099, -1.674666, 0, 1, 0.5019608, 1,
-0.224525, 0.462258, -1.07303, 0, 1, 0.509804, 1,
-0.224169, -0.6708564, -3.484615, 0, 1, 0.5137255, 1,
-0.2188392, -0.08240148, -1.953897, 0, 1, 0.5215687, 1,
-0.2145169, -2.288954, -2.746081, 0, 1, 0.5254902, 1,
-0.2140799, -1.184154, -2.993563, 0, 1, 0.5333334, 1,
-0.207601, -1.426749, -3.066792, 0, 1, 0.5372549, 1,
-0.2042357, -0.1277499, -1.564742, 0, 1, 0.5450981, 1,
-0.2033201, -0.6175234, -2.358223, 0, 1, 0.5490196, 1,
-0.200515, 0.6168753, -0.9635268, 0, 1, 0.5568628, 1,
-0.1930476, 0.9660077, -1.468634, 0, 1, 0.5607843, 1,
-0.1920325, -2.30989, -2.940542, 0, 1, 0.5686275, 1,
-0.1915184, -0.5528359, -3.693458, 0, 1, 0.572549, 1,
-0.1878192, -0.05618839, 0.07598934, 0, 1, 0.5803922, 1,
-0.1869086, 1.537675, 0.5961875, 0, 1, 0.5843138, 1,
-0.1846242, -0.05720462, -1.643695, 0, 1, 0.5921569, 1,
-0.1817191, 0.5771371, -2.436915, 0, 1, 0.5960785, 1,
-0.1814199, 1.142737, -0.494023, 0, 1, 0.6039216, 1,
-0.1792112, 0.04367788, -0.6903848, 0, 1, 0.6117647, 1,
-0.1765718, -1.335655, -3.812989, 0, 1, 0.6156863, 1,
-0.1765291, -1.548114, -2.008142, 0, 1, 0.6235294, 1,
-0.1760457, 0.122921, -0.402655, 0, 1, 0.627451, 1,
-0.1691811, 1.731745, -1.603961, 0, 1, 0.6352941, 1,
-0.1691567, -0.7493144, -1.036972, 0, 1, 0.6392157, 1,
-0.1645318, -0.1412332, -0.9284001, 0, 1, 0.6470588, 1,
-0.1620114, 0.2373755, -1.637902, 0, 1, 0.6509804, 1,
-0.1589904, -0.944796, -3.124249, 0, 1, 0.6588235, 1,
-0.1588955, 0.1681345, -0.7837344, 0, 1, 0.6627451, 1,
-0.1573571, -0.4520758, -2.992894, 0, 1, 0.6705883, 1,
-0.1567678, -0.8255816, -2.271903, 0, 1, 0.6745098, 1,
-0.153916, -0.1831549, -2.928601, 0, 1, 0.682353, 1,
-0.1441488, 0.3910486, 0.09146249, 0, 1, 0.6862745, 1,
-0.1401362, -1.096004, -4.226281, 0, 1, 0.6941177, 1,
-0.1388383, 0.2312532, -0.545508, 0, 1, 0.7019608, 1,
-0.1360686, 0.516142, -1.712802, 0, 1, 0.7058824, 1,
-0.1347799, 1.454827, -0.3478437, 0, 1, 0.7137255, 1,
-0.1323406, 0.9515685, 1.193851, 0, 1, 0.7176471, 1,
-0.1321529, 0.7753816, -0.01017998, 0, 1, 0.7254902, 1,
-0.1281607, 1.066478, -0.0001485918, 0, 1, 0.7294118, 1,
-0.127734, 0.419218, -2.43859, 0, 1, 0.7372549, 1,
-0.124022, -1.181841, -2.938149, 0, 1, 0.7411765, 1,
-0.1231877, 0.03854546, -1.166772, 0, 1, 0.7490196, 1,
-0.1223036, 1.087897, -1.606212, 0, 1, 0.7529412, 1,
-0.1210112, 0.09047449, -0.9957711, 0, 1, 0.7607843, 1,
-0.1209408, -0.2019835, -3.120939, 0, 1, 0.7647059, 1,
-0.1187065, -0.9168308, -0.6532025, 0, 1, 0.772549, 1,
-0.1149546, 1.958961, -1.186894, 0, 1, 0.7764706, 1,
-0.108601, -0.794403, -2.274155, 0, 1, 0.7843137, 1,
-0.1077744, 1.118905, 0.2337908, 0, 1, 0.7882353, 1,
-0.1062932, -0.9829412, -5.080181, 0, 1, 0.7960784, 1,
-0.09473238, -1.717255, -4.882761, 0, 1, 0.8039216, 1,
-0.09291061, 0.3088605, 0.4516908, 0, 1, 0.8078431, 1,
-0.09018688, -0.5944197, -4.213384, 0, 1, 0.8156863, 1,
-0.08880783, 0.3739093, 0.4827079, 0, 1, 0.8196079, 1,
-0.08536682, -0.3752525, -3.374612, 0, 1, 0.827451, 1,
-0.08430277, 0.2756101, 0.2747309, 0, 1, 0.8313726, 1,
-0.08298683, -1.55822, -2.467242, 0, 1, 0.8392157, 1,
-0.06803163, 0.4321498, -0.01824603, 0, 1, 0.8431373, 1,
-0.06678968, -1.223023, -2.161749, 0, 1, 0.8509804, 1,
-0.06401648, -0.1742807, -1.968785, 0, 1, 0.854902, 1,
-0.06310588, 0.4369577, -1.094414, 0, 1, 0.8627451, 1,
-0.05891584, -0.4886327, -4.033716, 0, 1, 0.8666667, 1,
-0.05839076, 0.213706, 0.2959678, 0, 1, 0.8745098, 1,
-0.05261657, 0.5564651, -0.8917548, 0, 1, 0.8784314, 1,
-0.05085572, 1.005606, 2.7216, 0, 1, 0.8862745, 1,
-0.04980758, 0.7200087, -1.397071, 0, 1, 0.8901961, 1,
-0.04966254, -0.4746706, -4.279855, 0, 1, 0.8980392, 1,
-0.04371321, -0.3056271, -3.649556, 0, 1, 0.9058824, 1,
-0.04192859, 0.2710522, -0.3800666, 0, 1, 0.9098039, 1,
-0.03707702, -2.062669, -3.912899, 0, 1, 0.9176471, 1,
-0.03681733, -0.5889022, -2.97246, 0, 1, 0.9215686, 1,
-0.03447682, 0.7769819, 2.356847, 0, 1, 0.9294118, 1,
-0.03262372, -0.8149898, -2.371036, 0, 1, 0.9333333, 1,
-0.02979939, -0.3299499, -2.258395, 0, 1, 0.9411765, 1,
-0.02669618, 0.005609003, -0.5478714, 0, 1, 0.945098, 1,
-0.02667419, 0.521655, 0.7506027, 0, 1, 0.9529412, 1,
-0.02206053, 1.258443, 1.128234, 0, 1, 0.9568627, 1,
-0.02107453, -0.5205842, -4.324986, 0, 1, 0.9647059, 1,
-0.01690353, 0.3096847, -1.056131, 0, 1, 0.9686275, 1,
-0.01511692, -0.4105085, -1.803347, 0, 1, 0.9764706, 1,
-0.01328128, 1.278469, -0.09362931, 0, 1, 0.9803922, 1,
-0.01219554, -0.9608358, -4.037981, 0, 1, 0.9882353, 1,
-0.00313761, -1.134051, -3.237743, 0, 1, 0.9921569, 1,
-7.789792e-05, -0.8359169, -3.603199, 0, 1, 1, 1,
0.0004841168, -0.9712375, 2.905843, 0, 0.9921569, 1, 1,
0.001133869, -0.4281916, 3.330492, 0, 0.9882353, 1, 1,
0.002209434, -0.5439055, 4.260701, 0, 0.9803922, 1, 1,
0.003761666, -1.756478, 2.220401, 0, 0.9764706, 1, 1,
0.003912559, -0.246907, 2.636283, 0, 0.9686275, 1, 1,
0.005219715, -0.8854083, 4.983254, 0, 0.9647059, 1, 1,
0.007447607, -2.388276, 3.149463, 0, 0.9568627, 1, 1,
0.01982499, 0.730366, 1.216973, 0, 0.9529412, 1, 1,
0.02012051, 0.01117307, 1.645668, 0, 0.945098, 1, 1,
0.02028067, 0.2619844, -0.6498059, 0, 0.9411765, 1, 1,
0.02258675, -1.295014, 3.252845, 0, 0.9333333, 1, 1,
0.0239667, -1.430382, 3.283973, 0, 0.9294118, 1, 1,
0.02703621, 2.01129, 0.57712, 0, 0.9215686, 1, 1,
0.02957716, -0.7893702, 3.381867, 0, 0.9176471, 1, 1,
0.03343521, 0.9804663, -1.925774, 0, 0.9098039, 1, 1,
0.03384605, 0.1483294, 1.065796, 0, 0.9058824, 1, 1,
0.04119513, -0.5601825, 1.448551, 0, 0.8980392, 1, 1,
0.04679554, -1.534328, 4.384884, 0, 0.8901961, 1, 1,
0.04824772, 0.3310779, -0.3029486, 0, 0.8862745, 1, 1,
0.04914573, -0.7145042, 5.070346, 0, 0.8784314, 1, 1,
0.054699, 1.92063, 0.3408759, 0, 0.8745098, 1, 1,
0.05910007, 0.02319661, 0.6706879, 0, 0.8666667, 1, 1,
0.06756662, 0.09632193, -0.1606316, 0, 0.8627451, 1, 1,
0.06849209, 0.03709637, 1.660879, 0, 0.854902, 1, 1,
0.07195389, -1.014073, 3.576834, 0, 0.8509804, 1, 1,
0.07581279, 1.724429, 1.46896, 0, 0.8431373, 1, 1,
0.07826208, 0.4748144, -0.6945769, 0, 0.8392157, 1, 1,
0.07895252, -0.09740094, 2.424201, 0, 0.8313726, 1, 1,
0.07973716, 0.1773068, -0.8596902, 0, 0.827451, 1, 1,
0.07982416, -1.008337, 2.772022, 0, 0.8196079, 1, 1,
0.08082727, -0.6893107, 4.160326, 0, 0.8156863, 1, 1,
0.08085027, 1.427499, 1.273993, 0, 0.8078431, 1, 1,
0.08163393, -0.7473339, 3.777946, 0, 0.8039216, 1, 1,
0.08202025, 0.4598407, -0.1199091, 0, 0.7960784, 1, 1,
0.08286107, 1.034685, 0.67239, 0, 0.7882353, 1, 1,
0.08918118, 0.3693001, -0.4613428, 0, 0.7843137, 1, 1,
0.09197198, -0.6061085, 1.914562, 0, 0.7764706, 1, 1,
0.09869007, 0.06748592, 1.034041, 0, 0.772549, 1, 1,
0.1003815, 0.8779413, 0.8697503, 0, 0.7647059, 1, 1,
0.1024851, -0.9261249, 4.875299, 0, 0.7607843, 1, 1,
0.1034665, -0.3522716, 3.611623, 0, 0.7529412, 1, 1,
0.1059175, -0.4678629, 1.646147, 0, 0.7490196, 1, 1,
0.1118933, -0.0857054, 2.694588, 0, 0.7411765, 1, 1,
0.1159692, -0.4823371, 2.572611, 0, 0.7372549, 1, 1,
0.1204538, 0.002052028, 1.565903, 0, 0.7294118, 1, 1,
0.1210877, -1.259657, 4.299885, 0, 0.7254902, 1, 1,
0.1265428, 1.472275, -0.1334337, 0, 0.7176471, 1, 1,
0.1281452, 0.105106, -0.03567139, 0, 0.7137255, 1, 1,
0.1294832, -0.5101955, 3.620693, 0, 0.7058824, 1, 1,
0.1318649, 0.3412848, 1.834144, 0, 0.6980392, 1, 1,
0.1327326, 0.8110776, -0.1821794, 0, 0.6941177, 1, 1,
0.1394171, -0.5916759, 3.878991, 0, 0.6862745, 1, 1,
0.140465, 0.6580639, 0.02135245, 0, 0.682353, 1, 1,
0.1429541, 0.492734, -0.6840662, 0, 0.6745098, 1, 1,
0.1455896, 2.019083, 0.5562799, 0, 0.6705883, 1, 1,
0.1504586, 0.287634, 0.9581771, 0, 0.6627451, 1, 1,
0.1507462, 0.07260097, 0.8324409, 0, 0.6588235, 1, 1,
0.1517101, 1.240593, 1.806574, 0, 0.6509804, 1, 1,
0.1526326, -0.5548175, 1.20042, 0, 0.6470588, 1, 1,
0.1543743, -1.154462, 2.417768, 0, 0.6392157, 1, 1,
0.156482, -0.6108868, 3.489915, 0, 0.6352941, 1, 1,
0.1592145, -0.2355209, 2.845849, 0, 0.627451, 1, 1,
0.1607844, 1.038064, 0.4438926, 0, 0.6235294, 1, 1,
0.1610342, -0.3982288, 3.006196, 0, 0.6156863, 1, 1,
0.1620324, 1.469225, -0.6806927, 0, 0.6117647, 1, 1,
0.1736812, 1.396115, 1.12203, 0, 0.6039216, 1, 1,
0.1795488, -1.109803, 2.897841, 0, 0.5960785, 1, 1,
0.1803995, 0.5344044, 0.2823035, 0, 0.5921569, 1, 1,
0.1823001, -1.290328, 2.343625, 0, 0.5843138, 1, 1,
0.1836413, -0.2168736, 2.616, 0, 0.5803922, 1, 1,
0.1841736, -1.611671, 3.081807, 0, 0.572549, 1, 1,
0.1847492, -1.206497, 4.231678, 0, 0.5686275, 1, 1,
0.1852755, -0.6802605, 3.532934, 0, 0.5607843, 1, 1,
0.1852978, -0.5590946, 2.948105, 0, 0.5568628, 1, 1,
0.1896393, -0.3533747, 3.560548, 0, 0.5490196, 1, 1,
0.1957098, 1.882522, 0.4691902, 0, 0.5450981, 1, 1,
0.1960128, 0.7448222, 1.878459, 0, 0.5372549, 1, 1,
0.1961998, -0.08312431, 1.203181, 0, 0.5333334, 1, 1,
0.197422, -0.6004036, 3.84762, 0, 0.5254902, 1, 1,
0.1983344, 0.03369405, 0.1212547, 0, 0.5215687, 1, 1,
0.2011364, 0.1742474, 0.4130836, 0, 0.5137255, 1, 1,
0.2020037, 1.264094, -1.111835, 0, 0.509804, 1, 1,
0.2025851, 0.188488, -1.410488, 0, 0.5019608, 1, 1,
0.2049567, -1.709175, 1.672428, 0, 0.4941176, 1, 1,
0.2056075, 0.0753772, 1.052147, 0, 0.4901961, 1, 1,
0.2102004, 0.5855068, -0.7672262, 0, 0.4823529, 1, 1,
0.2126062, -1.435961, 5.760266, 0, 0.4784314, 1, 1,
0.2157337, 0.5233346, 0.3060827, 0, 0.4705882, 1, 1,
0.2164864, -0.9910686, 1.804881, 0, 0.4666667, 1, 1,
0.2176696, 0.694847, 2.210227, 0, 0.4588235, 1, 1,
0.2187585, 1.118229, 0.09401984, 0, 0.454902, 1, 1,
0.2193696, -2.073221, 1.569737, 0, 0.4470588, 1, 1,
0.219759, -2.000262, 2.759289, 0, 0.4431373, 1, 1,
0.2197937, 0.3567448, 1.880134, 0, 0.4352941, 1, 1,
0.220312, -0.5251953, 0.9063255, 0, 0.4313726, 1, 1,
0.2214208, -0.09857707, 1.647089, 0, 0.4235294, 1, 1,
0.2216867, -0.7416961, 2.929344, 0, 0.4196078, 1, 1,
0.2241206, 0.55824, -0.3576983, 0, 0.4117647, 1, 1,
0.2265412, -0.3176298, 0.9062667, 0, 0.4078431, 1, 1,
0.2288833, -1.240366, 3.962675, 0, 0.4, 1, 1,
0.2329781, -1.739242, 3.929594, 0, 0.3921569, 1, 1,
0.2332584, -0.06473686, 2.169994, 0, 0.3882353, 1, 1,
0.2336929, -0.2026979, 1.359389, 0, 0.3803922, 1, 1,
0.2364233, -0.0149874, 1.263552, 0, 0.3764706, 1, 1,
0.2375391, 1.122078, -0.3915754, 0, 0.3686275, 1, 1,
0.2391267, 0.6205335, 1.787304, 0, 0.3647059, 1, 1,
0.2441121, 1.374683, -0.855926, 0, 0.3568628, 1, 1,
0.2456582, 1.451381, -0.4894018, 0, 0.3529412, 1, 1,
0.2465262, 1.647398, -0.1867543, 0, 0.345098, 1, 1,
0.2492225, 2.915412, 2.143578, 0, 0.3411765, 1, 1,
0.2506774, -0.122627, 2.818542, 0, 0.3333333, 1, 1,
0.2511468, 0.9522214, -0.6261775, 0, 0.3294118, 1, 1,
0.2541668, -1.420963, 3.440988, 0, 0.3215686, 1, 1,
0.2545418, -0.975087, 3.040613, 0, 0.3176471, 1, 1,
0.2564048, -0.8668068, 3.465518, 0, 0.3098039, 1, 1,
0.2566509, -0.6809044, 2.133307, 0, 0.3058824, 1, 1,
0.2573923, 0.1538775, 0.2013425, 0, 0.2980392, 1, 1,
0.2597376, -0.6602152, 2.203002, 0, 0.2901961, 1, 1,
0.2623667, -1.650274, 2.302123, 0, 0.2862745, 1, 1,
0.2678498, 1.70259, 0.4853484, 0, 0.2784314, 1, 1,
0.2724899, -0.2118055, 3.132287, 0, 0.2745098, 1, 1,
0.274898, -0.5716592, 2.052166, 0, 0.2666667, 1, 1,
0.2753296, -0.2754426, 3.828524, 0, 0.2627451, 1, 1,
0.2769941, 0.5589119, 1.314755, 0, 0.254902, 1, 1,
0.2793656, 0.78332, -0.08600974, 0, 0.2509804, 1, 1,
0.2796803, -0.4324493, 3.345835, 0, 0.2431373, 1, 1,
0.2848048, -1.630838, 2.553843, 0, 0.2392157, 1, 1,
0.2858416, -0.3947768, 2.467582, 0, 0.2313726, 1, 1,
0.285964, -0.1132865, 1.461931, 0, 0.227451, 1, 1,
0.2863942, 1.371146, 1.083074, 0, 0.2196078, 1, 1,
0.2882408, 0.8087088, 1.457376, 0, 0.2156863, 1, 1,
0.2888981, -0.6426317, 2.479003, 0, 0.2078431, 1, 1,
0.2940423, -0.7960175, 4.517233, 0, 0.2039216, 1, 1,
0.2966462, -0.8223694, 2.555767, 0, 0.1960784, 1, 1,
0.303748, -1.110465, 3.973931, 0, 0.1882353, 1, 1,
0.3062677, -0.132559, 1.940499, 0, 0.1843137, 1, 1,
0.3066979, -0.1024207, 2.005643, 0, 0.1764706, 1, 1,
0.3093246, -2.729341, 2.97481, 0, 0.172549, 1, 1,
0.3168674, 0.9195877, 0.3324635, 0, 0.1647059, 1, 1,
0.3186134, 0.5711907, 1.96828, 0, 0.1607843, 1, 1,
0.3188529, -1.453827, 4.109287, 0, 0.1529412, 1, 1,
0.319681, -0.5810037, 1.536178, 0, 0.1490196, 1, 1,
0.3223792, -0.9884939, 1.773836, 0, 0.1411765, 1, 1,
0.3239327, -0.3346726, 3.190936, 0, 0.1372549, 1, 1,
0.3260464, 1.456338, 0.3299756, 0, 0.1294118, 1, 1,
0.3277843, 0.183647, 3.425751, 0, 0.1254902, 1, 1,
0.3309732, 0.06356287, 1.484604, 0, 0.1176471, 1, 1,
0.3316114, -0.8361476, 0.32231, 0, 0.1137255, 1, 1,
0.3325855, 2.19823, -0.8082376, 0, 0.1058824, 1, 1,
0.3331557, -0.9570119, 2.186583, 0, 0.09803922, 1, 1,
0.3385424, -0.007152823, 1.334264, 0, 0.09411765, 1, 1,
0.3446678, 0.9729527, 1.39709, 0, 0.08627451, 1, 1,
0.3560769, -1.461934, 3.755754, 0, 0.08235294, 1, 1,
0.3565345, 1.297829, 1.097143, 0, 0.07450981, 1, 1,
0.3594623, -0.8667666, 2.469978, 0, 0.07058824, 1, 1,
0.3603663, 1.524918, -0.3628462, 0, 0.0627451, 1, 1,
0.3605206, -1.231881, 2.798373, 0, 0.05882353, 1, 1,
0.3640367, -0.352491, 0.9531585, 0, 0.05098039, 1, 1,
0.3675962, 0.07884818, 1.327546, 0, 0.04705882, 1, 1,
0.3703245, 1.816954, -0.1439425, 0, 0.03921569, 1, 1,
0.3727941, 0.3354959, 0.9298406, 0, 0.03529412, 1, 1,
0.3741129, -0.1912227, 2.554051, 0, 0.02745098, 1, 1,
0.3781359, 0.09249572, 1.528107, 0, 0.02352941, 1, 1,
0.3791386, -0.07447928, 2.420325, 0, 0.01568628, 1, 1,
0.3794749, 0.6148208, 1.595388, 0, 0.01176471, 1, 1,
0.3847475, -0.3679451, 4.622746, 0, 0.003921569, 1, 1,
0.3847609, 0.3490533, -0.7799944, 0.003921569, 0, 1, 1,
0.3893965, -1.109186, 1.203017, 0.007843138, 0, 1, 1,
0.3900518, -0.4259073, 2.422304, 0.01568628, 0, 1, 1,
0.3912503, -0.4532034, 2.507375, 0.01960784, 0, 1, 1,
0.3959181, 0.8059943, 0.1574763, 0.02745098, 0, 1, 1,
0.3960691, 0.1536042, 0.4820057, 0.03137255, 0, 1, 1,
0.3961569, 0.6354399, -0.0543869, 0.03921569, 0, 1, 1,
0.4032751, -0.3122614, 3.171446, 0.04313726, 0, 1, 1,
0.4035195, -1.547018, 3.069851, 0.05098039, 0, 1, 1,
0.4082797, -0.1324708, 3.735359, 0.05490196, 0, 1, 1,
0.4119886, -1.343196, 2.354321, 0.0627451, 0, 1, 1,
0.4207145, -0.04603828, 0.8596581, 0.06666667, 0, 1, 1,
0.4215689, -0.4380156, 1.123793, 0.07450981, 0, 1, 1,
0.4238795, 1.061912, 1.749871, 0.07843138, 0, 1, 1,
0.4244809, -1.298698, 2.623997, 0.08627451, 0, 1, 1,
0.4277485, 0.2048685, 0.04935523, 0.09019608, 0, 1, 1,
0.4281571, 0.2230474, 1.912842, 0.09803922, 0, 1, 1,
0.4295343, 1.266152, -0.6489715, 0.1058824, 0, 1, 1,
0.4330608, 0.1256022, 1.490891, 0.1098039, 0, 1, 1,
0.4368805, 1.080041, 0.378366, 0.1176471, 0, 1, 1,
0.4393818, -1.502319, 1.922454, 0.1215686, 0, 1, 1,
0.444536, -0.8344952, 3.821371, 0.1294118, 0, 1, 1,
0.4464963, 0.2933095, 0.4909948, 0.1333333, 0, 1, 1,
0.4477654, 0.7457357, 0.7167554, 0.1411765, 0, 1, 1,
0.4517123, -1.042032, 4.183964, 0.145098, 0, 1, 1,
0.4562993, 2.63819, -0.5033863, 0.1529412, 0, 1, 1,
0.4608279, -1.006369, 0.2898822, 0.1568628, 0, 1, 1,
0.4627005, 0.7015912, 0.3649596, 0.1647059, 0, 1, 1,
0.4637179, 0.4531468, 0.1739706, 0.1686275, 0, 1, 1,
0.4640548, 1.136785, -0.252194, 0.1764706, 0, 1, 1,
0.4656043, 0.03387181, 1.991366, 0.1803922, 0, 1, 1,
0.4702235, 0.08403825, 1.16457, 0.1882353, 0, 1, 1,
0.4762961, -0.1063204, 1.81321, 0.1921569, 0, 1, 1,
0.4775757, -0.4726067, 3.97385, 0.2, 0, 1, 1,
0.4799864, -0.4932192, 4.16478, 0.2078431, 0, 1, 1,
0.4858437, 0.254086, 1.30076, 0.2117647, 0, 1, 1,
0.4954384, 1.10814, 0.500586, 0.2196078, 0, 1, 1,
0.4999691, -0.05161352, 0.5235695, 0.2235294, 0, 1, 1,
0.5009482, -0.1783847, 2.821678, 0.2313726, 0, 1, 1,
0.5024584, -0.5860657, 3.585161, 0.2352941, 0, 1, 1,
0.5059187, -0.5391548, 2.571515, 0.2431373, 0, 1, 1,
0.5088778, 1.358834, 0.3351945, 0.2470588, 0, 1, 1,
0.5212978, 0.5608637, 1.428535, 0.254902, 0, 1, 1,
0.5224465, -0.6292175, 1.864126, 0.2588235, 0, 1, 1,
0.5260936, 1.272237, 0.3439294, 0.2666667, 0, 1, 1,
0.532487, 1.067347, 1.080377, 0.2705882, 0, 1, 1,
0.5337755, -2.269319, 3.264616, 0.2784314, 0, 1, 1,
0.5375978, -0.4602093, 2.982784, 0.282353, 0, 1, 1,
0.5389626, -1.067844, 3.356832, 0.2901961, 0, 1, 1,
0.5393516, -0.5158005, -0.03233006, 0.2941177, 0, 1, 1,
0.5428116, -0.09291959, 2.625845, 0.3019608, 0, 1, 1,
0.5430534, 0.1055743, 2.452939, 0.3098039, 0, 1, 1,
0.5544785, 0.9508818, 0.8009111, 0.3137255, 0, 1, 1,
0.5546207, -1.322534, 3.971066, 0.3215686, 0, 1, 1,
0.5574471, -1.101492, 3.357317, 0.3254902, 0, 1, 1,
0.5618004, -1.348495, 4.598337, 0.3333333, 0, 1, 1,
0.5700586, -0.7917848, 1.595227, 0.3372549, 0, 1, 1,
0.5726103, 2.356113, 1.2526, 0.345098, 0, 1, 1,
0.5752736, 0.4123249, 2.003419, 0.3490196, 0, 1, 1,
0.582178, 1.46322, -0.9873124, 0.3568628, 0, 1, 1,
0.5835092, -1.742491, 2.379325, 0.3607843, 0, 1, 1,
0.5869261, -1.636702, 1.99233, 0.3686275, 0, 1, 1,
0.5914937, 0.7390949, -0.1785947, 0.372549, 0, 1, 1,
0.5937299, 0.7549999, 1.801456, 0.3803922, 0, 1, 1,
0.6000367, 0.8692545, 1.634822, 0.3843137, 0, 1, 1,
0.6094732, 1.167158, 1.656133, 0.3921569, 0, 1, 1,
0.6132248, 0.638452, 0.4745111, 0.3960784, 0, 1, 1,
0.6160143, 0.3469046, 3.068303, 0.4039216, 0, 1, 1,
0.6162326, 1.098196, 0.6853899, 0.4117647, 0, 1, 1,
0.6216041, -0.5884035, 2.199151, 0.4156863, 0, 1, 1,
0.6216763, 0.803354, 2.001384, 0.4235294, 0, 1, 1,
0.621928, 0.03021535, 1.887436, 0.427451, 0, 1, 1,
0.6234207, 0.4226914, 0.5641025, 0.4352941, 0, 1, 1,
0.6423998, -0.2775076, 3.192458, 0.4392157, 0, 1, 1,
0.6425486, 0.611434, 0.5619316, 0.4470588, 0, 1, 1,
0.6468756, 0.6129152, 0.2050688, 0.4509804, 0, 1, 1,
0.6487153, -0.01749565, 0.9599699, 0.4588235, 0, 1, 1,
0.6517634, 2.227212, -0.02161375, 0.4627451, 0, 1, 1,
0.652418, -0.7052948, 2.823019, 0.4705882, 0, 1, 1,
0.6537262, 1.060348, -0.1307884, 0.4745098, 0, 1, 1,
0.6551309, -0.647609, 1.399871, 0.4823529, 0, 1, 1,
0.6566389, -0.7842888, 2.000263, 0.4862745, 0, 1, 1,
0.6582435, 0.858022, 0.2368645, 0.4941176, 0, 1, 1,
0.6591833, 0.5617078, 0.5230582, 0.5019608, 0, 1, 1,
0.6624479, 1.178005, 0.1237786, 0.5058824, 0, 1, 1,
0.6637973, -1.491838, 2.738218, 0.5137255, 0, 1, 1,
0.6643674, 1.40101, -0.7604169, 0.5176471, 0, 1, 1,
0.6663184, 0.3338813, 2.517445, 0.5254902, 0, 1, 1,
0.6669667, 0.10058, -0.4292659, 0.5294118, 0, 1, 1,
0.6684281, 0.9855573, 0.9672944, 0.5372549, 0, 1, 1,
0.6750696, -0.004901278, 0.5857495, 0.5411765, 0, 1, 1,
0.675949, 0.3492735, 1.031529, 0.5490196, 0, 1, 1,
0.6818051, 0.0322506, 1.117186, 0.5529412, 0, 1, 1,
0.6884884, 0.1081927, 2.169703, 0.5607843, 0, 1, 1,
0.6941105, -0.01149205, 2.419678, 0.5647059, 0, 1, 1,
0.699993, 1.236014, 0.07950076, 0.572549, 0, 1, 1,
0.7005215, 1.242927, 0.7670121, 0.5764706, 0, 1, 1,
0.7008882, 0.3855002, -0.4582807, 0.5843138, 0, 1, 1,
0.7011507, -0.1905699, 2.832301, 0.5882353, 0, 1, 1,
0.7021641, -1.399019, 2.103701, 0.5960785, 0, 1, 1,
0.7038729, 1.304115, -0.5484579, 0.6039216, 0, 1, 1,
0.7086754, 0.6569299, 0.5931079, 0.6078432, 0, 1, 1,
0.7102273, 1.767745, -0.07297363, 0.6156863, 0, 1, 1,
0.7312371, 1.019532, 0.1606795, 0.6196079, 0, 1, 1,
0.7320045, 0.4145937, 1.552045, 0.627451, 0, 1, 1,
0.7401872, -0.721487, 2.487799, 0.6313726, 0, 1, 1,
0.743202, 1.140944, 0.5017529, 0.6392157, 0, 1, 1,
0.7471109, -2.393377, 3.585297, 0.6431373, 0, 1, 1,
0.7492279, -0.4667796, 3.07562, 0.6509804, 0, 1, 1,
0.7497504, -0.4593529, 1.459462, 0.654902, 0, 1, 1,
0.7510865, -0.01897025, 0.9696951, 0.6627451, 0, 1, 1,
0.771601, -0.3675166, 1.238905, 0.6666667, 0, 1, 1,
0.7734416, 1.314909, 1.288604, 0.6745098, 0, 1, 1,
0.7756867, -0.7465343, 3.158912, 0.6784314, 0, 1, 1,
0.7759655, 1.618736, -0.4281678, 0.6862745, 0, 1, 1,
0.7770417, 0.1027618, 1.900249, 0.6901961, 0, 1, 1,
0.7771896, 0.6563206, -0.103416, 0.6980392, 0, 1, 1,
0.7838868, 0.4668733, 1.467702, 0.7058824, 0, 1, 1,
0.7852715, 0.213276, 0.7972639, 0.7098039, 0, 1, 1,
0.7967063, -0.2912597, 0.2868015, 0.7176471, 0, 1, 1,
0.7992582, -0.2752235, 0.4063747, 0.7215686, 0, 1, 1,
0.8002494, 0.09418165, 0.6809635, 0.7294118, 0, 1, 1,
0.8029919, -1.418694, 3.370634, 0.7333333, 0, 1, 1,
0.8064298, -1.290118, 3.175324, 0.7411765, 0, 1, 1,
0.8067676, -1.325847, 2.626522, 0.7450981, 0, 1, 1,
0.8089154, -0.7792413, 1.991613, 0.7529412, 0, 1, 1,
0.8134673, -0.3314657, 3.342194, 0.7568628, 0, 1, 1,
0.8142684, -0.9645544, 2.015217, 0.7647059, 0, 1, 1,
0.8143145, -0.4937711, 2.029563, 0.7686275, 0, 1, 1,
0.8191807, -0.1432368, 3.585819, 0.7764706, 0, 1, 1,
0.8353603, -0.7044893, 3.077756, 0.7803922, 0, 1, 1,
0.8365199, 0.4931091, 1.985386, 0.7882353, 0, 1, 1,
0.8469917, -2.515745, 1.511022, 0.7921569, 0, 1, 1,
0.850698, 0.4057865, 2.112359, 0.8, 0, 1, 1,
0.8524913, -0.8817337, 2.523103, 0.8078431, 0, 1, 1,
0.8550808, -0.4047153, 2.058276, 0.8117647, 0, 1, 1,
0.8635429, 1.741317, 1.536981, 0.8196079, 0, 1, 1,
0.8729939, -0.6995844, 0.3565053, 0.8235294, 0, 1, 1,
0.8782685, 0.04516869, 5.093315, 0.8313726, 0, 1, 1,
0.890259, -0.1474191, 3.566118, 0.8352941, 0, 1, 1,
0.8952242, -0.4185883, 1.451481, 0.8431373, 0, 1, 1,
0.9046443, 0.5716488, 1.720621, 0.8470588, 0, 1, 1,
0.9070885, 0.5477399, 2.463852, 0.854902, 0, 1, 1,
0.9076877, -0.06602601, 4.402554, 0.8588235, 0, 1, 1,
0.9083498, 1.031899, 0.7410428, 0.8666667, 0, 1, 1,
0.927292, -0.7626597, 2.802367, 0.8705882, 0, 1, 1,
0.9289311, 0.5907797, -0.03770215, 0.8784314, 0, 1, 1,
0.9327475, 0.5423557, 0.7123237, 0.8823529, 0, 1, 1,
0.9327975, 1.011466, -0.8393976, 0.8901961, 0, 1, 1,
0.9376791, 1.092984, 0.1018648, 0.8941177, 0, 1, 1,
0.9435179, -0.2609932, 2.129755, 0.9019608, 0, 1, 1,
0.9497391, -0.3982564, 1.324522, 0.9098039, 0, 1, 1,
0.9501796, 0.6782897, 1.187212, 0.9137255, 0, 1, 1,
0.9573022, 0.6196749, 1.255169, 0.9215686, 0, 1, 1,
0.9581362, 0.4306341, 2.211535, 0.9254902, 0, 1, 1,
0.960102, -0.2395454, 2.041616, 0.9333333, 0, 1, 1,
0.9687911, 0.236569, 0.6914701, 0.9372549, 0, 1, 1,
0.9706789, -0.01154106, 0.6670656, 0.945098, 0, 1, 1,
0.972424, 0.5856003, -0.5624343, 0.9490196, 0, 1, 1,
0.9784734, -0.3845886, 0.824542, 0.9568627, 0, 1, 1,
0.9818454, -1.609269, 2.39921, 0.9607843, 0, 1, 1,
0.9836826, -0.3758621, 0.1850326, 0.9686275, 0, 1, 1,
0.991209, 1.076025, 0.2424032, 0.972549, 0, 1, 1,
0.992029, 0.1283099, 1.156882, 0.9803922, 0, 1, 1,
1.00028, -0.6207635, 3.726995, 0.9843137, 0, 1, 1,
1.01004, 0.04979423, 1.519052, 0.9921569, 0, 1, 1,
1.010316, -0.5176723, 2.366408, 0.9960784, 0, 1, 1,
1.011266, -0.350704, 4.043221, 1, 0, 0.9960784, 1,
1.011558, -0.1040736, 2.755431, 1, 0, 0.9882353, 1,
1.016263, -0.08542299, 1.794409, 1, 0, 0.9843137, 1,
1.020224, 0.5084816, 0.7747644, 1, 0, 0.9764706, 1,
1.024177, -0.3848216, 0.5181569, 1, 0, 0.972549, 1,
1.025756, -0.2548051, 1.284409, 1, 0, 0.9647059, 1,
1.033885, 0.3635084, 1.028463, 1, 0, 0.9607843, 1,
1.035131, -1.807583, 3.221224, 1, 0, 0.9529412, 1,
1.042173, -0.7986174, 3.648533, 1, 0, 0.9490196, 1,
1.051746, 1.591817, 1.720648, 1, 0, 0.9411765, 1,
1.060892, -1.144467, 1.709968, 1, 0, 0.9372549, 1,
1.065071, 0.02777753, 3.472625, 1, 0, 0.9294118, 1,
1.067316, -1.026645, 2.03372, 1, 0, 0.9254902, 1,
1.069177, -0.2467694, 1.764364, 1, 0, 0.9176471, 1,
1.072393, -0.4201593, 1.857623, 1, 0, 0.9137255, 1,
1.072941, -0.521847, 2.146436, 1, 0, 0.9058824, 1,
1.084183, -1.019705, 1.985809, 1, 0, 0.9019608, 1,
1.090011, 0.3730854, 0.5210836, 1, 0, 0.8941177, 1,
1.095913, 0.8839021, 1.514631, 1, 0, 0.8862745, 1,
1.100118, 1.020759, 1.26317, 1, 0, 0.8823529, 1,
1.100798, 0.2839154, 1.189742, 1, 0, 0.8745098, 1,
1.102261, 0.003249769, 0.93668, 1, 0, 0.8705882, 1,
1.10813, 0.9289099, 0.3710517, 1, 0, 0.8627451, 1,
1.111172, -1.446707, 3.114855, 1, 0, 0.8588235, 1,
1.12051, -0.3826359, 1.97768, 1, 0, 0.8509804, 1,
1.126015, 1.310893, 0.6764824, 1, 0, 0.8470588, 1,
1.133815, 1.200508, -1.050119, 1, 0, 0.8392157, 1,
1.136337, -0.9771118, 2.204091, 1, 0, 0.8352941, 1,
1.153704, 1.64273, 1.387288, 1, 0, 0.827451, 1,
1.155883, -1.857047, 1.63799, 1, 0, 0.8235294, 1,
1.163179, 1.062871, 0.3141548, 1, 0, 0.8156863, 1,
1.164355, -1.133955, 3.197914, 1, 0, 0.8117647, 1,
1.167902, 2.269637, -1.087745, 1, 0, 0.8039216, 1,
1.174687, -0.262315, 2.891176, 1, 0, 0.7960784, 1,
1.176506, -0.8249336, 2.100403, 1, 0, 0.7921569, 1,
1.180102, -0.1895619, 1.905457, 1, 0, 0.7843137, 1,
1.18132, 1.841756, 0.08581336, 1, 0, 0.7803922, 1,
1.188117, -0.4119415, 3.329894, 1, 0, 0.772549, 1,
1.19419, 0.6509807, 0.6847975, 1, 0, 0.7686275, 1,
1.203779, -0.5961314, 2.170433, 1, 0, 0.7607843, 1,
1.21264, 0.7780787, 1.207059, 1, 0, 0.7568628, 1,
1.213178, -0.3549796, -0.4581873, 1, 0, 0.7490196, 1,
1.214165, 0.8239402, 1.112074, 1, 0, 0.7450981, 1,
1.216719, 0.1991945, -0.8948449, 1, 0, 0.7372549, 1,
1.217054, 0.8694137, 1.146973, 1, 0, 0.7333333, 1,
1.217635, 0.8145047, 0.3403704, 1, 0, 0.7254902, 1,
1.219049, 0.06885003, 2.899126, 1, 0, 0.7215686, 1,
1.221015, 0.569764, 0.7555115, 1, 0, 0.7137255, 1,
1.224321, -1.005159, 4.002605, 1, 0, 0.7098039, 1,
1.228158, 1.24892, 1.746993, 1, 0, 0.7019608, 1,
1.229275, -0.221245, 2.650453, 1, 0, 0.6941177, 1,
1.241313, 0.2176215, 2.630169, 1, 0, 0.6901961, 1,
1.242456, -0.9586424, 2.093316, 1, 0, 0.682353, 1,
1.242739, 1.075683, 1.510552, 1, 0, 0.6784314, 1,
1.249967, -0.923664, 4.338113, 1, 0, 0.6705883, 1,
1.26091, 0.2829642, 1.34519, 1, 0, 0.6666667, 1,
1.264362, 0.5241843, 1.637403, 1, 0, 0.6588235, 1,
1.267125, 1.514713, 2.198392, 1, 0, 0.654902, 1,
1.270334, 0.2400461, -1.04711, 1, 0, 0.6470588, 1,
1.272331, -0.6392752, 2.38727, 1, 0, 0.6431373, 1,
1.275375, 0.3075897, 2.727662, 1, 0, 0.6352941, 1,
1.281024, -0.4864512, 2.918112, 1, 0, 0.6313726, 1,
1.289506, -1.048734, 0.5821652, 1, 0, 0.6235294, 1,
1.295054, -1.499373, 4.294372, 1, 0, 0.6196079, 1,
1.303861, 0.8795261, 1.109517, 1, 0, 0.6117647, 1,
1.307068, 0.8992984, 1.540068, 1, 0, 0.6078432, 1,
1.337045, 1.06853, 0.03536762, 1, 0, 0.6, 1,
1.343938, -1.649775, 1.360604, 1, 0, 0.5921569, 1,
1.345606, 0.6098947, 2.627854, 1, 0, 0.5882353, 1,
1.353454, -0.5230548, 1.26367, 1, 0, 0.5803922, 1,
1.358402, 1.823561, -0.02438155, 1, 0, 0.5764706, 1,
1.363104, 0.6494914, 2.212019, 1, 0, 0.5686275, 1,
1.363717, 0.2628866, 1.201964, 1, 0, 0.5647059, 1,
1.368138, -1.819605, 0.2260342, 1, 0, 0.5568628, 1,
1.370829, 1.013478, 2.182054, 1, 0, 0.5529412, 1,
1.378053, -0.31714, 2.931882, 1, 0, 0.5450981, 1,
1.390916, -0.6933775, 1.522178, 1, 0, 0.5411765, 1,
1.391035, -0.4183902, 2.877214, 1, 0, 0.5333334, 1,
1.391162, -0.2523419, 2.994345, 1, 0, 0.5294118, 1,
1.399701, -0.9762954, 2.725653, 1, 0, 0.5215687, 1,
1.400336, -1.133958, 1.93863, 1, 0, 0.5176471, 1,
1.400471, -1.093809, 3.867484, 1, 0, 0.509804, 1,
1.403825, -0.4343624, 2.800277, 1, 0, 0.5058824, 1,
1.408166, -0.6634715, 4.205516, 1, 0, 0.4980392, 1,
1.41407, -0.815469, 1.360404, 1, 0, 0.4901961, 1,
1.42548, 0.9274098, 1.945444, 1, 0, 0.4862745, 1,
1.427022, -0.1948569, 0.9526427, 1, 0, 0.4784314, 1,
1.430812, -1.440281, 2.501483, 1, 0, 0.4745098, 1,
1.447198, -0.9535022, 2.565917, 1, 0, 0.4666667, 1,
1.471454, 1.339007, 0.949288, 1, 0, 0.4627451, 1,
1.479483, 0.5701794, 1.114766, 1, 0, 0.454902, 1,
1.482536, 1.442969, 0.9476438, 1, 0, 0.4509804, 1,
1.486083, 0.1966828, -0.04649439, 1, 0, 0.4431373, 1,
1.492286, -0.06705426, 2.235952, 1, 0, 0.4392157, 1,
1.498822, -0.2866505, 3.495153, 1, 0, 0.4313726, 1,
1.499915, -0.8600962, 0.5973922, 1, 0, 0.427451, 1,
1.506985, -0.6976177, 3.748497, 1, 0, 0.4196078, 1,
1.508572, 0.9750504, 2.11737, 1, 0, 0.4156863, 1,
1.51327, -1.537197, 1.350798, 1, 0, 0.4078431, 1,
1.519657, 0.1475684, 2.282852, 1, 0, 0.4039216, 1,
1.519742, 1.703788, 0.890543, 1, 0, 0.3960784, 1,
1.540391, 1.819917, -1.013097, 1, 0, 0.3882353, 1,
1.543674, 0.2339274, 2.349175, 1, 0, 0.3843137, 1,
1.550507, -0.2822727, 1.616809, 1, 0, 0.3764706, 1,
1.556486, 0.2092572, 0.7832895, 1, 0, 0.372549, 1,
1.574816, 0.1293007, 0.7546062, 1, 0, 0.3647059, 1,
1.58177, -0.9936332, 1.681155, 1, 0, 0.3607843, 1,
1.595476, -1.023955, 1.842284, 1, 0, 0.3529412, 1,
1.616693, -1.346981, 2.040381, 1, 0, 0.3490196, 1,
1.62246, -0.7850417, 3.812966, 1, 0, 0.3411765, 1,
1.631449, -2.123899, 3.024137, 1, 0, 0.3372549, 1,
1.655268, -0.1536192, 2.158756, 1, 0, 0.3294118, 1,
1.664829, -1.704941, 3.16592, 1, 0, 0.3254902, 1,
1.67045, 2.523939, 0.4877874, 1, 0, 0.3176471, 1,
1.681016, 2.333077, 0.04404987, 1, 0, 0.3137255, 1,
1.689611, -0.4797457, 1.91278, 1, 0, 0.3058824, 1,
1.69083, -0.5032997, 1.559887, 1, 0, 0.2980392, 1,
1.703979, 1.46951, 1.524714, 1, 0, 0.2941177, 1,
1.726111, -0.8575909, 1.925718, 1, 0, 0.2862745, 1,
1.736015, 0.5205631, -0.778843, 1, 0, 0.282353, 1,
1.737375, 0.5686091, 1.924948, 1, 0, 0.2745098, 1,
1.739315, -0.3357969, 2.978616, 1, 0, 0.2705882, 1,
1.761463, -1.467102, 2.200456, 1, 0, 0.2627451, 1,
1.77384, -0.06222939, 2.659061, 1, 0, 0.2588235, 1,
1.786526, -0.8566882, 1.855174, 1, 0, 0.2509804, 1,
1.801526, -0.03709888, 1.751953, 1, 0, 0.2470588, 1,
1.826582, -0.8675902, 2.417831, 1, 0, 0.2392157, 1,
1.837625, 0.7137746, 0.1231052, 1, 0, 0.2352941, 1,
1.867427, 0.8277513, 1.489429, 1, 0, 0.227451, 1,
1.873281, -0.3055258, 2.360874, 1, 0, 0.2235294, 1,
1.875752, 0.3080418, 0.5018629, 1, 0, 0.2156863, 1,
1.879084, -0.5849133, 1.142838, 1, 0, 0.2117647, 1,
1.89738, -0.7159176, 0.2458339, 1, 0, 0.2039216, 1,
1.90878, -0.8132225, 2.767752, 1, 0, 0.1960784, 1,
1.939113, 1.062322, 0.4671534, 1, 0, 0.1921569, 1,
1.964343, -0.9520372, 1.536643, 1, 0, 0.1843137, 1,
1.974727, 1.864002, 1.353677, 1, 0, 0.1803922, 1,
1.983421, 0.8913186, 1.833613, 1, 0, 0.172549, 1,
1.99223, 1.091812, 0.7326788, 1, 0, 0.1686275, 1,
2.008995, -0.2608332, 0.9938964, 1, 0, 0.1607843, 1,
2.010154, -0.07626557, 1.301134, 1, 0, 0.1568628, 1,
2.056148, 0.8558712, 1.45116, 1, 0, 0.1490196, 1,
2.07667, -0.1597296, 1.541605, 1, 0, 0.145098, 1,
2.089237, -0.9556554, 2.181338, 1, 0, 0.1372549, 1,
2.096819, 0.6289197, 1.180235, 1, 0, 0.1333333, 1,
2.11694, 0.01365069, 1.160982, 1, 0, 0.1254902, 1,
2.126514, 1.363803, 0.9150854, 1, 0, 0.1215686, 1,
2.164089, 0.951055, 2.942538, 1, 0, 0.1137255, 1,
2.170986, -0.8349655, 3.253701, 1, 0, 0.1098039, 1,
2.248117, 0.3624123, -0.8202971, 1, 0, 0.1019608, 1,
2.27571, -1.149339, 1.720738, 1, 0, 0.09411765, 1,
2.284484, -0.2662767, 0.4068555, 1, 0, 0.09019608, 1,
2.297116, -0.7914963, 0.9088861, 1, 0, 0.08235294, 1,
2.425484, 0.08734082, 1.793224, 1, 0, 0.07843138, 1,
2.440175, 1.154337, 1.710963, 1, 0, 0.07058824, 1,
2.461833, 1.660836, 0.646893, 1, 0, 0.06666667, 1,
2.465877, 1.530596, 2.888372, 1, 0, 0.05882353, 1,
2.466796, -1.742529, 2.481977, 1, 0, 0.05490196, 1,
2.470138, -0.3498372, 1.573298, 1, 0, 0.04705882, 1,
2.496456, -0.5056021, 1.496606, 1, 0, 0.04313726, 1,
2.535468, -0.2783994, 1.799665, 1, 0, 0.03529412, 1,
2.597152, 1.518629, 1.557478, 1, 0, 0.03137255, 1,
2.708685, -0.1083828, 2.539065, 1, 0, 0.02352941, 1,
2.729166, 0.2011489, 3.378608, 1, 0, 0.01960784, 1,
3.091323, -0.3696583, 1.873312, 1, 0, 0.01176471, 1,
3.101469, 0.1605871, 0.5393708, 1, 0, 0.007843138, 1
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
0.009221315, -4.453122, -8.425801, 0, -0.5, 0.5, 0.5,
0.009221315, -4.453122, -8.425801, 1, -0.5, 0.5, 0.5,
0.009221315, -4.453122, -8.425801, 1, 1.5, 0.5, 0.5,
0.009221315, -4.453122, -8.425801, 0, 1.5, 0.5, 0.5
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
-4.131299, -0.1986704, -8.425801, 0, -0.5, 0.5, 0.5,
-4.131299, -0.1986704, -8.425801, 1, -0.5, 0.5, 0.5,
-4.131299, -0.1986704, -8.425801, 1, 1.5, 0.5, 0.5,
-4.131299, -0.1986704, -8.425801, 0, 1.5, 0.5, 0.5
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
-4.131299, -4.453122, -0.3047476, 0, -0.5, 0.5, 0.5,
-4.131299, -4.453122, -0.3047476, 1, -0.5, 0.5, 0.5,
-4.131299, -4.453122, -0.3047476, 1, 1.5, 0.5, 0.5,
-4.131299, -4.453122, -0.3047476, 0, 1.5, 0.5, 0.5
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
-3, -3.471325, -6.551712,
3, -3.471325, -6.551712,
-3, -3.471325, -6.551712,
-3, -3.634958, -6.86406,
-2, -3.471325, -6.551712,
-2, -3.634958, -6.86406,
-1, -3.471325, -6.551712,
-1, -3.634958, -6.86406,
0, -3.471325, -6.551712,
0, -3.634958, -6.86406,
1, -3.471325, -6.551712,
1, -3.634958, -6.86406,
2, -3.471325, -6.551712,
2, -3.634958, -6.86406,
3, -3.471325, -6.551712,
3, -3.634958, -6.86406
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
-3, -3.962224, -7.488757, 0, -0.5, 0.5, 0.5,
-3, -3.962224, -7.488757, 1, -0.5, 0.5, 0.5,
-3, -3.962224, -7.488757, 1, 1.5, 0.5, 0.5,
-3, -3.962224, -7.488757, 0, 1.5, 0.5, 0.5,
-2, -3.962224, -7.488757, 0, -0.5, 0.5, 0.5,
-2, -3.962224, -7.488757, 1, -0.5, 0.5, 0.5,
-2, -3.962224, -7.488757, 1, 1.5, 0.5, 0.5,
-2, -3.962224, -7.488757, 0, 1.5, 0.5, 0.5,
-1, -3.962224, -7.488757, 0, -0.5, 0.5, 0.5,
-1, -3.962224, -7.488757, 1, -0.5, 0.5, 0.5,
-1, -3.962224, -7.488757, 1, 1.5, 0.5, 0.5,
-1, -3.962224, -7.488757, 0, 1.5, 0.5, 0.5,
0, -3.962224, -7.488757, 0, -0.5, 0.5, 0.5,
0, -3.962224, -7.488757, 1, -0.5, 0.5, 0.5,
0, -3.962224, -7.488757, 1, 1.5, 0.5, 0.5,
0, -3.962224, -7.488757, 0, 1.5, 0.5, 0.5,
1, -3.962224, -7.488757, 0, -0.5, 0.5, 0.5,
1, -3.962224, -7.488757, 1, -0.5, 0.5, 0.5,
1, -3.962224, -7.488757, 1, 1.5, 0.5, 0.5,
1, -3.962224, -7.488757, 0, 1.5, 0.5, 0.5,
2, -3.962224, -7.488757, 0, -0.5, 0.5, 0.5,
2, -3.962224, -7.488757, 1, -0.5, 0.5, 0.5,
2, -3.962224, -7.488757, 1, 1.5, 0.5, 0.5,
2, -3.962224, -7.488757, 0, 1.5, 0.5, 0.5,
3, -3.962224, -7.488757, 0, -0.5, 0.5, 0.5,
3, -3.962224, -7.488757, 1, -0.5, 0.5, 0.5,
3, -3.962224, -7.488757, 1, 1.5, 0.5, 0.5,
3, -3.962224, -7.488757, 0, 1.5, 0.5, 0.5
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
-3.175794, -3, -6.551712,
-3.175794, 2, -6.551712,
-3.175794, -3, -6.551712,
-3.335045, -3, -6.86406,
-3.175794, -2, -6.551712,
-3.335045, -2, -6.86406,
-3.175794, -1, -6.551712,
-3.335045, -1, -6.86406,
-3.175794, 0, -6.551712,
-3.335045, 0, -6.86406,
-3.175794, 1, -6.551712,
-3.335045, 1, -6.86406,
-3.175794, 2, -6.551712,
-3.335045, 2, -6.86406
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
-3.653546, -3, -7.488757, 0, -0.5, 0.5, 0.5,
-3.653546, -3, -7.488757, 1, -0.5, 0.5, 0.5,
-3.653546, -3, -7.488757, 1, 1.5, 0.5, 0.5,
-3.653546, -3, -7.488757, 0, 1.5, 0.5, 0.5,
-3.653546, -2, -7.488757, 0, -0.5, 0.5, 0.5,
-3.653546, -2, -7.488757, 1, -0.5, 0.5, 0.5,
-3.653546, -2, -7.488757, 1, 1.5, 0.5, 0.5,
-3.653546, -2, -7.488757, 0, 1.5, 0.5, 0.5,
-3.653546, -1, -7.488757, 0, -0.5, 0.5, 0.5,
-3.653546, -1, -7.488757, 1, -0.5, 0.5, 0.5,
-3.653546, -1, -7.488757, 1, 1.5, 0.5, 0.5,
-3.653546, -1, -7.488757, 0, 1.5, 0.5, 0.5,
-3.653546, 0, -7.488757, 0, -0.5, 0.5, 0.5,
-3.653546, 0, -7.488757, 1, -0.5, 0.5, 0.5,
-3.653546, 0, -7.488757, 1, 1.5, 0.5, 0.5,
-3.653546, 0, -7.488757, 0, 1.5, 0.5, 0.5,
-3.653546, 1, -7.488757, 0, -0.5, 0.5, 0.5,
-3.653546, 1, -7.488757, 1, -0.5, 0.5, 0.5,
-3.653546, 1, -7.488757, 1, 1.5, 0.5, 0.5,
-3.653546, 1, -7.488757, 0, 1.5, 0.5, 0.5,
-3.653546, 2, -7.488757, 0, -0.5, 0.5, 0.5,
-3.653546, 2, -7.488757, 1, -0.5, 0.5, 0.5,
-3.653546, 2, -7.488757, 1, 1.5, 0.5, 0.5,
-3.653546, 2, -7.488757, 0, 1.5, 0.5, 0.5
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
-3.175794, -3.471325, -6,
-3.175794, -3.471325, 4,
-3.175794, -3.471325, -6,
-3.335045, -3.634958, -6,
-3.175794, -3.471325, -4,
-3.335045, -3.634958, -4,
-3.175794, -3.471325, -2,
-3.335045, -3.634958, -2,
-3.175794, -3.471325, 0,
-3.335045, -3.634958, 0,
-3.175794, -3.471325, 2,
-3.335045, -3.634958, 2,
-3.175794, -3.471325, 4,
-3.335045, -3.634958, 4
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
"-6",
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
-3.653546, -3.962224, -6, 0, -0.5, 0.5, 0.5,
-3.653546, -3.962224, -6, 1, -0.5, 0.5, 0.5,
-3.653546, -3.962224, -6, 1, 1.5, 0.5, 0.5,
-3.653546, -3.962224, -6, 0, 1.5, 0.5, 0.5,
-3.653546, -3.962224, -4, 0, -0.5, 0.5, 0.5,
-3.653546, -3.962224, -4, 1, -0.5, 0.5, 0.5,
-3.653546, -3.962224, -4, 1, 1.5, 0.5, 0.5,
-3.653546, -3.962224, -4, 0, 1.5, 0.5, 0.5,
-3.653546, -3.962224, -2, 0, -0.5, 0.5, 0.5,
-3.653546, -3.962224, -2, 1, -0.5, 0.5, 0.5,
-3.653546, -3.962224, -2, 1, 1.5, 0.5, 0.5,
-3.653546, -3.962224, -2, 0, 1.5, 0.5, 0.5,
-3.653546, -3.962224, 0, 0, -0.5, 0.5, 0.5,
-3.653546, -3.962224, 0, 1, -0.5, 0.5, 0.5,
-3.653546, -3.962224, 0, 1, 1.5, 0.5, 0.5,
-3.653546, -3.962224, 0, 0, 1.5, 0.5, 0.5,
-3.653546, -3.962224, 2, 0, -0.5, 0.5, 0.5,
-3.653546, -3.962224, 2, 1, -0.5, 0.5, 0.5,
-3.653546, -3.962224, 2, 1, 1.5, 0.5, 0.5,
-3.653546, -3.962224, 2, 0, 1.5, 0.5, 0.5,
-3.653546, -3.962224, 4, 0, -0.5, 0.5, 0.5,
-3.653546, -3.962224, 4, 1, -0.5, 0.5, 0.5,
-3.653546, -3.962224, 4, 1, 1.5, 0.5, 0.5,
-3.653546, -3.962224, 4, 0, 1.5, 0.5, 0.5
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
-3.175794, -3.471325, -6.551712,
-3.175794, 3.073984, -6.551712,
-3.175794, -3.471325, 5.942217,
-3.175794, 3.073984, 5.942217,
-3.175794, -3.471325, -6.551712,
-3.175794, -3.471325, 5.942217,
-3.175794, 3.073984, -6.551712,
-3.175794, 3.073984, 5.942217,
-3.175794, -3.471325, -6.551712,
3.194237, -3.471325, -6.551712,
-3.175794, -3.471325, 5.942217,
3.194237, -3.471325, 5.942217,
-3.175794, 3.073984, -6.551712,
3.194237, 3.073984, -6.551712,
-3.175794, 3.073984, 5.942217,
3.194237, 3.073984, 5.942217,
3.194237, -3.471325, -6.551712,
3.194237, 3.073984, -6.551712,
3.194237, -3.471325, 5.942217,
3.194237, 3.073984, 5.942217,
3.194237, -3.471325, -6.551712,
3.194237, -3.471325, 5.942217,
3.194237, 3.073984, -6.551712,
3.194237, 3.073984, 5.942217
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
var radius = 8.264057;
var distance = 36.76772;
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
mvMatrix.translate( -0.009221315, 0.1986704, 0.3047476 );
mvMatrix.scale( 1.402703, 1.365139, 0.7151682 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -36.76772);
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
gl.drawArrays(gl.LINES, 0, 14);
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
gl.drawElements(gl.TRIANGLES, 36, gl.UNSIGNED_SHORT, 0);
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
fenarimol<-read.table("fenarimol.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fenarimol$V2
```

```
## Error in eval(expr, envir, enclos): object 'fenarimol' not found
```

```r
y<-fenarimol$V3
```

```
## Error in eval(expr, envir, enclos): object 'fenarimol' not found
```

```r
z<-fenarimol$V4
```

```
## Error in eval(expr, envir, enclos): object 'fenarimol' not found
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
-3.083026, -1.399182, -1.165954, 0, 0, 1, 1, 1,
-2.904122, 0.2025382, -1.24853, 1, 0, 0, 1, 1,
-2.886469, -1.926084, -1.39681, 1, 0, 0, 1, 1,
-2.786429, -0.843095, -1.143436, 1, 0, 0, 1, 1,
-2.714162, 1.233217, -0.9334931, 1, 0, 0, 1, 1,
-2.620337, -0.842898, -2.445787, 1, 0, 0, 1, 1,
-2.51581, -1.220354, -2.685047, 0, 0, 0, 1, 1,
-2.436122, 0.2903852, -1.20523, 0, 0, 0, 1, 1,
-2.295649, -0.4235948, -3.203792, 0, 0, 0, 1, 1,
-2.292346, 0.6166276, -0.6172048, 0, 0, 0, 1, 1,
-2.266722, -0.8878737, -1.011215, 0, 0, 0, 1, 1,
-2.209803, 0.5520214, -1.770325, 0, 0, 0, 1, 1,
-2.198015, -1.038828, -2.514657, 0, 0, 0, 1, 1,
-2.193496, -0.9356037, -4.381601, 1, 1, 1, 1, 1,
-2.079233, -1.659606, -4.631307, 1, 1, 1, 1, 1,
-2.033063, 1.224946, -0.5303628, 1, 1, 1, 1, 1,
-2.032695, -0.6804988, -1.78678, 1, 1, 1, 1, 1,
-2.028906, 1.06727, -0.6083804, 1, 1, 1, 1, 1,
-2.020561, -1.149932, -2.570519, 1, 1, 1, 1, 1,
-2.004452, 2.084003, -0.1724294, 1, 1, 1, 1, 1,
-2.000758, 0.9142884, -1.327964, 1, 1, 1, 1, 1,
-1.993621, 0.1219261, -1.290502, 1, 1, 1, 1, 1,
-1.982759, -0.8081321, -1.842459, 1, 1, 1, 1, 1,
-1.972188, -0.3986065, -1.929119, 1, 1, 1, 1, 1,
-1.969398, -1.472319, -2.11442, 1, 1, 1, 1, 1,
-1.959452, -0.3281708, -0.7459779, 1, 1, 1, 1, 1,
-1.944939, -1.223605, -1.302835, 1, 1, 1, 1, 1,
-1.891912, -0.4646884, -1.15198, 1, 1, 1, 1, 1,
-1.887928, -1.311037, -0.4852644, 0, 0, 1, 1, 1,
-1.877504, 1.897974, -1.093767, 1, 0, 0, 1, 1,
-1.873344, 0.8205481, 0.1628868, 1, 0, 0, 1, 1,
-1.870265, -1.200773, -2.46651, 1, 0, 0, 1, 1,
-1.86031, -0.323696, -2.660817, 1, 0, 0, 1, 1,
-1.824718, -0.1667004, -1.683165, 1, 0, 0, 1, 1,
-1.807643, -1.615313, -1.476507, 0, 0, 0, 1, 1,
-1.780967, -0.05912229, -0.5332891, 0, 0, 0, 1, 1,
-1.776184, 0.02406387, -3.411235, 0, 0, 0, 1, 1,
-1.764642, -0.05205188, -1.844429, 0, 0, 0, 1, 1,
-1.749764, -3.376005, -2.225128, 0, 0, 0, 1, 1,
-1.741628, 1.661722, -1.208403, 0, 0, 0, 1, 1,
-1.732083, -0.7029292, -1.922269, 0, 0, 0, 1, 1,
-1.71156, 0.537235, -1.181596, 1, 1, 1, 1, 1,
-1.703935, 0.1617133, -1.581169, 1, 1, 1, 1, 1,
-1.680111, -1.38415, -1.675243, 1, 1, 1, 1, 1,
-1.679207, -0.1207503, -0.1804386, 1, 1, 1, 1, 1,
-1.673527, -0.3842448, -0.8113965, 1, 1, 1, 1, 1,
-1.670875, 0.5453137, -0.6085683, 1, 1, 1, 1, 1,
-1.664707, -0.2232086, -2.538286, 1, 1, 1, 1, 1,
-1.66192, -1.065547, -0.6523718, 1, 1, 1, 1, 1,
-1.652903, 1.14889, -1.550239, 1, 1, 1, 1, 1,
-1.641297, 1.137373, -0.242679, 1, 1, 1, 1, 1,
-1.627553, 0.9636151, -0.1678723, 1, 1, 1, 1, 1,
-1.62501, -0.9901369, -3.877428, 1, 1, 1, 1, 1,
-1.624159, 0.3393609, -1.727703, 1, 1, 1, 1, 1,
-1.603763, 0.3846222, -0.3200629, 1, 1, 1, 1, 1,
-1.600904, -0.5069743, -1.750746, 1, 1, 1, 1, 1,
-1.596843, 1.083187, -1.685597, 0, 0, 1, 1, 1,
-1.57322, -1.784861, -2.457398, 1, 0, 0, 1, 1,
-1.565195, -0.4576359, -2.170414, 1, 0, 0, 1, 1,
-1.547429, -0.4237302, -1.446675, 1, 0, 0, 1, 1,
-1.546151, -0.01213161, -2.74798, 1, 0, 0, 1, 1,
-1.539343, -0.3105801, -3.97944, 1, 0, 0, 1, 1,
-1.525724, 1.202622, -0.9691623, 0, 0, 0, 1, 1,
-1.518018, -0.01794163, -0.1800893, 0, 0, 0, 1, 1,
-1.510446, 0.1160678, -1.258276, 0, 0, 0, 1, 1,
-1.509704, -0.6157364, -2.286982, 0, 0, 0, 1, 1,
-1.506538, 0.363595, -0.1049668, 0, 0, 0, 1, 1,
-1.496388, -1.290091, -1.568879, 0, 0, 0, 1, 1,
-1.494593, -0.2881697, -2.201243, 0, 0, 0, 1, 1,
-1.493487, 0.50269, -2.238138, 1, 1, 1, 1, 1,
-1.488661, -0.238048, -3.202326, 1, 1, 1, 1, 1,
-1.484102, 0.07420508, -3.596939, 1, 1, 1, 1, 1,
-1.47798, 0.6458193, -0.9378178, 1, 1, 1, 1, 1,
-1.468855, -0.1772139, 0.2491641, 1, 1, 1, 1, 1,
-1.468568, -2.477296, -2.782016, 1, 1, 1, 1, 1,
-1.460673, 1.372363, -0.9663727, 1, 1, 1, 1, 1,
-1.449663, -0.9261591, -4.216558, 1, 1, 1, 1, 1,
-1.44313, 0.1027198, -0.9886743, 1, 1, 1, 1, 1,
-1.442427, 0.4589888, -1.901143, 1, 1, 1, 1, 1,
-1.435033, 0.3284004, -1.921133, 1, 1, 1, 1, 1,
-1.433903, 0.5964813, -3.655044, 1, 1, 1, 1, 1,
-1.428931, -1.401723, -2.703075, 1, 1, 1, 1, 1,
-1.428409, 1.462966, -1.099646, 1, 1, 1, 1, 1,
-1.424371, 0.7000517, -0.3930478, 1, 1, 1, 1, 1,
-1.422485, -0.6289727, -2.606581, 0, 0, 1, 1, 1,
-1.408511, 1.216638, -1.210165, 1, 0, 0, 1, 1,
-1.391701, 0.9526167, 0.5021706, 1, 0, 0, 1, 1,
-1.383168, 1.484176, -0.8636678, 1, 0, 0, 1, 1,
-1.382122, -0.1970747, -2.271383, 1, 0, 0, 1, 1,
-1.372274, -0.05573312, -2.099206, 1, 0, 0, 1, 1,
-1.369165, 2.284889, -2.740404, 0, 0, 0, 1, 1,
-1.365083, 1.540157, -0.8856965, 0, 0, 0, 1, 1,
-1.358577, -0.1893813, -1.745704, 0, 0, 0, 1, 1,
-1.352648, 0.9732112, 0.3380159, 0, 0, 0, 1, 1,
-1.336518, -0.7501746, -1.794468, 0, 0, 0, 1, 1,
-1.334774, 0.7881757, -1.396612, 0, 0, 0, 1, 1,
-1.327678, 1.263727, -1.351449, 0, 0, 0, 1, 1,
-1.32355, -0.870369, -2.812637, 1, 1, 1, 1, 1,
-1.322972, 0.4831194, 0.06518856, 1, 1, 1, 1, 1,
-1.315934, 1.134275, -1.928334, 1, 1, 1, 1, 1,
-1.29967, 0.1827292, -1.96819, 1, 1, 1, 1, 1,
-1.299563, 1.732606, -1.44017, 1, 1, 1, 1, 1,
-1.291915, -1.349259, -1.432652, 1, 1, 1, 1, 1,
-1.274753, -1.340567, -2.732697, 1, 1, 1, 1, 1,
-1.272932, 0.04763791, -2.376808, 1, 1, 1, 1, 1,
-1.266354, 0.717934, -2.00724, 1, 1, 1, 1, 1,
-1.264552, 1.258577, -3.35838, 1, 1, 1, 1, 1,
-1.261948, 0.5168057, -2.476723, 1, 1, 1, 1, 1,
-1.256838, 2.071175, -1.458139, 1, 1, 1, 1, 1,
-1.254477, -1.987428, -4.232731, 1, 1, 1, 1, 1,
-1.253973, 0.09271897, -1.356228, 1, 1, 1, 1, 1,
-1.252455, -0.1435471, -2.825327, 1, 1, 1, 1, 1,
-1.241779, 0.9311147, -0.7996001, 0, 0, 1, 1, 1,
-1.240834, 0.434556, -1.646633, 1, 0, 0, 1, 1,
-1.237312, -0.8988436, -1.076641, 1, 0, 0, 1, 1,
-1.237234, 0.1770905, -1.681766, 1, 0, 0, 1, 1,
-1.227165, -0.2614537, -1.925595, 1, 0, 0, 1, 1,
-1.225358, 0.2701025, -0.7861806, 1, 0, 0, 1, 1,
-1.220863, -0.0371014, 0.7981202, 0, 0, 0, 1, 1,
-1.212652, -0.2483223, -1.336913, 0, 0, 0, 1, 1,
-1.211627, 0.9230044, -0.3408448, 0, 0, 0, 1, 1,
-1.207603, 0.009125842, -1.854675, 0, 0, 0, 1, 1,
-1.206449, -0.1481964, -1.705851, 0, 0, 0, 1, 1,
-1.204022, -0.53176, -2.038989, 0, 0, 0, 1, 1,
-1.200898, 0.04849123, -3.193455, 0, 0, 0, 1, 1,
-1.182081, 0.3182345, -1.113011, 1, 1, 1, 1, 1,
-1.179798, -0.02566566, -1.497701, 1, 1, 1, 1, 1,
-1.167166, 0.3744089, 0.5711422, 1, 1, 1, 1, 1,
-1.166536, -0.3566907, -1.599029, 1, 1, 1, 1, 1,
-1.165693, 0.5620147, -2.65707, 1, 1, 1, 1, 1,
-1.161223, 0.1572549, -0.3859587, 1, 1, 1, 1, 1,
-1.160208, 1.369316, -0.2041391, 1, 1, 1, 1, 1,
-1.15509, 1.079754, 0.6003886, 1, 1, 1, 1, 1,
-1.152668, -0.9531756, -2.349035, 1, 1, 1, 1, 1,
-1.134954, 0.1341918, -1.632637, 1, 1, 1, 1, 1,
-1.124653, -0.343215, -1.969586, 1, 1, 1, 1, 1,
-1.11795, -1.186306, -1.821546, 1, 1, 1, 1, 1,
-1.114055, -1.021604, -4.946609, 1, 1, 1, 1, 1,
-1.108661, 0.2180935, 0.7344432, 1, 1, 1, 1, 1,
-1.098081, -1.150705, -2.337256, 1, 1, 1, 1, 1,
-1.091916, -0.02612517, -1.117106, 0, 0, 1, 1, 1,
-1.089637, 0.5964379, -0.9149445, 1, 0, 0, 1, 1,
-1.088547, -0.9267929, -1.458226, 1, 0, 0, 1, 1,
-1.076659, 1.98672, -1.789831, 1, 0, 0, 1, 1,
-1.07416, -0.32016, -2.562771, 1, 0, 0, 1, 1,
-1.068332, 1.529715, -1.058021, 1, 0, 0, 1, 1,
-1.065474, 1.149827, 0.549486, 0, 0, 0, 1, 1,
-1.064734, -0.5139984, -2.581582, 0, 0, 0, 1, 1,
-1.057792, -1.533309, -3.396869, 0, 0, 0, 1, 1,
-1.044451, -0.03195704, -0.4373427, 0, 0, 0, 1, 1,
-1.040111, -0.2173132, -1.316069, 0, 0, 0, 1, 1,
-1.037137, 0.216534, -3.37527, 0, 0, 0, 1, 1,
-1.028499, 0.2535617, -0.7292943, 0, 0, 0, 1, 1,
-1.020294, 0.7706143, -2.183525, 1, 1, 1, 1, 1,
-1.020257, 1.824931, -0.784407, 1, 1, 1, 1, 1,
-1.007669, -0.9104774, -3.853243, 1, 1, 1, 1, 1,
-1.004964, 1.273442, -2.417939, 1, 1, 1, 1, 1,
-0.9985499, 0.1196758, -1.176616, 1, 1, 1, 1, 1,
-0.9917858, 0.8904377, -0.3214521, 1, 1, 1, 1, 1,
-0.9899407, 0.3791269, -2.714954, 1, 1, 1, 1, 1,
-0.9871204, 1.679283, -2.396212, 1, 1, 1, 1, 1,
-0.9797196, -0.7311831, -3.103438, 1, 1, 1, 1, 1,
-0.9627648, -0.8174134, -2.347941, 1, 1, 1, 1, 1,
-0.9619157, 0.1906768, -1.698538, 1, 1, 1, 1, 1,
-0.9618055, 0.09656569, -2.015602, 1, 1, 1, 1, 1,
-0.9599432, 0.7479448, 1.976979, 1, 1, 1, 1, 1,
-0.9597795, 0.2334759, -2.068212, 1, 1, 1, 1, 1,
-0.957747, -2.204714, -3.649936, 1, 1, 1, 1, 1,
-0.9576169, -0.299521, -1.161623, 0, 0, 1, 1, 1,
-0.95173, -0.4991882, -2.81567, 1, 0, 0, 1, 1,
-0.9517136, 0.7746807, -0.884909, 1, 0, 0, 1, 1,
-0.9487404, -1.377779, -1.610525, 1, 0, 0, 1, 1,
-0.9477711, -1.179787, -1.9964, 1, 0, 0, 1, 1,
-0.9413229, 0.2321167, -1.38053, 1, 0, 0, 1, 1,
-0.9356602, -0.2026917, 0.9324889, 0, 0, 0, 1, 1,
-0.9250405, -1.470391, -4.781281, 0, 0, 0, 1, 1,
-0.9225916, 1.397199, -1.104623, 0, 0, 0, 1, 1,
-0.9213916, 2.978664, -1.552464, 0, 0, 0, 1, 1,
-0.9143593, -0.8274022, -2.696334, 0, 0, 0, 1, 1,
-0.9123942, -0.826925, -1.99092, 0, 0, 0, 1, 1,
-0.9100063, -1.506465, -2.586169, 0, 0, 0, 1, 1,
-0.9062093, 1.183663, 0.3707949, 1, 1, 1, 1, 1,
-0.9053106, 1.345699, -0.3261494, 1, 1, 1, 1, 1,
-0.8979928, -0.7051392, -4.031407, 1, 1, 1, 1, 1,
-0.8924133, -0.632025, -1.990242, 1, 1, 1, 1, 1,
-0.8870655, -0.6379319, -2.05658, 1, 1, 1, 1, 1,
-0.8751945, -0.1163554, -1.130611, 1, 1, 1, 1, 1,
-0.8749632, -0.01463342, -2.283451, 1, 1, 1, 1, 1,
-0.868357, -1.875633, -3.736768, 1, 1, 1, 1, 1,
-0.8679432, 0.1865987, 0.3129946, 1, 1, 1, 1, 1,
-0.8677786, 0.1249939, -0.7227809, 1, 1, 1, 1, 1,
-0.8662366, -0.9671602, -2.046141, 1, 1, 1, 1, 1,
-0.8656731, -0.6755837, -1.072665, 1, 1, 1, 1, 1,
-0.8648543, -0.4952255, -1.659276, 1, 1, 1, 1, 1,
-0.8646778, 0.9541233, -0.8583484, 1, 1, 1, 1, 1,
-0.8496285, -0.5676067, -1.412761, 1, 1, 1, 1, 1,
-0.8480823, 0.7341528, -1.810238, 0, 0, 1, 1, 1,
-0.8437225, 2.042269, -2.291927, 1, 0, 0, 1, 1,
-0.8431114, 0.4008337, -0.9158548, 1, 0, 0, 1, 1,
-0.8416449, -0.4416652, -1.129222, 1, 0, 0, 1, 1,
-0.8377348, 0.3367791, -1.662109, 1, 0, 0, 1, 1,
-0.8349447, -1.074811, -3.516914, 1, 0, 0, 1, 1,
-0.8344691, -0.1606902, -1.989711, 0, 0, 0, 1, 1,
-0.8337878, 0.8142669, -1.549974, 0, 0, 0, 1, 1,
-0.8325982, -0.1817058, -2.999189, 0, 0, 0, 1, 1,
-0.8297335, 0.2563982, -1.858171, 0, 0, 0, 1, 1,
-0.8281563, 0.09095823, -0.5259565, 0, 0, 0, 1, 1,
-0.8240187, 0.7608636, -0.3564001, 0, 0, 0, 1, 1,
-0.8163972, 1.426417, -2.477648, 0, 0, 0, 1, 1,
-0.8157323, 1.526702, -1.242438, 1, 1, 1, 1, 1,
-0.813439, 0.8671859, -1.63054, 1, 1, 1, 1, 1,
-0.8085065, 1.632869, -0.215913, 1, 1, 1, 1, 1,
-0.8065016, -0.4248253, -2.868747, 1, 1, 1, 1, 1,
-0.8057629, 0.6892921, -1.577977, 1, 1, 1, 1, 1,
-0.8038689, 1.240986, -0.9917706, 1, 1, 1, 1, 1,
-0.8032307, -0.6797775, -3.240596, 1, 1, 1, 1, 1,
-0.8028241, 0.5458182, -1.098007, 1, 1, 1, 1, 1,
-0.7999275, -0.7948378, -1.93141, 1, 1, 1, 1, 1,
-0.7981791, -2.144128, -3.479647, 1, 1, 1, 1, 1,
-0.7964705, 1.36579, -1.509268, 1, 1, 1, 1, 1,
-0.7962878, -0.1453496, -1.645632, 1, 1, 1, 1, 1,
-0.7961896, -0.1511766, -0.4578614, 1, 1, 1, 1, 1,
-0.7940938, -0.2406799, -2.203205, 1, 1, 1, 1, 1,
-0.7935911, 0.1439559, -2.196362, 1, 1, 1, 1, 1,
-0.7894018, -2.669995, -4.0215, 0, 0, 1, 1, 1,
-0.7877926, -2.117571, -2.736771, 1, 0, 0, 1, 1,
-0.7862005, -2.340282, -2.774397, 1, 0, 0, 1, 1,
-0.7815781, -1.075568, -1.584898, 1, 0, 0, 1, 1,
-0.7661228, -1.810177, -3.120581, 1, 0, 0, 1, 1,
-0.7653938, -0.4861926, -2.044439, 1, 0, 0, 1, 1,
-0.7580831, -0.8027338, -2.335467, 0, 0, 0, 1, 1,
-0.7465785, -0.2988328, -2.197437, 0, 0, 0, 1, 1,
-0.7385618, 1.411507, 0.3371346, 0, 0, 0, 1, 1,
-0.7325469, -1.591787, -2.676744, 0, 0, 0, 1, 1,
-0.7323973, 0.4281807, -0.7356533, 0, 0, 0, 1, 1,
-0.7264652, -1.116614, -2.194165, 0, 0, 0, 1, 1,
-0.7213504, -0.3223035, -1.354034, 0, 0, 0, 1, 1,
-0.7201318, 1.200661, -1.654924, 1, 1, 1, 1, 1,
-0.7168429, -0.5586044, -3.144103, 1, 1, 1, 1, 1,
-0.7081853, -0.3364363, -1.90937, 1, 1, 1, 1, 1,
-0.7001654, -1.462893, -2.870186, 1, 1, 1, 1, 1,
-0.6964782, 0.4125991, 0.159318, 1, 1, 1, 1, 1,
-0.6937762, -0.288168, -3.241323, 1, 1, 1, 1, 1,
-0.6889514, 0.1482936, 0.1591471, 1, 1, 1, 1, 1,
-0.6881419, 1.711503, -2.464261, 1, 1, 1, 1, 1,
-0.6848022, 0.9739335, -0.7270703, 1, 1, 1, 1, 1,
-0.6827363, -0.5880015, -2.834985, 1, 1, 1, 1, 1,
-0.6815538, -1.049832, -2.10072, 1, 1, 1, 1, 1,
-0.6803288, 1.585372, -0.534516, 1, 1, 1, 1, 1,
-0.6775703, 0.6398119, -0.1697539, 1, 1, 1, 1, 1,
-0.668231, -1.452973, -4.303337, 1, 1, 1, 1, 1,
-0.6664832, 0.231261, -1.158304, 1, 1, 1, 1, 1,
-0.6635955, 1.714975, 0.1105555, 0, 0, 1, 1, 1,
-0.6597572, 0.1118899, -1.287994, 1, 0, 0, 1, 1,
-0.6578213, -0.09546091, -2.552669, 1, 0, 0, 1, 1,
-0.6536055, -1.46618, -0.4772728, 1, 0, 0, 1, 1,
-0.652899, -0.4650807, -0.5082825, 1, 0, 0, 1, 1,
-0.6458031, 0.02998153, -2.676314, 1, 0, 0, 1, 1,
-0.6445121, 0.04625093, -1.14763, 0, 0, 0, 1, 1,
-0.6418951, -0.0392969, -1.204789, 0, 0, 0, 1, 1,
-0.6414792, 0.06946511, -1.033799, 0, 0, 0, 1, 1,
-0.6410921, -0.2055609, -1.008544, 0, 0, 0, 1, 1,
-0.6326429, 0.8429832, -1.042329, 0, 0, 0, 1, 1,
-0.6279553, -0.1744581, -1.724262, 0, 0, 0, 1, 1,
-0.6279477, 2.819722, 1.191828, 0, 0, 0, 1, 1,
-0.6246588, 0.6550575, -1.662352, 1, 1, 1, 1, 1,
-0.6241311, 0.4285409, -0.1971044, 1, 1, 1, 1, 1,
-0.6239153, -0.07717391, -1.53589, 1, 1, 1, 1, 1,
-0.6204467, 1.0468, -2.31706, 1, 1, 1, 1, 1,
-0.6192282, -0.6202853, -3.986529, 1, 1, 1, 1, 1,
-0.6172827, -0.1127285, -1.571651, 1, 1, 1, 1, 1,
-0.6171095, -0.6639166, -1.831302, 1, 1, 1, 1, 1,
-0.6129656, 0.2604254, -0.7339602, 1, 1, 1, 1, 1,
-0.6122052, 0.2225371, -3.381519, 1, 1, 1, 1, 1,
-0.6056116, -0.8944859, -1.634686, 1, 1, 1, 1, 1,
-0.6034187, 0.8717403, -1.200996, 1, 1, 1, 1, 1,
-0.598263, 0.8927152, -0.9308597, 1, 1, 1, 1, 1,
-0.5962836, 0.5593118, -1.814515, 1, 1, 1, 1, 1,
-0.595952, -0.6562997, -4.25042, 1, 1, 1, 1, 1,
-0.5940688, -1.126364, -6.369761, 1, 1, 1, 1, 1,
-0.5934689, -1.097533, 0.4015583, 0, 0, 1, 1, 1,
-0.5886231, -0.01164602, -0.953196, 1, 0, 0, 1, 1,
-0.5879601, 1.429679, 0.5948288, 1, 0, 0, 1, 1,
-0.5860819, 0.3524816, -1.860567, 1, 0, 0, 1, 1,
-0.5838466, 0.6292002, -0.6486232, 1, 0, 0, 1, 1,
-0.583406, 0.7922562, -1.785985, 1, 0, 0, 1, 1,
-0.5811206, -0.4730317, -0.5831159, 0, 0, 0, 1, 1,
-0.5799227, 2.05122, 0.9418736, 0, 0, 0, 1, 1,
-0.5799097, 0.1085667, -2.066457, 0, 0, 0, 1, 1,
-0.5758148, 0.9101053, 0.3996486, 0, 0, 0, 1, 1,
-0.5688791, -1.009506, -3.16536, 0, 0, 0, 1, 1,
-0.5671596, -0.1173737, -2.106516, 0, 0, 0, 1, 1,
-0.554493, 0.9937269, -0.07451865, 0, 0, 0, 1, 1,
-0.5512649, -1.282951, -2.221161, 1, 1, 1, 1, 1,
-0.5473132, 0.2684092, -2.226159, 1, 1, 1, 1, 1,
-0.5435753, 0.07777111, -2.138821, 1, 1, 1, 1, 1,
-0.5182586, 0.1808566, -0.498244, 1, 1, 1, 1, 1,
-0.5165884, -0.4104848, -3.044062, 1, 1, 1, 1, 1,
-0.5123647, 0.9263927, -1.356892, 1, 1, 1, 1, 1,
-0.5104004, 0.795734, -0.5386805, 1, 1, 1, 1, 1,
-0.5061535, -1.739948, -4.493822, 1, 1, 1, 1, 1,
-0.5061171, -0.3383517, -1.857003, 1, 1, 1, 1, 1,
-0.503819, 0.390254, -0.6034091, 1, 1, 1, 1, 1,
-0.5031734, 1.649737, -0.8097519, 1, 1, 1, 1, 1,
-0.5011088, 0.9165043, -2.098311, 1, 1, 1, 1, 1,
-0.5008782, -1.109102, -0.8970168, 1, 1, 1, 1, 1,
-0.5003191, -0.6919487, -2.159256, 1, 1, 1, 1, 1,
-0.4987416, 0.5438561, -2.592435, 1, 1, 1, 1, 1,
-0.4982813, 0.5346901, -1.615403, 0, 0, 1, 1, 1,
-0.4979207, 0.9950554, 0.197273, 1, 0, 0, 1, 1,
-0.4944783, -0.2154579, -2.517365, 1, 0, 0, 1, 1,
-0.4922536, -0.4550215, -3.434967, 1, 0, 0, 1, 1,
-0.4896532, 0.3693934, -1.457682, 1, 0, 0, 1, 1,
-0.4893821, -1.547237, -2.262828, 1, 0, 0, 1, 1,
-0.4856019, -0.2525686, -3.055385, 0, 0, 0, 1, 1,
-0.4825579, -1.718473, -2.460589, 0, 0, 0, 1, 1,
-0.4810472, 0.09991772, -1.514456, 0, 0, 0, 1, 1,
-0.4797131, -0.3975883, -2.452884, 0, 0, 0, 1, 1,
-0.478781, -0.1738155, -0.8906127, 0, 0, 0, 1, 1,
-0.4786417, -1.644238, -3.434101, 0, 0, 0, 1, 1,
-0.4747877, -1.141089, -1.794665, 0, 0, 0, 1, 1,
-0.4699077, -1.216431, -3.364603, 1, 1, 1, 1, 1,
-0.4698452, 0.7286622, -0.4970916, 1, 1, 1, 1, 1,
-0.4693156, -0.05875633, -1.238828, 1, 1, 1, 1, 1,
-0.4678725, 0.5030229, 0.2938953, 1, 1, 1, 1, 1,
-0.463546, -1.342938, -4.695939, 1, 1, 1, 1, 1,
-0.4634223, 0.9378092, -0.3174519, 1, 1, 1, 1, 1,
-0.4604974, -1.066641, -1.630703, 1, 1, 1, 1, 1,
-0.4604092, 0.3536445, -0.6796481, 1, 1, 1, 1, 1,
-0.4584086, 1.64925, -0.3276951, 1, 1, 1, 1, 1,
-0.4555122, -0.3912955, -2.286874, 1, 1, 1, 1, 1,
-0.4552621, -1.16355, -2.982447, 1, 1, 1, 1, 1,
-0.4538133, 0.522567, -0.8988107, 1, 1, 1, 1, 1,
-0.4536547, -0.2181362, -2.637561, 1, 1, 1, 1, 1,
-0.450838, 0.7857346, -0.1299414, 1, 1, 1, 1, 1,
-0.4388383, -0.9783275, -2.29994, 1, 1, 1, 1, 1,
-0.4387144, -1.789233, -3.059553, 0, 0, 1, 1, 1,
-0.4364458, -0.3706802, -1.437558, 1, 0, 0, 1, 1,
-0.4325901, 0.5419905, 0.3697026, 1, 0, 0, 1, 1,
-0.4201144, -1.86758, -4.894084, 1, 0, 0, 1, 1,
-0.4123798, 1.252416, -0.2684795, 1, 0, 0, 1, 1,
-0.4071774, 1.701262, 1.644961, 1, 0, 0, 1, 1,
-0.4071605, -1.112052, -3.721194, 0, 0, 0, 1, 1,
-0.4047031, 0.8159325, -0.8932344, 0, 0, 0, 1, 1,
-0.4037848, 0.09091134, -1.521443, 0, 0, 0, 1, 1,
-0.4023937, -0.2125635, -2.331988, 0, 0, 0, 1, 1,
-0.3979632, -1.151489, -1.333104, 0, 0, 0, 1, 1,
-0.397372, 1.577156, -0.09823986, 0, 0, 0, 1, 1,
-0.3905304, 1.990214, -0.8139778, 0, 0, 0, 1, 1,
-0.3887813, -1.536587, -3.836621, 1, 1, 1, 1, 1,
-0.3840624, 0.6171489, -1.272643, 1, 1, 1, 1, 1,
-0.3809551, 0.3918453, -1.271711, 1, 1, 1, 1, 1,
-0.3768297, -1.210194, -1.487373, 1, 1, 1, 1, 1,
-0.3685648, 0.5534688, -0.3245877, 1, 1, 1, 1, 1,
-0.3677096, 0.804923, -0.5807514, 1, 1, 1, 1, 1,
-0.3676114, -0.3542244, -3.022748, 1, 1, 1, 1, 1,
-0.3637348, -0.7511384, -4.176682, 1, 1, 1, 1, 1,
-0.3591955, -0.0269472, -2.532412, 1, 1, 1, 1, 1,
-0.3575401, 0.5322608, 1.312952, 1, 1, 1, 1, 1,
-0.3555595, -0.692144, -1.847617, 1, 1, 1, 1, 1,
-0.3549648, 0.2839482, -1.792298, 1, 1, 1, 1, 1,
-0.3466136, 0.1862589, -0.4545532, 1, 1, 1, 1, 1,
-0.345932, 0.1870272, -0.1807363, 1, 1, 1, 1, 1,
-0.3451639, -0.09776454, -3.269918, 1, 1, 1, 1, 1,
-0.3434711, 0.2058202, 0.3801948, 0, 0, 1, 1, 1,
-0.3423386, -0.3108289, -2.438028, 1, 0, 0, 1, 1,
-0.3388213, -0.9070885, -2.417234, 1, 0, 0, 1, 1,
-0.3297101, 0.1981982, -0.3527143, 1, 0, 0, 1, 1,
-0.3256686, -0.08249078, -0.06813449, 1, 0, 0, 1, 1,
-0.3253945, 1.588843, 0.08280858, 1, 0, 0, 1, 1,
-0.3247057, 0.5199149, -0.3568148, 0, 0, 0, 1, 1,
-0.323844, -1.718738, -3.292284, 0, 0, 0, 1, 1,
-0.3203134, -0.06747651, -0.7279814, 0, 0, 0, 1, 1,
-0.3181761, 1.298432, -1.119882, 0, 0, 0, 1, 1,
-0.3118948, -2.129164, -3.851842, 0, 0, 0, 1, 1,
-0.3118939, -0.8533059, -2.273848, 0, 0, 0, 1, 1,
-0.311592, -0.8387299, -1.333956, 0, 0, 0, 1, 1,
-0.3113586, -1.318596, -1.804956, 1, 1, 1, 1, 1,
-0.3038883, -0.2940456, -2.497195, 1, 1, 1, 1, 1,
-0.3023549, 0.811325, -0.3033674, 1, 1, 1, 1, 1,
-0.2971275, 0.4829786, 1.119111, 1, 1, 1, 1, 1,
-0.2961979, 0.4607667, -1.53458, 1, 1, 1, 1, 1,
-0.2908573, 0.3465071, -1.128412, 1, 1, 1, 1, 1,
-0.2884396, -1.863362, -3.545218, 1, 1, 1, 1, 1,
-0.2882228, 1.565202, 0.2508695, 1, 1, 1, 1, 1,
-0.2850106, -0.163526, -2.308043, 1, 1, 1, 1, 1,
-0.2839542, -0.2398255, -3.148932, 1, 1, 1, 1, 1,
-0.2731746, -1.287276, -2.267884, 1, 1, 1, 1, 1,
-0.2700268, 0.02899771, -1.563351, 1, 1, 1, 1, 1,
-0.2667226, 0.1529011, -2.30889, 1, 1, 1, 1, 1,
-0.26507, -0.5370031, -1.024338, 1, 1, 1, 1, 1,
-0.2638702, -1.085103, -3.214255, 1, 1, 1, 1, 1,
-0.2626874, -0.1450184, -2.990602, 0, 0, 1, 1, 1,
-0.2599216, -0.581591, -3.586451, 1, 0, 0, 1, 1,
-0.2597196, -0.8267464, -2.731098, 1, 0, 0, 1, 1,
-0.2568206, -0.2531637, -2.83117, 1, 0, 0, 1, 1,
-0.2567871, 1.065437, -1.764888, 1, 0, 0, 1, 1,
-0.2561462, 1.030724, 0.6072987, 1, 0, 0, 1, 1,
-0.2548293, 1.500554, 2.310823, 0, 0, 0, 1, 1,
-0.251209, 1.018847, -0.2381425, 0, 0, 0, 1, 1,
-0.2496138, 0.727753, -1.15661, 0, 0, 0, 1, 1,
-0.2457221, 0.6060378, -1.279011, 0, 0, 0, 1, 1,
-0.2454405, -1.456665, -4.536128, 0, 0, 0, 1, 1,
-0.2448597, 0.414967, -0.6201428, 0, 0, 0, 1, 1,
-0.2437902, 0.4809861, 0.06640155, 0, 0, 0, 1, 1,
-0.2423305, -0.8847734, -2.513404, 1, 1, 1, 1, 1,
-0.2417574, -0.9070385, -3.040998, 1, 1, 1, 1, 1,
-0.2406315, 0.03946431, -1.679186, 1, 1, 1, 1, 1,
-0.2390371, -1.082707, -0.9460077, 1, 1, 1, 1, 1,
-0.2386821, 0.07885756, -1.659478, 1, 1, 1, 1, 1,
-0.2347343, -0.008999791, 0.1419981, 1, 1, 1, 1, 1,
-0.2345472, 0.6502102, -1.27726, 1, 1, 1, 1, 1,
-0.2323318, 0.4977451, -0.1624374, 1, 1, 1, 1, 1,
-0.2312973, 2.19689, 0.1928279, 1, 1, 1, 1, 1,
-0.2310918, 0.6130973, -0.8101208, 1, 1, 1, 1, 1,
-0.2289051, -0.5736254, -4.561297, 1, 1, 1, 1, 1,
-0.2268538, 1.062209, 1.04154, 1, 1, 1, 1, 1,
-0.2257438, 1.062099, -1.674666, 1, 1, 1, 1, 1,
-0.224525, 0.462258, -1.07303, 1, 1, 1, 1, 1,
-0.224169, -0.6708564, -3.484615, 1, 1, 1, 1, 1,
-0.2188392, -0.08240148, -1.953897, 0, 0, 1, 1, 1,
-0.2145169, -2.288954, -2.746081, 1, 0, 0, 1, 1,
-0.2140799, -1.184154, -2.993563, 1, 0, 0, 1, 1,
-0.207601, -1.426749, -3.066792, 1, 0, 0, 1, 1,
-0.2042357, -0.1277499, -1.564742, 1, 0, 0, 1, 1,
-0.2033201, -0.6175234, -2.358223, 1, 0, 0, 1, 1,
-0.200515, 0.6168753, -0.9635268, 0, 0, 0, 1, 1,
-0.1930476, 0.9660077, -1.468634, 0, 0, 0, 1, 1,
-0.1920325, -2.30989, -2.940542, 0, 0, 0, 1, 1,
-0.1915184, -0.5528359, -3.693458, 0, 0, 0, 1, 1,
-0.1878192, -0.05618839, 0.07598934, 0, 0, 0, 1, 1,
-0.1869086, 1.537675, 0.5961875, 0, 0, 0, 1, 1,
-0.1846242, -0.05720462, -1.643695, 0, 0, 0, 1, 1,
-0.1817191, 0.5771371, -2.436915, 1, 1, 1, 1, 1,
-0.1814199, 1.142737, -0.494023, 1, 1, 1, 1, 1,
-0.1792112, 0.04367788, -0.6903848, 1, 1, 1, 1, 1,
-0.1765718, -1.335655, -3.812989, 1, 1, 1, 1, 1,
-0.1765291, -1.548114, -2.008142, 1, 1, 1, 1, 1,
-0.1760457, 0.122921, -0.402655, 1, 1, 1, 1, 1,
-0.1691811, 1.731745, -1.603961, 1, 1, 1, 1, 1,
-0.1691567, -0.7493144, -1.036972, 1, 1, 1, 1, 1,
-0.1645318, -0.1412332, -0.9284001, 1, 1, 1, 1, 1,
-0.1620114, 0.2373755, -1.637902, 1, 1, 1, 1, 1,
-0.1589904, -0.944796, -3.124249, 1, 1, 1, 1, 1,
-0.1588955, 0.1681345, -0.7837344, 1, 1, 1, 1, 1,
-0.1573571, -0.4520758, -2.992894, 1, 1, 1, 1, 1,
-0.1567678, -0.8255816, -2.271903, 1, 1, 1, 1, 1,
-0.153916, -0.1831549, -2.928601, 1, 1, 1, 1, 1,
-0.1441488, 0.3910486, 0.09146249, 0, 0, 1, 1, 1,
-0.1401362, -1.096004, -4.226281, 1, 0, 0, 1, 1,
-0.1388383, 0.2312532, -0.545508, 1, 0, 0, 1, 1,
-0.1360686, 0.516142, -1.712802, 1, 0, 0, 1, 1,
-0.1347799, 1.454827, -0.3478437, 1, 0, 0, 1, 1,
-0.1323406, 0.9515685, 1.193851, 1, 0, 0, 1, 1,
-0.1321529, 0.7753816, -0.01017998, 0, 0, 0, 1, 1,
-0.1281607, 1.066478, -0.0001485918, 0, 0, 0, 1, 1,
-0.127734, 0.419218, -2.43859, 0, 0, 0, 1, 1,
-0.124022, -1.181841, -2.938149, 0, 0, 0, 1, 1,
-0.1231877, 0.03854546, -1.166772, 0, 0, 0, 1, 1,
-0.1223036, 1.087897, -1.606212, 0, 0, 0, 1, 1,
-0.1210112, 0.09047449, -0.9957711, 0, 0, 0, 1, 1,
-0.1209408, -0.2019835, -3.120939, 1, 1, 1, 1, 1,
-0.1187065, -0.9168308, -0.6532025, 1, 1, 1, 1, 1,
-0.1149546, 1.958961, -1.186894, 1, 1, 1, 1, 1,
-0.108601, -0.794403, -2.274155, 1, 1, 1, 1, 1,
-0.1077744, 1.118905, 0.2337908, 1, 1, 1, 1, 1,
-0.1062932, -0.9829412, -5.080181, 1, 1, 1, 1, 1,
-0.09473238, -1.717255, -4.882761, 1, 1, 1, 1, 1,
-0.09291061, 0.3088605, 0.4516908, 1, 1, 1, 1, 1,
-0.09018688, -0.5944197, -4.213384, 1, 1, 1, 1, 1,
-0.08880783, 0.3739093, 0.4827079, 1, 1, 1, 1, 1,
-0.08536682, -0.3752525, -3.374612, 1, 1, 1, 1, 1,
-0.08430277, 0.2756101, 0.2747309, 1, 1, 1, 1, 1,
-0.08298683, -1.55822, -2.467242, 1, 1, 1, 1, 1,
-0.06803163, 0.4321498, -0.01824603, 1, 1, 1, 1, 1,
-0.06678968, -1.223023, -2.161749, 1, 1, 1, 1, 1,
-0.06401648, -0.1742807, -1.968785, 0, 0, 1, 1, 1,
-0.06310588, 0.4369577, -1.094414, 1, 0, 0, 1, 1,
-0.05891584, -0.4886327, -4.033716, 1, 0, 0, 1, 1,
-0.05839076, 0.213706, 0.2959678, 1, 0, 0, 1, 1,
-0.05261657, 0.5564651, -0.8917548, 1, 0, 0, 1, 1,
-0.05085572, 1.005606, 2.7216, 1, 0, 0, 1, 1,
-0.04980758, 0.7200087, -1.397071, 0, 0, 0, 1, 1,
-0.04966254, -0.4746706, -4.279855, 0, 0, 0, 1, 1,
-0.04371321, -0.3056271, -3.649556, 0, 0, 0, 1, 1,
-0.04192859, 0.2710522, -0.3800666, 0, 0, 0, 1, 1,
-0.03707702, -2.062669, -3.912899, 0, 0, 0, 1, 1,
-0.03681733, -0.5889022, -2.97246, 0, 0, 0, 1, 1,
-0.03447682, 0.7769819, 2.356847, 0, 0, 0, 1, 1,
-0.03262372, -0.8149898, -2.371036, 1, 1, 1, 1, 1,
-0.02979939, -0.3299499, -2.258395, 1, 1, 1, 1, 1,
-0.02669618, 0.005609003, -0.5478714, 1, 1, 1, 1, 1,
-0.02667419, 0.521655, 0.7506027, 1, 1, 1, 1, 1,
-0.02206053, 1.258443, 1.128234, 1, 1, 1, 1, 1,
-0.02107453, -0.5205842, -4.324986, 1, 1, 1, 1, 1,
-0.01690353, 0.3096847, -1.056131, 1, 1, 1, 1, 1,
-0.01511692, -0.4105085, -1.803347, 1, 1, 1, 1, 1,
-0.01328128, 1.278469, -0.09362931, 1, 1, 1, 1, 1,
-0.01219554, -0.9608358, -4.037981, 1, 1, 1, 1, 1,
-0.00313761, -1.134051, -3.237743, 1, 1, 1, 1, 1,
-7.789792e-05, -0.8359169, -3.603199, 1, 1, 1, 1, 1,
0.0004841168, -0.9712375, 2.905843, 1, 1, 1, 1, 1,
0.001133869, -0.4281916, 3.330492, 1, 1, 1, 1, 1,
0.002209434, -0.5439055, 4.260701, 1, 1, 1, 1, 1,
0.003761666, -1.756478, 2.220401, 0, 0, 1, 1, 1,
0.003912559, -0.246907, 2.636283, 1, 0, 0, 1, 1,
0.005219715, -0.8854083, 4.983254, 1, 0, 0, 1, 1,
0.007447607, -2.388276, 3.149463, 1, 0, 0, 1, 1,
0.01982499, 0.730366, 1.216973, 1, 0, 0, 1, 1,
0.02012051, 0.01117307, 1.645668, 1, 0, 0, 1, 1,
0.02028067, 0.2619844, -0.6498059, 0, 0, 0, 1, 1,
0.02258675, -1.295014, 3.252845, 0, 0, 0, 1, 1,
0.0239667, -1.430382, 3.283973, 0, 0, 0, 1, 1,
0.02703621, 2.01129, 0.57712, 0, 0, 0, 1, 1,
0.02957716, -0.7893702, 3.381867, 0, 0, 0, 1, 1,
0.03343521, 0.9804663, -1.925774, 0, 0, 0, 1, 1,
0.03384605, 0.1483294, 1.065796, 0, 0, 0, 1, 1,
0.04119513, -0.5601825, 1.448551, 1, 1, 1, 1, 1,
0.04679554, -1.534328, 4.384884, 1, 1, 1, 1, 1,
0.04824772, 0.3310779, -0.3029486, 1, 1, 1, 1, 1,
0.04914573, -0.7145042, 5.070346, 1, 1, 1, 1, 1,
0.054699, 1.92063, 0.3408759, 1, 1, 1, 1, 1,
0.05910007, 0.02319661, 0.6706879, 1, 1, 1, 1, 1,
0.06756662, 0.09632193, -0.1606316, 1, 1, 1, 1, 1,
0.06849209, 0.03709637, 1.660879, 1, 1, 1, 1, 1,
0.07195389, -1.014073, 3.576834, 1, 1, 1, 1, 1,
0.07581279, 1.724429, 1.46896, 1, 1, 1, 1, 1,
0.07826208, 0.4748144, -0.6945769, 1, 1, 1, 1, 1,
0.07895252, -0.09740094, 2.424201, 1, 1, 1, 1, 1,
0.07973716, 0.1773068, -0.8596902, 1, 1, 1, 1, 1,
0.07982416, -1.008337, 2.772022, 1, 1, 1, 1, 1,
0.08082727, -0.6893107, 4.160326, 1, 1, 1, 1, 1,
0.08085027, 1.427499, 1.273993, 0, 0, 1, 1, 1,
0.08163393, -0.7473339, 3.777946, 1, 0, 0, 1, 1,
0.08202025, 0.4598407, -0.1199091, 1, 0, 0, 1, 1,
0.08286107, 1.034685, 0.67239, 1, 0, 0, 1, 1,
0.08918118, 0.3693001, -0.4613428, 1, 0, 0, 1, 1,
0.09197198, -0.6061085, 1.914562, 1, 0, 0, 1, 1,
0.09869007, 0.06748592, 1.034041, 0, 0, 0, 1, 1,
0.1003815, 0.8779413, 0.8697503, 0, 0, 0, 1, 1,
0.1024851, -0.9261249, 4.875299, 0, 0, 0, 1, 1,
0.1034665, -0.3522716, 3.611623, 0, 0, 0, 1, 1,
0.1059175, -0.4678629, 1.646147, 0, 0, 0, 1, 1,
0.1118933, -0.0857054, 2.694588, 0, 0, 0, 1, 1,
0.1159692, -0.4823371, 2.572611, 0, 0, 0, 1, 1,
0.1204538, 0.002052028, 1.565903, 1, 1, 1, 1, 1,
0.1210877, -1.259657, 4.299885, 1, 1, 1, 1, 1,
0.1265428, 1.472275, -0.1334337, 1, 1, 1, 1, 1,
0.1281452, 0.105106, -0.03567139, 1, 1, 1, 1, 1,
0.1294832, -0.5101955, 3.620693, 1, 1, 1, 1, 1,
0.1318649, 0.3412848, 1.834144, 1, 1, 1, 1, 1,
0.1327326, 0.8110776, -0.1821794, 1, 1, 1, 1, 1,
0.1394171, -0.5916759, 3.878991, 1, 1, 1, 1, 1,
0.140465, 0.6580639, 0.02135245, 1, 1, 1, 1, 1,
0.1429541, 0.492734, -0.6840662, 1, 1, 1, 1, 1,
0.1455896, 2.019083, 0.5562799, 1, 1, 1, 1, 1,
0.1504586, 0.287634, 0.9581771, 1, 1, 1, 1, 1,
0.1507462, 0.07260097, 0.8324409, 1, 1, 1, 1, 1,
0.1517101, 1.240593, 1.806574, 1, 1, 1, 1, 1,
0.1526326, -0.5548175, 1.20042, 1, 1, 1, 1, 1,
0.1543743, -1.154462, 2.417768, 0, 0, 1, 1, 1,
0.156482, -0.6108868, 3.489915, 1, 0, 0, 1, 1,
0.1592145, -0.2355209, 2.845849, 1, 0, 0, 1, 1,
0.1607844, 1.038064, 0.4438926, 1, 0, 0, 1, 1,
0.1610342, -0.3982288, 3.006196, 1, 0, 0, 1, 1,
0.1620324, 1.469225, -0.6806927, 1, 0, 0, 1, 1,
0.1736812, 1.396115, 1.12203, 0, 0, 0, 1, 1,
0.1795488, -1.109803, 2.897841, 0, 0, 0, 1, 1,
0.1803995, 0.5344044, 0.2823035, 0, 0, 0, 1, 1,
0.1823001, -1.290328, 2.343625, 0, 0, 0, 1, 1,
0.1836413, -0.2168736, 2.616, 0, 0, 0, 1, 1,
0.1841736, -1.611671, 3.081807, 0, 0, 0, 1, 1,
0.1847492, -1.206497, 4.231678, 0, 0, 0, 1, 1,
0.1852755, -0.6802605, 3.532934, 1, 1, 1, 1, 1,
0.1852978, -0.5590946, 2.948105, 1, 1, 1, 1, 1,
0.1896393, -0.3533747, 3.560548, 1, 1, 1, 1, 1,
0.1957098, 1.882522, 0.4691902, 1, 1, 1, 1, 1,
0.1960128, 0.7448222, 1.878459, 1, 1, 1, 1, 1,
0.1961998, -0.08312431, 1.203181, 1, 1, 1, 1, 1,
0.197422, -0.6004036, 3.84762, 1, 1, 1, 1, 1,
0.1983344, 0.03369405, 0.1212547, 1, 1, 1, 1, 1,
0.2011364, 0.1742474, 0.4130836, 1, 1, 1, 1, 1,
0.2020037, 1.264094, -1.111835, 1, 1, 1, 1, 1,
0.2025851, 0.188488, -1.410488, 1, 1, 1, 1, 1,
0.2049567, -1.709175, 1.672428, 1, 1, 1, 1, 1,
0.2056075, 0.0753772, 1.052147, 1, 1, 1, 1, 1,
0.2102004, 0.5855068, -0.7672262, 1, 1, 1, 1, 1,
0.2126062, -1.435961, 5.760266, 1, 1, 1, 1, 1,
0.2157337, 0.5233346, 0.3060827, 0, 0, 1, 1, 1,
0.2164864, -0.9910686, 1.804881, 1, 0, 0, 1, 1,
0.2176696, 0.694847, 2.210227, 1, 0, 0, 1, 1,
0.2187585, 1.118229, 0.09401984, 1, 0, 0, 1, 1,
0.2193696, -2.073221, 1.569737, 1, 0, 0, 1, 1,
0.219759, -2.000262, 2.759289, 1, 0, 0, 1, 1,
0.2197937, 0.3567448, 1.880134, 0, 0, 0, 1, 1,
0.220312, -0.5251953, 0.9063255, 0, 0, 0, 1, 1,
0.2214208, -0.09857707, 1.647089, 0, 0, 0, 1, 1,
0.2216867, -0.7416961, 2.929344, 0, 0, 0, 1, 1,
0.2241206, 0.55824, -0.3576983, 0, 0, 0, 1, 1,
0.2265412, -0.3176298, 0.9062667, 0, 0, 0, 1, 1,
0.2288833, -1.240366, 3.962675, 0, 0, 0, 1, 1,
0.2329781, -1.739242, 3.929594, 1, 1, 1, 1, 1,
0.2332584, -0.06473686, 2.169994, 1, 1, 1, 1, 1,
0.2336929, -0.2026979, 1.359389, 1, 1, 1, 1, 1,
0.2364233, -0.0149874, 1.263552, 1, 1, 1, 1, 1,
0.2375391, 1.122078, -0.3915754, 1, 1, 1, 1, 1,
0.2391267, 0.6205335, 1.787304, 1, 1, 1, 1, 1,
0.2441121, 1.374683, -0.855926, 1, 1, 1, 1, 1,
0.2456582, 1.451381, -0.4894018, 1, 1, 1, 1, 1,
0.2465262, 1.647398, -0.1867543, 1, 1, 1, 1, 1,
0.2492225, 2.915412, 2.143578, 1, 1, 1, 1, 1,
0.2506774, -0.122627, 2.818542, 1, 1, 1, 1, 1,
0.2511468, 0.9522214, -0.6261775, 1, 1, 1, 1, 1,
0.2541668, -1.420963, 3.440988, 1, 1, 1, 1, 1,
0.2545418, -0.975087, 3.040613, 1, 1, 1, 1, 1,
0.2564048, -0.8668068, 3.465518, 1, 1, 1, 1, 1,
0.2566509, -0.6809044, 2.133307, 0, 0, 1, 1, 1,
0.2573923, 0.1538775, 0.2013425, 1, 0, 0, 1, 1,
0.2597376, -0.6602152, 2.203002, 1, 0, 0, 1, 1,
0.2623667, -1.650274, 2.302123, 1, 0, 0, 1, 1,
0.2678498, 1.70259, 0.4853484, 1, 0, 0, 1, 1,
0.2724899, -0.2118055, 3.132287, 1, 0, 0, 1, 1,
0.274898, -0.5716592, 2.052166, 0, 0, 0, 1, 1,
0.2753296, -0.2754426, 3.828524, 0, 0, 0, 1, 1,
0.2769941, 0.5589119, 1.314755, 0, 0, 0, 1, 1,
0.2793656, 0.78332, -0.08600974, 0, 0, 0, 1, 1,
0.2796803, -0.4324493, 3.345835, 0, 0, 0, 1, 1,
0.2848048, -1.630838, 2.553843, 0, 0, 0, 1, 1,
0.2858416, -0.3947768, 2.467582, 0, 0, 0, 1, 1,
0.285964, -0.1132865, 1.461931, 1, 1, 1, 1, 1,
0.2863942, 1.371146, 1.083074, 1, 1, 1, 1, 1,
0.2882408, 0.8087088, 1.457376, 1, 1, 1, 1, 1,
0.2888981, -0.6426317, 2.479003, 1, 1, 1, 1, 1,
0.2940423, -0.7960175, 4.517233, 1, 1, 1, 1, 1,
0.2966462, -0.8223694, 2.555767, 1, 1, 1, 1, 1,
0.303748, -1.110465, 3.973931, 1, 1, 1, 1, 1,
0.3062677, -0.132559, 1.940499, 1, 1, 1, 1, 1,
0.3066979, -0.1024207, 2.005643, 1, 1, 1, 1, 1,
0.3093246, -2.729341, 2.97481, 1, 1, 1, 1, 1,
0.3168674, 0.9195877, 0.3324635, 1, 1, 1, 1, 1,
0.3186134, 0.5711907, 1.96828, 1, 1, 1, 1, 1,
0.3188529, -1.453827, 4.109287, 1, 1, 1, 1, 1,
0.319681, -0.5810037, 1.536178, 1, 1, 1, 1, 1,
0.3223792, -0.9884939, 1.773836, 1, 1, 1, 1, 1,
0.3239327, -0.3346726, 3.190936, 0, 0, 1, 1, 1,
0.3260464, 1.456338, 0.3299756, 1, 0, 0, 1, 1,
0.3277843, 0.183647, 3.425751, 1, 0, 0, 1, 1,
0.3309732, 0.06356287, 1.484604, 1, 0, 0, 1, 1,
0.3316114, -0.8361476, 0.32231, 1, 0, 0, 1, 1,
0.3325855, 2.19823, -0.8082376, 1, 0, 0, 1, 1,
0.3331557, -0.9570119, 2.186583, 0, 0, 0, 1, 1,
0.3385424, -0.007152823, 1.334264, 0, 0, 0, 1, 1,
0.3446678, 0.9729527, 1.39709, 0, 0, 0, 1, 1,
0.3560769, -1.461934, 3.755754, 0, 0, 0, 1, 1,
0.3565345, 1.297829, 1.097143, 0, 0, 0, 1, 1,
0.3594623, -0.8667666, 2.469978, 0, 0, 0, 1, 1,
0.3603663, 1.524918, -0.3628462, 0, 0, 0, 1, 1,
0.3605206, -1.231881, 2.798373, 1, 1, 1, 1, 1,
0.3640367, -0.352491, 0.9531585, 1, 1, 1, 1, 1,
0.3675962, 0.07884818, 1.327546, 1, 1, 1, 1, 1,
0.3703245, 1.816954, -0.1439425, 1, 1, 1, 1, 1,
0.3727941, 0.3354959, 0.9298406, 1, 1, 1, 1, 1,
0.3741129, -0.1912227, 2.554051, 1, 1, 1, 1, 1,
0.3781359, 0.09249572, 1.528107, 1, 1, 1, 1, 1,
0.3791386, -0.07447928, 2.420325, 1, 1, 1, 1, 1,
0.3794749, 0.6148208, 1.595388, 1, 1, 1, 1, 1,
0.3847475, -0.3679451, 4.622746, 1, 1, 1, 1, 1,
0.3847609, 0.3490533, -0.7799944, 1, 1, 1, 1, 1,
0.3893965, -1.109186, 1.203017, 1, 1, 1, 1, 1,
0.3900518, -0.4259073, 2.422304, 1, 1, 1, 1, 1,
0.3912503, -0.4532034, 2.507375, 1, 1, 1, 1, 1,
0.3959181, 0.8059943, 0.1574763, 1, 1, 1, 1, 1,
0.3960691, 0.1536042, 0.4820057, 0, 0, 1, 1, 1,
0.3961569, 0.6354399, -0.0543869, 1, 0, 0, 1, 1,
0.4032751, -0.3122614, 3.171446, 1, 0, 0, 1, 1,
0.4035195, -1.547018, 3.069851, 1, 0, 0, 1, 1,
0.4082797, -0.1324708, 3.735359, 1, 0, 0, 1, 1,
0.4119886, -1.343196, 2.354321, 1, 0, 0, 1, 1,
0.4207145, -0.04603828, 0.8596581, 0, 0, 0, 1, 1,
0.4215689, -0.4380156, 1.123793, 0, 0, 0, 1, 1,
0.4238795, 1.061912, 1.749871, 0, 0, 0, 1, 1,
0.4244809, -1.298698, 2.623997, 0, 0, 0, 1, 1,
0.4277485, 0.2048685, 0.04935523, 0, 0, 0, 1, 1,
0.4281571, 0.2230474, 1.912842, 0, 0, 0, 1, 1,
0.4295343, 1.266152, -0.6489715, 0, 0, 0, 1, 1,
0.4330608, 0.1256022, 1.490891, 1, 1, 1, 1, 1,
0.4368805, 1.080041, 0.378366, 1, 1, 1, 1, 1,
0.4393818, -1.502319, 1.922454, 1, 1, 1, 1, 1,
0.444536, -0.8344952, 3.821371, 1, 1, 1, 1, 1,
0.4464963, 0.2933095, 0.4909948, 1, 1, 1, 1, 1,
0.4477654, 0.7457357, 0.7167554, 1, 1, 1, 1, 1,
0.4517123, -1.042032, 4.183964, 1, 1, 1, 1, 1,
0.4562993, 2.63819, -0.5033863, 1, 1, 1, 1, 1,
0.4608279, -1.006369, 0.2898822, 1, 1, 1, 1, 1,
0.4627005, 0.7015912, 0.3649596, 1, 1, 1, 1, 1,
0.4637179, 0.4531468, 0.1739706, 1, 1, 1, 1, 1,
0.4640548, 1.136785, -0.252194, 1, 1, 1, 1, 1,
0.4656043, 0.03387181, 1.991366, 1, 1, 1, 1, 1,
0.4702235, 0.08403825, 1.16457, 1, 1, 1, 1, 1,
0.4762961, -0.1063204, 1.81321, 1, 1, 1, 1, 1,
0.4775757, -0.4726067, 3.97385, 0, 0, 1, 1, 1,
0.4799864, -0.4932192, 4.16478, 1, 0, 0, 1, 1,
0.4858437, 0.254086, 1.30076, 1, 0, 0, 1, 1,
0.4954384, 1.10814, 0.500586, 1, 0, 0, 1, 1,
0.4999691, -0.05161352, 0.5235695, 1, 0, 0, 1, 1,
0.5009482, -0.1783847, 2.821678, 1, 0, 0, 1, 1,
0.5024584, -0.5860657, 3.585161, 0, 0, 0, 1, 1,
0.5059187, -0.5391548, 2.571515, 0, 0, 0, 1, 1,
0.5088778, 1.358834, 0.3351945, 0, 0, 0, 1, 1,
0.5212978, 0.5608637, 1.428535, 0, 0, 0, 1, 1,
0.5224465, -0.6292175, 1.864126, 0, 0, 0, 1, 1,
0.5260936, 1.272237, 0.3439294, 0, 0, 0, 1, 1,
0.532487, 1.067347, 1.080377, 0, 0, 0, 1, 1,
0.5337755, -2.269319, 3.264616, 1, 1, 1, 1, 1,
0.5375978, -0.4602093, 2.982784, 1, 1, 1, 1, 1,
0.5389626, -1.067844, 3.356832, 1, 1, 1, 1, 1,
0.5393516, -0.5158005, -0.03233006, 1, 1, 1, 1, 1,
0.5428116, -0.09291959, 2.625845, 1, 1, 1, 1, 1,
0.5430534, 0.1055743, 2.452939, 1, 1, 1, 1, 1,
0.5544785, 0.9508818, 0.8009111, 1, 1, 1, 1, 1,
0.5546207, -1.322534, 3.971066, 1, 1, 1, 1, 1,
0.5574471, -1.101492, 3.357317, 1, 1, 1, 1, 1,
0.5618004, -1.348495, 4.598337, 1, 1, 1, 1, 1,
0.5700586, -0.7917848, 1.595227, 1, 1, 1, 1, 1,
0.5726103, 2.356113, 1.2526, 1, 1, 1, 1, 1,
0.5752736, 0.4123249, 2.003419, 1, 1, 1, 1, 1,
0.582178, 1.46322, -0.9873124, 1, 1, 1, 1, 1,
0.5835092, -1.742491, 2.379325, 1, 1, 1, 1, 1,
0.5869261, -1.636702, 1.99233, 0, 0, 1, 1, 1,
0.5914937, 0.7390949, -0.1785947, 1, 0, 0, 1, 1,
0.5937299, 0.7549999, 1.801456, 1, 0, 0, 1, 1,
0.6000367, 0.8692545, 1.634822, 1, 0, 0, 1, 1,
0.6094732, 1.167158, 1.656133, 1, 0, 0, 1, 1,
0.6132248, 0.638452, 0.4745111, 1, 0, 0, 1, 1,
0.6160143, 0.3469046, 3.068303, 0, 0, 0, 1, 1,
0.6162326, 1.098196, 0.6853899, 0, 0, 0, 1, 1,
0.6216041, -0.5884035, 2.199151, 0, 0, 0, 1, 1,
0.6216763, 0.803354, 2.001384, 0, 0, 0, 1, 1,
0.621928, 0.03021535, 1.887436, 0, 0, 0, 1, 1,
0.6234207, 0.4226914, 0.5641025, 0, 0, 0, 1, 1,
0.6423998, -0.2775076, 3.192458, 0, 0, 0, 1, 1,
0.6425486, 0.611434, 0.5619316, 1, 1, 1, 1, 1,
0.6468756, 0.6129152, 0.2050688, 1, 1, 1, 1, 1,
0.6487153, -0.01749565, 0.9599699, 1, 1, 1, 1, 1,
0.6517634, 2.227212, -0.02161375, 1, 1, 1, 1, 1,
0.652418, -0.7052948, 2.823019, 1, 1, 1, 1, 1,
0.6537262, 1.060348, -0.1307884, 1, 1, 1, 1, 1,
0.6551309, -0.647609, 1.399871, 1, 1, 1, 1, 1,
0.6566389, -0.7842888, 2.000263, 1, 1, 1, 1, 1,
0.6582435, 0.858022, 0.2368645, 1, 1, 1, 1, 1,
0.6591833, 0.5617078, 0.5230582, 1, 1, 1, 1, 1,
0.6624479, 1.178005, 0.1237786, 1, 1, 1, 1, 1,
0.6637973, -1.491838, 2.738218, 1, 1, 1, 1, 1,
0.6643674, 1.40101, -0.7604169, 1, 1, 1, 1, 1,
0.6663184, 0.3338813, 2.517445, 1, 1, 1, 1, 1,
0.6669667, 0.10058, -0.4292659, 1, 1, 1, 1, 1,
0.6684281, 0.9855573, 0.9672944, 0, 0, 1, 1, 1,
0.6750696, -0.004901278, 0.5857495, 1, 0, 0, 1, 1,
0.675949, 0.3492735, 1.031529, 1, 0, 0, 1, 1,
0.6818051, 0.0322506, 1.117186, 1, 0, 0, 1, 1,
0.6884884, 0.1081927, 2.169703, 1, 0, 0, 1, 1,
0.6941105, -0.01149205, 2.419678, 1, 0, 0, 1, 1,
0.699993, 1.236014, 0.07950076, 0, 0, 0, 1, 1,
0.7005215, 1.242927, 0.7670121, 0, 0, 0, 1, 1,
0.7008882, 0.3855002, -0.4582807, 0, 0, 0, 1, 1,
0.7011507, -0.1905699, 2.832301, 0, 0, 0, 1, 1,
0.7021641, -1.399019, 2.103701, 0, 0, 0, 1, 1,
0.7038729, 1.304115, -0.5484579, 0, 0, 0, 1, 1,
0.7086754, 0.6569299, 0.5931079, 0, 0, 0, 1, 1,
0.7102273, 1.767745, -0.07297363, 1, 1, 1, 1, 1,
0.7312371, 1.019532, 0.1606795, 1, 1, 1, 1, 1,
0.7320045, 0.4145937, 1.552045, 1, 1, 1, 1, 1,
0.7401872, -0.721487, 2.487799, 1, 1, 1, 1, 1,
0.743202, 1.140944, 0.5017529, 1, 1, 1, 1, 1,
0.7471109, -2.393377, 3.585297, 1, 1, 1, 1, 1,
0.7492279, -0.4667796, 3.07562, 1, 1, 1, 1, 1,
0.7497504, -0.4593529, 1.459462, 1, 1, 1, 1, 1,
0.7510865, -0.01897025, 0.9696951, 1, 1, 1, 1, 1,
0.771601, -0.3675166, 1.238905, 1, 1, 1, 1, 1,
0.7734416, 1.314909, 1.288604, 1, 1, 1, 1, 1,
0.7756867, -0.7465343, 3.158912, 1, 1, 1, 1, 1,
0.7759655, 1.618736, -0.4281678, 1, 1, 1, 1, 1,
0.7770417, 0.1027618, 1.900249, 1, 1, 1, 1, 1,
0.7771896, 0.6563206, -0.103416, 1, 1, 1, 1, 1,
0.7838868, 0.4668733, 1.467702, 0, 0, 1, 1, 1,
0.7852715, 0.213276, 0.7972639, 1, 0, 0, 1, 1,
0.7967063, -0.2912597, 0.2868015, 1, 0, 0, 1, 1,
0.7992582, -0.2752235, 0.4063747, 1, 0, 0, 1, 1,
0.8002494, 0.09418165, 0.6809635, 1, 0, 0, 1, 1,
0.8029919, -1.418694, 3.370634, 1, 0, 0, 1, 1,
0.8064298, -1.290118, 3.175324, 0, 0, 0, 1, 1,
0.8067676, -1.325847, 2.626522, 0, 0, 0, 1, 1,
0.8089154, -0.7792413, 1.991613, 0, 0, 0, 1, 1,
0.8134673, -0.3314657, 3.342194, 0, 0, 0, 1, 1,
0.8142684, -0.9645544, 2.015217, 0, 0, 0, 1, 1,
0.8143145, -0.4937711, 2.029563, 0, 0, 0, 1, 1,
0.8191807, -0.1432368, 3.585819, 0, 0, 0, 1, 1,
0.8353603, -0.7044893, 3.077756, 1, 1, 1, 1, 1,
0.8365199, 0.4931091, 1.985386, 1, 1, 1, 1, 1,
0.8469917, -2.515745, 1.511022, 1, 1, 1, 1, 1,
0.850698, 0.4057865, 2.112359, 1, 1, 1, 1, 1,
0.8524913, -0.8817337, 2.523103, 1, 1, 1, 1, 1,
0.8550808, -0.4047153, 2.058276, 1, 1, 1, 1, 1,
0.8635429, 1.741317, 1.536981, 1, 1, 1, 1, 1,
0.8729939, -0.6995844, 0.3565053, 1, 1, 1, 1, 1,
0.8782685, 0.04516869, 5.093315, 1, 1, 1, 1, 1,
0.890259, -0.1474191, 3.566118, 1, 1, 1, 1, 1,
0.8952242, -0.4185883, 1.451481, 1, 1, 1, 1, 1,
0.9046443, 0.5716488, 1.720621, 1, 1, 1, 1, 1,
0.9070885, 0.5477399, 2.463852, 1, 1, 1, 1, 1,
0.9076877, -0.06602601, 4.402554, 1, 1, 1, 1, 1,
0.9083498, 1.031899, 0.7410428, 1, 1, 1, 1, 1,
0.927292, -0.7626597, 2.802367, 0, 0, 1, 1, 1,
0.9289311, 0.5907797, -0.03770215, 1, 0, 0, 1, 1,
0.9327475, 0.5423557, 0.7123237, 1, 0, 0, 1, 1,
0.9327975, 1.011466, -0.8393976, 1, 0, 0, 1, 1,
0.9376791, 1.092984, 0.1018648, 1, 0, 0, 1, 1,
0.9435179, -0.2609932, 2.129755, 1, 0, 0, 1, 1,
0.9497391, -0.3982564, 1.324522, 0, 0, 0, 1, 1,
0.9501796, 0.6782897, 1.187212, 0, 0, 0, 1, 1,
0.9573022, 0.6196749, 1.255169, 0, 0, 0, 1, 1,
0.9581362, 0.4306341, 2.211535, 0, 0, 0, 1, 1,
0.960102, -0.2395454, 2.041616, 0, 0, 0, 1, 1,
0.9687911, 0.236569, 0.6914701, 0, 0, 0, 1, 1,
0.9706789, -0.01154106, 0.6670656, 0, 0, 0, 1, 1,
0.972424, 0.5856003, -0.5624343, 1, 1, 1, 1, 1,
0.9784734, -0.3845886, 0.824542, 1, 1, 1, 1, 1,
0.9818454, -1.609269, 2.39921, 1, 1, 1, 1, 1,
0.9836826, -0.3758621, 0.1850326, 1, 1, 1, 1, 1,
0.991209, 1.076025, 0.2424032, 1, 1, 1, 1, 1,
0.992029, 0.1283099, 1.156882, 1, 1, 1, 1, 1,
1.00028, -0.6207635, 3.726995, 1, 1, 1, 1, 1,
1.01004, 0.04979423, 1.519052, 1, 1, 1, 1, 1,
1.010316, -0.5176723, 2.366408, 1, 1, 1, 1, 1,
1.011266, -0.350704, 4.043221, 1, 1, 1, 1, 1,
1.011558, -0.1040736, 2.755431, 1, 1, 1, 1, 1,
1.016263, -0.08542299, 1.794409, 1, 1, 1, 1, 1,
1.020224, 0.5084816, 0.7747644, 1, 1, 1, 1, 1,
1.024177, -0.3848216, 0.5181569, 1, 1, 1, 1, 1,
1.025756, -0.2548051, 1.284409, 1, 1, 1, 1, 1,
1.033885, 0.3635084, 1.028463, 0, 0, 1, 1, 1,
1.035131, -1.807583, 3.221224, 1, 0, 0, 1, 1,
1.042173, -0.7986174, 3.648533, 1, 0, 0, 1, 1,
1.051746, 1.591817, 1.720648, 1, 0, 0, 1, 1,
1.060892, -1.144467, 1.709968, 1, 0, 0, 1, 1,
1.065071, 0.02777753, 3.472625, 1, 0, 0, 1, 1,
1.067316, -1.026645, 2.03372, 0, 0, 0, 1, 1,
1.069177, -0.2467694, 1.764364, 0, 0, 0, 1, 1,
1.072393, -0.4201593, 1.857623, 0, 0, 0, 1, 1,
1.072941, -0.521847, 2.146436, 0, 0, 0, 1, 1,
1.084183, -1.019705, 1.985809, 0, 0, 0, 1, 1,
1.090011, 0.3730854, 0.5210836, 0, 0, 0, 1, 1,
1.095913, 0.8839021, 1.514631, 0, 0, 0, 1, 1,
1.100118, 1.020759, 1.26317, 1, 1, 1, 1, 1,
1.100798, 0.2839154, 1.189742, 1, 1, 1, 1, 1,
1.102261, 0.003249769, 0.93668, 1, 1, 1, 1, 1,
1.10813, 0.9289099, 0.3710517, 1, 1, 1, 1, 1,
1.111172, -1.446707, 3.114855, 1, 1, 1, 1, 1,
1.12051, -0.3826359, 1.97768, 1, 1, 1, 1, 1,
1.126015, 1.310893, 0.6764824, 1, 1, 1, 1, 1,
1.133815, 1.200508, -1.050119, 1, 1, 1, 1, 1,
1.136337, -0.9771118, 2.204091, 1, 1, 1, 1, 1,
1.153704, 1.64273, 1.387288, 1, 1, 1, 1, 1,
1.155883, -1.857047, 1.63799, 1, 1, 1, 1, 1,
1.163179, 1.062871, 0.3141548, 1, 1, 1, 1, 1,
1.164355, -1.133955, 3.197914, 1, 1, 1, 1, 1,
1.167902, 2.269637, -1.087745, 1, 1, 1, 1, 1,
1.174687, -0.262315, 2.891176, 1, 1, 1, 1, 1,
1.176506, -0.8249336, 2.100403, 0, 0, 1, 1, 1,
1.180102, -0.1895619, 1.905457, 1, 0, 0, 1, 1,
1.18132, 1.841756, 0.08581336, 1, 0, 0, 1, 1,
1.188117, -0.4119415, 3.329894, 1, 0, 0, 1, 1,
1.19419, 0.6509807, 0.6847975, 1, 0, 0, 1, 1,
1.203779, -0.5961314, 2.170433, 1, 0, 0, 1, 1,
1.21264, 0.7780787, 1.207059, 0, 0, 0, 1, 1,
1.213178, -0.3549796, -0.4581873, 0, 0, 0, 1, 1,
1.214165, 0.8239402, 1.112074, 0, 0, 0, 1, 1,
1.216719, 0.1991945, -0.8948449, 0, 0, 0, 1, 1,
1.217054, 0.8694137, 1.146973, 0, 0, 0, 1, 1,
1.217635, 0.8145047, 0.3403704, 0, 0, 0, 1, 1,
1.219049, 0.06885003, 2.899126, 0, 0, 0, 1, 1,
1.221015, 0.569764, 0.7555115, 1, 1, 1, 1, 1,
1.224321, -1.005159, 4.002605, 1, 1, 1, 1, 1,
1.228158, 1.24892, 1.746993, 1, 1, 1, 1, 1,
1.229275, -0.221245, 2.650453, 1, 1, 1, 1, 1,
1.241313, 0.2176215, 2.630169, 1, 1, 1, 1, 1,
1.242456, -0.9586424, 2.093316, 1, 1, 1, 1, 1,
1.242739, 1.075683, 1.510552, 1, 1, 1, 1, 1,
1.249967, -0.923664, 4.338113, 1, 1, 1, 1, 1,
1.26091, 0.2829642, 1.34519, 1, 1, 1, 1, 1,
1.264362, 0.5241843, 1.637403, 1, 1, 1, 1, 1,
1.267125, 1.514713, 2.198392, 1, 1, 1, 1, 1,
1.270334, 0.2400461, -1.04711, 1, 1, 1, 1, 1,
1.272331, -0.6392752, 2.38727, 1, 1, 1, 1, 1,
1.275375, 0.3075897, 2.727662, 1, 1, 1, 1, 1,
1.281024, -0.4864512, 2.918112, 1, 1, 1, 1, 1,
1.289506, -1.048734, 0.5821652, 0, 0, 1, 1, 1,
1.295054, -1.499373, 4.294372, 1, 0, 0, 1, 1,
1.303861, 0.8795261, 1.109517, 1, 0, 0, 1, 1,
1.307068, 0.8992984, 1.540068, 1, 0, 0, 1, 1,
1.337045, 1.06853, 0.03536762, 1, 0, 0, 1, 1,
1.343938, -1.649775, 1.360604, 1, 0, 0, 1, 1,
1.345606, 0.6098947, 2.627854, 0, 0, 0, 1, 1,
1.353454, -0.5230548, 1.26367, 0, 0, 0, 1, 1,
1.358402, 1.823561, -0.02438155, 0, 0, 0, 1, 1,
1.363104, 0.6494914, 2.212019, 0, 0, 0, 1, 1,
1.363717, 0.2628866, 1.201964, 0, 0, 0, 1, 1,
1.368138, -1.819605, 0.2260342, 0, 0, 0, 1, 1,
1.370829, 1.013478, 2.182054, 0, 0, 0, 1, 1,
1.378053, -0.31714, 2.931882, 1, 1, 1, 1, 1,
1.390916, -0.6933775, 1.522178, 1, 1, 1, 1, 1,
1.391035, -0.4183902, 2.877214, 1, 1, 1, 1, 1,
1.391162, -0.2523419, 2.994345, 1, 1, 1, 1, 1,
1.399701, -0.9762954, 2.725653, 1, 1, 1, 1, 1,
1.400336, -1.133958, 1.93863, 1, 1, 1, 1, 1,
1.400471, -1.093809, 3.867484, 1, 1, 1, 1, 1,
1.403825, -0.4343624, 2.800277, 1, 1, 1, 1, 1,
1.408166, -0.6634715, 4.205516, 1, 1, 1, 1, 1,
1.41407, -0.815469, 1.360404, 1, 1, 1, 1, 1,
1.42548, 0.9274098, 1.945444, 1, 1, 1, 1, 1,
1.427022, -0.1948569, 0.9526427, 1, 1, 1, 1, 1,
1.430812, -1.440281, 2.501483, 1, 1, 1, 1, 1,
1.447198, -0.9535022, 2.565917, 1, 1, 1, 1, 1,
1.471454, 1.339007, 0.949288, 1, 1, 1, 1, 1,
1.479483, 0.5701794, 1.114766, 0, 0, 1, 1, 1,
1.482536, 1.442969, 0.9476438, 1, 0, 0, 1, 1,
1.486083, 0.1966828, -0.04649439, 1, 0, 0, 1, 1,
1.492286, -0.06705426, 2.235952, 1, 0, 0, 1, 1,
1.498822, -0.2866505, 3.495153, 1, 0, 0, 1, 1,
1.499915, -0.8600962, 0.5973922, 1, 0, 0, 1, 1,
1.506985, -0.6976177, 3.748497, 0, 0, 0, 1, 1,
1.508572, 0.9750504, 2.11737, 0, 0, 0, 1, 1,
1.51327, -1.537197, 1.350798, 0, 0, 0, 1, 1,
1.519657, 0.1475684, 2.282852, 0, 0, 0, 1, 1,
1.519742, 1.703788, 0.890543, 0, 0, 0, 1, 1,
1.540391, 1.819917, -1.013097, 0, 0, 0, 1, 1,
1.543674, 0.2339274, 2.349175, 0, 0, 0, 1, 1,
1.550507, -0.2822727, 1.616809, 1, 1, 1, 1, 1,
1.556486, 0.2092572, 0.7832895, 1, 1, 1, 1, 1,
1.574816, 0.1293007, 0.7546062, 1, 1, 1, 1, 1,
1.58177, -0.9936332, 1.681155, 1, 1, 1, 1, 1,
1.595476, -1.023955, 1.842284, 1, 1, 1, 1, 1,
1.616693, -1.346981, 2.040381, 1, 1, 1, 1, 1,
1.62246, -0.7850417, 3.812966, 1, 1, 1, 1, 1,
1.631449, -2.123899, 3.024137, 1, 1, 1, 1, 1,
1.655268, -0.1536192, 2.158756, 1, 1, 1, 1, 1,
1.664829, -1.704941, 3.16592, 1, 1, 1, 1, 1,
1.67045, 2.523939, 0.4877874, 1, 1, 1, 1, 1,
1.681016, 2.333077, 0.04404987, 1, 1, 1, 1, 1,
1.689611, -0.4797457, 1.91278, 1, 1, 1, 1, 1,
1.69083, -0.5032997, 1.559887, 1, 1, 1, 1, 1,
1.703979, 1.46951, 1.524714, 1, 1, 1, 1, 1,
1.726111, -0.8575909, 1.925718, 0, 0, 1, 1, 1,
1.736015, 0.5205631, -0.778843, 1, 0, 0, 1, 1,
1.737375, 0.5686091, 1.924948, 1, 0, 0, 1, 1,
1.739315, -0.3357969, 2.978616, 1, 0, 0, 1, 1,
1.761463, -1.467102, 2.200456, 1, 0, 0, 1, 1,
1.77384, -0.06222939, 2.659061, 1, 0, 0, 1, 1,
1.786526, -0.8566882, 1.855174, 0, 0, 0, 1, 1,
1.801526, -0.03709888, 1.751953, 0, 0, 0, 1, 1,
1.826582, -0.8675902, 2.417831, 0, 0, 0, 1, 1,
1.837625, 0.7137746, 0.1231052, 0, 0, 0, 1, 1,
1.867427, 0.8277513, 1.489429, 0, 0, 0, 1, 1,
1.873281, -0.3055258, 2.360874, 0, 0, 0, 1, 1,
1.875752, 0.3080418, 0.5018629, 0, 0, 0, 1, 1,
1.879084, -0.5849133, 1.142838, 1, 1, 1, 1, 1,
1.89738, -0.7159176, 0.2458339, 1, 1, 1, 1, 1,
1.90878, -0.8132225, 2.767752, 1, 1, 1, 1, 1,
1.939113, 1.062322, 0.4671534, 1, 1, 1, 1, 1,
1.964343, -0.9520372, 1.536643, 1, 1, 1, 1, 1,
1.974727, 1.864002, 1.353677, 1, 1, 1, 1, 1,
1.983421, 0.8913186, 1.833613, 1, 1, 1, 1, 1,
1.99223, 1.091812, 0.7326788, 1, 1, 1, 1, 1,
2.008995, -0.2608332, 0.9938964, 1, 1, 1, 1, 1,
2.010154, -0.07626557, 1.301134, 1, 1, 1, 1, 1,
2.056148, 0.8558712, 1.45116, 1, 1, 1, 1, 1,
2.07667, -0.1597296, 1.541605, 1, 1, 1, 1, 1,
2.089237, -0.9556554, 2.181338, 1, 1, 1, 1, 1,
2.096819, 0.6289197, 1.180235, 1, 1, 1, 1, 1,
2.11694, 0.01365069, 1.160982, 1, 1, 1, 1, 1,
2.126514, 1.363803, 0.9150854, 0, 0, 1, 1, 1,
2.164089, 0.951055, 2.942538, 1, 0, 0, 1, 1,
2.170986, -0.8349655, 3.253701, 1, 0, 0, 1, 1,
2.248117, 0.3624123, -0.8202971, 1, 0, 0, 1, 1,
2.27571, -1.149339, 1.720738, 1, 0, 0, 1, 1,
2.284484, -0.2662767, 0.4068555, 1, 0, 0, 1, 1,
2.297116, -0.7914963, 0.9088861, 0, 0, 0, 1, 1,
2.425484, 0.08734082, 1.793224, 0, 0, 0, 1, 1,
2.440175, 1.154337, 1.710963, 0, 0, 0, 1, 1,
2.461833, 1.660836, 0.646893, 0, 0, 0, 1, 1,
2.465877, 1.530596, 2.888372, 0, 0, 0, 1, 1,
2.466796, -1.742529, 2.481977, 0, 0, 0, 1, 1,
2.470138, -0.3498372, 1.573298, 0, 0, 0, 1, 1,
2.496456, -0.5056021, 1.496606, 1, 1, 1, 1, 1,
2.535468, -0.2783994, 1.799665, 1, 1, 1, 1, 1,
2.597152, 1.518629, 1.557478, 1, 1, 1, 1, 1,
2.708685, -0.1083828, 2.539065, 1, 1, 1, 1, 1,
2.729166, 0.2011489, 3.378608, 1, 1, 1, 1, 1,
3.091323, -0.3696583, 1.873312, 1, 1, 1, 1, 1,
3.101469, 0.1605871, 0.5393708, 1, 1, 1, 1, 1
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
var radius = 10.08833;
var distance = 35.43483;
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
mvMatrix.translate( -0.009221315, 0.1986704, 0.3047476 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -35.43483);
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