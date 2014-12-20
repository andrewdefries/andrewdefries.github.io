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
-3.252526, 2.485687, -1.58903, 1, 0, 0, 1,
-2.773081, -0.0284446, -2.997095, 1, 0.007843138, 0, 1,
-2.656978, -1.006054, -1.462082, 1, 0.01176471, 0, 1,
-2.567672, 0.7610441, -1.897332, 1, 0.01960784, 0, 1,
-2.564766, -1.238141, -1.289468, 1, 0.02352941, 0, 1,
-2.527869, 1.353466, -1.885516, 1, 0.03137255, 0, 1,
-2.52304, 0.5062702, -1.963963, 1, 0.03529412, 0, 1,
-2.464895, 0.3428337, -0.483333, 1, 0.04313726, 0, 1,
-2.41453, 0.9222943, -2.339414, 1, 0.04705882, 0, 1,
-2.398902, -1.240116, -2.319936, 1, 0.05490196, 0, 1,
-2.37805, 0.3923638, -0.4912212, 1, 0.05882353, 0, 1,
-2.304057, 0.7534661, -1.349106, 1, 0.06666667, 0, 1,
-2.258098, 0.2573099, -0.8272387, 1, 0.07058824, 0, 1,
-2.249984, 0.09492546, -1.55631, 1, 0.07843138, 0, 1,
-2.237509, 0.0404893, -3.411961, 1, 0.08235294, 0, 1,
-2.236692, -1.785996, -1.51342, 1, 0.09019608, 0, 1,
-2.225805, -0.554776, -1.46131, 1, 0.09411765, 0, 1,
-2.213934, 2.451071, -0.469816, 1, 0.1019608, 0, 1,
-2.213862, -0.1221472, 1.461382, 1, 0.1098039, 0, 1,
-2.209682, -0.7387015, -2.090854, 1, 0.1137255, 0, 1,
-2.128547, 1.596198, -1.287368, 1, 0.1215686, 0, 1,
-2.10122, 0.2476707, -1.081879, 1, 0.1254902, 0, 1,
-2.065631, -0.5456415, -1.160319, 1, 0.1333333, 0, 1,
-2.05072, -1.62812, -2.150833, 1, 0.1372549, 0, 1,
-2.031817, 0.8807299, -0.8991305, 1, 0.145098, 0, 1,
-2.020669, 0.7359753, -3.089992, 1, 0.1490196, 0, 1,
-2.018823, 0.7277445, -2.437727, 1, 0.1568628, 0, 1,
-1.998757, 0.9151634, -1.001663, 1, 0.1607843, 0, 1,
-1.92836, -0.4106103, -0.536301, 1, 0.1686275, 0, 1,
-1.906625, -2.497833, -0.6617215, 1, 0.172549, 0, 1,
-1.893399, 0.6317254, -2.638241, 1, 0.1803922, 0, 1,
-1.891493, -1.818931, -3.42436, 1, 0.1843137, 0, 1,
-1.883408, -0.7098237, -0.3415974, 1, 0.1921569, 0, 1,
-1.872858, -0.6542329, -2.686204, 1, 0.1960784, 0, 1,
-1.871997, 1.04034, 0.688454, 1, 0.2039216, 0, 1,
-1.867143, -0.1966583, -2.386938, 1, 0.2117647, 0, 1,
-1.860641, 0.397805, -2.257758, 1, 0.2156863, 0, 1,
-1.824595, -0.4829521, -0.4542797, 1, 0.2235294, 0, 1,
-1.805319, 0.1403282, -1.59909, 1, 0.227451, 0, 1,
-1.789494, -0.1899868, -1.754488, 1, 0.2352941, 0, 1,
-1.784059, -1.219614, -2.355082, 1, 0.2392157, 0, 1,
-1.778097, 0.166075, -1.828809, 1, 0.2470588, 0, 1,
-1.77167, -2.426743, -1.415388, 1, 0.2509804, 0, 1,
-1.769629, -0.5221218, -3.305233, 1, 0.2588235, 0, 1,
-1.764927, 1.278128, -0.7324186, 1, 0.2627451, 0, 1,
-1.761097, -0.1469527, -1.220406, 1, 0.2705882, 0, 1,
-1.757847, -0.4944271, -1.906821, 1, 0.2745098, 0, 1,
-1.75636, -0.5114138, -1.880597, 1, 0.282353, 0, 1,
-1.749647, 1.308937, -1.983326, 1, 0.2862745, 0, 1,
-1.732833, -0.7334298, -1.579031, 1, 0.2941177, 0, 1,
-1.719192, 0.4814233, -1.730327, 1, 0.3019608, 0, 1,
-1.703538, -0.2968424, -2.34614, 1, 0.3058824, 0, 1,
-1.694177, 0.3768671, -1.446662, 1, 0.3137255, 0, 1,
-1.688713, -1.819239, -2.274085, 1, 0.3176471, 0, 1,
-1.686161, -0.5138415, -2.122838, 1, 0.3254902, 0, 1,
-1.646391, -1.486854, -4.238605, 1, 0.3294118, 0, 1,
-1.627011, 0.5784288, -1.272907, 1, 0.3372549, 0, 1,
-1.626173, 0.5679331, -1.565193, 1, 0.3411765, 0, 1,
-1.624742, -0.4595958, -3.092551, 1, 0.3490196, 0, 1,
-1.620196, 0.4612395, -1.37489, 1, 0.3529412, 0, 1,
-1.609229, -1.416477, -2.370647, 1, 0.3607843, 0, 1,
-1.584613, 0.1066311, -1.518907, 1, 0.3647059, 0, 1,
-1.574486, -0.7836402, -1.427542, 1, 0.372549, 0, 1,
-1.570889, 0.2017263, -2.908818, 1, 0.3764706, 0, 1,
-1.567368, -1.312803, -1.711742, 1, 0.3843137, 0, 1,
-1.545359, 0.7094833, -1.230078, 1, 0.3882353, 0, 1,
-1.51131, -0.9652568, -2.973465, 1, 0.3960784, 0, 1,
-1.495922, 1.921463, 0.05091251, 1, 0.4039216, 0, 1,
-1.494577, -0.6921812, -3.649473, 1, 0.4078431, 0, 1,
-1.483278, -0.8455748, -2.499427, 1, 0.4156863, 0, 1,
-1.477367, 2.62973, 1.268226, 1, 0.4196078, 0, 1,
-1.472766, 0.7224858, -1.360637, 1, 0.427451, 0, 1,
-1.451127, 0.5697274, 0.0253456, 1, 0.4313726, 0, 1,
-1.439686, -0.239281, -0.5114035, 1, 0.4392157, 0, 1,
-1.439116, 0.142914, -2.465356, 1, 0.4431373, 0, 1,
-1.433267, -0.7156512, -1.993135, 1, 0.4509804, 0, 1,
-1.427527, 0.7052075, -0.699092, 1, 0.454902, 0, 1,
-1.42242, -1.659366, -3.473733, 1, 0.4627451, 0, 1,
-1.421589, 1.074612, -1.651557, 1, 0.4666667, 0, 1,
-1.415288, -0.8600451, -1.681271, 1, 0.4745098, 0, 1,
-1.397432, 0.2452266, -1.191841, 1, 0.4784314, 0, 1,
-1.396689, -0.7798038, -1.487864, 1, 0.4862745, 0, 1,
-1.386657, -1.86052, -2.957711, 1, 0.4901961, 0, 1,
-1.382223, 0.6772418, -1.320608, 1, 0.4980392, 0, 1,
-1.36847, 0.4829327, -0.686999, 1, 0.5058824, 0, 1,
-1.342149, 1.805246, -0.2772637, 1, 0.509804, 0, 1,
-1.33219, 1.160187, -0.9128046, 1, 0.5176471, 0, 1,
-1.328735, -0.5111969, -1.485966, 1, 0.5215687, 0, 1,
-1.316267, -0.6748232, -2.25973, 1, 0.5294118, 0, 1,
-1.305747, 1.141767, -0.5202503, 1, 0.5333334, 0, 1,
-1.305342, -1.545608, -2.292542, 1, 0.5411765, 0, 1,
-1.291541, -0.5341004, -3.907173, 1, 0.5450981, 0, 1,
-1.285933, -0.1658881, -1.05819, 1, 0.5529412, 0, 1,
-1.280951, -0.9126071, -3.144138, 1, 0.5568628, 0, 1,
-1.280226, -0.2159178, -2.585536, 1, 0.5647059, 0, 1,
-1.27752, -1.408739, -1.251653, 1, 0.5686275, 0, 1,
-1.277397, -1.331933, -1.65092, 1, 0.5764706, 0, 1,
-1.275438, -0.2969011, -3.203725, 1, 0.5803922, 0, 1,
-1.266461, 0.5421176, -1.686, 1, 0.5882353, 0, 1,
-1.260641, 1.350858, -1.942859, 1, 0.5921569, 0, 1,
-1.248363, -0.3262159, -1.386999, 1, 0.6, 0, 1,
-1.223838, -0.5425978, -0.5605133, 1, 0.6078432, 0, 1,
-1.222188, 0.05988508, -2.163014, 1, 0.6117647, 0, 1,
-1.22199, -1.029313, -3.997454, 1, 0.6196079, 0, 1,
-1.221331, -0.2819094, -1.662344, 1, 0.6235294, 0, 1,
-1.218211, -0.1168979, -0.4622213, 1, 0.6313726, 0, 1,
-1.208634, -0.1307819, -1.079512, 1, 0.6352941, 0, 1,
-1.203894, -0.4755346, -4.338686, 1, 0.6431373, 0, 1,
-1.191307, 0.6203648, -1.35167, 1, 0.6470588, 0, 1,
-1.185702, -0.6539393, -1.669982, 1, 0.654902, 0, 1,
-1.181121, -1.659708, -0.5267841, 1, 0.6588235, 0, 1,
-1.18046, -1.562921, -4.476378, 1, 0.6666667, 0, 1,
-1.178714, 0.7759821, -1.867017, 1, 0.6705883, 0, 1,
-1.178357, -0.2005739, -0.980716, 1, 0.6784314, 0, 1,
-1.171601, -0.1999151, -1.058443, 1, 0.682353, 0, 1,
-1.166977, -0.2782579, -1.500233, 1, 0.6901961, 0, 1,
-1.166146, 0.7113365, -1.950475, 1, 0.6941177, 0, 1,
-1.158731, -0.4158652, -1.877984, 1, 0.7019608, 0, 1,
-1.15787, 0.4610619, -0.3838636, 1, 0.7098039, 0, 1,
-1.154887, 0.7996793, -1.495226, 1, 0.7137255, 0, 1,
-1.153874, -1.86854, -1.521862, 1, 0.7215686, 0, 1,
-1.153611, 0.9445771, -1.376667, 1, 0.7254902, 0, 1,
-1.149211, 0.3071664, -1.208404, 1, 0.7333333, 0, 1,
-1.146432, 1.379342, 1.316643, 1, 0.7372549, 0, 1,
-1.144865, -0.1522422, -1.763077, 1, 0.7450981, 0, 1,
-1.13886, 1.341483, -0.441729, 1, 0.7490196, 0, 1,
-1.135702, 0.0444053, -2.709688, 1, 0.7568628, 0, 1,
-1.13473, 1.161528, -0.8270379, 1, 0.7607843, 0, 1,
-1.12014, 0.409228, -1.35999, 1, 0.7686275, 0, 1,
-1.109938, 1.21805, -1.087704, 1, 0.772549, 0, 1,
-1.109897, 0.2977893, -1.310081, 1, 0.7803922, 0, 1,
-1.109728, -0.5296044, -2.831201, 1, 0.7843137, 0, 1,
-1.106932, -1.06213, -2.532522, 1, 0.7921569, 0, 1,
-1.106125, -0.5440404, -1.72857, 1, 0.7960784, 0, 1,
-1.103768, -2.134143, -3.101226, 1, 0.8039216, 0, 1,
-1.102746, -1.002216, -2.323791, 1, 0.8117647, 0, 1,
-1.100115, 0.04366073, -1.858717, 1, 0.8156863, 0, 1,
-1.096116, -0.1785859, -2.05684, 1, 0.8235294, 0, 1,
-1.087726, 1.053007, 0.4860894, 1, 0.827451, 0, 1,
-1.086806, 0.326847, -1.242225, 1, 0.8352941, 0, 1,
-1.085337, -1.730085, -0.1710885, 1, 0.8392157, 0, 1,
-1.082146, -0.3643587, -3.21713, 1, 0.8470588, 0, 1,
-1.078321, -0.9684954, -4.323231, 1, 0.8509804, 0, 1,
-1.07724, -0.966455, -1.056525, 1, 0.8588235, 0, 1,
-1.076124, -0.880712, -2.42516, 1, 0.8627451, 0, 1,
-1.069743, 0.9866018, -0.7618748, 1, 0.8705882, 0, 1,
-1.067525, 0.03316305, -1.289359, 1, 0.8745098, 0, 1,
-1.065098, -1.101462, -2.51591, 1, 0.8823529, 0, 1,
-1.063655, -1.028464, -1.860731, 1, 0.8862745, 0, 1,
-1.063472, -0.7776241, -1.818682, 1, 0.8941177, 0, 1,
-1.049258, -0.1435221, -0.4730639, 1, 0.8980392, 0, 1,
-1.045998, 0.375305, -0.535394, 1, 0.9058824, 0, 1,
-1.043631, 0.8300945, -0.1840606, 1, 0.9137255, 0, 1,
-1.042332, -0.4165741, -1.962922, 1, 0.9176471, 0, 1,
-1.023445, 1.108243, -1.266407, 1, 0.9254902, 0, 1,
-1.015085, -0.3132527, -1.03981, 1, 0.9294118, 0, 1,
-1.009163, 0.8771313, -2.214773, 1, 0.9372549, 0, 1,
-1.000355, 1.688877, -0.5565499, 1, 0.9411765, 0, 1,
-0.9968803, 0.2436863, 0.6851992, 1, 0.9490196, 0, 1,
-0.9902864, 1.543588, -0.2218042, 1, 0.9529412, 0, 1,
-0.9895341, -0.4503761, -2.823346, 1, 0.9607843, 0, 1,
-0.9886554, 0.9774343, -0.1004351, 1, 0.9647059, 0, 1,
-0.9862464, 1.220194, -1.237591, 1, 0.972549, 0, 1,
-0.9851314, -0.6552976, -2.559482, 1, 0.9764706, 0, 1,
-0.983454, 0.2245955, -0.792563, 1, 0.9843137, 0, 1,
-0.9820359, -0.3464616, -2.52464, 1, 0.9882353, 0, 1,
-0.9818265, -0.70619, -1.425021, 1, 0.9960784, 0, 1,
-0.9787712, 0.3423078, -0.4158532, 0.9960784, 1, 0, 1,
-0.9614667, -1.114782, -2.552102, 0.9921569, 1, 0, 1,
-0.9606929, 0.4554807, 0.2847711, 0.9843137, 1, 0, 1,
-0.9538592, 0.78411, 0.1794371, 0.9803922, 1, 0, 1,
-0.9513214, 0.5969537, -0.8445971, 0.972549, 1, 0, 1,
-0.944809, -1.486905, -2.909327, 0.9686275, 1, 0, 1,
-0.9376184, -0.767854, -3.672566, 0.9607843, 1, 0, 1,
-0.9352359, 0.1417531, 0.2875089, 0.9568627, 1, 0, 1,
-0.9344617, 0.9282789, -0.640996, 0.9490196, 1, 0, 1,
-0.932328, -0.5068921, -2.957095, 0.945098, 1, 0, 1,
-0.9319364, 0.8791472, -0.4067315, 0.9372549, 1, 0, 1,
-0.9318457, -0.7941102, -4.095285, 0.9333333, 1, 0, 1,
-0.9290822, 1.900466, 0.172039, 0.9254902, 1, 0, 1,
-0.9278161, -1.703054, -3.469641, 0.9215686, 1, 0, 1,
-0.9255193, 0.1170861, -2.703546, 0.9137255, 1, 0, 1,
-0.9104744, 0.5666721, 1.395827, 0.9098039, 1, 0, 1,
-0.9100111, 0.2981803, -2.092345, 0.9019608, 1, 0, 1,
-0.9055433, 1.123633, -2.209332, 0.8941177, 1, 0, 1,
-0.9051442, -0.4572004, -0.8307465, 0.8901961, 1, 0, 1,
-0.9022667, 1.130632, -0.9314921, 0.8823529, 1, 0, 1,
-0.8894959, -1.181832, -1.6681, 0.8784314, 1, 0, 1,
-0.8886085, 0.960456, 0.7484348, 0.8705882, 1, 0, 1,
-0.8827673, 1.218317, -0.5631343, 0.8666667, 1, 0, 1,
-0.8800842, 1.37873, 0.6998864, 0.8588235, 1, 0, 1,
-0.872256, -0.949461, -3.288793, 0.854902, 1, 0, 1,
-0.871757, 0.3039166, 0.3530403, 0.8470588, 1, 0, 1,
-0.868172, -1.104792, -3.175647, 0.8431373, 1, 0, 1,
-0.8534255, 1.009337, -1.689005, 0.8352941, 1, 0, 1,
-0.8524433, 0.8770797, -0.579773, 0.8313726, 1, 0, 1,
-0.8394358, -2.117883, -2.422547, 0.8235294, 1, 0, 1,
-0.831246, 1.153228, 1.429729, 0.8196079, 1, 0, 1,
-0.8281447, 0.6715389, -0.411555, 0.8117647, 1, 0, 1,
-0.8210937, -0.4519295, -1.800418, 0.8078431, 1, 0, 1,
-0.8193488, 1.403204, -0.3667582, 0.8, 1, 0, 1,
-0.8180674, -1.571115, -0.1699767, 0.7921569, 1, 0, 1,
-0.8071623, -0.03723348, -2.213872, 0.7882353, 1, 0, 1,
-0.8021029, -0.03826918, -3.882925, 0.7803922, 1, 0, 1,
-0.8017039, 0.7993461, -0.8716073, 0.7764706, 1, 0, 1,
-0.8009591, -0.1116495, -0.8685074, 0.7686275, 1, 0, 1,
-0.7914536, -0.83705, -3.490824, 0.7647059, 1, 0, 1,
-0.7883853, 2.229791, -2.337989, 0.7568628, 1, 0, 1,
-0.7878803, -0.3068578, -0.5690857, 0.7529412, 1, 0, 1,
-0.7856052, 0.3270211, -3.090225, 0.7450981, 1, 0, 1,
-0.7821205, -0.337825, -2.441216, 0.7411765, 1, 0, 1,
-0.7811314, -1.325555, -2.775598, 0.7333333, 1, 0, 1,
-0.7744572, 1.859296, 0.01312163, 0.7294118, 1, 0, 1,
-0.7734906, 0.2731905, -1.259223, 0.7215686, 1, 0, 1,
-0.7712372, 0.1407875, -1.262459, 0.7176471, 1, 0, 1,
-0.768136, -0.2130683, -3.576395, 0.7098039, 1, 0, 1,
-0.7613314, -0.1867976, -4.023513, 0.7058824, 1, 0, 1,
-0.7537954, -0.09074184, -2.52964, 0.6980392, 1, 0, 1,
-0.748354, 1.612468, -0.9273868, 0.6901961, 1, 0, 1,
-0.7435303, -0.8116793, -2.534898, 0.6862745, 1, 0, 1,
-0.7435065, -0.4541743, -2.939842, 0.6784314, 1, 0, 1,
-0.7413881, -0.9559957, -3.277891, 0.6745098, 1, 0, 1,
-0.7412559, -1.383502, -2.627588, 0.6666667, 1, 0, 1,
-0.73649, 0.2505378, -1.818835, 0.6627451, 1, 0, 1,
-0.734183, -2.61098, -1.367613, 0.654902, 1, 0, 1,
-0.7184669, -0.6843448, -2.793099, 0.6509804, 1, 0, 1,
-0.7176815, -0.1366995, -0.9210069, 0.6431373, 1, 0, 1,
-0.7128692, -0.9578298, -2.342457, 0.6392157, 1, 0, 1,
-0.712001, -0.4793824, -2.358432, 0.6313726, 1, 0, 1,
-0.7107612, 0.5240723, -2.489842, 0.627451, 1, 0, 1,
-0.7060676, -0.09665107, -3.820845, 0.6196079, 1, 0, 1,
-0.6987417, 0.9284533, -0.1724216, 0.6156863, 1, 0, 1,
-0.6980286, 0.1411119, -2.676319, 0.6078432, 1, 0, 1,
-0.6941814, 2.363034, -0.362967, 0.6039216, 1, 0, 1,
-0.6915577, 0.6499639, -0.9346816, 0.5960785, 1, 0, 1,
-0.6890597, -0.8619094, -1.479564, 0.5882353, 1, 0, 1,
-0.6852152, 0.4034107, -2.819957, 0.5843138, 1, 0, 1,
-0.6839614, -0.1267371, -1.81785, 0.5764706, 1, 0, 1,
-0.6803319, -0.1427141, -1.48939, 0.572549, 1, 0, 1,
-0.6757335, -0.469034, -3.015591, 0.5647059, 1, 0, 1,
-0.6654823, -2.049892, -3.984566, 0.5607843, 1, 0, 1,
-0.6604034, 0.4167373, -2.586717, 0.5529412, 1, 0, 1,
-0.6601623, 0.3004816, -1.296328, 0.5490196, 1, 0, 1,
-0.6514828, -0.2605107, -1.660856, 0.5411765, 1, 0, 1,
-0.6512409, -0.3588203, -2.96177, 0.5372549, 1, 0, 1,
-0.646109, -0.3130999, 0.08991428, 0.5294118, 1, 0, 1,
-0.6447116, 0.7183512, -0.4220701, 0.5254902, 1, 0, 1,
-0.641067, 0.1135372, -2.522243, 0.5176471, 1, 0, 1,
-0.638842, -1.009726, -4.033229, 0.5137255, 1, 0, 1,
-0.6364339, 0.08679957, -0.7961429, 0.5058824, 1, 0, 1,
-0.6179768, 0.8035991, 1.483646, 0.5019608, 1, 0, 1,
-0.615244, -0.662243, -4.087633, 0.4941176, 1, 0, 1,
-0.6139092, 1.318664, 0.505517, 0.4862745, 1, 0, 1,
-0.6068883, -0.5524463, -3.070704, 0.4823529, 1, 0, 1,
-0.6054355, -3.164778, -2.951915, 0.4745098, 1, 0, 1,
-0.5951924, -1.183338, -2.69734, 0.4705882, 1, 0, 1,
-0.5913859, -0.4310192, -3.206281, 0.4627451, 1, 0, 1,
-0.5903416, 2.431866, -1.358894, 0.4588235, 1, 0, 1,
-0.5834797, -1.184243, -4.000601, 0.4509804, 1, 0, 1,
-0.5793973, -1.333555, -2.371272, 0.4470588, 1, 0, 1,
-0.573825, -0.6725098, -1.124341, 0.4392157, 1, 0, 1,
-0.5694281, 1.520182, -0.6416489, 0.4352941, 1, 0, 1,
-0.5623772, 0.02702949, -1.830812, 0.427451, 1, 0, 1,
-0.5613076, -1.122608, -4.47628, 0.4235294, 1, 0, 1,
-0.5607246, -1.190229, -4.797821, 0.4156863, 1, 0, 1,
-0.557271, 1.548388, -1.523884, 0.4117647, 1, 0, 1,
-0.5554835, 0.5553487, -0.2497986, 0.4039216, 1, 0, 1,
-0.5548525, 0.001555017, 0.2000052, 0.3960784, 1, 0, 1,
-0.5469019, -0.6171023, -2.056695, 0.3921569, 1, 0, 1,
-0.5465373, 0.2485919, -1.940835, 0.3843137, 1, 0, 1,
-0.546423, 0.1512631, -0.6063327, 0.3803922, 1, 0, 1,
-0.5414838, -1.152995, -2.591277, 0.372549, 1, 0, 1,
-0.5368205, 0.1314137, -2.145281, 0.3686275, 1, 0, 1,
-0.5364798, 0.1131771, -0.8159304, 0.3607843, 1, 0, 1,
-0.5340314, 0.9939176, -0.5437605, 0.3568628, 1, 0, 1,
-0.5336161, -0.01485768, -2.136361, 0.3490196, 1, 0, 1,
-0.5294737, -0.07055968, -1.725085, 0.345098, 1, 0, 1,
-0.5157701, 1.420691, -1.739816, 0.3372549, 1, 0, 1,
-0.5066916, -0.02060525, -2.506572, 0.3333333, 1, 0, 1,
-0.5053283, 0.5137584, -0.9875574, 0.3254902, 1, 0, 1,
-0.5027214, 1.09527, 0.6625826, 0.3215686, 1, 0, 1,
-0.5016097, 2.454557, 0.02777421, 0.3137255, 1, 0, 1,
-0.4997396, 0.6019404, -0.3772883, 0.3098039, 1, 0, 1,
-0.4964457, -0.5490344, -1.097866, 0.3019608, 1, 0, 1,
-0.4960862, -0.6676697, -3.234377, 0.2941177, 1, 0, 1,
-0.4926727, -0.5766686, -1.215668, 0.2901961, 1, 0, 1,
-0.4919362, -1.443947, -2.385677, 0.282353, 1, 0, 1,
-0.488935, -1.43194, -4.018144, 0.2784314, 1, 0, 1,
-0.4878771, -0.4095469, -1.450812, 0.2705882, 1, 0, 1,
-0.4865775, -0.7157155, -2.302417, 0.2666667, 1, 0, 1,
-0.4863734, -0.6867563, -2.765413, 0.2588235, 1, 0, 1,
-0.4799473, 0.5004404, 0.3312781, 0.254902, 1, 0, 1,
-0.4787502, 0.01464133, -1.06266, 0.2470588, 1, 0, 1,
-0.4775007, -0.6321625, -3.714174, 0.2431373, 1, 0, 1,
-0.4754866, 0.2739845, -2.095828, 0.2352941, 1, 0, 1,
-0.4716377, -1.144346, -2.694854, 0.2313726, 1, 0, 1,
-0.4691324, 0.08611191, -0.2001002, 0.2235294, 1, 0, 1,
-0.4666345, 1.468687, 0.4874105, 0.2196078, 1, 0, 1,
-0.465741, 0.256006, -0.9106573, 0.2117647, 1, 0, 1,
-0.4651603, 0.4935785, -1.303835, 0.2078431, 1, 0, 1,
-0.4632594, -0.02428074, -1.30004, 0.2, 1, 0, 1,
-0.4613273, 0.2874248, -2.341887, 0.1921569, 1, 0, 1,
-0.4597647, -0.08820227, -2.467233, 0.1882353, 1, 0, 1,
-0.4580658, -0.5880561, -4.143639, 0.1803922, 1, 0, 1,
-0.4563703, 0.1806983, -0.05042244, 0.1764706, 1, 0, 1,
-0.4559298, 0.8852414, 0.3803747, 0.1686275, 1, 0, 1,
-0.4532597, -0.03073412, -2.057922, 0.1647059, 1, 0, 1,
-0.4495962, 0.693762, 0.01294192, 0.1568628, 1, 0, 1,
-0.4446343, -0.8713914, -3.085801, 0.1529412, 1, 0, 1,
-0.4428198, -0.7351419, -1.725328, 0.145098, 1, 0, 1,
-0.4423842, 0.3918284, -1.494907, 0.1411765, 1, 0, 1,
-0.4405361, -1.09487, -2.940965, 0.1333333, 1, 0, 1,
-0.4404926, -0.8989295, -1.540245, 0.1294118, 1, 0, 1,
-0.4380085, -0.04554076, -1.134568, 0.1215686, 1, 0, 1,
-0.435812, 0.3109985, -0.5815423, 0.1176471, 1, 0, 1,
-0.4291777, 3.245951, 1.135028, 0.1098039, 1, 0, 1,
-0.4291735, 0.6278563, -0.6185198, 0.1058824, 1, 0, 1,
-0.4275138, 0.3087293, 1.228253, 0.09803922, 1, 0, 1,
-0.4256452, 0.5428683, 0.7920559, 0.09019608, 1, 0, 1,
-0.4246908, 0.3981977, 0.0615675, 0.08627451, 1, 0, 1,
-0.4234146, 1.446518, -1.041638, 0.07843138, 1, 0, 1,
-0.42121, -0.0157591, -2.273503, 0.07450981, 1, 0, 1,
-0.4201832, -0.8249195, -2.38009, 0.06666667, 1, 0, 1,
-0.4187869, 0.07475924, 0.1652268, 0.0627451, 1, 0, 1,
-0.4168244, -1.444638, -2.952474, 0.05490196, 1, 0, 1,
-0.4141358, -1.291351, -3.98569, 0.05098039, 1, 0, 1,
-0.414133, -0.08143599, 0.7730893, 0.04313726, 1, 0, 1,
-0.405636, -1.452859, -2.486945, 0.03921569, 1, 0, 1,
-0.4026006, -0.4586867, -4.132815, 0.03137255, 1, 0, 1,
-0.3860739, -0.4111879, -1.563995, 0.02745098, 1, 0, 1,
-0.3842163, -0.7815297, -2.342535, 0.01960784, 1, 0, 1,
-0.3824888, 0.2399759, -2.019849, 0.01568628, 1, 0, 1,
-0.3798173, 0.7386318, 1.315458, 0.007843138, 1, 0, 1,
-0.3791851, -0.2204683, -2.234356, 0.003921569, 1, 0, 1,
-0.379074, 0.3346048, -1.313322, 0, 1, 0.003921569, 1,
-0.3787, -0.660475, -0.587726, 0, 1, 0.01176471, 1,
-0.3770143, 2.234645, -0.06095457, 0, 1, 0.01568628, 1,
-0.3749785, -0.8734089, -3.24868, 0, 1, 0.02352941, 1,
-0.3681929, -1.104838, -2.607566, 0, 1, 0.02745098, 1,
-0.3652781, 0.4205943, -0.5673357, 0, 1, 0.03529412, 1,
-0.3628622, 1.750759, 0.0351515, 0, 1, 0.03921569, 1,
-0.3615754, 0.8373169, -0.3262255, 0, 1, 0.04705882, 1,
-0.3606329, -0.955137, -3.724609, 0, 1, 0.05098039, 1,
-0.355827, -2.707062, -3.005922, 0, 1, 0.05882353, 1,
-0.3513732, -1.01159, -2.976111, 0, 1, 0.0627451, 1,
-0.3505583, 1.930935, -1.245196, 0, 1, 0.07058824, 1,
-0.3472664, -0.7011201, -3.060894, 0, 1, 0.07450981, 1,
-0.3443469, -0.1444837, -0.09692524, 0, 1, 0.08235294, 1,
-0.343676, -0.8311681, -2.315355, 0, 1, 0.08627451, 1,
-0.3392727, 0.9469894, -0.8722484, 0, 1, 0.09411765, 1,
-0.3353393, 1.086575, -0.6690959, 0, 1, 0.1019608, 1,
-0.3311096, -2.233677, -4.386562, 0, 1, 0.1058824, 1,
-0.3305976, -0.6417364, -2.988304, 0, 1, 0.1137255, 1,
-0.3295332, -0.1399374, -1.439296, 0, 1, 0.1176471, 1,
-0.3282503, 0.6962226, 0.66343, 0, 1, 0.1254902, 1,
-0.3263742, -1.389035, -3.610188, 0, 1, 0.1294118, 1,
-0.3260807, -0.5901722, -2.399918, 0, 1, 0.1372549, 1,
-0.3238022, 0.04176207, -2.061254, 0, 1, 0.1411765, 1,
-0.322387, 1.537756, -0.4786085, 0, 1, 0.1490196, 1,
-0.3158911, 0.4629808, -1.334785, 0, 1, 0.1529412, 1,
-0.312732, 1.312488, 0.4923985, 0, 1, 0.1607843, 1,
-0.3090535, -0.4863652, -2.158147, 0, 1, 0.1647059, 1,
-0.305905, -1.528074, -0.2983393, 0, 1, 0.172549, 1,
-0.2962659, 1.283471, -0.3750151, 0, 1, 0.1764706, 1,
-0.2957357, -1.169157, -3.050036, 0, 1, 0.1843137, 1,
-0.2931452, 1.067518, -0.8338832, 0, 1, 0.1882353, 1,
-0.2911893, 1.089903, -0.1624863, 0, 1, 0.1960784, 1,
-0.2911391, 0.5848576, 0.3004259, 0, 1, 0.2039216, 1,
-0.2852571, -2.159231, -3.009426, 0, 1, 0.2078431, 1,
-0.2811734, 1.232816, -0.8056737, 0, 1, 0.2156863, 1,
-0.2797987, -0.3390222, -2.174003, 0, 1, 0.2196078, 1,
-0.2794787, 1.172673, 2.297723, 0, 1, 0.227451, 1,
-0.2678466, 2.151142, 0.8262798, 0, 1, 0.2313726, 1,
-0.265667, 0.9767596, -0.5410727, 0, 1, 0.2392157, 1,
-0.2644642, 0.5331677, 2.010281, 0, 1, 0.2431373, 1,
-0.2599837, 0.1372462, -1.096414, 0, 1, 0.2509804, 1,
-0.2585267, -0.5275119, -1.946561, 0, 1, 0.254902, 1,
-0.2573138, -0.8599861, -2.254244, 0, 1, 0.2627451, 1,
-0.2565387, 0.4864768, -0.1745863, 0, 1, 0.2666667, 1,
-0.2563842, 0.9309705, 0.4883418, 0, 1, 0.2745098, 1,
-0.2537126, -0.4947375, -2.881022, 0, 1, 0.2784314, 1,
-0.2514237, -1.142512, -5.504326, 0, 1, 0.2862745, 1,
-0.2509743, 0.4963234, -1.22683, 0, 1, 0.2901961, 1,
-0.2504785, -0.8401654, -3.046156, 0, 1, 0.2980392, 1,
-0.2494895, 1.217495, 0.8799803, 0, 1, 0.3058824, 1,
-0.2487274, -0.1408917, -3.508285, 0, 1, 0.3098039, 1,
-0.2409108, 0.1953076, -0.1566486, 0, 1, 0.3176471, 1,
-0.2407387, 1.611011, -1.084797, 0, 1, 0.3215686, 1,
-0.2401249, 0.2582817, -1.844438, 0, 1, 0.3294118, 1,
-0.2380214, -0.3205311, -2.229988, 0, 1, 0.3333333, 1,
-0.2377826, 0.3003607, 0.9496814, 0, 1, 0.3411765, 1,
-0.2347007, 0.07500681, -1.258476, 0, 1, 0.345098, 1,
-0.2281183, 0.08632479, -0.1694539, 0, 1, 0.3529412, 1,
-0.2181317, 0.3050919, -0.1679307, 0, 1, 0.3568628, 1,
-0.2141067, 1.871915, 0.4723419, 0, 1, 0.3647059, 1,
-0.211746, 1.005043, -2.167909, 0, 1, 0.3686275, 1,
-0.2081196, 2.181972, -0.4877373, 0, 1, 0.3764706, 1,
-0.2026318, -0.6040268, -2.830617, 0, 1, 0.3803922, 1,
-0.1998296, 0.3202597, 0.3970693, 0, 1, 0.3882353, 1,
-0.1967469, -2.271212, -3.742513, 0, 1, 0.3921569, 1,
-0.1961576, -0.4815159, -3.672462, 0, 1, 0.4, 1,
-0.1959032, 0.522613, -0.4125924, 0, 1, 0.4078431, 1,
-0.1918133, 0.7971133, 0.5849575, 0, 1, 0.4117647, 1,
-0.1894277, -1.366019, -3.198106, 0, 1, 0.4196078, 1,
-0.1874934, 0.1182224, -0.3444686, 0, 1, 0.4235294, 1,
-0.1873577, 0.2054431, -1.971946, 0, 1, 0.4313726, 1,
-0.1822769, 0.7039892, -0.2354472, 0, 1, 0.4352941, 1,
-0.1803021, -0.2266944, -3.012378, 0, 1, 0.4431373, 1,
-0.1739201, -0.3078792, -3.054722, 0, 1, 0.4470588, 1,
-0.1658847, -0.211731, -4.414083, 0, 1, 0.454902, 1,
-0.1621486, -0.7731522, -2.757967, 0, 1, 0.4588235, 1,
-0.1616696, 0.1006705, -1.968507, 0, 1, 0.4666667, 1,
-0.1609901, 0.1691456, 0.2793665, 0, 1, 0.4705882, 1,
-0.1578932, -0.2649172, -2.01635, 0, 1, 0.4784314, 1,
-0.1578869, -0.4745929, -2.375165, 0, 1, 0.4823529, 1,
-0.1568488, 0.9065166, -0.3338828, 0, 1, 0.4901961, 1,
-0.1556623, -0.9922192, -2.894541, 0, 1, 0.4941176, 1,
-0.1519655, 0.3870395, -0.1453352, 0, 1, 0.5019608, 1,
-0.1503314, -0.2305132, -3.596876, 0, 1, 0.509804, 1,
-0.1502564, -0.4970302, -3.663702, 0, 1, 0.5137255, 1,
-0.1428907, 2.536044, -0.1971861, 0, 1, 0.5215687, 1,
-0.1392108, -0.4785764, -2.622181, 0, 1, 0.5254902, 1,
-0.1354104, 0.385329, 0.3462171, 0, 1, 0.5333334, 1,
-0.135324, -0.05856746, -0.3106906, 0, 1, 0.5372549, 1,
-0.1286013, -0.04909283, -3.002886, 0, 1, 0.5450981, 1,
-0.1278241, -1.739174, -3.814727, 0, 1, 0.5490196, 1,
-0.1263335, 0.6375712, -2.470619, 0, 1, 0.5568628, 1,
-0.1259245, -1.981237, -3.660733, 0, 1, 0.5607843, 1,
-0.1201333, 1.033369, 0.09941347, 0, 1, 0.5686275, 1,
-0.1132464, 1.388713, 0.04041633, 0, 1, 0.572549, 1,
-0.1131011, -0.7858876, -3.88764, 0, 1, 0.5803922, 1,
-0.1102457, 1.233784, -0.1660196, 0, 1, 0.5843138, 1,
-0.1098665, 2.099984, -0.4670016, 0, 1, 0.5921569, 1,
-0.1085067, 1.819358, -0.3580631, 0, 1, 0.5960785, 1,
-0.1081889, -0.5452341, -2.000349, 0, 1, 0.6039216, 1,
-0.1080291, 0.4666921, 0.5734791, 0, 1, 0.6117647, 1,
-0.1069443, -0.2692972, -2.701148, 0, 1, 0.6156863, 1,
-0.1067443, 1.150405, -0.1553793, 0, 1, 0.6235294, 1,
-0.09556378, 0.720531, -2.005918, 0, 1, 0.627451, 1,
-0.09323008, -0.2554657, -1.27312, 0, 1, 0.6352941, 1,
-0.09073152, -0.5660452, -3.299684, 0, 1, 0.6392157, 1,
-0.08940387, -0.3204554, -2.711613, 0, 1, 0.6470588, 1,
-0.08859088, -0.1047753, -2.036192, 0, 1, 0.6509804, 1,
-0.08372674, -0.62159, -3.688345, 0, 1, 0.6588235, 1,
-0.08238897, 0.2628038, 0.5240848, 0, 1, 0.6627451, 1,
-0.08164232, 1.566861, -0.1494677, 0, 1, 0.6705883, 1,
-0.0812049, 0.580855, 0.2239659, 0, 1, 0.6745098, 1,
-0.07726866, -0.8457465, -2.671375, 0, 1, 0.682353, 1,
-0.07633199, -0.5365306, -2.633593, 0, 1, 0.6862745, 1,
-0.07277543, -0.05678739, -1.607968, 0, 1, 0.6941177, 1,
-0.07262838, 0.1305414, -0.365049, 0, 1, 0.7019608, 1,
-0.07247169, -0.8634533, -3.647945, 0, 1, 0.7058824, 1,
-0.06547895, 1.072499, 2.837076, 0, 1, 0.7137255, 1,
-0.06421562, -0.3826628, -4.084429, 0, 1, 0.7176471, 1,
-0.06256393, -1.090047, -3.234582, 0, 1, 0.7254902, 1,
-0.0604232, -0.6246199, -2.681463, 0, 1, 0.7294118, 1,
-0.05398652, -2.150971, -4.536474, 0, 1, 0.7372549, 1,
-0.04661109, -0.8468902, -2.200547, 0, 1, 0.7411765, 1,
-0.04577278, -0.4461476, -5.91127, 0, 1, 0.7490196, 1,
-0.0427517, -2.242076, -1.525683, 0, 1, 0.7529412, 1,
-0.04251006, 0.936478, -0.2235872, 0, 1, 0.7607843, 1,
-0.04236001, -0.1935893, -3.815119, 0, 1, 0.7647059, 1,
-0.04224824, -0.6301849, -2.548295, 0, 1, 0.772549, 1,
-0.04183511, -0.2471022, -4.340089, 0, 1, 0.7764706, 1,
-0.03747415, 0.6151419, -1.555784, 0, 1, 0.7843137, 1,
-0.03519999, -1.791029, -3.145499, 0, 1, 0.7882353, 1,
-0.03484722, -1.566704, -2.490691, 0, 1, 0.7960784, 1,
-0.03398425, -1.452471, -4.313643, 0, 1, 0.8039216, 1,
-0.03324196, 0.3205794, -0.1885259, 0, 1, 0.8078431, 1,
-0.03304452, -0.7055832, -4.341037, 0, 1, 0.8156863, 1,
-0.03209296, -0.9010599, -4.216475, 0, 1, 0.8196079, 1,
-0.03002484, -0.06622217, -2.124762, 0, 1, 0.827451, 1,
-0.02344898, -0.5416195, -4.423591, 0, 1, 0.8313726, 1,
-0.02054958, -1.429379, -3.684048, 0, 1, 0.8392157, 1,
-0.02006718, -0.07938188, -2.307946, 0, 1, 0.8431373, 1,
-0.01597605, -1.651079, -3.702956, 0, 1, 0.8509804, 1,
-0.01539262, -0.150397, -4.291767, 0, 1, 0.854902, 1,
-0.01342856, 1.207694, -0.8515193, 0, 1, 0.8627451, 1,
-0.01213432, -1.366077, -3.700615, 0, 1, 0.8666667, 1,
-0.007708184, -1.230769, -3.224578, 0, 1, 0.8745098, 1,
-0.0006727631, -0.1789208, -3.082011, 0, 1, 0.8784314, 1,
0.00147268, -1.729765, 2.903568, 0, 1, 0.8862745, 1,
0.002518759, 0.8743728, 1.156505, 0, 1, 0.8901961, 1,
0.006152476, 0.713648, 0.2973101, 0, 1, 0.8980392, 1,
0.008573176, 0.2419327, 0.6505392, 0, 1, 0.9058824, 1,
0.01354911, -0.01750142, 2.866432, 0, 1, 0.9098039, 1,
0.02094349, -1.214672, 2.889131, 0, 1, 0.9176471, 1,
0.02448847, 0.5273688, 0.9538293, 0, 1, 0.9215686, 1,
0.02472444, -0.4286716, 3.58851, 0, 1, 0.9294118, 1,
0.02549621, 0.6238698, -0.8952345, 0, 1, 0.9333333, 1,
0.02740439, -0.1539578, 3.315411, 0, 1, 0.9411765, 1,
0.02840173, 0.1141232, 0.3897513, 0, 1, 0.945098, 1,
0.02882788, -2.352046, 4.235653, 0, 1, 0.9529412, 1,
0.02956707, -0.8795879, 2.188993, 0, 1, 0.9568627, 1,
0.03119612, 0.7847366, 0.3194659, 0, 1, 0.9647059, 1,
0.03183379, 0.8422757, -0.7836645, 0, 1, 0.9686275, 1,
0.03422608, 1.410498, -1.400813, 0, 1, 0.9764706, 1,
0.03548772, -0.1778674, 2.98075, 0, 1, 0.9803922, 1,
0.03927971, -1.298343, 2.045828, 0, 1, 0.9882353, 1,
0.04135587, 0.6455159, 0.4109719, 0, 1, 0.9921569, 1,
0.04548592, 1.536532, 0.03464457, 0, 1, 1, 1,
0.04678575, 0.7536108, 0.6502171, 0, 0.9921569, 1, 1,
0.04831373, -0.1910579, 1.077887, 0, 0.9882353, 1, 1,
0.0491613, 0.01660296, 2.044476, 0, 0.9803922, 1, 1,
0.04997603, 0.1191009, -0.06248949, 0, 0.9764706, 1, 1,
0.05012591, -1.792361, 3.543638, 0, 0.9686275, 1, 1,
0.05198465, -1.429955, 3.584457, 0, 0.9647059, 1, 1,
0.05266094, -2.378407, 2.244384, 0, 0.9568627, 1, 1,
0.05488718, 0.4036904, -0.2384525, 0, 0.9529412, 1, 1,
0.05875594, -1.898772, 0.3771566, 0, 0.945098, 1, 1,
0.05967758, -0.9306003, 4.891547, 0, 0.9411765, 1, 1,
0.06101616, -0.7478414, 3.742502, 0, 0.9333333, 1, 1,
0.06601224, 0.4379351, -0.2906284, 0, 0.9294118, 1, 1,
0.07078041, -0.00661543, 0.9233852, 0, 0.9215686, 1, 1,
0.07212381, -1.085324, 3.039212, 0, 0.9176471, 1, 1,
0.07562075, -0.8370584, 2.473449, 0, 0.9098039, 1, 1,
0.07780106, 1.386646, -0.3234502, 0, 0.9058824, 1, 1,
0.0793646, -0.3881104, 2.228083, 0, 0.8980392, 1, 1,
0.08231802, -1.104651, 2.00226, 0, 0.8901961, 1, 1,
0.08642716, -0.466554, 4.556973, 0, 0.8862745, 1, 1,
0.08734877, -0.4078507, 4.018678, 0, 0.8784314, 1, 1,
0.08822265, 0.3542861, 0.2893829, 0, 0.8745098, 1, 1,
0.08847495, -1.373575, 3.740634, 0, 0.8666667, 1, 1,
0.08980671, -0.3061695, 3.291925, 0, 0.8627451, 1, 1,
0.09030781, 1.15932, 0.3518559, 0, 0.854902, 1, 1,
0.09531453, -0.3136807, 3.118819, 0, 0.8509804, 1, 1,
0.09756184, -0.6157416, 2.650154, 0, 0.8431373, 1, 1,
0.1001342, 0.2853483, 0.5077852, 0, 0.8392157, 1, 1,
0.1027891, 0.2591673, -1.038593, 0, 0.8313726, 1, 1,
0.1043742, -0.7072872, 5.499384, 0, 0.827451, 1, 1,
0.1090249, -1.815611, 3.074689, 0, 0.8196079, 1, 1,
0.1125097, -0.2039692, 3.511425, 0, 0.8156863, 1, 1,
0.1126858, -0.5053343, 1.731014, 0, 0.8078431, 1, 1,
0.117363, 0.4185017, 1.169153, 0, 0.8039216, 1, 1,
0.118829, 0.8095405, 0.5644943, 0, 0.7960784, 1, 1,
0.1200427, -0.2585395, 3.902699, 0, 0.7882353, 1, 1,
0.120372, -0.8375683, 2.045892, 0, 0.7843137, 1, 1,
0.1225784, -1.236692, 2.79603, 0, 0.7764706, 1, 1,
0.1231555, 0.8717123, 0.6567018, 0, 0.772549, 1, 1,
0.1256717, -0.5527527, 3.4191, 0, 0.7647059, 1, 1,
0.1270553, 3.10419, -0.4259989, 0, 0.7607843, 1, 1,
0.1285148, 0.691938, -0.04981417, 0, 0.7529412, 1, 1,
0.1294166, 0.5273669, -0.8543444, 0, 0.7490196, 1, 1,
0.1326635, -2.094712, 2.513085, 0, 0.7411765, 1, 1,
0.1336071, 1.230944, 0.3556012, 0, 0.7372549, 1, 1,
0.1345941, -0.6128721, 3.02574, 0, 0.7294118, 1, 1,
0.1376944, 0.1200346, 0.2909845, 0, 0.7254902, 1, 1,
0.1395175, 0.110713, 1.179906, 0, 0.7176471, 1, 1,
0.1401105, -0.5238361, 0.3393805, 0, 0.7137255, 1, 1,
0.1412155, 1.565863, 0.8607836, 0, 0.7058824, 1, 1,
0.1416, 0.6581084, 1.023447, 0, 0.6980392, 1, 1,
0.1443271, 1.858676, -1.968896, 0, 0.6941177, 1, 1,
0.1453656, 1.187248, 0.1994086, 0, 0.6862745, 1, 1,
0.1462299, 1.278241, 0.4894731, 0, 0.682353, 1, 1,
0.1469142, 0.4020577, -0.06757519, 0, 0.6745098, 1, 1,
0.1498957, 1.569919, 0.3517128, 0, 0.6705883, 1, 1,
0.1533559, 0.6706927, -0.2554128, 0, 0.6627451, 1, 1,
0.1564385, -1.87541, 3.813748, 0, 0.6588235, 1, 1,
0.1631417, -0.2115269, 3.004736, 0, 0.6509804, 1, 1,
0.1648452, 1.327724, 0.840035, 0, 0.6470588, 1, 1,
0.170881, 2.186803, -1.571999, 0, 0.6392157, 1, 1,
0.1779181, 0.3525403, -0.7094341, 0, 0.6352941, 1, 1,
0.1808652, -1.283448, 4.687016, 0, 0.627451, 1, 1,
0.18193, -0.4262015, 2.764624, 0, 0.6235294, 1, 1,
0.184129, -0.9519421, 3.164396, 0, 0.6156863, 1, 1,
0.1864538, 0.09751292, 1.34061, 0, 0.6117647, 1, 1,
0.1882198, -1.180847, 2.974403, 0, 0.6039216, 1, 1,
0.1889675, 0.6415085, -2.249913, 0, 0.5960785, 1, 1,
0.192604, -0.6148403, 1.350715, 0, 0.5921569, 1, 1,
0.1932747, 1.457687, 0.7605774, 0, 0.5843138, 1, 1,
0.1942916, 1.301895, 1.321529, 0, 0.5803922, 1, 1,
0.1948252, -1.328832, 3.495614, 0, 0.572549, 1, 1,
0.1954021, -1.346661, 4.076757, 0, 0.5686275, 1, 1,
0.1969332, 0.7722499, -0.8293946, 0, 0.5607843, 1, 1,
0.1989482, 0.4910804, 1.927682, 0, 0.5568628, 1, 1,
0.1998762, -0.5723199, 1.915, 0, 0.5490196, 1, 1,
0.2008114, -0.1432552, 0.7876683, 0, 0.5450981, 1, 1,
0.2018688, 0.7004939, 0.7610211, 0, 0.5372549, 1, 1,
0.210146, -1.423878, 1.205107, 0, 0.5333334, 1, 1,
0.211018, -0.9269935, 3.122054, 0, 0.5254902, 1, 1,
0.2141338, 0.2052131, 1.545313, 0, 0.5215687, 1, 1,
0.2211523, -0.6753566, 2.154874, 0, 0.5137255, 1, 1,
0.2245821, -1.196775, 5.070937, 0, 0.509804, 1, 1,
0.2266902, 0.327741, 1.570469, 0, 0.5019608, 1, 1,
0.2306089, -0.6357731, 3.740525, 0, 0.4941176, 1, 1,
0.2333977, 1.280339, 0.1714809, 0, 0.4901961, 1, 1,
0.2394904, 0.8262398, -0.6533388, 0, 0.4823529, 1, 1,
0.2453566, 2.327513, 0.5119967, 0, 0.4784314, 1, 1,
0.2454033, -0.8853558, 0.9509222, 0, 0.4705882, 1, 1,
0.2467205, -1.021401, 1.154458, 0, 0.4666667, 1, 1,
0.2525743, 1.266323, -1.135128, 0, 0.4588235, 1, 1,
0.2538845, -0.7174643, 1.397235, 0, 0.454902, 1, 1,
0.2562261, -0.3794606, 1.663027, 0, 0.4470588, 1, 1,
0.258545, -0.5758654, 2.97862, 0, 0.4431373, 1, 1,
0.2587463, 1.116782, -0.5594884, 0, 0.4352941, 1, 1,
0.2599198, -1.348676, 2.747986, 0, 0.4313726, 1, 1,
0.2641681, -0.09359433, 2.434712, 0, 0.4235294, 1, 1,
0.2677086, 0.4094483, 1.454279, 0, 0.4196078, 1, 1,
0.2689615, 1.726929, -0.05399242, 0, 0.4117647, 1, 1,
0.2703097, -1.097948, 3.020294, 0, 0.4078431, 1, 1,
0.2798688, 0.9373484, 0.4027749, 0, 0.4, 1, 1,
0.2804621, -1.095165, 4.755803, 0, 0.3921569, 1, 1,
0.2819058, 1.560623, 0.1102572, 0, 0.3882353, 1, 1,
0.2856421, -0.2400816, 2.478792, 0, 0.3803922, 1, 1,
0.2869652, -0.7978935, 2.871022, 0, 0.3764706, 1, 1,
0.2875077, -0.9052124, 2.972373, 0, 0.3686275, 1, 1,
0.2917485, 1.049448, 1.339702, 0, 0.3647059, 1, 1,
0.2920257, -0.910579, 1.626766, 0, 0.3568628, 1, 1,
0.2938446, 1.714176, 1.915036, 0, 0.3529412, 1, 1,
0.295393, -0.5536249, 1.183346, 0, 0.345098, 1, 1,
0.2968416, -0.2390953, 0.4444912, 0, 0.3411765, 1, 1,
0.2972796, -0.2693901, 4.839911, 0, 0.3333333, 1, 1,
0.2995175, 0.4540391, -1.734596, 0, 0.3294118, 1, 1,
0.3016096, -0.4646949, 3.907888, 0, 0.3215686, 1, 1,
0.3057559, 1.847025, 0.2006848, 0, 0.3176471, 1, 1,
0.3090762, 0.3989705, -0.2608639, 0, 0.3098039, 1, 1,
0.3118541, -1.082172, 2.502635, 0, 0.3058824, 1, 1,
0.3139745, 0.7596381, 0.3135129, 0, 0.2980392, 1, 1,
0.3142313, 1.335495, 0.3026341, 0, 0.2901961, 1, 1,
0.3150787, -0.04767196, 1.077744, 0, 0.2862745, 1, 1,
0.3185256, 0.2470811, 2.046856, 0, 0.2784314, 1, 1,
0.3209751, -0.6700548, 2.55997, 0, 0.2745098, 1, 1,
0.3225094, -0.2908936, 0.8328265, 0, 0.2666667, 1, 1,
0.3225779, -0.5226709, 1.987444, 0, 0.2627451, 1, 1,
0.3234077, 0.4367699, 0.2627747, 0, 0.254902, 1, 1,
0.3277748, 0.1118884, 2.85417, 0, 0.2509804, 1, 1,
0.3314667, -1.018646, 2.560081, 0, 0.2431373, 1, 1,
0.3321099, -0.8092908, 3.39997, 0, 0.2392157, 1, 1,
0.3339018, 0.7205669, 2.04658, 0, 0.2313726, 1, 1,
0.3356889, -0.335525, 0.7277167, 0, 0.227451, 1, 1,
0.3360097, -0.8382814, 3.057225, 0, 0.2196078, 1, 1,
0.3403557, -0.8451335, 2.642938, 0, 0.2156863, 1, 1,
0.3427354, -0.7158218, 2.99192, 0, 0.2078431, 1, 1,
0.346711, 1.001269, -0.7969371, 0, 0.2039216, 1, 1,
0.3509898, 0.3109261, 1.290477, 0, 0.1960784, 1, 1,
0.3522338, 0.6194157, 1.20353, 0, 0.1882353, 1, 1,
0.3610227, 0.2077556, 1.363422, 0, 0.1843137, 1, 1,
0.3712491, 1.150979, 0.6107543, 0, 0.1764706, 1, 1,
0.37388, -0.9675273, 2.200267, 0, 0.172549, 1, 1,
0.3738819, 1.3922, 0.6852285, 0, 0.1647059, 1, 1,
0.3739649, -0.1306642, 1.425649, 0, 0.1607843, 1, 1,
0.3754008, 0.5107293, -0.1456464, 0, 0.1529412, 1, 1,
0.37651, -1.691189, 2.741984, 0, 0.1490196, 1, 1,
0.3770413, 0.007130994, 1.116504, 0, 0.1411765, 1, 1,
0.3792319, -0.5515087, 2.602555, 0, 0.1372549, 1, 1,
0.3806143, 0.6459383, 1.170498, 0, 0.1294118, 1, 1,
0.3817421, -0.5600945, 1.188071, 0, 0.1254902, 1, 1,
0.3846556, 2.30856, -0.07681151, 0, 0.1176471, 1, 1,
0.3902348, 2.653449, 0.7138115, 0, 0.1137255, 1, 1,
0.3940781, -0.6388254, 3.176569, 0, 0.1058824, 1, 1,
0.397187, 1.206225, 1.032387, 0, 0.09803922, 1, 1,
0.3999793, -1.087492, 3.096213, 0, 0.09411765, 1, 1,
0.4000832, -0.692129, 4.28881, 0, 0.08627451, 1, 1,
0.403793, 0.558889, -0.4690086, 0, 0.08235294, 1, 1,
0.4085764, -0.1753242, 2.95241, 0, 0.07450981, 1, 1,
0.4110189, -0.8597077, 1.991728, 0, 0.07058824, 1, 1,
0.4111366, 0.8736148, 1.188906, 0, 0.0627451, 1, 1,
0.4122655, 0.4558796, 2.18732, 0, 0.05882353, 1, 1,
0.4157934, 0.08523609, 0.9806004, 0, 0.05098039, 1, 1,
0.417923, 0.8352452, 0.08749937, 0, 0.04705882, 1, 1,
0.4195928, 0.05439467, 0.4756522, 0, 0.03921569, 1, 1,
0.421425, 2.943696, 2.397478, 0, 0.03529412, 1, 1,
0.4224943, -0.748394, 1.138196, 0, 0.02745098, 1, 1,
0.4256864, 0.6596179, 2.075024, 0, 0.02352941, 1, 1,
0.4269316, 0.821769, 0.0559097, 0, 0.01568628, 1, 1,
0.427762, -0.1555625, 1.052278, 0, 0.01176471, 1, 1,
0.4281028, 0.6834164, -1.013628, 0, 0.003921569, 1, 1,
0.4333974, -0.9471701, 3.629652, 0.003921569, 0, 1, 1,
0.4353516, -0.8862385, 1.417769, 0.007843138, 0, 1, 1,
0.4368379, 0.5728906, -0.2291158, 0.01568628, 0, 1, 1,
0.4378492, -0.3633694, 3.041009, 0.01960784, 0, 1, 1,
0.4393388, 1.559361, -1.359342, 0.02745098, 0, 1, 1,
0.4463803, 0.1390396, 1.655283, 0.03137255, 0, 1, 1,
0.4474151, 0.7231627, 0.7903652, 0.03921569, 0, 1, 1,
0.4475877, 1.316574, 1.002522, 0.04313726, 0, 1, 1,
0.4501691, -1.63577, 3.341485, 0.05098039, 0, 1, 1,
0.4538569, -0.9925209, 3.624324, 0.05490196, 0, 1, 1,
0.4581703, -0.8745346, 2.056733, 0.0627451, 0, 1, 1,
0.4585626, 1.137827, -0.1904483, 0.06666667, 0, 1, 1,
0.4615442, 0.483371, 0.2523317, 0.07450981, 0, 1, 1,
0.4632131, 0.5643883, 0.1920561, 0.07843138, 0, 1, 1,
0.4701907, -0.2188958, 1.546189, 0.08627451, 0, 1, 1,
0.4748244, -0.4459782, 2.863966, 0.09019608, 0, 1, 1,
0.4800681, 0.01258099, 1.527986, 0.09803922, 0, 1, 1,
0.480398, 1.089323, -0.040291, 0.1058824, 0, 1, 1,
0.4808331, 0.4950933, 1.636988, 0.1098039, 0, 1, 1,
0.482346, 0.3352027, 0.1265591, 0.1176471, 0, 1, 1,
0.4887602, 0.8958148, 0.8478771, 0.1215686, 0, 1, 1,
0.4921283, -0.388115, 2.173397, 0.1294118, 0, 1, 1,
0.495406, -0.9674881, 2.346736, 0.1333333, 0, 1, 1,
0.4959421, 0.8938418, 0.1128778, 0.1411765, 0, 1, 1,
0.498498, -0.7319317, 3.604976, 0.145098, 0, 1, 1,
0.5091595, -0.2707225, 1.417575, 0.1529412, 0, 1, 1,
0.5101778, 0.8243665, 0.4325458, 0.1568628, 0, 1, 1,
0.5147112, -1.022661, 3.085388, 0.1647059, 0, 1, 1,
0.5156448, 0.6513833, -0.3275512, 0.1686275, 0, 1, 1,
0.5166124, 0.09941629, 1.144739, 0.1764706, 0, 1, 1,
0.5212383, 0.6160684, 2.072838, 0.1803922, 0, 1, 1,
0.5251958, 1.841109, 0.2786057, 0.1882353, 0, 1, 1,
0.527033, -1.311613, 1.750819, 0.1921569, 0, 1, 1,
0.5297974, -2.588207, 3.903361, 0.2, 0, 1, 1,
0.5314352, 0.1186598, 1.499963, 0.2078431, 0, 1, 1,
0.5352809, 0.6637719, -0.3085309, 0.2117647, 0, 1, 1,
0.5363154, 0.190414, 0.1971997, 0.2196078, 0, 1, 1,
0.5368415, -0.1452766, 1.351239, 0.2235294, 0, 1, 1,
0.5376765, 0.3514457, 1.015515, 0.2313726, 0, 1, 1,
0.5397266, -2.810004, 4.315231, 0.2352941, 0, 1, 1,
0.5422574, -0.1340139, 1.319731, 0.2431373, 0, 1, 1,
0.5431945, -2.77649, 1.350857, 0.2470588, 0, 1, 1,
0.5483377, 0.3558108, 1.847008, 0.254902, 0, 1, 1,
0.5484656, -1.306962, 3.309996, 0.2588235, 0, 1, 1,
0.5499148, -0.2436089, 1.145044, 0.2666667, 0, 1, 1,
0.5502024, -1.396966, 3.998981, 0.2705882, 0, 1, 1,
0.5567361, 0.2559549, 0.253583, 0.2784314, 0, 1, 1,
0.5620497, 0.3070828, 1.520746, 0.282353, 0, 1, 1,
0.5676892, -0.1492326, 2.352729, 0.2901961, 0, 1, 1,
0.5695884, -1.689959, 4.740265, 0.2941177, 0, 1, 1,
0.5706118, 0.7822639, 0.1347478, 0.3019608, 0, 1, 1,
0.5711753, -0.2041156, 1.868876, 0.3098039, 0, 1, 1,
0.5717013, -0.3772656, 1.823402, 0.3137255, 0, 1, 1,
0.5724092, 1.195742, -0.6177444, 0.3215686, 0, 1, 1,
0.5733125, -0.9884404, 3.555462, 0.3254902, 0, 1, 1,
0.5737351, -1.229614, 4.13482, 0.3333333, 0, 1, 1,
0.5750074, 1.136228, -0.2656892, 0.3372549, 0, 1, 1,
0.575969, 1.98983, -0.2441011, 0.345098, 0, 1, 1,
0.5765269, 0.1424399, 1.278884, 0.3490196, 0, 1, 1,
0.5828745, 0.2193214, 0.6976173, 0.3568628, 0, 1, 1,
0.5854217, -2.96265, 3.323805, 0.3607843, 0, 1, 1,
0.5914811, 1.213451, -0.6041194, 0.3686275, 0, 1, 1,
0.5931449, 0.5428665, 2.500826, 0.372549, 0, 1, 1,
0.593685, 1.899769, -1.378487, 0.3803922, 0, 1, 1,
0.5957602, 0.324112, 0.6241472, 0.3843137, 0, 1, 1,
0.6060516, -1.184797, 2.803145, 0.3921569, 0, 1, 1,
0.6078213, -1.138017, 4.284571, 0.3960784, 0, 1, 1,
0.6135131, 1.478369, 1.947039, 0.4039216, 0, 1, 1,
0.6176984, 0.9275817, -1.411709, 0.4117647, 0, 1, 1,
0.6180072, 1.349808, 1.273692, 0.4156863, 0, 1, 1,
0.6191776, 1.067222, 0.8380201, 0.4235294, 0, 1, 1,
0.6207938, 0.6434067, 1.320809, 0.427451, 0, 1, 1,
0.6230472, 1.219677, 1.046317, 0.4352941, 0, 1, 1,
0.6349331, 0.5819276, 1.136841, 0.4392157, 0, 1, 1,
0.6352516, 0.2701629, 0.9889463, 0.4470588, 0, 1, 1,
0.642177, -0.8422356, 2.054701, 0.4509804, 0, 1, 1,
0.6423582, 0.6945311, 0.5195255, 0.4588235, 0, 1, 1,
0.6424904, -0.6123664, 2.195332, 0.4627451, 0, 1, 1,
0.643025, 0.1918128, 0.09444327, 0.4705882, 0, 1, 1,
0.6536214, -0.6294178, 2.202183, 0.4745098, 0, 1, 1,
0.6552894, -0.8164222, 2.413027, 0.4823529, 0, 1, 1,
0.6580483, -0.06026212, 1.829772, 0.4862745, 0, 1, 1,
0.65885, -0.2090587, 2.113211, 0.4941176, 0, 1, 1,
0.6603492, -0.3578243, 2.532893, 0.5019608, 0, 1, 1,
0.661437, -0.3549994, 1.958076, 0.5058824, 0, 1, 1,
0.6622456, 0.04166031, 0.01638312, 0.5137255, 0, 1, 1,
0.6635588, 2.199537, 0.3850652, 0.5176471, 0, 1, 1,
0.6659122, -0.753297, 1.297007, 0.5254902, 0, 1, 1,
0.6668276, 1.798643, 0.388978, 0.5294118, 0, 1, 1,
0.6799889, -0.1874867, 3.262228, 0.5372549, 0, 1, 1,
0.6832996, 0.6815295, 1.005016, 0.5411765, 0, 1, 1,
0.6859098, 0.221326, 0.9247358, 0.5490196, 0, 1, 1,
0.6875944, 1.095826, 0.04693653, 0.5529412, 0, 1, 1,
0.6894916, 2.033268, -0.2522368, 0.5607843, 0, 1, 1,
0.6957827, -0.3397645, 2.366076, 0.5647059, 0, 1, 1,
0.6966187, -0.4537503, 2.925284, 0.572549, 0, 1, 1,
0.7033768, -2.638606, 3.644027, 0.5764706, 0, 1, 1,
0.7138617, -0.6428608, 2.750306, 0.5843138, 0, 1, 1,
0.7237693, 0.3986508, 0.1926163, 0.5882353, 0, 1, 1,
0.728269, -0.1542426, 2.271354, 0.5960785, 0, 1, 1,
0.7318357, 0.6359179, 0.8088087, 0.6039216, 0, 1, 1,
0.7323305, 0.1542691, 1.606624, 0.6078432, 0, 1, 1,
0.7380399, -0.6014559, 1.679737, 0.6156863, 0, 1, 1,
0.7458031, -0.00822977, -0.5987467, 0.6196079, 0, 1, 1,
0.7489853, -1.114201, 2.895856, 0.627451, 0, 1, 1,
0.7519128, -0.558265, 1.449939, 0.6313726, 0, 1, 1,
0.7529551, 0.580959, 0.3687119, 0.6392157, 0, 1, 1,
0.7537131, -0.5765114, 2.829956, 0.6431373, 0, 1, 1,
0.7560648, 0.5026176, 1.606816, 0.6509804, 0, 1, 1,
0.760379, 0.4575097, 0.7956795, 0.654902, 0, 1, 1,
0.762154, -1.460727, 2.742585, 0.6627451, 0, 1, 1,
0.763045, -1.50104, 4.311993, 0.6666667, 0, 1, 1,
0.7728972, -1.01377, 2.694148, 0.6745098, 0, 1, 1,
0.77374, -1.893107, 3.186225, 0.6784314, 0, 1, 1,
0.7767912, 0.4994284, 1.872471, 0.6862745, 0, 1, 1,
0.7770518, -1.509504, 3.411778, 0.6901961, 0, 1, 1,
0.7858344, 0.2430188, 0.9595639, 0.6980392, 0, 1, 1,
0.7869736, -0.277595, 3.045334, 0.7058824, 0, 1, 1,
0.7880708, 2.012447, 0.5109931, 0.7098039, 0, 1, 1,
0.7958572, 0.8640878, 0.7384064, 0.7176471, 0, 1, 1,
0.7988933, -0.5721526, 3.367109, 0.7215686, 0, 1, 1,
0.7990842, 1.697954, 0.3611263, 0.7294118, 0, 1, 1,
0.8006437, 0.1344671, 1.725594, 0.7333333, 0, 1, 1,
0.8061786, -0.04746833, 3.018887, 0.7411765, 0, 1, 1,
0.8104778, 0.4718339, 0.4649892, 0.7450981, 0, 1, 1,
0.8121766, -0.5401001, 2.801229, 0.7529412, 0, 1, 1,
0.8157077, 0.2935449, -0.03681483, 0.7568628, 0, 1, 1,
0.8265531, 0.1418842, 1.041441, 0.7647059, 0, 1, 1,
0.8278773, 0.0231727, 1.136925, 0.7686275, 0, 1, 1,
0.8327591, -0.2828034, 0.7895699, 0.7764706, 0, 1, 1,
0.8350444, 1.417038, 0.1928759, 0.7803922, 0, 1, 1,
0.8389383, 0.5506659, 1.98509, 0.7882353, 0, 1, 1,
0.8401182, 1.124147, 1.955728, 0.7921569, 0, 1, 1,
0.8418219, -1.739833, 2.223746, 0.8, 0, 1, 1,
0.8444986, -1.312263, 2.735078, 0.8078431, 0, 1, 1,
0.8464407, -0.4913534, 0.5950158, 0.8117647, 0, 1, 1,
0.8585476, 0.02219048, 0.2718096, 0.8196079, 0, 1, 1,
0.8603779, 0.7575742, -1.477218, 0.8235294, 0, 1, 1,
0.8609003, -0.409468, 3.33007, 0.8313726, 0, 1, 1,
0.8626881, 0.8624097, -0.4495339, 0.8352941, 0, 1, 1,
0.8636442, 1.14451, -0.2092534, 0.8431373, 0, 1, 1,
0.8687574, 0.05875876, 1.233444, 0.8470588, 0, 1, 1,
0.8719205, -0.2559823, 1.300871, 0.854902, 0, 1, 1,
0.8764961, -0.4351583, 1.664117, 0.8588235, 0, 1, 1,
0.8775565, 1.596571, 0.2502212, 0.8666667, 0, 1, 1,
0.881499, -0.7261423, 1.40349, 0.8705882, 0, 1, 1,
0.8832645, 0.1293475, 2.67547, 0.8784314, 0, 1, 1,
0.8881814, -0.4429942, 2.144343, 0.8823529, 0, 1, 1,
0.8906414, -0.3612903, 1.019522, 0.8901961, 0, 1, 1,
0.8970674, -0.6448094, 2.518303, 0.8941177, 0, 1, 1,
0.8974326, 2.526232, 1.018261, 0.9019608, 0, 1, 1,
0.903579, 1.630992, 1.614508, 0.9098039, 0, 1, 1,
0.9124206, -0.5941083, 3.442183, 0.9137255, 0, 1, 1,
0.9125388, 0.7911297, -1.118918, 0.9215686, 0, 1, 1,
0.9138997, 0.5190181, -1.291241, 0.9254902, 0, 1, 1,
0.9150303, -2.620275, 2.466318, 0.9333333, 0, 1, 1,
0.9166788, -2.608254, 3.394635, 0.9372549, 0, 1, 1,
0.9173663, -0.7596254, 3.544011, 0.945098, 0, 1, 1,
0.9177456, -2.150542, 2.255386, 0.9490196, 0, 1, 1,
0.918996, -1.52528, 4.108505, 0.9568627, 0, 1, 1,
0.9256153, -0.3409071, 1.145349, 0.9607843, 0, 1, 1,
0.9259897, 0.5191288, 1.961298, 0.9686275, 0, 1, 1,
0.941328, 1.497833, 0.7848497, 0.972549, 0, 1, 1,
0.9415666, 0.89859, -0.2344452, 0.9803922, 0, 1, 1,
0.9429749, -1.156359, 1.034549, 0.9843137, 0, 1, 1,
0.9442356, -0.9280746, 2.678218, 0.9921569, 0, 1, 1,
0.948745, 1.079702, 1.138524, 0.9960784, 0, 1, 1,
0.9491446, 0.5646678, 1.433605, 1, 0, 0.9960784, 1,
0.9533866, -0.1818212, 1.688488, 1, 0, 0.9882353, 1,
0.9581259, 0.9248749, 1.618534, 1, 0, 0.9843137, 1,
0.9606983, -0.1385546, 2.950016, 1, 0, 0.9764706, 1,
0.9615338, 0.172487, 2.394208, 1, 0, 0.972549, 1,
0.9616302, 0.8609378, 0.2835601, 1, 0, 0.9647059, 1,
0.9735149, -0.2950746, 0.6798055, 1, 0, 0.9607843, 1,
0.9754092, 0.9901522, 1.003748, 1, 0, 0.9529412, 1,
0.9817854, -1.06402, 3.122509, 1, 0, 0.9490196, 1,
0.9846553, 0.5313035, 0.9261321, 1, 0, 0.9411765, 1,
0.9849555, -0.3905602, 2.778795, 1, 0, 0.9372549, 1,
0.9905037, 0.5607675, -0.7314283, 1, 0, 0.9294118, 1,
0.99083, 1.73263, -0.8351195, 1, 0, 0.9254902, 1,
0.9924783, -0.3989321, 3.270202, 1, 0, 0.9176471, 1,
0.9928954, -0.937623, 2.153693, 1, 0, 0.9137255, 1,
0.9952869, 0.7655385, -1.565229, 1, 0, 0.9058824, 1,
0.9963647, -2.089716, 2.255462, 1, 0, 0.9019608, 1,
0.9965221, -0.3984879, 2.049755, 1, 0, 0.8941177, 1,
0.999604, 0.4128635, 0.6178795, 1, 0, 0.8862745, 1,
1.000429, -1.151269, 4.74142, 1, 0, 0.8823529, 1,
1.003805, 0.0678391, 2.405072, 1, 0, 0.8745098, 1,
1.012401, 0.557232, 0.4459119, 1, 0, 0.8705882, 1,
1.024321, -0.3271001, 1.50165, 1, 0, 0.8627451, 1,
1.032535, 0.301601, 2.748532, 1, 0, 0.8588235, 1,
1.035751, 0.8013722, 1.127911, 1, 0, 0.8509804, 1,
1.038022, 0.5338542, 1.960258, 1, 0, 0.8470588, 1,
1.039038, 1.162835, 0.07516054, 1, 0, 0.8392157, 1,
1.047234, 1.185412, 0.651116, 1, 0, 0.8352941, 1,
1.054993, 0.2684033, 1.668778, 1, 0, 0.827451, 1,
1.060716, 0.103598, 1.09669, 1, 0, 0.8235294, 1,
1.064467, -0.2677613, 2.568369, 1, 0, 0.8156863, 1,
1.064593, 1.237515, 1.889341, 1, 0, 0.8117647, 1,
1.065251, 0.9192876, 1.021846, 1, 0, 0.8039216, 1,
1.072958, -1.542086, 2.182709, 1, 0, 0.7960784, 1,
1.073519, -0.980084, 2.080439, 1, 0, 0.7921569, 1,
1.073659, 1.240957, -0.08351935, 1, 0, 0.7843137, 1,
1.07821, 1.788931, 0.145627, 1, 0, 0.7803922, 1,
1.078832, -0.4882044, 1.917351, 1, 0, 0.772549, 1,
1.08412, 2.046704, 1.319698, 1, 0, 0.7686275, 1,
1.085097, 0.2820359, 1.517474, 1, 0, 0.7607843, 1,
1.086362, 2.163187, 2.603562, 1, 0, 0.7568628, 1,
1.089442, -0.06851479, 2.525005, 1, 0, 0.7490196, 1,
1.093347, 1.313456, 2.171605, 1, 0, 0.7450981, 1,
1.102024, 0.3704568, -0.6330878, 1, 0, 0.7372549, 1,
1.102637, 0.4431611, 2.334334, 1, 0, 0.7333333, 1,
1.107619, 0.318918, 2.729153, 1, 0, 0.7254902, 1,
1.108239, -1.099433, 2.227755, 1, 0, 0.7215686, 1,
1.125525, 1.159255, 0.449145, 1, 0, 0.7137255, 1,
1.127961, -0.4858596, 3.597198, 1, 0, 0.7098039, 1,
1.129759, -1.466707, 3.506462, 1, 0, 0.7019608, 1,
1.14223, 0.6174778, 2.798823, 1, 0, 0.6941177, 1,
1.154083, -0.1938985, 2.031821, 1, 0, 0.6901961, 1,
1.159586, 0.165431, 1.810516, 1, 0, 0.682353, 1,
1.160385, 0.03954472, 1.758922, 1, 0, 0.6784314, 1,
1.161686, 1.25789, 1.139878, 1, 0, 0.6705883, 1,
1.16397, 0.9511126, -0.4487027, 1, 0, 0.6666667, 1,
1.174407, -0.5759048, 2.812232, 1, 0, 0.6588235, 1,
1.175807, -0.04824641, 1.42011, 1, 0, 0.654902, 1,
1.176736, 1.019351, 0.7053529, 1, 0, 0.6470588, 1,
1.17764, 0.4063885, 3.071522, 1, 0, 0.6431373, 1,
1.183998, -0.4891187, 0.1947356, 1, 0, 0.6352941, 1,
1.19123, -0.6487483, 1.344416, 1, 0, 0.6313726, 1,
1.202705, 0.7628932, -0.009741972, 1, 0, 0.6235294, 1,
1.20329, 0.5110303, 1.183469, 1, 0, 0.6196079, 1,
1.2114, -0.2968316, 0.4242363, 1, 0, 0.6117647, 1,
1.224499, 0.6181476, 0.4454646, 1, 0, 0.6078432, 1,
1.233863, -0.1376182, 1.829113, 1, 0, 0.6, 1,
1.239492, 0.998476, 0.2268718, 1, 0, 0.5921569, 1,
1.241338, -0.6495163, 4.318425, 1, 0, 0.5882353, 1,
1.246541, -1.910531, 1.947826, 1, 0, 0.5803922, 1,
1.249574, -0.3895064, 0.00658788, 1, 0, 0.5764706, 1,
1.250071, 2.383924, 0.62133, 1, 0, 0.5686275, 1,
1.253019, -1.224389, 4.598974, 1, 0, 0.5647059, 1,
1.255672, -1.503276, 2.969598, 1, 0, 0.5568628, 1,
1.256134, 2.216185, 1.875578, 1, 0, 0.5529412, 1,
1.271463, -0.1201715, 1.295926, 1, 0, 0.5450981, 1,
1.271546, -0.2745969, 2.85522, 1, 0, 0.5411765, 1,
1.277542, 0.1499085, 0.5404844, 1, 0, 0.5333334, 1,
1.27771, 0.06514264, 0.6293503, 1, 0, 0.5294118, 1,
1.279723, 0.9433073, 0.1030851, 1, 0, 0.5215687, 1,
1.288018, 1.44711, 1.388945, 1, 0, 0.5176471, 1,
1.292479, 0.1934548, 2.782466, 1, 0, 0.509804, 1,
1.302565, -1.203719, 1.173799, 1, 0, 0.5058824, 1,
1.316229, -0.4794644, 1.448289, 1, 0, 0.4980392, 1,
1.337074, -0.3356382, 2.679717, 1, 0, 0.4901961, 1,
1.353751, 0.4463594, 2.716698, 1, 0, 0.4862745, 1,
1.35914, -0.5949724, 1.84679, 1, 0, 0.4784314, 1,
1.367011, -0.1093523, 1.258694, 1, 0, 0.4745098, 1,
1.36841, 0.570021, 0.317059, 1, 0, 0.4666667, 1,
1.381471, -0.986706, 2.163986, 1, 0, 0.4627451, 1,
1.386493, -2.108127, 1.935998, 1, 0, 0.454902, 1,
1.388804, 0.6269425, 1.851007, 1, 0, 0.4509804, 1,
1.402549, 1.482082, 1.604921, 1, 0, 0.4431373, 1,
1.404252, -1.53133, 2.436121, 1, 0, 0.4392157, 1,
1.404311, 0.3214701, 1.039814, 1, 0, 0.4313726, 1,
1.411861, 1.446744, 0.5964966, 1, 0, 0.427451, 1,
1.415417, -0.8172382, 1.456262, 1, 0, 0.4196078, 1,
1.437054, 1.966664, 0.08969881, 1, 0, 0.4156863, 1,
1.44976, 0.03630447, 0.4774038, 1, 0, 0.4078431, 1,
1.462719, 1.354526, -1.432788, 1, 0, 0.4039216, 1,
1.464054, 1.089643, 0.8447204, 1, 0, 0.3960784, 1,
1.480286, -2.51526, 3.66754, 1, 0, 0.3882353, 1,
1.490126, 0.7074954, 1.199961, 1, 0, 0.3843137, 1,
1.493316, -0.8235798, 1.350114, 1, 0, 0.3764706, 1,
1.502345, 0.8866105, 0.3407823, 1, 0, 0.372549, 1,
1.527333, 1.759468, -1.068104, 1, 0, 0.3647059, 1,
1.527816, 0.4771856, 1.918722, 1, 0, 0.3607843, 1,
1.531583, 0.9038197, 2.747729, 1, 0, 0.3529412, 1,
1.540138, 1.259449, 1.335915, 1, 0, 0.3490196, 1,
1.543588, 1.254152, 1.775534, 1, 0, 0.3411765, 1,
1.560801, 0.3122703, 1.973191, 1, 0, 0.3372549, 1,
1.561709, 0.3725286, -0.2913411, 1, 0, 0.3294118, 1,
1.574739, -0.7604537, 2.418586, 1, 0, 0.3254902, 1,
1.602311, 1.280542, 3.183607, 1, 0, 0.3176471, 1,
1.621043, 0.3667256, -0.001720602, 1, 0, 0.3137255, 1,
1.629189, -0.331765, 1.395114, 1, 0, 0.3058824, 1,
1.638326, 1.677123, 0.6483982, 1, 0, 0.2980392, 1,
1.63861, -0.9479333, 3.100695, 1, 0, 0.2941177, 1,
1.639669, 0.5124336, 1.457347, 1, 0, 0.2862745, 1,
1.643324, 0.6364906, 1.976149, 1, 0, 0.282353, 1,
1.643394, -1.686604, 4.479379, 1, 0, 0.2745098, 1,
1.66304, 0.9969887, 1.387935, 1, 0, 0.2705882, 1,
1.663302, -2.658738, 1.323564, 1, 0, 0.2627451, 1,
1.665138, -2.038975, 2.527886, 1, 0, 0.2588235, 1,
1.711284, -0.924337, 2.635466, 1, 0, 0.2509804, 1,
1.718365, 1.109654, -0.5647017, 1, 0, 0.2470588, 1,
1.724654, 0.8480574, 2.023627, 1, 0, 0.2392157, 1,
1.724849, 0.614016, 1.735569, 1, 0, 0.2352941, 1,
1.740447, 1.525555, 1.159766, 1, 0, 0.227451, 1,
1.748416, -0.3731874, 1.425773, 1, 0, 0.2235294, 1,
1.752678, 0.8203322, 2.104212, 1, 0, 0.2156863, 1,
1.75298, -1.106502, 1.392077, 1, 0, 0.2117647, 1,
1.767543, 1.793764, -0.2749123, 1, 0, 0.2039216, 1,
1.774911, 0.1254639, 0.3478644, 1, 0, 0.1960784, 1,
1.779512, -1.004874, 2.456532, 1, 0, 0.1921569, 1,
1.800709, -1.065519, 0.8976515, 1, 0, 0.1843137, 1,
1.82178, 0.7345939, 1.0738, 1, 0, 0.1803922, 1,
1.829173, -0.0402087, 0.2021821, 1, 0, 0.172549, 1,
1.830601, 0.1696564, 2.351202, 1, 0, 0.1686275, 1,
1.83597, 1.253474, 0.673273, 1, 0, 0.1607843, 1,
1.839199, 1.867239, 2.103052, 1, 0, 0.1568628, 1,
1.842112, 0.5535775, 4.574452, 1, 0, 0.1490196, 1,
1.845597, 0.3277314, 1.765617, 1, 0, 0.145098, 1,
1.855611, -0.9513527, 1.921381, 1, 0, 0.1372549, 1,
1.872013, 0.282366, 2.870918, 1, 0, 0.1333333, 1,
1.90553, 1.677896, 0.6990513, 1, 0, 0.1254902, 1,
1.948274, -0.8639435, 3.017697, 1, 0, 0.1215686, 1,
1.954225, -0.519699, 3.317565, 1, 0, 0.1137255, 1,
1.968148, 1.019016, 1.900821, 1, 0, 0.1098039, 1,
1.998519, 1.08869, 2.157014, 1, 0, 0.1019608, 1,
1.99855, -0.01090817, 1.457398, 1, 0, 0.09411765, 1,
2.103245, 0.8670618, 2.475854, 1, 0, 0.09019608, 1,
2.13317, 0.9149928, 0.8552485, 1, 0, 0.08235294, 1,
2.136142, 1.804439, 1.188611, 1, 0, 0.07843138, 1,
2.194572, -0.3643375, 1.377413, 1, 0, 0.07058824, 1,
2.210315, -0.5009809, 1.966854, 1, 0, 0.06666667, 1,
2.21322, 1.633088, 0.9713897, 1, 0, 0.05882353, 1,
2.26818, -0.4506698, 2.181838, 1, 0, 0.05490196, 1,
2.272556, 0.2411831, 2.100494, 1, 0, 0.04705882, 1,
2.414139, -1.624066, 1.637463, 1, 0, 0.04313726, 1,
2.47734, 1.917139, 2.282067, 1, 0, 0.03529412, 1,
2.521349, -1.166614, 2.196447, 1, 0, 0.03137255, 1,
2.539977, 0.2231593, 0.07190013, 1, 0, 0.02352941, 1,
2.704091, -1.20782, 1.429968, 1, 0, 0.01960784, 1,
2.804936, -1.841418, 0.135014, 1, 0, 0.01176471, 1,
3.401904, -1.697442, 1.093449, 1, 0, 0.007843138, 1
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
0.07468915, -4.251396, -7.845376, 0, -0.5, 0.5, 0.5,
0.07468915, -4.251396, -7.845376, 1, -0.5, 0.5, 0.5,
0.07468915, -4.251396, -7.845376, 1, 1.5, 0.5, 0.5,
0.07468915, -4.251396, -7.845376, 0, 1.5, 0.5, 0.5
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
-4.380451, 0.04058683, -7.845376, 0, -0.5, 0.5, 0.5,
-4.380451, 0.04058683, -7.845376, 1, -0.5, 0.5, 0.5,
-4.380451, 0.04058683, -7.845376, 1, 1.5, 0.5, 0.5,
-4.380451, 0.04058683, -7.845376, 0, 1.5, 0.5, 0.5
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
-4.380451, -4.251396, -0.2059426, 0, -0.5, 0.5, 0.5,
-4.380451, -4.251396, -0.2059426, 1, -0.5, 0.5, 0.5,
-4.380451, -4.251396, -0.2059426, 1, 1.5, 0.5, 0.5,
-4.380451, -4.251396, -0.2059426, 0, 1.5, 0.5, 0.5
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
-3, -3.260939, -6.082429,
3, -3.260939, -6.082429,
-3, -3.260939, -6.082429,
-3, -3.426015, -6.376254,
-2, -3.260939, -6.082429,
-2, -3.426015, -6.376254,
-1, -3.260939, -6.082429,
-1, -3.426015, -6.376254,
0, -3.260939, -6.082429,
0, -3.426015, -6.376254,
1, -3.260939, -6.082429,
1, -3.426015, -6.376254,
2, -3.260939, -6.082429,
2, -3.426015, -6.376254,
3, -3.260939, -6.082429,
3, -3.426015, -6.376254
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
-3, -3.756167, -6.963902, 0, -0.5, 0.5, 0.5,
-3, -3.756167, -6.963902, 1, -0.5, 0.5, 0.5,
-3, -3.756167, -6.963902, 1, 1.5, 0.5, 0.5,
-3, -3.756167, -6.963902, 0, 1.5, 0.5, 0.5,
-2, -3.756167, -6.963902, 0, -0.5, 0.5, 0.5,
-2, -3.756167, -6.963902, 1, -0.5, 0.5, 0.5,
-2, -3.756167, -6.963902, 1, 1.5, 0.5, 0.5,
-2, -3.756167, -6.963902, 0, 1.5, 0.5, 0.5,
-1, -3.756167, -6.963902, 0, -0.5, 0.5, 0.5,
-1, -3.756167, -6.963902, 1, -0.5, 0.5, 0.5,
-1, -3.756167, -6.963902, 1, 1.5, 0.5, 0.5,
-1, -3.756167, -6.963902, 0, 1.5, 0.5, 0.5,
0, -3.756167, -6.963902, 0, -0.5, 0.5, 0.5,
0, -3.756167, -6.963902, 1, -0.5, 0.5, 0.5,
0, -3.756167, -6.963902, 1, 1.5, 0.5, 0.5,
0, -3.756167, -6.963902, 0, 1.5, 0.5, 0.5,
1, -3.756167, -6.963902, 0, -0.5, 0.5, 0.5,
1, -3.756167, -6.963902, 1, -0.5, 0.5, 0.5,
1, -3.756167, -6.963902, 1, 1.5, 0.5, 0.5,
1, -3.756167, -6.963902, 0, 1.5, 0.5, 0.5,
2, -3.756167, -6.963902, 0, -0.5, 0.5, 0.5,
2, -3.756167, -6.963902, 1, -0.5, 0.5, 0.5,
2, -3.756167, -6.963902, 1, 1.5, 0.5, 0.5,
2, -3.756167, -6.963902, 0, 1.5, 0.5, 0.5,
3, -3.756167, -6.963902, 0, -0.5, 0.5, 0.5,
3, -3.756167, -6.963902, 1, -0.5, 0.5, 0.5,
3, -3.756167, -6.963902, 1, 1.5, 0.5, 0.5,
3, -3.756167, -6.963902, 0, 1.5, 0.5, 0.5
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
-3.352342, -3, -6.082429,
-3.352342, 3, -6.082429,
-3.352342, -3, -6.082429,
-3.523694, -3, -6.376254,
-3.352342, -2, -6.082429,
-3.523694, -2, -6.376254,
-3.352342, -1, -6.082429,
-3.523694, -1, -6.376254,
-3.352342, 0, -6.082429,
-3.523694, 0, -6.376254,
-3.352342, 1, -6.082429,
-3.523694, 1, -6.376254,
-3.352342, 2, -6.082429,
-3.523694, 2, -6.376254,
-3.352342, 3, -6.082429,
-3.523694, 3, -6.376254
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
-3.866397, -3, -6.963902, 0, -0.5, 0.5, 0.5,
-3.866397, -3, -6.963902, 1, -0.5, 0.5, 0.5,
-3.866397, -3, -6.963902, 1, 1.5, 0.5, 0.5,
-3.866397, -3, -6.963902, 0, 1.5, 0.5, 0.5,
-3.866397, -2, -6.963902, 0, -0.5, 0.5, 0.5,
-3.866397, -2, -6.963902, 1, -0.5, 0.5, 0.5,
-3.866397, -2, -6.963902, 1, 1.5, 0.5, 0.5,
-3.866397, -2, -6.963902, 0, 1.5, 0.5, 0.5,
-3.866397, -1, -6.963902, 0, -0.5, 0.5, 0.5,
-3.866397, -1, -6.963902, 1, -0.5, 0.5, 0.5,
-3.866397, -1, -6.963902, 1, 1.5, 0.5, 0.5,
-3.866397, -1, -6.963902, 0, 1.5, 0.5, 0.5,
-3.866397, 0, -6.963902, 0, -0.5, 0.5, 0.5,
-3.866397, 0, -6.963902, 1, -0.5, 0.5, 0.5,
-3.866397, 0, -6.963902, 1, 1.5, 0.5, 0.5,
-3.866397, 0, -6.963902, 0, 1.5, 0.5, 0.5,
-3.866397, 1, -6.963902, 0, -0.5, 0.5, 0.5,
-3.866397, 1, -6.963902, 1, -0.5, 0.5, 0.5,
-3.866397, 1, -6.963902, 1, 1.5, 0.5, 0.5,
-3.866397, 1, -6.963902, 0, 1.5, 0.5, 0.5,
-3.866397, 2, -6.963902, 0, -0.5, 0.5, 0.5,
-3.866397, 2, -6.963902, 1, -0.5, 0.5, 0.5,
-3.866397, 2, -6.963902, 1, 1.5, 0.5, 0.5,
-3.866397, 2, -6.963902, 0, 1.5, 0.5, 0.5,
-3.866397, 3, -6.963902, 0, -0.5, 0.5, 0.5,
-3.866397, 3, -6.963902, 1, -0.5, 0.5, 0.5,
-3.866397, 3, -6.963902, 1, 1.5, 0.5, 0.5,
-3.866397, 3, -6.963902, 0, 1.5, 0.5, 0.5
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
-3.352342, -3.260939, -4,
-3.352342, -3.260939, 4,
-3.352342, -3.260939, -4,
-3.523694, -3.426015, -4,
-3.352342, -3.260939, -2,
-3.523694, -3.426015, -2,
-3.352342, -3.260939, 0,
-3.523694, -3.426015, 0,
-3.352342, -3.260939, 2,
-3.523694, -3.426015, 2,
-3.352342, -3.260939, 4,
-3.523694, -3.426015, 4
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
-3.866397, -3.756167, -4, 0, -0.5, 0.5, 0.5,
-3.866397, -3.756167, -4, 1, -0.5, 0.5, 0.5,
-3.866397, -3.756167, -4, 1, 1.5, 0.5, 0.5,
-3.866397, -3.756167, -4, 0, 1.5, 0.5, 0.5,
-3.866397, -3.756167, -2, 0, -0.5, 0.5, 0.5,
-3.866397, -3.756167, -2, 1, -0.5, 0.5, 0.5,
-3.866397, -3.756167, -2, 1, 1.5, 0.5, 0.5,
-3.866397, -3.756167, -2, 0, 1.5, 0.5, 0.5,
-3.866397, -3.756167, 0, 0, -0.5, 0.5, 0.5,
-3.866397, -3.756167, 0, 1, -0.5, 0.5, 0.5,
-3.866397, -3.756167, 0, 1, 1.5, 0.5, 0.5,
-3.866397, -3.756167, 0, 0, 1.5, 0.5, 0.5,
-3.866397, -3.756167, 2, 0, -0.5, 0.5, 0.5,
-3.866397, -3.756167, 2, 1, -0.5, 0.5, 0.5,
-3.866397, -3.756167, 2, 1, 1.5, 0.5, 0.5,
-3.866397, -3.756167, 2, 0, 1.5, 0.5, 0.5,
-3.866397, -3.756167, 4, 0, -0.5, 0.5, 0.5,
-3.866397, -3.756167, 4, 1, -0.5, 0.5, 0.5,
-3.866397, -3.756167, 4, 1, 1.5, 0.5, 0.5,
-3.866397, -3.756167, 4, 0, 1.5, 0.5, 0.5
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
-3.352342, -3.260939, -6.082429,
-3.352342, 3.342112, -6.082429,
-3.352342, -3.260939, 5.670544,
-3.352342, 3.342112, 5.670544,
-3.352342, -3.260939, -6.082429,
-3.352342, -3.260939, 5.670544,
-3.352342, 3.342112, -6.082429,
-3.352342, 3.342112, 5.670544,
-3.352342, -3.260939, -6.082429,
3.50172, -3.260939, -6.082429,
-3.352342, -3.260939, 5.670544,
3.50172, -3.260939, 5.670544,
-3.352342, 3.342112, -6.082429,
3.50172, 3.342112, -6.082429,
-3.352342, 3.342112, 5.670544,
3.50172, 3.342112, 5.670544,
3.50172, -3.260939, -6.082429,
3.50172, 3.342112, -6.082429,
3.50172, -3.260939, 5.670544,
3.50172, 3.342112, 5.670544,
3.50172, -3.260939, -6.082429,
3.50172, -3.260939, 5.670544,
3.50172, 3.342112, -6.082429,
3.50172, 3.342112, 5.670544
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
var radius = 8.075489;
var distance = 35.92876;
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
mvMatrix.translate( -0.07468915, -0.04058683, 0.2059426 );
mvMatrix.scale( 1.273898, 1.322325, 0.7429079 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.92876);
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
oxo-pyrrolidino<-read.table("oxo-pyrrolidino.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-oxo-pyrrolidino$V2
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
y<-oxo-pyrrolidino$V3
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
```

```r
z<-oxo-pyrrolidino$V4
```

```
## Error in eval(expr, envir, enclos): object 'oxo' not found
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
-3.252526, 2.485687, -1.58903, 0, 0, 1, 1, 1,
-2.773081, -0.0284446, -2.997095, 1, 0, 0, 1, 1,
-2.656978, -1.006054, -1.462082, 1, 0, 0, 1, 1,
-2.567672, 0.7610441, -1.897332, 1, 0, 0, 1, 1,
-2.564766, -1.238141, -1.289468, 1, 0, 0, 1, 1,
-2.527869, 1.353466, -1.885516, 1, 0, 0, 1, 1,
-2.52304, 0.5062702, -1.963963, 0, 0, 0, 1, 1,
-2.464895, 0.3428337, -0.483333, 0, 0, 0, 1, 1,
-2.41453, 0.9222943, -2.339414, 0, 0, 0, 1, 1,
-2.398902, -1.240116, -2.319936, 0, 0, 0, 1, 1,
-2.37805, 0.3923638, -0.4912212, 0, 0, 0, 1, 1,
-2.304057, 0.7534661, -1.349106, 0, 0, 0, 1, 1,
-2.258098, 0.2573099, -0.8272387, 0, 0, 0, 1, 1,
-2.249984, 0.09492546, -1.55631, 1, 1, 1, 1, 1,
-2.237509, 0.0404893, -3.411961, 1, 1, 1, 1, 1,
-2.236692, -1.785996, -1.51342, 1, 1, 1, 1, 1,
-2.225805, -0.554776, -1.46131, 1, 1, 1, 1, 1,
-2.213934, 2.451071, -0.469816, 1, 1, 1, 1, 1,
-2.213862, -0.1221472, 1.461382, 1, 1, 1, 1, 1,
-2.209682, -0.7387015, -2.090854, 1, 1, 1, 1, 1,
-2.128547, 1.596198, -1.287368, 1, 1, 1, 1, 1,
-2.10122, 0.2476707, -1.081879, 1, 1, 1, 1, 1,
-2.065631, -0.5456415, -1.160319, 1, 1, 1, 1, 1,
-2.05072, -1.62812, -2.150833, 1, 1, 1, 1, 1,
-2.031817, 0.8807299, -0.8991305, 1, 1, 1, 1, 1,
-2.020669, 0.7359753, -3.089992, 1, 1, 1, 1, 1,
-2.018823, 0.7277445, -2.437727, 1, 1, 1, 1, 1,
-1.998757, 0.9151634, -1.001663, 1, 1, 1, 1, 1,
-1.92836, -0.4106103, -0.536301, 0, 0, 1, 1, 1,
-1.906625, -2.497833, -0.6617215, 1, 0, 0, 1, 1,
-1.893399, 0.6317254, -2.638241, 1, 0, 0, 1, 1,
-1.891493, -1.818931, -3.42436, 1, 0, 0, 1, 1,
-1.883408, -0.7098237, -0.3415974, 1, 0, 0, 1, 1,
-1.872858, -0.6542329, -2.686204, 1, 0, 0, 1, 1,
-1.871997, 1.04034, 0.688454, 0, 0, 0, 1, 1,
-1.867143, -0.1966583, -2.386938, 0, 0, 0, 1, 1,
-1.860641, 0.397805, -2.257758, 0, 0, 0, 1, 1,
-1.824595, -0.4829521, -0.4542797, 0, 0, 0, 1, 1,
-1.805319, 0.1403282, -1.59909, 0, 0, 0, 1, 1,
-1.789494, -0.1899868, -1.754488, 0, 0, 0, 1, 1,
-1.784059, -1.219614, -2.355082, 0, 0, 0, 1, 1,
-1.778097, 0.166075, -1.828809, 1, 1, 1, 1, 1,
-1.77167, -2.426743, -1.415388, 1, 1, 1, 1, 1,
-1.769629, -0.5221218, -3.305233, 1, 1, 1, 1, 1,
-1.764927, 1.278128, -0.7324186, 1, 1, 1, 1, 1,
-1.761097, -0.1469527, -1.220406, 1, 1, 1, 1, 1,
-1.757847, -0.4944271, -1.906821, 1, 1, 1, 1, 1,
-1.75636, -0.5114138, -1.880597, 1, 1, 1, 1, 1,
-1.749647, 1.308937, -1.983326, 1, 1, 1, 1, 1,
-1.732833, -0.7334298, -1.579031, 1, 1, 1, 1, 1,
-1.719192, 0.4814233, -1.730327, 1, 1, 1, 1, 1,
-1.703538, -0.2968424, -2.34614, 1, 1, 1, 1, 1,
-1.694177, 0.3768671, -1.446662, 1, 1, 1, 1, 1,
-1.688713, -1.819239, -2.274085, 1, 1, 1, 1, 1,
-1.686161, -0.5138415, -2.122838, 1, 1, 1, 1, 1,
-1.646391, -1.486854, -4.238605, 1, 1, 1, 1, 1,
-1.627011, 0.5784288, -1.272907, 0, 0, 1, 1, 1,
-1.626173, 0.5679331, -1.565193, 1, 0, 0, 1, 1,
-1.624742, -0.4595958, -3.092551, 1, 0, 0, 1, 1,
-1.620196, 0.4612395, -1.37489, 1, 0, 0, 1, 1,
-1.609229, -1.416477, -2.370647, 1, 0, 0, 1, 1,
-1.584613, 0.1066311, -1.518907, 1, 0, 0, 1, 1,
-1.574486, -0.7836402, -1.427542, 0, 0, 0, 1, 1,
-1.570889, 0.2017263, -2.908818, 0, 0, 0, 1, 1,
-1.567368, -1.312803, -1.711742, 0, 0, 0, 1, 1,
-1.545359, 0.7094833, -1.230078, 0, 0, 0, 1, 1,
-1.51131, -0.9652568, -2.973465, 0, 0, 0, 1, 1,
-1.495922, 1.921463, 0.05091251, 0, 0, 0, 1, 1,
-1.494577, -0.6921812, -3.649473, 0, 0, 0, 1, 1,
-1.483278, -0.8455748, -2.499427, 1, 1, 1, 1, 1,
-1.477367, 2.62973, 1.268226, 1, 1, 1, 1, 1,
-1.472766, 0.7224858, -1.360637, 1, 1, 1, 1, 1,
-1.451127, 0.5697274, 0.0253456, 1, 1, 1, 1, 1,
-1.439686, -0.239281, -0.5114035, 1, 1, 1, 1, 1,
-1.439116, 0.142914, -2.465356, 1, 1, 1, 1, 1,
-1.433267, -0.7156512, -1.993135, 1, 1, 1, 1, 1,
-1.427527, 0.7052075, -0.699092, 1, 1, 1, 1, 1,
-1.42242, -1.659366, -3.473733, 1, 1, 1, 1, 1,
-1.421589, 1.074612, -1.651557, 1, 1, 1, 1, 1,
-1.415288, -0.8600451, -1.681271, 1, 1, 1, 1, 1,
-1.397432, 0.2452266, -1.191841, 1, 1, 1, 1, 1,
-1.396689, -0.7798038, -1.487864, 1, 1, 1, 1, 1,
-1.386657, -1.86052, -2.957711, 1, 1, 1, 1, 1,
-1.382223, 0.6772418, -1.320608, 1, 1, 1, 1, 1,
-1.36847, 0.4829327, -0.686999, 0, 0, 1, 1, 1,
-1.342149, 1.805246, -0.2772637, 1, 0, 0, 1, 1,
-1.33219, 1.160187, -0.9128046, 1, 0, 0, 1, 1,
-1.328735, -0.5111969, -1.485966, 1, 0, 0, 1, 1,
-1.316267, -0.6748232, -2.25973, 1, 0, 0, 1, 1,
-1.305747, 1.141767, -0.5202503, 1, 0, 0, 1, 1,
-1.305342, -1.545608, -2.292542, 0, 0, 0, 1, 1,
-1.291541, -0.5341004, -3.907173, 0, 0, 0, 1, 1,
-1.285933, -0.1658881, -1.05819, 0, 0, 0, 1, 1,
-1.280951, -0.9126071, -3.144138, 0, 0, 0, 1, 1,
-1.280226, -0.2159178, -2.585536, 0, 0, 0, 1, 1,
-1.27752, -1.408739, -1.251653, 0, 0, 0, 1, 1,
-1.277397, -1.331933, -1.65092, 0, 0, 0, 1, 1,
-1.275438, -0.2969011, -3.203725, 1, 1, 1, 1, 1,
-1.266461, 0.5421176, -1.686, 1, 1, 1, 1, 1,
-1.260641, 1.350858, -1.942859, 1, 1, 1, 1, 1,
-1.248363, -0.3262159, -1.386999, 1, 1, 1, 1, 1,
-1.223838, -0.5425978, -0.5605133, 1, 1, 1, 1, 1,
-1.222188, 0.05988508, -2.163014, 1, 1, 1, 1, 1,
-1.22199, -1.029313, -3.997454, 1, 1, 1, 1, 1,
-1.221331, -0.2819094, -1.662344, 1, 1, 1, 1, 1,
-1.218211, -0.1168979, -0.4622213, 1, 1, 1, 1, 1,
-1.208634, -0.1307819, -1.079512, 1, 1, 1, 1, 1,
-1.203894, -0.4755346, -4.338686, 1, 1, 1, 1, 1,
-1.191307, 0.6203648, -1.35167, 1, 1, 1, 1, 1,
-1.185702, -0.6539393, -1.669982, 1, 1, 1, 1, 1,
-1.181121, -1.659708, -0.5267841, 1, 1, 1, 1, 1,
-1.18046, -1.562921, -4.476378, 1, 1, 1, 1, 1,
-1.178714, 0.7759821, -1.867017, 0, 0, 1, 1, 1,
-1.178357, -0.2005739, -0.980716, 1, 0, 0, 1, 1,
-1.171601, -0.1999151, -1.058443, 1, 0, 0, 1, 1,
-1.166977, -0.2782579, -1.500233, 1, 0, 0, 1, 1,
-1.166146, 0.7113365, -1.950475, 1, 0, 0, 1, 1,
-1.158731, -0.4158652, -1.877984, 1, 0, 0, 1, 1,
-1.15787, 0.4610619, -0.3838636, 0, 0, 0, 1, 1,
-1.154887, 0.7996793, -1.495226, 0, 0, 0, 1, 1,
-1.153874, -1.86854, -1.521862, 0, 0, 0, 1, 1,
-1.153611, 0.9445771, -1.376667, 0, 0, 0, 1, 1,
-1.149211, 0.3071664, -1.208404, 0, 0, 0, 1, 1,
-1.146432, 1.379342, 1.316643, 0, 0, 0, 1, 1,
-1.144865, -0.1522422, -1.763077, 0, 0, 0, 1, 1,
-1.13886, 1.341483, -0.441729, 1, 1, 1, 1, 1,
-1.135702, 0.0444053, -2.709688, 1, 1, 1, 1, 1,
-1.13473, 1.161528, -0.8270379, 1, 1, 1, 1, 1,
-1.12014, 0.409228, -1.35999, 1, 1, 1, 1, 1,
-1.109938, 1.21805, -1.087704, 1, 1, 1, 1, 1,
-1.109897, 0.2977893, -1.310081, 1, 1, 1, 1, 1,
-1.109728, -0.5296044, -2.831201, 1, 1, 1, 1, 1,
-1.106932, -1.06213, -2.532522, 1, 1, 1, 1, 1,
-1.106125, -0.5440404, -1.72857, 1, 1, 1, 1, 1,
-1.103768, -2.134143, -3.101226, 1, 1, 1, 1, 1,
-1.102746, -1.002216, -2.323791, 1, 1, 1, 1, 1,
-1.100115, 0.04366073, -1.858717, 1, 1, 1, 1, 1,
-1.096116, -0.1785859, -2.05684, 1, 1, 1, 1, 1,
-1.087726, 1.053007, 0.4860894, 1, 1, 1, 1, 1,
-1.086806, 0.326847, -1.242225, 1, 1, 1, 1, 1,
-1.085337, -1.730085, -0.1710885, 0, 0, 1, 1, 1,
-1.082146, -0.3643587, -3.21713, 1, 0, 0, 1, 1,
-1.078321, -0.9684954, -4.323231, 1, 0, 0, 1, 1,
-1.07724, -0.966455, -1.056525, 1, 0, 0, 1, 1,
-1.076124, -0.880712, -2.42516, 1, 0, 0, 1, 1,
-1.069743, 0.9866018, -0.7618748, 1, 0, 0, 1, 1,
-1.067525, 0.03316305, -1.289359, 0, 0, 0, 1, 1,
-1.065098, -1.101462, -2.51591, 0, 0, 0, 1, 1,
-1.063655, -1.028464, -1.860731, 0, 0, 0, 1, 1,
-1.063472, -0.7776241, -1.818682, 0, 0, 0, 1, 1,
-1.049258, -0.1435221, -0.4730639, 0, 0, 0, 1, 1,
-1.045998, 0.375305, -0.535394, 0, 0, 0, 1, 1,
-1.043631, 0.8300945, -0.1840606, 0, 0, 0, 1, 1,
-1.042332, -0.4165741, -1.962922, 1, 1, 1, 1, 1,
-1.023445, 1.108243, -1.266407, 1, 1, 1, 1, 1,
-1.015085, -0.3132527, -1.03981, 1, 1, 1, 1, 1,
-1.009163, 0.8771313, -2.214773, 1, 1, 1, 1, 1,
-1.000355, 1.688877, -0.5565499, 1, 1, 1, 1, 1,
-0.9968803, 0.2436863, 0.6851992, 1, 1, 1, 1, 1,
-0.9902864, 1.543588, -0.2218042, 1, 1, 1, 1, 1,
-0.9895341, -0.4503761, -2.823346, 1, 1, 1, 1, 1,
-0.9886554, 0.9774343, -0.1004351, 1, 1, 1, 1, 1,
-0.9862464, 1.220194, -1.237591, 1, 1, 1, 1, 1,
-0.9851314, -0.6552976, -2.559482, 1, 1, 1, 1, 1,
-0.983454, 0.2245955, -0.792563, 1, 1, 1, 1, 1,
-0.9820359, -0.3464616, -2.52464, 1, 1, 1, 1, 1,
-0.9818265, -0.70619, -1.425021, 1, 1, 1, 1, 1,
-0.9787712, 0.3423078, -0.4158532, 1, 1, 1, 1, 1,
-0.9614667, -1.114782, -2.552102, 0, 0, 1, 1, 1,
-0.9606929, 0.4554807, 0.2847711, 1, 0, 0, 1, 1,
-0.9538592, 0.78411, 0.1794371, 1, 0, 0, 1, 1,
-0.9513214, 0.5969537, -0.8445971, 1, 0, 0, 1, 1,
-0.944809, -1.486905, -2.909327, 1, 0, 0, 1, 1,
-0.9376184, -0.767854, -3.672566, 1, 0, 0, 1, 1,
-0.9352359, 0.1417531, 0.2875089, 0, 0, 0, 1, 1,
-0.9344617, 0.9282789, -0.640996, 0, 0, 0, 1, 1,
-0.932328, -0.5068921, -2.957095, 0, 0, 0, 1, 1,
-0.9319364, 0.8791472, -0.4067315, 0, 0, 0, 1, 1,
-0.9318457, -0.7941102, -4.095285, 0, 0, 0, 1, 1,
-0.9290822, 1.900466, 0.172039, 0, 0, 0, 1, 1,
-0.9278161, -1.703054, -3.469641, 0, 0, 0, 1, 1,
-0.9255193, 0.1170861, -2.703546, 1, 1, 1, 1, 1,
-0.9104744, 0.5666721, 1.395827, 1, 1, 1, 1, 1,
-0.9100111, 0.2981803, -2.092345, 1, 1, 1, 1, 1,
-0.9055433, 1.123633, -2.209332, 1, 1, 1, 1, 1,
-0.9051442, -0.4572004, -0.8307465, 1, 1, 1, 1, 1,
-0.9022667, 1.130632, -0.9314921, 1, 1, 1, 1, 1,
-0.8894959, -1.181832, -1.6681, 1, 1, 1, 1, 1,
-0.8886085, 0.960456, 0.7484348, 1, 1, 1, 1, 1,
-0.8827673, 1.218317, -0.5631343, 1, 1, 1, 1, 1,
-0.8800842, 1.37873, 0.6998864, 1, 1, 1, 1, 1,
-0.872256, -0.949461, -3.288793, 1, 1, 1, 1, 1,
-0.871757, 0.3039166, 0.3530403, 1, 1, 1, 1, 1,
-0.868172, -1.104792, -3.175647, 1, 1, 1, 1, 1,
-0.8534255, 1.009337, -1.689005, 1, 1, 1, 1, 1,
-0.8524433, 0.8770797, -0.579773, 1, 1, 1, 1, 1,
-0.8394358, -2.117883, -2.422547, 0, 0, 1, 1, 1,
-0.831246, 1.153228, 1.429729, 1, 0, 0, 1, 1,
-0.8281447, 0.6715389, -0.411555, 1, 0, 0, 1, 1,
-0.8210937, -0.4519295, -1.800418, 1, 0, 0, 1, 1,
-0.8193488, 1.403204, -0.3667582, 1, 0, 0, 1, 1,
-0.8180674, -1.571115, -0.1699767, 1, 0, 0, 1, 1,
-0.8071623, -0.03723348, -2.213872, 0, 0, 0, 1, 1,
-0.8021029, -0.03826918, -3.882925, 0, 0, 0, 1, 1,
-0.8017039, 0.7993461, -0.8716073, 0, 0, 0, 1, 1,
-0.8009591, -0.1116495, -0.8685074, 0, 0, 0, 1, 1,
-0.7914536, -0.83705, -3.490824, 0, 0, 0, 1, 1,
-0.7883853, 2.229791, -2.337989, 0, 0, 0, 1, 1,
-0.7878803, -0.3068578, -0.5690857, 0, 0, 0, 1, 1,
-0.7856052, 0.3270211, -3.090225, 1, 1, 1, 1, 1,
-0.7821205, -0.337825, -2.441216, 1, 1, 1, 1, 1,
-0.7811314, -1.325555, -2.775598, 1, 1, 1, 1, 1,
-0.7744572, 1.859296, 0.01312163, 1, 1, 1, 1, 1,
-0.7734906, 0.2731905, -1.259223, 1, 1, 1, 1, 1,
-0.7712372, 0.1407875, -1.262459, 1, 1, 1, 1, 1,
-0.768136, -0.2130683, -3.576395, 1, 1, 1, 1, 1,
-0.7613314, -0.1867976, -4.023513, 1, 1, 1, 1, 1,
-0.7537954, -0.09074184, -2.52964, 1, 1, 1, 1, 1,
-0.748354, 1.612468, -0.9273868, 1, 1, 1, 1, 1,
-0.7435303, -0.8116793, -2.534898, 1, 1, 1, 1, 1,
-0.7435065, -0.4541743, -2.939842, 1, 1, 1, 1, 1,
-0.7413881, -0.9559957, -3.277891, 1, 1, 1, 1, 1,
-0.7412559, -1.383502, -2.627588, 1, 1, 1, 1, 1,
-0.73649, 0.2505378, -1.818835, 1, 1, 1, 1, 1,
-0.734183, -2.61098, -1.367613, 0, 0, 1, 1, 1,
-0.7184669, -0.6843448, -2.793099, 1, 0, 0, 1, 1,
-0.7176815, -0.1366995, -0.9210069, 1, 0, 0, 1, 1,
-0.7128692, -0.9578298, -2.342457, 1, 0, 0, 1, 1,
-0.712001, -0.4793824, -2.358432, 1, 0, 0, 1, 1,
-0.7107612, 0.5240723, -2.489842, 1, 0, 0, 1, 1,
-0.7060676, -0.09665107, -3.820845, 0, 0, 0, 1, 1,
-0.6987417, 0.9284533, -0.1724216, 0, 0, 0, 1, 1,
-0.6980286, 0.1411119, -2.676319, 0, 0, 0, 1, 1,
-0.6941814, 2.363034, -0.362967, 0, 0, 0, 1, 1,
-0.6915577, 0.6499639, -0.9346816, 0, 0, 0, 1, 1,
-0.6890597, -0.8619094, -1.479564, 0, 0, 0, 1, 1,
-0.6852152, 0.4034107, -2.819957, 0, 0, 0, 1, 1,
-0.6839614, -0.1267371, -1.81785, 1, 1, 1, 1, 1,
-0.6803319, -0.1427141, -1.48939, 1, 1, 1, 1, 1,
-0.6757335, -0.469034, -3.015591, 1, 1, 1, 1, 1,
-0.6654823, -2.049892, -3.984566, 1, 1, 1, 1, 1,
-0.6604034, 0.4167373, -2.586717, 1, 1, 1, 1, 1,
-0.6601623, 0.3004816, -1.296328, 1, 1, 1, 1, 1,
-0.6514828, -0.2605107, -1.660856, 1, 1, 1, 1, 1,
-0.6512409, -0.3588203, -2.96177, 1, 1, 1, 1, 1,
-0.646109, -0.3130999, 0.08991428, 1, 1, 1, 1, 1,
-0.6447116, 0.7183512, -0.4220701, 1, 1, 1, 1, 1,
-0.641067, 0.1135372, -2.522243, 1, 1, 1, 1, 1,
-0.638842, -1.009726, -4.033229, 1, 1, 1, 1, 1,
-0.6364339, 0.08679957, -0.7961429, 1, 1, 1, 1, 1,
-0.6179768, 0.8035991, 1.483646, 1, 1, 1, 1, 1,
-0.615244, -0.662243, -4.087633, 1, 1, 1, 1, 1,
-0.6139092, 1.318664, 0.505517, 0, 0, 1, 1, 1,
-0.6068883, -0.5524463, -3.070704, 1, 0, 0, 1, 1,
-0.6054355, -3.164778, -2.951915, 1, 0, 0, 1, 1,
-0.5951924, -1.183338, -2.69734, 1, 0, 0, 1, 1,
-0.5913859, -0.4310192, -3.206281, 1, 0, 0, 1, 1,
-0.5903416, 2.431866, -1.358894, 1, 0, 0, 1, 1,
-0.5834797, -1.184243, -4.000601, 0, 0, 0, 1, 1,
-0.5793973, -1.333555, -2.371272, 0, 0, 0, 1, 1,
-0.573825, -0.6725098, -1.124341, 0, 0, 0, 1, 1,
-0.5694281, 1.520182, -0.6416489, 0, 0, 0, 1, 1,
-0.5623772, 0.02702949, -1.830812, 0, 0, 0, 1, 1,
-0.5613076, -1.122608, -4.47628, 0, 0, 0, 1, 1,
-0.5607246, -1.190229, -4.797821, 0, 0, 0, 1, 1,
-0.557271, 1.548388, -1.523884, 1, 1, 1, 1, 1,
-0.5554835, 0.5553487, -0.2497986, 1, 1, 1, 1, 1,
-0.5548525, 0.001555017, 0.2000052, 1, 1, 1, 1, 1,
-0.5469019, -0.6171023, -2.056695, 1, 1, 1, 1, 1,
-0.5465373, 0.2485919, -1.940835, 1, 1, 1, 1, 1,
-0.546423, 0.1512631, -0.6063327, 1, 1, 1, 1, 1,
-0.5414838, -1.152995, -2.591277, 1, 1, 1, 1, 1,
-0.5368205, 0.1314137, -2.145281, 1, 1, 1, 1, 1,
-0.5364798, 0.1131771, -0.8159304, 1, 1, 1, 1, 1,
-0.5340314, 0.9939176, -0.5437605, 1, 1, 1, 1, 1,
-0.5336161, -0.01485768, -2.136361, 1, 1, 1, 1, 1,
-0.5294737, -0.07055968, -1.725085, 1, 1, 1, 1, 1,
-0.5157701, 1.420691, -1.739816, 1, 1, 1, 1, 1,
-0.5066916, -0.02060525, -2.506572, 1, 1, 1, 1, 1,
-0.5053283, 0.5137584, -0.9875574, 1, 1, 1, 1, 1,
-0.5027214, 1.09527, 0.6625826, 0, 0, 1, 1, 1,
-0.5016097, 2.454557, 0.02777421, 1, 0, 0, 1, 1,
-0.4997396, 0.6019404, -0.3772883, 1, 0, 0, 1, 1,
-0.4964457, -0.5490344, -1.097866, 1, 0, 0, 1, 1,
-0.4960862, -0.6676697, -3.234377, 1, 0, 0, 1, 1,
-0.4926727, -0.5766686, -1.215668, 1, 0, 0, 1, 1,
-0.4919362, -1.443947, -2.385677, 0, 0, 0, 1, 1,
-0.488935, -1.43194, -4.018144, 0, 0, 0, 1, 1,
-0.4878771, -0.4095469, -1.450812, 0, 0, 0, 1, 1,
-0.4865775, -0.7157155, -2.302417, 0, 0, 0, 1, 1,
-0.4863734, -0.6867563, -2.765413, 0, 0, 0, 1, 1,
-0.4799473, 0.5004404, 0.3312781, 0, 0, 0, 1, 1,
-0.4787502, 0.01464133, -1.06266, 0, 0, 0, 1, 1,
-0.4775007, -0.6321625, -3.714174, 1, 1, 1, 1, 1,
-0.4754866, 0.2739845, -2.095828, 1, 1, 1, 1, 1,
-0.4716377, -1.144346, -2.694854, 1, 1, 1, 1, 1,
-0.4691324, 0.08611191, -0.2001002, 1, 1, 1, 1, 1,
-0.4666345, 1.468687, 0.4874105, 1, 1, 1, 1, 1,
-0.465741, 0.256006, -0.9106573, 1, 1, 1, 1, 1,
-0.4651603, 0.4935785, -1.303835, 1, 1, 1, 1, 1,
-0.4632594, -0.02428074, -1.30004, 1, 1, 1, 1, 1,
-0.4613273, 0.2874248, -2.341887, 1, 1, 1, 1, 1,
-0.4597647, -0.08820227, -2.467233, 1, 1, 1, 1, 1,
-0.4580658, -0.5880561, -4.143639, 1, 1, 1, 1, 1,
-0.4563703, 0.1806983, -0.05042244, 1, 1, 1, 1, 1,
-0.4559298, 0.8852414, 0.3803747, 1, 1, 1, 1, 1,
-0.4532597, -0.03073412, -2.057922, 1, 1, 1, 1, 1,
-0.4495962, 0.693762, 0.01294192, 1, 1, 1, 1, 1,
-0.4446343, -0.8713914, -3.085801, 0, 0, 1, 1, 1,
-0.4428198, -0.7351419, -1.725328, 1, 0, 0, 1, 1,
-0.4423842, 0.3918284, -1.494907, 1, 0, 0, 1, 1,
-0.4405361, -1.09487, -2.940965, 1, 0, 0, 1, 1,
-0.4404926, -0.8989295, -1.540245, 1, 0, 0, 1, 1,
-0.4380085, -0.04554076, -1.134568, 1, 0, 0, 1, 1,
-0.435812, 0.3109985, -0.5815423, 0, 0, 0, 1, 1,
-0.4291777, 3.245951, 1.135028, 0, 0, 0, 1, 1,
-0.4291735, 0.6278563, -0.6185198, 0, 0, 0, 1, 1,
-0.4275138, 0.3087293, 1.228253, 0, 0, 0, 1, 1,
-0.4256452, 0.5428683, 0.7920559, 0, 0, 0, 1, 1,
-0.4246908, 0.3981977, 0.0615675, 0, 0, 0, 1, 1,
-0.4234146, 1.446518, -1.041638, 0, 0, 0, 1, 1,
-0.42121, -0.0157591, -2.273503, 1, 1, 1, 1, 1,
-0.4201832, -0.8249195, -2.38009, 1, 1, 1, 1, 1,
-0.4187869, 0.07475924, 0.1652268, 1, 1, 1, 1, 1,
-0.4168244, -1.444638, -2.952474, 1, 1, 1, 1, 1,
-0.4141358, -1.291351, -3.98569, 1, 1, 1, 1, 1,
-0.414133, -0.08143599, 0.7730893, 1, 1, 1, 1, 1,
-0.405636, -1.452859, -2.486945, 1, 1, 1, 1, 1,
-0.4026006, -0.4586867, -4.132815, 1, 1, 1, 1, 1,
-0.3860739, -0.4111879, -1.563995, 1, 1, 1, 1, 1,
-0.3842163, -0.7815297, -2.342535, 1, 1, 1, 1, 1,
-0.3824888, 0.2399759, -2.019849, 1, 1, 1, 1, 1,
-0.3798173, 0.7386318, 1.315458, 1, 1, 1, 1, 1,
-0.3791851, -0.2204683, -2.234356, 1, 1, 1, 1, 1,
-0.379074, 0.3346048, -1.313322, 1, 1, 1, 1, 1,
-0.3787, -0.660475, -0.587726, 1, 1, 1, 1, 1,
-0.3770143, 2.234645, -0.06095457, 0, 0, 1, 1, 1,
-0.3749785, -0.8734089, -3.24868, 1, 0, 0, 1, 1,
-0.3681929, -1.104838, -2.607566, 1, 0, 0, 1, 1,
-0.3652781, 0.4205943, -0.5673357, 1, 0, 0, 1, 1,
-0.3628622, 1.750759, 0.0351515, 1, 0, 0, 1, 1,
-0.3615754, 0.8373169, -0.3262255, 1, 0, 0, 1, 1,
-0.3606329, -0.955137, -3.724609, 0, 0, 0, 1, 1,
-0.355827, -2.707062, -3.005922, 0, 0, 0, 1, 1,
-0.3513732, -1.01159, -2.976111, 0, 0, 0, 1, 1,
-0.3505583, 1.930935, -1.245196, 0, 0, 0, 1, 1,
-0.3472664, -0.7011201, -3.060894, 0, 0, 0, 1, 1,
-0.3443469, -0.1444837, -0.09692524, 0, 0, 0, 1, 1,
-0.343676, -0.8311681, -2.315355, 0, 0, 0, 1, 1,
-0.3392727, 0.9469894, -0.8722484, 1, 1, 1, 1, 1,
-0.3353393, 1.086575, -0.6690959, 1, 1, 1, 1, 1,
-0.3311096, -2.233677, -4.386562, 1, 1, 1, 1, 1,
-0.3305976, -0.6417364, -2.988304, 1, 1, 1, 1, 1,
-0.3295332, -0.1399374, -1.439296, 1, 1, 1, 1, 1,
-0.3282503, 0.6962226, 0.66343, 1, 1, 1, 1, 1,
-0.3263742, -1.389035, -3.610188, 1, 1, 1, 1, 1,
-0.3260807, -0.5901722, -2.399918, 1, 1, 1, 1, 1,
-0.3238022, 0.04176207, -2.061254, 1, 1, 1, 1, 1,
-0.322387, 1.537756, -0.4786085, 1, 1, 1, 1, 1,
-0.3158911, 0.4629808, -1.334785, 1, 1, 1, 1, 1,
-0.312732, 1.312488, 0.4923985, 1, 1, 1, 1, 1,
-0.3090535, -0.4863652, -2.158147, 1, 1, 1, 1, 1,
-0.305905, -1.528074, -0.2983393, 1, 1, 1, 1, 1,
-0.2962659, 1.283471, -0.3750151, 1, 1, 1, 1, 1,
-0.2957357, -1.169157, -3.050036, 0, 0, 1, 1, 1,
-0.2931452, 1.067518, -0.8338832, 1, 0, 0, 1, 1,
-0.2911893, 1.089903, -0.1624863, 1, 0, 0, 1, 1,
-0.2911391, 0.5848576, 0.3004259, 1, 0, 0, 1, 1,
-0.2852571, -2.159231, -3.009426, 1, 0, 0, 1, 1,
-0.2811734, 1.232816, -0.8056737, 1, 0, 0, 1, 1,
-0.2797987, -0.3390222, -2.174003, 0, 0, 0, 1, 1,
-0.2794787, 1.172673, 2.297723, 0, 0, 0, 1, 1,
-0.2678466, 2.151142, 0.8262798, 0, 0, 0, 1, 1,
-0.265667, 0.9767596, -0.5410727, 0, 0, 0, 1, 1,
-0.2644642, 0.5331677, 2.010281, 0, 0, 0, 1, 1,
-0.2599837, 0.1372462, -1.096414, 0, 0, 0, 1, 1,
-0.2585267, -0.5275119, -1.946561, 0, 0, 0, 1, 1,
-0.2573138, -0.8599861, -2.254244, 1, 1, 1, 1, 1,
-0.2565387, 0.4864768, -0.1745863, 1, 1, 1, 1, 1,
-0.2563842, 0.9309705, 0.4883418, 1, 1, 1, 1, 1,
-0.2537126, -0.4947375, -2.881022, 1, 1, 1, 1, 1,
-0.2514237, -1.142512, -5.504326, 1, 1, 1, 1, 1,
-0.2509743, 0.4963234, -1.22683, 1, 1, 1, 1, 1,
-0.2504785, -0.8401654, -3.046156, 1, 1, 1, 1, 1,
-0.2494895, 1.217495, 0.8799803, 1, 1, 1, 1, 1,
-0.2487274, -0.1408917, -3.508285, 1, 1, 1, 1, 1,
-0.2409108, 0.1953076, -0.1566486, 1, 1, 1, 1, 1,
-0.2407387, 1.611011, -1.084797, 1, 1, 1, 1, 1,
-0.2401249, 0.2582817, -1.844438, 1, 1, 1, 1, 1,
-0.2380214, -0.3205311, -2.229988, 1, 1, 1, 1, 1,
-0.2377826, 0.3003607, 0.9496814, 1, 1, 1, 1, 1,
-0.2347007, 0.07500681, -1.258476, 1, 1, 1, 1, 1,
-0.2281183, 0.08632479, -0.1694539, 0, 0, 1, 1, 1,
-0.2181317, 0.3050919, -0.1679307, 1, 0, 0, 1, 1,
-0.2141067, 1.871915, 0.4723419, 1, 0, 0, 1, 1,
-0.211746, 1.005043, -2.167909, 1, 0, 0, 1, 1,
-0.2081196, 2.181972, -0.4877373, 1, 0, 0, 1, 1,
-0.2026318, -0.6040268, -2.830617, 1, 0, 0, 1, 1,
-0.1998296, 0.3202597, 0.3970693, 0, 0, 0, 1, 1,
-0.1967469, -2.271212, -3.742513, 0, 0, 0, 1, 1,
-0.1961576, -0.4815159, -3.672462, 0, 0, 0, 1, 1,
-0.1959032, 0.522613, -0.4125924, 0, 0, 0, 1, 1,
-0.1918133, 0.7971133, 0.5849575, 0, 0, 0, 1, 1,
-0.1894277, -1.366019, -3.198106, 0, 0, 0, 1, 1,
-0.1874934, 0.1182224, -0.3444686, 0, 0, 0, 1, 1,
-0.1873577, 0.2054431, -1.971946, 1, 1, 1, 1, 1,
-0.1822769, 0.7039892, -0.2354472, 1, 1, 1, 1, 1,
-0.1803021, -0.2266944, -3.012378, 1, 1, 1, 1, 1,
-0.1739201, -0.3078792, -3.054722, 1, 1, 1, 1, 1,
-0.1658847, -0.211731, -4.414083, 1, 1, 1, 1, 1,
-0.1621486, -0.7731522, -2.757967, 1, 1, 1, 1, 1,
-0.1616696, 0.1006705, -1.968507, 1, 1, 1, 1, 1,
-0.1609901, 0.1691456, 0.2793665, 1, 1, 1, 1, 1,
-0.1578932, -0.2649172, -2.01635, 1, 1, 1, 1, 1,
-0.1578869, -0.4745929, -2.375165, 1, 1, 1, 1, 1,
-0.1568488, 0.9065166, -0.3338828, 1, 1, 1, 1, 1,
-0.1556623, -0.9922192, -2.894541, 1, 1, 1, 1, 1,
-0.1519655, 0.3870395, -0.1453352, 1, 1, 1, 1, 1,
-0.1503314, -0.2305132, -3.596876, 1, 1, 1, 1, 1,
-0.1502564, -0.4970302, -3.663702, 1, 1, 1, 1, 1,
-0.1428907, 2.536044, -0.1971861, 0, 0, 1, 1, 1,
-0.1392108, -0.4785764, -2.622181, 1, 0, 0, 1, 1,
-0.1354104, 0.385329, 0.3462171, 1, 0, 0, 1, 1,
-0.135324, -0.05856746, -0.3106906, 1, 0, 0, 1, 1,
-0.1286013, -0.04909283, -3.002886, 1, 0, 0, 1, 1,
-0.1278241, -1.739174, -3.814727, 1, 0, 0, 1, 1,
-0.1263335, 0.6375712, -2.470619, 0, 0, 0, 1, 1,
-0.1259245, -1.981237, -3.660733, 0, 0, 0, 1, 1,
-0.1201333, 1.033369, 0.09941347, 0, 0, 0, 1, 1,
-0.1132464, 1.388713, 0.04041633, 0, 0, 0, 1, 1,
-0.1131011, -0.7858876, -3.88764, 0, 0, 0, 1, 1,
-0.1102457, 1.233784, -0.1660196, 0, 0, 0, 1, 1,
-0.1098665, 2.099984, -0.4670016, 0, 0, 0, 1, 1,
-0.1085067, 1.819358, -0.3580631, 1, 1, 1, 1, 1,
-0.1081889, -0.5452341, -2.000349, 1, 1, 1, 1, 1,
-0.1080291, 0.4666921, 0.5734791, 1, 1, 1, 1, 1,
-0.1069443, -0.2692972, -2.701148, 1, 1, 1, 1, 1,
-0.1067443, 1.150405, -0.1553793, 1, 1, 1, 1, 1,
-0.09556378, 0.720531, -2.005918, 1, 1, 1, 1, 1,
-0.09323008, -0.2554657, -1.27312, 1, 1, 1, 1, 1,
-0.09073152, -0.5660452, -3.299684, 1, 1, 1, 1, 1,
-0.08940387, -0.3204554, -2.711613, 1, 1, 1, 1, 1,
-0.08859088, -0.1047753, -2.036192, 1, 1, 1, 1, 1,
-0.08372674, -0.62159, -3.688345, 1, 1, 1, 1, 1,
-0.08238897, 0.2628038, 0.5240848, 1, 1, 1, 1, 1,
-0.08164232, 1.566861, -0.1494677, 1, 1, 1, 1, 1,
-0.0812049, 0.580855, 0.2239659, 1, 1, 1, 1, 1,
-0.07726866, -0.8457465, -2.671375, 1, 1, 1, 1, 1,
-0.07633199, -0.5365306, -2.633593, 0, 0, 1, 1, 1,
-0.07277543, -0.05678739, -1.607968, 1, 0, 0, 1, 1,
-0.07262838, 0.1305414, -0.365049, 1, 0, 0, 1, 1,
-0.07247169, -0.8634533, -3.647945, 1, 0, 0, 1, 1,
-0.06547895, 1.072499, 2.837076, 1, 0, 0, 1, 1,
-0.06421562, -0.3826628, -4.084429, 1, 0, 0, 1, 1,
-0.06256393, -1.090047, -3.234582, 0, 0, 0, 1, 1,
-0.0604232, -0.6246199, -2.681463, 0, 0, 0, 1, 1,
-0.05398652, -2.150971, -4.536474, 0, 0, 0, 1, 1,
-0.04661109, -0.8468902, -2.200547, 0, 0, 0, 1, 1,
-0.04577278, -0.4461476, -5.91127, 0, 0, 0, 1, 1,
-0.0427517, -2.242076, -1.525683, 0, 0, 0, 1, 1,
-0.04251006, 0.936478, -0.2235872, 0, 0, 0, 1, 1,
-0.04236001, -0.1935893, -3.815119, 1, 1, 1, 1, 1,
-0.04224824, -0.6301849, -2.548295, 1, 1, 1, 1, 1,
-0.04183511, -0.2471022, -4.340089, 1, 1, 1, 1, 1,
-0.03747415, 0.6151419, -1.555784, 1, 1, 1, 1, 1,
-0.03519999, -1.791029, -3.145499, 1, 1, 1, 1, 1,
-0.03484722, -1.566704, -2.490691, 1, 1, 1, 1, 1,
-0.03398425, -1.452471, -4.313643, 1, 1, 1, 1, 1,
-0.03324196, 0.3205794, -0.1885259, 1, 1, 1, 1, 1,
-0.03304452, -0.7055832, -4.341037, 1, 1, 1, 1, 1,
-0.03209296, -0.9010599, -4.216475, 1, 1, 1, 1, 1,
-0.03002484, -0.06622217, -2.124762, 1, 1, 1, 1, 1,
-0.02344898, -0.5416195, -4.423591, 1, 1, 1, 1, 1,
-0.02054958, -1.429379, -3.684048, 1, 1, 1, 1, 1,
-0.02006718, -0.07938188, -2.307946, 1, 1, 1, 1, 1,
-0.01597605, -1.651079, -3.702956, 1, 1, 1, 1, 1,
-0.01539262, -0.150397, -4.291767, 0, 0, 1, 1, 1,
-0.01342856, 1.207694, -0.8515193, 1, 0, 0, 1, 1,
-0.01213432, -1.366077, -3.700615, 1, 0, 0, 1, 1,
-0.007708184, -1.230769, -3.224578, 1, 0, 0, 1, 1,
-0.0006727631, -0.1789208, -3.082011, 1, 0, 0, 1, 1,
0.00147268, -1.729765, 2.903568, 1, 0, 0, 1, 1,
0.002518759, 0.8743728, 1.156505, 0, 0, 0, 1, 1,
0.006152476, 0.713648, 0.2973101, 0, 0, 0, 1, 1,
0.008573176, 0.2419327, 0.6505392, 0, 0, 0, 1, 1,
0.01354911, -0.01750142, 2.866432, 0, 0, 0, 1, 1,
0.02094349, -1.214672, 2.889131, 0, 0, 0, 1, 1,
0.02448847, 0.5273688, 0.9538293, 0, 0, 0, 1, 1,
0.02472444, -0.4286716, 3.58851, 0, 0, 0, 1, 1,
0.02549621, 0.6238698, -0.8952345, 1, 1, 1, 1, 1,
0.02740439, -0.1539578, 3.315411, 1, 1, 1, 1, 1,
0.02840173, 0.1141232, 0.3897513, 1, 1, 1, 1, 1,
0.02882788, -2.352046, 4.235653, 1, 1, 1, 1, 1,
0.02956707, -0.8795879, 2.188993, 1, 1, 1, 1, 1,
0.03119612, 0.7847366, 0.3194659, 1, 1, 1, 1, 1,
0.03183379, 0.8422757, -0.7836645, 1, 1, 1, 1, 1,
0.03422608, 1.410498, -1.400813, 1, 1, 1, 1, 1,
0.03548772, -0.1778674, 2.98075, 1, 1, 1, 1, 1,
0.03927971, -1.298343, 2.045828, 1, 1, 1, 1, 1,
0.04135587, 0.6455159, 0.4109719, 1, 1, 1, 1, 1,
0.04548592, 1.536532, 0.03464457, 1, 1, 1, 1, 1,
0.04678575, 0.7536108, 0.6502171, 1, 1, 1, 1, 1,
0.04831373, -0.1910579, 1.077887, 1, 1, 1, 1, 1,
0.0491613, 0.01660296, 2.044476, 1, 1, 1, 1, 1,
0.04997603, 0.1191009, -0.06248949, 0, 0, 1, 1, 1,
0.05012591, -1.792361, 3.543638, 1, 0, 0, 1, 1,
0.05198465, -1.429955, 3.584457, 1, 0, 0, 1, 1,
0.05266094, -2.378407, 2.244384, 1, 0, 0, 1, 1,
0.05488718, 0.4036904, -0.2384525, 1, 0, 0, 1, 1,
0.05875594, -1.898772, 0.3771566, 1, 0, 0, 1, 1,
0.05967758, -0.9306003, 4.891547, 0, 0, 0, 1, 1,
0.06101616, -0.7478414, 3.742502, 0, 0, 0, 1, 1,
0.06601224, 0.4379351, -0.2906284, 0, 0, 0, 1, 1,
0.07078041, -0.00661543, 0.9233852, 0, 0, 0, 1, 1,
0.07212381, -1.085324, 3.039212, 0, 0, 0, 1, 1,
0.07562075, -0.8370584, 2.473449, 0, 0, 0, 1, 1,
0.07780106, 1.386646, -0.3234502, 0, 0, 0, 1, 1,
0.0793646, -0.3881104, 2.228083, 1, 1, 1, 1, 1,
0.08231802, -1.104651, 2.00226, 1, 1, 1, 1, 1,
0.08642716, -0.466554, 4.556973, 1, 1, 1, 1, 1,
0.08734877, -0.4078507, 4.018678, 1, 1, 1, 1, 1,
0.08822265, 0.3542861, 0.2893829, 1, 1, 1, 1, 1,
0.08847495, -1.373575, 3.740634, 1, 1, 1, 1, 1,
0.08980671, -0.3061695, 3.291925, 1, 1, 1, 1, 1,
0.09030781, 1.15932, 0.3518559, 1, 1, 1, 1, 1,
0.09531453, -0.3136807, 3.118819, 1, 1, 1, 1, 1,
0.09756184, -0.6157416, 2.650154, 1, 1, 1, 1, 1,
0.1001342, 0.2853483, 0.5077852, 1, 1, 1, 1, 1,
0.1027891, 0.2591673, -1.038593, 1, 1, 1, 1, 1,
0.1043742, -0.7072872, 5.499384, 1, 1, 1, 1, 1,
0.1090249, -1.815611, 3.074689, 1, 1, 1, 1, 1,
0.1125097, -0.2039692, 3.511425, 1, 1, 1, 1, 1,
0.1126858, -0.5053343, 1.731014, 0, 0, 1, 1, 1,
0.117363, 0.4185017, 1.169153, 1, 0, 0, 1, 1,
0.118829, 0.8095405, 0.5644943, 1, 0, 0, 1, 1,
0.1200427, -0.2585395, 3.902699, 1, 0, 0, 1, 1,
0.120372, -0.8375683, 2.045892, 1, 0, 0, 1, 1,
0.1225784, -1.236692, 2.79603, 1, 0, 0, 1, 1,
0.1231555, 0.8717123, 0.6567018, 0, 0, 0, 1, 1,
0.1256717, -0.5527527, 3.4191, 0, 0, 0, 1, 1,
0.1270553, 3.10419, -0.4259989, 0, 0, 0, 1, 1,
0.1285148, 0.691938, -0.04981417, 0, 0, 0, 1, 1,
0.1294166, 0.5273669, -0.8543444, 0, 0, 0, 1, 1,
0.1326635, -2.094712, 2.513085, 0, 0, 0, 1, 1,
0.1336071, 1.230944, 0.3556012, 0, 0, 0, 1, 1,
0.1345941, -0.6128721, 3.02574, 1, 1, 1, 1, 1,
0.1376944, 0.1200346, 0.2909845, 1, 1, 1, 1, 1,
0.1395175, 0.110713, 1.179906, 1, 1, 1, 1, 1,
0.1401105, -0.5238361, 0.3393805, 1, 1, 1, 1, 1,
0.1412155, 1.565863, 0.8607836, 1, 1, 1, 1, 1,
0.1416, 0.6581084, 1.023447, 1, 1, 1, 1, 1,
0.1443271, 1.858676, -1.968896, 1, 1, 1, 1, 1,
0.1453656, 1.187248, 0.1994086, 1, 1, 1, 1, 1,
0.1462299, 1.278241, 0.4894731, 1, 1, 1, 1, 1,
0.1469142, 0.4020577, -0.06757519, 1, 1, 1, 1, 1,
0.1498957, 1.569919, 0.3517128, 1, 1, 1, 1, 1,
0.1533559, 0.6706927, -0.2554128, 1, 1, 1, 1, 1,
0.1564385, -1.87541, 3.813748, 1, 1, 1, 1, 1,
0.1631417, -0.2115269, 3.004736, 1, 1, 1, 1, 1,
0.1648452, 1.327724, 0.840035, 1, 1, 1, 1, 1,
0.170881, 2.186803, -1.571999, 0, 0, 1, 1, 1,
0.1779181, 0.3525403, -0.7094341, 1, 0, 0, 1, 1,
0.1808652, -1.283448, 4.687016, 1, 0, 0, 1, 1,
0.18193, -0.4262015, 2.764624, 1, 0, 0, 1, 1,
0.184129, -0.9519421, 3.164396, 1, 0, 0, 1, 1,
0.1864538, 0.09751292, 1.34061, 1, 0, 0, 1, 1,
0.1882198, -1.180847, 2.974403, 0, 0, 0, 1, 1,
0.1889675, 0.6415085, -2.249913, 0, 0, 0, 1, 1,
0.192604, -0.6148403, 1.350715, 0, 0, 0, 1, 1,
0.1932747, 1.457687, 0.7605774, 0, 0, 0, 1, 1,
0.1942916, 1.301895, 1.321529, 0, 0, 0, 1, 1,
0.1948252, -1.328832, 3.495614, 0, 0, 0, 1, 1,
0.1954021, -1.346661, 4.076757, 0, 0, 0, 1, 1,
0.1969332, 0.7722499, -0.8293946, 1, 1, 1, 1, 1,
0.1989482, 0.4910804, 1.927682, 1, 1, 1, 1, 1,
0.1998762, -0.5723199, 1.915, 1, 1, 1, 1, 1,
0.2008114, -0.1432552, 0.7876683, 1, 1, 1, 1, 1,
0.2018688, 0.7004939, 0.7610211, 1, 1, 1, 1, 1,
0.210146, -1.423878, 1.205107, 1, 1, 1, 1, 1,
0.211018, -0.9269935, 3.122054, 1, 1, 1, 1, 1,
0.2141338, 0.2052131, 1.545313, 1, 1, 1, 1, 1,
0.2211523, -0.6753566, 2.154874, 1, 1, 1, 1, 1,
0.2245821, -1.196775, 5.070937, 1, 1, 1, 1, 1,
0.2266902, 0.327741, 1.570469, 1, 1, 1, 1, 1,
0.2306089, -0.6357731, 3.740525, 1, 1, 1, 1, 1,
0.2333977, 1.280339, 0.1714809, 1, 1, 1, 1, 1,
0.2394904, 0.8262398, -0.6533388, 1, 1, 1, 1, 1,
0.2453566, 2.327513, 0.5119967, 1, 1, 1, 1, 1,
0.2454033, -0.8853558, 0.9509222, 0, 0, 1, 1, 1,
0.2467205, -1.021401, 1.154458, 1, 0, 0, 1, 1,
0.2525743, 1.266323, -1.135128, 1, 0, 0, 1, 1,
0.2538845, -0.7174643, 1.397235, 1, 0, 0, 1, 1,
0.2562261, -0.3794606, 1.663027, 1, 0, 0, 1, 1,
0.258545, -0.5758654, 2.97862, 1, 0, 0, 1, 1,
0.2587463, 1.116782, -0.5594884, 0, 0, 0, 1, 1,
0.2599198, -1.348676, 2.747986, 0, 0, 0, 1, 1,
0.2641681, -0.09359433, 2.434712, 0, 0, 0, 1, 1,
0.2677086, 0.4094483, 1.454279, 0, 0, 0, 1, 1,
0.2689615, 1.726929, -0.05399242, 0, 0, 0, 1, 1,
0.2703097, -1.097948, 3.020294, 0, 0, 0, 1, 1,
0.2798688, 0.9373484, 0.4027749, 0, 0, 0, 1, 1,
0.2804621, -1.095165, 4.755803, 1, 1, 1, 1, 1,
0.2819058, 1.560623, 0.1102572, 1, 1, 1, 1, 1,
0.2856421, -0.2400816, 2.478792, 1, 1, 1, 1, 1,
0.2869652, -0.7978935, 2.871022, 1, 1, 1, 1, 1,
0.2875077, -0.9052124, 2.972373, 1, 1, 1, 1, 1,
0.2917485, 1.049448, 1.339702, 1, 1, 1, 1, 1,
0.2920257, -0.910579, 1.626766, 1, 1, 1, 1, 1,
0.2938446, 1.714176, 1.915036, 1, 1, 1, 1, 1,
0.295393, -0.5536249, 1.183346, 1, 1, 1, 1, 1,
0.2968416, -0.2390953, 0.4444912, 1, 1, 1, 1, 1,
0.2972796, -0.2693901, 4.839911, 1, 1, 1, 1, 1,
0.2995175, 0.4540391, -1.734596, 1, 1, 1, 1, 1,
0.3016096, -0.4646949, 3.907888, 1, 1, 1, 1, 1,
0.3057559, 1.847025, 0.2006848, 1, 1, 1, 1, 1,
0.3090762, 0.3989705, -0.2608639, 1, 1, 1, 1, 1,
0.3118541, -1.082172, 2.502635, 0, 0, 1, 1, 1,
0.3139745, 0.7596381, 0.3135129, 1, 0, 0, 1, 1,
0.3142313, 1.335495, 0.3026341, 1, 0, 0, 1, 1,
0.3150787, -0.04767196, 1.077744, 1, 0, 0, 1, 1,
0.3185256, 0.2470811, 2.046856, 1, 0, 0, 1, 1,
0.3209751, -0.6700548, 2.55997, 1, 0, 0, 1, 1,
0.3225094, -0.2908936, 0.8328265, 0, 0, 0, 1, 1,
0.3225779, -0.5226709, 1.987444, 0, 0, 0, 1, 1,
0.3234077, 0.4367699, 0.2627747, 0, 0, 0, 1, 1,
0.3277748, 0.1118884, 2.85417, 0, 0, 0, 1, 1,
0.3314667, -1.018646, 2.560081, 0, 0, 0, 1, 1,
0.3321099, -0.8092908, 3.39997, 0, 0, 0, 1, 1,
0.3339018, 0.7205669, 2.04658, 0, 0, 0, 1, 1,
0.3356889, -0.335525, 0.7277167, 1, 1, 1, 1, 1,
0.3360097, -0.8382814, 3.057225, 1, 1, 1, 1, 1,
0.3403557, -0.8451335, 2.642938, 1, 1, 1, 1, 1,
0.3427354, -0.7158218, 2.99192, 1, 1, 1, 1, 1,
0.346711, 1.001269, -0.7969371, 1, 1, 1, 1, 1,
0.3509898, 0.3109261, 1.290477, 1, 1, 1, 1, 1,
0.3522338, 0.6194157, 1.20353, 1, 1, 1, 1, 1,
0.3610227, 0.2077556, 1.363422, 1, 1, 1, 1, 1,
0.3712491, 1.150979, 0.6107543, 1, 1, 1, 1, 1,
0.37388, -0.9675273, 2.200267, 1, 1, 1, 1, 1,
0.3738819, 1.3922, 0.6852285, 1, 1, 1, 1, 1,
0.3739649, -0.1306642, 1.425649, 1, 1, 1, 1, 1,
0.3754008, 0.5107293, -0.1456464, 1, 1, 1, 1, 1,
0.37651, -1.691189, 2.741984, 1, 1, 1, 1, 1,
0.3770413, 0.007130994, 1.116504, 1, 1, 1, 1, 1,
0.3792319, -0.5515087, 2.602555, 0, 0, 1, 1, 1,
0.3806143, 0.6459383, 1.170498, 1, 0, 0, 1, 1,
0.3817421, -0.5600945, 1.188071, 1, 0, 0, 1, 1,
0.3846556, 2.30856, -0.07681151, 1, 0, 0, 1, 1,
0.3902348, 2.653449, 0.7138115, 1, 0, 0, 1, 1,
0.3940781, -0.6388254, 3.176569, 1, 0, 0, 1, 1,
0.397187, 1.206225, 1.032387, 0, 0, 0, 1, 1,
0.3999793, -1.087492, 3.096213, 0, 0, 0, 1, 1,
0.4000832, -0.692129, 4.28881, 0, 0, 0, 1, 1,
0.403793, 0.558889, -0.4690086, 0, 0, 0, 1, 1,
0.4085764, -0.1753242, 2.95241, 0, 0, 0, 1, 1,
0.4110189, -0.8597077, 1.991728, 0, 0, 0, 1, 1,
0.4111366, 0.8736148, 1.188906, 0, 0, 0, 1, 1,
0.4122655, 0.4558796, 2.18732, 1, 1, 1, 1, 1,
0.4157934, 0.08523609, 0.9806004, 1, 1, 1, 1, 1,
0.417923, 0.8352452, 0.08749937, 1, 1, 1, 1, 1,
0.4195928, 0.05439467, 0.4756522, 1, 1, 1, 1, 1,
0.421425, 2.943696, 2.397478, 1, 1, 1, 1, 1,
0.4224943, -0.748394, 1.138196, 1, 1, 1, 1, 1,
0.4256864, 0.6596179, 2.075024, 1, 1, 1, 1, 1,
0.4269316, 0.821769, 0.0559097, 1, 1, 1, 1, 1,
0.427762, -0.1555625, 1.052278, 1, 1, 1, 1, 1,
0.4281028, 0.6834164, -1.013628, 1, 1, 1, 1, 1,
0.4333974, -0.9471701, 3.629652, 1, 1, 1, 1, 1,
0.4353516, -0.8862385, 1.417769, 1, 1, 1, 1, 1,
0.4368379, 0.5728906, -0.2291158, 1, 1, 1, 1, 1,
0.4378492, -0.3633694, 3.041009, 1, 1, 1, 1, 1,
0.4393388, 1.559361, -1.359342, 1, 1, 1, 1, 1,
0.4463803, 0.1390396, 1.655283, 0, 0, 1, 1, 1,
0.4474151, 0.7231627, 0.7903652, 1, 0, 0, 1, 1,
0.4475877, 1.316574, 1.002522, 1, 0, 0, 1, 1,
0.4501691, -1.63577, 3.341485, 1, 0, 0, 1, 1,
0.4538569, -0.9925209, 3.624324, 1, 0, 0, 1, 1,
0.4581703, -0.8745346, 2.056733, 1, 0, 0, 1, 1,
0.4585626, 1.137827, -0.1904483, 0, 0, 0, 1, 1,
0.4615442, 0.483371, 0.2523317, 0, 0, 0, 1, 1,
0.4632131, 0.5643883, 0.1920561, 0, 0, 0, 1, 1,
0.4701907, -0.2188958, 1.546189, 0, 0, 0, 1, 1,
0.4748244, -0.4459782, 2.863966, 0, 0, 0, 1, 1,
0.4800681, 0.01258099, 1.527986, 0, 0, 0, 1, 1,
0.480398, 1.089323, -0.040291, 0, 0, 0, 1, 1,
0.4808331, 0.4950933, 1.636988, 1, 1, 1, 1, 1,
0.482346, 0.3352027, 0.1265591, 1, 1, 1, 1, 1,
0.4887602, 0.8958148, 0.8478771, 1, 1, 1, 1, 1,
0.4921283, -0.388115, 2.173397, 1, 1, 1, 1, 1,
0.495406, -0.9674881, 2.346736, 1, 1, 1, 1, 1,
0.4959421, 0.8938418, 0.1128778, 1, 1, 1, 1, 1,
0.498498, -0.7319317, 3.604976, 1, 1, 1, 1, 1,
0.5091595, -0.2707225, 1.417575, 1, 1, 1, 1, 1,
0.5101778, 0.8243665, 0.4325458, 1, 1, 1, 1, 1,
0.5147112, -1.022661, 3.085388, 1, 1, 1, 1, 1,
0.5156448, 0.6513833, -0.3275512, 1, 1, 1, 1, 1,
0.5166124, 0.09941629, 1.144739, 1, 1, 1, 1, 1,
0.5212383, 0.6160684, 2.072838, 1, 1, 1, 1, 1,
0.5251958, 1.841109, 0.2786057, 1, 1, 1, 1, 1,
0.527033, -1.311613, 1.750819, 1, 1, 1, 1, 1,
0.5297974, -2.588207, 3.903361, 0, 0, 1, 1, 1,
0.5314352, 0.1186598, 1.499963, 1, 0, 0, 1, 1,
0.5352809, 0.6637719, -0.3085309, 1, 0, 0, 1, 1,
0.5363154, 0.190414, 0.1971997, 1, 0, 0, 1, 1,
0.5368415, -0.1452766, 1.351239, 1, 0, 0, 1, 1,
0.5376765, 0.3514457, 1.015515, 1, 0, 0, 1, 1,
0.5397266, -2.810004, 4.315231, 0, 0, 0, 1, 1,
0.5422574, -0.1340139, 1.319731, 0, 0, 0, 1, 1,
0.5431945, -2.77649, 1.350857, 0, 0, 0, 1, 1,
0.5483377, 0.3558108, 1.847008, 0, 0, 0, 1, 1,
0.5484656, -1.306962, 3.309996, 0, 0, 0, 1, 1,
0.5499148, -0.2436089, 1.145044, 0, 0, 0, 1, 1,
0.5502024, -1.396966, 3.998981, 0, 0, 0, 1, 1,
0.5567361, 0.2559549, 0.253583, 1, 1, 1, 1, 1,
0.5620497, 0.3070828, 1.520746, 1, 1, 1, 1, 1,
0.5676892, -0.1492326, 2.352729, 1, 1, 1, 1, 1,
0.5695884, -1.689959, 4.740265, 1, 1, 1, 1, 1,
0.5706118, 0.7822639, 0.1347478, 1, 1, 1, 1, 1,
0.5711753, -0.2041156, 1.868876, 1, 1, 1, 1, 1,
0.5717013, -0.3772656, 1.823402, 1, 1, 1, 1, 1,
0.5724092, 1.195742, -0.6177444, 1, 1, 1, 1, 1,
0.5733125, -0.9884404, 3.555462, 1, 1, 1, 1, 1,
0.5737351, -1.229614, 4.13482, 1, 1, 1, 1, 1,
0.5750074, 1.136228, -0.2656892, 1, 1, 1, 1, 1,
0.575969, 1.98983, -0.2441011, 1, 1, 1, 1, 1,
0.5765269, 0.1424399, 1.278884, 1, 1, 1, 1, 1,
0.5828745, 0.2193214, 0.6976173, 1, 1, 1, 1, 1,
0.5854217, -2.96265, 3.323805, 1, 1, 1, 1, 1,
0.5914811, 1.213451, -0.6041194, 0, 0, 1, 1, 1,
0.5931449, 0.5428665, 2.500826, 1, 0, 0, 1, 1,
0.593685, 1.899769, -1.378487, 1, 0, 0, 1, 1,
0.5957602, 0.324112, 0.6241472, 1, 0, 0, 1, 1,
0.6060516, -1.184797, 2.803145, 1, 0, 0, 1, 1,
0.6078213, -1.138017, 4.284571, 1, 0, 0, 1, 1,
0.6135131, 1.478369, 1.947039, 0, 0, 0, 1, 1,
0.6176984, 0.9275817, -1.411709, 0, 0, 0, 1, 1,
0.6180072, 1.349808, 1.273692, 0, 0, 0, 1, 1,
0.6191776, 1.067222, 0.8380201, 0, 0, 0, 1, 1,
0.6207938, 0.6434067, 1.320809, 0, 0, 0, 1, 1,
0.6230472, 1.219677, 1.046317, 0, 0, 0, 1, 1,
0.6349331, 0.5819276, 1.136841, 0, 0, 0, 1, 1,
0.6352516, 0.2701629, 0.9889463, 1, 1, 1, 1, 1,
0.642177, -0.8422356, 2.054701, 1, 1, 1, 1, 1,
0.6423582, 0.6945311, 0.5195255, 1, 1, 1, 1, 1,
0.6424904, -0.6123664, 2.195332, 1, 1, 1, 1, 1,
0.643025, 0.1918128, 0.09444327, 1, 1, 1, 1, 1,
0.6536214, -0.6294178, 2.202183, 1, 1, 1, 1, 1,
0.6552894, -0.8164222, 2.413027, 1, 1, 1, 1, 1,
0.6580483, -0.06026212, 1.829772, 1, 1, 1, 1, 1,
0.65885, -0.2090587, 2.113211, 1, 1, 1, 1, 1,
0.6603492, -0.3578243, 2.532893, 1, 1, 1, 1, 1,
0.661437, -0.3549994, 1.958076, 1, 1, 1, 1, 1,
0.6622456, 0.04166031, 0.01638312, 1, 1, 1, 1, 1,
0.6635588, 2.199537, 0.3850652, 1, 1, 1, 1, 1,
0.6659122, -0.753297, 1.297007, 1, 1, 1, 1, 1,
0.6668276, 1.798643, 0.388978, 1, 1, 1, 1, 1,
0.6799889, -0.1874867, 3.262228, 0, 0, 1, 1, 1,
0.6832996, 0.6815295, 1.005016, 1, 0, 0, 1, 1,
0.6859098, 0.221326, 0.9247358, 1, 0, 0, 1, 1,
0.6875944, 1.095826, 0.04693653, 1, 0, 0, 1, 1,
0.6894916, 2.033268, -0.2522368, 1, 0, 0, 1, 1,
0.6957827, -0.3397645, 2.366076, 1, 0, 0, 1, 1,
0.6966187, -0.4537503, 2.925284, 0, 0, 0, 1, 1,
0.7033768, -2.638606, 3.644027, 0, 0, 0, 1, 1,
0.7138617, -0.6428608, 2.750306, 0, 0, 0, 1, 1,
0.7237693, 0.3986508, 0.1926163, 0, 0, 0, 1, 1,
0.728269, -0.1542426, 2.271354, 0, 0, 0, 1, 1,
0.7318357, 0.6359179, 0.8088087, 0, 0, 0, 1, 1,
0.7323305, 0.1542691, 1.606624, 0, 0, 0, 1, 1,
0.7380399, -0.6014559, 1.679737, 1, 1, 1, 1, 1,
0.7458031, -0.00822977, -0.5987467, 1, 1, 1, 1, 1,
0.7489853, -1.114201, 2.895856, 1, 1, 1, 1, 1,
0.7519128, -0.558265, 1.449939, 1, 1, 1, 1, 1,
0.7529551, 0.580959, 0.3687119, 1, 1, 1, 1, 1,
0.7537131, -0.5765114, 2.829956, 1, 1, 1, 1, 1,
0.7560648, 0.5026176, 1.606816, 1, 1, 1, 1, 1,
0.760379, 0.4575097, 0.7956795, 1, 1, 1, 1, 1,
0.762154, -1.460727, 2.742585, 1, 1, 1, 1, 1,
0.763045, -1.50104, 4.311993, 1, 1, 1, 1, 1,
0.7728972, -1.01377, 2.694148, 1, 1, 1, 1, 1,
0.77374, -1.893107, 3.186225, 1, 1, 1, 1, 1,
0.7767912, 0.4994284, 1.872471, 1, 1, 1, 1, 1,
0.7770518, -1.509504, 3.411778, 1, 1, 1, 1, 1,
0.7858344, 0.2430188, 0.9595639, 1, 1, 1, 1, 1,
0.7869736, -0.277595, 3.045334, 0, 0, 1, 1, 1,
0.7880708, 2.012447, 0.5109931, 1, 0, 0, 1, 1,
0.7958572, 0.8640878, 0.7384064, 1, 0, 0, 1, 1,
0.7988933, -0.5721526, 3.367109, 1, 0, 0, 1, 1,
0.7990842, 1.697954, 0.3611263, 1, 0, 0, 1, 1,
0.8006437, 0.1344671, 1.725594, 1, 0, 0, 1, 1,
0.8061786, -0.04746833, 3.018887, 0, 0, 0, 1, 1,
0.8104778, 0.4718339, 0.4649892, 0, 0, 0, 1, 1,
0.8121766, -0.5401001, 2.801229, 0, 0, 0, 1, 1,
0.8157077, 0.2935449, -0.03681483, 0, 0, 0, 1, 1,
0.8265531, 0.1418842, 1.041441, 0, 0, 0, 1, 1,
0.8278773, 0.0231727, 1.136925, 0, 0, 0, 1, 1,
0.8327591, -0.2828034, 0.7895699, 0, 0, 0, 1, 1,
0.8350444, 1.417038, 0.1928759, 1, 1, 1, 1, 1,
0.8389383, 0.5506659, 1.98509, 1, 1, 1, 1, 1,
0.8401182, 1.124147, 1.955728, 1, 1, 1, 1, 1,
0.8418219, -1.739833, 2.223746, 1, 1, 1, 1, 1,
0.8444986, -1.312263, 2.735078, 1, 1, 1, 1, 1,
0.8464407, -0.4913534, 0.5950158, 1, 1, 1, 1, 1,
0.8585476, 0.02219048, 0.2718096, 1, 1, 1, 1, 1,
0.8603779, 0.7575742, -1.477218, 1, 1, 1, 1, 1,
0.8609003, -0.409468, 3.33007, 1, 1, 1, 1, 1,
0.8626881, 0.8624097, -0.4495339, 1, 1, 1, 1, 1,
0.8636442, 1.14451, -0.2092534, 1, 1, 1, 1, 1,
0.8687574, 0.05875876, 1.233444, 1, 1, 1, 1, 1,
0.8719205, -0.2559823, 1.300871, 1, 1, 1, 1, 1,
0.8764961, -0.4351583, 1.664117, 1, 1, 1, 1, 1,
0.8775565, 1.596571, 0.2502212, 1, 1, 1, 1, 1,
0.881499, -0.7261423, 1.40349, 0, 0, 1, 1, 1,
0.8832645, 0.1293475, 2.67547, 1, 0, 0, 1, 1,
0.8881814, -0.4429942, 2.144343, 1, 0, 0, 1, 1,
0.8906414, -0.3612903, 1.019522, 1, 0, 0, 1, 1,
0.8970674, -0.6448094, 2.518303, 1, 0, 0, 1, 1,
0.8974326, 2.526232, 1.018261, 1, 0, 0, 1, 1,
0.903579, 1.630992, 1.614508, 0, 0, 0, 1, 1,
0.9124206, -0.5941083, 3.442183, 0, 0, 0, 1, 1,
0.9125388, 0.7911297, -1.118918, 0, 0, 0, 1, 1,
0.9138997, 0.5190181, -1.291241, 0, 0, 0, 1, 1,
0.9150303, -2.620275, 2.466318, 0, 0, 0, 1, 1,
0.9166788, -2.608254, 3.394635, 0, 0, 0, 1, 1,
0.9173663, -0.7596254, 3.544011, 0, 0, 0, 1, 1,
0.9177456, -2.150542, 2.255386, 1, 1, 1, 1, 1,
0.918996, -1.52528, 4.108505, 1, 1, 1, 1, 1,
0.9256153, -0.3409071, 1.145349, 1, 1, 1, 1, 1,
0.9259897, 0.5191288, 1.961298, 1, 1, 1, 1, 1,
0.941328, 1.497833, 0.7848497, 1, 1, 1, 1, 1,
0.9415666, 0.89859, -0.2344452, 1, 1, 1, 1, 1,
0.9429749, -1.156359, 1.034549, 1, 1, 1, 1, 1,
0.9442356, -0.9280746, 2.678218, 1, 1, 1, 1, 1,
0.948745, 1.079702, 1.138524, 1, 1, 1, 1, 1,
0.9491446, 0.5646678, 1.433605, 1, 1, 1, 1, 1,
0.9533866, -0.1818212, 1.688488, 1, 1, 1, 1, 1,
0.9581259, 0.9248749, 1.618534, 1, 1, 1, 1, 1,
0.9606983, -0.1385546, 2.950016, 1, 1, 1, 1, 1,
0.9615338, 0.172487, 2.394208, 1, 1, 1, 1, 1,
0.9616302, 0.8609378, 0.2835601, 1, 1, 1, 1, 1,
0.9735149, -0.2950746, 0.6798055, 0, 0, 1, 1, 1,
0.9754092, 0.9901522, 1.003748, 1, 0, 0, 1, 1,
0.9817854, -1.06402, 3.122509, 1, 0, 0, 1, 1,
0.9846553, 0.5313035, 0.9261321, 1, 0, 0, 1, 1,
0.9849555, -0.3905602, 2.778795, 1, 0, 0, 1, 1,
0.9905037, 0.5607675, -0.7314283, 1, 0, 0, 1, 1,
0.99083, 1.73263, -0.8351195, 0, 0, 0, 1, 1,
0.9924783, -0.3989321, 3.270202, 0, 0, 0, 1, 1,
0.9928954, -0.937623, 2.153693, 0, 0, 0, 1, 1,
0.9952869, 0.7655385, -1.565229, 0, 0, 0, 1, 1,
0.9963647, -2.089716, 2.255462, 0, 0, 0, 1, 1,
0.9965221, -0.3984879, 2.049755, 0, 0, 0, 1, 1,
0.999604, 0.4128635, 0.6178795, 0, 0, 0, 1, 1,
1.000429, -1.151269, 4.74142, 1, 1, 1, 1, 1,
1.003805, 0.0678391, 2.405072, 1, 1, 1, 1, 1,
1.012401, 0.557232, 0.4459119, 1, 1, 1, 1, 1,
1.024321, -0.3271001, 1.50165, 1, 1, 1, 1, 1,
1.032535, 0.301601, 2.748532, 1, 1, 1, 1, 1,
1.035751, 0.8013722, 1.127911, 1, 1, 1, 1, 1,
1.038022, 0.5338542, 1.960258, 1, 1, 1, 1, 1,
1.039038, 1.162835, 0.07516054, 1, 1, 1, 1, 1,
1.047234, 1.185412, 0.651116, 1, 1, 1, 1, 1,
1.054993, 0.2684033, 1.668778, 1, 1, 1, 1, 1,
1.060716, 0.103598, 1.09669, 1, 1, 1, 1, 1,
1.064467, -0.2677613, 2.568369, 1, 1, 1, 1, 1,
1.064593, 1.237515, 1.889341, 1, 1, 1, 1, 1,
1.065251, 0.9192876, 1.021846, 1, 1, 1, 1, 1,
1.072958, -1.542086, 2.182709, 1, 1, 1, 1, 1,
1.073519, -0.980084, 2.080439, 0, 0, 1, 1, 1,
1.073659, 1.240957, -0.08351935, 1, 0, 0, 1, 1,
1.07821, 1.788931, 0.145627, 1, 0, 0, 1, 1,
1.078832, -0.4882044, 1.917351, 1, 0, 0, 1, 1,
1.08412, 2.046704, 1.319698, 1, 0, 0, 1, 1,
1.085097, 0.2820359, 1.517474, 1, 0, 0, 1, 1,
1.086362, 2.163187, 2.603562, 0, 0, 0, 1, 1,
1.089442, -0.06851479, 2.525005, 0, 0, 0, 1, 1,
1.093347, 1.313456, 2.171605, 0, 0, 0, 1, 1,
1.102024, 0.3704568, -0.6330878, 0, 0, 0, 1, 1,
1.102637, 0.4431611, 2.334334, 0, 0, 0, 1, 1,
1.107619, 0.318918, 2.729153, 0, 0, 0, 1, 1,
1.108239, -1.099433, 2.227755, 0, 0, 0, 1, 1,
1.125525, 1.159255, 0.449145, 1, 1, 1, 1, 1,
1.127961, -0.4858596, 3.597198, 1, 1, 1, 1, 1,
1.129759, -1.466707, 3.506462, 1, 1, 1, 1, 1,
1.14223, 0.6174778, 2.798823, 1, 1, 1, 1, 1,
1.154083, -0.1938985, 2.031821, 1, 1, 1, 1, 1,
1.159586, 0.165431, 1.810516, 1, 1, 1, 1, 1,
1.160385, 0.03954472, 1.758922, 1, 1, 1, 1, 1,
1.161686, 1.25789, 1.139878, 1, 1, 1, 1, 1,
1.16397, 0.9511126, -0.4487027, 1, 1, 1, 1, 1,
1.174407, -0.5759048, 2.812232, 1, 1, 1, 1, 1,
1.175807, -0.04824641, 1.42011, 1, 1, 1, 1, 1,
1.176736, 1.019351, 0.7053529, 1, 1, 1, 1, 1,
1.17764, 0.4063885, 3.071522, 1, 1, 1, 1, 1,
1.183998, -0.4891187, 0.1947356, 1, 1, 1, 1, 1,
1.19123, -0.6487483, 1.344416, 1, 1, 1, 1, 1,
1.202705, 0.7628932, -0.009741972, 0, 0, 1, 1, 1,
1.20329, 0.5110303, 1.183469, 1, 0, 0, 1, 1,
1.2114, -0.2968316, 0.4242363, 1, 0, 0, 1, 1,
1.224499, 0.6181476, 0.4454646, 1, 0, 0, 1, 1,
1.233863, -0.1376182, 1.829113, 1, 0, 0, 1, 1,
1.239492, 0.998476, 0.2268718, 1, 0, 0, 1, 1,
1.241338, -0.6495163, 4.318425, 0, 0, 0, 1, 1,
1.246541, -1.910531, 1.947826, 0, 0, 0, 1, 1,
1.249574, -0.3895064, 0.00658788, 0, 0, 0, 1, 1,
1.250071, 2.383924, 0.62133, 0, 0, 0, 1, 1,
1.253019, -1.224389, 4.598974, 0, 0, 0, 1, 1,
1.255672, -1.503276, 2.969598, 0, 0, 0, 1, 1,
1.256134, 2.216185, 1.875578, 0, 0, 0, 1, 1,
1.271463, -0.1201715, 1.295926, 1, 1, 1, 1, 1,
1.271546, -0.2745969, 2.85522, 1, 1, 1, 1, 1,
1.277542, 0.1499085, 0.5404844, 1, 1, 1, 1, 1,
1.27771, 0.06514264, 0.6293503, 1, 1, 1, 1, 1,
1.279723, 0.9433073, 0.1030851, 1, 1, 1, 1, 1,
1.288018, 1.44711, 1.388945, 1, 1, 1, 1, 1,
1.292479, 0.1934548, 2.782466, 1, 1, 1, 1, 1,
1.302565, -1.203719, 1.173799, 1, 1, 1, 1, 1,
1.316229, -0.4794644, 1.448289, 1, 1, 1, 1, 1,
1.337074, -0.3356382, 2.679717, 1, 1, 1, 1, 1,
1.353751, 0.4463594, 2.716698, 1, 1, 1, 1, 1,
1.35914, -0.5949724, 1.84679, 1, 1, 1, 1, 1,
1.367011, -0.1093523, 1.258694, 1, 1, 1, 1, 1,
1.36841, 0.570021, 0.317059, 1, 1, 1, 1, 1,
1.381471, -0.986706, 2.163986, 1, 1, 1, 1, 1,
1.386493, -2.108127, 1.935998, 0, 0, 1, 1, 1,
1.388804, 0.6269425, 1.851007, 1, 0, 0, 1, 1,
1.402549, 1.482082, 1.604921, 1, 0, 0, 1, 1,
1.404252, -1.53133, 2.436121, 1, 0, 0, 1, 1,
1.404311, 0.3214701, 1.039814, 1, 0, 0, 1, 1,
1.411861, 1.446744, 0.5964966, 1, 0, 0, 1, 1,
1.415417, -0.8172382, 1.456262, 0, 0, 0, 1, 1,
1.437054, 1.966664, 0.08969881, 0, 0, 0, 1, 1,
1.44976, 0.03630447, 0.4774038, 0, 0, 0, 1, 1,
1.462719, 1.354526, -1.432788, 0, 0, 0, 1, 1,
1.464054, 1.089643, 0.8447204, 0, 0, 0, 1, 1,
1.480286, -2.51526, 3.66754, 0, 0, 0, 1, 1,
1.490126, 0.7074954, 1.199961, 0, 0, 0, 1, 1,
1.493316, -0.8235798, 1.350114, 1, 1, 1, 1, 1,
1.502345, 0.8866105, 0.3407823, 1, 1, 1, 1, 1,
1.527333, 1.759468, -1.068104, 1, 1, 1, 1, 1,
1.527816, 0.4771856, 1.918722, 1, 1, 1, 1, 1,
1.531583, 0.9038197, 2.747729, 1, 1, 1, 1, 1,
1.540138, 1.259449, 1.335915, 1, 1, 1, 1, 1,
1.543588, 1.254152, 1.775534, 1, 1, 1, 1, 1,
1.560801, 0.3122703, 1.973191, 1, 1, 1, 1, 1,
1.561709, 0.3725286, -0.2913411, 1, 1, 1, 1, 1,
1.574739, -0.7604537, 2.418586, 1, 1, 1, 1, 1,
1.602311, 1.280542, 3.183607, 1, 1, 1, 1, 1,
1.621043, 0.3667256, -0.001720602, 1, 1, 1, 1, 1,
1.629189, -0.331765, 1.395114, 1, 1, 1, 1, 1,
1.638326, 1.677123, 0.6483982, 1, 1, 1, 1, 1,
1.63861, -0.9479333, 3.100695, 1, 1, 1, 1, 1,
1.639669, 0.5124336, 1.457347, 0, 0, 1, 1, 1,
1.643324, 0.6364906, 1.976149, 1, 0, 0, 1, 1,
1.643394, -1.686604, 4.479379, 1, 0, 0, 1, 1,
1.66304, 0.9969887, 1.387935, 1, 0, 0, 1, 1,
1.663302, -2.658738, 1.323564, 1, 0, 0, 1, 1,
1.665138, -2.038975, 2.527886, 1, 0, 0, 1, 1,
1.711284, -0.924337, 2.635466, 0, 0, 0, 1, 1,
1.718365, 1.109654, -0.5647017, 0, 0, 0, 1, 1,
1.724654, 0.8480574, 2.023627, 0, 0, 0, 1, 1,
1.724849, 0.614016, 1.735569, 0, 0, 0, 1, 1,
1.740447, 1.525555, 1.159766, 0, 0, 0, 1, 1,
1.748416, -0.3731874, 1.425773, 0, 0, 0, 1, 1,
1.752678, 0.8203322, 2.104212, 0, 0, 0, 1, 1,
1.75298, -1.106502, 1.392077, 1, 1, 1, 1, 1,
1.767543, 1.793764, -0.2749123, 1, 1, 1, 1, 1,
1.774911, 0.1254639, 0.3478644, 1, 1, 1, 1, 1,
1.779512, -1.004874, 2.456532, 1, 1, 1, 1, 1,
1.800709, -1.065519, 0.8976515, 1, 1, 1, 1, 1,
1.82178, 0.7345939, 1.0738, 1, 1, 1, 1, 1,
1.829173, -0.0402087, 0.2021821, 1, 1, 1, 1, 1,
1.830601, 0.1696564, 2.351202, 1, 1, 1, 1, 1,
1.83597, 1.253474, 0.673273, 1, 1, 1, 1, 1,
1.839199, 1.867239, 2.103052, 1, 1, 1, 1, 1,
1.842112, 0.5535775, 4.574452, 1, 1, 1, 1, 1,
1.845597, 0.3277314, 1.765617, 1, 1, 1, 1, 1,
1.855611, -0.9513527, 1.921381, 1, 1, 1, 1, 1,
1.872013, 0.282366, 2.870918, 1, 1, 1, 1, 1,
1.90553, 1.677896, 0.6990513, 1, 1, 1, 1, 1,
1.948274, -0.8639435, 3.017697, 0, 0, 1, 1, 1,
1.954225, -0.519699, 3.317565, 1, 0, 0, 1, 1,
1.968148, 1.019016, 1.900821, 1, 0, 0, 1, 1,
1.998519, 1.08869, 2.157014, 1, 0, 0, 1, 1,
1.99855, -0.01090817, 1.457398, 1, 0, 0, 1, 1,
2.103245, 0.8670618, 2.475854, 1, 0, 0, 1, 1,
2.13317, 0.9149928, 0.8552485, 0, 0, 0, 1, 1,
2.136142, 1.804439, 1.188611, 0, 0, 0, 1, 1,
2.194572, -0.3643375, 1.377413, 0, 0, 0, 1, 1,
2.210315, -0.5009809, 1.966854, 0, 0, 0, 1, 1,
2.21322, 1.633088, 0.9713897, 0, 0, 0, 1, 1,
2.26818, -0.4506698, 2.181838, 0, 0, 0, 1, 1,
2.272556, 0.2411831, 2.100494, 0, 0, 0, 1, 1,
2.414139, -1.624066, 1.637463, 1, 1, 1, 1, 1,
2.47734, 1.917139, 2.282067, 1, 1, 1, 1, 1,
2.521349, -1.166614, 2.196447, 1, 1, 1, 1, 1,
2.539977, 0.2231593, 0.07190013, 1, 1, 1, 1, 1,
2.704091, -1.20782, 1.429968, 1, 1, 1, 1, 1,
2.804936, -1.841418, 0.135014, 1, 1, 1, 1, 1,
3.401904, -1.697442, 1.093449, 1, 1, 1, 1, 1
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
var radius = 9.922664;
var distance = 34.85294;
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
mvMatrix.translate( -0.07468939, -0.04058695, 0.2059426 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.85294);
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
