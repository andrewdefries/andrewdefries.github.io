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
-3.648711, 1.708605, 1.978986, 1, 0, 0, 1,
-2.828639, 0.172977, -2.831123, 1, 0.007843138, 0, 1,
-2.625684, 1.161182, -0.2094157, 1, 0.01176471, 0, 1,
-2.579144, 2.459475, -0.12775, 1, 0.01960784, 0, 1,
-2.504543, 0.02161781, -1.247922, 1, 0.02352941, 0, 1,
-2.491738, -1.025874, -1.311499, 1, 0.03137255, 0, 1,
-2.477008, -0.6574755, -3.939232, 1, 0.03529412, 0, 1,
-2.415731, 0.305461, -1.951623, 1, 0.04313726, 0, 1,
-2.389108, -0.7181856, -2.719411, 1, 0.04705882, 0, 1,
-2.305287, 0.1906086, -1.74997, 1, 0.05490196, 0, 1,
-2.246433, -0.6350201, -1.938266, 1, 0.05882353, 0, 1,
-2.236622, 0.2770303, -2.772067, 1, 0.06666667, 0, 1,
-2.192276, 0.509925, -0.4720652, 1, 0.07058824, 0, 1,
-2.123103, -1.585963, -1.901765, 1, 0.07843138, 0, 1,
-2.08923, 0.5573367, 0.4039483, 1, 0.08235294, 0, 1,
-2.081002, -1.322254, -0.2486113, 1, 0.09019608, 0, 1,
-2.059791, -0.1044649, -0.9670091, 1, 0.09411765, 0, 1,
-2.054533, 0.6498362, -2.069896, 1, 0.1019608, 0, 1,
-2.017097, 1.825388, 0.1419337, 1, 0.1098039, 0, 1,
-2.005485, -0.4350427, -0.8266461, 1, 0.1137255, 0, 1,
-1.983854, 1.351229, -2.057296, 1, 0.1215686, 0, 1,
-1.929215, 0.5988986, -2.052378, 1, 0.1254902, 0, 1,
-1.916036, -1.811873, -4.458543, 1, 0.1333333, 0, 1,
-1.914133, 0.09358632, 0.3463134, 1, 0.1372549, 0, 1,
-1.901464, 0.100913, -1.239331, 1, 0.145098, 0, 1,
-1.896147, -0.6024277, -1.813978, 1, 0.1490196, 0, 1,
-1.882543, 0.5940189, -1.340435, 1, 0.1568628, 0, 1,
-1.881445, 0.955489, -2.259207, 1, 0.1607843, 0, 1,
-1.880637, -0.5679657, -2.599246, 1, 0.1686275, 0, 1,
-1.871882, -1.501411, -2.273867, 1, 0.172549, 0, 1,
-1.855384, -1.33296, -0.2655249, 1, 0.1803922, 0, 1,
-1.813046, 1.345735, -1.737775, 1, 0.1843137, 0, 1,
-1.800775, 0.2983544, -1.00825, 1, 0.1921569, 0, 1,
-1.790699, 0.3812201, -2.345066, 1, 0.1960784, 0, 1,
-1.787269, -0.7584825, -1.471959, 1, 0.2039216, 0, 1,
-1.757565, 0.2155181, -2.382374, 1, 0.2117647, 0, 1,
-1.749659, -1.092473, -2.708712, 1, 0.2156863, 0, 1,
-1.741645, 0.8238329, 0.1777399, 1, 0.2235294, 0, 1,
-1.725746, 0.5065925, -0.6630841, 1, 0.227451, 0, 1,
-1.722218, 0.8268587, -0.2132788, 1, 0.2352941, 0, 1,
-1.719949, 0.5154292, -2.035465, 1, 0.2392157, 0, 1,
-1.68252, -0.3176071, -1.259858, 1, 0.2470588, 0, 1,
-1.6824, 1.414946, -1.198932, 1, 0.2509804, 0, 1,
-1.68196, 0.5798311, -1.725558, 1, 0.2588235, 0, 1,
-1.680981, -0.7380008, -2.342326, 1, 0.2627451, 0, 1,
-1.666944, -0.2592323, -1.736974, 1, 0.2705882, 0, 1,
-1.663143, 1.405135, 0.3321442, 1, 0.2745098, 0, 1,
-1.655324, -1.994995, -0.2151132, 1, 0.282353, 0, 1,
-1.617921, -1.1985, -0.1364996, 1, 0.2862745, 0, 1,
-1.608539, -0.2759923, -3.34221, 1, 0.2941177, 0, 1,
-1.603468, 0.2196932, -1.863328, 1, 0.3019608, 0, 1,
-1.598314, 0.439033, -1.107517, 1, 0.3058824, 0, 1,
-1.583428, 0.8932785, -1.601399, 1, 0.3137255, 0, 1,
-1.560756, 0.7158437, -1.952797, 1, 0.3176471, 0, 1,
-1.552933, -0.6429099, -0.6928749, 1, 0.3254902, 0, 1,
-1.538526, -0.2869428, -2.798754, 1, 0.3294118, 0, 1,
-1.505674, 0.1516623, -0.6375128, 1, 0.3372549, 0, 1,
-1.5028, -0.1452774, -3.291019, 1, 0.3411765, 0, 1,
-1.50016, 1.380263, -1.289828, 1, 0.3490196, 0, 1,
-1.498993, 0.5971975, -0.4709791, 1, 0.3529412, 0, 1,
-1.488432, -0.5032288, -1.129311, 1, 0.3607843, 0, 1,
-1.485403, 0.866241, -1.66044, 1, 0.3647059, 0, 1,
-1.483623, -1.297897, -2.199673, 1, 0.372549, 0, 1,
-1.477157, 0.2420232, -0.7201768, 1, 0.3764706, 0, 1,
-1.456074, -0.5333533, -3.406863, 1, 0.3843137, 0, 1,
-1.455064, -0.8337691, -1.616808, 1, 0.3882353, 0, 1,
-1.454988, -1.503821, -3.011251, 1, 0.3960784, 0, 1,
-1.429727, 1.305819, -0.5331222, 1, 0.4039216, 0, 1,
-1.425335, -1.401613, -1.822334, 1, 0.4078431, 0, 1,
-1.422722, 0.8253094, -0.4795526, 1, 0.4156863, 0, 1,
-1.410863, -0.6776239, -1.64414, 1, 0.4196078, 0, 1,
-1.409918, 0.9007401, -2.767653, 1, 0.427451, 0, 1,
-1.405889, 1.408074, -1.30533, 1, 0.4313726, 0, 1,
-1.394717, 0.5691983, -1.425561, 1, 0.4392157, 0, 1,
-1.390081, -0.1816676, -0.9507451, 1, 0.4431373, 0, 1,
-1.385418, -1.295832, -4.055363, 1, 0.4509804, 0, 1,
-1.382016, 1.574566, -1.740531, 1, 0.454902, 0, 1,
-1.38051, 1.118431, -1.685009, 1, 0.4627451, 0, 1,
-1.373491, -0.7424276, -3.433334, 1, 0.4666667, 0, 1,
-1.371699, -0.4199321, -2.711056, 1, 0.4745098, 0, 1,
-1.36638, -0.2517829, -0.9739122, 1, 0.4784314, 0, 1,
-1.362663, 0.1739951, -0.9615234, 1, 0.4862745, 0, 1,
-1.361276, -1.421726, -0.9952983, 1, 0.4901961, 0, 1,
-1.345892, -0.5450922, -2.925776, 1, 0.4980392, 0, 1,
-1.344875, 1.109599, -2.163013, 1, 0.5058824, 0, 1,
-1.331, -0.3023083, -1.709689, 1, 0.509804, 0, 1,
-1.330368, 0.4161104, -2.297523, 1, 0.5176471, 0, 1,
-1.329103, -1.250605, -2.613333, 1, 0.5215687, 0, 1,
-1.325244, -1.043273, -2.671302, 1, 0.5294118, 0, 1,
-1.321896, -0.0147652, -0.3661711, 1, 0.5333334, 0, 1,
-1.311872, 0.9766749, 1.123935, 1, 0.5411765, 0, 1,
-1.309432, -0.08017256, -1.408955, 1, 0.5450981, 0, 1,
-1.299458, 0.008605313, -0.850221, 1, 0.5529412, 0, 1,
-1.294151, -1.780049, -2.045975, 1, 0.5568628, 0, 1,
-1.292232, 1.338176, -2.302545, 1, 0.5647059, 0, 1,
-1.290981, 0.1216102, -2.337232, 1, 0.5686275, 0, 1,
-1.289649, 2.003239, 0.06180707, 1, 0.5764706, 0, 1,
-1.286508, -2.3671, -3.538721, 1, 0.5803922, 0, 1,
-1.286417, -1.539142, -2.866845, 1, 0.5882353, 0, 1,
-1.285523, -0.4859574, -3.319954, 1, 0.5921569, 0, 1,
-1.283862, -0.7298552, -2.088788, 1, 0.6, 0, 1,
-1.277024, 1.968317, 0.3530654, 1, 0.6078432, 0, 1,
-1.276183, -0.3609776, -2.725285, 1, 0.6117647, 0, 1,
-1.275622, -1.287018, -0.6915007, 1, 0.6196079, 0, 1,
-1.271948, 1.189455, -2.083051, 1, 0.6235294, 0, 1,
-1.25789, -0.165278, -1.038004, 1, 0.6313726, 0, 1,
-1.250711, 0.7583551, -1.010761, 1, 0.6352941, 0, 1,
-1.236185, 0.1741246, -0.5938337, 1, 0.6431373, 0, 1,
-1.223224, 1.749937, -0.1884043, 1, 0.6470588, 0, 1,
-1.216578, -0.815898, -3.068849, 1, 0.654902, 0, 1,
-1.202829, -0.231114, 0.88806, 1, 0.6588235, 0, 1,
-1.194128, 0.6322628, -0.5687901, 1, 0.6666667, 0, 1,
-1.193223, 0.5447956, -1.375502, 1, 0.6705883, 0, 1,
-1.184688, 2.834027, -0.7694021, 1, 0.6784314, 0, 1,
-1.182431, -0.02435237, -0.787619, 1, 0.682353, 0, 1,
-1.181795, -1.781244, 0.3700191, 1, 0.6901961, 0, 1,
-1.180134, -1.341969, -1.673997, 1, 0.6941177, 0, 1,
-1.171414, -0.8656167, -3.104775, 1, 0.7019608, 0, 1,
-1.161319, 0.3809295, -0.7281326, 1, 0.7098039, 0, 1,
-1.154172, 0.7835079, -1.939098, 1, 0.7137255, 0, 1,
-1.14886, 0.3969171, -1.928509, 1, 0.7215686, 0, 1,
-1.144767, 0.05725335, -2.185013, 1, 0.7254902, 0, 1,
-1.136648, -0.01316325, -2.167227, 1, 0.7333333, 0, 1,
-1.128579, 1.805323, 0.3870255, 1, 0.7372549, 0, 1,
-1.123327, 0.4729803, -2.402897, 1, 0.7450981, 0, 1,
-1.120779, -1.662076, -1.632697, 1, 0.7490196, 0, 1,
-1.11696, 0.4229357, -1.20281, 1, 0.7568628, 0, 1,
-1.102668, 0.04236718, -1.203333, 1, 0.7607843, 0, 1,
-1.102535, 0.2731764, -2.258299, 1, 0.7686275, 0, 1,
-1.10113, -0.5001566, -2.466804, 1, 0.772549, 0, 1,
-1.100172, 0.8864631, -0.1886544, 1, 0.7803922, 0, 1,
-1.099725, 0.4412875, -1.280357, 1, 0.7843137, 0, 1,
-1.089371, -0.708263, -1.600713, 1, 0.7921569, 0, 1,
-1.076799, 1.097443, -0.3765155, 1, 0.7960784, 0, 1,
-1.076738, 0.2479414, -3.243673, 1, 0.8039216, 0, 1,
-1.075572, -0.5631393, -1.585741, 1, 0.8117647, 0, 1,
-1.07264, -0.09760476, -1.757208, 1, 0.8156863, 0, 1,
-1.070161, 0.6457402, 1.872391, 1, 0.8235294, 0, 1,
-1.059261, 0.553495, -0.8260294, 1, 0.827451, 0, 1,
-1.050318, 1.677992, 0.1721443, 1, 0.8352941, 0, 1,
-1.049696, -0.2840336, -3.178076, 1, 0.8392157, 0, 1,
-1.04221, -1.930909, -1.567672, 1, 0.8470588, 0, 1,
-1.041004, -0.07004717, -1.739954, 1, 0.8509804, 0, 1,
-1.038308, 0.565804, -1.13014, 1, 0.8588235, 0, 1,
-1.03197, 1.949621, -0.7633279, 1, 0.8627451, 0, 1,
-1.031238, -0.7669238, -2.937918, 1, 0.8705882, 0, 1,
-1.029143, -0.09920439, -2.505105, 1, 0.8745098, 0, 1,
-1.024397, -0.8664871, -3.234118, 1, 0.8823529, 0, 1,
-1.023333, 1.144183, -1.229474, 1, 0.8862745, 0, 1,
-1.020185, -0.7434684, -1.336594, 1, 0.8941177, 0, 1,
-1.018061, 0.829343, -1.493985, 1, 0.8980392, 0, 1,
-1.01523, -0.7306088, -1.720209, 1, 0.9058824, 0, 1,
-1.015156, 0.7756417, -2.870367, 1, 0.9137255, 0, 1,
-1.014278, -0.2249736, -1.907069, 1, 0.9176471, 0, 1,
-1.013947, -1.68424, -2.894464, 1, 0.9254902, 0, 1,
-1.00199, 0.5401053, -1.047043, 1, 0.9294118, 0, 1,
-0.9953766, 1.046408, -1.717388, 1, 0.9372549, 0, 1,
-0.9943454, -0.04005858, -1.8317, 1, 0.9411765, 0, 1,
-0.992537, 0.2343579, -1.294591, 1, 0.9490196, 0, 1,
-0.9867443, 0.6865036, -0.730756, 1, 0.9529412, 0, 1,
-0.985393, 0.182042, -1.270678, 1, 0.9607843, 0, 1,
-0.984602, -0.6012124, -3.014983, 1, 0.9647059, 0, 1,
-0.9832296, 1.539584, -1.232541, 1, 0.972549, 0, 1,
-0.9823852, 0.0265867, -2.265156, 1, 0.9764706, 0, 1,
-0.9818694, 0.6486818, -1.011571, 1, 0.9843137, 0, 1,
-0.9759062, 0.1701177, -0.1586474, 1, 0.9882353, 0, 1,
-0.9755851, -1.381901, -3.29912, 1, 0.9960784, 0, 1,
-0.9610608, 0.5355498, -1.368814, 0.9960784, 1, 0, 1,
-0.960888, 0.005818058, -2.248544, 0.9921569, 1, 0, 1,
-0.9607943, 1.583548, -1.137353, 0.9843137, 1, 0, 1,
-0.9564993, 0.002221312, -0.3638144, 0.9803922, 1, 0, 1,
-0.9539768, 0.0354604, -0.7600455, 0.972549, 1, 0, 1,
-0.9520169, 0.3052868, -0.3299739, 0.9686275, 1, 0, 1,
-0.9513073, -0.7610235, -2.829427, 0.9607843, 1, 0, 1,
-0.9437459, 1.521669, 0.0722526, 0.9568627, 1, 0, 1,
-0.9429128, 0.02430646, -2.206055, 0.9490196, 1, 0, 1,
-0.9419459, 0.2863179, -1.477264, 0.945098, 1, 0, 1,
-0.9400817, 0.4643478, -1.595842, 0.9372549, 1, 0, 1,
-0.9355754, 1.227953, -1.782787, 0.9333333, 1, 0, 1,
-0.9304676, 1.874217, -1.072962, 0.9254902, 1, 0, 1,
-0.930429, -0.7826054, -2.279998, 0.9215686, 1, 0, 1,
-0.9268407, -1.120844, -1.748809, 0.9137255, 1, 0, 1,
-0.9117773, 2.199346, 1.339183, 0.9098039, 1, 0, 1,
-0.9044328, 1.297055, -0.2674884, 0.9019608, 1, 0, 1,
-0.8889631, -0.4138246, -0.6402206, 0.8941177, 1, 0, 1,
-0.8846508, 0.3553801, -1.612869, 0.8901961, 1, 0, 1,
-0.8770525, 1.426149, 0.5339099, 0.8823529, 1, 0, 1,
-0.8695048, -0.6358831, -2.622456, 0.8784314, 1, 0, 1,
-0.8596615, 1.69602, 1.332431, 0.8705882, 1, 0, 1,
-0.8564398, 1.952311, -0.3494673, 0.8666667, 1, 0, 1,
-0.8549098, 0.721382, 0.1232563, 0.8588235, 1, 0, 1,
-0.8544665, 0.5536361, 0.7890715, 0.854902, 1, 0, 1,
-0.8529996, 0.1477786, -0.7675929, 0.8470588, 1, 0, 1,
-0.8522364, -0.05391209, -2.471631, 0.8431373, 1, 0, 1,
-0.8515695, 2.163045, -3.293331, 0.8352941, 1, 0, 1,
-0.8503042, 0.06544476, -1.622453, 0.8313726, 1, 0, 1,
-0.8502728, -0.4692284, -0.6981329, 0.8235294, 1, 0, 1,
-0.8469061, 0.0533939, -2.635834, 0.8196079, 1, 0, 1,
-0.834511, 0.4956177, -1.140671, 0.8117647, 1, 0, 1,
-0.8276632, 1.535624, -0.7339493, 0.8078431, 1, 0, 1,
-0.8274891, 0.2857958, -1.268634, 0.8, 1, 0, 1,
-0.8269806, 0.7415587, -0.3706852, 0.7921569, 1, 0, 1,
-0.8252845, 1.454835, -0.09485681, 0.7882353, 1, 0, 1,
-0.8252599, 0.6042841, -0.9671319, 0.7803922, 1, 0, 1,
-0.8242407, 0.5545107, -2.258024, 0.7764706, 1, 0, 1,
-0.8230442, 1.548706, 0.2613885, 0.7686275, 1, 0, 1,
-0.8230124, -0.9718406, -3.023637, 0.7647059, 1, 0, 1,
-0.810608, -0.2469618, 0.2885885, 0.7568628, 1, 0, 1,
-0.8104871, -0.04356001, -1.092169, 0.7529412, 1, 0, 1,
-0.8087245, 1.062201, -1.204508, 0.7450981, 1, 0, 1,
-0.8062766, 2.881855, 0.5799775, 0.7411765, 1, 0, 1,
-0.8057337, -0.2298934, -1.287816, 0.7333333, 1, 0, 1,
-0.7980996, -2.717362, -2.76601, 0.7294118, 1, 0, 1,
-0.7977372, 1.344668, -0.1194428, 0.7215686, 1, 0, 1,
-0.792015, -0.1125037, -0.9179081, 0.7176471, 1, 0, 1,
-0.7802651, 0.4659019, -2.380221, 0.7098039, 1, 0, 1,
-0.7791341, -1.300867, -2.291766, 0.7058824, 1, 0, 1,
-0.7712417, 1.601343, -1.484463, 0.6980392, 1, 0, 1,
-0.7707283, -0.6246215, -3.197862, 0.6901961, 1, 0, 1,
-0.7704099, -0.6768866, -0.02950988, 0.6862745, 1, 0, 1,
-0.7637955, -0.6929622, -1.628657, 0.6784314, 1, 0, 1,
-0.7626206, 1.085018, -0.09665603, 0.6745098, 1, 0, 1,
-0.7550303, 1.281051, -2.524995, 0.6666667, 1, 0, 1,
-0.753924, -0.3550336, -2.842254, 0.6627451, 1, 0, 1,
-0.7538819, 1.771787, 0.7231203, 0.654902, 1, 0, 1,
-0.7501179, -1.193106, -3.268448, 0.6509804, 1, 0, 1,
-0.7434006, -0.3001004, -0.3145197, 0.6431373, 1, 0, 1,
-0.7361646, 0.1072016, -1.892036, 0.6392157, 1, 0, 1,
-0.7351254, 0.5356075, -0.7667785, 0.6313726, 1, 0, 1,
-0.7317277, -0.6680044, -2.778854, 0.627451, 1, 0, 1,
-0.7262903, 0.2274119, -2.942321, 0.6196079, 1, 0, 1,
-0.7217642, -0.3361289, -1.681992, 0.6156863, 1, 0, 1,
-0.7211298, -0.8516394, -2.478609, 0.6078432, 1, 0, 1,
-0.7198462, -1.217169, -1.898734, 0.6039216, 1, 0, 1,
-0.7156806, -0.06894743, -2.48297, 0.5960785, 1, 0, 1,
-0.7118823, -0.7909961, -2.949654, 0.5882353, 1, 0, 1,
-0.711824, -0.1467052, -2.252995, 0.5843138, 1, 0, 1,
-0.7110785, 1.754331, -0.3612565, 0.5764706, 1, 0, 1,
-0.7097893, 1.916149, -0.315651, 0.572549, 1, 0, 1,
-0.7082748, 1.486506, -1.322691, 0.5647059, 1, 0, 1,
-0.697561, -1.163643, -1.269067, 0.5607843, 1, 0, 1,
-0.6893523, -0.3097716, -1.685659, 0.5529412, 1, 0, 1,
-0.6850093, -0.1467396, -0.2705547, 0.5490196, 1, 0, 1,
-0.6836927, 1.239884, -1.021124, 0.5411765, 1, 0, 1,
-0.6824862, -0.2183798, -1.322182, 0.5372549, 1, 0, 1,
-0.6783196, 1.041039, -1.112712, 0.5294118, 1, 0, 1,
-0.678234, -0.5424632, -1.115991, 0.5254902, 1, 0, 1,
-0.677802, 1.064642, -0.5410709, 0.5176471, 1, 0, 1,
-0.6776515, 1.195089, 0.4779907, 0.5137255, 1, 0, 1,
-0.6771424, -0.1158211, -1.745807, 0.5058824, 1, 0, 1,
-0.6716701, 0.7908249, -0.296258, 0.5019608, 1, 0, 1,
-0.6713484, 1.625857, -1.293063, 0.4941176, 1, 0, 1,
-0.6692255, -0.6847123, -2.139397, 0.4862745, 1, 0, 1,
-0.6689662, -0.7744781, -2.251103, 0.4823529, 1, 0, 1,
-0.6540195, 0.2126839, -2.099287, 0.4745098, 1, 0, 1,
-0.6531034, -0.4123544, -4.373184, 0.4705882, 1, 0, 1,
-0.6451131, 1.530557, 0.2015467, 0.4627451, 1, 0, 1,
-0.6436527, 2.60184, -1.648888, 0.4588235, 1, 0, 1,
-0.6398022, 1.506382, -0.4176754, 0.4509804, 1, 0, 1,
-0.6370935, 0.2698289, -2.370411, 0.4470588, 1, 0, 1,
-0.6303197, -0.8741874, -5.678612, 0.4392157, 1, 0, 1,
-0.6283238, 0.6020977, -0.9126545, 0.4352941, 1, 0, 1,
-0.6248901, 0.7837092, -0.1355857, 0.427451, 1, 0, 1,
-0.6248555, 1.409121, 0.4715385, 0.4235294, 1, 0, 1,
-0.6223615, 1.588544, 0.9429957, 0.4156863, 1, 0, 1,
-0.6147554, -0.7308881, -2.622099, 0.4117647, 1, 0, 1,
-0.6084872, 1.203621, 1.313023, 0.4039216, 1, 0, 1,
-0.6055855, 1.356002, 0.03626325, 0.3960784, 1, 0, 1,
-0.6054016, -0.3452529, -0.7188686, 0.3921569, 1, 0, 1,
-0.6048435, -0.8398829, -2.7305, 0.3843137, 1, 0, 1,
-0.6038054, -0.3220288, -0.7874249, 0.3803922, 1, 0, 1,
-0.6025215, 0.02723488, -1.38334, 0.372549, 1, 0, 1,
-0.5998914, 0.4861123, 1.136887, 0.3686275, 1, 0, 1,
-0.5987145, 1.227038, -1.719177, 0.3607843, 1, 0, 1,
-0.5969607, 0.2849494, -2.008909, 0.3568628, 1, 0, 1,
-0.5962867, 0.09297498, -0.02409687, 0.3490196, 1, 0, 1,
-0.5920444, -0.4620294, -2.799754, 0.345098, 1, 0, 1,
-0.5913877, 0.4108016, -2.151031, 0.3372549, 1, 0, 1,
-0.5893876, -1.04461, -3.729874, 0.3333333, 1, 0, 1,
-0.5821964, 0.4125184, -0.8372653, 0.3254902, 1, 0, 1,
-0.5775727, -1.006392, -3.881321, 0.3215686, 1, 0, 1,
-0.5715182, 2.08627, 0.3182546, 0.3137255, 1, 0, 1,
-0.5688881, 0.522969, -0.1105867, 0.3098039, 1, 0, 1,
-0.5669612, 1.046398, 0.3996996, 0.3019608, 1, 0, 1,
-0.5667881, 1.006676, -1.438528, 0.2941177, 1, 0, 1,
-0.5635822, 0.006653551, -2.633914, 0.2901961, 1, 0, 1,
-0.5586722, -1.385913, -3.115838, 0.282353, 1, 0, 1,
-0.557211, 0.3859572, -0.2767879, 0.2784314, 1, 0, 1,
-0.5519077, 0.9087095, -0.0119216, 0.2705882, 1, 0, 1,
-0.55124, -0.7953712, -2.260516, 0.2666667, 1, 0, 1,
-0.5387548, -0.8452126, -2.404731, 0.2588235, 1, 0, 1,
-0.5381106, -1.584999, -2.622735, 0.254902, 1, 0, 1,
-0.5365502, -1.204193, -2.944797, 0.2470588, 1, 0, 1,
-0.5293072, 1.517031, -1.686844, 0.2431373, 1, 0, 1,
-0.5270599, -0.5723016, -2.036326, 0.2352941, 1, 0, 1,
-0.5212832, -0.1206836, 0.6609729, 0.2313726, 1, 0, 1,
-0.5155252, -0.2066039, -2.167817, 0.2235294, 1, 0, 1,
-0.5078923, 1.074216, -0.646788, 0.2196078, 1, 0, 1,
-0.5016919, -2.17787, -3.849646, 0.2117647, 1, 0, 1,
-0.4962927, 0.5833084, -0.6711224, 0.2078431, 1, 0, 1,
-0.4936576, -0.497587, -2.440915, 0.2, 1, 0, 1,
-0.4916126, 0.6027743, -0.7290054, 0.1921569, 1, 0, 1,
-0.4891658, 0.2741008, -1.049479, 0.1882353, 1, 0, 1,
-0.4841897, -0.9415344, -2.739285, 0.1803922, 1, 0, 1,
-0.4810812, -0.06575788, -1.064072, 0.1764706, 1, 0, 1,
-0.4773577, 1.981457, 0.3034489, 0.1686275, 1, 0, 1,
-0.4770349, -0.5982875, -1.299189, 0.1647059, 1, 0, 1,
-0.4760353, 0.1491611, -0.98184, 0.1568628, 1, 0, 1,
-0.4743077, 0.7091733, -0.4927982, 0.1529412, 1, 0, 1,
-0.4694581, -0.6748795, -1.661218, 0.145098, 1, 0, 1,
-0.4674774, 0.7526168, 3.203093, 0.1411765, 1, 0, 1,
-0.4642904, 0.6279571, 0.9156697, 0.1333333, 1, 0, 1,
-0.4634679, -0.9682571, -1.360779, 0.1294118, 1, 0, 1,
-0.4624119, -0.7011986, -1.989778, 0.1215686, 1, 0, 1,
-0.4533953, -1.594079, -2.610593, 0.1176471, 1, 0, 1,
-0.4528963, 0.2829483, -1.492173, 0.1098039, 1, 0, 1,
-0.4494643, -0.5879154, -1.965861, 0.1058824, 1, 0, 1,
-0.448042, 1.041943, -0.03158921, 0.09803922, 1, 0, 1,
-0.4472815, 0.5235431, -2.521105, 0.09019608, 1, 0, 1,
-0.446229, 0.3668365, -3.178703, 0.08627451, 1, 0, 1,
-0.4440705, 1.6706, -0.6127368, 0.07843138, 1, 0, 1,
-0.4384656, 0.8293028, 0.3622896, 0.07450981, 1, 0, 1,
-0.4355448, 0.5281848, -0.2467089, 0.06666667, 1, 0, 1,
-0.4319877, -0.2334693, -1.461126, 0.0627451, 1, 0, 1,
-0.4241236, -0.3265275, -3.346957, 0.05490196, 1, 0, 1,
-0.4212572, 0.2385298, -4.463052, 0.05098039, 1, 0, 1,
-0.4170296, 0.726473, 0.3934872, 0.04313726, 1, 0, 1,
-0.4130384, -0.9736597, -4.14812, 0.03921569, 1, 0, 1,
-0.4117996, 1.207386, -0.2805128, 0.03137255, 1, 0, 1,
-0.4114872, 1.360141, -0.9535243, 0.02745098, 1, 0, 1,
-0.4083712, -0.6044745, -2.155955, 0.01960784, 1, 0, 1,
-0.4078395, 2.281555, -1.275158, 0.01568628, 1, 0, 1,
-0.4056142, 0.6306136, -0.2393859, 0.007843138, 1, 0, 1,
-0.4033209, 2.415131, 0.9559845, 0.003921569, 1, 0, 1,
-0.4007088, 0.4953111, -1.283003, 0, 1, 0.003921569, 1,
-0.3992366, 1.917607, 0.08892556, 0, 1, 0.01176471, 1,
-0.3926179, 0.2747865, -0.5619439, 0, 1, 0.01568628, 1,
-0.3812619, -0.2014081, -1.639023, 0, 1, 0.02352941, 1,
-0.3737907, -0.2232274, -2.804493, 0, 1, 0.02745098, 1,
-0.3728741, 0.8732449, 0.5452525, 0, 1, 0.03529412, 1,
-0.3685339, -0.2860072, -1.250435, 0, 1, 0.03921569, 1,
-0.3637166, 0.3557753, -2.010502, 0, 1, 0.04705882, 1,
-0.3631843, -0.307063, -2.683748, 0, 1, 0.05098039, 1,
-0.3618153, -0.7305895, -4.411426, 0, 1, 0.05882353, 1,
-0.3615949, -0.8475417, -2.753461, 0, 1, 0.0627451, 1,
-0.3551631, 1.405499, -0.3118303, 0, 1, 0.07058824, 1,
-0.3509264, -0.08529346, -1.487786, 0, 1, 0.07450981, 1,
-0.3498996, -1.464561, -3.436882, 0, 1, 0.08235294, 1,
-0.3493228, 0.8581608, -0.9895021, 0, 1, 0.08627451, 1,
-0.3479779, 0.7028667, 0.1763222, 0, 1, 0.09411765, 1,
-0.3470838, 2.382213, -1.576184, 0, 1, 0.1019608, 1,
-0.3464887, -1.079967, -3.553362, 0, 1, 0.1058824, 1,
-0.3445681, -1.862135, -3.014571, 0, 1, 0.1137255, 1,
-0.338491, -1.419996, -4.720011, 0, 1, 0.1176471, 1,
-0.3380617, -0.2072301, -2.553592, 0, 1, 0.1254902, 1,
-0.3379769, 2.022418, 0.4277673, 0, 1, 0.1294118, 1,
-0.3368694, 1.606143, -1.147735, 0, 1, 0.1372549, 1,
-0.333764, -0.137348, 0.9205374, 0, 1, 0.1411765, 1,
-0.3330002, -0.891589, -1.977978, 0, 1, 0.1490196, 1,
-0.3285251, -0.1400522, -2.454558, 0, 1, 0.1529412, 1,
-0.3281105, 1.012535, 1.309406, 0, 1, 0.1607843, 1,
-0.3230168, -0.1326253, -1.077118, 0, 1, 0.1647059, 1,
-0.3221274, -2.634761, -2.776011, 0, 1, 0.172549, 1,
-0.3207923, -0.1392113, -3.000076, 0, 1, 0.1764706, 1,
-0.319728, -0.9680353, -2.26227, 0, 1, 0.1843137, 1,
-0.3169236, -1.214459, -2.526284, 0, 1, 0.1882353, 1,
-0.3132584, 0.9896482, -1.450067, 0, 1, 0.1960784, 1,
-0.3131687, -1.046025, -3.877489, 0, 1, 0.2039216, 1,
-0.3116829, -0.233628, -2.953345, 0, 1, 0.2078431, 1,
-0.3096224, -0.3830679, -2.226528, 0, 1, 0.2156863, 1,
-0.306363, 0.6741982, 0.5207744, 0, 1, 0.2196078, 1,
-0.3060921, -1.639681, -2.527236, 0, 1, 0.227451, 1,
-0.3038168, -0.6320233, -2.485288, 0, 1, 0.2313726, 1,
-0.3036954, 0.1727471, -0.9956057, 0, 1, 0.2392157, 1,
-0.3032523, -0.8403155, -3.407832, 0, 1, 0.2431373, 1,
-0.3000873, 0.5558804, 0.5368185, 0, 1, 0.2509804, 1,
-0.2958953, -0.06138393, 0.3020305, 0, 1, 0.254902, 1,
-0.2951991, -0.8196932, -3.489155, 0, 1, 0.2627451, 1,
-0.2942737, -0.2046279, -2.24677, 0, 1, 0.2666667, 1,
-0.2852284, -0.6170076, -2.424166, 0, 1, 0.2745098, 1,
-0.283453, 0.6243107, 0.7076949, 0, 1, 0.2784314, 1,
-0.2818163, -0.2053853, -2.491343, 0, 1, 0.2862745, 1,
-0.2761426, 0.1964369, -1.665989, 0, 1, 0.2901961, 1,
-0.2758507, 0.4458315, 0.1458581, 0, 1, 0.2980392, 1,
-0.2726263, -0.657157, -3.948097, 0, 1, 0.3058824, 1,
-0.2623314, 1.703442, 0.04406324, 0, 1, 0.3098039, 1,
-0.2607845, 1.312158, 1.306792, 0, 1, 0.3176471, 1,
-0.2603292, 0.681838, 1.306632, 0, 1, 0.3215686, 1,
-0.2601405, -0.8009341, -2.200003, 0, 1, 0.3294118, 1,
-0.2587897, 1.565591, 0.6901478, 0, 1, 0.3333333, 1,
-0.2558093, 0.3140552, -0.6425098, 0, 1, 0.3411765, 1,
-0.2552864, -1.232813, -1.762014, 0, 1, 0.345098, 1,
-0.253734, 0.1811363, -0.9400052, 0, 1, 0.3529412, 1,
-0.2493255, -0.2732257, -2.658891, 0, 1, 0.3568628, 1,
-0.2484873, 0.6434265, -1.833808, 0, 1, 0.3647059, 1,
-0.2476966, 0.01741693, -0.6770014, 0, 1, 0.3686275, 1,
-0.2462558, 0.8459639, -0.1487198, 0, 1, 0.3764706, 1,
-0.2433283, -0.2001123, -1.908618, 0, 1, 0.3803922, 1,
-0.2431433, 1.508966, 0.7114329, 0, 1, 0.3882353, 1,
-0.2412008, 0.2261834, -1.188846, 0, 1, 0.3921569, 1,
-0.2344989, 0.8095758, -1.350164, 0, 1, 0.4, 1,
-0.2326831, 1.818229, -0.763872, 0, 1, 0.4078431, 1,
-0.2272529, -0.2756675, -2.445264, 0, 1, 0.4117647, 1,
-0.2270781, -1.902015, -3.252764, 0, 1, 0.4196078, 1,
-0.2249136, 1.101191, -0.02013298, 0, 1, 0.4235294, 1,
-0.2230867, -0.7945608, -3.704417, 0, 1, 0.4313726, 1,
-0.2195316, 1.379298, 0.1216296, 0, 1, 0.4352941, 1,
-0.2168619, -0.9594469, -5.355947, 0, 1, 0.4431373, 1,
-0.2159562, -0.01841987, -1.328654, 0, 1, 0.4470588, 1,
-0.2158819, -0.4727807, -3.424902, 0, 1, 0.454902, 1,
-0.2136471, -0.1275934, -0.894388, 0, 1, 0.4588235, 1,
-0.2094721, 1.230151, -0.7120438, 0, 1, 0.4666667, 1,
-0.2061752, -1.443373, -2.758098, 0, 1, 0.4705882, 1,
-0.2047565, -0.9229562, -2.128707, 0, 1, 0.4784314, 1,
-0.2032463, 0.3958686, -0.6773689, 0, 1, 0.4823529, 1,
-0.2012101, -0.4922968, -3.959146, 0, 1, 0.4901961, 1,
-0.199332, 0.1205818, -1.591468, 0, 1, 0.4941176, 1,
-0.1985261, -0.1195473, -4.034838, 0, 1, 0.5019608, 1,
-0.1953246, -0.1884008, -1.677446, 0, 1, 0.509804, 1,
-0.1926813, 0.4240052, -2.002216, 0, 1, 0.5137255, 1,
-0.1922886, -0.4530493, -2.270675, 0, 1, 0.5215687, 1,
-0.1917733, -0.6103351, -1.283311, 0, 1, 0.5254902, 1,
-0.1907075, -0.8406742, -2.090252, 0, 1, 0.5333334, 1,
-0.1897268, 0.09512922, -0.1941969, 0, 1, 0.5372549, 1,
-0.1880393, -1.727623, -3.170467, 0, 1, 0.5450981, 1,
-0.1870755, 0.5547581, -0.872052, 0, 1, 0.5490196, 1,
-0.180866, 2.626658, -0.69332, 0, 1, 0.5568628, 1,
-0.1769298, -0.2850722, -3.000322, 0, 1, 0.5607843, 1,
-0.1736585, -0.8679403, -3.016707, 0, 1, 0.5686275, 1,
-0.1728445, 0.5074883, -0.5630511, 0, 1, 0.572549, 1,
-0.1721815, 1.00643, -0.9295876, 0, 1, 0.5803922, 1,
-0.1704023, 1.026719, -0.3693305, 0, 1, 0.5843138, 1,
-0.1698363, -0.07979584, -2.129771, 0, 1, 0.5921569, 1,
-0.1687352, -1.024597, -2.516389, 0, 1, 0.5960785, 1,
-0.1652673, 0.45308, 1.386535, 0, 1, 0.6039216, 1,
-0.1651978, 0.8190503, 0.8944381, 0, 1, 0.6117647, 1,
-0.1598409, 0.4043324, -2.057484, 0, 1, 0.6156863, 1,
-0.1595902, -0.5906101, -2.765969, 0, 1, 0.6235294, 1,
-0.1580555, -0.3727899, -3.753083, 0, 1, 0.627451, 1,
-0.1500219, 0.4868915, -0.04183695, 0, 1, 0.6352941, 1,
-0.1496718, -1.547824, -3.651272, 0, 1, 0.6392157, 1,
-0.1495407, 1.45861, 0.8830975, 0, 1, 0.6470588, 1,
-0.1470709, 3.371367, 0.7824332, 0, 1, 0.6509804, 1,
-0.1465893, -0.7623794, -3.075961, 0, 1, 0.6588235, 1,
-0.1399753, 1.112966, 1.509955, 0, 1, 0.6627451, 1,
-0.136194, 1.477513, 1.250626, 0, 1, 0.6705883, 1,
-0.1354672, -0.7861017, -3.510746, 0, 1, 0.6745098, 1,
-0.1305312, -0.7729493, -4.077446, 0, 1, 0.682353, 1,
-0.1287506, 0.989395, 0.8956561, 0, 1, 0.6862745, 1,
-0.1270786, 0.09610807, 0.7328694, 0, 1, 0.6941177, 1,
-0.1261036, -0.1595477, -2.91193, 0, 1, 0.7019608, 1,
-0.1180808, -0.3834111, -2.560267, 0, 1, 0.7058824, 1,
-0.117606, 0.1215998, -0.6445512, 0, 1, 0.7137255, 1,
-0.116844, 0.252286, 0.6203431, 0, 1, 0.7176471, 1,
-0.1154679, 0.283887, -1.238686, 0, 1, 0.7254902, 1,
-0.1121482, 0.7378594, 0.8799011, 0, 1, 0.7294118, 1,
-0.1078964, -2.056756, -4.016444, 0, 1, 0.7372549, 1,
-0.1067328, -0.178835, -3.363189, 0, 1, 0.7411765, 1,
-0.1052383, -0.1350318, -1.006328, 0, 1, 0.7490196, 1,
-0.09337336, 1.818772, 0.1995103, 0, 1, 0.7529412, 1,
-0.09085666, -0.192837, -2.881476, 0, 1, 0.7607843, 1,
-0.08967832, 0.9198319, -0.563527, 0, 1, 0.7647059, 1,
-0.08954509, -0.6354451, -1.842414, 0, 1, 0.772549, 1,
-0.08666537, -0.2867426, -2.926281, 0, 1, 0.7764706, 1,
-0.08579934, 0.8830589, 0.3579808, 0, 1, 0.7843137, 1,
-0.08579913, 1.221305, -1.23453, 0, 1, 0.7882353, 1,
-0.08533417, 1.151957, -1.7702, 0, 1, 0.7960784, 1,
-0.07888573, 0.7109302, -0.08095502, 0, 1, 0.8039216, 1,
-0.07530271, -0.8213864, -4.233857, 0, 1, 0.8078431, 1,
-0.07134087, -1.124229, -2.733814, 0, 1, 0.8156863, 1,
-0.0712977, -0.806521, -3.496076, 0, 1, 0.8196079, 1,
-0.07085674, 0.287975, 0.3454067, 0, 1, 0.827451, 1,
-0.06344713, -0.6100946, -2.995978, 0, 1, 0.8313726, 1,
-0.06313929, 0.71593, -1.840695, 0, 1, 0.8392157, 1,
-0.05865351, -1.904552, -2.477235, 0, 1, 0.8431373, 1,
-0.05617852, 0.01445424, -0.2778934, 0, 1, 0.8509804, 1,
-0.05471196, 0.6042643, -0.4741189, 0, 1, 0.854902, 1,
-0.05464187, -0.5753423, -1.828138, 0, 1, 0.8627451, 1,
-0.05372906, 0.4912566, -0.975811, 0, 1, 0.8666667, 1,
-0.05219452, 1.372738, 0.138611, 0, 1, 0.8745098, 1,
-0.0504067, -0.8182662, -2.564799, 0, 1, 0.8784314, 1,
-0.04617942, 0.4038174, 1.303493, 0, 1, 0.8862745, 1,
-0.04371561, -1.123756, -3.04075, 0, 1, 0.8901961, 1,
-0.0364783, -0.7373514, -3.886206, 0, 1, 0.8980392, 1,
-0.0336738, 0.08238011, -1.734898, 0, 1, 0.9058824, 1,
-0.03326813, 0.219746, -0.8921676, 0, 1, 0.9098039, 1,
-0.03324294, -0.8604087, -3.713556, 0, 1, 0.9176471, 1,
-0.03050444, -1.080497, -3.43888, 0, 1, 0.9215686, 1,
-0.0287809, -0.8657042, -2.180494, 0, 1, 0.9294118, 1,
-0.02526125, -1.173813, -3.310873, 0, 1, 0.9333333, 1,
-0.02410546, 0.3287975, -2.831273, 0, 1, 0.9411765, 1,
-0.01867059, -0.1368148, -3.24934, 0, 1, 0.945098, 1,
-0.01746796, 0.5939248, 0.0275123, 0, 1, 0.9529412, 1,
-0.01572011, -0.9581915, -3.169971, 0, 1, 0.9568627, 1,
-0.01551058, 0.3548611, -0.9411848, 0, 1, 0.9647059, 1,
-0.0125599, -0.5804681, -2.392535, 0, 1, 0.9686275, 1,
-0.01242576, -0.1402342, -4.567528, 0, 1, 0.9764706, 1,
-0.008700015, -0.8306573, -2.917622, 0, 1, 0.9803922, 1,
3.127829e-05, 0.788586, -1.026204, 0, 1, 0.9882353, 1,
0.002525865, -0.5047237, 3.140536, 0, 1, 0.9921569, 1,
0.005343944, 0.3438315, -1.353681, 0, 1, 1, 1,
0.01984409, -1.237309, 1.335945, 0, 0.9921569, 1, 1,
0.02142745, 1.012972, 0.01989102, 0, 0.9882353, 1, 1,
0.02164429, -0.2174313, 2.292783, 0, 0.9803922, 1, 1,
0.02224961, -0.1486105, 2.371546, 0, 0.9764706, 1, 1,
0.0238569, -0.3153116, 3.775126, 0, 0.9686275, 1, 1,
0.02796877, -0.2097079, 3.191545, 0, 0.9647059, 1, 1,
0.03099043, 1.167838, 0.2776369, 0, 0.9568627, 1, 1,
0.03207421, 2.126099, -1.432456, 0, 0.9529412, 1, 1,
0.03771585, -0.2228727, 3.506798, 0, 0.945098, 1, 1,
0.03871601, -0.328225, 4.191377, 0, 0.9411765, 1, 1,
0.0433569, 0.07367067, 0.5907947, 0, 0.9333333, 1, 1,
0.04409266, 0.09865365, -0.333611, 0, 0.9294118, 1, 1,
0.04673384, 0.03041109, 0.2756169, 0, 0.9215686, 1, 1,
0.04726029, 1.741683, 2.013064, 0, 0.9176471, 1, 1,
0.0473565, 0.08358279, 1.916234, 0, 0.9098039, 1, 1,
0.05532611, -0.727856, 0.6860203, 0, 0.9058824, 1, 1,
0.0578849, 1.150277, -0.00312399, 0, 0.8980392, 1, 1,
0.06250808, 0.3793589, -0.3343129, 0, 0.8901961, 1, 1,
0.06603743, -0.9722867, 2.712881, 0, 0.8862745, 1, 1,
0.06861097, -1.139485, 4.649798, 0, 0.8784314, 1, 1,
0.07027562, 0.3510371, -0.3012486, 0, 0.8745098, 1, 1,
0.07369252, -0.558812, 2.631067, 0, 0.8666667, 1, 1,
0.07390224, 1.604408, 0.6491725, 0, 0.8627451, 1, 1,
0.07766675, -0.4086486, 3.519521, 0, 0.854902, 1, 1,
0.07781551, -1.057054, 3.721024, 0, 0.8509804, 1, 1,
0.07963127, -1.091558, 5.226809, 0, 0.8431373, 1, 1,
0.08070809, 1.756491, 0.999761, 0, 0.8392157, 1, 1,
0.08316294, 0.3118244, 2.01461, 0, 0.8313726, 1, 1,
0.08375275, -0.2972655, 2.389436, 0, 0.827451, 1, 1,
0.0862596, -1.421366, 4.974479, 0, 0.8196079, 1, 1,
0.08631738, 1.929566, -0.8880825, 0, 0.8156863, 1, 1,
0.09426349, 1.187155, 1.304258, 0, 0.8078431, 1, 1,
0.09451246, -0.8384829, 2.753301, 0, 0.8039216, 1, 1,
0.09688168, -0.06021633, 1.248073, 0, 0.7960784, 1, 1,
0.09830469, -2.152911, 3.545038, 0, 0.7882353, 1, 1,
0.1029675, -1.284583, 1.927734, 0, 0.7843137, 1, 1,
0.1098855, 1.262761, 0.06881524, 0, 0.7764706, 1, 1,
0.1148311, 0.9869779, -1.574034, 0, 0.772549, 1, 1,
0.1170966, 0.7445848, -0.7903957, 0, 0.7647059, 1, 1,
0.1201868, 0.8354187, -1.13017, 0, 0.7607843, 1, 1,
0.1217053, 0.08520029, -0.8745906, 0, 0.7529412, 1, 1,
0.1224888, 0.5403036, 0.02286192, 0, 0.7490196, 1, 1,
0.1269567, 0.54994, -1.679073, 0, 0.7411765, 1, 1,
0.1279629, -1.722362, 1.514609, 0, 0.7372549, 1, 1,
0.1331294, -0.2337942, 3.212593, 0, 0.7294118, 1, 1,
0.1358209, -0.5871914, 2.931263, 0, 0.7254902, 1, 1,
0.1375177, 1.025064, -0.5614045, 0, 0.7176471, 1, 1,
0.1416694, 0.7941037, 0.07034554, 0, 0.7137255, 1, 1,
0.1426182, 0.1482099, 0.4062443, 0, 0.7058824, 1, 1,
0.147153, -1.485447, 4.337061, 0, 0.6980392, 1, 1,
0.1475296, -0.06229731, 2.223219, 0, 0.6941177, 1, 1,
0.147893, 0.9822664, 0.7502431, 0, 0.6862745, 1, 1,
0.1486731, 0.5845895, 1.130074, 0, 0.682353, 1, 1,
0.1488917, -0.3375688, 2.926284, 0, 0.6745098, 1, 1,
0.1504441, 0.06151008, 1.563969, 0, 0.6705883, 1, 1,
0.1611345, 0.3021974, -0.9209396, 0, 0.6627451, 1, 1,
0.1625937, -0.7342108, 4.153183, 0, 0.6588235, 1, 1,
0.164208, 0.4734439, 1.624962, 0, 0.6509804, 1, 1,
0.1660623, -0.5565395, 4.525631, 0, 0.6470588, 1, 1,
0.1668849, 0.5838174, -0.2379573, 0, 0.6392157, 1, 1,
0.1674821, 0.07736755, 2.105654, 0, 0.6352941, 1, 1,
0.1698041, -0.9957626, 2.261644, 0, 0.627451, 1, 1,
0.1721486, -0.4398966, 2.888681, 0, 0.6235294, 1, 1,
0.1727282, -0.9915128, 2.223851, 0, 0.6156863, 1, 1,
0.1778859, 0.6226031, 0.01506951, 0, 0.6117647, 1, 1,
0.1790951, -0.2175313, 1.891217, 0, 0.6039216, 1, 1,
0.1818408, 0.8746209, 0.04051003, 0, 0.5960785, 1, 1,
0.1828165, -0.9989612, 2.743347, 0, 0.5921569, 1, 1,
0.1842466, -0.7864579, 3.009825, 0, 0.5843138, 1, 1,
0.1861814, -0.1358756, 2.404398, 0, 0.5803922, 1, 1,
0.1869148, 0.2926596, 1.217266, 0, 0.572549, 1, 1,
0.1876031, 0.8366865, 0.6760573, 0, 0.5686275, 1, 1,
0.1876752, -1.108982, 4.085432, 0, 0.5607843, 1, 1,
0.1879311, 0.8752061, -0.01820272, 0, 0.5568628, 1, 1,
0.192044, 1.256664, 0.5790626, 0, 0.5490196, 1, 1,
0.1974895, -2.32991, 3.551056, 0, 0.5450981, 1, 1,
0.1982802, -0.7048603, 3.006819, 0, 0.5372549, 1, 1,
0.2001645, 0.5108739, -0.03334383, 0, 0.5333334, 1, 1,
0.2025655, -0.9302474, 2.338087, 0, 0.5254902, 1, 1,
0.2062756, 0.2676127, 0.06941465, 0, 0.5215687, 1, 1,
0.20752, -1.582453, 2.55039, 0, 0.5137255, 1, 1,
0.2084574, -2.007359, 3.009832, 0, 0.509804, 1, 1,
0.2116508, 1.488146, 0.0576928, 0, 0.5019608, 1, 1,
0.2134875, 1.797937, -0.1061013, 0, 0.4941176, 1, 1,
0.2151298, -0.557075, 2.521602, 0, 0.4901961, 1, 1,
0.2189249, -0.6084572, 3.410496, 0, 0.4823529, 1, 1,
0.2190582, 1.168071, 1.755921, 0, 0.4784314, 1, 1,
0.2252798, -0.6289931, 3.80796, 0, 0.4705882, 1, 1,
0.2257091, -2.527833, 2.538321, 0, 0.4666667, 1, 1,
0.229822, -0.2879529, 1.500381, 0, 0.4588235, 1, 1,
0.2326914, -0.3987316, 3.154879, 0, 0.454902, 1, 1,
0.2347781, -0.710081, 1.953622, 0, 0.4470588, 1, 1,
0.2366183, 0.07243655, 0.9472203, 0, 0.4431373, 1, 1,
0.2387299, 0.6588537, -1.019517, 0, 0.4352941, 1, 1,
0.2390817, -0.442338, 2.384212, 0, 0.4313726, 1, 1,
0.2422389, 0.9521259, 0.286994, 0, 0.4235294, 1, 1,
0.2423197, 0.2780263, 1.668189, 0, 0.4196078, 1, 1,
0.2426762, -1.863134, 3.728343, 0, 0.4117647, 1, 1,
0.2437494, -0.7392908, 1.500494, 0, 0.4078431, 1, 1,
0.2438049, 0.5488524, 1.086146, 0, 0.4, 1, 1,
0.2440874, -1.358126, 2.496504, 0, 0.3921569, 1, 1,
0.2477834, -0.6863891, 1.951237, 0, 0.3882353, 1, 1,
0.2486125, -0.0966301, 3.197064, 0, 0.3803922, 1, 1,
0.2508154, 0.246863, 1.523957, 0, 0.3764706, 1, 1,
0.2509196, 1.117151, 0.2024043, 0, 0.3686275, 1, 1,
0.2519572, 1.090619, 0.412534, 0, 0.3647059, 1, 1,
0.2576146, -1.098768, 2.017683, 0, 0.3568628, 1, 1,
0.2615076, 0.5222453, 1.169154, 0, 0.3529412, 1, 1,
0.2641612, 0.8651754, -0.8266321, 0, 0.345098, 1, 1,
0.2649488, -0.1454877, 3.22363, 0, 0.3411765, 1, 1,
0.2711322, -0.7931976, 4.845499, 0, 0.3333333, 1, 1,
0.2712142, -1.895847, 3.222911, 0, 0.3294118, 1, 1,
0.2746162, 1.612629, 1.247578, 0, 0.3215686, 1, 1,
0.2751718, -0.6836435, 2.160474, 0, 0.3176471, 1, 1,
0.2752601, 0.8134038, 1.979846, 0, 0.3098039, 1, 1,
0.2862149, -1.415854, 4.100399, 0, 0.3058824, 1, 1,
0.2863137, 0.2664216, 0.852722, 0, 0.2980392, 1, 1,
0.2864577, -0.1825034, 2.060568, 0, 0.2901961, 1, 1,
0.2871833, 1.257659, 0.2372187, 0, 0.2862745, 1, 1,
0.2877175, -0.3435838, 2.786118, 0, 0.2784314, 1, 1,
0.2899194, 0.08509129, 1.811582, 0, 0.2745098, 1, 1,
0.2906618, -0.1454552, 2.045156, 0, 0.2666667, 1, 1,
0.291714, 0.02197612, 1.240378, 0, 0.2627451, 1, 1,
0.2959679, -0.3093762, 3.800035, 0, 0.254902, 1, 1,
0.2972853, -0.2618077, 2.257665, 0, 0.2509804, 1, 1,
0.3027221, -0.6503179, 1.695119, 0, 0.2431373, 1, 1,
0.3065559, 1.217903, -1.569875, 0, 0.2392157, 1, 1,
0.3079925, 1.15667, 0.2316722, 0, 0.2313726, 1, 1,
0.3100084, 0.01927201, 0.3370163, 0, 0.227451, 1, 1,
0.3117093, 0.579645, 0.3857048, 0, 0.2196078, 1, 1,
0.3118117, -0.008151388, 3.883713, 0, 0.2156863, 1, 1,
0.3167024, -0.373272, 2.364416, 0, 0.2078431, 1, 1,
0.3193932, -0.3220227, 2.609645, 0, 0.2039216, 1, 1,
0.323148, 0.8086237, 1.426888, 0, 0.1960784, 1, 1,
0.3237843, -0.2970275, 3.534714, 0, 0.1882353, 1, 1,
0.3243458, 0.1883072, 1.773562, 0, 0.1843137, 1, 1,
0.3269161, 0.4509078, 0.2476395, 0, 0.1764706, 1, 1,
0.3276951, 0.5920582, 0.8092529, 0, 0.172549, 1, 1,
0.3306319, -0.9067279, 1.502594, 0, 0.1647059, 1, 1,
0.3316262, -0.6053879, 2.962571, 0, 0.1607843, 1, 1,
0.3333253, 0.8325257, 0.3051508, 0, 0.1529412, 1, 1,
0.3354739, 0.4521475, 0.9772734, 0, 0.1490196, 1, 1,
0.3409826, 1.072855, -0.1533667, 0, 0.1411765, 1, 1,
0.3420826, 0.6374891, 0.9926389, 0, 0.1372549, 1, 1,
0.3510626, 0.3903608, 2.264608, 0, 0.1294118, 1, 1,
0.3522421, -1.625972, 3.137317, 0, 0.1254902, 1, 1,
0.3523254, -1.150947, 1.69096, 0, 0.1176471, 1, 1,
0.3523718, 1.02238, -0.4082036, 0, 0.1137255, 1, 1,
0.3528687, -0.3361167, 3.234969, 0, 0.1058824, 1, 1,
0.3612821, -0.9920205, 1.786185, 0, 0.09803922, 1, 1,
0.3616033, 1.097787, 0.1200141, 0, 0.09411765, 1, 1,
0.364026, 0.5129182, 0.6252996, 0, 0.08627451, 1, 1,
0.364501, -0.3678068, 1.344188, 0, 0.08235294, 1, 1,
0.3772902, -1.872798, 1.916024, 0, 0.07450981, 1, 1,
0.3790505, -0.678568, 3.374093, 0, 0.07058824, 1, 1,
0.3811339, 0.8577951, 0.7079023, 0, 0.0627451, 1, 1,
0.3823156, 0.7053763, 1.284781, 0, 0.05882353, 1, 1,
0.3829841, 0.498019, 1.316944, 0, 0.05098039, 1, 1,
0.3836364, -0.229691, 4.713726, 0, 0.04705882, 1, 1,
0.3851611, 0.1844465, 0.8658046, 0, 0.03921569, 1, 1,
0.3910136, 1.878857, 0.8698856, 0, 0.03529412, 1, 1,
0.3960406, 1.827188, 1.240156, 0, 0.02745098, 1, 1,
0.3981966, 1.064635, -0.8428283, 0, 0.02352941, 1, 1,
0.399661, -0.4656338, 2.423123, 0, 0.01568628, 1, 1,
0.4011393, -0.2432901, 2.950121, 0, 0.01176471, 1, 1,
0.4021668, 0.4052149, 0.8956751, 0, 0.003921569, 1, 1,
0.4038596, 0.02683547, 1.716242, 0.003921569, 0, 1, 1,
0.4063021, 0.6990461, 1.363105, 0.007843138, 0, 1, 1,
0.4068075, -0.3142673, 0.2275745, 0.01568628, 0, 1, 1,
0.409162, 0.3095627, 1.385398, 0.01960784, 0, 1, 1,
0.4116326, 1.430744, -1.203794, 0.02745098, 0, 1, 1,
0.4116822, 0.0495701, 0.3512329, 0.03137255, 0, 1, 1,
0.4129825, 1.276018, 1.221744, 0.03921569, 0, 1, 1,
0.4166691, 1.609957, 1.998579, 0.04313726, 0, 1, 1,
0.4199578, 0.1084341, 0.9948802, 0.05098039, 0, 1, 1,
0.4217855, 0.2231305, 0.7711105, 0.05490196, 0, 1, 1,
0.4232628, 1.736505, 1.902749, 0.0627451, 0, 1, 1,
0.4241424, 1.122064, 1.270232, 0.06666667, 0, 1, 1,
0.4253753, 0.1033191, 0.2720432, 0.07450981, 0, 1, 1,
0.429776, 0.0141879, 2.521008, 0.07843138, 0, 1, 1,
0.4298107, -2.213449, 2.274744, 0.08627451, 0, 1, 1,
0.433302, 0.8035327, -1.074405, 0.09019608, 0, 1, 1,
0.4386918, 1.039737, 0.2838885, 0.09803922, 0, 1, 1,
0.4465228, -1.289462, 2.079154, 0.1058824, 0, 1, 1,
0.4469438, -0.3121213, 1.660815, 0.1098039, 0, 1, 1,
0.4487739, -0.2001837, 0.782917, 0.1176471, 0, 1, 1,
0.4499573, 0.777107, 0.2335248, 0.1215686, 0, 1, 1,
0.4499684, 0.3253379, 3.663026, 0.1294118, 0, 1, 1,
0.4507957, -0.4805232, 1.86338, 0.1333333, 0, 1, 1,
0.4520148, -0.1665396, 0.6121365, 0.1411765, 0, 1, 1,
0.4570111, -0.1660566, 3.02267, 0.145098, 0, 1, 1,
0.4612716, 0.837776, -0.1812146, 0.1529412, 0, 1, 1,
0.4626813, -0.542073, 2.071542, 0.1568628, 0, 1, 1,
0.4627971, -0.4341709, 1.524811, 0.1647059, 0, 1, 1,
0.4646038, 0.0449852, 2.568006, 0.1686275, 0, 1, 1,
0.4650475, 0.9121224, 0.7275204, 0.1764706, 0, 1, 1,
0.4664191, -0.2528708, 1.695798, 0.1803922, 0, 1, 1,
0.4723461, 0.5132735, -0.9565678, 0.1882353, 0, 1, 1,
0.4796656, -0.615591, 2.412861, 0.1921569, 0, 1, 1,
0.4805924, -0.7813987, 1.313304, 0.2, 0, 1, 1,
0.4848205, -0.9292555, 2.532507, 0.2078431, 0, 1, 1,
0.4885636, -1.277613, 2.821721, 0.2117647, 0, 1, 1,
0.4970536, -0.1900377, 2.097089, 0.2196078, 0, 1, 1,
0.4992251, 0.6024162, 1.39509, 0.2235294, 0, 1, 1,
0.5019398, -1.321526, 1.277743, 0.2313726, 0, 1, 1,
0.507009, -2.146659, 3.556237, 0.2352941, 0, 1, 1,
0.510152, 0.01348504, 1.472714, 0.2431373, 0, 1, 1,
0.5119494, -1.734522, 1.156103, 0.2470588, 0, 1, 1,
0.5155108, -0.9082564, 3.486795, 0.254902, 0, 1, 1,
0.5175023, 1.110839, -0.1966967, 0.2588235, 0, 1, 1,
0.5176988, 0.3684744, 0.9311928, 0.2666667, 0, 1, 1,
0.5228599, 0.8084337, -0.2733484, 0.2705882, 0, 1, 1,
0.5230848, -0.1083126, 1.333703, 0.2784314, 0, 1, 1,
0.524424, 0.765176, 0.875746, 0.282353, 0, 1, 1,
0.5300752, 2.123567, 0.8056152, 0.2901961, 0, 1, 1,
0.5304734, 1.29374, -0.591089, 0.2941177, 0, 1, 1,
0.534189, -0.3614384, 2.670394, 0.3019608, 0, 1, 1,
0.5347537, 0.106879, 0.261613, 0.3098039, 0, 1, 1,
0.5353358, 1.33758, 1.597181, 0.3137255, 0, 1, 1,
0.5360679, 1.637076, 1.330146, 0.3215686, 0, 1, 1,
0.5387013, 1.257874, -0.7157974, 0.3254902, 0, 1, 1,
0.5393959, 1.005939, 0.7613499, 0.3333333, 0, 1, 1,
0.5402238, -0.4873908, 2.872122, 0.3372549, 0, 1, 1,
0.5426742, -1.334624, 2.57167, 0.345098, 0, 1, 1,
0.5572719, -1.253458, 2.406941, 0.3490196, 0, 1, 1,
0.5590923, -1.386691, 3.199659, 0.3568628, 0, 1, 1,
0.5638411, -0.6789142, 1.007569, 0.3607843, 0, 1, 1,
0.5697755, -0.9190919, 3.435904, 0.3686275, 0, 1, 1,
0.5707247, 0.5556549, 0.3729433, 0.372549, 0, 1, 1,
0.572512, 0.4855319, 0.4973997, 0.3803922, 0, 1, 1,
0.5783944, -2.143481, 3.087325, 0.3843137, 0, 1, 1,
0.5795461, -1.637525, 2.998424, 0.3921569, 0, 1, 1,
0.5814505, 0.04034482, 0.8041086, 0.3960784, 0, 1, 1,
0.582604, 0.6000234, -0.6430064, 0.4039216, 0, 1, 1,
0.5874488, -1.077786, 4.251783, 0.4117647, 0, 1, 1,
0.5878225, 1.647963, -1.214572, 0.4156863, 0, 1, 1,
0.5893407, 0.306091, 0.07409563, 0.4235294, 0, 1, 1,
0.5935812, -1.108584, 2.74579, 0.427451, 0, 1, 1,
0.595542, 0.09725396, 2.473008, 0.4352941, 0, 1, 1,
0.5957487, 0.3488644, 0.5849583, 0.4392157, 0, 1, 1,
0.6000113, 0.1009243, 0.2836271, 0.4470588, 0, 1, 1,
0.6039814, -0.06085423, 0.8696784, 0.4509804, 0, 1, 1,
0.6043432, -0.7849051, 2.010563, 0.4588235, 0, 1, 1,
0.6053792, -0.3290733, 3.122894, 0.4627451, 0, 1, 1,
0.6079344, -1.793934, 0.7944338, 0.4705882, 0, 1, 1,
0.6086606, 1.749735, 0.752286, 0.4745098, 0, 1, 1,
0.6102978, -0.08518799, 1.577104, 0.4823529, 0, 1, 1,
0.6156984, 1.36279, 0.760015, 0.4862745, 0, 1, 1,
0.6201802, -0.3996013, 2.194236, 0.4941176, 0, 1, 1,
0.6229941, 1.168787, -1.552242, 0.5019608, 0, 1, 1,
0.6312584, 0.2808767, 0.1282749, 0.5058824, 0, 1, 1,
0.6389929, 0.6738636, 1.717868, 0.5137255, 0, 1, 1,
0.6392407, -1.684036, 2.683062, 0.5176471, 0, 1, 1,
0.6416929, 0.1792809, 2.472945, 0.5254902, 0, 1, 1,
0.6427213, -0.2643229, -0.1021711, 0.5294118, 0, 1, 1,
0.6433105, 1.302427, 0.3096923, 0.5372549, 0, 1, 1,
0.644236, 2.119372, 0.5614346, 0.5411765, 0, 1, 1,
0.6470047, -1.560548, 1.810918, 0.5490196, 0, 1, 1,
0.6488524, 1.750029, 0.0488215, 0.5529412, 0, 1, 1,
0.6499403, -0.4981303, 1.479379, 0.5607843, 0, 1, 1,
0.6553075, -0.2005692, 1.449559, 0.5647059, 0, 1, 1,
0.6572952, -1.010539, 3.742067, 0.572549, 0, 1, 1,
0.658742, -0.4925111, 3.372838, 0.5764706, 0, 1, 1,
0.6588963, -0.5920154, 1.966192, 0.5843138, 0, 1, 1,
0.6590746, 0.508648, 2.408233, 0.5882353, 0, 1, 1,
0.6682286, 0.2289477, 1.610188, 0.5960785, 0, 1, 1,
0.6725388, -1.043925, 2.836805, 0.6039216, 0, 1, 1,
0.6770143, -2.497568, 1.859601, 0.6078432, 0, 1, 1,
0.6815172, -1.214474, 2.190264, 0.6156863, 0, 1, 1,
0.6834119, -1.24633, 2.601118, 0.6196079, 0, 1, 1,
0.6837429, 0.5286492, 0.04468609, 0.627451, 0, 1, 1,
0.6839538, -2.305769, 3.778102, 0.6313726, 0, 1, 1,
0.687193, -0.5125467, 4.614264, 0.6392157, 0, 1, 1,
0.6910196, -0.8672113, 2.762042, 0.6431373, 0, 1, 1,
0.6951305, -1.089941, 2.790032, 0.6509804, 0, 1, 1,
0.6988472, -0.1993324, 3.135407, 0.654902, 0, 1, 1,
0.7000333, 0.450606, -0.2917103, 0.6627451, 0, 1, 1,
0.7096806, 0.5891126, 0.591206, 0.6666667, 0, 1, 1,
0.7196594, 0.1101665, -0.1113896, 0.6745098, 0, 1, 1,
0.7221787, -0.2844259, 1.015148, 0.6784314, 0, 1, 1,
0.7231505, 0.5022199, -0.4459311, 0.6862745, 0, 1, 1,
0.7266263, -1.605844, 1.870723, 0.6901961, 0, 1, 1,
0.7319388, -0.9772041, 1.808138, 0.6980392, 0, 1, 1,
0.7328776, -0.3641314, 1.145316, 0.7058824, 0, 1, 1,
0.7399831, -0.5658175, 1.753884, 0.7098039, 0, 1, 1,
0.7476307, 0.896746, 2.429362, 0.7176471, 0, 1, 1,
0.7508685, 0.4390498, 0.343318, 0.7215686, 0, 1, 1,
0.7540344, 0.6106682, 0.9540047, 0.7294118, 0, 1, 1,
0.7618674, -0.2003588, 1.177455, 0.7333333, 0, 1, 1,
0.7622151, 0.1444512, 1.45052, 0.7411765, 0, 1, 1,
0.7672966, -1.445908, 1.878296, 0.7450981, 0, 1, 1,
0.7689148, 1.02446, 0.6688646, 0.7529412, 0, 1, 1,
0.7788012, -0.9939587, 3.12784, 0.7568628, 0, 1, 1,
0.7789083, 1.020824, -0.3353273, 0.7647059, 0, 1, 1,
0.7843304, -0.1316934, 1.727215, 0.7686275, 0, 1, 1,
0.7848442, 0.7186438, 1.305064, 0.7764706, 0, 1, 1,
0.7858874, -1.071278, 1.234931, 0.7803922, 0, 1, 1,
0.7879548, 0.9223862, -0.1539943, 0.7882353, 0, 1, 1,
0.7887878, 0.8436062, 0.1385662, 0.7921569, 0, 1, 1,
0.7891445, -0.1999745, 0.8094272, 0.8, 0, 1, 1,
0.7892368, -0.0750063, 3.150985, 0.8078431, 0, 1, 1,
0.7936449, -0.1868725, 2.907825, 0.8117647, 0, 1, 1,
0.8016788, 0.1330817, 2.551909, 0.8196079, 0, 1, 1,
0.8019273, -0.9610256, 1.584216, 0.8235294, 0, 1, 1,
0.8023011, 0.252148, 0.3925222, 0.8313726, 0, 1, 1,
0.8059875, 1.507596, 1.946836, 0.8352941, 0, 1, 1,
0.8060391, -0.3522489, 0.5568743, 0.8431373, 0, 1, 1,
0.8082226, 0.09639734, 0.1591688, 0.8470588, 0, 1, 1,
0.808867, -0.8217105, 2.241838, 0.854902, 0, 1, 1,
0.8141059, 1.173976, 0.7022179, 0.8588235, 0, 1, 1,
0.8143886, -1.457155, 1.932484, 0.8666667, 0, 1, 1,
0.8183779, 0.4801357, 1.153462, 0.8705882, 0, 1, 1,
0.8184694, -0.5703421, -1.184469, 0.8784314, 0, 1, 1,
0.8205975, -0.8903386, 1.681428, 0.8823529, 0, 1, 1,
0.8209842, -1.048712, 1.661046, 0.8901961, 0, 1, 1,
0.8265848, -0.01645512, 1.858617, 0.8941177, 0, 1, 1,
0.8308141, -0.3616759, 0.6670442, 0.9019608, 0, 1, 1,
0.8413182, -0.9884017, -0.2178477, 0.9098039, 0, 1, 1,
0.8442773, 0.4535089, -0.07877075, 0.9137255, 0, 1, 1,
0.8521606, 0.135956, 2.68974, 0.9215686, 0, 1, 1,
0.8532171, -0.3820088, 0.5816551, 0.9254902, 0, 1, 1,
0.8590036, 0.0399754, 0.528895, 0.9333333, 0, 1, 1,
0.8597786, -0.2613052, 0.8757325, 0.9372549, 0, 1, 1,
0.8644259, -0.7501273, 1.235258, 0.945098, 0, 1, 1,
0.8686411, -2.350313, 2.645681, 0.9490196, 0, 1, 1,
0.8696557, 1.328032, -1.084024, 0.9568627, 0, 1, 1,
0.8729864, -0.7459475, 2.8212, 0.9607843, 0, 1, 1,
0.8854126, 1.162996, -0.3825088, 0.9686275, 0, 1, 1,
0.8858632, -1.368455, 1.2259, 0.972549, 0, 1, 1,
0.8863686, -1.203611, 1.676368, 0.9803922, 0, 1, 1,
0.8929526, 1.612491, 1.500224, 0.9843137, 0, 1, 1,
0.8951855, -0.3511489, 1.364559, 0.9921569, 0, 1, 1,
0.9077531, 0.480712, -0.4096443, 0.9960784, 0, 1, 1,
0.9120547, 0.05373593, 2.706318, 1, 0, 0.9960784, 1,
0.9121388, -0.949537, 3.157815, 1, 0, 0.9882353, 1,
0.9136884, 0.2654729, 1.726239, 1, 0, 0.9843137, 1,
0.9216553, -0.5828801, 1.302566, 1, 0, 0.9764706, 1,
0.9240243, -1.353129, 2.637797, 1, 0, 0.972549, 1,
0.9254708, -0.7472169, 1.939382, 1, 0, 0.9647059, 1,
0.9264312, -0.782878, 1.591776, 1, 0, 0.9607843, 1,
0.9331793, 1.887342, -0.5366957, 1, 0, 0.9529412, 1,
0.9332621, 1.12124, 1.2658, 1, 0, 0.9490196, 1,
0.9506661, 1.110484, 0.6659142, 1, 0, 0.9411765, 1,
0.953751, 0.191672, 3.976975, 1, 0, 0.9372549, 1,
0.9542686, 0.7498997, 2.418954, 1, 0, 0.9294118, 1,
0.9555712, 0.2657375, 1.573624, 1, 0, 0.9254902, 1,
0.9623051, 1.445228, 0.4666782, 1, 0, 0.9176471, 1,
0.9641071, -0.3270232, 1.633441, 1, 0, 0.9137255, 1,
0.9750088, -0.5151983, -1.286471, 1, 0, 0.9058824, 1,
0.9806501, -0.7852455, 2.128975, 1, 0, 0.9019608, 1,
0.9806631, 0.4752705, 1.158161, 1, 0, 0.8941177, 1,
0.9854816, -1.383352, 2.70953, 1, 0, 0.8862745, 1,
0.9874098, -1.105196, 1.518404, 1, 0, 0.8823529, 1,
0.9899657, 0.1862989, 1.817072, 1, 0, 0.8745098, 1,
0.9924971, -0.2887674, 0.3537316, 1, 0, 0.8705882, 1,
0.9945082, -1.474993, 1.634254, 1, 0, 0.8627451, 1,
0.9969518, 0.4567188, -0.6376411, 1, 0, 0.8588235, 1,
1.005161, 1.983279, -0.5492398, 1, 0, 0.8509804, 1,
1.005535, 0.2602912, -0.1343407, 1, 0, 0.8470588, 1,
1.008879, 0.2235146, 0.9792922, 1, 0, 0.8392157, 1,
1.011943, 0.2673222, -1.053432, 1, 0, 0.8352941, 1,
1.017442, -1.028281, 2.836238, 1, 0, 0.827451, 1,
1.018472, 1.141152, 1.373626, 1, 0, 0.8235294, 1,
1.021678, -1.070081, 3.042256, 1, 0, 0.8156863, 1,
1.025428, 0.5034607, -0.299937, 1, 0, 0.8117647, 1,
1.033364, -1.585011, -0.7471796, 1, 0, 0.8039216, 1,
1.033703, -1.547184, 5.035436, 1, 0, 0.7960784, 1,
1.033911, 0.2567277, 1.849457, 1, 0, 0.7921569, 1,
1.036397, 0.2552869, 2.046977, 1, 0, 0.7843137, 1,
1.047606, 0.5113009, 1.737975, 1, 0, 0.7803922, 1,
1.05248, -2.566537, 2.20436, 1, 0, 0.772549, 1,
1.054733, -1.819631, 1.16054, 1, 0, 0.7686275, 1,
1.059879, 0.3505864, 1.558282, 1, 0, 0.7607843, 1,
1.062492, -1.785257, 4.703928, 1, 0, 0.7568628, 1,
1.067421, -0.5827841, 2.30638, 1, 0, 0.7490196, 1,
1.073075, 0.5014503, 2.715836, 1, 0, 0.7450981, 1,
1.07331, 0.009798128, 2.757388, 1, 0, 0.7372549, 1,
1.074888, 1.242497, 2.151532, 1, 0, 0.7333333, 1,
1.087881, -0.286736, 1.322872, 1, 0, 0.7254902, 1,
1.089249, 1.571276, 1.589334, 1, 0, 0.7215686, 1,
1.094048, 0.9920964, 1.079744, 1, 0, 0.7137255, 1,
1.09464, -0.3037894, 2.331391, 1, 0, 0.7098039, 1,
1.095391, 0.5205966, 2.455424, 1, 0, 0.7019608, 1,
1.095584, -1.546388, 3.493992, 1, 0, 0.6941177, 1,
1.10141, 1.198882, 3.54456, 1, 0, 0.6901961, 1,
1.103053, 1.188912, 0.9242227, 1, 0, 0.682353, 1,
1.103934, -1.030383, 3.28122, 1, 0, 0.6784314, 1,
1.113631, -0.1963703, 1.491229, 1, 0, 0.6705883, 1,
1.123388, 0.1627802, 1.853956, 1, 0, 0.6666667, 1,
1.129046, 1.542801, 2.670445, 1, 0, 0.6588235, 1,
1.137878, -0.6987537, 2.161417, 1, 0, 0.654902, 1,
1.147297, -1.790062, 1.996358, 1, 0, 0.6470588, 1,
1.169018, 1.213249, 1.938798, 1, 0, 0.6431373, 1,
1.176754, 0.2857675, 1.795893, 1, 0, 0.6352941, 1,
1.185798, -0.1628679, 1.175403, 1, 0, 0.6313726, 1,
1.19004, -0.2981555, 1.442538, 1, 0, 0.6235294, 1,
1.190685, -0.05051041, 2.514372, 1, 0, 0.6196079, 1,
1.199529, 0.5523701, 0.9161016, 1, 0, 0.6117647, 1,
1.209217, -0.7856094, 2.365952, 1, 0, 0.6078432, 1,
1.209696, -0.1094404, 1.334831, 1, 0, 0.6, 1,
1.231666, -0.778079, 0.850868, 1, 0, 0.5921569, 1,
1.2324, -0.9278023, 0.7242364, 1, 0, 0.5882353, 1,
1.235664, -3.063332, 2.403019, 1, 0, 0.5803922, 1,
1.243153, -0.1397134, 1.263251, 1, 0, 0.5764706, 1,
1.245852, 0.1464393, 1.849316, 1, 0, 0.5686275, 1,
1.251293, -0.05606996, 2.318813, 1, 0, 0.5647059, 1,
1.25512, -0.1513115, 2.490388, 1, 0, 0.5568628, 1,
1.256519, 0.8854528, 1.081376, 1, 0, 0.5529412, 1,
1.260846, -0.2318848, 2.606706, 1, 0, 0.5450981, 1,
1.261679, -0.7705322, 1.935695, 1, 0, 0.5411765, 1,
1.282582, 1.493797, 0.2646582, 1, 0, 0.5333334, 1,
1.285446, -1.288659, 0.8437828, 1, 0, 0.5294118, 1,
1.289416, -0.5655413, 2.411468, 1, 0, 0.5215687, 1,
1.295723, 0.6672691, 2.033375, 1, 0, 0.5176471, 1,
1.299909, -1.62983, 3.019325, 1, 0, 0.509804, 1,
1.304914, 1.167465, 0.7935618, 1, 0, 0.5058824, 1,
1.310692, 0.6228905, 0.575127, 1, 0, 0.4980392, 1,
1.314076, -0.4742565, 1.324445, 1, 0, 0.4901961, 1,
1.357983, -0.9080909, 2.887301, 1, 0, 0.4862745, 1,
1.362963, -0.7827154, 1.359406, 1, 0, 0.4784314, 1,
1.369986, -0.3975179, 2.062673, 1, 0, 0.4745098, 1,
1.370506, -0.2558783, 3.492375, 1, 0, 0.4666667, 1,
1.391719, 2.154804, 1.033731, 1, 0, 0.4627451, 1,
1.392826, -0.4369846, 1.620535, 1, 0, 0.454902, 1,
1.394266, -0.1178775, 1.519763, 1, 0, 0.4509804, 1,
1.397584, 1.060503, 0.8953779, 1, 0, 0.4431373, 1,
1.401356, 0.435362, 2.71033, 1, 0, 0.4392157, 1,
1.407604, -2.161152, 3.182308, 1, 0, 0.4313726, 1,
1.407712, 1.283611, 0.6246147, 1, 0, 0.427451, 1,
1.41381, 0.4168027, 0.798403, 1, 0, 0.4196078, 1,
1.430143, -0.3485329, 2.717734, 1, 0, 0.4156863, 1,
1.436099, 1.10188, 1.609061, 1, 0, 0.4078431, 1,
1.438715, -0.8053138, 3.328418, 1, 0, 0.4039216, 1,
1.442497, 1.144178, 2.68968, 1, 0, 0.3960784, 1,
1.44553, -1.613963, 3.252845, 1, 0, 0.3882353, 1,
1.457078, -0.6435183, 1.733027, 1, 0, 0.3843137, 1,
1.467776, 0.6268537, 2.530801, 1, 0, 0.3764706, 1,
1.4882, 0.6746571, 0.09362614, 1, 0, 0.372549, 1,
1.492175, 0.208985, 1.643291, 1, 0, 0.3647059, 1,
1.495642, 2.142906, 0.987013, 1, 0, 0.3607843, 1,
1.500739, -0.06476623, 0.9236305, 1, 0, 0.3529412, 1,
1.501562, 0.1948087, 2.085302, 1, 0, 0.3490196, 1,
1.504515, -0.9689956, 1.701091, 1, 0, 0.3411765, 1,
1.507292, -0.1286432, 0.4030408, 1, 0, 0.3372549, 1,
1.537765, -0.6885347, 2.257886, 1, 0, 0.3294118, 1,
1.560839, 1.404607, 0.7665325, 1, 0, 0.3254902, 1,
1.586133, -0.2678685, 1.699271, 1, 0, 0.3176471, 1,
1.601572, -0.6834053, 0.8757468, 1, 0, 0.3137255, 1,
1.610659, -0.1972472, 1.330315, 1, 0, 0.3058824, 1,
1.613758, -0.1451817, 2.477535, 1, 0, 0.2980392, 1,
1.61731, 0.9034066, 2.791479, 1, 0, 0.2941177, 1,
1.635806, -0.7620999, 2.161992, 1, 0, 0.2862745, 1,
1.641707, -0.08617551, 1.942364, 1, 0, 0.282353, 1,
1.655262, 0.3538051, 2.570944, 1, 0, 0.2745098, 1,
1.660377, -0.3805888, 1.666898, 1, 0, 0.2705882, 1,
1.66043, -1.078649, 2.092976, 1, 0, 0.2627451, 1,
1.680702, -1.196186, 1.847653, 1, 0, 0.2588235, 1,
1.685699, 0.1372314, 1.97016, 1, 0, 0.2509804, 1,
1.700518, 0.9435499, 2.105062, 1, 0, 0.2470588, 1,
1.70831, 0.9230627, -0.003392298, 1, 0, 0.2392157, 1,
1.724969, 0.6376551, 0.8388513, 1, 0, 0.2352941, 1,
1.725394, 1.86276, -0.7497715, 1, 0, 0.227451, 1,
1.735132, 0.8254659, 1.65561, 1, 0, 0.2235294, 1,
1.746276, -0.6556553, 1.933967, 1, 0, 0.2156863, 1,
1.751761, -0.1499668, 1.755515, 1, 0, 0.2117647, 1,
1.753545, 0.5965742, 1.199501, 1, 0, 0.2039216, 1,
1.774278, -0.1486444, 0.8890346, 1, 0, 0.1960784, 1,
1.819402, 0.05064163, 3.555568, 1, 0, 0.1921569, 1,
1.821409, 2.069745, -0.1635022, 1, 0, 0.1843137, 1,
1.825696, -0.02309879, 2.149929, 1, 0, 0.1803922, 1,
1.848926, 0.1569171, 0.4463018, 1, 0, 0.172549, 1,
1.888119, -0.3542247, 0.4346991, 1, 0, 0.1686275, 1,
1.978325, 1.775449, -0.285958, 1, 0, 0.1607843, 1,
1.9901, 0.8409538, 1.376684, 1, 0, 0.1568628, 1,
1.992745, -0.107472, 1.772354, 1, 0, 0.1490196, 1,
2.015696, -0.8193972, 0.9636023, 1, 0, 0.145098, 1,
2.028275, -1.400354, 2.863829, 1, 0, 0.1372549, 1,
2.039976, 0.4293647, 0.5595038, 1, 0, 0.1333333, 1,
2.056776, 1.095438, 2.409207, 1, 0, 0.1254902, 1,
2.114959, -0.4464387, 1.863339, 1, 0, 0.1215686, 1,
2.162647, -0.2383714, 3.564312, 1, 0, 0.1137255, 1,
2.180625, -0.867312, 2.011873, 1, 0, 0.1098039, 1,
2.214236, -0.6191099, 2.30292, 1, 0, 0.1019608, 1,
2.241307, 3.270427, -0.21472, 1, 0, 0.09411765, 1,
2.329413, 0.9345965, 2.929412, 1, 0, 0.09019608, 1,
2.347872, 1.391397, 1.720071, 1, 0, 0.08235294, 1,
2.393071, 1.135136, -0.3983044, 1, 0, 0.07843138, 1,
2.397019, 0.786966, 3.284948, 1, 0, 0.07058824, 1,
2.403101, -0.8171709, 2.012843, 1, 0, 0.06666667, 1,
2.405802, -0.4962673, 0.4410833, 1, 0, 0.05882353, 1,
2.432104, -1.129671, 0.3181497, 1, 0, 0.05490196, 1,
2.462124, 0.3141862, 0.9635922, 1, 0, 0.04705882, 1,
2.511451, -0.6925841, 1.471768, 1, 0, 0.04313726, 1,
2.540225, -2.531782, 3.137229, 1, 0, 0.03529412, 1,
2.551168, -0.387502, 2.721979, 1, 0, 0.03137255, 1,
2.572703, 0.4868036, 1.291596, 1, 0, 0.02352941, 1,
2.648638, 0.5400271, 1.841213, 1, 0, 0.01960784, 1,
2.947261, -0.03110457, 1.67986, 1, 0, 0.01176471, 1,
3.117354, -0.634953, 0.9128091, 1, 0, 0.007843138, 1
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
-0.2656784, -4.154013, -7.527081, 0, -0.5, 0.5, 0.5,
-0.2656784, -4.154013, -7.527081, 1, -0.5, 0.5, 0.5,
-0.2656784, -4.154013, -7.527081, 1, 1.5, 0.5, 0.5,
-0.2656784, -4.154013, -7.527081, 0, 1.5, 0.5, 0.5
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
-4.795559, 0.1540176, -7.527081, 0, -0.5, 0.5, 0.5,
-4.795559, 0.1540176, -7.527081, 1, -0.5, 0.5, 0.5,
-4.795559, 0.1540176, -7.527081, 1, 1.5, 0.5, 0.5,
-4.795559, 0.1540176, -7.527081, 0, 1.5, 0.5, 0.5
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
-4.795559, -4.154013, -0.2259014, 0, -0.5, 0.5, 0.5,
-4.795559, -4.154013, -0.2259014, 1, -0.5, 0.5, 0.5,
-4.795559, -4.154013, -0.2259014, 1, 1.5, 0.5, 0.5,
-4.795559, -4.154013, -0.2259014, 0, 1.5, 0.5, 0.5
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
-3, -3.159852, -5.842193,
3, -3.159852, -5.842193,
-3, -3.159852, -5.842193,
-3, -3.325546, -6.123008,
-2, -3.159852, -5.842193,
-2, -3.325546, -6.123008,
-1, -3.159852, -5.842193,
-1, -3.325546, -6.123008,
0, -3.159852, -5.842193,
0, -3.325546, -6.123008,
1, -3.159852, -5.842193,
1, -3.325546, -6.123008,
2, -3.159852, -5.842193,
2, -3.325546, -6.123008,
3, -3.159852, -5.842193,
3, -3.325546, -6.123008
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
-3, -3.656933, -6.684637, 0, -0.5, 0.5, 0.5,
-3, -3.656933, -6.684637, 1, -0.5, 0.5, 0.5,
-3, -3.656933, -6.684637, 1, 1.5, 0.5, 0.5,
-3, -3.656933, -6.684637, 0, 1.5, 0.5, 0.5,
-2, -3.656933, -6.684637, 0, -0.5, 0.5, 0.5,
-2, -3.656933, -6.684637, 1, -0.5, 0.5, 0.5,
-2, -3.656933, -6.684637, 1, 1.5, 0.5, 0.5,
-2, -3.656933, -6.684637, 0, 1.5, 0.5, 0.5,
-1, -3.656933, -6.684637, 0, -0.5, 0.5, 0.5,
-1, -3.656933, -6.684637, 1, -0.5, 0.5, 0.5,
-1, -3.656933, -6.684637, 1, 1.5, 0.5, 0.5,
-1, -3.656933, -6.684637, 0, 1.5, 0.5, 0.5,
0, -3.656933, -6.684637, 0, -0.5, 0.5, 0.5,
0, -3.656933, -6.684637, 1, -0.5, 0.5, 0.5,
0, -3.656933, -6.684637, 1, 1.5, 0.5, 0.5,
0, -3.656933, -6.684637, 0, 1.5, 0.5, 0.5,
1, -3.656933, -6.684637, 0, -0.5, 0.5, 0.5,
1, -3.656933, -6.684637, 1, -0.5, 0.5, 0.5,
1, -3.656933, -6.684637, 1, 1.5, 0.5, 0.5,
1, -3.656933, -6.684637, 0, 1.5, 0.5, 0.5,
2, -3.656933, -6.684637, 0, -0.5, 0.5, 0.5,
2, -3.656933, -6.684637, 1, -0.5, 0.5, 0.5,
2, -3.656933, -6.684637, 1, 1.5, 0.5, 0.5,
2, -3.656933, -6.684637, 0, 1.5, 0.5, 0.5,
3, -3.656933, -6.684637, 0, -0.5, 0.5, 0.5,
3, -3.656933, -6.684637, 1, -0.5, 0.5, 0.5,
3, -3.656933, -6.684637, 1, 1.5, 0.5, 0.5,
3, -3.656933, -6.684637, 0, 1.5, 0.5, 0.5
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
-3.750202, -3, -5.842193,
-3.750202, 3, -5.842193,
-3.750202, -3, -5.842193,
-3.924428, -3, -6.123008,
-3.750202, -2, -5.842193,
-3.924428, -2, -6.123008,
-3.750202, -1, -5.842193,
-3.924428, -1, -6.123008,
-3.750202, 0, -5.842193,
-3.924428, 0, -6.123008,
-3.750202, 1, -5.842193,
-3.924428, 1, -6.123008,
-3.750202, 2, -5.842193,
-3.924428, 2, -6.123008,
-3.750202, 3, -5.842193,
-3.924428, 3, -6.123008
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
-4.272881, -3, -6.684637, 0, -0.5, 0.5, 0.5,
-4.272881, -3, -6.684637, 1, -0.5, 0.5, 0.5,
-4.272881, -3, -6.684637, 1, 1.5, 0.5, 0.5,
-4.272881, -3, -6.684637, 0, 1.5, 0.5, 0.5,
-4.272881, -2, -6.684637, 0, -0.5, 0.5, 0.5,
-4.272881, -2, -6.684637, 1, -0.5, 0.5, 0.5,
-4.272881, -2, -6.684637, 1, 1.5, 0.5, 0.5,
-4.272881, -2, -6.684637, 0, 1.5, 0.5, 0.5,
-4.272881, -1, -6.684637, 0, -0.5, 0.5, 0.5,
-4.272881, -1, -6.684637, 1, -0.5, 0.5, 0.5,
-4.272881, -1, -6.684637, 1, 1.5, 0.5, 0.5,
-4.272881, -1, -6.684637, 0, 1.5, 0.5, 0.5,
-4.272881, 0, -6.684637, 0, -0.5, 0.5, 0.5,
-4.272881, 0, -6.684637, 1, -0.5, 0.5, 0.5,
-4.272881, 0, -6.684637, 1, 1.5, 0.5, 0.5,
-4.272881, 0, -6.684637, 0, 1.5, 0.5, 0.5,
-4.272881, 1, -6.684637, 0, -0.5, 0.5, 0.5,
-4.272881, 1, -6.684637, 1, -0.5, 0.5, 0.5,
-4.272881, 1, -6.684637, 1, 1.5, 0.5, 0.5,
-4.272881, 1, -6.684637, 0, 1.5, 0.5, 0.5,
-4.272881, 2, -6.684637, 0, -0.5, 0.5, 0.5,
-4.272881, 2, -6.684637, 1, -0.5, 0.5, 0.5,
-4.272881, 2, -6.684637, 1, 1.5, 0.5, 0.5,
-4.272881, 2, -6.684637, 0, 1.5, 0.5, 0.5,
-4.272881, 3, -6.684637, 0, -0.5, 0.5, 0.5,
-4.272881, 3, -6.684637, 1, -0.5, 0.5, 0.5,
-4.272881, 3, -6.684637, 1, 1.5, 0.5, 0.5,
-4.272881, 3, -6.684637, 0, 1.5, 0.5, 0.5
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
-3.750202, -3.159852, -4,
-3.750202, -3.159852, 4,
-3.750202, -3.159852, -4,
-3.924428, -3.325546, -4,
-3.750202, -3.159852, -2,
-3.924428, -3.325546, -2,
-3.750202, -3.159852, 0,
-3.924428, -3.325546, 0,
-3.750202, -3.159852, 2,
-3.924428, -3.325546, 2,
-3.750202, -3.159852, 4,
-3.924428, -3.325546, 4
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
-4.272881, -3.656933, -4, 0, -0.5, 0.5, 0.5,
-4.272881, -3.656933, -4, 1, -0.5, 0.5, 0.5,
-4.272881, -3.656933, -4, 1, 1.5, 0.5, 0.5,
-4.272881, -3.656933, -4, 0, 1.5, 0.5, 0.5,
-4.272881, -3.656933, -2, 0, -0.5, 0.5, 0.5,
-4.272881, -3.656933, -2, 1, -0.5, 0.5, 0.5,
-4.272881, -3.656933, -2, 1, 1.5, 0.5, 0.5,
-4.272881, -3.656933, -2, 0, 1.5, 0.5, 0.5,
-4.272881, -3.656933, 0, 0, -0.5, 0.5, 0.5,
-4.272881, -3.656933, 0, 1, -0.5, 0.5, 0.5,
-4.272881, -3.656933, 0, 1, 1.5, 0.5, 0.5,
-4.272881, -3.656933, 0, 0, 1.5, 0.5, 0.5,
-4.272881, -3.656933, 2, 0, -0.5, 0.5, 0.5,
-4.272881, -3.656933, 2, 1, -0.5, 0.5, 0.5,
-4.272881, -3.656933, 2, 1, 1.5, 0.5, 0.5,
-4.272881, -3.656933, 2, 0, 1.5, 0.5, 0.5,
-4.272881, -3.656933, 4, 0, -0.5, 0.5, 0.5,
-4.272881, -3.656933, 4, 1, -0.5, 0.5, 0.5,
-4.272881, -3.656933, 4, 1, 1.5, 0.5, 0.5,
-4.272881, -3.656933, 4, 0, 1.5, 0.5, 0.5
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
-3.750202, -3.159852, -5.842193,
-3.750202, 3.467887, -5.842193,
-3.750202, -3.159852, 5.39039,
-3.750202, 3.467887, 5.39039,
-3.750202, -3.159852, -5.842193,
-3.750202, -3.159852, 5.39039,
-3.750202, 3.467887, -5.842193,
-3.750202, 3.467887, 5.39039,
-3.750202, -3.159852, -5.842193,
3.218845, -3.159852, -5.842193,
-3.750202, -3.159852, 5.39039,
3.218845, -3.159852, 5.39039,
-3.750202, 3.467887, -5.842193,
3.218845, 3.467887, -5.842193,
-3.750202, 3.467887, 5.39039,
3.218845, 3.467887, 5.39039,
3.218845, -3.159852, -5.842193,
3.218845, 3.467887, -5.842193,
3.218845, -3.159852, 5.39039,
3.218845, 3.467887, 5.39039,
3.218845, -3.159852, -5.842193,
3.218845, -3.159852, 5.39039,
3.218845, 3.467887, -5.842193,
3.218845, 3.467887, 5.39039
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
var radius = 7.896154;
var distance = 35.13088;
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
mvMatrix.translate( 0.2656784, -0.1540176, 0.2259014 );
mvMatrix.scale( 1.225056, 1.288143, 0.7600635 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.13088);
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
imidazolidine<-read.table("imidazolidine.xyz")
```

```
## Error in read.table("imidazolidine.xyz"): no lines available in input
```

```r
x<-imidazolidine$V2
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
```

```r
y<-imidazolidine$V3
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
```

```r
z<-imidazolidine$V4
```

```
## Error in eval(expr, envir, enclos): object 'imidazolidine' not found
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
-3.648711, 1.708605, 1.978986, 0, 0, 1, 1, 1,
-2.828639, 0.172977, -2.831123, 1, 0, 0, 1, 1,
-2.625684, 1.161182, -0.2094157, 1, 0, 0, 1, 1,
-2.579144, 2.459475, -0.12775, 1, 0, 0, 1, 1,
-2.504543, 0.02161781, -1.247922, 1, 0, 0, 1, 1,
-2.491738, -1.025874, -1.311499, 1, 0, 0, 1, 1,
-2.477008, -0.6574755, -3.939232, 0, 0, 0, 1, 1,
-2.415731, 0.305461, -1.951623, 0, 0, 0, 1, 1,
-2.389108, -0.7181856, -2.719411, 0, 0, 0, 1, 1,
-2.305287, 0.1906086, -1.74997, 0, 0, 0, 1, 1,
-2.246433, -0.6350201, -1.938266, 0, 0, 0, 1, 1,
-2.236622, 0.2770303, -2.772067, 0, 0, 0, 1, 1,
-2.192276, 0.509925, -0.4720652, 0, 0, 0, 1, 1,
-2.123103, -1.585963, -1.901765, 1, 1, 1, 1, 1,
-2.08923, 0.5573367, 0.4039483, 1, 1, 1, 1, 1,
-2.081002, -1.322254, -0.2486113, 1, 1, 1, 1, 1,
-2.059791, -0.1044649, -0.9670091, 1, 1, 1, 1, 1,
-2.054533, 0.6498362, -2.069896, 1, 1, 1, 1, 1,
-2.017097, 1.825388, 0.1419337, 1, 1, 1, 1, 1,
-2.005485, -0.4350427, -0.8266461, 1, 1, 1, 1, 1,
-1.983854, 1.351229, -2.057296, 1, 1, 1, 1, 1,
-1.929215, 0.5988986, -2.052378, 1, 1, 1, 1, 1,
-1.916036, -1.811873, -4.458543, 1, 1, 1, 1, 1,
-1.914133, 0.09358632, 0.3463134, 1, 1, 1, 1, 1,
-1.901464, 0.100913, -1.239331, 1, 1, 1, 1, 1,
-1.896147, -0.6024277, -1.813978, 1, 1, 1, 1, 1,
-1.882543, 0.5940189, -1.340435, 1, 1, 1, 1, 1,
-1.881445, 0.955489, -2.259207, 1, 1, 1, 1, 1,
-1.880637, -0.5679657, -2.599246, 0, 0, 1, 1, 1,
-1.871882, -1.501411, -2.273867, 1, 0, 0, 1, 1,
-1.855384, -1.33296, -0.2655249, 1, 0, 0, 1, 1,
-1.813046, 1.345735, -1.737775, 1, 0, 0, 1, 1,
-1.800775, 0.2983544, -1.00825, 1, 0, 0, 1, 1,
-1.790699, 0.3812201, -2.345066, 1, 0, 0, 1, 1,
-1.787269, -0.7584825, -1.471959, 0, 0, 0, 1, 1,
-1.757565, 0.2155181, -2.382374, 0, 0, 0, 1, 1,
-1.749659, -1.092473, -2.708712, 0, 0, 0, 1, 1,
-1.741645, 0.8238329, 0.1777399, 0, 0, 0, 1, 1,
-1.725746, 0.5065925, -0.6630841, 0, 0, 0, 1, 1,
-1.722218, 0.8268587, -0.2132788, 0, 0, 0, 1, 1,
-1.719949, 0.5154292, -2.035465, 0, 0, 0, 1, 1,
-1.68252, -0.3176071, -1.259858, 1, 1, 1, 1, 1,
-1.6824, 1.414946, -1.198932, 1, 1, 1, 1, 1,
-1.68196, 0.5798311, -1.725558, 1, 1, 1, 1, 1,
-1.680981, -0.7380008, -2.342326, 1, 1, 1, 1, 1,
-1.666944, -0.2592323, -1.736974, 1, 1, 1, 1, 1,
-1.663143, 1.405135, 0.3321442, 1, 1, 1, 1, 1,
-1.655324, -1.994995, -0.2151132, 1, 1, 1, 1, 1,
-1.617921, -1.1985, -0.1364996, 1, 1, 1, 1, 1,
-1.608539, -0.2759923, -3.34221, 1, 1, 1, 1, 1,
-1.603468, 0.2196932, -1.863328, 1, 1, 1, 1, 1,
-1.598314, 0.439033, -1.107517, 1, 1, 1, 1, 1,
-1.583428, 0.8932785, -1.601399, 1, 1, 1, 1, 1,
-1.560756, 0.7158437, -1.952797, 1, 1, 1, 1, 1,
-1.552933, -0.6429099, -0.6928749, 1, 1, 1, 1, 1,
-1.538526, -0.2869428, -2.798754, 1, 1, 1, 1, 1,
-1.505674, 0.1516623, -0.6375128, 0, 0, 1, 1, 1,
-1.5028, -0.1452774, -3.291019, 1, 0, 0, 1, 1,
-1.50016, 1.380263, -1.289828, 1, 0, 0, 1, 1,
-1.498993, 0.5971975, -0.4709791, 1, 0, 0, 1, 1,
-1.488432, -0.5032288, -1.129311, 1, 0, 0, 1, 1,
-1.485403, 0.866241, -1.66044, 1, 0, 0, 1, 1,
-1.483623, -1.297897, -2.199673, 0, 0, 0, 1, 1,
-1.477157, 0.2420232, -0.7201768, 0, 0, 0, 1, 1,
-1.456074, -0.5333533, -3.406863, 0, 0, 0, 1, 1,
-1.455064, -0.8337691, -1.616808, 0, 0, 0, 1, 1,
-1.454988, -1.503821, -3.011251, 0, 0, 0, 1, 1,
-1.429727, 1.305819, -0.5331222, 0, 0, 0, 1, 1,
-1.425335, -1.401613, -1.822334, 0, 0, 0, 1, 1,
-1.422722, 0.8253094, -0.4795526, 1, 1, 1, 1, 1,
-1.410863, -0.6776239, -1.64414, 1, 1, 1, 1, 1,
-1.409918, 0.9007401, -2.767653, 1, 1, 1, 1, 1,
-1.405889, 1.408074, -1.30533, 1, 1, 1, 1, 1,
-1.394717, 0.5691983, -1.425561, 1, 1, 1, 1, 1,
-1.390081, -0.1816676, -0.9507451, 1, 1, 1, 1, 1,
-1.385418, -1.295832, -4.055363, 1, 1, 1, 1, 1,
-1.382016, 1.574566, -1.740531, 1, 1, 1, 1, 1,
-1.38051, 1.118431, -1.685009, 1, 1, 1, 1, 1,
-1.373491, -0.7424276, -3.433334, 1, 1, 1, 1, 1,
-1.371699, -0.4199321, -2.711056, 1, 1, 1, 1, 1,
-1.36638, -0.2517829, -0.9739122, 1, 1, 1, 1, 1,
-1.362663, 0.1739951, -0.9615234, 1, 1, 1, 1, 1,
-1.361276, -1.421726, -0.9952983, 1, 1, 1, 1, 1,
-1.345892, -0.5450922, -2.925776, 1, 1, 1, 1, 1,
-1.344875, 1.109599, -2.163013, 0, 0, 1, 1, 1,
-1.331, -0.3023083, -1.709689, 1, 0, 0, 1, 1,
-1.330368, 0.4161104, -2.297523, 1, 0, 0, 1, 1,
-1.329103, -1.250605, -2.613333, 1, 0, 0, 1, 1,
-1.325244, -1.043273, -2.671302, 1, 0, 0, 1, 1,
-1.321896, -0.0147652, -0.3661711, 1, 0, 0, 1, 1,
-1.311872, 0.9766749, 1.123935, 0, 0, 0, 1, 1,
-1.309432, -0.08017256, -1.408955, 0, 0, 0, 1, 1,
-1.299458, 0.008605313, -0.850221, 0, 0, 0, 1, 1,
-1.294151, -1.780049, -2.045975, 0, 0, 0, 1, 1,
-1.292232, 1.338176, -2.302545, 0, 0, 0, 1, 1,
-1.290981, 0.1216102, -2.337232, 0, 0, 0, 1, 1,
-1.289649, 2.003239, 0.06180707, 0, 0, 0, 1, 1,
-1.286508, -2.3671, -3.538721, 1, 1, 1, 1, 1,
-1.286417, -1.539142, -2.866845, 1, 1, 1, 1, 1,
-1.285523, -0.4859574, -3.319954, 1, 1, 1, 1, 1,
-1.283862, -0.7298552, -2.088788, 1, 1, 1, 1, 1,
-1.277024, 1.968317, 0.3530654, 1, 1, 1, 1, 1,
-1.276183, -0.3609776, -2.725285, 1, 1, 1, 1, 1,
-1.275622, -1.287018, -0.6915007, 1, 1, 1, 1, 1,
-1.271948, 1.189455, -2.083051, 1, 1, 1, 1, 1,
-1.25789, -0.165278, -1.038004, 1, 1, 1, 1, 1,
-1.250711, 0.7583551, -1.010761, 1, 1, 1, 1, 1,
-1.236185, 0.1741246, -0.5938337, 1, 1, 1, 1, 1,
-1.223224, 1.749937, -0.1884043, 1, 1, 1, 1, 1,
-1.216578, -0.815898, -3.068849, 1, 1, 1, 1, 1,
-1.202829, -0.231114, 0.88806, 1, 1, 1, 1, 1,
-1.194128, 0.6322628, -0.5687901, 1, 1, 1, 1, 1,
-1.193223, 0.5447956, -1.375502, 0, 0, 1, 1, 1,
-1.184688, 2.834027, -0.7694021, 1, 0, 0, 1, 1,
-1.182431, -0.02435237, -0.787619, 1, 0, 0, 1, 1,
-1.181795, -1.781244, 0.3700191, 1, 0, 0, 1, 1,
-1.180134, -1.341969, -1.673997, 1, 0, 0, 1, 1,
-1.171414, -0.8656167, -3.104775, 1, 0, 0, 1, 1,
-1.161319, 0.3809295, -0.7281326, 0, 0, 0, 1, 1,
-1.154172, 0.7835079, -1.939098, 0, 0, 0, 1, 1,
-1.14886, 0.3969171, -1.928509, 0, 0, 0, 1, 1,
-1.144767, 0.05725335, -2.185013, 0, 0, 0, 1, 1,
-1.136648, -0.01316325, -2.167227, 0, 0, 0, 1, 1,
-1.128579, 1.805323, 0.3870255, 0, 0, 0, 1, 1,
-1.123327, 0.4729803, -2.402897, 0, 0, 0, 1, 1,
-1.120779, -1.662076, -1.632697, 1, 1, 1, 1, 1,
-1.11696, 0.4229357, -1.20281, 1, 1, 1, 1, 1,
-1.102668, 0.04236718, -1.203333, 1, 1, 1, 1, 1,
-1.102535, 0.2731764, -2.258299, 1, 1, 1, 1, 1,
-1.10113, -0.5001566, -2.466804, 1, 1, 1, 1, 1,
-1.100172, 0.8864631, -0.1886544, 1, 1, 1, 1, 1,
-1.099725, 0.4412875, -1.280357, 1, 1, 1, 1, 1,
-1.089371, -0.708263, -1.600713, 1, 1, 1, 1, 1,
-1.076799, 1.097443, -0.3765155, 1, 1, 1, 1, 1,
-1.076738, 0.2479414, -3.243673, 1, 1, 1, 1, 1,
-1.075572, -0.5631393, -1.585741, 1, 1, 1, 1, 1,
-1.07264, -0.09760476, -1.757208, 1, 1, 1, 1, 1,
-1.070161, 0.6457402, 1.872391, 1, 1, 1, 1, 1,
-1.059261, 0.553495, -0.8260294, 1, 1, 1, 1, 1,
-1.050318, 1.677992, 0.1721443, 1, 1, 1, 1, 1,
-1.049696, -0.2840336, -3.178076, 0, 0, 1, 1, 1,
-1.04221, -1.930909, -1.567672, 1, 0, 0, 1, 1,
-1.041004, -0.07004717, -1.739954, 1, 0, 0, 1, 1,
-1.038308, 0.565804, -1.13014, 1, 0, 0, 1, 1,
-1.03197, 1.949621, -0.7633279, 1, 0, 0, 1, 1,
-1.031238, -0.7669238, -2.937918, 1, 0, 0, 1, 1,
-1.029143, -0.09920439, -2.505105, 0, 0, 0, 1, 1,
-1.024397, -0.8664871, -3.234118, 0, 0, 0, 1, 1,
-1.023333, 1.144183, -1.229474, 0, 0, 0, 1, 1,
-1.020185, -0.7434684, -1.336594, 0, 0, 0, 1, 1,
-1.018061, 0.829343, -1.493985, 0, 0, 0, 1, 1,
-1.01523, -0.7306088, -1.720209, 0, 0, 0, 1, 1,
-1.015156, 0.7756417, -2.870367, 0, 0, 0, 1, 1,
-1.014278, -0.2249736, -1.907069, 1, 1, 1, 1, 1,
-1.013947, -1.68424, -2.894464, 1, 1, 1, 1, 1,
-1.00199, 0.5401053, -1.047043, 1, 1, 1, 1, 1,
-0.9953766, 1.046408, -1.717388, 1, 1, 1, 1, 1,
-0.9943454, -0.04005858, -1.8317, 1, 1, 1, 1, 1,
-0.992537, 0.2343579, -1.294591, 1, 1, 1, 1, 1,
-0.9867443, 0.6865036, -0.730756, 1, 1, 1, 1, 1,
-0.985393, 0.182042, -1.270678, 1, 1, 1, 1, 1,
-0.984602, -0.6012124, -3.014983, 1, 1, 1, 1, 1,
-0.9832296, 1.539584, -1.232541, 1, 1, 1, 1, 1,
-0.9823852, 0.0265867, -2.265156, 1, 1, 1, 1, 1,
-0.9818694, 0.6486818, -1.011571, 1, 1, 1, 1, 1,
-0.9759062, 0.1701177, -0.1586474, 1, 1, 1, 1, 1,
-0.9755851, -1.381901, -3.29912, 1, 1, 1, 1, 1,
-0.9610608, 0.5355498, -1.368814, 1, 1, 1, 1, 1,
-0.960888, 0.005818058, -2.248544, 0, 0, 1, 1, 1,
-0.9607943, 1.583548, -1.137353, 1, 0, 0, 1, 1,
-0.9564993, 0.002221312, -0.3638144, 1, 0, 0, 1, 1,
-0.9539768, 0.0354604, -0.7600455, 1, 0, 0, 1, 1,
-0.9520169, 0.3052868, -0.3299739, 1, 0, 0, 1, 1,
-0.9513073, -0.7610235, -2.829427, 1, 0, 0, 1, 1,
-0.9437459, 1.521669, 0.0722526, 0, 0, 0, 1, 1,
-0.9429128, 0.02430646, -2.206055, 0, 0, 0, 1, 1,
-0.9419459, 0.2863179, -1.477264, 0, 0, 0, 1, 1,
-0.9400817, 0.4643478, -1.595842, 0, 0, 0, 1, 1,
-0.9355754, 1.227953, -1.782787, 0, 0, 0, 1, 1,
-0.9304676, 1.874217, -1.072962, 0, 0, 0, 1, 1,
-0.930429, -0.7826054, -2.279998, 0, 0, 0, 1, 1,
-0.9268407, -1.120844, -1.748809, 1, 1, 1, 1, 1,
-0.9117773, 2.199346, 1.339183, 1, 1, 1, 1, 1,
-0.9044328, 1.297055, -0.2674884, 1, 1, 1, 1, 1,
-0.8889631, -0.4138246, -0.6402206, 1, 1, 1, 1, 1,
-0.8846508, 0.3553801, -1.612869, 1, 1, 1, 1, 1,
-0.8770525, 1.426149, 0.5339099, 1, 1, 1, 1, 1,
-0.8695048, -0.6358831, -2.622456, 1, 1, 1, 1, 1,
-0.8596615, 1.69602, 1.332431, 1, 1, 1, 1, 1,
-0.8564398, 1.952311, -0.3494673, 1, 1, 1, 1, 1,
-0.8549098, 0.721382, 0.1232563, 1, 1, 1, 1, 1,
-0.8544665, 0.5536361, 0.7890715, 1, 1, 1, 1, 1,
-0.8529996, 0.1477786, -0.7675929, 1, 1, 1, 1, 1,
-0.8522364, -0.05391209, -2.471631, 1, 1, 1, 1, 1,
-0.8515695, 2.163045, -3.293331, 1, 1, 1, 1, 1,
-0.8503042, 0.06544476, -1.622453, 1, 1, 1, 1, 1,
-0.8502728, -0.4692284, -0.6981329, 0, 0, 1, 1, 1,
-0.8469061, 0.0533939, -2.635834, 1, 0, 0, 1, 1,
-0.834511, 0.4956177, -1.140671, 1, 0, 0, 1, 1,
-0.8276632, 1.535624, -0.7339493, 1, 0, 0, 1, 1,
-0.8274891, 0.2857958, -1.268634, 1, 0, 0, 1, 1,
-0.8269806, 0.7415587, -0.3706852, 1, 0, 0, 1, 1,
-0.8252845, 1.454835, -0.09485681, 0, 0, 0, 1, 1,
-0.8252599, 0.6042841, -0.9671319, 0, 0, 0, 1, 1,
-0.8242407, 0.5545107, -2.258024, 0, 0, 0, 1, 1,
-0.8230442, 1.548706, 0.2613885, 0, 0, 0, 1, 1,
-0.8230124, -0.9718406, -3.023637, 0, 0, 0, 1, 1,
-0.810608, -0.2469618, 0.2885885, 0, 0, 0, 1, 1,
-0.8104871, -0.04356001, -1.092169, 0, 0, 0, 1, 1,
-0.8087245, 1.062201, -1.204508, 1, 1, 1, 1, 1,
-0.8062766, 2.881855, 0.5799775, 1, 1, 1, 1, 1,
-0.8057337, -0.2298934, -1.287816, 1, 1, 1, 1, 1,
-0.7980996, -2.717362, -2.76601, 1, 1, 1, 1, 1,
-0.7977372, 1.344668, -0.1194428, 1, 1, 1, 1, 1,
-0.792015, -0.1125037, -0.9179081, 1, 1, 1, 1, 1,
-0.7802651, 0.4659019, -2.380221, 1, 1, 1, 1, 1,
-0.7791341, -1.300867, -2.291766, 1, 1, 1, 1, 1,
-0.7712417, 1.601343, -1.484463, 1, 1, 1, 1, 1,
-0.7707283, -0.6246215, -3.197862, 1, 1, 1, 1, 1,
-0.7704099, -0.6768866, -0.02950988, 1, 1, 1, 1, 1,
-0.7637955, -0.6929622, -1.628657, 1, 1, 1, 1, 1,
-0.7626206, 1.085018, -0.09665603, 1, 1, 1, 1, 1,
-0.7550303, 1.281051, -2.524995, 1, 1, 1, 1, 1,
-0.753924, -0.3550336, -2.842254, 1, 1, 1, 1, 1,
-0.7538819, 1.771787, 0.7231203, 0, 0, 1, 1, 1,
-0.7501179, -1.193106, -3.268448, 1, 0, 0, 1, 1,
-0.7434006, -0.3001004, -0.3145197, 1, 0, 0, 1, 1,
-0.7361646, 0.1072016, -1.892036, 1, 0, 0, 1, 1,
-0.7351254, 0.5356075, -0.7667785, 1, 0, 0, 1, 1,
-0.7317277, -0.6680044, -2.778854, 1, 0, 0, 1, 1,
-0.7262903, 0.2274119, -2.942321, 0, 0, 0, 1, 1,
-0.7217642, -0.3361289, -1.681992, 0, 0, 0, 1, 1,
-0.7211298, -0.8516394, -2.478609, 0, 0, 0, 1, 1,
-0.7198462, -1.217169, -1.898734, 0, 0, 0, 1, 1,
-0.7156806, -0.06894743, -2.48297, 0, 0, 0, 1, 1,
-0.7118823, -0.7909961, -2.949654, 0, 0, 0, 1, 1,
-0.711824, -0.1467052, -2.252995, 0, 0, 0, 1, 1,
-0.7110785, 1.754331, -0.3612565, 1, 1, 1, 1, 1,
-0.7097893, 1.916149, -0.315651, 1, 1, 1, 1, 1,
-0.7082748, 1.486506, -1.322691, 1, 1, 1, 1, 1,
-0.697561, -1.163643, -1.269067, 1, 1, 1, 1, 1,
-0.6893523, -0.3097716, -1.685659, 1, 1, 1, 1, 1,
-0.6850093, -0.1467396, -0.2705547, 1, 1, 1, 1, 1,
-0.6836927, 1.239884, -1.021124, 1, 1, 1, 1, 1,
-0.6824862, -0.2183798, -1.322182, 1, 1, 1, 1, 1,
-0.6783196, 1.041039, -1.112712, 1, 1, 1, 1, 1,
-0.678234, -0.5424632, -1.115991, 1, 1, 1, 1, 1,
-0.677802, 1.064642, -0.5410709, 1, 1, 1, 1, 1,
-0.6776515, 1.195089, 0.4779907, 1, 1, 1, 1, 1,
-0.6771424, -0.1158211, -1.745807, 1, 1, 1, 1, 1,
-0.6716701, 0.7908249, -0.296258, 1, 1, 1, 1, 1,
-0.6713484, 1.625857, -1.293063, 1, 1, 1, 1, 1,
-0.6692255, -0.6847123, -2.139397, 0, 0, 1, 1, 1,
-0.6689662, -0.7744781, -2.251103, 1, 0, 0, 1, 1,
-0.6540195, 0.2126839, -2.099287, 1, 0, 0, 1, 1,
-0.6531034, -0.4123544, -4.373184, 1, 0, 0, 1, 1,
-0.6451131, 1.530557, 0.2015467, 1, 0, 0, 1, 1,
-0.6436527, 2.60184, -1.648888, 1, 0, 0, 1, 1,
-0.6398022, 1.506382, -0.4176754, 0, 0, 0, 1, 1,
-0.6370935, 0.2698289, -2.370411, 0, 0, 0, 1, 1,
-0.6303197, -0.8741874, -5.678612, 0, 0, 0, 1, 1,
-0.6283238, 0.6020977, -0.9126545, 0, 0, 0, 1, 1,
-0.6248901, 0.7837092, -0.1355857, 0, 0, 0, 1, 1,
-0.6248555, 1.409121, 0.4715385, 0, 0, 0, 1, 1,
-0.6223615, 1.588544, 0.9429957, 0, 0, 0, 1, 1,
-0.6147554, -0.7308881, -2.622099, 1, 1, 1, 1, 1,
-0.6084872, 1.203621, 1.313023, 1, 1, 1, 1, 1,
-0.6055855, 1.356002, 0.03626325, 1, 1, 1, 1, 1,
-0.6054016, -0.3452529, -0.7188686, 1, 1, 1, 1, 1,
-0.6048435, -0.8398829, -2.7305, 1, 1, 1, 1, 1,
-0.6038054, -0.3220288, -0.7874249, 1, 1, 1, 1, 1,
-0.6025215, 0.02723488, -1.38334, 1, 1, 1, 1, 1,
-0.5998914, 0.4861123, 1.136887, 1, 1, 1, 1, 1,
-0.5987145, 1.227038, -1.719177, 1, 1, 1, 1, 1,
-0.5969607, 0.2849494, -2.008909, 1, 1, 1, 1, 1,
-0.5962867, 0.09297498, -0.02409687, 1, 1, 1, 1, 1,
-0.5920444, -0.4620294, -2.799754, 1, 1, 1, 1, 1,
-0.5913877, 0.4108016, -2.151031, 1, 1, 1, 1, 1,
-0.5893876, -1.04461, -3.729874, 1, 1, 1, 1, 1,
-0.5821964, 0.4125184, -0.8372653, 1, 1, 1, 1, 1,
-0.5775727, -1.006392, -3.881321, 0, 0, 1, 1, 1,
-0.5715182, 2.08627, 0.3182546, 1, 0, 0, 1, 1,
-0.5688881, 0.522969, -0.1105867, 1, 0, 0, 1, 1,
-0.5669612, 1.046398, 0.3996996, 1, 0, 0, 1, 1,
-0.5667881, 1.006676, -1.438528, 1, 0, 0, 1, 1,
-0.5635822, 0.006653551, -2.633914, 1, 0, 0, 1, 1,
-0.5586722, -1.385913, -3.115838, 0, 0, 0, 1, 1,
-0.557211, 0.3859572, -0.2767879, 0, 0, 0, 1, 1,
-0.5519077, 0.9087095, -0.0119216, 0, 0, 0, 1, 1,
-0.55124, -0.7953712, -2.260516, 0, 0, 0, 1, 1,
-0.5387548, -0.8452126, -2.404731, 0, 0, 0, 1, 1,
-0.5381106, -1.584999, -2.622735, 0, 0, 0, 1, 1,
-0.5365502, -1.204193, -2.944797, 0, 0, 0, 1, 1,
-0.5293072, 1.517031, -1.686844, 1, 1, 1, 1, 1,
-0.5270599, -0.5723016, -2.036326, 1, 1, 1, 1, 1,
-0.5212832, -0.1206836, 0.6609729, 1, 1, 1, 1, 1,
-0.5155252, -0.2066039, -2.167817, 1, 1, 1, 1, 1,
-0.5078923, 1.074216, -0.646788, 1, 1, 1, 1, 1,
-0.5016919, -2.17787, -3.849646, 1, 1, 1, 1, 1,
-0.4962927, 0.5833084, -0.6711224, 1, 1, 1, 1, 1,
-0.4936576, -0.497587, -2.440915, 1, 1, 1, 1, 1,
-0.4916126, 0.6027743, -0.7290054, 1, 1, 1, 1, 1,
-0.4891658, 0.2741008, -1.049479, 1, 1, 1, 1, 1,
-0.4841897, -0.9415344, -2.739285, 1, 1, 1, 1, 1,
-0.4810812, -0.06575788, -1.064072, 1, 1, 1, 1, 1,
-0.4773577, 1.981457, 0.3034489, 1, 1, 1, 1, 1,
-0.4770349, -0.5982875, -1.299189, 1, 1, 1, 1, 1,
-0.4760353, 0.1491611, -0.98184, 1, 1, 1, 1, 1,
-0.4743077, 0.7091733, -0.4927982, 0, 0, 1, 1, 1,
-0.4694581, -0.6748795, -1.661218, 1, 0, 0, 1, 1,
-0.4674774, 0.7526168, 3.203093, 1, 0, 0, 1, 1,
-0.4642904, 0.6279571, 0.9156697, 1, 0, 0, 1, 1,
-0.4634679, -0.9682571, -1.360779, 1, 0, 0, 1, 1,
-0.4624119, -0.7011986, -1.989778, 1, 0, 0, 1, 1,
-0.4533953, -1.594079, -2.610593, 0, 0, 0, 1, 1,
-0.4528963, 0.2829483, -1.492173, 0, 0, 0, 1, 1,
-0.4494643, -0.5879154, -1.965861, 0, 0, 0, 1, 1,
-0.448042, 1.041943, -0.03158921, 0, 0, 0, 1, 1,
-0.4472815, 0.5235431, -2.521105, 0, 0, 0, 1, 1,
-0.446229, 0.3668365, -3.178703, 0, 0, 0, 1, 1,
-0.4440705, 1.6706, -0.6127368, 0, 0, 0, 1, 1,
-0.4384656, 0.8293028, 0.3622896, 1, 1, 1, 1, 1,
-0.4355448, 0.5281848, -0.2467089, 1, 1, 1, 1, 1,
-0.4319877, -0.2334693, -1.461126, 1, 1, 1, 1, 1,
-0.4241236, -0.3265275, -3.346957, 1, 1, 1, 1, 1,
-0.4212572, 0.2385298, -4.463052, 1, 1, 1, 1, 1,
-0.4170296, 0.726473, 0.3934872, 1, 1, 1, 1, 1,
-0.4130384, -0.9736597, -4.14812, 1, 1, 1, 1, 1,
-0.4117996, 1.207386, -0.2805128, 1, 1, 1, 1, 1,
-0.4114872, 1.360141, -0.9535243, 1, 1, 1, 1, 1,
-0.4083712, -0.6044745, -2.155955, 1, 1, 1, 1, 1,
-0.4078395, 2.281555, -1.275158, 1, 1, 1, 1, 1,
-0.4056142, 0.6306136, -0.2393859, 1, 1, 1, 1, 1,
-0.4033209, 2.415131, 0.9559845, 1, 1, 1, 1, 1,
-0.4007088, 0.4953111, -1.283003, 1, 1, 1, 1, 1,
-0.3992366, 1.917607, 0.08892556, 1, 1, 1, 1, 1,
-0.3926179, 0.2747865, -0.5619439, 0, 0, 1, 1, 1,
-0.3812619, -0.2014081, -1.639023, 1, 0, 0, 1, 1,
-0.3737907, -0.2232274, -2.804493, 1, 0, 0, 1, 1,
-0.3728741, 0.8732449, 0.5452525, 1, 0, 0, 1, 1,
-0.3685339, -0.2860072, -1.250435, 1, 0, 0, 1, 1,
-0.3637166, 0.3557753, -2.010502, 1, 0, 0, 1, 1,
-0.3631843, -0.307063, -2.683748, 0, 0, 0, 1, 1,
-0.3618153, -0.7305895, -4.411426, 0, 0, 0, 1, 1,
-0.3615949, -0.8475417, -2.753461, 0, 0, 0, 1, 1,
-0.3551631, 1.405499, -0.3118303, 0, 0, 0, 1, 1,
-0.3509264, -0.08529346, -1.487786, 0, 0, 0, 1, 1,
-0.3498996, -1.464561, -3.436882, 0, 0, 0, 1, 1,
-0.3493228, 0.8581608, -0.9895021, 0, 0, 0, 1, 1,
-0.3479779, 0.7028667, 0.1763222, 1, 1, 1, 1, 1,
-0.3470838, 2.382213, -1.576184, 1, 1, 1, 1, 1,
-0.3464887, -1.079967, -3.553362, 1, 1, 1, 1, 1,
-0.3445681, -1.862135, -3.014571, 1, 1, 1, 1, 1,
-0.338491, -1.419996, -4.720011, 1, 1, 1, 1, 1,
-0.3380617, -0.2072301, -2.553592, 1, 1, 1, 1, 1,
-0.3379769, 2.022418, 0.4277673, 1, 1, 1, 1, 1,
-0.3368694, 1.606143, -1.147735, 1, 1, 1, 1, 1,
-0.333764, -0.137348, 0.9205374, 1, 1, 1, 1, 1,
-0.3330002, -0.891589, -1.977978, 1, 1, 1, 1, 1,
-0.3285251, -0.1400522, -2.454558, 1, 1, 1, 1, 1,
-0.3281105, 1.012535, 1.309406, 1, 1, 1, 1, 1,
-0.3230168, -0.1326253, -1.077118, 1, 1, 1, 1, 1,
-0.3221274, -2.634761, -2.776011, 1, 1, 1, 1, 1,
-0.3207923, -0.1392113, -3.000076, 1, 1, 1, 1, 1,
-0.319728, -0.9680353, -2.26227, 0, 0, 1, 1, 1,
-0.3169236, -1.214459, -2.526284, 1, 0, 0, 1, 1,
-0.3132584, 0.9896482, -1.450067, 1, 0, 0, 1, 1,
-0.3131687, -1.046025, -3.877489, 1, 0, 0, 1, 1,
-0.3116829, -0.233628, -2.953345, 1, 0, 0, 1, 1,
-0.3096224, -0.3830679, -2.226528, 1, 0, 0, 1, 1,
-0.306363, 0.6741982, 0.5207744, 0, 0, 0, 1, 1,
-0.3060921, -1.639681, -2.527236, 0, 0, 0, 1, 1,
-0.3038168, -0.6320233, -2.485288, 0, 0, 0, 1, 1,
-0.3036954, 0.1727471, -0.9956057, 0, 0, 0, 1, 1,
-0.3032523, -0.8403155, -3.407832, 0, 0, 0, 1, 1,
-0.3000873, 0.5558804, 0.5368185, 0, 0, 0, 1, 1,
-0.2958953, -0.06138393, 0.3020305, 0, 0, 0, 1, 1,
-0.2951991, -0.8196932, -3.489155, 1, 1, 1, 1, 1,
-0.2942737, -0.2046279, -2.24677, 1, 1, 1, 1, 1,
-0.2852284, -0.6170076, -2.424166, 1, 1, 1, 1, 1,
-0.283453, 0.6243107, 0.7076949, 1, 1, 1, 1, 1,
-0.2818163, -0.2053853, -2.491343, 1, 1, 1, 1, 1,
-0.2761426, 0.1964369, -1.665989, 1, 1, 1, 1, 1,
-0.2758507, 0.4458315, 0.1458581, 1, 1, 1, 1, 1,
-0.2726263, -0.657157, -3.948097, 1, 1, 1, 1, 1,
-0.2623314, 1.703442, 0.04406324, 1, 1, 1, 1, 1,
-0.2607845, 1.312158, 1.306792, 1, 1, 1, 1, 1,
-0.2603292, 0.681838, 1.306632, 1, 1, 1, 1, 1,
-0.2601405, -0.8009341, -2.200003, 1, 1, 1, 1, 1,
-0.2587897, 1.565591, 0.6901478, 1, 1, 1, 1, 1,
-0.2558093, 0.3140552, -0.6425098, 1, 1, 1, 1, 1,
-0.2552864, -1.232813, -1.762014, 1, 1, 1, 1, 1,
-0.253734, 0.1811363, -0.9400052, 0, 0, 1, 1, 1,
-0.2493255, -0.2732257, -2.658891, 1, 0, 0, 1, 1,
-0.2484873, 0.6434265, -1.833808, 1, 0, 0, 1, 1,
-0.2476966, 0.01741693, -0.6770014, 1, 0, 0, 1, 1,
-0.2462558, 0.8459639, -0.1487198, 1, 0, 0, 1, 1,
-0.2433283, -0.2001123, -1.908618, 1, 0, 0, 1, 1,
-0.2431433, 1.508966, 0.7114329, 0, 0, 0, 1, 1,
-0.2412008, 0.2261834, -1.188846, 0, 0, 0, 1, 1,
-0.2344989, 0.8095758, -1.350164, 0, 0, 0, 1, 1,
-0.2326831, 1.818229, -0.763872, 0, 0, 0, 1, 1,
-0.2272529, -0.2756675, -2.445264, 0, 0, 0, 1, 1,
-0.2270781, -1.902015, -3.252764, 0, 0, 0, 1, 1,
-0.2249136, 1.101191, -0.02013298, 0, 0, 0, 1, 1,
-0.2230867, -0.7945608, -3.704417, 1, 1, 1, 1, 1,
-0.2195316, 1.379298, 0.1216296, 1, 1, 1, 1, 1,
-0.2168619, -0.9594469, -5.355947, 1, 1, 1, 1, 1,
-0.2159562, -0.01841987, -1.328654, 1, 1, 1, 1, 1,
-0.2158819, -0.4727807, -3.424902, 1, 1, 1, 1, 1,
-0.2136471, -0.1275934, -0.894388, 1, 1, 1, 1, 1,
-0.2094721, 1.230151, -0.7120438, 1, 1, 1, 1, 1,
-0.2061752, -1.443373, -2.758098, 1, 1, 1, 1, 1,
-0.2047565, -0.9229562, -2.128707, 1, 1, 1, 1, 1,
-0.2032463, 0.3958686, -0.6773689, 1, 1, 1, 1, 1,
-0.2012101, -0.4922968, -3.959146, 1, 1, 1, 1, 1,
-0.199332, 0.1205818, -1.591468, 1, 1, 1, 1, 1,
-0.1985261, -0.1195473, -4.034838, 1, 1, 1, 1, 1,
-0.1953246, -0.1884008, -1.677446, 1, 1, 1, 1, 1,
-0.1926813, 0.4240052, -2.002216, 1, 1, 1, 1, 1,
-0.1922886, -0.4530493, -2.270675, 0, 0, 1, 1, 1,
-0.1917733, -0.6103351, -1.283311, 1, 0, 0, 1, 1,
-0.1907075, -0.8406742, -2.090252, 1, 0, 0, 1, 1,
-0.1897268, 0.09512922, -0.1941969, 1, 0, 0, 1, 1,
-0.1880393, -1.727623, -3.170467, 1, 0, 0, 1, 1,
-0.1870755, 0.5547581, -0.872052, 1, 0, 0, 1, 1,
-0.180866, 2.626658, -0.69332, 0, 0, 0, 1, 1,
-0.1769298, -0.2850722, -3.000322, 0, 0, 0, 1, 1,
-0.1736585, -0.8679403, -3.016707, 0, 0, 0, 1, 1,
-0.1728445, 0.5074883, -0.5630511, 0, 0, 0, 1, 1,
-0.1721815, 1.00643, -0.9295876, 0, 0, 0, 1, 1,
-0.1704023, 1.026719, -0.3693305, 0, 0, 0, 1, 1,
-0.1698363, -0.07979584, -2.129771, 0, 0, 0, 1, 1,
-0.1687352, -1.024597, -2.516389, 1, 1, 1, 1, 1,
-0.1652673, 0.45308, 1.386535, 1, 1, 1, 1, 1,
-0.1651978, 0.8190503, 0.8944381, 1, 1, 1, 1, 1,
-0.1598409, 0.4043324, -2.057484, 1, 1, 1, 1, 1,
-0.1595902, -0.5906101, -2.765969, 1, 1, 1, 1, 1,
-0.1580555, -0.3727899, -3.753083, 1, 1, 1, 1, 1,
-0.1500219, 0.4868915, -0.04183695, 1, 1, 1, 1, 1,
-0.1496718, -1.547824, -3.651272, 1, 1, 1, 1, 1,
-0.1495407, 1.45861, 0.8830975, 1, 1, 1, 1, 1,
-0.1470709, 3.371367, 0.7824332, 1, 1, 1, 1, 1,
-0.1465893, -0.7623794, -3.075961, 1, 1, 1, 1, 1,
-0.1399753, 1.112966, 1.509955, 1, 1, 1, 1, 1,
-0.136194, 1.477513, 1.250626, 1, 1, 1, 1, 1,
-0.1354672, -0.7861017, -3.510746, 1, 1, 1, 1, 1,
-0.1305312, -0.7729493, -4.077446, 1, 1, 1, 1, 1,
-0.1287506, 0.989395, 0.8956561, 0, 0, 1, 1, 1,
-0.1270786, 0.09610807, 0.7328694, 1, 0, 0, 1, 1,
-0.1261036, -0.1595477, -2.91193, 1, 0, 0, 1, 1,
-0.1180808, -0.3834111, -2.560267, 1, 0, 0, 1, 1,
-0.117606, 0.1215998, -0.6445512, 1, 0, 0, 1, 1,
-0.116844, 0.252286, 0.6203431, 1, 0, 0, 1, 1,
-0.1154679, 0.283887, -1.238686, 0, 0, 0, 1, 1,
-0.1121482, 0.7378594, 0.8799011, 0, 0, 0, 1, 1,
-0.1078964, -2.056756, -4.016444, 0, 0, 0, 1, 1,
-0.1067328, -0.178835, -3.363189, 0, 0, 0, 1, 1,
-0.1052383, -0.1350318, -1.006328, 0, 0, 0, 1, 1,
-0.09337336, 1.818772, 0.1995103, 0, 0, 0, 1, 1,
-0.09085666, -0.192837, -2.881476, 0, 0, 0, 1, 1,
-0.08967832, 0.9198319, -0.563527, 1, 1, 1, 1, 1,
-0.08954509, -0.6354451, -1.842414, 1, 1, 1, 1, 1,
-0.08666537, -0.2867426, -2.926281, 1, 1, 1, 1, 1,
-0.08579934, 0.8830589, 0.3579808, 1, 1, 1, 1, 1,
-0.08579913, 1.221305, -1.23453, 1, 1, 1, 1, 1,
-0.08533417, 1.151957, -1.7702, 1, 1, 1, 1, 1,
-0.07888573, 0.7109302, -0.08095502, 1, 1, 1, 1, 1,
-0.07530271, -0.8213864, -4.233857, 1, 1, 1, 1, 1,
-0.07134087, -1.124229, -2.733814, 1, 1, 1, 1, 1,
-0.0712977, -0.806521, -3.496076, 1, 1, 1, 1, 1,
-0.07085674, 0.287975, 0.3454067, 1, 1, 1, 1, 1,
-0.06344713, -0.6100946, -2.995978, 1, 1, 1, 1, 1,
-0.06313929, 0.71593, -1.840695, 1, 1, 1, 1, 1,
-0.05865351, -1.904552, -2.477235, 1, 1, 1, 1, 1,
-0.05617852, 0.01445424, -0.2778934, 1, 1, 1, 1, 1,
-0.05471196, 0.6042643, -0.4741189, 0, 0, 1, 1, 1,
-0.05464187, -0.5753423, -1.828138, 1, 0, 0, 1, 1,
-0.05372906, 0.4912566, -0.975811, 1, 0, 0, 1, 1,
-0.05219452, 1.372738, 0.138611, 1, 0, 0, 1, 1,
-0.0504067, -0.8182662, -2.564799, 1, 0, 0, 1, 1,
-0.04617942, 0.4038174, 1.303493, 1, 0, 0, 1, 1,
-0.04371561, -1.123756, -3.04075, 0, 0, 0, 1, 1,
-0.0364783, -0.7373514, -3.886206, 0, 0, 0, 1, 1,
-0.0336738, 0.08238011, -1.734898, 0, 0, 0, 1, 1,
-0.03326813, 0.219746, -0.8921676, 0, 0, 0, 1, 1,
-0.03324294, -0.8604087, -3.713556, 0, 0, 0, 1, 1,
-0.03050444, -1.080497, -3.43888, 0, 0, 0, 1, 1,
-0.0287809, -0.8657042, -2.180494, 0, 0, 0, 1, 1,
-0.02526125, -1.173813, -3.310873, 1, 1, 1, 1, 1,
-0.02410546, 0.3287975, -2.831273, 1, 1, 1, 1, 1,
-0.01867059, -0.1368148, -3.24934, 1, 1, 1, 1, 1,
-0.01746796, 0.5939248, 0.0275123, 1, 1, 1, 1, 1,
-0.01572011, -0.9581915, -3.169971, 1, 1, 1, 1, 1,
-0.01551058, 0.3548611, -0.9411848, 1, 1, 1, 1, 1,
-0.0125599, -0.5804681, -2.392535, 1, 1, 1, 1, 1,
-0.01242576, -0.1402342, -4.567528, 1, 1, 1, 1, 1,
-0.008700015, -0.8306573, -2.917622, 1, 1, 1, 1, 1,
3.127829e-05, 0.788586, -1.026204, 1, 1, 1, 1, 1,
0.002525865, -0.5047237, 3.140536, 1, 1, 1, 1, 1,
0.005343944, 0.3438315, -1.353681, 1, 1, 1, 1, 1,
0.01984409, -1.237309, 1.335945, 1, 1, 1, 1, 1,
0.02142745, 1.012972, 0.01989102, 1, 1, 1, 1, 1,
0.02164429, -0.2174313, 2.292783, 1, 1, 1, 1, 1,
0.02224961, -0.1486105, 2.371546, 0, 0, 1, 1, 1,
0.0238569, -0.3153116, 3.775126, 1, 0, 0, 1, 1,
0.02796877, -0.2097079, 3.191545, 1, 0, 0, 1, 1,
0.03099043, 1.167838, 0.2776369, 1, 0, 0, 1, 1,
0.03207421, 2.126099, -1.432456, 1, 0, 0, 1, 1,
0.03771585, -0.2228727, 3.506798, 1, 0, 0, 1, 1,
0.03871601, -0.328225, 4.191377, 0, 0, 0, 1, 1,
0.0433569, 0.07367067, 0.5907947, 0, 0, 0, 1, 1,
0.04409266, 0.09865365, -0.333611, 0, 0, 0, 1, 1,
0.04673384, 0.03041109, 0.2756169, 0, 0, 0, 1, 1,
0.04726029, 1.741683, 2.013064, 0, 0, 0, 1, 1,
0.0473565, 0.08358279, 1.916234, 0, 0, 0, 1, 1,
0.05532611, -0.727856, 0.6860203, 0, 0, 0, 1, 1,
0.0578849, 1.150277, -0.00312399, 1, 1, 1, 1, 1,
0.06250808, 0.3793589, -0.3343129, 1, 1, 1, 1, 1,
0.06603743, -0.9722867, 2.712881, 1, 1, 1, 1, 1,
0.06861097, -1.139485, 4.649798, 1, 1, 1, 1, 1,
0.07027562, 0.3510371, -0.3012486, 1, 1, 1, 1, 1,
0.07369252, -0.558812, 2.631067, 1, 1, 1, 1, 1,
0.07390224, 1.604408, 0.6491725, 1, 1, 1, 1, 1,
0.07766675, -0.4086486, 3.519521, 1, 1, 1, 1, 1,
0.07781551, -1.057054, 3.721024, 1, 1, 1, 1, 1,
0.07963127, -1.091558, 5.226809, 1, 1, 1, 1, 1,
0.08070809, 1.756491, 0.999761, 1, 1, 1, 1, 1,
0.08316294, 0.3118244, 2.01461, 1, 1, 1, 1, 1,
0.08375275, -0.2972655, 2.389436, 1, 1, 1, 1, 1,
0.0862596, -1.421366, 4.974479, 1, 1, 1, 1, 1,
0.08631738, 1.929566, -0.8880825, 1, 1, 1, 1, 1,
0.09426349, 1.187155, 1.304258, 0, 0, 1, 1, 1,
0.09451246, -0.8384829, 2.753301, 1, 0, 0, 1, 1,
0.09688168, -0.06021633, 1.248073, 1, 0, 0, 1, 1,
0.09830469, -2.152911, 3.545038, 1, 0, 0, 1, 1,
0.1029675, -1.284583, 1.927734, 1, 0, 0, 1, 1,
0.1098855, 1.262761, 0.06881524, 1, 0, 0, 1, 1,
0.1148311, 0.9869779, -1.574034, 0, 0, 0, 1, 1,
0.1170966, 0.7445848, -0.7903957, 0, 0, 0, 1, 1,
0.1201868, 0.8354187, -1.13017, 0, 0, 0, 1, 1,
0.1217053, 0.08520029, -0.8745906, 0, 0, 0, 1, 1,
0.1224888, 0.5403036, 0.02286192, 0, 0, 0, 1, 1,
0.1269567, 0.54994, -1.679073, 0, 0, 0, 1, 1,
0.1279629, -1.722362, 1.514609, 0, 0, 0, 1, 1,
0.1331294, -0.2337942, 3.212593, 1, 1, 1, 1, 1,
0.1358209, -0.5871914, 2.931263, 1, 1, 1, 1, 1,
0.1375177, 1.025064, -0.5614045, 1, 1, 1, 1, 1,
0.1416694, 0.7941037, 0.07034554, 1, 1, 1, 1, 1,
0.1426182, 0.1482099, 0.4062443, 1, 1, 1, 1, 1,
0.147153, -1.485447, 4.337061, 1, 1, 1, 1, 1,
0.1475296, -0.06229731, 2.223219, 1, 1, 1, 1, 1,
0.147893, 0.9822664, 0.7502431, 1, 1, 1, 1, 1,
0.1486731, 0.5845895, 1.130074, 1, 1, 1, 1, 1,
0.1488917, -0.3375688, 2.926284, 1, 1, 1, 1, 1,
0.1504441, 0.06151008, 1.563969, 1, 1, 1, 1, 1,
0.1611345, 0.3021974, -0.9209396, 1, 1, 1, 1, 1,
0.1625937, -0.7342108, 4.153183, 1, 1, 1, 1, 1,
0.164208, 0.4734439, 1.624962, 1, 1, 1, 1, 1,
0.1660623, -0.5565395, 4.525631, 1, 1, 1, 1, 1,
0.1668849, 0.5838174, -0.2379573, 0, 0, 1, 1, 1,
0.1674821, 0.07736755, 2.105654, 1, 0, 0, 1, 1,
0.1698041, -0.9957626, 2.261644, 1, 0, 0, 1, 1,
0.1721486, -0.4398966, 2.888681, 1, 0, 0, 1, 1,
0.1727282, -0.9915128, 2.223851, 1, 0, 0, 1, 1,
0.1778859, 0.6226031, 0.01506951, 1, 0, 0, 1, 1,
0.1790951, -0.2175313, 1.891217, 0, 0, 0, 1, 1,
0.1818408, 0.8746209, 0.04051003, 0, 0, 0, 1, 1,
0.1828165, -0.9989612, 2.743347, 0, 0, 0, 1, 1,
0.1842466, -0.7864579, 3.009825, 0, 0, 0, 1, 1,
0.1861814, -0.1358756, 2.404398, 0, 0, 0, 1, 1,
0.1869148, 0.2926596, 1.217266, 0, 0, 0, 1, 1,
0.1876031, 0.8366865, 0.6760573, 0, 0, 0, 1, 1,
0.1876752, -1.108982, 4.085432, 1, 1, 1, 1, 1,
0.1879311, 0.8752061, -0.01820272, 1, 1, 1, 1, 1,
0.192044, 1.256664, 0.5790626, 1, 1, 1, 1, 1,
0.1974895, -2.32991, 3.551056, 1, 1, 1, 1, 1,
0.1982802, -0.7048603, 3.006819, 1, 1, 1, 1, 1,
0.2001645, 0.5108739, -0.03334383, 1, 1, 1, 1, 1,
0.2025655, -0.9302474, 2.338087, 1, 1, 1, 1, 1,
0.2062756, 0.2676127, 0.06941465, 1, 1, 1, 1, 1,
0.20752, -1.582453, 2.55039, 1, 1, 1, 1, 1,
0.2084574, -2.007359, 3.009832, 1, 1, 1, 1, 1,
0.2116508, 1.488146, 0.0576928, 1, 1, 1, 1, 1,
0.2134875, 1.797937, -0.1061013, 1, 1, 1, 1, 1,
0.2151298, -0.557075, 2.521602, 1, 1, 1, 1, 1,
0.2189249, -0.6084572, 3.410496, 1, 1, 1, 1, 1,
0.2190582, 1.168071, 1.755921, 1, 1, 1, 1, 1,
0.2252798, -0.6289931, 3.80796, 0, 0, 1, 1, 1,
0.2257091, -2.527833, 2.538321, 1, 0, 0, 1, 1,
0.229822, -0.2879529, 1.500381, 1, 0, 0, 1, 1,
0.2326914, -0.3987316, 3.154879, 1, 0, 0, 1, 1,
0.2347781, -0.710081, 1.953622, 1, 0, 0, 1, 1,
0.2366183, 0.07243655, 0.9472203, 1, 0, 0, 1, 1,
0.2387299, 0.6588537, -1.019517, 0, 0, 0, 1, 1,
0.2390817, -0.442338, 2.384212, 0, 0, 0, 1, 1,
0.2422389, 0.9521259, 0.286994, 0, 0, 0, 1, 1,
0.2423197, 0.2780263, 1.668189, 0, 0, 0, 1, 1,
0.2426762, -1.863134, 3.728343, 0, 0, 0, 1, 1,
0.2437494, -0.7392908, 1.500494, 0, 0, 0, 1, 1,
0.2438049, 0.5488524, 1.086146, 0, 0, 0, 1, 1,
0.2440874, -1.358126, 2.496504, 1, 1, 1, 1, 1,
0.2477834, -0.6863891, 1.951237, 1, 1, 1, 1, 1,
0.2486125, -0.0966301, 3.197064, 1, 1, 1, 1, 1,
0.2508154, 0.246863, 1.523957, 1, 1, 1, 1, 1,
0.2509196, 1.117151, 0.2024043, 1, 1, 1, 1, 1,
0.2519572, 1.090619, 0.412534, 1, 1, 1, 1, 1,
0.2576146, -1.098768, 2.017683, 1, 1, 1, 1, 1,
0.2615076, 0.5222453, 1.169154, 1, 1, 1, 1, 1,
0.2641612, 0.8651754, -0.8266321, 1, 1, 1, 1, 1,
0.2649488, -0.1454877, 3.22363, 1, 1, 1, 1, 1,
0.2711322, -0.7931976, 4.845499, 1, 1, 1, 1, 1,
0.2712142, -1.895847, 3.222911, 1, 1, 1, 1, 1,
0.2746162, 1.612629, 1.247578, 1, 1, 1, 1, 1,
0.2751718, -0.6836435, 2.160474, 1, 1, 1, 1, 1,
0.2752601, 0.8134038, 1.979846, 1, 1, 1, 1, 1,
0.2862149, -1.415854, 4.100399, 0, 0, 1, 1, 1,
0.2863137, 0.2664216, 0.852722, 1, 0, 0, 1, 1,
0.2864577, -0.1825034, 2.060568, 1, 0, 0, 1, 1,
0.2871833, 1.257659, 0.2372187, 1, 0, 0, 1, 1,
0.2877175, -0.3435838, 2.786118, 1, 0, 0, 1, 1,
0.2899194, 0.08509129, 1.811582, 1, 0, 0, 1, 1,
0.2906618, -0.1454552, 2.045156, 0, 0, 0, 1, 1,
0.291714, 0.02197612, 1.240378, 0, 0, 0, 1, 1,
0.2959679, -0.3093762, 3.800035, 0, 0, 0, 1, 1,
0.2972853, -0.2618077, 2.257665, 0, 0, 0, 1, 1,
0.3027221, -0.6503179, 1.695119, 0, 0, 0, 1, 1,
0.3065559, 1.217903, -1.569875, 0, 0, 0, 1, 1,
0.3079925, 1.15667, 0.2316722, 0, 0, 0, 1, 1,
0.3100084, 0.01927201, 0.3370163, 1, 1, 1, 1, 1,
0.3117093, 0.579645, 0.3857048, 1, 1, 1, 1, 1,
0.3118117, -0.008151388, 3.883713, 1, 1, 1, 1, 1,
0.3167024, -0.373272, 2.364416, 1, 1, 1, 1, 1,
0.3193932, -0.3220227, 2.609645, 1, 1, 1, 1, 1,
0.323148, 0.8086237, 1.426888, 1, 1, 1, 1, 1,
0.3237843, -0.2970275, 3.534714, 1, 1, 1, 1, 1,
0.3243458, 0.1883072, 1.773562, 1, 1, 1, 1, 1,
0.3269161, 0.4509078, 0.2476395, 1, 1, 1, 1, 1,
0.3276951, 0.5920582, 0.8092529, 1, 1, 1, 1, 1,
0.3306319, -0.9067279, 1.502594, 1, 1, 1, 1, 1,
0.3316262, -0.6053879, 2.962571, 1, 1, 1, 1, 1,
0.3333253, 0.8325257, 0.3051508, 1, 1, 1, 1, 1,
0.3354739, 0.4521475, 0.9772734, 1, 1, 1, 1, 1,
0.3409826, 1.072855, -0.1533667, 1, 1, 1, 1, 1,
0.3420826, 0.6374891, 0.9926389, 0, 0, 1, 1, 1,
0.3510626, 0.3903608, 2.264608, 1, 0, 0, 1, 1,
0.3522421, -1.625972, 3.137317, 1, 0, 0, 1, 1,
0.3523254, -1.150947, 1.69096, 1, 0, 0, 1, 1,
0.3523718, 1.02238, -0.4082036, 1, 0, 0, 1, 1,
0.3528687, -0.3361167, 3.234969, 1, 0, 0, 1, 1,
0.3612821, -0.9920205, 1.786185, 0, 0, 0, 1, 1,
0.3616033, 1.097787, 0.1200141, 0, 0, 0, 1, 1,
0.364026, 0.5129182, 0.6252996, 0, 0, 0, 1, 1,
0.364501, -0.3678068, 1.344188, 0, 0, 0, 1, 1,
0.3772902, -1.872798, 1.916024, 0, 0, 0, 1, 1,
0.3790505, -0.678568, 3.374093, 0, 0, 0, 1, 1,
0.3811339, 0.8577951, 0.7079023, 0, 0, 0, 1, 1,
0.3823156, 0.7053763, 1.284781, 1, 1, 1, 1, 1,
0.3829841, 0.498019, 1.316944, 1, 1, 1, 1, 1,
0.3836364, -0.229691, 4.713726, 1, 1, 1, 1, 1,
0.3851611, 0.1844465, 0.8658046, 1, 1, 1, 1, 1,
0.3910136, 1.878857, 0.8698856, 1, 1, 1, 1, 1,
0.3960406, 1.827188, 1.240156, 1, 1, 1, 1, 1,
0.3981966, 1.064635, -0.8428283, 1, 1, 1, 1, 1,
0.399661, -0.4656338, 2.423123, 1, 1, 1, 1, 1,
0.4011393, -0.2432901, 2.950121, 1, 1, 1, 1, 1,
0.4021668, 0.4052149, 0.8956751, 1, 1, 1, 1, 1,
0.4038596, 0.02683547, 1.716242, 1, 1, 1, 1, 1,
0.4063021, 0.6990461, 1.363105, 1, 1, 1, 1, 1,
0.4068075, -0.3142673, 0.2275745, 1, 1, 1, 1, 1,
0.409162, 0.3095627, 1.385398, 1, 1, 1, 1, 1,
0.4116326, 1.430744, -1.203794, 1, 1, 1, 1, 1,
0.4116822, 0.0495701, 0.3512329, 0, 0, 1, 1, 1,
0.4129825, 1.276018, 1.221744, 1, 0, 0, 1, 1,
0.4166691, 1.609957, 1.998579, 1, 0, 0, 1, 1,
0.4199578, 0.1084341, 0.9948802, 1, 0, 0, 1, 1,
0.4217855, 0.2231305, 0.7711105, 1, 0, 0, 1, 1,
0.4232628, 1.736505, 1.902749, 1, 0, 0, 1, 1,
0.4241424, 1.122064, 1.270232, 0, 0, 0, 1, 1,
0.4253753, 0.1033191, 0.2720432, 0, 0, 0, 1, 1,
0.429776, 0.0141879, 2.521008, 0, 0, 0, 1, 1,
0.4298107, -2.213449, 2.274744, 0, 0, 0, 1, 1,
0.433302, 0.8035327, -1.074405, 0, 0, 0, 1, 1,
0.4386918, 1.039737, 0.2838885, 0, 0, 0, 1, 1,
0.4465228, -1.289462, 2.079154, 0, 0, 0, 1, 1,
0.4469438, -0.3121213, 1.660815, 1, 1, 1, 1, 1,
0.4487739, -0.2001837, 0.782917, 1, 1, 1, 1, 1,
0.4499573, 0.777107, 0.2335248, 1, 1, 1, 1, 1,
0.4499684, 0.3253379, 3.663026, 1, 1, 1, 1, 1,
0.4507957, -0.4805232, 1.86338, 1, 1, 1, 1, 1,
0.4520148, -0.1665396, 0.6121365, 1, 1, 1, 1, 1,
0.4570111, -0.1660566, 3.02267, 1, 1, 1, 1, 1,
0.4612716, 0.837776, -0.1812146, 1, 1, 1, 1, 1,
0.4626813, -0.542073, 2.071542, 1, 1, 1, 1, 1,
0.4627971, -0.4341709, 1.524811, 1, 1, 1, 1, 1,
0.4646038, 0.0449852, 2.568006, 1, 1, 1, 1, 1,
0.4650475, 0.9121224, 0.7275204, 1, 1, 1, 1, 1,
0.4664191, -0.2528708, 1.695798, 1, 1, 1, 1, 1,
0.4723461, 0.5132735, -0.9565678, 1, 1, 1, 1, 1,
0.4796656, -0.615591, 2.412861, 1, 1, 1, 1, 1,
0.4805924, -0.7813987, 1.313304, 0, 0, 1, 1, 1,
0.4848205, -0.9292555, 2.532507, 1, 0, 0, 1, 1,
0.4885636, -1.277613, 2.821721, 1, 0, 0, 1, 1,
0.4970536, -0.1900377, 2.097089, 1, 0, 0, 1, 1,
0.4992251, 0.6024162, 1.39509, 1, 0, 0, 1, 1,
0.5019398, -1.321526, 1.277743, 1, 0, 0, 1, 1,
0.507009, -2.146659, 3.556237, 0, 0, 0, 1, 1,
0.510152, 0.01348504, 1.472714, 0, 0, 0, 1, 1,
0.5119494, -1.734522, 1.156103, 0, 0, 0, 1, 1,
0.5155108, -0.9082564, 3.486795, 0, 0, 0, 1, 1,
0.5175023, 1.110839, -0.1966967, 0, 0, 0, 1, 1,
0.5176988, 0.3684744, 0.9311928, 0, 0, 0, 1, 1,
0.5228599, 0.8084337, -0.2733484, 0, 0, 0, 1, 1,
0.5230848, -0.1083126, 1.333703, 1, 1, 1, 1, 1,
0.524424, 0.765176, 0.875746, 1, 1, 1, 1, 1,
0.5300752, 2.123567, 0.8056152, 1, 1, 1, 1, 1,
0.5304734, 1.29374, -0.591089, 1, 1, 1, 1, 1,
0.534189, -0.3614384, 2.670394, 1, 1, 1, 1, 1,
0.5347537, 0.106879, 0.261613, 1, 1, 1, 1, 1,
0.5353358, 1.33758, 1.597181, 1, 1, 1, 1, 1,
0.5360679, 1.637076, 1.330146, 1, 1, 1, 1, 1,
0.5387013, 1.257874, -0.7157974, 1, 1, 1, 1, 1,
0.5393959, 1.005939, 0.7613499, 1, 1, 1, 1, 1,
0.5402238, -0.4873908, 2.872122, 1, 1, 1, 1, 1,
0.5426742, -1.334624, 2.57167, 1, 1, 1, 1, 1,
0.5572719, -1.253458, 2.406941, 1, 1, 1, 1, 1,
0.5590923, -1.386691, 3.199659, 1, 1, 1, 1, 1,
0.5638411, -0.6789142, 1.007569, 1, 1, 1, 1, 1,
0.5697755, -0.9190919, 3.435904, 0, 0, 1, 1, 1,
0.5707247, 0.5556549, 0.3729433, 1, 0, 0, 1, 1,
0.572512, 0.4855319, 0.4973997, 1, 0, 0, 1, 1,
0.5783944, -2.143481, 3.087325, 1, 0, 0, 1, 1,
0.5795461, -1.637525, 2.998424, 1, 0, 0, 1, 1,
0.5814505, 0.04034482, 0.8041086, 1, 0, 0, 1, 1,
0.582604, 0.6000234, -0.6430064, 0, 0, 0, 1, 1,
0.5874488, -1.077786, 4.251783, 0, 0, 0, 1, 1,
0.5878225, 1.647963, -1.214572, 0, 0, 0, 1, 1,
0.5893407, 0.306091, 0.07409563, 0, 0, 0, 1, 1,
0.5935812, -1.108584, 2.74579, 0, 0, 0, 1, 1,
0.595542, 0.09725396, 2.473008, 0, 0, 0, 1, 1,
0.5957487, 0.3488644, 0.5849583, 0, 0, 0, 1, 1,
0.6000113, 0.1009243, 0.2836271, 1, 1, 1, 1, 1,
0.6039814, -0.06085423, 0.8696784, 1, 1, 1, 1, 1,
0.6043432, -0.7849051, 2.010563, 1, 1, 1, 1, 1,
0.6053792, -0.3290733, 3.122894, 1, 1, 1, 1, 1,
0.6079344, -1.793934, 0.7944338, 1, 1, 1, 1, 1,
0.6086606, 1.749735, 0.752286, 1, 1, 1, 1, 1,
0.6102978, -0.08518799, 1.577104, 1, 1, 1, 1, 1,
0.6156984, 1.36279, 0.760015, 1, 1, 1, 1, 1,
0.6201802, -0.3996013, 2.194236, 1, 1, 1, 1, 1,
0.6229941, 1.168787, -1.552242, 1, 1, 1, 1, 1,
0.6312584, 0.2808767, 0.1282749, 1, 1, 1, 1, 1,
0.6389929, 0.6738636, 1.717868, 1, 1, 1, 1, 1,
0.6392407, -1.684036, 2.683062, 1, 1, 1, 1, 1,
0.6416929, 0.1792809, 2.472945, 1, 1, 1, 1, 1,
0.6427213, -0.2643229, -0.1021711, 1, 1, 1, 1, 1,
0.6433105, 1.302427, 0.3096923, 0, 0, 1, 1, 1,
0.644236, 2.119372, 0.5614346, 1, 0, 0, 1, 1,
0.6470047, -1.560548, 1.810918, 1, 0, 0, 1, 1,
0.6488524, 1.750029, 0.0488215, 1, 0, 0, 1, 1,
0.6499403, -0.4981303, 1.479379, 1, 0, 0, 1, 1,
0.6553075, -0.2005692, 1.449559, 1, 0, 0, 1, 1,
0.6572952, -1.010539, 3.742067, 0, 0, 0, 1, 1,
0.658742, -0.4925111, 3.372838, 0, 0, 0, 1, 1,
0.6588963, -0.5920154, 1.966192, 0, 0, 0, 1, 1,
0.6590746, 0.508648, 2.408233, 0, 0, 0, 1, 1,
0.6682286, 0.2289477, 1.610188, 0, 0, 0, 1, 1,
0.6725388, -1.043925, 2.836805, 0, 0, 0, 1, 1,
0.6770143, -2.497568, 1.859601, 0, 0, 0, 1, 1,
0.6815172, -1.214474, 2.190264, 1, 1, 1, 1, 1,
0.6834119, -1.24633, 2.601118, 1, 1, 1, 1, 1,
0.6837429, 0.5286492, 0.04468609, 1, 1, 1, 1, 1,
0.6839538, -2.305769, 3.778102, 1, 1, 1, 1, 1,
0.687193, -0.5125467, 4.614264, 1, 1, 1, 1, 1,
0.6910196, -0.8672113, 2.762042, 1, 1, 1, 1, 1,
0.6951305, -1.089941, 2.790032, 1, 1, 1, 1, 1,
0.6988472, -0.1993324, 3.135407, 1, 1, 1, 1, 1,
0.7000333, 0.450606, -0.2917103, 1, 1, 1, 1, 1,
0.7096806, 0.5891126, 0.591206, 1, 1, 1, 1, 1,
0.7196594, 0.1101665, -0.1113896, 1, 1, 1, 1, 1,
0.7221787, -0.2844259, 1.015148, 1, 1, 1, 1, 1,
0.7231505, 0.5022199, -0.4459311, 1, 1, 1, 1, 1,
0.7266263, -1.605844, 1.870723, 1, 1, 1, 1, 1,
0.7319388, -0.9772041, 1.808138, 1, 1, 1, 1, 1,
0.7328776, -0.3641314, 1.145316, 0, 0, 1, 1, 1,
0.7399831, -0.5658175, 1.753884, 1, 0, 0, 1, 1,
0.7476307, 0.896746, 2.429362, 1, 0, 0, 1, 1,
0.7508685, 0.4390498, 0.343318, 1, 0, 0, 1, 1,
0.7540344, 0.6106682, 0.9540047, 1, 0, 0, 1, 1,
0.7618674, -0.2003588, 1.177455, 1, 0, 0, 1, 1,
0.7622151, 0.1444512, 1.45052, 0, 0, 0, 1, 1,
0.7672966, -1.445908, 1.878296, 0, 0, 0, 1, 1,
0.7689148, 1.02446, 0.6688646, 0, 0, 0, 1, 1,
0.7788012, -0.9939587, 3.12784, 0, 0, 0, 1, 1,
0.7789083, 1.020824, -0.3353273, 0, 0, 0, 1, 1,
0.7843304, -0.1316934, 1.727215, 0, 0, 0, 1, 1,
0.7848442, 0.7186438, 1.305064, 0, 0, 0, 1, 1,
0.7858874, -1.071278, 1.234931, 1, 1, 1, 1, 1,
0.7879548, 0.9223862, -0.1539943, 1, 1, 1, 1, 1,
0.7887878, 0.8436062, 0.1385662, 1, 1, 1, 1, 1,
0.7891445, -0.1999745, 0.8094272, 1, 1, 1, 1, 1,
0.7892368, -0.0750063, 3.150985, 1, 1, 1, 1, 1,
0.7936449, -0.1868725, 2.907825, 1, 1, 1, 1, 1,
0.8016788, 0.1330817, 2.551909, 1, 1, 1, 1, 1,
0.8019273, -0.9610256, 1.584216, 1, 1, 1, 1, 1,
0.8023011, 0.252148, 0.3925222, 1, 1, 1, 1, 1,
0.8059875, 1.507596, 1.946836, 1, 1, 1, 1, 1,
0.8060391, -0.3522489, 0.5568743, 1, 1, 1, 1, 1,
0.8082226, 0.09639734, 0.1591688, 1, 1, 1, 1, 1,
0.808867, -0.8217105, 2.241838, 1, 1, 1, 1, 1,
0.8141059, 1.173976, 0.7022179, 1, 1, 1, 1, 1,
0.8143886, -1.457155, 1.932484, 1, 1, 1, 1, 1,
0.8183779, 0.4801357, 1.153462, 0, 0, 1, 1, 1,
0.8184694, -0.5703421, -1.184469, 1, 0, 0, 1, 1,
0.8205975, -0.8903386, 1.681428, 1, 0, 0, 1, 1,
0.8209842, -1.048712, 1.661046, 1, 0, 0, 1, 1,
0.8265848, -0.01645512, 1.858617, 1, 0, 0, 1, 1,
0.8308141, -0.3616759, 0.6670442, 1, 0, 0, 1, 1,
0.8413182, -0.9884017, -0.2178477, 0, 0, 0, 1, 1,
0.8442773, 0.4535089, -0.07877075, 0, 0, 0, 1, 1,
0.8521606, 0.135956, 2.68974, 0, 0, 0, 1, 1,
0.8532171, -0.3820088, 0.5816551, 0, 0, 0, 1, 1,
0.8590036, 0.0399754, 0.528895, 0, 0, 0, 1, 1,
0.8597786, -0.2613052, 0.8757325, 0, 0, 0, 1, 1,
0.8644259, -0.7501273, 1.235258, 0, 0, 0, 1, 1,
0.8686411, -2.350313, 2.645681, 1, 1, 1, 1, 1,
0.8696557, 1.328032, -1.084024, 1, 1, 1, 1, 1,
0.8729864, -0.7459475, 2.8212, 1, 1, 1, 1, 1,
0.8854126, 1.162996, -0.3825088, 1, 1, 1, 1, 1,
0.8858632, -1.368455, 1.2259, 1, 1, 1, 1, 1,
0.8863686, -1.203611, 1.676368, 1, 1, 1, 1, 1,
0.8929526, 1.612491, 1.500224, 1, 1, 1, 1, 1,
0.8951855, -0.3511489, 1.364559, 1, 1, 1, 1, 1,
0.9077531, 0.480712, -0.4096443, 1, 1, 1, 1, 1,
0.9120547, 0.05373593, 2.706318, 1, 1, 1, 1, 1,
0.9121388, -0.949537, 3.157815, 1, 1, 1, 1, 1,
0.9136884, 0.2654729, 1.726239, 1, 1, 1, 1, 1,
0.9216553, -0.5828801, 1.302566, 1, 1, 1, 1, 1,
0.9240243, -1.353129, 2.637797, 1, 1, 1, 1, 1,
0.9254708, -0.7472169, 1.939382, 1, 1, 1, 1, 1,
0.9264312, -0.782878, 1.591776, 0, 0, 1, 1, 1,
0.9331793, 1.887342, -0.5366957, 1, 0, 0, 1, 1,
0.9332621, 1.12124, 1.2658, 1, 0, 0, 1, 1,
0.9506661, 1.110484, 0.6659142, 1, 0, 0, 1, 1,
0.953751, 0.191672, 3.976975, 1, 0, 0, 1, 1,
0.9542686, 0.7498997, 2.418954, 1, 0, 0, 1, 1,
0.9555712, 0.2657375, 1.573624, 0, 0, 0, 1, 1,
0.9623051, 1.445228, 0.4666782, 0, 0, 0, 1, 1,
0.9641071, -0.3270232, 1.633441, 0, 0, 0, 1, 1,
0.9750088, -0.5151983, -1.286471, 0, 0, 0, 1, 1,
0.9806501, -0.7852455, 2.128975, 0, 0, 0, 1, 1,
0.9806631, 0.4752705, 1.158161, 0, 0, 0, 1, 1,
0.9854816, -1.383352, 2.70953, 0, 0, 0, 1, 1,
0.9874098, -1.105196, 1.518404, 1, 1, 1, 1, 1,
0.9899657, 0.1862989, 1.817072, 1, 1, 1, 1, 1,
0.9924971, -0.2887674, 0.3537316, 1, 1, 1, 1, 1,
0.9945082, -1.474993, 1.634254, 1, 1, 1, 1, 1,
0.9969518, 0.4567188, -0.6376411, 1, 1, 1, 1, 1,
1.005161, 1.983279, -0.5492398, 1, 1, 1, 1, 1,
1.005535, 0.2602912, -0.1343407, 1, 1, 1, 1, 1,
1.008879, 0.2235146, 0.9792922, 1, 1, 1, 1, 1,
1.011943, 0.2673222, -1.053432, 1, 1, 1, 1, 1,
1.017442, -1.028281, 2.836238, 1, 1, 1, 1, 1,
1.018472, 1.141152, 1.373626, 1, 1, 1, 1, 1,
1.021678, -1.070081, 3.042256, 1, 1, 1, 1, 1,
1.025428, 0.5034607, -0.299937, 1, 1, 1, 1, 1,
1.033364, -1.585011, -0.7471796, 1, 1, 1, 1, 1,
1.033703, -1.547184, 5.035436, 1, 1, 1, 1, 1,
1.033911, 0.2567277, 1.849457, 0, 0, 1, 1, 1,
1.036397, 0.2552869, 2.046977, 1, 0, 0, 1, 1,
1.047606, 0.5113009, 1.737975, 1, 0, 0, 1, 1,
1.05248, -2.566537, 2.20436, 1, 0, 0, 1, 1,
1.054733, -1.819631, 1.16054, 1, 0, 0, 1, 1,
1.059879, 0.3505864, 1.558282, 1, 0, 0, 1, 1,
1.062492, -1.785257, 4.703928, 0, 0, 0, 1, 1,
1.067421, -0.5827841, 2.30638, 0, 0, 0, 1, 1,
1.073075, 0.5014503, 2.715836, 0, 0, 0, 1, 1,
1.07331, 0.009798128, 2.757388, 0, 0, 0, 1, 1,
1.074888, 1.242497, 2.151532, 0, 0, 0, 1, 1,
1.087881, -0.286736, 1.322872, 0, 0, 0, 1, 1,
1.089249, 1.571276, 1.589334, 0, 0, 0, 1, 1,
1.094048, 0.9920964, 1.079744, 1, 1, 1, 1, 1,
1.09464, -0.3037894, 2.331391, 1, 1, 1, 1, 1,
1.095391, 0.5205966, 2.455424, 1, 1, 1, 1, 1,
1.095584, -1.546388, 3.493992, 1, 1, 1, 1, 1,
1.10141, 1.198882, 3.54456, 1, 1, 1, 1, 1,
1.103053, 1.188912, 0.9242227, 1, 1, 1, 1, 1,
1.103934, -1.030383, 3.28122, 1, 1, 1, 1, 1,
1.113631, -0.1963703, 1.491229, 1, 1, 1, 1, 1,
1.123388, 0.1627802, 1.853956, 1, 1, 1, 1, 1,
1.129046, 1.542801, 2.670445, 1, 1, 1, 1, 1,
1.137878, -0.6987537, 2.161417, 1, 1, 1, 1, 1,
1.147297, -1.790062, 1.996358, 1, 1, 1, 1, 1,
1.169018, 1.213249, 1.938798, 1, 1, 1, 1, 1,
1.176754, 0.2857675, 1.795893, 1, 1, 1, 1, 1,
1.185798, -0.1628679, 1.175403, 1, 1, 1, 1, 1,
1.19004, -0.2981555, 1.442538, 0, 0, 1, 1, 1,
1.190685, -0.05051041, 2.514372, 1, 0, 0, 1, 1,
1.199529, 0.5523701, 0.9161016, 1, 0, 0, 1, 1,
1.209217, -0.7856094, 2.365952, 1, 0, 0, 1, 1,
1.209696, -0.1094404, 1.334831, 1, 0, 0, 1, 1,
1.231666, -0.778079, 0.850868, 1, 0, 0, 1, 1,
1.2324, -0.9278023, 0.7242364, 0, 0, 0, 1, 1,
1.235664, -3.063332, 2.403019, 0, 0, 0, 1, 1,
1.243153, -0.1397134, 1.263251, 0, 0, 0, 1, 1,
1.245852, 0.1464393, 1.849316, 0, 0, 0, 1, 1,
1.251293, -0.05606996, 2.318813, 0, 0, 0, 1, 1,
1.25512, -0.1513115, 2.490388, 0, 0, 0, 1, 1,
1.256519, 0.8854528, 1.081376, 0, 0, 0, 1, 1,
1.260846, -0.2318848, 2.606706, 1, 1, 1, 1, 1,
1.261679, -0.7705322, 1.935695, 1, 1, 1, 1, 1,
1.282582, 1.493797, 0.2646582, 1, 1, 1, 1, 1,
1.285446, -1.288659, 0.8437828, 1, 1, 1, 1, 1,
1.289416, -0.5655413, 2.411468, 1, 1, 1, 1, 1,
1.295723, 0.6672691, 2.033375, 1, 1, 1, 1, 1,
1.299909, -1.62983, 3.019325, 1, 1, 1, 1, 1,
1.304914, 1.167465, 0.7935618, 1, 1, 1, 1, 1,
1.310692, 0.6228905, 0.575127, 1, 1, 1, 1, 1,
1.314076, -0.4742565, 1.324445, 1, 1, 1, 1, 1,
1.357983, -0.9080909, 2.887301, 1, 1, 1, 1, 1,
1.362963, -0.7827154, 1.359406, 1, 1, 1, 1, 1,
1.369986, -0.3975179, 2.062673, 1, 1, 1, 1, 1,
1.370506, -0.2558783, 3.492375, 1, 1, 1, 1, 1,
1.391719, 2.154804, 1.033731, 1, 1, 1, 1, 1,
1.392826, -0.4369846, 1.620535, 0, 0, 1, 1, 1,
1.394266, -0.1178775, 1.519763, 1, 0, 0, 1, 1,
1.397584, 1.060503, 0.8953779, 1, 0, 0, 1, 1,
1.401356, 0.435362, 2.71033, 1, 0, 0, 1, 1,
1.407604, -2.161152, 3.182308, 1, 0, 0, 1, 1,
1.407712, 1.283611, 0.6246147, 1, 0, 0, 1, 1,
1.41381, 0.4168027, 0.798403, 0, 0, 0, 1, 1,
1.430143, -0.3485329, 2.717734, 0, 0, 0, 1, 1,
1.436099, 1.10188, 1.609061, 0, 0, 0, 1, 1,
1.438715, -0.8053138, 3.328418, 0, 0, 0, 1, 1,
1.442497, 1.144178, 2.68968, 0, 0, 0, 1, 1,
1.44553, -1.613963, 3.252845, 0, 0, 0, 1, 1,
1.457078, -0.6435183, 1.733027, 0, 0, 0, 1, 1,
1.467776, 0.6268537, 2.530801, 1, 1, 1, 1, 1,
1.4882, 0.6746571, 0.09362614, 1, 1, 1, 1, 1,
1.492175, 0.208985, 1.643291, 1, 1, 1, 1, 1,
1.495642, 2.142906, 0.987013, 1, 1, 1, 1, 1,
1.500739, -0.06476623, 0.9236305, 1, 1, 1, 1, 1,
1.501562, 0.1948087, 2.085302, 1, 1, 1, 1, 1,
1.504515, -0.9689956, 1.701091, 1, 1, 1, 1, 1,
1.507292, -0.1286432, 0.4030408, 1, 1, 1, 1, 1,
1.537765, -0.6885347, 2.257886, 1, 1, 1, 1, 1,
1.560839, 1.404607, 0.7665325, 1, 1, 1, 1, 1,
1.586133, -0.2678685, 1.699271, 1, 1, 1, 1, 1,
1.601572, -0.6834053, 0.8757468, 1, 1, 1, 1, 1,
1.610659, -0.1972472, 1.330315, 1, 1, 1, 1, 1,
1.613758, -0.1451817, 2.477535, 1, 1, 1, 1, 1,
1.61731, 0.9034066, 2.791479, 1, 1, 1, 1, 1,
1.635806, -0.7620999, 2.161992, 0, 0, 1, 1, 1,
1.641707, -0.08617551, 1.942364, 1, 0, 0, 1, 1,
1.655262, 0.3538051, 2.570944, 1, 0, 0, 1, 1,
1.660377, -0.3805888, 1.666898, 1, 0, 0, 1, 1,
1.66043, -1.078649, 2.092976, 1, 0, 0, 1, 1,
1.680702, -1.196186, 1.847653, 1, 0, 0, 1, 1,
1.685699, 0.1372314, 1.97016, 0, 0, 0, 1, 1,
1.700518, 0.9435499, 2.105062, 0, 0, 0, 1, 1,
1.70831, 0.9230627, -0.003392298, 0, 0, 0, 1, 1,
1.724969, 0.6376551, 0.8388513, 0, 0, 0, 1, 1,
1.725394, 1.86276, -0.7497715, 0, 0, 0, 1, 1,
1.735132, 0.8254659, 1.65561, 0, 0, 0, 1, 1,
1.746276, -0.6556553, 1.933967, 0, 0, 0, 1, 1,
1.751761, -0.1499668, 1.755515, 1, 1, 1, 1, 1,
1.753545, 0.5965742, 1.199501, 1, 1, 1, 1, 1,
1.774278, -0.1486444, 0.8890346, 1, 1, 1, 1, 1,
1.819402, 0.05064163, 3.555568, 1, 1, 1, 1, 1,
1.821409, 2.069745, -0.1635022, 1, 1, 1, 1, 1,
1.825696, -0.02309879, 2.149929, 1, 1, 1, 1, 1,
1.848926, 0.1569171, 0.4463018, 1, 1, 1, 1, 1,
1.888119, -0.3542247, 0.4346991, 1, 1, 1, 1, 1,
1.978325, 1.775449, -0.285958, 1, 1, 1, 1, 1,
1.9901, 0.8409538, 1.376684, 1, 1, 1, 1, 1,
1.992745, -0.107472, 1.772354, 1, 1, 1, 1, 1,
2.015696, -0.8193972, 0.9636023, 1, 1, 1, 1, 1,
2.028275, -1.400354, 2.863829, 1, 1, 1, 1, 1,
2.039976, 0.4293647, 0.5595038, 1, 1, 1, 1, 1,
2.056776, 1.095438, 2.409207, 1, 1, 1, 1, 1,
2.114959, -0.4464387, 1.863339, 0, 0, 1, 1, 1,
2.162647, -0.2383714, 3.564312, 1, 0, 0, 1, 1,
2.180625, -0.867312, 2.011873, 1, 0, 0, 1, 1,
2.214236, -0.6191099, 2.30292, 1, 0, 0, 1, 1,
2.241307, 3.270427, -0.21472, 1, 0, 0, 1, 1,
2.329413, 0.9345965, 2.929412, 1, 0, 0, 1, 1,
2.347872, 1.391397, 1.720071, 0, 0, 0, 1, 1,
2.393071, 1.135136, -0.3983044, 0, 0, 0, 1, 1,
2.397019, 0.786966, 3.284948, 0, 0, 0, 1, 1,
2.403101, -0.8171709, 2.012843, 0, 0, 0, 1, 1,
2.405802, -0.4962673, 0.4410833, 0, 0, 0, 1, 1,
2.432104, -1.129671, 0.3181497, 0, 0, 0, 1, 1,
2.462124, 0.3141862, 0.9635922, 0, 0, 0, 1, 1,
2.511451, -0.6925841, 1.471768, 1, 1, 1, 1, 1,
2.540225, -2.531782, 3.137229, 1, 1, 1, 1, 1,
2.551168, -0.387502, 2.721979, 1, 1, 1, 1, 1,
2.572703, 0.4868036, 1.291596, 1, 1, 1, 1, 1,
2.648638, 0.5400271, 1.841213, 1, 1, 1, 1, 1,
2.947261, -0.03110457, 1.67986, 1, 1, 1, 1, 1,
3.117354, -0.634953, 0.9128091, 1, 1, 1, 1, 1
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
var radius = 9.75437;
var distance = 34.26181;
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
mvMatrix.translate( 0.2656784, -0.1540177, 0.2259014 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.26181);
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
