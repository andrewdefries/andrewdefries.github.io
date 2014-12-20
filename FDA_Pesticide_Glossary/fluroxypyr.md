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
-3.473771, -0.3715549, -1.945922, 1, 0, 0, 1,
-3.365042, 0.1278941, -2.805075, 1, 0.007843138, 0, 1,
-3.32076, 0.9252663, -0.02783024, 1, 0.01176471, 0, 1,
-2.834699, -1.338244, -2.015375, 1, 0.01960784, 0, 1,
-2.695125, 0.1376672, -1.858972, 1, 0.02352941, 0, 1,
-2.662101, 1.624277, -0.6165444, 1, 0.03137255, 0, 1,
-2.636418, 1.026259, -1.048813, 1, 0.03529412, 0, 1,
-2.633532, -2.201816, -3.053918, 1, 0.04313726, 0, 1,
-2.604449, 0.8081962, -1.161923, 1, 0.04705882, 0, 1,
-2.588996, 0.6036637, -0.5233682, 1, 0.05490196, 0, 1,
-2.510559, 1.072161, -1.956455, 1, 0.05882353, 0, 1,
-2.427346, -1.678113, -1.497311, 1, 0.06666667, 0, 1,
-2.420162, 1.720362, -0.3391075, 1, 0.07058824, 0, 1,
-2.41899, -0.2545722, -2.427026, 1, 0.07843138, 0, 1,
-2.399574, -0.4223965, -2.65002, 1, 0.08235294, 0, 1,
-2.396219, -0.8174764, -2.942907, 1, 0.09019608, 0, 1,
-2.358263, -0.1815491, -2.410945, 1, 0.09411765, 0, 1,
-2.35059, -0.5848254, -2.73403, 1, 0.1019608, 0, 1,
-2.310127, 1.557254, -0.9749813, 1, 0.1098039, 0, 1,
-2.296692, 1.046527, -2.109091, 1, 0.1137255, 0, 1,
-2.291772, 1.56422, -0.76279, 1, 0.1215686, 0, 1,
-2.226841, 1.876877, -0.9482982, 1, 0.1254902, 0, 1,
-2.193764, -0.4912413, -2.22021, 1, 0.1333333, 0, 1,
-2.158051, -0.5697278, -1.642906, 1, 0.1372549, 0, 1,
-2.155023, 0.1622239, -0.6095691, 1, 0.145098, 0, 1,
-2.093141, 0.2181852, -2.336583, 1, 0.1490196, 0, 1,
-2.073951, 0.2725815, -0.5550437, 1, 0.1568628, 0, 1,
-2.009519, 0.6670189, -0.2919082, 1, 0.1607843, 0, 1,
-1.982664, 1.207398, 0.1502862, 1, 0.1686275, 0, 1,
-1.962007, 1.388252, -1.535925, 1, 0.172549, 0, 1,
-1.961894, -1.288463, -1.489716, 1, 0.1803922, 0, 1,
-1.955237, -0.1006687, -1.849737, 1, 0.1843137, 0, 1,
-1.933338, -0.7768378, -1.072674, 1, 0.1921569, 0, 1,
-1.932297, 1.361354, -2.202573, 1, 0.1960784, 0, 1,
-1.921872, -0.9975567, -2.795379, 1, 0.2039216, 0, 1,
-1.891214, -0.103117, -1.129179, 1, 0.2117647, 0, 1,
-1.888639, 0.07103078, -2.128593, 1, 0.2156863, 0, 1,
-1.885603, 0.6223173, -0.7852196, 1, 0.2235294, 0, 1,
-1.884088, 1.248127, -2.132764, 1, 0.227451, 0, 1,
-1.879933, 0.1853039, -2.448356, 1, 0.2352941, 0, 1,
-1.85051, 0.3695961, -1.771286, 1, 0.2392157, 0, 1,
-1.847284, -0.02464625, -1.358072, 1, 0.2470588, 0, 1,
-1.828362, -0.05096569, -3.389258, 1, 0.2509804, 0, 1,
-1.823273, -0.9929645, -2.944531, 1, 0.2588235, 0, 1,
-1.791751, -0.5152634, -1.38904, 1, 0.2627451, 0, 1,
-1.787009, -0.6063851, -1.162871, 1, 0.2705882, 0, 1,
-1.72784, -1.504138, -0.03257812, 1, 0.2745098, 0, 1,
-1.70399, 1.168036, 0.9091218, 1, 0.282353, 0, 1,
-1.700508, 0.6292578, -2.550967, 1, 0.2862745, 0, 1,
-1.685738, 1.792664, -1.331839, 1, 0.2941177, 0, 1,
-1.670893, -0.1629876, -3.090302, 1, 0.3019608, 0, 1,
-1.656463, 0.3141631, -1.773015, 1, 0.3058824, 0, 1,
-1.655778, -0.482223, -2.155174, 1, 0.3137255, 0, 1,
-1.652532, 0.4221741, -1.533888, 1, 0.3176471, 0, 1,
-1.64194, -0.9912037, -2.950286, 1, 0.3254902, 0, 1,
-1.6351, -1.286132, -1.676492, 1, 0.3294118, 0, 1,
-1.633455, 0.9809924, -2.739165, 1, 0.3372549, 0, 1,
-1.617878, -0.8815778, -2.362464, 1, 0.3411765, 0, 1,
-1.616869, -0.6497969, -1.299707, 1, 0.3490196, 0, 1,
-1.613872, -0.8013182, -2.334804, 1, 0.3529412, 0, 1,
-1.583289, 0.5775118, -0.675798, 1, 0.3607843, 0, 1,
-1.58093, -0.6467704, -1.901478, 1, 0.3647059, 0, 1,
-1.577483, -0.3506619, -2.455586, 1, 0.372549, 0, 1,
-1.566188, -1.13235, -2.77724, 1, 0.3764706, 0, 1,
-1.563524, 1.272587, -1.788903, 1, 0.3843137, 0, 1,
-1.56093, 0.6095554, -1.777093, 1, 0.3882353, 0, 1,
-1.553812, 0.5989995, -0.8258384, 1, 0.3960784, 0, 1,
-1.543456, -0.4438182, -0.7351766, 1, 0.4039216, 0, 1,
-1.53362, -0.5207172, -2.688907, 1, 0.4078431, 0, 1,
-1.531951, 0.5544462, -1.954553, 1, 0.4156863, 0, 1,
-1.521027, 0.4997959, -2.573087, 1, 0.4196078, 0, 1,
-1.519653, -1.149389, -1.738277, 1, 0.427451, 0, 1,
-1.516979, 1.593878, 1.851997, 1, 0.4313726, 0, 1,
-1.515075, 0.1310005, -1.28823, 1, 0.4392157, 0, 1,
-1.508676, 0.3075929, -2.253324, 1, 0.4431373, 0, 1,
-1.477106, 1.82668, 0.3331367, 1, 0.4509804, 0, 1,
-1.47485, -0.1538294, -1.687651, 1, 0.454902, 0, 1,
-1.470338, -1.59361, -3.554203, 1, 0.4627451, 0, 1,
-1.46338, -1.268038, -0.8177248, 1, 0.4666667, 0, 1,
-1.460144, -0.07202635, -2.400992, 1, 0.4745098, 0, 1,
-1.449935, 0.4560628, -1.510014, 1, 0.4784314, 0, 1,
-1.443906, -0.3358771, -2.436471, 1, 0.4862745, 0, 1,
-1.436166, 0.2951027, -2.528341, 1, 0.4901961, 0, 1,
-1.435149, 1.17873, -1.942947, 1, 0.4980392, 0, 1,
-1.424709, -1.267316, -4.672811, 1, 0.5058824, 0, 1,
-1.407754, -0.1966997, -2.91064, 1, 0.509804, 0, 1,
-1.400205, -2.258548, -4.043561, 1, 0.5176471, 0, 1,
-1.38914, 0.3147885, -0.9143322, 1, 0.5215687, 0, 1,
-1.385063, -0.4396867, -2.018212, 1, 0.5294118, 0, 1,
-1.373707, -1.114676, -1.583597, 1, 0.5333334, 0, 1,
-1.366132, -0.4499956, -0.5607831, 1, 0.5411765, 0, 1,
-1.364521, 1.629485, -0.515406, 1, 0.5450981, 0, 1,
-1.356381, 0.5008664, -2.009914, 1, 0.5529412, 0, 1,
-1.353939, 0.3225748, -2.765507, 1, 0.5568628, 0, 1,
-1.338936, 0.009027441, -2.586163, 1, 0.5647059, 0, 1,
-1.335558, 1.109765, 0.01911693, 1, 0.5686275, 0, 1,
-1.333128, -0.8860145, -2.159755, 1, 0.5764706, 0, 1,
-1.324345, -0.8760777, -2.764995, 1, 0.5803922, 0, 1,
-1.319375, 0.5973977, -1.767323, 1, 0.5882353, 0, 1,
-1.305062, -0.9363234, -2.031147, 1, 0.5921569, 0, 1,
-1.304578, 0.1156221, -0.0799377, 1, 0.6, 0, 1,
-1.301995, -1.40053, -3.472944, 1, 0.6078432, 0, 1,
-1.255834, 0.3177046, -1.966518, 1, 0.6117647, 0, 1,
-1.25229, 0.1005405, -0.8467373, 1, 0.6196079, 0, 1,
-1.251194, 0.8647295, -1.113462, 1, 0.6235294, 0, 1,
-1.246286, -0.1016319, -3.070003, 1, 0.6313726, 0, 1,
-1.243356, -1.690892, -2.508752, 1, 0.6352941, 0, 1,
-1.243197, -0.3907676, -1.664363, 1, 0.6431373, 0, 1,
-1.240352, -0.5430179, 0.009633611, 1, 0.6470588, 0, 1,
-1.239626, -0.1172645, -2.090315, 1, 0.654902, 0, 1,
-1.232213, -1.347547, -2.121873, 1, 0.6588235, 0, 1,
-1.224596, 0.3801105, -3.662287, 1, 0.6666667, 0, 1,
-1.220249, -0.402087, -2.243506, 1, 0.6705883, 0, 1,
-1.211528, -0.67674, -2.526894, 1, 0.6784314, 0, 1,
-1.207608, -1.123405, -2.589595, 1, 0.682353, 0, 1,
-1.203022, 0.4745932, -0.9834006, 1, 0.6901961, 0, 1,
-1.197081, -1.101002, -1.701568, 1, 0.6941177, 0, 1,
-1.196366, -1.526223, -2.113668, 1, 0.7019608, 0, 1,
-1.188276, -0.5800329, -1.516788, 1, 0.7098039, 0, 1,
-1.177805, 1.051446, -0.3203652, 1, 0.7137255, 0, 1,
-1.17231, 1.12124, -1.031359, 1, 0.7215686, 0, 1,
-1.172088, -1.333232, -1.962337, 1, 0.7254902, 0, 1,
-1.169624, 1.385192, -0.5709747, 1, 0.7333333, 0, 1,
-1.158804, 1.773196, 0.3026838, 1, 0.7372549, 0, 1,
-1.154076, 1.019279, -0.06675075, 1, 0.7450981, 0, 1,
-1.148348, -1.697353, -2.26533, 1, 0.7490196, 0, 1,
-1.145443, 0.4076002, -1.267916, 1, 0.7568628, 0, 1,
-1.140956, -1.293581, -3.685687, 1, 0.7607843, 0, 1,
-1.129508, 0.270612, -1.152228, 1, 0.7686275, 0, 1,
-1.122551, -0.8926848, -2.488296, 1, 0.772549, 0, 1,
-1.121942, -1.046673, -2.127099, 1, 0.7803922, 0, 1,
-1.121559, 1.224055, -1.374343, 1, 0.7843137, 0, 1,
-1.117033, 0.5526509, -0.5758704, 1, 0.7921569, 0, 1,
-1.110894, 1.223659, -1.806362, 1, 0.7960784, 0, 1,
-1.104064, -0.09051186, 0.02629133, 1, 0.8039216, 0, 1,
-1.089051, 1.844981, -0.4761257, 1, 0.8117647, 0, 1,
-1.084757, 0.3989828, -0.3459229, 1, 0.8156863, 0, 1,
-1.082203, 1.755238, -1.877493, 1, 0.8235294, 0, 1,
-1.073182, 0.9833974, 0.06607964, 1, 0.827451, 0, 1,
-1.063129, 3.221869, 0.3227623, 1, 0.8352941, 0, 1,
-1.060392, -1.204527, -3.326485, 1, 0.8392157, 0, 1,
-1.057429, 0.0888841, -1.64504, 1, 0.8470588, 0, 1,
-1.049989, -0.08793609, -2.533695, 1, 0.8509804, 0, 1,
-1.047564, -0.6432533, -2.307753, 1, 0.8588235, 0, 1,
-1.043436, -0.9229735, -1.993518, 1, 0.8627451, 0, 1,
-1.037747, -1.853134, -3.78627, 1, 0.8705882, 0, 1,
-1.033262, 0.2192915, -2.256703, 1, 0.8745098, 0, 1,
-1.02506, -0.6927361, -1.440467, 1, 0.8823529, 0, 1,
-1.015884, 1.243864, -0.0574012, 1, 0.8862745, 0, 1,
-1.015024, 0.3818583, -2.343418, 1, 0.8941177, 0, 1,
-1.011936, 0.03610622, -1.844847, 1, 0.8980392, 0, 1,
-0.999026, 0.2294219, 0.1820449, 1, 0.9058824, 0, 1,
-0.992946, -0.2340111, -2.082577, 1, 0.9137255, 0, 1,
-0.9894925, 0.3009304, -3.177946, 1, 0.9176471, 0, 1,
-0.9885983, -0.9037978, -3.729547, 1, 0.9254902, 0, 1,
-0.987542, 1.133902, -0.7356541, 1, 0.9294118, 0, 1,
-0.9757847, -0.1327069, -1.849408, 1, 0.9372549, 0, 1,
-0.9751411, -0.5259885, -1.940533, 1, 0.9411765, 0, 1,
-0.9707491, -0.08043874, -1.266719, 1, 0.9490196, 0, 1,
-0.9606779, 0.7304966, -0.4955063, 1, 0.9529412, 0, 1,
-0.9572034, -0.5413446, -2.70304, 1, 0.9607843, 0, 1,
-0.9547068, 0.1063284, -0.4835464, 1, 0.9647059, 0, 1,
-0.9531642, -0.3859104, -0.3721465, 1, 0.972549, 0, 1,
-0.9464771, -0.1159173, -0.9025317, 1, 0.9764706, 0, 1,
-0.9457018, -0.340846, -3.787481, 1, 0.9843137, 0, 1,
-0.9417113, -0.2879034, -2.582749, 1, 0.9882353, 0, 1,
-0.9390481, -0.3275618, -1.565936, 1, 0.9960784, 0, 1,
-0.9340962, 0.5603778, -1.940563, 0.9960784, 1, 0, 1,
-0.9276103, 0.08536077, 0.5607364, 0.9921569, 1, 0, 1,
-0.9237615, 1.429495, -0.189195, 0.9843137, 1, 0, 1,
-0.9230038, 0.2550363, -2.002123, 0.9803922, 1, 0, 1,
-0.9219522, -0.3377114, -1.446474, 0.972549, 1, 0, 1,
-0.9150935, 0.1796505, -0.1571912, 0.9686275, 1, 0, 1,
-0.9121005, -0.7318592, -1.986405, 0.9607843, 1, 0, 1,
-0.9084775, 0.6799516, -1.424644, 0.9568627, 1, 0, 1,
-0.904142, 0.9769665, -1.045719, 0.9490196, 1, 0, 1,
-0.8929869, 0.616364, -0.6643201, 0.945098, 1, 0, 1,
-0.8805597, -1.786531, -4.396727, 0.9372549, 1, 0, 1,
-0.8798728, -0.4748116, -3.157028, 0.9333333, 1, 0, 1,
-0.878072, -2.101994, -0.8156212, 0.9254902, 1, 0, 1,
-0.8769319, 0.3412579, -1.602594, 0.9215686, 1, 0, 1,
-0.8742328, -0.5924522, -1.242054, 0.9137255, 1, 0, 1,
-0.871617, 0.3145034, -4.496343, 0.9098039, 1, 0, 1,
-0.8602799, 0.392246, 0.5087306, 0.9019608, 1, 0, 1,
-0.8596805, 1.532216, 0.2316051, 0.8941177, 1, 0, 1,
-0.8587451, 1.611805, -0.806264, 0.8901961, 1, 0, 1,
-0.8566021, -0.1464703, -1.60711, 0.8823529, 1, 0, 1,
-0.8545704, -0.338753, -2.495117, 0.8784314, 1, 0, 1,
-0.8520528, -0.5847052, -1.416965, 0.8705882, 1, 0, 1,
-0.851445, -2.078369, -2.523662, 0.8666667, 1, 0, 1,
-0.8450361, -0.8645203, -2.844393, 0.8588235, 1, 0, 1,
-0.8427499, -0.2520833, -0.874897, 0.854902, 1, 0, 1,
-0.8401543, 0.822494, -0.7754315, 0.8470588, 1, 0, 1,
-0.835022, -1.037106, -1.994829, 0.8431373, 1, 0, 1,
-0.8330671, -1.242961, -3.135853, 0.8352941, 1, 0, 1,
-0.8248662, -0.9227979, -2.632746, 0.8313726, 1, 0, 1,
-0.8221508, 2.177977, -0.8849448, 0.8235294, 1, 0, 1,
-0.8166544, 0.9251376, 0.5884609, 0.8196079, 1, 0, 1,
-0.8124742, 0.05714771, -0.7614323, 0.8117647, 1, 0, 1,
-0.808664, -0.4453376, -1.178628, 0.8078431, 1, 0, 1,
-0.8075285, -1.058809, -3.130179, 0.8, 1, 0, 1,
-0.7987688, -1.324801, -3.240744, 0.7921569, 1, 0, 1,
-0.7981662, -1.722445, -3.17057, 0.7882353, 1, 0, 1,
-0.7972811, -0.2234839, -1.123848, 0.7803922, 1, 0, 1,
-0.7914853, 1.152822, 1.283159, 0.7764706, 1, 0, 1,
-0.7896442, 0.6727542, -1.429473, 0.7686275, 1, 0, 1,
-0.7861164, 0.1566486, -2.241572, 0.7647059, 1, 0, 1,
-0.7836159, 1.32039, 0.1386863, 0.7568628, 1, 0, 1,
-0.7807171, -0.1002986, -1.861059, 0.7529412, 1, 0, 1,
-0.7698181, 0.4660809, -1.693691, 0.7450981, 1, 0, 1,
-0.7689915, 1.535249, -2.225581, 0.7411765, 1, 0, 1,
-0.7570008, 0.8260759, -1.689701, 0.7333333, 1, 0, 1,
-0.7563247, -0.05564338, -1.349958, 0.7294118, 1, 0, 1,
-0.7508429, 0.5202924, -1.139923, 0.7215686, 1, 0, 1,
-0.7492428, -0.9400197, -2.52044, 0.7176471, 1, 0, 1,
-0.7475827, -0.1402828, -1.95824, 0.7098039, 1, 0, 1,
-0.7341039, 2.122457, -2.011045, 0.7058824, 1, 0, 1,
-0.7326795, 1.327359, -0.7989702, 0.6980392, 1, 0, 1,
-0.7324588, -1.537853, -2.39521, 0.6901961, 1, 0, 1,
-0.7277419, -0.5386294, -3.292717, 0.6862745, 1, 0, 1,
-0.7266369, -0.8933089, -4.439577, 0.6784314, 1, 0, 1,
-0.7209009, 0.3033957, -1.976053, 0.6745098, 1, 0, 1,
-0.7178051, -0.1242171, -2.263492, 0.6666667, 1, 0, 1,
-0.7152302, -0.4219782, -2.00405, 0.6627451, 1, 0, 1,
-0.7125156, 1.907768, 0.330635, 0.654902, 1, 0, 1,
-0.7118165, -0.9066814, -1.728661, 0.6509804, 1, 0, 1,
-0.7094719, 0.6763668, -1.793604, 0.6431373, 1, 0, 1,
-0.7080092, 0.05609353, -2.776019, 0.6392157, 1, 0, 1,
-0.7012933, 0.7798043, -1.813003, 0.6313726, 1, 0, 1,
-0.6994137, -0.2883538, -2.432385, 0.627451, 1, 0, 1,
-0.6988739, 2.752359, -1.106285, 0.6196079, 1, 0, 1,
-0.6978036, 0.2130185, -0.3257031, 0.6156863, 1, 0, 1,
-0.689019, -0.2712723, -1.593085, 0.6078432, 1, 0, 1,
-0.6857625, -0.3568639, -2.295724, 0.6039216, 1, 0, 1,
-0.6811284, -0.1198379, -0.7567438, 0.5960785, 1, 0, 1,
-0.6793861, -0.1956021, -2.056452, 0.5882353, 1, 0, 1,
-0.6759949, -0.7812787, -2.852055, 0.5843138, 1, 0, 1,
-0.6758637, -0.3683212, -2.536975, 0.5764706, 1, 0, 1,
-0.6738861, -0.3466948, -0.9617649, 0.572549, 1, 0, 1,
-0.6713522, 1.104277, 0.1442676, 0.5647059, 1, 0, 1,
-0.6661247, -1.263192, -4.341514, 0.5607843, 1, 0, 1,
-0.6609558, 0.006498268, -1.201311, 0.5529412, 1, 0, 1,
-0.6591048, -1.30466, -3.191481, 0.5490196, 1, 0, 1,
-0.6563109, 0.3044232, -2.253089, 0.5411765, 1, 0, 1,
-0.6503109, -0.6045493, -3.129135, 0.5372549, 1, 0, 1,
-0.6487355, -1.837696, -4.777844, 0.5294118, 1, 0, 1,
-0.6472128, -1.090795, -3.601358, 0.5254902, 1, 0, 1,
-0.6435305, -1.2671, -3.935023, 0.5176471, 1, 0, 1,
-0.6397092, -0.04395584, -1.374575, 0.5137255, 1, 0, 1,
-0.6385154, 0.02255734, 0.6794133, 0.5058824, 1, 0, 1,
-0.63793, 1.160555, -2.355129, 0.5019608, 1, 0, 1,
-0.6321055, 0.734777, 0.1770362, 0.4941176, 1, 0, 1,
-0.6300319, 0.1621527, -0.7640805, 0.4862745, 1, 0, 1,
-0.6235088, -0.4935211, -3.003606, 0.4823529, 1, 0, 1,
-0.6210431, -0.4976181, -2.813145, 0.4745098, 1, 0, 1,
-0.619076, 0.7020132, -0.2577109, 0.4705882, 1, 0, 1,
-0.6171678, 0.7882497, -2.72637, 0.4627451, 1, 0, 1,
-0.6151346, -0.1328373, -1.431368, 0.4588235, 1, 0, 1,
-0.6148577, 0.3103491, -1.784418, 0.4509804, 1, 0, 1,
-0.6133898, -0.07279404, -2.306428, 0.4470588, 1, 0, 1,
-0.6119241, 2.137866, -1.431266, 0.4392157, 1, 0, 1,
-0.6117501, -0.4721314, -1.229724, 0.4352941, 1, 0, 1,
-0.6114624, 0.7323371, 0.3153708, 0.427451, 1, 0, 1,
-0.6046907, -0.001139282, -1.334493, 0.4235294, 1, 0, 1,
-0.6045814, 0.1979364, -0.8076078, 0.4156863, 1, 0, 1,
-0.6023244, -0.3477458, -0.8246091, 0.4117647, 1, 0, 1,
-0.5953782, -0.3792084, -2.270619, 0.4039216, 1, 0, 1,
-0.5901277, -0.8023229, -3.409376, 0.3960784, 1, 0, 1,
-0.5871121, 0.9339024, -0.2852429, 0.3921569, 1, 0, 1,
-0.5822363, -1.138753, -2.452576, 0.3843137, 1, 0, 1,
-0.5794782, 0.1385053, -0.6710038, 0.3803922, 1, 0, 1,
-0.5794181, -0.4320453, -1.449154, 0.372549, 1, 0, 1,
-0.578357, 1.283864, -0.5842316, 0.3686275, 1, 0, 1,
-0.5766889, 1.051139, -2.381183, 0.3607843, 1, 0, 1,
-0.5712819, 1.396159, 1.029296, 0.3568628, 1, 0, 1,
-0.5676407, -0.4475392, -2.21117, 0.3490196, 1, 0, 1,
-0.5659038, 1.295616, -1.802728, 0.345098, 1, 0, 1,
-0.563697, 1.034801, 0.5222595, 0.3372549, 1, 0, 1,
-0.562867, 0.2297444, -2.297949, 0.3333333, 1, 0, 1,
-0.5613708, -1.28946, -2.578541, 0.3254902, 1, 0, 1,
-0.5603003, -1.681094, -2.733345, 0.3215686, 1, 0, 1,
-0.5597854, 0.2129304, 0.838365, 0.3137255, 1, 0, 1,
-0.5544226, 0.6356242, -0.7335183, 0.3098039, 1, 0, 1,
-0.5521632, 0.04312502, -1.830037, 0.3019608, 1, 0, 1,
-0.5502802, 1.057685, 0.3207483, 0.2941177, 1, 0, 1,
-0.5464165, 0.6129296, 0.6556817, 0.2901961, 1, 0, 1,
-0.5462941, -0.8089017, -3.784398, 0.282353, 1, 0, 1,
-0.545286, 0.1029717, -1.078799, 0.2784314, 1, 0, 1,
-0.541494, -0.3089934, -1.528118, 0.2705882, 1, 0, 1,
-0.538171, -0.5894513, -3.592506, 0.2666667, 1, 0, 1,
-0.5347834, 0.8794186, -0.2028515, 0.2588235, 1, 0, 1,
-0.5347553, -0.2522774, -0.4301359, 0.254902, 1, 0, 1,
-0.5339407, -1.936013, -2.670169, 0.2470588, 1, 0, 1,
-0.5327343, -1.616349, -3.067479, 0.2431373, 1, 0, 1,
-0.5297941, -0.6137945, -3.600713, 0.2352941, 1, 0, 1,
-0.5297017, 1.33185, -0.6294799, 0.2313726, 1, 0, 1,
-0.5285205, 0.59355, -0.8781406, 0.2235294, 1, 0, 1,
-0.5242869, -0.5669767, -1.82831, 0.2196078, 1, 0, 1,
-0.5218142, -0.4151987, -0.6958274, 0.2117647, 1, 0, 1,
-0.5119283, -0.02718578, -1.405547, 0.2078431, 1, 0, 1,
-0.5101178, 0.5094651, 0.5568684, 0.2, 1, 0, 1,
-0.5093962, -0.4427895, -5.356169, 0.1921569, 1, 0, 1,
-0.5082617, -0.5450891, -2.130449, 0.1882353, 1, 0, 1,
-0.5057307, -0.6152118, -3.945804, 0.1803922, 1, 0, 1,
-0.5031803, 0.3616672, 0.6846401, 0.1764706, 1, 0, 1,
-0.5017825, 0.1028986, 0.354916, 0.1686275, 1, 0, 1,
-0.4997329, -0.9279673, -0.6234763, 0.1647059, 1, 0, 1,
-0.4997035, -0.4561508, -3.8215, 0.1568628, 1, 0, 1,
-0.4943257, 0.7490441, -0.9024458, 0.1529412, 1, 0, 1,
-0.4874493, 0.7030821, -0.6534619, 0.145098, 1, 0, 1,
-0.4826526, -1.804953, -2.841376, 0.1411765, 1, 0, 1,
-0.48167, -0.1659547, -1.128134, 0.1333333, 1, 0, 1,
-0.4762711, -0.1663763, -0.5109109, 0.1294118, 1, 0, 1,
-0.4762247, 0.08479661, -1.048716, 0.1215686, 1, 0, 1,
-0.4755496, -0.1018204, -3.289714, 0.1176471, 1, 0, 1,
-0.4734369, 0.5454403, -0.07254396, 0.1098039, 1, 0, 1,
-0.4707762, -0.7841649, -2.690733, 0.1058824, 1, 0, 1,
-0.4686471, 0.7055925, 0.3631963, 0.09803922, 1, 0, 1,
-0.4582668, -0.01599899, -1.620589, 0.09019608, 1, 0, 1,
-0.4574778, 1.482375, -0.2806552, 0.08627451, 1, 0, 1,
-0.4461255, -0.2559909, -3.108338, 0.07843138, 1, 0, 1,
-0.4445589, 2.333099, 1.028898, 0.07450981, 1, 0, 1,
-0.4437731, -0.8529053, -1.934185, 0.06666667, 1, 0, 1,
-0.4422886, 1.727677, 0.4226072, 0.0627451, 1, 0, 1,
-0.4401581, -1.172734, -0.9101129, 0.05490196, 1, 0, 1,
-0.4394939, 0.07970558, -2.443026, 0.05098039, 1, 0, 1,
-0.4392141, 0.4126881, -1.477211, 0.04313726, 1, 0, 1,
-0.436235, -1.959926, -1.863491, 0.03921569, 1, 0, 1,
-0.4361338, 0.9430932, -0.5273082, 0.03137255, 1, 0, 1,
-0.4348591, -1.338927, -4.215929, 0.02745098, 1, 0, 1,
-0.4322894, 0.2332124, -2.828395, 0.01960784, 1, 0, 1,
-0.4306224, -0.8143792, -2.96393, 0.01568628, 1, 0, 1,
-0.4294358, 0.9522104, -0.2103202, 0.007843138, 1, 0, 1,
-0.4286116, 1.13599, 0.6146367, 0.003921569, 1, 0, 1,
-0.4259365, 0.1497018, -0.8692538, 0, 1, 0.003921569, 1,
-0.4255461, 0.8562138, -1.193945, 0, 1, 0.01176471, 1,
-0.424853, 0.2481805, 0.1049289, 0, 1, 0.01568628, 1,
-0.4191108, 0.4227954, -0.6750197, 0, 1, 0.02352941, 1,
-0.4184771, 0.5399033, 1.277603, 0, 1, 0.02745098, 1,
-0.4146167, 0.8483143, -0.3809048, 0, 1, 0.03529412, 1,
-0.4043217, 0.3203684, -1.502269, 0, 1, 0.03921569, 1,
-0.403287, -0.5567143, -3.153387, 0, 1, 0.04705882, 1,
-0.4010435, 0.2616895, -0.563602, 0, 1, 0.05098039, 1,
-0.3985658, 0.6217397, -0.06799961, 0, 1, 0.05882353, 1,
-0.3965693, 1.18575, -0.6684558, 0, 1, 0.0627451, 1,
-0.3918182, 0.8318377, -1.969089, 0, 1, 0.07058824, 1,
-0.3895347, -1.147035, -2.857505, 0, 1, 0.07450981, 1,
-0.3870876, 0.7332144, 1.165605, 0, 1, 0.08235294, 1,
-0.3868384, -0.8458519, 0.4276672, 0, 1, 0.08627451, 1,
-0.3861371, -1.587699, -2.087852, 0, 1, 0.09411765, 1,
-0.3860068, -1.959362, -1.838926, 0, 1, 0.1019608, 1,
-0.3832893, 1.330429, 0.2658523, 0, 1, 0.1058824, 1,
-0.3823363, -0.333427, -0.2411776, 0, 1, 0.1137255, 1,
-0.3800316, -0.05981416, -3.862708, 0, 1, 0.1176471, 1,
-0.3786173, 0.1110261, -1.543067, 0, 1, 0.1254902, 1,
-0.3782885, -0.5459543, -4.071579, 0, 1, 0.1294118, 1,
-0.3754124, -0.04826879, -0.1341139, 0, 1, 0.1372549, 1,
-0.3721282, 0.2695595, 0.7924309, 0, 1, 0.1411765, 1,
-0.3669652, 2.282315, -0.6533545, 0, 1, 0.1490196, 1,
-0.3644345, -0.8645895, -2.388097, 0, 1, 0.1529412, 1,
-0.3565998, -0.4221579, -3.063819, 0, 1, 0.1607843, 1,
-0.3531558, -0.389324, -1.606522, 0, 1, 0.1647059, 1,
-0.3523379, -0.1198557, -2.260477, 0, 1, 0.172549, 1,
-0.3491679, -1.608421, -2.687844, 0, 1, 0.1764706, 1,
-0.3485233, -0.1048062, -2.902715, 0, 1, 0.1843137, 1,
-0.3435886, -0.8562095, -2.498908, 0, 1, 0.1882353, 1,
-0.3381288, -0.2853021, -4.344173, 0, 1, 0.1960784, 1,
-0.3354683, -0.7013209, -3.171543, 0, 1, 0.2039216, 1,
-0.3306967, -0.6745136, -3.932307, 0, 1, 0.2078431, 1,
-0.3304567, -0.3049818, -1.271315, 0, 1, 0.2156863, 1,
-0.3257073, -1.242165, -2.129637, 0, 1, 0.2196078, 1,
-0.3170328, -2.404104, -1.679776, 0, 1, 0.227451, 1,
-0.316522, -0.01253993, -3.079476, 0, 1, 0.2313726, 1,
-0.3164535, -0.7339659, -2.147931, 0, 1, 0.2392157, 1,
-0.3158806, 0.6719592, -1.140919, 0, 1, 0.2431373, 1,
-0.3089481, 0.4108044, -1.831015, 0, 1, 0.2509804, 1,
-0.3072611, -1.288055, -3.788747, 0, 1, 0.254902, 1,
-0.3031659, 1.754325, -0.8141173, 0, 1, 0.2627451, 1,
-0.3031524, 2.262275, 1.49404, 0, 1, 0.2666667, 1,
-0.3023838, -0.2270162, -2.311877, 0, 1, 0.2745098, 1,
-0.2990331, 0.2465519, -0.418869, 0, 1, 0.2784314, 1,
-0.2979159, 1.014205, -0.06734803, 0, 1, 0.2862745, 1,
-0.2947211, -0.7486953, -4.430774, 0, 1, 0.2901961, 1,
-0.2934846, 0.6088907, -0.3312261, 0, 1, 0.2980392, 1,
-0.293047, -0.4662817, -0.7317135, 0, 1, 0.3058824, 1,
-0.292585, -1.505237, -2.433914, 0, 1, 0.3098039, 1,
-0.2911503, 0.1864142, -0.8338687, 0, 1, 0.3176471, 1,
-0.2883326, 0.1654352, -0.5047495, 0, 1, 0.3215686, 1,
-0.288035, 0.3233961, -0.7671923, 0, 1, 0.3294118, 1,
-0.2809203, -0.2128227, -1.669698, 0, 1, 0.3333333, 1,
-0.2801402, 0.05613052, -1.287733, 0, 1, 0.3411765, 1,
-0.2692499, -0.06121814, -1.124923, 0, 1, 0.345098, 1,
-0.2663109, -1.149249, -0.4400418, 0, 1, 0.3529412, 1,
-0.2661574, -1.240104, -1.24093, 0, 1, 0.3568628, 1,
-0.2531549, -1.781214, -3.207865, 0, 1, 0.3647059, 1,
-0.2498873, -0.1205478, -0.2765675, 0, 1, 0.3686275, 1,
-0.2494021, 0.5289007, -0.5882409, 0, 1, 0.3764706, 1,
-0.24692, -0.6507363, -1.82642, 0, 1, 0.3803922, 1,
-0.2442767, -0.920435, -3.476269, 0, 1, 0.3882353, 1,
-0.2426943, 0.8421538, 0.2432876, 0, 1, 0.3921569, 1,
-0.2408841, -1.238282, -2.229436, 0, 1, 0.4, 1,
-0.2380503, -0.1208918, -0.5670964, 0, 1, 0.4078431, 1,
-0.2375438, 0.8798113, -2.273221, 0, 1, 0.4117647, 1,
-0.2342592, -0.3829138, -3.460337, 0, 1, 0.4196078, 1,
-0.2248897, -0.5802184, -2.120736, 0, 1, 0.4235294, 1,
-0.2179295, 2.564821, -0.5225151, 0, 1, 0.4313726, 1,
-0.2155597, 0.4296291, 0.9084824, 0, 1, 0.4352941, 1,
-0.1925115, -0.7464106, -2.989714, 0, 1, 0.4431373, 1,
-0.1924006, -0.502373, -2.597745, 0, 1, 0.4470588, 1,
-0.1914107, 0.9814878, 0.08197965, 0, 1, 0.454902, 1,
-0.1893783, -1.55456, -3.225577, 0, 1, 0.4588235, 1,
-0.1883542, -0.09424262, -0.6475336, 0, 1, 0.4666667, 1,
-0.1851764, 0.4315392, -0.3099338, 0, 1, 0.4705882, 1,
-0.1842515, -1.138694, -3.730898, 0, 1, 0.4784314, 1,
-0.1834371, 0.6249431, 0.04157928, 0, 1, 0.4823529, 1,
-0.1831055, 0.8071683, 0.2929582, 0, 1, 0.4901961, 1,
-0.1825336, -0.5032873, -2.159771, 0, 1, 0.4941176, 1,
-0.1794853, -0.9057064, -2.940723, 0, 1, 0.5019608, 1,
-0.1755289, -0.5365704, -2.060997, 0, 1, 0.509804, 1,
-0.1743304, -1.051844, -3.29121, 0, 1, 0.5137255, 1,
-0.1677954, 0.8350278, 0.6792454, 0, 1, 0.5215687, 1,
-0.1665504, -0.5879291, -2.20619, 0, 1, 0.5254902, 1,
-0.1629088, 1.924253, -1.047957, 0, 1, 0.5333334, 1,
-0.1626572, -1.79212, -2.681175, 0, 1, 0.5372549, 1,
-0.1602486, -1.228928, -3.149955, 0, 1, 0.5450981, 1,
-0.1596003, 1.356449, 1.396371, 0, 1, 0.5490196, 1,
-0.1585579, -1.704683, -2.948408, 0, 1, 0.5568628, 1,
-0.1543359, -0.9958735, -2.530912, 0, 1, 0.5607843, 1,
-0.1538963, 0.2021869, -2.565375, 0, 1, 0.5686275, 1,
-0.1533972, -1.351344, -3.984419, 0, 1, 0.572549, 1,
-0.151963, -0.5004544, -2.809263, 0, 1, 0.5803922, 1,
-0.1496383, -0.8033378, -3.179661, 0, 1, 0.5843138, 1,
-0.1482106, 0.5691991, 0.1087684, 0, 1, 0.5921569, 1,
-0.1434846, 0.3454938, -1.414726, 0, 1, 0.5960785, 1,
-0.143054, -1.151055, -2.488356, 0, 1, 0.6039216, 1,
-0.1383859, 0.6187617, 0.9150769, 0, 1, 0.6117647, 1,
-0.1368916, -1.651105, -2.424059, 0, 1, 0.6156863, 1,
-0.1361745, -1.283142, -2.256999, 0, 1, 0.6235294, 1,
-0.1320635, 0.5522091, 0.2649179, 0, 1, 0.627451, 1,
-0.1301696, 0.2531124, -0.6407687, 0, 1, 0.6352941, 1,
-0.1281638, 0.0773987, -1.733345, 0, 1, 0.6392157, 1,
-0.1269316, 0.3984397, -0.08354057, 0, 1, 0.6470588, 1,
-0.1229538, -0.9401582, -3.146037, 0, 1, 0.6509804, 1,
-0.121683, 0.405105, 0.8057693, 0, 1, 0.6588235, 1,
-0.1209446, 0.3813367, -0.4526395, 0, 1, 0.6627451, 1,
-0.1183632, -0.8913465, -1.953061, 0, 1, 0.6705883, 1,
-0.1169652, -2.121588, -4.451286, 0, 1, 0.6745098, 1,
-0.1166633, 0.4167457, 0.005357044, 0, 1, 0.682353, 1,
-0.1153637, 1.09856, 0.1524804, 0, 1, 0.6862745, 1,
-0.1143406, -0.4511254, -2.772069, 0, 1, 0.6941177, 1,
-0.1111136, 0.9283408, -1.228964, 0, 1, 0.7019608, 1,
-0.1101024, -0.3284067, -3.431628, 0, 1, 0.7058824, 1,
-0.1094796, 1.838424, -0.652689, 0, 1, 0.7137255, 1,
-0.1087122, -0.3915693, -2.543711, 0, 1, 0.7176471, 1,
-0.0992881, -0.0759528, -2.340947, 0, 1, 0.7254902, 1,
-0.09728257, 0.2011619, -2.13899, 0, 1, 0.7294118, 1,
-0.09665822, 1.271281, 1.356515, 0, 1, 0.7372549, 1,
-0.09591566, 0.03637892, -0.5687144, 0, 1, 0.7411765, 1,
-0.09063541, 2.233204, 1.172943, 0, 1, 0.7490196, 1,
-0.08799994, 0.0413408, -1.788776, 0, 1, 0.7529412, 1,
-0.08497327, 0.9657844, 0.5706496, 0, 1, 0.7607843, 1,
-0.08059206, -0.3802454, -2.655426, 0, 1, 0.7647059, 1,
-0.07864228, 0.7154118, -0.8379472, 0, 1, 0.772549, 1,
-0.07632449, -1.194609, -4.06478, 0, 1, 0.7764706, 1,
-0.07496534, -0.2927715, -3.17688, 0, 1, 0.7843137, 1,
-0.07437022, 0.7692068, 0.08883183, 0, 1, 0.7882353, 1,
-0.07302747, 1.604131, 0.8244638, 0, 1, 0.7960784, 1,
-0.06673168, -0.9756955, -2.407771, 0, 1, 0.8039216, 1,
-0.06537612, -0.09681334, -3.38371, 0, 1, 0.8078431, 1,
-0.06388743, 0.4142287, -0.3393836, 0, 1, 0.8156863, 1,
-0.0634376, 0.9825103, 0.2438158, 0, 1, 0.8196079, 1,
-0.06074878, 0.3979361, -1.099559, 0, 1, 0.827451, 1,
-0.0598333, 0.03497948, -2.17546, 0, 1, 0.8313726, 1,
-0.05898609, 0.493333, 0.2447396, 0, 1, 0.8392157, 1,
-0.0548758, 0.4860138, -0.8909942, 0, 1, 0.8431373, 1,
-0.05365263, 1.459298, 1.096852, 0, 1, 0.8509804, 1,
-0.05252662, 0.3271232, -0.5368835, 0, 1, 0.854902, 1,
-0.05214516, -1.011922, -3.850984, 0, 1, 0.8627451, 1,
-0.04389964, 0.5458334, -0.1887261, 0, 1, 0.8666667, 1,
-0.03963732, -0.965414, -2.224463, 0, 1, 0.8745098, 1,
-0.03434513, -0.2763243, -2.961081, 0, 1, 0.8784314, 1,
-0.03061901, -0.4708425, -2.277103, 0, 1, 0.8862745, 1,
-0.02673435, 1.524088, 1.449385, 0, 1, 0.8901961, 1,
-0.02207048, -0.3898231, -3.594324, 0, 1, 0.8980392, 1,
-0.01577044, -1.815528, -4.087778, 0, 1, 0.9058824, 1,
-0.01563522, -0.2367538, -4.327641, 0, 1, 0.9098039, 1,
-0.01451812, 0.4524576, 0.3825154, 0, 1, 0.9176471, 1,
-0.00796529, -0.463383, -3.970037, 0, 1, 0.9215686, 1,
-0.004497963, -0.3154867, -4.429502, 0, 1, 0.9294118, 1,
0.004352737, 1.250478, 0.3754736, 0, 1, 0.9333333, 1,
0.004529908, -0.5879101, 4.938148, 0, 1, 0.9411765, 1,
0.006309145, 0.05175415, 0.8041673, 0, 1, 0.945098, 1,
0.007575449, -1.381552, 2.555311, 0, 1, 0.9529412, 1,
0.008165067, 1.022049, 1.963942, 0, 1, 0.9568627, 1,
0.008788326, 1.181691, -1.644389, 0, 1, 0.9647059, 1,
0.008952771, 1.45446, -0.6548406, 0, 1, 0.9686275, 1,
0.009215842, -0.6859251, 2.191907, 0, 1, 0.9764706, 1,
0.01009179, 1.159538, 0.3747808, 0, 1, 0.9803922, 1,
0.01439095, -0.4131406, 2.444324, 0, 1, 0.9882353, 1,
0.015158, 0.1774527, 0.639234, 0, 1, 0.9921569, 1,
0.01596236, -0.08647508, 2.987803, 0, 1, 1, 1,
0.01616615, -0.3007532, 1.982914, 0, 0.9921569, 1, 1,
0.01712069, -0.05083483, 1.666403, 0, 0.9882353, 1, 1,
0.02364352, -0.7447592, 2.625549, 0, 0.9803922, 1, 1,
0.02419741, 0.3233717, 0.4749803, 0, 0.9764706, 1, 1,
0.02419824, 0.1488868, -1.063864, 0, 0.9686275, 1, 1,
0.02486656, 0.1968295, -1.017772, 0, 0.9647059, 1, 1,
0.02539328, 0.4606503, 0.4212584, 0, 0.9568627, 1, 1,
0.02809975, -0.6494713, 3.945772, 0, 0.9529412, 1, 1,
0.03091655, 0.7887374, 1.023069, 0, 0.945098, 1, 1,
0.03242804, -0.9646249, 1.167988, 0, 0.9411765, 1, 1,
0.03761039, 0.3501682, 2.091109, 0, 0.9333333, 1, 1,
0.03786493, 0.6691788, 1.332305, 0, 0.9294118, 1, 1,
0.03794837, 0.09232657, -0.3528576, 0, 0.9215686, 1, 1,
0.04264352, -0.3597159, 2.767338, 0, 0.9176471, 1, 1,
0.04326377, 0.2917468, -1.518116, 0, 0.9098039, 1, 1,
0.04429625, 1.374107, -0.5548743, 0, 0.9058824, 1, 1,
0.04448039, 1.52383, -0.181344, 0, 0.8980392, 1, 1,
0.04608464, -0.366618, 1.652131, 0, 0.8901961, 1, 1,
0.04848646, 1.495137, -1.162987, 0, 0.8862745, 1, 1,
0.04927144, -0.06657278, 2.234861, 0, 0.8784314, 1, 1,
0.04997943, 0.2733097, 0.1131746, 0, 0.8745098, 1, 1,
0.05032407, 1.47971, -0.04760911, 0, 0.8666667, 1, 1,
0.05100859, 1.71835, 0.5426047, 0, 0.8627451, 1, 1,
0.05107119, -1.157918, 3.094647, 0, 0.854902, 1, 1,
0.05325247, -0.4741985, 2.18946, 0, 0.8509804, 1, 1,
0.05475553, 1.399478, 0.8759929, 0, 0.8431373, 1, 1,
0.05898283, -0.8427333, 3.199914, 0, 0.8392157, 1, 1,
0.07288152, -0.2946908, 2.581364, 0, 0.8313726, 1, 1,
0.07751337, -0.7864076, 2.48585, 0, 0.827451, 1, 1,
0.08597636, -1.754807, 3.911532, 0, 0.8196079, 1, 1,
0.08653214, 0.2831125, -1.4948, 0, 0.8156863, 1, 1,
0.0890236, -0.8009189, 3.550005, 0, 0.8078431, 1, 1,
0.09368666, 1.214997, 1.615219, 0, 0.8039216, 1, 1,
0.1008677, -0.3383411, 2.030654, 0, 0.7960784, 1, 1,
0.1036357, 0.1547708, 0.536089, 0, 0.7882353, 1, 1,
0.1056212, 0.0555343, 0.2679057, 0, 0.7843137, 1, 1,
0.1093454, 1.624636, 0.8931093, 0, 0.7764706, 1, 1,
0.1114378, -0.8565429, 3.790629, 0, 0.772549, 1, 1,
0.1121742, 0.4561108, 1.85517, 0, 0.7647059, 1, 1,
0.1132357, -0.5022056, 0.7338921, 0, 0.7607843, 1, 1,
0.1199603, 1.569103, -0.1321313, 0, 0.7529412, 1, 1,
0.1202189, -1.637522, 2.40996, 0, 0.7490196, 1, 1,
0.1229071, 0.9753336, 0.3327309, 0, 0.7411765, 1, 1,
0.1259222, 0.7178738, 0.06427729, 0, 0.7372549, 1, 1,
0.1297077, -0.2653053, 1.825094, 0, 0.7294118, 1, 1,
0.1309522, 1.422086, -0.1129783, 0, 0.7254902, 1, 1,
0.1350948, -0.9623083, 3.727213, 0, 0.7176471, 1, 1,
0.1414648, 0.3552193, -1.465885, 0, 0.7137255, 1, 1,
0.1484918, -0.7498929, 1.828012, 0, 0.7058824, 1, 1,
0.1495896, -0.6726075, 2.566787, 0, 0.6980392, 1, 1,
0.1546482, 1.605752, 0.7162085, 0, 0.6941177, 1, 1,
0.1562468, 0.1740181, 0.4551712, 0, 0.6862745, 1, 1,
0.1602276, -0.7367287, 2.999339, 0, 0.682353, 1, 1,
0.1608946, 0.9171979, 0.4887681, 0, 0.6745098, 1, 1,
0.1623458, -1.951192, 3.921105, 0, 0.6705883, 1, 1,
0.1646893, 0.09870575, 1.347177, 0, 0.6627451, 1, 1,
0.1670981, -1.387842, 3.835522, 0, 0.6588235, 1, 1,
0.1679573, 2.135366, 0.6685982, 0, 0.6509804, 1, 1,
0.1703316, 0.1923381, 0.5968854, 0, 0.6470588, 1, 1,
0.1716008, -1.119461, 3.293314, 0, 0.6392157, 1, 1,
0.1767088, 1.306271, -1.291782, 0, 0.6352941, 1, 1,
0.1786457, 0.5736141, 0.1169331, 0, 0.627451, 1, 1,
0.1868044, 2.235405, 2.305541, 0, 0.6235294, 1, 1,
0.1909375, 0.4939236, 0.1374154, 0, 0.6156863, 1, 1,
0.1921474, -0.09335306, 1.945966, 0, 0.6117647, 1, 1,
0.1927728, 0.3871885, 0.7342103, 0, 0.6039216, 1, 1,
0.2030694, -2.245439, 2.366087, 0, 0.5960785, 1, 1,
0.2051886, -0.8039597, 3.75806, 0, 0.5921569, 1, 1,
0.2062982, 0.8031912, 0.672691, 0, 0.5843138, 1, 1,
0.2127865, 0.9243652, -0.9729311, 0, 0.5803922, 1, 1,
0.2175391, 0.8711908, 0.2020392, 0, 0.572549, 1, 1,
0.2200387, -0.5727821, 2.264019, 0, 0.5686275, 1, 1,
0.224448, 0.1586318, 1.123082, 0, 0.5607843, 1, 1,
0.2266293, 1.230332, -0.6531349, 0, 0.5568628, 1, 1,
0.2290378, 1.021957, 1.682369, 0, 0.5490196, 1, 1,
0.230377, -1.125923, 3.617414, 0, 0.5450981, 1, 1,
0.2313551, -0.4815411, 1.08324, 0, 0.5372549, 1, 1,
0.2322403, -0.4063751, 1.491946, 0, 0.5333334, 1, 1,
0.2340451, -0.1701594, 1.459947, 0, 0.5254902, 1, 1,
0.2377859, -1.276836, 1.485864, 0, 0.5215687, 1, 1,
0.2392638, 1.74079, -0.5215109, 0, 0.5137255, 1, 1,
0.2406243, 0.6569079, 0.7463008, 0, 0.509804, 1, 1,
0.2437352, -0.5192415, 1.930682, 0, 0.5019608, 1, 1,
0.2443002, 0.03844849, 0.1440534, 0, 0.4941176, 1, 1,
0.2515359, -0.0330225, -0.7671452, 0, 0.4901961, 1, 1,
0.2518932, -0.3543637, 4.518281, 0, 0.4823529, 1, 1,
0.2547597, -1.041322, 3.795586, 0, 0.4784314, 1, 1,
0.2550339, -1.149443, 3.014721, 0, 0.4705882, 1, 1,
0.2572189, -0.6652768, 2.570624, 0, 0.4666667, 1, 1,
0.2600306, -0.03122192, 2.650638, 0, 0.4588235, 1, 1,
0.2615231, -0.3336508, 3.135888, 0, 0.454902, 1, 1,
0.2635956, 0.8542951, -0.6301111, 0, 0.4470588, 1, 1,
0.2645609, 0.8083213, 1.029894, 0, 0.4431373, 1, 1,
0.2650636, -1.247302, 3.27243, 0, 0.4352941, 1, 1,
0.2687693, -1.086719, 3.157341, 0, 0.4313726, 1, 1,
0.2711076, -1.071213, 4.081578, 0, 0.4235294, 1, 1,
0.2712297, -1.259707, 2.058311, 0, 0.4196078, 1, 1,
0.2763754, 1.573164, -0.9048459, 0, 0.4117647, 1, 1,
0.2769953, 0.6761547, -0.3824749, 0, 0.4078431, 1, 1,
0.2812447, -1.565916, 3.435, 0, 0.4, 1, 1,
0.2831238, 0.9709952, -0.5336704, 0, 0.3921569, 1, 1,
0.287867, -0.2529186, 3.140203, 0, 0.3882353, 1, 1,
0.2888032, 0.6773618, 0.6441504, 0, 0.3803922, 1, 1,
0.2905463, -1.342641, 3.400192, 0, 0.3764706, 1, 1,
0.2915609, -0.6164162, 2.439156, 0, 0.3686275, 1, 1,
0.2922288, -2.285402, 1.044849, 0, 0.3647059, 1, 1,
0.297033, 0.5589784, 1.597241, 0, 0.3568628, 1, 1,
0.303675, 0.5906162, -1.145487, 0, 0.3529412, 1, 1,
0.3044641, 1.651163, -0.271549, 0, 0.345098, 1, 1,
0.3067726, 2.381913, -0.9179592, 0, 0.3411765, 1, 1,
0.309103, -0.8836868, 4.351203, 0, 0.3333333, 1, 1,
0.310452, -0.3717233, 2.227724, 0, 0.3294118, 1, 1,
0.3148246, -0.1084962, 1.354164, 0, 0.3215686, 1, 1,
0.3176934, 0.590891, -0.7699365, 0, 0.3176471, 1, 1,
0.3190219, 1.140843, -0.8725312, 0, 0.3098039, 1, 1,
0.3209083, -0.6314472, 2.924242, 0, 0.3058824, 1, 1,
0.3218912, 0.8795818, 0.7920474, 0, 0.2980392, 1, 1,
0.3221029, -1.578518, 2.685051, 0, 0.2901961, 1, 1,
0.3263689, 0.1602336, 0.04977684, 0, 0.2862745, 1, 1,
0.3315269, 1.942023, 1.727585, 0, 0.2784314, 1, 1,
0.3336113, -0.2965852, 1.522675, 0, 0.2745098, 1, 1,
0.3340404, 0.7143373, 0.9584199, 0, 0.2666667, 1, 1,
0.3349718, 0.2354997, 0.3917594, 0, 0.2627451, 1, 1,
0.3371173, -0.608851, 1.505888, 0, 0.254902, 1, 1,
0.3380516, -0.2545192, 0.4655963, 0, 0.2509804, 1, 1,
0.3476576, -0.7503061, 2.433262, 0, 0.2431373, 1, 1,
0.3590729, 0.5124889, -0.1200477, 0, 0.2392157, 1, 1,
0.3594643, -0.9156965, 2.929157, 0, 0.2313726, 1, 1,
0.3641086, -0.2684088, 1.499043, 0, 0.227451, 1, 1,
0.3671447, -0.393074, 3.076325, 0, 0.2196078, 1, 1,
0.3675705, 0.2075897, 2.124565, 0, 0.2156863, 1, 1,
0.3685777, 0.3580594, 0.8307618, 0, 0.2078431, 1, 1,
0.3701566, -0.7061979, 3.963018, 0, 0.2039216, 1, 1,
0.3704627, -0.1856873, 1.586096, 0, 0.1960784, 1, 1,
0.3763153, -0.4609296, 1.019445, 0, 0.1882353, 1, 1,
0.3772432, -1.353655, 1.261583, 0, 0.1843137, 1, 1,
0.3790989, -0.439348, 1.532394, 0, 0.1764706, 1, 1,
0.3791701, -0.3862808, 2.204651, 0, 0.172549, 1, 1,
0.3825773, -1.970301, 2.57934, 0, 0.1647059, 1, 1,
0.3853336, -0.9719418, 2.430984, 0, 0.1607843, 1, 1,
0.3858649, -0.1809461, 2.603306, 0, 0.1529412, 1, 1,
0.4005795, 1.169014, 1.55532, 0, 0.1490196, 1, 1,
0.4018557, -1.59113, 2.989022, 0, 0.1411765, 1, 1,
0.4077001, 2.131277, 0.2763863, 0, 0.1372549, 1, 1,
0.4082357, 0.01149917, 2.91574, 0, 0.1294118, 1, 1,
0.4107434, 0.656776, -0.2874843, 0, 0.1254902, 1, 1,
0.4128273, 0.4789197, -0.9267869, 0, 0.1176471, 1, 1,
0.4183032, -0.1804683, 1.581012, 0, 0.1137255, 1, 1,
0.4194521, -1.794779, 2.41532, 0, 0.1058824, 1, 1,
0.4221312, 0.1731864, -0.3394697, 0, 0.09803922, 1, 1,
0.4235281, -0.1074886, 1.478637, 0, 0.09411765, 1, 1,
0.4271622, -1.828455, 3.362077, 0, 0.08627451, 1, 1,
0.4286571, 0.3792274, 2.17182, 0, 0.08235294, 1, 1,
0.4298643, -1.269418, 2.634238, 0, 0.07450981, 1, 1,
0.4344574, -1.553196, 2.280342, 0, 0.07058824, 1, 1,
0.442056, 0.7444314, 0.4498332, 0, 0.0627451, 1, 1,
0.4453078, -0.8904247, 1.321278, 0, 0.05882353, 1, 1,
0.4463601, -1.517194, 1.957769, 0, 0.05098039, 1, 1,
0.4465168, -0.603743, 1.768129, 0, 0.04705882, 1, 1,
0.4535538, -0.5633648, 0.05365583, 0, 0.03921569, 1, 1,
0.4574411, -0.1857336, 2.195488, 0, 0.03529412, 1, 1,
0.4591556, 0.4808677, 2.164869, 0, 0.02745098, 1, 1,
0.4598726, -1.110627, 1.398558, 0, 0.02352941, 1, 1,
0.4607484, 0.1548056, -1.313365, 0, 0.01568628, 1, 1,
0.4612595, 0.4753596, -0.2756703, 0, 0.01176471, 1, 1,
0.4614518, 0.777187, -1.287096, 0, 0.003921569, 1, 1,
0.465634, 0.1640949, 0.9449783, 0.003921569, 0, 1, 1,
0.4664939, -0.1028299, 3.185232, 0.007843138, 0, 1, 1,
0.4676923, -0.2819678, 2.364849, 0.01568628, 0, 1, 1,
0.470761, -1.025786, 4.740728, 0.01960784, 0, 1, 1,
0.4734053, -0.5983918, 2.117718, 0.02745098, 0, 1, 1,
0.4746071, 0.9053012, 0.4030585, 0.03137255, 0, 1, 1,
0.4802209, 0.2064135, 0.009501954, 0.03921569, 0, 1, 1,
0.4809269, -0.7589473, 3.050596, 0.04313726, 0, 1, 1,
0.4857597, 0.7408813, 1.724602, 0.05098039, 0, 1, 1,
0.4889587, 0.4392178, 0.6072117, 0.05490196, 0, 1, 1,
0.4970128, 0.5022897, 0.5249041, 0.0627451, 0, 1, 1,
0.4980699, 0.5907624, 1.294311, 0.06666667, 0, 1, 1,
0.5017454, 1.117576, 0.1879709, 0.07450981, 0, 1, 1,
0.5043611, 0.7980726, -0.4424728, 0.07843138, 0, 1, 1,
0.5060931, 1.376865, 0.1420717, 0.08627451, 0, 1, 1,
0.5087047, 0.6084875, -0.3035422, 0.09019608, 0, 1, 1,
0.5090762, 0.623666, 1.480963, 0.09803922, 0, 1, 1,
0.5122717, -0.3861079, 2.934574, 0.1058824, 0, 1, 1,
0.5142122, 0.6377325, 0.4321083, 0.1098039, 0, 1, 1,
0.5169638, 0.3423544, 2.315, 0.1176471, 0, 1, 1,
0.5213953, 1.322489, 0.3374754, 0.1215686, 0, 1, 1,
0.5216067, 0.9196841, 2.619273, 0.1294118, 0, 1, 1,
0.5227709, 1.048245, 1.011017, 0.1333333, 0, 1, 1,
0.5259949, 1.476017, 2.197984, 0.1411765, 0, 1, 1,
0.5313936, -1.150588, 4.043798, 0.145098, 0, 1, 1,
0.53472, -0.2137228, 4.678513, 0.1529412, 0, 1, 1,
0.5350227, -0.3666748, 2.343712, 0.1568628, 0, 1, 1,
0.5359288, -0.02085515, 2.347512, 0.1647059, 0, 1, 1,
0.5375126, -0.01800963, 1.520218, 0.1686275, 0, 1, 1,
0.5477549, 0.1870329, 1.769834, 0.1764706, 0, 1, 1,
0.5512471, 0.2339697, 1.324567, 0.1803922, 0, 1, 1,
0.5523396, 0.2483949, 1.347462, 0.1882353, 0, 1, 1,
0.5566882, -0.7977394, 3.083848, 0.1921569, 0, 1, 1,
0.5571513, -0.5766351, 2.564203, 0.2, 0, 1, 1,
0.5573631, 0.5395624, 0.3487706, 0.2078431, 0, 1, 1,
0.5574523, -1.959231, 2.848693, 0.2117647, 0, 1, 1,
0.5589598, -0.9565585, 3.532787, 0.2196078, 0, 1, 1,
0.5599758, 0.7844958, -1.30994, 0.2235294, 0, 1, 1,
0.5727078, -0.7805343, 3.243545, 0.2313726, 0, 1, 1,
0.5727466, 1.254817, 0.3724574, 0.2352941, 0, 1, 1,
0.5761339, -1.306546, 2.97048, 0.2431373, 0, 1, 1,
0.5797001, -1.317423, 2.435979, 0.2470588, 0, 1, 1,
0.5834984, -1.00527, 0.3087982, 0.254902, 0, 1, 1,
0.5867407, 0.2179992, 0.7080014, 0.2588235, 0, 1, 1,
0.5900928, 0.5285515, 1.534739, 0.2666667, 0, 1, 1,
0.5947389, 0.1535269, 1.637584, 0.2705882, 0, 1, 1,
0.5992166, -0.01541472, 0.7902082, 0.2784314, 0, 1, 1,
0.5997752, -0.4125538, 1.539907, 0.282353, 0, 1, 1,
0.6044697, -0.492559, 2.627919, 0.2901961, 0, 1, 1,
0.6062748, -1.090708, 3.501063, 0.2941177, 0, 1, 1,
0.6080804, 0.8769808, -0.5898528, 0.3019608, 0, 1, 1,
0.6119262, -0.07032617, 1.48904, 0.3098039, 0, 1, 1,
0.6125028, 1.080654, 1.05471, 0.3137255, 0, 1, 1,
0.613637, 0.8906188, 1.982792, 0.3215686, 0, 1, 1,
0.6157169, -0.1260758, 2.426759, 0.3254902, 0, 1, 1,
0.6184205, 1.283581, 0.125242, 0.3333333, 0, 1, 1,
0.6234266, -1.000269, 2.009966, 0.3372549, 0, 1, 1,
0.6251553, 0.5357277, 2.195008, 0.345098, 0, 1, 1,
0.6297376, 1.650307, 0.9160392, 0.3490196, 0, 1, 1,
0.6353773, 0.1775897, 2.302924, 0.3568628, 0, 1, 1,
0.6362048, 0.3115726, 1.394787, 0.3607843, 0, 1, 1,
0.6363829, -2.409355, 1.209456, 0.3686275, 0, 1, 1,
0.6434197, 1.549922, -0.5896088, 0.372549, 0, 1, 1,
0.6447368, 1.715166, 0.6795654, 0.3803922, 0, 1, 1,
0.6466808, 0.1005513, 2.75198, 0.3843137, 0, 1, 1,
0.6497406, -1.35559, 4.342043, 0.3921569, 0, 1, 1,
0.6524271, -0.5415766, 2.781442, 0.3960784, 0, 1, 1,
0.6528066, -2.029132, 2.764638, 0.4039216, 0, 1, 1,
0.6561487, 0.7779806, -0.1483901, 0.4117647, 0, 1, 1,
0.6599706, 0.3320225, 0.5013233, 0.4156863, 0, 1, 1,
0.6608973, -0.5924134, 0.314489, 0.4235294, 0, 1, 1,
0.6642212, 0.7847501, 1.034139, 0.427451, 0, 1, 1,
0.6706021, -0.03263574, 1.195432, 0.4352941, 0, 1, 1,
0.7053025, 1.285219, 0.3385417, 0.4392157, 0, 1, 1,
0.7077705, 0.03247356, 2.597531, 0.4470588, 0, 1, 1,
0.7098293, 0.2565891, 1.760392, 0.4509804, 0, 1, 1,
0.7122404, -0.3167177, 2.031305, 0.4588235, 0, 1, 1,
0.714279, 0.4634051, 1.595852, 0.4627451, 0, 1, 1,
0.7187039, 0.5665078, -0.553387, 0.4705882, 0, 1, 1,
0.7235773, 0.805316, 1.084948, 0.4745098, 0, 1, 1,
0.7243074, 0.2300019, -0.1437441, 0.4823529, 0, 1, 1,
0.7268769, 2.742762, 1.024405, 0.4862745, 0, 1, 1,
0.7315064, -1.266296, 1.128721, 0.4941176, 0, 1, 1,
0.7316444, -0.8042535, 1.524155, 0.5019608, 0, 1, 1,
0.7324657, 0.9781022, 0.1005757, 0.5058824, 0, 1, 1,
0.7351453, 2.127007, 0.3148446, 0.5137255, 0, 1, 1,
0.7359198, 0.4918391, 1.649872, 0.5176471, 0, 1, 1,
0.7391008, -0.3488792, 2.307976, 0.5254902, 0, 1, 1,
0.7409138, -1.420913, 1.581613, 0.5294118, 0, 1, 1,
0.7419676, 0.9342135, 0.8348379, 0.5372549, 0, 1, 1,
0.7479168, -0.6166607, 2.325378, 0.5411765, 0, 1, 1,
0.7484702, 1.040732, 0.6001356, 0.5490196, 0, 1, 1,
0.7511686, 0.1828674, 0.592077, 0.5529412, 0, 1, 1,
0.7528849, 1.704978, 0.7580252, 0.5607843, 0, 1, 1,
0.753678, 1.260113, -0.2212943, 0.5647059, 0, 1, 1,
0.762958, 0.1253208, 0.7363579, 0.572549, 0, 1, 1,
0.7664371, -0.7150014, 2.028606, 0.5764706, 0, 1, 1,
0.7737957, -0.7941836, 3.435585, 0.5843138, 0, 1, 1,
0.7789379, 0.9792517, -0.002577321, 0.5882353, 0, 1, 1,
0.7820775, -0.2371324, 2.695251, 0.5960785, 0, 1, 1,
0.7821352, -0.1747562, 1.801472, 0.6039216, 0, 1, 1,
0.7866634, 0.5717674, 1.334436, 0.6078432, 0, 1, 1,
0.7931966, 0.4556888, 1.465992, 0.6156863, 0, 1, 1,
0.7953229, -0.6065654, 0.5984677, 0.6196079, 0, 1, 1,
0.801541, 1.374074, 0.5788838, 0.627451, 0, 1, 1,
0.8088759, -0.07270603, 0.7081428, 0.6313726, 0, 1, 1,
0.8101674, 1.014179, 0.7552155, 0.6392157, 0, 1, 1,
0.8118371, -0.8969529, 3.033645, 0.6431373, 0, 1, 1,
0.8193879, -1.228605, 2.35562, 0.6509804, 0, 1, 1,
0.8236114, -0.4482265, 2.882999, 0.654902, 0, 1, 1,
0.8240933, 0.2816893, 1.609269, 0.6627451, 0, 1, 1,
0.8350374, -0.7553588, 3.80022, 0.6666667, 0, 1, 1,
0.8442883, 0.4224732, 1.074784, 0.6745098, 0, 1, 1,
0.8502262, -0.3361003, 0.1051304, 0.6784314, 0, 1, 1,
0.8507048, -0.4316548, 1.816524, 0.6862745, 0, 1, 1,
0.8556847, -0.9985242, 0.4321981, 0.6901961, 0, 1, 1,
0.8621024, 0.9007307, -0.1039097, 0.6980392, 0, 1, 1,
0.8657861, -1.042551, 2.192184, 0.7058824, 0, 1, 1,
0.8660541, -0.689882, 1.536853, 0.7098039, 0, 1, 1,
0.8664556, -1.699022, 3.326836, 0.7176471, 0, 1, 1,
0.8723651, -1.424231, 2.528866, 0.7215686, 0, 1, 1,
0.8753386, 0.2635739, 1.078082, 0.7294118, 0, 1, 1,
0.8776234, 0.1284543, 0.8740472, 0.7333333, 0, 1, 1,
0.8798023, -2.043586, 2.786538, 0.7411765, 0, 1, 1,
0.8917349, 0.07847384, -0.4888114, 0.7450981, 0, 1, 1,
0.8997877, 0.3850769, 2.617969, 0.7529412, 0, 1, 1,
0.9031252, -0.640058, 2.381606, 0.7568628, 0, 1, 1,
0.9046296, 0.6514369, 0.929728, 0.7647059, 0, 1, 1,
0.9071237, -0.7435557, 3.664071, 0.7686275, 0, 1, 1,
0.9072686, 1.145482, 2.829607, 0.7764706, 0, 1, 1,
0.9141317, -2.49165, 3.280491, 0.7803922, 0, 1, 1,
0.9272901, -0.09991387, 0.3252454, 0.7882353, 0, 1, 1,
0.9298718, 0.2837983, 0.4537294, 0.7921569, 0, 1, 1,
0.9331878, 0.976127, 2.464355, 0.8, 0, 1, 1,
0.9370027, 0.8457967, 1.20042, 0.8078431, 0, 1, 1,
0.9487883, -0.5116042, 1.479845, 0.8117647, 0, 1, 1,
0.9503351, -1.037482, 2.438067, 0.8196079, 0, 1, 1,
0.9524455, 1.88949, 0.5868658, 0.8235294, 0, 1, 1,
0.9574965, -0.5747929, 2.210505, 0.8313726, 0, 1, 1,
0.958505, -1.261745, 2.244439, 0.8352941, 0, 1, 1,
0.9602447, 1.800793, 0.2580025, 0.8431373, 0, 1, 1,
0.962736, 1.622151, -0.2618243, 0.8470588, 0, 1, 1,
0.9639874, -1.572554, 2.774805, 0.854902, 0, 1, 1,
0.9648603, 0.2358943, 2.204663, 0.8588235, 0, 1, 1,
0.970163, 0.3056122, 2.720272, 0.8666667, 0, 1, 1,
0.9762128, -0.3622866, 2.347517, 0.8705882, 0, 1, 1,
0.978015, -0.695079, 1.188363, 0.8784314, 0, 1, 1,
0.9805129, -0.3830121, 2.641703, 0.8823529, 0, 1, 1,
0.9867466, -1.209602, 1.885367, 0.8901961, 0, 1, 1,
0.9891059, -0.3700795, 3.001793, 0.8941177, 0, 1, 1,
0.9908933, -1.486144, 1.51761, 0.9019608, 0, 1, 1,
0.9927224, -0.6096628, 2.636488, 0.9098039, 0, 1, 1,
0.9990451, -0.7368576, 2.809161, 0.9137255, 0, 1, 1,
1.007296, 1.229691, 0.1007235, 0.9215686, 0, 1, 1,
1.016364, -0.5747279, 1.461666, 0.9254902, 0, 1, 1,
1.018469, 0.4054436, 0.2011576, 0.9333333, 0, 1, 1,
1.024467, -1.046734, 2.232328, 0.9372549, 0, 1, 1,
1.029646, -3.190281, 3.305073, 0.945098, 0, 1, 1,
1.038778, 1.189023, 2.166526, 0.9490196, 0, 1, 1,
1.040751, -0.366248, 1.934545, 0.9568627, 0, 1, 1,
1.042121, 0.5649991, 1.883699, 0.9607843, 0, 1, 1,
1.043027, 0.4280287, 2.590485, 0.9686275, 0, 1, 1,
1.043694, -1.203261, 2.934254, 0.972549, 0, 1, 1,
1.047073, 1.746443, -1.621276, 0.9803922, 0, 1, 1,
1.052111, -0.08773247, 1.725794, 0.9843137, 0, 1, 1,
1.054988, 1.119361, 0.01829316, 0.9921569, 0, 1, 1,
1.060401, 0.35395, 2.837107, 0.9960784, 0, 1, 1,
1.061962, 0.4810075, 0.3361672, 1, 0, 0.9960784, 1,
1.062029, -1.113243, 2.78727, 1, 0, 0.9882353, 1,
1.062059, 0.8201838, 2.098303, 1, 0, 0.9843137, 1,
1.063554, -0.4010783, 1.090577, 1, 0, 0.9764706, 1,
1.065714, 0.05326303, 0.4947311, 1, 0, 0.972549, 1,
1.066906, -1.092257, 1.54943, 1, 0, 0.9647059, 1,
1.068864, -0.5282083, 1.556262, 1, 0, 0.9607843, 1,
1.070265, 0.8056457, -2.086056, 1, 0, 0.9529412, 1,
1.074419, -0.232579, 2.250913, 1, 0, 0.9490196, 1,
1.075016, 0.5785941, 0.8215813, 1, 0, 0.9411765, 1,
1.075162, 1.064221, 1.743429, 1, 0, 0.9372549, 1,
1.079956, -1.994292, 1.929408, 1, 0, 0.9294118, 1,
1.079992, 2.204463, 1.273148, 1, 0, 0.9254902, 1,
1.083199, 2.620971, -0.08169015, 1, 0, 0.9176471, 1,
1.084457, 0.4348707, 2.90891, 1, 0, 0.9137255, 1,
1.089586, 1.11402, 0.2458209, 1, 0, 0.9058824, 1,
1.093141, 0.09938971, 0.189863, 1, 0, 0.9019608, 1,
1.098519, 0.7254475, 2.086744, 1, 0, 0.8941177, 1,
1.105809, -2.238379, 3.585207, 1, 0, 0.8862745, 1,
1.110372, -0.5356837, 2.558316, 1, 0, 0.8823529, 1,
1.112338, 0.8948418, 0.6196728, 1, 0, 0.8745098, 1,
1.125072, 1.469347, 0.6243109, 1, 0, 0.8705882, 1,
1.129627, 1.098961, 1.269701, 1, 0, 0.8627451, 1,
1.133915, 0.9139549, 0.377176, 1, 0, 0.8588235, 1,
1.133922, 0.7254195, 1.503723, 1, 0, 0.8509804, 1,
1.13761, -0.1607153, 2.942276, 1, 0, 0.8470588, 1,
1.145646, 1.194184, 1.735303, 1, 0, 0.8392157, 1,
1.1472, -0.09004921, 0.3404834, 1, 0, 0.8352941, 1,
1.148286, -1.254273, 3.151009, 1, 0, 0.827451, 1,
1.148804, -0.5179963, 4.020356, 1, 0, 0.8235294, 1,
1.149567, 1.647547, 0.2998456, 1, 0, 0.8156863, 1,
1.150454, 1.191542, 0.04820808, 1, 0, 0.8117647, 1,
1.157057, -0.5053383, 2.310737, 1, 0, 0.8039216, 1,
1.161329, -0.5806345, 2.282329, 1, 0, 0.7960784, 1,
1.161971, -0.7103235, 2.141398, 1, 0, 0.7921569, 1,
1.163669, -1.400667, 2.768216, 1, 0, 0.7843137, 1,
1.165081, 1.093195, 1.473384, 1, 0, 0.7803922, 1,
1.167473, 0.7683539, 0.05787033, 1, 0, 0.772549, 1,
1.178051, -0.0750182, -0.04204871, 1, 0, 0.7686275, 1,
1.18324, -0.5100083, 1.167336, 1, 0, 0.7607843, 1,
1.186614, -0.3106895, 0.4002043, 1, 0, 0.7568628, 1,
1.195293, -0.899323, 2.761657, 1, 0, 0.7490196, 1,
1.195996, 0.8377113, 1.080676, 1, 0, 0.7450981, 1,
1.196139, -0.2956207, 3.896577, 1, 0, 0.7372549, 1,
1.196558, 0.5266126, -0.1269151, 1, 0, 0.7333333, 1,
1.201106, 1.01409, -0.1228266, 1, 0, 0.7254902, 1,
1.207381, 0.1037169, 1.842806, 1, 0, 0.7215686, 1,
1.212783, 0.1502375, 1.418144, 1, 0, 0.7137255, 1,
1.217523, 0.8526987, -1.147087, 1, 0, 0.7098039, 1,
1.220737, 0.9798475, 1.013708, 1, 0, 0.7019608, 1,
1.225087, 0.3334945, 1.452165, 1, 0, 0.6941177, 1,
1.246692, -0.09914776, 2.927285, 1, 0, 0.6901961, 1,
1.249155, 0.08011553, 3.071966, 1, 0, 0.682353, 1,
1.256989, 2.389133, 1.498484, 1, 0, 0.6784314, 1,
1.261363, -0.8624116, 0.5559452, 1, 0, 0.6705883, 1,
1.264493, 0.2219928, 0.830636, 1, 0, 0.6666667, 1,
1.279003, -0.2055412, 3.166509, 1, 0, 0.6588235, 1,
1.281622, 0.3802003, 0.4669244, 1, 0, 0.654902, 1,
1.283945, 0.02361687, 1.980442, 1, 0, 0.6470588, 1,
1.28887, -1.178218, 1.284499, 1, 0, 0.6431373, 1,
1.298346, -0.2297602, 0.6705396, 1, 0, 0.6352941, 1,
1.303437, -0.06949247, -1.217159, 1, 0, 0.6313726, 1,
1.303444, -0.0837139, 1.437862, 1, 0, 0.6235294, 1,
1.30825, -0.4322381, 2.940294, 1, 0, 0.6196079, 1,
1.315643, 1.504606, 0.6102158, 1, 0, 0.6117647, 1,
1.319938, -0.6141192, 1.976931, 1, 0, 0.6078432, 1,
1.333919, -0.4802228, 2.703896, 1, 0, 0.6, 1,
1.367876, 0.6677547, 1.558441, 1, 0, 0.5921569, 1,
1.3755, -0.5874125, -1.358237, 1, 0, 0.5882353, 1,
1.379718, 0.6545995, 2.517534, 1, 0, 0.5803922, 1,
1.380414, -1.324643, 2.125789, 1, 0, 0.5764706, 1,
1.384764, -0.1600133, 1.105486, 1, 0, 0.5686275, 1,
1.388644, -0.7056625, 1.437599, 1, 0, 0.5647059, 1,
1.389994, -1.698302, 3.775436, 1, 0, 0.5568628, 1,
1.394235, 0.5170198, 1.971996, 1, 0, 0.5529412, 1,
1.394289, -0.2800471, 1.342769, 1, 0, 0.5450981, 1,
1.395342, -1.075973, 3.228401, 1, 0, 0.5411765, 1,
1.397163, -0.9155018, 2.453462, 1, 0, 0.5333334, 1,
1.406194, -1.362195, 4.249164, 1, 0, 0.5294118, 1,
1.408072, -0.5453231, 2.765956, 1, 0, 0.5215687, 1,
1.417849, -0.4282432, 2.869214, 1, 0, 0.5176471, 1,
1.421004, -1.488608, 2.310717, 1, 0, 0.509804, 1,
1.422509, 0.7210374, 0.5774509, 1, 0, 0.5058824, 1,
1.440865, 0.6166792, 1.121497, 1, 0, 0.4980392, 1,
1.45242, -0.8781208, 2.889178, 1, 0, 0.4901961, 1,
1.459612, -0.6941308, 2.649297, 1, 0, 0.4862745, 1,
1.472541, -0.8967149, 3.413042, 1, 0, 0.4784314, 1,
1.496986, 1.978554, -1.60783, 1, 0, 0.4745098, 1,
1.502679, 0.1308191, 1.658665, 1, 0, 0.4666667, 1,
1.505738, -0.5578122, 0.6475861, 1, 0, 0.4627451, 1,
1.513967, 1.259413, 0.9269698, 1, 0, 0.454902, 1,
1.514155, -0.673905, 0.08875222, 1, 0, 0.4509804, 1,
1.524487, 0.8455822, 2.4135, 1, 0, 0.4431373, 1,
1.524911, -0.6104126, 2.145475, 1, 0, 0.4392157, 1,
1.534378, 0.2064269, 2.574267, 1, 0, 0.4313726, 1,
1.5361, 0.2411034, 1.974428, 1, 0, 0.427451, 1,
1.53687, 0.3370194, 1.41332, 1, 0, 0.4196078, 1,
1.539362, 0.8318266, 0.1592281, 1, 0, 0.4156863, 1,
1.542195, -0.09499313, 2.77962, 1, 0, 0.4078431, 1,
1.543632, -0.4124766, 2.153883, 1, 0, 0.4039216, 1,
1.548768, -0.007074573, 1.791665, 1, 0, 0.3960784, 1,
1.559081, 2.390101, 1.11792, 1, 0, 0.3882353, 1,
1.560302, -0.7479563, 4.24981, 1, 0, 0.3843137, 1,
1.602632, -1.550277, 2.503503, 1, 0, 0.3764706, 1,
1.604685, -0.1615927, 3.35957, 1, 0, 0.372549, 1,
1.605215, 0.07658857, 2.043026, 1, 0, 0.3647059, 1,
1.606665, -0.3020728, 0.1003094, 1, 0, 0.3607843, 1,
1.608245, 0.6614746, 1.592516, 1, 0, 0.3529412, 1,
1.609312, 1.328535, -0.5062153, 1, 0, 0.3490196, 1,
1.610286, 0.006058376, 0.7597905, 1, 0, 0.3411765, 1,
1.622365, 0.6676514, 0.4473675, 1, 0, 0.3372549, 1,
1.630378, -1.754702, 3.7436, 1, 0, 0.3294118, 1,
1.641068, -2.506525, 2.504884, 1, 0, 0.3254902, 1,
1.669795, 1.512294, 1.010114, 1, 0, 0.3176471, 1,
1.67932, 1.139755, 2.463655, 1, 0, 0.3137255, 1,
1.702231, 0.4744514, -0.0009691829, 1, 0, 0.3058824, 1,
1.703718, -1.935497, 1.317188, 1, 0, 0.2980392, 1,
1.706925, -0.8189183, 2.090267, 1, 0, 0.2941177, 1,
1.734565, -0.8682301, 1.939895, 1, 0, 0.2862745, 1,
1.736512, -0.2685684, 3.763719, 1, 0, 0.282353, 1,
1.73949, 1.139434, 2.069998, 1, 0, 0.2745098, 1,
1.74239, 0.124999, 0.6667123, 1, 0, 0.2705882, 1,
1.743938, 1.519793, -0.4830619, 1, 0, 0.2627451, 1,
1.74473, 0.6371408, 0.1707819, 1, 0, 0.2588235, 1,
1.751362, 0.7579589, 1.594445, 1, 0, 0.2509804, 1,
1.752411, -0.1961531, 1.208876, 1, 0, 0.2470588, 1,
1.758613, -2.329049, 3.124093, 1, 0, 0.2392157, 1,
1.76144, -0.129386, 1.294133, 1, 0, 0.2352941, 1,
1.762484, -0.4490441, 1.925115, 1, 0, 0.227451, 1,
1.763947, 0.5048289, 2.092891, 1, 0, 0.2235294, 1,
1.79718, -0.5144818, 2.008526, 1, 0, 0.2156863, 1,
1.80072, -0.2153619, 1.187806, 1, 0, 0.2117647, 1,
1.81261, -0.06497364, 0.8171266, 1, 0, 0.2039216, 1,
1.850061, 1.406713, 1.613224, 1, 0, 0.1960784, 1,
1.857825, -0.03991089, 3.18628, 1, 0, 0.1921569, 1,
1.869482, -0.7213655, 1.284376, 1, 0, 0.1843137, 1,
1.876972, -1.214378, 3.860485, 1, 0, 0.1803922, 1,
1.88617, -0.8911071, 1.615307, 1, 0, 0.172549, 1,
1.891344, 0.05025487, 3.011465, 1, 0, 0.1686275, 1,
1.912685, 0.0352986, 2.041883, 1, 0, 0.1607843, 1,
1.918584, -0.09842871, 1.418912, 1, 0, 0.1568628, 1,
1.943383, -0.2416738, 3.633371, 1, 0, 0.1490196, 1,
1.970946, -0.6918148, 0.862332, 1, 0, 0.145098, 1,
1.973682, 1.023849, 1.297981, 1, 0, 0.1372549, 1,
1.985084, 1.347111, -0.7714095, 1, 0, 0.1333333, 1,
1.990187, 0.9951004, 1.236932, 1, 0, 0.1254902, 1,
2.002067, 2.191786, -0.3596275, 1, 0, 0.1215686, 1,
2.012862, -1.093436, 2.133125, 1, 0, 0.1137255, 1,
2.014008, 0.4451534, 1.527724, 1, 0, 0.1098039, 1,
2.014449, -0.9706215, 1.888713, 1, 0, 0.1019608, 1,
2.077648, -0.1336842, 2.876726, 1, 0, 0.09411765, 1,
2.100227, -0.9772868, 0.3915432, 1, 0, 0.09019608, 1,
2.123675, 0.7740538, 0.8965949, 1, 0, 0.08235294, 1,
2.143507, 0.04290144, 1.098907, 1, 0, 0.07843138, 1,
2.184152, 0.2930233, 1.203961, 1, 0, 0.07058824, 1,
2.278464, 1.391017, 1.36574, 1, 0, 0.06666667, 1,
2.321669, 1.424683, -0.3935823, 1, 0, 0.05882353, 1,
2.361317, 2.194531, -0.5560952, 1, 0, 0.05490196, 1,
2.493384, 0.07239567, 1.103472, 1, 0, 0.04705882, 1,
2.497151, 0.3609459, 2.551172, 1, 0, 0.04313726, 1,
2.654341, -0.02968825, -1.472874, 1, 0, 0.03529412, 1,
2.66634, 0.5000483, 1.572795, 1, 0, 0.03137255, 1,
2.720775, 0.1146238, 2.414886, 1, 0, 0.02352941, 1,
2.75013, -0.7712837, 2.062084, 1, 0, 0.01960784, 1,
2.852449, -0.521458, 0.8323612, 1, 0, 0.01176471, 1,
3.824212, 0.60667, 1.802586, 1, 0, 0.007843138, 1
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
0.1752201, -4.277141, -7.101055, 0, -0.5, 0.5, 0.5,
0.1752201, -4.277141, -7.101055, 1, -0.5, 0.5, 0.5,
0.1752201, -4.277141, -7.101055, 1, 1.5, 0.5, 0.5,
0.1752201, -4.277141, -7.101055, 0, 1.5, 0.5, 0.5
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
-4.71078, 0.01579392, -7.101055, 0, -0.5, 0.5, 0.5,
-4.71078, 0.01579392, -7.101055, 1, -0.5, 0.5, 0.5,
-4.71078, 0.01579392, -7.101055, 1, 1.5, 0.5, 0.5,
-4.71078, 0.01579392, -7.101055, 0, 1.5, 0.5, 0.5
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
-4.71078, -4.277141, -0.2090106, 0, -0.5, 0.5, 0.5,
-4.71078, -4.277141, -0.2090106, 1, -0.5, 0.5, 0.5,
-4.71078, -4.277141, -0.2090106, 1, 1.5, 0.5, 0.5,
-4.71078, -4.277141, -0.2090106, 0, 1.5, 0.5, 0.5
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
-2, -3.286463, -5.510583,
2, -3.286463, -5.510583,
-2, -3.286463, -5.510583,
-2, -3.451576, -5.775662,
0, -3.286463, -5.510583,
0, -3.451576, -5.775662,
2, -3.286463, -5.510583,
2, -3.451576, -5.775662
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
-2, -3.781802, -6.30582, 0, -0.5, 0.5, 0.5,
-2, -3.781802, -6.30582, 1, -0.5, 0.5, 0.5,
-2, -3.781802, -6.30582, 1, 1.5, 0.5, 0.5,
-2, -3.781802, -6.30582, 0, 1.5, 0.5, 0.5,
0, -3.781802, -6.30582, 0, -0.5, 0.5, 0.5,
0, -3.781802, -6.30582, 1, -0.5, 0.5, 0.5,
0, -3.781802, -6.30582, 1, 1.5, 0.5, 0.5,
0, -3.781802, -6.30582, 0, 1.5, 0.5, 0.5,
2, -3.781802, -6.30582, 0, -0.5, 0.5, 0.5,
2, -3.781802, -6.30582, 1, -0.5, 0.5, 0.5,
2, -3.781802, -6.30582, 1, 1.5, 0.5, 0.5,
2, -3.781802, -6.30582, 0, 1.5, 0.5, 0.5
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
-3.583241, -3, -5.510583,
-3.583241, 3, -5.510583,
-3.583241, -3, -5.510583,
-3.771164, -3, -5.775662,
-3.583241, -2, -5.510583,
-3.771164, -2, -5.775662,
-3.583241, -1, -5.510583,
-3.771164, -1, -5.775662,
-3.583241, 0, -5.510583,
-3.771164, 0, -5.775662,
-3.583241, 1, -5.510583,
-3.771164, 1, -5.775662,
-3.583241, 2, -5.510583,
-3.771164, 2, -5.775662,
-3.583241, 3, -5.510583,
-3.771164, 3, -5.775662
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
-4.14701, -3, -6.30582, 0, -0.5, 0.5, 0.5,
-4.14701, -3, -6.30582, 1, -0.5, 0.5, 0.5,
-4.14701, -3, -6.30582, 1, 1.5, 0.5, 0.5,
-4.14701, -3, -6.30582, 0, 1.5, 0.5, 0.5,
-4.14701, -2, -6.30582, 0, -0.5, 0.5, 0.5,
-4.14701, -2, -6.30582, 1, -0.5, 0.5, 0.5,
-4.14701, -2, -6.30582, 1, 1.5, 0.5, 0.5,
-4.14701, -2, -6.30582, 0, 1.5, 0.5, 0.5,
-4.14701, -1, -6.30582, 0, -0.5, 0.5, 0.5,
-4.14701, -1, -6.30582, 1, -0.5, 0.5, 0.5,
-4.14701, -1, -6.30582, 1, 1.5, 0.5, 0.5,
-4.14701, -1, -6.30582, 0, 1.5, 0.5, 0.5,
-4.14701, 0, -6.30582, 0, -0.5, 0.5, 0.5,
-4.14701, 0, -6.30582, 1, -0.5, 0.5, 0.5,
-4.14701, 0, -6.30582, 1, 1.5, 0.5, 0.5,
-4.14701, 0, -6.30582, 0, 1.5, 0.5, 0.5,
-4.14701, 1, -6.30582, 0, -0.5, 0.5, 0.5,
-4.14701, 1, -6.30582, 1, -0.5, 0.5, 0.5,
-4.14701, 1, -6.30582, 1, 1.5, 0.5, 0.5,
-4.14701, 1, -6.30582, 0, 1.5, 0.5, 0.5,
-4.14701, 2, -6.30582, 0, -0.5, 0.5, 0.5,
-4.14701, 2, -6.30582, 1, -0.5, 0.5, 0.5,
-4.14701, 2, -6.30582, 1, 1.5, 0.5, 0.5,
-4.14701, 2, -6.30582, 0, 1.5, 0.5, 0.5,
-4.14701, 3, -6.30582, 0, -0.5, 0.5, 0.5,
-4.14701, 3, -6.30582, 1, -0.5, 0.5, 0.5,
-4.14701, 3, -6.30582, 1, 1.5, 0.5, 0.5,
-4.14701, 3, -6.30582, 0, 1.5, 0.5, 0.5
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
-3.583241, -3.286463, -4,
-3.583241, -3.286463, 4,
-3.583241, -3.286463, -4,
-3.771164, -3.451576, -4,
-3.583241, -3.286463, -2,
-3.771164, -3.451576, -2,
-3.583241, -3.286463, 0,
-3.771164, -3.451576, 0,
-3.583241, -3.286463, 2,
-3.771164, -3.451576, 2,
-3.583241, -3.286463, 4,
-3.771164, -3.451576, 4
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
-4.14701, -3.781802, -4, 0, -0.5, 0.5, 0.5,
-4.14701, -3.781802, -4, 1, -0.5, 0.5, 0.5,
-4.14701, -3.781802, -4, 1, 1.5, 0.5, 0.5,
-4.14701, -3.781802, -4, 0, 1.5, 0.5, 0.5,
-4.14701, -3.781802, -2, 0, -0.5, 0.5, 0.5,
-4.14701, -3.781802, -2, 1, -0.5, 0.5, 0.5,
-4.14701, -3.781802, -2, 1, 1.5, 0.5, 0.5,
-4.14701, -3.781802, -2, 0, 1.5, 0.5, 0.5,
-4.14701, -3.781802, 0, 0, -0.5, 0.5, 0.5,
-4.14701, -3.781802, 0, 1, -0.5, 0.5, 0.5,
-4.14701, -3.781802, 0, 1, 1.5, 0.5, 0.5,
-4.14701, -3.781802, 0, 0, 1.5, 0.5, 0.5,
-4.14701, -3.781802, 2, 0, -0.5, 0.5, 0.5,
-4.14701, -3.781802, 2, 1, -0.5, 0.5, 0.5,
-4.14701, -3.781802, 2, 1, 1.5, 0.5, 0.5,
-4.14701, -3.781802, 2, 0, 1.5, 0.5, 0.5,
-4.14701, -3.781802, 4, 0, -0.5, 0.5, 0.5,
-4.14701, -3.781802, 4, 1, -0.5, 0.5, 0.5,
-4.14701, -3.781802, 4, 1, 1.5, 0.5, 0.5,
-4.14701, -3.781802, 4, 0, 1.5, 0.5, 0.5
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
-3.583241, -3.286463, -5.510583,
-3.583241, 3.318051, -5.510583,
-3.583241, -3.286463, 5.092562,
-3.583241, 3.318051, 5.092562,
-3.583241, -3.286463, -5.510583,
-3.583241, -3.286463, 5.092562,
-3.583241, 3.318051, -5.510583,
-3.583241, 3.318051, 5.092562,
-3.583241, -3.286463, -5.510583,
3.933681, -3.286463, -5.510583,
-3.583241, -3.286463, 5.092562,
3.933681, -3.286463, 5.092562,
-3.583241, 3.318051, -5.510583,
3.933681, 3.318051, -5.510583,
-3.583241, 3.318051, 5.092562,
3.933681, 3.318051, 5.092562,
3.933681, -3.286463, -5.510583,
3.933681, 3.318051, -5.510583,
3.933681, -3.286463, 5.092562,
3.933681, 3.318051, 5.092562,
3.933681, -3.286463, -5.510583,
3.933681, -3.286463, 5.092562,
3.933681, 3.318051, -5.510583,
3.933681, 3.318051, 5.092562
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
var radius = 7.784962;
var distance = 34.63617;
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
mvMatrix.translate( -0.1752201, -0.01579392, 0.2090106 );
mvMatrix.scale( 1.119774, 1.27447, 0.7938449 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.63617);
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
fluroxypyr<-read.table("fluroxypyr.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-fluroxypyr$V2
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
y<-fluroxypyr$V3
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
```

```r
z<-fluroxypyr$V4
```

```
## Error in eval(expr, envir, enclos): object 'fluroxypyr' not found
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
-3.473771, -0.3715549, -1.945922, 0, 0, 1, 1, 1,
-3.365042, 0.1278941, -2.805075, 1, 0, 0, 1, 1,
-3.32076, 0.9252663, -0.02783024, 1, 0, 0, 1, 1,
-2.834699, -1.338244, -2.015375, 1, 0, 0, 1, 1,
-2.695125, 0.1376672, -1.858972, 1, 0, 0, 1, 1,
-2.662101, 1.624277, -0.6165444, 1, 0, 0, 1, 1,
-2.636418, 1.026259, -1.048813, 0, 0, 0, 1, 1,
-2.633532, -2.201816, -3.053918, 0, 0, 0, 1, 1,
-2.604449, 0.8081962, -1.161923, 0, 0, 0, 1, 1,
-2.588996, 0.6036637, -0.5233682, 0, 0, 0, 1, 1,
-2.510559, 1.072161, -1.956455, 0, 0, 0, 1, 1,
-2.427346, -1.678113, -1.497311, 0, 0, 0, 1, 1,
-2.420162, 1.720362, -0.3391075, 0, 0, 0, 1, 1,
-2.41899, -0.2545722, -2.427026, 1, 1, 1, 1, 1,
-2.399574, -0.4223965, -2.65002, 1, 1, 1, 1, 1,
-2.396219, -0.8174764, -2.942907, 1, 1, 1, 1, 1,
-2.358263, -0.1815491, -2.410945, 1, 1, 1, 1, 1,
-2.35059, -0.5848254, -2.73403, 1, 1, 1, 1, 1,
-2.310127, 1.557254, -0.9749813, 1, 1, 1, 1, 1,
-2.296692, 1.046527, -2.109091, 1, 1, 1, 1, 1,
-2.291772, 1.56422, -0.76279, 1, 1, 1, 1, 1,
-2.226841, 1.876877, -0.9482982, 1, 1, 1, 1, 1,
-2.193764, -0.4912413, -2.22021, 1, 1, 1, 1, 1,
-2.158051, -0.5697278, -1.642906, 1, 1, 1, 1, 1,
-2.155023, 0.1622239, -0.6095691, 1, 1, 1, 1, 1,
-2.093141, 0.2181852, -2.336583, 1, 1, 1, 1, 1,
-2.073951, 0.2725815, -0.5550437, 1, 1, 1, 1, 1,
-2.009519, 0.6670189, -0.2919082, 1, 1, 1, 1, 1,
-1.982664, 1.207398, 0.1502862, 0, 0, 1, 1, 1,
-1.962007, 1.388252, -1.535925, 1, 0, 0, 1, 1,
-1.961894, -1.288463, -1.489716, 1, 0, 0, 1, 1,
-1.955237, -0.1006687, -1.849737, 1, 0, 0, 1, 1,
-1.933338, -0.7768378, -1.072674, 1, 0, 0, 1, 1,
-1.932297, 1.361354, -2.202573, 1, 0, 0, 1, 1,
-1.921872, -0.9975567, -2.795379, 0, 0, 0, 1, 1,
-1.891214, -0.103117, -1.129179, 0, 0, 0, 1, 1,
-1.888639, 0.07103078, -2.128593, 0, 0, 0, 1, 1,
-1.885603, 0.6223173, -0.7852196, 0, 0, 0, 1, 1,
-1.884088, 1.248127, -2.132764, 0, 0, 0, 1, 1,
-1.879933, 0.1853039, -2.448356, 0, 0, 0, 1, 1,
-1.85051, 0.3695961, -1.771286, 0, 0, 0, 1, 1,
-1.847284, -0.02464625, -1.358072, 1, 1, 1, 1, 1,
-1.828362, -0.05096569, -3.389258, 1, 1, 1, 1, 1,
-1.823273, -0.9929645, -2.944531, 1, 1, 1, 1, 1,
-1.791751, -0.5152634, -1.38904, 1, 1, 1, 1, 1,
-1.787009, -0.6063851, -1.162871, 1, 1, 1, 1, 1,
-1.72784, -1.504138, -0.03257812, 1, 1, 1, 1, 1,
-1.70399, 1.168036, 0.9091218, 1, 1, 1, 1, 1,
-1.700508, 0.6292578, -2.550967, 1, 1, 1, 1, 1,
-1.685738, 1.792664, -1.331839, 1, 1, 1, 1, 1,
-1.670893, -0.1629876, -3.090302, 1, 1, 1, 1, 1,
-1.656463, 0.3141631, -1.773015, 1, 1, 1, 1, 1,
-1.655778, -0.482223, -2.155174, 1, 1, 1, 1, 1,
-1.652532, 0.4221741, -1.533888, 1, 1, 1, 1, 1,
-1.64194, -0.9912037, -2.950286, 1, 1, 1, 1, 1,
-1.6351, -1.286132, -1.676492, 1, 1, 1, 1, 1,
-1.633455, 0.9809924, -2.739165, 0, 0, 1, 1, 1,
-1.617878, -0.8815778, -2.362464, 1, 0, 0, 1, 1,
-1.616869, -0.6497969, -1.299707, 1, 0, 0, 1, 1,
-1.613872, -0.8013182, -2.334804, 1, 0, 0, 1, 1,
-1.583289, 0.5775118, -0.675798, 1, 0, 0, 1, 1,
-1.58093, -0.6467704, -1.901478, 1, 0, 0, 1, 1,
-1.577483, -0.3506619, -2.455586, 0, 0, 0, 1, 1,
-1.566188, -1.13235, -2.77724, 0, 0, 0, 1, 1,
-1.563524, 1.272587, -1.788903, 0, 0, 0, 1, 1,
-1.56093, 0.6095554, -1.777093, 0, 0, 0, 1, 1,
-1.553812, 0.5989995, -0.8258384, 0, 0, 0, 1, 1,
-1.543456, -0.4438182, -0.7351766, 0, 0, 0, 1, 1,
-1.53362, -0.5207172, -2.688907, 0, 0, 0, 1, 1,
-1.531951, 0.5544462, -1.954553, 1, 1, 1, 1, 1,
-1.521027, 0.4997959, -2.573087, 1, 1, 1, 1, 1,
-1.519653, -1.149389, -1.738277, 1, 1, 1, 1, 1,
-1.516979, 1.593878, 1.851997, 1, 1, 1, 1, 1,
-1.515075, 0.1310005, -1.28823, 1, 1, 1, 1, 1,
-1.508676, 0.3075929, -2.253324, 1, 1, 1, 1, 1,
-1.477106, 1.82668, 0.3331367, 1, 1, 1, 1, 1,
-1.47485, -0.1538294, -1.687651, 1, 1, 1, 1, 1,
-1.470338, -1.59361, -3.554203, 1, 1, 1, 1, 1,
-1.46338, -1.268038, -0.8177248, 1, 1, 1, 1, 1,
-1.460144, -0.07202635, -2.400992, 1, 1, 1, 1, 1,
-1.449935, 0.4560628, -1.510014, 1, 1, 1, 1, 1,
-1.443906, -0.3358771, -2.436471, 1, 1, 1, 1, 1,
-1.436166, 0.2951027, -2.528341, 1, 1, 1, 1, 1,
-1.435149, 1.17873, -1.942947, 1, 1, 1, 1, 1,
-1.424709, -1.267316, -4.672811, 0, 0, 1, 1, 1,
-1.407754, -0.1966997, -2.91064, 1, 0, 0, 1, 1,
-1.400205, -2.258548, -4.043561, 1, 0, 0, 1, 1,
-1.38914, 0.3147885, -0.9143322, 1, 0, 0, 1, 1,
-1.385063, -0.4396867, -2.018212, 1, 0, 0, 1, 1,
-1.373707, -1.114676, -1.583597, 1, 0, 0, 1, 1,
-1.366132, -0.4499956, -0.5607831, 0, 0, 0, 1, 1,
-1.364521, 1.629485, -0.515406, 0, 0, 0, 1, 1,
-1.356381, 0.5008664, -2.009914, 0, 0, 0, 1, 1,
-1.353939, 0.3225748, -2.765507, 0, 0, 0, 1, 1,
-1.338936, 0.009027441, -2.586163, 0, 0, 0, 1, 1,
-1.335558, 1.109765, 0.01911693, 0, 0, 0, 1, 1,
-1.333128, -0.8860145, -2.159755, 0, 0, 0, 1, 1,
-1.324345, -0.8760777, -2.764995, 1, 1, 1, 1, 1,
-1.319375, 0.5973977, -1.767323, 1, 1, 1, 1, 1,
-1.305062, -0.9363234, -2.031147, 1, 1, 1, 1, 1,
-1.304578, 0.1156221, -0.0799377, 1, 1, 1, 1, 1,
-1.301995, -1.40053, -3.472944, 1, 1, 1, 1, 1,
-1.255834, 0.3177046, -1.966518, 1, 1, 1, 1, 1,
-1.25229, 0.1005405, -0.8467373, 1, 1, 1, 1, 1,
-1.251194, 0.8647295, -1.113462, 1, 1, 1, 1, 1,
-1.246286, -0.1016319, -3.070003, 1, 1, 1, 1, 1,
-1.243356, -1.690892, -2.508752, 1, 1, 1, 1, 1,
-1.243197, -0.3907676, -1.664363, 1, 1, 1, 1, 1,
-1.240352, -0.5430179, 0.009633611, 1, 1, 1, 1, 1,
-1.239626, -0.1172645, -2.090315, 1, 1, 1, 1, 1,
-1.232213, -1.347547, -2.121873, 1, 1, 1, 1, 1,
-1.224596, 0.3801105, -3.662287, 1, 1, 1, 1, 1,
-1.220249, -0.402087, -2.243506, 0, 0, 1, 1, 1,
-1.211528, -0.67674, -2.526894, 1, 0, 0, 1, 1,
-1.207608, -1.123405, -2.589595, 1, 0, 0, 1, 1,
-1.203022, 0.4745932, -0.9834006, 1, 0, 0, 1, 1,
-1.197081, -1.101002, -1.701568, 1, 0, 0, 1, 1,
-1.196366, -1.526223, -2.113668, 1, 0, 0, 1, 1,
-1.188276, -0.5800329, -1.516788, 0, 0, 0, 1, 1,
-1.177805, 1.051446, -0.3203652, 0, 0, 0, 1, 1,
-1.17231, 1.12124, -1.031359, 0, 0, 0, 1, 1,
-1.172088, -1.333232, -1.962337, 0, 0, 0, 1, 1,
-1.169624, 1.385192, -0.5709747, 0, 0, 0, 1, 1,
-1.158804, 1.773196, 0.3026838, 0, 0, 0, 1, 1,
-1.154076, 1.019279, -0.06675075, 0, 0, 0, 1, 1,
-1.148348, -1.697353, -2.26533, 1, 1, 1, 1, 1,
-1.145443, 0.4076002, -1.267916, 1, 1, 1, 1, 1,
-1.140956, -1.293581, -3.685687, 1, 1, 1, 1, 1,
-1.129508, 0.270612, -1.152228, 1, 1, 1, 1, 1,
-1.122551, -0.8926848, -2.488296, 1, 1, 1, 1, 1,
-1.121942, -1.046673, -2.127099, 1, 1, 1, 1, 1,
-1.121559, 1.224055, -1.374343, 1, 1, 1, 1, 1,
-1.117033, 0.5526509, -0.5758704, 1, 1, 1, 1, 1,
-1.110894, 1.223659, -1.806362, 1, 1, 1, 1, 1,
-1.104064, -0.09051186, 0.02629133, 1, 1, 1, 1, 1,
-1.089051, 1.844981, -0.4761257, 1, 1, 1, 1, 1,
-1.084757, 0.3989828, -0.3459229, 1, 1, 1, 1, 1,
-1.082203, 1.755238, -1.877493, 1, 1, 1, 1, 1,
-1.073182, 0.9833974, 0.06607964, 1, 1, 1, 1, 1,
-1.063129, 3.221869, 0.3227623, 1, 1, 1, 1, 1,
-1.060392, -1.204527, -3.326485, 0, 0, 1, 1, 1,
-1.057429, 0.0888841, -1.64504, 1, 0, 0, 1, 1,
-1.049989, -0.08793609, -2.533695, 1, 0, 0, 1, 1,
-1.047564, -0.6432533, -2.307753, 1, 0, 0, 1, 1,
-1.043436, -0.9229735, -1.993518, 1, 0, 0, 1, 1,
-1.037747, -1.853134, -3.78627, 1, 0, 0, 1, 1,
-1.033262, 0.2192915, -2.256703, 0, 0, 0, 1, 1,
-1.02506, -0.6927361, -1.440467, 0, 0, 0, 1, 1,
-1.015884, 1.243864, -0.0574012, 0, 0, 0, 1, 1,
-1.015024, 0.3818583, -2.343418, 0, 0, 0, 1, 1,
-1.011936, 0.03610622, -1.844847, 0, 0, 0, 1, 1,
-0.999026, 0.2294219, 0.1820449, 0, 0, 0, 1, 1,
-0.992946, -0.2340111, -2.082577, 0, 0, 0, 1, 1,
-0.9894925, 0.3009304, -3.177946, 1, 1, 1, 1, 1,
-0.9885983, -0.9037978, -3.729547, 1, 1, 1, 1, 1,
-0.987542, 1.133902, -0.7356541, 1, 1, 1, 1, 1,
-0.9757847, -0.1327069, -1.849408, 1, 1, 1, 1, 1,
-0.9751411, -0.5259885, -1.940533, 1, 1, 1, 1, 1,
-0.9707491, -0.08043874, -1.266719, 1, 1, 1, 1, 1,
-0.9606779, 0.7304966, -0.4955063, 1, 1, 1, 1, 1,
-0.9572034, -0.5413446, -2.70304, 1, 1, 1, 1, 1,
-0.9547068, 0.1063284, -0.4835464, 1, 1, 1, 1, 1,
-0.9531642, -0.3859104, -0.3721465, 1, 1, 1, 1, 1,
-0.9464771, -0.1159173, -0.9025317, 1, 1, 1, 1, 1,
-0.9457018, -0.340846, -3.787481, 1, 1, 1, 1, 1,
-0.9417113, -0.2879034, -2.582749, 1, 1, 1, 1, 1,
-0.9390481, -0.3275618, -1.565936, 1, 1, 1, 1, 1,
-0.9340962, 0.5603778, -1.940563, 1, 1, 1, 1, 1,
-0.9276103, 0.08536077, 0.5607364, 0, 0, 1, 1, 1,
-0.9237615, 1.429495, -0.189195, 1, 0, 0, 1, 1,
-0.9230038, 0.2550363, -2.002123, 1, 0, 0, 1, 1,
-0.9219522, -0.3377114, -1.446474, 1, 0, 0, 1, 1,
-0.9150935, 0.1796505, -0.1571912, 1, 0, 0, 1, 1,
-0.9121005, -0.7318592, -1.986405, 1, 0, 0, 1, 1,
-0.9084775, 0.6799516, -1.424644, 0, 0, 0, 1, 1,
-0.904142, 0.9769665, -1.045719, 0, 0, 0, 1, 1,
-0.8929869, 0.616364, -0.6643201, 0, 0, 0, 1, 1,
-0.8805597, -1.786531, -4.396727, 0, 0, 0, 1, 1,
-0.8798728, -0.4748116, -3.157028, 0, 0, 0, 1, 1,
-0.878072, -2.101994, -0.8156212, 0, 0, 0, 1, 1,
-0.8769319, 0.3412579, -1.602594, 0, 0, 0, 1, 1,
-0.8742328, -0.5924522, -1.242054, 1, 1, 1, 1, 1,
-0.871617, 0.3145034, -4.496343, 1, 1, 1, 1, 1,
-0.8602799, 0.392246, 0.5087306, 1, 1, 1, 1, 1,
-0.8596805, 1.532216, 0.2316051, 1, 1, 1, 1, 1,
-0.8587451, 1.611805, -0.806264, 1, 1, 1, 1, 1,
-0.8566021, -0.1464703, -1.60711, 1, 1, 1, 1, 1,
-0.8545704, -0.338753, -2.495117, 1, 1, 1, 1, 1,
-0.8520528, -0.5847052, -1.416965, 1, 1, 1, 1, 1,
-0.851445, -2.078369, -2.523662, 1, 1, 1, 1, 1,
-0.8450361, -0.8645203, -2.844393, 1, 1, 1, 1, 1,
-0.8427499, -0.2520833, -0.874897, 1, 1, 1, 1, 1,
-0.8401543, 0.822494, -0.7754315, 1, 1, 1, 1, 1,
-0.835022, -1.037106, -1.994829, 1, 1, 1, 1, 1,
-0.8330671, -1.242961, -3.135853, 1, 1, 1, 1, 1,
-0.8248662, -0.9227979, -2.632746, 1, 1, 1, 1, 1,
-0.8221508, 2.177977, -0.8849448, 0, 0, 1, 1, 1,
-0.8166544, 0.9251376, 0.5884609, 1, 0, 0, 1, 1,
-0.8124742, 0.05714771, -0.7614323, 1, 0, 0, 1, 1,
-0.808664, -0.4453376, -1.178628, 1, 0, 0, 1, 1,
-0.8075285, -1.058809, -3.130179, 1, 0, 0, 1, 1,
-0.7987688, -1.324801, -3.240744, 1, 0, 0, 1, 1,
-0.7981662, -1.722445, -3.17057, 0, 0, 0, 1, 1,
-0.7972811, -0.2234839, -1.123848, 0, 0, 0, 1, 1,
-0.7914853, 1.152822, 1.283159, 0, 0, 0, 1, 1,
-0.7896442, 0.6727542, -1.429473, 0, 0, 0, 1, 1,
-0.7861164, 0.1566486, -2.241572, 0, 0, 0, 1, 1,
-0.7836159, 1.32039, 0.1386863, 0, 0, 0, 1, 1,
-0.7807171, -0.1002986, -1.861059, 0, 0, 0, 1, 1,
-0.7698181, 0.4660809, -1.693691, 1, 1, 1, 1, 1,
-0.7689915, 1.535249, -2.225581, 1, 1, 1, 1, 1,
-0.7570008, 0.8260759, -1.689701, 1, 1, 1, 1, 1,
-0.7563247, -0.05564338, -1.349958, 1, 1, 1, 1, 1,
-0.7508429, 0.5202924, -1.139923, 1, 1, 1, 1, 1,
-0.7492428, -0.9400197, -2.52044, 1, 1, 1, 1, 1,
-0.7475827, -0.1402828, -1.95824, 1, 1, 1, 1, 1,
-0.7341039, 2.122457, -2.011045, 1, 1, 1, 1, 1,
-0.7326795, 1.327359, -0.7989702, 1, 1, 1, 1, 1,
-0.7324588, -1.537853, -2.39521, 1, 1, 1, 1, 1,
-0.7277419, -0.5386294, -3.292717, 1, 1, 1, 1, 1,
-0.7266369, -0.8933089, -4.439577, 1, 1, 1, 1, 1,
-0.7209009, 0.3033957, -1.976053, 1, 1, 1, 1, 1,
-0.7178051, -0.1242171, -2.263492, 1, 1, 1, 1, 1,
-0.7152302, -0.4219782, -2.00405, 1, 1, 1, 1, 1,
-0.7125156, 1.907768, 0.330635, 0, 0, 1, 1, 1,
-0.7118165, -0.9066814, -1.728661, 1, 0, 0, 1, 1,
-0.7094719, 0.6763668, -1.793604, 1, 0, 0, 1, 1,
-0.7080092, 0.05609353, -2.776019, 1, 0, 0, 1, 1,
-0.7012933, 0.7798043, -1.813003, 1, 0, 0, 1, 1,
-0.6994137, -0.2883538, -2.432385, 1, 0, 0, 1, 1,
-0.6988739, 2.752359, -1.106285, 0, 0, 0, 1, 1,
-0.6978036, 0.2130185, -0.3257031, 0, 0, 0, 1, 1,
-0.689019, -0.2712723, -1.593085, 0, 0, 0, 1, 1,
-0.6857625, -0.3568639, -2.295724, 0, 0, 0, 1, 1,
-0.6811284, -0.1198379, -0.7567438, 0, 0, 0, 1, 1,
-0.6793861, -0.1956021, -2.056452, 0, 0, 0, 1, 1,
-0.6759949, -0.7812787, -2.852055, 0, 0, 0, 1, 1,
-0.6758637, -0.3683212, -2.536975, 1, 1, 1, 1, 1,
-0.6738861, -0.3466948, -0.9617649, 1, 1, 1, 1, 1,
-0.6713522, 1.104277, 0.1442676, 1, 1, 1, 1, 1,
-0.6661247, -1.263192, -4.341514, 1, 1, 1, 1, 1,
-0.6609558, 0.006498268, -1.201311, 1, 1, 1, 1, 1,
-0.6591048, -1.30466, -3.191481, 1, 1, 1, 1, 1,
-0.6563109, 0.3044232, -2.253089, 1, 1, 1, 1, 1,
-0.6503109, -0.6045493, -3.129135, 1, 1, 1, 1, 1,
-0.6487355, -1.837696, -4.777844, 1, 1, 1, 1, 1,
-0.6472128, -1.090795, -3.601358, 1, 1, 1, 1, 1,
-0.6435305, -1.2671, -3.935023, 1, 1, 1, 1, 1,
-0.6397092, -0.04395584, -1.374575, 1, 1, 1, 1, 1,
-0.6385154, 0.02255734, 0.6794133, 1, 1, 1, 1, 1,
-0.63793, 1.160555, -2.355129, 1, 1, 1, 1, 1,
-0.6321055, 0.734777, 0.1770362, 1, 1, 1, 1, 1,
-0.6300319, 0.1621527, -0.7640805, 0, 0, 1, 1, 1,
-0.6235088, -0.4935211, -3.003606, 1, 0, 0, 1, 1,
-0.6210431, -0.4976181, -2.813145, 1, 0, 0, 1, 1,
-0.619076, 0.7020132, -0.2577109, 1, 0, 0, 1, 1,
-0.6171678, 0.7882497, -2.72637, 1, 0, 0, 1, 1,
-0.6151346, -0.1328373, -1.431368, 1, 0, 0, 1, 1,
-0.6148577, 0.3103491, -1.784418, 0, 0, 0, 1, 1,
-0.6133898, -0.07279404, -2.306428, 0, 0, 0, 1, 1,
-0.6119241, 2.137866, -1.431266, 0, 0, 0, 1, 1,
-0.6117501, -0.4721314, -1.229724, 0, 0, 0, 1, 1,
-0.6114624, 0.7323371, 0.3153708, 0, 0, 0, 1, 1,
-0.6046907, -0.001139282, -1.334493, 0, 0, 0, 1, 1,
-0.6045814, 0.1979364, -0.8076078, 0, 0, 0, 1, 1,
-0.6023244, -0.3477458, -0.8246091, 1, 1, 1, 1, 1,
-0.5953782, -0.3792084, -2.270619, 1, 1, 1, 1, 1,
-0.5901277, -0.8023229, -3.409376, 1, 1, 1, 1, 1,
-0.5871121, 0.9339024, -0.2852429, 1, 1, 1, 1, 1,
-0.5822363, -1.138753, -2.452576, 1, 1, 1, 1, 1,
-0.5794782, 0.1385053, -0.6710038, 1, 1, 1, 1, 1,
-0.5794181, -0.4320453, -1.449154, 1, 1, 1, 1, 1,
-0.578357, 1.283864, -0.5842316, 1, 1, 1, 1, 1,
-0.5766889, 1.051139, -2.381183, 1, 1, 1, 1, 1,
-0.5712819, 1.396159, 1.029296, 1, 1, 1, 1, 1,
-0.5676407, -0.4475392, -2.21117, 1, 1, 1, 1, 1,
-0.5659038, 1.295616, -1.802728, 1, 1, 1, 1, 1,
-0.563697, 1.034801, 0.5222595, 1, 1, 1, 1, 1,
-0.562867, 0.2297444, -2.297949, 1, 1, 1, 1, 1,
-0.5613708, -1.28946, -2.578541, 1, 1, 1, 1, 1,
-0.5603003, -1.681094, -2.733345, 0, 0, 1, 1, 1,
-0.5597854, 0.2129304, 0.838365, 1, 0, 0, 1, 1,
-0.5544226, 0.6356242, -0.7335183, 1, 0, 0, 1, 1,
-0.5521632, 0.04312502, -1.830037, 1, 0, 0, 1, 1,
-0.5502802, 1.057685, 0.3207483, 1, 0, 0, 1, 1,
-0.5464165, 0.6129296, 0.6556817, 1, 0, 0, 1, 1,
-0.5462941, -0.8089017, -3.784398, 0, 0, 0, 1, 1,
-0.545286, 0.1029717, -1.078799, 0, 0, 0, 1, 1,
-0.541494, -0.3089934, -1.528118, 0, 0, 0, 1, 1,
-0.538171, -0.5894513, -3.592506, 0, 0, 0, 1, 1,
-0.5347834, 0.8794186, -0.2028515, 0, 0, 0, 1, 1,
-0.5347553, -0.2522774, -0.4301359, 0, 0, 0, 1, 1,
-0.5339407, -1.936013, -2.670169, 0, 0, 0, 1, 1,
-0.5327343, -1.616349, -3.067479, 1, 1, 1, 1, 1,
-0.5297941, -0.6137945, -3.600713, 1, 1, 1, 1, 1,
-0.5297017, 1.33185, -0.6294799, 1, 1, 1, 1, 1,
-0.5285205, 0.59355, -0.8781406, 1, 1, 1, 1, 1,
-0.5242869, -0.5669767, -1.82831, 1, 1, 1, 1, 1,
-0.5218142, -0.4151987, -0.6958274, 1, 1, 1, 1, 1,
-0.5119283, -0.02718578, -1.405547, 1, 1, 1, 1, 1,
-0.5101178, 0.5094651, 0.5568684, 1, 1, 1, 1, 1,
-0.5093962, -0.4427895, -5.356169, 1, 1, 1, 1, 1,
-0.5082617, -0.5450891, -2.130449, 1, 1, 1, 1, 1,
-0.5057307, -0.6152118, -3.945804, 1, 1, 1, 1, 1,
-0.5031803, 0.3616672, 0.6846401, 1, 1, 1, 1, 1,
-0.5017825, 0.1028986, 0.354916, 1, 1, 1, 1, 1,
-0.4997329, -0.9279673, -0.6234763, 1, 1, 1, 1, 1,
-0.4997035, -0.4561508, -3.8215, 1, 1, 1, 1, 1,
-0.4943257, 0.7490441, -0.9024458, 0, 0, 1, 1, 1,
-0.4874493, 0.7030821, -0.6534619, 1, 0, 0, 1, 1,
-0.4826526, -1.804953, -2.841376, 1, 0, 0, 1, 1,
-0.48167, -0.1659547, -1.128134, 1, 0, 0, 1, 1,
-0.4762711, -0.1663763, -0.5109109, 1, 0, 0, 1, 1,
-0.4762247, 0.08479661, -1.048716, 1, 0, 0, 1, 1,
-0.4755496, -0.1018204, -3.289714, 0, 0, 0, 1, 1,
-0.4734369, 0.5454403, -0.07254396, 0, 0, 0, 1, 1,
-0.4707762, -0.7841649, -2.690733, 0, 0, 0, 1, 1,
-0.4686471, 0.7055925, 0.3631963, 0, 0, 0, 1, 1,
-0.4582668, -0.01599899, -1.620589, 0, 0, 0, 1, 1,
-0.4574778, 1.482375, -0.2806552, 0, 0, 0, 1, 1,
-0.4461255, -0.2559909, -3.108338, 0, 0, 0, 1, 1,
-0.4445589, 2.333099, 1.028898, 1, 1, 1, 1, 1,
-0.4437731, -0.8529053, -1.934185, 1, 1, 1, 1, 1,
-0.4422886, 1.727677, 0.4226072, 1, 1, 1, 1, 1,
-0.4401581, -1.172734, -0.9101129, 1, 1, 1, 1, 1,
-0.4394939, 0.07970558, -2.443026, 1, 1, 1, 1, 1,
-0.4392141, 0.4126881, -1.477211, 1, 1, 1, 1, 1,
-0.436235, -1.959926, -1.863491, 1, 1, 1, 1, 1,
-0.4361338, 0.9430932, -0.5273082, 1, 1, 1, 1, 1,
-0.4348591, -1.338927, -4.215929, 1, 1, 1, 1, 1,
-0.4322894, 0.2332124, -2.828395, 1, 1, 1, 1, 1,
-0.4306224, -0.8143792, -2.96393, 1, 1, 1, 1, 1,
-0.4294358, 0.9522104, -0.2103202, 1, 1, 1, 1, 1,
-0.4286116, 1.13599, 0.6146367, 1, 1, 1, 1, 1,
-0.4259365, 0.1497018, -0.8692538, 1, 1, 1, 1, 1,
-0.4255461, 0.8562138, -1.193945, 1, 1, 1, 1, 1,
-0.424853, 0.2481805, 0.1049289, 0, 0, 1, 1, 1,
-0.4191108, 0.4227954, -0.6750197, 1, 0, 0, 1, 1,
-0.4184771, 0.5399033, 1.277603, 1, 0, 0, 1, 1,
-0.4146167, 0.8483143, -0.3809048, 1, 0, 0, 1, 1,
-0.4043217, 0.3203684, -1.502269, 1, 0, 0, 1, 1,
-0.403287, -0.5567143, -3.153387, 1, 0, 0, 1, 1,
-0.4010435, 0.2616895, -0.563602, 0, 0, 0, 1, 1,
-0.3985658, 0.6217397, -0.06799961, 0, 0, 0, 1, 1,
-0.3965693, 1.18575, -0.6684558, 0, 0, 0, 1, 1,
-0.3918182, 0.8318377, -1.969089, 0, 0, 0, 1, 1,
-0.3895347, -1.147035, -2.857505, 0, 0, 0, 1, 1,
-0.3870876, 0.7332144, 1.165605, 0, 0, 0, 1, 1,
-0.3868384, -0.8458519, 0.4276672, 0, 0, 0, 1, 1,
-0.3861371, -1.587699, -2.087852, 1, 1, 1, 1, 1,
-0.3860068, -1.959362, -1.838926, 1, 1, 1, 1, 1,
-0.3832893, 1.330429, 0.2658523, 1, 1, 1, 1, 1,
-0.3823363, -0.333427, -0.2411776, 1, 1, 1, 1, 1,
-0.3800316, -0.05981416, -3.862708, 1, 1, 1, 1, 1,
-0.3786173, 0.1110261, -1.543067, 1, 1, 1, 1, 1,
-0.3782885, -0.5459543, -4.071579, 1, 1, 1, 1, 1,
-0.3754124, -0.04826879, -0.1341139, 1, 1, 1, 1, 1,
-0.3721282, 0.2695595, 0.7924309, 1, 1, 1, 1, 1,
-0.3669652, 2.282315, -0.6533545, 1, 1, 1, 1, 1,
-0.3644345, -0.8645895, -2.388097, 1, 1, 1, 1, 1,
-0.3565998, -0.4221579, -3.063819, 1, 1, 1, 1, 1,
-0.3531558, -0.389324, -1.606522, 1, 1, 1, 1, 1,
-0.3523379, -0.1198557, -2.260477, 1, 1, 1, 1, 1,
-0.3491679, -1.608421, -2.687844, 1, 1, 1, 1, 1,
-0.3485233, -0.1048062, -2.902715, 0, 0, 1, 1, 1,
-0.3435886, -0.8562095, -2.498908, 1, 0, 0, 1, 1,
-0.3381288, -0.2853021, -4.344173, 1, 0, 0, 1, 1,
-0.3354683, -0.7013209, -3.171543, 1, 0, 0, 1, 1,
-0.3306967, -0.6745136, -3.932307, 1, 0, 0, 1, 1,
-0.3304567, -0.3049818, -1.271315, 1, 0, 0, 1, 1,
-0.3257073, -1.242165, -2.129637, 0, 0, 0, 1, 1,
-0.3170328, -2.404104, -1.679776, 0, 0, 0, 1, 1,
-0.316522, -0.01253993, -3.079476, 0, 0, 0, 1, 1,
-0.3164535, -0.7339659, -2.147931, 0, 0, 0, 1, 1,
-0.3158806, 0.6719592, -1.140919, 0, 0, 0, 1, 1,
-0.3089481, 0.4108044, -1.831015, 0, 0, 0, 1, 1,
-0.3072611, -1.288055, -3.788747, 0, 0, 0, 1, 1,
-0.3031659, 1.754325, -0.8141173, 1, 1, 1, 1, 1,
-0.3031524, 2.262275, 1.49404, 1, 1, 1, 1, 1,
-0.3023838, -0.2270162, -2.311877, 1, 1, 1, 1, 1,
-0.2990331, 0.2465519, -0.418869, 1, 1, 1, 1, 1,
-0.2979159, 1.014205, -0.06734803, 1, 1, 1, 1, 1,
-0.2947211, -0.7486953, -4.430774, 1, 1, 1, 1, 1,
-0.2934846, 0.6088907, -0.3312261, 1, 1, 1, 1, 1,
-0.293047, -0.4662817, -0.7317135, 1, 1, 1, 1, 1,
-0.292585, -1.505237, -2.433914, 1, 1, 1, 1, 1,
-0.2911503, 0.1864142, -0.8338687, 1, 1, 1, 1, 1,
-0.2883326, 0.1654352, -0.5047495, 1, 1, 1, 1, 1,
-0.288035, 0.3233961, -0.7671923, 1, 1, 1, 1, 1,
-0.2809203, -0.2128227, -1.669698, 1, 1, 1, 1, 1,
-0.2801402, 0.05613052, -1.287733, 1, 1, 1, 1, 1,
-0.2692499, -0.06121814, -1.124923, 1, 1, 1, 1, 1,
-0.2663109, -1.149249, -0.4400418, 0, 0, 1, 1, 1,
-0.2661574, -1.240104, -1.24093, 1, 0, 0, 1, 1,
-0.2531549, -1.781214, -3.207865, 1, 0, 0, 1, 1,
-0.2498873, -0.1205478, -0.2765675, 1, 0, 0, 1, 1,
-0.2494021, 0.5289007, -0.5882409, 1, 0, 0, 1, 1,
-0.24692, -0.6507363, -1.82642, 1, 0, 0, 1, 1,
-0.2442767, -0.920435, -3.476269, 0, 0, 0, 1, 1,
-0.2426943, 0.8421538, 0.2432876, 0, 0, 0, 1, 1,
-0.2408841, -1.238282, -2.229436, 0, 0, 0, 1, 1,
-0.2380503, -0.1208918, -0.5670964, 0, 0, 0, 1, 1,
-0.2375438, 0.8798113, -2.273221, 0, 0, 0, 1, 1,
-0.2342592, -0.3829138, -3.460337, 0, 0, 0, 1, 1,
-0.2248897, -0.5802184, -2.120736, 0, 0, 0, 1, 1,
-0.2179295, 2.564821, -0.5225151, 1, 1, 1, 1, 1,
-0.2155597, 0.4296291, 0.9084824, 1, 1, 1, 1, 1,
-0.1925115, -0.7464106, -2.989714, 1, 1, 1, 1, 1,
-0.1924006, -0.502373, -2.597745, 1, 1, 1, 1, 1,
-0.1914107, 0.9814878, 0.08197965, 1, 1, 1, 1, 1,
-0.1893783, -1.55456, -3.225577, 1, 1, 1, 1, 1,
-0.1883542, -0.09424262, -0.6475336, 1, 1, 1, 1, 1,
-0.1851764, 0.4315392, -0.3099338, 1, 1, 1, 1, 1,
-0.1842515, -1.138694, -3.730898, 1, 1, 1, 1, 1,
-0.1834371, 0.6249431, 0.04157928, 1, 1, 1, 1, 1,
-0.1831055, 0.8071683, 0.2929582, 1, 1, 1, 1, 1,
-0.1825336, -0.5032873, -2.159771, 1, 1, 1, 1, 1,
-0.1794853, -0.9057064, -2.940723, 1, 1, 1, 1, 1,
-0.1755289, -0.5365704, -2.060997, 1, 1, 1, 1, 1,
-0.1743304, -1.051844, -3.29121, 1, 1, 1, 1, 1,
-0.1677954, 0.8350278, 0.6792454, 0, 0, 1, 1, 1,
-0.1665504, -0.5879291, -2.20619, 1, 0, 0, 1, 1,
-0.1629088, 1.924253, -1.047957, 1, 0, 0, 1, 1,
-0.1626572, -1.79212, -2.681175, 1, 0, 0, 1, 1,
-0.1602486, -1.228928, -3.149955, 1, 0, 0, 1, 1,
-0.1596003, 1.356449, 1.396371, 1, 0, 0, 1, 1,
-0.1585579, -1.704683, -2.948408, 0, 0, 0, 1, 1,
-0.1543359, -0.9958735, -2.530912, 0, 0, 0, 1, 1,
-0.1538963, 0.2021869, -2.565375, 0, 0, 0, 1, 1,
-0.1533972, -1.351344, -3.984419, 0, 0, 0, 1, 1,
-0.151963, -0.5004544, -2.809263, 0, 0, 0, 1, 1,
-0.1496383, -0.8033378, -3.179661, 0, 0, 0, 1, 1,
-0.1482106, 0.5691991, 0.1087684, 0, 0, 0, 1, 1,
-0.1434846, 0.3454938, -1.414726, 1, 1, 1, 1, 1,
-0.143054, -1.151055, -2.488356, 1, 1, 1, 1, 1,
-0.1383859, 0.6187617, 0.9150769, 1, 1, 1, 1, 1,
-0.1368916, -1.651105, -2.424059, 1, 1, 1, 1, 1,
-0.1361745, -1.283142, -2.256999, 1, 1, 1, 1, 1,
-0.1320635, 0.5522091, 0.2649179, 1, 1, 1, 1, 1,
-0.1301696, 0.2531124, -0.6407687, 1, 1, 1, 1, 1,
-0.1281638, 0.0773987, -1.733345, 1, 1, 1, 1, 1,
-0.1269316, 0.3984397, -0.08354057, 1, 1, 1, 1, 1,
-0.1229538, -0.9401582, -3.146037, 1, 1, 1, 1, 1,
-0.121683, 0.405105, 0.8057693, 1, 1, 1, 1, 1,
-0.1209446, 0.3813367, -0.4526395, 1, 1, 1, 1, 1,
-0.1183632, -0.8913465, -1.953061, 1, 1, 1, 1, 1,
-0.1169652, -2.121588, -4.451286, 1, 1, 1, 1, 1,
-0.1166633, 0.4167457, 0.005357044, 1, 1, 1, 1, 1,
-0.1153637, 1.09856, 0.1524804, 0, 0, 1, 1, 1,
-0.1143406, -0.4511254, -2.772069, 1, 0, 0, 1, 1,
-0.1111136, 0.9283408, -1.228964, 1, 0, 0, 1, 1,
-0.1101024, -0.3284067, -3.431628, 1, 0, 0, 1, 1,
-0.1094796, 1.838424, -0.652689, 1, 0, 0, 1, 1,
-0.1087122, -0.3915693, -2.543711, 1, 0, 0, 1, 1,
-0.0992881, -0.0759528, -2.340947, 0, 0, 0, 1, 1,
-0.09728257, 0.2011619, -2.13899, 0, 0, 0, 1, 1,
-0.09665822, 1.271281, 1.356515, 0, 0, 0, 1, 1,
-0.09591566, 0.03637892, -0.5687144, 0, 0, 0, 1, 1,
-0.09063541, 2.233204, 1.172943, 0, 0, 0, 1, 1,
-0.08799994, 0.0413408, -1.788776, 0, 0, 0, 1, 1,
-0.08497327, 0.9657844, 0.5706496, 0, 0, 0, 1, 1,
-0.08059206, -0.3802454, -2.655426, 1, 1, 1, 1, 1,
-0.07864228, 0.7154118, -0.8379472, 1, 1, 1, 1, 1,
-0.07632449, -1.194609, -4.06478, 1, 1, 1, 1, 1,
-0.07496534, -0.2927715, -3.17688, 1, 1, 1, 1, 1,
-0.07437022, 0.7692068, 0.08883183, 1, 1, 1, 1, 1,
-0.07302747, 1.604131, 0.8244638, 1, 1, 1, 1, 1,
-0.06673168, -0.9756955, -2.407771, 1, 1, 1, 1, 1,
-0.06537612, -0.09681334, -3.38371, 1, 1, 1, 1, 1,
-0.06388743, 0.4142287, -0.3393836, 1, 1, 1, 1, 1,
-0.0634376, 0.9825103, 0.2438158, 1, 1, 1, 1, 1,
-0.06074878, 0.3979361, -1.099559, 1, 1, 1, 1, 1,
-0.0598333, 0.03497948, -2.17546, 1, 1, 1, 1, 1,
-0.05898609, 0.493333, 0.2447396, 1, 1, 1, 1, 1,
-0.0548758, 0.4860138, -0.8909942, 1, 1, 1, 1, 1,
-0.05365263, 1.459298, 1.096852, 1, 1, 1, 1, 1,
-0.05252662, 0.3271232, -0.5368835, 0, 0, 1, 1, 1,
-0.05214516, -1.011922, -3.850984, 1, 0, 0, 1, 1,
-0.04389964, 0.5458334, -0.1887261, 1, 0, 0, 1, 1,
-0.03963732, -0.965414, -2.224463, 1, 0, 0, 1, 1,
-0.03434513, -0.2763243, -2.961081, 1, 0, 0, 1, 1,
-0.03061901, -0.4708425, -2.277103, 1, 0, 0, 1, 1,
-0.02673435, 1.524088, 1.449385, 0, 0, 0, 1, 1,
-0.02207048, -0.3898231, -3.594324, 0, 0, 0, 1, 1,
-0.01577044, -1.815528, -4.087778, 0, 0, 0, 1, 1,
-0.01563522, -0.2367538, -4.327641, 0, 0, 0, 1, 1,
-0.01451812, 0.4524576, 0.3825154, 0, 0, 0, 1, 1,
-0.00796529, -0.463383, -3.970037, 0, 0, 0, 1, 1,
-0.004497963, -0.3154867, -4.429502, 0, 0, 0, 1, 1,
0.004352737, 1.250478, 0.3754736, 1, 1, 1, 1, 1,
0.004529908, -0.5879101, 4.938148, 1, 1, 1, 1, 1,
0.006309145, 0.05175415, 0.8041673, 1, 1, 1, 1, 1,
0.007575449, -1.381552, 2.555311, 1, 1, 1, 1, 1,
0.008165067, 1.022049, 1.963942, 1, 1, 1, 1, 1,
0.008788326, 1.181691, -1.644389, 1, 1, 1, 1, 1,
0.008952771, 1.45446, -0.6548406, 1, 1, 1, 1, 1,
0.009215842, -0.6859251, 2.191907, 1, 1, 1, 1, 1,
0.01009179, 1.159538, 0.3747808, 1, 1, 1, 1, 1,
0.01439095, -0.4131406, 2.444324, 1, 1, 1, 1, 1,
0.015158, 0.1774527, 0.639234, 1, 1, 1, 1, 1,
0.01596236, -0.08647508, 2.987803, 1, 1, 1, 1, 1,
0.01616615, -0.3007532, 1.982914, 1, 1, 1, 1, 1,
0.01712069, -0.05083483, 1.666403, 1, 1, 1, 1, 1,
0.02364352, -0.7447592, 2.625549, 1, 1, 1, 1, 1,
0.02419741, 0.3233717, 0.4749803, 0, 0, 1, 1, 1,
0.02419824, 0.1488868, -1.063864, 1, 0, 0, 1, 1,
0.02486656, 0.1968295, -1.017772, 1, 0, 0, 1, 1,
0.02539328, 0.4606503, 0.4212584, 1, 0, 0, 1, 1,
0.02809975, -0.6494713, 3.945772, 1, 0, 0, 1, 1,
0.03091655, 0.7887374, 1.023069, 1, 0, 0, 1, 1,
0.03242804, -0.9646249, 1.167988, 0, 0, 0, 1, 1,
0.03761039, 0.3501682, 2.091109, 0, 0, 0, 1, 1,
0.03786493, 0.6691788, 1.332305, 0, 0, 0, 1, 1,
0.03794837, 0.09232657, -0.3528576, 0, 0, 0, 1, 1,
0.04264352, -0.3597159, 2.767338, 0, 0, 0, 1, 1,
0.04326377, 0.2917468, -1.518116, 0, 0, 0, 1, 1,
0.04429625, 1.374107, -0.5548743, 0, 0, 0, 1, 1,
0.04448039, 1.52383, -0.181344, 1, 1, 1, 1, 1,
0.04608464, -0.366618, 1.652131, 1, 1, 1, 1, 1,
0.04848646, 1.495137, -1.162987, 1, 1, 1, 1, 1,
0.04927144, -0.06657278, 2.234861, 1, 1, 1, 1, 1,
0.04997943, 0.2733097, 0.1131746, 1, 1, 1, 1, 1,
0.05032407, 1.47971, -0.04760911, 1, 1, 1, 1, 1,
0.05100859, 1.71835, 0.5426047, 1, 1, 1, 1, 1,
0.05107119, -1.157918, 3.094647, 1, 1, 1, 1, 1,
0.05325247, -0.4741985, 2.18946, 1, 1, 1, 1, 1,
0.05475553, 1.399478, 0.8759929, 1, 1, 1, 1, 1,
0.05898283, -0.8427333, 3.199914, 1, 1, 1, 1, 1,
0.07288152, -0.2946908, 2.581364, 1, 1, 1, 1, 1,
0.07751337, -0.7864076, 2.48585, 1, 1, 1, 1, 1,
0.08597636, -1.754807, 3.911532, 1, 1, 1, 1, 1,
0.08653214, 0.2831125, -1.4948, 1, 1, 1, 1, 1,
0.0890236, -0.8009189, 3.550005, 0, 0, 1, 1, 1,
0.09368666, 1.214997, 1.615219, 1, 0, 0, 1, 1,
0.1008677, -0.3383411, 2.030654, 1, 0, 0, 1, 1,
0.1036357, 0.1547708, 0.536089, 1, 0, 0, 1, 1,
0.1056212, 0.0555343, 0.2679057, 1, 0, 0, 1, 1,
0.1093454, 1.624636, 0.8931093, 1, 0, 0, 1, 1,
0.1114378, -0.8565429, 3.790629, 0, 0, 0, 1, 1,
0.1121742, 0.4561108, 1.85517, 0, 0, 0, 1, 1,
0.1132357, -0.5022056, 0.7338921, 0, 0, 0, 1, 1,
0.1199603, 1.569103, -0.1321313, 0, 0, 0, 1, 1,
0.1202189, -1.637522, 2.40996, 0, 0, 0, 1, 1,
0.1229071, 0.9753336, 0.3327309, 0, 0, 0, 1, 1,
0.1259222, 0.7178738, 0.06427729, 0, 0, 0, 1, 1,
0.1297077, -0.2653053, 1.825094, 1, 1, 1, 1, 1,
0.1309522, 1.422086, -0.1129783, 1, 1, 1, 1, 1,
0.1350948, -0.9623083, 3.727213, 1, 1, 1, 1, 1,
0.1414648, 0.3552193, -1.465885, 1, 1, 1, 1, 1,
0.1484918, -0.7498929, 1.828012, 1, 1, 1, 1, 1,
0.1495896, -0.6726075, 2.566787, 1, 1, 1, 1, 1,
0.1546482, 1.605752, 0.7162085, 1, 1, 1, 1, 1,
0.1562468, 0.1740181, 0.4551712, 1, 1, 1, 1, 1,
0.1602276, -0.7367287, 2.999339, 1, 1, 1, 1, 1,
0.1608946, 0.9171979, 0.4887681, 1, 1, 1, 1, 1,
0.1623458, -1.951192, 3.921105, 1, 1, 1, 1, 1,
0.1646893, 0.09870575, 1.347177, 1, 1, 1, 1, 1,
0.1670981, -1.387842, 3.835522, 1, 1, 1, 1, 1,
0.1679573, 2.135366, 0.6685982, 1, 1, 1, 1, 1,
0.1703316, 0.1923381, 0.5968854, 1, 1, 1, 1, 1,
0.1716008, -1.119461, 3.293314, 0, 0, 1, 1, 1,
0.1767088, 1.306271, -1.291782, 1, 0, 0, 1, 1,
0.1786457, 0.5736141, 0.1169331, 1, 0, 0, 1, 1,
0.1868044, 2.235405, 2.305541, 1, 0, 0, 1, 1,
0.1909375, 0.4939236, 0.1374154, 1, 0, 0, 1, 1,
0.1921474, -0.09335306, 1.945966, 1, 0, 0, 1, 1,
0.1927728, 0.3871885, 0.7342103, 0, 0, 0, 1, 1,
0.2030694, -2.245439, 2.366087, 0, 0, 0, 1, 1,
0.2051886, -0.8039597, 3.75806, 0, 0, 0, 1, 1,
0.2062982, 0.8031912, 0.672691, 0, 0, 0, 1, 1,
0.2127865, 0.9243652, -0.9729311, 0, 0, 0, 1, 1,
0.2175391, 0.8711908, 0.2020392, 0, 0, 0, 1, 1,
0.2200387, -0.5727821, 2.264019, 0, 0, 0, 1, 1,
0.224448, 0.1586318, 1.123082, 1, 1, 1, 1, 1,
0.2266293, 1.230332, -0.6531349, 1, 1, 1, 1, 1,
0.2290378, 1.021957, 1.682369, 1, 1, 1, 1, 1,
0.230377, -1.125923, 3.617414, 1, 1, 1, 1, 1,
0.2313551, -0.4815411, 1.08324, 1, 1, 1, 1, 1,
0.2322403, -0.4063751, 1.491946, 1, 1, 1, 1, 1,
0.2340451, -0.1701594, 1.459947, 1, 1, 1, 1, 1,
0.2377859, -1.276836, 1.485864, 1, 1, 1, 1, 1,
0.2392638, 1.74079, -0.5215109, 1, 1, 1, 1, 1,
0.2406243, 0.6569079, 0.7463008, 1, 1, 1, 1, 1,
0.2437352, -0.5192415, 1.930682, 1, 1, 1, 1, 1,
0.2443002, 0.03844849, 0.1440534, 1, 1, 1, 1, 1,
0.2515359, -0.0330225, -0.7671452, 1, 1, 1, 1, 1,
0.2518932, -0.3543637, 4.518281, 1, 1, 1, 1, 1,
0.2547597, -1.041322, 3.795586, 1, 1, 1, 1, 1,
0.2550339, -1.149443, 3.014721, 0, 0, 1, 1, 1,
0.2572189, -0.6652768, 2.570624, 1, 0, 0, 1, 1,
0.2600306, -0.03122192, 2.650638, 1, 0, 0, 1, 1,
0.2615231, -0.3336508, 3.135888, 1, 0, 0, 1, 1,
0.2635956, 0.8542951, -0.6301111, 1, 0, 0, 1, 1,
0.2645609, 0.8083213, 1.029894, 1, 0, 0, 1, 1,
0.2650636, -1.247302, 3.27243, 0, 0, 0, 1, 1,
0.2687693, -1.086719, 3.157341, 0, 0, 0, 1, 1,
0.2711076, -1.071213, 4.081578, 0, 0, 0, 1, 1,
0.2712297, -1.259707, 2.058311, 0, 0, 0, 1, 1,
0.2763754, 1.573164, -0.9048459, 0, 0, 0, 1, 1,
0.2769953, 0.6761547, -0.3824749, 0, 0, 0, 1, 1,
0.2812447, -1.565916, 3.435, 0, 0, 0, 1, 1,
0.2831238, 0.9709952, -0.5336704, 1, 1, 1, 1, 1,
0.287867, -0.2529186, 3.140203, 1, 1, 1, 1, 1,
0.2888032, 0.6773618, 0.6441504, 1, 1, 1, 1, 1,
0.2905463, -1.342641, 3.400192, 1, 1, 1, 1, 1,
0.2915609, -0.6164162, 2.439156, 1, 1, 1, 1, 1,
0.2922288, -2.285402, 1.044849, 1, 1, 1, 1, 1,
0.297033, 0.5589784, 1.597241, 1, 1, 1, 1, 1,
0.303675, 0.5906162, -1.145487, 1, 1, 1, 1, 1,
0.3044641, 1.651163, -0.271549, 1, 1, 1, 1, 1,
0.3067726, 2.381913, -0.9179592, 1, 1, 1, 1, 1,
0.309103, -0.8836868, 4.351203, 1, 1, 1, 1, 1,
0.310452, -0.3717233, 2.227724, 1, 1, 1, 1, 1,
0.3148246, -0.1084962, 1.354164, 1, 1, 1, 1, 1,
0.3176934, 0.590891, -0.7699365, 1, 1, 1, 1, 1,
0.3190219, 1.140843, -0.8725312, 1, 1, 1, 1, 1,
0.3209083, -0.6314472, 2.924242, 0, 0, 1, 1, 1,
0.3218912, 0.8795818, 0.7920474, 1, 0, 0, 1, 1,
0.3221029, -1.578518, 2.685051, 1, 0, 0, 1, 1,
0.3263689, 0.1602336, 0.04977684, 1, 0, 0, 1, 1,
0.3315269, 1.942023, 1.727585, 1, 0, 0, 1, 1,
0.3336113, -0.2965852, 1.522675, 1, 0, 0, 1, 1,
0.3340404, 0.7143373, 0.9584199, 0, 0, 0, 1, 1,
0.3349718, 0.2354997, 0.3917594, 0, 0, 0, 1, 1,
0.3371173, -0.608851, 1.505888, 0, 0, 0, 1, 1,
0.3380516, -0.2545192, 0.4655963, 0, 0, 0, 1, 1,
0.3476576, -0.7503061, 2.433262, 0, 0, 0, 1, 1,
0.3590729, 0.5124889, -0.1200477, 0, 0, 0, 1, 1,
0.3594643, -0.9156965, 2.929157, 0, 0, 0, 1, 1,
0.3641086, -0.2684088, 1.499043, 1, 1, 1, 1, 1,
0.3671447, -0.393074, 3.076325, 1, 1, 1, 1, 1,
0.3675705, 0.2075897, 2.124565, 1, 1, 1, 1, 1,
0.3685777, 0.3580594, 0.8307618, 1, 1, 1, 1, 1,
0.3701566, -0.7061979, 3.963018, 1, 1, 1, 1, 1,
0.3704627, -0.1856873, 1.586096, 1, 1, 1, 1, 1,
0.3763153, -0.4609296, 1.019445, 1, 1, 1, 1, 1,
0.3772432, -1.353655, 1.261583, 1, 1, 1, 1, 1,
0.3790989, -0.439348, 1.532394, 1, 1, 1, 1, 1,
0.3791701, -0.3862808, 2.204651, 1, 1, 1, 1, 1,
0.3825773, -1.970301, 2.57934, 1, 1, 1, 1, 1,
0.3853336, -0.9719418, 2.430984, 1, 1, 1, 1, 1,
0.3858649, -0.1809461, 2.603306, 1, 1, 1, 1, 1,
0.4005795, 1.169014, 1.55532, 1, 1, 1, 1, 1,
0.4018557, -1.59113, 2.989022, 1, 1, 1, 1, 1,
0.4077001, 2.131277, 0.2763863, 0, 0, 1, 1, 1,
0.4082357, 0.01149917, 2.91574, 1, 0, 0, 1, 1,
0.4107434, 0.656776, -0.2874843, 1, 0, 0, 1, 1,
0.4128273, 0.4789197, -0.9267869, 1, 0, 0, 1, 1,
0.4183032, -0.1804683, 1.581012, 1, 0, 0, 1, 1,
0.4194521, -1.794779, 2.41532, 1, 0, 0, 1, 1,
0.4221312, 0.1731864, -0.3394697, 0, 0, 0, 1, 1,
0.4235281, -0.1074886, 1.478637, 0, 0, 0, 1, 1,
0.4271622, -1.828455, 3.362077, 0, 0, 0, 1, 1,
0.4286571, 0.3792274, 2.17182, 0, 0, 0, 1, 1,
0.4298643, -1.269418, 2.634238, 0, 0, 0, 1, 1,
0.4344574, -1.553196, 2.280342, 0, 0, 0, 1, 1,
0.442056, 0.7444314, 0.4498332, 0, 0, 0, 1, 1,
0.4453078, -0.8904247, 1.321278, 1, 1, 1, 1, 1,
0.4463601, -1.517194, 1.957769, 1, 1, 1, 1, 1,
0.4465168, -0.603743, 1.768129, 1, 1, 1, 1, 1,
0.4535538, -0.5633648, 0.05365583, 1, 1, 1, 1, 1,
0.4574411, -0.1857336, 2.195488, 1, 1, 1, 1, 1,
0.4591556, 0.4808677, 2.164869, 1, 1, 1, 1, 1,
0.4598726, -1.110627, 1.398558, 1, 1, 1, 1, 1,
0.4607484, 0.1548056, -1.313365, 1, 1, 1, 1, 1,
0.4612595, 0.4753596, -0.2756703, 1, 1, 1, 1, 1,
0.4614518, 0.777187, -1.287096, 1, 1, 1, 1, 1,
0.465634, 0.1640949, 0.9449783, 1, 1, 1, 1, 1,
0.4664939, -0.1028299, 3.185232, 1, 1, 1, 1, 1,
0.4676923, -0.2819678, 2.364849, 1, 1, 1, 1, 1,
0.470761, -1.025786, 4.740728, 1, 1, 1, 1, 1,
0.4734053, -0.5983918, 2.117718, 1, 1, 1, 1, 1,
0.4746071, 0.9053012, 0.4030585, 0, 0, 1, 1, 1,
0.4802209, 0.2064135, 0.009501954, 1, 0, 0, 1, 1,
0.4809269, -0.7589473, 3.050596, 1, 0, 0, 1, 1,
0.4857597, 0.7408813, 1.724602, 1, 0, 0, 1, 1,
0.4889587, 0.4392178, 0.6072117, 1, 0, 0, 1, 1,
0.4970128, 0.5022897, 0.5249041, 1, 0, 0, 1, 1,
0.4980699, 0.5907624, 1.294311, 0, 0, 0, 1, 1,
0.5017454, 1.117576, 0.1879709, 0, 0, 0, 1, 1,
0.5043611, 0.7980726, -0.4424728, 0, 0, 0, 1, 1,
0.5060931, 1.376865, 0.1420717, 0, 0, 0, 1, 1,
0.5087047, 0.6084875, -0.3035422, 0, 0, 0, 1, 1,
0.5090762, 0.623666, 1.480963, 0, 0, 0, 1, 1,
0.5122717, -0.3861079, 2.934574, 0, 0, 0, 1, 1,
0.5142122, 0.6377325, 0.4321083, 1, 1, 1, 1, 1,
0.5169638, 0.3423544, 2.315, 1, 1, 1, 1, 1,
0.5213953, 1.322489, 0.3374754, 1, 1, 1, 1, 1,
0.5216067, 0.9196841, 2.619273, 1, 1, 1, 1, 1,
0.5227709, 1.048245, 1.011017, 1, 1, 1, 1, 1,
0.5259949, 1.476017, 2.197984, 1, 1, 1, 1, 1,
0.5313936, -1.150588, 4.043798, 1, 1, 1, 1, 1,
0.53472, -0.2137228, 4.678513, 1, 1, 1, 1, 1,
0.5350227, -0.3666748, 2.343712, 1, 1, 1, 1, 1,
0.5359288, -0.02085515, 2.347512, 1, 1, 1, 1, 1,
0.5375126, -0.01800963, 1.520218, 1, 1, 1, 1, 1,
0.5477549, 0.1870329, 1.769834, 1, 1, 1, 1, 1,
0.5512471, 0.2339697, 1.324567, 1, 1, 1, 1, 1,
0.5523396, 0.2483949, 1.347462, 1, 1, 1, 1, 1,
0.5566882, -0.7977394, 3.083848, 1, 1, 1, 1, 1,
0.5571513, -0.5766351, 2.564203, 0, 0, 1, 1, 1,
0.5573631, 0.5395624, 0.3487706, 1, 0, 0, 1, 1,
0.5574523, -1.959231, 2.848693, 1, 0, 0, 1, 1,
0.5589598, -0.9565585, 3.532787, 1, 0, 0, 1, 1,
0.5599758, 0.7844958, -1.30994, 1, 0, 0, 1, 1,
0.5727078, -0.7805343, 3.243545, 1, 0, 0, 1, 1,
0.5727466, 1.254817, 0.3724574, 0, 0, 0, 1, 1,
0.5761339, -1.306546, 2.97048, 0, 0, 0, 1, 1,
0.5797001, -1.317423, 2.435979, 0, 0, 0, 1, 1,
0.5834984, -1.00527, 0.3087982, 0, 0, 0, 1, 1,
0.5867407, 0.2179992, 0.7080014, 0, 0, 0, 1, 1,
0.5900928, 0.5285515, 1.534739, 0, 0, 0, 1, 1,
0.5947389, 0.1535269, 1.637584, 0, 0, 0, 1, 1,
0.5992166, -0.01541472, 0.7902082, 1, 1, 1, 1, 1,
0.5997752, -0.4125538, 1.539907, 1, 1, 1, 1, 1,
0.6044697, -0.492559, 2.627919, 1, 1, 1, 1, 1,
0.6062748, -1.090708, 3.501063, 1, 1, 1, 1, 1,
0.6080804, 0.8769808, -0.5898528, 1, 1, 1, 1, 1,
0.6119262, -0.07032617, 1.48904, 1, 1, 1, 1, 1,
0.6125028, 1.080654, 1.05471, 1, 1, 1, 1, 1,
0.613637, 0.8906188, 1.982792, 1, 1, 1, 1, 1,
0.6157169, -0.1260758, 2.426759, 1, 1, 1, 1, 1,
0.6184205, 1.283581, 0.125242, 1, 1, 1, 1, 1,
0.6234266, -1.000269, 2.009966, 1, 1, 1, 1, 1,
0.6251553, 0.5357277, 2.195008, 1, 1, 1, 1, 1,
0.6297376, 1.650307, 0.9160392, 1, 1, 1, 1, 1,
0.6353773, 0.1775897, 2.302924, 1, 1, 1, 1, 1,
0.6362048, 0.3115726, 1.394787, 1, 1, 1, 1, 1,
0.6363829, -2.409355, 1.209456, 0, 0, 1, 1, 1,
0.6434197, 1.549922, -0.5896088, 1, 0, 0, 1, 1,
0.6447368, 1.715166, 0.6795654, 1, 0, 0, 1, 1,
0.6466808, 0.1005513, 2.75198, 1, 0, 0, 1, 1,
0.6497406, -1.35559, 4.342043, 1, 0, 0, 1, 1,
0.6524271, -0.5415766, 2.781442, 1, 0, 0, 1, 1,
0.6528066, -2.029132, 2.764638, 0, 0, 0, 1, 1,
0.6561487, 0.7779806, -0.1483901, 0, 0, 0, 1, 1,
0.6599706, 0.3320225, 0.5013233, 0, 0, 0, 1, 1,
0.6608973, -0.5924134, 0.314489, 0, 0, 0, 1, 1,
0.6642212, 0.7847501, 1.034139, 0, 0, 0, 1, 1,
0.6706021, -0.03263574, 1.195432, 0, 0, 0, 1, 1,
0.7053025, 1.285219, 0.3385417, 0, 0, 0, 1, 1,
0.7077705, 0.03247356, 2.597531, 1, 1, 1, 1, 1,
0.7098293, 0.2565891, 1.760392, 1, 1, 1, 1, 1,
0.7122404, -0.3167177, 2.031305, 1, 1, 1, 1, 1,
0.714279, 0.4634051, 1.595852, 1, 1, 1, 1, 1,
0.7187039, 0.5665078, -0.553387, 1, 1, 1, 1, 1,
0.7235773, 0.805316, 1.084948, 1, 1, 1, 1, 1,
0.7243074, 0.2300019, -0.1437441, 1, 1, 1, 1, 1,
0.7268769, 2.742762, 1.024405, 1, 1, 1, 1, 1,
0.7315064, -1.266296, 1.128721, 1, 1, 1, 1, 1,
0.7316444, -0.8042535, 1.524155, 1, 1, 1, 1, 1,
0.7324657, 0.9781022, 0.1005757, 1, 1, 1, 1, 1,
0.7351453, 2.127007, 0.3148446, 1, 1, 1, 1, 1,
0.7359198, 0.4918391, 1.649872, 1, 1, 1, 1, 1,
0.7391008, -0.3488792, 2.307976, 1, 1, 1, 1, 1,
0.7409138, -1.420913, 1.581613, 1, 1, 1, 1, 1,
0.7419676, 0.9342135, 0.8348379, 0, 0, 1, 1, 1,
0.7479168, -0.6166607, 2.325378, 1, 0, 0, 1, 1,
0.7484702, 1.040732, 0.6001356, 1, 0, 0, 1, 1,
0.7511686, 0.1828674, 0.592077, 1, 0, 0, 1, 1,
0.7528849, 1.704978, 0.7580252, 1, 0, 0, 1, 1,
0.753678, 1.260113, -0.2212943, 1, 0, 0, 1, 1,
0.762958, 0.1253208, 0.7363579, 0, 0, 0, 1, 1,
0.7664371, -0.7150014, 2.028606, 0, 0, 0, 1, 1,
0.7737957, -0.7941836, 3.435585, 0, 0, 0, 1, 1,
0.7789379, 0.9792517, -0.002577321, 0, 0, 0, 1, 1,
0.7820775, -0.2371324, 2.695251, 0, 0, 0, 1, 1,
0.7821352, -0.1747562, 1.801472, 0, 0, 0, 1, 1,
0.7866634, 0.5717674, 1.334436, 0, 0, 0, 1, 1,
0.7931966, 0.4556888, 1.465992, 1, 1, 1, 1, 1,
0.7953229, -0.6065654, 0.5984677, 1, 1, 1, 1, 1,
0.801541, 1.374074, 0.5788838, 1, 1, 1, 1, 1,
0.8088759, -0.07270603, 0.7081428, 1, 1, 1, 1, 1,
0.8101674, 1.014179, 0.7552155, 1, 1, 1, 1, 1,
0.8118371, -0.8969529, 3.033645, 1, 1, 1, 1, 1,
0.8193879, -1.228605, 2.35562, 1, 1, 1, 1, 1,
0.8236114, -0.4482265, 2.882999, 1, 1, 1, 1, 1,
0.8240933, 0.2816893, 1.609269, 1, 1, 1, 1, 1,
0.8350374, -0.7553588, 3.80022, 1, 1, 1, 1, 1,
0.8442883, 0.4224732, 1.074784, 1, 1, 1, 1, 1,
0.8502262, -0.3361003, 0.1051304, 1, 1, 1, 1, 1,
0.8507048, -0.4316548, 1.816524, 1, 1, 1, 1, 1,
0.8556847, -0.9985242, 0.4321981, 1, 1, 1, 1, 1,
0.8621024, 0.9007307, -0.1039097, 1, 1, 1, 1, 1,
0.8657861, -1.042551, 2.192184, 0, 0, 1, 1, 1,
0.8660541, -0.689882, 1.536853, 1, 0, 0, 1, 1,
0.8664556, -1.699022, 3.326836, 1, 0, 0, 1, 1,
0.8723651, -1.424231, 2.528866, 1, 0, 0, 1, 1,
0.8753386, 0.2635739, 1.078082, 1, 0, 0, 1, 1,
0.8776234, 0.1284543, 0.8740472, 1, 0, 0, 1, 1,
0.8798023, -2.043586, 2.786538, 0, 0, 0, 1, 1,
0.8917349, 0.07847384, -0.4888114, 0, 0, 0, 1, 1,
0.8997877, 0.3850769, 2.617969, 0, 0, 0, 1, 1,
0.9031252, -0.640058, 2.381606, 0, 0, 0, 1, 1,
0.9046296, 0.6514369, 0.929728, 0, 0, 0, 1, 1,
0.9071237, -0.7435557, 3.664071, 0, 0, 0, 1, 1,
0.9072686, 1.145482, 2.829607, 0, 0, 0, 1, 1,
0.9141317, -2.49165, 3.280491, 1, 1, 1, 1, 1,
0.9272901, -0.09991387, 0.3252454, 1, 1, 1, 1, 1,
0.9298718, 0.2837983, 0.4537294, 1, 1, 1, 1, 1,
0.9331878, 0.976127, 2.464355, 1, 1, 1, 1, 1,
0.9370027, 0.8457967, 1.20042, 1, 1, 1, 1, 1,
0.9487883, -0.5116042, 1.479845, 1, 1, 1, 1, 1,
0.9503351, -1.037482, 2.438067, 1, 1, 1, 1, 1,
0.9524455, 1.88949, 0.5868658, 1, 1, 1, 1, 1,
0.9574965, -0.5747929, 2.210505, 1, 1, 1, 1, 1,
0.958505, -1.261745, 2.244439, 1, 1, 1, 1, 1,
0.9602447, 1.800793, 0.2580025, 1, 1, 1, 1, 1,
0.962736, 1.622151, -0.2618243, 1, 1, 1, 1, 1,
0.9639874, -1.572554, 2.774805, 1, 1, 1, 1, 1,
0.9648603, 0.2358943, 2.204663, 1, 1, 1, 1, 1,
0.970163, 0.3056122, 2.720272, 1, 1, 1, 1, 1,
0.9762128, -0.3622866, 2.347517, 0, 0, 1, 1, 1,
0.978015, -0.695079, 1.188363, 1, 0, 0, 1, 1,
0.9805129, -0.3830121, 2.641703, 1, 0, 0, 1, 1,
0.9867466, -1.209602, 1.885367, 1, 0, 0, 1, 1,
0.9891059, -0.3700795, 3.001793, 1, 0, 0, 1, 1,
0.9908933, -1.486144, 1.51761, 1, 0, 0, 1, 1,
0.9927224, -0.6096628, 2.636488, 0, 0, 0, 1, 1,
0.9990451, -0.7368576, 2.809161, 0, 0, 0, 1, 1,
1.007296, 1.229691, 0.1007235, 0, 0, 0, 1, 1,
1.016364, -0.5747279, 1.461666, 0, 0, 0, 1, 1,
1.018469, 0.4054436, 0.2011576, 0, 0, 0, 1, 1,
1.024467, -1.046734, 2.232328, 0, 0, 0, 1, 1,
1.029646, -3.190281, 3.305073, 0, 0, 0, 1, 1,
1.038778, 1.189023, 2.166526, 1, 1, 1, 1, 1,
1.040751, -0.366248, 1.934545, 1, 1, 1, 1, 1,
1.042121, 0.5649991, 1.883699, 1, 1, 1, 1, 1,
1.043027, 0.4280287, 2.590485, 1, 1, 1, 1, 1,
1.043694, -1.203261, 2.934254, 1, 1, 1, 1, 1,
1.047073, 1.746443, -1.621276, 1, 1, 1, 1, 1,
1.052111, -0.08773247, 1.725794, 1, 1, 1, 1, 1,
1.054988, 1.119361, 0.01829316, 1, 1, 1, 1, 1,
1.060401, 0.35395, 2.837107, 1, 1, 1, 1, 1,
1.061962, 0.4810075, 0.3361672, 1, 1, 1, 1, 1,
1.062029, -1.113243, 2.78727, 1, 1, 1, 1, 1,
1.062059, 0.8201838, 2.098303, 1, 1, 1, 1, 1,
1.063554, -0.4010783, 1.090577, 1, 1, 1, 1, 1,
1.065714, 0.05326303, 0.4947311, 1, 1, 1, 1, 1,
1.066906, -1.092257, 1.54943, 1, 1, 1, 1, 1,
1.068864, -0.5282083, 1.556262, 0, 0, 1, 1, 1,
1.070265, 0.8056457, -2.086056, 1, 0, 0, 1, 1,
1.074419, -0.232579, 2.250913, 1, 0, 0, 1, 1,
1.075016, 0.5785941, 0.8215813, 1, 0, 0, 1, 1,
1.075162, 1.064221, 1.743429, 1, 0, 0, 1, 1,
1.079956, -1.994292, 1.929408, 1, 0, 0, 1, 1,
1.079992, 2.204463, 1.273148, 0, 0, 0, 1, 1,
1.083199, 2.620971, -0.08169015, 0, 0, 0, 1, 1,
1.084457, 0.4348707, 2.90891, 0, 0, 0, 1, 1,
1.089586, 1.11402, 0.2458209, 0, 0, 0, 1, 1,
1.093141, 0.09938971, 0.189863, 0, 0, 0, 1, 1,
1.098519, 0.7254475, 2.086744, 0, 0, 0, 1, 1,
1.105809, -2.238379, 3.585207, 0, 0, 0, 1, 1,
1.110372, -0.5356837, 2.558316, 1, 1, 1, 1, 1,
1.112338, 0.8948418, 0.6196728, 1, 1, 1, 1, 1,
1.125072, 1.469347, 0.6243109, 1, 1, 1, 1, 1,
1.129627, 1.098961, 1.269701, 1, 1, 1, 1, 1,
1.133915, 0.9139549, 0.377176, 1, 1, 1, 1, 1,
1.133922, 0.7254195, 1.503723, 1, 1, 1, 1, 1,
1.13761, -0.1607153, 2.942276, 1, 1, 1, 1, 1,
1.145646, 1.194184, 1.735303, 1, 1, 1, 1, 1,
1.1472, -0.09004921, 0.3404834, 1, 1, 1, 1, 1,
1.148286, -1.254273, 3.151009, 1, 1, 1, 1, 1,
1.148804, -0.5179963, 4.020356, 1, 1, 1, 1, 1,
1.149567, 1.647547, 0.2998456, 1, 1, 1, 1, 1,
1.150454, 1.191542, 0.04820808, 1, 1, 1, 1, 1,
1.157057, -0.5053383, 2.310737, 1, 1, 1, 1, 1,
1.161329, -0.5806345, 2.282329, 1, 1, 1, 1, 1,
1.161971, -0.7103235, 2.141398, 0, 0, 1, 1, 1,
1.163669, -1.400667, 2.768216, 1, 0, 0, 1, 1,
1.165081, 1.093195, 1.473384, 1, 0, 0, 1, 1,
1.167473, 0.7683539, 0.05787033, 1, 0, 0, 1, 1,
1.178051, -0.0750182, -0.04204871, 1, 0, 0, 1, 1,
1.18324, -0.5100083, 1.167336, 1, 0, 0, 1, 1,
1.186614, -0.3106895, 0.4002043, 0, 0, 0, 1, 1,
1.195293, -0.899323, 2.761657, 0, 0, 0, 1, 1,
1.195996, 0.8377113, 1.080676, 0, 0, 0, 1, 1,
1.196139, -0.2956207, 3.896577, 0, 0, 0, 1, 1,
1.196558, 0.5266126, -0.1269151, 0, 0, 0, 1, 1,
1.201106, 1.01409, -0.1228266, 0, 0, 0, 1, 1,
1.207381, 0.1037169, 1.842806, 0, 0, 0, 1, 1,
1.212783, 0.1502375, 1.418144, 1, 1, 1, 1, 1,
1.217523, 0.8526987, -1.147087, 1, 1, 1, 1, 1,
1.220737, 0.9798475, 1.013708, 1, 1, 1, 1, 1,
1.225087, 0.3334945, 1.452165, 1, 1, 1, 1, 1,
1.246692, -0.09914776, 2.927285, 1, 1, 1, 1, 1,
1.249155, 0.08011553, 3.071966, 1, 1, 1, 1, 1,
1.256989, 2.389133, 1.498484, 1, 1, 1, 1, 1,
1.261363, -0.8624116, 0.5559452, 1, 1, 1, 1, 1,
1.264493, 0.2219928, 0.830636, 1, 1, 1, 1, 1,
1.279003, -0.2055412, 3.166509, 1, 1, 1, 1, 1,
1.281622, 0.3802003, 0.4669244, 1, 1, 1, 1, 1,
1.283945, 0.02361687, 1.980442, 1, 1, 1, 1, 1,
1.28887, -1.178218, 1.284499, 1, 1, 1, 1, 1,
1.298346, -0.2297602, 0.6705396, 1, 1, 1, 1, 1,
1.303437, -0.06949247, -1.217159, 1, 1, 1, 1, 1,
1.303444, -0.0837139, 1.437862, 0, 0, 1, 1, 1,
1.30825, -0.4322381, 2.940294, 1, 0, 0, 1, 1,
1.315643, 1.504606, 0.6102158, 1, 0, 0, 1, 1,
1.319938, -0.6141192, 1.976931, 1, 0, 0, 1, 1,
1.333919, -0.4802228, 2.703896, 1, 0, 0, 1, 1,
1.367876, 0.6677547, 1.558441, 1, 0, 0, 1, 1,
1.3755, -0.5874125, -1.358237, 0, 0, 0, 1, 1,
1.379718, 0.6545995, 2.517534, 0, 0, 0, 1, 1,
1.380414, -1.324643, 2.125789, 0, 0, 0, 1, 1,
1.384764, -0.1600133, 1.105486, 0, 0, 0, 1, 1,
1.388644, -0.7056625, 1.437599, 0, 0, 0, 1, 1,
1.389994, -1.698302, 3.775436, 0, 0, 0, 1, 1,
1.394235, 0.5170198, 1.971996, 0, 0, 0, 1, 1,
1.394289, -0.2800471, 1.342769, 1, 1, 1, 1, 1,
1.395342, -1.075973, 3.228401, 1, 1, 1, 1, 1,
1.397163, -0.9155018, 2.453462, 1, 1, 1, 1, 1,
1.406194, -1.362195, 4.249164, 1, 1, 1, 1, 1,
1.408072, -0.5453231, 2.765956, 1, 1, 1, 1, 1,
1.417849, -0.4282432, 2.869214, 1, 1, 1, 1, 1,
1.421004, -1.488608, 2.310717, 1, 1, 1, 1, 1,
1.422509, 0.7210374, 0.5774509, 1, 1, 1, 1, 1,
1.440865, 0.6166792, 1.121497, 1, 1, 1, 1, 1,
1.45242, -0.8781208, 2.889178, 1, 1, 1, 1, 1,
1.459612, -0.6941308, 2.649297, 1, 1, 1, 1, 1,
1.472541, -0.8967149, 3.413042, 1, 1, 1, 1, 1,
1.496986, 1.978554, -1.60783, 1, 1, 1, 1, 1,
1.502679, 0.1308191, 1.658665, 1, 1, 1, 1, 1,
1.505738, -0.5578122, 0.6475861, 1, 1, 1, 1, 1,
1.513967, 1.259413, 0.9269698, 0, 0, 1, 1, 1,
1.514155, -0.673905, 0.08875222, 1, 0, 0, 1, 1,
1.524487, 0.8455822, 2.4135, 1, 0, 0, 1, 1,
1.524911, -0.6104126, 2.145475, 1, 0, 0, 1, 1,
1.534378, 0.2064269, 2.574267, 1, 0, 0, 1, 1,
1.5361, 0.2411034, 1.974428, 1, 0, 0, 1, 1,
1.53687, 0.3370194, 1.41332, 0, 0, 0, 1, 1,
1.539362, 0.8318266, 0.1592281, 0, 0, 0, 1, 1,
1.542195, -0.09499313, 2.77962, 0, 0, 0, 1, 1,
1.543632, -0.4124766, 2.153883, 0, 0, 0, 1, 1,
1.548768, -0.007074573, 1.791665, 0, 0, 0, 1, 1,
1.559081, 2.390101, 1.11792, 0, 0, 0, 1, 1,
1.560302, -0.7479563, 4.24981, 0, 0, 0, 1, 1,
1.602632, -1.550277, 2.503503, 1, 1, 1, 1, 1,
1.604685, -0.1615927, 3.35957, 1, 1, 1, 1, 1,
1.605215, 0.07658857, 2.043026, 1, 1, 1, 1, 1,
1.606665, -0.3020728, 0.1003094, 1, 1, 1, 1, 1,
1.608245, 0.6614746, 1.592516, 1, 1, 1, 1, 1,
1.609312, 1.328535, -0.5062153, 1, 1, 1, 1, 1,
1.610286, 0.006058376, 0.7597905, 1, 1, 1, 1, 1,
1.622365, 0.6676514, 0.4473675, 1, 1, 1, 1, 1,
1.630378, -1.754702, 3.7436, 1, 1, 1, 1, 1,
1.641068, -2.506525, 2.504884, 1, 1, 1, 1, 1,
1.669795, 1.512294, 1.010114, 1, 1, 1, 1, 1,
1.67932, 1.139755, 2.463655, 1, 1, 1, 1, 1,
1.702231, 0.4744514, -0.0009691829, 1, 1, 1, 1, 1,
1.703718, -1.935497, 1.317188, 1, 1, 1, 1, 1,
1.706925, -0.8189183, 2.090267, 1, 1, 1, 1, 1,
1.734565, -0.8682301, 1.939895, 0, 0, 1, 1, 1,
1.736512, -0.2685684, 3.763719, 1, 0, 0, 1, 1,
1.73949, 1.139434, 2.069998, 1, 0, 0, 1, 1,
1.74239, 0.124999, 0.6667123, 1, 0, 0, 1, 1,
1.743938, 1.519793, -0.4830619, 1, 0, 0, 1, 1,
1.74473, 0.6371408, 0.1707819, 1, 0, 0, 1, 1,
1.751362, 0.7579589, 1.594445, 0, 0, 0, 1, 1,
1.752411, -0.1961531, 1.208876, 0, 0, 0, 1, 1,
1.758613, -2.329049, 3.124093, 0, 0, 0, 1, 1,
1.76144, -0.129386, 1.294133, 0, 0, 0, 1, 1,
1.762484, -0.4490441, 1.925115, 0, 0, 0, 1, 1,
1.763947, 0.5048289, 2.092891, 0, 0, 0, 1, 1,
1.79718, -0.5144818, 2.008526, 0, 0, 0, 1, 1,
1.80072, -0.2153619, 1.187806, 1, 1, 1, 1, 1,
1.81261, -0.06497364, 0.8171266, 1, 1, 1, 1, 1,
1.850061, 1.406713, 1.613224, 1, 1, 1, 1, 1,
1.857825, -0.03991089, 3.18628, 1, 1, 1, 1, 1,
1.869482, -0.7213655, 1.284376, 1, 1, 1, 1, 1,
1.876972, -1.214378, 3.860485, 1, 1, 1, 1, 1,
1.88617, -0.8911071, 1.615307, 1, 1, 1, 1, 1,
1.891344, 0.05025487, 3.011465, 1, 1, 1, 1, 1,
1.912685, 0.0352986, 2.041883, 1, 1, 1, 1, 1,
1.918584, -0.09842871, 1.418912, 1, 1, 1, 1, 1,
1.943383, -0.2416738, 3.633371, 1, 1, 1, 1, 1,
1.970946, -0.6918148, 0.862332, 1, 1, 1, 1, 1,
1.973682, 1.023849, 1.297981, 1, 1, 1, 1, 1,
1.985084, 1.347111, -0.7714095, 1, 1, 1, 1, 1,
1.990187, 0.9951004, 1.236932, 1, 1, 1, 1, 1,
2.002067, 2.191786, -0.3596275, 0, 0, 1, 1, 1,
2.012862, -1.093436, 2.133125, 1, 0, 0, 1, 1,
2.014008, 0.4451534, 1.527724, 1, 0, 0, 1, 1,
2.014449, -0.9706215, 1.888713, 1, 0, 0, 1, 1,
2.077648, -0.1336842, 2.876726, 1, 0, 0, 1, 1,
2.100227, -0.9772868, 0.3915432, 1, 0, 0, 1, 1,
2.123675, 0.7740538, 0.8965949, 0, 0, 0, 1, 1,
2.143507, 0.04290144, 1.098907, 0, 0, 0, 1, 1,
2.184152, 0.2930233, 1.203961, 0, 0, 0, 1, 1,
2.278464, 1.391017, 1.36574, 0, 0, 0, 1, 1,
2.321669, 1.424683, -0.3935823, 0, 0, 0, 1, 1,
2.361317, 2.194531, -0.5560952, 0, 0, 0, 1, 1,
2.493384, 0.07239567, 1.103472, 0, 0, 0, 1, 1,
2.497151, 0.3609459, 2.551172, 1, 1, 1, 1, 1,
2.654341, -0.02968825, -1.472874, 1, 1, 1, 1, 1,
2.66634, 0.5000483, 1.572795, 1, 1, 1, 1, 1,
2.720775, 0.1146238, 2.414886, 1, 1, 1, 1, 1,
2.75013, -0.7712837, 2.062084, 1, 1, 1, 1, 1,
2.852449, -0.521458, 0.8323612, 1, 1, 1, 1, 1,
3.824212, 0.60667, 1.802586, 1, 1, 1, 1, 1
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
var radius = 9.658209;
var distance = 33.92405;
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
mvMatrix.translate( -0.1752203, -0.01579404, 0.2090106 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.92405);
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
