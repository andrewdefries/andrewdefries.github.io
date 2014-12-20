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
-3.112654, -0.4717251, -1.906696, 1, 0, 0, 1,
-2.795127, 0.3414378, -1.951099, 1, 0.007843138, 0, 1,
-2.57101, 0.1387291, -0.5171612, 1, 0.01176471, 0, 1,
-2.5209, -1.282321, -2.618979, 1, 0.01960784, 0, 1,
-2.513902, -0.06777385, -1.981817, 1, 0.02352941, 0, 1,
-2.297879, 1.686157, -0.1586367, 1, 0.03137255, 0, 1,
-2.276574, -0.9767478, -4.239751, 1, 0.03529412, 0, 1,
-2.238802, 1.327164, -0.7761818, 1, 0.04313726, 0, 1,
-2.227636, -1.036625, -2.798182, 1, 0.04705882, 0, 1,
-2.107129, 0.733562, -2.904508, 1, 0.05490196, 0, 1,
-2.078303, 1.580293, 0.01332881, 1, 0.05882353, 0, 1,
-2.065326, -0.7150024, -0.8713449, 1, 0.06666667, 0, 1,
-2.033082, 1.604626, 1.61851, 1, 0.07058824, 0, 1,
-2.02531, 0.6785541, -1.921791, 1, 0.07843138, 0, 1,
-1.991373, -1.317463, -2.401199, 1, 0.08235294, 0, 1,
-1.989926, 1.748101, 0.2646704, 1, 0.09019608, 0, 1,
-1.981544, -0.1034891, -3.017199, 1, 0.09411765, 0, 1,
-1.962923, -0.9729782, -2.546139, 1, 0.1019608, 0, 1,
-1.960807, 0.3397711, -0.7240051, 1, 0.1098039, 0, 1,
-1.883486, 0.9588176, -0.05390786, 1, 0.1137255, 0, 1,
-1.870432, 0.9762392, -0.9189241, 1, 0.1215686, 0, 1,
-1.850001, 0.3990336, -1.845431, 1, 0.1254902, 0, 1,
-1.838928, -0.8892339, -2.809092, 1, 0.1333333, 0, 1,
-1.799722, 0.5429033, -3.606215, 1, 0.1372549, 0, 1,
-1.77221, -0.06744136, -3.421368, 1, 0.145098, 0, 1,
-1.769287, 1.326123, 0.4887042, 1, 0.1490196, 0, 1,
-1.748793, 0.9528809, -1.626023, 1, 0.1568628, 0, 1,
-1.737235, 1.413159, -1.081103, 1, 0.1607843, 0, 1,
-1.736444, -0.1230792, -1.65735, 1, 0.1686275, 0, 1,
-1.725157, -0.1081018, -1.909622, 1, 0.172549, 0, 1,
-1.714185, -0.6488687, -1.96744, 1, 0.1803922, 0, 1,
-1.699278, 0.9175985, -0.6931763, 1, 0.1843137, 0, 1,
-1.694575, -0.04494336, -2.742365, 1, 0.1921569, 0, 1,
-1.688346, -0.395588, -1.779036, 1, 0.1960784, 0, 1,
-1.675635, 1.162907, -1.920381, 1, 0.2039216, 0, 1,
-1.670985, 0.6298901, -1.684309, 1, 0.2117647, 0, 1,
-1.625199, -1.452196, -2.209772, 1, 0.2156863, 0, 1,
-1.614146, 1.126926, -0.657373, 1, 0.2235294, 0, 1,
-1.610719, -0.07423373, -1.532288, 1, 0.227451, 0, 1,
-1.600664, -1.185128, -3.084784, 1, 0.2352941, 0, 1,
-1.587492, 1.769944, -1.248558, 1, 0.2392157, 0, 1,
-1.549982, -1.658307, -2.571888, 1, 0.2470588, 0, 1,
-1.544233, 0.2631204, -2.220205, 1, 0.2509804, 0, 1,
-1.541926, 1.22942, -2.333868, 1, 0.2588235, 0, 1,
-1.531949, -0.676573, -2.431387, 1, 0.2627451, 0, 1,
-1.530596, 1.472161, -0.746693, 1, 0.2705882, 0, 1,
-1.511538, -0.1066972, -1.277843, 1, 0.2745098, 0, 1,
-1.51045, 0.8688479, -1.706236, 1, 0.282353, 0, 1,
-1.475152, -1.973891, -2.417771, 1, 0.2862745, 0, 1,
-1.460413, -1.722833, -2.844499, 1, 0.2941177, 0, 1,
-1.455324, 0.665999, -0.03598922, 1, 0.3019608, 0, 1,
-1.436653, 1.203159, -0.4112616, 1, 0.3058824, 0, 1,
-1.427361, 0.8834419, -2.277065, 1, 0.3137255, 0, 1,
-1.421836, 0.9933351, -1.831958, 1, 0.3176471, 0, 1,
-1.415725, -1.417198, -2.341583, 1, 0.3254902, 0, 1,
-1.414967, -0.269578, -1.770079, 1, 0.3294118, 0, 1,
-1.4095, 0.6530494, -1.72728, 1, 0.3372549, 0, 1,
-1.397175, -0.3226492, -1.92056, 1, 0.3411765, 0, 1,
-1.386858, -1.637663, -2.447794, 1, 0.3490196, 0, 1,
-1.376313, -2.759286, -1.015687, 1, 0.3529412, 0, 1,
-1.360457, 0.2649136, -0.3021593, 1, 0.3607843, 0, 1,
-1.356671, -0.4225586, -3.096751, 1, 0.3647059, 0, 1,
-1.353718, 0.4888695, -0.1392945, 1, 0.372549, 0, 1,
-1.353081, -0.275728, -3.100798, 1, 0.3764706, 0, 1,
-1.352974, 1.830659, -0.7092869, 1, 0.3843137, 0, 1,
-1.350037, 0.5963337, 0.3044725, 1, 0.3882353, 0, 1,
-1.348039, -0.1764948, -1.483239, 1, 0.3960784, 0, 1,
-1.344118, 1.251706, -0.8946034, 1, 0.4039216, 0, 1,
-1.33268, 1.434744, -0.9052392, 1, 0.4078431, 0, 1,
-1.329915, -0.6815258, -3.241481, 1, 0.4156863, 0, 1,
-1.324401, -0.05043515, -2.593572, 1, 0.4196078, 0, 1,
-1.321431, -0.6899128, -3.182203, 1, 0.427451, 0, 1,
-1.298501, 0.4535271, -2.215014, 1, 0.4313726, 0, 1,
-1.29793, 0.7616107, -1.185969, 1, 0.4392157, 0, 1,
-1.297172, 1.065681, 0.2925218, 1, 0.4431373, 0, 1,
-1.294517, 1.659223, -0.5275623, 1, 0.4509804, 0, 1,
-1.284544, 0.3690603, -1.790379, 1, 0.454902, 0, 1,
-1.275858, 0.7335493, -2.210806, 1, 0.4627451, 0, 1,
-1.271885, -1.210295, -2.218104, 1, 0.4666667, 0, 1,
-1.261896, -0.7846251, -0.333549, 1, 0.4745098, 0, 1,
-1.245834, 0.7431847, -2.202824, 1, 0.4784314, 0, 1,
-1.235004, 1.246201, -0.001110791, 1, 0.4862745, 0, 1,
-1.233952, 1.587018, 0.922425, 1, 0.4901961, 0, 1,
-1.233495, 0.05112828, -2.138622, 1, 0.4980392, 0, 1,
-1.229722, 1.77333, -0.08007173, 1, 0.5058824, 0, 1,
-1.227954, 0.9387998, -1.315893, 1, 0.509804, 0, 1,
-1.226129, 0.03275458, -0.2178539, 1, 0.5176471, 0, 1,
-1.219702, -0.8928486, -2.557117, 1, 0.5215687, 0, 1,
-1.219491, 0.2711584, -2.92047, 1, 0.5294118, 0, 1,
-1.219243, 0.2640005, -2.062874, 1, 0.5333334, 0, 1,
-1.214943, -1.084504, -1.412921, 1, 0.5411765, 0, 1,
-1.212264, 1.11015, -0.5303953, 1, 0.5450981, 0, 1,
-1.202954, 1.571756, 1.337604, 1, 0.5529412, 0, 1,
-1.201129, 0.4474816, -0.7353117, 1, 0.5568628, 0, 1,
-1.178301, -0.2396938, -1.001848, 1, 0.5647059, 0, 1,
-1.176944, 0.280383, -2.079074, 1, 0.5686275, 0, 1,
-1.170667, -0.8337175, -1.559691, 1, 0.5764706, 0, 1,
-1.155195, 1.259161, 0.1917708, 1, 0.5803922, 0, 1,
-1.152282, 0.3214031, -1.014439, 1, 0.5882353, 0, 1,
-1.152228, -1.288691, -0.3795896, 1, 0.5921569, 0, 1,
-1.146453, -1.422082, -4.833073, 1, 0.6, 0, 1,
-1.141476, -0.1694224, -3.037914, 1, 0.6078432, 0, 1,
-1.127747, 0.07585592, -0.7748059, 1, 0.6117647, 0, 1,
-1.125457, -0.4715507, -0.8991449, 1, 0.6196079, 0, 1,
-1.123533, -0.3212144, -2.524055, 1, 0.6235294, 0, 1,
-1.1235, -0.02088348, -2.386315, 1, 0.6313726, 0, 1,
-1.116718, -0.3213631, -2.647476, 1, 0.6352941, 0, 1,
-1.11399, 0.1207619, -2.637992, 1, 0.6431373, 0, 1,
-1.112929, -2.8696, -5.580615, 1, 0.6470588, 0, 1,
-1.112744, 0.1050663, -2.528184, 1, 0.654902, 0, 1,
-1.099321, 0.01219511, -1.642529, 1, 0.6588235, 0, 1,
-1.09625, -0.7063555, -1.069474, 1, 0.6666667, 0, 1,
-1.092954, 0.06430879, -2.11459, 1, 0.6705883, 0, 1,
-1.08569, 1.525066, -1.443366, 1, 0.6784314, 0, 1,
-1.08435, -0.94157, -2.914395, 1, 0.682353, 0, 1,
-1.082185, -1.238334, -2.721913, 1, 0.6901961, 0, 1,
-1.077715, 0.2582187, -2.431984, 1, 0.6941177, 0, 1,
-1.07547, -0.2768211, -1.728006, 1, 0.7019608, 0, 1,
-1.07203, 1.523299, -0.7373766, 1, 0.7098039, 0, 1,
-1.066792, 0.58657, -1.451318, 1, 0.7137255, 0, 1,
-1.06281, 0.3741403, -0.8134191, 1, 0.7215686, 0, 1,
-1.053482, -0.02579604, -0.8080031, 1, 0.7254902, 0, 1,
-1.045267, 0.987375, -1.800985, 1, 0.7333333, 0, 1,
-1.04188, 1.211123, -0.6716392, 1, 0.7372549, 0, 1,
-1.040196, 0.09697913, -1.55036, 1, 0.7450981, 0, 1,
-1.035601, -0.6125531, -1.491854, 1, 0.7490196, 0, 1,
-1.029801, 0.2836069, -0.09337404, 1, 0.7568628, 0, 1,
-1.027307, -0.100794, -1.700783, 1, 0.7607843, 0, 1,
-1.02128, 0.747344, 0.324867, 1, 0.7686275, 0, 1,
-1.019829, 0.008001148, -3.157133, 1, 0.772549, 0, 1,
-1.006621, 0.7913549, -3.119944, 1, 0.7803922, 0, 1,
-1.006384, 0.3154823, -0.8498206, 1, 0.7843137, 0, 1,
-1.002157, 1.048888, -1.619331, 1, 0.7921569, 0, 1,
-0.9951928, -1.241691, -4.626298, 1, 0.7960784, 0, 1,
-0.9926978, 0.2517594, -1.708083, 1, 0.8039216, 0, 1,
-0.9879475, -0.3483561, -3.969374, 1, 0.8117647, 0, 1,
-0.9720383, -0.6055459, -3.299558, 1, 0.8156863, 0, 1,
-0.9640217, 0.09062143, -1.926573, 1, 0.8235294, 0, 1,
-0.963818, 2.93125, 1.183764, 1, 0.827451, 0, 1,
-0.9576339, 0.8601647, -1.579757, 1, 0.8352941, 0, 1,
-0.9548227, 0.8186917, 0.437396, 1, 0.8392157, 0, 1,
-0.9433864, -1.078755, -2.101676, 1, 0.8470588, 0, 1,
-0.9432365, -1.137221, -3.118562, 1, 0.8509804, 0, 1,
-0.9426055, -0.2358834, -1.85031, 1, 0.8588235, 0, 1,
-0.9277576, 1.087091, -1.316142, 1, 0.8627451, 0, 1,
-0.9226624, 0.2372646, -1.770359, 1, 0.8705882, 0, 1,
-0.9208913, 0.07135985, -2.359303, 1, 0.8745098, 0, 1,
-0.9206439, 0.1518664, -0.6627759, 1, 0.8823529, 0, 1,
-0.913431, -2.246035, -3.860548, 1, 0.8862745, 0, 1,
-0.9084284, 0.12886, -2.160763, 1, 0.8941177, 0, 1,
-0.9079716, 0.3924288, -0.4388338, 1, 0.8980392, 0, 1,
-0.9071994, 0.6495708, -1.381181, 1, 0.9058824, 0, 1,
-0.9038048, 1.394978, -0.2595069, 1, 0.9137255, 0, 1,
-0.9035076, -0.5206907, -1.508915, 1, 0.9176471, 0, 1,
-0.8973746, 0.4413627, 1.299504, 1, 0.9254902, 0, 1,
-0.889536, 0.8844094, -1.143018, 1, 0.9294118, 0, 1,
-0.8800247, -2.567359, -2.545635, 1, 0.9372549, 0, 1,
-0.8705651, -0.5330195, -2.99012, 1, 0.9411765, 0, 1,
-0.8669665, -0.5220236, -1.686002, 1, 0.9490196, 0, 1,
-0.8632866, -0.6147611, -2.370719, 1, 0.9529412, 0, 1,
-0.8607146, -2.604492, -2.016342, 1, 0.9607843, 0, 1,
-0.8606315, -0.2981474, -1.572674, 1, 0.9647059, 0, 1,
-0.8604732, 0.7013354, -0.7023651, 1, 0.972549, 0, 1,
-0.8583163, 0.09463236, -1.396479, 1, 0.9764706, 0, 1,
-0.8574294, -1.781478, -3.102295, 1, 0.9843137, 0, 1,
-0.857324, 0.1538204, -0.1881854, 1, 0.9882353, 0, 1,
-0.8546645, -1.216265, -3.114641, 1, 0.9960784, 0, 1,
-0.8541865, -0.6614354, -2.514703, 0.9960784, 1, 0, 1,
-0.8535809, -0.5051013, -1.576512, 0.9921569, 1, 0, 1,
-0.8533334, 0.1424226, -0.003103261, 0.9843137, 1, 0, 1,
-0.85125, 1.711378, 1.082197, 0.9803922, 1, 0, 1,
-0.8503629, 0.3275784, -1.050354, 0.972549, 1, 0, 1,
-0.8488548, -0.06402991, -0.8875662, 0.9686275, 1, 0, 1,
-0.8449185, -0.3381865, -2.666216, 0.9607843, 1, 0, 1,
-0.8349428, 0.5820609, -1.241416, 0.9568627, 1, 0, 1,
-0.8330113, 1.179012, 0.3312496, 0.9490196, 1, 0, 1,
-0.8301077, -0.7563882, -0.273621, 0.945098, 1, 0, 1,
-0.8300441, -0.1202078, -0.9815786, 0.9372549, 1, 0, 1,
-0.8290682, -1.399826, -2.417724, 0.9333333, 1, 0, 1,
-0.8275338, -1.67345, -3.416571, 0.9254902, 1, 0, 1,
-0.8261033, 0.5347664, 0.9395728, 0.9215686, 1, 0, 1,
-0.825368, 0.9951394, -1.481358, 0.9137255, 1, 0, 1,
-0.8239718, 0.3866549, -1.59961, 0.9098039, 1, 0, 1,
-0.8177031, -0.442521, -2.426754, 0.9019608, 1, 0, 1,
-0.8172506, 0.7980877, -1.4973, 0.8941177, 1, 0, 1,
-0.8171111, -0.243554, -1.724915, 0.8901961, 1, 0, 1,
-0.8114291, -0.5897601, -1.41424, 0.8823529, 1, 0, 1,
-0.8067421, -0.1302321, -1.49569, 0.8784314, 1, 0, 1,
-0.8046408, -0.5466986, -2.126545, 0.8705882, 1, 0, 1,
-0.8020951, 1.423787, 1.68156, 0.8666667, 1, 0, 1,
-0.7969624, -1.347611, -2.085625, 0.8588235, 1, 0, 1,
-0.7962472, 0.02353566, -1.272681, 0.854902, 1, 0, 1,
-0.7926317, 0.03007918, -1.612786, 0.8470588, 1, 0, 1,
-0.787154, 0.3974321, -0.7747328, 0.8431373, 1, 0, 1,
-0.786341, 2.36672, 1.119862, 0.8352941, 1, 0, 1,
-0.7862195, 0.1822937, -0.4490318, 0.8313726, 1, 0, 1,
-0.7825679, -0.3999166, -3.123683, 0.8235294, 1, 0, 1,
-0.7812972, -0.8842463, -2.365693, 0.8196079, 1, 0, 1,
-0.776113, -1.61006, -0.949659, 0.8117647, 1, 0, 1,
-0.7753193, -0.9151253, -2.927183, 0.8078431, 1, 0, 1,
-0.773056, 0.4958853, -0.9575035, 0.8, 1, 0, 1,
-0.7725272, -1.024927, -3.326077, 0.7921569, 1, 0, 1,
-0.7723762, 2.66063, 1.47343, 0.7882353, 1, 0, 1,
-0.7685046, 1.475768, -0.6661875, 0.7803922, 1, 0, 1,
-0.762949, -1.77068, -1.650848, 0.7764706, 1, 0, 1,
-0.7555497, 0.7967318, -0.2986656, 0.7686275, 1, 0, 1,
-0.7531047, -1.184977, -3.155536, 0.7647059, 1, 0, 1,
-0.7444671, -0.8217829, -4.417004, 0.7568628, 1, 0, 1,
-0.7416689, -0.1751063, -2.391828, 0.7529412, 1, 0, 1,
-0.7412667, 1.114067, -0.6171726, 0.7450981, 1, 0, 1,
-0.7394515, 0.1371323, -0.5828108, 0.7411765, 1, 0, 1,
-0.7292338, 0.4095655, -0.4194304, 0.7333333, 1, 0, 1,
-0.7284652, 0.5176017, -1.977723, 0.7294118, 1, 0, 1,
-0.7245622, -0.7663844, -1.453454, 0.7215686, 1, 0, 1,
-0.7234076, 0.6063954, 1.49502, 0.7176471, 1, 0, 1,
-0.7233838, 0.4871697, 1.405579, 0.7098039, 1, 0, 1,
-0.7189907, 0.01501219, -1.164981, 0.7058824, 1, 0, 1,
-0.7189417, 0.2386909, -0.5533475, 0.6980392, 1, 0, 1,
-0.717751, -0.8153519, -1.777081, 0.6901961, 1, 0, 1,
-0.714276, 1.060606, 0.9001275, 0.6862745, 1, 0, 1,
-0.713376, -0.6772862, -2.652173, 0.6784314, 1, 0, 1,
-0.7113186, 0.1948665, -0.5704834, 0.6745098, 1, 0, 1,
-0.7097652, -0.2573048, -2.238972, 0.6666667, 1, 0, 1,
-0.7070772, 0.7082116, -0.159395, 0.6627451, 1, 0, 1,
-0.705195, 0.4331327, -0.7717348, 0.654902, 1, 0, 1,
-0.7040408, 0.4802399, -0.7510667, 0.6509804, 1, 0, 1,
-0.7040117, 1.5711, -0.4390313, 0.6431373, 1, 0, 1,
-0.6958799, 1.697109, 0.2294117, 0.6392157, 1, 0, 1,
-0.6951131, 0.4423634, -1.319178, 0.6313726, 1, 0, 1,
-0.6906387, -0.8795539, -4.109843, 0.627451, 1, 0, 1,
-0.6894975, 0.9463985, 0.8367303, 0.6196079, 1, 0, 1,
-0.6869798, 0.103927, -1.804229, 0.6156863, 1, 0, 1,
-0.6851488, -0.3315187, -3.416769, 0.6078432, 1, 0, 1,
-0.6832782, -0.1574587, -2.597419, 0.6039216, 1, 0, 1,
-0.6810567, 0.7806717, -0.8901294, 0.5960785, 1, 0, 1,
-0.6807991, 0.1113721, -2.402299, 0.5882353, 1, 0, 1,
-0.6794971, 1.057884, 0.5986937, 0.5843138, 1, 0, 1,
-0.675767, 0.402307, -1.219541, 0.5764706, 1, 0, 1,
-0.6751977, -0.6180114, -2.371464, 0.572549, 1, 0, 1,
-0.6709443, 0.1711925, -2.084813, 0.5647059, 1, 0, 1,
-0.670543, 2.476941, 1.887129, 0.5607843, 1, 0, 1,
-0.6696714, -0.9500214, -5.152315, 0.5529412, 1, 0, 1,
-0.6673986, -0.1460806, -1.940482, 0.5490196, 1, 0, 1,
-0.6633543, -0.67348, -2.784048, 0.5411765, 1, 0, 1,
-0.6597998, 1.174525, 0.9273025, 0.5372549, 1, 0, 1,
-0.6532876, -1.626253, -1.688161, 0.5294118, 1, 0, 1,
-0.6518174, 0.3028646, -1.274061, 0.5254902, 1, 0, 1,
-0.6499256, -1.066949, -2.183846, 0.5176471, 1, 0, 1,
-0.6447083, 1.978287, -0.3133253, 0.5137255, 1, 0, 1,
-0.6412745, -0.9857069, -1.337949, 0.5058824, 1, 0, 1,
-0.6398441, -0.9047655, -3.518074, 0.5019608, 1, 0, 1,
-0.6321174, 0.6517372, 0.1354178, 0.4941176, 1, 0, 1,
-0.6296129, -2.276701, -0.7574916, 0.4862745, 1, 0, 1,
-0.6283106, -0.262697, -3.538156, 0.4823529, 1, 0, 1,
-0.6248217, 0.5306517, 0.04170955, 0.4745098, 1, 0, 1,
-0.6234574, -0.2955899, -2.276842, 0.4705882, 1, 0, 1,
-0.6221467, 0.4233904, -3.701562, 0.4627451, 1, 0, 1,
-0.6202633, -1.078179, -3.970136, 0.4588235, 1, 0, 1,
-0.610674, -0.5520185, -2.985834, 0.4509804, 1, 0, 1,
-0.6055309, 0.3781132, -1.823843, 0.4470588, 1, 0, 1,
-0.604168, 0.7816856, 0.6818201, 0.4392157, 1, 0, 1,
-0.6025226, -1.642775, -2.526972, 0.4352941, 1, 0, 1,
-0.6012759, 0.06594019, -1.426847, 0.427451, 1, 0, 1,
-0.5960898, -0.4421204, -1.182242, 0.4235294, 1, 0, 1,
-0.5953124, -0.08619461, -1.01333, 0.4156863, 1, 0, 1,
-0.5883131, -0.1030968, -1.69659, 0.4117647, 1, 0, 1,
-0.5866871, 0.7947547, -0.5086911, 0.4039216, 1, 0, 1,
-0.5806013, 2.088852, -1.386527, 0.3960784, 1, 0, 1,
-0.5802684, 0.2418129, -1.648442, 0.3921569, 1, 0, 1,
-0.5798767, -1.460149, -3.449826, 0.3843137, 1, 0, 1,
-0.5589848, 1.148641, -2.264982, 0.3803922, 1, 0, 1,
-0.558402, 1.184306, -0.08101034, 0.372549, 1, 0, 1,
-0.5564915, -0.09156881, -0.1065038, 0.3686275, 1, 0, 1,
-0.555746, 1.094389, 0.9184697, 0.3607843, 1, 0, 1,
-0.5505503, -1.213524, -2.595769, 0.3568628, 1, 0, 1,
-0.54785, 2.780553, -0.5930865, 0.3490196, 1, 0, 1,
-0.5474697, -1.149834, -2.443988, 0.345098, 1, 0, 1,
-0.5467414, 0.7470251, -0.5332084, 0.3372549, 1, 0, 1,
-0.5404465, -0.0600968, -3.474963, 0.3333333, 1, 0, 1,
-0.538557, -0.7786698, -3.166167, 0.3254902, 1, 0, 1,
-0.5342787, -0.7236003, -2.482903, 0.3215686, 1, 0, 1,
-0.5254164, -1.329092, -0.9281669, 0.3137255, 1, 0, 1,
-0.5245439, 0.2724105, -1.455268, 0.3098039, 1, 0, 1,
-0.5214768, -0.118594, -3.096013, 0.3019608, 1, 0, 1,
-0.5140066, -0.82864, -2.628787, 0.2941177, 1, 0, 1,
-0.5122858, 0.1963342, -1.745762, 0.2901961, 1, 0, 1,
-0.5122817, 1.114437, 0.2202497, 0.282353, 1, 0, 1,
-0.5063563, -0.5804414, -1.927287, 0.2784314, 1, 0, 1,
-0.5048426, -0.3524057, -0.7020954, 0.2705882, 1, 0, 1,
-0.5040429, -0.7465651, -2.549109, 0.2666667, 1, 0, 1,
-0.5006178, -0.2620808, -2.100341, 0.2588235, 1, 0, 1,
-0.4971619, 0.9722165, -1.01641, 0.254902, 1, 0, 1,
-0.4924151, 2.127819, 1.138708, 0.2470588, 1, 0, 1,
-0.4904043, 0.9252084, -1.713729, 0.2431373, 1, 0, 1,
-0.4814945, -0.7939572, -2.055333, 0.2352941, 1, 0, 1,
-0.4811759, -1.644635, -3.17595, 0.2313726, 1, 0, 1,
-0.4794607, -0.5052367, -4.258745, 0.2235294, 1, 0, 1,
-0.4781822, 0.06678602, -1.105408, 0.2196078, 1, 0, 1,
-0.4776674, -0.3584292, -2.288595, 0.2117647, 1, 0, 1,
-0.4754257, -0.07897269, -1.321532, 0.2078431, 1, 0, 1,
-0.4687927, 1.388323, -0.252195, 0.2, 1, 0, 1,
-0.4621762, -0.0891128, -1.044849, 0.1921569, 1, 0, 1,
-0.4598716, -0.152342, -3.127246, 0.1882353, 1, 0, 1,
-0.4580809, 0.1717611, -0.1353334, 0.1803922, 1, 0, 1,
-0.4521266, -0.4862696, -2.667265, 0.1764706, 1, 0, 1,
-0.4501675, 0.6045194, -2.624336, 0.1686275, 1, 0, 1,
-0.4481248, -0.7790747, -2.674234, 0.1647059, 1, 0, 1,
-0.4469615, -0.5139564, -3.74121, 0.1568628, 1, 0, 1,
-0.4377289, -0.05028275, -1.955644, 0.1529412, 1, 0, 1,
-0.4362568, -0.8359632, -0.9031808, 0.145098, 1, 0, 1,
-0.4351608, 0.2577181, -1.772859, 0.1411765, 1, 0, 1,
-0.4336323, 1.74664, -0.2485469, 0.1333333, 1, 0, 1,
-0.4301673, -0.0540377, -0.9094434, 0.1294118, 1, 0, 1,
-0.4268276, 0.2039056, 0.3333958, 0.1215686, 1, 0, 1,
-0.4261985, 0.4556409, -2.935493, 0.1176471, 1, 0, 1,
-0.420911, -0.2222821, -3.001922, 0.1098039, 1, 0, 1,
-0.4142464, 0.1209632, -0.9057681, 0.1058824, 1, 0, 1,
-0.4105277, -0.4018663, -2.072121, 0.09803922, 1, 0, 1,
-0.4080061, -0.369176, -2.280921, 0.09019608, 1, 0, 1,
-0.4049536, 0.4848759, -0.1984998, 0.08627451, 1, 0, 1,
-0.4019756, -1.701065, -1.611727, 0.07843138, 1, 0, 1,
-0.4007467, 0.9045972, -0.3413416, 0.07450981, 1, 0, 1,
-0.4005065, 0.3989273, -1.039463, 0.06666667, 1, 0, 1,
-0.4001365, 0.5460421, -1.346192, 0.0627451, 1, 0, 1,
-0.3969023, 1.235735, -0.3021867, 0.05490196, 1, 0, 1,
-0.3925874, 1.098566, -1.074647, 0.05098039, 1, 0, 1,
-0.3925475, 0.1729966, -1.588532, 0.04313726, 1, 0, 1,
-0.3924378, -2.235578, -3.125142, 0.03921569, 1, 0, 1,
-0.3904478, 0.8714257, -0.338929, 0.03137255, 1, 0, 1,
-0.3878726, 0.340141, -0.5245385, 0.02745098, 1, 0, 1,
-0.3814518, -0.3189512, -2.185214, 0.01960784, 1, 0, 1,
-0.3787019, 2.332041, -0.6541536, 0.01568628, 1, 0, 1,
-0.3751187, 0.9812285, -0.7660169, 0.007843138, 1, 0, 1,
-0.3591204, 1.517319, -0.3707357, 0.003921569, 1, 0, 1,
-0.3575058, -0.7883319, -1.746563, 0, 1, 0.003921569, 1,
-0.3552309, 2.059218, -1.037519, 0, 1, 0.01176471, 1,
-0.3517139, -0.7725857, -1.229586, 0, 1, 0.01568628, 1,
-0.3416368, 0.159196, -0.04507637, 0, 1, 0.02352941, 1,
-0.339014, 2.136963, 0.1930969, 0, 1, 0.02745098, 1,
-0.3353277, 0.8154915, 1.206071, 0, 1, 0.03529412, 1,
-0.3327777, 0.1677632, -0.6021481, 0, 1, 0.03921569, 1,
-0.3301516, -0.47408, -2.528368, 0, 1, 0.04705882, 1,
-0.3282698, -0.8226938, -2.645718, 0, 1, 0.05098039, 1,
-0.3259984, -1.276295, -2.516631, 0, 1, 0.05882353, 1,
-0.3249653, -0.4046502, -2.856063, 0, 1, 0.0627451, 1,
-0.319673, -0.2013121, -0.9928525, 0, 1, 0.07058824, 1,
-0.3134791, -0.7057506, -3.079162, 0, 1, 0.07450981, 1,
-0.310654, 0.1762122, -0.01651443, 0, 1, 0.08235294, 1,
-0.3088004, -1.279957, -3.420925, 0, 1, 0.08627451, 1,
-0.3058733, 0.01114446, -0.2909129, 0, 1, 0.09411765, 1,
-0.3026672, -0.2299269, -4.450246, 0, 1, 0.1019608, 1,
-0.3014157, -0.4980769, -1.933667, 0, 1, 0.1058824, 1,
-0.2954394, 0.7387243, -0.2555823, 0, 1, 0.1137255, 1,
-0.2944098, 1.070049, -0.4738322, 0, 1, 0.1176471, 1,
-0.2926672, 0.5524828, -0.554593, 0, 1, 0.1254902, 1,
-0.2899575, 0.9272647, -1.112006, 0, 1, 0.1294118, 1,
-0.289156, 0.4337547, 1.134093, 0, 1, 0.1372549, 1,
-0.2887525, 1.50514, 0.47357, 0, 1, 0.1411765, 1,
-0.2878921, 1.294982, -1.098866, 0, 1, 0.1490196, 1,
-0.2872549, -0.8754658, -2.675692, 0, 1, 0.1529412, 1,
-0.2836711, -2.077361, -2.946043, 0, 1, 0.1607843, 1,
-0.2832612, 0.5760438, -1.095926, 0, 1, 0.1647059, 1,
-0.282078, -1.450208, -3.60806, 0, 1, 0.172549, 1,
-0.2765194, 0.1649558, -1.101135, 0, 1, 0.1764706, 1,
-0.2761413, -1.033346, -2.620863, 0, 1, 0.1843137, 1,
-0.2718961, 0.1480586, -0.7268495, 0, 1, 0.1882353, 1,
-0.2645985, -0.1025668, -2.735579, 0, 1, 0.1960784, 1,
-0.2628522, 0.8050187, 0.7246643, 0, 1, 0.2039216, 1,
-0.2623316, 0.07776938, -0.5078647, 0, 1, 0.2078431, 1,
-0.255702, 1.461086, -1.665967, 0, 1, 0.2156863, 1,
-0.2547562, 1.438206, 1.062224, 0, 1, 0.2196078, 1,
-0.2541657, 1.228957, -0.5007638, 0, 1, 0.227451, 1,
-0.2539171, 0.2933934, 0.9269674, 0, 1, 0.2313726, 1,
-0.2520923, -0.2134936, -1.792142, 0, 1, 0.2392157, 1,
-0.2506736, -0.4962448, -4.142279, 0, 1, 0.2431373, 1,
-0.2502692, 0.4286381, 0.8692622, 0, 1, 0.2509804, 1,
-0.2490775, -0.5911098, -1.466048, 0, 1, 0.254902, 1,
-0.2460633, 0.2322487, 0.3409062, 0, 1, 0.2627451, 1,
-0.2424857, 0.4354602, -0.893476, 0, 1, 0.2666667, 1,
-0.2378197, -0.6055659, -1.61252, 0, 1, 0.2745098, 1,
-0.228325, 0.2047613, -2.842617, 0, 1, 0.2784314, 1,
-0.2276861, 0.5548539, -1.67102, 0, 1, 0.2862745, 1,
-0.2229085, -0.8410809, -4.884776, 0, 1, 0.2901961, 1,
-0.2165237, -0.9458059, -3.181676, 0, 1, 0.2980392, 1,
-0.2127119, 0.8110117, 0.2091281, 0, 1, 0.3058824, 1,
-0.2030906, 0.5351549, -0.8672078, 0, 1, 0.3098039, 1,
-0.2026838, 0.5810799, -1.553978, 0, 1, 0.3176471, 1,
-0.2011075, 0.002384487, 0.08712015, 0, 1, 0.3215686, 1,
-0.1997076, 0.1258349, -0.7441224, 0, 1, 0.3294118, 1,
-0.188026, -2.212613, -3.578529, 0, 1, 0.3333333, 1,
-0.1879124, 0.7941633, 1.006034, 0, 1, 0.3411765, 1,
-0.1852253, -0.2422933, -3.062561, 0, 1, 0.345098, 1,
-0.1835894, 1.484684, -0.1927394, 0, 1, 0.3529412, 1,
-0.177426, 0.3280319, -0.7845954, 0, 1, 0.3568628, 1,
-0.1759337, -1.195686, -2.996707, 0, 1, 0.3647059, 1,
-0.1742097, -0.6921465, -3.816198, 0, 1, 0.3686275, 1,
-0.1736721, -1.980509, -2.624688, 0, 1, 0.3764706, 1,
-0.1721319, 0.4802579, 0.8100028, 0, 1, 0.3803922, 1,
-0.1665847, 2.371834, -0.7155283, 0, 1, 0.3882353, 1,
-0.1651679, 0.3214613, -1.423144, 0, 1, 0.3921569, 1,
-0.1644492, 0.3525259, -0.2696157, 0, 1, 0.4, 1,
-0.1638025, -0.3904029, -4.159616, 0, 1, 0.4078431, 1,
-0.1623812, 1.219004, 0.09920542, 0, 1, 0.4117647, 1,
-0.162321, -0.09534074, -3.315542, 0, 1, 0.4196078, 1,
-0.1609467, -1.445143, -2.536697, 0, 1, 0.4235294, 1,
-0.1581288, 0.2586441, -0.3651333, 0, 1, 0.4313726, 1,
-0.1482912, 0.1910471, -2.381157, 0, 1, 0.4352941, 1,
-0.1477219, 0.4533664, 1.591863, 0, 1, 0.4431373, 1,
-0.1453748, 0.2983971, 0.6877007, 0, 1, 0.4470588, 1,
-0.1380901, -0.4513879, -2.027741, 0, 1, 0.454902, 1,
-0.1339096, -1.063204, -1.646102, 0, 1, 0.4588235, 1,
-0.1319648, -0.380248, -2.157754, 0, 1, 0.4666667, 1,
-0.1228623, 1.603228, 0.3818301, 0, 1, 0.4705882, 1,
-0.1201158, 1.088224, 1.304133, 0, 1, 0.4784314, 1,
-0.1168315, -0.1582383, -1.206119, 0, 1, 0.4823529, 1,
-0.1159021, 0.1206114, -1.563028, 0, 1, 0.4901961, 1,
-0.108461, -1.463047, -2.22107, 0, 1, 0.4941176, 1,
-0.1063005, -1.088749, -3.742945, 0, 1, 0.5019608, 1,
-0.0969032, -1.181396, -4.180262, 0, 1, 0.509804, 1,
-0.09688757, 0.5101278, 0.2288853, 0, 1, 0.5137255, 1,
-0.09205834, 0.07167044, -0.2628, 0, 1, 0.5215687, 1,
-0.08774006, 1.400623, -0.07965471, 0, 1, 0.5254902, 1,
-0.08555676, -1.287165, -3.375873, 0, 1, 0.5333334, 1,
-0.0836563, 0.624119, 0.5401888, 0, 1, 0.5372549, 1,
-0.08091141, 0.3090416, 0.2356109, 0, 1, 0.5450981, 1,
-0.07858805, 0.6334391, 0.2566456, 0, 1, 0.5490196, 1,
-0.07712144, 0.495154, 0.290351, 0, 1, 0.5568628, 1,
-0.07567387, 0.4192249, -0.7044275, 0, 1, 0.5607843, 1,
-0.07312441, 0.7086104, 0.7312078, 0, 1, 0.5686275, 1,
-0.07264777, -0.007954222, -2.025654, 0, 1, 0.572549, 1,
-0.07228648, 1.151786, -1.139172, 0, 1, 0.5803922, 1,
-0.07076818, 0.1922021, 0.2795372, 0, 1, 0.5843138, 1,
-0.06879371, -1.403201, -2.846248, 0, 1, 0.5921569, 1,
-0.06830051, -1.141639, -4.620039, 0, 1, 0.5960785, 1,
-0.06580707, -0.09810499, -2.853453, 0, 1, 0.6039216, 1,
-0.06183431, -0.56023, -1.695225, 0, 1, 0.6117647, 1,
-0.06022758, 0.4672201, -1.174341, 0, 1, 0.6156863, 1,
-0.05866307, -0.8915688, -3.708711, 0, 1, 0.6235294, 1,
-0.05758914, -1.214526, -2.721741, 0, 1, 0.627451, 1,
-0.05524122, -0.189537, -3.033088, 0, 1, 0.6352941, 1,
-0.05439724, -0.9276427, -5.436902, 0, 1, 0.6392157, 1,
-0.05271751, -1.235526, -2.288622, 0, 1, 0.6470588, 1,
-0.04881432, -0.6189875, -4.908734, 0, 1, 0.6509804, 1,
-0.04665579, 1.56653, 1.721269, 0, 1, 0.6588235, 1,
-0.04143579, 0.431313, -0.4427366, 0, 1, 0.6627451, 1,
-0.04014939, -0.8208651, -2.143425, 0, 1, 0.6705883, 1,
-0.03640299, 1.413665, -1.894817, 0, 1, 0.6745098, 1,
-0.03422635, 2.28327, 0.700939, 0, 1, 0.682353, 1,
-0.02985784, -0.0782629, -4.007599, 0, 1, 0.6862745, 1,
-0.02973799, -0.2943673, -3.700536, 0, 1, 0.6941177, 1,
-0.02645771, -0.02910888, -3.021704, 0, 1, 0.7019608, 1,
-0.02398604, -0.7036211, -4.308188, 0, 1, 0.7058824, 1,
-0.02256234, 1.691585, 0.3682064, 0, 1, 0.7137255, 1,
-0.01960436, -0.01830254, -2.998309, 0, 1, 0.7176471, 1,
-0.01808219, -0.7794024, -0.3044213, 0, 1, 0.7254902, 1,
-0.01741015, -0.9552494, -2.888435, 0, 1, 0.7294118, 1,
-0.01449747, 1.444336, -0.5658244, 0, 1, 0.7372549, 1,
-0.01038391, 0.2728298, -1.690797, 0, 1, 0.7411765, 1,
-0.006020634, -1.691626, -4.871385, 0, 1, 0.7490196, 1,
-0.004066329, 0.2821372, 1.183366, 0, 1, 0.7529412, 1,
-0.002909634, 0.3940635, -0.768499, 0, 1, 0.7607843, 1,
-0.001850984, 0.02143826, -0.7118446, 0, 1, 0.7647059, 1,
0.002330145, -0.2406958, 4.746706, 0, 1, 0.772549, 1,
0.002570564, -0.4228351, 5.022844, 0, 1, 0.7764706, 1,
0.006104702, 0.3642405, -0.02743496, 0, 1, 0.7843137, 1,
0.007374372, 0.3035897, -1.439551, 0, 1, 0.7882353, 1,
0.008639475, 2.013605, 0.0476068, 0, 1, 0.7960784, 1,
0.013403, -0.9477415, 2.227763, 0, 1, 0.8039216, 1,
0.0138065, -2.173986, 2.166096, 0, 1, 0.8078431, 1,
0.01801949, 0.4486282, -0.3254941, 0, 1, 0.8156863, 1,
0.01870773, 0.2084979, -0.7326304, 0, 1, 0.8196079, 1,
0.02131129, 1.315295, 1.721017, 0, 1, 0.827451, 1,
0.0246441, 1.114602, -1.957832, 0, 1, 0.8313726, 1,
0.02520501, 1.185766, -1.268465, 0, 1, 0.8392157, 1,
0.02858759, -1.238191, 2.133347, 0, 1, 0.8431373, 1,
0.03047522, -0.6593362, 2.171429, 0, 1, 0.8509804, 1,
0.03986511, -0.9757448, 1.617939, 0, 1, 0.854902, 1,
0.04207303, -2.066005, 2.612059, 0, 1, 0.8627451, 1,
0.04320702, 0.433194, -1.746035, 0, 1, 0.8666667, 1,
0.04398131, -0.3573411, 2.709652, 0, 1, 0.8745098, 1,
0.0453668, 1.365346, -1.353432, 0, 1, 0.8784314, 1,
0.05137934, 0.02320577, 1.502015, 0, 1, 0.8862745, 1,
0.05459145, -0.2903737, 2.227976, 0, 1, 0.8901961, 1,
0.05890491, -0.76494, 3.008989, 0, 1, 0.8980392, 1,
0.05919081, -1.604866, 2.539952, 0, 1, 0.9058824, 1,
0.06183469, -1.306025, 1.881925, 0, 1, 0.9098039, 1,
0.06405091, -0.03210163, 1.599126, 0, 1, 0.9176471, 1,
0.06459774, -0.5381467, 1.97996, 0, 1, 0.9215686, 1,
0.06489924, 0.4704586, 1.159204, 0, 1, 0.9294118, 1,
0.06774966, -2.216049, 3.626017, 0, 1, 0.9333333, 1,
0.07056262, -0.5349191, 4.259968, 0, 1, 0.9411765, 1,
0.07147234, -1.189004, 5.580526, 0, 1, 0.945098, 1,
0.07241916, 0.6799267, 0.9727863, 0, 1, 0.9529412, 1,
0.07421137, -0.6831898, 3.146976, 0, 1, 0.9568627, 1,
0.07451267, 0.9719191, -0.2670409, 0, 1, 0.9647059, 1,
0.07635775, 0.3614927, 0.1614183, 0, 1, 0.9686275, 1,
0.08265825, -0.01139394, 2.551434, 0, 1, 0.9764706, 1,
0.08366564, 1.149888, -0.4993451, 0, 1, 0.9803922, 1,
0.08808897, -0.1511496, 2.117903, 0, 1, 0.9882353, 1,
0.09096568, -0.1139748, 3.317652, 0, 1, 0.9921569, 1,
0.09416559, 0.4668492, 1.178366, 0, 1, 1, 1,
0.0972069, -0.965398, 2.510903, 0, 0.9921569, 1, 1,
0.09807178, -1.411419, 2.571945, 0, 0.9882353, 1, 1,
0.09982048, 1.757979, 0.9526587, 0, 0.9803922, 1, 1,
0.09998596, 1.773987, -1.806268, 0, 0.9764706, 1, 1,
0.1004859, 0.06808098, -0.03911037, 0, 0.9686275, 1, 1,
0.1045498, -1.49982, 3.058026, 0, 0.9647059, 1, 1,
0.109318, -1.564147, 3.093658, 0, 0.9568627, 1, 1,
0.1147096, 1.02931, -0.1049321, 0, 0.9529412, 1, 1,
0.1173439, 0.8725277, 1.345215, 0, 0.945098, 1, 1,
0.1176225, 0.6778983, 1.260399, 0, 0.9411765, 1, 1,
0.1193099, -1.162851, 1.004459, 0, 0.9333333, 1, 1,
0.1327029, -0.4459406, 2.615593, 0, 0.9294118, 1, 1,
0.1349227, -0.2661555, 0.6890396, 0, 0.9215686, 1, 1,
0.1375984, -0.2570488, 1.843595, 0, 0.9176471, 1, 1,
0.1381246, -0.290118, 3.971122, 0, 0.9098039, 1, 1,
0.1394255, 0.9915096, -0.4598044, 0, 0.9058824, 1, 1,
0.1416625, -0.4823671, 3.955494, 0, 0.8980392, 1, 1,
0.1542091, 0.8036784, -0.2520648, 0, 0.8901961, 1, 1,
0.1555087, -0.246604, 1.923657, 0, 0.8862745, 1, 1,
0.160143, 1.35894, -0.3637445, 0, 0.8784314, 1, 1,
0.1606951, 0.3472135, 1.569092, 0, 0.8745098, 1, 1,
0.1658813, 0.4115047, 0.2518207, 0, 0.8666667, 1, 1,
0.1699128, 0.566903, 0.8232859, 0, 0.8627451, 1, 1,
0.1722189, 1.292009, 0.2597434, 0, 0.854902, 1, 1,
0.1723794, -0.2543089, 2.605117, 0, 0.8509804, 1, 1,
0.1740872, -0.771776, 2.597769, 0, 0.8431373, 1, 1,
0.1760069, -1.437085, 2.271063, 0, 0.8392157, 1, 1,
0.1768272, -0.5095863, 2.481528, 0, 0.8313726, 1, 1,
0.1784555, -0.6761023, 2.77702, 0, 0.827451, 1, 1,
0.1794654, -0.2679182, 2.742412, 0, 0.8196079, 1, 1,
0.1810739, 0.4536116, -0.05012615, 0, 0.8156863, 1, 1,
0.1830052, 0.1552324, 0.6975003, 0, 0.8078431, 1, 1,
0.1861769, 1.307553, 1.41392, 0, 0.8039216, 1, 1,
0.1882458, -0.4520047, 3.900917, 0, 0.7960784, 1, 1,
0.189704, -0.6138062, 2.914187, 0, 0.7882353, 1, 1,
0.1966939, -0.2933728, 1.656074, 0, 0.7843137, 1, 1,
0.2004788, 1.199641, 0.8950808, 0, 0.7764706, 1, 1,
0.2014491, -1.932115, 2.162651, 0, 0.772549, 1, 1,
0.2024429, -0.2482405, 3.710847, 0, 0.7647059, 1, 1,
0.2073505, 1.323164, -0.6224227, 0, 0.7607843, 1, 1,
0.2084192, 0.5736702, -1.177757, 0, 0.7529412, 1, 1,
0.209617, 0.9077181, -0.2656037, 0, 0.7490196, 1, 1,
0.2100127, -0.4016016, 2.027267, 0, 0.7411765, 1, 1,
0.2111949, 0.5471119, 1.240957, 0, 0.7372549, 1, 1,
0.213766, 0.6013756, -0.4852466, 0, 0.7294118, 1, 1,
0.2152697, -1.121665, 2.127748, 0, 0.7254902, 1, 1,
0.2154796, -0.7957246, 2.509997, 0, 0.7176471, 1, 1,
0.2193959, 0.7569146, 1.142493, 0, 0.7137255, 1, 1,
0.2244994, 0.09106529, 0.7850829, 0, 0.7058824, 1, 1,
0.2273178, -0.4517038, 3.024034, 0, 0.6980392, 1, 1,
0.2313367, 1.104719, 1.23461, 0, 0.6941177, 1, 1,
0.232987, -0.05240086, 0.9136246, 0, 0.6862745, 1, 1,
0.2335315, -0.8969334, 1.460046, 0, 0.682353, 1, 1,
0.2356357, 0.152239, 0.9725266, 0, 0.6745098, 1, 1,
0.2371127, 0.1975101, 0.4652619, 0, 0.6705883, 1, 1,
0.237673, -0.3961913, 3.548942, 0, 0.6627451, 1, 1,
0.2380117, -0.5167318, 3.643391, 0, 0.6588235, 1, 1,
0.2388165, -0.5305577, 2.456156, 0, 0.6509804, 1, 1,
0.2428371, -1.202849, 3.616757, 0, 0.6470588, 1, 1,
0.24687, 0.3507072, 0.8512323, 0, 0.6392157, 1, 1,
0.2469864, 0.6428649, -0.6017084, 0, 0.6352941, 1, 1,
0.2475529, -1.885095, 4.632389, 0, 0.627451, 1, 1,
0.2489951, 0.6373086, 0.1639353, 0, 0.6235294, 1, 1,
0.251899, 1.622767, 0.3603879, 0, 0.6156863, 1, 1,
0.2533123, -0.2604616, 2.818963, 0, 0.6117647, 1, 1,
0.2538225, 0.2626756, 1.335063, 0, 0.6039216, 1, 1,
0.2545853, -1.465375, 2.938268, 0, 0.5960785, 1, 1,
0.2580048, -0.2660994, 1.023116, 0, 0.5921569, 1, 1,
0.2584235, 0.2917615, 1.244259, 0, 0.5843138, 1, 1,
0.2597077, 0.3860572, -0.7025343, 0, 0.5803922, 1, 1,
0.2622623, 0.5354776, 0.06352247, 0, 0.572549, 1, 1,
0.2643089, 0.5473189, 0.8532714, 0, 0.5686275, 1, 1,
0.26624, 0.3919488, 1.020968, 0, 0.5607843, 1, 1,
0.2662587, 0.375679, 1.557932, 0, 0.5568628, 1, 1,
0.2699206, 0.3843054, 1.43648, 0, 0.5490196, 1, 1,
0.2759905, -1.07498, 2.439817, 0, 0.5450981, 1, 1,
0.2767353, 0.6036077, 0.6112825, 0, 0.5372549, 1, 1,
0.2781914, -1.475277, 4.358512, 0, 0.5333334, 1, 1,
0.279397, 0.8200095, -0.82905, 0, 0.5254902, 1, 1,
0.2799838, 0.05829328, 2.717303, 0, 0.5215687, 1, 1,
0.2842134, -0.1902626, 2.012579, 0, 0.5137255, 1, 1,
0.286904, 1.038804, 0.9888439, 0, 0.509804, 1, 1,
0.2879238, -0.8870422, 5.871557, 0, 0.5019608, 1, 1,
0.2891046, -1.082765, 2.891591, 0, 0.4941176, 1, 1,
0.2894496, 2.115613, 1.146049, 0, 0.4901961, 1, 1,
0.2961963, -1.829994, 1.881973, 0, 0.4823529, 1, 1,
0.296542, -1.607753, 1.670667, 0, 0.4784314, 1, 1,
0.2966615, -0.7238816, 1.379032, 0, 0.4705882, 1, 1,
0.2970922, 0.1433578, 0.8630294, 0, 0.4666667, 1, 1,
0.3025374, -1.329319, 3.133425, 0, 0.4588235, 1, 1,
0.30255, -1.055823, 3.322599, 0, 0.454902, 1, 1,
0.311531, 2.645471, -0.04474301, 0, 0.4470588, 1, 1,
0.3291867, 1.120614, 0.6003401, 0, 0.4431373, 1, 1,
0.3292761, 0.6190029, 1.005958, 0, 0.4352941, 1, 1,
0.3293723, 0.06862261, -0.6265767, 0, 0.4313726, 1, 1,
0.3314935, 0.01628668, 1.128589, 0, 0.4235294, 1, 1,
0.3336408, -0.2806219, 0.4563387, 0, 0.4196078, 1, 1,
0.3388547, 1.577346, 0.7318329, 0, 0.4117647, 1, 1,
0.3410393, -1.537899, 4.661666, 0, 0.4078431, 1, 1,
0.3421176, -0.4610332, 2.091859, 0, 0.4, 1, 1,
0.3454832, -0.2522921, 1.078193, 0, 0.3921569, 1, 1,
0.3460642, 0.2715988, 1.887603, 0, 0.3882353, 1, 1,
0.3466286, -1.770813, 1.804446, 0, 0.3803922, 1, 1,
0.3475623, 1.2317, -0.3682714, 0, 0.3764706, 1, 1,
0.3499591, 1.312122, -0.3535767, 0, 0.3686275, 1, 1,
0.3518019, 1.16073, -0.33493, 0, 0.3647059, 1, 1,
0.352758, 1.059769, -0.6046202, 0, 0.3568628, 1, 1,
0.353813, 1.921475, -0.8003731, 0, 0.3529412, 1, 1,
0.3619525, 0.6559261, 0.4187912, 0, 0.345098, 1, 1,
0.3621744, -0.01207573, 0.9034308, 0, 0.3411765, 1, 1,
0.3621792, 0.7393129, -0.2676162, 0, 0.3333333, 1, 1,
0.370829, 0.8666642, -0.5269395, 0, 0.3294118, 1, 1,
0.3765222, -0.7999974, 2.763173, 0, 0.3215686, 1, 1,
0.378489, 1.858201, -0.2555907, 0, 0.3176471, 1, 1,
0.3802529, -0.4627995, 3.839899, 0, 0.3098039, 1, 1,
0.38266, -0.2962466, 2.951841, 0, 0.3058824, 1, 1,
0.3841653, -0.388328, 3.639885, 0, 0.2980392, 1, 1,
0.3877548, 0.5255432, 0.4460389, 0, 0.2901961, 1, 1,
0.3879414, -0.1355588, 1.627638, 0, 0.2862745, 1, 1,
0.3943732, 0.04337876, 0.8680224, 0, 0.2784314, 1, 1,
0.3945397, 1.556095, 0.8872511, 0, 0.2745098, 1, 1,
0.3949256, 0.4375439, -0.4452317, 0, 0.2666667, 1, 1,
0.3974445, 1.411602, 2.491301, 0, 0.2627451, 1, 1,
0.4083086, -1.389246, 3.026376, 0, 0.254902, 1, 1,
0.4131409, 0.02015284, 1.268637, 0, 0.2509804, 1, 1,
0.4167173, 1.356459, -0.5998194, 0, 0.2431373, 1, 1,
0.4170792, -1.590642, 3.003305, 0, 0.2392157, 1, 1,
0.4214698, -0.579398, 0.5479146, 0, 0.2313726, 1, 1,
0.4221894, -0.3905019, 0.8777975, 0, 0.227451, 1, 1,
0.4271442, 0.6412, -0.4000445, 0, 0.2196078, 1, 1,
0.427687, 0.7650809, 0.426988, 0, 0.2156863, 1, 1,
0.4297833, -0.6777573, 2.118135, 0, 0.2078431, 1, 1,
0.4297875, -0.9501814, 2.445051, 0, 0.2039216, 1, 1,
0.4345353, -1.875083, 2.619276, 0, 0.1960784, 1, 1,
0.4357062, -0.03679771, 1.826013, 0, 0.1882353, 1, 1,
0.4415072, 0.8948787, -0.6044781, 0, 0.1843137, 1, 1,
0.4419012, -1.285547, 4.010312, 0, 0.1764706, 1, 1,
0.4452013, -1.278077, 3.104224, 0, 0.172549, 1, 1,
0.4473943, -0.3031073, 1.770311, 0, 0.1647059, 1, 1,
0.4481954, -0.1364868, 2.39589, 0, 0.1607843, 1, 1,
0.4521309, 1.077003, 1.074716, 0, 0.1529412, 1, 1,
0.4521807, 0.8089618, 0.01794581, 0, 0.1490196, 1, 1,
0.453961, -0.9201772, 1.781881, 0, 0.1411765, 1, 1,
0.4544298, -0.299323, 2.184581, 0, 0.1372549, 1, 1,
0.4549142, 0.3185258, 0.2890225, 0, 0.1294118, 1, 1,
0.4632457, -0.2654434, 2.376125, 0, 0.1254902, 1, 1,
0.4690337, 0.4777592, 0.3153559, 0, 0.1176471, 1, 1,
0.4723138, -0.1932694, 3.540305, 0, 0.1137255, 1, 1,
0.4726654, 1.729436, 2.268414, 0, 0.1058824, 1, 1,
0.4752188, -0.3626815, 2.574002, 0, 0.09803922, 1, 1,
0.4769553, 1.003218, 0.3073624, 0, 0.09411765, 1, 1,
0.4771501, -1.699656, 2.686185, 0, 0.08627451, 1, 1,
0.4778117, 0.9409866, -1.332929, 0, 0.08235294, 1, 1,
0.481124, 2.507307, 0.3819725, 0, 0.07450981, 1, 1,
0.4813874, 0.8898057, 0.9261584, 0, 0.07058824, 1, 1,
0.4813943, -1.950583, 2.38278, 0, 0.0627451, 1, 1,
0.4831831, -1.32832, 3.879773, 0, 0.05882353, 1, 1,
0.4832221, 0.6892841, 0.5316574, 0, 0.05098039, 1, 1,
0.4867186, -1.061907, 3.11725, 0, 0.04705882, 1, 1,
0.4876092, -1.183761, 4.294683, 0, 0.03921569, 1, 1,
0.4907146, 0.279974, 2.489973, 0, 0.03529412, 1, 1,
0.491241, -0.3744636, 1.865458, 0, 0.02745098, 1, 1,
0.4925137, 1.149583, -0.9904489, 0, 0.02352941, 1, 1,
0.4944186, -1.167699, 2.057465, 0, 0.01568628, 1, 1,
0.497221, -0.4746013, 1.295408, 0, 0.01176471, 1, 1,
0.5004014, 0.4787192, 2.831499, 0, 0.003921569, 1, 1,
0.5026233, 2.202798, 1.080178, 0.003921569, 0, 1, 1,
0.5187631, -2.418836, 4.085244, 0.007843138, 0, 1, 1,
0.5212438, 1.380414, -0.9263347, 0.01568628, 0, 1, 1,
0.5287258, 0.708236, 1.51509, 0.01960784, 0, 1, 1,
0.5293244, 0.2000789, 1.13964, 0.02745098, 0, 1, 1,
0.5334129, 1.018694, -0.1887278, 0.03137255, 0, 1, 1,
0.5364119, -0.4927211, 2.666563, 0.03921569, 0, 1, 1,
0.5373922, 0.24465, 0.3848617, 0.04313726, 0, 1, 1,
0.5479638, 0.3626, -3.115188, 0.05098039, 0, 1, 1,
0.547999, -0.4520888, 2.670662, 0.05490196, 0, 1, 1,
0.5480547, -0.1377073, 2.568046, 0.0627451, 0, 1, 1,
0.5487167, 1.443439, 0.7384616, 0.06666667, 0, 1, 1,
0.5508177, 1.761538, 0.5714726, 0.07450981, 0, 1, 1,
0.5535278, -0.2476164, 2.415136, 0.07843138, 0, 1, 1,
0.5565378, -0.1136686, 2.89789, 0.08627451, 0, 1, 1,
0.5578571, -0.2865241, 1.535768, 0.09019608, 0, 1, 1,
0.5639696, 1.248753, 1.998008, 0.09803922, 0, 1, 1,
0.565177, -0.6475033, 3.147056, 0.1058824, 0, 1, 1,
0.567452, -1.750036, 3.463154, 0.1098039, 0, 1, 1,
0.5717713, -0.02493553, 1.549443, 0.1176471, 0, 1, 1,
0.5737642, -0.1333693, 0.8287085, 0.1215686, 0, 1, 1,
0.5805031, -0.1700012, 3.108953, 0.1294118, 0, 1, 1,
0.5819733, 1.242887, 0.6859616, 0.1333333, 0, 1, 1,
0.5825273, 0.9207398, 1.87112, 0.1411765, 0, 1, 1,
0.5890206, 0.2542279, 1.99606, 0.145098, 0, 1, 1,
0.5891746, -2.230845, 1.541597, 0.1529412, 0, 1, 1,
0.5905702, -0.6520859, 3.540205, 0.1568628, 0, 1, 1,
0.592842, 0.9336787, 0.705276, 0.1647059, 0, 1, 1,
0.6051392, 1.491984, 1.3774, 0.1686275, 0, 1, 1,
0.6080024, 0.5013863, 2.747131, 0.1764706, 0, 1, 1,
0.6158201, -0.7896248, 2.13068, 0.1803922, 0, 1, 1,
0.618578, -1.169016, 1.009028, 0.1882353, 0, 1, 1,
0.6187391, 0.9015255, -0.4314373, 0.1921569, 0, 1, 1,
0.6193305, -1.507619, 3.826679, 0.2, 0, 1, 1,
0.6212148, -1.34647, 3.114245, 0.2078431, 0, 1, 1,
0.6229121, 0.3867944, 1.655926, 0.2117647, 0, 1, 1,
0.6240487, -0.4644566, 1.26503, 0.2196078, 0, 1, 1,
0.6293285, 0.2227137, 0.8498775, 0.2235294, 0, 1, 1,
0.6321599, -0.2783941, 2.521457, 0.2313726, 0, 1, 1,
0.6333667, -0.4576804, 3.111268, 0.2352941, 0, 1, 1,
0.6334365, 0.7019499, -0.7839683, 0.2431373, 0, 1, 1,
0.639098, 1.108674, 1.286219, 0.2470588, 0, 1, 1,
0.6391351, -0.3551943, 2.634087, 0.254902, 0, 1, 1,
0.6408506, -0.9816694, 2.452469, 0.2588235, 0, 1, 1,
0.6413739, -1.122844, 2.871146, 0.2666667, 0, 1, 1,
0.64302, -0.4090512, 1.98812, 0.2705882, 0, 1, 1,
0.6468229, 0.4294577, 0.2716877, 0.2784314, 0, 1, 1,
0.6543933, -1.516494, 2.508308, 0.282353, 0, 1, 1,
0.6577874, -1.424798, 4.291928, 0.2901961, 0, 1, 1,
0.6602532, -1.263995, 3.283089, 0.2941177, 0, 1, 1,
0.6637952, -1.31679, 1.864798, 0.3019608, 0, 1, 1,
0.6639655, 0.9311682, -0.4791897, 0.3098039, 0, 1, 1,
0.670653, 1.602485, 0.9165474, 0.3137255, 0, 1, 1,
0.6707609, 0.3001592, 1.25277, 0.3215686, 0, 1, 1,
0.6723998, 0.8926841, 1.338851, 0.3254902, 0, 1, 1,
0.6748939, -0.2916051, 3.318699, 0.3333333, 0, 1, 1,
0.6770204, -0.4365069, 2.532719, 0.3372549, 0, 1, 1,
0.6777822, 0.8502561, 0.8316297, 0.345098, 0, 1, 1,
0.6784375, -0.7648567, 3.76913, 0.3490196, 0, 1, 1,
0.6805556, -0.881223, 2.77432, 0.3568628, 0, 1, 1,
0.6858654, -0.1141932, 1.656718, 0.3607843, 0, 1, 1,
0.6889398, 0.7343327, 1.377744, 0.3686275, 0, 1, 1,
0.693758, 0.5049253, 1.363919, 0.372549, 0, 1, 1,
0.6941468, -0.3461711, 1.761482, 0.3803922, 0, 1, 1,
0.6953911, -0.5310665, 0.4153852, 0.3843137, 0, 1, 1,
0.6961541, 0.1302672, -0.393966, 0.3921569, 0, 1, 1,
0.7014239, 0.3638083, 2.588448, 0.3960784, 0, 1, 1,
0.7072667, -1.460741, 1.487156, 0.4039216, 0, 1, 1,
0.7100966, -1.218612, 1.496883, 0.4117647, 0, 1, 1,
0.7125307, 2.377834, -1.28144, 0.4156863, 0, 1, 1,
0.7184291, -0.934765, 2.314198, 0.4235294, 0, 1, 1,
0.7244108, -1.237969, 3.573215, 0.427451, 0, 1, 1,
0.7300162, 0.9148007, 1.197157, 0.4352941, 0, 1, 1,
0.7319752, -0.4426877, 2.580947, 0.4392157, 0, 1, 1,
0.7361293, 0.6732463, 0.1404912, 0.4470588, 0, 1, 1,
0.7372092, -1.069694, 2.508707, 0.4509804, 0, 1, 1,
0.7407978, 1.677725, 0.8085035, 0.4588235, 0, 1, 1,
0.7455814, 1.433909, 0.458201, 0.4627451, 0, 1, 1,
0.7463902, 0.6671475, 1.071411, 0.4705882, 0, 1, 1,
0.7578316, -0.8529249, 1.782894, 0.4745098, 0, 1, 1,
0.7632868, -0.9551429, 2.82146, 0.4823529, 0, 1, 1,
0.7634265, -0.284724, -0.2063001, 0.4862745, 0, 1, 1,
0.7658889, -0.2521096, 2.135722, 0.4941176, 0, 1, 1,
0.7671841, -0.9206626, 1.666532, 0.5019608, 0, 1, 1,
0.7744464, 0.2794027, 2.06099, 0.5058824, 0, 1, 1,
0.7786298, 1.281595, 0.5200344, 0.5137255, 0, 1, 1,
0.7787008, 1.41983, -0.5380344, 0.5176471, 0, 1, 1,
0.7806087, 0.615014, 3.624204, 0.5254902, 0, 1, 1,
0.7835829, 0.4217351, 0.3299942, 0.5294118, 0, 1, 1,
0.7843924, 0.7569575, 1.314506, 0.5372549, 0, 1, 1,
0.7905143, -0.4091799, 1.327033, 0.5411765, 0, 1, 1,
0.7923374, -0.3535748, 3.709929, 0.5490196, 0, 1, 1,
0.7936552, -0.0009072497, 1.353419, 0.5529412, 0, 1, 1,
0.7967718, -0.1600301, 2.849205, 0.5607843, 0, 1, 1,
0.8001146, -2.577672, 4.197076, 0.5647059, 0, 1, 1,
0.8084671, 0.4072558, 2.859979, 0.572549, 0, 1, 1,
0.80918, -0.8789915, 5.322516, 0.5764706, 0, 1, 1,
0.8122398, 0.5122522, 0.1541823, 0.5843138, 0, 1, 1,
0.8179487, 1.011836, -0.2193888, 0.5882353, 0, 1, 1,
0.8203474, -1.263536, 2.870936, 0.5960785, 0, 1, 1,
0.8263647, -0.09051639, 1.11033, 0.6039216, 0, 1, 1,
0.8265072, 1.619467, 1.334053, 0.6078432, 0, 1, 1,
0.8319312, -0.0527518, 0.5030501, 0.6156863, 0, 1, 1,
0.8341268, 0.4317195, 1.782791, 0.6196079, 0, 1, 1,
0.8355711, -0.0007592933, 1.68954, 0.627451, 0, 1, 1,
0.8396129, -0.2257884, 1.76148, 0.6313726, 0, 1, 1,
0.8422795, -1.684229, 3.955272, 0.6392157, 0, 1, 1,
0.8438203, -0.0767992, 1.43771, 0.6431373, 0, 1, 1,
0.8440079, -0.9122431, 2.197953, 0.6509804, 0, 1, 1,
0.8457407, -0.9146552, 3.454696, 0.654902, 0, 1, 1,
0.8474594, -3.177761, 2.699186, 0.6627451, 0, 1, 1,
0.8499371, 0.08737556, 2.421642, 0.6666667, 0, 1, 1,
0.8575737, -0.3718725, 2.224087, 0.6745098, 0, 1, 1,
0.8633817, 0.2301894, 3.181185, 0.6784314, 0, 1, 1,
0.8636535, -0.1017279, 2.186265, 0.6862745, 0, 1, 1,
0.8649912, -0.0003422066, 2.345561, 0.6901961, 0, 1, 1,
0.8655171, 0.4498357, 1.268844, 0.6980392, 0, 1, 1,
0.8660254, -0.0154891, 0.9495823, 0.7058824, 0, 1, 1,
0.8696478, -0.3076991, 0.4148552, 0.7098039, 0, 1, 1,
0.8696806, -0.8010083, 1.816256, 0.7176471, 0, 1, 1,
0.8706356, 0.1302756, 1.066782, 0.7215686, 0, 1, 1,
0.8726016, -0.3995355, 1.849992, 0.7294118, 0, 1, 1,
0.8735057, -0.8660154, 3.361918, 0.7333333, 0, 1, 1,
0.8747957, -1.14281, 1.971729, 0.7411765, 0, 1, 1,
0.8819878, 1.260638, 1.402309, 0.7450981, 0, 1, 1,
0.8827592, -0.1206336, 2.504957, 0.7529412, 0, 1, 1,
0.892401, -0.3525566, 0.8403862, 0.7568628, 0, 1, 1,
0.8939108, 0.02535847, 3.809675, 0.7647059, 0, 1, 1,
0.8968883, -0.2768725, 2.84998, 0.7686275, 0, 1, 1,
0.897465, -0.08003236, 1.512054, 0.7764706, 0, 1, 1,
0.8984265, 0.4748787, 1.655037, 0.7803922, 0, 1, 1,
0.900989, -0.8745658, 1.572378, 0.7882353, 0, 1, 1,
0.9012605, -0.07488421, 0.6366863, 0.7921569, 0, 1, 1,
0.9017076, -0.4439529, 1.439241, 0.8, 0, 1, 1,
0.9024883, -0.2846437, 3.447561, 0.8078431, 0, 1, 1,
0.9045106, 0.3308089, 0.5078269, 0.8117647, 0, 1, 1,
0.9062251, 0.9331712, 2.067605, 0.8196079, 0, 1, 1,
0.9134834, 1.48797, -0.6309488, 0.8235294, 0, 1, 1,
0.914274, -0.09268716, 1.960923, 0.8313726, 0, 1, 1,
0.9174048, 1.105616, 1.723623, 0.8352941, 0, 1, 1,
0.9240837, -0.3480296, 2.30452, 0.8431373, 0, 1, 1,
0.9293744, 1.24428, 2.006978, 0.8470588, 0, 1, 1,
0.9294507, 0.6899567, 1.661457, 0.854902, 0, 1, 1,
0.9316698, 0.6848292, 0.9387279, 0.8588235, 0, 1, 1,
0.9349852, 0.2946106, 1.777484, 0.8666667, 0, 1, 1,
0.9367629, 0.4806584, 2.31403, 0.8705882, 0, 1, 1,
0.9542657, 1.119375, 1.541673, 0.8784314, 0, 1, 1,
0.9554923, 0.05620293, 2.519032, 0.8823529, 0, 1, 1,
0.9588398, -0.9479858, 1.180133, 0.8901961, 0, 1, 1,
0.9589903, 2.227668, 0.4316126, 0.8941177, 0, 1, 1,
0.9728776, -0.2425626, 0.7489094, 0.9019608, 0, 1, 1,
0.9775164, -0.06026216, 0.5316201, 0.9098039, 0, 1, 1,
0.9799449, 0.04833268, 1.329088, 0.9137255, 0, 1, 1,
0.9802126, 0.6524666, 1.337421, 0.9215686, 0, 1, 1,
0.9907508, 1.846318, 2.338861, 0.9254902, 0, 1, 1,
0.9921423, 0.5403057, 1.808104, 0.9333333, 0, 1, 1,
0.9924065, -0.8380508, 1.864575, 0.9372549, 0, 1, 1,
0.9976327, 0.1041242, 1.039817, 0.945098, 0, 1, 1,
1.001999, -0.3973692, 2.376634, 0.9490196, 0, 1, 1,
1.006495, -0.7233388, 1.310999, 0.9568627, 0, 1, 1,
1.007207, 0.1910193, -0.2328564, 0.9607843, 0, 1, 1,
1.01077, 1.256786, 0.9688758, 0.9686275, 0, 1, 1,
1.011583, -2.494939, 2.840871, 0.972549, 0, 1, 1,
1.015992, 0.4746422, 0.5938276, 0.9803922, 0, 1, 1,
1.017892, 0.8010145, 2.120377, 0.9843137, 0, 1, 1,
1.019044, 1.159206, 1.973782, 0.9921569, 0, 1, 1,
1.019764, 0.3839721, 3.657886, 0.9960784, 0, 1, 1,
1.020063, 0.5674464, 0.9848638, 1, 0, 0.9960784, 1,
1.023336, -1.306731, 2.316389, 1, 0, 0.9882353, 1,
1.023475, 1.226933, -0.1439302, 1, 0, 0.9843137, 1,
1.024242, 0.9947307, 0.4304233, 1, 0, 0.9764706, 1,
1.025052, -0.4752333, 1.411215, 1, 0, 0.972549, 1,
1.026229, -0.2351174, 2.804079, 1, 0, 0.9647059, 1,
1.029234, -0.2266185, 3.335065, 1, 0, 0.9607843, 1,
1.029913, -1.010787, 3.426392, 1, 0, 0.9529412, 1,
1.030046, 0.9344327, -0.2690117, 1, 0, 0.9490196, 1,
1.034304, -1.523382, 4.609861, 1, 0, 0.9411765, 1,
1.036519, 1.461446, 1.306891, 1, 0, 0.9372549, 1,
1.041954, -3.331325, 3.911377, 1, 0, 0.9294118, 1,
1.043258, 1.902054, 0.1094151, 1, 0, 0.9254902, 1,
1.044562, -0.1055468, 1.983469, 1, 0, 0.9176471, 1,
1.045459, -1.422554, 0.5949301, 1, 0, 0.9137255, 1,
1.048293, -0.4035735, 0.9116119, 1, 0, 0.9058824, 1,
1.052731, -0.403524, 0.1343002, 1, 0, 0.9019608, 1,
1.053025, 0.763405, 0.9841244, 1, 0, 0.8941177, 1,
1.057734, 2.361192, -0.7659283, 1, 0, 0.8862745, 1,
1.058636, 0.4404459, -0.2021317, 1, 0, 0.8823529, 1,
1.058972, 0.5036248, 0.06369341, 1, 0, 0.8745098, 1,
1.059356, 0.7514974, -0.1692322, 1, 0, 0.8705882, 1,
1.062565, 0.8051575, 1.19209, 1, 0, 0.8627451, 1,
1.070812, -1.033248, 1.869041, 1, 0, 0.8588235, 1,
1.074877, -1.128338, 2.250331, 1, 0, 0.8509804, 1,
1.075247, 0.7046952, 0.860081, 1, 0, 0.8470588, 1,
1.079781, 0.2395919, 0.3678722, 1, 0, 0.8392157, 1,
1.081501, -0.3317669, -0.2451733, 1, 0, 0.8352941, 1,
1.090251, -0.04693317, 1.960798, 1, 0, 0.827451, 1,
1.090388, -0.1895019, 1.650949, 1, 0, 0.8235294, 1,
1.095426, 2.112881, 1.0909, 1, 0, 0.8156863, 1,
1.099789, -0.2568302, 2.685547, 1, 0, 0.8117647, 1,
1.10089, 1.201732, 2.189553, 1, 0, 0.8039216, 1,
1.112003, 2.012737, 0.1935997, 1, 0, 0.7960784, 1,
1.117284, -1.150026, 3.028624, 1, 0, 0.7921569, 1,
1.117852, -0.2330503, 2.905652, 1, 0, 0.7843137, 1,
1.117855, 0.3042399, 1.360443, 1, 0, 0.7803922, 1,
1.127913, -0.6307334, 2.242686, 1, 0, 0.772549, 1,
1.128021, 0.5064941, 1.571223, 1, 0, 0.7686275, 1,
1.131742, -0.3067307, 2.828727, 1, 0, 0.7607843, 1,
1.142796, 0.1830208, 0.3604884, 1, 0, 0.7568628, 1,
1.147345, -0.7675771, 3.397376, 1, 0, 0.7490196, 1,
1.147746, -0.2354904, 2.267739, 1, 0, 0.7450981, 1,
1.164392, -1.38394, 2.358167, 1, 0, 0.7372549, 1,
1.17469, -0.8418742, 1.475835, 1, 0, 0.7333333, 1,
1.178269, -0.5294045, -0.3295832, 1, 0, 0.7254902, 1,
1.178516, -1.083356, 2.644089, 1, 0, 0.7215686, 1,
1.182229, -1.628847, 2.480808, 1, 0, 0.7137255, 1,
1.182471, 1.766764, 0.3819053, 1, 0, 0.7098039, 1,
1.191029, -0.2225497, 2.860091, 1, 0, 0.7019608, 1,
1.199163, -1.177416, 2.87025, 1, 0, 0.6941177, 1,
1.203445, -1.690309, 1.756743, 1, 0, 0.6901961, 1,
1.205483, 0.858323, 3.783247, 1, 0, 0.682353, 1,
1.214069, -0.1640663, 0.9547429, 1, 0, 0.6784314, 1,
1.214146, -1.544909, 2.646709, 1, 0, 0.6705883, 1,
1.218688, -0.8136993, 1.736435, 1, 0, 0.6666667, 1,
1.219473, 0.05137157, -0.3463881, 1, 0, 0.6588235, 1,
1.225777, -0.8704045, 2.471557, 1, 0, 0.654902, 1,
1.227007, 0.612619, 1.111874, 1, 0, 0.6470588, 1,
1.232718, 0.7074848, 0.07745846, 1, 0, 0.6431373, 1,
1.241272, 1.157162, 0.8335722, 1, 0, 0.6352941, 1,
1.246854, -0.8874354, 0.5112124, 1, 0, 0.6313726, 1,
1.249723, 0.4033302, 0.88547, 1, 0, 0.6235294, 1,
1.259294, -0.5008897, 2.033714, 1, 0, 0.6196079, 1,
1.266115, -0.6568267, 1.370842, 1, 0, 0.6117647, 1,
1.26974, -0.8352314, 3.271644, 1, 0, 0.6078432, 1,
1.269748, -0.454644, 1.202508, 1, 0, 0.6, 1,
1.279109, 0.2127934, 0.9761322, 1, 0, 0.5921569, 1,
1.30121, 0.8356272, 2.480328, 1, 0, 0.5882353, 1,
1.303571, 0.6617044, 1.232113, 1, 0, 0.5803922, 1,
1.304273, -0.7920822, 2.566717, 1, 0, 0.5764706, 1,
1.320559, -1.468497, 2.685308, 1, 0, 0.5686275, 1,
1.321148, 1.444961, 0.2254501, 1, 0, 0.5647059, 1,
1.341587, -2.353935, 3.561531, 1, 0, 0.5568628, 1,
1.342904, -0.6226538, 1.508528, 1, 0, 0.5529412, 1,
1.347293, -0.6344708, 1.275165, 1, 0, 0.5450981, 1,
1.350184, 1.090345, 0.9963183, 1, 0, 0.5411765, 1,
1.35132, 1.159313, 0.4296682, 1, 0, 0.5333334, 1,
1.361445, 1.249171, 0.8136632, 1, 0, 0.5294118, 1,
1.3668, -1.776652, 2.440985, 1, 0, 0.5215687, 1,
1.368094, -0.195971, 1.840509, 1, 0, 0.5176471, 1,
1.368118, -0.2542002, 0.5210398, 1, 0, 0.509804, 1,
1.373294, 1.84165, 1.304433, 1, 0, 0.5058824, 1,
1.373526, 0.08976244, 3.30289, 1, 0, 0.4980392, 1,
1.374741, 0.9064563, 3.021962, 1, 0, 0.4901961, 1,
1.381763, -0.2287248, 0.5029176, 1, 0, 0.4862745, 1,
1.386367, 0.1341676, 2.731426, 1, 0, 0.4784314, 1,
1.394722, -1.889114, 2.999689, 1, 0, 0.4745098, 1,
1.403485, -0.9868105, 1.403841, 1, 0, 0.4666667, 1,
1.404536, -0.1844199, 1.927114, 1, 0, 0.4627451, 1,
1.415288, 0.4562326, 1.436473, 1, 0, 0.454902, 1,
1.416717, 0.8759147, 2.163333, 1, 0, 0.4509804, 1,
1.445907, -0.3000183, 1.877321, 1, 0, 0.4431373, 1,
1.44834, -0.4711815, 1.805456, 1, 0, 0.4392157, 1,
1.449616, 0.8019866, 2.367841, 1, 0, 0.4313726, 1,
1.468904, 1.166851, 3.365581, 1, 0, 0.427451, 1,
1.473887, -1.749772, 2.689551, 1, 0, 0.4196078, 1,
1.479124, 0.1771462, 1.396483, 1, 0, 0.4156863, 1,
1.480035, 1.548671, -1.250303, 1, 0, 0.4078431, 1,
1.491251, 1.152143, 0.3221575, 1, 0, 0.4039216, 1,
1.493319, -0.7584878, 2.766475, 1, 0, 0.3960784, 1,
1.506878, 0.4299176, 2.89109, 1, 0, 0.3882353, 1,
1.508483, 0.3515403, 1.333956, 1, 0, 0.3843137, 1,
1.515073, 0.9570755, 1.225649, 1, 0, 0.3764706, 1,
1.521502, 0.5833191, 0.4545472, 1, 0, 0.372549, 1,
1.530961, -0.7053022, 3.519912, 1, 0, 0.3647059, 1,
1.536839, 1.357524, 1.697713, 1, 0, 0.3607843, 1,
1.55145, 0.008892676, 2.790313, 1, 0, 0.3529412, 1,
1.553829, 1.19262, 1.25094, 1, 0, 0.3490196, 1,
1.55854, -0.812483, 1.693051, 1, 0, 0.3411765, 1,
1.558549, -0.1903515, 1.305741, 1, 0, 0.3372549, 1,
1.566547, 0.5593283, 0.8782322, 1, 0, 0.3294118, 1,
1.569792, 0.7645079, 0.173691, 1, 0, 0.3254902, 1,
1.583222, -0.3045765, 0.8943182, 1, 0, 0.3176471, 1,
1.584043, -0.001371559, 1.870041, 1, 0, 0.3137255, 1,
1.595477, -0.5140135, 2.345757, 1, 0, 0.3058824, 1,
1.638334, -0.1214025, 0.01799918, 1, 0, 0.2980392, 1,
1.657928, 0.9558511, 0.1176372, 1, 0, 0.2941177, 1,
1.669104, -1.243838, 0.6252018, 1, 0, 0.2862745, 1,
1.67181, -1.252118, 3.381594, 1, 0, 0.282353, 1,
1.68791, 0.7876633, 0.8697248, 1, 0, 0.2745098, 1,
1.698801, -1.334999, 1.377126, 1, 0, 0.2705882, 1,
1.702509, -0.01643993, 2.53373, 1, 0, 0.2627451, 1,
1.705763, -0.3928225, 1.074482, 1, 0, 0.2588235, 1,
1.711434, -0.5630695, 2.676436, 1, 0, 0.2509804, 1,
1.743069, -0.4097985, 3.485759, 1, 0, 0.2470588, 1,
1.744511, 0.5455971, -0.4693804, 1, 0, 0.2392157, 1,
1.784613, 0.3932414, 1.196362, 1, 0, 0.2352941, 1,
1.796326, 0.09194592, -0.3274572, 1, 0, 0.227451, 1,
1.807733, -0.254111, 2.100322, 1, 0, 0.2235294, 1,
1.810283, -2.885998, 2.436316, 1, 0, 0.2156863, 1,
1.82513, 0.4547592, 0.5633005, 1, 0, 0.2117647, 1,
1.83009, -0.3865611, 2.948046, 1, 0, 0.2039216, 1,
1.83055, -0.4864709, 1.850423, 1, 0, 0.1960784, 1,
1.847259, 0.6124573, 0.6197146, 1, 0, 0.1921569, 1,
1.847847, 0.1444841, 3.331635, 1, 0, 0.1843137, 1,
1.874788, 1.589633, 1.288917, 1, 0, 0.1803922, 1,
1.877435, 0.9823046, 0.5207266, 1, 0, 0.172549, 1,
1.888232, 0.3508391, 1.021835, 1, 0, 0.1686275, 1,
1.906782, -0.8822046, 2.886684, 1, 0, 0.1607843, 1,
1.906943, 0.9398704, 0.4756507, 1, 0, 0.1568628, 1,
1.920345, -0.5846707, 3.362476, 1, 0, 0.1490196, 1,
1.953995, 0.2799892, 1.272095, 1, 0, 0.145098, 1,
1.964302, 0.08011717, 2.996205, 1, 0, 0.1372549, 1,
1.976407, 0.5531639, 1.980361, 1, 0, 0.1333333, 1,
1.982734, 0.1501323, 1.637801, 1, 0, 0.1254902, 1,
2.008119, 0.4574039, 2.569337, 1, 0, 0.1215686, 1,
2.054277, 0.3283529, -0.4709613, 1, 0, 0.1137255, 1,
2.063454, -1.526315, 1.092653, 1, 0, 0.1098039, 1,
2.064858, 0.9487334, 1.436607, 1, 0, 0.1019608, 1,
2.159703, 0.233659, 2.074127, 1, 0, 0.09411765, 1,
2.169451, -0.4573576, 1.066008, 1, 0, 0.09019608, 1,
2.170205, -0.3348054, 0.8558042, 1, 0, 0.08235294, 1,
2.177155, -0.3573385, 1.70946, 1, 0, 0.07843138, 1,
2.230023, -0.18465, 1.567486, 1, 0, 0.07058824, 1,
2.237264, -0.839196, 4.034137, 1, 0, 0.06666667, 1,
2.244403, -0.1227151, 0.7188734, 1, 0, 0.05882353, 1,
2.269534, 0.02906571, 0.7984663, 1, 0, 0.05490196, 1,
2.298815, -0.8782561, 2.9411, 1, 0, 0.04705882, 1,
2.32225, 0.9259129, -0.05604322, 1, 0, 0.04313726, 1,
2.384116, 0.9639235, 2.426487, 1, 0, 0.03529412, 1,
2.475006, -1.94115, 1.642466, 1, 0, 0.03137255, 1,
2.630847, 0.888429, -0.7183076, 1, 0, 0.02352941, 1,
2.677803, -0.6386694, 0.884919, 1, 0, 0.01960784, 1,
2.727701, 1.739578, 1.61102, 1, 0, 0.01176471, 1,
3.385517, 0.8856286, 1.361964, 1, 0, 0.007843138, 1
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
0.1364315, -4.392831, -7.521758, 0, -0.5, 0.5, 0.5,
0.1364315, -4.392831, -7.521758, 1, -0.5, 0.5, 0.5,
0.1364315, -4.392831, -7.521758, 1, 1.5, 0.5, 0.5,
0.1364315, -4.392831, -7.521758, 0, 1.5, 0.5, 0.5
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
-4.214094, -0.2000375, -7.521758, 0, -0.5, 0.5, 0.5,
-4.214094, -0.2000375, -7.521758, 1, -0.5, 0.5, 0.5,
-4.214094, -0.2000375, -7.521758, 1, 1.5, 0.5, 0.5,
-4.214094, -0.2000375, -7.521758, 0, 1.5, 0.5, 0.5
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
-4.214094, -4.392831, 0.1454711, 0, -0.5, 0.5, 0.5,
-4.214094, -4.392831, 0.1454711, 1, -0.5, 0.5, 0.5,
-4.214094, -4.392831, 0.1454711, 1, 1.5, 0.5, 0.5,
-4.214094, -4.392831, 0.1454711, 0, 1.5, 0.5, 0.5
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
-3, -3.425264, -5.752397,
3, -3.425264, -5.752397,
-3, -3.425264, -5.752397,
-3, -3.586525, -6.04729,
-2, -3.425264, -5.752397,
-2, -3.586525, -6.04729,
-1, -3.425264, -5.752397,
-1, -3.586525, -6.04729,
0, -3.425264, -5.752397,
0, -3.586525, -6.04729,
1, -3.425264, -5.752397,
1, -3.586525, -6.04729,
2, -3.425264, -5.752397,
2, -3.586525, -6.04729,
3, -3.425264, -5.752397,
3, -3.586525, -6.04729
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
-3, -3.909048, -6.637077, 0, -0.5, 0.5, 0.5,
-3, -3.909048, -6.637077, 1, -0.5, 0.5, 0.5,
-3, -3.909048, -6.637077, 1, 1.5, 0.5, 0.5,
-3, -3.909048, -6.637077, 0, 1.5, 0.5, 0.5,
-2, -3.909048, -6.637077, 0, -0.5, 0.5, 0.5,
-2, -3.909048, -6.637077, 1, -0.5, 0.5, 0.5,
-2, -3.909048, -6.637077, 1, 1.5, 0.5, 0.5,
-2, -3.909048, -6.637077, 0, 1.5, 0.5, 0.5,
-1, -3.909048, -6.637077, 0, -0.5, 0.5, 0.5,
-1, -3.909048, -6.637077, 1, -0.5, 0.5, 0.5,
-1, -3.909048, -6.637077, 1, 1.5, 0.5, 0.5,
-1, -3.909048, -6.637077, 0, 1.5, 0.5, 0.5,
0, -3.909048, -6.637077, 0, -0.5, 0.5, 0.5,
0, -3.909048, -6.637077, 1, -0.5, 0.5, 0.5,
0, -3.909048, -6.637077, 1, 1.5, 0.5, 0.5,
0, -3.909048, -6.637077, 0, 1.5, 0.5, 0.5,
1, -3.909048, -6.637077, 0, -0.5, 0.5, 0.5,
1, -3.909048, -6.637077, 1, -0.5, 0.5, 0.5,
1, -3.909048, -6.637077, 1, 1.5, 0.5, 0.5,
1, -3.909048, -6.637077, 0, 1.5, 0.5, 0.5,
2, -3.909048, -6.637077, 0, -0.5, 0.5, 0.5,
2, -3.909048, -6.637077, 1, -0.5, 0.5, 0.5,
2, -3.909048, -6.637077, 1, 1.5, 0.5, 0.5,
2, -3.909048, -6.637077, 0, 1.5, 0.5, 0.5,
3, -3.909048, -6.637077, 0, -0.5, 0.5, 0.5,
3, -3.909048, -6.637077, 1, -0.5, 0.5, 0.5,
3, -3.909048, -6.637077, 1, 1.5, 0.5, 0.5,
3, -3.909048, -6.637077, 0, 1.5, 0.5, 0.5
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
-3.210127, -3, -5.752397,
-3.210127, 2, -5.752397,
-3.210127, -3, -5.752397,
-3.377455, -3, -6.04729,
-3.210127, -2, -5.752397,
-3.377455, -2, -6.04729,
-3.210127, -1, -5.752397,
-3.377455, -1, -6.04729,
-3.210127, 0, -5.752397,
-3.377455, 0, -6.04729,
-3.210127, 1, -5.752397,
-3.377455, 1, -6.04729,
-3.210127, 2, -5.752397,
-3.377455, 2, -6.04729
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
-3.71211, -3, -6.637077, 0, -0.5, 0.5, 0.5,
-3.71211, -3, -6.637077, 1, -0.5, 0.5, 0.5,
-3.71211, -3, -6.637077, 1, 1.5, 0.5, 0.5,
-3.71211, -3, -6.637077, 0, 1.5, 0.5, 0.5,
-3.71211, -2, -6.637077, 0, -0.5, 0.5, 0.5,
-3.71211, -2, -6.637077, 1, -0.5, 0.5, 0.5,
-3.71211, -2, -6.637077, 1, 1.5, 0.5, 0.5,
-3.71211, -2, -6.637077, 0, 1.5, 0.5, 0.5,
-3.71211, -1, -6.637077, 0, -0.5, 0.5, 0.5,
-3.71211, -1, -6.637077, 1, -0.5, 0.5, 0.5,
-3.71211, -1, -6.637077, 1, 1.5, 0.5, 0.5,
-3.71211, -1, -6.637077, 0, 1.5, 0.5, 0.5,
-3.71211, 0, -6.637077, 0, -0.5, 0.5, 0.5,
-3.71211, 0, -6.637077, 1, -0.5, 0.5, 0.5,
-3.71211, 0, -6.637077, 1, 1.5, 0.5, 0.5,
-3.71211, 0, -6.637077, 0, 1.5, 0.5, 0.5,
-3.71211, 1, -6.637077, 0, -0.5, 0.5, 0.5,
-3.71211, 1, -6.637077, 1, -0.5, 0.5, 0.5,
-3.71211, 1, -6.637077, 1, 1.5, 0.5, 0.5,
-3.71211, 1, -6.637077, 0, 1.5, 0.5, 0.5,
-3.71211, 2, -6.637077, 0, -0.5, 0.5, 0.5,
-3.71211, 2, -6.637077, 1, -0.5, 0.5, 0.5,
-3.71211, 2, -6.637077, 1, 1.5, 0.5, 0.5,
-3.71211, 2, -6.637077, 0, 1.5, 0.5, 0.5
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
-3.210127, -3.425264, -4,
-3.210127, -3.425264, 4,
-3.210127, -3.425264, -4,
-3.377455, -3.586525, -4,
-3.210127, -3.425264, -2,
-3.377455, -3.586525, -2,
-3.210127, -3.425264, 0,
-3.377455, -3.586525, 0,
-3.210127, -3.425264, 2,
-3.377455, -3.586525, 2,
-3.210127, -3.425264, 4,
-3.377455, -3.586525, 4
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
-3.71211, -3.909048, -4, 0, -0.5, 0.5, 0.5,
-3.71211, -3.909048, -4, 1, -0.5, 0.5, 0.5,
-3.71211, -3.909048, -4, 1, 1.5, 0.5, 0.5,
-3.71211, -3.909048, -4, 0, 1.5, 0.5, 0.5,
-3.71211, -3.909048, -2, 0, -0.5, 0.5, 0.5,
-3.71211, -3.909048, -2, 1, -0.5, 0.5, 0.5,
-3.71211, -3.909048, -2, 1, 1.5, 0.5, 0.5,
-3.71211, -3.909048, -2, 0, 1.5, 0.5, 0.5,
-3.71211, -3.909048, 0, 0, -0.5, 0.5, 0.5,
-3.71211, -3.909048, 0, 1, -0.5, 0.5, 0.5,
-3.71211, -3.909048, 0, 1, 1.5, 0.5, 0.5,
-3.71211, -3.909048, 0, 0, 1.5, 0.5, 0.5,
-3.71211, -3.909048, 2, 0, -0.5, 0.5, 0.5,
-3.71211, -3.909048, 2, 1, -0.5, 0.5, 0.5,
-3.71211, -3.909048, 2, 1, 1.5, 0.5, 0.5,
-3.71211, -3.909048, 2, 0, 1.5, 0.5, 0.5,
-3.71211, -3.909048, 4, 0, -0.5, 0.5, 0.5,
-3.71211, -3.909048, 4, 1, -0.5, 0.5, 0.5,
-3.71211, -3.909048, 4, 1, 1.5, 0.5, 0.5,
-3.71211, -3.909048, 4, 0, 1.5, 0.5, 0.5
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
-3.210127, -3.425264, -5.752397,
-3.210127, 3.025189, -5.752397,
-3.210127, -3.425264, 6.043339,
-3.210127, 3.025189, 6.043339,
-3.210127, -3.425264, -5.752397,
-3.210127, -3.425264, 6.043339,
-3.210127, 3.025189, -5.752397,
-3.210127, 3.025189, 6.043339,
-3.210127, -3.425264, -5.752397,
3.48299, -3.425264, -5.752397,
-3.210127, -3.425264, 6.043339,
3.48299, -3.425264, 6.043339,
-3.210127, 3.025189, -5.752397,
3.48299, 3.025189, -5.752397,
-3.210127, 3.025189, 6.043339,
3.48299, 3.025189, 6.043339,
3.48299, -3.425264, -5.752397,
3.48299, 3.025189, -5.752397,
3.48299, -3.425264, 6.043339,
3.48299, 3.025189, 6.043339,
3.48299, -3.425264, -5.752397,
3.48299, -3.425264, 6.043339,
3.48299, 3.025189, -5.752397,
3.48299, 3.025189, 6.043339
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
var radius = 8.019413;
var distance = 35.67928;
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
mvMatrix.translate( -0.1364315, 0.2000375, -0.1454711 );
mvMatrix.scale( 1.295472, 1.344208, 0.7350746 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.67928);
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
methyl_2-difluoromet<-read.table("methyl_2-difluoromet.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-methyl_2-difluoromet$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyl_2' not found
```

```r
y<-methyl_2-difluoromet$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyl_2' not found
```

```r
z<-methyl_2-difluoromet$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyl_2' not found
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
-3.112654, -0.4717251, -1.906696, 0, 0, 1, 1, 1,
-2.795127, 0.3414378, -1.951099, 1, 0, 0, 1, 1,
-2.57101, 0.1387291, -0.5171612, 1, 0, 0, 1, 1,
-2.5209, -1.282321, -2.618979, 1, 0, 0, 1, 1,
-2.513902, -0.06777385, -1.981817, 1, 0, 0, 1, 1,
-2.297879, 1.686157, -0.1586367, 1, 0, 0, 1, 1,
-2.276574, -0.9767478, -4.239751, 0, 0, 0, 1, 1,
-2.238802, 1.327164, -0.7761818, 0, 0, 0, 1, 1,
-2.227636, -1.036625, -2.798182, 0, 0, 0, 1, 1,
-2.107129, 0.733562, -2.904508, 0, 0, 0, 1, 1,
-2.078303, 1.580293, 0.01332881, 0, 0, 0, 1, 1,
-2.065326, -0.7150024, -0.8713449, 0, 0, 0, 1, 1,
-2.033082, 1.604626, 1.61851, 0, 0, 0, 1, 1,
-2.02531, 0.6785541, -1.921791, 1, 1, 1, 1, 1,
-1.991373, -1.317463, -2.401199, 1, 1, 1, 1, 1,
-1.989926, 1.748101, 0.2646704, 1, 1, 1, 1, 1,
-1.981544, -0.1034891, -3.017199, 1, 1, 1, 1, 1,
-1.962923, -0.9729782, -2.546139, 1, 1, 1, 1, 1,
-1.960807, 0.3397711, -0.7240051, 1, 1, 1, 1, 1,
-1.883486, 0.9588176, -0.05390786, 1, 1, 1, 1, 1,
-1.870432, 0.9762392, -0.9189241, 1, 1, 1, 1, 1,
-1.850001, 0.3990336, -1.845431, 1, 1, 1, 1, 1,
-1.838928, -0.8892339, -2.809092, 1, 1, 1, 1, 1,
-1.799722, 0.5429033, -3.606215, 1, 1, 1, 1, 1,
-1.77221, -0.06744136, -3.421368, 1, 1, 1, 1, 1,
-1.769287, 1.326123, 0.4887042, 1, 1, 1, 1, 1,
-1.748793, 0.9528809, -1.626023, 1, 1, 1, 1, 1,
-1.737235, 1.413159, -1.081103, 1, 1, 1, 1, 1,
-1.736444, -0.1230792, -1.65735, 0, 0, 1, 1, 1,
-1.725157, -0.1081018, -1.909622, 1, 0, 0, 1, 1,
-1.714185, -0.6488687, -1.96744, 1, 0, 0, 1, 1,
-1.699278, 0.9175985, -0.6931763, 1, 0, 0, 1, 1,
-1.694575, -0.04494336, -2.742365, 1, 0, 0, 1, 1,
-1.688346, -0.395588, -1.779036, 1, 0, 0, 1, 1,
-1.675635, 1.162907, -1.920381, 0, 0, 0, 1, 1,
-1.670985, 0.6298901, -1.684309, 0, 0, 0, 1, 1,
-1.625199, -1.452196, -2.209772, 0, 0, 0, 1, 1,
-1.614146, 1.126926, -0.657373, 0, 0, 0, 1, 1,
-1.610719, -0.07423373, -1.532288, 0, 0, 0, 1, 1,
-1.600664, -1.185128, -3.084784, 0, 0, 0, 1, 1,
-1.587492, 1.769944, -1.248558, 0, 0, 0, 1, 1,
-1.549982, -1.658307, -2.571888, 1, 1, 1, 1, 1,
-1.544233, 0.2631204, -2.220205, 1, 1, 1, 1, 1,
-1.541926, 1.22942, -2.333868, 1, 1, 1, 1, 1,
-1.531949, -0.676573, -2.431387, 1, 1, 1, 1, 1,
-1.530596, 1.472161, -0.746693, 1, 1, 1, 1, 1,
-1.511538, -0.1066972, -1.277843, 1, 1, 1, 1, 1,
-1.51045, 0.8688479, -1.706236, 1, 1, 1, 1, 1,
-1.475152, -1.973891, -2.417771, 1, 1, 1, 1, 1,
-1.460413, -1.722833, -2.844499, 1, 1, 1, 1, 1,
-1.455324, 0.665999, -0.03598922, 1, 1, 1, 1, 1,
-1.436653, 1.203159, -0.4112616, 1, 1, 1, 1, 1,
-1.427361, 0.8834419, -2.277065, 1, 1, 1, 1, 1,
-1.421836, 0.9933351, -1.831958, 1, 1, 1, 1, 1,
-1.415725, -1.417198, -2.341583, 1, 1, 1, 1, 1,
-1.414967, -0.269578, -1.770079, 1, 1, 1, 1, 1,
-1.4095, 0.6530494, -1.72728, 0, 0, 1, 1, 1,
-1.397175, -0.3226492, -1.92056, 1, 0, 0, 1, 1,
-1.386858, -1.637663, -2.447794, 1, 0, 0, 1, 1,
-1.376313, -2.759286, -1.015687, 1, 0, 0, 1, 1,
-1.360457, 0.2649136, -0.3021593, 1, 0, 0, 1, 1,
-1.356671, -0.4225586, -3.096751, 1, 0, 0, 1, 1,
-1.353718, 0.4888695, -0.1392945, 0, 0, 0, 1, 1,
-1.353081, -0.275728, -3.100798, 0, 0, 0, 1, 1,
-1.352974, 1.830659, -0.7092869, 0, 0, 0, 1, 1,
-1.350037, 0.5963337, 0.3044725, 0, 0, 0, 1, 1,
-1.348039, -0.1764948, -1.483239, 0, 0, 0, 1, 1,
-1.344118, 1.251706, -0.8946034, 0, 0, 0, 1, 1,
-1.33268, 1.434744, -0.9052392, 0, 0, 0, 1, 1,
-1.329915, -0.6815258, -3.241481, 1, 1, 1, 1, 1,
-1.324401, -0.05043515, -2.593572, 1, 1, 1, 1, 1,
-1.321431, -0.6899128, -3.182203, 1, 1, 1, 1, 1,
-1.298501, 0.4535271, -2.215014, 1, 1, 1, 1, 1,
-1.29793, 0.7616107, -1.185969, 1, 1, 1, 1, 1,
-1.297172, 1.065681, 0.2925218, 1, 1, 1, 1, 1,
-1.294517, 1.659223, -0.5275623, 1, 1, 1, 1, 1,
-1.284544, 0.3690603, -1.790379, 1, 1, 1, 1, 1,
-1.275858, 0.7335493, -2.210806, 1, 1, 1, 1, 1,
-1.271885, -1.210295, -2.218104, 1, 1, 1, 1, 1,
-1.261896, -0.7846251, -0.333549, 1, 1, 1, 1, 1,
-1.245834, 0.7431847, -2.202824, 1, 1, 1, 1, 1,
-1.235004, 1.246201, -0.001110791, 1, 1, 1, 1, 1,
-1.233952, 1.587018, 0.922425, 1, 1, 1, 1, 1,
-1.233495, 0.05112828, -2.138622, 1, 1, 1, 1, 1,
-1.229722, 1.77333, -0.08007173, 0, 0, 1, 1, 1,
-1.227954, 0.9387998, -1.315893, 1, 0, 0, 1, 1,
-1.226129, 0.03275458, -0.2178539, 1, 0, 0, 1, 1,
-1.219702, -0.8928486, -2.557117, 1, 0, 0, 1, 1,
-1.219491, 0.2711584, -2.92047, 1, 0, 0, 1, 1,
-1.219243, 0.2640005, -2.062874, 1, 0, 0, 1, 1,
-1.214943, -1.084504, -1.412921, 0, 0, 0, 1, 1,
-1.212264, 1.11015, -0.5303953, 0, 0, 0, 1, 1,
-1.202954, 1.571756, 1.337604, 0, 0, 0, 1, 1,
-1.201129, 0.4474816, -0.7353117, 0, 0, 0, 1, 1,
-1.178301, -0.2396938, -1.001848, 0, 0, 0, 1, 1,
-1.176944, 0.280383, -2.079074, 0, 0, 0, 1, 1,
-1.170667, -0.8337175, -1.559691, 0, 0, 0, 1, 1,
-1.155195, 1.259161, 0.1917708, 1, 1, 1, 1, 1,
-1.152282, 0.3214031, -1.014439, 1, 1, 1, 1, 1,
-1.152228, -1.288691, -0.3795896, 1, 1, 1, 1, 1,
-1.146453, -1.422082, -4.833073, 1, 1, 1, 1, 1,
-1.141476, -0.1694224, -3.037914, 1, 1, 1, 1, 1,
-1.127747, 0.07585592, -0.7748059, 1, 1, 1, 1, 1,
-1.125457, -0.4715507, -0.8991449, 1, 1, 1, 1, 1,
-1.123533, -0.3212144, -2.524055, 1, 1, 1, 1, 1,
-1.1235, -0.02088348, -2.386315, 1, 1, 1, 1, 1,
-1.116718, -0.3213631, -2.647476, 1, 1, 1, 1, 1,
-1.11399, 0.1207619, -2.637992, 1, 1, 1, 1, 1,
-1.112929, -2.8696, -5.580615, 1, 1, 1, 1, 1,
-1.112744, 0.1050663, -2.528184, 1, 1, 1, 1, 1,
-1.099321, 0.01219511, -1.642529, 1, 1, 1, 1, 1,
-1.09625, -0.7063555, -1.069474, 1, 1, 1, 1, 1,
-1.092954, 0.06430879, -2.11459, 0, 0, 1, 1, 1,
-1.08569, 1.525066, -1.443366, 1, 0, 0, 1, 1,
-1.08435, -0.94157, -2.914395, 1, 0, 0, 1, 1,
-1.082185, -1.238334, -2.721913, 1, 0, 0, 1, 1,
-1.077715, 0.2582187, -2.431984, 1, 0, 0, 1, 1,
-1.07547, -0.2768211, -1.728006, 1, 0, 0, 1, 1,
-1.07203, 1.523299, -0.7373766, 0, 0, 0, 1, 1,
-1.066792, 0.58657, -1.451318, 0, 0, 0, 1, 1,
-1.06281, 0.3741403, -0.8134191, 0, 0, 0, 1, 1,
-1.053482, -0.02579604, -0.8080031, 0, 0, 0, 1, 1,
-1.045267, 0.987375, -1.800985, 0, 0, 0, 1, 1,
-1.04188, 1.211123, -0.6716392, 0, 0, 0, 1, 1,
-1.040196, 0.09697913, -1.55036, 0, 0, 0, 1, 1,
-1.035601, -0.6125531, -1.491854, 1, 1, 1, 1, 1,
-1.029801, 0.2836069, -0.09337404, 1, 1, 1, 1, 1,
-1.027307, -0.100794, -1.700783, 1, 1, 1, 1, 1,
-1.02128, 0.747344, 0.324867, 1, 1, 1, 1, 1,
-1.019829, 0.008001148, -3.157133, 1, 1, 1, 1, 1,
-1.006621, 0.7913549, -3.119944, 1, 1, 1, 1, 1,
-1.006384, 0.3154823, -0.8498206, 1, 1, 1, 1, 1,
-1.002157, 1.048888, -1.619331, 1, 1, 1, 1, 1,
-0.9951928, -1.241691, -4.626298, 1, 1, 1, 1, 1,
-0.9926978, 0.2517594, -1.708083, 1, 1, 1, 1, 1,
-0.9879475, -0.3483561, -3.969374, 1, 1, 1, 1, 1,
-0.9720383, -0.6055459, -3.299558, 1, 1, 1, 1, 1,
-0.9640217, 0.09062143, -1.926573, 1, 1, 1, 1, 1,
-0.963818, 2.93125, 1.183764, 1, 1, 1, 1, 1,
-0.9576339, 0.8601647, -1.579757, 1, 1, 1, 1, 1,
-0.9548227, 0.8186917, 0.437396, 0, 0, 1, 1, 1,
-0.9433864, -1.078755, -2.101676, 1, 0, 0, 1, 1,
-0.9432365, -1.137221, -3.118562, 1, 0, 0, 1, 1,
-0.9426055, -0.2358834, -1.85031, 1, 0, 0, 1, 1,
-0.9277576, 1.087091, -1.316142, 1, 0, 0, 1, 1,
-0.9226624, 0.2372646, -1.770359, 1, 0, 0, 1, 1,
-0.9208913, 0.07135985, -2.359303, 0, 0, 0, 1, 1,
-0.9206439, 0.1518664, -0.6627759, 0, 0, 0, 1, 1,
-0.913431, -2.246035, -3.860548, 0, 0, 0, 1, 1,
-0.9084284, 0.12886, -2.160763, 0, 0, 0, 1, 1,
-0.9079716, 0.3924288, -0.4388338, 0, 0, 0, 1, 1,
-0.9071994, 0.6495708, -1.381181, 0, 0, 0, 1, 1,
-0.9038048, 1.394978, -0.2595069, 0, 0, 0, 1, 1,
-0.9035076, -0.5206907, -1.508915, 1, 1, 1, 1, 1,
-0.8973746, 0.4413627, 1.299504, 1, 1, 1, 1, 1,
-0.889536, 0.8844094, -1.143018, 1, 1, 1, 1, 1,
-0.8800247, -2.567359, -2.545635, 1, 1, 1, 1, 1,
-0.8705651, -0.5330195, -2.99012, 1, 1, 1, 1, 1,
-0.8669665, -0.5220236, -1.686002, 1, 1, 1, 1, 1,
-0.8632866, -0.6147611, -2.370719, 1, 1, 1, 1, 1,
-0.8607146, -2.604492, -2.016342, 1, 1, 1, 1, 1,
-0.8606315, -0.2981474, -1.572674, 1, 1, 1, 1, 1,
-0.8604732, 0.7013354, -0.7023651, 1, 1, 1, 1, 1,
-0.8583163, 0.09463236, -1.396479, 1, 1, 1, 1, 1,
-0.8574294, -1.781478, -3.102295, 1, 1, 1, 1, 1,
-0.857324, 0.1538204, -0.1881854, 1, 1, 1, 1, 1,
-0.8546645, -1.216265, -3.114641, 1, 1, 1, 1, 1,
-0.8541865, -0.6614354, -2.514703, 1, 1, 1, 1, 1,
-0.8535809, -0.5051013, -1.576512, 0, 0, 1, 1, 1,
-0.8533334, 0.1424226, -0.003103261, 1, 0, 0, 1, 1,
-0.85125, 1.711378, 1.082197, 1, 0, 0, 1, 1,
-0.8503629, 0.3275784, -1.050354, 1, 0, 0, 1, 1,
-0.8488548, -0.06402991, -0.8875662, 1, 0, 0, 1, 1,
-0.8449185, -0.3381865, -2.666216, 1, 0, 0, 1, 1,
-0.8349428, 0.5820609, -1.241416, 0, 0, 0, 1, 1,
-0.8330113, 1.179012, 0.3312496, 0, 0, 0, 1, 1,
-0.8301077, -0.7563882, -0.273621, 0, 0, 0, 1, 1,
-0.8300441, -0.1202078, -0.9815786, 0, 0, 0, 1, 1,
-0.8290682, -1.399826, -2.417724, 0, 0, 0, 1, 1,
-0.8275338, -1.67345, -3.416571, 0, 0, 0, 1, 1,
-0.8261033, 0.5347664, 0.9395728, 0, 0, 0, 1, 1,
-0.825368, 0.9951394, -1.481358, 1, 1, 1, 1, 1,
-0.8239718, 0.3866549, -1.59961, 1, 1, 1, 1, 1,
-0.8177031, -0.442521, -2.426754, 1, 1, 1, 1, 1,
-0.8172506, 0.7980877, -1.4973, 1, 1, 1, 1, 1,
-0.8171111, -0.243554, -1.724915, 1, 1, 1, 1, 1,
-0.8114291, -0.5897601, -1.41424, 1, 1, 1, 1, 1,
-0.8067421, -0.1302321, -1.49569, 1, 1, 1, 1, 1,
-0.8046408, -0.5466986, -2.126545, 1, 1, 1, 1, 1,
-0.8020951, 1.423787, 1.68156, 1, 1, 1, 1, 1,
-0.7969624, -1.347611, -2.085625, 1, 1, 1, 1, 1,
-0.7962472, 0.02353566, -1.272681, 1, 1, 1, 1, 1,
-0.7926317, 0.03007918, -1.612786, 1, 1, 1, 1, 1,
-0.787154, 0.3974321, -0.7747328, 1, 1, 1, 1, 1,
-0.786341, 2.36672, 1.119862, 1, 1, 1, 1, 1,
-0.7862195, 0.1822937, -0.4490318, 1, 1, 1, 1, 1,
-0.7825679, -0.3999166, -3.123683, 0, 0, 1, 1, 1,
-0.7812972, -0.8842463, -2.365693, 1, 0, 0, 1, 1,
-0.776113, -1.61006, -0.949659, 1, 0, 0, 1, 1,
-0.7753193, -0.9151253, -2.927183, 1, 0, 0, 1, 1,
-0.773056, 0.4958853, -0.9575035, 1, 0, 0, 1, 1,
-0.7725272, -1.024927, -3.326077, 1, 0, 0, 1, 1,
-0.7723762, 2.66063, 1.47343, 0, 0, 0, 1, 1,
-0.7685046, 1.475768, -0.6661875, 0, 0, 0, 1, 1,
-0.762949, -1.77068, -1.650848, 0, 0, 0, 1, 1,
-0.7555497, 0.7967318, -0.2986656, 0, 0, 0, 1, 1,
-0.7531047, -1.184977, -3.155536, 0, 0, 0, 1, 1,
-0.7444671, -0.8217829, -4.417004, 0, 0, 0, 1, 1,
-0.7416689, -0.1751063, -2.391828, 0, 0, 0, 1, 1,
-0.7412667, 1.114067, -0.6171726, 1, 1, 1, 1, 1,
-0.7394515, 0.1371323, -0.5828108, 1, 1, 1, 1, 1,
-0.7292338, 0.4095655, -0.4194304, 1, 1, 1, 1, 1,
-0.7284652, 0.5176017, -1.977723, 1, 1, 1, 1, 1,
-0.7245622, -0.7663844, -1.453454, 1, 1, 1, 1, 1,
-0.7234076, 0.6063954, 1.49502, 1, 1, 1, 1, 1,
-0.7233838, 0.4871697, 1.405579, 1, 1, 1, 1, 1,
-0.7189907, 0.01501219, -1.164981, 1, 1, 1, 1, 1,
-0.7189417, 0.2386909, -0.5533475, 1, 1, 1, 1, 1,
-0.717751, -0.8153519, -1.777081, 1, 1, 1, 1, 1,
-0.714276, 1.060606, 0.9001275, 1, 1, 1, 1, 1,
-0.713376, -0.6772862, -2.652173, 1, 1, 1, 1, 1,
-0.7113186, 0.1948665, -0.5704834, 1, 1, 1, 1, 1,
-0.7097652, -0.2573048, -2.238972, 1, 1, 1, 1, 1,
-0.7070772, 0.7082116, -0.159395, 1, 1, 1, 1, 1,
-0.705195, 0.4331327, -0.7717348, 0, 0, 1, 1, 1,
-0.7040408, 0.4802399, -0.7510667, 1, 0, 0, 1, 1,
-0.7040117, 1.5711, -0.4390313, 1, 0, 0, 1, 1,
-0.6958799, 1.697109, 0.2294117, 1, 0, 0, 1, 1,
-0.6951131, 0.4423634, -1.319178, 1, 0, 0, 1, 1,
-0.6906387, -0.8795539, -4.109843, 1, 0, 0, 1, 1,
-0.6894975, 0.9463985, 0.8367303, 0, 0, 0, 1, 1,
-0.6869798, 0.103927, -1.804229, 0, 0, 0, 1, 1,
-0.6851488, -0.3315187, -3.416769, 0, 0, 0, 1, 1,
-0.6832782, -0.1574587, -2.597419, 0, 0, 0, 1, 1,
-0.6810567, 0.7806717, -0.8901294, 0, 0, 0, 1, 1,
-0.6807991, 0.1113721, -2.402299, 0, 0, 0, 1, 1,
-0.6794971, 1.057884, 0.5986937, 0, 0, 0, 1, 1,
-0.675767, 0.402307, -1.219541, 1, 1, 1, 1, 1,
-0.6751977, -0.6180114, -2.371464, 1, 1, 1, 1, 1,
-0.6709443, 0.1711925, -2.084813, 1, 1, 1, 1, 1,
-0.670543, 2.476941, 1.887129, 1, 1, 1, 1, 1,
-0.6696714, -0.9500214, -5.152315, 1, 1, 1, 1, 1,
-0.6673986, -0.1460806, -1.940482, 1, 1, 1, 1, 1,
-0.6633543, -0.67348, -2.784048, 1, 1, 1, 1, 1,
-0.6597998, 1.174525, 0.9273025, 1, 1, 1, 1, 1,
-0.6532876, -1.626253, -1.688161, 1, 1, 1, 1, 1,
-0.6518174, 0.3028646, -1.274061, 1, 1, 1, 1, 1,
-0.6499256, -1.066949, -2.183846, 1, 1, 1, 1, 1,
-0.6447083, 1.978287, -0.3133253, 1, 1, 1, 1, 1,
-0.6412745, -0.9857069, -1.337949, 1, 1, 1, 1, 1,
-0.6398441, -0.9047655, -3.518074, 1, 1, 1, 1, 1,
-0.6321174, 0.6517372, 0.1354178, 1, 1, 1, 1, 1,
-0.6296129, -2.276701, -0.7574916, 0, 0, 1, 1, 1,
-0.6283106, -0.262697, -3.538156, 1, 0, 0, 1, 1,
-0.6248217, 0.5306517, 0.04170955, 1, 0, 0, 1, 1,
-0.6234574, -0.2955899, -2.276842, 1, 0, 0, 1, 1,
-0.6221467, 0.4233904, -3.701562, 1, 0, 0, 1, 1,
-0.6202633, -1.078179, -3.970136, 1, 0, 0, 1, 1,
-0.610674, -0.5520185, -2.985834, 0, 0, 0, 1, 1,
-0.6055309, 0.3781132, -1.823843, 0, 0, 0, 1, 1,
-0.604168, 0.7816856, 0.6818201, 0, 0, 0, 1, 1,
-0.6025226, -1.642775, -2.526972, 0, 0, 0, 1, 1,
-0.6012759, 0.06594019, -1.426847, 0, 0, 0, 1, 1,
-0.5960898, -0.4421204, -1.182242, 0, 0, 0, 1, 1,
-0.5953124, -0.08619461, -1.01333, 0, 0, 0, 1, 1,
-0.5883131, -0.1030968, -1.69659, 1, 1, 1, 1, 1,
-0.5866871, 0.7947547, -0.5086911, 1, 1, 1, 1, 1,
-0.5806013, 2.088852, -1.386527, 1, 1, 1, 1, 1,
-0.5802684, 0.2418129, -1.648442, 1, 1, 1, 1, 1,
-0.5798767, -1.460149, -3.449826, 1, 1, 1, 1, 1,
-0.5589848, 1.148641, -2.264982, 1, 1, 1, 1, 1,
-0.558402, 1.184306, -0.08101034, 1, 1, 1, 1, 1,
-0.5564915, -0.09156881, -0.1065038, 1, 1, 1, 1, 1,
-0.555746, 1.094389, 0.9184697, 1, 1, 1, 1, 1,
-0.5505503, -1.213524, -2.595769, 1, 1, 1, 1, 1,
-0.54785, 2.780553, -0.5930865, 1, 1, 1, 1, 1,
-0.5474697, -1.149834, -2.443988, 1, 1, 1, 1, 1,
-0.5467414, 0.7470251, -0.5332084, 1, 1, 1, 1, 1,
-0.5404465, -0.0600968, -3.474963, 1, 1, 1, 1, 1,
-0.538557, -0.7786698, -3.166167, 1, 1, 1, 1, 1,
-0.5342787, -0.7236003, -2.482903, 0, 0, 1, 1, 1,
-0.5254164, -1.329092, -0.9281669, 1, 0, 0, 1, 1,
-0.5245439, 0.2724105, -1.455268, 1, 0, 0, 1, 1,
-0.5214768, -0.118594, -3.096013, 1, 0, 0, 1, 1,
-0.5140066, -0.82864, -2.628787, 1, 0, 0, 1, 1,
-0.5122858, 0.1963342, -1.745762, 1, 0, 0, 1, 1,
-0.5122817, 1.114437, 0.2202497, 0, 0, 0, 1, 1,
-0.5063563, -0.5804414, -1.927287, 0, 0, 0, 1, 1,
-0.5048426, -0.3524057, -0.7020954, 0, 0, 0, 1, 1,
-0.5040429, -0.7465651, -2.549109, 0, 0, 0, 1, 1,
-0.5006178, -0.2620808, -2.100341, 0, 0, 0, 1, 1,
-0.4971619, 0.9722165, -1.01641, 0, 0, 0, 1, 1,
-0.4924151, 2.127819, 1.138708, 0, 0, 0, 1, 1,
-0.4904043, 0.9252084, -1.713729, 1, 1, 1, 1, 1,
-0.4814945, -0.7939572, -2.055333, 1, 1, 1, 1, 1,
-0.4811759, -1.644635, -3.17595, 1, 1, 1, 1, 1,
-0.4794607, -0.5052367, -4.258745, 1, 1, 1, 1, 1,
-0.4781822, 0.06678602, -1.105408, 1, 1, 1, 1, 1,
-0.4776674, -0.3584292, -2.288595, 1, 1, 1, 1, 1,
-0.4754257, -0.07897269, -1.321532, 1, 1, 1, 1, 1,
-0.4687927, 1.388323, -0.252195, 1, 1, 1, 1, 1,
-0.4621762, -0.0891128, -1.044849, 1, 1, 1, 1, 1,
-0.4598716, -0.152342, -3.127246, 1, 1, 1, 1, 1,
-0.4580809, 0.1717611, -0.1353334, 1, 1, 1, 1, 1,
-0.4521266, -0.4862696, -2.667265, 1, 1, 1, 1, 1,
-0.4501675, 0.6045194, -2.624336, 1, 1, 1, 1, 1,
-0.4481248, -0.7790747, -2.674234, 1, 1, 1, 1, 1,
-0.4469615, -0.5139564, -3.74121, 1, 1, 1, 1, 1,
-0.4377289, -0.05028275, -1.955644, 0, 0, 1, 1, 1,
-0.4362568, -0.8359632, -0.9031808, 1, 0, 0, 1, 1,
-0.4351608, 0.2577181, -1.772859, 1, 0, 0, 1, 1,
-0.4336323, 1.74664, -0.2485469, 1, 0, 0, 1, 1,
-0.4301673, -0.0540377, -0.9094434, 1, 0, 0, 1, 1,
-0.4268276, 0.2039056, 0.3333958, 1, 0, 0, 1, 1,
-0.4261985, 0.4556409, -2.935493, 0, 0, 0, 1, 1,
-0.420911, -0.2222821, -3.001922, 0, 0, 0, 1, 1,
-0.4142464, 0.1209632, -0.9057681, 0, 0, 0, 1, 1,
-0.4105277, -0.4018663, -2.072121, 0, 0, 0, 1, 1,
-0.4080061, -0.369176, -2.280921, 0, 0, 0, 1, 1,
-0.4049536, 0.4848759, -0.1984998, 0, 0, 0, 1, 1,
-0.4019756, -1.701065, -1.611727, 0, 0, 0, 1, 1,
-0.4007467, 0.9045972, -0.3413416, 1, 1, 1, 1, 1,
-0.4005065, 0.3989273, -1.039463, 1, 1, 1, 1, 1,
-0.4001365, 0.5460421, -1.346192, 1, 1, 1, 1, 1,
-0.3969023, 1.235735, -0.3021867, 1, 1, 1, 1, 1,
-0.3925874, 1.098566, -1.074647, 1, 1, 1, 1, 1,
-0.3925475, 0.1729966, -1.588532, 1, 1, 1, 1, 1,
-0.3924378, -2.235578, -3.125142, 1, 1, 1, 1, 1,
-0.3904478, 0.8714257, -0.338929, 1, 1, 1, 1, 1,
-0.3878726, 0.340141, -0.5245385, 1, 1, 1, 1, 1,
-0.3814518, -0.3189512, -2.185214, 1, 1, 1, 1, 1,
-0.3787019, 2.332041, -0.6541536, 1, 1, 1, 1, 1,
-0.3751187, 0.9812285, -0.7660169, 1, 1, 1, 1, 1,
-0.3591204, 1.517319, -0.3707357, 1, 1, 1, 1, 1,
-0.3575058, -0.7883319, -1.746563, 1, 1, 1, 1, 1,
-0.3552309, 2.059218, -1.037519, 1, 1, 1, 1, 1,
-0.3517139, -0.7725857, -1.229586, 0, 0, 1, 1, 1,
-0.3416368, 0.159196, -0.04507637, 1, 0, 0, 1, 1,
-0.339014, 2.136963, 0.1930969, 1, 0, 0, 1, 1,
-0.3353277, 0.8154915, 1.206071, 1, 0, 0, 1, 1,
-0.3327777, 0.1677632, -0.6021481, 1, 0, 0, 1, 1,
-0.3301516, -0.47408, -2.528368, 1, 0, 0, 1, 1,
-0.3282698, -0.8226938, -2.645718, 0, 0, 0, 1, 1,
-0.3259984, -1.276295, -2.516631, 0, 0, 0, 1, 1,
-0.3249653, -0.4046502, -2.856063, 0, 0, 0, 1, 1,
-0.319673, -0.2013121, -0.9928525, 0, 0, 0, 1, 1,
-0.3134791, -0.7057506, -3.079162, 0, 0, 0, 1, 1,
-0.310654, 0.1762122, -0.01651443, 0, 0, 0, 1, 1,
-0.3088004, -1.279957, -3.420925, 0, 0, 0, 1, 1,
-0.3058733, 0.01114446, -0.2909129, 1, 1, 1, 1, 1,
-0.3026672, -0.2299269, -4.450246, 1, 1, 1, 1, 1,
-0.3014157, -0.4980769, -1.933667, 1, 1, 1, 1, 1,
-0.2954394, 0.7387243, -0.2555823, 1, 1, 1, 1, 1,
-0.2944098, 1.070049, -0.4738322, 1, 1, 1, 1, 1,
-0.2926672, 0.5524828, -0.554593, 1, 1, 1, 1, 1,
-0.2899575, 0.9272647, -1.112006, 1, 1, 1, 1, 1,
-0.289156, 0.4337547, 1.134093, 1, 1, 1, 1, 1,
-0.2887525, 1.50514, 0.47357, 1, 1, 1, 1, 1,
-0.2878921, 1.294982, -1.098866, 1, 1, 1, 1, 1,
-0.2872549, -0.8754658, -2.675692, 1, 1, 1, 1, 1,
-0.2836711, -2.077361, -2.946043, 1, 1, 1, 1, 1,
-0.2832612, 0.5760438, -1.095926, 1, 1, 1, 1, 1,
-0.282078, -1.450208, -3.60806, 1, 1, 1, 1, 1,
-0.2765194, 0.1649558, -1.101135, 1, 1, 1, 1, 1,
-0.2761413, -1.033346, -2.620863, 0, 0, 1, 1, 1,
-0.2718961, 0.1480586, -0.7268495, 1, 0, 0, 1, 1,
-0.2645985, -0.1025668, -2.735579, 1, 0, 0, 1, 1,
-0.2628522, 0.8050187, 0.7246643, 1, 0, 0, 1, 1,
-0.2623316, 0.07776938, -0.5078647, 1, 0, 0, 1, 1,
-0.255702, 1.461086, -1.665967, 1, 0, 0, 1, 1,
-0.2547562, 1.438206, 1.062224, 0, 0, 0, 1, 1,
-0.2541657, 1.228957, -0.5007638, 0, 0, 0, 1, 1,
-0.2539171, 0.2933934, 0.9269674, 0, 0, 0, 1, 1,
-0.2520923, -0.2134936, -1.792142, 0, 0, 0, 1, 1,
-0.2506736, -0.4962448, -4.142279, 0, 0, 0, 1, 1,
-0.2502692, 0.4286381, 0.8692622, 0, 0, 0, 1, 1,
-0.2490775, -0.5911098, -1.466048, 0, 0, 0, 1, 1,
-0.2460633, 0.2322487, 0.3409062, 1, 1, 1, 1, 1,
-0.2424857, 0.4354602, -0.893476, 1, 1, 1, 1, 1,
-0.2378197, -0.6055659, -1.61252, 1, 1, 1, 1, 1,
-0.228325, 0.2047613, -2.842617, 1, 1, 1, 1, 1,
-0.2276861, 0.5548539, -1.67102, 1, 1, 1, 1, 1,
-0.2229085, -0.8410809, -4.884776, 1, 1, 1, 1, 1,
-0.2165237, -0.9458059, -3.181676, 1, 1, 1, 1, 1,
-0.2127119, 0.8110117, 0.2091281, 1, 1, 1, 1, 1,
-0.2030906, 0.5351549, -0.8672078, 1, 1, 1, 1, 1,
-0.2026838, 0.5810799, -1.553978, 1, 1, 1, 1, 1,
-0.2011075, 0.002384487, 0.08712015, 1, 1, 1, 1, 1,
-0.1997076, 0.1258349, -0.7441224, 1, 1, 1, 1, 1,
-0.188026, -2.212613, -3.578529, 1, 1, 1, 1, 1,
-0.1879124, 0.7941633, 1.006034, 1, 1, 1, 1, 1,
-0.1852253, -0.2422933, -3.062561, 1, 1, 1, 1, 1,
-0.1835894, 1.484684, -0.1927394, 0, 0, 1, 1, 1,
-0.177426, 0.3280319, -0.7845954, 1, 0, 0, 1, 1,
-0.1759337, -1.195686, -2.996707, 1, 0, 0, 1, 1,
-0.1742097, -0.6921465, -3.816198, 1, 0, 0, 1, 1,
-0.1736721, -1.980509, -2.624688, 1, 0, 0, 1, 1,
-0.1721319, 0.4802579, 0.8100028, 1, 0, 0, 1, 1,
-0.1665847, 2.371834, -0.7155283, 0, 0, 0, 1, 1,
-0.1651679, 0.3214613, -1.423144, 0, 0, 0, 1, 1,
-0.1644492, 0.3525259, -0.2696157, 0, 0, 0, 1, 1,
-0.1638025, -0.3904029, -4.159616, 0, 0, 0, 1, 1,
-0.1623812, 1.219004, 0.09920542, 0, 0, 0, 1, 1,
-0.162321, -0.09534074, -3.315542, 0, 0, 0, 1, 1,
-0.1609467, -1.445143, -2.536697, 0, 0, 0, 1, 1,
-0.1581288, 0.2586441, -0.3651333, 1, 1, 1, 1, 1,
-0.1482912, 0.1910471, -2.381157, 1, 1, 1, 1, 1,
-0.1477219, 0.4533664, 1.591863, 1, 1, 1, 1, 1,
-0.1453748, 0.2983971, 0.6877007, 1, 1, 1, 1, 1,
-0.1380901, -0.4513879, -2.027741, 1, 1, 1, 1, 1,
-0.1339096, -1.063204, -1.646102, 1, 1, 1, 1, 1,
-0.1319648, -0.380248, -2.157754, 1, 1, 1, 1, 1,
-0.1228623, 1.603228, 0.3818301, 1, 1, 1, 1, 1,
-0.1201158, 1.088224, 1.304133, 1, 1, 1, 1, 1,
-0.1168315, -0.1582383, -1.206119, 1, 1, 1, 1, 1,
-0.1159021, 0.1206114, -1.563028, 1, 1, 1, 1, 1,
-0.108461, -1.463047, -2.22107, 1, 1, 1, 1, 1,
-0.1063005, -1.088749, -3.742945, 1, 1, 1, 1, 1,
-0.0969032, -1.181396, -4.180262, 1, 1, 1, 1, 1,
-0.09688757, 0.5101278, 0.2288853, 1, 1, 1, 1, 1,
-0.09205834, 0.07167044, -0.2628, 0, 0, 1, 1, 1,
-0.08774006, 1.400623, -0.07965471, 1, 0, 0, 1, 1,
-0.08555676, -1.287165, -3.375873, 1, 0, 0, 1, 1,
-0.0836563, 0.624119, 0.5401888, 1, 0, 0, 1, 1,
-0.08091141, 0.3090416, 0.2356109, 1, 0, 0, 1, 1,
-0.07858805, 0.6334391, 0.2566456, 1, 0, 0, 1, 1,
-0.07712144, 0.495154, 0.290351, 0, 0, 0, 1, 1,
-0.07567387, 0.4192249, -0.7044275, 0, 0, 0, 1, 1,
-0.07312441, 0.7086104, 0.7312078, 0, 0, 0, 1, 1,
-0.07264777, -0.007954222, -2.025654, 0, 0, 0, 1, 1,
-0.07228648, 1.151786, -1.139172, 0, 0, 0, 1, 1,
-0.07076818, 0.1922021, 0.2795372, 0, 0, 0, 1, 1,
-0.06879371, -1.403201, -2.846248, 0, 0, 0, 1, 1,
-0.06830051, -1.141639, -4.620039, 1, 1, 1, 1, 1,
-0.06580707, -0.09810499, -2.853453, 1, 1, 1, 1, 1,
-0.06183431, -0.56023, -1.695225, 1, 1, 1, 1, 1,
-0.06022758, 0.4672201, -1.174341, 1, 1, 1, 1, 1,
-0.05866307, -0.8915688, -3.708711, 1, 1, 1, 1, 1,
-0.05758914, -1.214526, -2.721741, 1, 1, 1, 1, 1,
-0.05524122, -0.189537, -3.033088, 1, 1, 1, 1, 1,
-0.05439724, -0.9276427, -5.436902, 1, 1, 1, 1, 1,
-0.05271751, -1.235526, -2.288622, 1, 1, 1, 1, 1,
-0.04881432, -0.6189875, -4.908734, 1, 1, 1, 1, 1,
-0.04665579, 1.56653, 1.721269, 1, 1, 1, 1, 1,
-0.04143579, 0.431313, -0.4427366, 1, 1, 1, 1, 1,
-0.04014939, -0.8208651, -2.143425, 1, 1, 1, 1, 1,
-0.03640299, 1.413665, -1.894817, 1, 1, 1, 1, 1,
-0.03422635, 2.28327, 0.700939, 1, 1, 1, 1, 1,
-0.02985784, -0.0782629, -4.007599, 0, 0, 1, 1, 1,
-0.02973799, -0.2943673, -3.700536, 1, 0, 0, 1, 1,
-0.02645771, -0.02910888, -3.021704, 1, 0, 0, 1, 1,
-0.02398604, -0.7036211, -4.308188, 1, 0, 0, 1, 1,
-0.02256234, 1.691585, 0.3682064, 1, 0, 0, 1, 1,
-0.01960436, -0.01830254, -2.998309, 1, 0, 0, 1, 1,
-0.01808219, -0.7794024, -0.3044213, 0, 0, 0, 1, 1,
-0.01741015, -0.9552494, -2.888435, 0, 0, 0, 1, 1,
-0.01449747, 1.444336, -0.5658244, 0, 0, 0, 1, 1,
-0.01038391, 0.2728298, -1.690797, 0, 0, 0, 1, 1,
-0.006020634, -1.691626, -4.871385, 0, 0, 0, 1, 1,
-0.004066329, 0.2821372, 1.183366, 0, 0, 0, 1, 1,
-0.002909634, 0.3940635, -0.768499, 0, 0, 0, 1, 1,
-0.001850984, 0.02143826, -0.7118446, 1, 1, 1, 1, 1,
0.002330145, -0.2406958, 4.746706, 1, 1, 1, 1, 1,
0.002570564, -0.4228351, 5.022844, 1, 1, 1, 1, 1,
0.006104702, 0.3642405, -0.02743496, 1, 1, 1, 1, 1,
0.007374372, 0.3035897, -1.439551, 1, 1, 1, 1, 1,
0.008639475, 2.013605, 0.0476068, 1, 1, 1, 1, 1,
0.013403, -0.9477415, 2.227763, 1, 1, 1, 1, 1,
0.0138065, -2.173986, 2.166096, 1, 1, 1, 1, 1,
0.01801949, 0.4486282, -0.3254941, 1, 1, 1, 1, 1,
0.01870773, 0.2084979, -0.7326304, 1, 1, 1, 1, 1,
0.02131129, 1.315295, 1.721017, 1, 1, 1, 1, 1,
0.0246441, 1.114602, -1.957832, 1, 1, 1, 1, 1,
0.02520501, 1.185766, -1.268465, 1, 1, 1, 1, 1,
0.02858759, -1.238191, 2.133347, 1, 1, 1, 1, 1,
0.03047522, -0.6593362, 2.171429, 1, 1, 1, 1, 1,
0.03986511, -0.9757448, 1.617939, 0, 0, 1, 1, 1,
0.04207303, -2.066005, 2.612059, 1, 0, 0, 1, 1,
0.04320702, 0.433194, -1.746035, 1, 0, 0, 1, 1,
0.04398131, -0.3573411, 2.709652, 1, 0, 0, 1, 1,
0.0453668, 1.365346, -1.353432, 1, 0, 0, 1, 1,
0.05137934, 0.02320577, 1.502015, 1, 0, 0, 1, 1,
0.05459145, -0.2903737, 2.227976, 0, 0, 0, 1, 1,
0.05890491, -0.76494, 3.008989, 0, 0, 0, 1, 1,
0.05919081, -1.604866, 2.539952, 0, 0, 0, 1, 1,
0.06183469, -1.306025, 1.881925, 0, 0, 0, 1, 1,
0.06405091, -0.03210163, 1.599126, 0, 0, 0, 1, 1,
0.06459774, -0.5381467, 1.97996, 0, 0, 0, 1, 1,
0.06489924, 0.4704586, 1.159204, 0, 0, 0, 1, 1,
0.06774966, -2.216049, 3.626017, 1, 1, 1, 1, 1,
0.07056262, -0.5349191, 4.259968, 1, 1, 1, 1, 1,
0.07147234, -1.189004, 5.580526, 1, 1, 1, 1, 1,
0.07241916, 0.6799267, 0.9727863, 1, 1, 1, 1, 1,
0.07421137, -0.6831898, 3.146976, 1, 1, 1, 1, 1,
0.07451267, 0.9719191, -0.2670409, 1, 1, 1, 1, 1,
0.07635775, 0.3614927, 0.1614183, 1, 1, 1, 1, 1,
0.08265825, -0.01139394, 2.551434, 1, 1, 1, 1, 1,
0.08366564, 1.149888, -0.4993451, 1, 1, 1, 1, 1,
0.08808897, -0.1511496, 2.117903, 1, 1, 1, 1, 1,
0.09096568, -0.1139748, 3.317652, 1, 1, 1, 1, 1,
0.09416559, 0.4668492, 1.178366, 1, 1, 1, 1, 1,
0.0972069, -0.965398, 2.510903, 1, 1, 1, 1, 1,
0.09807178, -1.411419, 2.571945, 1, 1, 1, 1, 1,
0.09982048, 1.757979, 0.9526587, 1, 1, 1, 1, 1,
0.09998596, 1.773987, -1.806268, 0, 0, 1, 1, 1,
0.1004859, 0.06808098, -0.03911037, 1, 0, 0, 1, 1,
0.1045498, -1.49982, 3.058026, 1, 0, 0, 1, 1,
0.109318, -1.564147, 3.093658, 1, 0, 0, 1, 1,
0.1147096, 1.02931, -0.1049321, 1, 0, 0, 1, 1,
0.1173439, 0.8725277, 1.345215, 1, 0, 0, 1, 1,
0.1176225, 0.6778983, 1.260399, 0, 0, 0, 1, 1,
0.1193099, -1.162851, 1.004459, 0, 0, 0, 1, 1,
0.1327029, -0.4459406, 2.615593, 0, 0, 0, 1, 1,
0.1349227, -0.2661555, 0.6890396, 0, 0, 0, 1, 1,
0.1375984, -0.2570488, 1.843595, 0, 0, 0, 1, 1,
0.1381246, -0.290118, 3.971122, 0, 0, 0, 1, 1,
0.1394255, 0.9915096, -0.4598044, 0, 0, 0, 1, 1,
0.1416625, -0.4823671, 3.955494, 1, 1, 1, 1, 1,
0.1542091, 0.8036784, -0.2520648, 1, 1, 1, 1, 1,
0.1555087, -0.246604, 1.923657, 1, 1, 1, 1, 1,
0.160143, 1.35894, -0.3637445, 1, 1, 1, 1, 1,
0.1606951, 0.3472135, 1.569092, 1, 1, 1, 1, 1,
0.1658813, 0.4115047, 0.2518207, 1, 1, 1, 1, 1,
0.1699128, 0.566903, 0.8232859, 1, 1, 1, 1, 1,
0.1722189, 1.292009, 0.2597434, 1, 1, 1, 1, 1,
0.1723794, -0.2543089, 2.605117, 1, 1, 1, 1, 1,
0.1740872, -0.771776, 2.597769, 1, 1, 1, 1, 1,
0.1760069, -1.437085, 2.271063, 1, 1, 1, 1, 1,
0.1768272, -0.5095863, 2.481528, 1, 1, 1, 1, 1,
0.1784555, -0.6761023, 2.77702, 1, 1, 1, 1, 1,
0.1794654, -0.2679182, 2.742412, 1, 1, 1, 1, 1,
0.1810739, 0.4536116, -0.05012615, 1, 1, 1, 1, 1,
0.1830052, 0.1552324, 0.6975003, 0, 0, 1, 1, 1,
0.1861769, 1.307553, 1.41392, 1, 0, 0, 1, 1,
0.1882458, -0.4520047, 3.900917, 1, 0, 0, 1, 1,
0.189704, -0.6138062, 2.914187, 1, 0, 0, 1, 1,
0.1966939, -0.2933728, 1.656074, 1, 0, 0, 1, 1,
0.2004788, 1.199641, 0.8950808, 1, 0, 0, 1, 1,
0.2014491, -1.932115, 2.162651, 0, 0, 0, 1, 1,
0.2024429, -0.2482405, 3.710847, 0, 0, 0, 1, 1,
0.2073505, 1.323164, -0.6224227, 0, 0, 0, 1, 1,
0.2084192, 0.5736702, -1.177757, 0, 0, 0, 1, 1,
0.209617, 0.9077181, -0.2656037, 0, 0, 0, 1, 1,
0.2100127, -0.4016016, 2.027267, 0, 0, 0, 1, 1,
0.2111949, 0.5471119, 1.240957, 0, 0, 0, 1, 1,
0.213766, 0.6013756, -0.4852466, 1, 1, 1, 1, 1,
0.2152697, -1.121665, 2.127748, 1, 1, 1, 1, 1,
0.2154796, -0.7957246, 2.509997, 1, 1, 1, 1, 1,
0.2193959, 0.7569146, 1.142493, 1, 1, 1, 1, 1,
0.2244994, 0.09106529, 0.7850829, 1, 1, 1, 1, 1,
0.2273178, -0.4517038, 3.024034, 1, 1, 1, 1, 1,
0.2313367, 1.104719, 1.23461, 1, 1, 1, 1, 1,
0.232987, -0.05240086, 0.9136246, 1, 1, 1, 1, 1,
0.2335315, -0.8969334, 1.460046, 1, 1, 1, 1, 1,
0.2356357, 0.152239, 0.9725266, 1, 1, 1, 1, 1,
0.2371127, 0.1975101, 0.4652619, 1, 1, 1, 1, 1,
0.237673, -0.3961913, 3.548942, 1, 1, 1, 1, 1,
0.2380117, -0.5167318, 3.643391, 1, 1, 1, 1, 1,
0.2388165, -0.5305577, 2.456156, 1, 1, 1, 1, 1,
0.2428371, -1.202849, 3.616757, 1, 1, 1, 1, 1,
0.24687, 0.3507072, 0.8512323, 0, 0, 1, 1, 1,
0.2469864, 0.6428649, -0.6017084, 1, 0, 0, 1, 1,
0.2475529, -1.885095, 4.632389, 1, 0, 0, 1, 1,
0.2489951, 0.6373086, 0.1639353, 1, 0, 0, 1, 1,
0.251899, 1.622767, 0.3603879, 1, 0, 0, 1, 1,
0.2533123, -0.2604616, 2.818963, 1, 0, 0, 1, 1,
0.2538225, 0.2626756, 1.335063, 0, 0, 0, 1, 1,
0.2545853, -1.465375, 2.938268, 0, 0, 0, 1, 1,
0.2580048, -0.2660994, 1.023116, 0, 0, 0, 1, 1,
0.2584235, 0.2917615, 1.244259, 0, 0, 0, 1, 1,
0.2597077, 0.3860572, -0.7025343, 0, 0, 0, 1, 1,
0.2622623, 0.5354776, 0.06352247, 0, 0, 0, 1, 1,
0.2643089, 0.5473189, 0.8532714, 0, 0, 0, 1, 1,
0.26624, 0.3919488, 1.020968, 1, 1, 1, 1, 1,
0.2662587, 0.375679, 1.557932, 1, 1, 1, 1, 1,
0.2699206, 0.3843054, 1.43648, 1, 1, 1, 1, 1,
0.2759905, -1.07498, 2.439817, 1, 1, 1, 1, 1,
0.2767353, 0.6036077, 0.6112825, 1, 1, 1, 1, 1,
0.2781914, -1.475277, 4.358512, 1, 1, 1, 1, 1,
0.279397, 0.8200095, -0.82905, 1, 1, 1, 1, 1,
0.2799838, 0.05829328, 2.717303, 1, 1, 1, 1, 1,
0.2842134, -0.1902626, 2.012579, 1, 1, 1, 1, 1,
0.286904, 1.038804, 0.9888439, 1, 1, 1, 1, 1,
0.2879238, -0.8870422, 5.871557, 1, 1, 1, 1, 1,
0.2891046, -1.082765, 2.891591, 1, 1, 1, 1, 1,
0.2894496, 2.115613, 1.146049, 1, 1, 1, 1, 1,
0.2961963, -1.829994, 1.881973, 1, 1, 1, 1, 1,
0.296542, -1.607753, 1.670667, 1, 1, 1, 1, 1,
0.2966615, -0.7238816, 1.379032, 0, 0, 1, 1, 1,
0.2970922, 0.1433578, 0.8630294, 1, 0, 0, 1, 1,
0.3025374, -1.329319, 3.133425, 1, 0, 0, 1, 1,
0.30255, -1.055823, 3.322599, 1, 0, 0, 1, 1,
0.311531, 2.645471, -0.04474301, 1, 0, 0, 1, 1,
0.3291867, 1.120614, 0.6003401, 1, 0, 0, 1, 1,
0.3292761, 0.6190029, 1.005958, 0, 0, 0, 1, 1,
0.3293723, 0.06862261, -0.6265767, 0, 0, 0, 1, 1,
0.3314935, 0.01628668, 1.128589, 0, 0, 0, 1, 1,
0.3336408, -0.2806219, 0.4563387, 0, 0, 0, 1, 1,
0.3388547, 1.577346, 0.7318329, 0, 0, 0, 1, 1,
0.3410393, -1.537899, 4.661666, 0, 0, 0, 1, 1,
0.3421176, -0.4610332, 2.091859, 0, 0, 0, 1, 1,
0.3454832, -0.2522921, 1.078193, 1, 1, 1, 1, 1,
0.3460642, 0.2715988, 1.887603, 1, 1, 1, 1, 1,
0.3466286, -1.770813, 1.804446, 1, 1, 1, 1, 1,
0.3475623, 1.2317, -0.3682714, 1, 1, 1, 1, 1,
0.3499591, 1.312122, -0.3535767, 1, 1, 1, 1, 1,
0.3518019, 1.16073, -0.33493, 1, 1, 1, 1, 1,
0.352758, 1.059769, -0.6046202, 1, 1, 1, 1, 1,
0.353813, 1.921475, -0.8003731, 1, 1, 1, 1, 1,
0.3619525, 0.6559261, 0.4187912, 1, 1, 1, 1, 1,
0.3621744, -0.01207573, 0.9034308, 1, 1, 1, 1, 1,
0.3621792, 0.7393129, -0.2676162, 1, 1, 1, 1, 1,
0.370829, 0.8666642, -0.5269395, 1, 1, 1, 1, 1,
0.3765222, -0.7999974, 2.763173, 1, 1, 1, 1, 1,
0.378489, 1.858201, -0.2555907, 1, 1, 1, 1, 1,
0.3802529, -0.4627995, 3.839899, 1, 1, 1, 1, 1,
0.38266, -0.2962466, 2.951841, 0, 0, 1, 1, 1,
0.3841653, -0.388328, 3.639885, 1, 0, 0, 1, 1,
0.3877548, 0.5255432, 0.4460389, 1, 0, 0, 1, 1,
0.3879414, -0.1355588, 1.627638, 1, 0, 0, 1, 1,
0.3943732, 0.04337876, 0.8680224, 1, 0, 0, 1, 1,
0.3945397, 1.556095, 0.8872511, 1, 0, 0, 1, 1,
0.3949256, 0.4375439, -0.4452317, 0, 0, 0, 1, 1,
0.3974445, 1.411602, 2.491301, 0, 0, 0, 1, 1,
0.4083086, -1.389246, 3.026376, 0, 0, 0, 1, 1,
0.4131409, 0.02015284, 1.268637, 0, 0, 0, 1, 1,
0.4167173, 1.356459, -0.5998194, 0, 0, 0, 1, 1,
0.4170792, -1.590642, 3.003305, 0, 0, 0, 1, 1,
0.4214698, -0.579398, 0.5479146, 0, 0, 0, 1, 1,
0.4221894, -0.3905019, 0.8777975, 1, 1, 1, 1, 1,
0.4271442, 0.6412, -0.4000445, 1, 1, 1, 1, 1,
0.427687, 0.7650809, 0.426988, 1, 1, 1, 1, 1,
0.4297833, -0.6777573, 2.118135, 1, 1, 1, 1, 1,
0.4297875, -0.9501814, 2.445051, 1, 1, 1, 1, 1,
0.4345353, -1.875083, 2.619276, 1, 1, 1, 1, 1,
0.4357062, -0.03679771, 1.826013, 1, 1, 1, 1, 1,
0.4415072, 0.8948787, -0.6044781, 1, 1, 1, 1, 1,
0.4419012, -1.285547, 4.010312, 1, 1, 1, 1, 1,
0.4452013, -1.278077, 3.104224, 1, 1, 1, 1, 1,
0.4473943, -0.3031073, 1.770311, 1, 1, 1, 1, 1,
0.4481954, -0.1364868, 2.39589, 1, 1, 1, 1, 1,
0.4521309, 1.077003, 1.074716, 1, 1, 1, 1, 1,
0.4521807, 0.8089618, 0.01794581, 1, 1, 1, 1, 1,
0.453961, -0.9201772, 1.781881, 1, 1, 1, 1, 1,
0.4544298, -0.299323, 2.184581, 0, 0, 1, 1, 1,
0.4549142, 0.3185258, 0.2890225, 1, 0, 0, 1, 1,
0.4632457, -0.2654434, 2.376125, 1, 0, 0, 1, 1,
0.4690337, 0.4777592, 0.3153559, 1, 0, 0, 1, 1,
0.4723138, -0.1932694, 3.540305, 1, 0, 0, 1, 1,
0.4726654, 1.729436, 2.268414, 1, 0, 0, 1, 1,
0.4752188, -0.3626815, 2.574002, 0, 0, 0, 1, 1,
0.4769553, 1.003218, 0.3073624, 0, 0, 0, 1, 1,
0.4771501, -1.699656, 2.686185, 0, 0, 0, 1, 1,
0.4778117, 0.9409866, -1.332929, 0, 0, 0, 1, 1,
0.481124, 2.507307, 0.3819725, 0, 0, 0, 1, 1,
0.4813874, 0.8898057, 0.9261584, 0, 0, 0, 1, 1,
0.4813943, -1.950583, 2.38278, 0, 0, 0, 1, 1,
0.4831831, -1.32832, 3.879773, 1, 1, 1, 1, 1,
0.4832221, 0.6892841, 0.5316574, 1, 1, 1, 1, 1,
0.4867186, -1.061907, 3.11725, 1, 1, 1, 1, 1,
0.4876092, -1.183761, 4.294683, 1, 1, 1, 1, 1,
0.4907146, 0.279974, 2.489973, 1, 1, 1, 1, 1,
0.491241, -0.3744636, 1.865458, 1, 1, 1, 1, 1,
0.4925137, 1.149583, -0.9904489, 1, 1, 1, 1, 1,
0.4944186, -1.167699, 2.057465, 1, 1, 1, 1, 1,
0.497221, -0.4746013, 1.295408, 1, 1, 1, 1, 1,
0.5004014, 0.4787192, 2.831499, 1, 1, 1, 1, 1,
0.5026233, 2.202798, 1.080178, 1, 1, 1, 1, 1,
0.5187631, -2.418836, 4.085244, 1, 1, 1, 1, 1,
0.5212438, 1.380414, -0.9263347, 1, 1, 1, 1, 1,
0.5287258, 0.708236, 1.51509, 1, 1, 1, 1, 1,
0.5293244, 0.2000789, 1.13964, 1, 1, 1, 1, 1,
0.5334129, 1.018694, -0.1887278, 0, 0, 1, 1, 1,
0.5364119, -0.4927211, 2.666563, 1, 0, 0, 1, 1,
0.5373922, 0.24465, 0.3848617, 1, 0, 0, 1, 1,
0.5479638, 0.3626, -3.115188, 1, 0, 0, 1, 1,
0.547999, -0.4520888, 2.670662, 1, 0, 0, 1, 1,
0.5480547, -0.1377073, 2.568046, 1, 0, 0, 1, 1,
0.5487167, 1.443439, 0.7384616, 0, 0, 0, 1, 1,
0.5508177, 1.761538, 0.5714726, 0, 0, 0, 1, 1,
0.5535278, -0.2476164, 2.415136, 0, 0, 0, 1, 1,
0.5565378, -0.1136686, 2.89789, 0, 0, 0, 1, 1,
0.5578571, -0.2865241, 1.535768, 0, 0, 0, 1, 1,
0.5639696, 1.248753, 1.998008, 0, 0, 0, 1, 1,
0.565177, -0.6475033, 3.147056, 0, 0, 0, 1, 1,
0.567452, -1.750036, 3.463154, 1, 1, 1, 1, 1,
0.5717713, -0.02493553, 1.549443, 1, 1, 1, 1, 1,
0.5737642, -0.1333693, 0.8287085, 1, 1, 1, 1, 1,
0.5805031, -0.1700012, 3.108953, 1, 1, 1, 1, 1,
0.5819733, 1.242887, 0.6859616, 1, 1, 1, 1, 1,
0.5825273, 0.9207398, 1.87112, 1, 1, 1, 1, 1,
0.5890206, 0.2542279, 1.99606, 1, 1, 1, 1, 1,
0.5891746, -2.230845, 1.541597, 1, 1, 1, 1, 1,
0.5905702, -0.6520859, 3.540205, 1, 1, 1, 1, 1,
0.592842, 0.9336787, 0.705276, 1, 1, 1, 1, 1,
0.6051392, 1.491984, 1.3774, 1, 1, 1, 1, 1,
0.6080024, 0.5013863, 2.747131, 1, 1, 1, 1, 1,
0.6158201, -0.7896248, 2.13068, 1, 1, 1, 1, 1,
0.618578, -1.169016, 1.009028, 1, 1, 1, 1, 1,
0.6187391, 0.9015255, -0.4314373, 1, 1, 1, 1, 1,
0.6193305, -1.507619, 3.826679, 0, 0, 1, 1, 1,
0.6212148, -1.34647, 3.114245, 1, 0, 0, 1, 1,
0.6229121, 0.3867944, 1.655926, 1, 0, 0, 1, 1,
0.6240487, -0.4644566, 1.26503, 1, 0, 0, 1, 1,
0.6293285, 0.2227137, 0.8498775, 1, 0, 0, 1, 1,
0.6321599, -0.2783941, 2.521457, 1, 0, 0, 1, 1,
0.6333667, -0.4576804, 3.111268, 0, 0, 0, 1, 1,
0.6334365, 0.7019499, -0.7839683, 0, 0, 0, 1, 1,
0.639098, 1.108674, 1.286219, 0, 0, 0, 1, 1,
0.6391351, -0.3551943, 2.634087, 0, 0, 0, 1, 1,
0.6408506, -0.9816694, 2.452469, 0, 0, 0, 1, 1,
0.6413739, -1.122844, 2.871146, 0, 0, 0, 1, 1,
0.64302, -0.4090512, 1.98812, 0, 0, 0, 1, 1,
0.6468229, 0.4294577, 0.2716877, 1, 1, 1, 1, 1,
0.6543933, -1.516494, 2.508308, 1, 1, 1, 1, 1,
0.6577874, -1.424798, 4.291928, 1, 1, 1, 1, 1,
0.6602532, -1.263995, 3.283089, 1, 1, 1, 1, 1,
0.6637952, -1.31679, 1.864798, 1, 1, 1, 1, 1,
0.6639655, 0.9311682, -0.4791897, 1, 1, 1, 1, 1,
0.670653, 1.602485, 0.9165474, 1, 1, 1, 1, 1,
0.6707609, 0.3001592, 1.25277, 1, 1, 1, 1, 1,
0.6723998, 0.8926841, 1.338851, 1, 1, 1, 1, 1,
0.6748939, -0.2916051, 3.318699, 1, 1, 1, 1, 1,
0.6770204, -0.4365069, 2.532719, 1, 1, 1, 1, 1,
0.6777822, 0.8502561, 0.8316297, 1, 1, 1, 1, 1,
0.6784375, -0.7648567, 3.76913, 1, 1, 1, 1, 1,
0.6805556, -0.881223, 2.77432, 1, 1, 1, 1, 1,
0.6858654, -0.1141932, 1.656718, 1, 1, 1, 1, 1,
0.6889398, 0.7343327, 1.377744, 0, 0, 1, 1, 1,
0.693758, 0.5049253, 1.363919, 1, 0, 0, 1, 1,
0.6941468, -0.3461711, 1.761482, 1, 0, 0, 1, 1,
0.6953911, -0.5310665, 0.4153852, 1, 0, 0, 1, 1,
0.6961541, 0.1302672, -0.393966, 1, 0, 0, 1, 1,
0.7014239, 0.3638083, 2.588448, 1, 0, 0, 1, 1,
0.7072667, -1.460741, 1.487156, 0, 0, 0, 1, 1,
0.7100966, -1.218612, 1.496883, 0, 0, 0, 1, 1,
0.7125307, 2.377834, -1.28144, 0, 0, 0, 1, 1,
0.7184291, -0.934765, 2.314198, 0, 0, 0, 1, 1,
0.7244108, -1.237969, 3.573215, 0, 0, 0, 1, 1,
0.7300162, 0.9148007, 1.197157, 0, 0, 0, 1, 1,
0.7319752, -0.4426877, 2.580947, 0, 0, 0, 1, 1,
0.7361293, 0.6732463, 0.1404912, 1, 1, 1, 1, 1,
0.7372092, -1.069694, 2.508707, 1, 1, 1, 1, 1,
0.7407978, 1.677725, 0.8085035, 1, 1, 1, 1, 1,
0.7455814, 1.433909, 0.458201, 1, 1, 1, 1, 1,
0.7463902, 0.6671475, 1.071411, 1, 1, 1, 1, 1,
0.7578316, -0.8529249, 1.782894, 1, 1, 1, 1, 1,
0.7632868, -0.9551429, 2.82146, 1, 1, 1, 1, 1,
0.7634265, -0.284724, -0.2063001, 1, 1, 1, 1, 1,
0.7658889, -0.2521096, 2.135722, 1, 1, 1, 1, 1,
0.7671841, -0.9206626, 1.666532, 1, 1, 1, 1, 1,
0.7744464, 0.2794027, 2.06099, 1, 1, 1, 1, 1,
0.7786298, 1.281595, 0.5200344, 1, 1, 1, 1, 1,
0.7787008, 1.41983, -0.5380344, 1, 1, 1, 1, 1,
0.7806087, 0.615014, 3.624204, 1, 1, 1, 1, 1,
0.7835829, 0.4217351, 0.3299942, 1, 1, 1, 1, 1,
0.7843924, 0.7569575, 1.314506, 0, 0, 1, 1, 1,
0.7905143, -0.4091799, 1.327033, 1, 0, 0, 1, 1,
0.7923374, -0.3535748, 3.709929, 1, 0, 0, 1, 1,
0.7936552, -0.0009072497, 1.353419, 1, 0, 0, 1, 1,
0.7967718, -0.1600301, 2.849205, 1, 0, 0, 1, 1,
0.8001146, -2.577672, 4.197076, 1, 0, 0, 1, 1,
0.8084671, 0.4072558, 2.859979, 0, 0, 0, 1, 1,
0.80918, -0.8789915, 5.322516, 0, 0, 0, 1, 1,
0.8122398, 0.5122522, 0.1541823, 0, 0, 0, 1, 1,
0.8179487, 1.011836, -0.2193888, 0, 0, 0, 1, 1,
0.8203474, -1.263536, 2.870936, 0, 0, 0, 1, 1,
0.8263647, -0.09051639, 1.11033, 0, 0, 0, 1, 1,
0.8265072, 1.619467, 1.334053, 0, 0, 0, 1, 1,
0.8319312, -0.0527518, 0.5030501, 1, 1, 1, 1, 1,
0.8341268, 0.4317195, 1.782791, 1, 1, 1, 1, 1,
0.8355711, -0.0007592933, 1.68954, 1, 1, 1, 1, 1,
0.8396129, -0.2257884, 1.76148, 1, 1, 1, 1, 1,
0.8422795, -1.684229, 3.955272, 1, 1, 1, 1, 1,
0.8438203, -0.0767992, 1.43771, 1, 1, 1, 1, 1,
0.8440079, -0.9122431, 2.197953, 1, 1, 1, 1, 1,
0.8457407, -0.9146552, 3.454696, 1, 1, 1, 1, 1,
0.8474594, -3.177761, 2.699186, 1, 1, 1, 1, 1,
0.8499371, 0.08737556, 2.421642, 1, 1, 1, 1, 1,
0.8575737, -0.3718725, 2.224087, 1, 1, 1, 1, 1,
0.8633817, 0.2301894, 3.181185, 1, 1, 1, 1, 1,
0.8636535, -0.1017279, 2.186265, 1, 1, 1, 1, 1,
0.8649912, -0.0003422066, 2.345561, 1, 1, 1, 1, 1,
0.8655171, 0.4498357, 1.268844, 1, 1, 1, 1, 1,
0.8660254, -0.0154891, 0.9495823, 0, 0, 1, 1, 1,
0.8696478, -0.3076991, 0.4148552, 1, 0, 0, 1, 1,
0.8696806, -0.8010083, 1.816256, 1, 0, 0, 1, 1,
0.8706356, 0.1302756, 1.066782, 1, 0, 0, 1, 1,
0.8726016, -0.3995355, 1.849992, 1, 0, 0, 1, 1,
0.8735057, -0.8660154, 3.361918, 1, 0, 0, 1, 1,
0.8747957, -1.14281, 1.971729, 0, 0, 0, 1, 1,
0.8819878, 1.260638, 1.402309, 0, 0, 0, 1, 1,
0.8827592, -0.1206336, 2.504957, 0, 0, 0, 1, 1,
0.892401, -0.3525566, 0.8403862, 0, 0, 0, 1, 1,
0.8939108, 0.02535847, 3.809675, 0, 0, 0, 1, 1,
0.8968883, -0.2768725, 2.84998, 0, 0, 0, 1, 1,
0.897465, -0.08003236, 1.512054, 0, 0, 0, 1, 1,
0.8984265, 0.4748787, 1.655037, 1, 1, 1, 1, 1,
0.900989, -0.8745658, 1.572378, 1, 1, 1, 1, 1,
0.9012605, -0.07488421, 0.6366863, 1, 1, 1, 1, 1,
0.9017076, -0.4439529, 1.439241, 1, 1, 1, 1, 1,
0.9024883, -0.2846437, 3.447561, 1, 1, 1, 1, 1,
0.9045106, 0.3308089, 0.5078269, 1, 1, 1, 1, 1,
0.9062251, 0.9331712, 2.067605, 1, 1, 1, 1, 1,
0.9134834, 1.48797, -0.6309488, 1, 1, 1, 1, 1,
0.914274, -0.09268716, 1.960923, 1, 1, 1, 1, 1,
0.9174048, 1.105616, 1.723623, 1, 1, 1, 1, 1,
0.9240837, -0.3480296, 2.30452, 1, 1, 1, 1, 1,
0.9293744, 1.24428, 2.006978, 1, 1, 1, 1, 1,
0.9294507, 0.6899567, 1.661457, 1, 1, 1, 1, 1,
0.9316698, 0.6848292, 0.9387279, 1, 1, 1, 1, 1,
0.9349852, 0.2946106, 1.777484, 1, 1, 1, 1, 1,
0.9367629, 0.4806584, 2.31403, 0, 0, 1, 1, 1,
0.9542657, 1.119375, 1.541673, 1, 0, 0, 1, 1,
0.9554923, 0.05620293, 2.519032, 1, 0, 0, 1, 1,
0.9588398, -0.9479858, 1.180133, 1, 0, 0, 1, 1,
0.9589903, 2.227668, 0.4316126, 1, 0, 0, 1, 1,
0.9728776, -0.2425626, 0.7489094, 1, 0, 0, 1, 1,
0.9775164, -0.06026216, 0.5316201, 0, 0, 0, 1, 1,
0.9799449, 0.04833268, 1.329088, 0, 0, 0, 1, 1,
0.9802126, 0.6524666, 1.337421, 0, 0, 0, 1, 1,
0.9907508, 1.846318, 2.338861, 0, 0, 0, 1, 1,
0.9921423, 0.5403057, 1.808104, 0, 0, 0, 1, 1,
0.9924065, -0.8380508, 1.864575, 0, 0, 0, 1, 1,
0.9976327, 0.1041242, 1.039817, 0, 0, 0, 1, 1,
1.001999, -0.3973692, 2.376634, 1, 1, 1, 1, 1,
1.006495, -0.7233388, 1.310999, 1, 1, 1, 1, 1,
1.007207, 0.1910193, -0.2328564, 1, 1, 1, 1, 1,
1.01077, 1.256786, 0.9688758, 1, 1, 1, 1, 1,
1.011583, -2.494939, 2.840871, 1, 1, 1, 1, 1,
1.015992, 0.4746422, 0.5938276, 1, 1, 1, 1, 1,
1.017892, 0.8010145, 2.120377, 1, 1, 1, 1, 1,
1.019044, 1.159206, 1.973782, 1, 1, 1, 1, 1,
1.019764, 0.3839721, 3.657886, 1, 1, 1, 1, 1,
1.020063, 0.5674464, 0.9848638, 1, 1, 1, 1, 1,
1.023336, -1.306731, 2.316389, 1, 1, 1, 1, 1,
1.023475, 1.226933, -0.1439302, 1, 1, 1, 1, 1,
1.024242, 0.9947307, 0.4304233, 1, 1, 1, 1, 1,
1.025052, -0.4752333, 1.411215, 1, 1, 1, 1, 1,
1.026229, -0.2351174, 2.804079, 1, 1, 1, 1, 1,
1.029234, -0.2266185, 3.335065, 0, 0, 1, 1, 1,
1.029913, -1.010787, 3.426392, 1, 0, 0, 1, 1,
1.030046, 0.9344327, -0.2690117, 1, 0, 0, 1, 1,
1.034304, -1.523382, 4.609861, 1, 0, 0, 1, 1,
1.036519, 1.461446, 1.306891, 1, 0, 0, 1, 1,
1.041954, -3.331325, 3.911377, 1, 0, 0, 1, 1,
1.043258, 1.902054, 0.1094151, 0, 0, 0, 1, 1,
1.044562, -0.1055468, 1.983469, 0, 0, 0, 1, 1,
1.045459, -1.422554, 0.5949301, 0, 0, 0, 1, 1,
1.048293, -0.4035735, 0.9116119, 0, 0, 0, 1, 1,
1.052731, -0.403524, 0.1343002, 0, 0, 0, 1, 1,
1.053025, 0.763405, 0.9841244, 0, 0, 0, 1, 1,
1.057734, 2.361192, -0.7659283, 0, 0, 0, 1, 1,
1.058636, 0.4404459, -0.2021317, 1, 1, 1, 1, 1,
1.058972, 0.5036248, 0.06369341, 1, 1, 1, 1, 1,
1.059356, 0.7514974, -0.1692322, 1, 1, 1, 1, 1,
1.062565, 0.8051575, 1.19209, 1, 1, 1, 1, 1,
1.070812, -1.033248, 1.869041, 1, 1, 1, 1, 1,
1.074877, -1.128338, 2.250331, 1, 1, 1, 1, 1,
1.075247, 0.7046952, 0.860081, 1, 1, 1, 1, 1,
1.079781, 0.2395919, 0.3678722, 1, 1, 1, 1, 1,
1.081501, -0.3317669, -0.2451733, 1, 1, 1, 1, 1,
1.090251, -0.04693317, 1.960798, 1, 1, 1, 1, 1,
1.090388, -0.1895019, 1.650949, 1, 1, 1, 1, 1,
1.095426, 2.112881, 1.0909, 1, 1, 1, 1, 1,
1.099789, -0.2568302, 2.685547, 1, 1, 1, 1, 1,
1.10089, 1.201732, 2.189553, 1, 1, 1, 1, 1,
1.112003, 2.012737, 0.1935997, 1, 1, 1, 1, 1,
1.117284, -1.150026, 3.028624, 0, 0, 1, 1, 1,
1.117852, -0.2330503, 2.905652, 1, 0, 0, 1, 1,
1.117855, 0.3042399, 1.360443, 1, 0, 0, 1, 1,
1.127913, -0.6307334, 2.242686, 1, 0, 0, 1, 1,
1.128021, 0.5064941, 1.571223, 1, 0, 0, 1, 1,
1.131742, -0.3067307, 2.828727, 1, 0, 0, 1, 1,
1.142796, 0.1830208, 0.3604884, 0, 0, 0, 1, 1,
1.147345, -0.7675771, 3.397376, 0, 0, 0, 1, 1,
1.147746, -0.2354904, 2.267739, 0, 0, 0, 1, 1,
1.164392, -1.38394, 2.358167, 0, 0, 0, 1, 1,
1.17469, -0.8418742, 1.475835, 0, 0, 0, 1, 1,
1.178269, -0.5294045, -0.3295832, 0, 0, 0, 1, 1,
1.178516, -1.083356, 2.644089, 0, 0, 0, 1, 1,
1.182229, -1.628847, 2.480808, 1, 1, 1, 1, 1,
1.182471, 1.766764, 0.3819053, 1, 1, 1, 1, 1,
1.191029, -0.2225497, 2.860091, 1, 1, 1, 1, 1,
1.199163, -1.177416, 2.87025, 1, 1, 1, 1, 1,
1.203445, -1.690309, 1.756743, 1, 1, 1, 1, 1,
1.205483, 0.858323, 3.783247, 1, 1, 1, 1, 1,
1.214069, -0.1640663, 0.9547429, 1, 1, 1, 1, 1,
1.214146, -1.544909, 2.646709, 1, 1, 1, 1, 1,
1.218688, -0.8136993, 1.736435, 1, 1, 1, 1, 1,
1.219473, 0.05137157, -0.3463881, 1, 1, 1, 1, 1,
1.225777, -0.8704045, 2.471557, 1, 1, 1, 1, 1,
1.227007, 0.612619, 1.111874, 1, 1, 1, 1, 1,
1.232718, 0.7074848, 0.07745846, 1, 1, 1, 1, 1,
1.241272, 1.157162, 0.8335722, 1, 1, 1, 1, 1,
1.246854, -0.8874354, 0.5112124, 1, 1, 1, 1, 1,
1.249723, 0.4033302, 0.88547, 0, 0, 1, 1, 1,
1.259294, -0.5008897, 2.033714, 1, 0, 0, 1, 1,
1.266115, -0.6568267, 1.370842, 1, 0, 0, 1, 1,
1.26974, -0.8352314, 3.271644, 1, 0, 0, 1, 1,
1.269748, -0.454644, 1.202508, 1, 0, 0, 1, 1,
1.279109, 0.2127934, 0.9761322, 1, 0, 0, 1, 1,
1.30121, 0.8356272, 2.480328, 0, 0, 0, 1, 1,
1.303571, 0.6617044, 1.232113, 0, 0, 0, 1, 1,
1.304273, -0.7920822, 2.566717, 0, 0, 0, 1, 1,
1.320559, -1.468497, 2.685308, 0, 0, 0, 1, 1,
1.321148, 1.444961, 0.2254501, 0, 0, 0, 1, 1,
1.341587, -2.353935, 3.561531, 0, 0, 0, 1, 1,
1.342904, -0.6226538, 1.508528, 0, 0, 0, 1, 1,
1.347293, -0.6344708, 1.275165, 1, 1, 1, 1, 1,
1.350184, 1.090345, 0.9963183, 1, 1, 1, 1, 1,
1.35132, 1.159313, 0.4296682, 1, 1, 1, 1, 1,
1.361445, 1.249171, 0.8136632, 1, 1, 1, 1, 1,
1.3668, -1.776652, 2.440985, 1, 1, 1, 1, 1,
1.368094, -0.195971, 1.840509, 1, 1, 1, 1, 1,
1.368118, -0.2542002, 0.5210398, 1, 1, 1, 1, 1,
1.373294, 1.84165, 1.304433, 1, 1, 1, 1, 1,
1.373526, 0.08976244, 3.30289, 1, 1, 1, 1, 1,
1.374741, 0.9064563, 3.021962, 1, 1, 1, 1, 1,
1.381763, -0.2287248, 0.5029176, 1, 1, 1, 1, 1,
1.386367, 0.1341676, 2.731426, 1, 1, 1, 1, 1,
1.394722, -1.889114, 2.999689, 1, 1, 1, 1, 1,
1.403485, -0.9868105, 1.403841, 1, 1, 1, 1, 1,
1.404536, -0.1844199, 1.927114, 1, 1, 1, 1, 1,
1.415288, 0.4562326, 1.436473, 0, 0, 1, 1, 1,
1.416717, 0.8759147, 2.163333, 1, 0, 0, 1, 1,
1.445907, -0.3000183, 1.877321, 1, 0, 0, 1, 1,
1.44834, -0.4711815, 1.805456, 1, 0, 0, 1, 1,
1.449616, 0.8019866, 2.367841, 1, 0, 0, 1, 1,
1.468904, 1.166851, 3.365581, 1, 0, 0, 1, 1,
1.473887, -1.749772, 2.689551, 0, 0, 0, 1, 1,
1.479124, 0.1771462, 1.396483, 0, 0, 0, 1, 1,
1.480035, 1.548671, -1.250303, 0, 0, 0, 1, 1,
1.491251, 1.152143, 0.3221575, 0, 0, 0, 1, 1,
1.493319, -0.7584878, 2.766475, 0, 0, 0, 1, 1,
1.506878, 0.4299176, 2.89109, 0, 0, 0, 1, 1,
1.508483, 0.3515403, 1.333956, 0, 0, 0, 1, 1,
1.515073, 0.9570755, 1.225649, 1, 1, 1, 1, 1,
1.521502, 0.5833191, 0.4545472, 1, 1, 1, 1, 1,
1.530961, -0.7053022, 3.519912, 1, 1, 1, 1, 1,
1.536839, 1.357524, 1.697713, 1, 1, 1, 1, 1,
1.55145, 0.008892676, 2.790313, 1, 1, 1, 1, 1,
1.553829, 1.19262, 1.25094, 1, 1, 1, 1, 1,
1.55854, -0.812483, 1.693051, 1, 1, 1, 1, 1,
1.558549, -0.1903515, 1.305741, 1, 1, 1, 1, 1,
1.566547, 0.5593283, 0.8782322, 1, 1, 1, 1, 1,
1.569792, 0.7645079, 0.173691, 1, 1, 1, 1, 1,
1.583222, -0.3045765, 0.8943182, 1, 1, 1, 1, 1,
1.584043, -0.001371559, 1.870041, 1, 1, 1, 1, 1,
1.595477, -0.5140135, 2.345757, 1, 1, 1, 1, 1,
1.638334, -0.1214025, 0.01799918, 1, 1, 1, 1, 1,
1.657928, 0.9558511, 0.1176372, 1, 1, 1, 1, 1,
1.669104, -1.243838, 0.6252018, 0, 0, 1, 1, 1,
1.67181, -1.252118, 3.381594, 1, 0, 0, 1, 1,
1.68791, 0.7876633, 0.8697248, 1, 0, 0, 1, 1,
1.698801, -1.334999, 1.377126, 1, 0, 0, 1, 1,
1.702509, -0.01643993, 2.53373, 1, 0, 0, 1, 1,
1.705763, -0.3928225, 1.074482, 1, 0, 0, 1, 1,
1.711434, -0.5630695, 2.676436, 0, 0, 0, 1, 1,
1.743069, -0.4097985, 3.485759, 0, 0, 0, 1, 1,
1.744511, 0.5455971, -0.4693804, 0, 0, 0, 1, 1,
1.784613, 0.3932414, 1.196362, 0, 0, 0, 1, 1,
1.796326, 0.09194592, -0.3274572, 0, 0, 0, 1, 1,
1.807733, -0.254111, 2.100322, 0, 0, 0, 1, 1,
1.810283, -2.885998, 2.436316, 0, 0, 0, 1, 1,
1.82513, 0.4547592, 0.5633005, 1, 1, 1, 1, 1,
1.83009, -0.3865611, 2.948046, 1, 1, 1, 1, 1,
1.83055, -0.4864709, 1.850423, 1, 1, 1, 1, 1,
1.847259, 0.6124573, 0.6197146, 1, 1, 1, 1, 1,
1.847847, 0.1444841, 3.331635, 1, 1, 1, 1, 1,
1.874788, 1.589633, 1.288917, 1, 1, 1, 1, 1,
1.877435, 0.9823046, 0.5207266, 1, 1, 1, 1, 1,
1.888232, 0.3508391, 1.021835, 1, 1, 1, 1, 1,
1.906782, -0.8822046, 2.886684, 1, 1, 1, 1, 1,
1.906943, 0.9398704, 0.4756507, 1, 1, 1, 1, 1,
1.920345, -0.5846707, 3.362476, 1, 1, 1, 1, 1,
1.953995, 0.2799892, 1.272095, 1, 1, 1, 1, 1,
1.964302, 0.08011717, 2.996205, 1, 1, 1, 1, 1,
1.976407, 0.5531639, 1.980361, 1, 1, 1, 1, 1,
1.982734, 0.1501323, 1.637801, 1, 1, 1, 1, 1,
2.008119, 0.4574039, 2.569337, 0, 0, 1, 1, 1,
2.054277, 0.3283529, -0.4709613, 1, 0, 0, 1, 1,
2.063454, -1.526315, 1.092653, 1, 0, 0, 1, 1,
2.064858, 0.9487334, 1.436607, 1, 0, 0, 1, 1,
2.159703, 0.233659, 2.074127, 1, 0, 0, 1, 1,
2.169451, -0.4573576, 1.066008, 1, 0, 0, 1, 1,
2.170205, -0.3348054, 0.8558042, 0, 0, 0, 1, 1,
2.177155, -0.3573385, 1.70946, 0, 0, 0, 1, 1,
2.230023, -0.18465, 1.567486, 0, 0, 0, 1, 1,
2.237264, -0.839196, 4.034137, 0, 0, 0, 1, 1,
2.244403, -0.1227151, 0.7188734, 0, 0, 0, 1, 1,
2.269534, 0.02906571, 0.7984663, 0, 0, 0, 1, 1,
2.298815, -0.8782561, 2.9411, 0, 0, 0, 1, 1,
2.32225, 0.9259129, -0.05604322, 1, 1, 1, 1, 1,
2.384116, 0.9639235, 2.426487, 1, 1, 1, 1, 1,
2.475006, -1.94115, 1.642466, 1, 1, 1, 1, 1,
2.630847, 0.888429, -0.7183076, 1, 1, 1, 1, 1,
2.677803, -0.6386694, 0.884919, 1, 1, 1, 1, 1,
2.727701, 1.739578, 1.61102, 1, 1, 1, 1, 1,
3.385517, 0.8856286, 1.361964, 1, 1, 1, 1, 1
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
var radius = 9.860964;
var distance = 34.63622;
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
mvMatrix.translate( -0.1364317, 0.2000375, -0.1454711 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.63622);
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
