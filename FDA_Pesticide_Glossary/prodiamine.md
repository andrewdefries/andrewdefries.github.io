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
-3.519729, -1.233589, -0.9956345, 1, 0, 0, 1,
-3.239407, -1.05836, -3.634434, 1, 0.007843138, 0, 1,
-3.235632, 0.3907855, -0.5396625, 1, 0.01176471, 0, 1,
-2.913774, 1.11114, -1.457746, 1, 0.01960784, 0, 1,
-2.788602, 3.077005, -2.184606, 1, 0.02352941, 0, 1,
-2.767303, -0.8246689, -2.792917, 1, 0.03137255, 0, 1,
-2.560121, 0.05945073, -0.4634676, 1, 0.03529412, 0, 1,
-2.538283, -1.05757, -2.082481, 1, 0.04313726, 0, 1,
-2.473788, 0.501942, -1.006999, 1, 0.04705882, 0, 1,
-2.358905, -0.01931799, -0.7051002, 1, 0.05490196, 0, 1,
-2.355, 0.3077084, -2.092687, 1, 0.05882353, 0, 1,
-2.351984, 0.6208043, -1.285274, 1, 0.06666667, 0, 1,
-2.329458, -0.4894007, -1.073506, 1, 0.07058824, 0, 1,
-2.326111, 0.2758098, -1.41902, 1, 0.07843138, 0, 1,
-2.188826, -0.8114957, -2.135267, 1, 0.08235294, 0, 1,
-2.161023, -0.7447532, -1.676667, 1, 0.09019608, 0, 1,
-2.149057, 1.012112, -1.078456, 1, 0.09411765, 0, 1,
-2.100321, -1.392092, -1.655918, 1, 0.1019608, 0, 1,
-2.05493, -0.6182034, -2.944823, 1, 0.1098039, 0, 1,
-2.041817, 0.7784367, -1.012465, 1, 0.1137255, 0, 1,
-2.028256, 1.228502, -1.406211, 1, 0.1215686, 0, 1,
-2.025471, -0.7945513, -3.064703, 1, 0.1254902, 0, 1,
-2.001426, -1.55598, -2.166612, 1, 0.1333333, 0, 1,
-1.975564, 0.4839793, -0.8179608, 1, 0.1372549, 0, 1,
-1.934608, -1.483156, -2.992933, 1, 0.145098, 0, 1,
-1.926057, 0.7834382, 0.1827952, 1, 0.1490196, 0, 1,
-1.917413, 1.842071, -0.4003281, 1, 0.1568628, 0, 1,
-1.866644, -0.4974334, -0.9176913, 1, 0.1607843, 0, 1,
-1.851961, -0.2521279, -1.747401, 1, 0.1686275, 0, 1,
-1.839555, -0.2823288, -0.5715984, 1, 0.172549, 0, 1,
-1.81421, -0.4164444, 0.3777419, 1, 0.1803922, 0, 1,
-1.805666, -0.2797147, 0.2889608, 1, 0.1843137, 0, 1,
-1.791759, -0.3243888, -1.819553, 1, 0.1921569, 0, 1,
-1.776426, -0.4772716, -2.377402, 1, 0.1960784, 0, 1,
-1.76993, -0.362195, -2.126728, 1, 0.2039216, 0, 1,
-1.748806, 1.056595, -2.208074, 1, 0.2117647, 0, 1,
-1.726314, -0.7545047, -1.903439, 1, 0.2156863, 0, 1,
-1.706892, -1.121117, -1.527047, 1, 0.2235294, 0, 1,
-1.68393, -1.479664, -2.666388, 1, 0.227451, 0, 1,
-1.664476, 0.2355947, -1.244338, 1, 0.2352941, 0, 1,
-1.641012, -0.3886737, 0.1690147, 1, 0.2392157, 0, 1,
-1.611737, 0.2437281, 0.06315293, 1, 0.2470588, 0, 1,
-1.599573, 1.072978, 0.1405094, 1, 0.2509804, 0, 1,
-1.591244, -1.311526, -2.224288, 1, 0.2588235, 0, 1,
-1.571684, 0.2660632, -2.408976, 1, 0.2627451, 0, 1,
-1.561124, 1.735265, 0.5661172, 1, 0.2705882, 0, 1,
-1.558537, 1.456229, -1.729017, 1, 0.2745098, 0, 1,
-1.556472, -1.196238, -3.494939, 1, 0.282353, 0, 1,
-1.554335, 1.173153, -1.530525, 1, 0.2862745, 0, 1,
-1.546264, 0.1034691, -1.90449, 1, 0.2941177, 0, 1,
-1.544584, -1.12866, -1.910548, 1, 0.3019608, 0, 1,
-1.532151, -0.9156302, -2.791486, 1, 0.3058824, 0, 1,
-1.527473, 1.091003, -1.041414, 1, 0.3137255, 0, 1,
-1.517989, -0.6094611, -1.999194, 1, 0.3176471, 0, 1,
-1.517239, 0.702657, -1.842721, 1, 0.3254902, 0, 1,
-1.509294, 0.994132, -0.932331, 1, 0.3294118, 0, 1,
-1.499853, 1.146588, -1.277973, 1, 0.3372549, 0, 1,
-1.492994, 0.3096027, -2.567686, 1, 0.3411765, 0, 1,
-1.48406, 0.6005528, 0.5772101, 1, 0.3490196, 0, 1,
-1.469114, 0.6594982, -2.065907, 1, 0.3529412, 0, 1,
-1.46824, -0.04119103, -3.115756, 1, 0.3607843, 0, 1,
-1.458235, 0.2918498, -1.370782, 1, 0.3647059, 0, 1,
-1.45467, 0.1680368, -1.528547, 1, 0.372549, 0, 1,
-1.450122, 0.4671673, -1.217346, 1, 0.3764706, 0, 1,
-1.448909, -0.4584047, -2.092244, 1, 0.3843137, 0, 1,
-1.445103, -0.5799949, -1.771488, 1, 0.3882353, 0, 1,
-1.438402, -0.1319004, -0.3739468, 1, 0.3960784, 0, 1,
-1.429173, -0.05111974, -1.498659, 1, 0.4039216, 0, 1,
-1.42574, -0.4106388, -1.215907, 1, 0.4078431, 0, 1,
-1.421918, 0.1684914, -1.718282, 1, 0.4156863, 0, 1,
-1.413098, 0.4231863, -1.765732, 1, 0.4196078, 0, 1,
-1.395414, -0.5726439, -2.999872, 1, 0.427451, 0, 1,
-1.391455, 0.7619556, -1.605852, 1, 0.4313726, 0, 1,
-1.38965, 0.7336112, -1.515592, 1, 0.4392157, 0, 1,
-1.385305, 0.1845405, -0.7694567, 1, 0.4431373, 0, 1,
-1.38026, 1.093055, 0.4564208, 1, 0.4509804, 0, 1,
-1.380183, -0.650317, -2.111535, 1, 0.454902, 0, 1,
-1.357333, -0.1199426, -1.202688, 1, 0.4627451, 0, 1,
-1.348649, -1.278178, -1.563923, 1, 0.4666667, 0, 1,
-1.347548, -1.394432, -1.832965, 1, 0.4745098, 0, 1,
-1.344736, 0.1065648, -0.7923504, 1, 0.4784314, 0, 1,
-1.332379, -0.8626395, -1.62961, 1, 0.4862745, 0, 1,
-1.332134, -0.8531826, -2.318604, 1, 0.4901961, 0, 1,
-1.329299, -0.8242695, -2.306539, 1, 0.4980392, 0, 1,
-1.327072, -0.4220204, -0.2535244, 1, 0.5058824, 0, 1,
-1.326055, -1.919694, -3.069495, 1, 0.509804, 0, 1,
-1.325208, 0.12624, -1.985076, 1, 0.5176471, 0, 1,
-1.316442, -0.4843565, -2.114037, 1, 0.5215687, 0, 1,
-1.315175, -0.5141561, -2.637075, 1, 0.5294118, 0, 1,
-1.311418, 0.7358311, -0.6299394, 1, 0.5333334, 0, 1,
-1.305197, -0.9845842, -2.976312, 1, 0.5411765, 0, 1,
-1.305183, 0.5512511, -0.5090817, 1, 0.5450981, 0, 1,
-1.30281, 1.833116, -0.7391093, 1, 0.5529412, 0, 1,
-1.299889, 1.87783, -1.707791, 1, 0.5568628, 0, 1,
-1.297181, -1.154768, -4.071255, 1, 0.5647059, 0, 1,
-1.29598, 0.4199326, 0.6020079, 1, 0.5686275, 0, 1,
-1.295026, -0.6135177, -2.325367, 1, 0.5764706, 0, 1,
-1.292803, -0.9907226, -2.88915, 1, 0.5803922, 0, 1,
-1.278632, 0.1410969, -2.338295, 1, 0.5882353, 0, 1,
-1.27209, -0.2878201, -2.318066, 1, 0.5921569, 0, 1,
-1.270279, -0.9907504, -1.498233, 1, 0.6, 0, 1,
-1.262026, -1.214864, -2.572927, 1, 0.6078432, 0, 1,
-1.260162, -1.124116, -2.951492, 1, 0.6117647, 0, 1,
-1.257452, 0.8429202, -1.127423, 1, 0.6196079, 0, 1,
-1.241352, -0.5343214, -2.436367, 1, 0.6235294, 0, 1,
-1.238281, 0.1577569, -1.365118, 1, 0.6313726, 0, 1,
-1.237244, 0.1888797, -2.312948, 1, 0.6352941, 0, 1,
-1.234954, -0.2776768, -1.307135, 1, 0.6431373, 0, 1,
-1.234171, 0.4132857, 0.07045853, 1, 0.6470588, 0, 1,
-1.231863, 1.281664, -0.8631098, 1, 0.654902, 0, 1,
-1.216275, -1.289575, -2.355418, 1, 0.6588235, 0, 1,
-1.206086, 0.3249665, -1.874053, 1, 0.6666667, 0, 1,
-1.184615, -0.863291, -2.45937, 1, 0.6705883, 0, 1,
-1.18295, 0.8974468, 0.3022773, 1, 0.6784314, 0, 1,
-1.171416, -1.109709, -2.728313, 1, 0.682353, 0, 1,
-1.154235, 2.116677, 0.5579631, 1, 0.6901961, 0, 1,
-1.149953, -0.8842716, -2.031085, 1, 0.6941177, 0, 1,
-1.144956, -1.335889, -2.139081, 1, 0.7019608, 0, 1,
-1.142651, -0.5744461, -0.9424215, 1, 0.7098039, 0, 1,
-1.135799, -0.185828, -2.041342, 1, 0.7137255, 0, 1,
-1.135078, 0.9108855, -0.2889609, 1, 0.7215686, 0, 1,
-1.129666, 1.473319, -1.517007, 1, 0.7254902, 0, 1,
-1.121064, -0.6322736, -1.696547, 1, 0.7333333, 0, 1,
-1.117295, -0.3454146, -2.032321, 1, 0.7372549, 0, 1,
-1.115772, 1.494113, -1.375471, 1, 0.7450981, 0, 1,
-1.11516, 0.1869316, -1.220825, 1, 0.7490196, 0, 1,
-1.110089, 0.9462956, -0.06006792, 1, 0.7568628, 0, 1,
-1.107472, -0.5093142, -2.329417, 1, 0.7607843, 0, 1,
-1.106443, -0.1168992, -3.723733, 1, 0.7686275, 0, 1,
-1.10307, -2.077018, -3.054986, 1, 0.772549, 0, 1,
-1.102115, -0.1300078, -0.4141598, 1, 0.7803922, 0, 1,
-1.095086, -1.121004, -3.110211, 1, 0.7843137, 0, 1,
-1.093087, -0.4124089, -1.31867, 1, 0.7921569, 0, 1,
-1.09199, -0.1087382, -2.897023, 1, 0.7960784, 0, 1,
-1.076724, 0.006907406, -1.971103, 1, 0.8039216, 0, 1,
-1.074654, -0.02198203, -2.043868, 1, 0.8117647, 0, 1,
-1.064877, -1.140539, -2.756103, 1, 0.8156863, 0, 1,
-1.063632, 0.1951109, -1.13274, 1, 0.8235294, 0, 1,
-1.063532, 0.3780262, -0.58843, 1, 0.827451, 0, 1,
-1.062406, 1.92092, -1.903098, 1, 0.8352941, 0, 1,
-1.057793, 0.6260102, -2.297531, 1, 0.8392157, 0, 1,
-1.052924, 1.603711, -1.369309, 1, 0.8470588, 0, 1,
-1.046579, 0.1133179, -0.9059982, 1, 0.8509804, 0, 1,
-1.046182, -1.284795, 0.1903572, 1, 0.8588235, 0, 1,
-1.045391, -1.308366, -2.174156, 1, 0.8627451, 0, 1,
-1.027715, 1.602908, 0.3454405, 1, 0.8705882, 0, 1,
-1.005926, 1.62066, -0.9935141, 1, 0.8745098, 0, 1,
-1.004562, -0.01145183, -1.598512, 1, 0.8823529, 0, 1,
-1.002634, -1.199579, -2.042234, 1, 0.8862745, 0, 1,
-0.9998736, -0.4883065, -1.743555, 1, 0.8941177, 0, 1,
-0.9976847, 0.6419228, -1.470448, 1, 0.8980392, 0, 1,
-0.9966542, -0.8459219, -1.591995, 1, 0.9058824, 0, 1,
-0.9927096, 0.4060989, -1.068782, 1, 0.9137255, 0, 1,
-0.982671, -0.004265176, -1.794765, 1, 0.9176471, 0, 1,
-0.9793801, -1.066536, -1.709939, 1, 0.9254902, 0, 1,
-0.9784718, -0.4981159, -0.8977122, 1, 0.9294118, 0, 1,
-0.9668229, -1.066546, -3.263285, 1, 0.9372549, 0, 1,
-0.9609023, 1.04185, -0.6401203, 1, 0.9411765, 0, 1,
-0.9534045, -0.3686611, -0.2573331, 1, 0.9490196, 0, 1,
-0.9480546, -0.6517578, -2.157896, 1, 0.9529412, 0, 1,
-0.9473336, 0.9694884, -0.2762951, 1, 0.9607843, 0, 1,
-0.9461314, -0.3457378, -0.3737083, 1, 0.9647059, 0, 1,
-0.9444442, -0.4020509, -0.9585415, 1, 0.972549, 0, 1,
-0.939532, -0.7079494, -0.4914891, 1, 0.9764706, 0, 1,
-0.9348567, 0.3077672, -0.7314228, 1, 0.9843137, 0, 1,
-0.9327609, 1.247112, 1.028804, 1, 0.9882353, 0, 1,
-0.9302465, -1.125261, -3.421039, 1, 0.9960784, 0, 1,
-0.9276364, -2.231328, -2.757779, 0.9960784, 1, 0, 1,
-0.9266591, -0.2728414, -1.510696, 0.9921569, 1, 0, 1,
-0.9247966, -0.2026483, -2.097542, 0.9843137, 1, 0, 1,
-0.9235181, 0.08257342, -2.346526, 0.9803922, 1, 0, 1,
-0.9223542, -1.90407, -4.919884, 0.972549, 1, 0, 1,
-0.9207153, 0.1632759, -2.939347, 0.9686275, 1, 0, 1,
-0.9119635, -1.733208, -2.39013, 0.9607843, 1, 0, 1,
-0.9115191, 0.6095245, -2.035235, 0.9568627, 1, 0, 1,
-0.9095351, 0.1732137, -2.314301, 0.9490196, 1, 0, 1,
-0.9048891, -1.157855, -2.393074, 0.945098, 1, 0, 1,
-0.9032695, 0.2999469, -0.8507677, 0.9372549, 1, 0, 1,
-0.9023463, -0.3419151, -2.91529, 0.9333333, 1, 0, 1,
-0.9017257, -1.330379, -2.580496, 0.9254902, 1, 0, 1,
-0.8953815, -0.6644283, -3.451303, 0.9215686, 1, 0, 1,
-0.8905348, -0.5648144, -0.9958771, 0.9137255, 1, 0, 1,
-0.8841565, 0.4707508, -0.1553057, 0.9098039, 1, 0, 1,
-0.8797748, 0.1126892, 1.462821, 0.9019608, 1, 0, 1,
-0.8760533, 1.44836, 0.556599, 0.8941177, 1, 0, 1,
-0.8759162, 0.777972, -0.401179, 0.8901961, 1, 0, 1,
-0.8735173, 0.404703, -0.2608283, 0.8823529, 1, 0, 1,
-0.8709326, 0.4017021, -1.576445, 0.8784314, 1, 0, 1,
-0.8707027, -0.5354816, -1.452637, 0.8705882, 1, 0, 1,
-0.8684731, 0.7459152, -0.5192989, 0.8666667, 1, 0, 1,
-0.8592422, -2.698349, -3.012983, 0.8588235, 1, 0, 1,
-0.8576405, -0.454882, -1.951773, 0.854902, 1, 0, 1,
-0.8479111, 0.1027303, -0.7597747, 0.8470588, 1, 0, 1,
-0.843857, 1.042981, -0.7150682, 0.8431373, 1, 0, 1,
-0.836491, 0.4665973, -2.768362, 0.8352941, 1, 0, 1,
-0.8355562, 0.06831079, -1.322528, 0.8313726, 1, 0, 1,
-0.8354257, -0.6409372, -3.264989, 0.8235294, 1, 0, 1,
-0.8326126, -0.5803758, -1.69136, 0.8196079, 1, 0, 1,
-0.8301469, -1.207225, -3.790138, 0.8117647, 1, 0, 1,
-0.8279754, -1.013033, -2.952136, 0.8078431, 1, 0, 1,
-0.8231601, 0.03481821, -3.441945, 0.8, 1, 0, 1,
-0.8223391, -0.1730164, -1.437423, 0.7921569, 1, 0, 1,
-0.820783, -0.8781784, -4.199913, 0.7882353, 1, 0, 1,
-0.8143143, 1.408236, -0.2906098, 0.7803922, 1, 0, 1,
-0.8138421, -0.4664913, -4.077696, 0.7764706, 1, 0, 1,
-0.811048, -0.3251853, -1.276651, 0.7686275, 1, 0, 1,
-0.8085415, -0.06041191, -2.991144, 0.7647059, 1, 0, 1,
-0.8083882, 0.0267123, -0.4851443, 0.7568628, 1, 0, 1,
-0.8069999, -0.2433301, -0.3653193, 0.7529412, 1, 0, 1,
-0.7995891, -1.192042, -2.92185, 0.7450981, 1, 0, 1,
-0.7984626, -0.08225705, -3.500534, 0.7411765, 1, 0, 1,
-0.796089, -0.9140477, -2.619175, 0.7333333, 1, 0, 1,
-0.7920816, -1.567444, -2.139487, 0.7294118, 1, 0, 1,
-0.7892558, 2.160745, 1.303748, 0.7215686, 1, 0, 1,
-0.7848472, -0.3772098, -2.061973, 0.7176471, 1, 0, 1,
-0.7735851, 0.1521344, -1.440136, 0.7098039, 1, 0, 1,
-0.7710503, 0.8879477, -0.1399526, 0.7058824, 1, 0, 1,
-0.7694117, 0.4390356, -1.147047, 0.6980392, 1, 0, 1,
-0.7689447, 0.3794374, -2.908976, 0.6901961, 1, 0, 1,
-0.7660725, -2.381314, -4.24098, 0.6862745, 1, 0, 1,
-0.7657439, 1.578623, -0.1867683, 0.6784314, 1, 0, 1,
-0.7635584, -0.9530624, -2.541679, 0.6745098, 1, 0, 1,
-0.7620466, 1.19227, 1.149191, 0.6666667, 1, 0, 1,
-0.7597644, 0.6150441, 0.5327796, 0.6627451, 1, 0, 1,
-0.7596402, -0.7027344, -1.164543, 0.654902, 1, 0, 1,
-0.7583167, -0.3228656, -1.84822, 0.6509804, 1, 0, 1,
-0.7581538, 0.848039, -1.156251, 0.6431373, 1, 0, 1,
-0.7544121, -0.008053352, -2.134366, 0.6392157, 1, 0, 1,
-0.7506883, 0.5056588, 0.1386711, 0.6313726, 1, 0, 1,
-0.749821, -2.268843, -3.269315, 0.627451, 1, 0, 1,
-0.7484369, -0.1967034, -1.949565, 0.6196079, 1, 0, 1,
-0.7433566, -0.1952617, -2.316292, 0.6156863, 1, 0, 1,
-0.7408851, -1.629066, -2.963539, 0.6078432, 1, 0, 1,
-0.7401925, -0.5185585, -2.705949, 0.6039216, 1, 0, 1,
-0.7378231, 0.4896798, -2.535496, 0.5960785, 1, 0, 1,
-0.7312343, 0.02881857, -0.6508792, 0.5882353, 1, 0, 1,
-0.7302122, 0.1819742, -0.8279594, 0.5843138, 1, 0, 1,
-0.7286731, -0.04901012, -1.129994, 0.5764706, 1, 0, 1,
-0.7251921, 0.1454304, -0.7266513, 0.572549, 1, 0, 1,
-0.7219639, -1.24634, -4.383488, 0.5647059, 1, 0, 1,
-0.7195884, 0.7517555, -0.7998047, 0.5607843, 1, 0, 1,
-0.7159043, 0.08793383, -1.814336, 0.5529412, 1, 0, 1,
-0.709044, -0.09992543, -0.4271063, 0.5490196, 1, 0, 1,
-0.706247, -1.247721, -4.814935, 0.5411765, 1, 0, 1,
-0.704182, -2.090203, -2.297502, 0.5372549, 1, 0, 1,
-0.7004817, -0.9348298, -2.50257, 0.5294118, 1, 0, 1,
-0.7002029, 0.1312297, -1.822485, 0.5254902, 1, 0, 1,
-0.6998258, -2.79844, -3.988181, 0.5176471, 1, 0, 1,
-0.6992796, 1.479269, -0.3517443, 0.5137255, 1, 0, 1,
-0.6985332, -1.546578, -2.697612, 0.5058824, 1, 0, 1,
-0.6966112, 0.5451571, -1.200273, 0.5019608, 1, 0, 1,
-0.6946927, 0.5565977, -0.9937304, 0.4941176, 1, 0, 1,
-0.6945, -1.275928, 0.5180033, 0.4862745, 1, 0, 1,
-0.6868409, -1.377198, -1.968382, 0.4823529, 1, 0, 1,
-0.6814679, 1.65619, -0.2033934, 0.4745098, 1, 0, 1,
-0.6810168, 0.6915717, -1.780184, 0.4705882, 1, 0, 1,
-0.6791509, 1.057312, 0.6934771, 0.4627451, 1, 0, 1,
-0.6789693, 0.1002669, -2.573181, 0.4588235, 1, 0, 1,
-0.6772312, 0.7995481, 1.098923, 0.4509804, 1, 0, 1,
-0.6602569, 1.729795, -1.710261, 0.4470588, 1, 0, 1,
-0.6582749, -0.1044328, -1.553805, 0.4392157, 1, 0, 1,
-0.6558532, -1.196037, -1.128835, 0.4352941, 1, 0, 1,
-0.653829, -0.9360374, -3.097394, 0.427451, 1, 0, 1,
-0.6529401, -0.7776934, -4.221947, 0.4235294, 1, 0, 1,
-0.6526837, 0.7892183, -1.171024, 0.4156863, 1, 0, 1,
-0.6498569, 0.6553668, -0.5630969, 0.4117647, 1, 0, 1,
-0.6480091, -1.267747, -0.4785575, 0.4039216, 1, 0, 1,
-0.6470562, -0.134573, -3.345788, 0.3960784, 1, 0, 1,
-0.6387549, 1.232385, 1.25143, 0.3921569, 1, 0, 1,
-0.6381395, 2.006459, -1.073088, 0.3843137, 1, 0, 1,
-0.6355791, 0.2884627, 0.334047, 0.3803922, 1, 0, 1,
-0.6329485, -0.5220509, -1.761581, 0.372549, 1, 0, 1,
-0.6301724, 1.094307, -1.276193, 0.3686275, 1, 0, 1,
-0.6282576, 0.9807139, 0.803443, 0.3607843, 1, 0, 1,
-0.6263888, 0.5699547, 0.03880482, 0.3568628, 1, 0, 1,
-0.6243415, 0.6822801, 0.07827247, 0.3490196, 1, 0, 1,
-0.6226912, -1.505206, -1.929734, 0.345098, 1, 0, 1,
-0.6136618, 0.1014908, -0.9960576, 0.3372549, 1, 0, 1,
-0.6025949, 2.165466, 1.877763, 0.3333333, 1, 0, 1,
-0.6007153, -0.6283829, -2.192089, 0.3254902, 1, 0, 1,
-0.6006484, 0.9806822, -0.3116379, 0.3215686, 1, 0, 1,
-0.5985801, 0.6080945, -2.726998, 0.3137255, 1, 0, 1,
-0.5932976, 0.1338966, 0.3412077, 0.3098039, 1, 0, 1,
-0.5848018, 0.3721542, -1.762692, 0.3019608, 1, 0, 1,
-0.5755444, -0.2413641, -2.006308, 0.2941177, 1, 0, 1,
-0.5753599, -2.448627, -4.074351, 0.2901961, 1, 0, 1,
-0.5674296, -0.9110833, -1.598377, 0.282353, 1, 0, 1,
-0.559059, 1.612997, -0.5203655, 0.2784314, 1, 0, 1,
-0.550402, -0.6476764, -2.624396, 0.2705882, 1, 0, 1,
-0.5488556, -0.3895246, -3.463, 0.2666667, 1, 0, 1,
-0.5464901, -2.214685, -3.023479, 0.2588235, 1, 0, 1,
-0.5438318, 0.4126458, -1.643716, 0.254902, 1, 0, 1,
-0.5432045, -1.533182, -2.869678, 0.2470588, 1, 0, 1,
-0.5424035, 1.587928, -0.7721084, 0.2431373, 1, 0, 1,
-0.5294771, 0.1629946, -2.084932, 0.2352941, 1, 0, 1,
-0.5151109, 0.6256223, -3.435561, 0.2313726, 1, 0, 1,
-0.5136585, 1.574769, 0.743693, 0.2235294, 1, 0, 1,
-0.5116737, -1.473635, -2.076427, 0.2196078, 1, 0, 1,
-0.5074823, 1.135771, -2.89254, 0.2117647, 1, 0, 1,
-0.5074489, 0.7068686, -1.912114, 0.2078431, 1, 0, 1,
-0.5024635, 0.4435041, -0.3911604, 0.2, 1, 0, 1,
-0.5023615, -0.2494153, -1.808282, 0.1921569, 1, 0, 1,
-0.5012648, 0.03881598, -1.754986, 0.1882353, 1, 0, 1,
-0.4973576, 0.6358504, -1.474313, 0.1803922, 1, 0, 1,
-0.4938462, -0.008967604, -1.689734, 0.1764706, 1, 0, 1,
-0.4894848, 1.090336, -0.08489572, 0.1686275, 1, 0, 1,
-0.4842012, 0.3837545, -0.7558575, 0.1647059, 1, 0, 1,
-0.4772306, -0.9108107, -3.774643, 0.1568628, 1, 0, 1,
-0.4765939, -1.641189, -2.622042, 0.1529412, 1, 0, 1,
-0.4739968, -2.531067, -3.139886, 0.145098, 1, 0, 1,
-0.4730621, 0.2665326, -0.9444879, 0.1411765, 1, 0, 1,
-0.4725988, -0.5324455, -3.478702, 0.1333333, 1, 0, 1,
-0.4675321, 1.1713, 0.728515, 0.1294118, 1, 0, 1,
-0.4673533, 0.7485389, -2.008973, 0.1215686, 1, 0, 1,
-0.4624991, -0.4754559, -2.513558, 0.1176471, 1, 0, 1,
-0.4621874, 2.396387, -1.589735, 0.1098039, 1, 0, 1,
-0.4596074, -0.7912523, -1.381155, 0.1058824, 1, 0, 1,
-0.4573486, -0.6072593, -3.981404, 0.09803922, 1, 0, 1,
-0.4573349, -0.6677282, -1.6098, 0.09019608, 1, 0, 1,
-0.4552728, -0.2998872, -1.486694, 0.08627451, 1, 0, 1,
-0.4497934, 0.3263655, 0.08133961, 0.07843138, 1, 0, 1,
-0.4485428, 0.2670805, -2.336021, 0.07450981, 1, 0, 1,
-0.4485174, 0.7613266, -1.378502, 0.06666667, 1, 0, 1,
-0.4482182, 0.06103672, -1.669513, 0.0627451, 1, 0, 1,
-0.4470341, -0.4788154, -1.396791, 0.05490196, 1, 0, 1,
-0.4434074, -0.2043404, -2.647405, 0.05098039, 1, 0, 1,
-0.4395524, -0.01012658, -1.969199, 0.04313726, 1, 0, 1,
-0.4346201, 1.006483, 0.7237633, 0.03921569, 1, 0, 1,
-0.4300118, -0.7910326, -3.18205, 0.03137255, 1, 0, 1,
-0.428857, -1.291272, -2.249441, 0.02745098, 1, 0, 1,
-0.4260121, -0.8516715, -3.733526, 0.01960784, 1, 0, 1,
-0.4218322, -0.1564665, -1.008562, 0.01568628, 1, 0, 1,
-0.420444, -0.6166105, -4.239697, 0.007843138, 1, 0, 1,
-0.4193829, 0.1736602, -1.884643, 0.003921569, 1, 0, 1,
-0.4185014, 1.053154, 0.5973389, 0, 1, 0.003921569, 1,
-0.4004984, -1.017639, -4.088958, 0, 1, 0.01176471, 1,
-0.3995868, 0.2091951, -2.055646, 0, 1, 0.01568628, 1,
-0.391325, -0.7484091, -2.941419, 0, 1, 0.02352941, 1,
-0.3903359, -1.574384, -3.3263, 0, 1, 0.02745098, 1,
-0.386715, -0.7874974, -3.525503, 0, 1, 0.03529412, 1,
-0.3826123, 2.091187, -0.792092, 0, 1, 0.03921569, 1,
-0.3788792, -0.1843068, -3.007752, 0, 1, 0.04705882, 1,
-0.3775972, 0.8616707, 1.115885, 0, 1, 0.05098039, 1,
-0.3756953, 0.4102173, -1.844061, 0, 1, 0.05882353, 1,
-0.3742006, 0.4271786, -1.008963, 0, 1, 0.0627451, 1,
-0.3723987, -0.7256216, -2.371929, 0, 1, 0.07058824, 1,
-0.3683525, -0.5634012, -2.967688, 0, 1, 0.07450981, 1,
-0.365862, 0.4750135, -0.2449849, 0, 1, 0.08235294, 1,
-0.3653365, -0.4613483, -3.047392, 0, 1, 0.08627451, 1,
-0.3648625, 0.3628018, -1.193466, 0, 1, 0.09411765, 1,
-0.3568625, -0.2601225, -2.571301, 0, 1, 0.1019608, 1,
-0.3564388, 1.169098, 0.2430991, 0, 1, 0.1058824, 1,
-0.3533543, -0.3925977, -1.645407, 0, 1, 0.1137255, 1,
-0.3507954, 0.0008089347, -0.9131767, 0, 1, 0.1176471, 1,
-0.3495344, -1.268267, -2.179142, 0, 1, 0.1254902, 1,
-0.345763, -0.9095616, -1.625576, 0, 1, 0.1294118, 1,
-0.3431938, -0.8382792, -2.987715, 0, 1, 0.1372549, 1,
-0.3431288, -0.6439012, -2.21729, 0, 1, 0.1411765, 1,
-0.3357608, -0.879466, -4.065168, 0, 1, 0.1490196, 1,
-0.3353171, 0.9464418, 0.5757686, 0, 1, 0.1529412, 1,
-0.333379, 1.383106, -0.05028325, 0, 1, 0.1607843, 1,
-0.3313441, 0.6637139, -1.656344, 0, 1, 0.1647059, 1,
-0.3228562, -0.7310326, -2.28048, 0, 1, 0.172549, 1,
-0.3226445, -0.406921, -2.538478, 0, 1, 0.1764706, 1,
-0.3215756, -0.2129993, -0.9441848, 0, 1, 0.1843137, 1,
-0.3198393, 0.005483143, -1.348762, 0, 1, 0.1882353, 1,
-0.3141339, -0.7034726, -3.231755, 0, 1, 0.1960784, 1,
-0.3133182, -0.7593928, -2.296097, 0, 1, 0.2039216, 1,
-0.3122908, 1.164335, -0.9733388, 0, 1, 0.2078431, 1,
-0.3118272, 0.4064495, -1.094774, 0, 1, 0.2156863, 1,
-0.3102526, -0.6526479, -3.824317, 0, 1, 0.2196078, 1,
-0.3075805, -0.4317985, -2.302753, 0, 1, 0.227451, 1,
-0.3072084, 0.2726354, -0.6895721, 0, 1, 0.2313726, 1,
-0.3056934, 0.4344221, -1.599032, 0, 1, 0.2392157, 1,
-0.3053327, 0.08623247, 0.3213074, 0, 1, 0.2431373, 1,
-0.3016062, 0.8784857, -0.6466315, 0, 1, 0.2509804, 1,
-0.3007294, -1.384631, -1.530053, 0, 1, 0.254902, 1,
-0.2981569, -0.2677065, -3.618473, 0, 1, 0.2627451, 1,
-0.2928079, 2.827405, -0.4302315, 0, 1, 0.2666667, 1,
-0.2918012, 0.6124938, -1.889358, 0, 1, 0.2745098, 1,
-0.2906572, -0.001943905, -1.109301, 0, 1, 0.2784314, 1,
-0.2883196, -0.2862918, -3.859798, 0, 1, 0.2862745, 1,
-0.2864856, 0.02510703, -1.370318, 0, 1, 0.2901961, 1,
-0.2860907, 0.5684676, -0.5172603, 0, 1, 0.2980392, 1,
-0.2848179, 0.4086426, -1.964228, 0, 1, 0.3058824, 1,
-0.284401, -1.238403, -2.80826, 0, 1, 0.3098039, 1,
-0.2745295, -2.299828, -3.102695, 0, 1, 0.3176471, 1,
-0.2715339, -0.196086, -1.95525, 0, 1, 0.3215686, 1,
-0.271001, -1.357605, -3.029375, 0, 1, 0.3294118, 1,
-0.2678685, -0.3454531, -0.5350298, 0, 1, 0.3333333, 1,
-0.2675387, -0.2201195, -3.408323, 0, 1, 0.3411765, 1,
-0.2665508, 0.2120298, -0.4226808, 0, 1, 0.345098, 1,
-0.2592532, 0.2669469, -0.5109387, 0, 1, 0.3529412, 1,
-0.2582565, 1.598183, 1.291308, 0, 1, 0.3568628, 1,
-0.257456, 3.653037, -0.7246168, 0, 1, 0.3647059, 1,
-0.255164, 0.3010782, -1.853465, 0, 1, 0.3686275, 1,
-0.252373, -0.4833314, -2.698591, 0, 1, 0.3764706, 1,
-0.2507822, -0.622322, -2.516385, 0, 1, 0.3803922, 1,
-0.2490709, 1.393059, -2.327478, 0, 1, 0.3882353, 1,
-0.2444832, -0.6731964, -3.571148, 0, 1, 0.3921569, 1,
-0.2426373, -0.06327835, -2.617582, 0, 1, 0.4, 1,
-0.2424983, -0.2768059, -2.720987, 0, 1, 0.4078431, 1,
-0.2349051, 0.342261, 0.2459101, 0, 1, 0.4117647, 1,
-0.2347804, 2.454341, 0.8019172, 0, 1, 0.4196078, 1,
-0.2283977, 1.208974, 1.528335, 0, 1, 0.4235294, 1,
-0.225269, 0.4777569, -0.9894726, 0, 1, 0.4313726, 1,
-0.2243131, -1.867501, -3.927449, 0, 1, 0.4352941, 1,
-0.2194701, 0.20825, -0.164122, 0, 1, 0.4431373, 1,
-0.2164992, 0.2732499, -0.126089, 0, 1, 0.4470588, 1,
-0.2148148, -1.043407, -2.910613, 0, 1, 0.454902, 1,
-0.2104161, 1.181025, 0.2303372, 0, 1, 0.4588235, 1,
-0.2102958, -0.6780664, -3.889692, 0, 1, 0.4666667, 1,
-0.2055646, 0.6943308, 0.3181514, 0, 1, 0.4705882, 1,
-0.205335, 0.3596738, -0.674816, 0, 1, 0.4784314, 1,
-0.2034823, 0.270521, -2.265382, 0, 1, 0.4823529, 1,
-0.2024036, -0.6653324, -1.640595, 0, 1, 0.4901961, 1,
-0.2010866, 0.4136811, -0.2384623, 0, 1, 0.4941176, 1,
-0.1988717, 1.576878, 0.354525, 0, 1, 0.5019608, 1,
-0.1981009, 0.2157064, -1.200764, 0, 1, 0.509804, 1,
-0.1940067, -0.239694, -3.439732, 0, 1, 0.5137255, 1,
-0.1926607, 0.6365778, -1.593048, 0, 1, 0.5215687, 1,
-0.191463, 0.8879405, -1.951958, 0, 1, 0.5254902, 1,
-0.1887509, -0.8654931, -1.336332, 0, 1, 0.5333334, 1,
-0.1865567, 0.7511066, -1.916831, 0, 1, 0.5372549, 1,
-0.1856492, 1.447184, 2.115391, 0, 1, 0.5450981, 1,
-0.1824485, -1.634355, -3.26371, 0, 1, 0.5490196, 1,
-0.1805741, -0.7263026, -2.796282, 0, 1, 0.5568628, 1,
-0.1779094, 0.4083967, -1.432038, 0, 1, 0.5607843, 1,
-0.1774555, -0.9428971, -2.564723, 0, 1, 0.5686275, 1,
-0.1767372, 1.576679, -2.305952, 0, 1, 0.572549, 1,
-0.1741211, 1.749146, 1.732566, 0, 1, 0.5803922, 1,
-0.1624308, -1.034212, -2.893583, 0, 1, 0.5843138, 1,
-0.1612874, -0.8634073, -2.544518, 0, 1, 0.5921569, 1,
-0.1496117, -1.358197, -3.060181, 0, 1, 0.5960785, 1,
-0.1461353, -1.302724, -2.866575, 0, 1, 0.6039216, 1,
-0.1450382, 0.7466123, -1.46437, 0, 1, 0.6117647, 1,
-0.140526, -1.271811, -2.374887, 0, 1, 0.6156863, 1,
-0.1397058, -0.1175958, -3.280156, 0, 1, 0.6235294, 1,
-0.1379687, 1.536519, 0.8753004, 0, 1, 0.627451, 1,
-0.1373479, 0.4946003, 0.09121908, 0, 1, 0.6352941, 1,
-0.1336263, -0.4291466, -2.786757, 0, 1, 0.6392157, 1,
-0.1336262, -0.6986437, -2.172438, 0, 1, 0.6470588, 1,
-0.1325662, -0.9854946, -1.965891, 0, 1, 0.6509804, 1,
-0.1296803, 0.5052563, -1.497844, 0, 1, 0.6588235, 1,
-0.1263007, -0.1631533, -2.041486, 0, 1, 0.6627451, 1,
-0.1249634, 0.1503656, -1.261969, 0, 1, 0.6705883, 1,
-0.1228945, 1.431533, 0.07391599, 0, 1, 0.6745098, 1,
-0.1136608, -0.2746882, -2.145063, 0, 1, 0.682353, 1,
-0.1133053, 0.4025679, -0.9501508, 0, 1, 0.6862745, 1,
-0.1122657, 0.8876165, -0.2142836, 0, 1, 0.6941177, 1,
-0.1119125, -0.9989146, -5.206579, 0, 1, 0.7019608, 1,
-0.1077834, 0.0451646, -0.7742284, 0, 1, 0.7058824, 1,
-0.1066509, -2.374581, -1.952275, 0, 1, 0.7137255, 1,
-0.104309, -0.8155019, -2.048616, 0, 1, 0.7176471, 1,
-0.1021086, 1.749776, 1.66848, 0, 1, 0.7254902, 1,
-0.1006601, 1.971286, -1.656091, 0, 1, 0.7294118, 1,
-0.1004791, -0.7041605, -1.132335, 0, 1, 0.7372549, 1,
-0.09824844, -1.416991, -2.695836, 0, 1, 0.7411765, 1,
-0.09633094, 0.4017447, 0.1366465, 0, 1, 0.7490196, 1,
-0.09069654, -0.004295551, -2.54833, 0, 1, 0.7529412, 1,
-0.0904358, 0.6494614, 0.2059178, 0, 1, 0.7607843, 1,
-0.08916401, 0.1476584, -0.7838379, 0, 1, 0.7647059, 1,
-0.08598196, -0.5161108, -3.774664, 0, 1, 0.772549, 1,
-0.08494636, -1.984942, -2.853675, 0, 1, 0.7764706, 1,
-0.07648504, 0.1891334, -0.3574818, 0, 1, 0.7843137, 1,
-0.07109009, -0.667994, -2.898706, 0, 1, 0.7882353, 1,
-0.06850927, 1.299766, 0.04730945, 0, 1, 0.7960784, 1,
-0.06665074, 1.103767, 0.8573793, 0, 1, 0.8039216, 1,
-0.06423459, -0.4472948, -3.55717, 0, 1, 0.8078431, 1,
-0.05984149, -0.666018, -2.162081, 0, 1, 0.8156863, 1,
-0.05911945, 1.046493, 1.156919, 0, 1, 0.8196079, 1,
-0.05896181, -0.6511261, -1.705902, 0, 1, 0.827451, 1,
-0.05537997, 0.38915, 1.701409, 0, 1, 0.8313726, 1,
-0.05462729, 1.359587, 1.591708, 0, 1, 0.8392157, 1,
-0.05385926, -1.272471, -3.779927, 0, 1, 0.8431373, 1,
-0.05366204, 0.04188425, -2.258571, 0, 1, 0.8509804, 1,
-0.05048723, 0.9853259, 0.8845073, 0, 1, 0.854902, 1,
-0.04828477, -0.02514482, -3.168165, 0, 1, 0.8627451, 1,
-0.04822042, 1.342484, -0.7197356, 0, 1, 0.8666667, 1,
-0.04497178, 1.222903, -0.6983745, 0, 1, 0.8745098, 1,
-0.04183835, -0.8269691, -3.120695, 0, 1, 0.8784314, 1,
-0.04159191, 1.260708, 0.8079972, 0, 1, 0.8862745, 1,
-0.03728904, 0.7924536, -0.08508773, 0, 1, 0.8901961, 1,
-0.03578245, -1.287499, -2.637427, 0, 1, 0.8980392, 1,
-0.03437629, 1.795259, 0.8113073, 0, 1, 0.9058824, 1,
-0.03165387, -0.3334474, -2.470702, 0, 1, 0.9098039, 1,
-0.03150456, 0.05999806, -0.7303753, 0, 1, 0.9176471, 1,
-0.03126463, -0.6401108, -1.723405, 0, 1, 0.9215686, 1,
-0.03107231, 0.5107212, -0.6458836, 0, 1, 0.9294118, 1,
-0.0308194, 0.1748914, 0.7154735, 0, 1, 0.9333333, 1,
-0.0263226, 1.346361, -1.570292, 0, 1, 0.9411765, 1,
-0.0246565, -0.7562825, -2.809557, 0, 1, 0.945098, 1,
-0.01877063, -0.3732812, -4.237278, 0, 1, 0.9529412, 1,
-0.01597079, -2.454801, -2.387021, 0, 1, 0.9568627, 1,
-0.01589665, 0.06845116, -0.4064722, 0, 1, 0.9647059, 1,
-0.01107213, -0.1082887, -1.062063, 0, 1, 0.9686275, 1,
-0.009505998, 1.443581, -0.7090569, 0, 1, 0.9764706, 1,
-0.007886614, -0.190064, -2.597828, 0, 1, 0.9803922, 1,
0.0003275397, -1.448103, 3.371955, 0, 1, 0.9882353, 1,
0.000481151, 0.8805344, -1.165556, 0, 1, 0.9921569, 1,
0.001999128, -1.014462, 1.528821, 0, 1, 1, 1,
0.006820514, 0.3893853, 0.5378335, 0, 0.9921569, 1, 1,
0.007520079, -1.282095, 3.647481, 0, 0.9882353, 1, 1,
0.008105276, -0.157333, 4.252765, 0, 0.9803922, 1, 1,
0.01026683, 1.693433, -0.7985486, 0, 0.9764706, 1, 1,
0.01607513, -0.74819, 3.740395, 0, 0.9686275, 1, 1,
0.01824029, 0.02742259, -0.110343, 0, 0.9647059, 1, 1,
0.02051198, -1.669704, 1.91084, 0, 0.9568627, 1, 1,
0.02063328, -0.5017966, 2.699111, 0, 0.9529412, 1, 1,
0.02220701, -0.4907161, 5.505229, 0, 0.945098, 1, 1,
0.024336, -0.266075, 2.682641, 0, 0.9411765, 1, 1,
0.03005904, -0.107503, 1.938913, 0, 0.9333333, 1, 1,
0.03113402, 0.8178154, -0.03201066, 0, 0.9294118, 1, 1,
0.03135419, 0.5432649, -0.6898755, 0, 0.9215686, 1, 1,
0.03203467, -0.05465277, 1.846633, 0, 0.9176471, 1, 1,
0.03767264, -2.217058, 3.684398, 0, 0.9098039, 1, 1,
0.03897167, -0.7760331, 3.77513, 0, 0.9058824, 1, 1,
0.04305382, -1.052613, 3.121151, 0, 0.8980392, 1, 1,
0.04856482, -0.427271, 3.571091, 0, 0.8901961, 1, 1,
0.04917816, -1.435525, 3.171353, 0, 0.8862745, 1, 1,
0.0518358, -0.8477535, 1.237, 0, 0.8784314, 1, 1,
0.05309322, 0.2282416, 0.6990431, 0, 0.8745098, 1, 1,
0.06021372, 1.029255, 0.2141736, 0, 0.8666667, 1, 1,
0.06053497, -0.03366826, 1.521903, 0, 0.8627451, 1, 1,
0.06394367, 0.2788682, -1.332628, 0, 0.854902, 1, 1,
0.06832514, 1.034563, 0.1028331, 0, 0.8509804, 1, 1,
0.06899528, -0.005851603, 1.163649, 0, 0.8431373, 1, 1,
0.07082742, -0.7362632, 1.615577, 0, 0.8392157, 1, 1,
0.07488392, -0.02307801, 2.556581, 0, 0.8313726, 1, 1,
0.0749058, 0.2629093, -0.1963305, 0, 0.827451, 1, 1,
0.07689728, -0.6822253, 2.43376, 0, 0.8196079, 1, 1,
0.07780679, -0.5318197, 4.114318, 0, 0.8156863, 1, 1,
0.07849847, 1.017497, 0.9183282, 0, 0.8078431, 1, 1,
0.07961661, 1.33014, 0.9685059, 0, 0.8039216, 1, 1,
0.08601566, -0.4135264, 5.377689, 0, 0.7960784, 1, 1,
0.08640535, 0.2270617, 0.3369453, 0, 0.7882353, 1, 1,
0.08767621, -0.6617515, 3.095566, 0, 0.7843137, 1, 1,
0.09347299, -0.2936595, 3.115328, 0, 0.7764706, 1, 1,
0.09732462, -0.3282309, 3.699775, 0, 0.772549, 1, 1,
0.102214, -0.8484633, 3.005462, 0, 0.7647059, 1, 1,
0.1046168, 1.066348, -0.06059255, 0, 0.7607843, 1, 1,
0.1058056, -0.5743989, 2.561632, 0, 0.7529412, 1, 1,
0.1064845, -0.4487116, 2.960522, 0, 0.7490196, 1, 1,
0.1074996, 1.514779, 0.008540841, 0, 0.7411765, 1, 1,
0.108715, -0.5865291, 2.604706, 0, 0.7372549, 1, 1,
0.112831, -1.958337, 2.105535, 0, 0.7294118, 1, 1,
0.1150573, -0.4144601, 2.534618, 0, 0.7254902, 1, 1,
0.1156978, 0.7830582, -0.322156, 0, 0.7176471, 1, 1,
0.1157335, -0.4951632, 3.497662, 0, 0.7137255, 1, 1,
0.1165439, -1.587774, 3.301562, 0, 0.7058824, 1, 1,
0.1215405, -0.4884422, 4.162371, 0, 0.6980392, 1, 1,
0.1242028, -1.538715, 4.261726, 0, 0.6941177, 1, 1,
0.1259205, 0.7953027, 0.3653511, 0, 0.6862745, 1, 1,
0.1263507, 0.2011886, 0.08532941, 0, 0.682353, 1, 1,
0.1277025, -1.821897, 1.998495, 0, 0.6745098, 1, 1,
0.1291966, 1.785723, 0.5923452, 0, 0.6705883, 1, 1,
0.1316309, -0.8024512, 4.460472, 0, 0.6627451, 1, 1,
0.1322885, 1.440807, -0.9489539, 0, 0.6588235, 1, 1,
0.1338608, 0.2762684, 0.7617525, 0, 0.6509804, 1, 1,
0.1362737, -1.174033, 3.516818, 0, 0.6470588, 1, 1,
0.139335, -0.1365576, 2.753843, 0, 0.6392157, 1, 1,
0.1405745, -2.098282, 3.209318, 0, 0.6352941, 1, 1,
0.1424364, -0.481058, 3.510834, 0, 0.627451, 1, 1,
0.1437454, 0.7337958, 1.197251, 0, 0.6235294, 1, 1,
0.144393, -0.8106564, 2.957589, 0, 0.6156863, 1, 1,
0.148019, 0.9189172, -0.2348314, 0, 0.6117647, 1, 1,
0.1537991, -0.8738139, 3.300315, 0, 0.6039216, 1, 1,
0.1551622, -0.1776795, 4.051775, 0, 0.5960785, 1, 1,
0.157486, -0.8281286, 3.496766, 0, 0.5921569, 1, 1,
0.1575717, 1.463144, -1.018054, 0, 0.5843138, 1, 1,
0.1631979, -0.4823781, 3.643199, 0, 0.5803922, 1, 1,
0.1654755, -0.1200257, 1.481207, 0, 0.572549, 1, 1,
0.168105, -0.1600562, 1.357287, 0, 0.5686275, 1, 1,
0.1739181, -0.5218947, 2.882284, 0, 0.5607843, 1, 1,
0.1747151, 0.108831, -0.8542789, 0, 0.5568628, 1, 1,
0.1820457, 1.709102, 0.499647, 0, 0.5490196, 1, 1,
0.1876891, 0.5068687, -1.490839, 0, 0.5450981, 1, 1,
0.1877239, -0.3513101, 2.879452, 0, 0.5372549, 1, 1,
0.1882302, -0.5317994, 1.443788, 0, 0.5333334, 1, 1,
0.1898963, -0.9964197, 2.160263, 0, 0.5254902, 1, 1,
0.1935163, -0.6793214, 3.433002, 0, 0.5215687, 1, 1,
0.1936606, 0.3324365, 1.438078, 0, 0.5137255, 1, 1,
0.1945197, 0.3811077, 0.0618282, 0, 0.509804, 1, 1,
0.1963943, -2.228468, 3.694002, 0, 0.5019608, 1, 1,
0.1968912, -0.03319661, 1.651462, 0, 0.4941176, 1, 1,
0.2041649, -1.776077, 4.357144, 0, 0.4901961, 1, 1,
0.2072552, 0.5547472, -0.8289162, 0, 0.4823529, 1, 1,
0.2077198, -1.337605, 4.406253, 0, 0.4784314, 1, 1,
0.2149415, -0.5004715, 2.762935, 0, 0.4705882, 1, 1,
0.2179479, -0.5343621, 3.596645, 0, 0.4666667, 1, 1,
0.2197404, -1.651871, 3.337969, 0, 0.4588235, 1, 1,
0.2203359, 0.9771972, 2.022576, 0, 0.454902, 1, 1,
0.2203481, -0.7039853, 2.038119, 0, 0.4470588, 1, 1,
0.2218248, -0.7839344, 2.650467, 0, 0.4431373, 1, 1,
0.2221173, -1.066513, 3.786806, 0, 0.4352941, 1, 1,
0.2232096, 2.085687, -0.02436993, 0, 0.4313726, 1, 1,
0.2392184, -1.010896, 2.555941, 0, 0.4235294, 1, 1,
0.241813, 1.915697, 0.9634494, 0, 0.4196078, 1, 1,
0.2451187, -0.00716116, 1.095191, 0, 0.4117647, 1, 1,
0.2482209, -1.365621, 0.9004089, 0, 0.4078431, 1, 1,
0.2544632, -0.5942422, 4.071072, 0, 0.4, 1, 1,
0.2564898, 1.130455, 0.5848017, 0, 0.3921569, 1, 1,
0.2587441, -0.315707, 3.575679, 0, 0.3882353, 1, 1,
0.2590346, 0.5556732, 0.406714, 0, 0.3803922, 1, 1,
0.2612346, 0.1288859, 0.7418925, 0, 0.3764706, 1, 1,
0.2643122, -1.086305, 1.780471, 0, 0.3686275, 1, 1,
0.2672741, -0.3346649, 0.8076692, 0, 0.3647059, 1, 1,
0.2721134, -0.353797, 2.750445, 0, 0.3568628, 1, 1,
0.2738643, 0.02766573, 0.8693123, 0, 0.3529412, 1, 1,
0.2744614, -0.01945985, 0.7850618, 0, 0.345098, 1, 1,
0.2770909, -0.1733005, 2.123805, 0, 0.3411765, 1, 1,
0.2887252, -0.7129025, 1.206424, 0, 0.3333333, 1, 1,
0.29083, -0.3477376, 1.741175, 0, 0.3294118, 1, 1,
0.2920024, 0.3147088, 0.1942548, 0, 0.3215686, 1, 1,
0.2922424, 0.2954399, 0.03991539, 0, 0.3176471, 1, 1,
0.2955764, 1.698095, 0.1881764, 0, 0.3098039, 1, 1,
0.2984878, -0.1777288, 1.498451, 0, 0.3058824, 1, 1,
0.2992341, -3.007597, 1.97948, 0, 0.2980392, 1, 1,
0.2999381, 0.3240457, 0.8702484, 0, 0.2901961, 1, 1,
0.3000219, 1.721686, -1.815269, 0, 0.2862745, 1, 1,
0.3023002, 1.615271, 1.761113, 0, 0.2784314, 1, 1,
0.3087836, -0.1291625, 1.381947, 0, 0.2745098, 1, 1,
0.3089492, 1.093052, -0.1509367, 0, 0.2666667, 1, 1,
0.3119627, 0.4696142, 1.63122, 0, 0.2627451, 1, 1,
0.3213092, -0.8477619, 2.280768, 0, 0.254902, 1, 1,
0.3240191, -0.5071086, 3.589093, 0, 0.2509804, 1, 1,
0.3244846, 0.1415621, 1.667417, 0, 0.2431373, 1, 1,
0.3274516, 0.556684, 2.134971, 0, 0.2392157, 1, 1,
0.3292234, -1.86904, 2.626665, 0, 0.2313726, 1, 1,
0.3360012, -0.6051139, 3.241394, 0, 0.227451, 1, 1,
0.3371659, -0.8976509, 3.816462, 0, 0.2196078, 1, 1,
0.3413557, -0.8513845, 5.17599, 0, 0.2156863, 1, 1,
0.3424166, 0.6730645, 2.066179, 0, 0.2078431, 1, 1,
0.3466668, -0.04177427, 1.10985, 0, 0.2039216, 1, 1,
0.3473453, -0.8181857, 2.39832, 0, 0.1960784, 1, 1,
0.3489188, -1.074639, 1.433386, 0, 0.1882353, 1, 1,
0.3563093, 0.2154205, 1.106739, 0, 0.1843137, 1, 1,
0.3577518, 1.08965, -1.102935, 0, 0.1764706, 1, 1,
0.3597583, -0.1476354, -0.9105356, 0, 0.172549, 1, 1,
0.3604238, 0.1607659, 2.481017, 0, 0.1647059, 1, 1,
0.3609553, 0.4795094, -0.06727972, 0, 0.1607843, 1, 1,
0.3633948, 0.5203652, 0.4106266, 0, 0.1529412, 1, 1,
0.3655919, 1.456146, 0.2615857, 0, 0.1490196, 1, 1,
0.3714991, -0.7367226, 3.164171, 0, 0.1411765, 1, 1,
0.373438, -0.6298079, 3.299294, 0, 0.1372549, 1, 1,
0.3779992, 0.895412, 1.536518, 0, 0.1294118, 1, 1,
0.3797755, 0.4055552, 1.540733, 0, 0.1254902, 1, 1,
0.3805684, -0.1181418, 1.914148, 0, 0.1176471, 1, 1,
0.3810135, -0.04097292, 0.5437752, 0, 0.1137255, 1, 1,
0.3823686, -1.685725, 2.806268, 0, 0.1058824, 1, 1,
0.3826684, 1.835646, 1.175845, 0, 0.09803922, 1, 1,
0.384238, -2.028614, 2.326753, 0, 0.09411765, 1, 1,
0.3880773, 0.9408919, -0.162645, 0, 0.08627451, 1, 1,
0.3885752, 0.5891839, 0.2033361, 0, 0.08235294, 1, 1,
0.3895647, -0.02045496, 1.466494, 0, 0.07450981, 1, 1,
0.3920073, -0.7436321, 2.610037, 0, 0.07058824, 1, 1,
0.3998513, -0.5055305, 2.942153, 0, 0.0627451, 1, 1,
0.4010896, -0.6670706, -0.1295957, 0, 0.05882353, 1, 1,
0.4053147, 0.2925397, 1.102186, 0, 0.05098039, 1, 1,
0.4072746, -0.6085752, 1.699493, 0, 0.04705882, 1, 1,
0.4090267, 0.437756, 0.2016367, 0, 0.03921569, 1, 1,
0.4144564, 2.446477, 0.4691063, 0, 0.03529412, 1, 1,
0.4185452, 2.172855, 0.529318, 0, 0.02745098, 1, 1,
0.4199114, 0.1400878, 1.120541, 0, 0.02352941, 1, 1,
0.4248092, -1.121459, 2.186307, 0, 0.01568628, 1, 1,
0.428137, 0.8972139, -0.6898953, 0, 0.01176471, 1, 1,
0.4282726, -0.7062553, 2.684366, 0, 0.003921569, 1, 1,
0.4365213, -1.596469, 2.379267, 0.003921569, 0, 1, 1,
0.4383351, 0.04199504, -0.5459313, 0.007843138, 0, 1, 1,
0.4442742, -0.1482301, 1.967921, 0.01568628, 0, 1, 1,
0.4447218, 0.9478647, -1.291469, 0.01960784, 0, 1, 1,
0.4462226, 0.3056844, -0.2854885, 0.02745098, 0, 1, 1,
0.4495627, -0.1904253, 1.154142, 0.03137255, 0, 1, 1,
0.4500497, -0.3643259, 2.962916, 0.03921569, 0, 1, 1,
0.456612, -1.183602, 3.921007, 0.04313726, 0, 1, 1,
0.4569367, -1.48932, 1.818306, 0.05098039, 0, 1, 1,
0.4574709, -0.2197031, 3.294148, 0.05490196, 0, 1, 1,
0.4604346, -0.5162938, -0.007731852, 0.0627451, 0, 1, 1,
0.4621491, 0.06325538, 1.062208, 0.06666667, 0, 1, 1,
0.4636151, -1.664225, 1.828347, 0.07450981, 0, 1, 1,
0.4655667, 1.654271, 1.145692, 0.07843138, 0, 1, 1,
0.4668414, 0.911364, 1.065193, 0.08627451, 0, 1, 1,
0.4674867, 0.9534426, 1.796942, 0.09019608, 0, 1, 1,
0.4679757, -0.6852559, 1.360666, 0.09803922, 0, 1, 1,
0.4683762, -0.1774265, -0.9566305, 0.1058824, 0, 1, 1,
0.4697087, -0.1277975, 0.4139977, 0.1098039, 0, 1, 1,
0.4711588, 1.556013, -1.062362, 0.1176471, 0, 1, 1,
0.4764476, 0.2466938, 1.260495, 0.1215686, 0, 1, 1,
0.4787805, 0.392615, 1.354255, 0.1294118, 0, 1, 1,
0.4846718, -0.6243053, 2.985453, 0.1333333, 0, 1, 1,
0.4856014, -0.07555206, 0.7996952, 0.1411765, 0, 1, 1,
0.486364, -0.825554, 3.263796, 0.145098, 0, 1, 1,
0.4912287, 2.247524, 0.2360315, 0.1529412, 0, 1, 1,
0.4942232, 0.1533546, 1.920993, 0.1568628, 0, 1, 1,
0.4947252, -1.960139, 2.4551, 0.1647059, 0, 1, 1,
0.4982903, -0.2941536, 2.585307, 0.1686275, 0, 1, 1,
0.5186933, 0.9973677, 0.1847811, 0.1764706, 0, 1, 1,
0.5235986, -1.746954, 4.048112, 0.1803922, 0, 1, 1,
0.5238979, -1.165454, 2.725516, 0.1882353, 0, 1, 1,
0.5316638, -0.6931675, 5.075808, 0.1921569, 0, 1, 1,
0.5334439, -0.2154333, 2.980142, 0.2, 0, 1, 1,
0.5337927, 0.004355037, 3.242024, 0.2078431, 0, 1, 1,
0.5410472, -1.033872, 3.193797, 0.2117647, 0, 1, 1,
0.5441635, 0.7146663, 1.248577, 0.2196078, 0, 1, 1,
0.544916, -0.1764114, 1.927708, 0.2235294, 0, 1, 1,
0.5466685, 1.068089, 1.017354, 0.2313726, 0, 1, 1,
0.5485123, 0.7020692, 1.357115, 0.2352941, 0, 1, 1,
0.549311, 0.2492213, 0.5701161, 0.2431373, 0, 1, 1,
0.550339, 1.678492, -0.090922, 0.2470588, 0, 1, 1,
0.5525987, 0.6743017, 1.257011, 0.254902, 0, 1, 1,
0.5588036, -0.436917, 1.428711, 0.2588235, 0, 1, 1,
0.5621783, 0.7127842, -0.1104251, 0.2666667, 0, 1, 1,
0.5650522, -1.355481, 1.87536, 0.2705882, 0, 1, 1,
0.5671376, -0.09430789, 2.744689, 0.2784314, 0, 1, 1,
0.5691024, 0.9468544, 1.034228, 0.282353, 0, 1, 1,
0.5752583, 0.3841439, 0.4395865, 0.2901961, 0, 1, 1,
0.5782601, -0.7304652, 3.726916, 0.2941177, 0, 1, 1,
0.5825821, 0.45704, 1.326258, 0.3019608, 0, 1, 1,
0.5838681, -0.265866, 1.844559, 0.3098039, 0, 1, 1,
0.5840639, 0.713735, -1.095906, 0.3137255, 0, 1, 1,
0.5855126, 1.148985, -0.2771896, 0.3215686, 0, 1, 1,
0.5898474, -0.9875197, 2.070718, 0.3254902, 0, 1, 1,
0.5948213, 0.09412622, 1.258334, 0.3333333, 0, 1, 1,
0.5970097, -1.938384, 2.541197, 0.3372549, 0, 1, 1,
0.6013461, 1.365163, 1.453281, 0.345098, 0, 1, 1,
0.6017821, 0.9294715, 1.88312, 0.3490196, 0, 1, 1,
0.6100824, 1.782712, -1.573714, 0.3568628, 0, 1, 1,
0.6110949, 1.35191, 0.4171222, 0.3607843, 0, 1, 1,
0.6116394, 0.2109758, 1.583886, 0.3686275, 0, 1, 1,
0.6133125, -1.84355, 4.085252, 0.372549, 0, 1, 1,
0.6150196, -0.3161792, 1.393431, 0.3803922, 0, 1, 1,
0.6164297, 0.5461091, 1.68559, 0.3843137, 0, 1, 1,
0.6164582, -0.2274657, 1.474157, 0.3921569, 0, 1, 1,
0.6165211, -0.3069315, 0.444807, 0.3960784, 0, 1, 1,
0.6195846, 0.3554454, -0.06113855, 0.4039216, 0, 1, 1,
0.6204161, -1.100284, 2.024066, 0.4117647, 0, 1, 1,
0.6225058, -0.5533527, 2.947628, 0.4156863, 0, 1, 1,
0.6228762, 1.530576, 0.2242821, 0.4235294, 0, 1, 1,
0.6242239, -0.3324451, 2.032915, 0.427451, 0, 1, 1,
0.6250102, 0.5966597, 0.837266, 0.4352941, 0, 1, 1,
0.6284378, -0.6991104, 2.914869, 0.4392157, 0, 1, 1,
0.6341652, 0.09244727, 2.110808, 0.4470588, 0, 1, 1,
0.644663, 0.2640664, -0.08584367, 0.4509804, 0, 1, 1,
0.6461921, 0.7614956, 0.6762627, 0.4588235, 0, 1, 1,
0.648966, -0.9375843, 1.626527, 0.4627451, 0, 1, 1,
0.6517429, 0.8896902, -0.09743055, 0.4705882, 0, 1, 1,
0.6531329, -0.3638152, 2.943548, 0.4745098, 0, 1, 1,
0.6558572, 0.6867122, 1.507456, 0.4823529, 0, 1, 1,
0.6573231, 0.5160694, 2.411407, 0.4862745, 0, 1, 1,
0.6588128, -1.064837, 1.897529, 0.4941176, 0, 1, 1,
0.6623817, 0.9250104, 0.6465097, 0.5019608, 0, 1, 1,
0.6705896, 2.057533, 1.01078, 0.5058824, 0, 1, 1,
0.6757353, 0.8264312, 0.1968931, 0.5137255, 0, 1, 1,
0.6772672, 1.602765, 0.1740057, 0.5176471, 0, 1, 1,
0.6841959, -0.6928604, 5.337512, 0.5254902, 0, 1, 1,
0.6844299, 0.5668805, 0.9213824, 0.5294118, 0, 1, 1,
0.6852087, -2.215085, 3.702626, 0.5372549, 0, 1, 1,
0.6868108, 0.6885102, -0.8426223, 0.5411765, 0, 1, 1,
0.6876105, 1.744683, -0.6935172, 0.5490196, 0, 1, 1,
0.6890861, 1.141017, 1.84283, 0.5529412, 0, 1, 1,
0.6916527, -1.101906, 1.194589, 0.5607843, 0, 1, 1,
0.6919281, 0.8880318, 0.0003293573, 0.5647059, 0, 1, 1,
0.6943341, 0.8508494, 0.706403, 0.572549, 0, 1, 1,
0.6962574, 0.530252, 1.069527, 0.5764706, 0, 1, 1,
0.697072, 0.7113972, 1.484324, 0.5843138, 0, 1, 1,
0.6988643, -0.9881853, 2.285355, 0.5882353, 0, 1, 1,
0.6996521, 0.2370539, 0.7619795, 0.5960785, 0, 1, 1,
0.7024124, -0.1797276, 2.465984, 0.6039216, 0, 1, 1,
0.7028611, 0.678328, 0.8408061, 0.6078432, 0, 1, 1,
0.7114594, -0.5569664, 2.893484, 0.6156863, 0, 1, 1,
0.7114893, -1.52874, 3.615328, 0.6196079, 0, 1, 1,
0.730387, -1.178536, 2.85181, 0.627451, 0, 1, 1,
0.7356078, 0.08059809, 1.390128, 0.6313726, 0, 1, 1,
0.7394907, 2.250296, 1.286789, 0.6392157, 0, 1, 1,
0.7432812, -1.424253, 1.037231, 0.6431373, 0, 1, 1,
0.7478566, -0.6602727, 2.226239, 0.6509804, 0, 1, 1,
0.7502226, 0.856673, -0.5377071, 0.654902, 0, 1, 1,
0.7545905, 0.4316883, 1.246206, 0.6627451, 0, 1, 1,
0.7590567, -0.03474896, 2.437097, 0.6666667, 0, 1, 1,
0.7600849, 1.061621, -0.514496, 0.6745098, 0, 1, 1,
0.7613808, 0.01988201, 2.039989, 0.6784314, 0, 1, 1,
0.7616463, 0.03245221, 1.842032, 0.6862745, 0, 1, 1,
0.7618897, 1.301676, 1.027514, 0.6901961, 0, 1, 1,
0.7671409, 1.372341, 0.4417892, 0.6980392, 0, 1, 1,
0.7739094, 0.7671703, -0.05884622, 0.7058824, 0, 1, 1,
0.7784991, -1.163052, 1.879296, 0.7098039, 0, 1, 1,
0.7785018, -0.1702927, 1.938778, 0.7176471, 0, 1, 1,
0.7856256, 0.7497925, 1.744351, 0.7215686, 0, 1, 1,
0.7883834, 1.671354, 1.313894, 0.7294118, 0, 1, 1,
0.788771, 2.460842, 1.174659, 0.7333333, 0, 1, 1,
0.7943447, 1.224047, 0.07421187, 0.7411765, 0, 1, 1,
0.797006, 0.7374979, 0.5074957, 0.7450981, 0, 1, 1,
0.8063032, 0.4900648, 0.9226337, 0.7529412, 0, 1, 1,
0.8192424, 0.3044043, 0.8722222, 0.7568628, 0, 1, 1,
0.8317254, 1.059284, -0.08224872, 0.7647059, 0, 1, 1,
0.8353385, 1.051608, 0.6782109, 0.7686275, 0, 1, 1,
0.8367388, -0.4770032, 2.22078, 0.7764706, 0, 1, 1,
0.8444638, -0.361984, 1.667733, 0.7803922, 0, 1, 1,
0.8547877, -0.6871647, 2.561587, 0.7882353, 0, 1, 1,
0.8672528, 0.1765347, 0.5839751, 0.7921569, 0, 1, 1,
0.8680138, -0.1119473, 1.682962, 0.8, 0, 1, 1,
0.8693003, 0.7653236, 0.1409559, 0.8078431, 0, 1, 1,
0.8735682, -1.692303, 3.533113, 0.8117647, 0, 1, 1,
0.8743848, 0.966958, 0.2700289, 0.8196079, 0, 1, 1,
0.8785096, -0.8494073, 3.889996, 0.8235294, 0, 1, 1,
0.8847907, 0.1099265, 2.314795, 0.8313726, 0, 1, 1,
0.8896164, 0.3930807, 1.678056, 0.8352941, 0, 1, 1,
0.8914768, -0.5699126, 1.716898, 0.8431373, 0, 1, 1,
0.8936538, 0.5089811, 1.923218, 0.8470588, 0, 1, 1,
0.8980563, -0.8769907, 2.891163, 0.854902, 0, 1, 1,
0.8982366, -0.981115, 1.428092, 0.8588235, 0, 1, 1,
0.8993344, 0.2570029, 1.456574, 0.8666667, 0, 1, 1,
0.9000285, 1.420611, 0.9696272, 0.8705882, 0, 1, 1,
0.9023026, 0.3462217, 2.138598, 0.8784314, 0, 1, 1,
0.9024226, -0.4598846, 2.458319, 0.8823529, 0, 1, 1,
0.9059024, 1.153639, -0.06906724, 0.8901961, 0, 1, 1,
0.909781, 0.4796716, 1.948127, 0.8941177, 0, 1, 1,
0.9105, -0.9121203, 3.278673, 0.9019608, 0, 1, 1,
0.9147448, 0.6476667, 0.6448746, 0.9098039, 0, 1, 1,
0.9373479, -1.912403, 2.110446, 0.9137255, 0, 1, 1,
0.9403502, 0.1382599, 0.6255432, 0.9215686, 0, 1, 1,
0.940574, -1.304163, 1.333186, 0.9254902, 0, 1, 1,
0.9410785, 0.3154931, 1.951909, 0.9333333, 0, 1, 1,
0.9497154, 1.239775, 0.3452363, 0.9372549, 0, 1, 1,
0.9499425, -0.1424372, 3.92528, 0.945098, 0, 1, 1,
0.9594179, -2.519428, 2.959562, 0.9490196, 0, 1, 1,
0.9605907, -0.1290998, 3.002588, 0.9568627, 0, 1, 1,
0.9716063, 0.8500102, -0.04395312, 0.9607843, 0, 1, 1,
0.9751651, -0.5031524, 2.947577, 0.9686275, 0, 1, 1,
0.9775649, 3.151712, 1.880021, 0.972549, 0, 1, 1,
0.9900524, -0.5661123, 1.10206, 0.9803922, 0, 1, 1,
0.9966093, 0.2545072, 0.719918, 0.9843137, 0, 1, 1,
1.005867, 1.406481, 0.575782, 0.9921569, 0, 1, 1,
1.018644, -0.2957344, 2.44702, 0.9960784, 0, 1, 1,
1.021647, 0.1720508, 0.2296337, 1, 0, 0.9960784, 1,
1.028265, -0.4102456, 2.885353, 1, 0, 0.9882353, 1,
1.033221, -1.052817, 2.978501, 1, 0, 0.9843137, 1,
1.037846, -0.203307, 1.553027, 1, 0, 0.9764706, 1,
1.043003, -1.257742, 0.8260106, 1, 0, 0.972549, 1,
1.049662, 0.7841181, 1.422762, 1, 0, 0.9647059, 1,
1.052506, -0.874757, 3.366759, 1, 0, 0.9607843, 1,
1.053107, 0.120308, 1.5699, 1, 0, 0.9529412, 1,
1.062954, 0.06748461, 1.559731, 1, 0, 0.9490196, 1,
1.064336, 1.422027, 0.2327558, 1, 0, 0.9411765, 1,
1.068433, 0.6829352, 0.2740273, 1, 0, 0.9372549, 1,
1.073707, -1.530855, 2.769006, 1, 0, 0.9294118, 1,
1.074587, -0.3203259, 1.730674, 1, 0, 0.9254902, 1,
1.075316, 0.599749, 0.6232356, 1, 0, 0.9176471, 1,
1.076286, 1.005736, 1.404695, 1, 0, 0.9137255, 1,
1.079907, -1.294882, 2.52476, 1, 0, 0.9058824, 1,
1.080237, -0.8317316, 3.651439, 1, 0, 0.9019608, 1,
1.082515, 0.2017666, -0.6946954, 1, 0, 0.8941177, 1,
1.085113, 1.969109, -1.809301, 1, 0, 0.8862745, 1,
1.087805, 0.8879015, -0.2668823, 1, 0, 0.8823529, 1,
1.091255, -0.07967902, 1.244264, 1, 0, 0.8745098, 1,
1.091629, -0.01872636, 1.832466, 1, 0, 0.8705882, 1,
1.094228, 0.3961103, 0.1698404, 1, 0, 0.8627451, 1,
1.097667, -0.5074208, 2.751034, 1, 0, 0.8588235, 1,
1.097867, 0.3143138, 2.35981, 1, 0, 0.8509804, 1,
1.101408, -1.622122, 3.3943, 1, 0, 0.8470588, 1,
1.107099, 0.479499, 2.508751, 1, 0, 0.8392157, 1,
1.111647, 0.6229674, 1.923332, 1, 0, 0.8352941, 1,
1.116556, 1.179734, 1.418168, 1, 0, 0.827451, 1,
1.11755, -0.9737814, 1.035954, 1, 0, 0.8235294, 1,
1.122534, -1.910432, 0.8464229, 1, 0, 0.8156863, 1,
1.138145, 0.1587192, 1.503029, 1, 0, 0.8117647, 1,
1.142792, -1.860876, 3.101146, 1, 0, 0.8039216, 1,
1.148652, -1.05602, 2.469607, 1, 0, 0.7960784, 1,
1.150599, 1.845469, 2.030388, 1, 0, 0.7921569, 1,
1.156475, -0.504712, 1.114885, 1, 0, 0.7843137, 1,
1.158392, 0.5790641, 3.12795, 1, 0, 0.7803922, 1,
1.163698, 0.2315216, 2.060573, 1, 0, 0.772549, 1,
1.172954, -2.634842, 2.253095, 1, 0, 0.7686275, 1,
1.177906, -1.538642, 3.116722, 1, 0, 0.7607843, 1,
1.179549, -0.6065713, 2.047232, 1, 0, 0.7568628, 1,
1.181314, 0.3686047, 1.204138, 1, 0, 0.7490196, 1,
1.185424, -0.01689618, 2.039006, 1, 0, 0.7450981, 1,
1.194385, 0.5651186, 0.5482836, 1, 0, 0.7372549, 1,
1.198076, 0.8782004, 1.534223, 1, 0, 0.7333333, 1,
1.208256, 2.358516, -0.01764751, 1, 0, 0.7254902, 1,
1.215643, 0.226245, 0.5092052, 1, 0, 0.7215686, 1,
1.218453, 0.5277023, 0.8127052, 1, 0, 0.7137255, 1,
1.224288, -0.8949714, 2.000082, 1, 0, 0.7098039, 1,
1.228504, 0.1442823, 2.129286, 1, 0, 0.7019608, 1,
1.230199, 1.40878, 0.6032106, 1, 0, 0.6941177, 1,
1.232687, -1.408282, 2.782297, 1, 0, 0.6901961, 1,
1.246729, -1.055485, 1.375176, 1, 0, 0.682353, 1,
1.248096, 0.5182748, 1.485667, 1, 0, 0.6784314, 1,
1.262496, -0.5013489, 1.11299, 1, 0, 0.6705883, 1,
1.267205, 0.6176518, 2.976337, 1, 0, 0.6666667, 1,
1.269472, 1.040098, 2.064778, 1, 0, 0.6588235, 1,
1.277453, 0.2858274, 0.8244941, 1, 0, 0.654902, 1,
1.281964, -0.2210129, 1.535834, 1, 0, 0.6470588, 1,
1.305422, 0.1337036, 1.864302, 1, 0, 0.6431373, 1,
1.308217, 0.3465929, 2.415296, 1, 0, 0.6352941, 1,
1.308572, -0.0565793, 2.792785, 1, 0, 0.6313726, 1,
1.310633, 1.575344, 0.8183051, 1, 0, 0.6235294, 1,
1.310988, 1.539132, 1.513207, 1, 0, 0.6196079, 1,
1.313423, 0.1149627, 1.37625, 1, 0, 0.6117647, 1,
1.317476, -1.84736, 2.300257, 1, 0, 0.6078432, 1,
1.323787, -0.163898, 2.205125, 1, 0, 0.6, 1,
1.326881, -0.7445158, 0.4601941, 1, 0, 0.5921569, 1,
1.330132, -0.7708841, 3.685943, 1, 0, 0.5882353, 1,
1.330834, 0.7922684, 0.736004, 1, 0, 0.5803922, 1,
1.334435, -0.7219871, 1.447971, 1, 0, 0.5764706, 1,
1.340608, 1.205506, 0.0002512434, 1, 0, 0.5686275, 1,
1.343539, -1.167414, 1.139302, 1, 0, 0.5647059, 1,
1.353838, -1.891028, 0.8017315, 1, 0, 0.5568628, 1,
1.358584, 0.01741199, 2.100463, 1, 0, 0.5529412, 1,
1.365152, 0.4682757, 1.369137, 1, 0, 0.5450981, 1,
1.376013, 0.3502073, 1.41723, 1, 0, 0.5411765, 1,
1.401831, -0.5692255, 3.44812, 1, 0, 0.5333334, 1,
1.4056, -0.3456087, 1.868016, 1, 0, 0.5294118, 1,
1.408269, 0.2249126, 1.206658, 1, 0, 0.5215687, 1,
1.410195, 0.06979412, -0.1480676, 1, 0, 0.5176471, 1,
1.43282, 0.9817463, 0.2221297, 1, 0, 0.509804, 1,
1.446163, -1.463451, 4.566083, 1, 0, 0.5058824, 1,
1.451013, -0.179453, 1.536374, 1, 0, 0.4980392, 1,
1.453816, 1.729079, -0.5658213, 1, 0, 0.4901961, 1,
1.454218, -1.137236, 1.983839, 1, 0, 0.4862745, 1,
1.461328, 0.1649312, 0.2481529, 1, 0, 0.4784314, 1,
1.474522, 2.278982, 2.541708, 1, 0, 0.4745098, 1,
1.484674, 0.3646975, 1.492388, 1, 0, 0.4666667, 1,
1.488181, 0.615446, 1.051373, 1, 0, 0.4627451, 1,
1.505895, 0.3071043, 3.226197, 1, 0, 0.454902, 1,
1.525415, -1.075119, 2.097117, 1, 0, 0.4509804, 1,
1.541724, -0.1044605, 1.816041, 1, 0, 0.4431373, 1,
1.547663, -0.1457592, 2.396698, 1, 0, 0.4392157, 1,
1.559233, 0.2791724, 1.555962, 1, 0, 0.4313726, 1,
1.564796, 0.07665265, 1.559567, 1, 0, 0.427451, 1,
1.570837, -0.6199633, 1.456672, 1, 0, 0.4196078, 1,
1.60423, 0.08324967, 3.235898, 1, 0, 0.4156863, 1,
1.60692, 1.059736, 1.453017, 1, 0, 0.4078431, 1,
1.610595, 0.02529783, 3.196168, 1, 0, 0.4039216, 1,
1.614749, 0.2392974, 0.9138556, 1, 0, 0.3960784, 1,
1.628708, -0.3562251, 0.5363098, 1, 0, 0.3882353, 1,
1.630138, 0.8201293, 1.69616, 1, 0, 0.3843137, 1,
1.642128, -1.155824, 1.515936, 1, 0, 0.3764706, 1,
1.649697, -1.081233, 1.322082, 1, 0, 0.372549, 1,
1.651766, -0.7864558, 3.972723, 1, 0, 0.3647059, 1,
1.653327, 0.01020749, 3.138189, 1, 0, 0.3607843, 1,
1.659476, 1.874659, 0.1002453, 1, 0, 0.3529412, 1,
1.661602, -1.060889, 1.047276, 1, 0, 0.3490196, 1,
1.663944, -2.430455, 1.746941, 1, 0, 0.3411765, 1,
1.668676, -0.836696, 1.717151, 1, 0, 0.3372549, 1,
1.702707, 1.16969, 1.875898, 1, 0, 0.3294118, 1,
1.71249, 1.677702, 1.003972, 1, 0, 0.3254902, 1,
1.72169, -1.4895, 3.148005, 1, 0, 0.3176471, 1,
1.722931, 1.693632, 0.06128095, 1, 0, 0.3137255, 1,
1.752266, -1.292163, 2.243489, 1, 0, 0.3058824, 1,
1.753571, -1.526629, 1.885593, 1, 0, 0.2980392, 1,
1.760339, 1.0348, 0.8347603, 1, 0, 0.2941177, 1,
1.761187, 1.279677, -0.7860178, 1, 0, 0.2862745, 1,
1.762787, -0.0223515, 2.126523, 1, 0, 0.282353, 1,
1.7683, -1.562772, 2.11722, 1, 0, 0.2745098, 1,
1.772243, 0.1421827, 1.695985, 1, 0, 0.2705882, 1,
1.783977, 0.179706, 0.5218753, 1, 0, 0.2627451, 1,
1.791524, 0.6925573, 2.082124, 1, 0, 0.2588235, 1,
1.803038, 1.457466, 0.6308516, 1, 0, 0.2509804, 1,
1.807165, -1.559823, 1.755221, 1, 0, 0.2470588, 1,
1.820229, 0.3086121, 1.187929, 1, 0, 0.2392157, 1,
1.82317, -0.5862731, 3.185166, 1, 0, 0.2352941, 1,
1.876685, -1.576679, 4.026453, 1, 0, 0.227451, 1,
1.889119, -0.4942788, 2.093118, 1, 0, 0.2235294, 1,
1.897475, 1.925326, -0.5630285, 1, 0, 0.2156863, 1,
1.905795, -0.07663359, 2.401359, 1, 0, 0.2117647, 1,
1.947165, 0.4690957, 1.436225, 1, 0, 0.2039216, 1,
1.948385, -0.6258646, 1.601254, 1, 0, 0.1960784, 1,
1.963654, 0.7090607, 0.4272257, 1, 0, 0.1921569, 1,
1.990137, 0.4633588, 1.71308, 1, 0, 0.1843137, 1,
2.002676, -0.8720037, 3.267902, 1, 0, 0.1803922, 1,
2.011729, -0.2901357, 0.8206673, 1, 0, 0.172549, 1,
2.021384, 2.033705, 0.3347398, 1, 0, 0.1686275, 1,
2.032801, 0.8440609, 0.8384978, 1, 0, 0.1607843, 1,
2.039488, -0.9532216, 0.5054079, 1, 0, 0.1568628, 1,
2.062763, -0.1691326, 1.195788, 1, 0, 0.1490196, 1,
2.081063, -0.7726611, 2.603613, 1, 0, 0.145098, 1,
2.111494, 0.3535285, 0.09745832, 1, 0, 0.1372549, 1,
2.130999, -0.1396489, 2.399869, 1, 0, 0.1333333, 1,
2.143442, 0.4376186, 0.9519799, 1, 0, 0.1254902, 1,
2.167667, -1.450364, 2.314753, 1, 0, 0.1215686, 1,
2.17739, -0.01981537, 1.087066, 1, 0, 0.1137255, 1,
2.189644, -0.4412653, 0.07556769, 1, 0, 0.1098039, 1,
2.207204, -0.0872549, 2.045042, 1, 0, 0.1019608, 1,
2.222525, -0.3596764, 1.433882, 1, 0, 0.09411765, 1,
2.281969, 1.609209, 2.437087, 1, 0, 0.09019608, 1,
2.297962, 0.6683885, 1.897019, 1, 0, 0.08235294, 1,
2.349556, -0.3698443, 1.360013, 1, 0, 0.07843138, 1,
2.361396, -1.517863, 1.944884, 1, 0, 0.07058824, 1,
2.365167, 0.5940077, 1.900921, 1, 0, 0.06666667, 1,
2.369888, 1.673244, 0.3411815, 1, 0, 0.05882353, 1,
2.450257, -0.7553819, 0.8047503, 1, 0, 0.05490196, 1,
2.452456, 0.07089447, 1.106254, 1, 0, 0.04705882, 1,
2.453995, -0.13398, 1.627942, 1, 0, 0.04313726, 1,
2.46224, -2.117292, 2.0172, 1, 0, 0.03529412, 1,
2.46271, 0.05165634, -0.6493956, 1, 0, 0.03137255, 1,
2.498703, 1.189815, 2.135394, 1, 0, 0.02352941, 1,
2.579338, -0.4011949, 0.07057978, 1, 0, 0.01960784, 1,
2.881325, -0.9029599, 1.787747, 1, 0, 0.01176471, 1,
2.991067, 0.4621821, 1.554008, 1, 0, 0.007843138, 1
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
-0.2643307, -4.136575, -7.022231, 0, -0.5, 0.5, 0.5,
-0.2643307, -4.136575, -7.022231, 1, -0.5, 0.5, 0.5,
-0.2643307, -4.136575, -7.022231, 1, 1.5, 0.5, 0.5,
-0.2643307, -4.136575, -7.022231, 0, 1.5, 0.5, 0.5
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
-4.623309, 0.3227198, -7.022231, 0, -0.5, 0.5, 0.5,
-4.623309, 0.3227198, -7.022231, 1, -0.5, 0.5, 0.5,
-4.623309, 0.3227198, -7.022231, 1, 1.5, 0.5, 0.5,
-4.623309, 0.3227198, -7.022231, 0, 1.5, 0.5, 0.5
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
-4.623309, -4.136575, 0.1493249, 0, -0.5, 0.5, 0.5,
-4.623309, -4.136575, 0.1493249, 1, -0.5, 0.5, 0.5,
-4.623309, -4.136575, 0.1493249, 1, 1.5, 0.5, 0.5,
-4.623309, -4.136575, 0.1493249, 0, 1.5, 0.5, 0.5
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
-3, -3.107507, -5.367256,
2, -3.107507, -5.367256,
-3, -3.107507, -5.367256,
-3, -3.279018, -5.643085,
-2, -3.107507, -5.367256,
-2, -3.279018, -5.643085,
-1, -3.107507, -5.367256,
-1, -3.279018, -5.643085,
0, -3.107507, -5.367256,
0, -3.279018, -5.643085,
1, -3.107507, -5.367256,
1, -3.279018, -5.643085,
2, -3.107507, -5.367256,
2, -3.279018, -5.643085
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
-3, -3.622041, -6.194744, 0, -0.5, 0.5, 0.5,
-3, -3.622041, -6.194744, 1, -0.5, 0.5, 0.5,
-3, -3.622041, -6.194744, 1, 1.5, 0.5, 0.5,
-3, -3.622041, -6.194744, 0, 1.5, 0.5, 0.5,
-2, -3.622041, -6.194744, 0, -0.5, 0.5, 0.5,
-2, -3.622041, -6.194744, 1, -0.5, 0.5, 0.5,
-2, -3.622041, -6.194744, 1, 1.5, 0.5, 0.5,
-2, -3.622041, -6.194744, 0, 1.5, 0.5, 0.5,
-1, -3.622041, -6.194744, 0, -0.5, 0.5, 0.5,
-1, -3.622041, -6.194744, 1, -0.5, 0.5, 0.5,
-1, -3.622041, -6.194744, 1, 1.5, 0.5, 0.5,
-1, -3.622041, -6.194744, 0, 1.5, 0.5, 0.5,
0, -3.622041, -6.194744, 0, -0.5, 0.5, 0.5,
0, -3.622041, -6.194744, 1, -0.5, 0.5, 0.5,
0, -3.622041, -6.194744, 1, 1.5, 0.5, 0.5,
0, -3.622041, -6.194744, 0, 1.5, 0.5, 0.5,
1, -3.622041, -6.194744, 0, -0.5, 0.5, 0.5,
1, -3.622041, -6.194744, 1, -0.5, 0.5, 0.5,
1, -3.622041, -6.194744, 1, 1.5, 0.5, 0.5,
1, -3.622041, -6.194744, 0, 1.5, 0.5, 0.5,
2, -3.622041, -6.194744, 0, -0.5, 0.5, 0.5,
2, -3.622041, -6.194744, 1, -0.5, 0.5, 0.5,
2, -3.622041, -6.194744, 1, 1.5, 0.5, 0.5,
2, -3.622041, -6.194744, 0, 1.5, 0.5, 0.5
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
-3.617391, -3, -5.367256,
-3.617391, 3, -5.367256,
-3.617391, -3, -5.367256,
-3.785044, -3, -5.643085,
-3.617391, -2, -5.367256,
-3.785044, -2, -5.643085,
-3.617391, -1, -5.367256,
-3.785044, -1, -5.643085,
-3.617391, 0, -5.367256,
-3.785044, 0, -5.643085,
-3.617391, 1, -5.367256,
-3.785044, 1, -5.643085,
-3.617391, 2, -5.367256,
-3.785044, 2, -5.643085,
-3.617391, 3, -5.367256,
-3.785044, 3, -5.643085
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
-4.12035, -3, -6.194744, 0, -0.5, 0.5, 0.5,
-4.12035, -3, -6.194744, 1, -0.5, 0.5, 0.5,
-4.12035, -3, -6.194744, 1, 1.5, 0.5, 0.5,
-4.12035, -3, -6.194744, 0, 1.5, 0.5, 0.5,
-4.12035, -2, -6.194744, 0, -0.5, 0.5, 0.5,
-4.12035, -2, -6.194744, 1, -0.5, 0.5, 0.5,
-4.12035, -2, -6.194744, 1, 1.5, 0.5, 0.5,
-4.12035, -2, -6.194744, 0, 1.5, 0.5, 0.5,
-4.12035, -1, -6.194744, 0, -0.5, 0.5, 0.5,
-4.12035, -1, -6.194744, 1, -0.5, 0.5, 0.5,
-4.12035, -1, -6.194744, 1, 1.5, 0.5, 0.5,
-4.12035, -1, -6.194744, 0, 1.5, 0.5, 0.5,
-4.12035, 0, -6.194744, 0, -0.5, 0.5, 0.5,
-4.12035, 0, -6.194744, 1, -0.5, 0.5, 0.5,
-4.12035, 0, -6.194744, 1, 1.5, 0.5, 0.5,
-4.12035, 0, -6.194744, 0, 1.5, 0.5, 0.5,
-4.12035, 1, -6.194744, 0, -0.5, 0.5, 0.5,
-4.12035, 1, -6.194744, 1, -0.5, 0.5, 0.5,
-4.12035, 1, -6.194744, 1, 1.5, 0.5, 0.5,
-4.12035, 1, -6.194744, 0, 1.5, 0.5, 0.5,
-4.12035, 2, -6.194744, 0, -0.5, 0.5, 0.5,
-4.12035, 2, -6.194744, 1, -0.5, 0.5, 0.5,
-4.12035, 2, -6.194744, 1, 1.5, 0.5, 0.5,
-4.12035, 2, -6.194744, 0, 1.5, 0.5, 0.5,
-4.12035, 3, -6.194744, 0, -0.5, 0.5, 0.5,
-4.12035, 3, -6.194744, 1, -0.5, 0.5, 0.5,
-4.12035, 3, -6.194744, 1, 1.5, 0.5, 0.5,
-4.12035, 3, -6.194744, 0, 1.5, 0.5, 0.5
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
-3.617391, -3.107507, -4,
-3.617391, -3.107507, 4,
-3.617391, -3.107507, -4,
-3.785044, -3.279018, -4,
-3.617391, -3.107507, -2,
-3.785044, -3.279018, -2,
-3.617391, -3.107507, 0,
-3.785044, -3.279018, 0,
-3.617391, -3.107507, 2,
-3.785044, -3.279018, 2,
-3.617391, -3.107507, 4,
-3.785044, -3.279018, 4
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
-4.12035, -3.622041, -4, 0, -0.5, 0.5, 0.5,
-4.12035, -3.622041, -4, 1, -0.5, 0.5, 0.5,
-4.12035, -3.622041, -4, 1, 1.5, 0.5, 0.5,
-4.12035, -3.622041, -4, 0, 1.5, 0.5, 0.5,
-4.12035, -3.622041, -2, 0, -0.5, 0.5, 0.5,
-4.12035, -3.622041, -2, 1, -0.5, 0.5, 0.5,
-4.12035, -3.622041, -2, 1, 1.5, 0.5, 0.5,
-4.12035, -3.622041, -2, 0, 1.5, 0.5, 0.5,
-4.12035, -3.622041, 0, 0, -0.5, 0.5, 0.5,
-4.12035, -3.622041, 0, 1, -0.5, 0.5, 0.5,
-4.12035, -3.622041, 0, 1, 1.5, 0.5, 0.5,
-4.12035, -3.622041, 0, 0, 1.5, 0.5, 0.5,
-4.12035, -3.622041, 2, 0, -0.5, 0.5, 0.5,
-4.12035, -3.622041, 2, 1, -0.5, 0.5, 0.5,
-4.12035, -3.622041, 2, 1, 1.5, 0.5, 0.5,
-4.12035, -3.622041, 2, 0, 1.5, 0.5, 0.5,
-4.12035, -3.622041, 4, 0, -0.5, 0.5, 0.5,
-4.12035, -3.622041, 4, 1, -0.5, 0.5, 0.5,
-4.12035, -3.622041, 4, 1, 1.5, 0.5, 0.5,
-4.12035, -3.622041, 4, 0, 1.5, 0.5, 0.5
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
-3.617391, -3.107507, -5.367256,
-3.617391, 3.752947, -5.367256,
-3.617391, -3.107507, 5.665906,
-3.617391, 3.752947, 5.665906,
-3.617391, -3.107507, -5.367256,
-3.617391, -3.107507, 5.665906,
-3.617391, 3.752947, -5.367256,
-3.617391, 3.752947, 5.665906,
-3.617391, -3.107507, -5.367256,
3.088729, -3.107507, -5.367256,
-3.617391, -3.107507, 5.665906,
3.088729, -3.107507, 5.665906,
-3.617391, 3.752947, -5.367256,
3.088729, 3.752947, -5.367256,
-3.617391, 3.752947, 5.665906,
3.088729, 3.752947, 5.665906,
3.088729, -3.107507, -5.367256,
3.088729, 3.752947, -5.367256,
3.088729, -3.107507, 5.665906,
3.088729, 3.752947, 5.665906,
3.088729, -3.107507, -5.367256,
3.088729, -3.107507, 5.665906,
3.088729, 3.752947, -5.367256,
3.088729, 3.752947, 5.665906
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
var radius = 7.807237;
var distance = 34.73528;
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
mvMatrix.translate( 0.2643307, -0.3227198, -0.1493249 );
mvMatrix.scale( 1.258751, 1.230434, 0.7650878 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.73528);
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
prodiamine<-read.table("prodiamine.xyz")
```

```
## Error in read.table("prodiamine.xyz"): no lines available in input
```

```r
x<-prodiamine$V2
```

```
## Error in eval(expr, envir, enclos): object 'prodiamine' not found
```

```r
y<-prodiamine$V3
```

```
## Error in eval(expr, envir, enclos): object 'prodiamine' not found
```

```r
z<-prodiamine$V4
```

```
## Error in eval(expr, envir, enclos): object 'prodiamine' not found
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
-3.519729, -1.233589, -0.9956345, 0, 0, 1, 1, 1,
-3.239407, -1.05836, -3.634434, 1, 0, 0, 1, 1,
-3.235632, 0.3907855, -0.5396625, 1, 0, 0, 1, 1,
-2.913774, 1.11114, -1.457746, 1, 0, 0, 1, 1,
-2.788602, 3.077005, -2.184606, 1, 0, 0, 1, 1,
-2.767303, -0.8246689, -2.792917, 1, 0, 0, 1, 1,
-2.560121, 0.05945073, -0.4634676, 0, 0, 0, 1, 1,
-2.538283, -1.05757, -2.082481, 0, 0, 0, 1, 1,
-2.473788, 0.501942, -1.006999, 0, 0, 0, 1, 1,
-2.358905, -0.01931799, -0.7051002, 0, 0, 0, 1, 1,
-2.355, 0.3077084, -2.092687, 0, 0, 0, 1, 1,
-2.351984, 0.6208043, -1.285274, 0, 0, 0, 1, 1,
-2.329458, -0.4894007, -1.073506, 0, 0, 0, 1, 1,
-2.326111, 0.2758098, -1.41902, 1, 1, 1, 1, 1,
-2.188826, -0.8114957, -2.135267, 1, 1, 1, 1, 1,
-2.161023, -0.7447532, -1.676667, 1, 1, 1, 1, 1,
-2.149057, 1.012112, -1.078456, 1, 1, 1, 1, 1,
-2.100321, -1.392092, -1.655918, 1, 1, 1, 1, 1,
-2.05493, -0.6182034, -2.944823, 1, 1, 1, 1, 1,
-2.041817, 0.7784367, -1.012465, 1, 1, 1, 1, 1,
-2.028256, 1.228502, -1.406211, 1, 1, 1, 1, 1,
-2.025471, -0.7945513, -3.064703, 1, 1, 1, 1, 1,
-2.001426, -1.55598, -2.166612, 1, 1, 1, 1, 1,
-1.975564, 0.4839793, -0.8179608, 1, 1, 1, 1, 1,
-1.934608, -1.483156, -2.992933, 1, 1, 1, 1, 1,
-1.926057, 0.7834382, 0.1827952, 1, 1, 1, 1, 1,
-1.917413, 1.842071, -0.4003281, 1, 1, 1, 1, 1,
-1.866644, -0.4974334, -0.9176913, 1, 1, 1, 1, 1,
-1.851961, -0.2521279, -1.747401, 0, 0, 1, 1, 1,
-1.839555, -0.2823288, -0.5715984, 1, 0, 0, 1, 1,
-1.81421, -0.4164444, 0.3777419, 1, 0, 0, 1, 1,
-1.805666, -0.2797147, 0.2889608, 1, 0, 0, 1, 1,
-1.791759, -0.3243888, -1.819553, 1, 0, 0, 1, 1,
-1.776426, -0.4772716, -2.377402, 1, 0, 0, 1, 1,
-1.76993, -0.362195, -2.126728, 0, 0, 0, 1, 1,
-1.748806, 1.056595, -2.208074, 0, 0, 0, 1, 1,
-1.726314, -0.7545047, -1.903439, 0, 0, 0, 1, 1,
-1.706892, -1.121117, -1.527047, 0, 0, 0, 1, 1,
-1.68393, -1.479664, -2.666388, 0, 0, 0, 1, 1,
-1.664476, 0.2355947, -1.244338, 0, 0, 0, 1, 1,
-1.641012, -0.3886737, 0.1690147, 0, 0, 0, 1, 1,
-1.611737, 0.2437281, 0.06315293, 1, 1, 1, 1, 1,
-1.599573, 1.072978, 0.1405094, 1, 1, 1, 1, 1,
-1.591244, -1.311526, -2.224288, 1, 1, 1, 1, 1,
-1.571684, 0.2660632, -2.408976, 1, 1, 1, 1, 1,
-1.561124, 1.735265, 0.5661172, 1, 1, 1, 1, 1,
-1.558537, 1.456229, -1.729017, 1, 1, 1, 1, 1,
-1.556472, -1.196238, -3.494939, 1, 1, 1, 1, 1,
-1.554335, 1.173153, -1.530525, 1, 1, 1, 1, 1,
-1.546264, 0.1034691, -1.90449, 1, 1, 1, 1, 1,
-1.544584, -1.12866, -1.910548, 1, 1, 1, 1, 1,
-1.532151, -0.9156302, -2.791486, 1, 1, 1, 1, 1,
-1.527473, 1.091003, -1.041414, 1, 1, 1, 1, 1,
-1.517989, -0.6094611, -1.999194, 1, 1, 1, 1, 1,
-1.517239, 0.702657, -1.842721, 1, 1, 1, 1, 1,
-1.509294, 0.994132, -0.932331, 1, 1, 1, 1, 1,
-1.499853, 1.146588, -1.277973, 0, 0, 1, 1, 1,
-1.492994, 0.3096027, -2.567686, 1, 0, 0, 1, 1,
-1.48406, 0.6005528, 0.5772101, 1, 0, 0, 1, 1,
-1.469114, 0.6594982, -2.065907, 1, 0, 0, 1, 1,
-1.46824, -0.04119103, -3.115756, 1, 0, 0, 1, 1,
-1.458235, 0.2918498, -1.370782, 1, 0, 0, 1, 1,
-1.45467, 0.1680368, -1.528547, 0, 0, 0, 1, 1,
-1.450122, 0.4671673, -1.217346, 0, 0, 0, 1, 1,
-1.448909, -0.4584047, -2.092244, 0, 0, 0, 1, 1,
-1.445103, -0.5799949, -1.771488, 0, 0, 0, 1, 1,
-1.438402, -0.1319004, -0.3739468, 0, 0, 0, 1, 1,
-1.429173, -0.05111974, -1.498659, 0, 0, 0, 1, 1,
-1.42574, -0.4106388, -1.215907, 0, 0, 0, 1, 1,
-1.421918, 0.1684914, -1.718282, 1, 1, 1, 1, 1,
-1.413098, 0.4231863, -1.765732, 1, 1, 1, 1, 1,
-1.395414, -0.5726439, -2.999872, 1, 1, 1, 1, 1,
-1.391455, 0.7619556, -1.605852, 1, 1, 1, 1, 1,
-1.38965, 0.7336112, -1.515592, 1, 1, 1, 1, 1,
-1.385305, 0.1845405, -0.7694567, 1, 1, 1, 1, 1,
-1.38026, 1.093055, 0.4564208, 1, 1, 1, 1, 1,
-1.380183, -0.650317, -2.111535, 1, 1, 1, 1, 1,
-1.357333, -0.1199426, -1.202688, 1, 1, 1, 1, 1,
-1.348649, -1.278178, -1.563923, 1, 1, 1, 1, 1,
-1.347548, -1.394432, -1.832965, 1, 1, 1, 1, 1,
-1.344736, 0.1065648, -0.7923504, 1, 1, 1, 1, 1,
-1.332379, -0.8626395, -1.62961, 1, 1, 1, 1, 1,
-1.332134, -0.8531826, -2.318604, 1, 1, 1, 1, 1,
-1.329299, -0.8242695, -2.306539, 1, 1, 1, 1, 1,
-1.327072, -0.4220204, -0.2535244, 0, 0, 1, 1, 1,
-1.326055, -1.919694, -3.069495, 1, 0, 0, 1, 1,
-1.325208, 0.12624, -1.985076, 1, 0, 0, 1, 1,
-1.316442, -0.4843565, -2.114037, 1, 0, 0, 1, 1,
-1.315175, -0.5141561, -2.637075, 1, 0, 0, 1, 1,
-1.311418, 0.7358311, -0.6299394, 1, 0, 0, 1, 1,
-1.305197, -0.9845842, -2.976312, 0, 0, 0, 1, 1,
-1.305183, 0.5512511, -0.5090817, 0, 0, 0, 1, 1,
-1.30281, 1.833116, -0.7391093, 0, 0, 0, 1, 1,
-1.299889, 1.87783, -1.707791, 0, 0, 0, 1, 1,
-1.297181, -1.154768, -4.071255, 0, 0, 0, 1, 1,
-1.29598, 0.4199326, 0.6020079, 0, 0, 0, 1, 1,
-1.295026, -0.6135177, -2.325367, 0, 0, 0, 1, 1,
-1.292803, -0.9907226, -2.88915, 1, 1, 1, 1, 1,
-1.278632, 0.1410969, -2.338295, 1, 1, 1, 1, 1,
-1.27209, -0.2878201, -2.318066, 1, 1, 1, 1, 1,
-1.270279, -0.9907504, -1.498233, 1, 1, 1, 1, 1,
-1.262026, -1.214864, -2.572927, 1, 1, 1, 1, 1,
-1.260162, -1.124116, -2.951492, 1, 1, 1, 1, 1,
-1.257452, 0.8429202, -1.127423, 1, 1, 1, 1, 1,
-1.241352, -0.5343214, -2.436367, 1, 1, 1, 1, 1,
-1.238281, 0.1577569, -1.365118, 1, 1, 1, 1, 1,
-1.237244, 0.1888797, -2.312948, 1, 1, 1, 1, 1,
-1.234954, -0.2776768, -1.307135, 1, 1, 1, 1, 1,
-1.234171, 0.4132857, 0.07045853, 1, 1, 1, 1, 1,
-1.231863, 1.281664, -0.8631098, 1, 1, 1, 1, 1,
-1.216275, -1.289575, -2.355418, 1, 1, 1, 1, 1,
-1.206086, 0.3249665, -1.874053, 1, 1, 1, 1, 1,
-1.184615, -0.863291, -2.45937, 0, 0, 1, 1, 1,
-1.18295, 0.8974468, 0.3022773, 1, 0, 0, 1, 1,
-1.171416, -1.109709, -2.728313, 1, 0, 0, 1, 1,
-1.154235, 2.116677, 0.5579631, 1, 0, 0, 1, 1,
-1.149953, -0.8842716, -2.031085, 1, 0, 0, 1, 1,
-1.144956, -1.335889, -2.139081, 1, 0, 0, 1, 1,
-1.142651, -0.5744461, -0.9424215, 0, 0, 0, 1, 1,
-1.135799, -0.185828, -2.041342, 0, 0, 0, 1, 1,
-1.135078, 0.9108855, -0.2889609, 0, 0, 0, 1, 1,
-1.129666, 1.473319, -1.517007, 0, 0, 0, 1, 1,
-1.121064, -0.6322736, -1.696547, 0, 0, 0, 1, 1,
-1.117295, -0.3454146, -2.032321, 0, 0, 0, 1, 1,
-1.115772, 1.494113, -1.375471, 0, 0, 0, 1, 1,
-1.11516, 0.1869316, -1.220825, 1, 1, 1, 1, 1,
-1.110089, 0.9462956, -0.06006792, 1, 1, 1, 1, 1,
-1.107472, -0.5093142, -2.329417, 1, 1, 1, 1, 1,
-1.106443, -0.1168992, -3.723733, 1, 1, 1, 1, 1,
-1.10307, -2.077018, -3.054986, 1, 1, 1, 1, 1,
-1.102115, -0.1300078, -0.4141598, 1, 1, 1, 1, 1,
-1.095086, -1.121004, -3.110211, 1, 1, 1, 1, 1,
-1.093087, -0.4124089, -1.31867, 1, 1, 1, 1, 1,
-1.09199, -0.1087382, -2.897023, 1, 1, 1, 1, 1,
-1.076724, 0.006907406, -1.971103, 1, 1, 1, 1, 1,
-1.074654, -0.02198203, -2.043868, 1, 1, 1, 1, 1,
-1.064877, -1.140539, -2.756103, 1, 1, 1, 1, 1,
-1.063632, 0.1951109, -1.13274, 1, 1, 1, 1, 1,
-1.063532, 0.3780262, -0.58843, 1, 1, 1, 1, 1,
-1.062406, 1.92092, -1.903098, 1, 1, 1, 1, 1,
-1.057793, 0.6260102, -2.297531, 0, 0, 1, 1, 1,
-1.052924, 1.603711, -1.369309, 1, 0, 0, 1, 1,
-1.046579, 0.1133179, -0.9059982, 1, 0, 0, 1, 1,
-1.046182, -1.284795, 0.1903572, 1, 0, 0, 1, 1,
-1.045391, -1.308366, -2.174156, 1, 0, 0, 1, 1,
-1.027715, 1.602908, 0.3454405, 1, 0, 0, 1, 1,
-1.005926, 1.62066, -0.9935141, 0, 0, 0, 1, 1,
-1.004562, -0.01145183, -1.598512, 0, 0, 0, 1, 1,
-1.002634, -1.199579, -2.042234, 0, 0, 0, 1, 1,
-0.9998736, -0.4883065, -1.743555, 0, 0, 0, 1, 1,
-0.9976847, 0.6419228, -1.470448, 0, 0, 0, 1, 1,
-0.9966542, -0.8459219, -1.591995, 0, 0, 0, 1, 1,
-0.9927096, 0.4060989, -1.068782, 0, 0, 0, 1, 1,
-0.982671, -0.004265176, -1.794765, 1, 1, 1, 1, 1,
-0.9793801, -1.066536, -1.709939, 1, 1, 1, 1, 1,
-0.9784718, -0.4981159, -0.8977122, 1, 1, 1, 1, 1,
-0.9668229, -1.066546, -3.263285, 1, 1, 1, 1, 1,
-0.9609023, 1.04185, -0.6401203, 1, 1, 1, 1, 1,
-0.9534045, -0.3686611, -0.2573331, 1, 1, 1, 1, 1,
-0.9480546, -0.6517578, -2.157896, 1, 1, 1, 1, 1,
-0.9473336, 0.9694884, -0.2762951, 1, 1, 1, 1, 1,
-0.9461314, -0.3457378, -0.3737083, 1, 1, 1, 1, 1,
-0.9444442, -0.4020509, -0.9585415, 1, 1, 1, 1, 1,
-0.939532, -0.7079494, -0.4914891, 1, 1, 1, 1, 1,
-0.9348567, 0.3077672, -0.7314228, 1, 1, 1, 1, 1,
-0.9327609, 1.247112, 1.028804, 1, 1, 1, 1, 1,
-0.9302465, -1.125261, -3.421039, 1, 1, 1, 1, 1,
-0.9276364, -2.231328, -2.757779, 1, 1, 1, 1, 1,
-0.9266591, -0.2728414, -1.510696, 0, 0, 1, 1, 1,
-0.9247966, -0.2026483, -2.097542, 1, 0, 0, 1, 1,
-0.9235181, 0.08257342, -2.346526, 1, 0, 0, 1, 1,
-0.9223542, -1.90407, -4.919884, 1, 0, 0, 1, 1,
-0.9207153, 0.1632759, -2.939347, 1, 0, 0, 1, 1,
-0.9119635, -1.733208, -2.39013, 1, 0, 0, 1, 1,
-0.9115191, 0.6095245, -2.035235, 0, 0, 0, 1, 1,
-0.9095351, 0.1732137, -2.314301, 0, 0, 0, 1, 1,
-0.9048891, -1.157855, -2.393074, 0, 0, 0, 1, 1,
-0.9032695, 0.2999469, -0.8507677, 0, 0, 0, 1, 1,
-0.9023463, -0.3419151, -2.91529, 0, 0, 0, 1, 1,
-0.9017257, -1.330379, -2.580496, 0, 0, 0, 1, 1,
-0.8953815, -0.6644283, -3.451303, 0, 0, 0, 1, 1,
-0.8905348, -0.5648144, -0.9958771, 1, 1, 1, 1, 1,
-0.8841565, 0.4707508, -0.1553057, 1, 1, 1, 1, 1,
-0.8797748, 0.1126892, 1.462821, 1, 1, 1, 1, 1,
-0.8760533, 1.44836, 0.556599, 1, 1, 1, 1, 1,
-0.8759162, 0.777972, -0.401179, 1, 1, 1, 1, 1,
-0.8735173, 0.404703, -0.2608283, 1, 1, 1, 1, 1,
-0.8709326, 0.4017021, -1.576445, 1, 1, 1, 1, 1,
-0.8707027, -0.5354816, -1.452637, 1, 1, 1, 1, 1,
-0.8684731, 0.7459152, -0.5192989, 1, 1, 1, 1, 1,
-0.8592422, -2.698349, -3.012983, 1, 1, 1, 1, 1,
-0.8576405, -0.454882, -1.951773, 1, 1, 1, 1, 1,
-0.8479111, 0.1027303, -0.7597747, 1, 1, 1, 1, 1,
-0.843857, 1.042981, -0.7150682, 1, 1, 1, 1, 1,
-0.836491, 0.4665973, -2.768362, 1, 1, 1, 1, 1,
-0.8355562, 0.06831079, -1.322528, 1, 1, 1, 1, 1,
-0.8354257, -0.6409372, -3.264989, 0, 0, 1, 1, 1,
-0.8326126, -0.5803758, -1.69136, 1, 0, 0, 1, 1,
-0.8301469, -1.207225, -3.790138, 1, 0, 0, 1, 1,
-0.8279754, -1.013033, -2.952136, 1, 0, 0, 1, 1,
-0.8231601, 0.03481821, -3.441945, 1, 0, 0, 1, 1,
-0.8223391, -0.1730164, -1.437423, 1, 0, 0, 1, 1,
-0.820783, -0.8781784, -4.199913, 0, 0, 0, 1, 1,
-0.8143143, 1.408236, -0.2906098, 0, 0, 0, 1, 1,
-0.8138421, -0.4664913, -4.077696, 0, 0, 0, 1, 1,
-0.811048, -0.3251853, -1.276651, 0, 0, 0, 1, 1,
-0.8085415, -0.06041191, -2.991144, 0, 0, 0, 1, 1,
-0.8083882, 0.0267123, -0.4851443, 0, 0, 0, 1, 1,
-0.8069999, -0.2433301, -0.3653193, 0, 0, 0, 1, 1,
-0.7995891, -1.192042, -2.92185, 1, 1, 1, 1, 1,
-0.7984626, -0.08225705, -3.500534, 1, 1, 1, 1, 1,
-0.796089, -0.9140477, -2.619175, 1, 1, 1, 1, 1,
-0.7920816, -1.567444, -2.139487, 1, 1, 1, 1, 1,
-0.7892558, 2.160745, 1.303748, 1, 1, 1, 1, 1,
-0.7848472, -0.3772098, -2.061973, 1, 1, 1, 1, 1,
-0.7735851, 0.1521344, -1.440136, 1, 1, 1, 1, 1,
-0.7710503, 0.8879477, -0.1399526, 1, 1, 1, 1, 1,
-0.7694117, 0.4390356, -1.147047, 1, 1, 1, 1, 1,
-0.7689447, 0.3794374, -2.908976, 1, 1, 1, 1, 1,
-0.7660725, -2.381314, -4.24098, 1, 1, 1, 1, 1,
-0.7657439, 1.578623, -0.1867683, 1, 1, 1, 1, 1,
-0.7635584, -0.9530624, -2.541679, 1, 1, 1, 1, 1,
-0.7620466, 1.19227, 1.149191, 1, 1, 1, 1, 1,
-0.7597644, 0.6150441, 0.5327796, 1, 1, 1, 1, 1,
-0.7596402, -0.7027344, -1.164543, 0, 0, 1, 1, 1,
-0.7583167, -0.3228656, -1.84822, 1, 0, 0, 1, 1,
-0.7581538, 0.848039, -1.156251, 1, 0, 0, 1, 1,
-0.7544121, -0.008053352, -2.134366, 1, 0, 0, 1, 1,
-0.7506883, 0.5056588, 0.1386711, 1, 0, 0, 1, 1,
-0.749821, -2.268843, -3.269315, 1, 0, 0, 1, 1,
-0.7484369, -0.1967034, -1.949565, 0, 0, 0, 1, 1,
-0.7433566, -0.1952617, -2.316292, 0, 0, 0, 1, 1,
-0.7408851, -1.629066, -2.963539, 0, 0, 0, 1, 1,
-0.7401925, -0.5185585, -2.705949, 0, 0, 0, 1, 1,
-0.7378231, 0.4896798, -2.535496, 0, 0, 0, 1, 1,
-0.7312343, 0.02881857, -0.6508792, 0, 0, 0, 1, 1,
-0.7302122, 0.1819742, -0.8279594, 0, 0, 0, 1, 1,
-0.7286731, -0.04901012, -1.129994, 1, 1, 1, 1, 1,
-0.7251921, 0.1454304, -0.7266513, 1, 1, 1, 1, 1,
-0.7219639, -1.24634, -4.383488, 1, 1, 1, 1, 1,
-0.7195884, 0.7517555, -0.7998047, 1, 1, 1, 1, 1,
-0.7159043, 0.08793383, -1.814336, 1, 1, 1, 1, 1,
-0.709044, -0.09992543, -0.4271063, 1, 1, 1, 1, 1,
-0.706247, -1.247721, -4.814935, 1, 1, 1, 1, 1,
-0.704182, -2.090203, -2.297502, 1, 1, 1, 1, 1,
-0.7004817, -0.9348298, -2.50257, 1, 1, 1, 1, 1,
-0.7002029, 0.1312297, -1.822485, 1, 1, 1, 1, 1,
-0.6998258, -2.79844, -3.988181, 1, 1, 1, 1, 1,
-0.6992796, 1.479269, -0.3517443, 1, 1, 1, 1, 1,
-0.6985332, -1.546578, -2.697612, 1, 1, 1, 1, 1,
-0.6966112, 0.5451571, -1.200273, 1, 1, 1, 1, 1,
-0.6946927, 0.5565977, -0.9937304, 1, 1, 1, 1, 1,
-0.6945, -1.275928, 0.5180033, 0, 0, 1, 1, 1,
-0.6868409, -1.377198, -1.968382, 1, 0, 0, 1, 1,
-0.6814679, 1.65619, -0.2033934, 1, 0, 0, 1, 1,
-0.6810168, 0.6915717, -1.780184, 1, 0, 0, 1, 1,
-0.6791509, 1.057312, 0.6934771, 1, 0, 0, 1, 1,
-0.6789693, 0.1002669, -2.573181, 1, 0, 0, 1, 1,
-0.6772312, 0.7995481, 1.098923, 0, 0, 0, 1, 1,
-0.6602569, 1.729795, -1.710261, 0, 0, 0, 1, 1,
-0.6582749, -0.1044328, -1.553805, 0, 0, 0, 1, 1,
-0.6558532, -1.196037, -1.128835, 0, 0, 0, 1, 1,
-0.653829, -0.9360374, -3.097394, 0, 0, 0, 1, 1,
-0.6529401, -0.7776934, -4.221947, 0, 0, 0, 1, 1,
-0.6526837, 0.7892183, -1.171024, 0, 0, 0, 1, 1,
-0.6498569, 0.6553668, -0.5630969, 1, 1, 1, 1, 1,
-0.6480091, -1.267747, -0.4785575, 1, 1, 1, 1, 1,
-0.6470562, -0.134573, -3.345788, 1, 1, 1, 1, 1,
-0.6387549, 1.232385, 1.25143, 1, 1, 1, 1, 1,
-0.6381395, 2.006459, -1.073088, 1, 1, 1, 1, 1,
-0.6355791, 0.2884627, 0.334047, 1, 1, 1, 1, 1,
-0.6329485, -0.5220509, -1.761581, 1, 1, 1, 1, 1,
-0.6301724, 1.094307, -1.276193, 1, 1, 1, 1, 1,
-0.6282576, 0.9807139, 0.803443, 1, 1, 1, 1, 1,
-0.6263888, 0.5699547, 0.03880482, 1, 1, 1, 1, 1,
-0.6243415, 0.6822801, 0.07827247, 1, 1, 1, 1, 1,
-0.6226912, -1.505206, -1.929734, 1, 1, 1, 1, 1,
-0.6136618, 0.1014908, -0.9960576, 1, 1, 1, 1, 1,
-0.6025949, 2.165466, 1.877763, 1, 1, 1, 1, 1,
-0.6007153, -0.6283829, -2.192089, 1, 1, 1, 1, 1,
-0.6006484, 0.9806822, -0.3116379, 0, 0, 1, 1, 1,
-0.5985801, 0.6080945, -2.726998, 1, 0, 0, 1, 1,
-0.5932976, 0.1338966, 0.3412077, 1, 0, 0, 1, 1,
-0.5848018, 0.3721542, -1.762692, 1, 0, 0, 1, 1,
-0.5755444, -0.2413641, -2.006308, 1, 0, 0, 1, 1,
-0.5753599, -2.448627, -4.074351, 1, 0, 0, 1, 1,
-0.5674296, -0.9110833, -1.598377, 0, 0, 0, 1, 1,
-0.559059, 1.612997, -0.5203655, 0, 0, 0, 1, 1,
-0.550402, -0.6476764, -2.624396, 0, 0, 0, 1, 1,
-0.5488556, -0.3895246, -3.463, 0, 0, 0, 1, 1,
-0.5464901, -2.214685, -3.023479, 0, 0, 0, 1, 1,
-0.5438318, 0.4126458, -1.643716, 0, 0, 0, 1, 1,
-0.5432045, -1.533182, -2.869678, 0, 0, 0, 1, 1,
-0.5424035, 1.587928, -0.7721084, 1, 1, 1, 1, 1,
-0.5294771, 0.1629946, -2.084932, 1, 1, 1, 1, 1,
-0.5151109, 0.6256223, -3.435561, 1, 1, 1, 1, 1,
-0.5136585, 1.574769, 0.743693, 1, 1, 1, 1, 1,
-0.5116737, -1.473635, -2.076427, 1, 1, 1, 1, 1,
-0.5074823, 1.135771, -2.89254, 1, 1, 1, 1, 1,
-0.5074489, 0.7068686, -1.912114, 1, 1, 1, 1, 1,
-0.5024635, 0.4435041, -0.3911604, 1, 1, 1, 1, 1,
-0.5023615, -0.2494153, -1.808282, 1, 1, 1, 1, 1,
-0.5012648, 0.03881598, -1.754986, 1, 1, 1, 1, 1,
-0.4973576, 0.6358504, -1.474313, 1, 1, 1, 1, 1,
-0.4938462, -0.008967604, -1.689734, 1, 1, 1, 1, 1,
-0.4894848, 1.090336, -0.08489572, 1, 1, 1, 1, 1,
-0.4842012, 0.3837545, -0.7558575, 1, 1, 1, 1, 1,
-0.4772306, -0.9108107, -3.774643, 1, 1, 1, 1, 1,
-0.4765939, -1.641189, -2.622042, 0, 0, 1, 1, 1,
-0.4739968, -2.531067, -3.139886, 1, 0, 0, 1, 1,
-0.4730621, 0.2665326, -0.9444879, 1, 0, 0, 1, 1,
-0.4725988, -0.5324455, -3.478702, 1, 0, 0, 1, 1,
-0.4675321, 1.1713, 0.728515, 1, 0, 0, 1, 1,
-0.4673533, 0.7485389, -2.008973, 1, 0, 0, 1, 1,
-0.4624991, -0.4754559, -2.513558, 0, 0, 0, 1, 1,
-0.4621874, 2.396387, -1.589735, 0, 0, 0, 1, 1,
-0.4596074, -0.7912523, -1.381155, 0, 0, 0, 1, 1,
-0.4573486, -0.6072593, -3.981404, 0, 0, 0, 1, 1,
-0.4573349, -0.6677282, -1.6098, 0, 0, 0, 1, 1,
-0.4552728, -0.2998872, -1.486694, 0, 0, 0, 1, 1,
-0.4497934, 0.3263655, 0.08133961, 0, 0, 0, 1, 1,
-0.4485428, 0.2670805, -2.336021, 1, 1, 1, 1, 1,
-0.4485174, 0.7613266, -1.378502, 1, 1, 1, 1, 1,
-0.4482182, 0.06103672, -1.669513, 1, 1, 1, 1, 1,
-0.4470341, -0.4788154, -1.396791, 1, 1, 1, 1, 1,
-0.4434074, -0.2043404, -2.647405, 1, 1, 1, 1, 1,
-0.4395524, -0.01012658, -1.969199, 1, 1, 1, 1, 1,
-0.4346201, 1.006483, 0.7237633, 1, 1, 1, 1, 1,
-0.4300118, -0.7910326, -3.18205, 1, 1, 1, 1, 1,
-0.428857, -1.291272, -2.249441, 1, 1, 1, 1, 1,
-0.4260121, -0.8516715, -3.733526, 1, 1, 1, 1, 1,
-0.4218322, -0.1564665, -1.008562, 1, 1, 1, 1, 1,
-0.420444, -0.6166105, -4.239697, 1, 1, 1, 1, 1,
-0.4193829, 0.1736602, -1.884643, 1, 1, 1, 1, 1,
-0.4185014, 1.053154, 0.5973389, 1, 1, 1, 1, 1,
-0.4004984, -1.017639, -4.088958, 1, 1, 1, 1, 1,
-0.3995868, 0.2091951, -2.055646, 0, 0, 1, 1, 1,
-0.391325, -0.7484091, -2.941419, 1, 0, 0, 1, 1,
-0.3903359, -1.574384, -3.3263, 1, 0, 0, 1, 1,
-0.386715, -0.7874974, -3.525503, 1, 0, 0, 1, 1,
-0.3826123, 2.091187, -0.792092, 1, 0, 0, 1, 1,
-0.3788792, -0.1843068, -3.007752, 1, 0, 0, 1, 1,
-0.3775972, 0.8616707, 1.115885, 0, 0, 0, 1, 1,
-0.3756953, 0.4102173, -1.844061, 0, 0, 0, 1, 1,
-0.3742006, 0.4271786, -1.008963, 0, 0, 0, 1, 1,
-0.3723987, -0.7256216, -2.371929, 0, 0, 0, 1, 1,
-0.3683525, -0.5634012, -2.967688, 0, 0, 0, 1, 1,
-0.365862, 0.4750135, -0.2449849, 0, 0, 0, 1, 1,
-0.3653365, -0.4613483, -3.047392, 0, 0, 0, 1, 1,
-0.3648625, 0.3628018, -1.193466, 1, 1, 1, 1, 1,
-0.3568625, -0.2601225, -2.571301, 1, 1, 1, 1, 1,
-0.3564388, 1.169098, 0.2430991, 1, 1, 1, 1, 1,
-0.3533543, -0.3925977, -1.645407, 1, 1, 1, 1, 1,
-0.3507954, 0.0008089347, -0.9131767, 1, 1, 1, 1, 1,
-0.3495344, -1.268267, -2.179142, 1, 1, 1, 1, 1,
-0.345763, -0.9095616, -1.625576, 1, 1, 1, 1, 1,
-0.3431938, -0.8382792, -2.987715, 1, 1, 1, 1, 1,
-0.3431288, -0.6439012, -2.21729, 1, 1, 1, 1, 1,
-0.3357608, -0.879466, -4.065168, 1, 1, 1, 1, 1,
-0.3353171, 0.9464418, 0.5757686, 1, 1, 1, 1, 1,
-0.333379, 1.383106, -0.05028325, 1, 1, 1, 1, 1,
-0.3313441, 0.6637139, -1.656344, 1, 1, 1, 1, 1,
-0.3228562, -0.7310326, -2.28048, 1, 1, 1, 1, 1,
-0.3226445, -0.406921, -2.538478, 1, 1, 1, 1, 1,
-0.3215756, -0.2129993, -0.9441848, 0, 0, 1, 1, 1,
-0.3198393, 0.005483143, -1.348762, 1, 0, 0, 1, 1,
-0.3141339, -0.7034726, -3.231755, 1, 0, 0, 1, 1,
-0.3133182, -0.7593928, -2.296097, 1, 0, 0, 1, 1,
-0.3122908, 1.164335, -0.9733388, 1, 0, 0, 1, 1,
-0.3118272, 0.4064495, -1.094774, 1, 0, 0, 1, 1,
-0.3102526, -0.6526479, -3.824317, 0, 0, 0, 1, 1,
-0.3075805, -0.4317985, -2.302753, 0, 0, 0, 1, 1,
-0.3072084, 0.2726354, -0.6895721, 0, 0, 0, 1, 1,
-0.3056934, 0.4344221, -1.599032, 0, 0, 0, 1, 1,
-0.3053327, 0.08623247, 0.3213074, 0, 0, 0, 1, 1,
-0.3016062, 0.8784857, -0.6466315, 0, 0, 0, 1, 1,
-0.3007294, -1.384631, -1.530053, 0, 0, 0, 1, 1,
-0.2981569, -0.2677065, -3.618473, 1, 1, 1, 1, 1,
-0.2928079, 2.827405, -0.4302315, 1, 1, 1, 1, 1,
-0.2918012, 0.6124938, -1.889358, 1, 1, 1, 1, 1,
-0.2906572, -0.001943905, -1.109301, 1, 1, 1, 1, 1,
-0.2883196, -0.2862918, -3.859798, 1, 1, 1, 1, 1,
-0.2864856, 0.02510703, -1.370318, 1, 1, 1, 1, 1,
-0.2860907, 0.5684676, -0.5172603, 1, 1, 1, 1, 1,
-0.2848179, 0.4086426, -1.964228, 1, 1, 1, 1, 1,
-0.284401, -1.238403, -2.80826, 1, 1, 1, 1, 1,
-0.2745295, -2.299828, -3.102695, 1, 1, 1, 1, 1,
-0.2715339, -0.196086, -1.95525, 1, 1, 1, 1, 1,
-0.271001, -1.357605, -3.029375, 1, 1, 1, 1, 1,
-0.2678685, -0.3454531, -0.5350298, 1, 1, 1, 1, 1,
-0.2675387, -0.2201195, -3.408323, 1, 1, 1, 1, 1,
-0.2665508, 0.2120298, -0.4226808, 1, 1, 1, 1, 1,
-0.2592532, 0.2669469, -0.5109387, 0, 0, 1, 1, 1,
-0.2582565, 1.598183, 1.291308, 1, 0, 0, 1, 1,
-0.257456, 3.653037, -0.7246168, 1, 0, 0, 1, 1,
-0.255164, 0.3010782, -1.853465, 1, 0, 0, 1, 1,
-0.252373, -0.4833314, -2.698591, 1, 0, 0, 1, 1,
-0.2507822, -0.622322, -2.516385, 1, 0, 0, 1, 1,
-0.2490709, 1.393059, -2.327478, 0, 0, 0, 1, 1,
-0.2444832, -0.6731964, -3.571148, 0, 0, 0, 1, 1,
-0.2426373, -0.06327835, -2.617582, 0, 0, 0, 1, 1,
-0.2424983, -0.2768059, -2.720987, 0, 0, 0, 1, 1,
-0.2349051, 0.342261, 0.2459101, 0, 0, 0, 1, 1,
-0.2347804, 2.454341, 0.8019172, 0, 0, 0, 1, 1,
-0.2283977, 1.208974, 1.528335, 0, 0, 0, 1, 1,
-0.225269, 0.4777569, -0.9894726, 1, 1, 1, 1, 1,
-0.2243131, -1.867501, -3.927449, 1, 1, 1, 1, 1,
-0.2194701, 0.20825, -0.164122, 1, 1, 1, 1, 1,
-0.2164992, 0.2732499, -0.126089, 1, 1, 1, 1, 1,
-0.2148148, -1.043407, -2.910613, 1, 1, 1, 1, 1,
-0.2104161, 1.181025, 0.2303372, 1, 1, 1, 1, 1,
-0.2102958, -0.6780664, -3.889692, 1, 1, 1, 1, 1,
-0.2055646, 0.6943308, 0.3181514, 1, 1, 1, 1, 1,
-0.205335, 0.3596738, -0.674816, 1, 1, 1, 1, 1,
-0.2034823, 0.270521, -2.265382, 1, 1, 1, 1, 1,
-0.2024036, -0.6653324, -1.640595, 1, 1, 1, 1, 1,
-0.2010866, 0.4136811, -0.2384623, 1, 1, 1, 1, 1,
-0.1988717, 1.576878, 0.354525, 1, 1, 1, 1, 1,
-0.1981009, 0.2157064, -1.200764, 1, 1, 1, 1, 1,
-0.1940067, -0.239694, -3.439732, 1, 1, 1, 1, 1,
-0.1926607, 0.6365778, -1.593048, 0, 0, 1, 1, 1,
-0.191463, 0.8879405, -1.951958, 1, 0, 0, 1, 1,
-0.1887509, -0.8654931, -1.336332, 1, 0, 0, 1, 1,
-0.1865567, 0.7511066, -1.916831, 1, 0, 0, 1, 1,
-0.1856492, 1.447184, 2.115391, 1, 0, 0, 1, 1,
-0.1824485, -1.634355, -3.26371, 1, 0, 0, 1, 1,
-0.1805741, -0.7263026, -2.796282, 0, 0, 0, 1, 1,
-0.1779094, 0.4083967, -1.432038, 0, 0, 0, 1, 1,
-0.1774555, -0.9428971, -2.564723, 0, 0, 0, 1, 1,
-0.1767372, 1.576679, -2.305952, 0, 0, 0, 1, 1,
-0.1741211, 1.749146, 1.732566, 0, 0, 0, 1, 1,
-0.1624308, -1.034212, -2.893583, 0, 0, 0, 1, 1,
-0.1612874, -0.8634073, -2.544518, 0, 0, 0, 1, 1,
-0.1496117, -1.358197, -3.060181, 1, 1, 1, 1, 1,
-0.1461353, -1.302724, -2.866575, 1, 1, 1, 1, 1,
-0.1450382, 0.7466123, -1.46437, 1, 1, 1, 1, 1,
-0.140526, -1.271811, -2.374887, 1, 1, 1, 1, 1,
-0.1397058, -0.1175958, -3.280156, 1, 1, 1, 1, 1,
-0.1379687, 1.536519, 0.8753004, 1, 1, 1, 1, 1,
-0.1373479, 0.4946003, 0.09121908, 1, 1, 1, 1, 1,
-0.1336263, -0.4291466, -2.786757, 1, 1, 1, 1, 1,
-0.1336262, -0.6986437, -2.172438, 1, 1, 1, 1, 1,
-0.1325662, -0.9854946, -1.965891, 1, 1, 1, 1, 1,
-0.1296803, 0.5052563, -1.497844, 1, 1, 1, 1, 1,
-0.1263007, -0.1631533, -2.041486, 1, 1, 1, 1, 1,
-0.1249634, 0.1503656, -1.261969, 1, 1, 1, 1, 1,
-0.1228945, 1.431533, 0.07391599, 1, 1, 1, 1, 1,
-0.1136608, -0.2746882, -2.145063, 1, 1, 1, 1, 1,
-0.1133053, 0.4025679, -0.9501508, 0, 0, 1, 1, 1,
-0.1122657, 0.8876165, -0.2142836, 1, 0, 0, 1, 1,
-0.1119125, -0.9989146, -5.206579, 1, 0, 0, 1, 1,
-0.1077834, 0.0451646, -0.7742284, 1, 0, 0, 1, 1,
-0.1066509, -2.374581, -1.952275, 1, 0, 0, 1, 1,
-0.104309, -0.8155019, -2.048616, 1, 0, 0, 1, 1,
-0.1021086, 1.749776, 1.66848, 0, 0, 0, 1, 1,
-0.1006601, 1.971286, -1.656091, 0, 0, 0, 1, 1,
-0.1004791, -0.7041605, -1.132335, 0, 0, 0, 1, 1,
-0.09824844, -1.416991, -2.695836, 0, 0, 0, 1, 1,
-0.09633094, 0.4017447, 0.1366465, 0, 0, 0, 1, 1,
-0.09069654, -0.004295551, -2.54833, 0, 0, 0, 1, 1,
-0.0904358, 0.6494614, 0.2059178, 0, 0, 0, 1, 1,
-0.08916401, 0.1476584, -0.7838379, 1, 1, 1, 1, 1,
-0.08598196, -0.5161108, -3.774664, 1, 1, 1, 1, 1,
-0.08494636, -1.984942, -2.853675, 1, 1, 1, 1, 1,
-0.07648504, 0.1891334, -0.3574818, 1, 1, 1, 1, 1,
-0.07109009, -0.667994, -2.898706, 1, 1, 1, 1, 1,
-0.06850927, 1.299766, 0.04730945, 1, 1, 1, 1, 1,
-0.06665074, 1.103767, 0.8573793, 1, 1, 1, 1, 1,
-0.06423459, -0.4472948, -3.55717, 1, 1, 1, 1, 1,
-0.05984149, -0.666018, -2.162081, 1, 1, 1, 1, 1,
-0.05911945, 1.046493, 1.156919, 1, 1, 1, 1, 1,
-0.05896181, -0.6511261, -1.705902, 1, 1, 1, 1, 1,
-0.05537997, 0.38915, 1.701409, 1, 1, 1, 1, 1,
-0.05462729, 1.359587, 1.591708, 1, 1, 1, 1, 1,
-0.05385926, -1.272471, -3.779927, 1, 1, 1, 1, 1,
-0.05366204, 0.04188425, -2.258571, 1, 1, 1, 1, 1,
-0.05048723, 0.9853259, 0.8845073, 0, 0, 1, 1, 1,
-0.04828477, -0.02514482, -3.168165, 1, 0, 0, 1, 1,
-0.04822042, 1.342484, -0.7197356, 1, 0, 0, 1, 1,
-0.04497178, 1.222903, -0.6983745, 1, 0, 0, 1, 1,
-0.04183835, -0.8269691, -3.120695, 1, 0, 0, 1, 1,
-0.04159191, 1.260708, 0.8079972, 1, 0, 0, 1, 1,
-0.03728904, 0.7924536, -0.08508773, 0, 0, 0, 1, 1,
-0.03578245, -1.287499, -2.637427, 0, 0, 0, 1, 1,
-0.03437629, 1.795259, 0.8113073, 0, 0, 0, 1, 1,
-0.03165387, -0.3334474, -2.470702, 0, 0, 0, 1, 1,
-0.03150456, 0.05999806, -0.7303753, 0, 0, 0, 1, 1,
-0.03126463, -0.6401108, -1.723405, 0, 0, 0, 1, 1,
-0.03107231, 0.5107212, -0.6458836, 0, 0, 0, 1, 1,
-0.0308194, 0.1748914, 0.7154735, 1, 1, 1, 1, 1,
-0.0263226, 1.346361, -1.570292, 1, 1, 1, 1, 1,
-0.0246565, -0.7562825, -2.809557, 1, 1, 1, 1, 1,
-0.01877063, -0.3732812, -4.237278, 1, 1, 1, 1, 1,
-0.01597079, -2.454801, -2.387021, 1, 1, 1, 1, 1,
-0.01589665, 0.06845116, -0.4064722, 1, 1, 1, 1, 1,
-0.01107213, -0.1082887, -1.062063, 1, 1, 1, 1, 1,
-0.009505998, 1.443581, -0.7090569, 1, 1, 1, 1, 1,
-0.007886614, -0.190064, -2.597828, 1, 1, 1, 1, 1,
0.0003275397, -1.448103, 3.371955, 1, 1, 1, 1, 1,
0.000481151, 0.8805344, -1.165556, 1, 1, 1, 1, 1,
0.001999128, -1.014462, 1.528821, 1, 1, 1, 1, 1,
0.006820514, 0.3893853, 0.5378335, 1, 1, 1, 1, 1,
0.007520079, -1.282095, 3.647481, 1, 1, 1, 1, 1,
0.008105276, -0.157333, 4.252765, 1, 1, 1, 1, 1,
0.01026683, 1.693433, -0.7985486, 0, 0, 1, 1, 1,
0.01607513, -0.74819, 3.740395, 1, 0, 0, 1, 1,
0.01824029, 0.02742259, -0.110343, 1, 0, 0, 1, 1,
0.02051198, -1.669704, 1.91084, 1, 0, 0, 1, 1,
0.02063328, -0.5017966, 2.699111, 1, 0, 0, 1, 1,
0.02220701, -0.4907161, 5.505229, 1, 0, 0, 1, 1,
0.024336, -0.266075, 2.682641, 0, 0, 0, 1, 1,
0.03005904, -0.107503, 1.938913, 0, 0, 0, 1, 1,
0.03113402, 0.8178154, -0.03201066, 0, 0, 0, 1, 1,
0.03135419, 0.5432649, -0.6898755, 0, 0, 0, 1, 1,
0.03203467, -0.05465277, 1.846633, 0, 0, 0, 1, 1,
0.03767264, -2.217058, 3.684398, 0, 0, 0, 1, 1,
0.03897167, -0.7760331, 3.77513, 0, 0, 0, 1, 1,
0.04305382, -1.052613, 3.121151, 1, 1, 1, 1, 1,
0.04856482, -0.427271, 3.571091, 1, 1, 1, 1, 1,
0.04917816, -1.435525, 3.171353, 1, 1, 1, 1, 1,
0.0518358, -0.8477535, 1.237, 1, 1, 1, 1, 1,
0.05309322, 0.2282416, 0.6990431, 1, 1, 1, 1, 1,
0.06021372, 1.029255, 0.2141736, 1, 1, 1, 1, 1,
0.06053497, -0.03366826, 1.521903, 1, 1, 1, 1, 1,
0.06394367, 0.2788682, -1.332628, 1, 1, 1, 1, 1,
0.06832514, 1.034563, 0.1028331, 1, 1, 1, 1, 1,
0.06899528, -0.005851603, 1.163649, 1, 1, 1, 1, 1,
0.07082742, -0.7362632, 1.615577, 1, 1, 1, 1, 1,
0.07488392, -0.02307801, 2.556581, 1, 1, 1, 1, 1,
0.0749058, 0.2629093, -0.1963305, 1, 1, 1, 1, 1,
0.07689728, -0.6822253, 2.43376, 1, 1, 1, 1, 1,
0.07780679, -0.5318197, 4.114318, 1, 1, 1, 1, 1,
0.07849847, 1.017497, 0.9183282, 0, 0, 1, 1, 1,
0.07961661, 1.33014, 0.9685059, 1, 0, 0, 1, 1,
0.08601566, -0.4135264, 5.377689, 1, 0, 0, 1, 1,
0.08640535, 0.2270617, 0.3369453, 1, 0, 0, 1, 1,
0.08767621, -0.6617515, 3.095566, 1, 0, 0, 1, 1,
0.09347299, -0.2936595, 3.115328, 1, 0, 0, 1, 1,
0.09732462, -0.3282309, 3.699775, 0, 0, 0, 1, 1,
0.102214, -0.8484633, 3.005462, 0, 0, 0, 1, 1,
0.1046168, 1.066348, -0.06059255, 0, 0, 0, 1, 1,
0.1058056, -0.5743989, 2.561632, 0, 0, 0, 1, 1,
0.1064845, -0.4487116, 2.960522, 0, 0, 0, 1, 1,
0.1074996, 1.514779, 0.008540841, 0, 0, 0, 1, 1,
0.108715, -0.5865291, 2.604706, 0, 0, 0, 1, 1,
0.112831, -1.958337, 2.105535, 1, 1, 1, 1, 1,
0.1150573, -0.4144601, 2.534618, 1, 1, 1, 1, 1,
0.1156978, 0.7830582, -0.322156, 1, 1, 1, 1, 1,
0.1157335, -0.4951632, 3.497662, 1, 1, 1, 1, 1,
0.1165439, -1.587774, 3.301562, 1, 1, 1, 1, 1,
0.1215405, -0.4884422, 4.162371, 1, 1, 1, 1, 1,
0.1242028, -1.538715, 4.261726, 1, 1, 1, 1, 1,
0.1259205, 0.7953027, 0.3653511, 1, 1, 1, 1, 1,
0.1263507, 0.2011886, 0.08532941, 1, 1, 1, 1, 1,
0.1277025, -1.821897, 1.998495, 1, 1, 1, 1, 1,
0.1291966, 1.785723, 0.5923452, 1, 1, 1, 1, 1,
0.1316309, -0.8024512, 4.460472, 1, 1, 1, 1, 1,
0.1322885, 1.440807, -0.9489539, 1, 1, 1, 1, 1,
0.1338608, 0.2762684, 0.7617525, 1, 1, 1, 1, 1,
0.1362737, -1.174033, 3.516818, 1, 1, 1, 1, 1,
0.139335, -0.1365576, 2.753843, 0, 0, 1, 1, 1,
0.1405745, -2.098282, 3.209318, 1, 0, 0, 1, 1,
0.1424364, -0.481058, 3.510834, 1, 0, 0, 1, 1,
0.1437454, 0.7337958, 1.197251, 1, 0, 0, 1, 1,
0.144393, -0.8106564, 2.957589, 1, 0, 0, 1, 1,
0.148019, 0.9189172, -0.2348314, 1, 0, 0, 1, 1,
0.1537991, -0.8738139, 3.300315, 0, 0, 0, 1, 1,
0.1551622, -0.1776795, 4.051775, 0, 0, 0, 1, 1,
0.157486, -0.8281286, 3.496766, 0, 0, 0, 1, 1,
0.1575717, 1.463144, -1.018054, 0, 0, 0, 1, 1,
0.1631979, -0.4823781, 3.643199, 0, 0, 0, 1, 1,
0.1654755, -0.1200257, 1.481207, 0, 0, 0, 1, 1,
0.168105, -0.1600562, 1.357287, 0, 0, 0, 1, 1,
0.1739181, -0.5218947, 2.882284, 1, 1, 1, 1, 1,
0.1747151, 0.108831, -0.8542789, 1, 1, 1, 1, 1,
0.1820457, 1.709102, 0.499647, 1, 1, 1, 1, 1,
0.1876891, 0.5068687, -1.490839, 1, 1, 1, 1, 1,
0.1877239, -0.3513101, 2.879452, 1, 1, 1, 1, 1,
0.1882302, -0.5317994, 1.443788, 1, 1, 1, 1, 1,
0.1898963, -0.9964197, 2.160263, 1, 1, 1, 1, 1,
0.1935163, -0.6793214, 3.433002, 1, 1, 1, 1, 1,
0.1936606, 0.3324365, 1.438078, 1, 1, 1, 1, 1,
0.1945197, 0.3811077, 0.0618282, 1, 1, 1, 1, 1,
0.1963943, -2.228468, 3.694002, 1, 1, 1, 1, 1,
0.1968912, -0.03319661, 1.651462, 1, 1, 1, 1, 1,
0.2041649, -1.776077, 4.357144, 1, 1, 1, 1, 1,
0.2072552, 0.5547472, -0.8289162, 1, 1, 1, 1, 1,
0.2077198, -1.337605, 4.406253, 1, 1, 1, 1, 1,
0.2149415, -0.5004715, 2.762935, 0, 0, 1, 1, 1,
0.2179479, -0.5343621, 3.596645, 1, 0, 0, 1, 1,
0.2197404, -1.651871, 3.337969, 1, 0, 0, 1, 1,
0.2203359, 0.9771972, 2.022576, 1, 0, 0, 1, 1,
0.2203481, -0.7039853, 2.038119, 1, 0, 0, 1, 1,
0.2218248, -0.7839344, 2.650467, 1, 0, 0, 1, 1,
0.2221173, -1.066513, 3.786806, 0, 0, 0, 1, 1,
0.2232096, 2.085687, -0.02436993, 0, 0, 0, 1, 1,
0.2392184, -1.010896, 2.555941, 0, 0, 0, 1, 1,
0.241813, 1.915697, 0.9634494, 0, 0, 0, 1, 1,
0.2451187, -0.00716116, 1.095191, 0, 0, 0, 1, 1,
0.2482209, -1.365621, 0.9004089, 0, 0, 0, 1, 1,
0.2544632, -0.5942422, 4.071072, 0, 0, 0, 1, 1,
0.2564898, 1.130455, 0.5848017, 1, 1, 1, 1, 1,
0.2587441, -0.315707, 3.575679, 1, 1, 1, 1, 1,
0.2590346, 0.5556732, 0.406714, 1, 1, 1, 1, 1,
0.2612346, 0.1288859, 0.7418925, 1, 1, 1, 1, 1,
0.2643122, -1.086305, 1.780471, 1, 1, 1, 1, 1,
0.2672741, -0.3346649, 0.8076692, 1, 1, 1, 1, 1,
0.2721134, -0.353797, 2.750445, 1, 1, 1, 1, 1,
0.2738643, 0.02766573, 0.8693123, 1, 1, 1, 1, 1,
0.2744614, -0.01945985, 0.7850618, 1, 1, 1, 1, 1,
0.2770909, -0.1733005, 2.123805, 1, 1, 1, 1, 1,
0.2887252, -0.7129025, 1.206424, 1, 1, 1, 1, 1,
0.29083, -0.3477376, 1.741175, 1, 1, 1, 1, 1,
0.2920024, 0.3147088, 0.1942548, 1, 1, 1, 1, 1,
0.2922424, 0.2954399, 0.03991539, 1, 1, 1, 1, 1,
0.2955764, 1.698095, 0.1881764, 1, 1, 1, 1, 1,
0.2984878, -0.1777288, 1.498451, 0, 0, 1, 1, 1,
0.2992341, -3.007597, 1.97948, 1, 0, 0, 1, 1,
0.2999381, 0.3240457, 0.8702484, 1, 0, 0, 1, 1,
0.3000219, 1.721686, -1.815269, 1, 0, 0, 1, 1,
0.3023002, 1.615271, 1.761113, 1, 0, 0, 1, 1,
0.3087836, -0.1291625, 1.381947, 1, 0, 0, 1, 1,
0.3089492, 1.093052, -0.1509367, 0, 0, 0, 1, 1,
0.3119627, 0.4696142, 1.63122, 0, 0, 0, 1, 1,
0.3213092, -0.8477619, 2.280768, 0, 0, 0, 1, 1,
0.3240191, -0.5071086, 3.589093, 0, 0, 0, 1, 1,
0.3244846, 0.1415621, 1.667417, 0, 0, 0, 1, 1,
0.3274516, 0.556684, 2.134971, 0, 0, 0, 1, 1,
0.3292234, -1.86904, 2.626665, 0, 0, 0, 1, 1,
0.3360012, -0.6051139, 3.241394, 1, 1, 1, 1, 1,
0.3371659, -0.8976509, 3.816462, 1, 1, 1, 1, 1,
0.3413557, -0.8513845, 5.17599, 1, 1, 1, 1, 1,
0.3424166, 0.6730645, 2.066179, 1, 1, 1, 1, 1,
0.3466668, -0.04177427, 1.10985, 1, 1, 1, 1, 1,
0.3473453, -0.8181857, 2.39832, 1, 1, 1, 1, 1,
0.3489188, -1.074639, 1.433386, 1, 1, 1, 1, 1,
0.3563093, 0.2154205, 1.106739, 1, 1, 1, 1, 1,
0.3577518, 1.08965, -1.102935, 1, 1, 1, 1, 1,
0.3597583, -0.1476354, -0.9105356, 1, 1, 1, 1, 1,
0.3604238, 0.1607659, 2.481017, 1, 1, 1, 1, 1,
0.3609553, 0.4795094, -0.06727972, 1, 1, 1, 1, 1,
0.3633948, 0.5203652, 0.4106266, 1, 1, 1, 1, 1,
0.3655919, 1.456146, 0.2615857, 1, 1, 1, 1, 1,
0.3714991, -0.7367226, 3.164171, 1, 1, 1, 1, 1,
0.373438, -0.6298079, 3.299294, 0, 0, 1, 1, 1,
0.3779992, 0.895412, 1.536518, 1, 0, 0, 1, 1,
0.3797755, 0.4055552, 1.540733, 1, 0, 0, 1, 1,
0.3805684, -0.1181418, 1.914148, 1, 0, 0, 1, 1,
0.3810135, -0.04097292, 0.5437752, 1, 0, 0, 1, 1,
0.3823686, -1.685725, 2.806268, 1, 0, 0, 1, 1,
0.3826684, 1.835646, 1.175845, 0, 0, 0, 1, 1,
0.384238, -2.028614, 2.326753, 0, 0, 0, 1, 1,
0.3880773, 0.9408919, -0.162645, 0, 0, 0, 1, 1,
0.3885752, 0.5891839, 0.2033361, 0, 0, 0, 1, 1,
0.3895647, -0.02045496, 1.466494, 0, 0, 0, 1, 1,
0.3920073, -0.7436321, 2.610037, 0, 0, 0, 1, 1,
0.3998513, -0.5055305, 2.942153, 0, 0, 0, 1, 1,
0.4010896, -0.6670706, -0.1295957, 1, 1, 1, 1, 1,
0.4053147, 0.2925397, 1.102186, 1, 1, 1, 1, 1,
0.4072746, -0.6085752, 1.699493, 1, 1, 1, 1, 1,
0.4090267, 0.437756, 0.2016367, 1, 1, 1, 1, 1,
0.4144564, 2.446477, 0.4691063, 1, 1, 1, 1, 1,
0.4185452, 2.172855, 0.529318, 1, 1, 1, 1, 1,
0.4199114, 0.1400878, 1.120541, 1, 1, 1, 1, 1,
0.4248092, -1.121459, 2.186307, 1, 1, 1, 1, 1,
0.428137, 0.8972139, -0.6898953, 1, 1, 1, 1, 1,
0.4282726, -0.7062553, 2.684366, 1, 1, 1, 1, 1,
0.4365213, -1.596469, 2.379267, 1, 1, 1, 1, 1,
0.4383351, 0.04199504, -0.5459313, 1, 1, 1, 1, 1,
0.4442742, -0.1482301, 1.967921, 1, 1, 1, 1, 1,
0.4447218, 0.9478647, -1.291469, 1, 1, 1, 1, 1,
0.4462226, 0.3056844, -0.2854885, 1, 1, 1, 1, 1,
0.4495627, -0.1904253, 1.154142, 0, 0, 1, 1, 1,
0.4500497, -0.3643259, 2.962916, 1, 0, 0, 1, 1,
0.456612, -1.183602, 3.921007, 1, 0, 0, 1, 1,
0.4569367, -1.48932, 1.818306, 1, 0, 0, 1, 1,
0.4574709, -0.2197031, 3.294148, 1, 0, 0, 1, 1,
0.4604346, -0.5162938, -0.007731852, 1, 0, 0, 1, 1,
0.4621491, 0.06325538, 1.062208, 0, 0, 0, 1, 1,
0.4636151, -1.664225, 1.828347, 0, 0, 0, 1, 1,
0.4655667, 1.654271, 1.145692, 0, 0, 0, 1, 1,
0.4668414, 0.911364, 1.065193, 0, 0, 0, 1, 1,
0.4674867, 0.9534426, 1.796942, 0, 0, 0, 1, 1,
0.4679757, -0.6852559, 1.360666, 0, 0, 0, 1, 1,
0.4683762, -0.1774265, -0.9566305, 0, 0, 0, 1, 1,
0.4697087, -0.1277975, 0.4139977, 1, 1, 1, 1, 1,
0.4711588, 1.556013, -1.062362, 1, 1, 1, 1, 1,
0.4764476, 0.2466938, 1.260495, 1, 1, 1, 1, 1,
0.4787805, 0.392615, 1.354255, 1, 1, 1, 1, 1,
0.4846718, -0.6243053, 2.985453, 1, 1, 1, 1, 1,
0.4856014, -0.07555206, 0.7996952, 1, 1, 1, 1, 1,
0.486364, -0.825554, 3.263796, 1, 1, 1, 1, 1,
0.4912287, 2.247524, 0.2360315, 1, 1, 1, 1, 1,
0.4942232, 0.1533546, 1.920993, 1, 1, 1, 1, 1,
0.4947252, -1.960139, 2.4551, 1, 1, 1, 1, 1,
0.4982903, -0.2941536, 2.585307, 1, 1, 1, 1, 1,
0.5186933, 0.9973677, 0.1847811, 1, 1, 1, 1, 1,
0.5235986, -1.746954, 4.048112, 1, 1, 1, 1, 1,
0.5238979, -1.165454, 2.725516, 1, 1, 1, 1, 1,
0.5316638, -0.6931675, 5.075808, 1, 1, 1, 1, 1,
0.5334439, -0.2154333, 2.980142, 0, 0, 1, 1, 1,
0.5337927, 0.004355037, 3.242024, 1, 0, 0, 1, 1,
0.5410472, -1.033872, 3.193797, 1, 0, 0, 1, 1,
0.5441635, 0.7146663, 1.248577, 1, 0, 0, 1, 1,
0.544916, -0.1764114, 1.927708, 1, 0, 0, 1, 1,
0.5466685, 1.068089, 1.017354, 1, 0, 0, 1, 1,
0.5485123, 0.7020692, 1.357115, 0, 0, 0, 1, 1,
0.549311, 0.2492213, 0.5701161, 0, 0, 0, 1, 1,
0.550339, 1.678492, -0.090922, 0, 0, 0, 1, 1,
0.5525987, 0.6743017, 1.257011, 0, 0, 0, 1, 1,
0.5588036, -0.436917, 1.428711, 0, 0, 0, 1, 1,
0.5621783, 0.7127842, -0.1104251, 0, 0, 0, 1, 1,
0.5650522, -1.355481, 1.87536, 0, 0, 0, 1, 1,
0.5671376, -0.09430789, 2.744689, 1, 1, 1, 1, 1,
0.5691024, 0.9468544, 1.034228, 1, 1, 1, 1, 1,
0.5752583, 0.3841439, 0.4395865, 1, 1, 1, 1, 1,
0.5782601, -0.7304652, 3.726916, 1, 1, 1, 1, 1,
0.5825821, 0.45704, 1.326258, 1, 1, 1, 1, 1,
0.5838681, -0.265866, 1.844559, 1, 1, 1, 1, 1,
0.5840639, 0.713735, -1.095906, 1, 1, 1, 1, 1,
0.5855126, 1.148985, -0.2771896, 1, 1, 1, 1, 1,
0.5898474, -0.9875197, 2.070718, 1, 1, 1, 1, 1,
0.5948213, 0.09412622, 1.258334, 1, 1, 1, 1, 1,
0.5970097, -1.938384, 2.541197, 1, 1, 1, 1, 1,
0.6013461, 1.365163, 1.453281, 1, 1, 1, 1, 1,
0.6017821, 0.9294715, 1.88312, 1, 1, 1, 1, 1,
0.6100824, 1.782712, -1.573714, 1, 1, 1, 1, 1,
0.6110949, 1.35191, 0.4171222, 1, 1, 1, 1, 1,
0.6116394, 0.2109758, 1.583886, 0, 0, 1, 1, 1,
0.6133125, -1.84355, 4.085252, 1, 0, 0, 1, 1,
0.6150196, -0.3161792, 1.393431, 1, 0, 0, 1, 1,
0.6164297, 0.5461091, 1.68559, 1, 0, 0, 1, 1,
0.6164582, -0.2274657, 1.474157, 1, 0, 0, 1, 1,
0.6165211, -0.3069315, 0.444807, 1, 0, 0, 1, 1,
0.6195846, 0.3554454, -0.06113855, 0, 0, 0, 1, 1,
0.6204161, -1.100284, 2.024066, 0, 0, 0, 1, 1,
0.6225058, -0.5533527, 2.947628, 0, 0, 0, 1, 1,
0.6228762, 1.530576, 0.2242821, 0, 0, 0, 1, 1,
0.6242239, -0.3324451, 2.032915, 0, 0, 0, 1, 1,
0.6250102, 0.5966597, 0.837266, 0, 0, 0, 1, 1,
0.6284378, -0.6991104, 2.914869, 0, 0, 0, 1, 1,
0.6341652, 0.09244727, 2.110808, 1, 1, 1, 1, 1,
0.644663, 0.2640664, -0.08584367, 1, 1, 1, 1, 1,
0.6461921, 0.7614956, 0.6762627, 1, 1, 1, 1, 1,
0.648966, -0.9375843, 1.626527, 1, 1, 1, 1, 1,
0.6517429, 0.8896902, -0.09743055, 1, 1, 1, 1, 1,
0.6531329, -0.3638152, 2.943548, 1, 1, 1, 1, 1,
0.6558572, 0.6867122, 1.507456, 1, 1, 1, 1, 1,
0.6573231, 0.5160694, 2.411407, 1, 1, 1, 1, 1,
0.6588128, -1.064837, 1.897529, 1, 1, 1, 1, 1,
0.6623817, 0.9250104, 0.6465097, 1, 1, 1, 1, 1,
0.6705896, 2.057533, 1.01078, 1, 1, 1, 1, 1,
0.6757353, 0.8264312, 0.1968931, 1, 1, 1, 1, 1,
0.6772672, 1.602765, 0.1740057, 1, 1, 1, 1, 1,
0.6841959, -0.6928604, 5.337512, 1, 1, 1, 1, 1,
0.6844299, 0.5668805, 0.9213824, 1, 1, 1, 1, 1,
0.6852087, -2.215085, 3.702626, 0, 0, 1, 1, 1,
0.6868108, 0.6885102, -0.8426223, 1, 0, 0, 1, 1,
0.6876105, 1.744683, -0.6935172, 1, 0, 0, 1, 1,
0.6890861, 1.141017, 1.84283, 1, 0, 0, 1, 1,
0.6916527, -1.101906, 1.194589, 1, 0, 0, 1, 1,
0.6919281, 0.8880318, 0.0003293573, 1, 0, 0, 1, 1,
0.6943341, 0.8508494, 0.706403, 0, 0, 0, 1, 1,
0.6962574, 0.530252, 1.069527, 0, 0, 0, 1, 1,
0.697072, 0.7113972, 1.484324, 0, 0, 0, 1, 1,
0.6988643, -0.9881853, 2.285355, 0, 0, 0, 1, 1,
0.6996521, 0.2370539, 0.7619795, 0, 0, 0, 1, 1,
0.7024124, -0.1797276, 2.465984, 0, 0, 0, 1, 1,
0.7028611, 0.678328, 0.8408061, 0, 0, 0, 1, 1,
0.7114594, -0.5569664, 2.893484, 1, 1, 1, 1, 1,
0.7114893, -1.52874, 3.615328, 1, 1, 1, 1, 1,
0.730387, -1.178536, 2.85181, 1, 1, 1, 1, 1,
0.7356078, 0.08059809, 1.390128, 1, 1, 1, 1, 1,
0.7394907, 2.250296, 1.286789, 1, 1, 1, 1, 1,
0.7432812, -1.424253, 1.037231, 1, 1, 1, 1, 1,
0.7478566, -0.6602727, 2.226239, 1, 1, 1, 1, 1,
0.7502226, 0.856673, -0.5377071, 1, 1, 1, 1, 1,
0.7545905, 0.4316883, 1.246206, 1, 1, 1, 1, 1,
0.7590567, -0.03474896, 2.437097, 1, 1, 1, 1, 1,
0.7600849, 1.061621, -0.514496, 1, 1, 1, 1, 1,
0.7613808, 0.01988201, 2.039989, 1, 1, 1, 1, 1,
0.7616463, 0.03245221, 1.842032, 1, 1, 1, 1, 1,
0.7618897, 1.301676, 1.027514, 1, 1, 1, 1, 1,
0.7671409, 1.372341, 0.4417892, 1, 1, 1, 1, 1,
0.7739094, 0.7671703, -0.05884622, 0, 0, 1, 1, 1,
0.7784991, -1.163052, 1.879296, 1, 0, 0, 1, 1,
0.7785018, -0.1702927, 1.938778, 1, 0, 0, 1, 1,
0.7856256, 0.7497925, 1.744351, 1, 0, 0, 1, 1,
0.7883834, 1.671354, 1.313894, 1, 0, 0, 1, 1,
0.788771, 2.460842, 1.174659, 1, 0, 0, 1, 1,
0.7943447, 1.224047, 0.07421187, 0, 0, 0, 1, 1,
0.797006, 0.7374979, 0.5074957, 0, 0, 0, 1, 1,
0.8063032, 0.4900648, 0.9226337, 0, 0, 0, 1, 1,
0.8192424, 0.3044043, 0.8722222, 0, 0, 0, 1, 1,
0.8317254, 1.059284, -0.08224872, 0, 0, 0, 1, 1,
0.8353385, 1.051608, 0.6782109, 0, 0, 0, 1, 1,
0.8367388, -0.4770032, 2.22078, 0, 0, 0, 1, 1,
0.8444638, -0.361984, 1.667733, 1, 1, 1, 1, 1,
0.8547877, -0.6871647, 2.561587, 1, 1, 1, 1, 1,
0.8672528, 0.1765347, 0.5839751, 1, 1, 1, 1, 1,
0.8680138, -0.1119473, 1.682962, 1, 1, 1, 1, 1,
0.8693003, 0.7653236, 0.1409559, 1, 1, 1, 1, 1,
0.8735682, -1.692303, 3.533113, 1, 1, 1, 1, 1,
0.8743848, 0.966958, 0.2700289, 1, 1, 1, 1, 1,
0.8785096, -0.8494073, 3.889996, 1, 1, 1, 1, 1,
0.8847907, 0.1099265, 2.314795, 1, 1, 1, 1, 1,
0.8896164, 0.3930807, 1.678056, 1, 1, 1, 1, 1,
0.8914768, -0.5699126, 1.716898, 1, 1, 1, 1, 1,
0.8936538, 0.5089811, 1.923218, 1, 1, 1, 1, 1,
0.8980563, -0.8769907, 2.891163, 1, 1, 1, 1, 1,
0.8982366, -0.981115, 1.428092, 1, 1, 1, 1, 1,
0.8993344, 0.2570029, 1.456574, 1, 1, 1, 1, 1,
0.9000285, 1.420611, 0.9696272, 0, 0, 1, 1, 1,
0.9023026, 0.3462217, 2.138598, 1, 0, 0, 1, 1,
0.9024226, -0.4598846, 2.458319, 1, 0, 0, 1, 1,
0.9059024, 1.153639, -0.06906724, 1, 0, 0, 1, 1,
0.909781, 0.4796716, 1.948127, 1, 0, 0, 1, 1,
0.9105, -0.9121203, 3.278673, 1, 0, 0, 1, 1,
0.9147448, 0.6476667, 0.6448746, 0, 0, 0, 1, 1,
0.9373479, -1.912403, 2.110446, 0, 0, 0, 1, 1,
0.9403502, 0.1382599, 0.6255432, 0, 0, 0, 1, 1,
0.940574, -1.304163, 1.333186, 0, 0, 0, 1, 1,
0.9410785, 0.3154931, 1.951909, 0, 0, 0, 1, 1,
0.9497154, 1.239775, 0.3452363, 0, 0, 0, 1, 1,
0.9499425, -0.1424372, 3.92528, 0, 0, 0, 1, 1,
0.9594179, -2.519428, 2.959562, 1, 1, 1, 1, 1,
0.9605907, -0.1290998, 3.002588, 1, 1, 1, 1, 1,
0.9716063, 0.8500102, -0.04395312, 1, 1, 1, 1, 1,
0.9751651, -0.5031524, 2.947577, 1, 1, 1, 1, 1,
0.9775649, 3.151712, 1.880021, 1, 1, 1, 1, 1,
0.9900524, -0.5661123, 1.10206, 1, 1, 1, 1, 1,
0.9966093, 0.2545072, 0.719918, 1, 1, 1, 1, 1,
1.005867, 1.406481, 0.575782, 1, 1, 1, 1, 1,
1.018644, -0.2957344, 2.44702, 1, 1, 1, 1, 1,
1.021647, 0.1720508, 0.2296337, 1, 1, 1, 1, 1,
1.028265, -0.4102456, 2.885353, 1, 1, 1, 1, 1,
1.033221, -1.052817, 2.978501, 1, 1, 1, 1, 1,
1.037846, -0.203307, 1.553027, 1, 1, 1, 1, 1,
1.043003, -1.257742, 0.8260106, 1, 1, 1, 1, 1,
1.049662, 0.7841181, 1.422762, 1, 1, 1, 1, 1,
1.052506, -0.874757, 3.366759, 0, 0, 1, 1, 1,
1.053107, 0.120308, 1.5699, 1, 0, 0, 1, 1,
1.062954, 0.06748461, 1.559731, 1, 0, 0, 1, 1,
1.064336, 1.422027, 0.2327558, 1, 0, 0, 1, 1,
1.068433, 0.6829352, 0.2740273, 1, 0, 0, 1, 1,
1.073707, -1.530855, 2.769006, 1, 0, 0, 1, 1,
1.074587, -0.3203259, 1.730674, 0, 0, 0, 1, 1,
1.075316, 0.599749, 0.6232356, 0, 0, 0, 1, 1,
1.076286, 1.005736, 1.404695, 0, 0, 0, 1, 1,
1.079907, -1.294882, 2.52476, 0, 0, 0, 1, 1,
1.080237, -0.8317316, 3.651439, 0, 0, 0, 1, 1,
1.082515, 0.2017666, -0.6946954, 0, 0, 0, 1, 1,
1.085113, 1.969109, -1.809301, 0, 0, 0, 1, 1,
1.087805, 0.8879015, -0.2668823, 1, 1, 1, 1, 1,
1.091255, -0.07967902, 1.244264, 1, 1, 1, 1, 1,
1.091629, -0.01872636, 1.832466, 1, 1, 1, 1, 1,
1.094228, 0.3961103, 0.1698404, 1, 1, 1, 1, 1,
1.097667, -0.5074208, 2.751034, 1, 1, 1, 1, 1,
1.097867, 0.3143138, 2.35981, 1, 1, 1, 1, 1,
1.101408, -1.622122, 3.3943, 1, 1, 1, 1, 1,
1.107099, 0.479499, 2.508751, 1, 1, 1, 1, 1,
1.111647, 0.6229674, 1.923332, 1, 1, 1, 1, 1,
1.116556, 1.179734, 1.418168, 1, 1, 1, 1, 1,
1.11755, -0.9737814, 1.035954, 1, 1, 1, 1, 1,
1.122534, -1.910432, 0.8464229, 1, 1, 1, 1, 1,
1.138145, 0.1587192, 1.503029, 1, 1, 1, 1, 1,
1.142792, -1.860876, 3.101146, 1, 1, 1, 1, 1,
1.148652, -1.05602, 2.469607, 1, 1, 1, 1, 1,
1.150599, 1.845469, 2.030388, 0, 0, 1, 1, 1,
1.156475, -0.504712, 1.114885, 1, 0, 0, 1, 1,
1.158392, 0.5790641, 3.12795, 1, 0, 0, 1, 1,
1.163698, 0.2315216, 2.060573, 1, 0, 0, 1, 1,
1.172954, -2.634842, 2.253095, 1, 0, 0, 1, 1,
1.177906, -1.538642, 3.116722, 1, 0, 0, 1, 1,
1.179549, -0.6065713, 2.047232, 0, 0, 0, 1, 1,
1.181314, 0.3686047, 1.204138, 0, 0, 0, 1, 1,
1.185424, -0.01689618, 2.039006, 0, 0, 0, 1, 1,
1.194385, 0.5651186, 0.5482836, 0, 0, 0, 1, 1,
1.198076, 0.8782004, 1.534223, 0, 0, 0, 1, 1,
1.208256, 2.358516, -0.01764751, 0, 0, 0, 1, 1,
1.215643, 0.226245, 0.5092052, 0, 0, 0, 1, 1,
1.218453, 0.5277023, 0.8127052, 1, 1, 1, 1, 1,
1.224288, -0.8949714, 2.000082, 1, 1, 1, 1, 1,
1.228504, 0.1442823, 2.129286, 1, 1, 1, 1, 1,
1.230199, 1.40878, 0.6032106, 1, 1, 1, 1, 1,
1.232687, -1.408282, 2.782297, 1, 1, 1, 1, 1,
1.246729, -1.055485, 1.375176, 1, 1, 1, 1, 1,
1.248096, 0.5182748, 1.485667, 1, 1, 1, 1, 1,
1.262496, -0.5013489, 1.11299, 1, 1, 1, 1, 1,
1.267205, 0.6176518, 2.976337, 1, 1, 1, 1, 1,
1.269472, 1.040098, 2.064778, 1, 1, 1, 1, 1,
1.277453, 0.2858274, 0.8244941, 1, 1, 1, 1, 1,
1.281964, -0.2210129, 1.535834, 1, 1, 1, 1, 1,
1.305422, 0.1337036, 1.864302, 1, 1, 1, 1, 1,
1.308217, 0.3465929, 2.415296, 1, 1, 1, 1, 1,
1.308572, -0.0565793, 2.792785, 1, 1, 1, 1, 1,
1.310633, 1.575344, 0.8183051, 0, 0, 1, 1, 1,
1.310988, 1.539132, 1.513207, 1, 0, 0, 1, 1,
1.313423, 0.1149627, 1.37625, 1, 0, 0, 1, 1,
1.317476, -1.84736, 2.300257, 1, 0, 0, 1, 1,
1.323787, -0.163898, 2.205125, 1, 0, 0, 1, 1,
1.326881, -0.7445158, 0.4601941, 1, 0, 0, 1, 1,
1.330132, -0.7708841, 3.685943, 0, 0, 0, 1, 1,
1.330834, 0.7922684, 0.736004, 0, 0, 0, 1, 1,
1.334435, -0.7219871, 1.447971, 0, 0, 0, 1, 1,
1.340608, 1.205506, 0.0002512434, 0, 0, 0, 1, 1,
1.343539, -1.167414, 1.139302, 0, 0, 0, 1, 1,
1.353838, -1.891028, 0.8017315, 0, 0, 0, 1, 1,
1.358584, 0.01741199, 2.100463, 0, 0, 0, 1, 1,
1.365152, 0.4682757, 1.369137, 1, 1, 1, 1, 1,
1.376013, 0.3502073, 1.41723, 1, 1, 1, 1, 1,
1.401831, -0.5692255, 3.44812, 1, 1, 1, 1, 1,
1.4056, -0.3456087, 1.868016, 1, 1, 1, 1, 1,
1.408269, 0.2249126, 1.206658, 1, 1, 1, 1, 1,
1.410195, 0.06979412, -0.1480676, 1, 1, 1, 1, 1,
1.43282, 0.9817463, 0.2221297, 1, 1, 1, 1, 1,
1.446163, -1.463451, 4.566083, 1, 1, 1, 1, 1,
1.451013, -0.179453, 1.536374, 1, 1, 1, 1, 1,
1.453816, 1.729079, -0.5658213, 1, 1, 1, 1, 1,
1.454218, -1.137236, 1.983839, 1, 1, 1, 1, 1,
1.461328, 0.1649312, 0.2481529, 1, 1, 1, 1, 1,
1.474522, 2.278982, 2.541708, 1, 1, 1, 1, 1,
1.484674, 0.3646975, 1.492388, 1, 1, 1, 1, 1,
1.488181, 0.615446, 1.051373, 1, 1, 1, 1, 1,
1.505895, 0.3071043, 3.226197, 0, 0, 1, 1, 1,
1.525415, -1.075119, 2.097117, 1, 0, 0, 1, 1,
1.541724, -0.1044605, 1.816041, 1, 0, 0, 1, 1,
1.547663, -0.1457592, 2.396698, 1, 0, 0, 1, 1,
1.559233, 0.2791724, 1.555962, 1, 0, 0, 1, 1,
1.564796, 0.07665265, 1.559567, 1, 0, 0, 1, 1,
1.570837, -0.6199633, 1.456672, 0, 0, 0, 1, 1,
1.60423, 0.08324967, 3.235898, 0, 0, 0, 1, 1,
1.60692, 1.059736, 1.453017, 0, 0, 0, 1, 1,
1.610595, 0.02529783, 3.196168, 0, 0, 0, 1, 1,
1.614749, 0.2392974, 0.9138556, 0, 0, 0, 1, 1,
1.628708, -0.3562251, 0.5363098, 0, 0, 0, 1, 1,
1.630138, 0.8201293, 1.69616, 0, 0, 0, 1, 1,
1.642128, -1.155824, 1.515936, 1, 1, 1, 1, 1,
1.649697, -1.081233, 1.322082, 1, 1, 1, 1, 1,
1.651766, -0.7864558, 3.972723, 1, 1, 1, 1, 1,
1.653327, 0.01020749, 3.138189, 1, 1, 1, 1, 1,
1.659476, 1.874659, 0.1002453, 1, 1, 1, 1, 1,
1.661602, -1.060889, 1.047276, 1, 1, 1, 1, 1,
1.663944, -2.430455, 1.746941, 1, 1, 1, 1, 1,
1.668676, -0.836696, 1.717151, 1, 1, 1, 1, 1,
1.702707, 1.16969, 1.875898, 1, 1, 1, 1, 1,
1.71249, 1.677702, 1.003972, 1, 1, 1, 1, 1,
1.72169, -1.4895, 3.148005, 1, 1, 1, 1, 1,
1.722931, 1.693632, 0.06128095, 1, 1, 1, 1, 1,
1.752266, -1.292163, 2.243489, 1, 1, 1, 1, 1,
1.753571, -1.526629, 1.885593, 1, 1, 1, 1, 1,
1.760339, 1.0348, 0.8347603, 1, 1, 1, 1, 1,
1.761187, 1.279677, -0.7860178, 0, 0, 1, 1, 1,
1.762787, -0.0223515, 2.126523, 1, 0, 0, 1, 1,
1.7683, -1.562772, 2.11722, 1, 0, 0, 1, 1,
1.772243, 0.1421827, 1.695985, 1, 0, 0, 1, 1,
1.783977, 0.179706, 0.5218753, 1, 0, 0, 1, 1,
1.791524, 0.6925573, 2.082124, 1, 0, 0, 1, 1,
1.803038, 1.457466, 0.6308516, 0, 0, 0, 1, 1,
1.807165, -1.559823, 1.755221, 0, 0, 0, 1, 1,
1.820229, 0.3086121, 1.187929, 0, 0, 0, 1, 1,
1.82317, -0.5862731, 3.185166, 0, 0, 0, 1, 1,
1.876685, -1.576679, 4.026453, 0, 0, 0, 1, 1,
1.889119, -0.4942788, 2.093118, 0, 0, 0, 1, 1,
1.897475, 1.925326, -0.5630285, 0, 0, 0, 1, 1,
1.905795, -0.07663359, 2.401359, 1, 1, 1, 1, 1,
1.947165, 0.4690957, 1.436225, 1, 1, 1, 1, 1,
1.948385, -0.6258646, 1.601254, 1, 1, 1, 1, 1,
1.963654, 0.7090607, 0.4272257, 1, 1, 1, 1, 1,
1.990137, 0.4633588, 1.71308, 1, 1, 1, 1, 1,
2.002676, -0.8720037, 3.267902, 1, 1, 1, 1, 1,
2.011729, -0.2901357, 0.8206673, 1, 1, 1, 1, 1,
2.021384, 2.033705, 0.3347398, 1, 1, 1, 1, 1,
2.032801, 0.8440609, 0.8384978, 1, 1, 1, 1, 1,
2.039488, -0.9532216, 0.5054079, 1, 1, 1, 1, 1,
2.062763, -0.1691326, 1.195788, 1, 1, 1, 1, 1,
2.081063, -0.7726611, 2.603613, 1, 1, 1, 1, 1,
2.111494, 0.3535285, 0.09745832, 1, 1, 1, 1, 1,
2.130999, -0.1396489, 2.399869, 1, 1, 1, 1, 1,
2.143442, 0.4376186, 0.9519799, 1, 1, 1, 1, 1,
2.167667, -1.450364, 2.314753, 0, 0, 1, 1, 1,
2.17739, -0.01981537, 1.087066, 1, 0, 0, 1, 1,
2.189644, -0.4412653, 0.07556769, 1, 0, 0, 1, 1,
2.207204, -0.0872549, 2.045042, 1, 0, 0, 1, 1,
2.222525, -0.3596764, 1.433882, 1, 0, 0, 1, 1,
2.281969, 1.609209, 2.437087, 1, 0, 0, 1, 1,
2.297962, 0.6683885, 1.897019, 0, 0, 0, 1, 1,
2.349556, -0.3698443, 1.360013, 0, 0, 0, 1, 1,
2.361396, -1.517863, 1.944884, 0, 0, 0, 1, 1,
2.365167, 0.5940077, 1.900921, 0, 0, 0, 1, 1,
2.369888, 1.673244, 0.3411815, 0, 0, 0, 1, 1,
2.450257, -0.7553819, 0.8047503, 0, 0, 0, 1, 1,
2.452456, 0.07089447, 1.106254, 0, 0, 0, 1, 1,
2.453995, -0.13398, 1.627942, 1, 1, 1, 1, 1,
2.46224, -2.117292, 2.0172, 1, 1, 1, 1, 1,
2.46271, 0.05165634, -0.6493956, 1, 1, 1, 1, 1,
2.498703, 1.189815, 2.135394, 1, 1, 1, 1, 1,
2.579338, -0.4011949, 0.07057978, 1, 1, 1, 1, 1,
2.881325, -0.9029599, 1.787747, 1, 1, 1, 1, 1,
2.991067, 0.4621821, 1.554008, 1, 1, 1, 1, 1
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
var radius = 9.668592;
var distance = 33.96052;
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
mvMatrix.translate( 0.2643306, -0.3227198, -0.1493249 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.96052);
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
