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
-3.024375, 2.168901, -1.204676, 1, 0, 0, 1,
-2.696291, -0.01117107, -0.8930596, 1, 0.007843138, 0, 1,
-2.560501, 0.846444, -0.7443188, 1, 0.01176471, 0, 1,
-2.468374, -0.9300621, -2.140285, 1, 0.01960784, 0, 1,
-2.370539, 0.327918, -1.966473, 1, 0.02352941, 0, 1,
-2.358869, 0.2685502, -1.427318, 1, 0.03137255, 0, 1,
-2.356329, 0.7933092, -1.387326, 1, 0.03529412, 0, 1,
-2.282147, -0.5867563, -1.757032, 1, 0.04313726, 0, 1,
-2.280792, 1.64897, -0.1593117, 1, 0.04705882, 0, 1,
-2.276891, -1.172744, -1.956196, 1, 0.05490196, 0, 1,
-2.26864, -0.9746671, 0.3375118, 1, 0.05882353, 0, 1,
-2.258209, -0.5603703, -1.299017, 1, 0.06666667, 0, 1,
-2.25758, 0.5740913, -1.141679, 1, 0.07058824, 0, 1,
-2.25627, -0.08290244, -1.794779, 1, 0.07843138, 0, 1,
-2.181317, 0.4958521, -1.477755, 1, 0.08235294, 0, 1,
-2.177845, 1.80689, -2.091736, 1, 0.09019608, 0, 1,
-2.173316, 1.498953, -1.134644, 1, 0.09411765, 0, 1,
-2.142886, 0.7792528, -2.79636, 1, 0.1019608, 0, 1,
-2.142087, -0.309698, -3.535267, 1, 0.1098039, 0, 1,
-2.121543, 0.36656, -0.8311893, 1, 0.1137255, 0, 1,
-2.004453, -0.2880304, -2.64641, 1, 0.1215686, 0, 1,
-1.993252, -0.9220235, -1.822864, 1, 0.1254902, 0, 1,
-1.992174, -2.020158, -1.139353, 1, 0.1333333, 0, 1,
-1.986949, 0.3001634, -1.760161, 1, 0.1372549, 0, 1,
-1.976571, 0.2137171, -1.352025, 1, 0.145098, 0, 1,
-1.950921, 1.643364, -1.314659, 1, 0.1490196, 0, 1,
-1.939675, -0.249958, -2.152499, 1, 0.1568628, 0, 1,
-1.931358, 0.04833342, -1.262159, 1, 0.1607843, 0, 1,
-1.907283, 0.7034071, 0.3776678, 1, 0.1686275, 0, 1,
-1.870371, 1.013483, 0.7975916, 1, 0.172549, 0, 1,
-1.851894, 0.3750102, -0.1807461, 1, 0.1803922, 0, 1,
-1.830439, 1.170156, -0.1828463, 1, 0.1843137, 0, 1,
-1.821563, -0.142705, -1.178427, 1, 0.1921569, 0, 1,
-1.777253, -0.7410547, -0.6333461, 1, 0.1960784, 0, 1,
-1.769856, 1.021534, -0.5226257, 1, 0.2039216, 0, 1,
-1.748645, 0.1858888, -0.6622807, 1, 0.2117647, 0, 1,
-1.744715, 0.8596277, -0.1267006, 1, 0.2156863, 0, 1,
-1.722168, -0.008952205, 1.236198, 1, 0.2235294, 0, 1,
-1.721565, 0.7313323, -0.9622709, 1, 0.227451, 0, 1,
-1.72109, 1.117582, -1.763945, 1, 0.2352941, 0, 1,
-1.712719, 0.5924399, -2.979486, 1, 0.2392157, 0, 1,
-1.681384, 0.4036846, 0.2242914, 1, 0.2470588, 0, 1,
-1.67398, 0.4045233, -0.7713006, 1, 0.2509804, 0, 1,
-1.671647, 1.348577, -1.914903, 1, 0.2588235, 0, 1,
-1.664246, -0.5177406, -1.975576, 1, 0.2627451, 0, 1,
-1.660761, 0.4230836, -2.066673, 1, 0.2705882, 0, 1,
-1.642438, -0.6675121, -4.401135, 1, 0.2745098, 0, 1,
-1.63972, -0.3996378, -1.83331, 1, 0.282353, 0, 1,
-1.635676, -1.934201, -2.937557, 1, 0.2862745, 0, 1,
-1.625474, 1.748908, -1.602201, 1, 0.2941177, 0, 1,
-1.610488, 0.03369961, -2.178743, 1, 0.3019608, 0, 1,
-1.606028, 0.7820854, -2.293788, 1, 0.3058824, 0, 1,
-1.596259, 0.5918389, 0.211943, 1, 0.3137255, 0, 1,
-1.595776, -0.3878897, -2.171698, 1, 0.3176471, 0, 1,
-1.591077, -0.9673844, -1.876136, 1, 0.3254902, 0, 1,
-1.539872, -1.034844, -1.749103, 1, 0.3294118, 0, 1,
-1.536175, 0.8531122, 0.4158265, 1, 0.3372549, 0, 1,
-1.532151, -0.6230801, -1.841343, 1, 0.3411765, 0, 1,
-1.528385, 1.058186, -0.6256496, 1, 0.3490196, 0, 1,
-1.517576, 0.7908708, -1.341257, 1, 0.3529412, 0, 1,
-1.511159, -2.236028, -2.489257, 1, 0.3607843, 0, 1,
-1.476022, -0.4741491, -1.859022, 1, 0.3647059, 0, 1,
-1.463314, 0.396512, -2.193837, 1, 0.372549, 0, 1,
-1.452957, 1.29456, -0.2390139, 1, 0.3764706, 0, 1,
-1.444425, 0.9646218, -0.9825681, 1, 0.3843137, 0, 1,
-1.440952, -0.2843066, -0.886788, 1, 0.3882353, 0, 1,
-1.435349, 0.4244866, 0.8094251, 1, 0.3960784, 0, 1,
-1.42002, -0.7210752, -0.2414227, 1, 0.4039216, 0, 1,
-1.419952, -1.163609, -1.415588, 1, 0.4078431, 0, 1,
-1.407955, 0.7742204, 0.8342962, 1, 0.4156863, 0, 1,
-1.405886, -0.6292599, -0.1965621, 1, 0.4196078, 0, 1,
-1.400272, 0.4595589, -0.2395716, 1, 0.427451, 0, 1,
-1.399657, -0.6213611, -1.069015, 1, 0.4313726, 0, 1,
-1.39382, -0.4335432, -2.574711, 1, 0.4392157, 0, 1,
-1.390725, 1.447743, -1.709432, 1, 0.4431373, 0, 1,
-1.378843, -0.8239552, -2.853806, 1, 0.4509804, 0, 1,
-1.374244, 0.7340006, -3.442675, 1, 0.454902, 0, 1,
-1.36815, 0.3992476, -0.7641782, 1, 0.4627451, 0, 1,
-1.365419, 2.419807, -0.10016, 1, 0.4666667, 0, 1,
-1.353064, -0.5255483, -3.070802, 1, 0.4745098, 0, 1,
-1.341201, 0.6489246, -1.044744, 1, 0.4784314, 0, 1,
-1.333777, 0.2771314, 1.258043, 1, 0.4862745, 0, 1,
-1.321805, -1.802153, -2.454125, 1, 0.4901961, 0, 1,
-1.320977, 0.0508473, -2.044528, 1, 0.4980392, 0, 1,
-1.316429, -1.225199, -2.985798, 1, 0.5058824, 0, 1,
-1.309143, -1.166305, -2.349693, 1, 0.509804, 0, 1,
-1.303545, -0.3178191, -3.151029, 1, 0.5176471, 0, 1,
-1.288247, -1.716426, -2.924483, 1, 0.5215687, 0, 1,
-1.288044, 1.234987, 0.4784465, 1, 0.5294118, 0, 1,
-1.282914, 0.003111169, -2.066713, 1, 0.5333334, 0, 1,
-1.277809, 1.095085, -2.087749, 1, 0.5411765, 0, 1,
-1.274812, 1.010864, -1.398502, 1, 0.5450981, 0, 1,
-1.273095, 1.517383, -0.6915655, 1, 0.5529412, 0, 1,
-1.271797, 0.5823835, -0.5670739, 1, 0.5568628, 0, 1,
-1.270429, 2.319731, -1.288235, 1, 0.5647059, 0, 1,
-1.267448, 0.1620343, -1.124116, 1, 0.5686275, 0, 1,
-1.251555, 1.07207, -1.218105, 1, 0.5764706, 0, 1,
-1.245154, 0.4099008, -1.462531, 1, 0.5803922, 0, 1,
-1.244203, -1.54551, -3.421134, 1, 0.5882353, 0, 1,
-1.239251, 0.5596568, -1.749802, 1, 0.5921569, 0, 1,
-1.227551, 1.972825, -0.5860856, 1, 0.6, 0, 1,
-1.218078, 0.06622968, -1.979357, 1, 0.6078432, 0, 1,
-1.208667, 0.181312, -2.031811, 1, 0.6117647, 0, 1,
-1.206675, -1.050313, -0.9312413, 1, 0.6196079, 0, 1,
-1.177849, 2.153817, -0.6268257, 1, 0.6235294, 0, 1,
-1.177757, -1.6061, -0.6885423, 1, 0.6313726, 0, 1,
-1.177122, -1.624323, -1.872337, 1, 0.6352941, 0, 1,
-1.175851, 0.8864844, -2.207221, 1, 0.6431373, 0, 1,
-1.175166, -0.0949747, -3.230002, 1, 0.6470588, 0, 1,
-1.172196, -0.7499324, -1.084587, 1, 0.654902, 0, 1,
-1.155418, 0.9027371, -0.8288098, 1, 0.6588235, 0, 1,
-1.151297, 2.991107, 0.2381353, 1, 0.6666667, 0, 1,
-1.151284, 0.2750401, 0.7312059, 1, 0.6705883, 0, 1,
-1.150932, -0.5746871, -2.858521, 1, 0.6784314, 0, 1,
-1.150869, -0.4267378, -1.083308, 1, 0.682353, 0, 1,
-1.143362, -1.100934, -3.513021, 1, 0.6901961, 0, 1,
-1.141701, -2.291367, -3.605515, 1, 0.6941177, 0, 1,
-1.136682, -1.370808, -2.474808, 1, 0.7019608, 0, 1,
-1.133956, 0.2655076, 0.1990294, 1, 0.7098039, 0, 1,
-1.133771, 0.3312514, -1.201961, 1, 0.7137255, 0, 1,
-1.130745, 1.758337, -0.3511797, 1, 0.7215686, 0, 1,
-1.127082, -0.09395055, -1.099594, 1, 0.7254902, 0, 1,
-1.111281, 0.2473321, -2.865624, 1, 0.7333333, 0, 1,
-1.111067, 0.2388996, -2.82382, 1, 0.7372549, 0, 1,
-1.109599, -0.887771, -1.721725, 1, 0.7450981, 0, 1,
-1.107548, -1.593793, -0.3277081, 1, 0.7490196, 0, 1,
-1.091761, 0.2174817, -1.433129, 1, 0.7568628, 0, 1,
-1.089367, 0.9104775, -1.895874, 1, 0.7607843, 0, 1,
-1.087686, -0.7035927, -2.390994, 1, 0.7686275, 0, 1,
-1.084338, -0.2997296, -1.729684, 1, 0.772549, 0, 1,
-1.072586, -0.01009211, -0.748871, 1, 0.7803922, 0, 1,
-1.065629, -0.08958983, -2.32223, 1, 0.7843137, 0, 1,
-1.063945, -0.8324012, -1.611854, 1, 0.7921569, 0, 1,
-1.056361, -0.2042244, -1.395813, 1, 0.7960784, 0, 1,
-1.026566, 0.9521603, -1.261212, 1, 0.8039216, 0, 1,
-1.02103, 1.647382, -0.6486368, 1, 0.8117647, 0, 1,
-1.020398, 0.5597069, -3.21521, 1, 0.8156863, 0, 1,
-1.011958, 0.1331244, -0.07102921, 1, 0.8235294, 0, 1,
-1.00983, -0.1704479, -1.554735, 1, 0.827451, 0, 1,
-1.006456, 0.4986075, 0.1852033, 1, 0.8352941, 0, 1,
-1.005165, -0.254887, -3.668092, 1, 0.8392157, 0, 1,
-1.004442, -0.661997, -2.613599, 1, 0.8470588, 0, 1,
-1.000358, -0.8109106, -1.384636, 1, 0.8509804, 0, 1,
-0.9957592, -0.7617568, -2.570251, 1, 0.8588235, 0, 1,
-0.9947729, -0.1250992, -3.443572, 1, 0.8627451, 0, 1,
-0.9913687, -0.4409268, -1.525918, 1, 0.8705882, 0, 1,
-0.9892849, 0.02115957, -2.288403, 1, 0.8745098, 0, 1,
-0.9808674, 0.3227973, -1.595426, 1, 0.8823529, 0, 1,
-0.9799393, 0.748628, -1.92822, 1, 0.8862745, 0, 1,
-0.969298, 2.24143, 0.06510612, 1, 0.8941177, 0, 1,
-0.9687481, 1.467394, -0.8114086, 1, 0.8980392, 0, 1,
-0.9661705, -1.302063, -2.774985, 1, 0.9058824, 0, 1,
-0.9564739, 1.227889, 0.0439693, 1, 0.9137255, 0, 1,
-0.9552327, 0.121916, -1.058182, 1, 0.9176471, 0, 1,
-0.9328625, 0.4196018, -1.608014, 1, 0.9254902, 0, 1,
-0.9305538, -0.09276431, -1.768571, 1, 0.9294118, 0, 1,
-0.9283276, 1.756017, -1.42205, 1, 0.9372549, 0, 1,
-0.9271469, 0.173532, -1.401314, 1, 0.9411765, 0, 1,
-0.9097115, 0.6399465, -1.997949, 1, 0.9490196, 0, 1,
-0.9083133, -2.357969, -1.885443, 1, 0.9529412, 0, 1,
-0.9069324, -0.5298044, -1.484638, 1, 0.9607843, 0, 1,
-0.9033883, 1.012816, -1.054047, 1, 0.9647059, 0, 1,
-0.8936167, -0.3789495, -1.204206, 1, 0.972549, 0, 1,
-0.8935202, -1.520412, -3.435391, 1, 0.9764706, 0, 1,
-0.8928971, -0.8075948, -3.717066, 1, 0.9843137, 0, 1,
-0.8888518, -1.233331, -2.17408, 1, 0.9882353, 0, 1,
-0.8887506, 0.4774511, -1.787205, 1, 0.9960784, 0, 1,
-0.8841699, -0.8480981, -1.689029, 0.9960784, 1, 0, 1,
-0.8837992, -1.231744, -3.986793, 0.9921569, 1, 0, 1,
-0.8791696, 0.06038472, -0.6145885, 0.9843137, 1, 0, 1,
-0.8778414, -0.5114428, -2.503388, 0.9803922, 1, 0, 1,
-0.8755385, -0.4822657, 0.9030149, 0.972549, 1, 0, 1,
-0.8716537, 0.1189508, -0.6762144, 0.9686275, 1, 0, 1,
-0.8650197, -0.118776, 0.0996239, 0.9607843, 1, 0, 1,
-0.8593813, -0.365042, -1.500261, 0.9568627, 1, 0, 1,
-0.8524561, -0.1327847, -3.010293, 0.9490196, 1, 0, 1,
-0.8514147, -0.4325027, -1.589069, 0.945098, 1, 0, 1,
-0.8419551, 0.3386244, -1.417373, 0.9372549, 1, 0, 1,
-0.8413942, 0.5037391, -1.122501, 0.9333333, 1, 0, 1,
-0.8374014, 1.907486, -0.4763948, 0.9254902, 1, 0, 1,
-0.8321246, -0.8508599, -3.414171, 0.9215686, 1, 0, 1,
-0.8285804, -1.090396, -3.150844, 0.9137255, 1, 0, 1,
-0.8197291, -0.5209205, -0.8232674, 0.9098039, 1, 0, 1,
-0.8159903, 0.4052368, -2.664182, 0.9019608, 1, 0, 1,
-0.8157098, -1.984678, -2.565304, 0.8941177, 1, 0, 1,
-0.815242, 1.459551, -2.129024, 0.8901961, 1, 0, 1,
-0.8133209, -0.360572, -1.447631, 0.8823529, 1, 0, 1,
-0.8123361, -1.469285, -3.102671, 0.8784314, 1, 0, 1,
-0.8070177, -0.1131578, -1.939813, 0.8705882, 1, 0, 1,
-0.8058094, -0.5705626, -2.570524, 0.8666667, 1, 0, 1,
-0.8024808, 0.3056261, -1.159644, 0.8588235, 1, 0, 1,
-0.8019436, -0.4266204, -2.612839, 0.854902, 1, 0, 1,
-0.8003995, -0.2570778, -2.150337, 0.8470588, 1, 0, 1,
-0.7964908, -0.9929125, -1.469588, 0.8431373, 1, 0, 1,
-0.7960023, -0.1544453, -0.9786172, 0.8352941, 1, 0, 1,
-0.7900242, 0.2799036, -2.847342, 0.8313726, 1, 0, 1,
-0.7887387, 1.349222, -0.05201526, 0.8235294, 1, 0, 1,
-0.7846186, 3.427938, -0.4329548, 0.8196079, 1, 0, 1,
-0.7834314, -0.8274339, -1.476903, 0.8117647, 1, 0, 1,
-0.782275, -0.1374154, -1.709839, 0.8078431, 1, 0, 1,
-0.7764972, 0.4413515, -2.241683, 0.8, 1, 0, 1,
-0.7755682, 1.436326, -1.379154, 0.7921569, 1, 0, 1,
-0.7755343, 0.9376686, 1.156441, 0.7882353, 1, 0, 1,
-0.7743848, 0.1810682, -1.476559, 0.7803922, 1, 0, 1,
-0.7710036, -0.9142465, -2.970149, 0.7764706, 1, 0, 1,
-0.7705454, 0.4635954, -0.800149, 0.7686275, 1, 0, 1,
-0.7691984, -0.9501061, -1.822811, 0.7647059, 1, 0, 1,
-0.7684069, -1.674998, -2.438444, 0.7568628, 1, 0, 1,
-0.7671297, -0.1600999, -1.659945, 0.7529412, 1, 0, 1,
-0.7603797, 0.7375168, -0.08416606, 0.7450981, 1, 0, 1,
-0.7586277, 0.8226162, -0.4672021, 0.7411765, 1, 0, 1,
-0.7579642, 1.580623, -0.2966955, 0.7333333, 1, 0, 1,
-0.7553606, 0.5124186, -1.196568, 0.7294118, 1, 0, 1,
-0.747735, -1.123887, -2.490284, 0.7215686, 1, 0, 1,
-0.7425369, 2.010394, -2.010691, 0.7176471, 1, 0, 1,
-0.7356147, -0.5191424, -0.8933832, 0.7098039, 1, 0, 1,
-0.7283252, 1.980655, -1.204723, 0.7058824, 1, 0, 1,
-0.72808, 1.717345, -1.176919, 0.6980392, 1, 0, 1,
-0.7220479, 0.6229057, 0.2916894, 0.6901961, 1, 0, 1,
-0.7159846, 0.328447, -1.605676, 0.6862745, 1, 0, 1,
-0.7146647, 0.4727766, -0.8052135, 0.6784314, 1, 0, 1,
-0.7118674, 0.9168641, 0.0915494, 0.6745098, 1, 0, 1,
-0.7041314, -0.8344486, -2.838072, 0.6666667, 1, 0, 1,
-0.7011901, 0.604751, -0.289132, 0.6627451, 1, 0, 1,
-0.6981789, 0.6663051, -0.7413639, 0.654902, 1, 0, 1,
-0.6940182, 0.4435899, -2.359336, 0.6509804, 1, 0, 1,
-0.6877754, 0.3354826, -1.181591, 0.6431373, 1, 0, 1,
-0.6853713, -0.3262638, -2.414795, 0.6392157, 1, 0, 1,
-0.6784304, 0.3509489, -0.3351725, 0.6313726, 1, 0, 1,
-0.678237, 0.3239985, -0.5553018, 0.627451, 1, 0, 1,
-0.6738065, -1.144374, -1.708783, 0.6196079, 1, 0, 1,
-0.66896, 1.599928, -1.307177, 0.6156863, 1, 0, 1,
-0.6640844, -0.8987325, -3.884314, 0.6078432, 1, 0, 1,
-0.6612951, -0.4781402, -1.323376, 0.6039216, 1, 0, 1,
-0.6589683, 0.1823993, -1.076079, 0.5960785, 1, 0, 1,
-0.6588445, -0.4302243, -2.99397, 0.5882353, 1, 0, 1,
-0.6580511, -0.257333, -1.745372, 0.5843138, 1, 0, 1,
-0.6579375, -1.26037, -0.6401131, 0.5764706, 1, 0, 1,
-0.6572645, 0.1236299, 0.2240082, 0.572549, 1, 0, 1,
-0.6536227, 1.599645, -1.030687, 0.5647059, 1, 0, 1,
-0.6417006, 0.9502041, -1.216218, 0.5607843, 1, 0, 1,
-0.6412651, 0.1051918, -0.992874, 0.5529412, 1, 0, 1,
-0.6374547, -0.7201145, -1.193355, 0.5490196, 1, 0, 1,
-0.6364186, -0.2265218, -1.598126, 0.5411765, 1, 0, 1,
-0.6332701, -0.7286055, -2.846694, 0.5372549, 1, 0, 1,
-0.6314091, -0.4179237, -1.74089, 0.5294118, 1, 0, 1,
-0.6313831, 0.06546935, 0.1281567, 0.5254902, 1, 0, 1,
-0.6311042, -1.642766, -1.961402, 0.5176471, 1, 0, 1,
-0.6239883, 0.3754424, -0.9014889, 0.5137255, 1, 0, 1,
-0.623324, -1.016412, -2.953285, 0.5058824, 1, 0, 1,
-0.6195401, 1.311312, 0.4609629, 0.5019608, 1, 0, 1,
-0.6182876, 1.078579, 1.336597, 0.4941176, 1, 0, 1,
-0.6132464, -1.23912, -3.081046, 0.4862745, 1, 0, 1,
-0.612789, 0.6698888, -1.80268, 0.4823529, 1, 0, 1,
-0.6121367, 0.08166511, -2.446697, 0.4745098, 1, 0, 1,
-0.611277, 0.1467725, -0.1192348, 0.4705882, 1, 0, 1,
-0.6059291, -0.3460927, -2.715314, 0.4627451, 1, 0, 1,
-0.5988902, 0.5384114, -1.18927, 0.4588235, 1, 0, 1,
-0.5956036, 0.9726527, -1.0064, 0.4509804, 1, 0, 1,
-0.5928559, -2.755972, -3.144622, 0.4470588, 1, 0, 1,
-0.5924499, 1.267775, -1.195962, 0.4392157, 1, 0, 1,
-0.591232, -1.036882, 0.5383031, 0.4352941, 1, 0, 1,
-0.5889063, 1.536747, 0.9765399, 0.427451, 1, 0, 1,
-0.5841933, -0.658175, -1.702392, 0.4235294, 1, 0, 1,
-0.5841425, 1.273833, -0.9982142, 0.4156863, 1, 0, 1,
-0.5824945, 0.3156429, -0.7464448, 0.4117647, 1, 0, 1,
-0.5813722, -0.438956, -0.3573996, 0.4039216, 1, 0, 1,
-0.5794614, -0.2607227, -1.868238, 0.3960784, 1, 0, 1,
-0.5769435, -1.145368, -3.120439, 0.3921569, 1, 0, 1,
-0.569227, 0.5543433, -0.7235242, 0.3843137, 1, 0, 1,
-0.5662119, 0.1803107, -0.9167337, 0.3803922, 1, 0, 1,
-0.562394, -0.8141412, -1.482952, 0.372549, 1, 0, 1,
-0.5532921, 0.3522162, -1.603447, 0.3686275, 1, 0, 1,
-0.5517619, 1.074543, -0.2967287, 0.3607843, 1, 0, 1,
-0.5498761, 0.6690088, 0.2672938, 0.3568628, 1, 0, 1,
-0.5493195, 0.5709493, 0.3357387, 0.3490196, 1, 0, 1,
-0.5408348, 0.6187724, 0.6142851, 0.345098, 1, 0, 1,
-0.5367187, 0.441718, -0.8676261, 0.3372549, 1, 0, 1,
-0.5335854, -1.740301, -4.672051, 0.3333333, 1, 0, 1,
-0.5320328, -1.372879, -1.663692, 0.3254902, 1, 0, 1,
-0.5313581, 0.9841288, 0.9530798, 0.3215686, 1, 0, 1,
-0.5241504, 1.415941, 1.464434, 0.3137255, 1, 0, 1,
-0.5213916, -0.6695789, -1.624196, 0.3098039, 1, 0, 1,
-0.5198902, 1.411629, -3.441302, 0.3019608, 1, 0, 1,
-0.5197804, 0.7659682, -1.129386, 0.2941177, 1, 0, 1,
-0.5184784, -0.887623, -3.777884, 0.2901961, 1, 0, 1,
-0.5154785, 0.2675562, -0.5943884, 0.282353, 1, 0, 1,
-0.51493, -0.5794505, -1.969252, 0.2784314, 1, 0, 1,
-0.5083251, -0.125877, -3.775522, 0.2705882, 1, 0, 1,
-0.5061285, -1.342646, -4.036403, 0.2666667, 1, 0, 1,
-0.5039306, -0.6563068, -1.239152, 0.2588235, 1, 0, 1,
-0.502383, 0.9518905, -0.9714769, 0.254902, 1, 0, 1,
-0.5018089, 0.3853253, -2.253781, 0.2470588, 1, 0, 1,
-0.5012464, 1.142026, -1.718167, 0.2431373, 1, 0, 1,
-0.4971001, -0.5570225, -2.906101, 0.2352941, 1, 0, 1,
-0.4907658, -0.2755533, -1.418672, 0.2313726, 1, 0, 1,
-0.4852475, -0.9973708, -1.312629, 0.2235294, 1, 0, 1,
-0.485083, 1.014192, -1.23856, 0.2196078, 1, 0, 1,
-0.4850306, -0.8820092, -2.461949, 0.2117647, 1, 0, 1,
-0.4840766, -0.6671154, -1.452978, 0.2078431, 1, 0, 1,
-0.481384, -1.454792, -3.581157, 0.2, 1, 0, 1,
-0.4805847, -1.11213, -5.052993, 0.1921569, 1, 0, 1,
-0.4796629, -0.5560138, -1.47048, 0.1882353, 1, 0, 1,
-0.4789563, -0.6154283, -2.594936, 0.1803922, 1, 0, 1,
-0.4786851, -0.2731855, -2.540988, 0.1764706, 1, 0, 1,
-0.4761535, -1.237508, -1.838361, 0.1686275, 1, 0, 1,
-0.4733924, 1.637574, -0.6234183, 0.1647059, 1, 0, 1,
-0.47066, 1.338782, 1.579267, 0.1568628, 1, 0, 1,
-0.4695422, 0.3792888, -1.904912, 0.1529412, 1, 0, 1,
-0.4642668, 1.156843, 1.145579, 0.145098, 1, 0, 1,
-0.4641508, -1.76492, -2.945425, 0.1411765, 1, 0, 1,
-0.4622679, 0.6741768, -0.2036512, 0.1333333, 1, 0, 1,
-0.4607748, 0.6630468, -1.898189, 0.1294118, 1, 0, 1,
-0.451376, -1.028131, -0.9706154, 0.1215686, 1, 0, 1,
-0.4509257, 0.3763803, 0.219018, 0.1176471, 1, 0, 1,
-0.4477795, 0.6181199, -0.2889045, 0.1098039, 1, 0, 1,
-0.4455202, -0.8048922, -1.8676, 0.1058824, 1, 0, 1,
-0.437192, -0.03017467, -2.201213, 0.09803922, 1, 0, 1,
-0.4288034, 1.626912, 0.1817638, 0.09019608, 1, 0, 1,
-0.4261362, -2.076108, -2.254843, 0.08627451, 1, 0, 1,
-0.423006, -1.596506, -1.881471, 0.07843138, 1, 0, 1,
-0.4202868, -0.5674751, -2.899203, 0.07450981, 1, 0, 1,
-0.4197468, 0.5283448, -0.2642953, 0.06666667, 1, 0, 1,
-0.412184, 1.491123, 0.5164663, 0.0627451, 1, 0, 1,
-0.404645, 0.6413705, -1.003215, 0.05490196, 1, 0, 1,
-0.404025, -0.8810544, -2.055944, 0.05098039, 1, 0, 1,
-0.3988534, -0.6888135, -0.5863035, 0.04313726, 1, 0, 1,
-0.3978803, -0.4338958, -0.2292477, 0.03921569, 1, 0, 1,
-0.3952241, -0.7810683, -3.181842, 0.03137255, 1, 0, 1,
-0.3902006, -1.130898, -3.622192, 0.02745098, 1, 0, 1,
-0.3896605, -0.5092205, -3.098418, 0.01960784, 1, 0, 1,
-0.3837669, 1.843526, 0.9134002, 0.01568628, 1, 0, 1,
-0.3834245, 0.7946214, 1.243325, 0.007843138, 1, 0, 1,
-0.3820563, -1.993699, -3.743205, 0.003921569, 1, 0, 1,
-0.3804261, 0.1252894, -0.7161961, 0, 1, 0.003921569, 1,
-0.3796841, 1.227302, -0.2851928, 0, 1, 0.01176471, 1,
-0.379194, 1.471126, 0.3343297, 0, 1, 0.01568628, 1,
-0.3784699, 0.2911812, 0.07584415, 0, 1, 0.02352941, 1,
-0.3768961, 1.616174, 0.6588776, 0, 1, 0.02745098, 1,
-0.3727485, -0.5884686, -2.684681, 0, 1, 0.03529412, 1,
-0.3726493, -0.6710393, -2.027583, 0, 1, 0.03921569, 1,
-0.3718591, -0.270821, -1.916622, 0, 1, 0.04705882, 1,
-0.3697882, -1.357269, -3.663293, 0, 1, 0.05098039, 1,
-0.3649001, -1.07929, -3.418004, 0, 1, 0.05882353, 1,
-0.3606085, -2.9277, -2.548273, 0, 1, 0.0627451, 1,
-0.3565024, 2.349719, -1.764065, 0, 1, 0.07058824, 1,
-0.356412, 0.7929188, -0.654231, 0, 1, 0.07450981, 1,
-0.3546714, -0.5402699, -1.847587, 0, 1, 0.08235294, 1,
-0.3530914, -0.8100042, -3.420561, 0, 1, 0.08627451, 1,
-0.3529899, 0.4987942, -2.75161, 0, 1, 0.09411765, 1,
-0.3522147, 1.05015, -0.8790693, 0, 1, 0.1019608, 1,
-0.3493631, -0.8613124, -4.67401, 0, 1, 0.1058824, 1,
-0.3460377, -0.7199615, -2.403176, 0, 1, 0.1137255, 1,
-0.3456946, 0.3878435, -1.403848, 0, 1, 0.1176471, 1,
-0.3419414, -1.546943, -2.278458, 0, 1, 0.1254902, 1,
-0.3381726, -0.8628953, -4.165037, 0, 1, 0.1294118, 1,
-0.3307212, -0.5333441, -3.293489, 0, 1, 0.1372549, 1,
-0.3293838, 1.617716, 0.01178147, 0, 1, 0.1411765, 1,
-0.3256213, -0.6219516, -3.38361, 0, 1, 0.1490196, 1,
-0.3114563, -1.853273, -3.057035, 0, 1, 0.1529412, 1,
-0.3100253, -1.425632, -3.648013, 0, 1, 0.1607843, 1,
-0.3086186, -0.2307368, -1.507181, 0, 1, 0.1647059, 1,
-0.3076013, -0.3986033, -2.728639, 0, 1, 0.172549, 1,
-0.3048535, -1.49954, -2.792705, 0, 1, 0.1764706, 1,
-0.3033513, -0.9940987, -2.666008, 0, 1, 0.1843137, 1,
-0.3026388, -2.482693, -3.870821, 0, 1, 0.1882353, 1,
-0.3007963, -1.013399, -2.999516, 0, 1, 0.1960784, 1,
-0.2983477, -0.05303528, -2.288457, 0, 1, 0.2039216, 1,
-0.2968336, 1.246835, 0.02565975, 0, 1, 0.2078431, 1,
-0.2950952, 0.4188525, 1.112452, 0, 1, 0.2156863, 1,
-0.2937588, 0.901188, -0.7442729, 0, 1, 0.2196078, 1,
-0.2906635, 1.702715, -0.430723, 0, 1, 0.227451, 1,
-0.2885753, 0.2206849, 0.1604356, 0, 1, 0.2313726, 1,
-0.2688602, 0.9042878, 0.3574118, 0, 1, 0.2392157, 1,
-0.2685341, 3.04929, -1.047037, 0, 1, 0.2431373, 1,
-0.2674377, -0.1996054, -4.052445, 0, 1, 0.2509804, 1,
-0.2611197, 1.844053, -1.547117, 0, 1, 0.254902, 1,
-0.2580734, 0.4778605, -0.2019419, 0, 1, 0.2627451, 1,
-0.2566356, 1.324434, 0.6362489, 0, 1, 0.2666667, 1,
-0.2494008, 1.010463, -0.9831941, 0, 1, 0.2745098, 1,
-0.2469011, -2.312968, -2.312668, 0, 1, 0.2784314, 1,
-0.2437662, -0.6867017, -3.791666, 0, 1, 0.2862745, 1,
-0.2427829, 2.071557, -1.458723, 0, 1, 0.2901961, 1,
-0.2416509, -0.4236006, -0.8200707, 0, 1, 0.2980392, 1,
-0.2384641, 0.866853, -1.716843, 0, 1, 0.3058824, 1,
-0.2360106, 0.2338068, -1.8413, 0, 1, 0.3098039, 1,
-0.2331374, 0.9773685, -1.794634, 0, 1, 0.3176471, 1,
-0.2308752, 0.4894107, -0.4610883, 0, 1, 0.3215686, 1,
-0.2301048, 1.21374, -0.4886588, 0, 1, 0.3294118, 1,
-0.2290207, 0.9231099, -0.1065685, 0, 1, 0.3333333, 1,
-0.2278443, 1.122265, -0.6059351, 0, 1, 0.3411765, 1,
-0.2276983, -1.151604, -2.300958, 0, 1, 0.345098, 1,
-0.2273295, 0.1242407, -0.7672091, 0, 1, 0.3529412, 1,
-0.2138732, -1.106202, -1.881118, 0, 1, 0.3568628, 1,
-0.213416, -0.8697761, -4.66272, 0, 1, 0.3647059, 1,
-0.2123481, 2.612234, 0.1795089, 0, 1, 0.3686275, 1,
-0.2104214, 0.05910785, -1.901358, 0, 1, 0.3764706, 1,
-0.2076067, -0.3926504, -2.182085, 0, 1, 0.3803922, 1,
-0.20729, -0.4403879, -0.3174138, 0, 1, 0.3882353, 1,
-0.2072024, -1.011399, -2.042511, 0, 1, 0.3921569, 1,
-0.2071585, 0.4174154, 0.4754875, 0, 1, 0.4, 1,
-0.2049778, 0.4538055, -0.005304422, 0, 1, 0.4078431, 1,
-0.2032626, 1.256707, 1.503147, 0, 1, 0.4117647, 1,
-0.1951047, 0.02822884, -1.608896, 0, 1, 0.4196078, 1,
-0.1949553, -2.208514, -2.605645, 0, 1, 0.4235294, 1,
-0.1932621, -0.05676086, -0.2113834, 0, 1, 0.4313726, 1,
-0.188739, -1.183052, -4.426654, 0, 1, 0.4352941, 1,
-0.1870741, -0.2800606, -4.106421, 0, 1, 0.4431373, 1,
-0.1868203, 1.594258, -0.816204, 0, 1, 0.4470588, 1,
-0.1854054, -0.2249913, -2.218106, 0, 1, 0.454902, 1,
-0.1814238, -1.239519, -1.817992, 0, 1, 0.4588235, 1,
-0.1800331, -2.028943, -3.340948, 0, 1, 0.4666667, 1,
-0.1799842, -0.0003122026, -1.52796, 0, 1, 0.4705882, 1,
-0.1785025, -0.4395244, -2.241211, 0, 1, 0.4784314, 1,
-0.1777166, 1.13855, -0.8450087, 0, 1, 0.4823529, 1,
-0.1767893, 0.9653032, -0.3344478, 0, 1, 0.4901961, 1,
-0.1764845, -1.84824, -2.695027, 0, 1, 0.4941176, 1,
-0.1750445, -0.8520174, -2.835841, 0, 1, 0.5019608, 1,
-0.1744138, 0.6736472, -1.133313, 0, 1, 0.509804, 1,
-0.1735518, -1.257356, -3.367756, 0, 1, 0.5137255, 1,
-0.1720831, -0.3694167, -1.011169, 0, 1, 0.5215687, 1,
-0.1717606, -0.9474723, -2.641439, 0, 1, 0.5254902, 1,
-0.1695769, -0.01671612, -2.17236, 0, 1, 0.5333334, 1,
-0.1671048, 2.210269, -0.3314447, 0, 1, 0.5372549, 1,
-0.1669401, -0.03757754, -1.845926, 0, 1, 0.5450981, 1,
-0.1666346, -1.101129, -3.166774, 0, 1, 0.5490196, 1,
-0.1637885, -0.899433, -4.510237, 0, 1, 0.5568628, 1,
-0.1621336, -0.691689, -2.400814, 0, 1, 0.5607843, 1,
-0.1619315, -0.5763455, -2.373145, 0, 1, 0.5686275, 1,
-0.1611862, 1.302448, 0.3832014, 0, 1, 0.572549, 1,
-0.1571872, 0.2619132, 0.8461221, 0, 1, 0.5803922, 1,
-0.1556111, 0.07177999, -0.5716506, 0, 1, 0.5843138, 1,
-0.1496235, 0.2347597, -2.190272, 0, 1, 0.5921569, 1,
-0.1493434, -0.815605, -2.165314, 0, 1, 0.5960785, 1,
-0.1480554, -1.423513, -3.40965, 0, 1, 0.6039216, 1,
-0.1442813, -0.6509723, -2.66045, 0, 1, 0.6117647, 1,
-0.1414043, -1.17129, -3.580001, 0, 1, 0.6156863, 1,
-0.1342604, 0.135171, -1.40913, 0, 1, 0.6235294, 1,
-0.1329275, 1.026552, 1.188688, 0, 1, 0.627451, 1,
-0.1315629, 1.503944, 0.1784023, 0, 1, 0.6352941, 1,
-0.1310581, -0.7085168, -3.49653, 0, 1, 0.6392157, 1,
-0.123329, 0.9621942, -2.54761, 0, 1, 0.6470588, 1,
-0.1202453, -0.9325225, -1.21825, 0, 1, 0.6509804, 1,
-0.1196831, -0.444123, -3.715324, 0, 1, 0.6588235, 1,
-0.1187141, 0.4898077, 0.004999479, 0, 1, 0.6627451, 1,
-0.1170712, 0.4309008, 0.2051857, 0, 1, 0.6705883, 1,
-0.1170036, 0.1800338, -0.520708, 0, 1, 0.6745098, 1,
-0.1104958, 0.6027041, -1.813511, 0, 1, 0.682353, 1,
-0.1089051, -0.1106257, -1.691706, 0, 1, 0.6862745, 1,
-0.1082394, 0.1658998, -1.137952, 0, 1, 0.6941177, 1,
-0.1073294, 1.289684, 0.09709385, 0, 1, 0.7019608, 1,
-0.1030749, -1.094594, -3.528187, 0, 1, 0.7058824, 1,
-0.09940587, 0.3306821, -0.1142565, 0, 1, 0.7137255, 1,
-0.09769659, -0.3199886, -3.202906, 0, 1, 0.7176471, 1,
-0.09461922, -1.07418, -2.592711, 0, 1, 0.7254902, 1,
-0.09291667, -0.2137632, -2.97541, 0, 1, 0.7294118, 1,
-0.09255055, -0.6567571, -2.262982, 0, 1, 0.7372549, 1,
-0.09134018, 1.806805, -0.8215283, 0, 1, 0.7411765, 1,
-0.09003008, 0.7015269, -0.6605945, 0, 1, 0.7490196, 1,
-0.08966555, 1.431663, -0.9051962, 0, 1, 0.7529412, 1,
-0.08434816, -0.9277454, -4.866692, 0, 1, 0.7607843, 1,
-0.0837064, -0.2224543, -3.772007, 0, 1, 0.7647059, 1,
-0.08365713, 0.4602768, -0.5945115, 0, 1, 0.772549, 1,
-0.07541351, 1.28176, -0.2036156, 0, 1, 0.7764706, 1,
-0.07482279, 2.180634, -0.47591, 0, 1, 0.7843137, 1,
-0.07293799, -0.6555508, -2.425812, 0, 1, 0.7882353, 1,
-0.06975163, -0.3158873, -2.836453, 0, 1, 0.7960784, 1,
-0.06280252, -1.064249, -3.001865, 0, 1, 0.8039216, 1,
-0.05952721, 1.27311, 1.431393, 0, 1, 0.8078431, 1,
-0.05863721, -1.779138, -5.638818, 0, 1, 0.8156863, 1,
-0.05429306, -0.0183646, -0.3919683, 0, 1, 0.8196079, 1,
-0.05303944, -0.4151489, -2.594937, 0, 1, 0.827451, 1,
-0.05111759, 0.06047564, -1.937794, 0, 1, 0.8313726, 1,
-0.05014625, -0.171368, -2.599006, 0, 1, 0.8392157, 1,
-0.04306265, -1.325897, -3.100214, 0, 1, 0.8431373, 1,
-0.04229899, -0.2867782, -3.642542, 0, 1, 0.8509804, 1,
-0.04049042, -0.5848365, -4.105184, 0, 1, 0.854902, 1,
-0.03746627, 1.491194, -1.280419, 0, 1, 0.8627451, 1,
-0.03347648, -0.2987921, -2.890005, 0, 1, 0.8666667, 1,
-0.03305899, 1.018501, 0.09696567, 0, 1, 0.8745098, 1,
-0.02962393, 1.195117, 0.4248559, 0, 1, 0.8784314, 1,
-0.02761398, 2.070719, 0.06227067, 0, 1, 0.8862745, 1,
-0.02705436, -1.736347, -1.137655, 0, 1, 0.8901961, 1,
-0.02666574, -1.210192, -3.679964, 0, 1, 0.8980392, 1,
-0.01886502, 0.2341146, -0.5044472, 0, 1, 0.9058824, 1,
-0.0179748, -1.53249, -5.74611, 0, 1, 0.9098039, 1,
-0.01662025, 2.059322, 0.1773407, 0, 1, 0.9176471, 1,
-0.01405266, -1.331418, -2.145848, 0, 1, 0.9215686, 1,
-0.01247157, -1.966316, -3.208363, 0, 1, 0.9294118, 1,
-0.01234277, 0.5560532, 0.3837779, 0, 1, 0.9333333, 1,
-0.01161918, 0.2278867, 0.1641639, 0, 1, 0.9411765, 1,
-0.01078941, 0.4635171, 0.2775747, 0, 1, 0.945098, 1,
-0.01068152, 0.4341692, 1.142812, 0, 1, 0.9529412, 1,
-0.009747414, -1.46264, -4.026903, 0, 1, 0.9568627, 1,
-0.006064907, -1.22709, -3.813518, 0, 1, 0.9647059, 1,
-0.00406124, 0.6157015, 0.8047086, 0, 1, 0.9686275, 1,
-0.002341333, 0.1799069, -1.093426, 0, 1, 0.9764706, 1,
-0.0007684531, 0.4165298, 1.19478, 0, 1, 0.9803922, 1,
0.001663942, -0.1926438, 2.372303, 0, 1, 0.9882353, 1,
0.00267026, -1.011924, 1.000622, 0, 1, 0.9921569, 1,
0.01716622, 0.3319107, -0.3176133, 0, 1, 1, 1,
0.01871752, -2.477249, 4.73027, 0, 0.9921569, 1, 1,
0.0203683, 1.578276, 0.3202465, 0, 0.9882353, 1, 1,
0.02145489, -0.2739758, 3.178688, 0, 0.9803922, 1, 1,
0.02177666, -1.979119, 1.004294, 0, 0.9764706, 1, 1,
0.02325891, 0.7100502, -0.2966029, 0, 0.9686275, 1, 1,
0.02726834, -0.04546235, 1.773911, 0, 0.9647059, 1, 1,
0.02830409, 0.2194405, -1.010703, 0, 0.9568627, 1, 1,
0.02992393, -0.2147289, 1.983276, 0, 0.9529412, 1, 1,
0.03009779, 0.3460946, -0.8681855, 0, 0.945098, 1, 1,
0.03027586, 0.5205672, 0.4464821, 0, 0.9411765, 1, 1,
0.03204249, 0.1414444, 0.5431269, 0, 0.9333333, 1, 1,
0.03463408, 0.7888455, -0.5714659, 0, 0.9294118, 1, 1,
0.03607219, 1.294397, -0.3135899, 0, 0.9215686, 1, 1,
0.03723692, 1.191815, -0.7563846, 0, 0.9176471, 1, 1,
0.0375453, 1.888091, -0.07275264, 0, 0.9098039, 1, 1,
0.04034384, -1.075171, 2.914873, 0, 0.9058824, 1, 1,
0.04279433, -0.8592706, 3.330472, 0, 0.8980392, 1, 1,
0.04319311, -1.229549, 1.772984, 0, 0.8901961, 1, 1,
0.04937949, 0.7026363, 1.104062, 0, 0.8862745, 1, 1,
0.05126437, -0.4794392, 3.325317, 0, 0.8784314, 1, 1,
0.05252307, -1.778968, 1.754194, 0, 0.8745098, 1, 1,
0.05335276, -0.298411, 4.55252, 0, 0.8666667, 1, 1,
0.05351767, 0.6093935, 0.7176827, 0, 0.8627451, 1, 1,
0.05407192, -1.115029, 2.282431, 0, 0.854902, 1, 1,
0.05632537, 2.804969, 1.792948, 0, 0.8509804, 1, 1,
0.05676935, -1.310843, 1.513787, 0, 0.8431373, 1, 1,
0.05709575, 0.002443357, 3.643612, 0, 0.8392157, 1, 1,
0.05717644, 1.173883, 0.03855953, 0, 0.8313726, 1, 1,
0.05937044, 2.980543, 0.1519571, 0, 0.827451, 1, 1,
0.06020463, 0.02637193, 1.63949, 0, 0.8196079, 1, 1,
0.0620543, -1.373805, 2.409028, 0, 0.8156863, 1, 1,
0.06315956, 0.05503348, -0.307497, 0, 0.8078431, 1, 1,
0.06539404, 0.7532912, -0.06947863, 0, 0.8039216, 1, 1,
0.06856279, 0.4262852, 0.08375558, 0, 0.7960784, 1, 1,
0.06874278, 0.4775828, 1.166678, 0, 0.7882353, 1, 1,
0.07226404, 0.2698303, -1.251653, 0, 0.7843137, 1, 1,
0.072616, -1.331207, 2.888682, 0, 0.7764706, 1, 1,
0.07805029, -0.9315043, 2.294846, 0, 0.772549, 1, 1,
0.08024842, -0.6180915, 3.009422, 0, 0.7647059, 1, 1,
0.08189524, -0.05361658, 2.80804, 0, 0.7607843, 1, 1,
0.08237448, 1.474177, -0.6552473, 0, 0.7529412, 1, 1,
0.08957215, 0.7072807, 1.21916, 0, 0.7490196, 1, 1,
0.09166805, 2.673813, 0.8753193, 0, 0.7411765, 1, 1,
0.09202029, -0.08211132, 2.860673, 0, 0.7372549, 1, 1,
0.09314763, 0.185668, 2.106711, 0, 0.7294118, 1, 1,
0.09405812, -0.08397288, 2.808117, 0, 0.7254902, 1, 1,
0.0948149, -0.9335255, 2.038569, 0, 0.7176471, 1, 1,
0.09833205, -1.024464, 4.384577, 0, 0.7137255, 1, 1,
0.09878893, -0.08498283, 0.5285017, 0, 0.7058824, 1, 1,
0.1081741, -0.4425155, 2.380604, 0, 0.6980392, 1, 1,
0.114752, 0.8236523, -0.4912225, 0, 0.6941177, 1, 1,
0.1154412, -0.3909597, 2.638807, 0, 0.6862745, 1, 1,
0.1220467, 0.1246324, 1.827913, 0, 0.682353, 1, 1,
0.1235469, -0.05444594, -0.03268604, 0, 0.6745098, 1, 1,
0.1278715, 0.9002962, 0.6882443, 0, 0.6705883, 1, 1,
0.1295716, -1.094025, 2.604736, 0, 0.6627451, 1, 1,
0.13032, -0.8348431, 1.420303, 0, 0.6588235, 1, 1,
0.1305947, -1.409965, 3.532087, 0, 0.6509804, 1, 1,
0.134017, -1.000201, 2.208301, 0, 0.6470588, 1, 1,
0.1346531, -0.6746784, 3.806437, 0, 0.6392157, 1, 1,
0.1356117, 1.665585, 0.09796001, 0, 0.6352941, 1, 1,
0.1356609, 1.412984, 0.6292352, 0, 0.627451, 1, 1,
0.1388159, 0.2803097, -1.261703, 0, 0.6235294, 1, 1,
0.1474829, -0.7829078, 3.867483, 0, 0.6156863, 1, 1,
0.1509081, 1.636332, 0.5620173, 0, 0.6117647, 1, 1,
0.1551422, -0.7340659, 4.610411, 0, 0.6039216, 1, 1,
0.1570523, -0.2380291, 3.731898, 0, 0.5960785, 1, 1,
0.1585367, -0.2544427, 0.889935, 0, 0.5921569, 1, 1,
0.1617142, 0.1706053, 0.5886158, 0, 0.5843138, 1, 1,
0.1644024, -0.3400556, 3.708119, 0, 0.5803922, 1, 1,
0.1680886, -0.4480557, 2.010204, 0, 0.572549, 1, 1,
0.1708352, -0.556085, 2.149001, 0, 0.5686275, 1, 1,
0.1715709, 0.2269904, 0.09828774, 0, 0.5607843, 1, 1,
0.1790727, -1.514741, 2.272078, 0, 0.5568628, 1, 1,
0.183706, -2.022382, 2.075468, 0, 0.5490196, 1, 1,
0.1837907, 0.1723286, 1.132197, 0, 0.5450981, 1, 1,
0.1881241, 0.6911853, 0.1112341, 0, 0.5372549, 1, 1,
0.1895344, -0.610086, 3.62695, 0, 0.5333334, 1, 1,
0.1913271, -0.2935107, 4.810546, 0, 0.5254902, 1, 1,
0.1933493, 0.5543624, -0.9895051, 0, 0.5215687, 1, 1,
0.1939031, -0.2408743, 4.444698, 0, 0.5137255, 1, 1,
0.1944144, 0.7220616, 0.1763976, 0, 0.509804, 1, 1,
0.1966101, 0.1926545, 0.2915681, 0, 0.5019608, 1, 1,
0.2016261, -1.583912, 1.392645, 0, 0.4941176, 1, 1,
0.2025734, 0.6249869, 0.7322874, 0, 0.4901961, 1, 1,
0.2035718, -0.3115498, 3.216001, 0, 0.4823529, 1, 1,
0.2056652, 0.6596594, -0.1025385, 0, 0.4784314, 1, 1,
0.2153096, -0.185653, 3.852634, 0, 0.4705882, 1, 1,
0.2173571, 1.756775, -0.2415386, 0, 0.4666667, 1, 1,
0.2200969, -0.5091093, 3.9063, 0, 0.4588235, 1, 1,
0.220331, -0.3817241, 2.019931, 0, 0.454902, 1, 1,
0.2206523, 0.6309087, -0.7736741, 0, 0.4470588, 1, 1,
0.2226319, -1.82991, 1.707999, 0, 0.4431373, 1, 1,
0.2258942, 0.4142235, 0.8017291, 0, 0.4352941, 1, 1,
0.2339003, 0.8277504, -0.09516785, 0, 0.4313726, 1, 1,
0.2367475, 1.406834, -0.3253677, 0, 0.4235294, 1, 1,
0.2405913, 1.837965, 0.645947, 0, 0.4196078, 1, 1,
0.2425361, 1.028688, -0.849433, 0, 0.4117647, 1, 1,
0.2437183, -0.1596299, 1.398144, 0, 0.4078431, 1, 1,
0.2465038, 0.6609733, -0.1820151, 0, 0.4, 1, 1,
0.2476443, 1.756443, -0.9409754, 0, 0.3921569, 1, 1,
0.2481582, 0.4151891, -0.08211759, 0, 0.3882353, 1, 1,
0.2500735, -1.309225, 0.7682855, 0, 0.3803922, 1, 1,
0.2502424, -0.3493916, 2.185225, 0, 0.3764706, 1, 1,
0.2527587, -1.633239, 3.30874, 0, 0.3686275, 1, 1,
0.253613, -1.000059, 4.252943, 0, 0.3647059, 1, 1,
0.2547426, -0.0898808, 2.656067, 0, 0.3568628, 1, 1,
0.2576411, 0.3448248, 3.303211, 0, 0.3529412, 1, 1,
0.2581576, 1.056171, -0.4057558, 0, 0.345098, 1, 1,
0.2584935, -0.5204886, 2.496351, 0, 0.3411765, 1, 1,
0.2642286, 0.112404, 1.634659, 0, 0.3333333, 1, 1,
0.2673948, -1.191296, 4.595404, 0, 0.3294118, 1, 1,
0.2699042, -0.04537032, 1.50892, 0, 0.3215686, 1, 1,
0.2703032, -1.974266, 2.589384, 0, 0.3176471, 1, 1,
0.2776926, -0.5542351, 2.793884, 0, 0.3098039, 1, 1,
0.2800689, 0.6070087, -0.4577632, 0, 0.3058824, 1, 1,
0.2812363, -1.002291, 2.744584, 0, 0.2980392, 1, 1,
0.283262, 0.4339156, -0.3815274, 0, 0.2901961, 1, 1,
0.2847467, -0.3470101, 1.940712, 0, 0.2862745, 1, 1,
0.287001, -0.4668571, 3.488719, 0, 0.2784314, 1, 1,
0.2967678, 0.5609719, -0.8107205, 0, 0.2745098, 1, 1,
0.2985671, -0.4101575, 3.303191, 0, 0.2666667, 1, 1,
0.2990165, -2.171618, 3.39118, 0, 0.2627451, 1, 1,
0.2996247, 0.8615281, 0.06374099, 0, 0.254902, 1, 1,
0.3015909, 0.3420338, 0.6968898, 0, 0.2509804, 1, 1,
0.3018907, 1.373539, 0.2118497, 0, 0.2431373, 1, 1,
0.3070135, 1.644053, -0.5307768, 0, 0.2392157, 1, 1,
0.3085555, 1.139006, 0.2695735, 0, 0.2313726, 1, 1,
0.3104268, -1.605828, 2.256503, 0, 0.227451, 1, 1,
0.3116804, 0.4259252, 1.87383, 0, 0.2196078, 1, 1,
0.3123466, -3.030703, 0.6558546, 0, 0.2156863, 1, 1,
0.3132356, -2.51378, 0.9694973, 0, 0.2078431, 1, 1,
0.3176578, 0.5832501, 0.7799916, 0, 0.2039216, 1, 1,
0.3181277, 0.5638142, 1.284329, 0, 0.1960784, 1, 1,
0.3247393, 0.4199898, 1.508964, 0, 0.1882353, 1, 1,
0.3259824, -1.294895, 3.505917, 0, 0.1843137, 1, 1,
0.3293271, -0.4258654, 2.967685, 0, 0.1764706, 1, 1,
0.3361192, -0.3508876, 2.432101, 0, 0.172549, 1, 1,
0.3372685, -0.9991776, 3.707921, 0, 0.1647059, 1, 1,
0.3423851, -0.1197924, 1.937481, 0, 0.1607843, 1, 1,
0.3457538, -0.4093331, 3.598582, 0, 0.1529412, 1, 1,
0.3490514, 0.6660668, 1.94978, 0, 0.1490196, 1, 1,
0.3495383, 0.1799947, 1.972468, 0, 0.1411765, 1, 1,
0.357802, -0.01248805, 1.618886, 0, 0.1372549, 1, 1,
0.358771, -0.2354112, 3.262064, 0, 0.1294118, 1, 1,
0.3591965, -0.6256093, 3.212595, 0, 0.1254902, 1, 1,
0.3600951, 0.2852412, 0.1072616, 0, 0.1176471, 1, 1,
0.3608082, 1.048217, -1.157607, 0, 0.1137255, 1, 1,
0.3628047, 1.040378, 1.532649, 0, 0.1058824, 1, 1,
0.3629585, 0.5441881, -0.8260375, 0, 0.09803922, 1, 1,
0.369265, -2.086896, 4.245862, 0, 0.09411765, 1, 1,
0.373638, -0.8831963, 2.158515, 0, 0.08627451, 1, 1,
0.3738889, -0.04540631, 1.244466, 0, 0.08235294, 1, 1,
0.3751808, -0.2562786, 3.044886, 0, 0.07450981, 1, 1,
0.3756373, 0.9201968, -0.1917628, 0, 0.07058824, 1, 1,
0.3774064, -0.6423054, 0.712854, 0, 0.0627451, 1, 1,
0.3867402, 1.167846, 1.649536, 0, 0.05882353, 1, 1,
0.3922504, -2.283287, 2.84742, 0, 0.05098039, 1, 1,
0.3947845, 1.108288, 0.2701023, 0, 0.04705882, 1, 1,
0.3962454, 0.2644231, 1.393602, 0, 0.03921569, 1, 1,
0.3975025, 0.07950721, 2.356468, 0, 0.03529412, 1, 1,
0.3986237, -2.651794, 3.34884, 0, 0.02745098, 1, 1,
0.4014528, -1.230614, 3.281296, 0, 0.02352941, 1, 1,
0.4075326, 0.01839631, 1.625333, 0, 0.01568628, 1, 1,
0.4095589, 0.6036598, -0.7654909, 0, 0.01176471, 1, 1,
0.4101466, -0.305786, 2.300174, 0, 0.003921569, 1, 1,
0.4110286, -2.147603, 3.012343, 0.003921569, 0, 1, 1,
0.4120409, -0.3618157, 3.104237, 0.007843138, 0, 1, 1,
0.4228302, 0.3624939, 1.479508, 0.01568628, 0, 1, 1,
0.4248012, -0.3456863, 1.968343, 0.01960784, 0, 1, 1,
0.431143, -0.5469124, 4.005628, 0.02745098, 0, 1, 1,
0.4313613, -0.9355249, 3.702733, 0.03137255, 0, 1, 1,
0.43185, -0.7057735, 2.18628, 0.03921569, 0, 1, 1,
0.4372426, -0.8924753, 3.489214, 0.04313726, 0, 1, 1,
0.4391828, -1.190272, 1.614084, 0.05098039, 0, 1, 1,
0.4497283, 0.1766709, 2.663256, 0.05490196, 0, 1, 1,
0.4501496, -0.7647352, 2.607944, 0.0627451, 0, 1, 1,
0.4583523, -0.4196748, 2.776853, 0.06666667, 0, 1, 1,
0.4624394, 1.059866, 1.607321, 0.07450981, 0, 1, 1,
0.4638444, 0.004910403, 0.3317438, 0.07843138, 0, 1, 1,
0.4645185, -1.305781, 2.686808, 0.08627451, 0, 1, 1,
0.4684291, 1.112583, 1.03654, 0.09019608, 0, 1, 1,
0.4689403, -0.776549, 2.254393, 0.09803922, 0, 1, 1,
0.4697239, 0.2996502, 1.467551, 0.1058824, 0, 1, 1,
0.4743426, -0.07087462, 1.344215, 0.1098039, 0, 1, 1,
0.4821421, 0.1177647, 2.188771, 0.1176471, 0, 1, 1,
0.4833207, 1.088924, 0.3347466, 0.1215686, 0, 1, 1,
0.4938375, 1.348309, 2.431597, 0.1294118, 0, 1, 1,
0.4973407, 0.03836387, 1.632457, 0.1333333, 0, 1, 1,
0.4977899, 0.05610118, 2.00305, 0.1411765, 0, 1, 1,
0.498172, 0.5305349, 1.790908, 0.145098, 0, 1, 1,
0.5091313, -0.665277, 1.988857, 0.1529412, 0, 1, 1,
0.5131375, -0.9666558, 3.590325, 0.1568628, 0, 1, 1,
0.5155948, -0.265252, 3.608593, 0.1647059, 0, 1, 1,
0.5170702, 2.266064, 0.4807151, 0.1686275, 0, 1, 1,
0.5188193, 0.8800437, -0.3710553, 0.1764706, 0, 1, 1,
0.5200384, 0.8677623, 0.2830719, 0.1803922, 0, 1, 1,
0.5274353, 0.0972198, 2.227142, 0.1882353, 0, 1, 1,
0.5307487, -0.1283554, 1.140358, 0.1921569, 0, 1, 1,
0.5321509, 1.489209, 1.528308, 0.2, 0, 1, 1,
0.5413121, -1.998803, 2.590245, 0.2078431, 0, 1, 1,
0.5431804, 0.7449756, 0.5435805, 0.2117647, 0, 1, 1,
0.545441, 0.8621348, -0.6066857, 0.2196078, 0, 1, 1,
0.5475232, 1.812571, 0.7584248, 0.2235294, 0, 1, 1,
0.5482512, 1.897223, -0.8713699, 0.2313726, 0, 1, 1,
0.5487967, 1.31759, 1.066136, 0.2352941, 0, 1, 1,
0.5518814, -0.1739426, 3.484436, 0.2431373, 0, 1, 1,
0.5527014, -1.019351, 1.58717, 0.2470588, 0, 1, 1,
0.5543149, -0.7264341, 2.336026, 0.254902, 0, 1, 1,
0.5602657, 0.1800011, -0.1621196, 0.2588235, 0, 1, 1,
0.5624503, -0.1774526, 2.433151, 0.2666667, 0, 1, 1,
0.5723355, 0.5504553, 1.244385, 0.2705882, 0, 1, 1,
0.5992758, -1.023436, 2.261409, 0.2784314, 0, 1, 1,
0.6020508, -0.4883111, 1.916099, 0.282353, 0, 1, 1,
0.6051536, -0.2242214, 1.496473, 0.2901961, 0, 1, 1,
0.605958, -0.1432442, 0.6191993, 0.2941177, 0, 1, 1,
0.6081101, -1.144903, 5.411117, 0.3019608, 0, 1, 1,
0.6086482, 0.7699785, 0.1631221, 0.3098039, 0, 1, 1,
0.6121739, -0.09142985, 0.4255994, 0.3137255, 0, 1, 1,
0.613149, -0.3915992, 1.545847, 0.3215686, 0, 1, 1,
0.6204662, -0.01901726, 1.691651, 0.3254902, 0, 1, 1,
0.6215847, 0.5446253, 1.262387, 0.3333333, 0, 1, 1,
0.6242129, 1.093093, 1.036949, 0.3372549, 0, 1, 1,
0.6301479, -3.201952, 3.901488, 0.345098, 0, 1, 1,
0.6355507, 1.19994, -1.463045, 0.3490196, 0, 1, 1,
0.6374593, -0.3964703, 1.274957, 0.3568628, 0, 1, 1,
0.642045, 0.3912608, 0.2689085, 0.3607843, 0, 1, 1,
0.6457764, -1.689849, 1.489571, 0.3686275, 0, 1, 1,
0.648407, 1.233841, -1.197547, 0.372549, 0, 1, 1,
0.6486855, -0.2375789, 0.5620223, 0.3803922, 0, 1, 1,
0.652453, 0.9865035, 0.2524526, 0.3843137, 0, 1, 1,
0.6535946, 0.6243528, -1.271723, 0.3921569, 0, 1, 1,
0.6548756, -1.217899, 2.361257, 0.3960784, 0, 1, 1,
0.6551417, 0.4984834, -0.4632255, 0.4039216, 0, 1, 1,
0.6660985, -1.301333, 1.563355, 0.4117647, 0, 1, 1,
0.6670915, -1.986118, 2.046639, 0.4156863, 0, 1, 1,
0.6726186, -0.2092079, 1.167197, 0.4235294, 0, 1, 1,
0.6735301, -0.4350673, 3.589213, 0.427451, 0, 1, 1,
0.6763636, -1.954155, 2.254364, 0.4352941, 0, 1, 1,
0.677497, -0.8919483, 3.03117, 0.4392157, 0, 1, 1,
0.6821415, 0.525592, 2.320331, 0.4470588, 0, 1, 1,
0.7000287, 0.8825662, 0.1622338, 0.4509804, 0, 1, 1,
0.7029188, 0.5203537, 0.5192186, 0.4588235, 0, 1, 1,
0.7065111, -1.259442, 2.429184, 0.4627451, 0, 1, 1,
0.7220538, 1.171793, 1.18749, 0.4705882, 0, 1, 1,
0.7254675, -0.7389418, 2.20794, 0.4745098, 0, 1, 1,
0.7273839, 0.3407185, 1.052701, 0.4823529, 0, 1, 1,
0.7313629, 0.8240592, -1.149017, 0.4862745, 0, 1, 1,
0.7333891, -0.5047334, 2.143671, 0.4941176, 0, 1, 1,
0.7343559, -1.920326, 3.192168, 0.5019608, 0, 1, 1,
0.7386847, 1.488631, -0.9500095, 0.5058824, 0, 1, 1,
0.7442619, 0.2305734, 0.6512785, 0.5137255, 0, 1, 1,
0.7452046, -1.56395, 1.7206, 0.5176471, 0, 1, 1,
0.7459308, 0.08324153, 3.612793, 0.5254902, 0, 1, 1,
0.7499479, -0.6483681, 3.628524, 0.5294118, 0, 1, 1,
0.7505062, 1.025454, 0.5417565, 0.5372549, 0, 1, 1,
0.7515569, 0.5122674, 0.0514381, 0.5411765, 0, 1, 1,
0.7521881, 0.5818906, 0.2906329, 0.5490196, 0, 1, 1,
0.7625149, 0.0711875, 0.4759345, 0.5529412, 0, 1, 1,
0.7630719, -0.1656561, 1.304243, 0.5607843, 0, 1, 1,
0.7639302, 0.341996, 0.7177169, 0.5647059, 0, 1, 1,
0.7680122, 0.3161432, -0.5679233, 0.572549, 0, 1, 1,
0.7688773, -1.560631, 3.481554, 0.5764706, 0, 1, 1,
0.7703975, -1.46301, 2.51859, 0.5843138, 0, 1, 1,
0.7747796, 0.5494358, 1.528532, 0.5882353, 0, 1, 1,
0.7752357, 0.1121557, 2.196678, 0.5960785, 0, 1, 1,
0.7810527, -0.4608098, 2.776613, 0.6039216, 0, 1, 1,
0.7815677, -1.617268, 2.46755, 0.6078432, 0, 1, 1,
0.7864774, -0.6034038, 2.037489, 0.6156863, 0, 1, 1,
0.7873189, -0.8008429, 3.547747, 0.6196079, 0, 1, 1,
0.7930715, -0.5672479, 0.7508681, 0.627451, 0, 1, 1,
0.7931287, -0.09398585, 1.681401, 0.6313726, 0, 1, 1,
0.7937363, -0.06116343, 2.121491, 0.6392157, 0, 1, 1,
0.8031842, 1.588777, -0.2710489, 0.6431373, 0, 1, 1,
0.8034183, -0.6556243, 2.599067, 0.6509804, 0, 1, 1,
0.8036566, 1.144061, 1.737162, 0.654902, 0, 1, 1,
0.8047984, 1.554591, 0.7234145, 0.6627451, 0, 1, 1,
0.8048321, -0.5283232, 1.328665, 0.6666667, 0, 1, 1,
0.808682, -0.4991631, 2.890557, 0.6745098, 0, 1, 1,
0.8132599, 1.340413, 1.053081, 0.6784314, 0, 1, 1,
0.8138568, -0.2056083, 1.913719, 0.6862745, 0, 1, 1,
0.8161067, 0.787747, 0.7605978, 0.6901961, 0, 1, 1,
0.8194972, 1.847664, -0.8034394, 0.6980392, 0, 1, 1,
0.819832, 0.4610354, 1.126573, 0.7058824, 0, 1, 1,
0.8231041, 0.7571504, 1.552082, 0.7098039, 0, 1, 1,
0.8275532, -0.8369109, 4.319789, 0.7176471, 0, 1, 1,
0.8374393, -1.033695, 1.904423, 0.7215686, 0, 1, 1,
0.8390491, -0.5527862, 2.086655, 0.7294118, 0, 1, 1,
0.8577908, -0.4414568, 1.646719, 0.7333333, 0, 1, 1,
0.858893, 0.9432985, 1.666952, 0.7411765, 0, 1, 1,
0.8652756, 1.542431, 2.097775, 0.7450981, 0, 1, 1,
0.8653004, -1.289148, 4.070705, 0.7529412, 0, 1, 1,
0.8712917, 0.4710177, 1.240567, 0.7568628, 0, 1, 1,
0.8827319, 0.3068454, 1.342615, 0.7647059, 0, 1, 1,
0.8836053, 0.2036409, 2.581683, 0.7686275, 0, 1, 1,
0.8895591, -1.270855, 2.908934, 0.7764706, 0, 1, 1,
0.8924127, -0.06933848, 1.639173, 0.7803922, 0, 1, 1,
0.8932788, 0.6921766, 0.8019184, 0.7882353, 0, 1, 1,
0.8937492, -1.134176, 2.118839, 0.7921569, 0, 1, 1,
0.8966563, 0.373387, 0.7193407, 0.8, 0, 1, 1,
0.8977559, 1.072751, 1.120875, 0.8078431, 0, 1, 1,
0.9097375, -2.468582, 4.309481, 0.8117647, 0, 1, 1,
0.9197456, 0.362141, 1.937523, 0.8196079, 0, 1, 1,
0.9287529, 1.706672, -1.327002, 0.8235294, 0, 1, 1,
0.9319847, -0.8676404, 1.836417, 0.8313726, 0, 1, 1,
0.9338098, -0.4746949, 1.994542, 0.8352941, 0, 1, 1,
0.9356019, -0.4371875, 2.308676, 0.8431373, 0, 1, 1,
0.9361147, 0.7386792, -0.04336398, 0.8470588, 0, 1, 1,
0.938071, 0.4168382, 2.371926, 0.854902, 0, 1, 1,
0.9402463, -0.5179728, 1.481445, 0.8588235, 0, 1, 1,
0.946879, -2.154978, 4.263213, 0.8666667, 0, 1, 1,
0.9497864, 0.1307185, 0.4987051, 0.8705882, 0, 1, 1,
0.9587244, -0.3223515, 1.468348, 0.8784314, 0, 1, 1,
0.9616479, -1.007785, 2.758715, 0.8823529, 0, 1, 1,
0.9625683, -1.593727, 2.776783, 0.8901961, 0, 1, 1,
0.9637405, 0.5826001, 1.517386, 0.8941177, 0, 1, 1,
0.9642001, 0.837208, 1.044354, 0.9019608, 0, 1, 1,
0.9700986, 2.190247, -0.626568, 0.9098039, 0, 1, 1,
0.9718113, -1.172451, 2.181352, 0.9137255, 0, 1, 1,
0.9735569, 0.7918378, -0.7022912, 0.9215686, 0, 1, 1,
0.9737061, -1.762532, 3.686651, 0.9254902, 0, 1, 1,
0.9776373, 0.9924193, -1.26714, 0.9333333, 0, 1, 1,
0.9788238, 0.8003283, -0.2950823, 0.9372549, 0, 1, 1,
0.979193, -0.7847685, 2.818002, 0.945098, 0, 1, 1,
0.9809661, 1.316836, -0.166985, 0.9490196, 0, 1, 1,
0.9840305, -1.089479, 4.323814, 0.9568627, 0, 1, 1,
0.9933183, -1.12362, 2.418427, 0.9607843, 0, 1, 1,
0.9998473, -3.139051, 2.830636, 0.9686275, 0, 1, 1,
1.001495, 0.4576049, 0.2611267, 0.972549, 0, 1, 1,
1.00196, -0.9582884, 4.602258, 0.9803922, 0, 1, 1,
1.006454, 0.1591376, 1.452867, 0.9843137, 0, 1, 1,
1.008922, 0.2812764, 2.811308, 0.9921569, 0, 1, 1,
1.009198, -1.238172, 0.6875007, 0.9960784, 0, 1, 1,
1.016251, -0.2235984, 2.682382, 1, 0, 0.9960784, 1,
1.017326, -0.8698121, 2.616691, 1, 0, 0.9882353, 1,
1.017331, 0.349703, 0.6730491, 1, 0, 0.9843137, 1,
1.021353, 0.09280406, 1.808891, 1, 0, 0.9764706, 1,
1.022733, 0.3028852, 2.515355, 1, 0, 0.972549, 1,
1.023781, -0.424714, 4.336767, 1, 0, 0.9647059, 1,
1.026271, -0.1537831, 0.6173165, 1, 0, 0.9607843, 1,
1.02948, 0.5977786, 3.429985, 1, 0, 0.9529412, 1,
1.031337, -1.019571, 2.883572, 1, 0, 0.9490196, 1,
1.038003, 1.310329, 1.352138, 1, 0, 0.9411765, 1,
1.038703, -0.9803641, 2.215749, 1, 0, 0.9372549, 1,
1.039977, -0.774201, 1.693066, 1, 0, 0.9294118, 1,
1.040632, 0.9225432, 1.317743, 1, 0, 0.9254902, 1,
1.041071, -0.1789241, 1.822649, 1, 0, 0.9176471, 1,
1.046146, 0.4603679, 1.526656, 1, 0, 0.9137255, 1,
1.046836, 0.4587159, 0.8683808, 1, 0, 0.9058824, 1,
1.051278, 0.1804838, 2.520373, 1, 0, 0.9019608, 1,
1.054822, -0.2486464, 2.200757, 1, 0, 0.8941177, 1,
1.061645, -0.5761706, 1.997286, 1, 0, 0.8862745, 1,
1.061952, -0.721491, 2.85844, 1, 0, 0.8823529, 1,
1.063151, -0.7466627, 3.229392, 1, 0, 0.8745098, 1,
1.074336, 0.3878824, 1.758099, 1, 0, 0.8705882, 1,
1.079892, 1.004259, 1.084384, 1, 0, 0.8627451, 1,
1.084444, 0.4300472, -0.5891558, 1, 0, 0.8588235, 1,
1.08475, 1.750237, 0.9404197, 1, 0, 0.8509804, 1,
1.098882, -1.395297, 1.722986, 1, 0, 0.8470588, 1,
1.098886, -0.02829207, 1.276807, 1, 0, 0.8392157, 1,
1.107979, 0.7717162, 0.8615462, 1, 0, 0.8352941, 1,
1.109489, 0.02716756, 2.465312, 1, 0, 0.827451, 1,
1.125472, -0.694424, 2.043061, 1, 0, 0.8235294, 1,
1.145125, -0.2491959, 1.17465, 1, 0, 0.8156863, 1,
1.153375, 0.09012084, 2.622696, 1, 0, 0.8117647, 1,
1.15522, 1.189876, 1.562026, 1, 0, 0.8039216, 1,
1.156996, -0.7985295, 2.146842, 1, 0, 0.7960784, 1,
1.15929, -0.9202344, 3.491624, 1, 0, 0.7921569, 1,
1.159923, -1.162354, 2.024045, 1, 0, 0.7843137, 1,
1.160415, 0.264439, 3.843515, 1, 0, 0.7803922, 1,
1.170855, -1.477498, 1.924594, 1, 0, 0.772549, 1,
1.180695, -0.002975211, 0.3139865, 1, 0, 0.7686275, 1,
1.181162, 0.6235295, 0.7871757, 1, 0, 0.7607843, 1,
1.18722, 0.9905, 1.61643, 1, 0, 0.7568628, 1,
1.187604, -0.7227485, 2.468445, 1, 0, 0.7490196, 1,
1.187947, -0.272609, 2.903523, 1, 0, 0.7450981, 1,
1.189339, -2.354829, 4.720379, 1, 0, 0.7372549, 1,
1.196481, -0.7240702, 2.523942, 1, 0, 0.7333333, 1,
1.198546, 1.487401, 1.386968, 1, 0, 0.7254902, 1,
1.206297, 0.2640884, 0.4957179, 1, 0, 0.7215686, 1,
1.207801, 0.6131917, 0.73759, 1, 0, 0.7137255, 1,
1.208367, -0.2116671, 2.041951, 1, 0, 0.7098039, 1,
1.214305, -0.07828461, 0.4415723, 1, 0, 0.7019608, 1,
1.219579, -0.2452974, 0.156927, 1, 0, 0.6941177, 1,
1.229938, -0.5127356, 3.554782, 1, 0, 0.6901961, 1,
1.232809, -0.03918172, 0.7538512, 1, 0, 0.682353, 1,
1.236889, -0.8640628, 3.457201, 1, 0, 0.6784314, 1,
1.237426, -0.7203465, 2.231378, 1, 0, 0.6705883, 1,
1.237991, -0.351323, 2.573142, 1, 0, 0.6666667, 1,
1.248669, -0.008384168, 1.469454, 1, 0, 0.6588235, 1,
1.250269, 0.8610679, 0.6013201, 1, 0, 0.654902, 1,
1.251388, 0.4276223, 0.3078639, 1, 0, 0.6470588, 1,
1.252975, -1.172103, 1.216774, 1, 0, 0.6431373, 1,
1.254406, 0.2925001, 1.139713, 1, 0, 0.6352941, 1,
1.259117, -0.1952754, 1.206233, 1, 0, 0.6313726, 1,
1.267562, 0.2040939, 1.31774, 1, 0, 0.6235294, 1,
1.292663, -0.3906173, 3.525025, 1, 0, 0.6196079, 1,
1.318665, -0.1250025, 2.202551, 1, 0, 0.6117647, 1,
1.321983, -1.065273, 3.693827, 1, 0, 0.6078432, 1,
1.324089, -0.9957571, 1.432785, 1, 0, 0.6, 1,
1.324465, 2.30111, 1.728528, 1, 0, 0.5921569, 1,
1.341955, 0.8970646, -0.2791514, 1, 0, 0.5882353, 1,
1.351985, -0.7852955, 4.092559, 1, 0, 0.5803922, 1,
1.352243, -1.160799, 1.913805, 1, 0, 0.5764706, 1,
1.362247, -0.7210991, 1.69236, 1, 0, 0.5686275, 1,
1.363999, -1.360604, 1.712307, 1, 0, 0.5647059, 1,
1.364046, 0.5676149, -0.2650982, 1, 0, 0.5568628, 1,
1.367821, 0.9394498, 0.3289801, 1, 0, 0.5529412, 1,
1.372379, 0.4379927, 0.6846036, 1, 0, 0.5450981, 1,
1.379862, 0.4255438, 1.17989, 1, 0, 0.5411765, 1,
1.381303, -0.4872812, 2.953773, 1, 0, 0.5333334, 1,
1.382851, 0.2105804, 1.28003, 1, 0, 0.5294118, 1,
1.40193, -0.05678871, 0.2492525, 1, 0, 0.5215687, 1,
1.405681, 0.3912916, 1.321928, 1, 0, 0.5176471, 1,
1.407931, -0.1823577, 1.905852, 1, 0, 0.509804, 1,
1.416967, 0.2610639, 3.188718, 1, 0, 0.5058824, 1,
1.417987, 0.233413, -0.4783677, 1, 0, 0.4980392, 1,
1.42306, -1.101166, 3.238277, 1, 0, 0.4901961, 1,
1.429577, -1.123076, 3.029423, 1, 0, 0.4862745, 1,
1.435687, -0.8365815, 2.138028, 1, 0, 0.4784314, 1,
1.454225, 0.8773632, 2.643369, 1, 0, 0.4745098, 1,
1.459474, -0.2991626, 1.84726, 1, 0, 0.4666667, 1,
1.464423, 0.2955846, 1.552131, 1, 0, 0.4627451, 1,
1.467296, 0.7624097, 0.9104316, 1, 0, 0.454902, 1,
1.469629, -0.9213071, 1.148875, 1, 0, 0.4509804, 1,
1.47139, -0.4916296, 3.498157, 1, 0, 0.4431373, 1,
1.472523, -1.400251, 1.118133, 1, 0, 0.4392157, 1,
1.474451, 0.6732724, 1.220863, 1, 0, 0.4313726, 1,
1.490294, -0.2902452, 1.383149, 1, 0, 0.427451, 1,
1.491984, 0.1494854, 0.4597612, 1, 0, 0.4196078, 1,
1.506389, -0.5163284, 1.206773, 1, 0, 0.4156863, 1,
1.541639, -0.04638484, 1.645207, 1, 0, 0.4078431, 1,
1.548581, 0.7714547, 3.102055, 1, 0, 0.4039216, 1,
1.553343, -0.454818, 0.3167358, 1, 0, 0.3960784, 1,
1.554021, -1.080783, 2.975947, 1, 0, 0.3882353, 1,
1.554678, -0.8585104, 1.994764, 1, 0, 0.3843137, 1,
1.567493, 0.9195156, -0.7321948, 1, 0, 0.3764706, 1,
1.568714, 1.351219, 0.1293599, 1, 0, 0.372549, 1,
1.569826, -0.6231242, 1.143863, 1, 0, 0.3647059, 1,
1.573442, -1.175887, 0.914826, 1, 0, 0.3607843, 1,
1.580099, 0.001842239, 1.886517, 1, 0, 0.3529412, 1,
1.582994, -0.6784503, 1.53591, 1, 0, 0.3490196, 1,
1.58442, -0.6707952, 2.545482, 1, 0, 0.3411765, 1,
1.586705, 0.06753626, -0.4258463, 1, 0, 0.3372549, 1,
1.588778, -0.6878507, 3.768372, 1, 0, 0.3294118, 1,
1.589748, -2.530907, 2.021159, 1, 0, 0.3254902, 1,
1.59994, 1.538741, 2.523794, 1, 0, 0.3176471, 1,
1.656747, -0.06275162, 2.199883, 1, 0, 0.3137255, 1,
1.673969, -0.5044845, 2.323556, 1, 0, 0.3058824, 1,
1.677715, -0.4617572, -0.1888249, 1, 0, 0.2980392, 1,
1.704301, 1.766173, 1.929595, 1, 0, 0.2941177, 1,
1.73368, 1.473669, 1.786211, 1, 0, 0.2862745, 1,
1.741838, -1.418834, 3.090273, 1, 0, 0.282353, 1,
1.75153, -0.80816, 1.914671, 1, 0, 0.2745098, 1,
1.764235, 1.578181, 1.063847, 1, 0, 0.2705882, 1,
1.767042, -1.213903, 1.845125, 1, 0, 0.2627451, 1,
1.769615, -2.099329, 1.753109, 1, 0, 0.2588235, 1,
1.771616, 0.1204299, 2.81351, 1, 0, 0.2509804, 1,
1.796698, -1.28556, 0.6266166, 1, 0, 0.2470588, 1,
1.829757, 1.130852, 0.5637507, 1, 0, 0.2392157, 1,
1.834383, -0.06104764, 0.4749323, 1, 0, 0.2352941, 1,
1.842132, 0.06742934, 1.132681, 1, 0, 0.227451, 1,
1.855992, -0.05544432, 1.530316, 1, 0, 0.2235294, 1,
1.872825, -0.8455736, 0.9858866, 1, 0, 0.2156863, 1,
1.875559, 2.126655, -0.3122131, 1, 0, 0.2117647, 1,
1.893018, -0.4086329, 2.592049, 1, 0, 0.2039216, 1,
1.900111, 1.041605, 2.468336, 1, 0, 0.1960784, 1,
1.914969, -1.486078, 2.571166, 1, 0, 0.1921569, 1,
1.916746, 0.420151, 1.387564, 1, 0, 0.1843137, 1,
1.919682, -0.1251902, 3.268478, 1, 0, 0.1803922, 1,
1.92764, 1.054612, 0.7574825, 1, 0, 0.172549, 1,
1.944541, 1.8228, 0.1943381, 1, 0, 0.1686275, 1,
1.952846, -0.008595699, 1.728225, 1, 0, 0.1607843, 1,
1.96513, -1.024545, 0.345107, 1, 0, 0.1568628, 1,
1.9706, -0.274661, 1.607728, 1, 0, 0.1490196, 1,
1.99147, 0.5847225, 1.519279, 1, 0, 0.145098, 1,
2.008875, -0.8319508, 0.9949284, 1, 0, 0.1372549, 1,
2.019352, -0.4586181, 2.312196, 1, 0, 0.1333333, 1,
2.025659, -1.263749, 3.236995, 1, 0, 0.1254902, 1,
2.073426, 2.155579, 0.4149272, 1, 0, 0.1215686, 1,
2.093544, 0.01635627, -0.1368682, 1, 0, 0.1137255, 1,
2.131891, -1.950745, 0.7768202, 1, 0, 0.1098039, 1,
2.136495, 1.130807, 1.720459, 1, 0, 0.1019608, 1,
2.137126, 0.5139573, 0.119324, 1, 0, 0.09411765, 1,
2.202946, 0.1359405, 0.7936836, 1, 0, 0.09019608, 1,
2.223646, -0.02004035, 2.308997, 1, 0, 0.08235294, 1,
2.27148, -1.447997, 2.391285, 1, 0, 0.07843138, 1,
2.284012, -0.8265074, 1.628073, 1, 0, 0.07058824, 1,
2.296556, 1.292665, -0.3966124, 1, 0, 0.06666667, 1,
2.344366, 1.438076, 1.706145, 1, 0, 0.05882353, 1,
2.353708, -0.5610846, 1.897702, 1, 0, 0.05490196, 1,
2.375562, 0.01941518, 1.908434, 1, 0, 0.04705882, 1,
2.392168, -0.625094, 0.9528313, 1, 0, 0.04313726, 1,
2.425387, 0.05601838, 0.8104017, 1, 0, 0.03529412, 1,
2.576288, -0.8001239, -0.08023952, 1, 0, 0.03137255, 1,
2.679497, -1.394067, 1.723006, 1, 0, 0.02352941, 1,
2.687952, 0.4362424, 2.338052, 1, 0, 0.01960784, 1,
2.84328, 0.5254562, 1.107945, 1, 0, 0.01176471, 1,
3.144199, 0.7867773, 1.671872, 1, 0, 0.007843138, 1
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
0.05991197, -4.325718, -7.63726, 0, -0.5, 0.5, 0.5,
0.05991197, -4.325718, -7.63726, 1, -0.5, 0.5, 0.5,
0.05991197, -4.325718, -7.63726, 1, 1.5, 0.5, 0.5,
0.05991197, -4.325718, -7.63726, 0, 1.5, 0.5, 0.5
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
-4.069949, 0.1129932, -7.63726, 0, -0.5, 0.5, 0.5,
-4.069949, 0.1129932, -7.63726, 1, -0.5, 0.5, 0.5,
-4.069949, 0.1129932, -7.63726, 1, 1.5, 0.5, 0.5,
-4.069949, 0.1129932, -7.63726, 0, 1.5, 0.5, 0.5
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
-4.069949, -4.325718, -0.1674969, 0, -0.5, 0.5, 0.5,
-4.069949, -4.325718, -0.1674969, 1, -0.5, 0.5, 0.5,
-4.069949, -4.325718, -0.1674969, 1, 1.5, 0.5, 0.5,
-4.069949, -4.325718, -0.1674969, 0, 1.5, 0.5, 0.5
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
-3, -3.3014, -5.913469,
3, -3.3014, -5.913469,
-3, -3.3014, -5.913469,
-3, -3.47212, -6.200768,
-2, -3.3014, -5.913469,
-2, -3.47212, -6.200768,
-1, -3.3014, -5.913469,
-1, -3.47212, -6.200768,
0, -3.3014, -5.913469,
0, -3.47212, -6.200768,
1, -3.3014, -5.913469,
1, -3.47212, -6.200768,
2, -3.3014, -5.913469,
2, -3.47212, -6.200768,
3, -3.3014, -5.913469,
3, -3.47212, -6.200768
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
-3, -3.813559, -6.775364, 0, -0.5, 0.5, 0.5,
-3, -3.813559, -6.775364, 1, -0.5, 0.5, 0.5,
-3, -3.813559, -6.775364, 1, 1.5, 0.5, 0.5,
-3, -3.813559, -6.775364, 0, 1.5, 0.5, 0.5,
-2, -3.813559, -6.775364, 0, -0.5, 0.5, 0.5,
-2, -3.813559, -6.775364, 1, -0.5, 0.5, 0.5,
-2, -3.813559, -6.775364, 1, 1.5, 0.5, 0.5,
-2, -3.813559, -6.775364, 0, 1.5, 0.5, 0.5,
-1, -3.813559, -6.775364, 0, -0.5, 0.5, 0.5,
-1, -3.813559, -6.775364, 1, -0.5, 0.5, 0.5,
-1, -3.813559, -6.775364, 1, 1.5, 0.5, 0.5,
-1, -3.813559, -6.775364, 0, 1.5, 0.5, 0.5,
0, -3.813559, -6.775364, 0, -0.5, 0.5, 0.5,
0, -3.813559, -6.775364, 1, -0.5, 0.5, 0.5,
0, -3.813559, -6.775364, 1, 1.5, 0.5, 0.5,
0, -3.813559, -6.775364, 0, 1.5, 0.5, 0.5,
1, -3.813559, -6.775364, 0, -0.5, 0.5, 0.5,
1, -3.813559, -6.775364, 1, -0.5, 0.5, 0.5,
1, -3.813559, -6.775364, 1, 1.5, 0.5, 0.5,
1, -3.813559, -6.775364, 0, 1.5, 0.5, 0.5,
2, -3.813559, -6.775364, 0, -0.5, 0.5, 0.5,
2, -3.813559, -6.775364, 1, -0.5, 0.5, 0.5,
2, -3.813559, -6.775364, 1, 1.5, 0.5, 0.5,
2, -3.813559, -6.775364, 0, 1.5, 0.5, 0.5,
3, -3.813559, -6.775364, 0, -0.5, 0.5, 0.5,
3, -3.813559, -6.775364, 1, -0.5, 0.5, 0.5,
3, -3.813559, -6.775364, 1, 1.5, 0.5, 0.5,
3, -3.813559, -6.775364, 0, 1.5, 0.5, 0.5
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
-3.116904, -3, -5.913469,
-3.116904, 3, -5.913469,
-3.116904, -3, -5.913469,
-3.275745, -3, -6.200768,
-3.116904, -2, -5.913469,
-3.275745, -2, -6.200768,
-3.116904, -1, -5.913469,
-3.275745, -1, -6.200768,
-3.116904, 0, -5.913469,
-3.275745, 0, -6.200768,
-3.116904, 1, -5.913469,
-3.275745, 1, -6.200768,
-3.116904, 2, -5.913469,
-3.275745, 2, -6.200768,
-3.116904, 3, -5.913469,
-3.275745, 3, -6.200768
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
-3.593426, -3, -6.775364, 0, -0.5, 0.5, 0.5,
-3.593426, -3, -6.775364, 1, -0.5, 0.5, 0.5,
-3.593426, -3, -6.775364, 1, 1.5, 0.5, 0.5,
-3.593426, -3, -6.775364, 0, 1.5, 0.5, 0.5,
-3.593426, -2, -6.775364, 0, -0.5, 0.5, 0.5,
-3.593426, -2, -6.775364, 1, -0.5, 0.5, 0.5,
-3.593426, -2, -6.775364, 1, 1.5, 0.5, 0.5,
-3.593426, -2, -6.775364, 0, 1.5, 0.5, 0.5,
-3.593426, -1, -6.775364, 0, -0.5, 0.5, 0.5,
-3.593426, -1, -6.775364, 1, -0.5, 0.5, 0.5,
-3.593426, -1, -6.775364, 1, 1.5, 0.5, 0.5,
-3.593426, -1, -6.775364, 0, 1.5, 0.5, 0.5,
-3.593426, 0, -6.775364, 0, -0.5, 0.5, 0.5,
-3.593426, 0, -6.775364, 1, -0.5, 0.5, 0.5,
-3.593426, 0, -6.775364, 1, 1.5, 0.5, 0.5,
-3.593426, 0, -6.775364, 0, 1.5, 0.5, 0.5,
-3.593426, 1, -6.775364, 0, -0.5, 0.5, 0.5,
-3.593426, 1, -6.775364, 1, -0.5, 0.5, 0.5,
-3.593426, 1, -6.775364, 1, 1.5, 0.5, 0.5,
-3.593426, 1, -6.775364, 0, 1.5, 0.5, 0.5,
-3.593426, 2, -6.775364, 0, -0.5, 0.5, 0.5,
-3.593426, 2, -6.775364, 1, -0.5, 0.5, 0.5,
-3.593426, 2, -6.775364, 1, 1.5, 0.5, 0.5,
-3.593426, 2, -6.775364, 0, 1.5, 0.5, 0.5,
-3.593426, 3, -6.775364, 0, -0.5, 0.5, 0.5,
-3.593426, 3, -6.775364, 1, -0.5, 0.5, 0.5,
-3.593426, 3, -6.775364, 1, 1.5, 0.5, 0.5,
-3.593426, 3, -6.775364, 0, 1.5, 0.5, 0.5
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
-3.116904, -3.3014, -4,
-3.116904, -3.3014, 4,
-3.116904, -3.3014, -4,
-3.275745, -3.47212, -4,
-3.116904, -3.3014, -2,
-3.275745, -3.47212, -2,
-3.116904, -3.3014, 0,
-3.275745, -3.47212, 0,
-3.116904, -3.3014, 2,
-3.275745, -3.47212, 2,
-3.116904, -3.3014, 4,
-3.275745, -3.47212, 4
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
-3.593426, -3.813559, -4, 0, -0.5, 0.5, 0.5,
-3.593426, -3.813559, -4, 1, -0.5, 0.5, 0.5,
-3.593426, -3.813559, -4, 1, 1.5, 0.5, 0.5,
-3.593426, -3.813559, -4, 0, 1.5, 0.5, 0.5,
-3.593426, -3.813559, -2, 0, -0.5, 0.5, 0.5,
-3.593426, -3.813559, -2, 1, -0.5, 0.5, 0.5,
-3.593426, -3.813559, -2, 1, 1.5, 0.5, 0.5,
-3.593426, -3.813559, -2, 0, 1.5, 0.5, 0.5,
-3.593426, -3.813559, 0, 0, -0.5, 0.5, 0.5,
-3.593426, -3.813559, 0, 1, -0.5, 0.5, 0.5,
-3.593426, -3.813559, 0, 1, 1.5, 0.5, 0.5,
-3.593426, -3.813559, 0, 0, 1.5, 0.5, 0.5,
-3.593426, -3.813559, 2, 0, -0.5, 0.5, 0.5,
-3.593426, -3.813559, 2, 1, -0.5, 0.5, 0.5,
-3.593426, -3.813559, 2, 1, 1.5, 0.5, 0.5,
-3.593426, -3.813559, 2, 0, 1.5, 0.5, 0.5,
-3.593426, -3.813559, 4, 0, -0.5, 0.5, 0.5,
-3.593426, -3.813559, 4, 1, -0.5, 0.5, 0.5,
-3.593426, -3.813559, 4, 1, 1.5, 0.5, 0.5,
-3.593426, -3.813559, 4, 0, 1.5, 0.5, 0.5
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
-3.116904, -3.3014, -5.913469,
-3.116904, 3.527386, -5.913469,
-3.116904, -3.3014, 5.578475,
-3.116904, 3.527386, 5.578475,
-3.116904, -3.3014, -5.913469,
-3.116904, -3.3014, 5.578475,
-3.116904, 3.527386, -5.913469,
-3.116904, 3.527386, 5.578475,
-3.116904, -3.3014, -5.913469,
3.236728, -3.3014, -5.913469,
-3.116904, -3.3014, 5.578475,
3.236728, -3.3014, 5.578475,
-3.116904, 3.527386, -5.913469,
3.236728, 3.527386, -5.913469,
-3.116904, 3.527386, 5.578475,
3.236728, 3.527386, 5.578475,
3.236728, -3.3014, -5.913469,
3.236728, 3.527386, -5.913469,
3.236728, -3.3014, 5.578475,
3.236728, 3.527386, 5.578475,
3.236728, -3.3014, -5.913469,
3.236728, -3.3014, 5.578475,
3.236728, 3.527386, -5.913469,
3.236728, 3.527386, 5.578475
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
var radius = 7.903377;
var distance = 35.16302;
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
mvMatrix.translate( -0.05991197, -0.1129932, 0.1674969 );
mvMatrix.scale( 1.344945, 1.251362, 0.7435892 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.16302);
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
gamma-Nonalactone<-read.table("gamma-Nonalactone.xyz")
```

```
## Error in read.table("gamma-Nonalactone.xyz"): no lines available in input
```

```r
x<-gamma-Nonalactone$V2
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
```

```r
y<-gamma-Nonalactone$V3
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
```

```r
z<-gamma-Nonalactone$V4
```

```
## Error in eval(expr, envir, enclos): object 'Nonalactone' not found
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
-3.024375, 2.168901, -1.204676, 0, 0, 1, 1, 1,
-2.696291, -0.01117107, -0.8930596, 1, 0, 0, 1, 1,
-2.560501, 0.846444, -0.7443188, 1, 0, 0, 1, 1,
-2.468374, -0.9300621, -2.140285, 1, 0, 0, 1, 1,
-2.370539, 0.327918, -1.966473, 1, 0, 0, 1, 1,
-2.358869, 0.2685502, -1.427318, 1, 0, 0, 1, 1,
-2.356329, 0.7933092, -1.387326, 0, 0, 0, 1, 1,
-2.282147, -0.5867563, -1.757032, 0, 0, 0, 1, 1,
-2.280792, 1.64897, -0.1593117, 0, 0, 0, 1, 1,
-2.276891, -1.172744, -1.956196, 0, 0, 0, 1, 1,
-2.26864, -0.9746671, 0.3375118, 0, 0, 0, 1, 1,
-2.258209, -0.5603703, -1.299017, 0, 0, 0, 1, 1,
-2.25758, 0.5740913, -1.141679, 0, 0, 0, 1, 1,
-2.25627, -0.08290244, -1.794779, 1, 1, 1, 1, 1,
-2.181317, 0.4958521, -1.477755, 1, 1, 1, 1, 1,
-2.177845, 1.80689, -2.091736, 1, 1, 1, 1, 1,
-2.173316, 1.498953, -1.134644, 1, 1, 1, 1, 1,
-2.142886, 0.7792528, -2.79636, 1, 1, 1, 1, 1,
-2.142087, -0.309698, -3.535267, 1, 1, 1, 1, 1,
-2.121543, 0.36656, -0.8311893, 1, 1, 1, 1, 1,
-2.004453, -0.2880304, -2.64641, 1, 1, 1, 1, 1,
-1.993252, -0.9220235, -1.822864, 1, 1, 1, 1, 1,
-1.992174, -2.020158, -1.139353, 1, 1, 1, 1, 1,
-1.986949, 0.3001634, -1.760161, 1, 1, 1, 1, 1,
-1.976571, 0.2137171, -1.352025, 1, 1, 1, 1, 1,
-1.950921, 1.643364, -1.314659, 1, 1, 1, 1, 1,
-1.939675, -0.249958, -2.152499, 1, 1, 1, 1, 1,
-1.931358, 0.04833342, -1.262159, 1, 1, 1, 1, 1,
-1.907283, 0.7034071, 0.3776678, 0, 0, 1, 1, 1,
-1.870371, 1.013483, 0.7975916, 1, 0, 0, 1, 1,
-1.851894, 0.3750102, -0.1807461, 1, 0, 0, 1, 1,
-1.830439, 1.170156, -0.1828463, 1, 0, 0, 1, 1,
-1.821563, -0.142705, -1.178427, 1, 0, 0, 1, 1,
-1.777253, -0.7410547, -0.6333461, 1, 0, 0, 1, 1,
-1.769856, 1.021534, -0.5226257, 0, 0, 0, 1, 1,
-1.748645, 0.1858888, -0.6622807, 0, 0, 0, 1, 1,
-1.744715, 0.8596277, -0.1267006, 0, 0, 0, 1, 1,
-1.722168, -0.008952205, 1.236198, 0, 0, 0, 1, 1,
-1.721565, 0.7313323, -0.9622709, 0, 0, 0, 1, 1,
-1.72109, 1.117582, -1.763945, 0, 0, 0, 1, 1,
-1.712719, 0.5924399, -2.979486, 0, 0, 0, 1, 1,
-1.681384, 0.4036846, 0.2242914, 1, 1, 1, 1, 1,
-1.67398, 0.4045233, -0.7713006, 1, 1, 1, 1, 1,
-1.671647, 1.348577, -1.914903, 1, 1, 1, 1, 1,
-1.664246, -0.5177406, -1.975576, 1, 1, 1, 1, 1,
-1.660761, 0.4230836, -2.066673, 1, 1, 1, 1, 1,
-1.642438, -0.6675121, -4.401135, 1, 1, 1, 1, 1,
-1.63972, -0.3996378, -1.83331, 1, 1, 1, 1, 1,
-1.635676, -1.934201, -2.937557, 1, 1, 1, 1, 1,
-1.625474, 1.748908, -1.602201, 1, 1, 1, 1, 1,
-1.610488, 0.03369961, -2.178743, 1, 1, 1, 1, 1,
-1.606028, 0.7820854, -2.293788, 1, 1, 1, 1, 1,
-1.596259, 0.5918389, 0.211943, 1, 1, 1, 1, 1,
-1.595776, -0.3878897, -2.171698, 1, 1, 1, 1, 1,
-1.591077, -0.9673844, -1.876136, 1, 1, 1, 1, 1,
-1.539872, -1.034844, -1.749103, 1, 1, 1, 1, 1,
-1.536175, 0.8531122, 0.4158265, 0, 0, 1, 1, 1,
-1.532151, -0.6230801, -1.841343, 1, 0, 0, 1, 1,
-1.528385, 1.058186, -0.6256496, 1, 0, 0, 1, 1,
-1.517576, 0.7908708, -1.341257, 1, 0, 0, 1, 1,
-1.511159, -2.236028, -2.489257, 1, 0, 0, 1, 1,
-1.476022, -0.4741491, -1.859022, 1, 0, 0, 1, 1,
-1.463314, 0.396512, -2.193837, 0, 0, 0, 1, 1,
-1.452957, 1.29456, -0.2390139, 0, 0, 0, 1, 1,
-1.444425, 0.9646218, -0.9825681, 0, 0, 0, 1, 1,
-1.440952, -0.2843066, -0.886788, 0, 0, 0, 1, 1,
-1.435349, 0.4244866, 0.8094251, 0, 0, 0, 1, 1,
-1.42002, -0.7210752, -0.2414227, 0, 0, 0, 1, 1,
-1.419952, -1.163609, -1.415588, 0, 0, 0, 1, 1,
-1.407955, 0.7742204, 0.8342962, 1, 1, 1, 1, 1,
-1.405886, -0.6292599, -0.1965621, 1, 1, 1, 1, 1,
-1.400272, 0.4595589, -0.2395716, 1, 1, 1, 1, 1,
-1.399657, -0.6213611, -1.069015, 1, 1, 1, 1, 1,
-1.39382, -0.4335432, -2.574711, 1, 1, 1, 1, 1,
-1.390725, 1.447743, -1.709432, 1, 1, 1, 1, 1,
-1.378843, -0.8239552, -2.853806, 1, 1, 1, 1, 1,
-1.374244, 0.7340006, -3.442675, 1, 1, 1, 1, 1,
-1.36815, 0.3992476, -0.7641782, 1, 1, 1, 1, 1,
-1.365419, 2.419807, -0.10016, 1, 1, 1, 1, 1,
-1.353064, -0.5255483, -3.070802, 1, 1, 1, 1, 1,
-1.341201, 0.6489246, -1.044744, 1, 1, 1, 1, 1,
-1.333777, 0.2771314, 1.258043, 1, 1, 1, 1, 1,
-1.321805, -1.802153, -2.454125, 1, 1, 1, 1, 1,
-1.320977, 0.0508473, -2.044528, 1, 1, 1, 1, 1,
-1.316429, -1.225199, -2.985798, 0, 0, 1, 1, 1,
-1.309143, -1.166305, -2.349693, 1, 0, 0, 1, 1,
-1.303545, -0.3178191, -3.151029, 1, 0, 0, 1, 1,
-1.288247, -1.716426, -2.924483, 1, 0, 0, 1, 1,
-1.288044, 1.234987, 0.4784465, 1, 0, 0, 1, 1,
-1.282914, 0.003111169, -2.066713, 1, 0, 0, 1, 1,
-1.277809, 1.095085, -2.087749, 0, 0, 0, 1, 1,
-1.274812, 1.010864, -1.398502, 0, 0, 0, 1, 1,
-1.273095, 1.517383, -0.6915655, 0, 0, 0, 1, 1,
-1.271797, 0.5823835, -0.5670739, 0, 0, 0, 1, 1,
-1.270429, 2.319731, -1.288235, 0, 0, 0, 1, 1,
-1.267448, 0.1620343, -1.124116, 0, 0, 0, 1, 1,
-1.251555, 1.07207, -1.218105, 0, 0, 0, 1, 1,
-1.245154, 0.4099008, -1.462531, 1, 1, 1, 1, 1,
-1.244203, -1.54551, -3.421134, 1, 1, 1, 1, 1,
-1.239251, 0.5596568, -1.749802, 1, 1, 1, 1, 1,
-1.227551, 1.972825, -0.5860856, 1, 1, 1, 1, 1,
-1.218078, 0.06622968, -1.979357, 1, 1, 1, 1, 1,
-1.208667, 0.181312, -2.031811, 1, 1, 1, 1, 1,
-1.206675, -1.050313, -0.9312413, 1, 1, 1, 1, 1,
-1.177849, 2.153817, -0.6268257, 1, 1, 1, 1, 1,
-1.177757, -1.6061, -0.6885423, 1, 1, 1, 1, 1,
-1.177122, -1.624323, -1.872337, 1, 1, 1, 1, 1,
-1.175851, 0.8864844, -2.207221, 1, 1, 1, 1, 1,
-1.175166, -0.0949747, -3.230002, 1, 1, 1, 1, 1,
-1.172196, -0.7499324, -1.084587, 1, 1, 1, 1, 1,
-1.155418, 0.9027371, -0.8288098, 1, 1, 1, 1, 1,
-1.151297, 2.991107, 0.2381353, 1, 1, 1, 1, 1,
-1.151284, 0.2750401, 0.7312059, 0, 0, 1, 1, 1,
-1.150932, -0.5746871, -2.858521, 1, 0, 0, 1, 1,
-1.150869, -0.4267378, -1.083308, 1, 0, 0, 1, 1,
-1.143362, -1.100934, -3.513021, 1, 0, 0, 1, 1,
-1.141701, -2.291367, -3.605515, 1, 0, 0, 1, 1,
-1.136682, -1.370808, -2.474808, 1, 0, 0, 1, 1,
-1.133956, 0.2655076, 0.1990294, 0, 0, 0, 1, 1,
-1.133771, 0.3312514, -1.201961, 0, 0, 0, 1, 1,
-1.130745, 1.758337, -0.3511797, 0, 0, 0, 1, 1,
-1.127082, -0.09395055, -1.099594, 0, 0, 0, 1, 1,
-1.111281, 0.2473321, -2.865624, 0, 0, 0, 1, 1,
-1.111067, 0.2388996, -2.82382, 0, 0, 0, 1, 1,
-1.109599, -0.887771, -1.721725, 0, 0, 0, 1, 1,
-1.107548, -1.593793, -0.3277081, 1, 1, 1, 1, 1,
-1.091761, 0.2174817, -1.433129, 1, 1, 1, 1, 1,
-1.089367, 0.9104775, -1.895874, 1, 1, 1, 1, 1,
-1.087686, -0.7035927, -2.390994, 1, 1, 1, 1, 1,
-1.084338, -0.2997296, -1.729684, 1, 1, 1, 1, 1,
-1.072586, -0.01009211, -0.748871, 1, 1, 1, 1, 1,
-1.065629, -0.08958983, -2.32223, 1, 1, 1, 1, 1,
-1.063945, -0.8324012, -1.611854, 1, 1, 1, 1, 1,
-1.056361, -0.2042244, -1.395813, 1, 1, 1, 1, 1,
-1.026566, 0.9521603, -1.261212, 1, 1, 1, 1, 1,
-1.02103, 1.647382, -0.6486368, 1, 1, 1, 1, 1,
-1.020398, 0.5597069, -3.21521, 1, 1, 1, 1, 1,
-1.011958, 0.1331244, -0.07102921, 1, 1, 1, 1, 1,
-1.00983, -0.1704479, -1.554735, 1, 1, 1, 1, 1,
-1.006456, 0.4986075, 0.1852033, 1, 1, 1, 1, 1,
-1.005165, -0.254887, -3.668092, 0, 0, 1, 1, 1,
-1.004442, -0.661997, -2.613599, 1, 0, 0, 1, 1,
-1.000358, -0.8109106, -1.384636, 1, 0, 0, 1, 1,
-0.9957592, -0.7617568, -2.570251, 1, 0, 0, 1, 1,
-0.9947729, -0.1250992, -3.443572, 1, 0, 0, 1, 1,
-0.9913687, -0.4409268, -1.525918, 1, 0, 0, 1, 1,
-0.9892849, 0.02115957, -2.288403, 0, 0, 0, 1, 1,
-0.9808674, 0.3227973, -1.595426, 0, 0, 0, 1, 1,
-0.9799393, 0.748628, -1.92822, 0, 0, 0, 1, 1,
-0.969298, 2.24143, 0.06510612, 0, 0, 0, 1, 1,
-0.9687481, 1.467394, -0.8114086, 0, 0, 0, 1, 1,
-0.9661705, -1.302063, -2.774985, 0, 0, 0, 1, 1,
-0.9564739, 1.227889, 0.0439693, 0, 0, 0, 1, 1,
-0.9552327, 0.121916, -1.058182, 1, 1, 1, 1, 1,
-0.9328625, 0.4196018, -1.608014, 1, 1, 1, 1, 1,
-0.9305538, -0.09276431, -1.768571, 1, 1, 1, 1, 1,
-0.9283276, 1.756017, -1.42205, 1, 1, 1, 1, 1,
-0.9271469, 0.173532, -1.401314, 1, 1, 1, 1, 1,
-0.9097115, 0.6399465, -1.997949, 1, 1, 1, 1, 1,
-0.9083133, -2.357969, -1.885443, 1, 1, 1, 1, 1,
-0.9069324, -0.5298044, -1.484638, 1, 1, 1, 1, 1,
-0.9033883, 1.012816, -1.054047, 1, 1, 1, 1, 1,
-0.8936167, -0.3789495, -1.204206, 1, 1, 1, 1, 1,
-0.8935202, -1.520412, -3.435391, 1, 1, 1, 1, 1,
-0.8928971, -0.8075948, -3.717066, 1, 1, 1, 1, 1,
-0.8888518, -1.233331, -2.17408, 1, 1, 1, 1, 1,
-0.8887506, 0.4774511, -1.787205, 1, 1, 1, 1, 1,
-0.8841699, -0.8480981, -1.689029, 1, 1, 1, 1, 1,
-0.8837992, -1.231744, -3.986793, 0, 0, 1, 1, 1,
-0.8791696, 0.06038472, -0.6145885, 1, 0, 0, 1, 1,
-0.8778414, -0.5114428, -2.503388, 1, 0, 0, 1, 1,
-0.8755385, -0.4822657, 0.9030149, 1, 0, 0, 1, 1,
-0.8716537, 0.1189508, -0.6762144, 1, 0, 0, 1, 1,
-0.8650197, -0.118776, 0.0996239, 1, 0, 0, 1, 1,
-0.8593813, -0.365042, -1.500261, 0, 0, 0, 1, 1,
-0.8524561, -0.1327847, -3.010293, 0, 0, 0, 1, 1,
-0.8514147, -0.4325027, -1.589069, 0, 0, 0, 1, 1,
-0.8419551, 0.3386244, -1.417373, 0, 0, 0, 1, 1,
-0.8413942, 0.5037391, -1.122501, 0, 0, 0, 1, 1,
-0.8374014, 1.907486, -0.4763948, 0, 0, 0, 1, 1,
-0.8321246, -0.8508599, -3.414171, 0, 0, 0, 1, 1,
-0.8285804, -1.090396, -3.150844, 1, 1, 1, 1, 1,
-0.8197291, -0.5209205, -0.8232674, 1, 1, 1, 1, 1,
-0.8159903, 0.4052368, -2.664182, 1, 1, 1, 1, 1,
-0.8157098, -1.984678, -2.565304, 1, 1, 1, 1, 1,
-0.815242, 1.459551, -2.129024, 1, 1, 1, 1, 1,
-0.8133209, -0.360572, -1.447631, 1, 1, 1, 1, 1,
-0.8123361, -1.469285, -3.102671, 1, 1, 1, 1, 1,
-0.8070177, -0.1131578, -1.939813, 1, 1, 1, 1, 1,
-0.8058094, -0.5705626, -2.570524, 1, 1, 1, 1, 1,
-0.8024808, 0.3056261, -1.159644, 1, 1, 1, 1, 1,
-0.8019436, -0.4266204, -2.612839, 1, 1, 1, 1, 1,
-0.8003995, -0.2570778, -2.150337, 1, 1, 1, 1, 1,
-0.7964908, -0.9929125, -1.469588, 1, 1, 1, 1, 1,
-0.7960023, -0.1544453, -0.9786172, 1, 1, 1, 1, 1,
-0.7900242, 0.2799036, -2.847342, 1, 1, 1, 1, 1,
-0.7887387, 1.349222, -0.05201526, 0, 0, 1, 1, 1,
-0.7846186, 3.427938, -0.4329548, 1, 0, 0, 1, 1,
-0.7834314, -0.8274339, -1.476903, 1, 0, 0, 1, 1,
-0.782275, -0.1374154, -1.709839, 1, 0, 0, 1, 1,
-0.7764972, 0.4413515, -2.241683, 1, 0, 0, 1, 1,
-0.7755682, 1.436326, -1.379154, 1, 0, 0, 1, 1,
-0.7755343, 0.9376686, 1.156441, 0, 0, 0, 1, 1,
-0.7743848, 0.1810682, -1.476559, 0, 0, 0, 1, 1,
-0.7710036, -0.9142465, -2.970149, 0, 0, 0, 1, 1,
-0.7705454, 0.4635954, -0.800149, 0, 0, 0, 1, 1,
-0.7691984, -0.9501061, -1.822811, 0, 0, 0, 1, 1,
-0.7684069, -1.674998, -2.438444, 0, 0, 0, 1, 1,
-0.7671297, -0.1600999, -1.659945, 0, 0, 0, 1, 1,
-0.7603797, 0.7375168, -0.08416606, 1, 1, 1, 1, 1,
-0.7586277, 0.8226162, -0.4672021, 1, 1, 1, 1, 1,
-0.7579642, 1.580623, -0.2966955, 1, 1, 1, 1, 1,
-0.7553606, 0.5124186, -1.196568, 1, 1, 1, 1, 1,
-0.747735, -1.123887, -2.490284, 1, 1, 1, 1, 1,
-0.7425369, 2.010394, -2.010691, 1, 1, 1, 1, 1,
-0.7356147, -0.5191424, -0.8933832, 1, 1, 1, 1, 1,
-0.7283252, 1.980655, -1.204723, 1, 1, 1, 1, 1,
-0.72808, 1.717345, -1.176919, 1, 1, 1, 1, 1,
-0.7220479, 0.6229057, 0.2916894, 1, 1, 1, 1, 1,
-0.7159846, 0.328447, -1.605676, 1, 1, 1, 1, 1,
-0.7146647, 0.4727766, -0.8052135, 1, 1, 1, 1, 1,
-0.7118674, 0.9168641, 0.0915494, 1, 1, 1, 1, 1,
-0.7041314, -0.8344486, -2.838072, 1, 1, 1, 1, 1,
-0.7011901, 0.604751, -0.289132, 1, 1, 1, 1, 1,
-0.6981789, 0.6663051, -0.7413639, 0, 0, 1, 1, 1,
-0.6940182, 0.4435899, -2.359336, 1, 0, 0, 1, 1,
-0.6877754, 0.3354826, -1.181591, 1, 0, 0, 1, 1,
-0.6853713, -0.3262638, -2.414795, 1, 0, 0, 1, 1,
-0.6784304, 0.3509489, -0.3351725, 1, 0, 0, 1, 1,
-0.678237, 0.3239985, -0.5553018, 1, 0, 0, 1, 1,
-0.6738065, -1.144374, -1.708783, 0, 0, 0, 1, 1,
-0.66896, 1.599928, -1.307177, 0, 0, 0, 1, 1,
-0.6640844, -0.8987325, -3.884314, 0, 0, 0, 1, 1,
-0.6612951, -0.4781402, -1.323376, 0, 0, 0, 1, 1,
-0.6589683, 0.1823993, -1.076079, 0, 0, 0, 1, 1,
-0.6588445, -0.4302243, -2.99397, 0, 0, 0, 1, 1,
-0.6580511, -0.257333, -1.745372, 0, 0, 0, 1, 1,
-0.6579375, -1.26037, -0.6401131, 1, 1, 1, 1, 1,
-0.6572645, 0.1236299, 0.2240082, 1, 1, 1, 1, 1,
-0.6536227, 1.599645, -1.030687, 1, 1, 1, 1, 1,
-0.6417006, 0.9502041, -1.216218, 1, 1, 1, 1, 1,
-0.6412651, 0.1051918, -0.992874, 1, 1, 1, 1, 1,
-0.6374547, -0.7201145, -1.193355, 1, 1, 1, 1, 1,
-0.6364186, -0.2265218, -1.598126, 1, 1, 1, 1, 1,
-0.6332701, -0.7286055, -2.846694, 1, 1, 1, 1, 1,
-0.6314091, -0.4179237, -1.74089, 1, 1, 1, 1, 1,
-0.6313831, 0.06546935, 0.1281567, 1, 1, 1, 1, 1,
-0.6311042, -1.642766, -1.961402, 1, 1, 1, 1, 1,
-0.6239883, 0.3754424, -0.9014889, 1, 1, 1, 1, 1,
-0.623324, -1.016412, -2.953285, 1, 1, 1, 1, 1,
-0.6195401, 1.311312, 0.4609629, 1, 1, 1, 1, 1,
-0.6182876, 1.078579, 1.336597, 1, 1, 1, 1, 1,
-0.6132464, -1.23912, -3.081046, 0, 0, 1, 1, 1,
-0.612789, 0.6698888, -1.80268, 1, 0, 0, 1, 1,
-0.6121367, 0.08166511, -2.446697, 1, 0, 0, 1, 1,
-0.611277, 0.1467725, -0.1192348, 1, 0, 0, 1, 1,
-0.6059291, -0.3460927, -2.715314, 1, 0, 0, 1, 1,
-0.5988902, 0.5384114, -1.18927, 1, 0, 0, 1, 1,
-0.5956036, 0.9726527, -1.0064, 0, 0, 0, 1, 1,
-0.5928559, -2.755972, -3.144622, 0, 0, 0, 1, 1,
-0.5924499, 1.267775, -1.195962, 0, 0, 0, 1, 1,
-0.591232, -1.036882, 0.5383031, 0, 0, 0, 1, 1,
-0.5889063, 1.536747, 0.9765399, 0, 0, 0, 1, 1,
-0.5841933, -0.658175, -1.702392, 0, 0, 0, 1, 1,
-0.5841425, 1.273833, -0.9982142, 0, 0, 0, 1, 1,
-0.5824945, 0.3156429, -0.7464448, 1, 1, 1, 1, 1,
-0.5813722, -0.438956, -0.3573996, 1, 1, 1, 1, 1,
-0.5794614, -0.2607227, -1.868238, 1, 1, 1, 1, 1,
-0.5769435, -1.145368, -3.120439, 1, 1, 1, 1, 1,
-0.569227, 0.5543433, -0.7235242, 1, 1, 1, 1, 1,
-0.5662119, 0.1803107, -0.9167337, 1, 1, 1, 1, 1,
-0.562394, -0.8141412, -1.482952, 1, 1, 1, 1, 1,
-0.5532921, 0.3522162, -1.603447, 1, 1, 1, 1, 1,
-0.5517619, 1.074543, -0.2967287, 1, 1, 1, 1, 1,
-0.5498761, 0.6690088, 0.2672938, 1, 1, 1, 1, 1,
-0.5493195, 0.5709493, 0.3357387, 1, 1, 1, 1, 1,
-0.5408348, 0.6187724, 0.6142851, 1, 1, 1, 1, 1,
-0.5367187, 0.441718, -0.8676261, 1, 1, 1, 1, 1,
-0.5335854, -1.740301, -4.672051, 1, 1, 1, 1, 1,
-0.5320328, -1.372879, -1.663692, 1, 1, 1, 1, 1,
-0.5313581, 0.9841288, 0.9530798, 0, 0, 1, 1, 1,
-0.5241504, 1.415941, 1.464434, 1, 0, 0, 1, 1,
-0.5213916, -0.6695789, -1.624196, 1, 0, 0, 1, 1,
-0.5198902, 1.411629, -3.441302, 1, 0, 0, 1, 1,
-0.5197804, 0.7659682, -1.129386, 1, 0, 0, 1, 1,
-0.5184784, -0.887623, -3.777884, 1, 0, 0, 1, 1,
-0.5154785, 0.2675562, -0.5943884, 0, 0, 0, 1, 1,
-0.51493, -0.5794505, -1.969252, 0, 0, 0, 1, 1,
-0.5083251, -0.125877, -3.775522, 0, 0, 0, 1, 1,
-0.5061285, -1.342646, -4.036403, 0, 0, 0, 1, 1,
-0.5039306, -0.6563068, -1.239152, 0, 0, 0, 1, 1,
-0.502383, 0.9518905, -0.9714769, 0, 0, 0, 1, 1,
-0.5018089, 0.3853253, -2.253781, 0, 0, 0, 1, 1,
-0.5012464, 1.142026, -1.718167, 1, 1, 1, 1, 1,
-0.4971001, -0.5570225, -2.906101, 1, 1, 1, 1, 1,
-0.4907658, -0.2755533, -1.418672, 1, 1, 1, 1, 1,
-0.4852475, -0.9973708, -1.312629, 1, 1, 1, 1, 1,
-0.485083, 1.014192, -1.23856, 1, 1, 1, 1, 1,
-0.4850306, -0.8820092, -2.461949, 1, 1, 1, 1, 1,
-0.4840766, -0.6671154, -1.452978, 1, 1, 1, 1, 1,
-0.481384, -1.454792, -3.581157, 1, 1, 1, 1, 1,
-0.4805847, -1.11213, -5.052993, 1, 1, 1, 1, 1,
-0.4796629, -0.5560138, -1.47048, 1, 1, 1, 1, 1,
-0.4789563, -0.6154283, -2.594936, 1, 1, 1, 1, 1,
-0.4786851, -0.2731855, -2.540988, 1, 1, 1, 1, 1,
-0.4761535, -1.237508, -1.838361, 1, 1, 1, 1, 1,
-0.4733924, 1.637574, -0.6234183, 1, 1, 1, 1, 1,
-0.47066, 1.338782, 1.579267, 1, 1, 1, 1, 1,
-0.4695422, 0.3792888, -1.904912, 0, 0, 1, 1, 1,
-0.4642668, 1.156843, 1.145579, 1, 0, 0, 1, 1,
-0.4641508, -1.76492, -2.945425, 1, 0, 0, 1, 1,
-0.4622679, 0.6741768, -0.2036512, 1, 0, 0, 1, 1,
-0.4607748, 0.6630468, -1.898189, 1, 0, 0, 1, 1,
-0.451376, -1.028131, -0.9706154, 1, 0, 0, 1, 1,
-0.4509257, 0.3763803, 0.219018, 0, 0, 0, 1, 1,
-0.4477795, 0.6181199, -0.2889045, 0, 0, 0, 1, 1,
-0.4455202, -0.8048922, -1.8676, 0, 0, 0, 1, 1,
-0.437192, -0.03017467, -2.201213, 0, 0, 0, 1, 1,
-0.4288034, 1.626912, 0.1817638, 0, 0, 0, 1, 1,
-0.4261362, -2.076108, -2.254843, 0, 0, 0, 1, 1,
-0.423006, -1.596506, -1.881471, 0, 0, 0, 1, 1,
-0.4202868, -0.5674751, -2.899203, 1, 1, 1, 1, 1,
-0.4197468, 0.5283448, -0.2642953, 1, 1, 1, 1, 1,
-0.412184, 1.491123, 0.5164663, 1, 1, 1, 1, 1,
-0.404645, 0.6413705, -1.003215, 1, 1, 1, 1, 1,
-0.404025, -0.8810544, -2.055944, 1, 1, 1, 1, 1,
-0.3988534, -0.6888135, -0.5863035, 1, 1, 1, 1, 1,
-0.3978803, -0.4338958, -0.2292477, 1, 1, 1, 1, 1,
-0.3952241, -0.7810683, -3.181842, 1, 1, 1, 1, 1,
-0.3902006, -1.130898, -3.622192, 1, 1, 1, 1, 1,
-0.3896605, -0.5092205, -3.098418, 1, 1, 1, 1, 1,
-0.3837669, 1.843526, 0.9134002, 1, 1, 1, 1, 1,
-0.3834245, 0.7946214, 1.243325, 1, 1, 1, 1, 1,
-0.3820563, -1.993699, -3.743205, 1, 1, 1, 1, 1,
-0.3804261, 0.1252894, -0.7161961, 1, 1, 1, 1, 1,
-0.3796841, 1.227302, -0.2851928, 1, 1, 1, 1, 1,
-0.379194, 1.471126, 0.3343297, 0, 0, 1, 1, 1,
-0.3784699, 0.2911812, 0.07584415, 1, 0, 0, 1, 1,
-0.3768961, 1.616174, 0.6588776, 1, 0, 0, 1, 1,
-0.3727485, -0.5884686, -2.684681, 1, 0, 0, 1, 1,
-0.3726493, -0.6710393, -2.027583, 1, 0, 0, 1, 1,
-0.3718591, -0.270821, -1.916622, 1, 0, 0, 1, 1,
-0.3697882, -1.357269, -3.663293, 0, 0, 0, 1, 1,
-0.3649001, -1.07929, -3.418004, 0, 0, 0, 1, 1,
-0.3606085, -2.9277, -2.548273, 0, 0, 0, 1, 1,
-0.3565024, 2.349719, -1.764065, 0, 0, 0, 1, 1,
-0.356412, 0.7929188, -0.654231, 0, 0, 0, 1, 1,
-0.3546714, -0.5402699, -1.847587, 0, 0, 0, 1, 1,
-0.3530914, -0.8100042, -3.420561, 0, 0, 0, 1, 1,
-0.3529899, 0.4987942, -2.75161, 1, 1, 1, 1, 1,
-0.3522147, 1.05015, -0.8790693, 1, 1, 1, 1, 1,
-0.3493631, -0.8613124, -4.67401, 1, 1, 1, 1, 1,
-0.3460377, -0.7199615, -2.403176, 1, 1, 1, 1, 1,
-0.3456946, 0.3878435, -1.403848, 1, 1, 1, 1, 1,
-0.3419414, -1.546943, -2.278458, 1, 1, 1, 1, 1,
-0.3381726, -0.8628953, -4.165037, 1, 1, 1, 1, 1,
-0.3307212, -0.5333441, -3.293489, 1, 1, 1, 1, 1,
-0.3293838, 1.617716, 0.01178147, 1, 1, 1, 1, 1,
-0.3256213, -0.6219516, -3.38361, 1, 1, 1, 1, 1,
-0.3114563, -1.853273, -3.057035, 1, 1, 1, 1, 1,
-0.3100253, -1.425632, -3.648013, 1, 1, 1, 1, 1,
-0.3086186, -0.2307368, -1.507181, 1, 1, 1, 1, 1,
-0.3076013, -0.3986033, -2.728639, 1, 1, 1, 1, 1,
-0.3048535, -1.49954, -2.792705, 1, 1, 1, 1, 1,
-0.3033513, -0.9940987, -2.666008, 0, 0, 1, 1, 1,
-0.3026388, -2.482693, -3.870821, 1, 0, 0, 1, 1,
-0.3007963, -1.013399, -2.999516, 1, 0, 0, 1, 1,
-0.2983477, -0.05303528, -2.288457, 1, 0, 0, 1, 1,
-0.2968336, 1.246835, 0.02565975, 1, 0, 0, 1, 1,
-0.2950952, 0.4188525, 1.112452, 1, 0, 0, 1, 1,
-0.2937588, 0.901188, -0.7442729, 0, 0, 0, 1, 1,
-0.2906635, 1.702715, -0.430723, 0, 0, 0, 1, 1,
-0.2885753, 0.2206849, 0.1604356, 0, 0, 0, 1, 1,
-0.2688602, 0.9042878, 0.3574118, 0, 0, 0, 1, 1,
-0.2685341, 3.04929, -1.047037, 0, 0, 0, 1, 1,
-0.2674377, -0.1996054, -4.052445, 0, 0, 0, 1, 1,
-0.2611197, 1.844053, -1.547117, 0, 0, 0, 1, 1,
-0.2580734, 0.4778605, -0.2019419, 1, 1, 1, 1, 1,
-0.2566356, 1.324434, 0.6362489, 1, 1, 1, 1, 1,
-0.2494008, 1.010463, -0.9831941, 1, 1, 1, 1, 1,
-0.2469011, -2.312968, -2.312668, 1, 1, 1, 1, 1,
-0.2437662, -0.6867017, -3.791666, 1, 1, 1, 1, 1,
-0.2427829, 2.071557, -1.458723, 1, 1, 1, 1, 1,
-0.2416509, -0.4236006, -0.8200707, 1, 1, 1, 1, 1,
-0.2384641, 0.866853, -1.716843, 1, 1, 1, 1, 1,
-0.2360106, 0.2338068, -1.8413, 1, 1, 1, 1, 1,
-0.2331374, 0.9773685, -1.794634, 1, 1, 1, 1, 1,
-0.2308752, 0.4894107, -0.4610883, 1, 1, 1, 1, 1,
-0.2301048, 1.21374, -0.4886588, 1, 1, 1, 1, 1,
-0.2290207, 0.9231099, -0.1065685, 1, 1, 1, 1, 1,
-0.2278443, 1.122265, -0.6059351, 1, 1, 1, 1, 1,
-0.2276983, -1.151604, -2.300958, 1, 1, 1, 1, 1,
-0.2273295, 0.1242407, -0.7672091, 0, 0, 1, 1, 1,
-0.2138732, -1.106202, -1.881118, 1, 0, 0, 1, 1,
-0.213416, -0.8697761, -4.66272, 1, 0, 0, 1, 1,
-0.2123481, 2.612234, 0.1795089, 1, 0, 0, 1, 1,
-0.2104214, 0.05910785, -1.901358, 1, 0, 0, 1, 1,
-0.2076067, -0.3926504, -2.182085, 1, 0, 0, 1, 1,
-0.20729, -0.4403879, -0.3174138, 0, 0, 0, 1, 1,
-0.2072024, -1.011399, -2.042511, 0, 0, 0, 1, 1,
-0.2071585, 0.4174154, 0.4754875, 0, 0, 0, 1, 1,
-0.2049778, 0.4538055, -0.005304422, 0, 0, 0, 1, 1,
-0.2032626, 1.256707, 1.503147, 0, 0, 0, 1, 1,
-0.1951047, 0.02822884, -1.608896, 0, 0, 0, 1, 1,
-0.1949553, -2.208514, -2.605645, 0, 0, 0, 1, 1,
-0.1932621, -0.05676086, -0.2113834, 1, 1, 1, 1, 1,
-0.188739, -1.183052, -4.426654, 1, 1, 1, 1, 1,
-0.1870741, -0.2800606, -4.106421, 1, 1, 1, 1, 1,
-0.1868203, 1.594258, -0.816204, 1, 1, 1, 1, 1,
-0.1854054, -0.2249913, -2.218106, 1, 1, 1, 1, 1,
-0.1814238, -1.239519, -1.817992, 1, 1, 1, 1, 1,
-0.1800331, -2.028943, -3.340948, 1, 1, 1, 1, 1,
-0.1799842, -0.0003122026, -1.52796, 1, 1, 1, 1, 1,
-0.1785025, -0.4395244, -2.241211, 1, 1, 1, 1, 1,
-0.1777166, 1.13855, -0.8450087, 1, 1, 1, 1, 1,
-0.1767893, 0.9653032, -0.3344478, 1, 1, 1, 1, 1,
-0.1764845, -1.84824, -2.695027, 1, 1, 1, 1, 1,
-0.1750445, -0.8520174, -2.835841, 1, 1, 1, 1, 1,
-0.1744138, 0.6736472, -1.133313, 1, 1, 1, 1, 1,
-0.1735518, -1.257356, -3.367756, 1, 1, 1, 1, 1,
-0.1720831, -0.3694167, -1.011169, 0, 0, 1, 1, 1,
-0.1717606, -0.9474723, -2.641439, 1, 0, 0, 1, 1,
-0.1695769, -0.01671612, -2.17236, 1, 0, 0, 1, 1,
-0.1671048, 2.210269, -0.3314447, 1, 0, 0, 1, 1,
-0.1669401, -0.03757754, -1.845926, 1, 0, 0, 1, 1,
-0.1666346, -1.101129, -3.166774, 1, 0, 0, 1, 1,
-0.1637885, -0.899433, -4.510237, 0, 0, 0, 1, 1,
-0.1621336, -0.691689, -2.400814, 0, 0, 0, 1, 1,
-0.1619315, -0.5763455, -2.373145, 0, 0, 0, 1, 1,
-0.1611862, 1.302448, 0.3832014, 0, 0, 0, 1, 1,
-0.1571872, 0.2619132, 0.8461221, 0, 0, 0, 1, 1,
-0.1556111, 0.07177999, -0.5716506, 0, 0, 0, 1, 1,
-0.1496235, 0.2347597, -2.190272, 0, 0, 0, 1, 1,
-0.1493434, -0.815605, -2.165314, 1, 1, 1, 1, 1,
-0.1480554, -1.423513, -3.40965, 1, 1, 1, 1, 1,
-0.1442813, -0.6509723, -2.66045, 1, 1, 1, 1, 1,
-0.1414043, -1.17129, -3.580001, 1, 1, 1, 1, 1,
-0.1342604, 0.135171, -1.40913, 1, 1, 1, 1, 1,
-0.1329275, 1.026552, 1.188688, 1, 1, 1, 1, 1,
-0.1315629, 1.503944, 0.1784023, 1, 1, 1, 1, 1,
-0.1310581, -0.7085168, -3.49653, 1, 1, 1, 1, 1,
-0.123329, 0.9621942, -2.54761, 1, 1, 1, 1, 1,
-0.1202453, -0.9325225, -1.21825, 1, 1, 1, 1, 1,
-0.1196831, -0.444123, -3.715324, 1, 1, 1, 1, 1,
-0.1187141, 0.4898077, 0.004999479, 1, 1, 1, 1, 1,
-0.1170712, 0.4309008, 0.2051857, 1, 1, 1, 1, 1,
-0.1170036, 0.1800338, -0.520708, 1, 1, 1, 1, 1,
-0.1104958, 0.6027041, -1.813511, 1, 1, 1, 1, 1,
-0.1089051, -0.1106257, -1.691706, 0, 0, 1, 1, 1,
-0.1082394, 0.1658998, -1.137952, 1, 0, 0, 1, 1,
-0.1073294, 1.289684, 0.09709385, 1, 0, 0, 1, 1,
-0.1030749, -1.094594, -3.528187, 1, 0, 0, 1, 1,
-0.09940587, 0.3306821, -0.1142565, 1, 0, 0, 1, 1,
-0.09769659, -0.3199886, -3.202906, 1, 0, 0, 1, 1,
-0.09461922, -1.07418, -2.592711, 0, 0, 0, 1, 1,
-0.09291667, -0.2137632, -2.97541, 0, 0, 0, 1, 1,
-0.09255055, -0.6567571, -2.262982, 0, 0, 0, 1, 1,
-0.09134018, 1.806805, -0.8215283, 0, 0, 0, 1, 1,
-0.09003008, 0.7015269, -0.6605945, 0, 0, 0, 1, 1,
-0.08966555, 1.431663, -0.9051962, 0, 0, 0, 1, 1,
-0.08434816, -0.9277454, -4.866692, 0, 0, 0, 1, 1,
-0.0837064, -0.2224543, -3.772007, 1, 1, 1, 1, 1,
-0.08365713, 0.4602768, -0.5945115, 1, 1, 1, 1, 1,
-0.07541351, 1.28176, -0.2036156, 1, 1, 1, 1, 1,
-0.07482279, 2.180634, -0.47591, 1, 1, 1, 1, 1,
-0.07293799, -0.6555508, -2.425812, 1, 1, 1, 1, 1,
-0.06975163, -0.3158873, -2.836453, 1, 1, 1, 1, 1,
-0.06280252, -1.064249, -3.001865, 1, 1, 1, 1, 1,
-0.05952721, 1.27311, 1.431393, 1, 1, 1, 1, 1,
-0.05863721, -1.779138, -5.638818, 1, 1, 1, 1, 1,
-0.05429306, -0.0183646, -0.3919683, 1, 1, 1, 1, 1,
-0.05303944, -0.4151489, -2.594937, 1, 1, 1, 1, 1,
-0.05111759, 0.06047564, -1.937794, 1, 1, 1, 1, 1,
-0.05014625, -0.171368, -2.599006, 1, 1, 1, 1, 1,
-0.04306265, -1.325897, -3.100214, 1, 1, 1, 1, 1,
-0.04229899, -0.2867782, -3.642542, 1, 1, 1, 1, 1,
-0.04049042, -0.5848365, -4.105184, 0, 0, 1, 1, 1,
-0.03746627, 1.491194, -1.280419, 1, 0, 0, 1, 1,
-0.03347648, -0.2987921, -2.890005, 1, 0, 0, 1, 1,
-0.03305899, 1.018501, 0.09696567, 1, 0, 0, 1, 1,
-0.02962393, 1.195117, 0.4248559, 1, 0, 0, 1, 1,
-0.02761398, 2.070719, 0.06227067, 1, 0, 0, 1, 1,
-0.02705436, -1.736347, -1.137655, 0, 0, 0, 1, 1,
-0.02666574, -1.210192, -3.679964, 0, 0, 0, 1, 1,
-0.01886502, 0.2341146, -0.5044472, 0, 0, 0, 1, 1,
-0.0179748, -1.53249, -5.74611, 0, 0, 0, 1, 1,
-0.01662025, 2.059322, 0.1773407, 0, 0, 0, 1, 1,
-0.01405266, -1.331418, -2.145848, 0, 0, 0, 1, 1,
-0.01247157, -1.966316, -3.208363, 0, 0, 0, 1, 1,
-0.01234277, 0.5560532, 0.3837779, 1, 1, 1, 1, 1,
-0.01161918, 0.2278867, 0.1641639, 1, 1, 1, 1, 1,
-0.01078941, 0.4635171, 0.2775747, 1, 1, 1, 1, 1,
-0.01068152, 0.4341692, 1.142812, 1, 1, 1, 1, 1,
-0.009747414, -1.46264, -4.026903, 1, 1, 1, 1, 1,
-0.006064907, -1.22709, -3.813518, 1, 1, 1, 1, 1,
-0.00406124, 0.6157015, 0.8047086, 1, 1, 1, 1, 1,
-0.002341333, 0.1799069, -1.093426, 1, 1, 1, 1, 1,
-0.0007684531, 0.4165298, 1.19478, 1, 1, 1, 1, 1,
0.001663942, -0.1926438, 2.372303, 1, 1, 1, 1, 1,
0.00267026, -1.011924, 1.000622, 1, 1, 1, 1, 1,
0.01716622, 0.3319107, -0.3176133, 1, 1, 1, 1, 1,
0.01871752, -2.477249, 4.73027, 1, 1, 1, 1, 1,
0.0203683, 1.578276, 0.3202465, 1, 1, 1, 1, 1,
0.02145489, -0.2739758, 3.178688, 1, 1, 1, 1, 1,
0.02177666, -1.979119, 1.004294, 0, 0, 1, 1, 1,
0.02325891, 0.7100502, -0.2966029, 1, 0, 0, 1, 1,
0.02726834, -0.04546235, 1.773911, 1, 0, 0, 1, 1,
0.02830409, 0.2194405, -1.010703, 1, 0, 0, 1, 1,
0.02992393, -0.2147289, 1.983276, 1, 0, 0, 1, 1,
0.03009779, 0.3460946, -0.8681855, 1, 0, 0, 1, 1,
0.03027586, 0.5205672, 0.4464821, 0, 0, 0, 1, 1,
0.03204249, 0.1414444, 0.5431269, 0, 0, 0, 1, 1,
0.03463408, 0.7888455, -0.5714659, 0, 0, 0, 1, 1,
0.03607219, 1.294397, -0.3135899, 0, 0, 0, 1, 1,
0.03723692, 1.191815, -0.7563846, 0, 0, 0, 1, 1,
0.0375453, 1.888091, -0.07275264, 0, 0, 0, 1, 1,
0.04034384, -1.075171, 2.914873, 0, 0, 0, 1, 1,
0.04279433, -0.8592706, 3.330472, 1, 1, 1, 1, 1,
0.04319311, -1.229549, 1.772984, 1, 1, 1, 1, 1,
0.04937949, 0.7026363, 1.104062, 1, 1, 1, 1, 1,
0.05126437, -0.4794392, 3.325317, 1, 1, 1, 1, 1,
0.05252307, -1.778968, 1.754194, 1, 1, 1, 1, 1,
0.05335276, -0.298411, 4.55252, 1, 1, 1, 1, 1,
0.05351767, 0.6093935, 0.7176827, 1, 1, 1, 1, 1,
0.05407192, -1.115029, 2.282431, 1, 1, 1, 1, 1,
0.05632537, 2.804969, 1.792948, 1, 1, 1, 1, 1,
0.05676935, -1.310843, 1.513787, 1, 1, 1, 1, 1,
0.05709575, 0.002443357, 3.643612, 1, 1, 1, 1, 1,
0.05717644, 1.173883, 0.03855953, 1, 1, 1, 1, 1,
0.05937044, 2.980543, 0.1519571, 1, 1, 1, 1, 1,
0.06020463, 0.02637193, 1.63949, 1, 1, 1, 1, 1,
0.0620543, -1.373805, 2.409028, 1, 1, 1, 1, 1,
0.06315956, 0.05503348, -0.307497, 0, 0, 1, 1, 1,
0.06539404, 0.7532912, -0.06947863, 1, 0, 0, 1, 1,
0.06856279, 0.4262852, 0.08375558, 1, 0, 0, 1, 1,
0.06874278, 0.4775828, 1.166678, 1, 0, 0, 1, 1,
0.07226404, 0.2698303, -1.251653, 1, 0, 0, 1, 1,
0.072616, -1.331207, 2.888682, 1, 0, 0, 1, 1,
0.07805029, -0.9315043, 2.294846, 0, 0, 0, 1, 1,
0.08024842, -0.6180915, 3.009422, 0, 0, 0, 1, 1,
0.08189524, -0.05361658, 2.80804, 0, 0, 0, 1, 1,
0.08237448, 1.474177, -0.6552473, 0, 0, 0, 1, 1,
0.08957215, 0.7072807, 1.21916, 0, 0, 0, 1, 1,
0.09166805, 2.673813, 0.8753193, 0, 0, 0, 1, 1,
0.09202029, -0.08211132, 2.860673, 0, 0, 0, 1, 1,
0.09314763, 0.185668, 2.106711, 1, 1, 1, 1, 1,
0.09405812, -0.08397288, 2.808117, 1, 1, 1, 1, 1,
0.0948149, -0.9335255, 2.038569, 1, 1, 1, 1, 1,
0.09833205, -1.024464, 4.384577, 1, 1, 1, 1, 1,
0.09878893, -0.08498283, 0.5285017, 1, 1, 1, 1, 1,
0.1081741, -0.4425155, 2.380604, 1, 1, 1, 1, 1,
0.114752, 0.8236523, -0.4912225, 1, 1, 1, 1, 1,
0.1154412, -0.3909597, 2.638807, 1, 1, 1, 1, 1,
0.1220467, 0.1246324, 1.827913, 1, 1, 1, 1, 1,
0.1235469, -0.05444594, -0.03268604, 1, 1, 1, 1, 1,
0.1278715, 0.9002962, 0.6882443, 1, 1, 1, 1, 1,
0.1295716, -1.094025, 2.604736, 1, 1, 1, 1, 1,
0.13032, -0.8348431, 1.420303, 1, 1, 1, 1, 1,
0.1305947, -1.409965, 3.532087, 1, 1, 1, 1, 1,
0.134017, -1.000201, 2.208301, 1, 1, 1, 1, 1,
0.1346531, -0.6746784, 3.806437, 0, 0, 1, 1, 1,
0.1356117, 1.665585, 0.09796001, 1, 0, 0, 1, 1,
0.1356609, 1.412984, 0.6292352, 1, 0, 0, 1, 1,
0.1388159, 0.2803097, -1.261703, 1, 0, 0, 1, 1,
0.1474829, -0.7829078, 3.867483, 1, 0, 0, 1, 1,
0.1509081, 1.636332, 0.5620173, 1, 0, 0, 1, 1,
0.1551422, -0.7340659, 4.610411, 0, 0, 0, 1, 1,
0.1570523, -0.2380291, 3.731898, 0, 0, 0, 1, 1,
0.1585367, -0.2544427, 0.889935, 0, 0, 0, 1, 1,
0.1617142, 0.1706053, 0.5886158, 0, 0, 0, 1, 1,
0.1644024, -0.3400556, 3.708119, 0, 0, 0, 1, 1,
0.1680886, -0.4480557, 2.010204, 0, 0, 0, 1, 1,
0.1708352, -0.556085, 2.149001, 0, 0, 0, 1, 1,
0.1715709, 0.2269904, 0.09828774, 1, 1, 1, 1, 1,
0.1790727, -1.514741, 2.272078, 1, 1, 1, 1, 1,
0.183706, -2.022382, 2.075468, 1, 1, 1, 1, 1,
0.1837907, 0.1723286, 1.132197, 1, 1, 1, 1, 1,
0.1881241, 0.6911853, 0.1112341, 1, 1, 1, 1, 1,
0.1895344, -0.610086, 3.62695, 1, 1, 1, 1, 1,
0.1913271, -0.2935107, 4.810546, 1, 1, 1, 1, 1,
0.1933493, 0.5543624, -0.9895051, 1, 1, 1, 1, 1,
0.1939031, -0.2408743, 4.444698, 1, 1, 1, 1, 1,
0.1944144, 0.7220616, 0.1763976, 1, 1, 1, 1, 1,
0.1966101, 0.1926545, 0.2915681, 1, 1, 1, 1, 1,
0.2016261, -1.583912, 1.392645, 1, 1, 1, 1, 1,
0.2025734, 0.6249869, 0.7322874, 1, 1, 1, 1, 1,
0.2035718, -0.3115498, 3.216001, 1, 1, 1, 1, 1,
0.2056652, 0.6596594, -0.1025385, 1, 1, 1, 1, 1,
0.2153096, -0.185653, 3.852634, 0, 0, 1, 1, 1,
0.2173571, 1.756775, -0.2415386, 1, 0, 0, 1, 1,
0.2200969, -0.5091093, 3.9063, 1, 0, 0, 1, 1,
0.220331, -0.3817241, 2.019931, 1, 0, 0, 1, 1,
0.2206523, 0.6309087, -0.7736741, 1, 0, 0, 1, 1,
0.2226319, -1.82991, 1.707999, 1, 0, 0, 1, 1,
0.2258942, 0.4142235, 0.8017291, 0, 0, 0, 1, 1,
0.2339003, 0.8277504, -0.09516785, 0, 0, 0, 1, 1,
0.2367475, 1.406834, -0.3253677, 0, 0, 0, 1, 1,
0.2405913, 1.837965, 0.645947, 0, 0, 0, 1, 1,
0.2425361, 1.028688, -0.849433, 0, 0, 0, 1, 1,
0.2437183, -0.1596299, 1.398144, 0, 0, 0, 1, 1,
0.2465038, 0.6609733, -0.1820151, 0, 0, 0, 1, 1,
0.2476443, 1.756443, -0.9409754, 1, 1, 1, 1, 1,
0.2481582, 0.4151891, -0.08211759, 1, 1, 1, 1, 1,
0.2500735, -1.309225, 0.7682855, 1, 1, 1, 1, 1,
0.2502424, -0.3493916, 2.185225, 1, 1, 1, 1, 1,
0.2527587, -1.633239, 3.30874, 1, 1, 1, 1, 1,
0.253613, -1.000059, 4.252943, 1, 1, 1, 1, 1,
0.2547426, -0.0898808, 2.656067, 1, 1, 1, 1, 1,
0.2576411, 0.3448248, 3.303211, 1, 1, 1, 1, 1,
0.2581576, 1.056171, -0.4057558, 1, 1, 1, 1, 1,
0.2584935, -0.5204886, 2.496351, 1, 1, 1, 1, 1,
0.2642286, 0.112404, 1.634659, 1, 1, 1, 1, 1,
0.2673948, -1.191296, 4.595404, 1, 1, 1, 1, 1,
0.2699042, -0.04537032, 1.50892, 1, 1, 1, 1, 1,
0.2703032, -1.974266, 2.589384, 1, 1, 1, 1, 1,
0.2776926, -0.5542351, 2.793884, 1, 1, 1, 1, 1,
0.2800689, 0.6070087, -0.4577632, 0, 0, 1, 1, 1,
0.2812363, -1.002291, 2.744584, 1, 0, 0, 1, 1,
0.283262, 0.4339156, -0.3815274, 1, 0, 0, 1, 1,
0.2847467, -0.3470101, 1.940712, 1, 0, 0, 1, 1,
0.287001, -0.4668571, 3.488719, 1, 0, 0, 1, 1,
0.2967678, 0.5609719, -0.8107205, 1, 0, 0, 1, 1,
0.2985671, -0.4101575, 3.303191, 0, 0, 0, 1, 1,
0.2990165, -2.171618, 3.39118, 0, 0, 0, 1, 1,
0.2996247, 0.8615281, 0.06374099, 0, 0, 0, 1, 1,
0.3015909, 0.3420338, 0.6968898, 0, 0, 0, 1, 1,
0.3018907, 1.373539, 0.2118497, 0, 0, 0, 1, 1,
0.3070135, 1.644053, -0.5307768, 0, 0, 0, 1, 1,
0.3085555, 1.139006, 0.2695735, 0, 0, 0, 1, 1,
0.3104268, -1.605828, 2.256503, 1, 1, 1, 1, 1,
0.3116804, 0.4259252, 1.87383, 1, 1, 1, 1, 1,
0.3123466, -3.030703, 0.6558546, 1, 1, 1, 1, 1,
0.3132356, -2.51378, 0.9694973, 1, 1, 1, 1, 1,
0.3176578, 0.5832501, 0.7799916, 1, 1, 1, 1, 1,
0.3181277, 0.5638142, 1.284329, 1, 1, 1, 1, 1,
0.3247393, 0.4199898, 1.508964, 1, 1, 1, 1, 1,
0.3259824, -1.294895, 3.505917, 1, 1, 1, 1, 1,
0.3293271, -0.4258654, 2.967685, 1, 1, 1, 1, 1,
0.3361192, -0.3508876, 2.432101, 1, 1, 1, 1, 1,
0.3372685, -0.9991776, 3.707921, 1, 1, 1, 1, 1,
0.3423851, -0.1197924, 1.937481, 1, 1, 1, 1, 1,
0.3457538, -0.4093331, 3.598582, 1, 1, 1, 1, 1,
0.3490514, 0.6660668, 1.94978, 1, 1, 1, 1, 1,
0.3495383, 0.1799947, 1.972468, 1, 1, 1, 1, 1,
0.357802, -0.01248805, 1.618886, 0, 0, 1, 1, 1,
0.358771, -0.2354112, 3.262064, 1, 0, 0, 1, 1,
0.3591965, -0.6256093, 3.212595, 1, 0, 0, 1, 1,
0.3600951, 0.2852412, 0.1072616, 1, 0, 0, 1, 1,
0.3608082, 1.048217, -1.157607, 1, 0, 0, 1, 1,
0.3628047, 1.040378, 1.532649, 1, 0, 0, 1, 1,
0.3629585, 0.5441881, -0.8260375, 0, 0, 0, 1, 1,
0.369265, -2.086896, 4.245862, 0, 0, 0, 1, 1,
0.373638, -0.8831963, 2.158515, 0, 0, 0, 1, 1,
0.3738889, -0.04540631, 1.244466, 0, 0, 0, 1, 1,
0.3751808, -0.2562786, 3.044886, 0, 0, 0, 1, 1,
0.3756373, 0.9201968, -0.1917628, 0, 0, 0, 1, 1,
0.3774064, -0.6423054, 0.712854, 0, 0, 0, 1, 1,
0.3867402, 1.167846, 1.649536, 1, 1, 1, 1, 1,
0.3922504, -2.283287, 2.84742, 1, 1, 1, 1, 1,
0.3947845, 1.108288, 0.2701023, 1, 1, 1, 1, 1,
0.3962454, 0.2644231, 1.393602, 1, 1, 1, 1, 1,
0.3975025, 0.07950721, 2.356468, 1, 1, 1, 1, 1,
0.3986237, -2.651794, 3.34884, 1, 1, 1, 1, 1,
0.4014528, -1.230614, 3.281296, 1, 1, 1, 1, 1,
0.4075326, 0.01839631, 1.625333, 1, 1, 1, 1, 1,
0.4095589, 0.6036598, -0.7654909, 1, 1, 1, 1, 1,
0.4101466, -0.305786, 2.300174, 1, 1, 1, 1, 1,
0.4110286, -2.147603, 3.012343, 1, 1, 1, 1, 1,
0.4120409, -0.3618157, 3.104237, 1, 1, 1, 1, 1,
0.4228302, 0.3624939, 1.479508, 1, 1, 1, 1, 1,
0.4248012, -0.3456863, 1.968343, 1, 1, 1, 1, 1,
0.431143, -0.5469124, 4.005628, 1, 1, 1, 1, 1,
0.4313613, -0.9355249, 3.702733, 0, 0, 1, 1, 1,
0.43185, -0.7057735, 2.18628, 1, 0, 0, 1, 1,
0.4372426, -0.8924753, 3.489214, 1, 0, 0, 1, 1,
0.4391828, -1.190272, 1.614084, 1, 0, 0, 1, 1,
0.4497283, 0.1766709, 2.663256, 1, 0, 0, 1, 1,
0.4501496, -0.7647352, 2.607944, 1, 0, 0, 1, 1,
0.4583523, -0.4196748, 2.776853, 0, 0, 0, 1, 1,
0.4624394, 1.059866, 1.607321, 0, 0, 0, 1, 1,
0.4638444, 0.004910403, 0.3317438, 0, 0, 0, 1, 1,
0.4645185, -1.305781, 2.686808, 0, 0, 0, 1, 1,
0.4684291, 1.112583, 1.03654, 0, 0, 0, 1, 1,
0.4689403, -0.776549, 2.254393, 0, 0, 0, 1, 1,
0.4697239, 0.2996502, 1.467551, 0, 0, 0, 1, 1,
0.4743426, -0.07087462, 1.344215, 1, 1, 1, 1, 1,
0.4821421, 0.1177647, 2.188771, 1, 1, 1, 1, 1,
0.4833207, 1.088924, 0.3347466, 1, 1, 1, 1, 1,
0.4938375, 1.348309, 2.431597, 1, 1, 1, 1, 1,
0.4973407, 0.03836387, 1.632457, 1, 1, 1, 1, 1,
0.4977899, 0.05610118, 2.00305, 1, 1, 1, 1, 1,
0.498172, 0.5305349, 1.790908, 1, 1, 1, 1, 1,
0.5091313, -0.665277, 1.988857, 1, 1, 1, 1, 1,
0.5131375, -0.9666558, 3.590325, 1, 1, 1, 1, 1,
0.5155948, -0.265252, 3.608593, 1, 1, 1, 1, 1,
0.5170702, 2.266064, 0.4807151, 1, 1, 1, 1, 1,
0.5188193, 0.8800437, -0.3710553, 1, 1, 1, 1, 1,
0.5200384, 0.8677623, 0.2830719, 1, 1, 1, 1, 1,
0.5274353, 0.0972198, 2.227142, 1, 1, 1, 1, 1,
0.5307487, -0.1283554, 1.140358, 1, 1, 1, 1, 1,
0.5321509, 1.489209, 1.528308, 0, 0, 1, 1, 1,
0.5413121, -1.998803, 2.590245, 1, 0, 0, 1, 1,
0.5431804, 0.7449756, 0.5435805, 1, 0, 0, 1, 1,
0.545441, 0.8621348, -0.6066857, 1, 0, 0, 1, 1,
0.5475232, 1.812571, 0.7584248, 1, 0, 0, 1, 1,
0.5482512, 1.897223, -0.8713699, 1, 0, 0, 1, 1,
0.5487967, 1.31759, 1.066136, 0, 0, 0, 1, 1,
0.5518814, -0.1739426, 3.484436, 0, 0, 0, 1, 1,
0.5527014, -1.019351, 1.58717, 0, 0, 0, 1, 1,
0.5543149, -0.7264341, 2.336026, 0, 0, 0, 1, 1,
0.5602657, 0.1800011, -0.1621196, 0, 0, 0, 1, 1,
0.5624503, -0.1774526, 2.433151, 0, 0, 0, 1, 1,
0.5723355, 0.5504553, 1.244385, 0, 0, 0, 1, 1,
0.5992758, -1.023436, 2.261409, 1, 1, 1, 1, 1,
0.6020508, -0.4883111, 1.916099, 1, 1, 1, 1, 1,
0.6051536, -0.2242214, 1.496473, 1, 1, 1, 1, 1,
0.605958, -0.1432442, 0.6191993, 1, 1, 1, 1, 1,
0.6081101, -1.144903, 5.411117, 1, 1, 1, 1, 1,
0.6086482, 0.7699785, 0.1631221, 1, 1, 1, 1, 1,
0.6121739, -0.09142985, 0.4255994, 1, 1, 1, 1, 1,
0.613149, -0.3915992, 1.545847, 1, 1, 1, 1, 1,
0.6204662, -0.01901726, 1.691651, 1, 1, 1, 1, 1,
0.6215847, 0.5446253, 1.262387, 1, 1, 1, 1, 1,
0.6242129, 1.093093, 1.036949, 1, 1, 1, 1, 1,
0.6301479, -3.201952, 3.901488, 1, 1, 1, 1, 1,
0.6355507, 1.19994, -1.463045, 1, 1, 1, 1, 1,
0.6374593, -0.3964703, 1.274957, 1, 1, 1, 1, 1,
0.642045, 0.3912608, 0.2689085, 1, 1, 1, 1, 1,
0.6457764, -1.689849, 1.489571, 0, 0, 1, 1, 1,
0.648407, 1.233841, -1.197547, 1, 0, 0, 1, 1,
0.6486855, -0.2375789, 0.5620223, 1, 0, 0, 1, 1,
0.652453, 0.9865035, 0.2524526, 1, 0, 0, 1, 1,
0.6535946, 0.6243528, -1.271723, 1, 0, 0, 1, 1,
0.6548756, -1.217899, 2.361257, 1, 0, 0, 1, 1,
0.6551417, 0.4984834, -0.4632255, 0, 0, 0, 1, 1,
0.6660985, -1.301333, 1.563355, 0, 0, 0, 1, 1,
0.6670915, -1.986118, 2.046639, 0, 0, 0, 1, 1,
0.6726186, -0.2092079, 1.167197, 0, 0, 0, 1, 1,
0.6735301, -0.4350673, 3.589213, 0, 0, 0, 1, 1,
0.6763636, -1.954155, 2.254364, 0, 0, 0, 1, 1,
0.677497, -0.8919483, 3.03117, 0, 0, 0, 1, 1,
0.6821415, 0.525592, 2.320331, 1, 1, 1, 1, 1,
0.7000287, 0.8825662, 0.1622338, 1, 1, 1, 1, 1,
0.7029188, 0.5203537, 0.5192186, 1, 1, 1, 1, 1,
0.7065111, -1.259442, 2.429184, 1, 1, 1, 1, 1,
0.7220538, 1.171793, 1.18749, 1, 1, 1, 1, 1,
0.7254675, -0.7389418, 2.20794, 1, 1, 1, 1, 1,
0.7273839, 0.3407185, 1.052701, 1, 1, 1, 1, 1,
0.7313629, 0.8240592, -1.149017, 1, 1, 1, 1, 1,
0.7333891, -0.5047334, 2.143671, 1, 1, 1, 1, 1,
0.7343559, -1.920326, 3.192168, 1, 1, 1, 1, 1,
0.7386847, 1.488631, -0.9500095, 1, 1, 1, 1, 1,
0.7442619, 0.2305734, 0.6512785, 1, 1, 1, 1, 1,
0.7452046, -1.56395, 1.7206, 1, 1, 1, 1, 1,
0.7459308, 0.08324153, 3.612793, 1, 1, 1, 1, 1,
0.7499479, -0.6483681, 3.628524, 1, 1, 1, 1, 1,
0.7505062, 1.025454, 0.5417565, 0, 0, 1, 1, 1,
0.7515569, 0.5122674, 0.0514381, 1, 0, 0, 1, 1,
0.7521881, 0.5818906, 0.2906329, 1, 0, 0, 1, 1,
0.7625149, 0.0711875, 0.4759345, 1, 0, 0, 1, 1,
0.7630719, -0.1656561, 1.304243, 1, 0, 0, 1, 1,
0.7639302, 0.341996, 0.7177169, 1, 0, 0, 1, 1,
0.7680122, 0.3161432, -0.5679233, 0, 0, 0, 1, 1,
0.7688773, -1.560631, 3.481554, 0, 0, 0, 1, 1,
0.7703975, -1.46301, 2.51859, 0, 0, 0, 1, 1,
0.7747796, 0.5494358, 1.528532, 0, 0, 0, 1, 1,
0.7752357, 0.1121557, 2.196678, 0, 0, 0, 1, 1,
0.7810527, -0.4608098, 2.776613, 0, 0, 0, 1, 1,
0.7815677, -1.617268, 2.46755, 0, 0, 0, 1, 1,
0.7864774, -0.6034038, 2.037489, 1, 1, 1, 1, 1,
0.7873189, -0.8008429, 3.547747, 1, 1, 1, 1, 1,
0.7930715, -0.5672479, 0.7508681, 1, 1, 1, 1, 1,
0.7931287, -0.09398585, 1.681401, 1, 1, 1, 1, 1,
0.7937363, -0.06116343, 2.121491, 1, 1, 1, 1, 1,
0.8031842, 1.588777, -0.2710489, 1, 1, 1, 1, 1,
0.8034183, -0.6556243, 2.599067, 1, 1, 1, 1, 1,
0.8036566, 1.144061, 1.737162, 1, 1, 1, 1, 1,
0.8047984, 1.554591, 0.7234145, 1, 1, 1, 1, 1,
0.8048321, -0.5283232, 1.328665, 1, 1, 1, 1, 1,
0.808682, -0.4991631, 2.890557, 1, 1, 1, 1, 1,
0.8132599, 1.340413, 1.053081, 1, 1, 1, 1, 1,
0.8138568, -0.2056083, 1.913719, 1, 1, 1, 1, 1,
0.8161067, 0.787747, 0.7605978, 1, 1, 1, 1, 1,
0.8194972, 1.847664, -0.8034394, 1, 1, 1, 1, 1,
0.819832, 0.4610354, 1.126573, 0, 0, 1, 1, 1,
0.8231041, 0.7571504, 1.552082, 1, 0, 0, 1, 1,
0.8275532, -0.8369109, 4.319789, 1, 0, 0, 1, 1,
0.8374393, -1.033695, 1.904423, 1, 0, 0, 1, 1,
0.8390491, -0.5527862, 2.086655, 1, 0, 0, 1, 1,
0.8577908, -0.4414568, 1.646719, 1, 0, 0, 1, 1,
0.858893, 0.9432985, 1.666952, 0, 0, 0, 1, 1,
0.8652756, 1.542431, 2.097775, 0, 0, 0, 1, 1,
0.8653004, -1.289148, 4.070705, 0, 0, 0, 1, 1,
0.8712917, 0.4710177, 1.240567, 0, 0, 0, 1, 1,
0.8827319, 0.3068454, 1.342615, 0, 0, 0, 1, 1,
0.8836053, 0.2036409, 2.581683, 0, 0, 0, 1, 1,
0.8895591, -1.270855, 2.908934, 0, 0, 0, 1, 1,
0.8924127, -0.06933848, 1.639173, 1, 1, 1, 1, 1,
0.8932788, 0.6921766, 0.8019184, 1, 1, 1, 1, 1,
0.8937492, -1.134176, 2.118839, 1, 1, 1, 1, 1,
0.8966563, 0.373387, 0.7193407, 1, 1, 1, 1, 1,
0.8977559, 1.072751, 1.120875, 1, 1, 1, 1, 1,
0.9097375, -2.468582, 4.309481, 1, 1, 1, 1, 1,
0.9197456, 0.362141, 1.937523, 1, 1, 1, 1, 1,
0.9287529, 1.706672, -1.327002, 1, 1, 1, 1, 1,
0.9319847, -0.8676404, 1.836417, 1, 1, 1, 1, 1,
0.9338098, -0.4746949, 1.994542, 1, 1, 1, 1, 1,
0.9356019, -0.4371875, 2.308676, 1, 1, 1, 1, 1,
0.9361147, 0.7386792, -0.04336398, 1, 1, 1, 1, 1,
0.938071, 0.4168382, 2.371926, 1, 1, 1, 1, 1,
0.9402463, -0.5179728, 1.481445, 1, 1, 1, 1, 1,
0.946879, -2.154978, 4.263213, 1, 1, 1, 1, 1,
0.9497864, 0.1307185, 0.4987051, 0, 0, 1, 1, 1,
0.9587244, -0.3223515, 1.468348, 1, 0, 0, 1, 1,
0.9616479, -1.007785, 2.758715, 1, 0, 0, 1, 1,
0.9625683, -1.593727, 2.776783, 1, 0, 0, 1, 1,
0.9637405, 0.5826001, 1.517386, 1, 0, 0, 1, 1,
0.9642001, 0.837208, 1.044354, 1, 0, 0, 1, 1,
0.9700986, 2.190247, -0.626568, 0, 0, 0, 1, 1,
0.9718113, -1.172451, 2.181352, 0, 0, 0, 1, 1,
0.9735569, 0.7918378, -0.7022912, 0, 0, 0, 1, 1,
0.9737061, -1.762532, 3.686651, 0, 0, 0, 1, 1,
0.9776373, 0.9924193, -1.26714, 0, 0, 0, 1, 1,
0.9788238, 0.8003283, -0.2950823, 0, 0, 0, 1, 1,
0.979193, -0.7847685, 2.818002, 0, 0, 0, 1, 1,
0.9809661, 1.316836, -0.166985, 1, 1, 1, 1, 1,
0.9840305, -1.089479, 4.323814, 1, 1, 1, 1, 1,
0.9933183, -1.12362, 2.418427, 1, 1, 1, 1, 1,
0.9998473, -3.139051, 2.830636, 1, 1, 1, 1, 1,
1.001495, 0.4576049, 0.2611267, 1, 1, 1, 1, 1,
1.00196, -0.9582884, 4.602258, 1, 1, 1, 1, 1,
1.006454, 0.1591376, 1.452867, 1, 1, 1, 1, 1,
1.008922, 0.2812764, 2.811308, 1, 1, 1, 1, 1,
1.009198, -1.238172, 0.6875007, 1, 1, 1, 1, 1,
1.016251, -0.2235984, 2.682382, 1, 1, 1, 1, 1,
1.017326, -0.8698121, 2.616691, 1, 1, 1, 1, 1,
1.017331, 0.349703, 0.6730491, 1, 1, 1, 1, 1,
1.021353, 0.09280406, 1.808891, 1, 1, 1, 1, 1,
1.022733, 0.3028852, 2.515355, 1, 1, 1, 1, 1,
1.023781, -0.424714, 4.336767, 1, 1, 1, 1, 1,
1.026271, -0.1537831, 0.6173165, 0, 0, 1, 1, 1,
1.02948, 0.5977786, 3.429985, 1, 0, 0, 1, 1,
1.031337, -1.019571, 2.883572, 1, 0, 0, 1, 1,
1.038003, 1.310329, 1.352138, 1, 0, 0, 1, 1,
1.038703, -0.9803641, 2.215749, 1, 0, 0, 1, 1,
1.039977, -0.774201, 1.693066, 1, 0, 0, 1, 1,
1.040632, 0.9225432, 1.317743, 0, 0, 0, 1, 1,
1.041071, -0.1789241, 1.822649, 0, 0, 0, 1, 1,
1.046146, 0.4603679, 1.526656, 0, 0, 0, 1, 1,
1.046836, 0.4587159, 0.8683808, 0, 0, 0, 1, 1,
1.051278, 0.1804838, 2.520373, 0, 0, 0, 1, 1,
1.054822, -0.2486464, 2.200757, 0, 0, 0, 1, 1,
1.061645, -0.5761706, 1.997286, 0, 0, 0, 1, 1,
1.061952, -0.721491, 2.85844, 1, 1, 1, 1, 1,
1.063151, -0.7466627, 3.229392, 1, 1, 1, 1, 1,
1.074336, 0.3878824, 1.758099, 1, 1, 1, 1, 1,
1.079892, 1.004259, 1.084384, 1, 1, 1, 1, 1,
1.084444, 0.4300472, -0.5891558, 1, 1, 1, 1, 1,
1.08475, 1.750237, 0.9404197, 1, 1, 1, 1, 1,
1.098882, -1.395297, 1.722986, 1, 1, 1, 1, 1,
1.098886, -0.02829207, 1.276807, 1, 1, 1, 1, 1,
1.107979, 0.7717162, 0.8615462, 1, 1, 1, 1, 1,
1.109489, 0.02716756, 2.465312, 1, 1, 1, 1, 1,
1.125472, -0.694424, 2.043061, 1, 1, 1, 1, 1,
1.145125, -0.2491959, 1.17465, 1, 1, 1, 1, 1,
1.153375, 0.09012084, 2.622696, 1, 1, 1, 1, 1,
1.15522, 1.189876, 1.562026, 1, 1, 1, 1, 1,
1.156996, -0.7985295, 2.146842, 1, 1, 1, 1, 1,
1.15929, -0.9202344, 3.491624, 0, 0, 1, 1, 1,
1.159923, -1.162354, 2.024045, 1, 0, 0, 1, 1,
1.160415, 0.264439, 3.843515, 1, 0, 0, 1, 1,
1.170855, -1.477498, 1.924594, 1, 0, 0, 1, 1,
1.180695, -0.002975211, 0.3139865, 1, 0, 0, 1, 1,
1.181162, 0.6235295, 0.7871757, 1, 0, 0, 1, 1,
1.18722, 0.9905, 1.61643, 0, 0, 0, 1, 1,
1.187604, -0.7227485, 2.468445, 0, 0, 0, 1, 1,
1.187947, -0.272609, 2.903523, 0, 0, 0, 1, 1,
1.189339, -2.354829, 4.720379, 0, 0, 0, 1, 1,
1.196481, -0.7240702, 2.523942, 0, 0, 0, 1, 1,
1.198546, 1.487401, 1.386968, 0, 0, 0, 1, 1,
1.206297, 0.2640884, 0.4957179, 0, 0, 0, 1, 1,
1.207801, 0.6131917, 0.73759, 1, 1, 1, 1, 1,
1.208367, -0.2116671, 2.041951, 1, 1, 1, 1, 1,
1.214305, -0.07828461, 0.4415723, 1, 1, 1, 1, 1,
1.219579, -0.2452974, 0.156927, 1, 1, 1, 1, 1,
1.229938, -0.5127356, 3.554782, 1, 1, 1, 1, 1,
1.232809, -0.03918172, 0.7538512, 1, 1, 1, 1, 1,
1.236889, -0.8640628, 3.457201, 1, 1, 1, 1, 1,
1.237426, -0.7203465, 2.231378, 1, 1, 1, 1, 1,
1.237991, -0.351323, 2.573142, 1, 1, 1, 1, 1,
1.248669, -0.008384168, 1.469454, 1, 1, 1, 1, 1,
1.250269, 0.8610679, 0.6013201, 1, 1, 1, 1, 1,
1.251388, 0.4276223, 0.3078639, 1, 1, 1, 1, 1,
1.252975, -1.172103, 1.216774, 1, 1, 1, 1, 1,
1.254406, 0.2925001, 1.139713, 1, 1, 1, 1, 1,
1.259117, -0.1952754, 1.206233, 1, 1, 1, 1, 1,
1.267562, 0.2040939, 1.31774, 0, 0, 1, 1, 1,
1.292663, -0.3906173, 3.525025, 1, 0, 0, 1, 1,
1.318665, -0.1250025, 2.202551, 1, 0, 0, 1, 1,
1.321983, -1.065273, 3.693827, 1, 0, 0, 1, 1,
1.324089, -0.9957571, 1.432785, 1, 0, 0, 1, 1,
1.324465, 2.30111, 1.728528, 1, 0, 0, 1, 1,
1.341955, 0.8970646, -0.2791514, 0, 0, 0, 1, 1,
1.351985, -0.7852955, 4.092559, 0, 0, 0, 1, 1,
1.352243, -1.160799, 1.913805, 0, 0, 0, 1, 1,
1.362247, -0.7210991, 1.69236, 0, 0, 0, 1, 1,
1.363999, -1.360604, 1.712307, 0, 0, 0, 1, 1,
1.364046, 0.5676149, -0.2650982, 0, 0, 0, 1, 1,
1.367821, 0.9394498, 0.3289801, 0, 0, 0, 1, 1,
1.372379, 0.4379927, 0.6846036, 1, 1, 1, 1, 1,
1.379862, 0.4255438, 1.17989, 1, 1, 1, 1, 1,
1.381303, -0.4872812, 2.953773, 1, 1, 1, 1, 1,
1.382851, 0.2105804, 1.28003, 1, 1, 1, 1, 1,
1.40193, -0.05678871, 0.2492525, 1, 1, 1, 1, 1,
1.405681, 0.3912916, 1.321928, 1, 1, 1, 1, 1,
1.407931, -0.1823577, 1.905852, 1, 1, 1, 1, 1,
1.416967, 0.2610639, 3.188718, 1, 1, 1, 1, 1,
1.417987, 0.233413, -0.4783677, 1, 1, 1, 1, 1,
1.42306, -1.101166, 3.238277, 1, 1, 1, 1, 1,
1.429577, -1.123076, 3.029423, 1, 1, 1, 1, 1,
1.435687, -0.8365815, 2.138028, 1, 1, 1, 1, 1,
1.454225, 0.8773632, 2.643369, 1, 1, 1, 1, 1,
1.459474, -0.2991626, 1.84726, 1, 1, 1, 1, 1,
1.464423, 0.2955846, 1.552131, 1, 1, 1, 1, 1,
1.467296, 0.7624097, 0.9104316, 0, 0, 1, 1, 1,
1.469629, -0.9213071, 1.148875, 1, 0, 0, 1, 1,
1.47139, -0.4916296, 3.498157, 1, 0, 0, 1, 1,
1.472523, -1.400251, 1.118133, 1, 0, 0, 1, 1,
1.474451, 0.6732724, 1.220863, 1, 0, 0, 1, 1,
1.490294, -0.2902452, 1.383149, 1, 0, 0, 1, 1,
1.491984, 0.1494854, 0.4597612, 0, 0, 0, 1, 1,
1.506389, -0.5163284, 1.206773, 0, 0, 0, 1, 1,
1.541639, -0.04638484, 1.645207, 0, 0, 0, 1, 1,
1.548581, 0.7714547, 3.102055, 0, 0, 0, 1, 1,
1.553343, -0.454818, 0.3167358, 0, 0, 0, 1, 1,
1.554021, -1.080783, 2.975947, 0, 0, 0, 1, 1,
1.554678, -0.8585104, 1.994764, 0, 0, 0, 1, 1,
1.567493, 0.9195156, -0.7321948, 1, 1, 1, 1, 1,
1.568714, 1.351219, 0.1293599, 1, 1, 1, 1, 1,
1.569826, -0.6231242, 1.143863, 1, 1, 1, 1, 1,
1.573442, -1.175887, 0.914826, 1, 1, 1, 1, 1,
1.580099, 0.001842239, 1.886517, 1, 1, 1, 1, 1,
1.582994, -0.6784503, 1.53591, 1, 1, 1, 1, 1,
1.58442, -0.6707952, 2.545482, 1, 1, 1, 1, 1,
1.586705, 0.06753626, -0.4258463, 1, 1, 1, 1, 1,
1.588778, -0.6878507, 3.768372, 1, 1, 1, 1, 1,
1.589748, -2.530907, 2.021159, 1, 1, 1, 1, 1,
1.59994, 1.538741, 2.523794, 1, 1, 1, 1, 1,
1.656747, -0.06275162, 2.199883, 1, 1, 1, 1, 1,
1.673969, -0.5044845, 2.323556, 1, 1, 1, 1, 1,
1.677715, -0.4617572, -0.1888249, 1, 1, 1, 1, 1,
1.704301, 1.766173, 1.929595, 1, 1, 1, 1, 1,
1.73368, 1.473669, 1.786211, 0, 0, 1, 1, 1,
1.741838, -1.418834, 3.090273, 1, 0, 0, 1, 1,
1.75153, -0.80816, 1.914671, 1, 0, 0, 1, 1,
1.764235, 1.578181, 1.063847, 1, 0, 0, 1, 1,
1.767042, -1.213903, 1.845125, 1, 0, 0, 1, 1,
1.769615, -2.099329, 1.753109, 1, 0, 0, 1, 1,
1.771616, 0.1204299, 2.81351, 0, 0, 0, 1, 1,
1.796698, -1.28556, 0.6266166, 0, 0, 0, 1, 1,
1.829757, 1.130852, 0.5637507, 0, 0, 0, 1, 1,
1.834383, -0.06104764, 0.4749323, 0, 0, 0, 1, 1,
1.842132, 0.06742934, 1.132681, 0, 0, 0, 1, 1,
1.855992, -0.05544432, 1.530316, 0, 0, 0, 1, 1,
1.872825, -0.8455736, 0.9858866, 0, 0, 0, 1, 1,
1.875559, 2.126655, -0.3122131, 1, 1, 1, 1, 1,
1.893018, -0.4086329, 2.592049, 1, 1, 1, 1, 1,
1.900111, 1.041605, 2.468336, 1, 1, 1, 1, 1,
1.914969, -1.486078, 2.571166, 1, 1, 1, 1, 1,
1.916746, 0.420151, 1.387564, 1, 1, 1, 1, 1,
1.919682, -0.1251902, 3.268478, 1, 1, 1, 1, 1,
1.92764, 1.054612, 0.7574825, 1, 1, 1, 1, 1,
1.944541, 1.8228, 0.1943381, 1, 1, 1, 1, 1,
1.952846, -0.008595699, 1.728225, 1, 1, 1, 1, 1,
1.96513, -1.024545, 0.345107, 1, 1, 1, 1, 1,
1.9706, -0.274661, 1.607728, 1, 1, 1, 1, 1,
1.99147, 0.5847225, 1.519279, 1, 1, 1, 1, 1,
2.008875, -0.8319508, 0.9949284, 1, 1, 1, 1, 1,
2.019352, -0.4586181, 2.312196, 1, 1, 1, 1, 1,
2.025659, -1.263749, 3.236995, 1, 1, 1, 1, 1,
2.073426, 2.155579, 0.4149272, 0, 0, 1, 1, 1,
2.093544, 0.01635627, -0.1368682, 1, 0, 0, 1, 1,
2.131891, -1.950745, 0.7768202, 1, 0, 0, 1, 1,
2.136495, 1.130807, 1.720459, 1, 0, 0, 1, 1,
2.137126, 0.5139573, 0.119324, 1, 0, 0, 1, 1,
2.202946, 0.1359405, 0.7936836, 1, 0, 0, 1, 1,
2.223646, -0.02004035, 2.308997, 0, 0, 0, 1, 1,
2.27148, -1.447997, 2.391285, 0, 0, 0, 1, 1,
2.284012, -0.8265074, 1.628073, 0, 0, 0, 1, 1,
2.296556, 1.292665, -0.3966124, 0, 0, 0, 1, 1,
2.344366, 1.438076, 1.706145, 0, 0, 0, 1, 1,
2.353708, -0.5610846, 1.897702, 0, 0, 0, 1, 1,
2.375562, 0.01941518, 1.908434, 0, 0, 0, 1, 1,
2.392168, -0.625094, 0.9528313, 1, 1, 1, 1, 1,
2.425387, 0.05601838, 0.8104017, 1, 1, 1, 1, 1,
2.576288, -0.8001239, -0.08023952, 1, 1, 1, 1, 1,
2.679497, -1.394067, 1.723006, 1, 1, 1, 1, 1,
2.687952, 0.4362424, 2.338052, 1, 1, 1, 1, 1,
2.84328, 0.5254562, 1.107945, 1, 1, 1, 1, 1,
3.144199, 0.7867773, 1.671872, 1, 1, 1, 1, 1
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
var radius = 9.750885;
var distance = 34.24957;
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
mvMatrix.translate( -0.0599122, -0.1129932, 0.1674969 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.24957);
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
