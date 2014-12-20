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
-2.7973, 0.8623096, -1.679291, 1, 0, 0, 1,
-2.758489, -0.549831, -1.53591, 1, 0.007843138, 0, 1,
-2.731698, 0.1143875, -0.3725615, 1, 0.01176471, 0, 1,
-2.596929, 1.159276, -0.5630655, 1, 0.01960784, 0, 1,
-2.58343, 0.8369803, -2.122497, 1, 0.02352941, 0, 1,
-2.574256, 0.3541419, 0.1759741, 1, 0.03137255, 0, 1,
-2.461101, 0.7753882, -2.083563, 1, 0.03529412, 0, 1,
-2.404034, 0.0165395, -1.009807, 1, 0.04313726, 0, 1,
-2.395226, 0.1238642, -3.063892, 1, 0.04705882, 0, 1,
-2.362777, 0.4930981, -1.401614, 1, 0.05490196, 0, 1,
-2.335186, 0.9759852, -3.823044, 1, 0.05882353, 0, 1,
-2.294116, -0.1608075, -1.218469, 1, 0.06666667, 0, 1,
-2.226428, 0.08664129, -1.340709, 1, 0.07058824, 0, 1,
-2.209321, 0.8112498, -2.252244, 1, 0.07843138, 0, 1,
-2.182665, -1.395037, -1.945001, 1, 0.08235294, 0, 1,
-2.116596, 0.6333623, 0.2877237, 1, 0.09019608, 0, 1,
-2.110045, -0.382723, -1.759149, 1, 0.09411765, 0, 1,
-2.052445, -0.701867, -0.8557784, 1, 0.1019608, 0, 1,
-2.030847, -0.9573537, -1.217541, 1, 0.1098039, 0, 1,
-2.030014, 1.827296, 0.09894206, 1, 0.1137255, 0, 1,
-2.017086, -0.175643, -1.575864, 1, 0.1215686, 0, 1,
-1.945197, 0.5579968, -0.4794527, 1, 0.1254902, 0, 1,
-1.924911, 0.6555644, -2.462633, 1, 0.1333333, 0, 1,
-1.915546, 0.7305957, -0.6981797, 1, 0.1372549, 0, 1,
-1.899252, -0.3211406, -1.978043, 1, 0.145098, 0, 1,
-1.883719, -0.552969, -2.205688, 1, 0.1490196, 0, 1,
-1.874872, 0.2947454, -1.086191, 1, 0.1568628, 0, 1,
-1.874195, 1.82207, -0.7942508, 1, 0.1607843, 0, 1,
-1.87393, 0.9768991, -0.261208, 1, 0.1686275, 0, 1,
-1.859049, -0.5573795, -2.038187, 1, 0.172549, 0, 1,
-1.856801, 0.5511588, -1.817059, 1, 0.1803922, 0, 1,
-1.83641, -1.41992, -3.498253, 1, 0.1843137, 0, 1,
-1.787849, -1.1413, -1.215267, 1, 0.1921569, 0, 1,
-1.760588, 0.6519161, -1.629182, 1, 0.1960784, 0, 1,
-1.74253, -1.034688, -1.758078, 1, 0.2039216, 0, 1,
-1.73739, -0.9557278, -3.683108, 1, 0.2117647, 0, 1,
-1.732427, -0.4731883, -2.034973, 1, 0.2156863, 0, 1,
-1.724648, -0.5574183, -1.864536, 1, 0.2235294, 0, 1,
-1.721136, 0.7480817, 0.2524648, 1, 0.227451, 0, 1,
-1.705011, 0.1061323, -0.6902651, 1, 0.2352941, 0, 1,
-1.679287, 0.1098708, -1.195203, 1, 0.2392157, 0, 1,
-1.666248, -0.5952391, -3.939432, 1, 0.2470588, 0, 1,
-1.662406, 0.3392415, -0.5801213, 1, 0.2509804, 0, 1,
-1.660194, -0.4620221, -0.7644943, 1, 0.2588235, 0, 1,
-1.655955, -0.7077608, -3.719452, 1, 0.2627451, 0, 1,
-1.647962, 0.1453777, -2.394652, 1, 0.2705882, 0, 1,
-1.622779, -0.4072834, -2.919882, 1, 0.2745098, 0, 1,
-1.576344, 0.1745089, -2.430435, 1, 0.282353, 0, 1,
-1.565563, 1.277106, -0.2522329, 1, 0.2862745, 0, 1,
-1.557801, 0.04991275, -0.6456437, 1, 0.2941177, 0, 1,
-1.550038, 0.2098767, -0.7713379, 1, 0.3019608, 0, 1,
-1.540536, 1.179737, 1.903753, 1, 0.3058824, 0, 1,
-1.535517, -0.3619391, -1.93789, 1, 0.3137255, 0, 1,
-1.534058, 0.4627804, -2.562217, 1, 0.3176471, 0, 1,
-1.529695, -0.3510015, -4.072307, 1, 0.3254902, 0, 1,
-1.512023, -1.544228, -3.353828, 1, 0.3294118, 0, 1,
-1.494649, -1.659218, -2.504004, 1, 0.3372549, 0, 1,
-1.479851, -0.8832477, -0.7473949, 1, 0.3411765, 0, 1,
-1.465011, 1.147915, -1.503997, 1, 0.3490196, 0, 1,
-1.462836, -0.391443, -1.171303, 1, 0.3529412, 0, 1,
-1.457601, -1.432516, -3.379361, 1, 0.3607843, 0, 1,
-1.445574, 0.06273554, -2.741918, 1, 0.3647059, 0, 1,
-1.444088, -0.1550998, -2.432208, 1, 0.372549, 0, 1,
-1.419291, 1.502921, -0.1915138, 1, 0.3764706, 0, 1,
-1.416267, 0.6755494, 0.310621, 1, 0.3843137, 0, 1,
-1.410657, -0.3985092, -2.80303, 1, 0.3882353, 0, 1,
-1.406734, 0.7783858, -0.3959486, 1, 0.3960784, 0, 1,
-1.401412, -0.7993169, -1.518546, 1, 0.4039216, 0, 1,
-1.400975, -0.5118068, -0.4739305, 1, 0.4078431, 0, 1,
-1.399978, -1.206277, -1.121168, 1, 0.4156863, 0, 1,
-1.398801, 1.180303, -0.833662, 1, 0.4196078, 0, 1,
-1.384652, -0.2713116, -0.8918043, 1, 0.427451, 0, 1,
-1.377847, 0.1978906, -0.721984, 1, 0.4313726, 0, 1,
-1.377425, -1.012367, -0.8580581, 1, 0.4392157, 0, 1,
-1.368369, -0.9853649, -5.169014, 1, 0.4431373, 0, 1,
-1.362543, -0.2120171, -0.8047944, 1, 0.4509804, 0, 1,
-1.362445, -0.8281408, -1.619516, 1, 0.454902, 0, 1,
-1.355249, -0.8090645, -0.1898017, 1, 0.4627451, 0, 1,
-1.354482, -0.7139828, -3.403476, 1, 0.4666667, 0, 1,
-1.34148, 0.6305283, -0.3796504, 1, 0.4745098, 0, 1,
-1.340496, -0.4219245, -0.88089, 1, 0.4784314, 0, 1,
-1.33829, 0.02794916, -2.608442, 1, 0.4862745, 0, 1,
-1.334701, -0.6432142, -2.552305, 1, 0.4901961, 0, 1,
-1.324157, 1.153148, -0.7258123, 1, 0.4980392, 0, 1,
-1.318616, 1.19851, -0.5468473, 1, 0.5058824, 0, 1,
-1.317539, -0.5424787, -1.309365, 1, 0.509804, 0, 1,
-1.310771, 1.152271, -2.676151, 1, 0.5176471, 0, 1,
-1.308509, 0.4871764, -1.126814, 1, 0.5215687, 0, 1,
-1.306192, -0.1776264, -1.735219, 1, 0.5294118, 0, 1,
-1.298515, -1.486499, -2.081903, 1, 0.5333334, 0, 1,
-1.297549, 0.02741174, -1.298411, 1, 0.5411765, 0, 1,
-1.292645, 0.05815309, -2.851557, 1, 0.5450981, 0, 1,
-1.283911, 1.272843, 0.314321, 1, 0.5529412, 0, 1,
-1.282937, 0.5775569, 0.2776518, 1, 0.5568628, 0, 1,
-1.276721, -0.2717539, -1.531048, 1, 0.5647059, 0, 1,
-1.246433, 0.1432705, -1.152114, 1, 0.5686275, 0, 1,
-1.240711, -0.2620299, -1.497431, 1, 0.5764706, 0, 1,
-1.233114, 0.1777021, -1.930936, 1, 0.5803922, 0, 1,
-1.229949, -1.378625, -3.398655, 1, 0.5882353, 0, 1,
-1.213738, 1.063064, -1.775055, 1, 0.5921569, 0, 1,
-1.211311, -0.2274135, -0.8794722, 1, 0.6, 0, 1,
-1.202884, 0.4356732, -1.70741, 1, 0.6078432, 0, 1,
-1.197835, 0.5424477, -2.249341, 1, 0.6117647, 0, 1,
-1.193849, -0.2457602, -0.7460068, 1, 0.6196079, 0, 1,
-1.18622, 0.1292102, -0.2007217, 1, 0.6235294, 0, 1,
-1.185744, -1.358178, -1.768414, 1, 0.6313726, 0, 1,
-1.181274, 0.9630969, -1.945439, 1, 0.6352941, 0, 1,
-1.180862, -0.5411428, -3.509447, 1, 0.6431373, 0, 1,
-1.178355, -0.3126006, -1.089943, 1, 0.6470588, 0, 1,
-1.17632, -1.417671, -0.3671174, 1, 0.654902, 0, 1,
-1.175737, 1.512253, -0.349569, 1, 0.6588235, 0, 1,
-1.148347, 0.7891547, -1.978517, 1, 0.6666667, 0, 1,
-1.146377, 0.5857041, 0.625619, 1, 0.6705883, 0, 1,
-1.144504, -0.4555663, -1.598262, 1, 0.6784314, 0, 1,
-1.143672, 1.522353, -1.163854, 1, 0.682353, 0, 1,
-1.14239, -1.224329, -3.655504, 1, 0.6901961, 0, 1,
-1.141768, 0.5440665, -1.278587, 1, 0.6941177, 0, 1,
-1.14081, 0.8712217, -0.3012668, 1, 0.7019608, 0, 1,
-1.139065, -2.308609, -1.108186, 1, 0.7098039, 0, 1,
-1.133894, -1.788369, -2.873428, 1, 0.7137255, 0, 1,
-1.125997, -1.24106, -2.600322, 1, 0.7215686, 0, 1,
-1.120791, 0.5299574, -0.628019, 1, 0.7254902, 0, 1,
-1.11422, 0.1989505, -2.197603, 1, 0.7333333, 0, 1,
-1.112317, -0.6487381, -1.466099, 1, 0.7372549, 0, 1,
-1.09916, 1.011517, -0.540386, 1, 0.7450981, 0, 1,
-1.095494, 0.3677831, -0.6762966, 1, 0.7490196, 0, 1,
-1.093969, -0.6575293, -2.237516, 1, 0.7568628, 0, 1,
-1.09253, -2.005618, -2.597417, 1, 0.7607843, 0, 1,
-1.089535, -0.676531, -4.616599, 1, 0.7686275, 0, 1,
-1.08889, -1.275819, -3.561855, 1, 0.772549, 0, 1,
-1.082004, 0.8829151, -0.6570014, 1, 0.7803922, 0, 1,
-1.079102, 0.3346705, -1.617625, 1, 0.7843137, 0, 1,
-1.070645, -2.607335, -2.368165, 1, 0.7921569, 0, 1,
-1.064974, -1.486732, -3.02927, 1, 0.7960784, 0, 1,
-1.059618, 0.9973832, 0.0540424, 1, 0.8039216, 0, 1,
-1.053526, 0.07385013, -0.5288089, 1, 0.8117647, 0, 1,
-1.046813, 1.581977, -0.04070911, 1, 0.8156863, 0, 1,
-1.046104, -0.03500215, -2.222013, 1, 0.8235294, 0, 1,
-1.045853, 0.1721855, -0.1082824, 1, 0.827451, 0, 1,
-1.03804, 0.01324806, -0.3959554, 1, 0.8352941, 0, 1,
-1.036978, -1.267218, -0.8999898, 1, 0.8392157, 0, 1,
-1.034457, 0.9854105, -2.24206, 1, 0.8470588, 0, 1,
-1.021065, -0.4915279, -2.063536, 1, 0.8509804, 0, 1,
-1.013058, -0.05537067, -1.502095, 1, 0.8588235, 0, 1,
-1.009731, -1.849854, -3.189954, 1, 0.8627451, 0, 1,
-1.009513, 0.4940535, -0.7190504, 1, 0.8705882, 0, 1,
-1.005439, 0.3817768, -0.2731699, 1, 0.8745098, 0, 1,
-1.004302, 0.8939654, -0.05779333, 1, 0.8823529, 0, 1,
-1.002419, 0.3022532, -1.677642, 1, 0.8862745, 0, 1,
-0.9979139, -1.656639, -3.400227, 1, 0.8941177, 0, 1,
-0.9839475, -0.705162, 0.5144204, 1, 0.8980392, 0, 1,
-0.9689617, 0.3404216, -1.78604, 1, 0.9058824, 0, 1,
-0.968574, -0.408088, -3.527013, 1, 0.9137255, 0, 1,
-0.963585, -0.5646569, -3.532524, 1, 0.9176471, 0, 1,
-0.9552829, -0.08626915, -1.847101, 1, 0.9254902, 0, 1,
-0.9550682, 0.8937384, -0.4300846, 1, 0.9294118, 0, 1,
-0.9510545, 0.2763098, -2.099646, 1, 0.9372549, 0, 1,
-0.9495921, 0.9645017, -0.4161626, 1, 0.9411765, 0, 1,
-0.9478261, -0.2353272, -2.242316, 1, 0.9490196, 0, 1,
-0.9453917, 0.7161589, -0.8003615, 1, 0.9529412, 0, 1,
-0.9397944, -1.646224, -2.573215, 1, 0.9607843, 0, 1,
-0.9319117, -0.0004150951, -0.4761274, 1, 0.9647059, 0, 1,
-0.9291585, 1.283902, -0.9495599, 1, 0.972549, 0, 1,
-0.9257784, -0.2561636, -1.885312, 1, 0.9764706, 0, 1,
-0.9255773, -0.4461325, -1.58745, 1, 0.9843137, 0, 1,
-0.9238687, 1.76505, 0.2183648, 1, 0.9882353, 0, 1,
-0.9176637, 0.3703886, -1.568442, 1, 0.9960784, 0, 1,
-0.9133762, 0.9242742, -1.148716, 0.9960784, 1, 0, 1,
-0.9127505, -0.5249342, -2.578798, 0.9921569, 1, 0, 1,
-0.8956671, -0.1219926, -1.259084, 0.9843137, 1, 0, 1,
-0.893366, 0.6933507, -1.24562, 0.9803922, 1, 0, 1,
-0.8908392, -0.1217905, -2.168951, 0.972549, 1, 0, 1,
-0.8898389, 0.4227737, -0.7145666, 0.9686275, 1, 0, 1,
-0.8894773, 0.3497411, -1.840354, 0.9607843, 1, 0, 1,
-0.886944, 0.1057037, -1.678766, 0.9568627, 1, 0, 1,
-0.878267, -0.7335997, -2.362208, 0.9490196, 1, 0, 1,
-0.8771104, 1.44876, -0.9546042, 0.945098, 1, 0, 1,
-0.8770134, 1.350282, 0.6539819, 0.9372549, 1, 0, 1,
-0.8720186, -0.2384143, -1.265208, 0.9333333, 1, 0, 1,
-0.8609785, 0.640122, -0.6342061, 0.9254902, 1, 0, 1,
-0.8575802, -0.301492, -2.717611, 0.9215686, 1, 0, 1,
-0.8526709, -0.1730956, -1.596846, 0.9137255, 1, 0, 1,
-0.8513597, 0.4775264, -1.78634, 0.9098039, 1, 0, 1,
-0.849548, 1.260862, -1.743543, 0.9019608, 1, 0, 1,
-0.8413706, -1.310079, -0.6656771, 0.8941177, 1, 0, 1,
-0.841222, -0.816246, -4.471641, 0.8901961, 1, 0, 1,
-0.8370408, -0.558187, -1.072407, 0.8823529, 1, 0, 1,
-0.8300967, 0.6255144, 0.8928264, 0.8784314, 1, 0, 1,
-0.8244311, 1.26382, -0.9321294, 0.8705882, 1, 0, 1,
-0.8241429, 0.3883947, -2.368964, 0.8666667, 1, 0, 1,
-0.8227173, -0.2211202, -1.572802, 0.8588235, 1, 0, 1,
-0.8202531, 1.377858, -0.3202326, 0.854902, 1, 0, 1,
-0.819514, 2.070394, -0.1201813, 0.8470588, 1, 0, 1,
-0.8117797, 1.611501, -0.2626723, 0.8431373, 1, 0, 1,
-0.8099893, -0.5499111, -1.96873, 0.8352941, 1, 0, 1,
-0.8095607, 1.221372, -1.296754, 0.8313726, 1, 0, 1,
-0.8058886, -1.401677, -0.8672875, 0.8235294, 1, 0, 1,
-0.8042235, 0.5818834, 0.4672168, 0.8196079, 1, 0, 1,
-0.8010408, 0.7937102, -1.615946, 0.8117647, 1, 0, 1,
-0.8009611, -1.002544, -1.548695, 0.8078431, 1, 0, 1,
-0.799938, 0.7770913, -1.579411, 0.8, 1, 0, 1,
-0.7938927, -1.252237, -2.029842, 0.7921569, 1, 0, 1,
-0.7930594, 1.546184, -0.6487715, 0.7882353, 1, 0, 1,
-0.7904345, -0.5358617, -1.484589, 0.7803922, 1, 0, 1,
-0.7852154, -0.2068525, -2.010758, 0.7764706, 1, 0, 1,
-0.7792839, 1.290434, -1.161444, 0.7686275, 1, 0, 1,
-0.7764354, -0.8126227, -2.403617, 0.7647059, 1, 0, 1,
-0.768158, -2.249055, -3.468056, 0.7568628, 1, 0, 1,
-0.7621981, -0.3400538, -0.7416539, 0.7529412, 1, 0, 1,
-0.7619994, 0.8441243, -0.3362359, 0.7450981, 1, 0, 1,
-0.7616217, -0.3859581, -3.127306, 0.7411765, 1, 0, 1,
-0.7586674, -0.869682, -2.384624, 0.7333333, 1, 0, 1,
-0.7577064, -0.8241564, -3.021208, 0.7294118, 1, 0, 1,
-0.7573335, -0.1101011, -3.773165, 0.7215686, 1, 0, 1,
-0.7553251, -0.0822841, -2.598623, 0.7176471, 1, 0, 1,
-0.7551342, -0.3396748, -0.9167924, 0.7098039, 1, 0, 1,
-0.7512645, 1.864737, 0.05901686, 0.7058824, 1, 0, 1,
-0.7446784, -0.4316914, -1.761936, 0.6980392, 1, 0, 1,
-0.7423743, 0.1266153, -1.405335, 0.6901961, 1, 0, 1,
-0.7408598, 0.6505102, -0.68432, 0.6862745, 1, 0, 1,
-0.7275178, -0.5681462, -2.333911, 0.6784314, 1, 0, 1,
-0.7233074, 1.449471, 0.2726128, 0.6745098, 1, 0, 1,
-0.7193543, 2.342637, -0.1633386, 0.6666667, 1, 0, 1,
-0.7192633, 1.083239, 0.5428262, 0.6627451, 1, 0, 1,
-0.7178041, 1.192841, -0.8525547, 0.654902, 1, 0, 1,
-0.7176674, 0.4245391, 0.4997387, 0.6509804, 1, 0, 1,
-0.7164433, -2.075174, -3.255971, 0.6431373, 1, 0, 1,
-0.7141829, 1.715738, 0.1675445, 0.6392157, 1, 0, 1,
-0.7130904, -1.196683, -3.158166, 0.6313726, 1, 0, 1,
-0.7129361, 1.368396, -0.3516117, 0.627451, 1, 0, 1,
-0.7096633, 0.2819982, -1.853026, 0.6196079, 1, 0, 1,
-0.7089608, -0.233267, -1.481298, 0.6156863, 1, 0, 1,
-0.7071249, 0.7950564, -0.7814479, 0.6078432, 1, 0, 1,
-0.7051999, -0.1277218, -2.113902, 0.6039216, 1, 0, 1,
-0.7033398, 0.1158731, -1.146329, 0.5960785, 1, 0, 1,
-0.6998731, 0.6211576, -1.453556, 0.5882353, 1, 0, 1,
-0.6975547, -0.5017464, -1.109995, 0.5843138, 1, 0, 1,
-0.6927767, -0.3805837, -2.3748, 0.5764706, 1, 0, 1,
-0.6922758, 0.8800244, -1.317177, 0.572549, 1, 0, 1,
-0.6824842, 1.389908, 0.8525017, 0.5647059, 1, 0, 1,
-0.6817583, -0.6324996, -0.9244868, 0.5607843, 1, 0, 1,
-0.6816902, 0.08419611, -0.443882, 0.5529412, 1, 0, 1,
-0.6725035, -1.381375, -1.783401, 0.5490196, 1, 0, 1,
-0.6683251, 0.09077855, -0.8021297, 0.5411765, 1, 0, 1,
-0.6656902, 0.3857127, 0.6869955, 0.5372549, 1, 0, 1,
-0.6635681, -0.6643856, -1.879167, 0.5294118, 1, 0, 1,
-0.6621092, -0.1973405, -2.486816, 0.5254902, 1, 0, 1,
-0.6610778, 0.5398563, -0.7172786, 0.5176471, 1, 0, 1,
-0.6606702, 1.561195, -0.2709026, 0.5137255, 1, 0, 1,
-0.6595751, -0.6504987, -2.054701, 0.5058824, 1, 0, 1,
-0.6584412, -0.03043522, 0.4955404, 0.5019608, 1, 0, 1,
-0.6570814, -0.4840263, -3.694198, 0.4941176, 1, 0, 1,
-0.6568604, -0.06117825, -2.075409, 0.4862745, 1, 0, 1,
-0.6529496, -1.644422, 0.4693394, 0.4823529, 1, 0, 1,
-0.6504627, 0.3910889, -2.161381, 0.4745098, 1, 0, 1,
-0.6483023, -1.319218, -4.847247, 0.4705882, 1, 0, 1,
-0.643392, -1.128724, -3.590868, 0.4627451, 1, 0, 1,
-0.6416277, -0.1014813, -0.6145533, 0.4588235, 1, 0, 1,
-0.6276358, 0.5918036, -0.6039558, 0.4509804, 1, 0, 1,
-0.6254163, -0.1693245, -1.958794, 0.4470588, 1, 0, 1,
-0.6139342, 1.319915, -0.385504, 0.4392157, 1, 0, 1,
-0.612365, -0.166658, -1.69066, 0.4352941, 1, 0, 1,
-0.6113031, 1.008593, -0.7920012, 0.427451, 1, 0, 1,
-0.605494, -0.5707524, -2.390484, 0.4235294, 1, 0, 1,
-0.6037599, 0.5189018, -1.249685, 0.4156863, 1, 0, 1,
-0.6012216, -0.2860531, -2.229148, 0.4117647, 1, 0, 1,
-0.6001253, 2.284213, -0.9476851, 0.4039216, 1, 0, 1,
-0.5962892, 0.407409, -2.194157, 0.3960784, 1, 0, 1,
-0.5920066, -0.5257154, -2.012398, 0.3921569, 1, 0, 1,
-0.5919814, 0.3874775, -0.782143, 0.3843137, 1, 0, 1,
-0.5909424, -1.145586, -2.220285, 0.3803922, 1, 0, 1,
-0.5882918, -0.9088836, -2.588531, 0.372549, 1, 0, 1,
-0.5827931, -1.129795, -2.474977, 0.3686275, 1, 0, 1,
-0.5797422, 0.3770074, -1.357012, 0.3607843, 1, 0, 1,
-0.5724268, -1.052148, -3.021341, 0.3568628, 1, 0, 1,
-0.5718151, 3.008621, 0.5830802, 0.3490196, 1, 0, 1,
-0.5716022, 0.5676023, -2.066624, 0.345098, 1, 0, 1,
-0.5699916, -0.1531373, -3.812824, 0.3372549, 1, 0, 1,
-0.565938, -0.07564833, -1.206683, 0.3333333, 1, 0, 1,
-0.5648714, 0.9218081, -1.923765, 0.3254902, 1, 0, 1,
-0.5629802, -0.1259583, -1.754603, 0.3215686, 1, 0, 1,
-0.5622024, -0.7598823, -1.396312, 0.3137255, 1, 0, 1,
-0.5608296, -0.7075199, -3.171809, 0.3098039, 1, 0, 1,
-0.5600121, -0.04118555, -0.9904882, 0.3019608, 1, 0, 1,
-0.5585695, 0.8114541, 1.116342, 0.2941177, 1, 0, 1,
-0.5560142, 1.058552, -0.2857516, 0.2901961, 1, 0, 1,
-0.5555797, -0.9984592, -3.442871, 0.282353, 1, 0, 1,
-0.5508024, -0.9955096, -2.346316, 0.2784314, 1, 0, 1,
-0.5502576, 1.521238, -0.7155279, 0.2705882, 1, 0, 1,
-0.5495594, -0.4388268, -1.652072, 0.2666667, 1, 0, 1,
-0.5480348, 0.8160595, -0.3496716, 0.2588235, 1, 0, 1,
-0.5374854, -1.188587, -3.077419, 0.254902, 1, 0, 1,
-0.5370954, -0.01115006, -0.7082901, 0.2470588, 1, 0, 1,
-0.5363014, -2.031374, -2.33294, 0.2431373, 1, 0, 1,
-0.5341033, -0.3125618, -1.005051, 0.2352941, 1, 0, 1,
-0.532145, 1.22031, -0.3801819, 0.2313726, 1, 0, 1,
-0.5299979, -0.2174272, -3.179814, 0.2235294, 1, 0, 1,
-0.5249639, 0.9979525, 0.6652293, 0.2196078, 1, 0, 1,
-0.5225515, 0.02895452, -2.374176, 0.2117647, 1, 0, 1,
-0.5222217, 0.2676847, 0.5114316, 0.2078431, 1, 0, 1,
-0.5213558, -0.1178265, -1.672365, 0.2, 1, 0, 1,
-0.5176592, -0.1957094, -2.17326, 0.1921569, 1, 0, 1,
-0.5176435, 0.1717151, -2.83009, 0.1882353, 1, 0, 1,
-0.5136638, -0.110364, -0.1820335, 0.1803922, 1, 0, 1,
-0.5109086, 0.23042, -1.579932, 0.1764706, 1, 0, 1,
-0.5102914, 0.9401578, 0.8497289, 0.1686275, 1, 0, 1,
-0.5095607, 0.4838727, -0.2461656, 0.1647059, 1, 0, 1,
-0.5061229, -0.04023623, -1.543093, 0.1568628, 1, 0, 1,
-0.5058644, 0.9762781, -0.4200655, 0.1529412, 1, 0, 1,
-0.5018395, 1.395713, -0.1216983, 0.145098, 1, 0, 1,
-0.5018079, -0.6365908, -1.842762, 0.1411765, 1, 0, 1,
-0.5011687, 0.207732, -0.5857971, 0.1333333, 1, 0, 1,
-0.4991769, -1.655756, -4.684046, 0.1294118, 1, 0, 1,
-0.4987735, -1.373212, -2.838593, 0.1215686, 1, 0, 1,
-0.4973644, -0.7595145, -2.629753, 0.1176471, 1, 0, 1,
-0.4853065, -0.897432, -4.407895, 0.1098039, 1, 0, 1,
-0.4848651, 1.73263, -1.120363, 0.1058824, 1, 0, 1,
-0.484605, -0.1968349, -0.8223737, 0.09803922, 1, 0, 1,
-0.4799752, -0.04615992, -3.283349, 0.09019608, 1, 0, 1,
-0.479903, -0.5086254, -1.648254, 0.08627451, 1, 0, 1,
-0.4703651, -1.145217, -2.682912, 0.07843138, 1, 0, 1,
-0.4684838, -1.032487, -1.1702, 0.07450981, 1, 0, 1,
-0.4671048, 1.274891, 0.7915007, 0.06666667, 1, 0, 1,
-0.4670777, -0.1351813, -1.954482, 0.0627451, 1, 0, 1,
-0.4615518, -1.689632, -3.627373, 0.05490196, 1, 0, 1,
-0.4611965, -0.2887464, -0.6143739, 0.05098039, 1, 0, 1,
-0.4551124, -1.223923, -1.942303, 0.04313726, 1, 0, 1,
-0.4488877, -0.6468526, -2.525903, 0.03921569, 1, 0, 1,
-0.4447996, -0.6979319, -4.216405, 0.03137255, 1, 0, 1,
-0.4442194, 0.233648, -1.051007, 0.02745098, 1, 0, 1,
-0.4392332, 0.5681672, -2.932584, 0.01960784, 1, 0, 1,
-0.4368482, 0.1296384, 1.324331, 0.01568628, 1, 0, 1,
-0.4279677, -0.447469, -2.497514, 0.007843138, 1, 0, 1,
-0.4268497, -0.3306404, -2.510481, 0.003921569, 1, 0, 1,
-0.4228782, 0.3462781, -1.299453, 0, 1, 0.003921569, 1,
-0.4216065, 0.5019104, -1.049662, 0, 1, 0.01176471, 1,
-0.4195168, 1.172492, -1.036076, 0, 1, 0.01568628, 1,
-0.4183039, 1.011451, -0.3775073, 0, 1, 0.02352941, 1,
-0.4181333, 0.169143, -1.687144, 0, 1, 0.02745098, 1,
-0.4117151, 0.5970859, 0.6809317, 0, 1, 0.03529412, 1,
-0.4090093, -0.3892787, -3.126301, 0, 1, 0.03921569, 1,
-0.4065408, 0.7661902, 1.425145, 0, 1, 0.04705882, 1,
-0.4058248, 0.6713773, -0.6081318, 0, 1, 0.05098039, 1,
-0.4041882, 0.1457209, -0.9885285, 0, 1, 0.05882353, 1,
-0.4023204, -1.807671, -4.742455, 0, 1, 0.0627451, 1,
-0.4002032, -0.1293151, -2.110647, 0, 1, 0.07058824, 1,
-0.399756, -1.044167, -2.910681, 0, 1, 0.07450981, 1,
-0.3945784, 0.264381, -0.8463516, 0, 1, 0.08235294, 1,
-0.3944764, 1.101202, -0.4711952, 0, 1, 0.08627451, 1,
-0.3906396, -0.3065583, -1.362974, 0, 1, 0.09411765, 1,
-0.3872349, 0.1286668, 0.03052693, 0, 1, 0.1019608, 1,
-0.3846552, -1.964378, -2.772313, 0, 1, 0.1058824, 1,
-0.383428, -1.046677, -1.988513, 0, 1, 0.1137255, 1,
-0.3804893, -0.02347971, -2.138698, 0, 1, 0.1176471, 1,
-0.3804814, 0.2252633, -0.5370098, 0, 1, 0.1254902, 1,
-0.3791, 1.049811, 0.1377802, 0, 1, 0.1294118, 1,
-0.3783162, -0.3540886, -3.210777, 0, 1, 0.1372549, 1,
-0.3735424, -1.281214, -1.56397, 0, 1, 0.1411765, 1,
-0.3701656, 0.2819402, -0.239162, 0, 1, 0.1490196, 1,
-0.3697309, -0.1203514, -1.342935, 0, 1, 0.1529412, 1,
-0.3608708, 0.89443, -0.1948435, 0, 1, 0.1607843, 1,
-0.3606608, 0.66545, 0.9141375, 0, 1, 0.1647059, 1,
-0.3603978, 0.3665422, -2.282647, 0, 1, 0.172549, 1,
-0.3573588, -0.7737058, -4.337286, 0, 1, 0.1764706, 1,
-0.355615, -1.803327, -2.97378, 0, 1, 0.1843137, 1,
-0.3554586, 0.3456488, 0.5106284, 0, 1, 0.1882353, 1,
-0.3537612, 0.2599489, -2.726278, 0, 1, 0.1960784, 1,
-0.3524126, 0.2249887, -0.5214081, 0, 1, 0.2039216, 1,
-0.3367268, 0.4806925, 1.174845, 0, 1, 0.2078431, 1,
-0.3260271, -0.5905735, -0.8983973, 0, 1, 0.2156863, 1,
-0.3231921, 1.047982, -0.9438543, 0, 1, 0.2196078, 1,
-0.3223748, -0.6129254, -1.99451, 0, 1, 0.227451, 1,
-0.3218954, 0.06703953, -1.989256, 0, 1, 0.2313726, 1,
-0.3213017, -1.217294, -4.625535, 0, 1, 0.2392157, 1,
-0.3211088, 0.02651338, -0.7218258, 0, 1, 0.2431373, 1,
-0.3168559, -1.389171, -3.05083, 0, 1, 0.2509804, 1,
-0.3162352, -0.9183168, -2.095089, 0, 1, 0.254902, 1,
-0.3087466, 0.9313301, -0.8177125, 0, 1, 0.2627451, 1,
-0.306576, 0.6149796, -0.1080896, 0, 1, 0.2666667, 1,
-0.3015189, 0.1543588, -2.489851, 0, 1, 0.2745098, 1,
-0.3006079, 0.6466637, -1.864007, 0, 1, 0.2784314, 1,
-0.2966198, 0.2951283, -1.61196, 0, 1, 0.2862745, 1,
-0.2943671, 1.254882, 0.2137218, 0, 1, 0.2901961, 1,
-0.2928864, -0.5112532, -2.776514, 0, 1, 0.2980392, 1,
-0.2906406, -1.186376, -2.160488, 0, 1, 0.3058824, 1,
-0.2882008, 1.983091, -0.6415942, 0, 1, 0.3098039, 1,
-0.285255, 0.4581904, 0.4852553, 0, 1, 0.3176471, 1,
-0.2851619, -0.9051231, -4.471493, 0, 1, 0.3215686, 1,
-0.2821336, -0.6746672, -2.810176, 0, 1, 0.3294118, 1,
-0.2794676, 0.5616466, -1.650584, 0, 1, 0.3333333, 1,
-0.2769433, -0.5067835, -2.882004, 0, 1, 0.3411765, 1,
-0.2713823, 0.2831726, 1.083067, 0, 1, 0.345098, 1,
-0.2707183, 0.7166371, 0.8661894, 0, 1, 0.3529412, 1,
-0.2674299, 1.179003, -0.7581139, 0, 1, 0.3568628, 1,
-0.2662649, 1.337656, 0.05301242, 0, 1, 0.3647059, 1,
-0.2623731, -0.7240508, -1.514991, 0, 1, 0.3686275, 1,
-0.2617115, 0.3113665, -0.6657348, 0, 1, 0.3764706, 1,
-0.2581844, -1.113522, -3.76636, 0, 1, 0.3803922, 1,
-0.254525, 0.1418891, -0.2376499, 0, 1, 0.3882353, 1,
-0.2503756, -0.4090173, -4.418098, 0, 1, 0.3921569, 1,
-0.2498014, -1.960175, -3.669811, 0, 1, 0.4, 1,
-0.2455295, 0.3784951, -0.3816708, 0, 1, 0.4078431, 1,
-0.24548, 2.031984, 0.1247845, 0, 1, 0.4117647, 1,
-0.2453884, -0.330549, -2.604073, 0, 1, 0.4196078, 1,
-0.2452041, -0.3617738, -2.726741, 0, 1, 0.4235294, 1,
-0.239856, -0.5330309, -2.624851, 0, 1, 0.4313726, 1,
-0.2360484, -1.764362, -1.561835, 0, 1, 0.4352941, 1,
-0.2348952, 0.7791432, -1.687952, 0, 1, 0.4431373, 1,
-0.2339069, 0.342855, -2.784595, 0, 1, 0.4470588, 1,
-0.2331134, -0.8244092, -2.358275, 0, 1, 0.454902, 1,
-0.232799, 0.4809235, 0.947754, 0, 1, 0.4588235, 1,
-0.2230159, -1.191971, -1.494455, 0, 1, 0.4666667, 1,
-0.2215324, 1.57343, 0.259015, 0, 1, 0.4705882, 1,
-0.2201359, 0.3748638, 1.58149, 0, 1, 0.4784314, 1,
-0.2173169, 0.9534844, 0.1154811, 0, 1, 0.4823529, 1,
-0.2161861, 0.03877165, -1.330409, 0, 1, 0.4901961, 1,
-0.215184, -0.4115126, -2.512582, 0, 1, 0.4941176, 1,
-0.2151022, -0.4132243, -1.537427, 0, 1, 0.5019608, 1,
-0.2129205, -1.695799, -3.245102, 0, 1, 0.509804, 1,
-0.208458, 1.089894, -0.7011335, 0, 1, 0.5137255, 1,
-0.207857, 0.3251793, 0.4717238, 0, 1, 0.5215687, 1,
-0.2071644, -0.1421448, -1.913498, 0, 1, 0.5254902, 1,
-0.2062073, -0.7574642, -3.02072, 0, 1, 0.5333334, 1,
-0.2044345, 0.5359553, -0.01674007, 0, 1, 0.5372549, 1,
-0.2001461, 0.06167381, -1.43451, 0, 1, 0.5450981, 1,
-0.1864396, -2.121018, -2.099509, 0, 1, 0.5490196, 1,
-0.1856926, -0.06257119, -2.873087, 0, 1, 0.5568628, 1,
-0.1798194, -0.8871278, -4.801958, 0, 1, 0.5607843, 1,
-0.1783935, -1.366369, -1.710152, 0, 1, 0.5686275, 1,
-0.1783569, -0.002339618, -2.316242, 0, 1, 0.572549, 1,
-0.1754443, -1.095884, -2.326188, 0, 1, 0.5803922, 1,
-0.1718678, 0.6394979, -1.865782, 0, 1, 0.5843138, 1,
-0.168992, 0.7427654, 0.5366867, 0, 1, 0.5921569, 1,
-0.1653765, 0.2000209, 0.3252085, 0, 1, 0.5960785, 1,
-0.1632282, -0.3391224, -2.559351, 0, 1, 0.6039216, 1,
-0.1605674, -0.4523058, -2.2722, 0, 1, 0.6117647, 1,
-0.1590342, 0.1399437, -0.2901745, 0, 1, 0.6156863, 1,
-0.1589294, 0.8853114, 0.348788, 0, 1, 0.6235294, 1,
-0.1581918, -0.912027, -2.570365, 0, 1, 0.627451, 1,
-0.1554325, 1.267938, 0.4275748, 0, 1, 0.6352941, 1,
-0.1550694, -0.1386697, -0.6198436, 0, 1, 0.6392157, 1,
-0.1521619, -1.882686, -2.248182, 0, 1, 0.6470588, 1,
-0.1479, 0.8755158, -0.1095529, 0, 1, 0.6509804, 1,
-0.1450391, -0.5457221, -2.235661, 0, 1, 0.6588235, 1,
-0.143016, -0.3956911, -2.88676, 0, 1, 0.6627451, 1,
-0.1426295, 1.075848, -0.319647, 0, 1, 0.6705883, 1,
-0.1406395, 0.9998008, 1.06528, 0, 1, 0.6745098, 1,
-0.1402142, -0.7450462, -3.705315, 0, 1, 0.682353, 1,
-0.1401428, 1.401962, 0.7959405, 0, 1, 0.6862745, 1,
-0.1379856, 0.2131232, -2.219394, 0, 1, 0.6941177, 1,
-0.1299038, 2.299059, -0.05141126, 0, 1, 0.7019608, 1,
-0.1255577, -1.425196, -3.641502, 0, 1, 0.7058824, 1,
-0.1168281, -0.2500789, -4.082234, 0, 1, 0.7137255, 1,
-0.1146823, 1.941345, -0.4837609, 0, 1, 0.7176471, 1,
-0.1124347, 0.1910622, 0.1668461, 0, 1, 0.7254902, 1,
-0.1112949, -0.7417076, -3.643216, 0, 1, 0.7294118, 1,
-0.1102488, 0.2882662, -2.08553, 0, 1, 0.7372549, 1,
-0.1093466, -0.8205357, -1.850357, 0, 1, 0.7411765, 1,
-0.1051519, 0.8755684, -0.2159485, 0, 1, 0.7490196, 1,
-0.1032987, 0.4983178, 1.855983, 0, 1, 0.7529412, 1,
-0.1028764, 2.417828, 0.2727926, 0, 1, 0.7607843, 1,
-0.09528765, -1.375164, -2.483892, 0, 1, 0.7647059, 1,
-0.09092841, 0.1594959, -0.8136106, 0, 1, 0.772549, 1,
-0.08912751, -0.1149769, -3.992139, 0, 1, 0.7764706, 1,
-0.08624076, 2.056678, -0.4724967, 0, 1, 0.7843137, 1,
-0.08383683, -2.204432, -2.600599, 0, 1, 0.7882353, 1,
-0.07844982, -1.039895, -2.347416, 0, 1, 0.7960784, 1,
-0.07829272, 0.09143364, 0.02559688, 0, 1, 0.8039216, 1,
-0.07669034, -0.1731167, -1.765847, 0, 1, 0.8078431, 1,
-0.07598013, 1.191397, -0.2881825, 0, 1, 0.8156863, 1,
-0.0756072, 0.2710263, 0.7734456, 0, 1, 0.8196079, 1,
-0.07557587, -0.584295, -3.082688, 0, 1, 0.827451, 1,
-0.07384447, -0.6859081, -1.012661, 0, 1, 0.8313726, 1,
-0.0679467, -0.1014089, -3.486598, 0, 1, 0.8392157, 1,
-0.06694791, 0.9608194, 0.6104985, 0, 1, 0.8431373, 1,
-0.06654599, -1.202633, -4.620434, 0, 1, 0.8509804, 1,
-0.06492708, -0.8860074, -3.101986, 0, 1, 0.854902, 1,
-0.06381582, -1.461134, -1.989549, 0, 1, 0.8627451, 1,
-0.06123121, 0.7018158, -0.9981682, 0, 1, 0.8666667, 1,
-0.05726732, -0.2615975, -0.9514872, 0, 1, 0.8745098, 1,
-0.0530676, 0.9171277, -0.3834709, 0, 1, 0.8784314, 1,
-0.05143873, 0.8857945, 0.4248794, 0, 1, 0.8862745, 1,
-0.05095342, -1.290047, -0.5830806, 0, 1, 0.8901961, 1,
-0.04445599, 0.6569328, -0.3676045, 0, 1, 0.8980392, 1,
-0.04381002, -0.3923865, -2.797798, 0, 1, 0.9058824, 1,
-0.04305555, 0.0670957, -0.745334, 0, 1, 0.9098039, 1,
-0.04163909, 1.231565, 0.4408478, 0, 1, 0.9176471, 1,
-0.04136129, 0.6809946, 0.6482256, 0, 1, 0.9215686, 1,
-0.0412848, -0.6579489, -4.307943, 0, 1, 0.9294118, 1,
-0.03952907, 0.3650284, -1.13771, 0, 1, 0.9333333, 1,
-0.03714406, -0.4944962, -2.675455, 0, 1, 0.9411765, 1,
-0.03685784, -0.2872662, -2.342644, 0, 1, 0.945098, 1,
-0.02998934, -1.50215, -3.609524, 0, 1, 0.9529412, 1,
-0.02701055, 0.3785652, -1.428959, 0, 1, 0.9568627, 1,
-0.02667634, -1.481565, -2.372966, 0, 1, 0.9647059, 1,
-0.0248558, -0.2806449, -3.143699, 0, 1, 0.9686275, 1,
-0.02466776, 0.2278011, 0.3851593, 0, 1, 0.9764706, 1,
-0.02462873, -1.440786, -3.120784, 0, 1, 0.9803922, 1,
-0.02051842, -0.8776573, -3.1867, 0, 1, 0.9882353, 1,
-0.01440637, 0.1910784, 0.3802357, 0, 1, 0.9921569, 1,
-0.01302773, -0.4586936, -2.365997, 0, 1, 1, 1,
-0.008643263, 0.7887149, -0.5127899, 0, 0.9921569, 1, 1,
-0.006321653, 0.8499035, 2.26694, 0, 0.9882353, 1, 1,
-0.003152775, -0.246193, -5.587214, 0, 0.9803922, 1, 1,
0.003501046, -0.459178, 2.954991, 0, 0.9764706, 1, 1,
0.006698887, -0.2790069, 3.992247, 0, 0.9686275, 1, 1,
0.00947555, -1.003912, 3.212303, 0, 0.9647059, 1, 1,
0.01562999, -1.52797, 3.591077, 0, 0.9568627, 1, 1,
0.01802317, -0.1205032, 2.418423, 0, 0.9529412, 1, 1,
0.01831365, 0.1217948, 1.500414, 0, 0.945098, 1, 1,
0.0189068, -0.02279544, 3.545745, 0, 0.9411765, 1, 1,
0.02935603, 0.10995, -0.5859792, 0, 0.9333333, 1, 1,
0.031248, -0.5264051, 2.807473, 0, 0.9294118, 1, 1,
0.03213203, 0.1447224, -0.3816029, 0, 0.9215686, 1, 1,
0.03308646, 1.207594, 2.415317, 0, 0.9176471, 1, 1,
0.03453853, 0.3224914, -0.9256778, 0, 0.9098039, 1, 1,
0.03504735, -1.461383, 2.109138, 0, 0.9058824, 1, 1,
0.03535528, 0.03848616, 0.3940298, 0, 0.8980392, 1, 1,
0.0367097, -1.967411, 2.553454, 0, 0.8901961, 1, 1,
0.038966, -1.003271, 3.074187, 0, 0.8862745, 1, 1,
0.04410726, -0.4212898, 5.362684, 0, 0.8784314, 1, 1,
0.04450297, -1.872442, 3.512045, 0, 0.8745098, 1, 1,
0.04550961, 0.5897167, 0.5381893, 0, 0.8666667, 1, 1,
0.04714769, -0.6540658, 2.664951, 0, 0.8627451, 1, 1,
0.04878305, 0.9210255, 1.246409, 0, 0.854902, 1, 1,
0.04931288, 0.5725471, -0.5987774, 0, 0.8509804, 1, 1,
0.05133804, -0.8625507, 5.443888, 0, 0.8431373, 1, 1,
0.05343969, 0.8111089, 0.1519167, 0, 0.8392157, 1, 1,
0.0541202, 1.263776, -0.4201218, 0, 0.8313726, 1, 1,
0.05499443, -0.5120422, 3.145155, 0, 0.827451, 1, 1,
0.05729558, -0.8490235, 1.952703, 0, 0.8196079, 1, 1,
0.06943164, -0.6923736, 3.084918, 0, 0.8156863, 1, 1,
0.07525048, 0.01996348, 1.579699, 0, 0.8078431, 1, 1,
0.0764811, 0.8267128, -2.457879, 0, 0.8039216, 1, 1,
0.07797577, 0.1107034, 2.282314, 0, 0.7960784, 1, 1,
0.07876291, -0.6963773, 2.247178, 0, 0.7882353, 1, 1,
0.07885361, 1.0293, 1.007009, 0, 0.7843137, 1, 1,
0.084172, 1.457572, -0.6732135, 0, 0.7764706, 1, 1,
0.08492756, -0.9813003, 2.450563, 0, 0.772549, 1, 1,
0.08515932, -0.714976, 2.374352, 0, 0.7647059, 1, 1,
0.0910007, -0.0469847, 2.717284, 0, 0.7607843, 1, 1,
0.0940957, -1.460506, 1.96798, 0, 0.7529412, 1, 1,
0.09446036, -1.732898, 3.358588, 0, 0.7490196, 1, 1,
0.09595248, -1.206973, 2.357056, 0, 0.7411765, 1, 1,
0.09830891, -1.063625, 3.421177, 0, 0.7372549, 1, 1,
0.09931526, -1.648081, 4.347472, 0, 0.7294118, 1, 1,
0.1003096, -0.3176309, 2.78603, 0, 0.7254902, 1, 1,
0.1008936, -1.317423, 3.10199, 0, 0.7176471, 1, 1,
0.103041, 0.6878524, 0.5052947, 0, 0.7137255, 1, 1,
0.103279, -0.9546029, 6.422416, 0, 0.7058824, 1, 1,
0.1035879, -0.04379278, 4.981447, 0, 0.6980392, 1, 1,
0.1036073, -1.035125, 1.54679, 0, 0.6941177, 1, 1,
0.10364, -0.4153967, 2.445464, 0, 0.6862745, 1, 1,
0.1036684, -0.2117186, 2.765383, 0, 0.682353, 1, 1,
0.1050026, -1.73749, 2.594928, 0, 0.6745098, 1, 1,
0.1081605, 0.00909761, 1.871137, 0, 0.6705883, 1, 1,
0.1094311, 0.9048848, -0.1238238, 0, 0.6627451, 1, 1,
0.1133397, -1.052327, 3.265059, 0, 0.6588235, 1, 1,
0.115151, -0.5097873, 4.267847, 0, 0.6509804, 1, 1,
0.1163182, 0.663634, 0.6316722, 0, 0.6470588, 1, 1,
0.1227218, 1.302192, 0.6337612, 0, 0.6392157, 1, 1,
0.1232578, -1.431917, 3.798912, 0, 0.6352941, 1, 1,
0.123386, 0.1128398, 1.309886, 0, 0.627451, 1, 1,
0.1250446, 1.531412, -1.67683, 0, 0.6235294, 1, 1,
0.1279481, 1.446908, -0.3439437, 0, 0.6156863, 1, 1,
0.1284447, -0.111287, 2.264192, 0, 0.6117647, 1, 1,
0.1340433, -0.7450991, 1.598563, 0, 0.6039216, 1, 1,
0.1356772, -1.58134, 2.904608, 0, 0.5960785, 1, 1,
0.1359641, -1.138843, 1.928916, 0, 0.5921569, 1, 1,
0.1378116, -1.163725, 2.979513, 0, 0.5843138, 1, 1,
0.1379503, -0.9324272, 4.245004, 0, 0.5803922, 1, 1,
0.1387457, 0.8800125, -1.846066, 0, 0.572549, 1, 1,
0.1402218, -0.4529955, 3.815996, 0, 0.5686275, 1, 1,
0.1432313, 0.8190437, 0.2481229, 0, 0.5607843, 1, 1,
0.1449344, -0.8777339, 2.3078, 0, 0.5568628, 1, 1,
0.1452229, 0.09325938, 1.211861, 0, 0.5490196, 1, 1,
0.1469725, 0.3304907, 2.985299, 0, 0.5450981, 1, 1,
0.1519152, 0.3582687, 0.8163683, 0, 0.5372549, 1, 1,
0.1533053, 0.5972487, -1.013729, 0, 0.5333334, 1, 1,
0.1560141, 1.244397, 2.081954, 0, 0.5254902, 1, 1,
0.1566249, 1.295907, -0.7962002, 0, 0.5215687, 1, 1,
0.1581921, -1.21862, 1.838853, 0, 0.5137255, 1, 1,
0.1599361, 0.3338995, 1.924239, 0, 0.509804, 1, 1,
0.1631688, -0.5661418, 2.816207, 0, 0.5019608, 1, 1,
0.1652618, 1.324581, -1.009311, 0, 0.4941176, 1, 1,
0.1670969, -0.301295, 1.062524, 0, 0.4901961, 1, 1,
0.1692135, -0.924951, 3.048394, 0, 0.4823529, 1, 1,
0.1721893, 2.435423, 1.065006, 0, 0.4784314, 1, 1,
0.1722744, -1.125289, 1.878104, 0, 0.4705882, 1, 1,
0.1753832, 1.027159, -0.09029328, 0, 0.4666667, 1, 1,
0.1870686, -0.8712037, 3.591063, 0, 0.4588235, 1, 1,
0.1894193, 1.400857, 0.8444741, 0, 0.454902, 1, 1,
0.199623, -2.067118, 3.570013, 0, 0.4470588, 1, 1,
0.2004845, 0.09019345, 2.352227, 0, 0.4431373, 1, 1,
0.2006727, 1.979103, -0.6670834, 0, 0.4352941, 1, 1,
0.2064169, 0.01376658, 1.153839, 0, 0.4313726, 1, 1,
0.212961, 0.8224946, 1.079944, 0, 0.4235294, 1, 1,
0.2129889, -1.60038, 2.761834, 0, 0.4196078, 1, 1,
0.213441, 0.5035825, -0.2373153, 0, 0.4117647, 1, 1,
0.2163136, -0.4385289, 2.35734, 0, 0.4078431, 1, 1,
0.2180663, -4.654282, 3.612128, 0, 0.4, 1, 1,
0.2191402, -0.3998529, 4.146886, 0, 0.3921569, 1, 1,
0.2221546, 1.378284, -0.05092733, 0, 0.3882353, 1, 1,
0.2265067, 0.2945304, 2.671878, 0, 0.3803922, 1, 1,
0.230067, 0.2877716, 0.8939982, 0, 0.3764706, 1, 1,
0.2334788, -0.7191887, 4.159422, 0, 0.3686275, 1, 1,
0.241338, -0.1836604, 1.754699, 0, 0.3647059, 1, 1,
0.2415102, -0.8473343, 3.303107, 0, 0.3568628, 1, 1,
0.2439819, 0.2986208, 1.015344, 0, 0.3529412, 1, 1,
0.2448884, -0.3144145, 0.87168, 0, 0.345098, 1, 1,
0.2499046, 3.042499, 1.131405, 0, 0.3411765, 1, 1,
0.2501386, 1.316158, -0.05925992, 0, 0.3333333, 1, 1,
0.2510362, 0.1855422, 1.539719, 0, 0.3294118, 1, 1,
0.2521463, 0.8199785, -0.2391621, 0, 0.3215686, 1, 1,
0.2521937, 0.04690395, 1.364151, 0, 0.3176471, 1, 1,
0.2595838, -1.286513, 3.508929, 0, 0.3098039, 1, 1,
0.263689, -0.2750987, 2.022596, 0, 0.3058824, 1, 1,
0.2684029, -1.114871, 2.627056, 0, 0.2980392, 1, 1,
0.2713279, 2.087066, 0.1236703, 0, 0.2901961, 1, 1,
0.27894, -0.975476, 3.568068, 0, 0.2862745, 1, 1,
0.2804199, -0.8709366, 2.169229, 0, 0.2784314, 1, 1,
0.2825692, -0.9611794, 2.741911, 0, 0.2745098, 1, 1,
0.2854247, 0.5772071, -0.1230998, 0, 0.2666667, 1, 1,
0.2882839, 1.121173, 1.652075, 0, 0.2627451, 1, 1,
0.2991155, -2.758655, 4.06766, 0, 0.254902, 1, 1,
0.3012103, -0.6105576, 4.20965, 0, 0.2509804, 1, 1,
0.3036422, 1.434035, 0.319481, 0, 0.2431373, 1, 1,
0.3059853, 0.104921, -0.1129124, 0, 0.2392157, 1, 1,
0.3101114, 0.8593145, 0.8036613, 0, 0.2313726, 1, 1,
0.3111093, 0.1078745, 0.2385425, 0, 0.227451, 1, 1,
0.3248706, -0.7792237, 3.366644, 0, 0.2196078, 1, 1,
0.3281028, -0.139551, 0.6303136, 0, 0.2156863, 1, 1,
0.3281392, 0.4450425, -0.6827149, 0, 0.2078431, 1, 1,
0.3323476, 2.264501, 1.509772, 0, 0.2039216, 1, 1,
0.3368236, 1.466619, -0.4587592, 0, 0.1960784, 1, 1,
0.3400088, -2.359697, 3.565825, 0, 0.1882353, 1, 1,
0.3409233, 2.269559, 0.4542518, 0, 0.1843137, 1, 1,
0.3489026, 0.7081743, -0.450577, 0, 0.1764706, 1, 1,
0.3530587, 0.7480715, -0.4864561, 0, 0.172549, 1, 1,
0.365114, -0.05082595, 0.3904563, 0, 0.1647059, 1, 1,
0.3708325, 1.021174, 1.338857, 0, 0.1607843, 1, 1,
0.3721606, -0.8118032, 3.904575, 0, 0.1529412, 1, 1,
0.3758745, -0.8652331, 3.643182, 0, 0.1490196, 1, 1,
0.376859, 0.5303673, 0.9390904, 0, 0.1411765, 1, 1,
0.3798776, -0.223768, 1.632294, 0, 0.1372549, 1, 1,
0.3810897, 0.2298165, 1.403243, 0, 0.1294118, 1, 1,
0.3829274, -0.1784962, 2.087647, 0, 0.1254902, 1, 1,
0.3904257, 0.5859405, 0.672776, 0, 0.1176471, 1, 1,
0.3921762, 0.2624383, 1.225942, 0, 0.1137255, 1, 1,
0.3947901, -0.179664, 1.187707, 0, 0.1058824, 1, 1,
0.3957509, -0.3788735, 3.61606, 0, 0.09803922, 1, 1,
0.3976127, 0.747686, 1.291257, 0, 0.09411765, 1, 1,
0.3990207, -0.6188924, 2.319412, 0, 0.08627451, 1, 1,
0.400551, 2.225917, -0.1252484, 0, 0.08235294, 1, 1,
0.4027473, 0.4843864, 0.6522355, 0, 0.07450981, 1, 1,
0.4062853, -1.580309, 3.469934, 0, 0.07058824, 1, 1,
0.4071201, -1.387115, 3.376315, 0, 0.0627451, 1, 1,
0.4153065, 1.4441, -1.001337, 0, 0.05882353, 1, 1,
0.4161351, 0.8033479, -1.086937, 0, 0.05098039, 1, 1,
0.4178796, 0.04096608, 1.980816, 0, 0.04705882, 1, 1,
0.4179875, -1.204718, 4.040513, 0, 0.03921569, 1, 1,
0.41956, -0.003458416, 2.402744, 0, 0.03529412, 1, 1,
0.4297914, 1.909693, -0.09903879, 0, 0.02745098, 1, 1,
0.4331629, 0.7845417, 1.320437, 0, 0.02352941, 1, 1,
0.4332062, -1.273594, 3.190162, 0, 0.01568628, 1, 1,
0.4345105, 0.7940883, -0.08616526, 0, 0.01176471, 1, 1,
0.4419967, -1.702155, 2.653929, 0, 0.003921569, 1, 1,
0.4461274, -0.4305847, 3.346358, 0.003921569, 0, 1, 1,
0.4489368, 0.5001835, 1.365072, 0.007843138, 0, 1, 1,
0.4501371, 0.226397, 1.343715, 0.01568628, 0, 1, 1,
0.4538065, -0.3782298, 2.262599, 0.01960784, 0, 1, 1,
0.4611351, -0.003546695, 2.123723, 0.02745098, 0, 1, 1,
0.4646901, -0.5659859, 2.383184, 0.03137255, 0, 1, 1,
0.4649138, 0.01313516, 0.8075011, 0.03921569, 0, 1, 1,
0.466009, -0.6984996, 2.694304, 0.04313726, 0, 1, 1,
0.4693703, -0.9447455, 1.552024, 0.05098039, 0, 1, 1,
0.4729904, -0.04324963, 1.401994, 0.05490196, 0, 1, 1,
0.4793559, 1.51444, 2.434475, 0.0627451, 0, 1, 1,
0.4800732, 0.3954325, 1.780997, 0.06666667, 0, 1, 1,
0.4859819, -0.3335741, 2.361422, 0.07450981, 0, 1, 1,
0.489919, -0.7771722, 2.145881, 0.07843138, 0, 1, 1,
0.4918721, -0.5845172, 5.114907, 0.08627451, 0, 1, 1,
0.4951615, -0.4036327, 3.141419, 0.09019608, 0, 1, 1,
0.4977433, 1.302903, -0.1382787, 0.09803922, 0, 1, 1,
0.5021729, 0.783855, -0.001805532, 0.1058824, 0, 1, 1,
0.5024742, 0.5883574, -0.3436661, 0.1098039, 0, 1, 1,
0.502956, -0.3894185, 2.416749, 0.1176471, 0, 1, 1,
0.5040052, 0.3978567, 0.2233864, 0.1215686, 0, 1, 1,
0.508839, 0.03583938, 1.55006, 0.1294118, 0, 1, 1,
0.5100188, -0.3443842, 4.507145, 0.1333333, 0, 1, 1,
0.5147707, -0.2371221, 2.66776, 0.1411765, 0, 1, 1,
0.5164312, 1.982801, -0.7875611, 0.145098, 0, 1, 1,
0.5181272, -0.05676805, 1.193859, 0.1529412, 0, 1, 1,
0.5187278, -0.2458634, 2.744879, 0.1568628, 0, 1, 1,
0.5203137, 0.912403, 0.9137663, 0.1647059, 0, 1, 1,
0.5219623, -0.2690608, 1.89708, 0.1686275, 0, 1, 1,
0.5244485, -0.7166721, 0.8757908, 0.1764706, 0, 1, 1,
0.5263589, -0.1253274, 1.691526, 0.1803922, 0, 1, 1,
0.5319674, 1.166034, 0.04054271, 0.1882353, 0, 1, 1,
0.5373147, 1.102125, 0.3527977, 0.1921569, 0, 1, 1,
0.5378625, 0.4688695, 1.922342, 0.2, 0, 1, 1,
0.5380881, -1.161512, 3.414369, 0.2078431, 0, 1, 1,
0.5434087, 0.06346833, -0.1561115, 0.2117647, 0, 1, 1,
0.5473145, 1.13477, 0.4378256, 0.2196078, 0, 1, 1,
0.547515, -0.313121, 0.4504591, 0.2235294, 0, 1, 1,
0.5517694, -1.471643, 3.384893, 0.2313726, 0, 1, 1,
0.5519435, -1.572477, 2.505134, 0.2352941, 0, 1, 1,
0.5520223, -0.5686119, 1.086222, 0.2431373, 0, 1, 1,
0.555639, 1.347959, 0.6039637, 0.2470588, 0, 1, 1,
0.558275, -0.9675649, 1.625823, 0.254902, 0, 1, 1,
0.5586042, -1.565529, 3.725327, 0.2588235, 0, 1, 1,
0.5597312, -0.2127224, 1.717158, 0.2666667, 0, 1, 1,
0.5609827, 0.8210164, 0.3715386, 0.2705882, 0, 1, 1,
0.562347, 0.3924924, 0.3041001, 0.2784314, 0, 1, 1,
0.572893, -2.974489, 2.726276, 0.282353, 0, 1, 1,
0.5806486, 0.7454044, 0.4921091, 0.2901961, 0, 1, 1,
0.5820037, -1.584539, 3.491288, 0.2941177, 0, 1, 1,
0.5835333, -0.7084216, 1.800197, 0.3019608, 0, 1, 1,
0.5873278, 0.7438378, 1.065654, 0.3098039, 0, 1, 1,
0.5874045, 0.5314648, 1.022191, 0.3137255, 0, 1, 1,
0.5902154, 0.4626843, 1.236007, 0.3215686, 0, 1, 1,
0.591407, -1.528175, 3.984101, 0.3254902, 0, 1, 1,
0.5959769, -0.1566031, 1.049312, 0.3333333, 0, 1, 1,
0.5996585, 0.4127027, 1.262102, 0.3372549, 0, 1, 1,
0.6026133, 0.05573691, 0.3704453, 0.345098, 0, 1, 1,
0.6107264, -0.08869404, 0.1378286, 0.3490196, 0, 1, 1,
0.6117679, 0.03984161, 1.834836, 0.3568628, 0, 1, 1,
0.616879, 1.043427, 1.164739, 0.3607843, 0, 1, 1,
0.6181263, -0.7564778, 2.079963, 0.3686275, 0, 1, 1,
0.6198973, 0.340232, 1.493772, 0.372549, 0, 1, 1,
0.6217925, 0.759483, -1.803659, 0.3803922, 0, 1, 1,
0.6255617, -0.7619967, 2.121183, 0.3843137, 0, 1, 1,
0.6309263, -1.428066, 2.861666, 0.3921569, 0, 1, 1,
0.6334844, 0.2651204, 1.666691, 0.3960784, 0, 1, 1,
0.642851, 0.04016724, 1.751051, 0.4039216, 0, 1, 1,
0.6492857, 0.06986865, 0.4952775, 0.4117647, 0, 1, 1,
0.6504865, 0.06945728, 0.9263893, 0.4156863, 0, 1, 1,
0.6509455, 0.5058815, 1.364379, 0.4235294, 0, 1, 1,
0.6532187, 0.3321101, 2.249297, 0.427451, 0, 1, 1,
0.6593758, -1.178142, 2.54747, 0.4352941, 0, 1, 1,
0.6600457, -0.6389974, 4.637894, 0.4392157, 0, 1, 1,
0.6629754, 0.1900366, 0.9162803, 0.4470588, 0, 1, 1,
0.6629791, 0.3741138, 1.767194, 0.4509804, 0, 1, 1,
0.6656651, -1.995768, 3.935397, 0.4588235, 0, 1, 1,
0.666062, -0.830949, 3.201595, 0.4627451, 0, 1, 1,
0.6678131, -0.07257961, 2.445534, 0.4705882, 0, 1, 1,
0.6719473, -0.9123306, 2.748144, 0.4745098, 0, 1, 1,
0.6748668, -0.3348978, 1.992455, 0.4823529, 0, 1, 1,
0.6749628, 1.279556, 1.012287, 0.4862745, 0, 1, 1,
0.6794084, -1.907553, 1.419798, 0.4941176, 0, 1, 1,
0.6806296, 0.2272861, 0.8538818, 0.5019608, 0, 1, 1,
0.682797, -0.323367, 1.944992, 0.5058824, 0, 1, 1,
0.6844786, 0.9729447, -0.07389353, 0.5137255, 0, 1, 1,
0.6846033, -0.8070818, 3.145143, 0.5176471, 0, 1, 1,
0.6859076, -0.2868694, 4.386351, 0.5254902, 0, 1, 1,
0.690596, -1.231554, 1.27815, 0.5294118, 0, 1, 1,
0.7006726, -0.6414109, 3.328639, 0.5372549, 0, 1, 1,
0.7013681, -0.3395172, 3.65086, 0.5411765, 0, 1, 1,
0.7050999, 0.5698115, 1.471107, 0.5490196, 0, 1, 1,
0.7064551, -0.4914743, 2.243333, 0.5529412, 0, 1, 1,
0.7064629, -0.1437173, 1.003032, 0.5607843, 0, 1, 1,
0.7067275, -1.685798, 1.742348, 0.5647059, 0, 1, 1,
0.7074127, -1.042328, 3.472038, 0.572549, 0, 1, 1,
0.7125607, 0.4991723, -0.1582126, 0.5764706, 0, 1, 1,
0.7134887, 0.2470807, 0.6516652, 0.5843138, 0, 1, 1,
0.714149, 1.236619, 0.053579, 0.5882353, 0, 1, 1,
0.7193601, -0.02094579, 0.6419767, 0.5960785, 0, 1, 1,
0.7219938, 0.3155511, 2.088676, 0.6039216, 0, 1, 1,
0.7241186, 0.589107, 0.4781165, 0.6078432, 0, 1, 1,
0.7241743, -0.2698321, 1.549239, 0.6156863, 0, 1, 1,
0.7242355, -0.3709476, 1.653985, 0.6196079, 0, 1, 1,
0.7348129, 1.191985, 0.2957492, 0.627451, 0, 1, 1,
0.7371862, -0.2839606, 4.823514, 0.6313726, 0, 1, 1,
0.740724, -0.1615365, 2.798803, 0.6392157, 0, 1, 1,
0.7442341, 0.518183, 1.735865, 0.6431373, 0, 1, 1,
0.7523363, -0.4687917, 2.749605, 0.6509804, 0, 1, 1,
0.7525042, -2.247535, 2.389256, 0.654902, 0, 1, 1,
0.7545452, 0.6809153, 1.272268, 0.6627451, 0, 1, 1,
0.7603353, 0.4992436, 0.6835477, 0.6666667, 0, 1, 1,
0.7664878, 0.5553209, 1.128081, 0.6745098, 0, 1, 1,
0.7693856, -1.095549, 3.106922, 0.6784314, 0, 1, 1,
0.7706615, 0.3988253, -0.5251837, 0.6862745, 0, 1, 1,
0.7708665, 0.9573305, 1.420114, 0.6901961, 0, 1, 1,
0.7746825, -0.6310312, 2.216133, 0.6980392, 0, 1, 1,
0.7794538, 1.053574, 1.359531, 0.7058824, 0, 1, 1,
0.7798895, 0.8133914, -0.7882878, 0.7098039, 0, 1, 1,
0.7810244, -0.9953848, 3.667267, 0.7176471, 0, 1, 1,
0.7848052, 0.3211133, 0.5669869, 0.7215686, 0, 1, 1,
0.7971148, -0.6330181, 3.235182, 0.7294118, 0, 1, 1,
0.8014838, 0.6060358, 2.042415, 0.7333333, 0, 1, 1,
0.8019494, 1.306088, 0.7832081, 0.7411765, 0, 1, 1,
0.802806, -2.106105, 3.044231, 0.7450981, 0, 1, 1,
0.8030149, -0.3350531, 1.642946, 0.7529412, 0, 1, 1,
0.8042859, -1.176526, 0.636919, 0.7568628, 0, 1, 1,
0.8060369, -0.8431358, 1.843984, 0.7647059, 0, 1, 1,
0.8106574, -0.2226852, 1.382251, 0.7686275, 0, 1, 1,
0.8163697, 0.67488, 1.64225, 0.7764706, 0, 1, 1,
0.8168435, 0.9227115, 0.9954906, 0.7803922, 0, 1, 1,
0.8173718, -0.8217264, 1.54309, 0.7882353, 0, 1, 1,
0.8274094, 0.6221382, 0.5993611, 0.7921569, 0, 1, 1,
0.8300117, -0.6302725, 1.00635, 0.8, 0, 1, 1,
0.8305167, 1.168523, 1.774005, 0.8078431, 0, 1, 1,
0.8310739, -1.526195, 3.655176, 0.8117647, 0, 1, 1,
0.8331121, -0.827902, 2.567758, 0.8196079, 0, 1, 1,
0.8331441, 0.4870026, -0.09671907, 0.8235294, 0, 1, 1,
0.839595, 0.3147368, 0.4320685, 0.8313726, 0, 1, 1,
0.8405996, -0.9393108, 1.457738, 0.8352941, 0, 1, 1,
0.8409177, 0.3132577, 1.566704, 0.8431373, 0, 1, 1,
0.8424057, 0.6617806, 0.1757554, 0.8470588, 0, 1, 1,
0.8447943, -0.3587012, 1.68558, 0.854902, 0, 1, 1,
0.8635086, 1.053654, 0.4893026, 0.8588235, 0, 1, 1,
0.8644575, 0.7910913, 0.85055, 0.8666667, 0, 1, 1,
0.8657649, -0.6604106, 2.36556, 0.8705882, 0, 1, 1,
0.8683574, -0.2156291, -0.8417858, 0.8784314, 0, 1, 1,
0.8690996, 1.075893, 0.4518947, 0.8823529, 0, 1, 1,
0.8722624, -0.9228204, 3.321495, 0.8901961, 0, 1, 1,
0.8772729, -0.6678542, 2.647488, 0.8941177, 0, 1, 1,
0.8773618, -1.839774, 1.385018, 0.9019608, 0, 1, 1,
0.8800665, -1.865228, 2.605704, 0.9098039, 0, 1, 1,
0.8813604, -0.4647183, 1.934992, 0.9137255, 0, 1, 1,
0.8838411, 1.974189, 1.13983, 0.9215686, 0, 1, 1,
0.8900406, 1.802865, 0.8203573, 0.9254902, 0, 1, 1,
0.8925713, -1.450275, 5.567298, 0.9333333, 0, 1, 1,
0.8944083, -1.1205, 2.960419, 0.9372549, 0, 1, 1,
0.901229, -0.929256, 3.63728, 0.945098, 0, 1, 1,
0.9054617, 0.112284, 1.014703, 0.9490196, 0, 1, 1,
0.9088697, 0.4091249, 1.075736, 0.9568627, 0, 1, 1,
0.9103406, 0.1593692, 1.899113, 0.9607843, 0, 1, 1,
0.9106711, -1.846046, 2.29269, 0.9686275, 0, 1, 1,
0.9244496, -0.3074439, 1.945106, 0.972549, 0, 1, 1,
0.9252244, -0.8102735, 2.368633, 0.9803922, 0, 1, 1,
0.9345618, -0.006706442, 2.554538, 0.9843137, 0, 1, 1,
0.9376994, 0.6719769, 0.05879445, 0.9921569, 0, 1, 1,
0.9408954, -1.135992, 1.919558, 0.9960784, 0, 1, 1,
0.9509132, 0.6161398, 2.149244, 1, 0, 0.9960784, 1,
0.9538121, -1.378695, 3.104448, 1, 0, 0.9882353, 1,
0.9570483, -0.08595994, 0.8894455, 1, 0, 0.9843137, 1,
0.9575217, -1.527222, 2.750032, 1, 0, 0.9764706, 1,
0.9626629, -0.8166402, 2.580875, 1, 0, 0.972549, 1,
0.9665093, 0.3395565, 0.8512022, 1, 0, 0.9647059, 1,
0.9685653, 1.31363, 0.8552894, 1, 0, 0.9607843, 1,
0.9702027, -0.9147916, 1.780119, 1, 0, 0.9529412, 1,
0.9718816, -0.3015222, 0.5330234, 1, 0, 0.9490196, 1,
0.9748501, -0.222315, 2.437402, 1, 0, 0.9411765, 1,
0.976412, 1.42592, -0.02430142, 1, 0, 0.9372549, 1,
0.9825823, -1.951856, 3.634985, 1, 0, 0.9294118, 1,
0.983252, -2.166578, 2.217681, 1, 0, 0.9254902, 1,
0.9869165, -1.910533, 2.438643, 1, 0, 0.9176471, 1,
0.9890438, 0.2342656, 1.918805, 1, 0, 0.9137255, 1,
0.9920034, -0.549884, 1.651877, 1, 0, 0.9058824, 1,
0.9967563, -1.215304, 0.0710633, 1, 0, 0.9019608, 1,
0.9985338, -0.1392387, 1.459648, 1, 0, 0.8941177, 1,
1.004773, -0.1808478, 1.679142, 1, 0, 0.8862745, 1,
1.010537, -1.109884, 2.917917, 1, 0, 0.8823529, 1,
1.013044, 0.7381682, -0.1587678, 1, 0, 0.8745098, 1,
1.016038, -0.2452604, 2.638127, 1, 0, 0.8705882, 1,
1.017257, 1.300068, 0.8413672, 1, 0, 0.8627451, 1,
1.020691, 0.7139788, -1.645144, 1, 0, 0.8588235, 1,
1.026836, 0.519033, 0.9047219, 1, 0, 0.8509804, 1,
1.038991, -2.136125, 1.681605, 1, 0, 0.8470588, 1,
1.042722, 1.371497, 0.3805924, 1, 0, 0.8392157, 1,
1.045469, 0.2006238, 0.416337, 1, 0, 0.8352941, 1,
1.048882, -0.9603292, 1.082237, 1, 0, 0.827451, 1,
1.051358, 1.041536, 1.678779, 1, 0, 0.8235294, 1,
1.056996, 1.319067, 3.098659, 1, 0, 0.8156863, 1,
1.063889, -0.292143, 1.850706, 1, 0, 0.8117647, 1,
1.065022, 0.9593295, -0.205092, 1, 0, 0.8039216, 1,
1.065555, -0.1922923, 1.567635, 1, 0, 0.7960784, 1,
1.070041, -0.002361869, 0.9582244, 1, 0, 0.7921569, 1,
1.075915, 0.294419, 0.7843056, 1, 0, 0.7843137, 1,
1.089256, 0.2570496, -0.5357075, 1, 0, 0.7803922, 1,
1.090996, -1.297509, 3.817563, 1, 0, 0.772549, 1,
1.097091, -0.1711694, 3.138419, 1, 0, 0.7686275, 1,
1.113871, -0.3179722, 1.585996, 1, 0, 0.7607843, 1,
1.115166, -0.3681149, 2.991755, 1, 0, 0.7568628, 1,
1.119182, 0.4955452, 2.191131, 1, 0, 0.7490196, 1,
1.134242, 1.58366, 1.094594, 1, 0, 0.7450981, 1,
1.135408, 0.7258183, 1.286436, 1, 0, 0.7372549, 1,
1.162653, -0.1555871, 2.12428, 1, 0, 0.7333333, 1,
1.164968, 1.562958, 2.614127, 1, 0, 0.7254902, 1,
1.171672, 0.5479957, 1.58561, 1, 0, 0.7215686, 1,
1.17387, 1.7974, -1.034657, 1, 0, 0.7137255, 1,
1.175304, 0.8573257, 0.8508804, 1, 0, 0.7098039, 1,
1.180838, 0.2489148, 2.483703, 1, 0, 0.7019608, 1,
1.186011, 1.582033, -0.3177689, 1, 0, 0.6941177, 1,
1.19112, 2.44515, 2.537239, 1, 0, 0.6901961, 1,
1.197236, 0.1054342, -0.6209908, 1, 0, 0.682353, 1,
1.197242, -0.1526115, 2.427308, 1, 0, 0.6784314, 1,
1.203299, -0.2491796, 1.494867, 1, 0, 0.6705883, 1,
1.203809, -1.025842, 3.026725, 1, 0, 0.6666667, 1,
1.206102, 0.7271801, 0.4115917, 1, 0, 0.6588235, 1,
1.206846, 0.8793949, 0.6497522, 1, 0, 0.654902, 1,
1.208847, -0.5532585, 3.243001, 1, 0, 0.6470588, 1,
1.220198, -0.961983, 4.187588, 1, 0, 0.6431373, 1,
1.224038, 0.6993485, 0.3477079, 1, 0, 0.6352941, 1,
1.224615, -0.4658792, 0.001301705, 1, 0, 0.6313726, 1,
1.228798, 0.2478666, 1.702981, 1, 0, 0.6235294, 1,
1.235777, 0.4138005, 0.8856367, 1, 0, 0.6196079, 1,
1.237277, 0.03709519, 1.607365, 1, 0, 0.6117647, 1,
1.239058, 0.2023686, 2.550311, 1, 0, 0.6078432, 1,
1.241111, -0.4474355, 0.8709658, 1, 0, 0.6, 1,
1.245101, 1.749433, -1.097536, 1, 0, 0.5921569, 1,
1.247934, 0.930945, 0.01297231, 1, 0, 0.5882353, 1,
1.264989, 0.05733249, 1.169853, 1, 0, 0.5803922, 1,
1.271909, -1.428311, 2.672183, 1, 0, 0.5764706, 1,
1.284825, 0.9230252, 0.08054966, 1, 0, 0.5686275, 1,
1.300437, -0.8270119, 2.079107, 1, 0, 0.5647059, 1,
1.308069, -0.05238861, 2.152003, 1, 0, 0.5568628, 1,
1.343466, -0.6479056, 1.371049, 1, 0, 0.5529412, 1,
1.346726, -0.6151482, 0.80603, 1, 0, 0.5450981, 1,
1.348584, 1.079255, 1.667665, 1, 0, 0.5411765, 1,
1.350296, 0.6844323, 2.145698, 1, 0, 0.5333334, 1,
1.35481, -0.1732783, 0.7887825, 1, 0, 0.5294118, 1,
1.362802, 0.226052, 2.508705, 1, 0, 0.5215687, 1,
1.364575, -0.9219521, 1.301211, 1, 0, 0.5176471, 1,
1.366118, 0.7880847, -0.8031415, 1, 0, 0.509804, 1,
1.374354, 0.1183581, 1.878089, 1, 0, 0.5058824, 1,
1.383476, 0.2634229, 2.544439, 1, 0, 0.4980392, 1,
1.387146, -0.1603897, 2.204379, 1, 0, 0.4901961, 1,
1.394979, -0.1154325, -0.06316441, 1, 0, 0.4862745, 1,
1.404209, 1.516984, 2.515724, 1, 0, 0.4784314, 1,
1.414812, 0.1118563, 1.098361, 1, 0, 0.4745098, 1,
1.415358, -1.339541, 2.255616, 1, 0, 0.4666667, 1,
1.416193, -1.188483, 2.018253, 1, 0, 0.4627451, 1,
1.422746, -1.550627, 2.654001, 1, 0, 0.454902, 1,
1.429722, 1.213863, 0.6947663, 1, 0, 0.4509804, 1,
1.438118, 0.3905223, 0.05188537, 1, 0, 0.4431373, 1,
1.456626, 0.8100522, 1.764202, 1, 0, 0.4392157, 1,
1.465231, -0.4007786, 1.803026, 1, 0, 0.4313726, 1,
1.471984, -0.8065091, 3.303747, 1, 0, 0.427451, 1,
1.475881, -0.7980428, 1.298296, 1, 0, 0.4196078, 1,
1.483873, -0.2864393, 1.091047, 1, 0, 0.4156863, 1,
1.486907, -0.4988665, 1.394452, 1, 0, 0.4078431, 1,
1.494571, -0.4597844, 2.177875, 1, 0, 0.4039216, 1,
1.524261, -0.744762, 2.71982, 1, 0, 0.3960784, 1,
1.541141, 1.189138, 0.3565314, 1, 0, 0.3882353, 1,
1.544531, 1.566485, 0.3181552, 1, 0, 0.3843137, 1,
1.549346, -0.4233265, 2.787683, 1, 0, 0.3764706, 1,
1.563001, -1.329952, -0.2504238, 1, 0, 0.372549, 1,
1.564287, 1.25185, 0.0867843, 1, 0, 0.3647059, 1,
1.574414, -0.7633647, 2.510839, 1, 0, 0.3607843, 1,
1.575455, -0.3968006, 0.7579073, 1, 0, 0.3529412, 1,
1.588847, -1.186962, 1.116834, 1, 0, 0.3490196, 1,
1.5976, -0.5797521, 1.662501, 1, 0, 0.3411765, 1,
1.602595, -1.199525, 3.158335, 1, 0, 0.3372549, 1,
1.618749, -1.01272, 1.990269, 1, 0, 0.3294118, 1,
1.624503, -1.051289, 0.8372971, 1, 0, 0.3254902, 1,
1.627551, 3.047358, -0.3731931, 1, 0, 0.3176471, 1,
1.628153, -0.7537472, 2.948135, 1, 0, 0.3137255, 1,
1.633976, -0.4370652, 1.882102, 1, 0, 0.3058824, 1,
1.634978, -0.4379562, 2.052232, 1, 0, 0.2980392, 1,
1.638688, 1.006497, 0.853672, 1, 0, 0.2941177, 1,
1.639038, -0.1425157, -0.01434851, 1, 0, 0.2862745, 1,
1.641612, 0.1371032, 1.818364, 1, 0, 0.282353, 1,
1.647101, 0.5794697, 1.227103, 1, 0, 0.2745098, 1,
1.651328, 1.583175, 2.695091, 1, 0, 0.2705882, 1,
1.659818, 0.7692162, 0.3219929, 1, 0, 0.2627451, 1,
1.692427, 0.8933036, -0.4098538, 1, 0, 0.2588235, 1,
1.704402, -1.250516, 3.274346, 1, 0, 0.2509804, 1,
1.749662, 1.535636, 0.6297986, 1, 0, 0.2470588, 1,
1.756607, -0.8553523, 2.22066, 1, 0, 0.2392157, 1,
1.773805, -0.8644367, 0.04176628, 1, 0, 0.2352941, 1,
1.791653, -1.329965, 3.909482, 1, 0, 0.227451, 1,
1.803136, 0.2177396, 1.563574, 1, 0, 0.2235294, 1,
1.806372, 0.1936968, 1.59837, 1, 0, 0.2156863, 1,
1.8066, -0.1241563, 1.243362, 1, 0, 0.2117647, 1,
1.823552, -1.274137, 2.917832, 1, 0, 0.2039216, 1,
1.851669, -0.7265192, 0.9854694, 1, 0, 0.1960784, 1,
1.855521, -1.93842, 0.9999213, 1, 0, 0.1921569, 1,
1.856527, -0.2950547, 1.111365, 1, 0, 0.1843137, 1,
1.868541, -1.202175, 0.9367312, 1, 0, 0.1803922, 1,
1.884267, -0.6599061, 3.428675, 1, 0, 0.172549, 1,
1.885225, -0.2092049, 1.394422, 1, 0, 0.1686275, 1,
1.885794, 1.190694, -0.5910539, 1, 0, 0.1607843, 1,
1.926885, -0.5301761, 0.5943962, 1, 0, 0.1568628, 1,
1.928881, 0.2883135, 3.083962, 1, 0, 0.1490196, 1,
1.981583, 0.9059746, 1.544853, 1, 0, 0.145098, 1,
1.994459, 0.2784722, 1.216301, 1, 0, 0.1372549, 1,
2.00136, -0.406557, 2.359859, 1, 0, 0.1333333, 1,
2.024378, 0.4705719, 0.6264096, 1, 0, 0.1254902, 1,
2.034545, 0.8273231, 1.767637, 1, 0, 0.1215686, 1,
2.085414, 0.5361214, 1.011934, 1, 0, 0.1137255, 1,
2.126415, -0.107606, 1.810756, 1, 0, 0.1098039, 1,
2.141377, 0.3771387, 0.6307029, 1, 0, 0.1019608, 1,
2.164901, 0.4511445, 0.1868456, 1, 0, 0.09411765, 1,
2.176995, -0.3015277, 1.51477, 1, 0, 0.09019608, 1,
2.186955, -0.4932832, 1.889844, 1, 0, 0.08235294, 1,
2.194531, -0.7950497, 1.545466, 1, 0, 0.07843138, 1,
2.196543, 0.2724, 1.590268, 1, 0, 0.07058824, 1,
2.322556, 0.3825184, 2.383727, 1, 0, 0.06666667, 1,
2.337148, -0.4754806, 0.5310568, 1, 0, 0.05882353, 1,
2.378961, 0.1005358, 1.904169, 1, 0, 0.05490196, 1,
2.417255, -0.7272723, 2.093985, 1, 0, 0.04705882, 1,
2.567497, -0.5298417, 2.161904, 1, 0, 0.04313726, 1,
2.569002, -0.811421, 1.941331, 1, 0, 0.03529412, 1,
2.6007, -0.4949675, 1.725638, 1, 0, 0.03137255, 1,
2.670948, 1.686129, 1.117132, 1, 0, 0.02352941, 1,
2.746486, -0.9450034, 2.903991, 1, 0, 0.01960784, 1,
3.087955, -2.052453, 1.900638, 1, 0, 0.01176471, 1,
3.572734, -0.08957748, -0.04319736, 1, 0, 0.007843138, 1
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
0.3877172, -5.95971, -7.622846, 0, -0.5, 0.5, 0.5,
0.3877172, -5.95971, -7.622846, 1, -0.5, 0.5, 0.5,
0.3877172, -5.95971, -7.622846, 1, 1.5, 0.5, 0.5,
0.3877172, -5.95971, -7.622846, 0, 1.5, 0.5, 0.5
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
-3.87702, -0.8034619, -7.622846, 0, -0.5, 0.5, 0.5,
-3.87702, -0.8034619, -7.622846, 1, -0.5, 0.5, 0.5,
-3.87702, -0.8034619, -7.622846, 1, 1.5, 0.5, 0.5,
-3.87702, -0.8034619, -7.622846, 0, 1.5, 0.5, 0.5
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
-3.87702, -5.95971, 0.4176009, 0, -0.5, 0.5, 0.5,
-3.87702, -5.95971, 0.4176009, 1, -0.5, 0.5, 0.5,
-3.87702, -5.95971, 0.4176009, 1, 1.5, 0.5, 0.5,
-3.87702, -5.95971, 0.4176009, 0, 1.5, 0.5, 0.5
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
-2, -4.769807, -5.767358,
3, -4.769807, -5.767358,
-2, -4.769807, -5.767358,
-2, -4.968124, -6.076606,
-1, -4.769807, -5.767358,
-1, -4.968124, -6.076606,
0, -4.769807, -5.767358,
0, -4.968124, -6.076606,
1, -4.769807, -5.767358,
1, -4.968124, -6.076606,
2, -4.769807, -5.767358,
2, -4.968124, -6.076606,
3, -4.769807, -5.767358,
3, -4.968124, -6.076606
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
-2, -5.364758, -6.695102, 0, -0.5, 0.5, 0.5,
-2, -5.364758, -6.695102, 1, -0.5, 0.5, 0.5,
-2, -5.364758, -6.695102, 1, 1.5, 0.5, 0.5,
-2, -5.364758, -6.695102, 0, 1.5, 0.5, 0.5,
-1, -5.364758, -6.695102, 0, -0.5, 0.5, 0.5,
-1, -5.364758, -6.695102, 1, -0.5, 0.5, 0.5,
-1, -5.364758, -6.695102, 1, 1.5, 0.5, 0.5,
-1, -5.364758, -6.695102, 0, 1.5, 0.5, 0.5,
0, -5.364758, -6.695102, 0, -0.5, 0.5, 0.5,
0, -5.364758, -6.695102, 1, -0.5, 0.5, 0.5,
0, -5.364758, -6.695102, 1, 1.5, 0.5, 0.5,
0, -5.364758, -6.695102, 0, 1.5, 0.5, 0.5,
1, -5.364758, -6.695102, 0, -0.5, 0.5, 0.5,
1, -5.364758, -6.695102, 1, -0.5, 0.5, 0.5,
1, -5.364758, -6.695102, 1, 1.5, 0.5, 0.5,
1, -5.364758, -6.695102, 0, 1.5, 0.5, 0.5,
2, -5.364758, -6.695102, 0, -0.5, 0.5, 0.5,
2, -5.364758, -6.695102, 1, -0.5, 0.5, 0.5,
2, -5.364758, -6.695102, 1, 1.5, 0.5, 0.5,
2, -5.364758, -6.695102, 0, 1.5, 0.5, 0.5,
3, -5.364758, -6.695102, 0, -0.5, 0.5, 0.5,
3, -5.364758, -6.695102, 1, -0.5, 0.5, 0.5,
3, -5.364758, -6.695102, 1, 1.5, 0.5, 0.5,
3, -5.364758, -6.695102, 0, 1.5, 0.5, 0.5
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
-2.89285, -4, -5.767358,
-2.89285, 2, -5.767358,
-2.89285, -4, -5.767358,
-3.056879, -4, -6.076606,
-2.89285, -2, -5.767358,
-3.056879, -2, -6.076606,
-2.89285, 0, -5.767358,
-3.056879, 0, -6.076606,
-2.89285, 2, -5.767358,
-3.056879, 2, -6.076606
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
"-4",
"-2",
"0",
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
-3.384935, -4, -6.695102, 0, -0.5, 0.5, 0.5,
-3.384935, -4, -6.695102, 1, -0.5, 0.5, 0.5,
-3.384935, -4, -6.695102, 1, 1.5, 0.5, 0.5,
-3.384935, -4, -6.695102, 0, 1.5, 0.5, 0.5,
-3.384935, -2, -6.695102, 0, -0.5, 0.5, 0.5,
-3.384935, -2, -6.695102, 1, -0.5, 0.5, 0.5,
-3.384935, -2, -6.695102, 1, 1.5, 0.5, 0.5,
-3.384935, -2, -6.695102, 0, 1.5, 0.5, 0.5,
-3.384935, 0, -6.695102, 0, -0.5, 0.5, 0.5,
-3.384935, 0, -6.695102, 1, -0.5, 0.5, 0.5,
-3.384935, 0, -6.695102, 1, 1.5, 0.5, 0.5,
-3.384935, 0, -6.695102, 0, 1.5, 0.5, 0.5,
-3.384935, 2, -6.695102, 0, -0.5, 0.5, 0.5,
-3.384935, 2, -6.695102, 1, -0.5, 0.5, 0.5,
-3.384935, 2, -6.695102, 1, 1.5, 0.5, 0.5,
-3.384935, 2, -6.695102, 0, 1.5, 0.5, 0.5
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
-2.89285, -4.769807, -4,
-2.89285, -4.769807, 6,
-2.89285, -4.769807, -4,
-3.056879, -4.968124, -4,
-2.89285, -4.769807, -2,
-3.056879, -4.968124, -2,
-2.89285, -4.769807, 0,
-3.056879, -4.968124, 0,
-2.89285, -4.769807, 2,
-3.056879, -4.968124, 2,
-2.89285, -4.769807, 4,
-3.056879, -4.968124, 4,
-2.89285, -4.769807, 6,
-3.056879, -4.968124, 6
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
"4",
"6"
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
-3.384935, -5.364758, -4, 0, -0.5, 0.5, 0.5,
-3.384935, -5.364758, -4, 1, -0.5, 0.5, 0.5,
-3.384935, -5.364758, -4, 1, 1.5, 0.5, 0.5,
-3.384935, -5.364758, -4, 0, 1.5, 0.5, 0.5,
-3.384935, -5.364758, -2, 0, -0.5, 0.5, 0.5,
-3.384935, -5.364758, -2, 1, -0.5, 0.5, 0.5,
-3.384935, -5.364758, -2, 1, 1.5, 0.5, 0.5,
-3.384935, -5.364758, -2, 0, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 0, 0, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 0, 1, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 0, 1, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 0, 0, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 2, 0, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 2, 1, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 2, 1, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 2, 0, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 4, 0, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 4, 1, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 4, 1, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 4, 0, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 6, 0, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 6, 1, -0.5, 0.5, 0.5,
-3.384935, -5.364758, 6, 1, 1.5, 0.5, 0.5,
-3.384935, -5.364758, 6, 0, 1.5, 0.5, 0.5
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
-2.89285, -4.769807, -5.767358,
-2.89285, 3.162883, -5.767358,
-2.89285, -4.769807, 6.60256,
-2.89285, 3.162883, 6.60256,
-2.89285, -4.769807, -5.767358,
-2.89285, -4.769807, 6.60256,
-2.89285, 3.162883, -5.767358,
-2.89285, 3.162883, 6.60256,
-2.89285, -4.769807, -5.767358,
3.668285, -4.769807, -5.767358,
-2.89285, -4.769807, 6.60256,
3.668285, -4.769807, 6.60256,
-2.89285, 3.162883, -5.767358,
3.668285, 3.162883, -5.767358,
-2.89285, 3.162883, 6.60256,
3.668285, 3.162883, 6.60256,
3.668285, -4.769807, -5.767358,
3.668285, 3.162883, -5.767358,
3.668285, -4.769807, 6.60256,
3.668285, 3.162883, 6.60256,
3.668285, -4.769807, -5.767358,
3.668285, -4.769807, 6.60256,
3.668285, 3.162883, -5.767358,
3.668285, 3.162883, 6.60256
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
var radius = 8.593454;
var distance = 38.23325;
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
mvMatrix.translate( -0.3877172, 0.8034619, -0.4176009 );
mvMatrix.scale( 1.416129, 1.171281, 0.7511295 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -38.23325);
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
gl.drawArrays(gl.LINES, 0, 10);
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
gl.drawElements(gl.TRIANGLES, 24, gl.UNSIGNED_SHORT, 0);
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
lepton<-read.table("lepton.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-lepton$V2
```

```
## Error in eval(expr, envir, enclos): object 'lepton' not found
```

```r
y<-lepton$V3
```

```
## Error in eval(expr, envir, enclos): object 'lepton' not found
```

```r
z<-lepton$V4
```

```
## Error in eval(expr, envir, enclos): object 'lepton' not found
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
-2.7973, 0.8623096, -1.679291, 0, 0, 1, 1, 1,
-2.758489, -0.549831, -1.53591, 1, 0, 0, 1, 1,
-2.731698, 0.1143875, -0.3725615, 1, 0, 0, 1, 1,
-2.596929, 1.159276, -0.5630655, 1, 0, 0, 1, 1,
-2.58343, 0.8369803, -2.122497, 1, 0, 0, 1, 1,
-2.574256, 0.3541419, 0.1759741, 1, 0, 0, 1, 1,
-2.461101, 0.7753882, -2.083563, 0, 0, 0, 1, 1,
-2.404034, 0.0165395, -1.009807, 0, 0, 0, 1, 1,
-2.395226, 0.1238642, -3.063892, 0, 0, 0, 1, 1,
-2.362777, 0.4930981, -1.401614, 0, 0, 0, 1, 1,
-2.335186, 0.9759852, -3.823044, 0, 0, 0, 1, 1,
-2.294116, -0.1608075, -1.218469, 0, 0, 0, 1, 1,
-2.226428, 0.08664129, -1.340709, 0, 0, 0, 1, 1,
-2.209321, 0.8112498, -2.252244, 1, 1, 1, 1, 1,
-2.182665, -1.395037, -1.945001, 1, 1, 1, 1, 1,
-2.116596, 0.6333623, 0.2877237, 1, 1, 1, 1, 1,
-2.110045, -0.382723, -1.759149, 1, 1, 1, 1, 1,
-2.052445, -0.701867, -0.8557784, 1, 1, 1, 1, 1,
-2.030847, -0.9573537, -1.217541, 1, 1, 1, 1, 1,
-2.030014, 1.827296, 0.09894206, 1, 1, 1, 1, 1,
-2.017086, -0.175643, -1.575864, 1, 1, 1, 1, 1,
-1.945197, 0.5579968, -0.4794527, 1, 1, 1, 1, 1,
-1.924911, 0.6555644, -2.462633, 1, 1, 1, 1, 1,
-1.915546, 0.7305957, -0.6981797, 1, 1, 1, 1, 1,
-1.899252, -0.3211406, -1.978043, 1, 1, 1, 1, 1,
-1.883719, -0.552969, -2.205688, 1, 1, 1, 1, 1,
-1.874872, 0.2947454, -1.086191, 1, 1, 1, 1, 1,
-1.874195, 1.82207, -0.7942508, 1, 1, 1, 1, 1,
-1.87393, 0.9768991, -0.261208, 0, 0, 1, 1, 1,
-1.859049, -0.5573795, -2.038187, 1, 0, 0, 1, 1,
-1.856801, 0.5511588, -1.817059, 1, 0, 0, 1, 1,
-1.83641, -1.41992, -3.498253, 1, 0, 0, 1, 1,
-1.787849, -1.1413, -1.215267, 1, 0, 0, 1, 1,
-1.760588, 0.6519161, -1.629182, 1, 0, 0, 1, 1,
-1.74253, -1.034688, -1.758078, 0, 0, 0, 1, 1,
-1.73739, -0.9557278, -3.683108, 0, 0, 0, 1, 1,
-1.732427, -0.4731883, -2.034973, 0, 0, 0, 1, 1,
-1.724648, -0.5574183, -1.864536, 0, 0, 0, 1, 1,
-1.721136, 0.7480817, 0.2524648, 0, 0, 0, 1, 1,
-1.705011, 0.1061323, -0.6902651, 0, 0, 0, 1, 1,
-1.679287, 0.1098708, -1.195203, 0, 0, 0, 1, 1,
-1.666248, -0.5952391, -3.939432, 1, 1, 1, 1, 1,
-1.662406, 0.3392415, -0.5801213, 1, 1, 1, 1, 1,
-1.660194, -0.4620221, -0.7644943, 1, 1, 1, 1, 1,
-1.655955, -0.7077608, -3.719452, 1, 1, 1, 1, 1,
-1.647962, 0.1453777, -2.394652, 1, 1, 1, 1, 1,
-1.622779, -0.4072834, -2.919882, 1, 1, 1, 1, 1,
-1.576344, 0.1745089, -2.430435, 1, 1, 1, 1, 1,
-1.565563, 1.277106, -0.2522329, 1, 1, 1, 1, 1,
-1.557801, 0.04991275, -0.6456437, 1, 1, 1, 1, 1,
-1.550038, 0.2098767, -0.7713379, 1, 1, 1, 1, 1,
-1.540536, 1.179737, 1.903753, 1, 1, 1, 1, 1,
-1.535517, -0.3619391, -1.93789, 1, 1, 1, 1, 1,
-1.534058, 0.4627804, -2.562217, 1, 1, 1, 1, 1,
-1.529695, -0.3510015, -4.072307, 1, 1, 1, 1, 1,
-1.512023, -1.544228, -3.353828, 1, 1, 1, 1, 1,
-1.494649, -1.659218, -2.504004, 0, 0, 1, 1, 1,
-1.479851, -0.8832477, -0.7473949, 1, 0, 0, 1, 1,
-1.465011, 1.147915, -1.503997, 1, 0, 0, 1, 1,
-1.462836, -0.391443, -1.171303, 1, 0, 0, 1, 1,
-1.457601, -1.432516, -3.379361, 1, 0, 0, 1, 1,
-1.445574, 0.06273554, -2.741918, 1, 0, 0, 1, 1,
-1.444088, -0.1550998, -2.432208, 0, 0, 0, 1, 1,
-1.419291, 1.502921, -0.1915138, 0, 0, 0, 1, 1,
-1.416267, 0.6755494, 0.310621, 0, 0, 0, 1, 1,
-1.410657, -0.3985092, -2.80303, 0, 0, 0, 1, 1,
-1.406734, 0.7783858, -0.3959486, 0, 0, 0, 1, 1,
-1.401412, -0.7993169, -1.518546, 0, 0, 0, 1, 1,
-1.400975, -0.5118068, -0.4739305, 0, 0, 0, 1, 1,
-1.399978, -1.206277, -1.121168, 1, 1, 1, 1, 1,
-1.398801, 1.180303, -0.833662, 1, 1, 1, 1, 1,
-1.384652, -0.2713116, -0.8918043, 1, 1, 1, 1, 1,
-1.377847, 0.1978906, -0.721984, 1, 1, 1, 1, 1,
-1.377425, -1.012367, -0.8580581, 1, 1, 1, 1, 1,
-1.368369, -0.9853649, -5.169014, 1, 1, 1, 1, 1,
-1.362543, -0.2120171, -0.8047944, 1, 1, 1, 1, 1,
-1.362445, -0.8281408, -1.619516, 1, 1, 1, 1, 1,
-1.355249, -0.8090645, -0.1898017, 1, 1, 1, 1, 1,
-1.354482, -0.7139828, -3.403476, 1, 1, 1, 1, 1,
-1.34148, 0.6305283, -0.3796504, 1, 1, 1, 1, 1,
-1.340496, -0.4219245, -0.88089, 1, 1, 1, 1, 1,
-1.33829, 0.02794916, -2.608442, 1, 1, 1, 1, 1,
-1.334701, -0.6432142, -2.552305, 1, 1, 1, 1, 1,
-1.324157, 1.153148, -0.7258123, 1, 1, 1, 1, 1,
-1.318616, 1.19851, -0.5468473, 0, 0, 1, 1, 1,
-1.317539, -0.5424787, -1.309365, 1, 0, 0, 1, 1,
-1.310771, 1.152271, -2.676151, 1, 0, 0, 1, 1,
-1.308509, 0.4871764, -1.126814, 1, 0, 0, 1, 1,
-1.306192, -0.1776264, -1.735219, 1, 0, 0, 1, 1,
-1.298515, -1.486499, -2.081903, 1, 0, 0, 1, 1,
-1.297549, 0.02741174, -1.298411, 0, 0, 0, 1, 1,
-1.292645, 0.05815309, -2.851557, 0, 0, 0, 1, 1,
-1.283911, 1.272843, 0.314321, 0, 0, 0, 1, 1,
-1.282937, 0.5775569, 0.2776518, 0, 0, 0, 1, 1,
-1.276721, -0.2717539, -1.531048, 0, 0, 0, 1, 1,
-1.246433, 0.1432705, -1.152114, 0, 0, 0, 1, 1,
-1.240711, -0.2620299, -1.497431, 0, 0, 0, 1, 1,
-1.233114, 0.1777021, -1.930936, 1, 1, 1, 1, 1,
-1.229949, -1.378625, -3.398655, 1, 1, 1, 1, 1,
-1.213738, 1.063064, -1.775055, 1, 1, 1, 1, 1,
-1.211311, -0.2274135, -0.8794722, 1, 1, 1, 1, 1,
-1.202884, 0.4356732, -1.70741, 1, 1, 1, 1, 1,
-1.197835, 0.5424477, -2.249341, 1, 1, 1, 1, 1,
-1.193849, -0.2457602, -0.7460068, 1, 1, 1, 1, 1,
-1.18622, 0.1292102, -0.2007217, 1, 1, 1, 1, 1,
-1.185744, -1.358178, -1.768414, 1, 1, 1, 1, 1,
-1.181274, 0.9630969, -1.945439, 1, 1, 1, 1, 1,
-1.180862, -0.5411428, -3.509447, 1, 1, 1, 1, 1,
-1.178355, -0.3126006, -1.089943, 1, 1, 1, 1, 1,
-1.17632, -1.417671, -0.3671174, 1, 1, 1, 1, 1,
-1.175737, 1.512253, -0.349569, 1, 1, 1, 1, 1,
-1.148347, 0.7891547, -1.978517, 1, 1, 1, 1, 1,
-1.146377, 0.5857041, 0.625619, 0, 0, 1, 1, 1,
-1.144504, -0.4555663, -1.598262, 1, 0, 0, 1, 1,
-1.143672, 1.522353, -1.163854, 1, 0, 0, 1, 1,
-1.14239, -1.224329, -3.655504, 1, 0, 0, 1, 1,
-1.141768, 0.5440665, -1.278587, 1, 0, 0, 1, 1,
-1.14081, 0.8712217, -0.3012668, 1, 0, 0, 1, 1,
-1.139065, -2.308609, -1.108186, 0, 0, 0, 1, 1,
-1.133894, -1.788369, -2.873428, 0, 0, 0, 1, 1,
-1.125997, -1.24106, -2.600322, 0, 0, 0, 1, 1,
-1.120791, 0.5299574, -0.628019, 0, 0, 0, 1, 1,
-1.11422, 0.1989505, -2.197603, 0, 0, 0, 1, 1,
-1.112317, -0.6487381, -1.466099, 0, 0, 0, 1, 1,
-1.09916, 1.011517, -0.540386, 0, 0, 0, 1, 1,
-1.095494, 0.3677831, -0.6762966, 1, 1, 1, 1, 1,
-1.093969, -0.6575293, -2.237516, 1, 1, 1, 1, 1,
-1.09253, -2.005618, -2.597417, 1, 1, 1, 1, 1,
-1.089535, -0.676531, -4.616599, 1, 1, 1, 1, 1,
-1.08889, -1.275819, -3.561855, 1, 1, 1, 1, 1,
-1.082004, 0.8829151, -0.6570014, 1, 1, 1, 1, 1,
-1.079102, 0.3346705, -1.617625, 1, 1, 1, 1, 1,
-1.070645, -2.607335, -2.368165, 1, 1, 1, 1, 1,
-1.064974, -1.486732, -3.02927, 1, 1, 1, 1, 1,
-1.059618, 0.9973832, 0.0540424, 1, 1, 1, 1, 1,
-1.053526, 0.07385013, -0.5288089, 1, 1, 1, 1, 1,
-1.046813, 1.581977, -0.04070911, 1, 1, 1, 1, 1,
-1.046104, -0.03500215, -2.222013, 1, 1, 1, 1, 1,
-1.045853, 0.1721855, -0.1082824, 1, 1, 1, 1, 1,
-1.03804, 0.01324806, -0.3959554, 1, 1, 1, 1, 1,
-1.036978, -1.267218, -0.8999898, 0, 0, 1, 1, 1,
-1.034457, 0.9854105, -2.24206, 1, 0, 0, 1, 1,
-1.021065, -0.4915279, -2.063536, 1, 0, 0, 1, 1,
-1.013058, -0.05537067, -1.502095, 1, 0, 0, 1, 1,
-1.009731, -1.849854, -3.189954, 1, 0, 0, 1, 1,
-1.009513, 0.4940535, -0.7190504, 1, 0, 0, 1, 1,
-1.005439, 0.3817768, -0.2731699, 0, 0, 0, 1, 1,
-1.004302, 0.8939654, -0.05779333, 0, 0, 0, 1, 1,
-1.002419, 0.3022532, -1.677642, 0, 0, 0, 1, 1,
-0.9979139, -1.656639, -3.400227, 0, 0, 0, 1, 1,
-0.9839475, -0.705162, 0.5144204, 0, 0, 0, 1, 1,
-0.9689617, 0.3404216, -1.78604, 0, 0, 0, 1, 1,
-0.968574, -0.408088, -3.527013, 0, 0, 0, 1, 1,
-0.963585, -0.5646569, -3.532524, 1, 1, 1, 1, 1,
-0.9552829, -0.08626915, -1.847101, 1, 1, 1, 1, 1,
-0.9550682, 0.8937384, -0.4300846, 1, 1, 1, 1, 1,
-0.9510545, 0.2763098, -2.099646, 1, 1, 1, 1, 1,
-0.9495921, 0.9645017, -0.4161626, 1, 1, 1, 1, 1,
-0.9478261, -0.2353272, -2.242316, 1, 1, 1, 1, 1,
-0.9453917, 0.7161589, -0.8003615, 1, 1, 1, 1, 1,
-0.9397944, -1.646224, -2.573215, 1, 1, 1, 1, 1,
-0.9319117, -0.0004150951, -0.4761274, 1, 1, 1, 1, 1,
-0.9291585, 1.283902, -0.9495599, 1, 1, 1, 1, 1,
-0.9257784, -0.2561636, -1.885312, 1, 1, 1, 1, 1,
-0.9255773, -0.4461325, -1.58745, 1, 1, 1, 1, 1,
-0.9238687, 1.76505, 0.2183648, 1, 1, 1, 1, 1,
-0.9176637, 0.3703886, -1.568442, 1, 1, 1, 1, 1,
-0.9133762, 0.9242742, -1.148716, 1, 1, 1, 1, 1,
-0.9127505, -0.5249342, -2.578798, 0, 0, 1, 1, 1,
-0.8956671, -0.1219926, -1.259084, 1, 0, 0, 1, 1,
-0.893366, 0.6933507, -1.24562, 1, 0, 0, 1, 1,
-0.8908392, -0.1217905, -2.168951, 1, 0, 0, 1, 1,
-0.8898389, 0.4227737, -0.7145666, 1, 0, 0, 1, 1,
-0.8894773, 0.3497411, -1.840354, 1, 0, 0, 1, 1,
-0.886944, 0.1057037, -1.678766, 0, 0, 0, 1, 1,
-0.878267, -0.7335997, -2.362208, 0, 0, 0, 1, 1,
-0.8771104, 1.44876, -0.9546042, 0, 0, 0, 1, 1,
-0.8770134, 1.350282, 0.6539819, 0, 0, 0, 1, 1,
-0.8720186, -0.2384143, -1.265208, 0, 0, 0, 1, 1,
-0.8609785, 0.640122, -0.6342061, 0, 0, 0, 1, 1,
-0.8575802, -0.301492, -2.717611, 0, 0, 0, 1, 1,
-0.8526709, -0.1730956, -1.596846, 1, 1, 1, 1, 1,
-0.8513597, 0.4775264, -1.78634, 1, 1, 1, 1, 1,
-0.849548, 1.260862, -1.743543, 1, 1, 1, 1, 1,
-0.8413706, -1.310079, -0.6656771, 1, 1, 1, 1, 1,
-0.841222, -0.816246, -4.471641, 1, 1, 1, 1, 1,
-0.8370408, -0.558187, -1.072407, 1, 1, 1, 1, 1,
-0.8300967, 0.6255144, 0.8928264, 1, 1, 1, 1, 1,
-0.8244311, 1.26382, -0.9321294, 1, 1, 1, 1, 1,
-0.8241429, 0.3883947, -2.368964, 1, 1, 1, 1, 1,
-0.8227173, -0.2211202, -1.572802, 1, 1, 1, 1, 1,
-0.8202531, 1.377858, -0.3202326, 1, 1, 1, 1, 1,
-0.819514, 2.070394, -0.1201813, 1, 1, 1, 1, 1,
-0.8117797, 1.611501, -0.2626723, 1, 1, 1, 1, 1,
-0.8099893, -0.5499111, -1.96873, 1, 1, 1, 1, 1,
-0.8095607, 1.221372, -1.296754, 1, 1, 1, 1, 1,
-0.8058886, -1.401677, -0.8672875, 0, 0, 1, 1, 1,
-0.8042235, 0.5818834, 0.4672168, 1, 0, 0, 1, 1,
-0.8010408, 0.7937102, -1.615946, 1, 0, 0, 1, 1,
-0.8009611, -1.002544, -1.548695, 1, 0, 0, 1, 1,
-0.799938, 0.7770913, -1.579411, 1, 0, 0, 1, 1,
-0.7938927, -1.252237, -2.029842, 1, 0, 0, 1, 1,
-0.7930594, 1.546184, -0.6487715, 0, 0, 0, 1, 1,
-0.7904345, -0.5358617, -1.484589, 0, 0, 0, 1, 1,
-0.7852154, -0.2068525, -2.010758, 0, 0, 0, 1, 1,
-0.7792839, 1.290434, -1.161444, 0, 0, 0, 1, 1,
-0.7764354, -0.8126227, -2.403617, 0, 0, 0, 1, 1,
-0.768158, -2.249055, -3.468056, 0, 0, 0, 1, 1,
-0.7621981, -0.3400538, -0.7416539, 0, 0, 0, 1, 1,
-0.7619994, 0.8441243, -0.3362359, 1, 1, 1, 1, 1,
-0.7616217, -0.3859581, -3.127306, 1, 1, 1, 1, 1,
-0.7586674, -0.869682, -2.384624, 1, 1, 1, 1, 1,
-0.7577064, -0.8241564, -3.021208, 1, 1, 1, 1, 1,
-0.7573335, -0.1101011, -3.773165, 1, 1, 1, 1, 1,
-0.7553251, -0.0822841, -2.598623, 1, 1, 1, 1, 1,
-0.7551342, -0.3396748, -0.9167924, 1, 1, 1, 1, 1,
-0.7512645, 1.864737, 0.05901686, 1, 1, 1, 1, 1,
-0.7446784, -0.4316914, -1.761936, 1, 1, 1, 1, 1,
-0.7423743, 0.1266153, -1.405335, 1, 1, 1, 1, 1,
-0.7408598, 0.6505102, -0.68432, 1, 1, 1, 1, 1,
-0.7275178, -0.5681462, -2.333911, 1, 1, 1, 1, 1,
-0.7233074, 1.449471, 0.2726128, 1, 1, 1, 1, 1,
-0.7193543, 2.342637, -0.1633386, 1, 1, 1, 1, 1,
-0.7192633, 1.083239, 0.5428262, 1, 1, 1, 1, 1,
-0.7178041, 1.192841, -0.8525547, 0, 0, 1, 1, 1,
-0.7176674, 0.4245391, 0.4997387, 1, 0, 0, 1, 1,
-0.7164433, -2.075174, -3.255971, 1, 0, 0, 1, 1,
-0.7141829, 1.715738, 0.1675445, 1, 0, 0, 1, 1,
-0.7130904, -1.196683, -3.158166, 1, 0, 0, 1, 1,
-0.7129361, 1.368396, -0.3516117, 1, 0, 0, 1, 1,
-0.7096633, 0.2819982, -1.853026, 0, 0, 0, 1, 1,
-0.7089608, -0.233267, -1.481298, 0, 0, 0, 1, 1,
-0.7071249, 0.7950564, -0.7814479, 0, 0, 0, 1, 1,
-0.7051999, -0.1277218, -2.113902, 0, 0, 0, 1, 1,
-0.7033398, 0.1158731, -1.146329, 0, 0, 0, 1, 1,
-0.6998731, 0.6211576, -1.453556, 0, 0, 0, 1, 1,
-0.6975547, -0.5017464, -1.109995, 0, 0, 0, 1, 1,
-0.6927767, -0.3805837, -2.3748, 1, 1, 1, 1, 1,
-0.6922758, 0.8800244, -1.317177, 1, 1, 1, 1, 1,
-0.6824842, 1.389908, 0.8525017, 1, 1, 1, 1, 1,
-0.6817583, -0.6324996, -0.9244868, 1, 1, 1, 1, 1,
-0.6816902, 0.08419611, -0.443882, 1, 1, 1, 1, 1,
-0.6725035, -1.381375, -1.783401, 1, 1, 1, 1, 1,
-0.6683251, 0.09077855, -0.8021297, 1, 1, 1, 1, 1,
-0.6656902, 0.3857127, 0.6869955, 1, 1, 1, 1, 1,
-0.6635681, -0.6643856, -1.879167, 1, 1, 1, 1, 1,
-0.6621092, -0.1973405, -2.486816, 1, 1, 1, 1, 1,
-0.6610778, 0.5398563, -0.7172786, 1, 1, 1, 1, 1,
-0.6606702, 1.561195, -0.2709026, 1, 1, 1, 1, 1,
-0.6595751, -0.6504987, -2.054701, 1, 1, 1, 1, 1,
-0.6584412, -0.03043522, 0.4955404, 1, 1, 1, 1, 1,
-0.6570814, -0.4840263, -3.694198, 1, 1, 1, 1, 1,
-0.6568604, -0.06117825, -2.075409, 0, 0, 1, 1, 1,
-0.6529496, -1.644422, 0.4693394, 1, 0, 0, 1, 1,
-0.6504627, 0.3910889, -2.161381, 1, 0, 0, 1, 1,
-0.6483023, -1.319218, -4.847247, 1, 0, 0, 1, 1,
-0.643392, -1.128724, -3.590868, 1, 0, 0, 1, 1,
-0.6416277, -0.1014813, -0.6145533, 1, 0, 0, 1, 1,
-0.6276358, 0.5918036, -0.6039558, 0, 0, 0, 1, 1,
-0.6254163, -0.1693245, -1.958794, 0, 0, 0, 1, 1,
-0.6139342, 1.319915, -0.385504, 0, 0, 0, 1, 1,
-0.612365, -0.166658, -1.69066, 0, 0, 0, 1, 1,
-0.6113031, 1.008593, -0.7920012, 0, 0, 0, 1, 1,
-0.605494, -0.5707524, -2.390484, 0, 0, 0, 1, 1,
-0.6037599, 0.5189018, -1.249685, 0, 0, 0, 1, 1,
-0.6012216, -0.2860531, -2.229148, 1, 1, 1, 1, 1,
-0.6001253, 2.284213, -0.9476851, 1, 1, 1, 1, 1,
-0.5962892, 0.407409, -2.194157, 1, 1, 1, 1, 1,
-0.5920066, -0.5257154, -2.012398, 1, 1, 1, 1, 1,
-0.5919814, 0.3874775, -0.782143, 1, 1, 1, 1, 1,
-0.5909424, -1.145586, -2.220285, 1, 1, 1, 1, 1,
-0.5882918, -0.9088836, -2.588531, 1, 1, 1, 1, 1,
-0.5827931, -1.129795, -2.474977, 1, 1, 1, 1, 1,
-0.5797422, 0.3770074, -1.357012, 1, 1, 1, 1, 1,
-0.5724268, -1.052148, -3.021341, 1, 1, 1, 1, 1,
-0.5718151, 3.008621, 0.5830802, 1, 1, 1, 1, 1,
-0.5716022, 0.5676023, -2.066624, 1, 1, 1, 1, 1,
-0.5699916, -0.1531373, -3.812824, 1, 1, 1, 1, 1,
-0.565938, -0.07564833, -1.206683, 1, 1, 1, 1, 1,
-0.5648714, 0.9218081, -1.923765, 1, 1, 1, 1, 1,
-0.5629802, -0.1259583, -1.754603, 0, 0, 1, 1, 1,
-0.5622024, -0.7598823, -1.396312, 1, 0, 0, 1, 1,
-0.5608296, -0.7075199, -3.171809, 1, 0, 0, 1, 1,
-0.5600121, -0.04118555, -0.9904882, 1, 0, 0, 1, 1,
-0.5585695, 0.8114541, 1.116342, 1, 0, 0, 1, 1,
-0.5560142, 1.058552, -0.2857516, 1, 0, 0, 1, 1,
-0.5555797, -0.9984592, -3.442871, 0, 0, 0, 1, 1,
-0.5508024, -0.9955096, -2.346316, 0, 0, 0, 1, 1,
-0.5502576, 1.521238, -0.7155279, 0, 0, 0, 1, 1,
-0.5495594, -0.4388268, -1.652072, 0, 0, 0, 1, 1,
-0.5480348, 0.8160595, -0.3496716, 0, 0, 0, 1, 1,
-0.5374854, -1.188587, -3.077419, 0, 0, 0, 1, 1,
-0.5370954, -0.01115006, -0.7082901, 0, 0, 0, 1, 1,
-0.5363014, -2.031374, -2.33294, 1, 1, 1, 1, 1,
-0.5341033, -0.3125618, -1.005051, 1, 1, 1, 1, 1,
-0.532145, 1.22031, -0.3801819, 1, 1, 1, 1, 1,
-0.5299979, -0.2174272, -3.179814, 1, 1, 1, 1, 1,
-0.5249639, 0.9979525, 0.6652293, 1, 1, 1, 1, 1,
-0.5225515, 0.02895452, -2.374176, 1, 1, 1, 1, 1,
-0.5222217, 0.2676847, 0.5114316, 1, 1, 1, 1, 1,
-0.5213558, -0.1178265, -1.672365, 1, 1, 1, 1, 1,
-0.5176592, -0.1957094, -2.17326, 1, 1, 1, 1, 1,
-0.5176435, 0.1717151, -2.83009, 1, 1, 1, 1, 1,
-0.5136638, -0.110364, -0.1820335, 1, 1, 1, 1, 1,
-0.5109086, 0.23042, -1.579932, 1, 1, 1, 1, 1,
-0.5102914, 0.9401578, 0.8497289, 1, 1, 1, 1, 1,
-0.5095607, 0.4838727, -0.2461656, 1, 1, 1, 1, 1,
-0.5061229, -0.04023623, -1.543093, 1, 1, 1, 1, 1,
-0.5058644, 0.9762781, -0.4200655, 0, 0, 1, 1, 1,
-0.5018395, 1.395713, -0.1216983, 1, 0, 0, 1, 1,
-0.5018079, -0.6365908, -1.842762, 1, 0, 0, 1, 1,
-0.5011687, 0.207732, -0.5857971, 1, 0, 0, 1, 1,
-0.4991769, -1.655756, -4.684046, 1, 0, 0, 1, 1,
-0.4987735, -1.373212, -2.838593, 1, 0, 0, 1, 1,
-0.4973644, -0.7595145, -2.629753, 0, 0, 0, 1, 1,
-0.4853065, -0.897432, -4.407895, 0, 0, 0, 1, 1,
-0.4848651, 1.73263, -1.120363, 0, 0, 0, 1, 1,
-0.484605, -0.1968349, -0.8223737, 0, 0, 0, 1, 1,
-0.4799752, -0.04615992, -3.283349, 0, 0, 0, 1, 1,
-0.479903, -0.5086254, -1.648254, 0, 0, 0, 1, 1,
-0.4703651, -1.145217, -2.682912, 0, 0, 0, 1, 1,
-0.4684838, -1.032487, -1.1702, 1, 1, 1, 1, 1,
-0.4671048, 1.274891, 0.7915007, 1, 1, 1, 1, 1,
-0.4670777, -0.1351813, -1.954482, 1, 1, 1, 1, 1,
-0.4615518, -1.689632, -3.627373, 1, 1, 1, 1, 1,
-0.4611965, -0.2887464, -0.6143739, 1, 1, 1, 1, 1,
-0.4551124, -1.223923, -1.942303, 1, 1, 1, 1, 1,
-0.4488877, -0.6468526, -2.525903, 1, 1, 1, 1, 1,
-0.4447996, -0.6979319, -4.216405, 1, 1, 1, 1, 1,
-0.4442194, 0.233648, -1.051007, 1, 1, 1, 1, 1,
-0.4392332, 0.5681672, -2.932584, 1, 1, 1, 1, 1,
-0.4368482, 0.1296384, 1.324331, 1, 1, 1, 1, 1,
-0.4279677, -0.447469, -2.497514, 1, 1, 1, 1, 1,
-0.4268497, -0.3306404, -2.510481, 1, 1, 1, 1, 1,
-0.4228782, 0.3462781, -1.299453, 1, 1, 1, 1, 1,
-0.4216065, 0.5019104, -1.049662, 1, 1, 1, 1, 1,
-0.4195168, 1.172492, -1.036076, 0, 0, 1, 1, 1,
-0.4183039, 1.011451, -0.3775073, 1, 0, 0, 1, 1,
-0.4181333, 0.169143, -1.687144, 1, 0, 0, 1, 1,
-0.4117151, 0.5970859, 0.6809317, 1, 0, 0, 1, 1,
-0.4090093, -0.3892787, -3.126301, 1, 0, 0, 1, 1,
-0.4065408, 0.7661902, 1.425145, 1, 0, 0, 1, 1,
-0.4058248, 0.6713773, -0.6081318, 0, 0, 0, 1, 1,
-0.4041882, 0.1457209, -0.9885285, 0, 0, 0, 1, 1,
-0.4023204, -1.807671, -4.742455, 0, 0, 0, 1, 1,
-0.4002032, -0.1293151, -2.110647, 0, 0, 0, 1, 1,
-0.399756, -1.044167, -2.910681, 0, 0, 0, 1, 1,
-0.3945784, 0.264381, -0.8463516, 0, 0, 0, 1, 1,
-0.3944764, 1.101202, -0.4711952, 0, 0, 0, 1, 1,
-0.3906396, -0.3065583, -1.362974, 1, 1, 1, 1, 1,
-0.3872349, 0.1286668, 0.03052693, 1, 1, 1, 1, 1,
-0.3846552, -1.964378, -2.772313, 1, 1, 1, 1, 1,
-0.383428, -1.046677, -1.988513, 1, 1, 1, 1, 1,
-0.3804893, -0.02347971, -2.138698, 1, 1, 1, 1, 1,
-0.3804814, 0.2252633, -0.5370098, 1, 1, 1, 1, 1,
-0.3791, 1.049811, 0.1377802, 1, 1, 1, 1, 1,
-0.3783162, -0.3540886, -3.210777, 1, 1, 1, 1, 1,
-0.3735424, -1.281214, -1.56397, 1, 1, 1, 1, 1,
-0.3701656, 0.2819402, -0.239162, 1, 1, 1, 1, 1,
-0.3697309, -0.1203514, -1.342935, 1, 1, 1, 1, 1,
-0.3608708, 0.89443, -0.1948435, 1, 1, 1, 1, 1,
-0.3606608, 0.66545, 0.9141375, 1, 1, 1, 1, 1,
-0.3603978, 0.3665422, -2.282647, 1, 1, 1, 1, 1,
-0.3573588, -0.7737058, -4.337286, 1, 1, 1, 1, 1,
-0.355615, -1.803327, -2.97378, 0, 0, 1, 1, 1,
-0.3554586, 0.3456488, 0.5106284, 1, 0, 0, 1, 1,
-0.3537612, 0.2599489, -2.726278, 1, 0, 0, 1, 1,
-0.3524126, 0.2249887, -0.5214081, 1, 0, 0, 1, 1,
-0.3367268, 0.4806925, 1.174845, 1, 0, 0, 1, 1,
-0.3260271, -0.5905735, -0.8983973, 1, 0, 0, 1, 1,
-0.3231921, 1.047982, -0.9438543, 0, 0, 0, 1, 1,
-0.3223748, -0.6129254, -1.99451, 0, 0, 0, 1, 1,
-0.3218954, 0.06703953, -1.989256, 0, 0, 0, 1, 1,
-0.3213017, -1.217294, -4.625535, 0, 0, 0, 1, 1,
-0.3211088, 0.02651338, -0.7218258, 0, 0, 0, 1, 1,
-0.3168559, -1.389171, -3.05083, 0, 0, 0, 1, 1,
-0.3162352, -0.9183168, -2.095089, 0, 0, 0, 1, 1,
-0.3087466, 0.9313301, -0.8177125, 1, 1, 1, 1, 1,
-0.306576, 0.6149796, -0.1080896, 1, 1, 1, 1, 1,
-0.3015189, 0.1543588, -2.489851, 1, 1, 1, 1, 1,
-0.3006079, 0.6466637, -1.864007, 1, 1, 1, 1, 1,
-0.2966198, 0.2951283, -1.61196, 1, 1, 1, 1, 1,
-0.2943671, 1.254882, 0.2137218, 1, 1, 1, 1, 1,
-0.2928864, -0.5112532, -2.776514, 1, 1, 1, 1, 1,
-0.2906406, -1.186376, -2.160488, 1, 1, 1, 1, 1,
-0.2882008, 1.983091, -0.6415942, 1, 1, 1, 1, 1,
-0.285255, 0.4581904, 0.4852553, 1, 1, 1, 1, 1,
-0.2851619, -0.9051231, -4.471493, 1, 1, 1, 1, 1,
-0.2821336, -0.6746672, -2.810176, 1, 1, 1, 1, 1,
-0.2794676, 0.5616466, -1.650584, 1, 1, 1, 1, 1,
-0.2769433, -0.5067835, -2.882004, 1, 1, 1, 1, 1,
-0.2713823, 0.2831726, 1.083067, 1, 1, 1, 1, 1,
-0.2707183, 0.7166371, 0.8661894, 0, 0, 1, 1, 1,
-0.2674299, 1.179003, -0.7581139, 1, 0, 0, 1, 1,
-0.2662649, 1.337656, 0.05301242, 1, 0, 0, 1, 1,
-0.2623731, -0.7240508, -1.514991, 1, 0, 0, 1, 1,
-0.2617115, 0.3113665, -0.6657348, 1, 0, 0, 1, 1,
-0.2581844, -1.113522, -3.76636, 1, 0, 0, 1, 1,
-0.254525, 0.1418891, -0.2376499, 0, 0, 0, 1, 1,
-0.2503756, -0.4090173, -4.418098, 0, 0, 0, 1, 1,
-0.2498014, -1.960175, -3.669811, 0, 0, 0, 1, 1,
-0.2455295, 0.3784951, -0.3816708, 0, 0, 0, 1, 1,
-0.24548, 2.031984, 0.1247845, 0, 0, 0, 1, 1,
-0.2453884, -0.330549, -2.604073, 0, 0, 0, 1, 1,
-0.2452041, -0.3617738, -2.726741, 0, 0, 0, 1, 1,
-0.239856, -0.5330309, -2.624851, 1, 1, 1, 1, 1,
-0.2360484, -1.764362, -1.561835, 1, 1, 1, 1, 1,
-0.2348952, 0.7791432, -1.687952, 1, 1, 1, 1, 1,
-0.2339069, 0.342855, -2.784595, 1, 1, 1, 1, 1,
-0.2331134, -0.8244092, -2.358275, 1, 1, 1, 1, 1,
-0.232799, 0.4809235, 0.947754, 1, 1, 1, 1, 1,
-0.2230159, -1.191971, -1.494455, 1, 1, 1, 1, 1,
-0.2215324, 1.57343, 0.259015, 1, 1, 1, 1, 1,
-0.2201359, 0.3748638, 1.58149, 1, 1, 1, 1, 1,
-0.2173169, 0.9534844, 0.1154811, 1, 1, 1, 1, 1,
-0.2161861, 0.03877165, -1.330409, 1, 1, 1, 1, 1,
-0.215184, -0.4115126, -2.512582, 1, 1, 1, 1, 1,
-0.2151022, -0.4132243, -1.537427, 1, 1, 1, 1, 1,
-0.2129205, -1.695799, -3.245102, 1, 1, 1, 1, 1,
-0.208458, 1.089894, -0.7011335, 1, 1, 1, 1, 1,
-0.207857, 0.3251793, 0.4717238, 0, 0, 1, 1, 1,
-0.2071644, -0.1421448, -1.913498, 1, 0, 0, 1, 1,
-0.2062073, -0.7574642, -3.02072, 1, 0, 0, 1, 1,
-0.2044345, 0.5359553, -0.01674007, 1, 0, 0, 1, 1,
-0.2001461, 0.06167381, -1.43451, 1, 0, 0, 1, 1,
-0.1864396, -2.121018, -2.099509, 1, 0, 0, 1, 1,
-0.1856926, -0.06257119, -2.873087, 0, 0, 0, 1, 1,
-0.1798194, -0.8871278, -4.801958, 0, 0, 0, 1, 1,
-0.1783935, -1.366369, -1.710152, 0, 0, 0, 1, 1,
-0.1783569, -0.002339618, -2.316242, 0, 0, 0, 1, 1,
-0.1754443, -1.095884, -2.326188, 0, 0, 0, 1, 1,
-0.1718678, 0.6394979, -1.865782, 0, 0, 0, 1, 1,
-0.168992, 0.7427654, 0.5366867, 0, 0, 0, 1, 1,
-0.1653765, 0.2000209, 0.3252085, 1, 1, 1, 1, 1,
-0.1632282, -0.3391224, -2.559351, 1, 1, 1, 1, 1,
-0.1605674, -0.4523058, -2.2722, 1, 1, 1, 1, 1,
-0.1590342, 0.1399437, -0.2901745, 1, 1, 1, 1, 1,
-0.1589294, 0.8853114, 0.348788, 1, 1, 1, 1, 1,
-0.1581918, -0.912027, -2.570365, 1, 1, 1, 1, 1,
-0.1554325, 1.267938, 0.4275748, 1, 1, 1, 1, 1,
-0.1550694, -0.1386697, -0.6198436, 1, 1, 1, 1, 1,
-0.1521619, -1.882686, -2.248182, 1, 1, 1, 1, 1,
-0.1479, 0.8755158, -0.1095529, 1, 1, 1, 1, 1,
-0.1450391, -0.5457221, -2.235661, 1, 1, 1, 1, 1,
-0.143016, -0.3956911, -2.88676, 1, 1, 1, 1, 1,
-0.1426295, 1.075848, -0.319647, 1, 1, 1, 1, 1,
-0.1406395, 0.9998008, 1.06528, 1, 1, 1, 1, 1,
-0.1402142, -0.7450462, -3.705315, 1, 1, 1, 1, 1,
-0.1401428, 1.401962, 0.7959405, 0, 0, 1, 1, 1,
-0.1379856, 0.2131232, -2.219394, 1, 0, 0, 1, 1,
-0.1299038, 2.299059, -0.05141126, 1, 0, 0, 1, 1,
-0.1255577, -1.425196, -3.641502, 1, 0, 0, 1, 1,
-0.1168281, -0.2500789, -4.082234, 1, 0, 0, 1, 1,
-0.1146823, 1.941345, -0.4837609, 1, 0, 0, 1, 1,
-0.1124347, 0.1910622, 0.1668461, 0, 0, 0, 1, 1,
-0.1112949, -0.7417076, -3.643216, 0, 0, 0, 1, 1,
-0.1102488, 0.2882662, -2.08553, 0, 0, 0, 1, 1,
-0.1093466, -0.8205357, -1.850357, 0, 0, 0, 1, 1,
-0.1051519, 0.8755684, -0.2159485, 0, 0, 0, 1, 1,
-0.1032987, 0.4983178, 1.855983, 0, 0, 0, 1, 1,
-0.1028764, 2.417828, 0.2727926, 0, 0, 0, 1, 1,
-0.09528765, -1.375164, -2.483892, 1, 1, 1, 1, 1,
-0.09092841, 0.1594959, -0.8136106, 1, 1, 1, 1, 1,
-0.08912751, -0.1149769, -3.992139, 1, 1, 1, 1, 1,
-0.08624076, 2.056678, -0.4724967, 1, 1, 1, 1, 1,
-0.08383683, -2.204432, -2.600599, 1, 1, 1, 1, 1,
-0.07844982, -1.039895, -2.347416, 1, 1, 1, 1, 1,
-0.07829272, 0.09143364, 0.02559688, 1, 1, 1, 1, 1,
-0.07669034, -0.1731167, -1.765847, 1, 1, 1, 1, 1,
-0.07598013, 1.191397, -0.2881825, 1, 1, 1, 1, 1,
-0.0756072, 0.2710263, 0.7734456, 1, 1, 1, 1, 1,
-0.07557587, -0.584295, -3.082688, 1, 1, 1, 1, 1,
-0.07384447, -0.6859081, -1.012661, 1, 1, 1, 1, 1,
-0.0679467, -0.1014089, -3.486598, 1, 1, 1, 1, 1,
-0.06694791, 0.9608194, 0.6104985, 1, 1, 1, 1, 1,
-0.06654599, -1.202633, -4.620434, 1, 1, 1, 1, 1,
-0.06492708, -0.8860074, -3.101986, 0, 0, 1, 1, 1,
-0.06381582, -1.461134, -1.989549, 1, 0, 0, 1, 1,
-0.06123121, 0.7018158, -0.9981682, 1, 0, 0, 1, 1,
-0.05726732, -0.2615975, -0.9514872, 1, 0, 0, 1, 1,
-0.0530676, 0.9171277, -0.3834709, 1, 0, 0, 1, 1,
-0.05143873, 0.8857945, 0.4248794, 1, 0, 0, 1, 1,
-0.05095342, -1.290047, -0.5830806, 0, 0, 0, 1, 1,
-0.04445599, 0.6569328, -0.3676045, 0, 0, 0, 1, 1,
-0.04381002, -0.3923865, -2.797798, 0, 0, 0, 1, 1,
-0.04305555, 0.0670957, -0.745334, 0, 0, 0, 1, 1,
-0.04163909, 1.231565, 0.4408478, 0, 0, 0, 1, 1,
-0.04136129, 0.6809946, 0.6482256, 0, 0, 0, 1, 1,
-0.0412848, -0.6579489, -4.307943, 0, 0, 0, 1, 1,
-0.03952907, 0.3650284, -1.13771, 1, 1, 1, 1, 1,
-0.03714406, -0.4944962, -2.675455, 1, 1, 1, 1, 1,
-0.03685784, -0.2872662, -2.342644, 1, 1, 1, 1, 1,
-0.02998934, -1.50215, -3.609524, 1, 1, 1, 1, 1,
-0.02701055, 0.3785652, -1.428959, 1, 1, 1, 1, 1,
-0.02667634, -1.481565, -2.372966, 1, 1, 1, 1, 1,
-0.0248558, -0.2806449, -3.143699, 1, 1, 1, 1, 1,
-0.02466776, 0.2278011, 0.3851593, 1, 1, 1, 1, 1,
-0.02462873, -1.440786, -3.120784, 1, 1, 1, 1, 1,
-0.02051842, -0.8776573, -3.1867, 1, 1, 1, 1, 1,
-0.01440637, 0.1910784, 0.3802357, 1, 1, 1, 1, 1,
-0.01302773, -0.4586936, -2.365997, 1, 1, 1, 1, 1,
-0.008643263, 0.7887149, -0.5127899, 1, 1, 1, 1, 1,
-0.006321653, 0.8499035, 2.26694, 1, 1, 1, 1, 1,
-0.003152775, -0.246193, -5.587214, 1, 1, 1, 1, 1,
0.003501046, -0.459178, 2.954991, 0, 0, 1, 1, 1,
0.006698887, -0.2790069, 3.992247, 1, 0, 0, 1, 1,
0.00947555, -1.003912, 3.212303, 1, 0, 0, 1, 1,
0.01562999, -1.52797, 3.591077, 1, 0, 0, 1, 1,
0.01802317, -0.1205032, 2.418423, 1, 0, 0, 1, 1,
0.01831365, 0.1217948, 1.500414, 1, 0, 0, 1, 1,
0.0189068, -0.02279544, 3.545745, 0, 0, 0, 1, 1,
0.02935603, 0.10995, -0.5859792, 0, 0, 0, 1, 1,
0.031248, -0.5264051, 2.807473, 0, 0, 0, 1, 1,
0.03213203, 0.1447224, -0.3816029, 0, 0, 0, 1, 1,
0.03308646, 1.207594, 2.415317, 0, 0, 0, 1, 1,
0.03453853, 0.3224914, -0.9256778, 0, 0, 0, 1, 1,
0.03504735, -1.461383, 2.109138, 0, 0, 0, 1, 1,
0.03535528, 0.03848616, 0.3940298, 1, 1, 1, 1, 1,
0.0367097, -1.967411, 2.553454, 1, 1, 1, 1, 1,
0.038966, -1.003271, 3.074187, 1, 1, 1, 1, 1,
0.04410726, -0.4212898, 5.362684, 1, 1, 1, 1, 1,
0.04450297, -1.872442, 3.512045, 1, 1, 1, 1, 1,
0.04550961, 0.5897167, 0.5381893, 1, 1, 1, 1, 1,
0.04714769, -0.6540658, 2.664951, 1, 1, 1, 1, 1,
0.04878305, 0.9210255, 1.246409, 1, 1, 1, 1, 1,
0.04931288, 0.5725471, -0.5987774, 1, 1, 1, 1, 1,
0.05133804, -0.8625507, 5.443888, 1, 1, 1, 1, 1,
0.05343969, 0.8111089, 0.1519167, 1, 1, 1, 1, 1,
0.0541202, 1.263776, -0.4201218, 1, 1, 1, 1, 1,
0.05499443, -0.5120422, 3.145155, 1, 1, 1, 1, 1,
0.05729558, -0.8490235, 1.952703, 1, 1, 1, 1, 1,
0.06943164, -0.6923736, 3.084918, 1, 1, 1, 1, 1,
0.07525048, 0.01996348, 1.579699, 0, 0, 1, 1, 1,
0.0764811, 0.8267128, -2.457879, 1, 0, 0, 1, 1,
0.07797577, 0.1107034, 2.282314, 1, 0, 0, 1, 1,
0.07876291, -0.6963773, 2.247178, 1, 0, 0, 1, 1,
0.07885361, 1.0293, 1.007009, 1, 0, 0, 1, 1,
0.084172, 1.457572, -0.6732135, 1, 0, 0, 1, 1,
0.08492756, -0.9813003, 2.450563, 0, 0, 0, 1, 1,
0.08515932, -0.714976, 2.374352, 0, 0, 0, 1, 1,
0.0910007, -0.0469847, 2.717284, 0, 0, 0, 1, 1,
0.0940957, -1.460506, 1.96798, 0, 0, 0, 1, 1,
0.09446036, -1.732898, 3.358588, 0, 0, 0, 1, 1,
0.09595248, -1.206973, 2.357056, 0, 0, 0, 1, 1,
0.09830891, -1.063625, 3.421177, 0, 0, 0, 1, 1,
0.09931526, -1.648081, 4.347472, 1, 1, 1, 1, 1,
0.1003096, -0.3176309, 2.78603, 1, 1, 1, 1, 1,
0.1008936, -1.317423, 3.10199, 1, 1, 1, 1, 1,
0.103041, 0.6878524, 0.5052947, 1, 1, 1, 1, 1,
0.103279, -0.9546029, 6.422416, 1, 1, 1, 1, 1,
0.1035879, -0.04379278, 4.981447, 1, 1, 1, 1, 1,
0.1036073, -1.035125, 1.54679, 1, 1, 1, 1, 1,
0.10364, -0.4153967, 2.445464, 1, 1, 1, 1, 1,
0.1036684, -0.2117186, 2.765383, 1, 1, 1, 1, 1,
0.1050026, -1.73749, 2.594928, 1, 1, 1, 1, 1,
0.1081605, 0.00909761, 1.871137, 1, 1, 1, 1, 1,
0.1094311, 0.9048848, -0.1238238, 1, 1, 1, 1, 1,
0.1133397, -1.052327, 3.265059, 1, 1, 1, 1, 1,
0.115151, -0.5097873, 4.267847, 1, 1, 1, 1, 1,
0.1163182, 0.663634, 0.6316722, 1, 1, 1, 1, 1,
0.1227218, 1.302192, 0.6337612, 0, 0, 1, 1, 1,
0.1232578, -1.431917, 3.798912, 1, 0, 0, 1, 1,
0.123386, 0.1128398, 1.309886, 1, 0, 0, 1, 1,
0.1250446, 1.531412, -1.67683, 1, 0, 0, 1, 1,
0.1279481, 1.446908, -0.3439437, 1, 0, 0, 1, 1,
0.1284447, -0.111287, 2.264192, 1, 0, 0, 1, 1,
0.1340433, -0.7450991, 1.598563, 0, 0, 0, 1, 1,
0.1356772, -1.58134, 2.904608, 0, 0, 0, 1, 1,
0.1359641, -1.138843, 1.928916, 0, 0, 0, 1, 1,
0.1378116, -1.163725, 2.979513, 0, 0, 0, 1, 1,
0.1379503, -0.9324272, 4.245004, 0, 0, 0, 1, 1,
0.1387457, 0.8800125, -1.846066, 0, 0, 0, 1, 1,
0.1402218, -0.4529955, 3.815996, 0, 0, 0, 1, 1,
0.1432313, 0.8190437, 0.2481229, 1, 1, 1, 1, 1,
0.1449344, -0.8777339, 2.3078, 1, 1, 1, 1, 1,
0.1452229, 0.09325938, 1.211861, 1, 1, 1, 1, 1,
0.1469725, 0.3304907, 2.985299, 1, 1, 1, 1, 1,
0.1519152, 0.3582687, 0.8163683, 1, 1, 1, 1, 1,
0.1533053, 0.5972487, -1.013729, 1, 1, 1, 1, 1,
0.1560141, 1.244397, 2.081954, 1, 1, 1, 1, 1,
0.1566249, 1.295907, -0.7962002, 1, 1, 1, 1, 1,
0.1581921, -1.21862, 1.838853, 1, 1, 1, 1, 1,
0.1599361, 0.3338995, 1.924239, 1, 1, 1, 1, 1,
0.1631688, -0.5661418, 2.816207, 1, 1, 1, 1, 1,
0.1652618, 1.324581, -1.009311, 1, 1, 1, 1, 1,
0.1670969, -0.301295, 1.062524, 1, 1, 1, 1, 1,
0.1692135, -0.924951, 3.048394, 1, 1, 1, 1, 1,
0.1721893, 2.435423, 1.065006, 1, 1, 1, 1, 1,
0.1722744, -1.125289, 1.878104, 0, 0, 1, 1, 1,
0.1753832, 1.027159, -0.09029328, 1, 0, 0, 1, 1,
0.1870686, -0.8712037, 3.591063, 1, 0, 0, 1, 1,
0.1894193, 1.400857, 0.8444741, 1, 0, 0, 1, 1,
0.199623, -2.067118, 3.570013, 1, 0, 0, 1, 1,
0.2004845, 0.09019345, 2.352227, 1, 0, 0, 1, 1,
0.2006727, 1.979103, -0.6670834, 0, 0, 0, 1, 1,
0.2064169, 0.01376658, 1.153839, 0, 0, 0, 1, 1,
0.212961, 0.8224946, 1.079944, 0, 0, 0, 1, 1,
0.2129889, -1.60038, 2.761834, 0, 0, 0, 1, 1,
0.213441, 0.5035825, -0.2373153, 0, 0, 0, 1, 1,
0.2163136, -0.4385289, 2.35734, 0, 0, 0, 1, 1,
0.2180663, -4.654282, 3.612128, 0, 0, 0, 1, 1,
0.2191402, -0.3998529, 4.146886, 1, 1, 1, 1, 1,
0.2221546, 1.378284, -0.05092733, 1, 1, 1, 1, 1,
0.2265067, 0.2945304, 2.671878, 1, 1, 1, 1, 1,
0.230067, 0.2877716, 0.8939982, 1, 1, 1, 1, 1,
0.2334788, -0.7191887, 4.159422, 1, 1, 1, 1, 1,
0.241338, -0.1836604, 1.754699, 1, 1, 1, 1, 1,
0.2415102, -0.8473343, 3.303107, 1, 1, 1, 1, 1,
0.2439819, 0.2986208, 1.015344, 1, 1, 1, 1, 1,
0.2448884, -0.3144145, 0.87168, 1, 1, 1, 1, 1,
0.2499046, 3.042499, 1.131405, 1, 1, 1, 1, 1,
0.2501386, 1.316158, -0.05925992, 1, 1, 1, 1, 1,
0.2510362, 0.1855422, 1.539719, 1, 1, 1, 1, 1,
0.2521463, 0.8199785, -0.2391621, 1, 1, 1, 1, 1,
0.2521937, 0.04690395, 1.364151, 1, 1, 1, 1, 1,
0.2595838, -1.286513, 3.508929, 1, 1, 1, 1, 1,
0.263689, -0.2750987, 2.022596, 0, 0, 1, 1, 1,
0.2684029, -1.114871, 2.627056, 1, 0, 0, 1, 1,
0.2713279, 2.087066, 0.1236703, 1, 0, 0, 1, 1,
0.27894, -0.975476, 3.568068, 1, 0, 0, 1, 1,
0.2804199, -0.8709366, 2.169229, 1, 0, 0, 1, 1,
0.2825692, -0.9611794, 2.741911, 1, 0, 0, 1, 1,
0.2854247, 0.5772071, -0.1230998, 0, 0, 0, 1, 1,
0.2882839, 1.121173, 1.652075, 0, 0, 0, 1, 1,
0.2991155, -2.758655, 4.06766, 0, 0, 0, 1, 1,
0.3012103, -0.6105576, 4.20965, 0, 0, 0, 1, 1,
0.3036422, 1.434035, 0.319481, 0, 0, 0, 1, 1,
0.3059853, 0.104921, -0.1129124, 0, 0, 0, 1, 1,
0.3101114, 0.8593145, 0.8036613, 0, 0, 0, 1, 1,
0.3111093, 0.1078745, 0.2385425, 1, 1, 1, 1, 1,
0.3248706, -0.7792237, 3.366644, 1, 1, 1, 1, 1,
0.3281028, -0.139551, 0.6303136, 1, 1, 1, 1, 1,
0.3281392, 0.4450425, -0.6827149, 1, 1, 1, 1, 1,
0.3323476, 2.264501, 1.509772, 1, 1, 1, 1, 1,
0.3368236, 1.466619, -0.4587592, 1, 1, 1, 1, 1,
0.3400088, -2.359697, 3.565825, 1, 1, 1, 1, 1,
0.3409233, 2.269559, 0.4542518, 1, 1, 1, 1, 1,
0.3489026, 0.7081743, -0.450577, 1, 1, 1, 1, 1,
0.3530587, 0.7480715, -0.4864561, 1, 1, 1, 1, 1,
0.365114, -0.05082595, 0.3904563, 1, 1, 1, 1, 1,
0.3708325, 1.021174, 1.338857, 1, 1, 1, 1, 1,
0.3721606, -0.8118032, 3.904575, 1, 1, 1, 1, 1,
0.3758745, -0.8652331, 3.643182, 1, 1, 1, 1, 1,
0.376859, 0.5303673, 0.9390904, 1, 1, 1, 1, 1,
0.3798776, -0.223768, 1.632294, 0, 0, 1, 1, 1,
0.3810897, 0.2298165, 1.403243, 1, 0, 0, 1, 1,
0.3829274, -0.1784962, 2.087647, 1, 0, 0, 1, 1,
0.3904257, 0.5859405, 0.672776, 1, 0, 0, 1, 1,
0.3921762, 0.2624383, 1.225942, 1, 0, 0, 1, 1,
0.3947901, -0.179664, 1.187707, 1, 0, 0, 1, 1,
0.3957509, -0.3788735, 3.61606, 0, 0, 0, 1, 1,
0.3976127, 0.747686, 1.291257, 0, 0, 0, 1, 1,
0.3990207, -0.6188924, 2.319412, 0, 0, 0, 1, 1,
0.400551, 2.225917, -0.1252484, 0, 0, 0, 1, 1,
0.4027473, 0.4843864, 0.6522355, 0, 0, 0, 1, 1,
0.4062853, -1.580309, 3.469934, 0, 0, 0, 1, 1,
0.4071201, -1.387115, 3.376315, 0, 0, 0, 1, 1,
0.4153065, 1.4441, -1.001337, 1, 1, 1, 1, 1,
0.4161351, 0.8033479, -1.086937, 1, 1, 1, 1, 1,
0.4178796, 0.04096608, 1.980816, 1, 1, 1, 1, 1,
0.4179875, -1.204718, 4.040513, 1, 1, 1, 1, 1,
0.41956, -0.003458416, 2.402744, 1, 1, 1, 1, 1,
0.4297914, 1.909693, -0.09903879, 1, 1, 1, 1, 1,
0.4331629, 0.7845417, 1.320437, 1, 1, 1, 1, 1,
0.4332062, -1.273594, 3.190162, 1, 1, 1, 1, 1,
0.4345105, 0.7940883, -0.08616526, 1, 1, 1, 1, 1,
0.4419967, -1.702155, 2.653929, 1, 1, 1, 1, 1,
0.4461274, -0.4305847, 3.346358, 1, 1, 1, 1, 1,
0.4489368, 0.5001835, 1.365072, 1, 1, 1, 1, 1,
0.4501371, 0.226397, 1.343715, 1, 1, 1, 1, 1,
0.4538065, -0.3782298, 2.262599, 1, 1, 1, 1, 1,
0.4611351, -0.003546695, 2.123723, 1, 1, 1, 1, 1,
0.4646901, -0.5659859, 2.383184, 0, 0, 1, 1, 1,
0.4649138, 0.01313516, 0.8075011, 1, 0, 0, 1, 1,
0.466009, -0.6984996, 2.694304, 1, 0, 0, 1, 1,
0.4693703, -0.9447455, 1.552024, 1, 0, 0, 1, 1,
0.4729904, -0.04324963, 1.401994, 1, 0, 0, 1, 1,
0.4793559, 1.51444, 2.434475, 1, 0, 0, 1, 1,
0.4800732, 0.3954325, 1.780997, 0, 0, 0, 1, 1,
0.4859819, -0.3335741, 2.361422, 0, 0, 0, 1, 1,
0.489919, -0.7771722, 2.145881, 0, 0, 0, 1, 1,
0.4918721, -0.5845172, 5.114907, 0, 0, 0, 1, 1,
0.4951615, -0.4036327, 3.141419, 0, 0, 0, 1, 1,
0.4977433, 1.302903, -0.1382787, 0, 0, 0, 1, 1,
0.5021729, 0.783855, -0.001805532, 0, 0, 0, 1, 1,
0.5024742, 0.5883574, -0.3436661, 1, 1, 1, 1, 1,
0.502956, -0.3894185, 2.416749, 1, 1, 1, 1, 1,
0.5040052, 0.3978567, 0.2233864, 1, 1, 1, 1, 1,
0.508839, 0.03583938, 1.55006, 1, 1, 1, 1, 1,
0.5100188, -0.3443842, 4.507145, 1, 1, 1, 1, 1,
0.5147707, -0.2371221, 2.66776, 1, 1, 1, 1, 1,
0.5164312, 1.982801, -0.7875611, 1, 1, 1, 1, 1,
0.5181272, -0.05676805, 1.193859, 1, 1, 1, 1, 1,
0.5187278, -0.2458634, 2.744879, 1, 1, 1, 1, 1,
0.5203137, 0.912403, 0.9137663, 1, 1, 1, 1, 1,
0.5219623, -0.2690608, 1.89708, 1, 1, 1, 1, 1,
0.5244485, -0.7166721, 0.8757908, 1, 1, 1, 1, 1,
0.5263589, -0.1253274, 1.691526, 1, 1, 1, 1, 1,
0.5319674, 1.166034, 0.04054271, 1, 1, 1, 1, 1,
0.5373147, 1.102125, 0.3527977, 1, 1, 1, 1, 1,
0.5378625, 0.4688695, 1.922342, 0, 0, 1, 1, 1,
0.5380881, -1.161512, 3.414369, 1, 0, 0, 1, 1,
0.5434087, 0.06346833, -0.1561115, 1, 0, 0, 1, 1,
0.5473145, 1.13477, 0.4378256, 1, 0, 0, 1, 1,
0.547515, -0.313121, 0.4504591, 1, 0, 0, 1, 1,
0.5517694, -1.471643, 3.384893, 1, 0, 0, 1, 1,
0.5519435, -1.572477, 2.505134, 0, 0, 0, 1, 1,
0.5520223, -0.5686119, 1.086222, 0, 0, 0, 1, 1,
0.555639, 1.347959, 0.6039637, 0, 0, 0, 1, 1,
0.558275, -0.9675649, 1.625823, 0, 0, 0, 1, 1,
0.5586042, -1.565529, 3.725327, 0, 0, 0, 1, 1,
0.5597312, -0.2127224, 1.717158, 0, 0, 0, 1, 1,
0.5609827, 0.8210164, 0.3715386, 0, 0, 0, 1, 1,
0.562347, 0.3924924, 0.3041001, 1, 1, 1, 1, 1,
0.572893, -2.974489, 2.726276, 1, 1, 1, 1, 1,
0.5806486, 0.7454044, 0.4921091, 1, 1, 1, 1, 1,
0.5820037, -1.584539, 3.491288, 1, 1, 1, 1, 1,
0.5835333, -0.7084216, 1.800197, 1, 1, 1, 1, 1,
0.5873278, 0.7438378, 1.065654, 1, 1, 1, 1, 1,
0.5874045, 0.5314648, 1.022191, 1, 1, 1, 1, 1,
0.5902154, 0.4626843, 1.236007, 1, 1, 1, 1, 1,
0.591407, -1.528175, 3.984101, 1, 1, 1, 1, 1,
0.5959769, -0.1566031, 1.049312, 1, 1, 1, 1, 1,
0.5996585, 0.4127027, 1.262102, 1, 1, 1, 1, 1,
0.6026133, 0.05573691, 0.3704453, 1, 1, 1, 1, 1,
0.6107264, -0.08869404, 0.1378286, 1, 1, 1, 1, 1,
0.6117679, 0.03984161, 1.834836, 1, 1, 1, 1, 1,
0.616879, 1.043427, 1.164739, 1, 1, 1, 1, 1,
0.6181263, -0.7564778, 2.079963, 0, 0, 1, 1, 1,
0.6198973, 0.340232, 1.493772, 1, 0, 0, 1, 1,
0.6217925, 0.759483, -1.803659, 1, 0, 0, 1, 1,
0.6255617, -0.7619967, 2.121183, 1, 0, 0, 1, 1,
0.6309263, -1.428066, 2.861666, 1, 0, 0, 1, 1,
0.6334844, 0.2651204, 1.666691, 1, 0, 0, 1, 1,
0.642851, 0.04016724, 1.751051, 0, 0, 0, 1, 1,
0.6492857, 0.06986865, 0.4952775, 0, 0, 0, 1, 1,
0.6504865, 0.06945728, 0.9263893, 0, 0, 0, 1, 1,
0.6509455, 0.5058815, 1.364379, 0, 0, 0, 1, 1,
0.6532187, 0.3321101, 2.249297, 0, 0, 0, 1, 1,
0.6593758, -1.178142, 2.54747, 0, 0, 0, 1, 1,
0.6600457, -0.6389974, 4.637894, 0, 0, 0, 1, 1,
0.6629754, 0.1900366, 0.9162803, 1, 1, 1, 1, 1,
0.6629791, 0.3741138, 1.767194, 1, 1, 1, 1, 1,
0.6656651, -1.995768, 3.935397, 1, 1, 1, 1, 1,
0.666062, -0.830949, 3.201595, 1, 1, 1, 1, 1,
0.6678131, -0.07257961, 2.445534, 1, 1, 1, 1, 1,
0.6719473, -0.9123306, 2.748144, 1, 1, 1, 1, 1,
0.6748668, -0.3348978, 1.992455, 1, 1, 1, 1, 1,
0.6749628, 1.279556, 1.012287, 1, 1, 1, 1, 1,
0.6794084, -1.907553, 1.419798, 1, 1, 1, 1, 1,
0.6806296, 0.2272861, 0.8538818, 1, 1, 1, 1, 1,
0.682797, -0.323367, 1.944992, 1, 1, 1, 1, 1,
0.6844786, 0.9729447, -0.07389353, 1, 1, 1, 1, 1,
0.6846033, -0.8070818, 3.145143, 1, 1, 1, 1, 1,
0.6859076, -0.2868694, 4.386351, 1, 1, 1, 1, 1,
0.690596, -1.231554, 1.27815, 1, 1, 1, 1, 1,
0.7006726, -0.6414109, 3.328639, 0, 0, 1, 1, 1,
0.7013681, -0.3395172, 3.65086, 1, 0, 0, 1, 1,
0.7050999, 0.5698115, 1.471107, 1, 0, 0, 1, 1,
0.7064551, -0.4914743, 2.243333, 1, 0, 0, 1, 1,
0.7064629, -0.1437173, 1.003032, 1, 0, 0, 1, 1,
0.7067275, -1.685798, 1.742348, 1, 0, 0, 1, 1,
0.7074127, -1.042328, 3.472038, 0, 0, 0, 1, 1,
0.7125607, 0.4991723, -0.1582126, 0, 0, 0, 1, 1,
0.7134887, 0.2470807, 0.6516652, 0, 0, 0, 1, 1,
0.714149, 1.236619, 0.053579, 0, 0, 0, 1, 1,
0.7193601, -0.02094579, 0.6419767, 0, 0, 0, 1, 1,
0.7219938, 0.3155511, 2.088676, 0, 0, 0, 1, 1,
0.7241186, 0.589107, 0.4781165, 0, 0, 0, 1, 1,
0.7241743, -0.2698321, 1.549239, 1, 1, 1, 1, 1,
0.7242355, -0.3709476, 1.653985, 1, 1, 1, 1, 1,
0.7348129, 1.191985, 0.2957492, 1, 1, 1, 1, 1,
0.7371862, -0.2839606, 4.823514, 1, 1, 1, 1, 1,
0.740724, -0.1615365, 2.798803, 1, 1, 1, 1, 1,
0.7442341, 0.518183, 1.735865, 1, 1, 1, 1, 1,
0.7523363, -0.4687917, 2.749605, 1, 1, 1, 1, 1,
0.7525042, -2.247535, 2.389256, 1, 1, 1, 1, 1,
0.7545452, 0.6809153, 1.272268, 1, 1, 1, 1, 1,
0.7603353, 0.4992436, 0.6835477, 1, 1, 1, 1, 1,
0.7664878, 0.5553209, 1.128081, 1, 1, 1, 1, 1,
0.7693856, -1.095549, 3.106922, 1, 1, 1, 1, 1,
0.7706615, 0.3988253, -0.5251837, 1, 1, 1, 1, 1,
0.7708665, 0.9573305, 1.420114, 1, 1, 1, 1, 1,
0.7746825, -0.6310312, 2.216133, 1, 1, 1, 1, 1,
0.7794538, 1.053574, 1.359531, 0, 0, 1, 1, 1,
0.7798895, 0.8133914, -0.7882878, 1, 0, 0, 1, 1,
0.7810244, -0.9953848, 3.667267, 1, 0, 0, 1, 1,
0.7848052, 0.3211133, 0.5669869, 1, 0, 0, 1, 1,
0.7971148, -0.6330181, 3.235182, 1, 0, 0, 1, 1,
0.8014838, 0.6060358, 2.042415, 1, 0, 0, 1, 1,
0.8019494, 1.306088, 0.7832081, 0, 0, 0, 1, 1,
0.802806, -2.106105, 3.044231, 0, 0, 0, 1, 1,
0.8030149, -0.3350531, 1.642946, 0, 0, 0, 1, 1,
0.8042859, -1.176526, 0.636919, 0, 0, 0, 1, 1,
0.8060369, -0.8431358, 1.843984, 0, 0, 0, 1, 1,
0.8106574, -0.2226852, 1.382251, 0, 0, 0, 1, 1,
0.8163697, 0.67488, 1.64225, 0, 0, 0, 1, 1,
0.8168435, 0.9227115, 0.9954906, 1, 1, 1, 1, 1,
0.8173718, -0.8217264, 1.54309, 1, 1, 1, 1, 1,
0.8274094, 0.6221382, 0.5993611, 1, 1, 1, 1, 1,
0.8300117, -0.6302725, 1.00635, 1, 1, 1, 1, 1,
0.8305167, 1.168523, 1.774005, 1, 1, 1, 1, 1,
0.8310739, -1.526195, 3.655176, 1, 1, 1, 1, 1,
0.8331121, -0.827902, 2.567758, 1, 1, 1, 1, 1,
0.8331441, 0.4870026, -0.09671907, 1, 1, 1, 1, 1,
0.839595, 0.3147368, 0.4320685, 1, 1, 1, 1, 1,
0.8405996, -0.9393108, 1.457738, 1, 1, 1, 1, 1,
0.8409177, 0.3132577, 1.566704, 1, 1, 1, 1, 1,
0.8424057, 0.6617806, 0.1757554, 1, 1, 1, 1, 1,
0.8447943, -0.3587012, 1.68558, 1, 1, 1, 1, 1,
0.8635086, 1.053654, 0.4893026, 1, 1, 1, 1, 1,
0.8644575, 0.7910913, 0.85055, 1, 1, 1, 1, 1,
0.8657649, -0.6604106, 2.36556, 0, 0, 1, 1, 1,
0.8683574, -0.2156291, -0.8417858, 1, 0, 0, 1, 1,
0.8690996, 1.075893, 0.4518947, 1, 0, 0, 1, 1,
0.8722624, -0.9228204, 3.321495, 1, 0, 0, 1, 1,
0.8772729, -0.6678542, 2.647488, 1, 0, 0, 1, 1,
0.8773618, -1.839774, 1.385018, 1, 0, 0, 1, 1,
0.8800665, -1.865228, 2.605704, 0, 0, 0, 1, 1,
0.8813604, -0.4647183, 1.934992, 0, 0, 0, 1, 1,
0.8838411, 1.974189, 1.13983, 0, 0, 0, 1, 1,
0.8900406, 1.802865, 0.8203573, 0, 0, 0, 1, 1,
0.8925713, -1.450275, 5.567298, 0, 0, 0, 1, 1,
0.8944083, -1.1205, 2.960419, 0, 0, 0, 1, 1,
0.901229, -0.929256, 3.63728, 0, 0, 0, 1, 1,
0.9054617, 0.112284, 1.014703, 1, 1, 1, 1, 1,
0.9088697, 0.4091249, 1.075736, 1, 1, 1, 1, 1,
0.9103406, 0.1593692, 1.899113, 1, 1, 1, 1, 1,
0.9106711, -1.846046, 2.29269, 1, 1, 1, 1, 1,
0.9244496, -0.3074439, 1.945106, 1, 1, 1, 1, 1,
0.9252244, -0.8102735, 2.368633, 1, 1, 1, 1, 1,
0.9345618, -0.006706442, 2.554538, 1, 1, 1, 1, 1,
0.9376994, 0.6719769, 0.05879445, 1, 1, 1, 1, 1,
0.9408954, -1.135992, 1.919558, 1, 1, 1, 1, 1,
0.9509132, 0.6161398, 2.149244, 1, 1, 1, 1, 1,
0.9538121, -1.378695, 3.104448, 1, 1, 1, 1, 1,
0.9570483, -0.08595994, 0.8894455, 1, 1, 1, 1, 1,
0.9575217, -1.527222, 2.750032, 1, 1, 1, 1, 1,
0.9626629, -0.8166402, 2.580875, 1, 1, 1, 1, 1,
0.9665093, 0.3395565, 0.8512022, 1, 1, 1, 1, 1,
0.9685653, 1.31363, 0.8552894, 0, 0, 1, 1, 1,
0.9702027, -0.9147916, 1.780119, 1, 0, 0, 1, 1,
0.9718816, -0.3015222, 0.5330234, 1, 0, 0, 1, 1,
0.9748501, -0.222315, 2.437402, 1, 0, 0, 1, 1,
0.976412, 1.42592, -0.02430142, 1, 0, 0, 1, 1,
0.9825823, -1.951856, 3.634985, 1, 0, 0, 1, 1,
0.983252, -2.166578, 2.217681, 0, 0, 0, 1, 1,
0.9869165, -1.910533, 2.438643, 0, 0, 0, 1, 1,
0.9890438, 0.2342656, 1.918805, 0, 0, 0, 1, 1,
0.9920034, -0.549884, 1.651877, 0, 0, 0, 1, 1,
0.9967563, -1.215304, 0.0710633, 0, 0, 0, 1, 1,
0.9985338, -0.1392387, 1.459648, 0, 0, 0, 1, 1,
1.004773, -0.1808478, 1.679142, 0, 0, 0, 1, 1,
1.010537, -1.109884, 2.917917, 1, 1, 1, 1, 1,
1.013044, 0.7381682, -0.1587678, 1, 1, 1, 1, 1,
1.016038, -0.2452604, 2.638127, 1, 1, 1, 1, 1,
1.017257, 1.300068, 0.8413672, 1, 1, 1, 1, 1,
1.020691, 0.7139788, -1.645144, 1, 1, 1, 1, 1,
1.026836, 0.519033, 0.9047219, 1, 1, 1, 1, 1,
1.038991, -2.136125, 1.681605, 1, 1, 1, 1, 1,
1.042722, 1.371497, 0.3805924, 1, 1, 1, 1, 1,
1.045469, 0.2006238, 0.416337, 1, 1, 1, 1, 1,
1.048882, -0.9603292, 1.082237, 1, 1, 1, 1, 1,
1.051358, 1.041536, 1.678779, 1, 1, 1, 1, 1,
1.056996, 1.319067, 3.098659, 1, 1, 1, 1, 1,
1.063889, -0.292143, 1.850706, 1, 1, 1, 1, 1,
1.065022, 0.9593295, -0.205092, 1, 1, 1, 1, 1,
1.065555, -0.1922923, 1.567635, 1, 1, 1, 1, 1,
1.070041, -0.002361869, 0.9582244, 0, 0, 1, 1, 1,
1.075915, 0.294419, 0.7843056, 1, 0, 0, 1, 1,
1.089256, 0.2570496, -0.5357075, 1, 0, 0, 1, 1,
1.090996, -1.297509, 3.817563, 1, 0, 0, 1, 1,
1.097091, -0.1711694, 3.138419, 1, 0, 0, 1, 1,
1.113871, -0.3179722, 1.585996, 1, 0, 0, 1, 1,
1.115166, -0.3681149, 2.991755, 0, 0, 0, 1, 1,
1.119182, 0.4955452, 2.191131, 0, 0, 0, 1, 1,
1.134242, 1.58366, 1.094594, 0, 0, 0, 1, 1,
1.135408, 0.7258183, 1.286436, 0, 0, 0, 1, 1,
1.162653, -0.1555871, 2.12428, 0, 0, 0, 1, 1,
1.164968, 1.562958, 2.614127, 0, 0, 0, 1, 1,
1.171672, 0.5479957, 1.58561, 0, 0, 0, 1, 1,
1.17387, 1.7974, -1.034657, 1, 1, 1, 1, 1,
1.175304, 0.8573257, 0.8508804, 1, 1, 1, 1, 1,
1.180838, 0.2489148, 2.483703, 1, 1, 1, 1, 1,
1.186011, 1.582033, -0.3177689, 1, 1, 1, 1, 1,
1.19112, 2.44515, 2.537239, 1, 1, 1, 1, 1,
1.197236, 0.1054342, -0.6209908, 1, 1, 1, 1, 1,
1.197242, -0.1526115, 2.427308, 1, 1, 1, 1, 1,
1.203299, -0.2491796, 1.494867, 1, 1, 1, 1, 1,
1.203809, -1.025842, 3.026725, 1, 1, 1, 1, 1,
1.206102, 0.7271801, 0.4115917, 1, 1, 1, 1, 1,
1.206846, 0.8793949, 0.6497522, 1, 1, 1, 1, 1,
1.208847, -0.5532585, 3.243001, 1, 1, 1, 1, 1,
1.220198, -0.961983, 4.187588, 1, 1, 1, 1, 1,
1.224038, 0.6993485, 0.3477079, 1, 1, 1, 1, 1,
1.224615, -0.4658792, 0.001301705, 1, 1, 1, 1, 1,
1.228798, 0.2478666, 1.702981, 0, 0, 1, 1, 1,
1.235777, 0.4138005, 0.8856367, 1, 0, 0, 1, 1,
1.237277, 0.03709519, 1.607365, 1, 0, 0, 1, 1,
1.239058, 0.2023686, 2.550311, 1, 0, 0, 1, 1,
1.241111, -0.4474355, 0.8709658, 1, 0, 0, 1, 1,
1.245101, 1.749433, -1.097536, 1, 0, 0, 1, 1,
1.247934, 0.930945, 0.01297231, 0, 0, 0, 1, 1,
1.264989, 0.05733249, 1.169853, 0, 0, 0, 1, 1,
1.271909, -1.428311, 2.672183, 0, 0, 0, 1, 1,
1.284825, 0.9230252, 0.08054966, 0, 0, 0, 1, 1,
1.300437, -0.8270119, 2.079107, 0, 0, 0, 1, 1,
1.308069, -0.05238861, 2.152003, 0, 0, 0, 1, 1,
1.343466, -0.6479056, 1.371049, 0, 0, 0, 1, 1,
1.346726, -0.6151482, 0.80603, 1, 1, 1, 1, 1,
1.348584, 1.079255, 1.667665, 1, 1, 1, 1, 1,
1.350296, 0.6844323, 2.145698, 1, 1, 1, 1, 1,
1.35481, -0.1732783, 0.7887825, 1, 1, 1, 1, 1,
1.362802, 0.226052, 2.508705, 1, 1, 1, 1, 1,
1.364575, -0.9219521, 1.301211, 1, 1, 1, 1, 1,
1.366118, 0.7880847, -0.8031415, 1, 1, 1, 1, 1,
1.374354, 0.1183581, 1.878089, 1, 1, 1, 1, 1,
1.383476, 0.2634229, 2.544439, 1, 1, 1, 1, 1,
1.387146, -0.1603897, 2.204379, 1, 1, 1, 1, 1,
1.394979, -0.1154325, -0.06316441, 1, 1, 1, 1, 1,
1.404209, 1.516984, 2.515724, 1, 1, 1, 1, 1,
1.414812, 0.1118563, 1.098361, 1, 1, 1, 1, 1,
1.415358, -1.339541, 2.255616, 1, 1, 1, 1, 1,
1.416193, -1.188483, 2.018253, 1, 1, 1, 1, 1,
1.422746, -1.550627, 2.654001, 0, 0, 1, 1, 1,
1.429722, 1.213863, 0.6947663, 1, 0, 0, 1, 1,
1.438118, 0.3905223, 0.05188537, 1, 0, 0, 1, 1,
1.456626, 0.8100522, 1.764202, 1, 0, 0, 1, 1,
1.465231, -0.4007786, 1.803026, 1, 0, 0, 1, 1,
1.471984, -0.8065091, 3.303747, 1, 0, 0, 1, 1,
1.475881, -0.7980428, 1.298296, 0, 0, 0, 1, 1,
1.483873, -0.2864393, 1.091047, 0, 0, 0, 1, 1,
1.486907, -0.4988665, 1.394452, 0, 0, 0, 1, 1,
1.494571, -0.4597844, 2.177875, 0, 0, 0, 1, 1,
1.524261, -0.744762, 2.71982, 0, 0, 0, 1, 1,
1.541141, 1.189138, 0.3565314, 0, 0, 0, 1, 1,
1.544531, 1.566485, 0.3181552, 0, 0, 0, 1, 1,
1.549346, -0.4233265, 2.787683, 1, 1, 1, 1, 1,
1.563001, -1.329952, -0.2504238, 1, 1, 1, 1, 1,
1.564287, 1.25185, 0.0867843, 1, 1, 1, 1, 1,
1.574414, -0.7633647, 2.510839, 1, 1, 1, 1, 1,
1.575455, -0.3968006, 0.7579073, 1, 1, 1, 1, 1,
1.588847, -1.186962, 1.116834, 1, 1, 1, 1, 1,
1.5976, -0.5797521, 1.662501, 1, 1, 1, 1, 1,
1.602595, -1.199525, 3.158335, 1, 1, 1, 1, 1,
1.618749, -1.01272, 1.990269, 1, 1, 1, 1, 1,
1.624503, -1.051289, 0.8372971, 1, 1, 1, 1, 1,
1.627551, 3.047358, -0.3731931, 1, 1, 1, 1, 1,
1.628153, -0.7537472, 2.948135, 1, 1, 1, 1, 1,
1.633976, -0.4370652, 1.882102, 1, 1, 1, 1, 1,
1.634978, -0.4379562, 2.052232, 1, 1, 1, 1, 1,
1.638688, 1.006497, 0.853672, 1, 1, 1, 1, 1,
1.639038, -0.1425157, -0.01434851, 0, 0, 1, 1, 1,
1.641612, 0.1371032, 1.818364, 1, 0, 0, 1, 1,
1.647101, 0.5794697, 1.227103, 1, 0, 0, 1, 1,
1.651328, 1.583175, 2.695091, 1, 0, 0, 1, 1,
1.659818, 0.7692162, 0.3219929, 1, 0, 0, 1, 1,
1.692427, 0.8933036, -0.4098538, 1, 0, 0, 1, 1,
1.704402, -1.250516, 3.274346, 0, 0, 0, 1, 1,
1.749662, 1.535636, 0.6297986, 0, 0, 0, 1, 1,
1.756607, -0.8553523, 2.22066, 0, 0, 0, 1, 1,
1.773805, -0.8644367, 0.04176628, 0, 0, 0, 1, 1,
1.791653, -1.329965, 3.909482, 0, 0, 0, 1, 1,
1.803136, 0.2177396, 1.563574, 0, 0, 0, 1, 1,
1.806372, 0.1936968, 1.59837, 0, 0, 0, 1, 1,
1.8066, -0.1241563, 1.243362, 1, 1, 1, 1, 1,
1.823552, -1.274137, 2.917832, 1, 1, 1, 1, 1,
1.851669, -0.7265192, 0.9854694, 1, 1, 1, 1, 1,
1.855521, -1.93842, 0.9999213, 1, 1, 1, 1, 1,
1.856527, -0.2950547, 1.111365, 1, 1, 1, 1, 1,
1.868541, -1.202175, 0.9367312, 1, 1, 1, 1, 1,
1.884267, -0.6599061, 3.428675, 1, 1, 1, 1, 1,
1.885225, -0.2092049, 1.394422, 1, 1, 1, 1, 1,
1.885794, 1.190694, -0.5910539, 1, 1, 1, 1, 1,
1.926885, -0.5301761, 0.5943962, 1, 1, 1, 1, 1,
1.928881, 0.2883135, 3.083962, 1, 1, 1, 1, 1,
1.981583, 0.9059746, 1.544853, 1, 1, 1, 1, 1,
1.994459, 0.2784722, 1.216301, 1, 1, 1, 1, 1,
2.00136, -0.406557, 2.359859, 1, 1, 1, 1, 1,
2.024378, 0.4705719, 0.6264096, 1, 1, 1, 1, 1,
2.034545, 0.8273231, 1.767637, 0, 0, 1, 1, 1,
2.085414, 0.5361214, 1.011934, 1, 0, 0, 1, 1,
2.126415, -0.107606, 1.810756, 1, 0, 0, 1, 1,
2.141377, 0.3771387, 0.6307029, 1, 0, 0, 1, 1,
2.164901, 0.4511445, 0.1868456, 1, 0, 0, 1, 1,
2.176995, -0.3015277, 1.51477, 1, 0, 0, 1, 1,
2.186955, -0.4932832, 1.889844, 0, 0, 0, 1, 1,
2.194531, -0.7950497, 1.545466, 0, 0, 0, 1, 1,
2.196543, 0.2724, 1.590268, 0, 0, 0, 1, 1,
2.322556, 0.3825184, 2.383727, 0, 0, 0, 1, 1,
2.337148, -0.4754806, 0.5310568, 0, 0, 0, 1, 1,
2.378961, 0.1005358, 1.904169, 0, 0, 0, 1, 1,
2.417255, -0.7272723, 2.093985, 0, 0, 0, 1, 1,
2.567497, -0.5298417, 2.161904, 1, 1, 1, 1, 1,
2.569002, -0.811421, 1.941331, 1, 1, 1, 1, 1,
2.6007, -0.4949675, 1.725638, 1, 1, 1, 1, 1,
2.670948, 1.686129, 1.117132, 1, 1, 1, 1, 1,
2.746486, -0.9450034, 2.903991, 1, 1, 1, 1, 1,
3.087955, -2.052453, 1.900638, 1, 1, 1, 1, 1,
3.572734, -0.08957748, -0.04319736, 1, 1, 1, 1, 1
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
var radius = 10.44202;
var distance = 36.67716;
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
mvMatrix.translate( -0.3877171, 0.8034618, -0.4176009 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.67716);
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
