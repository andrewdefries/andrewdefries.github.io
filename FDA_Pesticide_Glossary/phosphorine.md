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
-3.314682, 0.7991697, -2.55019, 1, 0, 0, 1,
-3.116285, 0.5278574, -1.019882, 1, 0.007843138, 0, 1,
-2.863002, 1.277864, -0.5764158, 1, 0.01176471, 0, 1,
-2.840724, -0.3708278, 0.04121185, 1, 0.01960784, 0, 1,
-2.757572, 0.9720037, 0.5594099, 1, 0.02352941, 0, 1,
-2.513385, 1.783471, 0.2547192, 1, 0.03137255, 0, 1,
-2.438833, -1.948944, -1.234141, 1, 0.03529412, 0, 1,
-2.393337, 1.9258, -1.271521, 1, 0.04313726, 0, 1,
-2.386639, -1.556607, -3.313135, 1, 0.04705882, 0, 1,
-2.385041, 0.2156554, -1.575646, 1, 0.05490196, 0, 1,
-2.367919, -0.515637, -1.749196, 1, 0.05882353, 0, 1,
-2.360351, 0.6103963, -1.466087, 1, 0.06666667, 0, 1,
-2.34032, -0.8593706, -1.248983, 1, 0.07058824, 0, 1,
-2.307753, -1.139885, -2.921298, 1, 0.07843138, 0, 1,
-2.292301, 0.2025973, -1.732577, 1, 0.08235294, 0, 1,
-2.290629, -0.1715524, -1.121438, 1, 0.09019608, 0, 1,
-2.256568, 0.4608388, -1.031168, 1, 0.09411765, 0, 1,
-2.184567, 1.393711, 0.9322369, 1, 0.1019608, 0, 1,
-2.179955, -1.324666, -1.692852, 1, 0.1098039, 0, 1,
-2.174165, 0.2488324, -2.352714, 1, 0.1137255, 0, 1,
-2.15442, -0.6370534, -3.619369, 1, 0.1215686, 0, 1,
-2.151026, -1.580658, -1.287162, 1, 0.1254902, 0, 1,
-2.088914, 0.1870391, -0.9212125, 1, 0.1333333, 0, 1,
-2.073722, -0.2812155, -1.658119, 1, 0.1372549, 0, 1,
-2.050098, 0.519708, -1.077198, 1, 0.145098, 0, 1,
-2.047727, -0.1307375, -0.6029136, 1, 0.1490196, 0, 1,
-2.042769, 0.421326, -2.04724, 1, 0.1568628, 0, 1,
-2.040441, 0.03602188, -0.819625, 1, 0.1607843, 0, 1,
-2.021741, -1.265368, -3.014656, 1, 0.1686275, 0, 1,
-2.017774, -1.16137, -0.7513078, 1, 0.172549, 0, 1,
-2.008217, -0.6670513, -2.213259, 1, 0.1803922, 0, 1,
-1.989262, -0.03364444, -0.9666111, 1, 0.1843137, 0, 1,
-1.961338, 1.722542, -0.124861, 1, 0.1921569, 0, 1,
-1.921558, 0.220701, -0.750849, 1, 0.1960784, 0, 1,
-1.919276, -0.605198, -2.12461, 1, 0.2039216, 0, 1,
-1.909093, -0.8643199, -1.192772, 1, 0.2117647, 0, 1,
-1.892153, 0.3020889, -0.2397721, 1, 0.2156863, 0, 1,
-1.889051, -1.096638, -2.125234, 1, 0.2235294, 0, 1,
-1.879999, -1.433529, -2.786289, 1, 0.227451, 0, 1,
-1.860521, -1.254577, -2.733355, 1, 0.2352941, 0, 1,
-1.851367, 0.8428885, -2.031209, 1, 0.2392157, 0, 1,
-1.826502, 1.453912, -2.49577, 1, 0.2470588, 0, 1,
-1.823854, -0.2501705, -0.7542879, 1, 0.2509804, 0, 1,
-1.807364, -1.657207, -3.652876, 1, 0.2588235, 0, 1,
-1.796724, -0.06581933, -1.786755, 1, 0.2627451, 0, 1,
-1.794763, -0.152503, -1.856244, 1, 0.2705882, 0, 1,
-1.790148, -0.407905, -0.2334836, 1, 0.2745098, 0, 1,
-1.786681, 1.462556, -0.7356316, 1, 0.282353, 0, 1,
-1.779038, 1.980942, -1.089287, 1, 0.2862745, 0, 1,
-1.778657, -0.8918751, -1.498576, 1, 0.2941177, 0, 1,
-1.768314, 1.703858, -0.1868446, 1, 0.3019608, 0, 1,
-1.727498, -0.2238818, -2.515418, 1, 0.3058824, 0, 1,
-1.709213, -1.836675, -3.638632, 1, 0.3137255, 0, 1,
-1.705953, 0.08680921, -3.079155, 1, 0.3176471, 0, 1,
-1.67689, 1.074804, -3.188206, 1, 0.3254902, 0, 1,
-1.666868, -0.7367259, -1.375359, 1, 0.3294118, 0, 1,
-1.664681, -0.7254661, -2.386128, 1, 0.3372549, 0, 1,
-1.640875, -0.4549653, -3.363515, 1, 0.3411765, 0, 1,
-1.633142, -0.4317236, -2.178766, 1, 0.3490196, 0, 1,
-1.630815, 2.523628, 1.812337, 1, 0.3529412, 0, 1,
-1.620246, 0.6734887, -0.7034146, 1, 0.3607843, 0, 1,
-1.595801, -0.5244172, -1.144619, 1, 0.3647059, 0, 1,
-1.591477, -0.02435584, 0.4986845, 1, 0.372549, 0, 1,
-1.584094, -0.0654567, -2.460969, 1, 0.3764706, 0, 1,
-1.577764, -0.09696815, -1.371952, 1, 0.3843137, 0, 1,
-1.570298, 0.4819375, -0.9128284, 1, 0.3882353, 0, 1,
-1.568266, -0.6415558, -2.845302, 1, 0.3960784, 0, 1,
-1.552386, -0.03850586, -3.255609, 1, 0.4039216, 0, 1,
-1.533287, 2.010636, 0.9591886, 1, 0.4078431, 0, 1,
-1.520296, -1.448525, -1.693167, 1, 0.4156863, 0, 1,
-1.507066, 0.3156504, -3.530523, 1, 0.4196078, 0, 1,
-1.505484, -0.1083521, -1.51195, 1, 0.427451, 0, 1,
-1.500507, -1.3039, -3.749442, 1, 0.4313726, 0, 1,
-1.497488, 1.613006, -2.230928, 1, 0.4392157, 0, 1,
-1.488624, -0.3179848, -0.7765599, 1, 0.4431373, 0, 1,
-1.487012, -0.9248507, -1.549383, 1, 0.4509804, 0, 1,
-1.479678, 1.927172, -1.931324, 1, 0.454902, 0, 1,
-1.479178, 0.7137791, -2.260751, 1, 0.4627451, 0, 1,
-1.470249, -1.125741, -1.127194, 1, 0.4666667, 0, 1,
-1.452713, 0.0372173, -1.175693, 1, 0.4745098, 0, 1,
-1.437909, -1.217576, -2.055283, 1, 0.4784314, 0, 1,
-1.434598, -0.1837018, -1.091453, 1, 0.4862745, 0, 1,
-1.433516, -0.7324955, -1.872534, 1, 0.4901961, 0, 1,
-1.430706, 0.4613072, -0.02283007, 1, 0.4980392, 0, 1,
-1.424046, 0.6585386, -2.432081, 1, 0.5058824, 0, 1,
-1.417682, 0.5807877, -0.8263156, 1, 0.509804, 0, 1,
-1.367591, 0.1368212, -2.772364, 1, 0.5176471, 0, 1,
-1.366971, 1.691341, -0.9811988, 1, 0.5215687, 0, 1,
-1.366011, -0.8487883, -3.978221, 1, 0.5294118, 0, 1,
-1.365866, -1.342096, -1.571839, 1, 0.5333334, 0, 1,
-1.357722, 0.3947695, -0.515911, 1, 0.5411765, 0, 1,
-1.352297, 0.8716089, -1.619041, 1, 0.5450981, 0, 1,
-1.351597, 0.3355921, -1.270153, 1, 0.5529412, 0, 1,
-1.346136, 0.7669757, -1.479072, 1, 0.5568628, 0, 1,
-1.337717, -0.6737133, -1.438926, 1, 0.5647059, 0, 1,
-1.322351, -1.182483, -2.50106, 1, 0.5686275, 0, 1,
-1.321008, 0.8931665, -0.9115416, 1, 0.5764706, 0, 1,
-1.312519, 0.8649849, -1.433777, 1, 0.5803922, 0, 1,
-1.311966, 1.636472, -2.688491, 1, 0.5882353, 0, 1,
-1.311038, 0.009997016, -2.520896, 1, 0.5921569, 0, 1,
-1.310245, 0.4435039, -1.154221, 1, 0.6, 0, 1,
-1.309364, 1.565651, 0.08088464, 1, 0.6078432, 0, 1,
-1.294036, 0.4157026, -1.934191, 1, 0.6117647, 0, 1,
-1.269714, -1.051302, -1.412134, 1, 0.6196079, 0, 1,
-1.261201, 1.037895, -0.9761959, 1, 0.6235294, 0, 1,
-1.250547, -1.366331, -3.088897, 1, 0.6313726, 0, 1,
-1.240576, 1.911303, 0.4358371, 1, 0.6352941, 0, 1,
-1.233088, 2.36587, -0.1686023, 1, 0.6431373, 0, 1,
-1.231573, -1.428752, -2.821506, 1, 0.6470588, 0, 1,
-1.229185, 0.4731855, -2.032437, 1, 0.654902, 0, 1,
-1.2244, 1.069561, -2.406938, 1, 0.6588235, 0, 1,
-1.214704, 0.3203859, -1.395441, 1, 0.6666667, 0, 1,
-1.213886, -0.3069881, -3.748148, 1, 0.6705883, 0, 1,
-1.211878, 0.006447822, -1.366335, 1, 0.6784314, 0, 1,
-1.206923, 0.1127305, -1.250167, 1, 0.682353, 0, 1,
-1.192061, -1.495717, -3.328517, 1, 0.6901961, 0, 1,
-1.185328, 0.2472099, -2.776974, 1, 0.6941177, 0, 1,
-1.184872, 1.210753, 0.7425584, 1, 0.7019608, 0, 1,
-1.180924, 0.248808, -0.9465412, 1, 0.7098039, 0, 1,
-1.171922, 0.7541237, -2.184477, 1, 0.7137255, 0, 1,
-1.164399, 1.702308, -0.1664803, 1, 0.7215686, 0, 1,
-1.155522, -0.1697318, -3.103774, 1, 0.7254902, 0, 1,
-1.155109, -0.3656118, -2.478616, 1, 0.7333333, 0, 1,
-1.154594, 1.456876, 0.1017591, 1, 0.7372549, 0, 1,
-1.14471, -0.2000527, -2.331165, 1, 0.7450981, 0, 1,
-1.134925, 0.7779946, -1.616071, 1, 0.7490196, 0, 1,
-1.1307, 1.971833, -1.290357, 1, 0.7568628, 0, 1,
-1.129408, 2.44184, 0.01087213, 1, 0.7607843, 0, 1,
-1.115025, 1.563182, -0.3491805, 1, 0.7686275, 0, 1,
-1.114366, 1.152986, -0.6402792, 1, 0.772549, 0, 1,
-1.108024, -0.03221299, -2.011348, 1, 0.7803922, 0, 1,
-1.10575, -1.824251, -2.077122, 1, 0.7843137, 0, 1,
-1.087631, -0.691015, -1.697585, 1, 0.7921569, 0, 1,
-1.082972, 0.6226534, -1.47461, 1, 0.7960784, 0, 1,
-1.075616, 0.2769592, -0.3483904, 1, 0.8039216, 0, 1,
-1.075038, 2.04153, 0.1028324, 1, 0.8117647, 0, 1,
-1.071985, 0.407579, -1.626239, 1, 0.8156863, 0, 1,
-1.069869, 0.3644704, -1.617988, 1, 0.8235294, 0, 1,
-1.06915, 1.344501, 0.7954545, 1, 0.827451, 0, 1,
-1.064184, 1.28141, -1.622693, 1, 0.8352941, 0, 1,
-1.061638, 0.0918461, -0.8372219, 1, 0.8392157, 0, 1,
-1.061598, 0.02075133, -1.107093, 1, 0.8470588, 0, 1,
-1.059303, 0.02503918, -1.878347, 1, 0.8509804, 0, 1,
-1.05318, -0.5220201, -1.366919, 1, 0.8588235, 0, 1,
-1.051709, -2.392255, -2.751892, 1, 0.8627451, 0, 1,
-1.048641, -0.100535, -2.520244, 1, 0.8705882, 0, 1,
-1.036741, 2.409789, -0.3539826, 1, 0.8745098, 0, 1,
-1.027789, 1.180609, -1.171884, 1, 0.8823529, 0, 1,
-1.024007, -1.440973, -0.01800994, 1, 0.8862745, 0, 1,
-1.013421, -0.1075444, -0.1608775, 1, 0.8941177, 0, 1,
-1.011636, 0.162722, -2.123502, 1, 0.8980392, 0, 1,
-1.000071, 1.179903, 0.654844, 1, 0.9058824, 0, 1,
-0.9998729, -1.136215, -2.639889, 1, 0.9137255, 0, 1,
-0.9995378, 0.5803117, 0.1685792, 1, 0.9176471, 0, 1,
-0.9942942, 1.230932, -1.572607, 1, 0.9254902, 0, 1,
-0.9891974, 0.422834, -2.610048, 1, 0.9294118, 0, 1,
-0.9841533, -1.41381, -3.973674, 1, 0.9372549, 0, 1,
-0.9829405, 0.161217, -0.5985133, 1, 0.9411765, 0, 1,
-0.9817687, -0.0954869, -0.5279502, 1, 0.9490196, 0, 1,
-0.9799396, -1.055906, -2.602903, 1, 0.9529412, 0, 1,
-0.9780011, -0.9348603, -0.7799931, 1, 0.9607843, 0, 1,
-0.9779216, -0.6827389, -0.2492321, 1, 0.9647059, 0, 1,
-0.9759891, 0.3087071, -1.878041, 1, 0.972549, 0, 1,
-0.9662519, -0.2255499, -0.7274722, 1, 0.9764706, 0, 1,
-0.9634216, 0.7941178, -3.040696, 1, 0.9843137, 0, 1,
-0.9556828, 1.545823, -0.4384647, 1, 0.9882353, 0, 1,
-0.9550236, 1.078819, -0.4589725, 1, 0.9960784, 0, 1,
-0.9550169, 0.9650212, -0.3327427, 0.9960784, 1, 0, 1,
-0.9547327, 0.03976854, -0.2834334, 0.9921569, 1, 0, 1,
-0.9525486, -1.656998, -2.509642, 0.9843137, 1, 0, 1,
-0.9521123, 0.5419961, 0.6705544, 0.9803922, 1, 0, 1,
-0.9475304, 0.7540863, -1.187124, 0.972549, 1, 0, 1,
-0.9464421, 2.365904, -1.361124, 0.9686275, 1, 0, 1,
-0.9463202, -0.05347344, -2.089869, 0.9607843, 1, 0, 1,
-0.9441878, -0.6204033, -2.374088, 0.9568627, 1, 0, 1,
-0.9422061, -0.7971754, -2.812187, 0.9490196, 1, 0, 1,
-0.9364237, -0.5689022, -3.586663, 0.945098, 1, 0, 1,
-0.9276526, 1.074015, 0.1363634, 0.9372549, 1, 0, 1,
-0.9251114, 1.166717, 0.06593237, 0.9333333, 1, 0, 1,
-0.92496, -0.203858, -1.240211, 0.9254902, 1, 0, 1,
-0.9162894, -0.8189872, -2.324651, 0.9215686, 1, 0, 1,
-0.9136187, 1.427102, -0.6106817, 0.9137255, 1, 0, 1,
-0.906996, 1.33277, -0.6698034, 0.9098039, 1, 0, 1,
-0.9066374, 0.3472416, -0.945343, 0.9019608, 1, 0, 1,
-0.9020309, -1.892099, -3.941834, 0.8941177, 1, 0, 1,
-0.900571, -0.0488506, -2.592305, 0.8901961, 1, 0, 1,
-0.8920964, 0.6897716, -0.5182291, 0.8823529, 1, 0, 1,
-0.8920903, 0.6075415, -0.1201877, 0.8784314, 1, 0, 1,
-0.884621, 0.4250154, -1.401224, 0.8705882, 1, 0, 1,
-0.8761722, 0.1676384, -0.04154496, 0.8666667, 1, 0, 1,
-0.8752072, -1.207923, -2.862186, 0.8588235, 1, 0, 1,
-0.8726491, 0.9948898, -2.970299, 0.854902, 1, 0, 1,
-0.8699855, -0.4792207, -3.119514, 0.8470588, 1, 0, 1,
-0.8672178, -1.322428, -3.002288, 0.8431373, 1, 0, 1,
-0.8652973, -2.540254, -1.118257, 0.8352941, 1, 0, 1,
-0.8560109, -0.5862516, -3.331321, 0.8313726, 1, 0, 1,
-0.8540932, 0.356488, -1.030828, 0.8235294, 1, 0, 1,
-0.8515856, -0.2448318, -0.1173348, 0.8196079, 1, 0, 1,
-0.849372, 0.1864471, -1.465933, 0.8117647, 1, 0, 1,
-0.8366141, 0.344599, -2.624826, 0.8078431, 1, 0, 1,
-0.8297064, 0.08578888, -1.751763, 0.8, 1, 0, 1,
-0.828118, -0.9919611, -2.716031, 0.7921569, 1, 0, 1,
-0.8194561, -0.4368458, -4.030499, 0.7882353, 1, 0, 1,
-0.8177118, -0.7851434, -3.013111, 0.7803922, 1, 0, 1,
-0.8170511, -0.1717102, -1.330234, 0.7764706, 1, 0, 1,
-0.8139201, -0.4065533, -1.828418, 0.7686275, 1, 0, 1,
-0.8118163, 0.07435643, -3.158892, 0.7647059, 1, 0, 1,
-0.80075, 0.5147595, -0.158932, 0.7568628, 1, 0, 1,
-0.7954698, -2.294979, -2.459161, 0.7529412, 1, 0, 1,
-0.791385, 0.7233899, 0.174671, 0.7450981, 1, 0, 1,
-0.7896412, 0.7433172, -0.03775895, 0.7411765, 1, 0, 1,
-0.7850217, -0.4386967, -0.8733846, 0.7333333, 1, 0, 1,
-0.7826104, 0.5183264, -1.184585, 0.7294118, 1, 0, 1,
-0.7770188, 0.7127782, -1.246241, 0.7215686, 1, 0, 1,
-0.7727668, 0.161791, -2.366237, 0.7176471, 1, 0, 1,
-0.7724361, -1.334143, -1.66668, 0.7098039, 1, 0, 1,
-0.764393, 0.08688597, -1.339103, 0.7058824, 1, 0, 1,
-0.7641175, 0.850391, 1.074701, 0.6980392, 1, 0, 1,
-0.7618494, -1.358071, -4.504726, 0.6901961, 1, 0, 1,
-0.7590539, 0.3633851, -0.3626621, 0.6862745, 1, 0, 1,
-0.7588671, -1.109379, -2.894688, 0.6784314, 1, 0, 1,
-0.7551782, 1.420098, -1.87554, 0.6745098, 1, 0, 1,
-0.7534963, 0.6999038, 1.061971, 0.6666667, 1, 0, 1,
-0.7499009, -1.521843, -1.57367, 0.6627451, 1, 0, 1,
-0.7478966, 0.3476168, -2.198226, 0.654902, 1, 0, 1,
-0.7375728, 0.7521253, -0.6201611, 0.6509804, 1, 0, 1,
-0.7368297, 0.3151157, -0.08001415, 0.6431373, 1, 0, 1,
-0.7360955, 0.8533385, -0.1222845, 0.6392157, 1, 0, 1,
-0.7359025, 0.3673041, -1.580294, 0.6313726, 1, 0, 1,
-0.7312399, 1.470699, -0.4067165, 0.627451, 1, 0, 1,
-0.7303092, 0.1912215, -0.2391838, 0.6196079, 1, 0, 1,
-0.7291124, 0.5322047, -0.9070026, 0.6156863, 1, 0, 1,
-0.7282373, -0.7466946, -1.057573, 0.6078432, 1, 0, 1,
-0.7248959, 1.248733, 0.9456715, 0.6039216, 1, 0, 1,
-0.7232463, -1.108106, -4.531546, 0.5960785, 1, 0, 1,
-0.7227401, 1.779317, -0.84434, 0.5882353, 1, 0, 1,
-0.71957, 1.885385, 0.2822839, 0.5843138, 1, 0, 1,
-0.7134613, 0.260794, -1.028804, 0.5764706, 1, 0, 1,
-0.7080327, 0.8350161, -0.5230825, 0.572549, 1, 0, 1,
-0.7040607, 1.400423, -0.4447877, 0.5647059, 1, 0, 1,
-0.7008026, 0.2690043, -0.2086974, 0.5607843, 1, 0, 1,
-0.7004299, 1.718022, 1.367807, 0.5529412, 1, 0, 1,
-0.6994439, -0.6039656, -3.228024, 0.5490196, 1, 0, 1,
-0.6971153, 0.2222123, -2.635327, 0.5411765, 1, 0, 1,
-0.6961665, -1.799244, -2.92553, 0.5372549, 1, 0, 1,
-0.6945174, -1.324178, -3.612416, 0.5294118, 1, 0, 1,
-0.6931279, -0.4953754, -3.304292, 0.5254902, 1, 0, 1,
-0.6920567, 1.085823, -1.372249, 0.5176471, 1, 0, 1,
-0.6899301, 0.2674985, -0.6246992, 0.5137255, 1, 0, 1,
-0.6890556, -1.292102, -2.630005, 0.5058824, 1, 0, 1,
-0.687106, 0.6443058, -0.002739311, 0.5019608, 1, 0, 1,
-0.6833137, -0.2723608, -2.512889, 0.4941176, 1, 0, 1,
-0.6824778, -0.4272236, -2.790856, 0.4862745, 1, 0, 1,
-0.6819683, 0.3517251, 0.6113191, 0.4823529, 1, 0, 1,
-0.6763128, -0.7006925, -2.766792, 0.4745098, 1, 0, 1,
-0.6751636, -1.25721, -3.610343, 0.4705882, 1, 0, 1,
-0.6742592, -2.143997, -1.906119, 0.4627451, 1, 0, 1,
-0.6739179, -1.574733, -2.230958, 0.4588235, 1, 0, 1,
-0.6677648, 0.00414693, -3.859461, 0.4509804, 1, 0, 1,
-0.6671195, 0.5288177, -0.02077908, 0.4470588, 1, 0, 1,
-0.6658372, 1.414937, 0.5419517, 0.4392157, 1, 0, 1,
-0.6655997, -1.067554, -3.043849, 0.4352941, 1, 0, 1,
-0.6530814, -0.080387, 0.6437681, 0.427451, 1, 0, 1,
-0.6523626, 0.01649833, 0.3390476, 0.4235294, 1, 0, 1,
-0.6477219, -0.02368189, 0.3932327, 0.4156863, 1, 0, 1,
-0.6404641, -1.227961, -2.481761, 0.4117647, 1, 0, 1,
-0.6385615, -0.6053964, -2.091941, 0.4039216, 1, 0, 1,
-0.6332313, -0.2051964, -0.7641088, 0.3960784, 1, 0, 1,
-0.6330009, -0.3483414, -1.78094, 0.3921569, 1, 0, 1,
-0.6328502, 0.5308535, -1.696217, 0.3843137, 1, 0, 1,
-0.6310947, 0.07517798, -0.2061156, 0.3803922, 1, 0, 1,
-0.6299099, 0.9480688, -0.5168459, 0.372549, 1, 0, 1,
-0.6292475, 0.1001373, -1.304962, 0.3686275, 1, 0, 1,
-0.625334, -0.4611835, -0.7508269, 0.3607843, 1, 0, 1,
-0.6230269, 0.1269156, -1.543977, 0.3568628, 1, 0, 1,
-0.6209389, -0.1574074, -0.5065397, 0.3490196, 1, 0, 1,
-0.6161911, -1.147904, -2.47671, 0.345098, 1, 0, 1,
-0.6144633, 0.06963763, -2.231529, 0.3372549, 1, 0, 1,
-0.6095948, 0.02927836, -1.282398, 0.3333333, 1, 0, 1,
-0.6080406, -0.1633863, -1.75253, 0.3254902, 1, 0, 1,
-0.5932667, 0.3048, -0.5498861, 0.3215686, 1, 0, 1,
-0.5921665, 1.216467, -1.81134, 0.3137255, 1, 0, 1,
-0.5897871, 1.182619, -0.660664, 0.3098039, 1, 0, 1,
-0.5805196, -0.3239074, -1.727898, 0.3019608, 1, 0, 1,
-0.5719044, 0.1604078, 1.272867, 0.2941177, 1, 0, 1,
-0.5548674, 0.4341601, -1.570757, 0.2901961, 1, 0, 1,
-0.5534395, -0.1362906, -1.177352, 0.282353, 1, 0, 1,
-0.553318, -0.4490469, -0.04448468, 0.2784314, 1, 0, 1,
-0.5485846, -1.255936, -0.8727548, 0.2705882, 1, 0, 1,
-0.547116, 1.182908, -0.579577, 0.2666667, 1, 0, 1,
-0.5422266, 2.969379, -0.1752367, 0.2588235, 1, 0, 1,
-0.5417279, 0.0009445333, -0.9484809, 0.254902, 1, 0, 1,
-0.54127, 0.2975484, -1.472118, 0.2470588, 1, 0, 1,
-0.5388666, -0.08823477, -1.779728, 0.2431373, 1, 0, 1,
-0.5375534, 1.18699, 0.1952619, 0.2352941, 1, 0, 1,
-0.5350402, 0.2884905, -2.252668, 0.2313726, 1, 0, 1,
-0.5289851, 0.1340983, -2.386853, 0.2235294, 1, 0, 1,
-0.5235075, -0.961865, -3.83984, 0.2196078, 1, 0, 1,
-0.5229142, -0.6045411, -1.194102, 0.2117647, 1, 0, 1,
-0.5228697, 1.174275, 0.8088502, 0.2078431, 1, 0, 1,
-0.5204356, -0.6966754, -2.533725, 0.2, 1, 0, 1,
-0.5161247, -0.6924126, -0.472121, 0.1921569, 1, 0, 1,
-0.5137707, 1.350747, 0.1217626, 0.1882353, 1, 0, 1,
-0.5111679, -2.153261, -2.142034, 0.1803922, 1, 0, 1,
-0.5032597, -2.004419, -2.213866, 0.1764706, 1, 0, 1,
-0.5020152, 1.062215, 0.08530393, 0.1686275, 1, 0, 1,
-0.5010714, -0.03109483, -2.105358, 0.1647059, 1, 0, 1,
-0.5002087, -0.831811, -3.358183, 0.1568628, 1, 0, 1,
-0.4950658, -0.3049395, -0.09411857, 0.1529412, 1, 0, 1,
-0.4898791, 1.021262, -0.2635473, 0.145098, 1, 0, 1,
-0.4891491, -0.9835538, -2.295814, 0.1411765, 1, 0, 1,
-0.48491, 1.089997, 0.5373689, 0.1333333, 1, 0, 1,
-0.4820789, -0.1046977, 0.8328087, 0.1294118, 1, 0, 1,
-0.4781729, 0.5734403, -1.107477, 0.1215686, 1, 0, 1,
-0.4768955, 1.064958, -0.6568747, 0.1176471, 1, 0, 1,
-0.4764255, 1.545424, 0.1582643, 0.1098039, 1, 0, 1,
-0.4752874, -0.9053591, -2.184034, 0.1058824, 1, 0, 1,
-0.4752871, 0.8707728, -1.257129, 0.09803922, 1, 0, 1,
-0.4748686, -1.153925, -4.01714, 0.09019608, 1, 0, 1,
-0.4744423, 1.879593, -2.102005, 0.08627451, 1, 0, 1,
-0.4729827, 0.08947401, -1.319273, 0.07843138, 1, 0, 1,
-0.4726333, -0.8227259, -1.430084, 0.07450981, 1, 0, 1,
-0.4672356, -0.5078743, -2.106325, 0.06666667, 1, 0, 1,
-0.4629905, -0.4876282, -1.723932, 0.0627451, 1, 0, 1,
-0.4626657, -0.1119156, -0.6525084, 0.05490196, 1, 0, 1,
-0.4583875, 0.4721528, -0.6021485, 0.05098039, 1, 0, 1,
-0.4565866, 0.1357748, -1.809126, 0.04313726, 1, 0, 1,
-0.4531924, 0.3977684, -3.589776, 0.03921569, 1, 0, 1,
-0.4505787, 0.009758519, -3.437384, 0.03137255, 1, 0, 1,
-0.4487762, 0.4553979, -1.327623, 0.02745098, 1, 0, 1,
-0.4457617, -0.2387821, -0.163337, 0.01960784, 1, 0, 1,
-0.440333, 0.302603, -1.072789, 0.01568628, 1, 0, 1,
-0.4374485, -0.1217982, -1.927799, 0.007843138, 1, 0, 1,
-0.4361196, 0.5140598, -2.052254, 0.003921569, 1, 0, 1,
-0.4337925, 0.3447527, 0.4698886, 0, 1, 0.003921569, 1,
-0.4281655, -0.4092526, -1.126659, 0, 1, 0.01176471, 1,
-0.4277251, -1.038259, -2.196043, 0, 1, 0.01568628, 1,
-0.4259399, 0.6103364, 1.563108, 0, 1, 0.02352941, 1,
-0.4223615, 0.05119787, -2.610719, 0, 1, 0.02745098, 1,
-0.4207866, -0.2345259, -1.874102, 0, 1, 0.03529412, 1,
-0.4200974, 0.8365848, -1.067753, 0, 1, 0.03921569, 1,
-0.4185357, 0.1794, -1.00685, 0, 1, 0.04705882, 1,
-0.4181549, -0.2140233, -3.29209, 0, 1, 0.05098039, 1,
-0.413834, -0.6949313, -2.844748, 0, 1, 0.05882353, 1,
-0.4115033, 0.4177803, -1.054102, 0, 1, 0.0627451, 1,
-0.4108315, -0.4925118, -3.088991, 0, 1, 0.07058824, 1,
-0.4077806, 1.252588, 0.3495313, 0, 1, 0.07450981, 1,
-0.4013653, -0.06774699, -2.224529, 0, 1, 0.08235294, 1,
-0.3976305, 0.1419815, 0.9686692, 0, 1, 0.08627451, 1,
-0.3970565, -0.7991045, -3.11668, 0, 1, 0.09411765, 1,
-0.3899612, -0.938199, -1.021027, 0, 1, 0.1019608, 1,
-0.385157, -0.7695478, -2.130967, 0, 1, 0.1058824, 1,
-0.385156, 0.3940081, 1.267975, 0, 1, 0.1137255, 1,
-0.3803515, -0.6966531, -4.105053, 0, 1, 0.1176471, 1,
-0.3784632, 0.0401678, -0.4285795, 0, 1, 0.1254902, 1,
-0.3775555, -0.2528675, -1.773978, 0, 1, 0.1294118, 1,
-0.3745876, 2.032428, -2.389808, 0, 1, 0.1372549, 1,
-0.3741156, 0.9257314, -1.018502, 0, 1, 0.1411765, 1,
-0.3676423, -0.2472054, -3.063897, 0, 1, 0.1490196, 1,
-0.3675487, -0.7468351, -2.630817, 0, 1, 0.1529412, 1,
-0.3665806, 0.06883163, -1.695805, 0, 1, 0.1607843, 1,
-0.3657001, -1.641756, -4.052815, 0, 1, 0.1647059, 1,
-0.3642188, -0.942245, -3.12172, 0, 1, 0.172549, 1,
-0.364152, -0.1916709, -2.159289, 0, 1, 0.1764706, 1,
-0.3625591, -0.8176866, -3.397903, 0, 1, 0.1843137, 1,
-0.3593753, 1.314655, -2.090912, 0, 1, 0.1882353, 1,
-0.3589324, 1.470168, -0.2751818, 0, 1, 0.1960784, 1,
-0.3548715, -0.0751545, -1.452655, 0, 1, 0.2039216, 1,
-0.349752, 0.175235, -1.341147, 0, 1, 0.2078431, 1,
-0.3489977, -0.330946, -1.231264, 0, 1, 0.2156863, 1,
-0.3458236, -1.04328, -3.167993, 0, 1, 0.2196078, 1,
-0.3378681, 0.2787581, -1.333806, 0, 1, 0.227451, 1,
-0.3371961, -1.416233, -1.789312, 0, 1, 0.2313726, 1,
-0.3362893, 1.713208, -0.3847023, 0, 1, 0.2392157, 1,
-0.3348648, 0.0742924, -0.3254942, 0, 1, 0.2431373, 1,
-0.3321994, -0.6481197, -3.692734, 0, 1, 0.2509804, 1,
-0.3312479, -0.9598299, -0.8701184, 0, 1, 0.254902, 1,
-0.3251143, -0.3183918, -3.230887, 0, 1, 0.2627451, 1,
-0.3118129, -0.03984541, 0.3001485, 0, 1, 0.2666667, 1,
-0.3071895, -1.123632, -1.003836, 0, 1, 0.2745098, 1,
-0.3038204, 1.048212, 1.611113, 0, 1, 0.2784314, 1,
-0.3002802, 1.334561, -0.3138587, 0, 1, 0.2862745, 1,
-0.2980158, 0.7870473, -0.3438679, 0, 1, 0.2901961, 1,
-0.2942633, 0.8222767, -0.06936108, 0, 1, 0.2980392, 1,
-0.2930633, 0.8847516, -1.040499, 0, 1, 0.3058824, 1,
-0.289507, 1.948189, 1.575344, 0, 1, 0.3098039, 1,
-0.2757782, 0.8714967, -0.7316119, 0, 1, 0.3176471, 1,
-0.2737493, 0.6079744, 0.3404644, 0, 1, 0.3215686, 1,
-0.2631765, -0.1967717, -1.512316, 0, 1, 0.3294118, 1,
-0.2608461, -0.4702766, -2.168155, 0, 1, 0.3333333, 1,
-0.2601216, -0.2498199, -0.9369374, 0, 1, 0.3411765, 1,
-0.2590646, -1.68448, -1.986735, 0, 1, 0.345098, 1,
-0.2583217, 1.770166, 0.229579, 0, 1, 0.3529412, 1,
-0.2570648, 0.5343753, -0.6759812, 0, 1, 0.3568628, 1,
-0.2550911, 0.6652732, -0.6754977, 0, 1, 0.3647059, 1,
-0.2521802, -0.9963111, -2.478144, 0, 1, 0.3686275, 1,
-0.250522, 0.7703813, -0.6917235, 0, 1, 0.3764706, 1,
-0.2495269, 0.5607507, -1.675334, 0, 1, 0.3803922, 1,
-0.2474926, -1.676094, -1.684735, 0, 1, 0.3882353, 1,
-0.2471805, 0.3516942, -0.5253367, 0, 1, 0.3921569, 1,
-0.238911, -0.2984603, -1.790083, 0, 1, 0.4, 1,
-0.2379951, -1.764077, -3.195851, 0, 1, 0.4078431, 1,
-0.2359505, 0.7012465, 0.1211644, 0, 1, 0.4117647, 1,
-0.2346082, 0.6344551, -0.02177181, 0, 1, 0.4196078, 1,
-0.2270793, -0.5486938, -2.450466, 0, 1, 0.4235294, 1,
-0.2213505, 1.33183, 0.4941006, 0, 1, 0.4313726, 1,
-0.2159733, -0.3741937, -2.291646, 0, 1, 0.4352941, 1,
-0.2118054, -0.5958132, -2.738238, 0, 1, 0.4431373, 1,
-0.2107231, 0.2995492, -1.867003, 0, 1, 0.4470588, 1,
-0.2106247, 0.07835948, -2.022398, 0, 1, 0.454902, 1,
-0.2061883, -0.3627914, -1.191302, 0, 1, 0.4588235, 1,
-0.2060695, -0.4881491, -3.486176, 0, 1, 0.4666667, 1,
-0.2048988, -0.4509559, -1.831267, 0, 1, 0.4705882, 1,
-0.197338, 1.106415, -0.8575302, 0, 1, 0.4784314, 1,
-0.1949154, 1.639902, -0.2036746, 0, 1, 0.4823529, 1,
-0.1941857, -1.492455, -2.52593, 0, 1, 0.4901961, 1,
-0.1935101, -1.130024, -3.945194, 0, 1, 0.4941176, 1,
-0.1934016, -1.513377, -1.842799, 0, 1, 0.5019608, 1,
-0.192527, -0.8331611, -2.241606, 0, 1, 0.509804, 1,
-0.1902927, 2.208866, -0.07813877, 0, 1, 0.5137255, 1,
-0.1865977, 0.2996869, -0.7395594, 0, 1, 0.5215687, 1,
-0.1865162, -0.5647641, -1.522715, 0, 1, 0.5254902, 1,
-0.1806254, 1.248463, -0.07090752, 0, 1, 0.5333334, 1,
-0.175524, -1.763548, -2.658725, 0, 1, 0.5372549, 1,
-0.1737348, -0.4782521, -1.747337, 0, 1, 0.5450981, 1,
-0.1709349, 1.5171, 0.1968416, 0, 1, 0.5490196, 1,
-0.1680273, -0.4243716, -3.749202, 0, 1, 0.5568628, 1,
-0.1650499, 0.6564085, -0.9193378, 0, 1, 0.5607843, 1,
-0.1623468, -0.2486941, -2.915664, 0, 1, 0.5686275, 1,
-0.1526868, -0.2900151, -3.401391, 0, 1, 0.572549, 1,
-0.1522317, 0.4847432, -1.368509, 0, 1, 0.5803922, 1,
-0.1499811, -0.9725718, -3.972392, 0, 1, 0.5843138, 1,
-0.1451364, -2.696749, -3.355982, 0, 1, 0.5921569, 1,
-0.1450508, -0.452749, -2.732475, 0, 1, 0.5960785, 1,
-0.1391615, 0.2129237, 0.361677, 0, 1, 0.6039216, 1,
-0.1381078, -0.8260214, -2.683754, 0, 1, 0.6117647, 1,
-0.1370938, -0.8389165, -3.928675, 0, 1, 0.6156863, 1,
-0.1348703, 1.402199, -1.46399, 0, 1, 0.6235294, 1,
-0.1344986, 0.8166565, 0.02523427, 0, 1, 0.627451, 1,
-0.1336344, 0.2638298, -0.2241577, 0, 1, 0.6352941, 1,
-0.1330424, 0.6739985, -0.7753338, 0, 1, 0.6392157, 1,
-0.1329824, -0.6432248, -1.862068, 0, 1, 0.6470588, 1,
-0.1319975, 0.03020662, -1.010385, 0, 1, 0.6509804, 1,
-0.1318728, -0.9330068, -4.10692, 0, 1, 0.6588235, 1,
-0.1316551, 1.939373, -2.004271, 0, 1, 0.6627451, 1,
-0.1275882, 0.5086604, -0.5487711, 0, 1, 0.6705883, 1,
-0.1199035, 1.141221, -1.31022, 0, 1, 0.6745098, 1,
-0.1186103, -0.3679321, -2.768187, 0, 1, 0.682353, 1,
-0.1183901, 0.1523886, -1.110237, 0, 1, 0.6862745, 1,
-0.1161296, -0.7114415, -4.061676, 0, 1, 0.6941177, 1,
-0.1152209, -0.1248404, -3.734405, 0, 1, 0.7019608, 1,
-0.1145688, 0.6156815, 0.9447173, 0, 1, 0.7058824, 1,
-0.1135178, 0.4221523, -1.916624, 0, 1, 0.7137255, 1,
-0.1116509, 0.7420069, 0.02434989, 0, 1, 0.7176471, 1,
-0.1099372, -0.2995806, -2.474479, 0, 1, 0.7254902, 1,
-0.1096807, -1.924831, -2.836162, 0, 1, 0.7294118, 1,
-0.107968, 0.9017715, -1.080325, 0, 1, 0.7372549, 1,
-0.1075144, -0.5297618, -3.699758, 0, 1, 0.7411765, 1,
-0.09937555, 0.03175674, -2.303925, 0, 1, 0.7490196, 1,
-0.09184803, 0.6023317, -0.1789432, 0, 1, 0.7529412, 1,
-0.09068722, 1.278232, 0.08462377, 0, 1, 0.7607843, 1,
-0.08574085, 1.371194, 0.2107659, 0, 1, 0.7647059, 1,
-0.08079892, -0.932707, -5.20183, 0, 1, 0.772549, 1,
-0.07925748, 1.194968, 0.4644321, 0, 1, 0.7764706, 1,
-0.07833461, 0.4330426, 0.682959, 0, 1, 0.7843137, 1,
-0.06997301, -0.5543426, -2.566924, 0, 1, 0.7882353, 1,
-0.06708312, 0.5513211, -1.215203, 0, 1, 0.7960784, 1,
-0.06678391, 0.2629645, -0.6355717, 0, 1, 0.8039216, 1,
-0.06191682, -1.235425, -3.828402, 0, 1, 0.8078431, 1,
-0.06132529, 0.2136194, -1.066701, 0, 1, 0.8156863, 1,
-0.05678621, 1.017815, 1.623181, 0, 1, 0.8196079, 1,
-0.05571273, -0.8388129, -3.683161, 0, 1, 0.827451, 1,
-0.05520886, 0.839898, -1.947373, 0, 1, 0.8313726, 1,
-0.05505042, 0.708653, -1.294586, 0, 1, 0.8392157, 1,
-0.05416587, -1.365651, -5.69766, 0, 1, 0.8431373, 1,
-0.05182044, -2.448521, -2.839139, 0, 1, 0.8509804, 1,
-0.048258, -0.7258778, -3.905416, 0, 1, 0.854902, 1,
-0.03713259, 1.555258, -1.307747, 0, 1, 0.8627451, 1,
-0.03706956, -0.08213982, -1.86975, 0, 1, 0.8666667, 1,
-0.03417841, 0.3892296, -0.2665552, 0, 1, 0.8745098, 1,
-0.02730058, -0.9071044, -3.106716, 0, 1, 0.8784314, 1,
-0.02286911, 0.3795498, 1.395545, 0, 1, 0.8862745, 1,
-0.02113279, 1.617607, -0.705805, 0, 1, 0.8901961, 1,
-0.02078796, -1.928067, -4.771473, 0, 1, 0.8980392, 1,
-0.01845254, 0.031705, -1.511025, 0, 1, 0.9058824, 1,
-0.01816731, 0.3277211, 0.2411031, 0, 1, 0.9098039, 1,
-0.01673414, -0.4361745, -4.270389, 0, 1, 0.9176471, 1,
-0.01379986, 1.149593, -0.4348188, 0, 1, 0.9215686, 1,
-0.01043949, 1.247622, 0.90861, 0, 1, 0.9294118, 1,
-0.01026137, 1.787012, 0.804019, 0, 1, 0.9333333, 1,
-0.008788804, -1.00588, -2.459228, 0, 1, 0.9411765, 1,
-0.007642942, 0.3074647, 1.074743, 0, 1, 0.945098, 1,
-0.005569739, 1.17458, 0.5843141, 0, 1, 0.9529412, 1,
-0.004511176, -1.180281, -1.093574, 0, 1, 0.9568627, 1,
-0.003634254, -0.8963979, -3.981346, 0, 1, 0.9647059, 1,
-1.799583e-05, -0.5043612, -1.908412, 0, 1, 0.9686275, 1,
0.003653621, -0.779365, 3.343665, 0, 1, 0.9764706, 1,
0.004209378, -0.5473556, 4.98879, 0, 1, 0.9803922, 1,
0.009876523, -0.07194804, 2.868738, 0, 1, 0.9882353, 1,
0.01149631, -0.1775583, -0.03170516, 0, 1, 0.9921569, 1,
0.01646473, 0.6344296, 1.147707, 0, 1, 1, 1,
0.01652313, -0.5687874, 3.288155, 0, 0.9921569, 1, 1,
0.0216484, -2.716642, 2.222097, 0, 0.9882353, 1, 1,
0.02401317, -0.1957109, 2.429051, 0, 0.9803922, 1, 1,
0.02597233, -0.2474293, 1.004497, 0, 0.9764706, 1, 1,
0.02680548, 0.4189499, -0.229301, 0, 0.9686275, 1, 1,
0.02984144, 0.4799481, 0.8236739, 0, 0.9647059, 1, 1,
0.0315029, 0.5172877, 1.22343, 0, 0.9568627, 1, 1,
0.03398908, -0.07164487, 1.578907, 0, 0.9529412, 1, 1,
0.03420049, -2.255973, 3.45463, 0, 0.945098, 1, 1,
0.03458024, -0.1325723, 3.491439, 0, 0.9411765, 1, 1,
0.03516757, -1.034986, 2.563358, 0, 0.9333333, 1, 1,
0.03669801, -1.360855, 3.80227, 0, 0.9294118, 1, 1,
0.0419038, 0.9692162, 0.3232237, 0, 0.9215686, 1, 1,
0.04212869, -1.755279, 3.972946, 0, 0.9176471, 1, 1,
0.04319297, 0.4772327, -1.559971, 0, 0.9098039, 1, 1,
0.04398164, 0.8397818, -0.7845045, 0, 0.9058824, 1, 1,
0.04398769, -0.09164367, 1.193244, 0, 0.8980392, 1, 1,
0.0460933, -1.38747, 5.069443, 0, 0.8901961, 1, 1,
0.04631425, -0.4990741, 2.337931, 0, 0.8862745, 1, 1,
0.05086768, -0.9342186, 4.821507, 0, 0.8784314, 1, 1,
0.05234952, 0.8825014, -0.2455591, 0, 0.8745098, 1, 1,
0.05902757, -0.6947353, 2.696587, 0, 0.8666667, 1, 1,
0.05950432, 0.1564912, 1.932368, 0, 0.8627451, 1, 1,
0.06381596, 0.0287277, 0.9680647, 0, 0.854902, 1, 1,
0.06558561, -0.09063759, 2.526126, 0, 0.8509804, 1, 1,
0.06606253, 0.1874302, -0.6438934, 0, 0.8431373, 1, 1,
0.06937776, -1.42191, 3.827667, 0, 0.8392157, 1, 1,
0.07337631, 1.5017, 0.1097863, 0, 0.8313726, 1, 1,
0.07376661, -0.4810984, 4.271253, 0, 0.827451, 1, 1,
0.09154938, -0.8490519, 1.972151, 0, 0.8196079, 1, 1,
0.09941404, 3.30996, -0.09314564, 0, 0.8156863, 1, 1,
0.1031885, -0.4699685, 2.500035, 0, 0.8078431, 1, 1,
0.1062293, 0.3075591, -0.2231771, 0, 0.8039216, 1, 1,
0.106787, 0.9010562, 0.3535258, 0, 0.7960784, 1, 1,
0.1107811, 0.1032866, 1.314657, 0, 0.7882353, 1, 1,
0.1123128, 1.325313, 0.8194275, 0, 0.7843137, 1, 1,
0.1126283, 0.6056705, -0.1821454, 0, 0.7764706, 1, 1,
0.1186837, -0.2462477, 1.909519, 0, 0.772549, 1, 1,
0.122697, 1.315801, 0.4064077, 0, 0.7647059, 1, 1,
0.1264433, -2.623084, 3.312958, 0, 0.7607843, 1, 1,
0.1268517, -0.3401712, 2.851279, 0, 0.7529412, 1, 1,
0.1281069, -0.7979788, 1.497329, 0, 0.7490196, 1, 1,
0.1286144, 0.4802294, 1.558765, 0, 0.7411765, 1, 1,
0.1307994, 0.2213151, 2.769866, 0, 0.7372549, 1, 1,
0.1313244, -1.179592, 3.396082, 0, 0.7294118, 1, 1,
0.1348843, -0.8012071, 2.604858, 0, 0.7254902, 1, 1,
0.1368072, 0.2356669, 0.1966874, 0, 0.7176471, 1, 1,
0.1368539, 0.9559381, -0.5377205, 0, 0.7137255, 1, 1,
0.1375898, -0.3078876, 1.736814, 0, 0.7058824, 1, 1,
0.1433733, 0.7669294, 0.1543711, 0, 0.6980392, 1, 1,
0.1469611, 0.0103659, 0.7755418, 0, 0.6941177, 1, 1,
0.1473438, -1.360662, 2.917638, 0, 0.6862745, 1, 1,
0.1488426, 1.541105, 0.4271472, 0, 0.682353, 1, 1,
0.1498322, -0.07689311, 0.9280808, 0, 0.6745098, 1, 1,
0.1534842, -2.923999, 2.731814, 0, 0.6705883, 1, 1,
0.1559205, -1.46599, 2.251423, 0, 0.6627451, 1, 1,
0.1612096, -0.7997201, 2.907585, 0, 0.6588235, 1, 1,
0.1622986, 0.3801749, 1.374968, 0, 0.6509804, 1, 1,
0.1625657, 0.5643365, 0.2140541, 0, 0.6470588, 1, 1,
0.1628939, -0.08742724, 0.7007915, 0, 0.6392157, 1, 1,
0.1629968, 1.142611, 0.7137591, 0, 0.6352941, 1, 1,
0.1673663, 0.8398803, 1.111505, 0, 0.627451, 1, 1,
0.1703875, 0.9197984, 1.335413, 0, 0.6235294, 1, 1,
0.1793939, -0.8236069, 1.652526, 0, 0.6156863, 1, 1,
0.179735, -0.7116731, 2.391001, 0, 0.6117647, 1, 1,
0.1826313, -0.07861917, 3.910507, 0, 0.6039216, 1, 1,
0.1834863, 0.3263755, -0.7515496, 0, 0.5960785, 1, 1,
0.1898037, 0.9520239, 0.1542761, 0, 0.5921569, 1, 1,
0.1907127, 0.2353258, 0.9980593, 0, 0.5843138, 1, 1,
0.1942088, 1.522808, 0.8024911, 0, 0.5803922, 1, 1,
0.1970861, -0.4200551, 1.233535, 0, 0.572549, 1, 1,
0.2006551, -1.016251, 2.241436, 0, 0.5686275, 1, 1,
0.2055421, 1.324808, 0.7295456, 0, 0.5607843, 1, 1,
0.2087216, -1.539159, 3.714277, 0, 0.5568628, 1, 1,
0.2103532, 1.935636, -0.4283193, 0, 0.5490196, 1, 1,
0.210887, -0.1670246, 0.9453487, 0, 0.5450981, 1, 1,
0.2138032, -0.4021204, 3.888419, 0, 0.5372549, 1, 1,
0.2140054, 0.2131365, 0.2450941, 0, 0.5333334, 1, 1,
0.2158004, 0.04131437, 0.4802097, 0, 0.5254902, 1, 1,
0.2177159, 0.577711, 0.4626023, 0, 0.5215687, 1, 1,
0.219366, 0.172001, 0.7199885, 0, 0.5137255, 1, 1,
0.2258705, -0.02716248, 3.674439, 0, 0.509804, 1, 1,
0.2277313, 0.5156358, -1.434523, 0, 0.5019608, 1, 1,
0.2301762, -0.2482656, 1.843668, 0, 0.4941176, 1, 1,
0.2321735, 0.01060845, 1.365292, 0, 0.4901961, 1, 1,
0.2326745, 3.735914, -2.293517, 0, 0.4823529, 1, 1,
0.2349652, -0.5035902, 1.607112, 0, 0.4784314, 1, 1,
0.2383818, 0.8397301, 1.032407, 0, 0.4705882, 1, 1,
0.238428, 0.325769, 2.236916, 0, 0.4666667, 1, 1,
0.2433048, 1.293758, 0.9656481, 0, 0.4588235, 1, 1,
0.243482, -2.175293, 3.498713, 0, 0.454902, 1, 1,
0.2458516, 1.04236, 1.245304, 0, 0.4470588, 1, 1,
0.2466166, -0.8566673, 2.696604, 0, 0.4431373, 1, 1,
0.2488494, -0.6516342, 3.923545, 0, 0.4352941, 1, 1,
0.2490896, 0.3368854, -1.885232, 0, 0.4313726, 1, 1,
0.2504565, -0.01171028, 2.065336, 0, 0.4235294, 1, 1,
0.2530176, -0.6172806, 3.734675, 0, 0.4196078, 1, 1,
0.2532879, -0.853346, 2.55596, 0, 0.4117647, 1, 1,
0.2564624, -0.8702636, 4.030038, 0, 0.4078431, 1, 1,
0.256695, 0.2097651, 0.03596255, 0, 0.4, 1, 1,
0.2576897, -0.5895231, 2.660455, 0, 0.3921569, 1, 1,
0.2638045, 0.8792699, -0.5767717, 0, 0.3882353, 1, 1,
0.2683637, -0.3087791, -0.06830843, 0, 0.3803922, 1, 1,
0.2690834, 0.8982195, 2.189266, 0, 0.3764706, 1, 1,
0.2691628, 0.8051031, -0.1077026, 0, 0.3686275, 1, 1,
0.2697822, 0.8715178, 0.8949847, 0, 0.3647059, 1, 1,
0.2743957, 0.8942761, -0.1649091, 0, 0.3568628, 1, 1,
0.2808159, -1.880457, 3.249287, 0, 0.3529412, 1, 1,
0.2825115, 0.211868, 0.5177498, 0, 0.345098, 1, 1,
0.285821, 0.1060205, 0.8161042, 0, 0.3411765, 1, 1,
0.2872543, -0.1555516, 1.52722, 0, 0.3333333, 1, 1,
0.2893876, 0.6006602, 2.227746, 0, 0.3294118, 1, 1,
0.2904546, -0.4719361, 3.341156, 0, 0.3215686, 1, 1,
0.2945397, -0.7022465, 2.244556, 0, 0.3176471, 1, 1,
0.2958835, -2.009972, 3.202863, 0, 0.3098039, 1, 1,
0.3010105, 0.8958557, 1.296941, 0, 0.3058824, 1, 1,
0.3029153, -1.335627, 3.816641, 0, 0.2980392, 1, 1,
0.3032254, 0.05756416, 0.4412526, 0, 0.2901961, 1, 1,
0.3051781, -0.420073, 2.692218, 0, 0.2862745, 1, 1,
0.3053013, -0.7755335, 3.734208, 0, 0.2784314, 1, 1,
0.3061155, -1.218924, 3.35925, 0, 0.2745098, 1, 1,
0.3073587, -1.880891, 4.453165, 0, 0.2666667, 1, 1,
0.3125705, -0.1899467, 1.960068, 0, 0.2627451, 1, 1,
0.3184979, 0.561559, 0.1549386, 0, 0.254902, 1, 1,
0.3191577, -0.3063113, 1.367762, 0, 0.2509804, 1, 1,
0.3241211, 0.1904826, -0.1990342, 0, 0.2431373, 1, 1,
0.3248061, 1.477413, -0.06530397, 0, 0.2392157, 1, 1,
0.3303525, -0.5699638, 2.739676, 0, 0.2313726, 1, 1,
0.3314018, 1.397169, 0.168262, 0, 0.227451, 1, 1,
0.3315596, -0.3097515, 1.050573, 0, 0.2196078, 1, 1,
0.3316224, 0.2374403, 1.086222, 0, 0.2156863, 1, 1,
0.3338808, -0.7704045, 2.422804, 0, 0.2078431, 1, 1,
0.3339533, -0.6478081, 3.521952, 0, 0.2039216, 1, 1,
0.3362076, -0.8870257, 1.078689, 0, 0.1960784, 1, 1,
0.3403667, -0.4462632, 2.172103, 0, 0.1882353, 1, 1,
0.3415173, 0.8317991, 0.2555207, 0, 0.1843137, 1, 1,
0.3421551, 0.3203025, 1.085945, 0, 0.1764706, 1, 1,
0.3427557, 0.2808051, 2.043887, 0, 0.172549, 1, 1,
0.3428557, 0.5394959, -0.05238898, 0, 0.1647059, 1, 1,
0.3446752, 0.4664922, 3.198654, 0, 0.1607843, 1, 1,
0.34555, 0.5515903, 0.5754236, 0, 0.1529412, 1, 1,
0.350122, 0.1107655, 1.499665, 0, 0.1490196, 1, 1,
0.3501584, 2.226338, 1.625873, 0, 0.1411765, 1, 1,
0.3518171, -0.7906348, 2.49244, 0, 0.1372549, 1, 1,
0.3572443, -0.4894093, 2.890671, 0, 0.1294118, 1, 1,
0.3576244, 0.7345704, 0.5657455, 0, 0.1254902, 1, 1,
0.3580437, 0.4403954, 0.9345381, 0, 0.1176471, 1, 1,
0.3610769, -1.151943, 2.786473, 0, 0.1137255, 1, 1,
0.3651421, 0.2857661, 0.0530143, 0, 0.1058824, 1, 1,
0.3661585, 1.486824, 0.04697101, 0, 0.09803922, 1, 1,
0.3691252, 0.9311672, 0.6933999, 0, 0.09411765, 1, 1,
0.3701333, -0.6215456, 3.874277, 0, 0.08627451, 1, 1,
0.3816576, 0.370704, 1.923666, 0, 0.08235294, 1, 1,
0.3818174, -0.3591619, 1.565482, 0, 0.07450981, 1, 1,
0.3847461, 1.219624, -0.1003231, 0, 0.07058824, 1, 1,
0.3893818, 0.2723546, 0.7357114, 0, 0.0627451, 1, 1,
0.3910973, -0.3584509, 2.115894, 0, 0.05882353, 1, 1,
0.3930459, 1.618017, -0.7425831, 0, 0.05098039, 1, 1,
0.3963292, -0.521395, 0.9770839, 0, 0.04705882, 1, 1,
0.396482, 0.5428677, -0.5852147, 0, 0.03921569, 1, 1,
0.4011131, 0.6925295, 0.6813284, 0, 0.03529412, 1, 1,
0.4060266, -0.6447838, 2.424593, 0, 0.02745098, 1, 1,
0.4073524, -0.5350243, 2.289301, 0, 0.02352941, 1, 1,
0.4110457, 2.174956, -0.159598, 0, 0.01568628, 1, 1,
0.4172575, 2.058211, 1.853436, 0, 0.01176471, 1, 1,
0.4197241, 0.7430201, 2.210983, 0, 0.003921569, 1, 1,
0.4211328, 0.1657611, 1.756044, 0.003921569, 0, 1, 1,
0.4244014, 0.7538985, 0.9670988, 0.007843138, 0, 1, 1,
0.4251956, 0.4950506, 1.315516, 0.01568628, 0, 1, 1,
0.4305798, 1.371476, -0.6075112, 0.01960784, 0, 1, 1,
0.4345417, 0.09781469, 2.549691, 0.02745098, 0, 1, 1,
0.4395428, 1.252644, 2.184466, 0.03137255, 0, 1, 1,
0.4420092, 0.821307, 0.8762098, 0.03921569, 0, 1, 1,
0.4432815, -1.811014, 3.21531, 0.04313726, 0, 1, 1,
0.4460005, -1.260672, 3.522333, 0.05098039, 0, 1, 1,
0.446799, 2.054731, -2.084397, 0.05490196, 0, 1, 1,
0.4555866, 1.555121, 1.404289, 0.0627451, 0, 1, 1,
0.457203, 1.032753, 0.4909371, 0.06666667, 0, 1, 1,
0.4575154, -1.031246, 3.131652, 0.07450981, 0, 1, 1,
0.4617084, -1.079975, 2.989466, 0.07843138, 0, 1, 1,
0.466502, -0.3822803, 1.24659, 0.08627451, 0, 1, 1,
0.4696625, -1.329059, 0.9299577, 0.09019608, 0, 1, 1,
0.4704128, -0.8803228, 3.546558, 0.09803922, 0, 1, 1,
0.4713219, 0.2535075, 1.856422, 0.1058824, 0, 1, 1,
0.4729283, -0.1233237, 1.747827, 0.1098039, 0, 1, 1,
0.4763789, -0.6864974, 1.696563, 0.1176471, 0, 1, 1,
0.4773708, 0.8714719, 0.6925389, 0.1215686, 0, 1, 1,
0.4775103, 0.8120868, -2.208761, 0.1294118, 0, 1, 1,
0.4812811, -0.7576263, 3.995357, 0.1333333, 0, 1, 1,
0.4840087, 0.9994659, 2.107593, 0.1411765, 0, 1, 1,
0.4854287, -0.264856, 2.749121, 0.145098, 0, 1, 1,
0.4876269, -0.195573, 2.267207, 0.1529412, 0, 1, 1,
0.4889771, 0.4427143, 1.453055, 0.1568628, 0, 1, 1,
0.493783, -1.517733, 3.015902, 0.1647059, 0, 1, 1,
0.4985477, 0.05198477, 0.8165066, 0.1686275, 0, 1, 1,
0.5002696, -1.383349, 3.126089, 0.1764706, 0, 1, 1,
0.5006162, -0.8860563, 0.6277139, 0.1803922, 0, 1, 1,
0.5037232, -0.1289359, 3.340613, 0.1882353, 0, 1, 1,
0.5141037, 0.3242686, 1.80707, 0.1921569, 0, 1, 1,
0.5167004, -1.198127, 3.791255, 0.2, 0, 1, 1,
0.5167472, -0.006108426, 3.049826, 0.2078431, 0, 1, 1,
0.5227162, -0.09842034, 0.9719406, 0.2117647, 0, 1, 1,
0.5228497, 0.3151522, 0.5633405, 0.2196078, 0, 1, 1,
0.5237147, 0.1865961, -1.476817, 0.2235294, 0, 1, 1,
0.5239192, -2.56904, 4.135636, 0.2313726, 0, 1, 1,
0.5272871, -0.4752603, 1.046426, 0.2352941, 0, 1, 1,
0.5292225, 0.1013362, 1.029471, 0.2431373, 0, 1, 1,
0.5339985, 0.03598206, 0.5450039, 0.2470588, 0, 1, 1,
0.5356313, 0.253779, 0.8298708, 0.254902, 0, 1, 1,
0.539812, -0.1375988, 2.021769, 0.2588235, 0, 1, 1,
0.542634, 0.3093683, 0.6989506, 0.2666667, 0, 1, 1,
0.5452966, 1.687696, -0.8747988, 0.2705882, 0, 1, 1,
0.5456989, 1.934996, 2.042389, 0.2784314, 0, 1, 1,
0.5523647, -1.867032, 3.389484, 0.282353, 0, 1, 1,
0.5595525, -0.2521265, 1.063735, 0.2901961, 0, 1, 1,
0.5606234, 0.3280283, 0.3446061, 0.2941177, 0, 1, 1,
0.5630707, 1.339286, 0.9852127, 0.3019608, 0, 1, 1,
0.56356, -0.6193706, 3.540093, 0.3098039, 0, 1, 1,
0.5641415, -0.1772457, 1.108361, 0.3137255, 0, 1, 1,
0.5698406, -0.6632178, 2.922784, 0.3215686, 0, 1, 1,
0.574407, -2.337592, 3.008183, 0.3254902, 0, 1, 1,
0.5761093, 1.718014, -0.08723555, 0.3333333, 0, 1, 1,
0.5808966, 0.2016356, 1.527271, 0.3372549, 0, 1, 1,
0.5836076, 0.1996664, 2.224715, 0.345098, 0, 1, 1,
0.5843791, -0.8108346, 2.513914, 0.3490196, 0, 1, 1,
0.5868015, -0.579066, 3.535356, 0.3568628, 0, 1, 1,
0.587231, 1.736102, -0.5118935, 0.3607843, 0, 1, 1,
0.5890577, 0.3098583, 3.420488, 0.3686275, 0, 1, 1,
0.596448, -1.0494, 0.3453321, 0.372549, 0, 1, 1,
0.5971897, -1.977425, 2.359616, 0.3803922, 0, 1, 1,
0.6016669, -1.051834, 0.563407, 0.3843137, 0, 1, 1,
0.6122371, -0.08610665, 1.654852, 0.3921569, 0, 1, 1,
0.6130989, 0.1459911, -0.5548239, 0.3960784, 0, 1, 1,
0.6167226, -1.172616, 2.37909, 0.4039216, 0, 1, 1,
0.6191879, -0.03768634, 2.790124, 0.4117647, 0, 1, 1,
0.6315243, 1.161788, -0.2256154, 0.4156863, 0, 1, 1,
0.632964, -1.615913, 2.628438, 0.4235294, 0, 1, 1,
0.633062, -0.8018812, 0.7714255, 0.427451, 0, 1, 1,
0.6357011, -1.253023, 2.276642, 0.4352941, 0, 1, 1,
0.6473333, -0.763561, 1.417753, 0.4392157, 0, 1, 1,
0.6477433, 0.7495372, -1.308869, 0.4470588, 0, 1, 1,
0.6516063, 1.347051, 1.149576, 0.4509804, 0, 1, 1,
0.6578659, -0.2324212, 1.692104, 0.4588235, 0, 1, 1,
0.6633613, 0.5788884, 1.111023, 0.4627451, 0, 1, 1,
0.664207, -0.05150553, 0.8538334, 0.4705882, 0, 1, 1,
0.6686695, 0.06924263, 2.816754, 0.4745098, 0, 1, 1,
0.6762581, 0.7086897, -0.6750137, 0.4823529, 0, 1, 1,
0.6773276, 0.2054787, 0.4352494, 0.4862745, 0, 1, 1,
0.6796637, -2.566137, 1.241164, 0.4941176, 0, 1, 1,
0.6812956, 0.4626174, 1.260745, 0.5019608, 0, 1, 1,
0.6863687, -0.1743507, 2.859969, 0.5058824, 0, 1, 1,
0.6909118, -0.583927, 3.373103, 0.5137255, 0, 1, 1,
0.6951163, -0.4981606, 3.247796, 0.5176471, 0, 1, 1,
0.6961798, 0.05250243, 2.028723, 0.5254902, 0, 1, 1,
0.7013673, 0.7713803, 1.710803, 0.5294118, 0, 1, 1,
0.7020599, -0.2952437, 0.930505, 0.5372549, 0, 1, 1,
0.7028225, -1.510427, 3.120987, 0.5411765, 0, 1, 1,
0.7076777, 0.01403515, 2.746259, 0.5490196, 0, 1, 1,
0.7094606, 0.9799598, 1.232323, 0.5529412, 0, 1, 1,
0.7127898, 1.756934, 0.359991, 0.5607843, 0, 1, 1,
0.7176556, -1.008427, 1.798141, 0.5647059, 0, 1, 1,
0.7185572, 0.6812409, -1.011002, 0.572549, 0, 1, 1,
0.7223196, -0.5234947, 2.721002, 0.5764706, 0, 1, 1,
0.7233745, 0.6474179, -0.5053787, 0.5843138, 0, 1, 1,
0.7254712, -1.252354, 2.495239, 0.5882353, 0, 1, 1,
0.7274072, -0.1662895, 1.142325, 0.5960785, 0, 1, 1,
0.7332714, -0.7866222, 3.234936, 0.6039216, 0, 1, 1,
0.7372134, 0.6229191, 0.04530499, 0.6078432, 0, 1, 1,
0.7440341, -1.012958, 3.723804, 0.6156863, 0, 1, 1,
0.7491789, 0.8675513, 0.4255036, 0.6196079, 0, 1, 1,
0.7512067, 0.103804, 1.840739, 0.627451, 0, 1, 1,
0.7541932, 0.08616579, 0.8067724, 0.6313726, 0, 1, 1,
0.7615712, -0.5042218, 1.600233, 0.6392157, 0, 1, 1,
0.7640008, -1.184703, 1.716976, 0.6431373, 0, 1, 1,
0.7649723, -1.546277, 2.74974, 0.6509804, 0, 1, 1,
0.7687903, 0.3532347, 0.854511, 0.654902, 0, 1, 1,
0.7692711, -0.396873, 2.650396, 0.6627451, 0, 1, 1,
0.7720581, -1.260509, 1.513262, 0.6666667, 0, 1, 1,
0.7798679, -0.7005832, 1.205445, 0.6745098, 0, 1, 1,
0.7809208, 0.1006295, 2.479453, 0.6784314, 0, 1, 1,
0.7811354, -0.5945765, -0.2679728, 0.6862745, 0, 1, 1,
0.7823946, 0.1685111, 0.6177068, 0.6901961, 0, 1, 1,
0.7890347, 1.917317, 0.09052616, 0.6980392, 0, 1, 1,
0.7895904, 1.442734, 1.219067, 0.7058824, 0, 1, 1,
0.7924673, -1.060144, 2.510171, 0.7098039, 0, 1, 1,
0.7936482, 2.430626, 1.641204, 0.7176471, 0, 1, 1,
0.7944914, -0.3804893, 1.671193, 0.7215686, 0, 1, 1,
0.7964091, -1.033284, 3.113446, 0.7294118, 0, 1, 1,
0.7984057, -0.4727024, 2.792596, 0.7333333, 0, 1, 1,
0.8011026, -2.100076, 0.5135937, 0.7411765, 0, 1, 1,
0.8063838, 0.67675, 1.512901, 0.7450981, 0, 1, 1,
0.8106326, -1.654802, 3.568979, 0.7529412, 0, 1, 1,
0.821409, 0.2992278, 1.709495, 0.7568628, 0, 1, 1,
0.8225631, 1.495367, 1.874446, 0.7647059, 0, 1, 1,
0.827115, -0.3241058, 2.051813, 0.7686275, 0, 1, 1,
0.8275486, -1.521822, 3.398843, 0.7764706, 0, 1, 1,
0.8289297, -0.9157678, 1.558696, 0.7803922, 0, 1, 1,
0.8309559, 0.9223336, 3.517798, 0.7882353, 0, 1, 1,
0.8371532, 0.2415159, 0.2267651, 0.7921569, 0, 1, 1,
0.8420475, 0.4358279, 1.211449, 0.8, 0, 1, 1,
0.844084, 1.025114, -0.7979019, 0.8078431, 0, 1, 1,
0.8506176, -1.833433, 1.966807, 0.8117647, 0, 1, 1,
0.8541801, -0.6185175, 2.691768, 0.8196079, 0, 1, 1,
0.8586226, -1.142751, 2.341146, 0.8235294, 0, 1, 1,
0.8677001, 0.3133435, 1.915009, 0.8313726, 0, 1, 1,
0.8698806, 0.777953, 0.9120542, 0.8352941, 0, 1, 1,
0.8714242, -0.2417521, 1.601484, 0.8431373, 0, 1, 1,
0.879329, 0.5848278, 0.8444387, 0.8470588, 0, 1, 1,
0.893272, 1.05728, 2.825202, 0.854902, 0, 1, 1,
0.8960813, -0.2054806, 1.755688, 0.8588235, 0, 1, 1,
0.8968342, 1.239704, 0.7584795, 0.8666667, 0, 1, 1,
0.9010962, 3.005512, -0.6270531, 0.8705882, 0, 1, 1,
0.9029899, -0.8741367, 1.917456, 0.8784314, 0, 1, 1,
0.9073047, -1.258996, 3.869464, 0.8823529, 0, 1, 1,
0.9112781, 0.8202732, 0.9890975, 0.8901961, 0, 1, 1,
0.9135605, 0.05503889, 3.295293, 0.8941177, 0, 1, 1,
0.9143121, 1.136604, 0.9215655, 0.9019608, 0, 1, 1,
0.915668, -0.6725926, 3.925807, 0.9098039, 0, 1, 1,
0.9264523, -0.3009462, 2.074998, 0.9137255, 0, 1, 1,
0.9296936, 0.05360177, 0.8384607, 0.9215686, 0, 1, 1,
0.9300552, -0.3766625, 1.1824, 0.9254902, 0, 1, 1,
0.938031, 0.7849562, 2.018079, 0.9333333, 0, 1, 1,
0.9419706, 1.585959, 0.3697236, 0.9372549, 0, 1, 1,
0.9430292, -0.08917061, 2.670961, 0.945098, 0, 1, 1,
0.9435033, -1.066845, 1.558172, 0.9490196, 0, 1, 1,
0.9561587, -0.2675796, 2.694119, 0.9568627, 0, 1, 1,
0.9601525, -0.5051097, 1.816936, 0.9607843, 0, 1, 1,
0.9607401, 1.421706, -1.124257, 0.9686275, 0, 1, 1,
0.9652259, -0.02106119, 1.726595, 0.972549, 0, 1, 1,
0.9683688, 2.073889, 0.2967092, 0.9803922, 0, 1, 1,
0.9689094, 0.9261032, 1.444764, 0.9843137, 0, 1, 1,
0.971527, -0.06966144, 1.704386, 0.9921569, 0, 1, 1,
0.9786918, 0.3873163, -0.1653789, 0.9960784, 0, 1, 1,
0.9813753, 0.4226444, 0.5392889, 1, 0, 0.9960784, 1,
0.9813798, -1.565779, 2.635023, 1, 0, 0.9882353, 1,
0.983354, 0.8770163, -0.2369713, 1, 0, 0.9843137, 1,
0.9844716, 0.5730528, 1.342593, 1, 0, 0.9764706, 1,
0.9845065, 3.03311, 0.1812198, 1, 0, 0.972549, 1,
0.9846638, -0.7358128, 1.952317, 1, 0, 0.9647059, 1,
0.9853231, 0.06518037, 1.941193, 1, 0, 0.9607843, 1,
0.9885588, -0.2921224, 0.9961417, 1, 0, 0.9529412, 1,
0.9936637, 0.8059142, 0.8572883, 1, 0, 0.9490196, 1,
1.008947, -0.5974645, 0.9991099, 1, 0, 0.9411765, 1,
1.009876, -0.7288834, 3.074935, 1, 0, 0.9372549, 1,
1.016242, -0.5026951, 2.427897, 1, 0, 0.9294118, 1,
1.02356, -0.6969803, 3.076718, 1, 0, 0.9254902, 1,
1.023854, 0.1305918, 3.212238, 1, 0, 0.9176471, 1,
1.027253, -1.679308, 3.93381, 1, 0, 0.9137255, 1,
1.02972, 0.6707756, 1.448193, 1, 0, 0.9058824, 1,
1.03283, -1.273181, 1.527232, 1, 0, 0.9019608, 1,
1.041595, 1.292981, 0.02931392, 1, 0, 0.8941177, 1,
1.043463, 0.5137991, 1.909686, 1, 0, 0.8862745, 1,
1.044252, -0.7243271, 1.869358, 1, 0, 0.8823529, 1,
1.04918, -2.326479, 3.555405, 1, 0, 0.8745098, 1,
1.052261, 0.525028, 1.938734, 1, 0, 0.8705882, 1,
1.052521, 0.4373936, 0.5375969, 1, 0, 0.8627451, 1,
1.052669, 0.2433327, 2.368381, 1, 0, 0.8588235, 1,
1.057176, -1.597999, 1.85994, 1, 0, 0.8509804, 1,
1.057509, -1.673819, 2.602703, 1, 0, 0.8470588, 1,
1.058755, 0.2744712, 1.21598, 1, 0, 0.8392157, 1,
1.064936, 1.529561, 1.194833, 1, 0, 0.8352941, 1,
1.066526, 0.2843303, 2.200876, 1, 0, 0.827451, 1,
1.071918, -0.4804657, 1.699904, 1, 0, 0.8235294, 1,
1.074034, 0.005570474, 1.795681, 1, 0, 0.8156863, 1,
1.07714, -0.5092506, 1.837593, 1, 0, 0.8117647, 1,
1.084361, 1.873433, 0.241251, 1, 0, 0.8039216, 1,
1.086738, -1.393155, 2.379913, 1, 0, 0.7960784, 1,
1.09692, 1.603584, -0.5058033, 1, 0, 0.7921569, 1,
1.097343, 0.3222041, -0.02901393, 1, 0, 0.7843137, 1,
1.104444, 0.1841226, 1.210784, 1, 0, 0.7803922, 1,
1.10516, -0.2422292, 2.651649, 1, 0, 0.772549, 1,
1.105975, 0.08190033, 2.746805, 1, 0, 0.7686275, 1,
1.109667, 0.356884, 1.232311, 1, 0, 0.7607843, 1,
1.112698, 0.5358942, -0.493734, 1, 0, 0.7568628, 1,
1.113266, 0.990958, 0.3991151, 1, 0, 0.7490196, 1,
1.116556, -0.5861011, 3.745454, 1, 0, 0.7450981, 1,
1.118812, -1.527369, 2.933478, 1, 0, 0.7372549, 1,
1.120322, -1.291114, 2.892715, 1, 0, 0.7333333, 1,
1.121424, 0.2262791, 1.980329, 1, 0, 0.7254902, 1,
1.12291, -0.6201032, 2.197289, 1, 0, 0.7215686, 1,
1.124218, -1.78139, 3.247767, 1, 0, 0.7137255, 1,
1.127412, -0.2423182, -0.3321521, 1, 0, 0.7098039, 1,
1.137288, -1.107041, 3.605687, 1, 0, 0.7019608, 1,
1.137762, -0.4340682, 0.9018694, 1, 0, 0.6941177, 1,
1.140101, -0.9040495, 2.856733, 1, 0, 0.6901961, 1,
1.151808, -0.8848355, 2.172019, 1, 0, 0.682353, 1,
1.152038, -0.9550235, 3.147785, 1, 0, 0.6784314, 1,
1.16162, 0.5399343, 1.954436, 1, 0, 0.6705883, 1,
1.173641, -0.3858852, 1.143891, 1, 0, 0.6666667, 1,
1.174551, 0.7368127, 1.458386, 1, 0, 0.6588235, 1,
1.182807, -0.5440095, 1.594445, 1, 0, 0.654902, 1,
1.182837, 0.4762291, -0.02518449, 1, 0, 0.6470588, 1,
1.184193, -0.7853613, 2.808086, 1, 0, 0.6431373, 1,
1.185352, 0.6353632, 1.243449, 1, 0, 0.6352941, 1,
1.186483, 1.994474, 2.924078, 1, 0, 0.6313726, 1,
1.186802, -0.4998103, 1.236152, 1, 0, 0.6235294, 1,
1.187685, -0.5405011, 3.261164, 1, 0, 0.6196079, 1,
1.195656, -0.4068766, 2.522277, 1, 0, 0.6117647, 1,
1.19664, 1.251987, 0.8822812, 1, 0, 0.6078432, 1,
1.202893, 1.534329, 2.374761, 1, 0, 0.6, 1,
1.203492, -1.263035, 2.821537, 1, 0, 0.5921569, 1,
1.204925, 0.71689, 1.885803, 1, 0, 0.5882353, 1,
1.207988, 0.248931, 1.504304, 1, 0, 0.5803922, 1,
1.208976, -0.0836727, -0.185465, 1, 0, 0.5764706, 1,
1.214208, -1.119741, 1.440105, 1, 0, 0.5686275, 1,
1.222742, 0.3794244, 1.791211, 1, 0, 0.5647059, 1,
1.234201, -0.1475738, 1.191623, 1, 0, 0.5568628, 1,
1.242078, -3.587038, 2.685173, 1, 0, 0.5529412, 1,
1.243266, 0.4726864, 1.501738, 1, 0, 0.5450981, 1,
1.25428, 0.8980782, 0.8045737, 1, 0, 0.5411765, 1,
1.259519, 1.085664, -1.217318, 1, 0, 0.5333334, 1,
1.259797, 0.005714487, -0.5594476, 1, 0, 0.5294118, 1,
1.269169, -0.4316125, 1.110608, 1, 0, 0.5215687, 1,
1.271721, 0.6770927, -0.841125, 1, 0, 0.5176471, 1,
1.272316, 0.4222648, 2.098141, 1, 0, 0.509804, 1,
1.272893, 0.2710295, 0.5777667, 1, 0, 0.5058824, 1,
1.276264, 2.934449, 0.4297436, 1, 0, 0.4980392, 1,
1.279006, 1.230716, -0.2839524, 1, 0, 0.4901961, 1,
1.295406, -0.6115981, 1.374285, 1, 0, 0.4862745, 1,
1.300267, -1.352684, 4.069006, 1, 0, 0.4784314, 1,
1.302925, -0.7620376, 3.222482, 1, 0, 0.4745098, 1,
1.313262, -0.8575594, 1.143212, 1, 0, 0.4666667, 1,
1.319553, -0.4788958, 3.626043, 1, 0, 0.4627451, 1,
1.325136, 1.780119, -0.05048814, 1, 0, 0.454902, 1,
1.326363, 1.959282, 0.8584952, 1, 0, 0.4509804, 1,
1.353015, 1.067789, -0.8542456, 1, 0, 0.4431373, 1,
1.359599, -1.209037, 3.458993, 1, 0, 0.4392157, 1,
1.363757, 1.022309, 0.8759773, 1, 0, 0.4313726, 1,
1.378138, 0.534824, 0.7982917, 1, 0, 0.427451, 1,
1.396261, -0.1701192, 2.050211, 1, 0, 0.4196078, 1,
1.410253, 0.2952004, 0.6758096, 1, 0, 0.4156863, 1,
1.424286, 0.5014503, 1.193862, 1, 0, 0.4078431, 1,
1.437361, 0.2148762, 3.517163, 1, 0, 0.4039216, 1,
1.441808, -1.159919, 3.1572, 1, 0, 0.3960784, 1,
1.454587, 0.5200725, 0.2713516, 1, 0, 0.3882353, 1,
1.457713, 0.07961069, 2.3929, 1, 0, 0.3843137, 1,
1.468475, 2.383426, -0.09549391, 1, 0, 0.3764706, 1,
1.471071, 0.1230517, 0.991751, 1, 0, 0.372549, 1,
1.474068, 0.003461137, 1.924186, 1, 0, 0.3647059, 1,
1.476881, 0.5768983, 3.978823, 1, 0, 0.3607843, 1,
1.479521, 0.7721872, 0.06106268, 1, 0, 0.3529412, 1,
1.488903, 0.2818115, 1.274883, 1, 0, 0.3490196, 1,
1.49985, -1.210173, 0.2564384, 1, 0, 0.3411765, 1,
1.501063, -0.1864201, 2.539444, 1, 0, 0.3372549, 1,
1.510926, 1.626856, 1.764797, 1, 0, 0.3294118, 1,
1.514151, -0.1587639, 0.7420948, 1, 0, 0.3254902, 1,
1.521133, 1.111281, 1.291193, 1, 0, 0.3176471, 1,
1.523079, -0.5696092, 1.67653, 1, 0, 0.3137255, 1,
1.526744, -1.918282, 1.479991, 1, 0, 0.3058824, 1,
1.528937, -0.6455472, 2.683548, 1, 0, 0.2980392, 1,
1.529718, 1.522232, 1.791719, 1, 0, 0.2941177, 1,
1.530681, 0.4280123, 0.4215065, 1, 0, 0.2862745, 1,
1.564755, -0.7284234, 1.350909, 1, 0, 0.282353, 1,
1.5671, -0.797717, -0.05308241, 1, 0, 0.2745098, 1,
1.577285, -0.5454084, 1.655001, 1, 0, 0.2705882, 1,
1.596268, -0.3048876, -0.4747468, 1, 0, 0.2627451, 1,
1.622483, -2.016014, 2.563373, 1, 0, 0.2588235, 1,
1.628029, -0.9156868, 2.245136, 1, 0, 0.2509804, 1,
1.628369, 0.1261621, 0.09752165, 1, 0, 0.2470588, 1,
1.67712, -0.2755887, 0.2422314, 1, 0, 0.2392157, 1,
1.678872, 0.4799872, 1.156991, 1, 0, 0.2352941, 1,
1.682574, 1.197528, 1.124847, 1, 0, 0.227451, 1,
1.682904, -1.233842, 2.086053, 1, 0, 0.2235294, 1,
1.702994, 0.3735977, 1.007209, 1, 0, 0.2156863, 1,
1.732839, 1.621029, -0.3659137, 1, 0, 0.2117647, 1,
1.749827, 0.5265325, 0.920801, 1, 0, 0.2039216, 1,
1.765532, 0.5689987, 0.3017724, 1, 0, 0.1960784, 1,
1.803443, -1.300084, 1.24795, 1, 0, 0.1921569, 1,
1.80662, 0.1540071, 0.3057139, 1, 0, 0.1843137, 1,
1.850231, 1.743487, -0.03479458, 1, 0, 0.1803922, 1,
1.872059, 0.3857941, -0.1419958, 1, 0, 0.172549, 1,
1.87411, 1.26991, 1.102745, 1, 0, 0.1686275, 1,
1.881979, -0.3921348, 2.65724, 1, 0, 0.1607843, 1,
1.908975, 0.339685, 2.411638, 1, 0, 0.1568628, 1,
1.951204, 0.3616038, 1.285844, 1, 0, 0.1490196, 1,
1.969687, -0.8531334, 3.449789, 1, 0, 0.145098, 1,
1.979831, 1.483725, 0.7649376, 1, 0, 0.1372549, 1,
2.01441, 1.642294, 1.0638, 1, 0, 0.1333333, 1,
2.033112, -1.400491, 0.8040144, 1, 0, 0.1254902, 1,
2.068027, -1.297195, 2.010042, 1, 0, 0.1215686, 1,
2.132148, 0.03949482, 3.989918, 1, 0, 0.1137255, 1,
2.17575, 0.1752144, 2.384977, 1, 0, 0.1098039, 1,
2.18016, -0.6855968, 2.273093, 1, 0, 0.1019608, 1,
2.21896, -0.7439287, 3.748943, 1, 0, 0.09411765, 1,
2.235562, -2.322879, 0.6870852, 1, 0, 0.09019608, 1,
2.253435, 1.492962, 0.914584, 1, 0, 0.08235294, 1,
2.271757, 0.08871082, 2.308397, 1, 0, 0.07843138, 1,
2.286719, -1.250548, 1.764464, 1, 0, 0.07058824, 1,
2.325066, 1.863901, 1.761357, 1, 0, 0.06666667, 1,
2.362452, -0.3553461, 2.521406, 1, 0, 0.05882353, 1,
2.373477, 0.06798532, 1.174973, 1, 0, 0.05490196, 1,
2.461214, -1.0274, 1.766393, 1, 0, 0.04705882, 1,
2.539192, -0.6957822, 1.760417, 1, 0, 0.04313726, 1,
2.616534, 1.045691, 2.767, 1, 0, 0.03529412, 1,
2.630522, 0.7331683, 1.721456, 1, 0, 0.03137255, 1,
2.645991, -0.1912516, 2.157119, 1, 0, 0.02352941, 1,
2.693599, -0.8958194, 2.853693, 1, 0, 0.01960784, 1,
2.936769, -1.642881, 3.021385, 1, 0, 0.01176471, 1,
3.344117, -0.2060968, 2.58349, 1, 0, 0.007843138, 1
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
0.01471746, -4.828278, -7.522685, 0, -0.5, 0.5, 0.5,
0.01471746, -4.828278, -7.522685, 1, -0.5, 0.5, 0.5,
0.01471746, -4.828278, -7.522685, 1, 1.5, 0.5, 0.5,
0.01471746, -4.828278, -7.522685, 0, 1.5, 0.5, 0.5
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
-4.443349, 0.0744381, -7.522685, 0, -0.5, 0.5, 0.5,
-4.443349, 0.0744381, -7.522685, 1, -0.5, 0.5, 0.5,
-4.443349, 0.0744381, -7.522685, 1, 1.5, 0.5, 0.5,
-4.443349, 0.0744381, -7.522685, 0, 1.5, 0.5, 0.5
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
-4.443349, -4.828278, -0.3141086, 0, -0.5, 0.5, 0.5,
-4.443349, -4.828278, -0.3141086, 1, -0.5, 0.5, 0.5,
-4.443349, -4.828278, -0.3141086, 1, 1.5, 0.5, 0.5,
-4.443349, -4.828278, -0.3141086, 0, 1.5, 0.5, 0.5
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
-3, -3.696882, -5.859167,
3, -3.696882, -5.859167,
-3, -3.696882, -5.859167,
-3, -3.885448, -6.13642,
-2, -3.696882, -5.859167,
-2, -3.885448, -6.13642,
-1, -3.696882, -5.859167,
-1, -3.885448, -6.13642,
0, -3.696882, -5.859167,
0, -3.885448, -6.13642,
1, -3.696882, -5.859167,
1, -3.885448, -6.13642,
2, -3.696882, -5.859167,
2, -3.885448, -6.13642,
3, -3.696882, -5.859167,
3, -3.885448, -6.13642
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
-3, -4.26258, -6.690926, 0, -0.5, 0.5, 0.5,
-3, -4.26258, -6.690926, 1, -0.5, 0.5, 0.5,
-3, -4.26258, -6.690926, 1, 1.5, 0.5, 0.5,
-3, -4.26258, -6.690926, 0, 1.5, 0.5, 0.5,
-2, -4.26258, -6.690926, 0, -0.5, 0.5, 0.5,
-2, -4.26258, -6.690926, 1, -0.5, 0.5, 0.5,
-2, -4.26258, -6.690926, 1, 1.5, 0.5, 0.5,
-2, -4.26258, -6.690926, 0, 1.5, 0.5, 0.5,
-1, -4.26258, -6.690926, 0, -0.5, 0.5, 0.5,
-1, -4.26258, -6.690926, 1, -0.5, 0.5, 0.5,
-1, -4.26258, -6.690926, 1, 1.5, 0.5, 0.5,
-1, -4.26258, -6.690926, 0, 1.5, 0.5, 0.5,
0, -4.26258, -6.690926, 0, -0.5, 0.5, 0.5,
0, -4.26258, -6.690926, 1, -0.5, 0.5, 0.5,
0, -4.26258, -6.690926, 1, 1.5, 0.5, 0.5,
0, -4.26258, -6.690926, 0, 1.5, 0.5, 0.5,
1, -4.26258, -6.690926, 0, -0.5, 0.5, 0.5,
1, -4.26258, -6.690926, 1, -0.5, 0.5, 0.5,
1, -4.26258, -6.690926, 1, 1.5, 0.5, 0.5,
1, -4.26258, -6.690926, 0, 1.5, 0.5, 0.5,
2, -4.26258, -6.690926, 0, -0.5, 0.5, 0.5,
2, -4.26258, -6.690926, 1, -0.5, 0.5, 0.5,
2, -4.26258, -6.690926, 1, 1.5, 0.5, 0.5,
2, -4.26258, -6.690926, 0, 1.5, 0.5, 0.5,
3, -4.26258, -6.690926, 0, -0.5, 0.5, 0.5,
3, -4.26258, -6.690926, 1, -0.5, 0.5, 0.5,
3, -4.26258, -6.690926, 1, 1.5, 0.5, 0.5,
3, -4.26258, -6.690926, 0, 1.5, 0.5, 0.5
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
-3.414564, -2, -5.859167,
-3.414564, 2, -5.859167,
-3.414564, -2, -5.859167,
-3.586029, -2, -6.13642,
-3.414564, 0, -5.859167,
-3.586029, 0, -6.13642,
-3.414564, 2, -5.859167,
-3.586029, 2, -6.13642
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
-3.928957, -2, -6.690926, 0, -0.5, 0.5, 0.5,
-3.928957, -2, -6.690926, 1, -0.5, 0.5, 0.5,
-3.928957, -2, -6.690926, 1, 1.5, 0.5, 0.5,
-3.928957, -2, -6.690926, 0, 1.5, 0.5, 0.5,
-3.928957, 0, -6.690926, 0, -0.5, 0.5, 0.5,
-3.928957, 0, -6.690926, 1, -0.5, 0.5, 0.5,
-3.928957, 0, -6.690926, 1, 1.5, 0.5, 0.5,
-3.928957, 0, -6.690926, 0, 1.5, 0.5, 0.5,
-3.928957, 2, -6.690926, 0, -0.5, 0.5, 0.5,
-3.928957, 2, -6.690926, 1, -0.5, 0.5, 0.5,
-3.928957, 2, -6.690926, 1, 1.5, 0.5, 0.5,
-3.928957, 2, -6.690926, 0, 1.5, 0.5, 0.5
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
-3.414564, -3.696882, -4,
-3.414564, -3.696882, 4,
-3.414564, -3.696882, -4,
-3.586029, -3.885448, -4,
-3.414564, -3.696882, -2,
-3.586029, -3.885448, -2,
-3.414564, -3.696882, 0,
-3.586029, -3.885448, 0,
-3.414564, -3.696882, 2,
-3.586029, -3.885448, 2,
-3.414564, -3.696882, 4,
-3.586029, -3.885448, 4
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
-3.928957, -4.26258, -4, 0, -0.5, 0.5, 0.5,
-3.928957, -4.26258, -4, 1, -0.5, 0.5, 0.5,
-3.928957, -4.26258, -4, 1, 1.5, 0.5, 0.5,
-3.928957, -4.26258, -4, 0, 1.5, 0.5, 0.5,
-3.928957, -4.26258, -2, 0, -0.5, 0.5, 0.5,
-3.928957, -4.26258, -2, 1, -0.5, 0.5, 0.5,
-3.928957, -4.26258, -2, 1, 1.5, 0.5, 0.5,
-3.928957, -4.26258, -2, 0, 1.5, 0.5, 0.5,
-3.928957, -4.26258, 0, 0, -0.5, 0.5, 0.5,
-3.928957, -4.26258, 0, 1, -0.5, 0.5, 0.5,
-3.928957, -4.26258, 0, 1, 1.5, 0.5, 0.5,
-3.928957, -4.26258, 0, 0, 1.5, 0.5, 0.5,
-3.928957, -4.26258, 2, 0, -0.5, 0.5, 0.5,
-3.928957, -4.26258, 2, 1, -0.5, 0.5, 0.5,
-3.928957, -4.26258, 2, 1, 1.5, 0.5, 0.5,
-3.928957, -4.26258, 2, 0, 1.5, 0.5, 0.5,
-3.928957, -4.26258, 4, 0, -0.5, 0.5, 0.5,
-3.928957, -4.26258, 4, 1, -0.5, 0.5, 0.5,
-3.928957, -4.26258, 4, 1, 1.5, 0.5, 0.5,
-3.928957, -4.26258, 4, 0, 1.5, 0.5, 0.5
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
-3.414564, -3.696882, -5.859167,
-3.414564, 3.845758, -5.859167,
-3.414564, -3.696882, 5.23095,
-3.414564, 3.845758, 5.23095,
-3.414564, -3.696882, -5.859167,
-3.414564, -3.696882, 5.23095,
-3.414564, 3.845758, -5.859167,
-3.414564, 3.845758, 5.23095,
-3.414564, -3.696882, -5.859167,
3.443999, -3.696882, -5.859167,
-3.414564, -3.696882, 5.23095,
3.443999, -3.696882, 5.23095,
-3.414564, 3.845758, -5.859167,
3.443999, 3.845758, -5.859167,
-3.414564, 3.845758, 5.23095,
3.443999, 3.845758, 5.23095,
3.443999, -3.696882, -5.859167,
3.443999, 3.845758, -5.859167,
3.443999, -3.696882, 5.23095,
3.443999, 3.845758, 5.23095,
3.443999, -3.696882, -5.859167,
3.443999, -3.696882, 5.23095,
3.443999, 3.845758, -5.859167,
3.443999, 3.845758, 5.23095
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
var radius = 8.043847;
var distance = 35.78798;
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
mvMatrix.translate( -0.01471746, -0.0744381, 0.3141086 );
mvMatrix.scale( 1.268074, 1.153066, 0.7842266 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.78798);
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
phosphorine<-read.table("phosphorine.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-phosphorine$V2
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
```

```r
y<-phosphorine$V3
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
```

```r
z<-phosphorine$V4
```

```
## Error in eval(expr, envir, enclos): object 'phosphorine' not found
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
-3.314682, 0.7991697, -2.55019, 0, 0, 1, 1, 1,
-3.116285, 0.5278574, -1.019882, 1, 0, 0, 1, 1,
-2.863002, 1.277864, -0.5764158, 1, 0, 0, 1, 1,
-2.840724, -0.3708278, 0.04121185, 1, 0, 0, 1, 1,
-2.757572, 0.9720037, 0.5594099, 1, 0, 0, 1, 1,
-2.513385, 1.783471, 0.2547192, 1, 0, 0, 1, 1,
-2.438833, -1.948944, -1.234141, 0, 0, 0, 1, 1,
-2.393337, 1.9258, -1.271521, 0, 0, 0, 1, 1,
-2.386639, -1.556607, -3.313135, 0, 0, 0, 1, 1,
-2.385041, 0.2156554, -1.575646, 0, 0, 0, 1, 1,
-2.367919, -0.515637, -1.749196, 0, 0, 0, 1, 1,
-2.360351, 0.6103963, -1.466087, 0, 0, 0, 1, 1,
-2.34032, -0.8593706, -1.248983, 0, 0, 0, 1, 1,
-2.307753, -1.139885, -2.921298, 1, 1, 1, 1, 1,
-2.292301, 0.2025973, -1.732577, 1, 1, 1, 1, 1,
-2.290629, -0.1715524, -1.121438, 1, 1, 1, 1, 1,
-2.256568, 0.4608388, -1.031168, 1, 1, 1, 1, 1,
-2.184567, 1.393711, 0.9322369, 1, 1, 1, 1, 1,
-2.179955, -1.324666, -1.692852, 1, 1, 1, 1, 1,
-2.174165, 0.2488324, -2.352714, 1, 1, 1, 1, 1,
-2.15442, -0.6370534, -3.619369, 1, 1, 1, 1, 1,
-2.151026, -1.580658, -1.287162, 1, 1, 1, 1, 1,
-2.088914, 0.1870391, -0.9212125, 1, 1, 1, 1, 1,
-2.073722, -0.2812155, -1.658119, 1, 1, 1, 1, 1,
-2.050098, 0.519708, -1.077198, 1, 1, 1, 1, 1,
-2.047727, -0.1307375, -0.6029136, 1, 1, 1, 1, 1,
-2.042769, 0.421326, -2.04724, 1, 1, 1, 1, 1,
-2.040441, 0.03602188, -0.819625, 1, 1, 1, 1, 1,
-2.021741, -1.265368, -3.014656, 0, 0, 1, 1, 1,
-2.017774, -1.16137, -0.7513078, 1, 0, 0, 1, 1,
-2.008217, -0.6670513, -2.213259, 1, 0, 0, 1, 1,
-1.989262, -0.03364444, -0.9666111, 1, 0, 0, 1, 1,
-1.961338, 1.722542, -0.124861, 1, 0, 0, 1, 1,
-1.921558, 0.220701, -0.750849, 1, 0, 0, 1, 1,
-1.919276, -0.605198, -2.12461, 0, 0, 0, 1, 1,
-1.909093, -0.8643199, -1.192772, 0, 0, 0, 1, 1,
-1.892153, 0.3020889, -0.2397721, 0, 0, 0, 1, 1,
-1.889051, -1.096638, -2.125234, 0, 0, 0, 1, 1,
-1.879999, -1.433529, -2.786289, 0, 0, 0, 1, 1,
-1.860521, -1.254577, -2.733355, 0, 0, 0, 1, 1,
-1.851367, 0.8428885, -2.031209, 0, 0, 0, 1, 1,
-1.826502, 1.453912, -2.49577, 1, 1, 1, 1, 1,
-1.823854, -0.2501705, -0.7542879, 1, 1, 1, 1, 1,
-1.807364, -1.657207, -3.652876, 1, 1, 1, 1, 1,
-1.796724, -0.06581933, -1.786755, 1, 1, 1, 1, 1,
-1.794763, -0.152503, -1.856244, 1, 1, 1, 1, 1,
-1.790148, -0.407905, -0.2334836, 1, 1, 1, 1, 1,
-1.786681, 1.462556, -0.7356316, 1, 1, 1, 1, 1,
-1.779038, 1.980942, -1.089287, 1, 1, 1, 1, 1,
-1.778657, -0.8918751, -1.498576, 1, 1, 1, 1, 1,
-1.768314, 1.703858, -0.1868446, 1, 1, 1, 1, 1,
-1.727498, -0.2238818, -2.515418, 1, 1, 1, 1, 1,
-1.709213, -1.836675, -3.638632, 1, 1, 1, 1, 1,
-1.705953, 0.08680921, -3.079155, 1, 1, 1, 1, 1,
-1.67689, 1.074804, -3.188206, 1, 1, 1, 1, 1,
-1.666868, -0.7367259, -1.375359, 1, 1, 1, 1, 1,
-1.664681, -0.7254661, -2.386128, 0, 0, 1, 1, 1,
-1.640875, -0.4549653, -3.363515, 1, 0, 0, 1, 1,
-1.633142, -0.4317236, -2.178766, 1, 0, 0, 1, 1,
-1.630815, 2.523628, 1.812337, 1, 0, 0, 1, 1,
-1.620246, 0.6734887, -0.7034146, 1, 0, 0, 1, 1,
-1.595801, -0.5244172, -1.144619, 1, 0, 0, 1, 1,
-1.591477, -0.02435584, 0.4986845, 0, 0, 0, 1, 1,
-1.584094, -0.0654567, -2.460969, 0, 0, 0, 1, 1,
-1.577764, -0.09696815, -1.371952, 0, 0, 0, 1, 1,
-1.570298, 0.4819375, -0.9128284, 0, 0, 0, 1, 1,
-1.568266, -0.6415558, -2.845302, 0, 0, 0, 1, 1,
-1.552386, -0.03850586, -3.255609, 0, 0, 0, 1, 1,
-1.533287, 2.010636, 0.9591886, 0, 0, 0, 1, 1,
-1.520296, -1.448525, -1.693167, 1, 1, 1, 1, 1,
-1.507066, 0.3156504, -3.530523, 1, 1, 1, 1, 1,
-1.505484, -0.1083521, -1.51195, 1, 1, 1, 1, 1,
-1.500507, -1.3039, -3.749442, 1, 1, 1, 1, 1,
-1.497488, 1.613006, -2.230928, 1, 1, 1, 1, 1,
-1.488624, -0.3179848, -0.7765599, 1, 1, 1, 1, 1,
-1.487012, -0.9248507, -1.549383, 1, 1, 1, 1, 1,
-1.479678, 1.927172, -1.931324, 1, 1, 1, 1, 1,
-1.479178, 0.7137791, -2.260751, 1, 1, 1, 1, 1,
-1.470249, -1.125741, -1.127194, 1, 1, 1, 1, 1,
-1.452713, 0.0372173, -1.175693, 1, 1, 1, 1, 1,
-1.437909, -1.217576, -2.055283, 1, 1, 1, 1, 1,
-1.434598, -0.1837018, -1.091453, 1, 1, 1, 1, 1,
-1.433516, -0.7324955, -1.872534, 1, 1, 1, 1, 1,
-1.430706, 0.4613072, -0.02283007, 1, 1, 1, 1, 1,
-1.424046, 0.6585386, -2.432081, 0, 0, 1, 1, 1,
-1.417682, 0.5807877, -0.8263156, 1, 0, 0, 1, 1,
-1.367591, 0.1368212, -2.772364, 1, 0, 0, 1, 1,
-1.366971, 1.691341, -0.9811988, 1, 0, 0, 1, 1,
-1.366011, -0.8487883, -3.978221, 1, 0, 0, 1, 1,
-1.365866, -1.342096, -1.571839, 1, 0, 0, 1, 1,
-1.357722, 0.3947695, -0.515911, 0, 0, 0, 1, 1,
-1.352297, 0.8716089, -1.619041, 0, 0, 0, 1, 1,
-1.351597, 0.3355921, -1.270153, 0, 0, 0, 1, 1,
-1.346136, 0.7669757, -1.479072, 0, 0, 0, 1, 1,
-1.337717, -0.6737133, -1.438926, 0, 0, 0, 1, 1,
-1.322351, -1.182483, -2.50106, 0, 0, 0, 1, 1,
-1.321008, 0.8931665, -0.9115416, 0, 0, 0, 1, 1,
-1.312519, 0.8649849, -1.433777, 1, 1, 1, 1, 1,
-1.311966, 1.636472, -2.688491, 1, 1, 1, 1, 1,
-1.311038, 0.009997016, -2.520896, 1, 1, 1, 1, 1,
-1.310245, 0.4435039, -1.154221, 1, 1, 1, 1, 1,
-1.309364, 1.565651, 0.08088464, 1, 1, 1, 1, 1,
-1.294036, 0.4157026, -1.934191, 1, 1, 1, 1, 1,
-1.269714, -1.051302, -1.412134, 1, 1, 1, 1, 1,
-1.261201, 1.037895, -0.9761959, 1, 1, 1, 1, 1,
-1.250547, -1.366331, -3.088897, 1, 1, 1, 1, 1,
-1.240576, 1.911303, 0.4358371, 1, 1, 1, 1, 1,
-1.233088, 2.36587, -0.1686023, 1, 1, 1, 1, 1,
-1.231573, -1.428752, -2.821506, 1, 1, 1, 1, 1,
-1.229185, 0.4731855, -2.032437, 1, 1, 1, 1, 1,
-1.2244, 1.069561, -2.406938, 1, 1, 1, 1, 1,
-1.214704, 0.3203859, -1.395441, 1, 1, 1, 1, 1,
-1.213886, -0.3069881, -3.748148, 0, 0, 1, 1, 1,
-1.211878, 0.006447822, -1.366335, 1, 0, 0, 1, 1,
-1.206923, 0.1127305, -1.250167, 1, 0, 0, 1, 1,
-1.192061, -1.495717, -3.328517, 1, 0, 0, 1, 1,
-1.185328, 0.2472099, -2.776974, 1, 0, 0, 1, 1,
-1.184872, 1.210753, 0.7425584, 1, 0, 0, 1, 1,
-1.180924, 0.248808, -0.9465412, 0, 0, 0, 1, 1,
-1.171922, 0.7541237, -2.184477, 0, 0, 0, 1, 1,
-1.164399, 1.702308, -0.1664803, 0, 0, 0, 1, 1,
-1.155522, -0.1697318, -3.103774, 0, 0, 0, 1, 1,
-1.155109, -0.3656118, -2.478616, 0, 0, 0, 1, 1,
-1.154594, 1.456876, 0.1017591, 0, 0, 0, 1, 1,
-1.14471, -0.2000527, -2.331165, 0, 0, 0, 1, 1,
-1.134925, 0.7779946, -1.616071, 1, 1, 1, 1, 1,
-1.1307, 1.971833, -1.290357, 1, 1, 1, 1, 1,
-1.129408, 2.44184, 0.01087213, 1, 1, 1, 1, 1,
-1.115025, 1.563182, -0.3491805, 1, 1, 1, 1, 1,
-1.114366, 1.152986, -0.6402792, 1, 1, 1, 1, 1,
-1.108024, -0.03221299, -2.011348, 1, 1, 1, 1, 1,
-1.10575, -1.824251, -2.077122, 1, 1, 1, 1, 1,
-1.087631, -0.691015, -1.697585, 1, 1, 1, 1, 1,
-1.082972, 0.6226534, -1.47461, 1, 1, 1, 1, 1,
-1.075616, 0.2769592, -0.3483904, 1, 1, 1, 1, 1,
-1.075038, 2.04153, 0.1028324, 1, 1, 1, 1, 1,
-1.071985, 0.407579, -1.626239, 1, 1, 1, 1, 1,
-1.069869, 0.3644704, -1.617988, 1, 1, 1, 1, 1,
-1.06915, 1.344501, 0.7954545, 1, 1, 1, 1, 1,
-1.064184, 1.28141, -1.622693, 1, 1, 1, 1, 1,
-1.061638, 0.0918461, -0.8372219, 0, 0, 1, 1, 1,
-1.061598, 0.02075133, -1.107093, 1, 0, 0, 1, 1,
-1.059303, 0.02503918, -1.878347, 1, 0, 0, 1, 1,
-1.05318, -0.5220201, -1.366919, 1, 0, 0, 1, 1,
-1.051709, -2.392255, -2.751892, 1, 0, 0, 1, 1,
-1.048641, -0.100535, -2.520244, 1, 0, 0, 1, 1,
-1.036741, 2.409789, -0.3539826, 0, 0, 0, 1, 1,
-1.027789, 1.180609, -1.171884, 0, 0, 0, 1, 1,
-1.024007, -1.440973, -0.01800994, 0, 0, 0, 1, 1,
-1.013421, -0.1075444, -0.1608775, 0, 0, 0, 1, 1,
-1.011636, 0.162722, -2.123502, 0, 0, 0, 1, 1,
-1.000071, 1.179903, 0.654844, 0, 0, 0, 1, 1,
-0.9998729, -1.136215, -2.639889, 0, 0, 0, 1, 1,
-0.9995378, 0.5803117, 0.1685792, 1, 1, 1, 1, 1,
-0.9942942, 1.230932, -1.572607, 1, 1, 1, 1, 1,
-0.9891974, 0.422834, -2.610048, 1, 1, 1, 1, 1,
-0.9841533, -1.41381, -3.973674, 1, 1, 1, 1, 1,
-0.9829405, 0.161217, -0.5985133, 1, 1, 1, 1, 1,
-0.9817687, -0.0954869, -0.5279502, 1, 1, 1, 1, 1,
-0.9799396, -1.055906, -2.602903, 1, 1, 1, 1, 1,
-0.9780011, -0.9348603, -0.7799931, 1, 1, 1, 1, 1,
-0.9779216, -0.6827389, -0.2492321, 1, 1, 1, 1, 1,
-0.9759891, 0.3087071, -1.878041, 1, 1, 1, 1, 1,
-0.9662519, -0.2255499, -0.7274722, 1, 1, 1, 1, 1,
-0.9634216, 0.7941178, -3.040696, 1, 1, 1, 1, 1,
-0.9556828, 1.545823, -0.4384647, 1, 1, 1, 1, 1,
-0.9550236, 1.078819, -0.4589725, 1, 1, 1, 1, 1,
-0.9550169, 0.9650212, -0.3327427, 1, 1, 1, 1, 1,
-0.9547327, 0.03976854, -0.2834334, 0, 0, 1, 1, 1,
-0.9525486, -1.656998, -2.509642, 1, 0, 0, 1, 1,
-0.9521123, 0.5419961, 0.6705544, 1, 0, 0, 1, 1,
-0.9475304, 0.7540863, -1.187124, 1, 0, 0, 1, 1,
-0.9464421, 2.365904, -1.361124, 1, 0, 0, 1, 1,
-0.9463202, -0.05347344, -2.089869, 1, 0, 0, 1, 1,
-0.9441878, -0.6204033, -2.374088, 0, 0, 0, 1, 1,
-0.9422061, -0.7971754, -2.812187, 0, 0, 0, 1, 1,
-0.9364237, -0.5689022, -3.586663, 0, 0, 0, 1, 1,
-0.9276526, 1.074015, 0.1363634, 0, 0, 0, 1, 1,
-0.9251114, 1.166717, 0.06593237, 0, 0, 0, 1, 1,
-0.92496, -0.203858, -1.240211, 0, 0, 0, 1, 1,
-0.9162894, -0.8189872, -2.324651, 0, 0, 0, 1, 1,
-0.9136187, 1.427102, -0.6106817, 1, 1, 1, 1, 1,
-0.906996, 1.33277, -0.6698034, 1, 1, 1, 1, 1,
-0.9066374, 0.3472416, -0.945343, 1, 1, 1, 1, 1,
-0.9020309, -1.892099, -3.941834, 1, 1, 1, 1, 1,
-0.900571, -0.0488506, -2.592305, 1, 1, 1, 1, 1,
-0.8920964, 0.6897716, -0.5182291, 1, 1, 1, 1, 1,
-0.8920903, 0.6075415, -0.1201877, 1, 1, 1, 1, 1,
-0.884621, 0.4250154, -1.401224, 1, 1, 1, 1, 1,
-0.8761722, 0.1676384, -0.04154496, 1, 1, 1, 1, 1,
-0.8752072, -1.207923, -2.862186, 1, 1, 1, 1, 1,
-0.8726491, 0.9948898, -2.970299, 1, 1, 1, 1, 1,
-0.8699855, -0.4792207, -3.119514, 1, 1, 1, 1, 1,
-0.8672178, -1.322428, -3.002288, 1, 1, 1, 1, 1,
-0.8652973, -2.540254, -1.118257, 1, 1, 1, 1, 1,
-0.8560109, -0.5862516, -3.331321, 1, 1, 1, 1, 1,
-0.8540932, 0.356488, -1.030828, 0, 0, 1, 1, 1,
-0.8515856, -0.2448318, -0.1173348, 1, 0, 0, 1, 1,
-0.849372, 0.1864471, -1.465933, 1, 0, 0, 1, 1,
-0.8366141, 0.344599, -2.624826, 1, 0, 0, 1, 1,
-0.8297064, 0.08578888, -1.751763, 1, 0, 0, 1, 1,
-0.828118, -0.9919611, -2.716031, 1, 0, 0, 1, 1,
-0.8194561, -0.4368458, -4.030499, 0, 0, 0, 1, 1,
-0.8177118, -0.7851434, -3.013111, 0, 0, 0, 1, 1,
-0.8170511, -0.1717102, -1.330234, 0, 0, 0, 1, 1,
-0.8139201, -0.4065533, -1.828418, 0, 0, 0, 1, 1,
-0.8118163, 0.07435643, -3.158892, 0, 0, 0, 1, 1,
-0.80075, 0.5147595, -0.158932, 0, 0, 0, 1, 1,
-0.7954698, -2.294979, -2.459161, 0, 0, 0, 1, 1,
-0.791385, 0.7233899, 0.174671, 1, 1, 1, 1, 1,
-0.7896412, 0.7433172, -0.03775895, 1, 1, 1, 1, 1,
-0.7850217, -0.4386967, -0.8733846, 1, 1, 1, 1, 1,
-0.7826104, 0.5183264, -1.184585, 1, 1, 1, 1, 1,
-0.7770188, 0.7127782, -1.246241, 1, 1, 1, 1, 1,
-0.7727668, 0.161791, -2.366237, 1, 1, 1, 1, 1,
-0.7724361, -1.334143, -1.66668, 1, 1, 1, 1, 1,
-0.764393, 0.08688597, -1.339103, 1, 1, 1, 1, 1,
-0.7641175, 0.850391, 1.074701, 1, 1, 1, 1, 1,
-0.7618494, -1.358071, -4.504726, 1, 1, 1, 1, 1,
-0.7590539, 0.3633851, -0.3626621, 1, 1, 1, 1, 1,
-0.7588671, -1.109379, -2.894688, 1, 1, 1, 1, 1,
-0.7551782, 1.420098, -1.87554, 1, 1, 1, 1, 1,
-0.7534963, 0.6999038, 1.061971, 1, 1, 1, 1, 1,
-0.7499009, -1.521843, -1.57367, 1, 1, 1, 1, 1,
-0.7478966, 0.3476168, -2.198226, 0, 0, 1, 1, 1,
-0.7375728, 0.7521253, -0.6201611, 1, 0, 0, 1, 1,
-0.7368297, 0.3151157, -0.08001415, 1, 0, 0, 1, 1,
-0.7360955, 0.8533385, -0.1222845, 1, 0, 0, 1, 1,
-0.7359025, 0.3673041, -1.580294, 1, 0, 0, 1, 1,
-0.7312399, 1.470699, -0.4067165, 1, 0, 0, 1, 1,
-0.7303092, 0.1912215, -0.2391838, 0, 0, 0, 1, 1,
-0.7291124, 0.5322047, -0.9070026, 0, 0, 0, 1, 1,
-0.7282373, -0.7466946, -1.057573, 0, 0, 0, 1, 1,
-0.7248959, 1.248733, 0.9456715, 0, 0, 0, 1, 1,
-0.7232463, -1.108106, -4.531546, 0, 0, 0, 1, 1,
-0.7227401, 1.779317, -0.84434, 0, 0, 0, 1, 1,
-0.71957, 1.885385, 0.2822839, 0, 0, 0, 1, 1,
-0.7134613, 0.260794, -1.028804, 1, 1, 1, 1, 1,
-0.7080327, 0.8350161, -0.5230825, 1, 1, 1, 1, 1,
-0.7040607, 1.400423, -0.4447877, 1, 1, 1, 1, 1,
-0.7008026, 0.2690043, -0.2086974, 1, 1, 1, 1, 1,
-0.7004299, 1.718022, 1.367807, 1, 1, 1, 1, 1,
-0.6994439, -0.6039656, -3.228024, 1, 1, 1, 1, 1,
-0.6971153, 0.2222123, -2.635327, 1, 1, 1, 1, 1,
-0.6961665, -1.799244, -2.92553, 1, 1, 1, 1, 1,
-0.6945174, -1.324178, -3.612416, 1, 1, 1, 1, 1,
-0.6931279, -0.4953754, -3.304292, 1, 1, 1, 1, 1,
-0.6920567, 1.085823, -1.372249, 1, 1, 1, 1, 1,
-0.6899301, 0.2674985, -0.6246992, 1, 1, 1, 1, 1,
-0.6890556, -1.292102, -2.630005, 1, 1, 1, 1, 1,
-0.687106, 0.6443058, -0.002739311, 1, 1, 1, 1, 1,
-0.6833137, -0.2723608, -2.512889, 1, 1, 1, 1, 1,
-0.6824778, -0.4272236, -2.790856, 0, 0, 1, 1, 1,
-0.6819683, 0.3517251, 0.6113191, 1, 0, 0, 1, 1,
-0.6763128, -0.7006925, -2.766792, 1, 0, 0, 1, 1,
-0.6751636, -1.25721, -3.610343, 1, 0, 0, 1, 1,
-0.6742592, -2.143997, -1.906119, 1, 0, 0, 1, 1,
-0.6739179, -1.574733, -2.230958, 1, 0, 0, 1, 1,
-0.6677648, 0.00414693, -3.859461, 0, 0, 0, 1, 1,
-0.6671195, 0.5288177, -0.02077908, 0, 0, 0, 1, 1,
-0.6658372, 1.414937, 0.5419517, 0, 0, 0, 1, 1,
-0.6655997, -1.067554, -3.043849, 0, 0, 0, 1, 1,
-0.6530814, -0.080387, 0.6437681, 0, 0, 0, 1, 1,
-0.6523626, 0.01649833, 0.3390476, 0, 0, 0, 1, 1,
-0.6477219, -0.02368189, 0.3932327, 0, 0, 0, 1, 1,
-0.6404641, -1.227961, -2.481761, 1, 1, 1, 1, 1,
-0.6385615, -0.6053964, -2.091941, 1, 1, 1, 1, 1,
-0.6332313, -0.2051964, -0.7641088, 1, 1, 1, 1, 1,
-0.6330009, -0.3483414, -1.78094, 1, 1, 1, 1, 1,
-0.6328502, 0.5308535, -1.696217, 1, 1, 1, 1, 1,
-0.6310947, 0.07517798, -0.2061156, 1, 1, 1, 1, 1,
-0.6299099, 0.9480688, -0.5168459, 1, 1, 1, 1, 1,
-0.6292475, 0.1001373, -1.304962, 1, 1, 1, 1, 1,
-0.625334, -0.4611835, -0.7508269, 1, 1, 1, 1, 1,
-0.6230269, 0.1269156, -1.543977, 1, 1, 1, 1, 1,
-0.6209389, -0.1574074, -0.5065397, 1, 1, 1, 1, 1,
-0.6161911, -1.147904, -2.47671, 1, 1, 1, 1, 1,
-0.6144633, 0.06963763, -2.231529, 1, 1, 1, 1, 1,
-0.6095948, 0.02927836, -1.282398, 1, 1, 1, 1, 1,
-0.6080406, -0.1633863, -1.75253, 1, 1, 1, 1, 1,
-0.5932667, 0.3048, -0.5498861, 0, 0, 1, 1, 1,
-0.5921665, 1.216467, -1.81134, 1, 0, 0, 1, 1,
-0.5897871, 1.182619, -0.660664, 1, 0, 0, 1, 1,
-0.5805196, -0.3239074, -1.727898, 1, 0, 0, 1, 1,
-0.5719044, 0.1604078, 1.272867, 1, 0, 0, 1, 1,
-0.5548674, 0.4341601, -1.570757, 1, 0, 0, 1, 1,
-0.5534395, -0.1362906, -1.177352, 0, 0, 0, 1, 1,
-0.553318, -0.4490469, -0.04448468, 0, 0, 0, 1, 1,
-0.5485846, -1.255936, -0.8727548, 0, 0, 0, 1, 1,
-0.547116, 1.182908, -0.579577, 0, 0, 0, 1, 1,
-0.5422266, 2.969379, -0.1752367, 0, 0, 0, 1, 1,
-0.5417279, 0.0009445333, -0.9484809, 0, 0, 0, 1, 1,
-0.54127, 0.2975484, -1.472118, 0, 0, 0, 1, 1,
-0.5388666, -0.08823477, -1.779728, 1, 1, 1, 1, 1,
-0.5375534, 1.18699, 0.1952619, 1, 1, 1, 1, 1,
-0.5350402, 0.2884905, -2.252668, 1, 1, 1, 1, 1,
-0.5289851, 0.1340983, -2.386853, 1, 1, 1, 1, 1,
-0.5235075, -0.961865, -3.83984, 1, 1, 1, 1, 1,
-0.5229142, -0.6045411, -1.194102, 1, 1, 1, 1, 1,
-0.5228697, 1.174275, 0.8088502, 1, 1, 1, 1, 1,
-0.5204356, -0.6966754, -2.533725, 1, 1, 1, 1, 1,
-0.5161247, -0.6924126, -0.472121, 1, 1, 1, 1, 1,
-0.5137707, 1.350747, 0.1217626, 1, 1, 1, 1, 1,
-0.5111679, -2.153261, -2.142034, 1, 1, 1, 1, 1,
-0.5032597, -2.004419, -2.213866, 1, 1, 1, 1, 1,
-0.5020152, 1.062215, 0.08530393, 1, 1, 1, 1, 1,
-0.5010714, -0.03109483, -2.105358, 1, 1, 1, 1, 1,
-0.5002087, -0.831811, -3.358183, 1, 1, 1, 1, 1,
-0.4950658, -0.3049395, -0.09411857, 0, 0, 1, 1, 1,
-0.4898791, 1.021262, -0.2635473, 1, 0, 0, 1, 1,
-0.4891491, -0.9835538, -2.295814, 1, 0, 0, 1, 1,
-0.48491, 1.089997, 0.5373689, 1, 0, 0, 1, 1,
-0.4820789, -0.1046977, 0.8328087, 1, 0, 0, 1, 1,
-0.4781729, 0.5734403, -1.107477, 1, 0, 0, 1, 1,
-0.4768955, 1.064958, -0.6568747, 0, 0, 0, 1, 1,
-0.4764255, 1.545424, 0.1582643, 0, 0, 0, 1, 1,
-0.4752874, -0.9053591, -2.184034, 0, 0, 0, 1, 1,
-0.4752871, 0.8707728, -1.257129, 0, 0, 0, 1, 1,
-0.4748686, -1.153925, -4.01714, 0, 0, 0, 1, 1,
-0.4744423, 1.879593, -2.102005, 0, 0, 0, 1, 1,
-0.4729827, 0.08947401, -1.319273, 0, 0, 0, 1, 1,
-0.4726333, -0.8227259, -1.430084, 1, 1, 1, 1, 1,
-0.4672356, -0.5078743, -2.106325, 1, 1, 1, 1, 1,
-0.4629905, -0.4876282, -1.723932, 1, 1, 1, 1, 1,
-0.4626657, -0.1119156, -0.6525084, 1, 1, 1, 1, 1,
-0.4583875, 0.4721528, -0.6021485, 1, 1, 1, 1, 1,
-0.4565866, 0.1357748, -1.809126, 1, 1, 1, 1, 1,
-0.4531924, 0.3977684, -3.589776, 1, 1, 1, 1, 1,
-0.4505787, 0.009758519, -3.437384, 1, 1, 1, 1, 1,
-0.4487762, 0.4553979, -1.327623, 1, 1, 1, 1, 1,
-0.4457617, -0.2387821, -0.163337, 1, 1, 1, 1, 1,
-0.440333, 0.302603, -1.072789, 1, 1, 1, 1, 1,
-0.4374485, -0.1217982, -1.927799, 1, 1, 1, 1, 1,
-0.4361196, 0.5140598, -2.052254, 1, 1, 1, 1, 1,
-0.4337925, 0.3447527, 0.4698886, 1, 1, 1, 1, 1,
-0.4281655, -0.4092526, -1.126659, 1, 1, 1, 1, 1,
-0.4277251, -1.038259, -2.196043, 0, 0, 1, 1, 1,
-0.4259399, 0.6103364, 1.563108, 1, 0, 0, 1, 1,
-0.4223615, 0.05119787, -2.610719, 1, 0, 0, 1, 1,
-0.4207866, -0.2345259, -1.874102, 1, 0, 0, 1, 1,
-0.4200974, 0.8365848, -1.067753, 1, 0, 0, 1, 1,
-0.4185357, 0.1794, -1.00685, 1, 0, 0, 1, 1,
-0.4181549, -0.2140233, -3.29209, 0, 0, 0, 1, 1,
-0.413834, -0.6949313, -2.844748, 0, 0, 0, 1, 1,
-0.4115033, 0.4177803, -1.054102, 0, 0, 0, 1, 1,
-0.4108315, -0.4925118, -3.088991, 0, 0, 0, 1, 1,
-0.4077806, 1.252588, 0.3495313, 0, 0, 0, 1, 1,
-0.4013653, -0.06774699, -2.224529, 0, 0, 0, 1, 1,
-0.3976305, 0.1419815, 0.9686692, 0, 0, 0, 1, 1,
-0.3970565, -0.7991045, -3.11668, 1, 1, 1, 1, 1,
-0.3899612, -0.938199, -1.021027, 1, 1, 1, 1, 1,
-0.385157, -0.7695478, -2.130967, 1, 1, 1, 1, 1,
-0.385156, 0.3940081, 1.267975, 1, 1, 1, 1, 1,
-0.3803515, -0.6966531, -4.105053, 1, 1, 1, 1, 1,
-0.3784632, 0.0401678, -0.4285795, 1, 1, 1, 1, 1,
-0.3775555, -0.2528675, -1.773978, 1, 1, 1, 1, 1,
-0.3745876, 2.032428, -2.389808, 1, 1, 1, 1, 1,
-0.3741156, 0.9257314, -1.018502, 1, 1, 1, 1, 1,
-0.3676423, -0.2472054, -3.063897, 1, 1, 1, 1, 1,
-0.3675487, -0.7468351, -2.630817, 1, 1, 1, 1, 1,
-0.3665806, 0.06883163, -1.695805, 1, 1, 1, 1, 1,
-0.3657001, -1.641756, -4.052815, 1, 1, 1, 1, 1,
-0.3642188, -0.942245, -3.12172, 1, 1, 1, 1, 1,
-0.364152, -0.1916709, -2.159289, 1, 1, 1, 1, 1,
-0.3625591, -0.8176866, -3.397903, 0, 0, 1, 1, 1,
-0.3593753, 1.314655, -2.090912, 1, 0, 0, 1, 1,
-0.3589324, 1.470168, -0.2751818, 1, 0, 0, 1, 1,
-0.3548715, -0.0751545, -1.452655, 1, 0, 0, 1, 1,
-0.349752, 0.175235, -1.341147, 1, 0, 0, 1, 1,
-0.3489977, -0.330946, -1.231264, 1, 0, 0, 1, 1,
-0.3458236, -1.04328, -3.167993, 0, 0, 0, 1, 1,
-0.3378681, 0.2787581, -1.333806, 0, 0, 0, 1, 1,
-0.3371961, -1.416233, -1.789312, 0, 0, 0, 1, 1,
-0.3362893, 1.713208, -0.3847023, 0, 0, 0, 1, 1,
-0.3348648, 0.0742924, -0.3254942, 0, 0, 0, 1, 1,
-0.3321994, -0.6481197, -3.692734, 0, 0, 0, 1, 1,
-0.3312479, -0.9598299, -0.8701184, 0, 0, 0, 1, 1,
-0.3251143, -0.3183918, -3.230887, 1, 1, 1, 1, 1,
-0.3118129, -0.03984541, 0.3001485, 1, 1, 1, 1, 1,
-0.3071895, -1.123632, -1.003836, 1, 1, 1, 1, 1,
-0.3038204, 1.048212, 1.611113, 1, 1, 1, 1, 1,
-0.3002802, 1.334561, -0.3138587, 1, 1, 1, 1, 1,
-0.2980158, 0.7870473, -0.3438679, 1, 1, 1, 1, 1,
-0.2942633, 0.8222767, -0.06936108, 1, 1, 1, 1, 1,
-0.2930633, 0.8847516, -1.040499, 1, 1, 1, 1, 1,
-0.289507, 1.948189, 1.575344, 1, 1, 1, 1, 1,
-0.2757782, 0.8714967, -0.7316119, 1, 1, 1, 1, 1,
-0.2737493, 0.6079744, 0.3404644, 1, 1, 1, 1, 1,
-0.2631765, -0.1967717, -1.512316, 1, 1, 1, 1, 1,
-0.2608461, -0.4702766, -2.168155, 1, 1, 1, 1, 1,
-0.2601216, -0.2498199, -0.9369374, 1, 1, 1, 1, 1,
-0.2590646, -1.68448, -1.986735, 1, 1, 1, 1, 1,
-0.2583217, 1.770166, 0.229579, 0, 0, 1, 1, 1,
-0.2570648, 0.5343753, -0.6759812, 1, 0, 0, 1, 1,
-0.2550911, 0.6652732, -0.6754977, 1, 0, 0, 1, 1,
-0.2521802, -0.9963111, -2.478144, 1, 0, 0, 1, 1,
-0.250522, 0.7703813, -0.6917235, 1, 0, 0, 1, 1,
-0.2495269, 0.5607507, -1.675334, 1, 0, 0, 1, 1,
-0.2474926, -1.676094, -1.684735, 0, 0, 0, 1, 1,
-0.2471805, 0.3516942, -0.5253367, 0, 0, 0, 1, 1,
-0.238911, -0.2984603, -1.790083, 0, 0, 0, 1, 1,
-0.2379951, -1.764077, -3.195851, 0, 0, 0, 1, 1,
-0.2359505, 0.7012465, 0.1211644, 0, 0, 0, 1, 1,
-0.2346082, 0.6344551, -0.02177181, 0, 0, 0, 1, 1,
-0.2270793, -0.5486938, -2.450466, 0, 0, 0, 1, 1,
-0.2213505, 1.33183, 0.4941006, 1, 1, 1, 1, 1,
-0.2159733, -0.3741937, -2.291646, 1, 1, 1, 1, 1,
-0.2118054, -0.5958132, -2.738238, 1, 1, 1, 1, 1,
-0.2107231, 0.2995492, -1.867003, 1, 1, 1, 1, 1,
-0.2106247, 0.07835948, -2.022398, 1, 1, 1, 1, 1,
-0.2061883, -0.3627914, -1.191302, 1, 1, 1, 1, 1,
-0.2060695, -0.4881491, -3.486176, 1, 1, 1, 1, 1,
-0.2048988, -0.4509559, -1.831267, 1, 1, 1, 1, 1,
-0.197338, 1.106415, -0.8575302, 1, 1, 1, 1, 1,
-0.1949154, 1.639902, -0.2036746, 1, 1, 1, 1, 1,
-0.1941857, -1.492455, -2.52593, 1, 1, 1, 1, 1,
-0.1935101, -1.130024, -3.945194, 1, 1, 1, 1, 1,
-0.1934016, -1.513377, -1.842799, 1, 1, 1, 1, 1,
-0.192527, -0.8331611, -2.241606, 1, 1, 1, 1, 1,
-0.1902927, 2.208866, -0.07813877, 1, 1, 1, 1, 1,
-0.1865977, 0.2996869, -0.7395594, 0, 0, 1, 1, 1,
-0.1865162, -0.5647641, -1.522715, 1, 0, 0, 1, 1,
-0.1806254, 1.248463, -0.07090752, 1, 0, 0, 1, 1,
-0.175524, -1.763548, -2.658725, 1, 0, 0, 1, 1,
-0.1737348, -0.4782521, -1.747337, 1, 0, 0, 1, 1,
-0.1709349, 1.5171, 0.1968416, 1, 0, 0, 1, 1,
-0.1680273, -0.4243716, -3.749202, 0, 0, 0, 1, 1,
-0.1650499, 0.6564085, -0.9193378, 0, 0, 0, 1, 1,
-0.1623468, -0.2486941, -2.915664, 0, 0, 0, 1, 1,
-0.1526868, -0.2900151, -3.401391, 0, 0, 0, 1, 1,
-0.1522317, 0.4847432, -1.368509, 0, 0, 0, 1, 1,
-0.1499811, -0.9725718, -3.972392, 0, 0, 0, 1, 1,
-0.1451364, -2.696749, -3.355982, 0, 0, 0, 1, 1,
-0.1450508, -0.452749, -2.732475, 1, 1, 1, 1, 1,
-0.1391615, 0.2129237, 0.361677, 1, 1, 1, 1, 1,
-0.1381078, -0.8260214, -2.683754, 1, 1, 1, 1, 1,
-0.1370938, -0.8389165, -3.928675, 1, 1, 1, 1, 1,
-0.1348703, 1.402199, -1.46399, 1, 1, 1, 1, 1,
-0.1344986, 0.8166565, 0.02523427, 1, 1, 1, 1, 1,
-0.1336344, 0.2638298, -0.2241577, 1, 1, 1, 1, 1,
-0.1330424, 0.6739985, -0.7753338, 1, 1, 1, 1, 1,
-0.1329824, -0.6432248, -1.862068, 1, 1, 1, 1, 1,
-0.1319975, 0.03020662, -1.010385, 1, 1, 1, 1, 1,
-0.1318728, -0.9330068, -4.10692, 1, 1, 1, 1, 1,
-0.1316551, 1.939373, -2.004271, 1, 1, 1, 1, 1,
-0.1275882, 0.5086604, -0.5487711, 1, 1, 1, 1, 1,
-0.1199035, 1.141221, -1.31022, 1, 1, 1, 1, 1,
-0.1186103, -0.3679321, -2.768187, 1, 1, 1, 1, 1,
-0.1183901, 0.1523886, -1.110237, 0, 0, 1, 1, 1,
-0.1161296, -0.7114415, -4.061676, 1, 0, 0, 1, 1,
-0.1152209, -0.1248404, -3.734405, 1, 0, 0, 1, 1,
-0.1145688, 0.6156815, 0.9447173, 1, 0, 0, 1, 1,
-0.1135178, 0.4221523, -1.916624, 1, 0, 0, 1, 1,
-0.1116509, 0.7420069, 0.02434989, 1, 0, 0, 1, 1,
-0.1099372, -0.2995806, -2.474479, 0, 0, 0, 1, 1,
-0.1096807, -1.924831, -2.836162, 0, 0, 0, 1, 1,
-0.107968, 0.9017715, -1.080325, 0, 0, 0, 1, 1,
-0.1075144, -0.5297618, -3.699758, 0, 0, 0, 1, 1,
-0.09937555, 0.03175674, -2.303925, 0, 0, 0, 1, 1,
-0.09184803, 0.6023317, -0.1789432, 0, 0, 0, 1, 1,
-0.09068722, 1.278232, 0.08462377, 0, 0, 0, 1, 1,
-0.08574085, 1.371194, 0.2107659, 1, 1, 1, 1, 1,
-0.08079892, -0.932707, -5.20183, 1, 1, 1, 1, 1,
-0.07925748, 1.194968, 0.4644321, 1, 1, 1, 1, 1,
-0.07833461, 0.4330426, 0.682959, 1, 1, 1, 1, 1,
-0.06997301, -0.5543426, -2.566924, 1, 1, 1, 1, 1,
-0.06708312, 0.5513211, -1.215203, 1, 1, 1, 1, 1,
-0.06678391, 0.2629645, -0.6355717, 1, 1, 1, 1, 1,
-0.06191682, -1.235425, -3.828402, 1, 1, 1, 1, 1,
-0.06132529, 0.2136194, -1.066701, 1, 1, 1, 1, 1,
-0.05678621, 1.017815, 1.623181, 1, 1, 1, 1, 1,
-0.05571273, -0.8388129, -3.683161, 1, 1, 1, 1, 1,
-0.05520886, 0.839898, -1.947373, 1, 1, 1, 1, 1,
-0.05505042, 0.708653, -1.294586, 1, 1, 1, 1, 1,
-0.05416587, -1.365651, -5.69766, 1, 1, 1, 1, 1,
-0.05182044, -2.448521, -2.839139, 1, 1, 1, 1, 1,
-0.048258, -0.7258778, -3.905416, 0, 0, 1, 1, 1,
-0.03713259, 1.555258, -1.307747, 1, 0, 0, 1, 1,
-0.03706956, -0.08213982, -1.86975, 1, 0, 0, 1, 1,
-0.03417841, 0.3892296, -0.2665552, 1, 0, 0, 1, 1,
-0.02730058, -0.9071044, -3.106716, 1, 0, 0, 1, 1,
-0.02286911, 0.3795498, 1.395545, 1, 0, 0, 1, 1,
-0.02113279, 1.617607, -0.705805, 0, 0, 0, 1, 1,
-0.02078796, -1.928067, -4.771473, 0, 0, 0, 1, 1,
-0.01845254, 0.031705, -1.511025, 0, 0, 0, 1, 1,
-0.01816731, 0.3277211, 0.2411031, 0, 0, 0, 1, 1,
-0.01673414, -0.4361745, -4.270389, 0, 0, 0, 1, 1,
-0.01379986, 1.149593, -0.4348188, 0, 0, 0, 1, 1,
-0.01043949, 1.247622, 0.90861, 0, 0, 0, 1, 1,
-0.01026137, 1.787012, 0.804019, 1, 1, 1, 1, 1,
-0.008788804, -1.00588, -2.459228, 1, 1, 1, 1, 1,
-0.007642942, 0.3074647, 1.074743, 1, 1, 1, 1, 1,
-0.005569739, 1.17458, 0.5843141, 1, 1, 1, 1, 1,
-0.004511176, -1.180281, -1.093574, 1, 1, 1, 1, 1,
-0.003634254, -0.8963979, -3.981346, 1, 1, 1, 1, 1,
-1.799583e-05, -0.5043612, -1.908412, 1, 1, 1, 1, 1,
0.003653621, -0.779365, 3.343665, 1, 1, 1, 1, 1,
0.004209378, -0.5473556, 4.98879, 1, 1, 1, 1, 1,
0.009876523, -0.07194804, 2.868738, 1, 1, 1, 1, 1,
0.01149631, -0.1775583, -0.03170516, 1, 1, 1, 1, 1,
0.01646473, 0.6344296, 1.147707, 1, 1, 1, 1, 1,
0.01652313, -0.5687874, 3.288155, 1, 1, 1, 1, 1,
0.0216484, -2.716642, 2.222097, 1, 1, 1, 1, 1,
0.02401317, -0.1957109, 2.429051, 1, 1, 1, 1, 1,
0.02597233, -0.2474293, 1.004497, 0, 0, 1, 1, 1,
0.02680548, 0.4189499, -0.229301, 1, 0, 0, 1, 1,
0.02984144, 0.4799481, 0.8236739, 1, 0, 0, 1, 1,
0.0315029, 0.5172877, 1.22343, 1, 0, 0, 1, 1,
0.03398908, -0.07164487, 1.578907, 1, 0, 0, 1, 1,
0.03420049, -2.255973, 3.45463, 1, 0, 0, 1, 1,
0.03458024, -0.1325723, 3.491439, 0, 0, 0, 1, 1,
0.03516757, -1.034986, 2.563358, 0, 0, 0, 1, 1,
0.03669801, -1.360855, 3.80227, 0, 0, 0, 1, 1,
0.0419038, 0.9692162, 0.3232237, 0, 0, 0, 1, 1,
0.04212869, -1.755279, 3.972946, 0, 0, 0, 1, 1,
0.04319297, 0.4772327, -1.559971, 0, 0, 0, 1, 1,
0.04398164, 0.8397818, -0.7845045, 0, 0, 0, 1, 1,
0.04398769, -0.09164367, 1.193244, 1, 1, 1, 1, 1,
0.0460933, -1.38747, 5.069443, 1, 1, 1, 1, 1,
0.04631425, -0.4990741, 2.337931, 1, 1, 1, 1, 1,
0.05086768, -0.9342186, 4.821507, 1, 1, 1, 1, 1,
0.05234952, 0.8825014, -0.2455591, 1, 1, 1, 1, 1,
0.05902757, -0.6947353, 2.696587, 1, 1, 1, 1, 1,
0.05950432, 0.1564912, 1.932368, 1, 1, 1, 1, 1,
0.06381596, 0.0287277, 0.9680647, 1, 1, 1, 1, 1,
0.06558561, -0.09063759, 2.526126, 1, 1, 1, 1, 1,
0.06606253, 0.1874302, -0.6438934, 1, 1, 1, 1, 1,
0.06937776, -1.42191, 3.827667, 1, 1, 1, 1, 1,
0.07337631, 1.5017, 0.1097863, 1, 1, 1, 1, 1,
0.07376661, -0.4810984, 4.271253, 1, 1, 1, 1, 1,
0.09154938, -0.8490519, 1.972151, 1, 1, 1, 1, 1,
0.09941404, 3.30996, -0.09314564, 1, 1, 1, 1, 1,
0.1031885, -0.4699685, 2.500035, 0, 0, 1, 1, 1,
0.1062293, 0.3075591, -0.2231771, 1, 0, 0, 1, 1,
0.106787, 0.9010562, 0.3535258, 1, 0, 0, 1, 1,
0.1107811, 0.1032866, 1.314657, 1, 0, 0, 1, 1,
0.1123128, 1.325313, 0.8194275, 1, 0, 0, 1, 1,
0.1126283, 0.6056705, -0.1821454, 1, 0, 0, 1, 1,
0.1186837, -0.2462477, 1.909519, 0, 0, 0, 1, 1,
0.122697, 1.315801, 0.4064077, 0, 0, 0, 1, 1,
0.1264433, -2.623084, 3.312958, 0, 0, 0, 1, 1,
0.1268517, -0.3401712, 2.851279, 0, 0, 0, 1, 1,
0.1281069, -0.7979788, 1.497329, 0, 0, 0, 1, 1,
0.1286144, 0.4802294, 1.558765, 0, 0, 0, 1, 1,
0.1307994, 0.2213151, 2.769866, 0, 0, 0, 1, 1,
0.1313244, -1.179592, 3.396082, 1, 1, 1, 1, 1,
0.1348843, -0.8012071, 2.604858, 1, 1, 1, 1, 1,
0.1368072, 0.2356669, 0.1966874, 1, 1, 1, 1, 1,
0.1368539, 0.9559381, -0.5377205, 1, 1, 1, 1, 1,
0.1375898, -0.3078876, 1.736814, 1, 1, 1, 1, 1,
0.1433733, 0.7669294, 0.1543711, 1, 1, 1, 1, 1,
0.1469611, 0.0103659, 0.7755418, 1, 1, 1, 1, 1,
0.1473438, -1.360662, 2.917638, 1, 1, 1, 1, 1,
0.1488426, 1.541105, 0.4271472, 1, 1, 1, 1, 1,
0.1498322, -0.07689311, 0.9280808, 1, 1, 1, 1, 1,
0.1534842, -2.923999, 2.731814, 1, 1, 1, 1, 1,
0.1559205, -1.46599, 2.251423, 1, 1, 1, 1, 1,
0.1612096, -0.7997201, 2.907585, 1, 1, 1, 1, 1,
0.1622986, 0.3801749, 1.374968, 1, 1, 1, 1, 1,
0.1625657, 0.5643365, 0.2140541, 1, 1, 1, 1, 1,
0.1628939, -0.08742724, 0.7007915, 0, 0, 1, 1, 1,
0.1629968, 1.142611, 0.7137591, 1, 0, 0, 1, 1,
0.1673663, 0.8398803, 1.111505, 1, 0, 0, 1, 1,
0.1703875, 0.9197984, 1.335413, 1, 0, 0, 1, 1,
0.1793939, -0.8236069, 1.652526, 1, 0, 0, 1, 1,
0.179735, -0.7116731, 2.391001, 1, 0, 0, 1, 1,
0.1826313, -0.07861917, 3.910507, 0, 0, 0, 1, 1,
0.1834863, 0.3263755, -0.7515496, 0, 0, 0, 1, 1,
0.1898037, 0.9520239, 0.1542761, 0, 0, 0, 1, 1,
0.1907127, 0.2353258, 0.9980593, 0, 0, 0, 1, 1,
0.1942088, 1.522808, 0.8024911, 0, 0, 0, 1, 1,
0.1970861, -0.4200551, 1.233535, 0, 0, 0, 1, 1,
0.2006551, -1.016251, 2.241436, 0, 0, 0, 1, 1,
0.2055421, 1.324808, 0.7295456, 1, 1, 1, 1, 1,
0.2087216, -1.539159, 3.714277, 1, 1, 1, 1, 1,
0.2103532, 1.935636, -0.4283193, 1, 1, 1, 1, 1,
0.210887, -0.1670246, 0.9453487, 1, 1, 1, 1, 1,
0.2138032, -0.4021204, 3.888419, 1, 1, 1, 1, 1,
0.2140054, 0.2131365, 0.2450941, 1, 1, 1, 1, 1,
0.2158004, 0.04131437, 0.4802097, 1, 1, 1, 1, 1,
0.2177159, 0.577711, 0.4626023, 1, 1, 1, 1, 1,
0.219366, 0.172001, 0.7199885, 1, 1, 1, 1, 1,
0.2258705, -0.02716248, 3.674439, 1, 1, 1, 1, 1,
0.2277313, 0.5156358, -1.434523, 1, 1, 1, 1, 1,
0.2301762, -0.2482656, 1.843668, 1, 1, 1, 1, 1,
0.2321735, 0.01060845, 1.365292, 1, 1, 1, 1, 1,
0.2326745, 3.735914, -2.293517, 1, 1, 1, 1, 1,
0.2349652, -0.5035902, 1.607112, 1, 1, 1, 1, 1,
0.2383818, 0.8397301, 1.032407, 0, 0, 1, 1, 1,
0.238428, 0.325769, 2.236916, 1, 0, 0, 1, 1,
0.2433048, 1.293758, 0.9656481, 1, 0, 0, 1, 1,
0.243482, -2.175293, 3.498713, 1, 0, 0, 1, 1,
0.2458516, 1.04236, 1.245304, 1, 0, 0, 1, 1,
0.2466166, -0.8566673, 2.696604, 1, 0, 0, 1, 1,
0.2488494, -0.6516342, 3.923545, 0, 0, 0, 1, 1,
0.2490896, 0.3368854, -1.885232, 0, 0, 0, 1, 1,
0.2504565, -0.01171028, 2.065336, 0, 0, 0, 1, 1,
0.2530176, -0.6172806, 3.734675, 0, 0, 0, 1, 1,
0.2532879, -0.853346, 2.55596, 0, 0, 0, 1, 1,
0.2564624, -0.8702636, 4.030038, 0, 0, 0, 1, 1,
0.256695, 0.2097651, 0.03596255, 0, 0, 0, 1, 1,
0.2576897, -0.5895231, 2.660455, 1, 1, 1, 1, 1,
0.2638045, 0.8792699, -0.5767717, 1, 1, 1, 1, 1,
0.2683637, -0.3087791, -0.06830843, 1, 1, 1, 1, 1,
0.2690834, 0.8982195, 2.189266, 1, 1, 1, 1, 1,
0.2691628, 0.8051031, -0.1077026, 1, 1, 1, 1, 1,
0.2697822, 0.8715178, 0.8949847, 1, 1, 1, 1, 1,
0.2743957, 0.8942761, -0.1649091, 1, 1, 1, 1, 1,
0.2808159, -1.880457, 3.249287, 1, 1, 1, 1, 1,
0.2825115, 0.211868, 0.5177498, 1, 1, 1, 1, 1,
0.285821, 0.1060205, 0.8161042, 1, 1, 1, 1, 1,
0.2872543, -0.1555516, 1.52722, 1, 1, 1, 1, 1,
0.2893876, 0.6006602, 2.227746, 1, 1, 1, 1, 1,
0.2904546, -0.4719361, 3.341156, 1, 1, 1, 1, 1,
0.2945397, -0.7022465, 2.244556, 1, 1, 1, 1, 1,
0.2958835, -2.009972, 3.202863, 1, 1, 1, 1, 1,
0.3010105, 0.8958557, 1.296941, 0, 0, 1, 1, 1,
0.3029153, -1.335627, 3.816641, 1, 0, 0, 1, 1,
0.3032254, 0.05756416, 0.4412526, 1, 0, 0, 1, 1,
0.3051781, -0.420073, 2.692218, 1, 0, 0, 1, 1,
0.3053013, -0.7755335, 3.734208, 1, 0, 0, 1, 1,
0.3061155, -1.218924, 3.35925, 1, 0, 0, 1, 1,
0.3073587, -1.880891, 4.453165, 0, 0, 0, 1, 1,
0.3125705, -0.1899467, 1.960068, 0, 0, 0, 1, 1,
0.3184979, 0.561559, 0.1549386, 0, 0, 0, 1, 1,
0.3191577, -0.3063113, 1.367762, 0, 0, 0, 1, 1,
0.3241211, 0.1904826, -0.1990342, 0, 0, 0, 1, 1,
0.3248061, 1.477413, -0.06530397, 0, 0, 0, 1, 1,
0.3303525, -0.5699638, 2.739676, 0, 0, 0, 1, 1,
0.3314018, 1.397169, 0.168262, 1, 1, 1, 1, 1,
0.3315596, -0.3097515, 1.050573, 1, 1, 1, 1, 1,
0.3316224, 0.2374403, 1.086222, 1, 1, 1, 1, 1,
0.3338808, -0.7704045, 2.422804, 1, 1, 1, 1, 1,
0.3339533, -0.6478081, 3.521952, 1, 1, 1, 1, 1,
0.3362076, -0.8870257, 1.078689, 1, 1, 1, 1, 1,
0.3403667, -0.4462632, 2.172103, 1, 1, 1, 1, 1,
0.3415173, 0.8317991, 0.2555207, 1, 1, 1, 1, 1,
0.3421551, 0.3203025, 1.085945, 1, 1, 1, 1, 1,
0.3427557, 0.2808051, 2.043887, 1, 1, 1, 1, 1,
0.3428557, 0.5394959, -0.05238898, 1, 1, 1, 1, 1,
0.3446752, 0.4664922, 3.198654, 1, 1, 1, 1, 1,
0.34555, 0.5515903, 0.5754236, 1, 1, 1, 1, 1,
0.350122, 0.1107655, 1.499665, 1, 1, 1, 1, 1,
0.3501584, 2.226338, 1.625873, 1, 1, 1, 1, 1,
0.3518171, -0.7906348, 2.49244, 0, 0, 1, 1, 1,
0.3572443, -0.4894093, 2.890671, 1, 0, 0, 1, 1,
0.3576244, 0.7345704, 0.5657455, 1, 0, 0, 1, 1,
0.3580437, 0.4403954, 0.9345381, 1, 0, 0, 1, 1,
0.3610769, -1.151943, 2.786473, 1, 0, 0, 1, 1,
0.3651421, 0.2857661, 0.0530143, 1, 0, 0, 1, 1,
0.3661585, 1.486824, 0.04697101, 0, 0, 0, 1, 1,
0.3691252, 0.9311672, 0.6933999, 0, 0, 0, 1, 1,
0.3701333, -0.6215456, 3.874277, 0, 0, 0, 1, 1,
0.3816576, 0.370704, 1.923666, 0, 0, 0, 1, 1,
0.3818174, -0.3591619, 1.565482, 0, 0, 0, 1, 1,
0.3847461, 1.219624, -0.1003231, 0, 0, 0, 1, 1,
0.3893818, 0.2723546, 0.7357114, 0, 0, 0, 1, 1,
0.3910973, -0.3584509, 2.115894, 1, 1, 1, 1, 1,
0.3930459, 1.618017, -0.7425831, 1, 1, 1, 1, 1,
0.3963292, -0.521395, 0.9770839, 1, 1, 1, 1, 1,
0.396482, 0.5428677, -0.5852147, 1, 1, 1, 1, 1,
0.4011131, 0.6925295, 0.6813284, 1, 1, 1, 1, 1,
0.4060266, -0.6447838, 2.424593, 1, 1, 1, 1, 1,
0.4073524, -0.5350243, 2.289301, 1, 1, 1, 1, 1,
0.4110457, 2.174956, -0.159598, 1, 1, 1, 1, 1,
0.4172575, 2.058211, 1.853436, 1, 1, 1, 1, 1,
0.4197241, 0.7430201, 2.210983, 1, 1, 1, 1, 1,
0.4211328, 0.1657611, 1.756044, 1, 1, 1, 1, 1,
0.4244014, 0.7538985, 0.9670988, 1, 1, 1, 1, 1,
0.4251956, 0.4950506, 1.315516, 1, 1, 1, 1, 1,
0.4305798, 1.371476, -0.6075112, 1, 1, 1, 1, 1,
0.4345417, 0.09781469, 2.549691, 1, 1, 1, 1, 1,
0.4395428, 1.252644, 2.184466, 0, 0, 1, 1, 1,
0.4420092, 0.821307, 0.8762098, 1, 0, 0, 1, 1,
0.4432815, -1.811014, 3.21531, 1, 0, 0, 1, 1,
0.4460005, -1.260672, 3.522333, 1, 0, 0, 1, 1,
0.446799, 2.054731, -2.084397, 1, 0, 0, 1, 1,
0.4555866, 1.555121, 1.404289, 1, 0, 0, 1, 1,
0.457203, 1.032753, 0.4909371, 0, 0, 0, 1, 1,
0.4575154, -1.031246, 3.131652, 0, 0, 0, 1, 1,
0.4617084, -1.079975, 2.989466, 0, 0, 0, 1, 1,
0.466502, -0.3822803, 1.24659, 0, 0, 0, 1, 1,
0.4696625, -1.329059, 0.9299577, 0, 0, 0, 1, 1,
0.4704128, -0.8803228, 3.546558, 0, 0, 0, 1, 1,
0.4713219, 0.2535075, 1.856422, 0, 0, 0, 1, 1,
0.4729283, -0.1233237, 1.747827, 1, 1, 1, 1, 1,
0.4763789, -0.6864974, 1.696563, 1, 1, 1, 1, 1,
0.4773708, 0.8714719, 0.6925389, 1, 1, 1, 1, 1,
0.4775103, 0.8120868, -2.208761, 1, 1, 1, 1, 1,
0.4812811, -0.7576263, 3.995357, 1, 1, 1, 1, 1,
0.4840087, 0.9994659, 2.107593, 1, 1, 1, 1, 1,
0.4854287, -0.264856, 2.749121, 1, 1, 1, 1, 1,
0.4876269, -0.195573, 2.267207, 1, 1, 1, 1, 1,
0.4889771, 0.4427143, 1.453055, 1, 1, 1, 1, 1,
0.493783, -1.517733, 3.015902, 1, 1, 1, 1, 1,
0.4985477, 0.05198477, 0.8165066, 1, 1, 1, 1, 1,
0.5002696, -1.383349, 3.126089, 1, 1, 1, 1, 1,
0.5006162, -0.8860563, 0.6277139, 1, 1, 1, 1, 1,
0.5037232, -0.1289359, 3.340613, 1, 1, 1, 1, 1,
0.5141037, 0.3242686, 1.80707, 1, 1, 1, 1, 1,
0.5167004, -1.198127, 3.791255, 0, 0, 1, 1, 1,
0.5167472, -0.006108426, 3.049826, 1, 0, 0, 1, 1,
0.5227162, -0.09842034, 0.9719406, 1, 0, 0, 1, 1,
0.5228497, 0.3151522, 0.5633405, 1, 0, 0, 1, 1,
0.5237147, 0.1865961, -1.476817, 1, 0, 0, 1, 1,
0.5239192, -2.56904, 4.135636, 1, 0, 0, 1, 1,
0.5272871, -0.4752603, 1.046426, 0, 0, 0, 1, 1,
0.5292225, 0.1013362, 1.029471, 0, 0, 0, 1, 1,
0.5339985, 0.03598206, 0.5450039, 0, 0, 0, 1, 1,
0.5356313, 0.253779, 0.8298708, 0, 0, 0, 1, 1,
0.539812, -0.1375988, 2.021769, 0, 0, 0, 1, 1,
0.542634, 0.3093683, 0.6989506, 0, 0, 0, 1, 1,
0.5452966, 1.687696, -0.8747988, 0, 0, 0, 1, 1,
0.5456989, 1.934996, 2.042389, 1, 1, 1, 1, 1,
0.5523647, -1.867032, 3.389484, 1, 1, 1, 1, 1,
0.5595525, -0.2521265, 1.063735, 1, 1, 1, 1, 1,
0.5606234, 0.3280283, 0.3446061, 1, 1, 1, 1, 1,
0.5630707, 1.339286, 0.9852127, 1, 1, 1, 1, 1,
0.56356, -0.6193706, 3.540093, 1, 1, 1, 1, 1,
0.5641415, -0.1772457, 1.108361, 1, 1, 1, 1, 1,
0.5698406, -0.6632178, 2.922784, 1, 1, 1, 1, 1,
0.574407, -2.337592, 3.008183, 1, 1, 1, 1, 1,
0.5761093, 1.718014, -0.08723555, 1, 1, 1, 1, 1,
0.5808966, 0.2016356, 1.527271, 1, 1, 1, 1, 1,
0.5836076, 0.1996664, 2.224715, 1, 1, 1, 1, 1,
0.5843791, -0.8108346, 2.513914, 1, 1, 1, 1, 1,
0.5868015, -0.579066, 3.535356, 1, 1, 1, 1, 1,
0.587231, 1.736102, -0.5118935, 1, 1, 1, 1, 1,
0.5890577, 0.3098583, 3.420488, 0, 0, 1, 1, 1,
0.596448, -1.0494, 0.3453321, 1, 0, 0, 1, 1,
0.5971897, -1.977425, 2.359616, 1, 0, 0, 1, 1,
0.6016669, -1.051834, 0.563407, 1, 0, 0, 1, 1,
0.6122371, -0.08610665, 1.654852, 1, 0, 0, 1, 1,
0.6130989, 0.1459911, -0.5548239, 1, 0, 0, 1, 1,
0.6167226, -1.172616, 2.37909, 0, 0, 0, 1, 1,
0.6191879, -0.03768634, 2.790124, 0, 0, 0, 1, 1,
0.6315243, 1.161788, -0.2256154, 0, 0, 0, 1, 1,
0.632964, -1.615913, 2.628438, 0, 0, 0, 1, 1,
0.633062, -0.8018812, 0.7714255, 0, 0, 0, 1, 1,
0.6357011, -1.253023, 2.276642, 0, 0, 0, 1, 1,
0.6473333, -0.763561, 1.417753, 0, 0, 0, 1, 1,
0.6477433, 0.7495372, -1.308869, 1, 1, 1, 1, 1,
0.6516063, 1.347051, 1.149576, 1, 1, 1, 1, 1,
0.6578659, -0.2324212, 1.692104, 1, 1, 1, 1, 1,
0.6633613, 0.5788884, 1.111023, 1, 1, 1, 1, 1,
0.664207, -0.05150553, 0.8538334, 1, 1, 1, 1, 1,
0.6686695, 0.06924263, 2.816754, 1, 1, 1, 1, 1,
0.6762581, 0.7086897, -0.6750137, 1, 1, 1, 1, 1,
0.6773276, 0.2054787, 0.4352494, 1, 1, 1, 1, 1,
0.6796637, -2.566137, 1.241164, 1, 1, 1, 1, 1,
0.6812956, 0.4626174, 1.260745, 1, 1, 1, 1, 1,
0.6863687, -0.1743507, 2.859969, 1, 1, 1, 1, 1,
0.6909118, -0.583927, 3.373103, 1, 1, 1, 1, 1,
0.6951163, -0.4981606, 3.247796, 1, 1, 1, 1, 1,
0.6961798, 0.05250243, 2.028723, 1, 1, 1, 1, 1,
0.7013673, 0.7713803, 1.710803, 1, 1, 1, 1, 1,
0.7020599, -0.2952437, 0.930505, 0, 0, 1, 1, 1,
0.7028225, -1.510427, 3.120987, 1, 0, 0, 1, 1,
0.7076777, 0.01403515, 2.746259, 1, 0, 0, 1, 1,
0.7094606, 0.9799598, 1.232323, 1, 0, 0, 1, 1,
0.7127898, 1.756934, 0.359991, 1, 0, 0, 1, 1,
0.7176556, -1.008427, 1.798141, 1, 0, 0, 1, 1,
0.7185572, 0.6812409, -1.011002, 0, 0, 0, 1, 1,
0.7223196, -0.5234947, 2.721002, 0, 0, 0, 1, 1,
0.7233745, 0.6474179, -0.5053787, 0, 0, 0, 1, 1,
0.7254712, -1.252354, 2.495239, 0, 0, 0, 1, 1,
0.7274072, -0.1662895, 1.142325, 0, 0, 0, 1, 1,
0.7332714, -0.7866222, 3.234936, 0, 0, 0, 1, 1,
0.7372134, 0.6229191, 0.04530499, 0, 0, 0, 1, 1,
0.7440341, -1.012958, 3.723804, 1, 1, 1, 1, 1,
0.7491789, 0.8675513, 0.4255036, 1, 1, 1, 1, 1,
0.7512067, 0.103804, 1.840739, 1, 1, 1, 1, 1,
0.7541932, 0.08616579, 0.8067724, 1, 1, 1, 1, 1,
0.7615712, -0.5042218, 1.600233, 1, 1, 1, 1, 1,
0.7640008, -1.184703, 1.716976, 1, 1, 1, 1, 1,
0.7649723, -1.546277, 2.74974, 1, 1, 1, 1, 1,
0.7687903, 0.3532347, 0.854511, 1, 1, 1, 1, 1,
0.7692711, -0.396873, 2.650396, 1, 1, 1, 1, 1,
0.7720581, -1.260509, 1.513262, 1, 1, 1, 1, 1,
0.7798679, -0.7005832, 1.205445, 1, 1, 1, 1, 1,
0.7809208, 0.1006295, 2.479453, 1, 1, 1, 1, 1,
0.7811354, -0.5945765, -0.2679728, 1, 1, 1, 1, 1,
0.7823946, 0.1685111, 0.6177068, 1, 1, 1, 1, 1,
0.7890347, 1.917317, 0.09052616, 1, 1, 1, 1, 1,
0.7895904, 1.442734, 1.219067, 0, 0, 1, 1, 1,
0.7924673, -1.060144, 2.510171, 1, 0, 0, 1, 1,
0.7936482, 2.430626, 1.641204, 1, 0, 0, 1, 1,
0.7944914, -0.3804893, 1.671193, 1, 0, 0, 1, 1,
0.7964091, -1.033284, 3.113446, 1, 0, 0, 1, 1,
0.7984057, -0.4727024, 2.792596, 1, 0, 0, 1, 1,
0.8011026, -2.100076, 0.5135937, 0, 0, 0, 1, 1,
0.8063838, 0.67675, 1.512901, 0, 0, 0, 1, 1,
0.8106326, -1.654802, 3.568979, 0, 0, 0, 1, 1,
0.821409, 0.2992278, 1.709495, 0, 0, 0, 1, 1,
0.8225631, 1.495367, 1.874446, 0, 0, 0, 1, 1,
0.827115, -0.3241058, 2.051813, 0, 0, 0, 1, 1,
0.8275486, -1.521822, 3.398843, 0, 0, 0, 1, 1,
0.8289297, -0.9157678, 1.558696, 1, 1, 1, 1, 1,
0.8309559, 0.9223336, 3.517798, 1, 1, 1, 1, 1,
0.8371532, 0.2415159, 0.2267651, 1, 1, 1, 1, 1,
0.8420475, 0.4358279, 1.211449, 1, 1, 1, 1, 1,
0.844084, 1.025114, -0.7979019, 1, 1, 1, 1, 1,
0.8506176, -1.833433, 1.966807, 1, 1, 1, 1, 1,
0.8541801, -0.6185175, 2.691768, 1, 1, 1, 1, 1,
0.8586226, -1.142751, 2.341146, 1, 1, 1, 1, 1,
0.8677001, 0.3133435, 1.915009, 1, 1, 1, 1, 1,
0.8698806, 0.777953, 0.9120542, 1, 1, 1, 1, 1,
0.8714242, -0.2417521, 1.601484, 1, 1, 1, 1, 1,
0.879329, 0.5848278, 0.8444387, 1, 1, 1, 1, 1,
0.893272, 1.05728, 2.825202, 1, 1, 1, 1, 1,
0.8960813, -0.2054806, 1.755688, 1, 1, 1, 1, 1,
0.8968342, 1.239704, 0.7584795, 1, 1, 1, 1, 1,
0.9010962, 3.005512, -0.6270531, 0, 0, 1, 1, 1,
0.9029899, -0.8741367, 1.917456, 1, 0, 0, 1, 1,
0.9073047, -1.258996, 3.869464, 1, 0, 0, 1, 1,
0.9112781, 0.8202732, 0.9890975, 1, 0, 0, 1, 1,
0.9135605, 0.05503889, 3.295293, 1, 0, 0, 1, 1,
0.9143121, 1.136604, 0.9215655, 1, 0, 0, 1, 1,
0.915668, -0.6725926, 3.925807, 0, 0, 0, 1, 1,
0.9264523, -0.3009462, 2.074998, 0, 0, 0, 1, 1,
0.9296936, 0.05360177, 0.8384607, 0, 0, 0, 1, 1,
0.9300552, -0.3766625, 1.1824, 0, 0, 0, 1, 1,
0.938031, 0.7849562, 2.018079, 0, 0, 0, 1, 1,
0.9419706, 1.585959, 0.3697236, 0, 0, 0, 1, 1,
0.9430292, -0.08917061, 2.670961, 0, 0, 0, 1, 1,
0.9435033, -1.066845, 1.558172, 1, 1, 1, 1, 1,
0.9561587, -0.2675796, 2.694119, 1, 1, 1, 1, 1,
0.9601525, -0.5051097, 1.816936, 1, 1, 1, 1, 1,
0.9607401, 1.421706, -1.124257, 1, 1, 1, 1, 1,
0.9652259, -0.02106119, 1.726595, 1, 1, 1, 1, 1,
0.9683688, 2.073889, 0.2967092, 1, 1, 1, 1, 1,
0.9689094, 0.9261032, 1.444764, 1, 1, 1, 1, 1,
0.971527, -0.06966144, 1.704386, 1, 1, 1, 1, 1,
0.9786918, 0.3873163, -0.1653789, 1, 1, 1, 1, 1,
0.9813753, 0.4226444, 0.5392889, 1, 1, 1, 1, 1,
0.9813798, -1.565779, 2.635023, 1, 1, 1, 1, 1,
0.983354, 0.8770163, -0.2369713, 1, 1, 1, 1, 1,
0.9844716, 0.5730528, 1.342593, 1, 1, 1, 1, 1,
0.9845065, 3.03311, 0.1812198, 1, 1, 1, 1, 1,
0.9846638, -0.7358128, 1.952317, 1, 1, 1, 1, 1,
0.9853231, 0.06518037, 1.941193, 0, 0, 1, 1, 1,
0.9885588, -0.2921224, 0.9961417, 1, 0, 0, 1, 1,
0.9936637, 0.8059142, 0.8572883, 1, 0, 0, 1, 1,
1.008947, -0.5974645, 0.9991099, 1, 0, 0, 1, 1,
1.009876, -0.7288834, 3.074935, 1, 0, 0, 1, 1,
1.016242, -0.5026951, 2.427897, 1, 0, 0, 1, 1,
1.02356, -0.6969803, 3.076718, 0, 0, 0, 1, 1,
1.023854, 0.1305918, 3.212238, 0, 0, 0, 1, 1,
1.027253, -1.679308, 3.93381, 0, 0, 0, 1, 1,
1.02972, 0.6707756, 1.448193, 0, 0, 0, 1, 1,
1.03283, -1.273181, 1.527232, 0, 0, 0, 1, 1,
1.041595, 1.292981, 0.02931392, 0, 0, 0, 1, 1,
1.043463, 0.5137991, 1.909686, 0, 0, 0, 1, 1,
1.044252, -0.7243271, 1.869358, 1, 1, 1, 1, 1,
1.04918, -2.326479, 3.555405, 1, 1, 1, 1, 1,
1.052261, 0.525028, 1.938734, 1, 1, 1, 1, 1,
1.052521, 0.4373936, 0.5375969, 1, 1, 1, 1, 1,
1.052669, 0.2433327, 2.368381, 1, 1, 1, 1, 1,
1.057176, -1.597999, 1.85994, 1, 1, 1, 1, 1,
1.057509, -1.673819, 2.602703, 1, 1, 1, 1, 1,
1.058755, 0.2744712, 1.21598, 1, 1, 1, 1, 1,
1.064936, 1.529561, 1.194833, 1, 1, 1, 1, 1,
1.066526, 0.2843303, 2.200876, 1, 1, 1, 1, 1,
1.071918, -0.4804657, 1.699904, 1, 1, 1, 1, 1,
1.074034, 0.005570474, 1.795681, 1, 1, 1, 1, 1,
1.07714, -0.5092506, 1.837593, 1, 1, 1, 1, 1,
1.084361, 1.873433, 0.241251, 1, 1, 1, 1, 1,
1.086738, -1.393155, 2.379913, 1, 1, 1, 1, 1,
1.09692, 1.603584, -0.5058033, 0, 0, 1, 1, 1,
1.097343, 0.3222041, -0.02901393, 1, 0, 0, 1, 1,
1.104444, 0.1841226, 1.210784, 1, 0, 0, 1, 1,
1.10516, -0.2422292, 2.651649, 1, 0, 0, 1, 1,
1.105975, 0.08190033, 2.746805, 1, 0, 0, 1, 1,
1.109667, 0.356884, 1.232311, 1, 0, 0, 1, 1,
1.112698, 0.5358942, -0.493734, 0, 0, 0, 1, 1,
1.113266, 0.990958, 0.3991151, 0, 0, 0, 1, 1,
1.116556, -0.5861011, 3.745454, 0, 0, 0, 1, 1,
1.118812, -1.527369, 2.933478, 0, 0, 0, 1, 1,
1.120322, -1.291114, 2.892715, 0, 0, 0, 1, 1,
1.121424, 0.2262791, 1.980329, 0, 0, 0, 1, 1,
1.12291, -0.6201032, 2.197289, 0, 0, 0, 1, 1,
1.124218, -1.78139, 3.247767, 1, 1, 1, 1, 1,
1.127412, -0.2423182, -0.3321521, 1, 1, 1, 1, 1,
1.137288, -1.107041, 3.605687, 1, 1, 1, 1, 1,
1.137762, -0.4340682, 0.9018694, 1, 1, 1, 1, 1,
1.140101, -0.9040495, 2.856733, 1, 1, 1, 1, 1,
1.151808, -0.8848355, 2.172019, 1, 1, 1, 1, 1,
1.152038, -0.9550235, 3.147785, 1, 1, 1, 1, 1,
1.16162, 0.5399343, 1.954436, 1, 1, 1, 1, 1,
1.173641, -0.3858852, 1.143891, 1, 1, 1, 1, 1,
1.174551, 0.7368127, 1.458386, 1, 1, 1, 1, 1,
1.182807, -0.5440095, 1.594445, 1, 1, 1, 1, 1,
1.182837, 0.4762291, -0.02518449, 1, 1, 1, 1, 1,
1.184193, -0.7853613, 2.808086, 1, 1, 1, 1, 1,
1.185352, 0.6353632, 1.243449, 1, 1, 1, 1, 1,
1.186483, 1.994474, 2.924078, 1, 1, 1, 1, 1,
1.186802, -0.4998103, 1.236152, 0, 0, 1, 1, 1,
1.187685, -0.5405011, 3.261164, 1, 0, 0, 1, 1,
1.195656, -0.4068766, 2.522277, 1, 0, 0, 1, 1,
1.19664, 1.251987, 0.8822812, 1, 0, 0, 1, 1,
1.202893, 1.534329, 2.374761, 1, 0, 0, 1, 1,
1.203492, -1.263035, 2.821537, 1, 0, 0, 1, 1,
1.204925, 0.71689, 1.885803, 0, 0, 0, 1, 1,
1.207988, 0.248931, 1.504304, 0, 0, 0, 1, 1,
1.208976, -0.0836727, -0.185465, 0, 0, 0, 1, 1,
1.214208, -1.119741, 1.440105, 0, 0, 0, 1, 1,
1.222742, 0.3794244, 1.791211, 0, 0, 0, 1, 1,
1.234201, -0.1475738, 1.191623, 0, 0, 0, 1, 1,
1.242078, -3.587038, 2.685173, 0, 0, 0, 1, 1,
1.243266, 0.4726864, 1.501738, 1, 1, 1, 1, 1,
1.25428, 0.8980782, 0.8045737, 1, 1, 1, 1, 1,
1.259519, 1.085664, -1.217318, 1, 1, 1, 1, 1,
1.259797, 0.005714487, -0.5594476, 1, 1, 1, 1, 1,
1.269169, -0.4316125, 1.110608, 1, 1, 1, 1, 1,
1.271721, 0.6770927, -0.841125, 1, 1, 1, 1, 1,
1.272316, 0.4222648, 2.098141, 1, 1, 1, 1, 1,
1.272893, 0.2710295, 0.5777667, 1, 1, 1, 1, 1,
1.276264, 2.934449, 0.4297436, 1, 1, 1, 1, 1,
1.279006, 1.230716, -0.2839524, 1, 1, 1, 1, 1,
1.295406, -0.6115981, 1.374285, 1, 1, 1, 1, 1,
1.300267, -1.352684, 4.069006, 1, 1, 1, 1, 1,
1.302925, -0.7620376, 3.222482, 1, 1, 1, 1, 1,
1.313262, -0.8575594, 1.143212, 1, 1, 1, 1, 1,
1.319553, -0.4788958, 3.626043, 1, 1, 1, 1, 1,
1.325136, 1.780119, -0.05048814, 0, 0, 1, 1, 1,
1.326363, 1.959282, 0.8584952, 1, 0, 0, 1, 1,
1.353015, 1.067789, -0.8542456, 1, 0, 0, 1, 1,
1.359599, -1.209037, 3.458993, 1, 0, 0, 1, 1,
1.363757, 1.022309, 0.8759773, 1, 0, 0, 1, 1,
1.378138, 0.534824, 0.7982917, 1, 0, 0, 1, 1,
1.396261, -0.1701192, 2.050211, 0, 0, 0, 1, 1,
1.410253, 0.2952004, 0.6758096, 0, 0, 0, 1, 1,
1.424286, 0.5014503, 1.193862, 0, 0, 0, 1, 1,
1.437361, 0.2148762, 3.517163, 0, 0, 0, 1, 1,
1.441808, -1.159919, 3.1572, 0, 0, 0, 1, 1,
1.454587, 0.5200725, 0.2713516, 0, 0, 0, 1, 1,
1.457713, 0.07961069, 2.3929, 0, 0, 0, 1, 1,
1.468475, 2.383426, -0.09549391, 1, 1, 1, 1, 1,
1.471071, 0.1230517, 0.991751, 1, 1, 1, 1, 1,
1.474068, 0.003461137, 1.924186, 1, 1, 1, 1, 1,
1.476881, 0.5768983, 3.978823, 1, 1, 1, 1, 1,
1.479521, 0.7721872, 0.06106268, 1, 1, 1, 1, 1,
1.488903, 0.2818115, 1.274883, 1, 1, 1, 1, 1,
1.49985, -1.210173, 0.2564384, 1, 1, 1, 1, 1,
1.501063, -0.1864201, 2.539444, 1, 1, 1, 1, 1,
1.510926, 1.626856, 1.764797, 1, 1, 1, 1, 1,
1.514151, -0.1587639, 0.7420948, 1, 1, 1, 1, 1,
1.521133, 1.111281, 1.291193, 1, 1, 1, 1, 1,
1.523079, -0.5696092, 1.67653, 1, 1, 1, 1, 1,
1.526744, -1.918282, 1.479991, 1, 1, 1, 1, 1,
1.528937, -0.6455472, 2.683548, 1, 1, 1, 1, 1,
1.529718, 1.522232, 1.791719, 1, 1, 1, 1, 1,
1.530681, 0.4280123, 0.4215065, 0, 0, 1, 1, 1,
1.564755, -0.7284234, 1.350909, 1, 0, 0, 1, 1,
1.5671, -0.797717, -0.05308241, 1, 0, 0, 1, 1,
1.577285, -0.5454084, 1.655001, 1, 0, 0, 1, 1,
1.596268, -0.3048876, -0.4747468, 1, 0, 0, 1, 1,
1.622483, -2.016014, 2.563373, 1, 0, 0, 1, 1,
1.628029, -0.9156868, 2.245136, 0, 0, 0, 1, 1,
1.628369, 0.1261621, 0.09752165, 0, 0, 0, 1, 1,
1.67712, -0.2755887, 0.2422314, 0, 0, 0, 1, 1,
1.678872, 0.4799872, 1.156991, 0, 0, 0, 1, 1,
1.682574, 1.197528, 1.124847, 0, 0, 0, 1, 1,
1.682904, -1.233842, 2.086053, 0, 0, 0, 1, 1,
1.702994, 0.3735977, 1.007209, 0, 0, 0, 1, 1,
1.732839, 1.621029, -0.3659137, 1, 1, 1, 1, 1,
1.749827, 0.5265325, 0.920801, 1, 1, 1, 1, 1,
1.765532, 0.5689987, 0.3017724, 1, 1, 1, 1, 1,
1.803443, -1.300084, 1.24795, 1, 1, 1, 1, 1,
1.80662, 0.1540071, 0.3057139, 1, 1, 1, 1, 1,
1.850231, 1.743487, -0.03479458, 1, 1, 1, 1, 1,
1.872059, 0.3857941, -0.1419958, 1, 1, 1, 1, 1,
1.87411, 1.26991, 1.102745, 1, 1, 1, 1, 1,
1.881979, -0.3921348, 2.65724, 1, 1, 1, 1, 1,
1.908975, 0.339685, 2.411638, 1, 1, 1, 1, 1,
1.951204, 0.3616038, 1.285844, 1, 1, 1, 1, 1,
1.969687, -0.8531334, 3.449789, 1, 1, 1, 1, 1,
1.979831, 1.483725, 0.7649376, 1, 1, 1, 1, 1,
2.01441, 1.642294, 1.0638, 1, 1, 1, 1, 1,
2.033112, -1.400491, 0.8040144, 1, 1, 1, 1, 1,
2.068027, -1.297195, 2.010042, 0, 0, 1, 1, 1,
2.132148, 0.03949482, 3.989918, 1, 0, 0, 1, 1,
2.17575, 0.1752144, 2.384977, 1, 0, 0, 1, 1,
2.18016, -0.6855968, 2.273093, 1, 0, 0, 1, 1,
2.21896, -0.7439287, 3.748943, 1, 0, 0, 1, 1,
2.235562, -2.322879, 0.6870852, 1, 0, 0, 1, 1,
2.253435, 1.492962, 0.914584, 0, 0, 0, 1, 1,
2.271757, 0.08871082, 2.308397, 0, 0, 0, 1, 1,
2.286719, -1.250548, 1.764464, 0, 0, 0, 1, 1,
2.325066, 1.863901, 1.761357, 0, 0, 0, 1, 1,
2.362452, -0.3553461, 2.521406, 0, 0, 0, 1, 1,
2.373477, 0.06798532, 1.174973, 0, 0, 0, 1, 1,
2.461214, -1.0274, 1.766393, 0, 0, 0, 1, 1,
2.539192, -0.6957822, 1.760417, 1, 1, 1, 1, 1,
2.616534, 1.045691, 2.767, 1, 1, 1, 1, 1,
2.630522, 0.7331683, 1.721456, 1, 1, 1, 1, 1,
2.645991, -0.1912516, 2.157119, 1, 1, 1, 1, 1,
2.693599, -0.8958194, 2.853693, 1, 1, 1, 1, 1,
2.936769, -1.642881, 3.021385, 1, 1, 1, 1, 1,
3.344117, -0.2060968, 2.58349, 1, 1, 1, 1, 1
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
var radius = 9.913606;
var distance = 34.82112;
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
mvMatrix.translate( -0.01471734, -0.0744381, 0.3141086 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.82112);
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
