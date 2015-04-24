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
-3.361272, 2.270165, 0.1139725, 1, 0, 0, 1,
-2.612324, -1.046708, -2.059147, 1, 0.007843138, 0, 1,
-2.553859, -1.02309, -1.357898, 1, 0.01176471, 0, 1,
-2.544898, -0.244509, -1.152892, 1, 0.01960784, 0, 1,
-2.541345, -1.266034, -1.820643, 1, 0.02352941, 0, 1,
-2.445517, -1.719795, -2.225052, 1, 0.03137255, 0, 1,
-2.442333, -0.828218, -1.328227, 1, 0.03529412, 0, 1,
-2.344975, 0.9059977, 0.1843697, 1, 0.04313726, 0, 1,
-2.302764, -0.5274094, -1.419371, 1, 0.04705882, 0, 1,
-2.282256, 0.3750907, -0.3427365, 1, 0.05490196, 0, 1,
-2.234479, 1.37849, -2.561356, 1, 0.05882353, 0, 1,
-2.21558, 1.450699, 0.1528842, 1, 0.06666667, 0, 1,
-2.213189, -1.217437, -0.6627095, 1, 0.07058824, 0, 1,
-2.207075, 1.361354, -0.4188699, 1, 0.07843138, 0, 1,
-2.197333, -0.1370559, -2.015631, 1, 0.08235294, 0, 1,
-2.174234, 0.2605835, 0.08482967, 1, 0.09019608, 0, 1,
-2.172932, -0.8642772, -1.406071, 1, 0.09411765, 0, 1,
-2.155694, 1.03799, -1.67994, 1, 0.1019608, 0, 1,
-2.118218, -1.66714, -2.49463, 1, 0.1098039, 0, 1,
-2.09529, -0.09917576, -0.9184098, 1, 0.1137255, 0, 1,
-2.087351, 0.1062958, -0.8806897, 1, 0.1215686, 0, 1,
-2.083904, -0.6070672, -3.346172, 1, 0.1254902, 0, 1,
-2.059583, 0.3782617, -0.5602239, 1, 0.1333333, 0, 1,
-2.042525, -0.8605468, -3.048954, 1, 0.1372549, 0, 1,
-1.96065, -1.344829, -1.315579, 1, 0.145098, 0, 1,
-1.934375, 0.2589558, -1.558144, 1, 0.1490196, 0, 1,
-1.910289, -0.5439148, -1.862461, 1, 0.1568628, 0, 1,
-1.881786, -0.5581501, 0.8218095, 1, 0.1607843, 0, 1,
-1.873417, -0.56992, -3.250863, 1, 0.1686275, 0, 1,
-1.87114, 0.3851566, -1.753134, 1, 0.172549, 0, 1,
-1.866691, -0.4567086, -1.985993, 1, 0.1803922, 0, 1,
-1.850891, -1.00631, -3.167437, 1, 0.1843137, 0, 1,
-1.811465, 0.6076333, -0.6298039, 1, 0.1921569, 0, 1,
-1.798521, -0.2200599, -0.6691202, 1, 0.1960784, 0, 1,
-1.795843, 1.053597, 0.4425395, 1, 0.2039216, 0, 1,
-1.795505, 0.6950338, -3.259084, 1, 0.2117647, 0, 1,
-1.792256, 0.00256809, -1.03998, 1, 0.2156863, 0, 1,
-1.780164, -2.32898, -2.035223, 1, 0.2235294, 0, 1,
-1.778153, -0.6642674, -0.02197591, 1, 0.227451, 0, 1,
-1.765175, -0.2465121, -1.992317, 1, 0.2352941, 0, 1,
-1.761544, 0.1564781, -1.292463, 1, 0.2392157, 0, 1,
-1.738237, -0.06033545, -1.092811, 1, 0.2470588, 0, 1,
-1.709812, 0.1131717, -0.6564828, 1, 0.2509804, 0, 1,
-1.709464, 0.9410759, 0.3360702, 1, 0.2588235, 0, 1,
-1.706264, -1.69342, -2.268926, 1, 0.2627451, 0, 1,
-1.702863, -0.5211856, -1.559185, 1, 0.2705882, 0, 1,
-1.695935, -0.6053057, -4.293257, 1, 0.2745098, 0, 1,
-1.695464, 1.019924, -0.7597144, 1, 0.282353, 0, 1,
-1.688789, -0.4466035, -2.676728, 1, 0.2862745, 0, 1,
-1.681846, 0.4673357, -3.240767, 1, 0.2941177, 0, 1,
-1.668465, -0.7921618, -2.772498, 1, 0.3019608, 0, 1,
-1.666272, -2.010463, -1.548729, 1, 0.3058824, 0, 1,
-1.665356, 0.805714, -1.501671, 1, 0.3137255, 0, 1,
-1.655055, -0.7440562, -1.179652, 1, 0.3176471, 0, 1,
-1.65102, 0.6881546, -0.4118409, 1, 0.3254902, 0, 1,
-1.647164, 0.1286736, -0.5004737, 1, 0.3294118, 0, 1,
-1.63983, -0.1205465, 0.39398, 1, 0.3372549, 0, 1,
-1.63185, 0.3120865, -2.370134, 1, 0.3411765, 0, 1,
-1.626704, -0.7974811, -1.980451, 1, 0.3490196, 0, 1,
-1.626047, 0.6088807, -2.971427, 1, 0.3529412, 0, 1,
-1.625895, -1.243536, -1.309728, 1, 0.3607843, 0, 1,
-1.620263, 0.6998008, -0.7278188, 1, 0.3647059, 0, 1,
-1.618648, 0.8316656, -0.8795711, 1, 0.372549, 0, 1,
-1.588356, -0.3659727, -1.852634, 1, 0.3764706, 0, 1,
-1.577574, 0.1880894, 0.2425633, 1, 0.3843137, 0, 1,
-1.571177, -1.475843, -2.890085, 1, 0.3882353, 0, 1,
-1.564631, -0.4059289, -2.007456, 1, 0.3960784, 0, 1,
-1.548287, -0.6281417, -0.4726476, 1, 0.4039216, 0, 1,
-1.544526, -0.3459625, -2.82741, 1, 0.4078431, 0, 1,
-1.531096, -1.503264, -1.82535, 1, 0.4156863, 0, 1,
-1.530742, -0.4766597, -1.928721, 1, 0.4196078, 0, 1,
-1.524411, 1.322347, -2.522507, 1, 0.427451, 0, 1,
-1.515773, 0.8043067, -1.994743, 1, 0.4313726, 0, 1,
-1.515582, 0.2270853, -2.240941, 1, 0.4392157, 0, 1,
-1.515533, 1.754556, -0.6884706, 1, 0.4431373, 0, 1,
-1.510455, -0.7591743, -0.5416564, 1, 0.4509804, 0, 1,
-1.498685, 1.675282, -1.657789, 1, 0.454902, 0, 1,
-1.488981, 0.4896889, -0.4829234, 1, 0.4627451, 0, 1,
-1.487145, -2.747194, -2.904248, 1, 0.4666667, 0, 1,
-1.458162, 0.3357986, -0.1315415, 1, 0.4745098, 0, 1,
-1.455943, 0.7520581, -1.542488, 1, 0.4784314, 0, 1,
-1.442395, -0.04280989, -2.825323, 1, 0.4862745, 0, 1,
-1.440005, 1.738058, -0.003789648, 1, 0.4901961, 0, 1,
-1.420567, -0.6253074, -2.669853, 1, 0.4980392, 0, 1,
-1.413604, -1.698932, -2.218383, 1, 0.5058824, 0, 1,
-1.413091, -0.346568, -1.81103, 1, 0.509804, 0, 1,
-1.408671, -0.3017383, -1.744571, 1, 0.5176471, 0, 1,
-1.408216, 1.199428, 0.4341052, 1, 0.5215687, 0, 1,
-1.397282, -0.2528777, -1.975298, 1, 0.5294118, 0, 1,
-1.382609, 1.327874, -0.9437433, 1, 0.5333334, 0, 1,
-1.379787, -1.35823, -1.577536, 1, 0.5411765, 0, 1,
-1.374152, 0.5995612, 0.3884943, 1, 0.5450981, 0, 1,
-1.373951, -1.164527, -1.299882, 1, 0.5529412, 0, 1,
-1.373533, -0.846785, -1.450251, 1, 0.5568628, 0, 1,
-1.371083, 0.1719417, -1.137918, 1, 0.5647059, 0, 1,
-1.37006, -0.2313986, -3.34556, 1, 0.5686275, 0, 1,
-1.369698, 1.216009, -0.8692827, 1, 0.5764706, 0, 1,
-1.359471, -0.5887365, -2.100955, 1, 0.5803922, 0, 1,
-1.34347, 1.121682, -0.7739888, 1, 0.5882353, 0, 1,
-1.339849, -0.1108897, -0.1612097, 1, 0.5921569, 0, 1,
-1.33733, 0.1790446, -1.392341, 1, 0.6, 0, 1,
-1.337229, -1.778485, -2.201404, 1, 0.6078432, 0, 1,
-1.335751, -0.6377882, -1.762729, 1, 0.6117647, 0, 1,
-1.334224, 0.9711468, -0.1949458, 1, 0.6196079, 0, 1,
-1.329556, 0.7186128, -1.432337, 1, 0.6235294, 0, 1,
-1.326677, -0.04512414, -2.225953, 1, 0.6313726, 0, 1,
-1.307896, -0.8048888, -1.229826, 1, 0.6352941, 0, 1,
-1.295161, -0.1795846, 0.1431535, 1, 0.6431373, 0, 1,
-1.294075, 1.075374, 0.2674264, 1, 0.6470588, 0, 1,
-1.276343, 0.05737972, -1.340896, 1, 0.654902, 0, 1,
-1.274216, -0.3571045, -2.355067, 1, 0.6588235, 0, 1,
-1.273139, 0.1552624, -2.386483, 1, 0.6666667, 0, 1,
-1.268468, 1.174823, 0.1994792, 1, 0.6705883, 0, 1,
-1.23884, 0.3060618, -2.442561, 1, 0.6784314, 0, 1,
-1.238223, -0.07499043, -1.558927, 1, 0.682353, 0, 1,
-1.225312, 1.459367, -2.054836, 1, 0.6901961, 0, 1,
-1.222973, -0.8036466, -4.141287, 1, 0.6941177, 0, 1,
-1.216528, -0.6272169, -3.161816, 1, 0.7019608, 0, 1,
-1.21209, -1.124329, -2.979615, 1, 0.7098039, 0, 1,
-1.205534, 0.505537, -1.575882, 1, 0.7137255, 0, 1,
-1.201813, -0.506615, -1.012011, 1, 0.7215686, 0, 1,
-1.19062, -0.6023142, -1.405982, 1, 0.7254902, 0, 1,
-1.186035, 0.9198752, -0.1428576, 1, 0.7333333, 0, 1,
-1.165056, 0.5372522, -2.00592, 1, 0.7372549, 0, 1,
-1.165037, -0.6143754, -1.442869, 1, 0.7450981, 0, 1,
-1.152329, 0.7512928, -1.860024, 1, 0.7490196, 0, 1,
-1.148691, 0.01292535, -1.422048, 1, 0.7568628, 0, 1,
-1.148394, 1.348973, -0.4121383, 1, 0.7607843, 0, 1,
-1.148182, -0.4685263, -1.876317, 1, 0.7686275, 0, 1,
-1.143386, 1.841135, 0.03935562, 1, 0.772549, 0, 1,
-1.139979, -0.1490189, -1.918928, 1, 0.7803922, 0, 1,
-1.122583, 1.061045, 0.2849707, 1, 0.7843137, 0, 1,
-1.12201, 1.560525, -0.2311345, 1, 0.7921569, 0, 1,
-1.11767, -0.05838295, -1.63029, 1, 0.7960784, 0, 1,
-1.11639, -0.9375997, -2.296814, 1, 0.8039216, 0, 1,
-1.111385, 0.09271008, -2.137316, 1, 0.8117647, 0, 1,
-1.107754, 0.5146549, -0.4249457, 1, 0.8156863, 0, 1,
-1.105847, -1.819819, -1.805394, 1, 0.8235294, 0, 1,
-1.103118, -1.254571, -1.451352, 1, 0.827451, 0, 1,
-1.101911, 0.3352383, -0.9958822, 1, 0.8352941, 0, 1,
-1.095022, -0.8733558, -2.38349, 1, 0.8392157, 0, 1,
-1.091597, 1.064866, -0.1200769, 1, 0.8470588, 0, 1,
-1.076041, 0.2900832, -1.189871, 1, 0.8509804, 0, 1,
-1.069634, -1.40887, -1.282362, 1, 0.8588235, 0, 1,
-1.065589, 1.378195, -1.577676, 1, 0.8627451, 0, 1,
-1.054675, -0.58135, -2.616853, 1, 0.8705882, 0, 1,
-1.05281, -0.02315346, -3.119112, 1, 0.8745098, 0, 1,
-1.046442, -0.300961, -2.01469, 1, 0.8823529, 0, 1,
-1.042346, -0.286929, -2.925094, 1, 0.8862745, 0, 1,
-1.031449, -0.6913968, -2.322219, 1, 0.8941177, 0, 1,
-1.027696, 0.765099, 0.5667201, 1, 0.8980392, 0, 1,
-1.02371, -0.2668129, -4.419599, 1, 0.9058824, 0, 1,
-1.018413, -0.1507242, 0.1075597, 1, 0.9137255, 0, 1,
-1.015716, -0.979205, -1.27294, 1, 0.9176471, 0, 1,
-1.015084, 0.3918116, -1.886043, 1, 0.9254902, 0, 1,
-1.01333, -0.7047436, -1.780624, 1, 0.9294118, 0, 1,
-0.9989632, -0.8974255, -3.461702, 1, 0.9372549, 0, 1,
-0.9959565, 0.2002885, -0.8574135, 1, 0.9411765, 0, 1,
-0.9930604, 1.313347, -0.5823717, 1, 0.9490196, 0, 1,
-0.992471, -0.5158696, -1.781757, 1, 0.9529412, 0, 1,
-0.9857762, -0.5692013, -1.354607, 1, 0.9607843, 0, 1,
-0.9842622, 0.7396773, -0.3061078, 1, 0.9647059, 0, 1,
-0.97905, 0.08777813, -1.406831, 1, 0.972549, 0, 1,
-0.9765538, -1.209489, -1.964733, 1, 0.9764706, 0, 1,
-0.9756631, 0.1401814, -0.7036877, 1, 0.9843137, 0, 1,
-0.9700191, 0.5838213, -1.731217, 1, 0.9882353, 0, 1,
-0.9655302, -0.244262, -1.972342, 1, 0.9960784, 0, 1,
-0.9535914, 0.8262492, -3.784867, 0.9960784, 1, 0, 1,
-0.9505864, 0.7684895, -0.4287625, 0.9921569, 1, 0, 1,
-0.9492976, 0.512277, 1.015371, 0.9843137, 1, 0, 1,
-0.947857, 1.009778, -1.109197, 0.9803922, 1, 0, 1,
-0.9457544, -0.3621839, -3.679172, 0.972549, 1, 0, 1,
-0.9406682, -0.1239126, -0.9858539, 0.9686275, 1, 0, 1,
-0.9398983, -0.08845989, -1.77445, 0.9607843, 1, 0, 1,
-0.9364036, 0.9773894, 0.09156349, 0.9568627, 1, 0, 1,
-0.9306189, -1.276803, -1.716451, 0.9490196, 1, 0, 1,
-0.9247093, -2.275209, -3.806351, 0.945098, 1, 0, 1,
-0.9230326, -0.1842835, -3.814194, 0.9372549, 1, 0, 1,
-0.9114912, -0.3367794, -1.64752, 0.9333333, 1, 0, 1,
-0.9079629, -0.2829511, -0.3321391, 0.9254902, 1, 0, 1,
-0.9053036, 0.9806328, -1.374806, 0.9215686, 1, 0, 1,
-0.9042338, -0.840828, -3.417741, 0.9137255, 1, 0, 1,
-0.9028168, 2.788927, -0.2553846, 0.9098039, 1, 0, 1,
-0.8975743, -0.3080192, -4.411992, 0.9019608, 1, 0, 1,
-0.8963464, 0.1284716, 0.4467433, 0.8941177, 1, 0, 1,
-0.8952807, 1.203447, -0.2988421, 0.8901961, 1, 0, 1,
-0.8951067, 1.138648, -0.5437655, 0.8823529, 1, 0, 1,
-0.8950827, -2.570334, -5.255448, 0.8784314, 1, 0, 1,
-0.889318, 0.06429281, -1.374445, 0.8705882, 1, 0, 1,
-0.8857363, 0.7708516, -0.8712728, 0.8666667, 1, 0, 1,
-0.8842841, -0.1008785, -1.035456, 0.8588235, 1, 0, 1,
-0.8839651, -1.097722, -2.702942, 0.854902, 1, 0, 1,
-0.8803298, 1.269388, -0.7952757, 0.8470588, 1, 0, 1,
-0.8791531, -0.3899249, -2.225112, 0.8431373, 1, 0, 1,
-0.8752671, -0.301764, -1.058721, 0.8352941, 1, 0, 1,
-0.8746539, 0.5461696, -0.8423765, 0.8313726, 1, 0, 1,
-0.8712667, 1.519376, -0.7034468, 0.8235294, 1, 0, 1,
-0.8630198, 0.8668027, -0.2231416, 0.8196079, 1, 0, 1,
-0.8541054, -0.5172782, -3.431009, 0.8117647, 1, 0, 1,
-0.8500676, -0.2533018, -3.010121, 0.8078431, 1, 0, 1,
-0.849724, -0.4289749, -4.821054, 0.8, 1, 0, 1,
-0.8479491, -0.4068564, -1.392385, 0.7921569, 1, 0, 1,
-0.8441422, -1.135522, -0.6151556, 0.7882353, 1, 0, 1,
-0.842432, -0.4320765, -3.203094, 0.7803922, 1, 0, 1,
-0.8408481, -0.2176045, -1.296337, 0.7764706, 1, 0, 1,
-0.8306987, 0.007903887, -2.79, 0.7686275, 1, 0, 1,
-0.8273904, -0.09744477, -2.74975, 0.7647059, 1, 0, 1,
-0.8251519, 0.05071432, -1.312991, 0.7568628, 1, 0, 1,
-0.8238154, -1.427339, -3.954367, 0.7529412, 1, 0, 1,
-0.8227154, 0.04530798, -1.456676, 0.7450981, 1, 0, 1,
-0.8226629, -0.7422941, -2.615504, 0.7411765, 1, 0, 1,
-0.8202855, 1.190439, 0.1676527, 0.7333333, 1, 0, 1,
-0.8176594, -0.1946274, -2.343598, 0.7294118, 1, 0, 1,
-0.8170213, 1.561227, -0.328205, 0.7215686, 1, 0, 1,
-0.812267, -0.4137124, -1.897023, 0.7176471, 1, 0, 1,
-0.8119258, -0.8543734, -0.8722614, 0.7098039, 1, 0, 1,
-0.8106537, 2.081018, 1.285003, 0.7058824, 1, 0, 1,
-0.809876, 0.01202218, -2.87763, 0.6980392, 1, 0, 1,
-0.8088158, 0.3654541, -0.2337774, 0.6901961, 1, 0, 1,
-0.8061689, -0.8430421, -1.336674, 0.6862745, 1, 0, 1,
-0.8038593, 2.115515, 0.7513616, 0.6784314, 1, 0, 1,
-0.801143, -0.1909125, -0.196254, 0.6745098, 1, 0, 1,
-0.7930574, -0.2514093, -2.055032, 0.6666667, 1, 0, 1,
-0.7886341, 0.6517777, -0.9613093, 0.6627451, 1, 0, 1,
-0.7879281, 0.6328738, -1.001561, 0.654902, 1, 0, 1,
-0.7841561, 0.2976182, 0.007560513, 0.6509804, 1, 0, 1,
-0.7827094, 0.05649302, -1.205317, 0.6431373, 1, 0, 1,
-0.7764215, 0.5767233, -1.339451, 0.6392157, 1, 0, 1,
-0.7750775, -0.5033451, -0.03455086, 0.6313726, 1, 0, 1,
-0.7683174, 1.503224, -0.8692239, 0.627451, 1, 0, 1,
-0.7652819, 1.062058, -0.586476, 0.6196079, 1, 0, 1,
-0.7630914, -0.7057208, -3.014873, 0.6156863, 1, 0, 1,
-0.7615182, 0.4425506, 0.1949838, 0.6078432, 1, 0, 1,
-0.7615101, -0.5611315, -1.829969, 0.6039216, 1, 0, 1,
-0.7601124, -0.06163994, -0.8091597, 0.5960785, 1, 0, 1,
-0.754006, -0.04181486, 0.3516237, 0.5882353, 1, 0, 1,
-0.7536522, -1.011485, -1.435409, 0.5843138, 1, 0, 1,
-0.7519411, 2.491007, -0.8131104, 0.5764706, 1, 0, 1,
-0.7409522, -0.4281028, -2.455777, 0.572549, 1, 0, 1,
-0.736097, -1.252221, -3.189486, 0.5647059, 1, 0, 1,
-0.728252, 1.229317, -0.5956143, 0.5607843, 1, 0, 1,
-0.7240779, 0.8051199, 0.985455, 0.5529412, 1, 0, 1,
-0.7240575, 0.05139777, -1.181147, 0.5490196, 1, 0, 1,
-0.7228579, -1.187039, -1.939898, 0.5411765, 1, 0, 1,
-0.7216619, -0.4899068, -3.053427, 0.5372549, 1, 0, 1,
-0.7204499, 0.08818864, -1.321479, 0.5294118, 1, 0, 1,
-0.7201595, -0.205354, -1.589836, 0.5254902, 1, 0, 1,
-0.7199793, -0.2669553, -3.066246, 0.5176471, 1, 0, 1,
-0.7187386, 0.4464201, -2.953858, 0.5137255, 1, 0, 1,
-0.7161443, -0.04086055, -2.569737, 0.5058824, 1, 0, 1,
-0.714236, 0.3422389, -0.7097378, 0.5019608, 1, 0, 1,
-0.710934, 0.3021234, -1.085321, 0.4941176, 1, 0, 1,
-0.7070224, 0.06715634, -1.4164, 0.4862745, 1, 0, 1,
-0.7068701, 0.854543, -0.5144962, 0.4823529, 1, 0, 1,
-0.7058082, -1.467112, -3.004062, 0.4745098, 1, 0, 1,
-0.7053335, 0.5666206, -0.5188054, 0.4705882, 1, 0, 1,
-0.7025597, -0.7432999, -2.897113, 0.4627451, 1, 0, 1,
-0.7022539, 1.208542, -0.8580223, 0.4588235, 1, 0, 1,
-0.7012858, -0.1202593, -0.1952076, 0.4509804, 1, 0, 1,
-0.6988662, -0.07782585, -0.04124224, 0.4470588, 1, 0, 1,
-0.695958, -1.721874, -2.189921, 0.4392157, 1, 0, 1,
-0.6940172, -3.151691, -2.673476, 0.4352941, 1, 0, 1,
-0.6914394, 0.5077606, -0.5651999, 0.427451, 1, 0, 1,
-0.6902273, 0.3891507, -3.261349, 0.4235294, 1, 0, 1,
-0.6902245, 0.396166, -1.927619, 0.4156863, 1, 0, 1,
-0.6847972, 2.267933, 0.1652657, 0.4117647, 1, 0, 1,
-0.670761, 0.7788092, -0.8443787, 0.4039216, 1, 0, 1,
-0.6653173, -0.1047513, -0.3845939, 0.3960784, 1, 0, 1,
-0.6640695, -0.4096468, -2.632706, 0.3921569, 1, 0, 1,
-0.6632617, 0.5467897, -2.646882, 0.3843137, 1, 0, 1,
-0.6583433, 0.2233097, -1.255219, 0.3803922, 1, 0, 1,
-0.6557977, 1.010999, 0.003763538, 0.372549, 1, 0, 1,
-0.6557111, 0.03453014, -0.4789233, 0.3686275, 1, 0, 1,
-0.6468794, -0.1289936, -2.515609, 0.3607843, 1, 0, 1,
-0.6234083, -1.110889, -2.858649, 0.3568628, 1, 0, 1,
-0.6195469, 0.7764733, -1.531106, 0.3490196, 1, 0, 1,
-0.6145061, -1.087651, -3.172668, 0.345098, 1, 0, 1,
-0.6101465, -0.2059062, -2.309922, 0.3372549, 1, 0, 1,
-0.6081724, 0.997017, -1.766543, 0.3333333, 1, 0, 1,
-0.6078048, 0.5982277, -0.3263701, 0.3254902, 1, 0, 1,
-0.6065243, -1.210118, -2.06925, 0.3215686, 1, 0, 1,
-0.606079, 1.607565, -0.4804024, 0.3137255, 1, 0, 1,
-0.6019154, -1.223369, -2.397802, 0.3098039, 1, 0, 1,
-0.59588, 0.1932125, -0.9129193, 0.3019608, 1, 0, 1,
-0.5920518, 0.555392, -0.5373004, 0.2941177, 1, 0, 1,
-0.5901564, -0.8984805, -2.598523, 0.2901961, 1, 0, 1,
-0.5862193, 1.170559, -0.868324, 0.282353, 1, 0, 1,
-0.5842113, -0.8819575, -0.9050012, 0.2784314, 1, 0, 1,
-0.574569, 0.4055612, -0.788104, 0.2705882, 1, 0, 1,
-0.5732356, -1.25831, -1.80295, 0.2666667, 1, 0, 1,
-0.5722086, -0.04982173, -1.792311, 0.2588235, 1, 0, 1,
-0.5705004, 1.344996, 0.4470569, 0.254902, 1, 0, 1,
-0.5701312, -0.1167813, -2.111373, 0.2470588, 1, 0, 1,
-0.566599, -0.5642554, -4.318819, 0.2431373, 1, 0, 1,
-0.5654275, -0.2343752, -2.323166, 0.2352941, 1, 0, 1,
-0.5616682, 0.6443254, -0.5954438, 0.2313726, 1, 0, 1,
-0.5410194, 0.2516417, -1.036243, 0.2235294, 1, 0, 1,
-0.5361454, 1.736593, -0.2043622, 0.2196078, 1, 0, 1,
-0.5343738, 0.2782899, -1.921984, 0.2117647, 1, 0, 1,
-0.532531, 0.4815212, -1.761021, 0.2078431, 1, 0, 1,
-0.5284281, -0.01500186, -2.194947, 0.2, 1, 0, 1,
-0.5212551, 0.2661795, -0.7504688, 0.1921569, 1, 0, 1,
-0.5210828, -0.1955105, -0.8072104, 0.1882353, 1, 0, 1,
-0.5210279, -0.0907581, -1.334885, 0.1803922, 1, 0, 1,
-0.5157784, -0.3416942, -0.4546015, 0.1764706, 1, 0, 1,
-0.5139529, 1.832919, 0.5557315, 0.1686275, 1, 0, 1,
-0.5131964, 1.603168, -3.219755, 0.1647059, 1, 0, 1,
-0.5068474, -0.2678364, -1.266281, 0.1568628, 1, 0, 1,
-0.5049247, -1.467031, -3.189431, 0.1529412, 1, 0, 1,
-0.4989992, 1.138949, -1.175336, 0.145098, 1, 0, 1,
-0.4982807, -1.984427, -2.649953, 0.1411765, 1, 0, 1,
-0.4962785, 0.3685488, -0.5166162, 0.1333333, 1, 0, 1,
-0.4944873, -0.6211211, -2.893488, 0.1294118, 1, 0, 1,
-0.4932601, 0.5597022, -1.246343, 0.1215686, 1, 0, 1,
-0.4918394, -0.4903287, -1.1001, 0.1176471, 1, 0, 1,
-0.4895362, -0.2069397, -1.626713, 0.1098039, 1, 0, 1,
-0.4895029, -0.1807065, -2.05601, 0.1058824, 1, 0, 1,
-0.4891784, -1.46351, -3.129112, 0.09803922, 1, 0, 1,
-0.4883339, 1.144788, 1.043104, 0.09019608, 1, 0, 1,
-0.4790988, -0.5385718, -3.394794, 0.08627451, 1, 0, 1,
-0.4720985, -1.0902, -3.171383, 0.07843138, 1, 0, 1,
-0.4683757, 0.4336459, 0.1626069, 0.07450981, 1, 0, 1,
-0.4666554, -0.09080522, 0.06783346, 0.06666667, 1, 0, 1,
-0.4613528, 0.5749701, 0.1852549, 0.0627451, 1, 0, 1,
-0.4588165, 0.2403571, -0.8085248, 0.05490196, 1, 0, 1,
-0.4527271, 0.5116925, -1.980898, 0.05098039, 1, 0, 1,
-0.4526921, 2.005673, -1.252896, 0.04313726, 1, 0, 1,
-0.4513823, 0.03578283, -1.87293, 0.03921569, 1, 0, 1,
-0.4512978, -1.481053, -2.465869, 0.03137255, 1, 0, 1,
-0.4510473, -0.5802011, -4.117766, 0.02745098, 1, 0, 1,
-0.4510435, 0.7778063, 0.7630066, 0.01960784, 1, 0, 1,
-0.4469523, 0.237911, -0.6683592, 0.01568628, 1, 0, 1,
-0.4456669, -1.187156, -2.464253, 0.007843138, 1, 0, 1,
-0.4436924, -0.4161353, -0.465217, 0.003921569, 1, 0, 1,
-0.4415885, -0.1325068, -1.675258, 0, 1, 0.003921569, 1,
-0.4411252, -0.2565292, -2.477913, 0, 1, 0.01176471, 1,
-0.4354115, -1.29805, -2.569817, 0, 1, 0.01568628, 1,
-0.4342623, 0.2920436, -1.547214, 0, 1, 0.02352941, 1,
-0.4300609, 0.8104524, 0.4216512, 0, 1, 0.02745098, 1,
-0.4295799, -0.3079656, -2.455458, 0, 1, 0.03529412, 1,
-0.4287533, 0.9851424, -0.09410072, 0, 1, 0.03921569, 1,
-0.4282028, -0.03764036, -1.233006, 0, 1, 0.04705882, 1,
-0.4260094, 0.4494438, 0.2463367, 0, 1, 0.05098039, 1,
-0.4228479, 0.7955449, 0.2538366, 0, 1, 0.05882353, 1,
-0.4221185, -1.318634, -3.770872, 0, 1, 0.0627451, 1,
-0.4208407, -0.7926417, -0.9272209, 0, 1, 0.07058824, 1,
-0.41993, -1.515301, -2.004571, 0, 1, 0.07450981, 1,
-0.418797, -1.760528, -2.512624, 0, 1, 0.08235294, 1,
-0.4173804, -0.8116346, -1.568594, 0, 1, 0.08627451, 1,
-0.4103174, 1.871474, 0.101338, 0, 1, 0.09411765, 1,
-0.4075983, -0.6839708, -3.502854, 0, 1, 0.1019608, 1,
-0.4060946, 1.632383, 0.3804674, 0, 1, 0.1058824, 1,
-0.4057545, -1.979159, -2.156883, 0, 1, 0.1137255, 1,
-0.4053718, 0.483558, -0.2262083, 0, 1, 0.1176471, 1,
-0.403914, -0.01121029, -2.801508, 0, 1, 0.1254902, 1,
-0.4020007, 0.5378516, -1.100199, 0, 1, 0.1294118, 1,
-0.3946976, 1.859325, 1.217579, 0, 1, 0.1372549, 1,
-0.3945686, -1.507183, -3.276227, 0, 1, 0.1411765, 1,
-0.3886399, 0.2973316, -0.006360025, 0, 1, 0.1490196, 1,
-0.3817619, 1.00504, 0.4485455, 0, 1, 0.1529412, 1,
-0.379712, 0.002583765, -1.514622, 0, 1, 0.1607843, 1,
-0.3796588, -2.195287, -3.244285, 0, 1, 0.1647059, 1,
-0.3791353, -0.3463144, -0.749502, 0, 1, 0.172549, 1,
-0.3765261, 0.9764154, 1.147484, 0, 1, 0.1764706, 1,
-0.3743072, -0.3313118, -1.930716, 0, 1, 0.1843137, 1,
-0.3731359, 0.2400435, 1.117987, 0, 1, 0.1882353, 1,
-0.3711267, 1.368263, -0.8433448, 0, 1, 0.1960784, 1,
-0.3698324, 2.637878, 0.1862201, 0, 1, 0.2039216, 1,
-0.3683879, 1.544136, 0.4344375, 0, 1, 0.2078431, 1,
-0.3577407, -0.02249808, -2.190139, 0, 1, 0.2156863, 1,
-0.3559082, 1.653227, -0.3054081, 0, 1, 0.2196078, 1,
-0.3553826, -0.5786401, -3.326811, 0, 1, 0.227451, 1,
-0.351687, -0.05339655, -0.5015395, 0, 1, 0.2313726, 1,
-0.3491429, -0.170855, -2.867783, 0, 1, 0.2392157, 1,
-0.3473697, 0.08442163, -1.656846, 0, 1, 0.2431373, 1,
-0.3452642, 0.9818519, 1.022204, 0, 1, 0.2509804, 1,
-0.3436404, 0.08386678, -1.038882, 0, 1, 0.254902, 1,
-0.3418367, 2.007131, 0.3408025, 0, 1, 0.2627451, 1,
-0.3306872, -1.910308, -2.512585, 0, 1, 0.2666667, 1,
-0.3301362, 0.3194927, -1.150021, 0, 1, 0.2745098, 1,
-0.3277822, 0.383125, -0.9327059, 0, 1, 0.2784314, 1,
-0.3275977, -0.4822293, -3.344099, 0, 1, 0.2862745, 1,
-0.3230511, -1.12841, -3.402339, 0, 1, 0.2901961, 1,
-0.3221399, -1.682689, -3.194602, 0, 1, 0.2980392, 1,
-0.3182054, 0.1886254, -0.07978156, 0, 1, 0.3058824, 1,
-0.3167946, -0.01754183, -1.715107, 0, 1, 0.3098039, 1,
-0.3045172, 0.07909621, -1.215266, 0, 1, 0.3176471, 1,
-0.3038128, -1.471164, -2.742539, 0, 1, 0.3215686, 1,
-0.3006657, 0.1812372, -3.372433, 0, 1, 0.3294118, 1,
-0.2967519, -0.130002, -0.007377024, 0, 1, 0.3333333, 1,
-0.2890894, 0.7775612, -2.294981, 0, 1, 0.3411765, 1,
-0.2835799, 0.645412, -0.7642294, 0, 1, 0.345098, 1,
-0.2829785, 1.533322, -0.4654134, 0, 1, 0.3529412, 1,
-0.2816177, -0.1710756, -2.932791, 0, 1, 0.3568628, 1,
-0.279869, 1.374359, -0.1584741, 0, 1, 0.3647059, 1,
-0.2761461, -0.306481, -2.194462, 0, 1, 0.3686275, 1,
-0.2752361, -0.2685715, -4.381759, 0, 1, 0.3764706, 1,
-0.2750925, 0.2636834, 0.742911, 0, 1, 0.3803922, 1,
-0.2733206, -0.5659377, -2.094349, 0, 1, 0.3882353, 1,
-0.2707769, 0.7679829, -1.144597, 0, 1, 0.3921569, 1,
-0.2622645, 1.881647, -0.5072085, 0, 1, 0.4, 1,
-0.2584457, -0.2884209, -3.862843, 0, 1, 0.4078431, 1,
-0.2582197, -0.8713346, -2.31306, 0, 1, 0.4117647, 1,
-0.252903, -0.7142465, -2.691424, 0, 1, 0.4196078, 1,
-0.2519718, -0.3672869, -2.78955, 0, 1, 0.4235294, 1,
-0.2514516, 0.9953867, -0.1611946, 0, 1, 0.4313726, 1,
-0.2509646, -0.5167723, -2.977078, 0, 1, 0.4352941, 1,
-0.2509048, -0.1010589, -0.874993, 0, 1, 0.4431373, 1,
-0.2450462, 1.69393, 1.170368, 0, 1, 0.4470588, 1,
-0.2435893, -0.2826918, -2.957732, 0, 1, 0.454902, 1,
-0.2388191, 0.6051698, -0.6672091, 0, 1, 0.4588235, 1,
-0.2364059, 0.3772609, -1.070483, 0, 1, 0.4666667, 1,
-0.2315811, 1.041688, 1.321524, 0, 1, 0.4705882, 1,
-0.2305195, -0.4052912, -2.832787, 0, 1, 0.4784314, 1,
-0.2303578, -0.1847364, -3.906202, 0, 1, 0.4823529, 1,
-0.2293756, 0.003955642, -1.841612, 0, 1, 0.4901961, 1,
-0.2214194, 1.498227, 0.2020212, 0, 1, 0.4941176, 1,
-0.2205076, -0.1522717, -0.4635301, 0, 1, 0.5019608, 1,
-0.2178967, 0.1001375, -1.223254, 0, 1, 0.509804, 1,
-0.2174334, 0.135565, -1.346093, 0, 1, 0.5137255, 1,
-0.2143194, 1.061768, 1.977843, 0, 1, 0.5215687, 1,
-0.2136747, 0.838707, 0.8403089, 0, 1, 0.5254902, 1,
-0.2103737, 1.328027, 0.09975632, 0, 1, 0.5333334, 1,
-0.2097069, 1.460572, -0.02017827, 0, 1, 0.5372549, 1,
-0.2089711, 0.5115253, 0.1521665, 0, 1, 0.5450981, 1,
-0.208611, -0.9672667, -1.804685, 0, 1, 0.5490196, 1,
-0.2057944, -0.51622, -2.39139, 0, 1, 0.5568628, 1,
-0.2027856, 1.062839, 0.4351863, 0, 1, 0.5607843, 1,
-0.2013096, 0.3486108, -0.6770784, 0, 1, 0.5686275, 1,
-0.1943892, 1.693769, 0.7788244, 0, 1, 0.572549, 1,
-0.1919143, -0.4000395, -2.882345, 0, 1, 0.5803922, 1,
-0.1913782, -1.042137, -4.694977, 0, 1, 0.5843138, 1,
-0.1898184, 1.843997, -1.732775, 0, 1, 0.5921569, 1,
-0.1884593, -0.4900468, -1.297096, 0, 1, 0.5960785, 1,
-0.168343, -1.418733, -1.753825, 0, 1, 0.6039216, 1,
-0.1676244, -0.588026, -3.062505, 0, 1, 0.6117647, 1,
-0.1641053, 0.5083886, 0.2759219, 0, 1, 0.6156863, 1,
-0.1602556, 1.196422, -0.1115203, 0, 1, 0.6235294, 1,
-0.1491083, 1.001015, -1.166372, 0, 1, 0.627451, 1,
-0.1423484, -0.5169273, -2.013551, 0, 1, 0.6352941, 1,
-0.1385657, -0.5325277, -4.024849, 0, 1, 0.6392157, 1,
-0.1335932, 0.8686343, 0.5503546, 0, 1, 0.6470588, 1,
-0.1293441, -0.6890672, -3.682204, 0, 1, 0.6509804, 1,
-0.1268167, -1.123676, -3.145937, 0, 1, 0.6588235, 1,
-0.1233737, 0.56709, 2.300415, 0, 1, 0.6627451, 1,
-0.1232539, -1.486308, -2.941759, 0, 1, 0.6705883, 1,
-0.1223823, -1.017901, -4.983694, 0, 1, 0.6745098, 1,
-0.12135, 0.05011072, -3.312648, 0, 1, 0.682353, 1,
-0.1175924, 2.071441, -1.445758, 0, 1, 0.6862745, 1,
-0.1117922, 0.8280351, -0.9180498, 0, 1, 0.6941177, 1,
-0.1068428, -1.670809, -3.976202, 0, 1, 0.7019608, 1,
-0.09597603, -0.7614781, -2.996302, 0, 1, 0.7058824, 1,
-0.08989041, -0.415609, -4.163486, 0, 1, 0.7137255, 1,
-0.08944743, 0.07246763, -1.332155, 0, 1, 0.7176471, 1,
-0.08509003, 1.009844, -1.314269, 0, 1, 0.7254902, 1,
-0.0833353, -2.172647, -2.320072, 0, 1, 0.7294118, 1,
-0.0799773, -0.04046766, -2.982448, 0, 1, 0.7372549, 1,
-0.07984419, 0.2918986, 0.04109176, 0, 1, 0.7411765, 1,
-0.07180171, 0.5839754, 1.715281, 0, 1, 0.7490196, 1,
-0.07130794, -0.771605, -3.221336, 0, 1, 0.7529412, 1,
-0.067729, -1.827914, -3.627348, 0, 1, 0.7607843, 1,
-0.06640871, -0.1868758, -0.495002, 0, 1, 0.7647059, 1,
-0.06424075, -0.2637182, -3.548257, 0, 1, 0.772549, 1,
-0.05536883, 0.5993969, -1.294307, 0, 1, 0.7764706, 1,
-0.05062174, -0.184989, -3.746873, 0, 1, 0.7843137, 1,
-0.04523995, -0.8621885, -4.511094, 0, 1, 0.7882353, 1,
-0.0447188, -0.7479449, -4.594213, 0, 1, 0.7960784, 1,
-0.04139767, 1.36678, -2.729103, 0, 1, 0.8039216, 1,
-0.04044913, -0.2274229, -2.992632, 0, 1, 0.8078431, 1,
-0.03969056, 0.8367341, -1.816666, 0, 1, 0.8156863, 1,
-0.03506488, 0.3311568, -1.87429, 0, 1, 0.8196079, 1,
-0.03326025, 1.217592, 1.389225, 0, 1, 0.827451, 1,
-0.02911363, 0.8059664, 0.07710887, 0, 1, 0.8313726, 1,
-0.02827957, 0.2601192, -0.8147961, 0, 1, 0.8392157, 1,
-0.02108333, 0.889762, 1.089727, 0, 1, 0.8431373, 1,
-0.0159644, 0.9154244, -0.8413691, 0, 1, 0.8509804, 1,
-0.01381003, -0.1004581, -2.090231, 0, 1, 0.854902, 1,
-0.01296557, -0.7507591, -2.459524, 0, 1, 0.8627451, 1,
-0.0113802, -0.3702598, -2.728231, 0, 1, 0.8666667, 1,
-0.01089086, 0.1611401, 2.181419, 0, 1, 0.8745098, 1,
-0.004862911, 0.1158461, -0.08455384, 0, 1, 0.8784314, 1,
0.002825187, -0.5802243, 4.038606, 0, 1, 0.8862745, 1,
0.006947609, 0.5843588, -0.1677175, 0, 1, 0.8901961, 1,
0.01101612, 0.4735045, 0.1481998, 0, 1, 0.8980392, 1,
0.01294496, -0.3585761, 4.041759, 0, 1, 0.9058824, 1,
0.01373553, -0.1068557, 4.337217, 0, 1, 0.9098039, 1,
0.01407942, -1.439044, 2.831599, 0, 1, 0.9176471, 1,
0.01477353, -1.536907, 4.716771, 0, 1, 0.9215686, 1,
0.01683695, 0.3452882, -1.560425, 0, 1, 0.9294118, 1,
0.01974577, -0.3924672, 2.334323, 0, 1, 0.9333333, 1,
0.02333288, 0.0129481, -0.2593465, 0, 1, 0.9411765, 1,
0.03056199, -0.4478036, 3.169245, 0, 1, 0.945098, 1,
0.0305715, -0.4930867, 3.536177, 0, 1, 0.9529412, 1,
0.03162963, -0.1367282, 3.92948, 0, 1, 0.9568627, 1,
0.03255359, 2.287949, 0.3687888, 0, 1, 0.9647059, 1,
0.03577304, -1.039662, 2.240468, 0, 1, 0.9686275, 1,
0.03651807, 1.244773, -0.1067099, 0, 1, 0.9764706, 1,
0.03958696, -0.2571387, 4.720672, 0, 1, 0.9803922, 1,
0.04245632, 0.8926839, -0.4372742, 0, 1, 0.9882353, 1,
0.04693313, -0.3809764, 2.843036, 0, 1, 0.9921569, 1,
0.04765655, 0.6154017, 0.02703383, 0, 1, 1, 1,
0.04913602, -0.3624755, 3.752297, 0, 0.9921569, 1, 1,
0.05344751, 1.855584, -1.273029, 0, 0.9882353, 1, 1,
0.05665972, -0.464168, 2.933999, 0, 0.9803922, 1, 1,
0.05752436, 0.5279173, -0.111508, 0, 0.9764706, 1, 1,
0.05985619, 0.4936393, 0.4499117, 0, 0.9686275, 1, 1,
0.06254558, 1.31761, -1.405914, 0, 0.9647059, 1, 1,
0.06334678, -2.516165, 2.794219, 0, 0.9568627, 1, 1,
0.06769474, -2.367767, 3.540841, 0, 0.9529412, 1, 1,
0.07169941, -0.007904084, 0.1505817, 0, 0.945098, 1, 1,
0.07417187, 1.345693, -0.9897467, 0, 0.9411765, 1, 1,
0.07449936, -1.092478, 1.641657, 0, 0.9333333, 1, 1,
0.07683402, 2.003465, -1.339935, 0, 0.9294118, 1, 1,
0.08277061, 0.4663626, -1.116722, 0, 0.9215686, 1, 1,
0.08359158, 1.069538, 1.437612, 0, 0.9176471, 1, 1,
0.09380001, 0.1095276, 0.5826362, 0, 0.9098039, 1, 1,
0.09529267, -1.188637, 3.511077, 0, 0.9058824, 1, 1,
0.09646849, 0.4415309, -0.4485264, 0, 0.8980392, 1, 1,
0.09749337, 0.9772082, -0.04462015, 0, 0.8901961, 1, 1,
0.09977579, 0.760817, -0.8102424, 0, 0.8862745, 1, 1,
0.1033887, 1.02387, -0.03330904, 0, 0.8784314, 1, 1,
0.1051118, 0.7310576, -0.5822493, 0, 0.8745098, 1, 1,
0.1062968, 0.4966125, -2.269366, 0, 0.8666667, 1, 1,
0.1065119, 0.7801727, 1.299105, 0, 0.8627451, 1, 1,
0.1068483, 0.1802516, -0.7644041, 0, 0.854902, 1, 1,
0.1070482, 0.9393283, -1.246083, 0, 0.8509804, 1, 1,
0.1083642, 0.2706609, -0.2798847, 0, 0.8431373, 1, 1,
0.1126356, -0.8975053, 3.429362, 0, 0.8392157, 1, 1,
0.1131435, 0.5860554, -0.1130454, 0, 0.8313726, 1, 1,
0.1153383, -1.610044, 4.007882, 0, 0.827451, 1, 1,
0.1195638, -0.3132896, 2.635715, 0, 0.8196079, 1, 1,
0.1247262, -0.1342686, 0.8922755, 0, 0.8156863, 1, 1,
0.1251843, 0.05493606, 1.007082, 0, 0.8078431, 1, 1,
0.1275774, 1.789166, -1.430451, 0, 0.8039216, 1, 1,
0.1276202, 0.1079584, 1.624584, 0, 0.7960784, 1, 1,
0.1353734, -0.7984517, 1.766558, 0, 0.7882353, 1, 1,
0.1360976, -0.6090776, 3.465222, 0, 0.7843137, 1, 1,
0.1372778, -0.8573152, 4.215199, 0, 0.7764706, 1, 1,
0.1415453, -0.754952, 4.045091, 0, 0.772549, 1, 1,
0.1422366, 0.347205, 0.4846168, 0, 0.7647059, 1, 1,
0.1460325, -0.3712833, 3.682267, 0, 0.7607843, 1, 1,
0.1500396, 0.1582826, 0.06630381, 0, 0.7529412, 1, 1,
0.1533505, 0.2355887, 1.483781, 0, 0.7490196, 1, 1,
0.1542022, 0.9585204, -0.2040644, 0, 0.7411765, 1, 1,
0.1561887, 0.5817583, -1.282723, 0, 0.7372549, 1, 1,
0.1583613, 1.002256, -0.2934453, 0, 0.7294118, 1, 1,
0.1592449, -1.068138, 3.137375, 0, 0.7254902, 1, 1,
0.1632962, 0.4595613, -0.6790202, 0, 0.7176471, 1, 1,
0.1708519, 0.5089798, 0.3747871, 0, 0.7137255, 1, 1,
0.1783049, 0.05211109, 1.360738, 0, 0.7058824, 1, 1,
0.1799995, -1.564877, 2.335184, 0, 0.6980392, 1, 1,
0.1801856, 0.818841, 1.756897, 0, 0.6941177, 1, 1,
0.1882391, -0.2227783, 2.912829, 0, 0.6862745, 1, 1,
0.1895211, -1.014956, 2.735163, 0, 0.682353, 1, 1,
0.1897496, 0.1693832, 1.288695, 0, 0.6745098, 1, 1,
0.1954651, -0.4939582, 3.090798, 0, 0.6705883, 1, 1,
0.2013339, -0.7503282, 2.549157, 0, 0.6627451, 1, 1,
0.2022771, 0.02566148, 3.317681, 0, 0.6588235, 1, 1,
0.2026078, -0.7190146, 2.482346, 0, 0.6509804, 1, 1,
0.2043207, -2.27841, 2.362333, 0, 0.6470588, 1, 1,
0.2055627, -0.6250926, 2.741488, 0, 0.6392157, 1, 1,
0.2057909, 1.530901, 0.5630326, 0, 0.6352941, 1, 1,
0.206307, 0.6444669, 3.35193, 0, 0.627451, 1, 1,
0.2157515, -1.005619, 2.885913, 0, 0.6235294, 1, 1,
0.2187977, -0.438895, 3.038363, 0, 0.6156863, 1, 1,
0.2198694, -1.137461, 3.213576, 0, 0.6117647, 1, 1,
0.2203349, 0.4096735, -2.41272, 0, 0.6039216, 1, 1,
0.2281453, 0.3923311, 1.547336, 0, 0.5960785, 1, 1,
0.22884, 2.484116, -0.1449908, 0, 0.5921569, 1, 1,
0.2298453, 1.14211, 0.818649, 0, 0.5843138, 1, 1,
0.2323344, 0.07566278, 0.5235824, 0, 0.5803922, 1, 1,
0.234675, 0.1788311, 2.296488, 0, 0.572549, 1, 1,
0.2347746, -0.1749834, 0.9009005, 0, 0.5686275, 1, 1,
0.2363627, -0.3028479, 3.889452, 0, 0.5607843, 1, 1,
0.2408597, -2.312002, 3.034004, 0, 0.5568628, 1, 1,
0.2422975, -0.5626532, 2.45689, 0, 0.5490196, 1, 1,
0.2438234, 1.032738, -1.231078, 0, 0.5450981, 1, 1,
0.2451175, 0.8509098, 0.7231297, 0, 0.5372549, 1, 1,
0.2457019, -0.7985738, 3.38664, 0, 0.5333334, 1, 1,
0.2476499, -1.079586, 1.899604, 0, 0.5254902, 1, 1,
0.2485569, -0.6429688, 2.879545, 0, 0.5215687, 1, 1,
0.2488665, -0.6571887, 2.233332, 0, 0.5137255, 1, 1,
0.251248, 0.9225335, -0.3749656, 0, 0.509804, 1, 1,
0.2536304, 0.1589987, 1.055366, 0, 0.5019608, 1, 1,
0.2545868, 0.03790901, 0.2607605, 0, 0.4941176, 1, 1,
0.2561228, -0.4807501, 2.567556, 0, 0.4901961, 1, 1,
0.2567194, -0.1201162, 1.75915, 0, 0.4823529, 1, 1,
0.2614376, -0.1871089, 3.453968, 0, 0.4784314, 1, 1,
0.2629742, 0.2211102, 1.059609, 0, 0.4705882, 1, 1,
0.2637639, 0.5524465, -0.1039889, 0, 0.4666667, 1, 1,
0.2648326, -0.1999801, 4.04499, 0, 0.4588235, 1, 1,
0.2668196, 0.4737883, -1.48025, 0, 0.454902, 1, 1,
0.2676854, 0.4641305, -0.439672, 0, 0.4470588, 1, 1,
0.2686547, -0.09705529, 0.9268689, 0, 0.4431373, 1, 1,
0.2805515, 2.047637, -0.8289443, 0, 0.4352941, 1, 1,
0.2818491, 2.296021, -1.625974, 0, 0.4313726, 1, 1,
0.2830252, -0.1198686, 0.9921005, 0, 0.4235294, 1, 1,
0.2879492, -0.9834321, 3.184154, 0, 0.4196078, 1, 1,
0.2912185, 0.3356939, 1.394028, 0, 0.4117647, 1, 1,
0.2950158, 0.2866697, 1.771881, 0, 0.4078431, 1, 1,
0.2981907, 0.04079561, 1.775572, 0, 0.4, 1, 1,
0.2991437, 1.632261, 1.404715, 0, 0.3921569, 1, 1,
0.2992963, -0.715231, 2.13952, 0, 0.3882353, 1, 1,
0.3003159, 0.3103518, 1.724222, 0, 0.3803922, 1, 1,
0.3012796, -0.820587, 1.656957, 0, 0.3764706, 1, 1,
0.3036614, -2.153036, 3.748095, 0, 0.3686275, 1, 1,
0.3038901, -1.797155, 2.96085, 0, 0.3647059, 1, 1,
0.3061755, -0.5756787, 2.843519, 0, 0.3568628, 1, 1,
0.3109159, 2.388881, -1.566759, 0, 0.3529412, 1, 1,
0.3134135, 0.1968003, 1.015887, 0, 0.345098, 1, 1,
0.3135553, -1.446162, 4.339835, 0, 0.3411765, 1, 1,
0.3152065, 1.355859, 0.7792034, 0, 0.3333333, 1, 1,
0.316664, -0.7399524, 2.564555, 0, 0.3294118, 1, 1,
0.318392, -0.7238224, 2.23836, 0, 0.3215686, 1, 1,
0.3224947, 0.07992905, 0.8417863, 0, 0.3176471, 1, 1,
0.3256327, 0.6753128, -0.2973464, 0, 0.3098039, 1, 1,
0.3277237, 0.4599419, 1.494006, 0, 0.3058824, 1, 1,
0.3302358, 1.434237, -0.5342733, 0, 0.2980392, 1, 1,
0.3305906, -1.839686, 4.289386, 0, 0.2901961, 1, 1,
0.3342885, 0.652833, -1.785197, 0, 0.2862745, 1, 1,
0.3347269, 0.3076476, 0.1876632, 0, 0.2784314, 1, 1,
0.3348536, -0.1987418, 1.728093, 0, 0.2745098, 1, 1,
0.3351575, -0.3708453, 2.009465, 0, 0.2666667, 1, 1,
0.337636, 1.360076, -0.2493909, 0, 0.2627451, 1, 1,
0.3377804, -0.4579385, 3.336123, 0, 0.254902, 1, 1,
0.3403961, -0.5172325, 2.415408, 0, 0.2509804, 1, 1,
0.3410719, 2.334347, -0.496771, 0, 0.2431373, 1, 1,
0.3445089, -0.410032, 3.247794, 0, 0.2392157, 1, 1,
0.347324, -0.2070212, 1.163841, 0, 0.2313726, 1, 1,
0.3510555, -0.5858525, 3.444066, 0, 0.227451, 1, 1,
0.3560779, 0.8326336, -0.8228548, 0, 0.2196078, 1, 1,
0.3562236, -0.3094536, 3.097897, 0, 0.2156863, 1, 1,
0.3613205, -0.9764482, 2.276541, 0, 0.2078431, 1, 1,
0.362552, 1.080482, -0.946443, 0, 0.2039216, 1, 1,
0.3685769, -2.003352, 3.575014, 0, 0.1960784, 1, 1,
0.3691863, -0.7681198, 4.351886, 0, 0.1882353, 1, 1,
0.3696195, -1.405347, 3.591779, 0, 0.1843137, 1, 1,
0.3750285, -0.09848265, 2.325304, 0, 0.1764706, 1, 1,
0.3775625, -0.2785874, 2.194924, 0, 0.172549, 1, 1,
0.3783032, -0.04190332, 0.3132624, 0, 0.1647059, 1, 1,
0.3784393, -0.3349927, 2.681112, 0, 0.1607843, 1, 1,
0.3805299, -0.7813169, 1.054331, 0, 0.1529412, 1, 1,
0.3823596, 1.272583, -0.0571797, 0, 0.1490196, 1, 1,
0.3826538, -0.3243599, 1.551173, 0, 0.1411765, 1, 1,
0.382771, 1.210039, -0.1771458, 0, 0.1372549, 1, 1,
0.3885418, 0.4346801, -0.8908906, 0, 0.1294118, 1, 1,
0.3988035, -2.152177, 3.843297, 0, 0.1254902, 1, 1,
0.4033055, -0.533913, 4.368486, 0, 0.1176471, 1, 1,
0.4110675, 0.1460124, 0.7721226, 0, 0.1137255, 1, 1,
0.4167426, 0.8466657, -0.3120722, 0, 0.1058824, 1, 1,
0.4205641, 0.78021, -0.3413231, 0, 0.09803922, 1, 1,
0.4219083, -0.5167612, 3.580251, 0, 0.09411765, 1, 1,
0.4262051, 0.1923553, 0.4657405, 0, 0.08627451, 1, 1,
0.429056, -0.2703547, 1.123661, 0, 0.08235294, 1, 1,
0.4292085, 0.6780902, 1.093668, 0, 0.07450981, 1, 1,
0.4353032, 1.852447, 0.410189, 0, 0.07058824, 1, 1,
0.4367115, 0.5708113, 0.9839099, 0, 0.0627451, 1, 1,
0.4380036, -0.78947, 3.157778, 0, 0.05882353, 1, 1,
0.4404852, -0.465369, 1.831267, 0, 0.05098039, 1, 1,
0.4425973, -1.331468, 1.47508, 0, 0.04705882, 1, 1,
0.4493657, 0.8765722, 0.4086776, 0, 0.03921569, 1, 1,
0.4518113, 0.7693356, 0.7635068, 0, 0.03529412, 1, 1,
0.458981, -0.01651032, 2.586453, 0, 0.02745098, 1, 1,
0.4626557, -1.72893, 3.064739, 0, 0.02352941, 1, 1,
0.4645385, -0.1921864, 2.207215, 0, 0.01568628, 1, 1,
0.4679875, -0.2428128, 3.007241, 0, 0.01176471, 1, 1,
0.484517, 1.426294, 0.9590067, 0, 0.003921569, 1, 1,
0.4871951, -2.409039, 3.649323, 0.003921569, 0, 1, 1,
0.4875549, 0.1127568, 2.329842, 0.007843138, 0, 1, 1,
0.4882281, -1.307432, 4.156158, 0.01568628, 0, 1, 1,
0.4887277, -0.6695883, 2.560904, 0.01960784, 0, 1, 1,
0.491352, -0.4316378, 1.660521, 0.02745098, 0, 1, 1,
0.4939866, -0.1952537, 2.304236, 0.03137255, 0, 1, 1,
0.4949334, 0.3765516, 2.347136, 0.03921569, 0, 1, 1,
0.4967425, -0.9524288, 2.28393, 0.04313726, 0, 1, 1,
0.4973779, -0.04538369, -0.0374611, 0.05098039, 0, 1, 1,
0.5039755, 1.154748, -1.475685, 0.05490196, 0, 1, 1,
0.504906, 0.3140928, 1.161529, 0.0627451, 0, 1, 1,
0.5065127, -0.598451, 1.865801, 0.06666667, 0, 1, 1,
0.509342, 1.750748, 0.1727756, 0.07450981, 0, 1, 1,
0.5135001, 0.07153566, 2.107721, 0.07843138, 0, 1, 1,
0.5155458, 0.5992718, 0.702966, 0.08627451, 0, 1, 1,
0.5191163, 0.243274, 0.6203846, 0.09019608, 0, 1, 1,
0.534803, 1.299039, 2.724062, 0.09803922, 0, 1, 1,
0.5401868, 0.1819535, 1.646455, 0.1058824, 0, 1, 1,
0.5410728, 0.6206937, 1.287704, 0.1098039, 0, 1, 1,
0.5480446, -0.7341089, 0.3946024, 0.1176471, 0, 1, 1,
0.5483063, 1.146408, 1.245961, 0.1215686, 0, 1, 1,
0.5484338, 0.6410749, -0.145532, 0.1294118, 0, 1, 1,
0.5493278, -1.648477, 2.301965, 0.1333333, 0, 1, 1,
0.5513368, 0.7894129, 0.4854779, 0.1411765, 0, 1, 1,
0.5522243, -0.7995271, 3.412372, 0.145098, 0, 1, 1,
0.5602575, -1.30223, 2.084283, 0.1529412, 0, 1, 1,
0.5603067, -0.2304714, 1.525903, 0.1568628, 0, 1, 1,
0.5636569, 0.7843927, 0.569051, 0.1647059, 0, 1, 1,
0.5652447, -0.2274352, 0.2166577, 0.1686275, 0, 1, 1,
0.5672461, 0.1548067, 0.6856604, 0.1764706, 0, 1, 1,
0.5734056, 0.9763394, 0.5580633, 0.1803922, 0, 1, 1,
0.5797215, 0.2525423, 1.518161, 0.1882353, 0, 1, 1,
0.5802957, 0.8753423, 0.2277176, 0.1921569, 0, 1, 1,
0.5821819, -1.554633, 4.192705, 0.2, 0, 1, 1,
0.5822247, -0.004109708, 2.385978, 0.2078431, 0, 1, 1,
0.5838497, -1.033314, 3.069512, 0.2117647, 0, 1, 1,
0.5897288, -0.3213894, 1.904685, 0.2196078, 0, 1, 1,
0.5900258, 0.9833814, -2.261784, 0.2235294, 0, 1, 1,
0.5902078, 0.8419068, 0.5757414, 0.2313726, 0, 1, 1,
0.5933588, 0.3614575, -0.2210869, 0.2352941, 0, 1, 1,
0.5941627, -2.057616, 4.185606, 0.2431373, 0, 1, 1,
0.6070886, -0.4363672, 1.477198, 0.2470588, 0, 1, 1,
0.6105874, -1.224433, 1.764536, 0.254902, 0, 1, 1,
0.6121395, -0.5840997, 3.001861, 0.2588235, 0, 1, 1,
0.6191124, 0.6728928, 0.2250384, 0.2666667, 0, 1, 1,
0.6207536, 0.07726661, 1.715002, 0.2705882, 0, 1, 1,
0.6222038, -0.3480067, 0.9841621, 0.2784314, 0, 1, 1,
0.6223462, 0.3628773, -0.06864271, 0.282353, 0, 1, 1,
0.6290278, -0.09706599, 1.873857, 0.2901961, 0, 1, 1,
0.6322591, -1.38077, 4.712204, 0.2941177, 0, 1, 1,
0.6329966, 0.7563124, -0.7198011, 0.3019608, 0, 1, 1,
0.6336213, 1.722833, -0.4089007, 0.3098039, 0, 1, 1,
0.6419612, -0.855495, 4.354249, 0.3137255, 0, 1, 1,
0.6468679, 0.4805371, 0.2219652, 0.3215686, 0, 1, 1,
0.6479155, -0.2145298, 2.891435, 0.3254902, 0, 1, 1,
0.6514566, -1.41362, 2.556803, 0.3333333, 0, 1, 1,
0.6517776, 1.929356, -0.1615449, 0.3372549, 0, 1, 1,
0.6541513, 0.8029246, 1.40018, 0.345098, 0, 1, 1,
0.6545575, 1.953218, 1.017764, 0.3490196, 0, 1, 1,
0.6550718, -0.320825, 1.725869, 0.3568628, 0, 1, 1,
0.6563271, 0.8913798, 0.8979128, 0.3607843, 0, 1, 1,
0.6648235, -0.898402, 1.872506, 0.3686275, 0, 1, 1,
0.6669651, -0.4958646, 2.052948, 0.372549, 0, 1, 1,
0.6676633, 0.4351647, 0.6789709, 0.3803922, 0, 1, 1,
0.6746822, -0.393634, 3.266763, 0.3843137, 0, 1, 1,
0.6757089, 1.091338, -1.496626, 0.3921569, 0, 1, 1,
0.6780384, 0.1281488, 2.522944, 0.3960784, 0, 1, 1,
0.6814612, -0.8779668, 1.50134, 0.4039216, 0, 1, 1,
0.6840759, 0.1672112, 2.756817, 0.4117647, 0, 1, 1,
0.6845872, -1.903392, 2.142652, 0.4156863, 0, 1, 1,
0.6877655, -0.2164082, 2.191075, 0.4235294, 0, 1, 1,
0.6879199, -1.050013, 4.29359, 0.427451, 0, 1, 1,
0.6886661, -0.02680927, 1.629375, 0.4352941, 0, 1, 1,
0.6896552, 1.165495, -0.1707753, 0.4392157, 0, 1, 1,
0.6945637, 0.4088054, 2.99852, 0.4470588, 0, 1, 1,
0.7011186, -1.204441, 1.720018, 0.4509804, 0, 1, 1,
0.7044877, 0.0120021, 0.4907801, 0.4588235, 0, 1, 1,
0.7091647, 0.2554558, 1.21551, 0.4627451, 0, 1, 1,
0.7109583, -0.8858129, 1.387063, 0.4705882, 0, 1, 1,
0.7233734, 1.06153, 2.186296, 0.4745098, 0, 1, 1,
0.7294315, 0.3985001, -0.3044603, 0.4823529, 0, 1, 1,
0.7308089, 1.686948, 0.8625952, 0.4862745, 0, 1, 1,
0.7333461, 0.7192953, -0.9409599, 0.4941176, 0, 1, 1,
0.7342938, -0.1836536, 1.945367, 0.5019608, 0, 1, 1,
0.7355563, -0.9920984, 3.285038, 0.5058824, 0, 1, 1,
0.7359045, 0.5670903, 0.1175516, 0.5137255, 0, 1, 1,
0.7371407, 2.278574, 0.001640986, 0.5176471, 0, 1, 1,
0.7409363, 1.401915, -0.989478, 0.5254902, 0, 1, 1,
0.7409493, 0.08836151, 1.867571, 0.5294118, 0, 1, 1,
0.7480522, -0.1895912, 1.219035, 0.5372549, 0, 1, 1,
0.7481238, 1.405663, 0.06855188, 0.5411765, 0, 1, 1,
0.7568645, 2.402504, 1.812981, 0.5490196, 0, 1, 1,
0.7592096, 0.5334637, 1.626824, 0.5529412, 0, 1, 1,
0.7599587, -0.7885036, 2.053366, 0.5607843, 0, 1, 1,
0.7637635, 1.007167, 2.416107, 0.5647059, 0, 1, 1,
0.7642542, 0.998255, 0.608894, 0.572549, 0, 1, 1,
0.765685, -0.6218178, 2.298836, 0.5764706, 0, 1, 1,
0.7662145, -0.4388735, 3.564483, 0.5843138, 0, 1, 1,
0.7674717, 0.8310548, 0.7551168, 0.5882353, 0, 1, 1,
0.7685888, -0.114814, 0.5241825, 0.5960785, 0, 1, 1,
0.7780811, -0.7246078, 1.967248, 0.6039216, 0, 1, 1,
0.7810845, -0.0133468, 1.504326, 0.6078432, 0, 1, 1,
0.7813997, -1.214709, 2.170487, 0.6156863, 0, 1, 1,
0.7824233, -1.100724, 2.453324, 0.6196079, 0, 1, 1,
0.7874444, 0.4411721, 0.7113822, 0.627451, 0, 1, 1,
0.7942508, 0.6785766, 2.292226, 0.6313726, 0, 1, 1,
0.8008606, -0.7390051, -0.03246056, 0.6392157, 0, 1, 1,
0.801194, 0.6118615, -0.8524885, 0.6431373, 0, 1, 1,
0.8068528, -0.8215384, 1.71554, 0.6509804, 0, 1, 1,
0.8136624, 0.9682344, 1.114528, 0.654902, 0, 1, 1,
0.8155734, -1.076723, 1.679579, 0.6627451, 0, 1, 1,
0.8169662, 1.446903, 1.80995, 0.6666667, 0, 1, 1,
0.8169934, 0.1710075, 1.94392, 0.6745098, 0, 1, 1,
0.8202839, -1.50348, 3.439889, 0.6784314, 0, 1, 1,
0.8220969, -0.6984454, 1.457595, 0.6862745, 0, 1, 1,
0.8227363, 0.6000639, 1.314797, 0.6901961, 0, 1, 1,
0.8333272, -0.9987755, 2.497868, 0.6980392, 0, 1, 1,
0.8357562, 1.640456, 1.399881, 0.7058824, 0, 1, 1,
0.8363472, -2.33801, 4.081778, 0.7098039, 0, 1, 1,
0.8428587, -0.95679, 3.433177, 0.7176471, 0, 1, 1,
0.8618233, -0.4549192, 2.780822, 0.7215686, 0, 1, 1,
0.8649879, 1.856914, 0.4088318, 0.7294118, 0, 1, 1,
0.8719625, -0.2361403, 1.902458, 0.7333333, 0, 1, 1,
0.8735194, -0.8785111, 3.612898, 0.7411765, 0, 1, 1,
0.8794001, 0.8020364, 0.7402996, 0.7450981, 0, 1, 1,
0.8796716, -0.5744593, 1.52357, 0.7529412, 0, 1, 1,
0.8829046, -0.992131, 2.100387, 0.7568628, 0, 1, 1,
0.8832857, 0.8806738, 0.6480595, 0.7647059, 0, 1, 1,
0.8843064, 0.2551448, 1.928221, 0.7686275, 0, 1, 1,
0.887983, -0.7853348, 1.434064, 0.7764706, 0, 1, 1,
0.8940216, 1.916814, 0.08555996, 0.7803922, 0, 1, 1,
0.8976207, 0.03966671, 2.250731, 0.7882353, 0, 1, 1,
0.8979737, -0.3464102, 2.978327, 0.7921569, 0, 1, 1,
0.9024262, -0.9125358, 2.75915, 0.8, 0, 1, 1,
0.9051493, -0.5003437, 1.393393, 0.8078431, 0, 1, 1,
0.9058977, -1.881442, 2.790589, 0.8117647, 0, 1, 1,
0.9077767, -1.380029, 2.755133, 0.8196079, 0, 1, 1,
0.9152907, -1.678476, 3.792098, 0.8235294, 0, 1, 1,
0.9162732, 0.8743634, 1.849468, 0.8313726, 0, 1, 1,
0.9170604, -0.09573884, 2.471414, 0.8352941, 0, 1, 1,
0.9201226, 1.561719, -0.4299876, 0.8431373, 0, 1, 1,
0.9227803, -0.0570265, 1.173674, 0.8470588, 0, 1, 1,
0.9242683, -0.2479826, 1.960474, 0.854902, 0, 1, 1,
0.9279597, -0.3159125, 1.932355, 0.8588235, 0, 1, 1,
0.92843, -0.1281026, 0.8668172, 0.8666667, 0, 1, 1,
0.9299719, -0.8207451, 0.9240382, 0.8705882, 0, 1, 1,
0.9343958, 1.455754, 1.236504, 0.8784314, 0, 1, 1,
0.9348966, 1.391332, -2.123855, 0.8823529, 0, 1, 1,
0.9397271, 0.142919, 1.797599, 0.8901961, 0, 1, 1,
0.940219, -0.9318972, 1.339595, 0.8941177, 0, 1, 1,
0.9452249, -0.7576913, 2.976961, 0.9019608, 0, 1, 1,
0.9504745, -2.436993, 1.834269, 0.9098039, 0, 1, 1,
0.9520794, -2.265848, 3.216165, 0.9137255, 0, 1, 1,
0.9639029, -0.9276095, 0.7708802, 0.9215686, 0, 1, 1,
0.9662971, 0.6414022, -0.3745361, 0.9254902, 0, 1, 1,
0.9673713, 1.134718, -0.1959151, 0.9333333, 0, 1, 1,
0.9840451, 0.2364128, 0.8854042, 0.9372549, 0, 1, 1,
0.9852415, -0.8976927, 1.741638, 0.945098, 0, 1, 1,
0.9866549, -1.463583, 2.346453, 0.9490196, 0, 1, 1,
0.9866917, 2.397118, 1.186138, 0.9568627, 0, 1, 1,
0.9913992, 1.288947, -1.645242, 0.9607843, 0, 1, 1,
0.9945781, -0.4781594, 1.233874, 0.9686275, 0, 1, 1,
0.9981272, -0.1103869, 0.05560291, 0.972549, 0, 1, 1,
0.9989731, 2.264403, 1.503722, 0.9803922, 0, 1, 1,
0.9992893, 0.9257897, 0.02603218, 0.9843137, 0, 1, 1,
0.9995223, -1.450502, 3.203666, 0.9921569, 0, 1, 1,
1.006956, 3.093358, -0.04311411, 0.9960784, 0, 1, 1,
1.017156, -0.08183973, 3.819072, 1, 0, 0.9960784, 1,
1.020639, 1.186085, 0.09269589, 1, 0, 0.9882353, 1,
1.030162, -1.409768, 3.276756, 1, 0, 0.9843137, 1,
1.033232, -2.198167, 2.855023, 1, 0, 0.9764706, 1,
1.039815, 0.6625572, 1.423456, 1, 0, 0.972549, 1,
1.040866, 0.4532073, 0.4549358, 1, 0, 0.9647059, 1,
1.048828, 0.74309, -0.6009502, 1, 0, 0.9607843, 1,
1.051529, -0.3944775, 2.795772, 1, 0, 0.9529412, 1,
1.052637, 0.8523354, 0.575294, 1, 0, 0.9490196, 1,
1.054126, 1.141542, 0.9035752, 1, 0, 0.9411765, 1,
1.056404, 2.302354, 1.308953, 1, 0, 0.9372549, 1,
1.061089, 0.2963901, 4.782752, 1, 0, 0.9294118, 1,
1.06117, -0.5824789, 2.063535, 1, 0, 0.9254902, 1,
1.061881, -0.2776435, 1.3224, 1, 0, 0.9176471, 1,
1.062318, -0.8720503, 0.2985589, 1, 0, 0.9137255, 1,
1.063578, 2.607372, 1.489143, 1, 0, 0.9058824, 1,
1.06681, 0.715383, 0.7469907, 1, 0, 0.9019608, 1,
1.072432, -1.031201, 2.041806, 1, 0, 0.8941177, 1,
1.075032, -1.577323, 1.84564, 1, 0, 0.8862745, 1,
1.085511, 0.2187335, 0.8575243, 1, 0, 0.8823529, 1,
1.09028, 0.06829952, 1.757665, 1, 0, 0.8745098, 1,
1.097914, -0.727717, 2.107983, 1, 0, 0.8705882, 1,
1.104041, 1.628046, -0.4844275, 1, 0, 0.8627451, 1,
1.110017, -2.460839, 1.953539, 1, 0, 0.8588235, 1,
1.112393, 0.225364, -0.2915677, 1, 0, 0.8509804, 1,
1.114619, -0.6158287, 1.290594, 1, 0, 0.8470588, 1,
1.11553, 0.1926054, 1.746017, 1, 0, 0.8392157, 1,
1.12089, -1.944099, 2.302964, 1, 0, 0.8352941, 1,
1.129027, 1.408735, -0.07016168, 1, 0, 0.827451, 1,
1.131769, -0.9323635, 1.821493, 1, 0, 0.8235294, 1,
1.13217, -0.196655, -0.2119002, 1, 0, 0.8156863, 1,
1.141671, -0.368142, 1.106755, 1, 0, 0.8117647, 1,
1.143736, 0.699719, 0.2492341, 1, 0, 0.8039216, 1,
1.148157, 0.2969908, 0.7940282, 1, 0, 0.7960784, 1,
1.153055, -0.9941494, 2.976953, 1, 0, 0.7921569, 1,
1.153459, -0.2784407, 3.040062, 1, 0, 0.7843137, 1,
1.154999, 0.1325826, 0.6653699, 1, 0, 0.7803922, 1,
1.160359, -0.4577816, 0.6831216, 1, 0, 0.772549, 1,
1.162619, 0.6139832, 1.041383, 1, 0, 0.7686275, 1,
1.163318, -0.167888, 1.035046, 1, 0, 0.7607843, 1,
1.16342, 0.518063, 1.867277, 1, 0, 0.7568628, 1,
1.16971, -1.201759, 3.415534, 1, 0, 0.7490196, 1,
1.172666, 0.3522781, 0.8521976, 1, 0, 0.7450981, 1,
1.182621, 1.579196, -0.8993409, 1, 0, 0.7372549, 1,
1.183455, 1.124952, 0.6105577, 1, 0, 0.7333333, 1,
1.189685, -1.670048, 2.433351, 1, 0, 0.7254902, 1,
1.196255, -0.3147473, 2.175003, 1, 0, 0.7215686, 1,
1.20131, -3.400243, 2.58247, 1, 0, 0.7137255, 1,
1.203787, -0.8127944, 2.742537, 1, 0, 0.7098039, 1,
1.210234, 0.1263965, 2.248919, 1, 0, 0.7019608, 1,
1.214824, 1.240734, 0.4016151, 1, 0, 0.6941177, 1,
1.219746, 0.6446252, 1.072495, 1, 0, 0.6901961, 1,
1.221625, 0.8765675, 1.446277, 1, 0, 0.682353, 1,
1.22694, -0.7508237, 2.740747, 1, 0, 0.6784314, 1,
1.23224, 1.620181, 0.8003047, 1, 0, 0.6705883, 1,
1.233644, 0.8580649, -0.4747933, 1, 0, 0.6666667, 1,
1.24364, -0.677415, 2.584739, 1, 0, 0.6588235, 1,
1.259958, -0.3485159, 1.169448, 1, 0, 0.654902, 1,
1.268823, 0.02463523, 1.326994, 1, 0, 0.6470588, 1,
1.277959, 0.4056981, 1.21008, 1, 0, 0.6431373, 1,
1.29428, -2.248668, 2.018048, 1, 0, 0.6352941, 1,
1.299931, 0.9243815, 1.896175, 1, 0, 0.6313726, 1,
1.30329, -0.7145452, 2.508276, 1, 0, 0.6235294, 1,
1.304531, -0.5616261, 2.352331, 1, 0, 0.6196079, 1,
1.308762, -0.6266091, 1.431664, 1, 0, 0.6117647, 1,
1.322338, 0.4580827, 0.2376018, 1, 0, 0.6078432, 1,
1.323507, -2.605248, 2.742919, 1, 0, 0.6, 1,
1.326457, -0.9613221, 1.470599, 1, 0, 0.5921569, 1,
1.331536, 1.154269, 0.4242337, 1, 0, 0.5882353, 1,
1.344074, 1.800562, 3.333779, 1, 0, 0.5803922, 1,
1.346772, -0.1996919, 1.744786, 1, 0, 0.5764706, 1,
1.350146, 0.7837633, -0.7195706, 1, 0, 0.5686275, 1,
1.358022, -1.1499, 1.792557, 1, 0, 0.5647059, 1,
1.365471, -0.08012947, 2.634771, 1, 0, 0.5568628, 1,
1.367043, -1.650276, 3.030782, 1, 0, 0.5529412, 1,
1.367375, -0.5597968, 3.503535, 1, 0, 0.5450981, 1,
1.371331, -0.1154082, 1.916541, 1, 0, 0.5411765, 1,
1.37787, 2.296515, 1.338967, 1, 0, 0.5333334, 1,
1.394869, -0.8481656, 3.004161, 1, 0, 0.5294118, 1,
1.403312, -0.3225028, 2.664159, 1, 0, 0.5215687, 1,
1.407088, 0.3488829, -0.6294259, 1, 0, 0.5176471, 1,
1.40888, -1.150196, 0.2918837, 1, 0, 0.509804, 1,
1.410206, 1.364904, 1.777729, 1, 0, 0.5058824, 1,
1.417098, 0.1007173, 1.215698, 1, 0, 0.4980392, 1,
1.448344, -0.2753367, 1.684431, 1, 0, 0.4901961, 1,
1.452609, -0.3674164, 1.881342, 1, 0, 0.4862745, 1,
1.493435, 0.1016928, 0.7636756, 1, 0, 0.4784314, 1,
1.493865, -1.217404, 2.503623, 1, 0, 0.4745098, 1,
1.494599, -0.05596685, 0.5027222, 1, 0, 0.4666667, 1,
1.494881, -0.08096953, 2.081204, 1, 0, 0.4627451, 1,
1.501082, -1.219757, 2.773841, 1, 0, 0.454902, 1,
1.503431, 0.3669056, 4.011219, 1, 0, 0.4509804, 1,
1.521127, 1.97773, 2.119274, 1, 0, 0.4431373, 1,
1.521867, -1.251556, 1.040935, 1, 0, 0.4392157, 1,
1.531672, 0.4169987, 2.704783, 1, 0, 0.4313726, 1,
1.533831, 0.4948053, 1.181551, 1, 0, 0.427451, 1,
1.534222, -1.790523, 1.587734, 1, 0, 0.4196078, 1,
1.537042, 0.6355205, 1.109765, 1, 0, 0.4156863, 1,
1.562127, 1.356138, 0.7560527, 1, 0, 0.4078431, 1,
1.56249, 1.38791, 2.035868, 1, 0, 0.4039216, 1,
1.576221, -1.762651, 1.317105, 1, 0, 0.3960784, 1,
1.58063, -2.201653, 2.087699, 1, 0, 0.3882353, 1,
1.583635, 1.283823, 1.239119, 1, 0, 0.3843137, 1,
1.584118, -1.009011, 1.29214, 1, 0, 0.3764706, 1,
1.602065, -1.930171, 2.717267, 1, 0, 0.372549, 1,
1.615357, -0.4969386, 3.395239, 1, 0, 0.3647059, 1,
1.619462, -0.5716801, 0.9245273, 1, 0, 0.3607843, 1,
1.6204, 1.788266, 0.04915374, 1, 0, 0.3529412, 1,
1.635402, -1.041945, 0.7477224, 1, 0, 0.3490196, 1,
1.651932, 0.1467353, 0.9532243, 1, 0, 0.3411765, 1,
1.663868, -1.986964, 2.823199, 1, 0, 0.3372549, 1,
1.679329, -0.6282635, 4.189939, 1, 0, 0.3294118, 1,
1.681596, -0.8526736, 3.229791, 1, 0, 0.3254902, 1,
1.683329, -0.1267157, 1.963774, 1, 0, 0.3176471, 1,
1.689352, 0.002938012, 0.7572504, 1, 0, 0.3137255, 1,
1.711792, -0.7998967, 1.325249, 1, 0, 0.3058824, 1,
1.722192, 0.3149734, 0.1300808, 1, 0, 0.2980392, 1,
1.731346, 1.347555, 1.648969, 1, 0, 0.2941177, 1,
1.738775, -0.4961169, 1.203077, 1, 0, 0.2862745, 1,
1.74957, -0.2842705, 1.939814, 1, 0, 0.282353, 1,
1.751962, 2.175405, -2.082591, 1, 0, 0.2745098, 1,
1.754971, -0.4423908, 2.27597, 1, 0, 0.2705882, 1,
1.781073, -0.03586226, -0.565074, 1, 0, 0.2627451, 1,
1.788756, 0.07330802, 2.344424, 1, 0, 0.2588235, 1,
1.797746, 0.3741172, 1.438387, 1, 0, 0.2509804, 1,
1.807569, 0.7647696, 0.9081942, 1, 0, 0.2470588, 1,
1.815361, -1.9878, 0.6351681, 1, 0, 0.2392157, 1,
1.822778, -0.7410471, 2.760064, 1, 0, 0.2352941, 1,
1.835075, 0.9589804, 2.146775, 1, 0, 0.227451, 1,
1.840372, 0.3083063, 2.758898, 1, 0, 0.2235294, 1,
1.841249, 0.2019171, 0.3196781, 1, 0, 0.2156863, 1,
1.858888, -1.857128, 2.702351, 1, 0, 0.2117647, 1,
1.86112, 1.499626, 1.898745, 1, 0, 0.2039216, 1,
1.881771, -0.6320211, 2.206451, 1, 0, 0.1960784, 1,
1.888415, 1.020722, 1.583309, 1, 0, 0.1921569, 1,
1.893558, -1.295033, 1.752026, 1, 0, 0.1843137, 1,
1.905082, 1.814189, -0.3626827, 1, 0, 0.1803922, 1,
1.944786, -1.175002, 0.5774605, 1, 0, 0.172549, 1,
1.946327, -1.697807, 1.076496, 1, 0, 0.1686275, 1,
1.950491, -0.06599004, 2.50447, 1, 0, 0.1607843, 1,
1.979402, -1.565332, 1.779802, 1, 0, 0.1568628, 1,
1.988521, -1.260165, 2.394396, 1, 0, 0.1490196, 1,
1.990805, -0.5185373, 2.513308, 1, 0, 0.145098, 1,
1.999242, 0.2512388, 0.7206289, 1, 0, 0.1372549, 1,
2.02152, 0.2959313, -0.9957852, 1, 0, 0.1333333, 1,
2.039735, -1.358778, 1.617367, 1, 0, 0.1254902, 1,
2.07375, -0.5212901, 3.52837, 1, 0, 0.1215686, 1,
2.08825, 0.3469352, 1.295954, 1, 0, 0.1137255, 1,
2.163232, 0.8901259, 2.149004, 1, 0, 0.1098039, 1,
2.164967, 1.143842, 1.039579, 1, 0, 0.1019608, 1,
2.175535, 3.133992, 1.736361, 1, 0, 0.09411765, 1,
2.178665, 0.5093846, 2.227417, 1, 0, 0.09019608, 1,
2.219341, -0.6964341, 2.415632, 1, 0, 0.08235294, 1,
2.284129, -0.2971889, 1.248276, 1, 0, 0.07843138, 1,
2.326679, 0.3911309, 1.228975, 1, 0, 0.07058824, 1,
2.415189, 0.1231894, 2.887743, 1, 0, 0.06666667, 1,
2.530537, -0.6470347, 2.740115, 1, 0, 0.05882353, 1,
2.541303, -0.467869, 2.944774, 1, 0, 0.05490196, 1,
2.543301, -0.3867417, 1.732589, 1, 0, 0.04705882, 1,
2.567274, -0.7822107, 1.17217, 1, 0, 0.04313726, 1,
2.639233, -0.08687554, 3.605036, 1, 0, 0.03529412, 1,
2.724393, 0.02751768, 2.586922, 1, 0, 0.03137255, 1,
2.766254, 0.4469211, 0.956372, 1, 0, 0.02352941, 1,
2.797861, -0.8020713, 2.228507, 1, 0, 0.01960784, 1,
3.200171, -1.549257, 2.607311, 1, 0, 0.01176471, 1,
3.681313, 0.3074184, -0.413818, 1, 0, 0.007843138, 1
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
0.1600206, -4.507796, -6.956923, 0, -0.5, 0.5, 0.5,
0.1600206, -4.507796, -6.956923, 1, -0.5, 0.5, 0.5,
0.1600206, -4.507796, -6.956923, 1, 1.5, 0.5, 0.5,
0.1600206, -4.507796, -6.956923, 0, 1.5, 0.5, 0.5
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
-4.55499, -0.1331254, -6.956923, 0, -0.5, 0.5, 0.5,
-4.55499, -0.1331254, -6.956923, 1, -0.5, 0.5, 0.5,
-4.55499, -0.1331254, -6.956923, 1, 1.5, 0.5, 0.5,
-4.55499, -0.1331254, -6.956923, 0, 1.5, 0.5, 0.5
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
-4.55499, -4.507796, -0.2363479, 0, -0.5, 0.5, 0.5,
-4.55499, -4.507796, -0.2363479, 1, -0.5, 0.5, 0.5,
-4.55499, -4.507796, -0.2363479, 1, 1.5, 0.5, 0.5,
-4.55499, -4.507796, -0.2363479, 0, 1.5, 0.5, 0.5
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
-2, -3.498256, -5.406021,
2, -3.498256, -5.406021,
-2, -3.498256, -5.406021,
-2, -3.666513, -5.664505,
0, -3.498256, -5.406021,
0, -3.666513, -5.664505,
2, -3.498256, -5.406021,
2, -3.666513, -5.664505
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
-2, -4.003026, -6.181472, 0, -0.5, 0.5, 0.5,
-2, -4.003026, -6.181472, 1, -0.5, 0.5, 0.5,
-2, -4.003026, -6.181472, 1, 1.5, 0.5, 0.5,
-2, -4.003026, -6.181472, 0, 1.5, 0.5, 0.5,
0, -4.003026, -6.181472, 0, -0.5, 0.5, 0.5,
0, -4.003026, -6.181472, 1, -0.5, 0.5, 0.5,
0, -4.003026, -6.181472, 1, 1.5, 0.5, 0.5,
0, -4.003026, -6.181472, 0, 1.5, 0.5, 0.5,
2, -4.003026, -6.181472, 0, -0.5, 0.5, 0.5,
2, -4.003026, -6.181472, 1, -0.5, 0.5, 0.5,
2, -4.003026, -6.181472, 1, 1.5, 0.5, 0.5,
2, -4.003026, -6.181472, 0, 1.5, 0.5, 0.5
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
-3.466911, -3, -5.406021,
-3.466911, 3, -5.406021,
-3.466911, -3, -5.406021,
-3.648257, -3, -5.664505,
-3.466911, -2, -5.406021,
-3.648257, -2, -5.664505,
-3.466911, -1, -5.406021,
-3.648257, -1, -5.664505,
-3.466911, 0, -5.406021,
-3.648257, 0, -5.664505,
-3.466911, 1, -5.406021,
-3.648257, 1, -5.664505,
-3.466911, 2, -5.406021,
-3.648257, 2, -5.664505,
-3.466911, 3, -5.406021,
-3.648257, 3, -5.664505
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
-4.010951, -3, -6.181472, 0, -0.5, 0.5, 0.5,
-4.010951, -3, -6.181472, 1, -0.5, 0.5, 0.5,
-4.010951, -3, -6.181472, 1, 1.5, 0.5, 0.5,
-4.010951, -3, -6.181472, 0, 1.5, 0.5, 0.5,
-4.010951, -2, -6.181472, 0, -0.5, 0.5, 0.5,
-4.010951, -2, -6.181472, 1, -0.5, 0.5, 0.5,
-4.010951, -2, -6.181472, 1, 1.5, 0.5, 0.5,
-4.010951, -2, -6.181472, 0, 1.5, 0.5, 0.5,
-4.010951, -1, -6.181472, 0, -0.5, 0.5, 0.5,
-4.010951, -1, -6.181472, 1, -0.5, 0.5, 0.5,
-4.010951, -1, -6.181472, 1, 1.5, 0.5, 0.5,
-4.010951, -1, -6.181472, 0, 1.5, 0.5, 0.5,
-4.010951, 0, -6.181472, 0, -0.5, 0.5, 0.5,
-4.010951, 0, -6.181472, 1, -0.5, 0.5, 0.5,
-4.010951, 0, -6.181472, 1, 1.5, 0.5, 0.5,
-4.010951, 0, -6.181472, 0, 1.5, 0.5, 0.5,
-4.010951, 1, -6.181472, 0, -0.5, 0.5, 0.5,
-4.010951, 1, -6.181472, 1, -0.5, 0.5, 0.5,
-4.010951, 1, -6.181472, 1, 1.5, 0.5, 0.5,
-4.010951, 1, -6.181472, 0, 1.5, 0.5, 0.5,
-4.010951, 2, -6.181472, 0, -0.5, 0.5, 0.5,
-4.010951, 2, -6.181472, 1, -0.5, 0.5, 0.5,
-4.010951, 2, -6.181472, 1, 1.5, 0.5, 0.5,
-4.010951, 2, -6.181472, 0, 1.5, 0.5, 0.5,
-4.010951, 3, -6.181472, 0, -0.5, 0.5, 0.5,
-4.010951, 3, -6.181472, 1, -0.5, 0.5, 0.5,
-4.010951, 3, -6.181472, 1, 1.5, 0.5, 0.5,
-4.010951, 3, -6.181472, 0, 1.5, 0.5, 0.5
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
-3.466911, -3.498256, -4,
-3.466911, -3.498256, 4,
-3.466911, -3.498256, -4,
-3.648257, -3.666513, -4,
-3.466911, -3.498256, -2,
-3.648257, -3.666513, -2,
-3.466911, -3.498256, 0,
-3.648257, -3.666513, 0,
-3.466911, -3.498256, 2,
-3.648257, -3.666513, 2,
-3.466911, -3.498256, 4,
-3.648257, -3.666513, 4
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
-4.010951, -4.003026, -4, 0, -0.5, 0.5, 0.5,
-4.010951, -4.003026, -4, 1, -0.5, 0.5, 0.5,
-4.010951, -4.003026, -4, 1, 1.5, 0.5, 0.5,
-4.010951, -4.003026, -4, 0, 1.5, 0.5, 0.5,
-4.010951, -4.003026, -2, 0, -0.5, 0.5, 0.5,
-4.010951, -4.003026, -2, 1, -0.5, 0.5, 0.5,
-4.010951, -4.003026, -2, 1, 1.5, 0.5, 0.5,
-4.010951, -4.003026, -2, 0, 1.5, 0.5, 0.5,
-4.010951, -4.003026, 0, 0, -0.5, 0.5, 0.5,
-4.010951, -4.003026, 0, 1, -0.5, 0.5, 0.5,
-4.010951, -4.003026, 0, 1, 1.5, 0.5, 0.5,
-4.010951, -4.003026, 0, 0, 1.5, 0.5, 0.5,
-4.010951, -4.003026, 2, 0, -0.5, 0.5, 0.5,
-4.010951, -4.003026, 2, 1, -0.5, 0.5, 0.5,
-4.010951, -4.003026, 2, 1, 1.5, 0.5, 0.5,
-4.010951, -4.003026, 2, 0, 1.5, 0.5, 0.5,
-4.010951, -4.003026, 4, 0, -0.5, 0.5, 0.5,
-4.010951, -4.003026, 4, 1, -0.5, 0.5, 0.5,
-4.010951, -4.003026, 4, 1, 1.5, 0.5, 0.5,
-4.010951, -4.003026, 4, 0, 1.5, 0.5, 0.5
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
-3.466911, -3.498256, -5.406021,
-3.466911, 3.232006, -5.406021,
-3.466911, -3.498256, 4.933325,
-3.466911, 3.232006, 4.933325,
-3.466911, -3.498256, -5.406021,
-3.466911, -3.498256, 4.933325,
-3.466911, 3.232006, -5.406021,
-3.466911, 3.232006, 4.933325,
-3.466911, -3.498256, -5.406021,
3.786952, -3.498256, -5.406021,
-3.466911, -3.498256, 4.933325,
3.786952, -3.498256, 4.933325,
-3.466911, 3.232006, -5.406021,
3.786952, 3.232006, -5.406021,
-3.466911, 3.232006, 4.933325,
3.786952, 3.232006, 4.933325,
3.786952, -3.498256, -5.406021,
3.786952, 3.232006, -5.406021,
3.786952, -3.498256, 4.933325,
3.786952, 3.232006, 4.933325,
3.786952, -3.498256, -5.406021,
3.786952, -3.498256, 4.933325,
3.786952, 3.232006, -5.406021,
3.786952, 3.232006, 4.933325
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
var radius = 7.642026;
var distance = 34.00024;
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
mvMatrix.translate( -0.1600206, 0.1331254, 0.2363479 );
mvMatrix.scale( 1.139077, 1.227695, 0.7991519 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.00024);
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
monosodium_methylars<-read.table("monosodium_methylars.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-monosodium_methylars$V2
```

```
## Error in eval(expr, envir, enclos): object 'monosodium_methylars' not found
```

```r
y<-monosodium_methylars$V3
```

```
## Error in eval(expr, envir, enclos): object 'monosodium_methylars' not found
```

```r
z<-monosodium_methylars$V4
```

```
## Error in eval(expr, envir, enclos): object 'monosodium_methylars' not found
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
-3.361272, 2.270165, 0.1139725, 0, 0, 1, 1, 1,
-2.612324, -1.046708, -2.059147, 1, 0, 0, 1, 1,
-2.553859, -1.02309, -1.357898, 1, 0, 0, 1, 1,
-2.544898, -0.244509, -1.152892, 1, 0, 0, 1, 1,
-2.541345, -1.266034, -1.820643, 1, 0, 0, 1, 1,
-2.445517, -1.719795, -2.225052, 1, 0, 0, 1, 1,
-2.442333, -0.828218, -1.328227, 0, 0, 0, 1, 1,
-2.344975, 0.9059977, 0.1843697, 0, 0, 0, 1, 1,
-2.302764, -0.5274094, -1.419371, 0, 0, 0, 1, 1,
-2.282256, 0.3750907, -0.3427365, 0, 0, 0, 1, 1,
-2.234479, 1.37849, -2.561356, 0, 0, 0, 1, 1,
-2.21558, 1.450699, 0.1528842, 0, 0, 0, 1, 1,
-2.213189, -1.217437, -0.6627095, 0, 0, 0, 1, 1,
-2.207075, 1.361354, -0.4188699, 1, 1, 1, 1, 1,
-2.197333, -0.1370559, -2.015631, 1, 1, 1, 1, 1,
-2.174234, 0.2605835, 0.08482967, 1, 1, 1, 1, 1,
-2.172932, -0.8642772, -1.406071, 1, 1, 1, 1, 1,
-2.155694, 1.03799, -1.67994, 1, 1, 1, 1, 1,
-2.118218, -1.66714, -2.49463, 1, 1, 1, 1, 1,
-2.09529, -0.09917576, -0.9184098, 1, 1, 1, 1, 1,
-2.087351, 0.1062958, -0.8806897, 1, 1, 1, 1, 1,
-2.083904, -0.6070672, -3.346172, 1, 1, 1, 1, 1,
-2.059583, 0.3782617, -0.5602239, 1, 1, 1, 1, 1,
-2.042525, -0.8605468, -3.048954, 1, 1, 1, 1, 1,
-1.96065, -1.344829, -1.315579, 1, 1, 1, 1, 1,
-1.934375, 0.2589558, -1.558144, 1, 1, 1, 1, 1,
-1.910289, -0.5439148, -1.862461, 1, 1, 1, 1, 1,
-1.881786, -0.5581501, 0.8218095, 1, 1, 1, 1, 1,
-1.873417, -0.56992, -3.250863, 0, 0, 1, 1, 1,
-1.87114, 0.3851566, -1.753134, 1, 0, 0, 1, 1,
-1.866691, -0.4567086, -1.985993, 1, 0, 0, 1, 1,
-1.850891, -1.00631, -3.167437, 1, 0, 0, 1, 1,
-1.811465, 0.6076333, -0.6298039, 1, 0, 0, 1, 1,
-1.798521, -0.2200599, -0.6691202, 1, 0, 0, 1, 1,
-1.795843, 1.053597, 0.4425395, 0, 0, 0, 1, 1,
-1.795505, 0.6950338, -3.259084, 0, 0, 0, 1, 1,
-1.792256, 0.00256809, -1.03998, 0, 0, 0, 1, 1,
-1.780164, -2.32898, -2.035223, 0, 0, 0, 1, 1,
-1.778153, -0.6642674, -0.02197591, 0, 0, 0, 1, 1,
-1.765175, -0.2465121, -1.992317, 0, 0, 0, 1, 1,
-1.761544, 0.1564781, -1.292463, 0, 0, 0, 1, 1,
-1.738237, -0.06033545, -1.092811, 1, 1, 1, 1, 1,
-1.709812, 0.1131717, -0.6564828, 1, 1, 1, 1, 1,
-1.709464, 0.9410759, 0.3360702, 1, 1, 1, 1, 1,
-1.706264, -1.69342, -2.268926, 1, 1, 1, 1, 1,
-1.702863, -0.5211856, -1.559185, 1, 1, 1, 1, 1,
-1.695935, -0.6053057, -4.293257, 1, 1, 1, 1, 1,
-1.695464, 1.019924, -0.7597144, 1, 1, 1, 1, 1,
-1.688789, -0.4466035, -2.676728, 1, 1, 1, 1, 1,
-1.681846, 0.4673357, -3.240767, 1, 1, 1, 1, 1,
-1.668465, -0.7921618, -2.772498, 1, 1, 1, 1, 1,
-1.666272, -2.010463, -1.548729, 1, 1, 1, 1, 1,
-1.665356, 0.805714, -1.501671, 1, 1, 1, 1, 1,
-1.655055, -0.7440562, -1.179652, 1, 1, 1, 1, 1,
-1.65102, 0.6881546, -0.4118409, 1, 1, 1, 1, 1,
-1.647164, 0.1286736, -0.5004737, 1, 1, 1, 1, 1,
-1.63983, -0.1205465, 0.39398, 0, 0, 1, 1, 1,
-1.63185, 0.3120865, -2.370134, 1, 0, 0, 1, 1,
-1.626704, -0.7974811, -1.980451, 1, 0, 0, 1, 1,
-1.626047, 0.6088807, -2.971427, 1, 0, 0, 1, 1,
-1.625895, -1.243536, -1.309728, 1, 0, 0, 1, 1,
-1.620263, 0.6998008, -0.7278188, 1, 0, 0, 1, 1,
-1.618648, 0.8316656, -0.8795711, 0, 0, 0, 1, 1,
-1.588356, -0.3659727, -1.852634, 0, 0, 0, 1, 1,
-1.577574, 0.1880894, 0.2425633, 0, 0, 0, 1, 1,
-1.571177, -1.475843, -2.890085, 0, 0, 0, 1, 1,
-1.564631, -0.4059289, -2.007456, 0, 0, 0, 1, 1,
-1.548287, -0.6281417, -0.4726476, 0, 0, 0, 1, 1,
-1.544526, -0.3459625, -2.82741, 0, 0, 0, 1, 1,
-1.531096, -1.503264, -1.82535, 1, 1, 1, 1, 1,
-1.530742, -0.4766597, -1.928721, 1, 1, 1, 1, 1,
-1.524411, 1.322347, -2.522507, 1, 1, 1, 1, 1,
-1.515773, 0.8043067, -1.994743, 1, 1, 1, 1, 1,
-1.515582, 0.2270853, -2.240941, 1, 1, 1, 1, 1,
-1.515533, 1.754556, -0.6884706, 1, 1, 1, 1, 1,
-1.510455, -0.7591743, -0.5416564, 1, 1, 1, 1, 1,
-1.498685, 1.675282, -1.657789, 1, 1, 1, 1, 1,
-1.488981, 0.4896889, -0.4829234, 1, 1, 1, 1, 1,
-1.487145, -2.747194, -2.904248, 1, 1, 1, 1, 1,
-1.458162, 0.3357986, -0.1315415, 1, 1, 1, 1, 1,
-1.455943, 0.7520581, -1.542488, 1, 1, 1, 1, 1,
-1.442395, -0.04280989, -2.825323, 1, 1, 1, 1, 1,
-1.440005, 1.738058, -0.003789648, 1, 1, 1, 1, 1,
-1.420567, -0.6253074, -2.669853, 1, 1, 1, 1, 1,
-1.413604, -1.698932, -2.218383, 0, 0, 1, 1, 1,
-1.413091, -0.346568, -1.81103, 1, 0, 0, 1, 1,
-1.408671, -0.3017383, -1.744571, 1, 0, 0, 1, 1,
-1.408216, 1.199428, 0.4341052, 1, 0, 0, 1, 1,
-1.397282, -0.2528777, -1.975298, 1, 0, 0, 1, 1,
-1.382609, 1.327874, -0.9437433, 1, 0, 0, 1, 1,
-1.379787, -1.35823, -1.577536, 0, 0, 0, 1, 1,
-1.374152, 0.5995612, 0.3884943, 0, 0, 0, 1, 1,
-1.373951, -1.164527, -1.299882, 0, 0, 0, 1, 1,
-1.373533, -0.846785, -1.450251, 0, 0, 0, 1, 1,
-1.371083, 0.1719417, -1.137918, 0, 0, 0, 1, 1,
-1.37006, -0.2313986, -3.34556, 0, 0, 0, 1, 1,
-1.369698, 1.216009, -0.8692827, 0, 0, 0, 1, 1,
-1.359471, -0.5887365, -2.100955, 1, 1, 1, 1, 1,
-1.34347, 1.121682, -0.7739888, 1, 1, 1, 1, 1,
-1.339849, -0.1108897, -0.1612097, 1, 1, 1, 1, 1,
-1.33733, 0.1790446, -1.392341, 1, 1, 1, 1, 1,
-1.337229, -1.778485, -2.201404, 1, 1, 1, 1, 1,
-1.335751, -0.6377882, -1.762729, 1, 1, 1, 1, 1,
-1.334224, 0.9711468, -0.1949458, 1, 1, 1, 1, 1,
-1.329556, 0.7186128, -1.432337, 1, 1, 1, 1, 1,
-1.326677, -0.04512414, -2.225953, 1, 1, 1, 1, 1,
-1.307896, -0.8048888, -1.229826, 1, 1, 1, 1, 1,
-1.295161, -0.1795846, 0.1431535, 1, 1, 1, 1, 1,
-1.294075, 1.075374, 0.2674264, 1, 1, 1, 1, 1,
-1.276343, 0.05737972, -1.340896, 1, 1, 1, 1, 1,
-1.274216, -0.3571045, -2.355067, 1, 1, 1, 1, 1,
-1.273139, 0.1552624, -2.386483, 1, 1, 1, 1, 1,
-1.268468, 1.174823, 0.1994792, 0, 0, 1, 1, 1,
-1.23884, 0.3060618, -2.442561, 1, 0, 0, 1, 1,
-1.238223, -0.07499043, -1.558927, 1, 0, 0, 1, 1,
-1.225312, 1.459367, -2.054836, 1, 0, 0, 1, 1,
-1.222973, -0.8036466, -4.141287, 1, 0, 0, 1, 1,
-1.216528, -0.6272169, -3.161816, 1, 0, 0, 1, 1,
-1.21209, -1.124329, -2.979615, 0, 0, 0, 1, 1,
-1.205534, 0.505537, -1.575882, 0, 0, 0, 1, 1,
-1.201813, -0.506615, -1.012011, 0, 0, 0, 1, 1,
-1.19062, -0.6023142, -1.405982, 0, 0, 0, 1, 1,
-1.186035, 0.9198752, -0.1428576, 0, 0, 0, 1, 1,
-1.165056, 0.5372522, -2.00592, 0, 0, 0, 1, 1,
-1.165037, -0.6143754, -1.442869, 0, 0, 0, 1, 1,
-1.152329, 0.7512928, -1.860024, 1, 1, 1, 1, 1,
-1.148691, 0.01292535, -1.422048, 1, 1, 1, 1, 1,
-1.148394, 1.348973, -0.4121383, 1, 1, 1, 1, 1,
-1.148182, -0.4685263, -1.876317, 1, 1, 1, 1, 1,
-1.143386, 1.841135, 0.03935562, 1, 1, 1, 1, 1,
-1.139979, -0.1490189, -1.918928, 1, 1, 1, 1, 1,
-1.122583, 1.061045, 0.2849707, 1, 1, 1, 1, 1,
-1.12201, 1.560525, -0.2311345, 1, 1, 1, 1, 1,
-1.11767, -0.05838295, -1.63029, 1, 1, 1, 1, 1,
-1.11639, -0.9375997, -2.296814, 1, 1, 1, 1, 1,
-1.111385, 0.09271008, -2.137316, 1, 1, 1, 1, 1,
-1.107754, 0.5146549, -0.4249457, 1, 1, 1, 1, 1,
-1.105847, -1.819819, -1.805394, 1, 1, 1, 1, 1,
-1.103118, -1.254571, -1.451352, 1, 1, 1, 1, 1,
-1.101911, 0.3352383, -0.9958822, 1, 1, 1, 1, 1,
-1.095022, -0.8733558, -2.38349, 0, 0, 1, 1, 1,
-1.091597, 1.064866, -0.1200769, 1, 0, 0, 1, 1,
-1.076041, 0.2900832, -1.189871, 1, 0, 0, 1, 1,
-1.069634, -1.40887, -1.282362, 1, 0, 0, 1, 1,
-1.065589, 1.378195, -1.577676, 1, 0, 0, 1, 1,
-1.054675, -0.58135, -2.616853, 1, 0, 0, 1, 1,
-1.05281, -0.02315346, -3.119112, 0, 0, 0, 1, 1,
-1.046442, -0.300961, -2.01469, 0, 0, 0, 1, 1,
-1.042346, -0.286929, -2.925094, 0, 0, 0, 1, 1,
-1.031449, -0.6913968, -2.322219, 0, 0, 0, 1, 1,
-1.027696, 0.765099, 0.5667201, 0, 0, 0, 1, 1,
-1.02371, -0.2668129, -4.419599, 0, 0, 0, 1, 1,
-1.018413, -0.1507242, 0.1075597, 0, 0, 0, 1, 1,
-1.015716, -0.979205, -1.27294, 1, 1, 1, 1, 1,
-1.015084, 0.3918116, -1.886043, 1, 1, 1, 1, 1,
-1.01333, -0.7047436, -1.780624, 1, 1, 1, 1, 1,
-0.9989632, -0.8974255, -3.461702, 1, 1, 1, 1, 1,
-0.9959565, 0.2002885, -0.8574135, 1, 1, 1, 1, 1,
-0.9930604, 1.313347, -0.5823717, 1, 1, 1, 1, 1,
-0.992471, -0.5158696, -1.781757, 1, 1, 1, 1, 1,
-0.9857762, -0.5692013, -1.354607, 1, 1, 1, 1, 1,
-0.9842622, 0.7396773, -0.3061078, 1, 1, 1, 1, 1,
-0.97905, 0.08777813, -1.406831, 1, 1, 1, 1, 1,
-0.9765538, -1.209489, -1.964733, 1, 1, 1, 1, 1,
-0.9756631, 0.1401814, -0.7036877, 1, 1, 1, 1, 1,
-0.9700191, 0.5838213, -1.731217, 1, 1, 1, 1, 1,
-0.9655302, -0.244262, -1.972342, 1, 1, 1, 1, 1,
-0.9535914, 0.8262492, -3.784867, 1, 1, 1, 1, 1,
-0.9505864, 0.7684895, -0.4287625, 0, 0, 1, 1, 1,
-0.9492976, 0.512277, 1.015371, 1, 0, 0, 1, 1,
-0.947857, 1.009778, -1.109197, 1, 0, 0, 1, 1,
-0.9457544, -0.3621839, -3.679172, 1, 0, 0, 1, 1,
-0.9406682, -0.1239126, -0.9858539, 1, 0, 0, 1, 1,
-0.9398983, -0.08845989, -1.77445, 1, 0, 0, 1, 1,
-0.9364036, 0.9773894, 0.09156349, 0, 0, 0, 1, 1,
-0.9306189, -1.276803, -1.716451, 0, 0, 0, 1, 1,
-0.9247093, -2.275209, -3.806351, 0, 0, 0, 1, 1,
-0.9230326, -0.1842835, -3.814194, 0, 0, 0, 1, 1,
-0.9114912, -0.3367794, -1.64752, 0, 0, 0, 1, 1,
-0.9079629, -0.2829511, -0.3321391, 0, 0, 0, 1, 1,
-0.9053036, 0.9806328, -1.374806, 0, 0, 0, 1, 1,
-0.9042338, -0.840828, -3.417741, 1, 1, 1, 1, 1,
-0.9028168, 2.788927, -0.2553846, 1, 1, 1, 1, 1,
-0.8975743, -0.3080192, -4.411992, 1, 1, 1, 1, 1,
-0.8963464, 0.1284716, 0.4467433, 1, 1, 1, 1, 1,
-0.8952807, 1.203447, -0.2988421, 1, 1, 1, 1, 1,
-0.8951067, 1.138648, -0.5437655, 1, 1, 1, 1, 1,
-0.8950827, -2.570334, -5.255448, 1, 1, 1, 1, 1,
-0.889318, 0.06429281, -1.374445, 1, 1, 1, 1, 1,
-0.8857363, 0.7708516, -0.8712728, 1, 1, 1, 1, 1,
-0.8842841, -0.1008785, -1.035456, 1, 1, 1, 1, 1,
-0.8839651, -1.097722, -2.702942, 1, 1, 1, 1, 1,
-0.8803298, 1.269388, -0.7952757, 1, 1, 1, 1, 1,
-0.8791531, -0.3899249, -2.225112, 1, 1, 1, 1, 1,
-0.8752671, -0.301764, -1.058721, 1, 1, 1, 1, 1,
-0.8746539, 0.5461696, -0.8423765, 1, 1, 1, 1, 1,
-0.8712667, 1.519376, -0.7034468, 0, 0, 1, 1, 1,
-0.8630198, 0.8668027, -0.2231416, 1, 0, 0, 1, 1,
-0.8541054, -0.5172782, -3.431009, 1, 0, 0, 1, 1,
-0.8500676, -0.2533018, -3.010121, 1, 0, 0, 1, 1,
-0.849724, -0.4289749, -4.821054, 1, 0, 0, 1, 1,
-0.8479491, -0.4068564, -1.392385, 1, 0, 0, 1, 1,
-0.8441422, -1.135522, -0.6151556, 0, 0, 0, 1, 1,
-0.842432, -0.4320765, -3.203094, 0, 0, 0, 1, 1,
-0.8408481, -0.2176045, -1.296337, 0, 0, 0, 1, 1,
-0.8306987, 0.007903887, -2.79, 0, 0, 0, 1, 1,
-0.8273904, -0.09744477, -2.74975, 0, 0, 0, 1, 1,
-0.8251519, 0.05071432, -1.312991, 0, 0, 0, 1, 1,
-0.8238154, -1.427339, -3.954367, 0, 0, 0, 1, 1,
-0.8227154, 0.04530798, -1.456676, 1, 1, 1, 1, 1,
-0.8226629, -0.7422941, -2.615504, 1, 1, 1, 1, 1,
-0.8202855, 1.190439, 0.1676527, 1, 1, 1, 1, 1,
-0.8176594, -0.1946274, -2.343598, 1, 1, 1, 1, 1,
-0.8170213, 1.561227, -0.328205, 1, 1, 1, 1, 1,
-0.812267, -0.4137124, -1.897023, 1, 1, 1, 1, 1,
-0.8119258, -0.8543734, -0.8722614, 1, 1, 1, 1, 1,
-0.8106537, 2.081018, 1.285003, 1, 1, 1, 1, 1,
-0.809876, 0.01202218, -2.87763, 1, 1, 1, 1, 1,
-0.8088158, 0.3654541, -0.2337774, 1, 1, 1, 1, 1,
-0.8061689, -0.8430421, -1.336674, 1, 1, 1, 1, 1,
-0.8038593, 2.115515, 0.7513616, 1, 1, 1, 1, 1,
-0.801143, -0.1909125, -0.196254, 1, 1, 1, 1, 1,
-0.7930574, -0.2514093, -2.055032, 1, 1, 1, 1, 1,
-0.7886341, 0.6517777, -0.9613093, 1, 1, 1, 1, 1,
-0.7879281, 0.6328738, -1.001561, 0, 0, 1, 1, 1,
-0.7841561, 0.2976182, 0.007560513, 1, 0, 0, 1, 1,
-0.7827094, 0.05649302, -1.205317, 1, 0, 0, 1, 1,
-0.7764215, 0.5767233, -1.339451, 1, 0, 0, 1, 1,
-0.7750775, -0.5033451, -0.03455086, 1, 0, 0, 1, 1,
-0.7683174, 1.503224, -0.8692239, 1, 0, 0, 1, 1,
-0.7652819, 1.062058, -0.586476, 0, 0, 0, 1, 1,
-0.7630914, -0.7057208, -3.014873, 0, 0, 0, 1, 1,
-0.7615182, 0.4425506, 0.1949838, 0, 0, 0, 1, 1,
-0.7615101, -0.5611315, -1.829969, 0, 0, 0, 1, 1,
-0.7601124, -0.06163994, -0.8091597, 0, 0, 0, 1, 1,
-0.754006, -0.04181486, 0.3516237, 0, 0, 0, 1, 1,
-0.7536522, -1.011485, -1.435409, 0, 0, 0, 1, 1,
-0.7519411, 2.491007, -0.8131104, 1, 1, 1, 1, 1,
-0.7409522, -0.4281028, -2.455777, 1, 1, 1, 1, 1,
-0.736097, -1.252221, -3.189486, 1, 1, 1, 1, 1,
-0.728252, 1.229317, -0.5956143, 1, 1, 1, 1, 1,
-0.7240779, 0.8051199, 0.985455, 1, 1, 1, 1, 1,
-0.7240575, 0.05139777, -1.181147, 1, 1, 1, 1, 1,
-0.7228579, -1.187039, -1.939898, 1, 1, 1, 1, 1,
-0.7216619, -0.4899068, -3.053427, 1, 1, 1, 1, 1,
-0.7204499, 0.08818864, -1.321479, 1, 1, 1, 1, 1,
-0.7201595, -0.205354, -1.589836, 1, 1, 1, 1, 1,
-0.7199793, -0.2669553, -3.066246, 1, 1, 1, 1, 1,
-0.7187386, 0.4464201, -2.953858, 1, 1, 1, 1, 1,
-0.7161443, -0.04086055, -2.569737, 1, 1, 1, 1, 1,
-0.714236, 0.3422389, -0.7097378, 1, 1, 1, 1, 1,
-0.710934, 0.3021234, -1.085321, 1, 1, 1, 1, 1,
-0.7070224, 0.06715634, -1.4164, 0, 0, 1, 1, 1,
-0.7068701, 0.854543, -0.5144962, 1, 0, 0, 1, 1,
-0.7058082, -1.467112, -3.004062, 1, 0, 0, 1, 1,
-0.7053335, 0.5666206, -0.5188054, 1, 0, 0, 1, 1,
-0.7025597, -0.7432999, -2.897113, 1, 0, 0, 1, 1,
-0.7022539, 1.208542, -0.8580223, 1, 0, 0, 1, 1,
-0.7012858, -0.1202593, -0.1952076, 0, 0, 0, 1, 1,
-0.6988662, -0.07782585, -0.04124224, 0, 0, 0, 1, 1,
-0.695958, -1.721874, -2.189921, 0, 0, 0, 1, 1,
-0.6940172, -3.151691, -2.673476, 0, 0, 0, 1, 1,
-0.6914394, 0.5077606, -0.5651999, 0, 0, 0, 1, 1,
-0.6902273, 0.3891507, -3.261349, 0, 0, 0, 1, 1,
-0.6902245, 0.396166, -1.927619, 0, 0, 0, 1, 1,
-0.6847972, 2.267933, 0.1652657, 1, 1, 1, 1, 1,
-0.670761, 0.7788092, -0.8443787, 1, 1, 1, 1, 1,
-0.6653173, -0.1047513, -0.3845939, 1, 1, 1, 1, 1,
-0.6640695, -0.4096468, -2.632706, 1, 1, 1, 1, 1,
-0.6632617, 0.5467897, -2.646882, 1, 1, 1, 1, 1,
-0.6583433, 0.2233097, -1.255219, 1, 1, 1, 1, 1,
-0.6557977, 1.010999, 0.003763538, 1, 1, 1, 1, 1,
-0.6557111, 0.03453014, -0.4789233, 1, 1, 1, 1, 1,
-0.6468794, -0.1289936, -2.515609, 1, 1, 1, 1, 1,
-0.6234083, -1.110889, -2.858649, 1, 1, 1, 1, 1,
-0.6195469, 0.7764733, -1.531106, 1, 1, 1, 1, 1,
-0.6145061, -1.087651, -3.172668, 1, 1, 1, 1, 1,
-0.6101465, -0.2059062, -2.309922, 1, 1, 1, 1, 1,
-0.6081724, 0.997017, -1.766543, 1, 1, 1, 1, 1,
-0.6078048, 0.5982277, -0.3263701, 1, 1, 1, 1, 1,
-0.6065243, -1.210118, -2.06925, 0, 0, 1, 1, 1,
-0.606079, 1.607565, -0.4804024, 1, 0, 0, 1, 1,
-0.6019154, -1.223369, -2.397802, 1, 0, 0, 1, 1,
-0.59588, 0.1932125, -0.9129193, 1, 0, 0, 1, 1,
-0.5920518, 0.555392, -0.5373004, 1, 0, 0, 1, 1,
-0.5901564, -0.8984805, -2.598523, 1, 0, 0, 1, 1,
-0.5862193, 1.170559, -0.868324, 0, 0, 0, 1, 1,
-0.5842113, -0.8819575, -0.9050012, 0, 0, 0, 1, 1,
-0.574569, 0.4055612, -0.788104, 0, 0, 0, 1, 1,
-0.5732356, -1.25831, -1.80295, 0, 0, 0, 1, 1,
-0.5722086, -0.04982173, -1.792311, 0, 0, 0, 1, 1,
-0.5705004, 1.344996, 0.4470569, 0, 0, 0, 1, 1,
-0.5701312, -0.1167813, -2.111373, 0, 0, 0, 1, 1,
-0.566599, -0.5642554, -4.318819, 1, 1, 1, 1, 1,
-0.5654275, -0.2343752, -2.323166, 1, 1, 1, 1, 1,
-0.5616682, 0.6443254, -0.5954438, 1, 1, 1, 1, 1,
-0.5410194, 0.2516417, -1.036243, 1, 1, 1, 1, 1,
-0.5361454, 1.736593, -0.2043622, 1, 1, 1, 1, 1,
-0.5343738, 0.2782899, -1.921984, 1, 1, 1, 1, 1,
-0.532531, 0.4815212, -1.761021, 1, 1, 1, 1, 1,
-0.5284281, -0.01500186, -2.194947, 1, 1, 1, 1, 1,
-0.5212551, 0.2661795, -0.7504688, 1, 1, 1, 1, 1,
-0.5210828, -0.1955105, -0.8072104, 1, 1, 1, 1, 1,
-0.5210279, -0.0907581, -1.334885, 1, 1, 1, 1, 1,
-0.5157784, -0.3416942, -0.4546015, 1, 1, 1, 1, 1,
-0.5139529, 1.832919, 0.5557315, 1, 1, 1, 1, 1,
-0.5131964, 1.603168, -3.219755, 1, 1, 1, 1, 1,
-0.5068474, -0.2678364, -1.266281, 1, 1, 1, 1, 1,
-0.5049247, -1.467031, -3.189431, 0, 0, 1, 1, 1,
-0.4989992, 1.138949, -1.175336, 1, 0, 0, 1, 1,
-0.4982807, -1.984427, -2.649953, 1, 0, 0, 1, 1,
-0.4962785, 0.3685488, -0.5166162, 1, 0, 0, 1, 1,
-0.4944873, -0.6211211, -2.893488, 1, 0, 0, 1, 1,
-0.4932601, 0.5597022, -1.246343, 1, 0, 0, 1, 1,
-0.4918394, -0.4903287, -1.1001, 0, 0, 0, 1, 1,
-0.4895362, -0.2069397, -1.626713, 0, 0, 0, 1, 1,
-0.4895029, -0.1807065, -2.05601, 0, 0, 0, 1, 1,
-0.4891784, -1.46351, -3.129112, 0, 0, 0, 1, 1,
-0.4883339, 1.144788, 1.043104, 0, 0, 0, 1, 1,
-0.4790988, -0.5385718, -3.394794, 0, 0, 0, 1, 1,
-0.4720985, -1.0902, -3.171383, 0, 0, 0, 1, 1,
-0.4683757, 0.4336459, 0.1626069, 1, 1, 1, 1, 1,
-0.4666554, -0.09080522, 0.06783346, 1, 1, 1, 1, 1,
-0.4613528, 0.5749701, 0.1852549, 1, 1, 1, 1, 1,
-0.4588165, 0.2403571, -0.8085248, 1, 1, 1, 1, 1,
-0.4527271, 0.5116925, -1.980898, 1, 1, 1, 1, 1,
-0.4526921, 2.005673, -1.252896, 1, 1, 1, 1, 1,
-0.4513823, 0.03578283, -1.87293, 1, 1, 1, 1, 1,
-0.4512978, -1.481053, -2.465869, 1, 1, 1, 1, 1,
-0.4510473, -0.5802011, -4.117766, 1, 1, 1, 1, 1,
-0.4510435, 0.7778063, 0.7630066, 1, 1, 1, 1, 1,
-0.4469523, 0.237911, -0.6683592, 1, 1, 1, 1, 1,
-0.4456669, -1.187156, -2.464253, 1, 1, 1, 1, 1,
-0.4436924, -0.4161353, -0.465217, 1, 1, 1, 1, 1,
-0.4415885, -0.1325068, -1.675258, 1, 1, 1, 1, 1,
-0.4411252, -0.2565292, -2.477913, 1, 1, 1, 1, 1,
-0.4354115, -1.29805, -2.569817, 0, 0, 1, 1, 1,
-0.4342623, 0.2920436, -1.547214, 1, 0, 0, 1, 1,
-0.4300609, 0.8104524, 0.4216512, 1, 0, 0, 1, 1,
-0.4295799, -0.3079656, -2.455458, 1, 0, 0, 1, 1,
-0.4287533, 0.9851424, -0.09410072, 1, 0, 0, 1, 1,
-0.4282028, -0.03764036, -1.233006, 1, 0, 0, 1, 1,
-0.4260094, 0.4494438, 0.2463367, 0, 0, 0, 1, 1,
-0.4228479, 0.7955449, 0.2538366, 0, 0, 0, 1, 1,
-0.4221185, -1.318634, -3.770872, 0, 0, 0, 1, 1,
-0.4208407, -0.7926417, -0.9272209, 0, 0, 0, 1, 1,
-0.41993, -1.515301, -2.004571, 0, 0, 0, 1, 1,
-0.418797, -1.760528, -2.512624, 0, 0, 0, 1, 1,
-0.4173804, -0.8116346, -1.568594, 0, 0, 0, 1, 1,
-0.4103174, 1.871474, 0.101338, 1, 1, 1, 1, 1,
-0.4075983, -0.6839708, -3.502854, 1, 1, 1, 1, 1,
-0.4060946, 1.632383, 0.3804674, 1, 1, 1, 1, 1,
-0.4057545, -1.979159, -2.156883, 1, 1, 1, 1, 1,
-0.4053718, 0.483558, -0.2262083, 1, 1, 1, 1, 1,
-0.403914, -0.01121029, -2.801508, 1, 1, 1, 1, 1,
-0.4020007, 0.5378516, -1.100199, 1, 1, 1, 1, 1,
-0.3946976, 1.859325, 1.217579, 1, 1, 1, 1, 1,
-0.3945686, -1.507183, -3.276227, 1, 1, 1, 1, 1,
-0.3886399, 0.2973316, -0.006360025, 1, 1, 1, 1, 1,
-0.3817619, 1.00504, 0.4485455, 1, 1, 1, 1, 1,
-0.379712, 0.002583765, -1.514622, 1, 1, 1, 1, 1,
-0.3796588, -2.195287, -3.244285, 1, 1, 1, 1, 1,
-0.3791353, -0.3463144, -0.749502, 1, 1, 1, 1, 1,
-0.3765261, 0.9764154, 1.147484, 1, 1, 1, 1, 1,
-0.3743072, -0.3313118, -1.930716, 0, 0, 1, 1, 1,
-0.3731359, 0.2400435, 1.117987, 1, 0, 0, 1, 1,
-0.3711267, 1.368263, -0.8433448, 1, 0, 0, 1, 1,
-0.3698324, 2.637878, 0.1862201, 1, 0, 0, 1, 1,
-0.3683879, 1.544136, 0.4344375, 1, 0, 0, 1, 1,
-0.3577407, -0.02249808, -2.190139, 1, 0, 0, 1, 1,
-0.3559082, 1.653227, -0.3054081, 0, 0, 0, 1, 1,
-0.3553826, -0.5786401, -3.326811, 0, 0, 0, 1, 1,
-0.351687, -0.05339655, -0.5015395, 0, 0, 0, 1, 1,
-0.3491429, -0.170855, -2.867783, 0, 0, 0, 1, 1,
-0.3473697, 0.08442163, -1.656846, 0, 0, 0, 1, 1,
-0.3452642, 0.9818519, 1.022204, 0, 0, 0, 1, 1,
-0.3436404, 0.08386678, -1.038882, 0, 0, 0, 1, 1,
-0.3418367, 2.007131, 0.3408025, 1, 1, 1, 1, 1,
-0.3306872, -1.910308, -2.512585, 1, 1, 1, 1, 1,
-0.3301362, 0.3194927, -1.150021, 1, 1, 1, 1, 1,
-0.3277822, 0.383125, -0.9327059, 1, 1, 1, 1, 1,
-0.3275977, -0.4822293, -3.344099, 1, 1, 1, 1, 1,
-0.3230511, -1.12841, -3.402339, 1, 1, 1, 1, 1,
-0.3221399, -1.682689, -3.194602, 1, 1, 1, 1, 1,
-0.3182054, 0.1886254, -0.07978156, 1, 1, 1, 1, 1,
-0.3167946, -0.01754183, -1.715107, 1, 1, 1, 1, 1,
-0.3045172, 0.07909621, -1.215266, 1, 1, 1, 1, 1,
-0.3038128, -1.471164, -2.742539, 1, 1, 1, 1, 1,
-0.3006657, 0.1812372, -3.372433, 1, 1, 1, 1, 1,
-0.2967519, -0.130002, -0.007377024, 1, 1, 1, 1, 1,
-0.2890894, 0.7775612, -2.294981, 1, 1, 1, 1, 1,
-0.2835799, 0.645412, -0.7642294, 1, 1, 1, 1, 1,
-0.2829785, 1.533322, -0.4654134, 0, 0, 1, 1, 1,
-0.2816177, -0.1710756, -2.932791, 1, 0, 0, 1, 1,
-0.279869, 1.374359, -0.1584741, 1, 0, 0, 1, 1,
-0.2761461, -0.306481, -2.194462, 1, 0, 0, 1, 1,
-0.2752361, -0.2685715, -4.381759, 1, 0, 0, 1, 1,
-0.2750925, 0.2636834, 0.742911, 1, 0, 0, 1, 1,
-0.2733206, -0.5659377, -2.094349, 0, 0, 0, 1, 1,
-0.2707769, 0.7679829, -1.144597, 0, 0, 0, 1, 1,
-0.2622645, 1.881647, -0.5072085, 0, 0, 0, 1, 1,
-0.2584457, -0.2884209, -3.862843, 0, 0, 0, 1, 1,
-0.2582197, -0.8713346, -2.31306, 0, 0, 0, 1, 1,
-0.252903, -0.7142465, -2.691424, 0, 0, 0, 1, 1,
-0.2519718, -0.3672869, -2.78955, 0, 0, 0, 1, 1,
-0.2514516, 0.9953867, -0.1611946, 1, 1, 1, 1, 1,
-0.2509646, -0.5167723, -2.977078, 1, 1, 1, 1, 1,
-0.2509048, -0.1010589, -0.874993, 1, 1, 1, 1, 1,
-0.2450462, 1.69393, 1.170368, 1, 1, 1, 1, 1,
-0.2435893, -0.2826918, -2.957732, 1, 1, 1, 1, 1,
-0.2388191, 0.6051698, -0.6672091, 1, 1, 1, 1, 1,
-0.2364059, 0.3772609, -1.070483, 1, 1, 1, 1, 1,
-0.2315811, 1.041688, 1.321524, 1, 1, 1, 1, 1,
-0.2305195, -0.4052912, -2.832787, 1, 1, 1, 1, 1,
-0.2303578, -0.1847364, -3.906202, 1, 1, 1, 1, 1,
-0.2293756, 0.003955642, -1.841612, 1, 1, 1, 1, 1,
-0.2214194, 1.498227, 0.2020212, 1, 1, 1, 1, 1,
-0.2205076, -0.1522717, -0.4635301, 1, 1, 1, 1, 1,
-0.2178967, 0.1001375, -1.223254, 1, 1, 1, 1, 1,
-0.2174334, 0.135565, -1.346093, 1, 1, 1, 1, 1,
-0.2143194, 1.061768, 1.977843, 0, 0, 1, 1, 1,
-0.2136747, 0.838707, 0.8403089, 1, 0, 0, 1, 1,
-0.2103737, 1.328027, 0.09975632, 1, 0, 0, 1, 1,
-0.2097069, 1.460572, -0.02017827, 1, 0, 0, 1, 1,
-0.2089711, 0.5115253, 0.1521665, 1, 0, 0, 1, 1,
-0.208611, -0.9672667, -1.804685, 1, 0, 0, 1, 1,
-0.2057944, -0.51622, -2.39139, 0, 0, 0, 1, 1,
-0.2027856, 1.062839, 0.4351863, 0, 0, 0, 1, 1,
-0.2013096, 0.3486108, -0.6770784, 0, 0, 0, 1, 1,
-0.1943892, 1.693769, 0.7788244, 0, 0, 0, 1, 1,
-0.1919143, -0.4000395, -2.882345, 0, 0, 0, 1, 1,
-0.1913782, -1.042137, -4.694977, 0, 0, 0, 1, 1,
-0.1898184, 1.843997, -1.732775, 0, 0, 0, 1, 1,
-0.1884593, -0.4900468, -1.297096, 1, 1, 1, 1, 1,
-0.168343, -1.418733, -1.753825, 1, 1, 1, 1, 1,
-0.1676244, -0.588026, -3.062505, 1, 1, 1, 1, 1,
-0.1641053, 0.5083886, 0.2759219, 1, 1, 1, 1, 1,
-0.1602556, 1.196422, -0.1115203, 1, 1, 1, 1, 1,
-0.1491083, 1.001015, -1.166372, 1, 1, 1, 1, 1,
-0.1423484, -0.5169273, -2.013551, 1, 1, 1, 1, 1,
-0.1385657, -0.5325277, -4.024849, 1, 1, 1, 1, 1,
-0.1335932, 0.8686343, 0.5503546, 1, 1, 1, 1, 1,
-0.1293441, -0.6890672, -3.682204, 1, 1, 1, 1, 1,
-0.1268167, -1.123676, -3.145937, 1, 1, 1, 1, 1,
-0.1233737, 0.56709, 2.300415, 1, 1, 1, 1, 1,
-0.1232539, -1.486308, -2.941759, 1, 1, 1, 1, 1,
-0.1223823, -1.017901, -4.983694, 1, 1, 1, 1, 1,
-0.12135, 0.05011072, -3.312648, 1, 1, 1, 1, 1,
-0.1175924, 2.071441, -1.445758, 0, 0, 1, 1, 1,
-0.1117922, 0.8280351, -0.9180498, 1, 0, 0, 1, 1,
-0.1068428, -1.670809, -3.976202, 1, 0, 0, 1, 1,
-0.09597603, -0.7614781, -2.996302, 1, 0, 0, 1, 1,
-0.08989041, -0.415609, -4.163486, 1, 0, 0, 1, 1,
-0.08944743, 0.07246763, -1.332155, 1, 0, 0, 1, 1,
-0.08509003, 1.009844, -1.314269, 0, 0, 0, 1, 1,
-0.0833353, -2.172647, -2.320072, 0, 0, 0, 1, 1,
-0.0799773, -0.04046766, -2.982448, 0, 0, 0, 1, 1,
-0.07984419, 0.2918986, 0.04109176, 0, 0, 0, 1, 1,
-0.07180171, 0.5839754, 1.715281, 0, 0, 0, 1, 1,
-0.07130794, -0.771605, -3.221336, 0, 0, 0, 1, 1,
-0.067729, -1.827914, -3.627348, 0, 0, 0, 1, 1,
-0.06640871, -0.1868758, -0.495002, 1, 1, 1, 1, 1,
-0.06424075, -0.2637182, -3.548257, 1, 1, 1, 1, 1,
-0.05536883, 0.5993969, -1.294307, 1, 1, 1, 1, 1,
-0.05062174, -0.184989, -3.746873, 1, 1, 1, 1, 1,
-0.04523995, -0.8621885, -4.511094, 1, 1, 1, 1, 1,
-0.0447188, -0.7479449, -4.594213, 1, 1, 1, 1, 1,
-0.04139767, 1.36678, -2.729103, 1, 1, 1, 1, 1,
-0.04044913, -0.2274229, -2.992632, 1, 1, 1, 1, 1,
-0.03969056, 0.8367341, -1.816666, 1, 1, 1, 1, 1,
-0.03506488, 0.3311568, -1.87429, 1, 1, 1, 1, 1,
-0.03326025, 1.217592, 1.389225, 1, 1, 1, 1, 1,
-0.02911363, 0.8059664, 0.07710887, 1, 1, 1, 1, 1,
-0.02827957, 0.2601192, -0.8147961, 1, 1, 1, 1, 1,
-0.02108333, 0.889762, 1.089727, 1, 1, 1, 1, 1,
-0.0159644, 0.9154244, -0.8413691, 1, 1, 1, 1, 1,
-0.01381003, -0.1004581, -2.090231, 0, 0, 1, 1, 1,
-0.01296557, -0.7507591, -2.459524, 1, 0, 0, 1, 1,
-0.0113802, -0.3702598, -2.728231, 1, 0, 0, 1, 1,
-0.01089086, 0.1611401, 2.181419, 1, 0, 0, 1, 1,
-0.004862911, 0.1158461, -0.08455384, 1, 0, 0, 1, 1,
0.002825187, -0.5802243, 4.038606, 1, 0, 0, 1, 1,
0.006947609, 0.5843588, -0.1677175, 0, 0, 0, 1, 1,
0.01101612, 0.4735045, 0.1481998, 0, 0, 0, 1, 1,
0.01294496, -0.3585761, 4.041759, 0, 0, 0, 1, 1,
0.01373553, -0.1068557, 4.337217, 0, 0, 0, 1, 1,
0.01407942, -1.439044, 2.831599, 0, 0, 0, 1, 1,
0.01477353, -1.536907, 4.716771, 0, 0, 0, 1, 1,
0.01683695, 0.3452882, -1.560425, 0, 0, 0, 1, 1,
0.01974577, -0.3924672, 2.334323, 1, 1, 1, 1, 1,
0.02333288, 0.0129481, -0.2593465, 1, 1, 1, 1, 1,
0.03056199, -0.4478036, 3.169245, 1, 1, 1, 1, 1,
0.0305715, -0.4930867, 3.536177, 1, 1, 1, 1, 1,
0.03162963, -0.1367282, 3.92948, 1, 1, 1, 1, 1,
0.03255359, 2.287949, 0.3687888, 1, 1, 1, 1, 1,
0.03577304, -1.039662, 2.240468, 1, 1, 1, 1, 1,
0.03651807, 1.244773, -0.1067099, 1, 1, 1, 1, 1,
0.03958696, -0.2571387, 4.720672, 1, 1, 1, 1, 1,
0.04245632, 0.8926839, -0.4372742, 1, 1, 1, 1, 1,
0.04693313, -0.3809764, 2.843036, 1, 1, 1, 1, 1,
0.04765655, 0.6154017, 0.02703383, 1, 1, 1, 1, 1,
0.04913602, -0.3624755, 3.752297, 1, 1, 1, 1, 1,
0.05344751, 1.855584, -1.273029, 1, 1, 1, 1, 1,
0.05665972, -0.464168, 2.933999, 1, 1, 1, 1, 1,
0.05752436, 0.5279173, -0.111508, 0, 0, 1, 1, 1,
0.05985619, 0.4936393, 0.4499117, 1, 0, 0, 1, 1,
0.06254558, 1.31761, -1.405914, 1, 0, 0, 1, 1,
0.06334678, -2.516165, 2.794219, 1, 0, 0, 1, 1,
0.06769474, -2.367767, 3.540841, 1, 0, 0, 1, 1,
0.07169941, -0.007904084, 0.1505817, 1, 0, 0, 1, 1,
0.07417187, 1.345693, -0.9897467, 0, 0, 0, 1, 1,
0.07449936, -1.092478, 1.641657, 0, 0, 0, 1, 1,
0.07683402, 2.003465, -1.339935, 0, 0, 0, 1, 1,
0.08277061, 0.4663626, -1.116722, 0, 0, 0, 1, 1,
0.08359158, 1.069538, 1.437612, 0, 0, 0, 1, 1,
0.09380001, 0.1095276, 0.5826362, 0, 0, 0, 1, 1,
0.09529267, -1.188637, 3.511077, 0, 0, 0, 1, 1,
0.09646849, 0.4415309, -0.4485264, 1, 1, 1, 1, 1,
0.09749337, 0.9772082, -0.04462015, 1, 1, 1, 1, 1,
0.09977579, 0.760817, -0.8102424, 1, 1, 1, 1, 1,
0.1033887, 1.02387, -0.03330904, 1, 1, 1, 1, 1,
0.1051118, 0.7310576, -0.5822493, 1, 1, 1, 1, 1,
0.1062968, 0.4966125, -2.269366, 1, 1, 1, 1, 1,
0.1065119, 0.7801727, 1.299105, 1, 1, 1, 1, 1,
0.1068483, 0.1802516, -0.7644041, 1, 1, 1, 1, 1,
0.1070482, 0.9393283, -1.246083, 1, 1, 1, 1, 1,
0.1083642, 0.2706609, -0.2798847, 1, 1, 1, 1, 1,
0.1126356, -0.8975053, 3.429362, 1, 1, 1, 1, 1,
0.1131435, 0.5860554, -0.1130454, 1, 1, 1, 1, 1,
0.1153383, -1.610044, 4.007882, 1, 1, 1, 1, 1,
0.1195638, -0.3132896, 2.635715, 1, 1, 1, 1, 1,
0.1247262, -0.1342686, 0.8922755, 1, 1, 1, 1, 1,
0.1251843, 0.05493606, 1.007082, 0, 0, 1, 1, 1,
0.1275774, 1.789166, -1.430451, 1, 0, 0, 1, 1,
0.1276202, 0.1079584, 1.624584, 1, 0, 0, 1, 1,
0.1353734, -0.7984517, 1.766558, 1, 0, 0, 1, 1,
0.1360976, -0.6090776, 3.465222, 1, 0, 0, 1, 1,
0.1372778, -0.8573152, 4.215199, 1, 0, 0, 1, 1,
0.1415453, -0.754952, 4.045091, 0, 0, 0, 1, 1,
0.1422366, 0.347205, 0.4846168, 0, 0, 0, 1, 1,
0.1460325, -0.3712833, 3.682267, 0, 0, 0, 1, 1,
0.1500396, 0.1582826, 0.06630381, 0, 0, 0, 1, 1,
0.1533505, 0.2355887, 1.483781, 0, 0, 0, 1, 1,
0.1542022, 0.9585204, -0.2040644, 0, 0, 0, 1, 1,
0.1561887, 0.5817583, -1.282723, 0, 0, 0, 1, 1,
0.1583613, 1.002256, -0.2934453, 1, 1, 1, 1, 1,
0.1592449, -1.068138, 3.137375, 1, 1, 1, 1, 1,
0.1632962, 0.4595613, -0.6790202, 1, 1, 1, 1, 1,
0.1708519, 0.5089798, 0.3747871, 1, 1, 1, 1, 1,
0.1783049, 0.05211109, 1.360738, 1, 1, 1, 1, 1,
0.1799995, -1.564877, 2.335184, 1, 1, 1, 1, 1,
0.1801856, 0.818841, 1.756897, 1, 1, 1, 1, 1,
0.1882391, -0.2227783, 2.912829, 1, 1, 1, 1, 1,
0.1895211, -1.014956, 2.735163, 1, 1, 1, 1, 1,
0.1897496, 0.1693832, 1.288695, 1, 1, 1, 1, 1,
0.1954651, -0.4939582, 3.090798, 1, 1, 1, 1, 1,
0.2013339, -0.7503282, 2.549157, 1, 1, 1, 1, 1,
0.2022771, 0.02566148, 3.317681, 1, 1, 1, 1, 1,
0.2026078, -0.7190146, 2.482346, 1, 1, 1, 1, 1,
0.2043207, -2.27841, 2.362333, 1, 1, 1, 1, 1,
0.2055627, -0.6250926, 2.741488, 0, 0, 1, 1, 1,
0.2057909, 1.530901, 0.5630326, 1, 0, 0, 1, 1,
0.206307, 0.6444669, 3.35193, 1, 0, 0, 1, 1,
0.2157515, -1.005619, 2.885913, 1, 0, 0, 1, 1,
0.2187977, -0.438895, 3.038363, 1, 0, 0, 1, 1,
0.2198694, -1.137461, 3.213576, 1, 0, 0, 1, 1,
0.2203349, 0.4096735, -2.41272, 0, 0, 0, 1, 1,
0.2281453, 0.3923311, 1.547336, 0, 0, 0, 1, 1,
0.22884, 2.484116, -0.1449908, 0, 0, 0, 1, 1,
0.2298453, 1.14211, 0.818649, 0, 0, 0, 1, 1,
0.2323344, 0.07566278, 0.5235824, 0, 0, 0, 1, 1,
0.234675, 0.1788311, 2.296488, 0, 0, 0, 1, 1,
0.2347746, -0.1749834, 0.9009005, 0, 0, 0, 1, 1,
0.2363627, -0.3028479, 3.889452, 1, 1, 1, 1, 1,
0.2408597, -2.312002, 3.034004, 1, 1, 1, 1, 1,
0.2422975, -0.5626532, 2.45689, 1, 1, 1, 1, 1,
0.2438234, 1.032738, -1.231078, 1, 1, 1, 1, 1,
0.2451175, 0.8509098, 0.7231297, 1, 1, 1, 1, 1,
0.2457019, -0.7985738, 3.38664, 1, 1, 1, 1, 1,
0.2476499, -1.079586, 1.899604, 1, 1, 1, 1, 1,
0.2485569, -0.6429688, 2.879545, 1, 1, 1, 1, 1,
0.2488665, -0.6571887, 2.233332, 1, 1, 1, 1, 1,
0.251248, 0.9225335, -0.3749656, 1, 1, 1, 1, 1,
0.2536304, 0.1589987, 1.055366, 1, 1, 1, 1, 1,
0.2545868, 0.03790901, 0.2607605, 1, 1, 1, 1, 1,
0.2561228, -0.4807501, 2.567556, 1, 1, 1, 1, 1,
0.2567194, -0.1201162, 1.75915, 1, 1, 1, 1, 1,
0.2614376, -0.1871089, 3.453968, 1, 1, 1, 1, 1,
0.2629742, 0.2211102, 1.059609, 0, 0, 1, 1, 1,
0.2637639, 0.5524465, -0.1039889, 1, 0, 0, 1, 1,
0.2648326, -0.1999801, 4.04499, 1, 0, 0, 1, 1,
0.2668196, 0.4737883, -1.48025, 1, 0, 0, 1, 1,
0.2676854, 0.4641305, -0.439672, 1, 0, 0, 1, 1,
0.2686547, -0.09705529, 0.9268689, 1, 0, 0, 1, 1,
0.2805515, 2.047637, -0.8289443, 0, 0, 0, 1, 1,
0.2818491, 2.296021, -1.625974, 0, 0, 0, 1, 1,
0.2830252, -0.1198686, 0.9921005, 0, 0, 0, 1, 1,
0.2879492, -0.9834321, 3.184154, 0, 0, 0, 1, 1,
0.2912185, 0.3356939, 1.394028, 0, 0, 0, 1, 1,
0.2950158, 0.2866697, 1.771881, 0, 0, 0, 1, 1,
0.2981907, 0.04079561, 1.775572, 0, 0, 0, 1, 1,
0.2991437, 1.632261, 1.404715, 1, 1, 1, 1, 1,
0.2992963, -0.715231, 2.13952, 1, 1, 1, 1, 1,
0.3003159, 0.3103518, 1.724222, 1, 1, 1, 1, 1,
0.3012796, -0.820587, 1.656957, 1, 1, 1, 1, 1,
0.3036614, -2.153036, 3.748095, 1, 1, 1, 1, 1,
0.3038901, -1.797155, 2.96085, 1, 1, 1, 1, 1,
0.3061755, -0.5756787, 2.843519, 1, 1, 1, 1, 1,
0.3109159, 2.388881, -1.566759, 1, 1, 1, 1, 1,
0.3134135, 0.1968003, 1.015887, 1, 1, 1, 1, 1,
0.3135553, -1.446162, 4.339835, 1, 1, 1, 1, 1,
0.3152065, 1.355859, 0.7792034, 1, 1, 1, 1, 1,
0.316664, -0.7399524, 2.564555, 1, 1, 1, 1, 1,
0.318392, -0.7238224, 2.23836, 1, 1, 1, 1, 1,
0.3224947, 0.07992905, 0.8417863, 1, 1, 1, 1, 1,
0.3256327, 0.6753128, -0.2973464, 1, 1, 1, 1, 1,
0.3277237, 0.4599419, 1.494006, 0, 0, 1, 1, 1,
0.3302358, 1.434237, -0.5342733, 1, 0, 0, 1, 1,
0.3305906, -1.839686, 4.289386, 1, 0, 0, 1, 1,
0.3342885, 0.652833, -1.785197, 1, 0, 0, 1, 1,
0.3347269, 0.3076476, 0.1876632, 1, 0, 0, 1, 1,
0.3348536, -0.1987418, 1.728093, 1, 0, 0, 1, 1,
0.3351575, -0.3708453, 2.009465, 0, 0, 0, 1, 1,
0.337636, 1.360076, -0.2493909, 0, 0, 0, 1, 1,
0.3377804, -0.4579385, 3.336123, 0, 0, 0, 1, 1,
0.3403961, -0.5172325, 2.415408, 0, 0, 0, 1, 1,
0.3410719, 2.334347, -0.496771, 0, 0, 0, 1, 1,
0.3445089, -0.410032, 3.247794, 0, 0, 0, 1, 1,
0.347324, -0.2070212, 1.163841, 0, 0, 0, 1, 1,
0.3510555, -0.5858525, 3.444066, 1, 1, 1, 1, 1,
0.3560779, 0.8326336, -0.8228548, 1, 1, 1, 1, 1,
0.3562236, -0.3094536, 3.097897, 1, 1, 1, 1, 1,
0.3613205, -0.9764482, 2.276541, 1, 1, 1, 1, 1,
0.362552, 1.080482, -0.946443, 1, 1, 1, 1, 1,
0.3685769, -2.003352, 3.575014, 1, 1, 1, 1, 1,
0.3691863, -0.7681198, 4.351886, 1, 1, 1, 1, 1,
0.3696195, -1.405347, 3.591779, 1, 1, 1, 1, 1,
0.3750285, -0.09848265, 2.325304, 1, 1, 1, 1, 1,
0.3775625, -0.2785874, 2.194924, 1, 1, 1, 1, 1,
0.3783032, -0.04190332, 0.3132624, 1, 1, 1, 1, 1,
0.3784393, -0.3349927, 2.681112, 1, 1, 1, 1, 1,
0.3805299, -0.7813169, 1.054331, 1, 1, 1, 1, 1,
0.3823596, 1.272583, -0.0571797, 1, 1, 1, 1, 1,
0.3826538, -0.3243599, 1.551173, 1, 1, 1, 1, 1,
0.382771, 1.210039, -0.1771458, 0, 0, 1, 1, 1,
0.3885418, 0.4346801, -0.8908906, 1, 0, 0, 1, 1,
0.3988035, -2.152177, 3.843297, 1, 0, 0, 1, 1,
0.4033055, -0.533913, 4.368486, 1, 0, 0, 1, 1,
0.4110675, 0.1460124, 0.7721226, 1, 0, 0, 1, 1,
0.4167426, 0.8466657, -0.3120722, 1, 0, 0, 1, 1,
0.4205641, 0.78021, -0.3413231, 0, 0, 0, 1, 1,
0.4219083, -0.5167612, 3.580251, 0, 0, 0, 1, 1,
0.4262051, 0.1923553, 0.4657405, 0, 0, 0, 1, 1,
0.429056, -0.2703547, 1.123661, 0, 0, 0, 1, 1,
0.4292085, 0.6780902, 1.093668, 0, 0, 0, 1, 1,
0.4353032, 1.852447, 0.410189, 0, 0, 0, 1, 1,
0.4367115, 0.5708113, 0.9839099, 0, 0, 0, 1, 1,
0.4380036, -0.78947, 3.157778, 1, 1, 1, 1, 1,
0.4404852, -0.465369, 1.831267, 1, 1, 1, 1, 1,
0.4425973, -1.331468, 1.47508, 1, 1, 1, 1, 1,
0.4493657, 0.8765722, 0.4086776, 1, 1, 1, 1, 1,
0.4518113, 0.7693356, 0.7635068, 1, 1, 1, 1, 1,
0.458981, -0.01651032, 2.586453, 1, 1, 1, 1, 1,
0.4626557, -1.72893, 3.064739, 1, 1, 1, 1, 1,
0.4645385, -0.1921864, 2.207215, 1, 1, 1, 1, 1,
0.4679875, -0.2428128, 3.007241, 1, 1, 1, 1, 1,
0.484517, 1.426294, 0.9590067, 1, 1, 1, 1, 1,
0.4871951, -2.409039, 3.649323, 1, 1, 1, 1, 1,
0.4875549, 0.1127568, 2.329842, 1, 1, 1, 1, 1,
0.4882281, -1.307432, 4.156158, 1, 1, 1, 1, 1,
0.4887277, -0.6695883, 2.560904, 1, 1, 1, 1, 1,
0.491352, -0.4316378, 1.660521, 1, 1, 1, 1, 1,
0.4939866, -0.1952537, 2.304236, 0, 0, 1, 1, 1,
0.4949334, 0.3765516, 2.347136, 1, 0, 0, 1, 1,
0.4967425, -0.9524288, 2.28393, 1, 0, 0, 1, 1,
0.4973779, -0.04538369, -0.0374611, 1, 0, 0, 1, 1,
0.5039755, 1.154748, -1.475685, 1, 0, 0, 1, 1,
0.504906, 0.3140928, 1.161529, 1, 0, 0, 1, 1,
0.5065127, -0.598451, 1.865801, 0, 0, 0, 1, 1,
0.509342, 1.750748, 0.1727756, 0, 0, 0, 1, 1,
0.5135001, 0.07153566, 2.107721, 0, 0, 0, 1, 1,
0.5155458, 0.5992718, 0.702966, 0, 0, 0, 1, 1,
0.5191163, 0.243274, 0.6203846, 0, 0, 0, 1, 1,
0.534803, 1.299039, 2.724062, 0, 0, 0, 1, 1,
0.5401868, 0.1819535, 1.646455, 0, 0, 0, 1, 1,
0.5410728, 0.6206937, 1.287704, 1, 1, 1, 1, 1,
0.5480446, -0.7341089, 0.3946024, 1, 1, 1, 1, 1,
0.5483063, 1.146408, 1.245961, 1, 1, 1, 1, 1,
0.5484338, 0.6410749, -0.145532, 1, 1, 1, 1, 1,
0.5493278, -1.648477, 2.301965, 1, 1, 1, 1, 1,
0.5513368, 0.7894129, 0.4854779, 1, 1, 1, 1, 1,
0.5522243, -0.7995271, 3.412372, 1, 1, 1, 1, 1,
0.5602575, -1.30223, 2.084283, 1, 1, 1, 1, 1,
0.5603067, -0.2304714, 1.525903, 1, 1, 1, 1, 1,
0.5636569, 0.7843927, 0.569051, 1, 1, 1, 1, 1,
0.5652447, -0.2274352, 0.2166577, 1, 1, 1, 1, 1,
0.5672461, 0.1548067, 0.6856604, 1, 1, 1, 1, 1,
0.5734056, 0.9763394, 0.5580633, 1, 1, 1, 1, 1,
0.5797215, 0.2525423, 1.518161, 1, 1, 1, 1, 1,
0.5802957, 0.8753423, 0.2277176, 1, 1, 1, 1, 1,
0.5821819, -1.554633, 4.192705, 0, 0, 1, 1, 1,
0.5822247, -0.004109708, 2.385978, 1, 0, 0, 1, 1,
0.5838497, -1.033314, 3.069512, 1, 0, 0, 1, 1,
0.5897288, -0.3213894, 1.904685, 1, 0, 0, 1, 1,
0.5900258, 0.9833814, -2.261784, 1, 0, 0, 1, 1,
0.5902078, 0.8419068, 0.5757414, 1, 0, 0, 1, 1,
0.5933588, 0.3614575, -0.2210869, 0, 0, 0, 1, 1,
0.5941627, -2.057616, 4.185606, 0, 0, 0, 1, 1,
0.6070886, -0.4363672, 1.477198, 0, 0, 0, 1, 1,
0.6105874, -1.224433, 1.764536, 0, 0, 0, 1, 1,
0.6121395, -0.5840997, 3.001861, 0, 0, 0, 1, 1,
0.6191124, 0.6728928, 0.2250384, 0, 0, 0, 1, 1,
0.6207536, 0.07726661, 1.715002, 0, 0, 0, 1, 1,
0.6222038, -0.3480067, 0.9841621, 1, 1, 1, 1, 1,
0.6223462, 0.3628773, -0.06864271, 1, 1, 1, 1, 1,
0.6290278, -0.09706599, 1.873857, 1, 1, 1, 1, 1,
0.6322591, -1.38077, 4.712204, 1, 1, 1, 1, 1,
0.6329966, 0.7563124, -0.7198011, 1, 1, 1, 1, 1,
0.6336213, 1.722833, -0.4089007, 1, 1, 1, 1, 1,
0.6419612, -0.855495, 4.354249, 1, 1, 1, 1, 1,
0.6468679, 0.4805371, 0.2219652, 1, 1, 1, 1, 1,
0.6479155, -0.2145298, 2.891435, 1, 1, 1, 1, 1,
0.6514566, -1.41362, 2.556803, 1, 1, 1, 1, 1,
0.6517776, 1.929356, -0.1615449, 1, 1, 1, 1, 1,
0.6541513, 0.8029246, 1.40018, 1, 1, 1, 1, 1,
0.6545575, 1.953218, 1.017764, 1, 1, 1, 1, 1,
0.6550718, -0.320825, 1.725869, 1, 1, 1, 1, 1,
0.6563271, 0.8913798, 0.8979128, 1, 1, 1, 1, 1,
0.6648235, -0.898402, 1.872506, 0, 0, 1, 1, 1,
0.6669651, -0.4958646, 2.052948, 1, 0, 0, 1, 1,
0.6676633, 0.4351647, 0.6789709, 1, 0, 0, 1, 1,
0.6746822, -0.393634, 3.266763, 1, 0, 0, 1, 1,
0.6757089, 1.091338, -1.496626, 1, 0, 0, 1, 1,
0.6780384, 0.1281488, 2.522944, 1, 0, 0, 1, 1,
0.6814612, -0.8779668, 1.50134, 0, 0, 0, 1, 1,
0.6840759, 0.1672112, 2.756817, 0, 0, 0, 1, 1,
0.6845872, -1.903392, 2.142652, 0, 0, 0, 1, 1,
0.6877655, -0.2164082, 2.191075, 0, 0, 0, 1, 1,
0.6879199, -1.050013, 4.29359, 0, 0, 0, 1, 1,
0.6886661, -0.02680927, 1.629375, 0, 0, 0, 1, 1,
0.6896552, 1.165495, -0.1707753, 0, 0, 0, 1, 1,
0.6945637, 0.4088054, 2.99852, 1, 1, 1, 1, 1,
0.7011186, -1.204441, 1.720018, 1, 1, 1, 1, 1,
0.7044877, 0.0120021, 0.4907801, 1, 1, 1, 1, 1,
0.7091647, 0.2554558, 1.21551, 1, 1, 1, 1, 1,
0.7109583, -0.8858129, 1.387063, 1, 1, 1, 1, 1,
0.7233734, 1.06153, 2.186296, 1, 1, 1, 1, 1,
0.7294315, 0.3985001, -0.3044603, 1, 1, 1, 1, 1,
0.7308089, 1.686948, 0.8625952, 1, 1, 1, 1, 1,
0.7333461, 0.7192953, -0.9409599, 1, 1, 1, 1, 1,
0.7342938, -0.1836536, 1.945367, 1, 1, 1, 1, 1,
0.7355563, -0.9920984, 3.285038, 1, 1, 1, 1, 1,
0.7359045, 0.5670903, 0.1175516, 1, 1, 1, 1, 1,
0.7371407, 2.278574, 0.001640986, 1, 1, 1, 1, 1,
0.7409363, 1.401915, -0.989478, 1, 1, 1, 1, 1,
0.7409493, 0.08836151, 1.867571, 1, 1, 1, 1, 1,
0.7480522, -0.1895912, 1.219035, 0, 0, 1, 1, 1,
0.7481238, 1.405663, 0.06855188, 1, 0, 0, 1, 1,
0.7568645, 2.402504, 1.812981, 1, 0, 0, 1, 1,
0.7592096, 0.5334637, 1.626824, 1, 0, 0, 1, 1,
0.7599587, -0.7885036, 2.053366, 1, 0, 0, 1, 1,
0.7637635, 1.007167, 2.416107, 1, 0, 0, 1, 1,
0.7642542, 0.998255, 0.608894, 0, 0, 0, 1, 1,
0.765685, -0.6218178, 2.298836, 0, 0, 0, 1, 1,
0.7662145, -0.4388735, 3.564483, 0, 0, 0, 1, 1,
0.7674717, 0.8310548, 0.7551168, 0, 0, 0, 1, 1,
0.7685888, -0.114814, 0.5241825, 0, 0, 0, 1, 1,
0.7780811, -0.7246078, 1.967248, 0, 0, 0, 1, 1,
0.7810845, -0.0133468, 1.504326, 0, 0, 0, 1, 1,
0.7813997, -1.214709, 2.170487, 1, 1, 1, 1, 1,
0.7824233, -1.100724, 2.453324, 1, 1, 1, 1, 1,
0.7874444, 0.4411721, 0.7113822, 1, 1, 1, 1, 1,
0.7942508, 0.6785766, 2.292226, 1, 1, 1, 1, 1,
0.8008606, -0.7390051, -0.03246056, 1, 1, 1, 1, 1,
0.801194, 0.6118615, -0.8524885, 1, 1, 1, 1, 1,
0.8068528, -0.8215384, 1.71554, 1, 1, 1, 1, 1,
0.8136624, 0.9682344, 1.114528, 1, 1, 1, 1, 1,
0.8155734, -1.076723, 1.679579, 1, 1, 1, 1, 1,
0.8169662, 1.446903, 1.80995, 1, 1, 1, 1, 1,
0.8169934, 0.1710075, 1.94392, 1, 1, 1, 1, 1,
0.8202839, -1.50348, 3.439889, 1, 1, 1, 1, 1,
0.8220969, -0.6984454, 1.457595, 1, 1, 1, 1, 1,
0.8227363, 0.6000639, 1.314797, 1, 1, 1, 1, 1,
0.8333272, -0.9987755, 2.497868, 1, 1, 1, 1, 1,
0.8357562, 1.640456, 1.399881, 0, 0, 1, 1, 1,
0.8363472, -2.33801, 4.081778, 1, 0, 0, 1, 1,
0.8428587, -0.95679, 3.433177, 1, 0, 0, 1, 1,
0.8618233, -0.4549192, 2.780822, 1, 0, 0, 1, 1,
0.8649879, 1.856914, 0.4088318, 1, 0, 0, 1, 1,
0.8719625, -0.2361403, 1.902458, 1, 0, 0, 1, 1,
0.8735194, -0.8785111, 3.612898, 0, 0, 0, 1, 1,
0.8794001, 0.8020364, 0.7402996, 0, 0, 0, 1, 1,
0.8796716, -0.5744593, 1.52357, 0, 0, 0, 1, 1,
0.8829046, -0.992131, 2.100387, 0, 0, 0, 1, 1,
0.8832857, 0.8806738, 0.6480595, 0, 0, 0, 1, 1,
0.8843064, 0.2551448, 1.928221, 0, 0, 0, 1, 1,
0.887983, -0.7853348, 1.434064, 0, 0, 0, 1, 1,
0.8940216, 1.916814, 0.08555996, 1, 1, 1, 1, 1,
0.8976207, 0.03966671, 2.250731, 1, 1, 1, 1, 1,
0.8979737, -0.3464102, 2.978327, 1, 1, 1, 1, 1,
0.9024262, -0.9125358, 2.75915, 1, 1, 1, 1, 1,
0.9051493, -0.5003437, 1.393393, 1, 1, 1, 1, 1,
0.9058977, -1.881442, 2.790589, 1, 1, 1, 1, 1,
0.9077767, -1.380029, 2.755133, 1, 1, 1, 1, 1,
0.9152907, -1.678476, 3.792098, 1, 1, 1, 1, 1,
0.9162732, 0.8743634, 1.849468, 1, 1, 1, 1, 1,
0.9170604, -0.09573884, 2.471414, 1, 1, 1, 1, 1,
0.9201226, 1.561719, -0.4299876, 1, 1, 1, 1, 1,
0.9227803, -0.0570265, 1.173674, 1, 1, 1, 1, 1,
0.9242683, -0.2479826, 1.960474, 1, 1, 1, 1, 1,
0.9279597, -0.3159125, 1.932355, 1, 1, 1, 1, 1,
0.92843, -0.1281026, 0.8668172, 1, 1, 1, 1, 1,
0.9299719, -0.8207451, 0.9240382, 0, 0, 1, 1, 1,
0.9343958, 1.455754, 1.236504, 1, 0, 0, 1, 1,
0.9348966, 1.391332, -2.123855, 1, 0, 0, 1, 1,
0.9397271, 0.142919, 1.797599, 1, 0, 0, 1, 1,
0.940219, -0.9318972, 1.339595, 1, 0, 0, 1, 1,
0.9452249, -0.7576913, 2.976961, 1, 0, 0, 1, 1,
0.9504745, -2.436993, 1.834269, 0, 0, 0, 1, 1,
0.9520794, -2.265848, 3.216165, 0, 0, 0, 1, 1,
0.9639029, -0.9276095, 0.7708802, 0, 0, 0, 1, 1,
0.9662971, 0.6414022, -0.3745361, 0, 0, 0, 1, 1,
0.9673713, 1.134718, -0.1959151, 0, 0, 0, 1, 1,
0.9840451, 0.2364128, 0.8854042, 0, 0, 0, 1, 1,
0.9852415, -0.8976927, 1.741638, 0, 0, 0, 1, 1,
0.9866549, -1.463583, 2.346453, 1, 1, 1, 1, 1,
0.9866917, 2.397118, 1.186138, 1, 1, 1, 1, 1,
0.9913992, 1.288947, -1.645242, 1, 1, 1, 1, 1,
0.9945781, -0.4781594, 1.233874, 1, 1, 1, 1, 1,
0.9981272, -0.1103869, 0.05560291, 1, 1, 1, 1, 1,
0.9989731, 2.264403, 1.503722, 1, 1, 1, 1, 1,
0.9992893, 0.9257897, 0.02603218, 1, 1, 1, 1, 1,
0.9995223, -1.450502, 3.203666, 1, 1, 1, 1, 1,
1.006956, 3.093358, -0.04311411, 1, 1, 1, 1, 1,
1.017156, -0.08183973, 3.819072, 1, 1, 1, 1, 1,
1.020639, 1.186085, 0.09269589, 1, 1, 1, 1, 1,
1.030162, -1.409768, 3.276756, 1, 1, 1, 1, 1,
1.033232, -2.198167, 2.855023, 1, 1, 1, 1, 1,
1.039815, 0.6625572, 1.423456, 1, 1, 1, 1, 1,
1.040866, 0.4532073, 0.4549358, 1, 1, 1, 1, 1,
1.048828, 0.74309, -0.6009502, 0, 0, 1, 1, 1,
1.051529, -0.3944775, 2.795772, 1, 0, 0, 1, 1,
1.052637, 0.8523354, 0.575294, 1, 0, 0, 1, 1,
1.054126, 1.141542, 0.9035752, 1, 0, 0, 1, 1,
1.056404, 2.302354, 1.308953, 1, 0, 0, 1, 1,
1.061089, 0.2963901, 4.782752, 1, 0, 0, 1, 1,
1.06117, -0.5824789, 2.063535, 0, 0, 0, 1, 1,
1.061881, -0.2776435, 1.3224, 0, 0, 0, 1, 1,
1.062318, -0.8720503, 0.2985589, 0, 0, 0, 1, 1,
1.063578, 2.607372, 1.489143, 0, 0, 0, 1, 1,
1.06681, 0.715383, 0.7469907, 0, 0, 0, 1, 1,
1.072432, -1.031201, 2.041806, 0, 0, 0, 1, 1,
1.075032, -1.577323, 1.84564, 0, 0, 0, 1, 1,
1.085511, 0.2187335, 0.8575243, 1, 1, 1, 1, 1,
1.09028, 0.06829952, 1.757665, 1, 1, 1, 1, 1,
1.097914, -0.727717, 2.107983, 1, 1, 1, 1, 1,
1.104041, 1.628046, -0.4844275, 1, 1, 1, 1, 1,
1.110017, -2.460839, 1.953539, 1, 1, 1, 1, 1,
1.112393, 0.225364, -0.2915677, 1, 1, 1, 1, 1,
1.114619, -0.6158287, 1.290594, 1, 1, 1, 1, 1,
1.11553, 0.1926054, 1.746017, 1, 1, 1, 1, 1,
1.12089, -1.944099, 2.302964, 1, 1, 1, 1, 1,
1.129027, 1.408735, -0.07016168, 1, 1, 1, 1, 1,
1.131769, -0.9323635, 1.821493, 1, 1, 1, 1, 1,
1.13217, -0.196655, -0.2119002, 1, 1, 1, 1, 1,
1.141671, -0.368142, 1.106755, 1, 1, 1, 1, 1,
1.143736, 0.699719, 0.2492341, 1, 1, 1, 1, 1,
1.148157, 0.2969908, 0.7940282, 1, 1, 1, 1, 1,
1.153055, -0.9941494, 2.976953, 0, 0, 1, 1, 1,
1.153459, -0.2784407, 3.040062, 1, 0, 0, 1, 1,
1.154999, 0.1325826, 0.6653699, 1, 0, 0, 1, 1,
1.160359, -0.4577816, 0.6831216, 1, 0, 0, 1, 1,
1.162619, 0.6139832, 1.041383, 1, 0, 0, 1, 1,
1.163318, -0.167888, 1.035046, 1, 0, 0, 1, 1,
1.16342, 0.518063, 1.867277, 0, 0, 0, 1, 1,
1.16971, -1.201759, 3.415534, 0, 0, 0, 1, 1,
1.172666, 0.3522781, 0.8521976, 0, 0, 0, 1, 1,
1.182621, 1.579196, -0.8993409, 0, 0, 0, 1, 1,
1.183455, 1.124952, 0.6105577, 0, 0, 0, 1, 1,
1.189685, -1.670048, 2.433351, 0, 0, 0, 1, 1,
1.196255, -0.3147473, 2.175003, 0, 0, 0, 1, 1,
1.20131, -3.400243, 2.58247, 1, 1, 1, 1, 1,
1.203787, -0.8127944, 2.742537, 1, 1, 1, 1, 1,
1.210234, 0.1263965, 2.248919, 1, 1, 1, 1, 1,
1.214824, 1.240734, 0.4016151, 1, 1, 1, 1, 1,
1.219746, 0.6446252, 1.072495, 1, 1, 1, 1, 1,
1.221625, 0.8765675, 1.446277, 1, 1, 1, 1, 1,
1.22694, -0.7508237, 2.740747, 1, 1, 1, 1, 1,
1.23224, 1.620181, 0.8003047, 1, 1, 1, 1, 1,
1.233644, 0.8580649, -0.4747933, 1, 1, 1, 1, 1,
1.24364, -0.677415, 2.584739, 1, 1, 1, 1, 1,
1.259958, -0.3485159, 1.169448, 1, 1, 1, 1, 1,
1.268823, 0.02463523, 1.326994, 1, 1, 1, 1, 1,
1.277959, 0.4056981, 1.21008, 1, 1, 1, 1, 1,
1.29428, -2.248668, 2.018048, 1, 1, 1, 1, 1,
1.299931, 0.9243815, 1.896175, 1, 1, 1, 1, 1,
1.30329, -0.7145452, 2.508276, 0, 0, 1, 1, 1,
1.304531, -0.5616261, 2.352331, 1, 0, 0, 1, 1,
1.308762, -0.6266091, 1.431664, 1, 0, 0, 1, 1,
1.322338, 0.4580827, 0.2376018, 1, 0, 0, 1, 1,
1.323507, -2.605248, 2.742919, 1, 0, 0, 1, 1,
1.326457, -0.9613221, 1.470599, 1, 0, 0, 1, 1,
1.331536, 1.154269, 0.4242337, 0, 0, 0, 1, 1,
1.344074, 1.800562, 3.333779, 0, 0, 0, 1, 1,
1.346772, -0.1996919, 1.744786, 0, 0, 0, 1, 1,
1.350146, 0.7837633, -0.7195706, 0, 0, 0, 1, 1,
1.358022, -1.1499, 1.792557, 0, 0, 0, 1, 1,
1.365471, -0.08012947, 2.634771, 0, 0, 0, 1, 1,
1.367043, -1.650276, 3.030782, 0, 0, 0, 1, 1,
1.367375, -0.5597968, 3.503535, 1, 1, 1, 1, 1,
1.371331, -0.1154082, 1.916541, 1, 1, 1, 1, 1,
1.37787, 2.296515, 1.338967, 1, 1, 1, 1, 1,
1.394869, -0.8481656, 3.004161, 1, 1, 1, 1, 1,
1.403312, -0.3225028, 2.664159, 1, 1, 1, 1, 1,
1.407088, 0.3488829, -0.6294259, 1, 1, 1, 1, 1,
1.40888, -1.150196, 0.2918837, 1, 1, 1, 1, 1,
1.410206, 1.364904, 1.777729, 1, 1, 1, 1, 1,
1.417098, 0.1007173, 1.215698, 1, 1, 1, 1, 1,
1.448344, -0.2753367, 1.684431, 1, 1, 1, 1, 1,
1.452609, -0.3674164, 1.881342, 1, 1, 1, 1, 1,
1.493435, 0.1016928, 0.7636756, 1, 1, 1, 1, 1,
1.493865, -1.217404, 2.503623, 1, 1, 1, 1, 1,
1.494599, -0.05596685, 0.5027222, 1, 1, 1, 1, 1,
1.494881, -0.08096953, 2.081204, 1, 1, 1, 1, 1,
1.501082, -1.219757, 2.773841, 0, 0, 1, 1, 1,
1.503431, 0.3669056, 4.011219, 1, 0, 0, 1, 1,
1.521127, 1.97773, 2.119274, 1, 0, 0, 1, 1,
1.521867, -1.251556, 1.040935, 1, 0, 0, 1, 1,
1.531672, 0.4169987, 2.704783, 1, 0, 0, 1, 1,
1.533831, 0.4948053, 1.181551, 1, 0, 0, 1, 1,
1.534222, -1.790523, 1.587734, 0, 0, 0, 1, 1,
1.537042, 0.6355205, 1.109765, 0, 0, 0, 1, 1,
1.562127, 1.356138, 0.7560527, 0, 0, 0, 1, 1,
1.56249, 1.38791, 2.035868, 0, 0, 0, 1, 1,
1.576221, -1.762651, 1.317105, 0, 0, 0, 1, 1,
1.58063, -2.201653, 2.087699, 0, 0, 0, 1, 1,
1.583635, 1.283823, 1.239119, 0, 0, 0, 1, 1,
1.584118, -1.009011, 1.29214, 1, 1, 1, 1, 1,
1.602065, -1.930171, 2.717267, 1, 1, 1, 1, 1,
1.615357, -0.4969386, 3.395239, 1, 1, 1, 1, 1,
1.619462, -0.5716801, 0.9245273, 1, 1, 1, 1, 1,
1.6204, 1.788266, 0.04915374, 1, 1, 1, 1, 1,
1.635402, -1.041945, 0.7477224, 1, 1, 1, 1, 1,
1.651932, 0.1467353, 0.9532243, 1, 1, 1, 1, 1,
1.663868, -1.986964, 2.823199, 1, 1, 1, 1, 1,
1.679329, -0.6282635, 4.189939, 1, 1, 1, 1, 1,
1.681596, -0.8526736, 3.229791, 1, 1, 1, 1, 1,
1.683329, -0.1267157, 1.963774, 1, 1, 1, 1, 1,
1.689352, 0.002938012, 0.7572504, 1, 1, 1, 1, 1,
1.711792, -0.7998967, 1.325249, 1, 1, 1, 1, 1,
1.722192, 0.3149734, 0.1300808, 1, 1, 1, 1, 1,
1.731346, 1.347555, 1.648969, 1, 1, 1, 1, 1,
1.738775, -0.4961169, 1.203077, 0, 0, 1, 1, 1,
1.74957, -0.2842705, 1.939814, 1, 0, 0, 1, 1,
1.751962, 2.175405, -2.082591, 1, 0, 0, 1, 1,
1.754971, -0.4423908, 2.27597, 1, 0, 0, 1, 1,
1.781073, -0.03586226, -0.565074, 1, 0, 0, 1, 1,
1.788756, 0.07330802, 2.344424, 1, 0, 0, 1, 1,
1.797746, 0.3741172, 1.438387, 0, 0, 0, 1, 1,
1.807569, 0.7647696, 0.9081942, 0, 0, 0, 1, 1,
1.815361, -1.9878, 0.6351681, 0, 0, 0, 1, 1,
1.822778, -0.7410471, 2.760064, 0, 0, 0, 1, 1,
1.835075, 0.9589804, 2.146775, 0, 0, 0, 1, 1,
1.840372, 0.3083063, 2.758898, 0, 0, 0, 1, 1,
1.841249, 0.2019171, 0.3196781, 0, 0, 0, 1, 1,
1.858888, -1.857128, 2.702351, 1, 1, 1, 1, 1,
1.86112, 1.499626, 1.898745, 1, 1, 1, 1, 1,
1.881771, -0.6320211, 2.206451, 1, 1, 1, 1, 1,
1.888415, 1.020722, 1.583309, 1, 1, 1, 1, 1,
1.893558, -1.295033, 1.752026, 1, 1, 1, 1, 1,
1.905082, 1.814189, -0.3626827, 1, 1, 1, 1, 1,
1.944786, -1.175002, 0.5774605, 1, 1, 1, 1, 1,
1.946327, -1.697807, 1.076496, 1, 1, 1, 1, 1,
1.950491, -0.06599004, 2.50447, 1, 1, 1, 1, 1,
1.979402, -1.565332, 1.779802, 1, 1, 1, 1, 1,
1.988521, -1.260165, 2.394396, 1, 1, 1, 1, 1,
1.990805, -0.5185373, 2.513308, 1, 1, 1, 1, 1,
1.999242, 0.2512388, 0.7206289, 1, 1, 1, 1, 1,
2.02152, 0.2959313, -0.9957852, 1, 1, 1, 1, 1,
2.039735, -1.358778, 1.617367, 1, 1, 1, 1, 1,
2.07375, -0.5212901, 3.52837, 0, 0, 1, 1, 1,
2.08825, 0.3469352, 1.295954, 1, 0, 0, 1, 1,
2.163232, 0.8901259, 2.149004, 1, 0, 0, 1, 1,
2.164967, 1.143842, 1.039579, 1, 0, 0, 1, 1,
2.175535, 3.133992, 1.736361, 1, 0, 0, 1, 1,
2.178665, 0.5093846, 2.227417, 1, 0, 0, 1, 1,
2.219341, -0.6964341, 2.415632, 0, 0, 0, 1, 1,
2.284129, -0.2971889, 1.248276, 0, 0, 0, 1, 1,
2.326679, 0.3911309, 1.228975, 0, 0, 0, 1, 1,
2.415189, 0.1231894, 2.887743, 0, 0, 0, 1, 1,
2.530537, -0.6470347, 2.740115, 0, 0, 0, 1, 1,
2.541303, -0.467869, 2.944774, 0, 0, 0, 1, 1,
2.543301, -0.3867417, 1.732589, 0, 0, 0, 1, 1,
2.567274, -0.7822107, 1.17217, 1, 1, 1, 1, 1,
2.639233, -0.08687554, 3.605036, 1, 1, 1, 1, 1,
2.724393, 0.02751768, 2.586922, 1, 1, 1, 1, 1,
2.766254, 0.4469211, 0.956372, 1, 1, 1, 1, 1,
2.797861, -0.8020713, 2.228507, 1, 1, 1, 1, 1,
3.200171, -1.549257, 2.607311, 1, 1, 1, 1, 1,
3.681313, 0.3074184, -0.413818, 1, 1, 1, 1, 1
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
var radius = 9.518652;
var distance = 33.43386;
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
mvMatrix.translate( -0.1600208, 0.1331253, 0.2363479 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.43386);
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