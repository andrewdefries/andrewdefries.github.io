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
-2.629213, -0.5333893, -3.351565, 1, 0, 0, 1,
-2.604262, -0.08361484, -2.459529, 1, 0.007843138, 0, 1,
-2.510998, 0.1830095, -2.389018, 1, 0.01176471, 0, 1,
-2.438589, 0.9895531, -1.354472, 1, 0.01960784, 0, 1,
-2.394716, 0.931758, -0.6980715, 1, 0.02352941, 0, 1,
-2.335987, -1.260143, -0.9589821, 1, 0.03137255, 0, 1,
-2.270222, -0.3694809, -1.366841, 1, 0.03529412, 0, 1,
-2.248454, -0.1870997, -1.163424, 1, 0.04313726, 0, 1,
-2.126588, 1.641275, 0.01482985, 1, 0.04705882, 0, 1,
-2.10027, -0.7646028, -1.989585, 1, 0.05490196, 0, 1,
-2.008922, -0.5136644, -2.709553, 1, 0.05882353, 0, 1,
-1.956455, 0.1484285, -1.75069, 1, 0.06666667, 0, 1,
-1.948109, -1.721753, -3.572115, 1, 0.07058824, 0, 1,
-1.924921, -0.4621532, -0.9372774, 1, 0.07843138, 0, 1,
-1.921429, 0.7101623, -0.4637274, 1, 0.08235294, 0, 1,
-1.919591, 0.3477694, -2.475015, 1, 0.09019608, 0, 1,
-1.885008, 0.9837712, -0.6454155, 1, 0.09411765, 0, 1,
-1.882853, 0.1684082, -1.801645, 1, 0.1019608, 0, 1,
-1.863288, 0.5692292, -0.08782581, 1, 0.1098039, 0, 1,
-1.862915, 0.1746034, -0.2839821, 1, 0.1137255, 0, 1,
-1.861417, -0.3180763, -0.9608594, 1, 0.1215686, 0, 1,
-1.851779, 1.0659, -0.1717587, 1, 0.1254902, 0, 1,
-1.841741, 1.08466, -1.362697, 1, 0.1333333, 0, 1,
-1.839882, 0.7074547, -2.260669, 1, 0.1372549, 0, 1,
-1.816752, 0.9637538, -1.23122, 1, 0.145098, 0, 1,
-1.813354, 0.8079591, -3.268149, 1, 0.1490196, 0, 1,
-1.812786, -0.07519941, -1.534089, 1, 0.1568628, 0, 1,
-1.809871, 0.6362367, -2.745411, 1, 0.1607843, 0, 1,
-1.809489, 0.00854757, -1.192212, 1, 0.1686275, 0, 1,
-1.773653, 0.004476177, -1.905394, 1, 0.172549, 0, 1,
-1.770447, -0.5897185, -3.422788, 1, 0.1803922, 0, 1,
-1.757034, 1.606064, -0.7350109, 1, 0.1843137, 0, 1,
-1.754445, 0.6341701, -2.431605, 1, 0.1921569, 0, 1,
-1.728211, -0.532962, -2.104579, 1, 0.1960784, 0, 1,
-1.72452, -0.4558596, -1.966103, 1, 0.2039216, 0, 1,
-1.699572, 0.3973223, 0.3712523, 1, 0.2117647, 0, 1,
-1.691064, -0.1435305, -2.357044, 1, 0.2156863, 0, 1,
-1.684618, -0.4893939, -0.8254222, 1, 0.2235294, 0, 1,
-1.664463, 1.117576, -0.9197762, 1, 0.227451, 0, 1,
-1.65396, 0.3941641, -0.3076612, 1, 0.2352941, 0, 1,
-1.645348, -2.160911, -1.955633, 1, 0.2392157, 0, 1,
-1.626077, -1.387181, -1.542415, 1, 0.2470588, 0, 1,
-1.625362, 0.22641, 0.2107233, 1, 0.2509804, 0, 1,
-1.621935, 0.6102206, -1.047686, 1, 0.2588235, 0, 1,
-1.616514, 0.8826851, -1.469279, 1, 0.2627451, 0, 1,
-1.604374, 0.2005073, -0.2077777, 1, 0.2705882, 0, 1,
-1.589792, -2.117279, -1.837415, 1, 0.2745098, 0, 1,
-1.582764, 0.505939, -1.451538, 1, 0.282353, 0, 1,
-1.5516, -1.921861, -1.105479, 1, 0.2862745, 0, 1,
-1.543151, -0.8094624, -0.5416833, 1, 0.2941177, 0, 1,
-1.520139, 1.8743, -1.265058, 1, 0.3019608, 0, 1,
-1.519787, 0.05053297, -2.860717, 1, 0.3058824, 0, 1,
-1.519506, 0.8573349, -1.69493, 1, 0.3137255, 0, 1,
-1.518344, -0.1494665, -1.950371, 1, 0.3176471, 0, 1,
-1.510684, -2.331166, -2.326926, 1, 0.3254902, 0, 1,
-1.506057, -0.4480736, -0.5891373, 1, 0.3294118, 0, 1,
-1.501474, 1.29945, 0.184057, 1, 0.3372549, 0, 1,
-1.499927, -0.621088, -2.087292, 1, 0.3411765, 0, 1,
-1.477643, -1.021415, -1.209816, 1, 0.3490196, 0, 1,
-1.467577, 0.7656136, -1.227616, 1, 0.3529412, 0, 1,
-1.466019, 1.90015, 0.8545573, 1, 0.3607843, 0, 1,
-1.45316, 0.07435305, -0.9275297, 1, 0.3647059, 0, 1,
-1.444037, -1.702118, -2.257438, 1, 0.372549, 0, 1,
-1.442935, 1.731232, -1.646983, 1, 0.3764706, 0, 1,
-1.420776, -2.154519, -4.682667, 1, 0.3843137, 0, 1,
-1.419379, -0.7732469, -2.220484, 1, 0.3882353, 0, 1,
-1.37061, 0.2124174, -1.94843, 1, 0.3960784, 0, 1,
-1.350072, 0.8714674, -2.087916, 1, 0.4039216, 0, 1,
-1.348833, 0.7782217, 0.5334944, 1, 0.4078431, 0, 1,
-1.338741, 1.438536, 0.07431545, 1, 0.4156863, 0, 1,
-1.337531, 0.9272763, -0.537708, 1, 0.4196078, 0, 1,
-1.335087, 0.2328943, -0.8211988, 1, 0.427451, 0, 1,
-1.334099, -0.5321829, -1.916297, 1, 0.4313726, 0, 1,
-1.329752, 0.958985, -1.498794, 1, 0.4392157, 0, 1,
-1.325424, -1.024547, -3.854745, 1, 0.4431373, 0, 1,
-1.325008, -1.166102, -2.762668, 1, 0.4509804, 0, 1,
-1.32364, 1.184624, -1.412493, 1, 0.454902, 0, 1,
-1.307195, -0.7552894, -1.417092, 1, 0.4627451, 0, 1,
-1.306903, 0.4941748, -1.988655, 1, 0.4666667, 0, 1,
-1.3016, 0.2876219, -1.425993, 1, 0.4745098, 0, 1,
-1.292157, -2.639333, -1.061685, 1, 0.4784314, 0, 1,
-1.282546, 0.1863827, 1.079638, 1, 0.4862745, 0, 1,
-1.279632, -0.0877611, -0.7916391, 1, 0.4901961, 0, 1,
-1.26696, -0.5951413, -1.463195, 1, 0.4980392, 0, 1,
-1.263113, -0.546046, -3.03931, 1, 0.5058824, 0, 1,
-1.257177, -0.09905705, -2.510993, 1, 0.509804, 0, 1,
-1.254734, -0.1955386, -2.204284, 1, 0.5176471, 0, 1,
-1.251682, -0.2950456, -1.799547, 1, 0.5215687, 0, 1,
-1.23843, -0.3792003, -1.258606, 1, 0.5294118, 0, 1,
-1.237541, -1.240165, -2.072474, 1, 0.5333334, 0, 1,
-1.237283, 0.4549609, -2.552148, 1, 0.5411765, 0, 1,
-1.237172, 0.9784289, -0.7434393, 1, 0.5450981, 0, 1,
-1.227616, -0.3833228, -2.885369, 1, 0.5529412, 0, 1,
-1.225618, 0.2101024, 0.5846732, 1, 0.5568628, 0, 1,
-1.221386, 0.5297722, -0.458066, 1, 0.5647059, 0, 1,
-1.221048, 1.516719, -0.7489616, 1, 0.5686275, 0, 1,
-1.219848, 0.8969281, -2.510778, 1, 0.5764706, 0, 1,
-1.217242, -0.06442773, -0.744564, 1, 0.5803922, 0, 1,
-1.20544, -1.580188, -2.324505, 1, 0.5882353, 0, 1,
-1.194721, -0.3122612, -2.709133, 1, 0.5921569, 0, 1,
-1.184364, 0.9934286, -0.9793436, 1, 0.6, 0, 1,
-1.183786, 1.464086, 0.4451708, 1, 0.6078432, 0, 1,
-1.179265, 1.354055, 1.447302, 1, 0.6117647, 0, 1,
-1.175274, 0.4176011, -0.6024935, 1, 0.6196079, 0, 1,
-1.168736, -0.5758162, -0.6429901, 1, 0.6235294, 0, 1,
-1.163134, -0.4287215, -2.750018, 1, 0.6313726, 0, 1,
-1.160443, 0.2739294, -0.6966523, 1, 0.6352941, 0, 1,
-1.160181, 0.431866, -0.01871379, 1, 0.6431373, 0, 1,
-1.159784, -0.2275653, -1.595796, 1, 0.6470588, 0, 1,
-1.139038, 0.06713279, -1.828188, 1, 0.654902, 0, 1,
-1.135101, -1.19146, -1.873068, 1, 0.6588235, 0, 1,
-1.133851, -2.483841, -3.221528, 1, 0.6666667, 0, 1,
-1.129839, 0.9067864, 0.4895004, 1, 0.6705883, 0, 1,
-1.126533, -0.6115181, -2.296468, 1, 0.6784314, 0, 1,
-1.126397, 0.7060832, -0.7228654, 1, 0.682353, 0, 1,
-1.125082, -1.259912, -2.555698, 1, 0.6901961, 0, 1,
-1.123286, 1.08776, -1.024253, 1, 0.6941177, 0, 1,
-1.123227, -0.6343876, -1.027533, 1, 0.7019608, 0, 1,
-1.110207, 1.832038, -1.148653, 1, 0.7098039, 0, 1,
-1.110104, -0.02417828, -1.109023, 1, 0.7137255, 0, 1,
-1.109037, -0.8880698, -1.471847, 1, 0.7215686, 0, 1,
-1.098998, 0.5927699, -2.998157, 1, 0.7254902, 0, 1,
-1.097082, 1.325459, 0.3118016, 1, 0.7333333, 0, 1,
-1.094306, 0.3986647, -1.601477, 1, 0.7372549, 0, 1,
-1.080171, -1.619616, -1.895105, 1, 0.7450981, 0, 1,
-1.079808, -0.5264639, -2.850507, 1, 0.7490196, 0, 1,
-1.071092, 0.8000843, -1.928035, 1, 0.7568628, 0, 1,
-1.069806, -0.5572851, -0.963908, 1, 0.7607843, 0, 1,
-1.069806, -0.2825418, -1.072768, 1, 0.7686275, 0, 1,
-1.057253, 0.4315332, 0.02352887, 1, 0.772549, 0, 1,
-1.051381, 1.33636, -0.2938967, 1, 0.7803922, 0, 1,
-1.044348, 0.8446192, -0.4613986, 1, 0.7843137, 0, 1,
-1.033283, -0.05460794, 0.6669735, 1, 0.7921569, 0, 1,
-1.032886, -1.702674, -2.589041, 1, 0.7960784, 0, 1,
-1.03211, 0.2445409, -1.249342, 1, 0.8039216, 0, 1,
-1.029659, 0.5684903, -0.7829755, 1, 0.8117647, 0, 1,
-1.023348, 0.0349303, -1.440505, 1, 0.8156863, 0, 1,
-1.020644, -0.3569342, -1.646655, 1, 0.8235294, 0, 1,
-1.020564, -1.057296, -2.199053, 1, 0.827451, 0, 1,
-1.004354, 0.5164331, -2.079754, 1, 0.8352941, 0, 1,
-0.9922069, -0.407664, -2.072483, 1, 0.8392157, 0, 1,
-0.9888984, -0.4054466, -1.271542, 1, 0.8470588, 0, 1,
-0.988632, 0.1234873, -2.829273, 1, 0.8509804, 0, 1,
-0.9875621, -0.09940473, -0.3680077, 1, 0.8588235, 0, 1,
-0.978896, -0.4030903, -4.169608, 1, 0.8627451, 0, 1,
-0.9756615, 0.8759986, 0.04857666, 1, 0.8705882, 0, 1,
-0.9720788, -1.031065, -2.873749, 1, 0.8745098, 0, 1,
-0.9683318, 0.6272582, 0.7287549, 1, 0.8823529, 0, 1,
-0.964173, -2.687315, -4.267338, 1, 0.8862745, 0, 1,
-0.9545215, -0.6717311, -2.639544, 1, 0.8941177, 0, 1,
-0.9538203, -1.225227, -2.31396, 1, 0.8980392, 0, 1,
-0.9520998, -0.5732334, -0.8289855, 1, 0.9058824, 0, 1,
-0.9510372, -0.6093537, -2.975853, 1, 0.9137255, 0, 1,
-0.9472678, -0.06629005, -2.18813, 1, 0.9176471, 0, 1,
-0.9413658, 2.231524, -1.714834, 1, 0.9254902, 0, 1,
-0.9392538, 2.073115, -2.279078, 1, 0.9294118, 0, 1,
-0.9284037, 0.2254726, -1.279771, 1, 0.9372549, 0, 1,
-0.9259281, -0.4518492, -4.066792, 1, 0.9411765, 0, 1,
-0.9190453, 0.01158273, -0.06757176, 1, 0.9490196, 0, 1,
-0.9122457, -0.1245961, -4.287331, 1, 0.9529412, 0, 1,
-0.9102823, -0.03027478, -0.04785698, 1, 0.9607843, 0, 1,
-0.907137, 0.3906293, -1.053531, 1, 0.9647059, 0, 1,
-0.9055928, 0.7696195, -2.027848, 1, 0.972549, 0, 1,
-0.9022701, 0.5197176, 0.5735241, 1, 0.9764706, 0, 1,
-0.9020184, 1.178763, -0.6536152, 1, 0.9843137, 0, 1,
-0.8985047, 0.4560015, -1.718532, 1, 0.9882353, 0, 1,
-0.8946555, 0.2422095, -2.561786, 1, 0.9960784, 0, 1,
-0.8933616, -1.416606, -1.357004, 0.9960784, 1, 0, 1,
-0.8914691, 1.627425, -0.9909936, 0.9921569, 1, 0, 1,
-0.8894051, -0.8696691, -2.751769, 0.9843137, 1, 0, 1,
-0.8879625, 0.3433367, 0.606293, 0.9803922, 1, 0, 1,
-0.8854936, 0.7445989, -0.9180337, 0.972549, 1, 0, 1,
-0.8835242, 0.1702737, -2.077368, 0.9686275, 1, 0, 1,
-0.8792712, -0.4188774, -1.312892, 0.9607843, 1, 0, 1,
-0.8792506, -0.6473254, -0.5962207, 0.9568627, 1, 0, 1,
-0.8792232, -0.5007018, -2.524591, 0.9490196, 1, 0, 1,
-0.8782777, -0.1649598, -2.370639, 0.945098, 1, 0, 1,
-0.8746557, 0.989168, 0.8181449, 0.9372549, 1, 0, 1,
-0.8726119, -0.6602367, -2.4306, 0.9333333, 1, 0, 1,
-0.8717178, -0.9831336, -1.714342, 0.9254902, 1, 0, 1,
-0.8692538, -1.028319, -2.230605, 0.9215686, 1, 0, 1,
-0.8684705, -0.1158818, -1.843438, 0.9137255, 1, 0, 1,
-0.86842, -0.7723351, -2.495976, 0.9098039, 1, 0, 1,
-0.8665779, 0.8853313, -0.3303329, 0.9019608, 1, 0, 1,
-0.86557, -1.345279, -3.622776, 0.8941177, 1, 0, 1,
-0.8642679, 0.5289394, -1.516501, 0.8901961, 1, 0, 1,
-0.8601001, 0.9829714, -1.854582, 0.8823529, 1, 0, 1,
-0.8573683, 0.5680773, -1.312254, 0.8784314, 1, 0, 1,
-0.8556138, 1.00044, -0.8762287, 0.8705882, 1, 0, 1,
-0.8531056, 2.006299, -0.3252083, 0.8666667, 1, 0, 1,
-0.8396333, 1.661111, 1.667889, 0.8588235, 1, 0, 1,
-0.8362206, 1.661387, -0.4752843, 0.854902, 1, 0, 1,
-0.8348976, -0.9679413, -2.995646, 0.8470588, 1, 0, 1,
-0.8335863, 0.7476228, -0.2462545, 0.8431373, 1, 0, 1,
-0.8269452, 0.4449096, -1.244766, 0.8352941, 1, 0, 1,
-0.8211399, 0.6917593, 1.861984, 0.8313726, 1, 0, 1,
-0.818489, 0.8488547, -0.7406545, 0.8235294, 1, 0, 1,
-0.8148476, 1.390078, -0.3849106, 0.8196079, 1, 0, 1,
-0.8118603, -2.733672, -2.644664, 0.8117647, 1, 0, 1,
-0.8076059, -0.5142409, -1.24231, 0.8078431, 1, 0, 1,
-0.8065056, -0.8048559, -3.303701, 0.8, 1, 0, 1,
-0.8052418, 0.06377836, -3.699723, 0.7921569, 1, 0, 1,
-0.8032597, 0.8682112, -0.7193958, 0.7882353, 1, 0, 1,
-0.7929332, -0.4830226, -1.444534, 0.7803922, 1, 0, 1,
-0.7832988, 0.885601, -2.029515, 0.7764706, 1, 0, 1,
-0.782199, 0.04815525, -2.718936, 0.7686275, 1, 0, 1,
-0.7713524, 2.679124, 0.2437813, 0.7647059, 1, 0, 1,
-0.7690204, 0.4794126, -0.2405476, 0.7568628, 1, 0, 1,
-0.7667826, -1.41692, -3.408996, 0.7529412, 1, 0, 1,
-0.7658757, -1.388238, -0.08188358, 0.7450981, 1, 0, 1,
-0.750596, 1.443876, -1.783074, 0.7411765, 1, 0, 1,
-0.7475446, 0.6314518, -0.3783684, 0.7333333, 1, 0, 1,
-0.7454319, 0.3297808, -1.904352, 0.7294118, 1, 0, 1,
-0.7430212, 0.2793614, -0.8976714, 0.7215686, 1, 0, 1,
-0.7400846, 0.2305037, 0.231078, 0.7176471, 1, 0, 1,
-0.7398256, -0.7925309, -3.203403, 0.7098039, 1, 0, 1,
-0.7381729, 1.254079, -1.239562, 0.7058824, 1, 0, 1,
-0.7347927, 1.561379, -0.7399499, 0.6980392, 1, 0, 1,
-0.7324339, 0.7856846, -1.144151, 0.6901961, 1, 0, 1,
-0.7301754, 0.4157764, -1.993574, 0.6862745, 1, 0, 1,
-0.7244868, 0.6815326, -1.413774, 0.6784314, 1, 0, 1,
-0.7183337, -0.6297916, -2.109751, 0.6745098, 1, 0, 1,
-0.7175233, 0.3994539, -1.033379, 0.6666667, 1, 0, 1,
-0.7154443, -1.519729, -3.660063, 0.6627451, 1, 0, 1,
-0.7131777, 0.1924888, -1.536888, 0.654902, 1, 0, 1,
-0.7010894, -1.68572, -0.2021853, 0.6509804, 1, 0, 1,
-0.6994738, 0.1312541, -0.9003136, 0.6431373, 1, 0, 1,
-0.6989251, 0.007918734, 0.3153052, 0.6392157, 1, 0, 1,
-0.6967363, 0.2984442, 0.04311213, 0.6313726, 1, 0, 1,
-0.6897938, -1.826122, -1.137159, 0.627451, 1, 0, 1,
-0.684077, -1.119119, -0.4642754, 0.6196079, 1, 0, 1,
-0.6825988, -0.4854065, -1.663265, 0.6156863, 1, 0, 1,
-0.6755205, 0.1863531, -0.3519578, 0.6078432, 1, 0, 1,
-0.6736216, -0.09347512, -2.049726, 0.6039216, 1, 0, 1,
-0.6733269, 1.070921, 0.1294395, 0.5960785, 1, 0, 1,
-0.6720874, -0.35576, -2.68946, 0.5882353, 1, 0, 1,
-0.669381, 0.0346651, -0.9137161, 0.5843138, 1, 0, 1,
-0.6633688, -0.2201475, -2.294411, 0.5764706, 1, 0, 1,
-0.6586441, -1.753443, -3.074697, 0.572549, 1, 0, 1,
-0.6584477, -0.8330183, -2.161334, 0.5647059, 1, 0, 1,
-0.6562254, -1.267678, -1.777872, 0.5607843, 1, 0, 1,
-0.6528183, 0.4280198, -0.1781172, 0.5529412, 1, 0, 1,
-0.6521878, -0.5042562, -2.02253, 0.5490196, 1, 0, 1,
-0.6487825, -0.4728633, -1.759704, 0.5411765, 1, 0, 1,
-0.6482914, 0.1705887, -1.361216, 0.5372549, 1, 0, 1,
-0.6451873, -0.1130802, -2.794668, 0.5294118, 1, 0, 1,
-0.6320519, 0.5887768, -1.474548, 0.5254902, 1, 0, 1,
-0.6318707, 0.3771295, -2.653831, 0.5176471, 1, 0, 1,
-0.6313388, 0.3516199, -1.925881, 0.5137255, 1, 0, 1,
-0.6270909, -0.6306705, -2.558161, 0.5058824, 1, 0, 1,
-0.6260922, -0.614868, -1.728741, 0.5019608, 1, 0, 1,
-0.624779, 2.735053, -0.5845514, 0.4941176, 1, 0, 1,
-0.621214, -0.5699463, -1.668883, 0.4862745, 1, 0, 1,
-0.6158417, 0.7731274, -1.425797, 0.4823529, 1, 0, 1,
-0.6142955, -1.359822, -4.170072, 0.4745098, 1, 0, 1,
-0.6142879, 0.08324391, -2.726098, 0.4705882, 1, 0, 1,
-0.6142626, -2.158733, -1.325634, 0.4627451, 1, 0, 1,
-0.6125336, -0.1207354, -2.277257, 0.4588235, 1, 0, 1,
-0.6116418, -0.8744096, -2.751232, 0.4509804, 1, 0, 1,
-0.6043607, -0.3733771, -2.086175, 0.4470588, 1, 0, 1,
-0.6042606, -1.298099, -3.048229, 0.4392157, 1, 0, 1,
-0.603169, -1.505381, -2.935731, 0.4352941, 1, 0, 1,
-0.6021811, -0.36756, -1.959381, 0.427451, 1, 0, 1,
-0.6008129, -0.4868894, -2.570479, 0.4235294, 1, 0, 1,
-0.6004146, 1.323382, -1.819703, 0.4156863, 1, 0, 1,
-0.5954633, 0.1579351, -1.908886, 0.4117647, 1, 0, 1,
-0.5949708, -0.5448127, -2.560158, 0.4039216, 1, 0, 1,
-0.5838749, -0.6876008, -2.733325, 0.3960784, 1, 0, 1,
-0.579905, 0.8895041, -1.466829, 0.3921569, 1, 0, 1,
-0.5778476, 0.5754575, -1.034999, 0.3843137, 1, 0, 1,
-0.5763042, -1.656237, -3.026361, 0.3803922, 1, 0, 1,
-0.5728165, 0.9565571, 1.793191, 0.372549, 1, 0, 1,
-0.5700285, 0.4026766, -2.050429, 0.3686275, 1, 0, 1,
-0.5686389, 0.5238294, -1.641604, 0.3607843, 1, 0, 1,
-0.5642506, 0.5956299, -0.3589334, 0.3568628, 1, 0, 1,
-0.5632703, -0.9342732, -1.607361, 0.3490196, 1, 0, 1,
-0.5570987, 1.859139, -0.3461905, 0.345098, 1, 0, 1,
-0.5566685, -1.75463, -2.343498, 0.3372549, 1, 0, 1,
-0.5524929, -1.870244, -3.104019, 0.3333333, 1, 0, 1,
-0.5511375, 0.4989791, -0.1983626, 0.3254902, 1, 0, 1,
-0.5508715, 0.2240468, -2.526478, 0.3215686, 1, 0, 1,
-0.5453191, 0.2383364, 0.1089739, 0.3137255, 1, 0, 1,
-0.5453044, 0.2047208, 0.3526334, 0.3098039, 1, 0, 1,
-0.5437782, 0.8506761, 0.1486271, 0.3019608, 1, 0, 1,
-0.5420421, -0.7564029, -3.01436, 0.2941177, 1, 0, 1,
-0.5412988, -0.4903025, -2.45237, 0.2901961, 1, 0, 1,
-0.5396641, -2.510208, -3.242353, 0.282353, 1, 0, 1,
-0.538762, -0.5336192, -1.3909, 0.2784314, 1, 0, 1,
-0.535996, 1.398104, 0.1864322, 0.2705882, 1, 0, 1,
-0.5309393, 0.2920755, -1.162174, 0.2666667, 1, 0, 1,
-0.5226365, -0.783058, -3.969718, 0.2588235, 1, 0, 1,
-0.5217831, 0.6844165, -1.995515, 0.254902, 1, 0, 1,
-0.518892, -0.4924857, -2.379817, 0.2470588, 1, 0, 1,
-0.5168606, 0.9115041, -0.7578016, 0.2431373, 1, 0, 1,
-0.515494, -1.920841, -2.443533, 0.2352941, 1, 0, 1,
-0.5154929, -1.867637, -2.138541, 0.2313726, 1, 0, 1,
-0.5123016, 1.804527, -0.2396281, 0.2235294, 1, 0, 1,
-0.5109466, 0.9966832, -0.9185156, 0.2196078, 1, 0, 1,
-0.5075656, -0.481803, -2.536964, 0.2117647, 1, 0, 1,
-0.5047849, 0.647073, -2.234876, 0.2078431, 1, 0, 1,
-0.5016158, 1.159254, -1.436556, 0.2, 1, 0, 1,
-0.4996601, -0.51672, -1.045295, 0.1921569, 1, 0, 1,
-0.498659, 1.044082, -0.1466013, 0.1882353, 1, 0, 1,
-0.4973176, -0.5957714, -2.3469, 0.1803922, 1, 0, 1,
-0.4957815, -0.2918906, -4.141771, 0.1764706, 1, 0, 1,
-0.4881907, 0.5949816, -1.035229, 0.1686275, 1, 0, 1,
-0.4856951, -0.3283859, -3.712212, 0.1647059, 1, 0, 1,
-0.4840651, 0.5945322, -2.652145, 0.1568628, 1, 0, 1,
-0.4821028, -0.5483529, -4.160476, 0.1529412, 1, 0, 1,
-0.4749598, 0.4123563, 0.01951597, 0.145098, 1, 0, 1,
-0.4747178, 0.01176387, -1.543244, 0.1411765, 1, 0, 1,
-0.4698562, 0.6816322, 0.1190015, 0.1333333, 1, 0, 1,
-0.4694024, 0.1652109, -2.414907, 0.1294118, 1, 0, 1,
-0.4617994, 0.6334138, -0.7678499, 0.1215686, 1, 0, 1,
-0.456888, 0.1825164, -0.01436711, 0.1176471, 1, 0, 1,
-0.4543397, 0.9625797, 1.626806, 0.1098039, 1, 0, 1,
-0.4514392, 0.2079922, -0.5393165, 0.1058824, 1, 0, 1,
-0.4469714, -0.6699207, -2.422038, 0.09803922, 1, 0, 1,
-0.4423637, -1.118874, -2.721245, 0.09019608, 1, 0, 1,
-0.4377102, -1.375658, -0.8237891, 0.08627451, 1, 0, 1,
-0.4374079, -0.8358263, -3.440363, 0.07843138, 1, 0, 1,
-0.4367317, -0.3097548, -0.225638, 0.07450981, 1, 0, 1,
-0.436278, -1.006017, -2.198729, 0.06666667, 1, 0, 1,
-0.4359686, -0.8115327, -3.518783, 0.0627451, 1, 0, 1,
-0.4345217, -0.05207158, -2.677, 0.05490196, 1, 0, 1,
-0.4318253, -0.1205903, -4.059043, 0.05098039, 1, 0, 1,
-0.4286471, 1.283651, -0.7721025, 0.04313726, 1, 0, 1,
-0.4282544, -1.397552, -2.315151, 0.03921569, 1, 0, 1,
-0.4262519, 0.09084057, -1.332098, 0.03137255, 1, 0, 1,
-0.424801, -0.9785645, -2.431676, 0.02745098, 1, 0, 1,
-0.4229335, -0.3896475, -1.529594, 0.01960784, 1, 0, 1,
-0.4221512, -0.07213502, -1.148293, 0.01568628, 1, 0, 1,
-0.4215981, -0.3125883, -1.304453, 0.007843138, 1, 0, 1,
-0.4207163, 2.208885, 1.381749, 0.003921569, 1, 0, 1,
-0.419947, -1.416261, -3.702055, 0, 1, 0.003921569, 1,
-0.4191042, -0.8043293, -4.53327, 0, 1, 0.01176471, 1,
-0.4130558, -1.219595, -2.267706, 0, 1, 0.01568628, 1,
-0.4120446, 0.3851001, -0.7897277, 0, 1, 0.02352941, 1,
-0.4069097, -0.5322618, -2.341913, 0, 1, 0.02745098, 1,
-0.4064682, 1.122616, -0.7844326, 0, 1, 0.03529412, 1,
-0.4035587, -1.714257, -2.14386, 0, 1, 0.03921569, 1,
-0.4027942, -0.4862359, -0.5888995, 0, 1, 0.04705882, 1,
-0.3961571, -1.342258, -3.17965, 0, 1, 0.05098039, 1,
-0.3889436, -0.02300241, -1.391742, 0, 1, 0.05882353, 1,
-0.3839629, -0.03075996, -0.1231283, 0, 1, 0.0627451, 1,
-0.3832349, 0.8126482, -0.2323603, 0, 1, 0.07058824, 1,
-0.3822472, -0.1389146, -1.227707, 0, 1, 0.07450981, 1,
-0.3801955, -0.8087134, -4.786816, 0, 1, 0.08235294, 1,
-0.3790651, -0.8456386, -2.146042, 0, 1, 0.08627451, 1,
-0.3775451, 0.6069853, -1.993446, 0, 1, 0.09411765, 1,
-0.373849, 0.07645326, -0.9714498, 0, 1, 0.1019608, 1,
-0.3659953, -3.869654, -1.574667, 0, 1, 0.1058824, 1,
-0.3646456, 1.196713, 0.5927588, 0, 1, 0.1137255, 1,
-0.3639176, -0.1756954, -2.64123, 0, 1, 0.1176471, 1,
-0.3634208, 0.3643205, -0.3308147, 0, 1, 0.1254902, 1,
-0.3593995, -1.040178, -2.529159, 0, 1, 0.1294118, 1,
-0.3593326, -1.080038, -0.3311351, 0, 1, 0.1372549, 1,
-0.3529233, -0.6338059, -3.510741, 0, 1, 0.1411765, 1,
-0.3454746, 2.16349, -0.2904736, 0, 1, 0.1490196, 1,
-0.3405812, 1.129898, -2.19067, 0, 1, 0.1529412, 1,
-0.3401217, -0.746733, -3.300334, 0, 1, 0.1607843, 1,
-0.3396566, 0.2921391, -0.14919, 0, 1, 0.1647059, 1,
-0.3312329, -1.143509, -3.208153, 0, 1, 0.172549, 1,
-0.3308711, -0.1292152, -1.056741, 0, 1, 0.1764706, 1,
-0.3282087, -0.3198654, -1.392246, 0, 1, 0.1843137, 1,
-0.3266797, -0.5960602, -3.242064, 0, 1, 0.1882353, 1,
-0.3245121, -1.118626, -2.967815, 0, 1, 0.1960784, 1,
-0.3231063, -0.2987481, -1.052524, 0, 1, 0.2039216, 1,
-0.3204128, 1.308835, -0.0217838, 0, 1, 0.2078431, 1,
-0.3203045, -0.2395699, -0.9114439, 0, 1, 0.2156863, 1,
-0.31862, -0.1178875, -4.03526, 0, 1, 0.2196078, 1,
-0.317486, 1.938443, 1.160676, 0, 1, 0.227451, 1,
-0.3156589, -0.4198669, -2.408146, 0, 1, 0.2313726, 1,
-0.3134351, -1.894866, -2.075273, 0, 1, 0.2392157, 1,
-0.308723, 0.0518873, -1.621153, 0, 1, 0.2431373, 1,
-0.3013264, 1.132241, -1.183509, 0, 1, 0.2509804, 1,
-0.2998665, 0.7544494, -1.704466, 0, 1, 0.254902, 1,
-0.297927, -1.642083, -3.703109, 0, 1, 0.2627451, 1,
-0.2958549, -0.944748, -4.175052, 0, 1, 0.2666667, 1,
-0.2927504, 1.254947, -0.8251636, 0, 1, 0.2745098, 1,
-0.2872853, 0.4848612, -2.40978, 0, 1, 0.2784314, 1,
-0.2869919, -0.08922327, -0.8123563, 0, 1, 0.2862745, 1,
-0.2863185, -2.281765, -2.528364, 0, 1, 0.2901961, 1,
-0.2862991, -0.8648655, -0.4514388, 0, 1, 0.2980392, 1,
-0.2856895, 0.5319607, -0.6919692, 0, 1, 0.3058824, 1,
-0.2787766, -1.326026, -3.130082, 0, 1, 0.3098039, 1,
-0.2763355, -0.6775656, -3.32677, 0, 1, 0.3176471, 1,
-0.2702677, -0.6615056, -2.95684, 0, 1, 0.3215686, 1,
-0.25902, -1.356933, -3.278509, 0, 1, 0.3294118, 1,
-0.25306, -0.7449359, -1.946265, 0, 1, 0.3333333, 1,
-0.2528505, -0.4979986, -1.961875, 0, 1, 0.3411765, 1,
-0.2498399, -0.8510155, -1.643897, 0, 1, 0.345098, 1,
-0.2433861, 0.2836256, -0.9104582, 0, 1, 0.3529412, 1,
-0.2400793, 0.1465728, -1.173576, 0, 1, 0.3568628, 1,
-0.2394667, -0.439092, -1.313269, 0, 1, 0.3647059, 1,
-0.2315435, -1.390621, -3.034258, 0, 1, 0.3686275, 1,
-0.2170316, -0.1587074, -2.021397, 0, 1, 0.3764706, 1,
-0.213755, -0.850887, -2.52332, 0, 1, 0.3803922, 1,
-0.2136279, 0.8368926, -1.638923, 0, 1, 0.3882353, 1,
-0.2082267, -1.770812, -3.666981, 0, 1, 0.3921569, 1,
-0.2026233, 1.720971, -0.7663089, 0, 1, 0.4, 1,
-0.2007156, 0.1908181, 0.7555937, 0, 1, 0.4078431, 1,
-0.1965003, 0.8932248, 0.9743352, 0, 1, 0.4117647, 1,
-0.1927913, -0.288144, -4.259631, 0, 1, 0.4196078, 1,
-0.1856154, 1.501229, -0.8680134, 0, 1, 0.4235294, 1,
-0.1830546, -0.4982669, -3.378373, 0, 1, 0.4313726, 1,
-0.1819589, -0.5526903, -3.618777, 0, 1, 0.4352941, 1,
-0.1813034, 0.991726, 0.09726375, 0, 1, 0.4431373, 1,
-0.1765316, -0.2523317, -6.602368, 0, 1, 0.4470588, 1,
-0.1703159, 1.417867, 2.157946, 0, 1, 0.454902, 1,
-0.16903, 1.734979, 0.5826569, 0, 1, 0.4588235, 1,
-0.1672832, 1.897987, 0.2880831, 0, 1, 0.4666667, 1,
-0.1661589, -1.549039, -2.776337, 0, 1, 0.4705882, 1,
-0.1600095, -1.470678, -1.556509, 0, 1, 0.4784314, 1,
-0.152927, -1.9146, -3.29995, 0, 1, 0.4823529, 1,
-0.1511929, -0.3135723, -4.079394, 0, 1, 0.4901961, 1,
-0.1468539, 0.2140192, -1.142829, 0, 1, 0.4941176, 1,
-0.146503, -1.991857, -5.018095, 0, 1, 0.5019608, 1,
-0.1463171, 0.426207, -0.9400211, 0, 1, 0.509804, 1,
-0.1457255, -0.2872428, -4.313573, 0, 1, 0.5137255, 1,
-0.1429649, -0.11787, -1.753159, 0, 1, 0.5215687, 1,
-0.1417498, -0.09900022, -3.340254, 0, 1, 0.5254902, 1,
-0.1407793, -0.05864814, -1.284818, 0, 1, 0.5333334, 1,
-0.1391293, -0.311781, -3.950167, 0, 1, 0.5372549, 1,
-0.1388691, -0.3955955, -3.709523, 0, 1, 0.5450981, 1,
-0.1349915, 0.3004974, -0.3243129, 0, 1, 0.5490196, 1,
-0.1326087, -0.8063738, -2.374214, 0, 1, 0.5568628, 1,
-0.1325983, -1.375311, -4.250188, 0, 1, 0.5607843, 1,
-0.131312, 2.090172, 0.615384, 0, 1, 0.5686275, 1,
-0.131266, -0.6104075, -0.5131726, 0, 1, 0.572549, 1,
-0.1293561, 1.524782, 1.185164, 0, 1, 0.5803922, 1,
-0.1241627, -0.9623042, -2.178221, 0, 1, 0.5843138, 1,
-0.1224809, -0.1914936, -2.547717, 0, 1, 0.5921569, 1,
-0.1196337, 0.7386588, 0.1919873, 0, 1, 0.5960785, 1,
-0.118903, 0.1110032, -1.580155, 0, 1, 0.6039216, 1,
-0.1156684, 0.08987448, -1.669171, 0, 1, 0.6117647, 1,
-0.1147412, 0.5850366, 0.3464484, 0, 1, 0.6156863, 1,
-0.1140069, -1.207938, -4.728408, 0, 1, 0.6235294, 1,
-0.1131158, -1.475647, -3.118539, 0, 1, 0.627451, 1,
-0.1123029, -0.05114612, -2.092174, 0, 1, 0.6352941, 1,
-0.1049634, 0.46417, -0.8063316, 0, 1, 0.6392157, 1,
-0.1019356, 0.5992077, 1.04937, 0, 1, 0.6470588, 1,
-0.09907851, -1.027652, -1.64937, 0, 1, 0.6509804, 1,
-0.09498107, -1.23294, -2.716383, 0, 1, 0.6588235, 1,
-0.09222025, -0.8059306, -4.93926, 0, 1, 0.6627451, 1,
-0.09093501, -0.391568, -3.235948, 0, 1, 0.6705883, 1,
-0.09034061, -1.029266, -3.788145, 0, 1, 0.6745098, 1,
-0.09030473, -1.472359, -3.318872, 0, 1, 0.682353, 1,
-0.08829276, 1.084628, 1.052184, 0, 1, 0.6862745, 1,
-0.08731309, -0.2447062, -2.151942, 0, 1, 0.6941177, 1,
-0.08670993, -0.8619528, -3.134098, 0, 1, 0.7019608, 1,
-0.08520397, -0.4863511, -2.914698, 0, 1, 0.7058824, 1,
-0.08452614, -1.817515, -3.506684, 0, 1, 0.7137255, 1,
-0.08410562, 0.008042781, -2.313792, 0, 1, 0.7176471, 1,
-0.08349809, -1.260681, -4.395602, 0, 1, 0.7254902, 1,
-0.08162878, 0.4855341, 0.2883314, 0, 1, 0.7294118, 1,
-0.08151608, -1.504023, -1.787068, 0, 1, 0.7372549, 1,
-0.08052493, 0.1180551, 0.07962409, 0, 1, 0.7411765, 1,
-0.07934669, -0.8898497, -1.710062, 0, 1, 0.7490196, 1,
-0.07587889, 0.5517651, 0.9919679, 0, 1, 0.7529412, 1,
-0.07207399, -0.8312674, -3.994397, 0, 1, 0.7607843, 1,
-0.0712234, -0.9804797, -3.086279, 0, 1, 0.7647059, 1,
-0.07043461, 1.153447, 1.300667, 0, 1, 0.772549, 1,
-0.06837845, -1.334393, -2.248028, 0, 1, 0.7764706, 1,
-0.06749392, 0.8697895, -2.101196, 0, 1, 0.7843137, 1,
-0.06307164, 1.259456, -1.595912, 0, 1, 0.7882353, 1,
-0.0620222, -0.897406, -3.553899, 0, 1, 0.7960784, 1,
-0.05702256, -1.447761, -3.988316, 0, 1, 0.8039216, 1,
-0.05394709, 1.064767, -0.1631931, 0, 1, 0.8078431, 1,
-0.05078388, -0.888867, -2.553218, 0, 1, 0.8156863, 1,
-0.0475128, -0.05182686, -4.025633, 0, 1, 0.8196079, 1,
-0.04506114, -0.6645206, -3.634737, 0, 1, 0.827451, 1,
-0.04286854, -0.2268843, -4.181898, 0, 1, 0.8313726, 1,
-0.04219818, 1.324975, -1.179961, 0, 1, 0.8392157, 1,
-0.04187277, -0.7299601, -2.680411, 0, 1, 0.8431373, 1,
-0.03383308, 0.1934528, -0.720815, 0, 1, 0.8509804, 1,
-0.03360527, 0.1687856, -0.7523278, 0, 1, 0.854902, 1,
-0.0282646, -0.8945347, -3.135731, 0, 1, 0.8627451, 1,
-0.02806013, 1.221129, 1.090198, 0, 1, 0.8666667, 1,
-0.02725135, -0.390851, -3.399493, 0, 1, 0.8745098, 1,
-0.02334078, -0.3409299, -4.211493, 0, 1, 0.8784314, 1,
-0.02202485, -1.668078, -2.894542, 0, 1, 0.8862745, 1,
-0.01966512, 1.121023, 0.5153256, 0, 1, 0.8901961, 1,
-0.01848025, -2.350167, -4.370317, 0, 1, 0.8980392, 1,
-0.01808385, 0.8993747, 1.690877, 0, 1, 0.9058824, 1,
-0.01749124, -1.620633, -2.652491, 0, 1, 0.9098039, 1,
-0.01543432, -0.5385386, -1.291949, 0, 1, 0.9176471, 1,
-0.01492118, 1.708846, -0.3238932, 0, 1, 0.9215686, 1,
-0.008634731, 1.202467, 2.249848, 0, 1, 0.9294118, 1,
-0.002682973, 1.226378, -0.6778988, 0, 1, 0.9333333, 1,
0.002125963, 0.3293837, -1.938192, 0, 1, 0.9411765, 1,
0.002831965, 0.5276684, -0.7047557, 0, 1, 0.945098, 1,
0.004223383, 0.5169548, 1.272444, 0, 1, 0.9529412, 1,
0.01077348, 1.813136, 0.1338271, 0, 1, 0.9568627, 1,
0.01144514, -0.4733098, 3.974669, 0, 1, 0.9647059, 1,
0.01378062, -1.431356, 4.626931, 0, 1, 0.9686275, 1,
0.01578482, 0.2719779, -0.4256252, 0, 1, 0.9764706, 1,
0.02243359, -0.2628132, 2.152446, 0, 1, 0.9803922, 1,
0.02555319, 0.7096642, -0.7625515, 0, 1, 0.9882353, 1,
0.02555525, -1.202125, 1.975003, 0, 1, 0.9921569, 1,
0.0262842, -0.02818761, 2.288036, 0, 1, 1, 1,
0.02642783, 0.3851619, -0.06760207, 0, 0.9921569, 1, 1,
0.02900573, 0.1025098, 0.2274651, 0, 0.9882353, 1, 1,
0.03315505, -0.7087098, 3.819057, 0, 0.9803922, 1, 1,
0.03457838, -0.2710982, 3.017653, 0, 0.9764706, 1, 1,
0.03879414, 0.5525804, -0.6376713, 0, 0.9686275, 1, 1,
0.04680197, -1.22454, 2.173292, 0, 0.9647059, 1, 1,
0.05034302, -0.3245294, 4.253673, 0, 0.9568627, 1, 1,
0.06220073, -0.09713455, 1.950123, 0, 0.9529412, 1, 1,
0.0624533, -0.4568741, 0.1869902, 0, 0.945098, 1, 1,
0.06389297, -1.388136, 1.657204, 0, 0.9411765, 1, 1,
0.06507596, 1.948805, 1.007926, 0, 0.9333333, 1, 1,
0.06658787, 1.173798, 1.16425, 0, 0.9294118, 1, 1,
0.06968874, -0.03822273, 2.723523, 0, 0.9215686, 1, 1,
0.07047971, -1.503276, 2.225417, 0, 0.9176471, 1, 1,
0.07115693, 1.0106, -0.8595552, 0, 0.9098039, 1, 1,
0.07673603, 0.8853298, -1.101044, 0, 0.9058824, 1, 1,
0.07716289, 0.01405508, 2.998168, 0, 0.8980392, 1, 1,
0.07985125, -0.4691158, 2.126846, 0, 0.8901961, 1, 1,
0.09548164, 0.7596841, -1.859547, 0, 0.8862745, 1, 1,
0.1039598, -0.08366016, 1.628516, 0, 0.8784314, 1, 1,
0.1061381, -0.8779284, 2.178014, 0, 0.8745098, 1, 1,
0.1087929, 0.5462422, 0.9423775, 0, 0.8666667, 1, 1,
0.1099021, 0.9933394, -0.06843869, 0, 0.8627451, 1, 1,
0.1120581, -0.8031859, 3.386886, 0, 0.854902, 1, 1,
0.1129971, 1.305133, 2.102676, 0, 0.8509804, 1, 1,
0.1167229, 0.3108982, -0.1126341, 0, 0.8431373, 1, 1,
0.1202468, 0.23974, 1.471574, 0, 0.8392157, 1, 1,
0.1218712, 0.3139803, 0.7464033, 0, 0.8313726, 1, 1,
0.1275059, -0.01105123, 1.942542, 0, 0.827451, 1, 1,
0.128624, 1.228317, -0.1051707, 0, 0.8196079, 1, 1,
0.13393, -0.0910093, 2.481047, 0, 0.8156863, 1, 1,
0.136025, 0.3883176, 0.5210122, 0, 0.8078431, 1, 1,
0.139116, -2.958322, 2.809434, 0, 0.8039216, 1, 1,
0.1395655, 0.4718595, 1.217009, 0, 0.7960784, 1, 1,
0.1420825, 0.7116667, -0.4757782, 0, 0.7882353, 1, 1,
0.1435195, -0.1987953, 3.270872, 0, 0.7843137, 1, 1,
0.1455885, 0.1289533, 1.447438, 0, 0.7764706, 1, 1,
0.1482896, -0.765135, 1.804103, 0, 0.772549, 1, 1,
0.1568444, 0.3051689, 0.9345055, 0, 0.7647059, 1, 1,
0.1636941, -0.604015, 2.867701, 0, 0.7607843, 1, 1,
0.1660063, -0.8021278, 3.020962, 0, 0.7529412, 1, 1,
0.1693826, -0.3613429, 1.890518, 0, 0.7490196, 1, 1,
0.1717808, -0.8705534, 1.283286, 0, 0.7411765, 1, 1,
0.1740511, -0.1420164, 3.164102, 0, 0.7372549, 1, 1,
0.1782473, 1.102393, 0.01931298, 0, 0.7294118, 1, 1,
0.1783939, 0.6213242, -0.5479854, 0, 0.7254902, 1, 1,
0.1826093, -0.2714558, 2.243551, 0, 0.7176471, 1, 1,
0.1839455, -0.2253193, 3.162228, 0, 0.7137255, 1, 1,
0.1862956, -0.6101142, 2.269067, 0, 0.7058824, 1, 1,
0.1900854, 1.758093, 0.5146893, 0, 0.6980392, 1, 1,
0.1915144, -1.896653, 3.779208, 0, 0.6941177, 1, 1,
0.1918874, -1.858885, 5.810846, 0, 0.6862745, 1, 1,
0.1935326, -0.05990679, 1.696725, 0, 0.682353, 1, 1,
0.1936824, -2.189027, 5.016122, 0, 0.6745098, 1, 1,
0.1975985, -0.7070928, 3.274314, 0, 0.6705883, 1, 1,
0.2005343, -0.4073193, 2.639907, 0, 0.6627451, 1, 1,
0.2046715, 0.3024655, 1.724319, 0, 0.6588235, 1, 1,
0.2070658, 1.146957, 0.4223273, 0, 0.6509804, 1, 1,
0.2084736, 0.9124516, -0.4420103, 0, 0.6470588, 1, 1,
0.2090856, -1.337038, 3.847679, 0, 0.6392157, 1, 1,
0.2106981, 1.303304, -1.315653, 0, 0.6352941, 1, 1,
0.2120084, -0.4383847, 2.111151, 0, 0.627451, 1, 1,
0.2141347, -1.03641, 3.441137, 0, 0.6235294, 1, 1,
0.2170144, -0.3683411, 4.930312, 0, 0.6156863, 1, 1,
0.2180164, -0.123953, 3.794131, 0, 0.6117647, 1, 1,
0.2214475, 0.002790142, 1.213056, 0, 0.6039216, 1, 1,
0.224396, -2.983673, 3.985594, 0, 0.5960785, 1, 1,
0.2326851, 0.9728892, 0.3915143, 0, 0.5921569, 1, 1,
0.2328564, 0.2648774, 0.6096663, 0, 0.5843138, 1, 1,
0.2342165, -2.292552, 3.390101, 0, 0.5803922, 1, 1,
0.2367599, -0.2085831, 2.687218, 0, 0.572549, 1, 1,
0.2408468, -2.469941, 2.547081, 0, 0.5686275, 1, 1,
0.2430879, -0.5557826, 2.108094, 0, 0.5607843, 1, 1,
0.2541222, -0.08665676, 2.960994, 0, 0.5568628, 1, 1,
0.2543017, -0.2315664, 1.195875, 0, 0.5490196, 1, 1,
0.2551503, -0.07940537, 2.465768, 0, 0.5450981, 1, 1,
0.2652002, -0.8302138, 2.254407, 0, 0.5372549, 1, 1,
0.266721, -1.81647, 1.618525, 0, 0.5333334, 1, 1,
0.270999, -0.2146059, 3.288257, 0, 0.5254902, 1, 1,
0.271773, -0.3409066, 2.737672, 0, 0.5215687, 1, 1,
0.2726811, 0.5075378, 1.678333, 0, 0.5137255, 1, 1,
0.2770779, -0.8197981, 1.687698, 0, 0.509804, 1, 1,
0.2788976, 0.4938953, 1.238209, 0, 0.5019608, 1, 1,
0.2801156, 0.8598003, 1.540641, 0, 0.4941176, 1, 1,
0.2840947, 0.7072242, -0.4311115, 0, 0.4901961, 1, 1,
0.2866307, -0.1331586, 1.009112, 0, 0.4823529, 1, 1,
0.2885657, -0.7863734, 4.465876, 0, 0.4784314, 1, 1,
0.288606, 0.4391262, 0.3287004, 0, 0.4705882, 1, 1,
0.2938541, 0.1760401, 1.062477, 0, 0.4666667, 1, 1,
0.2968798, -1.867662, 2.846249, 0, 0.4588235, 1, 1,
0.2981486, 0.6416029, 0.03407531, 0, 0.454902, 1, 1,
0.2982975, -0.953868, 1.966555, 0, 0.4470588, 1, 1,
0.2989203, -0.1068599, 4.330921, 0, 0.4431373, 1, 1,
0.3026572, 1.225146, -0.1237953, 0, 0.4352941, 1, 1,
0.3043884, 0.3393849, 1.012794, 0, 0.4313726, 1, 1,
0.3053499, 0.04302874, 0.1407611, 0, 0.4235294, 1, 1,
0.3116251, -1.305532, 2.252919, 0, 0.4196078, 1, 1,
0.3119957, -0.2699708, 2.497816, 0, 0.4117647, 1, 1,
0.3138752, 1.488433, 0.2125526, 0, 0.4078431, 1, 1,
0.3145543, 1.095377, -1.23456, 0, 0.4, 1, 1,
0.3171011, -0.2095489, 3.621721, 0, 0.3921569, 1, 1,
0.3174949, 1.099146, -1.092758, 0, 0.3882353, 1, 1,
0.319187, 1.13882, -0.2711242, 0, 0.3803922, 1, 1,
0.3192233, 0.8206046, 0.04981532, 0, 0.3764706, 1, 1,
0.3263065, -0.926133, 2.001415, 0, 0.3686275, 1, 1,
0.3282738, -0.6590968, 2.238023, 0, 0.3647059, 1, 1,
0.3343984, 0.5374082, -0.06535, 0, 0.3568628, 1, 1,
0.3398041, -0.2317786, 2.674169, 0, 0.3529412, 1, 1,
0.3416028, 0.6947616, -0.5014505, 0, 0.345098, 1, 1,
0.3540304, 1.181607, -0.2150659, 0, 0.3411765, 1, 1,
0.354782, 1.387618, -0.2183627, 0, 0.3333333, 1, 1,
0.3573607, -0.4109969, 3.072287, 0, 0.3294118, 1, 1,
0.3592657, -0.1013873, 3.490459, 0, 0.3215686, 1, 1,
0.3601379, 0.5185418, -0.408445, 0, 0.3176471, 1, 1,
0.3687418, -0.321116, 3.93099, 0, 0.3098039, 1, 1,
0.3690782, -0.5021416, 2.834695, 0, 0.3058824, 1, 1,
0.3752876, 1.514311, 0.797852, 0, 0.2980392, 1, 1,
0.375368, -0.5080092, 2.53724, 0, 0.2901961, 1, 1,
0.3795309, 0.8581703, 1.986217, 0, 0.2862745, 1, 1,
0.3846484, -0.03635884, 2.853237, 0, 0.2784314, 1, 1,
0.3866844, -0.7225193, 1.607067, 0, 0.2745098, 1, 1,
0.3885819, 0.7803886, 0.7078072, 0, 0.2666667, 1, 1,
0.3901257, -2.506576, 2.188829, 0, 0.2627451, 1, 1,
0.3910302, -1.176805, 4.10352, 0, 0.254902, 1, 1,
0.3918351, 1.987224, 0.7020125, 0, 0.2509804, 1, 1,
0.3984598, 1.574776, -0.3772546, 0, 0.2431373, 1, 1,
0.4015906, -0.183305, 2.2786, 0, 0.2392157, 1, 1,
0.403393, -0.8517618, 4.244001, 0, 0.2313726, 1, 1,
0.4069116, 0.4814585, 1.333642, 0, 0.227451, 1, 1,
0.4080881, -1.472354, 2.464649, 0, 0.2196078, 1, 1,
0.4138912, -1.113859, 2.332035, 0, 0.2156863, 1, 1,
0.4174569, -0.4789881, 1.462569, 0, 0.2078431, 1, 1,
0.4203261, 0.2986217, 2.888733, 0, 0.2039216, 1, 1,
0.4216476, 0.7112661, -0.6826307, 0, 0.1960784, 1, 1,
0.423185, 0.8527719, 0.2198294, 0, 0.1882353, 1, 1,
0.4241479, -1.626118, 1.952563, 0, 0.1843137, 1, 1,
0.4313486, 0.5580069, 2.427746, 0, 0.1764706, 1, 1,
0.4443743, 1.853607, -0.4028499, 0, 0.172549, 1, 1,
0.4535779, -0.7418873, 2.417277, 0, 0.1647059, 1, 1,
0.4583163, -0.4696322, 2.057759, 0, 0.1607843, 1, 1,
0.4589826, -0.5860171, 2.142202, 0, 0.1529412, 1, 1,
0.4596967, 0.4004099, 1.109378, 0, 0.1490196, 1, 1,
0.4678878, -1.03032, 3.235856, 0, 0.1411765, 1, 1,
0.468406, -0.1382071, 1.569026, 0, 0.1372549, 1, 1,
0.4705549, 0.7094063, -0.2975201, 0, 0.1294118, 1, 1,
0.470719, 0.4343977, 2.032865, 0, 0.1254902, 1, 1,
0.4723408, -0.03985843, -0.5013518, 0, 0.1176471, 1, 1,
0.4726391, -1.228448, 2.203848, 0, 0.1137255, 1, 1,
0.4842456, -0.6023125, 0.8846368, 0, 0.1058824, 1, 1,
0.4901999, -0.2602205, 1.186933, 0, 0.09803922, 1, 1,
0.4902405, 0.4506069, 0.7923297, 0, 0.09411765, 1, 1,
0.4920542, 1.629414, -0.006867679, 0, 0.08627451, 1, 1,
0.492625, -1.343527, 2.18618, 0, 0.08235294, 1, 1,
0.4933653, 0.1424658, 0.4382586, 0, 0.07450981, 1, 1,
0.497855, 1.144426, -0.3533091, 0, 0.07058824, 1, 1,
0.5021524, 0.4080423, 1.728413, 0, 0.0627451, 1, 1,
0.5023085, -0.02358384, 0.9320772, 0, 0.05882353, 1, 1,
0.5026721, 0.2945459, 0.3828281, 0, 0.05098039, 1, 1,
0.5027343, -0.5800321, 3.017073, 0, 0.04705882, 1, 1,
0.503244, -0.4627989, 3.074728, 0, 0.03921569, 1, 1,
0.5060453, 0.9747888, 0.957576, 0, 0.03529412, 1, 1,
0.5070158, 1.315915, 1.218368, 0, 0.02745098, 1, 1,
0.5213454, 0.00838675, 0.9257212, 0, 0.02352941, 1, 1,
0.5220101, -0.05023153, 2.10708, 0, 0.01568628, 1, 1,
0.5253756, 0.8199556, 1.244519, 0, 0.01176471, 1, 1,
0.5266404, 1.194748, -0.6027499, 0, 0.003921569, 1, 1,
0.5307004, -0.2270052, 1.749541, 0.003921569, 0, 1, 1,
0.5362049, -1.320424, 4.070035, 0.007843138, 0, 1, 1,
0.5385453, 1.361815, 2.641537, 0.01568628, 0, 1, 1,
0.5402623, -0.04978329, 3.560603, 0.01960784, 0, 1, 1,
0.5403342, -0.2737093, 0.9749555, 0.02745098, 0, 1, 1,
0.543284, -0.03696946, 1.834551, 0.03137255, 0, 1, 1,
0.5459369, 0.5167962, 1.468239, 0.03921569, 0, 1, 1,
0.5476225, 1.859021, 0.7399057, 0.04313726, 0, 1, 1,
0.5490704, -0.7147762, 3.240742, 0.05098039, 0, 1, 1,
0.552849, -0.09002861, 3.174861, 0.05490196, 0, 1, 1,
0.5555583, -0.2661138, 0.2175447, 0.0627451, 0, 1, 1,
0.5584728, 0.3035387, 1.556187, 0.06666667, 0, 1, 1,
0.5681849, 1.176833, 0.1004656, 0.07450981, 0, 1, 1,
0.5694361, -0.8540232, 2.59975, 0.07843138, 0, 1, 1,
0.572813, -1.896355, 3.154792, 0.08627451, 0, 1, 1,
0.5730817, 0.4746191, 2.695492, 0.09019608, 0, 1, 1,
0.5765827, 0.7044922, 1.812547, 0.09803922, 0, 1, 1,
0.5795984, 0.09458285, 1.230666, 0.1058824, 0, 1, 1,
0.5807534, -1.763815, 3.229874, 0.1098039, 0, 1, 1,
0.594049, 1.413035, -0.1707914, 0.1176471, 0, 1, 1,
0.6006367, 0.01200508, 2.467523, 0.1215686, 0, 1, 1,
0.6010156, -1.416061, 2.299981, 0.1294118, 0, 1, 1,
0.6023694, 0.2788102, 2.840572, 0.1333333, 0, 1, 1,
0.6059404, 0.6647958, -0.9116303, 0.1411765, 0, 1, 1,
0.6065283, -0.8715016, 3.224665, 0.145098, 0, 1, 1,
0.6083535, 0.3861611, 1.682325, 0.1529412, 0, 1, 1,
0.6176757, 2.077435, 0.8964323, 0.1568628, 0, 1, 1,
0.624781, 1.57287, 1.575248, 0.1647059, 0, 1, 1,
0.6296779, 0.03016672, 0.5367737, 0.1686275, 0, 1, 1,
0.6297633, -0.9142285, 1.830067, 0.1764706, 0, 1, 1,
0.6344227, -0.3810396, 3.187703, 0.1803922, 0, 1, 1,
0.6350977, -1.566151, 2.528876, 0.1882353, 0, 1, 1,
0.6363449, -0.5069038, 2.170309, 0.1921569, 0, 1, 1,
0.6388514, -0.1847041, 0.7247249, 0.2, 0, 1, 1,
0.6403452, -0.9183978, 2.777395, 0.2078431, 0, 1, 1,
0.6404398, 1.380459, -0.7140236, 0.2117647, 0, 1, 1,
0.6409619, 0.4830987, -0.4436798, 0.2196078, 0, 1, 1,
0.6415136, 0.6283926, 0.009312988, 0.2235294, 0, 1, 1,
0.6433979, -0.2763597, 3.116718, 0.2313726, 0, 1, 1,
0.6453653, 0.09518857, 1.574958, 0.2352941, 0, 1, 1,
0.6489848, 0.7106203, -0.2894049, 0.2431373, 0, 1, 1,
0.6542851, 2.11963, 1.856113, 0.2470588, 0, 1, 1,
0.6569619, -0.1362456, 1.488539, 0.254902, 0, 1, 1,
0.6617412, -0.1707532, 1.997476, 0.2588235, 0, 1, 1,
0.6644722, 0.8978901, 0.2232044, 0.2666667, 0, 1, 1,
0.668256, 1.326324, 1.525041, 0.2705882, 0, 1, 1,
0.6757188, -0.5944732, 1.745382, 0.2784314, 0, 1, 1,
0.6815387, 0.2171861, 0.8248023, 0.282353, 0, 1, 1,
0.6826822, -0.2594887, 0.8871005, 0.2901961, 0, 1, 1,
0.6830592, 0.6717826, 3.025924, 0.2941177, 0, 1, 1,
0.6855658, 0.9290443, 1.404622, 0.3019608, 0, 1, 1,
0.6883337, -0.553332, 2.06266, 0.3098039, 0, 1, 1,
0.6897859, -0.5254616, 2.986549, 0.3137255, 0, 1, 1,
0.6932806, -0.2059045, 2.578654, 0.3215686, 0, 1, 1,
0.6964398, -0.6967796, 0.6965344, 0.3254902, 0, 1, 1,
0.6988779, -0.1397024, 2.052594, 0.3333333, 0, 1, 1,
0.699008, 1.24851, 2.359914, 0.3372549, 0, 1, 1,
0.6997404, -0.5652711, 2.908804, 0.345098, 0, 1, 1,
0.7001284, 0.0003260058, 4.023617, 0.3490196, 0, 1, 1,
0.7003075, 0.6222239, 2.240041, 0.3568628, 0, 1, 1,
0.7039958, 1.172543, 0.4554209, 0.3607843, 0, 1, 1,
0.7079341, 0.3762702, 2.376526, 0.3686275, 0, 1, 1,
0.7081072, -1.538445, 0.08677956, 0.372549, 0, 1, 1,
0.7169593, -1.020807, 2.17803, 0.3803922, 0, 1, 1,
0.7254726, -2.008628, 3.833825, 0.3843137, 0, 1, 1,
0.7311186, 1.242186, 0.8516157, 0.3921569, 0, 1, 1,
0.7322835, -1.242341, 3.604524, 0.3960784, 0, 1, 1,
0.7342437, 2.119691, 0.9259433, 0.4039216, 0, 1, 1,
0.7459412, -0.00817949, 0.7639937, 0.4117647, 0, 1, 1,
0.7484873, -0.2382757, 0.9917492, 0.4156863, 0, 1, 1,
0.749651, 1.426876, 1.262506, 0.4235294, 0, 1, 1,
0.7516974, 0.01096811, 2.115952, 0.427451, 0, 1, 1,
0.7552941, 0.5471882, 2.266013, 0.4352941, 0, 1, 1,
0.7554907, 2.506175, -1.692673, 0.4392157, 0, 1, 1,
0.7629718, 0.04688749, 0.3328804, 0.4470588, 0, 1, 1,
0.7637516, -0.5834311, 2.583143, 0.4509804, 0, 1, 1,
0.7670826, 0.2080617, 0.7463065, 0.4588235, 0, 1, 1,
0.7702058, -0.9048252, 3.062368, 0.4627451, 0, 1, 1,
0.7735831, -1.159884, 1.719641, 0.4705882, 0, 1, 1,
0.77696, 2.508055, 1.230662, 0.4745098, 0, 1, 1,
0.7802479, -1.22857, 2.446467, 0.4823529, 0, 1, 1,
0.7820396, -1.011681, 3.315562, 0.4862745, 0, 1, 1,
0.7825909, -0.06035591, 2.542068, 0.4941176, 0, 1, 1,
0.7827452, 0.1928496, -0.06717589, 0.5019608, 0, 1, 1,
0.7851278, -0.9153686, 3.186857, 0.5058824, 0, 1, 1,
0.7873668, -0.6530228, 1.586677, 0.5137255, 0, 1, 1,
0.7950684, 0.9895337, 0.2974979, 0.5176471, 0, 1, 1,
0.7994546, -0.5515019, 3.167833, 0.5254902, 0, 1, 1,
0.805577, -0.6376813, 1.839529, 0.5294118, 0, 1, 1,
0.8085118, 1.137689, -0.7085223, 0.5372549, 0, 1, 1,
0.8088998, 0.3985023, 1.187428, 0.5411765, 0, 1, 1,
0.8097962, -0.6661444, 2.052819, 0.5490196, 0, 1, 1,
0.8106909, -0.7441489, 2.170877, 0.5529412, 0, 1, 1,
0.8129053, 0.122537, 2.249506, 0.5607843, 0, 1, 1,
0.8141345, -0.26916, 1.672123, 0.5647059, 0, 1, 1,
0.8174031, -0.08304343, 1.860233, 0.572549, 0, 1, 1,
0.8196009, -0.3589495, 1.698768, 0.5764706, 0, 1, 1,
0.8210773, 1.981295, 2.427543, 0.5843138, 0, 1, 1,
0.8217787, -0.296622, 1.887076, 0.5882353, 0, 1, 1,
0.8224382, -0.5673583, 1.589393, 0.5960785, 0, 1, 1,
0.8258598, -1.170785, 2.196075, 0.6039216, 0, 1, 1,
0.8274902, -0.6401313, 2.273176, 0.6078432, 0, 1, 1,
0.829769, 0.5465752, 2.237272, 0.6156863, 0, 1, 1,
0.831593, -0.988848, 2.467659, 0.6196079, 0, 1, 1,
0.8323981, 1.319775, 0.9591976, 0.627451, 0, 1, 1,
0.8382318, -0.1463571, 1.575147, 0.6313726, 0, 1, 1,
0.8397704, -1.175215, 1.265813, 0.6392157, 0, 1, 1,
0.8457301, -1.005555, 2.291586, 0.6431373, 0, 1, 1,
0.8533704, -0.3529763, 3.225964, 0.6509804, 0, 1, 1,
0.8575937, -0.07762799, 1.149272, 0.654902, 0, 1, 1,
0.8667591, -0.2423741, 2.285371, 0.6627451, 0, 1, 1,
0.8688571, -1.175907, 4.636347, 0.6666667, 0, 1, 1,
0.8689782, 0.8115291, 1.673495, 0.6745098, 0, 1, 1,
0.8704277, -1.532028, 1.778437, 0.6784314, 0, 1, 1,
0.8718817, 1.911078, 0.4537962, 0.6862745, 0, 1, 1,
0.8764515, -0.7859741, 1.712049, 0.6901961, 0, 1, 1,
0.8781939, -1.847122, 0.7438424, 0.6980392, 0, 1, 1,
0.8843914, -2.002613, 3.765238, 0.7058824, 0, 1, 1,
0.886296, -0.723468, 1.655848, 0.7098039, 0, 1, 1,
0.8906432, -0.2812401, 2.935534, 0.7176471, 0, 1, 1,
0.8934355, -0.1212381, 2.715496, 0.7215686, 0, 1, 1,
0.8949717, 0.8867744, -0.4972107, 0.7294118, 0, 1, 1,
0.8968913, -1.274851, 3.821188, 0.7333333, 0, 1, 1,
0.8987397, -1.172836, 3.445858, 0.7411765, 0, 1, 1,
0.900376, -1.162028, 2.117662, 0.7450981, 0, 1, 1,
0.9008696, -1.461235, 2.871172, 0.7529412, 0, 1, 1,
0.904177, -0.433371, 2.412039, 0.7568628, 0, 1, 1,
0.904862, -1.319411, 2.507432, 0.7647059, 0, 1, 1,
0.9053521, -2.312647, 3.946815, 0.7686275, 0, 1, 1,
0.9183264, 0.816398, -0.1050094, 0.7764706, 0, 1, 1,
0.9195893, -2.462034, 3.862415, 0.7803922, 0, 1, 1,
0.9201684, -0.1407938, 3.141003, 0.7882353, 0, 1, 1,
0.9227943, 0.2323575, 2.764409, 0.7921569, 0, 1, 1,
0.9238733, -0.8960901, 2.381261, 0.8, 0, 1, 1,
0.9268507, -0.8689312, 2.506773, 0.8078431, 0, 1, 1,
0.9319096, 0.553347, -0.6155688, 0.8117647, 0, 1, 1,
0.9374627, -0.3224257, 1.261102, 0.8196079, 0, 1, 1,
0.9406524, 0.4242028, 0.3533109, 0.8235294, 0, 1, 1,
0.9415732, 2.492791, -0.7101006, 0.8313726, 0, 1, 1,
0.9465859, -1.568149, 3.202229, 0.8352941, 0, 1, 1,
0.9474858, 0.213459, 2.271916, 0.8431373, 0, 1, 1,
0.9502954, 0.6528804, 1.14279, 0.8470588, 0, 1, 1,
0.9507592, 0.6778895, 1.721244, 0.854902, 0, 1, 1,
0.9512874, -1.409689, 2.065915, 0.8588235, 0, 1, 1,
0.9548589, -0.2211144, 2.062603, 0.8666667, 0, 1, 1,
0.9611788, 0.02026901, 0.536647, 0.8705882, 0, 1, 1,
0.9684513, 0.1709609, 1.827772, 0.8784314, 0, 1, 1,
0.9733056, -0.07099865, -0.1965637, 0.8823529, 0, 1, 1,
0.9734118, 0.8294815, 0.887925, 0.8901961, 0, 1, 1,
0.9799686, -0.78913, 3.270391, 0.8941177, 0, 1, 1,
0.9831747, 0.06735937, -0.8683189, 0.9019608, 0, 1, 1,
0.9848356, 1.700218, 0.9030877, 0.9098039, 0, 1, 1,
0.988116, 0.5372481, 1.52143, 0.9137255, 0, 1, 1,
0.988117, -0.1382961, 3.172521, 0.9215686, 0, 1, 1,
0.989857, -1.920791, 2.53003, 0.9254902, 0, 1, 1,
1.001881, -0.7537369, 3.294359, 0.9333333, 0, 1, 1,
1.003125, -0.8394101, 3.646896, 0.9372549, 0, 1, 1,
1.004649, -0.169469, 2.133559, 0.945098, 0, 1, 1,
1.006323, -1.099129, 2.029243, 0.9490196, 0, 1, 1,
1.01146, -1.442065, 3.637667, 0.9568627, 0, 1, 1,
1.013791, -0.3404045, 2.169309, 0.9607843, 0, 1, 1,
1.016591, 0.359495, 1.673709, 0.9686275, 0, 1, 1,
1.01771, -0.1133618, 1.150833, 0.972549, 0, 1, 1,
1.020504, 1.163429, -0.7584391, 0.9803922, 0, 1, 1,
1.022149, 0.2727691, -0.9715275, 0.9843137, 0, 1, 1,
1.030304, 0.7044933, 3.561965, 0.9921569, 0, 1, 1,
1.038611, 1.459665, -0.07881147, 0.9960784, 0, 1, 1,
1.041088, 0.7719638, 0.687292, 1, 0, 0.9960784, 1,
1.047131, 0.985909, 0.9369259, 1, 0, 0.9882353, 1,
1.051265, -0.3132538, 2.635957, 1, 0, 0.9843137, 1,
1.05313, 0.6801577, 1.709195, 1, 0, 0.9764706, 1,
1.056427, -0.7287807, 2.328946, 1, 0, 0.972549, 1,
1.059175, 0.1552768, 1.406031, 1, 0, 0.9647059, 1,
1.070879, -0.4148343, 2.738059, 1, 0, 0.9607843, 1,
1.076156, 0.1492718, 1.754483, 1, 0, 0.9529412, 1,
1.077972, -0.7166731, 0.2415616, 1, 0, 0.9490196, 1,
1.082245, 0.3686556, 2.234508, 1, 0, 0.9411765, 1,
1.085708, 0.8425739, 1.556, 1, 0, 0.9372549, 1,
1.086021, -0.3065191, 1.986963, 1, 0, 0.9294118, 1,
1.086494, 0.5723773, 1.754106, 1, 0, 0.9254902, 1,
1.090827, -1.089088, 4.119226, 1, 0, 0.9176471, 1,
1.092258, -0.8136716, 2.390116, 1, 0, 0.9137255, 1,
1.099684, 0.04405449, 2.858862, 1, 0, 0.9058824, 1,
1.101459, 0.2086562, 0.3873708, 1, 0, 0.9019608, 1,
1.101799, 1.537581, 0.5189674, 1, 0, 0.8941177, 1,
1.104825, 0.9171333, 1.636045, 1, 0, 0.8862745, 1,
1.105072, 0.07015625, 2.445017, 1, 0, 0.8823529, 1,
1.109553, -0.4836341, 1.697769, 1, 0, 0.8745098, 1,
1.110887, -1.146586, 2.405783, 1, 0, 0.8705882, 1,
1.111104, 0.07988211, 1.21164, 1, 0, 0.8627451, 1,
1.113966, 1.1752, 1.635137, 1, 0, 0.8588235, 1,
1.126559, -0.3114163, 3.110213, 1, 0, 0.8509804, 1,
1.127595, -0.8619092, 2.160744, 1, 0, 0.8470588, 1,
1.128705, -0.828702, 1.377767, 1, 0, 0.8392157, 1,
1.132709, -0.6202892, 2.343364, 1, 0, 0.8352941, 1,
1.139887, 0.5178441, 3.224086, 1, 0, 0.827451, 1,
1.14656, 0.3978264, 1.940861, 1, 0, 0.8235294, 1,
1.149512, -0.8858199, 4.491479, 1, 0, 0.8156863, 1,
1.152654, -0.7767856, 1.472393, 1, 0, 0.8117647, 1,
1.154815, -2.441926, 1.674362, 1, 0, 0.8039216, 1,
1.155018, -1.592235, 1.571324, 1, 0, 0.7960784, 1,
1.155429, -0.2128506, 1.119898, 1, 0, 0.7921569, 1,
1.162108, -0.6918246, 1.832619, 1, 0, 0.7843137, 1,
1.165888, -0.8644705, 1.417044, 1, 0, 0.7803922, 1,
1.169562, 0.8711827, 0.4784737, 1, 0, 0.772549, 1,
1.17187, 1.099626, 0.3773047, 1, 0, 0.7686275, 1,
1.175075, 0.1969087, 0.3628769, 1, 0, 0.7607843, 1,
1.176901, -1.555845, 1.49714, 1, 0, 0.7568628, 1,
1.190462, -0.1223469, 2.815744, 1, 0, 0.7490196, 1,
1.190977, -1.580646, 1.479675, 1, 0, 0.7450981, 1,
1.197292, -0.5645304, 2.502049, 1, 0, 0.7372549, 1,
1.209701, 0.4334059, 0.8314605, 1, 0, 0.7333333, 1,
1.21023, 1.319629, 0.05241767, 1, 0, 0.7254902, 1,
1.21315, -0.5273079, 3.484741, 1, 0, 0.7215686, 1,
1.216442, -0.3130914, 2.701056, 1, 0, 0.7137255, 1,
1.221024, -1.640749, 1.847561, 1, 0, 0.7098039, 1,
1.224732, -0.002307999, 1.797257, 1, 0, 0.7019608, 1,
1.225133, -0.4757878, 1.819508, 1, 0, 0.6941177, 1,
1.227754, 1.299865, -0.2053428, 1, 0, 0.6901961, 1,
1.228288, -0.1799988, 1.265273, 1, 0, 0.682353, 1,
1.235634, 0.8402814, 1.805549, 1, 0, 0.6784314, 1,
1.237371, 0.9527302, 0.7920529, 1, 0, 0.6705883, 1,
1.240306, -0.4931732, 1.946929, 1, 0, 0.6666667, 1,
1.243914, 0.4381622, 2.140956, 1, 0, 0.6588235, 1,
1.259022, 0.4648074, 3.074398, 1, 0, 0.654902, 1,
1.26336, -1.886111, 1.435016, 1, 0, 0.6470588, 1,
1.26509, -0.6573171, 1.941766, 1, 0, 0.6431373, 1,
1.265777, -0.5612717, 0.7469707, 1, 0, 0.6352941, 1,
1.276834, 0.8766618, 0.9137995, 1, 0, 0.6313726, 1,
1.282588, -0.0374307, 1.307945, 1, 0, 0.6235294, 1,
1.287308, 0.02086427, 1.729206, 1, 0, 0.6196079, 1,
1.301444, 0.07195207, 2.275067, 1, 0, 0.6117647, 1,
1.301608, 1.557377, 2.448888, 1, 0, 0.6078432, 1,
1.302129, 1.013276, -0.9844948, 1, 0, 0.6, 1,
1.310758, 0.1875619, -0.05440145, 1, 0, 0.5921569, 1,
1.311996, -0.437706, 2.361336, 1, 0, 0.5882353, 1,
1.32424, 0.09569625, 1.11938, 1, 0, 0.5803922, 1,
1.327888, 0.1520846, 1.525245, 1, 0, 0.5764706, 1,
1.330404, -0.866271, 1.710848, 1, 0, 0.5686275, 1,
1.330812, -1.22188, 2.075757, 1, 0, 0.5647059, 1,
1.347126, 2.279857, 0.5419129, 1, 0, 0.5568628, 1,
1.348487, -1.438117, 1.014661, 1, 0, 0.5529412, 1,
1.348883, 0.1061641, 0.6230333, 1, 0, 0.5450981, 1,
1.351018, 0.6899572, 2.512558, 1, 0, 0.5411765, 1,
1.351103, 2.18801, 0.4807719, 1, 0, 0.5333334, 1,
1.35492, -1.542581, 2.737693, 1, 0, 0.5294118, 1,
1.356709, -0.6609593, 2.620917, 1, 0, 0.5215687, 1,
1.357279, 1.467159, -0.007031736, 1, 0, 0.5176471, 1,
1.358152, -0.3533237, 0.4049069, 1, 0, 0.509804, 1,
1.362963, -0.3865277, 2.533695, 1, 0, 0.5058824, 1,
1.385785, -1.852149, 2.85713, 1, 0, 0.4980392, 1,
1.387403, 0.1366942, 1.567083, 1, 0, 0.4901961, 1,
1.391898, 0.4138457, 0.8020821, 1, 0, 0.4862745, 1,
1.393307, -0.07999896, 0.5546225, 1, 0, 0.4784314, 1,
1.404246, 2.695829, 1.724579, 1, 0, 0.4745098, 1,
1.404393, -0.2262166, 1.418874, 1, 0, 0.4666667, 1,
1.406513, -0.6197146, 2.663724, 1, 0, 0.4627451, 1,
1.414475, 1.731636, 0.5664866, 1, 0, 0.454902, 1,
1.415722, -0.5431999, -0.6313394, 1, 0, 0.4509804, 1,
1.419415, -0.277377, 2.601735, 1, 0, 0.4431373, 1,
1.424438, 0.2498541, 0.6905517, 1, 0, 0.4392157, 1,
1.427178, -1.263098, 3.346679, 1, 0, 0.4313726, 1,
1.43598, 0.4718625, 1.503487, 1, 0, 0.427451, 1,
1.442, -0.349304, 1.524676, 1, 0, 0.4196078, 1,
1.445186, -0.4127175, 3.263952, 1, 0, 0.4156863, 1,
1.448621, 0.5191553, 2.559294, 1, 0, 0.4078431, 1,
1.459803, 0.8076602, 1.452292, 1, 0, 0.4039216, 1,
1.473874, 0.4758415, 0.08468321, 1, 0, 0.3960784, 1,
1.477653, 0.5191237, 0.6048778, 1, 0, 0.3882353, 1,
1.478701, -1.415998, 3.168484, 1, 0, 0.3843137, 1,
1.49637, -0.8768845, 1.358675, 1, 0, 0.3764706, 1,
1.499433, 1.229075, 0.6911241, 1, 0, 0.372549, 1,
1.512874, 1.602904, 0.926536, 1, 0, 0.3647059, 1,
1.514444, -0.9394079, 1.94173, 1, 0, 0.3607843, 1,
1.514879, -0.755057, 3.553206, 1, 0, 0.3529412, 1,
1.51616, -0.1066635, -0.4572867, 1, 0, 0.3490196, 1,
1.519419, -1.119719, 1.668257, 1, 0, 0.3411765, 1,
1.534934, -0.03944569, 1.309573, 1, 0, 0.3372549, 1,
1.536366, 0.4506476, 1.885092, 1, 0, 0.3294118, 1,
1.551246, 0.406425, 1.595571, 1, 0, 0.3254902, 1,
1.560686, -0.4006985, 2.054294, 1, 0, 0.3176471, 1,
1.569776, 0.09607697, -0.4274926, 1, 0, 0.3137255, 1,
1.583569, 2.378624, 1.980306, 1, 0, 0.3058824, 1,
1.618849, -0.4168373, 2.080267, 1, 0, 0.2980392, 1,
1.627196, -0.8160447, 2.473354, 1, 0, 0.2941177, 1,
1.650427, 0.1364144, 2.465022, 1, 0, 0.2862745, 1,
1.656718, -0.466012, 2.41189, 1, 0, 0.282353, 1,
1.676651, 1.161424, -0.6576727, 1, 0, 0.2745098, 1,
1.678732, 0.9995804, 1.467284, 1, 0, 0.2705882, 1,
1.682655, 0.7948813, 2.430741, 1, 0, 0.2627451, 1,
1.691469, 1.13207, -0.1825236, 1, 0, 0.2588235, 1,
1.717822, -0.0951814, 1.262979, 1, 0, 0.2509804, 1,
1.724386, -0.9718439, 1.055874, 1, 0, 0.2470588, 1,
1.731435, 1.476657, 0.108333, 1, 0, 0.2392157, 1,
1.732141, 0.7498013, 1.591292, 1, 0, 0.2352941, 1,
1.735052, -1.355384, 1.635051, 1, 0, 0.227451, 1,
1.738944, -1.80557, 1.546369, 1, 0, 0.2235294, 1,
1.752848, 0.2459693, 2.469445, 1, 0, 0.2156863, 1,
1.756036, 0.3084169, 2.168031, 1, 0, 0.2117647, 1,
1.773373, 0.5533112, 2.812872, 1, 0, 0.2039216, 1,
1.776454, 0.5895183, -0.7570434, 1, 0, 0.1960784, 1,
1.815462, 0.05080739, 2.273598, 1, 0, 0.1921569, 1,
1.820831, 1.013028, -1.103897, 1, 0, 0.1843137, 1,
1.846835, -0.330696, 2.637064, 1, 0, 0.1803922, 1,
1.855049, 0.09803401, 1.452274, 1, 0, 0.172549, 1,
1.860035, -0.6152984, 1.568987, 1, 0, 0.1686275, 1,
1.897795, 0.8615452, 2.003299, 1, 0, 0.1607843, 1,
1.908759, -0.9955418, 3.217203, 1, 0, 0.1568628, 1,
1.915416, -1.922072, 2.858159, 1, 0, 0.1490196, 1,
1.951918, 0.2233444, 0.8571752, 1, 0, 0.145098, 1,
1.958408, -0.6499674, 1.713221, 1, 0, 0.1372549, 1,
1.975157, 0.0912344, 2.714846, 1, 0, 0.1333333, 1,
2.021085, 1.032896, 1.06582, 1, 0, 0.1254902, 1,
2.040134, 0.4322266, -0.121504, 1, 0, 0.1215686, 1,
2.124878, -0.6779879, 1.044167, 1, 0, 0.1137255, 1,
2.144648, 4.143081, 0.037788, 1, 0, 0.1098039, 1,
2.148512, 1.232228, -0.1398671, 1, 0, 0.1019608, 1,
2.158261, 0.4802597, 1.806424, 1, 0, 0.09411765, 1,
2.228725, 0.423622, 1.34854, 1, 0, 0.09019608, 1,
2.256613, 0.07202104, 1.335578, 1, 0, 0.08235294, 1,
2.288256, -0.7842289, 1.991368, 1, 0, 0.07843138, 1,
2.331709, 0.8843877, 1.959958, 1, 0, 0.07058824, 1,
2.483012, -0.3177243, 2.702601, 1, 0, 0.06666667, 1,
2.50762, -0.2316857, 2.785531, 1, 0, 0.05882353, 1,
2.555773, 1.210034, -0.320403, 1, 0, 0.05490196, 1,
2.574857, 0.9894748, 2.093534, 1, 0, 0.04705882, 1,
2.623654, 0.5663073, 0.6101368, 1, 0, 0.04313726, 1,
2.943984, 0.5003573, -0.608723, 1, 0, 0.03529412, 1,
2.989428, -0.5158898, 1.678543, 1, 0, 0.03137255, 1,
3.092753, -0.8287491, 1.81395, 1, 0, 0.02352941, 1,
3.120024, -0.8783866, 0.8546101, 1, 0, 0.01960784, 1,
3.370208, -0.4762957, 0.4515322, 1, 0, 0.01176471, 1,
3.999936, -1.726571, 2.465283, 1, 0, 0.007843138, 1
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
0.6853617, -5.227813, -8.706408, 0, -0.5, 0.5, 0.5,
0.6853617, -5.227813, -8.706408, 1, -0.5, 0.5, 0.5,
0.6853617, -5.227813, -8.706408, 1, 1.5, 0.5, 0.5,
0.6853617, -5.227813, -8.706408, 0, 1.5, 0.5, 0.5
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
-3.752854, 0.1367135, -8.706408, 0, -0.5, 0.5, 0.5,
-3.752854, 0.1367135, -8.706408, 1, -0.5, 0.5, 0.5,
-3.752854, 0.1367135, -8.706408, 1, 1.5, 0.5, 0.5,
-3.752854, 0.1367135, -8.706408, 0, 1.5, 0.5, 0.5
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
-3.752854, -5.227813, -0.3957608, 0, -0.5, 0.5, 0.5,
-3.752854, -5.227813, -0.3957608, 1, -0.5, 0.5, 0.5,
-3.752854, -5.227813, -0.3957608, 1, 1.5, 0.5, 0.5,
-3.752854, -5.227813, -0.3957608, 0, 1.5, 0.5, 0.5
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
-2, -3.989845, -6.788566,
3, -3.989845, -6.788566,
-2, -3.989845, -6.788566,
-2, -4.196173, -7.108206,
-1, -3.989845, -6.788566,
-1, -4.196173, -7.108206,
0, -3.989845, -6.788566,
0, -4.196173, -7.108206,
1, -3.989845, -6.788566,
1, -4.196173, -7.108206,
2, -3.989845, -6.788566,
2, -4.196173, -7.108206,
3, -3.989845, -6.788566,
3, -4.196173, -7.108206
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
-2, -4.608829, -7.747487, 0, -0.5, 0.5, 0.5,
-2, -4.608829, -7.747487, 1, -0.5, 0.5, 0.5,
-2, -4.608829, -7.747487, 1, 1.5, 0.5, 0.5,
-2, -4.608829, -7.747487, 0, 1.5, 0.5, 0.5,
-1, -4.608829, -7.747487, 0, -0.5, 0.5, 0.5,
-1, -4.608829, -7.747487, 1, -0.5, 0.5, 0.5,
-1, -4.608829, -7.747487, 1, 1.5, 0.5, 0.5,
-1, -4.608829, -7.747487, 0, 1.5, 0.5, 0.5,
0, -4.608829, -7.747487, 0, -0.5, 0.5, 0.5,
0, -4.608829, -7.747487, 1, -0.5, 0.5, 0.5,
0, -4.608829, -7.747487, 1, 1.5, 0.5, 0.5,
0, -4.608829, -7.747487, 0, 1.5, 0.5, 0.5,
1, -4.608829, -7.747487, 0, -0.5, 0.5, 0.5,
1, -4.608829, -7.747487, 1, -0.5, 0.5, 0.5,
1, -4.608829, -7.747487, 1, 1.5, 0.5, 0.5,
1, -4.608829, -7.747487, 0, 1.5, 0.5, 0.5,
2, -4.608829, -7.747487, 0, -0.5, 0.5, 0.5,
2, -4.608829, -7.747487, 1, -0.5, 0.5, 0.5,
2, -4.608829, -7.747487, 1, 1.5, 0.5, 0.5,
2, -4.608829, -7.747487, 0, 1.5, 0.5, 0.5,
3, -4.608829, -7.747487, 0, -0.5, 0.5, 0.5,
3, -4.608829, -7.747487, 1, -0.5, 0.5, 0.5,
3, -4.608829, -7.747487, 1, 1.5, 0.5, 0.5,
3, -4.608829, -7.747487, 0, 1.5, 0.5, 0.5
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
-2.72865, -2, -6.788566,
-2.72865, 4, -6.788566,
-2.72865, -2, -6.788566,
-2.899351, -2, -7.108206,
-2.72865, 0, -6.788566,
-2.899351, 0, -7.108206,
-2.72865, 2, -6.788566,
-2.899351, 2, -7.108206,
-2.72865, 4, -6.788566,
-2.899351, 4, -7.108206
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
-3.240752, -2, -7.747487, 0, -0.5, 0.5, 0.5,
-3.240752, -2, -7.747487, 1, -0.5, 0.5, 0.5,
-3.240752, -2, -7.747487, 1, 1.5, 0.5, 0.5,
-3.240752, -2, -7.747487, 0, 1.5, 0.5, 0.5,
-3.240752, 0, -7.747487, 0, -0.5, 0.5, 0.5,
-3.240752, 0, -7.747487, 1, -0.5, 0.5, 0.5,
-3.240752, 0, -7.747487, 1, 1.5, 0.5, 0.5,
-3.240752, 0, -7.747487, 0, 1.5, 0.5, 0.5,
-3.240752, 2, -7.747487, 0, -0.5, 0.5, 0.5,
-3.240752, 2, -7.747487, 1, -0.5, 0.5, 0.5,
-3.240752, 2, -7.747487, 1, 1.5, 0.5, 0.5,
-3.240752, 2, -7.747487, 0, 1.5, 0.5, 0.5,
-3.240752, 4, -7.747487, 0, -0.5, 0.5, 0.5,
-3.240752, 4, -7.747487, 1, -0.5, 0.5, 0.5,
-3.240752, 4, -7.747487, 1, 1.5, 0.5, 0.5,
-3.240752, 4, -7.747487, 0, 1.5, 0.5, 0.5
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
-2.72865, -3.989845, -6,
-2.72865, -3.989845, 4,
-2.72865, -3.989845, -6,
-2.899351, -4.196173, -6,
-2.72865, -3.989845, -4,
-2.899351, -4.196173, -4,
-2.72865, -3.989845, -2,
-2.899351, -4.196173, -2,
-2.72865, -3.989845, 0,
-2.899351, -4.196173, 0,
-2.72865, -3.989845, 2,
-2.899351, -4.196173, 2,
-2.72865, -3.989845, 4,
-2.899351, -4.196173, 4
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
"-6",
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
-3.240752, -4.608829, -6, 0, -0.5, 0.5, 0.5,
-3.240752, -4.608829, -6, 1, -0.5, 0.5, 0.5,
-3.240752, -4.608829, -6, 1, 1.5, 0.5, 0.5,
-3.240752, -4.608829, -6, 0, 1.5, 0.5, 0.5,
-3.240752, -4.608829, -4, 0, -0.5, 0.5, 0.5,
-3.240752, -4.608829, -4, 1, -0.5, 0.5, 0.5,
-3.240752, -4.608829, -4, 1, 1.5, 0.5, 0.5,
-3.240752, -4.608829, -4, 0, 1.5, 0.5, 0.5,
-3.240752, -4.608829, -2, 0, -0.5, 0.5, 0.5,
-3.240752, -4.608829, -2, 1, -0.5, 0.5, 0.5,
-3.240752, -4.608829, -2, 1, 1.5, 0.5, 0.5,
-3.240752, -4.608829, -2, 0, 1.5, 0.5, 0.5,
-3.240752, -4.608829, 0, 0, -0.5, 0.5, 0.5,
-3.240752, -4.608829, 0, 1, -0.5, 0.5, 0.5,
-3.240752, -4.608829, 0, 1, 1.5, 0.5, 0.5,
-3.240752, -4.608829, 0, 0, 1.5, 0.5, 0.5,
-3.240752, -4.608829, 2, 0, -0.5, 0.5, 0.5,
-3.240752, -4.608829, 2, 1, -0.5, 0.5, 0.5,
-3.240752, -4.608829, 2, 1, 1.5, 0.5, 0.5,
-3.240752, -4.608829, 2, 0, 1.5, 0.5, 0.5,
-3.240752, -4.608829, 4, 0, -0.5, 0.5, 0.5,
-3.240752, -4.608829, 4, 1, -0.5, 0.5, 0.5,
-3.240752, -4.608829, 4, 1, 1.5, 0.5, 0.5,
-3.240752, -4.608829, 4, 0, 1.5, 0.5, 0.5
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
-2.72865, -3.989845, -6.788566,
-2.72865, 4.263272, -6.788566,
-2.72865, -3.989845, 5.997045,
-2.72865, 4.263272, 5.997045,
-2.72865, -3.989845, -6.788566,
-2.72865, -3.989845, 5.997045,
-2.72865, 4.263272, -6.788566,
-2.72865, 4.263272, 5.997045,
-2.72865, -3.989845, -6.788566,
4.099374, -3.989845, -6.788566,
-2.72865, -3.989845, 5.997045,
4.099374, -3.989845, 5.997045,
-2.72865, 4.263272, -6.788566,
4.099374, 4.263272, -6.788566,
-2.72865, 4.263272, 5.997045,
4.099374, 4.263272, 5.997045,
4.099374, -3.989845, -6.788566,
4.099374, 4.263272, -6.788566,
4.099374, -3.989845, 5.997045,
4.099374, 4.263272, 5.997045,
4.099374, -3.989845, -6.788566,
4.099374, -3.989845, 5.997045,
4.099374, 4.263272, -6.788566,
4.099374, 4.263272, 5.997045
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
var radius = 8.906561;
var distance = 39.62629;
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
mvMatrix.translate( -0.6853617, -0.1367135, 0.3957608 );
mvMatrix.scale( 1.410357, 1.166826, 0.7531864 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -39.62629);
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
propiconazole<-read.table("propiconazole.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-propiconazole$V2
```

```
## Error in eval(expr, envir, enclos): object 'propiconazole' not found
```

```r
y<-propiconazole$V3
```

```
## Error in eval(expr, envir, enclos): object 'propiconazole' not found
```

```r
z<-propiconazole$V4
```

```
## Error in eval(expr, envir, enclos): object 'propiconazole' not found
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
-2.629213, -0.5333893, -3.351565, 0, 0, 1, 1, 1,
-2.604262, -0.08361484, -2.459529, 1, 0, 0, 1, 1,
-2.510998, 0.1830095, -2.389018, 1, 0, 0, 1, 1,
-2.438589, 0.9895531, -1.354472, 1, 0, 0, 1, 1,
-2.394716, 0.931758, -0.6980715, 1, 0, 0, 1, 1,
-2.335987, -1.260143, -0.9589821, 1, 0, 0, 1, 1,
-2.270222, -0.3694809, -1.366841, 0, 0, 0, 1, 1,
-2.248454, -0.1870997, -1.163424, 0, 0, 0, 1, 1,
-2.126588, 1.641275, 0.01482985, 0, 0, 0, 1, 1,
-2.10027, -0.7646028, -1.989585, 0, 0, 0, 1, 1,
-2.008922, -0.5136644, -2.709553, 0, 0, 0, 1, 1,
-1.956455, 0.1484285, -1.75069, 0, 0, 0, 1, 1,
-1.948109, -1.721753, -3.572115, 0, 0, 0, 1, 1,
-1.924921, -0.4621532, -0.9372774, 1, 1, 1, 1, 1,
-1.921429, 0.7101623, -0.4637274, 1, 1, 1, 1, 1,
-1.919591, 0.3477694, -2.475015, 1, 1, 1, 1, 1,
-1.885008, 0.9837712, -0.6454155, 1, 1, 1, 1, 1,
-1.882853, 0.1684082, -1.801645, 1, 1, 1, 1, 1,
-1.863288, 0.5692292, -0.08782581, 1, 1, 1, 1, 1,
-1.862915, 0.1746034, -0.2839821, 1, 1, 1, 1, 1,
-1.861417, -0.3180763, -0.9608594, 1, 1, 1, 1, 1,
-1.851779, 1.0659, -0.1717587, 1, 1, 1, 1, 1,
-1.841741, 1.08466, -1.362697, 1, 1, 1, 1, 1,
-1.839882, 0.7074547, -2.260669, 1, 1, 1, 1, 1,
-1.816752, 0.9637538, -1.23122, 1, 1, 1, 1, 1,
-1.813354, 0.8079591, -3.268149, 1, 1, 1, 1, 1,
-1.812786, -0.07519941, -1.534089, 1, 1, 1, 1, 1,
-1.809871, 0.6362367, -2.745411, 1, 1, 1, 1, 1,
-1.809489, 0.00854757, -1.192212, 0, 0, 1, 1, 1,
-1.773653, 0.004476177, -1.905394, 1, 0, 0, 1, 1,
-1.770447, -0.5897185, -3.422788, 1, 0, 0, 1, 1,
-1.757034, 1.606064, -0.7350109, 1, 0, 0, 1, 1,
-1.754445, 0.6341701, -2.431605, 1, 0, 0, 1, 1,
-1.728211, -0.532962, -2.104579, 1, 0, 0, 1, 1,
-1.72452, -0.4558596, -1.966103, 0, 0, 0, 1, 1,
-1.699572, 0.3973223, 0.3712523, 0, 0, 0, 1, 1,
-1.691064, -0.1435305, -2.357044, 0, 0, 0, 1, 1,
-1.684618, -0.4893939, -0.8254222, 0, 0, 0, 1, 1,
-1.664463, 1.117576, -0.9197762, 0, 0, 0, 1, 1,
-1.65396, 0.3941641, -0.3076612, 0, 0, 0, 1, 1,
-1.645348, -2.160911, -1.955633, 0, 0, 0, 1, 1,
-1.626077, -1.387181, -1.542415, 1, 1, 1, 1, 1,
-1.625362, 0.22641, 0.2107233, 1, 1, 1, 1, 1,
-1.621935, 0.6102206, -1.047686, 1, 1, 1, 1, 1,
-1.616514, 0.8826851, -1.469279, 1, 1, 1, 1, 1,
-1.604374, 0.2005073, -0.2077777, 1, 1, 1, 1, 1,
-1.589792, -2.117279, -1.837415, 1, 1, 1, 1, 1,
-1.582764, 0.505939, -1.451538, 1, 1, 1, 1, 1,
-1.5516, -1.921861, -1.105479, 1, 1, 1, 1, 1,
-1.543151, -0.8094624, -0.5416833, 1, 1, 1, 1, 1,
-1.520139, 1.8743, -1.265058, 1, 1, 1, 1, 1,
-1.519787, 0.05053297, -2.860717, 1, 1, 1, 1, 1,
-1.519506, 0.8573349, -1.69493, 1, 1, 1, 1, 1,
-1.518344, -0.1494665, -1.950371, 1, 1, 1, 1, 1,
-1.510684, -2.331166, -2.326926, 1, 1, 1, 1, 1,
-1.506057, -0.4480736, -0.5891373, 1, 1, 1, 1, 1,
-1.501474, 1.29945, 0.184057, 0, 0, 1, 1, 1,
-1.499927, -0.621088, -2.087292, 1, 0, 0, 1, 1,
-1.477643, -1.021415, -1.209816, 1, 0, 0, 1, 1,
-1.467577, 0.7656136, -1.227616, 1, 0, 0, 1, 1,
-1.466019, 1.90015, 0.8545573, 1, 0, 0, 1, 1,
-1.45316, 0.07435305, -0.9275297, 1, 0, 0, 1, 1,
-1.444037, -1.702118, -2.257438, 0, 0, 0, 1, 1,
-1.442935, 1.731232, -1.646983, 0, 0, 0, 1, 1,
-1.420776, -2.154519, -4.682667, 0, 0, 0, 1, 1,
-1.419379, -0.7732469, -2.220484, 0, 0, 0, 1, 1,
-1.37061, 0.2124174, -1.94843, 0, 0, 0, 1, 1,
-1.350072, 0.8714674, -2.087916, 0, 0, 0, 1, 1,
-1.348833, 0.7782217, 0.5334944, 0, 0, 0, 1, 1,
-1.338741, 1.438536, 0.07431545, 1, 1, 1, 1, 1,
-1.337531, 0.9272763, -0.537708, 1, 1, 1, 1, 1,
-1.335087, 0.2328943, -0.8211988, 1, 1, 1, 1, 1,
-1.334099, -0.5321829, -1.916297, 1, 1, 1, 1, 1,
-1.329752, 0.958985, -1.498794, 1, 1, 1, 1, 1,
-1.325424, -1.024547, -3.854745, 1, 1, 1, 1, 1,
-1.325008, -1.166102, -2.762668, 1, 1, 1, 1, 1,
-1.32364, 1.184624, -1.412493, 1, 1, 1, 1, 1,
-1.307195, -0.7552894, -1.417092, 1, 1, 1, 1, 1,
-1.306903, 0.4941748, -1.988655, 1, 1, 1, 1, 1,
-1.3016, 0.2876219, -1.425993, 1, 1, 1, 1, 1,
-1.292157, -2.639333, -1.061685, 1, 1, 1, 1, 1,
-1.282546, 0.1863827, 1.079638, 1, 1, 1, 1, 1,
-1.279632, -0.0877611, -0.7916391, 1, 1, 1, 1, 1,
-1.26696, -0.5951413, -1.463195, 1, 1, 1, 1, 1,
-1.263113, -0.546046, -3.03931, 0, 0, 1, 1, 1,
-1.257177, -0.09905705, -2.510993, 1, 0, 0, 1, 1,
-1.254734, -0.1955386, -2.204284, 1, 0, 0, 1, 1,
-1.251682, -0.2950456, -1.799547, 1, 0, 0, 1, 1,
-1.23843, -0.3792003, -1.258606, 1, 0, 0, 1, 1,
-1.237541, -1.240165, -2.072474, 1, 0, 0, 1, 1,
-1.237283, 0.4549609, -2.552148, 0, 0, 0, 1, 1,
-1.237172, 0.9784289, -0.7434393, 0, 0, 0, 1, 1,
-1.227616, -0.3833228, -2.885369, 0, 0, 0, 1, 1,
-1.225618, 0.2101024, 0.5846732, 0, 0, 0, 1, 1,
-1.221386, 0.5297722, -0.458066, 0, 0, 0, 1, 1,
-1.221048, 1.516719, -0.7489616, 0, 0, 0, 1, 1,
-1.219848, 0.8969281, -2.510778, 0, 0, 0, 1, 1,
-1.217242, -0.06442773, -0.744564, 1, 1, 1, 1, 1,
-1.20544, -1.580188, -2.324505, 1, 1, 1, 1, 1,
-1.194721, -0.3122612, -2.709133, 1, 1, 1, 1, 1,
-1.184364, 0.9934286, -0.9793436, 1, 1, 1, 1, 1,
-1.183786, 1.464086, 0.4451708, 1, 1, 1, 1, 1,
-1.179265, 1.354055, 1.447302, 1, 1, 1, 1, 1,
-1.175274, 0.4176011, -0.6024935, 1, 1, 1, 1, 1,
-1.168736, -0.5758162, -0.6429901, 1, 1, 1, 1, 1,
-1.163134, -0.4287215, -2.750018, 1, 1, 1, 1, 1,
-1.160443, 0.2739294, -0.6966523, 1, 1, 1, 1, 1,
-1.160181, 0.431866, -0.01871379, 1, 1, 1, 1, 1,
-1.159784, -0.2275653, -1.595796, 1, 1, 1, 1, 1,
-1.139038, 0.06713279, -1.828188, 1, 1, 1, 1, 1,
-1.135101, -1.19146, -1.873068, 1, 1, 1, 1, 1,
-1.133851, -2.483841, -3.221528, 1, 1, 1, 1, 1,
-1.129839, 0.9067864, 0.4895004, 0, 0, 1, 1, 1,
-1.126533, -0.6115181, -2.296468, 1, 0, 0, 1, 1,
-1.126397, 0.7060832, -0.7228654, 1, 0, 0, 1, 1,
-1.125082, -1.259912, -2.555698, 1, 0, 0, 1, 1,
-1.123286, 1.08776, -1.024253, 1, 0, 0, 1, 1,
-1.123227, -0.6343876, -1.027533, 1, 0, 0, 1, 1,
-1.110207, 1.832038, -1.148653, 0, 0, 0, 1, 1,
-1.110104, -0.02417828, -1.109023, 0, 0, 0, 1, 1,
-1.109037, -0.8880698, -1.471847, 0, 0, 0, 1, 1,
-1.098998, 0.5927699, -2.998157, 0, 0, 0, 1, 1,
-1.097082, 1.325459, 0.3118016, 0, 0, 0, 1, 1,
-1.094306, 0.3986647, -1.601477, 0, 0, 0, 1, 1,
-1.080171, -1.619616, -1.895105, 0, 0, 0, 1, 1,
-1.079808, -0.5264639, -2.850507, 1, 1, 1, 1, 1,
-1.071092, 0.8000843, -1.928035, 1, 1, 1, 1, 1,
-1.069806, -0.5572851, -0.963908, 1, 1, 1, 1, 1,
-1.069806, -0.2825418, -1.072768, 1, 1, 1, 1, 1,
-1.057253, 0.4315332, 0.02352887, 1, 1, 1, 1, 1,
-1.051381, 1.33636, -0.2938967, 1, 1, 1, 1, 1,
-1.044348, 0.8446192, -0.4613986, 1, 1, 1, 1, 1,
-1.033283, -0.05460794, 0.6669735, 1, 1, 1, 1, 1,
-1.032886, -1.702674, -2.589041, 1, 1, 1, 1, 1,
-1.03211, 0.2445409, -1.249342, 1, 1, 1, 1, 1,
-1.029659, 0.5684903, -0.7829755, 1, 1, 1, 1, 1,
-1.023348, 0.0349303, -1.440505, 1, 1, 1, 1, 1,
-1.020644, -0.3569342, -1.646655, 1, 1, 1, 1, 1,
-1.020564, -1.057296, -2.199053, 1, 1, 1, 1, 1,
-1.004354, 0.5164331, -2.079754, 1, 1, 1, 1, 1,
-0.9922069, -0.407664, -2.072483, 0, 0, 1, 1, 1,
-0.9888984, -0.4054466, -1.271542, 1, 0, 0, 1, 1,
-0.988632, 0.1234873, -2.829273, 1, 0, 0, 1, 1,
-0.9875621, -0.09940473, -0.3680077, 1, 0, 0, 1, 1,
-0.978896, -0.4030903, -4.169608, 1, 0, 0, 1, 1,
-0.9756615, 0.8759986, 0.04857666, 1, 0, 0, 1, 1,
-0.9720788, -1.031065, -2.873749, 0, 0, 0, 1, 1,
-0.9683318, 0.6272582, 0.7287549, 0, 0, 0, 1, 1,
-0.964173, -2.687315, -4.267338, 0, 0, 0, 1, 1,
-0.9545215, -0.6717311, -2.639544, 0, 0, 0, 1, 1,
-0.9538203, -1.225227, -2.31396, 0, 0, 0, 1, 1,
-0.9520998, -0.5732334, -0.8289855, 0, 0, 0, 1, 1,
-0.9510372, -0.6093537, -2.975853, 0, 0, 0, 1, 1,
-0.9472678, -0.06629005, -2.18813, 1, 1, 1, 1, 1,
-0.9413658, 2.231524, -1.714834, 1, 1, 1, 1, 1,
-0.9392538, 2.073115, -2.279078, 1, 1, 1, 1, 1,
-0.9284037, 0.2254726, -1.279771, 1, 1, 1, 1, 1,
-0.9259281, -0.4518492, -4.066792, 1, 1, 1, 1, 1,
-0.9190453, 0.01158273, -0.06757176, 1, 1, 1, 1, 1,
-0.9122457, -0.1245961, -4.287331, 1, 1, 1, 1, 1,
-0.9102823, -0.03027478, -0.04785698, 1, 1, 1, 1, 1,
-0.907137, 0.3906293, -1.053531, 1, 1, 1, 1, 1,
-0.9055928, 0.7696195, -2.027848, 1, 1, 1, 1, 1,
-0.9022701, 0.5197176, 0.5735241, 1, 1, 1, 1, 1,
-0.9020184, 1.178763, -0.6536152, 1, 1, 1, 1, 1,
-0.8985047, 0.4560015, -1.718532, 1, 1, 1, 1, 1,
-0.8946555, 0.2422095, -2.561786, 1, 1, 1, 1, 1,
-0.8933616, -1.416606, -1.357004, 1, 1, 1, 1, 1,
-0.8914691, 1.627425, -0.9909936, 0, 0, 1, 1, 1,
-0.8894051, -0.8696691, -2.751769, 1, 0, 0, 1, 1,
-0.8879625, 0.3433367, 0.606293, 1, 0, 0, 1, 1,
-0.8854936, 0.7445989, -0.9180337, 1, 0, 0, 1, 1,
-0.8835242, 0.1702737, -2.077368, 1, 0, 0, 1, 1,
-0.8792712, -0.4188774, -1.312892, 1, 0, 0, 1, 1,
-0.8792506, -0.6473254, -0.5962207, 0, 0, 0, 1, 1,
-0.8792232, -0.5007018, -2.524591, 0, 0, 0, 1, 1,
-0.8782777, -0.1649598, -2.370639, 0, 0, 0, 1, 1,
-0.8746557, 0.989168, 0.8181449, 0, 0, 0, 1, 1,
-0.8726119, -0.6602367, -2.4306, 0, 0, 0, 1, 1,
-0.8717178, -0.9831336, -1.714342, 0, 0, 0, 1, 1,
-0.8692538, -1.028319, -2.230605, 0, 0, 0, 1, 1,
-0.8684705, -0.1158818, -1.843438, 1, 1, 1, 1, 1,
-0.86842, -0.7723351, -2.495976, 1, 1, 1, 1, 1,
-0.8665779, 0.8853313, -0.3303329, 1, 1, 1, 1, 1,
-0.86557, -1.345279, -3.622776, 1, 1, 1, 1, 1,
-0.8642679, 0.5289394, -1.516501, 1, 1, 1, 1, 1,
-0.8601001, 0.9829714, -1.854582, 1, 1, 1, 1, 1,
-0.8573683, 0.5680773, -1.312254, 1, 1, 1, 1, 1,
-0.8556138, 1.00044, -0.8762287, 1, 1, 1, 1, 1,
-0.8531056, 2.006299, -0.3252083, 1, 1, 1, 1, 1,
-0.8396333, 1.661111, 1.667889, 1, 1, 1, 1, 1,
-0.8362206, 1.661387, -0.4752843, 1, 1, 1, 1, 1,
-0.8348976, -0.9679413, -2.995646, 1, 1, 1, 1, 1,
-0.8335863, 0.7476228, -0.2462545, 1, 1, 1, 1, 1,
-0.8269452, 0.4449096, -1.244766, 1, 1, 1, 1, 1,
-0.8211399, 0.6917593, 1.861984, 1, 1, 1, 1, 1,
-0.818489, 0.8488547, -0.7406545, 0, 0, 1, 1, 1,
-0.8148476, 1.390078, -0.3849106, 1, 0, 0, 1, 1,
-0.8118603, -2.733672, -2.644664, 1, 0, 0, 1, 1,
-0.8076059, -0.5142409, -1.24231, 1, 0, 0, 1, 1,
-0.8065056, -0.8048559, -3.303701, 1, 0, 0, 1, 1,
-0.8052418, 0.06377836, -3.699723, 1, 0, 0, 1, 1,
-0.8032597, 0.8682112, -0.7193958, 0, 0, 0, 1, 1,
-0.7929332, -0.4830226, -1.444534, 0, 0, 0, 1, 1,
-0.7832988, 0.885601, -2.029515, 0, 0, 0, 1, 1,
-0.782199, 0.04815525, -2.718936, 0, 0, 0, 1, 1,
-0.7713524, 2.679124, 0.2437813, 0, 0, 0, 1, 1,
-0.7690204, 0.4794126, -0.2405476, 0, 0, 0, 1, 1,
-0.7667826, -1.41692, -3.408996, 0, 0, 0, 1, 1,
-0.7658757, -1.388238, -0.08188358, 1, 1, 1, 1, 1,
-0.750596, 1.443876, -1.783074, 1, 1, 1, 1, 1,
-0.7475446, 0.6314518, -0.3783684, 1, 1, 1, 1, 1,
-0.7454319, 0.3297808, -1.904352, 1, 1, 1, 1, 1,
-0.7430212, 0.2793614, -0.8976714, 1, 1, 1, 1, 1,
-0.7400846, 0.2305037, 0.231078, 1, 1, 1, 1, 1,
-0.7398256, -0.7925309, -3.203403, 1, 1, 1, 1, 1,
-0.7381729, 1.254079, -1.239562, 1, 1, 1, 1, 1,
-0.7347927, 1.561379, -0.7399499, 1, 1, 1, 1, 1,
-0.7324339, 0.7856846, -1.144151, 1, 1, 1, 1, 1,
-0.7301754, 0.4157764, -1.993574, 1, 1, 1, 1, 1,
-0.7244868, 0.6815326, -1.413774, 1, 1, 1, 1, 1,
-0.7183337, -0.6297916, -2.109751, 1, 1, 1, 1, 1,
-0.7175233, 0.3994539, -1.033379, 1, 1, 1, 1, 1,
-0.7154443, -1.519729, -3.660063, 1, 1, 1, 1, 1,
-0.7131777, 0.1924888, -1.536888, 0, 0, 1, 1, 1,
-0.7010894, -1.68572, -0.2021853, 1, 0, 0, 1, 1,
-0.6994738, 0.1312541, -0.9003136, 1, 0, 0, 1, 1,
-0.6989251, 0.007918734, 0.3153052, 1, 0, 0, 1, 1,
-0.6967363, 0.2984442, 0.04311213, 1, 0, 0, 1, 1,
-0.6897938, -1.826122, -1.137159, 1, 0, 0, 1, 1,
-0.684077, -1.119119, -0.4642754, 0, 0, 0, 1, 1,
-0.6825988, -0.4854065, -1.663265, 0, 0, 0, 1, 1,
-0.6755205, 0.1863531, -0.3519578, 0, 0, 0, 1, 1,
-0.6736216, -0.09347512, -2.049726, 0, 0, 0, 1, 1,
-0.6733269, 1.070921, 0.1294395, 0, 0, 0, 1, 1,
-0.6720874, -0.35576, -2.68946, 0, 0, 0, 1, 1,
-0.669381, 0.0346651, -0.9137161, 0, 0, 0, 1, 1,
-0.6633688, -0.2201475, -2.294411, 1, 1, 1, 1, 1,
-0.6586441, -1.753443, -3.074697, 1, 1, 1, 1, 1,
-0.6584477, -0.8330183, -2.161334, 1, 1, 1, 1, 1,
-0.6562254, -1.267678, -1.777872, 1, 1, 1, 1, 1,
-0.6528183, 0.4280198, -0.1781172, 1, 1, 1, 1, 1,
-0.6521878, -0.5042562, -2.02253, 1, 1, 1, 1, 1,
-0.6487825, -0.4728633, -1.759704, 1, 1, 1, 1, 1,
-0.6482914, 0.1705887, -1.361216, 1, 1, 1, 1, 1,
-0.6451873, -0.1130802, -2.794668, 1, 1, 1, 1, 1,
-0.6320519, 0.5887768, -1.474548, 1, 1, 1, 1, 1,
-0.6318707, 0.3771295, -2.653831, 1, 1, 1, 1, 1,
-0.6313388, 0.3516199, -1.925881, 1, 1, 1, 1, 1,
-0.6270909, -0.6306705, -2.558161, 1, 1, 1, 1, 1,
-0.6260922, -0.614868, -1.728741, 1, 1, 1, 1, 1,
-0.624779, 2.735053, -0.5845514, 1, 1, 1, 1, 1,
-0.621214, -0.5699463, -1.668883, 0, 0, 1, 1, 1,
-0.6158417, 0.7731274, -1.425797, 1, 0, 0, 1, 1,
-0.6142955, -1.359822, -4.170072, 1, 0, 0, 1, 1,
-0.6142879, 0.08324391, -2.726098, 1, 0, 0, 1, 1,
-0.6142626, -2.158733, -1.325634, 1, 0, 0, 1, 1,
-0.6125336, -0.1207354, -2.277257, 1, 0, 0, 1, 1,
-0.6116418, -0.8744096, -2.751232, 0, 0, 0, 1, 1,
-0.6043607, -0.3733771, -2.086175, 0, 0, 0, 1, 1,
-0.6042606, -1.298099, -3.048229, 0, 0, 0, 1, 1,
-0.603169, -1.505381, -2.935731, 0, 0, 0, 1, 1,
-0.6021811, -0.36756, -1.959381, 0, 0, 0, 1, 1,
-0.6008129, -0.4868894, -2.570479, 0, 0, 0, 1, 1,
-0.6004146, 1.323382, -1.819703, 0, 0, 0, 1, 1,
-0.5954633, 0.1579351, -1.908886, 1, 1, 1, 1, 1,
-0.5949708, -0.5448127, -2.560158, 1, 1, 1, 1, 1,
-0.5838749, -0.6876008, -2.733325, 1, 1, 1, 1, 1,
-0.579905, 0.8895041, -1.466829, 1, 1, 1, 1, 1,
-0.5778476, 0.5754575, -1.034999, 1, 1, 1, 1, 1,
-0.5763042, -1.656237, -3.026361, 1, 1, 1, 1, 1,
-0.5728165, 0.9565571, 1.793191, 1, 1, 1, 1, 1,
-0.5700285, 0.4026766, -2.050429, 1, 1, 1, 1, 1,
-0.5686389, 0.5238294, -1.641604, 1, 1, 1, 1, 1,
-0.5642506, 0.5956299, -0.3589334, 1, 1, 1, 1, 1,
-0.5632703, -0.9342732, -1.607361, 1, 1, 1, 1, 1,
-0.5570987, 1.859139, -0.3461905, 1, 1, 1, 1, 1,
-0.5566685, -1.75463, -2.343498, 1, 1, 1, 1, 1,
-0.5524929, -1.870244, -3.104019, 1, 1, 1, 1, 1,
-0.5511375, 0.4989791, -0.1983626, 1, 1, 1, 1, 1,
-0.5508715, 0.2240468, -2.526478, 0, 0, 1, 1, 1,
-0.5453191, 0.2383364, 0.1089739, 1, 0, 0, 1, 1,
-0.5453044, 0.2047208, 0.3526334, 1, 0, 0, 1, 1,
-0.5437782, 0.8506761, 0.1486271, 1, 0, 0, 1, 1,
-0.5420421, -0.7564029, -3.01436, 1, 0, 0, 1, 1,
-0.5412988, -0.4903025, -2.45237, 1, 0, 0, 1, 1,
-0.5396641, -2.510208, -3.242353, 0, 0, 0, 1, 1,
-0.538762, -0.5336192, -1.3909, 0, 0, 0, 1, 1,
-0.535996, 1.398104, 0.1864322, 0, 0, 0, 1, 1,
-0.5309393, 0.2920755, -1.162174, 0, 0, 0, 1, 1,
-0.5226365, -0.783058, -3.969718, 0, 0, 0, 1, 1,
-0.5217831, 0.6844165, -1.995515, 0, 0, 0, 1, 1,
-0.518892, -0.4924857, -2.379817, 0, 0, 0, 1, 1,
-0.5168606, 0.9115041, -0.7578016, 1, 1, 1, 1, 1,
-0.515494, -1.920841, -2.443533, 1, 1, 1, 1, 1,
-0.5154929, -1.867637, -2.138541, 1, 1, 1, 1, 1,
-0.5123016, 1.804527, -0.2396281, 1, 1, 1, 1, 1,
-0.5109466, 0.9966832, -0.9185156, 1, 1, 1, 1, 1,
-0.5075656, -0.481803, -2.536964, 1, 1, 1, 1, 1,
-0.5047849, 0.647073, -2.234876, 1, 1, 1, 1, 1,
-0.5016158, 1.159254, -1.436556, 1, 1, 1, 1, 1,
-0.4996601, -0.51672, -1.045295, 1, 1, 1, 1, 1,
-0.498659, 1.044082, -0.1466013, 1, 1, 1, 1, 1,
-0.4973176, -0.5957714, -2.3469, 1, 1, 1, 1, 1,
-0.4957815, -0.2918906, -4.141771, 1, 1, 1, 1, 1,
-0.4881907, 0.5949816, -1.035229, 1, 1, 1, 1, 1,
-0.4856951, -0.3283859, -3.712212, 1, 1, 1, 1, 1,
-0.4840651, 0.5945322, -2.652145, 1, 1, 1, 1, 1,
-0.4821028, -0.5483529, -4.160476, 0, 0, 1, 1, 1,
-0.4749598, 0.4123563, 0.01951597, 1, 0, 0, 1, 1,
-0.4747178, 0.01176387, -1.543244, 1, 0, 0, 1, 1,
-0.4698562, 0.6816322, 0.1190015, 1, 0, 0, 1, 1,
-0.4694024, 0.1652109, -2.414907, 1, 0, 0, 1, 1,
-0.4617994, 0.6334138, -0.7678499, 1, 0, 0, 1, 1,
-0.456888, 0.1825164, -0.01436711, 0, 0, 0, 1, 1,
-0.4543397, 0.9625797, 1.626806, 0, 0, 0, 1, 1,
-0.4514392, 0.2079922, -0.5393165, 0, 0, 0, 1, 1,
-0.4469714, -0.6699207, -2.422038, 0, 0, 0, 1, 1,
-0.4423637, -1.118874, -2.721245, 0, 0, 0, 1, 1,
-0.4377102, -1.375658, -0.8237891, 0, 0, 0, 1, 1,
-0.4374079, -0.8358263, -3.440363, 0, 0, 0, 1, 1,
-0.4367317, -0.3097548, -0.225638, 1, 1, 1, 1, 1,
-0.436278, -1.006017, -2.198729, 1, 1, 1, 1, 1,
-0.4359686, -0.8115327, -3.518783, 1, 1, 1, 1, 1,
-0.4345217, -0.05207158, -2.677, 1, 1, 1, 1, 1,
-0.4318253, -0.1205903, -4.059043, 1, 1, 1, 1, 1,
-0.4286471, 1.283651, -0.7721025, 1, 1, 1, 1, 1,
-0.4282544, -1.397552, -2.315151, 1, 1, 1, 1, 1,
-0.4262519, 0.09084057, -1.332098, 1, 1, 1, 1, 1,
-0.424801, -0.9785645, -2.431676, 1, 1, 1, 1, 1,
-0.4229335, -0.3896475, -1.529594, 1, 1, 1, 1, 1,
-0.4221512, -0.07213502, -1.148293, 1, 1, 1, 1, 1,
-0.4215981, -0.3125883, -1.304453, 1, 1, 1, 1, 1,
-0.4207163, 2.208885, 1.381749, 1, 1, 1, 1, 1,
-0.419947, -1.416261, -3.702055, 1, 1, 1, 1, 1,
-0.4191042, -0.8043293, -4.53327, 1, 1, 1, 1, 1,
-0.4130558, -1.219595, -2.267706, 0, 0, 1, 1, 1,
-0.4120446, 0.3851001, -0.7897277, 1, 0, 0, 1, 1,
-0.4069097, -0.5322618, -2.341913, 1, 0, 0, 1, 1,
-0.4064682, 1.122616, -0.7844326, 1, 0, 0, 1, 1,
-0.4035587, -1.714257, -2.14386, 1, 0, 0, 1, 1,
-0.4027942, -0.4862359, -0.5888995, 1, 0, 0, 1, 1,
-0.3961571, -1.342258, -3.17965, 0, 0, 0, 1, 1,
-0.3889436, -0.02300241, -1.391742, 0, 0, 0, 1, 1,
-0.3839629, -0.03075996, -0.1231283, 0, 0, 0, 1, 1,
-0.3832349, 0.8126482, -0.2323603, 0, 0, 0, 1, 1,
-0.3822472, -0.1389146, -1.227707, 0, 0, 0, 1, 1,
-0.3801955, -0.8087134, -4.786816, 0, 0, 0, 1, 1,
-0.3790651, -0.8456386, -2.146042, 0, 0, 0, 1, 1,
-0.3775451, 0.6069853, -1.993446, 1, 1, 1, 1, 1,
-0.373849, 0.07645326, -0.9714498, 1, 1, 1, 1, 1,
-0.3659953, -3.869654, -1.574667, 1, 1, 1, 1, 1,
-0.3646456, 1.196713, 0.5927588, 1, 1, 1, 1, 1,
-0.3639176, -0.1756954, -2.64123, 1, 1, 1, 1, 1,
-0.3634208, 0.3643205, -0.3308147, 1, 1, 1, 1, 1,
-0.3593995, -1.040178, -2.529159, 1, 1, 1, 1, 1,
-0.3593326, -1.080038, -0.3311351, 1, 1, 1, 1, 1,
-0.3529233, -0.6338059, -3.510741, 1, 1, 1, 1, 1,
-0.3454746, 2.16349, -0.2904736, 1, 1, 1, 1, 1,
-0.3405812, 1.129898, -2.19067, 1, 1, 1, 1, 1,
-0.3401217, -0.746733, -3.300334, 1, 1, 1, 1, 1,
-0.3396566, 0.2921391, -0.14919, 1, 1, 1, 1, 1,
-0.3312329, -1.143509, -3.208153, 1, 1, 1, 1, 1,
-0.3308711, -0.1292152, -1.056741, 1, 1, 1, 1, 1,
-0.3282087, -0.3198654, -1.392246, 0, 0, 1, 1, 1,
-0.3266797, -0.5960602, -3.242064, 1, 0, 0, 1, 1,
-0.3245121, -1.118626, -2.967815, 1, 0, 0, 1, 1,
-0.3231063, -0.2987481, -1.052524, 1, 0, 0, 1, 1,
-0.3204128, 1.308835, -0.0217838, 1, 0, 0, 1, 1,
-0.3203045, -0.2395699, -0.9114439, 1, 0, 0, 1, 1,
-0.31862, -0.1178875, -4.03526, 0, 0, 0, 1, 1,
-0.317486, 1.938443, 1.160676, 0, 0, 0, 1, 1,
-0.3156589, -0.4198669, -2.408146, 0, 0, 0, 1, 1,
-0.3134351, -1.894866, -2.075273, 0, 0, 0, 1, 1,
-0.308723, 0.0518873, -1.621153, 0, 0, 0, 1, 1,
-0.3013264, 1.132241, -1.183509, 0, 0, 0, 1, 1,
-0.2998665, 0.7544494, -1.704466, 0, 0, 0, 1, 1,
-0.297927, -1.642083, -3.703109, 1, 1, 1, 1, 1,
-0.2958549, -0.944748, -4.175052, 1, 1, 1, 1, 1,
-0.2927504, 1.254947, -0.8251636, 1, 1, 1, 1, 1,
-0.2872853, 0.4848612, -2.40978, 1, 1, 1, 1, 1,
-0.2869919, -0.08922327, -0.8123563, 1, 1, 1, 1, 1,
-0.2863185, -2.281765, -2.528364, 1, 1, 1, 1, 1,
-0.2862991, -0.8648655, -0.4514388, 1, 1, 1, 1, 1,
-0.2856895, 0.5319607, -0.6919692, 1, 1, 1, 1, 1,
-0.2787766, -1.326026, -3.130082, 1, 1, 1, 1, 1,
-0.2763355, -0.6775656, -3.32677, 1, 1, 1, 1, 1,
-0.2702677, -0.6615056, -2.95684, 1, 1, 1, 1, 1,
-0.25902, -1.356933, -3.278509, 1, 1, 1, 1, 1,
-0.25306, -0.7449359, -1.946265, 1, 1, 1, 1, 1,
-0.2528505, -0.4979986, -1.961875, 1, 1, 1, 1, 1,
-0.2498399, -0.8510155, -1.643897, 1, 1, 1, 1, 1,
-0.2433861, 0.2836256, -0.9104582, 0, 0, 1, 1, 1,
-0.2400793, 0.1465728, -1.173576, 1, 0, 0, 1, 1,
-0.2394667, -0.439092, -1.313269, 1, 0, 0, 1, 1,
-0.2315435, -1.390621, -3.034258, 1, 0, 0, 1, 1,
-0.2170316, -0.1587074, -2.021397, 1, 0, 0, 1, 1,
-0.213755, -0.850887, -2.52332, 1, 0, 0, 1, 1,
-0.2136279, 0.8368926, -1.638923, 0, 0, 0, 1, 1,
-0.2082267, -1.770812, -3.666981, 0, 0, 0, 1, 1,
-0.2026233, 1.720971, -0.7663089, 0, 0, 0, 1, 1,
-0.2007156, 0.1908181, 0.7555937, 0, 0, 0, 1, 1,
-0.1965003, 0.8932248, 0.9743352, 0, 0, 0, 1, 1,
-0.1927913, -0.288144, -4.259631, 0, 0, 0, 1, 1,
-0.1856154, 1.501229, -0.8680134, 0, 0, 0, 1, 1,
-0.1830546, -0.4982669, -3.378373, 1, 1, 1, 1, 1,
-0.1819589, -0.5526903, -3.618777, 1, 1, 1, 1, 1,
-0.1813034, 0.991726, 0.09726375, 1, 1, 1, 1, 1,
-0.1765316, -0.2523317, -6.602368, 1, 1, 1, 1, 1,
-0.1703159, 1.417867, 2.157946, 1, 1, 1, 1, 1,
-0.16903, 1.734979, 0.5826569, 1, 1, 1, 1, 1,
-0.1672832, 1.897987, 0.2880831, 1, 1, 1, 1, 1,
-0.1661589, -1.549039, -2.776337, 1, 1, 1, 1, 1,
-0.1600095, -1.470678, -1.556509, 1, 1, 1, 1, 1,
-0.152927, -1.9146, -3.29995, 1, 1, 1, 1, 1,
-0.1511929, -0.3135723, -4.079394, 1, 1, 1, 1, 1,
-0.1468539, 0.2140192, -1.142829, 1, 1, 1, 1, 1,
-0.146503, -1.991857, -5.018095, 1, 1, 1, 1, 1,
-0.1463171, 0.426207, -0.9400211, 1, 1, 1, 1, 1,
-0.1457255, -0.2872428, -4.313573, 1, 1, 1, 1, 1,
-0.1429649, -0.11787, -1.753159, 0, 0, 1, 1, 1,
-0.1417498, -0.09900022, -3.340254, 1, 0, 0, 1, 1,
-0.1407793, -0.05864814, -1.284818, 1, 0, 0, 1, 1,
-0.1391293, -0.311781, -3.950167, 1, 0, 0, 1, 1,
-0.1388691, -0.3955955, -3.709523, 1, 0, 0, 1, 1,
-0.1349915, 0.3004974, -0.3243129, 1, 0, 0, 1, 1,
-0.1326087, -0.8063738, -2.374214, 0, 0, 0, 1, 1,
-0.1325983, -1.375311, -4.250188, 0, 0, 0, 1, 1,
-0.131312, 2.090172, 0.615384, 0, 0, 0, 1, 1,
-0.131266, -0.6104075, -0.5131726, 0, 0, 0, 1, 1,
-0.1293561, 1.524782, 1.185164, 0, 0, 0, 1, 1,
-0.1241627, -0.9623042, -2.178221, 0, 0, 0, 1, 1,
-0.1224809, -0.1914936, -2.547717, 0, 0, 0, 1, 1,
-0.1196337, 0.7386588, 0.1919873, 1, 1, 1, 1, 1,
-0.118903, 0.1110032, -1.580155, 1, 1, 1, 1, 1,
-0.1156684, 0.08987448, -1.669171, 1, 1, 1, 1, 1,
-0.1147412, 0.5850366, 0.3464484, 1, 1, 1, 1, 1,
-0.1140069, -1.207938, -4.728408, 1, 1, 1, 1, 1,
-0.1131158, -1.475647, -3.118539, 1, 1, 1, 1, 1,
-0.1123029, -0.05114612, -2.092174, 1, 1, 1, 1, 1,
-0.1049634, 0.46417, -0.8063316, 1, 1, 1, 1, 1,
-0.1019356, 0.5992077, 1.04937, 1, 1, 1, 1, 1,
-0.09907851, -1.027652, -1.64937, 1, 1, 1, 1, 1,
-0.09498107, -1.23294, -2.716383, 1, 1, 1, 1, 1,
-0.09222025, -0.8059306, -4.93926, 1, 1, 1, 1, 1,
-0.09093501, -0.391568, -3.235948, 1, 1, 1, 1, 1,
-0.09034061, -1.029266, -3.788145, 1, 1, 1, 1, 1,
-0.09030473, -1.472359, -3.318872, 1, 1, 1, 1, 1,
-0.08829276, 1.084628, 1.052184, 0, 0, 1, 1, 1,
-0.08731309, -0.2447062, -2.151942, 1, 0, 0, 1, 1,
-0.08670993, -0.8619528, -3.134098, 1, 0, 0, 1, 1,
-0.08520397, -0.4863511, -2.914698, 1, 0, 0, 1, 1,
-0.08452614, -1.817515, -3.506684, 1, 0, 0, 1, 1,
-0.08410562, 0.008042781, -2.313792, 1, 0, 0, 1, 1,
-0.08349809, -1.260681, -4.395602, 0, 0, 0, 1, 1,
-0.08162878, 0.4855341, 0.2883314, 0, 0, 0, 1, 1,
-0.08151608, -1.504023, -1.787068, 0, 0, 0, 1, 1,
-0.08052493, 0.1180551, 0.07962409, 0, 0, 0, 1, 1,
-0.07934669, -0.8898497, -1.710062, 0, 0, 0, 1, 1,
-0.07587889, 0.5517651, 0.9919679, 0, 0, 0, 1, 1,
-0.07207399, -0.8312674, -3.994397, 0, 0, 0, 1, 1,
-0.0712234, -0.9804797, -3.086279, 1, 1, 1, 1, 1,
-0.07043461, 1.153447, 1.300667, 1, 1, 1, 1, 1,
-0.06837845, -1.334393, -2.248028, 1, 1, 1, 1, 1,
-0.06749392, 0.8697895, -2.101196, 1, 1, 1, 1, 1,
-0.06307164, 1.259456, -1.595912, 1, 1, 1, 1, 1,
-0.0620222, -0.897406, -3.553899, 1, 1, 1, 1, 1,
-0.05702256, -1.447761, -3.988316, 1, 1, 1, 1, 1,
-0.05394709, 1.064767, -0.1631931, 1, 1, 1, 1, 1,
-0.05078388, -0.888867, -2.553218, 1, 1, 1, 1, 1,
-0.0475128, -0.05182686, -4.025633, 1, 1, 1, 1, 1,
-0.04506114, -0.6645206, -3.634737, 1, 1, 1, 1, 1,
-0.04286854, -0.2268843, -4.181898, 1, 1, 1, 1, 1,
-0.04219818, 1.324975, -1.179961, 1, 1, 1, 1, 1,
-0.04187277, -0.7299601, -2.680411, 1, 1, 1, 1, 1,
-0.03383308, 0.1934528, -0.720815, 1, 1, 1, 1, 1,
-0.03360527, 0.1687856, -0.7523278, 0, 0, 1, 1, 1,
-0.0282646, -0.8945347, -3.135731, 1, 0, 0, 1, 1,
-0.02806013, 1.221129, 1.090198, 1, 0, 0, 1, 1,
-0.02725135, -0.390851, -3.399493, 1, 0, 0, 1, 1,
-0.02334078, -0.3409299, -4.211493, 1, 0, 0, 1, 1,
-0.02202485, -1.668078, -2.894542, 1, 0, 0, 1, 1,
-0.01966512, 1.121023, 0.5153256, 0, 0, 0, 1, 1,
-0.01848025, -2.350167, -4.370317, 0, 0, 0, 1, 1,
-0.01808385, 0.8993747, 1.690877, 0, 0, 0, 1, 1,
-0.01749124, -1.620633, -2.652491, 0, 0, 0, 1, 1,
-0.01543432, -0.5385386, -1.291949, 0, 0, 0, 1, 1,
-0.01492118, 1.708846, -0.3238932, 0, 0, 0, 1, 1,
-0.008634731, 1.202467, 2.249848, 0, 0, 0, 1, 1,
-0.002682973, 1.226378, -0.6778988, 1, 1, 1, 1, 1,
0.002125963, 0.3293837, -1.938192, 1, 1, 1, 1, 1,
0.002831965, 0.5276684, -0.7047557, 1, 1, 1, 1, 1,
0.004223383, 0.5169548, 1.272444, 1, 1, 1, 1, 1,
0.01077348, 1.813136, 0.1338271, 1, 1, 1, 1, 1,
0.01144514, -0.4733098, 3.974669, 1, 1, 1, 1, 1,
0.01378062, -1.431356, 4.626931, 1, 1, 1, 1, 1,
0.01578482, 0.2719779, -0.4256252, 1, 1, 1, 1, 1,
0.02243359, -0.2628132, 2.152446, 1, 1, 1, 1, 1,
0.02555319, 0.7096642, -0.7625515, 1, 1, 1, 1, 1,
0.02555525, -1.202125, 1.975003, 1, 1, 1, 1, 1,
0.0262842, -0.02818761, 2.288036, 1, 1, 1, 1, 1,
0.02642783, 0.3851619, -0.06760207, 1, 1, 1, 1, 1,
0.02900573, 0.1025098, 0.2274651, 1, 1, 1, 1, 1,
0.03315505, -0.7087098, 3.819057, 1, 1, 1, 1, 1,
0.03457838, -0.2710982, 3.017653, 0, 0, 1, 1, 1,
0.03879414, 0.5525804, -0.6376713, 1, 0, 0, 1, 1,
0.04680197, -1.22454, 2.173292, 1, 0, 0, 1, 1,
0.05034302, -0.3245294, 4.253673, 1, 0, 0, 1, 1,
0.06220073, -0.09713455, 1.950123, 1, 0, 0, 1, 1,
0.0624533, -0.4568741, 0.1869902, 1, 0, 0, 1, 1,
0.06389297, -1.388136, 1.657204, 0, 0, 0, 1, 1,
0.06507596, 1.948805, 1.007926, 0, 0, 0, 1, 1,
0.06658787, 1.173798, 1.16425, 0, 0, 0, 1, 1,
0.06968874, -0.03822273, 2.723523, 0, 0, 0, 1, 1,
0.07047971, -1.503276, 2.225417, 0, 0, 0, 1, 1,
0.07115693, 1.0106, -0.8595552, 0, 0, 0, 1, 1,
0.07673603, 0.8853298, -1.101044, 0, 0, 0, 1, 1,
0.07716289, 0.01405508, 2.998168, 1, 1, 1, 1, 1,
0.07985125, -0.4691158, 2.126846, 1, 1, 1, 1, 1,
0.09548164, 0.7596841, -1.859547, 1, 1, 1, 1, 1,
0.1039598, -0.08366016, 1.628516, 1, 1, 1, 1, 1,
0.1061381, -0.8779284, 2.178014, 1, 1, 1, 1, 1,
0.1087929, 0.5462422, 0.9423775, 1, 1, 1, 1, 1,
0.1099021, 0.9933394, -0.06843869, 1, 1, 1, 1, 1,
0.1120581, -0.8031859, 3.386886, 1, 1, 1, 1, 1,
0.1129971, 1.305133, 2.102676, 1, 1, 1, 1, 1,
0.1167229, 0.3108982, -0.1126341, 1, 1, 1, 1, 1,
0.1202468, 0.23974, 1.471574, 1, 1, 1, 1, 1,
0.1218712, 0.3139803, 0.7464033, 1, 1, 1, 1, 1,
0.1275059, -0.01105123, 1.942542, 1, 1, 1, 1, 1,
0.128624, 1.228317, -0.1051707, 1, 1, 1, 1, 1,
0.13393, -0.0910093, 2.481047, 1, 1, 1, 1, 1,
0.136025, 0.3883176, 0.5210122, 0, 0, 1, 1, 1,
0.139116, -2.958322, 2.809434, 1, 0, 0, 1, 1,
0.1395655, 0.4718595, 1.217009, 1, 0, 0, 1, 1,
0.1420825, 0.7116667, -0.4757782, 1, 0, 0, 1, 1,
0.1435195, -0.1987953, 3.270872, 1, 0, 0, 1, 1,
0.1455885, 0.1289533, 1.447438, 1, 0, 0, 1, 1,
0.1482896, -0.765135, 1.804103, 0, 0, 0, 1, 1,
0.1568444, 0.3051689, 0.9345055, 0, 0, 0, 1, 1,
0.1636941, -0.604015, 2.867701, 0, 0, 0, 1, 1,
0.1660063, -0.8021278, 3.020962, 0, 0, 0, 1, 1,
0.1693826, -0.3613429, 1.890518, 0, 0, 0, 1, 1,
0.1717808, -0.8705534, 1.283286, 0, 0, 0, 1, 1,
0.1740511, -0.1420164, 3.164102, 0, 0, 0, 1, 1,
0.1782473, 1.102393, 0.01931298, 1, 1, 1, 1, 1,
0.1783939, 0.6213242, -0.5479854, 1, 1, 1, 1, 1,
0.1826093, -0.2714558, 2.243551, 1, 1, 1, 1, 1,
0.1839455, -0.2253193, 3.162228, 1, 1, 1, 1, 1,
0.1862956, -0.6101142, 2.269067, 1, 1, 1, 1, 1,
0.1900854, 1.758093, 0.5146893, 1, 1, 1, 1, 1,
0.1915144, -1.896653, 3.779208, 1, 1, 1, 1, 1,
0.1918874, -1.858885, 5.810846, 1, 1, 1, 1, 1,
0.1935326, -0.05990679, 1.696725, 1, 1, 1, 1, 1,
0.1936824, -2.189027, 5.016122, 1, 1, 1, 1, 1,
0.1975985, -0.7070928, 3.274314, 1, 1, 1, 1, 1,
0.2005343, -0.4073193, 2.639907, 1, 1, 1, 1, 1,
0.2046715, 0.3024655, 1.724319, 1, 1, 1, 1, 1,
0.2070658, 1.146957, 0.4223273, 1, 1, 1, 1, 1,
0.2084736, 0.9124516, -0.4420103, 1, 1, 1, 1, 1,
0.2090856, -1.337038, 3.847679, 0, 0, 1, 1, 1,
0.2106981, 1.303304, -1.315653, 1, 0, 0, 1, 1,
0.2120084, -0.4383847, 2.111151, 1, 0, 0, 1, 1,
0.2141347, -1.03641, 3.441137, 1, 0, 0, 1, 1,
0.2170144, -0.3683411, 4.930312, 1, 0, 0, 1, 1,
0.2180164, -0.123953, 3.794131, 1, 0, 0, 1, 1,
0.2214475, 0.002790142, 1.213056, 0, 0, 0, 1, 1,
0.224396, -2.983673, 3.985594, 0, 0, 0, 1, 1,
0.2326851, 0.9728892, 0.3915143, 0, 0, 0, 1, 1,
0.2328564, 0.2648774, 0.6096663, 0, 0, 0, 1, 1,
0.2342165, -2.292552, 3.390101, 0, 0, 0, 1, 1,
0.2367599, -0.2085831, 2.687218, 0, 0, 0, 1, 1,
0.2408468, -2.469941, 2.547081, 0, 0, 0, 1, 1,
0.2430879, -0.5557826, 2.108094, 1, 1, 1, 1, 1,
0.2541222, -0.08665676, 2.960994, 1, 1, 1, 1, 1,
0.2543017, -0.2315664, 1.195875, 1, 1, 1, 1, 1,
0.2551503, -0.07940537, 2.465768, 1, 1, 1, 1, 1,
0.2652002, -0.8302138, 2.254407, 1, 1, 1, 1, 1,
0.266721, -1.81647, 1.618525, 1, 1, 1, 1, 1,
0.270999, -0.2146059, 3.288257, 1, 1, 1, 1, 1,
0.271773, -0.3409066, 2.737672, 1, 1, 1, 1, 1,
0.2726811, 0.5075378, 1.678333, 1, 1, 1, 1, 1,
0.2770779, -0.8197981, 1.687698, 1, 1, 1, 1, 1,
0.2788976, 0.4938953, 1.238209, 1, 1, 1, 1, 1,
0.2801156, 0.8598003, 1.540641, 1, 1, 1, 1, 1,
0.2840947, 0.7072242, -0.4311115, 1, 1, 1, 1, 1,
0.2866307, -0.1331586, 1.009112, 1, 1, 1, 1, 1,
0.2885657, -0.7863734, 4.465876, 1, 1, 1, 1, 1,
0.288606, 0.4391262, 0.3287004, 0, 0, 1, 1, 1,
0.2938541, 0.1760401, 1.062477, 1, 0, 0, 1, 1,
0.2968798, -1.867662, 2.846249, 1, 0, 0, 1, 1,
0.2981486, 0.6416029, 0.03407531, 1, 0, 0, 1, 1,
0.2982975, -0.953868, 1.966555, 1, 0, 0, 1, 1,
0.2989203, -0.1068599, 4.330921, 1, 0, 0, 1, 1,
0.3026572, 1.225146, -0.1237953, 0, 0, 0, 1, 1,
0.3043884, 0.3393849, 1.012794, 0, 0, 0, 1, 1,
0.3053499, 0.04302874, 0.1407611, 0, 0, 0, 1, 1,
0.3116251, -1.305532, 2.252919, 0, 0, 0, 1, 1,
0.3119957, -0.2699708, 2.497816, 0, 0, 0, 1, 1,
0.3138752, 1.488433, 0.2125526, 0, 0, 0, 1, 1,
0.3145543, 1.095377, -1.23456, 0, 0, 0, 1, 1,
0.3171011, -0.2095489, 3.621721, 1, 1, 1, 1, 1,
0.3174949, 1.099146, -1.092758, 1, 1, 1, 1, 1,
0.319187, 1.13882, -0.2711242, 1, 1, 1, 1, 1,
0.3192233, 0.8206046, 0.04981532, 1, 1, 1, 1, 1,
0.3263065, -0.926133, 2.001415, 1, 1, 1, 1, 1,
0.3282738, -0.6590968, 2.238023, 1, 1, 1, 1, 1,
0.3343984, 0.5374082, -0.06535, 1, 1, 1, 1, 1,
0.3398041, -0.2317786, 2.674169, 1, 1, 1, 1, 1,
0.3416028, 0.6947616, -0.5014505, 1, 1, 1, 1, 1,
0.3540304, 1.181607, -0.2150659, 1, 1, 1, 1, 1,
0.354782, 1.387618, -0.2183627, 1, 1, 1, 1, 1,
0.3573607, -0.4109969, 3.072287, 1, 1, 1, 1, 1,
0.3592657, -0.1013873, 3.490459, 1, 1, 1, 1, 1,
0.3601379, 0.5185418, -0.408445, 1, 1, 1, 1, 1,
0.3687418, -0.321116, 3.93099, 1, 1, 1, 1, 1,
0.3690782, -0.5021416, 2.834695, 0, 0, 1, 1, 1,
0.3752876, 1.514311, 0.797852, 1, 0, 0, 1, 1,
0.375368, -0.5080092, 2.53724, 1, 0, 0, 1, 1,
0.3795309, 0.8581703, 1.986217, 1, 0, 0, 1, 1,
0.3846484, -0.03635884, 2.853237, 1, 0, 0, 1, 1,
0.3866844, -0.7225193, 1.607067, 1, 0, 0, 1, 1,
0.3885819, 0.7803886, 0.7078072, 0, 0, 0, 1, 1,
0.3901257, -2.506576, 2.188829, 0, 0, 0, 1, 1,
0.3910302, -1.176805, 4.10352, 0, 0, 0, 1, 1,
0.3918351, 1.987224, 0.7020125, 0, 0, 0, 1, 1,
0.3984598, 1.574776, -0.3772546, 0, 0, 0, 1, 1,
0.4015906, -0.183305, 2.2786, 0, 0, 0, 1, 1,
0.403393, -0.8517618, 4.244001, 0, 0, 0, 1, 1,
0.4069116, 0.4814585, 1.333642, 1, 1, 1, 1, 1,
0.4080881, -1.472354, 2.464649, 1, 1, 1, 1, 1,
0.4138912, -1.113859, 2.332035, 1, 1, 1, 1, 1,
0.4174569, -0.4789881, 1.462569, 1, 1, 1, 1, 1,
0.4203261, 0.2986217, 2.888733, 1, 1, 1, 1, 1,
0.4216476, 0.7112661, -0.6826307, 1, 1, 1, 1, 1,
0.423185, 0.8527719, 0.2198294, 1, 1, 1, 1, 1,
0.4241479, -1.626118, 1.952563, 1, 1, 1, 1, 1,
0.4313486, 0.5580069, 2.427746, 1, 1, 1, 1, 1,
0.4443743, 1.853607, -0.4028499, 1, 1, 1, 1, 1,
0.4535779, -0.7418873, 2.417277, 1, 1, 1, 1, 1,
0.4583163, -0.4696322, 2.057759, 1, 1, 1, 1, 1,
0.4589826, -0.5860171, 2.142202, 1, 1, 1, 1, 1,
0.4596967, 0.4004099, 1.109378, 1, 1, 1, 1, 1,
0.4678878, -1.03032, 3.235856, 1, 1, 1, 1, 1,
0.468406, -0.1382071, 1.569026, 0, 0, 1, 1, 1,
0.4705549, 0.7094063, -0.2975201, 1, 0, 0, 1, 1,
0.470719, 0.4343977, 2.032865, 1, 0, 0, 1, 1,
0.4723408, -0.03985843, -0.5013518, 1, 0, 0, 1, 1,
0.4726391, -1.228448, 2.203848, 1, 0, 0, 1, 1,
0.4842456, -0.6023125, 0.8846368, 1, 0, 0, 1, 1,
0.4901999, -0.2602205, 1.186933, 0, 0, 0, 1, 1,
0.4902405, 0.4506069, 0.7923297, 0, 0, 0, 1, 1,
0.4920542, 1.629414, -0.006867679, 0, 0, 0, 1, 1,
0.492625, -1.343527, 2.18618, 0, 0, 0, 1, 1,
0.4933653, 0.1424658, 0.4382586, 0, 0, 0, 1, 1,
0.497855, 1.144426, -0.3533091, 0, 0, 0, 1, 1,
0.5021524, 0.4080423, 1.728413, 0, 0, 0, 1, 1,
0.5023085, -0.02358384, 0.9320772, 1, 1, 1, 1, 1,
0.5026721, 0.2945459, 0.3828281, 1, 1, 1, 1, 1,
0.5027343, -0.5800321, 3.017073, 1, 1, 1, 1, 1,
0.503244, -0.4627989, 3.074728, 1, 1, 1, 1, 1,
0.5060453, 0.9747888, 0.957576, 1, 1, 1, 1, 1,
0.5070158, 1.315915, 1.218368, 1, 1, 1, 1, 1,
0.5213454, 0.00838675, 0.9257212, 1, 1, 1, 1, 1,
0.5220101, -0.05023153, 2.10708, 1, 1, 1, 1, 1,
0.5253756, 0.8199556, 1.244519, 1, 1, 1, 1, 1,
0.5266404, 1.194748, -0.6027499, 1, 1, 1, 1, 1,
0.5307004, -0.2270052, 1.749541, 1, 1, 1, 1, 1,
0.5362049, -1.320424, 4.070035, 1, 1, 1, 1, 1,
0.5385453, 1.361815, 2.641537, 1, 1, 1, 1, 1,
0.5402623, -0.04978329, 3.560603, 1, 1, 1, 1, 1,
0.5403342, -0.2737093, 0.9749555, 1, 1, 1, 1, 1,
0.543284, -0.03696946, 1.834551, 0, 0, 1, 1, 1,
0.5459369, 0.5167962, 1.468239, 1, 0, 0, 1, 1,
0.5476225, 1.859021, 0.7399057, 1, 0, 0, 1, 1,
0.5490704, -0.7147762, 3.240742, 1, 0, 0, 1, 1,
0.552849, -0.09002861, 3.174861, 1, 0, 0, 1, 1,
0.5555583, -0.2661138, 0.2175447, 1, 0, 0, 1, 1,
0.5584728, 0.3035387, 1.556187, 0, 0, 0, 1, 1,
0.5681849, 1.176833, 0.1004656, 0, 0, 0, 1, 1,
0.5694361, -0.8540232, 2.59975, 0, 0, 0, 1, 1,
0.572813, -1.896355, 3.154792, 0, 0, 0, 1, 1,
0.5730817, 0.4746191, 2.695492, 0, 0, 0, 1, 1,
0.5765827, 0.7044922, 1.812547, 0, 0, 0, 1, 1,
0.5795984, 0.09458285, 1.230666, 0, 0, 0, 1, 1,
0.5807534, -1.763815, 3.229874, 1, 1, 1, 1, 1,
0.594049, 1.413035, -0.1707914, 1, 1, 1, 1, 1,
0.6006367, 0.01200508, 2.467523, 1, 1, 1, 1, 1,
0.6010156, -1.416061, 2.299981, 1, 1, 1, 1, 1,
0.6023694, 0.2788102, 2.840572, 1, 1, 1, 1, 1,
0.6059404, 0.6647958, -0.9116303, 1, 1, 1, 1, 1,
0.6065283, -0.8715016, 3.224665, 1, 1, 1, 1, 1,
0.6083535, 0.3861611, 1.682325, 1, 1, 1, 1, 1,
0.6176757, 2.077435, 0.8964323, 1, 1, 1, 1, 1,
0.624781, 1.57287, 1.575248, 1, 1, 1, 1, 1,
0.6296779, 0.03016672, 0.5367737, 1, 1, 1, 1, 1,
0.6297633, -0.9142285, 1.830067, 1, 1, 1, 1, 1,
0.6344227, -0.3810396, 3.187703, 1, 1, 1, 1, 1,
0.6350977, -1.566151, 2.528876, 1, 1, 1, 1, 1,
0.6363449, -0.5069038, 2.170309, 1, 1, 1, 1, 1,
0.6388514, -0.1847041, 0.7247249, 0, 0, 1, 1, 1,
0.6403452, -0.9183978, 2.777395, 1, 0, 0, 1, 1,
0.6404398, 1.380459, -0.7140236, 1, 0, 0, 1, 1,
0.6409619, 0.4830987, -0.4436798, 1, 0, 0, 1, 1,
0.6415136, 0.6283926, 0.009312988, 1, 0, 0, 1, 1,
0.6433979, -0.2763597, 3.116718, 1, 0, 0, 1, 1,
0.6453653, 0.09518857, 1.574958, 0, 0, 0, 1, 1,
0.6489848, 0.7106203, -0.2894049, 0, 0, 0, 1, 1,
0.6542851, 2.11963, 1.856113, 0, 0, 0, 1, 1,
0.6569619, -0.1362456, 1.488539, 0, 0, 0, 1, 1,
0.6617412, -0.1707532, 1.997476, 0, 0, 0, 1, 1,
0.6644722, 0.8978901, 0.2232044, 0, 0, 0, 1, 1,
0.668256, 1.326324, 1.525041, 0, 0, 0, 1, 1,
0.6757188, -0.5944732, 1.745382, 1, 1, 1, 1, 1,
0.6815387, 0.2171861, 0.8248023, 1, 1, 1, 1, 1,
0.6826822, -0.2594887, 0.8871005, 1, 1, 1, 1, 1,
0.6830592, 0.6717826, 3.025924, 1, 1, 1, 1, 1,
0.6855658, 0.9290443, 1.404622, 1, 1, 1, 1, 1,
0.6883337, -0.553332, 2.06266, 1, 1, 1, 1, 1,
0.6897859, -0.5254616, 2.986549, 1, 1, 1, 1, 1,
0.6932806, -0.2059045, 2.578654, 1, 1, 1, 1, 1,
0.6964398, -0.6967796, 0.6965344, 1, 1, 1, 1, 1,
0.6988779, -0.1397024, 2.052594, 1, 1, 1, 1, 1,
0.699008, 1.24851, 2.359914, 1, 1, 1, 1, 1,
0.6997404, -0.5652711, 2.908804, 1, 1, 1, 1, 1,
0.7001284, 0.0003260058, 4.023617, 1, 1, 1, 1, 1,
0.7003075, 0.6222239, 2.240041, 1, 1, 1, 1, 1,
0.7039958, 1.172543, 0.4554209, 1, 1, 1, 1, 1,
0.7079341, 0.3762702, 2.376526, 0, 0, 1, 1, 1,
0.7081072, -1.538445, 0.08677956, 1, 0, 0, 1, 1,
0.7169593, -1.020807, 2.17803, 1, 0, 0, 1, 1,
0.7254726, -2.008628, 3.833825, 1, 0, 0, 1, 1,
0.7311186, 1.242186, 0.8516157, 1, 0, 0, 1, 1,
0.7322835, -1.242341, 3.604524, 1, 0, 0, 1, 1,
0.7342437, 2.119691, 0.9259433, 0, 0, 0, 1, 1,
0.7459412, -0.00817949, 0.7639937, 0, 0, 0, 1, 1,
0.7484873, -0.2382757, 0.9917492, 0, 0, 0, 1, 1,
0.749651, 1.426876, 1.262506, 0, 0, 0, 1, 1,
0.7516974, 0.01096811, 2.115952, 0, 0, 0, 1, 1,
0.7552941, 0.5471882, 2.266013, 0, 0, 0, 1, 1,
0.7554907, 2.506175, -1.692673, 0, 0, 0, 1, 1,
0.7629718, 0.04688749, 0.3328804, 1, 1, 1, 1, 1,
0.7637516, -0.5834311, 2.583143, 1, 1, 1, 1, 1,
0.7670826, 0.2080617, 0.7463065, 1, 1, 1, 1, 1,
0.7702058, -0.9048252, 3.062368, 1, 1, 1, 1, 1,
0.7735831, -1.159884, 1.719641, 1, 1, 1, 1, 1,
0.77696, 2.508055, 1.230662, 1, 1, 1, 1, 1,
0.7802479, -1.22857, 2.446467, 1, 1, 1, 1, 1,
0.7820396, -1.011681, 3.315562, 1, 1, 1, 1, 1,
0.7825909, -0.06035591, 2.542068, 1, 1, 1, 1, 1,
0.7827452, 0.1928496, -0.06717589, 1, 1, 1, 1, 1,
0.7851278, -0.9153686, 3.186857, 1, 1, 1, 1, 1,
0.7873668, -0.6530228, 1.586677, 1, 1, 1, 1, 1,
0.7950684, 0.9895337, 0.2974979, 1, 1, 1, 1, 1,
0.7994546, -0.5515019, 3.167833, 1, 1, 1, 1, 1,
0.805577, -0.6376813, 1.839529, 1, 1, 1, 1, 1,
0.8085118, 1.137689, -0.7085223, 0, 0, 1, 1, 1,
0.8088998, 0.3985023, 1.187428, 1, 0, 0, 1, 1,
0.8097962, -0.6661444, 2.052819, 1, 0, 0, 1, 1,
0.8106909, -0.7441489, 2.170877, 1, 0, 0, 1, 1,
0.8129053, 0.122537, 2.249506, 1, 0, 0, 1, 1,
0.8141345, -0.26916, 1.672123, 1, 0, 0, 1, 1,
0.8174031, -0.08304343, 1.860233, 0, 0, 0, 1, 1,
0.8196009, -0.3589495, 1.698768, 0, 0, 0, 1, 1,
0.8210773, 1.981295, 2.427543, 0, 0, 0, 1, 1,
0.8217787, -0.296622, 1.887076, 0, 0, 0, 1, 1,
0.8224382, -0.5673583, 1.589393, 0, 0, 0, 1, 1,
0.8258598, -1.170785, 2.196075, 0, 0, 0, 1, 1,
0.8274902, -0.6401313, 2.273176, 0, 0, 0, 1, 1,
0.829769, 0.5465752, 2.237272, 1, 1, 1, 1, 1,
0.831593, -0.988848, 2.467659, 1, 1, 1, 1, 1,
0.8323981, 1.319775, 0.9591976, 1, 1, 1, 1, 1,
0.8382318, -0.1463571, 1.575147, 1, 1, 1, 1, 1,
0.8397704, -1.175215, 1.265813, 1, 1, 1, 1, 1,
0.8457301, -1.005555, 2.291586, 1, 1, 1, 1, 1,
0.8533704, -0.3529763, 3.225964, 1, 1, 1, 1, 1,
0.8575937, -0.07762799, 1.149272, 1, 1, 1, 1, 1,
0.8667591, -0.2423741, 2.285371, 1, 1, 1, 1, 1,
0.8688571, -1.175907, 4.636347, 1, 1, 1, 1, 1,
0.8689782, 0.8115291, 1.673495, 1, 1, 1, 1, 1,
0.8704277, -1.532028, 1.778437, 1, 1, 1, 1, 1,
0.8718817, 1.911078, 0.4537962, 1, 1, 1, 1, 1,
0.8764515, -0.7859741, 1.712049, 1, 1, 1, 1, 1,
0.8781939, -1.847122, 0.7438424, 1, 1, 1, 1, 1,
0.8843914, -2.002613, 3.765238, 0, 0, 1, 1, 1,
0.886296, -0.723468, 1.655848, 1, 0, 0, 1, 1,
0.8906432, -0.2812401, 2.935534, 1, 0, 0, 1, 1,
0.8934355, -0.1212381, 2.715496, 1, 0, 0, 1, 1,
0.8949717, 0.8867744, -0.4972107, 1, 0, 0, 1, 1,
0.8968913, -1.274851, 3.821188, 1, 0, 0, 1, 1,
0.8987397, -1.172836, 3.445858, 0, 0, 0, 1, 1,
0.900376, -1.162028, 2.117662, 0, 0, 0, 1, 1,
0.9008696, -1.461235, 2.871172, 0, 0, 0, 1, 1,
0.904177, -0.433371, 2.412039, 0, 0, 0, 1, 1,
0.904862, -1.319411, 2.507432, 0, 0, 0, 1, 1,
0.9053521, -2.312647, 3.946815, 0, 0, 0, 1, 1,
0.9183264, 0.816398, -0.1050094, 0, 0, 0, 1, 1,
0.9195893, -2.462034, 3.862415, 1, 1, 1, 1, 1,
0.9201684, -0.1407938, 3.141003, 1, 1, 1, 1, 1,
0.9227943, 0.2323575, 2.764409, 1, 1, 1, 1, 1,
0.9238733, -0.8960901, 2.381261, 1, 1, 1, 1, 1,
0.9268507, -0.8689312, 2.506773, 1, 1, 1, 1, 1,
0.9319096, 0.553347, -0.6155688, 1, 1, 1, 1, 1,
0.9374627, -0.3224257, 1.261102, 1, 1, 1, 1, 1,
0.9406524, 0.4242028, 0.3533109, 1, 1, 1, 1, 1,
0.9415732, 2.492791, -0.7101006, 1, 1, 1, 1, 1,
0.9465859, -1.568149, 3.202229, 1, 1, 1, 1, 1,
0.9474858, 0.213459, 2.271916, 1, 1, 1, 1, 1,
0.9502954, 0.6528804, 1.14279, 1, 1, 1, 1, 1,
0.9507592, 0.6778895, 1.721244, 1, 1, 1, 1, 1,
0.9512874, -1.409689, 2.065915, 1, 1, 1, 1, 1,
0.9548589, -0.2211144, 2.062603, 1, 1, 1, 1, 1,
0.9611788, 0.02026901, 0.536647, 0, 0, 1, 1, 1,
0.9684513, 0.1709609, 1.827772, 1, 0, 0, 1, 1,
0.9733056, -0.07099865, -0.1965637, 1, 0, 0, 1, 1,
0.9734118, 0.8294815, 0.887925, 1, 0, 0, 1, 1,
0.9799686, -0.78913, 3.270391, 1, 0, 0, 1, 1,
0.9831747, 0.06735937, -0.8683189, 1, 0, 0, 1, 1,
0.9848356, 1.700218, 0.9030877, 0, 0, 0, 1, 1,
0.988116, 0.5372481, 1.52143, 0, 0, 0, 1, 1,
0.988117, -0.1382961, 3.172521, 0, 0, 0, 1, 1,
0.989857, -1.920791, 2.53003, 0, 0, 0, 1, 1,
1.001881, -0.7537369, 3.294359, 0, 0, 0, 1, 1,
1.003125, -0.8394101, 3.646896, 0, 0, 0, 1, 1,
1.004649, -0.169469, 2.133559, 0, 0, 0, 1, 1,
1.006323, -1.099129, 2.029243, 1, 1, 1, 1, 1,
1.01146, -1.442065, 3.637667, 1, 1, 1, 1, 1,
1.013791, -0.3404045, 2.169309, 1, 1, 1, 1, 1,
1.016591, 0.359495, 1.673709, 1, 1, 1, 1, 1,
1.01771, -0.1133618, 1.150833, 1, 1, 1, 1, 1,
1.020504, 1.163429, -0.7584391, 1, 1, 1, 1, 1,
1.022149, 0.2727691, -0.9715275, 1, 1, 1, 1, 1,
1.030304, 0.7044933, 3.561965, 1, 1, 1, 1, 1,
1.038611, 1.459665, -0.07881147, 1, 1, 1, 1, 1,
1.041088, 0.7719638, 0.687292, 1, 1, 1, 1, 1,
1.047131, 0.985909, 0.9369259, 1, 1, 1, 1, 1,
1.051265, -0.3132538, 2.635957, 1, 1, 1, 1, 1,
1.05313, 0.6801577, 1.709195, 1, 1, 1, 1, 1,
1.056427, -0.7287807, 2.328946, 1, 1, 1, 1, 1,
1.059175, 0.1552768, 1.406031, 1, 1, 1, 1, 1,
1.070879, -0.4148343, 2.738059, 0, 0, 1, 1, 1,
1.076156, 0.1492718, 1.754483, 1, 0, 0, 1, 1,
1.077972, -0.7166731, 0.2415616, 1, 0, 0, 1, 1,
1.082245, 0.3686556, 2.234508, 1, 0, 0, 1, 1,
1.085708, 0.8425739, 1.556, 1, 0, 0, 1, 1,
1.086021, -0.3065191, 1.986963, 1, 0, 0, 1, 1,
1.086494, 0.5723773, 1.754106, 0, 0, 0, 1, 1,
1.090827, -1.089088, 4.119226, 0, 0, 0, 1, 1,
1.092258, -0.8136716, 2.390116, 0, 0, 0, 1, 1,
1.099684, 0.04405449, 2.858862, 0, 0, 0, 1, 1,
1.101459, 0.2086562, 0.3873708, 0, 0, 0, 1, 1,
1.101799, 1.537581, 0.5189674, 0, 0, 0, 1, 1,
1.104825, 0.9171333, 1.636045, 0, 0, 0, 1, 1,
1.105072, 0.07015625, 2.445017, 1, 1, 1, 1, 1,
1.109553, -0.4836341, 1.697769, 1, 1, 1, 1, 1,
1.110887, -1.146586, 2.405783, 1, 1, 1, 1, 1,
1.111104, 0.07988211, 1.21164, 1, 1, 1, 1, 1,
1.113966, 1.1752, 1.635137, 1, 1, 1, 1, 1,
1.126559, -0.3114163, 3.110213, 1, 1, 1, 1, 1,
1.127595, -0.8619092, 2.160744, 1, 1, 1, 1, 1,
1.128705, -0.828702, 1.377767, 1, 1, 1, 1, 1,
1.132709, -0.6202892, 2.343364, 1, 1, 1, 1, 1,
1.139887, 0.5178441, 3.224086, 1, 1, 1, 1, 1,
1.14656, 0.3978264, 1.940861, 1, 1, 1, 1, 1,
1.149512, -0.8858199, 4.491479, 1, 1, 1, 1, 1,
1.152654, -0.7767856, 1.472393, 1, 1, 1, 1, 1,
1.154815, -2.441926, 1.674362, 1, 1, 1, 1, 1,
1.155018, -1.592235, 1.571324, 1, 1, 1, 1, 1,
1.155429, -0.2128506, 1.119898, 0, 0, 1, 1, 1,
1.162108, -0.6918246, 1.832619, 1, 0, 0, 1, 1,
1.165888, -0.8644705, 1.417044, 1, 0, 0, 1, 1,
1.169562, 0.8711827, 0.4784737, 1, 0, 0, 1, 1,
1.17187, 1.099626, 0.3773047, 1, 0, 0, 1, 1,
1.175075, 0.1969087, 0.3628769, 1, 0, 0, 1, 1,
1.176901, -1.555845, 1.49714, 0, 0, 0, 1, 1,
1.190462, -0.1223469, 2.815744, 0, 0, 0, 1, 1,
1.190977, -1.580646, 1.479675, 0, 0, 0, 1, 1,
1.197292, -0.5645304, 2.502049, 0, 0, 0, 1, 1,
1.209701, 0.4334059, 0.8314605, 0, 0, 0, 1, 1,
1.21023, 1.319629, 0.05241767, 0, 0, 0, 1, 1,
1.21315, -0.5273079, 3.484741, 0, 0, 0, 1, 1,
1.216442, -0.3130914, 2.701056, 1, 1, 1, 1, 1,
1.221024, -1.640749, 1.847561, 1, 1, 1, 1, 1,
1.224732, -0.002307999, 1.797257, 1, 1, 1, 1, 1,
1.225133, -0.4757878, 1.819508, 1, 1, 1, 1, 1,
1.227754, 1.299865, -0.2053428, 1, 1, 1, 1, 1,
1.228288, -0.1799988, 1.265273, 1, 1, 1, 1, 1,
1.235634, 0.8402814, 1.805549, 1, 1, 1, 1, 1,
1.237371, 0.9527302, 0.7920529, 1, 1, 1, 1, 1,
1.240306, -0.4931732, 1.946929, 1, 1, 1, 1, 1,
1.243914, 0.4381622, 2.140956, 1, 1, 1, 1, 1,
1.259022, 0.4648074, 3.074398, 1, 1, 1, 1, 1,
1.26336, -1.886111, 1.435016, 1, 1, 1, 1, 1,
1.26509, -0.6573171, 1.941766, 1, 1, 1, 1, 1,
1.265777, -0.5612717, 0.7469707, 1, 1, 1, 1, 1,
1.276834, 0.8766618, 0.9137995, 1, 1, 1, 1, 1,
1.282588, -0.0374307, 1.307945, 0, 0, 1, 1, 1,
1.287308, 0.02086427, 1.729206, 1, 0, 0, 1, 1,
1.301444, 0.07195207, 2.275067, 1, 0, 0, 1, 1,
1.301608, 1.557377, 2.448888, 1, 0, 0, 1, 1,
1.302129, 1.013276, -0.9844948, 1, 0, 0, 1, 1,
1.310758, 0.1875619, -0.05440145, 1, 0, 0, 1, 1,
1.311996, -0.437706, 2.361336, 0, 0, 0, 1, 1,
1.32424, 0.09569625, 1.11938, 0, 0, 0, 1, 1,
1.327888, 0.1520846, 1.525245, 0, 0, 0, 1, 1,
1.330404, -0.866271, 1.710848, 0, 0, 0, 1, 1,
1.330812, -1.22188, 2.075757, 0, 0, 0, 1, 1,
1.347126, 2.279857, 0.5419129, 0, 0, 0, 1, 1,
1.348487, -1.438117, 1.014661, 0, 0, 0, 1, 1,
1.348883, 0.1061641, 0.6230333, 1, 1, 1, 1, 1,
1.351018, 0.6899572, 2.512558, 1, 1, 1, 1, 1,
1.351103, 2.18801, 0.4807719, 1, 1, 1, 1, 1,
1.35492, -1.542581, 2.737693, 1, 1, 1, 1, 1,
1.356709, -0.6609593, 2.620917, 1, 1, 1, 1, 1,
1.357279, 1.467159, -0.007031736, 1, 1, 1, 1, 1,
1.358152, -0.3533237, 0.4049069, 1, 1, 1, 1, 1,
1.362963, -0.3865277, 2.533695, 1, 1, 1, 1, 1,
1.385785, -1.852149, 2.85713, 1, 1, 1, 1, 1,
1.387403, 0.1366942, 1.567083, 1, 1, 1, 1, 1,
1.391898, 0.4138457, 0.8020821, 1, 1, 1, 1, 1,
1.393307, -0.07999896, 0.5546225, 1, 1, 1, 1, 1,
1.404246, 2.695829, 1.724579, 1, 1, 1, 1, 1,
1.404393, -0.2262166, 1.418874, 1, 1, 1, 1, 1,
1.406513, -0.6197146, 2.663724, 1, 1, 1, 1, 1,
1.414475, 1.731636, 0.5664866, 0, 0, 1, 1, 1,
1.415722, -0.5431999, -0.6313394, 1, 0, 0, 1, 1,
1.419415, -0.277377, 2.601735, 1, 0, 0, 1, 1,
1.424438, 0.2498541, 0.6905517, 1, 0, 0, 1, 1,
1.427178, -1.263098, 3.346679, 1, 0, 0, 1, 1,
1.43598, 0.4718625, 1.503487, 1, 0, 0, 1, 1,
1.442, -0.349304, 1.524676, 0, 0, 0, 1, 1,
1.445186, -0.4127175, 3.263952, 0, 0, 0, 1, 1,
1.448621, 0.5191553, 2.559294, 0, 0, 0, 1, 1,
1.459803, 0.8076602, 1.452292, 0, 0, 0, 1, 1,
1.473874, 0.4758415, 0.08468321, 0, 0, 0, 1, 1,
1.477653, 0.5191237, 0.6048778, 0, 0, 0, 1, 1,
1.478701, -1.415998, 3.168484, 0, 0, 0, 1, 1,
1.49637, -0.8768845, 1.358675, 1, 1, 1, 1, 1,
1.499433, 1.229075, 0.6911241, 1, 1, 1, 1, 1,
1.512874, 1.602904, 0.926536, 1, 1, 1, 1, 1,
1.514444, -0.9394079, 1.94173, 1, 1, 1, 1, 1,
1.514879, -0.755057, 3.553206, 1, 1, 1, 1, 1,
1.51616, -0.1066635, -0.4572867, 1, 1, 1, 1, 1,
1.519419, -1.119719, 1.668257, 1, 1, 1, 1, 1,
1.534934, -0.03944569, 1.309573, 1, 1, 1, 1, 1,
1.536366, 0.4506476, 1.885092, 1, 1, 1, 1, 1,
1.551246, 0.406425, 1.595571, 1, 1, 1, 1, 1,
1.560686, -0.4006985, 2.054294, 1, 1, 1, 1, 1,
1.569776, 0.09607697, -0.4274926, 1, 1, 1, 1, 1,
1.583569, 2.378624, 1.980306, 1, 1, 1, 1, 1,
1.618849, -0.4168373, 2.080267, 1, 1, 1, 1, 1,
1.627196, -0.8160447, 2.473354, 1, 1, 1, 1, 1,
1.650427, 0.1364144, 2.465022, 0, 0, 1, 1, 1,
1.656718, -0.466012, 2.41189, 1, 0, 0, 1, 1,
1.676651, 1.161424, -0.6576727, 1, 0, 0, 1, 1,
1.678732, 0.9995804, 1.467284, 1, 0, 0, 1, 1,
1.682655, 0.7948813, 2.430741, 1, 0, 0, 1, 1,
1.691469, 1.13207, -0.1825236, 1, 0, 0, 1, 1,
1.717822, -0.0951814, 1.262979, 0, 0, 0, 1, 1,
1.724386, -0.9718439, 1.055874, 0, 0, 0, 1, 1,
1.731435, 1.476657, 0.108333, 0, 0, 0, 1, 1,
1.732141, 0.7498013, 1.591292, 0, 0, 0, 1, 1,
1.735052, -1.355384, 1.635051, 0, 0, 0, 1, 1,
1.738944, -1.80557, 1.546369, 0, 0, 0, 1, 1,
1.752848, 0.2459693, 2.469445, 0, 0, 0, 1, 1,
1.756036, 0.3084169, 2.168031, 1, 1, 1, 1, 1,
1.773373, 0.5533112, 2.812872, 1, 1, 1, 1, 1,
1.776454, 0.5895183, -0.7570434, 1, 1, 1, 1, 1,
1.815462, 0.05080739, 2.273598, 1, 1, 1, 1, 1,
1.820831, 1.013028, -1.103897, 1, 1, 1, 1, 1,
1.846835, -0.330696, 2.637064, 1, 1, 1, 1, 1,
1.855049, 0.09803401, 1.452274, 1, 1, 1, 1, 1,
1.860035, -0.6152984, 1.568987, 1, 1, 1, 1, 1,
1.897795, 0.8615452, 2.003299, 1, 1, 1, 1, 1,
1.908759, -0.9955418, 3.217203, 1, 1, 1, 1, 1,
1.915416, -1.922072, 2.858159, 1, 1, 1, 1, 1,
1.951918, 0.2233444, 0.8571752, 1, 1, 1, 1, 1,
1.958408, -0.6499674, 1.713221, 1, 1, 1, 1, 1,
1.975157, 0.0912344, 2.714846, 1, 1, 1, 1, 1,
2.021085, 1.032896, 1.06582, 1, 1, 1, 1, 1,
2.040134, 0.4322266, -0.121504, 0, 0, 1, 1, 1,
2.124878, -0.6779879, 1.044167, 1, 0, 0, 1, 1,
2.144648, 4.143081, 0.037788, 1, 0, 0, 1, 1,
2.148512, 1.232228, -0.1398671, 1, 0, 0, 1, 1,
2.158261, 0.4802597, 1.806424, 1, 0, 0, 1, 1,
2.228725, 0.423622, 1.34854, 1, 0, 0, 1, 1,
2.256613, 0.07202104, 1.335578, 0, 0, 0, 1, 1,
2.288256, -0.7842289, 1.991368, 0, 0, 0, 1, 1,
2.331709, 0.8843877, 1.959958, 0, 0, 0, 1, 1,
2.483012, -0.3177243, 2.702601, 0, 0, 0, 1, 1,
2.50762, -0.2316857, 2.785531, 0, 0, 0, 1, 1,
2.555773, 1.210034, -0.320403, 0, 0, 0, 1, 1,
2.574857, 0.9894748, 2.093534, 0, 0, 0, 1, 1,
2.623654, 0.5663073, 0.6101368, 1, 1, 1, 1, 1,
2.943984, 0.5003573, -0.608723, 1, 1, 1, 1, 1,
2.989428, -0.5158898, 1.678543, 1, 1, 1, 1, 1,
3.092753, -0.8287491, 1.81395, 1, 1, 1, 1, 1,
3.120024, -0.8783866, 0.8546101, 1, 1, 1, 1, 1,
3.370208, -0.4762957, 0.4515322, 1, 1, 1, 1, 1,
3.999936, -1.726571, 2.465283, 1, 1, 1, 1, 1
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
var radius = 10.75609;
var distance = 37.78031;
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
mvMatrix.translate( -0.6853616, -0.1367135, 0.3957608 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -37.78031);
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
