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
-2.60604, 0.8656809, -0.7656415, 1, 0, 0, 1,
-2.563841, -0.5024329, -3.028592, 1, 0.007843138, 0, 1,
-2.544788, 0.7135528, 0.09252583, 1, 0.01176471, 0, 1,
-2.528238, 0.9892135, -0.168898, 1, 0.01960784, 0, 1,
-2.410577, -1.458473, -0.8276464, 1, 0.02352941, 0, 1,
-2.344429, -0.4520919, -2.078663, 1, 0.03137255, 0, 1,
-2.285978, 1.515924, -2.116765, 1, 0.03529412, 0, 1,
-2.253571, -0.2629924, 0.2024616, 1, 0.04313726, 0, 1,
-2.253403, -0.8879231, -2.295187, 1, 0.04705882, 0, 1,
-2.195869, 0.2954051, -2.815225, 1, 0.05490196, 0, 1,
-2.150938, -1.888315, -2.518025, 1, 0.05882353, 0, 1,
-2.134408, -0.2675636, -1.947518, 1, 0.06666667, 0, 1,
-2.120832, -0.1280732, -1.578453, 1, 0.07058824, 0, 1,
-2.114176, -1.001686, -1.652847, 1, 0.07843138, 0, 1,
-2.107686, 0.4526777, -0.813756, 1, 0.08235294, 0, 1,
-2.093054, 0.2997867, -2.420954, 1, 0.09019608, 0, 1,
-2.092823, -0.04929366, -1.057495, 1, 0.09411765, 0, 1,
-2.05793, -0.5038818, -2.457171, 1, 0.1019608, 0, 1,
-2.038234, 1.10073, 0.0424284, 1, 0.1098039, 0, 1,
-2.033608, 0.5103912, -1.716184, 1, 0.1137255, 0, 1,
-2.018868, 0.3625399, -2.142092, 1, 0.1215686, 0, 1,
-2.014296, -0.1153127, -2.993257, 1, 0.1254902, 0, 1,
-2.00957, -1.198412, -0.5824876, 1, 0.1333333, 0, 1,
-1.997448, 0.6960158, -1.067112, 1, 0.1372549, 0, 1,
-1.985886, -2.140275, -2.25397, 1, 0.145098, 0, 1,
-1.9744, -0.6584936, -0.9641368, 1, 0.1490196, 0, 1,
-1.9739, 1.447, -1.756392, 1, 0.1568628, 0, 1,
-1.967391, -0.2827223, -1.282871, 1, 0.1607843, 0, 1,
-1.934784, -0.04333851, 0.3182722, 1, 0.1686275, 0, 1,
-1.92673, -0.07163609, -1.917248, 1, 0.172549, 0, 1,
-1.922306, -1.357615, -4.309038, 1, 0.1803922, 0, 1,
-1.919692, -0.7557989, -2.221714, 1, 0.1843137, 0, 1,
-1.918649, -0.1962927, -0.2050607, 1, 0.1921569, 0, 1,
-1.912583, 0.4525003, -1.399396, 1, 0.1960784, 0, 1,
-1.882302, -1.192234, -2.747154, 1, 0.2039216, 0, 1,
-1.878409, 0.3468275, -0.979477, 1, 0.2117647, 0, 1,
-1.861867, 1.251527, 0.04733887, 1, 0.2156863, 0, 1,
-1.852993, 0.08421026, -2.62902, 1, 0.2235294, 0, 1,
-1.851173, -0.7127298, -0.3892259, 1, 0.227451, 0, 1,
-1.828505, 1.25431, -0.7207315, 1, 0.2352941, 0, 1,
-1.822447, 0.8984167, -0.9740428, 1, 0.2392157, 0, 1,
-1.809131, 0.3279471, -2.462958, 1, 0.2470588, 0, 1,
-1.800738, 1.683481, -1.732412, 1, 0.2509804, 0, 1,
-1.786421, 0.8788263, -3.132919, 1, 0.2588235, 0, 1,
-1.778035, -0.173092, -0.4518611, 1, 0.2627451, 0, 1,
-1.772946, -0.7554132, -3.297494, 1, 0.2705882, 0, 1,
-1.73955, -0.1967901, -2.297939, 1, 0.2745098, 0, 1,
-1.73725, 0.897281, -1.354589, 1, 0.282353, 0, 1,
-1.705179, 1.704295, -0.4688365, 1, 0.2862745, 0, 1,
-1.686173, 2.022032, -1.292632, 1, 0.2941177, 0, 1,
-1.66571, -2.203612, -3.094574, 1, 0.3019608, 0, 1,
-1.661328, -0.1538454, -4.742792, 1, 0.3058824, 0, 1,
-1.639742, -2.184442, -2.541179, 1, 0.3137255, 0, 1,
-1.637669, -0.7202117, -1.619336, 1, 0.3176471, 0, 1,
-1.619736, 1.132637, -1.823828, 1, 0.3254902, 0, 1,
-1.612573, -0.1794753, -2.908815, 1, 0.3294118, 0, 1,
-1.603994, -0.1597342, -0.9789587, 1, 0.3372549, 0, 1,
-1.601886, 0.882827, 0.5046684, 1, 0.3411765, 0, 1,
-1.587544, 1.975524, -0.1852656, 1, 0.3490196, 0, 1,
-1.581698, -0.4032822, -0.485666, 1, 0.3529412, 0, 1,
-1.581541, -0.9780523, -2.207521, 1, 0.3607843, 0, 1,
-1.576149, -0.1924691, -0.9374723, 1, 0.3647059, 0, 1,
-1.561782, 0.2876826, -1.263466, 1, 0.372549, 0, 1,
-1.517071, -0.6497298, -0.62006, 1, 0.3764706, 0, 1,
-1.516384, 0.5451431, -0.8688918, 1, 0.3843137, 0, 1,
-1.509544, -0.3090987, -3.363577, 1, 0.3882353, 0, 1,
-1.500469, 0.2416486, -1.569106, 1, 0.3960784, 0, 1,
-1.491237, 0.5589207, 0.194554, 1, 0.4039216, 0, 1,
-1.477828, 0.5906122, -1.447444, 1, 0.4078431, 0, 1,
-1.46773, 0.5455987, -2.363659, 1, 0.4156863, 0, 1,
-1.457708, 1.859736, -1.396715, 1, 0.4196078, 0, 1,
-1.446325, -0.9334601, -2.164982, 1, 0.427451, 0, 1,
-1.439155, -0.004269182, -1.48178, 1, 0.4313726, 0, 1,
-1.435623, -0.4898221, -2.927065, 1, 0.4392157, 0, 1,
-1.410055, -1.346845, 0.2433946, 1, 0.4431373, 0, 1,
-1.408305, -1.000307, -1.904137, 1, 0.4509804, 0, 1,
-1.40138, 0.5607491, -1.164928, 1, 0.454902, 0, 1,
-1.39627, 1.115481, -0.8982926, 1, 0.4627451, 0, 1,
-1.390119, 0.3224374, -0.8164421, 1, 0.4666667, 0, 1,
-1.383783, -0.03704051, -4.090691, 1, 0.4745098, 0, 1,
-1.377582, 0.64968, -1.965906, 1, 0.4784314, 0, 1,
-1.372906, -0.2118092, -0.5538101, 1, 0.4862745, 0, 1,
-1.372021, 0.8507795, 0.8820104, 1, 0.4901961, 0, 1,
-1.37005, 0.6048155, -0.07689168, 1, 0.4980392, 0, 1,
-1.358331, -0.7173347, -3.012453, 1, 0.5058824, 0, 1,
-1.356288, -0.8803074, -2.24519, 1, 0.509804, 0, 1,
-1.351552, 0.1109034, -1.860682, 1, 0.5176471, 0, 1,
-1.341933, 0.2055987, -0.1696429, 1, 0.5215687, 0, 1,
-1.339235, -1.018869, -1.161343, 1, 0.5294118, 0, 1,
-1.327456, -1.233841, -0.1700452, 1, 0.5333334, 0, 1,
-1.296639, 0.8830453, -1.795659, 1, 0.5411765, 0, 1,
-1.291526, 0.09403902, -1.443973, 1, 0.5450981, 0, 1,
-1.288218, 0.3577964, -1.175918, 1, 0.5529412, 0, 1,
-1.284472, -0.3151086, -2.355698, 1, 0.5568628, 0, 1,
-1.267991, -1.604158, -1.550608, 1, 0.5647059, 0, 1,
-1.26794, -0.3117907, -0.7047303, 1, 0.5686275, 0, 1,
-1.267851, -0.8784113, -2.322144, 1, 0.5764706, 0, 1,
-1.265031, -1.18368, -1.197859, 1, 0.5803922, 0, 1,
-1.255162, 0.6968988, 0.04182874, 1, 0.5882353, 0, 1,
-1.254769, -1.113212, -2.704384, 1, 0.5921569, 0, 1,
-1.246703, -0.4459205, -1.646727, 1, 0.6, 0, 1,
-1.245268, 0.2572035, -1.693614, 1, 0.6078432, 0, 1,
-1.24048, -1.82614, -4.188288, 1, 0.6117647, 0, 1,
-1.240042, 0.2588924, -2.003844, 1, 0.6196079, 0, 1,
-1.23608, -0.5131269, -0.9043516, 1, 0.6235294, 0, 1,
-1.227851, 2.888452, 0.9214056, 1, 0.6313726, 0, 1,
-1.227224, -0.830785, -2.899648, 1, 0.6352941, 0, 1,
-1.224875, 0.7603619, 1.638231, 1, 0.6431373, 0, 1,
-1.224745, -1.012413, -2.894253, 1, 0.6470588, 0, 1,
-1.22358, -0.7832288, -1.332927, 1, 0.654902, 0, 1,
-1.221982, 0.2186998, -0.5929414, 1, 0.6588235, 0, 1,
-1.221782, 1.324497, -1.509846, 1, 0.6666667, 0, 1,
-1.220688, 0.7586982, -1.905036, 1, 0.6705883, 0, 1,
-1.188394, -0.3107693, -2.246057, 1, 0.6784314, 0, 1,
-1.187732, 1.369455, -0.01213862, 1, 0.682353, 0, 1,
-1.185778, 0.06227756, -1.307501, 1, 0.6901961, 0, 1,
-1.183488, -2.049937, -2.310188, 1, 0.6941177, 0, 1,
-1.182173, 0.1832086, 0.1240689, 1, 0.7019608, 0, 1,
-1.177595, -0.6048822, -3.226464, 1, 0.7098039, 0, 1,
-1.177283, 1.353285, -1.391633, 1, 0.7137255, 0, 1,
-1.175276, 0.7287408, -1.52334, 1, 0.7215686, 0, 1,
-1.173164, 0.270722, -1.99624, 1, 0.7254902, 0, 1,
-1.16993, -0.9512994, -1.69279, 1, 0.7333333, 0, 1,
-1.162519, 1.210804, -0.9801176, 1, 0.7372549, 0, 1,
-1.158637, 1.131214, -1.957682, 1, 0.7450981, 0, 1,
-1.151022, -1.492382, -3.081506, 1, 0.7490196, 0, 1,
-1.146828, -0.03479246, -2.772654, 1, 0.7568628, 0, 1,
-1.141834, 0.9630336, 0.06748113, 1, 0.7607843, 0, 1,
-1.131195, 1.447653, -2.232909, 1, 0.7686275, 0, 1,
-1.121476, -1.338181, -2.9656, 1, 0.772549, 0, 1,
-1.118323, -0.2781823, -1.86301, 1, 0.7803922, 0, 1,
-1.116709, 3.211715, 0.6069157, 1, 0.7843137, 0, 1,
-1.110233, -0.754582, -2.870378, 1, 0.7921569, 0, 1,
-1.103749, -1.067468, -2.635287, 1, 0.7960784, 0, 1,
-1.100464, -0.6232443, -1.819455, 1, 0.8039216, 0, 1,
-1.098946, -0.5205111, -2.317402, 1, 0.8117647, 0, 1,
-1.098903, -1.339424, -1.104982, 1, 0.8156863, 0, 1,
-1.093547, -0.3589006, -1.955337, 1, 0.8235294, 0, 1,
-1.091769, 0.8986433, -0.1584305, 1, 0.827451, 0, 1,
-1.080949, 0.7222486, -1.983635, 1, 0.8352941, 0, 1,
-1.077699, 1.856734, -0.9736853, 1, 0.8392157, 0, 1,
-1.076121, -0.04809688, 0.1529894, 1, 0.8470588, 0, 1,
-1.058458, -0.9320295, -1.659262, 1, 0.8509804, 0, 1,
-1.055214, -0.1814551, -1.181037, 1, 0.8588235, 0, 1,
-1.053539, -0.3631482, -2.496324, 1, 0.8627451, 0, 1,
-1.050342, 0.8523498, -1.913453, 1, 0.8705882, 0, 1,
-1.040037, 0.3559709, -0.8889884, 1, 0.8745098, 0, 1,
-1.033216, -0.1897825, -1.500414, 1, 0.8823529, 0, 1,
-1.027642, 0.2786376, 0.5826223, 1, 0.8862745, 0, 1,
-1.023844, -0.8018917, -3.210639, 1, 0.8941177, 0, 1,
-1.021309, -0.9852372, -2.245272, 1, 0.8980392, 0, 1,
-1.019805, -0.3337308, -0.1592548, 1, 0.9058824, 0, 1,
-1.013509, 0.9275592, -1.95233, 1, 0.9137255, 0, 1,
-1.008295, 1.799316, -1.021051, 1, 0.9176471, 0, 1,
-1.002554, -1.610038, -3.509933, 1, 0.9254902, 0, 1,
-1.000799, 0.9953441, -2.056928, 1, 0.9294118, 0, 1,
-0.9948003, -0.03812995, -1.772012, 1, 0.9372549, 0, 1,
-0.9938545, 0.8019637, -1.554482, 1, 0.9411765, 0, 1,
-0.9899905, -0.4715846, -0.7493827, 1, 0.9490196, 0, 1,
-0.9895746, -0.0595741, -0.5708075, 1, 0.9529412, 0, 1,
-0.988834, -0.3564809, -2.083, 1, 0.9607843, 0, 1,
-0.9659168, 2.908497, -1.867068, 1, 0.9647059, 0, 1,
-0.9625259, 1.473508, -0.4353113, 1, 0.972549, 0, 1,
-0.9601894, 0.2404074, -1.980355, 1, 0.9764706, 0, 1,
-0.9594685, -0.03470895, -1.409368, 1, 0.9843137, 0, 1,
-0.9593367, 0.3186038, -0.5848613, 1, 0.9882353, 0, 1,
-0.9589496, 0.2495311, -1.493899, 1, 0.9960784, 0, 1,
-0.954591, 0.6492206, -1.726953, 0.9960784, 1, 0, 1,
-0.9522695, 0.6212109, -0.6896494, 0.9921569, 1, 0, 1,
-0.9499841, -0.5422367, -2.279022, 0.9843137, 1, 0, 1,
-0.9450908, 0.6847484, -1.069863, 0.9803922, 1, 0, 1,
-0.9385535, 0.9735247, -1.30851, 0.972549, 1, 0, 1,
-0.9358553, -0.2400012, -1.818436, 0.9686275, 1, 0, 1,
-0.9313971, -1.293766, -2.335711, 0.9607843, 1, 0, 1,
-0.9288056, -0.7617079, -2.86573, 0.9568627, 1, 0, 1,
-0.9262765, -0.2797435, -1.928797, 0.9490196, 1, 0, 1,
-0.924086, -1.70769, -3.106029, 0.945098, 1, 0, 1,
-0.919885, -1.065592, -1.92994, 0.9372549, 1, 0, 1,
-0.9194869, 0.2206304, -0.4573024, 0.9333333, 1, 0, 1,
-0.9164323, -0.6408605, -0.1871069, 0.9254902, 1, 0, 1,
-0.9142364, 0.6550576, -1.213622, 0.9215686, 1, 0, 1,
-0.9114908, 0.9406532, -1.305757, 0.9137255, 1, 0, 1,
-0.9091209, 0.7603176, -1.493038, 0.9098039, 1, 0, 1,
-0.8938968, -0.4719736, -0.8169791, 0.9019608, 1, 0, 1,
-0.8865057, -0.1134842, -2.409437, 0.8941177, 1, 0, 1,
-0.8820884, 0.06777053, -3.293216, 0.8901961, 1, 0, 1,
-0.8817454, -0.2339406, -2.23125, 0.8823529, 1, 0, 1,
-0.878718, -0.2104092, -3.60911, 0.8784314, 1, 0, 1,
-0.8742054, 1.493559, -1.128935, 0.8705882, 1, 0, 1,
-0.8709999, 0.1237237, -1.387548, 0.8666667, 1, 0, 1,
-0.8681673, -2.105069, -3.205098, 0.8588235, 1, 0, 1,
-0.8671979, -1.26541, -1.535957, 0.854902, 1, 0, 1,
-0.8635031, 1.718196, -1.033049, 0.8470588, 1, 0, 1,
-0.8632199, -0.5636309, -2.310022, 0.8431373, 1, 0, 1,
-0.8593612, 1.067298, -1.112672, 0.8352941, 1, 0, 1,
-0.8537114, 2.008629, -0.2640585, 0.8313726, 1, 0, 1,
-0.8507379, -2.11639, -2.35632, 0.8235294, 1, 0, 1,
-0.8499033, -0.8136881, -0.3212433, 0.8196079, 1, 0, 1,
-0.8436636, 0.3837712, -0.2611131, 0.8117647, 1, 0, 1,
-0.8392007, -0.1303101, -1.903269, 0.8078431, 1, 0, 1,
-0.8368833, 0.8170481, -0.468363, 0.8, 1, 0, 1,
-0.8336474, -0.2182317, -1.668701, 0.7921569, 1, 0, 1,
-0.8251328, -0.3579112, -0.3718074, 0.7882353, 1, 0, 1,
-0.8191192, 1.67928, -0.3473739, 0.7803922, 1, 0, 1,
-0.8109856, -0.4879235, -1.970975, 0.7764706, 1, 0, 1,
-0.8108827, 0.7039218, -1.112004, 0.7686275, 1, 0, 1,
-0.8082405, 0.4668349, -2.363041, 0.7647059, 1, 0, 1,
-0.8041976, -0.3327681, -0.355757, 0.7568628, 1, 0, 1,
-0.7959229, 0.4559259, -0.2915593, 0.7529412, 1, 0, 1,
-0.7935727, 0.8604325, -0.7067931, 0.7450981, 1, 0, 1,
-0.7927032, -0.2175242, -3.264902, 0.7411765, 1, 0, 1,
-0.7915893, -0.1754646, -2.246075, 0.7333333, 1, 0, 1,
-0.7896763, -0.6247657, -3.512632, 0.7294118, 1, 0, 1,
-0.786109, 0.2385265, 0.1027097, 0.7215686, 1, 0, 1,
-0.7828857, -1.218373, -2.866584, 0.7176471, 1, 0, 1,
-0.7766478, 0.0563195, -0.9964587, 0.7098039, 1, 0, 1,
-0.769968, -0.5494859, -4.722367, 0.7058824, 1, 0, 1,
-0.7687976, 0.1348284, -1.619045, 0.6980392, 1, 0, 1,
-0.7672037, 0.09329712, -0.2861645, 0.6901961, 1, 0, 1,
-0.7654178, -0.8313887, -2.556336, 0.6862745, 1, 0, 1,
-0.7618935, 0.9144762, -0.09096806, 0.6784314, 1, 0, 1,
-0.7603128, -1.851554, -2.39457, 0.6745098, 1, 0, 1,
-0.7565926, -2.055911, -4.86149, 0.6666667, 1, 0, 1,
-0.7521886, 1.033419, -1.646287, 0.6627451, 1, 0, 1,
-0.7450554, -1.105263, -1.934229, 0.654902, 1, 0, 1,
-0.7417472, -0.2128924, -3.239885, 0.6509804, 1, 0, 1,
-0.7388481, -0.01270922, -2.008092, 0.6431373, 1, 0, 1,
-0.7385741, 1.696901, -0.8226736, 0.6392157, 1, 0, 1,
-0.7347678, -0.1386001, -0.5161345, 0.6313726, 1, 0, 1,
-0.7289565, -0.390581, -0.3616734, 0.627451, 1, 0, 1,
-0.7285084, 0.509916, -1.47995, 0.6196079, 1, 0, 1,
-0.7242507, 0.3989169, -1.570452, 0.6156863, 1, 0, 1,
-0.723835, 0.416832, -1.129934, 0.6078432, 1, 0, 1,
-0.7222757, -0.9621389, -1.130601, 0.6039216, 1, 0, 1,
-0.7204367, -0.09818149, -1.814578, 0.5960785, 1, 0, 1,
-0.7192907, -0.995024, -3.035211, 0.5882353, 1, 0, 1,
-0.718819, -0.1382176, -1.337808, 0.5843138, 1, 0, 1,
-0.7147073, -0.6083482, -2.563873, 0.5764706, 1, 0, 1,
-0.7049786, -0.2800823, -0.824993, 0.572549, 1, 0, 1,
-0.7039229, -0.3195985, -3.014688, 0.5647059, 1, 0, 1,
-0.7017078, 0.07522239, -1.916334, 0.5607843, 1, 0, 1,
-0.7015676, 1.32779, -0.295065, 0.5529412, 1, 0, 1,
-0.6939261, -0.04777089, -2.575087, 0.5490196, 1, 0, 1,
-0.6865277, -0.9739618, -0.4672723, 0.5411765, 1, 0, 1,
-0.685645, -0.004245665, -0.8866853, 0.5372549, 1, 0, 1,
-0.6830438, -1.213151, -3.063407, 0.5294118, 1, 0, 1,
-0.6828534, 0.3361116, -0.6984298, 0.5254902, 1, 0, 1,
-0.6799839, 0.4701537, -2.438298, 0.5176471, 1, 0, 1,
-0.6796528, 0.42089, -1.666453, 0.5137255, 1, 0, 1,
-0.6723698, -0.6448096, -2.269694, 0.5058824, 1, 0, 1,
-0.6722162, 0.4775309, -1.894197, 0.5019608, 1, 0, 1,
-0.6704717, 0.8725941, 0.146254, 0.4941176, 1, 0, 1,
-0.6637256, 0.8524861, 0.7512733, 0.4862745, 1, 0, 1,
-0.6635519, 0.899402, 0.8435027, 0.4823529, 1, 0, 1,
-0.6605852, 1.774977, 0.7309762, 0.4745098, 1, 0, 1,
-0.657337, -1.156749, -3.141299, 0.4705882, 1, 0, 1,
-0.6530108, 2.059194, 0.1165932, 0.4627451, 1, 0, 1,
-0.6517642, 0.2833517, -0.9921903, 0.4588235, 1, 0, 1,
-0.6506331, -0.1620672, -3.922263, 0.4509804, 1, 0, 1,
-0.6483967, -2.036783, -2.412991, 0.4470588, 1, 0, 1,
-0.6438226, -1.091349, -1.039204, 0.4392157, 1, 0, 1,
-0.6417138, -0.4640526, -2.755212, 0.4352941, 1, 0, 1,
-0.6388795, -0.5236623, -3.106643, 0.427451, 1, 0, 1,
-0.6341119, 0.8969616, -1.20413, 0.4235294, 1, 0, 1,
-0.6326452, -2.041906, -1.667469, 0.4156863, 1, 0, 1,
-0.6317121, 0.6219993, 0.7603716, 0.4117647, 1, 0, 1,
-0.6270857, -1.535269, -4.73443, 0.4039216, 1, 0, 1,
-0.6266534, -0.08736288, -2.380809, 0.3960784, 1, 0, 1,
-0.6230708, -0.8786844, -1.799832, 0.3921569, 1, 0, 1,
-0.622881, 0.4568492, -1.650324, 0.3843137, 1, 0, 1,
-0.620123, -1.129461, -2.529998, 0.3803922, 1, 0, 1,
-0.6152816, 1.214433, -0.8445585, 0.372549, 1, 0, 1,
-0.6132392, 1.726332, 0.243925, 0.3686275, 1, 0, 1,
-0.6059442, -1.054444, -1.561738, 0.3607843, 1, 0, 1,
-0.596543, 0.9903162, 0.6922948, 0.3568628, 1, 0, 1,
-0.5964145, 1.052997, 0.6792453, 0.3490196, 1, 0, 1,
-0.5930423, 1.733039, -1.679002, 0.345098, 1, 0, 1,
-0.5870532, 0.5636767, -1.560641, 0.3372549, 1, 0, 1,
-0.586678, 0.5561057, -0.3749342, 0.3333333, 1, 0, 1,
-0.5851917, -1.580384, -2.348811, 0.3254902, 1, 0, 1,
-0.5850384, 1.003303, -0.3260532, 0.3215686, 1, 0, 1,
-0.5841612, 1.100725, -0.3224884, 0.3137255, 1, 0, 1,
-0.5808943, 1.53436, 0.2987737, 0.3098039, 1, 0, 1,
-0.5749429, 0.3827039, -1.281763, 0.3019608, 1, 0, 1,
-0.5728444, 0.703662, 0.1770655, 0.2941177, 1, 0, 1,
-0.5691474, 0.3129928, -1.983319, 0.2901961, 1, 0, 1,
-0.5685417, 0.6684009, -1.332087, 0.282353, 1, 0, 1,
-0.5672259, -0.1728451, -2.315472, 0.2784314, 1, 0, 1,
-0.5658786, -0.5302978, -3.883426, 0.2705882, 1, 0, 1,
-0.5652065, 0.525652, -0.6625968, 0.2666667, 1, 0, 1,
-0.5620054, 0.197681, -1.842242, 0.2588235, 1, 0, 1,
-0.5601734, -0.4889195, -2.514836, 0.254902, 1, 0, 1,
-0.5600997, -0.9868333, -2.365553, 0.2470588, 1, 0, 1,
-0.5556812, 0.711808, 0.2779873, 0.2431373, 1, 0, 1,
-0.5518824, 0.8599081, 0.3157042, 0.2352941, 1, 0, 1,
-0.5438468, -0.0594132, -2.802011, 0.2313726, 1, 0, 1,
-0.5430811, 1.54123, -0.1815334, 0.2235294, 1, 0, 1,
-0.5330254, -0.9600977, -2.317998, 0.2196078, 1, 0, 1,
-0.5276589, 2.345416, 0.004880933, 0.2117647, 1, 0, 1,
-0.5256501, 0.4208518, -0.9087127, 0.2078431, 1, 0, 1,
-0.5249382, -1.259858, -3.538147, 0.2, 1, 0, 1,
-0.521849, 0.1683346, -0.7255455, 0.1921569, 1, 0, 1,
-0.5157867, -1.301174, -2.103137, 0.1882353, 1, 0, 1,
-0.5100605, -0.6976033, -2.134467, 0.1803922, 1, 0, 1,
-0.5065439, -0.728505, -2.27135, 0.1764706, 1, 0, 1,
-0.5031003, 0.7267677, -0.8051511, 0.1686275, 1, 0, 1,
-0.5010327, 1.587192, -0.1360269, 0.1647059, 1, 0, 1,
-0.4948408, -0.06883871, -0.06808217, 0.1568628, 1, 0, 1,
-0.4927946, 1.245968, -1.053963, 0.1529412, 1, 0, 1,
-0.4904554, -0.6004192, -3.551815, 0.145098, 1, 0, 1,
-0.4826489, 1.911847, 0.9957558, 0.1411765, 1, 0, 1,
-0.4822543, 1.745906, 0.03065722, 0.1333333, 1, 0, 1,
-0.4820978, 0.01289838, -1.558946, 0.1294118, 1, 0, 1,
-0.4796228, 0.8923751, -1.992586, 0.1215686, 1, 0, 1,
-0.4794572, -0.6565039, -2.925828, 0.1176471, 1, 0, 1,
-0.4756397, -1.245661, -3.471447, 0.1098039, 1, 0, 1,
-0.473455, 0.441561, 0.5080909, 0.1058824, 1, 0, 1,
-0.4721185, -1.304589, -1.697306, 0.09803922, 1, 0, 1,
-0.4660123, -1.248644, -0.8020709, 0.09019608, 1, 0, 1,
-0.4530114, 0.7717536, -1.212009, 0.08627451, 1, 0, 1,
-0.4512175, -0.4643577, -2.889183, 0.07843138, 1, 0, 1,
-0.4508357, -2.495625, -3.266241, 0.07450981, 1, 0, 1,
-0.4483869, 1.011675, -0.5221331, 0.06666667, 1, 0, 1,
-0.4479313, 0.2412791, -2.866343, 0.0627451, 1, 0, 1,
-0.4446658, -0.588123, -1.669888, 0.05490196, 1, 0, 1,
-0.4435287, -1.258095, -2.653886, 0.05098039, 1, 0, 1,
-0.4374415, -1.047911, -3.19366, 0.04313726, 1, 0, 1,
-0.436595, -0.4136294, -2.088378, 0.03921569, 1, 0, 1,
-0.4355589, -2.370208, -3.43872, 0.03137255, 1, 0, 1,
-0.435525, -0.3947854, -1.256821, 0.02745098, 1, 0, 1,
-0.4317903, 0.3609074, -1.098606, 0.01960784, 1, 0, 1,
-0.4308511, 0.3965466, -0.01915653, 0.01568628, 1, 0, 1,
-0.4280547, 1.355545, 0.5941236, 0.007843138, 1, 0, 1,
-0.4241683, -0.5306337, -2.327813, 0.003921569, 1, 0, 1,
-0.4239938, 2.346666, -0.6415509, 0, 1, 0.003921569, 1,
-0.4219235, 0.5690017, -1.381744, 0, 1, 0.01176471, 1,
-0.4196913, -0.3820721, -3.505188, 0, 1, 0.01568628, 1,
-0.4190987, -2.630332, -3.024015, 0, 1, 0.02352941, 1,
-0.4190616, 0.9216418, -0.1931855, 0, 1, 0.02745098, 1,
-0.4176147, 0.05995957, -2.438761, 0, 1, 0.03529412, 1,
-0.4165106, -1.473424, -2.803073, 0, 1, 0.03921569, 1,
-0.4143058, 0.5390528, -0.259231, 0, 1, 0.04705882, 1,
-0.4053191, 1.745723, 0.3215065, 0, 1, 0.05098039, 1,
-0.4038095, -0.338549, -2.457984, 0, 1, 0.05882353, 1,
-0.4029935, 0.4545892, -1.60449, 0, 1, 0.0627451, 1,
-0.401513, -0.1747027, -1.53001, 0, 1, 0.07058824, 1,
-0.401149, -0.08835682, -0.8678532, 0, 1, 0.07450981, 1,
-0.3993876, -0.8228437, -2.062855, 0, 1, 0.08235294, 1,
-0.3978307, -0.9303783, -3.909225, 0, 1, 0.08627451, 1,
-0.3959095, 0.1539253, -1.298414, 0, 1, 0.09411765, 1,
-0.392558, 3.19811, 0.619154, 0, 1, 0.1019608, 1,
-0.3904936, -0.7031181, -1.482209, 0, 1, 0.1058824, 1,
-0.3880133, -1.096787, -2.928948, 0, 1, 0.1137255, 1,
-0.3855798, -0.1509569, -1.834257, 0, 1, 0.1176471, 1,
-0.3823712, -1.584345, -2.728343, 0, 1, 0.1254902, 1,
-0.3815089, -0.5692829, -2.748019, 0, 1, 0.1294118, 1,
-0.3786141, -0.9340644, -3.477634, 0, 1, 0.1372549, 1,
-0.3691295, 1.185638, -0.2635432, 0, 1, 0.1411765, 1,
-0.3666616, -0.7719684, -2.145017, 0, 1, 0.1490196, 1,
-0.3616736, -0.1016935, -3.866791, 0, 1, 0.1529412, 1,
-0.3607101, -0.5714673, 0.01751403, 0, 1, 0.1607843, 1,
-0.3600372, 1.475999, 0.7286876, 0, 1, 0.1647059, 1,
-0.3588959, -0.6327466, -1.976167, 0, 1, 0.172549, 1,
-0.3586476, -0.08342578, -2.62253, 0, 1, 0.1764706, 1,
-0.3585569, -0.3584809, -2.678084, 0, 1, 0.1843137, 1,
-0.3581042, -0.01985068, -1.430633, 0, 1, 0.1882353, 1,
-0.3549538, 1.476389, -0.5787147, 0, 1, 0.1960784, 1,
-0.3541178, -0.03001871, -1.126803, 0, 1, 0.2039216, 1,
-0.3501146, -1.392013, -3.087098, 0, 1, 0.2078431, 1,
-0.3451518, 0.7096305, -1.303658, 0, 1, 0.2156863, 1,
-0.341651, -0.8189446, -3.808074, 0, 1, 0.2196078, 1,
-0.3297088, 0.06172384, -0.4954605, 0, 1, 0.227451, 1,
-0.3256192, 0.4186677, 0.06942239, 0, 1, 0.2313726, 1,
-0.3217902, -1.381521, -1.804648, 0, 1, 0.2392157, 1,
-0.3216694, -0.3234507, -1.050488, 0, 1, 0.2431373, 1,
-0.3156063, -0.4702196, -1.709566, 0, 1, 0.2509804, 1,
-0.3123334, -0.3046825, -3.745302, 0, 1, 0.254902, 1,
-0.310634, 1.153623, 1.302447, 0, 1, 0.2627451, 1,
-0.3105252, -1.256078, -2.4474, 0, 1, 0.2666667, 1,
-0.3041694, -1.339776, -1.087206, 0, 1, 0.2745098, 1,
-0.3041638, 0.4009731, 1.737877, 0, 1, 0.2784314, 1,
-0.3038081, 0.3568363, -1.011822, 0, 1, 0.2862745, 1,
-0.2965201, -1.014212, -0.9862032, 0, 1, 0.2901961, 1,
-0.2946602, 0.05946103, -2.376099, 0, 1, 0.2980392, 1,
-0.2944389, 0.01863235, -0.7073913, 0, 1, 0.3058824, 1,
-0.2920369, -0.1163119, -1.732939, 0, 1, 0.3098039, 1,
-0.2912036, 1.317471, 0.5123145, 0, 1, 0.3176471, 1,
-0.2892161, -0.2742582, -0.6982971, 0, 1, 0.3215686, 1,
-0.2810808, -0.5650954, -1.709755, 0, 1, 0.3294118, 1,
-0.2809382, -0.2958045, -1.20411, 0, 1, 0.3333333, 1,
-0.2798732, 1.236799, 0.6391362, 0, 1, 0.3411765, 1,
-0.2704475, -1.768367, -1.456757, 0, 1, 0.345098, 1,
-0.2676573, 0.6567137, -2.295758, 0, 1, 0.3529412, 1,
-0.2675295, 0.5977249, 0.5752134, 0, 1, 0.3568628, 1,
-0.267363, 0.4312271, -0.5966608, 0, 1, 0.3647059, 1,
-0.2644917, 0.8494509, -0.1707406, 0, 1, 0.3686275, 1,
-0.263786, 0.7817611, 0.08954348, 0, 1, 0.3764706, 1,
-0.2610292, -0.04104474, -2.099213, 0, 1, 0.3803922, 1,
-0.2594507, -2.088312, -3.599645, 0, 1, 0.3882353, 1,
-0.258135, -0.9826191, -4.390919, 0, 1, 0.3921569, 1,
-0.2564652, -1.245762, -4.037175, 0, 1, 0.4, 1,
-0.2546052, -1.289821, -2.613237, 0, 1, 0.4078431, 1,
-0.2451319, -0.1166961, -1.700844, 0, 1, 0.4117647, 1,
-0.244852, 0.3358944, -0.3460907, 0, 1, 0.4196078, 1,
-0.2409038, 0.01978552, 0.06950308, 0, 1, 0.4235294, 1,
-0.2398905, -0.1773242, -2.513904, 0, 1, 0.4313726, 1,
-0.2385351, 0.8823671, 0.2184626, 0, 1, 0.4352941, 1,
-0.2380812, -0.9138238, -4.039286, 0, 1, 0.4431373, 1,
-0.2373611, -0.06561714, -2.037593, 0, 1, 0.4470588, 1,
-0.2340506, -0.1135724, 0.5443192, 0, 1, 0.454902, 1,
-0.233183, -0.3123317, -0.6336043, 0, 1, 0.4588235, 1,
-0.2328793, 0.5689781, 0.2120115, 0, 1, 0.4666667, 1,
-0.2327992, -0.704901, -2.308729, 0, 1, 0.4705882, 1,
-0.2294726, -1.126146, -3.480322, 0, 1, 0.4784314, 1,
-0.2284774, 1.584262, 0.2375667, 0, 1, 0.4823529, 1,
-0.2263851, 1.199413, 0.5559763, 0, 1, 0.4901961, 1,
-0.2263363, -0.2579545, -1.920015, 0, 1, 0.4941176, 1,
-0.2249417, 0.6609808, 0.9543673, 0, 1, 0.5019608, 1,
-0.2234478, -2.379432, -1.779903, 0, 1, 0.509804, 1,
-0.2213709, -1.589598, -3.676101, 0, 1, 0.5137255, 1,
-0.2192553, -1.110747, -2.274706, 0, 1, 0.5215687, 1,
-0.2186939, -0.324764, -3.342301, 0, 1, 0.5254902, 1,
-0.2165723, -0.8547091, -2.104919, 0, 1, 0.5333334, 1,
-0.2123353, -0.2471319, -2.61074, 0, 1, 0.5372549, 1,
-0.2112825, 0.4998853, 0.0293733, 0, 1, 0.5450981, 1,
-0.2093352, 0.6425472, 0.8565918, 0, 1, 0.5490196, 1,
-0.2080588, -2.115581, -2.917935, 0, 1, 0.5568628, 1,
-0.2069603, 0.08713569, -1.232221, 0, 1, 0.5607843, 1,
-0.2018678, -0.4442016, -3.395444, 0, 1, 0.5686275, 1,
-0.1978501, 1.058144, -0.6890494, 0, 1, 0.572549, 1,
-0.196441, -0.4546257, -3.333718, 0, 1, 0.5803922, 1,
-0.1936319, -0.1259372, -1.783512, 0, 1, 0.5843138, 1,
-0.1913956, -1.032266, -2.001104, 0, 1, 0.5921569, 1,
-0.1896454, -0.01036808, -2.438106, 0, 1, 0.5960785, 1,
-0.1875226, 0.4917296, -0.001399264, 0, 1, 0.6039216, 1,
-0.187426, 0.4140219, 0.7885698, 0, 1, 0.6117647, 1,
-0.1868911, 0.588685, 0.2858739, 0, 1, 0.6156863, 1,
-0.1860351, -0.7943085, -2.657716, 0, 1, 0.6235294, 1,
-0.1858556, 0.6252452, -1.219898, 0, 1, 0.627451, 1,
-0.180805, -0.3943582, -4.266606, 0, 1, 0.6352941, 1,
-0.1805627, 0.4862905, -1.637407, 0, 1, 0.6392157, 1,
-0.1781603, 1.08165, 1.307069, 0, 1, 0.6470588, 1,
-0.1729038, 0.1204856, -0.7057542, 0, 1, 0.6509804, 1,
-0.1695759, 0.2403484, 1.03799, 0, 1, 0.6588235, 1,
-0.1675166, -1.010083, -1.763581, 0, 1, 0.6627451, 1,
-0.162147, -0.5295575, -1.908294, 0, 1, 0.6705883, 1,
-0.1567833, -0.3066827, -4.008376, 0, 1, 0.6745098, 1,
-0.1551203, -2.698023, -2.545185, 0, 1, 0.682353, 1,
-0.1483652, 0.8760421, -0.6791359, 0, 1, 0.6862745, 1,
-0.1477228, 1.454507, -1.593595, 0, 1, 0.6941177, 1,
-0.1471181, -0.3488911, -2.492925, 0, 1, 0.7019608, 1,
-0.1470682, -0.7125098, -2.984105, 0, 1, 0.7058824, 1,
-0.1437196, 0.3037691, -0.2494244, 0, 1, 0.7137255, 1,
-0.1409426, -0.3502701, -2.592581, 0, 1, 0.7176471, 1,
-0.1395454, -0.3333495, -2.928314, 0, 1, 0.7254902, 1,
-0.1314117, -0.6587754, -2.760585, 0, 1, 0.7294118, 1,
-0.1313525, -0.3721448, -4.32679, 0, 1, 0.7372549, 1,
-0.1281113, 0.8266364, 0.6822591, 0, 1, 0.7411765, 1,
-0.1221231, -0.01510256, -0.4434735, 0, 1, 0.7490196, 1,
-0.1127539, -0.2999822, -2.82491, 0, 1, 0.7529412, 1,
-0.103621, -0.4289455, -2.667289, 0, 1, 0.7607843, 1,
-0.1001206, 0.439678, -2.277776, 0, 1, 0.7647059, 1,
-0.09997938, 1.158, -0.8550742, 0, 1, 0.772549, 1,
-0.08803485, 0.8635077, 0.3769044, 0, 1, 0.7764706, 1,
-0.08577927, -0.8390762, -3.326214, 0, 1, 0.7843137, 1,
-0.08518564, -0.0397968, -3.360607, 0, 1, 0.7882353, 1,
-0.08205341, 0.2808289, 0.8236566, 0, 1, 0.7960784, 1,
-0.07593258, -2.214933, -4.019127, 0, 1, 0.8039216, 1,
-0.07415866, -0.02874069, -2.819303, 0, 1, 0.8078431, 1,
-0.07044374, 0.421696, -1.471883, 0, 1, 0.8156863, 1,
-0.06331747, 0.196389, 0.1708706, 0, 1, 0.8196079, 1,
-0.06236298, 0.09208161, -0.8441066, 0, 1, 0.827451, 1,
-0.06066057, -1.139905, -1.494213, 0, 1, 0.8313726, 1,
-0.05984, -0.8774816, -4.379718, 0, 1, 0.8392157, 1,
-0.05916468, -0.6151859, -3.087766, 0, 1, 0.8431373, 1,
-0.05907423, 1.218307, -0.5070314, 0, 1, 0.8509804, 1,
-0.05811096, 0.2322236, -0.5535462, 0, 1, 0.854902, 1,
-0.05765996, 0.1838804, -0.7788765, 0, 1, 0.8627451, 1,
-0.05652244, -2.217235, -3.128153, 0, 1, 0.8666667, 1,
-0.05520049, -0.8111812, -1.733659, 0, 1, 0.8745098, 1,
-0.05018935, -0.1016917, -1.69501, 0, 1, 0.8784314, 1,
-0.04665062, -0.4525952, -2.641655, 0, 1, 0.8862745, 1,
-0.04565683, -0.9333159, -2.863874, 0, 1, 0.8901961, 1,
-0.04468793, -0.2280646, -2.723353, 0, 1, 0.8980392, 1,
-0.04434043, 0.2557604, 0.3644287, 0, 1, 0.9058824, 1,
-0.03813709, 0.8565199, -1.579068, 0, 1, 0.9098039, 1,
-0.03574399, 0.4169059, -0.3599602, 0, 1, 0.9176471, 1,
-0.03177766, -0.8982584, -3.193102, 0, 1, 0.9215686, 1,
-0.02469262, -0.5948187, -1.885391, 0, 1, 0.9294118, 1,
-0.02355635, -0.5436057, -4.727822, 0, 1, 0.9333333, 1,
-0.02347183, -0.01545321, -2.610839, 0, 1, 0.9411765, 1,
-0.02342947, -0.1341666, -5.371722, 0, 1, 0.945098, 1,
-0.02218263, 3.068474, 0.569782, 0, 1, 0.9529412, 1,
-0.01978479, 0.6293662, 0.3466593, 0, 1, 0.9568627, 1,
-0.007677146, 0.08279556, 0.7857976, 0, 1, 0.9647059, 1,
-0.005132193, 1.212751, -1.131186, 0, 1, 0.9686275, 1,
-0.005062036, 0.1295209, -1.40406, 0, 1, 0.9764706, 1,
-0.003469638, 0.06051065, 0.9057344, 0, 1, 0.9803922, 1,
-0.00227093, -0.4052671, -4.12665, 0, 1, 0.9882353, 1,
0.0004230608, -1.543404, 2.100644, 0, 1, 0.9921569, 1,
0.009628768, -0.13817, 2.990053, 0, 1, 1, 1,
0.01030546, -0.01697579, 3.286991, 0, 0.9921569, 1, 1,
0.01136203, -0.09736548, 3.082664, 0, 0.9882353, 1, 1,
0.01213925, 1.681144, -1.968992, 0, 0.9803922, 1, 1,
0.01389015, 1.299464, -1.004669, 0, 0.9764706, 1, 1,
0.01677439, -1.130011, 2.46158, 0, 0.9686275, 1, 1,
0.01770168, 1.198507, -0.878141, 0, 0.9647059, 1, 1,
0.01943144, -1.39125, 5.139885, 0, 0.9568627, 1, 1,
0.02144933, -0.5646697, 3.238441, 0, 0.9529412, 1, 1,
0.0254202, -1.211772, 1.65522, 0, 0.945098, 1, 1,
0.02774479, 0.6941358, -2.028464, 0, 0.9411765, 1, 1,
0.03674801, 1.993977, 0.05846231, 0, 0.9333333, 1, 1,
0.04293514, -0.7004282, 3.88453, 0, 0.9294118, 1, 1,
0.04720557, -0.17215, 2.716966, 0, 0.9215686, 1, 1,
0.04732174, 0.2017862, 1.754813, 0, 0.9176471, 1, 1,
0.04734155, -0.1428796, 3.829378, 0, 0.9098039, 1, 1,
0.04925917, 0.3194716, -1.502917, 0, 0.9058824, 1, 1,
0.05481236, 2.586806, -0.1552971, 0, 0.8980392, 1, 1,
0.05895052, -1.827664, 5.22965, 0, 0.8901961, 1, 1,
0.05930358, -0.504438, 0.823678, 0, 0.8862745, 1, 1,
0.06288581, 0.6458646, -1.112737, 0, 0.8784314, 1, 1,
0.06613795, 1.593122, 0.01476607, 0, 0.8745098, 1, 1,
0.0669998, -1.049417, 3.574547, 0, 0.8666667, 1, 1,
0.06862873, -1.399294, 3.149289, 0, 0.8627451, 1, 1,
0.06985679, -1.026866, 1.77672, 0, 0.854902, 1, 1,
0.07150236, 0.697758, -0.7177147, 0, 0.8509804, 1, 1,
0.07559038, -1.063751, 1.709783, 0, 0.8431373, 1, 1,
0.07644957, 0.6864017, 1.934922, 0, 0.8392157, 1, 1,
0.08169042, -1.056491, 3.839874, 0, 0.8313726, 1, 1,
0.0865739, -0.8761804, 2.867496, 0, 0.827451, 1, 1,
0.09297366, -0.7065467, 1.74755, 0, 0.8196079, 1, 1,
0.09510629, 0.2698682, 1.518317, 0, 0.8156863, 1, 1,
0.1009812, -1.633601, 2.141945, 0, 0.8078431, 1, 1,
0.1013039, 0.2978638, 0.2040163, 0, 0.8039216, 1, 1,
0.1016183, 1.670967, -0.1994525, 0, 0.7960784, 1, 1,
0.1035764, -1.095408, 2.348535, 0, 0.7882353, 1, 1,
0.1070856, 0.1788999, 1.400831, 0, 0.7843137, 1, 1,
0.1096114, 0.6747596, 2.264255, 0, 0.7764706, 1, 1,
0.1107192, -0.4814411, 3.998558, 0, 0.772549, 1, 1,
0.1134077, -0.06736782, 0.8499509, 0, 0.7647059, 1, 1,
0.1144807, 1.140893, 1.250606, 0, 0.7607843, 1, 1,
0.1166332, -0.6864203, 3.497199, 0, 0.7529412, 1, 1,
0.1257573, 0.6105024, -0.4199483, 0, 0.7490196, 1, 1,
0.1270389, -0.1241063, 1.682204, 0, 0.7411765, 1, 1,
0.1282706, 0.1591875, 0.5691239, 0, 0.7372549, 1, 1,
0.1318676, -0.534126, 3.735714, 0, 0.7294118, 1, 1,
0.1351769, 0.2734902, -0.5216697, 0, 0.7254902, 1, 1,
0.1352852, -0.1693636, 4.574744, 0, 0.7176471, 1, 1,
0.1368023, 0.7124885, 0.2725315, 0, 0.7137255, 1, 1,
0.1412446, 0.383393, 1.356796, 0, 0.7058824, 1, 1,
0.1426919, -1.256167, 1.510478, 0, 0.6980392, 1, 1,
0.1439299, -0.3067615, 2.648138, 0, 0.6941177, 1, 1,
0.1444241, 0.3442785, -0.7665122, 0, 0.6862745, 1, 1,
0.1447759, -1.028373, 1.852081, 0, 0.682353, 1, 1,
0.1456837, -1.041535, 2.416282, 0, 0.6745098, 1, 1,
0.1544456, 0.1346577, 2.389899, 0, 0.6705883, 1, 1,
0.1556896, -0.8133245, 3.092647, 0, 0.6627451, 1, 1,
0.1576785, 1.891706, -1.879869, 0, 0.6588235, 1, 1,
0.1608038, -1.443735, 4.513594, 0, 0.6509804, 1, 1,
0.1638205, -0.476939, 2.845809, 0, 0.6470588, 1, 1,
0.1638279, 0.5777969, -0.9575155, 0, 0.6392157, 1, 1,
0.1704409, 0.8501996, 1.164642, 0, 0.6352941, 1, 1,
0.1710351, 1.556621, 0.4316083, 0, 0.627451, 1, 1,
0.1734858, 0.08512617, 3.50276, 0, 0.6235294, 1, 1,
0.1763014, 0.2455825, 1.894333, 0, 0.6156863, 1, 1,
0.1768573, 1.408378, -1.290962, 0, 0.6117647, 1, 1,
0.1781587, 1.453157, 0.2398839, 0, 0.6039216, 1, 1,
0.1799439, -0.8912719, 5.472245, 0, 0.5960785, 1, 1,
0.1833944, 0.4061373, 0.5834563, 0, 0.5921569, 1, 1,
0.1844635, -0.3231687, 2.989283, 0, 0.5843138, 1, 1,
0.1870309, 0.04964103, 3.052896, 0, 0.5803922, 1, 1,
0.1891421, 1.96011, 0.9250644, 0, 0.572549, 1, 1,
0.1891655, -0.1682603, 1.870727, 0, 0.5686275, 1, 1,
0.1898053, 1.319768, 0.0960627, 0, 0.5607843, 1, 1,
0.1902853, 0.8222333, -0.810383, 0, 0.5568628, 1, 1,
0.1932169, 0.1110401, 2.642934, 0, 0.5490196, 1, 1,
0.1948018, 0.1071768, 0.8908489, 0, 0.5450981, 1, 1,
0.1980632, 0.8993955, 0.7382777, 0, 0.5372549, 1, 1,
0.1986748, -0.9803299, 4.530517, 0, 0.5333334, 1, 1,
0.2064119, -0.6694033, 2.327444, 0, 0.5254902, 1, 1,
0.2065259, 0.07858545, 1.090433, 0, 0.5215687, 1, 1,
0.2129981, -1.715397, 3.934906, 0, 0.5137255, 1, 1,
0.2147443, -0.6255642, 2.704325, 0, 0.509804, 1, 1,
0.215282, -1.140722, 3.808555, 0, 0.5019608, 1, 1,
0.217686, -0.4519755, 3.155611, 0, 0.4941176, 1, 1,
0.2226863, -1.008097, 4.353368, 0, 0.4901961, 1, 1,
0.2266552, -0.8139549, 2.278769, 0, 0.4823529, 1, 1,
0.227124, -0.006983716, 0.9814129, 0, 0.4784314, 1, 1,
0.2284955, 0.6784402, -0.3355943, 0, 0.4705882, 1, 1,
0.229533, 0.5081382, -1.263526, 0, 0.4666667, 1, 1,
0.2339187, -0.5674988, 2.099198, 0, 0.4588235, 1, 1,
0.2341869, -0.7534282, 3.279817, 0, 0.454902, 1, 1,
0.2371122, -0.9279019, 1.649885, 0, 0.4470588, 1, 1,
0.2427964, -0.03785147, -0.1436974, 0, 0.4431373, 1, 1,
0.2460631, -0.2446662, 3.950858, 0, 0.4352941, 1, 1,
0.2528588, 1.028988, 1.016655, 0, 0.4313726, 1, 1,
0.2575101, 1.784958, 0.6357709, 0, 0.4235294, 1, 1,
0.2585372, -1.250541, 4.680942, 0, 0.4196078, 1, 1,
0.2628366, 0.4370478, 0.9516945, 0, 0.4117647, 1, 1,
0.2641061, -0.6521711, 1.83966, 0, 0.4078431, 1, 1,
0.2644926, -0.7260776, 4.191516, 0, 0.4, 1, 1,
0.266877, -0.1151588, 1.540995, 0, 0.3921569, 1, 1,
0.2693111, -0.557547, 3.199855, 0, 0.3882353, 1, 1,
0.269944, -0.3624396, 1.879882, 0, 0.3803922, 1, 1,
0.2720188, 1.358963, 0.09958509, 0, 0.3764706, 1, 1,
0.2736537, 0.5460317, 1.976168, 0, 0.3686275, 1, 1,
0.2756457, -0.7267604, 1.747562, 0, 0.3647059, 1, 1,
0.2791716, 2.67389, 0.800241, 0, 0.3568628, 1, 1,
0.2811246, -1.60892, 3.75736, 0, 0.3529412, 1, 1,
0.2827502, 0.3905863, 0.4424188, 0, 0.345098, 1, 1,
0.2840808, -0.960716, 2.124058, 0, 0.3411765, 1, 1,
0.2846593, -0.9558619, 3.94649, 0, 0.3333333, 1, 1,
0.2846891, -0.5790821, 3.93782, 0, 0.3294118, 1, 1,
0.284769, -0.3967246, 2.116436, 0, 0.3215686, 1, 1,
0.2902447, -1.21302, 1.266216, 0, 0.3176471, 1, 1,
0.2913524, -1.394869, 2.749103, 0, 0.3098039, 1, 1,
0.2929585, 0.1441203, -0.9626016, 0, 0.3058824, 1, 1,
0.2975121, 1.592703, 0.7368623, 0, 0.2980392, 1, 1,
0.3003291, 1.842758, 1.887611, 0, 0.2901961, 1, 1,
0.3016728, -0.3846178, 0.8026388, 0, 0.2862745, 1, 1,
0.3020983, -1.219495, 2.582082, 0, 0.2784314, 1, 1,
0.3031271, -1.013232, 4.664398, 0, 0.2745098, 1, 1,
0.303486, 0.02246147, 1.680577, 0, 0.2666667, 1, 1,
0.3053026, -0.9309562, 3.221325, 0, 0.2627451, 1, 1,
0.3067494, -1.684458, 3.024311, 0, 0.254902, 1, 1,
0.3084719, -0.02760974, 1.379827, 0, 0.2509804, 1, 1,
0.318782, 1.368226, 0.4910155, 0, 0.2431373, 1, 1,
0.3223559, -0.8683784, 0.924911, 0, 0.2392157, 1, 1,
0.3225896, -0.4585738, 3.184731, 0, 0.2313726, 1, 1,
0.3235802, -1.312203, 2.945973, 0, 0.227451, 1, 1,
0.32413, 0.05851908, 0.9248426, 0, 0.2196078, 1, 1,
0.3242865, 0.9540238, 1.143008, 0, 0.2156863, 1, 1,
0.3283881, 0.6313472, 2.001068, 0, 0.2078431, 1, 1,
0.337118, 2.302688, -1.208364, 0, 0.2039216, 1, 1,
0.3421192, 0.4526004, 0.2971152, 0, 0.1960784, 1, 1,
0.3452831, 1.204486, 0.4217602, 0, 0.1882353, 1, 1,
0.3498116, -0.7772264, 3.037293, 0, 0.1843137, 1, 1,
0.3502636, 0.7346646, 0.1782045, 0, 0.1764706, 1, 1,
0.3518372, 0.9270333, -0.4873498, 0, 0.172549, 1, 1,
0.355503, 0.7280312, 0.4397294, 0, 0.1647059, 1, 1,
0.3575081, 0.7137542, 2.245167, 0, 0.1607843, 1, 1,
0.3586337, 0.5269738, 0.1803507, 0, 0.1529412, 1, 1,
0.3645259, 0.9895759, 0.1352756, 0, 0.1490196, 1, 1,
0.3654597, 0.1519647, 1.886769, 0, 0.1411765, 1, 1,
0.367362, -0.875853, 4.053395, 0, 0.1372549, 1, 1,
0.3673807, 0.3713193, 1.340432, 0, 0.1294118, 1, 1,
0.3700899, -1.346858, 3.837939, 0, 0.1254902, 1, 1,
0.3724286, -0.04322735, 0.2158878, 0, 0.1176471, 1, 1,
0.3759471, -0.5430667, 3.093386, 0, 0.1137255, 1, 1,
0.3763164, 0.150418, 1.807444, 0, 0.1058824, 1, 1,
0.3770922, 0.03767938, 1.587986, 0, 0.09803922, 1, 1,
0.3804525, -1.710708, 3.558885, 0, 0.09411765, 1, 1,
0.3809154, 0.1093693, -0.2434089, 0, 0.08627451, 1, 1,
0.3877005, -0.4944773, 2.801446, 0, 0.08235294, 1, 1,
0.3880281, -1.697774, 2.957898, 0, 0.07450981, 1, 1,
0.3880967, 1.729847, -1.916894, 0, 0.07058824, 1, 1,
0.3883424, 1.223353, -0.2101162, 0, 0.0627451, 1, 1,
0.3893203, 1.415595, -0.1336139, 0, 0.05882353, 1, 1,
0.3914199, -1.020729, 2.594226, 0, 0.05098039, 1, 1,
0.3934429, 1.285423, 1.176328, 0, 0.04705882, 1, 1,
0.3973997, 0.0894106, 1.717124, 0, 0.03921569, 1, 1,
0.3979541, -1.041729, 2.138007, 0, 0.03529412, 1, 1,
0.4007252, 0.851581, -0.8050388, 0, 0.02745098, 1, 1,
0.4042107, -2.440322, 2.391542, 0, 0.02352941, 1, 1,
0.4099647, -1.401627, 2.699255, 0, 0.01568628, 1, 1,
0.4140958, 1.658733, 0.8293917, 0, 0.01176471, 1, 1,
0.4149996, 2.437432, 0.6242892, 0, 0.003921569, 1, 1,
0.4185751, 0.5754935, -0.7905475, 0.003921569, 0, 1, 1,
0.4195263, 0.2399362, -0.1005567, 0.007843138, 0, 1, 1,
0.4200891, 1.267455, 1.260753, 0.01568628, 0, 1, 1,
0.4209677, 0.0365111, -0.591954, 0.01960784, 0, 1, 1,
0.4234215, -1.175111, 2.666351, 0.02745098, 0, 1, 1,
0.4300638, 0.4670109, -0.1879097, 0.03137255, 0, 1, 1,
0.4392542, 1.494835, -0.6513181, 0.03921569, 0, 1, 1,
0.4410236, -0.810258, 2.373943, 0.04313726, 0, 1, 1,
0.4420175, -1.825275, 5.376494, 0.05098039, 0, 1, 1,
0.4506163, -0.6717086, 2.986153, 0.05490196, 0, 1, 1,
0.4553267, 1.235778, -0.3460467, 0.0627451, 0, 1, 1,
0.4573011, -0.2190945, 1.200665, 0.06666667, 0, 1, 1,
0.4624012, -0.3450734, 2.742686, 0.07450981, 0, 1, 1,
0.4633486, -1.209506, 2.592639, 0.07843138, 0, 1, 1,
0.4677472, 2.496695, -0.5732592, 0.08627451, 0, 1, 1,
0.4720431, -1.804034, 2.441001, 0.09019608, 0, 1, 1,
0.473612, 1.477566, 1.862597, 0.09803922, 0, 1, 1,
0.4741849, -1.335793, 2.56635, 0.1058824, 0, 1, 1,
0.4750651, -0.2965876, 3.044776, 0.1098039, 0, 1, 1,
0.4756207, -1.727902, 2.234133, 0.1176471, 0, 1, 1,
0.4762946, 0.6154387, 0.4550976, 0.1215686, 0, 1, 1,
0.476421, -0.7416186, 2.142852, 0.1294118, 0, 1, 1,
0.4765298, -0.2695965, 0.5236781, 0.1333333, 0, 1, 1,
0.4807922, 1.012677, 0.8292821, 0.1411765, 0, 1, 1,
0.4831358, 0.8660359, 1.69717, 0.145098, 0, 1, 1,
0.4851125, 1.131324, 0.02797464, 0.1529412, 0, 1, 1,
0.4874182, -1.202409, 3.751558, 0.1568628, 0, 1, 1,
0.4891595, -0.2705256, 0.8805131, 0.1647059, 0, 1, 1,
0.4902138, -0.8140913, 4.149251, 0.1686275, 0, 1, 1,
0.4938149, 0.3935203, 0.9031306, 0.1764706, 0, 1, 1,
0.4959613, -1.002416, 2.167003, 0.1803922, 0, 1, 1,
0.5037403, -0.6419865, 2.145084, 0.1882353, 0, 1, 1,
0.504613, -1.067593, 1.237727, 0.1921569, 0, 1, 1,
0.5054364, 0.1287842, 1.276836, 0.2, 0, 1, 1,
0.5114727, 1.0145, 0.9847099, 0.2078431, 0, 1, 1,
0.5172224, 1.756553, -0.556293, 0.2117647, 0, 1, 1,
0.5187029, 0.5064838, -0.2894586, 0.2196078, 0, 1, 1,
0.5193198, -0.2142983, 1.992287, 0.2235294, 0, 1, 1,
0.5252931, -0.6636357, 3.446784, 0.2313726, 0, 1, 1,
0.532645, 1.766358, 1.610513, 0.2352941, 0, 1, 1,
0.5329825, 0.3991052, 1.732065, 0.2431373, 0, 1, 1,
0.5409642, -0.6534911, 2.692563, 0.2470588, 0, 1, 1,
0.5411358, 0.1022086, 0.1791536, 0.254902, 0, 1, 1,
0.5546359, 1.700239, 0.1121661, 0.2588235, 0, 1, 1,
0.5589231, 1.608176, -0.2887379, 0.2666667, 0, 1, 1,
0.5635108, -0.3266972, 1.547699, 0.2705882, 0, 1, 1,
0.5646554, -0.3570069, 2.116139, 0.2784314, 0, 1, 1,
0.5663906, -0.6299547, 2.113852, 0.282353, 0, 1, 1,
0.5800009, 0.4866452, 1.223797, 0.2901961, 0, 1, 1,
0.5803041, -1.245634, 1.275185, 0.2941177, 0, 1, 1,
0.5805382, -0.4547792, 2.368139, 0.3019608, 0, 1, 1,
0.5863311, -0.8146477, 2.790862, 0.3098039, 0, 1, 1,
0.5869952, -0.7127301, 1.15662, 0.3137255, 0, 1, 1,
0.5876972, 1.339333, -0.05239721, 0.3215686, 0, 1, 1,
0.5884485, 1.215438, 2.414898, 0.3254902, 0, 1, 1,
0.5930288, -0.8551847, 1.881904, 0.3333333, 0, 1, 1,
0.5960388, -0.4234246, 0.4375603, 0.3372549, 0, 1, 1,
0.5990586, 0.3589876, 0.06609624, 0.345098, 0, 1, 1,
0.6012371, 0.8450888, 2.170022, 0.3490196, 0, 1, 1,
0.6109554, -0.8511391, 3.654424, 0.3568628, 0, 1, 1,
0.6191263, 0.2394071, 0.8058535, 0.3607843, 0, 1, 1,
0.622156, 0.5735116, 0.2313815, 0.3686275, 0, 1, 1,
0.6222574, -0.9643822, 0.9970973, 0.372549, 0, 1, 1,
0.6247773, 0.1996568, 1.46199, 0.3803922, 0, 1, 1,
0.625357, 0.9392229, 0.4089214, 0.3843137, 0, 1, 1,
0.6264539, 1.128357, -0.7103508, 0.3921569, 0, 1, 1,
0.6291183, -1.242537, 3.902987, 0.3960784, 0, 1, 1,
0.6364048, 0.661406, 0.2341522, 0.4039216, 0, 1, 1,
0.6403387, -0.07221212, 2.214894, 0.4117647, 0, 1, 1,
0.6418052, -2.117219, 3.12819, 0.4156863, 0, 1, 1,
0.6469305, 0.8334792, 0.4172524, 0.4235294, 0, 1, 1,
0.6512805, -0.636081, 0.5728467, 0.427451, 0, 1, 1,
0.6563242, -1.45013, 3.013078, 0.4352941, 0, 1, 1,
0.6569569, -1.800717, 2.856413, 0.4392157, 0, 1, 1,
0.6583539, 1.417931, 2.332105, 0.4470588, 0, 1, 1,
0.659327, -0.1408258, 1.512914, 0.4509804, 0, 1, 1,
0.6649673, -0.2356901, 3.109581, 0.4588235, 0, 1, 1,
0.6653278, 1.84062, -0.9547141, 0.4627451, 0, 1, 1,
0.668431, -0.1858831, 2.912977, 0.4705882, 0, 1, 1,
0.6777288, 0.1338447, 1.106755, 0.4745098, 0, 1, 1,
0.6794688, -0.7821416, 3.672468, 0.4823529, 0, 1, 1,
0.6872752, -0.03930746, 3.128345, 0.4862745, 0, 1, 1,
0.6879631, 0.1644799, 1.913102, 0.4941176, 0, 1, 1,
0.6888036, -0.0693555, 1.851116, 0.5019608, 0, 1, 1,
0.704128, -0.8666837, 2.130542, 0.5058824, 0, 1, 1,
0.7097077, 0.9042242, -0.07203706, 0.5137255, 0, 1, 1,
0.7132469, 0.01214107, 1.694835, 0.5176471, 0, 1, 1,
0.7141583, 0.4971964, 1.952773, 0.5254902, 0, 1, 1,
0.7195491, -0.7014862, 2.580292, 0.5294118, 0, 1, 1,
0.7225007, -0.7594905, 2.31109, 0.5372549, 0, 1, 1,
0.7226026, -0.2691765, 1.996706, 0.5411765, 0, 1, 1,
0.7227315, -0.1772825, 0.5315769, 0.5490196, 0, 1, 1,
0.7271771, -0.4435845, 2.940715, 0.5529412, 0, 1, 1,
0.731418, 1.400946, 0.6151099, 0.5607843, 0, 1, 1,
0.7325629, 0.05259132, 1.405974, 0.5647059, 0, 1, 1,
0.739365, 0.2376191, 0.2615519, 0.572549, 0, 1, 1,
0.7450777, -0.5701373, 3.546811, 0.5764706, 0, 1, 1,
0.7492887, 0.4036249, 1.411717, 0.5843138, 0, 1, 1,
0.7497959, 0.1427089, -1.214811, 0.5882353, 0, 1, 1,
0.7508795, -0.5616546, 1.241705, 0.5960785, 0, 1, 1,
0.7594393, 0.456844, 1.498405, 0.6039216, 0, 1, 1,
0.7614685, -1.796254, 2.044845, 0.6078432, 0, 1, 1,
0.7623885, 0.4260968, 1.64669, 0.6156863, 0, 1, 1,
0.7637269, -0.4706289, 2.744718, 0.6196079, 0, 1, 1,
0.764415, -0.3048387, 3.214052, 0.627451, 0, 1, 1,
0.7669874, -1.196877, 1.692514, 0.6313726, 0, 1, 1,
0.7695471, -0.08212625, 2.216667, 0.6392157, 0, 1, 1,
0.7700322, -0.5717761, 3.650735, 0.6431373, 0, 1, 1,
0.7700976, 0.4274437, 0.255343, 0.6509804, 0, 1, 1,
0.7719702, -0.3144322, 1.138813, 0.654902, 0, 1, 1,
0.7765728, 0.4942166, 1.539969, 0.6627451, 0, 1, 1,
0.7906604, 0.187243, 0.4131918, 0.6666667, 0, 1, 1,
0.7919054, 0.3551846, 2.722059, 0.6745098, 0, 1, 1,
0.7955573, -0.02382896, 1.145159, 0.6784314, 0, 1, 1,
0.8029227, 1.108864, 0.6643304, 0.6862745, 0, 1, 1,
0.8050939, -1.772122, 3.091721, 0.6901961, 0, 1, 1,
0.8059605, -0.8251341, 2.706185, 0.6980392, 0, 1, 1,
0.8072676, -0.2058972, 1.792958, 0.7058824, 0, 1, 1,
0.8087721, 0.7371484, -0.864709, 0.7098039, 0, 1, 1,
0.8113469, -1.224199, 2.760861, 0.7176471, 0, 1, 1,
0.8140932, -0.1656054, 0.7294468, 0.7215686, 0, 1, 1,
0.816327, -0.1158831, 3.38143, 0.7294118, 0, 1, 1,
0.8194847, -0.5065832, 2.547521, 0.7333333, 0, 1, 1,
0.8270388, -1.634297, 2.335189, 0.7411765, 0, 1, 1,
0.8300118, -1.442349, 3.210881, 0.7450981, 0, 1, 1,
0.8367333, -1.213583, 2.697878, 0.7529412, 0, 1, 1,
0.8410389, 0.03739994, 2.112313, 0.7568628, 0, 1, 1,
0.843195, -1.254434, 1.182072, 0.7647059, 0, 1, 1,
0.8432967, 1.031552, 1.883806, 0.7686275, 0, 1, 1,
0.8438099, 0.3496705, 0.7457649, 0.7764706, 0, 1, 1,
0.8465656, -0.6288514, 2.54422, 0.7803922, 0, 1, 1,
0.8470604, -1.499343, 5.164909, 0.7882353, 0, 1, 1,
0.8491247, -0.4170972, 3.239933, 0.7921569, 0, 1, 1,
0.8491975, 0.8843233, 2.122534, 0.8, 0, 1, 1,
0.851551, -0.3009546, 3.73677, 0.8078431, 0, 1, 1,
0.8546696, -0.09788892, 1.062895, 0.8117647, 0, 1, 1,
0.8592174, 0.6049695, 0.8313416, 0.8196079, 0, 1, 1,
0.8606324, -0.7594812, 3.245515, 0.8235294, 0, 1, 1,
0.8628203, -1.237807, 2.49815, 0.8313726, 0, 1, 1,
0.8697863, 0.5350927, -0.2274363, 0.8352941, 0, 1, 1,
0.8784046, 0.6453282, -0.1245827, 0.8431373, 0, 1, 1,
0.8786378, -0.4492064, 1.284687, 0.8470588, 0, 1, 1,
0.8823669, -2.668309, 3.053741, 0.854902, 0, 1, 1,
0.8823906, 0.2501621, 1.896221, 0.8588235, 0, 1, 1,
0.8848931, -1.724858, 3.407858, 0.8666667, 0, 1, 1,
0.8873525, 2.394824, -0.5653806, 0.8705882, 0, 1, 1,
0.8878832, -1.369573, 1.686034, 0.8784314, 0, 1, 1,
0.8921903, -0.03546612, 2.669914, 0.8823529, 0, 1, 1,
0.892732, 1.150722, 0.7262822, 0.8901961, 0, 1, 1,
0.8976372, -0.768028, 2.638238, 0.8941177, 0, 1, 1,
0.9080498, -0.7117327, 0.7840961, 0.9019608, 0, 1, 1,
0.9134254, -1.612031, 2.733395, 0.9098039, 0, 1, 1,
0.9200963, -0.3696184, -0.4072725, 0.9137255, 0, 1, 1,
0.9268703, 0.468063, 0.2332052, 0.9215686, 0, 1, 1,
0.9272872, 0.2371017, 2.185977, 0.9254902, 0, 1, 1,
0.9295931, -0.9062331, 2.468254, 0.9333333, 0, 1, 1,
0.9382936, -0.2908806, 0.5511634, 0.9372549, 0, 1, 1,
0.9420863, -0.7395163, 1.40919, 0.945098, 0, 1, 1,
0.9464023, 3.123051, 0.04070188, 0.9490196, 0, 1, 1,
0.9472016, -0.150883, 2.33377, 0.9568627, 0, 1, 1,
0.9621529, -0.8053988, 3.491121, 0.9607843, 0, 1, 1,
0.9690462, 0.6905822, -0.9920343, 0.9686275, 0, 1, 1,
0.978917, 1.433123, 2.094286, 0.972549, 0, 1, 1,
0.9877003, 1.67433, 1.63953, 0.9803922, 0, 1, 1,
0.9908872, 0.2731028, 1.430593, 0.9843137, 0, 1, 1,
0.9996303, 1.261463, 1.041727, 0.9921569, 0, 1, 1,
1.001716, -0.3051151, 2.35795, 0.9960784, 0, 1, 1,
1.006283, -1.089877, 1.794257, 1, 0, 0.9960784, 1,
1.008575, -0.2253549, 2.374822, 1, 0, 0.9882353, 1,
1.017086, 2.002601, 0.347503, 1, 0, 0.9843137, 1,
1.018508, -0.3672445, 1.959116, 1, 0, 0.9764706, 1,
1.026405, -1.357872, 1.534108, 1, 0, 0.972549, 1,
1.026753, -0.6133942, 4.826478, 1, 0, 0.9647059, 1,
1.027116, 0.8731753, 0.761327, 1, 0, 0.9607843, 1,
1.03884, -0.0003281252, 2.130238, 1, 0, 0.9529412, 1,
1.039815, -0.6270489, 1.454673, 1, 0, 0.9490196, 1,
1.040111, 0.7301953, 1.243474, 1, 0, 0.9411765, 1,
1.047581, -1.086222, 0.8806145, 1, 0, 0.9372549, 1,
1.049943, 1.375462, 1.759329, 1, 0, 0.9294118, 1,
1.050804, 0.3481781, 2.623007, 1, 0, 0.9254902, 1,
1.053864, -0.6115556, 3.239588, 1, 0, 0.9176471, 1,
1.056531, -0.9013473, 1.940891, 1, 0, 0.9137255, 1,
1.057185, -1.131868, 2.945625, 1, 0, 0.9058824, 1,
1.057363, 0.5016711, 0.2542684, 1, 0, 0.9019608, 1,
1.060205, -0.586108, 1.309365, 1, 0, 0.8941177, 1,
1.062616, 2.016302, 2.109367, 1, 0, 0.8862745, 1,
1.065143, -0.2303813, -0.1211165, 1, 0, 0.8823529, 1,
1.065529, -0.459185, 0.4252757, 1, 0, 0.8745098, 1,
1.076007, 0.5289987, -0.01274774, 1, 0, 0.8705882, 1,
1.0775, 1.398196, -0.5379608, 1, 0, 0.8627451, 1,
1.083965, 0.9592675, 2.162196, 1, 0, 0.8588235, 1,
1.085713, 0.3735151, 0.5200606, 1, 0, 0.8509804, 1,
1.089901, 0.5370482, 0.9321008, 1, 0, 0.8470588, 1,
1.091276, -0.05113313, 2.784714, 1, 0, 0.8392157, 1,
1.093511, 0.530154, 1.960027, 1, 0, 0.8352941, 1,
1.097871, -0.2685063, 2.123633, 1, 0, 0.827451, 1,
1.099188, -0.9196982, 2.045354, 1, 0, 0.8235294, 1,
1.099453, 1.791059, -0.5472272, 1, 0, 0.8156863, 1,
1.117147, 1.331291, -0.4283895, 1, 0, 0.8117647, 1,
1.119159, 0.8135178, 1.794747, 1, 0, 0.8039216, 1,
1.125346, 0.4493834, 1.528891, 1, 0, 0.7960784, 1,
1.134935, -0.6739551, 1.685437, 1, 0, 0.7921569, 1,
1.145875, 0.8040744, 0.8714633, 1, 0, 0.7843137, 1,
1.149363, 0.9573806, 0.9624658, 1, 0, 0.7803922, 1,
1.159305, -0.5075247, 2.847825, 1, 0, 0.772549, 1,
1.166116, -0.1977952, 0.2493804, 1, 0, 0.7686275, 1,
1.167276, -1.260807, 1.577344, 1, 0, 0.7607843, 1,
1.173958, 0.5524998, 0.226097, 1, 0, 0.7568628, 1,
1.174747, 0.4344033, 1.097911, 1, 0, 0.7490196, 1,
1.174977, -0.1539617, 2.395076, 1, 0, 0.7450981, 1,
1.174994, -0.03449011, -1.321667, 1, 0, 0.7372549, 1,
1.178686, -1.24501, 4.022467, 1, 0, 0.7333333, 1,
1.180572, -1.08816, 3.076732, 1, 0, 0.7254902, 1,
1.183358, 0.7684513, -0.558226, 1, 0, 0.7215686, 1,
1.194927, -0.04875733, 1.838991, 1, 0, 0.7137255, 1,
1.211029, 0.6165243, 0.5628962, 1, 0, 0.7098039, 1,
1.211643, -0.5885238, 1.949314, 1, 0, 0.7019608, 1,
1.235078, -0.2691799, 0.07391717, 1, 0, 0.6941177, 1,
1.247073, 1.635191, -0.7877777, 1, 0, 0.6901961, 1,
1.264585, 0.1376111, 0.8590905, 1, 0, 0.682353, 1,
1.275137, -0.3188765, 1.404879, 1, 0, 0.6784314, 1,
1.277212, -1.410224, 3.13227, 1, 0, 0.6705883, 1,
1.280564, -0.5986468, 2.531602, 1, 0, 0.6666667, 1,
1.28178, 0.2768307, 2.722831, 1, 0, 0.6588235, 1,
1.282464, -1.160534, 3.466633, 1, 0, 0.654902, 1,
1.289934, 1.27161, 1.291808, 1, 0, 0.6470588, 1,
1.290671, -0.02315549, 1.799632, 1, 0, 0.6431373, 1,
1.29113, -0.4062374, 2.654069, 1, 0, 0.6352941, 1,
1.291884, 0.3643953, 0.3485111, 1, 0, 0.6313726, 1,
1.295798, -0.5259172, 2.414111, 1, 0, 0.6235294, 1,
1.300727, -0.1008153, 2.317667, 1, 0, 0.6196079, 1,
1.303769, 0.469032, 0.4844737, 1, 0, 0.6117647, 1,
1.308998, -0.5097694, 1.632766, 1, 0, 0.6078432, 1,
1.310341, 0.7403852, 0.9837533, 1, 0, 0.6, 1,
1.313665, 1.995615, 1.599403, 1, 0, 0.5921569, 1,
1.319509, 0.9188473, 0.947295, 1, 0, 0.5882353, 1,
1.3205, 0.747793, -0.7061977, 1, 0, 0.5803922, 1,
1.325571, -0.5408404, 2.295979, 1, 0, 0.5764706, 1,
1.326349, -0.9568326, 2.86541, 1, 0, 0.5686275, 1,
1.334708, 0.2918595, 1.715501, 1, 0, 0.5647059, 1,
1.338186, -0.4351096, 1.184981, 1, 0, 0.5568628, 1,
1.344509, 2.267984, -0.1320793, 1, 0, 0.5529412, 1,
1.34649, -1.760899, 2.481053, 1, 0, 0.5450981, 1,
1.369126, -2.872617, 2.304327, 1, 0, 0.5411765, 1,
1.39613, 0.8752451, -0.810627, 1, 0, 0.5333334, 1,
1.397849, -0.5616759, 2.289381, 1, 0, 0.5294118, 1,
1.397859, 0.1207539, 0.9030075, 1, 0, 0.5215687, 1,
1.403043, -1.316448, 2.719718, 1, 0, 0.5176471, 1,
1.404696, 0.7362617, 0.7514174, 1, 0, 0.509804, 1,
1.4094, 1.015961, 0.5906152, 1, 0, 0.5058824, 1,
1.419678, -0.9505407, 1.335091, 1, 0, 0.4980392, 1,
1.422312, 0.8079646, 1.070414, 1, 0, 0.4901961, 1,
1.429576, 0.1831833, 2.233433, 1, 0, 0.4862745, 1,
1.432269, 1.292144, 1.251559, 1, 0, 0.4784314, 1,
1.449854, 0.7805827, 0.7838229, 1, 0, 0.4745098, 1,
1.45315, 0.1971755, 0.6076708, 1, 0, 0.4666667, 1,
1.453582, 0.273641, 1.713063, 1, 0, 0.4627451, 1,
1.459417, 0.6707582, 2.027772, 1, 0, 0.454902, 1,
1.460561, -1.135122, 0.1187431, 1, 0, 0.4509804, 1,
1.462534, 4.054285, -0.2940958, 1, 0, 0.4431373, 1,
1.464716, 1.342839, 0.5988575, 1, 0, 0.4392157, 1,
1.465016, -0.4879415, 0.2998914, 1, 0, 0.4313726, 1,
1.470951, 0.2872329, 2.235708, 1, 0, 0.427451, 1,
1.477132, 1.07741, 0.03274185, 1, 0, 0.4196078, 1,
1.485275, -0.5223728, 1.109876, 1, 0, 0.4156863, 1,
1.490353, 0.6558069, 1.882362, 1, 0, 0.4078431, 1,
1.494523, -1.882232, 3.526224, 1, 0, 0.4039216, 1,
1.50539, -0.3962751, -0.0002665792, 1, 0, 0.3960784, 1,
1.506844, -0.5512891, 2.008219, 1, 0, 0.3882353, 1,
1.540089, -0.09468138, 0.3756595, 1, 0, 0.3843137, 1,
1.556057, -1.003428, 3.969963, 1, 0, 0.3764706, 1,
1.560158, -0.2565485, 2.387744, 1, 0, 0.372549, 1,
1.562878, -0.5865863, 3.417383, 1, 0, 0.3647059, 1,
1.592873, -0.9521859, 4.287489, 1, 0, 0.3607843, 1,
1.607336, 0.5264278, 0.7155105, 1, 0, 0.3529412, 1,
1.609806, 0.3900643, 1.63, 1, 0, 0.3490196, 1,
1.610375, 0.02392793, 2.168381, 1, 0, 0.3411765, 1,
1.611334, 1.252563, 1.7503, 1, 0, 0.3372549, 1,
1.620329, -1.013566, 2.333732, 1, 0, 0.3294118, 1,
1.644423, 1.256, 1.721249, 1, 0, 0.3254902, 1,
1.652958, -0.3045926, 0.4721403, 1, 0, 0.3176471, 1,
1.653551, 0.4246707, 1.215105, 1, 0, 0.3137255, 1,
1.6574, -1.353108, 2.973088, 1, 0, 0.3058824, 1,
1.659793, 0.4555092, 0.8256013, 1, 0, 0.2980392, 1,
1.662688, -0.7237027, 1.588246, 1, 0, 0.2941177, 1,
1.67153, -0.2003413, 1.510139, 1, 0, 0.2862745, 1,
1.677513, -0.3797548, 2.020142, 1, 0, 0.282353, 1,
1.680021, -0.8254634, 1.782797, 1, 0, 0.2745098, 1,
1.6822, 1.152481, 1.862908, 1, 0, 0.2705882, 1,
1.688828, 0.478979, 0.5980614, 1, 0, 0.2627451, 1,
1.727598, -0.6547117, 1.981819, 1, 0, 0.2588235, 1,
1.739422, 0.01806543, 2.471077, 1, 0, 0.2509804, 1,
1.742529, 0.6255355, 2.192331, 1, 0, 0.2470588, 1,
1.764378, 0.9808648, 2.102889, 1, 0, 0.2392157, 1,
1.81118, -0.8817639, 1.746922, 1, 0, 0.2352941, 1,
1.818309, -1.744228, 0.6522748, 1, 0, 0.227451, 1,
1.821586, 0.3694693, 2.547761, 1, 0, 0.2235294, 1,
1.822965, 0.4079515, 0.389855, 1, 0, 0.2156863, 1,
1.833288, -0.6973464, 2.342788, 1, 0, 0.2117647, 1,
1.835931, 1.074165, 0.6283453, 1, 0, 0.2039216, 1,
1.839334, -1.769251, 3.024226, 1, 0, 0.1960784, 1,
1.844823, -0.7927026, 2.814714, 1, 0, 0.1921569, 1,
1.865872, -0.7594581, 2.147355, 1, 0, 0.1843137, 1,
1.884852, 0.6508877, 1.602531, 1, 0, 0.1803922, 1,
1.885861, -0.9623706, 1.511914, 1, 0, 0.172549, 1,
1.914362, 0.8830953, -0.4836203, 1, 0, 0.1686275, 1,
1.931859, -1.032282, 2.429086, 1, 0, 0.1607843, 1,
1.971589, 0.3329707, 3.708884, 1, 0, 0.1568628, 1,
1.981485, -1.684307, 1.405131, 1, 0, 0.1490196, 1,
1.986686, 1.740422, 1.217849, 1, 0, 0.145098, 1,
1.999296, 1.650907, -0.6756088, 1, 0, 0.1372549, 1,
2.03941, -0.4369837, 1.432976, 1, 0, 0.1333333, 1,
2.048733, 0.174317, 0.9907061, 1, 0, 0.1254902, 1,
2.075527, -0.001783499, 0.2793075, 1, 0, 0.1215686, 1,
2.112016, 0.6411005, 0.676052, 1, 0, 0.1137255, 1,
2.115683, 2.335637, 0.789597, 1, 0, 0.1098039, 1,
2.11884, -0.8015252, 0.9134042, 1, 0, 0.1019608, 1,
2.12657, 0.06130673, 1.460881, 1, 0, 0.09411765, 1,
2.128567, 2.51389, 0.6546571, 1, 0, 0.09019608, 1,
2.134506, -0.5747472, 1.428966, 1, 0, 0.08235294, 1,
2.224155, 1.144792, 0.2072637, 1, 0, 0.07843138, 1,
2.255092, -1.063562, 2.261709, 1, 0, 0.07058824, 1,
2.266394, 0.1412191, 2.270738, 1, 0, 0.06666667, 1,
2.278707, 1.77556, 4.019276, 1, 0, 0.05882353, 1,
2.364526, 0.1965038, 1.274163, 1, 0, 0.05490196, 1,
2.495979, -0.7432677, 3.298216, 1, 0, 0.04705882, 1,
2.532389, -0.9058225, 0.9539028, 1, 0, 0.04313726, 1,
2.554073, -1.443562, 1.981331, 1, 0, 0.03529412, 1,
2.606307, -0.9279827, 1.234303, 1, 0, 0.03137255, 1,
2.619528, 0.3160216, -0.1723961, 1, 0, 0.02352941, 1,
2.629655, 0.4216291, 2.522472, 1, 0, 0.01960784, 1,
2.881361, -0.6851458, 3.256547, 1, 0, 0.01176471, 1,
3.448741, 1.114247, 1.862169, 1, 0, 0.007843138, 1
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
0.4213502, -4.046727, -7.209774, 0, -0.5, 0.5, 0.5,
0.4213502, -4.046727, -7.209774, 1, -0.5, 0.5, 0.5,
0.4213502, -4.046727, -7.209774, 1, 1.5, 0.5, 0.5,
0.4213502, -4.046727, -7.209774, 0, 1.5, 0.5, 0.5
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
-3.632326, 0.5908338, -7.209774, 0, -0.5, 0.5, 0.5,
-3.632326, 0.5908338, -7.209774, 1, -0.5, 0.5, 0.5,
-3.632326, 0.5908338, -7.209774, 1, 1.5, 0.5, 0.5,
-3.632326, 0.5908338, -7.209774, 0, 1.5, 0.5, 0.5
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
-3.632326, -4.046727, 0.0502615, 0, -0.5, 0.5, 0.5,
-3.632326, -4.046727, 0.0502615, 1, -0.5, 0.5, 0.5,
-3.632326, -4.046727, 0.0502615, 1, 1.5, 0.5, 0.5,
-3.632326, -4.046727, 0.0502615, 0, 1.5, 0.5, 0.5
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
-2, -2.976521, -5.534382,
3, -2.976521, -5.534382,
-2, -2.976521, -5.534382,
-2, -3.154888, -5.813614,
-1, -2.976521, -5.534382,
-1, -3.154888, -5.813614,
0, -2.976521, -5.534382,
0, -3.154888, -5.813614,
1, -2.976521, -5.534382,
1, -3.154888, -5.813614,
2, -2.976521, -5.534382,
2, -3.154888, -5.813614,
3, -2.976521, -5.534382,
3, -3.154888, -5.813614
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
-2, -3.511624, -6.372078, 0, -0.5, 0.5, 0.5,
-2, -3.511624, -6.372078, 1, -0.5, 0.5, 0.5,
-2, -3.511624, -6.372078, 1, 1.5, 0.5, 0.5,
-2, -3.511624, -6.372078, 0, 1.5, 0.5, 0.5,
-1, -3.511624, -6.372078, 0, -0.5, 0.5, 0.5,
-1, -3.511624, -6.372078, 1, -0.5, 0.5, 0.5,
-1, -3.511624, -6.372078, 1, 1.5, 0.5, 0.5,
-1, -3.511624, -6.372078, 0, 1.5, 0.5, 0.5,
0, -3.511624, -6.372078, 0, -0.5, 0.5, 0.5,
0, -3.511624, -6.372078, 1, -0.5, 0.5, 0.5,
0, -3.511624, -6.372078, 1, 1.5, 0.5, 0.5,
0, -3.511624, -6.372078, 0, 1.5, 0.5, 0.5,
1, -3.511624, -6.372078, 0, -0.5, 0.5, 0.5,
1, -3.511624, -6.372078, 1, -0.5, 0.5, 0.5,
1, -3.511624, -6.372078, 1, 1.5, 0.5, 0.5,
1, -3.511624, -6.372078, 0, 1.5, 0.5, 0.5,
2, -3.511624, -6.372078, 0, -0.5, 0.5, 0.5,
2, -3.511624, -6.372078, 1, -0.5, 0.5, 0.5,
2, -3.511624, -6.372078, 1, 1.5, 0.5, 0.5,
2, -3.511624, -6.372078, 0, 1.5, 0.5, 0.5,
3, -3.511624, -6.372078, 0, -0.5, 0.5, 0.5,
3, -3.511624, -6.372078, 1, -0.5, 0.5, 0.5,
3, -3.511624, -6.372078, 1, 1.5, 0.5, 0.5,
3, -3.511624, -6.372078, 0, 1.5, 0.5, 0.5
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
-2.696862, -2, -5.534382,
-2.696862, 4, -5.534382,
-2.696862, -2, -5.534382,
-2.852773, -2, -5.813614,
-2.696862, -1, -5.534382,
-2.852773, -1, -5.813614,
-2.696862, 0, -5.534382,
-2.852773, 0, -5.813614,
-2.696862, 1, -5.534382,
-2.852773, 1, -5.813614,
-2.696862, 2, -5.534382,
-2.852773, 2, -5.813614,
-2.696862, 3, -5.534382,
-2.852773, 3, -5.813614,
-2.696862, 4, -5.534382,
-2.852773, 4, -5.813614
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
"3",
"4"
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
-3.164594, -2, -6.372078, 0, -0.5, 0.5, 0.5,
-3.164594, -2, -6.372078, 1, -0.5, 0.5, 0.5,
-3.164594, -2, -6.372078, 1, 1.5, 0.5, 0.5,
-3.164594, -2, -6.372078, 0, 1.5, 0.5, 0.5,
-3.164594, -1, -6.372078, 0, -0.5, 0.5, 0.5,
-3.164594, -1, -6.372078, 1, -0.5, 0.5, 0.5,
-3.164594, -1, -6.372078, 1, 1.5, 0.5, 0.5,
-3.164594, -1, -6.372078, 0, 1.5, 0.5, 0.5,
-3.164594, 0, -6.372078, 0, -0.5, 0.5, 0.5,
-3.164594, 0, -6.372078, 1, -0.5, 0.5, 0.5,
-3.164594, 0, -6.372078, 1, 1.5, 0.5, 0.5,
-3.164594, 0, -6.372078, 0, 1.5, 0.5, 0.5,
-3.164594, 1, -6.372078, 0, -0.5, 0.5, 0.5,
-3.164594, 1, -6.372078, 1, -0.5, 0.5, 0.5,
-3.164594, 1, -6.372078, 1, 1.5, 0.5, 0.5,
-3.164594, 1, -6.372078, 0, 1.5, 0.5, 0.5,
-3.164594, 2, -6.372078, 0, -0.5, 0.5, 0.5,
-3.164594, 2, -6.372078, 1, -0.5, 0.5, 0.5,
-3.164594, 2, -6.372078, 1, 1.5, 0.5, 0.5,
-3.164594, 2, -6.372078, 0, 1.5, 0.5, 0.5,
-3.164594, 3, -6.372078, 0, -0.5, 0.5, 0.5,
-3.164594, 3, -6.372078, 1, -0.5, 0.5, 0.5,
-3.164594, 3, -6.372078, 1, 1.5, 0.5, 0.5,
-3.164594, 3, -6.372078, 0, 1.5, 0.5, 0.5,
-3.164594, 4, -6.372078, 0, -0.5, 0.5, 0.5,
-3.164594, 4, -6.372078, 1, -0.5, 0.5, 0.5,
-3.164594, 4, -6.372078, 1, 1.5, 0.5, 0.5,
-3.164594, 4, -6.372078, 0, 1.5, 0.5, 0.5
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
-2.696862, -2.976521, -4,
-2.696862, -2.976521, 4,
-2.696862, -2.976521, -4,
-2.852773, -3.154888, -4,
-2.696862, -2.976521, -2,
-2.852773, -3.154888, -2,
-2.696862, -2.976521, 0,
-2.852773, -3.154888, 0,
-2.696862, -2.976521, 2,
-2.852773, -3.154888, 2,
-2.696862, -2.976521, 4,
-2.852773, -3.154888, 4
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
-3.164594, -3.511624, -4, 0, -0.5, 0.5, 0.5,
-3.164594, -3.511624, -4, 1, -0.5, 0.5, 0.5,
-3.164594, -3.511624, -4, 1, 1.5, 0.5, 0.5,
-3.164594, -3.511624, -4, 0, 1.5, 0.5, 0.5,
-3.164594, -3.511624, -2, 0, -0.5, 0.5, 0.5,
-3.164594, -3.511624, -2, 1, -0.5, 0.5, 0.5,
-3.164594, -3.511624, -2, 1, 1.5, 0.5, 0.5,
-3.164594, -3.511624, -2, 0, 1.5, 0.5, 0.5,
-3.164594, -3.511624, 0, 0, -0.5, 0.5, 0.5,
-3.164594, -3.511624, 0, 1, -0.5, 0.5, 0.5,
-3.164594, -3.511624, 0, 1, 1.5, 0.5, 0.5,
-3.164594, -3.511624, 0, 0, 1.5, 0.5, 0.5,
-3.164594, -3.511624, 2, 0, -0.5, 0.5, 0.5,
-3.164594, -3.511624, 2, 1, -0.5, 0.5, 0.5,
-3.164594, -3.511624, 2, 1, 1.5, 0.5, 0.5,
-3.164594, -3.511624, 2, 0, 1.5, 0.5, 0.5,
-3.164594, -3.511624, 4, 0, -0.5, 0.5, 0.5,
-3.164594, -3.511624, 4, 1, -0.5, 0.5, 0.5,
-3.164594, -3.511624, 4, 1, 1.5, 0.5, 0.5,
-3.164594, -3.511624, 4, 0, 1.5, 0.5, 0.5
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
-2.696862, -2.976521, -5.534382,
-2.696862, 4.158188, -5.534382,
-2.696862, -2.976521, 5.634905,
-2.696862, 4.158188, 5.634905,
-2.696862, -2.976521, -5.534382,
-2.696862, -2.976521, 5.634905,
-2.696862, 4.158188, -5.534382,
-2.696862, 4.158188, 5.634905,
-2.696862, -2.976521, -5.534382,
3.539563, -2.976521, -5.534382,
-2.696862, -2.976521, 5.634905,
3.539563, -2.976521, 5.634905,
-2.696862, 4.158188, -5.534382,
3.539563, 4.158188, -5.534382,
-2.696862, 4.158188, 5.634905,
3.539563, 4.158188, 5.634905,
3.539563, -2.976521, -5.534382,
3.539563, 4.158188, -5.534382,
3.539563, -2.976521, 5.634905,
3.539563, 4.158188, 5.634905,
3.539563, -2.976521, -5.534382,
3.539563, -2.976521, 5.634905,
3.539563, 4.158188, -5.534382,
3.539563, 4.158188, 5.634905
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
var radius = 7.821495;
var distance = 34.79871;
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
mvMatrix.translate( -0.4213502, -0.5908338, -0.0502615 );
mvMatrix.scale( 1.356026, 1.185298, 0.7571436 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.79871);
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
isopropylamine<-read.table("isopropylamine.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-isopropylamine$V2
```

```
## Error in eval(expr, envir, enclos): object 'isopropylamine' not found
```

```r
y<-isopropylamine$V3
```

```
## Error in eval(expr, envir, enclos): object 'isopropylamine' not found
```

```r
z<-isopropylamine$V4
```

```
## Error in eval(expr, envir, enclos): object 'isopropylamine' not found
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
-2.60604, 0.8656809, -0.7656415, 0, 0, 1, 1, 1,
-2.563841, -0.5024329, -3.028592, 1, 0, 0, 1, 1,
-2.544788, 0.7135528, 0.09252583, 1, 0, 0, 1, 1,
-2.528238, 0.9892135, -0.168898, 1, 0, 0, 1, 1,
-2.410577, -1.458473, -0.8276464, 1, 0, 0, 1, 1,
-2.344429, -0.4520919, -2.078663, 1, 0, 0, 1, 1,
-2.285978, 1.515924, -2.116765, 0, 0, 0, 1, 1,
-2.253571, -0.2629924, 0.2024616, 0, 0, 0, 1, 1,
-2.253403, -0.8879231, -2.295187, 0, 0, 0, 1, 1,
-2.195869, 0.2954051, -2.815225, 0, 0, 0, 1, 1,
-2.150938, -1.888315, -2.518025, 0, 0, 0, 1, 1,
-2.134408, -0.2675636, -1.947518, 0, 0, 0, 1, 1,
-2.120832, -0.1280732, -1.578453, 0, 0, 0, 1, 1,
-2.114176, -1.001686, -1.652847, 1, 1, 1, 1, 1,
-2.107686, 0.4526777, -0.813756, 1, 1, 1, 1, 1,
-2.093054, 0.2997867, -2.420954, 1, 1, 1, 1, 1,
-2.092823, -0.04929366, -1.057495, 1, 1, 1, 1, 1,
-2.05793, -0.5038818, -2.457171, 1, 1, 1, 1, 1,
-2.038234, 1.10073, 0.0424284, 1, 1, 1, 1, 1,
-2.033608, 0.5103912, -1.716184, 1, 1, 1, 1, 1,
-2.018868, 0.3625399, -2.142092, 1, 1, 1, 1, 1,
-2.014296, -0.1153127, -2.993257, 1, 1, 1, 1, 1,
-2.00957, -1.198412, -0.5824876, 1, 1, 1, 1, 1,
-1.997448, 0.6960158, -1.067112, 1, 1, 1, 1, 1,
-1.985886, -2.140275, -2.25397, 1, 1, 1, 1, 1,
-1.9744, -0.6584936, -0.9641368, 1, 1, 1, 1, 1,
-1.9739, 1.447, -1.756392, 1, 1, 1, 1, 1,
-1.967391, -0.2827223, -1.282871, 1, 1, 1, 1, 1,
-1.934784, -0.04333851, 0.3182722, 0, 0, 1, 1, 1,
-1.92673, -0.07163609, -1.917248, 1, 0, 0, 1, 1,
-1.922306, -1.357615, -4.309038, 1, 0, 0, 1, 1,
-1.919692, -0.7557989, -2.221714, 1, 0, 0, 1, 1,
-1.918649, -0.1962927, -0.2050607, 1, 0, 0, 1, 1,
-1.912583, 0.4525003, -1.399396, 1, 0, 0, 1, 1,
-1.882302, -1.192234, -2.747154, 0, 0, 0, 1, 1,
-1.878409, 0.3468275, -0.979477, 0, 0, 0, 1, 1,
-1.861867, 1.251527, 0.04733887, 0, 0, 0, 1, 1,
-1.852993, 0.08421026, -2.62902, 0, 0, 0, 1, 1,
-1.851173, -0.7127298, -0.3892259, 0, 0, 0, 1, 1,
-1.828505, 1.25431, -0.7207315, 0, 0, 0, 1, 1,
-1.822447, 0.8984167, -0.9740428, 0, 0, 0, 1, 1,
-1.809131, 0.3279471, -2.462958, 1, 1, 1, 1, 1,
-1.800738, 1.683481, -1.732412, 1, 1, 1, 1, 1,
-1.786421, 0.8788263, -3.132919, 1, 1, 1, 1, 1,
-1.778035, -0.173092, -0.4518611, 1, 1, 1, 1, 1,
-1.772946, -0.7554132, -3.297494, 1, 1, 1, 1, 1,
-1.73955, -0.1967901, -2.297939, 1, 1, 1, 1, 1,
-1.73725, 0.897281, -1.354589, 1, 1, 1, 1, 1,
-1.705179, 1.704295, -0.4688365, 1, 1, 1, 1, 1,
-1.686173, 2.022032, -1.292632, 1, 1, 1, 1, 1,
-1.66571, -2.203612, -3.094574, 1, 1, 1, 1, 1,
-1.661328, -0.1538454, -4.742792, 1, 1, 1, 1, 1,
-1.639742, -2.184442, -2.541179, 1, 1, 1, 1, 1,
-1.637669, -0.7202117, -1.619336, 1, 1, 1, 1, 1,
-1.619736, 1.132637, -1.823828, 1, 1, 1, 1, 1,
-1.612573, -0.1794753, -2.908815, 1, 1, 1, 1, 1,
-1.603994, -0.1597342, -0.9789587, 0, 0, 1, 1, 1,
-1.601886, 0.882827, 0.5046684, 1, 0, 0, 1, 1,
-1.587544, 1.975524, -0.1852656, 1, 0, 0, 1, 1,
-1.581698, -0.4032822, -0.485666, 1, 0, 0, 1, 1,
-1.581541, -0.9780523, -2.207521, 1, 0, 0, 1, 1,
-1.576149, -0.1924691, -0.9374723, 1, 0, 0, 1, 1,
-1.561782, 0.2876826, -1.263466, 0, 0, 0, 1, 1,
-1.517071, -0.6497298, -0.62006, 0, 0, 0, 1, 1,
-1.516384, 0.5451431, -0.8688918, 0, 0, 0, 1, 1,
-1.509544, -0.3090987, -3.363577, 0, 0, 0, 1, 1,
-1.500469, 0.2416486, -1.569106, 0, 0, 0, 1, 1,
-1.491237, 0.5589207, 0.194554, 0, 0, 0, 1, 1,
-1.477828, 0.5906122, -1.447444, 0, 0, 0, 1, 1,
-1.46773, 0.5455987, -2.363659, 1, 1, 1, 1, 1,
-1.457708, 1.859736, -1.396715, 1, 1, 1, 1, 1,
-1.446325, -0.9334601, -2.164982, 1, 1, 1, 1, 1,
-1.439155, -0.004269182, -1.48178, 1, 1, 1, 1, 1,
-1.435623, -0.4898221, -2.927065, 1, 1, 1, 1, 1,
-1.410055, -1.346845, 0.2433946, 1, 1, 1, 1, 1,
-1.408305, -1.000307, -1.904137, 1, 1, 1, 1, 1,
-1.40138, 0.5607491, -1.164928, 1, 1, 1, 1, 1,
-1.39627, 1.115481, -0.8982926, 1, 1, 1, 1, 1,
-1.390119, 0.3224374, -0.8164421, 1, 1, 1, 1, 1,
-1.383783, -0.03704051, -4.090691, 1, 1, 1, 1, 1,
-1.377582, 0.64968, -1.965906, 1, 1, 1, 1, 1,
-1.372906, -0.2118092, -0.5538101, 1, 1, 1, 1, 1,
-1.372021, 0.8507795, 0.8820104, 1, 1, 1, 1, 1,
-1.37005, 0.6048155, -0.07689168, 1, 1, 1, 1, 1,
-1.358331, -0.7173347, -3.012453, 0, 0, 1, 1, 1,
-1.356288, -0.8803074, -2.24519, 1, 0, 0, 1, 1,
-1.351552, 0.1109034, -1.860682, 1, 0, 0, 1, 1,
-1.341933, 0.2055987, -0.1696429, 1, 0, 0, 1, 1,
-1.339235, -1.018869, -1.161343, 1, 0, 0, 1, 1,
-1.327456, -1.233841, -0.1700452, 1, 0, 0, 1, 1,
-1.296639, 0.8830453, -1.795659, 0, 0, 0, 1, 1,
-1.291526, 0.09403902, -1.443973, 0, 0, 0, 1, 1,
-1.288218, 0.3577964, -1.175918, 0, 0, 0, 1, 1,
-1.284472, -0.3151086, -2.355698, 0, 0, 0, 1, 1,
-1.267991, -1.604158, -1.550608, 0, 0, 0, 1, 1,
-1.26794, -0.3117907, -0.7047303, 0, 0, 0, 1, 1,
-1.267851, -0.8784113, -2.322144, 0, 0, 0, 1, 1,
-1.265031, -1.18368, -1.197859, 1, 1, 1, 1, 1,
-1.255162, 0.6968988, 0.04182874, 1, 1, 1, 1, 1,
-1.254769, -1.113212, -2.704384, 1, 1, 1, 1, 1,
-1.246703, -0.4459205, -1.646727, 1, 1, 1, 1, 1,
-1.245268, 0.2572035, -1.693614, 1, 1, 1, 1, 1,
-1.24048, -1.82614, -4.188288, 1, 1, 1, 1, 1,
-1.240042, 0.2588924, -2.003844, 1, 1, 1, 1, 1,
-1.23608, -0.5131269, -0.9043516, 1, 1, 1, 1, 1,
-1.227851, 2.888452, 0.9214056, 1, 1, 1, 1, 1,
-1.227224, -0.830785, -2.899648, 1, 1, 1, 1, 1,
-1.224875, 0.7603619, 1.638231, 1, 1, 1, 1, 1,
-1.224745, -1.012413, -2.894253, 1, 1, 1, 1, 1,
-1.22358, -0.7832288, -1.332927, 1, 1, 1, 1, 1,
-1.221982, 0.2186998, -0.5929414, 1, 1, 1, 1, 1,
-1.221782, 1.324497, -1.509846, 1, 1, 1, 1, 1,
-1.220688, 0.7586982, -1.905036, 0, 0, 1, 1, 1,
-1.188394, -0.3107693, -2.246057, 1, 0, 0, 1, 1,
-1.187732, 1.369455, -0.01213862, 1, 0, 0, 1, 1,
-1.185778, 0.06227756, -1.307501, 1, 0, 0, 1, 1,
-1.183488, -2.049937, -2.310188, 1, 0, 0, 1, 1,
-1.182173, 0.1832086, 0.1240689, 1, 0, 0, 1, 1,
-1.177595, -0.6048822, -3.226464, 0, 0, 0, 1, 1,
-1.177283, 1.353285, -1.391633, 0, 0, 0, 1, 1,
-1.175276, 0.7287408, -1.52334, 0, 0, 0, 1, 1,
-1.173164, 0.270722, -1.99624, 0, 0, 0, 1, 1,
-1.16993, -0.9512994, -1.69279, 0, 0, 0, 1, 1,
-1.162519, 1.210804, -0.9801176, 0, 0, 0, 1, 1,
-1.158637, 1.131214, -1.957682, 0, 0, 0, 1, 1,
-1.151022, -1.492382, -3.081506, 1, 1, 1, 1, 1,
-1.146828, -0.03479246, -2.772654, 1, 1, 1, 1, 1,
-1.141834, 0.9630336, 0.06748113, 1, 1, 1, 1, 1,
-1.131195, 1.447653, -2.232909, 1, 1, 1, 1, 1,
-1.121476, -1.338181, -2.9656, 1, 1, 1, 1, 1,
-1.118323, -0.2781823, -1.86301, 1, 1, 1, 1, 1,
-1.116709, 3.211715, 0.6069157, 1, 1, 1, 1, 1,
-1.110233, -0.754582, -2.870378, 1, 1, 1, 1, 1,
-1.103749, -1.067468, -2.635287, 1, 1, 1, 1, 1,
-1.100464, -0.6232443, -1.819455, 1, 1, 1, 1, 1,
-1.098946, -0.5205111, -2.317402, 1, 1, 1, 1, 1,
-1.098903, -1.339424, -1.104982, 1, 1, 1, 1, 1,
-1.093547, -0.3589006, -1.955337, 1, 1, 1, 1, 1,
-1.091769, 0.8986433, -0.1584305, 1, 1, 1, 1, 1,
-1.080949, 0.7222486, -1.983635, 1, 1, 1, 1, 1,
-1.077699, 1.856734, -0.9736853, 0, 0, 1, 1, 1,
-1.076121, -0.04809688, 0.1529894, 1, 0, 0, 1, 1,
-1.058458, -0.9320295, -1.659262, 1, 0, 0, 1, 1,
-1.055214, -0.1814551, -1.181037, 1, 0, 0, 1, 1,
-1.053539, -0.3631482, -2.496324, 1, 0, 0, 1, 1,
-1.050342, 0.8523498, -1.913453, 1, 0, 0, 1, 1,
-1.040037, 0.3559709, -0.8889884, 0, 0, 0, 1, 1,
-1.033216, -0.1897825, -1.500414, 0, 0, 0, 1, 1,
-1.027642, 0.2786376, 0.5826223, 0, 0, 0, 1, 1,
-1.023844, -0.8018917, -3.210639, 0, 0, 0, 1, 1,
-1.021309, -0.9852372, -2.245272, 0, 0, 0, 1, 1,
-1.019805, -0.3337308, -0.1592548, 0, 0, 0, 1, 1,
-1.013509, 0.9275592, -1.95233, 0, 0, 0, 1, 1,
-1.008295, 1.799316, -1.021051, 1, 1, 1, 1, 1,
-1.002554, -1.610038, -3.509933, 1, 1, 1, 1, 1,
-1.000799, 0.9953441, -2.056928, 1, 1, 1, 1, 1,
-0.9948003, -0.03812995, -1.772012, 1, 1, 1, 1, 1,
-0.9938545, 0.8019637, -1.554482, 1, 1, 1, 1, 1,
-0.9899905, -0.4715846, -0.7493827, 1, 1, 1, 1, 1,
-0.9895746, -0.0595741, -0.5708075, 1, 1, 1, 1, 1,
-0.988834, -0.3564809, -2.083, 1, 1, 1, 1, 1,
-0.9659168, 2.908497, -1.867068, 1, 1, 1, 1, 1,
-0.9625259, 1.473508, -0.4353113, 1, 1, 1, 1, 1,
-0.9601894, 0.2404074, -1.980355, 1, 1, 1, 1, 1,
-0.9594685, -0.03470895, -1.409368, 1, 1, 1, 1, 1,
-0.9593367, 0.3186038, -0.5848613, 1, 1, 1, 1, 1,
-0.9589496, 0.2495311, -1.493899, 1, 1, 1, 1, 1,
-0.954591, 0.6492206, -1.726953, 1, 1, 1, 1, 1,
-0.9522695, 0.6212109, -0.6896494, 0, 0, 1, 1, 1,
-0.9499841, -0.5422367, -2.279022, 1, 0, 0, 1, 1,
-0.9450908, 0.6847484, -1.069863, 1, 0, 0, 1, 1,
-0.9385535, 0.9735247, -1.30851, 1, 0, 0, 1, 1,
-0.9358553, -0.2400012, -1.818436, 1, 0, 0, 1, 1,
-0.9313971, -1.293766, -2.335711, 1, 0, 0, 1, 1,
-0.9288056, -0.7617079, -2.86573, 0, 0, 0, 1, 1,
-0.9262765, -0.2797435, -1.928797, 0, 0, 0, 1, 1,
-0.924086, -1.70769, -3.106029, 0, 0, 0, 1, 1,
-0.919885, -1.065592, -1.92994, 0, 0, 0, 1, 1,
-0.9194869, 0.2206304, -0.4573024, 0, 0, 0, 1, 1,
-0.9164323, -0.6408605, -0.1871069, 0, 0, 0, 1, 1,
-0.9142364, 0.6550576, -1.213622, 0, 0, 0, 1, 1,
-0.9114908, 0.9406532, -1.305757, 1, 1, 1, 1, 1,
-0.9091209, 0.7603176, -1.493038, 1, 1, 1, 1, 1,
-0.8938968, -0.4719736, -0.8169791, 1, 1, 1, 1, 1,
-0.8865057, -0.1134842, -2.409437, 1, 1, 1, 1, 1,
-0.8820884, 0.06777053, -3.293216, 1, 1, 1, 1, 1,
-0.8817454, -0.2339406, -2.23125, 1, 1, 1, 1, 1,
-0.878718, -0.2104092, -3.60911, 1, 1, 1, 1, 1,
-0.8742054, 1.493559, -1.128935, 1, 1, 1, 1, 1,
-0.8709999, 0.1237237, -1.387548, 1, 1, 1, 1, 1,
-0.8681673, -2.105069, -3.205098, 1, 1, 1, 1, 1,
-0.8671979, -1.26541, -1.535957, 1, 1, 1, 1, 1,
-0.8635031, 1.718196, -1.033049, 1, 1, 1, 1, 1,
-0.8632199, -0.5636309, -2.310022, 1, 1, 1, 1, 1,
-0.8593612, 1.067298, -1.112672, 1, 1, 1, 1, 1,
-0.8537114, 2.008629, -0.2640585, 1, 1, 1, 1, 1,
-0.8507379, -2.11639, -2.35632, 0, 0, 1, 1, 1,
-0.8499033, -0.8136881, -0.3212433, 1, 0, 0, 1, 1,
-0.8436636, 0.3837712, -0.2611131, 1, 0, 0, 1, 1,
-0.8392007, -0.1303101, -1.903269, 1, 0, 0, 1, 1,
-0.8368833, 0.8170481, -0.468363, 1, 0, 0, 1, 1,
-0.8336474, -0.2182317, -1.668701, 1, 0, 0, 1, 1,
-0.8251328, -0.3579112, -0.3718074, 0, 0, 0, 1, 1,
-0.8191192, 1.67928, -0.3473739, 0, 0, 0, 1, 1,
-0.8109856, -0.4879235, -1.970975, 0, 0, 0, 1, 1,
-0.8108827, 0.7039218, -1.112004, 0, 0, 0, 1, 1,
-0.8082405, 0.4668349, -2.363041, 0, 0, 0, 1, 1,
-0.8041976, -0.3327681, -0.355757, 0, 0, 0, 1, 1,
-0.7959229, 0.4559259, -0.2915593, 0, 0, 0, 1, 1,
-0.7935727, 0.8604325, -0.7067931, 1, 1, 1, 1, 1,
-0.7927032, -0.2175242, -3.264902, 1, 1, 1, 1, 1,
-0.7915893, -0.1754646, -2.246075, 1, 1, 1, 1, 1,
-0.7896763, -0.6247657, -3.512632, 1, 1, 1, 1, 1,
-0.786109, 0.2385265, 0.1027097, 1, 1, 1, 1, 1,
-0.7828857, -1.218373, -2.866584, 1, 1, 1, 1, 1,
-0.7766478, 0.0563195, -0.9964587, 1, 1, 1, 1, 1,
-0.769968, -0.5494859, -4.722367, 1, 1, 1, 1, 1,
-0.7687976, 0.1348284, -1.619045, 1, 1, 1, 1, 1,
-0.7672037, 0.09329712, -0.2861645, 1, 1, 1, 1, 1,
-0.7654178, -0.8313887, -2.556336, 1, 1, 1, 1, 1,
-0.7618935, 0.9144762, -0.09096806, 1, 1, 1, 1, 1,
-0.7603128, -1.851554, -2.39457, 1, 1, 1, 1, 1,
-0.7565926, -2.055911, -4.86149, 1, 1, 1, 1, 1,
-0.7521886, 1.033419, -1.646287, 1, 1, 1, 1, 1,
-0.7450554, -1.105263, -1.934229, 0, 0, 1, 1, 1,
-0.7417472, -0.2128924, -3.239885, 1, 0, 0, 1, 1,
-0.7388481, -0.01270922, -2.008092, 1, 0, 0, 1, 1,
-0.7385741, 1.696901, -0.8226736, 1, 0, 0, 1, 1,
-0.7347678, -0.1386001, -0.5161345, 1, 0, 0, 1, 1,
-0.7289565, -0.390581, -0.3616734, 1, 0, 0, 1, 1,
-0.7285084, 0.509916, -1.47995, 0, 0, 0, 1, 1,
-0.7242507, 0.3989169, -1.570452, 0, 0, 0, 1, 1,
-0.723835, 0.416832, -1.129934, 0, 0, 0, 1, 1,
-0.7222757, -0.9621389, -1.130601, 0, 0, 0, 1, 1,
-0.7204367, -0.09818149, -1.814578, 0, 0, 0, 1, 1,
-0.7192907, -0.995024, -3.035211, 0, 0, 0, 1, 1,
-0.718819, -0.1382176, -1.337808, 0, 0, 0, 1, 1,
-0.7147073, -0.6083482, -2.563873, 1, 1, 1, 1, 1,
-0.7049786, -0.2800823, -0.824993, 1, 1, 1, 1, 1,
-0.7039229, -0.3195985, -3.014688, 1, 1, 1, 1, 1,
-0.7017078, 0.07522239, -1.916334, 1, 1, 1, 1, 1,
-0.7015676, 1.32779, -0.295065, 1, 1, 1, 1, 1,
-0.6939261, -0.04777089, -2.575087, 1, 1, 1, 1, 1,
-0.6865277, -0.9739618, -0.4672723, 1, 1, 1, 1, 1,
-0.685645, -0.004245665, -0.8866853, 1, 1, 1, 1, 1,
-0.6830438, -1.213151, -3.063407, 1, 1, 1, 1, 1,
-0.6828534, 0.3361116, -0.6984298, 1, 1, 1, 1, 1,
-0.6799839, 0.4701537, -2.438298, 1, 1, 1, 1, 1,
-0.6796528, 0.42089, -1.666453, 1, 1, 1, 1, 1,
-0.6723698, -0.6448096, -2.269694, 1, 1, 1, 1, 1,
-0.6722162, 0.4775309, -1.894197, 1, 1, 1, 1, 1,
-0.6704717, 0.8725941, 0.146254, 1, 1, 1, 1, 1,
-0.6637256, 0.8524861, 0.7512733, 0, 0, 1, 1, 1,
-0.6635519, 0.899402, 0.8435027, 1, 0, 0, 1, 1,
-0.6605852, 1.774977, 0.7309762, 1, 0, 0, 1, 1,
-0.657337, -1.156749, -3.141299, 1, 0, 0, 1, 1,
-0.6530108, 2.059194, 0.1165932, 1, 0, 0, 1, 1,
-0.6517642, 0.2833517, -0.9921903, 1, 0, 0, 1, 1,
-0.6506331, -0.1620672, -3.922263, 0, 0, 0, 1, 1,
-0.6483967, -2.036783, -2.412991, 0, 0, 0, 1, 1,
-0.6438226, -1.091349, -1.039204, 0, 0, 0, 1, 1,
-0.6417138, -0.4640526, -2.755212, 0, 0, 0, 1, 1,
-0.6388795, -0.5236623, -3.106643, 0, 0, 0, 1, 1,
-0.6341119, 0.8969616, -1.20413, 0, 0, 0, 1, 1,
-0.6326452, -2.041906, -1.667469, 0, 0, 0, 1, 1,
-0.6317121, 0.6219993, 0.7603716, 1, 1, 1, 1, 1,
-0.6270857, -1.535269, -4.73443, 1, 1, 1, 1, 1,
-0.6266534, -0.08736288, -2.380809, 1, 1, 1, 1, 1,
-0.6230708, -0.8786844, -1.799832, 1, 1, 1, 1, 1,
-0.622881, 0.4568492, -1.650324, 1, 1, 1, 1, 1,
-0.620123, -1.129461, -2.529998, 1, 1, 1, 1, 1,
-0.6152816, 1.214433, -0.8445585, 1, 1, 1, 1, 1,
-0.6132392, 1.726332, 0.243925, 1, 1, 1, 1, 1,
-0.6059442, -1.054444, -1.561738, 1, 1, 1, 1, 1,
-0.596543, 0.9903162, 0.6922948, 1, 1, 1, 1, 1,
-0.5964145, 1.052997, 0.6792453, 1, 1, 1, 1, 1,
-0.5930423, 1.733039, -1.679002, 1, 1, 1, 1, 1,
-0.5870532, 0.5636767, -1.560641, 1, 1, 1, 1, 1,
-0.586678, 0.5561057, -0.3749342, 1, 1, 1, 1, 1,
-0.5851917, -1.580384, -2.348811, 1, 1, 1, 1, 1,
-0.5850384, 1.003303, -0.3260532, 0, 0, 1, 1, 1,
-0.5841612, 1.100725, -0.3224884, 1, 0, 0, 1, 1,
-0.5808943, 1.53436, 0.2987737, 1, 0, 0, 1, 1,
-0.5749429, 0.3827039, -1.281763, 1, 0, 0, 1, 1,
-0.5728444, 0.703662, 0.1770655, 1, 0, 0, 1, 1,
-0.5691474, 0.3129928, -1.983319, 1, 0, 0, 1, 1,
-0.5685417, 0.6684009, -1.332087, 0, 0, 0, 1, 1,
-0.5672259, -0.1728451, -2.315472, 0, 0, 0, 1, 1,
-0.5658786, -0.5302978, -3.883426, 0, 0, 0, 1, 1,
-0.5652065, 0.525652, -0.6625968, 0, 0, 0, 1, 1,
-0.5620054, 0.197681, -1.842242, 0, 0, 0, 1, 1,
-0.5601734, -0.4889195, -2.514836, 0, 0, 0, 1, 1,
-0.5600997, -0.9868333, -2.365553, 0, 0, 0, 1, 1,
-0.5556812, 0.711808, 0.2779873, 1, 1, 1, 1, 1,
-0.5518824, 0.8599081, 0.3157042, 1, 1, 1, 1, 1,
-0.5438468, -0.0594132, -2.802011, 1, 1, 1, 1, 1,
-0.5430811, 1.54123, -0.1815334, 1, 1, 1, 1, 1,
-0.5330254, -0.9600977, -2.317998, 1, 1, 1, 1, 1,
-0.5276589, 2.345416, 0.004880933, 1, 1, 1, 1, 1,
-0.5256501, 0.4208518, -0.9087127, 1, 1, 1, 1, 1,
-0.5249382, -1.259858, -3.538147, 1, 1, 1, 1, 1,
-0.521849, 0.1683346, -0.7255455, 1, 1, 1, 1, 1,
-0.5157867, -1.301174, -2.103137, 1, 1, 1, 1, 1,
-0.5100605, -0.6976033, -2.134467, 1, 1, 1, 1, 1,
-0.5065439, -0.728505, -2.27135, 1, 1, 1, 1, 1,
-0.5031003, 0.7267677, -0.8051511, 1, 1, 1, 1, 1,
-0.5010327, 1.587192, -0.1360269, 1, 1, 1, 1, 1,
-0.4948408, -0.06883871, -0.06808217, 1, 1, 1, 1, 1,
-0.4927946, 1.245968, -1.053963, 0, 0, 1, 1, 1,
-0.4904554, -0.6004192, -3.551815, 1, 0, 0, 1, 1,
-0.4826489, 1.911847, 0.9957558, 1, 0, 0, 1, 1,
-0.4822543, 1.745906, 0.03065722, 1, 0, 0, 1, 1,
-0.4820978, 0.01289838, -1.558946, 1, 0, 0, 1, 1,
-0.4796228, 0.8923751, -1.992586, 1, 0, 0, 1, 1,
-0.4794572, -0.6565039, -2.925828, 0, 0, 0, 1, 1,
-0.4756397, -1.245661, -3.471447, 0, 0, 0, 1, 1,
-0.473455, 0.441561, 0.5080909, 0, 0, 0, 1, 1,
-0.4721185, -1.304589, -1.697306, 0, 0, 0, 1, 1,
-0.4660123, -1.248644, -0.8020709, 0, 0, 0, 1, 1,
-0.4530114, 0.7717536, -1.212009, 0, 0, 0, 1, 1,
-0.4512175, -0.4643577, -2.889183, 0, 0, 0, 1, 1,
-0.4508357, -2.495625, -3.266241, 1, 1, 1, 1, 1,
-0.4483869, 1.011675, -0.5221331, 1, 1, 1, 1, 1,
-0.4479313, 0.2412791, -2.866343, 1, 1, 1, 1, 1,
-0.4446658, -0.588123, -1.669888, 1, 1, 1, 1, 1,
-0.4435287, -1.258095, -2.653886, 1, 1, 1, 1, 1,
-0.4374415, -1.047911, -3.19366, 1, 1, 1, 1, 1,
-0.436595, -0.4136294, -2.088378, 1, 1, 1, 1, 1,
-0.4355589, -2.370208, -3.43872, 1, 1, 1, 1, 1,
-0.435525, -0.3947854, -1.256821, 1, 1, 1, 1, 1,
-0.4317903, 0.3609074, -1.098606, 1, 1, 1, 1, 1,
-0.4308511, 0.3965466, -0.01915653, 1, 1, 1, 1, 1,
-0.4280547, 1.355545, 0.5941236, 1, 1, 1, 1, 1,
-0.4241683, -0.5306337, -2.327813, 1, 1, 1, 1, 1,
-0.4239938, 2.346666, -0.6415509, 1, 1, 1, 1, 1,
-0.4219235, 0.5690017, -1.381744, 1, 1, 1, 1, 1,
-0.4196913, -0.3820721, -3.505188, 0, 0, 1, 1, 1,
-0.4190987, -2.630332, -3.024015, 1, 0, 0, 1, 1,
-0.4190616, 0.9216418, -0.1931855, 1, 0, 0, 1, 1,
-0.4176147, 0.05995957, -2.438761, 1, 0, 0, 1, 1,
-0.4165106, -1.473424, -2.803073, 1, 0, 0, 1, 1,
-0.4143058, 0.5390528, -0.259231, 1, 0, 0, 1, 1,
-0.4053191, 1.745723, 0.3215065, 0, 0, 0, 1, 1,
-0.4038095, -0.338549, -2.457984, 0, 0, 0, 1, 1,
-0.4029935, 0.4545892, -1.60449, 0, 0, 0, 1, 1,
-0.401513, -0.1747027, -1.53001, 0, 0, 0, 1, 1,
-0.401149, -0.08835682, -0.8678532, 0, 0, 0, 1, 1,
-0.3993876, -0.8228437, -2.062855, 0, 0, 0, 1, 1,
-0.3978307, -0.9303783, -3.909225, 0, 0, 0, 1, 1,
-0.3959095, 0.1539253, -1.298414, 1, 1, 1, 1, 1,
-0.392558, 3.19811, 0.619154, 1, 1, 1, 1, 1,
-0.3904936, -0.7031181, -1.482209, 1, 1, 1, 1, 1,
-0.3880133, -1.096787, -2.928948, 1, 1, 1, 1, 1,
-0.3855798, -0.1509569, -1.834257, 1, 1, 1, 1, 1,
-0.3823712, -1.584345, -2.728343, 1, 1, 1, 1, 1,
-0.3815089, -0.5692829, -2.748019, 1, 1, 1, 1, 1,
-0.3786141, -0.9340644, -3.477634, 1, 1, 1, 1, 1,
-0.3691295, 1.185638, -0.2635432, 1, 1, 1, 1, 1,
-0.3666616, -0.7719684, -2.145017, 1, 1, 1, 1, 1,
-0.3616736, -0.1016935, -3.866791, 1, 1, 1, 1, 1,
-0.3607101, -0.5714673, 0.01751403, 1, 1, 1, 1, 1,
-0.3600372, 1.475999, 0.7286876, 1, 1, 1, 1, 1,
-0.3588959, -0.6327466, -1.976167, 1, 1, 1, 1, 1,
-0.3586476, -0.08342578, -2.62253, 1, 1, 1, 1, 1,
-0.3585569, -0.3584809, -2.678084, 0, 0, 1, 1, 1,
-0.3581042, -0.01985068, -1.430633, 1, 0, 0, 1, 1,
-0.3549538, 1.476389, -0.5787147, 1, 0, 0, 1, 1,
-0.3541178, -0.03001871, -1.126803, 1, 0, 0, 1, 1,
-0.3501146, -1.392013, -3.087098, 1, 0, 0, 1, 1,
-0.3451518, 0.7096305, -1.303658, 1, 0, 0, 1, 1,
-0.341651, -0.8189446, -3.808074, 0, 0, 0, 1, 1,
-0.3297088, 0.06172384, -0.4954605, 0, 0, 0, 1, 1,
-0.3256192, 0.4186677, 0.06942239, 0, 0, 0, 1, 1,
-0.3217902, -1.381521, -1.804648, 0, 0, 0, 1, 1,
-0.3216694, -0.3234507, -1.050488, 0, 0, 0, 1, 1,
-0.3156063, -0.4702196, -1.709566, 0, 0, 0, 1, 1,
-0.3123334, -0.3046825, -3.745302, 0, 0, 0, 1, 1,
-0.310634, 1.153623, 1.302447, 1, 1, 1, 1, 1,
-0.3105252, -1.256078, -2.4474, 1, 1, 1, 1, 1,
-0.3041694, -1.339776, -1.087206, 1, 1, 1, 1, 1,
-0.3041638, 0.4009731, 1.737877, 1, 1, 1, 1, 1,
-0.3038081, 0.3568363, -1.011822, 1, 1, 1, 1, 1,
-0.2965201, -1.014212, -0.9862032, 1, 1, 1, 1, 1,
-0.2946602, 0.05946103, -2.376099, 1, 1, 1, 1, 1,
-0.2944389, 0.01863235, -0.7073913, 1, 1, 1, 1, 1,
-0.2920369, -0.1163119, -1.732939, 1, 1, 1, 1, 1,
-0.2912036, 1.317471, 0.5123145, 1, 1, 1, 1, 1,
-0.2892161, -0.2742582, -0.6982971, 1, 1, 1, 1, 1,
-0.2810808, -0.5650954, -1.709755, 1, 1, 1, 1, 1,
-0.2809382, -0.2958045, -1.20411, 1, 1, 1, 1, 1,
-0.2798732, 1.236799, 0.6391362, 1, 1, 1, 1, 1,
-0.2704475, -1.768367, -1.456757, 1, 1, 1, 1, 1,
-0.2676573, 0.6567137, -2.295758, 0, 0, 1, 1, 1,
-0.2675295, 0.5977249, 0.5752134, 1, 0, 0, 1, 1,
-0.267363, 0.4312271, -0.5966608, 1, 0, 0, 1, 1,
-0.2644917, 0.8494509, -0.1707406, 1, 0, 0, 1, 1,
-0.263786, 0.7817611, 0.08954348, 1, 0, 0, 1, 1,
-0.2610292, -0.04104474, -2.099213, 1, 0, 0, 1, 1,
-0.2594507, -2.088312, -3.599645, 0, 0, 0, 1, 1,
-0.258135, -0.9826191, -4.390919, 0, 0, 0, 1, 1,
-0.2564652, -1.245762, -4.037175, 0, 0, 0, 1, 1,
-0.2546052, -1.289821, -2.613237, 0, 0, 0, 1, 1,
-0.2451319, -0.1166961, -1.700844, 0, 0, 0, 1, 1,
-0.244852, 0.3358944, -0.3460907, 0, 0, 0, 1, 1,
-0.2409038, 0.01978552, 0.06950308, 0, 0, 0, 1, 1,
-0.2398905, -0.1773242, -2.513904, 1, 1, 1, 1, 1,
-0.2385351, 0.8823671, 0.2184626, 1, 1, 1, 1, 1,
-0.2380812, -0.9138238, -4.039286, 1, 1, 1, 1, 1,
-0.2373611, -0.06561714, -2.037593, 1, 1, 1, 1, 1,
-0.2340506, -0.1135724, 0.5443192, 1, 1, 1, 1, 1,
-0.233183, -0.3123317, -0.6336043, 1, 1, 1, 1, 1,
-0.2328793, 0.5689781, 0.2120115, 1, 1, 1, 1, 1,
-0.2327992, -0.704901, -2.308729, 1, 1, 1, 1, 1,
-0.2294726, -1.126146, -3.480322, 1, 1, 1, 1, 1,
-0.2284774, 1.584262, 0.2375667, 1, 1, 1, 1, 1,
-0.2263851, 1.199413, 0.5559763, 1, 1, 1, 1, 1,
-0.2263363, -0.2579545, -1.920015, 1, 1, 1, 1, 1,
-0.2249417, 0.6609808, 0.9543673, 1, 1, 1, 1, 1,
-0.2234478, -2.379432, -1.779903, 1, 1, 1, 1, 1,
-0.2213709, -1.589598, -3.676101, 1, 1, 1, 1, 1,
-0.2192553, -1.110747, -2.274706, 0, 0, 1, 1, 1,
-0.2186939, -0.324764, -3.342301, 1, 0, 0, 1, 1,
-0.2165723, -0.8547091, -2.104919, 1, 0, 0, 1, 1,
-0.2123353, -0.2471319, -2.61074, 1, 0, 0, 1, 1,
-0.2112825, 0.4998853, 0.0293733, 1, 0, 0, 1, 1,
-0.2093352, 0.6425472, 0.8565918, 1, 0, 0, 1, 1,
-0.2080588, -2.115581, -2.917935, 0, 0, 0, 1, 1,
-0.2069603, 0.08713569, -1.232221, 0, 0, 0, 1, 1,
-0.2018678, -0.4442016, -3.395444, 0, 0, 0, 1, 1,
-0.1978501, 1.058144, -0.6890494, 0, 0, 0, 1, 1,
-0.196441, -0.4546257, -3.333718, 0, 0, 0, 1, 1,
-0.1936319, -0.1259372, -1.783512, 0, 0, 0, 1, 1,
-0.1913956, -1.032266, -2.001104, 0, 0, 0, 1, 1,
-0.1896454, -0.01036808, -2.438106, 1, 1, 1, 1, 1,
-0.1875226, 0.4917296, -0.001399264, 1, 1, 1, 1, 1,
-0.187426, 0.4140219, 0.7885698, 1, 1, 1, 1, 1,
-0.1868911, 0.588685, 0.2858739, 1, 1, 1, 1, 1,
-0.1860351, -0.7943085, -2.657716, 1, 1, 1, 1, 1,
-0.1858556, 0.6252452, -1.219898, 1, 1, 1, 1, 1,
-0.180805, -0.3943582, -4.266606, 1, 1, 1, 1, 1,
-0.1805627, 0.4862905, -1.637407, 1, 1, 1, 1, 1,
-0.1781603, 1.08165, 1.307069, 1, 1, 1, 1, 1,
-0.1729038, 0.1204856, -0.7057542, 1, 1, 1, 1, 1,
-0.1695759, 0.2403484, 1.03799, 1, 1, 1, 1, 1,
-0.1675166, -1.010083, -1.763581, 1, 1, 1, 1, 1,
-0.162147, -0.5295575, -1.908294, 1, 1, 1, 1, 1,
-0.1567833, -0.3066827, -4.008376, 1, 1, 1, 1, 1,
-0.1551203, -2.698023, -2.545185, 1, 1, 1, 1, 1,
-0.1483652, 0.8760421, -0.6791359, 0, 0, 1, 1, 1,
-0.1477228, 1.454507, -1.593595, 1, 0, 0, 1, 1,
-0.1471181, -0.3488911, -2.492925, 1, 0, 0, 1, 1,
-0.1470682, -0.7125098, -2.984105, 1, 0, 0, 1, 1,
-0.1437196, 0.3037691, -0.2494244, 1, 0, 0, 1, 1,
-0.1409426, -0.3502701, -2.592581, 1, 0, 0, 1, 1,
-0.1395454, -0.3333495, -2.928314, 0, 0, 0, 1, 1,
-0.1314117, -0.6587754, -2.760585, 0, 0, 0, 1, 1,
-0.1313525, -0.3721448, -4.32679, 0, 0, 0, 1, 1,
-0.1281113, 0.8266364, 0.6822591, 0, 0, 0, 1, 1,
-0.1221231, -0.01510256, -0.4434735, 0, 0, 0, 1, 1,
-0.1127539, -0.2999822, -2.82491, 0, 0, 0, 1, 1,
-0.103621, -0.4289455, -2.667289, 0, 0, 0, 1, 1,
-0.1001206, 0.439678, -2.277776, 1, 1, 1, 1, 1,
-0.09997938, 1.158, -0.8550742, 1, 1, 1, 1, 1,
-0.08803485, 0.8635077, 0.3769044, 1, 1, 1, 1, 1,
-0.08577927, -0.8390762, -3.326214, 1, 1, 1, 1, 1,
-0.08518564, -0.0397968, -3.360607, 1, 1, 1, 1, 1,
-0.08205341, 0.2808289, 0.8236566, 1, 1, 1, 1, 1,
-0.07593258, -2.214933, -4.019127, 1, 1, 1, 1, 1,
-0.07415866, -0.02874069, -2.819303, 1, 1, 1, 1, 1,
-0.07044374, 0.421696, -1.471883, 1, 1, 1, 1, 1,
-0.06331747, 0.196389, 0.1708706, 1, 1, 1, 1, 1,
-0.06236298, 0.09208161, -0.8441066, 1, 1, 1, 1, 1,
-0.06066057, -1.139905, -1.494213, 1, 1, 1, 1, 1,
-0.05984, -0.8774816, -4.379718, 1, 1, 1, 1, 1,
-0.05916468, -0.6151859, -3.087766, 1, 1, 1, 1, 1,
-0.05907423, 1.218307, -0.5070314, 1, 1, 1, 1, 1,
-0.05811096, 0.2322236, -0.5535462, 0, 0, 1, 1, 1,
-0.05765996, 0.1838804, -0.7788765, 1, 0, 0, 1, 1,
-0.05652244, -2.217235, -3.128153, 1, 0, 0, 1, 1,
-0.05520049, -0.8111812, -1.733659, 1, 0, 0, 1, 1,
-0.05018935, -0.1016917, -1.69501, 1, 0, 0, 1, 1,
-0.04665062, -0.4525952, -2.641655, 1, 0, 0, 1, 1,
-0.04565683, -0.9333159, -2.863874, 0, 0, 0, 1, 1,
-0.04468793, -0.2280646, -2.723353, 0, 0, 0, 1, 1,
-0.04434043, 0.2557604, 0.3644287, 0, 0, 0, 1, 1,
-0.03813709, 0.8565199, -1.579068, 0, 0, 0, 1, 1,
-0.03574399, 0.4169059, -0.3599602, 0, 0, 0, 1, 1,
-0.03177766, -0.8982584, -3.193102, 0, 0, 0, 1, 1,
-0.02469262, -0.5948187, -1.885391, 0, 0, 0, 1, 1,
-0.02355635, -0.5436057, -4.727822, 1, 1, 1, 1, 1,
-0.02347183, -0.01545321, -2.610839, 1, 1, 1, 1, 1,
-0.02342947, -0.1341666, -5.371722, 1, 1, 1, 1, 1,
-0.02218263, 3.068474, 0.569782, 1, 1, 1, 1, 1,
-0.01978479, 0.6293662, 0.3466593, 1, 1, 1, 1, 1,
-0.007677146, 0.08279556, 0.7857976, 1, 1, 1, 1, 1,
-0.005132193, 1.212751, -1.131186, 1, 1, 1, 1, 1,
-0.005062036, 0.1295209, -1.40406, 1, 1, 1, 1, 1,
-0.003469638, 0.06051065, 0.9057344, 1, 1, 1, 1, 1,
-0.00227093, -0.4052671, -4.12665, 1, 1, 1, 1, 1,
0.0004230608, -1.543404, 2.100644, 1, 1, 1, 1, 1,
0.009628768, -0.13817, 2.990053, 1, 1, 1, 1, 1,
0.01030546, -0.01697579, 3.286991, 1, 1, 1, 1, 1,
0.01136203, -0.09736548, 3.082664, 1, 1, 1, 1, 1,
0.01213925, 1.681144, -1.968992, 1, 1, 1, 1, 1,
0.01389015, 1.299464, -1.004669, 0, 0, 1, 1, 1,
0.01677439, -1.130011, 2.46158, 1, 0, 0, 1, 1,
0.01770168, 1.198507, -0.878141, 1, 0, 0, 1, 1,
0.01943144, -1.39125, 5.139885, 1, 0, 0, 1, 1,
0.02144933, -0.5646697, 3.238441, 1, 0, 0, 1, 1,
0.0254202, -1.211772, 1.65522, 1, 0, 0, 1, 1,
0.02774479, 0.6941358, -2.028464, 0, 0, 0, 1, 1,
0.03674801, 1.993977, 0.05846231, 0, 0, 0, 1, 1,
0.04293514, -0.7004282, 3.88453, 0, 0, 0, 1, 1,
0.04720557, -0.17215, 2.716966, 0, 0, 0, 1, 1,
0.04732174, 0.2017862, 1.754813, 0, 0, 0, 1, 1,
0.04734155, -0.1428796, 3.829378, 0, 0, 0, 1, 1,
0.04925917, 0.3194716, -1.502917, 0, 0, 0, 1, 1,
0.05481236, 2.586806, -0.1552971, 1, 1, 1, 1, 1,
0.05895052, -1.827664, 5.22965, 1, 1, 1, 1, 1,
0.05930358, -0.504438, 0.823678, 1, 1, 1, 1, 1,
0.06288581, 0.6458646, -1.112737, 1, 1, 1, 1, 1,
0.06613795, 1.593122, 0.01476607, 1, 1, 1, 1, 1,
0.0669998, -1.049417, 3.574547, 1, 1, 1, 1, 1,
0.06862873, -1.399294, 3.149289, 1, 1, 1, 1, 1,
0.06985679, -1.026866, 1.77672, 1, 1, 1, 1, 1,
0.07150236, 0.697758, -0.7177147, 1, 1, 1, 1, 1,
0.07559038, -1.063751, 1.709783, 1, 1, 1, 1, 1,
0.07644957, 0.6864017, 1.934922, 1, 1, 1, 1, 1,
0.08169042, -1.056491, 3.839874, 1, 1, 1, 1, 1,
0.0865739, -0.8761804, 2.867496, 1, 1, 1, 1, 1,
0.09297366, -0.7065467, 1.74755, 1, 1, 1, 1, 1,
0.09510629, 0.2698682, 1.518317, 1, 1, 1, 1, 1,
0.1009812, -1.633601, 2.141945, 0, 0, 1, 1, 1,
0.1013039, 0.2978638, 0.2040163, 1, 0, 0, 1, 1,
0.1016183, 1.670967, -0.1994525, 1, 0, 0, 1, 1,
0.1035764, -1.095408, 2.348535, 1, 0, 0, 1, 1,
0.1070856, 0.1788999, 1.400831, 1, 0, 0, 1, 1,
0.1096114, 0.6747596, 2.264255, 1, 0, 0, 1, 1,
0.1107192, -0.4814411, 3.998558, 0, 0, 0, 1, 1,
0.1134077, -0.06736782, 0.8499509, 0, 0, 0, 1, 1,
0.1144807, 1.140893, 1.250606, 0, 0, 0, 1, 1,
0.1166332, -0.6864203, 3.497199, 0, 0, 0, 1, 1,
0.1257573, 0.6105024, -0.4199483, 0, 0, 0, 1, 1,
0.1270389, -0.1241063, 1.682204, 0, 0, 0, 1, 1,
0.1282706, 0.1591875, 0.5691239, 0, 0, 0, 1, 1,
0.1318676, -0.534126, 3.735714, 1, 1, 1, 1, 1,
0.1351769, 0.2734902, -0.5216697, 1, 1, 1, 1, 1,
0.1352852, -0.1693636, 4.574744, 1, 1, 1, 1, 1,
0.1368023, 0.7124885, 0.2725315, 1, 1, 1, 1, 1,
0.1412446, 0.383393, 1.356796, 1, 1, 1, 1, 1,
0.1426919, -1.256167, 1.510478, 1, 1, 1, 1, 1,
0.1439299, -0.3067615, 2.648138, 1, 1, 1, 1, 1,
0.1444241, 0.3442785, -0.7665122, 1, 1, 1, 1, 1,
0.1447759, -1.028373, 1.852081, 1, 1, 1, 1, 1,
0.1456837, -1.041535, 2.416282, 1, 1, 1, 1, 1,
0.1544456, 0.1346577, 2.389899, 1, 1, 1, 1, 1,
0.1556896, -0.8133245, 3.092647, 1, 1, 1, 1, 1,
0.1576785, 1.891706, -1.879869, 1, 1, 1, 1, 1,
0.1608038, -1.443735, 4.513594, 1, 1, 1, 1, 1,
0.1638205, -0.476939, 2.845809, 1, 1, 1, 1, 1,
0.1638279, 0.5777969, -0.9575155, 0, 0, 1, 1, 1,
0.1704409, 0.8501996, 1.164642, 1, 0, 0, 1, 1,
0.1710351, 1.556621, 0.4316083, 1, 0, 0, 1, 1,
0.1734858, 0.08512617, 3.50276, 1, 0, 0, 1, 1,
0.1763014, 0.2455825, 1.894333, 1, 0, 0, 1, 1,
0.1768573, 1.408378, -1.290962, 1, 0, 0, 1, 1,
0.1781587, 1.453157, 0.2398839, 0, 0, 0, 1, 1,
0.1799439, -0.8912719, 5.472245, 0, 0, 0, 1, 1,
0.1833944, 0.4061373, 0.5834563, 0, 0, 0, 1, 1,
0.1844635, -0.3231687, 2.989283, 0, 0, 0, 1, 1,
0.1870309, 0.04964103, 3.052896, 0, 0, 0, 1, 1,
0.1891421, 1.96011, 0.9250644, 0, 0, 0, 1, 1,
0.1891655, -0.1682603, 1.870727, 0, 0, 0, 1, 1,
0.1898053, 1.319768, 0.0960627, 1, 1, 1, 1, 1,
0.1902853, 0.8222333, -0.810383, 1, 1, 1, 1, 1,
0.1932169, 0.1110401, 2.642934, 1, 1, 1, 1, 1,
0.1948018, 0.1071768, 0.8908489, 1, 1, 1, 1, 1,
0.1980632, 0.8993955, 0.7382777, 1, 1, 1, 1, 1,
0.1986748, -0.9803299, 4.530517, 1, 1, 1, 1, 1,
0.2064119, -0.6694033, 2.327444, 1, 1, 1, 1, 1,
0.2065259, 0.07858545, 1.090433, 1, 1, 1, 1, 1,
0.2129981, -1.715397, 3.934906, 1, 1, 1, 1, 1,
0.2147443, -0.6255642, 2.704325, 1, 1, 1, 1, 1,
0.215282, -1.140722, 3.808555, 1, 1, 1, 1, 1,
0.217686, -0.4519755, 3.155611, 1, 1, 1, 1, 1,
0.2226863, -1.008097, 4.353368, 1, 1, 1, 1, 1,
0.2266552, -0.8139549, 2.278769, 1, 1, 1, 1, 1,
0.227124, -0.006983716, 0.9814129, 1, 1, 1, 1, 1,
0.2284955, 0.6784402, -0.3355943, 0, 0, 1, 1, 1,
0.229533, 0.5081382, -1.263526, 1, 0, 0, 1, 1,
0.2339187, -0.5674988, 2.099198, 1, 0, 0, 1, 1,
0.2341869, -0.7534282, 3.279817, 1, 0, 0, 1, 1,
0.2371122, -0.9279019, 1.649885, 1, 0, 0, 1, 1,
0.2427964, -0.03785147, -0.1436974, 1, 0, 0, 1, 1,
0.2460631, -0.2446662, 3.950858, 0, 0, 0, 1, 1,
0.2528588, 1.028988, 1.016655, 0, 0, 0, 1, 1,
0.2575101, 1.784958, 0.6357709, 0, 0, 0, 1, 1,
0.2585372, -1.250541, 4.680942, 0, 0, 0, 1, 1,
0.2628366, 0.4370478, 0.9516945, 0, 0, 0, 1, 1,
0.2641061, -0.6521711, 1.83966, 0, 0, 0, 1, 1,
0.2644926, -0.7260776, 4.191516, 0, 0, 0, 1, 1,
0.266877, -0.1151588, 1.540995, 1, 1, 1, 1, 1,
0.2693111, -0.557547, 3.199855, 1, 1, 1, 1, 1,
0.269944, -0.3624396, 1.879882, 1, 1, 1, 1, 1,
0.2720188, 1.358963, 0.09958509, 1, 1, 1, 1, 1,
0.2736537, 0.5460317, 1.976168, 1, 1, 1, 1, 1,
0.2756457, -0.7267604, 1.747562, 1, 1, 1, 1, 1,
0.2791716, 2.67389, 0.800241, 1, 1, 1, 1, 1,
0.2811246, -1.60892, 3.75736, 1, 1, 1, 1, 1,
0.2827502, 0.3905863, 0.4424188, 1, 1, 1, 1, 1,
0.2840808, -0.960716, 2.124058, 1, 1, 1, 1, 1,
0.2846593, -0.9558619, 3.94649, 1, 1, 1, 1, 1,
0.2846891, -0.5790821, 3.93782, 1, 1, 1, 1, 1,
0.284769, -0.3967246, 2.116436, 1, 1, 1, 1, 1,
0.2902447, -1.21302, 1.266216, 1, 1, 1, 1, 1,
0.2913524, -1.394869, 2.749103, 1, 1, 1, 1, 1,
0.2929585, 0.1441203, -0.9626016, 0, 0, 1, 1, 1,
0.2975121, 1.592703, 0.7368623, 1, 0, 0, 1, 1,
0.3003291, 1.842758, 1.887611, 1, 0, 0, 1, 1,
0.3016728, -0.3846178, 0.8026388, 1, 0, 0, 1, 1,
0.3020983, -1.219495, 2.582082, 1, 0, 0, 1, 1,
0.3031271, -1.013232, 4.664398, 1, 0, 0, 1, 1,
0.303486, 0.02246147, 1.680577, 0, 0, 0, 1, 1,
0.3053026, -0.9309562, 3.221325, 0, 0, 0, 1, 1,
0.3067494, -1.684458, 3.024311, 0, 0, 0, 1, 1,
0.3084719, -0.02760974, 1.379827, 0, 0, 0, 1, 1,
0.318782, 1.368226, 0.4910155, 0, 0, 0, 1, 1,
0.3223559, -0.8683784, 0.924911, 0, 0, 0, 1, 1,
0.3225896, -0.4585738, 3.184731, 0, 0, 0, 1, 1,
0.3235802, -1.312203, 2.945973, 1, 1, 1, 1, 1,
0.32413, 0.05851908, 0.9248426, 1, 1, 1, 1, 1,
0.3242865, 0.9540238, 1.143008, 1, 1, 1, 1, 1,
0.3283881, 0.6313472, 2.001068, 1, 1, 1, 1, 1,
0.337118, 2.302688, -1.208364, 1, 1, 1, 1, 1,
0.3421192, 0.4526004, 0.2971152, 1, 1, 1, 1, 1,
0.3452831, 1.204486, 0.4217602, 1, 1, 1, 1, 1,
0.3498116, -0.7772264, 3.037293, 1, 1, 1, 1, 1,
0.3502636, 0.7346646, 0.1782045, 1, 1, 1, 1, 1,
0.3518372, 0.9270333, -0.4873498, 1, 1, 1, 1, 1,
0.355503, 0.7280312, 0.4397294, 1, 1, 1, 1, 1,
0.3575081, 0.7137542, 2.245167, 1, 1, 1, 1, 1,
0.3586337, 0.5269738, 0.1803507, 1, 1, 1, 1, 1,
0.3645259, 0.9895759, 0.1352756, 1, 1, 1, 1, 1,
0.3654597, 0.1519647, 1.886769, 1, 1, 1, 1, 1,
0.367362, -0.875853, 4.053395, 0, 0, 1, 1, 1,
0.3673807, 0.3713193, 1.340432, 1, 0, 0, 1, 1,
0.3700899, -1.346858, 3.837939, 1, 0, 0, 1, 1,
0.3724286, -0.04322735, 0.2158878, 1, 0, 0, 1, 1,
0.3759471, -0.5430667, 3.093386, 1, 0, 0, 1, 1,
0.3763164, 0.150418, 1.807444, 1, 0, 0, 1, 1,
0.3770922, 0.03767938, 1.587986, 0, 0, 0, 1, 1,
0.3804525, -1.710708, 3.558885, 0, 0, 0, 1, 1,
0.3809154, 0.1093693, -0.2434089, 0, 0, 0, 1, 1,
0.3877005, -0.4944773, 2.801446, 0, 0, 0, 1, 1,
0.3880281, -1.697774, 2.957898, 0, 0, 0, 1, 1,
0.3880967, 1.729847, -1.916894, 0, 0, 0, 1, 1,
0.3883424, 1.223353, -0.2101162, 0, 0, 0, 1, 1,
0.3893203, 1.415595, -0.1336139, 1, 1, 1, 1, 1,
0.3914199, -1.020729, 2.594226, 1, 1, 1, 1, 1,
0.3934429, 1.285423, 1.176328, 1, 1, 1, 1, 1,
0.3973997, 0.0894106, 1.717124, 1, 1, 1, 1, 1,
0.3979541, -1.041729, 2.138007, 1, 1, 1, 1, 1,
0.4007252, 0.851581, -0.8050388, 1, 1, 1, 1, 1,
0.4042107, -2.440322, 2.391542, 1, 1, 1, 1, 1,
0.4099647, -1.401627, 2.699255, 1, 1, 1, 1, 1,
0.4140958, 1.658733, 0.8293917, 1, 1, 1, 1, 1,
0.4149996, 2.437432, 0.6242892, 1, 1, 1, 1, 1,
0.4185751, 0.5754935, -0.7905475, 1, 1, 1, 1, 1,
0.4195263, 0.2399362, -0.1005567, 1, 1, 1, 1, 1,
0.4200891, 1.267455, 1.260753, 1, 1, 1, 1, 1,
0.4209677, 0.0365111, -0.591954, 1, 1, 1, 1, 1,
0.4234215, -1.175111, 2.666351, 1, 1, 1, 1, 1,
0.4300638, 0.4670109, -0.1879097, 0, 0, 1, 1, 1,
0.4392542, 1.494835, -0.6513181, 1, 0, 0, 1, 1,
0.4410236, -0.810258, 2.373943, 1, 0, 0, 1, 1,
0.4420175, -1.825275, 5.376494, 1, 0, 0, 1, 1,
0.4506163, -0.6717086, 2.986153, 1, 0, 0, 1, 1,
0.4553267, 1.235778, -0.3460467, 1, 0, 0, 1, 1,
0.4573011, -0.2190945, 1.200665, 0, 0, 0, 1, 1,
0.4624012, -0.3450734, 2.742686, 0, 0, 0, 1, 1,
0.4633486, -1.209506, 2.592639, 0, 0, 0, 1, 1,
0.4677472, 2.496695, -0.5732592, 0, 0, 0, 1, 1,
0.4720431, -1.804034, 2.441001, 0, 0, 0, 1, 1,
0.473612, 1.477566, 1.862597, 0, 0, 0, 1, 1,
0.4741849, -1.335793, 2.56635, 0, 0, 0, 1, 1,
0.4750651, -0.2965876, 3.044776, 1, 1, 1, 1, 1,
0.4756207, -1.727902, 2.234133, 1, 1, 1, 1, 1,
0.4762946, 0.6154387, 0.4550976, 1, 1, 1, 1, 1,
0.476421, -0.7416186, 2.142852, 1, 1, 1, 1, 1,
0.4765298, -0.2695965, 0.5236781, 1, 1, 1, 1, 1,
0.4807922, 1.012677, 0.8292821, 1, 1, 1, 1, 1,
0.4831358, 0.8660359, 1.69717, 1, 1, 1, 1, 1,
0.4851125, 1.131324, 0.02797464, 1, 1, 1, 1, 1,
0.4874182, -1.202409, 3.751558, 1, 1, 1, 1, 1,
0.4891595, -0.2705256, 0.8805131, 1, 1, 1, 1, 1,
0.4902138, -0.8140913, 4.149251, 1, 1, 1, 1, 1,
0.4938149, 0.3935203, 0.9031306, 1, 1, 1, 1, 1,
0.4959613, -1.002416, 2.167003, 1, 1, 1, 1, 1,
0.5037403, -0.6419865, 2.145084, 1, 1, 1, 1, 1,
0.504613, -1.067593, 1.237727, 1, 1, 1, 1, 1,
0.5054364, 0.1287842, 1.276836, 0, 0, 1, 1, 1,
0.5114727, 1.0145, 0.9847099, 1, 0, 0, 1, 1,
0.5172224, 1.756553, -0.556293, 1, 0, 0, 1, 1,
0.5187029, 0.5064838, -0.2894586, 1, 0, 0, 1, 1,
0.5193198, -0.2142983, 1.992287, 1, 0, 0, 1, 1,
0.5252931, -0.6636357, 3.446784, 1, 0, 0, 1, 1,
0.532645, 1.766358, 1.610513, 0, 0, 0, 1, 1,
0.5329825, 0.3991052, 1.732065, 0, 0, 0, 1, 1,
0.5409642, -0.6534911, 2.692563, 0, 0, 0, 1, 1,
0.5411358, 0.1022086, 0.1791536, 0, 0, 0, 1, 1,
0.5546359, 1.700239, 0.1121661, 0, 0, 0, 1, 1,
0.5589231, 1.608176, -0.2887379, 0, 0, 0, 1, 1,
0.5635108, -0.3266972, 1.547699, 0, 0, 0, 1, 1,
0.5646554, -0.3570069, 2.116139, 1, 1, 1, 1, 1,
0.5663906, -0.6299547, 2.113852, 1, 1, 1, 1, 1,
0.5800009, 0.4866452, 1.223797, 1, 1, 1, 1, 1,
0.5803041, -1.245634, 1.275185, 1, 1, 1, 1, 1,
0.5805382, -0.4547792, 2.368139, 1, 1, 1, 1, 1,
0.5863311, -0.8146477, 2.790862, 1, 1, 1, 1, 1,
0.5869952, -0.7127301, 1.15662, 1, 1, 1, 1, 1,
0.5876972, 1.339333, -0.05239721, 1, 1, 1, 1, 1,
0.5884485, 1.215438, 2.414898, 1, 1, 1, 1, 1,
0.5930288, -0.8551847, 1.881904, 1, 1, 1, 1, 1,
0.5960388, -0.4234246, 0.4375603, 1, 1, 1, 1, 1,
0.5990586, 0.3589876, 0.06609624, 1, 1, 1, 1, 1,
0.6012371, 0.8450888, 2.170022, 1, 1, 1, 1, 1,
0.6109554, -0.8511391, 3.654424, 1, 1, 1, 1, 1,
0.6191263, 0.2394071, 0.8058535, 1, 1, 1, 1, 1,
0.622156, 0.5735116, 0.2313815, 0, 0, 1, 1, 1,
0.6222574, -0.9643822, 0.9970973, 1, 0, 0, 1, 1,
0.6247773, 0.1996568, 1.46199, 1, 0, 0, 1, 1,
0.625357, 0.9392229, 0.4089214, 1, 0, 0, 1, 1,
0.6264539, 1.128357, -0.7103508, 1, 0, 0, 1, 1,
0.6291183, -1.242537, 3.902987, 1, 0, 0, 1, 1,
0.6364048, 0.661406, 0.2341522, 0, 0, 0, 1, 1,
0.6403387, -0.07221212, 2.214894, 0, 0, 0, 1, 1,
0.6418052, -2.117219, 3.12819, 0, 0, 0, 1, 1,
0.6469305, 0.8334792, 0.4172524, 0, 0, 0, 1, 1,
0.6512805, -0.636081, 0.5728467, 0, 0, 0, 1, 1,
0.6563242, -1.45013, 3.013078, 0, 0, 0, 1, 1,
0.6569569, -1.800717, 2.856413, 0, 0, 0, 1, 1,
0.6583539, 1.417931, 2.332105, 1, 1, 1, 1, 1,
0.659327, -0.1408258, 1.512914, 1, 1, 1, 1, 1,
0.6649673, -0.2356901, 3.109581, 1, 1, 1, 1, 1,
0.6653278, 1.84062, -0.9547141, 1, 1, 1, 1, 1,
0.668431, -0.1858831, 2.912977, 1, 1, 1, 1, 1,
0.6777288, 0.1338447, 1.106755, 1, 1, 1, 1, 1,
0.6794688, -0.7821416, 3.672468, 1, 1, 1, 1, 1,
0.6872752, -0.03930746, 3.128345, 1, 1, 1, 1, 1,
0.6879631, 0.1644799, 1.913102, 1, 1, 1, 1, 1,
0.6888036, -0.0693555, 1.851116, 1, 1, 1, 1, 1,
0.704128, -0.8666837, 2.130542, 1, 1, 1, 1, 1,
0.7097077, 0.9042242, -0.07203706, 1, 1, 1, 1, 1,
0.7132469, 0.01214107, 1.694835, 1, 1, 1, 1, 1,
0.7141583, 0.4971964, 1.952773, 1, 1, 1, 1, 1,
0.7195491, -0.7014862, 2.580292, 1, 1, 1, 1, 1,
0.7225007, -0.7594905, 2.31109, 0, 0, 1, 1, 1,
0.7226026, -0.2691765, 1.996706, 1, 0, 0, 1, 1,
0.7227315, -0.1772825, 0.5315769, 1, 0, 0, 1, 1,
0.7271771, -0.4435845, 2.940715, 1, 0, 0, 1, 1,
0.731418, 1.400946, 0.6151099, 1, 0, 0, 1, 1,
0.7325629, 0.05259132, 1.405974, 1, 0, 0, 1, 1,
0.739365, 0.2376191, 0.2615519, 0, 0, 0, 1, 1,
0.7450777, -0.5701373, 3.546811, 0, 0, 0, 1, 1,
0.7492887, 0.4036249, 1.411717, 0, 0, 0, 1, 1,
0.7497959, 0.1427089, -1.214811, 0, 0, 0, 1, 1,
0.7508795, -0.5616546, 1.241705, 0, 0, 0, 1, 1,
0.7594393, 0.456844, 1.498405, 0, 0, 0, 1, 1,
0.7614685, -1.796254, 2.044845, 0, 0, 0, 1, 1,
0.7623885, 0.4260968, 1.64669, 1, 1, 1, 1, 1,
0.7637269, -0.4706289, 2.744718, 1, 1, 1, 1, 1,
0.764415, -0.3048387, 3.214052, 1, 1, 1, 1, 1,
0.7669874, -1.196877, 1.692514, 1, 1, 1, 1, 1,
0.7695471, -0.08212625, 2.216667, 1, 1, 1, 1, 1,
0.7700322, -0.5717761, 3.650735, 1, 1, 1, 1, 1,
0.7700976, 0.4274437, 0.255343, 1, 1, 1, 1, 1,
0.7719702, -0.3144322, 1.138813, 1, 1, 1, 1, 1,
0.7765728, 0.4942166, 1.539969, 1, 1, 1, 1, 1,
0.7906604, 0.187243, 0.4131918, 1, 1, 1, 1, 1,
0.7919054, 0.3551846, 2.722059, 1, 1, 1, 1, 1,
0.7955573, -0.02382896, 1.145159, 1, 1, 1, 1, 1,
0.8029227, 1.108864, 0.6643304, 1, 1, 1, 1, 1,
0.8050939, -1.772122, 3.091721, 1, 1, 1, 1, 1,
0.8059605, -0.8251341, 2.706185, 1, 1, 1, 1, 1,
0.8072676, -0.2058972, 1.792958, 0, 0, 1, 1, 1,
0.8087721, 0.7371484, -0.864709, 1, 0, 0, 1, 1,
0.8113469, -1.224199, 2.760861, 1, 0, 0, 1, 1,
0.8140932, -0.1656054, 0.7294468, 1, 0, 0, 1, 1,
0.816327, -0.1158831, 3.38143, 1, 0, 0, 1, 1,
0.8194847, -0.5065832, 2.547521, 1, 0, 0, 1, 1,
0.8270388, -1.634297, 2.335189, 0, 0, 0, 1, 1,
0.8300118, -1.442349, 3.210881, 0, 0, 0, 1, 1,
0.8367333, -1.213583, 2.697878, 0, 0, 0, 1, 1,
0.8410389, 0.03739994, 2.112313, 0, 0, 0, 1, 1,
0.843195, -1.254434, 1.182072, 0, 0, 0, 1, 1,
0.8432967, 1.031552, 1.883806, 0, 0, 0, 1, 1,
0.8438099, 0.3496705, 0.7457649, 0, 0, 0, 1, 1,
0.8465656, -0.6288514, 2.54422, 1, 1, 1, 1, 1,
0.8470604, -1.499343, 5.164909, 1, 1, 1, 1, 1,
0.8491247, -0.4170972, 3.239933, 1, 1, 1, 1, 1,
0.8491975, 0.8843233, 2.122534, 1, 1, 1, 1, 1,
0.851551, -0.3009546, 3.73677, 1, 1, 1, 1, 1,
0.8546696, -0.09788892, 1.062895, 1, 1, 1, 1, 1,
0.8592174, 0.6049695, 0.8313416, 1, 1, 1, 1, 1,
0.8606324, -0.7594812, 3.245515, 1, 1, 1, 1, 1,
0.8628203, -1.237807, 2.49815, 1, 1, 1, 1, 1,
0.8697863, 0.5350927, -0.2274363, 1, 1, 1, 1, 1,
0.8784046, 0.6453282, -0.1245827, 1, 1, 1, 1, 1,
0.8786378, -0.4492064, 1.284687, 1, 1, 1, 1, 1,
0.8823669, -2.668309, 3.053741, 1, 1, 1, 1, 1,
0.8823906, 0.2501621, 1.896221, 1, 1, 1, 1, 1,
0.8848931, -1.724858, 3.407858, 1, 1, 1, 1, 1,
0.8873525, 2.394824, -0.5653806, 0, 0, 1, 1, 1,
0.8878832, -1.369573, 1.686034, 1, 0, 0, 1, 1,
0.8921903, -0.03546612, 2.669914, 1, 0, 0, 1, 1,
0.892732, 1.150722, 0.7262822, 1, 0, 0, 1, 1,
0.8976372, -0.768028, 2.638238, 1, 0, 0, 1, 1,
0.9080498, -0.7117327, 0.7840961, 1, 0, 0, 1, 1,
0.9134254, -1.612031, 2.733395, 0, 0, 0, 1, 1,
0.9200963, -0.3696184, -0.4072725, 0, 0, 0, 1, 1,
0.9268703, 0.468063, 0.2332052, 0, 0, 0, 1, 1,
0.9272872, 0.2371017, 2.185977, 0, 0, 0, 1, 1,
0.9295931, -0.9062331, 2.468254, 0, 0, 0, 1, 1,
0.9382936, -0.2908806, 0.5511634, 0, 0, 0, 1, 1,
0.9420863, -0.7395163, 1.40919, 0, 0, 0, 1, 1,
0.9464023, 3.123051, 0.04070188, 1, 1, 1, 1, 1,
0.9472016, -0.150883, 2.33377, 1, 1, 1, 1, 1,
0.9621529, -0.8053988, 3.491121, 1, 1, 1, 1, 1,
0.9690462, 0.6905822, -0.9920343, 1, 1, 1, 1, 1,
0.978917, 1.433123, 2.094286, 1, 1, 1, 1, 1,
0.9877003, 1.67433, 1.63953, 1, 1, 1, 1, 1,
0.9908872, 0.2731028, 1.430593, 1, 1, 1, 1, 1,
0.9996303, 1.261463, 1.041727, 1, 1, 1, 1, 1,
1.001716, -0.3051151, 2.35795, 1, 1, 1, 1, 1,
1.006283, -1.089877, 1.794257, 1, 1, 1, 1, 1,
1.008575, -0.2253549, 2.374822, 1, 1, 1, 1, 1,
1.017086, 2.002601, 0.347503, 1, 1, 1, 1, 1,
1.018508, -0.3672445, 1.959116, 1, 1, 1, 1, 1,
1.026405, -1.357872, 1.534108, 1, 1, 1, 1, 1,
1.026753, -0.6133942, 4.826478, 1, 1, 1, 1, 1,
1.027116, 0.8731753, 0.761327, 0, 0, 1, 1, 1,
1.03884, -0.0003281252, 2.130238, 1, 0, 0, 1, 1,
1.039815, -0.6270489, 1.454673, 1, 0, 0, 1, 1,
1.040111, 0.7301953, 1.243474, 1, 0, 0, 1, 1,
1.047581, -1.086222, 0.8806145, 1, 0, 0, 1, 1,
1.049943, 1.375462, 1.759329, 1, 0, 0, 1, 1,
1.050804, 0.3481781, 2.623007, 0, 0, 0, 1, 1,
1.053864, -0.6115556, 3.239588, 0, 0, 0, 1, 1,
1.056531, -0.9013473, 1.940891, 0, 0, 0, 1, 1,
1.057185, -1.131868, 2.945625, 0, 0, 0, 1, 1,
1.057363, 0.5016711, 0.2542684, 0, 0, 0, 1, 1,
1.060205, -0.586108, 1.309365, 0, 0, 0, 1, 1,
1.062616, 2.016302, 2.109367, 0, 0, 0, 1, 1,
1.065143, -0.2303813, -0.1211165, 1, 1, 1, 1, 1,
1.065529, -0.459185, 0.4252757, 1, 1, 1, 1, 1,
1.076007, 0.5289987, -0.01274774, 1, 1, 1, 1, 1,
1.0775, 1.398196, -0.5379608, 1, 1, 1, 1, 1,
1.083965, 0.9592675, 2.162196, 1, 1, 1, 1, 1,
1.085713, 0.3735151, 0.5200606, 1, 1, 1, 1, 1,
1.089901, 0.5370482, 0.9321008, 1, 1, 1, 1, 1,
1.091276, -0.05113313, 2.784714, 1, 1, 1, 1, 1,
1.093511, 0.530154, 1.960027, 1, 1, 1, 1, 1,
1.097871, -0.2685063, 2.123633, 1, 1, 1, 1, 1,
1.099188, -0.9196982, 2.045354, 1, 1, 1, 1, 1,
1.099453, 1.791059, -0.5472272, 1, 1, 1, 1, 1,
1.117147, 1.331291, -0.4283895, 1, 1, 1, 1, 1,
1.119159, 0.8135178, 1.794747, 1, 1, 1, 1, 1,
1.125346, 0.4493834, 1.528891, 1, 1, 1, 1, 1,
1.134935, -0.6739551, 1.685437, 0, 0, 1, 1, 1,
1.145875, 0.8040744, 0.8714633, 1, 0, 0, 1, 1,
1.149363, 0.9573806, 0.9624658, 1, 0, 0, 1, 1,
1.159305, -0.5075247, 2.847825, 1, 0, 0, 1, 1,
1.166116, -0.1977952, 0.2493804, 1, 0, 0, 1, 1,
1.167276, -1.260807, 1.577344, 1, 0, 0, 1, 1,
1.173958, 0.5524998, 0.226097, 0, 0, 0, 1, 1,
1.174747, 0.4344033, 1.097911, 0, 0, 0, 1, 1,
1.174977, -0.1539617, 2.395076, 0, 0, 0, 1, 1,
1.174994, -0.03449011, -1.321667, 0, 0, 0, 1, 1,
1.178686, -1.24501, 4.022467, 0, 0, 0, 1, 1,
1.180572, -1.08816, 3.076732, 0, 0, 0, 1, 1,
1.183358, 0.7684513, -0.558226, 0, 0, 0, 1, 1,
1.194927, -0.04875733, 1.838991, 1, 1, 1, 1, 1,
1.211029, 0.6165243, 0.5628962, 1, 1, 1, 1, 1,
1.211643, -0.5885238, 1.949314, 1, 1, 1, 1, 1,
1.235078, -0.2691799, 0.07391717, 1, 1, 1, 1, 1,
1.247073, 1.635191, -0.7877777, 1, 1, 1, 1, 1,
1.264585, 0.1376111, 0.8590905, 1, 1, 1, 1, 1,
1.275137, -0.3188765, 1.404879, 1, 1, 1, 1, 1,
1.277212, -1.410224, 3.13227, 1, 1, 1, 1, 1,
1.280564, -0.5986468, 2.531602, 1, 1, 1, 1, 1,
1.28178, 0.2768307, 2.722831, 1, 1, 1, 1, 1,
1.282464, -1.160534, 3.466633, 1, 1, 1, 1, 1,
1.289934, 1.27161, 1.291808, 1, 1, 1, 1, 1,
1.290671, -0.02315549, 1.799632, 1, 1, 1, 1, 1,
1.29113, -0.4062374, 2.654069, 1, 1, 1, 1, 1,
1.291884, 0.3643953, 0.3485111, 1, 1, 1, 1, 1,
1.295798, -0.5259172, 2.414111, 0, 0, 1, 1, 1,
1.300727, -0.1008153, 2.317667, 1, 0, 0, 1, 1,
1.303769, 0.469032, 0.4844737, 1, 0, 0, 1, 1,
1.308998, -0.5097694, 1.632766, 1, 0, 0, 1, 1,
1.310341, 0.7403852, 0.9837533, 1, 0, 0, 1, 1,
1.313665, 1.995615, 1.599403, 1, 0, 0, 1, 1,
1.319509, 0.9188473, 0.947295, 0, 0, 0, 1, 1,
1.3205, 0.747793, -0.7061977, 0, 0, 0, 1, 1,
1.325571, -0.5408404, 2.295979, 0, 0, 0, 1, 1,
1.326349, -0.9568326, 2.86541, 0, 0, 0, 1, 1,
1.334708, 0.2918595, 1.715501, 0, 0, 0, 1, 1,
1.338186, -0.4351096, 1.184981, 0, 0, 0, 1, 1,
1.344509, 2.267984, -0.1320793, 0, 0, 0, 1, 1,
1.34649, -1.760899, 2.481053, 1, 1, 1, 1, 1,
1.369126, -2.872617, 2.304327, 1, 1, 1, 1, 1,
1.39613, 0.8752451, -0.810627, 1, 1, 1, 1, 1,
1.397849, -0.5616759, 2.289381, 1, 1, 1, 1, 1,
1.397859, 0.1207539, 0.9030075, 1, 1, 1, 1, 1,
1.403043, -1.316448, 2.719718, 1, 1, 1, 1, 1,
1.404696, 0.7362617, 0.7514174, 1, 1, 1, 1, 1,
1.4094, 1.015961, 0.5906152, 1, 1, 1, 1, 1,
1.419678, -0.9505407, 1.335091, 1, 1, 1, 1, 1,
1.422312, 0.8079646, 1.070414, 1, 1, 1, 1, 1,
1.429576, 0.1831833, 2.233433, 1, 1, 1, 1, 1,
1.432269, 1.292144, 1.251559, 1, 1, 1, 1, 1,
1.449854, 0.7805827, 0.7838229, 1, 1, 1, 1, 1,
1.45315, 0.1971755, 0.6076708, 1, 1, 1, 1, 1,
1.453582, 0.273641, 1.713063, 1, 1, 1, 1, 1,
1.459417, 0.6707582, 2.027772, 0, 0, 1, 1, 1,
1.460561, -1.135122, 0.1187431, 1, 0, 0, 1, 1,
1.462534, 4.054285, -0.2940958, 1, 0, 0, 1, 1,
1.464716, 1.342839, 0.5988575, 1, 0, 0, 1, 1,
1.465016, -0.4879415, 0.2998914, 1, 0, 0, 1, 1,
1.470951, 0.2872329, 2.235708, 1, 0, 0, 1, 1,
1.477132, 1.07741, 0.03274185, 0, 0, 0, 1, 1,
1.485275, -0.5223728, 1.109876, 0, 0, 0, 1, 1,
1.490353, 0.6558069, 1.882362, 0, 0, 0, 1, 1,
1.494523, -1.882232, 3.526224, 0, 0, 0, 1, 1,
1.50539, -0.3962751, -0.0002665792, 0, 0, 0, 1, 1,
1.506844, -0.5512891, 2.008219, 0, 0, 0, 1, 1,
1.540089, -0.09468138, 0.3756595, 0, 0, 0, 1, 1,
1.556057, -1.003428, 3.969963, 1, 1, 1, 1, 1,
1.560158, -0.2565485, 2.387744, 1, 1, 1, 1, 1,
1.562878, -0.5865863, 3.417383, 1, 1, 1, 1, 1,
1.592873, -0.9521859, 4.287489, 1, 1, 1, 1, 1,
1.607336, 0.5264278, 0.7155105, 1, 1, 1, 1, 1,
1.609806, 0.3900643, 1.63, 1, 1, 1, 1, 1,
1.610375, 0.02392793, 2.168381, 1, 1, 1, 1, 1,
1.611334, 1.252563, 1.7503, 1, 1, 1, 1, 1,
1.620329, -1.013566, 2.333732, 1, 1, 1, 1, 1,
1.644423, 1.256, 1.721249, 1, 1, 1, 1, 1,
1.652958, -0.3045926, 0.4721403, 1, 1, 1, 1, 1,
1.653551, 0.4246707, 1.215105, 1, 1, 1, 1, 1,
1.6574, -1.353108, 2.973088, 1, 1, 1, 1, 1,
1.659793, 0.4555092, 0.8256013, 1, 1, 1, 1, 1,
1.662688, -0.7237027, 1.588246, 1, 1, 1, 1, 1,
1.67153, -0.2003413, 1.510139, 0, 0, 1, 1, 1,
1.677513, -0.3797548, 2.020142, 1, 0, 0, 1, 1,
1.680021, -0.8254634, 1.782797, 1, 0, 0, 1, 1,
1.6822, 1.152481, 1.862908, 1, 0, 0, 1, 1,
1.688828, 0.478979, 0.5980614, 1, 0, 0, 1, 1,
1.727598, -0.6547117, 1.981819, 1, 0, 0, 1, 1,
1.739422, 0.01806543, 2.471077, 0, 0, 0, 1, 1,
1.742529, 0.6255355, 2.192331, 0, 0, 0, 1, 1,
1.764378, 0.9808648, 2.102889, 0, 0, 0, 1, 1,
1.81118, -0.8817639, 1.746922, 0, 0, 0, 1, 1,
1.818309, -1.744228, 0.6522748, 0, 0, 0, 1, 1,
1.821586, 0.3694693, 2.547761, 0, 0, 0, 1, 1,
1.822965, 0.4079515, 0.389855, 0, 0, 0, 1, 1,
1.833288, -0.6973464, 2.342788, 1, 1, 1, 1, 1,
1.835931, 1.074165, 0.6283453, 1, 1, 1, 1, 1,
1.839334, -1.769251, 3.024226, 1, 1, 1, 1, 1,
1.844823, -0.7927026, 2.814714, 1, 1, 1, 1, 1,
1.865872, -0.7594581, 2.147355, 1, 1, 1, 1, 1,
1.884852, 0.6508877, 1.602531, 1, 1, 1, 1, 1,
1.885861, -0.9623706, 1.511914, 1, 1, 1, 1, 1,
1.914362, 0.8830953, -0.4836203, 1, 1, 1, 1, 1,
1.931859, -1.032282, 2.429086, 1, 1, 1, 1, 1,
1.971589, 0.3329707, 3.708884, 1, 1, 1, 1, 1,
1.981485, -1.684307, 1.405131, 1, 1, 1, 1, 1,
1.986686, 1.740422, 1.217849, 1, 1, 1, 1, 1,
1.999296, 1.650907, -0.6756088, 1, 1, 1, 1, 1,
2.03941, -0.4369837, 1.432976, 1, 1, 1, 1, 1,
2.048733, 0.174317, 0.9907061, 1, 1, 1, 1, 1,
2.075527, -0.001783499, 0.2793075, 0, 0, 1, 1, 1,
2.112016, 0.6411005, 0.676052, 1, 0, 0, 1, 1,
2.115683, 2.335637, 0.789597, 1, 0, 0, 1, 1,
2.11884, -0.8015252, 0.9134042, 1, 0, 0, 1, 1,
2.12657, 0.06130673, 1.460881, 1, 0, 0, 1, 1,
2.128567, 2.51389, 0.6546571, 1, 0, 0, 1, 1,
2.134506, -0.5747472, 1.428966, 0, 0, 0, 1, 1,
2.224155, 1.144792, 0.2072637, 0, 0, 0, 1, 1,
2.255092, -1.063562, 2.261709, 0, 0, 0, 1, 1,
2.266394, 0.1412191, 2.270738, 0, 0, 0, 1, 1,
2.278707, 1.77556, 4.019276, 0, 0, 0, 1, 1,
2.364526, 0.1965038, 1.274163, 0, 0, 0, 1, 1,
2.495979, -0.7432677, 3.298216, 0, 0, 0, 1, 1,
2.532389, -0.9058225, 0.9539028, 1, 1, 1, 1, 1,
2.554073, -1.443562, 1.981331, 1, 1, 1, 1, 1,
2.606307, -0.9279827, 1.234303, 1, 1, 1, 1, 1,
2.619528, 0.3160216, -0.1723961, 1, 1, 1, 1, 1,
2.629655, 0.4216291, 2.522472, 1, 1, 1, 1, 1,
2.881361, -0.6851458, 3.256547, 1, 1, 1, 1, 1,
3.448741, 1.114247, 1.862169, 1, 1, 1, 1, 1
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
var radius = 9.676508;
var distance = 33.98832;
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
mvMatrix.translate( -0.4213502, -0.5908338, -0.0502615 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.98832);
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
