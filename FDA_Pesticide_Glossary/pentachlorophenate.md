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
-3.147931, 2.33964, -0.900558, 1, 0, 0, 1,
-3.050883, 0.847522, 0.9571039, 1, 0.007843138, 0, 1,
-2.953142, -1.584735, -2.640004, 1, 0.01176471, 0, 1,
-2.838067, 0.3826239, -0.1415419, 1, 0.01960784, 0, 1,
-2.736803, 0.8509514, -1.915424, 1, 0.02352941, 0, 1,
-2.658167, -0.3559297, -1.014592, 1, 0.03137255, 0, 1,
-2.63041, -1.664497, -2.792566, 1, 0.03529412, 0, 1,
-2.589231, 0.419011, -0.5952122, 1, 0.04313726, 0, 1,
-2.553161, -1.003514, -2.818701, 1, 0.04705882, 0, 1,
-2.519697, -0.04429204, -1.478061, 1, 0.05490196, 0, 1,
-2.494138, -1.439536, -2.388235, 1, 0.05882353, 0, 1,
-2.493109, -1.101289, -3.767071, 1, 0.06666667, 0, 1,
-2.479316, -0.3276792, -0.9914762, 1, 0.07058824, 0, 1,
-2.436715, -0.8207447, -1.486615, 1, 0.07843138, 0, 1,
-2.41419, -1.401413, -0.5466878, 1, 0.08235294, 0, 1,
-2.306049, 0.5063271, -3.961496, 1, 0.09019608, 0, 1,
-2.136224, 0.1905943, -0.8782253, 1, 0.09411765, 0, 1,
-2.119133, 0.536997, -2.738655, 1, 0.1019608, 0, 1,
-2.06179, 0.1002662, -0.7413011, 1, 0.1098039, 0, 1,
-2.060284, -0.3993089, -3.895659, 1, 0.1137255, 0, 1,
-2.059339, -0.9408053, -0.7273783, 1, 0.1215686, 0, 1,
-2.054619, 1.826919, -0.3122701, 1, 0.1254902, 0, 1,
-2.045836, 0.4372069, -1.35536, 1, 0.1333333, 0, 1,
-2.034909, -1.084919, -2.524061, 1, 0.1372549, 0, 1,
-2.034801, 1.250679, -1.294254, 1, 0.145098, 0, 1,
-2.028781, -1.553443, -2.19204, 1, 0.1490196, 0, 1,
-2.025745, -0.3737814, -3.545367, 1, 0.1568628, 0, 1,
-2.013312, -1.281994, -3.899644, 1, 0.1607843, 0, 1,
-1.975337, -0.04391503, -1.453768, 1, 0.1686275, 0, 1,
-1.97034, 1.301656, -0.6058993, 1, 0.172549, 0, 1,
-1.963159, -0.1780031, -2.833497, 1, 0.1803922, 0, 1,
-1.951899, -0.1531276, -1.672378, 1, 0.1843137, 0, 1,
-1.947771, 0.7700354, -2.800506, 1, 0.1921569, 0, 1,
-1.94238, 2.696912, -1.875418, 1, 0.1960784, 0, 1,
-1.904263, -0.8697807, -2.900565, 1, 0.2039216, 0, 1,
-1.888107, 1.0647, -1.3261, 1, 0.2117647, 0, 1,
-1.872044, -1.468496, -0.195581, 1, 0.2156863, 0, 1,
-1.861089, -1.036026, -3.24717, 1, 0.2235294, 0, 1,
-1.844188, -0.5853862, -0.03166926, 1, 0.227451, 0, 1,
-1.834188, 0.4799318, -3.020972, 1, 0.2352941, 0, 1,
-1.831701, 0.9480975, -1.660088, 1, 0.2392157, 0, 1,
-1.830695, 0.4085574, -0.08338848, 1, 0.2470588, 0, 1,
-1.812974, -0.4883454, -0.02051836, 1, 0.2509804, 0, 1,
-1.812746, -0.5447308, -2.149005, 1, 0.2588235, 0, 1,
-1.798007, 0.186132, -1.016458, 1, 0.2627451, 0, 1,
-1.793176, 0.1984274, -2.053124, 1, 0.2705882, 0, 1,
-1.77943, -1.872617, -2.620932, 1, 0.2745098, 0, 1,
-1.755311, 0.03054649, -2.273751, 1, 0.282353, 0, 1,
-1.740367, 2.10907, 1.129286, 1, 0.2862745, 0, 1,
-1.736774, -1.762487, -2.259712, 1, 0.2941177, 0, 1,
-1.726112, -0.8708938, -2.562697, 1, 0.3019608, 0, 1,
-1.713053, 2.430133, -0.4181524, 1, 0.3058824, 0, 1,
-1.707276, -0.4078658, -1.369636, 1, 0.3137255, 0, 1,
-1.70129, 1.583991, -1.689277, 1, 0.3176471, 0, 1,
-1.70035, -0.0164995, -0.7549135, 1, 0.3254902, 0, 1,
-1.699783, -0.5510865, -0.1452047, 1, 0.3294118, 0, 1,
-1.696305, -0.4871212, -1.988484, 1, 0.3372549, 0, 1,
-1.680891, -0.4849108, -2.310656, 1, 0.3411765, 0, 1,
-1.679821, -0.9047397, 0.1323433, 1, 0.3490196, 0, 1,
-1.669644, 1.30593, -1.705793, 1, 0.3529412, 0, 1,
-1.650178, -0.7022338, -2.804197, 1, 0.3607843, 0, 1,
-1.639762, 1.408961, 0.8557516, 1, 0.3647059, 0, 1,
-1.636795, -0.8859178, -2.584294, 1, 0.372549, 0, 1,
-1.618259, 0.06249166, -2.257679, 1, 0.3764706, 0, 1,
-1.59622, -0.9243774, -1.013302, 1, 0.3843137, 0, 1,
-1.588169, -0.1501894, -1.489506, 1, 0.3882353, 0, 1,
-1.587751, 2.044757, 0.5582937, 1, 0.3960784, 0, 1,
-1.584514, 1.088708, -1.724379, 1, 0.4039216, 0, 1,
-1.581052, 0.3951956, -2.064354, 1, 0.4078431, 0, 1,
-1.570232, 0.1116954, -1.64293, 1, 0.4156863, 0, 1,
-1.559176, -0.8892896, -1.412062, 1, 0.4196078, 0, 1,
-1.552158, -0.4023585, -0.6211538, 1, 0.427451, 0, 1,
-1.518891, -0.5137908, -3.272303, 1, 0.4313726, 0, 1,
-1.518878, -0.6344403, -2.076657, 1, 0.4392157, 0, 1,
-1.48271, 0.3302924, -2.598103, 1, 0.4431373, 0, 1,
-1.457502, 1.388908, -1.330084, 1, 0.4509804, 0, 1,
-1.442813, 0.1073484, -2.102262, 1, 0.454902, 0, 1,
-1.433631, -1.4984, -2.189459, 1, 0.4627451, 0, 1,
-1.427703, -1.051072, -1.4269, 1, 0.4666667, 0, 1,
-1.426428, -2.941243, -3.801924, 1, 0.4745098, 0, 1,
-1.424099, -2.598588, -3.262168, 1, 0.4784314, 0, 1,
-1.423047, -0.8376334, -0.8683854, 1, 0.4862745, 0, 1,
-1.41748, 0.5662839, -0.7591838, 1, 0.4901961, 0, 1,
-1.403614, 1.300604, -0.8759814, 1, 0.4980392, 0, 1,
-1.40115, 0.6518688, -1.390073, 1, 0.5058824, 0, 1,
-1.397253, 0.9558405, -0.1435149, 1, 0.509804, 0, 1,
-1.393912, -0.01097664, -3.489692, 1, 0.5176471, 0, 1,
-1.37912, 0.7984906, -2.770328, 1, 0.5215687, 0, 1,
-1.363771, 1.254786, -0.2773042, 1, 0.5294118, 0, 1,
-1.347954, -1.107648, -3.255057, 1, 0.5333334, 0, 1,
-1.337684, -0.2602506, 0.2574969, 1, 0.5411765, 0, 1,
-1.330439, -0.4886056, -1.31069, 1, 0.5450981, 0, 1,
-1.329058, 1.032745, 0.003730891, 1, 0.5529412, 0, 1,
-1.327615, 0.2771645, -2.194419, 1, 0.5568628, 0, 1,
-1.316864, -0.5241038, -1.324683, 1, 0.5647059, 0, 1,
-1.312054, -0.2891256, -2.807526, 1, 0.5686275, 0, 1,
-1.311707, -0.6322585, -1.969359, 1, 0.5764706, 0, 1,
-1.309262, 0.1521996, -2.928523, 1, 0.5803922, 0, 1,
-1.306767, -2.255518, -4.506669, 1, 0.5882353, 0, 1,
-1.296356, -1.803078, -2.300433, 1, 0.5921569, 0, 1,
-1.292762, 1.142394, -1.313391, 1, 0.6, 0, 1,
-1.292556, -1.277722, -3.310829, 1, 0.6078432, 0, 1,
-1.283442, 1.669889, 0.9799178, 1, 0.6117647, 0, 1,
-1.268375, -0.5354961, 0.6566787, 1, 0.6196079, 0, 1,
-1.262219, -0.6646234, -1.634177, 1, 0.6235294, 0, 1,
-1.258059, -0.3000923, -1.633644, 1, 0.6313726, 0, 1,
-1.256831, -1.224587, -1.031283, 1, 0.6352941, 0, 1,
-1.256528, -2.245485, -0.3001838, 1, 0.6431373, 0, 1,
-1.252989, 1.031007, 0.5999351, 1, 0.6470588, 0, 1,
-1.251456, 0.5047255, -0.8383014, 1, 0.654902, 0, 1,
-1.246015, -0.8170782, -3.706925, 1, 0.6588235, 0, 1,
-1.244233, 1.190325, -1.939016, 1, 0.6666667, 0, 1,
-1.236774, 0.2085538, -1.426449, 1, 0.6705883, 0, 1,
-1.23586, -0.5678377, -2.729557, 1, 0.6784314, 0, 1,
-1.234456, -0.1492236, -1.329892, 1, 0.682353, 0, 1,
-1.209157, -0.7669439, -1.162051, 1, 0.6901961, 0, 1,
-1.205964, -0.4337067, -4.093221, 1, 0.6941177, 0, 1,
-1.197697, 0.4701156, -0.3810829, 1, 0.7019608, 0, 1,
-1.197381, -0.6573449, -4.974276, 1, 0.7098039, 0, 1,
-1.193742, 1.199149, 0.02758458, 1, 0.7137255, 0, 1,
-1.193465, -0.5278143, -1.189849, 1, 0.7215686, 0, 1,
-1.190524, -0.712919, -1.576542, 1, 0.7254902, 0, 1,
-1.190209, 1.433619, 0.3115437, 1, 0.7333333, 0, 1,
-1.188043, 0.7464866, 0.6965055, 1, 0.7372549, 0, 1,
-1.18118, 0.8497169, 1.198428, 1, 0.7450981, 0, 1,
-1.176337, -0.787232, -1.642128, 1, 0.7490196, 0, 1,
-1.174545, -1.617937, -3.109278, 1, 0.7568628, 0, 1,
-1.171164, -0.5876639, -1.321344, 1, 0.7607843, 0, 1,
-1.170369, 0.8553178, -0.1419342, 1, 0.7686275, 0, 1,
-1.16562, 2.0597, -0.5600671, 1, 0.772549, 0, 1,
-1.164887, 0.6595008, -0.2444226, 1, 0.7803922, 0, 1,
-1.153985, 0.1289672, -0.6661633, 1, 0.7843137, 0, 1,
-1.132918, -2.787807, -1.471488, 1, 0.7921569, 0, 1,
-1.125136, 0.0786471, -1.116457, 1, 0.7960784, 0, 1,
-1.125059, 0.2036963, -2.37499, 1, 0.8039216, 0, 1,
-1.117963, 0.1124723, -1.186444, 1, 0.8117647, 0, 1,
-1.113214, -1.195709, -0.4700926, 1, 0.8156863, 0, 1,
-1.10682, 0.7470253, -1.64307, 1, 0.8235294, 0, 1,
-1.102499, 0.4189121, -3.756337, 1, 0.827451, 0, 1,
-1.087702, 1.045116, -1.233409, 1, 0.8352941, 0, 1,
-1.083791, 0.02894135, -2.105102, 1, 0.8392157, 0, 1,
-1.080248, 0.5717611, -0.7104285, 1, 0.8470588, 0, 1,
-1.074617, 0.5282973, -2.369626, 1, 0.8509804, 0, 1,
-1.070866, -0.5899716, -2.767095, 1, 0.8588235, 0, 1,
-1.069625, -1.106927, -1.854918, 1, 0.8627451, 0, 1,
-1.062568, -1.209999, -3.22314, 1, 0.8705882, 0, 1,
-1.058971, 0.3926926, -0.7479545, 1, 0.8745098, 0, 1,
-1.055656, -1.060508, -3.245899, 1, 0.8823529, 0, 1,
-1.050676, 0.7697816, -1.830161, 1, 0.8862745, 0, 1,
-1.040714, -1.285191, -2.349012, 1, 0.8941177, 0, 1,
-1.036569, 0.6899797, -0.9347866, 1, 0.8980392, 0, 1,
-1.027547, -0.2931212, -3.340387, 1, 0.9058824, 0, 1,
-1.018798, -1.481135, -1.396006, 1, 0.9137255, 0, 1,
-1.015313, -0.08410889, -2.180835, 1, 0.9176471, 0, 1,
-1.010633, 0.1036005, -1.637394, 1, 0.9254902, 0, 1,
-1.010421, 1.321909, -2.601861, 1, 0.9294118, 0, 1,
-1.009491, 0.2427486, -0.03947522, 1, 0.9372549, 0, 1,
-1.004403, -1.517522, -3.086905, 1, 0.9411765, 0, 1,
-1.003564, -1.525851, -2.553653, 1, 0.9490196, 0, 1,
-1.000346, -0.3468075, -2.669718, 1, 0.9529412, 0, 1,
-0.9989248, -0.2252557, -0.9968432, 1, 0.9607843, 0, 1,
-0.9824088, -0.2674057, -2.05149, 1, 0.9647059, 0, 1,
-0.9754996, -0.411856, -1.292382, 1, 0.972549, 0, 1,
-0.9697422, -0.594, -2.641672, 1, 0.9764706, 0, 1,
-0.9660943, -0.6012346, -1.663301, 1, 0.9843137, 0, 1,
-0.9593509, -0.1139017, -2.445688, 1, 0.9882353, 0, 1,
-0.9484563, -1.044499, -1.585181, 1, 0.9960784, 0, 1,
-0.9451984, -0.4828796, -1.454584, 0.9960784, 1, 0, 1,
-0.9444928, 0.0874819, -3.884802, 0.9921569, 1, 0, 1,
-0.942646, 0.5110594, -0.9230404, 0.9843137, 1, 0, 1,
-0.9379104, 0.3864226, -0.8017673, 0.9803922, 1, 0, 1,
-0.9357911, -0.5830001, -2.222405, 0.972549, 1, 0, 1,
-0.9314508, 0.2512653, -0.7363009, 0.9686275, 1, 0, 1,
-0.9292051, 0.04027772, -1.109086, 0.9607843, 1, 0, 1,
-0.927246, -1.017197, -4.026618, 0.9568627, 1, 0, 1,
-0.9231523, 1.656287, -0.318568, 0.9490196, 1, 0, 1,
-0.9109526, 1.304834, -1.177217, 0.945098, 1, 0, 1,
-0.9107, 0.959112, -2.331677, 0.9372549, 1, 0, 1,
-0.9077849, -0.171421, -0.8290011, 0.9333333, 1, 0, 1,
-0.9060001, 0.2389511, -1.932528, 0.9254902, 1, 0, 1,
-0.9004419, 0.181479, -0.9226296, 0.9215686, 1, 0, 1,
-0.8993905, 1.556349, -1.558251, 0.9137255, 1, 0, 1,
-0.8987284, 1.005965, -0.726037, 0.9098039, 1, 0, 1,
-0.8938176, -1.834683, -0.1217774, 0.9019608, 1, 0, 1,
-0.8905419, 1.460217, -0.0478364, 0.8941177, 1, 0, 1,
-0.8825147, 1.605834, -0.4356561, 0.8901961, 1, 0, 1,
-0.882129, 0.1600564, -2.227808, 0.8823529, 1, 0, 1,
-0.8766577, -1.263328, -2.330862, 0.8784314, 1, 0, 1,
-0.8754918, -0.2299748, -2.25452, 0.8705882, 1, 0, 1,
-0.8635283, 0.5312244, -2.200293, 0.8666667, 1, 0, 1,
-0.8603342, -0.947844, -2.294108, 0.8588235, 1, 0, 1,
-0.8572315, -0.8158023, -2.758348, 0.854902, 1, 0, 1,
-0.8542616, 0.6452121, -0.3990495, 0.8470588, 1, 0, 1,
-0.8517027, 0.03592116, -2.63432, 0.8431373, 1, 0, 1,
-0.8513473, 2.769019, 0.5184311, 0.8352941, 1, 0, 1,
-0.8487448, 0.4182466, -0.05124144, 0.8313726, 1, 0, 1,
-0.8463516, -2.339318, -2.367871, 0.8235294, 1, 0, 1,
-0.8440859, 1.862651, 0.8238274, 0.8196079, 1, 0, 1,
-0.8431968, -0.8180082, -3.52916, 0.8117647, 1, 0, 1,
-0.8366467, -0.8855389, -1.78972, 0.8078431, 1, 0, 1,
-0.8302775, -1.555255, -2.27584, 0.8, 1, 0, 1,
-0.8279805, 0.07757293, -0.02338755, 0.7921569, 1, 0, 1,
-0.8251609, -0.432776, -2.466048, 0.7882353, 1, 0, 1,
-0.8225225, -1.750589, -2.537891, 0.7803922, 1, 0, 1,
-0.8188308, -1.739045, -3.867546, 0.7764706, 1, 0, 1,
-0.8069409, -0.5110001, -2.243122, 0.7686275, 1, 0, 1,
-0.8039482, 0.3872353, -1.101935, 0.7647059, 1, 0, 1,
-0.8037428, 1.174809, 0.244433, 0.7568628, 1, 0, 1,
-0.8006942, -1.102803, -2.029489, 0.7529412, 1, 0, 1,
-0.7989455, -0.192041, -1.31254, 0.7450981, 1, 0, 1,
-0.7981873, -1.038497, -2.307594, 0.7411765, 1, 0, 1,
-0.7881226, -0.5963495, -1.364568, 0.7333333, 1, 0, 1,
-0.7824687, -0.747546, -3.062181, 0.7294118, 1, 0, 1,
-0.7775741, -0.4478471, -1.029725, 0.7215686, 1, 0, 1,
-0.773506, 0.424547, 0.02340995, 0.7176471, 1, 0, 1,
-0.7697341, -0.00506196, -2.288209, 0.7098039, 1, 0, 1,
-0.7683475, -0.4172309, -1.762359, 0.7058824, 1, 0, 1,
-0.7665873, 0.5504989, -0.7237162, 0.6980392, 1, 0, 1,
-0.7614099, -0.4324177, -2.530254, 0.6901961, 1, 0, 1,
-0.7600181, 1.157657, -1.787611, 0.6862745, 1, 0, 1,
-0.7580925, -1.014289, -3.135492, 0.6784314, 1, 0, 1,
-0.7571906, -0.9853854, -2.39071, 0.6745098, 1, 0, 1,
-0.7561112, -0.2790583, -1.353361, 0.6666667, 1, 0, 1,
-0.754409, 0.324441, -0.308955, 0.6627451, 1, 0, 1,
-0.751087, 1.314157, 1.060738, 0.654902, 1, 0, 1,
-0.751074, -0.5528018, -2.496664, 0.6509804, 1, 0, 1,
-0.7436244, 0.428459, -0.4224279, 0.6431373, 1, 0, 1,
-0.7409799, -0.3158193, -2.285698, 0.6392157, 1, 0, 1,
-0.7356532, -1.411888, -2.932943, 0.6313726, 1, 0, 1,
-0.732494, -0.686633, -1.467222, 0.627451, 1, 0, 1,
-0.7293468, 0.2703096, -1.814164, 0.6196079, 1, 0, 1,
-0.7278405, -0.2940318, -0.8150886, 0.6156863, 1, 0, 1,
-0.7217208, -0.880952, -2.132508, 0.6078432, 1, 0, 1,
-0.7127141, 0.1328205, -1.588559, 0.6039216, 1, 0, 1,
-0.7126676, -0.2931281, -1.677317, 0.5960785, 1, 0, 1,
-0.7108421, -1.747768, -2.940948, 0.5882353, 1, 0, 1,
-0.7087467, 1.46064, -0.3456367, 0.5843138, 1, 0, 1,
-0.7017128, 0.4749825, -2.467911, 0.5764706, 1, 0, 1,
-0.6953631, 0.1713783, -2.389424, 0.572549, 1, 0, 1,
-0.686789, -0.09102676, -0.5740644, 0.5647059, 1, 0, 1,
-0.6823398, 1.449652, -1.956511, 0.5607843, 1, 0, 1,
-0.681159, -0.3741333, -1.203163, 0.5529412, 1, 0, 1,
-0.680142, 1.679351, -1.12892, 0.5490196, 1, 0, 1,
-0.676142, -0.7614345, -0.4030672, 0.5411765, 1, 0, 1,
-0.6761111, 0.4638909, -1.181836, 0.5372549, 1, 0, 1,
-0.6688783, -0.1127992, -2.171813, 0.5294118, 1, 0, 1,
-0.6667125, -0.2052527, -1.128746, 0.5254902, 1, 0, 1,
-0.6663433, -0.3049026, -1.780795, 0.5176471, 1, 0, 1,
-0.6569833, 0.8569183, -1.464993, 0.5137255, 1, 0, 1,
-0.653263, 2.11272, -1.047865, 0.5058824, 1, 0, 1,
-0.6477709, -0.3115441, -2.293767, 0.5019608, 1, 0, 1,
-0.6409616, -0.03874245, -0.7323514, 0.4941176, 1, 0, 1,
-0.6405331, -1.738974, -3.694518, 0.4862745, 1, 0, 1,
-0.6400287, -1.914353, -1.754547, 0.4823529, 1, 0, 1,
-0.6399522, 0.1350252, -2.123471, 0.4745098, 1, 0, 1,
-0.6341572, -0.7692259, -1.684303, 0.4705882, 1, 0, 1,
-0.6279314, -1.345581, -2.439951, 0.4627451, 1, 0, 1,
-0.6251933, -0.4397822, 0.5525085, 0.4588235, 1, 0, 1,
-0.6236621, 1.091734, 0.2727104, 0.4509804, 1, 0, 1,
-0.6230599, -1.021829, -4.284742, 0.4470588, 1, 0, 1,
-0.6229082, 0.04476167, -2.086438, 0.4392157, 1, 0, 1,
-0.6184138, 0.1249389, -0.9234596, 0.4352941, 1, 0, 1,
-0.6174453, 0.09309195, -1.720899, 0.427451, 1, 0, 1,
-0.6158998, -1.040346, -1.645923, 0.4235294, 1, 0, 1,
-0.6153382, 1.000865, -0.3783134, 0.4156863, 1, 0, 1,
-0.6096308, 1.860078, -0.180941, 0.4117647, 1, 0, 1,
-0.6069446, 0.06287711, -3.420531, 0.4039216, 1, 0, 1,
-0.6060771, -0.2046458, -1.408426, 0.3960784, 1, 0, 1,
-0.6008325, 1.530531, -0.5509689, 0.3921569, 1, 0, 1,
-0.5988505, 0.139288, 0.135269, 0.3843137, 1, 0, 1,
-0.5984304, -1.935282, -2.710562, 0.3803922, 1, 0, 1,
-0.5968514, -1.781094, -2.448105, 0.372549, 1, 0, 1,
-0.5926966, 0.03096638, -1.811399, 0.3686275, 1, 0, 1,
-0.5913643, 0.7753611, -2.568658, 0.3607843, 1, 0, 1,
-0.590984, -0.4709726, -1.933522, 0.3568628, 1, 0, 1,
-0.5896215, -0.8454622, -2.330248, 0.3490196, 1, 0, 1,
-0.5889133, -1.005515, -3.688046, 0.345098, 1, 0, 1,
-0.5863513, 1.379956, 0.5387185, 0.3372549, 1, 0, 1,
-0.5835314, -0.4030007, -1.385377, 0.3333333, 1, 0, 1,
-0.5813721, -1.140423, -3.555478, 0.3254902, 1, 0, 1,
-0.5792402, 0.1398798, -1.726093, 0.3215686, 1, 0, 1,
-0.5790032, 0.5592799, 0.2251114, 0.3137255, 1, 0, 1,
-0.5782531, -1.622155, -3.357408, 0.3098039, 1, 0, 1,
-0.5747375, 0.4940496, -1.503738, 0.3019608, 1, 0, 1,
-0.5733132, -0.1780822, -0.564795, 0.2941177, 1, 0, 1,
-0.5682929, 1.966557, -0.993233, 0.2901961, 1, 0, 1,
-0.5651941, -0.6048586, -1.003927, 0.282353, 1, 0, 1,
-0.5646781, -0.6394479, -4.162132, 0.2784314, 1, 0, 1,
-0.554983, -1.768208, -3.864964, 0.2705882, 1, 0, 1,
-0.5536089, 0.8087961, -1.970244, 0.2666667, 1, 0, 1,
-0.5490922, 0.03443046, -2.31312, 0.2588235, 1, 0, 1,
-0.5488144, 0.1896384, -2.579729, 0.254902, 1, 0, 1,
-0.5484563, 1.957739, 0.2439487, 0.2470588, 1, 0, 1,
-0.5427687, 1.991563, 0.01090518, 0.2431373, 1, 0, 1,
-0.5391538, -1.387678, -3.33408, 0.2352941, 1, 0, 1,
-0.5377089, -1.221379, -0.9708025, 0.2313726, 1, 0, 1,
-0.5347902, 2.038341, -0.3012722, 0.2235294, 1, 0, 1,
-0.5326654, -1.386994, -2.972194, 0.2196078, 1, 0, 1,
-0.531226, 1.142236, -0.02170722, 0.2117647, 1, 0, 1,
-0.5302093, 0.09070072, -0.6946241, 0.2078431, 1, 0, 1,
-0.5279911, 2.339425, -2.513767, 0.2, 1, 0, 1,
-0.5273649, -0.2407623, -2.423775, 0.1921569, 1, 0, 1,
-0.5264867, 1.236098, -0.02004336, 0.1882353, 1, 0, 1,
-0.5241462, -0.5290076, -1.597005, 0.1803922, 1, 0, 1,
-0.5147349, -0.6349785, -2.741266, 0.1764706, 1, 0, 1,
-0.5147148, -0.3789206, -2.140945, 0.1686275, 1, 0, 1,
-0.514492, -1.221914, -2.304174, 0.1647059, 1, 0, 1,
-0.5093212, -0.7772025, -1.323183, 0.1568628, 1, 0, 1,
-0.5077212, -0.9075585, -2.74352, 0.1529412, 1, 0, 1,
-0.5062639, 1.363514, 2.428856, 0.145098, 1, 0, 1,
-0.5039119, 1.141403, -0.2500343, 0.1411765, 1, 0, 1,
-0.4971206, 2.002575, 0.2854229, 0.1333333, 1, 0, 1,
-0.489604, 0.6410652, 0.2883021, 0.1294118, 1, 0, 1,
-0.4876956, 0.4435325, -2.019716, 0.1215686, 1, 0, 1,
-0.4856401, 1.096852, -1.444526, 0.1176471, 1, 0, 1,
-0.4830859, 1.040165, -1.491976, 0.1098039, 1, 0, 1,
-0.4826958, 1.740096, -1.453973, 0.1058824, 1, 0, 1,
-0.4797347, -1.25981, -0.9744902, 0.09803922, 1, 0, 1,
-0.4787374, 0.431486, -1.345092, 0.09019608, 1, 0, 1,
-0.4779807, -0.1023893, -1.22504, 0.08627451, 1, 0, 1,
-0.4749212, 0.1386042, -1.834199, 0.07843138, 1, 0, 1,
-0.474701, 0.04203363, -2.361293, 0.07450981, 1, 0, 1,
-0.468825, -0.4675278, -2.666395, 0.06666667, 1, 0, 1,
-0.4664044, -0.7100142, -2.139417, 0.0627451, 1, 0, 1,
-0.4636146, -0.999815, -3.089524, 0.05490196, 1, 0, 1,
-0.4582494, 0.687315, -1.165942, 0.05098039, 1, 0, 1,
-0.4580252, 0.5726776, -0.02367201, 0.04313726, 1, 0, 1,
-0.457314, -1.288718, -2.673109, 0.03921569, 1, 0, 1,
-0.45432, 0.6946263, 0.2866687, 0.03137255, 1, 0, 1,
-0.4484652, -0.2579741, -3.011659, 0.02745098, 1, 0, 1,
-0.4483545, -1.455666, -2.640307, 0.01960784, 1, 0, 1,
-0.4477498, -1.583222, -2.327269, 0.01568628, 1, 0, 1,
-0.4470416, -1.462966, -2.710513, 0.007843138, 1, 0, 1,
-0.4455224, 0.466852, -2.036552, 0.003921569, 1, 0, 1,
-0.4441032, -0.638692, -4.135304, 0, 1, 0.003921569, 1,
-0.4421879, 0.4678579, -0.1094453, 0, 1, 0.01176471, 1,
-0.4409407, 0.6546005, 0.8911763, 0, 1, 0.01568628, 1,
-0.4396508, 2.773374, -0.3745502, 0, 1, 0.02352941, 1,
-0.4282131, 2.546913, 0.3673946, 0, 1, 0.02745098, 1,
-0.4253834, -0.535887, -1.612832, 0, 1, 0.03529412, 1,
-0.4213648, -2.410309, -3.508924, 0, 1, 0.03921569, 1,
-0.4189357, -1.430781, -3.358526, 0, 1, 0.04705882, 1,
-0.4171095, -2.395844, -2.650405, 0, 1, 0.05098039, 1,
-0.4104863, -0.2462807, -2.152076, 0, 1, 0.05882353, 1,
-0.4095063, -0.3378597, -1.196056, 0, 1, 0.0627451, 1,
-0.4007899, 0.3367975, -1.735449, 0, 1, 0.07058824, 1,
-0.3956425, 0.07618174, -2.050982, 0, 1, 0.07450981, 1,
-0.393814, -0.7208332, -2.005095, 0, 1, 0.08235294, 1,
-0.3937771, -0.7026228, -0.1829525, 0, 1, 0.08627451, 1,
-0.3919401, 1.156607, -0.6917588, 0, 1, 0.09411765, 1,
-0.3895288, 0.3547961, -2.016854, 0, 1, 0.1019608, 1,
-0.3838236, 1.112708, 0.9942575, 0, 1, 0.1058824, 1,
-0.3816909, 1.790829, -1.370343, 0, 1, 0.1137255, 1,
-0.3794789, -1.182804, -3.753857, 0, 1, 0.1176471, 1,
-0.3776703, 0.6597209, -1.923291, 0, 1, 0.1254902, 1,
-0.3769712, 0.2770202, 0.1944105, 0, 1, 0.1294118, 1,
-0.3769172, -2.37483, -2.705638, 0, 1, 0.1372549, 1,
-0.3762619, -0.1610549, -1.632187, 0, 1, 0.1411765, 1,
-0.3699803, 0.5898413, -0.355799, 0, 1, 0.1490196, 1,
-0.3691732, 0.1324151, -1.606738, 0, 1, 0.1529412, 1,
-0.3684174, -0.1991561, -0.02945167, 0, 1, 0.1607843, 1,
-0.3681419, -0.1383401, -0.9732026, 0, 1, 0.1647059, 1,
-0.3663309, 1.00539, -0.7157483, 0, 1, 0.172549, 1,
-0.3662058, -1.529377, -3.010131, 0, 1, 0.1764706, 1,
-0.3588237, 0.8410891, 0.8692709, 0, 1, 0.1843137, 1,
-0.3583836, -0.8635637, -2.382341, 0, 1, 0.1882353, 1,
-0.3581198, 2.299032, -1.185868, 0, 1, 0.1960784, 1,
-0.3570895, 0.6662294, -1.509368, 0, 1, 0.2039216, 1,
-0.3569095, -0.9771541, -1.919979, 0, 1, 0.2078431, 1,
-0.3567936, 2.199931, 0.4673477, 0, 1, 0.2156863, 1,
-0.353209, -1.101964, -4.839857, 0, 1, 0.2196078, 1,
-0.3514616, 0.7141356, 0.08612902, 0, 1, 0.227451, 1,
-0.346736, 0.2702105, -1.239216, 0, 1, 0.2313726, 1,
-0.3461888, -0.5208713, -1.377226, 0, 1, 0.2392157, 1,
-0.345951, 2.256177, 1.491945, 0, 1, 0.2431373, 1,
-0.3449215, -2.382674, -2.754719, 0, 1, 0.2509804, 1,
-0.3402224, -1.637995, -0.8817301, 0, 1, 0.254902, 1,
-0.3378576, -0.176803, -0.8461742, 0, 1, 0.2627451, 1,
-0.3356586, -0.1119998, -2.365916, 0, 1, 0.2666667, 1,
-0.3304321, 0.9548327, 0.8328946, 0, 1, 0.2745098, 1,
-0.3296392, 1.227496, 0.3468496, 0, 1, 0.2784314, 1,
-0.3259524, -1.936866, -3.039214, 0, 1, 0.2862745, 1,
-0.32579, 1.933511, 0.03477025, 0, 1, 0.2901961, 1,
-0.319714, 0.1268936, 0.7829074, 0, 1, 0.2980392, 1,
-0.318934, -0.3523931, -1.264874, 0, 1, 0.3058824, 1,
-0.3115523, -0.4918065, -2.476292, 0, 1, 0.3098039, 1,
-0.3055544, 1.0651, 0.1611488, 0, 1, 0.3176471, 1,
-0.2970904, 1.857852, 0.5282865, 0, 1, 0.3215686, 1,
-0.2956432, 1.345805, -0.1320136, 0, 1, 0.3294118, 1,
-0.2935752, -2.555795, -2.482837, 0, 1, 0.3333333, 1,
-0.2895438, -0.5314704, -3.221904, 0, 1, 0.3411765, 1,
-0.2890828, 1.236814, -1.182242, 0, 1, 0.345098, 1,
-0.2879415, 2.557815, -2.20809, 0, 1, 0.3529412, 1,
-0.285965, -0.05635943, -0.365534, 0, 1, 0.3568628, 1,
-0.2817393, 0.7308385, 0.1043636, 0, 1, 0.3647059, 1,
-0.2760132, -0.3368882, -1.901047, 0, 1, 0.3686275, 1,
-0.2743448, 1.170652, -2.450171, 0, 1, 0.3764706, 1,
-0.2718188, -1.387079, -3.624275, 0, 1, 0.3803922, 1,
-0.2717409, 1.228812, 1.693326, 0, 1, 0.3882353, 1,
-0.2680777, -0.08976954, -2.505903, 0, 1, 0.3921569, 1,
-0.2669402, -0.9218085, -1.370902, 0, 1, 0.4, 1,
-0.2648832, 0.3721793, 0.9921903, 0, 1, 0.4078431, 1,
-0.2640694, -0.897472, -1.648018, 0, 1, 0.4117647, 1,
-0.2628561, 1.363105, 0.8656359, 0, 1, 0.4196078, 1,
-0.2615433, -0.8932542, -2.555846, 0, 1, 0.4235294, 1,
-0.2606882, 1.032804, 0.05962683, 0, 1, 0.4313726, 1,
-0.2553898, -0.08433672, -0.3742414, 0, 1, 0.4352941, 1,
-0.2550218, -1.374702, -4.461523, 0, 1, 0.4431373, 1,
-0.2510156, -0.6503526, -1.784001, 0, 1, 0.4470588, 1,
-0.2503539, 0.1975994, -0.2413486, 0, 1, 0.454902, 1,
-0.2494458, -0.3455467, -3.411265, 0, 1, 0.4588235, 1,
-0.2493461, -0.1819602, -2.806115, 0, 1, 0.4666667, 1,
-0.2491552, 1.117278, -0.8919811, 0, 1, 0.4705882, 1,
-0.2486178, 1.593177, 0.2911848, 0, 1, 0.4784314, 1,
-0.2468018, -3.638666, -3.410545, 0, 1, 0.4823529, 1,
-0.2441198, 0.6406923, 1.293168, 0, 1, 0.4901961, 1,
-0.2404741, 0.2682008, 0.6570061, 0, 1, 0.4941176, 1,
-0.237461, -0.5193901, -5.384789, 0, 1, 0.5019608, 1,
-0.2242313, -0.6285397, -3.825516, 0, 1, 0.509804, 1,
-0.2235974, 1.287752, -1.270339, 0, 1, 0.5137255, 1,
-0.2230799, -1.618226, -1.917563, 0, 1, 0.5215687, 1,
-0.2225817, -0.1702209, -0.3839568, 0, 1, 0.5254902, 1,
-0.2204302, 0.198759, -0.5382541, 0, 1, 0.5333334, 1,
-0.2198087, -0.2440709, -3.294389, 0, 1, 0.5372549, 1,
-0.2178459, -0.4497731, -2.403581, 0, 1, 0.5450981, 1,
-0.21057, -0.8162177, -2.990123, 0, 1, 0.5490196, 1,
-0.2061832, -0.5089664, -1.481522, 0, 1, 0.5568628, 1,
-0.2051111, 1.19269, 1.264006, 0, 1, 0.5607843, 1,
-0.2049904, 1.015293, 0.008247216, 0, 1, 0.5686275, 1,
-0.1982843, 0.1383853, -0.5354325, 0, 1, 0.572549, 1,
-0.1973939, 2.302083, 1.527176, 0, 1, 0.5803922, 1,
-0.1947988, 0.3274689, -1.54581, 0, 1, 0.5843138, 1,
-0.1943065, -0.1501896, -2.694698, 0, 1, 0.5921569, 1,
-0.1870261, -0.7941297, -2.911621, 0, 1, 0.5960785, 1,
-0.1861068, 0.7206682, -1.395805, 0, 1, 0.6039216, 1,
-0.1843256, 1.326496, -1.095225, 0, 1, 0.6117647, 1,
-0.1819277, 0.7188656, -2.716645, 0, 1, 0.6156863, 1,
-0.1815086, 0.4823552, 2.096882, 0, 1, 0.6235294, 1,
-0.1811227, 1.200605, 0.2328408, 0, 1, 0.627451, 1,
-0.1808547, -1.208954, -3.437673, 0, 1, 0.6352941, 1,
-0.179152, -0.5404603, -3.23614, 0, 1, 0.6392157, 1,
-0.1764186, 0.3066067, -0.2143844, 0, 1, 0.6470588, 1,
-0.1676454, 0.5712832, 0.832874, 0, 1, 0.6509804, 1,
-0.1666736, 0.7332246, -0.264677, 0, 1, 0.6588235, 1,
-0.1657321, 0.03803171, -2.546067, 0, 1, 0.6627451, 1,
-0.1617577, -0.1104962, -1.452738, 0, 1, 0.6705883, 1,
-0.1607091, -0.6311869, -4.912461, 0, 1, 0.6745098, 1,
-0.1570034, 0.3311339, -1.349031, 0, 1, 0.682353, 1,
-0.1565217, -0.1360188, -0.6065817, 0, 1, 0.6862745, 1,
-0.1563794, -1.015707, -3.959587, 0, 1, 0.6941177, 1,
-0.1562032, 1.942773, -0.3471095, 0, 1, 0.7019608, 1,
-0.155995, -0.8138384, -2.348795, 0, 1, 0.7058824, 1,
-0.1538389, 0.5877009, -0.9591959, 0, 1, 0.7137255, 1,
-0.149039, -0.9026324, -3.318162, 0, 1, 0.7176471, 1,
-0.144891, 0.8603748, 0.6618824, 0, 1, 0.7254902, 1,
-0.1439521, -0.2686322, -3.20971, 0, 1, 0.7294118, 1,
-0.139773, -0.2370007, -1.990403, 0, 1, 0.7372549, 1,
-0.1388424, -0.1038458, -4.57166, 0, 1, 0.7411765, 1,
-0.1379372, -0.2697412, -1.341829, 0, 1, 0.7490196, 1,
-0.1323538, -0.9629627, -3.053499, 0, 1, 0.7529412, 1,
-0.125772, 1.073528, 0.1105768, 0, 1, 0.7607843, 1,
-0.1221013, 0.5895131, 1.138418, 0, 1, 0.7647059, 1,
-0.1179625, 0.2100396, 0.7420939, 0, 1, 0.772549, 1,
-0.1150362, 0.5864791, -0.6220014, 0, 1, 0.7764706, 1,
-0.110649, 0.3757498, 1.000034, 0, 1, 0.7843137, 1,
-0.1104207, -1.114891, -2.690852, 0, 1, 0.7882353, 1,
-0.1079814, 0.1610975, -1.842991, 0, 1, 0.7960784, 1,
-0.1072913, 0.108661, 1.699147, 0, 1, 0.8039216, 1,
-0.1035249, 0.6183858, 0.120642, 0, 1, 0.8078431, 1,
-0.1025792, -0.6282423, -2.96488, 0, 1, 0.8156863, 1,
-0.1024687, -1.534012, -3.618021, 0, 1, 0.8196079, 1,
-0.1019876, 1.185439, -2.344536, 0, 1, 0.827451, 1,
-0.1014552, 1.661949, -0.1805609, 0, 1, 0.8313726, 1,
-0.09673055, -0.2248375, -2.411147, 0, 1, 0.8392157, 1,
-0.09372389, -1.358824, -2.037083, 0, 1, 0.8431373, 1,
-0.09148909, 0.3394732, -0.7801202, 0, 1, 0.8509804, 1,
-0.09142355, 0.5671626, -1.151816, 0, 1, 0.854902, 1,
-0.08388522, -0.444815, -2.383472, 0, 1, 0.8627451, 1,
-0.07987887, -0.1966426, -2.360718, 0, 1, 0.8666667, 1,
-0.07567454, -0.07810263, -1.846122, 0, 1, 0.8745098, 1,
-0.07540856, -1.006063, -3.395777, 0, 1, 0.8784314, 1,
-0.07485684, -0.6309859, -2.872355, 0, 1, 0.8862745, 1,
-0.07315527, 0.3787357, -0.2454463, 0, 1, 0.8901961, 1,
-0.07268853, -2.369462, -3.643807, 0, 1, 0.8980392, 1,
-0.07160881, -0.4236259, -2.346104, 0, 1, 0.9058824, 1,
-0.07006184, -0.5529458, -0.7192932, 0, 1, 0.9098039, 1,
-0.06906172, 0.9274148, 1.100011, 0, 1, 0.9176471, 1,
-0.06794073, -0.2718945, -2.814937, 0, 1, 0.9215686, 1,
-0.06405623, -2.777579, -3.543758, 0, 1, 0.9294118, 1,
-0.0601273, 0.7897543, 0.4325672, 0, 1, 0.9333333, 1,
-0.05946599, 0.08625209, -1.172043, 0, 1, 0.9411765, 1,
-0.05722641, -1.667414, -0.4624002, 0, 1, 0.945098, 1,
-0.05665385, 1.109374, -1.119578, 0, 1, 0.9529412, 1,
-0.05314796, 2.244337, -0.123662, 0, 1, 0.9568627, 1,
-0.05268889, -1.557758, -2.905694, 0, 1, 0.9647059, 1,
-0.05230502, -2.216092, -2.062515, 0, 1, 0.9686275, 1,
-0.05186716, -1.196554, -0.9799247, 0, 1, 0.9764706, 1,
-0.05072268, 0.329513, 1.889289, 0, 1, 0.9803922, 1,
-0.0430896, 0.5895222, 0.1715093, 0, 1, 0.9882353, 1,
-0.04185323, 0.7372426, -0.5987713, 0, 1, 0.9921569, 1,
-0.02980557, -0.4889217, -1.339686, 0, 1, 1, 1,
-0.02642793, 0.5971038, -0.3102643, 0, 0.9921569, 1, 1,
-0.02580604, 0.1877284, -1.074775, 0, 0.9882353, 1, 1,
-0.02382131, 0.5982248, -0.5985479, 0, 0.9803922, 1, 1,
-0.01624638, -2.019798, -3.237505, 0, 0.9764706, 1, 1,
-0.01336715, -0.4665447, -3.327058, 0, 0.9686275, 1, 1,
-0.00775808, -1.896277, -4.63381, 0, 0.9647059, 1, 1,
-0.005240543, 1.166452, 0.6774166, 0, 0.9568627, 1, 1,
-0.003860855, 1.159793, -1.088363, 0, 0.9529412, 1, 1,
0.001094089, 2.632598, -0.8237981, 0, 0.945098, 1, 1,
0.001485609, 0.9851353, 2.39067, 0, 0.9411765, 1, 1,
0.008403665, 0.2574144, 0.4690184, 0, 0.9333333, 1, 1,
0.01575223, 0.08972127, -0.2639147, 0, 0.9294118, 1, 1,
0.01819447, 0.7150989, -1.747958, 0, 0.9215686, 1, 1,
0.01842478, -0.9879513, 4.444383, 0, 0.9176471, 1, 1,
0.01959195, 2.611356, 0.9017311, 0, 0.9098039, 1, 1,
0.01999416, -1.444066, 3.156953, 0, 0.9058824, 1, 1,
0.02309619, 0.07359712, 1.364549, 0, 0.8980392, 1, 1,
0.02455407, -0.3333513, 3.382388, 0, 0.8901961, 1, 1,
0.02513108, -0.358902, 3.37984, 0, 0.8862745, 1, 1,
0.02521388, 0.3362917, -0.4831613, 0, 0.8784314, 1, 1,
0.02993468, 1.399328, -0.07015676, 0, 0.8745098, 1, 1,
0.03587371, -0.7099733, 4.698659, 0, 0.8666667, 1, 1,
0.03788224, 2.373627, 0.3128065, 0, 0.8627451, 1, 1,
0.04202411, 0.4500666, 0.3354697, 0, 0.854902, 1, 1,
0.04430977, 0.3183376, 0.9473419, 0, 0.8509804, 1, 1,
0.04701587, -0.1988925, 2.456511, 0, 0.8431373, 1, 1,
0.05806083, -0.3136819, 4.179369, 0, 0.8392157, 1, 1,
0.06197883, -0.4050262, 1.683205, 0, 0.8313726, 1, 1,
0.06221912, 0.1384303, -0.4943536, 0, 0.827451, 1, 1,
0.06720329, 2.277732, 2.391643, 0, 0.8196079, 1, 1,
0.07079925, 0.08555604, -0.09503257, 0, 0.8156863, 1, 1,
0.072334, 0.6563487, 0.9186069, 0, 0.8078431, 1, 1,
0.07489917, 0.2995169, 1.048659, 0, 0.8039216, 1, 1,
0.07801592, -0.7290089, 3.647836, 0, 0.7960784, 1, 1,
0.0814834, -1.459357, 2.476167, 0, 0.7882353, 1, 1,
0.08455965, 0.4331762, -0.6655478, 0, 0.7843137, 1, 1,
0.09121522, 0.758494, -0.4893388, 0, 0.7764706, 1, 1,
0.09230861, 0.02688749, -0.1525057, 0, 0.772549, 1, 1,
0.09322846, 0.2056126, 0.1988942, 0, 0.7647059, 1, 1,
0.09337401, 1.059295, 0.6302862, 0, 0.7607843, 1, 1,
0.1029274, -1.010267, 4.795682, 0, 0.7529412, 1, 1,
0.1070294, 0.4891982, 0.02540952, 0, 0.7490196, 1, 1,
0.1127727, -0.3438026, 5.064039, 0, 0.7411765, 1, 1,
0.114425, 1.42173, -0.6335051, 0, 0.7372549, 1, 1,
0.1186055, 0.06365635, 0.7461, 0, 0.7294118, 1, 1,
0.1188978, -0.656705, 3.393697, 0, 0.7254902, 1, 1,
0.1237192, 0.2194273, 0.6342939, 0, 0.7176471, 1, 1,
0.1258824, 1.103132, -1.234896, 0, 0.7137255, 1, 1,
0.1280321, 1.733755, 2.169379, 0, 0.7058824, 1, 1,
0.1303387, 0.4197607, 1.397206, 0, 0.6980392, 1, 1,
0.1329665, -0.3137898, 1.66767, 0, 0.6941177, 1, 1,
0.1366298, -0.9919875, 2.910299, 0, 0.6862745, 1, 1,
0.1377879, 1.570323, 0.576101, 0, 0.682353, 1, 1,
0.1415613, 0.3611724, -0.8334264, 0, 0.6745098, 1, 1,
0.1451321, 1.138556, 0.08525836, 0, 0.6705883, 1, 1,
0.1455567, 0.3266437, -0.3922553, 0, 0.6627451, 1, 1,
0.1462337, 1.064151, 1.195303, 0, 0.6588235, 1, 1,
0.1530012, -0.6466082, 1.53319, 0, 0.6509804, 1, 1,
0.1535955, -0.1046949, 1.959309, 0, 0.6470588, 1, 1,
0.1545714, 0.789604, 0.6674435, 0, 0.6392157, 1, 1,
0.1549753, -1.182381, 3.181342, 0, 0.6352941, 1, 1,
0.1569541, 0.01229421, 1.235938, 0, 0.627451, 1, 1,
0.1690239, -0.06955653, 1.146912, 0, 0.6235294, 1, 1,
0.1767322, 1.521616, -0.1954101, 0, 0.6156863, 1, 1,
0.1768276, -0.5371835, 1.637673, 0, 0.6117647, 1, 1,
0.1793529, -1.831112, 2.495479, 0, 0.6039216, 1, 1,
0.1835135, -0.4903089, 3.554024, 0, 0.5960785, 1, 1,
0.1886649, -0.2908995, 3.998345, 0, 0.5921569, 1, 1,
0.1891622, 1.906313, 0.9746706, 0, 0.5843138, 1, 1,
0.1910613, 0.000111004, 1.523224, 0, 0.5803922, 1, 1,
0.1961108, -0.7687421, 4.277751, 0, 0.572549, 1, 1,
0.198478, -0.9746318, 3.199259, 0, 0.5686275, 1, 1,
0.2015766, -2.097128, 1.677099, 0, 0.5607843, 1, 1,
0.2016587, 2.231658, 0.8855245, 0, 0.5568628, 1, 1,
0.2035059, 0.6345038, 0.3512042, 0, 0.5490196, 1, 1,
0.2048442, 1.006567, -0.4165257, 0, 0.5450981, 1, 1,
0.2059609, -1.286192, 2.378719, 0, 0.5372549, 1, 1,
0.210795, -0.2467304, 2.763499, 0, 0.5333334, 1, 1,
0.2128001, -0.414003, 4.03561, 0, 0.5254902, 1, 1,
0.2162367, 0.9975748, -0.443951, 0, 0.5215687, 1, 1,
0.2243397, -0.6173332, 3.822426, 0, 0.5137255, 1, 1,
0.2269339, -0.5500237, 4.192154, 0, 0.509804, 1, 1,
0.2282717, -0.1440294, 3.687586, 0, 0.5019608, 1, 1,
0.229015, -0.8432978, 1.972127, 0, 0.4941176, 1, 1,
0.2344439, 0.2561108, 0.9174347, 0, 0.4901961, 1, 1,
0.240091, -0.6544515, 3.498428, 0, 0.4823529, 1, 1,
0.2404246, -0.1982593, 1.921561, 0, 0.4784314, 1, 1,
0.2548422, -1.158988, 4.079333, 0, 0.4705882, 1, 1,
0.2588528, -0.005142031, 1.363379, 0, 0.4666667, 1, 1,
0.2615363, 0.3477778, 2.133287, 0, 0.4588235, 1, 1,
0.2626358, -0.241711, 1.974087, 0, 0.454902, 1, 1,
0.2635646, -0.2413869, 4.769259, 0, 0.4470588, 1, 1,
0.2637685, -0.2578297, 3.753846, 0, 0.4431373, 1, 1,
0.2638945, -0.08664837, 0.2741674, 0, 0.4352941, 1, 1,
0.2677085, -0.07966453, 1.009315, 0, 0.4313726, 1, 1,
0.2682896, 0.1573707, 0.8433551, 0, 0.4235294, 1, 1,
0.2689297, -0.0803853, 1.987299, 0, 0.4196078, 1, 1,
0.2694428, 1.028797, -0.6281034, 0, 0.4117647, 1, 1,
0.2771822, 1.292964, 1.131876, 0, 0.4078431, 1, 1,
0.282335, -0.3485287, 2.661347, 0, 0.4, 1, 1,
0.2850062, 0.1939865, 1.844863, 0, 0.3921569, 1, 1,
0.2859558, 1.473751, 1.409117, 0, 0.3882353, 1, 1,
0.298327, -0.1140164, 1.76468, 0, 0.3803922, 1, 1,
0.302452, -0.5202247, 2.933769, 0, 0.3764706, 1, 1,
0.3032175, -1.325667, 3.20671, 0, 0.3686275, 1, 1,
0.3037088, -1.827163, 3.721536, 0, 0.3647059, 1, 1,
0.3037499, 0.3719484, 1.303917, 0, 0.3568628, 1, 1,
0.3039139, 1.069949, 3.004276, 0, 0.3529412, 1, 1,
0.3085397, -0.8557159, 4.208343, 0, 0.345098, 1, 1,
0.3088564, -0.9167707, 2.714434, 0, 0.3411765, 1, 1,
0.3111019, 1.622546, 1.051506, 0, 0.3333333, 1, 1,
0.313518, 0.235739, 1.087082, 0, 0.3294118, 1, 1,
0.3207341, 0.7306231, 1.887931, 0, 0.3215686, 1, 1,
0.3247471, -0.104917, 2.061112, 0, 0.3176471, 1, 1,
0.3248826, -0.7798202, 3.25927, 0, 0.3098039, 1, 1,
0.3249364, -0.5756875, 1.267138, 0, 0.3058824, 1, 1,
0.3296505, 0.5080578, 0.4068771, 0, 0.2980392, 1, 1,
0.330267, -1.79158, 1.529076, 0, 0.2901961, 1, 1,
0.3315327, 0.1325591, 1.518087, 0, 0.2862745, 1, 1,
0.336914, 0.2835017, 0.6117619, 0, 0.2784314, 1, 1,
0.3374817, -1.108011, 2.400498, 0, 0.2745098, 1, 1,
0.3431468, 0.243622, 1.075816, 0, 0.2666667, 1, 1,
0.3469366, 0.5387129, -0.4700418, 0, 0.2627451, 1, 1,
0.3471729, 1.101837, 0.3600833, 0, 0.254902, 1, 1,
0.3479243, 3.418175, 1.037105, 0, 0.2509804, 1, 1,
0.350638, -0.2630914, 1.606599, 0, 0.2431373, 1, 1,
0.3516558, 0.7495759, 1.143765, 0, 0.2392157, 1, 1,
0.3525217, 0.7996637, 1.553705, 0, 0.2313726, 1, 1,
0.3580019, 0.2599743, 1.142642, 0, 0.227451, 1, 1,
0.3584804, -0.6244552, 3.653695, 0, 0.2196078, 1, 1,
0.3589129, -0.5440628, 2.842088, 0, 0.2156863, 1, 1,
0.3616507, -0.6062946, 2.873455, 0, 0.2078431, 1, 1,
0.3626526, -0.6270842, 3.335697, 0, 0.2039216, 1, 1,
0.3636599, 1.102451, 0.9140478, 0, 0.1960784, 1, 1,
0.3705453, 1.358237, 0.2302163, 0, 0.1882353, 1, 1,
0.3706227, -0.2719271, 1.719568, 0, 0.1843137, 1, 1,
0.3723815, 0.1583219, 0.3082294, 0, 0.1764706, 1, 1,
0.3724752, 0.8299694, 0.1358362, 0, 0.172549, 1, 1,
0.3755324, 1.856862, 0.9204151, 0, 0.1647059, 1, 1,
0.376422, 0.7175953, 0.3287371, 0, 0.1607843, 1, 1,
0.3804888, -0.3685, 2.620684, 0, 0.1529412, 1, 1,
0.3814008, -0.8008822, 3.066816, 0, 0.1490196, 1, 1,
0.3848855, -1.001316, 2.672484, 0, 0.1411765, 1, 1,
0.3864163, 0.2254622, 0.1148098, 0, 0.1372549, 1, 1,
0.3887605, -0.7367781, 3.574129, 0, 0.1294118, 1, 1,
0.3889352, -1.421612, 4.549503, 0, 0.1254902, 1, 1,
0.3918763, 1.123985, 4.211688, 0, 0.1176471, 1, 1,
0.3922423, 0.1350124, -0.4507921, 0, 0.1137255, 1, 1,
0.3928186, -0.2021058, 1.443646, 0, 0.1058824, 1, 1,
0.3943282, 0.65681, 1.855785, 0, 0.09803922, 1, 1,
0.3951109, 0.3852938, 1.013735, 0, 0.09411765, 1, 1,
0.3963969, -1.497245, 2.976769, 0, 0.08627451, 1, 1,
0.3966418, 0.5639405, 1.938024, 0, 0.08235294, 1, 1,
0.4042565, -2.638733, 4.391037, 0, 0.07450981, 1, 1,
0.404945, 1.179528, 0.867457, 0, 0.07058824, 1, 1,
0.4051583, -1.041111, 3.01379, 0, 0.0627451, 1, 1,
0.4071718, -0.1610572, 2.830691, 0, 0.05882353, 1, 1,
0.4108945, 2.593652, 0.5720477, 0, 0.05098039, 1, 1,
0.4135301, -0.4574355, 1.618575, 0, 0.04705882, 1, 1,
0.414723, 0.7049128, 0.9602489, 0, 0.03921569, 1, 1,
0.4194549, -0.875215, 3.269251, 0, 0.03529412, 1, 1,
0.4214514, -0.008214487, 2.406703, 0, 0.02745098, 1, 1,
0.4219273, 0.1152863, 1.538157, 0, 0.02352941, 1, 1,
0.4220599, -1.643602, 1.610611, 0, 0.01568628, 1, 1,
0.4243193, 1.795596, -0.1541914, 0, 0.01176471, 1, 1,
0.4253835, -0.3778249, 2.685861, 0, 0.003921569, 1, 1,
0.426203, 0.9773145, 0.7381786, 0.003921569, 0, 1, 1,
0.4394401, -0.1445893, 1.343541, 0.007843138, 0, 1, 1,
0.4429171, 0.4852006, 0.7018945, 0.01568628, 0, 1, 1,
0.4432644, -0.3383677, 1.717049, 0.01960784, 0, 1, 1,
0.4432937, -1.058677, 1.428616, 0.02745098, 0, 1, 1,
0.4442543, 1.299691, 0.1517317, 0.03137255, 0, 1, 1,
0.4466672, 0.4990188, 1.048299, 0.03921569, 0, 1, 1,
0.4473141, 1.267685, 1.008662, 0.04313726, 0, 1, 1,
0.4504955, -0.03840971, 4.142061, 0.05098039, 0, 1, 1,
0.4592288, -0.9250044, 1.374929, 0.05490196, 0, 1, 1,
0.4603282, 0.7241689, 0.04457896, 0.0627451, 0, 1, 1,
0.4630509, 0.100985, 0.7707897, 0.06666667, 0, 1, 1,
0.4683439, 1.177088, 0.8918518, 0.07450981, 0, 1, 1,
0.4700658, -0.9623395, 2.646884, 0.07843138, 0, 1, 1,
0.4764443, 1.465155, -0.310378, 0.08627451, 0, 1, 1,
0.4764768, 0.114355, 0.2225079, 0.09019608, 0, 1, 1,
0.4774349, 0.8670232, 1.861679, 0.09803922, 0, 1, 1,
0.48223, 0.4658775, 1.505375, 0.1058824, 0, 1, 1,
0.487449, -2.272581, 1.627674, 0.1098039, 0, 1, 1,
0.4957722, 0.732582, 1.185508, 0.1176471, 0, 1, 1,
0.499398, -1.172558, 1.646989, 0.1215686, 0, 1, 1,
0.5009365, -0.2631675, 2.313667, 0.1294118, 0, 1, 1,
0.5058573, 0.1489487, 1.156598, 0.1333333, 0, 1, 1,
0.5072202, -1.639951, 3.342694, 0.1411765, 0, 1, 1,
0.5074941, -0.409623, 3.182366, 0.145098, 0, 1, 1,
0.5080491, 1.002636, 0.1227107, 0.1529412, 0, 1, 1,
0.5131881, 0.3623692, 0.1214121, 0.1568628, 0, 1, 1,
0.5133762, -0.8095805, 2.17769, 0.1647059, 0, 1, 1,
0.5153016, -0.7961829, 0.9480566, 0.1686275, 0, 1, 1,
0.5185291, -0.1019486, 1.422287, 0.1764706, 0, 1, 1,
0.5198619, -0.3274764, 1.628995, 0.1803922, 0, 1, 1,
0.5235439, -0.603959, 1.948897, 0.1882353, 0, 1, 1,
0.5299958, -1.21274, 1.702493, 0.1921569, 0, 1, 1,
0.5310748, 2.4906, -0.1528179, 0.2, 0, 1, 1,
0.5347388, 1.946782, -0.4445697, 0.2078431, 0, 1, 1,
0.5384306, 0.1469966, 3.39205, 0.2117647, 0, 1, 1,
0.5470015, -0.03786723, -1.167561, 0.2196078, 0, 1, 1,
0.5520388, 0.8698071, 1.437482, 0.2235294, 0, 1, 1,
0.5543959, -0.7025818, 3.127921, 0.2313726, 0, 1, 1,
0.5548333, 0.5903658, 1.214149, 0.2352941, 0, 1, 1,
0.5557218, 1.198073, -0.7591802, 0.2431373, 0, 1, 1,
0.5579014, 0.03491695, 2.167663, 0.2470588, 0, 1, 1,
0.5613515, 0.8974003, -0.4800038, 0.254902, 0, 1, 1,
0.5627779, -0.6453997, 2.979059, 0.2588235, 0, 1, 1,
0.5640057, 0.8846958, 1.326491, 0.2666667, 0, 1, 1,
0.5668193, -0.4800543, 1.400539, 0.2705882, 0, 1, 1,
0.5669966, 1.746959, 0.4777082, 0.2784314, 0, 1, 1,
0.5675014, 0.3127187, 3.248006, 0.282353, 0, 1, 1,
0.5695775, 0.07887385, 0.7598202, 0.2901961, 0, 1, 1,
0.5715409, 0.3351092, 0.313526, 0.2941177, 0, 1, 1,
0.5729499, -1.032843, 2.242934, 0.3019608, 0, 1, 1,
0.5758923, 0.4618447, -0.3685624, 0.3098039, 0, 1, 1,
0.578176, 0.9995059, 0.3056382, 0.3137255, 0, 1, 1,
0.58277, 0.02983772, 0.8996218, 0.3215686, 0, 1, 1,
0.5836615, -0.5526531, 3.016615, 0.3254902, 0, 1, 1,
0.5837452, 2.433282, -0.2403959, 0.3333333, 0, 1, 1,
0.5893096, -1.654105, 4.587846, 0.3372549, 0, 1, 1,
0.5969747, -1.249302, 1.938003, 0.345098, 0, 1, 1,
0.5969996, 0.4177422, 1.630182, 0.3490196, 0, 1, 1,
0.5997196, 1.407982, 1.417377, 0.3568628, 0, 1, 1,
0.6011683, -0.6748888, 1.972329, 0.3607843, 0, 1, 1,
0.6034396, 0.6153927, -0.01501669, 0.3686275, 0, 1, 1,
0.6038349, 0.2214576, 0.5613369, 0.372549, 0, 1, 1,
0.6054789, 0.56457, 2.046014, 0.3803922, 0, 1, 1,
0.6137472, -0.2147364, -0.589478, 0.3843137, 0, 1, 1,
0.6197123, 0.01560736, 1.902482, 0.3921569, 0, 1, 1,
0.6247956, -0.2654833, 2.535558, 0.3960784, 0, 1, 1,
0.6257387, -0.03689191, 2.304115, 0.4039216, 0, 1, 1,
0.6258946, -1.710701, 3.087595, 0.4117647, 0, 1, 1,
0.6268263, -2.168775, 3.674546, 0.4156863, 0, 1, 1,
0.6320829, 1.070148, 1.293163, 0.4235294, 0, 1, 1,
0.633418, -0.2509633, 2.661496, 0.427451, 0, 1, 1,
0.6355102, -0.4589584, 3.416411, 0.4352941, 0, 1, 1,
0.6394802, -1.68017, 3.417434, 0.4392157, 0, 1, 1,
0.6420816, 0.9647721, 1.912393, 0.4470588, 0, 1, 1,
0.6420819, -1.794717, 3.307337, 0.4509804, 0, 1, 1,
0.6430301, 0.8471909, 0.862238, 0.4588235, 0, 1, 1,
0.6444257, -2.09599, 3.119398, 0.4627451, 0, 1, 1,
0.645964, 1.65149, 0.8854736, 0.4705882, 0, 1, 1,
0.6493994, -1.486501, 4.038687, 0.4745098, 0, 1, 1,
0.6514143, 0.2575854, 1.235784, 0.4823529, 0, 1, 1,
0.6516671, 1.116796, -0.06404255, 0.4862745, 0, 1, 1,
0.6550019, -1.009508, 3.134121, 0.4941176, 0, 1, 1,
0.6582943, -1.525909, 5.293015, 0.5019608, 0, 1, 1,
0.6619024, -1.912047, 4.83626, 0.5058824, 0, 1, 1,
0.6683645, 0.8313646, 1.395905, 0.5137255, 0, 1, 1,
0.6784692, 0.9561437, -0.4238535, 0.5176471, 0, 1, 1,
0.6838737, -0.8788078, 1.57354, 0.5254902, 0, 1, 1,
0.6852426, -0.5910809, 0.728839, 0.5294118, 0, 1, 1,
0.6860566, 0.4313048, 2.103354, 0.5372549, 0, 1, 1,
0.6888826, -0.03194529, 0.8207072, 0.5411765, 0, 1, 1,
0.6968383, -0.2594759, 1.557441, 0.5490196, 0, 1, 1,
0.6987206, 2.986772, 0.6842352, 0.5529412, 0, 1, 1,
0.6989787, 0.1728774, 1.689458, 0.5607843, 0, 1, 1,
0.700545, 0.2237485, 3.138991, 0.5647059, 0, 1, 1,
0.7055613, 1.263291, -1.32713, 0.572549, 0, 1, 1,
0.7071078, 1.03305, -1.151024, 0.5764706, 0, 1, 1,
0.7099326, -0.5632596, 3.19049, 0.5843138, 0, 1, 1,
0.7122318, 0.7812554, -0.3951339, 0.5882353, 0, 1, 1,
0.7123849, -0.3071634, 2.164358, 0.5960785, 0, 1, 1,
0.718353, -0.02058898, 0.9756024, 0.6039216, 0, 1, 1,
0.7184705, 0.502047, -0.003977712, 0.6078432, 0, 1, 1,
0.72141, 0.1941089, -0.7076347, 0.6156863, 0, 1, 1,
0.7225725, -0.6830263, 3.545135, 0.6196079, 0, 1, 1,
0.7245452, 0.798942, -0.4397468, 0.627451, 0, 1, 1,
0.7255002, -0.8961117, 1.102189, 0.6313726, 0, 1, 1,
0.7313, -0.4698985, 1.519487, 0.6392157, 0, 1, 1,
0.7394025, -0.2084943, 0.4735298, 0.6431373, 0, 1, 1,
0.7404044, -1.00022, 3.012522, 0.6509804, 0, 1, 1,
0.7442552, 0.452201, 1.277281, 0.654902, 0, 1, 1,
0.7582923, 0.07418624, 0.418256, 0.6627451, 0, 1, 1,
0.7629649, -1.169917, 1.098584, 0.6666667, 0, 1, 1,
0.7677627, 0.9825194, 2.032442, 0.6745098, 0, 1, 1,
0.7743353, -0.05728061, 0.28236, 0.6784314, 0, 1, 1,
0.774769, 1.215785, 0.7423766, 0.6862745, 0, 1, 1,
0.7769895, 0.8927733, 0.880011, 0.6901961, 0, 1, 1,
0.7797424, 0.465638, 0.4972765, 0.6980392, 0, 1, 1,
0.7801982, -1.931756, 3.396954, 0.7058824, 0, 1, 1,
0.7882064, -1.110096, 1.212407, 0.7098039, 0, 1, 1,
0.7888618, 0.2869738, 1.314891, 0.7176471, 0, 1, 1,
0.7981961, -0.1810176, 1.084586, 0.7215686, 0, 1, 1,
0.8012918, -0.209485, 2.263532, 0.7294118, 0, 1, 1,
0.8039843, -0.9636685, 2.289808, 0.7333333, 0, 1, 1,
0.8117236, 0.472745, 1.762462, 0.7411765, 0, 1, 1,
0.8143108, 0.02861951, 0.7187876, 0.7450981, 0, 1, 1,
0.8186936, 1.447167, 0.8142319, 0.7529412, 0, 1, 1,
0.8187189, 1.631544, 0.1125861, 0.7568628, 0, 1, 1,
0.8270702, -1.656917, 3.347419, 0.7647059, 0, 1, 1,
0.8278742, -0.5870826, 1.063695, 0.7686275, 0, 1, 1,
0.8332321, -0.3955365, 1.840897, 0.7764706, 0, 1, 1,
0.8367064, 0.6059939, 0.1255737, 0.7803922, 0, 1, 1,
0.8383837, 0.6686189, 2.265146, 0.7882353, 0, 1, 1,
0.8386632, 0.7834438, 0.9171033, 0.7921569, 0, 1, 1,
0.8387601, 0.7113044, 0.978744, 0.8, 0, 1, 1,
0.8480081, 1.561933, 0.1323777, 0.8078431, 0, 1, 1,
0.8500798, -0.4846303, 2.605788, 0.8117647, 0, 1, 1,
0.8548149, -0.7327845, 3.0619, 0.8196079, 0, 1, 1,
0.8562506, -0.7973138, 1.989908, 0.8235294, 0, 1, 1,
0.8570356, -1.606283, 2.290113, 0.8313726, 0, 1, 1,
0.8584642, -0.2051995, -0.9189574, 0.8352941, 0, 1, 1,
0.8594807, -0.3866282, 3.041684, 0.8431373, 0, 1, 1,
0.8621609, -1.56446, 2.269145, 0.8470588, 0, 1, 1,
0.8642815, -0.1606488, 2.349664, 0.854902, 0, 1, 1,
0.8714005, -0.3439137, 0.04596617, 0.8588235, 0, 1, 1,
0.8723598, 1.452024, 0.8262469, 0.8666667, 0, 1, 1,
0.8759058, 0.03406997, 0.2554886, 0.8705882, 0, 1, 1,
0.8774372, -1.35807, 2.82078, 0.8784314, 0, 1, 1,
0.8807045, 0.9430835, 2.635936, 0.8823529, 0, 1, 1,
0.884468, 1.614829, -0.6937943, 0.8901961, 0, 1, 1,
0.8858737, 0.4889609, 1.766762, 0.8941177, 0, 1, 1,
0.8898835, -0.8971324, 1.681484, 0.9019608, 0, 1, 1,
0.8935267, 0.8640742, 0.8034239, 0.9098039, 0, 1, 1,
0.8990755, 0.5432844, 1.264956, 0.9137255, 0, 1, 1,
0.9009323, -2.10191, 2.986073, 0.9215686, 0, 1, 1,
0.9101137, 1.022566, -0.2763136, 0.9254902, 0, 1, 1,
0.9107373, 0.4341428, 2.108908, 0.9333333, 0, 1, 1,
0.9143202, 1.633154, -1.048777, 0.9372549, 0, 1, 1,
0.9149625, -0.2349577, 0.04337158, 0.945098, 0, 1, 1,
0.9171133, 0.170573, 0.9223397, 0.9490196, 0, 1, 1,
0.9191054, 0.3119101, 2.302943, 0.9568627, 0, 1, 1,
0.9211665, 0.2924799, 3.486387, 0.9607843, 0, 1, 1,
0.9252107, -1.738365, 2.430103, 0.9686275, 0, 1, 1,
0.9306954, 0.20743, 0.6609433, 0.972549, 0, 1, 1,
0.9441671, -0.8922667, 3.064256, 0.9803922, 0, 1, 1,
0.9454725, -2.204784, 4.773083, 0.9843137, 0, 1, 1,
0.9484534, 0.7435899, -0.6810695, 0.9921569, 0, 1, 1,
0.9593675, 0.9898476, -0.4971773, 0.9960784, 0, 1, 1,
0.9618634, 0.1074413, 1.696252, 1, 0, 0.9960784, 1,
0.963253, 0.9199227, 1.53014, 1, 0, 0.9882353, 1,
0.9634869, 1.441841, -0.8692149, 1, 0, 0.9843137, 1,
0.9639121, 1.473939, 0.1698514, 1, 0, 0.9764706, 1,
0.9673377, -0.9819971, 2.289898, 1, 0, 0.972549, 1,
0.9721212, 1.428614, 0.7082871, 1, 0, 0.9647059, 1,
0.9737366, 0.09015734, 0.4179283, 1, 0, 0.9607843, 1,
0.9801858, 0.120179, 0.6181191, 1, 0, 0.9529412, 1,
0.9843657, -0.4541897, 3.11326, 1, 0, 0.9490196, 1,
0.9859503, -0.7341415, 2.574472, 1, 0, 0.9411765, 1,
0.988819, 1.714515, 1.041577, 1, 0, 0.9372549, 1,
0.995759, 1.158732, 1.001878, 1, 0, 0.9294118, 1,
0.9968778, -2.043522, 2.154992, 1, 0, 0.9254902, 1,
0.999235, 0.5215501, 1.163928, 1, 0, 0.9176471, 1,
1.010208, -0.5721869, 3.154786, 1, 0, 0.9137255, 1,
1.010664, -0.2302835, 2.846855, 1, 0, 0.9058824, 1,
1.011395, 0.1226759, 2.2215, 1, 0, 0.9019608, 1,
1.013177, -2.512135, 1.924344, 1, 0, 0.8941177, 1,
1.015566, -0.469357, 2.797917, 1, 0, 0.8862745, 1,
1.017602, 1.513244, -0.08407895, 1, 0, 0.8823529, 1,
1.031924, 2.082657, 2.148989, 1, 0, 0.8745098, 1,
1.039947, 1.178746, -1.157295, 1, 0, 0.8705882, 1,
1.04272, 1.347914, 2.236501, 1, 0, 0.8627451, 1,
1.044977, 0.04023797, 1.801171, 1, 0, 0.8588235, 1,
1.046824, -0.2040796, 1.437027, 1, 0, 0.8509804, 1,
1.052793, -0.5135131, 4.084343, 1, 0, 0.8470588, 1,
1.058526, 1.073261, 2.456858, 1, 0, 0.8392157, 1,
1.079963, 0.572659, -0.6051539, 1, 0, 0.8352941, 1,
1.086786, -0.8811749, 0.2781476, 1, 0, 0.827451, 1,
1.088697, -2.650833, 3.422723, 1, 0, 0.8235294, 1,
1.095841, 0.1043448, 2.269614, 1, 0, 0.8156863, 1,
1.09978, -0.6690751, 0.4913864, 1, 0, 0.8117647, 1,
1.101361, -0.2266034, 2.534222, 1, 0, 0.8039216, 1,
1.103843, -0.9967679, -0.5415703, 1, 0, 0.7960784, 1,
1.104388, 1.474301, 0.4647141, 1, 0, 0.7921569, 1,
1.107418, -0.6191829, 2.662387, 1, 0, 0.7843137, 1,
1.120858, 0.7060096, 0.001726687, 1, 0, 0.7803922, 1,
1.126057, 0.019109, 0.9319535, 1, 0, 0.772549, 1,
1.134405, -0.1201488, 2.268337, 1, 0, 0.7686275, 1,
1.135866, -1.387005, 1.826832, 1, 0, 0.7607843, 1,
1.136912, -0.5370698, 1.648773, 1, 0, 0.7568628, 1,
1.155377, -0.7506148, 4.348442, 1, 0, 0.7490196, 1,
1.164254, 0.7183771, 0.6962281, 1, 0, 0.7450981, 1,
1.170232, 1.710154, 1.622337, 1, 0, 0.7372549, 1,
1.18036, 2.467565, -1.895989, 1, 0, 0.7333333, 1,
1.192112, 0.1331622, 0.3260155, 1, 0, 0.7254902, 1,
1.194895, -1.15554, 3.580447, 1, 0, 0.7215686, 1,
1.195279, -1.125674, 2.673161, 1, 0, 0.7137255, 1,
1.196362, -0.3637451, 1.416071, 1, 0, 0.7098039, 1,
1.208087, 0.4979273, 1.967301, 1, 0, 0.7019608, 1,
1.208878, -0.01114696, 1.118375, 1, 0, 0.6941177, 1,
1.209298, 2.889361, -0.8725905, 1, 0, 0.6901961, 1,
1.20993, 1.152778, 2.197702, 1, 0, 0.682353, 1,
1.216379, 1.268736, 1.222562, 1, 0, 0.6784314, 1,
1.219262, -0.3956867, 1.316202, 1, 0, 0.6705883, 1,
1.236045, 0.7303526, 1.922252, 1, 0, 0.6666667, 1,
1.253195, 1.335942, 0.3353864, 1, 0, 0.6588235, 1,
1.25554, 1.081992, -0.6498319, 1, 0, 0.654902, 1,
1.256871, -0.7189745, 4.101222, 1, 0, 0.6470588, 1,
1.257237, 1.1133, 1.622797, 1, 0, 0.6431373, 1,
1.258524, 1.136366, 0.3949644, 1, 0, 0.6352941, 1,
1.259043, 0.84231, 1.241654, 1, 0, 0.6313726, 1,
1.269004, 0.005612247, 0.8896453, 1, 0, 0.6235294, 1,
1.276917, -0.1246291, 1.215059, 1, 0, 0.6196079, 1,
1.277027, -0.9021942, 0.7279323, 1, 0, 0.6117647, 1,
1.286532, 0.7973019, 1.495382, 1, 0, 0.6078432, 1,
1.305501, 1.114037, 1.352713, 1, 0, 0.6, 1,
1.310099, 0.53679, 0.2419349, 1, 0, 0.5921569, 1,
1.314633, -0.738198, 2.325077, 1, 0, 0.5882353, 1,
1.323543, 1.203722, 0.7732547, 1, 0, 0.5803922, 1,
1.324715, -0.08817721, -0.7660845, 1, 0, 0.5764706, 1,
1.327095, 0.2643314, 1.364863, 1, 0, 0.5686275, 1,
1.329823, -2.420037, 4.505047, 1, 0, 0.5647059, 1,
1.346297, 2.210641, 1.622163, 1, 0, 0.5568628, 1,
1.359019, -0.2130883, 2.342804, 1, 0, 0.5529412, 1,
1.365938, -0.5373883, 1.107365, 1, 0, 0.5450981, 1,
1.370846, -0.3773482, 2.052387, 1, 0, 0.5411765, 1,
1.37116, 0.3913649, 2.408491, 1, 0, 0.5333334, 1,
1.371688, 2.159309, -0.1631341, 1, 0, 0.5294118, 1,
1.373804, -0.5965102, 0.1521766, 1, 0, 0.5215687, 1,
1.379924, 0.7846494, 0.3694923, 1, 0, 0.5176471, 1,
1.409158, -0.3287613, 1.662769, 1, 0, 0.509804, 1,
1.410336, -1.270256, 1.206401, 1, 0, 0.5058824, 1,
1.414904, 0.05466266, 1.860843, 1, 0, 0.4980392, 1,
1.421339, 1.254485, 1.612529, 1, 0, 0.4901961, 1,
1.426887, -1.898762, 1.698877, 1, 0, 0.4862745, 1,
1.431919, -1.938348, 2.05366, 1, 0, 0.4784314, 1,
1.444935, 0.3254484, 2.713898, 1, 0, 0.4745098, 1,
1.448427, 0.403464, -0.5674099, 1, 0, 0.4666667, 1,
1.452218, 1.032053, 1.763062, 1, 0, 0.4627451, 1,
1.459204, 0.3814535, 1.059769, 1, 0, 0.454902, 1,
1.464964, 1.115289, 0.6846535, 1, 0, 0.4509804, 1,
1.466354, 1.657657, -1.772029, 1, 0, 0.4431373, 1,
1.470924, -1.76962, 2.814285, 1, 0, 0.4392157, 1,
1.474063, -0.9352713, -0.8782869, 1, 0, 0.4313726, 1,
1.475207, 0.6363805, 1.714662, 1, 0, 0.427451, 1,
1.498434, 0.9241297, 0.7823713, 1, 0, 0.4196078, 1,
1.510345, 0.7044959, 1.054667, 1, 0, 0.4156863, 1,
1.512108, -0.3457158, 0.5316412, 1, 0, 0.4078431, 1,
1.537778, 0.1249161, -0.7880457, 1, 0, 0.4039216, 1,
1.554944, 0.3372422, 0.1992149, 1, 0, 0.3960784, 1,
1.577769, 0.828307, 2.253802, 1, 0, 0.3882353, 1,
1.581322, 0.273644, 2.832212, 1, 0, 0.3843137, 1,
1.596143, 0.756803, 3.079925, 1, 0, 0.3764706, 1,
1.604475, 0.1685145, 0.7307785, 1, 0, 0.372549, 1,
1.617183, 0.6861786, 1.736868, 1, 0, 0.3647059, 1,
1.618037, -3.246578, 2.736501, 1, 0, 0.3607843, 1,
1.619995, 0.6725507, 0.9293926, 1, 0, 0.3529412, 1,
1.632906, -0.06269854, 1.099471, 1, 0, 0.3490196, 1,
1.642203, 0.5302262, -1.267756, 1, 0, 0.3411765, 1,
1.647003, -0.1551135, 2.685337, 1, 0, 0.3372549, 1,
1.652721, 2.257439, 0.6481364, 1, 0, 0.3294118, 1,
1.655586, 0.01860112, -0.3541358, 1, 0, 0.3254902, 1,
1.662611, 0.2317193, 2.69535, 1, 0, 0.3176471, 1,
1.671062, -1.699541, 2.27102, 1, 0, 0.3137255, 1,
1.674075, -1.159604, 2.822496, 1, 0, 0.3058824, 1,
1.681397, 1.161158, 0.04295202, 1, 0, 0.2980392, 1,
1.685074, 1.693628, 0.1916734, 1, 0, 0.2941177, 1,
1.687631, -0.1153122, 2.597422, 1, 0, 0.2862745, 1,
1.694217, -1.348658, -0.7624907, 1, 0, 0.282353, 1,
1.694723, 1.162628, -0.08204021, 1, 0, 0.2745098, 1,
1.728043, 0.3347158, 0.8964059, 1, 0, 0.2705882, 1,
1.765796, -0.3378009, 1.585497, 1, 0, 0.2627451, 1,
1.784616, -0.658191, 2.237176, 1, 0, 0.2588235, 1,
1.789053, -0.06713357, 1.730587, 1, 0, 0.2509804, 1,
1.801285, -0.1976664, 1.357872, 1, 0, 0.2470588, 1,
1.805781, 3.064267, 1.846049, 1, 0, 0.2392157, 1,
1.819414, 0.6262811, 0.5403493, 1, 0, 0.2352941, 1,
1.851504, 1.354195, 3.250098, 1, 0, 0.227451, 1,
1.85254, -0.1696267, 2.320931, 1, 0, 0.2235294, 1,
1.862403, -1.602241, 1.148732, 1, 0, 0.2156863, 1,
1.903251, 0.6375467, 1.705081, 1, 0, 0.2117647, 1,
1.923919, -0.2681711, 2.489285, 1, 0, 0.2039216, 1,
1.924349, -0.5896641, 0.5296634, 1, 0, 0.1960784, 1,
1.943417, -0.01578029, 0.2662164, 1, 0, 0.1921569, 1,
1.961705, -0.3517147, 1.569032, 1, 0, 0.1843137, 1,
1.984957, -2.065205, 1.672934, 1, 0, 0.1803922, 1,
2.016546, 1.464867, 0.1542704, 1, 0, 0.172549, 1,
2.036681, 1.85607, 1.813897, 1, 0, 0.1686275, 1,
2.046766, 0.1480091, 0.9909818, 1, 0, 0.1607843, 1,
2.05729, 0.5022905, 1.874972, 1, 0, 0.1568628, 1,
2.070111, 0.4388047, 1.807131, 1, 0, 0.1490196, 1,
2.105162, 0.2986411, 1.829077, 1, 0, 0.145098, 1,
2.107114, 1.906784, 0.2792728, 1, 0, 0.1372549, 1,
2.128104, 0.6390152, 0.515915, 1, 0, 0.1333333, 1,
2.134781, 0.9871699, 0.7849066, 1, 0, 0.1254902, 1,
2.14175, 0.5692869, -1.676483, 1, 0, 0.1215686, 1,
2.196374, 0.8284097, 0.6812356, 1, 0, 0.1137255, 1,
2.20421, 0.2255433, 1.863799, 1, 0, 0.1098039, 1,
2.210859, -1.581705, 2.922902, 1, 0, 0.1019608, 1,
2.22691, 2.556591, 1.031257, 1, 0, 0.09411765, 1,
2.273261, -0.3333035, 1.678079, 1, 0, 0.09019608, 1,
2.375604, 1.405938, 0.2343856, 1, 0, 0.08235294, 1,
2.382772, -0.04230225, 1.169497, 1, 0, 0.07843138, 1,
2.389817, 0.951758, 0.7983387, 1, 0, 0.07058824, 1,
2.433279, 0.7311549, 0.779384, 1, 0, 0.06666667, 1,
2.445515, 1.214723, 0.1188641, 1, 0, 0.05882353, 1,
2.48153, 1.76387, -0.6458785, 1, 0, 0.05490196, 1,
2.530772, -1.232098, 0.5401255, 1, 0, 0.04705882, 1,
2.565478, 1.113162, 0.4415523, 1, 0, 0.04313726, 1,
2.576389, 0.6629243, -0.704686, 1, 0, 0.03529412, 1,
2.642289, 0.3071032, 1.858128, 1, 0, 0.03137255, 1,
2.847936, 0.0194231, 0.06242758, 1, 0, 0.02352941, 1,
2.874335, -0.6569898, 3.332153, 1, 0, 0.01960784, 1,
3.414126, -0.38886, 0.6526698, 1, 0, 0.01176471, 1,
3.990684, -0.1363587, -0.9586126, 1, 0, 0.007843138, 1
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
0.4213768, -4.8348, -7.194677, 0, -0.5, 0.5, 0.5,
0.4213768, -4.8348, -7.194677, 1, -0.5, 0.5, 0.5,
0.4213768, -4.8348, -7.194677, 1, 1.5, 0.5, 0.5,
0.4213768, -4.8348, -7.194677, 0, 1.5, 0.5, 0.5
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
-4.357926, -0.1102451, -7.194677, 0, -0.5, 0.5, 0.5,
-4.357926, -0.1102451, -7.194677, 1, -0.5, 0.5, 0.5,
-4.357926, -0.1102451, -7.194677, 1, 1.5, 0.5, 0.5,
-4.357926, -0.1102451, -7.194677, 0, 1.5, 0.5, 0.5
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
-4.357926, -4.8348, -0.04588723, 0, -0.5, 0.5, 0.5,
-4.357926, -4.8348, -0.04588723, 1, -0.5, 0.5, 0.5,
-4.357926, -4.8348, -0.04588723, 1, 1.5, 0.5, 0.5,
-4.357926, -4.8348, -0.04588723, 0, 1.5, 0.5, 0.5
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
-2, -3.744518, -5.544957,
2, -3.744518, -5.544957,
-2, -3.744518, -5.544957,
-2, -3.926232, -5.81991,
0, -3.744518, -5.544957,
0, -3.926232, -5.81991,
2, -3.744518, -5.544957,
2, -3.926232, -5.81991
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
-2, -4.28966, -6.369817, 0, -0.5, 0.5, 0.5,
-2, -4.28966, -6.369817, 1, -0.5, 0.5, 0.5,
-2, -4.28966, -6.369817, 1, 1.5, 0.5, 0.5,
-2, -4.28966, -6.369817, 0, 1.5, 0.5, 0.5,
0, -4.28966, -6.369817, 0, -0.5, 0.5, 0.5,
0, -4.28966, -6.369817, 1, -0.5, 0.5, 0.5,
0, -4.28966, -6.369817, 1, 1.5, 0.5, 0.5,
0, -4.28966, -6.369817, 0, 1.5, 0.5, 0.5,
2, -4.28966, -6.369817, 0, -0.5, 0.5, 0.5,
2, -4.28966, -6.369817, 1, -0.5, 0.5, 0.5,
2, -4.28966, -6.369817, 1, 1.5, 0.5, 0.5,
2, -4.28966, -6.369817, 0, 1.5, 0.5, 0.5
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
-3.25501, -2, -5.544957,
-3.25501, 2, -5.544957,
-3.25501, -2, -5.544957,
-3.438829, -2, -5.81991,
-3.25501, 0, -5.544957,
-3.438829, 0, -5.81991,
-3.25501, 2, -5.544957,
-3.438829, 2, -5.81991
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
-3.806468, -2, -6.369817, 0, -0.5, 0.5, 0.5,
-3.806468, -2, -6.369817, 1, -0.5, 0.5, 0.5,
-3.806468, -2, -6.369817, 1, 1.5, 0.5, 0.5,
-3.806468, -2, -6.369817, 0, 1.5, 0.5, 0.5,
-3.806468, 0, -6.369817, 0, -0.5, 0.5, 0.5,
-3.806468, 0, -6.369817, 1, -0.5, 0.5, 0.5,
-3.806468, 0, -6.369817, 1, 1.5, 0.5, 0.5,
-3.806468, 0, -6.369817, 0, 1.5, 0.5, 0.5,
-3.806468, 2, -6.369817, 0, -0.5, 0.5, 0.5,
-3.806468, 2, -6.369817, 1, -0.5, 0.5, 0.5,
-3.806468, 2, -6.369817, 1, 1.5, 0.5, 0.5,
-3.806468, 2, -6.369817, 0, 1.5, 0.5, 0.5
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
-3.25501, -3.744518, -4,
-3.25501, -3.744518, 4,
-3.25501, -3.744518, -4,
-3.438829, -3.926232, -4,
-3.25501, -3.744518, -2,
-3.438829, -3.926232, -2,
-3.25501, -3.744518, 0,
-3.438829, -3.926232, 0,
-3.25501, -3.744518, 2,
-3.438829, -3.926232, 2,
-3.25501, -3.744518, 4,
-3.438829, -3.926232, 4
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
-3.806468, -4.28966, -4, 0, -0.5, 0.5, 0.5,
-3.806468, -4.28966, -4, 1, -0.5, 0.5, 0.5,
-3.806468, -4.28966, -4, 1, 1.5, 0.5, 0.5,
-3.806468, -4.28966, -4, 0, 1.5, 0.5, 0.5,
-3.806468, -4.28966, -2, 0, -0.5, 0.5, 0.5,
-3.806468, -4.28966, -2, 1, -0.5, 0.5, 0.5,
-3.806468, -4.28966, -2, 1, 1.5, 0.5, 0.5,
-3.806468, -4.28966, -2, 0, 1.5, 0.5, 0.5,
-3.806468, -4.28966, 0, 0, -0.5, 0.5, 0.5,
-3.806468, -4.28966, 0, 1, -0.5, 0.5, 0.5,
-3.806468, -4.28966, 0, 1, 1.5, 0.5, 0.5,
-3.806468, -4.28966, 0, 0, 1.5, 0.5, 0.5,
-3.806468, -4.28966, 2, 0, -0.5, 0.5, 0.5,
-3.806468, -4.28966, 2, 1, -0.5, 0.5, 0.5,
-3.806468, -4.28966, 2, 1, 1.5, 0.5, 0.5,
-3.806468, -4.28966, 2, 0, 1.5, 0.5, 0.5,
-3.806468, -4.28966, 4, 0, -0.5, 0.5, 0.5,
-3.806468, -4.28966, 4, 1, -0.5, 0.5, 0.5,
-3.806468, -4.28966, 4, 1, 1.5, 0.5, 0.5,
-3.806468, -4.28966, 4, 0, 1.5, 0.5, 0.5
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
-3.25501, -3.744518, -5.544957,
-3.25501, 3.524028, -5.544957,
-3.25501, -3.744518, 5.453182,
-3.25501, 3.524028, 5.453182,
-3.25501, -3.744518, -5.544957,
-3.25501, -3.744518, 5.453182,
-3.25501, 3.524028, -5.544957,
-3.25501, 3.524028, 5.453182,
-3.25501, -3.744518, -5.544957,
4.097764, -3.744518, -5.544957,
-3.25501, -3.744518, 5.453182,
4.097764, -3.744518, 5.453182,
-3.25501, 3.524028, -5.544957,
4.097764, 3.524028, -5.544957,
-3.25501, 3.524028, 5.453182,
4.097764, 3.524028, 5.453182,
4.097764, -3.744518, -5.544957,
4.097764, 3.524028, -5.544957,
4.097764, -3.744518, 5.453182,
4.097764, 3.524028, 5.453182,
4.097764, -3.744518, -5.544957,
4.097764, -3.744518, 5.453182,
4.097764, 3.524028, -5.544957,
4.097764, 3.524028, 5.453182
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
var radius = 8.06035;
var distance = 35.86141;
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
mvMatrix.translate( -0.4213768, 0.1102451, 0.04588723 );
mvMatrix.scale( 1.185268, 1.199003, 0.7924076 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.86141);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
pentachlorophenate<-read.table("pentachlorophenate.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pentachlorophenate$V2
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorophenate' not found
```

```r
y<-pentachlorophenate$V3
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorophenate' not found
```

```r
z<-pentachlorophenate$V4
```

```
## Error in eval(expr, envir, enclos): object 'pentachlorophenate' not found
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
-3.147931, 2.33964, -0.900558, 0, 0, 1, 1, 1,
-3.050883, 0.847522, 0.9571039, 1, 0, 0, 1, 1,
-2.953142, -1.584735, -2.640004, 1, 0, 0, 1, 1,
-2.838067, 0.3826239, -0.1415419, 1, 0, 0, 1, 1,
-2.736803, 0.8509514, -1.915424, 1, 0, 0, 1, 1,
-2.658167, -0.3559297, -1.014592, 1, 0, 0, 1, 1,
-2.63041, -1.664497, -2.792566, 0, 0, 0, 1, 1,
-2.589231, 0.419011, -0.5952122, 0, 0, 0, 1, 1,
-2.553161, -1.003514, -2.818701, 0, 0, 0, 1, 1,
-2.519697, -0.04429204, -1.478061, 0, 0, 0, 1, 1,
-2.494138, -1.439536, -2.388235, 0, 0, 0, 1, 1,
-2.493109, -1.101289, -3.767071, 0, 0, 0, 1, 1,
-2.479316, -0.3276792, -0.9914762, 0, 0, 0, 1, 1,
-2.436715, -0.8207447, -1.486615, 1, 1, 1, 1, 1,
-2.41419, -1.401413, -0.5466878, 1, 1, 1, 1, 1,
-2.306049, 0.5063271, -3.961496, 1, 1, 1, 1, 1,
-2.136224, 0.1905943, -0.8782253, 1, 1, 1, 1, 1,
-2.119133, 0.536997, -2.738655, 1, 1, 1, 1, 1,
-2.06179, 0.1002662, -0.7413011, 1, 1, 1, 1, 1,
-2.060284, -0.3993089, -3.895659, 1, 1, 1, 1, 1,
-2.059339, -0.9408053, -0.7273783, 1, 1, 1, 1, 1,
-2.054619, 1.826919, -0.3122701, 1, 1, 1, 1, 1,
-2.045836, 0.4372069, -1.35536, 1, 1, 1, 1, 1,
-2.034909, -1.084919, -2.524061, 1, 1, 1, 1, 1,
-2.034801, 1.250679, -1.294254, 1, 1, 1, 1, 1,
-2.028781, -1.553443, -2.19204, 1, 1, 1, 1, 1,
-2.025745, -0.3737814, -3.545367, 1, 1, 1, 1, 1,
-2.013312, -1.281994, -3.899644, 1, 1, 1, 1, 1,
-1.975337, -0.04391503, -1.453768, 0, 0, 1, 1, 1,
-1.97034, 1.301656, -0.6058993, 1, 0, 0, 1, 1,
-1.963159, -0.1780031, -2.833497, 1, 0, 0, 1, 1,
-1.951899, -0.1531276, -1.672378, 1, 0, 0, 1, 1,
-1.947771, 0.7700354, -2.800506, 1, 0, 0, 1, 1,
-1.94238, 2.696912, -1.875418, 1, 0, 0, 1, 1,
-1.904263, -0.8697807, -2.900565, 0, 0, 0, 1, 1,
-1.888107, 1.0647, -1.3261, 0, 0, 0, 1, 1,
-1.872044, -1.468496, -0.195581, 0, 0, 0, 1, 1,
-1.861089, -1.036026, -3.24717, 0, 0, 0, 1, 1,
-1.844188, -0.5853862, -0.03166926, 0, 0, 0, 1, 1,
-1.834188, 0.4799318, -3.020972, 0, 0, 0, 1, 1,
-1.831701, 0.9480975, -1.660088, 0, 0, 0, 1, 1,
-1.830695, 0.4085574, -0.08338848, 1, 1, 1, 1, 1,
-1.812974, -0.4883454, -0.02051836, 1, 1, 1, 1, 1,
-1.812746, -0.5447308, -2.149005, 1, 1, 1, 1, 1,
-1.798007, 0.186132, -1.016458, 1, 1, 1, 1, 1,
-1.793176, 0.1984274, -2.053124, 1, 1, 1, 1, 1,
-1.77943, -1.872617, -2.620932, 1, 1, 1, 1, 1,
-1.755311, 0.03054649, -2.273751, 1, 1, 1, 1, 1,
-1.740367, 2.10907, 1.129286, 1, 1, 1, 1, 1,
-1.736774, -1.762487, -2.259712, 1, 1, 1, 1, 1,
-1.726112, -0.8708938, -2.562697, 1, 1, 1, 1, 1,
-1.713053, 2.430133, -0.4181524, 1, 1, 1, 1, 1,
-1.707276, -0.4078658, -1.369636, 1, 1, 1, 1, 1,
-1.70129, 1.583991, -1.689277, 1, 1, 1, 1, 1,
-1.70035, -0.0164995, -0.7549135, 1, 1, 1, 1, 1,
-1.699783, -0.5510865, -0.1452047, 1, 1, 1, 1, 1,
-1.696305, -0.4871212, -1.988484, 0, 0, 1, 1, 1,
-1.680891, -0.4849108, -2.310656, 1, 0, 0, 1, 1,
-1.679821, -0.9047397, 0.1323433, 1, 0, 0, 1, 1,
-1.669644, 1.30593, -1.705793, 1, 0, 0, 1, 1,
-1.650178, -0.7022338, -2.804197, 1, 0, 0, 1, 1,
-1.639762, 1.408961, 0.8557516, 1, 0, 0, 1, 1,
-1.636795, -0.8859178, -2.584294, 0, 0, 0, 1, 1,
-1.618259, 0.06249166, -2.257679, 0, 0, 0, 1, 1,
-1.59622, -0.9243774, -1.013302, 0, 0, 0, 1, 1,
-1.588169, -0.1501894, -1.489506, 0, 0, 0, 1, 1,
-1.587751, 2.044757, 0.5582937, 0, 0, 0, 1, 1,
-1.584514, 1.088708, -1.724379, 0, 0, 0, 1, 1,
-1.581052, 0.3951956, -2.064354, 0, 0, 0, 1, 1,
-1.570232, 0.1116954, -1.64293, 1, 1, 1, 1, 1,
-1.559176, -0.8892896, -1.412062, 1, 1, 1, 1, 1,
-1.552158, -0.4023585, -0.6211538, 1, 1, 1, 1, 1,
-1.518891, -0.5137908, -3.272303, 1, 1, 1, 1, 1,
-1.518878, -0.6344403, -2.076657, 1, 1, 1, 1, 1,
-1.48271, 0.3302924, -2.598103, 1, 1, 1, 1, 1,
-1.457502, 1.388908, -1.330084, 1, 1, 1, 1, 1,
-1.442813, 0.1073484, -2.102262, 1, 1, 1, 1, 1,
-1.433631, -1.4984, -2.189459, 1, 1, 1, 1, 1,
-1.427703, -1.051072, -1.4269, 1, 1, 1, 1, 1,
-1.426428, -2.941243, -3.801924, 1, 1, 1, 1, 1,
-1.424099, -2.598588, -3.262168, 1, 1, 1, 1, 1,
-1.423047, -0.8376334, -0.8683854, 1, 1, 1, 1, 1,
-1.41748, 0.5662839, -0.7591838, 1, 1, 1, 1, 1,
-1.403614, 1.300604, -0.8759814, 1, 1, 1, 1, 1,
-1.40115, 0.6518688, -1.390073, 0, 0, 1, 1, 1,
-1.397253, 0.9558405, -0.1435149, 1, 0, 0, 1, 1,
-1.393912, -0.01097664, -3.489692, 1, 0, 0, 1, 1,
-1.37912, 0.7984906, -2.770328, 1, 0, 0, 1, 1,
-1.363771, 1.254786, -0.2773042, 1, 0, 0, 1, 1,
-1.347954, -1.107648, -3.255057, 1, 0, 0, 1, 1,
-1.337684, -0.2602506, 0.2574969, 0, 0, 0, 1, 1,
-1.330439, -0.4886056, -1.31069, 0, 0, 0, 1, 1,
-1.329058, 1.032745, 0.003730891, 0, 0, 0, 1, 1,
-1.327615, 0.2771645, -2.194419, 0, 0, 0, 1, 1,
-1.316864, -0.5241038, -1.324683, 0, 0, 0, 1, 1,
-1.312054, -0.2891256, -2.807526, 0, 0, 0, 1, 1,
-1.311707, -0.6322585, -1.969359, 0, 0, 0, 1, 1,
-1.309262, 0.1521996, -2.928523, 1, 1, 1, 1, 1,
-1.306767, -2.255518, -4.506669, 1, 1, 1, 1, 1,
-1.296356, -1.803078, -2.300433, 1, 1, 1, 1, 1,
-1.292762, 1.142394, -1.313391, 1, 1, 1, 1, 1,
-1.292556, -1.277722, -3.310829, 1, 1, 1, 1, 1,
-1.283442, 1.669889, 0.9799178, 1, 1, 1, 1, 1,
-1.268375, -0.5354961, 0.6566787, 1, 1, 1, 1, 1,
-1.262219, -0.6646234, -1.634177, 1, 1, 1, 1, 1,
-1.258059, -0.3000923, -1.633644, 1, 1, 1, 1, 1,
-1.256831, -1.224587, -1.031283, 1, 1, 1, 1, 1,
-1.256528, -2.245485, -0.3001838, 1, 1, 1, 1, 1,
-1.252989, 1.031007, 0.5999351, 1, 1, 1, 1, 1,
-1.251456, 0.5047255, -0.8383014, 1, 1, 1, 1, 1,
-1.246015, -0.8170782, -3.706925, 1, 1, 1, 1, 1,
-1.244233, 1.190325, -1.939016, 1, 1, 1, 1, 1,
-1.236774, 0.2085538, -1.426449, 0, 0, 1, 1, 1,
-1.23586, -0.5678377, -2.729557, 1, 0, 0, 1, 1,
-1.234456, -0.1492236, -1.329892, 1, 0, 0, 1, 1,
-1.209157, -0.7669439, -1.162051, 1, 0, 0, 1, 1,
-1.205964, -0.4337067, -4.093221, 1, 0, 0, 1, 1,
-1.197697, 0.4701156, -0.3810829, 1, 0, 0, 1, 1,
-1.197381, -0.6573449, -4.974276, 0, 0, 0, 1, 1,
-1.193742, 1.199149, 0.02758458, 0, 0, 0, 1, 1,
-1.193465, -0.5278143, -1.189849, 0, 0, 0, 1, 1,
-1.190524, -0.712919, -1.576542, 0, 0, 0, 1, 1,
-1.190209, 1.433619, 0.3115437, 0, 0, 0, 1, 1,
-1.188043, 0.7464866, 0.6965055, 0, 0, 0, 1, 1,
-1.18118, 0.8497169, 1.198428, 0, 0, 0, 1, 1,
-1.176337, -0.787232, -1.642128, 1, 1, 1, 1, 1,
-1.174545, -1.617937, -3.109278, 1, 1, 1, 1, 1,
-1.171164, -0.5876639, -1.321344, 1, 1, 1, 1, 1,
-1.170369, 0.8553178, -0.1419342, 1, 1, 1, 1, 1,
-1.16562, 2.0597, -0.5600671, 1, 1, 1, 1, 1,
-1.164887, 0.6595008, -0.2444226, 1, 1, 1, 1, 1,
-1.153985, 0.1289672, -0.6661633, 1, 1, 1, 1, 1,
-1.132918, -2.787807, -1.471488, 1, 1, 1, 1, 1,
-1.125136, 0.0786471, -1.116457, 1, 1, 1, 1, 1,
-1.125059, 0.2036963, -2.37499, 1, 1, 1, 1, 1,
-1.117963, 0.1124723, -1.186444, 1, 1, 1, 1, 1,
-1.113214, -1.195709, -0.4700926, 1, 1, 1, 1, 1,
-1.10682, 0.7470253, -1.64307, 1, 1, 1, 1, 1,
-1.102499, 0.4189121, -3.756337, 1, 1, 1, 1, 1,
-1.087702, 1.045116, -1.233409, 1, 1, 1, 1, 1,
-1.083791, 0.02894135, -2.105102, 0, 0, 1, 1, 1,
-1.080248, 0.5717611, -0.7104285, 1, 0, 0, 1, 1,
-1.074617, 0.5282973, -2.369626, 1, 0, 0, 1, 1,
-1.070866, -0.5899716, -2.767095, 1, 0, 0, 1, 1,
-1.069625, -1.106927, -1.854918, 1, 0, 0, 1, 1,
-1.062568, -1.209999, -3.22314, 1, 0, 0, 1, 1,
-1.058971, 0.3926926, -0.7479545, 0, 0, 0, 1, 1,
-1.055656, -1.060508, -3.245899, 0, 0, 0, 1, 1,
-1.050676, 0.7697816, -1.830161, 0, 0, 0, 1, 1,
-1.040714, -1.285191, -2.349012, 0, 0, 0, 1, 1,
-1.036569, 0.6899797, -0.9347866, 0, 0, 0, 1, 1,
-1.027547, -0.2931212, -3.340387, 0, 0, 0, 1, 1,
-1.018798, -1.481135, -1.396006, 0, 0, 0, 1, 1,
-1.015313, -0.08410889, -2.180835, 1, 1, 1, 1, 1,
-1.010633, 0.1036005, -1.637394, 1, 1, 1, 1, 1,
-1.010421, 1.321909, -2.601861, 1, 1, 1, 1, 1,
-1.009491, 0.2427486, -0.03947522, 1, 1, 1, 1, 1,
-1.004403, -1.517522, -3.086905, 1, 1, 1, 1, 1,
-1.003564, -1.525851, -2.553653, 1, 1, 1, 1, 1,
-1.000346, -0.3468075, -2.669718, 1, 1, 1, 1, 1,
-0.9989248, -0.2252557, -0.9968432, 1, 1, 1, 1, 1,
-0.9824088, -0.2674057, -2.05149, 1, 1, 1, 1, 1,
-0.9754996, -0.411856, -1.292382, 1, 1, 1, 1, 1,
-0.9697422, -0.594, -2.641672, 1, 1, 1, 1, 1,
-0.9660943, -0.6012346, -1.663301, 1, 1, 1, 1, 1,
-0.9593509, -0.1139017, -2.445688, 1, 1, 1, 1, 1,
-0.9484563, -1.044499, -1.585181, 1, 1, 1, 1, 1,
-0.9451984, -0.4828796, -1.454584, 1, 1, 1, 1, 1,
-0.9444928, 0.0874819, -3.884802, 0, 0, 1, 1, 1,
-0.942646, 0.5110594, -0.9230404, 1, 0, 0, 1, 1,
-0.9379104, 0.3864226, -0.8017673, 1, 0, 0, 1, 1,
-0.9357911, -0.5830001, -2.222405, 1, 0, 0, 1, 1,
-0.9314508, 0.2512653, -0.7363009, 1, 0, 0, 1, 1,
-0.9292051, 0.04027772, -1.109086, 1, 0, 0, 1, 1,
-0.927246, -1.017197, -4.026618, 0, 0, 0, 1, 1,
-0.9231523, 1.656287, -0.318568, 0, 0, 0, 1, 1,
-0.9109526, 1.304834, -1.177217, 0, 0, 0, 1, 1,
-0.9107, 0.959112, -2.331677, 0, 0, 0, 1, 1,
-0.9077849, -0.171421, -0.8290011, 0, 0, 0, 1, 1,
-0.9060001, 0.2389511, -1.932528, 0, 0, 0, 1, 1,
-0.9004419, 0.181479, -0.9226296, 0, 0, 0, 1, 1,
-0.8993905, 1.556349, -1.558251, 1, 1, 1, 1, 1,
-0.8987284, 1.005965, -0.726037, 1, 1, 1, 1, 1,
-0.8938176, -1.834683, -0.1217774, 1, 1, 1, 1, 1,
-0.8905419, 1.460217, -0.0478364, 1, 1, 1, 1, 1,
-0.8825147, 1.605834, -0.4356561, 1, 1, 1, 1, 1,
-0.882129, 0.1600564, -2.227808, 1, 1, 1, 1, 1,
-0.8766577, -1.263328, -2.330862, 1, 1, 1, 1, 1,
-0.8754918, -0.2299748, -2.25452, 1, 1, 1, 1, 1,
-0.8635283, 0.5312244, -2.200293, 1, 1, 1, 1, 1,
-0.8603342, -0.947844, -2.294108, 1, 1, 1, 1, 1,
-0.8572315, -0.8158023, -2.758348, 1, 1, 1, 1, 1,
-0.8542616, 0.6452121, -0.3990495, 1, 1, 1, 1, 1,
-0.8517027, 0.03592116, -2.63432, 1, 1, 1, 1, 1,
-0.8513473, 2.769019, 0.5184311, 1, 1, 1, 1, 1,
-0.8487448, 0.4182466, -0.05124144, 1, 1, 1, 1, 1,
-0.8463516, -2.339318, -2.367871, 0, 0, 1, 1, 1,
-0.8440859, 1.862651, 0.8238274, 1, 0, 0, 1, 1,
-0.8431968, -0.8180082, -3.52916, 1, 0, 0, 1, 1,
-0.8366467, -0.8855389, -1.78972, 1, 0, 0, 1, 1,
-0.8302775, -1.555255, -2.27584, 1, 0, 0, 1, 1,
-0.8279805, 0.07757293, -0.02338755, 1, 0, 0, 1, 1,
-0.8251609, -0.432776, -2.466048, 0, 0, 0, 1, 1,
-0.8225225, -1.750589, -2.537891, 0, 0, 0, 1, 1,
-0.8188308, -1.739045, -3.867546, 0, 0, 0, 1, 1,
-0.8069409, -0.5110001, -2.243122, 0, 0, 0, 1, 1,
-0.8039482, 0.3872353, -1.101935, 0, 0, 0, 1, 1,
-0.8037428, 1.174809, 0.244433, 0, 0, 0, 1, 1,
-0.8006942, -1.102803, -2.029489, 0, 0, 0, 1, 1,
-0.7989455, -0.192041, -1.31254, 1, 1, 1, 1, 1,
-0.7981873, -1.038497, -2.307594, 1, 1, 1, 1, 1,
-0.7881226, -0.5963495, -1.364568, 1, 1, 1, 1, 1,
-0.7824687, -0.747546, -3.062181, 1, 1, 1, 1, 1,
-0.7775741, -0.4478471, -1.029725, 1, 1, 1, 1, 1,
-0.773506, 0.424547, 0.02340995, 1, 1, 1, 1, 1,
-0.7697341, -0.00506196, -2.288209, 1, 1, 1, 1, 1,
-0.7683475, -0.4172309, -1.762359, 1, 1, 1, 1, 1,
-0.7665873, 0.5504989, -0.7237162, 1, 1, 1, 1, 1,
-0.7614099, -0.4324177, -2.530254, 1, 1, 1, 1, 1,
-0.7600181, 1.157657, -1.787611, 1, 1, 1, 1, 1,
-0.7580925, -1.014289, -3.135492, 1, 1, 1, 1, 1,
-0.7571906, -0.9853854, -2.39071, 1, 1, 1, 1, 1,
-0.7561112, -0.2790583, -1.353361, 1, 1, 1, 1, 1,
-0.754409, 0.324441, -0.308955, 1, 1, 1, 1, 1,
-0.751087, 1.314157, 1.060738, 0, 0, 1, 1, 1,
-0.751074, -0.5528018, -2.496664, 1, 0, 0, 1, 1,
-0.7436244, 0.428459, -0.4224279, 1, 0, 0, 1, 1,
-0.7409799, -0.3158193, -2.285698, 1, 0, 0, 1, 1,
-0.7356532, -1.411888, -2.932943, 1, 0, 0, 1, 1,
-0.732494, -0.686633, -1.467222, 1, 0, 0, 1, 1,
-0.7293468, 0.2703096, -1.814164, 0, 0, 0, 1, 1,
-0.7278405, -0.2940318, -0.8150886, 0, 0, 0, 1, 1,
-0.7217208, -0.880952, -2.132508, 0, 0, 0, 1, 1,
-0.7127141, 0.1328205, -1.588559, 0, 0, 0, 1, 1,
-0.7126676, -0.2931281, -1.677317, 0, 0, 0, 1, 1,
-0.7108421, -1.747768, -2.940948, 0, 0, 0, 1, 1,
-0.7087467, 1.46064, -0.3456367, 0, 0, 0, 1, 1,
-0.7017128, 0.4749825, -2.467911, 1, 1, 1, 1, 1,
-0.6953631, 0.1713783, -2.389424, 1, 1, 1, 1, 1,
-0.686789, -0.09102676, -0.5740644, 1, 1, 1, 1, 1,
-0.6823398, 1.449652, -1.956511, 1, 1, 1, 1, 1,
-0.681159, -0.3741333, -1.203163, 1, 1, 1, 1, 1,
-0.680142, 1.679351, -1.12892, 1, 1, 1, 1, 1,
-0.676142, -0.7614345, -0.4030672, 1, 1, 1, 1, 1,
-0.6761111, 0.4638909, -1.181836, 1, 1, 1, 1, 1,
-0.6688783, -0.1127992, -2.171813, 1, 1, 1, 1, 1,
-0.6667125, -0.2052527, -1.128746, 1, 1, 1, 1, 1,
-0.6663433, -0.3049026, -1.780795, 1, 1, 1, 1, 1,
-0.6569833, 0.8569183, -1.464993, 1, 1, 1, 1, 1,
-0.653263, 2.11272, -1.047865, 1, 1, 1, 1, 1,
-0.6477709, -0.3115441, -2.293767, 1, 1, 1, 1, 1,
-0.6409616, -0.03874245, -0.7323514, 1, 1, 1, 1, 1,
-0.6405331, -1.738974, -3.694518, 0, 0, 1, 1, 1,
-0.6400287, -1.914353, -1.754547, 1, 0, 0, 1, 1,
-0.6399522, 0.1350252, -2.123471, 1, 0, 0, 1, 1,
-0.6341572, -0.7692259, -1.684303, 1, 0, 0, 1, 1,
-0.6279314, -1.345581, -2.439951, 1, 0, 0, 1, 1,
-0.6251933, -0.4397822, 0.5525085, 1, 0, 0, 1, 1,
-0.6236621, 1.091734, 0.2727104, 0, 0, 0, 1, 1,
-0.6230599, -1.021829, -4.284742, 0, 0, 0, 1, 1,
-0.6229082, 0.04476167, -2.086438, 0, 0, 0, 1, 1,
-0.6184138, 0.1249389, -0.9234596, 0, 0, 0, 1, 1,
-0.6174453, 0.09309195, -1.720899, 0, 0, 0, 1, 1,
-0.6158998, -1.040346, -1.645923, 0, 0, 0, 1, 1,
-0.6153382, 1.000865, -0.3783134, 0, 0, 0, 1, 1,
-0.6096308, 1.860078, -0.180941, 1, 1, 1, 1, 1,
-0.6069446, 0.06287711, -3.420531, 1, 1, 1, 1, 1,
-0.6060771, -0.2046458, -1.408426, 1, 1, 1, 1, 1,
-0.6008325, 1.530531, -0.5509689, 1, 1, 1, 1, 1,
-0.5988505, 0.139288, 0.135269, 1, 1, 1, 1, 1,
-0.5984304, -1.935282, -2.710562, 1, 1, 1, 1, 1,
-0.5968514, -1.781094, -2.448105, 1, 1, 1, 1, 1,
-0.5926966, 0.03096638, -1.811399, 1, 1, 1, 1, 1,
-0.5913643, 0.7753611, -2.568658, 1, 1, 1, 1, 1,
-0.590984, -0.4709726, -1.933522, 1, 1, 1, 1, 1,
-0.5896215, -0.8454622, -2.330248, 1, 1, 1, 1, 1,
-0.5889133, -1.005515, -3.688046, 1, 1, 1, 1, 1,
-0.5863513, 1.379956, 0.5387185, 1, 1, 1, 1, 1,
-0.5835314, -0.4030007, -1.385377, 1, 1, 1, 1, 1,
-0.5813721, -1.140423, -3.555478, 1, 1, 1, 1, 1,
-0.5792402, 0.1398798, -1.726093, 0, 0, 1, 1, 1,
-0.5790032, 0.5592799, 0.2251114, 1, 0, 0, 1, 1,
-0.5782531, -1.622155, -3.357408, 1, 0, 0, 1, 1,
-0.5747375, 0.4940496, -1.503738, 1, 0, 0, 1, 1,
-0.5733132, -0.1780822, -0.564795, 1, 0, 0, 1, 1,
-0.5682929, 1.966557, -0.993233, 1, 0, 0, 1, 1,
-0.5651941, -0.6048586, -1.003927, 0, 0, 0, 1, 1,
-0.5646781, -0.6394479, -4.162132, 0, 0, 0, 1, 1,
-0.554983, -1.768208, -3.864964, 0, 0, 0, 1, 1,
-0.5536089, 0.8087961, -1.970244, 0, 0, 0, 1, 1,
-0.5490922, 0.03443046, -2.31312, 0, 0, 0, 1, 1,
-0.5488144, 0.1896384, -2.579729, 0, 0, 0, 1, 1,
-0.5484563, 1.957739, 0.2439487, 0, 0, 0, 1, 1,
-0.5427687, 1.991563, 0.01090518, 1, 1, 1, 1, 1,
-0.5391538, -1.387678, -3.33408, 1, 1, 1, 1, 1,
-0.5377089, -1.221379, -0.9708025, 1, 1, 1, 1, 1,
-0.5347902, 2.038341, -0.3012722, 1, 1, 1, 1, 1,
-0.5326654, -1.386994, -2.972194, 1, 1, 1, 1, 1,
-0.531226, 1.142236, -0.02170722, 1, 1, 1, 1, 1,
-0.5302093, 0.09070072, -0.6946241, 1, 1, 1, 1, 1,
-0.5279911, 2.339425, -2.513767, 1, 1, 1, 1, 1,
-0.5273649, -0.2407623, -2.423775, 1, 1, 1, 1, 1,
-0.5264867, 1.236098, -0.02004336, 1, 1, 1, 1, 1,
-0.5241462, -0.5290076, -1.597005, 1, 1, 1, 1, 1,
-0.5147349, -0.6349785, -2.741266, 1, 1, 1, 1, 1,
-0.5147148, -0.3789206, -2.140945, 1, 1, 1, 1, 1,
-0.514492, -1.221914, -2.304174, 1, 1, 1, 1, 1,
-0.5093212, -0.7772025, -1.323183, 1, 1, 1, 1, 1,
-0.5077212, -0.9075585, -2.74352, 0, 0, 1, 1, 1,
-0.5062639, 1.363514, 2.428856, 1, 0, 0, 1, 1,
-0.5039119, 1.141403, -0.2500343, 1, 0, 0, 1, 1,
-0.4971206, 2.002575, 0.2854229, 1, 0, 0, 1, 1,
-0.489604, 0.6410652, 0.2883021, 1, 0, 0, 1, 1,
-0.4876956, 0.4435325, -2.019716, 1, 0, 0, 1, 1,
-0.4856401, 1.096852, -1.444526, 0, 0, 0, 1, 1,
-0.4830859, 1.040165, -1.491976, 0, 0, 0, 1, 1,
-0.4826958, 1.740096, -1.453973, 0, 0, 0, 1, 1,
-0.4797347, -1.25981, -0.9744902, 0, 0, 0, 1, 1,
-0.4787374, 0.431486, -1.345092, 0, 0, 0, 1, 1,
-0.4779807, -0.1023893, -1.22504, 0, 0, 0, 1, 1,
-0.4749212, 0.1386042, -1.834199, 0, 0, 0, 1, 1,
-0.474701, 0.04203363, -2.361293, 1, 1, 1, 1, 1,
-0.468825, -0.4675278, -2.666395, 1, 1, 1, 1, 1,
-0.4664044, -0.7100142, -2.139417, 1, 1, 1, 1, 1,
-0.4636146, -0.999815, -3.089524, 1, 1, 1, 1, 1,
-0.4582494, 0.687315, -1.165942, 1, 1, 1, 1, 1,
-0.4580252, 0.5726776, -0.02367201, 1, 1, 1, 1, 1,
-0.457314, -1.288718, -2.673109, 1, 1, 1, 1, 1,
-0.45432, 0.6946263, 0.2866687, 1, 1, 1, 1, 1,
-0.4484652, -0.2579741, -3.011659, 1, 1, 1, 1, 1,
-0.4483545, -1.455666, -2.640307, 1, 1, 1, 1, 1,
-0.4477498, -1.583222, -2.327269, 1, 1, 1, 1, 1,
-0.4470416, -1.462966, -2.710513, 1, 1, 1, 1, 1,
-0.4455224, 0.466852, -2.036552, 1, 1, 1, 1, 1,
-0.4441032, -0.638692, -4.135304, 1, 1, 1, 1, 1,
-0.4421879, 0.4678579, -0.1094453, 1, 1, 1, 1, 1,
-0.4409407, 0.6546005, 0.8911763, 0, 0, 1, 1, 1,
-0.4396508, 2.773374, -0.3745502, 1, 0, 0, 1, 1,
-0.4282131, 2.546913, 0.3673946, 1, 0, 0, 1, 1,
-0.4253834, -0.535887, -1.612832, 1, 0, 0, 1, 1,
-0.4213648, -2.410309, -3.508924, 1, 0, 0, 1, 1,
-0.4189357, -1.430781, -3.358526, 1, 0, 0, 1, 1,
-0.4171095, -2.395844, -2.650405, 0, 0, 0, 1, 1,
-0.4104863, -0.2462807, -2.152076, 0, 0, 0, 1, 1,
-0.4095063, -0.3378597, -1.196056, 0, 0, 0, 1, 1,
-0.4007899, 0.3367975, -1.735449, 0, 0, 0, 1, 1,
-0.3956425, 0.07618174, -2.050982, 0, 0, 0, 1, 1,
-0.393814, -0.7208332, -2.005095, 0, 0, 0, 1, 1,
-0.3937771, -0.7026228, -0.1829525, 0, 0, 0, 1, 1,
-0.3919401, 1.156607, -0.6917588, 1, 1, 1, 1, 1,
-0.3895288, 0.3547961, -2.016854, 1, 1, 1, 1, 1,
-0.3838236, 1.112708, 0.9942575, 1, 1, 1, 1, 1,
-0.3816909, 1.790829, -1.370343, 1, 1, 1, 1, 1,
-0.3794789, -1.182804, -3.753857, 1, 1, 1, 1, 1,
-0.3776703, 0.6597209, -1.923291, 1, 1, 1, 1, 1,
-0.3769712, 0.2770202, 0.1944105, 1, 1, 1, 1, 1,
-0.3769172, -2.37483, -2.705638, 1, 1, 1, 1, 1,
-0.3762619, -0.1610549, -1.632187, 1, 1, 1, 1, 1,
-0.3699803, 0.5898413, -0.355799, 1, 1, 1, 1, 1,
-0.3691732, 0.1324151, -1.606738, 1, 1, 1, 1, 1,
-0.3684174, -0.1991561, -0.02945167, 1, 1, 1, 1, 1,
-0.3681419, -0.1383401, -0.9732026, 1, 1, 1, 1, 1,
-0.3663309, 1.00539, -0.7157483, 1, 1, 1, 1, 1,
-0.3662058, -1.529377, -3.010131, 1, 1, 1, 1, 1,
-0.3588237, 0.8410891, 0.8692709, 0, 0, 1, 1, 1,
-0.3583836, -0.8635637, -2.382341, 1, 0, 0, 1, 1,
-0.3581198, 2.299032, -1.185868, 1, 0, 0, 1, 1,
-0.3570895, 0.6662294, -1.509368, 1, 0, 0, 1, 1,
-0.3569095, -0.9771541, -1.919979, 1, 0, 0, 1, 1,
-0.3567936, 2.199931, 0.4673477, 1, 0, 0, 1, 1,
-0.353209, -1.101964, -4.839857, 0, 0, 0, 1, 1,
-0.3514616, 0.7141356, 0.08612902, 0, 0, 0, 1, 1,
-0.346736, 0.2702105, -1.239216, 0, 0, 0, 1, 1,
-0.3461888, -0.5208713, -1.377226, 0, 0, 0, 1, 1,
-0.345951, 2.256177, 1.491945, 0, 0, 0, 1, 1,
-0.3449215, -2.382674, -2.754719, 0, 0, 0, 1, 1,
-0.3402224, -1.637995, -0.8817301, 0, 0, 0, 1, 1,
-0.3378576, -0.176803, -0.8461742, 1, 1, 1, 1, 1,
-0.3356586, -0.1119998, -2.365916, 1, 1, 1, 1, 1,
-0.3304321, 0.9548327, 0.8328946, 1, 1, 1, 1, 1,
-0.3296392, 1.227496, 0.3468496, 1, 1, 1, 1, 1,
-0.3259524, -1.936866, -3.039214, 1, 1, 1, 1, 1,
-0.32579, 1.933511, 0.03477025, 1, 1, 1, 1, 1,
-0.319714, 0.1268936, 0.7829074, 1, 1, 1, 1, 1,
-0.318934, -0.3523931, -1.264874, 1, 1, 1, 1, 1,
-0.3115523, -0.4918065, -2.476292, 1, 1, 1, 1, 1,
-0.3055544, 1.0651, 0.1611488, 1, 1, 1, 1, 1,
-0.2970904, 1.857852, 0.5282865, 1, 1, 1, 1, 1,
-0.2956432, 1.345805, -0.1320136, 1, 1, 1, 1, 1,
-0.2935752, -2.555795, -2.482837, 1, 1, 1, 1, 1,
-0.2895438, -0.5314704, -3.221904, 1, 1, 1, 1, 1,
-0.2890828, 1.236814, -1.182242, 1, 1, 1, 1, 1,
-0.2879415, 2.557815, -2.20809, 0, 0, 1, 1, 1,
-0.285965, -0.05635943, -0.365534, 1, 0, 0, 1, 1,
-0.2817393, 0.7308385, 0.1043636, 1, 0, 0, 1, 1,
-0.2760132, -0.3368882, -1.901047, 1, 0, 0, 1, 1,
-0.2743448, 1.170652, -2.450171, 1, 0, 0, 1, 1,
-0.2718188, -1.387079, -3.624275, 1, 0, 0, 1, 1,
-0.2717409, 1.228812, 1.693326, 0, 0, 0, 1, 1,
-0.2680777, -0.08976954, -2.505903, 0, 0, 0, 1, 1,
-0.2669402, -0.9218085, -1.370902, 0, 0, 0, 1, 1,
-0.2648832, 0.3721793, 0.9921903, 0, 0, 0, 1, 1,
-0.2640694, -0.897472, -1.648018, 0, 0, 0, 1, 1,
-0.2628561, 1.363105, 0.8656359, 0, 0, 0, 1, 1,
-0.2615433, -0.8932542, -2.555846, 0, 0, 0, 1, 1,
-0.2606882, 1.032804, 0.05962683, 1, 1, 1, 1, 1,
-0.2553898, -0.08433672, -0.3742414, 1, 1, 1, 1, 1,
-0.2550218, -1.374702, -4.461523, 1, 1, 1, 1, 1,
-0.2510156, -0.6503526, -1.784001, 1, 1, 1, 1, 1,
-0.2503539, 0.1975994, -0.2413486, 1, 1, 1, 1, 1,
-0.2494458, -0.3455467, -3.411265, 1, 1, 1, 1, 1,
-0.2493461, -0.1819602, -2.806115, 1, 1, 1, 1, 1,
-0.2491552, 1.117278, -0.8919811, 1, 1, 1, 1, 1,
-0.2486178, 1.593177, 0.2911848, 1, 1, 1, 1, 1,
-0.2468018, -3.638666, -3.410545, 1, 1, 1, 1, 1,
-0.2441198, 0.6406923, 1.293168, 1, 1, 1, 1, 1,
-0.2404741, 0.2682008, 0.6570061, 1, 1, 1, 1, 1,
-0.237461, -0.5193901, -5.384789, 1, 1, 1, 1, 1,
-0.2242313, -0.6285397, -3.825516, 1, 1, 1, 1, 1,
-0.2235974, 1.287752, -1.270339, 1, 1, 1, 1, 1,
-0.2230799, -1.618226, -1.917563, 0, 0, 1, 1, 1,
-0.2225817, -0.1702209, -0.3839568, 1, 0, 0, 1, 1,
-0.2204302, 0.198759, -0.5382541, 1, 0, 0, 1, 1,
-0.2198087, -0.2440709, -3.294389, 1, 0, 0, 1, 1,
-0.2178459, -0.4497731, -2.403581, 1, 0, 0, 1, 1,
-0.21057, -0.8162177, -2.990123, 1, 0, 0, 1, 1,
-0.2061832, -0.5089664, -1.481522, 0, 0, 0, 1, 1,
-0.2051111, 1.19269, 1.264006, 0, 0, 0, 1, 1,
-0.2049904, 1.015293, 0.008247216, 0, 0, 0, 1, 1,
-0.1982843, 0.1383853, -0.5354325, 0, 0, 0, 1, 1,
-0.1973939, 2.302083, 1.527176, 0, 0, 0, 1, 1,
-0.1947988, 0.3274689, -1.54581, 0, 0, 0, 1, 1,
-0.1943065, -0.1501896, -2.694698, 0, 0, 0, 1, 1,
-0.1870261, -0.7941297, -2.911621, 1, 1, 1, 1, 1,
-0.1861068, 0.7206682, -1.395805, 1, 1, 1, 1, 1,
-0.1843256, 1.326496, -1.095225, 1, 1, 1, 1, 1,
-0.1819277, 0.7188656, -2.716645, 1, 1, 1, 1, 1,
-0.1815086, 0.4823552, 2.096882, 1, 1, 1, 1, 1,
-0.1811227, 1.200605, 0.2328408, 1, 1, 1, 1, 1,
-0.1808547, -1.208954, -3.437673, 1, 1, 1, 1, 1,
-0.179152, -0.5404603, -3.23614, 1, 1, 1, 1, 1,
-0.1764186, 0.3066067, -0.2143844, 1, 1, 1, 1, 1,
-0.1676454, 0.5712832, 0.832874, 1, 1, 1, 1, 1,
-0.1666736, 0.7332246, -0.264677, 1, 1, 1, 1, 1,
-0.1657321, 0.03803171, -2.546067, 1, 1, 1, 1, 1,
-0.1617577, -0.1104962, -1.452738, 1, 1, 1, 1, 1,
-0.1607091, -0.6311869, -4.912461, 1, 1, 1, 1, 1,
-0.1570034, 0.3311339, -1.349031, 1, 1, 1, 1, 1,
-0.1565217, -0.1360188, -0.6065817, 0, 0, 1, 1, 1,
-0.1563794, -1.015707, -3.959587, 1, 0, 0, 1, 1,
-0.1562032, 1.942773, -0.3471095, 1, 0, 0, 1, 1,
-0.155995, -0.8138384, -2.348795, 1, 0, 0, 1, 1,
-0.1538389, 0.5877009, -0.9591959, 1, 0, 0, 1, 1,
-0.149039, -0.9026324, -3.318162, 1, 0, 0, 1, 1,
-0.144891, 0.8603748, 0.6618824, 0, 0, 0, 1, 1,
-0.1439521, -0.2686322, -3.20971, 0, 0, 0, 1, 1,
-0.139773, -0.2370007, -1.990403, 0, 0, 0, 1, 1,
-0.1388424, -0.1038458, -4.57166, 0, 0, 0, 1, 1,
-0.1379372, -0.2697412, -1.341829, 0, 0, 0, 1, 1,
-0.1323538, -0.9629627, -3.053499, 0, 0, 0, 1, 1,
-0.125772, 1.073528, 0.1105768, 0, 0, 0, 1, 1,
-0.1221013, 0.5895131, 1.138418, 1, 1, 1, 1, 1,
-0.1179625, 0.2100396, 0.7420939, 1, 1, 1, 1, 1,
-0.1150362, 0.5864791, -0.6220014, 1, 1, 1, 1, 1,
-0.110649, 0.3757498, 1.000034, 1, 1, 1, 1, 1,
-0.1104207, -1.114891, -2.690852, 1, 1, 1, 1, 1,
-0.1079814, 0.1610975, -1.842991, 1, 1, 1, 1, 1,
-0.1072913, 0.108661, 1.699147, 1, 1, 1, 1, 1,
-0.1035249, 0.6183858, 0.120642, 1, 1, 1, 1, 1,
-0.1025792, -0.6282423, -2.96488, 1, 1, 1, 1, 1,
-0.1024687, -1.534012, -3.618021, 1, 1, 1, 1, 1,
-0.1019876, 1.185439, -2.344536, 1, 1, 1, 1, 1,
-0.1014552, 1.661949, -0.1805609, 1, 1, 1, 1, 1,
-0.09673055, -0.2248375, -2.411147, 1, 1, 1, 1, 1,
-0.09372389, -1.358824, -2.037083, 1, 1, 1, 1, 1,
-0.09148909, 0.3394732, -0.7801202, 1, 1, 1, 1, 1,
-0.09142355, 0.5671626, -1.151816, 0, 0, 1, 1, 1,
-0.08388522, -0.444815, -2.383472, 1, 0, 0, 1, 1,
-0.07987887, -0.1966426, -2.360718, 1, 0, 0, 1, 1,
-0.07567454, -0.07810263, -1.846122, 1, 0, 0, 1, 1,
-0.07540856, -1.006063, -3.395777, 1, 0, 0, 1, 1,
-0.07485684, -0.6309859, -2.872355, 1, 0, 0, 1, 1,
-0.07315527, 0.3787357, -0.2454463, 0, 0, 0, 1, 1,
-0.07268853, -2.369462, -3.643807, 0, 0, 0, 1, 1,
-0.07160881, -0.4236259, -2.346104, 0, 0, 0, 1, 1,
-0.07006184, -0.5529458, -0.7192932, 0, 0, 0, 1, 1,
-0.06906172, 0.9274148, 1.100011, 0, 0, 0, 1, 1,
-0.06794073, -0.2718945, -2.814937, 0, 0, 0, 1, 1,
-0.06405623, -2.777579, -3.543758, 0, 0, 0, 1, 1,
-0.0601273, 0.7897543, 0.4325672, 1, 1, 1, 1, 1,
-0.05946599, 0.08625209, -1.172043, 1, 1, 1, 1, 1,
-0.05722641, -1.667414, -0.4624002, 1, 1, 1, 1, 1,
-0.05665385, 1.109374, -1.119578, 1, 1, 1, 1, 1,
-0.05314796, 2.244337, -0.123662, 1, 1, 1, 1, 1,
-0.05268889, -1.557758, -2.905694, 1, 1, 1, 1, 1,
-0.05230502, -2.216092, -2.062515, 1, 1, 1, 1, 1,
-0.05186716, -1.196554, -0.9799247, 1, 1, 1, 1, 1,
-0.05072268, 0.329513, 1.889289, 1, 1, 1, 1, 1,
-0.0430896, 0.5895222, 0.1715093, 1, 1, 1, 1, 1,
-0.04185323, 0.7372426, -0.5987713, 1, 1, 1, 1, 1,
-0.02980557, -0.4889217, -1.339686, 1, 1, 1, 1, 1,
-0.02642793, 0.5971038, -0.3102643, 1, 1, 1, 1, 1,
-0.02580604, 0.1877284, -1.074775, 1, 1, 1, 1, 1,
-0.02382131, 0.5982248, -0.5985479, 1, 1, 1, 1, 1,
-0.01624638, -2.019798, -3.237505, 0, 0, 1, 1, 1,
-0.01336715, -0.4665447, -3.327058, 1, 0, 0, 1, 1,
-0.00775808, -1.896277, -4.63381, 1, 0, 0, 1, 1,
-0.005240543, 1.166452, 0.6774166, 1, 0, 0, 1, 1,
-0.003860855, 1.159793, -1.088363, 1, 0, 0, 1, 1,
0.001094089, 2.632598, -0.8237981, 1, 0, 0, 1, 1,
0.001485609, 0.9851353, 2.39067, 0, 0, 0, 1, 1,
0.008403665, 0.2574144, 0.4690184, 0, 0, 0, 1, 1,
0.01575223, 0.08972127, -0.2639147, 0, 0, 0, 1, 1,
0.01819447, 0.7150989, -1.747958, 0, 0, 0, 1, 1,
0.01842478, -0.9879513, 4.444383, 0, 0, 0, 1, 1,
0.01959195, 2.611356, 0.9017311, 0, 0, 0, 1, 1,
0.01999416, -1.444066, 3.156953, 0, 0, 0, 1, 1,
0.02309619, 0.07359712, 1.364549, 1, 1, 1, 1, 1,
0.02455407, -0.3333513, 3.382388, 1, 1, 1, 1, 1,
0.02513108, -0.358902, 3.37984, 1, 1, 1, 1, 1,
0.02521388, 0.3362917, -0.4831613, 1, 1, 1, 1, 1,
0.02993468, 1.399328, -0.07015676, 1, 1, 1, 1, 1,
0.03587371, -0.7099733, 4.698659, 1, 1, 1, 1, 1,
0.03788224, 2.373627, 0.3128065, 1, 1, 1, 1, 1,
0.04202411, 0.4500666, 0.3354697, 1, 1, 1, 1, 1,
0.04430977, 0.3183376, 0.9473419, 1, 1, 1, 1, 1,
0.04701587, -0.1988925, 2.456511, 1, 1, 1, 1, 1,
0.05806083, -0.3136819, 4.179369, 1, 1, 1, 1, 1,
0.06197883, -0.4050262, 1.683205, 1, 1, 1, 1, 1,
0.06221912, 0.1384303, -0.4943536, 1, 1, 1, 1, 1,
0.06720329, 2.277732, 2.391643, 1, 1, 1, 1, 1,
0.07079925, 0.08555604, -0.09503257, 1, 1, 1, 1, 1,
0.072334, 0.6563487, 0.9186069, 0, 0, 1, 1, 1,
0.07489917, 0.2995169, 1.048659, 1, 0, 0, 1, 1,
0.07801592, -0.7290089, 3.647836, 1, 0, 0, 1, 1,
0.0814834, -1.459357, 2.476167, 1, 0, 0, 1, 1,
0.08455965, 0.4331762, -0.6655478, 1, 0, 0, 1, 1,
0.09121522, 0.758494, -0.4893388, 1, 0, 0, 1, 1,
0.09230861, 0.02688749, -0.1525057, 0, 0, 0, 1, 1,
0.09322846, 0.2056126, 0.1988942, 0, 0, 0, 1, 1,
0.09337401, 1.059295, 0.6302862, 0, 0, 0, 1, 1,
0.1029274, -1.010267, 4.795682, 0, 0, 0, 1, 1,
0.1070294, 0.4891982, 0.02540952, 0, 0, 0, 1, 1,
0.1127727, -0.3438026, 5.064039, 0, 0, 0, 1, 1,
0.114425, 1.42173, -0.6335051, 0, 0, 0, 1, 1,
0.1186055, 0.06365635, 0.7461, 1, 1, 1, 1, 1,
0.1188978, -0.656705, 3.393697, 1, 1, 1, 1, 1,
0.1237192, 0.2194273, 0.6342939, 1, 1, 1, 1, 1,
0.1258824, 1.103132, -1.234896, 1, 1, 1, 1, 1,
0.1280321, 1.733755, 2.169379, 1, 1, 1, 1, 1,
0.1303387, 0.4197607, 1.397206, 1, 1, 1, 1, 1,
0.1329665, -0.3137898, 1.66767, 1, 1, 1, 1, 1,
0.1366298, -0.9919875, 2.910299, 1, 1, 1, 1, 1,
0.1377879, 1.570323, 0.576101, 1, 1, 1, 1, 1,
0.1415613, 0.3611724, -0.8334264, 1, 1, 1, 1, 1,
0.1451321, 1.138556, 0.08525836, 1, 1, 1, 1, 1,
0.1455567, 0.3266437, -0.3922553, 1, 1, 1, 1, 1,
0.1462337, 1.064151, 1.195303, 1, 1, 1, 1, 1,
0.1530012, -0.6466082, 1.53319, 1, 1, 1, 1, 1,
0.1535955, -0.1046949, 1.959309, 1, 1, 1, 1, 1,
0.1545714, 0.789604, 0.6674435, 0, 0, 1, 1, 1,
0.1549753, -1.182381, 3.181342, 1, 0, 0, 1, 1,
0.1569541, 0.01229421, 1.235938, 1, 0, 0, 1, 1,
0.1690239, -0.06955653, 1.146912, 1, 0, 0, 1, 1,
0.1767322, 1.521616, -0.1954101, 1, 0, 0, 1, 1,
0.1768276, -0.5371835, 1.637673, 1, 0, 0, 1, 1,
0.1793529, -1.831112, 2.495479, 0, 0, 0, 1, 1,
0.1835135, -0.4903089, 3.554024, 0, 0, 0, 1, 1,
0.1886649, -0.2908995, 3.998345, 0, 0, 0, 1, 1,
0.1891622, 1.906313, 0.9746706, 0, 0, 0, 1, 1,
0.1910613, 0.000111004, 1.523224, 0, 0, 0, 1, 1,
0.1961108, -0.7687421, 4.277751, 0, 0, 0, 1, 1,
0.198478, -0.9746318, 3.199259, 0, 0, 0, 1, 1,
0.2015766, -2.097128, 1.677099, 1, 1, 1, 1, 1,
0.2016587, 2.231658, 0.8855245, 1, 1, 1, 1, 1,
0.2035059, 0.6345038, 0.3512042, 1, 1, 1, 1, 1,
0.2048442, 1.006567, -0.4165257, 1, 1, 1, 1, 1,
0.2059609, -1.286192, 2.378719, 1, 1, 1, 1, 1,
0.210795, -0.2467304, 2.763499, 1, 1, 1, 1, 1,
0.2128001, -0.414003, 4.03561, 1, 1, 1, 1, 1,
0.2162367, 0.9975748, -0.443951, 1, 1, 1, 1, 1,
0.2243397, -0.6173332, 3.822426, 1, 1, 1, 1, 1,
0.2269339, -0.5500237, 4.192154, 1, 1, 1, 1, 1,
0.2282717, -0.1440294, 3.687586, 1, 1, 1, 1, 1,
0.229015, -0.8432978, 1.972127, 1, 1, 1, 1, 1,
0.2344439, 0.2561108, 0.9174347, 1, 1, 1, 1, 1,
0.240091, -0.6544515, 3.498428, 1, 1, 1, 1, 1,
0.2404246, -0.1982593, 1.921561, 1, 1, 1, 1, 1,
0.2548422, -1.158988, 4.079333, 0, 0, 1, 1, 1,
0.2588528, -0.005142031, 1.363379, 1, 0, 0, 1, 1,
0.2615363, 0.3477778, 2.133287, 1, 0, 0, 1, 1,
0.2626358, -0.241711, 1.974087, 1, 0, 0, 1, 1,
0.2635646, -0.2413869, 4.769259, 1, 0, 0, 1, 1,
0.2637685, -0.2578297, 3.753846, 1, 0, 0, 1, 1,
0.2638945, -0.08664837, 0.2741674, 0, 0, 0, 1, 1,
0.2677085, -0.07966453, 1.009315, 0, 0, 0, 1, 1,
0.2682896, 0.1573707, 0.8433551, 0, 0, 0, 1, 1,
0.2689297, -0.0803853, 1.987299, 0, 0, 0, 1, 1,
0.2694428, 1.028797, -0.6281034, 0, 0, 0, 1, 1,
0.2771822, 1.292964, 1.131876, 0, 0, 0, 1, 1,
0.282335, -0.3485287, 2.661347, 0, 0, 0, 1, 1,
0.2850062, 0.1939865, 1.844863, 1, 1, 1, 1, 1,
0.2859558, 1.473751, 1.409117, 1, 1, 1, 1, 1,
0.298327, -0.1140164, 1.76468, 1, 1, 1, 1, 1,
0.302452, -0.5202247, 2.933769, 1, 1, 1, 1, 1,
0.3032175, -1.325667, 3.20671, 1, 1, 1, 1, 1,
0.3037088, -1.827163, 3.721536, 1, 1, 1, 1, 1,
0.3037499, 0.3719484, 1.303917, 1, 1, 1, 1, 1,
0.3039139, 1.069949, 3.004276, 1, 1, 1, 1, 1,
0.3085397, -0.8557159, 4.208343, 1, 1, 1, 1, 1,
0.3088564, -0.9167707, 2.714434, 1, 1, 1, 1, 1,
0.3111019, 1.622546, 1.051506, 1, 1, 1, 1, 1,
0.313518, 0.235739, 1.087082, 1, 1, 1, 1, 1,
0.3207341, 0.7306231, 1.887931, 1, 1, 1, 1, 1,
0.3247471, -0.104917, 2.061112, 1, 1, 1, 1, 1,
0.3248826, -0.7798202, 3.25927, 1, 1, 1, 1, 1,
0.3249364, -0.5756875, 1.267138, 0, 0, 1, 1, 1,
0.3296505, 0.5080578, 0.4068771, 1, 0, 0, 1, 1,
0.330267, -1.79158, 1.529076, 1, 0, 0, 1, 1,
0.3315327, 0.1325591, 1.518087, 1, 0, 0, 1, 1,
0.336914, 0.2835017, 0.6117619, 1, 0, 0, 1, 1,
0.3374817, -1.108011, 2.400498, 1, 0, 0, 1, 1,
0.3431468, 0.243622, 1.075816, 0, 0, 0, 1, 1,
0.3469366, 0.5387129, -0.4700418, 0, 0, 0, 1, 1,
0.3471729, 1.101837, 0.3600833, 0, 0, 0, 1, 1,
0.3479243, 3.418175, 1.037105, 0, 0, 0, 1, 1,
0.350638, -0.2630914, 1.606599, 0, 0, 0, 1, 1,
0.3516558, 0.7495759, 1.143765, 0, 0, 0, 1, 1,
0.3525217, 0.7996637, 1.553705, 0, 0, 0, 1, 1,
0.3580019, 0.2599743, 1.142642, 1, 1, 1, 1, 1,
0.3584804, -0.6244552, 3.653695, 1, 1, 1, 1, 1,
0.3589129, -0.5440628, 2.842088, 1, 1, 1, 1, 1,
0.3616507, -0.6062946, 2.873455, 1, 1, 1, 1, 1,
0.3626526, -0.6270842, 3.335697, 1, 1, 1, 1, 1,
0.3636599, 1.102451, 0.9140478, 1, 1, 1, 1, 1,
0.3705453, 1.358237, 0.2302163, 1, 1, 1, 1, 1,
0.3706227, -0.2719271, 1.719568, 1, 1, 1, 1, 1,
0.3723815, 0.1583219, 0.3082294, 1, 1, 1, 1, 1,
0.3724752, 0.8299694, 0.1358362, 1, 1, 1, 1, 1,
0.3755324, 1.856862, 0.9204151, 1, 1, 1, 1, 1,
0.376422, 0.7175953, 0.3287371, 1, 1, 1, 1, 1,
0.3804888, -0.3685, 2.620684, 1, 1, 1, 1, 1,
0.3814008, -0.8008822, 3.066816, 1, 1, 1, 1, 1,
0.3848855, -1.001316, 2.672484, 1, 1, 1, 1, 1,
0.3864163, 0.2254622, 0.1148098, 0, 0, 1, 1, 1,
0.3887605, -0.7367781, 3.574129, 1, 0, 0, 1, 1,
0.3889352, -1.421612, 4.549503, 1, 0, 0, 1, 1,
0.3918763, 1.123985, 4.211688, 1, 0, 0, 1, 1,
0.3922423, 0.1350124, -0.4507921, 1, 0, 0, 1, 1,
0.3928186, -0.2021058, 1.443646, 1, 0, 0, 1, 1,
0.3943282, 0.65681, 1.855785, 0, 0, 0, 1, 1,
0.3951109, 0.3852938, 1.013735, 0, 0, 0, 1, 1,
0.3963969, -1.497245, 2.976769, 0, 0, 0, 1, 1,
0.3966418, 0.5639405, 1.938024, 0, 0, 0, 1, 1,
0.4042565, -2.638733, 4.391037, 0, 0, 0, 1, 1,
0.404945, 1.179528, 0.867457, 0, 0, 0, 1, 1,
0.4051583, -1.041111, 3.01379, 0, 0, 0, 1, 1,
0.4071718, -0.1610572, 2.830691, 1, 1, 1, 1, 1,
0.4108945, 2.593652, 0.5720477, 1, 1, 1, 1, 1,
0.4135301, -0.4574355, 1.618575, 1, 1, 1, 1, 1,
0.414723, 0.7049128, 0.9602489, 1, 1, 1, 1, 1,
0.4194549, -0.875215, 3.269251, 1, 1, 1, 1, 1,
0.4214514, -0.008214487, 2.406703, 1, 1, 1, 1, 1,
0.4219273, 0.1152863, 1.538157, 1, 1, 1, 1, 1,
0.4220599, -1.643602, 1.610611, 1, 1, 1, 1, 1,
0.4243193, 1.795596, -0.1541914, 1, 1, 1, 1, 1,
0.4253835, -0.3778249, 2.685861, 1, 1, 1, 1, 1,
0.426203, 0.9773145, 0.7381786, 1, 1, 1, 1, 1,
0.4394401, -0.1445893, 1.343541, 1, 1, 1, 1, 1,
0.4429171, 0.4852006, 0.7018945, 1, 1, 1, 1, 1,
0.4432644, -0.3383677, 1.717049, 1, 1, 1, 1, 1,
0.4432937, -1.058677, 1.428616, 1, 1, 1, 1, 1,
0.4442543, 1.299691, 0.1517317, 0, 0, 1, 1, 1,
0.4466672, 0.4990188, 1.048299, 1, 0, 0, 1, 1,
0.4473141, 1.267685, 1.008662, 1, 0, 0, 1, 1,
0.4504955, -0.03840971, 4.142061, 1, 0, 0, 1, 1,
0.4592288, -0.9250044, 1.374929, 1, 0, 0, 1, 1,
0.4603282, 0.7241689, 0.04457896, 1, 0, 0, 1, 1,
0.4630509, 0.100985, 0.7707897, 0, 0, 0, 1, 1,
0.4683439, 1.177088, 0.8918518, 0, 0, 0, 1, 1,
0.4700658, -0.9623395, 2.646884, 0, 0, 0, 1, 1,
0.4764443, 1.465155, -0.310378, 0, 0, 0, 1, 1,
0.4764768, 0.114355, 0.2225079, 0, 0, 0, 1, 1,
0.4774349, 0.8670232, 1.861679, 0, 0, 0, 1, 1,
0.48223, 0.4658775, 1.505375, 0, 0, 0, 1, 1,
0.487449, -2.272581, 1.627674, 1, 1, 1, 1, 1,
0.4957722, 0.732582, 1.185508, 1, 1, 1, 1, 1,
0.499398, -1.172558, 1.646989, 1, 1, 1, 1, 1,
0.5009365, -0.2631675, 2.313667, 1, 1, 1, 1, 1,
0.5058573, 0.1489487, 1.156598, 1, 1, 1, 1, 1,
0.5072202, -1.639951, 3.342694, 1, 1, 1, 1, 1,
0.5074941, -0.409623, 3.182366, 1, 1, 1, 1, 1,
0.5080491, 1.002636, 0.1227107, 1, 1, 1, 1, 1,
0.5131881, 0.3623692, 0.1214121, 1, 1, 1, 1, 1,
0.5133762, -0.8095805, 2.17769, 1, 1, 1, 1, 1,
0.5153016, -0.7961829, 0.9480566, 1, 1, 1, 1, 1,
0.5185291, -0.1019486, 1.422287, 1, 1, 1, 1, 1,
0.5198619, -0.3274764, 1.628995, 1, 1, 1, 1, 1,
0.5235439, -0.603959, 1.948897, 1, 1, 1, 1, 1,
0.5299958, -1.21274, 1.702493, 1, 1, 1, 1, 1,
0.5310748, 2.4906, -0.1528179, 0, 0, 1, 1, 1,
0.5347388, 1.946782, -0.4445697, 1, 0, 0, 1, 1,
0.5384306, 0.1469966, 3.39205, 1, 0, 0, 1, 1,
0.5470015, -0.03786723, -1.167561, 1, 0, 0, 1, 1,
0.5520388, 0.8698071, 1.437482, 1, 0, 0, 1, 1,
0.5543959, -0.7025818, 3.127921, 1, 0, 0, 1, 1,
0.5548333, 0.5903658, 1.214149, 0, 0, 0, 1, 1,
0.5557218, 1.198073, -0.7591802, 0, 0, 0, 1, 1,
0.5579014, 0.03491695, 2.167663, 0, 0, 0, 1, 1,
0.5613515, 0.8974003, -0.4800038, 0, 0, 0, 1, 1,
0.5627779, -0.6453997, 2.979059, 0, 0, 0, 1, 1,
0.5640057, 0.8846958, 1.326491, 0, 0, 0, 1, 1,
0.5668193, -0.4800543, 1.400539, 0, 0, 0, 1, 1,
0.5669966, 1.746959, 0.4777082, 1, 1, 1, 1, 1,
0.5675014, 0.3127187, 3.248006, 1, 1, 1, 1, 1,
0.5695775, 0.07887385, 0.7598202, 1, 1, 1, 1, 1,
0.5715409, 0.3351092, 0.313526, 1, 1, 1, 1, 1,
0.5729499, -1.032843, 2.242934, 1, 1, 1, 1, 1,
0.5758923, 0.4618447, -0.3685624, 1, 1, 1, 1, 1,
0.578176, 0.9995059, 0.3056382, 1, 1, 1, 1, 1,
0.58277, 0.02983772, 0.8996218, 1, 1, 1, 1, 1,
0.5836615, -0.5526531, 3.016615, 1, 1, 1, 1, 1,
0.5837452, 2.433282, -0.2403959, 1, 1, 1, 1, 1,
0.5893096, -1.654105, 4.587846, 1, 1, 1, 1, 1,
0.5969747, -1.249302, 1.938003, 1, 1, 1, 1, 1,
0.5969996, 0.4177422, 1.630182, 1, 1, 1, 1, 1,
0.5997196, 1.407982, 1.417377, 1, 1, 1, 1, 1,
0.6011683, -0.6748888, 1.972329, 1, 1, 1, 1, 1,
0.6034396, 0.6153927, -0.01501669, 0, 0, 1, 1, 1,
0.6038349, 0.2214576, 0.5613369, 1, 0, 0, 1, 1,
0.6054789, 0.56457, 2.046014, 1, 0, 0, 1, 1,
0.6137472, -0.2147364, -0.589478, 1, 0, 0, 1, 1,
0.6197123, 0.01560736, 1.902482, 1, 0, 0, 1, 1,
0.6247956, -0.2654833, 2.535558, 1, 0, 0, 1, 1,
0.6257387, -0.03689191, 2.304115, 0, 0, 0, 1, 1,
0.6258946, -1.710701, 3.087595, 0, 0, 0, 1, 1,
0.6268263, -2.168775, 3.674546, 0, 0, 0, 1, 1,
0.6320829, 1.070148, 1.293163, 0, 0, 0, 1, 1,
0.633418, -0.2509633, 2.661496, 0, 0, 0, 1, 1,
0.6355102, -0.4589584, 3.416411, 0, 0, 0, 1, 1,
0.6394802, -1.68017, 3.417434, 0, 0, 0, 1, 1,
0.6420816, 0.9647721, 1.912393, 1, 1, 1, 1, 1,
0.6420819, -1.794717, 3.307337, 1, 1, 1, 1, 1,
0.6430301, 0.8471909, 0.862238, 1, 1, 1, 1, 1,
0.6444257, -2.09599, 3.119398, 1, 1, 1, 1, 1,
0.645964, 1.65149, 0.8854736, 1, 1, 1, 1, 1,
0.6493994, -1.486501, 4.038687, 1, 1, 1, 1, 1,
0.6514143, 0.2575854, 1.235784, 1, 1, 1, 1, 1,
0.6516671, 1.116796, -0.06404255, 1, 1, 1, 1, 1,
0.6550019, -1.009508, 3.134121, 1, 1, 1, 1, 1,
0.6582943, -1.525909, 5.293015, 1, 1, 1, 1, 1,
0.6619024, -1.912047, 4.83626, 1, 1, 1, 1, 1,
0.6683645, 0.8313646, 1.395905, 1, 1, 1, 1, 1,
0.6784692, 0.9561437, -0.4238535, 1, 1, 1, 1, 1,
0.6838737, -0.8788078, 1.57354, 1, 1, 1, 1, 1,
0.6852426, -0.5910809, 0.728839, 1, 1, 1, 1, 1,
0.6860566, 0.4313048, 2.103354, 0, 0, 1, 1, 1,
0.6888826, -0.03194529, 0.8207072, 1, 0, 0, 1, 1,
0.6968383, -0.2594759, 1.557441, 1, 0, 0, 1, 1,
0.6987206, 2.986772, 0.6842352, 1, 0, 0, 1, 1,
0.6989787, 0.1728774, 1.689458, 1, 0, 0, 1, 1,
0.700545, 0.2237485, 3.138991, 1, 0, 0, 1, 1,
0.7055613, 1.263291, -1.32713, 0, 0, 0, 1, 1,
0.7071078, 1.03305, -1.151024, 0, 0, 0, 1, 1,
0.7099326, -0.5632596, 3.19049, 0, 0, 0, 1, 1,
0.7122318, 0.7812554, -0.3951339, 0, 0, 0, 1, 1,
0.7123849, -0.3071634, 2.164358, 0, 0, 0, 1, 1,
0.718353, -0.02058898, 0.9756024, 0, 0, 0, 1, 1,
0.7184705, 0.502047, -0.003977712, 0, 0, 0, 1, 1,
0.72141, 0.1941089, -0.7076347, 1, 1, 1, 1, 1,
0.7225725, -0.6830263, 3.545135, 1, 1, 1, 1, 1,
0.7245452, 0.798942, -0.4397468, 1, 1, 1, 1, 1,
0.7255002, -0.8961117, 1.102189, 1, 1, 1, 1, 1,
0.7313, -0.4698985, 1.519487, 1, 1, 1, 1, 1,
0.7394025, -0.2084943, 0.4735298, 1, 1, 1, 1, 1,
0.7404044, -1.00022, 3.012522, 1, 1, 1, 1, 1,
0.7442552, 0.452201, 1.277281, 1, 1, 1, 1, 1,
0.7582923, 0.07418624, 0.418256, 1, 1, 1, 1, 1,
0.7629649, -1.169917, 1.098584, 1, 1, 1, 1, 1,
0.7677627, 0.9825194, 2.032442, 1, 1, 1, 1, 1,
0.7743353, -0.05728061, 0.28236, 1, 1, 1, 1, 1,
0.774769, 1.215785, 0.7423766, 1, 1, 1, 1, 1,
0.7769895, 0.8927733, 0.880011, 1, 1, 1, 1, 1,
0.7797424, 0.465638, 0.4972765, 1, 1, 1, 1, 1,
0.7801982, -1.931756, 3.396954, 0, 0, 1, 1, 1,
0.7882064, -1.110096, 1.212407, 1, 0, 0, 1, 1,
0.7888618, 0.2869738, 1.314891, 1, 0, 0, 1, 1,
0.7981961, -0.1810176, 1.084586, 1, 0, 0, 1, 1,
0.8012918, -0.209485, 2.263532, 1, 0, 0, 1, 1,
0.8039843, -0.9636685, 2.289808, 1, 0, 0, 1, 1,
0.8117236, 0.472745, 1.762462, 0, 0, 0, 1, 1,
0.8143108, 0.02861951, 0.7187876, 0, 0, 0, 1, 1,
0.8186936, 1.447167, 0.8142319, 0, 0, 0, 1, 1,
0.8187189, 1.631544, 0.1125861, 0, 0, 0, 1, 1,
0.8270702, -1.656917, 3.347419, 0, 0, 0, 1, 1,
0.8278742, -0.5870826, 1.063695, 0, 0, 0, 1, 1,
0.8332321, -0.3955365, 1.840897, 0, 0, 0, 1, 1,
0.8367064, 0.6059939, 0.1255737, 1, 1, 1, 1, 1,
0.8383837, 0.6686189, 2.265146, 1, 1, 1, 1, 1,
0.8386632, 0.7834438, 0.9171033, 1, 1, 1, 1, 1,
0.8387601, 0.7113044, 0.978744, 1, 1, 1, 1, 1,
0.8480081, 1.561933, 0.1323777, 1, 1, 1, 1, 1,
0.8500798, -0.4846303, 2.605788, 1, 1, 1, 1, 1,
0.8548149, -0.7327845, 3.0619, 1, 1, 1, 1, 1,
0.8562506, -0.7973138, 1.989908, 1, 1, 1, 1, 1,
0.8570356, -1.606283, 2.290113, 1, 1, 1, 1, 1,
0.8584642, -0.2051995, -0.9189574, 1, 1, 1, 1, 1,
0.8594807, -0.3866282, 3.041684, 1, 1, 1, 1, 1,
0.8621609, -1.56446, 2.269145, 1, 1, 1, 1, 1,
0.8642815, -0.1606488, 2.349664, 1, 1, 1, 1, 1,
0.8714005, -0.3439137, 0.04596617, 1, 1, 1, 1, 1,
0.8723598, 1.452024, 0.8262469, 1, 1, 1, 1, 1,
0.8759058, 0.03406997, 0.2554886, 0, 0, 1, 1, 1,
0.8774372, -1.35807, 2.82078, 1, 0, 0, 1, 1,
0.8807045, 0.9430835, 2.635936, 1, 0, 0, 1, 1,
0.884468, 1.614829, -0.6937943, 1, 0, 0, 1, 1,
0.8858737, 0.4889609, 1.766762, 1, 0, 0, 1, 1,
0.8898835, -0.8971324, 1.681484, 1, 0, 0, 1, 1,
0.8935267, 0.8640742, 0.8034239, 0, 0, 0, 1, 1,
0.8990755, 0.5432844, 1.264956, 0, 0, 0, 1, 1,
0.9009323, -2.10191, 2.986073, 0, 0, 0, 1, 1,
0.9101137, 1.022566, -0.2763136, 0, 0, 0, 1, 1,
0.9107373, 0.4341428, 2.108908, 0, 0, 0, 1, 1,
0.9143202, 1.633154, -1.048777, 0, 0, 0, 1, 1,
0.9149625, -0.2349577, 0.04337158, 0, 0, 0, 1, 1,
0.9171133, 0.170573, 0.9223397, 1, 1, 1, 1, 1,
0.9191054, 0.3119101, 2.302943, 1, 1, 1, 1, 1,
0.9211665, 0.2924799, 3.486387, 1, 1, 1, 1, 1,
0.9252107, -1.738365, 2.430103, 1, 1, 1, 1, 1,
0.9306954, 0.20743, 0.6609433, 1, 1, 1, 1, 1,
0.9441671, -0.8922667, 3.064256, 1, 1, 1, 1, 1,
0.9454725, -2.204784, 4.773083, 1, 1, 1, 1, 1,
0.9484534, 0.7435899, -0.6810695, 1, 1, 1, 1, 1,
0.9593675, 0.9898476, -0.4971773, 1, 1, 1, 1, 1,
0.9618634, 0.1074413, 1.696252, 1, 1, 1, 1, 1,
0.963253, 0.9199227, 1.53014, 1, 1, 1, 1, 1,
0.9634869, 1.441841, -0.8692149, 1, 1, 1, 1, 1,
0.9639121, 1.473939, 0.1698514, 1, 1, 1, 1, 1,
0.9673377, -0.9819971, 2.289898, 1, 1, 1, 1, 1,
0.9721212, 1.428614, 0.7082871, 1, 1, 1, 1, 1,
0.9737366, 0.09015734, 0.4179283, 0, 0, 1, 1, 1,
0.9801858, 0.120179, 0.6181191, 1, 0, 0, 1, 1,
0.9843657, -0.4541897, 3.11326, 1, 0, 0, 1, 1,
0.9859503, -0.7341415, 2.574472, 1, 0, 0, 1, 1,
0.988819, 1.714515, 1.041577, 1, 0, 0, 1, 1,
0.995759, 1.158732, 1.001878, 1, 0, 0, 1, 1,
0.9968778, -2.043522, 2.154992, 0, 0, 0, 1, 1,
0.999235, 0.5215501, 1.163928, 0, 0, 0, 1, 1,
1.010208, -0.5721869, 3.154786, 0, 0, 0, 1, 1,
1.010664, -0.2302835, 2.846855, 0, 0, 0, 1, 1,
1.011395, 0.1226759, 2.2215, 0, 0, 0, 1, 1,
1.013177, -2.512135, 1.924344, 0, 0, 0, 1, 1,
1.015566, -0.469357, 2.797917, 0, 0, 0, 1, 1,
1.017602, 1.513244, -0.08407895, 1, 1, 1, 1, 1,
1.031924, 2.082657, 2.148989, 1, 1, 1, 1, 1,
1.039947, 1.178746, -1.157295, 1, 1, 1, 1, 1,
1.04272, 1.347914, 2.236501, 1, 1, 1, 1, 1,
1.044977, 0.04023797, 1.801171, 1, 1, 1, 1, 1,
1.046824, -0.2040796, 1.437027, 1, 1, 1, 1, 1,
1.052793, -0.5135131, 4.084343, 1, 1, 1, 1, 1,
1.058526, 1.073261, 2.456858, 1, 1, 1, 1, 1,
1.079963, 0.572659, -0.6051539, 1, 1, 1, 1, 1,
1.086786, -0.8811749, 0.2781476, 1, 1, 1, 1, 1,
1.088697, -2.650833, 3.422723, 1, 1, 1, 1, 1,
1.095841, 0.1043448, 2.269614, 1, 1, 1, 1, 1,
1.09978, -0.6690751, 0.4913864, 1, 1, 1, 1, 1,
1.101361, -0.2266034, 2.534222, 1, 1, 1, 1, 1,
1.103843, -0.9967679, -0.5415703, 1, 1, 1, 1, 1,
1.104388, 1.474301, 0.4647141, 0, 0, 1, 1, 1,
1.107418, -0.6191829, 2.662387, 1, 0, 0, 1, 1,
1.120858, 0.7060096, 0.001726687, 1, 0, 0, 1, 1,
1.126057, 0.019109, 0.9319535, 1, 0, 0, 1, 1,
1.134405, -0.1201488, 2.268337, 1, 0, 0, 1, 1,
1.135866, -1.387005, 1.826832, 1, 0, 0, 1, 1,
1.136912, -0.5370698, 1.648773, 0, 0, 0, 1, 1,
1.155377, -0.7506148, 4.348442, 0, 0, 0, 1, 1,
1.164254, 0.7183771, 0.6962281, 0, 0, 0, 1, 1,
1.170232, 1.710154, 1.622337, 0, 0, 0, 1, 1,
1.18036, 2.467565, -1.895989, 0, 0, 0, 1, 1,
1.192112, 0.1331622, 0.3260155, 0, 0, 0, 1, 1,
1.194895, -1.15554, 3.580447, 0, 0, 0, 1, 1,
1.195279, -1.125674, 2.673161, 1, 1, 1, 1, 1,
1.196362, -0.3637451, 1.416071, 1, 1, 1, 1, 1,
1.208087, 0.4979273, 1.967301, 1, 1, 1, 1, 1,
1.208878, -0.01114696, 1.118375, 1, 1, 1, 1, 1,
1.209298, 2.889361, -0.8725905, 1, 1, 1, 1, 1,
1.20993, 1.152778, 2.197702, 1, 1, 1, 1, 1,
1.216379, 1.268736, 1.222562, 1, 1, 1, 1, 1,
1.219262, -0.3956867, 1.316202, 1, 1, 1, 1, 1,
1.236045, 0.7303526, 1.922252, 1, 1, 1, 1, 1,
1.253195, 1.335942, 0.3353864, 1, 1, 1, 1, 1,
1.25554, 1.081992, -0.6498319, 1, 1, 1, 1, 1,
1.256871, -0.7189745, 4.101222, 1, 1, 1, 1, 1,
1.257237, 1.1133, 1.622797, 1, 1, 1, 1, 1,
1.258524, 1.136366, 0.3949644, 1, 1, 1, 1, 1,
1.259043, 0.84231, 1.241654, 1, 1, 1, 1, 1,
1.269004, 0.005612247, 0.8896453, 0, 0, 1, 1, 1,
1.276917, -0.1246291, 1.215059, 1, 0, 0, 1, 1,
1.277027, -0.9021942, 0.7279323, 1, 0, 0, 1, 1,
1.286532, 0.7973019, 1.495382, 1, 0, 0, 1, 1,
1.305501, 1.114037, 1.352713, 1, 0, 0, 1, 1,
1.310099, 0.53679, 0.2419349, 1, 0, 0, 1, 1,
1.314633, -0.738198, 2.325077, 0, 0, 0, 1, 1,
1.323543, 1.203722, 0.7732547, 0, 0, 0, 1, 1,
1.324715, -0.08817721, -0.7660845, 0, 0, 0, 1, 1,
1.327095, 0.2643314, 1.364863, 0, 0, 0, 1, 1,
1.329823, -2.420037, 4.505047, 0, 0, 0, 1, 1,
1.346297, 2.210641, 1.622163, 0, 0, 0, 1, 1,
1.359019, -0.2130883, 2.342804, 0, 0, 0, 1, 1,
1.365938, -0.5373883, 1.107365, 1, 1, 1, 1, 1,
1.370846, -0.3773482, 2.052387, 1, 1, 1, 1, 1,
1.37116, 0.3913649, 2.408491, 1, 1, 1, 1, 1,
1.371688, 2.159309, -0.1631341, 1, 1, 1, 1, 1,
1.373804, -0.5965102, 0.1521766, 1, 1, 1, 1, 1,
1.379924, 0.7846494, 0.3694923, 1, 1, 1, 1, 1,
1.409158, -0.3287613, 1.662769, 1, 1, 1, 1, 1,
1.410336, -1.270256, 1.206401, 1, 1, 1, 1, 1,
1.414904, 0.05466266, 1.860843, 1, 1, 1, 1, 1,
1.421339, 1.254485, 1.612529, 1, 1, 1, 1, 1,
1.426887, -1.898762, 1.698877, 1, 1, 1, 1, 1,
1.431919, -1.938348, 2.05366, 1, 1, 1, 1, 1,
1.444935, 0.3254484, 2.713898, 1, 1, 1, 1, 1,
1.448427, 0.403464, -0.5674099, 1, 1, 1, 1, 1,
1.452218, 1.032053, 1.763062, 1, 1, 1, 1, 1,
1.459204, 0.3814535, 1.059769, 0, 0, 1, 1, 1,
1.464964, 1.115289, 0.6846535, 1, 0, 0, 1, 1,
1.466354, 1.657657, -1.772029, 1, 0, 0, 1, 1,
1.470924, -1.76962, 2.814285, 1, 0, 0, 1, 1,
1.474063, -0.9352713, -0.8782869, 1, 0, 0, 1, 1,
1.475207, 0.6363805, 1.714662, 1, 0, 0, 1, 1,
1.498434, 0.9241297, 0.7823713, 0, 0, 0, 1, 1,
1.510345, 0.7044959, 1.054667, 0, 0, 0, 1, 1,
1.512108, -0.3457158, 0.5316412, 0, 0, 0, 1, 1,
1.537778, 0.1249161, -0.7880457, 0, 0, 0, 1, 1,
1.554944, 0.3372422, 0.1992149, 0, 0, 0, 1, 1,
1.577769, 0.828307, 2.253802, 0, 0, 0, 1, 1,
1.581322, 0.273644, 2.832212, 0, 0, 0, 1, 1,
1.596143, 0.756803, 3.079925, 1, 1, 1, 1, 1,
1.604475, 0.1685145, 0.7307785, 1, 1, 1, 1, 1,
1.617183, 0.6861786, 1.736868, 1, 1, 1, 1, 1,
1.618037, -3.246578, 2.736501, 1, 1, 1, 1, 1,
1.619995, 0.6725507, 0.9293926, 1, 1, 1, 1, 1,
1.632906, -0.06269854, 1.099471, 1, 1, 1, 1, 1,
1.642203, 0.5302262, -1.267756, 1, 1, 1, 1, 1,
1.647003, -0.1551135, 2.685337, 1, 1, 1, 1, 1,
1.652721, 2.257439, 0.6481364, 1, 1, 1, 1, 1,
1.655586, 0.01860112, -0.3541358, 1, 1, 1, 1, 1,
1.662611, 0.2317193, 2.69535, 1, 1, 1, 1, 1,
1.671062, -1.699541, 2.27102, 1, 1, 1, 1, 1,
1.674075, -1.159604, 2.822496, 1, 1, 1, 1, 1,
1.681397, 1.161158, 0.04295202, 1, 1, 1, 1, 1,
1.685074, 1.693628, 0.1916734, 1, 1, 1, 1, 1,
1.687631, -0.1153122, 2.597422, 0, 0, 1, 1, 1,
1.694217, -1.348658, -0.7624907, 1, 0, 0, 1, 1,
1.694723, 1.162628, -0.08204021, 1, 0, 0, 1, 1,
1.728043, 0.3347158, 0.8964059, 1, 0, 0, 1, 1,
1.765796, -0.3378009, 1.585497, 1, 0, 0, 1, 1,
1.784616, -0.658191, 2.237176, 1, 0, 0, 1, 1,
1.789053, -0.06713357, 1.730587, 0, 0, 0, 1, 1,
1.801285, -0.1976664, 1.357872, 0, 0, 0, 1, 1,
1.805781, 3.064267, 1.846049, 0, 0, 0, 1, 1,
1.819414, 0.6262811, 0.5403493, 0, 0, 0, 1, 1,
1.851504, 1.354195, 3.250098, 0, 0, 0, 1, 1,
1.85254, -0.1696267, 2.320931, 0, 0, 0, 1, 1,
1.862403, -1.602241, 1.148732, 0, 0, 0, 1, 1,
1.903251, 0.6375467, 1.705081, 1, 1, 1, 1, 1,
1.923919, -0.2681711, 2.489285, 1, 1, 1, 1, 1,
1.924349, -0.5896641, 0.5296634, 1, 1, 1, 1, 1,
1.943417, -0.01578029, 0.2662164, 1, 1, 1, 1, 1,
1.961705, -0.3517147, 1.569032, 1, 1, 1, 1, 1,
1.984957, -2.065205, 1.672934, 1, 1, 1, 1, 1,
2.016546, 1.464867, 0.1542704, 1, 1, 1, 1, 1,
2.036681, 1.85607, 1.813897, 1, 1, 1, 1, 1,
2.046766, 0.1480091, 0.9909818, 1, 1, 1, 1, 1,
2.05729, 0.5022905, 1.874972, 1, 1, 1, 1, 1,
2.070111, 0.4388047, 1.807131, 1, 1, 1, 1, 1,
2.105162, 0.2986411, 1.829077, 1, 1, 1, 1, 1,
2.107114, 1.906784, 0.2792728, 1, 1, 1, 1, 1,
2.128104, 0.6390152, 0.515915, 1, 1, 1, 1, 1,
2.134781, 0.9871699, 0.7849066, 1, 1, 1, 1, 1,
2.14175, 0.5692869, -1.676483, 0, 0, 1, 1, 1,
2.196374, 0.8284097, 0.6812356, 1, 0, 0, 1, 1,
2.20421, 0.2255433, 1.863799, 1, 0, 0, 1, 1,
2.210859, -1.581705, 2.922902, 1, 0, 0, 1, 1,
2.22691, 2.556591, 1.031257, 1, 0, 0, 1, 1,
2.273261, -0.3333035, 1.678079, 1, 0, 0, 1, 1,
2.375604, 1.405938, 0.2343856, 0, 0, 0, 1, 1,
2.382772, -0.04230225, 1.169497, 0, 0, 0, 1, 1,
2.389817, 0.951758, 0.7983387, 0, 0, 0, 1, 1,
2.433279, 0.7311549, 0.779384, 0, 0, 0, 1, 1,
2.445515, 1.214723, 0.1188641, 0, 0, 0, 1, 1,
2.48153, 1.76387, -0.6458785, 0, 0, 0, 1, 1,
2.530772, -1.232098, 0.5401255, 0, 0, 0, 1, 1,
2.565478, 1.113162, 0.4415523, 1, 1, 1, 1, 1,
2.576389, 0.6629243, -0.704686, 1, 1, 1, 1, 1,
2.642289, 0.3071032, 1.858128, 1, 1, 1, 1, 1,
2.847936, 0.0194231, 0.06242758, 1, 1, 1, 1, 1,
2.874335, -0.6569898, 3.332153, 1, 1, 1, 1, 1,
3.414126, -0.38886, 0.6526698, 1, 1, 1, 1, 1,
3.990684, -0.1363587, -0.9586126, 1, 1, 1, 1, 1
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
var radius = 9.93458;
var distance = 34.89479;
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
mvMatrix.translate( -0.4213769, 0.110245, 0.04588723 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.89479);
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
