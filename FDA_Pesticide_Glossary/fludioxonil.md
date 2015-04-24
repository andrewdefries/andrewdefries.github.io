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
-4.143155, -0.5053173, -2.082713, 1, 0, 0, 1,
-3.04179, 0.8090151, -1.726714, 1, 0.007843138, 0, 1,
-2.69558, -0.6311914, -1.614853, 1, 0.01176471, 0, 1,
-2.690701, 0.8639014, -2.080236, 1, 0.01960784, 0, 1,
-2.64542, -1.177658, -2.878843, 1, 0.02352941, 0, 1,
-2.591938, -0.2925069, -0.2756317, 1, 0.03137255, 0, 1,
-2.558341, 1.589448, -1.1193, 1, 0.03529412, 0, 1,
-2.471884, 0.7794995, -1.705442, 1, 0.04313726, 0, 1,
-2.381821, -1.061541, -2.152227, 1, 0.04705882, 0, 1,
-2.35497, 0.476037, 0.2762068, 1, 0.05490196, 0, 1,
-2.324218, 0.4602997, -0.9533069, 1, 0.05882353, 0, 1,
-2.244958, 0.0678078, -0.09236015, 1, 0.06666667, 0, 1,
-2.231954, -0.2428603, -1.418726, 1, 0.07058824, 0, 1,
-2.098903, 1.847623, -1.026056, 1, 0.07843138, 0, 1,
-2.040032, -1.224973, -2.18256, 1, 0.08235294, 0, 1,
-2.033165, -1.066797, -1.193842, 1, 0.09019608, 0, 1,
-2.012607, -1.089581, -2.753741, 1, 0.09411765, 0, 1,
-2.012508, -0.8705752, -2.142557, 1, 0.1019608, 0, 1,
-2.009495, 0.2114682, -0.4827408, 1, 0.1098039, 0, 1,
-1.974001, 0.4888229, -2.458676, 1, 0.1137255, 0, 1,
-1.972079, 0.3218382, -1.240551, 1, 0.1215686, 0, 1,
-1.961797, 0.05487548, -2.31548, 1, 0.1254902, 0, 1,
-1.959265, -0.617326, -1.803842, 1, 0.1333333, 0, 1,
-1.933029, -1.217989, -0.1623664, 1, 0.1372549, 0, 1,
-1.874062, 1.243436, 0.1494547, 1, 0.145098, 0, 1,
-1.867966, 0.8682232, -1.732083, 1, 0.1490196, 0, 1,
-1.863356, -0.6161451, -2.569743, 1, 0.1568628, 0, 1,
-1.860512, -1.061889, -1.770768, 1, 0.1607843, 0, 1,
-1.853637, 1.544207, -0.4888364, 1, 0.1686275, 0, 1,
-1.839541, -0.4613963, -2.036437, 1, 0.172549, 0, 1,
-1.817107, 1.206904, -0.8112444, 1, 0.1803922, 0, 1,
-1.800659, 1.508767, -2.258798, 1, 0.1843137, 0, 1,
-1.785319, 0.4722456, -0.8840476, 1, 0.1921569, 0, 1,
-1.777128, 2.239504, 0.0110649, 1, 0.1960784, 0, 1,
-1.771585, 0.5776857, -1.872283, 1, 0.2039216, 0, 1,
-1.769112, 1.444933, -0.04867524, 1, 0.2117647, 0, 1,
-1.747224, 0.004653232, -1.519273, 1, 0.2156863, 0, 1,
-1.736375, -0.4023235, -0.3431785, 1, 0.2235294, 0, 1,
-1.708629, -0.01560928, -1.317978, 1, 0.227451, 0, 1,
-1.697286, 1.27434, -0.9784312, 1, 0.2352941, 0, 1,
-1.673888, 1.096697, -0.3756548, 1, 0.2392157, 0, 1,
-1.656328, 1.027046, -2.281208, 1, 0.2470588, 0, 1,
-1.641384, 1.56787, 0.4869059, 1, 0.2509804, 0, 1,
-1.629243, 0.1210033, -1.194435, 1, 0.2588235, 0, 1,
-1.628799, 0.2953917, -0.8846179, 1, 0.2627451, 0, 1,
-1.618645, -1.042949, -1.328873, 1, 0.2705882, 0, 1,
-1.611004, 0.2368685, -1.096346, 1, 0.2745098, 0, 1,
-1.593911, -0.1409243, -2.454311, 1, 0.282353, 0, 1,
-1.59334, 0.6040182, -1.251288, 1, 0.2862745, 0, 1,
-1.58094, -0.1514393, -0.08426155, 1, 0.2941177, 0, 1,
-1.558041, 0.2141308, -2.016677, 1, 0.3019608, 0, 1,
-1.551851, -1.403104, -3.204353, 1, 0.3058824, 0, 1,
-1.541878, -1.106708, -2.887989, 1, 0.3137255, 0, 1,
-1.536332, 0.6642488, 0.09103931, 1, 0.3176471, 0, 1,
-1.534632, 0.00870094, -4.779844, 1, 0.3254902, 0, 1,
-1.531709, -0.06471141, -2.845498, 1, 0.3294118, 0, 1,
-1.528945, 1.379469, -0.585822, 1, 0.3372549, 0, 1,
-1.524741, 0.6017903, 1.392176, 1, 0.3411765, 0, 1,
-1.520982, -0.3940271, -3.105274, 1, 0.3490196, 0, 1,
-1.517588, 0.05930119, -2.11531, 1, 0.3529412, 0, 1,
-1.51479, 0.2387112, -0.5628763, 1, 0.3607843, 0, 1,
-1.514365, -0.7057994, -1.959638, 1, 0.3647059, 0, 1,
-1.505511, -0.0766366, -2.409456, 1, 0.372549, 0, 1,
-1.502679, -1.782778, -1.452112, 1, 0.3764706, 0, 1,
-1.501768, -0.6257963, -0.9512333, 1, 0.3843137, 0, 1,
-1.501422, 0.357585, -0.4926051, 1, 0.3882353, 0, 1,
-1.496927, 0.8497036, -0.4913425, 1, 0.3960784, 0, 1,
-1.475498, -1.74023, -1.918907, 1, 0.4039216, 0, 1,
-1.472355, 0.8156845, -1.382859, 1, 0.4078431, 0, 1,
-1.463128, 0.8184217, -0.7230827, 1, 0.4156863, 0, 1,
-1.451339, 0.4570315, -1.583582, 1, 0.4196078, 0, 1,
-1.437886, 0.6929725, -2.001169, 1, 0.427451, 0, 1,
-1.436731, -0.7224113, -2.633435, 1, 0.4313726, 0, 1,
-1.43118, 0.1525896, -1.50063, 1, 0.4392157, 0, 1,
-1.41425, 0.02410934, -1.519881, 1, 0.4431373, 0, 1,
-1.412509, -0.7738317, -2.060264, 1, 0.4509804, 0, 1,
-1.409247, 1.590964, -0.02884044, 1, 0.454902, 0, 1,
-1.405419, 0.7752467, -1.013518, 1, 0.4627451, 0, 1,
-1.403986, 1.003738, 0.0902609, 1, 0.4666667, 0, 1,
-1.391412, -0.3289948, -2.219948, 1, 0.4745098, 0, 1,
-1.390087, 1.572191, -0.7610871, 1, 0.4784314, 0, 1,
-1.389778, 0.05831067, -2.853082, 1, 0.4862745, 0, 1,
-1.383493, -0.5212733, -2.719205, 1, 0.4901961, 0, 1,
-1.375096, -0.05483864, -0.6918311, 1, 0.4980392, 0, 1,
-1.369256, 0.4910696, -1.591781, 1, 0.5058824, 0, 1,
-1.368732, -0.484109, -0.5565051, 1, 0.509804, 0, 1,
-1.363765, 1.036927, -1.848866, 1, 0.5176471, 0, 1,
-1.334104, -0.1969004, -0.7772949, 1, 0.5215687, 0, 1,
-1.31943, 0.1685242, -0.6529363, 1, 0.5294118, 0, 1,
-1.316128, -0.008838207, -2.16897, 1, 0.5333334, 0, 1,
-1.315606, -0.7559348, -2.820104, 1, 0.5411765, 0, 1,
-1.306258, 1.967766, 0.4606211, 1, 0.5450981, 0, 1,
-1.302632, -0.536293, -2.403482, 1, 0.5529412, 0, 1,
-1.297371, 1.324126, -0.5514134, 1, 0.5568628, 0, 1,
-1.296634, -0.5274919, -1.021093, 1, 0.5647059, 0, 1,
-1.296464, -1.338179, -2.283874, 1, 0.5686275, 0, 1,
-1.291133, 0.1379235, -2.962408, 1, 0.5764706, 0, 1,
-1.289113, -0.5636461, -2.648105, 1, 0.5803922, 0, 1,
-1.28498, 0.7792599, -1.131919, 1, 0.5882353, 0, 1,
-1.28105, -0.2180935, -2.223321, 1, 0.5921569, 0, 1,
-1.279578, 0.09234215, -1.914656, 1, 0.6, 0, 1,
-1.272992, 0.3834715, -1.320237, 1, 0.6078432, 0, 1,
-1.267105, -0.5926211, -2.637486, 1, 0.6117647, 0, 1,
-1.248158, 0.5931912, -1.042292, 1, 0.6196079, 0, 1,
-1.237341, 0.5432914, -1.381396, 1, 0.6235294, 0, 1,
-1.229846, -1.628727, -3.524375, 1, 0.6313726, 0, 1,
-1.22491, 0.1023581, -2.309972, 1, 0.6352941, 0, 1,
-1.224809, -1.711246, -3.482824, 1, 0.6431373, 0, 1,
-1.221925, -0.7513331, -0.1037454, 1, 0.6470588, 0, 1,
-1.220866, -0.5344342, -1.612338, 1, 0.654902, 0, 1,
-1.210153, 1.157011, -0.3546042, 1, 0.6588235, 0, 1,
-1.20844, -2.102014, -2.060958, 1, 0.6666667, 0, 1,
-1.208081, 0.1026101, -1.047711, 1, 0.6705883, 0, 1,
-1.198818, -0.5744148, -1.893898, 1, 0.6784314, 0, 1,
-1.198374, -0.02318054, -0.395075, 1, 0.682353, 0, 1,
-1.196585, 0.6250075, 0.9504945, 1, 0.6901961, 0, 1,
-1.190983, -0.2631944, -3.169323, 1, 0.6941177, 0, 1,
-1.183241, 0.8353524, -1.82998, 1, 0.7019608, 0, 1,
-1.181778, 0.4928972, -1.610298, 1, 0.7098039, 0, 1,
-1.179857, 0.4582152, 0.4778011, 1, 0.7137255, 0, 1,
-1.179274, -0.6301724, -2.559772, 1, 0.7215686, 0, 1,
-1.175238, -1.867801, -2.750823, 1, 0.7254902, 0, 1,
-1.172674, 0.7019933, -1.085459, 1, 0.7333333, 0, 1,
-1.167429, -0.09542397, -2.812975, 1, 0.7372549, 0, 1,
-1.162262, 1.549947, -1.061417, 1, 0.7450981, 0, 1,
-1.157813, -0.7715303, -1.506046, 1, 0.7490196, 0, 1,
-1.155306, -0.7913112, -2.759135, 1, 0.7568628, 0, 1,
-1.143551, -1.235886, -3.628369, 1, 0.7607843, 0, 1,
-1.141774, 0.4169714, -0.08503579, 1, 0.7686275, 0, 1,
-1.137936, 0.1166344, -1.919574, 1, 0.772549, 0, 1,
-1.129664, -1.138568, -1.929709, 1, 0.7803922, 0, 1,
-1.128764, 0.692768, -1.079071, 1, 0.7843137, 0, 1,
-1.120669, 2.366029, -0.1059993, 1, 0.7921569, 0, 1,
-1.116689, 0.6088129, -2.439109, 1, 0.7960784, 0, 1,
-1.113828, -0.7964854, -2.952092, 1, 0.8039216, 0, 1,
-1.113695, 0.9163936, -2.033741, 1, 0.8117647, 0, 1,
-1.112208, 0.1151812, -1.496802, 1, 0.8156863, 0, 1,
-1.109132, -2.774289, -3.634616, 1, 0.8235294, 0, 1,
-1.107512, -0.4884363, -2.313795, 1, 0.827451, 0, 1,
-1.10458, 0.1605647, -3.075685, 1, 0.8352941, 0, 1,
-1.104022, -0.819377, -1.885287, 1, 0.8392157, 0, 1,
-1.102019, -2.110035, -1.392771, 1, 0.8470588, 0, 1,
-1.097564, 1.338417, 0.3565416, 1, 0.8509804, 0, 1,
-1.088204, 1.452624, 0.7532365, 1, 0.8588235, 0, 1,
-1.081409, -0.5171844, -0.9378242, 1, 0.8627451, 0, 1,
-1.061051, -3.056907, -3.67567, 1, 0.8705882, 0, 1,
-1.05572, -0.07639461, -1.012151, 1, 0.8745098, 0, 1,
-1.048801, 0.9152969, -0.9450753, 1, 0.8823529, 0, 1,
-1.045183, 1.130809, 0.5649327, 1, 0.8862745, 0, 1,
-1.040559, -0.2896565, -1.311382, 1, 0.8941177, 0, 1,
-1.039008, 0.454058, -1.230101, 1, 0.8980392, 0, 1,
-1.035277, 0.7355609, 0.1360552, 1, 0.9058824, 0, 1,
-1.024019, -0.07446793, -2.935551, 1, 0.9137255, 0, 1,
-1.019243, -0.3762478, -1.527621, 1, 0.9176471, 0, 1,
-1.018894, -0.4389192, -2.143867, 1, 0.9254902, 0, 1,
-1.018424, -0.02057818, -1.191145, 1, 0.9294118, 0, 1,
-1.013798, -1.416916, -1.344091, 1, 0.9372549, 0, 1,
-1.008365, 0.02321807, -0.5209498, 1, 0.9411765, 0, 1,
-1.005904, 0.452477, -1.694168, 1, 0.9490196, 0, 1,
-1.002449, -1.016633, -3.284865, 1, 0.9529412, 0, 1,
-0.9952124, -1.452499, -2.477228, 1, 0.9607843, 0, 1,
-0.9905685, 1.293921, -0.03093517, 1, 0.9647059, 0, 1,
-0.9880829, -1.593941, -0.8683358, 1, 0.972549, 0, 1,
-0.9786108, -1.47002, -2.5533, 1, 0.9764706, 0, 1,
-0.9711292, 0.0398355, -0.9535304, 1, 0.9843137, 0, 1,
-0.9594179, -0.2850319, -2.933585, 1, 0.9882353, 0, 1,
-0.9571092, -1.088488, -1.575016, 1, 0.9960784, 0, 1,
-0.9509634, -1.841916, -0.6798372, 0.9960784, 1, 0, 1,
-0.9506133, 0.6583821, -1.464429, 0.9921569, 1, 0, 1,
-0.9492875, -0.2834978, -0.2958341, 0.9843137, 1, 0, 1,
-0.9458346, 0.3064827, -0.652115, 0.9803922, 1, 0, 1,
-0.9387733, 0.207103, -0.6589521, 0.972549, 1, 0, 1,
-0.9260314, 0.2238521, -1.978776, 0.9686275, 1, 0, 1,
-0.9232706, -0.1423742, -2.419721, 0.9607843, 1, 0, 1,
-0.9200898, -0.2978779, -1.767141, 0.9568627, 1, 0, 1,
-0.912025, 0.0819603, -1.235562, 0.9490196, 1, 0, 1,
-0.911966, 2.266896, -1.42587, 0.945098, 1, 0, 1,
-0.9087282, -0.4755294, -0.4363745, 0.9372549, 1, 0, 1,
-0.9073392, -0.1278452, -0.4450732, 0.9333333, 1, 0, 1,
-0.9024883, -0.1584748, -2.000115, 0.9254902, 1, 0, 1,
-0.9019046, 2.231309, -0.9834283, 0.9215686, 1, 0, 1,
-0.9018436, 0.4239754, -0.9908177, 0.9137255, 1, 0, 1,
-0.9016514, -0.6298423, -1.353697, 0.9098039, 1, 0, 1,
-0.9005641, 1.420019, -1.120787, 0.9019608, 1, 0, 1,
-0.8934764, -0.5828563, -3.681371, 0.8941177, 1, 0, 1,
-0.8846521, -0.4492681, -2.070976, 0.8901961, 1, 0, 1,
-0.8784816, -1.230524, -1.042826, 0.8823529, 1, 0, 1,
-0.8757464, 0.752834, -0.647285, 0.8784314, 1, 0, 1,
-0.8747454, 0.1376326, -0.9966794, 0.8705882, 1, 0, 1,
-0.8725326, -0.4074088, -1.672386, 0.8666667, 1, 0, 1,
-0.8719898, -1.083336, -2.529168, 0.8588235, 1, 0, 1,
-0.8635569, -1.09726, -2.822007, 0.854902, 1, 0, 1,
-0.8625589, -1.534204, -4.316924, 0.8470588, 1, 0, 1,
-0.8592477, -0.2356285, -1.439217, 0.8431373, 1, 0, 1,
-0.8584235, -2.334291, -2.638913, 0.8352941, 1, 0, 1,
-0.8546734, 2.492152, 0.8037115, 0.8313726, 1, 0, 1,
-0.8339106, 0.2088386, -0.942584, 0.8235294, 1, 0, 1,
-0.8330467, -0.4596889, -2.387982, 0.8196079, 1, 0, 1,
-0.8330271, 1.300443, -1.563945, 0.8117647, 1, 0, 1,
-0.829291, 0.9561398, -0.5151972, 0.8078431, 1, 0, 1,
-0.820513, 0.6416662, 0.4004565, 0.8, 1, 0, 1,
-0.8180877, 0.02070375, -1.780905, 0.7921569, 1, 0, 1,
-0.8152725, 0.7314907, -0.8992687, 0.7882353, 1, 0, 1,
-0.8145095, -1.031097, -2.412681, 0.7803922, 1, 0, 1,
-0.8143811, -1.018031, -2.873331, 0.7764706, 1, 0, 1,
-0.8123628, -0.374441, -0.830492, 0.7686275, 1, 0, 1,
-0.8058034, -0.4836357, -3.163547, 0.7647059, 1, 0, 1,
-0.8020781, 0.1425841, -1.09922, 0.7568628, 1, 0, 1,
-0.7975037, -0.3781908, -2.136525, 0.7529412, 1, 0, 1,
-0.7960308, -0.9754674, -2.058906, 0.7450981, 1, 0, 1,
-0.7893663, -0.970205, -2.737217, 0.7411765, 1, 0, 1,
-0.7866677, 1.134553, 1.24024, 0.7333333, 1, 0, 1,
-0.7839454, 0.957969, -1.948265, 0.7294118, 1, 0, 1,
-0.7781532, -0.8992401, -2.156028, 0.7215686, 1, 0, 1,
-0.7731423, 2.01276, -1.193714, 0.7176471, 1, 0, 1,
-0.7679396, -0.313293, -0.961886, 0.7098039, 1, 0, 1,
-0.7654968, 0.346742, 0.6703572, 0.7058824, 1, 0, 1,
-0.7625591, 1.629369, 0.4801738, 0.6980392, 1, 0, 1,
-0.7578021, 1.049525, -0.3276876, 0.6901961, 1, 0, 1,
-0.7540209, 0.6246117, -0.9787512, 0.6862745, 1, 0, 1,
-0.753748, 0.795436, -0.8566702, 0.6784314, 1, 0, 1,
-0.7463635, 0.028203, -0.09584279, 0.6745098, 1, 0, 1,
-0.7457358, -0.7029045, -4.157064, 0.6666667, 1, 0, 1,
-0.7454674, 1.182078, -1.659827, 0.6627451, 1, 0, 1,
-0.7415618, 0.8188498, -0.1429823, 0.654902, 1, 0, 1,
-0.7400216, 0.05347373, -1.387936, 0.6509804, 1, 0, 1,
-0.7369627, -0.3431289, -1.434685, 0.6431373, 1, 0, 1,
-0.7342045, 0.7818219, -0.6080298, 0.6392157, 1, 0, 1,
-0.7322852, -0.8994073, -1.119556, 0.6313726, 1, 0, 1,
-0.7226582, -0.02928435, -2.167866, 0.627451, 1, 0, 1,
-0.722146, 1.023929, -0.9986224, 0.6196079, 1, 0, 1,
-0.7214532, 1.075004, 0.4403547, 0.6156863, 1, 0, 1,
-0.7197368, -0.5476905, -1.315035, 0.6078432, 1, 0, 1,
-0.7191945, -1.069626, -1.644599, 0.6039216, 1, 0, 1,
-0.7183796, -1.327885, -0.1320518, 0.5960785, 1, 0, 1,
-0.7176271, -1.2728, -1.879122, 0.5882353, 1, 0, 1,
-0.716183, 0.6378107, 0.138876, 0.5843138, 1, 0, 1,
-0.7151127, -0.3368768, 0.08204997, 0.5764706, 1, 0, 1,
-0.7126178, -0.385603, 0.1841204, 0.572549, 1, 0, 1,
-0.7120215, -0.677158, -0.8586977, 0.5647059, 1, 0, 1,
-0.7080237, 2.999273, -0.8172308, 0.5607843, 1, 0, 1,
-0.6993107, -0.05629827, -0.9253711, 0.5529412, 1, 0, 1,
-0.6972879, 0.70499, -1.161816, 0.5490196, 1, 0, 1,
-0.6962005, 0.3258441, 0.167808, 0.5411765, 1, 0, 1,
-0.6879099, -0.3376433, -1.561564, 0.5372549, 1, 0, 1,
-0.6857176, 1.045517, 0.6145735, 0.5294118, 1, 0, 1,
-0.6846625, 1.268436, -2.629255, 0.5254902, 1, 0, 1,
-0.6834808, -0.7764891, -1.546464, 0.5176471, 1, 0, 1,
-0.6794275, 0.9830083, 0.8102515, 0.5137255, 1, 0, 1,
-0.6737628, -0.7085922, -0.9063906, 0.5058824, 1, 0, 1,
-0.6714458, -1.294735, -2.944246, 0.5019608, 1, 0, 1,
-0.6661257, 0.1262305, -1.724668, 0.4941176, 1, 0, 1,
-0.6602463, 0.1424644, -1.745839, 0.4862745, 1, 0, 1,
-0.6599784, -0.3909334, -1.770016, 0.4823529, 1, 0, 1,
-0.6575026, -0.1858322, -1.916017, 0.4745098, 1, 0, 1,
-0.6527331, -1.982116, -5.395905, 0.4705882, 1, 0, 1,
-0.65226, -0.9520333, -2.085827, 0.4627451, 1, 0, 1,
-0.6505314, 1.578953, 0.2021491, 0.4588235, 1, 0, 1,
-0.6457744, -0.3957318, -1.981325, 0.4509804, 1, 0, 1,
-0.6443993, -1.763321, -3.844388, 0.4470588, 1, 0, 1,
-0.6384316, -0.2513286, -2.833996, 0.4392157, 1, 0, 1,
-0.634685, 1.228531, 0.1504711, 0.4352941, 1, 0, 1,
-0.6243665, -0.3514218, -3.039871, 0.427451, 1, 0, 1,
-0.6242188, -0.5080576, -4.422793, 0.4235294, 1, 0, 1,
-0.6210884, 0.9702367, -1.989855, 0.4156863, 1, 0, 1,
-0.6138359, 0.3002013, -3.363599, 0.4117647, 1, 0, 1,
-0.5966203, -1.146805, -3.278635, 0.4039216, 1, 0, 1,
-0.5939075, -0.3896927, -2.25269, 0.3960784, 1, 0, 1,
-0.5907351, 0.4453295, -0.7661255, 0.3921569, 1, 0, 1,
-0.590703, -0.1857125, -1.690433, 0.3843137, 1, 0, 1,
-0.5893858, 1.043728, -1.422447, 0.3803922, 1, 0, 1,
-0.5864531, -0.08391046, -1.204111, 0.372549, 1, 0, 1,
-0.5854478, 0.08526535, -1.182053, 0.3686275, 1, 0, 1,
-0.583546, 1.31669, 0.06779189, 0.3607843, 1, 0, 1,
-0.5831473, 0.1648991, -1.42231, 0.3568628, 1, 0, 1,
-0.5817063, 0.9063286, -1.832936, 0.3490196, 1, 0, 1,
-0.5790947, -0.07183424, -2.295197, 0.345098, 1, 0, 1,
-0.5758743, 0.06837279, -4.153799, 0.3372549, 1, 0, 1,
-0.5733655, -0.6738593, -2.331042, 0.3333333, 1, 0, 1,
-0.5672853, -0.6030327, -2.350703, 0.3254902, 1, 0, 1,
-0.5647205, -2.229165, -1.945147, 0.3215686, 1, 0, 1,
-0.562124, 0.2766626, -2.006895, 0.3137255, 1, 0, 1,
-0.5591632, -0.05808444, -0.9861814, 0.3098039, 1, 0, 1,
-0.5549762, 1.977972, -1.971318, 0.3019608, 1, 0, 1,
-0.554177, -1.321459, -2.117148, 0.2941177, 1, 0, 1,
-0.5481508, 1.570403, -0.5322749, 0.2901961, 1, 0, 1,
-0.5476687, 0.1306908, -2.490103, 0.282353, 1, 0, 1,
-0.5475926, -0.3411237, -1.362123, 0.2784314, 1, 0, 1,
-0.5456157, 0.0611209, -1.913306, 0.2705882, 1, 0, 1,
-0.5405795, 0.3545966, -1.699878, 0.2666667, 1, 0, 1,
-0.5402098, 0.8114364, 0.0199933, 0.2588235, 1, 0, 1,
-0.537632, -0.696602, -2.073872, 0.254902, 1, 0, 1,
-0.533388, -1.092685, -4.398654, 0.2470588, 1, 0, 1,
-0.53187, 1.960136, 2.149921, 0.2431373, 1, 0, 1,
-0.5286322, -0.7771939, -0.9615628, 0.2352941, 1, 0, 1,
-0.5269863, 1.310134, -1.107383, 0.2313726, 1, 0, 1,
-0.5239272, -0.9543774, -3.07833, 0.2235294, 1, 0, 1,
-0.5229872, -0.7880269, -2.709165, 0.2196078, 1, 0, 1,
-0.5208837, 0.2622922, -1.866531, 0.2117647, 1, 0, 1,
-0.5188856, -2.050539, -4.367779, 0.2078431, 1, 0, 1,
-0.5170076, 1.075736, -0.9072093, 0.2, 1, 0, 1,
-0.5084143, 0.3953547, -1.376688, 0.1921569, 1, 0, 1,
-0.5037479, 0.8410654, 0.2311493, 0.1882353, 1, 0, 1,
-0.4955688, -0.2565367, -3.158306, 0.1803922, 1, 0, 1,
-0.4955456, -1.362626, -2.519901, 0.1764706, 1, 0, 1,
-0.4910969, -1.584633, -3.381732, 0.1686275, 1, 0, 1,
-0.490748, -0.6270915, -2.834524, 0.1647059, 1, 0, 1,
-0.4886506, -1.463634, -3.159633, 0.1568628, 1, 0, 1,
-0.4871977, -1.457121, -2.838587, 0.1529412, 1, 0, 1,
-0.4825797, -0.4106167, -1.183304, 0.145098, 1, 0, 1,
-0.4812726, -0.0008330854, -2.498149, 0.1411765, 1, 0, 1,
-0.4781121, -1.070077, -4.155528, 0.1333333, 1, 0, 1,
-0.4775888, -0.5676205, -3.406097, 0.1294118, 1, 0, 1,
-0.4757794, -1.280995, -3.100252, 0.1215686, 1, 0, 1,
-0.4716543, -0.5308723, -2.810959, 0.1176471, 1, 0, 1,
-0.4713993, -0.4831075, -1.573626, 0.1098039, 1, 0, 1,
-0.4636264, 1.505348, -0.7074411, 0.1058824, 1, 0, 1,
-0.4628721, -0.6326261, -4.450946, 0.09803922, 1, 0, 1,
-0.4620909, 0.770345, -0.02433294, 0.09019608, 1, 0, 1,
-0.4603943, 1.140091, -0.4171003, 0.08627451, 1, 0, 1,
-0.4578204, -0.6893483, -2.268525, 0.07843138, 1, 0, 1,
-0.4570285, -0.5588149, -1.724765, 0.07450981, 1, 0, 1,
-0.4537225, 0.3659416, -1.121968, 0.06666667, 1, 0, 1,
-0.4498425, -0.5481543, -1.658064, 0.0627451, 1, 0, 1,
-0.4493203, -0.3177001, -2.136753, 0.05490196, 1, 0, 1,
-0.4430551, 2.02815, -1.763831, 0.05098039, 1, 0, 1,
-0.4422142, 0.4099313, -1.072555, 0.04313726, 1, 0, 1,
-0.4407929, -0.9021183, -2.676369, 0.03921569, 1, 0, 1,
-0.4364967, -0.05164021, -0.8886037, 0.03137255, 1, 0, 1,
-0.4341404, 1.35842, 1.137247, 0.02745098, 1, 0, 1,
-0.4327423, -0.676864, -2.839791, 0.01960784, 1, 0, 1,
-0.424095, 0.8027669, -0.5301089, 0.01568628, 1, 0, 1,
-0.419346, -0.0990544, -3.176057, 0.007843138, 1, 0, 1,
-0.4187399, -0.3098942, -2.370134, 0.003921569, 1, 0, 1,
-0.416169, -0.6422878, -2.775207, 0, 1, 0.003921569, 1,
-0.4149582, -0.1495175, -1.625434, 0, 1, 0.01176471, 1,
-0.4144173, -0.1059546, -2.474988, 0, 1, 0.01568628, 1,
-0.4135891, 0.7178819, -1.710279, 0, 1, 0.02352941, 1,
-0.4112086, -0.1066684, -1.051638, 0, 1, 0.02745098, 1,
-0.4059794, -1.306036, -1.007619, 0, 1, 0.03529412, 1,
-0.4013331, -0.9012446, -0.5682335, 0, 1, 0.03921569, 1,
-0.4005921, 0.1275245, -1.951261, 0, 1, 0.04705882, 1,
-0.399747, 1.687245, -0.8032385, 0, 1, 0.05098039, 1,
-0.3981154, -0.3298699, -1.356412, 0, 1, 0.05882353, 1,
-0.3925003, -0.1694509, -3.484319, 0, 1, 0.0627451, 1,
-0.3924163, 0.4719409, -1.571413, 0, 1, 0.07058824, 1,
-0.3915903, 1.750684, 0.523451, 0, 1, 0.07450981, 1,
-0.38712, 0.5564551, -0.8285154, 0, 1, 0.08235294, 1,
-0.3865718, -0.6783729, -1.293928, 0, 1, 0.08627451, 1,
-0.3834248, 1.378688, 0.3830471, 0, 1, 0.09411765, 1,
-0.3815275, 1.451297, -0.1563722, 0, 1, 0.1019608, 1,
-0.380864, 0.9739558, -1.861727, 0, 1, 0.1058824, 1,
-0.3805065, -0.4581037, -0.5225947, 0, 1, 0.1137255, 1,
-0.3721675, 0.3509961, -0.7680293, 0, 1, 0.1176471, 1,
-0.3720154, -0.05795947, -1.990086, 0, 1, 0.1254902, 1,
-0.370737, 1.207686, 1.455438, 0, 1, 0.1294118, 1,
-0.3642218, 0.01936116, -3.157964, 0, 1, 0.1372549, 1,
-0.3591228, -0.7716543, -2.454221, 0, 1, 0.1411765, 1,
-0.3583476, -0.724736, -3.178846, 0, 1, 0.1490196, 1,
-0.3550315, -0.1166356, -1.60342, 0, 1, 0.1529412, 1,
-0.3540907, 0.3871141, 0.8641022, 0, 1, 0.1607843, 1,
-0.3515497, -0.3934017, -1.872518, 0, 1, 0.1647059, 1,
-0.3473416, -0.3337517, -4.839646, 0, 1, 0.172549, 1,
-0.3448443, 0.6057331, 0.7682103, 0, 1, 0.1764706, 1,
-0.3397413, -0.07075823, -3.494464, 0, 1, 0.1843137, 1,
-0.3339619, 0.4094092, 0.1119003, 0, 1, 0.1882353, 1,
-0.3334229, -1.012221, -3.052697, 0, 1, 0.1960784, 1,
-0.3258441, -0.7522705, -4.562839, 0, 1, 0.2039216, 1,
-0.323956, 1.019993, 1.053206, 0, 1, 0.2078431, 1,
-0.323017, 2.625235, -2.169398, 0, 1, 0.2156863, 1,
-0.3203635, -0.5217733, -1.529341, 0, 1, 0.2196078, 1,
-0.3189591, 0.8946869, -0.8483581, 0, 1, 0.227451, 1,
-0.3170356, 0.2373232, -1.059967, 0, 1, 0.2313726, 1,
-0.3146369, -0.1461113, -2.295376, 0, 1, 0.2392157, 1,
-0.3130713, -0.8530786, -4.252255, 0, 1, 0.2431373, 1,
-0.3085766, -0.1365506, -2.475762, 0, 1, 0.2509804, 1,
-0.3041561, -1.592969, -4.515137, 0, 1, 0.254902, 1,
-0.2955905, 0.3617351, 0.3169847, 0, 1, 0.2627451, 1,
-0.2913717, 1.589003, -0.8224895, 0, 1, 0.2666667, 1,
-0.2884395, 1.557878, -1.02289, 0, 1, 0.2745098, 1,
-0.2877534, 1.271356, -0.5360429, 0, 1, 0.2784314, 1,
-0.2829489, -1.450482, -1.745773, 0, 1, 0.2862745, 1,
-0.2792687, 0.5496069, -1.094352, 0, 1, 0.2901961, 1,
-0.2769093, 1.711767, 0.3710653, 0, 1, 0.2980392, 1,
-0.2746977, -0.1717416, -4.893335, 0, 1, 0.3058824, 1,
-0.2663447, 0.4319701, 0.3313945, 0, 1, 0.3098039, 1,
-0.2655504, 0.2968894, -1.330276, 0, 1, 0.3176471, 1,
-0.2623667, -2.039667, -2.153735, 0, 1, 0.3215686, 1,
-0.254871, 1.021279, -0.6732651, 0, 1, 0.3294118, 1,
-0.2518225, -0.1173466, -1.590708, 0, 1, 0.3333333, 1,
-0.2516454, 2.422129, -0.5888287, 0, 1, 0.3411765, 1,
-0.2492582, -0.4049187, -2.12493, 0, 1, 0.345098, 1,
-0.2473079, -1.19932, -3.341604, 0, 1, 0.3529412, 1,
-0.2461932, 1.726604, -1.956129, 0, 1, 0.3568628, 1,
-0.2450037, 0.1181934, 0.4497546, 0, 1, 0.3647059, 1,
-0.2449321, -0.04018931, -1.893694, 0, 1, 0.3686275, 1,
-0.2438177, -1.589427, -2.84284, 0, 1, 0.3764706, 1,
-0.2434091, -0.04881384, -1.469416, 0, 1, 0.3803922, 1,
-0.2422502, 1.356749, 1.031085, 0, 1, 0.3882353, 1,
-0.2387397, -0.7009196, -3.512185, 0, 1, 0.3921569, 1,
-0.2369246, 1.288242, -1.320239, 0, 1, 0.4, 1,
-0.2324031, 2.518665, -1.005784, 0, 1, 0.4078431, 1,
-0.2317245, -0.5841745, -0.767614, 0, 1, 0.4117647, 1,
-0.2254808, 0.9001676, -0.3585147, 0, 1, 0.4196078, 1,
-0.2228397, -0.9557652, -4.262423, 0, 1, 0.4235294, 1,
-0.2193756, -1.210834, -3.596831, 0, 1, 0.4313726, 1,
-0.2045183, -0.5290778, -2.92876, 0, 1, 0.4352941, 1,
-0.2040839, -1.193889, -1.392782, 0, 1, 0.4431373, 1,
-0.1990738, 0.9350315, -1.417597, 0, 1, 0.4470588, 1,
-0.1946967, -0.8341695, -4.614082, 0, 1, 0.454902, 1,
-0.1895428, -0.6139354, -3.802446, 0, 1, 0.4588235, 1,
-0.1869866, -0.393032, -3.727508, 0, 1, 0.4666667, 1,
-0.1868124, 0.2272333, -1.112993, 0, 1, 0.4705882, 1,
-0.186169, 0.9383886, 0.3808449, 0, 1, 0.4784314, 1,
-0.182917, 0.29071, -2.589751, 0, 1, 0.4823529, 1,
-0.180488, -1.034326, -4.719115, 0, 1, 0.4901961, 1,
-0.1754801, 0.0004558046, -0.7668549, 0, 1, 0.4941176, 1,
-0.1745006, 0.98305, -0.5310085, 0, 1, 0.5019608, 1,
-0.1739883, -0.1478145, -0.4846818, 0, 1, 0.509804, 1,
-0.1730333, 1.761984, -1.455783, 0, 1, 0.5137255, 1,
-0.1729612, 0.674668, -0.1110784, 0, 1, 0.5215687, 1,
-0.1725757, 0.3520705, -1.171204, 0, 1, 0.5254902, 1,
-0.1700686, 0.7017141, -0.4394695, 0, 1, 0.5333334, 1,
-0.168204, 1.155701, -0.5002502, 0, 1, 0.5372549, 1,
-0.1679678, -0.214201, -0.2169165, 0, 1, 0.5450981, 1,
-0.1671337, 0.4074713, 0.1094303, 0, 1, 0.5490196, 1,
-0.1627022, -1.240786, -2.75025, 0, 1, 0.5568628, 1,
-0.161175, 2.179875, 1.293519, 0, 1, 0.5607843, 1,
-0.1574555, 0.2750252, -0.4397507, 0, 1, 0.5686275, 1,
-0.1564395, -1.371637, -3.361912, 0, 1, 0.572549, 1,
-0.1554261, -1.094499, -2.872953, 0, 1, 0.5803922, 1,
-0.1525763, 0.5482495, -1.376187, 0, 1, 0.5843138, 1,
-0.1439866, -0.9216943, -1.015473, 0, 1, 0.5921569, 1,
-0.1421909, 0.08835079, -2.631748, 0, 1, 0.5960785, 1,
-0.1394361, 0.2883414, -1.72526, 0, 1, 0.6039216, 1,
-0.1367654, 0.2580057, -2.194106, 0, 1, 0.6117647, 1,
-0.1358273, 0.2100815, -0.7492584, 0, 1, 0.6156863, 1,
-0.1328103, 0.4869485, -1.116606, 0, 1, 0.6235294, 1,
-0.1317899, 1.798371, 0.3241866, 0, 1, 0.627451, 1,
-0.1307984, 2.098532, 1.171399, 0, 1, 0.6352941, 1,
-0.1290997, -0.2191734, -1.698939, 0, 1, 0.6392157, 1,
-0.1220086, -0.4990179, -2.668921, 0, 1, 0.6470588, 1,
-0.1217848, -1.028807, -2.949157, 0, 1, 0.6509804, 1,
-0.1210465, -0.2185605, -0.7261997, 0, 1, 0.6588235, 1,
-0.1185933, 0.745856, 0.5352247, 0, 1, 0.6627451, 1,
-0.1177211, 0.598438, -0.8943533, 0, 1, 0.6705883, 1,
-0.1042743, -0.4074009, -1.900967, 0, 1, 0.6745098, 1,
-0.1028291, 0.0924636, 0.2127343, 0, 1, 0.682353, 1,
-0.09873663, -1.534142, -1.588726, 0, 1, 0.6862745, 1,
-0.09737731, 0.2750498, 0.4716502, 0, 1, 0.6941177, 1,
-0.09571684, -0.5269078, -3.676556, 0, 1, 0.7019608, 1,
-0.09369036, -0.3271101, -3.910007, 0, 1, 0.7058824, 1,
-0.09245022, 1.560882, -1.05477, 0, 1, 0.7137255, 1,
-0.08788068, 1.208467, -0.02495512, 0, 1, 0.7176471, 1,
-0.0871249, -0.3549125, -3.192826, 0, 1, 0.7254902, 1,
-0.08502262, -0.5573493, -3.984849, 0, 1, 0.7294118, 1,
-0.08166947, -0.4602577, -2.373268, 0, 1, 0.7372549, 1,
-0.07630942, -1.959919, -2.975606, 0, 1, 0.7411765, 1,
-0.07371923, 0.9360686, 1.367018, 0, 1, 0.7490196, 1,
-0.07279696, -0.3202325, -3.091897, 0, 1, 0.7529412, 1,
-0.0725652, 0.5061476, -0.03486145, 0, 1, 0.7607843, 1,
-0.06484891, 1.6383, 0.2352286, 0, 1, 0.7647059, 1,
-0.05804394, -0.1287216, -1.863568, 0, 1, 0.772549, 1,
-0.05773534, 0.3627801, -0.8570427, 0, 1, 0.7764706, 1,
-0.05267329, -1.153415, -2.595747, 0, 1, 0.7843137, 1,
-0.05071658, -0.02751045, -2.916992, 0, 1, 0.7882353, 1,
-0.04907957, 0.7694532, 0.6754209, 0, 1, 0.7960784, 1,
-0.04604945, -0.08751684, -1.479552, 0, 1, 0.8039216, 1,
-0.04256858, -1.094609, -4.035724, 0, 1, 0.8078431, 1,
-0.03985076, -1.088234, -1.670732, 0, 1, 0.8156863, 1,
-0.03674074, 0.7975355, -0.1035574, 0, 1, 0.8196079, 1,
-0.03148336, 1.144113, 0.2617132, 0, 1, 0.827451, 1,
-0.02916055, 1.625548, 0.8266206, 0, 1, 0.8313726, 1,
-0.02848593, 0.6789507, -1.363346, 0, 1, 0.8392157, 1,
-0.0213773, -0.6268542, -0.5666321, 0, 1, 0.8431373, 1,
-0.01911615, -0.3075268, -2.671634, 0, 1, 0.8509804, 1,
-0.01515066, 1.259831, 1.117043, 0, 1, 0.854902, 1,
-0.01349435, -0.9727008, -3.203919, 0, 1, 0.8627451, 1,
-0.01239137, -1.080046, -1.677642, 0, 1, 0.8666667, 1,
-0.01148357, 0.2957864, -0.6116443, 0, 1, 0.8745098, 1,
-0.008213669, 0.06582369, 0.6097903, 0, 1, 0.8784314, 1,
-0.006966224, 2.673114, -0.8241255, 0, 1, 0.8862745, 1,
-0.005052318, -0.1239841, -2.552229, 0, 1, 0.8901961, 1,
-0.001272546, -1.366532, -2.455824, 0, 1, 0.8980392, 1,
-0.001025578, 0.6903399, 0.1246026, 0, 1, 0.9058824, 1,
-0.0003546156, 0.6485076, 0.3218981, 0, 1, 0.9098039, 1,
-0.0001345247, 1.420728, 2.960786, 0, 1, 0.9176471, 1,
0.006183958, 0.3544635, 0.3068084, 0, 1, 0.9215686, 1,
0.007445857, 0.4518341, -0.6287556, 0, 1, 0.9294118, 1,
0.01015383, -2.289399, 3.209254, 0, 1, 0.9333333, 1,
0.01194072, -0.7082707, 2.873152, 0, 1, 0.9411765, 1,
0.0139952, -0.02204784, 4.285381, 0, 1, 0.945098, 1,
0.01462302, 0.08419756, 0.06278656, 0, 1, 0.9529412, 1,
0.01678651, -0.168208, 2.504129, 0, 1, 0.9568627, 1,
0.01712773, 0.07192027, -0.04396629, 0, 1, 0.9647059, 1,
0.02020828, 0.2724642, 1.317559, 0, 1, 0.9686275, 1,
0.02144814, 0.06014679, 0.5921208, 0, 1, 0.9764706, 1,
0.02340705, 0.7148491, -0.6792907, 0, 1, 0.9803922, 1,
0.02590993, -0.941722, 2.794705, 0, 1, 0.9882353, 1,
0.02731041, -0.1786993, 2.921621, 0, 1, 0.9921569, 1,
0.03020268, 1.106589, -0.6049056, 0, 1, 1, 1,
0.03145602, -0.2452708, 2.918373, 0, 0.9921569, 1, 1,
0.03468376, -0.06412476, 0.5338358, 0, 0.9882353, 1, 1,
0.03786577, 0.4163748, 1.239249, 0, 0.9803922, 1, 1,
0.03795448, 0.06023984, 0.2547802, 0, 0.9764706, 1, 1,
0.04195813, -0.8274905, 2.884044, 0, 0.9686275, 1, 1,
0.04462833, 0.9401476, -0.1361551, 0, 0.9647059, 1, 1,
0.04684563, 0.2516083, -0.2878618, 0, 0.9568627, 1, 1,
0.05128735, -0.02794519, 2.097754, 0, 0.9529412, 1, 1,
0.05303513, -0.6385356, 1.519324, 0, 0.945098, 1, 1,
0.05393624, -0.5311217, 4.840808, 0, 0.9411765, 1, 1,
0.05400201, 0.8885039, 0.9034112, 0, 0.9333333, 1, 1,
0.06050269, 0.5069366, -0.6977293, 0, 0.9294118, 1, 1,
0.06755275, -1.162816, 2.132919, 0, 0.9215686, 1, 1,
0.06888881, 0.1782195, 0.8404029, 0, 0.9176471, 1, 1,
0.07372225, -0.5114284, 1.773101, 0, 0.9098039, 1, 1,
0.07432371, -0.3115531, 3.061937, 0, 0.9058824, 1, 1,
0.09297807, -0.4516353, 3.135684, 0, 0.8980392, 1, 1,
0.09654557, 1.143177, 0.445507, 0, 0.8901961, 1, 1,
0.09697387, -0.953506, 2.335629, 0, 0.8862745, 1, 1,
0.09785737, 0.7311771, 1.972538, 0, 0.8784314, 1, 1,
0.09801661, 0.33838, 1.150935, 0, 0.8745098, 1, 1,
0.1012595, -2.285152, 2.650749, 0, 0.8666667, 1, 1,
0.1029125, 1.071478, 1.138905, 0, 0.8627451, 1, 1,
0.1038452, 1.323007, 1.642772, 0, 0.854902, 1, 1,
0.1064256, -0.4854305, 4.0513, 0, 0.8509804, 1, 1,
0.1079427, -0.3139645, 4.343939, 0, 0.8431373, 1, 1,
0.1109163, 0.7792496, 0.0244743, 0, 0.8392157, 1, 1,
0.1129707, 0.1918915, 1.98335, 0, 0.8313726, 1, 1,
0.116177, 2.154228, 1.097661, 0, 0.827451, 1, 1,
0.1168678, 0.3705074, -1.979893, 0, 0.8196079, 1, 1,
0.1176388, 0.6408969, -0.2827923, 0, 0.8156863, 1, 1,
0.1180743, 0.7035704, 1.291751, 0, 0.8078431, 1, 1,
0.1187014, -2.684828, 4.186749, 0, 0.8039216, 1, 1,
0.120198, 1.077893, -1.130987, 0, 0.7960784, 1, 1,
0.1223001, -0.2763395, 1.557747, 0, 0.7882353, 1, 1,
0.1224999, 0.2082961, -1.303662, 0, 0.7843137, 1, 1,
0.1236368, 0.03166462, 1.396967, 0, 0.7764706, 1, 1,
0.1244332, 1.238885, 0.6987602, 0, 0.772549, 1, 1,
0.1260035, -0.04975508, 1.117247, 0, 0.7647059, 1, 1,
0.1273951, -0.6293951, 2.138679, 0, 0.7607843, 1, 1,
0.1322603, 0.06925604, 1.176987, 0, 0.7529412, 1, 1,
0.1397702, 0.3991752, -1.920978, 0, 0.7490196, 1, 1,
0.1403072, -1.422905, 2.468819, 0, 0.7411765, 1, 1,
0.1417083, -0.2848558, 2.658869, 0, 0.7372549, 1, 1,
0.1438173, 0.3740898, 0.8255787, 0, 0.7294118, 1, 1,
0.147263, 2.316606, -0.4923719, 0, 0.7254902, 1, 1,
0.1498191, -0.1601478, 4.088768, 0, 0.7176471, 1, 1,
0.150652, -0.699504, 3.7901, 0, 0.7137255, 1, 1,
0.1512649, -0.1329212, 1.531684, 0, 0.7058824, 1, 1,
0.1535332, -0.007859543, -0.4045224, 0, 0.6980392, 1, 1,
0.1547467, -0.6900017, 3.665353, 0, 0.6941177, 1, 1,
0.1557383, 0.6899553, 0.1334554, 0, 0.6862745, 1, 1,
0.1561803, -0.821622, 3.196534, 0, 0.682353, 1, 1,
0.1575495, 2.406263, -1.764055, 0, 0.6745098, 1, 1,
0.1614015, 0.5215537, -0.2813359, 0, 0.6705883, 1, 1,
0.1625593, 1.055757, -0.6637734, 0, 0.6627451, 1, 1,
0.1658296, -0.5642645, 0.785774, 0, 0.6588235, 1, 1,
0.1698153, -0.94377, 1.831064, 0, 0.6509804, 1, 1,
0.1842795, 0.02133748, 1.446038, 0, 0.6470588, 1, 1,
0.1857152, -1.376853, 2.1115, 0, 0.6392157, 1, 1,
0.1877428, 0.004708003, 1.399551, 0, 0.6352941, 1, 1,
0.1942826, -0.05364296, 3.071287, 0, 0.627451, 1, 1,
0.1950624, 1.446567, 0.213503, 0, 0.6235294, 1, 1,
0.1960195, 0.8328011, 0.2043804, 0, 0.6156863, 1, 1,
0.1963053, 1.045953, 0.1425022, 0, 0.6117647, 1, 1,
0.1983958, 0.2105664, -0.9800573, 0, 0.6039216, 1, 1,
0.2026491, -0.5914999, 4.455871, 0, 0.5960785, 1, 1,
0.2087458, -0.07378084, 0.8051941, 0, 0.5921569, 1, 1,
0.2095527, 1.229016, -0.2629988, 0, 0.5843138, 1, 1,
0.2121378, -1.218305, 2.775138, 0, 0.5803922, 1, 1,
0.2124627, 0.2151387, 1.337452, 0, 0.572549, 1, 1,
0.2128292, -0.4332502, -0.2513368, 0, 0.5686275, 1, 1,
0.2202431, -0.6429819, 2.574989, 0, 0.5607843, 1, 1,
0.2209036, 0.006421551, 1.813497, 0, 0.5568628, 1, 1,
0.22478, 0.5937886, 0.2262803, 0, 0.5490196, 1, 1,
0.2248836, -0.5240923, 2.133715, 0, 0.5450981, 1, 1,
0.2303294, 0.9863552, -0.7457847, 0, 0.5372549, 1, 1,
0.234275, -0.6602579, 3.082531, 0, 0.5333334, 1, 1,
0.2377002, 1.072742, 0.357406, 0, 0.5254902, 1, 1,
0.2386008, 1.28452, 0.7003148, 0, 0.5215687, 1, 1,
0.2439865, -0.07381563, 2.455986, 0, 0.5137255, 1, 1,
0.2474738, -1.973434, 3.108618, 0, 0.509804, 1, 1,
0.2477749, 1.69694, -0.1335554, 0, 0.5019608, 1, 1,
0.2486402, -0.591182, 2.468458, 0, 0.4941176, 1, 1,
0.2558005, 0.2814679, 1.778909, 0, 0.4901961, 1, 1,
0.2563478, 0.7566213, -1.156988, 0, 0.4823529, 1, 1,
0.2608879, 0.4960938, -1.775124, 0, 0.4784314, 1, 1,
0.2705448, -0.7853951, 3.714766, 0, 0.4705882, 1, 1,
0.2708451, -1.304322, 4.371067, 0, 0.4666667, 1, 1,
0.2726727, -0.5988914, 4.15587, 0, 0.4588235, 1, 1,
0.2741147, 3.127222, 0.5629825, 0, 0.454902, 1, 1,
0.2798707, -1.701458, 2.537047, 0, 0.4470588, 1, 1,
0.2799254, -2.461585, 2.389582, 0, 0.4431373, 1, 1,
0.2806458, 1.016471, 2.013677, 0, 0.4352941, 1, 1,
0.2823625, 1.821717, -0.3941239, 0, 0.4313726, 1, 1,
0.2828378, -0.2167667, 3.760042, 0, 0.4235294, 1, 1,
0.2829252, 0.325529, -0.5312681, 0, 0.4196078, 1, 1,
0.2843956, -0.04434929, -0.5396464, 0, 0.4117647, 1, 1,
0.2848415, 0.5704942, 0.2194112, 0, 0.4078431, 1, 1,
0.2873218, 0.5692206, 2.043667, 0, 0.4, 1, 1,
0.2879548, -0.4483293, 1.736954, 0, 0.3921569, 1, 1,
0.2897699, -1.728257, 3.667605, 0, 0.3882353, 1, 1,
0.2996607, 0.4066391, 0.7543761, 0, 0.3803922, 1, 1,
0.2998523, 0.2091251, -0.09903255, 0, 0.3764706, 1, 1,
0.3062426, 0.326906, 1.221899, 0, 0.3686275, 1, 1,
0.3068444, -0.3465142, 1.766441, 0, 0.3647059, 1, 1,
0.3078801, 0.7874303, 0.8213623, 0, 0.3568628, 1, 1,
0.308493, 0.4941424, 1.358833, 0, 0.3529412, 1, 1,
0.310036, 0.166813, 1.098309, 0, 0.345098, 1, 1,
0.3118851, 0.1445243, 1.213781, 0, 0.3411765, 1, 1,
0.3132545, -0.7717833, 5.306548, 0, 0.3333333, 1, 1,
0.3142611, 0.4223606, 1.18905, 0, 0.3294118, 1, 1,
0.3152201, -1.731783, 3.630387, 0, 0.3215686, 1, 1,
0.3224226, -0.4011672, 1.0088, 0, 0.3176471, 1, 1,
0.3270772, 0.4680889, 0.4343973, 0, 0.3098039, 1, 1,
0.3275195, -1.023142, 1.036134, 0, 0.3058824, 1, 1,
0.3318352, 1.026092, 0.5436769, 0, 0.2980392, 1, 1,
0.3335568, 0.9826909, 1.20138, 0, 0.2901961, 1, 1,
0.3347983, -0.7019107, 3.256614, 0, 0.2862745, 1, 1,
0.3349156, 1.164335, 0.3213554, 0, 0.2784314, 1, 1,
0.3372727, 0.08689874, -0.7489726, 0, 0.2745098, 1, 1,
0.3380322, -0.9702777, 3.323053, 0, 0.2666667, 1, 1,
0.3386447, 1.329086, -0.3669243, 0, 0.2627451, 1, 1,
0.3408726, 1.190639, 0.6145818, 0, 0.254902, 1, 1,
0.3435121, 0.2885611, 1.496422, 0, 0.2509804, 1, 1,
0.3447366, 0.2813935, -0.1563242, 0, 0.2431373, 1, 1,
0.3476889, 0.5108805, -0.01829537, 0, 0.2392157, 1, 1,
0.350512, -0.8803011, 2.46382, 0, 0.2313726, 1, 1,
0.3518794, 1.172766, 0.7292446, 0, 0.227451, 1, 1,
0.3529271, 0.8616456, 0.01341202, 0, 0.2196078, 1, 1,
0.3534032, -0.1124594, 1.768318, 0, 0.2156863, 1, 1,
0.3628055, 2.329526, 1.648047, 0, 0.2078431, 1, 1,
0.3667064, -0.1738713, 1.859504, 0, 0.2039216, 1, 1,
0.3874873, -0.7352814, 2.887242, 0, 0.1960784, 1, 1,
0.4028636, -1.19184, 2.901249, 0, 0.1882353, 1, 1,
0.4074149, -0.6906131, 3.204362, 0, 0.1843137, 1, 1,
0.4120263, 1.066462, -0.8026113, 0, 0.1764706, 1, 1,
0.4137397, -1.168906, 1.693828, 0, 0.172549, 1, 1,
0.4201829, 1.104627, -1.250766, 0, 0.1647059, 1, 1,
0.4241429, 0.1029769, -0.5518889, 0, 0.1607843, 1, 1,
0.4248132, 0.01210984, 1.779673, 0, 0.1529412, 1, 1,
0.4262712, 0.08104371, 2.563556, 0, 0.1490196, 1, 1,
0.4289584, 0.3164955, 1.003913, 0, 0.1411765, 1, 1,
0.4325152, -2.044857, 3.720283, 0, 0.1372549, 1, 1,
0.4373533, -2.064278, 3.843165, 0, 0.1294118, 1, 1,
0.4390694, -0.595053, 3.08737, 0, 0.1254902, 1, 1,
0.4416937, 0.8550178, 0.9286878, 0, 0.1176471, 1, 1,
0.4419779, 1.351472, -0.3305133, 0, 0.1137255, 1, 1,
0.4496832, 1.221531, -0.05471589, 0, 0.1058824, 1, 1,
0.4501683, 0.08878923, 2.952389, 0, 0.09803922, 1, 1,
0.4588908, 0.5524538, 1.340424, 0, 0.09411765, 1, 1,
0.464248, -1.126122, 2.842673, 0, 0.08627451, 1, 1,
0.4678525, -3.403819, 5.267658, 0, 0.08235294, 1, 1,
0.4714607, 1.232719, 1.716408, 0, 0.07450981, 1, 1,
0.4741765, 0.544234, -0.4008371, 0, 0.07058824, 1, 1,
0.4765183, -0.5568537, 3.126518, 0, 0.0627451, 1, 1,
0.4770819, -0.1255113, 0.8695977, 0, 0.05882353, 1, 1,
0.4792754, 0.8607541, -1.00009, 0, 0.05098039, 1, 1,
0.4800606, -0.7322416, 3.91258, 0, 0.04705882, 1, 1,
0.4978018, 0.1439315, -0.6380567, 0, 0.03921569, 1, 1,
0.4996629, 1.44081, 0.879518, 0, 0.03529412, 1, 1,
0.501387, -0.8400883, 3.280454, 0, 0.02745098, 1, 1,
0.5053795, -0.05447759, 1.149801, 0, 0.02352941, 1, 1,
0.5060489, 0.1788025, 1.857644, 0, 0.01568628, 1, 1,
0.5072037, -0.08747099, 1.78808, 0, 0.01176471, 1, 1,
0.5125185, 0.561428, 0.3232469, 0, 0.003921569, 1, 1,
0.5154575, 0.9459057, -0.544203, 0.003921569, 0, 1, 1,
0.5161775, -1.156394, 3.80464, 0.007843138, 0, 1, 1,
0.5162436, 0.3325407, 0.5236853, 0.01568628, 0, 1, 1,
0.5187418, -0.254129, 2.450953, 0.01960784, 0, 1, 1,
0.5306021, -0.8379613, 1.656156, 0.02745098, 0, 1, 1,
0.5331185, -1.085461, 3.532428, 0.03137255, 0, 1, 1,
0.534157, 0.3082138, 2.406777, 0.03921569, 0, 1, 1,
0.5344645, 2.14493, -0.4544141, 0.04313726, 0, 1, 1,
0.5353914, 0.9314502, 0.7608331, 0.05098039, 0, 1, 1,
0.5354664, -1.429328, 2.23258, 0.05490196, 0, 1, 1,
0.5395114, -0.2224689, 2.719839, 0.0627451, 0, 1, 1,
0.5396792, -1.530125, 3.615378, 0.06666667, 0, 1, 1,
0.5414239, -0.4450784, 3.052324, 0.07450981, 0, 1, 1,
0.541766, -0.7246515, 2.462316, 0.07843138, 0, 1, 1,
0.5455836, 1.167298, 0.1834662, 0.08627451, 0, 1, 1,
0.5455839, -0.4184194, 0.8432923, 0.09019608, 0, 1, 1,
0.5461441, -1.939356, 3.244236, 0.09803922, 0, 1, 1,
0.546943, 1.753517, -1.994645, 0.1058824, 0, 1, 1,
0.5489288, -0.1896038, 0.8544959, 0.1098039, 0, 1, 1,
0.5551729, 0.3760148, 1.013733, 0.1176471, 0, 1, 1,
0.5564063, -1.091183, 3.980574, 0.1215686, 0, 1, 1,
0.5606541, 1.627522, -0.5797694, 0.1294118, 0, 1, 1,
0.5638519, -0.4166629, 2.306889, 0.1333333, 0, 1, 1,
0.563926, 1.088272, 0.3180867, 0.1411765, 0, 1, 1,
0.564514, 0.3118612, 2.197707, 0.145098, 0, 1, 1,
0.5650551, -0.127338, 0.9542687, 0.1529412, 0, 1, 1,
0.5652208, 1.42713, -0.5028656, 0.1568628, 0, 1, 1,
0.5667512, -0.7355163, 2.889286, 0.1647059, 0, 1, 1,
0.5678112, 1.608754, -0.01633211, 0.1686275, 0, 1, 1,
0.5684634, -1.611802, 4.154009, 0.1764706, 0, 1, 1,
0.5823066, 0.455301, 0.8447399, 0.1803922, 0, 1, 1,
0.5899748, -1.222103, 4.191274, 0.1882353, 0, 1, 1,
0.5949748, -0.433008, 3.585892, 0.1921569, 0, 1, 1,
0.5970239, -2.03627, 2.834814, 0.2, 0, 1, 1,
0.5989986, -0.4095609, 2.591203, 0.2078431, 0, 1, 1,
0.6017873, 1.650448, -0.6355985, 0.2117647, 0, 1, 1,
0.6060073, 1.541003, 0.001463552, 0.2196078, 0, 1, 1,
0.607501, 0.1422035, 0.5053906, 0.2235294, 0, 1, 1,
0.6077657, 2.05774, 0.8626168, 0.2313726, 0, 1, 1,
0.6154915, 0.287558, 0.755389, 0.2352941, 0, 1, 1,
0.6187896, -0.734629, 2.695289, 0.2431373, 0, 1, 1,
0.6195831, 0.3912607, -0.2805488, 0.2470588, 0, 1, 1,
0.6257024, 0.2904352, 0.43374, 0.254902, 0, 1, 1,
0.6266699, 0.07959391, 3.425451, 0.2588235, 0, 1, 1,
0.6268424, -0.3855337, 1.963646, 0.2666667, 0, 1, 1,
0.6297958, -1.014722, 1.809788, 0.2705882, 0, 1, 1,
0.6403971, -1.1414, 3.123976, 0.2784314, 0, 1, 1,
0.6440684, 1.434354, -0.8989401, 0.282353, 0, 1, 1,
0.6461148, 0.7474046, 0.9524505, 0.2901961, 0, 1, 1,
0.6486661, -1.823768, 2.467197, 0.2941177, 0, 1, 1,
0.6491185, 0.4994672, 1.971133, 0.3019608, 0, 1, 1,
0.6502288, 0.7185519, -1.302655, 0.3098039, 0, 1, 1,
0.6531199, 0.191377, 0.5277513, 0.3137255, 0, 1, 1,
0.6575533, -1.680411, 2.353169, 0.3215686, 0, 1, 1,
0.6583208, -0.5659009, 2.125299, 0.3254902, 0, 1, 1,
0.6587155, -0.2943693, 1.547561, 0.3333333, 0, 1, 1,
0.6618348, 0.3320552, -0.432999, 0.3372549, 0, 1, 1,
0.6675797, -1.322593, 3.599397, 0.345098, 0, 1, 1,
0.6732391, 0.6634002, 1.211484, 0.3490196, 0, 1, 1,
0.6750783, -0.3613626, 1.114219, 0.3568628, 0, 1, 1,
0.6767498, -1.140463, 0.7691054, 0.3607843, 0, 1, 1,
0.6789916, 0.4940414, 0.8790702, 0.3686275, 0, 1, 1,
0.6830521, 0.2312239, 0.5243537, 0.372549, 0, 1, 1,
0.6873049, 0.07019284, -0.5432711, 0.3803922, 0, 1, 1,
0.6939946, 0.1267189, 1.136801, 0.3843137, 0, 1, 1,
0.6971025, 1.168369, 0.7329086, 0.3921569, 0, 1, 1,
0.6974635, 0.7896826, -0.2930807, 0.3960784, 0, 1, 1,
0.7010055, -0.9937469, 1.68738, 0.4039216, 0, 1, 1,
0.7011399, 0.2791329, -0.1703461, 0.4117647, 0, 1, 1,
0.7041277, 1.609853, 1.400465, 0.4156863, 0, 1, 1,
0.7073594, -1.360075, 2.129043, 0.4235294, 0, 1, 1,
0.708859, -0.9334999, 1.294878, 0.427451, 0, 1, 1,
0.7090942, -0.7016744, 0.1846385, 0.4352941, 0, 1, 1,
0.7137067, 0.94304, 1.461591, 0.4392157, 0, 1, 1,
0.7138554, -0.1913282, 1.957072, 0.4470588, 0, 1, 1,
0.7185419, 0.5305429, 2.730534, 0.4509804, 0, 1, 1,
0.7232181, 0.2728087, 1.413896, 0.4588235, 0, 1, 1,
0.7279397, 0.1472885, -0.4314284, 0.4627451, 0, 1, 1,
0.7285765, -0.777266, 2.036918, 0.4705882, 0, 1, 1,
0.729539, -1.526266, 2.572378, 0.4745098, 0, 1, 1,
0.7370752, -0.9699224, 1.52463, 0.4823529, 0, 1, 1,
0.7386724, -1.268641, 4.066403, 0.4862745, 0, 1, 1,
0.7413859, -0.6380493, 1.354006, 0.4941176, 0, 1, 1,
0.7428875, -0.732129, 3.535846, 0.5019608, 0, 1, 1,
0.7433764, 0.05242906, 0.864552, 0.5058824, 0, 1, 1,
0.7490028, -0.9241178, 5.123498, 0.5137255, 0, 1, 1,
0.7557532, 2.137404, 0.7325922, 0.5176471, 0, 1, 1,
0.7561026, -1.265377, 3.469465, 0.5254902, 0, 1, 1,
0.7577622, 0.6858835, 1.866603, 0.5294118, 0, 1, 1,
0.7587653, -1.227984, 3.232457, 0.5372549, 0, 1, 1,
0.7623196, 0.3303572, 1.736889, 0.5411765, 0, 1, 1,
0.7627942, -0.6778343, 1.842464, 0.5490196, 0, 1, 1,
0.7638521, -2.496943, 3.347356, 0.5529412, 0, 1, 1,
0.7706171, -0.4869023, 0.9121115, 0.5607843, 0, 1, 1,
0.7711398, -0.583521, 2.963552, 0.5647059, 0, 1, 1,
0.771545, 0.8594126, 0.4302364, 0.572549, 0, 1, 1,
0.7782948, 0.6258093, 1.657, 0.5764706, 0, 1, 1,
0.7818027, 1.250107, -0.8926665, 0.5843138, 0, 1, 1,
0.7819729, -1.556977, 1.681169, 0.5882353, 0, 1, 1,
0.7852371, 0.4096757, -0.02938607, 0.5960785, 0, 1, 1,
0.788863, 0.6788158, 0.5731977, 0.6039216, 0, 1, 1,
0.7923771, 0.7918078, 1.43119, 0.6078432, 0, 1, 1,
0.7933148, 0.3644542, -0.04746764, 0.6156863, 0, 1, 1,
0.7941676, 0.5666473, -1.62595, 0.6196079, 0, 1, 1,
0.7971053, 0.7618996, 2.804692, 0.627451, 0, 1, 1,
0.8057876, -0.2151294, 1.821177, 0.6313726, 0, 1, 1,
0.8116545, -0.656521, 2.451901, 0.6392157, 0, 1, 1,
0.8160418, 0.1600369, 2.127354, 0.6431373, 0, 1, 1,
0.8170392, 0.7696372, -0.1327585, 0.6509804, 0, 1, 1,
0.8205764, -0.08760653, 3.251529, 0.654902, 0, 1, 1,
0.8220367, -0.9112229, 1.888194, 0.6627451, 0, 1, 1,
0.8226789, -1.29742, 2.992157, 0.6666667, 0, 1, 1,
0.8247572, 0.320078, 0.9793332, 0.6745098, 0, 1, 1,
0.824957, 1.121594, 0.6183663, 0.6784314, 0, 1, 1,
0.8288424, -1.365904, 1.891884, 0.6862745, 0, 1, 1,
0.8294055, -1.619646, 0.8613158, 0.6901961, 0, 1, 1,
0.8385324, -0.1662902, 1.691379, 0.6980392, 0, 1, 1,
0.8468058, -1.944981, 3.087092, 0.7058824, 0, 1, 1,
0.8506917, 2.116781, 0.4035291, 0.7098039, 0, 1, 1,
0.8517513, 0.728156, 0.5177341, 0.7176471, 0, 1, 1,
0.8526598, 1.305706, -0.218955, 0.7215686, 0, 1, 1,
0.8593233, 0.9153873, 0.7156495, 0.7294118, 0, 1, 1,
0.8687926, 0.376147, 1.861938, 0.7333333, 0, 1, 1,
0.8760034, -0.3071848, 1.394937, 0.7411765, 0, 1, 1,
0.879295, 0.4434032, 1.132772, 0.7450981, 0, 1, 1,
0.8796645, 0.1260398, 1.121083, 0.7529412, 0, 1, 1,
0.8827132, 1.185516, 1.211435, 0.7568628, 0, 1, 1,
0.8843489, 0.1997783, 1.189564, 0.7647059, 0, 1, 1,
0.8869025, 1.362186, 0.3473467, 0.7686275, 0, 1, 1,
0.8896332, -1.097412, 3.552848, 0.7764706, 0, 1, 1,
0.894539, -0.05172576, 0.392089, 0.7803922, 0, 1, 1,
0.897483, 0.355429, 1.674589, 0.7882353, 0, 1, 1,
0.9021522, -0.4315003, 0.9143363, 0.7921569, 0, 1, 1,
0.9034689, 1.495655, 0.09049758, 0.8, 0, 1, 1,
0.9083841, 0.9538563, -0.935515, 0.8078431, 0, 1, 1,
0.9122444, 1.013822, 1.409404, 0.8117647, 0, 1, 1,
0.912537, 0.3402287, 0.7402427, 0.8196079, 0, 1, 1,
0.9175187, -0.108479, 0.1685185, 0.8235294, 0, 1, 1,
0.9251843, 0.7793907, 1.724676, 0.8313726, 0, 1, 1,
0.9274262, 0.08231641, 1.296398, 0.8352941, 0, 1, 1,
0.9280249, 0.04461231, 0.8757574, 0.8431373, 0, 1, 1,
0.9283893, -0.4846205, 1.341417, 0.8470588, 0, 1, 1,
0.9351065, -1.08658, 1.559175, 0.854902, 0, 1, 1,
0.939087, -0.3895201, 0.9791759, 0.8588235, 0, 1, 1,
0.9402021, -1.314884, 3.265807, 0.8666667, 0, 1, 1,
0.943106, 0.633351, 0.9732246, 0.8705882, 0, 1, 1,
0.9572026, -1.430216, 2.87297, 0.8784314, 0, 1, 1,
0.959956, -1.134057, 3.218833, 0.8823529, 0, 1, 1,
0.9623027, -0.2436663, 1.79342, 0.8901961, 0, 1, 1,
0.9629003, -2.600439, 3.518912, 0.8941177, 0, 1, 1,
0.9664719, 1.293144, -0.7272676, 0.9019608, 0, 1, 1,
0.968579, 0.5935767, 2.59109, 0.9098039, 0, 1, 1,
0.9711587, 0.4583726, 0.7239905, 0.9137255, 0, 1, 1,
0.9737015, 0.01620883, 1.238667, 0.9215686, 0, 1, 1,
0.9738939, -0.3579458, 1.917668, 0.9254902, 0, 1, 1,
0.9799325, -0.1539523, 1.677221, 0.9333333, 0, 1, 1,
0.9811614, -0.3122073, 1.042613, 0.9372549, 0, 1, 1,
0.9943392, -0.2738671, 0.5918252, 0.945098, 0, 1, 1,
0.9959966, -0.8779617, 0.3924835, 0.9490196, 0, 1, 1,
0.9990516, -0.9388788, 0.9849718, 0.9568627, 0, 1, 1,
1.012089, 1.402741, -0.740567, 0.9607843, 0, 1, 1,
1.012964, 0.6689892, 0.8864068, 0.9686275, 0, 1, 1,
1.018929, 0.1887291, 3.027768, 0.972549, 0, 1, 1,
1.028889, -0.361371, 1.863668, 0.9803922, 0, 1, 1,
1.029944, 1.54072, 2.50035, 0.9843137, 0, 1, 1,
1.031338, -2.035777, 2.457203, 0.9921569, 0, 1, 1,
1.035151, 1.888279, -0.7372119, 0.9960784, 0, 1, 1,
1.037257, 0.2581938, 2.167959, 1, 0, 0.9960784, 1,
1.048363, 0.6775416, 0.04806127, 1, 0, 0.9882353, 1,
1.05005, -1.498513, 3.104354, 1, 0, 0.9843137, 1,
1.055703, -1.012305, 3.039444, 1, 0, 0.9764706, 1,
1.062103, 0.2005692, 2.55616, 1, 0, 0.972549, 1,
1.062459, 0.9245147, 1.215531, 1, 0, 0.9647059, 1,
1.063398, -0.7652133, 2.666999, 1, 0, 0.9607843, 1,
1.066685, -0.4716251, 2.303329, 1, 0, 0.9529412, 1,
1.066975, -0.7372084, 1.235317, 1, 0, 0.9490196, 1,
1.071573, -1.156752, 2.458252, 1, 0, 0.9411765, 1,
1.076402, 1.535879, 1.426236, 1, 0, 0.9372549, 1,
1.085564, 0.09868478, 4.229559, 1, 0, 0.9294118, 1,
1.086432, 1.49405, 0.5263405, 1, 0, 0.9254902, 1,
1.090118, -1.033597, 2.808175, 1, 0, 0.9176471, 1,
1.09819, -0.6630483, 4.169798, 1, 0, 0.9137255, 1,
1.099391, 0.3435159, 1.227772, 1, 0, 0.9058824, 1,
1.107154, 1.002379, -0.339362, 1, 0, 0.9019608, 1,
1.108534, -0.2212011, 1.408098, 1, 0, 0.8941177, 1,
1.122732, -0.4797571, 3.16196, 1, 0, 0.8862745, 1,
1.130148, -0.8057402, 3.247663, 1, 0, 0.8823529, 1,
1.131487, -0.6352972, 2.047503, 1, 0, 0.8745098, 1,
1.132958, 0.5773672, 1.176805, 1, 0, 0.8705882, 1,
1.134508, 0.3072002, -0.910588, 1, 0, 0.8627451, 1,
1.140368, -0.2382683, 3.369056, 1, 0, 0.8588235, 1,
1.140904, -0.9240437, 2.495244, 1, 0, 0.8509804, 1,
1.152991, 2.825947, 0.7122295, 1, 0, 0.8470588, 1,
1.15387, -0.5194532, 4.541424, 1, 0, 0.8392157, 1,
1.159637, 0.0919826, 1.662637, 1, 0, 0.8352941, 1,
1.161572, 1.100066, 0.9859625, 1, 0, 0.827451, 1,
1.161797, -0.5328461, 2.235133, 1, 0, 0.8235294, 1,
1.16554, -1.880115, 3.36807, 1, 0, 0.8156863, 1,
1.166573, 0.9368456, 2.591732, 1, 0, 0.8117647, 1,
1.167968, -0.0005657579, 1.814721, 1, 0, 0.8039216, 1,
1.17427, 0.2323203, 0.3375143, 1, 0, 0.7960784, 1,
1.182668, 0.4065209, 1.811773, 1, 0, 0.7921569, 1,
1.196165, -0.9076601, 1.50529, 1, 0, 0.7843137, 1,
1.19691, -1.46551, 3.461556, 1, 0, 0.7803922, 1,
1.19744, 2.899195, 1.494724, 1, 0, 0.772549, 1,
1.204562, 0.1586703, 0.206598, 1, 0, 0.7686275, 1,
1.206225, 0.2899299, 1.657157, 1, 0, 0.7607843, 1,
1.210065, -0.1905248, 1.765009, 1, 0, 0.7568628, 1,
1.213867, 2.267583, -0.6393653, 1, 0, 0.7490196, 1,
1.218619, 0.06328017, 0.2797339, 1, 0, 0.7450981, 1,
1.222003, -0.5738611, 1.534302, 1, 0, 0.7372549, 1,
1.222319, -0.9207953, 5.217981, 1, 0, 0.7333333, 1,
1.224728, -0.8972935, 1.773421, 1, 0, 0.7254902, 1,
1.22525, 0.1496944, 0.05077849, 1, 0, 0.7215686, 1,
1.227016, 2.214975, 1.098109, 1, 0, 0.7137255, 1,
1.232574, 1.035065, 0.5982187, 1, 0, 0.7098039, 1,
1.233092, 0.2261179, 2.84402, 1, 0, 0.7019608, 1,
1.233672, -0.1435055, 2.628961, 1, 0, 0.6941177, 1,
1.236145, -0.009394942, 1.281781, 1, 0, 0.6901961, 1,
1.240286, -0.146517, 2.627263, 1, 0, 0.682353, 1,
1.243607, -0.38891, 0.126763, 1, 0, 0.6784314, 1,
1.244757, -0.7793686, 0.6738152, 1, 0, 0.6705883, 1,
1.250338, -1.37926, 3.924683, 1, 0, 0.6666667, 1,
1.255344, -1.483621, 3.962391, 1, 0, 0.6588235, 1,
1.255838, -0.6427709, 0.8652348, 1, 0, 0.654902, 1,
1.258967, 1.021734, 1.537947, 1, 0, 0.6470588, 1,
1.265729, 2.078428, 1.449963, 1, 0, 0.6431373, 1,
1.267212, 0.4694603, 1.975355, 1, 0, 0.6352941, 1,
1.278692, -0.6236215, 3.673997, 1, 0, 0.6313726, 1,
1.278832, -0.9840813, 1.42294, 1, 0, 0.6235294, 1,
1.280139, 0.5755655, 1.226385, 1, 0, 0.6196079, 1,
1.289056, -0.238778, 3.241147, 1, 0, 0.6117647, 1,
1.290952, -0.9580804, 2.636389, 1, 0, 0.6078432, 1,
1.294756, -0.7060848, 3.102368, 1, 0, 0.6, 1,
1.297402, -1.544957, 2.728699, 1, 0, 0.5921569, 1,
1.299966, 1.99043, 1.371341, 1, 0, 0.5882353, 1,
1.30546, -0.2070471, 1.393393, 1, 0, 0.5803922, 1,
1.310382, -1.249053, 2.301378, 1, 0, 0.5764706, 1,
1.320181, -0.1769441, 2.373663, 1, 0, 0.5686275, 1,
1.34668, -0.5019693, 0.7561325, 1, 0, 0.5647059, 1,
1.363506, 0.5947554, 1.143662, 1, 0, 0.5568628, 1,
1.389913, -1.181306, 3.214792, 1, 0, 0.5529412, 1,
1.392928, -0.1290089, 1.280204, 1, 0, 0.5450981, 1,
1.394009, 0.1429644, 0.8179947, 1, 0, 0.5411765, 1,
1.401946, 0.1501054, 2.567225, 1, 0, 0.5333334, 1,
1.402804, -1.196681, 3.194666, 1, 0, 0.5294118, 1,
1.405429, 0.5351396, 0.8060817, 1, 0, 0.5215687, 1,
1.406205, -0.4393936, 1.653104, 1, 0, 0.5176471, 1,
1.408452, 1.214536, 0.5378656, 1, 0, 0.509804, 1,
1.410288, -2.016901, 3.113013, 1, 0, 0.5058824, 1,
1.415514, 0.5300908, 0.2508859, 1, 0, 0.4980392, 1,
1.415935, 1.174074, 1.754179, 1, 0, 0.4901961, 1,
1.423204, 0.09849422, 2.446029, 1, 0, 0.4862745, 1,
1.424103, 0.5103596, 1.774524, 1, 0, 0.4784314, 1,
1.425482, 0.6147349, 0.2273829, 1, 0, 0.4745098, 1,
1.436375, -0.8141779, 2.37565, 1, 0, 0.4666667, 1,
1.447315, 0.5961229, -0.6226901, 1, 0, 0.4627451, 1,
1.451207, -1.204024, 1.023888, 1, 0, 0.454902, 1,
1.465175, 0.4327985, 1.241076, 1, 0, 0.4509804, 1,
1.471073, 0.9668121, -0.3183057, 1, 0, 0.4431373, 1,
1.478228, -0.8604026, 0.9409927, 1, 0, 0.4392157, 1,
1.480766, 0.1223582, 1.701912, 1, 0, 0.4313726, 1,
1.488872, -1.379296, 2.900556, 1, 0, 0.427451, 1,
1.492705, -0.09462067, 0.9747618, 1, 0, 0.4196078, 1,
1.498165, -0.2927875, 1.148032, 1, 0, 0.4156863, 1,
1.50326, -1.061109, 1.923473, 1, 0, 0.4078431, 1,
1.50497, -0.0353574, 0.814709, 1, 0, 0.4039216, 1,
1.514469, 0.09974037, 1.510741, 1, 0, 0.3960784, 1,
1.515908, -0.1808131, 1.031979, 1, 0, 0.3882353, 1,
1.531802, 0.1402394, 0.2258997, 1, 0, 0.3843137, 1,
1.546072, 0.937892, 0.6159834, 1, 0, 0.3764706, 1,
1.561887, -0.7230716, 0.8592061, 1, 0, 0.372549, 1,
1.577642, 0.2735779, 0.3893739, 1, 0, 0.3647059, 1,
1.615252, -0.1869109, 1.576587, 1, 0, 0.3607843, 1,
1.625099, 1.209962, 0.6043007, 1, 0, 0.3529412, 1,
1.629738, -0.8046663, 2.824956, 1, 0, 0.3490196, 1,
1.637831, 1.997302, 0.2605752, 1, 0, 0.3411765, 1,
1.64286, 1.74229, -0.4330125, 1, 0, 0.3372549, 1,
1.643797, -1.640303, 0.7756174, 1, 0, 0.3294118, 1,
1.655629, 1.420556, 1.157375, 1, 0, 0.3254902, 1,
1.666352, 0.3866338, 2.155514, 1, 0, 0.3176471, 1,
1.669474, 0.4760229, -0.3983282, 1, 0, 0.3137255, 1,
1.671217, 0.9468554, 0.9782039, 1, 0, 0.3058824, 1,
1.703182, 0.2255877, 1.874112, 1, 0, 0.2980392, 1,
1.708998, 0.8001674, 0.9609348, 1, 0, 0.2941177, 1,
1.711257, -0.3178383, 2.741137, 1, 0, 0.2862745, 1,
1.729921, -0.7538231, 3.158873, 1, 0, 0.282353, 1,
1.73128, -2.126246, 2.476567, 1, 0, 0.2745098, 1,
1.738037, -1.396966, 3.062178, 1, 0, 0.2705882, 1,
1.738694, -1.123151, 0.2595712, 1, 0, 0.2627451, 1,
1.741396, 0.1125469, 0.981613, 1, 0, 0.2588235, 1,
1.750912, 2.653401, 0.6664727, 1, 0, 0.2509804, 1,
1.762215, -0.2497275, 3.95808, 1, 0, 0.2470588, 1,
1.764135, 1.983367, 0.7509811, 1, 0, 0.2392157, 1,
1.771012, -0.5707906, 0.3589572, 1, 0, 0.2352941, 1,
1.773649, 0.2933387, 0.02391934, 1, 0, 0.227451, 1,
1.77425, -0.4056653, 2.968839, 1, 0, 0.2235294, 1,
1.8547, 0.6291463, 0.6343204, 1, 0, 0.2156863, 1,
1.861604, 0.3101288, 1.383611, 1, 0, 0.2117647, 1,
1.88229, -0.7080643, 0.8131534, 1, 0, 0.2039216, 1,
1.900567, 0.4536893, 0.02846754, 1, 0, 0.1960784, 1,
1.906774, -0.1267236, 0.545013, 1, 0, 0.1921569, 1,
1.909409, -0.2732652, 1.185386, 1, 0, 0.1843137, 1,
1.913349, 0.01365971, 1.359646, 1, 0, 0.1803922, 1,
1.946658, 1.31944, 0.639344, 1, 0, 0.172549, 1,
1.959399, 0.50527, 2.224799, 1, 0, 0.1686275, 1,
1.960128, 1.526207, 0.9118083, 1, 0, 0.1607843, 1,
1.968327, 0.7323608, 0.698291, 1, 0, 0.1568628, 1,
1.985953, -2.771666, 2.6335, 1, 0, 0.1490196, 1,
2.016285, 0.2754152, 1.60971, 1, 0, 0.145098, 1,
2.05933, 0.2073732, 2.684234, 1, 0, 0.1372549, 1,
2.060452, -1.588788, 3.768703, 1, 0, 0.1333333, 1,
2.132188, -0.3345718, 3.344685, 1, 0, 0.1254902, 1,
2.139458, -0.4322294, 1.04253, 1, 0, 0.1215686, 1,
2.208781, 2.180608, 1.667346, 1, 0, 0.1137255, 1,
2.248306, -0.8770901, 1.611758, 1, 0, 0.1098039, 1,
2.26387, -0.3901391, 2.086057, 1, 0, 0.1019608, 1,
2.272782, 0.2310224, -0.01651075, 1, 0, 0.09411765, 1,
2.396005, -0.04464551, 1.77741, 1, 0, 0.09019608, 1,
2.415637, -0.3216179, 1.447706, 1, 0, 0.08235294, 1,
2.435589, -1.201519, 2.13058, 1, 0, 0.07843138, 1,
2.445664, -0.1964635, 1.467744, 1, 0, 0.07058824, 1,
2.460108, -0.06700581, 2.28587, 1, 0, 0.06666667, 1,
2.551286, 1.285227, 1.921886, 1, 0, 0.05882353, 1,
2.666149, 1.749863, 1.718655, 1, 0, 0.05490196, 1,
2.687364, 1.788011, 0.7459049, 1, 0, 0.04705882, 1,
2.690814, 0.677731, 2.58105, 1, 0, 0.04313726, 1,
2.773557, -0.4791598, 0.4554929, 1, 0, 0.03529412, 1,
2.788633, -1.548333, 0.1710714, 1, 0, 0.03137255, 1,
2.85928, 1.809446, 0.6612692, 1, 0, 0.02352941, 1,
2.942767, 0.2217619, 1.78197, 1, 0, 0.01960784, 1,
3.220713, 2.034103, 1.687464, 1, 0, 0.01176471, 1,
3.276704, -0.5843006, -0.1385371, 1, 0, 0.007843138, 1
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
-0.4332253, -4.51083, -7.209971, 0, -0.5, 0.5, 0.5,
-0.4332253, -4.51083, -7.209971, 1, -0.5, 0.5, 0.5,
-0.4332253, -4.51083, -7.209971, 1, 1.5, 0.5, 0.5,
-0.4332253, -4.51083, -7.209971, 0, 1.5, 0.5, 0.5
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
-5.400821, -0.1382983, -7.209971, 0, -0.5, 0.5, 0.5,
-5.400821, -0.1382983, -7.209971, 1, -0.5, 0.5, 0.5,
-5.400821, -0.1382983, -7.209971, 1, 1.5, 0.5, 0.5,
-5.400821, -0.1382983, -7.209971, 0, 1.5, 0.5, 0.5
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
-5.400821, -4.51083, -0.04467845, 0, -0.5, 0.5, 0.5,
-5.400821, -4.51083, -0.04467845, 1, -0.5, 0.5, 0.5,
-5.400821, -4.51083, -0.04467845, 1, 1.5, 0.5, 0.5,
-5.400821, -4.51083, -0.04467845, 0, 1.5, 0.5, 0.5
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
-4, -3.501784, -5.556442,
2, -3.501784, -5.556442,
-4, -3.501784, -5.556442,
-4, -3.669959, -5.83203,
-2, -3.501784, -5.556442,
-2, -3.669959, -5.83203,
0, -3.501784, -5.556442,
0, -3.669959, -5.83203,
2, -3.501784, -5.556442,
2, -3.669959, -5.83203
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
-4, -4.006307, -6.383206, 0, -0.5, 0.5, 0.5,
-4, -4.006307, -6.383206, 1, -0.5, 0.5, 0.5,
-4, -4.006307, -6.383206, 1, 1.5, 0.5, 0.5,
-4, -4.006307, -6.383206, 0, 1.5, 0.5, 0.5,
-2, -4.006307, -6.383206, 0, -0.5, 0.5, 0.5,
-2, -4.006307, -6.383206, 1, -0.5, 0.5, 0.5,
-2, -4.006307, -6.383206, 1, 1.5, 0.5, 0.5,
-2, -4.006307, -6.383206, 0, 1.5, 0.5, 0.5,
0, -4.006307, -6.383206, 0, -0.5, 0.5, 0.5,
0, -4.006307, -6.383206, 1, -0.5, 0.5, 0.5,
0, -4.006307, -6.383206, 1, 1.5, 0.5, 0.5,
0, -4.006307, -6.383206, 0, 1.5, 0.5, 0.5,
2, -4.006307, -6.383206, 0, -0.5, 0.5, 0.5,
2, -4.006307, -6.383206, 1, -0.5, 0.5, 0.5,
2, -4.006307, -6.383206, 1, 1.5, 0.5, 0.5,
2, -4.006307, -6.383206, 0, 1.5, 0.5, 0.5
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
-4.254453, -3, -5.556442,
-4.254453, 3, -5.556442,
-4.254453, -3, -5.556442,
-4.445514, -3, -5.83203,
-4.254453, -2, -5.556442,
-4.445514, -2, -5.83203,
-4.254453, -1, -5.556442,
-4.445514, -1, -5.83203,
-4.254453, 0, -5.556442,
-4.445514, 0, -5.83203,
-4.254453, 1, -5.556442,
-4.445514, 1, -5.83203,
-4.254453, 2, -5.556442,
-4.445514, 2, -5.83203,
-4.254453, 3, -5.556442,
-4.445514, 3, -5.83203
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
-4.827637, -3, -6.383206, 0, -0.5, 0.5, 0.5,
-4.827637, -3, -6.383206, 1, -0.5, 0.5, 0.5,
-4.827637, -3, -6.383206, 1, 1.5, 0.5, 0.5,
-4.827637, -3, -6.383206, 0, 1.5, 0.5, 0.5,
-4.827637, -2, -6.383206, 0, -0.5, 0.5, 0.5,
-4.827637, -2, -6.383206, 1, -0.5, 0.5, 0.5,
-4.827637, -2, -6.383206, 1, 1.5, 0.5, 0.5,
-4.827637, -2, -6.383206, 0, 1.5, 0.5, 0.5,
-4.827637, -1, -6.383206, 0, -0.5, 0.5, 0.5,
-4.827637, -1, -6.383206, 1, -0.5, 0.5, 0.5,
-4.827637, -1, -6.383206, 1, 1.5, 0.5, 0.5,
-4.827637, -1, -6.383206, 0, 1.5, 0.5, 0.5,
-4.827637, 0, -6.383206, 0, -0.5, 0.5, 0.5,
-4.827637, 0, -6.383206, 1, -0.5, 0.5, 0.5,
-4.827637, 0, -6.383206, 1, 1.5, 0.5, 0.5,
-4.827637, 0, -6.383206, 0, 1.5, 0.5, 0.5,
-4.827637, 1, -6.383206, 0, -0.5, 0.5, 0.5,
-4.827637, 1, -6.383206, 1, -0.5, 0.5, 0.5,
-4.827637, 1, -6.383206, 1, 1.5, 0.5, 0.5,
-4.827637, 1, -6.383206, 0, 1.5, 0.5, 0.5,
-4.827637, 2, -6.383206, 0, -0.5, 0.5, 0.5,
-4.827637, 2, -6.383206, 1, -0.5, 0.5, 0.5,
-4.827637, 2, -6.383206, 1, 1.5, 0.5, 0.5,
-4.827637, 2, -6.383206, 0, 1.5, 0.5, 0.5,
-4.827637, 3, -6.383206, 0, -0.5, 0.5, 0.5,
-4.827637, 3, -6.383206, 1, -0.5, 0.5, 0.5,
-4.827637, 3, -6.383206, 1, 1.5, 0.5, 0.5,
-4.827637, 3, -6.383206, 0, 1.5, 0.5, 0.5
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
-4.254453, -3.501784, -4,
-4.254453, -3.501784, 4,
-4.254453, -3.501784, -4,
-4.445514, -3.669959, -4,
-4.254453, -3.501784, -2,
-4.445514, -3.669959, -2,
-4.254453, -3.501784, 0,
-4.445514, -3.669959, 0,
-4.254453, -3.501784, 2,
-4.445514, -3.669959, 2,
-4.254453, -3.501784, 4,
-4.445514, -3.669959, 4
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
-4.827637, -4.006307, -4, 0, -0.5, 0.5, 0.5,
-4.827637, -4.006307, -4, 1, -0.5, 0.5, 0.5,
-4.827637, -4.006307, -4, 1, 1.5, 0.5, 0.5,
-4.827637, -4.006307, -4, 0, 1.5, 0.5, 0.5,
-4.827637, -4.006307, -2, 0, -0.5, 0.5, 0.5,
-4.827637, -4.006307, -2, 1, -0.5, 0.5, 0.5,
-4.827637, -4.006307, -2, 1, 1.5, 0.5, 0.5,
-4.827637, -4.006307, -2, 0, 1.5, 0.5, 0.5,
-4.827637, -4.006307, 0, 0, -0.5, 0.5, 0.5,
-4.827637, -4.006307, 0, 1, -0.5, 0.5, 0.5,
-4.827637, -4.006307, 0, 1, 1.5, 0.5, 0.5,
-4.827637, -4.006307, 0, 0, 1.5, 0.5, 0.5,
-4.827637, -4.006307, 2, 0, -0.5, 0.5, 0.5,
-4.827637, -4.006307, 2, 1, -0.5, 0.5, 0.5,
-4.827637, -4.006307, 2, 1, 1.5, 0.5, 0.5,
-4.827637, -4.006307, 2, 0, 1.5, 0.5, 0.5,
-4.827637, -4.006307, 4, 0, -0.5, 0.5, 0.5,
-4.827637, -4.006307, 4, 1, -0.5, 0.5, 0.5,
-4.827637, -4.006307, 4, 1, 1.5, 0.5, 0.5,
-4.827637, -4.006307, 4, 0, 1.5, 0.5, 0.5
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
-4.254453, -3.501784, -5.556442,
-4.254453, 3.225188, -5.556442,
-4.254453, -3.501784, 5.467085,
-4.254453, 3.225188, 5.467085,
-4.254453, -3.501784, -5.556442,
-4.254453, -3.501784, 5.467085,
-4.254453, 3.225188, -5.556442,
-4.254453, 3.225188, 5.467085,
-4.254453, -3.501784, -5.556442,
3.388002, -3.501784, -5.556442,
-4.254453, -3.501784, 5.467085,
3.388002, -3.501784, 5.467085,
-4.254453, 3.225188, -5.556442,
3.388002, 3.225188, -5.556442,
-4.254453, 3.225188, 5.467085,
3.388002, 3.225188, 5.467085,
3.388002, -3.501784, -5.556442,
3.388002, 3.225188, -5.556442,
3.388002, -3.501784, 5.467085,
3.388002, 3.225188, 5.467085,
3.388002, -3.501784, -5.556442,
3.388002, -3.501784, 5.467085,
3.388002, 3.225188, -5.556442,
3.388002, 3.225188, 5.467085
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
var radius = 8.012866;
var distance = 35.65015;
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
mvMatrix.translate( 0.4332253, 0.1382983, 0.04467845 );
mvMatrix.scale( 1.133624, 1.2879, 0.7859252 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.65015);
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
fludioxonil<-read.table("fludioxonil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fludioxonil$V2
```

```
## Error in eval(expr, envir, enclos): object 'fludioxonil' not found
```

```r
y<-fludioxonil$V3
```

```
## Error in eval(expr, envir, enclos): object 'fludioxonil' not found
```

```r
z<-fludioxonil$V4
```

```
## Error in eval(expr, envir, enclos): object 'fludioxonil' not found
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
-4.143155, -0.5053173, -2.082713, 0, 0, 1, 1, 1,
-3.04179, 0.8090151, -1.726714, 1, 0, 0, 1, 1,
-2.69558, -0.6311914, -1.614853, 1, 0, 0, 1, 1,
-2.690701, 0.8639014, -2.080236, 1, 0, 0, 1, 1,
-2.64542, -1.177658, -2.878843, 1, 0, 0, 1, 1,
-2.591938, -0.2925069, -0.2756317, 1, 0, 0, 1, 1,
-2.558341, 1.589448, -1.1193, 0, 0, 0, 1, 1,
-2.471884, 0.7794995, -1.705442, 0, 0, 0, 1, 1,
-2.381821, -1.061541, -2.152227, 0, 0, 0, 1, 1,
-2.35497, 0.476037, 0.2762068, 0, 0, 0, 1, 1,
-2.324218, 0.4602997, -0.9533069, 0, 0, 0, 1, 1,
-2.244958, 0.0678078, -0.09236015, 0, 0, 0, 1, 1,
-2.231954, -0.2428603, -1.418726, 0, 0, 0, 1, 1,
-2.098903, 1.847623, -1.026056, 1, 1, 1, 1, 1,
-2.040032, -1.224973, -2.18256, 1, 1, 1, 1, 1,
-2.033165, -1.066797, -1.193842, 1, 1, 1, 1, 1,
-2.012607, -1.089581, -2.753741, 1, 1, 1, 1, 1,
-2.012508, -0.8705752, -2.142557, 1, 1, 1, 1, 1,
-2.009495, 0.2114682, -0.4827408, 1, 1, 1, 1, 1,
-1.974001, 0.4888229, -2.458676, 1, 1, 1, 1, 1,
-1.972079, 0.3218382, -1.240551, 1, 1, 1, 1, 1,
-1.961797, 0.05487548, -2.31548, 1, 1, 1, 1, 1,
-1.959265, -0.617326, -1.803842, 1, 1, 1, 1, 1,
-1.933029, -1.217989, -0.1623664, 1, 1, 1, 1, 1,
-1.874062, 1.243436, 0.1494547, 1, 1, 1, 1, 1,
-1.867966, 0.8682232, -1.732083, 1, 1, 1, 1, 1,
-1.863356, -0.6161451, -2.569743, 1, 1, 1, 1, 1,
-1.860512, -1.061889, -1.770768, 1, 1, 1, 1, 1,
-1.853637, 1.544207, -0.4888364, 0, 0, 1, 1, 1,
-1.839541, -0.4613963, -2.036437, 1, 0, 0, 1, 1,
-1.817107, 1.206904, -0.8112444, 1, 0, 0, 1, 1,
-1.800659, 1.508767, -2.258798, 1, 0, 0, 1, 1,
-1.785319, 0.4722456, -0.8840476, 1, 0, 0, 1, 1,
-1.777128, 2.239504, 0.0110649, 1, 0, 0, 1, 1,
-1.771585, 0.5776857, -1.872283, 0, 0, 0, 1, 1,
-1.769112, 1.444933, -0.04867524, 0, 0, 0, 1, 1,
-1.747224, 0.004653232, -1.519273, 0, 0, 0, 1, 1,
-1.736375, -0.4023235, -0.3431785, 0, 0, 0, 1, 1,
-1.708629, -0.01560928, -1.317978, 0, 0, 0, 1, 1,
-1.697286, 1.27434, -0.9784312, 0, 0, 0, 1, 1,
-1.673888, 1.096697, -0.3756548, 0, 0, 0, 1, 1,
-1.656328, 1.027046, -2.281208, 1, 1, 1, 1, 1,
-1.641384, 1.56787, 0.4869059, 1, 1, 1, 1, 1,
-1.629243, 0.1210033, -1.194435, 1, 1, 1, 1, 1,
-1.628799, 0.2953917, -0.8846179, 1, 1, 1, 1, 1,
-1.618645, -1.042949, -1.328873, 1, 1, 1, 1, 1,
-1.611004, 0.2368685, -1.096346, 1, 1, 1, 1, 1,
-1.593911, -0.1409243, -2.454311, 1, 1, 1, 1, 1,
-1.59334, 0.6040182, -1.251288, 1, 1, 1, 1, 1,
-1.58094, -0.1514393, -0.08426155, 1, 1, 1, 1, 1,
-1.558041, 0.2141308, -2.016677, 1, 1, 1, 1, 1,
-1.551851, -1.403104, -3.204353, 1, 1, 1, 1, 1,
-1.541878, -1.106708, -2.887989, 1, 1, 1, 1, 1,
-1.536332, 0.6642488, 0.09103931, 1, 1, 1, 1, 1,
-1.534632, 0.00870094, -4.779844, 1, 1, 1, 1, 1,
-1.531709, -0.06471141, -2.845498, 1, 1, 1, 1, 1,
-1.528945, 1.379469, -0.585822, 0, 0, 1, 1, 1,
-1.524741, 0.6017903, 1.392176, 1, 0, 0, 1, 1,
-1.520982, -0.3940271, -3.105274, 1, 0, 0, 1, 1,
-1.517588, 0.05930119, -2.11531, 1, 0, 0, 1, 1,
-1.51479, 0.2387112, -0.5628763, 1, 0, 0, 1, 1,
-1.514365, -0.7057994, -1.959638, 1, 0, 0, 1, 1,
-1.505511, -0.0766366, -2.409456, 0, 0, 0, 1, 1,
-1.502679, -1.782778, -1.452112, 0, 0, 0, 1, 1,
-1.501768, -0.6257963, -0.9512333, 0, 0, 0, 1, 1,
-1.501422, 0.357585, -0.4926051, 0, 0, 0, 1, 1,
-1.496927, 0.8497036, -0.4913425, 0, 0, 0, 1, 1,
-1.475498, -1.74023, -1.918907, 0, 0, 0, 1, 1,
-1.472355, 0.8156845, -1.382859, 0, 0, 0, 1, 1,
-1.463128, 0.8184217, -0.7230827, 1, 1, 1, 1, 1,
-1.451339, 0.4570315, -1.583582, 1, 1, 1, 1, 1,
-1.437886, 0.6929725, -2.001169, 1, 1, 1, 1, 1,
-1.436731, -0.7224113, -2.633435, 1, 1, 1, 1, 1,
-1.43118, 0.1525896, -1.50063, 1, 1, 1, 1, 1,
-1.41425, 0.02410934, -1.519881, 1, 1, 1, 1, 1,
-1.412509, -0.7738317, -2.060264, 1, 1, 1, 1, 1,
-1.409247, 1.590964, -0.02884044, 1, 1, 1, 1, 1,
-1.405419, 0.7752467, -1.013518, 1, 1, 1, 1, 1,
-1.403986, 1.003738, 0.0902609, 1, 1, 1, 1, 1,
-1.391412, -0.3289948, -2.219948, 1, 1, 1, 1, 1,
-1.390087, 1.572191, -0.7610871, 1, 1, 1, 1, 1,
-1.389778, 0.05831067, -2.853082, 1, 1, 1, 1, 1,
-1.383493, -0.5212733, -2.719205, 1, 1, 1, 1, 1,
-1.375096, -0.05483864, -0.6918311, 1, 1, 1, 1, 1,
-1.369256, 0.4910696, -1.591781, 0, 0, 1, 1, 1,
-1.368732, -0.484109, -0.5565051, 1, 0, 0, 1, 1,
-1.363765, 1.036927, -1.848866, 1, 0, 0, 1, 1,
-1.334104, -0.1969004, -0.7772949, 1, 0, 0, 1, 1,
-1.31943, 0.1685242, -0.6529363, 1, 0, 0, 1, 1,
-1.316128, -0.008838207, -2.16897, 1, 0, 0, 1, 1,
-1.315606, -0.7559348, -2.820104, 0, 0, 0, 1, 1,
-1.306258, 1.967766, 0.4606211, 0, 0, 0, 1, 1,
-1.302632, -0.536293, -2.403482, 0, 0, 0, 1, 1,
-1.297371, 1.324126, -0.5514134, 0, 0, 0, 1, 1,
-1.296634, -0.5274919, -1.021093, 0, 0, 0, 1, 1,
-1.296464, -1.338179, -2.283874, 0, 0, 0, 1, 1,
-1.291133, 0.1379235, -2.962408, 0, 0, 0, 1, 1,
-1.289113, -0.5636461, -2.648105, 1, 1, 1, 1, 1,
-1.28498, 0.7792599, -1.131919, 1, 1, 1, 1, 1,
-1.28105, -0.2180935, -2.223321, 1, 1, 1, 1, 1,
-1.279578, 0.09234215, -1.914656, 1, 1, 1, 1, 1,
-1.272992, 0.3834715, -1.320237, 1, 1, 1, 1, 1,
-1.267105, -0.5926211, -2.637486, 1, 1, 1, 1, 1,
-1.248158, 0.5931912, -1.042292, 1, 1, 1, 1, 1,
-1.237341, 0.5432914, -1.381396, 1, 1, 1, 1, 1,
-1.229846, -1.628727, -3.524375, 1, 1, 1, 1, 1,
-1.22491, 0.1023581, -2.309972, 1, 1, 1, 1, 1,
-1.224809, -1.711246, -3.482824, 1, 1, 1, 1, 1,
-1.221925, -0.7513331, -0.1037454, 1, 1, 1, 1, 1,
-1.220866, -0.5344342, -1.612338, 1, 1, 1, 1, 1,
-1.210153, 1.157011, -0.3546042, 1, 1, 1, 1, 1,
-1.20844, -2.102014, -2.060958, 1, 1, 1, 1, 1,
-1.208081, 0.1026101, -1.047711, 0, 0, 1, 1, 1,
-1.198818, -0.5744148, -1.893898, 1, 0, 0, 1, 1,
-1.198374, -0.02318054, -0.395075, 1, 0, 0, 1, 1,
-1.196585, 0.6250075, 0.9504945, 1, 0, 0, 1, 1,
-1.190983, -0.2631944, -3.169323, 1, 0, 0, 1, 1,
-1.183241, 0.8353524, -1.82998, 1, 0, 0, 1, 1,
-1.181778, 0.4928972, -1.610298, 0, 0, 0, 1, 1,
-1.179857, 0.4582152, 0.4778011, 0, 0, 0, 1, 1,
-1.179274, -0.6301724, -2.559772, 0, 0, 0, 1, 1,
-1.175238, -1.867801, -2.750823, 0, 0, 0, 1, 1,
-1.172674, 0.7019933, -1.085459, 0, 0, 0, 1, 1,
-1.167429, -0.09542397, -2.812975, 0, 0, 0, 1, 1,
-1.162262, 1.549947, -1.061417, 0, 0, 0, 1, 1,
-1.157813, -0.7715303, -1.506046, 1, 1, 1, 1, 1,
-1.155306, -0.7913112, -2.759135, 1, 1, 1, 1, 1,
-1.143551, -1.235886, -3.628369, 1, 1, 1, 1, 1,
-1.141774, 0.4169714, -0.08503579, 1, 1, 1, 1, 1,
-1.137936, 0.1166344, -1.919574, 1, 1, 1, 1, 1,
-1.129664, -1.138568, -1.929709, 1, 1, 1, 1, 1,
-1.128764, 0.692768, -1.079071, 1, 1, 1, 1, 1,
-1.120669, 2.366029, -0.1059993, 1, 1, 1, 1, 1,
-1.116689, 0.6088129, -2.439109, 1, 1, 1, 1, 1,
-1.113828, -0.7964854, -2.952092, 1, 1, 1, 1, 1,
-1.113695, 0.9163936, -2.033741, 1, 1, 1, 1, 1,
-1.112208, 0.1151812, -1.496802, 1, 1, 1, 1, 1,
-1.109132, -2.774289, -3.634616, 1, 1, 1, 1, 1,
-1.107512, -0.4884363, -2.313795, 1, 1, 1, 1, 1,
-1.10458, 0.1605647, -3.075685, 1, 1, 1, 1, 1,
-1.104022, -0.819377, -1.885287, 0, 0, 1, 1, 1,
-1.102019, -2.110035, -1.392771, 1, 0, 0, 1, 1,
-1.097564, 1.338417, 0.3565416, 1, 0, 0, 1, 1,
-1.088204, 1.452624, 0.7532365, 1, 0, 0, 1, 1,
-1.081409, -0.5171844, -0.9378242, 1, 0, 0, 1, 1,
-1.061051, -3.056907, -3.67567, 1, 0, 0, 1, 1,
-1.05572, -0.07639461, -1.012151, 0, 0, 0, 1, 1,
-1.048801, 0.9152969, -0.9450753, 0, 0, 0, 1, 1,
-1.045183, 1.130809, 0.5649327, 0, 0, 0, 1, 1,
-1.040559, -0.2896565, -1.311382, 0, 0, 0, 1, 1,
-1.039008, 0.454058, -1.230101, 0, 0, 0, 1, 1,
-1.035277, 0.7355609, 0.1360552, 0, 0, 0, 1, 1,
-1.024019, -0.07446793, -2.935551, 0, 0, 0, 1, 1,
-1.019243, -0.3762478, -1.527621, 1, 1, 1, 1, 1,
-1.018894, -0.4389192, -2.143867, 1, 1, 1, 1, 1,
-1.018424, -0.02057818, -1.191145, 1, 1, 1, 1, 1,
-1.013798, -1.416916, -1.344091, 1, 1, 1, 1, 1,
-1.008365, 0.02321807, -0.5209498, 1, 1, 1, 1, 1,
-1.005904, 0.452477, -1.694168, 1, 1, 1, 1, 1,
-1.002449, -1.016633, -3.284865, 1, 1, 1, 1, 1,
-0.9952124, -1.452499, -2.477228, 1, 1, 1, 1, 1,
-0.9905685, 1.293921, -0.03093517, 1, 1, 1, 1, 1,
-0.9880829, -1.593941, -0.8683358, 1, 1, 1, 1, 1,
-0.9786108, -1.47002, -2.5533, 1, 1, 1, 1, 1,
-0.9711292, 0.0398355, -0.9535304, 1, 1, 1, 1, 1,
-0.9594179, -0.2850319, -2.933585, 1, 1, 1, 1, 1,
-0.9571092, -1.088488, -1.575016, 1, 1, 1, 1, 1,
-0.9509634, -1.841916, -0.6798372, 1, 1, 1, 1, 1,
-0.9506133, 0.6583821, -1.464429, 0, 0, 1, 1, 1,
-0.9492875, -0.2834978, -0.2958341, 1, 0, 0, 1, 1,
-0.9458346, 0.3064827, -0.652115, 1, 0, 0, 1, 1,
-0.9387733, 0.207103, -0.6589521, 1, 0, 0, 1, 1,
-0.9260314, 0.2238521, -1.978776, 1, 0, 0, 1, 1,
-0.9232706, -0.1423742, -2.419721, 1, 0, 0, 1, 1,
-0.9200898, -0.2978779, -1.767141, 0, 0, 0, 1, 1,
-0.912025, 0.0819603, -1.235562, 0, 0, 0, 1, 1,
-0.911966, 2.266896, -1.42587, 0, 0, 0, 1, 1,
-0.9087282, -0.4755294, -0.4363745, 0, 0, 0, 1, 1,
-0.9073392, -0.1278452, -0.4450732, 0, 0, 0, 1, 1,
-0.9024883, -0.1584748, -2.000115, 0, 0, 0, 1, 1,
-0.9019046, 2.231309, -0.9834283, 0, 0, 0, 1, 1,
-0.9018436, 0.4239754, -0.9908177, 1, 1, 1, 1, 1,
-0.9016514, -0.6298423, -1.353697, 1, 1, 1, 1, 1,
-0.9005641, 1.420019, -1.120787, 1, 1, 1, 1, 1,
-0.8934764, -0.5828563, -3.681371, 1, 1, 1, 1, 1,
-0.8846521, -0.4492681, -2.070976, 1, 1, 1, 1, 1,
-0.8784816, -1.230524, -1.042826, 1, 1, 1, 1, 1,
-0.8757464, 0.752834, -0.647285, 1, 1, 1, 1, 1,
-0.8747454, 0.1376326, -0.9966794, 1, 1, 1, 1, 1,
-0.8725326, -0.4074088, -1.672386, 1, 1, 1, 1, 1,
-0.8719898, -1.083336, -2.529168, 1, 1, 1, 1, 1,
-0.8635569, -1.09726, -2.822007, 1, 1, 1, 1, 1,
-0.8625589, -1.534204, -4.316924, 1, 1, 1, 1, 1,
-0.8592477, -0.2356285, -1.439217, 1, 1, 1, 1, 1,
-0.8584235, -2.334291, -2.638913, 1, 1, 1, 1, 1,
-0.8546734, 2.492152, 0.8037115, 1, 1, 1, 1, 1,
-0.8339106, 0.2088386, -0.942584, 0, 0, 1, 1, 1,
-0.8330467, -0.4596889, -2.387982, 1, 0, 0, 1, 1,
-0.8330271, 1.300443, -1.563945, 1, 0, 0, 1, 1,
-0.829291, 0.9561398, -0.5151972, 1, 0, 0, 1, 1,
-0.820513, 0.6416662, 0.4004565, 1, 0, 0, 1, 1,
-0.8180877, 0.02070375, -1.780905, 1, 0, 0, 1, 1,
-0.8152725, 0.7314907, -0.8992687, 0, 0, 0, 1, 1,
-0.8145095, -1.031097, -2.412681, 0, 0, 0, 1, 1,
-0.8143811, -1.018031, -2.873331, 0, 0, 0, 1, 1,
-0.8123628, -0.374441, -0.830492, 0, 0, 0, 1, 1,
-0.8058034, -0.4836357, -3.163547, 0, 0, 0, 1, 1,
-0.8020781, 0.1425841, -1.09922, 0, 0, 0, 1, 1,
-0.7975037, -0.3781908, -2.136525, 0, 0, 0, 1, 1,
-0.7960308, -0.9754674, -2.058906, 1, 1, 1, 1, 1,
-0.7893663, -0.970205, -2.737217, 1, 1, 1, 1, 1,
-0.7866677, 1.134553, 1.24024, 1, 1, 1, 1, 1,
-0.7839454, 0.957969, -1.948265, 1, 1, 1, 1, 1,
-0.7781532, -0.8992401, -2.156028, 1, 1, 1, 1, 1,
-0.7731423, 2.01276, -1.193714, 1, 1, 1, 1, 1,
-0.7679396, -0.313293, -0.961886, 1, 1, 1, 1, 1,
-0.7654968, 0.346742, 0.6703572, 1, 1, 1, 1, 1,
-0.7625591, 1.629369, 0.4801738, 1, 1, 1, 1, 1,
-0.7578021, 1.049525, -0.3276876, 1, 1, 1, 1, 1,
-0.7540209, 0.6246117, -0.9787512, 1, 1, 1, 1, 1,
-0.753748, 0.795436, -0.8566702, 1, 1, 1, 1, 1,
-0.7463635, 0.028203, -0.09584279, 1, 1, 1, 1, 1,
-0.7457358, -0.7029045, -4.157064, 1, 1, 1, 1, 1,
-0.7454674, 1.182078, -1.659827, 1, 1, 1, 1, 1,
-0.7415618, 0.8188498, -0.1429823, 0, 0, 1, 1, 1,
-0.7400216, 0.05347373, -1.387936, 1, 0, 0, 1, 1,
-0.7369627, -0.3431289, -1.434685, 1, 0, 0, 1, 1,
-0.7342045, 0.7818219, -0.6080298, 1, 0, 0, 1, 1,
-0.7322852, -0.8994073, -1.119556, 1, 0, 0, 1, 1,
-0.7226582, -0.02928435, -2.167866, 1, 0, 0, 1, 1,
-0.722146, 1.023929, -0.9986224, 0, 0, 0, 1, 1,
-0.7214532, 1.075004, 0.4403547, 0, 0, 0, 1, 1,
-0.7197368, -0.5476905, -1.315035, 0, 0, 0, 1, 1,
-0.7191945, -1.069626, -1.644599, 0, 0, 0, 1, 1,
-0.7183796, -1.327885, -0.1320518, 0, 0, 0, 1, 1,
-0.7176271, -1.2728, -1.879122, 0, 0, 0, 1, 1,
-0.716183, 0.6378107, 0.138876, 0, 0, 0, 1, 1,
-0.7151127, -0.3368768, 0.08204997, 1, 1, 1, 1, 1,
-0.7126178, -0.385603, 0.1841204, 1, 1, 1, 1, 1,
-0.7120215, -0.677158, -0.8586977, 1, 1, 1, 1, 1,
-0.7080237, 2.999273, -0.8172308, 1, 1, 1, 1, 1,
-0.6993107, -0.05629827, -0.9253711, 1, 1, 1, 1, 1,
-0.6972879, 0.70499, -1.161816, 1, 1, 1, 1, 1,
-0.6962005, 0.3258441, 0.167808, 1, 1, 1, 1, 1,
-0.6879099, -0.3376433, -1.561564, 1, 1, 1, 1, 1,
-0.6857176, 1.045517, 0.6145735, 1, 1, 1, 1, 1,
-0.6846625, 1.268436, -2.629255, 1, 1, 1, 1, 1,
-0.6834808, -0.7764891, -1.546464, 1, 1, 1, 1, 1,
-0.6794275, 0.9830083, 0.8102515, 1, 1, 1, 1, 1,
-0.6737628, -0.7085922, -0.9063906, 1, 1, 1, 1, 1,
-0.6714458, -1.294735, -2.944246, 1, 1, 1, 1, 1,
-0.6661257, 0.1262305, -1.724668, 1, 1, 1, 1, 1,
-0.6602463, 0.1424644, -1.745839, 0, 0, 1, 1, 1,
-0.6599784, -0.3909334, -1.770016, 1, 0, 0, 1, 1,
-0.6575026, -0.1858322, -1.916017, 1, 0, 0, 1, 1,
-0.6527331, -1.982116, -5.395905, 1, 0, 0, 1, 1,
-0.65226, -0.9520333, -2.085827, 1, 0, 0, 1, 1,
-0.6505314, 1.578953, 0.2021491, 1, 0, 0, 1, 1,
-0.6457744, -0.3957318, -1.981325, 0, 0, 0, 1, 1,
-0.6443993, -1.763321, -3.844388, 0, 0, 0, 1, 1,
-0.6384316, -0.2513286, -2.833996, 0, 0, 0, 1, 1,
-0.634685, 1.228531, 0.1504711, 0, 0, 0, 1, 1,
-0.6243665, -0.3514218, -3.039871, 0, 0, 0, 1, 1,
-0.6242188, -0.5080576, -4.422793, 0, 0, 0, 1, 1,
-0.6210884, 0.9702367, -1.989855, 0, 0, 0, 1, 1,
-0.6138359, 0.3002013, -3.363599, 1, 1, 1, 1, 1,
-0.5966203, -1.146805, -3.278635, 1, 1, 1, 1, 1,
-0.5939075, -0.3896927, -2.25269, 1, 1, 1, 1, 1,
-0.5907351, 0.4453295, -0.7661255, 1, 1, 1, 1, 1,
-0.590703, -0.1857125, -1.690433, 1, 1, 1, 1, 1,
-0.5893858, 1.043728, -1.422447, 1, 1, 1, 1, 1,
-0.5864531, -0.08391046, -1.204111, 1, 1, 1, 1, 1,
-0.5854478, 0.08526535, -1.182053, 1, 1, 1, 1, 1,
-0.583546, 1.31669, 0.06779189, 1, 1, 1, 1, 1,
-0.5831473, 0.1648991, -1.42231, 1, 1, 1, 1, 1,
-0.5817063, 0.9063286, -1.832936, 1, 1, 1, 1, 1,
-0.5790947, -0.07183424, -2.295197, 1, 1, 1, 1, 1,
-0.5758743, 0.06837279, -4.153799, 1, 1, 1, 1, 1,
-0.5733655, -0.6738593, -2.331042, 1, 1, 1, 1, 1,
-0.5672853, -0.6030327, -2.350703, 1, 1, 1, 1, 1,
-0.5647205, -2.229165, -1.945147, 0, 0, 1, 1, 1,
-0.562124, 0.2766626, -2.006895, 1, 0, 0, 1, 1,
-0.5591632, -0.05808444, -0.9861814, 1, 0, 0, 1, 1,
-0.5549762, 1.977972, -1.971318, 1, 0, 0, 1, 1,
-0.554177, -1.321459, -2.117148, 1, 0, 0, 1, 1,
-0.5481508, 1.570403, -0.5322749, 1, 0, 0, 1, 1,
-0.5476687, 0.1306908, -2.490103, 0, 0, 0, 1, 1,
-0.5475926, -0.3411237, -1.362123, 0, 0, 0, 1, 1,
-0.5456157, 0.0611209, -1.913306, 0, 0, 0, 1, 1,
-0.5405795, 0.3545966, -1.699878, 0, 0, 0, 1, 1,
-0.5402098, 0.8114364, 0.0199933, 0, 0, 0, 1, 1,
-0.537632, -0.696602, -2.073872, 0, 0, 0, 1, 1,
-0.533388, -1.092685, -4.398654, 0, 0, 0, 1, 1,
-0.53187, 1.960136, 2.149921, 1, 1, 1, 1, 1,
-0.5286322, -0.7771939, -0.9615628, 1, 1, 1, 1, 1,
-0.5269863, 1.310134, -1.107383, 1, 1, 1, 1, 1,
-0.5239272, -0.9543774, -3.07833, 1, 1, 1, 1, 1,
-0.5229872, -0.7880269, -2.709165, 1, 1, 1, 1, 1,
-0.5208837, 0.2622922, -1.866531, 1, 1, 1, 1, 1,
-0.5188856, -2.050539, -4.367779, 1, 1, 1, 1, 1,
-0.5170076, 1.075736, -0.9072093, 1, 1, 1, 1, 1,
-0.5084143, 0.3953547, -1.376688, 1, 1, 1, 1, 1,
-0.5037479, 0.8410654, 0.2311493, 1, 1, 1, 1, 1,
-0.4955688, -0.2565367, -3.158306, 1, 1, 1, 1, 1,
-0.4955456, -1.362626, -2.519901, 1, 1, 1, 1, 1,
-0.4910969, -1.584633, -3.381732, 1, 1, 1, 1, 1,
-0.490748, -0.6270915, -2.834524, 1, 1, 1, 1, 1,
-0.4886506, -1.463634, -3.159633, 1, 1, 1, 1, 1,
-0.4871977, -1.457121, -2.838587, 0, 0, 1, 1, 1,
-0.4825797, -0.4106167, -1.183304, 1, 0, 0, 1, 1,
-0.4812726, -0.0008330854, -2.498149, 1, 0, 0, 1, 1,
-0.4781121, -1.070077, -4.155528, 1, 0, 0, 1, 1,
-0.4775888, -0.5676205, -3.406097, 1, 0, 0, 1, 1,
-0.4757794, -1.280995, -3.100252, 1, 0, 0, 1, 1,
-0.4716543, -0.5308723, -2.810959, 0, 0, 0, 1, 1,
-0.4713993, -0.4831075, -1.573626, 0, 0, 0, 1, 1,
-0.4636264, 1.505348, -0.7074411, 0, 0, 0, 1, 1,
-0.4628721, -0.6326261, -4.450946, 0, 0, 0, 1, 1,
-0.4620909, 0.770345, -0.02433294, 0, 0, 0, 1, 1,
-0.4603943, 1.140091, -0.4171003, 0, 0, 0, 1, 1,
-0.4578204, -0.6893483, -2.268525, 0, 0, 0, 1, 1,
-0.4570285, -0.5588149, -1.724765, 1, 1, 1, 1, 1,
-0.4537225, 0.3659416, -1.121968, 1, 1, 1, 1, 1,
-0.4498425, -0.5481543, -1.658064, 1, 1, 1, 1, 1,
-0.4493203, -0.3177001, -2.136753, 1, 1, 1, 1, 1,
-0.4430551, 2.02815, -1.763831, 1, 1, 1, 1, 1,
-0.4422142, 0.4099313, -1.072555, 1, 1, 1, 1, 1,
-0.4407929, -0.9021183, -2.676369, 1, 1, 1, 1, 1,
-0.4364967, -0.05164021, -0.8886037, 1, 1, 1, 1, 1,
-0.4341404, 1.35842, 1.137247, 1, 1, 1, 1, 1,
-0.4327423, -0.676864, -2.839791, 1, 1, 1, 1, 1,
-0.424095, 0.8027669, -0.5301089, 1, 1, 1, 1, 1,
-0.419346, -0.0990544, -3.176057, 1, 1, 1, 1, 1,
-0.4187399, -0.3098942, -2.370134, 1, 1, 1, 1, 1,
-0.416169, -0.6422878, -2.775207, 1, 1, 1, 1, 1,
-0.4149582, -0.1495175, -1.625434, 1, 1, 1, 1, 1,
-0.4144173, -0.1059546, -2.474988, 0, 0, 1, 1, 1,
-0.4135891, 0.7178819, -1.710279, 1, 0, 0, 1, 1,
-0.4112086, -0.1066684, -1.051638, 1, 0, 0, 1, 1,
-0.4059794, -1.306036, -1.007619, 1, 0, 0, 1, 1,
-0.4013331, -0.9012446, -0.5682335, 1, 0, 0, 1, 1,
-0.4005921, 0.1275245, -1.951261, 1, 0, 0, 1, 1,
-0.399747, 1.687245, -0.8032385, 0, 0, 0, 1, 1,
-0.3981154, -0.3298699, -1.356412, 0, 0, 0, 1, 1,
-0.3925003, -0.1694509, -3.484319, 0, 0, 0, 1, 1,
-0.3924163, 0.4719409, -1.571413, 0, 0, 0, 1, 1,
-0.3915903, 1.750684, 0.523451, 0, 0, 0, 1, 1,
-0.38712, 0.5564551, -0.8285154, 0, 0, 0, 1, 1,
-0.3865718, -0.6783729, -1.293928, 0, 0, 0, 1, 1,
-0.3834248, 1.378688, 0.3830471, 1, 1, 1, 1, 1,
-0.3815275, 1.451297, -0.1563722, 1, 1, 1, 1, 1,
-0.380864, 0.9739558, -1.861727, 1, 1, 1, 1, 1,
-0.3805065, -0.4581037, -0.5225947, 1, 1, 1, 1, 1,
-0.3721675, 0.3509961, -0.7680293, 1, 1, 1, 1, 1,
-0.3720154, -0.05795947, -1.990086, 1, 1, 1, 1, 1,
-0.370737, 1.207686, 1.455438, 1, 1, 1, 1, 1,
-0.3642218, 0.01936116, -3.157964, 1, 1, 1, 1, 1,
-0.3591228, -0.7716543, -2.454221, 1, 1, 1, 1, 1,
-0.3583476, -0.724736, -3.178846, 1, 1, 1, 1, 1,
-0.3550315, -0.1166356, -1.60342, 1, 1, 1, 1, 1,
-0.3540907, 0.3871141, 0.8641022, 1, 1, 1, 1, 1,
-0.3515497, -0.3934017, -1.872518, 1, 1, 1, 1, 1,
-0.3473416, -0.3337517, -4.839646, 1, 1, 1, 1, 1,
-0.3448443, 0.6057331, 0.7682103, 1, 1, 1, 1, 1,
-0.3397413, -0.07075823, -3.494464, 0, 0, 1, 1, 1,
-0.3339619, 0.4094092, 0.1119003, 1, 0, 0, 1, 1,
-0.3334229, -1.012221, -3.052697, 1, 0, 0, 1, 1,
-0.3258441, -0.7522705, -4.562839, 1, 0, 0, 1, 1,
-0.323956, 1.019993, 1.053206, 1, 0, 0, 1, 1,
-0.323017, 2.625235, -2.169398, 1, 0, 0, 1, 1,
-0.3203635, -0.5217733, -1.529341, 0, 0, 0, 1, 1,
-0.3189591, 0.8946869, -0.8483581, 0, 0, 0, 1, 1,
-0.3170356, 0.2373232, -1.059967, 0, 0, 0, 1, 1,
-0.3146369, -0.1461113, -2.295376, 0, 0, 0, 1, 1,
-0.3130713, -0.8530786, -4.252255, 0, 0, 0, 1, 1,
-0.3085766, -0.1365506, -2.475762, 0, 0, 0, 1, 1,
-0.3041561, -1.592969, -4.515137, 0, 0, 0, 1, 1,
-0.2955905, 0.3617351, 0.3169847, 1, 1, 1, 1, 1,
-0.2913717, 1.589003, -0.8224895, 1, 1, 1, 1, 1,
-0.2884395, 1.557878, -1.02289, 1, 1, 1, 1, 1,
-0.2877534, 1.271356, -0.5360429, 1, 1, 1, 1, 1,
-0.2829489, -1.450482, -1.745773, 1, 1, 1, 1, 1,
-0.2792687, 0.5496069, -1.094352, 1, 1, 1, 1, 1,
-0.2769093, 1.711767, 0.3710653, 1, 1, 1, 1, 1,
-0.2746977, -0.1717416, -4.893335, 1, 1, 1, 1, 1,
-0.2663447, 0.4319701, 0.3313945, 1, 1, 1, 1, 1,
-0.2655504, 0.2968894, -1.330276, 1, 1, 1, 1, 1,
-0.2623667, -2.039667, -2.153735, 1, 1, 1, 1, 1,
-0.254871, 1.021279, -0.6732651, 1, 1, 1, 1, 1,
-0.2518225, -0.1173466, -1.590708, 1, 1, 1, 1, 1,
-0.2516454, 2.422129, -0.5888287, 1, 1, 1, 1, 1,
-0.2492582, -0.4049187, -2.12493, 1, 1, 1, 1, 1,
-0.2473079, -1.19932, -3.341604, 0, 0, 1, 1, 1,
-0.2461932, 1.726604, -1.956129, 1, 0, 0, 1, 1,
-0.2450037, 0.1181934, 0.4497546, 1, 0, 0, 1, 1,
-0.2449321, -0.04018931, -1.893694, 1, 0, 0, 1, 1,
-0.2438177, -1.589427, -2.84284, 1, 0, 0, 1, 1,
-0.2434091, -0.04881384, -1.469416, 1, 0, 0, 1, 1,
-0.2422502, 1.356749, 1.031085, 0, 0, 0, 1, 1,
-0.2387397, -0.7009196, -3.512185, 0, 0, 0, 1, 1,
-0.2369246, 1.288242, -1.320239, 0, 0, 0, 1, 1,
-0.2324031, 2.518665, -1.005784, 0, 0, 0, 1, 1,
-0.2317245, -0.5841745, -0.767614, 0, 0, 0, 1, 1,
-0.2254808, 0.9001676, -0.3585147, 0, 0, 0, 1, 1,
-0.2228397, -0.9557652, -4.262423, 0, 0, 0, 1, 1,
-0.2193756, -1.210834, -3.596831, 1, 1, 1, 1, 1,
-0.2045183, -0.5290778, -2.92876, 1, 1, 1, 1, 1,
-0.2040839, -1.193889, -1.392782, 1, 1, 1, 1, 1,
-0.1990738, 0.9350315, -1.417597, 1, 1, 1, 1, 1,
-0.1946967, -0.8341695, -4.614082, 1, 1, 1, 1, 1,
-0.1895428, -0.6139354, -3.802446, 1, 1, 1, 1, 1,
-0.1869866, -0.393032, -3.727508, 1, 1, 1, 1, 1,
-0.1868124, 0.2272333, -1.112993, 1, 1, 1, 1, 1,
-0.186169, 0.9383886, 0.3808449, 1, 1, 1, 1, 1,
-0.182917, 0.29071, -2.589751, 1, 1, 1, 1, 1,
-0.180488, -1.034326, -4.719115, 1, 1, 1, 1, 1,
-0.1754801, 0.0004558046, -0.7668549, 1, 1, 1, 1, 1,
-0.1745006, 0.98305, -0.5310085, 1, 1, 1, 1, 1,
-0.1739883, -0.1478145, -0.4846818, 1, 1, 1, 1, 1,
-0.1730333, 1.761984, -1.455783, 1, 1, 1, 1, 1,
-0.1729612, 0.674668, -0.1110784, 0, 0, 1, 1, 1,
-0.1725757, 0.3520705, -1.171204, 1, 0, 0, 1, 1,
-0.1700686, 0.7017141, -0.4394695, 1, 0, 0, 1, 1,
-0.168204, 1.155701, -0.5002502, 1, 0, 0, 1, 1,
-0.1679678, -0.214201, -0.2169165, 1, 0, 0, 1, 1,
-0.1671337, 0.4074713, 0.1094303, 1, 0, 0, 1, 1,
-0.1627022, -1.240786, -2.75025, 0, 0, 0, 1, 1,
-0.161175, 2.179875, 1.293519, 0, 0, 0, 1, 1,
-0.1574555, 0.2750252, -0.4397507, 0, 0, 0, 1, 1,
-0.1564395, -1.371637, -3.361912, 0, 0, 0, 1, 1,
-0.1554261, -1.094499, -2.872953, 0, 0, 0, 1, 1,
-0.1525763, 0.5482495, -1.376187, 0, 0, 0, 1, 1,
-0.1439866, -0.9216943, -1.015473, 0, 0, 0, 1, 1,
-0.1421909, 0.08835079, -2.631748, 1, 1, 1, 1, 1,
-0.1394361, 0.2883414, -1.72526, 1, 1, 1, 1, 1,
-0.1367654, 0.2580057, -2.194106, 1, 1, 1, 1, 1,
-0.1358273, 0.2100815, -0.7492584, 1, 1, 1, 1, 1,
-0.1328103, 0.4869485, -1.116606, 1, 1, 1, 1, 1,
-0.1317899, 1.798371, 0.3241866, 1, 1, 1, 1, 1,
-0.1307984, 2.098532, 1.171399, 1, 1, 1, 1, 1,
-0.1290997, -0.2191734, -1.698939, 1, 1, 1, 1, 1,
-0.1220086, -0.4990179, -2.668921, 1, 1, 1, 1, 1,
-0.1217848, -1.028807, -2.949157, 1, 1, 1, 1, 1,
-0.1210465, -0.2185605, -0.7261997, 1, 1, 1, 1, 1,
-0.1185933, 0.745856, 0.5352247, 1, 1, 1, 1, 1,
-0.1177211, 0.598438, -0.8943533, 1, 1, 1, 1, 1,
-0.1042743, -0.4074009, -1.900967, 1, 1, 1, 1, 1,
-0.1028291, 0.0924636, 0.2127343, 1, 1, 1, 1, 1,
-0.09873663, -1.534142, -1.588726, 0, 0, 1, 1, 1,
-0.09737731, 0.2750498, 0.4716502, 1, 0, 0, 1, 1,
-0.09571684, -0.5269078, -3.676556, 1, 0, 0, 1, 1,
-0.09369036, -0.3271101, -3.910007, 1, 0, 0, 1, 1,
-0.09245022, 1.560882, -1.05477, 1, 0, 0, 1, 1,
-0.08788068, 1.208467, -0.02495512, 1, 0, 0, 1, 1,
-0.0871249, -0.3549125, -3.192826, 0, 0, 0, 1, 1,
-0.08502262, -0.5573493, -3.984849, 0, 0, 0, 1, 1,
-0.08166947, -0.4602577, -2.373268, 0, 0, 0, 1, 1,
-0.07630942, -1.959919, -2.975606, 0, 0, 0, 1, 1,
-0.07371923, 0.9360686, 1.367018, 0, 0, 0, 1, 1,
-0.07279696, -0.3202325, -3.091897, 0, 0, 0, 1, 1,
-0.0725652, 0.5061476, -0.03486145, 0, 0, 0, 1, 1,
-0.06484891, 1.6383, 0.2352286, 1, 1, 1, 1, 1,
-0.05804394, -0.1287216, -1.863568, 1, 1, 1, 1, 1,
-0.05773534, 0.3627801, -0.8570427, 1, 1, 1, 1, 1,
-0.05267329, -1.153415, -2.595747, 1, 1, 1, 1, 1,
-0.05071658, -0.02751045, -2.916992, 1, 1, 1, 1, 1,
-0.04907957, 0.7694532, 0.6754209, 1, 1, 1, 1, 1,
-0.04604945, -0.08751684, -1.479552, 1, 1, 1, 1, 1,
-0.04256858, -1.094609, -4.035724, 1, 1, 1, 1, 1,
-0.03985076, -1.088234, -1.670732, 1, 1, 1, 1, 1,
-0.03674074, 0.7975355, -0.1035574, 1, 1, 1, 1, 1,
-0.03148336, 1.144113, 0.2617132, 1, 1, 1, 1, 1,
-0.02916055, 1.625548, 0.8266206, 1, 1, 1, 1, 1,
-0.02848593, 0.6789507, -1.363346, 1, 1, 1, 1, 1,
-0.0213773, -0.6268542, -0.5666321, 1, 1, 1, 1, 1,
-0.01911615, -0.3075268, -2.671634, 1, 1, 1, 1, 1,
-0.01515066, 1.259831, 1.117043, 0, 0, 1, 1, 1,
-0.01349435, -0.9727008, -3.203919, 1, 0, 0, 1, 1,
-0.01239137, -1.080046, -1.677642, 1, 0, 0, 1, 1,
-0.01148357, 0.2957864, -0.6116443, 1, 0, 0, 1, 1,
-0.008213669, 0.06582369, 0.6097903, 1, 0, 0, 1, 1,
-0.006966224, 2.673114, -0.8241255, 1, 0, 0, 1, 1,
-0.005052318, -0.1239841, -2.552229, 0, 0, 0, 1, 1,
-0.001272546, -1.366532, -2.455824, 0, 0, 0, 1, 1,
-0.001025578, 0.6903399, 0.1246026, 0, 0, 0, 1, 1,
-0.0003546156, 0.6485076, 0.3218981, 0, 0, 0, 1, 1,
-0.0001345247, 1.420728, 2.960786, 0, 0, 0, 1, 1,
0.006183958, 0.3544635, 0.3068084, 0, 0, 0, 1, 1,
0.007445857, 0.4518341, -0.6287556, 0, 0, 0, 1, 1,
0.01015383, -2.289399, 3.209254, 1, 1, 1, 1, 1,
0.01194072, -0.7082707, 2.873152, 1, 1, 1, 1, 1,
0.0139952, -0.02204784, 4.285381, 1, 1, 1, 1, 1,
0.01462302, 0.08419756, 0.06278656, 1, 1, 1, 1, 1,
0.01678651, -0.168208, 2.504129, 1, 1, 1, 1, 1,
0.01712773, 0.07192027, -0.04396629, 1, 1, 1, 1, 1,
0.02020828, 0.2724642, 1.317559, 1, 1, 1, 1, 1,
0.02144814, 0.06014679, 0.5921208, 1, 1, 1, 1, 1,
0.02340705, 0.7148491, -0.6792907, 1, 1, 1, 1, 1,
0.02590993, -0.941722, 2.794705, 1, 1, 1, 1, 1,
0.02731041, -0.1786993, 2.921621, 1, 1, 1, 1, 1,
0.03020268, 1.106589, -0.6049056, 1, 1, 1, 1, 1,
0.03145602, -0.2452708, 2.918373, 1, 1, 1, 1, 1,
0.03468376, -0.06412476, 0.5338358, 1, 1, 1, 1, 1,
0.03786577, 0.4163748, 1.239249, 1, 1, 1, 1, 1,
0.03795448, 0.06023984, 0.2547802, 0, 0, 1, 1, 1,
0.04195813, -0.8274905, 2.884044, 1, 0, 0, 1, 1,
0.04462833, 0.9401476, -0.1361551, 1, 0, 0, 1, 1,
0.04684563, 0.2516083, -0.2878618, 1, 0, 0, 1, 1,
0.05128735, -0.02794519, 2.097754, 1, 0, 0, 1, 1,
0.05303513, -0.6385356, 1.519324, 1, 0, 0, 1, 1,
0.05393624, -0.5311217, 4.840808, 0, 0, 0, 1, 1,
0.05400201, 0.8885039, 0.9034112, 0, 0, 0, 1, 1,
0.06050269, 0.5069366, -0.6977293, 0, 0, 0, 1, 1,
0.06755275, -1.162816, 2.132919, 0, 0, 0, 1, 1,
0.06888881, 0.1782195, 0.8404029, 0, 0, 0, 1, 1,
0.07372225, -0.5114284, 1.773101, 0, 0, 0, 1, 1,
0.07432371, -0.3115531, 3.061937, 0, 0, 0, 1, 1,
0.09297807, -0.4516353, 3.135684, 1, 1, 1, 1, 1,
0.09654557, 1.143177, 0.445507, 1, 1, 1, 1, 1,
0.09697387, -0.953506, 2.335629, 1, 1, 1, 1, 1,
0.09785737, 0.7311771, 1.972538, 1, 1, 1, 1, 1,
0.09801661, 0.33838, 1.150935, 1, 1, 1, 1, 1,
0.1012595, -2.285152, 2.650749, 1, 1, 1, 1, 1,
0.1029125, 1.071478, 1.138905, 1, 1, 1, 1, 1,
0.1038452, 1.323007, 1.642772, 1, 1, 1, 1, 1,
0.1064256, -0.4854305, 4.0513, 1, 1, 1, 1, 1,
0.1079427, -0.3139645, 4.343939, 1, 1, 1, 1, 1,
0.1109163, 0.7792496, 0.0244743, 1, 1, 1, 1, 1,
0.1129707, 0.1918915, 1.98335, 1, 1, 1, 1, 1,
0.116177, 2.154228, 1.097661, 1, 1, 1, 1, 1,
0.1168678, 0.3705074, -1.979893, 1, 1, 1, 1, 1,
0.1176388, 0.6408969, -0.2827923, 1, 1, 1, 1, 1,
0.1180743, 0.7035704, 1.291751, 0, 0, 1, 1, 1,
0.1187014, -2.684828, 4.186749, 1, 0, 0, 1, 1,
0.120198, 1.077893, -1.130987, 1, 0, 0, 1, 1,
0.1223001, -0.2763395, 1.557747, 1, 0, 0, 1, 1,
0.1224999, 0.2082961, -1.303662, 1, 0, 0, 1, 1,
0.1236368, 0.03166462, 1.396967, 1, 0, 0, 1, 1,
0.1244332, 1.238885, 0.6987602, 0, 0, 0, 1, 1,
0.1260035, -0.04975508, 1.117247, 0, 0, 0, 1, 1,
0.1273951, -0.6293951, 2.138679, 0, 0, 0, 1, 1,
0.1322603, 0.06925604, 1.176987, 0, 0, 0, 1, 1,
0.1397702, 0.3991752, -1.920978, 0, 0, 0, 1, 1,
0.1403072, -1.422905, 2.468819, 0, 0, 0, 1, 1,
0.1417083, -0.2848558, 2.658869, 0, 0, 0, 1, 1,
0.1438173, 0.3740898, 0.8255787, 1, 1, 1, 1, 1,
0.147263, 2.316606, -0.4923719, 1, 1, 1, 1, 1,
0.1498191, -0.1601478, 4.088768, 1, 1, 1, 1, 1,
0.150652, -0.699504, 3.7901, 1, 1, 1, 1, 1,
0.1512649, -0.1329212, 1.531684, 1, 1, 1, 1, 1,
0.1535332, -0.007859543, -0.4045224, 1, 1, 1, 1, 1,
0.1547467, -0.6900017, 3.665353, 1, 1, 1, 1, 1,
0.1557383, 0.6899553, 0.1334554, 1, 1, 1, 1, 1,
0.1561803, -0.821622, 3.196534, 1, 1, 1, 1, 1,
0.1575495, 2.406263, -1.764055, 1, 1, 1, 1, 1,
0.1614015, 0.5215537, -0.2813359, 1, 1, 1, 1, 1,
0.1625593, 1.055757, -0.6637734, 1, 1, 1, 1, 1,
0.1658296, -0.5642645, 0.785774, 1, 1, 1, 1, 1,
0.1698153, -0.94377, 1.831064, 1, 1, 1, 1, 1,
0.1842795, 0.02133748, 1.446038, 1, 1, 1, 1, 1,
0.1857152, -1.376853, 2.1115, 0, 0, 1, 1, 1,
0.1877428, 0.004708003, 1.399551, 1, 0, 0, 1, 1,
0.1942826, -0.05364296, 3.071287, 1, 0, 0, 1, 1,
0.1950624, 1.446567, 0.213503, 1, 0, 0, 1, 1,
0.1960195, 0.8328011, 0.2043804, 1, 0, 0, 1, 1,
0.1963053, 1.045953, 0.1425022, 1, 0, 0, 1, 1,
0.1983958, 0.2105664, -0.9800573, 0, 0, 0, 1, 1,
0.2026491, -0.5914999, 4.455871, 0, 0, 0, 1, 1,
0.2087458, -0.07378084, 0.8051941, 0, 0, 0, 1, 1,
0.2095527, 1.229016, -0.2629988, 0, 0, 0, 1, 1,
0.2121378, -1.218305, 2.775138, 0, 0, 0, 1, 1,
0.2124627, 0.2151387, 1.337452, 0, 0, 0, 1, 1,
0.2128292, -0.4332502, -0.2513368, 0, 0, 0, 1, 1,
0.2202431, -0.6429819, 2.574989, 1, 1, 1, 1, 1,
0.2209036, 0.006421551, 1.813497, 1, 1, 1, 1, 1,
0.22478, 0.5937886, 0.2262803, 1, 1, 1, 1, 1,
0.2248836, -0.5240923, 2.133715, 1, 1, 1, 1, 1,
0.2303294, 0.9863552, -0.7457847, 1, 1, 1, 1, 1,
0.234275, -0.6602579, 3.082531, 1, 1, 1, 1, 1,
0.2377002, 1.072742, 0.357406, 1, 1, 1, 1, 1,
0.2386008, 1.28452, 0.7003148, 1, 1, 1, 1, 1,
0.2439865, -0.07381563, 2.455986, 1, 1, 1, 1, 1,
0.2474738, -1.973434, 3.108618, 1, 1, 1, 1, 1,
0.2477749, 1.69694, -0.1335554, 1, 1, 1, 1, 1,
0.2486402, -0.591182, 2.468458, 1, 1, 1, 1, 1,
0.2558005, 0.2814679, 1.778909, 1, 1, 1, 1, 1,
0.2563478, 0.7566213, -1.156988, 1, 1, 1, 1, 1,
0.2608879, 0.4960938, -1.775124, 1, 1, 1, 1, 1,
0.2705448, -0.7853951, 3.714766, 0, 0, 1, 1, 1,
0.2708451, -1.304322, 4.371067, 1, 0, 0, 1, 1,
0.2726727, -0.5988914, 4.15587, 1, 0, 0, 1, 1,
0.2741147, 3.127222, 0.5629825, 1, 0, 0, 1, 1,
0.2798707, -1.701458, 2.537047, 1, 0, 0, 1, 1,
0.2799254, -2.461585, 2.389582, 1, 0, 0, 1, 1,
0.2806458, 1.016471, 2.013677, 0, 0, 0, 1, 1,
0.2823625, 1.821717, -0.3941239, 0, 0, 0, 1, 1,
0.2828378, -0.2167667, 3.760042, 0, 0, 0, 1, 1,
0.2829252, 0.325529, -0.5312681, 0, 0, 0, 1, 1,
0.2843956, -0.04434929, -0.5396464, 0, 0, 0, 1, 1,
0.2848415, 0.5704942, 0.2194112, 0, 0, 0, 1, 1,
0.2873218, 0.5692206, 2.043667, 0, 0, 0, 1, 1,
0.2879548, -0.4483293, 1.736954, 1, 1, 1, 1, 1,
0.2897699, -1.728257, 3.667605, 1, 1, 1, 1, 1,
0.2996607, 0.4066391, 0.7543761, 1, 1, 1, 1, 1,
0.2998523, 0.2091251, -0.09903255, 1, 1, 1, 1, 1,
0.3062426, 0.326906, 1.221899, 1, 1, 1, 1, 1,
0.3068444, -0.3465142, 1.766441, 1, 1, 1, 1, 1,
0.3078801, 0.7874303, 0.8213623, 1, 1, 1, 1, 1,
0.308493, 0.4941424, 1.358833, 1, 1, 1, 1, 1,
0.310036, 0.166813, 1.098309, 1, 1, 1, 1, 1,
0.3118851, 0.1445243, 1.213781, 1, 1, 1, 1, 1,
0.3132545, -0.7717833, 5.306548, 1, 1, 1, 1, 1,
0.3142611, 0.4223606, 1.18905, 1, 1, 1, 1, 1,
0.3152201, -1.731783, 3.630387, 1, 1, 1, 1, 1,
0.3224226, -0.4011672, 1.0088, 1, 1, 1, 1, 1,
0.3270772, 0.4680889, 0.4343973, 1, 1, 1, 1, 1,
0.3275195, -1.023142, 1.036134, 0, 0, 1, 1, 1,
0.3318352, 1.026092, 0.5436769, 1, 0, 0, 1, 1,
0.3335568, 0.9826909, 1.20138, 1, 0, 0, 1, 1,
0.3347983, -0.7019107, 3.256614, 1, 0, 0, 1, 1,
0.3349156, 1.164335, 0.3213554, 1, 0, 0, 1, 1,
0.3372727, 0.08689874, -0.7489726, 1, 0, 0, 1, 1,
0.3380322, -0.9702777, 3.323053, 0, 0, 0, 1, 1,
0.3386447, 1.329086, -0.3669243, 0, 0, 0, 1, 1,
0.3408726, 1.190639, 0.6145818, 0, 0, 0, 1, 1,
0.3435121, 0.2885611, 1.496422, 0, 0, 0, 1, 1,
0.3447366, 0.2813935, -0.1563242, 0, 0, 0, 1, 1,
0.3476889, 0.5108805, -0.01829537, 0, 0, 0, 1, 1,
0.350512, -0.8803011, 2.46382, 0, 0, 0, 1, 1,
0.3518794, 1.172766, 0.7292446, 1, 1, 1, 1, 1,
0.3529271, 0.8616456, 0.01341202, 1, 1, 1, 1, 1,
0.3534032, -0.1124594, 1.768318, 1, 1, 1, 1, 1,
0.3628055, 2.329526, 1.648047, 1, 1, 1, 1, 1,
0.3667064, -0.1738713, 1.859504, 1, 1, 1, 1, 1,
0.3874873, -0.7352814, 2.887242, 1, 1, 1, 1, 1,
0.4028636, -1.19184, 2.901249, 1, 1, 1, 1, 1,
0.4074149, -0.6906131, 3.204362, 1, 1, 1, 1, 1,
0.4120263, 1.066462, -0.8026113, 1, 1, 1, 1, 1,
0.4137397, -1.168906, 1.693828, 1, 1, 1, 1, 1,
0.4201829, 1.104627, -1.250766, 1, 1, 1, 1, 1,
0.4241429, 0.1029769, -0.5518889, 1, 1, 1, 1, 1,
0.4248132, 0.01210984, 1.779673, 1, 1, 1, 1, 1,
0.4262712, 0.08104371, 2.563556, 1, 1, 1, 1, 1,
0.4289584, 0.3164955, 1.003913, 1, 1, 1, 1, 1,
0.4325152, -2.044857, 3.720283, 0, 0, 1, 1, 1,
0.4373533, -2.064278, 3.843165, 1, 0, 0, 1, 1,
0.4390694, -0.595053, 3.08737, 1, 0, 0, 1, 1,
0.4416937, 0.8550178, 0.9286878, 1, 0, 0, 1, 1,
0.4419779, 1.351472, -0.3305133, 1, 0, 0, 1, 1,
0.4496832, 1.221531, -0.05471589, 1, 0, 0, 1, 1,
0.4501683, 0.08878923, 2.952389, 0, 0, 0, 1, 1,
0.4588908, 0.5524538, 1.340424, 0, 0, 0, 1, 1,
0.464248, -1.126122, 2.842673, 0, 0, 0, 1, 1,
0.4678525, -3.403819, 5.267658, 0, 0, 0, 1, 1,
0.4714607, 1.232719, 1.716408, 0, 0, 0, 1, 1,
0.4741765, 0.544234, -0.4008371, 0, 0, 0, 1, 1,
0.4765183, -0.5568537, 3.126518, 0, 0, 0, 1, 1,
0.4770819, -0.1255113, 0.8695977, 1, 1, 1, 1, 1,
0.4792754, 0.8607541, -1.00009, 1, 1, 1, 1, 1,
0.4800606, -0.7322416, 3.91258, 1, 1, 1, 1, 1,
0.4978018, 0.1439315, -0.6380567, 1, 1, 1, 1, 1,
0.4996629, 1.44081, 0.879518, 1, 1, 1, 1, 1,
0.501387, -0.8400883, 3.280454, 1, 1, 1, 1, 1,
0.5053795, -0.05447759, 1.149801, 1, 1, 1, 1, 1,
0.5060489, 0.1788025, 1.857644, 1, 1, 1, 1, 1,
0.5072037, -0.08747099, 1.78808, 1, 1, 1, 1, 1,
0.5125185, 0.561428, 0.3232469, 1, 1, 1, 1, 1,
0.5154575, 0.9459057, -0.544203, 1, 1, 1, 1, 1,
0.5161775, -1.156394, 3.80464, 1, 1, 1, 1, 1,
0.5162436, 0.3325407, 0.5236853, 1, 1, 1, 1, 1,
0.5187418, -0.254129, 2.450953, 1, 1, 1, 1, 1,
0.5306021, -0.8379613, 1.656156, 1, 1, 1, 1, 1,
0.5331185, -1.085461, 3.532428, 0, 0, 1, 1, 1,
0.534157, 0.3082138, 2.406777, 1, 0, 0, 1, 1,
0.5344645, 2.14493, -0.4544141, 1, 0, 0, 1, 1,
0.5353914, 0.9314502, 0.7608331, 1, 0, 0, 1, 1,
0.5354664, -1.429328, 2.23258, 1, 0, 0, 1, 1,
0.5395114, -0.2224689, 2.719839, 1, 0, 0, 1, 1,
0.5396792, -1.530125, 3.615378, 0, 0, 0, 1, 1,
0.5414239, -0.4450784, 3.052324, 0, 0, 0, 1, 1,
0.541766, -0.7246515, 2.462316, 0, 0, 0, 1, 1,
0.5455836, 1.167298, 0.1834662, 0, 0, 0, 1, 1,
0.5455839, -0.4184194, 0.8432923, 0, 0, 0, 1, 1,
0.5461441, -1.939356, 3.244236, 0, 0, 0, 1, 1,
0.546943, 1.753517, -1.994645, 0, 0, 0, 1, 1,
0.5489288, -0.1896038, 0.8544959, 1, 1, 1, 1, 1,
0.5551729, 0.3760148, 1.013733, 1, 1, 1, 1, 1,
0.5564063, -1.091183, 3.980574, 1, 1, 1, 1, 1,
0.5606541, 1.627522, -0.5797694, 1, 1, 1, 1, 1,
0.5638519, -0.4166629, 2.306889, 1, 1, 1, 1, 1,
0.563926, 1.088272, 0.3180867, 1, 1, 1, 1, 1,
0.564514, 0.3118612, 2.197707, 1, 1, 1, 1, 1,
0.5650551, -0.127338, 0.9542687, 1, 1, 1, 1, 1,
0.5652208, 1.42713, -0.5028656, 1, 1, 1, 1, 1,
0.5667512, -0.7355163, 2.889286, 1, 1, 1, 1, 1,
0.5678112, 1.608754, -0.01633211, 1, 1, 1, 1, 1,
0.5684634, -1.611802, 4.154009, 1, 1, 1, 1, 1,
0.5823066, 0.455301, 0.8447399, 1, 1, 1, 1, 1,
0.5899748, -1.222103, 4.191274, 1, 1, 1, 1, 1,
0.5949748, -0.433008, 3.585892, 1, 1, 1, 1, 1,
0.5970239, -2.03627, 2.834814, 0, 0, 1, 1, 1,
0.5989986, -0.4095609, 2.591203, 1, 0, 0, 1, 1,
0.6017873, 1.650448, -0.6355985, 1, 0, 0, 1, 1,
0.6060073, 1.541003, 0.001463552, 1, 0, 0, 1, 1,
0.607501, 0.1422035, 0.5053906, 1, 0, 0, 1, 1,
0.6077657, 2.05774, 0.8626168, 1, 0, 0, 1, 1,
0.6154915, 0.287558, 0.755389, 0, 0, 0, 1, 1,
0.6187896, -0.734629, 2.695289, 0, 0, 0, 1, 1,
0.6195831, 0.3912607, -0.2805488, 0, 0, 0, 1, 1,
0.6257024, 0.2904352, 0.43374, 0, 0, 0, 1, 1,
0.6266699, 0.07959391, 3.425451, 0, 0, 0, 1, 1,
0.6268424, -0.3855337, 1.963646, 0, 0, 0, 1, 1,
0.6297958, -1.014722, 1.809788, 0, 0, 0, 1, 1,
0.6403971, -1.1414, 3.123976, 1, 1, 1, 1, 1,
0.6440684, 1.434354, -0.8989401, 1, 1, 1, 1, 1,
0.6461148, 0.7474046, 0.9524505, 1, 1, 1, 1, 1,
0.6486661, -1.823768, 2.467197, 1, 1, 1, 1, 1,
0.6491185, 0.4994672, 1.971133, 1, 1, 1, 1, 1,
0.6502288, 0.7185519, -1.302655, 1, 1, 1, 1, 1,
0.6531199, 0.191377, 0.5277513, 1, 1, 1, 1, 1,
0.6575533, -1.680411, 2.353169, 1, 1, 1, 1, 1,
0.6583208, -0.5659009, 2.125299, 1, 1, 1, 1, 1,
0.6587155, -0.2943693, 1.547561, 1, 1, 1, 1, 1,
0.6618348, 0.3320552, -0.432999, 1, 1, 1, 1, 1,
0.6675797, -1.322593, 3.599397, 1, 1, 1, 1, 1,
0.6732391, 0.6634002, 1.211484, 1, 1, 1, 1, 1,
0.6750783, -0.3613626, 1.114219, 1, 1, 1, 1, 1,
0.6767498, -1.140463, 0.7691054, 1, 1, 1, 1, 1,
0.6789916, 0.4940414, 0.8790702, 0, 0, 1, 1, 1,
0.6830521, 0.2312239, 0.5243537, 1, 0, 0, 1, 1,
0.6873049, 0.07019284, -0.5432711, 1, 0, 0, 1, 1,
0.6939946, 0.1267189, 1.136801, 1, 0, 0, 1, 1,
0.6971025, 1.168369, 0.7329086, 1, 0, 0, 1, 1,
0.6974635, 0.7896826, -0.2930807, 1, 0, 0, 1, 1,
0.7010055, -0.9937469, 1.68738, 0, 0, 0, 1, 1,
0.7011399, 0.2791329, -0.1703461, 0, 0, 0, 1, 1,
0.7041277, 1.609853, 1.400465, 0, 0, 0, 1, 1,
0.7073594, -1.360075, 2.129043, 0, 0, 0, 1, 1,
0.708859, -0.9334999, 1.294878, 0, 0, 0, 1, 1,
0.7090942, -0.7016744, 0.1846385, 0, 0, 0, 1, 1,
0.7137067, 0.94304, 1.461591, 0, 0, 0, 1, 1,
0.7138554, -0.1913282, 1.957072, 1, 1, 1, 1, 1,
0.7185419, 0.5305429, 2.730534, 1, 1, 1, 1, 1,
0.7232181, 0.2728087, 1.413896, 1, 1, 1, 1, 1,
0.7279397, 0.1472885, -0.4314284, 1, 1, 1, 1, 1,
0.7285765, -0.777266, 2.036918, 1, 1, 1, 1, 1,
0.729539, -1.526266, 2.572378, 1, 1, 1, 1, 1,
0.7370752, -0.9699224, 1.52463, 1, 1, 1, 1, 1,
0.7386724, -1.268641, 4.066403, 1, 1, 1, 1, 1,
0.7413859, -0.6380493, 1.354006, 1, 1, 1, 1, 1,
0.7428875, -0.732129, 3.535846, 1, 1, 1, 1, 1,
0.7433764, 0.05242906, 0.864552, 1, 1, 1, 1, 1,
0.7490028, -0.9241178, 5.123498, 1, 1, 1, 1, 1,
0.7557532, 2.137404, 0.7325922, 1, 1, 1, 1, 1,
0.7561026, -1.265377, 3.469465, 1, 1, 1, 1, 1,
0.7577622, 0.6858835, 1.866603, 1, 1, 1, 1, 1,
0.7587653, -1.227984, 3.232457, 0, 0, 1, 1, 1,
0.7623196, 0.3303572, 1.736889, 1, 0, 0, 1, 1,
0.7627942, -0.6778343, 1.842464, 1, 0, 0, 1, 1,
0.7638521, -2.496943, 3.347356, 1, 0, 0, 1, 1,
0.7706171, -0.4869023, 0.9121115, 1, 0, 0, 1, 1,
0.7711398, -0.583521, 2.963552, 1, 0, 0, 1, 1,
0.771545, 0.8594126, 0.4302364, 0, 0, 0, 1, 1,
0.7782948, 0.6258093, 1.657, 0, 0, 0, 1, 1,
0.7818027, 1.250107, -0.8926665, 0, 0, 0, 1, 1,
0.7819729, -1.556977, 1.681169, 0, 0, 0, 1, 1,
0.7852371, 0.4096757, -0.02938607, 0, 0, 0, 1, 1,
0.788863, 0.6788158, 0.5731977, 0, 0, 0, 1, 1,
0.7923771, 0.7918078, 1.43119, 0, 0, 0, 1, 1,
0.7933148, 0.3644542, -0.04746764, 1, 1, 1, 1, 1,
0.7941676, 0.5666473, -1.62595, 1, 1, 1, 1, 1,
0.7971053, 0.7618996, 2.804692, 1, 1, 1, 1, 1,
0.8057876, -0.2151294, 1.821177, 1, 1, 1, 1, 1,
0.8116545, -0.656521, 2.451901, 1, 1, 1, 1, 1,
0.8160418, 0.1600369, 2.127354, 1, 1, 1, 1, 1,
0.8170392, 0.7696372, -0.1327585, 1, 1, 1, 1, 1,
0.8205764, -0.08760653, 3.251529, 1, 1, 1, 1, 1,
0.8220367, -0.9112229, 1.888194, 1, 1, 1, 1, 1,
0.8226789, -1.29742, 2.992157, 1, 1, 1, 1, 1,
0.8247572, 0.320078, 0.9793332, 1, 1, 1, 1, 1,
0.824957, 1.121594, 0.6183663, 1, 1, 1, 1, 1,
0.8288424, -1.365904, 1.891884, 1, 1, 1, 1, 1,
0.8294055, -1.619646, 0.8613158, 1, 1, 1, 1, 1,
0.8385324, -0.1662902, 1.691379, 1, 1, 1, 1, 1,
0.8468058, -1.944981, 3.087092, 0, 0, 1, 1, 1,
0.8506917, 2.116781, 0.4035291, 1, 0, 0, 1, 1,
0.8517513, 0.728156, 0.5177341, 1, 0, 0, 1, 1,
0.8526598, 1.305706, -0.218955, 1, 0, 0, 1, 1,
0.8593233, 0.9153873, 0.7156495, 1, 0, 0, 1, 1,
0.8687926, 0.376147, 1.861938, 1, 0, 0, 1, 1,
0.8760034, -0.3071848, 1.394937, 0, 0, 0, 1, 1,
0.879295, 0.4434032, 1.132772, 0, 0, 0, 1, 1,
0.8796645, 0.1260398, 1.121083, 0, 0, 0, 1, 1,
0.8827132, 1.185516, 1.211435, 0, 0, 0, 1, 1,
0.8843489, 0.1997783, 1.189564, 0, 0, 0, 1, 1,
0.8869025, 1.362186, 0.3473467, 0, 0, 0, 1, 1,
0.8896332, -1.097412, 3.552848, 0, 0, 0, 1, 1,
0.894539, -0.05172576, 0.392089, 1, 1, 1, 1, 1,
0.897483, 0.355429, 1.674589, 1, 1, 1, 1, 1,
0.9021522, -0.4315003, 0.9143363, 1, 1, 1, 1, 1,
0.9034689, 1.495655, 0.09049758, 1, 1, 1, 1, 1,
0.9083841, 0.9538563, -0.935515, 1, 1, 1, 1, 1,
0.9122444, 1.013822, 1.409404, 1, 1, 1, 1, 1,
0.912537, 0.3402287, 0.7402427, 1, 1, 1, 1, 1,
0.9175187, -0.108479, 0.1685185, 1, 1, 1, 1, 1,
0.9251843, 0.7793907, 1.724676, 1, 1, 1, 1, 1,
0.9274262, 0.08231641, 1.296398, 1, 1, 1, 1, 1,
0.9280249, 0.04461231, 0.8757574, 1, 1, 1, 1, 1,
0.9283893, -0.4846205, 1.341417, 1, 1, 1, 1, 1,
0.9351065, -1.08658, 1.559175, 1, 1, 1, 1, 1,
0.939087, -0.3895201, 0.9791759, 1, 1, 1, 1, 1,
0.9402021, -1.314884, 3.265807, 1, 1, 1, 1, 1,
0.943106, 0.633351, 0.9732246, 0, 0, 1, 1, 1,
0.9572026, -1.430216, 2.87297, 1, 0, 0, 1, 1,
0.959956, -1.134057, 3.218833, 1, 0, 0, 1, 1,
0.9623027, -0.2436663, 1.79342, 1, 0, 0, 1, 1,
0.9629003, -2.600439, 3.518912, 1, 0, 0, 1, 1,
0.9664719, 1.293144, -0.7272676, 1, 0, 0, 1, 1,
0.968579, 0.5935767, 2.59109, 0, 0, 0, 1, 1,
0.9711587, 0.4583726, 0.7239905, 0, 0, 0, 1, 1,
0.9737015, 0.01620883, 1.238667, 0, 0, 0, 1, 1,
0.9738939, -0.3579458, 1.917668, 0, 0, 0, 1, 1,
0.9799325, -0.1539523, 1.677221, 0, 0, 0, 1, 1,
0.9811614, -0.3122073, 1.042613, 0, 0, 0, 1, 1,
0.9943392, -0.2738671, 0.5918252, 0, 0, 0, 1, 1,
0.9959966, -0.8779617, 0.3924835, 1, 1, 1, 1, 1,
0.9990516, -0.9388788, 0.9849718, 1, 1, 1, 1, 1,
1.012089, 1.402741, -0.740567, 1, 1, 1, 1, 1,
1.012964, 0.6689892, 0.8864068, 1, 1, 1, 1, 1,
1.018929, 0.1887291, 3.027768, 1, 1, 1, 1, 1,
1.028889, -0.361371, 1.863668, 1, 1, 1, 1, 1,
1.029944, 1.54072, 2.50035, 1, 1, 1, 1, 1,
1.031338, -2.035777, 2.457203, 1, 1, 1, 1, 1,
1.035151, 1.888279, -0.7372119, 1, 1, 1, 1, 1,
1.037257, 0.2581938, 2.167959, 1, 1, 1, 1, 1,
1.048363, 0.6775416, 0.04806127, 1, 1, 1, 1, 1,
1.05005, -1.498513, 3.104354, 1, 1, 1, 1, 1,
1.055703, -1.012305, 3.039444, 1, 1, 1, 1, 1,
1.062103, 0.2005692, 2.55616, 1, 1, 1, 1, 1,
1.062459, 0.9245147, 1.215531, 1, 1, 1, 1, 1,
1.063398, -0.7652133, 2.666999, 0, 0, 1, 1, 1,
1.066685, -0.4716251, 2.303329, 1, 0, 0, 1, 1,
1.066975, -0.7372084, 1.235317, 1, 0, 0, 1, 1,
1.071573, -1.156752, 2.458252, 1, 0, 0, 1, 1,
1.076402, 1.535879, 1.426236, 1, 0, 0, 1, 1,
1.085564, 0.09868478, 4.229559, 1, 0, 0, 1, 1,
1.086432, 1.49405, 0.5263405, 0, 0, 0, 1, 1,
1.090118, -1.033597, 2.808175, 0, 0, 0, 1, 1,
1.09819, -0.6630483, 4.169798, 0, 0, 0, 1, 1,
1.099391, 0.3435159, 1.227772, 0, 0, 0, 1, 1,
1.107154, 1.002379, -0.339362, 0, 0, 0, 1, 1,
1.108534, -0.2212011, 1.408098, 0, 0, 0, 1, 1,
1.122732, -0.4797571, 3.16196, 0, 0, 0, 1, 1,
1.130148, -0.8057402, 3.247663, 1, 1, 1, 1, 1,
1.131487, -0.6352972, 2.047503, 1, 1, 1, 1, 1,
1.132958, 0.5773672, 1.176805, 1, 1, 1, 1, 1,
1.134508, 0.3072002, -0.910588, 1, 1, 1, 1, 1,
1.140368, -0.2382683, 3.369056, 1, 1, 1, 1, 1,
1.140904, -0.9240437, 2.495244, 1, 1, 1, 1, 1,
1.152991, 2.825947, 0.7122295, 1, 1, 1, 1, 1,
1.15387, -0.5194532, 4.541424, 1, 1, 1, 1, 1,
1.159637, 0.0919826, 1.662637, 1, 1, 1, 1, 1,
1.161572, 1.100066, 0.9859625, 1, 1, 1, 1, 1,
1.161797, -0.5328461, 2.235133, 1, 1, 1, 1, 1,
1.16554, -1.880115, 3.36807, 1, 1, 1, 1, 1,
1.166573, 0.9368456, 2.591732, 1, 1, 1, 1, 1,
1.167968, -0.0005657579, 1.814721, 1, 1, 1, 1, 1,
1.17427, 0.2323203, 0.3375143, 1, 1, 1, 1, 1,
1.182668, 0.4065209, 1.811773, 0, 0, 1, 1, 1,
1.196165, -0.9076601, 1.50529, 1, 0, 0, 1, 1,
1.19691, -1.46551, 3.461556, 1, 0, 0, 1, 1,
1.19744, 2.899195, 1.494724, 1, 0, 0, 1, 1,
1.204562, 0.1586703, 0.206598, 1, 0, 0, 1, 1,
1.206225, 0.2899299, 1.657157, 1, 0, 0, 1, 1,
1.210065, -0.1905248, 1.765009, 0, 0, 0, 1, 1,
1.213867, 2.267583, -0.6393653, 0, 0, 0, 1, 1,
1.218619, 0.06328017, 0.2797339, 0, 0, 0, 1, 1,
1.222003, -0.5738611, 1.534302, 0, 0, 0, 1, 1,
1.222319, -0.9207953, 5.217981, 0, 0, 0, 1, 1,
1.224728, -0.8972935, 1.773421, 0, 0, 0, 1, 1,
1.22525, 0.1496944, 0.05077849, 0, 0, 0, 1, 1,
1.227016, 2.214975, 1.098109, 1, 1, 1, 1, 1,
1.232574, 1.035065, 0.5982187, 1, 1, 1, 1, 1,
1.233092, 0.2261179, 2.84402, 1, 1, 1, 1, 1,
1.233672, -0.1435055, 2.628961, 1, 1, 1, 1, 1,
1.236145, -0.009394942, 1.281781, 1, 1, 1, 1, 1,
1.240286, -0.146517, 2.627263, 1, 1, 1, 1, 1,
1.243607, -0.38891, 0.126763, 1, 1, 1, 1, 1,
1.244757, -0.7793686, 0.6738152, 1, 1, 1, 1, 1,
1.250338, -1.37926, 3.924683, 1, 1, 1, 1, 1,
1.255344, -1.483621, 3.962391, 1, 1, 1, 1, 1,
1.255838, -0.6427709, 0.8652348, 1, 1, 1, 1, 1,
1.258967, 1.021734, 1.537947, 1, 1, 1, 1, 1,
1.265729, 2.078428, 1.449963, 1, 1, 1, 1, 1,
1.267212, 0.4694603, 1.975355, 1, 1, 1, 1, 1,
1.278692, -0.6236215, 3.673997, 1, 1, 1, 1, 1,
1.278832, -0.9840813, 1.42294, 0, 0, 1, 1, 1,
1.280139, 0.5755655, 1.226385, 1, 0, 0, 1, 1,
1.289056, -0.238778, 3.241147, 1, 0, 0, 1, 1,
1.290952, -0.9580804, 2.636389, 1, 0, 0, 1, 1,
1.294756, -0.7060848, 3.102368, 1, 0, 0, 1, 1,
1.297402, -1.544957, 2.728699, 1, 0, 0, 1, 1,
1.299966, 1.99043, 1.371341, 0, 0, 0, 1, 1,
1.30546, -0.2070471, 1.393393, 0, 0, 0, 1, 1,
1.310382, -1.249053, 2.301378, 0, 0, 0, 1, 1,
1.320181, -0.1769441, 2.373663, 0, 0, 0, 1, 1,
1.34668, -0.5019693, 0.7561325, 0, 0, 0, 1, 1,
1.363506, 0.5947554, 1.143662, 0, 0, 0, 1, 1,
1.389913, -1.181306, 3.214792, 0, 0, 0, 1, 1,
1.392928, -0.1290089, 1.280204, 1, 1, 1, 1, 1,
1.394009, 0.1429644, 0.8179947, 1, 1, 1, 1, 1,
1.401946, 0.1501054, 2.567225, 1, 1, 1, 1, 1,
1.402804, -1.196681, 3.194666, 1, 1, 1, 1, 1,
1.405429, 0.5351396, 0.8060817, 1, 1, 1, 1, 1,
1.406205, -0.4393936, 1.653104, 1, 1, 1, 1, 1,
1.408452, 1.214536, 0.5378656, 1, 1, 1, 1, 1,
1.410288, -2.016901, 3.113013, 1, 1, 1, 1, 1,
1.415514, 0.5300908, 0.2508859, 1, 1, 1, 1, 1,
1.415935, 1.174074, 1.754179, 1, 1, 1, 1, 1,
1.423204, 0.09849422, 2.446029, 1, 1, 1, 1, 1,
1.424103, 0.5103596, 1.774524, 1, 1, 1, 1, 1,
1.425482, 0.6147349, 0.2273829, 1, 1, 1, 1, 1,
1.436375, -0.8141779, 2.37565, 1, 1, 1, 1, 1,
1.447315, 0.5961229, -0.6226901, 1, 1, 1, 1, 1,
1.451207, -1.204024, 1.023888, 0, 0, 1, 1, 1,
1.465175, 0.4327985, 1.241076, 1, 0, 0, 1, 1,
1.471073, 0.9668121, -0.3183057, 1, 0, 0, 1, 1,
1.478228, -0.8604026, 0.9409927, 1, 0, 0, 1, 1,
1.480766, 0.1223582, 1.701912, 1, 0, 0, 1, 1,
1.488872, -1.379296, 2.900556, 1, 0, 0, 1, 1,
1.492705, -0.09462067, 0.9747618, 0, 0, 0, 1, 1,
1.498165, -0.2927875, 1.148032, 0, 0, 0, 1, 1,
1.50326, -1.061109, 1.923473, 0, 0, 0, 1, 1,
1.50497, -0.0353574, 0.814709, 0, 0, 0, 1, 1,
1.514469, 0.09974037, 1.510741, 0, 0, 0, 1, 1,
1.515908, -0.1808131, 1.031979, 0, 0, 0, 1, 1,
1.531802, 0.1402394, 0.2258997, 0, 0, 0, 1, 1,
1.546072, 0.937892, 0.6159834, 1, 1, 1, 1, 1,
1.561887, -0.7230716, 0.8592061, 1, 1, 1, 1, 1,
1.577642, 0.2735779, 0.3893739, 1, 1, 1, 1, 1,
1.615252, -0.1869109, 1.576587, 1, 1, 1, 1, 1,
1.625099, 1.209962, 0.6043007, 1, 1, 1, 1, 1,
1.629738, -0.8046663, 2.824956, 1, 1, 1, 1, 1,
1.637831, 1.997302, 0.2605752, 1, 1, 1, 1, 1,
1.64286, 1.74229, -0.4330125, 1, 1, 1, 1, 1,
1.643797, -1.640303, 0.7756174, 1, 1, 1, 1, 1,
1.655629, 1.420556, 1.157375, 1, 1, 1, 1, 1,
1.666352, 0.3866338, 2.155514, 1, 1, 1, 1, 1,
1.669474, 0.4760229, -0.3983282, 1, 1, 1, 1, 1,
1.671217, 0.9468554, 0.9782039, 1, 1, 1, 1, 1,
1.703182, 0.2255877, 1.874112, 1, 1, 1, 1, 1,
1.708998, 0.8001674, 0.9609348, 1, 1, 1, 1, 1,
1.711257, -0.3178383, 2.741137, 0, 0, 1, 1, 1,
1.729921, -0.7538231, 3.158873, 1, 0, 0, 1, 1,
1.73128, -2.126246, 2.476567, 1, 0, 0, 1, 1,
1.738037, -1.396966, 3.062178, 1, 0, 0, 1, 1,
1.738694, -1.123151, 0.2595712, 1, 0, 0, 1, 1,
1.741396, 0.1125469, 0.981613, 1, 0, 0, 1, 1,
1.750912, 2.653401, 0.6664727, 0, 0, 0, 1, 1,
1.762215, -0.2497275, 3.95808, 0, 0, 0, 1, 1,
1.764135, 1.983367, 0.7509811, 0, 0, 0, 1, 1,
1.771012, -0.5707906, 0.3589572, 0, 0, 0, 1, 1,
1.773649, 0.2933387, 0.02391934, 0, 0, 0, 1, 1,
1.77425, -0.4056653, 2.968839, 0, 0, 0, 1, 1,
1.8547, 0.6291463, 0.6343204, 0, 0, 0, 1, 1,
1.861604, 0.3101288, 1.383611, 1, 1, 1, 1, 1,
1.88229, -0.7080643, 0.8131534, 1, 1, 1, 1, 1,
1.900567, 0.4536893, 0.02846754, 1, 1, 1, 1, 1,
1.906774, -0.1267236, 0.545013, 1, 1, 1, 1, 1,
1.909409, -0.2732652, 1.185386, 1, 1, 1, 1, 1,
1.913349, 0.01365971, 1.359646, 1, 1, 1, 1, 1,
1.946658, 1.31944, 0.639344, 1, 1, 1, 1, 1,
1.959399, 0.50527, 2.224799, 1, 1, 1, 1, 1,
1.960128, 1.526207, 0.9118083, 1, 1, 1, 1, 1,
1.968327, 0.7323608, 0.698291, 1, 1, 1, 1, 1,
1.985953, -2.771666, 2.6335, 1, 1, 1, 1, 1,
2.016285, 0.2754152, 1.60971, 1, 1, 1, 1, 1,
2.05933, 0.2073732, 2.684234, 1, 1, 1, 1, 1,
2.060452, -1.588788, 3.768703, 1, 1, 1, 1, 1,
2.132188, -0.3345718, 3.344685, 1, 1, 1, 1, 1,
2.139458, -0.4322294, 1.04253, 0, 0, 1, 1, 1,
2.208781, 2.180608, 1.667346, 1, 0, 0, 1, 1,
2.248306, -0.8770901, 1.611758, 1, 0, 0, 1, 1,
2.26387, -0.3901391, 2.086057, 1, 0, 0, 1, 1,
2.272782, 0.2310224, -0.01651075, 1, 0, 0, 1, 1,
2.396005, -0.04464551, 1.77741, 1, 0, 0, 1, 1,
2.415637, -0.3216179, 1.447706, 0, 0, 0, 1, 1,
2.435589, -1.201519, 2.13058, 0, 0, 0, 1, 1,
2.445664, -0.1964635, 1.467744, 0, 0, 0, 1, 1,
2.460108, -0.06700581, 2.28587, 0, 0, 0, 1, 1,
2.551286, 1.285227, 1.921886, 0, 0, 0, 1, 1,
2.666149, 1.749863, 1.718655, 0, 0, 0, 1, 1,
2.687364, 1.788011, 0.7459049, 0, 0, 0, 1, 1,
2.690814, 0.677731, 2.58105, 1, 1, 1, 1, 1,
2.773557, -0.4791598, 0.4554929, 1, 1, 1, 1, 1,
2.788633, -1.548333, 0.1710714, 1, 1, 1, 1, 1,
2.85928, 1.809446, 0.6612692, 1, 1, 1, 1, 1,
2.942767, 0.2217619, 1.78197, 1, 1, 1, 1, 1,
3.220713, 2.034103, 1.687464, 1, 1, 1, 1, 1,
3.276704, -0.5843006, -0.1385371, 1, 1, 1, 1, 1
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
var radius = 9.88264;
var distance = 34.71236;
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
mvMatrix.translate( 0.4332254, 0.1382983, 0.04467845 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.71236);
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