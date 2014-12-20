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
-3.002894, 1.390595, -1.693018, 1, 0, 0, 1,
-2.845221, -0.9539571, -3.781834, 1, 0.007843138, 0, 1,
-2.783458, -0.05866896, -2.556965, 1, 0.01176471, 0, 1,
-2.551954, -0.4278355, -0.9533471, 1, 0.01960784, 0, 1,
-2.441564, -0.5024645, -2.062371, 1, 0.02352941, 0, 1,
-2.395907, -0.8173608, -1.230627, 1, 0.03137255, 0, 1,
-2.392908, 0.9592211, -0.6774691, 1, 0.03529412, 0, 1,
-2.326358, 1.358818, -2.007628, 1, 0.04313726, 0, 1,
-2.326298, 0.8995447, -0.9494143, 1, 0.04705882, 0, 1,
-2.326292, 0.4697663, -1.364, 1, 0.05490196, 0, 1,
-2.300485, 0.1567911, -0.8374032, 1, 0.05882353, 0, 1,
-2.29623, 0.3877079, -2.166246, 1, 0.06666667, 0, 1,
-2.178882, -0.4954623, -1.845143, 1, 0.07058824, 0, 1,
-2.152093, -0.2541447, 0.7740904, 1, 0.07843138, 0, 1,
-2.13203, -0.9944161, -0.4375243, 1, 0.08235294, 0, 1,
-2.083907, -0.6187757, -2.651047, 1, 0.09019608, 0, 1,
-2.028992, -0.2187436, -0.003030644, 1, 0.09411765, 0, 1,
-1.991356, -0.9547461, -1.276934, 1, 0.1019608, 0, 1,
-1.949433, 0.0527376, -0.855459, 1, 0.1098039, 0, 1,
-1.944418, -1.098435, -4.475928, 1, 0.1137255, 0, 1,
-1.936296, 0.3288904, -0.5597059, 1, 0.1215686, 0, 1,
-1.920805, 0.9862, -1.1681, 1, 0.1254902, 0, 1,
-1.919556, -0.5109955, -1.213465, 1, 0.1333333, 0, 1,
-1.903973, 0.8951121, 0.1613028, 1, 0.1372549, 0, 1,
-1.887172, 0.7548277, -0.6062041, 1, 0.145098, 0, 1,
-1.875789, 0.427323, -0.8272893, 1, 0.1490196, 0, 1,
-1.862268, 0.8777593, -0.7176681, 1, 0.1568628, 0, 1,
-1.858809, 0.881386, -0.1355206, 1, 0.1607843, 0, 1,
-1.856824, -0.325216, -1.6417, 1, 0.1686275, 0, 1,
-1.846868, -0.3430325, -1.443255, 1, 0.172549, 0, 1,
-1.846379, -1.193413, -0.6267287, 1, 0.1803922, 0, 1,
-1.835005, -0.7423532, -1.448624, 1, 0.1843137, 0, 1,
-1.828762, 0.05306124, -2.780288, 1, 0.1921569, 0, 1,
-1.826926, 2.223478, -0.356434, 1, 0.1960784, 0, 1,
-1.816689, -0.0438963, -0.04737186, 1, 0.2039216, 0, 1,
-1.815752, -0.4342771, -2.75245, 1, 0.2117647, 0, 1,
-1.814103, 0.9602286, -0.4309792, 1, 0.2156863, 0, 1,
-1.798089, 0.460917, -1.462799, 1, 0.2235294, 0, 1,
-1.767519, 0.4254982, -0.2330364, 1, 0.227451, 0, 1,
-1.763918, -0.3224237, -3.51857, 1, 0.2352941, 0, 1,
-1.756103, -1.242625, -3.688879, 1, 0.2392157, 0, 1,
-1.74689, 1.463021, -2.712333, 1, 0.2470588, 0, 1,
-1.745255, 0.381181, 0.5831501, 1, 0.2509804, 0, 1,
-1.725996, -1.099054, -3.950953, 1, 0.2588235, 0, 1,
-1.71913, 0.3242907, -1.510488, 1, 0.2627451, 0, 1,
-1.696323, -1.720515, -0.5085573, 1, 0.2705882, 0, 1,
-1.695254, -0.03848787, -1.747454, 1, 0.2745098, 0, 1,
-1.681206, -1.028876, -0.6764953, 1, 0.282353, 0, 1,
-1.667601, 0.2373594, -2.603535, 1, 0.2862745, 0, 1,
-1.655458, -0.551475, -0.4285569, 1, 0.2941177, 0, 1,
-1.650841, 1.437155, -1.037788, 1, 0.3019608, 0, 1,
-1.627596, 0.4579447, -2.934801, 1, 0.3058824, 0, 1,
-1.622381, -0.1003726, -2.38653, 1, 0.3137255, 0, 1,
-1.590425, -0.2570748, -1.992361, 1, 0.3176471, 0, 1,
-1.578077, 0.3033422, -2.571091, 1, 0.3254902, 0, 1,
-1.570985, 0.6911235, -2.072937, 1, 0.3294118, 0, 1,
-1.567581, 0.7937477, -1.219112, 1, 0.3372549, 0, 1,
-1.565865, -0.5224975, -0.7126226, 1, 0.3411765, 0, 1,
-1.563978, -1.088633, -2.88869, 1, 0.3490196, 0, 1,
-1.562573, -0.611127, -3.052599, 1, 0.3529412, 0, 1,
-1.558683, -0.01646194, 0.7350941, 1, 0.3607843, 0, 1,
-1.532704, -0.5834167, -3.33531, 1, 0.3647059, 0, 1,
-1.529018, 0.7947134, -3.669744, 1, 0.372549, 0, 1,
-1.523137, 0.8434696, -1.702109, 1, 0.3764706, 0, 1,
-1.521918, 0.9962475, 0.1113845, 1, 0.3843137, 0, 1,
-1.489399, 0.8036535, -2.268064, 1, 0.3882353, 0, 1,
-1.481703, -0.288186, -1.896208, 1, 0.3960784, 0, 1,
-1.46123, 0.2969095, -3.423421, 1, 0.4039216, 0, 1,
-1.458733, 0.1476952, -1.00209, 1, 0.4078431, 0, 1,
-1.451166, -0.1318226, -3.229125, 1, 0.4156863, 0, 1,
-1.447232, -0.5900721, -2.533161, 1, 0.4196078, 0, 1,
-1.445432, -0.7684801, -2.421093, 1, 0.427451, 0, 1,
-1.441517, -0.1154246, -0.540857, 1, 0.4313726, 0, 1,
-1.440304, 0.3427891, -1.606271, 1, 0.4392157, 0, 1,
-1.437558, 1.822002, -1.37716, 1, 0.4431373, 0, 1,
-1.422859, -0.3037699, -2.186126, 1, 0.4509804, 0, 1,
-1.415872, 1.825034, -1.104707, 1, 0.454902, 0, 1,
-1.392754, -0.5377403, -1.406471, 1, 0.4627451, 0, 1,
-1.373709, -0.1842061, -2.207429, 1, 0.4666667, 0, 1,
-1.37244, -0.8973014, -2.390775, 1, 0.4745098, 0, 1,
-1.370495, -0.9791481, -2.147169, 1, 0.4784314, 0, 1,
-1.359872, 1.066478, -2.399721, 1, 0.4862745, 0, 1,
-1.344157, 0.6327028, -0.325098, 1, 0.4901961, 0, 1,
-1.341632, 0.1444964, -1.515227, 1, 0.4980392, 0, 1,
-1.340034, -1.46523, -0.1213623, 1, 0.5058824, 0, 1,
-1.336202, 1.172371, 0.307437, 1, 0.509804, 0, 1,
-1.334115, -0.09725314, -1.859476, 1, 0.5176471, 0, 1,
-1.333229, 0.9298888, -2.02228, 1, 0.5215687, 0, 1,
-1.325612, 3.103283, 1.311312, 1, 0.5294118, 0, 1,
-1.325098, 0.2465511, -2.008528, 1, 0.5333334, 0, 1,
-1.308797, -0.7291914, -2.531597, 1, 0.5411765, 0, 1,
-1.298774, -0.2264425, -1.048085, 1, 0.5450981, 0, 1,
-1.290551, -0.1065131, -2.376616, 1, 0.5529412, 0, 1,
-1.284707, 0.6285318, -2.335456, 1, 0.5568628, 0, 1,
-1.283573, 0.5439132, -1.749339, 1, 0.5647059, 0, 1,
-1.273037, -1.187569, -3.365479, 1, 0.5686275, 0, 1,
-1.270984, -0.3630044, -2.31318, 1, 0.5764706, 0, 1,
-1.268734, -1.357124, -2.879121, 1, 0.5803922, 0, 1,
-1.254819, 0.2146428, -0.3056757, 1, 0.5882353, 0, 1,
-1.252351, -1.565932, -3.075177, 1, 0.5921569, 0, 1,
-1.25138, -1.257544, -3.683716, 1, 0.6, 0, 1,
-1.248362, -0.2189085, -2.316723, 1, 0.6078432, 0, 1,
-1.236589, 3.217683, 0.0545883, 1, 0.6117647, 0, 1,
-1.235357, -1.620243, -2.355415, 1, 0.6196079, 0, 1,
-1.230968, -0.2525809, -1.551022, 1, 0.6235294, 0, 1,
-1.224191, 1.361847, -1.729787, 1, 0.6313726, 0, 1,
-1.216673, 0.743673, -1.499329, 1, 0.6352941, 0, 1,
-1.215431, -0.6789578, -2.18313, 1, 0.6431373, 0, 1,
-1.212362, 0.05538972, -1.674529, 1, 0.6470588, 0, 1,
-1.207221, -0.9431449, -2.522876, 1, 0.654902, 0, 1,
-1.203872, -0.7908783, -2.206089, 1, 0.6588235, 0, 1,
-1.199292, 0.5246444, -1.072464, 1, 0.6666667, 0, 1,
-1.199082, 0.7466766, 0.6771484, 1, 0.6705883, 0, 1,
-1.19285, -0.6615292, -2.12631, 1, 0.6784314, 0, 1,
-1.172713, 0.08777206, -0.6306614, 1, 0.682353, 0, 1,
-1.168849, -2.146427, -3.606321, 1, 0.6901961, 0, 1,
-1.168661, 0.06904567, -1.614371, 1, 0.6941177, 0, 1,
-1.166641, 0.4949983, -1.951284, 1, 0.7019608, 0, 1,
-1.161792, 0.4177002, -2.145574, 1, 0.7098039, 0, 1,
-1.152942, 0.2698577, -1.265462, 1, 0.7137255, 0, 1,
-1.150706, -0.811855, -2.896013, 1, 0.7215686, 0, 1,
-1.139989, 1.327571, -0.4913044, 1, 0.7254902, 0, 1,
-1.134838, -1.12721, -0.8713406, 1, 0.7333333, 0, 1,
-1.131321, -0.7516438, -1.492168, 1, 0.7372549, 0, 1,
-1.12948, 0.2477867, -0.3738799, 1, 0.7450981, 0, 1,
-1.129367, -0.5898129, -1.546176, 1, 0.7490196, 0, 1,
-1.123411, 0.4439059, 0.8342118, 1, 0.7568628, 0, 1,
-1.120528, -0.8870949, -3.279105, 1, 0.7607843, 0, 1,
-1.118885, -0.9730778, 0.1171747, 1, 0.7686275, 0, 1,
-1.11553, 1.250286, -0.05151055, 1, 0.772549, 0, 1,
-1.115471, -0.4051875, -3.355958, 1, 0.7803922, 0, 1,
-1.108689, -0.3995371, -1.318541, 1, 0.7843137, 0, 1,
-1.10728, -1.780272, -2.093673, 1, 0.7921569, 0, 1,
-1.107244, -1.266343, -1.790352, 1, 0.7960784, 0, 1,
-1.101034, 0.3234558, -0.03559886, 1, 0.8039216, 0, 1,
-1.097424, -0.2174561, -1.312192, 1, 0.8117647, 0, 1,
-1.093421, 0.03338313, 0.3190002, 1, 0.8156863, 0, 1,
-1.083754, 0.2877214, -0.8605713, 1, 0.8235294, 0, 1,
-1.081106, 0.512689, -1.952633, 1, 0.827451, 0, 1,
-1.075486, -0.2718537, -0.744757, 1, 0.8352941, 0, 1,
-1.06723, -0.666391, -0.5385849, 1, 0.8392157, 0, 1,
-1.064419, -0.7731086, -3.298195, 1, 0.8470588, 0, 1,
-1.058469, -0.1437766, -2.856937, 1, 0.8509804, 0, 1,
-1.055468, -0.2049494, 0.008344016, 1, 0.8588235, 0, 1,
-1.050894, -0.168318, -1.520211, 1, 0.8627451, 0, 1,
-1.041236, 2.093626, -1.669821, 1, 0.8705882, 0, 1,
-1.028357, -0.8327463, -1.005229, 1, 0.8745098, 0, 1,
-1.027969, 0.5360393, -2.116418, 1, 0.8823529, 0, 1,
-1.026922, 0.2521935, -0.9445418, 1, 0.8862745, 0, 1,
-1.025662, -0.7261313, -1.761937, 1, 0.8941177, 0, 1,
-1.013755, 0.700448, 0.5715639, 1, 0.8980392, 0, 1,
-1.010797, 0.45473, -0.7933508, 1, 0.9058824, 0, 1,
-1.003568, 1.288889, -2.131152, 1, 0.9137255, 0, 1,
-0.97853, -0.1323184, -1.754652, 1, 0.9176471, 0, 1,
-0.9676967, 0.3842064, -0.8216303, 1, 0.9254902, 0, 1,
-0.9643416, 0.2061391, 0.1472888, 1, 0.9294118, 0, 1,
-0.9629017, -0.9269866, -2.582662, 1, 0.9372549, 0, 1,
-0.9624433, -1.490524, -4.498621, 1, 0.9411765, 0, 1,
-0.9604331, -0.09632708, -0.4003259, 1, 0.9490196, 0, 1,
-0.9428675, -0.9212841, -1.402363, 1, 0.9529412, 0, 1,
-0.9412006, 0.9305709, 0.5816076, 1, 0.9607843, 0, 1,
-0.9377149, 0.2772593, -1.117289, 1, 0.9647059, 0, 1,
-0.9265704, -1.060062, -1.516937, 1, 0.972549, 0, 1,
-0.923406, 0.7939166, -0.601131, 1, 0.9764706, 0, 1,
-0.913359, 0.2428449, -0.1012415, 1, 0.9843137, 0, 1,
-0.9052191, 1.658764, -0.8134803, 1, 0.9882353, 0, 1,
-0.90391, -0.4915889, -3.11067, 1, 0.9960784, 0, 1,
-0.8986938, 1.644402, -1.598324, 0.9960784, 1, 0, 1,
-0.8981491, -0.5670155, -0.2259637, 0.9921569, 1, 0, 1,
-0.8973386, 0.8179019, -1.55261, 0.9843137, 1, 0, 1,
-0.8970066, -0.7109905, -0.5085017, 0.9803922, 1, 0, 1,
-0.8929079, 0.9495294, -1.269219, 0.972549, 1, 0, 1,
-0.8923575, 0.6221034, -1.390626, 0.9686275, 1, 0, 1,
-0.8909672, -0.4687634, -1.52642, 0.9607843, 1, 0, 1,
-0.8896848, -2.043213, -3.816133, 0.9568627, 1, 0, 1,
-0.8880708, -0.4054065, -0.9963368, 0.9490196, 1, 0, 1,
-0.8877938, -0.1808356, -2.492646, 0.945098, 1, 0, 1,
-0.88737, 0.5966319, -1.128571, 0.9372549, 1, 0, 1,
-0.8872104, 0.370682, -0.5142866, 0.9333333, 1, 0, 1,
-0.8851189, 1.157631, -1.191851, 0.9254902, 1, 0, 1,
-0.8846577, -0.7238961, -1.288579, 0.9215686, 1, 0, 1,
-0.8802221, 1.683664, 0.7011686, 0.9137255, 1, 0, 1,
-0.8769049, 0.2035851, -1.557785, 0.9098039, 1, 0, 1,
-0.8714877, 1.219648, 0.1149289, 0.9019608, 1, 0, 1,
-0.8652227, -0.07815207, -2.821577, 0.8941177, 1, 0, 1,
-0.8649716, 0.4866484, -2.110003, 0.8901961, 1, 0, 1,
-0.8624766, 0.1531617, -0.1868092, 0.8823529, 1, 0, 1,
-0.8609785, 1.892761, -1.076421, 0.8784314, 1, 0, 1,
-0.8578941, -0.09888244, -0.3203831, 0.8705882, 1, 0, 1,
-0.852387, 0.7801451, -0.5849828, 0.8666667, 1, 0, 1,
-0.8506299, 1.060264, -1.394478, 0.8588235, 1, 0, 1,
-0.8438357, -0.1051698, -1.935942, 0.854902, 1, 0, 1,
-0.8430873, 1.129398, -0.5927889, 0.8470588, 1, 0, 1,
-0.8416862, -1.425021, -1.62146, 0.8431373, 1, 0, 1,
-0.8402624, 1.215463, 0.1964904, 0.8352941, 1, 0, 1,
-0.832517, -1.466382, -2.980188, 0.8313726, 1, 0, 1,
-0.8294834, -0.1627134, -1.238387, 0.8235294, 1, 0, 1,
-0.824717, 0.6844215, -0.4754497, 0.8196079, 1, 0, 1,
-0.8203509, 0.853767, 1.382148, 0.8117647, 1, 0, 1,
-0.8130705, -0.3187659, -2.26388, 0.8078431, 1, 0, 1,
-0.8105624, -2.53338, -1.981589, 0.8, 1, 0, 1,
-0.8081645, 1.94514, -0.01832174, 0.7921569, 1, 0, 1,
-0.7967722, 0.2686291, -0.9636738, 0.7882353, 1, 0, 1,
-0.7955447, 0.8652505, -0.904204, 0.7803922, 1, 0, 1,
-0.7954342, 0.4059012, -2.384026, 0.7764706, 1, 0, 1,
-0.7940212, 0.4971347, 0.9299718, 0.7686275, 1, 0, 1,
-0.7923309, 0.02307736, -1.689546, 0.7647059, 1, 0, 1,
-0.7871664, 1.394384, -1.394902, 0.7568628, 1, 0, 1,
-0.7870045, 0.1223703, -0.6225845, 0.7529412, 1, 0, 1,
-0.7868258, -0.4949699, -2.347975, 0.7450981, 1, 0, 1,
-0.7856652, -0.4142527, -2.436229, 0.7411765, 1, 0, 1,
-0.7819993, 0.6277036, 0.6036856, 0.7333333, 1, 0, 1,
-0.7783287, -0.1613709, 0.8705326, 0.7294118, 1, 0, 1,
-0.7757388, 0.1687943, -0.1012107, 0.7215686, 1, 0, 1,
-0.7737266, -1.693893, -2.717511, 0.7176471, 1, 0, 1,
-0.7658333, 1.281758, 0.4300485, 0.7098039, 1, 0, 1,
-0.7451114, -0.06042717, -3.011341, 0.7058824, 1, 0, 1,
-0.738174, 0.9688846, -1.440229, 0.6980392, 1, 0, 1,
-0.7362253, -1.817707, -3.474149, 0.6901961, 1, 0, 1,
-0.730509, 1.134698, -1.473693, 0.6862745, 1, 0, 1,
-0.7259004, 0.3851137, -1.782076, 0.6784314, 1, 0, 1,
-0.7257503, -1.414455, -2.791812, 0.6745098, 1, 0, 1,
-0.7241889, -1.681174, -1.859012, 0.6666667, 1, 0, 1,
-0.7092693, 0.612479, -0.8097664, 0.6627451, 1, 0, 1,
-0.7067257, -0.5524077, -1.130257, 0.654902, 1, 0, 1,
-0.7015895, -0.2112247, -2.522921, 0.6509804, 1, 0, 1,
-0.7013646, 0.07685558, -1.072439, 0.6431373, 1, 0, 1,
-0.701169, 1.230498, -1.029205, 0.6392157, 1, 0, 1,
-0.7006692, 2.347458, -1.566355, 0.6313726, 1, 0, 1,
-0.6970986, 0.1063643, -1.936871, 0.627451, 1, 0, 1,
-0.6969689, 0.1544442, -1.502605, 0.6196079, 1, 0, 1,
-0.696643, 0.9643399, -1.804832, 0.6156863, 1, 0, 1,
-0.6935382, 0.3595068, -3.038767, 0.6078432, 1, 0, 1,
-0.6875682, 0.326523, -1.625956, 0.6039216, 1, 0, 1,
-0.6854565, -0.5992516, -2.061024, 0.5960785, 1, 0, 1,
-0.6840056, -0.4581361, -2.260672, 0.5882353, 1, 0, 1,
-0.6812617, 1.06837, -2.359219, 0.5843138, 1, 0, 1,
-0.6805565, 0.5944731, 0.4218189, 0.5764706, 1, 0, 1,
-0.680548, -1.27464, -2.550108, 0.572549, 1, 0, 1,
-0.6801428, -1.423978, -2.111198, 0.5647059, 1, 0, 1,
-0.6793241, -1.960526, -4.130523, 0.5607843, 1, 0, 1,
-0.6788301, -0.1340511, -0.6865353, 0.5529412, 1, 0, 1,
-0.6713585, 0.07274285, -1.296622, 0.5490196, 1, 0, 1,
-0.6700897, 0.8662747, -1.756379, 0.5411765, 1, 0, 1,
-0.6691104, -2.925277, -2.585778, 0.5372549, 1, 0, 1,
-0.6676957, 1.825018, -0.9578924, 0.5294118, 1, 0, 1,
-0.6675211, 0.744814, -1.338255, 0.5254902, 1, 0, 1,
-0.6661428, -0.4763848, -1.831437, 0.5176471, 1, 0, 1,
-0.6588436, -1.674752, -2.06035, 0.5137255, 1, 0, 1,
-0.6569207, 0.604093, -0.8221418, 0.5058824, 1, 0, 1,
-0.653843, -0.2287912, -2.866711, 0.5019608, 1, 0, 1,
-0.6533257, -0.05999928, -1.101014, 0.4941176, 1, 0, 1,
-0.6528537, 1.438211, 0.9755489, 0.4862745, 1, 0, 1,
-0.651774, -1.305333, -1.154085, 0.4823529, 1, 0, 1,
-0.6507683, 1.519311, -1.396064, 0.4745098, 1, 0, 1,
-0.6459165, -0.2339111, -1.367068, 0.4705882, 1, 0, 1,
-0.6444504, -0.1187005, -0.7802855, 0.4627451, 1, 0, 1,
-0.6377514, 0.5374611, -1.2646, 0.4588235, 1, 0, 1,
-0.6330453, -1.441322, -4.225145, 0.4509804, 1, 0, 1,
-0.6319159, -0.6322885, -2.285977, 0.4470588, 1, 0, 1,
-0.6318672, 0.5523682, -0.2328355, 0.4392157, 1, 0, 1,
-0.6309624, -0.268721, -0.8427837, 0.4352941, 1, 0, 1,
-0.6277021, 0.06277999, 0.1582288, 0.427451, 1, 0, 1,
-0.623013, 0.09574383, -1.707492, 0.4235294, 1, 0, 1,
-0.6157182, 0.1045838, -2.28429, 0.4156863, 1, 0, 1,
-0.609545, 0.3598756, -0.4647144, 0.4117647, 1, 0, 1,
-0.6093639, 0.4754778, -0.2942785, 0.4039216, 1, 0, 1,
-0.6072336, 0.5980714, -0.6097735, 0.3960784, 1, 0, 1,
-0.6055958, 0.2021619, -1.424317, 0.3921569, 1, 0, 1,
-0.5987291, -0.8339896, -2.652357, 0.3843137, 1, 0, 1,
-0.5968437, -0.7619424, -4.008636, 0.3803922, 1, 0, 1,
-0.592446, 1.911119, 0.2393351, 0.372549, 1, 0, 1,
-0.589948, 0.2902914, -1.950172, 0.3686275, 1, 0, 1,
-0.5873621, 1.555937, -2.924114, 0.3607843, 1, 0, 1,
-0.5813147, 0.2169897, -2.720409, 0.3568628, 1, 0, 1,
-0.5807902, 0.4131967, -1.131418, 0.3490196, 1, 0, 1,
-0.5805786, -0.592492, -1.061223, 0.345098, 1, 0, 1,
-0.5804403, -1.242033, -2.688913, 0.3372549, 1, 0, 1,
-0.5717303, 1.500905, 0.9105422, 0.3333333, 1, 0, 1,
-0.5714335, -0.1060026, -0.3828168, 0.3254902, 1, 0, 1,
-0.5708306, 0.07436282, -2.420618, 0.3215686, 1, 0, 1,
-0.5625346, 0.08182544, -0.3383079, 0.3137255, 1, 0, 1,
-0.5613565, 1.638311, -1.055781, 0.3098039, 1, 0, 1,
-0.5596995, 0.8969879, -2.486362, 0.3019608, 1, 0, 1,
-0.5554724, -1.375127, -2.260353, 0.2941177, 1, 0, 1,
-0.5546498, 1.193141, -0.9411831, 0.2901961, 1, 0, 1,
-0.5531879, -0.1436009, 0.141615, 0.282353, 1, 0, 1,
-0.5525711, 0.7921486, -2.401386, 0.2784314, 1, 0, 1,
-0.549428, 1.965, -0.1116347, 0.2705882, 1, 0, 1,
-0.5489611, 1.350354, -0.413123, 0.2666667, 1, 0, 1,
-0.5462914, 2.071789, -1.289706, 0.2588235, 1, 0, 1,
-0.5462227, -0.6247585, -1.56429, 0.254902, 1, 0, 1,
-0.5391946, -0.8978009, -2.791459, 0.2470588, 1, 0, 1,
-0.5354706, -0.2885293, -2.177728, 0.2431373, 1, 0, 1,
-0.5332222, -0.07803138, -1.063726, 0.2352941, 1, 0, 1,
-0.530853, 0.2659976, -0.84041, 0.2313726, 1, 0, 1,
-0.5294331, 0.5524337, 0.5151599, 0.2235294, 1, 0, 1,
-0.5287591, -0.9014069, -2.152695, 0.2196078, 1, 0, 1,
-0.5272214, 0.5307492, -0.3129055, 0.2117647, 1, 0, 1,
-0.5237817, 0.625935, -0.5949721, 0.2078431, 1, 0, 1,
-0.523535, 0.4994075, -1.201911, 0.2, 1, 0, 1,
-0.5184838, -1.78047, -3.786705, 0.1921569, 1, 0, 1,
-0.5184281, 0.9641587, -0.6849804, 0.1882353, 1, 0, 1,
-0.5130579, -0.4740105, -0.6858809, 0.1803922, 1, 0, 1,
-0.5075048, -0.7441676, -1.975806, 0.1764706, 1, 0, 1,
-0.5067257, 1.405958, -1.680541, 0.1686275, 1, 0, 1,
-0.5058416, 1.241768, -0.5471593, 0.1647059, 1, 0, 1,
-0.5054267, -0.1665591, -2.967207, 0.1568628, 1, 0, 1,
-0.5039619, -0.7325136, -0.7981841, 0.1529412, 1, 0, 1,
-0.5010951, 1.152701, -1.401776, 0.145098, 1, 0, 1,
-0.496289, 4.158753, 0.2054541, 0.1411765, 1, 0, 1,
-0.4962056, 0.01981654, -0.8960372, 0.1333333, 1, 0, 1,
-0.4951754, 0.8894403, 0.4718183, 0.1294118, 1, 0, 1,
-0.4911279, -1.317588, -2.408688, 0.1215686, 1, 0, 1,
-0.4906072, -0.2805064, -1.821079, 0.1176471, 1, 0, 1,
-0.4878769, 0.5560167, -0.4039647, 0.1098039, 1, 0, 1,
-0.4854036, -1.134763, -3.651361, 0.1058824, 1, 0, 1,
-0.4823451, -0.9383861, -2.955913, 0.09803922, 1, 0, 1,
-0.481654, -0.6233885, -4.123806, 0.09019608, 1, 0, 1,
-0.4809642, 0.3934332, -1.849259, 0.08627451, 1, 0, 1,
-0.4752279, 0.936846, -1.971061, 0.07843138, 1, 0, 1,
-0.4736373, 1.411, 1.16224, 0.07450981, 1, 0, 1,
-0.4717795, 0.4883223, 0.1484772, 0.06666667, 1, 0, 1,
-0.4683956, 0.6783463, -1.098265, 0.0627451, 1, 0, 1,
-0.4663196, -0.01480836, -0.8645679, 0.05490196, 1, 0, 1,
-0.4658355, -0.6126972, -1.915949, 0.05098039, 1, 0, 1,
-0.4643168, -1.558482, -3.307583, 0.04313726, 1, 0, 1,
-0.4621027, 0.7884634, -0.2391351, 0.03921569, 1, 0, 1,
-0.4603689, 0.8012459, 0.594713, 0.03137255, 1, 0, 1,
-0.45493, -1.079073, -3.434318, 0.02745098, 1, 0, 1,
-0.4536983, 1.698915, -0.7919183, 0.01960784, 1, 0, 1,
-0.4455615, -0.2079605, -0.85905, 0.01568628, 1, 0, 1,
-0.4426021, 0.2187555, -1.172774, 0.007843138, 1, 0, 1,
-0.4406881, -0.9771697, -2.631801, 0.003921569, 1, 0, 1,
-0.4397688, 0.4976021, -1.511082, 0, 1, 0.003921569, 1,
-0.434925, 0.7292676, 0.1894979, 0, 1, 0.01176471, 1,
-0.4339219, 0.1934595, -2.435894, 0, 1, 0.01568628, 1,
-0.4305933, 1.444433, -1.16907, 0, 1, 0.02352941, 1,
-0.4289055, 0.07420846, -2.40342, 0, 1, 0.02745098, 1,
-0.4190199, 0.157482, -2.443156, 0, 1, 0.03529412, 1,
-0.4168631, 0.6468171, 0.6298079, 0, 1, 0.03921569, 1,
-0.4150674, 0.7010022, -0.8406373, 0, 1, 0.04705882, 1,
-0.4125654, -0.5179328, -1.71699, 0, 1, 0.05098039, 1,
-0.4105637, -1.320738, -3.33549, 0, 1, 0.05882353, 1,
-0.409729, -0.7203317, -1.023076, 0, 1, 0.0627451, 1,
-0.4014429, 1.434655, -0.6628829, 0, 1, 0.07058824, 1,
-0.4013121, -1.623201, -2.816772, 0, 1, 0.07450981, 1,
-0.3999861, 0.4810346, -1.051347, 0, 1, 0.08235294, 1,
-0.3995758, -0.4425977, -0.9449897, 0, 1, 0.08627451, 1,
-0.3986724, -0.4892976, -3.28144, 0, 1, 0.09411765, 1,
-0.3943777, -0.9640533, -5.375684, 0, 1, 0.1019608, 1,
-0.3909974, -1.535721, -2.409637, 0, 1, 0.1058824, 1,
-0.3903939, 1.302841, -1.174933, 0, 1, 0.1137255, 1,
-0.385859, -0.9169801, -2.768399, 0, 1, 0.1176471, 1,
-0.3790033, 0.8476108, 0.02485709, 0, 1, 0.1254902, 1,
-0.3771764, -1.254481, -3.067721, 0, 1, 0.1294118, 1,
-0.3761549, -0.5531133, -2.679733, 0, 1, 0.1372549, 1,
-0.375205, -0.2227633, -2.00394, 0, 1, 0.1411765, 1,
-0.3742909, -1.656995, -2.482374, 0, 1, 0.1490196, 1,
-0.3736406, -0.1766085, 0.06344803, 0, 1, 0.1529412, 1,
-0.373535, -0.8644454, -2.422267, 0, 1, 0.1607843, 1,
-0.3712077, 0.1706702, -0.09331806, 0, 1, 0.1647059, 1,
-0.3689763, 0.5298797, -0.1447053, 0, 1, 0.172549, 1,
-0.3689236, -0.984257, -3.175579, 0, 1, 0.1764706, 1,
-0.3677694, -1.928037, -1.57968, 0, 1, 0.1843137, 1,
-0.3660425, -1.655858, -2.932729, 0, 1, 0.1882353, 1,
-0.3660073, 0.05496893, -0.4823797, 0, 1, 0.1960784, 1,
-0.3652497, 0.3806511, -1.862221, 0, 1, 0.2039216, 1,
-0.3627999, 0.2136673, 0.3049456, 0, 1, 0.2078431, 1,
-0.3606759, -1.285594, -1.274599, 0, 1, 0.2156863, 1,
-0.3604641, -2.002519, -1.604648, 0, 1, 0.2196078, 1,
-0.3591351, -0.2410392, -1.803285, 0, 1, 0.227451, 1,
-0.3497376, 1.18727, -0.6865897, 0, 1, 0.2313726, 1,
-0.349429, 1.728597, -1.405706, 0, 1, 0.2392157, 1,
-0.3483832, -0.07014758, -4.496698, 0, 1, 0.2431373, 1,
-0.3453098, -1.415288, -0.7023379, 0, 1, 0.2509804, 1,
-0.3444516, -0.6319326, -2.836344, 0, 1, 0.254902, 1,
-0.3431476, -1.541563, -4.357367, 0, 1, 0.2627451, 1,
-0.3390795, -0.3912736, -0.6402447, 0, 1, 0.2666667, 1,
-0.336906, -0.7624567, -3.030394, 0, 1, 0.2745098, 1,
-0.3363581, -0.7897238, -1.904672, 0, 1, 0.2784314, 1,
-0.3342141, -0.683148, -2.704038, 0, 1, 0.2862745, 1,
-0.333709, -1.108593, -0.7497101, 0, 1, 0.2901961, 1,
-0.3334783, 1.439132, -1.225151, 0, 1, 0.2980392, 1,
-0.3289151, 1.940843, 0.2651025, 0, 1, 0.3058824, 1,
-0.328229, 0.1802677, -1.390771, 0, 1, 0.3098039, 1,
-0.32785, -1.321359, -1.971756, 0, 1, 0.3176471, 1,
-0.3205793, -0.1011656, -2.536521, 0, 1, 0.3215686, 1,
-0.3186696, 0.4546932, -0.4906774, 0, 1, 0.3294118, 1,
-0.3150364, -0.2467127, -2.707982, 0, 1, 0.3333333, 1,
-0.3143663, -0.04535327, -1.067191, 0, 1, 0.3411765, 1,
-0.3141102, -0.3141659, -2.912957, 0, 1, 0.345098, 1,
-0.3116342, -0.2211806, -1.969893, 0, 1, 0.3529412, 1,
-0.3103483, 0.5199687, -1.248223, 0, 1, 0.3568628, 1,
-0.3094732, -1.735836, -3.158978, 0, 1, 0.3647059, 1,
-0.2995428, 0.1161691, -0.7707275, 0, 1, 0.3686275, 1,
-0.2961567, 1.23641, -0.9700608, 0, 1, 0.3764706, 1,
-0.2953318, 0.3303917, -1.335483, 0, 1, 0.3803922, 1,
-0.2943622, -0.08135691, -1.385604, 0, 1, 0.3882353, 1,
-0.2841315, 0.4287992, 0.1682328, 0, 1, 0.3921569, 1,
-0.2838541, 0.3596369, -1.878453, 0, 1, 0.4, 1,
-0.2831974, -1.162413, -2.312287, 0, 1, 0.4078431, 1,
-0.2821926, -0.2303768, -1.364027, 0, 1, 0.4117647, 1,
-0.2727646, 0.8221205, -1.226809, 0, 1, 0.4196078, 1,
-0.2712145, 0.2207415, 0.04737237, 0, 1, 0.4235294, 1,
-0.2710692, 0.2046417, -0.3555938, 0, 1, 0.4313726, 1,
-0.2704669, 0.4634739, -0.4735237, 0, 1, 0.4352941, 1,
-0.2667945, 0.3410642, 0.6629426, 0, 1, 0.4431373, 1,
-0.2662767, 0.3606833, -0.6378655, 0, 1, 0.4470588, 1,
-0.2653795, -0.4062617, -3.230335, 0, 1, 0.454902, 1,
-0.264535, 1.56075, 0.7010732, 0, 1, 0.4588235, 1,
-0.2596149, 0.1587828, -0.4199008, 0, 1, 0.4666667, 1,
-0.2586035, 0.2572624, -0.03098194, 0, 1, 0.4705882, 1,
-0.256908, -0.6185284, -3.057558, 0, 1, 0.4784314, 1,
-0.2550277, -0.2656297, -1.715014, 0, 1, 0.4823529, 1,
-0.2495206, -1.135434, -2.401465, 0, 1, 0.4901961, 1,
-0.2477826, 0.4468617, 0.1778337, 0, 1, 0.4941176, 1,
-0.2467758, -1.106663, -0.7398458, 0, 1, 0.5019608, 1,
-0.2438604, 0.766426, 0.3636431, 0, 1, 0.509804, 1,
-0.2426519, -0.3676392, -1.889825, 0, 1, 0.5137255, 1,
-0.2422341, 0.8537763, -1.468271, 0, 1, 0.5215687, 1,
-0.2400139, -1.0859, -4.329593, 0, 1, 0.5254902, 1,
-0.2381236, -0.8362798, -3.608305, 0, 1, 0.5333334, 1,
-0.2304325, 0.7951574, 2.080574, 0, 1, 0.5372549, 1,
-0.2235727, -0.1937428, -3.874431, 0, 1, 0.5450981, 1,
-0.2228159, -0.9822379, -2.784329, 0, 1, 0.5490196, 1,
-0.2210788, 1.365454, 1.838267, 0, 1, 0.5568628, 1,
-0.2208871, 1.075684, -0.2199205, 0, 1, 0.5607843, 1,
-0.2206193, 0.3769574, -0.1274982, 0, 1, 0.5686275, 1,
-0.2174069, -0.07454949, -2.401067, 0, 1, 0.572549, 1,
-0.2166522, 0.3655988, -0.03628389, 0, 1, 0.5803922, 1,
-0.2139783, 0.1108769, -1.058251, 0, 1, 0.5843138, 1,
-0.2118882, -0.4940138, -2.15283, 0, 1, 0.5921569, 1,
-0.2064939, -0.7614012, -3.817537, 0, 1, 0.5960785, 1,
-0.2023297, 0.3189333, 0.2321971, 0, 1, 0.6039216, 1,
-0.198307, 0.01273587, -2.106375, 0, 1, 0.6117647, 1,
-0.1982817, 0.2392998, -1.317387, 0, 1, 0.6156863, 1,
-0.1945501, 0.7405048, -0.7065606, 0, 1, 0.6235294, 1,
-0.1931182, 0.2245362, -1.798637, 0, 1, 0.627451, 1,
-0.18863, -0.9494081, -3.882448, 0, 1, 0.6352941, 1,
-0.1860275, -0.8617261, -2.413849, 0, 1, 0.6392157, 1,
-0.1810996, -0.4181936, -3.801885, 0, 1, 0.6470588, 1,
-0.1806276, 0.7237685, 0.4157094, 0, 1, 0.6509804, 1,
-0.1801039, 0.7893467, 1.122768, 0, 1, 0.6588235, 1,
-0.1793099, 0.8390066, 0.3225049, 0, 1, 0.6627451, 1,
-0.1790207, 0.8898852, 0.2808178, 0, 1, 0.6705883, 1,
-0.1754093, 0.008550159, -0.06427974, 0, 1, 0.6745098, 1,
-0.1735513, 0.9598658, 0.3730252, 0, 1, 0.682353, 1,
-0.1729704, -0.2166899, -1.24387, 0, 1, 0.6862745, 1,
-0.1665197, -0.8259605, -1.975021, 0, 1, 0.6941177, 1,
-0.1654707, 0.6552707, -0.1019658, 0, 1, 0.7019608, 1,
-0.1641192, -1.057377, -3.161753, 0, 1, 0.7058824, 1,
-0.1570424, -0.9105359, -3.676208, 0, 1, 0.7137255, 1,
-0.1545298, -0.656836, -3.294243, 0, 1, 0.7176471, 1,
-0.151341, -0.3272761, -3.960258, 0, 1, 0.7254902, 1,
-0.1509127, 1.333804, -0.04713966, 0, 1, 0.7294118, 1,
-0.1490773, 0.2735782, -1.71105, 0, 1, 0.7372549, 1,
-0.1482481, 0.3486922, 0.7069215, 0, 1, 0.7411765, 1,
-0.1415074, 1.175059, -0.6463479, 0, 1, 0.7490196, 1,
-0.1407794, 1.004405, -0.3236985, 0, 1, 0.7529412, 1,
-0.1405558, -1.522169, -3.816453, 0, 1, 0.7607843, 1,
-0.138355, 0.1379125, -3.18239, 0, 1, 0.7647059, 1,
-0.1372675, 0.3747365, -0.1092576, 0, 1, 0.772549, 1,
-0.1347692, 1.612639, 0.272403, 0, 1, 0.7764706, 1,
-0.1347522, -1.555496, -5.292482, 0, 1, 0.7843137, 1,
-0.134345, 0.8200508, 0.806945, 0, 1, 0.7882353, 1,
-0.1287728, -1.124963, -3.732794, 0, 1, 0.7960784, 1,
-0.1260137, 1.586462, -0.5569872, 0, 1, 0.8039216, 1,
-0.1182204, -1.015214, -3.71933, 0, 1, 0.8078431, 1,
-0.109787, -0.6622233, -2.012007, 0, 1, 0.8156863, 1,
-0.1048772, 1.896499, -1.914518, 0, 1, 0.8196079, 1,
-0.1001839, 0.3079432, 0.7593747, 0, 1, 0.827451, 1,
-0.09466331, -0.5100243, -1.482407, 0, 1, 0.8313726, 1,
-0.09286354, -0.3719134, -4.423694, 0, 1, 0.8392157, 1,
-0.09222843, 0.07981564, -1.622025, 0, 1, 0.8431373, 1,
-0.09096211, 0.08031958, -1.654962, 0, 1, 0.8509804, 1,
-0.09090202, -2.104041, -2.417832, 0, 1, 0.854902, 1,
-0.09081184, 1.554432, 1.011734, 0, 1, 0.8627451, 1,
-0.08999626, -1.664733, -5.78303, 0, 1, 0.8666667, 1,
-0.08855845, -0.8795217, -1.374497, 0, 1, 0.8745098, 1,
-0.07779452, -0.739116, -3.314636, 0, 1, 0.8784314, 1,
-0.07748048, -0.5035335, -2.629884, 0, 1, 0.8862745, 1,
-0.07667363, -1.484013, -3.50443, 0, 1, 0.8901961, 1,
-0.07290963, -0.9781187, -2.468163, 0, 1, 0.8980392, 1,
-0.0726705, 0.6083201, 1.300949, 0, 1, 0.9058824, 1,
-0.07266832, 0.05773866, -0.8601767, 0, 1, 0.9098039, 1,
-0.07258423, 0.5853423, -0.5588876, 0, 1, 0.9176471, 1,
-0.07241262, -0.130396, -3.22726, 0, 1, 0.9215686, 1,
-0.0720733, 1.705615, -0.4646168, 0, 1, 0.9294118, 1,
-0.06836794, -1.308787, -2.570677, 0, 1, 0.9333333, 1,
-0.06411994, -0.7558388, -4.237793, 0, 1, 0.9411765, 1,
-0.06310124, -1.217431, -3.417334, 0, 1, 0.945098, 1,
-0.06185505, -0.9541516, -2.492073, 0, 1, 0.9529412, 1,
-0.06159139, -1.030563, -3.152231, 0, 1, 0.9568627, 1,
-0.05804603, -0.3515477, -3.385464, 0, 1, 0.9647059, 1,
-0.05482496, -0.9617372, -1.609814, 0, 1, 0.9686275, 1,
-0.05436977, -1.493663, -3.791422, 0, 1, 0.9764706, 1,
-0.04950725, 0.06487238, -0.6698073, 0, 1, 0.9803922, 1,
-0.04738643, 1.738951, -1.093932, 0, 1, 0.9882353, 1,
-0.04588226, 0.5407819, 3.996496, 0, 1, 0.9921569, 1,
-0.04485718, 0.5463395, 0.9599094, 0, 1, 1, 1,
-0.04278154, 1.117948, -1.815506, 0, 0.9921569, 1, 1,
-0.04165281, 1.952755, -0.02550893, 0, 0.9882353, 1, 1,
-0.04111585, 0.05117332, -1.008509, 0, 0.9803922, 1, 1,
-0.03511292, 1.030699, 0.2866004, 0, 0.9764706, 1, 1,
-0.03386463, 0.6852804, 0.4272798, 0, 0.9686275, 1, 1,
-0.03080299, -2.899245, -2.269858, 0, 0.9647059, 1, 1,
-0.02054034, -1.151239, -4.166712, 0, 0.9568627, 1, 1,
-0.01823534, -1.816487, -3.198376, 0, 0.9529412, 1, 1,
-0.01603329, -1.319214, -3.028859, 0, 0.945098, 1, 1,
-0.01131916, 0.09039576, -1.588568, 0, 0.9411765, 1, 1,
-0.006961065, -1.136919, -2.220491, 0, 0.9333333, 1, 1,
-0.005512071, -0.8764508, -3.568743, 0, 0.9294118, 1, 1,
0.0002495218, -0.9960232, 2.58041, 0, 0.9215686, 1, 1,
0.002163806, 0.3145157, -1.146881, 0, 0.9176471, 1, 1,
0.005286886, 1.286508, -0.6650775, 0, 0.9098039, 1, 1,
0.009246708, -0.5011917, 2.242681, 0, 0.9058824, 1, 1,
0.009501537, 0.6965002, 0.3030988, 0, 0.8980392, 1, 1,
0.0106399, 0.04627959, 0.2603268, 0, 0.8901961, 1, 1,
0.01142267, 0.06771125, 0.366675, 0, 0.8862745, 1, 1,
0.01283807, -0.903261, 2.629943, 0, 0.8784314, 1, 1,
0.01318378, -0.1103106, 2.593843, 0, 0.8745098, 1, 1,
0.01530272, -0.7330648, 2.555604, 0, 0.8666667, 1, 1,
0.0174028, -0.4010191, 6.35834, 0, 0.8627451, 1, 1,
0.02033433, -2.43997, 4.335214, 0, 0.854902, 1, 1,
0.02087952, 0.4192345, 0.5353301, 0, 0.8509804, 1, 1,
0.02359656, 0.3050957, 0.3547265, 0, 0.8431373, 1, 1,
0.02432957, -0.03266633, 4.536956, 0, 0.8392157, 1, 1,
0.0278992, 0.09756784, -1.241185, 0, 0.8313726, 1, 1,
0.02860432, 1.8407, 0.6236755, 0, 0.827451, 1, 1,
0.03876088, 0.6414651, -0.5255602, 0, 0.8196079, 1, 1,
0.03944796, 0.6620818, 1.268877, 0, 0.8156863, 1, 1,
0.0407921, -0.5564229, 2.487211, 0, 0.8078431, 1, 1,
0.04223664, 0.1388572, 0.5887855, 0, 0.8039216, 1, 1,
0.0431233, -0.1768857, 1.830235, 0, 0.7960784, 1, 1,
0.04345701, -0.2761936, 3.347598, 0, 0.7882353, 1, 1,
0.04368666, 0.2314404, 0.958277, 0, 0.7843137, 1, 1,
0.04688212, -1.377135, 2.942172, 0, 0.7764706, 1, 1,
0.04751586, 0.1618995, 2.148981, 0, 0.772549, 1, 1,
0.05087721, 0.8249699, -1.245858, 0, 0.7647059, 1, 1,
0.05236505, -1.094654, 2.253426, 0, 0.7607843, 1, 1,
0.05980007, 0.5143154, 1.00877, 0, 0.7529412, 1, 1,
0.06307557, -0.6865104, 2.603125, 0, 0.7490196, 1, 1,
0.06376613, -1.555625, 2.684491, 0, 0.7411765, 1, 1,
0.07816914, -2.321308, 2.524255, 0, 0.7372549, 1, 1,
0.08103701, 1.287362, 1.171285, 0, 0.7294118, 1, 1,
0.08193641, 0.1282424, 2.140206, 0, 0.7254902, 1, 1,
0.08344794, 0.6478837, 0.08262594, 0, 0.7176471, 1, 1,
0.08392733, -1.142257, 4.439159, 0, 0.7137255, 1, 1,
0.08393095, 1.18651, 1.79019, 0, 0.7058824, 1, 1,
0.08395748, 0.3026061, 1.087558, 0, 0.6980392, 1, 1,
0.08714764, 0.4830921, -1.341294, 0, 0.6941177, 1, 1,
0.08968139, 0.1437385, 1.999495, 0, 0.6862745, 1, 1,
0.09039325, 0.05423792, 2.044814, 0, 0.682353, 1, 1,
0.09181714, 0.6469853, 0.2308913, 0, 0.6745098, 1, 1,
0.09349406, 0.392915, 0.5821362, 0, 0.6705883, 1, 1,
0.09641554, 0.5042008, 0.8676333, 0, 0.6627451, 1, 1,
0.09818352, 1.140138, -0.2494772, 0, 0.6588235, 1, 1,
0.1023137, 0.1688191, 2.884938, 0, 0.6509804, 1, 1,
0.1047617, 0.9427164, -0.8075714, 0, 0.6470588, 1, 1,
0.1060374, 0.7960486, 1.235923, 0, 0.6392157, 1, 1,
0.1083686, -0.8328623, 3.748748, 0, 0.6352941, 1, 1,
0.1084305, -1.478936, 3.630825, 0, 0.627451, 1, 1,
0.1084896, 1.386409, -0.2252419, 0, 0.6235294, 1, 1,
0.109232, 1.711108, 1.017081, 0, 0.6156863, 1, 1,
0.1154886, -0.07813744, 1.975388, 0, 0.6117647, 1, 1,
0.1158334, -0.3741137, 4.077551, 0, 0.6039216, 1, 1,
0.1160535, 0.8501154, 1.865445, 0, 0.5960785, 1, 1,
0.1181368, -0.2413612, 2.97538, 0, 0.5921569, 1, 1,
0.1187251, -0.4451038, 4.492007, 0, 0.5843138, 1, 1,
0.1239661, 0.6087782, -1.0348, 0, 0.5803922, 1, 1,
0.1253517, -0.4808974, 2.550146, 0, 0.572549, 1, 1,
0.1314385, -0.6356397, 2.333004, 0, 0.5686275, 1, 1,
0.1316535, -1.879637, 1.613286, 0, 0.5607843, 1, 1,
0.1324031, -0.6039668, 3.877709, 0, 0.5568628, 1, 1,
0.1337768, 0.0462346, 1.476771, 0, 0.5490196, 1, 1,
0.1404232, 1.316088, -0.3936937, 0, 0.5450981, 1, 1,
0.1493026, 0.3613738, -0.8526971, 0, 0.5372549, 1, 1,
0.149603, 1.021811, 1.456053, 0, 0.5333334, 1, 1,
0.1500085, -1.33963, 0.9889222, 0, 0.5254902, 1, 1,
0.1532187, 1.379611, -0.2671804, 0, 0.5215687, 1, 1,
0.154952, -0.9653456, 1.460101, 0, 0.5137255, 1, 1,
0.1563932, -0.9780848, 2.486023, 0, 0.509804, 1, 1,
0.1598239, -0.3354202, 1.728352, 0, 0.5019608, 1, 1,
0.1661014, 0.8511633, -1.21001, 0, 0.4941176, 1, 1,
0.1701404, -1.020161, 3.061064, 0, 0.4901961, 1, 1,
0.1784634, -0.3967574, 2.887858, 0, 0.4823529, 1, 1,
0.1798285, -0.403948, 1.605765, 0, 0.4784314, 1, 1,
0.1835689, 0.05866473, 0.9082844, 0, 0.4705882, 1, 1,
0.1846578, 1.027146, -0.9450871, 0, 0.4666667, 1, 1,
0.1846996, -0.4814934, 1.972927, 0, 0.4588235, 1, 1,
0.1854606, 0.9725124, 0.4866669, 0, 0.454902, 1, 1,
0.1868523, 0.3081003, -0.6810212, 0, 0.4470588, 1, 1,
0.1916263, 0.4332603, 1.046806, 0, 0.4431373, 1, 1,
0.1929226, 1.334367, -0.8400248, 0, 0.4352941, 1, 1,
0.1946426, 0.5777407, 1.508686, 0, 0.4313726, 1, 1,
0.1950352, 0.457333, 1.106751, 0, 0.4235294, 1, 1,
0.2050112, 0.2299758, -0.4588943, 0, 0.4196078, 1, 1,
0.2053697, -0.2268866, 2.241907, 0, 0.4117647, 1, 1,
0.2087589, -0.5362763, 1.236296, 0, 0.4078431, 1, 1,
0.2134523, -1.361455, 3.876651, 0, 0.4, 1, 1,
0.2242019, -0.4673159, 2.330562, 0, 0.3921569, 1, 1,
0.2334598, 0.9548681, 0.0004583181, 0, 0.3882353, 1, 1,
0.2349748, 1.584495, -1.403586, 0, 0.3803922, 1, 1,
0.2352172, 0.4080097, -0.639704, 0, 0.3764706, 1, 1,
0.2354029, 1.392596, 1.214854, 0, 0.3686275, 1, 1,
0.2387418, -0.2263894, 1.75582, 0, 0.3647059, 1, 1,
0.244654, 2.340241, -1.065056, 0, 0.3568628, 1, 1,
0.2456049, 1.355572, 1.228497, 0, 0.3529412, 1, 1,
0.2505315, 0.2138241, -0.07572464, 0, 0.345098, 1, 1,
0.2505808, 1.195737, -0.3257521, 0, 0.3411765, 1, 1,
0.2522333, -0.4265888, 2.71663, 0, 0.3333333, 1, 1,
0.2551413, -1.294721, 4.652446, 0, 0.3294118, 1, 1,
0.2558673, -2.177251, 2.817516, 0, 0.3215686, 1, 1,
0.2572387, -0.4661768, 4.332017, 0, 0.3176471, 1, 1,
0.2596495, 0.002967973, 0.3011135, 0, 0.3098039, 1, 1,
0.2607706, -1.196429, 4.874069, 0, 0.3058824, 1, 1,
0.2635724, -1.369928, 3.567607, 0, 0.2980392, 1, 1,
0.2652655, -0.2515889, 2.673717, 0, 0.2901961, 1, 1,
0.2666496, -0.1709377, 0.905034, 0, 0.2862745, 1, 1,
0.2712266, 0.05740943, 2.028271, 0, 0.2784314, 1, 1,
0.2746705, -1.106703, 2.326851, 0, 0.2745098, 1, 1,
0.2758763, 0.7568255, 0.3336109, 0, 0.2666667, 1, 1,
0.2784865, -0.9153324, 1.612106, 0, 0.2627451, 1, 1,
0.2809287, 0.4277634, -0.7214459, 0, 0.254902, 1, 1,
0.2821232, 1.632969, 0.5917585, 0, 0.2509804, 1, 1,
0.2827283, -0.8298849, 1.966425, 0, 0.2431373, 1, 1,
0.2847612, 0.6292996, 1.962409, 0, 0.2392157, 1, 1,
0.2875433, 0.9028897, 1.43781, 0, 0.2313726, 1, 1,
0.2981292, 1.184113, -0.5633693, 0, 0.227451, 1, 1,
0.3000553, 0.6948773, 2.095026, 0, 0.2196078, 1, 1,
0.3006289, 1.500301, -0.1069026, 0, 0.2156863, 1, 1,
0.3035709, 0.5546053, 1.616888, 0, 0.2078431, 1, 1,
0.3062427, 0.4112423, 2.080175, 0, 0.2039216, 1, 1,
0.3141804, -0.2639118, 3.809651, 0, 0.1960784, 1, 1,
0.3217973, 0.7119954, 0.968206, 0, 0.1882353, 1, 1,
0.3228879, -0.1826692, 2.736921, 0, 0.1843137, 1, 1,
0.3238408, 1.384629, -1.281288, 0, 0.1764706, 1, 1,
0.3245446, 0.8865796, 0.07775225, 0, 0.172549, 1, 1,
0.3249782, 0.8193037, -0.8700519, 0, 0.1647059, 1, 1,
0.3291353, -0.7677349, 3.613805, 0, 0.1607843, 1, 1,
0.3309965, -1.725232, 2.2448, 0, 0.1529412, 1, 1,
0.3393658, -0.2343142, -0.3673428, 0, 0.1490196, 1, 1,
0.3410701, -0.0135159, 1.966951, 0, 0.1411765, 1, 1,
0.3418036, 1.221741, 0.5274739, 0, 0.1372549, 1, 1,
0.3442592, 0.6266067, 0.03071999, 0, 0.1294118, 1, 1,
0.352814, 0.5445009, -0.1091654, 0, 0.1254902, 1, 1,
0.3600074, -0.6202481, 2.136162, 0, 0.1176471, 1, 1,
0.3606225, 0.5442344, -0.0541435, 0, 0.1137255, 1, 1,
0.365198, 0.558837, 0.2698458, 0, 0.1058824, 1, 1,
0.3661623, 0.03422854, 2.112911, 0, 0.09803922, 1, 1,
0.3685904, -1.528268, 1.605775, 0, 0.09411765, 1, 1,
0.3691, -0.1151118, 2.570718, 0, 0.08627451, 1, 1,
0.3721371, -0.639478, 2.765588, 0, 0.08235294, 1, 1,
0.3813473, 1.149334, 1.503873, 0, 0.07450981, 1, 1,
0.3893233, -0.910136, 1.309085, 0, 0.07058824, 1, 1,
0.3976323, 0.02490584, 0.444922, 0, 0.0627451, 1, 1,
0.3982263, -0.4520468, 1.428095, 0, 0.05882353, 1, 1,
0.3995614, 0.1541688, 0.8689833, 0, 0.05098039, 1, 1,
0.4019544, 2.323876, 0.5056803, 0, 0.04705882, 1, 1,
0.4069209, 0.4408826, 0.8021834, 0, 0.03921569, 1, 1,
0.4126673, 0.8382533, -0.1478065, 0, 0.03529412, 1, 1,
0.4161974, 0.4677608, 1.956841, 0, 0.02745098, 1, 1,
0.4167768, -0.1610471, 1.196724, 0, 0.02352941, 1, 1,
0.4247118, 0.2912775, 1.119885, 0, 0.01568628, 1, 1,
0.4286863, 0.4084451, 1.352629, 0, 0.01176471, 1, 1,
0.4297205, -0.4658206, 2.317833, 0, 0.003921569, 1, 1,
0.4343666, -0.181994, 0.8711967, 0.003921569, 0, 1, 1,
0.4395256, -1.791824, 1.638543, 0.007843138, 0, 1, 1,
0.4414981, -0.8494257, 2.880065, 0.01568628, 0, 1, 1,
0.4456452, 0.2694068, 2.156525, 0.01960784, 0, 1, 1,
0.4508378, -1.594348, 4.301521, 0.02745098, 0, 1, 1,
0.4522602, 0.7498791, -1.054632, 0.03137255, 0, 1, 1,
0.4522779, 0.7202408, -0.289427, 0.03921569, 0, 1, 1,
0.4557936, -0.4959622, 2.454726, 0.04313726, 0, 1, 1,
0.4559924, -1.335444, 0.7090036, 0.05098039, 0, 1, 1,
0.4584408, 0.5364144, 1.854384, 0.05490196, 0, 1, 1,
0.4597554, -0.6208898, 2.787529, 0.0627451, 0, 1, 1,
0.4673004, 0.06161564, 0.2650509, 0.06666667, 0, 1, 1,
0.4677302, 0.9970269, 0.4370463, 0.07450981, 0, 1, 1,
0.4682481, 1.569622, 0.3578031, 0.07843138, 0, 1, 1,
0.4688534, 0.04090212, 1.857899, 0.08627451, 0, 1, 1,
0.4700242, -0.755926, 3.46409, 0.09019608, 0, 1, 1,
0.4713162, -1.564834, 2.942595, 0.09803922, 0, 1, 1,
0.4731241, -1.629511, 3.126578, 0.1058824, 0, 1, 1,
0.4740863, 0.6778205, 0.3839253, 0.1098039, 0, 1, 1,
0.4767052, -0.3038704, 2.105826, 0.1176471, 0, 1, 1,
0.476855, -0.4639565, 3.062277, 0.1215686, 0, 1, 1,
0.4771006, -0.3871621, 1.042736, 0.1294118, 0, 1, 1,
0.4799657, -0.1765838, 1.46035, 0.1333333, 0, 1, 1,
0.4835235, 0.1318113, 3.227099, 0.1411765, 0, 1, 1,
0.4840053, -1.806228, 3.015813, 0.145098, 0, 1, 1,
0.4847447, -1.227009, 3.961073, 0.1529412, 0, 1, 1,
0.4857135, -0.5788902, 3.619127, 0.1568628, 0, 1, 1,
0.4860951, 0.643503, 1.934152, 0.1647059, 0, 1, 1,
0.4881166, 1.466582, -0.4197722, 0.1686275, 0, 1, 1,
0.489356, -0.01824683, 2.094054, 0.1764706, 0, 1, 1,
0.4894503, 0.8958892, 1.866534, 0.1803922, 0, 1, 1,
0.4899136, -0.4738714, 1.379605, 0.1882353, 0, 1, 1,
0.493498, -0.2292063, 1.591755, 0.1921569, 0, 1, 1,
0.4942894, 0.9785703, -1.219449, 0.2, 0, 1, 1,
0.4955165, 0.78622, 1.851337, 0.2078431, 0, 1, 1,
0.4999451, 1.074005, -0.4917726, 0.2117647, 0, 1, 1,
0.5014994, 0.279298, -0.6418629, 0.2196078, 0, 1, 1,
0.514321, -1.750375, 4.02578, 0.2235294, 0, 1, 1,
0.5151597, -0.1459, 1.710713, 0.2313726, 0, 1, 1,
0.5156745, -0.1410332, 0.5981869, 0.2352941, 0, 1, 1,
0.5212985, 0.7282031, 0.7327064, 0.2431373, 0, 1, 1,
0.5220048, 0.4539053, -0.2683749, 0.2470588, 0, 1, 1,
0.5276586, -1.524195, 0.5274694, 0.254902, 0, 1, 1,
0.5390807, 2.334772, 0.8581915, 0.2588235, 0, 1, 1,
0.5401523, -1.738419, 1.451348, 0.2666667, 0, 1, 1,
0.5435501, -1.034546, 1.338018, 0.2705882, 0, 1, 1,
0.5441465, 0.04700807, 1.629479, 0.2784314, 0, 1, 1,
0.549561, -0.6008192, 3.055813, 0.282353, 0, 1, 1,
0.5497563, -0.2443523, 2.820631, 0.2901961, 0, 1, 1,
0.5539688, -1.429825, 2.717402, 0.2941177, 0, 1, 1,
0.5571762, 0.9069695, 0.8349775, 0.3019608, 0, 1, 1,
0.5577358, -0.7775689, 4.067409, 0.3098039, 0, 1, 1,
0.5595021, -0.8344243, 2.138212, 0.3137255, 0, 1, 1,
0.5604039, 0.4155424, 0.7742009, 0.3215686, 0, 1, 1,
0.5638045, 2.103381, -0.8463448, 0.3254902, 0, 1, 1,
0.5683411, -0.4009205, 2.1705, 0.3333333, 0, 1, 1,
0.5923164, -1.416056, 1.218732, 0.3372549, 0, 1, 1,
0.59889, -1.550612, 1.199785, 0.345098, 0, 1, 1,
0.5999905, -0.2247556, 2.721472, 0.3490196, 0, 1, 1,
0.6004143, -0.2760587, 3.123981, 0.3568628, 0, 1, 1,
0.6033959, 0.6016394, 0.3697358, 0.3607843, 0, 1, 1,
0.6075454, -0.02487326, 1.310223, 0.3686275, 0, 1, 1,
0.6092781, -0.7540031, 2.065861, 0.372549, 0, 1, 1,
0.6093807, -0.4883672, 3.483461, 0.3803922, 0, 1, 1,
0.6101011, -0.7387671, 0.2625882, 0.3843137, 0, 1, 1,
0.6132619, -1.751176, 1.024448, 0.3921569, 0, 1, 1,
0.613898, 0.2038532, 1.903132, 0.3960784, 0, 1, 1,
0.6327595, 0.2031121, 0.8331481, 0.4039216, 0, 1, 1,
0.6337997, 0.3156874, -0.7941814, 0.4117647, 0, 1, 1,
0.6437229, -0.4954247, 1.967437, 0.4156863, 0, 1, 1,
0.6443067, 0.1013529, 1.888467, 0.4235294, 0, 1, 1,
0.6486726, -0.5047059, 3.193345, 0.427451, 0, 1, 1,
0.6507437, 0.2318189, 0.2220344, 0.4352941, 0, 1, 1,
0.6509492, -1.180627, 1.74193, 0.4392157, 0, 1, 1,
0.6521367, 1.124833, 0.05572413, 0.4470588, 0, 1, 1,
0.6593378, -0.5205674, 2.454061, 0.4509804, 0, 1, 1,
0.6594881, 0.6560545, 0.2116441, 0.4588235, 0, 1, 1,
0.6612225, 0.2106177, -0.233818, 0.4627451, 0, 1, 1,
0.6632457, 0.0098126, 2.98057, 0.4705882, 0, 1, 1,
0.6645368, -0.6113378, 2.122244, 0.4745098, 0, 1, 1,
0.6674582, 1.324154, 0.5282211, 0.4823529, 0, 1, 1,
0.6704933, 1.057904, 2.520443, 0.4862745, 0, 1, 1,
0.6709706, 0.3585332, 0.7869267, 0.4941176, 0, 1, 1,
0.6724511, -0.8674186, 0.6870946, 0.5019608, 0, 1, 1,
0.6777731, 0.5314464, 0.5340815, 0.5058824, 0, 1, 1,
0.6845725, 1.001162, 0.2957141, 0.5137255, 0, 1, 1,
0.6921147, -1.302568, 2.207403, 0.5176471, 0, 1, 1,
0.693572, -0.3871465, 1.876245, 0.5254902, 0, 1, 1,
0.6974278, -0.7569653, 1.383788, 0.5294118, 0, 1, 1,
0.6983707, -0.7433047, 3.590328, 0.5372549, 0, 1, 1,
0.6986834, 0.5030185, 0.1647611, 0.5411765, 0, 1, 1,
0.7004685, -1.973378, 3.836225, 0.5490196, 0, 1, 1,
0.7006415, 0.1493221, 0.5811895, 0.5529412, 0, 1, 1,
0.7076373, -0.9272315, 2.682291, 0.5607843, 0, 1, 1,
0.7111207, 0.06797523, 1.213967, 0.5647059, 0, 1, 1,
0.7112798, 0.6129959, -0.2856431, 0.572549, 0, 1, 1,
0.7123666, 0.4313667, -0.590983, 0.5764706, 0, 1, 1,
0.7124507, 1.486708, -1.196695, 0.5843138, 0, 1, 1,
0.7168883, -0.2350895, 1.592907, 0.5882353, 0, 1, 1,
0.7185382, 1.364217, -0.3587581, 0.5960785, 0, 1, 1,
0.7189546, 0.2269838, 1.350317, 0.6039216, 0, 1, 1,
0.7209327, 0.8979785, 0.7063887, 0.6078432, 0, 1, 1,
0.7250048, 0.1579096, 1.395889, 0.6156863, 0, 1, 1,
0.728353, -1.223793, 2.150703, 0.6196079, 0, 1, 1,
0.7324921, -0.7190233, 1.113577, 0.627451, 0, 1, 1,
0.7329816, 2.521759, 0.6319537, 0.6313726, 0, 1, 1,
0.7344261, 1.024413, 1.028726, 0.6392157, 0, 1, 1,
0.7368255, 0.08702217, 1.287835, 0.6431373, 0, 1, 1,
0.7438691, -0.5430709, 3.688109, 0.6509804, 0, 1, 1,
0.7447018, -0.9281917, 3.430988, 0.654902, 0, 1, 1,
0.7460995, 0.3530183, -0.1071813, 0.6627451, 0, 1, 1,
0.7479619, -0.525107, 2.551473, 0.6666667, 0, 1, 1,
0.7646245, -1.525961, 1.564962, 0.6745098, 0, 1, 1,
0.7722191, -0.4297605, 3.367337, 0.6784314, 0, 1, 1,
0.7724072, -0.8991002, 2.717846, 0.6862745, 0, 1, 1,
0.7749944, 0.309248, 1.41845, 0.6901961, 0, 1, 1,
0.7755092, -0.8705795, 1.827553, 0.6980392, 0, 1, 1,
0.7887762, 0.3725538, 0.7499824, 0.7058824, 0, 1, 1,
0.8001522, 0.3765885, 2.265539, 0.7098039, 0, 1, 1,
0.8011891, 1.664694, 0.560195, 0.7176471, 0, 1, 1,
0.8013821, 0.4891052, 0.4439874, 0.7215686, 0, 1, 1,
0.8050937, 0.02815474, 0.3748989, 0.7294118, 0, 1, 1,
0.8127964, -0.7056932, 1.423617, 0.7333333, 0, 1, 1,
0.8269789, 0.5767242, 1.130469, 0.7411765, 0, 1, 1,
0.8307531, -0.6462389, 2.946446, 0.7450981, 0, 1, 1,
0.8331875, 0.9835781, 0.11508, 0.7529412, 0, 1, 1,
0.8387306, -0.6378696, 0.4193202, 0.7568628, 0, 1, 1,
0.8436825, 0.5899516, 0.9975862, 0.7647059, 0, 1, 1,
0.8446766, -0.3255071, 3.16668, 0.7686275, 0, 1, 1,
0.8474259, 0.06820485, 1.108358, 0.7764706, 0, 1, 1,
0.847604, 0.1171358, 1.013437, 0.7803922, 0, 1, 1,
0.8516979, -1.109044, 2.50112, 0.7882353, 0, 1, 1,
0.8529741, 0.134824, 1.152726, 0.7921569, 0, 1, 1,
0.8612077, -1.521582, 1.412508, 0.8, 0, 1, 1,
0.8648249, -0.8459485, 3.904485, 0.8078431, 0, 1, 1,
0.8685499, 0.2100837, -0.1364131, 0.8117647, 0, 1, 1,
0.8700497, 0.7356822, -0.3689844, 0.8196079, 0, 1, 1,
0.8737206, 0.5562696, 0.56333, 0.8235294, 0, 1, 1,
0.8800573, -1.830533, 2.15466, 0.8313726, 0, 1, 1,
0.8811128, -0.1601078, 1.610862, 0.8352941, 0, 1, 1,
0.8811377, -0.1485923, 2.124301, 0.8431373, 0, 1, 1,
0.8825529, 0.9514101, 1.70886, 0.8470588, 0, 1, 1,
0.8840163, -0.6905059, -0.02978876, 0.854902, 0, 1, 1,
0.8924274, 0.8809317, 1.19765, 0.8588235, 0, 1, 1,
0.8932402, -0.6060205, 2.842125, 0.8666667, 0, 1, 1,
0.9001573, 1.276616, 1.110996, 0.8705882, 0, 1, 1,
0.9007712, 1.467203, 1.213315, 0.8784314, 0, 1, 1,
0.9056186, -0.2950311, 1.544093, 0.8823529, 0, 1, 1,
0.9075539, -0.6593105, 3.131646, 0.8901961, 0, 1, 1,
0.9137655, 0.6353742, -0.2308454, 0.8941177, 0, 1, 1,
0.9174663, 0.1195344, 0.9557213, 0.9019608, 0, 1, 1,
0.9210018, -2.001857, 1.298198, 0.9098039, 0, 1, 1,
0.9239622, 0.1182332, 0.7707733, 0.9137255, 0, 1, 1,
0.925383, -0.5808741, 2.104773, 0.9215686, 0, 1, 1,
0.9331027, 1.259305, -0.7595727, 0.9254902, 0, 1, 1,
0.9338643, -2.188401, 2.238912, 0.9333333, 0, 1, 1,
0.9376552, 1.761037, 0.2684056, 0.9372549, 0, 1, 1,
0.9388996, 0.4413836, 0.5637828, 0.945098, 0, 1, 1,
0.9463493, 0.7594097, 0.2550114, 0.9490196, 0, 1, 1,
0.9466898, 0.6317608, 2.086778, 0.9568627, 0, 1, 1,
0.9566631, -1.243245, 2.491507, 0.9607843, 0, 1, 1,
0.9590509, -0.1073476, 2.124412, 0.9686275, 0, 1, 1,
0.96143, -1.361755, 2.532584, 0.972549, 0, 1, 1,
0.9693133, 0.4909379, 2.215214, 0.9803922, 0, 1, 1,
0.9697365, -0.5761818, 0.516957, 0.9843137, 0, 1, 1,
0.9716038, -1.760748, 0.446254, 0.9921569, 0, 1, 1,
0.9741601, 0.6153541, 0.3324617, 0.9960784, 0, 1, 1,
0.980753, 0.6711132, 1.773824, 1, 0, 0.9960784, 1,
0.9833743, 1.357834, 0.6768665, 1, 0, 0.9882353, 1,
0.9871476, 0.1460496, 1.724851, 1, 0, 0.9843137, 1,
0.9914244, 0.1042604, 1.912541, 1, 0, 0.9764706, 1,
0.9929839, -0.3120313, 1.731615, 1, 0, 0.972549, 1,
0.9991875, -0.2417607, 4.151405, 1, 0, 0.9647059, 1,
0.9998967, 0.5228257, 0.3505556, 1, 0, 0.9607843, 1,
1.00003, 1.029594, -0.1781435, 1, 0, 0.9529412, 1,
1.000146, 0.08289205, -0.3040613, 1, 0, 0.9490196, 1,
1.00176, 0.5828912, -0.8224908, 1, 0, 0.9411765, 1,
1.003159, -0.5384189, 1.701745, 1, 0, 0.9372549, 1,
1.014501, 1.136571, 0.7576661, 1, 0, 0.9294118, 1,
1.016038, 0.4029477, 1.317093, 1, 0, 0.9254902, 1,
1.028894, 0.6311077, 1.826079, 1, 0, 0.9176471, 1,
1.033314, -1.187657, 2.174443, 1, 0, 0.9137255, 1,
1.034215, 1.533601, -0.2765347, 1, 0, 0.9058824, 1,
1.036034, 0.6911067, 1.970312, 1, 0, 0.9019608, 1,
1.037943, 2.173781, 0.6086639, 1, 0, 0.8941177, 1,
1.045504, 0.5980163, 0.5621348, 1, 0, 0.8862745, 1,
1.046818, -0.2036771, 1.478112, 1, 0, 0.8823529, 1,
1.05336, -0.8394184, 2.413059, 1, 0, 0.8745098, 1,
1.063779, -0.1663678, 2.030855, 1, 0, 0.8705882, 1,
1.067994, -0.8234589, 0.6750844, 1, 0, 0.8627451, 1,
1.073378, -0.3070059, 0.911984, 1, 0, 0.8588235, 1,
1.073807, -0.2475044, 0.1496338, 1, 0, 0.8509804, 1,
1.084211, -0.440141, 1.397741, 1, 0, 0.8470588, 1,
1.08903, -1.226586, 2.783493, 1, 0, 0.8392157, 1,
1.089129, 1.373989, -1.176128, 1, 0, 0.8352941, 1,
1.090614, -0.1208552, 2.860088, 1, 0, 0.827451, 1,
1.09972, 1.232729, 0.6023542, 1, 0, 0.8235294, 1,
1.106546, 0.527341, -0.3418873, 1, 0, 0.8156863, 1,
1.107333, 0.4830146, 1.11595, 1, 0, 0.8117647, 1,
1.107428, -0.02552312, 1.025683, 1, 0, 0.8039216, 1,
1.116534, -1.35698, 1.58035, 1, 0, 0.7960784, 1,
1.11721, 1.058101, 0.1535444, 1, 0, 0.7921569, 1,
1.12661, -1.132508, 1.957736, 1, 0, 0.7843137, 1,
1.142059, 0.8159924, 0.1689814, 1, 0, 0.7803922, 1,
1.142404, -0.2753238, 2.256371, 1, 0, 0.772549, 1,
1.154324, -0.6315196, 3.539727, 1, 0, 0.7686275, 1,
1.159971, -1.008892, 2.289919, 1, 0, 0.7607843, 1,
1.161245, -1.768215, 1.631843, 1, 0, 0.7568628, 1,
1.161909, 0.2758914, -0.1810994, 1, 0, 0.7490196, 1,
1.166358, -1.45926, 3.966426, 1, 0, 0.7450981, 1,
1.167119, 1.04522, 0.5082899, 1, 0, 0.7372549, 1,
1.168869, -0.1597502, 0.4403298, 1, 0, 0.7333333, 1,
1.178663, -0.6146063, 2.715479, 1, 0, 0.7254902, 1,
1.179536, 0.4964821, 1.645776, 1, 0, 0.7215686, 1,
1.18572, -0.5723218, 2.052062, 1, 0, 0.7137255, 1,
1.187345, 0.8604839, 1.268589, 1, 0, 0.7098039, 1,
1.189529, -1.018945, 2.051954, 1, 0, 0.7019608, 1,
1.195124, 0.3277659, 1.64467, 1, 0, 0.6941177, 1,
1.204171, -0.1436957, 1.928984, 1, 0, 0.6901961, 1,
1.208797, -1.456671, 2.922652, 1, 0, 0.682353, 1,
1.218939, -0.07908822, 1.058257, 1, 0, 0.6784314, 1,
1.252371, -1.372216, 3.462596, 1, 0, 0.6705883, 1,
1.258433, -0.8728316, 1.071883, 1, 0, 0.6666667, 1,
1.261029, 0.1730331, 1.364002, 1, 0, 0.6588235, 1,
1.263174, 0.02472265, 3.252891, 1, 0, 0.654902, 1,
1.264581, -1.005734, 3.08667, 1, 0, 0.6470588, 1,
1.265124, -0.686001, -0.07450829, 1, 0, 0.6431373, 1,
1.267073, 1.353215, 0.7506645, 1, 0, 0.6352941, 1,
1.274666, 0.5950364, 1.515811, 1, 0, 0.6313726, 1,
1.276602, 0.9535384, -0.9581974, 1, 0, 0.6235294, 1,
1.284229, 1.009349, -1.867371, 1, 0, 0.6196079, 1,
1.289685, -0.3557434, 1.409881, 1, 0, 0.6117647, 1,
1.294736, 0.2713948, 2.569876, 1, 0, 0.6078432, 1,
1.300034, 0.03584095, 0.5698177, 1, 0, 0.6, 1,
1.315023, 0.03994999, 0.07350779, 1, 0, 0.5921569, 1,
1.315531, 0.08705261, 2.479998, 1, 0, 0.5882353, 1,
1.318836, 0.6587452, 0.6702208, 1, 0, 0.5803922, 1,
1.320199, 0.1479625, 0.7459422, 1, 0, 0.5764706, 1,
1.32702, 1.255796, -0.3782382, 1, 0, 0.5686275, 1,
1.327478, 0.4754372, 1.812875, 1, 0, 0.5647059, 1,
1.336438, -0.1744232, 2.022729, 1, 0, 0.5568628, 1,
1.350985, -0.7319115, 2.297585, 1, 0, 0.5529412, 1,
1.359515, -0.9547601, 0.9603761, 1, 0, 0.5450981, 1,
1.36266, -0.7803456, 2.811664, 1, 0, 0.5411765, 1,
1.365693, 0.3648797, -0.1679451, 1, 0, 0.5333334, 1,
1.376203, 0.3125312, 1.34979, 1, 0, 0.5294118, 1,
1.389228, 0.3258904, 2.907506, 1, 0, 0.5215687, 1,
1.390868, 2.542497, 1.339255, 1, 0, 0.5176471, 1,
1.395182, -0.05890609, 1.055761, 1, 0, 0.509804, 1,
1.401804, 1.421027, -0.5056356, 1, 0, 0.5058824, 1,
1.406067, -1.73015, 3.622318, 1, 0, 0.4980392, 1,
1.418145, 1.454164, -0.2587956, 1, 0, 0.4901961, 1,
1.431467, 0.08793677, 2.737137, 1, 0, 0.4862745, 1,
1.439583, 1.08756, 1.508544, 1, 0, 0.4784314, 1,
1.453474, -0.05260828, 4.173458, 1, 0, 0.4745098, 1,
1.459799, -0.2311256, 0.5652383, 1, 0, 0.4666667, 1,
1.459913, -0.2471096, 2.070371, 1, 0, 0.4627451, 1,
1.461366, -1.279838, 0.8799455, 1, 0, 0.454902, 1,
1.507877, -0.03017537, 1.291587, 1, 0, 0.4509804, 1,
1.51515, -1.510897, 0.8547871, 1, 0, 0.4431373, 1,
1.517497, 0.7550067, 1.258281, 1, 0, 0.4392157, 1,
1.522214, 0.422791, 2.113721, 1, 0, 0.4313726, 1,
1.538823, 0.04936236, 2.854055, 1, 0, 0.427451, 1,
1.539504, 0.3291877, 2.063282, 1, 0, 0.4196078, 1,
1.543382, 0.04717309, 1.238145, 1, 0, 0.4156863, 1,
1.554934, 0.3994623, 0.04399847, 1, 0, 0.4078431, 1,
1.555409, -0.2728858, 1.134899, 1, 0, 0.4039216, 1,
1.563784, -0.7772664, 1.56479, 1, 0, 0.3960784, 1,
1.5693, -0.4136574, 1.479294, 1, 0, 0.3882353, 1,
1.582586, 0.2450881, 0.424316, 1, 0, 0.3843137, 1,
1.583307, -0.7881036, 2.020553, 1, 0, 0.3764706, 1,
1.585106, -0.04223624, 2.461313, 1, 0, 0.372549, 1,
1.585944, 1.507575, -0.1528366, 1, 0, 0.3647059, 1,
1.595487, 0.5384978, 0.2188257, 1, 0, 0.3607843, 1,
1.623342, -0.4804598, 3.200414, 1, 0, 0.3529412, 1,
1.626414, -0.09987285, 1.003887, 1, 0, 0.3490196, 1,
1.631559, -0.1875295, 2.115562, 1, 0, 0.3411765, 1,
1.632632, 0.9321084, 0.3190961, 1, 0, 0.3372549, 1,
1.633155, -0.1891291, 3.163126, 1, 0, 0.3294118, 1,
1.635666, 0.8449897, 2.258966, 1, 0, 0.3254902, 1,
1.642788, 3.172915, 0.5855237, 1, 0, 0.3176471, 1,
1.670747, 0.5223168, -0.2517906, 1, 0, 0.3137255, 1,
1.671915, 1.277972, 1.323229, 1, 0, 0.3058824, 1,
1.69451, -0.01947628, 1.710404, 1, 0, 0.2980392, 1,
1.71014, 1.409969, 0.2187404, 1, 0, 0.2941177, 1,
1.725275, -1.030794, 1.485595, 1, 0, 0.2862745, 1,
1.736015, -0.3351923, 2.006021, 1, 0, 0.282353, 1,
1.737906, 0.1796631, -0.2972359, 1, 0, 0.2745098, 1,
1.748847, -0.571039, 1.798138, 1, 0, 0.2705882, 1,
1.751611, -0.7482312, 2.184627, 1, 0, 0.2627451, 1,
1.769363, 1.370057, 1.861564, 1, 0, 0.2588235, 1,
1.794173, 0.843483, 1.671945, 1, 0, 0.2509804, 1,
1.801182, -2.040603, 3.774403, 1, 0, 0.2470588, 1,
1.805123, -0.1178001, 2.370867, 1, 0, 0.2392157, 1,
1.837704, 0.3352759, 2.375873, 1, 0, 0.2352941, 1,
1.853989, -0.3214283, 4.001906, 1, 0, 0.227451, 1,
1.860069, -0.7477801, 4.028936, 1, 0, 0.2235294, 1,
1.875344, 1.501728, 0.3417605, 1, 0, 0.2156863, 1,
1.885596, 0.5671608, 3.864367, 1, 0, 0.2117647, 1,
1.894918, -0.8018971, 2.448785, 1, 0, 0.2039216, 1,
1.920758, 0.6048002, 0.8345352, 1, 0, 0.1960784, 1,
1.949467, -1.406202, 1.349325, 1, 0, 0.1921569, 1,
1.970952, -0.2438122, 1.826349, 1, 0, 0.1843137, 1,
1.977025, 0.222122, 0.8362326, 1, 0, 0.1803922, 1,
1.980981, -0.4383875, 2.003709, 1, 0, 0.172549, 1,
1.985734, 0.4502111, 2.518497, 1, 0, 0.1686275, 1,
1.990099, 0.3881354, 1.617637, 1, 0, 0.1607843, 1,
2.048109, 0.09717921, 0.4073547, 1, 0, 0.1568628, 1,
2.056997, 0.3490597, 2.213922, 1, 0, 0.1490196, 1,
2.068998, -0.4142089, 2.228031, 1, 0, 0.145098, 1,
2.081716, -2.302856, 1.622601, 1, 0, 0.1372549, 1,
2.085686, 0.8329682, 2.878038, 1, 0, 0.1333333, 1,
2.096119, 0.7368478, 1.420549, 1, 0, 0.1254902, 1,
2.104173, 0.3116483, 2.516178, 1, 0, 0.1215686, 1,
2.112226, 0.577133, 0.02882007, 1, 0, 0.1137255, 1,
2.131705, 0.45893, 1.914515, 1, 0, 0.1098039, 1,
2.151373, -0.09021694, 0.3917545, 1, 0, 0.1019608, 1,
2.193438, 0.2101498, 1.1506, 1, 0, 0.09411765, 1,
2.212456, 1.002391, 2.03838, 1, 0, 0.09019608, 1,
2.215329, -1.122544, 0.8242023, 1, 0, 0.08235294, 1,
2.21703, -0.1375642, 1.181736, 1, 0, 0.07843138, 1,
2.217599, -0.2289529, 1.375615, 1, 0, 0.07058824, 1,
2.233357, 0.2679233, 0.3788044, 1, 0, 0.06666667, 1,
2.278469, 0.2716557, 1.40164, 1, 0, 0.05882353, 1,
2.420694, 0.4584539, 1.620477, 1, 0, 0.05490196, 1,
2.486237, -1.409646, 0.9578898, 1, 0, 0.04705882, 1,
2.515094, -0.63705, 1.483099, 1, 0, 0.04313726, 1,
2.672366, 1.334864, 1.066355, 1, 0, 0.03529412, 1,
2.745362, 1.368158, -0.1385082, 1, 0, 0.03137255, 1,
2.768691, -0.2652055, 1.001195, 1, 0, 0.02352941, 1,
3.025923, -1.323281, 1.724478, 1, 0, 0.01960784, 1,
3.325103, 0.3769464, 0.887839, 1, 0, 0.01176471, 1,
3.335999, 0.09087442, 0.9867294, 1, 0, 0.007843138, 1
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
0.1665525, -4.126019, -7.840992, 0, -0.5, 0.5, 0.5,
0.1665525, -4.126019, -7.840992, 1, -0.5, 0.5, 0.5,
0.1665525, -4.126019, -7.840992, 1, 1.5, 0.5, 0.5,
0.1665525, -4.126019, -7.840992, 0, 1.5, 0.5, 0.5
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
-4.077337, 0.6167384, -7.840992, 0, -0.5, 0.5, 0.5,
-4.077337, 0.6167384, -7.840992, 1, -0.5, 0.5, 0.5,
-4.077337, 0.6167384, -7.840992, 1, 1.5, 0.5, 0.5,
-4.077337, 0.6167384, -7.840992, 0, 1.5, 0.5, 0.5
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
-4.077337, -4.126019, 0.2876551, 0, -0.5, 0.5, 0.5,
-4.077337, -4.126019, 0.2876551, 1, -0.5, 0.5, 0.5,
-4.077337, -4.126019, 0.2876551, 1, 1.5, 0.5, 0.5,
-4.077337, -4.126019, 0.2876551, 0, 1.5, 0.5, 0.5
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
-3, -3.031537, -5.96515,
3, -3.031537, -5.96515,
-3, -3.031537, -5.96515,
-3, -3.213951, -6.277791,
-2, -3.031537, -5.96515,
-2, -3.213951, -6.277791,
-1, -3.031537, -5.96515,
-1, -3.213951, -6.277791,
0, -3.031537, -5.96515,
0, -3.213951, -6.277791,
1, -3.031537, -5.96515,
1, -3.213951, -6.277791,
2, -3.031537, -5.96515,
2, -3.213951, -6.277791,
3, -3.031537, -5.96515,
3, -3.213951, -6.277791
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
-3, -3.578778, -6.903071, 0, -0.5, 0.5, 0.5,
-3, -3.578778, -6.903071, 1, -0.5, 0.5, 0.5,
-3, -3.578778, -6.903071, 1, 1.5, 0.5, 0.5,
-3, -3.578778, -6.903071, 0, 1.5, 0.5, 0.5,
-2, -3.578778, -6.903071, 0, -0.5, 0.5, 0.5,
-2, -3.578778, -6.903071, 1, -0.5, 0.5, 0.5,
-2, -3.578778, -6.903071, 1, 1.5, 0.5, 0.5,
-2, -3.578778, -6.903071, 0, 1.5, 0.5, 0.5,
-1, -3.578778, -6.903071, 0, -0.5, 0.5, 0.5,
-1, -3.578778, -6.903071, 1, -0.5, 0.5, 0.5,
-1, -3.578778, -6.903071, 1, 1.5, 0.5, 0.5,
-1, -3.578778, -6.903071, 0, 1.5, 0.5, 0.5,
0, -3.578778, -6.903071, 0, -0.5, 0.5, 0.5,
0, -3.578778, -6.903071, 1, -0.5, 0.5, 0.5,
0, -3.578778, -6.903071, 1, 1.5, 0.5, 0.5,
0, -3.578778, -6.903071, 0, 1.5, 0.5, 0.5,
1, -3.578778, -6.903071, 0, -0.5, 0.5, 0.5,
1, -3.578778, -6.903071, 1, -0.5, 0.5, 0.5,
1, -3.578778, -6.903071, 1, 1.5, 0.5, 0.5,
1, -3.578778, -6.903071, 0, 1.5, 0.5, 0.5,
2, -3.578778, -6.903071, 0, -0.5, 0.5, 0.5,
2, -3.578778, -6.903071, 1, -0.5, 0.5, 0.5,
2, -3.578778, -6.903071, 1, 1.5, 0.5, 0.5,
2, -3.578778, -6.903071, 0, 1.5, 0.5, 0.5,
3, -3.578778, -6.903071, 0, -0.5, 0.5, 0.5,
3, -3.578778, -6.903071, 1, -0.5, 0.5, 0.5,
3, -3.578778, -6.903071, 1, 1.5, 0.5, 0.5,
3, -3.578778, -6.903071, 0, 1.5, 0.5, 0.5
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
-3.097978, -2, -5.96515,
-3.097978, 4, -5.96515,
-3.097978, -2, -5.96515,
-3.261204, -2, -6.277791,
-3.097978, 0, -5.96515,
-3.261204, 0, -6.277791,
-3.097978, 2, -5.96515,
-3.261204, 2, -6.277791,
-3.097978, 4, -5.96515,
-3.261204, 4, -6.277791
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
"0",
"2",
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
-3.587657, -2, -6.903071, 0, -0.5, 0.5, 0.5,
-3.587657, -2, -6.903071, 1, -0.5, 0.5, 0.5,
-3.587657, -2, -6.903071, 1, 1.5, 0.5, 0.5,
-3.587657, -2, -6.903071, 0, 1.5, 0.5, 0.5,
-3.587657, 0, -6.903071, 0, -0.5, 0.5, 0.5,
-3.587657, 0, -6.903071, 1, -0.5, 0.5, 0.5,
-3.587657, 0, -6.903071, 1, 1.5, 0.5, 0.5,
-3.587657, 0, -6.903071, 0, 1.5, 0.5, 0.5,
-3.587657, 2, -6.903071, 0, -0.5, 0.5, 0.5,
-3.587657, 2, -6.903071, 1, -0.5, 0.5, 0.5,
-3.587657, 2, -6.903071, 1, 1.5, 0.5, 0.5,
-3.587657, 2, -6.903071, 0, 1.5, 0.5, 0.5,
-3.587657, 4, -6.903071, 0, -0.5, 0.5, 0.5,
-3.587657, 4, -6.903071, 1, -0.5, 0.5, 0.5,
-3.587657, 4, -6.903071, 1, 1.5, 0.5, 0.5,
-3.587657, 4, -6.903071, 0, 1.5, 0.5, 0.5
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
-3.097978, -3.031537, -4,
-3.097978, -3.031537, 6,
-3.097978, -3.031537, -4,
-3.261204, -3.213951, -4,
-3.097978, -3.031537, -2,
-3.261204, -3.213951, -2,
-3.097978, -3.031537, 0,
-3.261204, -3.213951, 0,
-3.097978, -3.031537, 2,
-3.261204, -3.213951, 2,
-3.097978, -3.031537, 4,
-3.261204, -3.213951, 4,
-3.097978, -3.031537, 6,
-3.261204, -3.213951, 6
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
-3.587657, -3.578778, -4, 0, -0.5, 0.5, 0.5,
-3.587657, -3.578778, -4, 1, -0.5, 0.5, 0.5,
-3.587657, -3.578778, -4, 1, 1.5, 0.5, 0.5,
-3.587657, -3.578778, -4, 0, 1.5, 0.5, 0.5,
-3.587657, -3.578778, -2, 0, -0.5, 0.5, 0.5,
-3.587657, -3.578778, -2, 1, -0.5, 0.5, 0.5,
-3.587657, -3.578778, -2, 1, 1.5, 0.5, 0.5,
-3.587657, -3.578778, -2, 0, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 0, 0, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 0, 1, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 0, 1, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 0, 0, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 2, 0, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 2, 1, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 2, 1, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 2, 0, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 4, 0, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 4, 1, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 4, 1, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 4, 0, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 6, 0, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 6, 1, -0.5, 0.5, 0.5,
-3.587657, -3.578778, 6, 1, 1.5, 0.5, 0.5,
-3.587657, -3.578778, 6, 0, 1.5, 0.5, 0.5
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
-3.097978, -3.031537, -5.96515,
-3.097978, 4.265014, -5.96515,
-3.097978, -3.031537, 6.540461,
-3.097978, 4.265014, 6.540461,
-3.097978, -3.031537, -5.96515,
-3.097978, -3.031537, 6.540461,
-3.097978, 4.265014, -5.96515,
-3.097978, 4.265014, 6.540461,
-3.097978, -3.031537, -5.96515,
3.431083, -3.031537, -5.96515,
-3.097978, -3.031537, 6.540461,
3.431083, -3.031537, 6.540461,
-3.097978, 4.265014, -5.96515,
3.431083, 4.265014, -5.96515,
-3.097978, 4.265014, 6.540461,
3.431083, 4.265014, 6.540461,
3.431083, -3.031537, -5.96515,
3.431083, 4.265014, -5.96515,
3.431083, -3.031537, 6.540461,
3.431083, 4.265014, 6.540461,
3.431083, -3.031537, -5.96515,
3.431083, -3.031537, 6.540461,
3.431083, 4.265014, -5.96515,
3.431083, 4.265014, 6.540461
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
var radius = 8.481027;
var distance = 37.73305;
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
mvMatrix.translate( -0.1665525, -0.6167384, -0.2876551 );
mvMatrix.scale( 1.404467, 1.256738, 0.733259 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -37.73305);
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
metamitron<-read.table("metamitron.xyz")
```

```
## Error in read.table("metamitron.xyz"): no lines available in input
```

```r
x<-metamitron$V2
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
```

```r
y<-metamitron$V3
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
```

```r
z<-metamitron$V4
```

```
## Error in eval(expr, envir, enclos): object 'metamitron' not found
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
-3.002894, 1.390595, -1.693018, 0, 0, 1, 1, 1,
-2.845221, -0.9539571, -3.781834, 1, 0, 0, 1, 1,
-2.783458, -0.05866896, -2.556965, 1, 0, 0, 1, 1,
-2.551954, -0.4278355, -0.9533471, 1, 0, 0, 1, 1,
-2.441564, -0.5024645, -2.062371, 1, 0, 0, 1, 1,
-2.395907, -0.8173608, -1.230627, 1, 0, 0, 1, 1,
-2.392908, 0.9592211, -0.6774691, 0, 0, 0, 1, 1,
-2.326358, 1.358818, -2.007628, 0, 0, 0, 1, 1,
-2.326298, 0.8995447, -0.9494143, 0, 0, 0, 1, 1,
-2.326292, 0.4697663, -1.364, 0, 0, 0, 1, 1,
-2.300485, 0.1567911, -0.8374032, 0, 0, 0, 1, 1,
-2.29623, 0.3877079, -2.166246, 0, 0, 0, 1, 1,
-2.178882, -0.4954623, -1.845143, 0, 0, 0, 1, 1,
-2.152093, -0.2541447, 0.7740904, 1, 1, 1, 1, 1,
-2.13203, -0.9944161, -0.4375243, 1, 1, 1, 1, 1,
-2.083907, -0.6187757, -2.651047, 1, 1, 1, 1, 1,
-2.028992, -0.2187436, -0.003030644, 1, 1, 1, 1, 1,
-1.991356, -0.9547461, -1.276934, 1, 1, 1, 1, 1,
-1.949433, 0.0527376, -0.855459, 1, 1, 1, 1, 1,
-1.944418, -1.098435, -4.475928, 1, 1, 1, 1, 1,
-1.936296, 0.3288904, -0.5597059, 1, 1, 1, 1, 1,
-1.920805, 0.9862, -1.1681, 1, 1, 1, 1, 1,
-1.919556, -0.5109955, -1.213465, 1, 1, 1, 1, 1,
-1.903973, 0.8951121, 0.1613028, 1, 1, 1, 1, 1,
-1.887172, 0.7548277, -0.6062041, 1, 1, 1, 1, 1,
-1.875789, 0.427323, -0.8272893, 1, 1, 1, 1, 1,
-1.862268, 0.8777593, -0.7176681, 1, 1, 1, 1, 1,
-1.858809, 0.881386, -0.1355206, 1, 1, 1, 1, 1,
-1.856824, -0.325216, -1.6417, 0, 0, 1, 1, 1,
-1.846868, -0.3430325, -1.443255, 1, 0, 0, 1, 1,
-1.846379, -1.193413, -0.6267287, 1, 0, 0, 1, 1,
-1.835005, -0.7423532, -1.448624, 1, 0, 0, 1, 1,
-1.828762, 0.05306124, -2.780288, 1, 0, 0, 1, 1,
-1.826926, 2.223478, -0.356434, 1, 0, 0, 1, 1,
-1.816689, -0.0438963, -0.04737186, 0, 0, 0, 1, 1,
-1.815752, -0.4342771, -2.75245, 0, 0, 0, 1, 1,
-1.814103, 0.9602286, -0.4309792, 0, 0, 0, 1, 1,
-1.798089, 0.460917, -1.462799, 0, 0, 0, 1, 1,
-1.767519, 0.4254982, -0.2330364, 0, 0, 0, 1, 1,
-1.763918, -0.3224237, -3.51857, 0, 0, 0, 1, 1,
-1.756103, -1.242625, -3.688879, 0, 0, 0, 1, 1,
-1.74689, 1.463021, -2.712333, 1, 1, 1, 1, 1,
-1.745255, 0.381181, 0.5831501, 1, 1, 1, 1, 1,
-1.725996, -1.099054, -3.950953, 1, 1, 1, 1, 1,
-1.71913, 0.3242907, -1.510488, 1, 1, 1, 1, 1,
-1.696323, -1.720515, -0.5085573, 1, 1, 1, 1, 1,
-1.695254, -0.03848787, -1.747454, 1, 1, 1, 1, 1,
-1.681206, -1.028876, -0.6764953, 1, 1, 1, 1, 1,
-1.667601, 0.2373594, -2.603535, 1, 1, 1, 1, 1,
-1.655458, -0.551475, -0.4285569, 1, 1, 1, 1, 1,
-1.650841, 1.437155, -1.037788, 1, 1, 1, 1, 1,
-1.627596, 0.4579447, -2.934801, 1, 1, 1, 1, 1,
-1.622381, -0.1003726, -2.38653, 1, 1, 1, 1, 1,
-1.590425, -0.2570748, -1.992361, 1, 1, 1, 1, 1,
-1.578077, 0.3033422, -2.571091, 1, 1, 1, 1, 1,
-1.570985, 0.6911235, -2.072937, 1, 1, 1, 1, 1,
-1.567581, 0.7937477, -1.219112, 0, 0, 1, 1, 1,
-1.565865, -0.5224975, -0.7126226, 1, 0, 0, 1, 1,
-1.563978, -1.088633, -2.88869, 1, 0, 0, 1, 1,
-1.562573, -0.611127, -3.052599, 1, 0, 0, 1, 1,
-1.558683, -0.01646194, 0.7350941, 1, 0, 0, 1, 1,
-1.532704, -0.5834167, -3.33531, 1, 0, 0, 1, 1,
-1.529018, 0.7947134, -3.669744, 0, 0, 0, 1, 1,
-1.523137, 0.8434696, -1.702109, 0, 0, 0, 1, 1,
-1.521918, 0.9962475, 0.1113845, 0, 0, 0, 1, 1,
-1.489399, 0.8036535, -2.268064, 0, 0, 0, 1, 1,
-1.481703, -0.288186, -1.896208, 0, 0, 0, 1, 1,
-1.46123, 0.2969095, -3.423421, 0, 0, 0, 1, 1,
-1.458733, 0.1476952, -1.00209, 0, 0, 0, 1, 1,
-1.451166, -0.1318226, -3.229125, 1, 1, 1, 1, 1,
-1.447232, -0.5900721, -2.533161, 1, 1, 1, 1, 1,
-1.445432, -0.7684801, -2.421093, 1, 1, 1, 1, 1,
-1.441517, -0.1154246, -0.540857, 1, 1, 1, 1, 1,
-1.440304, 0.3427891, -1.606271, 1, 1, 1, 1, 1,
-1.437558, 1.822002, -1.37716, 1, 1, 1, 1, 1,
-1.422859, -0.3037699, -2.186126, 1, 1, 1, 1, 1,
-1.415872, 1.825034, -1.104707, 1, 1, 1, 1, 1,
-1.392754, -0.5377403, -1.406471, 1, 1, 1, 1, 1,
-1.373709, -0.1842061, -2.207429, 1, 1, 1, 1, 1,
-1.37244, -0.8973014, -2.390775, 1, 1, 1, 1, 1,
-1.370495, -0.9791481, -2.147169, 1, 1, 1, 1, 1,
-1.359872, 1.066478, -2.399721, 1, 1, 1, 1, 1,
-1.344157, 0.6327028, -0.325098, 1, 1, 1, 1, 1,
-1.341632, 0.1444964, -1.515227, 1, 1, 1, 1, 1,
-1.340034, -1.46523, -0.1213623, 0, 0, 1, 1, 1,
-1.336202, 1.172371, 0.307437, 1, 0, 0, 1, 1,
-1.334115, -0.09725314, -1.859476, 1, 0, 0, 1, 1,
-1.333229, 0.9298888, -2.02228, 1, 0, 0, 1, 1,
-1.325612, 3.103283, 1.311312, 1, 0, 0, 1, 1,
-1.325098, 0.2465511, -2.008528, 1, 0, 0, 1, 1,
-1.308797, -0.7291914, -2.531597, 0, 0, 0, 1, 1,
-1.298774, -0.2264425, -1.048085, 0, 0, 0, 1, 1,
-1.290551, -0.1065131, -2.376616, 0, 0, 0, 1, 1,
-1.284707, 0.6285318, -2.335456, 0, 0, 0, 1, 1,
-1.283573, 0.5439132, -1.749339, 0, 0, 0, 1, 1,
-1.273037, -1.187569, -3.365479, 0, 0, 0, 1, 1,
-1.270984, -0.3630044, -2.31318, 0, 0, 0, 1, 1,
-1.268734, -1.357124, -2.879121, 1, 1, 1, 1, 1,
-1.254819, 0.2146428, -0.3056757, 1, 1, 1, 1, 1,
-1.252351, -1.565932, -3.075177, 1, 1, 1, 1, 1,
-1.25138, -1.257544, -3.683716, 1, 1, 1, 1, 1,
-1.248362, -0.2189085, -2.316723, 1, 1, 1, 1, 1,
-1.236589, 3.217683, 0.0545883, 1, 1, 1, 1, 1,
-1.235357, -1.620243, -2.355415, 1, 1, 1, 1, 1,
-1.230968, -0.2525809, -1.551022, 1, 1, 1, 1, 1,
-1.224191, 1.361847, -1.729787, 1, 1, 1, 1, 1,
-1.216673, 0.743673, -1.499329, 1, 1, 1, 1, 1,
-1.215431, -0.6789578, -2.18313, 1, 1, 1, 1, 1,
-1.212362, 0.05538972, -1.674529, 1, 1, 1, 1, 1,
-1.207221, -0.9431449, -2.522876, 1, 1, 1, 1, 1,
-1.203872, -0.7908783, -2.206089, 1, 1, 1, 1, 1,
-1.199292, 0.5246444, -1.072464, 1, 1, 1, 1, 1,
-1.199082, 0.7466766, 0.6771484, 0, 0, 1, 1, 1,
-1.19285, -0.6615292, -2.12631, 1, 0, 0, 1, 1,
-1.172713, 0.08777206, -0.6306614, 1, 0, 0, 1, 1,
-1.168849, -2.146427, -3.606321, 1, 0, 0, 1, 1,
-1.168661, 0.06904567, -1.614371, 1, 0, 0, 1, 1,
-1.166641, 0.4949983, -1.951284, 1, 0, 0, 1, 1,
-1.161792, 0.4177002, -2.145574, 0, 0, 0, 1, 1,
-1.152942, 0.2698577, -1.265462, 0, 0, 0, 1, 1,
-1.150706, -0.811855, -2.896013, 0, 0, 0, 1, 1,
-1.139989, 1.327571, -0.4913044, 0, 0, 0, 1, 1,
-1.134838, -1.12721, -0.8713406, 0, 0, 0, 1, 1,
-1.131321, -0.7516438, -1.492168, 0, 0, 0, 1, 1,
-1.12948, 0.2477867, -0.3738799, 0, 0, 0, 1, 1,
-1.129367, -0.5898129, -1.546176, 1, 1, 1, 1, 1,
-1.123411, 0.4439059, 0.8342118, 1, 1, 1, 1, 1,
-1.120528, -0.8870949, -3.279105, 1, 1, 1, 1, 1,
-1.118885, -0.9730778, 0.1171747, 1, 1, 1, 1, 1,
-1.11553, 1.250286, -0.05151055, 1, 1, 1, 1, 1,
-1.115471, -0.4051875, -3.355958, 1, 1, 1, 1, 1,
-1.108689, -0.3995371, -1.318541, 1, 1, 1, 1, 1,
-1.10728, -1.780272, -2.093673, 1, 1, 1, 1, 1,
-1.107244, -1.266343, -1.790352, 1, 1, 1, 1, 1,
-1.101034, 0.3234558, -0.03559886, 1, 1, 1, 1, 1,
-1.097424, -0.2174561, -1.312192, 1, 1, 1, 1, 1,
-1.093421, 0.03338313, 0.3190002, 1, 1, 1, 1, 1,
-1.083754, 0.2877214, -0.8605713, 1, 1, 1, 1, 1,
-1.081106, 0.512689, -1.952633, 1, 1, 1, 1, 1,
-1.075486, -0.2718537, -0.744757, 1, 1, 1, 1, 1,
-1.06723, -0.666391, -0.5385849, 0, 0, 1, 1, 1,
-1.064419, -0.7731086, -3.298195, 1, 0, 0, 1, 1,
-1.058469, -0.1437766, -2.856937, 1, 0, 0, 1, 1,
-1.055468, -0.2049494, 0.008344016, 1, 0, 0, 1, 1,
-1.050894, -0.168318, -1.520211, 1, 0, 0, 1, 1,
-1.041236, 2.093626, -1.669821, 1, 0, 0, 1, 1,
-1.028357, -0.8327463, -1.005229, 0, 0, 0, 1, 1,
-1.027969, 0.5360393, -2.116418, 0, 0, 0, 1, 1,
-1.026922, 0.2521935, -0.9445418, 0, 0, 0, 1, 1,
-1.025662, -0.7261313, -1.761937, 0, 0, 0, 1, 1,
-1.013755, 0.700448, 0.5715639, 0, 0, 0, 1, 1,
-1.010797, 0.45473, -0.7933508, 0, 0, 0, 1, 1,
-1.003568, 1.288889, -2.131152, 0, 0, 0, 1, 1,
-0.97853, -0.1323184, -1.754652, 1, 1, 1, 1, 1,
-0.9676967, 0.3842064, -0.8216303, 1, 1, 1, 1, 1,
-0.9643416, 0.2061391, 0.1472888, 1, 1, 1, 1, 1,
-0.9629017, -0.9269866, -2.582662, 1, 1, 1, 1, 1,
-0.9624433, -1.490524, -4.498621, 1, 1, 1, 1, 1,
-0.9604331, -0.09632708, -0.4003259, 1, 1, 1, 1, 1,
-0.9428675, -0.9212841, -1.402363, 1, 1, 1, 1, 1,
-0.9412006, 0.9305709, 0.5816076, 1, 1, 1, 1, 1,
-0.9377149, 0.2772593, -1.117289, 1, 1, 1, 1, 1,
-0.9265704, -1.060062, -1.516937, 1, 1, 1, 1, 1,
-0.923406, 0.7939166, -0.601131, 1, 1, 1, 1, 1,
-0.913359, 0.2428449, -0.1012415, 1, 1, 1, 1, 1,
-0.9052191, 1.658764, -0.8134803, 1, 1, 1, 1, 1,
-0.90391, -0.4915889, -3.11067, 1, 1, 1, 1, 1,
-0.8986938, 1.644402, -1.598324, 1, 1, 1, 1, 1,
-0.8981491, -0.5670155, -0.2259637, 0, 0, 1, 1, 1,
-0.8973386, 0.8179019, -1.55261, 1, 0, 0, 1, 1,
-0.8970066, -0.7109905, -0.5085017, 1, 0, 0, 1, 1,
-0.8929079, 0.9495294, -1.269219, 1, 0, 0, 1, 1,
-0.8923575, 0.6221034, -1.390626, 1, 0, 0, 1, 1,
-0.8909672, -0.4687634, -1.52642, 1, 0, 0, 1, 1,
-0.8896848, -2.043213, -3.816133, 0, 0, 0, 1, 1,
-0.8880708, -0.4054065, -0.9963368, 0, 0, 0, 1, 1,
-0.8877938, -0.1808356, -2.492646, 0, 0, 0, 1, 1,
-0.88737, 0.5966319, -1.128571, 0, 0, 0, 1, 1,
-0.8872104, 0.370682, -0.5142866, 0, 0, 0, 1, 1,
-0.8851189, 1.157631, -1.191851, 0, 0, 0, 1, 1,
-0.8846577, -0.7238961, -1.288579, 0, 0, 0, 1, 1,
-0.8802221, 1.683664, 0.7011686, 1, 1, 1, 1, 1,
-0.8769049, 0.2035851, -1.557785, 1, 1, 1, 1, 1,
-0.8714877, 1.219648, 0.1149289, 1, 1, 1, 1, 1,
-0.8652227, -0.07815207, -2.821577, 1, 1, 1, 1, 1,
-0.8649716, 0.4866484, -2.110003, 1, 1, 1, 1, 1,
-0.8624766, 0.1531617, -0.1868092, 1, 1, 1, 1, 1,
-0.8609785, 1.892761, -1.076421, 1, 1, 1, 1, 1,
-0.8578941, -0.09888244, -0.3203831, 1, 1, 1, 1, 1,
-0.852387, 0.7801451, -0.5849828, 1, 1, 1, 1, 1,
-0.8506299, 1.060264, -1.394478, 1, 1, 1, 1, 1,
-0.8438357, -0.1051698, -1.935942, 1, 1, 1, 1, 1,
-0.8430873, 1.129398, -0.5927889, 1, 1, 1, 1, 1,
-0.8416862, -1.425021, -1.62146, 1, 1, 1, 1, 1,
-0.8402624, 1.215463, 0.1964904, 1, 1, 1, 1, 1,
-0.832517, -1.466382, -2.980188, 1, 1, 1, 1, 1,
-0.8294834, -0.1627134, -1.238387, 0, 0, 1, 1, 1,
-0.824717, 0.6844215, -0.4754497, 1, 0, 0, 1, 1,
-0.8203509, 0.853767, 1.382148, 1, 0, 0, 1, 1,
-0.8130705, -0.3187659, -2.26388, 1, 0, 0, 1, 1,
-0.8105624, -2.53338, -1.981589, 1, 0, 0, 1, 1,
-0.8081645, 1.94514, -0.01832174, 1, 0, 0, 1, 1,
-0.7967722, 0.2686291, -0.9636738, 0, 0, 0, 1, 1,
-0.7955447, 0.8652505, -0.904204, 0, 0, 0, 1, 1,
-0.7954342, 0.4059012, -2.384026, 0, 0, 0, 1, 1,
-0.7940212, 0.4971347, 0.9299718, 0, 0, 0, 1, 1,
-0.7923309, 0.02307736, -1.689546, 0, 0, 0, 1, 1,
-0.7871664, 1.394384, -1.394902, 0, 0, 0, 1, 1,
-0.7870045, 0.1223703, -0.6225845, 0, 0, 0, 1, 1,
-0.7868258, -0.4949699, -2.347975, 1, 1, 1, 1, 1,
-0.7856652, -0.4142527, -2.436229, 1, 1, 1, 1, 1,
-0.7819993, 0.6277036, 0.6036856, 1, 1, 1, 1, 1,
-0.7783287, -0.1613709, 0.8705326, 1, 1, 1, 1, 1,
-0.7757388, 0.1687943, -0.1012107, 1, 1, 1, 1, 1,
-0.7737266, -1.693893, -2.717511, 1, 1, 1, 1, 1,
-0.7658333, 1.281758, 0.4300485, 1, 1, 1, 1, 1,
-0.7451114, -0.06042717, -3.011341, 1, 1, 1, 1, 1,
-0.738174, 0.9688846, -1.440229, 1, 1, 1, 1, 1,
-0.7362253, -1.817707, -3.474149, 1, 1, 1, 1, 1,
-0.730509, 1.134698, -1.473693, 1, 1, 1, 1, 1,
-0.7259004, 0.3851137, -1.782076, 1, 1, 1, 1, 1,
-0.7257503, -1.414455, -2.791812, 1, 1, 1, 1, 1,
-0.7241889, -1.681174, -1.859012, 1, 1, 1, 1, 1,
-0.7092693, 0.612479, -0.8097664, 1, 1, 1, 1, 1,
-0.7067257, -0.5524077, -1.130257, 0, 0, 1, 1, 1,
-0.7015895, -0.2112247, -2.522921, 1, 0, 0, 1, 1,
-0.7013646, 0.07685558, -1.072439, 1, 0, 0, 1, 1,
-0.701169, 1.230498, -1.029205, 1, 0, 0, 1, 1,
-0.7006692, 2.347458, -1.566355, 1, 0, 0, 1, 1,
-0.6970986, 0.1063643, -1.936871, 1, 0, 0, 1, 1,
-0.6969689, 0.1544442, -1.502605, 0, 0, 0, 1, 1,
-0.696643, 0.9643399, -1.804832, 0, 0, 0, 1, 1,
-0.6935382, 0.3595068, -3.038767, 0, 0, 0, 1, 1,
-0.6875682, 0.326523, -1.625956, 0, 0, 0, 1, 1,
-0.6854565, -0.5992516, -2.061024, 0, 0, 0, 1, 1,
-0.6840056, -0.4581361, -2.260672, 0, 0, 0, 1, 1,
-0.6812617, 1.06837, -2.359219, 0, 0, 0, 1, 1,
-0.6805565, 0.5944731, 0.4218189, 1, 1, 1, 1, 1,
-0.680548, -1.27464, -2.550108, 1, 1, 1, 1, 1,
-0.6801428, -1.423978, -2.111198, 1, 1, 1, 1, 1,
-0.6793241, -1.960526, -4.130523, 1, 1, 1, 1, 1,
-0.6788301, -0.1340511, -0.6865353, 1, 1, 1, 1, 1,
-0.6713585, 0.07274285, -1.296622, 1, 1, 1, 1, 1,
-0.6700897, 0.8662747, -1.756379, 1, 1, 1, 1, 1,
-0.6691104, -2.925277, -2.585778, 1, 1, 1, 1, 1,
-0.6676957, 1.825018, -0.9578924, 1, 1, 1, 1, 1,
-0.6675211, 0.744814, -1.338255, 1, 1, 1, 1, 1,
-0.6661428, -0.4763848, -1.831437, 1, 1, 1, 1, 1,
-0.6588436, -1.674752, -2.06035, 1, 1, 1, 1, 1,
-0.6569207, 0.604093, -0.8221418, 1, 1, 1, 1, 1,
-0.653843, -0.2287912, -2.866711, 1, 1, 1, 1, 1,
-0.6533257, -0.05999928, -1.101014, 1, 1, 1, 1, 1,
-0.6528537, 1.438211, 0.9755489, 0, 0, 1, 1, 1,
-0.651774, -1.305333, -1.154085, 1, 0, 0, 1, 1,
-0.6507683, 1.519311, -1.396064, 1, 0, 0, 1, 1,
-0.6459165, -0.2339111, -1.367068, 1, 0, 0, 1, 1,
-0.6444504, -0.1187005, -0.7802855, 1, 0, 0, 1, 1,
-0.6377514, 0.5374611, -1.2646, 1, 0, 0, 1, 1,
-0.6330453, -1.441322, -4.225145, 0, 0, 0, 1, 1,
-0.6319159, -0.6322885, -2.285977, 0, 0, 0, 1, 1,
-0.6318672, 0.5523682, -0.2328355, 0, 0, 0, 1, 1,
-0.6309624, -0.268721, -0.8427837, 0, 0, 0, 1, 1,
-0.6277021, 0.06277999, 0.1582288, 0, 0, 0, 1, 1,
-0.623013, 0.09574383, -1.707492, 0, 0, 0, 1, 1,
-0.6157182, 0.1045838, -2.28429, 0, 0, 0, 1, 1,
-0.609545, 0.3598756, -0.4647144, 1, 1, 1, 1, 1,
-0.6093639, 0.4754778, -0.2942785, 1, 1, 1, 1, 1,
-0.6072336, 0.5980714, -0.6097735, 1, 1, 1, 1, 1,
-0.6055958, 0.2021619, -1.424317, 1, 1, 1, 1, 1,
-0.5987291, -0.8339896, -2.652357, 1, 1, 1, 1, 1,
-0.5968437, -0.7619424, -4.008636, 1, 1, 1, 1, 1,
-0.592446, 1.911119, 0.2393351, 1, 1, 1, 1, 1,
-0.589948, 0.2902914, -1.950172, 1, 1, 1, 1, 1,
-0.5873621, 1.555937, -2.924114, 1, 1, 1, 1, 1,
-0.5813147, 0.2169897, -2.720409, 1, 1, 1, 1, 1,
-0.5807902, 0.4131967, -1.131418, 1, 1, 1, 1, 1,
-0.5805786, -0.592492, -1.061223, 1, 1, 1, 1, 1,
-0.5804403, -1.242033, -2.688913, 1, 1, 1, 1, 1,
-0.5717303, 1.500905, 0.9105422, 1, 1, 1, 1, 1,
-0.5714335, -0.1060026, -0.3828168, 1, 1, 1, 1, 1,
-0.5708306, 0.07436282, -2.420618, 0, 0, 1, 1, 1,
-0.5625346, 0.08182544, -0.3383079, 1, 0, 0, 1, 1,
-0.5613565, 1.638311, -1.055781, 1, 0, 0, 1, 1,
-0.5596995, 0.8969879, -2.486362, 1, 0, 0, 1, 1,
-0.5554724, -1.375127, -2.260353, 1, 0, 0, 1, 1,
-0.5546498, 1.193141, -0.9411831, 1, 0, 0, 1, 1,
-0.5531879, -0.1436009, 0.141615, 0, 0, 0, 1, 1,
-0.5525711, 0.7921486, -2.401386, 0, 0, 0, 1, 1,
-0.549428, 1.965, -0.1116347, 0, 0, 0, 1, 1,
-0.5489611, 1.350354, -0.413123, 0, 0, 0, 1, 1,
-0.5462914, 2.071789, -1.289706, 0, 0, 0, 1, 1,
-0.5462227, -0.6247585, -1.56429, 0, 0, 0, 1, 1,
-0.5391946, -0.8978009, -2.791459, 0, 0, 0, 1, 1,
-0.5354706, -0.2885293, -2.177728, 1, 1, 1, 1, 1,
-0.5332222, -0.07803138, -1.063726, 1, 1, 1, 1, 1,
-0.530853, 0.2659976, -0.84041, 1, 1, 1, 1, 1,
-0.5294331, 0.5524337, 0.5151599, 1, 1, 1, 1, 1,
-0.5287591, -0.9014069, -2.152695, 1, 1, 1, 1, 1,
-0.5272214, 0.5307492, -0.3129055, 1, 1, 1, 1, 1,
-0.5237817, 0.625935, -0.5949721, 1, 1, 1, 1, 1,
-0.523535, 0.4994075, -1.201911, 1, 1, 1, 1, 1,
-0.5184838, -1.78047, -3.786705, 1, 1, 1, 1, 1,
-0.5184281, 0.9641587, -0.6849804, 1, 1, 1, 1, 1,
-0.5130579, -0.4740105, -0.6858809, 1, 1, 1, 1, 1,
-0.5075048, -0.7441676, -1.975806, 1, 1, 1, 1, 1,
-0.5067257, 1.405958, -1.680541, 1, 1, 1, 1, 1,
-0.5058416, 1.241768, -0.5471593, 1, 1, 1, 1, 1,
-0.5054267, -0.1665591, -2.967207, 1, 1, 1, 1, 1,
-0.5039619, -0.7325136, -0.7981841, 0, 0, 1, 1, 1,
-0.5010951, 1.152701, -1.401776, 1, 0, 0, 1, 1,
-0.496289, 4.158753, 0.2054541, 1, 0, 0, 1, 1,
-0.4962056, 0.01981654, -0.8960372, 1, 0, 0, 1, 1,
-0.4951754, 0.8894403, 0.4718183, 1, 0, 0, 1, 1,
-0.4911279, -1.317588, -2.408688, 1, 0, 0, 1, 1,
-0.4906072, -0.2805064, -1.821079, 0, 0, 0, 1, 1,
-0.4878769, 0.5560167, -0.4039647, 0, 0, 0, 1, 1,
-0.4854036, -1.134763, -3.651361, 0, 0, 0, 1, 1,
-0.4823451, -0.9383861, -2.955913, 0, 0, 0, 1, 1,
-0.481654, -0.6233885, -4.123806, 0, 0, 0, 1, 1,
-0.4809642, 0.3934332, -1.849259, 0, 0, 0, 1, 1,
-0.4752279, 0.936846, -1.971061, 0, 0, 0, 1, 1,
-0.4736373, 1.411, 1.16224, 1, 1, 1, 1, 1,
-0.4717795, 0.4883223, 0.1484772, 1, 1, 1, 1, 1,
-0.4683956, 0.6783463, -1.098265, 1, 1, 1, 1, 1,
-0.4663196, -0.01480836, -0.8645679, 1, 1, 1, 1, 1,
-0.4658355, -0.6126972, -1.915949, 1, 1, 1, 1, 1,
-0.4643168, -1.558482, -3.307583, 1, 1, 1, 1, 1,
-0.4621027, 0.7884634, -0.2391351, 1, 1, 1, 1, 1,
-0.4603689, 0.8012459, 0.594713, 1, 1, 1, 1, 1,
-0.45493, -1.079073, -3.434318, 1, 1, 1, 1, 1,
-0.4536983, 1.698915, -0.7919183, 1, 1, 1, 1, 1,
-0.4455615, -0.2079605, -0.85905, 1, 1, 1, 1, 1,
-0.4426021, 0.2187555, -1.172774, 1, 1, 1, 1, 1,
-0.4406881, -0.9771697, -2.631801, 1, 1, 1, 1, 1,
-0.4397688, 0.4976021, -1.511082, 1, 1, 1, 1, 1,
-0.434925, 0.7292676, 0.1894979, 1, 1, 1, 1, 1,
-0.4339219, 0.1934595, -2.435894, 0, 0, 1, 1, 1,
-0.4305933, 1.444433, -1.16907, 1, 0, 0, 1, 1,
-0.4289055, 0.07420846, -2.40342, 1, 0, 0, 1, 1,
-0.4190199, 0.157482, -2.443156, 1, 0, 0, 1, 1,
-0.4168631, 0.6468171, 0.6298079, 1, 0, 0, 1, 1,
-0.4150674, 0.7010022, -0.8406373, 1, 0, 0, 1, 1,
-0.4125654, -0.5179328, -1.71699, 0, 0, 0, 1, 1,
-0.4105637, -1.320738, -3.33549, 0, 0, 0, 1, 1,
-0.409729, -0.7203317, -1.023076, 0, 0, 0, 1, 1,
-0.4014429, 1.434655, -0.6628829, 0, 0, 0, 1, 1,
-0.4013121, -1.623201, -2.816772, 0, 0, 0, 1, 1,
-0.3999861, 0.4810346, -1.051347, 0, 0, 0, 1, 1,
-0.3995758, -0.4425977, -0.9449897, 0, 0, 0, 1, 1,
-0.3986724, -0.4892976, -3.28144, 1, 1, 1, 1, 1,
-0.3943777, -0.9640533, -5.375684, 1, 1, 1, 1, 1,
-0.3909974, -1.535721, -2.409637, 1, 1, 1, 1, 1,
-0.3903939, 1.302841, -1.174933, 1, 1, 1, 1, 1,
-0.385859, -0.9169801, -2.768399, 1, 1, 1, 1, 1,
-0.3790033, 0.8476108, 0.02485709, 1, 1, 1, 1, 1,
-0.3771764, -1.254481, -3.067721, 1, 1, 1, 1, 1,
-0.3761549, -0.5531133, -2.679733, 1, 1, 1, 1, 1,
-0.375205, -0.2227633, -2.00394, 1, 1, 1, 1, 1,
-0.3742909, -1.656995, -2.482374, 1, 1, 1, 1, 1,
-0.3736406, -0.1766085, 0.06344803, 1, 1, 1, 1, 1,
-0.373535, -0.8644454, -2.422267, 1, 1, 1, 1, 1,
-0.3712077, 0.1706702, -0.09331806, 1, 1, 1, 1, 1,
-0.3689763, 0.5298797, -0.1447053, 1, 1, 1, 1, 1,
-0.3689236, -0.984257, -3.175579, 1, 1, 1, 1, 1,
-0.3677694, -1.928037, -1.57968, 0, 0, 1, 1, 1,
-0.3660425, -1.655858, -2.932729, 1, 0, 0, 1, 1,
-0.3660073, 0.05496893, -0.4823797, 1, 0, 0, 1, 1,
-0.3652497, 0.3806511, -1.862221, 1, 0, 0, 1, 1,
-0.3627999, 0.2136673, 0.3049456, 1, 0, 0, 1, 1,
-0.3606759, -1.285594, -1.274599, 1, 0, 0, 1, 1,
-0.3604641, -2.002519, -1.604648, 0, 0, 0, 1, 1,
-0.3591351, -0.2410392, -1.803285, 0, 0, 0, 1, 1,
-0.3497376, 1.18727, -0.6865897, 0, 0, 0, 1, 1,
-0.349429, 1.728597, -1.405706, 0, 0, 0, 1, 1,
-0.3483832, -0.07014758, -4.496698, 0, 0, 0, 1, 1,
-0.3453098, -1.415288, -0.7023379, 0, 0, 0, 1, 1,
-0.3444516, -0.6319326, -2.836344, 0, 0, 0, 1, 1,
-0.3431476, -1.541563, -4.357367, 1, 1, 1, 1, 1,
-0.3390795, -0.3912736, -0.6402447, 1, 1, 1, 1, 1,
-0.336906, -0.7624567, -3.030394, 1, 1, 1, 1, 1,
-0.3363581, -0.7897238, -1.904672, 1, 1, 1, 1, 1,
-0.3342141, -0.683148, -2.704038, 1, 1, 1, 1, 1,
-0.333709, -1.108593, -0.7497101, 1, 1, 1, 1, 1,
-0.3334783, 1.439132, -1.225151, 1, 1, 1, 1, 1,
-0.3289151, 1.940843, 0.2651025, 1, 1, 1, 1, 1,
-0.328229, 0.1802677, -1.390771, 1, 1, 1, 1, 1,
-0.32785, -1.321359, -1.971756, 1, 1, 1, 1, 1,
-0.3205793, -0.1011656, -2.536521, 1, 1, 1, 1, 1,
-0.3186696, 0.4546932, -0.4906774, 1, 1, 1, 1, 1,
-0.3150364, -0.2467127, -2.707982, 1, 1, 1, 1, 1,
-0.3143663, -0.04535327, -1.067191, 1, 1, 1, 1, 1,
-0.3141102, -0.3141659, -2.912957, 1, 1, 1, 1, 1,
-0.3116342, -0.2211806, -1.969893, 0, 0, 1, 1, 1,
-0.3103483, 0.5199687, -1.248223, 1, 0, 0, 1, 1,
-0.3094732, -1.735836, -3.158978, 1, 0, 0, 1, 1,
-0.2995428, 0.1161691, -0.7707275, 1, 0, 0, 1, 1,
-0.2961567, 1.23641, -0.9700608, 1, 0, 0, 1, 1,
-0.2953318, 0.3303917, -1.335483, 1, 0, 0, 1, 1,
-0.2943622, -0.08135691, -1.385604, 0, 0, 0, 1, 1,
-0.2841315, 0.4287992, 0.1682328, 0, 0, 0, 1, 1,
-0.2838541, 0.3596369, -1.878453, 0, 0, 0, 1, 1,
-0.2831974, -1.162413, -2.312287, 0, 0, 0, 1, 1,
-0.2821926, -0.2303768, -1.364027, 0, 0, 0, 1, 1,
-0.2727646, 0.8221205, -1.226809, 0, 0, 0, 1, 1,
-0.2712145, 0.2207415, 0.04737237, 0, 0, 0, 1, 1,
-0.2710692, 0.2046417, -0.3555938, 1, 1, 1, 1, 1,
-0.2704669, 0.4634739, -0.4735237, 1, 1, 1, 1, 1,
-0.2667945, 0.3410642, 0.6629426, 1, 1, 1, 1, 1,
-0.2662767, 0.3606833, -0.6378655, 1, 1, 1, 1, 1,
-0.2653795, -0.4062617, -3.230335, 1, 1, 1, 1, 1,
-0.264535, 1.56075, 0.7010732, 1, 1, 1, 1, 1,
-0.2596149, 0.1587828, -0.4199008, 1, 1, 1, 1, 1,
-0.2586035, 0.2572624, -0.03098194, 1, 1, 1, 1, 1,
-0.256908, -0.6185284, -3.057558, 1, 1, 1, 1, 1,
-0.2550277, -0.2656297, -1.715014, 1, 1, 1, 1, 1,
-0.2495206, -1.135434, -2.401465, 1, 1, 1, 1, 1,
-0.2477826, 0.4468617, 0.1778337, 1, 1, 1, 1, 1,
-0.2467758, -1.106663, -0.7398458, 1, 1, 1, 1, 1,
-0.2438604, 0.766426, 0.3636431, 1, 1, 1, 1, 1,
-0.2426519, -0.3676392, -1.889825, 1, 1, 1, 1, 1,
-0.2422341, 0.8537763, -1.468271, 0, 0, 1, 1, 1,
-0.2400139, -1.0859, -4.329593, 1, 0, 0, 1, 1,
-0.2381236, -0.8362798, -3.608305, 1, 0, 0, 1, 1,
-0.2304325, 0.7951574, 2.080574, 1, 0, 0, 1, 1,
-0.2235727, -0.1937428, -3.874431, 1, 0, 0, 1, 1,
-0.2228159, -0.9822379, -2.784329, 1, 0, 0, 1, 1,
-0.2210788, 1.365454, 1.838267, 0, 0, 0, 1, 1,
-0.2208871, 1.075684, -0.2199205, 0, 0, 0, 1, 1,
-0.2206193, 0.3769574, -0.1274982, 0, 0, 0, 1, 1,
-0.2174069, -0.07454949, -2.401067, 0, 0, 0, 1, 1,
-0.2166522, 0.3655988, -0.03628389, 0, 0, 0, 1, 1,
-0.2139783, 0.1108769, -1.058251, 0, 0, 0, 1, 1,
-0.2118882, -0.4940138, -2.15283, 0, 0, 0, 1, 1,
-0.2064939, -0.7614012, -3.817537, 1, 1, 1, 1, 1,
-0.2023297, 0.3189333, 0.2321971, 1, 1, 1, 1, 1,
-0.198307, 0.01273587, -2.106375, 1, 1, 1, 1, 1,
-0.1982817, 0.2392998, -1.317387, 1, 1, 1, 1, 1,
-0.1945501, 0.7405048, -0.7065606, 1, 1, 1, 1, 1,
-0.1931182, 0.2245362, -1.798637, 1, 1, 1, 1, 1,
-0.18863, -0.9494081, -3.882448, 1, 1, 1, 1, 1,
-0.1860275, -0.8617261, -2.413849, 1, 1, 1, 1, 1,
-0.1810996, -0.4181936, -3.801885, 1, 1, 1, 1, 1,
-0.1806276, 0.7237685, 0.4157094, 1, 1, 1, 1, 1,
-0.1801039, 0.7893467, 1.122768, 1, 1, 1, 1, 1,
-0.1793099, 0.8390066, 0.3225049, 1, 1, 1, 1, 1,
-0.1790207, 0.8898852, 0.2808178, 1, 1, 1, 1, 1,
-0.1754093, 0.008550159, -0.06427974, 1, 1, 1, 1, 1,
-0.1735513, 0.9598658, 0.3730252, 1, 1, 1, 1, 1,
-0.1729704, -0.2166899, -1.24387, 0, 0, 1, 1, 1,
-0.1665197, -0.8259605, -1.975021, 1, 0, 0, 1, 1,
-0.1654707, 0.6552707, -0.1019658, 1, 0, 0, 1, 1,
-0.1641192, -1.057377, -3.161753, 1, 0, 0, 1, 1,
-0.1570424, -0.9105359, -3.676208, 1, 0, 0, 1, 1,
-0.1545298, -0.656836, -3.294243, 1, 0, 0, 1, 1,
-0.151341, -0.3272761, -3.960258, 0, 0, 0, 1, 1,
-0.1509127, 1.333804, -0.04713966, 0, 0, 0, 1, 1,
-0.1490773, 0.2735782, -1.71105, 0, 0, 0, 1, 1,
-0.1482481, 0.3486922, 0.7069215, 0, 0, 0, 1, 1,
-0.1415074, 1.175059, -0.6463479, 0, 0, 0, 1, 1,
-0.1407794, 1.004405, -0.3236985, 0, 0, 0, 1, 1,
-0.1405558, -1.522169, -3.816453, 0, 0, 0, 1, 1,
-0.138355, 0.1379125, -3.18239, 1, 1, 1, 1, 1,
-0.1372675, 0.3747365, -0.1092576, 1, 1, 1, 1, 1,
-0.1347692, 1.612639, 0.272403, 1, 1, 1, 1, 1,
-0.1347522, -1.555496, -5.292482, 1, 1, 1, 1, 1,
-0.134345, 0.8200508, 0.806945, 1, 1, 1, 1, 1,
-0.1287728, -1.124963, -3.732794, 1, 1, 1, 1, 1,
-0.1260137, 1.586462, -0.5569872, 1, 1, 1, 1, 1,
-0.1182204, -1.015214, -3.71933, 1, 1, 1, 1, 1,
-0.109787, -0.6622233, -2.012007, 1, 1, 1, 1, 1,
-0.1048772, 1.896499, -1.914518, 1, 1, 1, 1, 1,
-0.1001839, 0.3079432, 0.7593747, 1, 1, 1, 1, 1,
-0.09466331, -0.5100243, -1.482407, 1, 1, 1, 1, 1,
-0.09286354, -0.3719134, -4.423694, 1, 1, 1, 1, 1,
-0.09222843, 0.07981564, -1.622025, 1, 1, 1, 1, 1,
-0.09096211, 0.08031958, -1.654962, 1, 1, 1, 1, 1,
-0.09090202, -2.104041, -2.417832, 0, 0, 1, 1, 1,
-0.09081184, 1.554432, 1.011734, 1, 0, 0, 1, 1,
-0.08999626, -1.664733, -5.78303, 1, 0, 0, 1, 1,
-0.08855845, -0.8795217, -1.374497, 1, 0, 0, 1, 1,
-0.07779452, -0.739116, -3.314636, 1, 0, 0, 1, 1,
-0.07748048, -0.5035335, -2.629884, 1, 0, 0, 1, 1,
-0.07667363, -1.484013, -3.50443, 0, 0, 0, 1, 1,
-0.07290963, -0.9781187, -2.468163, 0, 0, 0, 1, 1,
-0.0726705, 0.6083201, 1.300949, 0, 0, 0, 1, 1,
-0.07266832, 0.05773866, -0.8601767, 0, 0, 0, 1, 1,
-0.07258423, 0.5853423, -0.5588876, 0, 0, 0, 1, 1,
-0.07241262, -0.130396, -3.22726, 0, 0, 0, 1, 1,
-0.0720733, 1.705615, -0.4646168, 0, 0, 0, 1, 1,
-0.06836794, -1.308787, -2.570677, 1, 1, 1, 1, 1,
-0.06411994, -0.7558388, -4.237793, 1, 1, 1, 1, 1,
-0.06310124, -1.217431, -3.417334, 1, 1, 1, 1, 1,
-0.06185505, -0.9541516, -2.492073, 1, 1, 1, 1, 1,
-0.06159139, -1.030563, -3.152231, 1, 1, 1, 1, 1,
-0.05804603, -0.3515477, -3.385464, 1, 1, 1, 1, 1,
-0.05482496, -0.9617372, -1.609814, 1, 1, 1, 1, 1,
-0.05436977, -1.493663, -3.791422, 1, 1, 1, 1, 1,
-0.04950725, 0.06487238, -0.6698073, 1, 1, 1, 1, 1,
-0.04738643, 1.738951, -1.093932, 1, 1, 1, 1, 1,
-0.04588226, 0.5407819, 3.996496, 1, 1, 1, 1, 1,
-0.04485718, 0.5463395, 0.9599094, 1, 1, 1, 1, 1,
-0.04278154, 1.117948, -1.815506, 1, 1, 1, 1, 1,
-0.04165281, 1.952755, -0.02550893, 1, 1, 1, 1, 1,
-0.04111585, 0.05117332, -1.008509, 1, 1, 1, 1, 1,
-0.03511292, 1.030699, 0.2866004, 0, 0, 1, 1, 1,
-0.03386463, 0.6852804, 0.4272798, 1, 0, 0, 1, 1,
-0.03080299, -2.899245, -2.269858, 1, 0, 0, 1, 1,
-0.02054034, -1.151239, -4.166712, 1, 0, 0, 1, 1,
-0.01823534, -1.816487, -3.198376, 1, 0, 0, 1, 1,
-0.01603329, -1.319214, -3.028859, 1, 0, 0, 1, 1,
-0.01131916, 0.09039576, -1.588568, 0, 0, 0, 1, 1,
-0.006961065, -1.136919, -2.220491, 0, 0, 0, 1, 1,
-0.005512071, -0.8764508, -3.568743, 0, 0, 0, 1, 1,
0.0002495218, -0.9960232, 2.58041, 0, 0, 0, 1, 1,
0.002163806, 0.3145157, -1.146881, 0, 0, 0, 1, 1,
0.005286886, 1.286508, -0.6650775, 0, 0, 0, 1, 1,
0.009246708, -0.5011917, 2.242681, 0, 0, 0, 1, 1,
0.009501537, 0.6965002, 0.3030988, 1, 1, 1, 1, 1,
0.0106399, 0.04627959, 0.2603268, 1, 1, 1, 1, 1,
0.01142267, 0.06771125, 0.366675, 1, 1, 1, 1, 1,
0.01283807, -0.903261, 2.629943, 1, 1, 1, 1, 1,
0.01318378, -0.1103106, 2.593843, 1, 1, 1, 1, 1,
0.01530272, -0.7330648, 2.555604, 1, 1, 1, 1, 1,
0.0174028, -0.4010191, 6.35834, 1, 1, 1, 1, 1,
0.02033433, -2.43997, 4.335214, 1, 1, 1, 1, 1,
0.02087952, 0.4192345, 0.5353301, 1, 1, 1, 1, 1,
0.02359656, 0.3050957, 0.3547265, 1, 1, 1, 1, 1,
0.02432957, -0.03266633, 4.536956, 1, 1, 1, 1, 1,
0.0278992, 0.09756784, -1.241185, 1, 1, 1, 1, 1,
0.02860432, 1.8407, 0.6236755, 1, 1, 1, 1, 1,
0.03876088, 0.6414651, -0.5255602, 1, 1, 1, 1, 1,
0.03944796, 0.6620818, 1.268877, 1, 1, 1, 1, 1,
0.0407921, -0.5564229, 2.487211, 0, 0, 1, 1, 1,
0.04223664, 0.1388572, 0.5887855, 1, 0, 0, 1, 1,
0.0431233, -0.1768857, 1.830235, 1, 0, 0, 1, 1,
0.04345701, -0.2761936, 3.347598, 1, 0, 0, 1, 1,
0.04368666, 0.2314404, 0.958277, 1, 0, 0, 1, 1,
0.04688212, -1.377135, 2.942172, 1, 0, 0, 1, 1,
0.04751586, 0.1618995, 2.148981, 0, 0, 0, 1, 1,
0.05087721, 0.8249699, -1.245858, 0, 0, 0, 1, 1,
0.05236505, -1.094654, 2.253426, 0, 0, 0, 1, 1,
0.05980007, 0.5143154, 1.00877, 0, 0, 0, 1, 1,
0.06307557, -0.6865104, 2.603125, 0, 0, 0, 1, 1,
0.06376613, -1.555625, 2.684491, 0, 0, 0, 1, 1,
0.07816914, -2.321308, 2.524255, 0, 0, 0, 1, 1,
0.08103701, 1.287362, 1.171285, 1, 1, 1, 1, 1,
0.08193641, 0.1282424, 2.140206, 1, 1, 1, 1, 1,
0.08344794, 0.6478837, 0.08262594, 1, 1, 1, 1, 1,
0.08392733, -1.142257, 4.439159, 1, 1, 1, 1, 1,
0.08393095, 1.18651, 1.79019, 1, 1, 1, 1, 1,
0.08395748, 0.3026061, 1.087558, 1, 1, 1, 1, 1,
0.08714764, 0.4830921, -1.341294, 1, 1, 1, 1, 1,
0.08968139, 0.1437385, 1.999495, 1, 1, 1, 1, 1,
0.09039325, 0.05423792, 2.044814, 1, 1, 1, 1, 1,
0.09181714, 0.6469853, 0.2308913, 1, 1, 1, 1, 1,
0.09349406, 0.392915, 0.5821362, 1, 1, 1, 1, 1,
0.09641554, 0.5042008, 0.8676333, 1, 1, 1, 1, 1,
0.09818352, 1.140138, -0.2494772, 1, 1, 1, 1, 1,
0.1023137, 0.1688191, 2.884938, 1, 1, 1, 1, 1,
0.1047617, 0.9427164, -0.8075714, 1, 1, 1, 1, 1,
0.1060374, 0.7960486, 1.235923, 0, 0, 1, 1, 1,
0.1083686, -0.8328623, 3.748748, 1, 0, 0, 1, 1,
0.1084305, -1.478936, 3.630825, 1, 0, 0, 1, 1,
0.1084896, 1.386409, -0.2252419, 1, 0, 0, 1, 1,
0.109232, 1.711108, 1.017081, 1, 0, 0, 1, 1,
0.1154886, -0.07813744, 1.975388, 1, 0, 0, 1, 1,
0.1158334, -0.3741137, 4.077551, 0, 0, 0, 1, 1,
0.1160535, 0.8501154, 1.865445, 0, 0, 0, 1, 1,
0.1181368, -0.2413612, 2.97538, 0, 0, 0, 1, 1,
0.1187251, -0.4451038, 4.492007, 0, 0, 0, 1, 1,
0.1239661, 0.6087782, -1.0348, 0, 0, 0, 1, 1,
0.1253517, -0.4808974, 2.550146, 0, 0, 0, 1, 1,
0.1314385, -0.6356397, 2.333004, 0, 0, 0, 1, 1,
0.1316535, -1.879637, 1.613286, 1, 1, 1, 1, 1,
0.1324031, -0.6039668, 3.877709, 1, 1, 1, 1, 1,
0.1337768, 0.0462346, 1.476771, 1, 1, 1, 1, 1,
0.1404232, 1.316088, -0.3936937, 1, 1, 1, 1, 1,
0.1493026, 0.3613738, -0.8526971, 1, 1, 1, 1, 1,
0.149603, 1.021811, 1.456053, 1, 1, 1, 1, 1,
0.1500085, -1.33963, 0.9889222, 1, 1, 1, 1, 1,
0.1532187, 1.379611, -0.2671804, 1, 1, 1, 1, 1,
0.154952, -0.9653456, 1.460101, 1, 1, 1, 1, 1,
0.1563932, -0.9780848, 2.486023, 1, 1, 1, 1, 1,
0.1598239, -0.3354202, 1.728352, 1, 1, 1, 1, 1,
0.1661014, 0.8511633, -1.21001, 1, 1, 1, 1, 1,
0.1701404, -1.020161, 3.061064, 1, 1, 1, 1, 1,
0.1784634, -0.3967574, 2.887858, 1, 1, 1, 1, 1,
0.1798285, -0.403948, 1.605765, 1, 1, 1, 1, 1,
0.1835689, 0.05866473, 0.9082844, 0, 0, 1, 1, 1,
0.1846578, 1.027146, -0.9450871, 1, 0, 0, 1, 1,
0.1846996, -0.4814934, 1.972927, 1, 0, 0, 1, 1,
0.1854606, 0.9725124, 0.4866669, 1, 0, 0, 1, 1,
0.1868523, 0.3081003, -0.6810212, 1, 0, 0, 1, 1,
0.1916263, 0.4332603, 1.046806, 1, 0, 0, 1, 1,
0.1929226, 1.334367, -0.8400248, 0, 0, 0, 1, 1,
0.1946426, 0.5777407, 1.508686, 0, 0, 0, 1, 1,
0.1950352, 0.457333, 1.106751, 0, 0, 0, 1, 1,
0.2050112, 0.2299758, -0.4588943, 0, 0, 0, 1, 1,
0.2053697, -0.2268866, 2.241907, 0, 0, 0, 1, 1,
0.2087589, -0.5362763, 1.236296, 0, 0, 0, 1, 1,
0.2134523, -1.361455, 3.876651, 0, 0, 0, 1, 1,
0.2242019, -0.4673159, 2.330562, 1, 1, 1, 1, 1,
0.2334598, 0.9548681, 0.0004583181, 1, 1, 1, 1, 1,
0.2349748, 1.584495, -1.403586, 1, 1, 1, 1, 1,
0.2352172, 0.4080097, -0.639704, 1, 1, 1, 1, 1,
0.2354029, 1.392596, 1.214854, 1, 1, 1, 1, 1,
0.2387418, -0.2263894, 1.75582, 1, 1, 1, 1, 1,
0.244654, 2.340241, -1.065056, 1, 1, 1, 1, 1,
0.2456049, 1.355572, 1.228497, 1, 1, 1, 1, 1,
0.2505315, 0.2138241, -0.07572464, 1, 1, 1, 1, 1,
0.2505808, 1.195737, -0.3257521, 1, 1, 1, 1, 1,
0.2522333, -0.4265888, 2.71663, 1, 1, 1, 1, 1,
0.2551413, -1.294721, 4.652446, 1, 1, 1, 1, 1,
0.2558673, -2.177251, 2.817516, 1, 1, 1, 1, 1,
0.2572387, -0.4661768, 4.332017, 1, 1, 1, 1, 1,
0.2596495, 0.002967973, 0.3011135, 1, 1, 1, 1, 1,
0.2607706, -1.196429, 4.874069, 0, 0, 1, 1, 1,
0.2635724, -1.369928, 3.567607, 1, 0, 0, 1, 1,
0.2652655, -0.2515889, 2.673717, 1, 0, 0, 1, 1,
0.2666496, -0.1709377, 0.905034, 1, 0, 0, 1, 1,
0.2712266, 0.05740943, 2.028271, 1, 0, 0, 1, 1,
0.2746705, -1.106703, 2.326851, 1, 0, 0, 1, 1,
0.2758763, 0.7568255, 0.3336109, 0, 0, 0, 1, 1,
0.2784865, -0.9153324, 1.612106, 0, 0, 0, 1, 1,
0.2809287, 0.4277634, -0.7214459, 0, 0, 0, 1, 1,
0.2821232, 1.632969, 0.5917585, 0, 0, 0, 1, 1,
0.2827283, -0.8298849, 1.966425, 0, 0, 0, 1, 1,
0.2847612, 0.6292996, 1.962409, 0, 0, 0, 1, 1,
0.2875433, 0.9028897, 1.43781, 0, 0, 0, 1, 1,
0.2981292, 1.184113, -0.5633693, 1, 1, 1, 1, 1,
0.3000553, 0.6948773, 2.095026, 1, 1, 1, 1, 1,
0.3006289, 1.500301, -0.1069026, 1, 1, 1, 1, 1,
0.3035709, 0.5546053, 1.616888, 1, 1, 1, 1, 1,
0.3062427, 0.4112423, 2.080175, 1, 1, 1, 1, 1,
0.3141804, -0.2639118, 3.809651, 1, 1, 1, 1, 1,
0.3217973, 0.7119954, 0.968206, 1, 1, 1, 1, 1,
0.3228879, -0.1826692, 2.736921, 1, 1, 1, 1, 1,
0.3238408, 1.384629, -1.281288, 1, 1, 1, 1, 1,
0.3245446, 0.8865796, 0.07775225, 1, 1, 1, 1, 1,
0.3249782, 0.8193037, -0.8700519, 1, 1, 1, 1, 1,
0.3291353, -0.7677349, 3.613805, 1, 1, 1, 1, 1,
0.3309965, -1.725232, 2.2448, 1, 1, 1, 1, 1,
0.3393658, -0.2343142, -0.3673428, 1, 1, 1, 1, 1,
0.3410701, -0.0135159, 1.966951, 1, 1, 1, 1, 1,
0.3418036, 1.221741, 0.5274739, 0, 0, 1, 1, 1,
0.3442592, 0.6266067, 0.03071999, 1, 0, 0, 1, 1,
0.352814, 0.5445009, -0.1091654, 1, 0, 0, 1, 1,
0.3600074, -0.6202481, 2.136162, 1, 0, 0, 1, 1,
0.3606225, 0.5442344, -0.0541435, 1, 0, 0, 1, 1,
0.365198, 0.558837, 0.2698458, 1, 0, 0, 1, 1,
0.3661623, 0.03422854, 2.112911, 0, 0, 0, 1, 1,
0.3685904, -1.528268, 1.605775, 0, 0, 0, 1, 1,
0.3691, -0.1151118, 2.570718, 0, 0, 0, 1, 1,
0.3721371, -0.639478, 2.765588, 0, 0, 0, 1, 1,
0.3813473, 1.149334, 1.503873, 0, 0, 0, 1, 1,
0.3893233, -0.910136, 1.309085, 0, 0, 0, 1, 1,
0.3976323, 0.02490584, 0.444922, 0, 0, 0, 1, 1,
0.3982263, -0.4520468, 1.428095, 1, 1, 1, 1, 1,
0.3995614, 0.1541688, 0.8689833, 1, 1, 1, 1, 1,
0.4019544, 2.323876, 0.5056803, 1, 1, 1, 1, 1,
0.4069209, 0.4408826, 0.8021834, 1, 1, 1, 1, 1,
0.4126673, 0.8382533, -0.1478065, 1, 1, 1, 1, 1,
0.4161974, 0.4677608, 1.956841, 1, 1, 1, 1, 1,
0.4167768, -0.1610471, 1.196724, 1, 1, 1, 1, 1,
0.4247118, 0.2912775, 1.119885, 1, 1, 1, 1, 1,
0.4286863, 0.4084451, 1.352629, 1, 1, 1, 1, 1,
0.4297205, -0.4658206, 2.317833, 1, 1, 1, 1, 1,
0.4343666, -0.181994, 0.8711967, 1, 1, 1, 1, 1,
0.4395256, -1.791824, 1.638543, 1, 1, 1, 1, 1,
0.4414981, -0.8494257, 2.880065, 1, 1, 1, 1, 1,
0.4456452, 0.2694068, 2.156525, 1, 1, 1, 1, 1,
0.4508378, -1.594348, 4.301521, 1, 1, 1, 1, 1,
0.4522602, 0.7498791, -1.054632, 0, 0, 1, 1, 1,
0.4522779, 0.7202408, -0.289427, 1, 0, 0, 1, 1,
0.4557936, -0.4959622, 2.454726, 1, 0, 0, 1, 1,
0.4559924, -1.335444, 0.7090036, 1, 0, 0, 1, 1,
0.4584408, 0.5364144, 1.854384, 1, 0, 0, 1, 1,
0.4597554, -0.6208898, 2.787529, 1, 0, 0, 1, 1,
0.4673004, 0.06161564, 0.2650509, 0, 0, 0, 1, 1,
0.4677302, 0.9970269, 0.4370463, 0, 0, 0, 1, 1,
0.4682481, 1.569622, 0.3578031, 0, 0, 0, 1, 1,
0.4688534, 0.04090212, 1.857899, 0, 0, 0, 1, 1,
0.4700242, -0.755926, 3.46409, 0, 0, 0, 1, 1,
0.4713162, -1.564834, 2.942595, 0, 0, 0, 1, 1,
0.4731241, -1.629511, 3.126578, 0, 0, 0, 1, 1,
0.4740863, 0.6778205, 0.3839253, 1, 1, 1, 1, 1,
0.4767052, -0.3038704, 2.105826, 1, 1, 1, 1, 1,
0.476855, -0.4639565, 3.062277, 1, 1, 1, 1, 1,
0.4771006, -0.3871621, 1.042736, 1, 1, 1, 1, 1,
0.4799657, -0.1765838, 1.46035, 1, 1, 1, 1, 1,
0.4835235, 0.1318113, 3.227099, 1, 1, 1, 1, 1,
0.4840053, -1.806228, 3.015813, 1, 1, 1, 1, 1,
0.4847447, -1.227009, 3.961073, 1, 1, 1, 1, 1,
0.4857135, -0.5788902, 3.619127, 1, 1, 1, 1, 1,
0.4860951, 0.643503, 1.934152, 1, 1, 1, 1, 1,
0.4881166, 1.466582, -0.4197722, 1, 1, 1, 1, 1,
0.489356, -0.01824683, 2.094054, 1, 1, 1, 1, 1,
0.4894503, 0.8958892, 1.866534, 1, 1, 1, 1, 1,
0.4899136, -0.4738714, 1.379605, 1, 1, 1, 1, 1,
0.493498, -0.2292063, 1.591755, 1, 1, 1, 1, 1,
0.4942894, 0.9785703, -1.219449, 0, 0, 1, 1, 1,
0.4955165, 0.78622, 1.851337, 1, 0, 0, 1, 1,
0.4999451, 1.074005, -0.4917726, 1, 0, 0, 1, 1,
0.5014994, 0.279298, -0.6418629, 1, 0, 0, 1, 1,
0.514321, -1.750375, 4.02578, 1, 0, 0, 1, 1,
0.5151597, -0.1459, 1.710713, 1, 0, 0, 1, 1,
0.5156745, -0.1410332, 0.5981869, 0, 0, 0, 1, 1,
0.5212985, 0.7282031, 0.7327064, 0, 0, 0, 1, 1,
0.5220048, 0.4539053, -0.2683749, 0, 0, 0, 1, 1,
0.5276586, -1.524195, 0.5274694, 0, 0, 0, 1, 1,
0.5390807, 2.334772, 0.8581915, 0, 0, 0, 1, 1,
0.5401523, -1.738419, 1.451348, 0, 0, 0, 1, 1,
0.5435501, -1.034546, 1.338018, 0, 0, 0, 1, 1,
0.5441465, 0.04700807, 1.629479, 1, 1, 1, 1, 1,
0.549561, -0.6008192, 3.055813, 1, 1, 1, 1, 1,
0.5497563, -0.2443523, 2.820631, 1, 1, 1, 1, 1,
0.5539688, -1.429825, 2.717402, 1, 1, 1, 1, 1,
0.5571762, 0.9069695, 0.8349775, 1, 1, 1, 1, 1,
0.5577358, -0.7775689, 4.067409, 1, 1, 1, 1, 1,
0.5595021, -0.8344243, 2.138212, 1, 1, 1, 1, 1,
0.5604039, 0.4155424, 0.7742009, 1, 1, 1, 1, 1,
0.5638045, 2.103381, -0.8463448, 1, 1, 1, 1, 1,
0.5683411, -0.4009205, 2.1705, 1, 1, 1, 1, 1,
0.5923164, -1.416056, 1.218732, 1, 1, 1, 1, 1,
0.59889, -1.550612, 1.199785, 1, 1, 1, 1, 1,
0.5999905, -0.2247556, 2.721472, 1, 1, 1, 1, 1,
0.6004143, -0.2760587, 3.123981, 1, 1, 1, 1, 1,
0.6033959, 0.6016394, 0.3697358, 1, 1, 1, 1, 1,
0.6075454, -0.02487326, 1.310223, 0, 0, 1, 1, 1,
0.6092781, -0.7540031, 2.065861, 1, 0, 0, 1, 1,
0.6093807, -0.4883672, 3.483461, 1, 0, 0, 1, 1,
0.6101011, -0.7387671, 0.2625882, 1, 0, 0, 1, 1,
0.6132619, -1.751176, 1.024448, 1, 0, 0, 1, 1,
0.613898, 0.2038532, 1.903132, 1, 0, 0, 1, 1,
0.6327595, 0.2031121, 0.8331481, 0, 0, 0, 1, 1,
0.6337997, 0.3156874, -0.7941814, 0, 0, 0, 1, 1,
0.6437229, -0.4954247, 1.967437, 0, 0, 0, 1, 1,
0.6443067, 0.1013529, 1.888467, 0, 0, 0, 1, 1,
0.6486726, -0.5047059, 3.193345, 0, 0, 0, 1, 1,
0.6507437, 0.2318189, 0.2220344, 0, 0, 0, 1, 1,
0.6509492, -1.180627, 1.74193, 0, 0, 0, 1, 1,
0.6521367, 1.124833, 0.05572413, 1, 1, 1, 1, 1,
0.6593378, -0.5205674, 2.454061, 1, 1, 1, 1, 1,
0.6594881, 0.6560545, 0.2116441, 1, 1, 1, 1, 1,
0.6612225, 0.2106177, -0.233818, 1, 1, 1, 1, 1,
0.6632457, 0.0098126, 2.98057, 1, 1, 1, 1, 1,
0.6645368, -0.6113378, 2.122244, 1, 1, 1, 1, 1,
0.6674582, 1.324154, 0.5282211, 1, 1, 1, 1, 1,
0.6704933, 1.057904, 2.520443, 1, 1, 1, 1, 1,
0.6709706, 0.3585332, 0.7869267, 1, 1, 1, 1, 1,
0.6724511, -0.8674186, 0.6870946, 1, 1, 1, 1, 1,
0.6777731, 0.5314464, 0.5340815, 1, 1, 1, 1, 1,
0.6845725, 1.001162, 0.2957141, 1, 1, 1, 1, 1,
0.6921147, -1.302568, 2.207403, 1, 1, 1, 1, 1,
0.693572, -0.3871465, 1.876245, 1, 1, 1, 1, 1,
0.6974278, -0.7569653, 1.383788, 1, 1, 1, 1, 1,
0.6983707, -0.7433047, 3.590328, 0, 0, 1, 1, 1,
0.6986834, 0.5030185, 0.1647611, 1, 0, 0, 1, 1,
0.7004685, -1.973378, 3.836225, 1, 0, 0, 1, 1,
0.7006415, 0.1493221, 0.5811895, 1, 0, 0, 1, 1,
0.7076373, -0.9272315, 2.682291, 1, 0, 0, 1, 1,
0.7111207, 0.06797523, 1.213967, 1, 0, 0, 1, 1,
0.7112798, 0.6129959, -0.2856431, 0, 0, 0, 1, 1,
0.7123666, 0.4313667, -0.590983, 0, 0, 0, 1, 1,
0.7124507, 1.486708, -1.196695, 0, 0, 0, 1, 1,
0.7168883, -0.2350895, 1.592907, 0, 0, 0, 1, 1,
0.7185382, 1.364217, -0.3587581, 0, 0, 0, 1, 1,
0.7189546, 0.2269838, 1.350317, 0, 0, 0, 1, 1,
0.7209327, 0.8979785, 0.7063887, 0, 0, 0, 1, 1,
0.7250048, 0.1579096, 1.395889, 1, 1, 1, 1, 1,
0.728353, -1.223793, 2.150703, 1, 1, 1, 1, 1,
0.7324921, -0.7190233, 1.113577, 1, 1, 1, 1, 1,
0.7329816, 2.521759, 0.6319537, 1, 1, 1, 1, 1,
0.7344261, 1.024413, 1.028726, 1, 1, 1, 1, 1,
0.7368255, 0.08702217, 1.287835, 1, 1, 1, 1, 1,
0.7438691, -0.5430709, 3.688109, 1, 1, 1, 1, 1,
0.7447018, -0.9281917, 3.430988, 1, 1, 1, 1, 1,
0.7460995, 0.3530183, -0.1071813, 1, 1, 1, 1, 1,
0.7479619, -0.525107, 2.551473, 1, 1, 1, 1, 1,
0.7646245, -1.525961, 1.564962, 1, 1, 1, 1, 1,
0.7722191, -0.4297605, 3.367337, 1, 1, 1, 1, 1,
0.7724072, -0.8991002, 2.717846, 1, 1, 1, 1, 1,
0.7749944, 0.309248, 1.41845, 1, 1, 1, 1, 1,
0.7755092, -0.8705795, 1.827553, 1, 1, 1, 1, 1,
0.7887762, 0.3725538, 0.7499824, 0, 0, 1, 1, 1,
0.8001522, 0.3765885, 2.265539, 1, 0, 0, 1, 1,
0.8011891, 1.664694, 0.560195, 1, 0, 0, 1, 1,
0.8013821, 0.4891052, 0.4439874, 1, 0, 0, 1, 1,
0.8050937, 0.02815474, 0.3748989, 1, 0, 0, 1, 1,
0.8127964, -0.7056932, 1.423617, 1, 0, 0, 1, 1,
0.8269789, 0.5767242, 1.130469, 0, 0, 0, 1, 1,
0.8307531, -0.6462389, 2.946446, 0, 0, 0, 1, 1,
0.8331875, 0.9835781, 0.11508, 0, 0, 0, 1, 1,
0.8387306, -0.6378696, 0.4193202, 0, 0, 0, 1, 1,
0.8436825, 0.5899516, 0.9975862, 0, 0, 0, 1, 1,
0.8446766, -0.3255071, 3.16668, 0, 0, 0, 1, 1,
0.8474259, 0.06820485, 1.108358, 0, 0, 0, 1, 1,
0.847604, 0.1171358, 1.013437, 1, 1, 1, 1, 1,
0.8516979, -1.109044, 2.50112, 1, 1, 1, 1, 1,
0.8529741, 0.134824, 1.152726, 1, 1, 1, 1, 1,
0.8612077, -1.521582, 1.412508, 1, 1, 1, 1, 1,
0.8648249, -0.8459485, 3.904485, 1, 1, 1, 1, 1,
0.8685499, 0.2100837, -0.1364131, 1, 1, 1, 1, 1,
0.8700497, 0.7356822, -0.3689844, 1, 1, 1, 1, 1,
0.8737206, 0.5562696, 0.56333, 1, 1, 1, 1, 1,
0.8800573, -1.830533, 2.15466, 1, 1, 1, 1, 1,
0.8811128, -0.1601078, 1.610862, 1, 1, 1, 1, 1,
0.8811377, -0.1485923, 2.124301, 1, 1, 1, 1, 1,
0.8825529, 0.9514101, 1.70886, 1, 1, 1, 1, 1,
0.8840163, -0.6905059, -0.02978876, 1, 1, 1, 1, 1,
0.8924274, 0.8809317, 1.19765, 1, 1, 1, 1, 1,
0.8932402, -0.6060205, 2.842125, 1, 1, 1, 1, 1,
0.9001573, 1.276616, 1.110996, 0, 0, 1, 1, 1,
0.9007712, 1.467203, 1.213315, 1, 0, 0, 1, 1,
0.9056186, -0.2950311, 1.544093, 1, 0, 0, 1, 1,
0.9075539, -0.6593105, 3.131646, 1, 0, 0, 1, 1,
0.9137655, 0.6353742, -0.2308454, 1, 0, 0, 1, 1,
0.9174663, 0.1195344, 0.9557213, 1, 0, 0, 1, 1,
0.9210018, -2.001857, 1.298198, 0, 0, 0, 1, 1,
0.9239622, 0.1182332, 0.7707733, 0, 0, 0, 1, 1,
0.925383, -0.5808741, 2.104773, 0, 0, 0, 1, 1,
0.9331027, 1.259305, -0.7595727, 0, 0, 0, 1, 1,
0.9338643, -2.188401, 2.238912, 0, 0, 0, 1, 1,
0.9376552, 1.761037, 0.2684056, 0, 0, 0, 1, 1,
0.9388996, 0.4413836, 0.5637828, 0, 0, 0, 1, 1,
0.9463493, 0.7594097, 0.2550114, 1, 1, 1, 1, 1,
0.9466898, 0.6317608, 2.086778, 1, 1, 1, 1, 1,
0.9566631, -1.243245, 2.491507, 1, 1, 1, 1, 1,
0.9590509, -0.1073476, 2.124412, 1, 1, 1, 1, 1,
0.96143, -1.361755, 2.532584, 1, 1, 1, 1, 1,
0.9693133, 0.4909379, 2.215214, 1, 1, 1, 1, 1,
0.9697365, -0.5761818, 0.516957, 1, 1, 1, 1, 1,
0.9716038, -1.760748, 0.446254, 1, 1, 1, 1, 1,
0.9741601, 0.6153541, 0.3324617, 1, 1, 1, 1, 1,
0.980753, 0.6711132, 1.773824, 1, 1, 1, 1, 1,
0.9833743, 1.357834, 0.6768665, 1, 1, 1, 1, 1,
0.9871476, 0.1460496, 1.724851, 1, 1, 1, 1, 1,
0.9914244, 0.1042604, 1.912541, 1, 1, 1, 1, 1,
0.9929839, -0.3120313, 1.731615, 1, 1, 1, 1, 1,
0.9991875, -0.2417607, 4.151405, 1, 1, 1, 1, 1,
0.9998967, 0.5228257, 0.3505556, 0, 0, 1, 1, 1,
1.00003, 1.029594, -0.1781435, 1, 0, 0, 1, 1,
1.000146, 0.08289205, -0.3040613, 1, 0, 0, 1, 1,
1.00176, 0.5828912, -0.8224908, 1, 0, 0, 1, 1,
1.003159, -0.5384189, 1.701745, 1, 0, 0, 1, 1,
1.014501, 1.136571, 0.7576661, 1, 0, 0, 1, 1,
1.016038, 0.4029477, 1.317093, 0, 0, 0, 1, 1,
1.028894, 0.6311077, 1.826079, 0, 0, 0, 1, 1,
1.033314, -1.187657, 2.174443, 0, 0, 0, 1, 1,
1.034215, 1.533601, -0.2765347, 0, 0, 0, 1, 1,
1.036034, 0.6911067, 1.970312, 0, 0, 0, 1, 1,
1.037943, 2.173781, 0.6086639, 0, 0, 0, 1, 1,
1.045504, 0.5980163, 0.5621348, 0, 0, 0, 1, 1,
1.046818, -0.2036771, 1.478112, 1, 1, 1, 1, 1,
1.05336, -0.8394184, 2.413059, 1, 1, 1, 1, 1,
1.063779, -0.1663678, 2.030855, 1, 1, 1, 1, 1,
1.067994, -0.8234589, 0.6750844, 1, 1, 1, 1, 1,
1.073378, -0.3070059, 0.911984, 1, 1, 1, 1, 1,
1.073807, -0.2475044, 0.1496338, 1, 1, 1, 1, 1,
1.084211, -0.440141, 1.397741, 1, 1, 1, 1, 1,
1.08903, -1.226586, 2.783493, 1, 1, 1, 1, 1,
1.089129, 1.373989, -1.176128, 1, 1, 1, 1, 1,
1.090614, -0.1208552, 2.860088, 1, 1, 1, 1, 1,
1.09972, 1.232729, 0.6023542, 1, 1, 1, 1, 1,
1.106546, 0.527341, -0.3418873, 1, 1, 1, 1, 1,
1.107333, 0.4830146, 1.11595, 1, 1, 1, 1, 1,
1.107428, -0.02552312, 1.025683, 1, 1, 1, 1, 1,
1.116534, -1.35698, 1.58035, 1, 1, 1, 1, 1,
1.11721, 1.058101, 0.1535444, 0, 0, 1, 1, 1,
1.12661, -1.132508, 1.957736, 1, 0, 0, 1, 1,
1.142059, 0.8159924, 0.1689814, 1, 0, 0, 1, 1,
1.142404, -0.2753238, 2.256371, 1, 0, 0, 1, 1,
1.154324, -0.6315196, 3.539727, 1, 0, 0, 1, 1,
1.159971, -1.008892, 2.289919, 1, 0, 0, 1, 1,
1.161245, -1.768215, 1.631843, 0, 0, 0, 1, 1,
1.161909, 0.2758914, -0.1810994, 0, 0, 0, 1, 1,
1.166358, -1.45926, 3.966426, 0, 0, 0, 1, 1,
1.167119, 1.04522, 0.5082899, 0, 0, 0, 1, 1,
1.168869, -0.1597502, 0.4403298, 0, 0, 0, 1, 1,
1.178663, -0.6146063, 2.715479, 0, 0, 0, 1, 1,
1.179536, 0.4964821, 1.645776, 0, 0, 0, 1, 1,
1.18572, -0.5723218, 2.052062, 1, 1, 1, 1, 1,
1.187345, 0.8604839, 1.268589, 1, 1, 1, 1, 1,
1.189529, -1.018945, 2.051954, 1, 1, 1, 1, 1,
1.195124, 0.3277659, 1.64467, 1, 1, 1, 1, 1,
1.204171, -0.1436957, 1.928984, 1, 1, 1, 1, 1,
1.208797, -1.456671, 2.922652, 1, 1, 1, 1, 1,
1.218939, -0.07908822, 1.058257, 1, 1, 1, 1, 1,
1.252371, -1.372216, 3.462596, 1, 1, 1, 1, 1,
1.258433, -0.8728316, 1.071883, 1, 1, 1, 1, 1,
1.261029, 0.1730331, 1.364002, 1, 1, 1, 1, 1,
1.263174, 0.02472265, 3.252891, 1, 1, 1, 1, 1,
1.264581, -1.005734, 3.08667, 1, 1, 1, 1, 1,
1.265124, -0.686001, -0.07450829, 1, 1, 1, 1, 1,
1.267073, 1.353215, 0.7506645, 1, 1, 1, 1, 1,
1.274666, 0.5950364, 1.515811, 1, 1, 1, 1, 1,
1.276602, 0.9535384, -0.9581974, 0, 0, 1, 1, 1,
1.284229, 1.009349, -1.867371, 1, 0, 0, 1, 1,
1.289685, -0.3557434, 1.409881, 1, 0, 0, 1, 1,
1.294736, 0.2713948, 2.569876, 1, 0, 0, 1, 1,
1.300034, 0.03584095, 0.5698177, 1, 0, 0, 1, 1,
1.315023, 0.03994999, 0.07350779, 1, 0, 0, 1, 1,
1.315531, 0.08705261, 2.479998, 0, 0, 0, 1, 1,
1.318836, 0.6587452, 0.6702208, 0, 0, 0, 1, 1,
1.320199, 0.1479625, 0.7459422, 0, 0, 0, 1, 1,
1.32702, 1.255796, -0.3782382, 0, 0, 0, 1, 1,
1.327478, 0.4754372, 1.812875, 0, 0, 0, 1, 1,
1.336438, -0.1744232, 2.022729, 0, 0, 0, 1, 1,
1.350985, -0.7319115, 2.297585, 0, 0, 0, 1, 1,
1.359515, -0.9547601, 0.9603761, 1, 1, 1, 1, 1,
1.36266, -0.7803456, 2.811664, 1, 1, 1, 1, 1,
1.365693, 0.3648797, -0.1679451, 1, 1, 1, 1, 1,
1.376203, 0.3125312, 1.34979, 1, 1, 1, 1, 1,
1.389228, 0.3258904, 2.907506, 1, 1, 1, 1, 1,
1.390868, 2.542497, 1.339255, 1, 1, 1, 1, 1,
1.395182, -0.05890609, 1.055761, 1, 1, 1, 1, 1,
1.401804, 1.421027, -0.5056356, 1, 1, 1, 1, 1,
1.406067, -1.73015, 3.622318, 1, 1, 1, 1, 1,
1.418145, 1.454164, -0.2587956, 1, 1, 1, 1, 1,
1.431467, 0.08793677, 2.737137, 1, 1, 1, 1, 1,
1.439583, 1.08756, 1.508544, 1, 1, 1, 1, 1,
1.453474, -0.05260828, 4.173458, 1, 1, 1, 1, 1,
1.459799, -0.2311256, 0.5652383, 1, 1, 1, 1, 1,
1.459913, -0.2471096, 2.070371, 1, 1, 1, 1, 1,
1.461366, -1.279838, 0.8799455, 0, 0, 1, 1, 1,
1.507877, -0.03017537, 1.291587, 1, 0, 0, 1, 1,
1.51515, -1.510897, 0.8547871, 1, 0, 0, 1, 1,
1.517497, 0.7550067, 1.258281, 1, 0, 0, 1, 1,
1.522214, 0.422791, 2.113721, 1, 0, 0, 1, 1,
1.538823, 0.04936236, 2.854055, 1, 0, 0, 1, 1,
1.539504, 0.3291877, 2.063282, 0, 0, 0, 1, 1,
1.543382, 0.04717309, 1.238145, 0, 0, 0, 1, 1,
1.554934, 0.3994623, 0.04399847, 0, 0, 0, 1, 1,
1.555409, -0.2728858, 1.134899, 0, 0, 0, 1, 1,
1.563784, -0.7772664, 1.56479, 0, 0, 0, 1, 1,
1.5693, -0.4136574, 1.479294, 0, 0, 0, 1, 1,
1.582586, 0.2450881, 0.424316, 0, 0, 0, 1, 1,
1.583307, -0.7881036, 2.020553, 1, 1, 1, 1, 1,
1.585106, -0.04223624, 2.461313, 1, 1, 1, 1, 1,
1.585944, 1.507575, -0.1528366, 1, 1, 1, 1, 1,
1.595487, 0.5384978, 0.2188257, 1, 1, 1, 1, 1,
1.623342, -0.4804598, 3.200414, 1, 1, 1, 1, 1,
1.626414, -0.09987285, 1.003887, 1, 1, 1, 1, 1,
1.631559, -0.1875295, 2.115562, 1, 1, 1, 1, 1,
1.632632, 0.9321084, 0.3190961, 1, 1, 1, 1, 1,
1.633155, -0.1891291, 3.163126, 1, 1, 1, 1, 1,
1.635666, 0.8449897, 2.258966, 1, 1, 1, 1, 1,
1.642788, 3.172915, 0.5855237, 1, 1, 1, 1, 1,
1.670747, 0.5223168, -0.2517906, 1, 1, 1, 1, 1,
1.671915, 1.277972, 1.323229, 1, 1, 1, 1, 1,
1.69451, -0.01947628, 1.710404, 1, 1, 1, 1, 1,
1.71014, 1.409969, 0.2187404, 1, 1, 1, 1, 1,
1.725275, -1.030794, 1.485595, 0, 0, 1, 1, 1,
1.736015, -0.3351923, 2.006021, 1, 0, 0, 1, 1,
1.737906, 0.1796631, -0.2972359, 1, 0, 0, 1, 1,
1.748847, -0.571039, 1.798138, 1, 0, 0, 1, 1,
1.751611, -0.7482312, 2.184627, 1, 0, 0, 1, 1,
1.769363, 1.370057, 1.861564, 1, 0, 0, 1, 1,
1.794173, 0.843483, 1.671945, 0, 0, 0, 1, 1,
1.801182, -2.040603, 3.774403, 0, 0, 0, 1, 1,
1.805123, -0.1178001, 2.370867, 0, 0, 0, 1, 1,
1.837704, 0.3352759, 2.375873, 0, 0, 0, 1, 1,
1.853989, -0.3214283, 4.001906, 0, 0, 0, 1, 1,
1.860069, -0.7477801, 4.028936, 0, 0, 0, 1, 1,
1.875344, 1.501728, 0.3417605, 0, 0, 0, 1, 1,
1.885596, 0.5671608, 3.864367, 1, 1, 1, 1, 1,
1.894918, -0.8018971, 2.448785, 1, 1, 1, 1, 1,
1.920758, 0.6048002, 0.8345352, 1, 1, 1, 1, 1,
1.949467, -1.406202, 1.349325, 1, 1, 1, 1, 1,
1.970952, -0.2438122, 1.826349, 1, 1, 1, 1, 1,
1.977025, 0.222122, 0.8362326, 1, 1, 1, 1, 1,
1.980981, -0.4383875, 2.003709, 1, 1, 1, 1, 1,
1.985734, 0.4502111, 2.518497, 1, 1, 1, 1, 1,
1.990099, 0.3881354, 1.617637, 1, 1, 1, 1, 1,
2.048109, 0.09717921, 0.4073547, 1, 1, 1, 1, 1,
2.056997, 0.3490597, 2.213922, 1, 1, 1, 1, 1,
2.068998, -0.4142089, 2.228031, 1, 1, 1, 1, 1,
2.081716, -2.302856, 1.622601, 1, 1, 1, 1, 1,
2.085686, 0.8329682, 2.878038, 1, 1, 1, 1, 1,
2.096119, 0.7368478, 1.420549, 1, 1, 1, 1, 1,
2.104173, 0.3116483, 2.516178, 0, 0, 1, 1, 1,
2.112226, 0.577133, 0.02882007, 1, 0, 0, 1, 1,
2.131705, 0.45893, 1.914515, 1, 0, 0, 1, 1,
2.151373, -0.09021694, 0.3917545, 1, 0, 0, 1, 1,
2.193438, 0.2101498, 1.1506, 1, 0, 0, 1, 1,
2.212456, 1.002391, 2.03838, 1, 0, 0, 1, 1,
2.215329, -1.122544, 0.8242023, 0, 0, 0, 1, 1,
2.21703, -0.1375642, 1.181736, 0, 0, 0, 1, 1,
2.217599, -0.2289529, 1.375615, 0, 0, 0, 1, 1,
2.233357, 0.2679233, 0.3788044, 0, 0, 0, 1, 1,
2.278469, 0.2716557, 1.40164, 0, 0, 0, 1, 1,
2.420694, 0.4584539, 1.620477, 0, 0, 0, 1, 1,
2.486237, -1.409646, 0.9578898, 0, 0, 0, 1, 1,
2.515094, -0.63705, 1.483099, 1, 1, 1, 1, 1,
2.672366, 1.334864, 1.066355, 1, 1, 1, 1, 1,
2.745362, 1.368158, -0.1385082, 1, 1, 1, 1, 1,
2.768691, -0.2652055, 1.001195, 1, 1, 1, 1, 1,
3.025923, -1.323281, 1.724478, 1, 1, 1, 1, 1,
3.325103, 0.3769464, 0.887839, 1, 1, 1, 1, 1,
3.335999, 0.09087442, 0.9867294, 1, 1, 1, 1, 1
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
var radius = 10.31943;
var distance = 36.24656;
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
mvMatrix.translate( -0.1665525, -0.6167384, -0.2876551 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -36.24656);
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
