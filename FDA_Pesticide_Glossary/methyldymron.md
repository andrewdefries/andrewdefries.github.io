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
-2.749689, -0.01650441, -1.252089, 1, 0, 0, 1,
-2.747695, 0.2149927, -1.513167, 1, 0.007843138, 0, 1,
-2.561451, 0.2243678, -0.05856771, 1, 0.01176471, 0, 1,
-2.480811, -0.5747352, -1.826262, 1, 0.01960784, 0, 1,
-2.463068, -0.937856, -2.089303, 1, 0.02352941, 0, 1,
-2.462027, 1.180171, -1.57594, 1, 0.03137255, 0, 1,
-2.4467, 1.768577, -1.740623, 1, 0.03529412, 0, 1,
-2.368321, -0.03635519, -1.638887, 1, 0.04313726, 0, 1,
-2.313094, 0.8154069, -4.122244, 1, 0.04705882, 0, 1,
-2.28572, 0.3719726, 0.6880037, 1, 0.05490196, 0, 1,
-2.28459, 0.2125379, -0.6152381, 1, 0.05882353, 0, 1,
-2.273144, 1.54619, -1.103304, 1, 0.06666667, 0, 1,
-2.246903, 0.6512052, -2.317942, 1, 0.07058824, 0, 1,
-2.241373, 1.020569, 0.3191298, 1, 0.07843138, 0, 1,
-2.230785, 0.5895162, -1.957362, 1, 0.08235294, 0, 1,
-2.184626, 1.649554, -1.261465, 1, 0.09019608, 0, 1,
-2.176752, -0.5463967, -2.679166, 1, 0.09411765, 0, 1,
-2.135141, -2.281727, -1.427703, 1, 0.1019608, 0, 1,
-2.117233, -0.9540062, -1.631941, 1, 0.1098039, 0, 1,
-2.09798, -0.5628702, -3.303583, 1, 0.1137255, 0, 1,
-2.096747, 0.8360419, -0.6270027, 1, 0.1215686, 0, 1,
-2.085316, -1.383659, -0.7156692, 1, 0.1254902, 0, 1,
-2.050503, -1.175474, -3.189656, 1, 0.1333333, 0, 1,
-2.046049, 0.1021656, -1.125633, 1, 0.1372549, 0, 1,
-2.038136, 0.03164533, -2.351918, 1, 0.145098, 0, 1,
-2.017736, 1.352485, 0.1882418, 1, 0.1490196, 0, 1,
-2.015873, -0.5847914, -1.556715, 1, 0.1568628, 0, 1,
-2.010074, 0.03603753, -1.393455, 1, 0.1607843, 0, 1,
-1.999101, 0.4101951, -4.037448, 1, 0.1686275, 0, 1,
-1.977894, 0.1244509, -0.5352916, 1, 0.172549, 0, 1,
-1.961082, 0.266405, -2.208886, 1, 0.1803922, 0, 1,
-1.939914, -0.2224765, -1.620287, 1, 0.1843137, 0, 1,
-1.926549, -0.9420293, 0.2476256, 1, 0.1921569, 0, 1,
-1.874551, 0.7305703, -3.754724, 1, 0.1960784, 0, 1,
-1.864843, -0.337769, -2.142603, 1, 0.2039216, 0, 1,
-1.858875, -0.8420706, -2.090194, 1, 0.2117647, 0, 1,
-1.858405, -1.49826, -2.577725, 1, 0.2156863, 0, 1,
-1.845867, -0.4556389, -1.979775, 1, 0.2235294, 0, 1,
-1.838466, -1.592192, -2.417903, 1, 0.227451, 0, 1,
-1.837179, -1.79718, -1.24326, 1, 0.2352941, 0, 1,
-1.828732, -0.1532249, -1.660002, 1, 0.2392157, 0, 1,
-1.79081, 0.2764028, -1.593272, 1, 0.2470588, 0, 1,
-1.774944, -0.6547698, -2.31437, 1, 0.2509804, 0, 1,
-1.77121, -1.200965, -2.771691, 1, 0.2588235, 0, 1,
-1.762786, 0.7382106, -0.1925961, 1, 0.2627451, 0, 1,
-1.73954, 1.05706, -1.333681, 1, 0.2705882, 0, 1,
-1.73882, 0.07031235, -0.6219161, 1, 0.2745098, 0, 1,
-1.726596, -1.188747, -2.990491, 1, 0.282353, 0, 1,
-1.721134, 0.4315751, -1.165931, 1, 0.2862745, 0, 1,
-1.700027, -0.005462001, -2.667498, 1, 0.2941177, 0, 1,
-1.68657, -0.5409027, -2.999654, 1, 0.3019608, 0, 1,
-1.683004, -1.450706, -3.692881, 1, 0.3058824, 0, 1,
-1.672377, 0.6310717, -1.578581, 1, 0.3137255, 0, 1,
-1.661839, -0.03515152, -2.11096, 1, 0.3176471, 0, 1,
-1.633332, -0.4074731, -2.03261, 1, 0.3254902, 0, 1,
-1.629578, -0.7487866, -0.5957927, 1, 0.3294118, 0, 1,
-1.623752, -1.068549, -2.803651, 1, 0.3372549, 0, 1,
-1.619542, -0.5719323, -0.6675921, 1, 0.3411765, 0, 1,
-1.617313, -0.8303617, -3.627442, 1, 0.3490196, 0, 1,
-1.599531, 0.153956, 0.04777804, 1, 0.3529412, 0, 1,
-1.57241, -0.1054729, -2.589683, 1, 0.3607843, 0, 1,
-1.554273, 1.090861, -0.514239, 1, 0.3647059, 0, 1,
-1.541419, 0.8338786, -0.2173245, 1, 0.372549, 0, 1,
-1.53705, -1.575579, -3.318507, 1, 0.3764706, 0, 1,
-1.533388, 0.05505932, -0.6566097, 1, 0.3843137, 0, 1,
-1.532057, 0.233361, -2.554207, 1, 0.3882353, 0, 1,
-1.530096, 0.2224916, -1.92181, 1, 0.3960784, 0, 1,
-1.510597, 1.014647, -0.8996409, 1, 0.4039216, 0, 1,
-1.50798, 1.504418, -1.303565, 1, 0.4078431, 0, 1,
-1.507163, 2.095835, -0.5390009, 1, 0.4156863, 0, 1,
-1.477254, -0.914215, -0.687843, 1, 0.4196078, 0, 1,
-1.460719, 1.594519, -1.644651, 1, 0.427451, 0, 1,
-1.458671, -0.9881786, -1.373291, 1, 0.4313726, 0, 1,
-1.45528, 0.8256928, -2.25868, 1, 0.4392157, 0, 1,
-1.449972, 0.24108, -2.289202, 1, 0.4431373, 0, 1,
-1.449162, -2.066976, -3.070653, 1, 0.4509804, 0, 1,
-1.441329, -0.5949506, -2.270326, 1, 0.454902, 0, 1,
-1.438204, 0.2293521, -2.881227, 1, 0.4627451, 0, 1,
-1.43786, -0.5997193, -1.934726, 1, 0.4666667, 0, 1,
-1.435435, -1.80896, -2.22033, 1, 0.4745098, 0, 1,
-1.427046, 1.071529, -1.542941, 1, 0.4784314, 0, 1,
-1.413984, -2.134005, -2.126847, 1, 0.4862745, 0, 1,
-1.411258, 0.06091416, -1.838024, 1, 0.4901961, 0, 1,
-1.38378, 1.513831, -0.8347064, 1, 0.4980392, 0, 1,
-1.382254, -0.2012234, -2.51379, 1, 0.5058824, 0, 1,
-1.378571, 0.08931345, -3.908226, 1, 0.509804, 0, 1,
-1.376398, 0.6939898, -1.938689, 1, 0.5176471, 0, 1,
-1.374184, 0.3147102, -1.792787, 1, 0.5215687, 0, 1,
-1.373159, 0.09544583, -2.115652, 1, 0.5294118, 0, 1,
-1.37073, 0.554326, -2.27288, 1, 0.5333334, 0, 1,
-1.366721, 0.01916079, -2.734711, 1, 0.5411765, 0, 1,
-1.356835, -0.1079564, -1.119913, 1, 0.5450981, 0, 1,
-1.352325, 1.106727, 0.4150169, 1, 0.5529412, 0, 1,
-1.343324, 0.2893837, -1.264046, 1, 0.5568628, 0, 1,
-1.338262, -1.85319, -2.272162, 1, 0.5647059, 0, 1,
-1.335943, 0.2916712, -1.960603, 1, 0.5686275, 0, 1,
-1.326923, 1.752636, -0.1150424, 1, 0.5764706, 0, 1,
-1.323074, -3.168733, -3.253374, 1, 0.5803922, 0, 1,
-1.316998, 1.064505, -2.23872, 1, 0.5882353, 0, 1,
-1.314742, 0.002766709, -1.569739, 1, 0.5921569, 0, 1,
-1.312369, -0.7401708, -1.339121, 1, 0.6, 0, 1,
-1.311404, 0.4332432, -0.04139034, 1, 0.6078432, 0, 1,
-1.309186, -1.076939, -2.643576, 1, 0.6117647, 0, 1,
-1.292889, 1.241811, -0.94265, 1, 0.6196079, 0, 1,
-1.29286, 2.325948, -0.1817806, 1, 0.6235294, 0, 1,
-1.284333, 0.727798, -0.8046499, 1, 0.6313726, 0, 1,
-1.284198, 1.082111, -0.5272941, 1, 0.6352941, 0, 1,
-1.283475, -1.621249, -3.006596, 1, 0.6431373, 0, 1,
-1.282557, -0.3032959, -1.710226, 1, 0.6470588, 0, 1,
-1.280886, -0.7636654, -2.745105, 1, 0.654902, 0, 1,
-1.271819, 1.314728, -1.024524, 1, 0.6588235, 0, 1,
-1.252495, 0.5529203, -3.190544, 1, 0.6666667, 0, 1,
-1.249528, 1.098138, 0.2875838, 1, 0.6705883, 0, 1,
-1.24318, -1.385538, -3.108215, 1, 0.6784314, 0, 1,
-1.235257, -1.651503, -3.458281, 1, 0.682353, 0, 1,
-1.232708, 1.01379, -2.088536, 1, 0.6901961, 0, 1,
-1.22022, 0.6369333, -2.103076, 1, 0.6941177, 0, 1,
-1.21649, 0.3469177, -1.765728, 1, 0.7019608, 0, 1,
-1.20746, 0.8767189, 1.321393, 1, 0.7098039, 0, 1,
-1.204689, -0.07937875, -1.076687, 1, 0.7137255, 0, 1,
-1.201468, 1.130506, -1.710018, 1, 0.7215686, 0, 1,
-1.197868, 0.5926094, -1.201523, 1, 0.7254902, 0, 1,
-1.184671, 0.1679389, -0.6684739, 1, 0.7333333, 0, 1,
-1.18245, 0.04447173, -0.6078832, 1, 0.7372549, 0, 1,
-1.177404, 0.3709525, -1.876057, 1, 0.7450981, 0, 1,
-1.176348, 0.4589924, -0.310806, 1, 0.7490196, 0, 1,
-1.174747, -0.4083899, -0.697359, 1, 0.7568628, 0, 1,
-1.173678, -0.2927108, -1.112116, 1, 0.7607843, 0, 1,
-1.16862, 0.3762993, -0.08926485, 1, 0.7686275, 0, 1,
-1.16693, -0.2334659, -0.01124957, 1, 0.772549, 0, 1,
-1.165461, -1.713405, -4.17987, 1, 0.7803922, 0, 1,
-1.156935, 1.961827, -0.5522016, 1, 0.7843137, 0, 1,
-1.153851, -1.547941, -3.436437, 1, 0.7921569, 0, 1,
-1.151472, -0.4757692, -1.131614, 1, 0.7960784, 0, 1,
-1.15059, 2.16816, 0.8474068, 1, 0.8039216, 0, 1,
-1.146737, 0.353657, -0.7934171, 1, 0.8117647, 0, 1,
-1.145955, -1.367826, -1.450162, 1, 0.8156863, 0, 1,
-1.143714, 1.216292, 0.1949888, 1, 0.8235294, 0, 1,
-1.143089, 2.567896, -0.9573671, 1, 0.827451, 0, 1,
-1.13881, -0.4468037, -2.56196, 1, 0.8352941, 0, 1,
-1.136715, 0.775933, -1.840955, 1, 0.8392157, 0, 1,
-1.116131, -0.6726996, -1.340983, 1, 0.8470588, 0, 1,
-1.115214, 1.207706, -1.124729, 1, 0.8509804, 0, 1,
-1.114379, -0.1283885, -2.543005, 1, 0.8588235, 0, 1,
-1.107346, -0.04074207, -0.0391972, 1, 0.8627451, 0, 1,
-1.105866, -1.063111, -0.9433877, 1, 0.8705882, 0, 1,
-1.104308, 0.07238018, 0.4067348, 1, 0.8745098, 0, 1,
-1.0959, -0.2378889, -0.2265973, 1, 0.8823529, 0, 1,
-1.095506, 1.278807, -0.7647623, 1, 0.8862745, 0, 1,
-1.090539, -0.7922681, -0.03607621, 1, 0.8941177, 0, 1,
-1.090379, -1.677457, -1.538798, 1, 0.8980392, 0, 1,
-1.089836, 2.051224, 0.9754604, 1, 0.9058824, 0, 1,
-1.08843, -0.05185629, -0.03808184, 1, 0.9137255, 0, 1,
-1.088256, 1.313408, -1.563367, 1, 0.9176471, 0, 1,
-1.077464, 0.880615, -1.183381, 1, 0.9254902, 0, 1,
-1.075984, -0.2729149, -2.474457, 1, 0.9294118, 0, 1,
-1.074786, -0.7040079, -1.422047, 1, 0.9372549, 0, 1,
-1.072488, 0.3684799, -2.661194, 1, 0.9411765, 0, 1,
-1.063182, -0.4216796, -3.151767, 1, 0.9490196, 0, 1,
-1.060634, -0.6109333, 0.3372351, 1, 0.9529412, 0, 1,
-1.057865, 0.2382741, -1.331702, 1, 0.9607843, 0, 1,
-1.055385, -1.109786, -1.576679, 1, 0.9647059, 0, 1,
-1.045196, -0.4345775, -3.853996, 1, 0.972549, 0, 1,
-1.043438, -0.9778869, -3.422194, 1, 0.9764706, 0, 1,
-1.03478, 1.402848, -2.328642, 1, 0.9843137, 0, 1,
-1.032779, 0.7642108, -1.567626, 1, 0.9882353, 0, 1,
-1.027792, -0.7699894, -2.730178, 1, 0.9960784, 0, 1,
-1.021155, -1.499753, -2.299924, 0.9960784, 1, 0, 1,
-1.013243, 0.01923138, -2.264359, 0.9921569, 1, 0, 1,
-1.001319, -0.7526821, -2.354019, 0.9843137, 1, 0, 1,
-0.9990349, -0.8160641, -1.33814, 0.9803922, 1, 0, 1,
-0.9905317, 0.6880901, -2.3416, 0.972549, 1, 0, 1,
-0.989509, 0.8732343, -1.234651, 0.9686275, 1, 0, 1,
-0.9763417, -1.52827, -2.793902, 0.9607843, 1, 0, 1,
-0.9629331, 0.6848903, 0.7155894, 0.9568627, 1, 0, 1,
-0.9615923, 1.219324, -2.202892, 0.9490196, 1, 0, 1,
-0.9606479, 1.287217, 0.4960718, 0.945098, 1, 0, 1,
-0.9557395, -1.163098, -2.567562, 0.9372549, 1, 0, 1,
-0.9518824, -1.205244, -0.6179062, 0.9333333, 1, 0, 1,
-0.9446878, -1.700308, -3.835361, 0.9254902, 1, 0, 1,
-0.9441747, 0.2499204, -1.877505, 0.9215686, 1, 0, 1,
-0.9426358, 0.9190248, -0.1912004, 0.9137255, 1, 0, 1,
-0.9396308, -1.560324, -3.687439, 0.9098039, 1, 0, 1,
-0.9375331, -0.739843, -2.346433, 0.9019608, 1, 0, 1,
-0.9361651, 0.7291746, -1.19547, 0.8941177, 1, 0, 1,
-0.9333486, -1.07461, -3.086988, 0.8901961, 1, 0, 1,
-0.931898, 1.096582, 0.1127799, 0.8823529, 1, 0, 1,
-0.929327, -0.4936144, -2.187, 0.8784314, 1, 0, 1,
-0.9283147, -0.6254675, -2.511682, 0.8705882, 1, 0, 1,
-0.9190506, 0.02714166, -0.1025762, 0.8666667, 1, 0, 1,
-0.9184517, -0.4299824, -2.326441, 0.8588235, 1, 0, 1,
-0.917403, -1.116922, -4.249374, 0.854902, 1, 0, 1,
-0.9131368, -0.3073098, -0.7654497, 0.8470588, 1, 0, 1,
-0.9125305, 1.474802, 1.149841, 0.8431373, 1, 0, 1,
-0.9117552, 1.12919, -1.137203, 0.8352941, 1, 0, 1,
-0.9016047, -0.05526601, -1.202139, 0.8313726, 1, 0, 1,
-0.9014585, 0.4738671, -1.25202, 0.8235294, 1, 0, 1,
-0.8958985, -0.02784628, -0.1166665, 0.8196079, 1, 0, 1,
-0.8841361, -0.5791378, -2.741622, 0.8117647, 1, 0, 1,
-0.8830795, 0.7622898, 1.650243, 0.8078431, 1, 0, 1,
-0.8811854, -0.2571453, -0.7730591, 0.8, 1, 0, 1,
-0.8809053, 0.1690879, -2.292103, 0.7921569, 1, 0, 1,
-0.8799783, -0.6802018, -4.304478, 0.7882353, 1, 0, 1,
-0.8707398, -0.4520836, -2.131181, 0.7803922, 1, 0, 1,
-0.8699554, -0.2507041, -0.9277138, 0.7764706, 1, 0, 1,
-0.8600557, 1.260523, -1.54053, 0.7686275, 1, 0, 1,
-0.85647, 1.231859, -1.44802, 0.7647059, 1, 0, 1,
-0.8430848, 0.3974728, -0.7646738, 0.7568628, 1, 0, 1,
-0.8412193, -0.7708904, -2.613544, 0.7529412, 1, 0, 1,
-0.8378, -0.9520446, -2.312516, 0.7450981, 1, 0, 1,
-0.8367382, -0.191148, -1.361024, 0.7411765, 1, 0, 1,
-0.8352978, 0.4322118, -1.849654, 0.7333333, 1, 0, 1,
-0.8337508, 1.0676, -0.559199, 0.7294118, 1, 0, 1,
-0.8242508, -0.7585508, -2.61074, 0.7215686, 1, 0, 1,
-0.8220202, 1.109917, -0.303613, 0.7176471, 1, 0, 1,
-0.8197427, -0.35601, -0.9289517, 0.7098039, 1, 0, 1,
-0.8194553, -0.1786668, 0.003423049, 0.7058824, 1, 0, 1,
-0.8083786, 0.6000752, -0.576196, 0.6980392, 1, 0, 1,
-0.8082591, 0.5625894, 0.2288515, 0.6901961, 1, 0, 1,
-0.801042, -0.08790833, -1.090291, 0.6862745, 1, 0, 1,
-0.7987139, 0.7589208, -1.578009, 0.6784314, 1, 0, 1,
-0.7980582, -1.025, -1.588676, 0.6745098, 1, 0, 1,
-0.7963066, -2.209263, -0.9904964, 0.6666667, 1, 0, 1,
-0.7859329, -0.09449658, -1.83988, 0.6627451, 1, 0, 1,
-0.7790477, 0.03500968, -1.283069, 0.654902, 1, 0, 1,
-0.7789537, 0.8501944, -1.320589, 0.6509804, 1, 0, 1,
-0.7773923, -1.375347, -4.289253, 0.6431373, 1, 0, 1,
-0.7769037, -0.330622, -1.639646, 0.6392157, 1, 0, 1,
-0.776132, 0.547043, -1.925446, 0.6313726, 1, 0, 1,
-0.7669535, 0.4690993, 0.8731382, 0.627451, 1, 0, 1,
-0.7595928, 0.08730788, -0.4594493, 0.6196079, 1, 0, 1,
-0.7589263, -2.137273, -1.106721, 0.6156863, 1, 0, 1,
-0.7550389, 0.2071907, 0.01390861, 0.6078432, 1, 0, 1,
-0.7450331, -0.7900589, -1.034102, 0.6039216, 1, 0, 1,
-0.7370312, 1.03466, -0.6017295, 0.5960785, 1, 0, 1,
-0.7357559, 0.1974833, -1.739974, 0.5882353, 1, 0, 1,
-0.7264786, 0.3843276, -3.086046, 0.5843138, 1, 0, 1,
-0.7224481, 1.048432, 0.5022887, 0.5764706, 1, 0, 1,
-0.711057, -0.2126652, -1.372195, 0.572549, 1, 0, 1,
-0.7109004, 0.6312771, -1.461623, 0.5647059, 1, 0, 1,
-0.7061404, 0.5099629, 0.5069017, 0.5607843, 1, 0, 1,
-0.7016019, 0.9703854, -1.353166, 0.5529412, 1, 0, 1,
-0.6932785, -0.2961586, -1.645026, 0.5490196, 1, 0, 1,
-0.6928418, 0.1520507, -1.123115, 0.5411765, 1, 0, 1,
-0.6918316, -0.003181687, -0.4163295, 0.5372549, 1, 0, 1,
-0.6860805, -1.910004, -1.944311, 0.5294118, 1, 0, 1,
-0.6767318, -0.09547254, -1.789402, 0.5254902, 1, 0, 1,
-0.6747872, 0.4068349, -1.716892, 0.5176471, 1, 0, 1,
-0.6746468, -0.8906389, -3.074966, 0.5137255, 1, 0, 1,
-0.674322, 0.2854299, -1.922356, 0.5058824, 1, 0, 1,
-0.6707727, -1.181642, -3.674673, 0.5019608, 1, 0, 1,
-0.6703799, 1.207387, -0.6119958, 0.4941176, 1, 0, 1,
-0.6578143, 1.590934, -1.018356, 0.4862745, 1, 0, 1,
-0.6569348, -0.1939397, -1.787472, 0.4823529, 1, 0, 1,
-0.6544676, -1.403178, -3.114239, 0.4745098, 1, 0, 1,
-0.6534402, 0.4386183, -1.077518, 0.4705882, 1, 0, 1,
-0.6449674, 0.433591, 0.07694876, 0.4627451, 1, 0, 1,
-0.6376397, -0.4777602, -1.422051, 0.4588235, 1, 0, 1,
-0.6286036, -0.9368575, -4.508455, 0.4509804, 1, 0, 1,
-0.6268248, -2.820336, -2.80856, 0.4470588, 1, 0, 1,
-0.6263853, -1.028941, -2.925371, 0.4392157, 1, 0, 1,
-0.6260319, -0.4937721, -1.196552, 0.4352941, 1, 0, 1,
-0.6225499, -1.058008, -2.408677, 0.427451, 1, 0, 1,
-0.6151892, -0.2799169, -0.9531043, 0.4235294, 1, 0, 1,
-0.6129404, -0.1854287, -2.708383, 0.4156863, 1, 0, 1,
-0.6110577, 0.583334, -1.456933, 0.4117647, 1, 0, 1,
-0.6083777, -0.454539, -4.229417, 0.4039216, 1, 0, 1,
-0.6075358, 0.3286636, 0.1224263, 0.3960784, 1, 0, 1,
-0.6074424, -1.099241, -3.345287, 0.3921569, 1, 0, 1,
-0.60529, -0.8361123, -3.243316, 0.3843137, 1, 0, 1,
-0.6023211, 0.3043654, -1.086043, 0.3803922, 1, 0, 1,
-0.6017249, 0.2998801, -3.251649, 0.372549, 1, 0, 1,
-0.5959794, -0.5469261, -1.911608, 0.3686275, 1, 0, 1,
-0.5941112, -1.039158, -2.682854, 0.3607843, 1, 0, 1,
-0.5932976, 0.2404232, -0.9491597, 0.3568628, 1, 0, 1,
-0.5902788, 2.337266, -0.7736884, 0.3490196, 1, 0, 1,
-0.5880496, 0.05311506, -1.678328, 0.345098, 1, 0, 1,
-0.5856347, -0.5058469, -2.937459, 0.3372549, 1, 0, 1,
-0.5848449, -1.415485, -3.307105, 0.3333333, 1, 0, 1,
-0.5824653, -0.8835304, -4.981535, 0.3254902, 1, 0, 1,
-0.5815957, 0.09087959, -0.5230187, 0.3215686, 1, 0, 1,
-0.5805168, -1.448875, -3.378051, 0.3137255, 1, 0, 1,
-0.5741266, 0.01719237, -1.724357, 0.3098039, 1, 0, 1,
-0.5711364, -1.785836, -1.969944, 0.3019608, 1, 0, 1,
-0.5706814, -0.3305486, -1.843313, 0.2941177, 1, 0, 1,
-0.5700512, 0.2102195, -2.360989, 0.2901961, 1, 0, 1,
-0.5691187, 0.8185822, 0.4436941, 0.282353, 1, 0, 1,
-0.5646099, -0.5155942, -0.657902, 0.2784314, 1, 0, 1,
-0.5634605, -0.4064283, -1.780049, 0.2705882, 1, 0, 1,
-0.5627547, 1.030921, -0.4839024, 0.2666667, 1, 0, 1,
-0.5557789, 0.6212717, -1.860231, 0.2588235, 1, 0, 1,
-0.5549585, 1.323237, 0.6780396, 0.254902, 1, 0, 1,
-0.5520864, -1.154153, -2.546767, 0.2470588, 1, 0, 1,
-0.5514217, 0.6196277, 0.7403303, 0.2431373, 1, 0, 1,
-0.5505475, -1.962557, -2.272188, 0.2352941, 1, 0, 1,
-0.5490364, 0.1092943, -1.826888, 0.2313726, 1, 0, 1,
-0.5486723, -0.2643929, -0.732951, 0.2235294, 1, 0, 1,
-0.5458456, -0.1194298, -1.415327, 0.2196078, 1, 0, 1,
-0.5445146, 0.7234126, -1.155964, 0.2117647, 1, 0, 1,
-0.5393069, -0.7807728, -3.8144, 0.2078431, 1, 0, 1,
-0.5359048, 0.02846819, -0.5678797, 0.2, 1, 0, 1,
-0.5317612, 1.429241, -1.694881, 0.1921569, 1, 0, 1,
-0.5223667, 0.8551587, -1.111459, 0.1882353, 1, 0, 1,
-0.5206449, -0.5727142, -1.385357, 0.1803922, 1, 0, 1,
-0.5143253, -0.1941189, -1.311442, 0.1764706, 1, 0, 1,
-0.5119761, 0.5642645, -2.123853, 0.1686275, 1, 0, 1,
-0.5104884, -0.003915337, -0.4990233, 0.1647059, 1, 0, 1,
-0.5056502, 0.3566292, -1.498817, 0.1568628, 1, 0, 1,
-0.5025491, 0.5554168, -1.642027, 0.1529412, 1, 0, 1,
-0.5009487, 0.3208627, -1.068941, 0.145098, 1, 0, 1,
-0.5002394, 0.4201067, -0.9917625, 0.1411765, 1, 0, 1,
-0.4989388, -1.283249, -3.483635, 0.1333333, 1, 0, 1,
-0.4966045, -0.521715, -3.698771, 0.1294118, 1, 0, 1,
-0.4954583, 1.63631, 0.4878659, 0.1215686, 1, 0, 1,
-0.4903046, -2.463037, -2.722175, 0.1176471, 1, 0, 1,
-0.4874183, -1.093682, -3.286454, 0.1098039, 1, 0, 1,
-0.4867091, -0.8483738, -3.97432, 0.1058824, 1, 0, 1,
-0.4844552, -0.2476044, -1.678328, 0.09803922, 1, 0, 1,
-0.4813971, 0.1339169, -2.274078, 0.09019608, 1, 0, 1,
-0.4805468, 0.4731377, -2.613104, 0.08627451, 1, 0, 1,
-0.4798691, 0.9921491, 0.3803469, 0.07843138, 1, 0, 1,
-0.476671, 0.6777928, 0.1112621, 0.07450981, 1, 0, 1,
-0.476156, 1.002391, -2.925221, 0.06666667, 1, 0, 1,
-0.4715333, 0.1971691, -0.3266902, 0.0627451, 1, 0, 1,
-0.4642575, -1.771006, -3.236388, 0.05490196, 1, 0, 1,
-0.4528352, -1.046528, -3.282318, 0.05098039, 1, 0, 1,
-0.4521277, -1.443001, -3.597578, 0.04313726, 1, 0, 1,
-0.4515418, -0.02167312, -1.749342, 0.03921569, 1, 0, 1,
-0.4478486, 1.33715, 1.480111, 0.03137255, 1, 0, 1,
-0.4444568, 0.5916322, -0.4471475, 0.02745098, 1, 0, 1,
-0.4415696, 0.2760381, -1.181645, 0.01960784, 1, 0, 1,
-0.4395073, 0.8960595, -1.616384, 0.01568628, 1, 0, 1,
-0.4345119, -0.02375517, 0.0503975, 0.007843138, 1, 0, 1,
-0.4321111, 0.6746995, -0.2672721, 0.003921569, 1, 0, 1,
-0.4305496, 0.0003231654, -1.521476, 0, 1, 0.003921569, 1,
-0.426504, 0.1980331, -0.8810623, 0, 1, 0.01176471, 1,
-0.4260977, -1.017322, -2.299244, 0, 1, 0.01568628, 1,
-0.4180476, -0.2055836, -1.257614, 0, 1, 0.02352941, 1,
-0.415823, 0.6485566, -1.522997, 0, 1, 0.02745098, 1,
-0.4147313, 0.4510938, -1.284064, 0, 1, 0.03529412, 1,
-0.4136432, 1.059446, -0.51463, 0, 1, 0.03921569, 1,
-0.4098234, -0.2836324, -1.418265, 0, 1, 0.04705882, 1,
-0.409705, -1.017051, -3.181933, 0, 1, 0.05098039, 1,
-0.4091305, 1.467921, -0.08858261, 0, 1, 0.05882353, 1,
-0.4069454, -0.7908556, -4.472075, 0, 1, 0.0627451, 1,
-0.4033881, -0.459923, -2.955684, 0, 1, 0.07058824, 1,
-0.3991145, -0.9956041, -2.66415, 0, 1, 0.07450981, 1,
-0.3983427, -0.5514083, -2.565946, 0, 1, 0.08235294, 1,
-0.3973467, -0.3809918, -1.977845, 0, 1, 0.08627451, 1,
-0.3930071, -0.3379544, -2.904186, 0, 1, 0.09411765, 1,
-0.3866025, -1.329749, -2.420891, 0, 1, 0.1019608, 1,
-0.3827482, 0.3209989, 0.898979, 0, 1, 0.1058824, 1,
-0.3799903, -0.1420995, -3.216001, 0, 1, 0.1137255, 1,
-0.3797868, -1.640596, -2.283422, 0, 1, 0.1176471, 1,
-0.3795575, 1.003273, 0.02150431, 0, 1, 0.1254902, 1,
-0.3777013, 0.3109985, -0.2008716, 0, 1, 0.1294118, 1,
-0.3776624, -2.430986, -2.474815, 0, 1, 0.1372549, 1,
-0.3754945, 1.347012, -0.5913622, 0, 1, 0.1411765, 1,
-0.3672559, -2.094364, -3.219871, 0, 1, 0.1490196, 1,
-0.3641436, -1.861755, -1.946639, 0, 1, 0.1529412, 1,
-0.3635942, -0.2860612, -1.07088, 0, 1, 0.1607843, 1,
-0.3626953, 2.70443, 0.2917305, 0, 1, 0.1647059, 1,
-0.3567944, -1.102456, -3.459946, 0, 1, 0.172549, 1,
-0.356636, -0.1595779, 0.06763181, 0, 1, 0.1764706, 1,
-0.3555317, -0.7925139, -3.344328, 0, 1, 0.1843137, 1,
-0.3550378, 0.8779544, -0.216474, 0, 1, 0.1882353, 1,
-0.352772, -0.3457215, -2.602675, 0, 1, 0.1960784, 1,
-0.3406957, 0.6452749, -1.115577, 0, 1, 0.2039216, 1,
-0.3396404, -0.4252266, -3.422874, 0, 1, 0.2078431, 1,
-0.3394652, -0.1662986, -2.078904, 0, 1, 0.2156863, 1,
-0.338565, 1.955939, 1.428806, 0, 1, 0.2196078, 1,
-0.326744, -0.6370219, -3.517794, 0, 1, 0.227451, 1,
-0.3238821, -0.1465331, -2.066875, 0, 1, 0.2313726, 1,
-0.3201108, -0.07691196, 0.1957842, 0, 1, 0.2392157, 1,
-0.3187332, 0.5432269, -0.4845945, 0, 1, 0.2431373, 1,
-0.3139657, -0.1044699, -0.6669635, 0, 1, 0.2509804, 1,
-0.3135635, 0.09204889, -2.414846, 0, 1, 0.254902, 1,
-0.3028007, -1.529929, -3.267909, 0, 1, 0.2627451, 1,
-0.2990347, -0.5978557, -3.003352, 0, 1, 0.2666667, 1,
-0.2908327, -0.9839669, -3.278484, 0, 1, 0.2745098, 1,
-0.2876797, -0.4922991, -2.451231, 0, 1, 0.2784314, 1,
-0.2875486, 0.4551795, -2.331867, 0, 1, 0.2862745, 1,
-0.2811729, -0.8143664, -4.837851, 0, 1, 0.2901961, 1,
-0.2690945, -1.233135, -2.567328, 0, 1, 0.2980392, 1,
-0.2680825, 0.3307883, -0.928884, 0, 1, 0.3058824, 1,
-0.2678104, 0.6375335, -0.2876665, 0, 1, 0.3098039, 1,
-0.2610576, 1.618468, -0.06967156, 0, 1, 0.3176471, 1,
-0.2581276, 0.501804, -0.4301808, 0, 1, 0.3215686, 1,
-0.2565835, -0.01388099, -1.572701, 0, 1, 0.3294118, 1,
-0.2560407, 1.199413, 0.1558058, 0, 1, 0.3333333, 1,
-0.251883, -0.8830895, -3.157269, 0, 1, 0.3411765, 1,
-0.249905, 0.3732387, 0.3154643, 0, 1, 0.345098, 1,
-0.2498549, 0.6612673, -2.621839, 0, 1, 0.3529412, 1,
-0.2372015, 0.8197192, -0.5655519, 0, 1, 0.3568628, 1,
-0.2362616, 0.08697953, -1.165322, 0, 1, 0.3647059, 1,
-0.2346077, -1.339537, -3.677991, 0, 1, 0.3686275, 1,
-0.2340752, 0.7061642, -0.4825445, 0, 1, 0.3764706, 1,
-0.2336714, 2.063772, 0.00517013, 0, 1, 0.3803922, 1,
-0.2312334, 1.308696, -0.1958075, 0, 1, 0.3882353, 1,
-0.2296697, -0.7194182, -1.097893, 0, 1, 0.3921569, 1,
-0.2278524, -1.150676, -3.606675, 0, 1, 0.4, 1,
-0.2261911, -0.213357, -1.641448, 0, 1, 0.4078431, 1,
-0.2259807, 1.321615, -0.2233724, 0, 1, 0.4117647, 1,
-0.2223274, 1.746973, -0.005328284, 0, 1, 0.4196078, 1,
-0.2219961, 0.3798046, -0.7542614, 0, 1, 0.4235294, 1,
-0.22059, -1.243162, -1.915549, 0, 1, 0.4313726, 1,
-0.2190543, 0.1022947, -1.259268, 0, 1, 0.4352941, 1,
-0.2174774, 1.351252, 0.6216631, 0, 1, 0.4431373, 1,
-0.2168859, -0.5268087, -4.181436, 0, 1, 0.4470588, 1,
-0.2126241, -0.9265199, -3.282862, 0, 1, 0.454902, 1,
-0.2125517, 0.3036192, -1.135949, 0, 1, 0.4588235, 1,
-0.2106112, -0.1426134, -1.18597, 0, 1, 0.4666667, 1,
-0.2048216, -1.106396, -2.584358, 0, 1, 0.4705882, 1,
-0.2041885, 0.4501104, -0.3392698, 0, 1, 0.4784314, 1,
-0.2028928, 1.024031, -0.5580537, 0, 1, 0.4823529, 1,
-0.202669, -2.732515, -4.52059, 0, 1, 0.4901961, 1,
-0.1975373, 0.9745994, -1.149781, 0, 1, 0.4941176, 1,
-0.190898, -0.4117663, -3.640375, 0, 1, 0.5019608, 1,
-0.1899692, 0.8854854, -0.230528, 0, 1, 0.509804, 1,
-0.1868143, -1.12378, -3.77537, 0, 1, 0.5137255, 1,
-0.1851966, -0.8000752, -3.357399, 0, 1, 0.5215687, 1,
-0.1833124, 0.5239814, -0.9063472, 0, 1, 0.5254902, 1,
-0.1813586, -0.2167286, -3.79514, 0, 1, 0.5333334, 1,
-0.1751746, -1.708229, -3.288172, 0, 1, 0.5372549, 1,
-0.169654, -0.5499466, -3.733584, 0, 1, 0.5450981, 1,
-0.1671924, -1.243, -3.669155, 0, 1, 0.5490196, 1,
-0.1624962, -0.7752425, -2.834695, 0, 1, 0.5568628, 1,
-0.1615219, 0.9205566, -0.07828569, 0, 1, 0.5607843, 1,
-0.1602381, -0.2107094, -2.038714, 0, 1, 0.5686275, 1,
-0.1600779, 0.03898516, -1.382292, 0, 1, 0.572549, 1,
-0.1598439, 0.2755596, -0.2627305, 0, 1, 0.5803922, 1,
-0.1558602, -1.121311, -5.070745, 0, 1, 0.5843138, 1,
-0.1547479, 0.5710616, 0.3637159, 0, 1, 0.5921569, 1,
-0.1518077, 1.795602, -1.572534, 0, 1, 0.5960785, 1,
-0.150001, 0.5894802, -0.04942619, 0, 1, 0.6039216, 1,
-0.1491803, 0.6229942, -0.2801869, 0, 1, 0.6117647, 1,
-0.1469171, -1.575792, -4.332643, 0, 1, 0.6156863, 1,
-0.1452922, 0.512352, 0.4382527, 0, 1, 0.6235294, 1,
-0.1430155, -0.07831125, -0.3167838, 0, 1, 0.627451, 1,
-0.1408768, -0.2396324, -0.5911317, 0, 1, 0.6352941, 1,
-0.1378983, -1.468054, -3.99746, 0, 1, 0.6392157, 1,
-0.1349421, -1.39961, -3.875444, 0, 1, 0.6470588, 1,
-0.1319233, 0.8971965, 0.9257661, 0, 1, 0.6509804, 1,
-0.124809, -0.5064825, -3.79809, 0, 1, 0.6588235, 1,
-0.121718, 0.3927633, 0.3989765, 0, 1, 0.6627451, 1,
-0.1197773, -0.2729704, -3.397418, 0, 1, 0.6705883, 1,
-0.1190562, 0.02362987, -1.146791, 0, 1, 0.6745098, 1,
-0.1167917, 0.6174707, 0.4544152, 0, 1, 0.682353, 1,
-0.1154548, -0.5569175, -2.009072, 0, 1, 0.6862745, 1,
-0.1101561, -0.9436816, -3.097067, 0, 1, 0.6941177, 1,
-0.1093412, 0.7983474, -0.4489212, 0, 1, 0.7019608, 1,
-0.1050255, -1.075569, -1.472113, 0, 1, 0.7058824, 1,
-0.1025414, -1.656053, -3.351486, 0, 1, 0.7137255, 1,
-0.1023216, -2.067688, -1.730305, 0, 1, 0.7176471, 1,
-0.1005191, 2.688901, -1.114093, 0, 1, 0.7254902, 1,
-0.09801367, 1.644883, -1.599326, 0, 1, 0.7294118, 1,
-0.08981922, -0.6192141, -1.838923, 0, 1, 0.7372549, 1,
-0.08481478, -0.4772459, -1.860803, 0, 1, 0.7411765, 1,
-0.08347131, -0.4462863, -1.692516, 0, 1, 0.7490196, 1,
-0.08150817, -0.7075463, -3.187867, 0, 1, 0.7529412, 1,
-0.075631, 0.3752112, -2.309952, 0, 1, 0.7607843, 1,
-0.07392094, -1.873081, -2.23913, 0, 1, 0.7647059, 1,
-0.07089502, -0.1930962, -1.412636, 0, 1, 0.772549, 1,
-0.07035437, 0.05662172, -1.022963, 0, 1, 0.7764706, 1,
-0.06850043, -0.02077825, -2.319707, 0, 1, 0.7843137, 1,
-0.06794894, -1.824363, -2.658398, 0, 1, 0.7882353, 1,
-0.06336465, -0.1013338, -3.765171, 0, 1, 0.7960784, 1,
-0.06300072, 1.897982, 0.2846819, 0, 1, 0.8039216, 1,
-0.06267926, -1.147782, -3.725514, 0, 1, 0.8078431, 1,
-0.06250995, 0.1453446, -1.194425, 0, 1, 0.8156863, 1,
-0.05795045, 0.377045, 1.149749, 0, 1, 0.8196079, 1,
-0.05688142, -0.4864787, -2.256497, 0, 1, 0.827451, 1,
-0.05671563, -1.064625, -4.467336, 0, 1, 0.8313726, 1,
-0.05414262, 0.2236134, -1.380951, 0, 1, 0.8392157, 1,
-0.05195554, -1.004775, -1.841906, 0, 1, 0.8431373, 1,
-0.04888652, 0.04202948, 0.8513986, 0, 1, 0.8509804, 1,
-0.0450165, -1.441065, -4.558775, 0, 1, 0.854902, 1,
-0.04422851, -0.06942382, -2.13224, 0, 1, 0.8627451, 1,
-0.04148551, 0.8992838, 0.4517396, 0, 1, 0.8666667, 1,
-0.03751834, 1.267197, -0.459748, 0, 1, 0.8745098, 1,
-0.03707204, -2.060881, -3.094026, 0, 1, 0.8784314, 1,
-0.0293211, -0.602017, -3.544341, 0, 1, 0.8862745, 1,
-0.02677037, -0.1071059, -4.831352, 0, 1, 0.8901961, 1,
-0.02606901, 0.1848773, -0.536793, 0, 1, 0.8980392, 1,
-0.02521419, -0.7058336, -3.926323, 0, 1, 0.9058824, 1,
-0.02270955, -0.3704544, -2.355067, 0, 1, 0.9098039, 1,
-0.01901111, -0.1404508, -1.337948, 0, 1, 0.9176471, 1,
-0.01882264, -1.692692, -3.328196, 0, 1, 0.9215686, 1,
-0.01593199, -0.3826984, -2.556979, 0, 1, 0.9294118, 1,
-0.01562216, -0.1053818, -4.48451, 0, 1, 0.9333333, 1,
-0.01316918, 0.5741951, -0.5465112, 0, 1, 0.9411765, 1,
-0.01220385, -1.470402, -4.010757, 0, 1, 0.945098, 1,
-0.0103181, 0.4145121, -0.1637792, 0, 1, 0.9529412, 1,
-0.01014414, -0.5404714, -4.203964, 0, 1, 0.9568627, 1,
-0.008567242, -0.9697397, -4.961538, 0, 1, 0.9647059, 1,
-0.007751802, -0.3977582, -4.548507, 0, 1, 0.9686275, 1,
-0.003994564, 0.4417052, 1.06128, 0, 1, 0.9764706, 1,
-0.001327107, 0.4310768, -1.046273, 0, 1, 0.9803922, 1,
0.003236083, -0.330031, 2.627298, 0, 1, 0.9882353, 1,
0.008613864, -0.6113922, 3.420406, 0, 1, 0.9921569, 1,
0.009289353, -0.7701095, 3.388182, 0, 1, 1, 1,
0.009479899, -1.348146, 3.124259, 0, 0.9921569, 1, 1,
0.01059628, 0.4141265, 0.5610098, 0, 0.9882353, 1, 1,
0.02262135, 0.6432884, -0.7091833, 0, 0.9803922, 1, 1,
0.02530939, 1.043256, -0.8761691, 0, 0.9764706, 1, 1,
0.02960918, 0.5694507, -3.104231, 0, 0.9686275, 1, 1,
0.03869982, -1.082197, 2.983684, 0, 0.9647059, 1, 1,
0.04498058, -0.5727061, 3.784626, 0, 0.9568627, 1, 1,
0.04513716, 1.041931, -0.4579935, 0, 0.9529412, 1, 1,
0.04521441, -2.473797, 3.751523, 0, 0.945098, 1, 1,
0.04886404, -1.042896, 1.414775, 0, 0.9411765, 1, 1,
0.04996761, -0.7213132, 2.196935, 0, 0.9333333, 1, 1,
0.05016144, -0.4432516, 5.3007, 0, 0.9294118, 1, 1,
0.05283862, -0.9949927, 1.857725, 0, 0.9215686, 1, 1,
0.05384278, -1.836908, 3.558384, 0, 0.9176471, 1, 1,
0.06497291, -0.2440373, 4.672374, 0, 0.9098039, 1, 1,
0.06531706, 1.315264, -0.2487552, 0, 0.9058824, 1, 1,
0.06700067, -0.7427164, 3.110023, 0, 0.8980392, 1, 1,
0.06794167, -0.3664288, 3.648979, 0, 0.8901961, 1, 1,
0.07260065, -1.058294, 1.93462, 0, 0.8862745, 1, 1,
0.07522145, 1.18516, -0.908347, 0, 0.8784314, 1, 1,
0.08298984, 0.1452542, 0.2051431, 0, 0.8745098, 1, 1,
0.08948074, -0.7249686, 4.734817, 0, 0.8666667, 1, 1,
0.09089258, 0.6958174, 0.6298493, 0, 0.8627451, 1, 1,
0.09182356, 1.52756, 1.32304, 0, 0.854902, 1, 1,
0.09580296, -0.1989075, 3.043081, 0, 0.8509804, 1, 1,
0.09611338, -0.3327948, 1.725453, 0, 0.8431373, 1, 1,
0.09681375, 0.3982841, 0.7184785, 0, 0.8392157, 1, 1,
0.1001392, 0.5475454, 1.620412, 0, 0.8313726, 1, 1,
0.1013486, -0.7608249, 1.458878, 0, 0.827451, 1, 1,
0.1079702, 0.6932254, 0.3658154, 0, 0.8196079, 1, 1,
0.1082307, -0.02298536, 0.1233824, 0, 0.8156863, 1, 1,
0.1105298, -1.171451, 1.753245, 0, 0.8078431, 1, 1,
0.1109716, -1.275726, 3.180352, 0, 0.8039216, 1, 1,
0.1115207, 0.6964689, 0.1365712, 0, 0.7960784, 1, 1,
0.1126608, -0.2153351, 2.495292, 0, 0.7882353, 1, 1,
0.1139061, 0.9765471, -0.03739905, 0, 0.7843137, 1, 1,
0.1231373, -0.03807949, 1.530405, 0, 0.7764706, 1, 1,
0.1236989, 2.523408, 0.7428533, 0, 0.772549, 1, 1,
0.1260123, 0.7426116, 1.338222, 0, 0.7647059, 1, 1,
0.129219, -0.05666809, 2.971179, 0, 0.7607843, 1, 1,
0.1340155, -1.305292, 1.552959, 0, 0.7529412, 1, 1,
0.1369138, 0.1327205, 0.308032, 0, 0.7490196, 1, 1,
0.1372923, -1.206532, 4.623825, 0, 0.7411765, 1, 1,
0.1379525, 0.542888, -0.4438863, 0, 0.7372549, 1, 1,
0.1395661, 0.3454758, -0.5876837, 0, 0.7294118, 1, 1,
0.1413985, -0.3164189, 3.584252, 0, 0.7254902, 1, 1,
0.142189, 1.194988, 0.1150811, 0, 0.7176471, 1, 1,
0.1458568, -0.7415881, 2.411594, 0, 0.7137255, 1, 1,
0.1528288, 0.3987894, 0.3890144, 0, 0.7058824, 1, 1,
0.1537273, 0.4424727, -1.293254, 0, 0.6980392, 1, 1,
0.1549236, -0.05999985, 2.920192, 0, 0.6941177, 1, 1,
0.1564634, -0.4465549, 3.064085, 0, 0.6862745, 1, 1,
0.1581165, -1.714371, 2.713287, 0, 0.682353, 1, 1,
0.159747, 1.295581, -0.2543854, 0, 0.6745098, 1, 1,
0.1632071, -0.2698582, 0.9166277, 0, 0.6705883, 1, 1,
0.1668934, 0.9412032, -0.3768068, 0, 0.6627451, 1, 1,
0.1680786, -0.1039151, 1.108823, 0, 0.6588235, 1, 1,
0.1684564, -2.729466, 3.059741, 0, 0.6509804, 1, 1,
0.1688774, 0.9040155, 1.388753, 0, 0.6470588, 1, 1,
0.1696599, 1.123755, 0.04279438, 0, 0.6392157, 1, 1,
0.1759474, -1.086078, 3.728993, 0, 0.6352941, 1, 1,
0.1761619, -0.4622089, 3.380673, 0, 0.627451, 1, 1,
0.178142, 2.663449, 0.8655024, 0, 0.6235294, 1, 1,
0.1819248, -1.269849, 2.262721, 0, 0.6156863, 1, 1,
0.1849655, -1.375257, 4.477657, 0, 0.6117647, 1, 1,
0.1920136, -0.9163392, 4.290344, 0, 0.6039216, 1, 1,
0.1934427, -0.3400022, 3.783388, 0, 0.5960785, 1, 1,
0.1991633, -0.3290308, 3.908115, 0, 0.5921569, 1, 1,
0.2063136, 1.716737, 0.2761332, 0, 0.5843138, 1, 1,
0.2106983, -2.430778, 4.530756, 0, 0.5803922, 1, 1,
0.2122076, -1.660343, 3.249375, 0, 0.572549, 1, 1,
0.2152424, 1.057582, 0.7234519, 0, 0.5686275, 1, 1,
0.2196673, -0.6931353, 3.270696, 0, 0.5607843, 1, 1,
0.2230907, -0.935102, 3.617389, 0, 0.5568628, 1, 1,
0.2253394, -1.506096, 2.772237, 0, 0.5490196, 1, 1,
0.2265173, 2.616157, 0.1286749, 0, 0.5450981, 1, 1,
0.2318435, 1.398697, 0.9612101, 0, 0.5372549, 1, 1,
0.2345081, 0.6065156, 0.7014568, 0, 0.5333334, 1, 1,
0.2359309, -0.3839131, 4.043111, 0, 0.5254902, 1, 1,
0.2380441, 0.09437971, -0.2206461, 0, 0.5215687, 1, 1,
0.2386526, -1.06862, 1.341042, 0, 0.5137255, 1, 1,
0.2404757, 1.115311, -0.05821536, 0, 0.509804, 1, 1,
0.2408954, -0.7630878, 2.750502, 0, 0.5019608, 1, 1,
0.2424506, -0.5663759, 3.916301, 0, 0.4941176, 1, 1,
0.2431355, 1.135024, 0.04848877, 0, 0.4901961, 1, 1,
0.2450692, -0.8960959, 3.012385, 0, 0.4823529, 1, 1,
0.2511759, 0.4229866, 1.125063, 0, 0.4784314, 1, 1,
0.2561375, -0.2705568, 4.944046, 0, 0.4705882, 1, 1,
0.2621809, 2.579787, -1.195269, 0, 0.4666667, 1, 1,
0.2622867, 0.3893474, 0.7131712, 0, 0.4588235, 1, 1,
0.2642423, -0.2882991, 2.744828, 0, 0.454902, 1, 1,
0.2713689, -0.9508506, 1.972396, 0, 0.4470588, 1, 1,
0.2830579, -0.5355965, 0.4567735, 0, 0.4431373, 1, 1,
0.283631, 0.8292361, 0.7927151, 0, 0.4352941, 1, 1,
0.2845153, -0.9374275, 1.695815, 0, 0.4313726, 1, 1,
0.2849864, 1.13564, -0.02638356, 0, 0.4235294, 1, 1,
0.2855903, -1.569325, 2.91697, 0, 0.4196078, 1, 1,
0.2869033, -0.1130936, 3.019281, 0, 0.4117647, 1, 1,
0.2869563, 1.424807, -0.4398016, 0, 0.4078431, 1, 1,
0.2874896, -1.682004, 3.186619, 0, 0.4, 1, 1,
0.2893598, 1.05478, 1.158404, 0, 0.3921569, 1, 1,
0.2918656, 0.1597142, 0.8924495, 0, 0.3882353, 1, 1,
0.2925774, -1.916381, 3.907992, 0, 0.3803922, 1, 1,
0.2970166, -1.156455, 4.594787, 0, 0.3764706, 1, 1,
0.2974873, -0.3158487, 3.0339, 0, 0.3686275, 1, 1,
0.2980588, 1.367287, -0.4806549, 0, 0.3647059, 1, 1,
0.2999576, -1.440143, 3.488492, 0, 0.3568628, 1, 1,
0.3008198, -0.1208751, 2.007788, 0, 0.3529412, 1, 1,
0.301313, -1.295988, 1.92848, 0, 0.345098, 1, 1,
0.3013847, 1.785108, 1.045551, 0, 0.3411765, 1, 1,
0.3017101, 0.004499591, 2.576428, 0, 0.3333333, 1, 1,
0.302091, 1.909976, -0.3977035, 0, 0.3294118, 1, 1,
0.302519, -0.2985853, 2.179279, 0, 0.3215686, 1, 1,
0.3050176, 0.3370225, -0.1807791, 0, 0.3176471, 1, 1,
0.309495, -1.194059, 2.329767, 0, 0.3098039, 1, 1,
0.3170388, -0.1501871, 4.573642, 0, 0.3058824, 1, 1,
0.3186107, -0.2049893, 2.305128, 0, 0.2980392, 1, 1,
0.3254081, 1.402847, 1.211735, 0, 0.2901961, 1, 1,
0.3288541, -1.008235, 2.717514, 0, 0.2862745, 1, 1,
0.3298988, 0.8017352, 0.05736541, 0, 0.2784314, 1, 1,
0.3395957, 0.1734445, 1.654548, 0, 0.2745098, 1, 1,
0.3426712, -0.9565258, 3.88881, 0, 0.2666667, 1, 1,
0.3446485, -0.4209192, 3.538256, 0, 0.2627451, 1, 1,
0.3536632, -0.8535312, 1.433561, 0, 0.254902, 1, 1,
0.3539891, 0.9087687, 0.386083, 0, 0.2509804, 1, 1,
0.3544267, -0.2996567, 2.679218, 0, 0.2431373, 1, 1,
0.3583633, 0.4682887, 0.1997072, 0, 0.2392157, 1, 1,
0.3602671, -0.184174, 1.862372, 0, 0.2313726, 1, 1,
0.361333, -0.339734, 1.639126, 0, 0.227451, 1, 1,
0.3625827, -0.4579706, 2.972483, 0, 0.2196078, 1, 1,
0.362885, -2.544507, 3.917518, 0, 0.2156863, 1, 1,
0.3674545, 0.4737066, 0.2527435, 0, 0.2078431, 1, 1,
0.369396, -1.965019, 3.070215, 0, 0.2039216, 1, 1,
0.3700452, 0.3104398, 1.484454, 0, 0.1960784, 1, 1,
0.3744725, -0.7542799, 4.345615, 0, 0.1882353, 1, 1,
0.3794647, 0.7733154, -0.6414975, 0, 0.1843137, 1, 1,
0.3796047, -1.02826, 2.535932, 0, 0.1764706, 1, 1,
0.3820387, -0.549285, 2.802487, 0, 0.172549, 1, 1,
0.3851603, 0.1398998, 0.8384005, 0, 0.1647059, 1, 1,
0.388939, 0.4128301, -0.2472693, 0, 0.1607843, 1, 1,
0.389199, -0.7271479, 2.726717, 0, 0.1529412, 1, 1,
0.389328, -1.952812, 2.503413, 0, 0.1490196, 1, 1,
0.3921562, 0.2088189, 1.307862, 0, 0.1411765, 1, 1,
0.3946149, -0.793492, 2.175659, 0, 0.1372549, 1, 1,
0.3951737, -0.4908926, 2.071645, 0, 0.1294118, 1, 1,
0.3965674, 1.64251, 0.5750767, 0, 0.1254902, 1, 1,
0.3994312, 0.5243826, -0.8197565, 0, 0.1176471, 1, 1,
0.4024879, 0.9137723, -0.05400315, 0, 0.1137255, 1, 1,
0.4069981, -1.34304, 3.662272, 0, 0.1058824, 1, 1,
0.4080393, -1.334783, 1.080171, 0, 0.09803922, 1, 1,
0.4129741, 1.724801, -0.2705993, 0, 0.09411765, 1, 1,
0.415102, 1.029417, 0.3530239, 0, 0.08627451, 1, 1,
0.4152617, 1.904978, -0.3689599, 0, 0.08235294, 1, 1,
0.420586, 0.661173, 0.09077179, 0, 0.07450981, 1, 1,
0.4211961, -0.9358191, 2.289239, 0, 0.07058824, 1, 1,
0.4257251, 0.3701671, 0.370688, 0, 0.0627451, 1, 1,
0.4259126, -0.9928411, 1.770358, 0, 0.05882353, 1, 1,
0.4332686, 0.6268359, 0.9836888, 0, 0.05098039, 1, 1,
0.438496, 0.5294623, 0.4015954, 0, 0.04705882, 1, 1,
0.4388882, 0.8036797, 1.893117, 0, 0.03921569, 1, 1,
0.4396398, -1.269042, 1.372344, 0, 0.03529412, 1, 1,
0.4421383, 0.7844551, 1.033581, 0, 0.02745098, 1, 1,
0.4431888, 2.086324, 0.144824, 0, 0.02352941, 1, 1,
0.4436505, -0.2308487, 2.709542, 0, 0.01568628, 1, 1,
0.4526355, 1.261693, -0.4627296, 0, 0.01176471, 1, 1,
0.4561762, -1.182956, 4.982471, 0, 0.003921569, 1, 1,
0.4601892, 0.5013258, 0.9723595, 0.003921569, 0, 1, 1,
0.4653991, -0.9176742, 3.03227, 0.007843138, 0, 1, 1,
0.4794348, 0.1617384, -0.07862387, 0.01568628, 0, 1, 1,
0.4809196, -2.444004, 4.326956, 0.01960784, 0, 1, 1,
0.4847377, 0.3787991, 1.546571, 0.02745098, 0, 1, 1,
0.4865173, -1.347594, 4.577854, 0.03137255, 0, 1, 1,
0.4865296, 0.08800639, 2.461849, 0.03921569, 0, 1, 1,
0.4886401, 0.8070335, -0.2539103, 0.04313726, 0, 1, 1,
0.4887842, -0.496187, 1.989064, 0.05098039, 0, 1, 1,
0.4889067, -0.1463976, 1.825209, 0.05490196, 0, 1, 1,
0.4934255, 0.1680354, 0.7440254, 0.0627451, 0, 1, 1,
0.4944154, -0.5073256, 2.00381, 0.06666667, 0, 1, 1,
0.494577, -0.1825637, 2.499078, 0.07450981, 0, 1, 1,
0.4962096, 0.6306227, 0.8141786, 0.07843138, 0, 1, 1,
0.496719, 1.759042, 0.9544061, 0.08627451, 0, 1, 1,
0.4984816, 1.807278, 0.8163679, 0.09019608, 0, 1, 1,
0.5009045, -0.3485171, 2.051869, 0.09803922, 0, 1, 1,
0.5009722, -0.1522542, 0.2766153, 0.1058824, 0, 1, 1,
0.5023437, -1.298561, 2.74946, 0.1098039, 0, 1, 1,
0.5043308, -1.410306, 2.271453, 0.1176471, 0, 1, 1,
0.5054476, -0.1667356, 1.828477, 0.1215686, 0, 1, 1,
0.5059767, -2.009762, 2.499795, 0.1294118, 0, 1, 1,
0.5205061, -0.6505917, 2.423346, 0.1333333, 0, 1, 1,
0.52415, -0.7268616, -0.3408838, 0.1411765, 0, 1, 1,
0.5303739, -0.02969231, 0.8288259, 0.145098, 0, 1, 1,
0.532715, 0.188051, 2.887929, 0.1529412, 0, 1, 1,
0.5408731, 0.6311339, -1.882464, 0.1568628, 0, 1, 1,
0.5438249, -0.07663715, 0.899339, 0.1647059, 0, 1, 1,
0.5520006, -0.8259847, 1.154332, 0.1686275, 0, 1, 1,
0.5542808, 0.70548, 1.837903, 0.1764706, 0, 1, 1,
0.5559047, -1.218532, 2.080222, 0.1803922, 0, 1, 1,
0.5565914, -1.673954, 4.337995, 0.1882353, 0, 1, 1,
0.5584716, -0.4997967, 3.434351, 0.1921569, 0, 1, 1,
0.5598979, 1.088073, 0.3963182, 0.2, 0, 1, 1,
0.5620472, 0.07004624, 2.16962, 0.2078431, 0, 1, 1,
0.5631571, -1.905047, 3.039387, 0.2117647, 0, 1, 1,
0.5724752, -0.3536828, 1.488078, 0.2196078, 0, 1, 1,
0.57641, -1.504227, 3.669684, 0.2235294, 0, 1, 1,
0.5777361, 0.5399379, 0.9036884, 0.2313726, 0, 1, 1,
0.5796787, 1.965902, 0.8238176, 0.2352941, 0, 1, 1,
0.580895, 0.6477188, 1.577798, 0.2431373, 0, 1, 1,
0.5820401, -0.6062512, 4.220755, 0.2470588, 0, 1, 1,
0.5867913, 1.224155, -1.544421, 0.254902, 0, 1, 1,
0.5887942, 2.174018, -0.6127038, 0.2588235, 0, 1, 1,
0.5898609, 0.2771125, 0.8002912, 0.2666667, 0, 1, 1,
0.5904675, 0.4325448, -1.316165, 0.2705882, 0, 1, 1,
0.5911554, 0.002025051, 1.89065, 0.2784314, 0, 1, 1,
0.6009432, 0.8592694, -0.04810699, 0.282353, 0, 1, 1,
0.6074252, 2.012443, 2.188669, 0.2901961, 0, 1, 1,
0.6080094, -0.04175451, -0.1993706, 0.2941177, 0, 1, 1,
0.617153, 0.1452766, 2.142724, 0.3019608, 0, 1, 1,
0.6193104, 0.626475, -0.6469073, 0.3098039, 0, 1, 1,
0.6222274, -1.032628, 2.042542, 0.3137255, 0, 1, 1,
0.6236093, 0.3599087, 0.05090335, 0.3215686, 0, 1, 1,
0.6278389, -0.08017623, 1.389107, 0.3254902, 0, 1, 1,
0.6278678, 0.9331136, 1.045768, 0.3333333, 0, 1, 1,
0.6357676, -1.24653, 2.300136, 0.3372549, 0, 1, 1,
0.63822, 0.2757646, -0.5335437, 0.345098, 0, 1, 1,
0.6399075, 0.4086148, 0.3557326, 0.3490196, 0, 1, 1,
0.6427311, -1.433304, 1.707259, 0.3568628, 0, 1, 1,
0.646681, 2.380473, 0.2275943, 0.3607843, 0, 1, 1,
0.6485814, -0.5430197, 2.978516, 0.3686275, 0, 1, 1,
0.6503025, 0.146947, -0.2734441, 0.372549, 0, 1, 1,
0.6514328, -0.5937567, 2.200101, 0.3803922, 0, 1, 1,
0.6554471, -0.1508621, 2.075749, 0.3843137, 0, 1, 1,
0.6680601, 0.1060285, 1.089674, 0.3921569, 0, 1, 1,
0.6690992, -0.5605837, 2.404869, 0.3960784, 0, 1, 1,
0.6746056, -2.70204, 1.940513, 0.4039216, 0, 1, 1,
0.6755637, 0.3992702, 0.8008213, 0.4117647, 0, 1, 1,
0.6760702, 0.5601073, 1.561126, 0.4156863, 0, 1, 1,
0.677191, 0.7122383, 0.4078671, 0.4235294, 0, 1, 1,
0.6799181, 1.788705, -0.5538015, 0.427451, 0, 1, 1,
0.6807792, 0.585116, 0.298936, 0.4352941, 0, 1, 1,
0.6810561, 0.2238682, 0.9461517, 0.4392157, 0, 1, 1,
0.6813518, 0.1226308, 1.237335, 0.4470588, 0, 1, 1,
0.6814482, -0.8296559, 1.46117, 0.4509804, 0, 1, 1,
0.6855309, -0.398668, 2.153954, 0.4588235, 0, 1, 1,
0.6885298, -0.1400413, 2.326416, 0.4627451, 0, 1, 1,
0.6906064, 0.7954961, 1.459706, 0.4705882, 0, 1, 1,
0.6924169, -0.1109393, 0.8755181, 0.4745098, 0, 1, 1,
0.6961066, 0.02415431, 1.121563, 0.4823529, 0, 1, 1,
0.704282, -0.1027833, 3.29812, 0.4862745, 0, 1, 1,
0.7097822, -0.2936661, 2.620359, 0.4941176, 0, 1, 1,
0.7113206, -0.5739641, 2.520454, 0.5019608, 0, 1, 1,
0.713613, 1.044997, -1.183344, 0.5058824, 0, 1, 1,
0.713989, 0.7114398, 0.7653925, 0.5137255, 0, 1, 1,
0.7143884, -0.9273837, 2.002783, 0.5176471, 0, 1, 1,
0.7155672, -1.432173, 3.920655, 0.5254902, 0, 1, 1,
0.7170255, 0.4016169, -0.292224, 0.5294118, 0, 1, 1,
0.7170556, 0.09701083, 1.225021, 0.5372549, 0, 1, 1,
0.7179822, 1.886657, -0.009320795, 0.5411765, 0, 1, 1,
0.7220044, 0.7347548, -0.07703341, 0.5490196, 0, 1, 1,
0.7239292, -0.3767451, 2.521779, 0.5529412, 0, 1, 1,
0.7256693, -0.06210635, 2.829864, 0.5607843, 0, 1, 1,
0.7266048, 0.7085519, 0.469747, 0.5647059, 0, 1, 1,
0.7315054, 0.5205234, 0.334898, 0.572549, 0, 1, 1,
0.7328317, -0.3891543, 4.342534, 0.5764706, 0, 1, 1,
0.7336527, 0.5422058, 1.205894, 0.5843138, 0, 1, 1,
0.7359325, -0.09752339, 2.76809, 0.5882353, 0, 1, 1,
0.7383239, 1.171764, -0.01362517, 0.5960785, 0, 1, 1,
0.7383819, 0.05942699, 1.157555, 0.6039216, 0, 1, 1,
0.7401593, 0.03203177, 0.1295166, 0.6078432, 0, 1, 1,
0.7405518, 1.326876, -0.2865771, 0.6156863, 0, 1, 1,
0.74454, 2.151529, 0.3688053, 0.6196079, 0, 1, 1,
0.745907, 1.212765, 0.5423828, 0.627451, 0, 1, 1,
0.751572, 1.416592, 0.1610826, 0.6313726, 0, 1, 1,
0.7546451, 0.8608655, 1.113482, 0.6392157, 0, 1, 1,
0.7566394, -0.4184045, 1.018349, 0.6431373, 0, 1, 1,
0.7587402, 0.8866572, -0.5577425, 0.6509804, 0, 1, 1,
0.7631238, -1.565927, 2.595399, 0.654902, 0, 1, 1,
0.7728776, 1.348362, 0.3369198, 0.6627451, 0, 1, 1,
0.7729365, -0.6097587, 2.118857, 0.6666667, 0, 1, 1,
0.7782971, 0.03349431, 1.157156, 0.6745098, 0, 1, 1,
0.7785414, 1.333074, -0.2566868, 0.6784314, 0, 1, 1,
0.7853647, 1.315147, 0.06573683, 0.6862745, 0, 1, 1,
0.7859111, -0.4298219, 4.148033, 0.6901961, 0, 1, 1,
0.7866223, -1.163014, 2.82205, 0.6980392, 0, 1, 1,
0.7940623, 2.471594, 0.6213319, 0.7058824, 0, 1, 1,
0.7971995, 0.4061223, 0.5039538, 0.7098039, 0, 1, 1,
0.7972569, 0.8380718, 0.168681, 0.7176471, 0, 1, 1,
0.8013549, -0.5066117, 2.861913, 0.7215686, 0, 1, 1,
0.8019419, 0.7601143, 1.641745, 0.7294118, 0, 1, 1,
0.8055958, 0.4305649, 0.9367475, 0.7333333, 0, 1, 1,
0.8088801, 0.3594792, 1.10512, 0.7411765, 0, 1, 1,
0.8189691, 0.8090325, 1.449969, 0.7450981, 0, 1, 1,
0.8220885, -1.522816, 2.533465, 0.7529412, 0, 1, 1,
0.8258671, 0.1587653, 1.262786, 0.7568628, 0, 1, 1,
0.828817, 0.2803445, 3.69435, 0.7647059, 0, 1, 1,
0.8321584, -0.3464253, 1.368634, 0.7686275, 0, 1, 1,
0.8397076, 0.216837, 1.878541, 0.7764706, 0, 1, 1,
0.85478, 0.1935198, 1.378332, 0.7803922, 0, 1, 1,
0.8548158, -0.4060574, 3.999135, 0.7882353, 0, 1, 1,
0.8551184, -0.6551057, 2.214509, 0.7921569, 0, 1, 1,
0.8604813, -1.112473, 2.479338, 0.8, 0, 1, 1,
0.8617819, -0.8308699, 3.148997, 0.8078431, 0, 1, 1,
0.8645647, 0.8850524, -0.4797487, 0.8117647, 0, 1, 1,
0.8686092, 0.131203, 0.3602933, 0.8196079, 0, 1, 1,
0.875792, 1.041132, 0.2188802, 0.8235294, 0, 1, 1,
0.8786429, 1.204535, 0.9357565, 0.8313726, 0, 1, 1,
0.8843226, -0.8393313, 2.036138, 0.8352941, 0, 1, 1,
0.8869736, 1.25643, 0.5589142, 0.8431373, 0, 1, 1,
0.8902518, -0.579496, 3.087769, 0.8470588, 0, 1, 1,
0.8966501, -1.22567, 2.950023, 0.854902, 0, 1, 1,
0.8972831, 0.4024754, -0.01679726, 0.8588235, 0, 1, 1,
0.9043631, 0.8366179, 0.3403769, 0.8666667, 0, 1, 1,
0.9068924, 0.2292661, 0.2404205, 0.8705882, 0, 1, 1,
0.9088252, -0.644099, 4.15537, 0.8784314, 0, 1, 1,
0.9091064, 1.102053, 1.635441, 0.8823529, 0, 1, 1,
0.9115181, -2.276497, 3.278205, 0.8901961, 0, 1, 1,
0.9199072, 0.3873935, 1.867019, 0.8941177, 0, 1, 1,
0.9243807, -0.07005161, 2.505163, 0.9019608, 0, 1, 1,
0.9247908, -1.126554, 1.759779, 0.9098039, 0, 1, 1,
0.9289402, -0.6987698, 1.331742, 0.9137255, 0, 1, 1,
0.9290597, 0.5073217, 0.5495373, 0.9215686, 0, 1, 1,
0.929558, 1.434938, -0.3415543, 0.9254902, 0, 1, 1,
0.9296682, 0.6464011, 1.446687, 0.9333333, 0, 1, 1,
0.9316127, 0.7579234, -1.479769, 0.9372549, 0, 1, 1,
0.9341618, -0.2377353, 2.069119, 0.945098, 0, 1, 1,
0.9343451, -1.883399, 3.583515, 0.9490196, 0, 1, 1,
0.9351172, -0.2807151, 2.101915, 0.9568627, 0, 1, 1,
0.9351705, 1.314866, 0.6753837, 0.9607843, 0, 1, 1,
0.9375815, 0.4336627, 2.58599, 0.9686275, 0, 1, 1,
0.9389018, 0.6891418, 0.4157533, 0.972549, 0, 1, 1,
0.940195, 0.1103534, 3.618685, 0.9803922, 0, 1, 1,
0.9429352, -0.1567694, 1.817583, 0.9843137, 0, 1, 1,
0.9489838, -1.229065, 1.735736, 0.9921569, 0, 1, 1,
0.950653, 0.3185917, -0.389213, 0.9960784, 0, 1, 1,
0.9507204, 0.2081363, 1.954814, 1, 0, 0.9960784, 1,
0.9545051, 0.3108144, -0.2751303, 1, 0, 0.9882353, 1,
0.9548758, -1.218988, 4.900026, 1, 0, 0.9843137, 1,
0.9587233, -2.02747, 2.174594, 1, 0, 0.9764706, 1,
0.9590526, -1.293913, 2.768034, 1, 0, 0.972549, 1,
0.9602865, -0.1706382, 2.561265, 1, 0, 0.9647059, 1,
0.9670849, -0.6589787, 1.869962, 1, 0, 0.9607843, 1,
0.9718919, -1.74915, 2.324992, 1, 0, 0.9529412, 1,
0.9806086, -1.430239, 3.959364, 1, 0, 0.9490196, 1,
0.9817147, 1.084834, -0.2963172, 1, 0, 0.9411765, 1,
0.9850231, 1.043355, 0.2928668, 1, 0, 0.9372549, 1,
0.9886026, 0.02437758, 0.9851063, 1, 0, 0.9294118, 1,
0.9915041, -0.8538877, 1.766759, 1, 0, 0.9254902, 1,
1.018355, -2.992243, 2.252955, 1, 0, 0.9176471, 1,
1.023205, 1.18784, 0.7169669, 1, 0, 0.9137255, 1,
1.038851, 1.555276, 1.059975, 1, 0, 0.9058824, 1,
1.041275, -1.704638, 3.567675, 1, 0, 0.9019608, 1,
1.052142, 1.417375, 0.161736, 1, 0, 0.8941177, 1,
1.056812, 1.000556, 0.3283865, 1, 0, 0.8862745, 1,
1.058769, -1.742613, 2.307461, 1, 0, 0.8823529, 1,
1.05909, -0.3491844, 1.624808, 1, 0, 0.8745098, 1,
1.061254, 1.63715, -0.9450313, 1, 0, 0.8705882, 1,
1.061925, 0.6232102, -0.209242, 1, 0, 0.8627451, 1,
1.072038, -0.4223609, -1.077957, 1, 0, 0.8588235, 1,
1.072355, -0.2545818, 3.070155, 1, 0, 0.8509804, 1,
1.074589, -0.6349323, 1.074232, 1, 0, 0.8470588, 1,
1.074913, 0.4251861, 1.745823, 1, 0, 0.8392157, 1,
1.0843, 0.9715875, -1.275444, 1, 0, 0.8352941, 1,
1.09612, -0.3971163, 1.336183, 1, 0, 0.827451, 1,
1.103267, -1.649567, 3.471205, 1, 0, 0.8235294, 1,
1.106058, 1.140185, 1.609651, 1, 0, 0.8156863, 1,
1.112613, -1.26165, 2.174833, 1, 0, 0.8117647, 1,
1.116987, 0.8368511, 0.547813, 1, 0, 0.8039216, 1,
1.11829, -0.3402116, 2.191107, 1, 0, 0.7960784, 1,
1.120723, 0.8307238, 0.9279987, 1, 0, 0.7921569, 1,
1.1281, -0.05830174, 1.210082, 1, 0, 0.7843137, 1,
1.13, 0.450921, 1.532396, 1, 0, 0.7803922, 1,
1.133475, -0.2749878, 1.53633, 1, 0, 0.772549, 1,
1.133978, -1.010407, 2.014053, 1, 0, 0.7686275, 1,
1.135576, 0.7359249, 1.644731, 1, 0, 0.7607843, 1,
1.141351, -0.4165579, 3.231472, 1, 0, 0.7568628, 1,
1.14184, -0.04796416, 3.33182, 1, 0, 0.7490196, 1,
1.144674, 0.4367618, 2.171359, 1, 0, 0.7450981, 1,
1.156307, 1.430765, 2.058569, 1, 0, 0.7372549, 1,
1.157638, -0.2166002, 2.106585, 1, 0, 0.7333333, 1,
1.163212, -0.002880036, 1.481023, 1, 0, 0.7254902, 1,
1.163778, -0.3643203, 0.4746703, 1, 0, 0.7215686, 1,
1.174657, -1.210117, 1.985531, 1, 0, 0.7137255, 1,
1.176036, 0.2112521, 2.54719, 1, 0, 0.7098039, 1,
1.17635, -0.9983785, 2.274355, 1, 0, 0.7019608, 1,
1.181505, -0.5275195, 0.5476705, 1, 0, 0.6941177, 1,
1.183605, 1.856758, 1.817032, 1, 0, 0.6901961, 1,
1.185214, 1.193028, 1.489428, 1, 0, 0.682353, 1,
1.186894, 1.14267, 0.0004093501, 1, 0, 0.6784314, 1,
1.189047, 0.4828034, 2.227033, 1, 0, 0.6705883, 1,
1.189551, 0.104051, -1.038718, 1, 0, 0.6666667, 1,
1.198839, -0.3213974, 2.261102, 1, 0, 0.6588235, 1,
1.222239, 0.7842842, 0.5882304, 1, 0, 0.654902, 1,
1.22873, 0.154454, 2.555546, 1, 0, 0.6470588, 1,
1.23466, -1.205034, 4.419881, 1, 0, 0.6431373, 1,
1.240708, -0.1574664, 2.580375, 1, 0, 0.6352941, 1,
1.243101, 2.558981, 1.98604, 1, 0, 0.6313726, 1,
1.247794, 1.210374, 1.264053, 1, 0, 0.6235294, 1,
1.251539, -0.4075926, 2.378254, 1, 0, 0.6196079, 1,
1.256527, -0.6894007, 3.033133, 1, 0, 0.6117647, 1,
1.256911, -1.12181, 0.6787692, 1, 0, 0.6078432, 1,
1.258347, -0.6033213, 1.742745, 1, 0, 0.6, 1,
1.264062, -1.732735, 0.5472897, 1, 0, 0.5921569, 1,
1.274306, -0.2307736, 1.743815, 1, 0, 0.5882353, 1,
1.282405, 0.9175332, 0.5327564, 1, 0, 0.5803922, 1,
1.284626, -0.9310275, 2.383172, 1, 0, 0.5764706, 1,
1.291141, 0.6499106, 2.160222, 1, 0, 0.5686275, 1,
1.292329, -0.2916476, 0.2067508, 1, 0, 0.5647059, 1,
1.306704, 1.711284, 1.530539, 1, 0, 0.5568628, 1,
1.313174, -0.01689066, 2.330122, 1, 0, 0.5529412, 1,
1.320571, 0.3326821, 1.142414, 1, 0, 0.5450981, 1,
1.330795, 0.5018299, 1.613108, 1, 0, 0.5411765, 1,
1.341811, 0.6807234, 0.5962175, 1, 0, 0.5333334, 1,
1.357458, 0.0419872, 3.388058, 1, 0, 0.5294118, 1,
1.357517, 0.9602008, 0.7847273, 1, 0, 0.5215687, 1,
1.359149, -1.35663, 3.299385, 1, 0, 0.5176471, 1,
1.365606, -0.6090529, 1.356057, 1, 0, 0.509804, 1,
1.384089, -0.6936354, 2.593092, 1, 0, 0.5058824, 1,
1.389241, -2.07277, 3.029052, 1, 0, 0.4980392, 1,
1.392949, 1.278682, 1.575785, 1, 0, 0.4901961, 1,
1.412682, 0.1162231, 1.984378, 1, 0, 0.4862745, 1,
1.419563, -1.015145, 2.475063, 1, 0, 0.4784314, 1,
1.423949, -1.594507, 3.39874, 1, 0, 0.4745098, 1,
1.426022, 0.4627228, 0.2775506, 1, 0, 0.4666667, 1,
1.433297, -1.716985, 2.985955, 1, 0, 0.4627451, 1,
1.45357, -1.165848, 3.073588, 1, 0, 0.454902, 1,
1.461548, -1.361127, 1.09498, 1, 0, 0.4509804, 1,
1.475966, -0.8939983, 1.373042, 1, 0, 0.4431373, 1,
1.477658, 0.2292951, 2.541436, 1, 0, 0.4392157, 1,
1.483746, 0.955785, 0.08456365, 1, 0, 0.4313726, 1,
1.494007, 0.0291421, 1.180168, 1, 0, 0.427451, 1,
1.498057, -0.336208, 1.874382, 1, 0, 0.4196078, 1,
1.500401, 0.3077202, 1.783964, 1, 0, 0.4156863, 1,
1.505996, -0.1508008, 0.05629985, 1, 0, 0.4078431, 1,
1.513458, -0.3521177, 1.420681, 1, 0, 0.4039216, 1,
1.520809, -0.8715749, 0.4087709, 1, 0, 0.3960784, 1,
1.521381, 0.5320888, 0.8689929, 1, 0, 0.3882353, 1,
1.521711, 1.021581, -0.8688149, 1, 0, 0.3843137, 1,
1.522728, 1.068482, 0.8023226, 1, 0, 0.3764706, 1,
1.530587, 0.1895332, -0.05715997, 1, 0, 0.372549, 1,
1.53179, -0.3163679, -0.09613001, 1, 0, 0.3647059, 1,
1.54038, -0.4813995, 0.6563201, 1, 0, 0.3607843, 1,
1.555514, -0.8905599, 0.04163197, 1, 0, 0.3529412, 1,
1.556622, 1.127592, 1.3344, 1, 0, 0.3490196, 1,
1.568063, 1.420451, 1.140523, 1, 0, 0.3411765, 1,
1.575979, 0.5926105, 0.4768694, 1, 0, 0.3372549, 1,
1.595544, 0.1477949, 1.145155, 1, 0, 0.3294118, 1,
1.600288, 1.65778, 1.451734, 1, 0, 0.3254902, 1,
1.605983, 0.3624422, 1.132695, 1, 0, 0.3176471, 1,
1.615266, 0.7930616, 0.8071049, 1, 0, 0.3137255, 1,
1.618745, 0.1488848, -0.1787166, 1, 0, 0.3058824, 1,
1.632435, -0.5287224, 3.673357, 1, 0, 0.2980392, 1,
1.639826, 0.24437, 2.079692, 1, 0, 0.2941177, 1,
1.655795, 0.7286028, -0.1698187, 1, 0, 0.2862745, 1,
1.672062, 0.1984456, 2.859717, 1, 0, 0.282353, 1,
1.715287, 0.658338, -0.3814594, 1, 0, 0.2745098, 1,
1.729527, 0.7043116, 1.820847, 1, 0, 0.2705882, 1,
1.730017, -0.006231198, 1.481033, 1, 0, 0.2627451, 1,
1.749369, -0.8955964, 0.8738623, 1, 0, 0.2588235, 1,
1.750927, 1.254691, -1.14146, 1, 0, 0.2509804, 1,
1.757911, 1.462147, 0.5490987, 1, 0, 0.2470588, 1,
1.759362, 0.1892208, 2.271949, 1, 0, 0.2392157, 1,
1.763141, 0.8887194, 2.958956, 1, 0, 0.2352941, 1,
1.768747, 0.2874409, 1.020147, 1, 0, 0.227451, 1,
1.789588, -0.6261269, 2.167515, 1, 0, 0.2235294, 1,
1.79774, -0.3063354, 3.406719, 1, 0, 0.2156863, 1,
1.801614, -0.3801907, 0.7761251, 1, 0, 0.2117647, 1,
1.80995, -0.1447826, 2.492667, 1, 0, 0.2039216, 1,
1.814398, -1.058087, 3.53266, 1, 0, 0.1960784, 1,
1.825548, -0.6666105, 1.026521, 1, 0, 0.1921569, 1,
1.875836, 1.086592, 0.4275347, 1, 0, 0.1843137, 1,
1.886912, -0.4692329, 1.602855, 1, 0, 0.1803922, 1,
1.893268, -0.3547016, -0.1755057, 1, 0, 0.172549, 1,
1.906342, 0.1388846, 1.951557, 1, 0, 0.1686275, 1,
1.929453, 0.4687138, 0.7867914, 1, 0, 0.1607843, 1,
1.951147, -0.3042068, 2.195939, 1, 0, 0.1568628, 1,
1.963651, 0.5771813, 2.147202, 1, 0, 0.1490196, 1,
1.994519, 0.4126864, -1.129596, 1, 0, 0.145098, 1,
1.998741, 0.6616675, -0.3673331, 1, 0, 0.1372549, 1,
2.005303, 0.08151578, 2.239932, 1, 0, 0.1333333, 1,
2.024324, 0.7582242, 1.680028, 1, 0, 0.1254902, 1,
2.032465, 0.2682954, 2.004048, 1, 0, 0.1215686, 1,
2.039822, 0.361137, 2.276798, 1, 0, 0.1137255, 1,
2.062963, 1.982915, -0.8102692, 1, 0, 0.1098039, 1,
2.086308, 0.8720702, -1.009197, 1, 0, 0.1019608, 1,
2.197266, -0.486982, 2.718863, 1, 0, 0.09411765, 1,
2.306874, 1.50747, -0.8778185, 1, 0, 0.09019608, 1,
2.311017, 0.3697329, 2.219979, 1, 0, 0.08235294, 1,
2.326862, 0.556598, -0.1099491, 1, 0, 0.07843138, 1,
2.354676, -0.3622118, 0.8670768, 1, 0, 0.07058824, 1,
2.388902, -0.925147, 2.932113, 1, 0, 0.06666667, 1,
2.397006, -0.8223185, 1.283915, 1, 0, 0.05882353, 1,
2.462356, 0.273287, 0.1317953, 1, 0, 0.05490196, 1,
2.467295, -0.317581, 2.092263, 1, 0, 0.04705882, 1,
2.509865, 0.7047204, 3.109886, 1, 0, 0.04313726, 1,
2.53798, 1.226122, -1.437934, 1, 0, 0.03529412, 1,
2.572661, 1.392031, 1.376198, 1, 0, 0.03137255, 1,
2.772681, 0.2189642, -0.1990393, 1, 0, 0.02352941, 1,
2.808783, -1.732708, 0.8223853, 1, 0, 0.01960784, 1,
2.817693, 1.367511, 1.912774, 1, 0, 0.01176471, 1,
3.312618, 0.1399362, 2.988864, 1, 0, 0.007843138, 1
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
0.2814646, -4.164234, -6.828704, 0, -0.5, 0.5, 0.5,
0.2814646, -4.164234, -6.828704, 1, -0.5, 0.5, 0.5,
0.2814646, -4.164234, -6.828704, 1, 1.5, 0.5, 0.5,
0.2814646, -4.164234, -6.828704, 0, 1.5, 0.5, 0.5
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
-3.777251, -0.2321514, -6.828704, 0, -0.5, 0.5, 0.5,
-3.777251, -0.2321514, -6.828704, 1, -0.5, 0.5, 0.5,
-3.777251, -0.2321514, -6.828704, 1, 1.5, 0.5, 0.5,
-3.777251, -0.2321514, -6.828704, 0, 1.5, 0.5, 0.5
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
-3.777251, -4.164234, 0.1149778, 0, -0.5, 0.5, 0.5,
-3.777251, -4.164234, 0.1149778, 1, -0.5, 0.5, 0.5,
-3.777251, -4.164234, 0.1149778, 1, 1.5, 0.5, 0.5,
-3.777251, -4.164234, 0.1149778, 0, 1.5, 0.5, 0.5
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
-2, -3.25683, -5.226316,
3, -3.25683, -5.226316,
-2, -3.25683, -5.226316,
-2, -3.408065, -5.493381,
-1, -3.25683, -5.226316,
-1, -3.408065, -5.493381,
0, -3.25683, -5.226316,
0, -3.408065, -5.493381,
1, -3.25683, -5.226316,
1, -3.408065, -5.493381,
2, -3.25683, -5.226316,
2, -3.408065, -5.493381,
3, -3.25683, -5.226316,
3, -3.408065, -5.493381
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
-2, -3.710532, -6.02751, 0, -0.5, 0.5, 0.5,
-2, -3.710532, -6.02751, 1, -0.5, 0.5, 0.5,
-2, -3.710532, -6.02751, 1, 1.5, 0.5, 0.5,
-2, -3.710532, -6.02751, 0, 1.5, 0.5, 0.5,
-1, -3.710532, -6.02751, 0, -0.5, 0.5, 0.5,
-1, -3.710532, -6.02751, 1, -0.5, 0.5, 0.5,
-1, -3.710532, -6.02751, 1, 1.5, 0.5, 0.5,
-1, -3.710532, -6.02751, 0, 1.5, 0.5, 0.5,
0, -3.710532, -6.02751, 0, -0.5, 0.5, 0.5,
0, -3.710532, -6.02751, 1, -0.5, 0.5, 0.5,
0, -3.710532, -6.02751, 1, 1.5, 0.5, 0.5,
0, -3.710532, -6.02751, 0, 1.5, 0.5, 0.5,
1, -3.710532, -6.02751, 0, -0.5, 0.5, 0.5,
1, -3.710532, -6.02751, 1, -0.5, 0.5, 0.5,
1, -3.710532, -6.02751, 1, 1.5, 0.5, 0.5,
1, -3.710532, -6.02751, 0, 1.5, 0.5, 0.5,
2, -3.710532, -6.02751, 0, -0.5, 0.5, 0.5,
2, -3.710532, -6.02751, 1, -0.5, 0.5, 0.5,
2, -3.710532, -6.02751, 1, 1.5, 0.5, 0.5,
2, -3.710532, -6.02751, 0, 1.5, 0.5, 0.5,
3, -3.710532, -6.02751, 0, -0.5, 0.5, 0.5,
3, -3.710532, -6.02751, 1, -0.5, 0.5, 0.5,
3, -3.710532, -6.02751, 1, 1.5, 0.5, 0.5,
3, -3.710532, -6.02751, 0, 1.5, 0.5, 0.5
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
-2.840624, -3, -5.226316,
-2.840624, 2, -5.226316,
-2.840624, -3, -5.226316,
-2.996728, -3, -5.493381,
-2.840624, -2, -5.226316,
-2.996728, -2, -5.493381,
-2.840624, -1, -5.226316,
-2.996728, -1, -5.493381,
-2.840624, 0, -5.226316,
-2.996728, 0, -5.493381,
-2.840624, 1, -5.226316,
-2.996728, 1, -5.493381,
-2.840624, 2, -5.226316,
-2.996728, 2, -5.493381
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
-3.308937, -3, -6.02751, 0, -0.5, 0.5, 0.5,
-3.308937, -3, -6.02751, 1, -0.5, 0.5, 0.5,
-3.308937, -3, -6.02751, 1, 1.5, 0.5, 0.5,
-3.308937, -3, -6.02751, 0, 1.5, 0.5, 0.5,
-3.308937, -2, -6.02751, 0, -0.5, 0.5, 0.5,
-3.308937, -2, -6.02751, 1, -0.5, 0.5, 0.5,
-3.308937, -2, -6.02751, 1, 1.5, 0.5, 0.5,
-3.308937, -2, -6.02751, 0, 1.5, 0.5, 0.5,
-3.308937, -1, -6.02751, 0, -0.5, 0.5, 0.5,
-3.308937, -1, -6.02751, 1, -0.5, 0.5, 0.5,
-3.308937, -1, -6.02751, 1, 1.5, 0.5, 0.5,
-3.308937, -1, -6.02751, 0, 1.5, 0.5, 0.5,
-3.308937, 0, -6.02751, 0, -0.5, 0.5, 0.5,
-3.308937, 0, -6.02751, 1, -0.5, 0.5, 0.5,
-3.308937, 0, -6.02751, 1, 1.5, 0.5, 0.5,
-3.308937, 0, -6.02751, 0, 1.5, 0.5, 0.5,
-3.308937, 1, -6.02751, 0, -0.5, 0.5, 0.5,
-3.308937, 1, -6.02751, 1, -0.5, 0.5, 0.5,
-3.308937, 1, -6.02751, 1, 1.5, 0.5, 0.5,
-3.308937, 1, -6.02751, 0, 1.5, 0.5, 0.5,
-3.308937, 2, -6.02751, 0, -0.5, 0.5, 0.5,
-3.308937, 2, -6.02751, 1, -0.5, 0.5, 0.5,
-3.308937, 2, -6.02751, 1, 1.5, 0.5, 0.5,
-3.308937, 2, -6.02751, 0, 1.5, 0.5, 0.5
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
-2.840624, -3.25683, -4,
-2.840624, -3.25683, 4,
-2.840624, -3.25683, -4,
-2.996728, -3.408065, -4,
-2.840624, -3.25683, -2,
-2.996728, -3.408065, -2,
-2.840624, -3.25683, 0,
-2.996728, -3.408065, 0,
-2.840624, -3.25683, 2,
-2.996728, -3.408065, 2,
-2.840624, -3.25683, 4,
-2.996728, -3.408065, 4
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
-3.308937, -3.710532, -4, 0, -0.5, 0.5, 0.5,
-3.308937, -3.710532, -4, 1, -0.5, 0.5, 0.5,
-3.308937, -3.710532, -4, 1, 1.5, 0.5, 0.5,
-3.308937, -3.710532, -4, 0, 1.5, 0.5, 0.5,
-3.308937, -3.710532, -2, 0, -0.5, 0.5, 0.5,
-3.308937, -3.710532, -2, 1, -0.5, 0.5, 0.5,
-3.308937, -3.710532, -2, 1, 1.5, 0.5, 0.5,
-3.308937, -3.710532, -2, 0, 1.5, 0.5, 0.5,
-3.308937, -3.710532, 0, 0, -0.5, 0.5, 0.5,
-3.308937, -3.710532, 0, 1, -0.5, 0.5, 0.5,
-3.308937, -3.710532, 0, 1, 1.5, 0.5, 0.5,
-3.308937, -3.710532, 0, 0, 1.5, 0.5, 0.5,
-3.308937, -3.710532, 2, 0, -0.5, 0.5, 0.5,
-3.308937, -3.710532, 2, 1, -0.5, 0.5, 0.5,
-3.308937, -3.710532, 2, 1, 1.5, 0.5, 0.5,
-3.308937, -3.710532, 2, 0, 1.5, 0.5, 0.5,
-3.308937, -3.710532, 4, 0, -0.5, 0.5, 0.5,
-3.308937, -3.710532, 4, 1, -0.5, 0.5, 0.5,
-3.308937, -3.710532, 4, 1, 1.5, 0.5, 0.5,
-3.308937, -3.710532, 4, 0, 1.5, 0.5, 0.5
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
-2.840624, -3.25683, -5.226316,
-2.840624, 2.792528, -5.226316,
-2.840624, -3.25683, 5.456272,
-2.840624, 2.792528, 5.456272,
-2.840624, -3.25683, -5.226316,
-2.840624, -3.25683, 5.456272,
-2.840624, 2.792528, -5.226316,
-2.840624, 2.792528, 5.456272,
-2.840624, -3.25683, -5.226316,
3.403553, -3.25683, -5.226316,
-2.840624, -3.25683, 5.456272,
3.403553, -3.25683, 5.456272,
-2.840624, 2.792528, -5.226316,
3.403553, 2.792528, -5.226316,
-2.840624, 2.792528, 5.456272,
3.403553, 2.792528, 5.456272,
3.403553, -3.25683, -5.226316,
3.403553, 2.792528, -5.226316,
3.403553, -3.25683, 5.456272,
3.403553, 2.792528, 5.456272,
3.403553, -3.25683, -5.226316,
3.403553, -3.25683, 5.456272,
3.403553, 2.792528, -5.226316,
3.403553, 2.792528, 5.456272
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
var radius = 7.354643;
var distance = 32.72164;
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
mvMatrix.translate( -0.2814646, 0.2321514, -0.1149778 );
mvMatrix.scale( 1.273504, 1.314517, 0.7443874 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -32.72164);
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
methyldymron<-read.table("methyldymron.xyz")
```

```
## Error in read.table("methyldymron.xyz"): no lines available in input
```

```r
x<-methyldymron$V2
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
```

```r
y<-methyldymron$V3
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
```

```r
z<-methyldymron$V4
```

```
## Error in eval(expr, envir, enclos): object 'methyldymron' not found
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
-2.749689, -0.01650441, -1.252089, 0, 0, 1, 1, 1,
-2.747695, 0.2149927, -1.513167, 1, 0, 0, 1, 1,
-2.561451, 0.2243678, -0.05856771, 1, 0, 0, 1, 1,
-2.480811, -0.5747352, -1.826262, 1, 0, 0, 1, 1,
-2.463068, -0.937856, -2.089303, 1, 0, 0, 1, 1,
-2.462027, 1.180171, -1.57594, 1, 0, 0, 1, 1,
-2.4467, 1.768577, -1.740623, 0, 0, 0, 1, 1,
-2.368321, -0.03635519, -1.638887, 0, 0, 0, 1, 1,
-2.313094, 0.8154069, -4.122244, 0, 0, 0, 1, 1,
-2.28572, 0.3719726, 0.6880037, 0, 0, 0, 1, 1,
-2.28459, 0.2125379, -0.6152381, 0, 0, 0, 1, 1,
-2.273144, 1.54619, -1.103304, 0, 0, 0, 1, 1,
-2.246903, 0.6512052, -2.317942, 0, 0, 0, 1, 1,
-2.241373, 1.020569, 0.3191298, 1, 1, 1, 1, 1,
-2.230785, 0.5895162, -1.957362, 1, 1, 1, 1, 1,
-2.184626, 1.649554, -1.261465, 1, 1, 1, 1, 1,
-2.176752, -0.5463967, -2.679166, 1, 1, 1, 1, 1,
-2.135141, -2.281727, -1.427703, 1, 1, 1, 1, 1,
-2.117233, -0.9540062, -1.631941, 1, 1, 1, 1, 1,
-2.09798, -0.5628702, -3.303583, 1, 1, 1, 1, 1,
-2.096747, 0.8360419, -0.6270027, 1, 1, 1, 1, 1,
-2.085316, -1.383659, -0.7156692, 1, 1, 1, 1, 1,
-2.050503, -1.175474, -3.189656, 1, 1, 1, 1, 1,
-2.046049, 0.1021656, -1.125633, 1, 1, 1, 1, 1,
-2.038136, 0.03164533, -2.351918, 1, 1, 1, 1, 1,
-2.017736, 1.352485, 0.1882418, 1, 1, 1, 1, 1,
-2.015873, -0.5847914, -1.556715, 1, 1, 1, 1, 1,
-2.010074, 0.03603753, -1.393455, 1, 1, 1, 1, 1,
-1.999101, 0.4101951, -4.037448, 0, 0, 1, 1, 1,
-1.977894, 0.1244509, -0.5352916, 1, 0, 0, 1, 1,
-1.961082, 0.266405, -2.208886, 1, 0, 0, 1, 1,
-1.939914, -0.2224765, -1.620287, 1, 0, 0, 1, 1,
-1.926549, -0.9420293, 0.2476256, 1, 0, 0, 1, 1,
-1.874551, 0.7305703, -3.754724, 1, 0, 0, 1, 1,
-1.864843, -0.337769, -2.142603, 0, 0, 0, 1, 1,
-1.858875, -0.8420706, -2.090194, 0, 0, 0, 1, 1,
-1.858405, -1.49826, -2.577725, 0, 0, 0, 1, 1,
-1.845867, -0.4556389, -1.979775, 0, 0, 0, 1, 1,
-1.838466, -1.592192, -2.417903, 0, 0, 0, 1, 1,
-1.837179, -1.79718, -1.24326, 0, 0, 0, 1, 1,
-1.828732, -0.1532249, -1.660002, 0, 0, 0, 1, 1,
-1.79081, 0.2764028, -1.593272, 1, 1, 1, 1, 1,
-1.774944, -0.6547698, -2.31437, 1, 1, 1, 1, 1,
-1.77121, -1.200965, -2.771691, 1, 1, 1, 1, 1,
-1.762786, 0.7382106, -0.1925961, 1, 1, 1, 1, 1,
-1.73954, 1.05706, -1.333681, 1, 1, 1, 1, 1,
-1.73882, 0.07031235, -0.6219161, 1, 1, 1, 1, 1,
-1.726596, -1.188747, -2.990491, 1, 1, 1, 1, 1,
-1.721134, 0.4315751, -1.165931, 1, 1, 1, 1, 1,
-1.700027, -0.005462001, -2.667498, 1, 1, 1, 1, 1,
-1.68657, -0.5409027, -2.999654, 1, 1, 1, 1, 1,
-1.683004, -1.450706, -3.692881, 1, 1, 1, 1, 1,
-1.672377, 0.6310717, -1.578581, 1, 1, 1, 1, 1,
-1.661839, -0.03515152, -2.11096, 1, 1, 1, 1, 1,
-1.633332, -0.4074731, -2.03261, 1, 1, 1, 1, 1,
-1.629578, -0.7487866, -0.5957927, 1, 1, 1, 1, 1,
-1.623752, -1.068549, -2.803651, 0, 0, 1, 1, 1,
-1.619542, -0.5719323, -0.6675921, 1, 0, 0, 1, 1,
-1.617313, -0.8303617, -3.627442, 1, 0, 0, 1, 1,
-1.599531, 0.153956, 0.04777804, 1, 0, 0, 1, 1,
-1.57241, -0.1054729, -2.589683, 1, 0, 0, 1, 1,
-1.554273, 1.090861, -0.514239, 1, 0, 0, 1, 1,
-1.541419, 0.8338786, -0.2173245, 0, 0, 0, 1, 1,
-1.53705, -1.575579, -3.318507, 0, 0, 0, 1, 1,
-1.533388, 0.05505932, -0.6566097, 0, 0, 0, 1, 1,
-1.532057, 0.233361, -2.554207, 0, 0, 0, 1, 1,
-1.530096, 0.2224916, -1.92181, 0, 0, 0, 1, 1,
-1.510597, 1.014647, -0.8996409, 0, 0, 0, 1, 1,
-1.50798, 1.504418, -1.303565, 0, 0, 0, 1, 1,
-1.507163, 2.095835, -0.5390009, 1, 1, 1, 1, 1,
-1.477254, -0.914215, -0.687843, 1, 1, 1, 1, 1,
-1.460719, 1.594519, -1.644651, 1, 1, 1, 1, 1,
-1.458671, -0.9881786, -1.373291, 1, 1, 1, 1, 1,
-1.45528, 0.8256928, -2.25868, 1, 1, 1, 1, 1,
-1.449972, 0.24108, -2.289202, 1, 1, 1, 1, 1,
-1.449162, -2.066976, -3.070653, 1, 1, 1, 1, 1,
-1.441329, -0.5949506, -2.270326, 1, 1, 1, 1, 1,
-1.438204, 0.2293521, -2.881227, 1, 1, 1, 1, 1,
-1.43786, -0.5997193, -1.934726, 1, 1, 1, 1, 1,
-1.435435, -1.80896, -2.22033, 1, 1, 1, 1, 1,
-1.427046, 1.071529, -1.542941, 1, 1, 1, 1, 1,
-1.413984, -2.134005, -2.126847, 1, 1, 1, 1, 1,
-1.411258, 0.06091416, -1.838024, 1, 1, 1, 1, 1,
-1.38378, 1.513831, -0.8347064, 1, 1, 1, 1, 1,
-1.382254, -0.2012234, -2.51379, 0, 0, 1, 1, 1,
-1.378571, 0.08931345, -3.908226, 1, 0, 0, 1, 1,
-1.376398, 0.6939898, -1.938689, 1, 0, 0, 1, 1,
-1.374184, 0.3147102, -1.792787, 1, 0, 0, 1, 1,
-1.373159, 0.09544583, -2.115652, 1, 0, 0, 1, 1,
-1.37073, 0.554326, -2.27288, 1, 0, 0, 1, 1,
-1.366721, 0.01916079, -2.734711, 0, 0, 0, 1, 1,
-1.356835, -0.1079564, -1.119913, 0, 0, 0, 1, 1,
-1.352325, 1.106727, 0.4150169, 0, 0, 0, 1, 1,
-1.343324, 0.2893837, -1.264046, 0, 0, 0, 1, 1,
-1.338262, -1.85319, -2.272162, 0, 0, 0, 1, 1,
-1.335943, 0.2916712, -1.960603, 0, 0, 0, 1, 1,
-1.326923, 1.752636, -0.1150424, 0, 0, 0, 1, 1,
-1.323074, -3.168733, -3.253374, 1, 1, 1, 1, 1,
-1.316998, 1.064505, -2.23872, 1, 1, 1, 1, 1,
-1.314742, 0.002766709, -1.569739, 1, 1, 1, 1, 1,
-1.312369, -0.7401708, -1.339121, 1, 1, 1, 1, 1,
-1.311404, 0.4332432, -0.04139034, 1, 1, 1, 1, 1,
-1.309186, -1.076939, -2.643576, 1, 1, 1, 1, 1,
-1.292889, 1.241811, -0.94265, 1, 1, 1, 1, 1,
-1.29286, 2.325948, -0.1817806, 1, 1, 1, 1, 1,
-1.284333, 0.727798, -0.8046499, 1, 1, 1, 1, 1,
-1.284198, 1.082111, -0.5272941, 1, 1, 1, 1, 1,
-1.283475, -1.621249, -3.006596, 1, 1, 1, 1, 1,
-1.282557, -0.3032959, -1.710226, 1, 1, 1, 1, 1,
-1.280886, -0.7636654, -2.745105, 1, 1, 1, 1, 1,
-1.271819, 1.314728, -1.024524, 1, 1, 1, 1, 1,
-1.252495, 0.5529203, -3.190544, 1, 1, 1, 1, 1,
-1.249528, 1.098138, 0.2875838, 0, 0, 1, 1, 1,
-1.24318, -1.385538, -3.108215, 1, 0, 0, 1, 1,
-1.235257, -1.651503, -3.458281, 1, 0, 0, 1, 1,
-1.232708, 1.01379, -2.088536, 1, 0, 0, 1, 1,
-1.22022, 0.6369333, -2.103076, 1, 0, 0, 1, 1,
-1.21649, 0.3469177, -1.765728, 1, 0, 0, 1, 1,
-1.20746, 0.8767189, 1.321393, 0, 0, 0, 1, 1,
-1.204689, -0.07937875, -1.076687, 0, 0, 0, 1, 1,
-1.201468, 1.130506, -1.710018, 0, 0, 0, 1, 1,
-1.197868, 0.5926094, -1.201523, 0, 0, 0, 1, 1,
-1.184671, 0.1679389, -0.6684739, 0, 0, 0, 1, 1,
-1.18245, 0.04447173, -0.6078832, 0, 0, 0, 1, 1,
-1.177404, 0.3709525, -1.876057, 0, 0, 0, 1, 1,
-1.176348, 0.4589924, -0.310806, 1, 1, 1, 1, 1,
-1.174747, -0.4083899, -0.697359, 1, 1, 1, 1, 1,
-1.173678, -0.2927108, -1.112116, 1, 1, 1, 1, 1,
-1.16862, 0.3762993, -0.08926485, 1, 1, 1, 1, 1,
-1.16693, -0.2334659, -0.01124957, 1, 1, 1, 1, 1,
-1.165461, -1.713405, -4.17987, 1, 1, 1, 1, 1,
-1.156935, 1.961827, -0.5522016, 1, 1, 1, 1, 1,
-1.153851, -1.547941, -3.436437, 1, 1, 1, 1, 1,
-1.151472, -0.4757692, -1.131614, 1, 1, 1, 1, 1,
-1.15059, 2.16816, 0.8474068, 1, 1, 1, 1, 1,
-1.146737, 0.353657, -0.7934171, 1, 1, 1, 1, 1,
-1.145955, -1.367826, -1.450162, 1, 1, 1, 1, 1,
-1.143714, 1.216292, 0.1949888, 1, 1, 1, 1, 1,
-1.143089, 2.567896, -0.9573671, 1, 1, 1, 1, 1,
-1.13881, -0.4468037, -2.56196, 1, 1, 1, 1, 1,
-1.136715, 0.775933, -1.840955, 0, 0, 1, 1, 1,
-1.116131, -0.6726996, -1.340983, 1, 0, 0, 1, 1,
-1.115214, 1.207706, -1.124729, 1, 0, 0, 1, 1,
-1.114379, -0.1283885, -2.543005, 1, 0, 0, 1, 1,
-1.107346, -0.04074207, -0.0391972, 1, 0, 0, 1, 1,
-1.105866, -1.063111, -0.9433877, 1, 0, 0, 1, 1,
-1.104308, 0.07238018, 0.4067348, 0, 0, 0, 1, 1,
-1.0959, -0.2378889, -0.2265973, 0, 0, 0, 1, 1,
-1.095506, 1.278807, -0.7647623, 0, 0, 0, 1, 1,
-1.090539, -0.7922681, -0.03607621, 0, 0, 0, 1, 1,
-1.090379, -1.677457, -1.538798, 0, 0, 0, 1, 1,
-1.089836, 2.051224, 0.9754604, 0, 0, 0, 1, 1,
-1.08843, -0.05185629, -0.03808184, 0, 0, 0, 1, 1,
-1.088256, 1.313408, -1.563367, 1, 1, 1, 1, 1,
-1.077464, 0.880615, -1.183381, 1, 1, 1, 1, 1,
-1.075984, -0.2729149, -2.474457, 1, 1, 1, 1, 1,
-1.074786, -0.7040079, -1.422047, 1, 1, 1, 1, 1,
-1.072488, 0.3684799, -2.661194, 1, 1, 1, 1, 1,
-1.063182, -0.4216796, -3.151767, 1, 1, 1, 1, 1,
-1.060634, -0.6109333, 0.3372351, 1, 1, 1, 1, 1,
-1.057865, 0.2382741, -1.331702, 1, 1, 1, 1, 1,
-1.055385, -1.109786, -1.576679, 1, 1, 1, 1, 1,
-1.045196, -0.4345775, -3.853996, 1, 1, 1, 1, 1,
-1.043438, -0.9778869, -3.422194, 1, 1, 1, 1, 1,
-1.03478, 1.402848, -2.328642, 1, 1, 1, 1, 1,
-1.032779, 0.7642108, -1.567626, 1, 1, 1, 1, 1,
-1.027792, -0.7699894, -2.730178, 1, 1, 1, 1, 1,
-1.021155, -1.499753, -2.299924, 1, 1, 1, 1, 1,
-1.013243, 0.01923138, -2.264359, 0, 0, 1, 1, 1,
-1.001319, -0.7526821, -2.354019, 1, 0, 0, 1, 1,
-0.9990349, -0.8160641, -1.33814, 1, 0, 0, 1, 1,
-0.9905317, 0.6880901, -2.3416, 1, 0, 0, 1, 1,
-0.989509, 0.8732343, -1.234651, 1, 0, 0, 1, 1,
-0.9763417, -1.52827, -2.793902, 1, 0, 0, 1, 1,
-0.9629331, 0.6848903, 0.7155894, 0, 0, 0, 1, 1,
-0.9615923, 1.219324, -2.202892, 0, 0, 0, 1, 1,
-0.9606479, 1.287217, 0.4960718, 0, 0, 0, 1, 1,
-0.9557395, -1.163098, -2.567562, 0, 0, 0, 1, 1,
-0.9518824, -1.205244, -0.6179062, 0, 0, 0, 1, 1,
-0.9446878, -1.700308, -3.835361, 0, 0, 0, 1, 1,
-0.9441747, 0.2499204, -1.877505, 0, 0, 0, 1, 1,
-0.9426358, 0.9190248, -0.1912004, 1, 1, 1, 1, 1,
-0.9396308, -1.560324, -3.687439, 1, 1, 1, 1, 1,
-0.9375331, -0.739843, -2.346433, 1, 1, 1, 1, 1,
-0.9361651, 0.7291746, -1.19547, 1, 1, 1, 1, 1,
-0.9333486, -1.07461, -3.086988, 1, 1, 1, 1, 1,
-0.931898, 1.096582, 0.1127799, 1, 1, 1, 1, 1,
-0.929327, -0.4936144, -2.187, 1, 1, 1, 1, 1,
-0.9283147, -0.6254675, -2.511682, 1, 1, 1, 1, 1,
-0.9190506, 0.02714166, -0.1025762, 1, 1, 1, 1, 1,
-0.9184517, -0.4299824, -2.326441, 1, 1, 1, 1, 1,
-0.917403, -1.116922, -4.249374, 1, 1, 1, 1, 1,
-0.9131368, -0.3073098, -0.7654497, 1, 1, 1, 1, 1,
-0.9125305, 1.474802, 1.149841, 1, 1, 1, 1, 1,
-0.9117552, 1.12919, -1.137203, 1, 1, 1, 1, 1,
-0.9016047, -0.05526601, -1.202139, 1, 1, 1, 1, 1,
-0.9014585, 0.4738671, -1.25202, 0, 0, 1, 1, 1,
-0.8958985, -0.02784628, -0.1166665, 1, 0, 0, 1, 1,
-0.8841361, -0.5791378, -2.741622, 1, 0, 0, 1, 1,
-0.8830795, 0.7622898, 1.650243, 1, 0, 0, 1, 1,
-0.8811854, -0.2571453, -0.7730591, 1, 0, 0, 1, 1,
-0.8809053, 0.1690879, -2.292103, 1, 0, 0, 1, 1,
-0.8799783, -0.6802018, -4.304478, 0, 0, 0, 1, 1,
-0.8707398, -0.4520836, -2.131181, 0, 0, 0, 1, 1,
-0.8699554, -0.2507041, -0.9277138, 0, 0, 0, 1, 1,
-0.8600557, 1.260523, -1.54053, 0, 0, 0, 1, 1,
-0.85647, 1.231859, -1.44802, 0, 0, 0, 1, 1,
-0.8430848, 0.3974728, -0.7646738, 0, 0, 0, 1, 1,
-0.8412193, -0.7708904, -2.613544, 0, 0, 0, 1, 1,
-0.8378, -0.9520446, -2.312516, 1, 1, 1, 1, 1,
-0.8367382, -0.191148, -1.361024, 1, 1, 1, 1, 1,
-0.8352978, 0.4322118, -1.849654, 1, 1, 1, 1, 1,
-0.8337508, 1.0676, -0.559199, 1, 1, 1, 1, 1,
-0.8242508, -0.7585508, -2.61074, 1, 1, 1, 1, 1,
-0.8220202, 1.109917, -0.303613, 1, 1, 1, 1, 1,
-0.8197427, -0.35601, -0.9289517, 1, 1, 1, 1, 1,
-0.8194553, -0.1786668, 0.003423049, 1, 1, 1, 1, 1,
-0.8083786, 0.6000752, -0.576196, 1, 1, 1, 1, 1,
-0.8082591, 0.5625894, 0.2288515, 1, 1, 1, 1, 1,
-0.801042, -0.08790833, -1.090291, 1, 1, 1, 1, 1,
-0.7987139, 0.7589208, -1.578009, 1, 1, 1, 1, 1,
-0.7980582, -1.025, -1.588676, 1, 1, 1, 1, 1,
-0.7963066, -2.209263, -0.9904964, 1, 1, 1, 1, 1,
-0.7859329, -0.09449658, -1.83988, 1, 1, 1, 1, 1,
-0.7790477, 0.03500968, -1.283069, 0, 0, 1, 1, 1,
-0.7789537, 0.8501944, -1.320589, 1, 0, 0, 1, 1,
-0.7773923, -1.375347, -4.289253, 1, 0, 0, 1, 1,
-0.7769037, -0.330622, -1.639646, 1, 0, 0, 1, 1,
-0.776132, 0.547043, -1.925446, 1, 0, 0, 1, 1,
-0.7669535, 0.4690993, 0.8731382, 1, 0, 0, 1, 1,
-0.7595928, 0.08730788, -0.4594493, 0, 0, 0, 1, 1,
-0.7589263, -2.137273, -1.106721, 0, 0, 0, 1, 1,
-0.7550389, 0.2071907, 0.01390861, 0, 0, 0, 1, 1,
-0.7450331, -0.7900589, -1.034102, 0, 0, 0, 1, 1,
-0.7370312, 1.03466, -0.6017295, 0, 0, 0, 1, 1,
-0.7357559, 0.1974833, -1.739974, 0, 0, 0, 1, 1,
-0.7264786, 0.3843276, -3.086046, 0, 0, 0, 1, 1,
-0.7224481, 1.048432, 0.5022887, 1, 1, 1, 1, 1,
-0.711057, -0.2126652, -1.372195, 1, 1, 1, 1, 1,
-0.7109004, 0.6312771, -1.461623, 1, 1, 1, 1, 1,
-0.7061404, 0.5099629, 0.5069017, 1, 1, 1, 1, 1,
-0.7016019, 0.9703854, -1.353166, 1, 1, 1, 1, 1,
-0.6932785, -0.2961586, -1.645026, 1, 1, 1, 1, 1,
-0.6928418, 0.1520507, -1.123115, 1, 1, 1, 1, 1,
-0.6918316, -0.003181687, -0.4163295, 1, 1, 1, 1, 1,
-0.6860805, -1.910004, -1.944311, 1, 1, 1, 1, 1,
-0.6767318, -0.09547254, -1.789402, 1, 1, 1, 1, 1,
-0.6747872, 0.4068349, -1.716892, 1, 1, 1, 1, 1,
-0.6746468, -0.8906389, -3.074966, 1, 1, 1, 1, 1,
-0.674322, 0.2854299, -1.922356, 1, 1, 1, 1, 1,
-0.6707727, -1.181642, -3.674673, 1, 1, 1, 1, 1,
-0.6703799, 1.207387, -0.6119958, 1, 1, 1, 1, 1,
-0.6578143, 1.590934, -1.018356, 0, 0, 1, 1, 1,
-0.6569348, -0.1939397, -1.787472, 1, 0, 0, 1, 1,
-0.6544676, -1.403178, -3.114239, 1, 0, 0, 1, 1,
-0.6534402, 0.4386183, -1.077518, 1, 0, 0, 1, 1,
-0.6449674, 0.433591, 0.07694876, 1, 0, 0, 1, 1,
-0.6376397, -0.4777602, -1.422051, 1, 0, 0, 1, 1,
-0.6286036, -0.9368575, -4.508455, 0, 0, 0, 1, 1,
-0.6268248, -2.820336, -2.80856, 0, 0, 0, 1, 1,
-0.6263853, -1.028941, -2.925371, 0, 0, 0, 1, 1,
-0.6260319, -0.4937721, -1.196552, 0, 0, 0, 1, 1,
-0.6225499, -1.058008, -2.408677, 0, 0, 0, 1, 1,
-0.6151892, -0.2799169, -0.9531043, 0, 0, 0, 1, 1,
-0.6129404, -0.1854287, -2.708383, 0, 0, 0, 1, 1,
-0.6110577, 0.583334, -1.456933, 1, 1, 1, 1, 1,
-0.6083777, -0.454539, -4.229417, 1, 1, 1, 1, 1,
-0.6075358, 0.3286636, 0.1224263, 1, 1, 1, 1, 1,
-0.6074424, -1.099241, -3.345287, 1, 1, 1, 1, 1,
-0.60529, -0.8361123, -3.243316, 1, 1, 1, 1, 1,
-0.6023211, 0.3043654, -1.086043, 1, 1, 1, 1, 1,
-0.6017249, 0.2998801, -3.251649, 1, 1, 1, 1, 1,
-0.5959794, -0.5469261, -1.911608, 1, 1, 1, 1, 1,
-0.5941112, -1.039158, -2.682854, 1, 1, 1, 1, 1,
-0.5932976, 0.2404232, -0.9491597, 1, 1, 1, 1, 1,
-0.5902788, 2.337266, -0.7736884, 1, 1, 1, 1, 1,
-0.5880496, 0.05311506, -1.678328, 1, 1, 1, 1, 1,
-0.5856347, -0.5058469, -2.937459, 1, 1, 1, 1, 1,
-0.5848449, -1.415485, -3.307105, 1, 1, 1, 1, 1,
-0.5824653, -0.8835304, -4.981535, 1, 1, 1, 1, 1,
-0.5815957, 0.09087959, -0.5230187, 0, 0, 1, 1, 1,
-0.5805168, -1.448875, -3.378051, 1, 0, 0, 1, 1,
-0.5741266, 0.01719237, -1.724357, 1, 0, 0, 1, 1,
-0.5711364, -1.785836, -1.969944, 1, 0, 0, 1, 1,
-0.5706814, -0.3305486, -1.843313, 1, 0, 0, 1, 1,
-0.5700512, 0.2102195, -2.360989, 1, 0, 0, 1, 1,
-0.5691187, 0.8185822, 0.4436941, 0, 0, 0, 1, 1,
-0.5646099, -0.5155942, -0.657902, 0, 0, 0, 1, 1,
-0.5634605, -0.4064283, -1.780049, 0, 0, 0, 1, 1,
-0.5627547, 1.030921, -0.4839024, 0, 0, 0, 1, 1,
-0.5557789, 0.6212717, -1.860231, 0, 0, 0, 1, 1,
-0.5549585, 1.323237, 0.6780396, 0, 0, 0, 1, 1,
-0.5520864, -1.154153, -2.546767, 0, 0, 0, 1, 1,
-0.5514217, 0.6196277, 0.7403303, 1, 1, 1, 1, 1,
-0.5505475, -1.962557, -2.272188, 1, 1, 1, 1, 1,
-0.5490364, 0.1092943, -1.826888, 1, 1, 1, 1, 1,
-0.5486723, -0.2643929, -0.732951, 1, 1, 1, 1, 1,
-0.5458456, -0.1194298, -1.415327, 1, 1, 1, 1, 1,
-0.5445146, 0.7234126, -1.155964, 1, 1, 1, 1, 1,
-0.5393069, -0.7807728, -3.8144, 1, 1, 1, 1, 1,
-0.5359048, 0.02846819, -0.5678797, 1, 1, 1, 1, 1,
-0.5317612, 1.429241, -1.694881, 1, 1, 1, 1, 1,
-0.5223667, 0.8551587, -1.111459, 1, 1, 1, 1, 1,
-0.5206449, -0.5727142, -1.385357, 1, 1, 1, 1, 1,
-0.5143253, -0.1941189, -1.311442, 1, 1, 1, 1, 1,
-0.5119761, 0.5642645, -2.123853, 1, 1, 1, 1, 1,
-0.5104884, -0.003915337, -0.4990233, 1, 1, 1, 1, 1,
-0.5056502, 0.3566292, -1.498817, 1, 1, 1, 1, 1,
-0.5025491, 0.5554168, -1.642027, 0, 0, 1, 1, 1,
-0.5009487, 0.3208627, -1.068941, 1, 0, 0, 1, 1,
-0.5002394, 0.4201067, -0.9917625, 1, 0, 0, 1, 1,
-0.4989388, -1.283249, -3.483635, 1, 0, 0, 1, 1,
-0.4966045, -0.521715, -3.698771, 1, 0, 0, 1, 1,
-0.4954583, 1.63631, 0.4878659, 1, 0, 0, 1, 1,
-0.4903046, -2.463037, -2.722175, 0, 0, 0, 1, 1,
-0.4874183, -1.093682, -3.286454, 0, 0, 0, 1, 1,
-0.4867091, -0.8483738, -3.97432, 0, 0, 0, 1, 1,
-0.4844552, -0.2476044, -1.678328, 0, 0, 0, 1, 1,
-0.4813971, 0.1339169, -2.274078, 0, 0, 0, 1, 1,
-0.4805468, 0.4731377, -2.613104, 0, 0, 0, 1, 1,
-0.4798691, 0.9921491, 0.3803469, 0, 0, 0, 1, 1,
-0.476671, 0.6777928, 0.1112621, 1, 1, 1, 1, 1,
-0.476156, 1.002391, -2.925221, 1, 1, 1, 1, 1,
-0.4715333, 0.1971691, -0.3266902, 1, 1, 1, 1, 1,
-0.4642575, -1.771006, -3.236388, 1, 1, 1, 1, 1,
-0.4528352, -1.046528, -3.282318, 1, 1, 1, 1, 1,
-0.4521277, -1.443001, -3.597578, 1, 1, 1, 1, 1,
-0.4515418, -0.02167312, -1.749342, 1, 1, 1, 1, 1,
-0.4478486, 1.33715, 1.480111, 1, 1, 1, 1, 1,
-0.4444568, 0.5916322, -0.4471475, 1, 1, 1, 1, 1,
-0.4415696, 0.2760381, -1.181645, 1, 1, 1, 1, 1,
-0.4395073, 0.8960595, -1.616384, 1, 1, 1, 1, 1,
-0.4345119, -0.02375517, 0.0503975, 1, 1, 1, 1, 1,
-0.4321111, 0.6746995, -0.2672721, 1, 1, 1, 1, 1,
-0.4305496, 0.0003231654, -1.521476, 1, 1, 1, 1, 1,
-0.426504, 0.1980331, -0.8810623, 1, 1, 1, 1, 1,
-0.4260977, -1.017322, -2.299244, 0, 0, 1, 1, 1,
-0.4180476, -0.2055836, -1.257614, 1, 0, 0, 1, 1,
-0.415823, 0.6485566, -1.522997, 1, 0, 0, 1, 1,
-0.4147313, 0.4510938, -1.284064, 1, 0, 0, 1, 1,
-0.4136432, 1.059446, -0.51463, 1, 0, 0, 1, 1,
-0.4098234, -0.2836324, -1.418265, 1, 0, 0, 1, 1,
-0.409705, -1.017051, -3.181933, 0, 0, 0, 1, 1,
-0.4091305, 1.467921, -0.08858261, 0, 0, 0, 1, 1,
-0.4069454, -0.7908556, -4.472075, 0, 0, 0, 1, 1,
-0.4033881, -0.459923, -2.955684, 0, 0, 0, 1, 1,
-0.3991145, -0.9956041, -2.66415, 0, 0, 0, 1, 1,
-0.3983427, -0.5514083, -2.565946, 0, 0, 0, 1, 1,
-0.3973467, -0.3809918, -1.977845, 0, 0, 0, 1, 1,
-0.3930071, -0.3379544, -2.904186, 1, 1, 1, 1, 1,
-0.3866025, -1.329749, -2.420891, 1, 1, 1, 1, 1,
-0.3827482, 0.3209989, 0.898979, 1, 1, 1, 1, 1,
-0.3799903, -0.1420995, -3.216001, 1, 1, 1, 1, 1,
-0.3797868, -1.640596, -2.283422, 1, 1, 1, 1, 1,
-0.3795575, 1.003273, 0.02150431, 1, 1, 1, 1, 1,
-0.3777013, 0.3109985, -0.2008716, 1, 1, 1, 1, 1,
-0.3776624, -2.430986, -2.474815, 1, 1, 1, 1, 1,
-0.3754945, 1.347012, -0.5913622, 1, 1, 1, 1, 1,
-0.3672559, -2.094364, -3.219871, 1, 1, 1, 1, 1,
-0.3641436, -1.861755, -1.946639, 1, 1, 1, 1, 1,
-0.3635942, -0.2860612, -1.07088, 1, 1, 1, 1, 1,
-0.3626953, 2.70443, 0.2917305, 1, 1, 1, 1, 1,
-0.3567944, -1.102456, -3.459946, 1, 1, 1, 1, 1,
-0.356636, -0.1595779, 0.06763181, 1, 1, 1, 1, 1,
-0.3555317, -0.7925139, -3.344328, 0, 0, 1, 1, 1,
-0.3550378, 0.8779544, -0.216474, 1, 0, 0, 1, 1,
-0.352772, -0.3457215, -2.602675, 1, 0, 0, 1, 1,
-0.3406957, 0.6452749, -1.115577, 1, 0, 0, 1, 1,
-0.3396404, -0.4252266, -3.422874, 1, 0, 0, 1, 1,
-0.3394652, -0.1662986, -2.078904, 1, 0, 0, 1, 1,
-0.338565, 1.955939, 1.428806, 0, 0, 0, 1, 1,
-0.326744, -0.6370219, -3.517794, 0, 0, 0, 1, 1,
-0.3238821, -0.1465331, -2.066875, 0, 0, 0, 1, 1,
-0.3201108, -0.07691196, 0.1957842, 0, 0, 0, 1, 1,
-0.3187332, 0.5432269, -0.4845945, 0, 0, 0, 1, 1,
-0.3139657, -0.1044699, -0.6669635, 0, 0, 0, 1, 1,
-0.3135635, 0.09204889, -2.414846, 0, 0, 0, 1, 1,
-0.3028007, -1.529929, -3.267909, 1, 1, 1, 1, 1,
-0.2990347, -0.5978557, -3.003352, 1, 1, 1, 1, 1,
-0.2908327, -0.9839669, -3.278484, 1, 1, 1, 1, 1,
-0.2876797, -0.4922991, -2.451231, 1, 1, 1, 1, 1,
-0.2875486, 0.4551795, -2.331867, 1, 1, 1, 1, 1,
-0.2811729, -0.8143664, -4.837851, 1, 1, 1, 1, 1,
-0.2690945, -1.233135, -2.567328, 1, 1, 1, 1, 1,
-0.2680825, 0.3307883, -0.928884, 1, 1, 1, 1, 1,
-0.2678104, 0.6375335, -0.2876665, 1, 1, 1, 1, 1,
-0.2610576, 1.618468, -0.06967156, 1, 1, 1, 1, 1,
-0.2581276, 0.501804, -0.4301808, 1, 1, 1, 1, 1,
-0.2565835, -0.01388099, -1.572701, 1, 1, 1, 1, 1,
-0.2560407, 1.199413, 0.1558058, 1, 1, 1, 1, 1,
-0.251883, -0.8830895, -3.157269, 1, 1, 1, 1, 1,
-0.249905, 0.3732387, 0.3154643, 1, 1, 1, 1, 1,
-0.2498549, 0.6612673, -2.621839, 0, 0, 1, 1, 1,
-0.2372015, 0.8197192, -0.5655519, 1, 0, 0, 1, 1,
-0.2362616, 0.08697953, -1.165322, 1, 0, 0, 1, 1,
-0.2346077, -1.339537, -3.677991, 1, 0, 0, 1, 1,
-0.2340752, 0.7061642, -0.4825445, 1, 0, 0, 1, 1,
-0.2336714, 2.063772, 0.00517013, 1, 0, 0, 1, 1,
-0.2312334, 1.308696, -0.1958075, 0, 0, 0, 1, 1,
-0.2296697, -0.7194182, -1.097893, 0, 0, 0, 1, 1,
-0.2278524, -1.150676, -3.606675, 0, 0, 0, 1, 1,
-0.2261911, -0.213357, -1.641448, 0, 0, 0, 1, 1,
-0.2259807, 1.321615, -0.2233724, 0, 0, 0, 1, 1,
-0.2223274, 1.746973, -0.005328284, 0, 0, 0, 1, 1,
-0.2219961, 0.3798046, -0.7542614, 0, 0, 0, 1, 1,
-0.22059, -1.243162, -1.915549, 1, 1, 1, 1, 1,
-0.2190543, 0.1022947, -1.259268, 1, 1, 1, 1, 1,
-0.2174774, 1.351252, 0.6216631, 1, 1, 1, 1, 1,
-0.2168859, -0.5268087, -4.181436, 1, 1, 1, 1, 1,
-0.2126241, -0.9265199, -3.282862, 1, 1, 1, 1, 1,
-0.2125517, 0.3036192, -1.135949, 1, 1, 1, 1, 1,
-0.2106112, -0.1426134, -1.18597, 1, 1, 1, 1, 1,
-0.2048216, -1.106396, -2.584358, 1, 1, 1, 1, 1,
-0.2041885, 0.4501104, -0.3392698, 1, 1, 1, 1, 1,
-0.2028928, 1.024031, -0.5580537, 1, 1, 1, 1, 1,
-0.202669, -2.732515, -4.52059, 1, 1, 1, 1, 1,
-0.1975373, 0.9745994, -1.149781, 1, 1, 1, 1, 1,
-0.190898, -0.4117663, -3.640375, 1, 1, 1, 1, 1,
-0.1899692, 0.8854854, -0.230528, 1, 1, 1, 1, 1,
-0.1868143, -1.12378, -3.77537, 1, 1, 1, 1, 1,
-0.1851966, -0.8000752, -3.357399, 0, 0, 1, 1, 1,
-0.1833124, 0.5239814, -0.9063472, 1, 0, 0, 1, 1,
-0.1813586, -0.2167286, -3.79514, 1, 0, 0, 1, 1,
-0.1751746, -1.708229, -3.288172, 1, 0, 0, 1, 1,
-0.169654, -0.5499466, -3.733584, 1, 0, 0, 1, 1,
-0.1671924, -1.243, -3.669155, 1, 0, 0, 1, 1,
-0.1624962, -0.7752425, -2.834695, 0, 0, 0, 1, 1,
-0.1615219, 0.9205566, -0.07828569, 0, 0, 0, 1, 1,
-0.1602381, -0.2107094, -2.038714, 0, 0, 0, 1, 1,
-0.1600779, 0.03898516, -1.382292, 0, 0, 0, 1, 1,
-0.1598439, 0.2755596, -0.2627305, 0, 0, 0, 1, 1,
-0.1558602, -1.121311, -5.070745, 0, 0, 0, 1, 1,
-0.1547479, 0.5710616, 0.3637159, 0, 0, 0, 1, 1,
-0.1518077, 1.795602, -1.572534, 1, 1, 1, 1, 1,
-0.150001, 0.5894802, -0.04942619, 1, 1, 1, 1, 1,
-0.1491803, 0.6229942, -0.2801869, 1, 1, 1, 1, 1,
-0.1469171, -1.575792, -4.332643, 1, 1, 1, 1, 1,
-0.1452922, 0.512352, 0.4382527, 1, 1, 1, 1, 1,
-0.1430155, -0.07831125, -0.3167838, 1, 1, 1, 1, 1,
-0.1408768, -0.2396324, -0.5911317, 1, 1, 1, 1, 1,
-0.1378983, -1.468054, -3.99746, 1, 1, 1, 1, 1,
-0.1349421, -1.39961, -3.875444, 1, 1, 1, 1, 1,
-0.1319233, 0.8971965, 0.9257661, 1, 1, 1, 1, 1,
-0.124809, -0.5064825, -3.79809, 1, 1, 1, 1, 1,
-0.121718, 0.3927633, 0.3989765, 1, 1, 1, 1, 1,
-0.1197773, -0.2729704, -3.397418, 1, 1, 1, 1, 1,
-0.1190562, 0.02362987, -1.146791, 1, 1, 1, 1, 1,
-0.1167917, 0.6174707, 0.4544152, 1, 1, 1, 1, 1,
-0.1154548, -0.5569175, -2.009072, 0, 0, 1, 1, 1,
-0.1101561, -0.9436816, -3.097067, 1, 0, 0, 1, 1,
-0.1093412, 0.7983474, -0.4489212, 1, 0, 0, 1, 1,
-0.1050255, -1.075569, -1.472113, 1, 0, 0, 1, 1,
-0.1025414, -1.656053, -3.351486, 1, 0, 0, 1, 1,
-0.1023216, -2.067688, -1.730305, 1, 0, 0, 1, 1,
-0.1005191, 2.688901, -1.114093, 0, 0, 0, 1, 1,
-0.09801367, 1.644883, -1.599326, 0, 0, 0, 1, 1,
-0.08981922, -0.6192141, -1.838923, 0, 0, 0, 1, 1,
-0.08481478, -0.4772459, -1.860803, 0, 0, 0, 1, 1,
-0.08347131, -0.4462863, -1.692516, 0, 0, 0, 1, 1,
-0.08150817, -0.7075463, -3.187867, 0, 0, 0, 1, 1,
-0.075631, 0.3752112, -2.309952, 0, 0, 0, 1, 1,
-0.07392094, -1.873081, -2.23913, 1, 1, 1, 1, 1,
-0.07089502, -0.1930962, -1.412636, 1, 1, 1, 1, 1,
-0.07035437, 0.05662172, -1.022963, 1, 1, 1, 1, 1,
-0.06850043, -0.02077825, -2.319707, 1, 1, 1, 1, 1,
-0.06794894, -1.824363, -2.658398, 1, 1, 1, 1, 1,
-0.06336465, -0.1013338, -3.765171, 1, 1, 1, 1, 1,
-0.06300072, 1.897982, 0.2846819, 1, 1, 1, 1, 1,
-0.06267926, -1.147782, -3.725514, 1, 1, 1, 1, 1,
-0.06250995, 0.1453446, -1.194425, 1, 1, 1, 1, 1,
-0.05795045, 0.377045, 1.149749, 1, 1, 1, 1, 1,
-0.05688142, -0.4864787, -2.256497, 1, 1, 1, 1, 1,
-0.05671563, -1.064625, -4.467336, 1, 1, 1, 1, 1,
-0.05414262, 0.2236134, -1.380951, 1, 1, 1, 1, 1,
-0.05195554, -1.004775, -1.841906, 1, 1, 1, 1, 1,
-0.04888652, 0.04202948, 0.8513986, 1, 1, 1, 1, 1,
-0.0450165, -1.441065, -4.558775, 0, 0, 1, 1, 1,
-0.04422851, -0.06942382, -2.13224, 1, 0, 0, 1, 1,
-0.04148551, 0.8992838, 0.4517396, 1, 0, 0, 1, 1,
-0.03751834, 1.267197, -0.459748, 1, 0, 0, 1, 1,
-0.03707204, -2.060881, -3.094026, 1, 0, 0, 1, 1,
-0.0293211, -0.602017, -3.544341, 1, 0, 0, 1, 1,
-0.02677037, -0.1071059, -4.831352, 0, 0, 0, 1, 1,
-0.02606901, 0.1848773, -0.536793, 0, 0, 0, 1, 1,
-0.02521419, -0.7058336, -3.926323, 0, 0, 0, 1, 1,
-0.02270955, -0.3704544, -2.355067, 0, 0, 0, 1, 1,
-0.01901111, -0.1404508, -1.337948, 0, 0, 0, 1, 1,
-0.01882264, -1.692692, -3.328196, 0, 0, 0, 1, 1,
-0.01593199, -0.3826984, -2.556979, 0, 0, 0, 1, 1,
-0.01562216, -0.1053818, -4.48451, 1, 1, 1, 1, 1,
-0.01316918, 0.5741951, -0.5465112, 1, 1, 1, 1, 1,
-0.01220385, -1.470402, -4.010757, 1, 1, 1, 1, 1,
-0.0103181, 0.4145121, -0.1637792, 1, 1, 1, 1, 1,
-0.01014414, -0.5404714, -4.203964, 1, 1, 1, 1, 1,
-0.008567242, -0.9697397, -4.961538, 1, 1, 1, 1, 1,
-0.007751802, -0.3977582, -4.548507, 1, 1, 1, 1, 1,
-0.003994564, 0.4417052, 1.06128, 1, 1, 1, 1, 1,
-0.001327107, 0.4310768, -1.046273, 1, 1, 1, 1, 1,
0.003236083, -0.330031, 2.627298, 1, 1, 1, 1, 1,
0.008613864, -0.6113922, 3.420406, 1, 1, 1, 1, 1,
0.009289353, -0.7701095, 3.388182, 1, 1, 1, 1, 1,
0.009479899, -1.348146, 3.124259, 1, 1, 1, 1, 1,
0.01059628, 0.4141265, 0.5610098, 1, 1, 1, 1, 1,
0.02262135, 0.6432884, -0.7091833, 1, 1, 1, 1, 1,
0.02530939, 1.043256, -0.8761691, 0, 0, 1, 1, 1,
0.02960918, 0.5694507, -3.104231, 1, 0, 0, 1, 1,
0.03869982, -1.082197, 2.983684, 1, 0, 0, 1, 1,
0.04498058, -0.5727061, 3.784626, 1, 0, 0, 1, 1,
0.04513716, 1.041931, -0.4579935, 1, 0, 0, 1, 1,
0.04521441, -2.473797, 3.751523, 1, 0, 0, 1, 1,
0.04886404, -1.042896, 1.414775, 0, 0, 0, 1, 1,
0.04996761, -0.7213132, 2.196935, 0, 0, 0, 1, 1,
0.05016144, -0.4432516, 5.3007, 0, 0, 0, 1, 1,
0.05283862, -0.9949927, 1.857725, 0, 0, 0, 1, 1,
0.05384278, -1.836908, 3.558384, 0, 0, 0, 1, 1,
0.06497291, -0.2440373, 4.672374, 0, 0, 0, 1, 1,
0.06531706, 1.315264, -0.2487552, 0, 0, 0, 1, 1,
0.06700067, -0.7427164, 3.110023, 1, 1, 1, 1, 1,
0.06794167, -0.3664288, 3.648979, 1, 1, 1, 1, 1,
0.07260065, -1.058294, 1.93462, 1, 1, 1, 1, 1,
0.07522145, 1.18516, -0.908347, 1, 1, 1, 1, 1,
0.08298984, 0.1452542, 0.2051431, 1, 1, 1, 1, 1,
0.08948074, -0.7249686, 4.734817, 1, 1, 1, 1, 1,
0.09089258, 0.6958174, 0.6298493, 1, 1, 1, 1, 1,
0.09182356, 1.52756, 1.32304, 1, 1, 1, 1, 1,
0.09580296, -0.1989075, 3.043081, 1, 1, 1, 1, 1,
0.09611338, -0.3327948, 1.725453, 1, 1, 1, 1, 1,
0.09681375, 0.3982841, 0.7184785, 1, 1, 1, 1, 1,
0.1001392, 0.5475454, 1.620412, 1, 1, 1, 1, 1,
0.1013486, -0.7608249, 1.458878, 1, 1, 1, 1, 1,
0.1079702, 0.6932254, 0.3658154, 1, 1, 1, 1, 1,
0.1082307, -0.02298536, 0.1233824, 1, 1, 1, 1, 1,
0.1105298, -1.171451, 1.753245, 0, 0, 1, 1, 1,
0.1109716, -1.275726, 3.180352, 1, 0, 0, 1, 1,
0.1115207, 0.6964689, 0.1365712, 1, 0, 0, 1, 1,
0.1126608, -0.2153351, 2.495292, 1, 0, 0, 1, 1,
0.1139061, 0.9765471, -0.03739905, 1, 0, 0, 1, 1,
0.1231373, -0.03807949, 1.530405, 1, 0, 0, 1, 1,
0.1236989, 2.523408, 0.7428533, 0, 0, 0, 1, 1,
0.1260123, 0.7426116, 1.338222, 0, 0, 0, 1, 1,
0.129219, -0.05666809, 2.971179, 0, 0, 0, 1, 1,
0.1340155, -1.305292, 1.552959, 0, 0, 0, 1, 1,
0.1369138, 0.1327205, 0.308032, 0, 0, 0, 1, 1,
0.1372923, -1.206532, 4.623825, 0, 0, 0, 1, 1,
0.1379525, 0.542888, -0.4438863, 0, 0, 0, 1, 1,
0.1395661, 0.3454758, -0.5876837, 1, 1, 1, 1, 1,
0.1413985, -0.3164189, 3.584252, 1, 1, 1, 1, 1,
0.142189, 1.194988, 0.1150811, 1, 1, 1, 1, 1,
0.1458568, -0.7415881, 2.411594, 1, 1, 1, 1, 1,
0.1528288, 0.3987894, 0.3890144, 1, 1, 1, 1, 1,
0.1537273, 0.4424727, -1.293254, 1, 1, 1, 1, 1,
0.1549236, -0.05999985, 2.920192, 1, 1, 1, 1, 1,
0.1564634, -0.4465549, 3.064085, 1, 1, 1, 1, 1,
0.1581165, -1.714371, 2.713287, 1, 1, 1, 1, 1,
0.159747, 1.295581, -0.2543854, 1, 1, 1, 1, 1,
0.1632071, -0.2698582, 0.9166277, 1, 1, 1, 1, 1,
0.1668934, 0.9412032, -0.3768068, 1, 1, 1, 1, 1,
0.1680786, -0.1039151, 1.108823, 1, 1, 1, 1, 1,
0.1684564, -2.729466, 3.059741, 1, 1, 1, 1, 1,
0.1688774, 0.9040155, 1.388753, 1, 1, 1, 1, 1,
0.1696599, 1.123755, 0.04279438, 0, 0, 1, 1, 1,
0.1759474, -1.086078, 3.728993, 1, 0, 0, 1, 1,
0.1761619, -0.4622089, 3.380673, 1, 0, 0, 1, 1,
0.178142, 2.663449, 0.8655024, 1, 0, 0, 1, 1,
0.1819248, -1.269849, 2.262721, 1, 0, 0, 1, 1,
0.1849655, -1.375257, 4.477657, 1, 0, 0, 1, 1,
0.1920136, -0.9163392, 4.290344, 0, 0, 0, 1, 1,
0.1934427, -0.3400022, 3.783388, 0, 0, 0, 1, 1,
0.1991633, -0.3290308, 3.908115, 0, 0, 0, 1, 1,
0.2063136, 1.716737, 0.2761332, 0, 0, 0, 1, 1,
0.2106983, -2.430778, 4.530756, 0, 0, 0, 1, 1,
0.2122076, -1.660343, 3.249375, 0, 0, 0, 1, 1,
0.2152424, 1.057582, 0.7234519, 0, 0, 0, 1, 1,
0.2196673, -0.6931353, 3.270696, 1, 1, 1, 1, 1,
0.2230907, -0.935102, 3.617389, 1, 1, 1, 1, 1,
0.2253394, -1.506096, 2.772237, 1, 1, 1, 1, 1,
0.2265173, 2.616157, 0.1286749, 1, 1, 1, 1, 1,
0.2318435, 1.398697, 0.9612101, 1, 1, 1, 1, 1,
0.2345081, 0.6065156, 0.7014568, 1, 1, 1, 1, 1,
0.2359309, -0.3839131, 4.043111, 1, 1, 1, 1, 1,
0.2380441, 0.09437971, -0.2206461, 1, 1, 1, 1, 1,
0.2386526, -1.06862, 1.341042, 1, 1, 1, 1, 1,
0.2404757, 1.115311, -0.05821536, 1, 1, 1, 1, 1,
0.2408954, -0.7630878, 2.750502, 1, 1, 1, 1, 1,
0.2424506, -0.5663759, 3.916301, 1, 1, 1, 1, 1,
0.2431355, 1.135024, 0.04848877, 1, 1, 1, 1, 1,
0.2450692, -0.8960959, 3.012385, 1, 1, 1, 1, 1,
0.2511759, 0.4229866, 1.125063, 1, 1, 1, 1, 1,
0.2561375, -0.2705568, 4.944046, 0, 0, 1, 1, 1,
0.2621809, 2.579787, -1.195269, 1, 0, 0, 1, 1,
0.2622867, 0.3893474, 0.7131712, 1, 0, 0, 1, 1,
0.2642423, -0.2882991, 2.744828, 1, 0, 0, 1, 1,
0.2713689, -0.9508506, 1.972396, 1, 0, 0, 1, 1,
0.2830579, -0.5355965, 0.4567735, 1, 0, 0, 1, 1,
0.283631, 0.8292361, 0.7927151, 0, 0, 0, 1, 1,
0.2845153, -0.9374275, 1.695815, 0, 0, 0, 1, 1,
0.2849864, 1.13564, -0.02638356, 0, 0, 0, 1, 1,
0.2855903, -1.569325, 2.91697, 0, 0, 0, 1, 1,
0.2869033, -0.1130936, 3.019281, 0, 0, 0, 1, 1,
0.2869563, 1.424807, -0.4398016, 0, 0, 0, 1, 1,
0.2874896, -1.682004, 3.186619, 0, 0, 0, 1, 1,
0.2893598, 1.05478, 1.158404, 1, 1, 1, 1, 1,
0.2918656, 0.1597142, 0.8924495, 1, 1, 1, 1, 1,
0.2925774, -1.916381, 3.907992, 1, 1, 1, 1, 1,
0.2970166, -1.156455, 4.594787, 1, 1, 1, 1, 1,
0.2974873, -0.3158487, 3.0339, 1, 1, 1, 1, 1,
0.2980588, 1.367287, -0.4806549, 1, 1, 1, 1, 1,
0.2999576, -1.440143, 3.488492, 1, 1, 1, 1, 1,
0.3008198, -0.1208751, 2.007788, 1, 1, 1, 1, 1,
0.301313, -1.295988, 1.92848, 1, 1, 1, 1, 1,
0.3013847, 1.785108, 1.045551, 1, 1, 1, 1, 1,
0.3017101, 0.004499591, 2.576428, 1, 1, 1, 1, 1,
0.302091, 1.909976, -0.3977035, 1, 1, 1, 1, 1,
0.302519, -0.2985853, 2.179279, 1, 1, 1, 1, 1,
0.3050176, 0.3370225, -0.1807791, 1, 1, 1, 1, 1,
0.309495, -1.194059, 2.329767, 1, 1, 1, 1, 1,
0.3170388, -0.1501871, 4.573642, 0, 0, 1, 1, 1,
0.3186107, -0.2049893, 2.305128, 1, 0, 0, 1, 1,
0.3254081, 1.402847, 1.211735, 1, 0, 0, 1, 1,
0.3288541, -1.008235, 2.717514, 1, 0, 0, 1, 1,
0.3298988, 0.8017352, 0.05736541, 1, 0, 0, 1, 1,
0.3395957, 0.1734445, 1.654548, 1, 0, 0, 1, 1,
0.3426712, -0.9565258, 3.88881, 0, 0, 0, 1, 1,
0.3446485, -0.4209192, 3.538256, 0, 0, 0, 1, 1,
0.3536632, -0.8535312, 1.433561, 0, 0, 0, 1, 1,
0.3539891, 0.9087687, 0.386083, 0, 0, 0, 1, 1,
0.3544267, -0.2996567, 2.679218, 0, 0, 0, 1, 1,
0.3583633, 0.4682887, 0.1997072, 0, 0, 0, 1, 1,
0.3602671, -0.184174, 1.862372, 0, 0, 0, 1, 1,
0.361333, -0.339734, 1.639126, 1, 1, 1, 1, 1,
0.3625827, -0.4579706, 2.972483, 1, 1, 1, 1, 1,
0.362885, -2.544507, 3.917518, 1, 1, 1, 1, 1,
0.3674545, 0.4737066, 0.2527435, 1, 1, 1, 1, 1,
0.369396, -1.965019, 3.070215, 1, 1, 1, 1, 1,
0.3700452, 0.3104398, 1.484454, 1, 1, 1, 1, 1,
0.3744725, -0.7542799, 4.345615, 1, 1, 1, 1, 1,
0.3794647, 0.7733154, -0.6414975, 1, 1, 1, 1, 1,
0.3796047, -1.02826, 2.535932, 1, 1, 1, 1, 1,
0.3820387, -0.549285, 2.802487, 1, 1, 1, 1, 1,
0.3851603, 0.1398998, 0.8384005, 1, 1, 1, 1, 1,
0.388939, 0.4128301, -0.2472693, 1, 1, 1, 1, 1,
0.389199, -0.7271479, 2.726717, 1, 1, 1, 1, 1,
0.389328, -1.952812, 2.503413, 1, 1, 1, 1, 1,
0.3921562, 0.2088189, 1.307862, 1, 1, 1, 1, 1,
0.3946149, -0.793492, 2.175659, 0, 0, 1, 1, 1,
0.3951737, -0.4908926, 2.071645, 1, 0, 0, 1, 1,
0.3965674, 1.64251, 0.5750767, 1, 0, 0, 1, 1,
0.3994312, 0.5243826, -0.8197565, 1, 0, 0, 1, 1,
0.4024879, 0.9137723, -0.05400315, 1, 0, 0, 1, 1,
0.4069981, -1.34304, 3.662272, 1, 0, 0, 1, 1,
0.4080393, -1.334783, 1.080171, 0, 0, 0, 1, 1,
0.4129741, 1.724801, -0.2705993, 0, 0, 0, 1, 1,
0.415102, 1.029417, 0.3530239, 0, 0, 0, 1, 1,
0.4152617, 1.904978, -0.3689599, 0, 0, 0, 1, 1,
0.420586, 0.661173, 0.09077179, 0, 0, 0, 1, 1,
0.4211961, -0.9358191, 2.289239, 0, 0, 0, 1, 1,
0.4257251, 0.3701671, 0.370688, 0, 0, 0, 1, 1,
0.4259126, -0.9928411, 1.770358, 1, 1, 1, 1, 1,
0.4332686, 0.6268359, 0.9836888, 1, 1, 1, 1, 1,
0.438496, 0.5294623, 0.4015954, 1, 1, 1, 1, 1,
0.4388882, 0.8036797, 1.893117, 1, 1, 1, 1, 1,
0.4396398, -1.269042, 1.372344, 1, 1, 1, 1, 1,
0.4421383, 0.7844551, 1.033581, 1, 1, 1, 1, 1,
0.4431888, 2.086324, 0.144824, 1, 1, 1, 1, 1,
0.4436505, -0.2308487, 2.709542, 1, 1, 1, 1, 1,
0.4526355, 1.261693, -0.4627296, 1, 1, 1, 1, 1,
0.4561762, -1.182956, 4.982471, 1, 1, 1, 1, 1,
0.4601892, 0.5013258, 0.9723595, 1, 1, 1, 1, 1,
0.4653991, -0.9176742, 3.03227, 1, 1, 1, 1, 1,
0.4794348, 0.1617384, -0.07862387, 1, 1, 1, 1, 1,
0.4809196, -2.444004, 4.326956, 1, 1, 1, 1, 1,
0.4847377, 0.3787991, 1.546571, 1, 1, 1, 1, 1,
0.4865173, -1.347594, 4.577854, 0, 0, 1, 1, 1,
0.4865296, 0.08800639, 2.461849, 1, 0, 0, 1, 1,
0.4886401, 0.8070335, -0.2539103, 1, 0, 0, 1, 1,
0.4887842, -0.496187, 1.989064, 1, 0, 0, 1, 1,
0.4889067, -0.1463976, 1.825209, 1, 0, 0, 1, 1,
0.4934255, 0.1680354, 0.7440254, 1, 0, 0, 1, 1,
0.4944154, -0.5073256, 2.00381, 0, 0, 0, 1, 1,
0.494577, -0.1825637, 2.499078, 0, 0, 0, 1, 1,
0.4962096, 0.6306227, 0.8141786, 0, 0, 0, 1, 1,
0.496719, 1.759042, 0.9544061, 0, 0, 0, 1, 1,
0.4984816, 1.807278, 0.8163679, 0, 0, 0, 1, 1,
0.5009045, -0.3485171, 2.051869, 0, 0, 0, 1, 1,
0.5009722, -0.1522542, 0.2766153, 0, 0, 0, 1, 1,
0.5023437, -1.298561, 2.74946, 1, 1, 1, 1, 1,
0.5043308, -1.410306, 2.271453, 1, 1, 1, 1, 1,
0.5054476, -0.1667356, 1.828477, 1, 1, 1, 1, 1,
0.5059767, -2.009762, 2.499795, 1, 1, 1, 1, 1,
0.5205061, -0.6505917, 2.423346, 1, 1, 1, 1, 1,
0.52415, -0.7268616, -0.3408838, 1, 1, 1, 1, 1,
0.5303739, -0.02969231, 0.8288259, 1, 1, 1, 1, 1,
0.532715, 0.188051, 2.887929, 1, 1, 1, 1, 1,
0.5408731, 0.6311339, -1.882464, 1, 1, 1, 1, 1,
0.5438249, -0.07663715, 0.899339, 1, 1, 1, 1, 1,
0.5520006, -0.8259847, 1.154332, 1, 1, 1, 1, 1,
0.5542808, 0.70548, 1.837903, 1, 1, 1, 1, 1,
0.5559047, -1.218532, 2.080222, 1, 1, 1, 1, 1,
0.5565914, -1.673954, 4.337995, 1, 1, 1, 1, 1,
0.5584716, -0.4997967, 3.434351, 1, 1, 1, 1, 1,
0.5598979, 1.088073, 0.3963182, 0, 0, 1, 1, 1,
0.5620472, 0.07004624, 2.16962, 1, 0, 0, 1, 1,
0.5631571, -1.905047, 3.039387, 1, 0, 0, 1, 1,
0.5724752, -0.3536828, 1.488078, 1, 0, 0, 1, 1,
0.57641, -1.504227, 3.669684, 1, 0, 0, 1, 1,
0.5777361, 0.5399379, 0.9036884, 1, 0, 0, 1, 1,
0.5796787, 1.965902, 0.8238176, 0, 0, 0, 1, 1,
0.580895, 0.6477188, 1.577798, 0, 0, 0, 1, 1,
0.5820401, -0.6062512, 4.220755, 0, 0, 0, 1, 1,
0.5867913, 1.224155, -1.544421, 0, 0, 0, 1, 1,
0.5887942, 2.174018, -0.6127038, 0, 0, 0, 1, 1,
0.5898609, 0.2771125, 0.8002912, 0, 0, 0, 1, 1,
0.5904675, 0.4325448, -1.316165, 0, 0, 0, 1, 1,
0.5911554, 0.002025051, 1.89065, 1, 1, 1, 1, 1,
0.6009432, 0.8592694, -0.04810699, 1, 1, 1, 1, 1,
0.6074252, 2.012443, 2.188669, 1, 1, 1, 1, 1,
0.6080094, -0.04175451, -0.1993706, 1, 1, 1, 1, 1,
0.617153, 0.1452766, 2.142724, 1, 1, 1, 1, 1,
0.6193104, 0.626475, -0.6469073, 1, 1, 1, 1, 1,
0.6222274, -1.032628, 2.042542, 1, 1, 1, 1, 1,
0.6236093, 0.3599087, 0.05090335, 1, 1, 1, 1, 1,
0.6278389, -0.08017623, 1.389107, 1, 1, 1, 1, 1,
0.6278678, 0.9331136, 1.045768, 1, 1, 1, 1, 1,
0.6357676, -1.24653, 2.300136, 1, 1, 1, 1, 1,
0.63822, 0.2757646, -0.5335437, 1, 1, 1, 1, 1,
0.6399075, 0.4086148, 0.3557326, 1, 1, 1, 1, 1,
0.6427311, -1.433304, 1.707259, 1, 1, 1, 1, 1,
0.646681, 2.380473, 0.2275943, 1, 1, 1, 1, 1,
0.6485814, -0.5430197, 2.978516, 0, 0, 1, 1, 1,
0.6503025, 0.146947, -0.2734441, 1, 0, 0, 1, 1,
0.6514328, -0.5937567, 2.200101, 1, 0, 0, 1, 1,
0.6554471, -0.1508621, 2.075749, 1, 0, 0, 1, 1,
0.6680601, 0.1060285, 1.089674, 1, 0, 0, 1, 1,
0.6690992, -0.5605837, 2.404869, 1, 0, 0, 1, 1,
0.6746056, -2.70204, 1.940513, 0, 0, 0, 1, 1,
0.6755637, 0.3992702, 0.8008213, 0, 0, 0, 1, 1,
0.6760702, 0.5601073, 1.561126, 0, 0, 0, 1, 1,
0.677191, 0.7122383, 0.4078671, 0, 0, 0, 1, 1,
0.6799181, 1.788705, -0.5538015, 0, 0, 0, 1, 1,
0.6807792, 0.585116, 0.298936, 0, 0, 0, 1, 1,
0.6810561, 0.2238682, 0.9461517, 0, 0, 0, 1, 1,
0.6813518, 0.1226308, 1.237335, 1, 1, 1, 1, 1,
0.6814482, -0.8296559, 1.46117, 1, 1, 1, 1, 1,
0.6855309, -0.398668, 2.153954, 1, 1, 1, 1, 1,
0.6885298, -0.1400413, 2.326416, 1, 1, 1, 1, 1,
0.6906064, 0.7954961, 1.459706, 1, 1, 1, 1, 1,
0.6924169, -0.1109393, 0.8755181, 1, 1, 1, 1, 1,
0.6961066, 0.02415431, 1.121563, 1, 1, 1, 1, 1,
0.704282, -0.1027833, 3.29812, 1, 1, 1, 1, 1,
0.7097822, -0.2936661, 2.620359, 1, 1, 1, 1, 1,
0.7113206, -0.5739641, 2.520454, 1, 1, 1, 1, 1,
0.713613, 1.044997, -1.183344, 1, 1, 1, 1, 1,
0.713989, 0.7114398, 0.7653925, 1, 1, 1, 1, 1,
0.7143884, -0.9273837, 2.002783, 1, 1, 1, 1, 1,
0.7155672, -1.432173, 3.920655, 1, 1, 1, 1, 1,
0.7170255, 0.4016169, -0.292224, 1, 1, 1, 1, 1,
0.7170556, 0.09701083, 1.225021, 0, 0, 1, 1, 1,
0.7179822, 1.886657, -0.009320795, 1, 0, 0, 1, 1,
0.7220044, 0.7347548, -0.07703341, 1, 0, 0, 1, 1,
0.7239292, -0.3767451, 2.521779, 1, 0, 0, 1, 1,
0.7256693, -0.06210635, 2.829864, 1, 0, 0, 1, 1,
0.7266048, 0.7085519, 0.469747, 1, 0, 0, 1, 1,
0.7315054, 0.5205234, 0.334898, 0, 0, 0, 1, 1,
0.7328317, -0.3891543, 4.342534, 0, 0, 0, 1, 1,
0.7336527, 0.5422058, 1.205894, 0, 0, 0, 1, 1,
0.7359325, -0.09752339, 2.76809, 0, 0, 0, 1, 1,
0.7383239, 1.171764, -0.01362517, 0, 0, 0, 1, 1,
0.7383819, 0.05942699, 1.157555, 0, 0, 0, 1, 1,
0.7401593, 0.03203177, 0.1295166, 0, 0, 0, 1, 1,
0.7405518, 1.326876, -0.2865771, 1, 1, 1, 1, 1,
0.74454, 2.151529, 0.3688053, 1, 1, 1, 1, 1,
0.745907, 1.212765, 0.5423828, 1, 1, 1, 1, 1,
0.751572, 1.416592, 0.1610826, 1, 1, 1, 1, 1,
0.7546451, 0.8608655, 1.113482, 1, 1, 1, 1, 1,
0.7566394, -0.4184045, 1.018349, 1, 1, 1, 1, 1,
0.7587402, 0.8866572, -0.5577425, 1, 1, 1, 1, 1,
0.7631238, -1.565927, 2.595399, 1, 1, 1, 1, 1,
0.7728776, 1.348362, 0.3369198, 1, 1, 1, 1, 1,
0.7729365, -0.6097587, 2.118857, 1, 1, 1, 1, 1,
0.7782971, 0.03349431, 1.157156, 1, 1, 1, 1, 1,
0.7785414, 1.333074, -0.2566868, 1, 1, 1, 1, 1,
0.7853647, 1.315147, 0.06573683, 1, 1, 1, 1, 1,
0.7859111, -0.4298219, 4.148033, 1, 1, 1, 1, 1,
0.7866223, -1.163014, 2.82205, 1, 1, 1, 1, 1,
0.7940623, 2.471594, 0.6213319, 0, 0, 1, 1, 1,
0.7971995, 0.4061223, 0.5039538, 1, 0, 0, 1, 1,
0.7972569, 0.8380718, 0.168681, 1, 0, 0, 1, 1,
0.8013549, -0.5066117, 2.861913, 1, 0, 0, 1, 1,
0.8019419, 0.7601143, 1.641745, 1, 0, 0, 1, 1,
0.8055958, 0.4305649, 0.9367475, 1, 0, 0, 1, 1,
0.8088801, 0.3594792, 1.10512, 0, 0, 0, 1, 1,
0.8189691, 0.8090325, 1.449969, 0, 0, 0, 1, 1,
0.8220885, -1.522816, 2.533465, 0, 0, 0, 1, 1,
0.8258671, 0.1587653, 1.262786, 0, 0, 0, 1, 1,
0.828817, 0.2803445, 3.69435, 0, 0, 0, 1, 1,
0.8321584, -0.3464253, 1.368634, 0, 0, 0, 1, 1,
0.8397076, 0.216837, 1.878541, 0, 0, 0, 1, 1,
0.85478, 0.1935198, 1.378332, 1, 1, 1, 1, 1,
0.8548158, -0.4060574, 3.999135, 1, 1, 1, 1, 1,
0.8551184, -0.6551057, 2.214509, 1, 1, 1, 1, 1,
0.8604813, -1.112473, 2.479338, 1, 1, 1, 1, 1,
0.8617819, -0.8308699, 3.148997, 1, 1, 1, 1, 1,
0.8645647, 0.8850524, -0.4797487, 1, 1, 1, 1, 1,
0.8686092, 0.131203, 0.3602933, 1, 1, 1, 1, 1,
0.875792, 1.041132, 0.2188802, 1, 1, 1, 1, 1,
0.8786429, 1.204535, 0.9357565, 1, 1, 1, 1, 1,
0.8843226, -0.8393313, 2.036138, 1, 1, 1, 1, 1,
0.8869736, 1.25643, 0.5589142, 1, 1, 1, 1, 1,
0.8902518, -0.579496, 3.087769, 1, 1, 1, 1, 1,
0.8966501, -1.22567, 2.950023, 1, 1, 1, 1, 1,
0.8972831, 0.4024754, -0.01679726, 1, 1, 1, 1, 1,
0.9043631, 0.8366179, 0.3403769, 1, 1, 1, 1, 1,
0.9068924, 0.2292661, 0.2404205, 0, 0, 1, 1, 1,
0.9088252, -0.644099, 4.15537, 1, 0, 0, 1, 1,
0.9091064, 1.102053, 1.635441, 1, 0, 0, 1, 1,
0.9115181, -2.276497, 3.278205, 1, 0, 0, 1, 1,
0.9199072, 0.3873935, 1.867019, 1, 0, 0, 1, 1,
0.9243807, -0.07005161, 2.505163, 1, 0, 0, 1, 1,
0.9247908, -1.126554, 1.759779, 0, 0, 0, 1, 1,
0.9289402, -0.6987698, 1.331742, 0, 0, 0, 1, 1,
0.9290597, 0.5073217, 0.5495373, 0, 0, 0, 1, 1,
0.929558, 1.434938, -0.3415543, 0, 0, 0, 1, 1,
0.9296682, 0.6464011, 1.446687, 0, 0, 0, 1, 1,
0.9316127, 0.7579234, -1.479769, 0, 0, 0, 1, 1,
0.9341618, -0.2377353, 2.069119, 0, 0, 0, 1, 1,
0.9343451, -1.883399, 3.583515, 1, 1, 1, 1, 1,
0.9351172, -0.2807151, 2.101915, 1, 1, 1, 1, 1,
0.9351705, 1.314866, 0.6753837, 1, 1, 1, 1, 1,
0.9375815, 0.4336627, 2.58599, 1, 1, 1, 1, 1,
0.9389018, 0.6891418, 0.4157533, 1, 1, 1, 1, 1,
0.940195, 0.1103534, 3.618685, 1, 1, 1, 1, 1,
0.9429352, -0.1567694, 1.817583, 1, 1, 1, 1, 1,
0.9489838, -1.229065, 1.735736, 1, 1, 1, 1, 1,
0.950653, 0.3185917, -0.389213, 1, 1, 1, 1, 1,
0.9507204, 0.2081363, 1.954814, 1, 1, 1, 1, 1,
0.9545051, 0.3108144, -0.2751303, 1, 1, 1, 1, 1,
0.9548758, -1.218988, 4.900026, 1, 1, 1, 1, 1,
0.9587233, -2.02747, 2.174594, 1, 1, 1, 1, 1,
0.9590526, -1.293913, 2.768034, 1, 1, 1, 1, 1,
0.9602865, -0.1706382, 2.561265, 1, 1, 1, 1, 1,
0.9670849, -0.6589787, 1.869962, 0, 0, 1, 1, 1,
0.9718919, -1.74915, 2.324992, 1, 0, 0, 1, 1,
0.9806086, -1.430239, 3.959364, 1, 0, 0, 1, 1,
0.9817147, 1.084834, -0.2963172, 1, 0, 0, 1, 1,
0.9850231, 1.043355, 0.2928668, 1, 0, 0, 1, 1,
0.9886026, 0.02437758, 0.9851063, 1, 0, 0, 1, 1,
0.9915041, -0.8538877, 1.766759, 0, 0, 0, 1, 1,
1.018355, -2.992243, 2.252955, 0, 0, 0, 1, 1,
1.023205, 1.18784, 0.7169669, 0, 0, 0, 1, 1,
1.038851, 1.555276, 1.059975, 0, 0, 0, 1, 1,
1.041275, -1.704638, 3.567675, 0, 0, 0, 1, 1,
1.052142, 1.417375, 0.161736, 0, 0, 0, 1, 1,
1.056812, 1.000556, 0.3283865, 0, 0, 0, 1, 1,
1.058769, -1.742613, 2.307461, 1, 1, 1, 1, 1,
1.05909, -0.3491844, 1.624808, 1, 1, 1, 1, 1,
1.061254, 1.63715, -0.9450313, 1, 1, 1, 1, 1,
1.061925, 0.6232102, -0.209242, 1, 1, 1, 1, 1,
1.072038, -0.4223609, -1.077957, 1, 1, 1, 1, 1,
1.072355, -0.2545818, 3.070155, 1, 1, 1, 1, 1,
1.074589, -0.6349323, 1.074232, 1, 1, 1, 1, 1,
1.074913, 0.4251861, 1.745823, 1, 1, 1, 1, 1,
1.0843, 0.9715875, -1.275444, 1, 1, 1, 1, 1,
1.09612, -0.3971163, 1.336183, 1, 1, 1, 1, 1,
1.103267, -1.649567, 3.471205, 1, 1, 1, 1, 1,
1.106058, 1.140185, 1.609651, 1, 1, 1, 1, 1,
1.112613, -1.26165, 2.174833, 1, 1, 1, 1, 1,
1.116987, 0.8368511, 0.547813, 1, 1, 1, 1, 1,
1.11829, -0.3402116, 2.191107, 1, 1, 1, 1, 1,
1.120723, 0.8307238, 0.9279987, 0, 0, 1, 1, 1,
1.1281, -0.05830174, 1.210082, 1, 0, 0, 1, 1,
1.13, 0.450921, 1.532396, 1, 0, 0, 1, 1,
1.133475, -0.2749878, 1.53633, 1, 0, 0, 1, 1,
1.133978, -1.010407, 2.014053, 1, 0, 0, 1, 1,
1.135576, 0.7359249, 1.644731, 1, 0, 0, 1, 1,
1.141351, -0.4165579, 3.231472, 0, 0, 0, 1, 1,
1.14184, -0.04796416, 3.33182, 0, 0, 0, 1, 1,
1.144674, 0.4367618, 2.171359, 0, 0, 0, 1, 1,
1.156307, 1.430765, 2.058569, 0, 0, 0, 1, 1,
1.157638, -0.2166002, 2.106585, 0, 0, 0, 1, 1,
1.163212, -0.002880036, 1.481023, 0, 0, 0, 1, 1,
1.163778, -0.3643203, 0.4746703, 0, 0, 0, 1, 1,
1.174657, -1.210117, 1.985531, 1, 1, 1, 1, 1,
1.176036, 0.2112521, 2.54719, 1, 1, 1, 1, 1,
1.17635, -0.9983785, 2.274355, 1, 1, 1, 1, 1,
1.181505, -0.5275195, 0.5476705, 1, 1, 1, 1, 1,
1.183605, 1.856758, 1.817032, 1, 1, 1, 1, 1,
1.185214, 1.193028, 1.489428, 1, 1, 1, 1, 1,
1.186894, 1.14267, 0.0004093501, 1, 1, 1, 1, 1,
1.189047, 0.4828034, 2.227033, 1, 1, 1, 1, 1,
1.189551, 0.104051, -1.038718, 1, 1, 1, 1, 1,
1.198839, -0.3213974, 2.261102, 1, 1, 1, 1, 1,
1.222239, 0.7842842, 0.5882304, 1, 1, 1, 1, 1,
1.22873, 0.154454, 2.555546, 1, 1, 1, 1, 1,
1.23466, -1.205034, 4.419881, 1, 1, 1, 1, 1,
1.240708, -0.1574664, 2.580375, 1, 1, 1, 1, 1,
1.243101, 2.558981, 1.98604, 1, 1, 1, 1, 1,
1.247794, 1.210374, 1.264053, 0, 0, 1, 1, 1,
1.251539, -0.4075926, 2.378254, 1, 0, 0, 1, 1,
1.256527, -0.6894007, 3.033133, 1, 0, 0, 1, 1,
1.256911, -1.12181, 0.6787692, 1, 0, 0, 1, 1,
1.258347, -0.6033213, 1.742745, 1, 0, 0, 1, 1,
1.264062, -1.732735, 0.5472897, 1, 0, 0, 1, 1,
1.274306, -0.2307736, 1.743815, 0, 0, 0, 1, 1,
1.282405, 0.9175332, 0.5327564, 0, 0, 0, 1, 1,
1.284626, -0.9310275, 2.383172, 0, 0, 0, 1, 1,
1.291141, 0.6499106, 2.160222, 0, 0, 0, 1, 1,
1.292329, -0.2916476, 0.2067508, 0, 0, 0, 1, 1,
1.306704, 1.711284, 1.530539, 0, 0, 0, 1, 1,
1.313174, -0.01689066, 2.330122, 0, 0, 0, 1, 1,
1.320571, 0.3326821, 1.142414, 1, 1, 1, 1, 1,
1.330795, 0.5018299, 1.613108, 1, 1, 1, 1, 1,
1.341811, 0.6807234, 0.5962175, 1, 1, 1, 1, 1,
1.357458, 0.0419872, 3.388058, 1, 1, 1, 1, 1,
1.357517, 0.9602008, 0.7847273, 1, 1, 1, 1, 1,
1.359149, -1.35663, 3.299385, 1, 1, 1, 1, 1,
1.365606, -0.6090529, 1.356057, 1, 1, 1, 1, 1,
1.384089, -0.6936354, 2.593092, 1, 1, 1, 1, 1,
1.389241, -2.07277, 3.029052, 1, 1, 1, 1, 1,
1.392949, 1.278682, 1.575785, 1, 1, 1, 1, 1,
1.412682, 0.1162231, 1.984378, 1, 1, 1, 1, 1,
1.419563, -1.015145, 2.475063, 1, 1, 1, 1, 1,
1.423949, -1.594507, 3.39874, 1, 1, 1, 1, 1,
1.426022, 0.4627228, 0.2775506, 1, 1, 1, 1, 1,
1.433297, -1.716985, 2.985955, 1, 1, 1, 1, 1,
1.45357, -1.165848, 3.073588, 0, 0, 1, 1, 1,
1.461548, -1.361127, 1.09498, 1, 0, 0, 1, 1,
1.475966, -0.8939983, 1.373042, 1, 0, 0, 1, 1,
1.477658, 0.2292951, 2.541436, 1, 0, 0, 1, 1,
1.483746, 0.955785, 0.08456365, 1, 0, 0, 1, 1,
1.494007, 0.0291421, 1.180168, 1, 0, 0, 1, 1,
1.498057, -0.336208, 1.874382, 0, 0, 0, 1, 1,
1.500401, 0.3077202, 1.783964, 0, 0, 0, 1, 1,
1.505996, -0.1508008, 0.05629985, 0, 0, 0, 1, 1,
1.513458, -0.3521177, 1.420681, 0, 0, 0, 1, 1,
1.520809, -0.8715749, 0.4087709, 0, 0, 0, 1, 1,
1.521381, 0.5320888, 0.8689929, 0, 0, 0, 1, 1,
1.521711, 1.021581, -0.8688149, 0, 0, 0, 1, 1,
1.522728, 1.068482, 0.8023226, 1, 1, 1, 1, 1,
1.530587, 0.1895332, -0.05715997, 1, 1, 1, 1, 1,
1.53179, -0.3163679, -0.09613001, 1, 1, 1, 1, 1,
1.54038, -0.4813995, 0.6563201, 1, 1, 1, 1, 1,
1.555514, -0.8905599, 0.04163197, 1, 1, 1, 1, 1,
1.556622, 1.127592, 1.3344, 1, 1, 1, 1, 1,
1.568063, 1.420451, 1.140523, 1, 1, 1, 1, 1,
1.575979, 0.5926105, 0.4768694, 1, 1, 1, 1, 1,
1.595544, 0.1477949, 1.145155, 1, 1, 1, 1, 1,
1.600288, 1.65778, 1.451734, 1, 1, 1, 1, 1,
1.605983, 0.3624422, 1.132695, 1, 1, 1, 1, 1,
1.615266, 0.7930616, 0.8071049, 1, 1, 1, 1, 1,
1.618745, 0.1488848, -0.1787166, 1, 1, 1, 1, 1,
1.632435, -0.5287224, 3.673357, 1, 1, 1, 1, 1,
1.639826, 0.24437, 2.079692, 1, 1, 1, 1, 1,
1.655795, 0.7286028, -0.1698187, 0, 0, 1, 1, 1,
1.672062, 0.1984456, 2.859717, 1, 0, 0, 1, 1,
1.715287, 0.658338, -0.3814594, 1, 0, 0, 1, 1,
1.729527, 0.7043116, 1.820847, 1, 0, 0, 1, 1,
1.730017, -0.006231198, 1.481033, 1, 0, 0, 1, 1,
1.749369, -0.8955964, 0.8738623, 1, 0, 0, 1, 1,
1.750927, 1.254691, -1.14146, 0, 0, 0, 1, 1,
1.757911, 1.462147, 0.5490987, 0, 0, 0, 1, 1,
1.759362, 0.1892208, 2.271949, 0, 0, 0, 1, 1,
1.763141, 0.8887194, 2.958956, 0, 0, 0, 1, 1,
1.768747, 0.2874409, 1.020147, 0, 0, 0, 1, 1,
1.789588, -0.6261269, 2.167515, 0, 0, 0, 1, 1,
1.79774, -0.3063354, 3.406719, 0, 0, 0, 1, 1,
1.801614, -0.3801907, 0.7761251, 1, 1, 1, 1, 1,
1.80995, -0.1447826, 2.492667, 1, 1, 1, 1, 1,
1.814398, -1.058087, 3.53266, 1, 1, 1, 1, 1,
1.825548, -0.6666105, 1.026521, 1, 1, 1, 1, 1,
1.875836, 1.086592, 0.4275347, 1, 1, 1, 1, 1,
1.886912, -0.4692329, 1.602855, 1, 1, 1, 1, 1,
1.893268, -0.3547016, -0.1755057, 1, 1, 1, 1, 1,
1.906342, 0.1388846, 1.951557, 1, 1, 1, 1, 1,
1.929453, 0.4687138, 0.7867914, 1, 1, 1, 1, 1,
1.951147, -0.3042068, 2.195939, 1, 1, 1, 1, 1,
1.963651, 0.5771813, 2.147202, 1, 1, 1, 1, 1,
1.994519, 0.4126864, -1.129596, 1, 1, 1, 1, 1,
1.998741, 0.6616675, -0.3673331, 1, 1, 1, 1, 1,
2.005303, 0.08151578, 2.239932, 1, 1, 1, 1, 1,
2.024324, 0.7582242, 1.680028, 1, 1, 1, 1, 1,
2.032465, 0.2682954, 2.004048, 0, 0, 1, 1, 1,
2.039822, 0.361137, 2.276798, 1, 0, 0, 1, 1,
2.062963, 1.982915, -0.8102692, 1, 0, 0, 1, 1,
2.086308, 0.8720702, -1.009197, 1, 0, 0, 1, 1,
2.197266, -0.486982, 2.718863, 1, 0, 0, 1, 1,
2.306874, 1.50747, -0.8778185, 1, 0, 0, 1, 1,
2.311017, 0.3697329, 2.219979, 0, 0, 0, 1, 1,
2.326862, 0.556598, -0.1099491, 0, 0, 0, 1, 1,
2.354676, -0.3622118, 0.8670768, 0, 0, 0, 1, 1,
2.388902, -0.925147, 2.932113, 0, 0, 0, 1, 1,
2.397006, -0.8223185, 1.283915, 0, 0, 0, 1, 1,
2.462356, 0.273287, 0.1317953, 0, 0, 0, 1, 1,
2.467295, -0.317581, 2.092263, 0, 0, 0, 1, 1,
2.509865, 0.7047204, 3.109886, 1, 1, 1, 1, 1,
2.53798, 1.226122, -1.437934, 1, 1, 1, 1, 1,
2.572661, 1.392031, 1.376198, 1, 1, 1, 1, 1,
2.772681, 0.2189642, -0.1990393, 1, 1, 1, 1, 1,
2.808783, -1.732708, 0.8223853, 1, 1, 1, 1, 1,
2.817693, 1.367511, 1.912774, 1, 1, 1, 1, 1,
3.312618, 0.1399362, 2.988864, 1, 1, 1, 1, 1
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
var radius = 9.20392;
var distance = 32.32838;
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
mvMatrix.translate( -0.2814645, 0.2321514, -0.1149778 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.32838);
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
