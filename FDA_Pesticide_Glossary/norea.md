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
-3.528897, -0.7992653, -1.802249, 1, 0, 0, 1,
-2.830282, 0.3966302, -1.396622, 1, 0.007843138, 0, 1,
-2.820476, 1.057959, -1.19062, 1, 0.01176471, 0, 1,
-2.690334, 0.1449732, -0.2973771, 1, 0.01960784, 0, 1,
-2.515879, -0.3996544, -1.79763, 1, 0.02352941, 0, 1,
-2.461908, -2.633031, -2.112554, 1, 0.03137255, 0, 1,
-2.427815, 1.295635, -1.359505, 1, 0.03529412, 0, 1,
-2.394905, -2.065768, -2.349998, 1, 0.04313726, 0, 1,
-2.323261, -0.4629991, -1.772777, 1, 0.04705882, 0, 1,
-2.287221, -1.280441, -0.1859637, 1, 0.05490196, 0, 1,
-2.228883, -0.4464674, -0.9342694, 1, 0.05882353, 0, 1,
-2.224976, -0.6704181, -1.987504, 1, 0.06666667, 0, 1,
-2.167828, 0.2804744, -0.8573747, 1, 0.07058824, 0, 1,
-2.157587, -0.236105, -1.32615, 1, 0.07843138, 0, 1,
-2.157224, 1.448771, -3.008785, 1, 0.08235294, 0, 1,
-2.14801, -1.759668, -3.886457, 1, 0.09019608, 0, 1,
-2.128507, -2.18677, -2.189283, 1, 0.09411765, 0, 1,
-2.103313, 0.8187122, -1.068771, 1, 0.1019608, 0, 1,
-2.095794, -0.368986, -3.127449, 1, 0.1098039, 0, 1,
-2.084815, 0.3831055, -0.4066638, 1, 0.1137255, 0, 1,
-2.074555, 0.239704, -1.442691, 1, 0.1215686, 0, 1,
-2.026065, 1.697727, -1.116994, 1, 0.1254902, 0, 1,
-2.015416, 0.2012822, -2.283619, 1, 0.1333333, 0, 1,
-2.012244, 0.07938115, -0.3557861, 1, 0.1372549, 0, 1,
-2.005292, -0.3192844, -0.987491, 1, 0.145098, 0, 1,
-1.984403, 2.135733, -0.401879, 1, 0.1490196, 0, 1,
-1.95917, 0.09854358, 0.4875386, 1, 0.1568628, 0, 1,
-1.94872, -1.144098, -3.347033, 1, 0.1607843, 0, 1,
-1.920465, 1.020298, -0.1671998, 1, 0.1686275, 0, 1,
-1.913078, 1.261229, -0.1866605, 1, 0.172549, 0, 1,
-1.878737, -1.587182, -1.993257, 1, 0.1803922, 0, 1,
-1.874331, 1.272782, -1.70185, 1, 0.1843137, 0, 1,
-1.85655, 0.3217799, -2.31456, 1, 0.1921569, 0, 1,
-1.855036, 0.3476986, -2.046973, 1, 0.1960784, 0, 1,
-1.84192, 0.07955393, -2.114875, 1, 0.2039216, 0, 1,
-1.833855, 1.263492, 0.8743405, 1, 0.2117647, 0, 1,
-1.830896, 0.8351181, -2.207891, 1, 0.2156863, 0, 1,
-1.806342, 0.4403127, -1.603067, 1, 0.2235294, 0, 1,
-1.768552, -0.9501472, -1.667532, 1, 0.227451, 0, 1,
-1.766078, 0.1356177, -1.671349, 1, 0.2352941, 0, 1,
-1.76367, 0.6277782, -1.305916, 1, 0.2392157, 0, 1,
-1.755421, -0.3079762, -1.468783, 1, 0.2470588, 0, 1,
-1.744074, 0.347277, -0.9041033, 1, 0.2509804, 0, 1,
-1.743015, -1.624334, -2.066957, 1, 0.2588235, 0, 1,
-1.734782, 0.5246441, -1.242197, 1, 0.2627451, 0, 1,
-1.708616, 0.5047405, -1.43676, 1, 0.2705882, 0, 1,
-1.704468, 0.09925508, -1.248096, 1, 0.2745098, 0, 1,
-1.703257, -0.6871843, -0.5305117, 1, 0.282353, 0, 1,
-1.691109, 0.03307465, 0.05557697, 1, 0.2862745, 0, 1,
-1.688099, 0.5424976, -1.2995, 1, 0.2941177, 0, 1,
-1.681601, 0.06384969, -1.876303, 1, 0.3019608, 0, 1,
-1.678605, 1.272205, -0.7942005, 1, 0.3058824, 0, 1,
-1.671757, 2.261374, -0.2668412, 1, 0.3137255, 0, 1,
-1.658075, -0.5293872, -0.9002239, 1, 0.3176471, 0, 1,
-1.637529, -1.525461, -2.340299, 1, 0.3254902, 0, 1,
-1.637434, -1.295938, -2.317412, 1, 0.3294118, 0, 1,
-1.635134, -2.104035, -1.751004, 1, 0.3372549, 0, 1,
-1.624363, -2.963313, -3.734802, 1, 0.3411765, 0, 1,
-1.620273, 0.1844112, -3.431302, 1, 0.3490196, 0, 1,
-1.609806, -0.3738548, -0.2663548, 1, 0.3529412, 0, 1,
-1.60193, 1.381229, -1.726489, 1, 0.3607843, 0, 1,
-1.593612, -0.4309172, -3.131104, 1, 0.3647059, 0, 1,
-1.578007, -1.398394, -1.328322, 1, 0.372549, 0, 1,
-1.560662, 0.2474995, -0.818705, 1, 0.3764706, 0, 1,
-1.51756, -1.789335, -1.553728, 1, 0.3843137, 0, 1,
-1.502421, 1.930694, -2.00902, 1, 0.3882353, 0, 1,
-1.501159, 0.5722175, -1.282468, 1, 0.3960784, 0, 1,
-1.500687, -2.294592, -1.563581, 1, 0.4039216, 0, 1,
-1.479934, -0.05945324, -2.401039, 1, 0.4078431, 0, 1,
-1.460826, -0.1471244, -0.7674754, 1, 0.4156863, 0, 1,
-1.45452, 0.3619975, -3.272244, 1, 0.4196078, 0, 1,
-1.447847, -0.95859, -1.610942, 1, 0.427451, 0, 1,
-1.44639, -1.168071, -1.526469, 1, 0.4313726, 0, 1,
-1.444299, -0.8392782, -1.618349, 1, 0.4392157, 0, 1,
-1.441351, -0.3087348, -0.6806376, 1, 0.4431373, 0, 1,
-1.438433, -1.086913, -5.37895, 1, 0.4509804, 0, 1,
-1.432276, -1.995738, -2.576258, 1, 0.454902, 0, 1,
-1.428408, -0.9304326, -4.238573, 1, 0.4627451, 0, 1,
-1.428131, 0.02167863, -1.807665, 1, 0.4666667, 0, 1,
-1.422294, 0.8421513, 0.0489283, 1, 0.4745098, 0, 1,
-1.421998, 0.1222887, -0.07013914, 1, 0.4784314, 0, 1,
-1.419091, 0.5244062, -1.025442, 1, 0.4862745, 0, 1,
-1.416398, -1.522509, -2.750921, 1, 0.4901961, 0, 1,
-1.416041, 0.2047008, -2.018672, 1, 0.4980392, 0, 1,
-1.404213, -0.3394181, -2.111763, 1, 0.5058824, 0, 1,
-1.403927, 1.675521, 0.5776476, 1, 0.509804, 0, 1,
-1.401295, -0.1992204, -1.783185, 1, 0.5176471, 0, 1,
-1.384378, 0.3263366, -2.568148, 1, 0.5215687, 0, 1,
-1.380543, -1.058022, -2.653927, 1, 0.5294118, 0, 1,
-1.377416, 0.3919666, -1.114395, 1, 0.5333334, 0, 1,
-1.353279, -0.5577426, -2.196644, 1, 0.5411765, 0, 1,
-1.353114, 0.01757729, -2.754253, 1, 0.5450981, 0, 1,
-1.351837, 0.8418117, -1.333007, 1, 0.5529412, 0, 1,
-1.344273, -0.2195688, -2.907924, 1, 0.5568628, 0, 1,
-1.329589, -0.2205463, -1.839594, 1, 0.5647059, 0, 1,
-1.308627, 0.1155697, -0.9124599, 1, 0.5686275, 0, 1,
-1.303724, 1.26608, -1.733511, 1, 0.5764706, 0, 1,
-1.302486, -1.2465, -0.8558708, 1, 0.5803922, 0, 1,
-1.299761, -0.2378889, -2.170022, 1, 0.5882353, 0, 1,
-1.295254, 0.3884483, 0.3722121, 1, 0.5921569, 0, 1,
-1.289643, 0.7874836, -1.269135, 1, 0.6, 0, 1,
-1.289225, -0.7079675, -2.88761, 1, 0.6078432, 0, 1,
-1.28641, -0.5498305, -1.683745, 1, 0.6117647, 0, 1,
-1.279257, 0.293794, -1.940963, 1, 0.6196079, 0, 1,
-1.276693, -1.514801, -2.337657, 1, 0.6235294, 0, 1,
-1.261423, 0.874524, -1.401907, 1, 0.6313726, 0, 1,
-1.248478, 1.403162, 0.5703462, 1, 0.6352941, 0, 1,
-1.24404, -0.181511, -3.464442, 1, 0.6431373, 0, 1,
-1.243572, 0.4047248, -2.560315, 1, 0.6470588, 0, 1,
-1.24175, 2.052018, -0.2418016, 1, 0.654902, 0, 1,
-1.241736, 0.4272445, -1.690212, 1, 0.6588235, 0, 1,
-1.240725, -1.358728, -1.754152, 1, 0.6666667, 0, 1,
-1.216936, -0.933221, -1.168002, 1, 0.6705883, 0, 1,
-1.210311, -1.121721, -3.203187, 1, 0.6784314, 0, 1,
-1.203388, -0.8258644, -2.04491, 1, 0.682353, 0, 1,
-1.199738, 1.457147, 0.4388572, 1, 0.6901961, 0, 1,
-1.19737, -0.1479933, -0.565784, 1, 0.6941177, 0, 1,
-1.196985, -0.1072423, 1.668926, 1, 0.7019608, 0, 1,
-1.189225, -0.9361051, -2.14099, 1, 0.7098039, 0, 1,
-1.177541, -1.095017, -2.122354, 1, 0.7137255, 0, 1,
-1.176316, 1.875371, 0.4050606, 1, 0.7215686, 0, 1,
-1.175396, 0.8131603, 0.4563025, 1, 0.7254902, 0, 1,
-1.173033, 1.359935, -1.227106, 1, 0.7333333, 0, 1,
-1.172293, -0.08842182, -0.4720744, 1, 0.7372549, 0, 1,
-1.172171, -0.3528665, -2.362692, 1, 0.7450981, 0, 1,
-1.166806, 0.6424485, -1.653664, 1, 0.7490196, 0, 1,
-1.163854, -0.2805962, -1.591718, 1, 0.7568628, 0, 1,
-1.162209, 0.479413, -1.364701, 1, 0.7607843, 0, 1,
-1.145639, 0.4591185, -2.574095, 1, 0.7686275, 0, 1,
-1.140743, 1.189611, 0.3786702, 1, 0.772549, 0, 1,
-1.135164, 0.1157289, 1.288557, 1, 0.7803922, 0, 1,
-1.134381, -0.8625498, -2.857773, 1, 0.7843137, 0, 1,
-1.133169, 1.107145, -1.101682, 1, 0.7921569, 0, 1,
-1.130086, 0.1523449, -0.3737928, 1, 0.7960784, 0, 1,
-1.129605, -0.8347903, -2.983149, 1, 0.8039216, 0, 1,
-1.127801, 0.416766, -0.3077807, 1, 0.8117647, 0, 1,
-1.119002, -0.8184685, -2.892693, 1, 0.8156863, 0, 1,
-1.11332, 0.8309541, -0.7298048, 1, 0.8235294, 0, 1,
-1.11235, -0.5237493, -2.368527, 1, 0.827451, 0, 1,
-1.111952, 0.2961412, -1.033812, 1, 0.8352941, 0, 1,
-1.110564, -0.4335457, -2.563396, 1, 0.8392157, 0, 1,
-1.109207, 0.8708428, -1.84712, 1, 0.8470588, 0, 1,
-1.106081, 1.333312, 0.3314831, 1, 0.8509804, 0, 1,
-1.102558, 1.469012, -1.18611, 1, 0.8588235, 0, 1,
-1.098795, -0.08008277, -1.868555, 1, 0.8627451, 0, 1,
-1.097957, -1.273121, -2.204707, 1, 0.8705882, 0, 1,
-1.09612, 0.5803066, -0.2815545, 1, 0.8745098, 0, 1,
-1.096022, 1.75525, 0.6847398, 1, 0.8823529, 0, 1,
-1.09477, -0.2731756, -2.076977, 1, 0.8862745, 0, 1,
-1.083144, 2.399477, -0.01907489, 1, 0.8941177, 0, 1,
-1.078019, 1.726258, -0.1445056, 1, 0.8980392, 0, 1,
-1.075946, -0.7604902, -1.236223, 1, 0.9058824, 0, 1,
-1.064592, 1.812531, -0.3088031, 1, 0.9137255, 0, 1,
-1.061668, -1.30611, -3.762757, 1, 0.9176471, 0, 1,
-1.058918, 1.003267, -1.992713, 1, 0.9254902, 0, 1,
-1.057231, 0.2873609, -1.720446, 1, 0.9294118, 0, 1,
-1.055101, 1.640061, -1.810153, 1, 0.9372549, 0, 1,
-1.054871, -0.4702069, -3.058082, 1, 0.9411765, 0, 1,
-1.054818, 0.1675457, -0.5700747, 1, 0.9490196, 0, 1,
-1.054791, 0.6468149, -2.556064, 1, 0.9529412, 0, 1,
-1.053308, 0.1009908, -0.7119054, 1, 0.9607843, 0, 1,
-1.049484, 0.5353562, -0.9330274, 1, 0.9647059, 0, 1,
-1.042907, -1.959616, -3.734178, 1, 0.972549, 0, 1,
-1.038343, 0.8711061, -0.3662295, 1, 0.9764706, 0, 1,
-1.030874, 0.1529715, -1.181642, 1, 0.9843137, 0, 1,
-1.027956, 0.03414481, 0.8954237, 1, 0.9882353, 0, 1,
-1.01987, -1.535138, -3.681552, 1, 0.9960784, 0, 1,
-1.018005, -0.9980121, -2.913393, 0.9960784, 1, 0, 1,
-1.005957, -0.2927662, -1.645976, 0.9921569, 1, 0, 1,
-1.002427, -0.4349238, -2.409867, 0.9843137, 1, 0, 1,
-1.002271, -0.8365493, -3.028271, 0.9803922, 1, 0, 1,
-0.996369, 0.6546286, -0.9774071, 0.972549, 1, 0, 1,
-0.9914939, -0.5518018, -0.7970375, 0.9686275, 1, 0, 1,
-0.990685, 0.7005935, -1.734101, 0.9607843, 1, 0, 1,
-0.9882039, 0.1376318, -0.4651744, 0.9568627, 1, 0, 1,
-0.983043, 1.123858, 0.07130469, 0.9490196, 1, 0, 1,
-0.9726546, 0.09826521, -2.09312, 0.945098, 1, 0, 1,
-0.9691249, -0.2387774, -2.189345, 0.9372549, 1, 0, 1,
-0.9683963, 0.1271226, -1.454207, 0.9333333, 1, 0, 1,
-0.9663498, -0.2897134, -2.449, 0.9254902, 1, 0, 1,
-0.9636986, -1.32739, -2.864313, 0.9215686, 1, 0, 1,
-0.9607714, -0.4280226, -0.2277124, 0.9137255, 1, 0, 1,
-0.9596841, -1.493991, -2.50999, 0.9098039, 1, 0, 1,
-0.9575379, -0.9148522, -1.342239, 0.9019608, 1, 0, 1,
-0.9554904, -1.349915, -1.621495, 0.8941177, 1, 0, 1,
-0.9528409, 1.66381, 0.6248313, 0.8901961, 1, 0, 1,
-0.9522272, -0.1388011, -2.697825, 0.8823529, 1, 0, 1,
-0.9511899, 0.2862108, -2.547638, 0.8784314, 1, 0, 1,
-0.9463368, -0.74985, -2.289688, 0.8705882, 1, 0, 1,
-0.9458357, 0.530223, -1.203573, 0.8666667, 1, 0, 1,
-0.9448007, -0.4878881, 0.02947571, 0.8588235, 1, 0, 1,
-0.9447736, 0.4721535, -1.357414, 0.854902, 1, 0, 1,
-0.9442903, 0.262995, -0.7169657, 0.8470588, 1, 0, 1,
-0.9440502, 0.9306305, -1.241602, 0.8431373, 1, 0, 1,
-0.9302413, -0.3207417, -0.3209341, 0.8352941, 1, 0, 1,
-0.9103448, 0.5539268, -1.94821, 0.8313726, 1, 0, 1,
-0.8968771, -0.6702869, -2.979623, 0.8235294, 1, 0, 1,
-0.8950032, -0.3810587, -1.515361, 0.8196079, 1, 0, 1,
-0.8949939, 1.375099, 0.08315104, 0.8117647, 1, 0, 1,
-0.8898865, 0.3108091, 0.3146833, 0.8078431, 1, 0, 1,
-0.8879855, -0.5417126, -2.14922, 0.8, 1, 0, 1,
-0.8848665, -0.5058092, -1.741596, 0.7921569, 1, 0, 1,
-0.8776708, 0.02628765, -1.58518, 0.7882353, 1, 0, 1,
-0.8732376, -0.4522799, -2.884066, 0.7803922, 1, 0, 1,
-0.8696738, 0.4734412, -1.80458, 0.7764706, 1, 0, 1,
-0.8648158, -1.545964, -1.69596, 0.7686275, 1, 0, 1,
-0.8577572, -0.4819703, -0.946826, 0.7647059, 1, 0, 1,
-0.847728, 0.06105066, -0.7586996, 0.7568628, 1, 0, 1,
-0.8415252, -0.7100435, -2.801171, 0.7529412, 1, 0, 1,
-0.8406206, 2.180708, -0.9774134, 0.7450981, 1, 0, 1,
-0.8388344, -0.2391943, -1.018745, 0.7411765, 1, 0, 1,
-0.8387859, -1.097926, -2.254604, 0.7333333, 1, 0, 1,
-0.8384828, -0.1082761, -1.386396, 0.7294118, 1, 0, 1,
-0.8257201, 0.5418376, 0.006838184, 0.7215686, 1, 0, 1,
-0.8191205, 0.783218, -0.9702483, 0.7176471, 1, 0, 1,
-0.819049, 1.272384, -0.2962429, 0.7098039, 1, 0, 1,
-0.8028841, -1.305791, -2.103987, 0.7058824, 1, 0, 1,
-0.8012308, 0.2298933, -2.478112, 0.6980392, 1, 0, 1,
-0.8000824, 1.054365, 0.7574645, 0.6901961, 1, 0, 1,
-0.7978309, -0.2264243, -1.220719, 0.6862745, 1, 0, 1,
-0.7971514, 1.061751, -0.9831448, 0.6784314, 1, 0, 1,
-0.7947014, -1.104227, -4.125957, 0.6745098, 1, 0, 1,
-0.7916988, -0.7162002, -2.131418, 0.6666667, 1, 0, 1,
-0.7779778, 0.1779317, -2.875685, 0.6627451, 1, 0, 1,
-0.7773777, -0.522818, -0.7963365, 0.654902, 1, 0, 1,
-0.7767985, 0.02733487, -1.434684, 0.6509804, 1, 0, 1,
-0.7707711, -0.8283501, -3.75984, 0.6431373, 1, 0, 1,
-0.7682496, 0.3408028, -0.8365688, 0.6392157, 1, 0, 1,
-0.7665571, 0.08165109, -3.48936, 0.6313726, 1, 0, 1,
-0.7652401, -1.231459, -2.970722, 0.627451, 1, 0, 1,
-0.7641078, 0.8637968, -1.869166, 0.6196079, 1, 0, 1,
-0.7640461, -0.8383874, -2.549321, 0.6156863, 1, 0, 1,
-0.7638208, 0.5642918, -1.342456, 0.6078432, 1, 0, 1,
-0.7597646, -1.542665, -2.29986, 0.6039216, 1, 0, 1,
-0.7566769, -0.3805678, -0.5994765, 0.5960785, 1, 0, 1,
-0.7542499, -0.975003, -3.336554, 0.5882353, 1, 0, 1,
-0.7534905, 0.07701024, -0.4012667, 0.5843138, 1, 0, 1,
-0.750317, 1.296913, -2.094634, 0.5764706, 1, 0, 1,
-0.7428358, 0.4584884, -0.545857, 0.572549, 1, 0, 1,
-0.7328681, -0.1143633, -0.6420651, 0.5647059, 1, 0, 1,
-0.7192922, -0.08020552, -0.01441, 0.5607843, 1, 0, 1,
-0.7146194, -1.251777, -2.581866, 0.5529412, 1, 0, 1,
-0.7129682, 0.4424905, -2.639279, 0.5490196, 1, 0, 1,
-0.7032754, 0.4119741, -1.467413, 0.5411765, 1, 0, 1,
-0.6994955, -0.0344855, 0.3939435, 0.5372549, 1, 0, 1,
-0.697229, -0.3746034, -1.289025, 0.5294118, 1, 0, 1,
-0.6918258, 0.2196201, -1.022423, 0.5254902, 1, 0, 1,
-0.6811017, -1.731642, -3.568322, 0.5176471, 1, 0, 1,
-0.6797085, -0.6361299, -1.897091, 0.5137255, 1, 0, 1,
-0.6747634, -0.07532668, -2.495412, 0.5058824, 1, 0, 1,
-0.66502, 0.4299302, -1.077031, 0.5019608, 1, 0, 1,
-0.6632564, 0.2992122, -2.563928, 0.4941176, 1, 0, 1,
-0.6606081, 0.8897529, -0.6119873, 0.4862745, 1, 0, 1,
-0.6591972, -0.7684348, -2.40079, 0.4823529, 1, 0, 1,
-0.6579961, -1.507647, -3.27561, 0.4745098, 1, 0, 1,
-0.6573488, -1.714818, -3.582667, 0.4705882, 1, 0, 1,
-0.6554657, 0.5369015, -2.57201, 0.4627451, 1, 0, 1,
-0.6554504, 1.095902, -0.004052421, 0.4588235, 1, 0, 1,
-0.6542046, 0.1248189, -0.9137537, 0.4509804, 1, 0, 1,
-0.6496453, -0.7112711, -2.384923, 0.4470588, 1, 0, 1,
-0.6495289, 1.744761, -0.4689045, 0.4392157, 1, 0, 1,
-0.6483492, 0.3116577, -3.717602, 0.4352941, 1, 0, 1,
-0.6449692, -1.011878, -1.710205, 0.427451, 1, 0, 1,
-0.6447085, -0.1609216, -2.587881, 0.4235294, 1, 0, 1,
-0.6439727, -1.106339, -1.753261, 0.4156863, 1, 0, 1,
-0.6351246, -0.4606095, -3.300056, 0.4117647, 1, 0, 1,
-0.6263968, -1.093431, -1.809832, 0.4039216, 1, 0, 1,
-0.6222264, 0.7061334, 0.545784, 0.3960784, 1, 0, 1,
-0.6168106, -0.2756601, -1.961748, 0.3921569, 1, 0, 1,
-0.6094683, -0.9808514, -1.801228, 0.3843137, 1, 0, 1,
-0.6072806, -0.4304898, -3.240353, 0.3803922, 1, 0, 1,
-0.6051489, 1.229224, 0.6634541, 0.372549, 1, 0, 1,
-0.6017383, -0.6887664, -1.493505, 0.3686275, 1, 0, 1,
-0.6014886, 0.4932674, 0.6470943, 0.3607843, 1, 0, 1,
-0.5976892, 1.637833, 0.7298632, 0.3568628, 1, 0, 1,
-0.5947959, -0.02593107, -1.150664, 0.3490196, 1, 0, 1,
-0.5937332, -1.541431, -3.260689, 0.345098, 1, 0, 1,
-0.5929976, 0.7669768, -0.2989852, 0.3372549, 1, 0, 1,
-0.5893394, -1.242289, -3.362665, 0.3333333, 1, 0, 1,
-0.5838774, -0.03246012, -0.7110486, 0.3254902, 1, 0, 1,
-0.58252, 0.00189344, -1.360604, 0.3215686, 1, 0, 1,
-0.5791496, -1.79261, -2.043565, 0.3137255, 1, 0, 1,
-0.5784157, -0.2633716, -2.436928, 0.3098039, 1, 0, 1,
-0.5760762, 1.149105, 1.074715, 0.3019608, 1, 0, 1,
-0.5738255, -0.8832483, -2.286344, 0.2941177, 1, 0, 1,
-0.5725587, 0.8102857, -1.052597, 0.2901961, 1, 0, 1,
-0.5683869, 0.2070504, -0.3485873, 0.282353, 1, 0, 1,
-0.5656457, -0.04273625, -1.709651, 0.2784314, 1, 0, 1,
-0.561968, 0.6861922, -0.05674027, 0.2705882, 1, 0, 1,
-0.5617933, -0.8979104, -1.523364, 0.2666667, 1, 0, 1,
-0.5611798, 0.6121147, 0.05838456, 0.2588235, 1, 0, 1,
-0.5591945, 0.6924636, -0.2742688, 0.254902, 1, 0, 1,
-0.5566325, -0.4776274, -0.7693883, 0.2470588, 1, 0, 1,
-0.5560414, -1.957344, -1.805084, 0.2431373, 1, 0, 1,
-0.5534247, -0.5992975, -2.510715, 0.2352941, 1, 0, 1,
-0.5443379, -1.905756, -4.116179, 0.2313726, 1, 0, 1,
-0.5439353, -0.2044111, -1.968557, 0.2235294, 1, 0, 1,
-0.5430787, 0.8694679, -0.8623751, 0.2196078, 1, 0, 1,
-0.5421662, 0.08196379, -1.239354, 0.2117647, 1, 0, 1,
-0.5405053, -0.7761471, -1.29751, 0.2078431, 1, 0, 1,
-0.5397227, 0.349274, -1.827881, 0.2, 1, 0, 1,
-0.5386226, 0.3338527, -1.611803, 0.1921569, 1, 0, 1,
-0.5368591, 1.01142, -0.5531976, 0.1882353, 1, 0, 1,
-0.5347543, 0.6721084, 1.708125, 0.1803922, 1, 0, 1,
-0.5309286, 1.09135, -0.7389069, 0.1764706, 1, 0, 1,
-0.5291991, 0.5951721, -0.4036992, 0.1686275, 1, 0, 1,
-0.5289534, 0.2619436, -0.9772418, 0.1647059, 1, 0, 1,
-0.5218421, 0.3344425, -1.399739, 0.1568628, 1, 0, 1,
-0.5145023, 0.6171476, -1.87929, 0.1529412, 1, 0, 1,
-0.5136225, 0.6749481, -2.123362, 0.145098, 1, 0, 1,
-0.5124068, -1.388633, -3.378881, 0.1411765, 1, 0, 1,
-0.5092288, -0.9534644, -2.524225, 0.1333333, 1, 0, 1,
-0.5058114, 0.9542632, 1.317575, 0.1294118, 1, 0, 1,
-0.5054238, -0.288604, -2.878402, 0.1215686, 1, 0, 1,
-0.5036683, -1.070086, -1.328247, 0.1176471, 1, 0, 1,
-0.499565, 0.9073716, -1.386507, 0.1098039, 1, 0, 1,
-0.4985228, 1.443824, -0.7151204, 0.1058824, 1, 0, 1,
-0.4965982, 2.228336, 0.4105945, 0.09803922, 1, 0, 1,
-0.4879605, -0.381003, -2.850765, 0.09019608, 1, 0, 1,
-0.4858823, -0.4915796, -3.178574, 0.08627451, 1, 0, 1,
-0.4857637, -0.4899123, -3.47185, 0.07843138, 1, 0, 1,
-0.4834971, -1.138252, -3.077301, 0.07450981, 1, 0, 1,
-0.48222, 0.2414017, -2.439204, 0.06666667, 1, 0, 1,
-0.4820009, 1.008476, -0.9114931, 0.0627451, 1, 0, 1,
-0.4741936, -0.6539508, -2.295883, 0.05490196, 1, 0, 1,
-0.4652973, 0.7916669, -0.9047753, 0.05098039, 1, 0, 1,
-0.4638622, -0.3183363, -2.573156, 0.04313726, 1, 0, 1,
-0.4616859, 0.9100493, 0.578149, 0.03921569, 1, 0, 1,
-0.4579667, -0.2588359, -1.376767, 0.03137255, 1, 0, 1,
-0.4574392, 0.149894, -1.325118, 0.02745098, 1, 0, 1,
-0.4570834, 3.354778, -0.3461081, 0.01960784, 1, 0, 1,
-0.4557406, 0.6700616, 0.1943406, 0.01568628, 1, 0, 1,
-0.44951, -1.71794, -2.169429, 0.007843138, 1, 0, 1,
-0.4453748, 0.3267334, -1.49183, 0.003921569, 1, 0, 1,
-0.4340665, -1.399378, -2.593069, 0, 1, 0.003921569, 1,
-0.4338382, 1.582634, -0.2589738, 0, 1, 0.01176471, 1,
-0.4323887, -0.234755, -3.194148, 0, 1, 0.01568628, 1,
-0.4289086, -1.291416, -1.541133, 0, 1, 0.02352941, 1,
-0.4266192, 0.2847239, -0.9560761, 0, 1, 0.02745098, 1,
-0.4233707, -1.475481, -3.403087, 0, 1, 0.03529412, 1,
-0.4230403, -0.353303, -3.962627, 0, 1, 0.03921569, 1,
-0.422112, 0.3835479, 0.5030411, 0, 1, 0.04705882, 1,
-0.4195955, -0.2420219, -2.919766, 0, 1, 0.05098039, 1,
-0.4173026, 0.5032583, -0.7501032, 0, 1, 0.05882353, 1,
-0.4165728, 0.1409232, -0.9906445, 0, 1, 0.0627451, 1,
-0.4156007, 1.568243, 2.024401, 0, 1, 0.07058824, 1,
-0.4139538, -1.189413, -3.284828, 0, 1, 0.07450981, 1,
-0.4122534, 1.672084, -1.508151, 0, 1, 0.08235294, 1,
-0.4100053, 0.9038702, -1.416538, 0, 1, 0.08627451, 1,
-0.4092153, -0.06488341, -1.95203, 0, 1, 0.09411765, 1,
-0.4080409, 1.420879, 0.4120254, 0, 1, 0.1019608, 1,
-0.403068, 0.243064, 0.5982215, 0, 1, 0.1058824, 1,
-0.393665, 1.01329, -0.392791, 0, 1, 0.1137255, 1,
-0.392698, 0.3782034, 0.3633345, 0, 1, 0.1176471, 1,
-0.3923978, 0.7344496, 0.3968245, 0, 1, 0.1254902, 1,
-0.3861482, -0.5570539, -3.385372, 0, 1, 0.1294118, 1,
-0.3835938, -0.5742018, -3.139678, 0, 1, 0.1372549, 1,
-0.3807953, 0.08878145, -0.4282235, 0, 1, 0.1411765, 1,
-0.38067, -0.8657344, -1.393858, 0, 1, 0.1490196, 1,
-0.3777223, -0.3494976, -3.089572, 0, 1, 0.1529412, 1,
-0.3754007, 1.277692, -1.769858, 0, 1, 0.1607843, 1,
-0.3748075, -0.1234888, -1.735835, 0, 1, 0.1647059, 1,
-0.3731045, -1.569844, -1.853444, 0, 1, 0.172549, 1,
-0.3672065, 2.679159, -1.407001, 0, 1, 0.1764706, 1,
-0.3656767, 0.2019071, -2.063591, 0, 1, 0.1843137, 1,
-0.3639012, 0.8424573, -0.7729888, 0, 1, 0.1882353, 1,
-0.3613338, -0.634185, -1.856719, 0, 1, 0.1960784, 1,
-0.3610946, -0.4336474, -4.550561, 0, 1, 0.2039216, 1,
-0.3545462, 2.477875, -2.635718, 0, 1, 0.2078431, 1,
-0.3535322, -0.3308265, -2.649066, 0, 1, 0.2156863, 1,
-0.349941, -1.845165, -3.792418, 0, 1, 0.2196078, 1,
-0.3465846, -0.2242594, -3.065734, 0, 1, 0.227451, 1,
-0.3464256, 0.1228836, -1.84449, 0, 1, 0.2313726, 1,
-0.3455971, -0.4647919, -2.153007, 0, 1, 0.2392157, 1,
-0.3386872, 0.9573517, 1.180291, 0, 1, 0.2431373, 1,
-0.3355542, 1.336237, 0.9413193, 0, 1, 0.2509804, 1,
-0.3258601, 0.9517198, 0.1695981, 0, 1, 0.254902, 1,
-0.3253174, 0.6054258, -1.129774, 0, 1, 0.2627451, 1,
-0.3246676, 0.3449629, -0.5912991, 0, 1, 0.2666667, 1,
-0.3238503, -0.8199775, -3.307324, 0, 1, 0.2745098, 1,
-0.3157215, 0.6265478, 0.2532325, 0, 1, 0.2784314, 1,
-0.3126587, 0.08035406, -1.36337, 0, 1, 0.2862745, 1,
-0.3111864, 0.6082408, -1.687158, 0, 1, 0.2901961, 1,
-0.3097646, 0.9000348, 0.4622931, 0, 1, 0.2980392, 1,
-0.3096046, 1.118839, 0.1470224, 0, 1, 0.3058824, 1,
-0.3073032, -1.711074, -2.192345, 0, 1, 0.3098039, 1,
-0.3055857, 0.6420101, -0.5355051, 0, 1, 0.3176471, 1,
-0.3031285, 0.3704409, -0.1346352, 0, 1, 0.3215686, 1,
-0.3025218, -2.692155, -1.523274, 0, 1, 0.3294118, 1,
-0.3005897, -0.1750696, -1.939049, 0, 1, 0.3333333, 1,
-0.2972688, 0.2172513, -1.063987, 0, 1, 0.3411765, 1,
-0.2936729, 1.828179, 1.773754, 0, 1, 0.345098, 1,
-0.2935144, 0.8221114, -1.629766, 0, 1, 0.3529412, 1,
-0.2890104, -0.9908857, -3.572739, 0, 1, 0.3568628, 1,
-0.2885829, 0.6275833, -0.4892346, 0, 1, 0.3647059, 1,
-0.2882575, 1.61589, 1.173674, 0, 1, 0.3686275, 1,
-0.28413, 0.615609, -0.9325898, 0, 1, 0.3764706, 1,
-0.2810261, 1.833054, -0.1403845, 0, 1, 0.3803922, 1,
-0.2796737, 0.3157853, -1.961221, 0, 1, 0.3882353, 1,
-0.2786628, 0.5493822, 0.2371068, 0, 1, 0.3921569, 1,
-0.2734868, -0.4826157, -1.735023, 0, 1, 0.4, 1,
-0.2685041, 0.6251165, 0.3144141, 0, 1, 0.4078431, 1,
-0.2627769, 0.094069, -2.904575, 0, 1, 0.4117647, 1,
-0.2621202, 0.3586873, 1.511021, 0, 1, 0.4196078, 1,
-0.2590886, -0.9049909, -3.48322, 0, 1, 0.4235294, 1,
-0.2557847, -0.5607499, -1.470251, 0, 1, 0.4313726, 1,
-0.2557589, -2.430276, -2.807997, 0, 1, 0.4352941, 1,
-0.2504534, -1.295276, -2.996989, 0, 1, 0.4431373, 1,
-0.2501022, -1.90492, -3.671991, 0, 1, 0.4470588, 1,
-0.2499669, -1.067119, -2.76008, 0, 1, 0.454902, 1,
-0.247981, -0.03581793, -1.60493, 0, 1, 0.4588235, 1,
-0.2477907, -0.1065521, -4.041526, 0, 1, 0.4666667, 1,
-0.2462319, 0.4470932, -0.8272702, 0, 1, 0.4705882, 1,
-0.2395289, -0.5270004, -1.143173, 0, 1, 0.4784314, 1,
-0.2386293, 1.226401, 1.399331, 0, 1, 0.4823529, 1,
-0.2370377, 1.429201, -0.7434629, 0, 1, 0.4901961, 1,
-0.2354946, 0.4200052, -1.709785, 0, 1, 0.4941176, 1,
-0.2307563, -0.4555408, -2.304942, 0, 1, 0.5019608, 1,
-0.2287007, 0.2525583, 0.134343, 0, 1, 0.509804, 1,
-0.2282991, 1.213067, 1.279902, 0, 1, 0.5137255, 1,
-0.221495, -1.457116, -3.538094, 0, 1, 0.5215687, 1,
-0.2212461, 0.5099367, -0.4835388, 0, 1, 0.5254902, 1,
-0.2174542, -0.6869133, -2.016248, 0, 1, 0.5333334, 1,
-0.2163119, -0.240425, -0.1052023, 0, 1, 0.5372549, 1,
-0.2159441, 1.529851, -0.2915175, 0, 1, 0.5450981, 1,
-0.2158719, 1.308961, -1.333183, 0, 1, 0.5490196, 1,
-0.2153907, 0.6754052, -0.07677795, 0, 1, 0.5568628, 1,
-0.2093645, -1.648796, -1.906335, 0, 1, 0.5607843, 1,
-0.2078063, 0.4231003, -1.051292, 0, 1, 0.5686275, 1,
-0.2059269, 1.611632, -0.7222126, 0, 1, 0.572549, 1,
-0.1993084, 0.1535304, -1.182447, 0, 1, 0.5803922, 1,
-0.1990708, -0.3959034, -5.546434, 0, 1, 0.5843138, 1,
-0.198857, 0.6612861, 0.3452053, 0, 1, 0.5921569, 1,
-0.1983199, -0.818789, -2.755987, 0, 1, 0.5960785, 1,
-0.1973156, -0.547978, -3.495534, 0, 1, 0.6039216, 1,
-0.1971878, -0.9456689, -2.848631, 0, 1, 0.6117647, 1,
-0.1954097, -0.4523202, -2.339704, 0, 1, 0.6156863, 1,
-0.1943254, 0.541874, -0.9435356, 0, 1, 0.6235294, 1,
-0.1942434, -0.2802484, -3.7968, 0, 1, 0.627451, 1,
-0.1929684, -0.6806501, -3.294352, 0, 1, 0.6352941, 1,
-0.1911209, 2.230897, -0.4057223, 0, 1, 0.6392157, 1,
-0.1903846, 0.1858907, -0.8188033, 0, 1, 0.6470588, 1,
-0.1893745, 0.7214069, -0.09435182, 0, 1, 0.6509804, 1,
-0.1871438, -1.230298, -3.527372, 0, 1, 0.6588235, 1,
-0.1862583, -0.683808, -3.500003, 0, 1, 0.6627451, 1,
-0.1840459, 0.08328602, -1.814345, 0, 1, 0.6705883, 1,
-0.1787024, 1.07554, -2.414874, 0, 1, 0.6745098, 1,
-0.1777017, -0.4208771, -2.924689, 0, 1, 0.682353, 1,
-0.1710605, 1.541347, -1.272211, 0, 1, 0.6862745, 1,
-0.1673562, -0.3954812, -1.492106, 0, 1, 0.6941177, 1,
-0.1649965, -2.421932, -3.055424, 0, 1, 0.7019608, 1,
-0.1579587, -2.669046, -4.357786, 0, 1, 0.7058824, 1,
-0.1574014, -0.9472564, -3.141602, 0, 1, 0.7137255, 1,
-0.1537867, 0.3575741, 0.1960088, 0, 1, 0.7176471, 1,
-0.1488317, 0.1865106, 0.4255877, 0, 1, 0.7254902, 1,
-0.1454702, -0.4944378, -0.811848, 0, 1, 0.7294118, 1,
-0.1408042, 1.369853, -0.6686464, 0, 1, 0.7372549, 1,
-0.1398836, -0.7169771, -2.631599, 0, 1, 0.7411765, 1,
-0.1292303, -0.2884199, -3.151071, 0, 1, 0.7490196, 1,
-0.1255805, 0.6278328, -0.01029789, 0, 1, 0.7529412, 1,
-0.1204818, 0.6809803, 0.1736872, 0, 1, 0.7607843, 1,
-0.1199323, 1.107978, -0.6619383, 0, 1, 0.7647059, 1,
-0.1181299, 3.499845, -0.05328196, 0, 1, 0.772549, 1,
-0.1162653, -1.632566, -1.939318, 0, 1, 0.7764706, 1,
-0.1158066, 1.01063, 0.0117709, 0, 1, 0.7843137, 1,
-0.1127094, -0.4251652, -2.907565, 0, 1, 0.7882353, 1,
-0.1087163, -0.5309257, -1.606299, 0, 1, 0.7960784, 1,
-0.1081754, -0.8335831, -2.392892, 0, 1, 0.8039216, 1,
-0.1068286, -0.4835265, -2.120676, 0, 1, 0.8078431, 1,
-0.103538, 1.163046, 0.5748014, 0, 1, 0.8156863, 1,
-0.09521862, -0.5996945, -2.572194, 0, 1, 0.8196079, 1,
-0.09490222, -0.3557144, -1.681594, 0, 1, 0.827451, 1,
-0.09241796, 0.1492711, 0.2853758, 0, 1, 0.8313726, 1,
-0.08445173, 0.9386697, 0.973439, 0, 1, 0.8392157, 1,
-0.07580296, -1.364605, -2.181155, 0, 1, 0.8431373, 1,
-0.07518705, 0.4576462, -1.45651, 0, 1, 0.8509804, 1,
-0.07352198, -0.5894828, -3.052261, 0, 1, 0.854902, 1,
-0.0711084, -0.4745106, -2.740659, 0, 1, 0.8627451, 1,
-0.06905477, 0.3897785, -1.237444, 0, 1, 0.8666667, 1,
-0.06621824, 1.054633, -0.537122, 0, 1, 0.8745098, 1,
-0.06514524, -1.111143, -2.769613, 0, 1, 0.8784314, 1,
-0.06131498, -0.138377, -2.910631, 0, 1, 0.8862745, 1,
-0.05996532, 1.855824, -0.6565107, 0, 1, 0.8901961, 1,
-0.05589855, 0.08627598, -1.5917, 0, 1, 0.8980392, 1,
-0.05513323, -0.6599668, -2.986115, 0, 1, 0.9058824, 1,
-0.05486746, -0.8973656, -3.357805, 0, 1, 0.9098039, 1,
-0.05010423, 1.230787, 0.6111798, 0, 1, 0.9176471, 1,
-0.04603791, -0.6749921, -2.405151, 0, 1, 0.9215686, 1,
-0.04182622, 1.594918, 0.1651645, 0, 1, 0.9294118, 1,
-0.03965256, 0.889823, -1.213822, 0, 1, 0.9333333, 1,
-0.03836332, 0.01553622, -0.8011185, 0, 1, 0.9411765, 1,
-0.03679504, 2.279515, -0.6458377, 0, 1, 0.945098, 1,
-0.03138565, 0.797392, 0.6412446, 0, 1, 0.9529412, 1,
-0.02966457, -1.199388, -2.152991, 0, 1, 0.9568627, 1,
-0.02543083, 1.967963, 1.438185, 0, 1, 0.9647059, 1,
-0.02506744, 1.696671, 0.2362952, 0, 1, 0.9686275, 1,
-0.02240778, -0.8891417, -3.453086, 0, 1, 0.9764706, 1,
-0.02009689, -0.07111789, -2.875381, 0, 1, 0.9803922, 1,
-0.01812681, -1.084249, -0.7962015, 0, 1, 0.9882353, 1,
-0.01645125, 1.090353, -0.1653061, 0, 1, 0.9921569, 1,
-0.01229798, -1.226979, -2.472212, 0, 1, 1, 1,
-0.0049044, -0.9545237, -1.47893, 0, 0.9921569, 1, 1,
-0.004592564, 0.5696878, -1.228941, 0, 0.9882353, 1, 1,
-0.002000192, -1.68643, -4.252724, 0, 0.9803922, 1, 1,
0.002996475, 0.3905762, 1.5101, 0, 0.9764706, 1, 1,
0.003210093, 1.949815, 0.1446945, 0, 0.9686275, 1, 1,
0.007286321, 1.44084, -0.5907213, 0, 0.9647059, 1, 1,
0.009490428, -0.533901, 2.428075, 0, 0.9568627, 1, 1,
0.01124835, 0.7747669, 0.1496745, 0, 0.9529412, 1, 1,
0.01152334, 1.744569, 0.1314414, 0, 0.945098, 1, 1,
0.01152954, 0.5479097, 0.03374545, 0, 0.9411765, 1, 1,
0.02086285, 0.8936424, -0.5522904, 0, 0.9333333, 1, 1,
0.02321798, 0.9536947, -0.3150984, 0, 0.9294118, 1, 1,
0.02425829, 0.278438, 0.3311853, 0, 0.9215686, 1, 1,
0.03490996, -0.2726149, 3.98912, 0, 0.9176471, 1, 1,
0.0354807, -1.9174, 1.964123, 0, 0.9098039, 1, 1,
0.03616768, -0.0583864, 2.560281, 0, 0.9058824, 1, 1,
0.03685429, -0.2234612, 1.919386, 0, 0.8980392, 1, 1,
0.04235831, -1.817329, 4.918831, 0, 0.8901961, 1, 1,
0.04381115, -0.3129895, 4.032028, 0, 0.8862745, 1, 1,
0.04553926, -0.7981825, 2.681462, 0, 0.8784314, 1, 1,
0.05154922, 1.350151, -0.2829446, 0, 0.8745098, 1, 1,
0.05226053, -0.4389729, 2.518673, 0, 0.8666667, 1, 1,
0.0532595, -0.01977763, 3.21934, 0, 0.8627451, 1, 1,
0.05783416, -2.78103, 3.312065, 0, 0.854902, 1, 1,
0.05811734, 0.2323731, 0.3058355, 0, 0.8509804, 1, 1,
0.05929543, -0.19059, 3.956623, 0, 0.8431373, 1, 1,
0.06159553, -1.288691, 3.120578, 0, 0.8392157, 1, 1,
0.06198269, 0.05846397, 1.099178, 0, 0.8313726, 1, 1,
0.06386037, 0.8070738, 0.1899297, 0, 0.827451, 1, 1,
0.06503474, -0.05936985, 4.761652, 0, 0.8196079, 1, 1,
0.07367478, -0.6277978, 1.735333, 0, 0.8156863, 1, 1,
0.07392138, 0.8480594, -1.456419, 0, 0.8078431, 1, 1,
0.07563494, 0.4691269, -0.7803172, 0, 0.8039216, 1, 1,
0.07593759, -1.577926, 2.870425, 0, 0.7960784, 1, 1,
0.07830681, 0.4504572, 1.001015, 0, 0.7882353, 1, 1,
0.07903454, -1.036582, 3.680936, 0, 0.7843137, 1, 1,
0.07928959, 1.612488, 1.034251, 0, 0.7764706, 1, 1,
0.08094545, -2.035472, 3.501255, 0, 0.772549, 1, 1,
0.08256917, 1.314767, -0.06648401, 0, 0.7647059, 1, 1,
0.08539484, 0.9453959, 1.161086, 0, 0.7607843, 1, 1,
0.08908419, -1.14173, 3.576997, 0, 0.7529412, 1, 1,
0.09124386, 1.841452, 2.886711, 0, 0.7490196, 1, 1,
0.1012058, -0.1940664, 1.15253, 0, 0.7411765, 1, 1,
0.1019126, -0.5750594, 2.99862, 0, 0.7372549, 1, 1,
0.1029305, -0.6981708, 2.722893, 0, 0.7294118, 1, 1,
0.1067405, -1.055374, 2.540246, 0, 0.7254902, 1, 1,
0.1073554, -1.116503, 2.037677, 0, 0.7176471, 1, 1,
0.1100153, 0.7894075, -0.7326942, 0, 0.7137255, 1, 1,
0.111208, 0.1853688, 2.090626, 0, 0.7058824, 1, 1,
0.1150193, 0.8605317, -0.2803821, 0, 0.6980392, 1, 1,
0.1167016, -0.7969434, 3.426247, 0, 0.6941177, 1, 1,
0.1192678, 0.2156112, 0.2377926, 0, 0.6862745, 1, 1,
0.1224051, 1.002116, -1.120144, 0, 0.682353, 1, 1,
0.1230153, -0.9946221, 3.63394, 0, 0.6745098, 1, 1,
0.124145, 0.2429683, 0.1656815, 0, 0.6705883, 1, 1,
0.1318183, -0.494687, 2.923925, 0, 0.6627451, 1, 1,
0.132541, -1.985049, 2.247866, 0, 0.6588235, 1, 1,
0.1328183, -1.355324, 4.123731, 0, 0.6509804, 1, 1,
0.1338223, -1.184636, 2.159289, 0, 0.6470588, 1, 1,
0.1357419, -1.07845, 3.29678, 0, 0.6392157, 1, 1,
0.1361525, -0.9022452, 3.094182, 0, 0.6352941, 1, 1,
0.1426397, -0.3393475, 1.935674, 0, 0.627451, 1, 1,
0.1441842, -0.61215, 2.49022, 0, 0.6235294, 1, 1,
0.1447167, -0.4494179, 3.82977, 0, 0.6156863, 1, 1,
0.1494515, 0.6659145, 0.1074984, 0, 0.6117647, 1, 1,
0.150709, 0.4674116, -1.445243, 0, 0.6039216, 1, 1,
0.1529439, 0.3397258, -0.0492186, 0, 0.5960785, 1, 1,
0.1536165, 0.3711463, 0.5891136, 0, 0.5921569, 1, 1,
0.1549057, -2.6875, 2.96505, 0, 0.5843138, 1, 1,
0.1550791, -0.9122251, 3.336045, 0, 0.5803922, 1, 1,
0.1573255, 0.76774, 1.570635, 0, 0.572549, 1, 1,
0.1589473, -0.2800786, 4.967906, 0, 0.5686275, 1, 1,
0.1601719, -0.6578402, 3.430061, 0, 0.5607843, 1, 1,
0.1621534, -0.3907778, 2.727914, 0, 0.5568628, 1, 1,
0.1646859, 0.07993755, 1.10442, 0, 0.5490196, 1, 1,
0.1718875, 1.556911, 0.3984925, 0, 0.5450981, 1, 1,
0.1746952, 0.3097767, 1.777076, 0, 0.5372549, 1, 1,
0.175758, 0.5674945, 0.5408026, 0, 0.5333334, 1, 1,
0.1771166, 0.3600006, 1.824472, 0, 0.5254902, 1, 1,
0.1810452, -0.7713469, 2.712998, 0, 0.5215687, 1, 1,
0.1831454, -0.6689192, 3.067403, 0, 0.5137255, 1, 1,
0.1888439, 0.1889558, 0.9315255, 0, 0.509804, 1, 1,
0.1910681, -0.6776268, 3.16715, 0, 0.5019608, 1, 1,
0.193321, 0.1332473, -0.1251419, 0, 0.4941176, 1, 1,
0.1956595, -1.124539, 3.255146, 0, 0.4901961, 1, 1,
0.1999995, -0.9540838, 2.803978, 0, 0.4823529, 1, 1,
0.2012483, -1.323506, 1.30116, 0, 0.4784314, 1, 1,
0.2020675, 0.4138794, 1.442293, 0, 0.4705882, 1, 1,
0.2031824, 0.6581817, -0.3519846, 0, 0.4666667, 1, 1,
0.2040122, -0.5844671, 2.524475, 0, 0.4588235, 1, 1,
0.20446, -1.953098, 3.033811, 0, 0.454902, 1, 1,
0.2045833, -0.6016942, 3.864444, 0, 0.4470588, 1, 1,
0.2056448, 0.3714078, 0.9845831, 0, 0.4431373, 1, 1,
0.2069309, -1.512713, 2.485719, 0, 0.4352941, 1, 1,
0.2092676, 0.06404679, 2.308299, 0, 0.4313726, 1, 1,
0.212143, 1.197173, 0.154805, 0, 0.4235294, 1, 1,
0.2154504, 0.4935434, -0.5773516, 0, 0.4196078, 1, 1,
0.218566, 0.4833608, 0.652224, 0, 0.4117647, 1, 1,
0.2210835, -0.7322184, 2.408071, 0, 0.4078431, 1, 1,
0.2226183, -0.398903, 4.523318, 0, 0.4, 1, 1,
0.2248331, 0.6652321, 1.443956, 0, 0.3921569, 1, 1,
0.2252357, 1.357141, 0.4097119, 0, 0.3882353, 1, 1,
0.2302443, -0.6676892, 2.645551, 0, 0.3803922, 1, 1,
0.2313048, -0.1845676, 3.378448, 0, 0.3764706, 1, 1,
0.2350932, -0.6457613, 0.06213761, 0, 0.3686275, 1, 1,
0.2398495, 0.1999924, -0.05368149, 0, 0.3647059, 1, 1,
0.2429394, 0.9866247, 1.251221, 0, 0.3568628, 1, 1,
0.2433855, -0.437356, 2.441336, 0, 0.3529412, 1, 1,
0.2467248, -0.01243325, 2.650547, 0, 0.345098, 1, 1,
0.2496267, -0.3812041, 3.692512, 0, 0.3411765, 1, 1,
0.2508717, -1.503921, 2.720774, 0, 0.3333333, 1, 1,
0.2510239, -0.1195381, 0.5901039, 0, 0.3294118, 1, 1,
0.2552859, -0.6754504, 3.002008, 0, 0.3215686, 1, 1,
0.2584243, 0.1990378, 0.8431557, 0, 0.3176471, 1, 1,
0.2598925, -0.3011332, 2.421537, 0, 0.3098039, 1, 1,
0.2613806, -1.170964, 3.928724, 0, 0.3058824, 1, 1,
0.2616746, -0.3348984, 2.870317, 0, 0.2980392, 1, 1,
0.2642474, -0.6567888, 3.740072, 0, 0.2901961, 1, 1,
0.267577, 0.18473, -0.1001651, 0, 0.2862745, 1, 1,
0.2697991, 0.1712028, 1.164213, 0, 0.2784314, 1, 1,
0.2710694, -0.5848538, 4.801191, 0, 0.2745098, 1, 1,
0.274178, -1.082995, 2.533095, 0, 0.2666667, 1, 1,
0.2802465, 1.173815, 1.219539, 0, 0.2627451, 1, 1,
0.2828621, 1.517858, -0.4706607, 0, 0.254902, 1, 1,
0.288036, -0.1324063, 2.151301, 0, 0.2509804, 1, 1,
0.2921378, -1.510362, 2.668083, 0, 0.2431373, 1, 1,
0.2948107, 2.437129, -1.007349, 0, 0.2392157, 1, 1,
0.3014002, -0.3285128, 2.986416, 0, 0.2313726, 1, 1,
0.3056575, -1.973678, 3.383157, 0, 0.227451, 1, 1,
0.3062842, 0.3083808, -0.3924648, 0, 0.2196078, 1, 1,
0.3095182, -2.450385, 2.89082, 0, 0.2156863, 1, 1,
0.3122804, -0.2622369, 4.653018, 0, 0.2078431, 1, 1,
0.3132887, -0.5297046, 4.011, 0, 0.2039216, 1, 1,
0.3183487, -1.103874, 2.472942, 0, 0.1960784, 1, 1,
0.3194225, 0.264459, 2.865844, 0, 0.1882353, 1, 1,
0.3218617, 0.920463, 2.905187, 0, 0.1843137, 1, 1,
0.322663, 0.6294019, 1.810626, 0, 0.1764706, 1, 1,
0.3237477, 1.337217, -0.2770695, 0, 0.172549, 1, 1,
0.3247756, -1.27818, 3.156067, 0, 0.1647059, 1, 1,
0.3269413, 0.6995375, 1.42963, 0, 0.1607843, 1, 1,
0.3284097, -0.06592701, 1.383137, 0, 0.1529412, 1, 1,
0.3310947, 0.1689095, 1.954688, 0, 0.1490196, 1, 1,
0.3320549, -1.957305, 3.533498, 0, 0.1411765, 1, 1,
0.3366937, 1.853691, -0.5513613, 0, 0.1372549, 1, 1,
0.3406018, 0.3135909, 0.8816862, 0, 0.1294118, 1, 1,
0.342281, -0.04285325, 1.422473, 0, 0.1254902, 1, 1,
0.342882, 1.292189, 0.4474686, 0, 0.1176471, 1, 1,
0.3467334, -1.87973, 2.663695, 0, 0.1137255, 1, 1,
0.3518922, 0.8043056, 0.7367922, 0, 0.1058824, 1, 1,
0.3544772, -0.2730059, 3.370943, 0, 0.09803922, 1, 1,
0.3563145, -0.1160879, 3.277561, 0, 0.09411765, 1, 1,
0.3598779, -0.4934164, 4.354204, 0, 0.08627451, 1, 1,
0.365688, -0.4725743, 3.411941, 0, 0.08235294, 1, 1,
0.366625, 0.8859113, -1.275548, 0, 0.07450981, 1, 1,
0.3680755, -0.4992434, 4.021662, 0, 0.07058824, 1, 1,
0.3684225, -0.5147857, 2.356908, 0, 0.0627451, 1, 1,
0.3700011, -1.444191, 2.308515, 0, 0.05882353, 1, 1,
0.371191, -0.6146951, 2.272529, 0, 0.05098039, 1, 1,
0.3766162, 0.1265199, 0.4397297, 0, 0.04705882, 1, 1,
0.3773416, 0.9436089, -0.4759562, 0, 0.03921569, 1, 1,
0.3788246, -0.2254913, 2.153747, 0, 0.03529412, 1, 1,
0.3814665, -0.5100436, 3.506093, 0, 0.02745098, 1, 1,
0.3856948, -0.779184, 1.645144, 0, 0.02352941, 1, 1,
0.3863654, 0.3933307, 1.112409, 0, 0.01568628, 1, 1,
0.3888101, 1.3414, 1.429798, 0, 0.01176471, 1, 1,
0.3893891, -0.8755366, 3.31418, 0, 0.003921569, 1, 1,
0.3907276, 0.4197923, -1.073909, 0.003921569, 0, 1, 1,
0.3908201, -1.132242, 3.052332, 0.007843138, 0, 1, 1,
0.3953621, -1.400132, 2.199797, 0.01568628, 0, 1, 1,
0.399502, -0.1815758, 1.999587, 0.01960784, 0, 1, 1,
0.4011747, 0.7119913, 1.305327, 0.02745098, 0, 1, 1,
0.4087925, -0.6310717, 2.560352, 0.03137255, 0, 1, 1,
0.4123156, 0.00218334, 0.594725, 0.03921569, 0, 1, 1,
0.4123276, 0.3726337, 0.8309444, 0.04313726, 0, 1, 1,
0.4169058, 1.412874, 0.08468714, 0.05098039, 0, 1, 1,
0.4197381, 0.8036369, 0.3365749, 0.05490196, 0, 1, 1,
0.420532, -1.988823, 4.431379, 0.0627451, 0, 1, 1,
0.4206316, 1.063341, 0.830732, 0.06666667, 0, 1, 1,
0.4210352, -0.2939835, 2.743605, 0.07450981, 0, 1, 1,
0.4241391, -0.3266259, 1.609195, 0.07843138, 0, 1, 1,
0.42596, -0.4252908, 2.009043, 0.08627451, 0, 1, 1,
0.4283742, 0.23641, 0.1848411, 0.09019608, 0, 1, 1,
0.4305983, -0.03116016, 1.078434, 0.09803922, 0, 1, 1,
0.4347802, 1.502244, 0.2213559, 0.1058824, 0, 1, 1,
0.4355098, 1.118241, 0.8046643, 0.1098039, 0, 1, 1,
0.4365878, -0.1414501, 1.911275, 0.1176471, 0, 1, 1,
0.4385933, -0.4959595, 0.157639, 0.1215686, 0, 1, 1,
0.4421947, -0.5039285, 0.01710496, 0.1294118, 0, 1, 1,
0.4439917, 1.43483, 1.576722, 0.1333333, 0, 1, 1,
0.4477735, 0.6730337, -0.8298625, 0.1411765, 0, 1, 1,
0.4482687, 0.05430745, 1.490594, 0.145098, 0, 1, 1,
0.4565685, -1.135169, 3.351851, 0.1529412, 0, 1, 1,
0.4570615, 1.519706, 0.152083, 0.1568628, 0, 1, 1,
0.4586183, -1.544962, 0.8270345, 0.1647059, 0, 1, 1,
0.459687, 0.4130367, 0.4365445, 0.1686275, 0, 1, 1,
0.466061, -0.4225759, 3.182641, 0.1764706, 0, 1, 1,
0.4662236, -0.1337935, 0.644495, 0.1803922, 0, 1, 1,
0.4741981, 0.2608632, 1.971975, 0.1882353, 0, 1, 1,
0.4786934, -0.804494, 2.813297, 0.1921569, 0, 1, 1,
0.48795, 0.3460177, 1.060946, 0.2, 0, 1, 1,
0.488707, 0.689414, 0.1924019, 0.2078431, 0, 1, 1,
0.4893397, 1.123248, 0.2793781, 0.2117647, 0, 1, 1,
0.4961376, 0.6335803, 1.231799, 0.2196078, 0, 1, 1,
0.497095, -0.559704, 0.9608671, 0.2235294, 0, 1, 1,
0.5031621, 2.16781, -1.11059, 0.2313726, 0, 1, 1,
0.5084655, -1.596054, 2.900974, 0.2352941, 0, 1, 1,
0.5100353, 0.5021329, 0.04029698, 0.2431373, 0, 1, 1,
0.511631, 2.065302, 0.4432538, 0.2470588, 0, 1, 1,
0.5128397, 0.1152291, 1.690035, 0.254902, 0, 1, 1,
0.5148059, 0.4867946, 1.525054, 0.2588235, 0, 1, 1,
0.5181875, 0.08753037, 2.926485, 0.2666667, 0, 1, 1,
0.5204528, 0.2164224, 0.8968707, 0.2705882, 0, 1, 1,
0.5207031, 0.3825983, 2.898711, 0.2784314, 0, 1, 1,
0.5230426, 0.7587962, 1.068847, 0.282353, 0, 1, 1,
0.5257806, -0.07311164, 1.627457, 0.2901961, 0, 1, 1,
0.5292826, -0.4089745, 2.874508, 0.2941177, 0, 1, 1,
0.5362236, 1.207157, 0.4065848, 0.3019608, 0, 1, 1,
0.5375839, -0.07526824, 0.5417296, 0.3098039, 0, 1, 1,
0.5379802, -1.77871, 2.686725, 0.3137255, 0, 1, 1,
0.5400132, 0.6661561, -0.3148781, 0.3215686, 0, 1, 1,
0.5401962, -0.3379647, 2.05704, 0.3254902, 0, 1, 1,
0.5408141, -0.1403652, 1.657708, 0.3333333, 0, 1, 1,
0.5431837, 0.3315513, 1.16506, 0.3372549, 0, 1, 1,
0.5478089, -0.4998147, 1.686159, 0.345098, 0, 1, 1,
0.5517304, 1.67372, 2.371197, 0.3490196, 0, 1, 1,
0.5530671, 0.8298813, -1.227026, 0.3568628, 0, 1, 1,
0.5531632, 0.4250565, 1.603975, 0.3607843, 0, 1, 1,
0.5567182, -1.6674, 2.825678, 0.3686275, 0, 1, 1,
0.5618858, 0.07310909, 0.7930878, 0.372549, 0, 1, 1,
0.5632572, 1.755519, 1.124917, 0.3803922, 0, 1, 1,
0.5646608, 0.2268658, 0.3708693, 0.3843137, 0, 1, 1,
0.5648919, -0.2090622, 1.867813, 0.3921569, 0, 1, 1,
0.5653297, 1.169298, 0.777432, 0.3960784, 0, 1, 1,
0.5668383, 1.774032, -0.7720218, 0.4039216, 0, 1, 1,
0.5671415, -1.359777, 3.533656, 0.4117647, 0, 1, 1,
0.5671889, -0.2200337, 1.197216, 0.4156863, 0, 1, 1,
0.5733555, -0.8102976, 2.149574, 0.4235294, 0, 1, 1,
0.5764704, 0.5268847, 1.844549, 0.427451, 0, 1, 1,
0.5765521, -0.6271999, 3.524429, 0.4352941, 0, 1, 1,
0.5768091, 0.2244914, 1.640826, 0.4392157, 0, 1, 1,
0.5823398, -0.8852001, 0.4803424, 0.4470588, 0, 1, 1,
0.5832493, 1.542346, -0.4436393, 0.4509804, 0, 1, 1,
0.5848129, 1.397003, 1.051492, 0.4588235, 0, 1, 1,
0.5865846, -0.7843406, 3.392355, 0.4627451, 0, 1, 1,
0.590582, -0.1304617, 1.842914, 0.4705882, 0, 1, 1,
0.5927176, -0.1317017, 0.3763497, 0.4745098, 0, 1, 1,
0.6004602, 1.175631, 0.198342, 0.4823529, 0, 1, 1,
0.6021615, -1.884699, 2.273784, 0.4862745, 0, 1, 1,
0.61745, 0.5859064, 0.615635, 0.4941176, 0, 1, 1,
0.6182585, -1.105118, 1.544539, 0.5019608, 0, 1, 1,
0.6232744, -1.40087, 2.937943, 0.5058824, 0, 1, 1,
0.6236089, -0.2461246, 1.110641, 0.5137255, 0, 1, 1,
0.6240985, 0.6866745, 0.9944109, 0.5176471, 0, 1, 1,
0.6259021, 1.82472, 0.4278226, 0.5254902, 0, 1, 1,
0.6383216, 0.4226042, 2.329576, 0.5294118, 0, 1, 1,
0.6463347, -0.3071012, 3.502928, 0.5372549, 0, 1, 1,
0.6563413, -0.6025943, 2.392596, 0.5411765, 0, 1, 1,
0.6567745, -1.787164, 4.802938, 0.5490196, 0, 1, 1,
0.6589907, 1.718281, 1.060799, 0.5529412, 0, 1, 1,
0.6655358, -0.7313015, 2.211725, 0.5607843, 0, 1, 1,
0.665791, 1.288035, 0.4356559, 0.5647059, 0, 1, 1,
0.6672505, 1.792635, -0.5041066, 0.572549, 0, 1, 1,
0.673824, -0.9861553, 2.564299, 0.5764706, 0, 1, 1,
0.678397, 0.4280516, 1.860376, 0.5843138, 0, 1, 1,
0.6837864, 0.3016099, 2.470384, 0.5882353, 0, 1, 1,
0.6867105, 0.1164482, 1.454039, 0.5960785, 0, 1, 1,
0.687313, -0.5806823, 4.123702, 0.6039216, 0, 1, 1,
0.6885573, -1.106692, 1.605249, 0.6078432, 0, 1, 1,
0.6942647, -0.3192674, 0.6800085, 0.6156863, 0, 1, 1,
0.7044721, 0.6288193, 1.408571, 0.6196079, 0, 1, 1,
0.7046033, -1.195683, 1.52935, 0.627451, 0, 1, 1,
0.7063785, 0.3609204, -1.001993, 0.6313726, 0, 1, 1,
0.7115674, 0.6986367, 0.7067369, 0.6392157, 0, 1, 1,
0.7126716, -0.127056, 1.206064, 0.6431373, 0, 1, 1,
0.7136855, 0.3859592, 2.506627, 0.6509804, 0, 1, 1,
0.7139114, 2.144046, 0.0001197331, 0.654902, 0, 1, 1,
0.7153725, 0.3675758, 0.5291954, 0.6627451, 0, 1, 1,
0.7177511, -1.049679, 0.5988533, 0.6666667, 0, 1, 1,
0.7205911, 0.3851968, -0.2270421, 0.6745098, 0, 1, 1,
0.7206148, 2.135973, -2.218627, 0.6784314, 0, 1, 1,
0.721019, -0.3603183, 2.030249, 0.6862745, 0, 1, 1,
0.7265124, -0.5729665, 1.967613, 0.6901961, 0, 1, 1,
0.7267632, -0.7155604, 1.392828, 0.6980392, 0, 1, 1,
0.7293089, 0.3099514, 1.460533, 0.7058824, 0, 1, 1,
0.7326798, -0.9573839, 1.4134, 0.7098039, 0, 1, 1,
0.7366377, -0.2656752, 1.244573, 0.7176471, 0, 1, 1,
0.7369443, 0.9718137, 0.7485856, 0.7215686, 0, 1, 1,
0.7373479, 1.187823, -1.096305, 0.7294118, 0, 1, 1,
0.7385744, 0.8384232, 0.8598559, 0.7333333, 0, 1, 1,
0.7388596, 0.6876328, -0.5587881, 0.7411765, 0, 1, 1,
0.7397147, -1.374076, 2.692691, 0.7450981, 0, 1, 1,
0.7509739, 0.9733556, -0.7585712, 0.7529412, 0, 1, 1,
0.7518793, -0.4933141, 3.734381, 0.7568628, 0, 1, 1,
0.7558261, 0.2438, 2.063101, 0.7647059, 0, 1, 1,
0.7585675, -0.1964405, 2.336634, 0.7686275, 0, 1, 1,
0.7593447, 1.769029, 1.224434, 0.7764706, 0, 1, 1,
0.7629913, -0.03156648, 0.6096601, 0.7803922, 0, 1, 1,
0.7660939, 0.7399458, 0.2038593, 0.7882353, 0, 1, 1,
0.7663171, 1.756911, 1.113101, 0.7921569, 0, 1, 1,
0.7678044, -0.01715494, 2.134578, 0.8, 0, 1, 1,
0.7703612, 0.1615649, 2.513316, 0.8078431, 0, 1, 1,
0.7786569, -1.343495, 3.514385, 0.8117647, 0, 1, 1,
0.779563, 0.6876237, 1.848578, 0.8196079, 0, 1, 1,
0.7825397, 0.587897, 0.7138963, 0.8235294, 0, 1, 1,
0.7833101, 0.1781668, 0.1552262, 0.8313726, 0, 1, 1,
0.7925616, -2.214627, 2.879377, 0.8352941, 0, 1, 1,
0.7956304, -0.2600196, 2.095989, 0.8431373, 0, 1, 1,
0.7996415, -0.7812184, 1.9871, 0.8470588, 0, 1, 1,
0.8035824, 0.8717697, 0.6025802, 0.854902, 0, 1, 1,
0.8076538, 1.568038, -0.8742287, 0.8588235, 0, 1, 1,
0.8107164, -0.832302, 3.191446, 0.8666667, 0, 1, 1,
0.8142443, 1.152717, -0.3756605, 0.8705882, 0, 1, 1,
0.8165208, -0.02184764, 0.2701974, 0.8784314, 0, 1, 1,
0.8167099, 0.2460292, 2.458529, 0.8823529, 0, 1, 1,
0.8173452, 0.3082896, 0.2323487, 0.8901961, 0, 1, 1,
0.818837, 0.1046564, 2.793612, 0.8941177, 0, 1, 1,
0.825861, -0.8180982, 4.775135, 0.9019608, 0, 1, 1,
0.8313149, -0.1208128, 2.639549, 0.9098039, 0, 1, 1,
0.8340296, 0.6060946, 1.979832, 0.9137255, 0, 1, 1,
0.8434529, -0.8607129, 1.457529, 0.9215686, 0, 1, 1,
0.8439628, -1.776428, 3.262255, 0.9254902, 0, 1, 1,
0.8480909, 1.201728, 0.6123167, 0.9333333, 0, 1, 1,
0.8591734, -0.8384352, 1.798976, 0.9372549, 0, 1, 1,
0.8599204, 0.5111914, 1.111955, 0.945098, 0, 1, 1,
0.8653575, 0.6821274, 2.609806, 0.9490196, 0, 1, 1,
0.866006, -2.107254, 3.07842, 0.9568627, 0, 1, 1,
0.87285, -1.108871, -0.504306, 0.9607843, 0, 1, 1,
0.8746381, -0.6105909, 3.75848, 0.9686275, 0, 1, 1,
0.8785453, 0.7853933, 0.8206528, 0.972549, 0, 1, 1,
0.9006421, 0.4072637, 1.251483, 0.9803922, 0, 1, 1,
0.9020534, 1.958554, -0.7873799, 0.9843137, 0, 1, 1,
0.9035005, -0.447512, 0.3324415, 0.9921569, 0, 1, 1,
0.9043881, -0.3413469, 1.975495, 0.9960784, 0, 1, 1,
0.9069633, -1.219427, 4.241008, 1, 0, 0.9960784, 1,
0.9186808, 0.8524801, 0.1279557, 1, 0, 0.9882353, 1,
0.9277036, 0.6768918, 1.287193, 1, 0, 0.9843137, 1,
0.9287265, 1.044422, 0.7683176, 1, 0, 0.9764706, 1,
0.9303513, -0.2263277, 1.613107, 1, 0, 0.972549, 1,
0.9305519, 0.9217285, -0.4409547, 1, 0, 0.9647059, 1,
0.9330974, 1.155057, 0.6270787, 1, 0, 0.9607843, 1,
0.9429498, 0.4263895, 0.4691291, 1, 0, 0.9529412, 1,
0.9430929, 1.388273, -0.5454949, 1, 0, 0.9490196, 1,
0.9484605, -0.1607484, 2.064237, 1, 0, 0.9411765, 1,
0.9495507, -1.984352, 3.25916, 1, 0, 0.9372549, 1,
0.9500345, 0.5128995, 1.529312, 1, 0, 0.9294118, 1,
0.9536435, 0.2137611, -0.3713808, 1, 0, 0.9254902, 1,
0.954719, 0.2608623, 1.852576, 1, 0, 0.9176471, 1,
0.9657602, 0.8579708, -0.3115914, 1, 0, 0.9137255, 1,
0.9715815, 1.556197, 2.621189, 1, 0, 0.9058824, 1,
0.9778239, -1.735258, 1.565125, 1, 0, 0.9019608, 1,
0.9835254, -1.058026, 3.551968, 1, 0, 0.8941177, 1,
0.9846758, 0.3489698, 0.9261693, 1, 0, 0.8862745, 1,
0.9894112, 0.5666419, 0.02575517, 1, 0, 0.8823529, 1,
0.9943749, 1.401358, 0.5801022, 1, 0, 0.8745098, 1,
0.9968095, 0.6884429, 1.683307, 1, 0, 0.8705882, 1,
0.9970674, -0.8882249, 0.8503003, 1, 0, 0.8627451, 1,
1.000186, 1.75017, 0.2245014, 1, 0, 0.8588235, 1,
1.000225, -0.2456992, 2.377354, 1, 0, 0.8509804, 1,
1.00594, 0.4638727, 2.630586, 1, 0, 0.8470588, 1,
1.01346, -1.115875, -0.4544404, 1, 0, 0.8392157, 1,
1.014124, 1.344896, 1.238445, 1, 0, 0.8352941, 1,
1.020003, -0.0400186, 1.48398, 1, 0, 0.827451, 1,
1.0202, 1.459787, 0.4797647, 1, 0, 0.8235294, 1,
1.022539, -0.4604952, 1.399667, 1, 0, 0.8156863, 1,
1.026114, 0.5922778, -0.2974998, 1, 0, 0.8117647, 1,
1.026297, -0.4971264, 2.328626, 1, 0, 0.8039216, 1,
1.03266, 1.097525, 1.458925, 1, 0, 0.7960784, 1,
1.033251, -0.2820745, 4.107779, 1, 0, 0.7921569, 1,
1.036072, 0.532549, 2.167629, 1, 0, 0.7843137, 1,
1.037205, -0.1229233, 1.864857, 1, 0, 0.7803922, 1,
1.047168, 1.058379, 1.286357, 1, 0, 0.772549, 1,
1.04796, -0.8160805, 1.515148, 1, 0, 0.7686275, 1,
1.049335, 1.380313, 0.6092815, 1, 0, 0.7607843, 1,
1.051335, -0.798922, 1.302877, 1, 0, 0.7568628, 1,
1.055553, -1.04536, 2.704008, 1, 0, 0.7490196, 1,
1.057084, 0.4519421, -0.06835072, 1, 0, 0.7450981, 1,
1.057453, -0.6086977, 4.770122, 1, 0, 0.7372549, 1,
1.05948, 1.836505, 0.3267903, 1, 0, 0.7333333, 1,
1.059525, 1.477594, -1.37879, 1, 0, 0.7254902, 1,
1.059688, 0.2755261, 1.365597, 1, 0, 0.7215686, 1,
1.063022, -1.266348, 0.06817377, 1, 0, 0.7137255, 1,
1.072919, 0.214662, 3.221487, 1, 0, 0.7098039, 1,
1.074234, 1.592587, 1.877102, 1, 0, 0.7019608, 1,
1.079289, 0.7552141, 0.2738976, 1, 0, 0.6941177, 1,
1.091826, -1.328733, 3.069847, 1, 0, 0.6901961, 1,
1.094556, -0.05177253, -0.4429089, 1, 0, 0.682353, 1,
1.096282, -0.6342281, 2.806029, 1, 0, 0.6784314, 1,
1.098456, -0.5986172, 1.371439, 1, 0, 0.6705883, 1,
1.101532, 0.6717468, 1.382282, 1, 0, 0.6666667, 1,
1.109804, 0.5292899, 1.013757, 1, 0, 0.6588235, 1,
1.119482, 0.5896734, 0.2914734, 1, 0, 0.654902, 1,
1.119804, 1.002965, 0.3403122, 1, 0, 0.6470588, 1,
1.129814, 0.5054955, 0.8434333, 1, 0, 0.6431373, 1,
1.137712, 0.1113197, -0.2354088, 1, 0, 0.6352941, 1,
1.144708, 0.1459134, 1.67245, 1, 0, 0.6313726, 1,
1.148442, -0.0006715941, 1.699224, 1, 0, 0.6235294, 1,
1.153592, 0.9373687, -2.027522, 1, 0, 0.6196079, 1,
1.164343, 1.627875, 2.045327, 1, 0, 0.6117647, 1,
1.171353, -0.8017473, 2.552673, 1, 0, 0.6078432, 1,
1.172164, 0.2599631, 1.408458, 1, 0, 0.6, 1,
1.17747, -0.5541973, 0.8329213, 1, 0, 0.5921569, 1,
1.183539, -0.9101557, 2.325356, 1, 0, 0.5882353, 1,
1.184339, 0.2208142, 1.671422, 1, 0, 0.5803922, 1,
1.185119, -0.1183212, 1.668721, 1, 0, 0.5764706, 1,
1.187485, 0.4585347, 0.7707487, 1, 0, 0.5686275, 1,
1.193158, -0.9586106, 2.391003, 1, 0, 0.5647059, 1,
1.218608, -1.383334, 3.275114, 1, 0, 0.5568628, 1,
1.219425, -1.526687, 0.6511483, 1, 0, 0.5529412, 1,
1.227289, 1.110497, 2.124965, 1, 0, 0.5450981, 1,
1.22972, -0.2983317, 0.8405758, 1, 0, 0.5411765, 1,
1.236599, -0.1777239, 3.668804, 1, 0, 0.5333334, 1,
1.23982, 1.739865, 0.3821799, 1, 0, 0.5294118, 1,
1.239888, -0.6450413, 0.2753905, 1, 0, 0.5215687, 1,
1.240347, -0.637623, 2.258898, 1, 0, 0.5176471, 1,
1.244489, -0.628204, 1.833555, 1, 0, 0.509804, 1,
1.246353, 0.3886027, 3.885591, 1, 0, 0.5058824, 1,
1.249555, -0.4982277, 3.168756, 1, 0, 0.4980392, 1,
1.252188, 0.214963, 3.849055, 1, 0, 0.4901961, 1,
1.257658, -0.9294147, 0.8480622, 1, 0, 0.4862745, 1,
1.25933, -0.7903134, 3.21442, 1, 0, 0.4784314, 1,
1.260874, -0.5037676, 2.586249, 1, 0, 0.4745098, 1,
1.273487, -1.287807, 1.872946, 1, 0, 0.4666667, 1,
1.273816, 1.451572, 1.74189, 1, 0, 0.4627451, 1,
1.279125, 1.20062, 0.6438051, 1, 0, 0.454902, 1,
1.281667, -1.189785, 2.297369, 1, 0, 0.4509804, 1,
1.287195, 1.063379, 0.542601, 1, 0, 0.4431373, 1,
1.287862, -0.6168892, 2.07424, 1, 0, 0.4392157, 1,
1.288209, 2.125123, 0.3217289, 1, 0, 0.4313726, 1,
1.300983, -1.269027, 2.102215, 1, 0, 0.427451, 1,
1.30235, 0.1571399, 2.885699, 1, 0, 0.4196078, 1,
1.303028, 2.232764, 2.843343, 1, 0, 0.4156863, 1,
1.318026, -0.8376458, 2.142143, 1, 0, 0.4078431, 1,
1.333183, 0.9016443, -0.365245, 1, 0, 0.4039216, 1,
1.360766, 1.295903, 3.098999, 1, 0, 0.3960784, 1,
1.370853, -1.519151, 0.9412751, 1, 0, 0.3882353, 1,
1.388009, -0.4548273, 1.655262, 1, 0, 0.3843137, 1,
1.389203, -1.023179, 2.057441, 1, 0, 0.3764706, 1,
1.42678, -2.630208, 1.950999, 1, 0, 0.372549, 1,
1.432112, -1.385416, 3.564483, 1, 0, 0.3647059, 1,
1.444515, 0.5021271, 1.083328, 1, 0, 0.3607843, 1,
1.451632, 0.6900871, -0.09830188, 1, 0, 0.3529412, 1,
1.452706, 0.3912759, 2.925781, 1, 0, 0.3490196, 1,
1.456368, 0.68916, 0.684027, 1, 0, 0.3411765, 1,
1.457725, 2.1707, -1.122562, 1, 0, 0.3372549, 1,
1.459045, -0.4203252, 2.24747, 1, 0, 0.3294118, 1,
1.459491, 0.3704514, 1.797143, 1, 0, 0.3254902, 1,
1.471045, 0.78097, 0.4675309, 1, 0, 0.3176471, 1,
1.477866, 2.42579, 1.44959, 1, 0, 0.3137255, 1,
1.486553, 0.314175, -0.2451887, 1, 0, 0.3058824, 1,
1.511536, 0.1715711, -0.1142457, 1, 0, 0.2980392, 1,
1.515988, 0.2993637, 2.108492, 1, 0, 0.2941177, 1,
1.525397, -0.2132379, 2.463051, 1, 0, 0.2862745, 1,
1.539568, 0.2068852, 1.647008, 1, 0, 0.282353, 1,
1.542096, 0.4719366, -0.5967085, 1, 0, 0.2745098, 1,
1.54687, 2.135723, 1.807266, 1, 0, 0.2705882, 1,
1.548995, 0.6422848, 1.491024, 1, 0, 0.2627451, 1,
1.60039, -0.05135582, 0.7815351, 1, 0, 0.2588235, 1,
1.616558, 1.811325, 0.6769306, 1, 0, 0.2509804, 1,
1.62532, -0.5994368, 1.962527, 1, 0, 0.2470588, 1,
1.692933, 0.5925028, -0.2601112, 1, 0, 0.2392157, 1,
1.695127, 0.8263101, 1.035304, 1, 0, 0.2352941, 1,
1.69919, -1.585499, 0.3656326, 1, 0, 0.227451, 1,
1.713687, -0.5293546, 2.832183, 1, 0, 0.2235294, 1,
1.719354, -0.9287108, 1.732144, 1, 0, 0.2156863, 1,
1.733386, 0.7179409, 1.950285, 1, 0, 0.2117647, 1,
1.73453, 0.3482326, 0.7285416, 1, 0, 0.2039216, 1,
1.769532, 0.2806889, 1.569746, 1, 0, 0.1960784, 1,
1.772259, 0.7271817, 0.599251, 1, 0, 0.1921569, 1,
1.777516, -0.9663513, 1.936905, 1, 0, 0.1843137, 1,
1.782831, -1.216674, 1.812341, 1, 0, 0.1803922, 1,
1.826511, -1.325872, 2.20726, 1, 0, 0.172549, 1,
1.836764, -0.01971614, 1.413774, 1, 0, 0.1686275, 1,
1.871058, 1.140507, 1.35127, 1, 0, 0.1607843, 1,
1.872942, 0.2502515, 1.034271, 1, 0, 0.1568628, 1,
1.879188, -0.3819342, 2.023176, 1, 0, 0.1490196, 1,
1.881761, -1.166547, 0.5635079, 1, 0, 0.145098, 1,
1.909949, 0.5726793, 2.384708, 1, 0, 0.1372549, 1,
1.969766, 0.3157072, 1.858879, 1, 0, 0.1333333, 1,
1.983169, 1.291321, -0.1315056, 1, 0, 0.1254902, 1,
2.001811, 0.5318743, 1.5244, 1, 0, 0.1215686, 1,
2.041405, 0.9048032, 1.490749, 1, 0, 0.1137255, 1,
2.049231, 0.7785084, 0.3470069, 1, 0, 0.1098039, 1,
2.050569, 1.138541, 0.2035285, 1, 0, 0.1019608, 1,
2.053311, 0.4972019, 2.063126, 1, 0, 0.09411765, 1,
2.075198, 0.2432243, 0.05345263, 1, 0, 0.09019608, 1,
2.130686, -0.4269185, 1.758025, 1, 0, 0.08235294, 1,
2.138127, -0.05518128, 2.33946, 1, 0, 0.07843138, 1,
2.206663, -1.130267, 2.233187, 1, 0, 0.07058824, 1,
2.291114, -1.092006, 1.461413, 1, 0, 0.06666667, 1,
2.329526, -2.14815, 1.934101, 1, 0, 0.05882353, 1,
2.342993, 0.5721906, 2.956734, 1, 0, 0.05490196, 1,
2.353298, 1.677779, 0.1201003, 1, 0, 0.04705882, 1,
2.354336, -0.3733718, 1.629021, 1, 0, 0.04313726, 1,
2.370696, -0.6791463, 2.421243, 1, 0, 0.03529412, 1,
2.552283, -0.4038096, 1.549731, 1, 0, 0.03137255, 1,
2.608483, -0.1052312, 1.095729, 1, 0, 0.02352941, 1,
2.680534, 0.5128673, 3.021638, 1, 0, 0.01960784, 1,
2.770184, -0.1750536, 1.846554, 1, 0, 0.01176471, 1,
4.029534, 0.2844783, 1.117385, 1, 0, 0.007843138, 1
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
0.2503189, -4.058818, -7.328615, 0, -0.5, 0.5, 0.5,
0.2503189, -4.058818, -7.328615, 1, -0.5, 0.5, 0.5,
0.2503189, -4.058818, -7.328615, 1, 1.5, 0.5, 0.5,
0.2503189, -4.058818, -7.328615, 0, 1.5, 0.5, 0.5
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
-4.81005, 0.268266, -7.328615, 0, -0.5, 0.5, 0.5,
-4.81005, 0.268266, -7.328615, 1, -0.5, 0.5, 0.5,
-4.81005, 0.268266, -7.328615, 1, 1.5, 0.5, 0.5,
-4.81005, 0.268266, -7.328615, 0, 1.5, 0.5, 0.5
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
-4.81005, -4.058818, -0.289264, 0, -0.5, 0.5, 0.5,
-4.81005, -4.058818, -0.289264, 1, -0.5, 0.5, 0.5,
-4.81005, -4.058818, -0.289264, 1, 1.5, 0.5, 0.5,
-4.81005, -4.058818, -0.289264, 0, 1.5, 0.5, 0.5
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
-2, -3.060261, -5.70415,
4, -3.060261, -5.70415,
-2, -3.060261, -5.70415,
-2, -3.226687, -5.974894,
0, -3.060261, -5.70415,
0, -3.226687, -5.974894,
2, -3.060261, -5.70415,
2, -3.226687, -5.974894,
4, -3.060261, -5.70415,
4, -3.226687, -5.974894
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
"2",
"4"
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
-2, -3.55954, -6.516382, 0, -0.5, 0.5, 0.5,
-2, -3.55954, -6.516382, 1, -0.5, 0.5, 0.5,
-2, -3.55954, -6.516382, 1, 1.5, 0.5, 0.5,
-2, -3.55954, -6.516382, 0, 1.5, 0.5, 0.5,
0, -3.55954, -6.516382, 0, -0.5, 0.5, 0.5,
0, -3.55954, -6.516382, 1, -0.5, 0.5, 0.5,
0, -3.55954, -6.516382, 1, 1.5, 0.5, 0.5,
0, -3.55954, -6.516382, 0, 1.5, 0.5, 0.5,
2, -3.55954, -6.516382, 0, -0.5, 0.5, 0.5,
2, -3.55954, -6.516382, 1, -0.5, 0.5, 0.5,
2, -3.55954, -6.516382, 1, 1.5, 0.5, 0.5,
2, -3.55954, -6.516382, 0, 1.5, 0.5, 0.5,
4, -3.55954, -6.516382, 0, -0.5, 0.5, 0.5,
4, -3.55954, -6.516382, 1, -0.5, 0.5, 0.5,
4, -3.55954, -6.516382, 1, 1.5, 0.5, 0.5,
4, -3.55954, -6.516382, 0, 1.5, 0.5, 0.5
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
-3.642273, -2, -5.70415,
-3.642273, 3, -5.70415,
-3.642273, -2, -5.70415,
-3.836903, -2, -5.974894,
-3.642273, -1, -5.70415,
-3.836903, -1, -5.974894,
-3.642273, 0, -5.70415,
-3.836903, 0, -5.974894,
-3.642273, 1, -5.70415,
-3.836903, 1, -5.974894,
-3.642273, 2, -5.70415,
-3.836903, 2, -5.974894,
-3.642273, 3, -5.70415,
-3.836903, 3, -5.974894
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
-4.226162, -2, -6.516382, 0, -0.5, 0.5, 0.5,
-4.226162, -2, -6.516382, 1, -0.5, 0.5, 0.5,
-4.226162, -2, -6.516382, 1, 1.5, 0.5, 0.5,
-4.226162, -2, -6.516382, 0, 1.5, 0.5, 0.5,
-4.226162, -1, -6.516382, 0, -0.5, 0.5, 0.5,
-4.226162, -1, -6.516382, 1, -0.5, 0.5, 0.5,
-4.226162, -1, -6.516382, 1, 1.5, 0.5, 0.5,
-4.226162, -1, -6.516382, 0, 1.5, 0.5, 0.5,
-4.226162, 0, -6.516382, 0, -0.5, 0.5, 0.5,
-4.226162, 0, -6.516382, 1, -0.5, 0.5, 0.5,
-4.226162, 0, -6.516382, 1, 1.5, 0.5, 0.5,
-4.226162, 0, -6.516382, 0, 1.5, 0.5, 0.5,
-4.226162, 1, -6.516382, 0, -0.5, 0.5, 0.5,
-4.226162, 1, -6.516382, 1, -0.5, 0.5, 0.5,
-4.226162, 1, -6.516382, 1, 1.5, 0.5, 0.5,
-4.226162, 1, -6.516382, 0, 1.5, 0.5, 0.5,
-4.226162, 2, -6.516382, 0, -0.5, 0.5, 0.5,
-4.226162, 2, -6.516382, 1, -0.5, 0.5, 0.5,
-4.226162, 2, -6.516382, 1, 1.5, 0.5, 0.5,
-4.226162, 2, -6.516382, 0, 1.5, 0.5, 0.5,
-4.226162, 3, -6.516382, 0, -0.5, 0.5, 0.5,
-4.226162, 3, -6.516382, 1, -0.5, 0.5, 0.5,
-4.226162, 3, -6.516382, 1, 1.5, 0.5, 0.5,
-4.226162, 3, -6.516382, 0, 1.5, 0.5, 0.5
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
-3.642273, -3.060261, -4,
-3.642273, -3.060261, 4,
-3.642273, -3.060261, -4,
-3.836903, -3.226687, -4,
-3.642273, -3.060261, -2,
-3.836903, -3.226687, -2,
-3.642273, -3.060261, 0,
-3.836903, -3.226687, 0,
-3.642273, -3.060261, 2,
-3.836903, -3.226687, 2,
-3.642273, -3.060261, 4,
-3.836903, -3.226687, 4
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
-4.226162, -3.55954, -4, 0, -0.5, 0.5, 0.5,
-4.226162, -3.55954, -4, 1, -0.5, 0.5, 0.5,
-4.226162, -3.55954, -4, 1, 1.5, 0.5, 0.5,
-4.226162, -3.55954, -4, 0, 1.5, 0.5, 0.5,
-4.226162, -3.55954, -2, 0, -0.5, 0.5, 0.5,
-4.226162, -3.55954, -2, 1, -0.5, 0.5, 0.5,
-4.226162, -3.55954, -2, 1, 1.5, 0.5, 0.5,
-4.226162, -3.55954, -2, 0, 1.5, 0.5, 0.5,
-4.226162, -3.55954, 0, 0, -0.5, 0.5, 0.5,
-4.226162, -3.55954, 0, 1, -0.5, 0.5, 0.5,
-4.226162, -3.55954, 0, 1, 1.5, 0.5, 0.5,
-4.226162, -3.55954, 0, 0, 1.5, 0.5, 0.5,
-4.226162, -3.55954, 2, 0, -0.5, 0.5, 0.5,
-4.226162, -3.55954, 2, 1, -0.5, 0.5, 0.5,
-4.226162, -3.55954, 2, 1, 1.5, 0.5, 0.5,
-4.226162, -3.55954, 2, 0, 1.5, 0.5, 0.5,
-4.226162, -3.55954, 4, 0, -0.5, 0.5, 0.5,
-4.226162, -3.55954, 4, 1, -0.5, 0.5, 0.5,
-4.226162, -3.55954, 4, 1, 1.5, 0.5, 0.5,
-4.226162, -3.55954, 4, 0, 1.5, 0.5, 0.5
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
-3.642273, -3.060261, -5.70415,
-3.642273, 3.596792, -5.70415,
-3.642273, -3.060261, 5.125622,
-3.642273, 3.596792, 5.125622,
-3.642273, -3.060261, -5.70415,
-3.642273, -3.060261, 5.125622,
-3.642273, 3.596792, -5.70415,
-3.642273, 3.596792, 5.125622,
-3.642273, -3.060261, -5.70415,
4.142911, -3.060261, -5.70415,
-3.642273, -3.060261, 5.125622,
4.142911, -3.060261, 5.125622,
-3.642273, 3.596792, -5.70415,
4.142911, 3.596792, -5.70415,
-3.642273, 3.596792, 5.125622,
4.142911, 3.596792, 5.125622,
4.142911, -3.060261, -5.70415,
4.142911, 3.596792, -5.70415,
4.142911, -3.060261, 5.125622,
4.142911, 3.596792, 5.125622,
4.142911, -3.060261, -5.70415,
4.142911, -3.060261, 5.125622,
4.142911, 3.596792, -5.70415,
4.142911, 3.596792, 5.125622
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
var radius = 7.959883;
var distance = 35.41442;
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
mvMatrix.translate( -0.2503189, -0.268266, 0.289264 );
mvMatrix.scale( 1.105482, 1.292822, 0.7946965 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.41442);
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
norea<-read.table("norea.xyz")
```

```
## Error in read.table("norea.xyz"): no lines available in input
```

```r
x<-norea$V2
```

```
## Error in eval(expr, envir, enclos): object 'norea' not found
```

```r
y<-norea$V3
```

```
## Error in eval(expr, envir, enclos): object 'norea' not found
```

```r
z<-norea$V4
```

```
## Error in eval(expr, envir, enclos): object 'norea' not found
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
-3.528897, -0.7992653, -1.802249, 0, 0, 1, 1, 1,
-2.830282, 0.3966302, -1.396622, 1, 0, 0, 1, 1,
-2.820476, 1.057959, -1.19062, 1, 0, 0, 1, 1,
-2.690334, 0.1449732, -0.2973771, 1, 0, 0, 1, 1,
-2.515879, -0.3996544, -1.79763, 1, 0, 0, 1, 1,
-2.461908, -2.633031, -2.112554, 1, 0, 0, 1, 1,
-2.427815, 1.295635, -1.359505, 0, 0, 0, 1, 1,
-2.394905, -2.065768, -2.349998, 0, 0, 0, 1, 1,
-2.323261, -0.4629991, -1.772777, 0, 0, 0, 1, 1,
-2.287221, -1.280441, -0.1859637, 0, 0, 0, 1, 1,
-2.228883, -0.4464674, -0.9342694, 0, 0, 0, 1, 1,
-2.224976, -0.6704181, -1.987504, 0, 0, 0, 1, 1,
-2.167828, 0.2804744, -0.8573747, 0, 0, 0, 1, 1,
-2.157587, -0.236105, -1.32615, 1, 1, 1, 1, 1,
-2.157224, 1.448771, -3.008785, 1, 1, 1, 1, 1,
-2.14801, -1.759668, -3.886457, 1, 1, 1, 1, 1,
-2.128507, -2.18677, -2.189283, 1, 1, 1, 1, 1,
-2.103313, 0.8187122, -1.068771, 1, 1, 1, 1, 1,
-2.095794, -0.368986, -3.127449, 1, 1, 1, 1, 1,
-2.084815, 0.3831055, -0.4066638, 1, 1, 1, 1, 1,
-2.074555, 0.239704, -1.442691, 1, 1, 1, 1, 1,
-2.026065, 1.697727, -1.116994, 1, 1, 1, 1, 1,
-2.015416, 0.2012822, -2.283619, 1, 1, 1, 1, 1,
-2.012244, 0.07938115, -0.3557861, 1, 1, 1, 1, 1,
-2.005292, -0.3192844, -0.987491, 1, 1, 1, 1, 1,
-1.984403, 2.135733, -0.401879, 1, 1, 1, 1, 1,
-1.95917, 0.09854358, 0.4875386, 1, 1, 1, 1, 1,
-1.94872, -1.144098, -3.347033, 1, 1, 1, 1, 1,
-1.920465, 1.020298, -0.1671998, 0, 0, 1, 1, 1,
-1.913078, 1.261229, -0.1866605, 1, 0, 0, 1, 1,
-1.878737, -1.587182, -1.993257, 1, 0, 0, 1, 1,
-1.874331, 1.272782, -1.70185, 1, 0, 0, 1, 1,
-1.85655, 0.3217799, -2.31456, 1, 0, 0, 1, 1,
-1.855036, 0.3476986, -2.046973, 1, 0, 0, 1, 1,
-1.84192, 0.07955393, -2.114875, 0, 0, 0, 1, 1,
-1.833855, 1.263492, 0.8743405, 0, 0, 0, 1, 1,
-1.830896, 0.8351181, -2.207891, 0, 0, 0, 1, 1,
-1.806342, 0.4403127, -1.603067, 0, 0, 0, 1, 1,
-1.768552, -0.9501472, -1.667532, 0, 0, 0, 1, 1,
-1.766078, 0.1356177, -1.671349, 0, 0, 0, 1, 1,
-1.76367, 0.6277782, -1.305916, 0, 0, 0, 1, 1,
-1.755421, -0.3079762, -1.468783, 1, 1, 1, 1, 1,
-1.744074, 0.347277, -0.9041033, 1, 1, 1, 1, 1,
-1.743015, -1.624334, -2.066957, 1, 1, 1, 1, 1,
-1.734782, 0.5246441, -1.242197, 1, 1, 1, 1, 1,
-1.708616, 0.5047405, -1.43676, 1, 1, 1, 1, 1,
-1.704468, 0.09925508, -1.248096, 1, 1, 1, 1, 1,
-1.703257, -0.6871843, -0.5305117, 1, 1, 1, 1, 1,
-1.691109, 0.03307465, 0.05557697, 1, 1, 1, 1, 1,
-1.688099, 0.5424976, -1.2995, 1, 1, 1, 1, 1,
-1.681601, 0.06384969, -1.876303, 1, 1, 1, 1, 1,
-1.678605, 1.272205, -0.7942005, 1, 1, 1, 1, 1,
-1.671757, 2.261374, -0.2668412, 1, 1, 1, 1, 1,
-1.658075, -0.5293872, -0.9002239, 1, 1, 1, 1, 1,
-1.637529, -1.525461, -2.340299, 1, 1, 1, 1, 1,
-1.637434, -1.295938, -2.317412, 1, 1, 1, 1, 1,
-1.635134, -2.104035, -1.751004, 0, 0, 1, 1, 1,
-1.624363, -2.963313, -3.734802, 1, 0, 0, 1, 1,
-1.620273, 0.1844112, -3.431302, 1, 0, 0, 1, 1,
-1.609806, -0.3738548, -0.2663548, 1, 0, 0, 1, 1,
-1.60193, 1.381229, -1.726489, 1, 0, 0, 1, 1,
-1.593612, -0.4309172, -3.131104, 1, 0, 0, 1, 1,
-1.578007, -1.398394, -1.328322, 0, 0, 0, 1, 1,
-1.560662, 0.2474995, -0.818705, 0, 0, 0, 1, 1,
-1.51756, -1.789335, -1.553728, 0, 0, 0, 1, 1,
-1.502421, 1.930694, -2.00902, 0, 0, 0, 1, 1,
-1.501159, 0.5722175, -1.282468, 0, 0, 0, 1, 1,
-1.500687, -2.294592, -1.563581, 0, 0, 0, 1, 1,
-1.479934, -0.05945324, -2.401039, 0, 0, 0, 1, 1,
-1.460826, -0.1471244, -0.7674754, 1, 1, 1, 1, 1,
-1.45452, 0.3619975, -3.272244, 1, 1, 1, 1, 1,
-1.447847, -0.95859, -1.610942, 1, 1, 1, 1, 1,
-1.44639, -1.168071, -1.526469, 1, 1, 1, 1, 1,
-1.444299, -0.8392782, -1.618349, 1, 1, 1, 1, 1,
-1.441351, -0.3087348, -0.6806376, 1, 1, 1, 1, 1,
-1.438433, -1.086913, -5.37895, 1, 1, 1, 1, 1,
-1.432276, -1.995738, -2.576258, 1, 1, 1, 1, 1,
-1.428408, -0.9304326, -4.238573, 1, 1, 1, 1, 1,
-1.428131, 0.02167863, -1.807665, 1, 1, 1, 1, 1,
-1.422294, 0.8421513, 0.0489283, 1, 1, 1, 1, 1,
-1.421998, 0.1222887, -0.07013914, 1, 1, 1, 1, 1,
-1.419091, 0.5244062, -1.025442, 1, 1, 1, 1, 1,
-1.416398, -1.522509, -2.750921, 1, 1, 1, 1, 1,
-1.416041, 0.2047008, -2.018672, 1, 1, 1, 1, 1,
-1.404213, -0.3394181, -2.111763, 0, 0, 1, 1, 1,
-1.403927, 1.675521, 0.5776476, 1, 0, 0, 1, 1,
-1.401295, -0.1992204, -1.783185, 1, 0, 0, 1, 1,
-1.384378, 0.3263366, -2.568148, 1, 0, 0, 1, 1,
-1.380543, -1.058022, -2.653927, 1, 0, 0, 1, 1,
-1.377416, 0.3919666, -1.114395, 1, 0, 0, 1, 1,
-1.353279, -0.5577426, -2.196644, 0, 0, 0, 1, 1,
-1.353114, 0.01757729, -2.754253, 0, 0, 0, 1, 1,
-1.351837, 0.8418117, -1.333007, 0, 0, 0, 1, 1,
-1.344273, -0.2195688, -2.907924, 0, 0, 0, 1, 1,
-1.329589, -0.2205463, -1.839594, 0, 0, 0, 1, 1,
-1.308627, 0.1155697, -0.9124599, 0, 0, 0, 1, 1,
-1.303724, 1.26608, -1.733511, 0, 0, 0, 1, 1,
-1.302486, -1.2465, -0.8558708, 1, 1, 1, 1, 1,
-1.299761, -0.2378889, -2.170022, 1, 1, 1, 1, 1,
-1.295254, 0.3884483, 0.3722121, 1, 1, 1, 1, 1,
-1.289643, 0.7874836, -1.269135, 1, 1, 1, 1, 1,
-1.289225, -0.7079675, -2.88761, 1, 1, 1, 1, 1,
-1.28641, -0.5498305, -1.683745, 1, 1, 1, 1, 1,
-1.279257, 0.293794, -1.940963, 1, 1, 1, 1, 1,
-1.276693, -1.514801, -2.337657, 1, 1, 1, 1, 1,
-1.261423, 0.874524, -1.401907, 1, 1, 1, 1, 1,
-1.248478, 1.403162, 0.5703462, 1, 1, 1, 1, 1,
-1.24404, -0.181511, -3.464442, 1, 1, 1, 1, 1,
-1.243572, 0.4047248, -2.560315, 1, 1, 1, 1, 1,
-1.24175, 2.052018, -0.2418016, 1, 1, 1, 1, 1,
-1.241736, 0.4272445, -1.690212, 1, 1, 1, 1, 1,
-1.240725, -1.358728, -1.754152, 1, 1, 1, 1, 1,
-1.216936, -0.933221, -1.168002, 0, 0, 1, 1, 1,
-1.210311, -1.121721, -3.203187, 1, 0, 0, 1, 1,
-1.203388, -0.8258644, -2.04491, 1, 0, 0, 1, 1,
-1.199738, 1.457147, 0.4388572, 1, 0, 0, 1, 1,
-1.19737, -0.1479933, -0.565784, 1, 0, 0, 1, 1,
-1.196985, -0.1072423, 1.668926, 1, 0, 0, 1, 1,
-1.189225, -0.9361051, -2.14099, 0, 0, 0, 1, 1,
-1.177541, -1.095017, -2.122354, 0, 0, 0, 1, 1,
-1.176316, 1.875371, 0.4050606, 0, 0, 0, 1, 1,
-1.175396, 0.8131603, 0.4563025, 0, 0, 0, 1, 1,
-1.173033, 1.359935, -1.227106, 0, 0, 0, 1, 1,
-1.172293, -0.08842182, -0.4720744, 0, 0, 0, 1, 1,
-1.172171, -0.3528665, -2.362692, 0, 0, 0, 1, 1,
-1.166806, 0.6424485, -1.653664, 1, 1, 1, 1, 1,
-1.163854, -0.2805962, -1.591718, 1, 1, 1, 1, 1,
-1.162209, 0.479413, -1.364701, 1, 1, 1, 1, 1,
-1.145639, 0.4591185, -2.574095, 1, 1, 1, 1, 1,
-1.140743, 1.189611, 0.3786702, 1, 1, 1, 1, 1,
-1.135164, 0.1157289, 1.288557, 1, 1, 1, 1, 1,
-1.134381, -0.8625498, -2.857773, 1, 1, 1, 1, 1,
-1.133169, 1.107145, -1.101682, 1, 1, 1, 1, 1,
-1.130086, 0.1523449, -0.3737928, 1, 1, 1, 1, 1,
-1.129605, -0.8347903, -2.983149, 1, 1, 1, 1, 1,
-1.127801, 0.416766, -0.3077807, 1, 1, 1, 1, 1,
-1.119002, -0.8184685, -2.892693, 1, 1, 1, 1, 1,
-1.11332, 0.8309541, -0.7298048, 1, 1, 1, 1, 1,
-1.11235, -0.5237493, -2.368527, 1, 1, 1, 1, 1,
-1.111952, 0.2961412, -1.033812, 1, 1, 1, 1, 1,
-1.110564, -0.4335457, -2.563396, 0, 0, 1, 1, 1,
-1.109207, 0.8708428, -1.84712, 1, 0, 0, 1, 1,
-1.106081, 1.333312, 0.3314831, 1, 0, 0, 1, 1,
-1.102558, 1.469012, -1.18611, 1, 0, 0, 1, 1,
-1.098795, -0.08008277, -1.868555, 1, 0, 0, 1, 1,
-1.097957, -1.273121, -2.204707, 1, 0, 0, 1, 1,
-1.09612, 0.5803066, -0.2815545, 0, 0, 0, 1, 1,
-1.096022, 1.75525, 0.6847398, 0, 0, 0, 1, 1,
-1.09477, -0.2731756, -2.076977, 0, 0, 0, 1, 1,
-1.083144, 2.399477, -0.01907489, 0, 0, 0, 1, 1,
-1.078019, 1.726258, -0.1445056, 0, 0, 0, 1, 1,
-1.075946, -0.7604902, -1.236223, 0, 0, 0, 1, 1,
-1.064592, 1.812531, -0.3088031, 0, 0, 0, 1, 1,
-1.061668, -1.30611, -3.762757, 1, 1, 1, 1, 1,
-1.058918, 1.003267, -1.992713, 1, 1, 1, 1, 1,
-1.057231, 0.2873609, -1.720446, 1, 1, 1, 1, 1,
-1.055101, 1.640061, -1.810153, 1, 1, 1, 1, 1,
-1.054871, -0.4702069, -3.058082, 1, 1, 1, 1, 1,
-1.054818, 0.1675457, -0.5700747, 1, 1, 1, 1, 1,
-1.054791, 0.6468149, -2.556064, 1, 1, 1, 1, 1,
-1.053308, 0.1009908, -0.7119054, 1, 1, 1, 1, 1,
-1.049484, 0.5353562, -0.9330274, 1, 1, 1, 1, 1,
-1.042907, -1.959616, -3.734178, 1, 1, 1, 1, 1,
-1.038343, 0.8711061, -0.3662295, 1, 1, 1, 1, 1,
-1.030874, 0.1529715, -1.181642, 1, 1, 1, 1, 1,
-1.027956, 0.03414481, 0.8954237, 1, 1, 1, 1, 1,
-1.01987, -1.535138, -3.681552, 1, 1, 1, 1, 1,
-1.018005, -0.9980121, -2.913393, 1, 1, 1, 1, 1,
-1.005957, -0.2927662, -1.645976, 0, 0, 1, 1, 1,
-1.002427, -0.4349238, -2.409867, 1, 0, 0, 1, 1,
-1.002271, -0.8365493, -3.028271, 1, 0, 0, 1, 1,
-0.996369, 0.6546286, -0.9774071, 1, 0, 0, 1, 1,
-0.9914939, -0.5518018, -0.7970375, 1, 0, 0, 1, 1,
-0.990685, 0.7005935, -1.734101, 1, 0, 0, 1, 1,
-0.9882039, 0.1376318, -0.4651744, 0, 0, 0, 1, 1,
-0.983043, 1.123858, 0.07130469, 0, 0, 0, 1, 1,
-0.9726546, 0.09826521, -2.09312, 0, 0, 0, 1, 1,
-0.9691249, -0.2387774, -2.189345, 0, 0, 0, 1, 1,
-0.9683963, 0.1271226, -1.454207, 0, 0, 0, 1, 1,
-0.9663498, -0.2897134, -2.449, 0, 0, 0, 1, 1,
-0.9636986, -1.32739, -2.864313, 0, 0, 0, 1, 1,
-0.9607714, -0.4280226, -0.2277124, 1, 1, 1, 1, 1,
-0.9596841, -1.493991, -2.50999, 1, 1, 1, 1, 1,
-0.9575379, -0.9148522, -1.342239, 1, 1, 1, 1, 1,
-0.9554904, -1.349915, -1.621495, 1, 1, 1, 1, 1,
-0.9528409, 1.66381, 0.6248313, 1, 1, 1, 1, 1,
-0.9522272, -0.1388011, -2.697825, 1, 1, 1, 1, 1,
-0.9511899, 0.2862108, -2.547638, 1, 1, 1, 1, 1,
-0.9463368, -0.74985, -2.289688, 1, 1, 1, 1, 1,
-0.9458357, 0.530223, -1.203573, 1, 1, 1, 1, 1,
-0.9448007, -0.4878881, 0.02947571, 1, 1, 1, 1, 1,
-0.9447736, 0.4721535, -1.357414, 1, 1, 1, 1, 1,
-0.9442903, 0.262995, -0.7169657, 1, 1, 1, 1, 1,
-0.9440502, 0.9306305, -1.241602, 1, 1, 1, 1, 1,
-0.9302413, -0.3207417, -0.3209341, 1, 1, 1, 1, 1,
-0.9103448, 0.5539268, -1.94821, 1, 1, 1, 1, 1,
-0.8968771, -0.6702869, -2.979623, 0, 0, 1, 1, 1,
-0.8950032, -0.3810587, -1.515361, 1, 0, 0, 1, 1,
-0.8949939, 1.375099, 0.08315104, 1, 0, 0, 1, 1,
-0.8898865, 0.3108091, 0.3146833, 1, 0, 0, 1, 1,
-0.8879855, -0.5417126, -2.14922, 1, 0, 0, 1, 1,
-0.8848665, -0.5058092, -1.741596, 1, 0, 0, 1, 1,
-0.8776708, 0.02628765, -1.58518, 0, 0, 0, 1, 1,
-0.8732376, -0.4522799, -2.884066, 0, 0, 0, 1, 1,
-0.8696738, 0.4734412, -1.80458, 0, 0, 0, 1, 1,
-0.8648158, -1.545964, -1.69596, 0, 0, 0, 1, 1,
-0.8577572, -0.4819703, -0.946826, 0, 0, 0, 1, 1,
-0.847728, 0.06105066, -0.7586996, 0, 0, 0, 1, 1,
-0.8415252, -0.7100435, -2.801171, 0, 0, 0, 1, 1,
-0.8406206, 2.180708, -0.9774134, 1, 1, 1, 1, 1,
-0.8388344, -0.2391943, -1.018745, 1, 1, 1, 1, 1,
-0.8387859, -1.097926, -2.254604, 1, 1, 1, 1, 1,
-0.8384828, -0.1082761, -1.386396, 1, 1, 1, 1, 1,
-0.8257201, 0.5418376, 0.006838184, 1, 1, 1, 1, 1,
-0.8191205, 0.783218, -0.9702483, 1, 1, 1, 1, 1,
-0.819049, 1.272384, -0.2962429, 1, 1, 1, 1, 1,
-0.8028841, -1.305791, -2.103987, 1, 1, 1, 1, 1,
-0.8012308, 0.2298933, -2.478112, 1, 1, 1, 1, 1,
-0.8000824, 1.054365, 0.7574645, 1, 1, 1, 1, 1,
-0.7978309, -0.2264243, -1.220719, 1, 1, 1, 1, 1,
-0.7971514, 1.061751, -0.9831448, 1, 1, 1, 1, 1,
-0.7947014, -1.104227, -4.125957, 1, 1, 1, 1, 1,
-0.7916988, -0.7162002, -2.131418, 1, 1, 1, 1, 1,
-0.7779778, 0.1779317, -2.875685, 1, 1, 1, 1, 1,
-0.7773777, -0.522818, -0.7963365, 0, 0, 1, 1, 1,
-0.7767985, 0.02733487, -1.434684, 1, 0, 0, 1, 1,
-0.7707711, -0.8283501, -3.75984, 1, 0, 0, 1, 1,
-0.7682496, 0.3408028, -0.8365688, 1, 0, 0, 1, 1,
-0.7665571, 0.08165109, -3.48936, 1, 0, 0, 1, 1,
-0.7652401, -1.231459, -2.970722, 1, 0, 0, 1, 1,
-0.7641078, 0.8637968, -1.869166, 0, 0, 0, 1, 1,
-0.7640461, -0.8383874, -2.549321, 0, 0, 0, 1, 1,
-0.7638208, 0.5642918, -1.342456, 0, 0, 0, 1, 1,
-0.7597646, -1.542665, -2.29986, 0, 0, 0, 1, 1,
-0.7566769, -0.3805678, -0.5994765, 0, 0, 0, 1, 1,
-0.7542499, -0.975003, -3.336554, 0, 0, 0, 1, 1,
-0.7534905, 0.07701024, -0.4012667, 0, 0, 0, 1, 1,
-0.750317, 1.296913, -2.094634, 1, 1, 1, 1, 1,
-0.7428358, 0.4584884, -0.545857, 1, 1, 1, 1, 1,
-0.7328681, -0.1143633, -0.6420651, 1, 1, 1, 1, 1,
-0.7192922, -0.08020552, -0.01441, 1, 1, 1, 1, 1,
-0.7146194, -1.251777, -2.581866, 1, 1, 1, 1, 1,
-0.7129682, 0.4424905, -2.639279, 1, 1, 1, 1, 1,
-0.7032754, 0.4119741, -1.467413, 1, 1, 1, 1, 1,
-0.6994955, -0.0344855, 0.3939435, 1, 1, 1, 1, 1,
-0.697229, -0.3746034, -1.289025, 1, 1, 1, 1, 1,
-0.6918258, 0.2196201, -1.022423, 1, 1, 1, 1, 1,
-0.6811017, -1.731642, -3.568322, 1, 1, 1, 1, 1,
-0.6797085, -0.6361299, -1.897091, 1, 1, 1, 1, 1,
-0.6747634, -0.07532668, -2.495412, 1, 1, 1, 1, 1,
-0.66502, 0.4299302, -1.077031, 1, 1, 1, 1, 1,
-0.6632564, 0.2992122, -2.563928, 1, 1, 1, 1, 1,
-0.6606081, 0.8897529, -0.6119873, 0, 0, 1, 1, 1,
-0.6591972, -0.7684348, -2.40079, 1, 0, 0, 1, 1,
-0.6579961, -1.507647, -3.27561, 1, 0, 0, 1, 1,
-0.6573488, -1.714818, -3.582667, 1, 0, 0, 1, 1,
-0.6554657, 0.5369015, -2.57201, 1, 0, 0, 1, 1,
-0.6554504, 1.095902, -0.004052421, 1, 0, 0, 1, 1,
-0.6542046, 0.1248189, -0.9137537, 0, 0, 0, 1, 1,
-0.6496453, -0.7112711, -2.384923, 0, 0, 0, 1, 1,
-0.6495289, 1.744761, -0.4689045, 0, 0, 0, 1, 1,
-0.6483492, 0.3116577, -3.717602, 0, 0, 0, 1, 1,
-0.6449692, -1.011878, -1.710205, 0, 0, 0, 1, 1,
-0.6447085, -0.1609216, -2.587881, 0, 0, 0, 1, 1,
-0.6439727, -1.106339, -1.753261, 0, 0, 0, 1, 1,
-0.6351246, -0.4606095, -3.300056, 1, 1, 1, 1, 1,
-0.6263968, -1.093431, -1.809832, 1, 1, 1, 1, 1,
-0.6222264, 0.7061334, 0.545784, 1, 1, 1, 1, 1,
-0.6168106, -0.2756601, -1.961748, 1, 1, 1, 1, 1,
-0.6094683, -0.9808514, -1.801228, 1, 1, 1, 1, 1,
-0.6072806, -0.4304898, -3.240353, 1, 1, 1, 1, 1,
-0.6051489, 1.229224, 0.6634541, 1, 1, 1, 1, 1,
-0.6017383, -0.6887664, -1.493505, 1, 1, 1, 1, 1,
-0.6014886, 0.4932674, 0.6470943, 1, 1, 1, 1, 1,
-0.5976892, 1.637833, 0.7298632, 1, 1, 1, 1, 1,
-0.5947959, -0.02593107, -1.150664, 1, 1, 1, 1, 1,
-0.5937332, -1.541431, -3.260689, 1, 1, 1, 1, 1,
-0.5929976, 0.7669768, -0.2989852, 1, 1, 1, 1, 1,
-0.5893394, -1.242289, -3.362665, 1, 1, 1, 1, 1,
-0.5838774, -0.03246012, -0.7110486, 1, 1, 1, 1, 1,
-0.58252, 0.00189344, -1.360604, 0, 0, 1, 1, 1,
-0.5791496, -1.79261, -2.043565, 1, 0, 0, 1, 1,
-0.5784157, -0.2633716, -2.436928, 1, 0, 0, 1, 1,
-0.5760762, 1.149105, 1.074715, 1, 0, 0, 1, 1,
-0.5738255, -0.8832483, -2.286344, 1, 0, 0, 1, 1,
-0.5725587, 0.8102857, -1.052597, 1, 0, 0, 1, 1,
-0.5683869, 0.2070504, -0.3485873, 0, 0, 0, 1, 1,
-0.5656457, -0.04273625, -1.709651, 0, 0, 0, 1, 1,
-0.561968, 0.6861922, -0.05674027, 0, 0, 0, 1, 1,
-0.5617933, -0.8979104, -1.523364, 0, 0, 0, 1, 1,
-0.5611798, 0.6121147, 0.05838456, 0, 0, 0, 1, 1,
-0.5591945, 0.6924636, -0.2742688, 0, 0, 0, 1, 1,
-0.5566325, -0.4776274, -0.7693883, 0, 0, 0, 1, 1,
-0.5560414, -1.957344, -1.805084, 1, 1, 1, 1, 1,
-0.5534247, -0.5992975, -2.510715, 1, 1, 1, 1, 1,
-0.5443379, -1.905756, -4.116179, 1, 1, 1, 1, 1,
-0.5439353, -0.2044111, -1.968557, 1, 1, 1, 1, 1,
-0.5430787, 0.8694679, -0.8623751, 1, 1, 1, 1, 1,
-0.5421662, 0.08196379, -1.239354, 1, 1, 1, 1, 1,
-0.5405053, -0.7761471, -1.29751, 1, 1, 1, 1, 1,
-0.5397227, 0.349274, -1.827881, 1, 1, 1, 1, 1,
-0.5386226, 0.3338527, -1.611803, 1, 1, 1, 1, 1,
-0.5368591, 1.01142, -0.5531976, 1, 1, 1, 1, 1,
-0.5347543, 0.6721084, 1.708125, 1, 1, 1, 1, 1,
-0.5309286, 1.09135, -0.7389069, 1, 1, 1, 1, 1,
-0.5291991, 0.5951721, -0.4036992, 1, 1, 1, 1, 1,
-0.5289534, 0.2619436, -0.9772418, 1, 1, 1, 1, 1,
-0.5218421, 0.3344425, -1.399739, 1, 1, 1, 1, 1,
-0.5145023, 0.6171476, -1.87929, 0, 0, 1, 1, 1,
-0.5136225, 0.6749481, -2.123362, 1, 0, 0, 1, 1,
-0.5124068, -1.388633, -3.378881, 1, 0, 0, 1, 1,
-0.5092288, -0.9534644, -2.524225, 1, 0, 0, 1, 1,
-0.5058114, 0.9542632, 1.317575, 1, 0, 0, 1, 1,
-0.5054238, -0.288604, -2.878402, 1, 0, 0, 1, 1,
-0.5036683, -1.070086, -1.328247, 0, 0, 0, 1, 1,
-0.499565, 0.9073716, -1.386507, 0, 0, 0, 1, 1,
-0.4985228, 1.443824, -0.7151204, 0, 0, 0, 1, 1,
-0.4965982, 2.228336, 0.4105945, 0, 0, 0, 1, 1,
-0.4879605, -0.381003, -2.850765, 0, 0, 0, 1, 1,
-0.4858823, -0.4915796, -3.178574, 0, 0, 0, 1, 1,
-0.4857637, -0.4899123, -3.47185, 0, 0, 0, 1, 1,
-0.4834971, -1.138252, -3.077301, 1, 1, 1, 1, 1,
-0.48222, 0.2414017, -2.439204, 1, 1, 1, 1, 1,
-0.4820009, 1.008476, -0.9114931, 1, 1, 1, 1, 1,
-0.4741936, -0.6539508, -2.295883, 1, 1, 1, 1, 1,
-0.4652973, 0.7916669, -0.9047753, 1, 1, 1, 1, 1,
-0.4638622, -0.3183363, -2.573156, 1, 1, 1, 1, 1,
-0.4616859, 0.9100493, 0.578149, 1, 1, 1, 1, 1,
-0.4579667, -0.2588359, -1.376767, 1, 1, 1, 1, 1,
-0.4574392, 0.149894, -1.325118, 1, 1, 1, 1, 1,
-0.4570834, 3.354778, -0.3461081, 1, 1, 1, 1, 1,
-0.4557406, 0.6700616, 0.1943406, 1, 1, 1, 1, 1,
-0.44951, -1.71794, -2.169429, 1, 1, 1, 1, 1,
-0.4453748, 0.3267334, -1.49183, 1, 1, 1, 1, 1,
-0.4340665, -1.399378, -2.593069, 1, 1, 1, 1, 1,
-0.4338382, 1.582634, -0.2589738, 1, 1, 1, 1, 1,
-0.4323887, -0.234755, -3.194148, 0, 0, 1, 1, 1,
-0.4289086, -1.291416, -1.541133, 1, 0, 0, 1, 1,
-0.4266192, 0.2847239, -0.9560761, 1, 0, 0, 1, 1,
-0.4233707, -1.475481, -3.403087, 1, 0, 0, 1, 1,
-0.4230403, -0.353303, -3.962627, 1, 0, 0, 1, 1,
-0.422112, 0.3835479, 0.5030411, 1, 0, 0, 1, 1,
-0.4195955, -0.2420219, -2.919766, 0, 0, 0, 1, 1,
-0.4173026, 0.5032583, -0.7501032, 0, 0, 0, 1, 1,
-0.4165728, 0.1409232, -0.9906445, 0, 0, 0, 1, 1,
-0.4156007, 1.568243, 2.024401, 0, 0, 0, 1, 1,
-0.4139538, -1.189413, -3.284828, 0, 0, 0, 1, 1,
-0.4122534, 1.672084, -1.508151, 0, 0, 0, 1, 1,
-0.4100053, 0.9038702, -1.416538, 0, 0, 0, 1, 1,
-0.4092153, -0.06488341, -1.95203, 1, 1, 1, 1, 1,
-0.4080409, 1.420879, 0.4120254, 1, 1, 1, 1, 1,
-0.403068, 0.243064, 0.5982215, 1, 1, 1, 1, 1,
-0.393665, 1.01329, -0.392791, 1, 1, 1, 1, 1,
-0.392698, 0.3782034, 0.3633345, 1, 1, 1, 1, 1,
-0.3923978, 0.7344496, 0.3968245, 1, 1, 1, 1, 1,
-0.3861482, -0.5570539, -3.385372, 1, 1, 1, 1, 1,
-0.3835938, -0.5742018, -3.139678, 1, 1, 1, 1, 1,
-0.3807953, 0.08878145, -0.4282235, 1, 1, 1, 1, 1,
-0.38067, -0.8657344, -1.393858, 1, 1, 1, 1, 1,
-0.3777223, -0.3494976, -3.089572, 1, 1, 1, 1, 1,
-0.3754007, 1.277692, -1.769858, 1, 1, 1, 1, 1,
-0.3748075, -0.1234888, -1.735835, 1, 1, 1, 1, 1,
-0.3731045, -1.569844, -1.853444, 1, 1, 1, 1, 1,
-0.3672065, 2.679159, -1.407001, 1, 1, 1, 1, 1,
-0.3656767, 0.2019071, -2.063591, 0, 0, 1, 1, 1,
-0.3639012, 0.8424573, -0.7729888, 1, 0, 0, 1, 1,
-0.3613338, -0.634185, -1.856719, 1, 0, 0, 1, 1,
-0.3610946, -0.4336474, -4.550561, 1, 0, 0, 1, 1,
-0.3545462, 2.477875, -2.635718, 1, 0, 0, 1, 1,
-0.3535322, -0.3308265, -2.649066, 1, 0, 0, 1, 1,
-0.349941, -1.845165, -3.792418, 0, 0, 0, 1, 1,
-0.3465846, -0.2242594, -3.065734, 0, 0, 0, 1, 1,
-0.3464256, 0.1228836, -1.84449, 0, 0, 0, 1, 1,
-0.3455971, -0.4647919, -2.153007, 0, 0, 0, 1, 1,
-0.3386872, 0.9573517, 1.180291, 0, 0, 0, 1, 1,
-0.3355542, 1.336237, 0.9413193, 0, 0, 0, 1, 1,
-0.3258601, 0.9517198, 0.1695981, 0, 0, 0, 1, 1,
-0.3253174, 0.6054258, -1.129774, 1, 1, 1, 1, 1,
-0.3246676, 0.3449629, -0.5912991, 1, 1, 1, 1, 1,
-0.3238503, -0.8199775, -3.307324, 1, 1, 1, 1, 1,
-0.3157215, 0.6265478, 0.2532325, 1, 1, 1, 1, 1,
-0.3126587, 0.08035406, -1.36337, 1, 1, 1, 1, 1,
-0.3111864, 0.6082408, -1.687158, 1, 1, 1, 1, 1,
-0.3097646, 0.9000348, 0.4622931, 1, 1, 1, 1, 1,
-0.3096046, 1.118839, 0.1470224, 1, 1, 1, 1, 1,
-0.3073032, -1.711074, -2.192345, 1, 1, 1, 1, 1,
-0.3055857, 0.6420101, -0.5355051, 1, 1, 1, 1, 1,
-0.3031285, 0.3704409, -0.1346352, 1, 1, 1, 1, 1,
-0.3025218, -2.692155, -1.523274, 1, 1, 1, 1, 1,
-0.3005897, -0.1750696, -1.939049, 1, 1, 1, 1, 1,
-0.2972688, 0.2172513, -1.063987, 1, 1, 1, 1, 1,
-0.2936729, 1.828179, 1.773754, 1, 1, 1, 1, 1,
-0.2935144, 0.8221114, -1.629766, 0, 0, 1, 1, 1,
-0.2890104, -0.9908857, -3.572739, 1, 0, 0, 1, 1,
-0.2885829, 0.6275833, -0.4892346, 1, 0, 0, 1, 1,
-0.2882575, 1.61589, 1.173674, 1, 0, 0, 1, 1,
-0.28413, 0.615609, -0.9325898, 1, 0, 0, 1, 1,
-0.2810261, 1.833054, -0.1403845, 1, 0, 0, 1, 1,
-0.2796737, 0.3157853, -1.961221, 0, 0, 0, 1, 1,
-0.2786628, 0.5493822, 0.2371068, 0, 0, 0, 1, 1,
-0.2734868, -0.4826157, -1.735023, 0, 0, 0, 1, 1,
-0.2685041, 0.6251165, 0.3144141, 0, 0, 0, 1, 1,
-0.2627769, 0.094069, -2.904575, 0, 0, 0, 1, 1,
-0.2621202, 0.3586873, 1.511021, 0, 0, 0, 1, 1,
-0.2590886, -0.9049909, -3.48322, 0, 0, 0, 1, 1,
-0.2557847, -0.5607499, -1.470251, 1, 1, 1, 1, 1,
-0.2557589, -2.430276, -2.807997, 1, 1, 1, 1, 1,
-0.2504534, -1.295276, -2.996989, 1, 1, 1, 1, 1,
-0.2501022, -1.90492, -3.671991, 1, 1, 1, 1, 1,
-0.2499669, -1.067119, -2.76008, 1, 1, 1, 1, 1,
-0.247981, -0.03581793, -1.60493, 1, 1, 1, 1, 1,
-0.2477907, -0.1065521, -4.041526, 1, 1, 1, 1, 1,
-0.2462319, 0.4470932, -0.8272702, 1, 1, 1, 1, 1,
-0.2395289, -0.5270004, -1.143173, 1, 1, 1, 1, 1,
-0.2386293, 1.226401, 1.399331, 1, 1, 1, 1, 1,
-0.2370377, 1.429201, -0.7434629, 1, 1, 1, 1, 1,
-0.2354946, 0.4200052, -1.709785, 1, 1, 1, 1, 1,
-0.2307563, -0.4555408, -2.304942, 1, 1, 1, 1, 1,
-0.2287007, 0.2525583, 0.134343, 1, 1, 1, 1, 1,
-0.2282991, 1.213067, 1.279902, 1, 1, 1, 1, 1,
-0.221495, -1.457116, -3.538094, 0, 0, 1, 1, 1,
-0.2212461, 0.5099367, -0.4835388, 1, 0, 0, 1, 1,
-0.2174542, -0.6869133, -2.016248, 1, 0, 0, 1, 1,
-0.2163119, -0.240425, -0.1052023, 1, 0, 0, 1, 1,
-0.2159441, 1.529851, -0.2915175, 1, 0, 0, 1, 1,
-0.2158719, 1.308961, -1.333183, 1, 0, 0, 1, 1,
-0.2153907, 0.6754052, -0.07677795, 0, 0, 0, 1, 1,
-0.2093645, -1.648796, -1.906335, 0, 0, 0, 1, 1,
-0.2078063, 0.4231003, -1.051292, 0, 0, 0, 1, 1,
-0.2059269, 1.611632, -0.7222126, 0, 0, 0, 1, 1,
-0.1993084, 0.1535304, -1.182447, 0, 0, 0, 1, 1,
-0.1990708, -0.3959034, -5.546434, 0, 0, 0, 1, 1,
-0.198857, 0.6612861, 0.3452053, 0, 0, 0, 1, 1,
-0.1983199, -0.818789, -2.755987, 1, 1, 1, 1, 1,
-0.1973156, -0.547978, -3.495534, 1, 1, 1, 1, 1,
-0.1971878, -0.9456689, -2.848631, 1, 1, 1, 1, 1,
-0.1954097, -0.4523202, -2.339704, 1, 1, 1, 1, 1,
-0.1943254, 0.541874, -0.9435356, 1, 1, 1, 1, 1,
-0.1942434, -0.2802484, -3.7968, 1, 1, 1, 1, 1,
-0.1929684, -0.6806501, -3.294352, 1, 1, 1, 1, 1,
-0.1911209, 2.230897, -0.4057223, 1, 1, 1, 1, 1,
-0.1903846, 0.1858907, -0.8188033, 1, 1, 1, 1, 1,
-0.1893745, 0.7214069, -0.09435182, 1, 1, 1, 1, 1,
-0.1871438, -1.230298, -3.527372, 1, 1, 1, 1, 1,
-0.1862583, -0.683808, -3.500003, 1, 1, 1, 1, 1,
-0.1840459, 0.08328602, -1.814345, 1, 1, 1, 1, 1,
-0.1787024, 1.07554, -2.414874, 1, 1, 1, 1, 1,
-0.1777017, -0.4208771, -2.924689, 1, 1, 1, 1, 1,
-0.1710605, 1.541347, -1.272211, 0, 0, 1, 1, 1,
-0.1673562, -0.3954812, -1.492106, 1, 0, 0, 1, 1,
-0.1649965, -2.421932, -3.055424, 1, 0, 0, 1, 1,
-0.1579587, -2.669046, -4.357786, 1, 0, 0, 1, 1,
-0.1574014, -0.9472564, -3.141602, 1, 0, 0, 1, 1,
-0.1537867, 0.3575741, 0.1960088, 1, 0, 0, 1, 1,
-0.1488317, 0.1865106, 0.4255877, 0, 0, 0, 1, 1,
-0.1454702, -0.4944378, -0.811848, 0, 0, 0, 1, 1,
-0.1408042, 1.369853, -0.6686464, 0, 0, 0, 1, 1,
-0.1398836, -0.7169771, -2.631599, 0, 0, 0, 1, 1,
-0.1292303, -0.2884199, -3.151071, 0, 0, 0, 1, 1,
-0.1255805, 0.6278328, -0.01029789, 0, 0, 0, 1, 1,
-0.1204818, 0.6809803, 0.1736872, 0, 0, 0, 1, 1,
-0.1199323, 1.107978, -0.6619383, 1, 1, 1, 1, 1,
-0.1181299, 3.499845, -0.05328196, 1, 1, 1, 1, 1,
-0.1162653, -1.632566, -1.939318, 1, 1, 1, 1, 1,
-0.1158066, 1.01063, 0.0117709, 1, 1, 1, 1, 1,
-0.1127094, -0.4251652, -2.907565, 1, 1, 1, 1, 1,
-0.1087163, -0.5309257, -1.606299, 1, 1, 1, 1, 1,
-0.1081754, -0.8335831, -2.392892, 1, 1, 1, 1, 1,
-0.1068286, -0.4835265, -2.120676, 1, 1, 1, 1, 1,
-0.103538, 1.163046, 0.5748014, 1, 1, 1, 1, 1,
-0.09521862, -0.5996945, -2.572194, 1, 1, 1, 1, 1,
-0.09490222, -0.3557144, -1.681594, 1, 1, 1, 1, 1,
-0.09241796, 0.1492711, 0.2853758, 1, 1, 1, 1, 1,
-0.08445173, 0.9386697, 0.973439, 1, 1, 1, 1, 1,
-0.07580296, -1.364605, -2.181155, 1, 1, 1, 1, 1,
-0.07518705, 0.4576462, -1.45651, 1, 1, 1, 1, 1,
-0.07352198, -0.5894828, -3.052261, 0, 0, 1, 1, 1,
-0.0711084, -0.4745106, -2.740659, 1, 0, 0, 1, 1,
-0.06905477, 0.3897785, -1.237444, 1, 0, 0, 1, 1,
-0.06621824, 1.054633, -0.537122, 1, 0, 0, 1, 1,
-0.06514524, -1.111143, -2.769613, 1, 0, 0, 1, 1,
-0.06131498, -0.138377, -2.910631, 1, 0, 0, 1, 1,
-0.05996532, 1.855824, -0.6565107, 0, 0, 0, 1, 1,
-0.05589855, 0.08627598, -1.5917, 0, 0, 0, 1, 1,
-0.05513323, -0.6599668, -2.986115, 0, 0, 0, 1, 1,
-0.05486746, -0.8973656, -3.357805, 0, 0, 0, 1, 1,
-0.05010423, 1.230787, 0.6111798, 0, 0, 0, 1, 1,
-0.04603791, -0.6749921, -2.405151, 0, 0, 0, 1, 1,
-0.04182622, 1.594918, 0.1651645, 0, 0, 0, 1, 1,
-0.03965256, 0.889823, -1.213822, 1, 1, 1, 1, 1,
-0.03836332, 0.01553622, -0.8011185, 1, 1, 1, 1, 1,
-0.03679504, 2.279515, -0.6458377, 1, 1, 1, 1, 1,
-0.03138565, 0.797392, 0.6412446, 1, 1, 1, 1, 1,
-0.02966457, -1.199388, -2.152991, 1, 1, 1, 1, 1,
-0.02543083, 1.967963, 1.438185, 1, 1, 1, 1, 1,
-0.02506744, 1.696671, 0.2362952, 1, 1, 1, 1, 1,
-0.02240778, -0.8891417, -3.453086, 1, 1, 1, 1, 1,
-0.02009689, -0.07111789, -2.875381, 1, 1, 1, 1, 1,
-0.01812681, -1.084249, -0.7962015, 1, 1, 1, 1, 1,
-0.01645125, 1.090353, -0.1653061, 1, 1, 1, 1, 1,
-0.01229798, -1.226979, -2.472212, 1, 1, 1, 1, 1,
-0.0049044, -0.9545237, -1.47893, 1, 1, 1, 1, 1,
-0.004592564, 0.5696878, -1.228941, 1, 1, 1, 1, 1,
-0.002000192, -1.68643, -4.252724, 1, 1, 1, 1, 1,
0.002996475, 0.3905762, 1.5101, 0, 0, 1, 1, 1,
0.003210093, 1.949815, 0.1446945, 1, 0, 0, 1, 1,
0.007286321, 1.44084, -0.5907213, 1, 0, 0, 1, 1,
0.009490428, -0.533901, 2.428075, 1, 0, 0, 1, 1,
0.01124835, 0.7747669, 0.1496745, 1, 0, 0, 1, 1,
0.01152334, 1.744569, 0.1314414, 1, 0, 0, 1, 1,
0.01152954, 0.5479097, 0.03374545, 0, 0, 0, 1, 1,
0.02086285, 0.8936424, -0.5522904, 0, 0, 0, 1, 1,
0.02321798, 0.9536947, -0.3150984, 0, 0, 0, 1, 1,
0.02425829, 0.278438, 0.3311853, 0, 0, 0, 1, 1,
0.03490996, -0.2726149, 3.98912, 0, 0, 0, 1, 1,
0.0354807, -1.9174, 1.964123, 0, 0, 0, 1, 1,
0.03616768, -0.0583864, 2.560281, 0, 0, 0, 1, 1,
0.03685429, -0.2234612, 1.919386, 1, 1, 1, 1, 1,
0.04235831, -1.817329, 4.918831, 1, 1, 1, 1, 1,
0.04381115, -0.3129895, 4.032028, 1, 1, 1, 1, 1,
0.04553926, -0.7981825, 2.681462, 1, 1, 1, 1, 1,
0.05154922, 1.350151, -0.2829446, 1, 1, 1, 1, 1,
0.05226053, -0.4389729, 2.518673, 1, 1, 1, 1, 1,
0.0532595, -0.01977763, 3.21934, 1, 1, 1, 1, 1,
0.05783416, -2.78103, 3.312065, 1, 1, 1, 1, 1,
0.05811734, 0.2323731, 0.3058355, 1, 1, 1, 1, 1,
0.05929543, -0.19059, 3.956623, 1, 1, 1, 1, 1,
0.06159553, -1.288691, 3.120578, 1, 1, 1, 1, 1,
0.06198269, 0.05846397, 1.099178, 1, 1, 1, 1, 1,
0.06386037, 0.8070738, 0.1899297, 1, 1, 1, 1, 1,
0.06503474, -0.05936985, 4.761652, 1, 1, 1, 1, 1,
0.07367478, -0.6277978, 1.735333, 1, 1, 1, 1, 1,
0.07392138, 0.8480594, -1.456419, 0, 0, 1, 1, 1,
0.07563494, 0.4691269, -0.7803172, 1, 0, 0, 1, 1,
0.07593759, -1.577926, 2.870425, 1, 0, 0, 1, 1,
0.07830681, 0.4504572, 1.001015, 1, 0, 0, 1, 1,
0.07903454, -1.036582, 3.680936, 1, 0, 0, 1, 1,
0.07928959, 1.612488, 1.034251, 1, 0, 0, 1, 1,
0.08094545, -2.035472, 3.501255, 0, 0, 0, 1, 1,
0.08256917, 1.314767, -0.06648401, 0, 0, 0, 1, 1,
0.08539484, 0.9453959, 1.161086, 0, 0, 0, 1, 1,
0.08908419, -1.14173, 3.576997, 0, 0, 0, 1, 1,
0.09124386, 1.841452, 2.886711, 0, 0, 0, 1, 1,
0.1012058, -0.1940664, 1.15253, 0, 0, 0, 1, 1,
0.1019126, -0.5750594, 2.99862, 0, 0, 0, 1, 1,
0.1029305, -0.6981708, 2.722893, 1, 1, 1, 1, 1,
0.1067405, -1.055374, 2.540246, 1, 1, 1, 1, 1,
0.1073554, -1.116503, 2.037677, 1, 1, 1, 1, 1,
0.1100153, 0.7894075, -0.7326942, 1, 1, 1, 1, 1,
0.111208, 0.1853688, 2.090626, 1, 1, 1, 1, 1,
0.1150193, 0.8605317, -0.2803821, 1, 1, 1, 1, 1,
0.1167016, -0.7969434, 3.426247, 1, 1, 1, 1, 1,
0.1192678, 0.2156112, 0.2377926, 1, 1, 1, 1, 1,
0.1224051, 1.002116, -1.120144, 1, 1, 1, 1, 1,
0.1230153, -0.9946221, 3.63394, 1, 1, 1, 1, 1,
0.124145, 0.2429683, 0.1656815, 1, 1, 1, 1, 1,
0.1318183, -0.494687, 2.923925, 1, 1, 1, 1, 1,
0.132541, -1.985049, 2.247866, 1, 1, 1, 1, 1,
0.1328183, -1.355324, 4.123731, 1, 1, 1, 1, 1,
0.1338223, -1.184636, 2.159289, 1, 1, 1, 1, 1,
0.1357419, -1.07845, 3.29678, 0, 0, 1, 1, 1,
0.1361525, -0.9022452, 3.094182, 1, 0, 0, 1, 1,
0.1426397, -0.3393475, 1.935674, 1, 0, 0, 1, 1,
0.1441842, -0.61215, 2.49022, 1, 0, 0, 1, 1,
0.1447167, -0.4494179, 3.82977, 1, 0, 0, 1, 1,
0.1494515, 0.6659145, 0.1074984, 1, 0, 0, 1, 1,
0.150709, 0.4674116, -1.445243, 0, 0, 0, 1, 1,
0.1529439, 0.3397258, -0.0492186, 0, 0, 0, 1, 1,
0.1536165, 0.3711463, 0.5891136, 0, 0, 0, 1, 1,
0.1549057, -2.6875, 2.96505, 0, 0, 0, 1, 1,
0.1550791, -0.9122251, 3.336045, 0, 0, 0, 1, 1,
0.1573255, 0.76774, 1.570635, 0, 0, 0, 1, 1,
0.1589473, -0.2800786, 4.967906, 0, 0, 0, 1, 1,
0.1601719, -0.6578402, 3.430061, 1, 1, 1, 1, 1,
0.1621534, -0.3907778, 2.727914, 1, 1, 1, 1, 1,
0.1646859, 0.07993755, 1.10442, 1, 1, 1, 1, 1,
0.1718875, 1.556911, 0.3984925, 1, 1, 1, 1, 1,
0.1746952, 0.3097767, 1.777076, 1, 1, 1, 1, 1,
0.175758, 0.5674945, 0.5408026, 1, 1, 1, 1, 1,
0.1771166, 0.3600006, 1.824472, 1, 1, 1, 1, 1,
0.1810452, -0.7713469, 2.712998, 1, 1, 1, 1, 1,
0.1831454, -0.6689192, 3.067403, 1, 1, 1, 1, 1,
0.1888439, 0.1889558, 0.9315255, 1, 1, 1, 1, 1,
0.1910681, -0.6776268, 3.16715, 1, 1, 1, 1, 1,
0.193321, 0.1332473, -0.1251419, 1, 1, 1, 1, 1,
0.1956595, -1.124539, 3.255146, 1, 1, 1, 1, 1,
0.1999995, -0.9540838, 2.803978, 1, 1, 1, 1, 1,
0.2012483, -1.323506, 1.30116, 1, 1, 1, 1, 1,
0.2020675, 0.4138794, 1.442293, 0, 0, 1, 1, 1,
0.2031824, 0.6581817, -0.3519846, 1, 0, 0, 1, 1,
0.2040122, -0.5844671, 2.524475, 1, 0, 0, 1, 1,
0.20446, -1.953098, 3.033811, 1, 0, 0, 1, 1,
0.2045833, -0.6016942, 3.864444, 1, 0, 0, 1, 1,
0.2056448, 0.3714078, 0.9845831, 1, 0, 0, 1, 1,
0.2069309, -1.512713, 2.485719, 0, 0, 0, 1, 1,
0.2092676, 0.06404679, 2.308299, 0, 0, 0, 1, 1,
0.212143, 1.197173, 0.154805, 0, 0, 0, 1, 1,
0.2154504, 0.4935434, -0.5773516, 0, 0, 0, 1, 1,
0.218566, 0.4833608, 0.652224, 0, 0, 0, 1, 1,
0.2210835, -0.7322184, 2.408071, 0, 0, 0, 1, 1,
0.2226183, -0.398903, 4.523318, 0, 0, 0, 1, 1,
0.2248331, 0.6652321, 1.443956, 1, 1, 1, 1, 1,
0.2252357, 1.357141, 0.4097119, 1, 1, 1, 1, 1,
0.2302443, -0.6676892, 2.645551, 1, 1, 1, 1, 1,
0.2313048, -0.1845676, 3.378448, 1, 1, 1, 1, 1,
0.2350932, -0.6457613, 0.06213761, 1, 1, 1, 1, 1,
0.2398495, 0.1999924, -0.05368149, 1, 1, 1, 1, 1,
0.2429394, 0.9866247, 1.251221, 1, 1, 1, 1, 1,
0.2433855, -0.437356, 2.441336, 1, 1, 1, 1, 1,
0.2467248, -0.01243325, 2.650547, 1, 1, 1, 1, 1,
0.2496267, -0.3812041, 3.692512, 1, 1, 1, 1, 1,
0.2508717, -1.503921, 2.720774, 1, 1, 1, 1, 1,
0.2510239, -0.1195381, 0.5901039, 1, 1, 1, 1, 1,
0.2552859, -0.6754504, 3.002008, 1, 1, 1, 1, 1,
0.2584243, 0.1990378, 0.8431557, 1, 1, 1, 1, 1,
0.2598925, -0.3011332, 2.421537, 1, 1, 1, 1, 1,
0.2613806, -1.170964, 3.928724, 0, 0, 1, 1, 1,
0.2616746, -0.3348984, 2.870317, 1, 0, 0, 1, 1,
0.2642474, -0.6567888, 3.740072, 1, 0, 0, 1, 1,
0.267577, 0.18473, -0.1001651, 1, 0, 0, 1, 1,
0.2697991, 0.1712028, 1.164213, 1, 0, 0, 1, 1,
0.2710694, -0.5848538, 4.801191, 1, 0, 0, 1, 1,
0.274178, -1.082995, 2.533095, 0, 0, 0, 1, 1,
0.2802465, 1.173815, 1.219539, 0, 0, 0, 1, 1,
0.2828621, 1.517858, -0.4706607, 0, 0, 0, 1, 1,
0.288036, -0.1324063, 2.151301, 0, 0, 0, 1, 1,
0.2921378, -1.510362, 2.668083, 0, 0, 0, 1, 1,
0.2948107, 2.437129, -1.007349, 0, 0, 0, 1, 1,
0.3014002, -0.3285128, 2.986416, 0, 0, 0, 1, 1,
0.3056575, -1.973678, 3.383157, 1, 1, 1, 1, 1,
0.3062842, 0.3083808, -0.3924648, 1, 1, 1, 1, 1,
0.3095182, -2.450385, 2.89082, 1, 1, 1, 1, 1,
0.3122804, -0.2622369, 4.653018, 1, 1, 1, 1, 1,
0.3132887, -0.5297046, 4.011, 1, 1, 1, 1, 1,
0.3183487, -1.103874, 2.472942, 1, 1, 1, 1, 1,
0.3194225, 0.264459, 2.865844, 1, 1, 1, 1, 1,
0.3218617, 0.920463, 2.905187, 1, 1, 1, 1, 1,
0.322663, 0.6294019, 1.810626, 1, 1, 1, 1, 1,
0.3237477, 1.337217, -0.2770695, 1, 1, 1, 1, 1,
0.3247756, -1.27818, 3.156067, 1, 1, 1, 1, 1,
0.3269413, 0.6995375, 1.42963, 1, 1, 1, 1, 1,
0.3284097, -0.06592701, 1.383137, 1, 1, 1, 1, 1,
0.3310947, 0.1689095, 1.954688, 1, 1, 1, 1, 1,
0.3320549, -1.957305, 3.533498, 1, 1, 1, 1, 1,
0.3366937, 1.853691, -0.5513613, 0, 0, 1, 1, 1,
0.3406018, 0.3135909, 0.8816862, 1, 0, 0, 1, 1,
0.342281, -0.04285325, 1.422473, 1, 0, 0, 1, 1,
0.342882, 1.292189, 0.4474686, 1, 0, 0, 1, 1,
0.3467334, -1.87973, 2.663695, 1, 0, 0, 1, 1,
0.3518922, 0.8043056, 0.7367922, 1, 0, 0, 1, 1,
0.3544772, -0.2730059, 3.370943, 0, 0, 0, 1, 1,
0.3563145, -0.1160879, 3.277561, 0, 0, 0, 1, 1,
0.3598779, -0.4934164, 4.354204, 0, 0, 0, 1, 1,
0.365688, -0.4725743, 3.411941, 0, 0, 0, 1, 1,
0.366625, 0.8859113, -1.275548, 0, 0, 0, 1, 1,
0.3680755, -0.4992434, 4.021662, 0, 0, 0, 1, 1,
0.3684225, -0.5147857, 2.356908, 0, 0, 0, 1, 1,
0.3700011, -1.444191, 2.308515, 1, 1, 1, 1, 1,
0.371191, -0.6146951, 2.272529, 1, 1, 1, 1, 1,
0.3766162, 0.1265199, 0.4397297, 1, 1, 1, 1, 1,
0.3773416, 0.9436089, -0.4759562, 1, 1, 1, 1, 1,
0.3788246, -0.2254913, 2.153747, 1, 1, 1, 1, 1,
0.3814665, -0.5100436, 3.506093, 1, 1, 1, 1, 1,
0.3856948, -0.779184, 1.645144, 1, 1, 1, 1, 1,
0.3863654, 0.3933307, 1.112409, 1, 1, 1, 1, 1,
0.3888101, 1.3414, 1.429798, 1, 1, 1, 1, 1,
0.3893891, -0.8755366, 3.31418, 1, 1, 1, 1, 1,
0.3907276, 0.4197923, -1.073909, 1, 1, 1, 1, 1,
0.3908201, -1.132242, 3.052332, 1, 1, 1, 1, 1,
0.3953621, -1.400132, 2.199797, 1, 1, 1, 1, 1,
0.399502, -0.1815758, 1.999587, 1, 1, 1, 1, 1,
0.4011747, 0.7119913, 1.305327, 1, 1, 1, 1, 1,
0.4087925, -0.6310717, 2.560352, 0, 0, 1, 1, 1,
0.4123156, 0.00218334, 0.594725, 1, 0, 0, 1, 1,
0.4123276, 0.3726337, 0.8309444, 1, 0, 0, 1, 1,
0.4169058, 1.412874, 0.08468714, 1, 0, 0, 1, 1,
0.4197381, 0.8036369, 0.3365749, 1, 0, 0, 1, 1,
0.420532, -1.988823, 4.431379, 1, 0, 0, 1, 1,
0.4206316, 1.063341, 0.830732, 0, 0, 0, 1, 1,
0.4210352, -0.2939835, 2.743605, 0, 0, 0, 1, 1,
0.4241391, -0.3266259, 1.609195, 0, 0, 0, 1, 1,
0.42596, -0.4252908, 2.009043, 0, 0, 0, 1, 1,
0.4283742, 0.23641, 0.1848411, 0, 0, 0, 1, 1,
0.4305983, -0.03116016, 1.078434, 0, 0, 0, 1, 1,
0.4347802, 1.502244, 0.2213559, 0, 0, 0, 1, 1,
0.4355098, 1.118241, 0.8046643, 1, 1, 1, 1, 1,
0.4365878, -0.1414501, 1.911275, 1, 1, 1, 1, 1,
0.4385933, -0.4959595, 0.157639, 1, 1, 1, 1, 1,
0.4421947, -0.5039285, 0.01710496, 1, 1, 1, 1, 1,
0.4439917, 1.43483, 1.576722, 1, 1, 1, 1, 1,
0.4477735, 0.6730337, -0.8298625, 1, 1, 1, 1, 1,
0.4482687, 0.05430745, 1.490594, 1, 1, 1, 1, 1,
0.4565685, -1.135169, 3.351851, 1, 1, 1, 1, 1,
0.4570615, 1.519706, 0.152083, 1, 1, 1, 1, 1,
0.4586183, -1.544962, 0.8270345, 1, 1, 1, 1, 1,
0.459687, 0.4130367, 0.4365445, 1, 1, 1, 1, 1,
0.466061, -0.4225759, 3.182641, 1, 1, 1, 1, 1,
0.4662236, -0.1337935, 0.644495, 1, 1, 1, 1, 1,
0.4741981, 0.2608632, 1.971975, 1, 1, 1, 1, 1,
0.4786934, -0.804494, 2.813297, 1, 1, 1, 1, 1,
0.48795, 0.3460177, 1.060946, 0, 0, 1, 1, 1,
0.488707, 0.689414, 0.1924019, 1, 0, 0, 1, 1,
0.4893397, 1.123248, 0.2793781, 1, 0, 0, 1, 1,
0.4961376, 0.6335803, 1.231799, 1, 0, 0, 1, 1,
0.497095, -0.559704, 0.9608671, 1, 0, 0, 1, 1,
0.5031621, 2.16781, -1.11059, 1, 0, 0, 1, 1,
0.5084655, -1.596054, 2.900974, 0, 0, 0, 1, 1,
0.5100353, 0.5021329, 0.04029698, 0, 0, 0, 1, 1,
0.511631, 2.065302, 0.4432538, 0, 0, 0, 1, 1,
0.5128397, 0.1152291, 1.690035, 0, 0, 0, 1, 1,
0.5148059, 0.4867946, 1.525054, 0, 0, 0, 1, 1,
0.5181875, 0.08753037, 2.926485, 0, 0, 0, 1, 1,
0.5204528, 0.2164224, 0.8968707, 0, 0, 0, 1, 1,
0.5207031, 0.3825983, 2.898711, 1, 1, 1, 1, 1,
0.5230426, 0.7587962, 1.068847, 1, 1, 1, 1, 1,
0.5257806, -0.07311164, 1.627457, 1, 1, 1, 1, 1,
0.5292826, -0.4089745, 2.874508, 1, 1, 1, 1, 1,
0.5362236, 1.207157, 0.4065848, 1, 1, 1, 1, 1,
0.5375839, -0.07526824, 0.5417296, 1, 1, 1, 1, 1,
0.5379802, -1.77871, 2.686725, 1, 1, 1, 1, 1,
0.5400132, 0.6661561, -0.3148781, 1, 1, 1, 1, 1,
0.5401962, -0.3379647, 2.05704, 1, 1, 1, 1, 1,
0.5408141, -0.1403652, 1.657708, 1, 1, 1, 1, 1,
0.5431837, 0.3315513, 1.16506, 1, 1, 1, 1, 1,
0.5478089, -0.4998147, 1.686159, 1, 1, 1, 1, 1,
0.5517304, 1.67372, 2.371197, 1, 1, 1, 1, 1,
0.5530671, 0.8298813, -1.227026, 1, 1, 1, 1, 1,
0.5531632, 0.4250565, 1.603975, 1, 1, 1, 1, 1,
0.5567182, -1.6674, 2.825678, 0, 0, 1, 1, 1,
0.5618858, 0.07310909, 0.7930878, 1, 0, 0, 1, 1,
0.5632572, 1.755519, 1.124917, 1, 0, 0, 1, 1,
0.5646608, 0.2268658, 0.3708693, 1, 0, 0, 1, 1,
0.5648919, -0.2090622, 1.867813, 1, 0, 0, 1, 1,
0.5653297, 1.169298, 0.777432, 1, 0, 0, 1, 1,
0.5668383, 1.774032, -0.7720218, 0, 0, 0, 1, 1,
0.5671415, -1.359777, 3.533656, 0, 0, 0, 1, 1,
0.5671889, -0.2200337, 1.197216, 0, 0, 0, 1, 1,
0.5733555, -0.8102976, 2.149574, 0, 0, 0, 1, 1,
0.5764704, 0.5268847, 1.844549, 0, 0, 0, 1, 1,
0.5765521, -0.6271999, 3.524429, 0, 0, 0, 1, 1,
0.5768091, 0.2244914, 1.640826, 0, 0, 0, 1, 1,
0.5823398, -0.8852001, 0.4803424, 1, 1, 1, 1, 1,
0.5832493, 1.542346, -0.4436393, 1, 1, 1, 1, 1,
0.5848129, 1.397003, 1.051492, 1, 1, 1, 1, 1,
0.5865846, -0.7843406, 3.392355, 1, 1, 1, 1, 1,
0.590582, -0.1304617, 1.842914, 1, 1, 1, 1, 1,
0.5927176, -0.1317017, 0.3763497, 1, 1, 1, 1, 1,
0.6004602, 1.175631, 0.198342, 1, 1, 1, 1, 1,
0.6021615, -1.884699, 2.273784, 1, 1, 1, 1, 1,
0.61745, 0.5859064, 0.615635, 1, 1, 1, 1, 1,
0.6182585, -1.105118, 1.544539, 1, 1, 1, 1, 1,
0.6232744, -1.40087, 2.937943, 1, 1, 1, 1, 1,
0.6236089, -0.2461246, 1.110641, 1, 1, 1, 1, 1,
0.6240985, 0.6866745, 0.9944109, 1, 1, 1, 1, 1,
0.6259021, 1.82472, 0.4278226, 1, 1, 1, 1, 1,
0.6383216, 0.4226042, 2.329576, 1, 1, 1, 1, 1,
0.6463347, -0.3071012, 3.502928, 0, 0, 1, 1, 1,
0.6563413, -0.6025943, 2.392596, 1, 0, 0, 1, 1,
0.6567745, -1.787164, 4.802938, 1, 0, 0, 1, 1,
0.6589907, 1.718281, 1.060799, 1, 0, 0, 1, 1,
0.6655358, -0.7313015, 2.211725, 1, 0, 0, 1, 1,
0.665791, 1.288035, 0.4356559, 1, 0, 0, 1, 1,
0.6672505, 1.792635, -0.5041066, 0, 0, 0, 1, 1,
0.673824, -0.9861553, 2.564299, 0, 0, 0, 1, 1,
0.678397, 0.4280516, 1.860376, 0, 0, 0, 1, 1,
0.6837864, 0.3016099, 2.470384, 0, 0, 0, 1, 1,
0.6867105, 0.1164482, 1.454039, 0, 0, 0, 1, 1,
0.687313, -0.5806823, 4.123702, 0, 0, 0, 1, 1,
0.6885573, -1.106692, 1.605249, 0, 0, 0, 1, 1,
0.6942647, -0.3192674, 0.6800085, 1, 1, 1, 1, 1,
0.7044721, 0.6288193, 1.408571, 1, 1, 1, 1, 1,
0.7046033, -1.195683, 1.52935, 1, 1, 1, 1, 1,
0.7063785, 0.3609204, -1.001993, 1, 1, 1, 1, 1,
0.7115674, 0.6986367, 0.7067369, 1, 1, 1, 1, 1,
0.7126716, -0.127056, 1.206064, 1, 1, 1, 1, 1,
0.7136855, 0.3859592, 2.506627, 1, 1, 1, 1, 1,
0.7139114, 2.144046, 0.0001197331, 1, 1, 1, 1, 1,
0.7153725, 0.3675758, 0.5291954, 1, 1, 1, 1, 1,
0.7177511, -1.049679, 0.5988533, 1, 1, 1, 1, 1,
0.7205911, 0.3851968, -0.2270421, 1, 1, 1, 1, 1,
0.7206148, 2.135973, -2.218627, 1, 1, 1, 1, 1,
0.721019, -0.3603183, 2.030249, 1, 1, 1, 1, 1,
0.7265124, -0.5729665, 1.967613, 1, 1, 1, 1, 1,
0.7267632, -0.7155604, 1.392828, 1, 1, 1, 1, 1,
0.7293089, 0.3099514, 1.460533, 0, 0, 1, 1, 1,
0.7326798, -0.9573839, 1.4134, 1, 0, 0, 1, 1,
0.7366377, -0.2656752, 1.244573, 1, 0, 0, 1, 1,
0.7369443, 0.9718137, 0.7485856, 1, 0, 0, 1, 1,
0.7373479, 1.187823, -1.096305, 1, 0, 0, 1, 1,
0.7385744, 0.8384232, 0.8598559, 1, 0, 0, 1, 1,
0.7388596, 0.6876328, -0.5587881, 0, 0, 0, 1, 1,
0.7397147, -1.374076, 2.692691, 0, 0, 0, 1, 1,
0.7509739, 0.9733556, -0.7585712, 0, 0, 0, 1, 1,
0.7518793, -0.4933141, 3.734381, 0, 0, 0, 1, 1,
0.7558261, 0.2438, 2.063101, 0, 0, 0, 1, 1,
0.7585675, -0.1964405, 2.336634, 0, 0, 0, 1, 1,
0.7593447, 1.769029, 1.224434, 0, 0, 0, 1, 1,
0.7629913, -0.03156648, 0.6096601, 1, 1, 1, 1, 1,
0.7660939, 0.7399458, 0.2038593, 1, 1, 1, 1, 1,
0.7663171, 1.756911, 1.113101, 1, 1, 1, 1, 1,
0.7678044, -0.01715494, 2.134578, 1, 1, 1, 1, 1,
0.7703612, 0.1615649, 2.513316, 1, 1, 1, 1, 1,
0.7786569, -1.343495, 3.514385, 1, 1, 1, 1, 1,
0.779563, 0.6876237, 1.848578, 1, 1, 1, 1, 1,
0.7825397, 0.587897, 0.7138963, 1, 1, 1, 1, 1,
0.7833101, 0.1781668, 0.1552262, 1, 1, 1, 1, 1,
0.7925616, -2.214627, 2.879377, 1, 1, 1, 1, 1,
0.7956304, -0.2600196, 2.095989, 1, 1, 1, 1, 1,
0.7996415, -0.7812184, 1.9871, 1, 1, 1, 1, 1,
0.8035824, 0.8717697, 0.6025802, 1, 1, 1, 1, 1,
0.8076538, 1.568038, -0.8742287, 1, 1, 1, 1, 1,
0.8107164, -0.832302, 3.191446, 1, 1, 1, 1, 1,
0.8142443, 1.152717, -0.3756605, 0, 0, 1, 1, 1,
0.8165208, -0.02184764, 0.2701974, 1, 0, 0, 1, 1,
0.8167099, 0.2460292, 2.458529, 1, 0, 0, 1, 1,
0.8173452, 0.3082896, 0.2323487, 1, 0, 0, 1, 1,
0.818837, 0.1046564, 2.793612, 1, 0, 0, 1, 1,
0.825861, -0.8180982, 4.775135, 1, 0, 0, 1, 1,
0.8313149, -0.1208128, 2.639549, 0, 0, 0, 1, 1,
0.8340296, 0.6060946, 1.979832, 0, 0, 0, 1, 1,
0.8434529, -0.8607129, 1.457529, 0, 0, 0, 1, 1,
0.8439628, -1.776428, 3.262255, 0, 0, 0, 1, 1,
0.8480909, 1.201728, 0.6123167, 0, 0, 0, 1, 1,
0.8591734, -0.8384352, 1.798976, 0, 0, 0, 1, 1,
0.8599204, 0.5111914, 1.111955, 0, 0, 0, 1, 1,
0.8653575, 0.6821274, 2.609806, 1, 1, 1, 1, 1,
0.866006, -2.107254, 3.07842, 1, 1, 1, 1, 1,
0.87285, -1.108871, -0.504306, 1, 1, 1, 1, 1,
0.8746381, -0.6105909, 3.75848, 1, 1, 1, 1, 1,
0.8785453, 0.7853933, 0.8206528, 1, 1, 1, 1, 1,
0.9006421, 0.4072637, 1.251483, 1, 1, 1, 1, 1,
0.9020534, 1.958554, -0.7873799, 1, 1, 1, 1, 1,
0.9035005, -0.447512, 0.3324415, 1, 1, 1, 1, 1,
0.9043881, -0.3413469, 1.975495, 1, 1, 1, 1, 1,
0.9069633, -1.219427, 4.241008, 1, 1, 1, 1, 1,
0.9186808, 0.8524801, 0.1279557, 1, 1, 1, 1, 1,
0.9277036, 0.6768918, 1.287193, 1, 1, 1, 1, 1,
0.9287265, 1.044422, 0.7683176, 1, 1, 1, 1, 1,
0.9303513, -0.2263277, 1.613107, 1, 1, 1, 1, 1,
0.9305519, 0.9217285, -0.4409547, 1, 1, 1, 1, 1,
0.9330974, 1.155057, 0.6270787, 0, 0, 1, 1, 1,
0.9429498, 0.4263895, 0.4691291, 1, 0, 0, 1, 1,
0.9430929, 1.388273, -0.5454949, 1, 0, 0, 1, 1,
0.9484605, -0.1607484, 2.064237, 1, 0, 0, 1, 1,
0.9495507, -1.984352, 3.25916, 1, 0, 0, 1, 1,
0.9500345, 0.5128995, 1.529312, 1, 0, 0, 1, 1,
0.9536435, 0.2137611, -0.3713808, 0, 0, 0, 1, 1,
0.954719, 0.2608623, 1.852576, 0, 0, 0, 1, 1,
0.9657602, 0.8579708, -0.3115914, 0, 0, 0, 1, 1,
0.9715815, 1.556197, 2.621189, 0, 0, 0, 1, 1,
0.9778239, -1.735258, 1.565125, 0, 0, 0, 1, 1,
0.9835254, -1.058026, 3.551968, 0, 0, 0, 1, 1,
0.9846758, 0.3489698, 0.9261693, 0, 0, 0, 1, 1,
0.9894112, 0.5666419, 0.02575517, 1, 1, 1, 1, 1,
0.9943749, 1.401358, 0.5801022, 1, 1, 1, 1, 1,
0.9968095, 0.6884429, 1.683307, 1, 1, 1, 1, 1,
0.9970674, -0.8882249, 0.8503003, 1, 1, 1, 1, 1,
1.000186, 1.75017, 0.2245014, 1, 1, 1, 1, 1,
1.000225, -0.2456992, 2.377354, 1, 1, 1, 1, 1,
1.00594, 0.4638727, 2.630586, 1, 1, 1, 1, 1,
1.01346, -1.115875, -0.4544404, 1, 1, 1, 1, 1,
1.014124, 1.344896, 1.238445, 1, 1, 1, 1, 1,
1.020003, -0.0400186, 1.48398, 1, 1, 1, 1, 1,
1.0202, 1.459787, 0.4797647, 1, 1, 1, 1, 1,
1.022539, -0.4604952, 1.399667, 1, 1, 1, 1, 1,
1.026114, 0.5922778, -0.2974998, 1, 1, 1, 1, 1,
1.026297, -0.4971264, 2.328626, 1, 1, 1, 1, 1,
1.03266, 1.097525, 1.458925, 1, 1, 1, 1, 1,
1.033251, -0.2820745, 4.107779, 0, 0, 1, 1, 1,
1.036072, 0.532549, 2.167629, 1, 0, 0, 1, 1,
1.037205, -0.1229233, 1.864857, 1, 0, 0, 1, 1,
1.047168, 1.058379, 1.286357, 1, 0, 0, 1, 1,
1.04796, -0.8160805, 1.515148, 1, 0, 0, 1, 1,
1.049335, 1.380313, 0.6092815, 1, 0, 0, 1, 1,
1.051335, -0.798922, 1.302877, 0, 0, 0, 1, 1,
1.055553, -1.04536, 2.704008, 0, 0, 0, 1, 1,
1.057084, 0.4519421, -0.06835072, 0, 0, 0, 1, 1,
1.057453, -0.6086977, 4.770122, 0, 0, 0, 1, 1,
1.05948, 1.836505, 0.3267903, 0, 0, 0, 1, 1,
1.059525, 1.477594, -1.37879, 0, 0, 0, 1, 1,
1.059688, 0.2755261, 1.365597, 0, 0, 0, 1, 1,
1.063022, -1.266348, 0.06817377, 1, 1, 1, 1, 1,
1.072919, 0.214662, 3.221487, 1, 1, 1, 1, 1,
1.074234, 1.592587, 1.877102, 1, 1, 1, 1, 1,
1.079289, 0.7552141, 0.2738976, 1, 1, 1, 1, 1,
1.091826, -1.328733, 3.069847, 1, 1, 1, 1, 1,
1.094556, -0.05177253, -0.4429089, 1, 1, 1, 1, 1,
1.096282, -0.6342281, 2.806029, 1, 1, 1, 1, 1,
1.098456, -0.5986172, 1.371439, 1, 1, 1, 1, 1,
1.101532, 0.6717468, 1.382282, 1, 1, 1, 1, 1,
1.109804, 0.5292899, 1.013757, 1, 1, 1, 1, 1,
1.119482, 0.5896734, 0.2914734, 1, 1, 1, 1, 1,
1.119804, 1.002965, 0.3403122, 1, 1, 1, 1, 1,
1.129814, 0.5054955, 0.8434333, 1, 1, 1, 1, 1,
1.137712, 0.1113197, -0.2354088, 1, 1, 1, 1, 1,
1.144708, 0.1459134, 1.67245, 1, 1, 1, 1, 1,
1.148442, -0.0006715941, 1.699224, 0, 0, 1, 1, 1,
1.153592, 0.9373687, -2.027522, 1, 0, 0, 1, 1,
1.164343, 1.627875, 2.045327, 1, 0, 0, 1, 1,
1.171353, -0.8017473, 2.552673, 1, 0, 0, 1, 1,
1.172164, 0.2599631, 1.408458, 1, 0, 0, 1, 1,
1.17747, -0.5541973, 0.8329213, 1, 0, 0, 1, 1,
1.183539, -0.9101557, 2.325356, 0, 0, 0, 1, 1,
1.184339, 0.2208142, 1.671422, 0, 0, 0, 1, 1,
1.185119, -0.1183212, 1.668721, 0, 0, 0, 1, 1,
1.187485, 0.4585347, 0.7707487, 0, 0, 0, 1, 1,
1.193158, -0.9586106, 2.391003, 0, 0, 0, 1, 1,
1.218608, -1.383334, 3.275114, 0, 0, 0, 1, 1,
1.219425, -1.526687, 0.6511483, 0, 0, 0, 1, 1,
1.227289, 1.110497, 2.124965, 1, 1, 1, 1, 1,
1.22972, -0.2983317, 0.8405758, 1, 1, 1, 1, 1,
1.236599, -0.1777239, 3.668804, 1, 1, 1, 1, 1,
1.23982, 1.739865, 0.3821799, 1, 1, 1, 1, 1,
1.239888, -0.6450413, 0.2753905, 1, 1, 1, 1, 1,
1.240347, -0.637623, 2.258898, 1, 1, 1, 1, 1,
1.244489, -0.628204, 1.833555, 1, 1, 1, 1, 1,
1.246353, 0.3886027, 3.885591, 1, 1, 1, 1, 1,
1.249555, -0.4982277, 3.168756, 1, 1, 1, 1, 1,
1.252188, 0.214963, 3.849055, 1, 1, 1, 1, 1,
1.257658, -0.9294147, 0.8480622, 1, 1, 1, 1, 1,
1.25933, -0.7903134, 3.21442, 1, 1, 1, 1, 1,
1.260874, -0.5037676, 2.586249, 1, 1, 1, 1, 1,
1.273487, -1.287807, 1.872946, 1, 1, 1, 1, 1,
1.273816, 1.451572, 1.74189, 1, 1, 1, 1, 1,
1.279125, 1.20062, 0.6438051, 0, 0, 1, 1, 1,
1.281667, -1.189785, 2.297369, 1, 0, 0, 1, 1,
1.287195, 1.063379, 0.542601, 1, 0, 0, 1, 1,
1.287862, -0.6168892, 2.07424, 1, 0, 0, 1, 1,
1.288209, 2.125123, 0.3217289, 1, 0, 0, 1, 1,
1.300983, -1.269027, 2.102215, 1, 0, 0, 1, 1,
1.30235, 0.1571399, 2.885699, 0, 0, 0, 1, 1,
1.303028, 2.232764, 2.843343, 0, 0, 0, 1, 1,
1.318026, -0.8376458, 2.142143, 0, 0, 0, 1, 1,
1.333183, 0.9016443, -0.365245, 0, 0, 0, 1, 1,
1.360766, 1.295903, 3.098999, 0, 0, 0, 1, 1,
1.370853, -1.519151, 0.9412751, 0, 0, 0, 1, 1,
1.388009, -0.4548273, 1.655262, 0, 0, 0, 1, 1,
1.389203, -1.023179, 2.057441, 1, 1, 1, 1, 1,
1.42678, -2.630208, 1.950999, 1, 1, 1, 1, 1,
1.432112, -1.385416, 3.564483, 1, 1, 1, 1, 1,
1.444515, 0.5021271, 1.083328, 1, 1, 1, 1, 1,
1.451632, 0.6900871, -0.09830188, 1, 1, 1, 1, 1,
1.452706, 0.3912759, 2.925781, 1, 1, 1, 1, 1,
1.456368, 0.68916, 0.684027, 1, 1, 1, 1, 1,
1.457725, 2.1707, -1.122562, 1, 1, 1, 1, 1,
1.459045, -0.4203252, 2.24747, 1, 1, 1, 1, 1,
1.459491, 0.3704514, 1.797143, 1, 1, 1, 1, 1,
1.471045, 0.78097, 0.4675309, 1, 1, 1, 1, 1,
1.477866, 2.42579, 1.44959, 1, 1, 1, 1, 1,
1.486553, 0.314175, -0.2451887, 1, 1, 1, 1, 1,
1.511536, 0.1715711, -0.1142457, 1, 1, 1, 1, 1,
1.515988, 0.2993637, 2.108492, 1, 1, 1, 1, 1,
1.525397, -0.2132379, 2.463051, 0, 0, 1, 1, 1,
1.539568, 0.2068852, 1.647008, 1, 0, 0, 1, 1,
1.542096, 0.4719366, -0.5967085, 1, 0, 0, 1, 1,
1.54687, 2.135723, 1.807266, 1, 0, 0, 1, 1,
1.548995, 0.6422848, 1.491024, 1, 0, 0, 1, 1,
1.60039, -0.05135582, 0.7815351, 1, 0, 0, 1, 1,
1.616558, 1.811325, 0.6769306, 0, 0, 0, 1, 1,
1.62532, -0.5994368, 1.962527, 0, 0, 0, 1, 1,
1.692933, 0.5925028, -0.2601112, 0, 0, 0, 1, 1,
1.695127, 0.8263101, 1.035304, 0, 0, 0, 1, 1,
1.69919, -1.585499, 0.3656326, 0, 0, 0, 1, 1,
1.713687, -0.5293546, 2.832183, 0, 0, 0, 1, 1,
1.719354, -0.9287108, 1.732144, 0, 0, 0, 1, 1,
1.733386, 0.7179409, 1.950285, 1, 1, 1, 1, 1,
1.73453, 0.3482326, 0.7285416, 1, 1, 1, 1, 1,
1.769532, 0.2806889, 1.569746, 1, 1, 1, 1, 1,
1.772259, 0.7271817, 0.599251, 1, 1, 1, 1, 1,
1.777516, -0.9663513, 1.936905, 1, 1, 1, 1, 1,
1.782831, -1.216674, 1.812341, 1, 1, 1, 1, 1,
1.826511, -1.325872, 2.20726, 1, 1, 1, 1, 1,
1.836764, -0.01971614, 1.413774, 1, 1, 1, 1, 1,
1.871058, 1.140507, 1.35127, 1, 1, 1, 1, 1,
1.872942, 0.2502515, 1.034271, 1, 1, 1, 1, 1,
1.879188, -0.3819342, 2.023176, 1, 1, 1, 1, 1,
1.881761, -1.166547, 0.5635079, 1, 1, 1, 1, 1,
1.909949, 0.5726793, 2.384708, 1, 1, 1, 1, 1,
1.969766, 0.3157072, 1.858879, 1, 1, 1, 1, 1,
1.983169, 1.291321, -0.1315056, 1, 1, 1, 1, 1,
2.001811, 0.5318743, 1.5244, 0, 0, 1, 1, 1,
2.041405, 0.9048032, 1.490749, 1, 0, 0, 1, 1,
2.049231, 0.7785084, 0.3470069, 1, 0, 0, 1, 1,
2.050569, 1.138541, 0.2035285, 1, 0, 0, 1, 1,
2.053311, 0.4972019, 2.063126, 1, 0, 0, 1, 1,
2.075198, 0.2432243, 0.05345263, 1, 0, 0, 1, 1,
2.130686, -0.4269185, 1.758025, 0, 0, 0, 1, 1,
2.138127, -0.05518128, 2.33946, 0, 0, 0, 1, 1,
2.206663, -1.130267, 2.233187, 0, 0, 0, 1, 1,
2.291114, -1.092006, 1.461413, 0, 0, 0, 1, 1,
2.329526, -2.14815, 1.934101, 0, 0, 0, 1, 1,
2.342993, 0.5721906, 2.956734, 0, 0, 0, 1, 1,
2.353298, 1.677779, 0.1201003, 0, 0, 0, 1, 1,
2.354336, -0.3733718, 1.629021, 1, 1, 1, 1, 1,
2.370696, -0.6791463, 2.421243, 1, 1, 1, 1, 1,
2.552283, -0.4038096, 1.549731, 1, 1, 1, 1, 1,
2.608483, -0.1052312, 1.095729, 1, 1, 1, 1, 1,
2.680534, 0.5128673, 3.021638, 1, 1, 1, 1, 1,
2.770184, -0.1750536, 1.846554, 1, 1, 1, 1, 1,
4.029534, 0.2844783, 1.117385, 1, 1, 1, 1, 1
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
var radius = 9.832508;
var distance = 34.53626;
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
mvMatrix.translate( -0.250319, -0.268266, 0.289264 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.53626);
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
