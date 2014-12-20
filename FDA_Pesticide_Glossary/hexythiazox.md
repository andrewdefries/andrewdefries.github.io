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
-4.00348, -0.3450639, -2.62947, 1, 0, 0, 1,
-3.487546, 0.2738597, -2.620708, 1, 0.007843138, 0, 1,
-2.928795, 0.1211432, -1.637837, 1, 0.01176471, 0, 1,
-2.816918, -2.069841, -1.964496, 1, 0.01960784, 0, 1,
-2.747424, -0.1756668, -2.055001, 1, 0.02352941, 0, 1,
-2.655082, 0.2292667, -4.649879, 1, 0.03137255, 0, 1,
-2.640715, 2.236252, 0.5312669, 1, 0.03529412, 0, 1,
-2.607027, -0.201197, -0.9129621, 1, 0.04313726, 0, 1,
-2.587911, 0.3397934, -1.029814, 1, 0.04705882, 0, 1,
-2.510963, -0.1585114, -1.001688, 1, 0.05490196, 0, 1,
-2.462048, -0.4844207, -4.657063, 1, 0.05882353, 0, 1,
-2.447285, 0.4167606, -1.943611, 1, 0.06666667, 0, 1,
-2.393245, 0.1190934, -4.121456, 1, 0.07058824, 0, 1,
-2.333844, 0.8783864, -1.722011, 1, 0.07843138, 0, 1,
-2.310933, -0.401152, -1.225244, 1, 0.08235294, 0, 1,
-2.300704, 0.7853581, -3.405185, 1, 0.09019608, 0, 1,
-2.285914, -1.593658, -1.247882, 1, 0.09411765, 0, 1,
-2.268111, 0.4731497, -3.344503, 1, 0.1019608, 0, 1,
-2.259434, -1.820457, -3.741285, 1, 0.1098039, 0, 1,
-2.234584, 0.4249047, -1.165177, 1, 0.1137255, 0, 1,
-2.220073, 1.447273, -2.492577, 1, 0.1215686, 0, 1,
-2.182729, 1.003334, -0.08663062, 1, 0.1254902, 0, 1,
-2.147335, -2.502196, -1.500728, 1, 0.1333333, 0, 1,
-2.143067, 1.803053, 0.5461329, 1, 0.1372549, 0, 1,
-2.117928, -0.388807, -2.559154, 1, 0.145098, 0, 1,
-2.099716, 0.3204609, -2.439991, 1, 0.1490196, 0, 1,
-2.075132, 1.565117, -0.5366976, 1, 0.1568628, 0, 1,
-2.064619, -0.4623617, -0.7911019, 1, 0.1607843, 0, 1,
-2.060768, 0.6107204, -0.3696013, 1, 0.1686275, 0, 1,
-2.054369, -1.009499, -1.696074, 1, 0.172549, 0, 1,
-2.045683, 0.7495615, -1.191855, 1, 0.1803922, 0, 1,
-2.011996, -1.716143, -2.48481, 1, 0.1843137, 0, 1,
-1.985632, 1.768549, -0.8728654, 1, 0.1921569, 0, 1,
-1.958227, 1.66993, 1.667357, 1, 0.1960784, 0, 1,
-1.92803, -0.3394286, -2.405378, 1, 0.2039216, 0, 1,
-1.918276, 1.218574, -0.8808848, 1, 0.2117647, 0, 1,
-1.894046, 0.8569871, -0.5836006, 1, 0.2156863, 0, 1,
-1.883768, 0.481151, -2.731704, 1, 0.2235294, 0, 1,
-1.858794, 1.812858, -1.051481, 1, 0.227451, 0, 1,
-1.852809, 0.5534576, -2.23576, 1, 0.2352941, 0, 1,
-1.839351, -0.2257207, -2.685245, 1, 0.2392157, 0, 1,
-1.835277, -1.92349, -1.561819, 1, 0.2470588, 0, 1,
-1.826777, 1.414387, -1.51951, 1, 0.2509804, 0, 1,
-1.819128, 1.557716, -2.887311, 1, 0.2588235, 0, 1,
-1.817661, -0.7861568, -2.406716, 1, 0.2627451, 0, 1,
-1.811025, 0.0763808, -1.66355, 1, 0.2705882, 0, 1,
-1.785641, -0.3224528, -1.526005, 1, 0.2745098, 0, 1,
-1.778966, 0.3069359, -1.690091, 1, 0.282353, 0, 1,
-1.768005, -0.8375329, -1.584621, 1, 0.2862745, 0, 1,
-1.757129, 2.055631, -0.3620338, 1, 0.2941177, 0, 1,
-1.741143, 1.621162, -0.8718286, 1, 0.3019608, 0, 1,
-1.725027, -0.4302525, -0.6658661, 1, 0.3058824, 0, 1,
-1.71969, -0.5245581, -2.298747, 1, 0.3137255, 0, 1,
-1.718973, 0.3994334, -1.98636, 1, 0.3176471, 0, 1,
-1.717098, 0.5331211, -0.4102818, 1, 0.3254902, 0, 1,
-1.710844, 0.5567648, -0.15629, 1, 0.3294118, 0, 1,
-1.708453, 0.4214327, -2.284659, 1, 0.3372549, 0, 1,
-1.678064, -0.1841596, -1.802516, 1, 0.3411765, 0, 1,
-1.67384, -0.2031765, -2.434132, 1, 0.3490196, 0, 1,
-1.665582, -0.8659055, -1.48539, 1, 0.3529412, 0, 1,
-1.659542, 0.2464057, -2.23907, 1, 0.3607843, 0, 1,
-1.650621, -0.3213788, -1.02334, 1, 0.3647059, 0, 1,
-1.629528, 0.2238579, -1.054034, 1, 0.372549, 0, 1,
-1.592498, -1.897635, -2.427128, 1, 0.3764706, 0, 1,
-1.580739, -1.671361, -2.141172, 1, 0.3843137, 0, 1,
-1.577889, 0.2218584, -2.056555, 1, 0.3882353, 0, 1,
-1.574654, -0.2231217, -0.576195, 1, 0.3960784, 0, 1,
-1.56914, 0.4239093, -2.481796, 1, 0.4039216, 0, 1,
-1.568904, -0.2835631, -2.816117, 1, 0.4078431, 0, 1,
-1.558416, -0.05580191, -1.67805, 1, 0.4156863, 0, 1,
-1.556795, 2.00385, 0.2687018, 1, 0.4196078, 0, 1,
-1.546964, 0.1662095, -0.5419252, 1, 0.427451, 0, 1,
-1.538171, 2.186492, -1.354324, 1, 0.4313726, 0, 1,
-1.530321, -0.2920634, -1.934312, 1, 0.4392157, 0, 1,
-1.504843, 1.396909, -0.3329036, 1, 0.4431373, 0, 1,
-1.49152, -0.476238, -0.980172, 1, 0.4509804, 0, 1,
-1.486743, 0.5988949, -0.7342969, 1, 0.454902, 0, 1,
-1.483137, -2.521283, -2.245275, 1, 0.4627451, 0, 1,
-1.482016, 0.9212739, -1.183451, 1, 0.4666667, 0, 1,
-1.465063, -0.1991395, -1.028425, 1, 0.4745098, 0, 1,
-1.464551, 1.617447, -0.1920916, 1, 0.4784314, 0, 1,
-1.452308, -0.05144513, -2.67133, 1, 0.4862745, 0, 1,
-1.451966, 0.4259661, -0.3758116, 1, 0.4901961, 0, 1,
-1.442978, -0.5464861, -2.770361, 1, 0.4980392, 0, 1,
-1.441956, -0.851945, -2.729033, 1, 0.5058824, 0, 1,
-1.440768, -0.6607062, -1.217607, 1, 0.509804, 0, 1,
-1.437678, 0.3462111, -0.001915534, 1, 0.5176471, 0, 1,
-1.433822, -0.5027941, -0.9900758, 1, 0.5215687, 0, 1,
-1.423813, -1.36549, -1.259531, 1, 0.5294118, 0, 1,
-1.409845, 0.40494, 0.1705595, 1, 0.5333334, 0, 1,
-1.393439, 1.520491, -1.613134, 1, 0.5411765, 0, 1,
-1.391009, 0.2778559, -1.400915, 1, 0.5450981, 0, 1,
-1.381378, -0.9663255, -1.495779, 1, 0.5529412, 0, 1,
-1.376959, -0.9666483, -0.8866286, 1, 0.5568628, 0, 1,
-1.374599, -0.6636372, -3.490967, 1, 0.5647059, 0, 1,
-1.374141, 0.4300996, -0.5095122, 1, 0.5686275, 0, 1,
-1.371163, -0.8918779, -2.23029, 1, 0.5764706, 0, 1,
-1.339604, 0.2968458, -1.439167, 1, 0.5803922, 0, 1,
-1.334867, 0.9309015, 0.1752495, 1, 0.5882353, 0, 1,
-1.322055, -1.181283, -2.490575, 1, 0.5921569, 0, 1,
-1.308887, 1.068871, 1.835899, 1, 0.6, 0, 1,
-1.302383, -1.240156, -4.363037, 1, 0.6078432, 0, 1,
-1.300433, 0.2487434, -2.174384, 1, 0.6117647, 0, 1,
-1.295953, 0.2733311, -2.902203, 1, 0.6196079, 0, 1,
-1.290137, -1.836278, -2.025351, 1, 0.6235294, 0, 1,
-1.289074, 0.1663353, -0.9779893, 1, 0.6313726, 0, 1,
-1.283003, -0.5416585, -1.038277, 1, 0.6352941, 0, 1,
-1.280435, -0.1057513, -2.140064, 1, 0.6431373, 0, 1,
-1.277033, 1.528033, -1.598769, 1, 0.6470588, 0, 1,
-1.273562, -0.892863, -2.013513, 1, 0.654902, 0, 1,
-1.264587, -2.204664, -2.16714, 1, 0.6588235, 0, 1,
-1.262824, -1.329454, -2.039014, 1, 0.6666667, 0, 1,
-1.256499, -0.6187319, -2.763056, 1, 0.6705883, 0, 1,
-1.230873, 0.3372187, -0.3318113, 1, 0.6784314, 0, 1,
-1.227191, 0.4418853, -1.439285, 1, 0.682353, 0, 1,
-1.226114, -0.8397992, -1.653803, 1, 0.6901961, 0, 1,
-1.212474, -0.6181116, -1.236512, 1, 0.6941177, 0, 1,
-1.20863, -0.5709669, -0.6074032, 1, 0.7019608, 0, 1,
-1.1927, 0.3924471, 0.06998695, 1, 0.7098039, 0, 1,
-1.188658, 1.603953, -1.257696, 1, 0.7137255, 0, 1,
-1.179498, 0.4779104, -1.526913, 1, 0.7215686, 0, 1,
-1.159187, 1.132901, -0.6167122, 1, 0.7254902, 0, 1,
-1.152626, -0.7732884, -3.256138, 1, 0.7333333, 0, 1,
-1.151724, 0.01527884, -0.55133, 1, 0.7372549, 0, 1,
-1.150624, 0.3389684, -0.6281009, 1, 0.7450981, 0, 1,
-1.143326, -1.668092, -0.9661973, 1, 0.7490196, 0, 1,
-1.143196, 0.1649708, -2.393716, 1, 0.7568628, 0, 1,
-1.14184, -1.029384, -2.732827, 1, 0.7607843, 0, 1,
-1.130312, 0.6385753, -1.301577, 1, 0.7686275, 0, 1,
-1.126248, 0.02619369, -3.143317, 1, 0.772549, 0, 1,
-1.121228, 0.4704303, -1.315687, 1, 0.7803922, 0, 1,
-1.118477, 0.2505555, -1.777515, 1, 0.7843137, 0, 1,
-1.114711, -0.4529683, -1.797874, 1, 0.7921569, 0, 1,
-1.114541, 0.5653745, -2.791889, 1, 0.7960784, 0, 1,
-1.105206, 0.8060116, -1.017575, 1, 0.8039216, 0, 1,
-1.097574, -1.321459, -2.438694, 1, 0.8117647, 0, 1,
-1.096388, -1.206162, -2.189993, 1, 0.8156863, 0, 1,
-1.091421, 1.475716, -0.5236551, 1, 0.8235294, 0, 1,
-1.084152, 0.6104485, 0.2462437, 1, 0.827451, 0, 1,
-1.078262, -1.411826, -1.355148, 1, 0.8352941, 0, 1,
-1.058707, 0.05397748, -1.671826, 1, 0.8392157, 0, 1,
-1.05771, -1.293526, -2.296343, 1, 0.8470588, 0, 1,
-1.055937, -1.409605, -2.568189, 1, 0.8509804, 0, 1,
-1.05098, 0.4365176, -0.9823731, 1, 0.8588235, 0, 1,
-1.049105, -0.9679113, -1.790266, 1, 0.8627451, 0, 1,
-1.043593, 0.7598425, -1.954656, 1, 0.8705882, 0, 1,
-1.036109, 0.04661141, -2.897446, 1, 0.8745098, 0, 1,
-1.029198, 1.642154, -0.6439983, 1, 0.8823529, 0, 1,
-1.024752, 0.6485497, -2.743346, 1, 0.8862745, 0, 1,
-1.017057, 0.161975, -2.45033, 1, 0.8941177, 0, 1,
-1.013684, -0.742111, -2.669436, 1, 0.8980392, 0, 1,
-0.9971617, 1.348381, -0.4107422, 1, 0.9058824, 0, 1,
-0.989929, -1.113262, -3.531982, 1, 0.9137255, 0, 1,
-0.9797108, 0.2185136, -2.769671, 1, 0.9176471, 0, 1,
-0.9790944, -1.645822, -1.903601, 1, 0.9254902, 0, 1,
-0.9721321, -0.9397237, -1.933709, 1, 0.9294118, 0, 1,
-0.970111, 1.762639, -0.7985913, 1, 0.9372549, 0, 1,
-0.9687714, -0.3521349, -1.677137, 1, 0.9411765, 0, 1,
-0.96619, -0.7347591, -2.350844, 1, 0.9490196, 0, 1,
-0.9645146, 0.6734354, 0.5183876, 1, 0.9529412, 0, 1,
-0.9635957, -0.3380369, -2.845735, 1, 0.9607843, 0, 1,
-0.9582567, -0.06141735, -1.105137, 1, 0.9647059, 0, 1,
-0.9559065, 0.2835284, -1.875787, 1, 0.972549, 0, 1,
-0.9486843, -0.7999631, -5.393717, 1, 0.9764706, 0, 1,
-0.9375384, -0.3309868, -1.923139, 1, 0.9843137, 0, 1,
-0.9296553, -1.279787, -1.628715, 1, 0.9882353, 0, 1,
-0.9248495, -0.3988815, -1.022064, 1, 0.9960784, 0, 1,
-0.9221247, 1.602463, 0.155357, 0.9960784, 1, 0, 1,
-0.9189537, 0.4431933, 0.6476843, 0.9921569, 1, 0, 1,
-0.9125894, 1.392113, 0.6786143, 0.9843137, 1, 0, 1,
-0.912558, 0.5444958, -2.048345, 0.9803922, 1, 0, 1,
-0.9114236, -0.9352968, -2.806077, 0.972549, 1, 0, 1,
-0.9046105, 0.7331439, -0.6785687, 0.9686275, 1, 0, 1,
-0.8997121, 1.455553, -0.7026607, 0.9607843, 1, 0, 1,
-0.8941535, 0.4366675, -1.25459, 0.9568627, 1, 0, 1,
-0.8865668, 1.066542, 0.354977, 0.9490196, 1, 0, 1,
-0.885561, 0.7302559, -0.6939673, 0.945098, 1, 0, 1,
-0.878233, -1.001345, -2.732268, 0.9372549, 1, 0, 1,
-0.8773946, -0.9652483, 0.2670497, 0.9333333, 1, 0, 1,
-0.8770624, -1.268117, -3.385104, 0.9254902, 1, 0, 1,
-0.8743258, -2.163678, -2.694993, 0.9215686, 1, 0, 1,
-0.8693508, -0.1153926, 0.1101958, 0.9137255, 1, 0, 1,
-0.8679805, 1.378514, 0.1510288, 0.9098039, 1, 0, 1,
-0.8662013, -0.883055, -1.642774, 0.9019608, 1, 0, 1,
-0.8647363, -0.6493393, -1.442352, 0.8941177, 1, 0, 1,
-0.8626123, 0.9855071, 0.6330305, 0.8901961, 1, 0, 1,
-0.860885, 0.8549709, 0.3539731, 0.8823529, 1, 0, 1,
-0.8582067, 1.033599, -0.4603932, 0.8784314, 1, 0, 1,
-0.8581226, 0.1554431, 1.131593, 0.8705882, 1, 0, 1,
-0.8481002, 0.03460454, -4.19239, 0.8666667, 1, 0, 1,
-0.8407155, 0.1777569, -0.5118631, 0.8588235, 1, 0, 1,
-0.8394832, -0.03045274, -1.33553, 0.854902, 1, 0, 1,
-0.830773, 2.109217, 0.08654101, 0.8470588, 1, 0, 1,
-0.8301336, 0.3545166, -1.944697, 0.8431373, 1, 0, 1,
-0.8293054, 1.390649, -0.9837436, 0.8352941, 1, 0, 1,
-0.8292646, 0.2474651, -0.761113, 0.8313726, 1, 0, 1,
-0.8284965, -0.5311637, -1.993728, 0.8235294, 1, 0, 1,
-0.8279039, -0.3911323, -0.8488234, 0.8196079, 1, 0, 1,
-0.8249255, 0.933154, -0.4745252, 0.8117647, 1, 0, 1,
-0.8242104, 0.4884319, -1.963396, 0.8078431, 1, 0, 1,
-0.822552, 2.361588, -1.912845, 0.8, 1, 0, 1,
-0.8216047, 0.3320166, -3.356768, 0.7921569, 1, 0, 1,
-0.8195137, 0.9639617, -0.5127633, 0.7882353, 1, 0, 1,
-0.8155856, -0.3493146, -2.096443, 0.7803922, 1, 0, 1,
-0.8154109, 0.7636963, -1.933122, 0.7764706, 1, 0, 1,
-0.8051826, 1.03727, -0.1554653, 0.7686275, 1, 0, 1,
-0.804454, -1.121291, -3.294515, 0.7647059, 1, 0, 1,
-0.8040433, -0.1740069, -1.942956, 0.7568628, 1, 0, 1,
-0.7980435, 1.543423, 0.8556628, 0.7529412, 1, 0, 1,
-0.7949616, 0.9293295, -0.6538776, 0.7450981, 1, 0, 1,
-0.7934632, 0.256509, -1.652241, 0.7411765, 1, 0, 1,
-0.791302, 2.052388, 1.704136, 0.7333333, 1, 0, 1,
-0.7912692, 1.07765, -1.105482, 0.7294118, 1, 0, 1,
-0.7808956, -0.3503237, -1.771285, 0.7215686, 1, 0, 1,
-0.7775643, -1.448717, -3.071996, 0.7176471, 1, 0, 1,
-0.7759268, 0.0703989, -0.2583014, 0.7098039, 1, 0, 1,
-0.7752502, -1.408077, -3.231519, 0.7058824, 1, 0, 1,
-0.7622415, -1.536376, -3.173962, 0.6980392, 1, 0, 1,
-0.7561807, 0.5256141, -1.954738, 0.6901961, 1, 0, 1,
-0.7544811, 0.4074949, -1.069978, 0.6862745, 1, 0, 1,
-0.7467659, -0.112337, -2.454496, 0.6784314, 1, 0, 1,
-0.7455996, -0.1269274, -1.833179, 0.6745098, 1, 0, 1,
-0.7448249, 0.7534834, -2.031356, 0.6666667, 1, 0, 1,
-0.7446771, -0.1768542, -1.093955, 0.6627451, 1, 0, 1,
-0.7384977, -1.495185, -1.396156, 0.654902, 1, 0, 1,
-0.7371492, -0.6746805, -1.086188, 0.6509804, 1, 0, 1,
-0.7333564, -2.14535, -2.573158, 0.6431373, 1, 0, 1,
-0.722546, 2.124035, -0.1207253, 0.6392157, 1, 0, 1,
-0.7209659, -0.7379942, -2.920803, 0.6313726, 1, 0, 1,
-0.714995, 1.151035, -1.07547, 0.627451, 1, 0, 1,
-0.7149478, -0.4346889, -4.205853, 0.6196079, 1, 0, 1,
-0.7128068, 0.839506, -1.354617, 0.6156863, 1, 0, 1,
-0.712741, 1.113939, 0.9670026, 0.6078432, 1, 0, 1,
-0.7098211, 2.377196, -0.6393911, 0.6039216, 1, 0, 1,
-0.7072752, 0.3804825, -2.726344, 0.5960785, 1, 0, 1,
-0.7049305, 1.799718, -0.6847001, 0.5882353, 1, 0, 1,
-0.7046093, 1.858672, 1.657529, 0.5843138, 1, 0, 1,
-0.7015913, 0.4348476, -1.640905, 0.5764706, 1, 0, 1,
-0.6985916, 0.5131905, -0.3890768, 0.572549, 1, 0, 1,
-0.6949899, 1.228329, -1.278647, 0.5647059, 1, 0, 1,
-0.6912864, 0.9452688, -0.4024781, 0.5607843, 1, 0, 1,
-0.6844981, 0.2362504, -0.8502862, 0.5529412, 1, 0, 1,
-0.6786228, -1.804839, -2.761305, 0.5490196, 1, 0, 1,
-0.6759047, -0.09949292, -2.149633, 0.5411765, 1, 0, 1,
-0.6732897, 1.078712, -0.0006442514, 0.5372549, 1, 0, 1,
-0.6717764, -0.03872738, 0.6048704, 0.5294118, 1, 0, 1,
-0.6704451, -1.080459, -2.058024, 0.5254902, 1, 0, 1,
-0.6682303, 1.146986, 0.004652368, 0.5176471, 1, 0, 1,
-0.6671147, -0.5185159, -2.366303, 0.5137255, 1, 0, 1,
-0.6597131, -0.9071608, -2.911787, 0.5058824, 1, 0, 1,
-0.6503127, -0.8884705, -4.09204, 0.5019608, 1, 0, 1,
-0.6498929, -0.2411786, -1.125995, 0.4941176, 1, 0, 1,
-0.6485693, -0.2206016, -0.7874535, 0.4862745, 1, 0, 1,
-0.6363806, 0.9601911, -0.338895, 0.4823529, 1, 0, 1,
-0.6361741, 1.528655, 1.556272, 0.4745098, 1, 0, 1,
-0.6327364, 1.526022, -1.28948, 0.4705882, 1, 0, 1,
-0.6298155, -1.132428, -2.202152, 0.4627451, 1, 0, 1,
-0.6244573, -1.438927, -2.334415, 0.4588235, 1, 0, 1,
-0.6175084, -0.6879152, -3.720997, 0.4509804, 1, 0, 1,
-0.6175054, 1.266595, 1.322173, 0.4470588, 1, 0, 1,
-0.6149135, 1.071471, 0.2476088, 0.4392157, 1, 0, 1,
-0.6129821, -0.3685359, -3.102619, 0.4352941, 1, 0, 1,
-0.6098506, -1.012043, -1.340707, 0.427451, 1, 0, 1,
-0.6073389, -1.269476, -2.754041, 0.4235294, 1, 0, 1,
-0.6054636, 0.09171408, -1.891555, 0.4156863, 1, 0, 1,
-0.6014826, 1.255665, 1.20828, 0.4117647, 1, 0, 1,
-0.5905809, 0.0816111, -1.560684, 0.4039216, 1, 0, 1,
-0.5884339, 0.9212211, -1.500117, 0.3960784, 1, 0, 1,
-0.5877138, 0.8122308, -1.12087, 0.3921569, 1, 0, 1,
-0.5833079, -1.469978, -3.410196, 0.3843137, 1, 0, 1,
-0.5828409, 0.1898914, -2.070285, 0.3803922, 1, 0, 1,
-0.5819286, -1.30269, -2.229325, 0.372549, 1, 0, 1,
-0.581237, -0.4956615, -2.027036, 0.3686275, 1, 0, 1,
-0.580842, -0.5909683, -2.191795, 0.3607843, 1, 0, 1,
-0.5781536, -0.1955655, -1.176255, 0.3568628, 1, 0, 1,
-0.5770727, 0.462353, -1.249995, 0.3490196, 1, 0, 1,
-0.5763433, -0.3329698, -3.665948, 0.345098, 1, 0, 1,
-0.5749167, -0.1614778, -3.05375, 0.3372549, 1, 0, 1,
-0.5721356, -0.9000261, -2.460875, 0.3333333, 1, 0, 1,
-0.5704561, 0.2617076, -0.199324, 0.3254902, 1, 0, 1,
-0.5684484, -0.4300147, -0.18827, 0.3215686, 1, 0, 1,
-0.5664492, 1.546549, 0.3401297, 0.3137255, 1, 0, 1,
-0.5652599, 0.8677297, -0.08545962, 0.3098039, 1, 0, 1,
-0.5628514, -0.3307666, -1.424658, 0.3019608, 1, 0, 1,
-0.5622548, -0.3222319, -3.93562, 0.2941177, 1, 0, 1,
-0.5596715, 0.2785425, -0.8194302, 0.2901961, 1, 0, 1,
-0.5593382, 0.1182365, -2.775757, 0.282353, 1, 0, 1,
-0.5584283, 0.7529272, -0.1535713, 0.2784314, 1, 0, 1,
-0.5564359, -0.005383717, -1.888755, 0.2705882, 1, 0, 1,
-0.5489619, 1.211614, 0.5267131, 0.2666667, 1, 0, 1,
-0.5482658, 3.435925, -0.411538, 0.2588235, 1, 0, 1,
-0.5476161, 0.4872224, -1.619341, 0.254902, 1, 0, 1,
-0.5464483, -0.2324511, -2.094596, 0.2470588, 1, 0, 1,
-0.5461987, -0.8825417, -2.574228, 0.2431373, 1, 0, 1,
-0.5444666, 0.03836676, -1.415305, 0.2352941, 1, 0, 1,
-0.5404154, -0.9640144, -1.687249, 0.2313726, 1, 0, 1,
-0.5366118, 0.3875529, -1.208427, 0.2235294, 1, 0, 1,
-0.5154284, 1.487265, 1.644883, 0.2196078, 1, 0, 1,
-0.5135093, -1.127528, -2.119386, 0.2117647, 1, 0, 1,
-0.5106619, 1.306236, -0.8283694, 0.2078431, 1, 0, 1,
-0.5074955, -1.076162, -4.646628, 0.2, 1, 0, 1,
-0.5073143, 1.019574, -0.003476381, 0.1921569, 1, 0, 1,
-0.5055171, -0.1397576, -1.644781, 0.1882353, 1, 0, 1,
-0.504702, -0.3714535, -2.102685, 0.1803922, 1, 0, 1,
-0.5013199, -0.5919748, -1.871127, 0.1764706, 1, 0, 1,
-0.4937029, 0.5619862, -0.8654311, 0.1686275, 1, 0, 1,
-0.4927701, 0.05982009, 0.1565515, 0.1647059, 1, 0, 1,
-0.4916236, -1.582574, -3.622686, 0.1568628, 1, 0, 1,
-0.489289, -0.2143101, -1.663235, 0.1529412, 1, 0, 1,
-0.4830696, 1.868071, 0.9073172, 0.145098, 1, 0, 1,
-0.4784836, 1.086035, -1.698359, 0.1411765, 1, 0, 1,
-0.476109, 0.9186797, -0.7341542, 0.1333333, 1, 0, 1,
-0.4758725, -0.3569386, -2.184005, 0.1294118, 1, 0, 1,
-0.4755428, 0.5260488, -1.500791, 0.1215686, 1, 0, 1,
-0.460027, -1.767539, -3.181735, 0.1176471, 1, 0, 1,
-0.4567356, -1.384474, -4.717731, 0.1098039, 1, 0, 1,
-0.455384, -0.170029, -1.473923, 0.1058824, 1, 0, 1,
-0.4547194, -2.371043, -2.287159, 0.09803922, 1, 0, 1,
-0.4542735, -0.2853974, -3.238258, 0.09019608, 1, 0, 1,
-0.4527996, 0.3092681, -0.5404599, 0.08627451, 1, 0, 1,
-0.4514499, 0.216319, 0.3299727, 0.07843138, 1, 0, 1,
-0.4504189, 0.1678696, -1.982557, 0.07450981, 1, 0, 1,
-0.4501064, -0.01055454, -1.048154, 0.06666667, 1, 0, 1,
-0.4448796, -0.2387187, -1.654285, 0.0627451, 1, 0, 1,
-0.4446221, 1.833574, -1.679066, 0.05490196, 1, 0, 1,
-0.4401301, -0.523476, -2.947573, 0.05098039, 1, 0, 1,
-0.4392309, 1.446875, -0.1800586, 0.04313726, 1, 0, 1,
-0.4382991, 1.093488, -1.411966, 0.03921569, 1, 0, 1,
-0.4321029, -1.282571, -3.482886, 0.03137255, 1, 0, 1,
-0.4260305, -0.2609316, -1.749255, 0.02745098, 1, 0, 1,
-0.4258882, -1.034684, -2.203051, 0.01960784, 1, 0, 1,
-0.4258803, -0.6887425, -0.5814169, 0.01568628, 1, 0, 1,
-0.4238284, 0.5689737, -1.532659, 0.007843138, 1, 0, 1,
-0.4232963, 0.467005, 1.597069, 0.003921569, 1, 0, 1,
-0.4231954, 0.7776246, 1.498814, 0, 1, 0.003921569, 1,
-0.4177993, 1.040365, -1.019854, 0, 1, 0.01176471, 1,
-0.4137876, 0.553256, -0.2929203, 0, 1, 0.01568628, 1,
-0.412487, 0.4942951, 1.4924, 0, 1, 0.02352941, 1,
-0.4112285, 0.9791246, -0.6314095, 0, 1, 0.02745098, 1,
-0.407953, -0.6725286, -1.017183, 0, 1, 0.03529412, 1,
-0.4031058, -0.4362845, -2.360043, 0, 1, 0.03921569, 1,
-0.3999667, -1.670197, -3.604877, 0, 1, 0.04705882, 1,
-0.3996436, -0.02260303, -2.381075, 0, 1, 0.05098039, 1,
-0.3961646, -1.29829, -4.648321, 0, 1, 0.05882353, 1,
-0.3950449, 0.1546816, -1.773963, 0, 1, 0.0627451, 1,
-0.3904366, -0.3371612, -1.950743, 0, 1, 0.07058824, 1,
-0.3900402, -0.009303102, -2.936561, 0, 1, 0.07450981, 1,
-0.3895213, -0.221202, -3.176177, 0, 1, 0.08235294, 1,
-0.3891166, -0.1152698, -2.116894, 0, 1, 0.08627451, 1,
-0.386551, 0.4223523, 0.1744646, 0, 1, 0.09411765, 1,
-0.3822493, 2.032648, -1.168392, 0, 1, 0.1019608, 1,
-0.3810875, -0.2821802, -2.342117, 0, 1, 0.1058824, 1,
-0.3808644, 1.155656, -0.003990822, 0, 1, 0.1137255, 1,
-0.3786029, -0.5087267, -4.03848, 0, 1, 0.1176471, 1,
-0.3782887, -0.9886601, -2.034134, 0, 1, 0.1254902, 1,
-0.3768651, 1.10112, 0.3118663, 0, 1, 0.1294118, 1,
-0.3734054, 0.7976645, -0.8353269, 0, 1, 0.1372549, 1,
-0.3641632, 0.3029366, -2.652562, 0, 1, 0.1411765, 1,
-0.3616091, -0.3853779, -3.857908, 0, 1, 0.1490196, 1,
-0.3612333, -0.1405756, -5.237906, 0, 1, 0.1529412, 1,
-0.3587991, 1.610257, 2.069344, 0, 1, 0.1607843, 1,
-0.3542805, -0.8767939, -2.744243, 0, 1, 0.1647059, 1,
-0.3496603, -0.4340982, -2.1788, 0, 1, 0.172549, 1,
-0.3436512, 0.2511309, -1.686942, 0, 1, 0.1764706, 1,
-0.3419785, -0.03360966, -0.8561414, 0, 1, 0.1843137, 1,
-0.3414144, 0.3774251, -0.516557, 0, 1, 0.1882353, 1,
-0.3374335, 1.445925, 1.072567, 0, 1, 0.1960784, 1,
-0.3322865, 1.087299, -1.256689, 0, 1, 0.2039216, 1,
-0.3303294, -0.8389733, -2.671966, 0, 1, 0.2078431, 1,
-0.3286573, -0.456236, -2.255024, 0, 1, 0.2156863, 1,
-0.3260719, -0.06354517, -2.235504, 0, 1, 0.2196078, 1,
-0.3255428, -1.62382, -2.456248, 0, 1, 0.227451, 1,
-0.3200995, -1.005603, -1.9018, 0, 1, 0.2313726, 1,
-0.3190474, 0.7535096, 0.4427441, 0, 1, 0.2392157, 1,
-0.31821, 0.1755998, -0.2736788, 0, 1, 0.2431373, 1,
-0.3154197, -0.8425397, -1.716579, 0, 1, 0.2509804, 1,
-0.3102584, -1.385442, -2.351564, 0, 1, 0.254902, 1,
-0.3088065, -0.5164158, -2.828621, 0, 1, 0.2627451, 1,
-0.3035308, -1.18127, -3.445545, 0, 1, 0.2666667, 1,
-0.3027267, 0.5356007, 0.2314444, 0, 1, 0.2745098, 1,
-0.3017935, -0.04259188, -1.309616, 0, 1, 0.2784314, 1,
-0.301093, -1.118075, -3.157463, 0, 1, 0.2862745, 1,
-0.3000003, 1.792314, -0.9227221, 0, 1, 0.2901961, 1,
-0.2955167, -0.7484962, -2.400407, 0, 1, 0.2980392, 1,
-0.285769, -0.03002258, -1.148841, 0, 1, 0.3058824, 1,
-0.2847509, -0.8702042, -4.735685, 0, 1, 0.3098039, 1,
-0.2829987, -0.6265648, -2.315391, 0, 1, 0.3176471, 1,
-0.2829018, 0.9363281, -1.233423, 0, 1, 0.3215686, 1,
-0.2815103, -0.3685366, 0.3334631, 0, 1, 0.3294118, 1,
-0.27898, -1.815753, -1.624264, 0, 1, 0.3333333, 1,
-0.2780519, -1.573972, -4.752395, 0, 1, 0.3411765, 1,
-0.2772256, 0.2383145, -1.125254, 0, 1, 0.345098, 1,
-0.2704891, -1.070606, -2.090658, 0, 1, 0.3529412, 1,
-0.2696612, -0.03068244, -0.3037698, 0, 1, 0.3568628, 1,
-0.2642099, 1.442993, 0.4844928, 0, 1, 0.3647059, 1,
-0.2624005, -0.781183, -2.794563, 0, 1, 0.3686275, 1,
-0.2534446, 0.734945, -1.122001, 0, 1, 0.3764706, 1,
-0.251598, -1.438331, -5.017901, 0, 1, 0.3803922, 1,
-0.2492929, 0.6398054, 0.0325545, 0, 1, 0.3882353, 1,
-0.2485997, -0.9677956, -2.386535, 0, 1, 0.3921569, 1,
-0.2429136, -0.7722301, -0.5960373, 0, 1, 0.4, 1,
-0.2427787, -0.01233806, -2.258698, 0, 1, 0.4078431, 1,
-0.2373457, -1.367509, -2.321849, 0, 1, 0.4117647, 1,
-0.2362857, -0.06047405, -1.418845, 0, 1, 0.4196078, 1,
-0.2322574, 0.8738264, 1.226115, 0, 1, 0.4235294, 1,
-0.2227479, -0.9240444, -1.945413, 0, 1, 0.4313726, 1,
-0.2211633, 0.02715265, -2.831678, 0, 1, 0.4352941, 1,
-0.2146651, 1.430704, -1.034939, 0, 1, 0.4431373, 1,
-0.2066363, -1.267977, -3.432337, 0, 1, 0.4470588, 1,
-0.2057185, -0.842733, -1.985208, 0, 1, 0.454902, 1,
-0.2011506, -0.008170594, -1.233389, 0, 1, 0.4588235, 1,
-0.2011131, -0.1820695, -2.886319, 0, 1, 0.4666667, 1,
-0.1996281, -0.05225814, -1.198076, 0, 1, 0.4705882, 1,
-0.1977556, -1.056963, -3.602615, 0, 1, 0.4784314, 1,
-0.1924912, -0.2116945, -2.903662, 0, 1, 0.4823529, 1,
-0.1917885, -1.132489, -2.234427, 0, 1, 0.4901961, 1,
-0.188993, -0.3999861, -2.163586, 0, 1, 0.4941176, 1,
-0.1717035, 0.5115261, 0.0808894, 0, 1, 0.5019608, 1,
-0.1683566, -0.504467, -2.525619, 0, 1, 0.509804, 1,
-0.1560117, -0.6770169, -2.404267, 0, 1, 0.5137255, 1,
-0.1554751, 0.8022526, -0.5961549, 0, 1, 0.5215687, 1,
-0.1553671, 1.159117, -0.7661858, 0, 1, 0.5254902, 1,
-0.1543788, -0.1076131, -3.787819, 0, 1, 0.5333334, 1,
-0.1542564, -1.429626, -2.946366, 0, 1, 0.5372549, 1,
-0.1527919, 1.74357, 1.623236, 0, 1, 0.5450981, 1,
-0.1522023, 0.564563, 0.777599, 0, 1, 0.5490196, 1,
-0.1504282, -0.1586784, -2.140438, 0, 1, 0.5568628, 1,
-0.1465914, -1.636708, -2.769739, 0, 1, 0.5607843, 1,
-0.1448185, 0.9089733, -0.9842521, 0, 1, 0.5686275, 1,
-0.1444355, 0.5830609, 1.190634, 0, 1, 0.572549, 1,
-0.1379785, 0.4660478, 0.07908285, 0, 1, 0.5803922, 1,
-0.1367654, 3.360399, 0.008664132, 0, 1, 0.5843138, 1,
-0.1353462, 1.263384, 1.008817, 0, 1, 0.5921569, 1,
-0.1324257, -0.7974016, -4.52162, 0, 1, 0.5960785, 1,
-0.1293743, -1.449229, -2.592061, 0, 1, 0.6039216, 1,
-0.1270182, -0.1200985, -2.996526, 0, 1, 0.6117647, 1,
-0.1258787, -0.4387836, -2.670083, 0, 1, 0.6156863, 1,
-0.1247268, -1.233525, -2.85322, 0, 1, 0.6235294, 1,
-0.1193315, -0.5878544, -4.265701, 0, 1, 0.627451, 1,
-0.1172111, -0.1767563, -1.726199, 0, 1, 0.6352941, 1,
-0.1154868, -0.8591835, -4.256707, 0, 1, 0.6392157, 1,
-0.1135624, -0.7662817, -3.106711, 0, 1, 0.6470588, 1,
-0.1109483, -1.265202, -2.665813, 0, 1, 0.6509804, 1,
-0.1099909, -0.4004283, -3.232909, 0, 1, 0.6588235, 1,
-0.1083625, 0.3319456, 0.762836, 0, 1, 0.6627451, 1,
-0.1073685, -0.4510628, -1.259445, 0, 1, 0.6705883, 1,
-0.1020786, -0.6630016, -2.958361, 0, 1, 0.6745098, 1,
-0.1020379, -1.100938, -3.644189, 0, 1, 0.682353, 1,
-0.1007713, -0.5560505, -2.929941, 0, 1, 0.6862745, 1,
-0.09947594, -0.2933936, -4.473595, 0, 1, 0.6941177, 1,
-0.0989701, -1.670799, -3.249686, 0, 1, 0.7019608, 1,
-0.09574483, -0.1340132, -2.275612, 0, 1, 0.7058824, 1,
-0.09371816, -0.1622085, -2.664446, 0, 1, 0.7137255, 1,
-0.09345646, 0.4780874, 0.8248016, 0, 1, 0.7176471, 1,
-0.09337456, -0.5910929, -4.226229, 0, 1, 0.7254902, 1,
-0.09097155, -0.3668437, -4.821964, 0, 1, 0.7294118, 1,
-0.09032638, 0.4803981, -1.876939, 0, 1, 0.7372549, 1,
-0.08984531, -0.1578962, -2.89928, 0, 1, 0.7411765, 1,
-0.08844907, 0.08937002, -0.4581645, 0, 1, 0.7490196, 1,
-0.0862827, -0.3224792, -3.001348, 0, 1, 0.7529412, 1,
-0.08066938, -0.5382245, -3.030313, 0, 1, 0.7607843, 1,
-0.07838389, -0.4225354, -3.109082, 0, 1, 0.7647059, 1,
-0.07812285, -0.1343737, -4.556408, 0, 1, 0.772549, 1,
-0.07808724, -0.6050265, -1.979844, 0, 1, 0.7764706, 1,
-0.07766286, -1.189198, -0.8136008, 0, 1, 0.7843137, 1,
-0.07704645, 1.529082, -2.575398, 0, 1, 0.7882353, 1,
-0.07116097, 1.814386, 0.8279228, 0, 1, 0.7960784, 1,
-0.06900983, -0.5486738, -3.883569, 0, 1, 0.8039216, 1,
-0.06615874, -0.9144099, -3.641103, 0, 1, 0.8078431, 1,
-0.06414603, -0.2955148, -3.062138, 0, 1, 0.8156863, 1,
-0.05932277, -0.4195978, -2.571281, 0, 1, 0.8196079, 1,
-0.05394578, -1.087908, -1.798895, 0, 1, 0.827451, 1,
-0.05036011, 1.649429, -2.234637, 0, 1, 0.8313726, 1,
-0.0492854, 1.478251, -0.7399921, 0, 1, 0.8392157, 1,
-0.04715203, 0.5297316, -1.096154, 0, 1, 0.8431373, 1,
-0.04637076, -1.028275, -2.116423, 0, 1, 0.8509804, 1,
-0.04406297, 0.2578622, 0.7109284, 0, 1, 0.854902, 1,
-0.04337384, 1.114445, 1.883127, 0, 1, 0.8627451, 1,
-0.04232429, 0.7873475, 0.112243, 0, 1, 0.8666667, 1,
-0.04016843, 0.404384, -0.4612256, 0, 1, 0.8745098, 1,
-0.03308316, 2.188146, -0.4070739, 0, 1, 0.8784314, 1,
-0.02758414, -0.4679101, -1.892041, 0, 1, 0.8862745, 1,
-0.02693969, -0.4481084, -3.014767, 0, 1, 0.8901961, 1,
-0.02498247, 0.3711874, -1.029503, 0, 1, 0.8980392, 1,
-0.02131797, 0.3049388, -0.132377, 0, 1, 0.9058824, 1,
-0.01839343, 0.9682764, 0.7985078, 0, 1, 0.9098039, 1,
-0.01737734, 0.5668108, -0.2539152, 0, 1, 0.9176471, 1,
-0.003444952, -0.5191339, -1.210731, 0, 1, 0.9215686, 1,
-0.002690721, 0.7427308, -0.1603659, 0, 1, 0.9294118, 1,
-0.002643938, 2.047817, -1.156365, 0, 1, 0.9333333, 1,
0.005885425, -1.195386, 3.473878, 0, 1, 0.9411765, 1,
0.009702572, -1.416259, 0.5200183, 0, 1, 0.945098, 1,
0.01267135, 0.8976242, 0.4199157, 0, 1, 0.9529412, 1,
0.01885995, -0.2548931, 4.77043, 0, 1, 0.9568627, 1,
0.0196787, -0.01571498, 1.958029, 0, 1, 0.9647059, 1,
0.02076017, 0.6991315, 1.703318, 0, 1, 0.9686275, 1,
0.02192146, -0.5113154, 3.967742, 0, 1, 0.9764706, 1,
0.02374939, -1.698773, 2.262019, 0, 1, 0.9803922, 1,
0.02448436, 1.097778, 0.4115731, 0, 1, 0.9882353, 1,
0.02477017, -0.7987086, 2.514538, 0, 1, 0.9921569, 1,
0.02492187, 0.1356278, -0.75546, 0, 1, 1, 1,
0.03216497, 0.3882286, 0.1342349, 0, 0.9921569, 1, 1,
0.03534595, 1.785879, -1.542181, 0, 0.9882353, 1, 1,
0.03924233, 0.003482788, 3.058966, 0, 0.9803922, 1, 1,
0.04180522, 1.238139, -0.0938537, 0, 0.9764706, 1, 1,
0.04729844, -0.612734, 3.330622, 0, 0.9686275, 1, 1,
0.05063665, -0.4974101, 2.418531, 0, 0.9647059, 1, 1,
0.05367657, 0.02553775, 2.686408, 0, 0.9568627, 1, 1,
0.05714956, 1.26562, -0.4902973, 0, 0.9529412, 1, 1,
0.06027868, -1.905054, 1.042948, 0, 0.945098, 1, 1,
0.06247701, 1.907105, 1.79694, 0, 0.9411765, 1, 1,
0.06312448, -0.8411645, 3.524242, 0, 0.9333333, 1, 1,
0.06405227, 0.4554523, 1.385036, 0, 0.9294118, 1, 1,
0.06683169, -1.001667, 3.275315, 0, 0.9215686, 1, 1,
0.06684637, 1.231707, -0.6153137, 0, 0.9176471, 1, 1,
0.07184372, 0.451892, -0.6863611, 0, 0.9098039, 1, 1,
0.07317016, -0.4808753, 4.01583, 0, 0.9058824, 1, 1,
0.07387744, -1.286256, 3.520243, 0, 0.8980392, 1, 1,
0.0776813, -0.0002210966, 2.023737, 0, 0.8901961, 1, 1,
0.07854032, -0.1578091, 1.533123, 0, 0.8862745, 1, 1,
0.07857035, 0.3554845, 0.7640129, 0, 0.8784314, 1, 1,
0.08131374, -0.6246448, 2.337659, 0, 0.8745098, 1, 1,
0.08391805, 0.0687888, 0.01289196, 0, 0.8666667, 1, 1,
0.0852183, 1.111195, -0.6379167, 0, 0.8627451, 1, 1,
0.08823813, -1.079709, 2.448529, 0, 0.854902, 1, 1,
0.08889158, -0.2332266, 3.008052, 0, 0.8509804, 1, 1,
0.09074157, 1.063837, -0.5745384, 0, 0.8431373, 1, 1,
0.09295269, 0.2509499, 0.08501074, 0, 0.8392157, 1, 1,
0.09444786, -1.332439, 3.387303, 0, 0.8313726, 1, 1,
0.09483797, -0.786107, 3.122705, 0, 0.827451, 1, 1,
0.09515397, 1.40355, 0.5507678, 0, 0.8196079, 1, 1,
0.09880473, 1.626835, 0.1195325, 0, 0.8156863, 1, 1,
0.10092, -1.585575, 1.563219, 0, 0.8078431, 1, 1,
0.1014549, -0.1174701, 4.166054, 0, 0.8039216, 1, 1,
0.102348, 2.460209, -0.6146095, 0, 0.7960784, 1, 1,
0.1043473, 0.8652027, -1.385546, 0, 0.7882353, 1, 1,
0.1067123, -0.3575801, 2.285862, 0, 0.7843137, 1, 1,
0.1076211, -0.3842825, 2.448164, 0, 0.7764706, 1, 1,
0.1098481, 1.263013, 0.3130068, 0, 0.772549, 1, 1,
0.1103718, 0.1997213, 1.247291, 0, 0.7647059, 1, 1,
0.1156918, -0.3571733, 3.847217, 0, 0.7607843, 1, 1,
0.1164126, -0.2592467, 2.589736, 0, 0.7529412, 1, 1,
0.1182782, 2.301751, 2.008261, 0, 0.7490196, 1, 1,
0.1230294, 0.5203999, -0.3374089, 0, 0.7411765, 1, 1,
0.1271549, -1.382484, 3.766369, 0, 0.7372549, 1, 1,
0.1325051, 0.1609476, 1.290186, 0, 0.7294118, 1, 1,
0.1379752, -1.39206, 2.983869, 0, 0.7254902, 1, 1,
0.1421146, 0.3099428, -0.1929983, 0, 0.7176471, 1, 1,
0.1447812, 0.8691885, 1.109565, 0, 0.7137255, 1, 1,
0.1453753, -1.588047, 1.902314, 0, 0.7058824, 1, 1,
0.1508663, 1.002885, 0.1563088, 0, 0.6980392, 1, 1,
0.1559426, 0.5271885, 0.9090842, 0, 0.6941177, 1, 1,
0.1603341, 1.338949, -0.1319682, 0, 0.6862745, 1, 1,
0.1614726, -0.4414113, 3.05431, 0, 0.682353, 1, 1,
0.1658906, -2.196788, 3.523174, 0, 0.6745098, 1, 1,
0.1678079, 0.4868776, 0.8032863, 0, 0.6705883, 1, 1,
0.1687633, 2.417715, 1.13509, 0, 0.6627451, 1, 1,
0.1703265, -1.378451, 1.142425, 0, 0.6588235, 1, 1,
0.1721899, -1.51875, 1.819827, 0, 0.6509804, 1, 1,
0.1733911, -1.987981, 2.282614, 0, 0.6470588, 1, 1,
0.176734, 1.693804, 1.979781, 0, 0.6392157, 1, 1,
0.1771088, 0.3276419, -0.6896622, 0, 0.6352941, 1, 1,
0.1812416, 0.167941, -0.1531511, 0, 0.627451, 1, 1,
0.1842937, 1.080672, -2.315221, 0, 0.6235294, 1, 1,
0.1843061, -0.8557064, 4.975286, 0, 0.6156863, 1, 1,
0.1846309, 0.3166769, 1.868172, 0, 0.6117647, 1, 1,
0.1847202, 1.61944, 1.077571, 0, 0.6039216, 1, 1,
0.1868514, 1.819406, -1.613819, 0, 0.5960785, 1, 1,
0.1875566, -1.049629, 2.988038, 0, 0.5921569, 1, 1,
0.1896244, -0.5876962, 2.472465, 0, 0.5843138, 1, 1,
0.1910535, -1.21928, 1.12498, 0, 0.5803922, 1, 1,
0.197666, 0.3687769, 0.1970664, 0, 0.572549, 1, 1,
0.1983346, 0.228188, 0.3862, 0, 0.5686275, 1, 1,
0.1986512, -0.7783124, 2.163445, 0, 0.5607843, 1, 1,
0.2013523, 1.47303, 0.8324544, 0, 0.5568628, 1, 1,
0.2014612, -0.5714174, 4.352512, 0, 0.5490196, 1, 1,
0.2018119, -1.110599, 2.378538, 0, 0.5450981, 1, 1,
0.2077592, 0.08657008, 1.488056, 0, 0.5372549, 1, 1,
0.2147704, -0.6886271, 1.301671, 0, 0.5333334, 1, 1,
0.2183703, 0.6103781, 1.006225, 0, 0.5254902, 1, 1,
0.2247105, -1.305068, 2.812756, 0, 0.5215687, 1, 1,
0.2251761, -0.8461546, 3.382462, 0, 0.5137255, 1, 1,
0.2269861, 0.2589709, 1.51748, 0, 0.509804, 1, 1,
0.2334844, 1.234324, -0.5306786, 0, 0.5019608, 1, 1,
0.2337743, -0.060794, 2.629685, 0, 0.4941176, 1, 1,
0.2363706, -0.09169224, 2.167097, 0, 0.4901961, 1, 1,
0.2373869, 1.089468, -0.06931423, 0, 0.4823529, 1, 1,
0.2403826, 1.901483, -1.146323, 0, 0.4784314, 1, 1,
0.2407998, -1.009059, 2.918027, 0, 0.4705882, 1, 1,
0.2440479, -0.7755339, 4.431087, 0, 0.4666667, 1, 1,
0.249901, 0.7580494, 0.8522791, 0, 0.4588235, 1, 1,
0.2517932, -1.503836, 4.779466, 0, 0.454902, 1, 1,
0.2552642, -0.9547356, 2.808574, 0, 0.4470588, 1, 1,
0.2574305, -0.9329886, 2.414497, 0, 0.4431373, 1, 1,
0.2584858, 0.4371176, 1.273023, 0, 0.4352941, 1, 1,
0.262695, -1.95699, 3.857527, 0, 0.4313726, 1, 1,
0.2634922, 0.6373046, 1.780569, 0, 0.4235294, 1, 1,
0.264696, -0.4202148, 2.847912, 0, 0.4196078, 1, 1,
0.2665087, 0.6697595, -0.2933834, 0, 0.4117647, 1, 1,
0.2678868, -1.463401, 1.610425, 0, 0.4078431, 1, 1,
0.2776339, -0.5444941, 2.434837, 0, 0.4, 1, 1,
0.2780384, -0.6546008, 4.350754, 0, 0.3921569, 1, 1,
0.2804105, -0.8924536, 3.18493, 0, 0.3882353, 1, 1,
0.28089, 0.9543003, 0.7624106, 0, 0.3803922, 1, 1,
0.2914341, 0.6951661, 1.870531, 0, 0.3764706, 1, 1,
0.2933309, 0.5464066, 0.3888099, 0, 0.3686275, 1, 1,
0.2941182, 2.193016, -0.1599976, 0, 0.3647059, 1, 1,
0.2942768, -1.479583, 3.932549, 0, 0.3568628, 1, 1,
0.2967085, -0.1277077, 3.300422, 0, 0.3529412, 1, 1,
0.296763, 0.2319357, -0.5394484, 0, 0.345098, 1, 1,
0.2999758, -0.6548744, 3.242999, 0, 0.3411765, 1, 1,
0.3063268, 0.03698638, 0.731065, 0, 0.3333333, 1, 1,
0.3114122, 0.1570611, -0.714034, 0, 0.3294118, 1, 1,
0.3116373, 1.893104, 1.572303, 0, 0.3215686, 1, 1,
0.3132865, 0.1067339, 1.904898, 0, 0.3176471, 1, 1,
0.3168066, 0.442503, 2.464076, 0, 0.3098039, 1, 1,
0.3176732, 1.200751, 1.002555, 0, 0.3058824, 1, 1,
0.3226975, -0.4256338, 3.062633, 0, 0.2980392, 1, 1,
0.324835, -0.1426526, 2.437234, 0, 0.2901961, 1, 1,
0.3284694, 1.541405, 1.2908, 0, 0.2862745, 1, 1,
0.330873, -1.781544, 2.83666, 0, 0.2784314, 1, 1,
0.3327567, 0.2328744, 1.435219, 0, 0.2745098, 1, 1,
0.3346399, -0.7839155, 3.535663, 0, 0.2666667, 1, 1,
0.3359349, -1.45238, 3.868774, 0, 0.2627451, 1, 1,
0.3400418, 0.4105417, 0.09631899, 0, 0.254902, 1, 1,
0.3419945, -1.171413, 3.262211, 0, 0.2509804, 1, 1,
0.3421658, 0.4795715, 1.241894, 0, 0.2431373, 1, 1,
0.3435284, -0.0741602, 3.467722, 0, 0.2392157, 1, 1,
0.3448605, 0.1198315, 2.895758, 0, 0.2313726, 1, 1,
0.3467778, 0.1876821, 0.6794236, 0, 0.227451, 1, 1,
0.3470535, -1.118134, 2.378977, 0, 0.2196078, 1, 1,
0.3521508, -1.237009, 2.807711, 0, 0.2156863, 1, 1,
0.3584671, 0.177977, 1.12728, 0, 0.2078431, 1, 1,
0.3588801, 0.9982485, -0.9099905, 0, 0.2039216, 1, 1,
0.3638067, -0.4874231, 2.326125, 0, 0.1960784, 1, 1,
0.3707362, 0.2222002, 2.111511, 0, 0.1882353, 1, 1,
0.3711661, -1.302275, 3.142486, 0, 0.1843137, 1, 1,
0.3848498, -0.1008906, -0.2313873, 0, 0.1764706, 1, 1,
0.3879065, -1.154255, 2.492422, 0, 0.172549, 1, 1,
0.3950356, 0.1579524, 1.044653, 0, 0.1647059, 1, 1,
0.3969962, 0.424735, 0.6571472, 0, 0.1607843, 1, 1,
0.3987397, -0.1401341, 3.134413, 0, 0.1529412, 1, 1,
0.4017689, 0.4585098, 0.7787826, 0, 0.1490196, 1, 1,
0.402507, 0.02551375, 2.336006, 0, 0.1411765, 1, 1,
0.4058917, -1.61937, 3.551854, 0, 0.1372549, 1, 1,
0.4061727, -0.5518538, 3.001971, 0, 0.1294118, 1, 1,
0.4132642, -0.3005759, 3.647553, 0, 0.1254902, 1, 1,
0.4158837, 0.5497354, 1.836092, 0, 0.1176471, 1, 1,
0.4207512, -1.124378, 1.9508, 0, 0.1137255, 1, 1,
0.4210861, -0.1266053, 0.3301456, 0, 0.1058824, 1, 1,
0.4215069, 1.394558, 0.7275943, 0, 0.09803922, 1, 1,
0.4232336, 0.5158166, 0.9307564, 0, 0.09411765, 1, 1,
0.4269696, -1.047252, 5.05659, 0, 0.08627451, 1, 1,
0.4275778, -0.9468036, 2.929123, 0, 0.08235294, 1, 1,
0.4290952, 0.327374, 2.758351, 0, 0.07450981, 1, 1,
0.4303927, -0.03696372, 3.453691, 0, 0.07058824, 1, 1,
0.435169, -0.7334381, 1.819667, 0, 0.0627451, 1, 1,
0.4380938, 1.080426, -0.3993579, 0, 0.05882353, 1, 1,
0.4387836, 1.219543, 1.473883, 0, 0.05098039, 1, 1,
0.4388186, 0.4276588, 2.657344, 0, 0.04705882, 1, 1,
0.4412063, -1.305019, 2.734286, 0, 0.03921569, 1, 1,
0.4433594, 0.6853659, 0.5767545, 0, 0.03529412, 1, 1,
0.4471112, -0.1671227, 2.796456, 0, 0.02745098, 1, 1,
0.4491673, -1.293102, 2.317716, 0, 0.02352941, 1, 1,
0.4535278, -0.2572252, 2.666994, 0, 0.01568628, 1, 1,
0.4539801, 1.272959, 0.6602338, 0, 0.01176471, 1, 1,
0.454756, -0.2038177, 1.966033, 0, 0.003921569, 1, 1,
0.4622054, -1.799741, 3.602057, 0.003921569, 0, 1, 1,
0.4658231, 0.4927063, 1.534207, 0.007843138, 0, 1, 1,
0.4686673, -0.1308745, 1.38373, 0.01568628, 0, 1, 1,
0.4726602, -0.2591615, 1.360961, 0.01960784, 0, 1, 1,
0.4749434, 0.6562461, 2.345013, 0.02745098, 0, 1, 1,
0.478231, 0.7856101, 1.074552, 0.03137255, 0, 1, 1,
0.4831526, 0.1909366, 1.558962, 0.03921569, 0, 1, 1,
0.4844612, 1.897161, 0.007888054, 0.04313726, 0, 1, 1,
0.4854418, 0.4545771, 0.8905467, 0.05098039, 0, 1, 1,
0.4861384, 0.8007549, 0.5722551, 0.05490196, 0, 1, 1,
0.488158, -0.9431096, 3.038857, 0.0627451, 0, 1, 1,
0.4883491, 0.5242319, 0.9510053, 0.06666667, 0, 1, 1,
0.4896286, 1.072509, 0.9344593, 0.07450981, 0, 1, 1,
0.4919148, 1.735106, -0.7843246, 0.07843138, 0, 1, 1,
0.4925991, 0.94338, 1.253563, 0.08627451, 0, 1, 1,
0.4934416, 0.7831349, 0.02858231, 0.09019608, 0, 1, 1,
0.4976039, 0.4011041, -0.4461575, 0.09803922, 0, 1, 1,
0.5033021, 0.2633974, 2.194467, 0.1058824, 0, 1, 1,
0.5043786, -0.2621266, 2.047519, 0.1098039, 0, 1, 1,
0.504997, 0.01187777, -1.261149, 0.1176471, 0, 1, 1,
0.5070802, 0.148367, 3.499252, 0.1215686, 0, 1, 1,
0.5076099, -1.71133, 1.986296, 0.1294118, 0, 1, 1,
0.5120152, 0.1398114, 1.934438, 0.1333333, 0, 1, 1,
0.5266661, -1.12554, 3.594706, 0.1411765, 0, 1, 1,
0.5284885, 0.2019941, 2.541833, 0.145098, 0, 1, 1,
0.5315034, 0.7660214, 1.213443, 0.1529412, 0, 1, 1,
0.5321927, 0.09546949, -0.2042124, 0.1568628, 0, 1, 1,
0.5329306, -0.02785881, 1.353131, 0.1647059, 0, 1, 1,
0.5403873, 1.403437, 0.2707084, 0.1686275, 0, 1, 1,
0.5414504, 0.2777736, 1.84714, 0.1764706, 0, 1, 1,
0.5456993, -3.256548, 3.130453, 0.1803922, 0, 1, 1,
0.5480176, 0.438154, 1.535729, 0.1882353, 0, 1, 1,
0.5497021, 0.8383411, 1.101938, 0.1921569, 0, 1, 1,
0.5516594, 0.6029707, 3.224708, 0.2, 0, 1, 1,
0.5537525, 1.14506, -0.1339476, 0.2078431, 0, 1, 1,
0.5623069, 0.1047234, 1.645132, 0.2117647, 0, 1, 1,
0.5640445, -1.157921, 3.138249, 0.2196078, 0, 1, 1,
0.5698256, -1.523586, 2.551517, 0.2235294, 0, 1, 1,
0.5714552, 0.01910466, 1.229903, 0.2313726, 0, 1, 1,
0.5719305, 0.1297626, 1.562386, 0.2352941, 0, 1, 1,
0.5742061, -1.626543, 3.994463, 0.2431373, 0, 1, 1,
0.5792848, -0.337161, 1.908692, 0.2470588, 0, 1, 1,
0.5806168, -0.5032379, 2.952704, 0.254902, 0, 1, 1,
0.5831826, 0.09385662, 1.904572, 0.2588235, 0, 1, 1,
0.584935, 1.564679, -0.1339441, 0.2666667, 0, 1, 1,
0.5861559, 0.03495184, 4.394413, 0.2705882, 0, 1, 1,
0.5890315, -0.7339866, 2.865218, 0.2784314, 0, 1, 1,
0.5897664, -0.9678757, 2.79575, 0.282353, 0, 1, 1,
0.591137, -0.9066507, 3.107403, 0.2901961, 0, 1, 1,
0.5929197, 0.3747281, 1.121987, 0.2941177, 0, 1, 1,
0.5934498, 0.3764226, 1.52682, 0.3019608, 0, 1, 1,
0.597688, 0.3783084, 2.172022, 0.3098039, 0, 1, 1,
0.6029494, -0.09500001, 2.156572, 0.3137255, 0, 1, 1,
0.6074238, -0.1268933, 0.8931261, 0.3215686, 0, 1, 1,
0.6105575, 0.6623662, 0.7861063, 0.3254902, 0, 1, 1,
0.6131814, 0.3232888, 1.302904, 0.3333333, 0, 1, 1,
0.6166825, -1.099437, 2.919724, 0.3372549, 0, 1, 1,
0.620908, -1.131105, 3.713773, 0.345098, 0, 1, 1,
0.6218213, -0.5217057, 2.326147, 0.3490196, 0, 1, 1,
0.6234077, -0.01100661, 3.05086, 0.3568628, 0, 1, 1,
0.624228, -1.892426, 2.743916, 0.3607843, 0, 1, 1,
0.6249564, 0.7325958, 1.142048, 0.3686275, 0, 1, 1,
0.6263485, 0.4220747, 0.3466862, 0.372549, 0, 1, 1,
0.6304801, 0.4380358, 0.2823486, 0.3803922, 0, 1, 1,
0.630514, 0.3520678, 0.3641038, 0.3843137, 0, 1, 1,
0.6334954, -0.4928154, 1.4426, 0.3921569, 0, 1, 1,
0.6379812, 0.3501452, 1.893227, 0.3960784, 0, 1, 1,
0.638589, -1.418453, 2.143991, 0.4039216, 0, 1, 1,
0.6399872, -0.7248845, 1.346606, 0.4117647, 0, 1, 1,
0.6421461, 0.0009430326, 0.9019234, 0.4156863, 0, 1, 1,
0.6423334, 1.094589, 1.848314, 0.4235294, 0, 1, 1,
0.6428354, -0.5439804, 0.8619857, 0.427451, 0, 1, 1,
0.6551349, 0.5296952, 1.259731, 0.4352941, 0, 1, 1,
0.6555848, 0.07561008, 2.143026, 0.4392157, 0, 1, 1,
0.6566665, -0.1785543, 1.617004, 0.4470588, 0, 1, 1,
0.6583157, 0.08289075, 2.655634, 0.4509804, 0, 1, 1,
0.6583982, -0.976469, 0.6159175, 0.4588235, 0, 1, 1,
0.6588446, 0.5527738, 1.986182, 0.4627451, 0, 1, 1,
0.6602439, -0.2257264, 1.380001, 0.4705882, 0, 1, 1,
0.6602947, 0.4772948, 1.483598, 0.4745098, 0, 1, 1,
0.6653659, -0.4668989, 3.234946, 0.4823529, 0, 1, 1,
0.666054, 0.1437262, -1.002723, 0.4862745, 0, 1, 1,
0.673326, -1.90312, 3.406821, 0.4941176, 0, 1, 1,
0.6788081, 0.3370128, 1.46693, 0.5019608, 0, 1, 1,
0.6826347, -0.4231922, 2.014443, 0.5058824, 0, 1, 1,
0.6872051, -0.6595854, 1.277583, 0.5137255, 0, 1, 1,
0.697634, -0.9504527, 3.415884, 0.5176471, 0, 1, 1,
0.7029708, -1.450538, 1.540845, 0.5254902, 0, 1, 1,
0.7162599, 0.4986051, -0.2903767, 0.5294118, 0, 1, 1,
0.7222331, -1.523217, -0.2626781, 0.5372549, 0, 1, 1,
0.7224308, -1.119681, 0.1006652, 0.5411765, 0, 1, 1,
0.7263165, -0.548777, 3.339286, 0.5490196, 0, 1, 1,
0.7397257, -0.2839698, 1.371274, 0.5529412, 0, 1, 1,
0.7466208, 0.540339, 2.74011, 0.5607843, 0, 1, 1,
0.7480531, 1.549337, 2.294713, 0.5647059, 0, 1, 1,
0.748697, -0.5871287, 0.6415988, 0.572549, 0, 1, 1,
0.7587223, 0.349763, 2.895537, 0.5764706, 0, 1, 1,
0.7641416, -0.3216231, 1.65608, 0.5843138, 0, 1, 1,
0.7646228, 0.5950826, 1.164488, 0.5882353, 0, 1, 1,
0.7684544, 0.9522892, -0.8185279, 0.5960785, 0, 1, 1,
0.769828, -0.3053642, 2.160704, 0.6039216, 0, 1, 1,
0.7716715, -1.007558, 0.6260244, 0.6078432, 0, 1, 1,
0.7731195, 1.438283, 1.128641, 0.6156863, 0, 1, 1,
0.7757806, -1.272786, 4.551232, 0.6196079, 0, 1, 1,
0.7819492, -0.5725778, 3.677484, 0.627451, 0, 1, 1,
0.781979, -0.1671907, 2.13638, 0.6313726, 0, 1, 1,
0.7823992, 0.9862227, 1.571178, 0.6392157, 0, 1, 1,
0.7887263, -0.3459708, 0.1601294, 0.6431373, 0, 1, 1,
0.7928331, -0.68724, 4.141819, 0.6509804, 0, 1, 1,
0.8019414, -0.7094175, 2.700504, 0.654902, 0, 1, 1,
0.8030626, -1.962037, 2.76521, 0.6627451, 0, 1, 1,
0.8040133, -1.609957, 2.550243, 0.6666667, 0, 1, 1,
0.8102265, -1.182871, 1.812845, 0.6745098, 0, 1, 1,
0.811199, -1.134717, 1.978484, 0.6784314, 0, 1, 1,
0.8126069, -0.8231078, 1.472417, 0.6862745, 0, 1, 1,
0.8149962, 0.8571806, 2.821721, 0.6901961, 0, 1, 1,
0.818413, 0.995033, -0.7778621, 0.6980392, 0, 1, 1,
0.820256, -0.1904816, 1.146788, 0.7058824, 0, 1, 1,
0.8215351, 2.441009, 0.06033676, 0.7098039, 0, 1, 1,
0.8215651, 0.4270356, 0.4295425, 0.7176471, 0, 1, 1,
0.8218321, 0.5024653, 2.787063, 0.7215686, 0, 1, 1,
0.8234026, 0.6850574, 0.8797781, 0.7294118, 0, 1, 1,
0.830902, 1.44188, 0.5267767, 0.7333333, 0, 1, 1,
0.8309532, -0.2950114, 0.5494833, 0.7411765, 0, 1, 1,
0.8317743, 1.019851, 0.4543942, 0.7450981, 0, 1, 1,
0.8339829, -1.015696, 3.314451, 0.7529412, 0, 1, 1,
0.8355941, 1.227247, -0.292001, 0.7568628, 0, 1, 1,
0.843842, -0.6014689, 1.19425, 0.7647059, 0, 1, 1,
0.845088, 2.106798, 0.7994674, 0.7686275, 0, 1, 1,
0.8494333, 0.8584971, 2.605584, 0.7764706, 0, 1, 1,
0.8564038, -1.205101, 2.179049, 0.7803922, 0, 1, 1,
0.8564359, 0.7389045, 0.7686381, 0.7882353, 0, 1, 1,
0.8593444, 0.3837025, 2.0582, 0.7921569, 0, 1, 1,
0.8599128, 0.9077009, 0.4635603, 0.8, 0, 1, 1,
0.863968, -0.07864064, 2.496247, 0.8078431, 0, 1, 1,
0.864256, 0.2654101, 2.789856, 0.8117647, 0, 1, 1,
0.8643246, -0.6667501, 2.513129, 0.8196079, 0, 1, 1,
0.8721983, -0.1080964, 1.923497, 0.8235294, 0, 1, 1,
0.8729364, 0.4212957, 1.981712, 0.8313726, 0, 1, 1,
0.8731344, -0.2584198, 2.33504, 0.8352941, 0, 1, 1,
0.8731751, -1.544819, 2.341332, 0.8431373, 0, 1, 1,
0.8762642, -1.73468, 3.057809, 0.8470588, 0, 1, 1,
0.8807262, 1.549528, 1.186316, 0.854902, 0, 1, 1,
0.8826724, 0.3350903, 2.166211, 0.8588235, 0, 1, 1,
0.8843185, -0.7832541, 3.708124, 0.8666667, 0, 1, 1,
0.8857998, 0.4208215, 1.071795, 0.8705882, 0, 1, 1,
0.8876677, -0.1979308, -0.2919184, 0.8784314, 0, 1, 1,
0.8923329, -0.8235703, 3.919683, 0.8823529, 0, 1, 1,
0.8963749, 0.5083265, 2.104025, 0.8901961, 0, 1, 1,
0.8986999, 0.2675518, 2.821664, 0.8941177, 0, 1, 1,
0.9015442, 0.7268881, 0.2337333, 0.9019608, 0, 1, 1,
0.9057865, 0.1317452, 0.3308808, 0.9098039, 0, 1, 1,
0.9077477, -0.8652163, 1.894843, 0.9137255, 0, 1, 1,
0.9112819, -0.4535177, 3.163797, 0.9215686, 0, 1, 1,
0.9113645, -2.01786, 3.160878, 0.9254902, 0, 1, 1,
0.911667, -0.03924806, 1.414512, 0.9333333, 0, 1, 1,
0.9134348, -1.397607, 1.624396, 0.9372549, 0, 1, 1,
0.9175552, 0.02498521, 2.18725, 0.945098, 0, 1, 1,
0.922389, -0.9335566, 2.776516, 0.9490196, 0, 1, 1,
0.92257, 1.250681, -0.3619265, 0.9568627, 0, 1, 1,
0.9290814, -1.06964, 2.307088, 0.9607843, 0, 1, 1,
0.9335886, -0.3253772, -0.5224207, 0.9686275, 0, 1, 1,
0.9405653, -1.248389, 2.21224, 0.972549, 0, 1, 1,
0.9410162, -0.720535, 3.761939, 0.9803922, 0, 1, 1,
0.9529028, -0.6523666, 2.582645, 0.9843137, 0, 1, 1,
0.9551221, 0.1272383, 1.537438, 0.9921569, 0, 1, 1,
0.9551452, 1.345162, 3.332383, 0.9960784, 0, 1, 1,
0.9605939, 1.446223, 2.193786, 1, 0, 0.9960784, 1,
0.9644464, -0.6674492, 0.5179519, 1, 0, 0.9882353, 1,
0.9694188, -0.08621856, 1.385796, 1, 0, 0.9843137, 1,
0.9720805, -0.446846, 1.629331, 1, 0, 0.9764706, 1,
0.9723784, 0.9188612, 1.696869, 1, 0, 0.972549, 1,
0.9726171, -0.02838013, 2.722102, 1, 0, 0.9647059, 1,
0.9757993, 0.5811402, -0.6555454, 1, 0, 0.9607843, 1,
0.9771692, -0.2185442, 3.126169, 1, 0, 0.9529412, 1,
0.9790016, -0.1237168, 1.361807, 1, 0, 0.9490196, 1,
0.9798281, 0.1685042, 1.383535, 1, 0, 0.9411765, 1,
0.9899215, -0.5926072, 2.092103, 1, 0, 0.9372549, 1,
1.002326, -0.9829414, 0.5877698, 1, 0, 0.9294118, 1,
1.00253, 0.701308, 1.562541, 1, 0, 0.9254902, 1,
1.005636, 0.7245847, 1.476553, 1, 0, 0.9176471, 1,
1.006879, -0.9449964, 1.094064, 1, 0, 0.9137255, 1,
1.008749, 0.8926603, -1.043568, 1, 0, 0.9058824, 1,
1.010382, -0.9284245, 3.288297, 1, 0, 0.9019608, 1,
1.013975, -1.10093, 2.23297, 1, 0, 0.8941177, 1,
1.018031, 0.6793427, 2.402612, 1, 0, 0.8862745, 1,
1.021864, 0.7257554, 0.3944901, 1, 0, 0.8823529, 1,
1.02589, -0.4223576, 1.281373, 1, 0, 0.8745098, 1,
1.027655, 0.04681726, 1.967275, 1, 0, 0.8705882, 1,
1.030203, -0.6148672, 3.180914, 1, 0, 0.8627451, 1,
1.030682, 0.5127603, 0.6996917, 1, 0, 0.8588235, 1,
1.032334, -1.011835, -0.05591909, 1, 0, 0.8509804, 1,
1.036108, -0.9533767, 0.2685713, 1, 0, 0.8470588, 1,
1.036216, 0.4724722, 0.1680497, 1, 0, 0.8392157, 1,
1.039812, -0.9879919, 4.175126, 1, 0, 0.8352941, 1,
1.042968, 0.8591036, 0.9966591, 1, 0, 0.827451, 1,
1.043551, -0.2616418, 1.298009, 1, 0, 0.8235294, 1,
1.043755, -0.06843891, 1.289375, 1, 0, 0.8156863, 1,
1.04475, -0.6548071, 0.7877846, 1, 0, 0.8117647, 1,
1.045766, -1.37155, 3.358703, 1, 0, 0.8039216, 1,
1.051293, 0.5464375, 0.5590291, 1, 0, 0.7960784, 1,
1.057521, -1.024145, 2.888518, 1, 0, 0.7921569, 1,
1.063561, 2.763464, -1.311471, 1, 0, 0.7843137, 1,
1.067825, -1.375735, 3.600111, 1, 0, 0.7803922, 1,
1.081586, -0.04298957, 2.153338, 1, 0, 0.772549, 1,
1.084761, 1.613843, 0.6310836, 1, 0, 0.7686275, 1,
1.094065, 0.830551, 2.916499, 1, 0, 0.7607843, 1,
1.096943, 1.480402, 0.8404244, 1, 0, 0.7568628, 1,
1.1082, -0.5039203, 3.052244, 1, 0, 0.7490196, 1,
1.110482, -0.1549969, 2.590747, 1, 0, 0.7450981, 1,
1.110826, 0.1390984, 0.3187596, 1, 0, 0.7372549, 1,
1.112037, 0.3388852, 1.160272, 1, 0, 0.7333333, 1,
1.120952, 0.7445711, 0.4630911, 1, 0, 0.7254902, 1,
1.125774, 0.1960734, 3.150784, 1, 0, 0.7215686, 1,
1.128554, 1.661358, 0.5309976, 1, 0, 0.7137255, 1,
1.131618, -0.232144, 1.198242, 1, 0, 0.7098039, 1,
1.135404, -1.220809, 3.419392, 1, 0, 0.7019608, 1,
1.136313, -3.38309, 1.743401, 1, 0, 0.6941177, 1,
1.137132, 1.158818, 0.6028171, 1, 0, 0.6901961, 1,
1.141006, 1.336405, 1.684181, 1, 0, 0.682353, 1,
1.146819, -0.2452015, 2.553856, 1, 0, 0.6784314, 1,
1.150381, 1.261142, 1.254241, 1, 0, 0.6705883, 1,
1.151586, -0.4361273, 2.314384, 1, 0, 0.6666667, 1,
1.153812, -0.2814977, 3.139705, 1, 0, 0.6588235, 1,
1.156738, 0.2362198, 1.131155, 1, 0, 0.654902, 1,
1.160074, -0.3329749, 0.2049004, 1, 0, 0.6470588, 1,
1.160146, -2.166086, 1.595958, 1, 0, 0.6431373, 1,
1.18033, 0.663489, -0.4382998, 1, 0, 0.6352941, 1,
1.189758, 1.720023, 2.489779, 1, 0, 0.6313726, 1,
1.194573, 0.1086752, 0.9252191, 1, 0, 0.6235294, 1,
1.203506, -0.9729708, 0.2702447, 1, 0, 0.6196079, 1,
1.215964, -0.07726837, 1.534015, 1, 0, 0.6117647, 1,
1.230875, 0.5268164, -0.07583071, 1, 0, 0.6078432, 1,
1.231925, 1.60483, 0.8546411, 1, 0, 0.6, 1,
1.232059, -0.2033366, 2.47823, 1, 0, 0.5921569, 1,
1.233936, -0.8622972, 3.312131, 1, 0, 0.5882353, 1,
1.24605, -0.2122497, 2.104061, 1, 0, 0.5803922, 1,
1.25005, -0.2451582, 2.470245, 1, 0, 0.5764706, 1,
1.258857, 0.4932945, 1.077909, 1, 0, 0.5686275, 1,
1.260505, 1.313402, 0.5955092, 1, 0, 0.5647059, 1,
1.261967, -0.6318663, -0.177292, 1, 0, 0.5568628, 1,
1.27358, -0.4948102, 1.628691, 1, 0, 0.5529412, 1,
1.280245, -0.03384826, 1.266393, 1, 0, 0.5450981, 1,
1.283838, 1.186695, -0.2736796, 1, 0, 0.5411765, 1,
1.293425, -0.1778686, 2.468971, 1, 0, 0.5333334, 1,
1.299715, -0.3610523, 2.457464, 1, 0, 0.5294118, 1,
1.301839, 0.50587, 0.5721229, 1, 0, 0.5215687, 1,
1.310727, -0.7848437, 3.658225, 1, 0, 0.5176471, 1,
1.317495, -1.751598, 4.754963, 1, 0, 0.509804, 1,
1.317904, 0.3677122, 1.397749, 1, 0, 0.5058824, 1,
1.319529, 0.1390534, 2.718811, 1, 0, 0.4980392, 1,
1.33364, -0.7423455, 2.525758, 1, 0, 0.4901961, 1,
1.334871, 0.0137575, 0.3692751, 1, 0, 0.4862745, 1,
1.352478, -2.145745, 2.586265, 1, 0, 0.4784314, 1,
1.375167, -0.8193833, 1.190175, 1, 0, 0.4745098, 1,
1.380041, -0.3544572, 3.029269, 1, 0, 0.4666667, 1,
1.384492, 1.073026, 1.197607, 1, 0, 0.4627451, 1,
1.416403, 0.8419808, 1.448343, 1, 0, 0.454902, 1,
1.421317, 1.81965, 0.356203, 1, 0, 0.4509804, 1,
1.425683, -0.5071596, 2.331244, 1, 0, 0.4431373, 1,
1.434974, -2.054002, 1.438606, 1, 0, 0.4392157, 1,
1.437782, -0.5756041, 0.763132, 1, 0, 0.4313726, 1,
1.440134, 0.180711, 3.686128, 1, 0, 0.427451, 1,
1.445801, -0.05657266, 1.27202, 1, 0, 0.4196078, 1,
1.448772, 1.437696, 2.823329, 1, 0, 0.4156863, 1,
1.448984, 0.6453317, -0.0203181, 1, 0, 0.4078431, 1,
1.460448, -0.8524019, 1.994245, 1, 0, 0.4039216, 1,
1.46823, 0.03304522, 1.132467, 1, 0, 0.3960784, 1,
1.472712, 0.8010979, 1.35197, 1, 0, 0.3882353, 1,
1.472965, 0.5061958, 1.278816, 1, 0, 0.3843137, 1,
1.488965, -0.4342456, 1.621544, 1, 0, 0.3764706, 1,
1.493708, 0.540236, 1.909197, 1, 0, 0.372549, 1,
1.496077, -0.6723238, 1.169441, 1, 0, 0.3647059, 1,
1.499252, 1.655923, 1.773676, 1, 0, 0.3607843, 1,
1.500423, -1.002048, -0.2650562, 1, 0, 0.3529412, 1,
1.512846, -0.5458606, 1.056437, 1, 0, 0.3490196, 1,
1.534011, 0.8161064, 2.373812, 1, 0, 0.3411765, 1,
1.561437, -0.07752053, 0.1569625, 1, 0, 0.3372549, 1,
1.569116, -2.116937, 2.779442, 1, 0, 0.3294118, 1,
1.570709, -0.7275528, 0.849385, 1, 0, 0.3254902, 1,
1.589906, 1.108015, 1.976805, 1, 0, 0.3176471, 1,
1.598537, -1.159819, 1.284635, 1, 0, 0.3137255, 1,
1.601454, 0.3588784, 2.864533, 1, 0, 0.3058824, 1,
1.602534, -0.9166056, 2.123689, 1, 0, 0.2980392, 1,
1.619437, -0.8982207, 0.9405814, 1, 0, 0.2941177, 1,
1.631411, 0.5391946, 2.032839, 1, 0, 0.2862745, 1,
1.63524, -0.2609341, 1.259109, 1, 0, 0.282353, 1,
1.638038, -1.224849, 4.552533, 1, 0, 0.2745098, 1,
1.700864, 0.1756042, 1.411239, 1, 0, 0.2705882, 1,
1.706448, -0.724108, 1.226185, 1, 0, 0.2627451, 1,
1.728494, -1.331814, 4.182751, 1, 0, 0.2588235, 1,
1.750845, -0.6143392, 1.185564, 1, 0, 0.2509804, 1,
1.768478, -0.2025317, 2.361775, 1, 0, 0.2470588, 1,
1.810366, 1.474038, 0.3790576, 1, 0, 0.2392157, 1,
1.815725, -0.4226631, 1.074264, 1, 0, 0.2352941, 1,
1.815867, -0.8531341, 0.7025113, 1, 0, 0.227451, 1,
1.833496, 1.062511, 0.6605764, 1, 0, 0.2235294, 1,
1.843689, 0.3004337, 0.8524852, 1, 0, 0.2156863, 1,
1.846112, 0.1069492, 1.939687, 1, 0, 0.2117647, 1,
1.846408, 0.009877237, 2.704932, 1, 0, 0.2039216, 1,
1.852181, 0.09685969, 2.069051, 1, 0, 0.1960784, 1,
1.911177, -0.5738911, 1.741638, 1, 0, 0.1921569, 1,
1.917249, 0.353417, 2.174236, 1, 0, 0.1843137, 1,
1.919558, -1.139357, 3.256409, 1, 0, 0.1803922, 1,
1.922678, -0.2699047, 1.207148, 1, 0, 0.172549, 1,
1.933599, 1.391439, 1.764412, 1, 0, 0.1686275, 1,
1.955712, 1.503272, 0.822698, 1, 0, 0.1607843, 1,
1.959056, 0.9243238, 1.507266, 1, 0, 0.1568628, 1,
1.962866, 1.074333, -0.003160607, 1, 0, 0.1490196, 1,
1.969947, -0.4556359, 1.139636, 1, 0, 0.145098, 1,
1.971088, 1.203236, 1.041867, 1, 0, 0.1372549, 1,
1.975191, -0.5208378, 2.326607, 1, 0, 0.1333333, 1,
1.995774, -1.862208, 2.224249, 1, 0, 0.1254902, 1,
2.007694, 0.00325237, 2.569798, 1, 0, 0.1215686, 1,
2.04988, -1.06368, 1.371676, 1, 0, 0.1137255, 1,
2.074265, -0.05450588, 1.76656, 1, 0, 0.1098039, 1,
2.102378, 0.5209407, 0.9770802, 1, 0, 0.1019608, 1,
2.108878, -0.1916598, 3.118402, 1, 0, 0.09411765, 1,
2.155098, 0.6817834, 0.9617827, 1, 0, 0.09019608, 1,
2.187242, 0.6962984, 1.781111, 1, 0, 0.08235294, 1,
2.197244, 0.5256016, -0.6275572, 1, 0, 0.07843138, 1,
2.231176, 0.3580176, 2.123535, 1, 0, 0.07058824, 1,
2.242751, -2.224885, 3.826422, 1, 0, 0.06666667, 1,
2.272315, 0.7542174, 2.743246, 1, 0, 0.05882353, 1,
2.276493, 1.884456, 0.2187098, 1, 0, 0.05490196, 1,
2.408927, 0.5580304, 0.577095, 1, 0, 0.04705882, 1,
2.414978, -0.6587397, 1.518774, 1, 0, 0.04313726, 1,
2.617869, 0.6778178, 0.2033427, 1, 0, 0.03529412, 1,
2.640425, -1.312291, 0.5509184, 1, 0, 0.03137255, 1,
2.664805, -1.14367, 2.916776, 1, 0, 0.02352941, 1,
2.750221, -0.1396819, 2.915996, 1, 0, 0.01960784, 1,
2.891414, 0.04996484, 2.637903, 1, 0, 0.01176471, 1,
3.249259, -0.7482335, 3.359324, 1, 0, 0.007843138, 1
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
-0.3771105, -4.538913, -7.165044, 0, -0.5, 0.5, 0.5,
-0.3771105, -4.538913, -7.165044, 1, -0.5, 0.5, 0.5,
-0.3771105, -4.538913, -7.165044, 1, 1.5, 0.5, 0.5,
-0.3771105, -4.538913, -7.165044, 0, 1.5, 0.5, 0.5
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
-5.232819, 0.02641737, -7.165044, 0, -0.5, 0.5, 0.5,
-5.232819, 0.02641737, -7.165044, 1, -0.5, 0.5, 0.5,
-5.232819, 0.02641737, -7.165044, 1, 1.5, 0.5, 0.5,
-5.232819, 0.02641737, -7.165044, 0, 1.5, 0.5, 0.5
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
-5.232819, -4.538913, -0.1685636, 0, -0.5, 0.5, 0.5,
-5.232819, -4.538913, -0.1685636, 1, -0.5, 0.5, 0.5,
-5.232819, -4.538913, -0.1685636, 1, 1.5, 0.5, 0.5,
-5.232819, -4.538913, -0.1685636, 0, 1.5, 0.5, 0.5
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
-4, -3.485375, -5.550471,
2, -3.485375, -5.550471,
-4, -3.485375, -5.550471,
-4, -3.660965, -5.819567,
-2, -3.485375, -5.550471,
-2, -3.660965, -5.819567,
0, -3.485375, -5.550471,
0, -3.660965, -5.819567,
2, -3.485375, -5.550471,
2, -3.660965, -5.819567
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
-4, -4.012144, -6.357758, 0, -0.5, 0.5, 0.5,
-4, -4.012144, -6.357758, 1, -0.5, 0.5, 0.5,
-4, -4.012144, -6.357758, 1, 1.5, 0.5, 0.5,
-4, -4.012144, -6.357758, 0, 1.5, 0.5, 0.5,
-2, -4.012144, -6.357758, 0, -0.5, 0.5, 0.5,
-2, -4.012144, -6.357758, 1, -0.5, 0.5, 0.5,
-2, -4.012144, -6.357758, 1, 1.5, 0.5, 0.5,
-2, -4.012144, -6.357758, 0, 1.5, 0.5, 0.5,
0, -4.012144, -6.357758, 0, -0.5, 0.5, 0.5,
0, -4.012144, -6.357758, 1, -0.5, 0.5, 0.5,
0, -4.012144, -6.357758, 1, 1.5, 0.5, 0.5,
0, -4.012144, -6.357758, 0, 1.5, 0.5, 0.5,
2, -4.012144, -6.357758, 0, -0.5, 0.5, 0.5,
2, -4.012144, -6.357758, 1, -0.5, 0.5, 0.5,
2, -4.012144, -6.357758, 1, 1.5, 0.5, 0.5,
2, -4.012144, -6.357758, 0, 1.5, 0.5, 0.5
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
-4.112271, -3, -5.550471,
-4.112271, 3, -5.550471,
-4.112271, -3, -5.550471,
-4.299029, -3, -5.819567,
-4.112271, -2, -5.550471,
-4.299029, -2, -5.819567,
-4.112271, -1, -5.550471,
-4.299029, -1, -5.819567,
-4.112271, 0, -5.550471,
-4.299029, 0, -5.819567,
-4.112271, 1, -5.550471,
-4.299029, 1, -5.819567,
-4.112271, 2, -5.550471,
-4.299029, 2, -5.819567,
-4.112271, 3, -5.550471,
-4.299029, 3, -5.819567
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
-4.672545, -3, -6.357758, 0, -0.5, 0.5, 0.5,
-4.672545, -3, -6.357758, 1, -0.5, 0.5, 0.5,
-4.672545, -3, -6.357758, 1, 1.5, 0.5, 0.5,
-4.672545, -3, -6.357758, 0, 1.5, 0.5, 0.5,
-4.672545, -2, -6.357758, 0, -0.5, 0.5, 0.5,
-4.672545, -2, -6.357758, 1, -0.5, 0.5, 0.5,
-4.672545, -2, -6.357758, 1, 1.5, 0.5, 0.5,
-4.672545, -2, -6.357758, 0, 1.5, 0.5, 0.5,
-4.672545, -1, -6.357758, 0, -0.5, 0.5, 0.5,
-4.672545, -1, -6.357758, 1, -0.5, 0.5, 0.5,
-4.672545, -1, -6.357758, 1, 1.5, 0.5, 0.5,
-4.672545, -1, -6.357758, 0, 1.5, 0.5, 0.5,
-4.672545, 0, -6.357758, 0, -0.5, 0.5, 0.5,
-4.672545, 0, -6.357758, 1, -0.5, 0.5, 0.5,
-4.672545, 0, -6.357758, 1, 1.5, 0.5, 0.5,
-4.672545, 0, -6.357758, 0, 1.5, 0.5, 0.5,
-4.672545, 1, -6.357758, 0, -0.5, 0.5, 0.5,
-4.672545, 1, -6.357758, 1, -0.5, 0.5, 0.5,
-4.672545, 1, -6.357758, 1, 1.5, 0.5, 0.5,
-4.672545, 1, -6.357758, 0, 1.5, 0.5, 0.5,
-4.672545, 2, -6.357758, 0, -0.5, 0.5, 0.5,
-4.672545, 2, -6.357758, 1, -0.5, 0.5, 0.5,
-4.672545, 2, -6.357758, 1, 1.5, 0.5, 0.5,
-4.672545, 2, -6.357758, 0, 1.5, 0.5, 0.5,
-4.672545, 3, -6.357758, 0, -0.5, 0.5, 0.5,
-4.672545, 3, -6.357758, 1, -0.5, 0.5, 0.5,
-4.672545, 3, -6.357758, 1, 1.5, 0.5, 0.5,
-4.672545, 3, -6.357758, 0, 1.5, 0.5, 0.5
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
-4.112271, -3.485375, -4,
-4.112271, -3.485375, 4,
-4.112271, -3.485375, -4,
-4.299029, -3.660965, -4,
-4.112271, -3.485375, -2,
-4.299029, -3.660965, -2,
-4.112271, -3.485375, 0,
-4.299029, -3.660965, 0,
-4.112271, -3.485375, 2,
-4.299029, -3.660965, 2,
-4.112271, -3.485375, 4,
-4.299029, -3.660965, 4
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
-4.672545, -4.012144, -4, 0, -0.5, 0.5, 0.5,
-4.672545, -4.012144, -4, 1, -0.5, 0.5, 0.5,
-4.672545, -4.012144, -4, 1, 1.5, 0.5, 0.5,
-4.672545, -4.012144, -4, 0, 1.5, 0.5, 0.5,
-4.672545, -4.012144, -2, 0, -0.5, 0.5, 0.5,
-4.672545, -4.012144, -2, 1, -0.5, 0.5, 0.5,
-4.672545, -4.012144, -2, 1, 1.5, 0.5, 0.5,
-4.672545, -4.012144, -2, 0, 1.5, 0.5, 0.5,
-4.672545, -4.012144, 0, 0, -0.5, 0.5, 0.5,
-4.672545, -4.012144, 0, 1, -0.5, 0.5, 0.5,
-4.672545, -4.012144, 0, 1, 1.5, 0.5, 0.5,
-4.672545, -4.012144, 0, 0, 1.5, 0.5, 0.5,
-4.672545, -4.012144, 2, 0, -0.5, 0.5, 0.5,
-4.672545, -4.012144, 2, 1, -0.5, 0.5, 0.5,
-4.672545, -4.012144, 2, 1, 1.5, 0.5, 0.5,
-4.672545, -4.012144, 2, 0, 1.5, 0.5, 0.5,
-4.672545, -4.012144, 4, 0, -0.5, 0.5, 0.5,
-4.672545, -4.012144, 4, 1, -0.5, 0.5, 0.5,
-4.672545, -4.012144, 4, 1, 1.5, 0.5, 0.5,
-4.672545, -4.012144, 4, 0, 1.5, 0.5, 0.5
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
-4.112271, -3.485375, -5.550471,
-4.112271, 3.53821, -5.550471,
-4.112271, -3.485375, 5.213344,
-4.112271, 3.53821, 5.213344,
-4.112271, -3.485375, -5.550471,
-4.112271, -3.485375, 5.213344,
-4.112271, 3.53821, -5.550471,
-4.112271, 3.53821, 5.213344,
-4.112271, -3.485375, -5.550471,
3.35805, -3.485375, -5.550471,
-4.112271, -3.485375, 5.213344,
3.35805, -3.485375, 5.213344,
-4.112271, 3.53821, -5.550471,
3.35805, 3.53821, -5.550471,
-4.112271, 3.53821, 5.213344,
3.35805, 3.53821, 5.213344,
3.35805, -3.485375, -5.550471,
3.35805, 3.53821, -5.550471,
3.35805, -3.485375, 5.213344,
3.35805, 3.53821, 5.213344,
3.35805, -3.485375, -5.550471,
3.35805, -3.485375, 5.213344,
3.35805, 3.53821, -5.550471,
3.35805, 3.53821, 5.213344
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
var radius = 7.938123;
var distance = 35.31761;
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
mvMatrix.translate( 0.3771105, -0.02641737, 0.1685636 );
mvMatrix.scale( 1.148927, 1.222005, 0.7973803 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.31761);
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
hexythiazox<-read.table("hexythiazox.xyz")
```

```
## Error in read.table("hexythiazox.xyz"): no lines available in input
```

```r
x<-hexythiazox$V2
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
```

```r
y<-hexythiazox$V3
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
```

```r
z<-hexythiazox$V4
```

```
## Error in eval(expr, envir, enclos): object 'hexythiazox' not found
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
-4.00348, -0.3450639, -2.62947, 0, 0, 1, 1, 1,
-3.487546, 0.2738597, -2.620708, 1, 0, 0, 1, 1,
-2.928795, 0.1211432, -1.637837, 1, 0, 0, 1, 1,
-2.816918, -2.069841, -1.964496, 1, 0, 0, 1, 1,
-2.747424, -0.1756668, -2.055001, 1, 0, 0, 1, 1,
-2.655082, 0.2292667, -4.649879, 1, 0, 0, 1, 1,
-2.640715, 2.236252, 0.5312669, 0, 0, 0, 1, 1,
-2.607027, -0.201197, -0.9129621, 0, 0, 0, 1, 1,
-2.587911, 0.3397934, -1.029814, 0, 0, 0, 1, 1,
-2.510963, -0.1585114, -1.001688, 0, 0, 0, 1, 1,
-2.462048, -0.4844207, -4.657063, 0, 0, 0, 1, 1,
-2.447285, 0.4167606, -1.943611, 0, 0, 0, 1, 1,
-2.393245, 0.1190934, -4.121456, 0, 0, 0, 1, 1,
-2.333844, 0.8783864, -1.722011, 1, 1, 1, 1, 1,
-2.310933, -0.401152, -1.225244, 1, 1, 1, 1, 1,
-2.300704, 0.7853581, -3.405185, 1, 1, 1, 1, 1,
-2.285914, -1.593658, -1.247882, 1, 1, 1, 1, 1,
-2.268111, 0.4731497, -3.344503, 1, 1, 1, 1, 1,
-2.259434, -1.820457, -3.741285, 1, 1, 1, 1, 1,
-2.234584, 0.4249047, -1.165177, 1, 1, 1, 1, 1,
-2.220073, 1.447273, -2.492577, 1, 1, 1, 1, 1,
-2.182729, 1.003334, -0.08663062, 1, 1, 1, 1, 1,
-2.147335, -2.502196, -1.500728, 1, 1, 1, 1, 1,
-2.143067, 1.803053, 0.5461329, 1, 1, 1, 1, 1,
-2.117928, -0.388807, -2.559154, 1, 1, 1, 1, 1,
-2.099716, 0.3204609, -2.439991, 1, 1, 1, 1, 1,
-2.075132, 1.565117, -0.5366976, 1, 1, 1, 1, 1,
-2.064619, -0.4623617, -0.7911019, 1, 1, 1, 1, 1,
-2.060768, 0.6107204, -0.3696013, 0, 0, 1, 1, 1,
-2.054369, -1.009499, -1.696074, 1, 0, 0, 1, 1,
-2.045683, 0.7495615, -1.191855, 1, 0, 0, 1, 1,
-2.011996, -1.716143, -2.48481, 1, 0, 0, 1, 1,
-1.985632, 1.768549, -0.8728654, 1, 0, 0, 1, 1,
-1.958227, 1.66993, 1.667357, 1, 0, 0, 1, 1,
-1.92803, -0.3394286, -2.405378, 0, 0, 0, 1, 1,
-1.918276, 1.218574, -0.8808848, 0, 0, 0, 1, 1,
-1.894046, 0.8569871, -0.5836006, 0, 0, 0, 1, 1,
-1.883768, 0.481151, -2.731704, 0, 0, 0, 1, 1,
-1.858794, 1.812858, -1.051481, 0, 0, 0, 1, 1,
-1.852809, 0.5534576, -2.23576, 0, 0, 0, 1, 1,
-1.839351, -0.2257207, -2.685245, 0, 0, 0, 1, 1,
-1.835277, -1.92349, -1.561819, 1, 1, 1, 1, 1,
-1.826777, 1.414387, -1.51951, 1, 1, 1, 1, 1,
-1.819128, 1.557716, -2.887311, 1, 1, 1, 1, 1,
-1.817661, -0.7861568, -2.406716, 1, 1, 1, 1, 1,
-1.811025, 0.0763808, -1.66355, 1, 1, 1, 1, 1,
-1.785641, -0.3224528, -1.526005, 1, 1, 1, 1, 1,
-1.778966, 0.3069359, -1.690091, 1, 1, 1, 1, 1,
-1.768005, -0.8375329, -1.584621, 1, 1, 1, 1, 1,
-1.757129, 2.055631, -0.3620338, 1, 1, 1, 1, 1,
-1.741143, 1.621162, -0.8718286, 1, 1, 1, 1, 1,
-1.725027, -0.4302525, -0.6658661, 1, 1, 1, 1, 1,
-1.71969, -0.5245581, -2.298747, 1, 1, 1, 1, 1,
-1.718973, 0.3994334, -1.98636, 1, 1, 1, 1, 1,
-1.717098, 0.5331211, -0.4102818, 1, 1, 1, 1, 1,
-1.710844, 0.5567648, -0.15629, 1, 1, 1, 1, 1,
-1.708453, 0.4214327, -2.284659, 0, 0, 1, 1, 1,
-1.678064, -0.1841596, -1.802516, 1, 0, 0, 1, 1,
-1.67384, -0.2031765, -2.434132, 1, 0, 0, 1, 1,
-1.665582, -0.8659055, -1.48539, 1, 0, 0, 1, 1,
-1.659542, 0.2464057, -2.23907, 1, 0, 0, 1, 1,
-1.650621, -0.3213788, -1.02334, 1, 0, 0, 1, 1,
-1.629528, 0.2238579, -1.054034, 0, 0, 0, 1, 1,
-1.592498, -1.897635, -2.427128, 0, 0, 0, 1, 1,
-1.580739, -1.671361, -2.141172, 0, 0, 0, 1, 1,
-1.577889, 0.2218584, -2.056555, 0, 0, 0, 1, 1,
-1.574654, -0.2231217, -0.576195, 0, 0, 0, 1, 1,
-1.56914, 0.4239093, -2.481796, 0, 0, 0, 1, 1,
-1.568904, -0.2835631, -2.816117, 0, 0, 0, 1, 1,
-1.558416, -0.05580191, -1.67805, 1, 1, 1, 1, 1,
-1.556795, 2.00385, 0.2687018, 1, 1, 1, 1, 1,
-1.546964, 0.1662095, -0.5419252, 1, 1, 1, 1, 1,
-1.538171, 2.186492, -1.354324, 1, 1, 1, 1, 1,
-1.530321, -0.2920634, -1.934312, 1, 1, 1, 1, 1,
-1.504843, 1.396909, -0.3329036, 1, 1, 1, 1, 1,
-1.49152, -0.476238, -0.980172, 1, 1, 1, 1, 1,
-1.486743, 0.5988949, -0.7342969, 1, 1, 1, 1, 1,
-1.483137, -2.521283, -2.245275, 1, 1, 1, 1, 1,
-1.482016, 0.9212739, -1.183451, 1, 1, 1, 1, 1,
-1.465063, -0.1991395, -1.028425, 1, 1, 1, 1, 1,
-1.464551, 1.617447, -0.1920916, 1, 1, 1, 1, 1,
-1.452308, -0.05144513, -2.67133, 1, 1, 1, 1, 1,
-1.451966, 0.4259661, -0.3758116, 1, 1, 1, 1, 1,
-1.442978, -0.5464861, -2.770361, 1, 1, 1, 1, 1,
-1.441956, -0.851945, -2.729033, 0, 0, 1, 1, 1,
-1.440768, -0.6607062, -1.217607, 1, 0, 0, 1, 1,
-1.437678, 0.3462111, -0.001915534, 1, 0, 0, 1, 1,
-1.433822, -0.5027941, -0.9900758, 1, 0, 0, 1, 1,
-1.423813, -1.36549, -1.259531, 1, 0, 0, 1, 1,
-1.409845, 0.40494, 0.1705595, 1, 0, 0, 1, 1,
-1.393439, 1.520491, -1.613134, 0, 0, 0, 1, 1,
-1.391009, 0.2778559, -1.400915, 0, 0, 0, 1, 1,
-1.381378, -0.9663255, -1.495779, 0, 0, 0, 1, 1,
-1.376959, -0.9666483, -0.8866286, 0, 0, 0, 1, 1,
-1.374599, -0.6636372, -3.490967, 0, 0, 0, 1, 1,
-1.374141, 0.4300996, -0.5095122, 0, 0, 0, 1, 1,
-1.371163, -0.8918779, -2.23029, 0, 0, 0, 1, 1,
-1.339604, 0.2968458, -1.439167, 1, 1, 1, 1, 1,
-1.334867, 0.9309015, 0.1752495, 1, 1, 1, 1, 1,
-1.322055, -1.181283, -2.490575, 1, 1, 1, 1, 1,
-1.308887, 1.068871, 1.835899, 1, 1, 1, 1, 1,
-1.302383, -1.240156, -4.363037, 1, 1, 1, 1, 1,
-1.300433, 0.2487434, -2.174384, 1, 1, 1, 1, 1,
-1.295953, 0.2733311, -2.902203, 1, 1, 1, 1, 1,
-1.290137, -1.836278, -2.025351, 1, 1, 1, 1, 1,
-1.289074, 0.1663353, -0.9779893, 1, 1, 1, 1, 1,
-1.283003, -0.5416585, -1.038277, 1, 1, 1, 1, 1,
-1.280435, -0.1057513, -2.140064, 1, 1, 1, 1, 1,
-1.277033, 1.528033, -1.598769, 1, 1, 1, 1, 1,
-1.273562, -0.892863, -2.013513, 1, 1, 1, 1, 1,
-1.264587, -2.204664, -2.16714, 1, 1, 1, 1, 1,
-1.262824, -1.329454, -2.039014, 1, 1, 1, 1, 1,
-1.256499, -0.6187319, -2.763056, 0, 0, 1, 1, 1,
-1.230873, 0.3372187, -0.3318113, 1, 0, 0, 1, 1,
-1.227191, 0.4418853, -1.439285, 1, 0, 0, 1, 1,
-1.226114, -0.8397992, -1.653803, 1, 0, 0, 1, 1,
-1.212474, -0.6181116, -1.236512, 1, 0, 0, 1, 1,
-1.20863, -0.5709669, -0.6074032, 1, 0, 0, 1, 1,
-1.1927, 0.3924471, 0.06998695, 0, 0, 0, 1, 1,
-1.188658, 1.603953, -1.257696, 0, 0, 0, 1, 1,
-1.179498, 0.4779104, -1.526913, 0, 0, 0, 1, 1,
-1.159187, 1.132901, -0.6167122, 0, 0, 0, 1, 1,
-1.152626, -0.7732884, -3.256138, 0, 0, 0, 1, 1,
-1.151724, 0.01527884, -0.55133, 0, 0, 0, 1, 1,
-1.150624, 0.3389684, -0.6281009, 0, 0, 0, 1, 1,
-1.143326, -1.668092, -0.9661973, 1, 1, 1, 1, 1,
-1.143196, 0.1649708, -2.393716, 1, 1, 1, 1, 1,
-1.14184, -1.029384, -2.732827, 1, 1, 1, 1, 1,
-1.130312, 0.6385753, -1.301577, 1, 1, 1, 1, 1,
-1.126248, 0.02619369, -3.143317, 1, 1, 1, 1, 1,
-1.121228, 0.4704303, -1.315687, 1, 1, 1, 1, 1,
-1.118477, 0.2505555, -1.777515, 1, 1, 1, 1, 1,
-1.114711, -0.4529683, -1.797874, 1, 1, 1, 1, 1,
-1.114541, 0.5653745, -2.791889, 1, 1, 1, 1, 1,
-1.105206, 0.8060116, -1.017575, 1, 1, 1, 1, 1,
-1.097574, -1.321459, -2.438694, 1, 1, 1, 1, 1,
-1.096388, -1.206162, -2.189993, 1, 1, 1, 1, 1,
-1.091421, 1.475716, -0.5236551, 1, 1, 1, 1, 1,
-1.084152, 0.6104485, 0.2462437, 1, 1, 1, 1, 1,
-1.078262, -1.411826, -1.355148, 1, 1, 1, 1, 1,
-1.058707, 0.05397748, -1.671826, 0, 0, 1, 1, 1,
-1.05771, -1.293526, -2.296343, 1, 0, 0, 1, 1,
-1.055937, -1.409605, -2.568189, 1, 0, 0, 1, 1,
-1.05098, 0.4365176, -0.9823731, 1, 0, 0, 1, 1,
-1.049105, -0.9679113, -1.790266, 1, 0, 0, 1, 1,
-1.043593, 0.7598425, -1.954656, 1, 0, 0, 1, 1,
-1.036109, 0.04661141, -2.897446, 0, 0, 0, 1, 1,
-1.029198, 1.642154, -0.6439983, 0, 0, 0, 1, 1,
-1.024752, 0.6485497, -2.743346, 0, 0, 0, 1, 1,
-1.017057, 0.161975, -2.45033, 0, 0, 0, 1, 1,
-1.013684, -0.742111, -2.669436, 0, 0, 0, 1, 1,
-0.9971617, 1.348381, -0.4107422, 0, 0, 0, 1, 1,
-0.989929, -1.113262, -3.531982, 0, 0, 0, 1, 1,
-0.9797108, 0.2185136, -2.769671, 1, 1, 1, 1, 1,
-0.9790944, -1.645822, -1.903601, 1, 1, 1, 1, 1,
-0.9721321, -0.9397237, -1.933709, 1, 1, 1, 1, 1,
-0.970111, 1.762639, -0.7985913, 1, 1, 1, 1, 1,
-0.9687714, -0.3521349, -1.677137, 1, 1, 1, 1, 1,
-0.96619, -0.7347591, -2.350844, 1, 1, 1, 1, 1,
-0.9645146, 0.6734354, 0.5183876, 1, 1, 1, 1, 1,
-0.9635957, -0.3380369, -2.845735, 1, 1, 1, 1, 1,
-0.9582567, -0.06141735, -1.105137, 1, 1, 1, 1, 1,
-0.9559065, 0.2835284, -1.875787, 1, 1, 1, 1, 1,
-0.9486843, -0.7999631, -5.393717, 1, 1, 1, 1, 1,
-0.9375384, -0.3309868, -1.923139, 1, 1, 1, 1, 1,
-0.9296553, -1.279787, -1.628715, 1, 1, 1, 1, 1,
-0.9248495, -0.3988815, -1.022064, 1, 1, 1, 1, 1,
-0.9221247, 1.602463, 0.155357, 1, 1, 1, 1, 1,
-0.9189537, 0.4431933, 0.6476843, 0, 0, 1, 1, 1,
-0.9125894, 1.392113, 0.6786143, 1, 0, 0, 1, 1,
-0.912558, 0.5444958, -2.048345, 1, 0, 0, 1, 1,
-0.9114236, -0.9352968, -2.806077, 1, 0, 0, 1, 1,
-0.9046105, 0.7331439, -0.6785687, 1, 0, 0, 1, 1,
-0.8997121, 1.455553, -0.7026607, 1, 0, 0, 1, 1,
-0.8941535, 0.4366675, -1.25459, 0, 0, 0, 1, 1,
-0.8865668, 1.066542, 0.354977, 0, 0, 0, 1, 1,
-0.885561, 0.7302559, -0.6939673, 0, 0, 0, 1, 1,
-0.878233, -1.001345, -2.732268, 0, 0, 0, 1, 1,
-0.8773946, -0.9652483, 0.2670497, 0, 0, 0, 1, 1,
-0.8770624, -1.268117, -3.385104, 0, 0, 0, 1, 1,
-0.8743258, -2.163678, -2.694993, 0, 0, 0, 1, 1,
-0.8693508, -0.1153926, 0.1101958, 1, 1, 1, 1, 1,
-0.8679805, 1.378514, 0.1510288, 1, 1, 1, 1, 1,
-0.8662013, -0.883055, -1.642774, 1, 1, 1, 1, 1,
-0.8647363, -0.6493393, -1.442352, 1, 1, 1, 1, 1,
-0.8626123, 0.9855071, 0.6330305, 1, 1, 1, 1, 1,
-0.860885, 0.8549709, 0.3539731, 1, 1, 1, 1, 1,
-0.8582067, 1.033599, -0.4603932, 1, 1, 1, 1, 1,
-0.8581226, 0.1554431, 1.131593, 1, 1, 1, 1, 1,
-0.8481002, 0.03460454, -4.19239, 1, 1, 1, 1, 1,
-0.8407155, 0.1777569, -0.5118631, 1, 1, 1, 1, 1,
-0.8394832, -0.03045274, -1.33553, 1, 1, 1, 1, 1,
-0.830773, 2.109217, 0.08654101, 1, 1, 1, 1, 1,
-0.8301336, 0.3545166, -1.944697, 1, 1, 1, 1, 1,
-0.8293054, 1.390649, -0.9837436, 1, 1, 1, 1, 1,
-0.8292646, 0.2474651, -0.761113, 1, 1, 1, 1, 1,
-0.8284965, -0.5311637, -1.993728, 0, 0, 1, 1, 1,
-0.8279039, -0.3911323, -0.8488234, 1, 0, 0, 1, 1,
-0.8249255, 0.933154, -0.4745252, 1, 0, 0, 1, 1,
-0.8242104, 0.4884319, -1.963396, 1, 0, 0, 1, 1,
-0.822552, 2.361588, -1.912845, 1, 0, 0, 1, 1,
-0.8216047, 0.3320166, -3.356768, 1, 0, 0, 1, 1,
-0.8195137, 0.9639617, -0.5127633, 0, 0, 0, 1, 1,
-0.8155856, -0.3493146, -2.096443, 0, 0, 0, 1, 1,
-0.8154109, 0.7636963, -1.933122, 0, 0, 0, 1, 1,
-0.8051826, 1.03727, -0.1554653, 0, 0, 0, 1, 1,
-0.804454, -1.121291, -3.294515, 0, 0, 0, 1, 1,
-0.8040433, -0.1740069, -1.942956, 0, 0, 0, 1, 1,
-0.7980435, 1.543423, 0.8556628, 0, 0, 0, 1, 1,
-0.7949616, 0.9293295, -0.6538776, 1, 1, 1, 1, 1,
-0.7934632, 0.256509, -1.652241, 1, 1, 1, 1, 1,
-0.791302, 2.052388, 1.704136, 1, 1, 1, 1, 1,
-0.7912692, 1.07765, -1.105482, 1, 1, 1, 1, 1,
-0.7808956, -0.3503237, -1.771285, 1, 1, 1, 1, 1,
-0.7775643, -1.448717, -3.071996, 1, 1, 1, 1, 1,
-0.7759268, 0.0703989, -0.2583014, 1, 1, 1, 1, 1,
-0.7752502, -1.408077, -3.231519, 1, 1, 1, 1, 1,
-0.7622415, -1.536376, -3.173962, 1, 1, 1, 1, 1,
-0.7561807, 0.5256141, -1.954738, 1, 1, 1, 1, 1,
-0.7544811, 0.4074949, -1.069978, 1, 1, 1, 1, 1,
-0.7467659, -0.112337, -2.454496, 1, 1, 1, 1, 1,
-0.7455996, -0.1269274, -1.833179, 1, 1, 1, 1, 1,
-0.7448249, 0.7534834, -2.031356, 1, 1, 1, 1, 1,
-0.7446771, -0.1768542, -1.093955, 1, 1, 1, 1, 1,
-0.7384977, -1.495185, -1.396156, 0, 0, 1, 1, 1,
-0.7371492, -0.6746805, -1.086188, 1, 0, 0, 1, 1,
-0.7333564, -2.14535, -2.573158, 1, 0, 0, 1, 1,
-0.722546, 2.124035, -0.1207253, 1, 0, 0, 1, 1,
-0.7209659, -0.7379942, -2.920803, 1, 0, 0, 1, 1,
-0.714995, 1.151035, -1.07547, 1, 0, 0, 1, 1,
-0.7149478, -0.4346889, -4.205853, 0, 0, 0, 1, 1,
-0.7128068, 0.839506, -1.354617, 0, 0, 0, 1, 1,
-0.712741, 1.113939, 0.9670026, 0, 0, 0, 1, 1,
-0.7098211, 2.377196, -0.6393911, 0, 0, 0, 1, 1,
-0.7072752, 0.3804825, -2.726344, 0, 0, 0, 1, 1,
-0.7049305, 1.799718, -0.6847001, 0, 0, 0, 1, 1,
-0.7046093, 1.858672, 1.657529, 0, 0, 0, 1, 1,
-0.7015913, 0.4348476, -1.640905, 1, 1, 1, 1, 1,
-0.6985916, 0.5131905, -0.3890768, 1, 1, 1, 1, 1,
-0.6949899, 1.228329, -1.278647, 1, 1, 1, 1, 1,
-0.6912864, 0.9452688, -0.4024781, 1, 1, 1, 1, 1,
-0.6844981, 0.2362504, -0.8502862, 1, 1, 1, 1, 1,
-0.6786228, -1.804839, -2.761305, 1, 1, 1, 1, 1,
-0.6759047, -0.09949292, -2.149633, 1, 1, 1, 1, 1,
-0.6732897, 1.078712, -0.0006442514, 1, 1, 1, 1, 1,
-0.6717764, -0.03872738, 0.6048704, 1, 1, 1, 1, 1,
-0.6704451, -1.080459, -2.058024, 1, 1, 1, 1, 1,
-0.6682303, 1.146986, 0.004652368, 1, 1, 1, 1, 1,
-0.6671147, -0.5185159, -2.366303, 1, 1, 1, 1, 1,
-0.6597131, -0.9071608, -2.911787, 1, 1, 1, 1, 1,
-0.6503127, -0.8884705, -4.09204, 1, 1, 1, 1, 1,
-0.6498929, -0.2411786, -1.125995, 1, 1, 1, 1, 1,
-0.6485693, -0.2206016, -0.7874535, 0, 0, 1, 1, 1,
-0.6363806, 0.9601911, -0.338895, 1, 0, 0, 1, 1,
-0.6361741, 1.528655, 1.556272, 1, 0, 0, 1, 1,
-0.6327364, 1.526022, -1.28948, 1, 0, 0, 1, 1,
-0.6298155, -1.132428, -2.202152, 1, 0, 0, 1, 1,
-0.6244573, -1.438927, -2.334415, 1, 0, 0, 1, 1,
-0.6175084, -0.6879152, -3.720997, 0, 0, 0, 1, 1,
-0.6175054, 1.266595, 1.322173, 0, 0, 0, 1, 1,
-0.6149135, 1.071471, 0.2476088, 0, 0, 0, 1, 1,
-0.6129821, -0.3685359, -3.102619, 0, 0, 0, 1, 1,
-0.6098506, -1.012043, -1.340707, 0, 0, 0, 1, 1,
-0.6073389, -1.269476, -2.754041, 0, 0, 0, 1, 1,
-0.6054636, 0.09171408, -1.891555, 0, 0, 0, 1, 1,
-0.6014826, 1.255665, 1.20828, 1, 1, 1, 1, 1,
-0.5905809, 0.0816111, -1.560684, 1, 1, 1, 1, 1,
-0.5884339, 0.9212211, -1.500117, 1, 1, 1, 1, 1,
-0.5877138, 0.8122308, -1.12087, 1, 1, 1, 1, 1,
-0.5833079, -1.469978, -3.410196, 1, 1, 1, 1, 1,
-0.5828409, 0.1898914, -2.070285, 1, 1, 1, 1, 1,
-0.5819286, -1.30269, -2.229325, 1, 1, 1, 1, 1,
-0.581237, -0.4956615, -2.027036, 1, 1, 1, 1, 1,
-0.580842, -0.5909683, -2.191795, 1, 1, 1, 1, 1,
-0.5781536, -0.1955655, -1.176255, 1, 1, 1, 1, 1,
-0.5770727, 0.462353, -1.249995, 1, 1, 1, 1, 1,
-0.5763433, -0.3329698, -3.665948, 1, 1, 1, 1, 1,
-0.5749167, -0.1614778, -3.05375, 1, 1, 1, 1, 1,
-0.5721356, -0.9000261, -2.460875, 1, 1, 1, 1, 1,
-0.5704561, 0.2617076, -0.199324, 1, 1, 1, 1, 1,
-0.5684484, -0.4300147, -0.18827, 0, 0, 1, 1, 1,
-0.5664492, 1.546549, 0.3401297, 1, 0, 0, 1, 1,
-0.5652599, 0.8677297, -0.08545962, 1, 0, 0, 1, 1,
-0.5628514, -0.3307666, -1.424658, 1, 0, 0, 1, 1,
-0.5622548, -0.3222319, -3.93562, 1, 0, 0, 1, 1,
-0.5596715, 0.2785425, -0.8194302, 1, 0, 0, 1, 1,
-0.5593382, 0.1182365, -2.775757, 0, 0, 0, 1, 1,
-0.5584283, 0.7529272, -0.1535713, 0, 0, 0, 1, 1,
-0.5564359, -0.005383717, -1.888755, 0, 0, 0, 1, 1,
-0.5489619, 1.211614, 0.5267131, 0, 0, 0, 1, 1,
-0.5482658, 3.435925, -0.411538, 0, 0, 0, 1, 1,
-0.5476161, 0.4872224, -1.619341, 0, 0, 0, 1, 1,
-0.5464483, -0.2324511, -2.094596, 0, 0, 0, 1, 1,
-0.5461987, -0.8825417, -2.574228, 1, 1, 1, 1, 1,
-0.5444666, 0.03836676, -1.415305, 1, 1, 1, 1, 1,
-0.5404154, -0.9640144, -1.687249, 1, 1, 1, 1, 1,
-0.5366118, 0.3875529, -1.208427, 1, 1, 1, 1, 1,
-0.5154284, 1.487265, 1.644883, 1, 1, 1, 1, 1,
-0.5135093, -1.127528, -2.119386, 1, 1, 1, 1, 1,
-0.5106619, 1.306236, -0.8283694, 1, 1, 1, 1, 1,
-0.5074955, -1.076162, -4.646628, 1, 1, 1, 1, 1,
-0.5073143, 1.019574, -0.003476381, 1, 1, 1, 1, 1,
-0.5055171, -0.1397576, -1.644781, 1, 1, 1, 1, 1,
-0.504702, -0.3714535, -2.102685, 1, 1, 1, 1, 1,
-0.5013199, -0.5919748, -1.871127, 1, 1, 1, 1, 1,
-0.4937029, 0.5619862, -0.8654311, 1, 1, 1, 1, 1,
-0.4927701, 0.05982009, 0.1565515, 1, 1, 1, 1, 1,
-0.4916236, -1.582574, -3.622686, 1, 1, 1, 1, 1,
-0.489289, -0.2143101, -1.663235, 0, 0, 1, 1, 1,
-0.4830696, 1.868071, 0.9073172, 1, 0, 0, 1, 1,
-0.4784836, 1.086035, -1.698359, 1, 0, 0, 1, 1,
-0.476109, 0.9186797, -0.7341542, 1, 0, 0, 1, 1,
-0.4758725, -0.3569386, -2.184005, 1, 0, 0, 1, 1,
-0.4755428, 0.5260488, -1.500791, 1, 0, 0, 1, 1,
-0.460027, -1.767539, -3.181735, 0, 0, 0, 1, 1,
-0.4567356, -1.384474, -4.717731, 0, 0, 0, 1, 1,
-0.455384, -0.170029, -1.473923, 0, 0, 0, 1, 1,
-0.4547194, -2.371043, -2.287159, 0, 0, 0, 1, 1,
-0.4542735, -0.2853974, -3.238258, 0, 0, 0, 1, 1,
-0.4527996, 0.3092681, -0.5404599, 0, 0, 0, 1, 1,
-0.4514499, 0.216319, 0.3299727, 0, 0, 0, 1, 1,
-0.4504189, 0.1678696, -1.982557, 1, 1, 1, 1, 1,
-0.4501064, -0.01055454, -1.048154, 1, 1, 1, 1, 1,
-0.4448796, -0.2387187, -1.654285, 1, 1, 1, 1, 1,
-0.4446221, 1.833574, -1.679066, 1, 1, 1, 1, 1,
-0.4401301, -0.523476, -2.947573, 1, 1, 1, 1, 1,
-0.4392309, 1.446875, -0.1800586, 1, 1, 1, 1, 1,
-0.4382991, 1.093488, -1.411966, 1, 1, 1, 1, 1,
-0.4321029, -1.282571, -3.482886, 1, 1, 1, 1, 1,
-0.4260305, -0.2609316, -1.749255, 1, 1, 1, 1, 1,
-0.4258882, -1.034684, -2.203051, 1, 1, 1, 1, 1,
-0.4258803, -0.6887425, -0.5814169, 1, 1, 1, 1, 1,
-0.4238284, 0.5689737, -1.532659, 1, 1, 1, 1, 1,
-0.4232963, 0.467005, 1.597069, 1, 1, 1, 1, 1,
-0.4231954, 0.7776246, 1.498814, 1, 1, 1, 1, 1,
-0.4177993, 1.040365, -1.019854, 1, 1, 1, 1, 1,
-0.4137876, 0.553256, -0.2929203, 0, 0, 1, 1, 1,
-0.412487, 0.4942951, 1.4924, 1, 0, 0, 1, 1,
-0.4112285, 0.9791246, -0.6314095, 1, 0, 0, 1, 1,
-0.407953, -0.6725286, -1.017183, 1, 0, 0, 1, 1,
-0.4031058, -0.4362845, -2.360043, 1, 0, 0, 1, 1,
-0.3999667, -1.670197, -3.604877, 1, 0, 0, 1, 1,
-0.3996436, -0.02260303, -2.381075, 0, 0, 0, 1, 1,
-0.3961646, -1.29829, -4.648321, 0, 0, 0, 1, 1,
-0.3950449, 0.1546816, -1.773963, 0, 0, 0, 1, 1,
-0.3904366, -0.3371612, -1.950743, 0, 0, 0, 1, 1,
-0.3900402, -0.009303102, -2.936561, 0, 0, 0, 1, 1,
-0.3895213, -0.221202, -3.176177, 0, 0, 0, 1, 1,
-0.3891166, -0.1152698, -2.116894, 0, 0, 0, 1, 1,
-0.386551, 0.4223523, 0.1744646, 1, 1, 1, 1, 1,
-0.3822493, 2.032648, -1.168392, 1, 1, 1, 1, 1,
-0.3810875, -0.2821802, -2.342117, 1, 1, 1, 1, 1,
-0.3808644, 1.155656, -0.003990822, 1, 1, 1, 1, 1,
-0.3786029, -0.5087267, -4.03848, 1, 1, 1, 1, 1,
-0.3782887, -0.9886601, -2.034134, 1, 1, 1, 1, 1,
-0.3768651, 1.10112, 0.3118663, 1, 1, 1, 1, 1,
-0.3734054, 0.7976645, -0.8353269, 1, 1, 1, 1, 1,
-0.3641632, 0.3029366, -2.652562, 1, 1, 1, 1, 1,
-0.3616091, -0.3853779, -3.857908, 1, 1, 1, 1, 1,
-0.3612333, -0.1405756, -5.237906, 1, 1, 1, 1, 1,
-0.3587991, 1.610257, 2.069344, 1, 1, 1, 1, 1,
-0.3542805, -0.8767939, -2.744243, 1, 1, 1, 1, 1,
-0.3496603, -0.4340982, -2.1788, 1, 1, 1, 1, 1,
-0.3436512, 0.2511309, -1.686942, 1, 1, 1, 1, 1,
-0.3419785, -0.03360966, -0.8561414, 0, 0, 1, 1, 1,
-0.3414144, 0.3774251, -0.516557, 1, 0, 0, 1, 1,
-0.3374335, 1.445925, 1.072567, 1, 0, 0, 1, 1,
-0.3322865, 1.087299, -1.256689, 1, 0, 0, 1, 1,
-0.3303294, -0.8389733, -2.671966, 1, 0, 0, 1, 1,
-0.3286573, -0.456236, -2.255024, 1, 0, 0, 1, 1,
-0.3260719, -0.06354517, -2.235504, 0, 0, 0, 1, 1,
-0.3255428, -1.62382, -2.456248, 0, 0, 0, 1, 1,
-0.3200995, -1.005603, -1.9018, 0, 0, 0, 1, 1,
-0.3190474, 0.7535096, 0.4427441, 0, 0, 0, 1, 1,
-0.31821, 0.1755998, -0.2736788, 0, 0, 0, 1, 1,
-0.3154197, -0.8425397, -1.716579, 0, 0, 0, 1, 1,
-0.3102584, -1.385442, -2.351564, 0, 0, 0, 1, 1,
-0.3088065, -0.5164158, -2.828621, 1, 1, 1, 1, 1,
-0.3035308, -1.18127, -3.445545, 1, 1, 1, 1, 1,
-0.3027267, 0.5356007, 0.2314444, 1, 1, 1, 1, 1,
-0.3017935, -0.04259188, -1.309616, 1, 1, 1, 1, 1,
-0.301093, -1.118075, -3.157463, 1, 1, 1, 1, 1,
-0.3000003, 1.792314, -0.9227221, 1, 1, 1, 1, 1,
-0.2955167, -0.7484962, -2.400407, 1, 1, 1, 1, 1,
-0.285769, -0.03002258, -1.148841, 1, 1, 1, 1, 1,
-0.2847509, -0.8702042, -4.735685, 1, 1, 1, 1, 1,
-0.2829987, -0.6265648, -2.315391, 1, 1, 1, 1, 1,
-0.2829018, 0.9363281, -1.233423, 1, 1, 1, 1, 1,
-0.2815103, -0.3685366, 0.3334631, 1, 1, 1, 1, 1,
-0.27898, -1.815753, -1.624264, 1, 1, 1, 1, 1,
-0.2780519, -1.573972, -4.752395, 1, 1, 1, 1, 1,
-0.2772256, 0.2383145, -1.125254, 1, 1, 1, 1, 1,
-0.2704891, -1.070606, -2.090658, 0, 0, 1, 1, 1,
-0.2696612, -0.03068244, -0.3037698, 1, 0, 0, 1, 1,
-0.2642099, 1.442993, 0.4844928, 1, 0, 0, 1, 1,
-0.2624005, -0.781183, -2.794563, 1, 0, 0, 1, 1,
-0.2534446, 0.734945, -1.122001, 1, 0, 0, 1, 1,
-0.251598, -1.438331, -5.017901, 1, 0, 0, 1, 1,
-0.2492929, 0.6398054, 0.0325545, 0, 0, 0, 1, 1,
-0.2485997, -0.9677956, -2.386535, 0, 0, 0, 1, 1,
-0.2429136, -0.7722301, -0.5960373, 0, 0, 0, 1, 1,
-0.2427787, -0.01233806, -2.258698, 0, 0, 0, 1, 1,
-0.2373457, -1.367509, -2.321849, 0, 0, 0, 1, 1,
-0.2362857, -0.06047405, -1.418845, 0, 0, 0, 1, 1,
-0.2322574, 0.8738264, 1.226115, 0, 0, 0, 1, 1,
-0.2227479, -0.9240444, -1.945413, 1, 1, 1, 1, 1,
-0.2211633, 0.02715265, -2.831678, 1, 1, 1, 1, 1,
-0.2146651, 1.430704, -1.034939, 1, 1, 1, 1, 1,
-0.2066363, -1.267977, -3.432337, 1, 1, 1, 1, 1,
-0.2057185, -0.842733, -1.985208, 1, 1, 1, 1, 1,
-0.2011506, -0.008170594, -1.233389, 1, 1, 1, 1, 1,
-0.2011131, -0.1820695, -2.886319, 1, 1, 1, 1, 1,
-0.1996281, -0.05225814, -1.198076, 1, 1, 1, 1, 1,
-0.1977556, -1.056963, -3.602615, 1, 1, 1, 1, 1,
-0.1924912, -0.2116945, -2.903662, 1, 1, 1, 1, 1,
-0.1917885, -1.132489, -2.234427, 1, 1, 1, 1, 1,
-0.188993, -0.3999861, -2.163586, 1, 1, 1, 1, 1,
-0.1717035, 0.5115261, 0.0808894, 1, 1, 1, 1, 1,
-0.1683566, -0.504467, -2.525619, 1, 1, 1, 1, 1,
-0.1560117, -0.6770169, -2.404267, 1, 1, 1, 1, 1,
-0.1554751, 0.8022526, -0.5961549, 0, 0, 1, 1, 1,
-0.1553671, 1.159117, -0.7661858, 1, 0, 0, 1, 1,
-0.1543788, -0.1076131, -3.787819, 1, 0, 0, 1, 1,
-0.1542564, -1.429626, -2.946366, 1, 0, 0, 1, 1,
-0.1527919, 1.74357, 1.623236, 1, 0, 0, 1, 1,
-0.1522023, 0.564563, 0.777599, 1, 0, 0, 1, 1,
-0.1504282, -0.1586784, -2.140438, 0, 0, 0, 1, 1,
-0.1465914, -1.636708, -2.769739, 0, 0, 0, 1, 1,
-0.1448185, 0.9089733, -0.9842521, 0, 0, 0, 1, 1,
-0.1444355, 0.5830609, 1.190634, 0, 0, 0, 1, 1,
-0.1379785, 0.4660478, 0.07908285, 0, 0, 0, 1, 1,
-0.1367654, 3.360399, 0.008664132, 0, 0, 0, 1, 1,
-0.1353462, 1.263384, 1.008817, 0, 0, 0, 1, 1,
-0.1324257, -0.7974016, -4.52162, 1, 1, 1, 1, 1,
-0.1293743, -1.449229, -2.592061, 1, 1, 1, 1, 1,
-0.1270182, -0.1200985, -2.996526, 1, 1, 1, 1, 1,
-0.1258787, -0.4387836, -2.670083, 1, 1, 1, 1, 1,
-0.1247268, -1.233525, -2.85322, 1, 1, 1, 1, 1,
-0.1193315, -0.5878544, -4.265701, 1, 1, 1, 1, 1,
-0.1172111, -0.1767563, -1.726199, 1, 1, 1, 1, 1,
-0.1154868, -0.8591835, -4.256707, 1, 1, 1, 1, 1,
-0.1135624, -0.7662817, -3.106711, 1, 1, 1, 1, 1,
-0.1109483, -1.265202, -2.665813, 1, 1, 1, 1, 1,
-0.1099909, -0.4004283, -3.232909, 1, 1, 1, 1, 1,
-0.1083625, 0.3319456, 0.762836, 1, 1, 1, 1, 1,
-0.1073685, -0.4510628, -1.259445, 1, 1, 1, 1, 1,
-0.1020786, -0.6630016, -2.958361, 1, 1, 1, 1, 1,
-0.1020379, -1.100938, -3.644189, 1, 1, 1, 1, 1,
-0.1007713, -0.5560505, -2.929941, 0, 0, 1, 1, 1,
-0.09947594, -0.2933936, -4.473595, 1, 0, 0, 1, 1,
-0.0989701, -1.670799, -3.249686, 1, 0, 0, 1, 1,
-0.09574483, -0.1340132, -2.275612, 1, 0, 0, 1, 1,
-0.09371816, -0.1622085, -2.664446, 1, 0, 0, 1, 1,
-0.09345646, 0.4780874, 0.8248016, 1, 0, 0, 1, 1,
-0.09337456, -0.5910929, -4.226229, 0, 0, 0, 1, 1,
-0.09097155, -0.3668437, -4.821964, 0, 0, 0, 1, 1,
-0.09032638, 0.4803981, -1.876939, 0, 0, 0, 1, 1,
-0.08984531, -0.1578962, -2.89928, 0, 0, 0, 1, 1,
-0.08844907, 0.08937002, -0.4581645, 0, 0, 0, 1, 1,
-0.0862827, -0.3224792, -3.001348, 0, 0, 0, 1, 1,
-0.08066938, -0.5382245, -3.030313, 0, 0, 0, 1, 1,
-0.07838389, -0.4225354, -3.109082, 1, 1, 1, 1, 1,
-0.07812285, -0.1343737, -4.556408, 1, 1, 1, 1, 1,
-0.07808724, -0.6050265, -1.979844, 1, 1, 1, 1, 1,
-0.07766286, -1.189198, -0.8136008, 1, 1, 1, 1, 1,
-0.07704645, 1.529082, -2.575398, 1, 1, 1, 1, 1,
-0.07116097, 1.814386, 0.8279228, 1, 1, 1, 1, 1,
-0.06900983, -0.5486738, -3.883569, 1, 1, 1, 1, 1,
-0.06615874, -0.9144099, -3.641103, 1, 1, 1, 1, 1,
-0.06414603, -0.2955148, -3.062138, 1, 1, 1, 1, 1,
-0.05932277, -0.4195978, -2.571281, 1, 1, 1, 1, 1,
-0.05394578, -1.087908, -1.798895, 1, 1, 1, 1, 1,
-0.05036011, 1.649429, -2.234637, 1, 1, 1, 1, 1,
-0.0492854, 1.478251, -0.7399921, 1, 1, 1, 1, 1,
-0.04715203, 0.5297316, -1.096154, 1, 1, 1, 1, 1,
-0.04637076, -1.028275, -2.116423, 1, 1, 1, 1, 1,
-0.04406297, 0.2578622, 0.7109284, 0, 0, 1, 1, 1,
-0.04337384, 1.114445, 1.883127, 1, 0, 0, 1, 1,
-0.04232429, 0.7873475, 0.112243, 1, 0, 0, 1, 1,
-0.04016843, 0.404384, -0.4612256, 1, 0, 0, 1, 1,
-0.03308316, 2.188146, -0.4070739, 1, 0, 0, 1, 1,
-0.02758414, -0.4679101, -1.892041, 1, 0, 0, 1, 1,
-0.02693969, -0.4481084, -3.014767, 0, 0, 0, 1, 1,
-0.02498247, 0.3711874, -1.029503, 0, 0, 0, 1, 1,
-0.02131797, 0.3049388, -0.132377, 0, 0, 0, 1, 1,
-0.01839343, 0.9682764, 0.7985078, 0, 0, 0, 1, 1,
-0.01737734, 0.5668108, -0.2539152, 0, 0, 0, 1, 1,
-0.003444952, -0.5191339, -1.210731, 0, 0, 0, 1, 1,
-0.002690721, 0.7427308, -0.1603659, 0, 0, 0, 1, 1,
-0.002643938, 2.047817, -1.156365, 1, 1, 1, 1, 1,
0.005885425, -1.195386, 3.473878, 1, 1, 1, 1, 1,
0.009702572, -1.416259, 0.5200183, 1, 1, 1, 1, 1,
0.01267135, 0.8976242, 0.4199157, 1, 1, 1, 1, 1,
0.01885995, -0.2548931, 4.77043, 1, 1, 1, 1, 1,
0.0196787, -0.01571498, 1.958029, 1, 1, 1, 1, 1,
0.02076017, 0.6991315, 1.703318, 1, 1, 1, 1, 1,
0.02192146, -0.5113154, 3.967742, 1, 1, 1, 1, 1,
0.02374939, -1.698773, 2.262019, 1, 1, 1, 1, 1,
0.02448436, 1.097778, 0.4115731, 1, 1, 1, 1, 1,
0.02477017, -0.7987086, 2.514538, 1, 1, 1, 1, 1,
0.02492187, 0.1356278, -0.75546, 1, 1, 1, 1, 1,
0.03216497, 0.3882286, 0.1342349, 1, 1, 1, 1, 1,
0.03534595, 1.785879, -1.542181, 1, 1, 1, 1, 1,
0.03924233, 0.003482788, 3.058966, 1, 1, 1, 1, 1,
0.04180522, 1.238139, -0.0938537, 0, 0, 1, 1, 1,
0.04729844, -0.612734, 3.330622, 1, 0, 0, 1, 1,
0.05063665, -0.4974101, 2.418531, 1, 0, 0, 1, 1,
0.05367657, 0.02553775, 2.686408, 1, 0, 0, 1, 1,
0.05714956, 1.26562, -0.4902973, 1, 0, 0, 1, 1,
0.06027868, -1.905054, 1.042948, 1, 0, 0, 1, 1,
0.06247701, 1.907105, 1.79694, 0, 0, 0, 1, 1,
0.06312448, -0.8411645, 3.524242, 0, 0, 0, 1, 1,
0.06405227, 0.4554523, 1.385036, 0, 0, 0, 1, 1,
0.06683169, -1.001667, 3.275315, 0, 0, 0, 1, 1,
0.06684637, 1.231707, -0.6153137, 0, 0, 0, 1, 1,
0.07184372, 0.451892, -0.6863611, 0, 0, 0, 1, 1,
0.07317016, -0.4808753, 4.01583, 0, 0, 0, 1, 1,
0.07387744, -1.286256, 3.520243, 1, 1, 1, 1, 1,
0.0776813, -0.0002210966, 2.023737, 1, 1, 1, 1, 1,
0.07854032, -0.1578091, 1.533123, 1, 1, 1, 1, 1,
0.07857035, 0.3554845, 0.7640129, 1, 1, 1, 1, 1,
0.08131374, -0.6246448, 2.337659, 1, 1, 1, 1, 1,
0.08391805, 0.0687888, 0.01289196, 1, 1, 1, 1, 1,
0.0852183, 1.111195, -0.6379167, 1, 1, 1, 1, 1,
0.08823813, -1.079709, 2.448529, 1, 1, 1, 1, 1,
0.08889158, -0.2332266, 3.008052, 1, 1, 1, 1, 1,
0.09074157, 1.063837, -0.5745384, 1, 1, 1, 1, 1,
0.09295269, 0.2509499, 0.08501074, 1, 1, 1, 1, 1,
0.09444786, -1.332439, 3.387303, 1, 1, 1, 1, 1,
0.09483797, -0.786107, 3.122705, 1, 1, 1, 1, 1,
0.09515397, 1.40355, 0.5507678, 1, 1, 1, 1, 1,
0.09880473, 1.626835, 0.1195325, 1, 1, 1, 1, 1,
0.10092, -1.585575, 1.563219, 0, 0, 1, 1, 1,
0.1014549, -0.1174701, 4.166054, 1, 0, 0, 1, 1,
0.102348, 2.460209, -0.6146095, 1, 0, 0, 1, 1,
0.1043473, 0.8652027, -1.385546, 1, 0, 0, 1, 1,
0.1067123, -0.3575801, 2.285862, 1, 0, 0, 1, 1,
0.1076211, -0.3842825, 2.448164, 1, 0, 0, 1, 1,
0.1098481, 1.263013, 0.3130068, 0, 0, 0, 1, 1,
0.1103718, 0.1997213, 1.247291, 0, 0, 0, 1, 1,
0.1156918, -0.3571733, 3.847217, 0, 0, 0, 1, 1,
0.1164126, -0.2592467, 2.589736, 0, 0, 0, 1, 1,
0.1182782, 2.301751, 2.008261, 0, 0, 0, 1, 1,
0.1230294, 0.5203999, -0.3374089, 0, 0, 0, 1, 1,
0.1271549, -1.382484, 3.766369, 0, 0, 0, 1, 1,
0.1325051, 0.1609476, 1.290186, 1, 1, 1, 1, 1,
0.1379752, -1.39206, 2.983869, 1, 1, 1, 1, 1,
0.1421146, 0.3099428, -0.1929983, 1, 1, 1, 1, 1,
0.1447812, 0.8691885, 1.109565, 1, 1, 1, 1, 1,
0.1453753, -1.588047, 1.902314, 1, 1, 1, 1, 1,
0.1508663, 1.002885, 0.1563088, 1, 1, 1, 1, 1,
0.1559426, 0.5271885, 0.9090842, 1, 1, 1, 1, 1,
0.1603341, 1.338949, -0.1319682, 1, 1, 1, 1, 1,
0.1614726, -0.4414113, 3.05431, 1, 1, 1, 1, 1,
0.1658906, -2.196788, 3.523174, 1, 1, 1, 1, 1,
0.1678079, 0.4868776, 0.8032863, 1, 1, 1, 1, 1,
0.1687633, 2.417715, 1.13509, 1, 1, 1, 1, 1,
0.1703265, -1.378451, 1.142425, 1, 1, 1, 1, 1,
0.1721899, -1.51875, 1.819827, 1, 1, 1, 1, 1,
0.1733911, -1.987981, 2.282614, 1, 1, 1, 1, 1,
0.176734, 1.693804, 1.979781, 0, 0, 1, 1, 1,
0.1771088, 0.3276419, -0.6896622, 1, 0, 0, 1, 1,
0.1812416, 0.167941, -0.1531511, 1, 0, 0, 1, 1,
0.1842937, 1.080672, -2.315221, 1, 0, 0, 1, 1,
0.1843061, -0.8557064, 4.975286, 1, 0, 0, 1, 1,
0.1846309, 0.3166769, 1.868172, 1, 0, 0, 1, 1,
0.1847202, 1.61944, 1.077571, 0, 0, 0, 1, 1,
0.1868514, 1.819406, -1.613819, 0, 0, 0, 1, 1,
0.1875566, -1.049629, 2.988038, 0, 0, 0, 1, 1,
0.1896244, -0.5876962, 2.472465, 0, 0, 0, 1, 1,
0.1910535, -1.21928, 1.12498, 0, 0, 0, 1, 1,
0.197666, 0.3687769, 0.1970664, 0, 0, 0, 1, 1,
0.1983346, 0.228188, 0.3862, 0, 0, 0, 1, 1,
0.1986512, -0.7783124, 2.163445, 1, 1, 1, 1, 1,
0.2013523, 1.47303, 0.8324544, 1, 1, 1, 1, 1,
0.2014612, -0.5714174, 4.352512, 1, 1, 1, 1, 1,
0.2018119, -1.110599, 2.378538, 1, 1, 1, 1, 1,
0.2077592, 0.08657008, 1.488056, 1, 1, 1, 1, 1,
0.2147704, -0.6886271, 1.301671, 1, 1, 1, 1, 1,
0.2183703, 0.6103781, 1.006225, 1, 1, 1, 1, 1,
0.2247105, -1.305068, 2.812756, 1, 1, 1, 1, 1,
0.2251761, -0.8461546, 3.382462, 1, 1, 1, 1, 1,
0.2269861, 0.2589709, 1.51748, 1, 1, 1, 1, 1,
0.2334844, 1.234324, -0.5306786, 1, 1, 1, 1, 1,
0.2337743, -0.060794, 2.629685, 1, 1, 1, 1, 1,
0.2363706, -0.09169224, 2.167097, 1, 1, 1, 1, 1,
0.2373869, 1.089468, -0.06931423, 1, 1, 1, 1, 1,
0.2403826, 1.901483, -1.146323, 1, 1, 1, 1, 1,
0.2407998, -1.009059, 2.918027, 0, 0, 1, 1, 1,
0.2440479, -0.7755339, 4.431087, 1, 0, 0, 1, 1,
0.249901, 0.7580494, 0.8522791, 1, 0, 0, 1, 1,
0.2517932, -1.503836, 4.779466, 1, 0, 0, 1, 1,
0.2552642, -0.9547356, 2.808574, 1, 0, 0, 1, 1,
0.2574305, -0.9329886, 2.414497, 1, 0, 0, 1, 1,
0.2584858, 0.4371176, 1.273023, 0, 0, 0, 1, 1,
0.262695, -1.95699, 3.857527, 0, 0, 0, 1, 1,
0.2634922, 0.6373046, 1.780569, 0, 0, 0, 1, 1,
0.264696, -0.4202148, 2.847912, 0, 0, 0, 1, 1,
0.2665087, 0.6697595, -0.2933834, 0, 0, 0, 1, 1,
0.2678868, -1.463401, 1.610425, 0, 0, 0, 1, 1,
0.2776339, -0.5444941, 2.434837, 0, 0, 0, 1, 1,
0.2780384, -0.6546008, 4.350754, 1, 1, 1, 1, 1,
0.2804105, -0.8924536, 3.18493, 1, 1, 1, 1, 1,
0.28089, 0.9543003, 0.7624106, 1, 1, 1, 1, 1,
0.2914341, 0.6951661, 1.870531, 1, 1, 1, 1, 1,
0.2933309, 0.5464066, 0.3888099, 1, 1, 1, 1, 1,
0.2941182, 2.193016, -0.1599976, 1, 1, 1, 1, 1,
0.2942768, -1.479583, 3.932549, 1, 1, 1, 1, 1,
0.2967085, -0.1277077, 3.300422, 1, 1, 1, 1, 1,
0.296763, 0.2319357, -0.5394484, 1, 1, 1, 1, 1,
0.2999758, -0.6548744, 3.242999, 1, 1, 1, 1, 1,
0.3063268, 0.03698638, 0.731065, 1, 1, 1, 1, 1,
0.3114122, 0.1570611, -0.714034, 1, 1, 1, 1, 1,
0.3116373, 1.893104, 1.572303, 1, 1, 1, 1, 1,
0.3132865, 0.1067339, 1.904898, 1, 1, 1, 1, 1,
0.3168066, 0.442503, 2.464076, 1, 1, 1, 1, 1,
0.3176732, 1.200751, 1.002555, 0, 0, 1, 1, 1,
0.3226975, -0.4256338, 3.062633, 1, 0, 0, 1, 1,
0.324835, -0.1426526, 2.437234, 1, 0, 0, 1, 1,
0.3284694, 1.541405, 1.2908, 1, 0, 0, 1, 1,
0.330873, -1.781544, 2.83666, 1, 0, 0, 1, 1,
0.3327567, 0.2328744, 1.435219, 1, 0, 0, 1, 1,
0.3346399, -0.7839155, 3.535663, 0, 0, 0, 1, 1,
0.3359349, -1.45238, 3.868774, 0, 0, 0, 1, 1,
0.3400418, 0.4105417, 0.09631899, 0, 0, 0, 1, 1,
0.3419945, -1.171413, 3.262211, 0, 0, 0, 1, 1,
0.3421658, 0.4795715, 1.241894, 0, 0, 0, 1, 1,
0.3435284, -0.0741602, 3.467722, 0, 0, 0, 1, 1,
0.3448605, 0.1198315, 2.895758, 0, 0, 0, 1, 1,
0.3467778, 0.1876821, 0.6794236, 1, 1, 1, 1, 1,
0.3470535, -1.118134, 2.378977, 1, 1, 1, 1, 1,
0.3521508, -1.237009, 2.807711, 1, 1, 1, 1, 1,
0.3584671, 0.177977, 1.12728, 1, 1, 1, 1, 1,
0.3588801, 0.9982485, -0.9099905, 1, 1, 1, 1, 1,
0.3638067, -0.4874231, 2.326125, 1, 1, 1, 1, 1,
0.3707362, 0.2222002, 2.111511, 1, 1, 1, 1, 1,
0.3711661, -1.302275, 3.142486, 1, 1, 1, 1, 1,
0.3848498, -0.1008906, -0.2313873, 1, 1, 1, 1, 1,
0.3879065, -1.154255, 2.492422, 1, 1, 1, 1, 1,
0.3950356, 0.1579524, 1.044653, 1, 1, 1, 1, 1,
0.3969962, 0.424735, 0.6571472, 1, 1, 1, 1, 1,
0.3987397, -0.1401341, 3.134413, 1, 1, 1, 1, 1,
0.4017689, 0.4585098, 0.7787826, 1, 1, 1, 1, 1,
0.402507, 0.02551375, 2.336006, 1, 1, 1, 1, 1,
0.4058917, -1.61937, 3.551854, 0, 0, 1, 1, 1,
0.4061727, -0.5518538, 3.001971, 1, 0, 0, 1, 1,
0.4132642, -0.3005759, 3.647553, 1, 0, 0, 1, 1,
0.4158837, 0.5497354, 1.836092, 1, 0, 0, 1, 1,
0.4207512, -1.124378, 1.9508, 1, 0, 0, 1, 1,
0.4210861, -0.1266053, 0.3301456, 1, 0, 0, 1, 1,
0.4215069, 1.394558, 0.7275943, 0, 0, 0, 1, 1,
0.4232336, 0.5158166, 0.9307564, 0, 0, 0, 1, 1,
0.4269696, -1.047252, 5.05659, 0, 0, 0, 1, 1,
0.4275778, -0.9468036, 2.929123, 0, 0, 0, 1, 1,
0.4290952, 0.327374, 2.758351, 0, 0, 0, 1, 1,
0.4303927, -0.03696372, 3.453691, 0, 0, 0, 1, 1,
0.435169, -0.7334381, 1.819667, 0, 0, 0, 1, 1,
0.4380938, 1.080426, -0.3993579, 1, 1, 1, 1, 1,
0.4387836, 1.219543, 1.473883, 1, 1, 1, 1, 1,
0.4388186, 0.4276588, 2.657344, 1, 1, 1, 1, 1,
0.4412063, -1.305019, 2.734286, 1, 1, 1, 1, 1,
0.4433594, 0.6853659, 0.5767545, 1, 1, 1, 1, 1,
0.4471112, -0.1671227, 2.796456, 1, 1, 1, 1, 1,
0.4491673, -1.293102, 2.317716, 1, 1, 1, 1, 1,
0.4535278, -0.2572252, 2.666994, 1, 1, 1, 1, 1,
0.4539801, 1.272959, 0.6602338, 1, 1, 1, 1, 1,
0.454756, -0.2038177, 1.966033, 1, 1, 1, 1, 1,
0.4622054, -1.799741, 3.602057, 1, 1, 1, 1, 1,
0.4658231, 0.4927063, 1.534207, 1, 1, 1, 1, 1,
0.4686673, -0.1308745, 1.38373, 1, 1, 1, 1, 1,
0.4726602, -0.2591615, 1.360961, 1, 1, 1, 1, 1,
0.4749434, 0.6562461, 2.345013, 1, 1, 1, 1, 1,
0.478231, 0.7856101, 1.074552, 0, 0, 1, 1, 1,
0.4831526, 0.1909366, 1.558962, 1, 0, 0, 1, 1,
0.4844612, 1.897161, 0.007888054, 1, 0, 0, 1, 1,
0.4854418, 0.4545771, 0.8905467, 1, 0, 0, 1, 1,
0.4861384, 0.8007549, 0.5722551, 1, 0, 0, 1, 1,
0.488158, -0.9431096, 3.038857, 1, 0, 0, 1, 1,
0.4883491, 0.5242319, 0.9510053, 0, 0, 0, 1, 1,
0.4896286, 1.072509, 0.9344593, 0, 0, 0, 1, 1,
0.4919148, 1.735106, -0.7843246, 0, 0, 0, 1, 1,
0.4925991, 0.94338, 1.253563, 0, 0, 0, 1, 1,
0.4934416, 0.7831349, 0.02858231, 0, 0, 0, 1, 1,
0.4976039, 0.4011041, -0.4461575, 0, 0, 0, 1, 1,
0.5033021, 0.2633974, 2.194467, 0, 0, 0, 1, 1,
0.5043786, -0.2621266, 2.047519, 1, 1, 1, 1, 1,
0.504997, 0.01187777, -1.261149, 1, 1, 1, 1, 1,
0.5070802, 0.148367, 3.499252, 1, 1, 1, 1, 1,
0.5076099, -1.71133, 1.986296, 1, 1, 1, 1, 1,
0.5120152, 0.1398114, 1.934438, 1, 1, 1, 1, 1,
0.5266661, -1.12554, 3.594706, 1, 1, 1, 1, 1,
0.5284885, 0.2019941, 2.541833, 1, 1, 1, 1, 1,
0.5315034, 0.7660214, 1.213443, 1, 1, 1, 1, 1,
0.5321927, 0.09546949, -0.2042124, 1, 1, 1, 1, 1,
0.5329306, -0.02785881, 1.353131, 1, 1, 1, 1, 1,
0.5403873, 1.403437, 0.2707084, 1, 1, 1, 1, 1,
0.5414504, 0.2777736, 1.84714, 1, 1, 1, 1, 1,
0.5456993, -3.256548, 3.130453, 1, 1, 1, 1, 1,
0.5480176, 0.438154, 1.535729, 1, 1, 1, 1, 1,
0.5497021, 0.8383411, 1.101938, 1, 1, 1, 1, 1,
0.5516594, 0.6029707, 3.224708, 0, 0, 1, 1, 1,
0.5537525, 1.14506, -0.1339476, 1, 0, 0, 1, 1,
0.5623069, 0.1047234, 1.645132, 1, 0, 0, 1, 1,
0.5640445, -1.157921, 3.138249, 1, 0, 0, 1, 1,
0.5698256, -1.523586, 2.551517, 1, 0, 0, 1, 1,
0.5714552, 0.01910466, 1.229903, 1, 0, 0, 1, 1,
0.5719305, 0.1297626, 1.562386, 0, 0, 0, 1, 1,
0.5742061, -1.626543, 3.994463, 0, 0, 0, 1, 1,
0.5792848, -0.337161, 1.908692, 0, 0, 0, 1, 1,
0.5806168, -0.5032379, 2.952704, 0, 0, 0, 1, 1,
0.5831826, 0.09385662, 1.904572, 0, 0, 0, 1, 1,
0.584935, 1.564679, -0.1339441, 0, 0, 0, 1, 1,
0.5861559, 0.03495184, 4.394413, 0, 0, 0, 1, 1,
0.5890315, -0.7339866, 2.865218, 1, 1, 1, 1, 1,
0.5897664, -0.9678757, 2.79575, 1, 1, 1, 1, 1,
0.591137, -0.9066507, 3.107403, 1, 1, 1, 1, 1,
0.5929197, 0.3747281, 1.121987, 1, 1, 1, 1, 1,
0.5934498, 0.3764226, 1.52682, 1, 1, 1, 1, 1,
0.597688, 0.3783084, 2.172022, 1, 1, 1, 1, 1,
0.6029494, -0.09500001, 2.156572, 1, 1, 1, 1, 1,
0.6074238, -0.1268933, 0.8931261, 1, 1, 1, 1, 1,
0.6105575, 0.6623662, 0.7861063, 1, 1, 1, 1, 1,
0.6131814, 0.3232888, 1.302904, 1, 1, 1, 1, 1,
0.6166825, -1.099437, 2.919724, 1, 1, 1, 1, 1,
0.620908, -1.131105, 3.713773, 1, 1, 1, 1, 1,
0.6218213, -0.5217057, 2.326147, 1, 1, 1, 1, 1,
0.6234077, -0.01100661, 3.05086, 1, 1, 1, 1, 1,
0.624228, -1.892426, 2.743916, 1, 1, 1, 1, 1,
0.6249564, 0.7325958, 1.142048, 0, 0, 1, 1, 1,
0.6263485, 0.4220747, 0.3466862, 1, 0, 0, 1, 1,
0.6304801, 0.4380358, 0.2823486, 1, 0, 0, 1, 1,
0.630514, 0.3520678, 0.3641038, 1, 0, 0, 1, 1,
0.6334954, -0.4928154, 1.4426, 1, 0, 0, 1, 1,
0.6379812, 0.3501452, 1.893227, 1, 0, 0, 1, 1,
0.638589, -1.418453, 2.143991, 0, 0, 0, 1, 1,
0.6399872, -0.7248845, 1.346606, 0, 0, 0, 1, 1,
0.6421461, 0.0009430326, 0.9019234, 0, 0, 0, 1, 1,
0.6423334, 1.094589, 1.848314, 0, 0, 0, 1, 1,
0.6428354, -0.5439804, 0.8619857, 0, 0, 0, 1, 1,
0.6551349, 0.5296952, 1.259731, 0, 0, 0, 1, 1,
0.6555848, 0.07561008, 2.143026, 0, 0, 0, 1, 1,
0.6566665, -0.1785543, 1.617004, 1, 1, 1, 1, 1,
0.6583157, 0.08289075, 2.655634, 1, 1, 1, 1, 1,
0.6583982, -0.976469, 0.6159175, 1, 1, 1, 1, 1,
0.6588446, 0.5527738, 1.986182, 1, 1, 1, 1, 1,
0.6602439, -0.2257264, 1.380001, 1, 1, 1, 1, 1,
0.6602947, 0.4772948, 1.483598, 1, 1, 1, 1, 1,
0.6653659, -0.4668989, 3.234946, 1, 1, 1, 1, 1,
0.666054, 0.1437262, -1.002723, 1, 1, 1, 1, 1,
0.673326, -1.90312, 3.406821, 1, 1, 1, 1, 1,
0.6788081, 0.3370128, 1.46693, 1, 1, 1, 1, 1,
0.6826347, -0.4231922, 2.014443, 1, 1, 1, 1, 1,
0.6872051, -0.6595854, 1.277583, 1, 1, 1, 1, 1,
0.697634, -0.9504527, 3.415884, 1, 1, 1, 1, 1,
0.7029708, -1.450538, 1.540845, 1, 1, 1, 1, 1,
0.7162599, 0.4986051, -0.2903767, 1, 1, 1, 1, 1,
0.7222331, -1.523217, -0.2626781, 0, 0, 1, 1, 1,
0.7224308, -1.119681, 0.1006652, 1, 0, 0, 1, 1,
0.7263165, -0.548777, 3.339286, 1, 0, 0, 1, 1,
0.7397257, -0.2839698, 1.371274, 1, 0, 0, 1, 1,
0.7466208, 0.540339, 2.74011, 1, 0, 0, 1, 1,
0.7480531, 1.549337, 2.294713, 1, 0, 0, 1, 1,
0.748697, -0.5871287, 0.6415988, 0, 0, 0, 1, 1,
0.7587223, 0.349763, 2.895537, 0, 0, 0, 1, 1,
0.7641416, -0.3216231, 1.65608, 0, 0, 0, 1, 1,
0.7646228, 0.5950826, 1.164488, 0, 0, 0, 1, 1,
0.7684544, 0.9522892, -0.8185279, 0, 0, 0, 1, 1,
0.769828, -0.3053642, 2.160704, 0, 0, 0, 1, 1,
0.7716715, -1.007558, 0.6260244, 0, 0, 0, 1, 1,
0.7731195, 1.438283, 1.128641, 1, 1, 1, 1, 1,
0.7757806, -1.272786, 4.551232, 1, 1, 1, 1, 1,
0.7819492, -0.5725778, 3.677484, 1, 1, 1, 1, 1,
0.781979, -0.1671907, 2.13638, 1, 1, 1, 1, 1,
0.7823992, 0.9862227, 1.571178, 1, 1, 1, 1, 1,
0.7887263, -0.3459708, 0.1601294, 1, 1, 1, 1, 1,
0.7928331, -0.68724, 4.141819, 1, 1, 1, 1, 1,
0.8019414, -0.7094175, 2.700504, 1, 1, 1, 1, 1,
0.8030626, -1.962037, 2.76521, 1, 1, 1, 1, 1,
0.8040133, -1.609957, 2.550243, 1, 1, 1, 1, 1,
0.8102265, -1.182871, 1.812845, 1, 1, 1, 1, 1,
0.811199, -1.134717, 1.978484, 1, 1, 1, 1, 1,
0.8126069, -0.8231078, 1.472417, 1, 1, 1, 1, 1,
0.8149962, 0.8571806, 2.821721, 1, 1, 1, 1, 1,
0.818413, 0.995033, -0.7778621, 1, 1, 1, 1, 1,
0.820256, -0.1904816, 1.146788, 0, 0, 1, 1, 1,
0.8215351, 2.441009, 0.06033676, 1, 0, 0, 1, 1,
0.8215651, 0.4270356, 0.4295425, 1, 0, 0, 1, 1,
0.8218321, 0.5024653, 2.787063, 1, 0, 0, 1, 1,
0.8234026, 0.6850574, 0.8797781, 1, 0, 0, 1, 1,
0.830902, 1.44188, 0.5267767, 1, 0, 0, 1, 1,
0.8309532, -0.2950114, 0.5494833, 0, 0, 0, 1, 1,
0.8317743, 1.019851, 0.4543942, 0, 0, 0, 1, 1,
0.8339829, -1.015696, 3.314451, 0, 0, 0, 1, 1,
0.8355941, 1.227247, -0.292001, 0, 0, 0, 1, 1,
0.843842, -0.6014689, 1.19425, 0, 0, 0, 1, 1,
0.845088, 2.106798, 0.7994674, 0, 0, 0, 1, 1,
0.8494333, 0.8584971, 2.605584, 0, 0, 0, 1, 1,
0.8564038, -1.205101, 2.179049, 1, 1, 1, 1, 1,
0.8564359, 0.7389045, 0.7686381, 1, 1, 1, 1, 1,
0.8593444, 0.3837025, 2.0582, 1, 1, 1, 1, 1,
0.8599128, 0.9077009, 0.4635603, 1, 1, 1, 1, 1,
0.863968, -0.07864064, 2.496247, 1, 1, 1, 1, 1,
0.864256, 0.2654101, 2.789856, 1, 1, 1, 1, 1,
0.8643246, -0.6667501, 2.513129, 1, 1, 1, 1, 1,
0.8721983, -0.1080964, 1.923497, 1, 1, 1, 1, 1,
0.8729364, 0.4212957, 1.981712, 1, 1, 1, 1, 1,
0.8731344, -0.2584198, 2.33504, 1, 1, 1, 1, 1,
0.8731751, -1.544819, 2.341332, 1, 1, 1, 1, 1,
0.8762642, -1.73468, 3.057809, 1, 1, 1, 1, 1,
0.8807262, 1.549528, 1.186316, 1, 1, 1, 1, 1,
0.8826724, 0.3350903, 2.166211, 1, 1, 1, 1, 1,
0.8843185, -0.7832541, 3.708124, 1, 1, 1, 1, 1,
0.8857998, 0.4208215, 1.071795, 0, 0, 1, 1, 1,
0.8876677, -0.1979308, -0.2919184, 1, 0, 0, 1, 1,
0.8923329, -0.8235703, 3.919683, 1, 0, 0, 1, 1,
0.8963749, 0.5083265, 2.104025, 1, 0, 0, 1, 1,
0.8986999, 0.2675518, 2.821664, 1, 0, 0, 1, 1,
0.9015442, 0.7268881, 0.2337333, 1, 0, 0, 1, 1,
0.9057865, 0.1317452, 0.3308808, 0, 0, 0, 1, 1,
0.9077477, -0.8652163, 1.894843, 0, 0, 0, 1, 1,
0.9112819, -0.4535177, 3.163797, 0, 0, 0, 1, 1,
0.9113645, -2.01786, 3.160878, 0, 0, 0, 1, 1,
0.911667, -0.03924806, 1.414512, 0, 0, 0, 1, 1,
0.9134348, -1.397607, 1.624396, 0, 0, 0, 1, 1,
0.9175552, 0.02498521, 2.18725, 0, 0, 0, 1, 1,
0.922389, -0.9335566, 2.776516, 1, 1, 1, 1, 1,
0.92257, 1.250681, -0.3619265, 1, 1, 1, 1, 1,
0.9290814, -1.06964, 2.307088, 1, 1, 1, 1, 1,
0.9335886, -0.3253772, -0.5224207, 1, 1, 1, 1, 1,
0.9405653, -1.248389, 2.21224, 1, 1, 1, 1, 1,
0.9410162, -0.720535, 3.761939, 1, 1, 1, 1, 1,
0.9529028, -0.6523666, 2.582645, 1, 1, 1, 1, 1,
0.9551221, 0.1272383, 1.537438, 1, 1, 1, 1, 1,
0.9551452, 1.345162, 3.332383, 1, 1, 1, 1, 1,
0.9605939, 1.446223, 2.193786, 1, 1, 1, 1, 1,
0.9644464, -0.6674492, 0.5179519, 1, 1, 1, 1, 1,
0.9694188, -0.08621856, 1.385796, 1, 1, 1, 1, 1,
0.9720805, -0.446846, 1.629331, 1, 1, 1, 1, 1,
0.9723784, 0.9188612, 1.696869, 1, 1, 1, 1, 1,
0.9726171, -0.02838013, 2.722102, 1, 1, 1, 1, 1,
0.9757993, 0.5811402, -0.6555454, 0, 0, 1, 1, 1,
0.9771692, -0.2185442, 3.126169, 1, 0, 0, 1, 1,
0.9790016, -0.1237168, 1.361807, 1, 0, 0, 1, 1,
0.9798281, 0.1685042, 1.383535, 1, 0, 0, 1, 1,
0.9899215, -0.5926072, 2.092103, 1, 0, 0, 1, 1,
1.002326, -0.9829414, 0.5877698, 1, 0, 0, 1, 1,
1.00253, 0.701308, 1.562541, 0, 0, 0, 1, 1,
1.005636, 0.7245847, 1.476553, 0, 0, 0, 1, 1,
1.006879, -0.9449964, 1.094064, 0, 0, 0, 1, 1,
1.008749, 0.8926603, -1.043568, 0, 0, 0, 1, 1,
1.010382, -0.9284245, 3.288297, 0, 0, 0, 1, 1,
1.013975, -1.10093, 2.23297, 0, 0, 0, 1, 1,
1.018031, 0.6793427, 2.402612, 0, 0, 0, 1, 1,
1.021864, 0.7257554, 0.3944901, 1, 1, 1, 1, 1,
1.02589, -0.4223576, 1.281373, 1, 1, 1, 1, 1,
1.027655, 0.04681726, 1.967275, 1, 1, 1, 1, 1,
1.030203, -0.6148672, 3.180914, 1, 1, 1, 1, 1,
1.030682, 0.5127603, 0.6996917, 1, 1, 1, 1, 1,
1.032334, -1.011835, -0.05591909, 1, 1, 1, 1, 1,
1.036108, -0.9533767, 0.2685713, 1, 1, 1, 1, 1,
1.036216, 0.4724722, 0.1680497, 1, 1, 1, 1, 1,
1.039812, -0.9879919, 4.175126, 1, 1, 1, 1, 1,
1.042968, 0.8591036, 0.9966591, 1, 1, 1, 1, 1,
1.043551, -0.2616418, 1.298009, 1, 1, 1, 1, 1,
1.043755, -0.06843891, 1.289375, 1, 1, 1, 1, 1,
1.04475, -0.6548071, 0.7877846, 1, 1, 1, 1, 1,
1.045766, -1.37155, 3.358703, 1, 1, 1, 1, 1,
1.051293, 0.5464375, 0.5590291, 1, 1, 1, 1, 1,
1.057521, -1.024145, 2.888518, 0, 0, 1, 1, 1,
1.063561, 2.763464, -1.311471, 1, 0, 0, 1, 1,
1.067825, -1.375735, 3.600111, 1, 0, 0, 1, 1,
1.081586, -0.04298957, 2.153338, 1, 0, 0, 1, 1,
1.084761, 1.613843, 0.6310836, 1, 0, 0, 1, 1,
1.094065, 0.830551, 2.916499, 1, 0, 0, 1, 1,
1.096943, 1.480402, 0.8404244, 0, 0, 0, 1, 1,
1.1082, -0.5039203, 3.052244, 0, 0, 0, 1, 1,
1.110482, -0.1549969, 2.590747, 0, 0, 0, 1, 1,
1.110826, 0.1390984, 0.3187596, 0, 0, 0, 1, 1,
1.112037, 0.3388852, 1.160272, 0, 0, 0, 1, 1,
1.120952, 0.7445711, 0.4630911, 0, 0, 0, 1, 1,
1.125774, 0.1960734, 3.150784, 0, 0, 0, 1, 1,
1.128554, 1.661358, 0.5309976, 1, 1, 1, 1, 1,
1.131618, -0.232144, 1.198242, 1, 1, 1, 1, 1,
1.135404, -1.220809, 3.419392, 1, 1, 1, 1, 1,
1.136313, -3.38309, 1.743401, 1, 1, 1, 1, 1,
1.137132, 1.158818, 0.6028171, 1, 1, 1, 1, 1,
1.141006, 1.336405, 1.684181, 1, 1, 1, 1, 1,
1.146819, -0.2452015, 2.553856, 1, 1, 1, 1, 1,
1.150381, 1.261142, 1.254241, 1, 1, 1, 1, 1,
1.151586, -0.4361273, 2.314384, 1, 1, 1, 1, 1,
1.153812, -0.2814977, 3.139705, 1, 1, 1, 1, 1,
1.156738, 0.2362198, 1.131155, 1, 1, 1, 1, 1,
1.160074, -0.3329749, 0.2049004, 1, 1, 1, 1, 1,
1.160146, -2.166086, 1.595958, 1, 1, 1, 1, 1,
1.18033, 0.663489, -0.4382998, 1, 1, 1, 1, 1,
1.189758, 1.720023, 2.489779, 1, 1, 1, 1, 1,
1.194573, 0.1086752, 0.9252191, 0, 0, 1, 1, 1,
1.203506, -0.9729708, 0.2702447, 1, 0, 0, 1, 1,
1.215964, -0.07726837, 1.534015, 1, 0, 0, 1, 1,
1.230875, 0.5268164, -0.07583071, 1, 0, 0, 1, 1,
1.231925, 1.60483, 0.8546411, 1, 0, 0, 1, 1,
1.232059, -0.2033366, 2.47823, 1, 0, 0, 1, 1,
1.233936, -0.8622972, 3.312131, 0, 0, 0, 1, 1,
1.24605, -0.2122497, 2.104061, 0, 0, 0, 1, 1,
1.25005, -0.2451582, 2.470245, 0, 0, 0, 1, 1,
1.258857, 0.4932945, 1.077909, 0, 0, 0, 1, 1,
1.260505, 1.313402, 0.5955092, 0, 0, 0, 1, 1,
1.261967, -0.6318663, -0.177292, 0, 0, 0, 1, 1,
1.27358, -0.4948102, 1.628691, 0, 0, 0, 1, 1,
1.280245, -0.03384826, 1.266393, 1, 1, 1, 1, 1,
1.283838, 1.186695, -0.2736796, 1, 1, 1, 1, 1,
1.293425, -0.1778686, 2.468971, 1, 1, 1, 1, 1,
1.299715, -0.3610523, 2.457464, 1, 1, 1, 1, 1,
1.301839, 0.50587, 0.5721229, 1, 1, 1, 1, 1,
1.310727, -0.7848437, 3.658225, 1, 1, 1, 1, 1,
1.317495, -1.751598, 4.754963, 1, 1, 1, 1, 1,
1.317904, 0.3677122, 1.397749, 1, 1, 1, 1, 1,
1.319529, 0.1390534, 2.718811, 1, 1, 1, 1, 1,
1.33364, -0.7423455, 2.525758, 1, 1, 1, 1, 1,
1.334871, 0.0137575, 0.3692751, 1, 1, 1, 1, 1,
1.352478, -2.145745, 2.586265, 1, 1, 1, 1, 1,
1.375167, -0.8193833, 1.190175, 1, 1, 1, 1, 1,
1.380041, -0.3544572, 3.029269, 1, 1, 1, 1, 1,
1.384492, 1.073026, 1.197607, 1, 1, 1, 1, 1,
1.416403, 0.8419808, 1.448343, 0, 0, 1, 1, 1,
1.421317, 1.81965, 0.356203, 1, 0, 0, 1, 1,
1.425683, -0.5071596, 2.331244, 1, 0, 0, 1, 1,
1.434974, -2.054002, 1.438606, 1, 0, 0, 1, 1,
1.437782, -0.5756041, 0.763132, 1, 0, 0, 1, 1,
1.440134, 0.180711, 3.686128, 1, 0, 0, 1, 1,
1.445801, -0.05657266, 1.27202, 0, 0, 0, 1, 1,
1.448772, 1.437696, 2.823329, 0, 0, 0, 1, 1,
1.448984, 0.6453317, -0.0203181, 0, 0, 0, 1, 1,
1.460448, -0.8524019, 1.994245, 0, 0, 0, 1, 1,
1.46823, 0.03304522, 1.132467, 0, 0, 0, 1, 1,
1.472712, 0.8010979, 1.35197, 0, 0, 0, 1, 1,
1.472965, 0.5061958, 1.278816, 0, 0, 0, 1, 1,
1.488965, -0.4342456, 1.621544, 1, 1, 1, 1, 1,
1.493708, 0.540236, 1.909197, 1, 1, 1, 1, 1,
1.496077, -0.6723238, 1.169441, 1, 1, 1, 1, 1,
1.499252, 1.655923, 1.773676, 1, 1, 1, 1, 1,
1.500423, -1.002048, -0.2650562, 1, 1, 1, 1, 1,
1.512846, -0.5458606, 1.056437, 1, 1, 1, 1, 1,
1.534011, 0.8161064, 2.373812, 1, 1, 1, 1, 1,
1.561437, -0.07752053, 0.1569625, 1, 1, 1, 1, 1,
1.569116, -2.116937, 2.779442, 1, 1, 1, 1, 1,
1.570709, -0.7275528, 0.849385, 1, 1, 1, 1, 1,
1.589906, 1.108015, 1.976805, 1, 1, 1, 1, 1,
1.598537, -1.159819, 1.284635, 1, 1, 1, 1, 1,
1.601454, 0.3588784, 2.864533, 1, 1, 1, 1, 1,
1.602534, -0.9166056, 2.123689, 1, 1, 1, 1, 1,
1.619437, -0.8982207, 0.9405814, 1, 1, 1, 1, 1,
1.631411, 0.5391946, 2.032839, 0, 0, 1, 1, 1,
1.63524, -0.2609341, 1.259109, 1, 0, 0, 1, 1,
1.638038, -1.224849, 4.552533, 1, 0, 0, 1, 1,
1.700864, 0.1756042, 1.411239, 1, 0, 0, 1, 1,
1.706448, -0.724108, 1.226185, 1, 0, 0, 1, 1,
1.728494, -1.331814, 4.182751, 1, 0, 0, 1, 1,
1.750845, -0.6143392, 1.185564, 0, 0, 0, 1, 1,
1.768478, -0.2025317, 2.361775, 0, 0, 0, 1, 1,
1.810366, 1.474038, 0.3790576, 0, 0, 0, 1, 1,
1.815725, -0.4226631, 1.074264, 0, 0, 0, 1, 1,
1.815867, -0.8531341, 0.7025113, 0, 0, 0, 1, 1,
1.833496, 1.062511, 0.6605764, 0, 0, 0, 1, 1,
1.843689, 0.3004337, 0.8524852, 0, 0, 0, 1, 1,
1.846112, 0.1069492, 1.939687, 1, 1, 1, 1, 1,
1.846408, 0.009877237, 2.704932, 1, 1, 1, 1, 1,
1.852181, 0.09685969, 2.069051, 1, 1, 1, 1, 1,
1.911177, -0.5738911, 1.741638, 1, 1, 1, 1, 1,
1.917249, 0.353417, 2.174236, 1, 1, 1, 1, 1,
1.919558, -1.139357, 3.256409, 1, 1, 1, 1, 1,
1.922678, -0.2699047, 1.207148, 1, 1, 1, 1, 1,
1.933599, 1.391439, 1.764412, 1, 1, 1, 1, 1,
1.955712, 1.503272, 0.822698, 1, 1, 1, 1, 1,
1.959056, 0.9243238, 1.507266, 1, 1, 1, 1, 1,
1.962866, 1.074333, -0.003160607, 1, 1, 1, 1, 1,
1.969947, -0.4556359, 1.139636, 1, 1, 1, 1, 1,
1.971088, 1.203236, 1.041867, 1, 1, 1, 1, 1,
1.975191, -0.5208378, 2.326607, 1, 1, 1, 1, 1,
1.995774, -1.862208, 2.224249, 1, 1, 1, 1, 1,
2.007694, 0.00325237, 2.569798, 0, 0, 1, 1, 1,
2.04988, -1.06368, 1.371676, 1, 0, 0, 1, 1,
2.074265, -0.05450588, 1.76656, 1, 0, 0, 1, 1,
2.102378, 0.5209407, 0.9770802, 1, 0, 0, 1, 1,
2.108878, -0.1916598, 3.118402, 1, 0, 0, 1, 1,
2.155098, 0.6817834, 0.9617827, 1, 0, 0, 1, 1,
2.187242, 0.6962984, 1.781111, 0, 0, 0, 1, 1,
2.197244, 0.5256016, -0.6275572, 0, 0, 0, 1, 1,
2.231176, 0.3580176, 2.123535, 0, 0, 0, 1, 1,
2.242751, -2.224885, 3.826422, 0, 0, 0, 1, 1,
2.272315, 0.7542174, 2.743246, 0, 0, 0, 1, 1,
2.276493, 1.884456, 0.2187098, 0, 0, 0, 1, 1,
2.408927, 0.5580304, 0.577095, 0, 0, 0, 1, 1,
2.414978, -0.6587397, 1.518774, 1, 1, 1, 1, 1,
2.617869, 0.6778178, 0.2033427, 1, 1, 1, 1, 1,
2.640425, -1.312291, 0.5509184, 1, 1, 1, 1, 1,
2.664805, -1.14367, 2.916776, 1, 1, 1, 1, 1,
2.750221, -0.1396819, 2.915996, 1, 1, 1, 1, 1,
2.891414, 0.04996484, 2.637903, 1, 1, 1, 1, 1,
3.249259, -0.7482335, 3.359324, 1, 1, 1, 1, 1
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
var radius = 9.814046;
var distance = 34.47142;
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
mvMatrix.translate( 0.3771105, -0.02641726, 0.1685636 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.47142);
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
