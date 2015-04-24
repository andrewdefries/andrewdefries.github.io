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
-3.302965, -1.641054, -2.027091, 1, 0, 0, 1,
-3.027875, -0.2065677, -3.652588, 1, 0.007843138, 0, 1,
-2.961322, -0.2785136, -0.645463, 1, 0.01176471, 0, 1,
-2.791075, -0.1922559, -0.3060441, 1, 0.01960784, 0, 1,
-2.709589, -0.2467426, -1.452652, 1, 0.02352941, 0, 1,
-2.697577, -0.5887213, -1.112014, 1, 0.03137255, 0, 1,
-2.642865, 0.6220755, -1.663236, 1, 0.03529412, 0, 1,
-2.596089, 2.031971, -1.475928, 1, 0.04313726, 0, 1,
-2.432813, 0.4485627, 0.7615559, 1, 0.04705882, 0, 1,
-2.431281, 0.2246596, -2.22396, 1, 0.05490196, 0, 1,
-2.38108, 0.3713365, -2.384916, 1, 0.05882353, 0, 1,
-2.372126, -0.6337874, -2.108015, 1, 0.06666667, 0, 1,
-2.354201, 0.1081547, -0.0007920163, 1, 0.07058824, 0, 1,
-2.322756, 0.435166, -1.00651, 1, 0.07843138, 0, 1,
-2.292297, 0.6639189, -1.511173, 1, 0.08235294, 0, 1,
-2.291173, -0.3984475, -1.358794, 1, 0.09019608, 0, 1,
-2.241594, 0.6357396, -0.2187601, 1, 0.09411765, 0, 1,
-2.240018, 0.6631324, -0.09875335, 1, 0.1019608, 0, 1,
-2.187638, -0.9395126, -2.182276, 1, 0.1098039, 0, 1,
-2.143887, 0.105618, -2.693614, 1, 0.1137255, 0, 1,
-2.139594, -0.05939352, 0.4979585, 1, 0.1215686, 0, 1,
-2.125495, 0.1663657, -2.898326, 1, 0.1254902, 0, 1,
-2.116942, -0.7608503, -1.259974, 1, 0.1333333, 0, 1,
-2.06849, 0.681675, -2.251063, 1, 0.1372549, 0, 1,
-2.023672, -0.5162762, -4.189913, 1, 0.145098, 0, 1,
-2.018372, 0.450153, 0.04267617, 1, 0.1490196, 0, 1,
-2.016814, -0.6670274, -3.670314, 1, 0.1568628, 0, 1,
-2.001352, 0.6871681, -0.2537796, 1, 0.1607843, 0, 1,
-1.997327, 0.1408995, -1.273476, 1, 0.1686275, 0, 1,
-1.987089, -0.172735, -2.324391, 1, 0.172549, 0, 1,
-1.978973, 1.215386, -0.9807765, 1, 0.1803922, 0, 1,
-1.96704, -1.447994, -1.502992, 1, 0.1843137, 0, 1,
-1.954914, -0.3172873, -1.260097, 1, 0.1921569, 0, 1,
-1.940735, -0.8381593, -0.6364607, 1, 0.1960784, 0, 1,
-1.935645, -0.4100965, -0.7178102, 1, 0.2039216, 0, 1,
-1.926266, 0.6081532, -0.2183429, 1, 0.2117647, 0, 1,
-1.925396, -0.9956642, -2.398853, 1, 0.2156863, 0, 1,
-1.894314, -0.01166898, -1.474953, 1, 0.2235294, 0, 1,
-1.866906, 1.100513, -0.9988114, 1, 0.227451, 0, 1,
-1.866538, 2.351575, -0.8714384, 1, 0.2352941, 0, 1,
-1.857069, -1.017525, -1.842247, 1, 0.2392157, 0, 1,
-1.821608, 0.881426, -2.24164, 1, 0.2470588, 0, 1,
-1.786369, -0.6540554, -1.715595, 1, 0.2509804, 0, 1,
-1.784851, -1.833548, -1.78417, 1, 0.2588235, 0, 1,
-1.783916, -0.8624242, -2.475914, 1, 0.2627451, 0, 1,
-1.771825, 0.6405707, -1.226139, 1, 0.2705882, 0, 1,
-1.75653, -0.1368373, -0.4861763, 1, 0.2745098, 0, 1,
-1.754922, -0.9238186, -1.634539, 1, 0.282353, 0, 1,
-1.748769, -0.3268875, -0.4322223, 1, 0.2862745, 0, 1,
-1.747761, 1.140607, -1.505686, 1, 0.2941177, 0, 1,
-1.725904, -0.1817914, -1.816821, 1, 0.3019608, 0, 1,
-1.716498, 0.4562203, -0.7410361, 1, 0.3058824, 0, 1,
-1.70299, 1.689055, -2.027292, 1, 0.3137255, 0, 1,
-1.683509, -1.631213, -3.449247, 1, 0.3176471, 0, 1,
-1.668985, 1.097719, 0.03278011, 1, 0.3254902, 0, 1,
-1.661992, 1.0315, -3.184148, 1, 0.3294118, 0, 1,
-1.65807, 1.344767, -0.1416623, 1, 0.3372549, 0, 1,
-1.647918, -1.620306, -3.872731, 1, 0.3411765, 0, 1,
-1.613208, 1.062171, -2.198163, 1, 0.3490196, 0, 1,
-1.613149, -0.3585944, -5.182871, 1, 0.3529412, 0, 1,
-1.61093, 0.8884661, -2.023005, 1, 0.3607843, 0, 1,
-1.597896, 1.894617, -2.585126, 1, 0.3647059, 0, 1,
-1.594284, 0.2054216, -2.430243, 1, 0.372549, 0, 1,
-1.59054, 1.420879, -1.152619, 1, 0.3764706, 0, 1,
-1.56236, -0.8584026, -0.8196454, 1, 0.3843137, 0, 1,
-1.541495, -1.346909, -4.579811, 1, 0.3882353, 0, 1,
-1.537562, 0.770947, -0.5431275, 1, 0.3960784, 0, 1,
-1.535345, -0.151553, -1.456596, 1, 0.4039216, 0, 1,
-1.509661, 1.682131, 0.4257158, 1, 0.4078431, 0, 1,
-1.484442, -0.3017761, -1.578057, 1, 0.4156863, 0, 1,
-1.466079, -0.6357365, -2.977378, 1, 0.4196078, 0, 1,
-1.449654, 1.471906, -0.8196897, 1, 0.427451, 0, 1,
-1.448892, 0.2648516, -3.217716, 1, 0.4313726, 0, 1,
-1.446296, -1.309374, -4.456749, 1, 0.4392157, 0, 1,
-1.442629, -0.5953204, -2.232165, 1, 0.4431373, 0, 1,
-1.434503, -0.1452219, -0.5552819, 1, 0.4509804, 0, 1,
-1.432588, 2.560233, -0.3570648, 1, 0.454902, 0, 1,
-1.429576, -1.405227, -3.619462, 1, 0.4627451, 0, 1,
-1.422307, -0.8022896, -1.924839, 1, 0.4666667, 0, 1,
-1.422017, -0.5196993, -1.434299, 1, 0.4745098, 0, 1,
-1.421345, 0.005479933, -1.494481, 1, 0.4784314, 0, 1,
-1.419394, -1.049962, -1.449735, 1, 0.4862745, 0, 1,
-1.403968, 0.3793831, -1.793643, 1, 0.4901961, 0, 1,
-1.381945, 0.2354447, -0.5407105, 1, 0.4980392, 0, 1,
-1.376038, -0.3990507, -2.06566, 1, 0.5058824, 0, 1,
-1.373248, 0.5343266, -0.1922792, 1, 0.509804, 0, 1,
-1.372963, 1.182288, -1.984877, 1, 0.5176471, 0, 1,
-1.358705, 0.6101488, -2.259477, 1, 0.5215687, 0, 1,
-1.348831, 0.9415432, 0.5594679, 1, 0.5294118, 0, 1,
-1.347224, -0.5248874, -2.69547, 1, 0.5333334, 0, 1,
-1.347146, -0.5851387, -1.111727, 1, 0.5411765, 0, 1,
-1.346941, -0.03881977, -1.477322, 1, 0.5450981, 0, 1,
-1.340041, -1.005958, -2.886976, 1, 0.5529412, 0, 1,
-1.334705, -0.989772, -1.888571, 1, 0.5568628, 0, 1,
-1.334418, -0.5340998, -3.253127, 1, 0.5647059, 0, 1,
-1.309618, 2.07453, -1.335931, 1, 0.5686275, 0, 1,
-1.305848, 1.24479, 0.754942, 1, 0.5764706, 0, 1,
-1.294721, 1.56374, -2.334062, 1, 0.5803922, 0, 1,
-1.288194, -0.210074, -1.878202, 1, 0.5882353, 0, 1,
-1.284043, -0.6758274, -2.286276, 1, 0.5921569, 0, 1,
-1.28249, 1.236099, -0.9406237, 1, 0.6, 0, 1,
-1.278986, -0.1802747, 0.0880136, 1, 0.6078432, 0, 1,
-1.272977, -0.2071698, -2.086603, 1, 0.6117647, 0, 1,
-1.269467, 0.1833844, 0.01111276, 1, 0.6196079, 0, 1,
-1.262804, -0.667302, -2.258415, 1, 0.6235294, 0, 1,
-1.251881, -0.8760154, -2.355374, 1, 0.6313726, 0, 1,
-1.238936, -1.12148, -4.036108, 1, 0.6352941, 0, 1,
-1.236592, -1.564444, -1.745519, 1, 0.6431373, 0, 1,
-1.228267, 0.9510103, -1.295454, 1, 0.6470588, 0, 1,
-1.227936, 0.1603008, -2.51131, 1, 0.654902, 0, 1,
-1.218292, 0.5880533, -3.443371, 1, 0.6588235, 0, 1,
-1.217242, 0.3708355, 0.8119165, 1, 0.6666667, 0, 1,
-1.212516, -0.8614216, -1.080555, 1, 0.6705883, 0, 1,
-1.20996, -1.827827, -3.356697, 1, 0.6784314, 0, 1,
-1.19251, 0.6979285, -2.291031, 1, 0.682353, 0, 1,
-1.191796, 1.365329, -1.415937, 1, 0.6901961, 0, 1,
-1.190838, 1.335989, 0.2464289, 1, 0.6941177, 0, 1,
-1.187368, 2.78094, -0.6448235, 1, 0.7019608, 0, 1,
-1.186154, 1.141847, -0.2741159, 1, 0.7098039, 0, 1,
-1.184159, -0.5407953, -4.530559, 1, 0.7137255, 0, 1,
-1.177316, 1.365061, -2.640384, 1, 0.7215686, 0, 1,
-1.177192, 0.007317611, -0.9670445, 1, 0.7254902, 0, 1,
-1.17698, 0.4888537, -2.743296, 1, 0.7333333, 0, 1,
-1.170536, 0.447739, -1.596194, 1, 0.7372549, 0, 1,
-1.158954, -1.735239, -3.000298, 1, 0.7450981, 0, 1,
-1.158455, -0.368045, -3.378631, 1, 0.7490196, 0, 1,
-1.15694, -0.7388188, -1.815127, 1, 0.7568628, 0, 1,
-1.145283, -0.2611912, -2.298892, 1, 0.7607843, 0, 1,
-1.143495, 0.4622593, -2.273275, 1, 0.7686275, 0, 1,
-1.136452, 0.3873269, -0.2593717, 1, 0.772549, 0, 1,
-1.136065, -0.1620449, -1.590964, 1, 0.7803922, 0, 1,
-1.135602, 0.3760044, -0.5039314, 1, 0.7843137, 0, 1,
-1.135006, -0.2896501, -3.097714, 1, 0.7921569, 0, 1,
-1.123535, -1.281588, -2.163711, 1, 0.7960784, 0, 1,
-1.122184, -1.347172, -4.175673, 1, 0.8039216, 0, 1,
-1.119941, 0.9791048, -1.652744, 1, 0.8117647, 0, 1,
-1.118718, 0.3697456, -1.994926, 1, 0.8156863, 0, 1,
-1.112326, -0.8681539, -1.474373, 1, 0.8235294, 0, 1,
-1.109609, 0.9077036, -0.745473, 1, 0.827451, 0, 1,
-1.109472, -0.9077753, -1.222889, 1, 0.8352941, 0, 1,
-1.098268, -0.4817121, -1.003379, 1, 0.8392157, 0, 1,
-1.096598, -0.9499725, -2.42732, 1, 0.8470588, 0, 1,
-1.095327, 0.04299117, 0.3688552, 1, 0.8509804, 0, 1,
-1.093491, -0.2056359, -2.107218, 1, 0.8588235, 0, 1,
-1.09028, 0.1615853, 0.3817196, 1, 0.8627451, 0, 1,
-1.088888, 1.243911, 0.1494556, 1, 0.8705882, 0, 1,
-1.085517, -0.7437869, -2.661199, 1, 0.8745098, 0, 1,
-1.079484, 0.9217026, -0.5093172, 1, 0.8823529, 0, 1,
-1.073985, 1.183996, 0.6799245, 1, 0.8862745, 0, 1,
-1.070641, 0.8001299, 0.9704053, 1, 0.8941177, 0, 1,
-1.070215, -1.137806, -2.309224, 1, 0.8980392, 0, 1,
-1.068353, 0.7173754, -1.02152, 1, 0.9058824, 0, 1,
-1.067847, -0.5247737, -2.219186, 1, 0.9137255, 0, 1,
-1.066715, -2.245478, -1.467268, 1, 0.9176471, 0, 1,
-1.065662, -0.1010883, 1.557567, 1, 0.9254902, 0, 1,
-1.054642, -0.623634, -2.962456, 1, 0.9294118, 0, 1,
-1.049425, 0.6260952, -1.162961, 1, 0.9372549, 0, 1,
-1.040003, -0.6431451, -1.798893, 1, 0.9411765, 0, 1,
-1.039582, 0.1721991, -0.04753082, 1, 0.9490196, 0, 1,
-1.036478, -0.7204744, -2.275184, 1, 0.9529412, 0, 1,
-1.034675, 1.752332, 0.4664613, 1, 0.9607843, 0, 1,
-1.029727, -1.16347, -1.653607, 1, 0.9647059, 0, 1,
-1.024266, -0.969797, -2.344379, 1, 0.972549, 0, 1,
-1.019665, 0.6024552, -0.2495636, 1, 0.9764706, 0, 1,
-1.017024, -0.1748521, -1.953398, 1, 0.9843137, 0, 1,
-1.008067, 1.634515, -0.2562487, 1, 0.9882353, 0, 1,
-1.004873, 1.47764, -1.654155, 1, 0.9960784, 0, 1,
-1.00466, -0.3700791, -1.739751, 0.9960784, 1, 0, 1,
-1.004039, 0.8375407, -0.5437286, 0.9921569, 1, 0, 1,
-1.001583, -0.9885415, -4.036655, 0.9843137, 1, 0, 1,
-0.9958279, 0.8401057, -0.07122309, 0.9803922, 1, 0, 1,
-0.9949123, -0.8769026, -2.852586, 0.972549, 1, 0, 1,
-0.9870963, 0.2473076, -1.426605, 0.9686275, 1, 0, 1,
-0.984556, -1.092285, -2.651814, 0.9607843, 1, 0, 1,
-0.9841458, -0.6798828, -2.841119, 0.9568627, 1, 0, 1,
-0.9839652, -0.8844002, -1.71183, 0.9490196, 1, 0, 1,
-0.9744554, 0.5884897, -1.045545, 0.945098, 1, 0, 1,
-0.9715865, -1.197473, -2.257766, 0.9372549, 1, 0, 1,
-0.9675068, -1.403439, -2.809932, 0.9333333, 1, 0, 1,
-0.9673953, -0.466003, -1.628716, 0.9254902, 1, 0, 1,
-0.9667079, -2.068997, -1.181207, 0.9215686, 1, 0, 1,
-0.9642383, 0.2160014, -2.414323, 0.9137255, 1, 0, 1,
-0.9546162, -0.9493993, -3.498425, 0.9098039, 1, 0, 1,
-0.9519582, 0.02176485, 0.2000858, 0.9019608, 1, 0, 1,
-0.9507293, -0.5211384, -2.203807, 0.8941177, 1, 0, 1,
-0.9404903, 1.297485, 1.648772, 0.8901961, 1, 0, 1,
-0.9326266, -0.957432, -2.157175, 0.8823529, 1, 0, 1,
-0.9306955, -1.044474, -0.4341478, 0.8784314, 1, 0, 1,
-0.9256777, 0.6384687, -0.4704666, 0.8705882, 1, 0, 1,
-0.9203345, -0.2237494, -0.02344087, 0.8666667, 1, 0, 1,
-0.9192768, 0.7691252, 1.296025, 0.8588235, 1, 0, 1,
-0.9174754, 1.687866, -1.432022, 0.854902, 1, 0, 1,
-0.9163691, 0.5184582, -1.221785, 0.8470588, 1, 0, 1,
-0.9096109, 0.5419537, 0.1463909, 0.8431373, 1, 0, 1,
-0.9085063, 0.3111734, -0.08798566, 0.8352941, 1, 0, 1,
-0.9080339, 0.9375589, 0.4577791, 0.8313726, 1, 0, 1,
-0.9053109, 1.137856, -1.520972, 0.8235294, 1, 0, 1,
-0.8978173, 1.034624, -1.845067, 0.8196079, 1, 0, 1,
-0.8976915, 0.7225054, 1.414087, 0.8117647, 1, 0, 1,
-0.8966172, 0.8601948, -0.8209242, 0.8078431, 1, 0, 1,
-0.8951324, 0.7247143, -1.293433, 0.8, 1, 0, 1,
-0.8926378, -0.7740429, -2.254153, 0.7921569, 1, 0, 1,
-0.8884119, -1.128664, -1.323202, 0.7882353, 1, 0, 1,
-0.8842674, 0.6603785, -1.003097, 0.7803922, 1, 0, 1,
-0.877811, 0.2047167, -1.581533, 0.7764706, 1, 0, 1,
-0.8712769, 0.3058881, -2.026156, 0.7686275, 1, 0, 1,
-0.8623387, -1.935179, -2.316077, 0.7647059, 1, 0, 1,
-0.8619542, 0.6786032, -2.169617, 0.7568628, 1, 0, 1,
-0.8585854, -1.02095, -4.385868, 0.7529412, 1, 0, 1,
-0.8584271, -0.002714565, -0.7847778, 0.7450981, 1, 0, 1,
-0.8529517, -1.100556, -2.672825, 0.7411765, 1, 0, 1,
-0.8527366, 1.361908, 0.04783734, 0.7333333, 1, 0, 1,
-0.8520166, 0.4912022, -2.116373, 0.7294118, 1, 0, 1,
-0.8465239, -2.134891, -2.371103, 0.7215686, 1, 0, 1,
-0.8431057, 0.5884393, -3.135577, 0.7176471, 1, 0, 1,
-0.8374144, 0.6592054, -1.275788, 0.7098039, 1, 0, 1,
-0.8337563, 0.9586621, -0.7196784, 0.7058824, 1, 0, 1,
-0.8314699, -0.04270909, -0.4729184, 0.6980392, 1, 0, 1,
-0.8270119, 0.168047, -0.5521219, 0.6901961, 1, 0, 1,
-0.8187289, 0.9540703, 0.7790235, 0.6862745, 1, 0, 1,
-0.8118221, 1.144346, -1.018019, 0.6784314, 1, 0, 1,
-0.8100703, -0.1159957, -3.367897, 0.6745098, 1, 0, 1,
-0.8097605, 0.5028543, -1.203058, 0.6666667, 1, 0, 1,
-0.8027543, 0.8568268, -0.2493897, 0.6627451, 1, 0, 1,
-0.801735, 0.0723905, -4.760424, 0.654902, 1, 0, 1,
-0.7997093, 1.276276, -0.2573376, 0.6509804, 1, 0, 1,
-0.7995566, -0.7023832, -1.168353, 0.6431373, 1, 0, 1,
-0.7989438, -0.06699625, -1.814846, 0.6392157, 1, 0, 1,
-0.7988561, 0.2737307, -2.072419, 0.6313726, 1, 0, 1,
-0.792146, -0.4656979, -2.314843, 0.627451, 1, 0, 1,
-0.7832205, 0.3765348, 0.5542492, 0.6196079, 1, 0, 1,
-0.7749945, 1.366213, -1.455372, 0.6156863, 1, 0, 1,
-0.7744637, 0.02652533, -2.577063, 0.6078432, 1, 0, 1,
-0.7589673, -2.091641, -3.526773, 0.6039216, 1, 0, 1,
-0.7578812, -0.7944071, -1.114268, 0.5960785, 1, 0, 1,
-0.7537661, -0.9947845, -3.433585, 0.5882353, 1, 0, 1,
-0.7524714, -2.032637, -4.120748, 0.5843138, 1, 0, 1,
-0.7509913, 2.253477, -0.09869512, 0.5764706, 1, 0, 1,
-0.7400926, 0.4019296, 0.379523, 0.572549, 1, 0, 1,
-0.7371845, -1.379954, -2.99591, 0.5647059, 1, 0, 1,
-0.7365558, -0.1309247, -0.6090486, 0.5607843, 1, 0, 1,
-0.7288452, 0.998607, -0.3732231, 0.5529412, 1, 0, 1,
-0.724716, 2.042098, -0.4270741, 0.5490196, 1, 0, 1,
-0.7215506, -0.6891847, -4.177307, 0.5411765, 1, 0, 1,
-0.7215335, 1.355316, -0.8270395, 0.5372549, 1, 0, 1,
-0.7148758, -0.7007844, -2.357584, 0.5294118, 1, 0, 1,
-0.709039, -0.87498, -1.883689, 0.5254902, 1, 0, 1,
-0.7086015, 0.1660814, -2.282477, 0.5176471, 1, 0, 1,
-0.7062827, 0.8112159, -0.7717991, 0.5137255, 1, 0, 1,
-0.7058427, 0.7063659, -0.9823366, 0.5058824, 1, 0, 1,
-0.7055074, -0.9009676, -4.047876, 0.5019608, 1, 0, 1,
-0.704482, 0.9099465, -0.6779269, 0.4941176, 1, 0, 1,
-0.7011027, -0.03464478, -0.9095836, 0.4862745, 1, 0, 1,
-0.6994734, -1.170059, -0.7553552, 0.4823529, 1, 0, 1,
-0.6983704, 1.09337, -0.00224955, 0.4745098, 1, 0, 1,
-0.6982549, 1.884174, 0.4952615, 0.4705882, 1, 0, 1,
-0.6968538, 0.8969941, -2.135151, 0.4627451, 1, 0, 1,
-0.6935192, 0.08712696, -2.148928, 0.4588235, 1, 0, 1,
-0.6893127, -0.8326085, -2.834226, 0.4509804, 1, 0, 1,
-0.6850712, -1.27517, -2.122687, 0.4470588, 1, 0, 1,
-0.6764919, -1.102668, -2.969437, 0.4392157, 1, 0, 1,
-0.6750823, 2.996094, 0.3069969, 0.4352941, 1, 0, 1,
-0.6741621, 0.01571123, -3.02248, 0.427451, 1, 0, 1,
-0.6717319, 0.5010419, 0.2336769, 0.4235294, 1, 0, 1,
-0.6624201, -1.814217, -4.735097, 0.4156863, 1, 0, 1,
-0.662001, 0.7746004, -1.51698, 0.4117647, 1, 0, 1,
-0.6605355, -1.731314, -3.066362, 0.4039216, 1, 0, 1,
-0.6590408, 0.3198311, 1.144717, 0.3960784, 1, 0, 1,
-0.6584406, 0.6106709, -0.5171257, 0.3921569, 1, 0, 1,
-0.6563046, -1.144778, -2.842552, 0.3843137, 1, 0, 1,
-0.6549601, 2.313843, 0.4164471, 0.3803922, 1, 0, 1,
-0.6547894, 2.234628, -2.77759, 0.372549, 1, 0, 1,
-0.6477067, -0.4124675, -0.965143, 0.3686275, 1, 0, 1,
-0.6459374, 1.857215, -0.7006723, 0.3607843, 1, 0, 1,
-0.6439556, -1.06209, -2.898478, 0.3568628, 1, 0, 1,
-0.6426928, 0.1476111, -0.484862, 0.3490196, 1, 0, 1,
-0.641889, -0.8464609, -4.681477, 0.345098, 1, 0, 1,
-0.63803, 0.3815062, -1.057325, 0.3372549, 1, 0, 1,
-0.6366719, -0.7663192, -2.383006, 0.3333333, 1, 0, 1,
-0.6319011, -0.3897575, -0.7711245, 0.3254902, 1, 0, 1,
-0.6253058, 0.4372658, 0.1908995, 0.3215686, 1, 0, 1,
-0.6246189, 1.319685, -1.309683, 0.3137255, 1, 0, 1,
-0.6233715, 0.5231668, -2.093898, 0.3098039, 1, 0, 1,
-0.6207793, 0.6116269, -1.481241, 0.3019608, 1, 0, 1,
-0.6191113, 0.2679861, -0.4468111, 0.2941177, 1, 0, 1,
-0.6170851, -0.8110084, -2.930013, 0.2901961, 1, 0, 1,
-0.6144127, 0.1466533, -1.713542, 0.282353, 1, 0, 1,
-0.6091943, 0.4225438, -1.104691, 0.2784314, 1, 0, 1,
-0.6022076, -0.7364708, -2.412366, 0.2705882, 1, 0, 1,
-0.5991046, -0.07589625, -1.703248, 0.2666667, 1, 0, 1,
-0.5966579, 1.078794, -1.5484, 0.2588235, 1, 0, 1,
-0.5949243, 0.7447571, 0.7476795, 0.254902, 1, 0, 1,
-0.5921799, -1.240661, -1.788231, 0.2470588, 1, 0, 1,
-0.5879761, 1.033, -0.4795383, 0.2431373, 1, 0, 1,
-0.5849931, 1.881812, -0.4045238, 0.2352941, 1, 0, 1,
-0.5821991, -0.5345926, -2.118558, 0.2313726, 1, 0, 1,
-0.5815757, -0.1254866, -2.060199, 0.2235294, 1, 0, 1,
-0.5809538, 0.3339995, -1.004267, 0.2196078, 1, 0, 1,
-0.5781533, 0.08072944, -0.6408736, 0.2117647, 1, 0, 1,
-0.5729542, 2.341229, 0.255821, 0.2078431, 1, 0, 1,
-0.5697658, -0.6936656, -3.222012, 0.2, 1, 0, 1,
-0.5681171, 0.4958012, -1.617959, 0.1921569, 1, 0, 1,
-0.5622168, -0.1725995, -2.744883, 0.1882353, 1, 0, 1,
-0.5609074, 1.388043, -1.97488, 0.1803922, 1, 0, 1,
-0.5565724, 0.5927481, -0.9235646, 0.1764706, 1, 0, 1,
-0.5561051, 0.8537868, 1.054595, 0.1686275, 1, 0, 1,
-0.5543533, -0.2778651, -3.842515, 0.1647059, 1, 0, 1,
-0.5541723, -0.3730775, -1.735611, 0.1568628, 1, 0, 1,
-0.5527291, 0.6600641, -2.572818, 0.1529412, 1, 0, 1,
-0.5483486, 0.3291838, 0.1131384, 0.145098, 1, 0, 1,
-0.5478749, 0.9516159, -1.418106, 0.1411765, 1, 0, 1,
-0.5472167, -0.5118702, -2.23132, 0.1333333, 1, 0, 1,
-0.546057, -1.771382, -3.522881, 0.1294118, 1, 0, 1,
-0.5377088, -1.221313, -4.004461, 0.1215686, 1, 0, 1,
-0.5363912, 0.3381424, -1.093037, 0.1176471, 1, 0, 1,
-0.5352445, -1.906854, -2.121652, 0.1098039, 1, 0, 1,
-0.5332539, 1.219012, -0.5066696, 0.1058824, 1, 0, 1,
-0.5299149, 2.343021, -0.8670074, 0.09803922, 1, 0, 1,
-0.5191327, -2.025223, -3.529489, 0.09019608, 1, 0, 1,
-0.5183405, -0.8484214, -0.8646376, 0.08627451, 1, 0, 1,
-0.5174073, -1.572114, -2.782358, 0.07843138, 1, 0, 1,
-0.5170688, -1.356329, -2.206097, 0.07450981, 1, 0, 1,
-0.5132511, -1.001034, -1.916434, 0.06666667, 1, 0, 1,
-0.5122629, -0.2059909, -0.363124, 0.0627451, 1, 0, 1,
-0.5087615, 1.189664, -1.586122, 0.05490196, 1, 0, 1,
-0.5044148, 0.6522766, -2.051952, 0.05098039, 1, 0, 1,
-0.503976, 0.06878406, -1.722043, 0.04313726, 1, 0, 1,
-0.5003244, 0.7292159, -1.061418, 0.03921569, 1, 0, 1,
-0.4999286, 0.05818275, -1.597062, 0.03137255, 1, 0, 1,
-0.4981037, 0.2239094, -0.5403293, 0.02745098, 1, 0, 1,
-0.4969367, 0.3311106, -0.4320173, 0.01960784, 1, 0, 1,
-0.4954851, -0.02097609, -2.239161, 0.01568628, 1, 0, 1,
-0.49353, -0.7571543, -3.184355, 0.007843138, 1, 0, 1,
-0.4900716, -1.248497, -3.963003, 0.003921569, 1, 0, 1,
-0.4697249, 0.86265, -0.5577506, 0, 1, 0.003921569, 1,
-0.4619506, -0.5822508, -3.137658, 0, 1, 0.01176471, 1,
-0.4553205, -0.02166441, -1.812634, 0, 1, 0.01568628, 1,
-0.454118, -0.8141771, -1.59158, 0, 1, 0.02352941, 1,
-0.4456237, 0.4206378, -0.99661, 0, 1, 0.02745098, 1,
-0.4439783, -1.495516, -4.195429, 0, 1, 0.03529412, 1,
-0.4434629, -0.7958083, -2.102044, 0, 1, 0.03921569, 1,
-0.4402849, 0.8600829, 1.483423, 0, 1, 0.04705882, 1,
-0.4354376, 0.7484406, 0.7367191, 0, 1, 0.05098039, 1,
-0.4347333, 1.093345, 1.140978, 0, 1, 0.05882353, 1,
-0.4329717, -0.7071237, -2.523033, 0, 1, 0.0627451, 1,
-0.4286426, -0.6971261, -1.294892, 0, 1, 0.07058824, 1,
-0.4282569, 0.6404724, -1.692049, 0, 1, 0.07450981, 1,
-0.4234729, -2.227043, -2.702033, 0, 1, 0.08235294, 1,
-0.4215648, 0.4356195, -0.6230901, 0, 1, 0.08627451, 1,
-0.4161675, 0.7780227, -0.6293421, 0, 1, 0.09411765, 1,
-0.4118899, -1.035102, -1.61754, 0, 1, 0.1019608, 1,
-0.4095564, -0.3725678, -2.1873, 0, 1, 0.1058824, 1,
-0.4051715, -0.01830834, -1.074783, 0, 1, 0.1137255, 1,
-0.4048587, -2.034274, -3.523395, 0, 1, 0.1176471, 1,
-0.4011737, -1.165412, -2.540062, 0, 1, 0.1254902, 1,
-0.3997943, 1.438375, -1.665089, 0, 1, 0.1294118, 1,
-0.39885, -0.2148758, -1.598533, 0, 1, 0.1372549, 1,
-0.3961806, -0.550909, -2.973151, 0, 1, 0.1411765, 1,
-0.3908594, 0.2075549, -1.100195, 0, 1, 0.1490196, 1,
-0.3888665, 3.11498, -1.04871, 0, 1, 0.1529412, 1,
-0.3877934, -0.4611255, -1.454086, 0, 1, 0.1607843, 1,
-0.3848817, 0.3919328, -0.8852991, 0, 1, 0.1647059, 1,
-0.3747002, 0.582404, -1.277717, 0, 1, 0.172549, 1,
-0.3702701, 1.291326, 0.4819008, 0, 1, 0.1764706, 1,
-0.3699336, 0.4195285, -0.5197782, 0, 1, 0.1843137, 1,
-0.3663837, 1.291338, 0.07199173, 0, 1, 0.1882353, 1,
-0.3653728, 0.8634763, 0.4165958, 0, 1, 0.1960784, 1,
-0.3652662, -1.117992, -2.875706, 0, 1, 0.2039216, 1,
-0.3648869, 0.9961025, -0.1596917, 0, 1, 0.2078431, 1,
-0.3638278, 0.1850509, -1.893904, 0, 1, 0.2156863, 1,
-0.3634545, 1.95606, -1.089578, 0, 1, 0.2196078, 1,
-0.3634093, -1.859318, -1.522013, 0, 1, 0.227451, 1,
-0.3599772, 1.073995, -0.552866, 0, 1, 0.2313726, 1,
-0.3574675, 0.3033645, 0.009835341, 0, 1, 0.2392157, 1,
-0.351269, -0.2895061, -2.11738, 0, 1, 0.2431373, 1,
-0.3509884, -0.0189955, -2.666309, 0, 1, 0.2509804, 1,
-0.3507867, 0.1383959, -3.137428, 0, 1, 0.254902, 1,
-0.3493091, -1.38534, -2.555132, 0, 1, 0.2627451, 1,
-0.3482771, 0.7149708, -1.339965, 0, 1, 0.2666667, 1,
-0.3300351, -1.666353, -3.579351, 0, 1, 0.2745098, 1,
-0.3218147, -0.8584437, -3.807712, 0, 1, 0.2784314, 1,
-0.3192163, 0.3151284, -0.1215025, 0, 1, 0.2862745, 1,
-0.3145722, 2.076818, -1.011906, 0, 1, 0.2901961, 1,
-0.3114849, 0.3096085, -2.29775, 0, 1, 0.2980392, 1,
-0.3086765, -1.551452, -4.310682, 0, 1, 0.3058824, 1,
-0.3084793, 0.9760422, -1.319943, 0, 1, 0.3098039, 1,
-0.3027724, 2.046912, 0.2027752, 0, 1, 0.3176471, 1,
-0.3007924, 2.158511, -0.1303809, 0, 1, 0.3215686, 1,
-0.300402, -0.7786852, -1.724483, 0, 1, 0.3294118, 1,
-0.2974897, -0.08211833, -1.311814, 0, 1, 0.3333333, 1,
-0.2962559, 0.7608817, -1.858916, 0, 1, 0.3411765, 1,
-0.291563, 0.9454747, -0.6396136, 0, 1, 0.345098, 1,
-0.2900506, 0.4315495, 0.9237586, 0, 1, 0.3529412, 1,
-0.2859865, -0.03433478, -3.31631, 0, 1, 0.3568628, 1,
-0.2802971, 0.04444206, -1.378258, 0, 1, 0.3647059, 1,
-0.279839, 0.5767221, -1.133495, 0, 1, 0.3686275, 1,
-0.2792589, 0.1449301, -0.8715577, 0, 1, 0.3764706, 1,
-0.2740663, -0.9706986, -2.455827, 0, 1, 0.3803922, 1,
-0.273969, -1.094499, -3.558091, 0, 1, 0.3882353, 1,
-0.26896, 0.4507906, -0.8572794, 0, 1, 0.3921569, 1,
-0.2645607, 0.7320497, -0.3207791, 0, 1, 0.4, 1,
-0.2597317, -1.074733, -2.427616, 0, 1, 0.4078431, 1,
-0.2595959, 1.212998, -0.4535163, 0, 1, 0.4117647, 1,
-0.2590966, -0.6858141, -3.046984, 0, 1, 0.4196078, 1,
-0.258569, -0.2759146, -1.653995, 0, 1, 0.4235294, 1,
-0.2510753, 0.6107837, -1.336233, 0, 1, 0.4313726, 1,
-0.248212, -1.724607, -3.018425, 0, 1, 0.4352941, 1,
-0.2451571, -1.440424, -2.563453, 0, 1, 0.4431373, 1,
-0.2374494, 0.3425789, -1.843383, 0, 1, 0.4470588, 1,
-0.236414, -1.256313, -3.165668, 0, 1, 0.454902, 1,
-0.2349319, -0.4216744, -2.056834, 0, 1, 0.4588235, 1,
-0.2334933, -0.9407165, -2.396246, 0, 1, 0.4666667, 1,
-0.2319982, 0.2524476, -1.690212, 0, 1, 0.4705882, 1,
-0.2314782, 0.597193, -0.7636073, 0, 1, 0.4784314, 1,
-0.2303569, -0.03068984, -1.739269, 0, 1, 0.4823529, 1,
-0.2299714, 0.4840018, -1.813262, 0, 1, 0.4901961, 1,
-0.2240804, -0.132112, -2.082187, 0, 1, 0.4941176, 1,
-0.2233761, -0.9804386, -3.288213, 0, 1, 0.5019608, 1,
-0.2201351, 1.688532, -0.2655506, 0, 1, 0.509804, 1,
-0.2193812, -0.4650071, -2.938925, 0, 1, 0.5137255, 1,
-0.2156382, -1.829765, -4.038312, 0, 1, 0.5215687, 1,
-0.2146983, 0.6351027, -0.2978702, 0, 1, 0.5254902, 1,
-0.209677, -0.1960808, -1.805447, 0, 1, 0.5333334, 1,
-0.2050337, -0.7228873, -2.773501, 0, 1, 0.5372549, 1,
-0.2045358, 1.13402, 0.6094733, 0, 1, 0.5450981, 1,
-0.2008457, -0.09817929, -0.1716283, 0, 1, 0.5490196, 1,
-0.1986554, -1.768028, -3.390025, 0, 1, 0.5568628, 1,
-0.1961069, 0.2648107, -0.9023709, 0, 1, 0.5607843, 1,
-0.1904255, 0.7747645, -1.383684, 0, 1, 0.5686275, 1,
-0.1849535, -0.2399678, -1.507743, 0, 1, 0.572549, 1,
-0.1811472, -1.554714, -2.401242, 0, 1, 0.5803922, 1,
-0.1805108, -1.255448, -1.638049, 0, 1, 0.5843138, 1,
-0.1787931, 0.2056036, -0.5277132, 0, 1, 0.5921569, 1,
-0.1785016, -0.5328889, -2.807906, 0, 1, 0.5960785, 1,
-0.1781184, -0.4670598, -4.257329, 0, 1, 0.6039216, 1,
-0.1756267, 0.8887699, -2.286049, 0, 1, 0.6117647, 1,
-0.174012, 0.444873, 0.7164407, 0, 1, 0.6156863, 1,
-0.1717498, 1.269803, 0.2446883, 0, 1, 0.6235294, 1,
-0.1716935, 0.1724519, -0.2338565, 0, 1, 0.627451, 1,
-0.1697862, -0.3032046, -3.216636, 0, 1, 0.6352941, 1,
-0.1597379, 1.215371, -1.789783, 0, 1, 0.6392157, 1,
-0.1584887, -0.261883, -2.224494, 0, 1, 0.6470588, 1,
-0.1564902, -1.536535, -2.398012, 0, 1, 0.6509804, 1,
-0.1563101, -0.8551584, -3.378289, 0, 1, 0.6588235, 1,
-0.1562242, 1.122126, -0.6735257, 0, 1, 0.6627451, 1,
-0.1554861, -0.6072204, -3.461272, 0, 1, 0.6705883, 1,
-0.1536878, 1.210255, -1.162817, 0, 1, 0.6745098, 1,
-0.1517536, -0.7306193, -3.570539, 0, 1, 0.682353, 1,
-0.1486642, -0.05129813, -1.957045, 0, 1, 0.6862745, 1,
-0.1482492, 0.3096955, -1.527077, 0, 1, 0.6941177, 1,
-0.1478629, -0.3429035, -3.540902, 0, 1, 0.7019608, 1,
-0.1432192, 0.005359331, -1.451131, 0, 1, 0.7058824, 1,
-0.1404907, 0.3103512, -2.269876, 0, 1, 0.7137255, 1,
-0.1396312, -0.0498652, -0.02733573, 0, 1, 0.7176471, 1,
-0.1373953, -1.178434, -3.56101, 0, 1, 0.7254902, 1,
-0.1332407, 0.7969056, -1.111673, 0, 1, 0.7294118, 1,
-0.1323856, -0.2426929, -3.322583, 0, 1, 0.7372549, 1,
-0.1302516, 1.23847, 0.6600088, 0, 1, 0.7411765, 1,
-0.1162565, -0.4298349, -2.006442, 0, 1, 0.7490196, 1,
-0.1162204, 0.7468306, 0.01439962, 0, 1, 0.7529412, 1,
-0.1129029, 1.225406, -0.3186293, 0, 1, 0.7607843, 1,
-0.1100057, 0.7589554, 1.193901, 0, 1, 0.7647059, 1,
-0.1099163, -0.2545045, -4.222561, 0, 1, 0.772549, 1,
-0.1078108, 0.4453593, -0.4045587, 0, 1, 0.7764706, 1,
-0.1077496, -0.3219755, -2.546372, 0, 1, 0.7843137, 1,
-0.1064026, 1.471524, 0.6956355, 0, 1, 0.7882353, 1,
-0.1061038, -1.189571, -2.996795, 0, 1, 0.7960784, 1,
-0.1045867, 0.587927, -0.9174721, 0, 1, 0.8039216, 1,
-0.1039187, 1.328148, -0.903401, 0, 1, 0.8078431, 1,
-0.1030967, -0.4974607, -2.331481, 0, 1, 0.8156863, 1,
-0.1026087, 1.313498, -0.8362671, 0, 1, 0.8196079, 1,
-0.1023853, 1.840638, -0.3078284, 0, 1, 0.827451, 1,
-0.1018851, -0.683263, -2.468884, 0, 1, 0.8313726, 1,
-0.1014052, 0.5940809, -1.469378, 0, 1, 0.8392157, 1,
-0.1008872, -1.026939, -3.460361, 0, 1, 0.8431373, 1,
-0.09910719, 1.139808, 1.6425, 0, 1, 0.8509804, 1,
-0.09424078, -0.30912, -1.534227, 0, 1, 0.854902, 1,
-0.09113841, -0.3418564, -2.672993, 0, 1, 0.8627451, 1,
-0.08840401, -0.6322737, -3.319994, 0, 1, 0.8666667, 1,
-0.08002714, -0.3280498, -2.631946, 0, 1, 0.8745098, 1,
-0.07802907, -0.1877668, -2.630931, 0, 1, 0.8784314, 1,
-0.07797592, -0.337814, -2.439574, 0, 1, 0.8862745, 1,
-0.07144397, -0.5786796, -2.220529, 0, 1, 0.8901961, 1,
-0.07035299, 0.6799394, 1.275664, 0, 1, 0.8980392, 1,
-0.06866192, 0.898059, 1.026348, 0, 1, 0.9058824, 1,
-0.0568395, -0.4198543, -1.943813, 0, 1, 0.9098039, 1,
-0.05330421, 0.7821501, 0.006091138, 0, 1, 0.9176471, 1,
-0.05249865, -0.4212513, -2.366078, 0, 1, 0.9215686, 1,
-0.05074963, 0.8451286, 0.4131712, 0, 1, 0.9294118, 1,
-0.04904288, -1.417994, -3.439269, 0, 1, 0.9333333, 1,
-0.04498096, 0.01977858, 0.01290335, 0, 1, 0.9411765, 1,
-0.04349181, -0.9160756, -2.971515, 0, 1, 0.945098, 1,
-0.04310356, -0.1962056, -4.287355, 0, 1, 0.9529412, 1,
-0.04088549, -2.406213, -4.892348, 0, 1, 0.9568627, 1,
-0.03428264, -1.08429, -4.884867, 0, 1, 0.9647059, 1,
-0.03125974, -0.1584888, -2.767418, 0, 1, 0.9686275, 1,
-0.02833644, -0.5983481, -1.979523, 0, 1, 0.9764706, 1,
-0.02657854, -0.1587389, -3.868355, 0, 1, 0.9803922, 1,
-0.02653354, -0.6578535, -3.440361, 0, 1, 0.9882353, 1,
-0.02609319, 0.9410401, -1.082047, 0, 1, 0.9921569, 1,
-0.02486398, 1.362885, -2.518209, 0, 1, 1, 1,
-0.02005048, -1.05906, -1.910139, 0, 0.9921569, 1, 1,
-0.01511085, 1.505377, -1.612601, 0, 0.9882353, 1, 1,
-0.01435941, 0.7909585, -0.4727553, 0, 0.9803922, 1, 1,
-0.01231436, 1.436859, -1.390254, 0, 0.9764706, 1, 1,
-0.008745629, -0.6529453, -2.580517, 0, 0.9686275, 1, 1,
-0.004466166, 1.542406, 0.3599177, 0, 0.9647059, 1, 1,
0.0001638987, 1.267157, -0.6408602, 0, 0.9568627, 1, 1,
0.001598342, -0.3885457, 2.751685, 0, 0.9529412, 1, 1,
0.00319777, 1.023034, -0.7041464, 0, 0.945098, 1, 1,
0.008467678, 1.115786, 1.115055, 0, 0.9411765, 1, 1,
0.008954561, 0.3648342, 0.6726146, 0, 0.9333333, 1, 1,
0.01123556, -1.012688, 3.12531, 0, 0.9294118, 1, 1,
0.01218277, 0.1269667, 0.8441428, 0, 0.9215686, 1, 1,
0.01466015, -1.234156, 5.08723, 0, 0.9176471, 1, 1,
0.01560401, 0.2542184, -0.05660782, 0, 0.9098039, 1, 1,
0.01642985, -0.4347582, 2.901351, 0, 0.9058824, 1, 1,
0.01815875, 0.9599301, 1.481257, 0, 0.8980392, 1, 1,
0.02225125, 0.0474546, -0.640561, 0, 0.8901961, 1, 1,
0.02486215, -0.9504475, 3.429433, 0, 0.8862745, 1, 1,
0.02805342, -0.6973109, 5.233496, 0, 0.8784314, 1, 1,
0.02817834, 0.3389331, 0.6049213, 0, 0.8745098, 1, 1,
0.03430438, -2.046865, 2.833358, 0, 0.8666667, 1, 1,
0.0354078, -0.5611551, 2.050424, 0, 0.8627451, 1, 1,
0.03773438, 0.8370598, -0.1642855, 0, 0.854902, 1, 1,
0.03873444, -1.455569, 2.339189, 0, 0.8509804, 1, 1,
0.04059053, -1.121675, 3.543716, 0, 0.8431373, 1, 1,
0.04149795, -0.7395136, 4.545165, 0, 0.8392157, 1, 1,
0.04152666, -0.2812562, 3.781398, 0, 0.8313726, 1, 1,
0.04593, 1.112602, -0.2321726, 0, 0.827451, 1, 1,
0.0506867, -0.9974434, 4.513937, 0, 0.8196079, 1, 1,
0.05084925, -0.599412, 3.166682, 0, 0.8156863, 1, 1,
0.05188348, 1.076365, 0.1489874, 0, 0.8078431, 1, 1,
0.05246901, 1.962431, 0.4877702, 0, 0.8039216, 1, 1,
0.05502534, 0.5043862, -1.488758, 0, 0.7960784, 1, 1,
0.05589937, 2.822236, 0.1809689, 0, 0.7882353, 1, 1,
0.05652709, 0.7429298, 0.1871955, 0, 0.7843137, 1, 1,
0.05887086, 1.262536, 0.9446403, 0, 0.7764706, 1, 1,
0.06033995, -1.009219, 3.146177, 0, 0.772549, 1, 1,
0.06480569, -0.2276835, 3.466464, 0, 0.7647059, 1, 1,
0.06805657, 0.1156912, 0.1178399, 0, 0.7607843, 1, 1,
0.06979077, -0.2245496, 3.770899, 0, 0.7529412, 1, 1,
0.07049914, 2.552752, 0.2691149, 0, 0.7490196, 1, 1,
0.07285214, -1.099765, 1.698987, 0, 0.7411765, 1, 1,
0.07597449, -0.4347534, 3.461017, 0, 0.7372549, 1, 1,
0.07945144, -1.489904, 3.544377, 0, 0.7294118, 1, 1,
0.07972802, -1.046562, 3.469747, 0, 0.7254902, 1, 1,
0.08257151, 0.3289705, 0.7726786, 0, 0.7176471, 1, 1,
0.0882453, -1.94715, 2.103612, 0, 0.7137255, 1, 1,
0.08882759, -0.01888361, 0.540283, 0, 0.7058824, 1, 1,
0.0914326, 2.303929, 0.9652968, 0, 0.6980392, 1, 1,
0.09519873, 0.7408719, 0.5957503, 0, 0.6941177, 1, 1,
0.09601039, -0.4664096, 1.899689, 0, 0.6862745, 1, 1,
0.104034, 0.3304518, -2.032861, 0, 0.682353, 1, 1,
0.1053383, -1.791727, 1.099892, 0, 0.6745098, 1, 1,
0.1062532, -0.3211516, 4.054692, 0, 0.6705883, 1, 1,
0.1079945, -1.353695, 1.014063, 0, 0.6627451, 1, 1,
0.1106607, 2.524414, -1.58094, 0, 0.6588235, 1, 1,
0.1153254, 0.552857, -0.3519278, 0, 0.6509804, 1, 1,
0.1181274, -0.0437879, 1.3521, 0, 0.6470588, 1, 1,
0.1200512, -0.5560326, 4.284415, 0, 0.6392157, 1, 1,
0.1211323, 1.165471, -1.323199, 0, 0.6352941, 1, 1,
0.1294813, 1.078327, -1.768326, 0, 0.627451, 1, 1,
0.1361229, 0.4247496, -1.504124, 0, 0.6235294, 1, 1,
0.143338, 0.5295784, -0.7774814, 0, 0.6156863, 1, 1,
0.1445034, 0.9481251, 1.042399, 0, 0.6117647, 1, 1,
0.1471221, -0.4624194, 1.978875, 0, 0.6039216, 1, 1,
0.1506321, 0.3574565, 1.346367, 0, 0.5960785, 1, 1,
0.154009, 0.5701457, 1.013719, 0, 0.5921569, 1, 1,
0.1563896, -0.2116661, 3.477891, 0, 0.5843138, 1, 1,
0.1622168, -1.427433, 1.570243, 0, 0.5803922, 1, 1,
0.1650208, -0.1626772, 0.4832968, 0, 0.572549, 1, 1,
0.1653979, 1.251637, -1.402115, 0, 0.5686275, 1, 1,
0.1675181, -1.294397, 2.186061, 0, 0.5607843, 1, 1,
0.1704697, -0.1456838, 4.235874, 0, 0.5568628, 1, 1,
0.1757226, 1.266397, 0.9168099, 0, 0.5490196, 1, 1,
0.1762861, -1.483402, 2.693153, 0, 0.5450981, 1, 1,
0.1846915, 0.6242167, 1.279922, 0, 0.5372549, 1, 1,
0.1902548, 0.4140029, 0.915327, 0, 0.5333334, 1, 1,
0.1924996, -0.8089036, 3.096585, 0, 0.5254902, 1, 1,
0.1983093, -0.3365541, 3.156256, 0, 0.5215687, 1, 1,
0.1991384, 2.098631, -1.243261, 0, 0.5137255, 1, 1,
0.2036333, -0.3479806, 3.809666, 0, 0.509804, 1, 1,
0.2082241, 0.3795197, -1.99121, 0, 0.5019608, 1, 1,
0.2082895, 1.32621, 1.235353, 0, 0.4941176, 1, 1,
0.2099172, -0.2514283, 2.532319, 0, 0.4901961, 1, 1,
0.2164718, -0.3821115, 1.496259, 0, 0.4823529, 1, 1,
0.2179524, 1.99562, -0.5001312, 0, 0.4784314, 1, 1,
0.225866, 0.429435, -0.6241295, 0, 0.4705882, 1, 1,
0.2284736, -0.8442718, 3.446378, 0, 0.4666667, 1, 1,
0.2306432, -0.9664172, 2.291786, 0, 0.4588235, 1, 1,
0.2319037, -0.9190007, 1.310792, 0, 0.454902, 1, 1,
0.2331571, 1.120797, -0.9173524, 0, 0.4470588, 1, 1,
0.235362, 0.9208383, -0.1778962, 0, 0.4431373, 1, 1,
0.2400588, -0.087236, 2.767527, 0, 0.4352941, 1, 1,
0.2434311, 1.152381, -1.777481, 0, 0.4313726, 1, 1,
0.2458384, 0.6996429, -0.3489861, 0, 0.4235294, 1, 1,
0.248609, 1.062047, 0.3722665, 0, 0.4196078, 1, 1,
0.2503671, 0.07958061, 1.478499, 0, 0.4117647, 1, 1,
0.2536115, -0.7139078, 1.850424, 0, 0.4078431, 1, 1,
0.254266, 1.301285, -1.288113, 0, 0.4, 1, 1,
0.2554176, 1.120575, -0.0002224951, 0, 0.3921569, 1, 1,
0.2572002, 0.1925263, -0.284227, 0, 0.3882353, 1, 1,
0.2601816, -0.3631275, 1.678954, 0, 0.3803922, 1, 1,
0.2627238, -0.9993224, 3.458773, 0, 0.3764706, 1, 1,
0.2631626, -1.196048, 2.985531, 0, 0.3686275, 1, 1,
0.2675883, 0.5202682, 0.5430353, 0, 0.3647059, 1, 1,
0.2687323, 0.4694107, 0.543366, 0, 0.3568628, 1, 1,
0.277908, 0.1692141, 3.085496, 0, 0.3529412, 1, 1,
0.2785042, 0.5409518, 1.494653, 0, 0.345098, 1, 1,
0.2798898, 1.564753, 0.4420492, 0, 0.3411765, 1, 1,
0.2831767, -1.962852, 3.656709, 0, 0.3333333, 1, 1,
0.2854616, -0.8454289, 3.031174, 0, 0.3294118, 1, 1,
0.2859984, -0.6625741, 5.22598, 0, 0.3215686, 1, 1,
0.2929312, 0.6042594, -1.273308, 0, 0.3176471, 1, 1,
0.2974817, -0.913363, 2.418998, 0, 0.3098039, 1, 1,
0.2981126, 2.258657, -0.3977419, 0, 0.3058824, 1, 1,
0.3066796, 0.2146804, 2.145723, 0, 0.2980392, 1, 1,
0.3067237, -1.468891, 2.321048, 0, 0.2901961, 1, 1,
0.3085261, 0.641018, 0.8637428, 0, 0.2862745, 1, 1,
0.3093133, 2.051141, -1.146423, 0, 0.2784314, 1, 1,
0.311011, -0.2458409, 1.354583, 0, 0.2745098, 1, 1,
0.3111906, -0.2234479, 2.849567, 0, 0.2666667, 1, 1,
0.3113062, 0.09788112, 1.417314, 0, 0.2627451, 1, 1,
0.312858, 0.5688449, -1.724936, 0, 0.254902, 1, 1,
0.3138869, -1.002991, 2.604859, 0, 0.2509804, 1, 1,
0.3140637, -0.5508278, 2.174486, 0, 0.2431373, 1, 1,
0.3200783, -0.702875, 2.53782, 0, 0.2392157, 1, 1,
0.3202749, -0.2076698, 3.003731, 0, 0.2313726, 1, 1,
0.3214796, -1.26389, 0.9843887, 0, 0.227451, 1, 1,
0.3227445, -0.901387, 2.349736, 0, 0.2196078, 1, 1,
0.3237723, -1.263815, 1.742785, 0, 0.2156863, 1, 1,
0.3239739, 0.117488, 1.289494, 0, 0.2078431, 1, 1,
0.3261996, 0.2517025, 1.788981, 0, 0.2039216, 1, 1,
0.3265324, -0.6329002, 3.050581, 0, 0.1960784, 1, 1,
0.3277607, 1.519278, 1.823729, 0, 0.1882353, 1, 1,
0.3297076, -1.307794, 3.117471, 0, 0.1843137, 1, 1,
0.3322573, 0.3151934, 0.1411399, 0, 0.1764706, 1, 1,
0.3325262, 0.4050513, 1.086056, 0, 0.172549, 1, 1,
0.3332491, 1.287516, -0.6378168, 0, 0.1647059, 1, 1,
0.3337729, 0.2421749, 0.9303309, 0, 0.1607843, 1, 1,
0.3342386, -1.04146, 0.745331, 0, 0.1529412, 1, 1,
0.3415206, 0.0360997, 3.410745, 0, 0.1490196, 1, 1,
0.3430042, 1.001213, 1.388497, 0, 0.1411765, 1, 1,
0.3477609, -1.20191, 5.661866, 0, 0.1372549, 1, 1,
0.3493513, -1.127946, 1.3337, 0, 0.1294118, 1, 1,
0.3496919, -0.1764226, 1.650436, 0, 0.1254902, 1, 1,
0.3513716, 0.1396081, 1.115243, 0, 0.1176471, 1, 1,
0.3550231, 0.3107829, 0.189911, 0, 0.1137255, 1, 1,
0.3580196, -0.2185077, 2.442482, 0, 0.1058824, 1, 1,
0.361046, -0.3771143, 3.105893, 0, 0.09803922, 1, 1,
0.3624121, -1.587321, 2.407315, 0, 0.09411765, 1, 1,
0.3730112, 0.2685218, 0.9199899, 0, 0.08627451, 1, 1,
0.3746659, -0.03129182, 0.9652063, 0, 0.08235294, 1, 1,
0.3821072, 1.390228, 2.372741, 0, 0.07450981, 1, 1,
0.3835739, 0.3317856, -0.7162961, 0, 0.07058824, 1, 1,
0.386112, 0.126197, 2.042373, 0, 0.0627451, 1, 1,
0.387383, 1.309669, -0.3200963, 0, 0.05882353, 1, 1,
0.3900127, 1.490467, 0.07932893, 0, 0.05098039, 1, 1,
0.3922959, -1.282042, 2.086668, 0, 0.04705882, 1, 1,
0.3925015, 0.3133032, -0.2785636, 0, 0.03921569, 1, 1,
0.3926551, 0.9988905, 0.2201539, 0, 0.03529412, 1, 1,
0.3998177, 1.257616, 0.6301861, 0, 0.02745098, 1, 1,
0.4013865, -1.373926, 3.019279, 0, 0.02352941, 1, 1,
0.4027359, 0.9053472, 0.0681404, 0, 0.01568628, 1, 1,
0.4030753, 0.145717, 1.074088, 0, 0.01176471, 1, 1,
0.412207, 0.3589368, 2.935007, 0, 0.003921569, 1, 1,
0.4125204, 0.8273664, -0.1463675, 0.003921569, 0, 1, 1,
0.4211963, 0.3036959, 0.9693717, 0.007843138, 0, 1, 1,
0.428696, 1.063527, -1.00849, 0.01568628, 0, 1, 1,
0.428733, 1.099436, 1.466044, 0.01960784, 0, 1, 1,
0.4310164, -0.1520113, 0.811442, 0.02745098, 0, 1, 1,
0.4339719, 1.486101, -0.481871, 0.03137255, 0, 1, 1,
0.4360026, -0.4049425, 1.580562, 0.03921569, 0, 1, 1,
0.4384566, -0.6048831, 2.730415, 0.04313726, 0, 1, 1,
0.4482813, 0.1507917, 1.165473, 0.05098039, 0, 1, 1,
0.4501178, 0.4711251, 0.1862804, 0.05490196, 0, 1, 1,
0.4537303, 1.675006, 0.9518793, 0.0627451, 0, 1, 1,
0.4555346, -0.01034803, 0.01034654, 0.06666667, 0, 1, 1,
0.4581424, -0.9370988, 1.887078, 0.07450981, 0, 1, 1,
0.4582672, 1.258018, 0.4573789, 0.07843138, 0, 1, 1,
0.4611222, -0.5428431, 5.373547, 0.08627451, 0, 1, 1,
0.4657224, -1.418971, 3.98103, 0.09019608, 0, 1, 1,
0.4694747, 2.075217, 0.2373771, 0.09803922, 0, 1, 1,
0.4706946, -0.0267018, 1.717382, 0.1058824, 0, 1, 1,
0.4714002, 1.340331, -0.148628, 0.1098039, 0, 1, 1,
0.4784738, -0.7686874, 1.156248, 0.1176471, 0, 1, 1,
0.4802782, -1.001867, 1.410539, 0.1215686, 0, 1, 1,
0.4844285, 0.2661176, 2.824701, 0.1294118, 0, 1, 1,
0.4912773, -1.182713, 2.474603, 0.1333333, 0, 1, 1,
0.4946901, 0.1989646, 2.651177, 0.1411765, 0, 1, 1,
0.4972023, 2.022163, 1.051773, 0.145098, 0, 1, 1,
0.4985711, -0.8813697, 1.365771, 0.1529412, 0, 1, 1,
0.500489, -0.691894, 3.172619, 0.1568628, 0, 1, 1,
0.5027459, 0.6496528, 0.990703, 0.1647059, 0, 1, 1,
0.508174, -1.206206, 3.713038, 0.1686275, 0, 1, 1,
0.5091883, -2.43431, 3.326982, 0.1764706, 0, 1, 1,
0.5122158, -0.8279346, 1.972439, 0.1803922, 0, 1, 1,
0.5131359, -0.3134016, 0.088246, 0.1882353, 0, 1, 1,
0.5206487, -2.174947, 3.159541, 0.1921569, 0, 1, 1,
0.5243483, -2.836987, 2.319196, 0.2, 0, 1, 1,
0.5282221, 1.03166, 1.7893, 0.2078431, 0, 1, 1,
0.5282364, -2.190868, 1.800324, 0.2117647, 0, 1, 1,
0.5356963, 1.469833, 0.7187165, 0.2196078, 0, 1, 1,
0.5384333, 0.8491962, -0.4954596, 0.2235294, 0, 1, 1,
0.538438, -0.3615368, 2.695542, 0.2313726, 0, 1, 1,
0.5417768, 0.5681893, 0.3429542, 0.2352941, 0, 1, 1,
0.5433978, 1.438608, 0.2179184, 0.2431373, 0, 1, 1,
0.5457027, -0.18017, 1.968297, 0.2470588, 0, 1, 1,
0.5463808, -1.044729, 4.646291, 0.254902, 0, 1, 1,
0.5527663, 0.6303245, 2.22193, 0.2588235, 0, 1, 1,
0.5540417, -0.1340214, 2.728929, 0.2666667, 0, 1, 1,
0.5561239, 0.5300772, 0.1584877, 0.2705882, 0, 1, 1,
0.5592984, -0.7366551, 1.592914, 0.2784314, 0, 1, 1,
0.5593051, -0.5223138, 3.902568, 0.282353, 0, 1, 1,
0.5608599, 1.588088, 0.4486107, 0.2901961, 0, 1, 1,
0.5629338, -0.8831295, 3.869298, 0.2941177, 0, 1, 1,
0.5631375, -0.07644901, 2.221814, 0.3019608, 0, 1, 1,
0.5659084, -0.5269828, 3.840682, 0.3098039, 0, 1, 1,
0.5728357, 1.899398, 1.409174, 0.3137255, 0, 1, 1,
0.574385, -0.7294394, 3.367592, 0.3215686, 0, 1, 1,
0.5758079, -0.6967802, 3.52003, 0.3254902, 0, 1, 1,
0.575853, -0.05924252, 0.7658049, 0.3333333, 0, 1, 1,
0.5801839, 0.7234066, 0.8101839, 0.3372549, 0, 1, 1,
0.5820696, 1.705635, 2.509674, 0.345098, 0, 1, 1,
0.5843211, 0.05186065, 1.534525, 0.3490196, 0, 1, 1,
0.5852773, -0.1592137, 2.39712, 0.3568628, 0, 1, 1,
0.5881856, 0.9960818, -0.4141065, 0.3607843, 0, 1, 1,
0.5904601, 0.6037473, -0.1545595, 0.3686275, 0, 1, 1,
0.5920618, -1.13629, 2.981273, 0.372549, 0, 1, 1,
0.5954607, 0.2887203, -0.3101763, 0.3803922, 0, 1, 1,
0.5999189, 0.4058278, -0.7544366, 0.3843137, 0, 1, 1,
0.602158, 1.235715, 0.7780262, 0.3921569, 0, 1, 1,
0.6041563, -1.049753, 1.763499, 0.3960784, 0, 1, 1,
0.6052657, -2.506502, 1.992519, 0.4039216, 0, 1, 1,
0.6113151, -1.155425, 2.022603, 0.4117647, 0, 1, 1,
0.6130762, 0.5372028, 2.351834, 0.4156863, 0, 1, 1,
0.6167303, -0.5021242, 3.179376, 0.4235294, 0, 1, 1,
0.6173428, -0.6741902, 2.298109, 0.427451, 0, 1, 1,
0.6183579, -0.774918, 1.302443, 0.4352941, 0, 1, 1,
0.6186167, -1.209593, 1.964594, 0.4392157, 0, 1, 1,
0.6210393, -1.047515, 3.761343, 0.4470588, 0, 1, 1,
0.6247544, 0.2245077, 1.433927, 0.4509804, 0, 1, 1,
0.6256743, 1.081859, 1.278272, 0.4588235, 0, 1, 1,
0.6258345, 0.5774778, 1.536916, 0.4627451, 0, 1, 1,
0.6296118, 0.4302067, -0.6867957, 0.4705882, 0, 1, 1,
0.6378039, 0.8599463, -0.2705252, 0.4745098, 0, 1, 1,
0.6383251, 0.4316535, 2.61295, 0.4823529, 0, 1, 1,
0.6425641, 0.2934224, 1.544675, 0.4862745, 0, 1, 1,
0.6432203, -0.9680996, 2.003671, 0.4941176, 0, 1, 1,
0.6555383, -1.186885, 1.703469, 0.5019608, 0, 1, 1,
0.6656659, 0.1327121, 2.01887, 0.5058824, 0, 1, 1,
0.6698567, -0.1400167, 2.562019, 0.5137255, 0, 1, 1,
0.6745348, -0.06218199, 0.1828388, 0.5176471, 0, 1, 1,
0.6753352, -0.5811699, 0.6224363, 0.5254902, 0, 1, 1,
0.6768789, 0.269106, 2.571352, 0.5294118, 0, 1, 1,
0.6803043, -0.9747359, 0.3407434, 0.5372549, 0, 1, 1,
0.6819817, 0.623578, -0.3275353, 0.5411765, 0, 1, 1,
0.6834359, -0.2878725, 0.5593722, 0.5490196, 0, 1, 1,
0.688974, -1.458366, 3.514734, 0.5529412, 0, 1, 1,
0.6934355, -1.251156, 3.089573, 0.5607843, 0, 1, 1,
0.6962479, -0.1245999, 3.760081, 0.5647059, 0, 1, 1,
0.6972465, 0.2395103, 0.9079388, 0.572549, 0, 1, 1,
0.6994368, -0.4031525, 1.279203, 0.5764706, 0, 1, 1,
0.7017382, -0.3846322, 3.004612, 0.5843138, 0, 1, 1,
0.7022839, 0.1512343, 2.659434, 0.5882353, 0, 1, 1,
0.7086763, 0.56836, -0.1546242, 0.5960785, 0, 1, 1,
0.7178732, -0.5191806, 1.649934, 0.6039216, 0, 1, 1,
0.727071, 0.5072914, 0.05492953, 0.6078432, 0, 1, 1,
0.7280365, -0.2570081, 1.87386, 0.6156863, 0, 1, 1,
0.7284992, -1.398691, 2.219417, 0.6196079, 0, 1, 1,
0.7397995, 0.3510479, 2.608281, 0.627451, 0, 1, 1,
0.7437315, 2.196615, 0.7510852, 0.6313726, 0, 1, 1,
0.756752, 1.258734, 0.2848816, 0.6392157, 0, 1, 1,
0.7588435, -1.867429, 3.268801, 0.6431373, 0, 1, 1,
0.7628377, 0.2896834, 1.725208, 0.6509804, 0, 1, 1,
0.7656643, 0.5462545, 0.4114914, 0.654902, 0, 1, 1,
0.776212, 0.3656675, 0.1810662, 0.6627451, 0, 1, 1,
0.7779594, 0.03327992, 1.602549, 0.6666667, 0, 1, 1,
0.779448, 0.2045403, 1.036461, 0.6745098, 0, 1, 1,
0.7799763, 0.6921003, 1.395987, 0.6784314, 0, 1, 1,
0.7805547, -0.3618926, 2.750618, 0.6862745, 0, 1, 1,
0.7830497, -0.5888362, 2.083634, 0.6901961, 0, 1, 1,
0.7833768, 0.8449045, 2.203308, 0.6980392, 0, 1, 1,
0.7868915, -0.640255, 2.414028, 0.7058824, 0, 1, 1,
0.792003, 0.376268, 1.097914, 0.7098039, 0, 1, 1,
0.7946008, -0.5961735, 3.902514, 0.7176471, 0, 1, 1,
0.8011584, 1.184834, 1.088826, 0.7215686, 0, 1, 1,
0.8126656, -1.979453, 1.686043, 0.7294118, 0, 1, 1,
0.8159992, -1.212405, 2.974209, 0.7333333, 0, 1, 1,
0.8273143, 0.37088, 2.140508, 0.7411765, 0, 1, 1,
0.8332168, 0.5618809, 0.6185548, 0.7450981, 0, 1, 1,
0.8380895, -2.411866, 3.441594, 0.7529412, 0, 1, 1,
0.838997, 0.1735734, 0.5243104, 0.7568628, 0, 1, 1,
0.8434016, -0.0725768, 1.629481, 0.7647059, 0, 1, 1,
0.8535724, -0.5415284, 2.810525, 0.7686275, 0, 1, 1,
0.8632434, -1.14292, 3.922921, 0.7764706, 0, 1, 1,
0.8633977, 1.082603, -0.1179421, 0.7803922, 0, 1, 1,
0.8703101, -0.02934893, 1.212258, 0.7882353, 0, 1, 1,
0.8726422, 0.80716, -0.1566833, 0.7921569, 0, 1, 1,
0.8729016, -1.186588, 3.12974, 0.8, 0, 1, 1,
0.8742697, -0.09678884, 1.04881, 0.8078431, 0, 1, 1,
0.8785061, 0.9673674, 0.2536411, 0.8117647, 0, 1, 1,
0.8901809, -2.871886, 4.56583, 0.8196079, 0, 1, 1,
0.8916579, -0.6197327, 2.495861, 0.8235294, 0, 1, 1,
0.8920537, 1.082032, -1.443207, 0.8313726, 0, 1, 1,
0.8956095, -1.419363, 2.079131, 0.8352941, 0, 1, 1,
0.9040744, 0.7191606, 0.312454, 0.8431373, 0, 1, 1,
0.9050181, 0.8613052, 0.9417081, 0.8470588, 0, 1, 1,
0.9058079, 1.28234, 0.9269067, 0.854902, 0, 1, 1,
0.9098818, -1.888825, 3.558107, 0.8588235, 0, 1, 1,
0.9103264, -2.007394, 3.749002, 0.8666667, 0, 1, 1,
0.9110388, 1.038079, -0.7177156, 0.8705882, 0, 1, 1,
0.912743, 2.305183, 0.9823551, 0.8784314, 0, 1, 1,
0.9135082, -0.07323631, 0.7279323, 0.8823529, 0, 1, 1,
0.9142831, 0.4418855, 0.3150583, 0.8901961, 0, 1, 1,
0.9252949, -0.251119, 0.7462225, 0.8941177, 0, 1, 1,
0.9344413, 0.4867376, 1.505355, 0.9019608, 0, 1, 1,
0.9378094, -0.7591229, 2.365638, 0.9098039, 0, 1, 1,
0.9382113, -0.05224387, 2.466525, 0.9137255, 0, 1, 1,
0.9387559, -1.085465, 2.206219, 0.9215686, 0, 1, 1,
0.9399885, -0.6622882, 1.769375, 0.9254902, 0, 1, 1,
0.9411427, 1.83446, -0.1032291, 0.9333333, 0, 1, 1,
0.9460484, 1.76246, 1.479188, 0.9372549, 0, 1, 1,
0.954785, 2.920014, 0.572831, 0.945098, 0, 1, 1,
0.9569259, 1.908957, 1.010854, 0.9490196, 0, 1, 1,
0.9597269, 0.8574546, -1.068315, 0.9568627, 0, 1, 1,
0.9607856, -0.7538243, 2.035911, 0.9607843, 0, 1, 1,
0.9610351, 2.046121, 1.204227, 0.9686275, 0, 1, 1,
0.9610684, 0.4733844, 0.6151095, 0.972549, 0, 1, 1,
0.9661356, -1.532397, 3.096187, 0.9803922, 0, 1, 1,
0.9667919, -1.384846, 0.924067, 0.9843137, 0, 1, 1,
0.976054, -0.7567779, 2.656214, 0.9921569, 0, 1, 1,
0.9778345, 0.353658, 0.2953526, 0.9960784, 0, 1, 1,
0.9821751, -0.2278368, 1.91426, 1, 0, 0.9960784, 1,
0.9843239, 2.310987, 0.5295593, 1, 0, 0.9882353, 1,
0.9859974, 0.8704397, 0.1117545, 1, 0, 0.9843137, 1,
0.9865804, 0.3865376, 2.701956, 1, 0, 0.9764706, 1,
0.9896759, -0.619435, 2.673084, 1, 0, 0.972549, 1,
1.000656, -1.433607, 3.385506, 1, 0, 0.9647059, 1,
1.003762, 1.150325, 1.387244, 1, 0, 0.9607843, 1,
1.005345, -0.8135254, 2.699921, 1, 0, 0.9529412, 1,
1.009763, -0.3745949, 3.204547, 1, 0, 0.9490196, 1,
1.018026, -0.0775534, 0.6241822, 1, 0, 0.9411765, 1,
1.021611, -0.06204022, 4.348828, 1, 0, 0.9372549, 1,
1.027477, -1.345056, 0.8272946, 1, 0, 0.9294118, 1,
1.029144, -0.5462765, 2.112556, 1, 0, 0.9254902, 1,
1.033079, 1.273125, -0.5838712, 1, 0, 0.9176471, 1,
1.038896, 0.5937902, 2.523859, 1, 0, 0.9137255, 1,
1.039913, -1.117787, 3.751973, 1, 0, 0.9058824, 1,
1.042196, -0.7419664, 1.155356, 1, 0, 0.9019608, 1,
1.042984, -0.4105116, 1.734555, 1, 0, 0.8941177, 1,
1.071075, -1.311972, 3.384006, 1, 0, 0.8862745, 1,
1.075222, -0.1476994, 1.931766, 1, 0, 0.8823529, 1,
1.078426, 1.11426, 0.7559952, 1, 0, 0.8745098, 1,
1.081125, 0.3842265, 3.082962, 1, 0, 0.8705882, 1,
1.081624, 0.398971, 2.657493, 1, 0, 0.8627451, 1,
1.087504, 0.150574, 2.934851, 1, 0, 0.8588235, 1,
1.091207, 1.189876, 0.3388474, 1, 0, 0.8509804, 1,
1.092959, -1.845548, 2.932602, 1, 0, 0.8470588, 1,
1.0993, 0.0831789, 2.221198, 1, 0, 0.8392157, 1,
1.101608, 1.790914, 0.4447574, 1, 0, 0.8352941, 1,
1.107126, -0.06362984, 1.350973, 1, 0, 0.827451, 1,
1.110369, 0.959527, 2.528269, 1, 0, 0.8235294, 1,
1.112089, 0.3861696, 3.761868, 1, 0, 0.8156863, 1,
1.113664, -0.802509, 1.757675, 1, 0, 0.8117647, 1,
1.113741, -1.996854, 2.466508, 1, 0, 0.8039216, 1,
1.116466, 0.1932419, 1.68805, 1, 0, 0.7960784, 1,
1.135195, 1.046985, 0.7962685, 1, 0, 0.7921569, 1,
1.13716, 0.1907422, 2.542552, 1, 0, 0.7843137, 1,
1.139719, 0.38886, 2.669351, 1, 0, 0.7803922, 1,
1.144274, 0.1535838, 1.021283, 1, 0, 0.772549, 1,
1.147939, 0.9441944, 1.580258, 1, 0, 0.7686275, 1,
1.1483, -1.045581, 2.455672, 1, 0, 0.7607843, 1,
1.150084, 0.3748986, 2.034146, 1, 0, 0.7568628, 1,
1.153307, 1.082898, 0.1221141, 1, 0, 0.7490196, 1,
1.171388, -0.1004361, 3.041145, 1, 0, 0.7450981, 1,
1.17951, -0.7397671, 1.393897, 1, 0, 0.7372549, 1,
1.181681, 0.003027473, 0.9141323, 1, 0, 0.7333333, 1,
1.191094, 0.06380817, 0.06388984, 1, 0, 0.7254902, 1,
1.20617, -0.03411058, 1.595521, 1, 0, 0.7215686, 1,
1.206568, -0.8750736, 1.743958, 1, 0, 0.7137255, 1,
1.209491, -1.493794, 2.34081, 1, 0, 0.7098039, 1,
1.212599, 1.052586, -1.204163, 1, 0, 0.7019608, 1,
1.214654, -0.4387551, 0.3136351, 1, 0, 0.6941177, 1,
1.218789, -0.3933735, 1.084317, 1, 0, 0.6901961, 1,
1.226612, -1.146665, 3.678433, 1, 0, 0.682353, 1,
1.226835, 0.51246, 0.6266382, 1, 0, 0.6784314, 1,
1.22965, -0.4511196, 2.312296, 1, 0, 0.6705883, 1,
1.231004, 0.5123717, 2.425711, 1, 0, 0.6666667, 1,
1.254048, 0.9965206, 0.6703839, 1, 0, 0.6588235, 1,
1.259093, -0.07275914, 1.830601, 1, 0, 0.654902, 1,
1.260807, 0.8238081, 0.3539053, 1, 0, 0.6470588, 1,
1.272682, 0.75606, 1.06715, 1, 0, 0.6431373, 1,
1.273925, 1.230589, 1.193945, 1, 0, 0.6352941, 1,
1.275777, -0.004421032, 1.219811, 1, 0, 0.6313726, 1,
1.283461, -1.033046, 3.575453, 1, 0, 0.6235294, 1,
1.287905, -1.660348, 3.363734, 1, 0, 0.6196079, 1,
1.290362, -1.353049, 2.170852, 1, 0, 0.6117647, 1,
1.292043, -2.394882, 3.345543, 1, 0, 0.6078432, 1,
1.293309, -0.8251674, 3.49773, 1, 0, 0.6, 1,
1.294739, 0.2514691, 2.610059, 1, 0, 0.5921569, 1,
1.301298, -0.1834273, 1.677945, 1, 0, 0.5882353, 1,
1.302851, 0.01487852, 0.2135205, 1, 0, 0.5803922, 1,
1.305236, -2.178958, 2.06434, 1, 0, 0.5764706, 1,
1.3057, 0.1030147, 2.391782, 1, 0, 0.5686275, 1,
1.314668, -1.155904, 1.950398, 1, 0, 0.5647059, 1,
1.320253, 1.706346, 0.8575065, 1, 0, 0.5568628, 1,
1.324562, 0.9188964, 0.619651, 1, 0, 0.5529412, 1,
1.327876, -0.3674359, 1.395597, 1, 0, 0.5450981, 1,
1.336315, 1.849981, 1.397024, 1, 0, 0.5411765, 1,
1.35112, 1.246755, 0.3189155, 1, 0, 0.5333334, 1,
1.355397, 1.071967, -0.1459573, 1, 0, 0.5294118, 1,
1.358617, 0.3653726, 0.2547163, 1, 0, 0.5215687, 1,
1.361476, -0.4926759, 1.542482, 1, 0, 0.5176471, 1,
1.361665, -0.2745786, 1.084171, 1, 0, 0.509804, 1,
1.369854, 0.3317663, 0.9262804, 1, 0, 0.5058824, 1,
1.37042, 1.36119, 2.06827, 1, 0, 0.4980392, 1,
1.370835, -0.5408957, 1.154683, 1, 0, 0.4901961, 1,
1.371228, -0.3597691, -0.08596468, 1, 0, 0.4862745, 1,
1.405074, -0.8310995, 1.453494, 1, 0, 0.4784314, 1,
1.406595, 0.177733, 1.748046, 1, 0, 0.4745098, 1,
1.408314, -0.6915362, 2.551989, 1, 0, 0.4666667, 1,
1.41248, 0.3431349, 2.30451, 1, 0, 0.4627451, 1,
1.412697, -0.03876598, 1.733367, 1, 0, 0.454902, 1,
1.414302, -0.3048291, 2.442375, 1, 0, 0.4509804, 1,
1.422458, 0.1426092, 2.521246, 1, 0, 0.4431373, 1,
1.426961, 0.6392509, 1.289113, 1, 0, 0.4392157, 1,
1.433215, -1.583922, -0.5140423, 1, 0, 0.4313726, 1,
1.44513, -1.503816, 3.275711, 1, 0, 0.427451, 1,
1.453941, -0.542417, 2.728827, 1, 0, 0.4196078, 1,
1.454475, -1.253536, 2.712677, 1, 0, 0.4156863, 1,
1.464032, 0.2917807, 0.1028787, 1, 0, 0.4078431, 1,
1.464257, 0.3278939, 0.8992613, 1, 0, 0.4039216, 1,
1.470957, -1.180708, 3.113707, 1, 0, 0.3960784, 1,
1.476969, -0.4798634, 1.998924, 1, 0, 0.3882353, 1,
1.490149, 0.5932235, -1.774722, 1, 0, 0.3843137, 1,
1.494445, -0.9949251, 3.789042, 1, 0, 0.3764706, 1,
1.501516, -1.239959, 2.394802, 1, 0, 0.372549, 1,
1.507923, 0.04552694, -0.2310011, 1, 0, 0.3647059, 1,
1.511513, 1.057992, 1.034572, 1, 0, 0.3607843, 1,
1.516438, -0.409866, 1.451749, 1, 0, 0.3529412, 1,
1.529105, -1.173674, 3.091668, 1, 0, 0.3490196, 1,
1.544382, 1.903766, 0.9041877, 1, 0, 0.3411765, 1,
1.548799, -2.930479, 1.747753, 1, 0, 0.3372549, 1,
1.54882, -2.159988, 1.697055, 1, 0, 0.3294118, 1,
1.556608, -1.142432, 0.7312446, 1, 0, 0.3254902, 1,
1.570813, -0.9834265, 3.47963, 1, 0, 0.3176471, 1,
1.579879, 1.388434, 1.795756, 1, 0, 0.3137255, 1,
1.583292, 0.03347405, 2.441535, 1, 0, 0.3058824, 1,
1.590698, 2.755362, -0.003851816, 1, 0, 0.2980392, 1,
1.600119, 1.285982, 2.927282, 1, 0, 0.2941177, 1,
1.630581, 0.7168716, -0.03542305, 1, 0, 0.2862745, 1,
1.633902, 0.4583419, 0.4206577, 1, 0, 0.282353, 1,
1.637139, -0.4157434, 0.4092138, 1, 0, 0.2745098, 1,
1.646126, 0.6015719, 2.213349, 1, 0, 0.2705882, 1,
1.669045, 0.01046873, 1.516679, 1, 0, 0.2627451, 1,
1.67136, -0.9222944, 1.488723, 1, 0, 0.2588235, 1,
1.678709, -0.3935104, 2.92732, 1, 0, 0.2509804, 1,
1.696147, -1.292166, 0.6582401, 1, 0, 0.2470588, 1,
1.740392, 0.463641, 1.881529, 1, 0, 0.2392157, 1,
1.74094, 0.5460691, 1.079472, 1, 0, 0.2352941, 1,
1.758591, -0.1016972, 3.928268, 1, 0, 0.227451, 1,
1.786964, 1.62569, 1.77234, 1, 0, 0.2235294, 1,
1.790108, -0.8156759, 1.324547, 1, 0, 0.2156863, 1,
1.790606, -1.966606, 2.891773, 1, 0, 0.2117647, 1,
1.816623, 1.07646, 0.0599485, 1, 0, 0.2039216, 1,
1.835647, 1.553074, -1.297129, 1, 0, 0.1960784, 1,
1.845398, -0.2394234, 3.837865, 1, 0, 0.1921569, 1,
1.851932, -0.8421177, 2.918669, 1, 0, 0.1843137, 1,
1.91559, -0.5350406, 1.924751, 1, 0, 0.1803922, 1,
1.916773, 0.8461086, 0.9359097, 1, 0, 0.172549, 1,
1.935602, 0.0790632, 1.60536, 1, 0, 0.1686275, 1,
1.959027, -0.756138, 2.735686, 1, 0, 0.1607843, 1,
1.959501, -1.385301, 3.320093, 1, 0, 0.1568628, 1,
1.960734, -0.9264664, 0.6675279, 1, 0, 0.1490196, 1,
1.977392, 1.109844, 1.20214, 1, 0, 0.145098, 1,
1.998802, 0.1283355, 3.230681, 1, 0, 0.1372549, 1,
2.011923, 0.1002088, 0.3139562, 1, 0, 0.1333333, 1,
2.13601, 0.3500242, 3.391892, 1, 0, 0.1254902, 1,
2.142052, -1.376853, 3.685645, 1, 0, 0.1215686, 1,
2.154927, 0.6610327, -0.3420608, 1, 0, 0.1137255, 1,
2.194909, 0.7216043, 3.605963, 1, 0, 0.1098039, 1,
2.207591, 1.512951, 0.1742417, 1, 0, 0.1019608, 1,
2.334594, 1.6729, 1.088063, 1, 0, 0.09411765, 1,
2.334932, -1.141506, 2.782094, 1, 0, 0.09019608, 1,
2.339242, 2.065931, 0.4721774, 1, 0, 0.08235294, 1,
2.414206, -0.7566265, 2.738163, 1, 0, 0.07843138, 1,
2.428568, -0.1982134, 3.700234, 1, 0, 0.07058824, 1,
2.46885, -0.4033794, 2.044434, 1, 0, 0.06666667, 1,
2.572536, -0.9161569, 1.953032, 1, 0, 0.05882353, 1,
2.579498, -0.6787061, 0.1559493, 1, 0, 0.05490196, 1,
2.590919, 1.988153, 2.525679, 1, 0, 0.04705882, 1,
2.618536, -0.9901504, 2.146792, 1, 0, 0.04313726, 1,
2.626686, 3.101355, 0.4636201, 1, 0, 0.03529412, 1,
2.637508, 0.01643932, 2.896551, 1, 0, 0.03137255, 1,
2.969909, 1.163385, 1.153732, 1, 0, 0.02352941, 1,
3.425706, -0.9570386, 2.426568, 1, 0, 0.01960784, 1,
3.462705, -0.05470699, 0.4656519, 1, 0, 0.01176471, 1,
3.463839, 1.215743, 2.061337, 1, 0, 0.007843138, 1
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
0.08043683, -3.955184, -7.021054, 0, -0.5, 0.5, 0.5,
0.08043683, -3.955184, -7.021054, 1, -0.5, 0.5, 0.5,
0.08043683, -3.955184, -7.021054, 1, 1.5, 0.5, 0.5,
0.08043683, -3.955184, -7.021054, 0, 1.5, 0.5, 0.5
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
-4.449938, 0.0922507, -7.021054, 0, -0.5, 0.5, 0.5,
-4.449938, 0.0922507, -7.021054, 1, -0.5, 0.5, 0.5,
-4.449938, 0.0922507, -7.021054, 1, 1.5, 0.5, 0.5,
-4.449938, 0.0922507, -7.021054, 0, 1.5, 0.5, 0.5
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
-4.449938, -3.955184, 0.2394974, 0, -0.5, 0.5, 0.5,
-4.449938, -3.955184, 0.2394974, 1, -0.5, 0.5, 0.5,
-4.449938, -3.955184, 0.2394974, 1, 1.5, 0.5, 0.5,
-4.449938, -3.955184, 0.2394974, 0, 1.5, 0.5, 0.5
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
-3, -3.02116, -5.345542,
3, -3.02116, -5.345542,
-3, -3.02116, -5.345542,
-3, -3.176831, -5.624794,
-2, -3.02116, -5.345542,
-2, -3.176831, -5.624794,
-1, -3.02116, -5.345542,
-1, -3.176831, -5.624794,
0, -3.02116, -5.345542,
0, -3.176831, -5.624794,
1, -3.02116, -5.345542,
1, -3.176831, -5.624794,
2, -3.02116, -5.345542,
2, -3.176831, -5.624794,
3, -3.02116, -5.345542,
3, -3.176831, -5.624794
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
-3, -3.488172, -6.183298, 0, -0.5, 0.5, 0.5,
-3, -3.488172, -6.183298, 1, -0.5, 0.5, 0.5,
-3, -3.488172, -6.183298, 1, 1.5, 0.5, 0.5,
-3, -3.488172, -6.183298, 0, 1.5, 0.5, 0.5,
-2, -3.488172, -6.183298, 0, -0.5, 0.5, 0.5,
-2, -3.488172, -6.183298, 1, -0.5, 0.5, 0.5,
-2, -3.488172, -6.183298, 1, 1.5, 0.5, 0.5,
-2, -3.488172, -6.183298, 0, 1.5, 0.5, 0.5,
-1, -3.488172, -6.183298, 0, -0.5, 0.5, 0.5,
-1, -3.488172, -6.183298, 1, -0.5, 0.5, 0.5,
-1, -3.488172, -6.183298, 1, 1.5, 0.5, 0.5,
-1, -3.488172, -6.183298, 0, 1.5, 0.5, 0.5,
0, -3.488172, -6.183298, 0, -0.5, 0.5, 0.5,
0, -3.488172, -6.183298, 1, -0.5, 0.5, 0.5,
0, -3.488172, -6.183298, 1, 1.5, 0.5, 0.5,
0, -3.488172, -6.183298, 0, 1.5, 0.5, 0.5,
1, -3.488172, -6.183298, 0, -0.5, 0.5, 0.5,
1, -3.488172, -6.183298, 1, -0.5, 0.5, 0.5,
1, -3.488172, -6.183298, 1, 1.5, 0.5, 0.5,
1, -3.488172, -6.183298, 0, 1.5, 0.5, 0.5,
2, -3.488172, -6.183298, 0, -0.5, 0.5, 0.5,
2, -3.488172, -6.183298, 1, -0.5, 0.5, 0.5,
2, -3.488172, -6.183298, 1, 1.5, 0.5, 0.5,
2, -3.488172, -6.183298, 0, 1.5, 0.5, 0.5,
3, -3.488172, -6.183298, 0, -0.5, 0.5, 0.5,
3, -3.488172, -6.183298, 1, -0.5, 0.5, 0.5,
3, -3.488172, -6.183298, 1, 1.5, 0.5, 0.5,
3, -3.488172, -6.183298, 0, 1.5, 0.5, 0.5
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
-3.404467, -2, -5.345542,
-3.404467, 3, -5.345542,
-3.404467, -2, -5.345542,
-3.578712, -2, -5.624794,
-3.404467, -1, -5.345542,
-3.578712, -1, -5.624794,
-3.404467, 0, -5.345542,
-3.578712, 0, -5.624794,
-3.404467, 1, -5.345542,
-3.578712, 1, -5.624794,
-3.404467, 2, -5.345542,
-3.578712, 2, -5.624794,
-3.404467, 3, -5.345542,
-3.578712, 3, -5.624794
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
-3.927202, -2, -6.183298, 0, -0.5, 0.5, 0.5,
-3.927202, -2, -6.183298, 1, -0.5, 0.5, 0.5,
-3.927202, -2, -6.183298, 1, 1.5, 0.5, 0.5,
-3.927202, -2, -6.183298, 0, 1.5, 0.5, 0.5,
-3.927202, -1, -6.183298, 0, -0.5, 0.5, 0.5,
-3.927202, -1, -6.183298, 1, -0.5, 0.5, 0.5,
-3.927202, -1, -6.183298, 1, 1.5, 0.5, 0.5,
-3.927202, -1, -6.183298, 0, 1.5, 0.5, 0.5,
-3.927202, 0, -6.183298, 0, -0.5, 0.5, 0.5,
-3.927202, 0, -6.183298, 1, -0.5, 0.5, 0.5,
-3.927202, 0, -6.183298, 1, 1.5, 0.5, 0.5,
-3.927202, 0, -6.183298, 0, 1.5, 0.5, 0.5,
-3.927202, 1, -6.183298, 0, -0.5, 0.5, 0.5,
-3.927202, 1, -6.183298, 1, -0.5, 0.5, 0.5,
-3.927202, 1, -6.183298, 1, 1.5, 0.5, 0.5,
-3.927202, 1, -6.183298, 0, 1.5, 0.5, 0.5,
-3.927202, 2, -6.183298, 0, -0.5, 0.5, 0.5,
-3.927202, 2, -6.183298, 1, -0.5, 0.5, 0.5,
-3.927202, 2, -6.183298, 1, 1.5, 0.5, 0.5,
-3.927202, 2, -6.183298, 0, 1.5, 0.5, 0.5,
-3.927202, 3, -6.183298, 0, -0.5, 0.5, 0.5,
-3.927202, 3, -6.183298, 1, -0.5, 0.5, 0.5,
-3.927202, 3, -6.183298, 1, 1.5, 0.5, 0.5,
-3.927202, 3, -6.183298, 0, 1.5, 0.5, 0.5
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
-3.404467, -3.02116, -4,
-3.404467, -3.02116, 4,
-3.404467, -3.02116, -4,
-3.578712, -3.176831, -4,
-3.404467, -3.02116, -2,
-3.578712, -3.176831, -2,
-3.404467, -3.02116, 0,
-3.578712, -3.176831, 0,
-3.404467, -3.02116, 2,
-3.578712, -3.176831, 2,
-3.404467, -3.02116, 4,
-3.578712, -3.176831, 4
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
-3.927202, -3.488172, -4, 0, -0.5, 0.5, 0.5,
-3.927202, -3.488172, -4, 1, -0.5, 0.5, 0.5,
-3.927202, -3.488172, -4, 1, 1.5, 0.5, 0.5,
-3.927202, -3.488172, -4, 0, 1.5, 0.5, 0.5,
-3.927202, -3.488172, -2, 0, -0.5, 0.5, 0.5,
-3.927202, -3.488172, -2, 1, -0.5, 0.5, 0.5,
-3.927202, -3.488172, -2, 1, 1.5, 0.5, 0.5,
-3.927202, -3.488172, -2, 0, 1.5, 0.5, 0.5,
-3.927202, -3.488172, 0, 0, -0.5, 0.5, 0.5,
-3.927202, -3.488172, 0, 1, -0.5, 0.5, 0.5,
-3.927202, -3.488172, 0, 1, 1.5, 0.5, 0.5,
-3.927202, -3.488172, 0, 0, 1.5, 0.5, 0.5,
-3.927202, -3.488172, 2, 0, -0.5, 0.5, 0.5,
-3.927202, -3.488172, 2, 1, -0.5, 0.5, 0.5,
-3.927202, -3.488172, 2, 1, 1.5, 0.5, 0.5,
-3.927202, -3.488172, 2, 0, 1.5, 0.5, 0.5,
-3.927202, -3.488172, 4, 0, -0.5, 0.5, 0.5,
-3.927202, -3.488172, 4, 1, -0.5, 0.5, 0.5,
-3.927202, -3.488172, 4, 1, 1.5, 0.5, 0.5,
-3.927202, -3.488172, 4, 0, 1.5, 0.5, 0.5
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
-3.404467, -3.02116, -5.345542,
-3.404467, 3.205662, -5.345542,
-3.404467, -3.02116, 5.824537,
-3.404467, 3.205662, 5.824537,
-3.404467, -3.02116, -5.345542,
-3.404467, -3.02116, 5.824537,
-3.404467, 3.205662, -5.345542,
-3.404467, 3.205662, 5.824537,
-3.404467, -3.02116, -5.345542,
3.565341, -3.02116, -5.345542,
-3.404467, -3.02116, 5.824537,
3.565341, -3.02116, 5.824537,
-3.404467, 3.205662, -5.345542,
3.565341, 3.205662, -5.345542,
-3.404467, 3.205662, 5.824537,
3.565341, 3.205662, 5.824537,
3.565341, -3.02116, -5.345542,
3.565341, 3.205662, -5.345542,
3.565341, -3.02116, 5.824537,
3.565341, 3.205662, 5.824537,
3.565341, -3.02116, -5.345542,
3.565341, -3.02116, 5.824537,
3.565341, 3.205662, -5.345542,
3.565341, 3.205662, 5.824537
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
var radius = 7.777115;
var distance = 34.60126;
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
mvMatrix.translate( -0.08043683, -0.0922507, -0.2394974 );
mvMatrix.scale( 1.206456, 1.350411, 0.7527941 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.60126);
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
fentin_acetate<-read.table("fentin_acetate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fentin_acetate$V2
```

```
## Error in eval(expr, envir, enclos): object 'fentin_acetate' not found
```

```r
y<-fentin_acetate$V3
```

```
## Error in eval(expr, envir, enclos): object 'fentin_acetate' not found
```

```r
z<-fentin_acetate$V4
```

```
## Error in eval(expr, envir, enclos): object 'fentin_acetate' not found
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
-3.302965, -1.641054, -2.027091, 0, 0, 1, 1, 1,
-3.027875, -0.2065677, -3.652588, 1, 0, 0, 1, 1,
-2.961322, -0.2785136, -0.645463, 1, 0, 0, 1, 1,
-2.791075, -0.1922559, -0.3060441, 1, 0, 0, 1, 1,
-2.709589, -0.2467426, -1.452652, 1, 0, 0, 1, 1,
-2.697577, -0.5887213, -1.112014, 1, 0, 0, 1, 1,
-2.642865, 0.6220755, -1.663236, 0, 0, 0, 1, 1,
-2.596089, 2.031971, -1.475928, 0, 0, 0, 1, 1,
-2.432813, 0.4485627, 0.7615559, 0, 0, 0, 1, 1,
-2.431281, 0.2246596, -2.22396, 0, 0, 0, 1, 1,
-2.38108, 0.3713365, -2.384916, 0, 0, 0, 1, 1,
-2.372126, -0.6337874, -2.108015, 0, 0, 0, 1, 1,
-2.354201, 0.1081547, -0.0007920163, 0, 0, 0, 1, 1,
-2.322756, 0.435166, -1.00651, 1, 1, 1, 1, 1,
-2.292297, 0.6639189, -1.511173, 1, 1, 1, 1, 1,
-2.291173, -0.3984475, -1.358794, 1, 1, 1, 1, 1,
-2.241594, 0.6357396, -0.2187601, 1, 1, 1, 1, 1,
-2.240018, 0.6631324, -0.09875335, 1, 1, 1, 1, 1,
-2.187638, -0.9395126, -2.182276, 1, 1, 1, 1, 1,
-2.143887, 0.105618, -2.693614, 1, 1, 1, 1, 1,
-2.139594, -0.05939352, 0.4979585, 1, 1, 1, 1, 1,
-2.125495, 0.1663657, -2.898326, 1, 1, 1, 1, 1,
-2.116942, -0.7608503, -1.259974, 1, 1, 1, 1, 1,
-2.06849, 0.681675, -2.251063, 1, 1, 1, 1, 1,
-2.023672, -0.5162762, -4.189913, 1, 1, 1, 1, 1,
-2.018372, 0.450153, 0.04267617, 1, 1, 1, 1, 1,
-2.016814, -0.6670274, -3.670314, 1, 1, 1, 1, 1,
-2.001352, 0.6871681, -0.2537796, 1, 1, 1, 1, 1,
-1.997327, 0.1408995, -1.273476, 0, 0, 1, 1, 1,
-1.987089, -0.172735, -2.324391, 1, 0, 0, 1, 1,
-1.978973, 1.215386, -0.9807765, 1, 0, 0, 1, 1,
-1.96704, -1.447994, -1.502992, 1, 0, 0, 1, 1,
-1.954914, -0.3172873, -1.260097, 1, 0, 0, 1, 1,
-1.940735, -0.8381593, -0.6364607, 1, 0, 0, 1, 1,
-1.935645, -0.4100965, -0.7178102, 0, 0, 0, 1, 1,
-1.926266, 0.6081532, -0.2183429, 0, 0, 0, 1, 1,
-1.925396, -0.9956642, -2.398853, 0, 0, 0, 1, 1,
-1.894314, -0.01166898, -1.474953, 0, 0, 0, 1, 1,
-1.866906, 1.100513, -0.9988114, 0, 0, 0, 1, 1,
-1.866538, 2.351575, -0.8714384, 0, 0, 0, 1, 1,
-1.857069, -1.017525, -1.842247, 0, 0, 0, 1, 1,
-1.821608, 0.881426, -2.24164, 1, 1, 1, 1, 1,
-1.786369, -0.6540554, -1.715595, 1, 1, 1, 1, 1,
-1.784851, -1.833548, -1.78417, 1, 1, 1, 1, 1,
-1.783916, -0.8624242, -2.475914, 1, 1, 1, 1, 1,
-1.771825, 0.6405707, -1.226139, 1, 1, 1, 1, 1,
-1.75653, -0.1368373, -0.4861763, 1, 1, 1, 1, 1,
-1.754922, -0.9238186, -1.634539, 1, 1, 1, 1, 1,
-1.748769, -0.3268875, -0.4322223, 1, 1, 1, 1, 1,
-1.747761, 1.140607, -1.505686, 1, 1, 1, 1, 1,
-1.725904, -0.1817914, -1.816821, 1, 1, 1, 1, 1,
-1.716498, 0.4562203, -0.7410361, 1, 1, 1, 1, 1,
-1.70299, 1.689055, -2.027292, 1, 1, 1, 1, 1,
-1.683509, -1.631213, -3.449247, 1, 1, 1, 1, 1,
-1.668985, 1.097719, 0.03278011, 1, 1, 1, 1, 1,
-1.661992, 1.0315, -3.184148, 1, 1, 1, 1, 1,
-1.65807, 1.344767, -0.1416623, 0, 0, 1, 1, 1,
-1.647918, -1.620306, -3.872731, 1, 0, 0, 1, 1,
-1.613208, 1.062171, -2.198163, 1, 0, 0, 1, 1,
-1.613149, -0.3585944, -5.182871, 1, 0, 0, 1, 1,
-1.61093, 0.8884661, -2.023005, 1, 0, 0, 1, 1,
-1.597896, 1.894617, -2.585126, 1, 0, 0, 1, 1,
-1.594284, 0.2054216, -2.430243, 0, 0, 0, 1, 1,
-1.59054, 1.420879, -1.152619, 0, 0, 0, 1, 1,
-1.56236, -0.8584026, -0.8196454, 0, 0, 0, 1, 1,
-1.541495, -1.346909, -4.579811, 0, 0, 0, 1, 1,
-1.537562, 0.770947, -0.5431275, 0, 0, 0, 1, 1,
-1.535345, -0.151553, -1.456596, 0, 0, 0, 1, 1,
-1.509661, 1.682131, 0.4257158, 0, 0, 0, 1, 1,
-1.484442, -0.3017761, -1.578057, 1, 1, 1, 1, 1,
-1.466079, -0.6357365, -2.977378, 1, 1, 1, 1, 1,
-1.449654, 1.471906, -0.8196897, 1, 1, 1, 1, 1,
-1.448892, 0.2648516, -3.217716, 1, 1, 1, 1, 1,
-1.446296, -1.309374, -4.456749, 1, 1, 1, 1, 1,
-1.442629, -0.5953204, -2.232165, 1, 1, 1, 1, 1,
-1.434503, -0.1452219, -0.5552819, 1, 1, 1, 1, 1,
-1.432588, 2.560233, -0.3570648, 1, 1, 1, 1, 1,
-1.429576, -1.405227, -3.619462, 1, 1, 1, 1, 1,
-1.422307, -0.8022896, -1.924839, 1, 1, 1, 1, 1,
-1.422017, -0.5196993, -1.434299, 1, 1, 1, 1, 1,
-1.421345, 0.005479933, -1.494481, 1, 1, 1, 1, 1,
-1.419394, -1.049962, -1.449735, 1, 1, 1, 1, 1,
-1.403968, 0.3793831, -1.793643, 1, 1, 1, 1, 1,
-1.381945, 0.2354447, -0.5407105, 1, 1, 1, 1, 1,
-1.376038, -0.3990507, -2.06566, 0, 0, 1, 1, 1,
-1.373248, 0.5343266, -0.1922792, 1, 0, 0, 1, 1,
-1.372963, 1.182288, -1.984877, 1, 0, 0, 1, 1,
-1.358705, 0.6101488, -2.259477, 1, 0, 0, 1, 1,
-1.348831, 0.9415432, 0.5594679, 1, 0, 0, 1, 1,
-1.347224, -0.5248874, -2.69547, 1, 0, 0, 1, 1,
-1.347146, -0.5851387, -1.111727, 0, 0, 0, 1, 1,
-1.346941, -0.03881977, -1.477322, 0, 0, 0, 1, 1,
-1.340041, -1.005958, -2.886976, 0, 0, 0, 1, 1,
-1.334705, -0.989772, -1.888571, 0, 0, 0, 1, 1,
-1.334418, -0.5340998, -3.253127, 0, 0, 0, 1, 1,
-1.309618, 2.07453, -1.335931, 0, 0, 0, 1, 1,
-1.305848, 1.24479, 0.754942, 0, 0, 0, 1, 1,
-1.294721, 1.56374, -2.334062, 1, 1, 1, 1, 1,
-1.288194, -0.210074, -1.878202, 1, 1, 1, 1, 1,
-1.284043, -0.6758274, -2.286276, 1, 1, 1, 1, 1,
-1.28249, 1.236099, -0.9406237, 1, 1, 1, 1, 1,
-1.278986, -0.1802747, 0.0880136, 1, 1, 1, 1, 1,
-1.272977, -0.2071698, -2.086603, 1, 1, 1, 1, 1,
-1.269467, 0.1833844, 0.01111276, 1, 1, 1, 1, 1,
-1.262804, -0.667302, -2.258415, 1, 1, 1, 1, 1,
-1.251881, -0.8760154, -2.355374, 1, 1, 1, 1, 1,
-1.238936, -1.12148, -4.036108, 1, 1, 1, 1, 1,
-1.236592, -1.564444, -1.745519, 1, 1, 1, 1, 1,
-1.228267, 0.9510103, -1.295454, 1, 1, 1, 1, 1,
-1.227936, 0.1603008, -2.51131, 1, 1, 1, 1, 1,
-1.218292, 0.5880533, -3.443371, 1, 1, 1, 1, 1,
-1.217242, 0.3708355, 0.8119165, 1, 1, 1, 1, 1,
-1.212516, -0.8614216, -1.080555, 0, 0, 1, 1, 1,
-1.20996, -1.827827, -3.356697, 1, 0, 0, 1, 1,
-1.19251, 0.6979285, -2.291031, 1, 0, 0, 1, 1,
-1.191796, 1.365329, -1.415937, 1, 0, 0, 1, 1,
-1.190838, 1.335989, 0.2464289, 1, 0, 0, 1, 1,
-1.187368, 2.78094, -0.6448235, 1, 0, 0, 1, 1,
-1.186154, 1.141847, -0.2741159, 0, 0, 0, 1, 1,
-1.184159, -0.5407953, -4.530559, 0, 0, 0, 1, 1,
-1.177316, 1.365061, -2.640384, 0, 0, 0, 1, 1,
-1.177192, 0.007317611, -0.9670445, 0, 0, 0, 1, 1,
-1.17698, 0.4888537, -2.743296, 0, 0, 0, 1, 1,
-1.170536, 0.447739, -1.596194, 0, 0, 0, 1, 1,
-1.158954, -1.735239, -3.000298, 0, 0, 0, 1, 1,
-1.158455, -0.368045, -3.378631, 1, 1, 1, 1, 1,
-1.15694, -0.7388188, -1.815127, 1, 1, 1, 1, 1,
-1.145283, -0.2611912, -2.298892, 1, 1, 1, 1, 1,
-1.143495, 0.4622593, -2.273275, 1, 1, 1, 1, 1,
-1.136452, 0.3873269, -0.2593717, 1, 1, 1, 1, 1,
-1.136065, -0.1620449, -1.590964, 1, 1, 1, 1, 1,
-1.135602, 0.3760044, -0.5039314, 1, 1, 1, 1, 1,
-1.135006, -0.2896501, -3.097714, 1, 1, 1, 1, 1,
-1.123535, -1.281588, -2.163711, 1, 1, 1, 1, 1,
-1.122184, -1.347172, -4.175673, 1, 1, 1, 1, 1,
-1.119941, 0.9791048, -1.652744, 1, 1, 1, 1, 1,
-1.118718, 0.3697456, -1.994926, 1, 1, 1, 1, 1,
-1.112326, -0.8681539, -1.474373, 1, 1, 1, 1, 1,
-1.109609, 0.9077036, -0.745473, 1, 1, 1, 1, 1,
-1.109472, -0.9077753, -1.222889, 1, 1, 1, 1, 1,
-1.098268, -0.4817121, -1.003379, 0, 0, 1, 1, 1,
-1.096598, -0.9499725, -2.42732, 1, 0, 0, 1, 1,
-1.095327, 0.04299117, 0.3688552, 1, 0, 0, 1, 1,
-1.093491, -0.2056359, -2.107218, 1, 0, 0, 1, 1,
-1.09028, 0.1615853, 0.3817196, 1, 0, 0, 1, 1,
-1.088888, 1.243911, 0.1494556, 1, 0, 0, 1, 1,
-1.085517, -0.7437869, -2.661199, 0, 0, 0, 1, 1,
-1.079484, 0.9217026, -0.5093172, 0, 0, 0, 1, 1,
-1.073985, 1.183996, 0.6799245, 0, 0, 0, 1, 1,
-1.070641, 0.8001299, 0.9704053, 0, 0, 0, 1, 1,
-1.070215, -1.137806, -2.309224, 0, 0, 0, 1, 1,
-1.068353, 0.7173754, -1.02152, 0, 0, 0, 1, 1,
-1.067847, -0.5247737, -2.219186, 0, 0, 0, 1, 1,
-1.066715, -2.245478, -1.467268, 1, 1, 1, 1, 1,
-1.065662, -0.1010883, 1.557567, 1, 1, 1, 1, 1,
-1.054642, -0.623634, -2.962456, 1, 1, 1, 1, 1,
-1.049425, 0.6260952, -1.162961, 1, 1, 1, 1, 1,
-1.040003, -0.6431451, -1.798893, 1, 1, 1, 1, 1,
-1.039582, 0.1721991, -0.04753082, 1, 1, 1, 1, 1,
-1.036478, -0.7204744, -2.275184, 1, 1, 1, 1, 1,
-1.034675, 1.752332, 0.4664613, 1, 1, 1, 1, 1,
-1.029727, -1.16347, -1.653607, 1, 1, 1, 1, 1,
-1.024266, -0.969797, -2.344379, 1, 1, 1, 1, 1,
-1.019665, 0.6024552, -0.2495636, 1, 1, 1, 1, 1,
-1.017024, -0.1748521, -1.953398, 1, 1, 1, 1, 1,
-1.008067, 1.634515, -0.2562487, 1, 1, 1, 1, 1,
-1.004873, 1.47764, -1.654155, 1, 1, 1, 1, 1,
-1.00466, -0.3700791, -1.739751, 1, 1, 1, 1, 1,
-1.004039, 0.8375407, -0.5437286, 0, 0, 1, 1, 1,
-1.001583, -0.9885415, -4.036655, 1, 0, 0, 1, 1,
-0.9958279, 0.8401057, -0.07122309, 1, 0, 0, 1, 1,
-0.9949123, -0.8769026, -2.852586, 1, 0, 0, 1, 1,
-0.9870963, 0.2473076, -1.426605, 1, 0, 0, 1, 1,
-0.984556, -1.092285, -2.651814, 1, 0, 0, 1, 1,
-0.9841458, -0.6798828, -2.841119, 0, 0, 0, 1, 1,
-0.9839652, -0.8844002, -1.71183, 0, 0, 0, 1, 1,
-0.9744554, 0.5884897, -1.045545, 0, 0, 0, 1, 1,
-0.9715865, -1.197473, -2.257766, 0, 0, 0, 1, 1,
-0.9675068, -1.403439, -2.809932, 0, 0, 0, 1, 1,
-0.9673953, -0.466003, -1.628716, 0, 0, 0, 1, 1,
-0.9667079, -2.068997, -1.181207, 0, 0, 0, 1, 1,
-0.9642383, 0.2160014, -2.414323, 1, 1, 1, 1, 1,
-0.9546162, -0.9493993, -3.498425, 1, 1, 1, 1, 1,
-0.9519582, 0.02176485, 0.2000858, 1, 1, 1, 1, 1,
-0.9507293, -0.5211384, -2.203807, 1, 1, 1, 1, 1,
-0.9404903, 1.297485, 1.648772, 1, 1, 1, 1, 1,
-0.9326266, -0.957432, -2.157175, 1, 1, 1, 1, 1,
-0.9306955, -1.044474, -0.4341478, 1, 1, 1, 1, 1,
-0.9256777, 0.6384687, -0.4704666, 1, 1, 1, 1, 1,
-0.9203345, -0.2237494, -0.02344087, 1, 1, 1, 1, 1,
-0.9192768, 0.7691252, 1.296025, 1, 1, 1, 1, 1,
-0.9174754, 1.687866, -1.432022, 1, 1, 1, 1, 1,
-0.9163691, 0.5184582, -1.221785, 1, 1, 1, 1, 1,
-0.9096109, 0.5419537, 0.1463909, 1, 1, 1, 1, 1,
-0.9085063, 0.3111734, -0.08798566, 1, 1, 1, 1, 1,
-0.9080339, 0.9375589, 0.4577791, 1, 1, 1, 1, 1,
-0.9053109, 1.137856, -1.520972, 0, 0, 1, 1, 1,
-0.8978173, 1.034624, -1.845067, 1, 0, 0, 1, 1,
-0.8976915, 0.7225054, 1.414087, 1, 0, 0, 1, 1,
-0.8966172, 0.8601948, -0.8209242, 1, 0, 0, 1, 1,
-0.8951324, 0.7247143, -1.293433, 1, 0, 0, 1, 1,
-0.8926378, -0.7740429, -2.254153, 1, 0, 0, 1, 1,
-0.8884119, -1.128664, -1.323202, 0, 0, 0, 1, 1,
-0.8842674, 0.6603785, -1.003097, 0, 0, 0, 1, 1,
-0.877811, 0.2047167, -1.581533, 0, 0, 0, 1, 1,
-0.8712769, 0.3058881, -2.026156, 0, 0, 0, 1, 1,
-0.8623387, -1.935179, -2.316077, 0, 0, 0, 1, 1,
-0.8619542, 0.6786032, -2.169617, 0, 0, 0, 1, 1,
-0.8585854, -1.02095, -4.385868, 0, 0, 0, 1, 1,
-0.8584271, -0.002714565, -0.7847778, 1, 1, 1, 1, 1,
-0.8529517, -1.100556, -2.672825, 1, 1, 1, 1, 1,
-0.8527366, 1.361908, 0.04783734, 1, 1, 1, 1, 1,
-0.8520166, 0.4912022, -2.116373, 1, 1, 1, 1, 1,
-0.8465239, -2.134891, -2.371103, 1, 1, 1, 1, 1,
-0.8431057, 0.5884393, -3.135577, 1, 1, 1, 1, 1,
-0.8374144, 0.6592054, -1.275788, 1, 1, 1, 1, 1,
-0.8337563, 0.9586621, -0.7196784, 1, 1, 1, 1, 1,
-0.8314699, -0.04270909, -0.4729184, 1, 1, 1, 1, 1,
-0.8270119, 0.168047, -0.5521219, 1, 1, 1, 1, 1,
-0.8187289, 0.9540703, 0.7790235, 1, 1, 1, 1, 1,
-0.8118221, 1.144346, -1.018019, 1, 1, 1, 1, 1,
-0.8100703, -0.1159957, -3.367897, 1, 1, 1, 1, 1,
-0.8097605, 0.5028543, -1.203058, 1, 1, 1, 1, 1,
-0.8027543, 0.8568268, -0.2493897, 1, 1, 1, 1, 1,
-0.801735, 0.0723905, -4.760424, 0, 0, 1, 1, 1,
-0.7997093, 1.276276, -0.2573376, 1, 0, 0, 1, 1,
-0.7995566, -0.7023832, -1.168353, 1, 0, 0, 1, 1,
-0.7989438, -0.06699625, -1.814846, 1, 0, 0, 1, 1,
-0.7988561, 0.2737307, -2.072419, 1, 0, 0, 1, 1,
-0.792146, -0.4656979, -2.314843, 1, 0, 0, 1, 1,
-0.7832205, 0.3765348, 0.5542492, 0, 0, 0, 1, 1,
-0.7749945, 1.366213, -1.455372, 0, 0, 0, 1, 1,
-0.7744637, 0.02652533, -2.577063, 0, 0, 0, 1, 1,
-0.7589673, -2.091641, -3.526773, 0, 0, 0, 1, 1,
-0.7578812, -0.7944071, -1.114268, 0, 0, 0, 1, 1,
-0.7537661, -0.9947845, -3.433585, 0, 0, 0, 1, 1,
-0.7524714, -2.032637, -4.120748, 0, 0, 0, 1, 1,
-0.7509913, 2.253477, -0.09869512, 1, 1, 1, 1, 1,
-0.7400926, 0.4019296, 0.379523, 1, 1, 1, 1, 1,
-0.7371845, -1.379954, -2.99591, 1, 1, 1, 1, 1,
-0.7365558, -0.1309247, -0.6090486, 1, 1, 1, 1, 1,
-0.7288452, 0.998607, -0.3732231, 1, 1, 1, 1, 1,
-0.724716, 2.042098, -0.4270741, 1, 1, 1, 1, 1,
-0.7215506, -0.6891847, -4.177307, 1, 1, 1, 1, 1,
-0.7215335, 1.355316, -0.8270395, 1, 1, 1, 1, 1,
-0.7148758, -0.7007844, -2.357584, 1, 1, 1, 1, 1,
-0.709039, -0.87498, -1.883689, 1, 1, 1, 1, 1,
-0.7086015, 0.1660814, -2.282477, 1, 1, 1, 1, 1,
-0.7062827, 0.8112159, -0.7717991, 1, 1, 1, 1, 1,
-0.7058427, 0.7063659, -0.9823366, 1, 1, 1, 1, 1,
-0.7055074, -0.9009676, -4.047876, 1, 1, 1, 1, 1,
-0.704482, 0.9099465, -0.6779269, 1, 1, 1, 1, 1,
-0.7011027, -0.03464478, -0.9095836, 0, 0, 1, 1, 1,
-0.6994734, -1.170059, -0.7553552, 1, 0, 0, 1, 1,
-0.6983704, 1.09337, -0.00224955, 1, 0, 0, 1, 1,
-0.6982549, 1.884174, 0.4952615, 1, 0, 0, 1, 1,
-0.6968538, 0.8969941, -2.135151, 1, 0, 0, 1, 1,
-0.6935192, 0.08712696, -2.148928, 1, 0, 0, 1, 1,
-0.6893127, -0.8326085, -2.834226, 0, 0, 0, 1, 1,
-0.6850712, -1.27517, -2.122687, 0, 0, 0, 1, 1,
-0.6764919, -1.102668, -2.969437, 0, 0, 0, 1, 1,
-0.6750823, 2.996094, 0.3069969, 0, 0, 0, 1, 1,
-0.6741621, 0.01571123, -3.02248, 0, 0, 0, 1, 1,
-0.6717319, 0.5010419, 0.2336769, 0, 0, 0, 1, 1,
-0.6624201, -1.814217, -4.735097, 0, 0, 0, 1, 1,
-0.662001, 0.7746004, -1.51698, 1, 1, 1, 1, 1,
-0.6605355, -1.731314, -3.066362, 1, 1, 1, 1, 1,
-0.6590408, 0.3198311, 1.144717, 1, 1, 1, 1, 1,
-0.6584406, 0.6106709, -0.5171257, 1, 1, 1, 1, 1,
-0.6563046, -1.144778, -2.842552, 1, 1, 1, 1, 1,
-0.6549601, 2.313843, 0.4164471, 1, 1, 1, 1, 1,
-0.6547894, 2.234628, -2.77759, 1, 1, 1, 1, 1,
-0.6477067, -0.4124675, -0.965143, 1, 1, 1, 1, 1,
-0.6459374, 1.857215, -0.7006723, 1, 1, 1, 1, 1,
-0.6439556, -1.06209, -2.898478, 1, 1, 1, 1, 1,
-0.6426928, 0.1476111, -0.484862, 1, 1, 1, 1, 1,
-0.641889, -0.8464609, -4.681477, 1, 1, 1, 1, 1,
-0.63803, 0.3815062, -1.057325, 1, 1, 1, 1, 1,
-0.6366719, -0.7663192, -2.383006, 1, 1, 1, 1, 1,
-0.6319011, -0.3897575, -0.7711245, 1, 1, 1, 1, 1,
-0.6253058, 0.4372658, 0.1908995, 0, 0, 1, 1, 1,
-0.6246189, 1.319685, -1.309683, 1, 0, 0, 1, 1,
-0.6233715, 0.5231668, -2.093898, 1, 0, 0, 1, 1,
-0.6207793, 0.6116269, -1.481241, 1, 0, 0, 1, 1,
-0.6191113, 0.2679861, -0.4468111, 1, 0, 0, 1, 1,
-0.6170851, -0.8110084, -2.930013, 1, 0, 0, 1, 1,
-0.6144127, 0.1466533, -1.713542, 0, 0, 0, 1, 1,
-0.6091943, 0.4225438, -1.104691, 0, 0, 0, 1, 1,
-0.6022076, -0.7364708, -2.412366, 0, 0, 0, 1, 1,
-0.5991046, -0.07589625, -1.703248, 0, 0, 0, 1, 1,
-0.5966579, 1.078794, -1.5484, 0, 0, 0, 1, 1,
-0.5949243, 0.7447571, 0.7476795, 0, 0, 0, 1, 1,
-0.5921799, -1.240661, -1.788231, 0, 0, 0, 1, 1,
-0.5879761, 1.033, -0.4795383, 1, 1, 1, 1, 1,
-0.5849931, 1.881812, -0.4045238, 1, 1, 1, 1, 1,
-0.5821991, -0.5345926, -2.118558, 1, 1, 1, 1, 1,
-0.5815757, -0.1254866, -2.060199, 1, 1, 1, 1, 1,
-0.5809538, 0.3339995, -1.004267, 1, 1, 1, 1, 1,
-0.5781533, 0.08072944, -0.6408736, 1, 1, 1, 1, 1,
-0.5729542, 2.341229, 0.255821, 1, 1, 1, 1, 1,
-0.5697658, -0.6936656, -3.222012, 1, 1, 1, 1, 1,
-0.5681171, 0.4958012, -1.617959, 1, 1, 1, 1, 1,
-0.5622168, -0.1725995, -2.744883, 1, 1, 1, 1, 1,
-0.5609074, 1.388043, -1.97488, 1, 1, 1, 1, 1,
-0.5565724, 0.5927481, -0.9235646, 1, 1, 1, 1, 1,
-0.5561051, 0.8537868, 1.054595, 1, 1, 1, 1, 1,
-0.5543533, -0.2778651, -3.842515, 1, 1, 1, 1, 1,
-0.5541723, -0.3730775, -1.735611, 1, 1, 1, 1, 1,
-0.5527291, 0.6600641, -2.572818, 0, 0, 1, 1, 1,
-0.5483486, 0.3291838, 0.1131384, 1, 0, 0, 1, 1,
-0.5478749, 0.9516159, -1.418106, 1, 0, 0, 1, 1,
-0.5472167, -0.5118702, -2.23132, 1, 0, 0, 1, 1,
-0.546057, -1.771382, -3.522881, 1, 0, 0, 1, 1,
-0.5377088, -1.221313, -4.004461, 1, 0, 0, 1, 1,
-0.5363912, 0.3381424, -1.093037, 0, 0, 0, 1, 1,
-0.5352445, -1.906854, -2.121652, 0, 0, 0, 1, 1,
-0.5332539, 1.219012, -0.5066696, 0, 0, 0, 1, 1,
-0.5299149, 2.343021, -0.8670074, 0, 0, 0, 1, 1,
-0.5191327, -2.025223, -3.529489, 0, 0, 0, 1, 1,
-0.5183405, -0.8484214, -0.8646376, 0, 0, 0, 1, 1,
-0.5174073, -1.572114, -2.782358, 0, 0, 0, 1, 1,
-0.5170688, -1.356329, -2.206097, 1, 1, 1, 1, 1,
-0.5132511, -1.001034, -1.916434, 1, 1, 1, 1, 1,
-0.5122629, -0.2059909, -0.363124, 1, 1, 1, 1, 1,
-0.5087615, 1.189664, -1.586122, 1, 1, 1, 1, 1,
-0.5044148, 0.6522766, -2.051952, 1, 1, 1, 1, 1,
-0.503976, 0.06878406, -1.722043, 1, 1, 1, 1, 1,
-0.5003244, 0.7292159, -1.061418, 1, 1, 1, 1, 1,
-0.4999286, 0.05818275, -1.597062, 1, 1, 1, 1, 1,
-0.4981037, 0.2239094, -0.5403293, 1, 1, 1, 1, 1,
-0.4969367, 0.3311106, -0.4320173, 1, 1, 1, 1, 1,
-0.4954851, -0.02097609, -2.239161, 1, 1, 1, 1, 1,
-0.49353, -0.7571543, -3.184355, 1, 1, 1, 1, 1,
-0.4900716, -1.248497, -3.963003, 1, 1, 1, 1, 1,
-0.4697249, 0.86265, -0.5577506, 1, 1, 1, 1, 1,
-0.4619506, -0.5822508, -3.137658, 1, 1, 1, 1, 1,
-0.4553205, -0.02166441, -1.812634, 0, 0, 1, 1, 1,
-0.454118, -0.8141771, -1.59158, 1, 0, 0, 1, 1,
-0.4456237, 0.4206378, -0.99661, 1, 0, 0, 1, 1,
-0.4439783, -1.495516, -4.195429, 1, 0, 0, 1, 1,
-0.4434629, -0.7958083, -2.102044, 1, 0, 0, 1, 1,
-0.4402849, 0.8600829, 1.483423, 1, 0, 0, 1, 1,
-0.4354376, 0.7484406, 0.7367191, 0, 0, 0, 1, 1,
-0.4347333, 1.093345, 1.140978, 0, 0, 0, 1, 1,
-0.4329717, -0.7071237, -2.523033, 0, 0, 0, 1, 1,
-0.4286426, -0.6971261, -1.294892, 0, 0, 0, 1, 1,
-0.4282569, 0.6404724, -1.692049, 0, 0, 0, 1, 1,
-0.4234729, -2.227043, -2.702033, 0, 0, 0, 1, 1,
-0.4215648, 0.4356195, -0.6230901, 0, 0, 0, 1, 1,
-0.4161675, 0.7780227, -0.6293421, 1, 1, 1, 1, 1,
-0.4118899, -1.035102, -1.61754, 1, 1, 1, 1, 1,
-0.4095564, -0.3725678, -2.1873, 1, 1, 1, 1, 1,
-0.4051715, -0.01830834, -1.074783, 1, 1, 1, 1, 1,
-0.4048587, -2.034274, -3.523395, 1, 1, 1, 1, 1,
-0.4011737, -1.165412, -2.540062, 1, 1, 1, 1, 1,
-0.3997943, 1.438375, -1.665089, 1, 1, 1, 1, 1,
-0.39885, -0.2148758, -1.598533, 1, 1, 1, 1, 1,
-0.3961806, -0.550909, -2.973151, 1, 1, 1, 1, 1,
-0.3908594, 0.2075549, -1.100195, 1, 1, 1, 1, 1,
-0.3888665, 3.11498, -1.04871, 1, 1, 1, 1, 1,
-0.3877934, -0.4611255, -1.454086, 1, 1, 1, 1, 1,
-0.3848817, 0.3919328, -0.8852991, 1, 1, 1, 1, 1,
-0.3747002, 0.582404, -1.277717, 1, 1, 1, 1, 1,
-0.3702701, 1.291326, 0.4819008, 1, 1, 1, 1, 1,
-0.3699336, 0.4195285, -0.5197782, 0, 0, 1, 1, 1,
-0.3663837, 1.291338, 0.07199173, 1, 0, 0, 1, 1,
-0.3653728, 0.8634763, 0.4165958, 1, 0, 0, 1, 1,
-0.3652662, -1.117992, -2.875706, 1, 0, 0, 1, 1,
-0.3648869, 0.9961025, -0.1596917, 1, 0, 0, 1, 1,
-0.3638278, 0.1850509, -1.893904, 1, 0, 0, 1, 1,
-0.3634545, 1.95606, -1.089578, 0, 0, 0, 1, 1,
-0.3634093, -1.859318, -1.522013, 0, 0, 0, 1, 1,
-0.3599772, 1.073995, -0.552866, 0, 0, 0, 1, 1,
-0.3574675, 0.3033645, 0.009835341, 0, 0, 0, 1, 1,
-0.351269, -0.2895061, -2.11738, 0, 0, 0, 1, 1,
-0.3509884, -0.0189955, -2.666309, 0, 0, 0, 1, 1,
-0.3507867, 0.1383959, -3.137428, 0, 0, 0, 1, 1,
-0.3493091, -1.38534, -2.555132, 1, 1, 1, 1, 1,
-0.3482771, 0.7149708, -1.339965, 1, 1, 1, 1, 1,
-0.3300351, -1.666353, -3.579351, 1, 1, 1, 1, 1,
-0.3218147, -0.8584437, -3.807712, 1, 1, 1, 1, 1,
-0.3192163, 0.3151284, -0.1215025, 1, 1, 1, 1, 1,
-0.3145722, 2.076818, -1.011906, 1, 1, 1, 1, 1,
-0.3114849, 0.3096085, -2.29775, 1, 1, 1, 1, 1,
-0.3086765, -1.551452, -4.310682, 1, 1, 1, 1, 1,
-0.3084793, 0.9760422, -1.319943, 1, 1, 1, 1, 1,
-0.3027724, 2.046912, 0.2027752, 1, 1, 1, 1, 1,
-0.3007924, 2.158511, -0.1303809, 1, 1, 1, 1, 1,
-0.300402, -0.7786852, -1.724483, 1, 1, 1, 1, 1,
-0.2974897, -0.08211833, -1.311814, 1, 1, 1, 1, 1,
-0.2962559, 0.7608817, -1.858916, 1, 1, 1, 1, 1,
-0.291563, 0.9454747, -0.6396136, 1, 1, 1, 1, 1,
-0.2900506, 0.4315495, 0.9237586, 0, 0, 1, 1, 1,
-0.2859865, -0.03433478, -3.31631, 1, 0, 0, 1, 1,
-0.2802971, 0.04444206, -1.378258, 1, 0, 0, 1, 1,
-0.279839, 0.5767221, -1.133495, 1, 0, 0, 1, 1,
-0.2792589, 0.1449301, -0.8715577, 1, 0, 0, 1, 1,
-0.2740663, -0.9706986, -2.455827, 1, 0, 0, 1, 1,
-0.273969, -1.094499, -3.558091, 0, 0, 0, 1, 1,
-0.26896, 0.4507906, -0.8572794, 0, 0, 0, 1, 1,
-0.2645607, 0.7320497, -0.3207791, 0, 0, 0, 1, 1,
-0.2597317, -1.074733, -2.427616, 0, 0, 0, 1, 1,
-0.2595959, 1.212998, -0.4535163, 0, 0, 0, 1, 1,
-0.2590966, -0.6858141, -3.046984, 0, 0, 0, 1, 1,
-0.258569, -0.2759146, -1.653995, 0, 0, 0, 1, 1,
-0.2510753, 0.6107837, -1.336233, 1, 1, 1, 1, 1,
-0.248212, -1.724607, -3.018425, 1, 1, 1, 1, 1,
-0.2451571, -1.440424, -2.563453, 1, 1, 1, 1, 1,
-0.2374494, 0.3425789, -1.843383, 1, 1, 1, 1, 1,
-0.236414, -1.256313, -3.165668, 1, 1, 1, 1, 1,
-0.2349319, -0.4216744, -2.056834, 1, 1, 1, 1, 1,
-0.2334933, -0.9407165, -2.396246, 1, 1, 1, 1, 1,
-0.2319982, 0.2524476, -1.690212, 1, 1, 1, 1, 1,
-0.2314782, 0.597193, -0.7636073, 1, 1, 1, 1, 1,
-0.2303569, -0.03068984, -1.739269, 1, 1, 1, 1, 1,
-0.2299714, 0.4840018, -1.813262, 1, 1, 1, 1, 1,
-0.2240804, -0.132112, -2.082187, 1, 1, 1, 1, 1,
-0.2233761, -0.9804386, -3.288213, 1, 1, 1, 1, 1,
-0.2201351, 1.688532, -0.2655506, 1, 1, 1, 1, 1,
-0.2193812, -0.4650071, -2.938925, 1, 1, 1, 1, 1,
-0.2156382, -1.829765, -4.038312, 0, 0, 1, 1, 1,
-0.2146983, 0.6351027, -0.2978702, 1, 0, 0, 1, 1,
-0.209677, -0.1960808, -1.805447, 1, 0, 0, 1, 1,
-0.2050337, -0.7228873, -2.773501, 1, 0, 0, 1, 1,
-0.2045358, 1.13402, 0.6094733, 1, 0, 0, 1, 1,
-0.2008457, -0.09817929, -0.1716283, 1, 0, 0, 1, 1,
-0.1986554, -1.768028, -3.390025, 0, 0, 0, 1, 1,
-0.1961069, 0.2648107, -0.9023709, 0, 0, 0, 1, 1,
-0.1904255, 0.7747645, -1.383684, 0, 0, 0, 1, 1,
-0.1849535, -0.2399678, -1.507743, 0, 0, 0, 1, 1,
-0.1811472, -1.554714, -2.401242, 0, 0, 0, 1, 1,
-0.1805108, -1.255448, -1.638049, 0, 0, 0, 1, 1,
-0.1787931, 0.2056036, -0.5277132, 0, 0, 0, 1, 1,
-0.1785016, -0.5328889, -2.807906, 1, 1, 1, 1, 1,
-0.1781184, -0.4670598, -4.257329, 1, 1, 1, 1, 1,
-0.1756267, 0.8887699, -2.286049, 1, 1, 1, 1, 1,
-0.174012, 0.444873, 0.7164407, 1, 1, 1, 1, 1,
-0.1717498, 1.269803, 0.2446883, 1, 1, 1, 1, 1,
-0.1716935, 0.1724519, -0.2338565, 1, 1, 1, 1, 1,
-0.1697862, -0.3032046, -3.216636, 1, 1, 1, 1, 1,
-0.1597379, 1.215371, -1.789783, 1, 1, 1, 1, 1,
-0.1584887, -0.261883, -2.224494, 1, 1, 1, 1, 1,
-0.1564902, -1.536535, -2.398012, 1, 1, 1, 1, 1,
-0.1563101, -0.8551584, -3.378289, 1, 1, 1, 1, 1,
-0.1562242, 1.122126, -0.6735257, 1, 1, 1, 1, 1,
-0.1554861, -0.6072204, -3.461272, 1, 1, 1, 1, 1,
-0.1536878, 1.210255, -1.162817, 1, 1, 1, 1, 1,
-0.1517536, -0.7306193, -3.570539, 1, 1, 1, 1, 1,
-0.1486642, -0.05129813, -1.957045, 0, 0, 1, 1, 1,
-0.1482492, 0.3096955, -1.527077, 1, 0, 0, 1, 1,
-0.1478629, -0.3429035, -3.540902, 1, 0, 0, 1, 1,
-0.1432192, 0.005359331, -1.451131, 1, 0, 0, 1, 1,
-0.1404907, 0.3103512, -2.269876, 1, 0, 0, 1, 1,
-0.1396312, -0.0498652, -0.02733573, 1, 0, 0, 1, 1,
-0.1373953, -1.178434, -3.56101, 0, 0, 0, 1, 1,
-0.1332407, 0.7969056, -1.111673, 0, 0, 0, 1, 1,
-0.1323856, -0.2426929, -3.322583, 0, 0, 0, 1, 1,
-0.1302516, 1.23847, 0.6600088, 0, 0, 0, 1, 1,
-0.1162565, -0.4298349, -2.006442, 0, 0, 0, 1, 1,
-0.1162204, 0.7468306, 0.01439962, 0, 0, 0, 1, 1,
-0.1129029, 1.225406, -0.3186293, 0, 0, 0, 1, 1,
-0.1100057, 0.7589554, 1.193901, 1, 1, 1, 1, 1,
-0.1099163, -0.2545045, -4.222561, 1, 1, 1, 1, 1,
-0.1078108, 0.4453593, -0.4045587, 1, 1, 1, 1, 1,
-0.1077496, -0.3219755, -2.546372, 1, 1, 1, 1, 1,
-0.1064026, 1.471524, 0.6956355, 1, 1, 1, 1, 1,
-0.1061038, -1.189571, -2.996795, 1, 1, 1, 1, 1,
-0.1045867, 0.587927, -0.9174721, 1, 1, 1, 1, 1,
-0.1039187, 1.328148, -0.903401, 1, 1, 1, 1, 1,
-0.1030967, -0.4974607, -2.331481, 1, 1, 1, 1, 1,
-0.1026087, 1.313498, -0.8362671, 1, 1, 1, 1, 1,
-0.1023853, 1.840638, -0.3078284, 1, 1, 1, 1, 1,
-0.1018851, -0.683263, -2.468884, 1, 1, 1, 1, 1,
-0.1014052, 0.5940809, -1.469378, 1, 1, 1, 1, 1,
-0.1008872, -1.026939, -3.460361, 1, 1, 1, 1, 1,
-0.09910719, 1.139808, 1.6425, 1, 1, 1, 1, 1,
-0.09424078, -0.30912, -1.534227, 0, 0, 1, 1, 1,
-0.09113841, -0.3418564, -2.672993, 1, 0, 0, 1, 1,
-0.08840401, -0.6322737, -3.319994, 1, 0, 0, 1, 1,
-0.08002714, -0.3280498, -2.631946, 1, 0, 0, 1, 1,
-0.07802907, -0.1877668, -2.630931, 1, 0, 0, 1, 1,
-0.07797592, -0.337814, -2.439574, 1, 0, 0, 1, 1,
-0.07144397, -0.5786796, -2.220529, 0, 0, 0, 1, 1,
-0.07035299, 0.6799394, 1.275664, 0, 0, 0, 1, 1,
-0.06866192, 0.898059, 1.026348, 0, 0, 0, 1, 1,
-0.0568395, -0.4198543, -1.943813, 0, 0, 0, 1, 1,
-0.05330421, 0.7821501, 0.006091138, 0, 0, 0, 1, 1,
-0.05249865, -0.4212513, -2.366078, 0, 0, 0, 1, 1,
-0.05074963, 0.8451286, 0.4131712, 0, 0, 0, 1, 1,
-0.04904288, -1.417994, -3.439269, 1, 1, 1, 1, 1,
-0.04498096, 0.01977858, 0.01290335, 1, 1, 1, 1, 1,
-0.04349181, -0.9160756, -2.971515, 1, 1, 1, 1, 1,
-0.04310356, -0.1962056, -4.287355, 1, 1, 1, 1, 1,
-0.04088549, -2.406213, -4.892348, 1, 1, 1, 1, 1,
-0.03428264, -1.08429, -4.884867, 1, 1, 1, 1, 1,
-0.03125974, -0.1584888, -2.767418, 1, 1, 1, 1, 1,
-0.02833644, -0.5983481, -1.979523, 1, 1, 1, 1, 1,
-0.02657854, -0.1587389, -3.868355, 1, 1, 1, 1, 1,
-0.02653354, -0.6578535, -3.440361, 1, 1, 1, 1, 1,
-0.02609319, 0.9410401, -1.082047, 1, 1, 1, 1, 1,
-0.02486398, 1.362885, -2.518209, 1, 1, 1, 1, 1,
-0.02005048, -1.05906, -1.910139, 1, 1, 1, 1, 1,
-0.01511085, 1.505377, -1.612601, 1, 1, 1, 1, 1,
-0.01435941, 0.7909585, -0.4727553, 1, 1, 1, 1, 1,
-0.01231436, 1.436859, -1.390254, 0, 0, 1, 1, 1,
-0.008745629, -0.6529453, -2.580517, 1, 0, 0, 1, 1,
-0.004466166, 1.542406, 0.3599177, 1, 0, 0, 1, 1,
0.0001638987, 1.267157, -0.6408602, 1, 0, 0, 1, 1,
0.001598342, -0.3885457, 2.751685, 1, 0, 0, 1, 1,
0.00319777, 1.023034, -0.7041464, 1, 0, 0, 1, 1,
0.008467678, 1.115786, 1.115055, 0, 0, 0, 1, 1,
0.008954561, 0.3648342, 0.6726146, 0, 0, 0, 1, 1,
0.01123556, -1.012688, 3.12531, 0, 0, 0, 1, 1,
0.01218277, 0.1269667, 0.8441428, 0, 0, 0, 1, 1,
0.01466015, -1.234156, 5.08723, 0, 0, 0, 1, 1,
0.01560401, 0.2542184, -0.05660782, 0, 0, 0, 1, 1,
0.01642985, -0.4347582, 2.901351, 0, 0, 0, 1, 1,
0.01815875, 0.9599301, 1.481257, 1, 1, 1, 1, 1,
0.02225125, 0.0474546, -0.640561, 1, 1, 1, 1, 1,
0.02486215, -0.9504475, 3.429433, 1, 1, 1, 1, 1,
0.02805342, -0.6973109, 5.233496, 1, 1, 1, 1, 1,
0.02817834, 0.3389331, 0.6049213, 1, 1, 1, 1, 1,
0.03430438, -2.046865, 2.833358, 1, 1, 1, 1, 1,
0.0354078, -0.5611551, 2.050424, 1, 1, 1, 1, 1,
0.03773438, 0.8370598, -0.1642855, 1, 1, 1, 1, 1,
0.03873444, -1.455569, 2.339189, 1, 1, 1, 1, 1,
0.04059053, -1.121675, 3.543716, 1, 1, 1, 1, 1,
0.04149795, -0.7395136, 4.545165, 1, 1, 1, 1, 1,
0.04152666, -0.2812562, 3.781398, 1, 1, 1, 1, 1,
0.04593, 1.112602, -0.2321726, 1, 1, 1, 1, 1,
0.0506867, -0.9974434, 4.513937, 1, 1, 1, 1, 1,
0.05084925, -0.599412, 3.166682, 1, 1, 1, 1, 1,
0.05188348, 1.076365, 0.1489874, 0, 0, 1, 1, 1,
0.05246901, 1.962431, 0.4877702, 1, 0, 0, 1, 1,
0.05502534, 0.5043862, -1.488758, 1, 0, 0, 1, 1,
0.05589937, 2.822236, 0.1809689, 1, 0, 0, 1, 1,
0.05652709, 0.7429298, 0.1871955, 1, 0, 0, 1, 1,
0.05887086, 1.262536, 0.9446403, 1, 0, 0, 1, 1,
0.06033995, -1.009219, 3.146177, 0, 0, 0, 1, 1,
0.06480569, -0.2276835, 3.466464, 0, 0, 0, 1, 1,
0.06805657, 0.1156912, 0.1178399, 0, 0, 0, 1, 1,
0.06979077, -0.2245496, 3.770899, 0, 0, 0, 1, 1,
0.07049914, 2.552752, 0.2691149, 0, 0, 0, 1, 1,
0.07285214, -1.099765, 1.698987, 0, 0, 0, 1, 1,
0.07597449, -0.4347534, 3.461017, 0, 0, 0, 1, 1,
0.07945144, -1.489904, 3.544377, 1, 1, 1, 1, 1,
0.07972802, -1.046562, 3.469747, 1, 1, 1, 1, 1,
0.08257151, 0.3289705, 0.7726786, 1, 1, 1, 1, 1,
0.0882453, -1.94715, 2.103612, 1, 1, 1, 1, 1,
0.08882759, -0.01888361, 0.540283, 1, 1, 1, 1, 1,
0.0914326, 2.303929, 0.9652968, 1, 1, 1, 1, 1,
0.09519873, 0.7408719, 0.5957503, 1, 1, 1, 1, 1,
0.09601039, -0.4664096, 1.899689, 1, 1, 1, 1, 1,
0.104034, 0.3304518, -2.032861, 1, 1, 1, 1, 1,
0.1053383, -1.791727, 1.099892, 1, 1, 1, 1, 1,
0.1062532, -0.3211516, 4.054692, 1, 1, 1, 1, 1,
0.1079945, -1.353695, 1.014063, 1, 1, 1, 1, 1,
0.1106607, 2.524414, -1.58094, 1, 1, 1, 1, 1,
0.1153254, 0.552857, -0.3519278, 1, 1, 1, 1, 1,
0.1181274, -0.0437879, 1.3521, 1, 1, 1, 1, 1,
0.1200512, -0.5560326, 4.284415, 0, 0, 1, 1, 1,
0.1211323, 1.165471, -1.323199, 1, 0, 0, 1, 1,
0.1294813, 1.078327, -1.768326, 1, 0, 0, 1, 1,
0.1361229, 0.4247496, -1.504124, 1, 0, 0, 1, 1,
0.143338, 0.5295784, -0.7774814, 1, 0, 0, 1, 1,
0.1445034, 0.9481251, 1.042399, 1, 0, 0, 1, 1,
0.1471221, -0.4624194, 1.978875, 0, 0, 0, 1, 1,
0.1506321, 0.3574565, 1.346367, 0, 0, 0, 1, 1,
0.154009, 0.5701457, 1.013719, 0, 0, 0, 1, 1,
0.1563896, -0.2116661, 3.477891, 0, 0, 0, 1, 1,
0.1622168, -1.427433, 1.570243, 0, 0, 0, 1, 1,
0.1650208, -0.1626772, 0.4832968, 0, 0, 0, 1, 1,
0.1653979, 1.251637, -1.402115, 0, 0, 0, 1, 1,
0.1675181, -1.294397, 2.186061, 1, 1, 1, 1, 1,
0.1704697, -0.1456838, 4.235874, 1, 1, 1, 1, 1,
0.1757226, 1.266397, 0.9168099, 1, 1, 1, 1, 1,
0.1762861, -1.483402, 2.693153, 1, 1, 1, 1, 1,
0.1846915, 0.6242167, 1.279922, 1, 1, 1, 1, 1,
0.1902548, 0.4140029, 0.915327, 1, 1, 1, 1, 1,
0.1924996, -0.8089036, 3.096585, 1, 1, 1, 1, 1,
0.1983093, -0.3365541, 3.156256, 1, 1, 1, 1, 1,
0.1991384, 2.098631, -1.243261, 1, 1, 1, 1, 1,
0.2036333, -0.3479806, 3.809666, 1, 1, 1, 1, 1,
0.2082241, 0.3795197, -1.99121, 1, 1, 1, 1, 1,
0.2082895, 1.32621, 1.235353, 1, 1, 1, 1, 1,
0.2099172, -0.2514283, 2.532319, 1, 1, 1, 1, 1,
0.2164718, -0.3821115, 1.496259, 1, 1, 1, 1, 1,
0.2179524, 1.99562, -0.5001312, 1, 1, 1, 1, 1,
0.225866, 0.429435, -0.6241295, 0, 0, 1, 1, 1,
0.2284736, -0.8442718, 3.446378, 1, 0, 0, 1, 1,
0.2306432, -0.9664172, 2.291786, 1, 0, 0, 1, 1,
0.2319037, -0.9190007, 1.310792, 1, 0, 0, 1, 1,
0.2331571, 1.120797, -0.9173524, 1, 0, 0, 1, 1,
0.235362, 0.9208383, -0.1778962, 1, 0, 0, 1, 1,
0.2400588, -0.087236, 2.767527, 0, 0, 0, 1, 1,
0.2434311, 1.152381, -1.777481, 0, 0, 0, 1, 1,
0.2458384, 0.6996429, -0.3489861, 0, 0, 0, 1, 1,
0.248609, 1.062047, 0.3722665, 0, 0, 0, 1, 1,
0.2503671, 0.07958061, 1.478499, 0, 0, 0, 1, 1,
0.2536115, -0.7139078, 1.850424, 0, 0, 0, 1, 1,
0.254266, 1.301285, -1.288113, 0, 0, 0, 1, 1,
0.2554176, 1.120575, -0.0002224951, 1, 1, 1, 1, 1,
0.2572002, 0.1925263, -0.284227, 1, 1, 1, 1, 1,
0.2601816, -0.3631275, 1.678954, 1, 1, 1, 1, 1,
0.2627238, -0.9993224, 3.458773, 1, 1, 1, 1, 1,
0.2631626, -1.196048, 2.985531, 1, 1, 1, 1, 1,
0.2675883, 0.5202682, 0.5430353, 1, 1, 1, 1, 1,
0.2687323, 0.4694107, 0.543366, 1, 1, 1, 1, 1,
0.277908, 0.1692141, 3.085496, 1, 1, 1, 1, 1,
0.2785042, 0.5409518, 1.494653, 1, 1, 1, 1, 1,
0.2798898, 1.564753, 0.4420492, 1, 1, 1, 1, 1,
0.2831767, -1.962852, 3.656709, 1, 1, 1, 1, 1,
0.2854616, -0.8454289, 3.031174, 1, 1, 1, 1, 1,
0.2859984, -0.6625741, 5.22598, 1, 1, 1, 1, 1,
0.2929312, 0.6042594, -1.273308, 1, 1, 1, 1, 1,
0.2974817, -0.913363, 2.418998, 1, 1, 1, 1, 1,
0.2981126, 2.258657, -0.3977419, 0, 0, 1, 1, 1,
0.3066796, 0.2146804, 2.145723, 1, 0, 0, 1, 1,
0.3067237, -1.468891, 2.321048, 1, 0, 0, 1, 1,
0.3085261, 0.641018, 0.8637428, 1, 0, 0, 1, 1,
0.3093133, 2.051141, -1.146423, 1, 0, 0, 1, 1,
0.311011, -0.2458409, 1.354583, 1, 0, 0, 1, 1,
0.3111906, -0.2234479, 2.849567, 0, 0, 0, 1, 1,
0.3113062, 0.09788112, 1.417314, 0, 0, 0, 1, 1,
0.312858, 0.5688449, -1.724936, 0, 0, 0, 1, 1,
0.3138869, -1.002991, 2.604859, 0, 0, 0, 1, 1,
0.3140637, -0.5508278, 2.174486, 0, 0, 0, 1, 1,
0.3200783, -0.702875, 2.53782, 0, 0, 0, 1, 1,
0.3202749, -0.2076698, 3.003731, 0, 0, 0, 1, 1,
0.3214796, -1.26389, 0.9843887, 1, 1, 1, 1, 1,
0.3227445, -0.901387, 2.349736, 1, 1, 1, 1, 1,
0.3237723, -1.263815, 1.742785, 1, 1, 1, 1, 1,
0.3239739, 0.117488, 1.289494, 1, 1, 1, 1, 1,
0.3261996, 0.2517025, 1.788981, 1, 1, 1, 1, 1,
0.3265324, -0.6329002, 3.050581, 1, 1, 1, 1, 1,
0.3277607, 1.519278, 1.823729, 1, 1, 1, 1, 1,
0.3297076, -1.307794, 3.117471, 1, 1, 1, 1, 1,
0.3322573, 0.3151934, 0.1411399, 1, 1, 1, 1, 1,
0.3325262, 0.4050513, 1.086056, 1, 1, 1, 1, 1,
0.3332491, 1.287516, -0.6378168, 1, 1, 1, 1, 1,
0.3337729, 0.2421749, 0.9303309, 1, 1, 1, 1, 1,
0.3342386, -1.04146, 0.745331, 1, 1, 1, 1, 1,
0.3415206, 0.0360997, 3.410745, 1, 1, 1, 1, 1,
0.3430042, 1.001213, 1.388497, 1, 1, 1, 1, 1,
0.3477609, -1.20191, 5.661866, 0, 0, 1, 1, 1,
0.3493513, -1.127946, 1.3337, 1, 0, 0, 1, 1,
0.3496919, -0.1764226, 1.650436, 1, 0, 0, 1, 1,
0.3513716, 0.1396081, 1.115243, 1, 0, 0, 1, 1,
0.3550231, 0.3107829, 0.189911, 1, 0, 0, 1, 1,
0.3580196, -0.2185077, 2.442482, 1, 0, 0, 1, 1,
0.361046, -0.3771143, 3.105893, 0, 0, 0, 1, 1,
0.3624121, -1.587321, 2.407315, 0, 0, 0, 1, 1,
0.3730112, 0.2685218, 0.9199899, 0, 0, 0, 1, 1,
0.3746659, -0.03129182, 0.9652063, 0, 0, 0, 1, 1,
0.3821072, 1.390228, 2.372741, 0, 0, 0, 1, 1,
0.3835739, 0.3317856, -0.7162961, 0, 0, 0, 1, 1,
0.386112, 0.126197, 2.042373, 0, 0, 0, 1, 1,
0.387383, 1.309669, -0.3200963, 1, 1, 1, 1, 1,
0.3900127, 1.490467, 0.07932893, 1, 1, 1, 1, 1,
0.3922959, -1.282042, 2.086668, 1, 1, 1, 1, 1,
0.3925015, 0.3133032, -0.2785636, 1, 1, 1, 1, 1,
0.3926551, 0.9988905, 0.2201539, 1, 1, 1, 1, 1,
0.3998177, 1.257616, 0.6301861, 1, 1, 1, 1, 1,
0.4013865, -1.373926, 3.019279, 1, 1, 1, 1, 1,
0.4027359, 0.9053472, 0.0681404, 1, 1, 1, 1, 1,
0.4030753, 0.145717, 1.074088, 1, 1, 1, 1, 1,
0.412207, 0.3589368, 2.935007, 1, 1, 1, 1, 1,
0.4125204, 0.8273664, -0.1463675, 1, 1, 1, 1, 1,
0.4211963, 0.3036959, 0.9693717, 1, 1, 1, 1, 1,
0.428696, 1.063527, -1.00849, 1, 1, 1, 1, 1,
0.428733, 1.099436, 1.466044, 1, 1, 1, 1, 1,
0.4310164, -0.1520113, 0.811442, 1, 1, 1, 1, 1,
0.4339719, 1.486101, -0.481871, 0, 0, 1, 1, 1,
0.4360026, -0.4049425, 1.580562, 1, 0, 0, 1, 1,
0.4384566, -0.6048831, 2.730415, 1, 0, 0, 1, 1,
0.4482813, 0.1507917, 1.165473, 1, 0, 0, 1, 1,
0.4501178, 0.4711251, 0.1862804, 1, 0, 0, 1, 1,
0.4537303, 1.675006, 0.9518793, 1, 0, 0, 1, 1,
0.4555346, -0.01034803, 0.01034654, 0, 0, 0, 1, 1,
0.4581424, -0.9370988, 1.887078, 0, 0, 0, 1, 1,
0.4582672, 1.258018, 0.4573789, 0, 0, 0, 1, 1,
0.4611222, -0.5428431, 5.373547, 0, 0, 0, 1, 1,
0.4657224, -1.418971, 3.98103, 0, 0, 0, 1, 1,
0.4694747, 2.075217, 0.2373771, 0, 0, 0, 1, 1,
0.4706946, -0.0267018, 1.717382, 0, 0, 0, 1, 1,
0.4714002, 1.340331, -0.148628, 1, 1, 1, 1, 1,
0.4784738, -0.7686874, 1.156248, 1, 1, 1, 1, 1,
0.4802782, -1.001867, 1.410539, 1, 1, 1, 1, 1,
0.4844285, 0.2661176, 2.824701, 1, 1, 1, 1, 1,
0.4912773, -1.182713, 2.474603, 1, 1, 1, 1, 1,
0.4946901, 0.1989646, 2.651177, 1, 1, 1, 1, 1,
0.4972023, 2.022163, 1.051773, 1, 1, 1, 1, 1,
0.4985711, -0.8813697, 1.365771, 1, 1, 1, 1, 1,
0.500489, -0.691894, 3.172619, 1, 1, 1, 1, 1,
0.5027459, 0.6496528, 0.990703, 1, 1, 1, 1, 1,
0.508174, -1.206206, 3.713038, 1, 1, 1, 1, 1,
0.5091883, -2.43431, 3.326982, 1, 1, 1, 1, 1,
0.5122158, -0.8279346, 1.972439, 1, 1, 1, 1, 1,
0.5131359, -0.3134016, 0.088246, 1, 1, 1, 1, 1,
0.5206487, -2.174947, 3.159541, 1, 1, 1, 1, 1,
0.5243483, -2.836987, 2.319196, 0, 0, 1, 1, 1,
0.5282221, 1.03166, 1.7893, 1, 0, 0, 1, 1,
0.5282364, -2.190868, 1.800324, 1, 0, 0, 1, 1,
0.5356963, 1.469833, 0.7187165, 1, 0, 0, 1, 1,
0.5384333, 0.8491962, -0.4954596, 1, 0, 0, 1, 1,
0.538438, -0.3615368, 2.695542, 1, 0, 0, 1, 1,
0.5417768, 0.5681893, 0.3429542, 0, 0, 0, 1, 1,
0.5433978, 1.438608, 0.2179184, 0, 0, 0, 1, 1,
0.5457027, -0.18017, 1.968297, 0, 0, 0, 1, 1,
0.5463808, -1.044729, 4.646291, 0, 0, 0, 1, 1,
0.5527663, 0.6303245, 2.22193, 0, 0, 0, 1, 1,
0.5540417, -0.1340214, 2.728929, 0, 0, 0, 1, 1,
0.5561239, 0.5300772, 0.1584877, 0, 0, 0, 1, 1,
0.5592984, -0.7366551, 1.592914, 1, 1, 1, 1, 1,
0.5593051, -0.5223138, 3.902568, 1, 1, 1, 1, 1,
0.5608599, 1.588088, 0.4486107, 1, 1, 1, 1, 1,
0.5629338, -0.8831295, 3.869298, 1, 1, 1, 1, 1,
0.5631375, -0.07644901, 2.221814, 1, 1, 1, 1, 1,
0.5659084, -0.5269828, 3.840682, 1, 1, 1, 1, 1,
0.5728357, 1.899398, 1.409174, 1, 1, 1, 1, 1,
0.574385, -0.7294394, 3.367592, 1, 1, 1, 1, 1,
0.5758079, -0.6967802, 3.52003, 1, 1, 1, 1, 1,
0.575853, -0.05924252, 0.7658049, 1, 1, 1, 1, 1,
0.5801839, 0.7234066, 0.8101839, 1, 1, 1, 1, 1,
0.5820696, 1.705635, 2.509674, 1, 1, 1, 1, 1,
0.5843211, 0.05186065, 1.534525, 1, 1, 1, 1, 1,
0.5852773, -0.1592137, 2.39712, 1, 1, 1, 1, 1,
0.5881856, 0.9960818, -0.4141065, 1, 1, 1, 1, 1,
0.5904601, 0.6037473, -0.1545595, 0, 0, 1, 1, 1,
0.5920618, -1.13629, 2.981273, 1, 0, 0, 1, 1,
0.5954607, 0.2887203, -0.3101763, 1, 0, 0, 1, 1,
0.5999189, 0.4058278, -0.7544366, 1, 0, 0, 1, 1,
0.602158, 1.235715, 0.7780262, 1, 0, 0, 1, 1,
0.6041563, -1.049753, 1.763499, 1, 0, 0, 1, 1,
0.6052657, -2.506502, 1.992519, 0, 0, 0, 1, 1,
0.6113151, -1.155425, 2.022603, 0, 0, 0, 1, 1,
0.6130762, 0.5372028, 2.351834, 0, 0, 0, 1, 1,
0.6167303, -0.5021242, 3.179376, 0, 0, 0, 1, 1,
0.6173428, -0.6741902, 2.298109, 0, 0, 0, 1, 1,
0.6183579, -0.774918, 1.302443, 0, 0, 0, 1, 1,
0.6186167, -1.209593, 1.964594, 0, 0, 0, 1, 1,
0.6210393, -1.047515, 3.761343, 1, 1, 1, 1, 1,
0.6247544, 0.2245077, 1.433927, 1, 1, 1, 1, 1,
0.6256743, 1.081859, 1.278272, 1, 1, 1, 1, 1,
0.6258345, 0.5774778, 1.536916, 1, 1, 1, 1, 1,
0.6296118, 0.4302067, -0.6867957, 1, 1, 1, 1, 1,
0.6378039, 0.8599463, -0.2705252, 1, 1, 1, 1, 1,
0.6383251, 0.4316535, 2.61295, 1, 1, 1, 1, 1,
0.6425641, 0.2934224, 1.544675, 1, 1, 1, 1, 1,
0.6432203, -0.9680996, 2.003671, 1, 1, 1, 1, 1,
0.6555383, -1.186885, 1.703469, 1, 1, 1, 1, 1,
0.6656659, 0.1327121, 2.01887, 1, 1, 1, 1, 1,
0.6698567, -0.1400167, 2.562019, 1, 1, 1, 1, 1,
0.6745348, -0.06218199, 0.1828388, 1, 1, 1, 1, 1,
0.6753352, -0.5811699, 0.6224363, 1, 1, 1, 1, 1,
0.6768789, 0.269106, 2.571352, 1, 1, 1, 1, 1,
0.6803043, -0.9747359, 0.3407434, 0, 0, 1, 1, 1,
0.6819817, 0.623578, -0.3275353, 1, 0, 0, 1, 1,
0.6834359, -0.2878725, 0.5593722, 1, 0, 0, 1, 1,
0.688974, -1.458366, 3.514734, 1, 0, 0, 1, 1,
0.6934355, -1.251156, 3.089573, 1, 0, 0, 1, 1,
0.6962479, -0.1245999, 3.760081, 1, 0, 0, 1, 1,
0.6972465, 0.2395103, 0.9079388, 0, 0, 0, 1, 1,
0.6994368, -0.4031525, 1.279203, 0, 0, 0, 1, 1,
0.7017382, -0.3846322, 3.004612, 0, 0, 0, 1, 1,
0.7022839, 0.1512343, 2.659434, 0, 0, 0, 1, 1,
0.7086763, 0.56836, -0.1546242, 0, 0, 0, 1, 1,
0.7178732, -0.5191806, 1.649934, 0, 0, 0, 1, 1,
0.727071, 0.5072914, 0.05492953, 0, 0, 0, 1, 1,
0.7280365, -0.2570081, 1.87386, 1, 1, 1, 1, 1,
0.7284992, -1.398691, 2.219417, 1, 1, 1, 1, 1,
0.7397995, 0.3510479, 2.608281, 1, 1, 1, 1, 1,
0.7437315, 2.196615, 0.7510852, 1, 1, 1, 1, 1,
0.756752, 1.258734, 0.2848816, 1, 1, 1, 1, 1,
0.7588435, -1.867429, 3.268801, 1, 1, 1, 1, 1,
0.7628377, 0.2896834, 1.725208, 1, 1, 1, 1, 1,
0.7656643, 0.5462545, 0.4114914, 1, 1, 1, 1, 1,
0.776212, 0.3656675, 0.1810662, 1, 1, 1, 1, 1,
0.7779594, 0.03327992, 1.602549, 1, 1, 1, 1, 1,
0.779448, 0.2045403, 1.036461, 1, 1, 1, 1, 1,
0.7799763, 0.6921003, 1.395987, 1, 1, 1, 1, 1,
0.7805547, -0.3618926, 2.750618, 1, 1, 1, 1, 1,
0.7830497, -0.5888362, 2.083634, 1, 1, 1, 1, 1,
0.7833768, 0.8449045, 2.203308, 1, 1, 1, 1, 1,
0.7868915, -0.640255, 2.414028, 0, 0, 1, 1, 1,
0.792003, 0.376268, 1.097914, 1, 0, 0, 1, 1,
0.7946008, -0.5961735, 3.902514, 1, 0, 0, 1, 1,
0.8011584, 1.184834, 1.088826, 1, 0, 0, 1, 1,
0.8126656, -1.979453, 1.686043, 1, 0, 0, 1, 1,
0.8159992, -1.212405, 2.974209, 1, 0, 0, 1, 1,
0.8273143, 0.37088, 2.140508, 0, 0, 0, 1, 1,
0.8332168, 0.5618809, 0.6185548, 0, 0, 0, 1, 1,
0.8380895, -2.411866, 3.441594, 0, 0, 0, 1, 1,
0.838997, 0.1735734, 0.5243104, 0, 0, 0, 1, 1,
0.8434016, -0.0725768, 1.629481, 0, 0, 0, 1, 1,
0.8535724, -0.5415284, 2.810525, 0, 0, 0, 1, 1,
0.8632434, -1.14292, 3.922921, 0, 0, 0, 1, 1,
0.8633977, 1.082603, -0.1179421, 1, 1, 1, 1, 1,
0.8703101, -0.02934893, 1.212258, 1, 1, 1, 1, 1,
0.8726422, 0.80716, -0.1566833, 1, 1, 1, 1, 1,
0.8729016, -1.186588, 3.12974, 1, 1, 1, 1, 1,
0.8742697, -0.09678884, 1.04881, 1, 1, 1, 1, 1,
0.8785061, 0.9673674, 0.2536411, 1, 1, 1, 1, 1,
0.8901809, -2.871886, 4.56583, 1, 1, 1, 1, 1,
0.8916579, -0.6197327, 2.495861, 1, 1, 1, 1, 1,
0.8920537, 1.082032, -1.443207, 1, 1, 1, 1, 1,
0.8956095, -1.419363, 2.079131, 1, 1, 1, 1, 1,
0.9040744, 0.7191606, 0.312454, 1, 1, 1, 1, 1,
0.9050181, 0.8613052, 0.9417081, 1, 1, 1, 1, 1,
0.9058079, 1.28234, 0.9269067, 1, 1, 1, 1, 1,
0.9098818, -1.888825, 3.558107, 1, 1, 1, 1, 1,
0.9103264, -2.007394, 3.749002, 1, 1, 1, 1, 1,
0.9110388, 1.038079, -0.7177156, 0, 0, 1, 1, 1,
0.912743, 2.305183, 0.9823551, 1, 0, 0, 1, 1,
0.9135082, -0.07323631, 0.7279323, 1, 0, 0, 1, 1,
0.9142831, 0.4418855, 0.3150583, 1, 0, 0, 1, 1,
0.9252949, -0.251119, 0.7462225, 1, 0, 0, 1, 1,
0.9344413, 0.4867376, 1.505355, 1, 0, 0, 1, 1,
0.9378094, -0.7591229, 2.365638, 0, 0, 0, 1, 1,
0.9382113, -0.05224387, 2.466525, 0, 0, 0, 1, 1,
0.9387559, -1.085465, 2.206219, 0, 0, 0, 1, 1,
0.9399885, -0.6622882, 1.769375, 0, 0, 0, 1, 1,
0.9411427, 1.83446, -0.1032291, 0, 0, 0, 1, 1,
0.9460484, 1.76246, 1.479188, 0, 0, 0, 1, 1,
0.954785, 2.920014, 0.572831, 0, 0, 0, 1, 1,
0.9569259, 1.908957, 1.010854, 1, 1, 1, 1, 1,
0.9597269, 0.8574546, -1.068315, 1, 1, 1, 1, 1,
0.9607856, -0.7538243, 2.035911, 1, 1, 1, 1, 1,
0.9610351, 2.046121, 1.204227, 1, 1, 1, 1, 1,
0.9610684, 0.4733844, 0.6151095, 1, 1, 1, 1, 1,
0.9661356, -1.532397, 3.096187, 1, 1, 1, 1, 1,
0.9667919, -1.384846, 0.924067, 1, 1, 1, 1, 1,
0.976054, -0.7567779, 2.656214, 1, 1, 1, 1, 1,
0.9778345, 0.353658, 0.2953526, 1, 1, 1, 1, 1,
0.9821751, -0.2278368, 1.91426, 1, 1, 1, 1, 1,
0.9843239, 2.310987, 0.5295593, 1, 1, 1, 1, 1,
0.9859974, 0.8704397, 0.1117545, 1, 1, 1, 1, 1,
0.9865804, 0.3865376, 2.701956, 1, 1, 1, 1, 1,
0.9896759, -0.619435, 2.673084, 1, 1, 1, 1, 1,
1.000656, -1.433607, 3.385506, 1, 1, 1, 1, 1,
1.003762, 1.150325, 1.387244, 0, 0, 1, 1, 1,
1.005345, -0.8135254, 2.699921, 1, 0, 0, 1, 1,
1.009763, -0.3745949, 3.204547, 1, 0, 0, 1, 1,
1.018026, -0.0775534, 0.6241822, 1, 0, 0, 1, 1,
1.021611, -0.06204022, 4.348828, 1, 0, 0, 1, 1,
1.027477, -1.345056, 0.8272946, 1, 0, 0, 1, 1,
1.029144, -0.5462765, 2.112556, 0, 0, 0, 1, 1,
1.033079, 1.273125, -0.5838712, 0, 0, 0, 1, 1,
1.038896, 0.5937902, 2.523859, 0, 0, 0, 1, 1,
1.039913, -1.117787, 3.751973, 0, 0, 0, 1, 1,
1.042196, -0.7419664, 1.155356, 0, 0, 0, 1, 1,
1.042984, -0.4105116, 1.734555, 0, 0, 0, 1, 1,
1.071075, -1.311972, 3.384006, 0, 0, 0, 1, 1,
1.075222, -0.1476994, 1.931766, 1, 1, 1, 1, 1,
1.078426, 1.11426, 0.7559952, 1, 1, 1, 1, 1,
1.081125, 0.3842265, 3.082962, 1, 1, 1, 1, 1,
1.081624, 0.398971, 2.657493, 1, 1, 1, 1, 1,
1.087504, 0.150574, 2.934851, 1, 1, 1, 1, 1,
1.091207, 1.189876, 0.3388474, 1, 1, 1, 1, 1,
1.092959, -1.845548, 2.932602, 1, 1, 1, 1, 1,
1.0993, 0.0831789, 2.221198, 1, 1, 1, 1, 1,
1.101608, 1.790914, 0.4447574, 1, 1, 1, 1, 1,
1.107126, -0.06362984, 1.350973, 1, 1, 1, 1, 1,
1.110369, 0.959527, 2.528269, 1, 1, 1, 1, 1,
1.112089, 0.3861696, 3.761868, 1, 1, 1, 1, 1,
1.113664, -0.802509, 1.757675, 1, 1, 1, 1, 1,
1.113741, -1.996854, 2.466508, 1, 1, 1, 1, 1,
1.116466, 0.1932419, 1.68805, 1, 1, 1, 1, 1,
1.135195, 1.046985, 0.7962685, 0, 0, 1, 1, 1,
1.13716, 0.1907422, 2.542552, 1, 0, 0, 1, 1,
1.139719, 0.38886, 2.669351, 1, 0, 0, 1, 1,
1.144274, 0.1535838, 1.021283, 1, 0, 0, 1, 1,
1.147939, 0.9441944, 1.580258, 1, 0, 0, 1, 1,
1.1483, -1.045581, 2.455672, 1, 0, 0, 1, 1,
1.150084, 0.3748986, 2.034146, 0, 0, 0, 1, 1,
1.153307, 1.082898, 0.1221141, 0, 0, 0, 1, 1,
1.171388, -0.1004361, 3.041145, 0, 0, 0, 1, 1,
1.17951, -0.7397671, 1.393897, 0, 0, 0, 1, 1,
1.181681, 0.003027473, 0.9141323, 0, 0, 0, 1, 1,
1.191094, 0.06380817, 0.06388984, 0, 0, 0, 1, 1,
1.20617, -0.03411058, 1.595521, 0, 0, 0, 1, 1,
1.206568, -0.8750736, 1.743958, 1, 1, 1, 1, 1,
1.209491, -1.493794, 2.34081, 1, 1, 1, 1, 1,
1.212599, 1.052586, -1.204163, 1, 1, 1, 1, 1,
1.214654, -0.4387551, 0.3136351, 1, 1, 1, 1, 1,
1.218789, -0.3933735, 1.084317, 1, 1, 1, 1, 1,
1.226612, -1.146665, 3.678433, 1, 1, 1, 1, 1,
1.226835, 0.51246, 0.6266382, 1, 1, 1, 1, 1,
1.22965, -0.4511196, 2.312296, 1, 1, 1, 1, 1,
1.231004, 0.5123717, 2.425711, 1, 1, 1, 1, 1,
1.254048, 0.9965206, 0.6703839, 1, 1, 1, 1, 1,
1.259093, -0.07275914, 1.830601, 1, 1, 1, 1, 1,
1.260807, 0.8238081, 0.3539053, 1, 1, 1, 1, 1,
1.272682, 0.75606, 1.06715, 1, 1, 1, 1, 1,
1.273925, 1.230589, 1.193945, 1, 1, 1, 1, 1,
1.275777, -0.004421032, 1.219811, 1, 1, 1, 1, 1,
1.283461, -1.033046, 3.575453, 0, 0, 1, 1, 1,
1.287905, -1.660348, 3.363734, 1, 0, 0, 1, 1,
1.290362, -1.353049, 2.170852, 1, 0, 0, 1, 1,
1.292043, -2.394882, 3.345543, 1, 0, 0, 1, 1,
1.293309, -0.8251674, 3.49773, 1, 0, 0, 1, 1,
1.294739, 0.2514691, 2.610059, 1, 0, 0, 1, 1,
1.301298, -0.1834273, 1.677945, 0, 0, 0, 1, 1,
1.302851, 0.01487852, 0.2135205, 0, 0, 0, 1, 1,
1.305236, -2.178958, 2.06434, 0, 0, 0, 1, 1,
1.3057, 0.1030147, 2.391782, 0, 0, 0, 1, 1,
1.314668, -1.155904, 1.950398, 0, 0, 0, 1, 1,
1.320253, 1.706346, 0.8575065, 0, 0, 0, 1, 1,
1.324562, 0.9188964, 0.619651, 0, 0, 0, 1, 1,
1.327876, -0.3674359, 1.395597, 1, 1, 1, 1, 1,
1.336315, 1.849981, 1.397024, 1, 1, 1, 1, 1,
1.35112, 1.246755, 0.3189155, 1, 1, 1, 1, 1,
1.355397, 1.071967, -0.1459573, 1, 1, 1, 1, 1,
1.358617, 0.3653726, 0.2547163, 1, 1, 1, 1, 1,
1.361476, -0.4926759, 1.542482, 1, 1, 1, 1, 1,
1.361665, -0.2745786, 1.084171, 1, 1, 1, 1, 1,
1.369854, 0.3317663, 0.9262804, 1, 1, 1, 1, 1,
1.37042, 1.36119, 2.06827, 1, 1, 1, 1, 1,
1.370835, -0.5408957, 1.154683, 1, 1, 1, 1, 1,
1.371228, -0.3597691, -0.08596468, 1, 1, 1, 1, 1,
1.405074, -0.8310995, 1.453494, 1, 1, 1, 1, 1,
1.406595, 0.177733, 1.748046, 1, 1, 1, 1, 1,
1.408314, -0.6915362, 2.551989, 1, 1, 1, 1, 1,
1.41248, 0.3431349, 2.30451, 1, 1, 1, 1, 1,
1.412697, -0.03876598, 1.733367, 0, 0, 1, 1, 1,
1.414302, -0.3048291, 2.442375, 1, 0, 0, 1, 1,
1.422458, 0.1426092, 2.521246, 1, 0, 0, 1, 1,
1.426961, 0.6392509, 1.289113, 1, 0, 0, 1, 1,
1.433215, -1.583922, -0.5140423, 1, 0, 0, 1, 1,
1.44513, -1.503816, 3.275711, 1, 0, 0, 1, 1,
1.453941, -0.542417, 2.728827, 0, 0, 0, 1, 1,
1.454475, -1.253536, 2.712677, 0, 0, 0, 1, 1,
1.464032, 0.2917807, 0.1028787, 0, 0, 0, 1, 1,
1.464257, 0.3278939, 0.8992613, 0, 0, 0, 1, 1,
1.470957, -1.180708, 3.113707, 0, 0, 0, 1, 1,
1.476969, -0.4798634, 1.998924, 0, 0, 0, 1, 1,
1.490149, 0.5932235, -1.774722, 0, 0, 0, 1, 1,
1.494445, -0.9949251, 3.789042, 1, 1, 1, 1, 1,
1.501516, -1.239959, 2.394802, 1, 1, 1, 1, 1,
1.507923, 0.04552694, -0.2310011, 1, 1, 1, 1, 1,
1.511513, 1.057992, 1.034572, 1, 1, 1, 1, 1,
1.516438, -0.409866, 1.451749, 1, 1, 1, 1, 1,
1.529105, -1.173674, 3.091668, 1, 1, 1, 1, 1,
1.544382, 1.903766, 0.9041877, 1, 1, 1, 1, 1,
1.548799, -2.930479, 1.747753, 1, 1, 1, 1, 1,
1.54882, -2.159988, 1.697055, 1, 1, 1, 1, 1,
1.556608, -1.142432, 0.7312446, 1, 1, 1, 1, 1,
1.570813, -0.9834265, 3.47963, 1, 1, 1, 1, 1,
1.579879, 1.388434, 1.795756, 1, 1, 1, 1, 1,
1.583292, 0.03347405, 2.441535, 1, 1, 1, 1, 1,
1.590698, 2.755362, -0.003851816, 1, 1, 1, 1, 1,
1.600119, 1.285982, 2.927282, 1, 1, 1, 1, 1,
1.630581, 0.7168716, -0.03542305, 0, 0, 1, 1, 1,
1.633902, 0.4583419, 0.4206577, 1, 0, 0, 1, 1,
1.637139, -0.4157434, 0.4092138, 1, 0, 0, 1, 1,
1.646126, 0.6015719, 2.213349, 1, 0, 0, 1, 1,
1.669045, 0.01046873, 1.516679, 1, 0, 0, 1, 1,
1.67136, -0.9222944, 1.488723, 1, 0, 0, 1, 1,
1.678709, -0.3935104, 2.92732, 0, 0, 0, 1, 1,
1.696147, -1.292166, 0.6582401, 0, 0, 0, 1, 1,
1.740392, 0.463641, 1.881529, 0, 0, 0, 1, 1,
1.74094, 0.5460691, 1.079472, 0, 0, 0, 1, 1,
1.758591, -0.1016972, 3.928268, 0, 0, 0, 1, 1,
1.786964, 1.62569, 1.77234, 0, 0, 0, 1, 1,
1.790108, -0.8156759, 1.324547, 0, 0, 0, 1, 1,
1.790606, -1.966606, 2.891773, 1, 1, 1, 1, 1,
1.816623, 1.07646, 0.0599485, 1, 1, 1, 1, 1,
1.835647, 1.553074, -1.297129, 1, 1, 1, 1, 1,
1.845398, -0.2394234, 3.837865, 1, 1, 1, 1, 1,
1.851932, -0.8421177, 2.918669, 1, 1, 1, 1, 1,
1.91559, -0.5350406, 1.924751, 1, 1, 1, 1, 1,
1.916773, 0.8461086, 0.9359097, 1, 1, 1, 1, 1,
1.935602, 0.0790632, 1.60536, 1, 1, 1, 1, 1,
1.959027, -0.756138, 2.735686, 1, 1, 1, 1, 1,
1.959501, -1.385301, 3.320093, 1, 1, 1, 1, 1,
1.960734, -0.9264664, 0.6675279, 1, 1, 1, 1, 1,
1.977392, 1.109844, 1.20214, 1, 1, 1, 1, 1,
1.998802, 0.1283355, 3.230681, 1, 1, 1, 1, 1,
2.011923, 0.1002088, 0.3139562, 1, 1, 1, 1, 1,
2.13601, 0.3500242, 3.391892, 1, 1, 1, 1, 1,
2.142052, -1.376853, 3.685645, 0, 0, 1, 1, 1,
2.154927, 0.6610327, -0.3420608, 1, 0, 0, 1, 1,
2.194909, 0.7216043, 3.605963, 1, 0, 0, 1, 1,
2.207591, 1.512951, 0.1742417, 1, 0, 0, 1, 1,
2.334594, 1.6729, 1.088063, 1, 0, 0, 1, 1,
2.334932, -1.141506, 2.782094, 1, 0, 0, 1, 1,
2.339242, 2.065931, 0.4721774, 0, 0, 0, 1, 1,
2.414206, -0.7566265, 2.738163, 0, 0, 0, 1, 1,
2.428568, -0.1982134, 3.700234, 0, 0, 0, 1, 1,
2.46885, -0.4033794, 2.044434, 0, 0, 0, 1, 1,
2.572536, -0.9161569, 1.953032, 0, 0, 0, 1, 1,
2.579498, -0.6787061, 0.1559493, 0, 0, 0, 1, 1,
2.590919, 1.988153, 2.525679, 0, 0, 0, 1, 1,
2.618536, -0.9901504, 2.146792, 1, 1, 1, 1, 1,
2.626686, 3.101355, 0.4636201, 1, 1, 1, 1, 1,
2.637508, 0.01643932, 2.896551, 1, 1, 1, 1, 1,
2.969909, 1.163385, 1.153732, 1, 1, 1, 1, 1,
3.425706, -0.9570386, 2.426568, 1, 1, 1, 1, 1,
3.462705, -0.05470699, 0.4656519, 1, 1, 1, 1, 1,
3.463839, 1.215743, 2.061337, 1, 1, 1, 1, 1
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
var radius = 9.630082;
var distance = 33.82525;
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
mvMatrix.translate( -0.08043671, -0.09225059, -0.2394974 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.82525);
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