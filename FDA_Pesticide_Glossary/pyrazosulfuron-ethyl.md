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
-3.23298, -0.7574427, -0.9137983, 1, 0, 0, 1,
-3.18856, 0.5825875, -1.887244, 1, 0.007843138, 0, 1,
-3.066082, 0.5370547, -2.155851, 1, 0.01176471, 0, 1,
-2.863658, -1.17881, -2.560287, 1, 0.01960784, 0, 1,
-2.817994, -1.285561, -1.656306, 1, 0.02352941, 0, 1,
-2.649732, 2.807483, -1.672247, 1, 0.03137255, 0, 1,
-2.485277, -2.073563, -3.508453, 1, 0.03529412, 0, 1,
-2.311171, 0.4283733, -0.6621009, 1, 0.04313726, 0, 1,
-2.301726, -0.2730858, -0.5193859, 1, 0.04705882, 0, 1,
-2.293861, -0.3440123, -2.270569, 1, 0.05490196, 0, 1,
-2.269342, -1.717344, -3.179868, 1, 0.05882353, 0, 1,
-2.256478, -1.161265, -2.987824, 1, 0.06666667, 0, 1,
-2.209883, -0.9896336, -2.339871, 1, 0.07058824, 0, 1,
-2.177222, 1.482526, -2.88539, 1, 0.07843138, 0, 1,
-2.120622, 0.3675269, -1.684386, 1, 0.08235294, 0, 1,
-2.040588, 0.2130393, -2.060446, 1, 0.09019608, 0, 1,
-1.9878, -0.07727481, -1.463714, 1, 0.09411765, 0, 1,
-1.982646, -0.01964749, -1.64661, 1, 0.1019608, 0, 1,
-1.941386, -0.6005207, -0.4818396, 1, 0.1098039, 0, 1,
-1.934007, -1.278411, -0.977232, 1, 0.1137255, 0, 1,
-1.924451, -0.3293482, -3.704099, 1, 0.1215686, 0, 1,
-1.912925, -0.80251, 0.2214048, 1, 0.1254902, 0, 1,
-1.896349, 0.6919558, -0.8343536, 1, 0.1333333, 0, 1,
-1.88603, -0.6311635, -2.095977, 1, 0.1372549, 0, 1,
-1.876128, -0.5956088, -1.835333, 1, 0.145098, 0, 1,
-1.875056, 1.372665, -1.037849, 1, 0.1490196, 0, 1,
-1.870742, -0.1460221, -1.977607, 1, 0.1568628, 0, 1,
-1.830757, 0.8305771, -0.9764917, 1, 0.1607843, 0, 1,
-1.812464, -0.1971199, -2.568497, 1, 0.1686275, 0, 1,
-1.790375, -1.008814, -2.747077, 1, 0.172549, 0, 1,
-1.788302, 1.801641, 1.028436, 1, 0.1803922, 0, 1,
-1.760511, 2.629359, 0.1825808, 1, 0.1843137, 0, 1,
-1.752782, -0.1002237, -0.8841184, 1, 0.1921569, 0, 1,
-1.742951, -1.845856, -2.775073, 1, 0.1960784, 0, 1,
-1.72403, 1.169687, -1.725861, 1, 0.2039216, 0, 1,
-1.721445, 1.298374, -1.192531, 1, 0.2117647, 0, 1,
-1.704437, 1.86352, -0.03640062, 1, 0.2156863, 0, 1,
-1.702475, 0.5458207, -1.372306, 1, 0.2235294, 0, 1,
-1.693529, 1.123789, -2.571605, 1, 0.227451, 0, 1,
-1.679039, -2.213105, -0.8998386, 1, 0.2352941, 0, 1,
-1.653077, 0.9159255, -0.4944404, 1, 0.2392157, 0, 1,
-1.648654, 0.2427829, -3.235097, 1, 0.2470588, 0, 1,
-1.648311, -0.716536, -2.092474, 1, 0.2509804, 0, 1,
-1.635888, 0.2190989, -1.599791, 1, 0.2588235, 0, 1,
-1.596251, 0.2840396, -1.707192, 1, 0.2627451, 0, 1,
-1.582839, -0.1062046, -2.628044, 1, 0.2705882, 0, 1,
-1.580736, -1.323166, -3.477707, 1, 0.2745098, 0, 1,
-1.574764, 0.1851349, -1.23228, 1, 0.282353, 0, 1,
-1.568553, -2.60851, -2.623615, 1, 0.2862745, 0, 1,
-1.560425, 1.760722, -1.238345, 1, 0.2941177, 0, 1,
-1.559861, -0.064397, -2.444474, 1, 0.3019608, 0, 1,
-1.557895, -0.8445455, -1.459473, 1, 0.3058824, 0, 1,
-1.555434, -1.301376, -1.889505, 1, 0.3137255, 0, 1,
-1.544921, -0.8397512, -2.399652, 1, 0.3176471, 0, 1,
-1.541452, 0.276134, -0.7587278, 1, 0.3254902, 0, 1,
-1.531268, -1.10196, -1.087709, 1, 0.3294118, 0, 1,
-1.499116, 1.703314, 0.03011965, 1, 0.3372549, 0, 1,
-1.494547, 1.106501, -0.4398102, 1, 0.3411765, 0, 1,
-1.487369, 0.090022, -2.280288, 1, 0.3490196, 0, 1,
-1.483302, -2.185562, -2.130021, 1, 0.3529412, 0, 1,
-1.476544, 0.6997114, 0.1528553, 1, 0.3607843, 0, 1,
-1.472877, -0.1506859, -1.188192, 1, 0.3647059, 0, 1,
-1.471498, -1.439172, -2.707416, 1, 0.372549, 0, 1,
-1.468797, 0.04409466, -4.013714, 1, 0.3764706, 0, 1,
-1.464749, 2.261158, -0.7928963, 1, 0.3843137, 0, 1,
-1.443803, 0.2011317, -3.089935, 1, 0.3882353, 0, 1,
-1.439887, -0.9683849, -0.9801356, 1, 0.3960784, 0, 1,
-1.431914, -0.9549357, -2.213133, 1, 0.4039216, 0, 1,
-1.431706, -0.813659, -1.699585, 1, 0.4078431, 0, 1,
-1.431542, -0.5642236, -2.590124, 1, 0.4156863, 0, 1,
-1.43118, -0.04928483, -1.770056, 1, 0.4196078, 0, 1,
-1.411109, -0.730813, -1.772489, 1, 0.427451, 0, 1,
-1.389652, -0.6482331, -1.935699, 1, 0.4313726, 0, 1,
-1.387993, -0.8978798, -1.957742, 1, 0.4392157, 0, 1,
-1.383727, -1.37583, -1.195953, 1, 0.4431373, 0, 1,
-1.381733, -0.7548245, -2.056243, 1, 0.4509804, 0, 1,
-1.380814, 0.2328362, -0.3334318, 1, 0.454902, 0, 1,
-1.376803, -0.06122841, -0.9456419, 1, 0.4627451, 0, 1,
-1.365734, 0.3668155, -0.8538939, 1, 0.4666667, 0, 1,
-1.363259, -1.347208, -3.376097, 1, 0.4745098, 0, 1,
-1.363079, -1.096786, -3.241329, 1, 0.4784314, 0, 1,
-1.362209, -0.4045695, -3.627646, 1, 0.4862745, 0, 1,
-1.358751, -0.5046057, 0.2358543, 1, 0.4901961, 0, 1,
-1.353397, 0.1603366, -1.731975, 1, 0.4980392, 0, 1,
-1.348666, 0.8302109, -1.163278, 1, 0.5058824, 0, 1,
-1.343298, -0.4524001, -3.090242, 1, 0.509804, 0, 1,
-1.342454, 0.4844573, 0.1268361, 1, 0.5176471, 0, 1,
-1.337307, 1.655055, 0.03028202, 1, 0.5215687, 0, 1,
-1.335985, 0.4260574, -1.840925, 1, 0.5294118, 0, 1,
-1.333666, -2.26808, -3.639285, 1, 0.5333334, 0, 1,
-1.330817, -1.03903, -3.027098, 1, 0.5411765, 0, 1,
-1.326707, 0.6566167, -0.5507611, 1, 0.5450981, 0, 1,
-1.303505, 0.5508084, -1.742739, 1, 0.5529412, 0, 1,
-1.292951, 2.763276, -2.579285, 1, 0.5568628, 0, 1,
-1.276292, 0.5394544, -1.060216, 1, 0.5647059, 0, 1,
-1.271618, -0.7426788, -1.409717, 1, 0.5686275, 0, 1,
-1.235002, 0.09095872, -2.825555, 1, 0.5764706, 0, 1,
-1.233417, 0.6202291, -1.200854, 1, 0.5803922, 0, 1,
-1.224909, -2.784107, -2.231441, 1, 0.5882353, 0, 1,
-1.214942, 0.1255681, -2.921211, 1, 0.5921569, 0, 1,
-1.210861, -1.100448, -2.141067, 1, 0.6, 0, 1,
-1.208931, -0.0790962, -1.376117, 1, 0.6078432, 0, 1,
-1.195625, 0.2781444, -0.2976371, 1, 0.6117647, 0, 1,
-1.178012, 0.08911283, -2.131137, 1, 0.6196079, 0, 1,
-1.173104, 0.6812585, -1.521492, 1, 0.6235294, 0, 1,
-1.172167, 0.5123607, -0.07779384, 1, 0.6313726, 0, 1,
-1.168774, 0.627077, -0.5895785, 1, 0.6352941, 0, 1,
-1.167428, 0.1351376, -2.212294, 1, 0.6431373, 0, 1,
-1.165565, 0.6456047, -1.57118, 1, 0.6470588, 0, 1,
-1.162352, 0.2542803, -2.36747, 1, 0.654902, 0, 1,
-1.15248, 0.08000121, -0.3962706, 1, 0.6588235, 0, 1,
-1.151306, 0.3711621, -2.235106, 1, 0.6666667, 0, 1,
-1.151048, -0.2151498, -3.882186, 1, 0.6705883, 0, 1,
-1.138337, 0.8350733, 0.3882629, 1, 0.6784314, 0, 1,
-1.131728, -0.007065947, -0.23255, 1, 0.682353, 0, 1,
-1.12773, 0.5862393, -1.346006, 1, 0.6901961, 0, 1,
-1.124921, -1.112292, -3.454802, 1, 0.6941177, 0, 1,
-1.119077, 1.537311, -0.9288712, 1, 0.7019608, 0, 1,
-1.118697, -0.1337583, -2.960067, 1, 0.7098039, 0, 1,
-1.10276, 0.8280954, -1.016792, 1, 0.7137255, 0, 1,
-1.094667, 0.1106898, -0.01199415, 1, 0.7215686, 0, 1,
-1.07277, -0.1643764, -1.347264, 1, 0.7254902, 0, 1,
-1.07184, -0.6948814, -1.481208, 1, 0.7333333, 0, 1,
-1.065256, 0.4946967, -0.07845014, 1, 0.7372549, 0, 1,
-1.055852, -1.206527, -1.591604, 1, 0.7450981, 0, 1,
-1.055762, -0.2725572, -2.193309, 1, 0.7490196, 0, 1,
-1.049542, 0.2926164, -0.916582, 1, 0.7568628, 0, 1,
-1.047275, -0.7988728, -3.928553, 1, 0.7607843, 0, 1,
-1.041482, 0.4583425, -0.9197816, 1, 0.7686275, 0, 1,
-1.035894, 0.9410406, -0.2803067, 1, 0.772549, 0, 1,
-1.033757, 0.5272034, -1.086278, 1, 0.7803922, 0, 1,
-1.020817, 1.38838, -0.07757377, 1, 0.7843137, 0, 1,
-1.019866, 1.131483, -0.1543437, 1, 0.7921569, 0, 1,
-1.013713, 1.405174, -0.51662, 1, 0.7960784, 0, 1,
-1.013008, -0.1193434, -0.9065474, 1, 0.8039216, 0, 1,
-1.012354, 1.795559, -0.2176981, 1, 0.8117647, 0, 1,
-1.008018, -0.7703929, -1.351395, 1, 0.8156863, 0, 1,
-1.006364, -1.767132, -2.591914, 1, 0.8235294, 0, 1,
-1.004645, 0.08359236, 0.239008, 1, 0.827451, 0, 1,
-1.004062, 1.794035, -1.858929, 1, 0.8352941, 0, 1,
-0.9997191, -0.8371898, -2.113113, 1, 0.8392157, 0, 1,
-0.9992258, 2.292932, -0.1391912, 1, 0.8470588, 0, 1,
-0.9937207, 1.220658, -0.9086411, 1, 0.8509804, 0, 1,
-0.9866252, 0.2208983, -1.463279, 1, 0.8588235, 0, 1,
-0.9857877, -0.1777879, -2.023455, 1, 0.8627451, 0, 1,
-0.9852941, 1.712093, -0.6776171, 1, 0.8705882, 0, 1,
-0.9852195, 1.048259, -1.165629, 1, 0.8745098, 0, 1,
-0.9837629, 0.07013598, -1.50797, 1, 0.8823529, 0, 1,
-0.970301, -0.3563626, -2.439735, 1, 0.8862745, 0, 1,
-0.9652092, 0.07726462, -2.36959, 1, 0.8941177, 0, 1,
-0.9624409, -1.18341, -1.930883, 1, 0.8980392, 0, 1,
-0.9597284, -0.8812281, -3.10391, 1, 0.9058824, 0, 1,
-0.9548094, -1.038689, -3.66235, 1, 0.9137255, 0, 1,
-0.9524276, -0.3949003, -0.7230583, 1, 0.9176471, 0, 1,
-0.9516799, -0.6358557, -0.8142483, 1, 0.9254902, 0, 1,
-0.9394669, 2.381893, 0.2739489, 1, 0.9294118, 0, 1,
-0.9347171, 1.898084, -0.648253, 1, 0.9372549, 0, 1,
-0.9319791, -0.4341586, -2.424847, 1, 0.9411765, 0, 1,
-0.9308637, -0.1626255, -0.7491745, 1, 0.9490196, 0, 1,
-0.9304331, 1.262337, -1.39954, 1, 0.9529412, 0, 1,
-0.9297234, -1.347063, -0.2258808, 1, 0.9607843, 0, 1,
-0.9190933, 1.032261, -0.123885, 1, 0.9647059, 0, 1,
-0.9169664, -0.4491057, -1.143433, 1, 0.972549, 0, 1,
-0.9156368, 0.2274008, -1.145789, 1, 0.9764706, 0, 1,
-0.911532, 1.055905, 0.08714508, 1, 0.9843137, 0, 1,
-0.9098638, 0.06042871, -0.4792441, 1, 0.9882353, 0, 1,
-0.9095302, -1.512889, -2.280814, 1, 0.9960784, 0, 1,
-0.9080961, 0.8074051, -1.726075, 0.9960784, 1, 0, 1,
-0.9020481, -1.267845, -5.228089, 0.9921569, 1, 0, 1,
-0.9019973, 1.151195, -1.961452, 0.9843137, 1, 0, 1,
-0.8966701, -1.125135, -3.437278, 0.9803922, 1, 0, 1,
-0.8954545, 0.5447618, -1.276699, 0.972549, 1, 0, 1,
-0.8860412, -0.3225517, -0.5004033, 0.9686275, 1, 0, 1,
-0.8805057, -0.6309901, -1.186743, 0.9607843, 1, 0, 1,
-0.8784211, -0.8393131, -2.774067, 0.9568627, 1, 0, 1,
-0.874589, -1.829822, -2.248849, 0.9490196, 1, 0, 1,
-0.8725106, -0.6719134, -2.438682, 0.945098, 1, 0, 1,
-0.8693075, -1.755149, -2.687014, 0.9372549, 1, 0, 1,
-0.8643807, 0.521234, -2.152425, 0.9333333, 1, 0, 1,
-0.8628165, -0.3738611, -2.446711, 0.9254902, 1, 0, 1,
-0.8610308, -1.472775, -3.88424, 0.9215686, 1, 0, 1,
-0.858547, 1.354637, 0.409263, 0.9137255, 1, 0, 1,
-0.8523825, 0.3710579, -2.133649, 0.9098039, 1, 0, 1,
-0.8464639, -0.3196131, -3.134879, 0.9019608, 1, 0, 1,
-0.841091, -0.6013227, -1.972107, 0.8941177, 1, 0, 1,
-0.8404985, 0.2523101, -0.5707448, 0.8901961, 1, 0, 1,
-0.8341853, 1.302591, 1.359933, 0.8823529, 1, 0, 1,
-0.8314381, 1.924866, -1.55005, 0.8784314, 1, 0, 1,
-0.8288172, -0.9592022, -2.406663, 0.8705882, 1, 0, 1,
-0.8252479, 0.2616016, -2.226876, 0.8666667, 1, 0, 1,
-0.8244998, 1.338779, -2.107555, 0.8588235, 1, 0, 1,
-0.8125945, 0.8668187, -1.579404, 0.854902, 1, 0, 1,
-0.8067402, 2.389694, -0.4261226, 0.8470588, 1, 0, 1,
-0.8053128, 0.2639062, -1.20197, 0.8431373, 1, 0, 1,
-0.8006863, 0.1923408, -0.9671512, 0.8352941, 1, 0, 1,
-0.7984209, 0.9604424, 0.5816225, 0.8313726, 1, 0, 1,
-0.7978597, -1.353765, -2.996982, 0.8235294, 1, 0, 1,
-0.7870898, -0.4349445, -1.3379, 0.8196079, 1, 0, 1,
-0.7856709, 0.593416, 0.1228412, 0.8117647, 1, 0, 1,
-0.7830917, 0.001775262, -1.751478, 0.8078431, 1, 0, 1,
-0.7789127, -1.621045, -2.373957, 0.8, 1, 0, 1,
-0.7781504, 0.7193746, -0.8434648, 0.7921569, 1, 0, 1,
-0.7769309, 1.080998, -0.5187083, 0.7882353, 1, 0, 1,
-0.774001, -1.740671, -3.230509, 0.7803922, 1, 0, 1,
-0.7719458, 1.80188, 0.8276298, 0.7764706, 1, 0, 1,
-0.7679042, 1.264888, 0.02290347, 0.7686275, 1, 0, 1,
-0.7585257, 0.0518319, -1.943719, 0.7647059, 1, 0, 1,
-0.7572178, 0.1267481, 0.05688763, 0.7568628, 1, 0, 1,
-0.7570955, -0.2367934, -2.046569, 0.7529412, 1, 0, 1,
-0.7516393, 0.1976933, -1.709257, 0.7450981, 1, 0, 1,
-0.7499976, -0.1202681, -2.358419, 0.7411765, 1, 0, 1,
-0.7499952, -0.09156371, -3.073786, 0.7333333, 1, 0, 1,
-0.7437294, -0.1326308, -1.460248, 0.7294118, 1, 0, 1,
-0.7429057, 0.04374063, -0.7479596, 0.7215686, 1, 0, 1,
-0.7415606, 0.3739161, -1.033799, 0.7176471, 1, 0, 1,
-0.7260416, 0.5293214, 0.2703869, 0.7098039, 1, 0, 1,
-0.7257898, 0.3009063, -0.375392, 0.7058824, 1, 0, 1,
-0.7186915, 1.517454, -0.6000844, 0.6980392, 1, 0, 1,
-0.7167798, 1.540777, 0.8709744, 0.6901961, 1, 0, 1,
-0.7109263, 0.1422028, -2.18237, 0.6862745, 1, 0, 1,
-0.7027941, -1.172465, -1.828516, 0.6784314, 1, 0, 1,
-0.7010748, -0.5286583, -0.7760352, 0.6745098, 1, 0, 1,
-0.696406, -0.1071434, -3.283764, 0.6666667, 1, 0, 1,
-0.6954355, 0.1931524, -0.6620564, 0.6627451, 1, 0, 1,
-0.6913943, -0.7715739, -2.679094, 0.654902, 1, 0, 1,
-0.6882377, 1.891203, -0.5010089, 0.6509804, 1, 0, 1,
-0.6864018, 0.4324357, -2.780918, 0.6431373, 1, 0, 1,
-0.6858555, 0.1960486, -2.705721, 0.6392157, 1, 0, 1,
-0.6804366, -1.519516, -2.710084, 0.6313726, 1, 0, 1,
-0.6767097, -0.3374479, -0.9353189, 0.627451, 1, 0, 1,
-0.670628, -0.5114068, -1.239192, 0.6196079, 1, 0, 1,
-0.666128, -0.1286265, -0.06898358, 0.6156863, 1, 0, 1,
-0.6651483, -0.1336351, -1.627922, 0.6078432, 1, 0, 1,
-0.6646944, -0.1107837, -1.972456, 0.6039216, 1, 0, 1,
-0.6638007, 0.9063747, -1.496136, 0.5960785, 1, 0, 1,
-0.6573068, -0.3081773, -1.715562, 0.5882353, 1, 0, 1,
-0.655492, 0.3647929, -2.707588, 0.5843138, 1, 0, 1,
-0.6518726, 1.327873, 1.121428, 0.5764706, 1, 0, 1,
-0.6468717, -1.989868, -1.19846, 0.572549, 1, 0, 1,
-0.6453267, -1.228356, -4.454308, 0.5647059, 1, 0, 1,
-0.6438789, -0.6241861, -2.383005, 0.5607843, 1, 0, 1,
-0.6433089, -1.843725, -0.9256785, 0.5529412, 1, 0, 1,
-0.6404289, -1.217763, -2.798093, 0.5490196, 1, 0, 1,
-0.6322924, 1.272755, 0.4539421, 0.5411765, 1, 0, 1,
-0.6248397, -0.0008207893, -0.9944719, 0.5372549, 1, 0, 1,
-0.6241294, -0.9250404, -2.547249, 0.5294118, 1, 0, 1,
-0.6236071, 1.188856, 0.4173488, 0.5254902, 1, 0, 1,
-0.619509, 0.3521954, -2.829506, 0.5176471, 1, 0, 1,
-0.6191006, -1.645147, -2.364516, 0.5137255, 1, 0, 1,
-0.6166782, -0.5851951, -3.049099, 0.5058824, 1, 0, 1,
-0.6129985, -0.7537172, -2.359828, 0.5019608, 1, 0, 1,
-0.6124231, 0.7025352, 0.1194395, 0.4941176, 1, 0, 1,
-0.6119308, -0.365752, -2.671074, 0.4862745, 1, 0, 1,
-0.6118987, 0.8736774, 1.136528, 0.4823529, 1, 0, 1,
-0.6107838, -0.47012, -1.164186, 0.4745098, 1, 0, 1,
-0.6100478, 0.7534412, -0.2268851, 0.4705882, 1, 0, 1,
-0.6083367, 0.06078381, -2.242767, 0.4627451, 1, 0, 1,
-0.6063799, 0.8032209, -0.6713043, 0.4588235, 1, 0, 1,
-0.6052626, 0.8193386, -0.3340415, 0.4509804, 1, 0, 1,
-0.6049364, 1.894897, -0.2367471, 0.4470588, 1, 0, 1,
-0.6046299, 0.1072696, -2.486196, 0.4392157, 1, 0, 1,
-0.6030059, -0.6868445, -2.945202, 0.4352941, 1, 0, 1,
-0.6017507, -0.6921321, -1.721666, 0.427451, 1, 0, 1,
-0.5991452, -0.8250814, -3.065131, 0.4235294, 1, 0, 1,
-0.5964679, 0.3216167, -1.275037, 0.4156863, 1, 0, 1,
-0.5957555, -1.623855, -4.103611, 0.4117647, 1, 0, 1,
-0.5940245, -0.9357001, -2.493084, 0.4039216, 1, 0, 1,
-0.5925844, -0.9332569, -2.959927, 0.3960784, 1, 0, 1,
-0.5859276, -0.3239784, -3.169743, 0.3921569, 1, 0, 1,
-0.5847844, 3.030804, -0.9919232, 0.3843137, 1, 0, 1,
-0.5829253, 0.4913576, -3.167856, 0.3803922, 1, 0, 1,
-0.5764242, -1.179606, -1.972905, 0.372549, 1, 0, 1,
-0.5704526, 0.1095677, -0.9726267, 0.3686275, 1, 0, 1,
-0.5661249, 1.36109, -0.6169226, 0.3607843, 1, 0, 1,
-0.564175, -0.4121022, -3.744554, 0.3568628, 1, 0, 1,
-0.562035, -0.4625326, -0.6061094, 0.3490196, 1, 0, 1,
-0.5579799, 0.6411167, -1.451113, 0.345098, 1, 0, 1,
-0.5577854, -1.744561, -1.844885, 0.3372549, 1, 0, 1,
-0.5570205, 1.662292, -1.835105, 0.3333333, 1, 0, 1,
-0.5557829, 0.7481337, -2.14135, 0.3254902, 1, 0, 1,
-0.5523984, -1.822654, -3.449961, 0.3215686, 1, 0, 1,
-0.5500498, -0.9229171, -2.239579, 0.3137255, 1, 0, 1,
-0.5476432, -0.5910712, -2.1303, 0.3098039, 1, 0, 1,
-0.5442941, -0.06517185, -0.7870825, 0.3019608, 1, 0, 1,
-0.5413288, 0.6487222, -0.005851817, 0.2941177, 1, 0, 1,
-0.5384418, 1.684505, -1.071125, 0.2901961, 1, 0, 1,
-0.5380671, -0.3159653, -3.546262, 0.282353, 1, 0, 1,
-0.5357653, 0.393069, 0.04196129, 0.2784314, 1, 0, 1,
-0.5344276, 0.2141862, -1.606075, 0.2705882, 1, 0, 1,
-0.5343015, 0.771163, 0.07073295, 0.2666667, 1, 0, 1,
-0.5327821, -1.169157, -2.344936, 0.2588235, 1, 0, 1,
-0.5316126, -0.4544837, -2.23431, 0.254902, 1, 0, 1,
-0.5291751, -0.6411571, -1.059334, 0.2470588, 1, 0, 1,
-0.5274072, -0.05801848, 1.31721, 0.2431373, 1, 0, 1,
-0.5267637, -1.157315, -2.960018, 0.2352941, 1, 0, 1,
-0.5267183, 0.6370242, -2.052298, 0.2313726, 1, 0, 1,
-0.5263188, -0.5783671, -1.866721, 0.2235294, 1, 0, 1,
-0.5243316, -0.6463408, -1.599233, 0.2196078, 1, 0, 1,
-0.5160429, -0.1285322, -1.206326, 0.2117647, 1, 0, 1,
-0.5138211, 0.5455721, 1.358266, 0.2078431, 1, 0, 1,
-0.5126049, -1.541396, -2.789876, 0.2, 1, 0, 1,
-0.5102525, 1.207003, -0.5406893, 0.1921569, 1, 0, 1,
-0.5093749, -0.7903962, -2.236524, 0.1882353, 1, 0, 1,
-0.5081865, 0.02110746, -1.437822, 0.1803922, 1, 0, 1,
-0.5062422, -1.020506, -1.83847, 0.1764706, 1, 0, 1,
-0.5055299, -0.6838499, -1.972896, 0.1686275, 1, 0, 1,
-0.4976428, 0.04379038, -0.9291997, 0.1647059, 1, 0, 1,
-0.4970825, 0.217946, -0.4316941, 0.1568628, 1, 0, 1,
-0.4927149, -0.6144019, -1.88304, 0.1529412, 1, 0, 1,
-0.4910769, 0.4790461, -2.660449, 0.145098, 1, 0, 1,
-0.4910333, -0.1784846, -2.598072, 0.1411765, 1, 0, 1,
-0.4807001, -1.903806, -1.818419, 0.1333333, 1, 0, 1,
-0.4720555, 0.1860748, -0.6987099, 0.1294118, 1, 0, 1,
-0.4673171, 0.1804868, -2.134123, 0.1215686, 1, 0, 1,
-0.4600966, -0.187664, -2.93762, 0.1176471, 1, 0, 1,
-0.4593085, 1.038311, 1.127912, 0.1098039, 1, 0, 1,
-0.4580059, 1.220299, 0.06412606, 0.1058824, 1, 0, 1,
-0.4564897, -0.5595491, -0.7787169, 0.09803922, 1, 0, 1,
-0.4524578, 0.2790279, -1.531378, 0.09019608, 1, 0, 1,
-0.4470859, -1.531929, -1.744348, 0.08627451, 1, 0, 1,
-0.4470632, 0.009547181, -1.672952, 0.07843138, 1, 0, 1,
-0.4442242, 0.03290343, -0.9961449, 0.07450981, 1, 0, 1,
-0.4431322, 0.02544152, -0.7921662, 0.06666667, 1, 0, 1,
-0.4429366, -0.2788703, -2.692536, 0.0627451, 1, 0, 1,
-0.4397373, -1.668823, -1.822187, 0.05490196, 1, 0, 1,
-0.4346673, 0.7765759, 0.03451651, 0.05098039, 1, 0, 1,
-0.4317619, -0.4923386, -2.198045, 0.04313726, 1, 0, 1,
-0.4244281, 0.3986251, 0.9855476, 0.03921569, 1, 0, 1,
-0.4152046, -0.4683421, -1.388455, 0.03137255, 1, 0, 1,
-0.4106209, 1.718529, 0.4623219, 0.02745098, 1, 0, 1,
-0.4079679, -0.448314, -2.569912, 0.01960784, 1, 0, 1,
-0.4043929, 0.5957426, -1.254768, 0.01568628, 1, 0, 1,
-0.4017077, -0.8875088, -3.876551, 0.007843138, 1, 0, 1,
-0.3986795, -0.9576393, -3.054406, 0.003921569, 1, 0, 1,
-0.3977854, -0.3186483, -2.796625, 0, 1, 0.003921569, 1,
-0.3975791, -1.625488, -4.626137, 0, 1, 0.01176471, 1,
-0.3920568, 0.6669667, -2.222683, 0, 1, 0.01568628, 1,
-0.391608, -0.5626997, -2.768023, 0, 1, 0.02352941, 1,
-0.3915716, 0.910831, 0.2624973, 0, 1, 0.02745098, 1,
-0.3894634, -1.434534, -3.854177, 0, 1, 0.03529412, 1,
-0.3848078, 0.4761825, -1.202923, 0, 1, 0.03921569, 1,
-0.3847125, -0.8739359, -1.769972, 0, 1, 0.04705882, 1,
-0.379725, 0.9802554, -0.370231, 0, 1, 0.05098039, 1,
-0.3785263, 0.3700829, 0.4739871, 0, 1, 0.05882353, 1,
-0.3760705, 1.364826, -0.3317842, 0, 1, 0.0627451, 1,
-0.3753357, -0.3040601, -2.306742, 0, 1, 0.07058824, 1,
-0.3724851, 1.475094, -1.051696, 0, 1, 0.07450981, 1,
-0.3720314, -0.8616065, -4.120247, 0, 1, 0.08235294, 1,
-0.3707909, 2.006964, -1.363366, 0, 1, 0.08627451, 1,
-0.3671164, -2.246119, -3.278477, 0, 1, 0.09411765, 1,
-0.3649614, 1.146225, -1.018768, 0, 1, 0.1019608, 1,
-0.3644068, -0.405602, -1.661612, 0, 1, 0.1058824, 1,
-0.3555086, -1.606568, -1.720975, 0, 1, 0.1137255, 1,
-0.3475412, -0.2147963, -0.7978562, 0, 1, 0.1176471, 1,
-0.3461172, -0.3818424, -2.709396, 0, 1, 0.1254902, 1,
-0.3381224, -0.195718, -3.250617, 0, 1, 0.1294118, 1,
-0.3376498, -1.80557, -4.685258, 0, 1, 0.1372549, 1,
-0.334861, 1.523982, -1.456489, 0, 1, 0.1411765, 1,
-0.3298723, 2.22723, 1.897304, 0, 1, 0.1490196, 1,
-0.3274741, -1.003311, -1.15045, 0, 1, 0.1529412, 1,
-0.3223881, -0.1622324, -1.262775, 0, 1, 0.1607843, 1,
-0.3200704, -1.14823, -3.97085, 0, 1, 0.1647059, 1,
-0.3168569, 0.08210015, -1.648328, 0, 1, 0.172549, 1,
-0.3139546, 0.8111328, -0.320379, 0, 1, 0.1764706, 1,
-0.3123244, 0.9853743, 2.124067, 0, 1, 0.1843137, 1,
-0.3082885, 0.6426796, -0.3658595, 0, 1, 0.1882353, 1,
-0.3077951, -0.2991197, -2.136777, 0, 1, 0.1960784, 1,
-0.3053426, -0.1678391, -2.485198, 0, 1, 0.2039216, 1,
-0.3027091, 1.489149, 0.3253627, 0, 1, 0.2078431, 1,
-0.2924556, -0.6280312, -1.389433, 0, 1, 0.2156863, 1,
-0.2911906, -1.006497, -1.702624, 0, 1, 0.2196078, 1,
-0.2865953, -0.1864979, -1.703086, 0, 1, 0.227451, 1,
-0.2846313, -0.9471632, -2.350989, 0, 1, 0.2313726, 1,
-0.2840039, 0.2146206, -0.534495, 0, 1, 0.2392157, 1,
-0.2814914, 0.006165694, -1.483401, 0, 1, 0.2431373, 1,
-0.2814172, 1.236185, -0.4014285, 0, 1, 0.2509804, 1,
-0.2802426, -1.181462, -1.388444, 0, 1, 0.254902, 1,
-0.2790938, -0.3855341, -4.149698, 0, 1, 0.2627451, 1,
-0.2785195, 0.163579, 0.3402673, 0, 1, 0.2666667, 1,
-0.2777617, 0.7345989, 1.811242, 0, 1, 0.2745098, 1,
-0.2766937, 1.667156, 0.42407, 0, 1, 0.2784314, 1,
-0.2722225, 0.007739177, -2.529166, 0, 1, 0.2862745, 1,
-0.2711712, -1.123007, -2.217562, 0, 1, 0.2901961, 1,
-0.2688969, 2.570164e-05, -2.760765, 0, 1, 0.2980392, 1,
-0.266473, -0.2362992, -2.284765, 0, 1, 0.3058824, 1,
-0.2630497, -2.470039, -1.58671, 0, 1, 0.3098039, 1,
-0.2628871, 1.608442, 0.6210567, 0, 1, 0.3176471, 1,
-0.2620744, -1.37784, -3.975243, 0, 1, 0.3215686, 1,
-0.2615907, 1.450728, 1.329576, 0, 1, 0.3294118, 1,
-0.2593634, -0.8375153, -2.643025, 0, 1, 0.3333333, 1,
-0.2561026, -2.542927, -3.105539, 0, 1, 0.3411765, 1,
-0.2536822, -0.05820336, -0.6939121, 0, 1, 0.345098, 1,
-0.2515352, 0.5837783, -1.000634, 0, 1, 0.3529412, 1,
-0.2510846, -0.3442988, -4.262935, 0, 1, 0.3568628, 1,
-0.2491903, -0.8740216, -2.082715, 0, 1, 0.3647059, 1,
-0.2464789, -1.391773, -2.153195, 0, 1, 0.3686275, 1,
-0.2461507, 1.548399, -0.7617111, 0, 1, 0.3764706, 1,
-0.2433693, -1.321027, -2.803449, 0, 1, 0.3803922, 1,
-0.2406137, -0.7214482, -3.715676, 0, 1, 0.3882353, 1,
-0.2382177, -1.28673, -3.966729, 0, 1, 0.3921569, 1,
-0.2346138, -1.528612, -2.48388, 0, 1, 0.4, 1,
-0.2335719, 0.2207673, -1.909719, 0, 1, 0.4078431, 1,
-0.23339, -1.83773, -2.763397, 0, 1, 0.4117647, 1,
-0.2320863, -1.649876, -2.201787, 0, 1, 0.4196078, 1,
-0.2305813, -0.4698782, -2.973861, 0, 1, 0.4235294, 1,
-0.227575, -1.146456, -3.735188, 0, 1, 0.4313726, 1,
-0.2235516, 0.04918347, -1.600041, 0, 1, 0.4352941, 1,
-0.2192902, -1.25047, -2.726328, 0, 1, 0.4431373, 1,
-0.2180068, 1.908292, 0.5178904, 0, 1, 0.4470588, 1,
-0.2162407, 1.139767, 0.7058951, 0, 1, 0.454902, 1,
-0.2147767, 1.267749, -0.1444451, 0, 1, 0.4588235, 1,
-0.210288, -2.497302, -2.472214, 0, 1, 0.4666667, 1,
-0.2044227, 0.6647364, -1.100673, 0, 1, 0.4705882, 1,
-0.2041164, 0.5898428, -0.6062895, 0, 1, 0.4784314, 1,
-0.2020268, -0.5691065, -3.574407, 0, 1, 0.4823529, 1,
-0.1949733, 1.260989, -0.07547179, 0, 1, 0.4901961, 1,
-0.1943045, 0.07264103, -2.950061, 0, 1, 0.4941176, 1,
-0.1930724, -1.163751, -2.434624, 0, 1, 0.5019608, 1,
-0.1925403, 0.1031327, -1.048186, 0, 1, 0.509804, 1,
-0.1894146, -0.1424288, -2.418921, 0, 1, 0.5137255, 1,
-0.1812762, -0.9245682, -2.284202, 0, 1, 0.5215687, 1,
-0.1765025, 1.646824, -0.4394238, 0, 1, 0.5254902, 1,
-0.1723729, -0.01571765, -1.714401, 0, 1, 0.5333334, 1,
-0.1720974, 0.9674531, 0.5757064, 0, 1, 0.5372549, 1,
-0.169723, 1.721762, 0.8356145, 0, 1, 0.5450981, 1,
-0.1682599, 1.227672, -0.7855474, 0, 1, 0.5490196, 1,
-0.1678187, -1.415138, -3.61553, 0, 1, 0.5568628, 1,
-0.1676677, 1.223128, -1.510551, 0, 1, 0.5607843, 1,
-0.1611252, -0.5298544, -1.918612, 0, 1, 0.5686275, 1,
-0.1558989, -2.419332, -2.486686, 0, 1, 0.572549, 1,
-0.1466116, 0.1839707, -1.023437, 0, 1, 0.5803922, 1,
-0.1450633, 0.5448316, -1.178619, 0, 1, 0.5843138, 1,
-0.1436757, -0.4356534, -2.923486, 0, 1, 0.5921569, 1,
-0.1434968, -0.6184963, -1.649189, 0, 1, 0.5960785, 1,
-0.1429693, 0.833104, -0.5739344, 0, 1, 0.6039216, 1,
-0.1398937, 1.567477, -0.866573, 0, 1, 0.6117647, 1,
-0.1377239, 0.4027186, -0.8166996, 0, 1, 0.6156863, 1,
-0.1346986, 0.8521482, 0.8436832, 0, 1, 0.6235294, 1,
-0.1305225, -0.02652421, -0.7055629, 0, 1, 0.627451, 1,
-0.1255671, -0.8821105, -2.589147, 0, 1, 0.6352941, 1,
-0.1225699, 0.4592197, -0.05774581, 0, 1, 0.6392157, 1,
-0.1215601, -0.1146446, -2.113099, 0, 1, 0.6470588, 1,
-0.1183465, -0.6709545, -1.702448, 0, 1, 0.6509804, 1,
-0.116689, -0.8026249, -3.14011, 0, 1, 0.6588235, 1,
-0.1165585, -0.02012709, -1.053037, 0, 1, 0.6627451, 1,
-0.1160311, 0.6725742, -0.9994909, 0, 1, 0.6705883, 1,
-0.111921, -1.099087, -3.676187, 0, 1, 0.6745098, 1,
-0.1115416, -1.69034, -3.200503, 0, 1, 0.682353, 1,
-0.1105411, -0.3985663, -2.785012, 0, 1, 0.6862745, 1,
-0.1097504, 1.484866, -0.4799403, 0, 1, 0.6941177, 1,
-0.1092367, 1.59903, -0.56857, 0, 1, 0.7019608, 1,
-0.1088337, -0.6254844, -3.217927, 0, 1, 0.7058824, 1,
-0.1063921, 1.825412, -1.346638, 0, 1, 0.7137255, 1,
-0.1051262, 1.597709, -1.491069, 0, 1, 0.7176471, 1,
-0.1028738, 0.002723237, -0.7571415, 0, 1, 0.7254902, 1,
-0.1018547, -0.6613663, -2.747566, 0, 1, 0.7294118, 1,
-0.09807229, 0.654167, -0.2983754, 0, 1, 0.7372549, 1,
-0.09164183, 1.189435, 1.686594, 0, 1, 0.7411765, 1,
-0.09136336, 2.174891, 0.9522581, 0, 1, 0.7490196, 1,
-0.09072866, 2.372941, 0.6840044, 0, 1, 0.7529412, 1,
-0.0901515, -1.412347, -1.595605, 0, 1, 0.7607843, 1,
-0.08974843, -0.2549535, -1.768721, 0, 1, 0.7647059, 1,
-0.08740077, 2.250397, -1.640262, 0, 1, 0.772549, 1,
-0.08732338, 2.563861, -0.04205425, 0, 1, 0.7764706, 1,
-0.08621742, -0.3830121, -3.104663, 0, 1, 0.7843137, 1,
-0.08553397, 0.8323851, -0.3986394, 0, 1, 0.7882353, 1,
-0.08072148, 1.804214, 0.8051024, 0, 1, 0.7960784, 1,
-0.0771388, -0.592815, -3.101421, 0, 1, 0.8039216, 1,
-0.0769119, -0.848721, -2.345364, 0, 1, 0.8078431, 1,
-0.07425015, 0.2334699, 0.401089, 0, 1, 0.8156863, 1,
-0.06929896, -0.01876202, -0.918236, 0, 1, 0.8196079, 1,
-0.05989859, -0.3339496, -1.812956, 0, 1, 0.827451, 1,
-0.05847842, -0.5765898, -2.12402, 0, 1, 0.8313726, 1,
-0.0572841, 1.76219, 0.04401549, 0, 1, 0.8392157, 1,
-0.05503923, -1.537001, -3.033731, 0, 1, 0.8431373, 1,
-0.05391208, 0.3636752, -1.055442, 0, 1, 0.8509804, 1,
-0.0494362, 0.1426476, -0.2451555, 0, 1, 0.854902, 1,
-0.04923036, 1.464265, 0.2041382, 0, 1, 0.8627451, 1,
-0.04793336, -0.6777875, -3.960642, 0, 1, 0.8666667, 1,
-0.04296621, -0.8233407, -3.302647, 0, 1, 0.8745098, 1,
-0.03827469, -1.395422, -3.430453, 0, 1, 0.8784314, 1,
-0.03713527, -0.346327, -4.455959, 0, 1, 0.8862745, 1,
-0.03621191, -1.805237, -3.033926, 0, 1, 0.8901961, 1,
-0.03479945, -0.05106927, -2.660533, 0, 1, 0.8980392, 1,
-0.03373397, -0.4923777, -3.709882, 0, 1, 0.9058824, 1,
-0.02632475, 1.114178, -0.2540464, 0, 1, 0.9098039, 1,
-0.02114841, -0.9531969, -3.932681, 0, 1, 0.9176471, 1,
-0.01650814, 0.1716017, 0.5424987, 0, 1, 0.9215686, 1,
-0.01527001, 0.1465402, 0.02393296, 0, 1, 0.9294118, 1,
-0.01433875, 0.9954934, -0.9166455, 0, 1, 0.9333333, 1,
-0.01313333, 0.9565353, -0.6757064, 0, 1, 0.9411765, 1,
-0.01290445, 1.110087, -0.2218239, 0, 1, 0.945098, 1,
-0.01133114, 0.3307783, 0.3039913, 0, 1, 0.9529412, 1,
-0.01052732, 0.9553956, 0.5440164, 0, 1, 0.9568627, 1,
-0.009501167, -0.8338041, -3.815395, 0, 1, 0.9647059, 1,
-0.005613275, 1.667601, 1.800917, 0, 1, 0.9686275, 1,
-0.005456438, 0.6118839, 0.7252778, 0, 1, 0.9764706, 1,
-0.000868954, 0.0590391, -0.5041444, 0, 1, 0.9803922, 1,
0.01194164, 0.7469507, -0.8892893, 0, 1, 0.9882353, 1,
0.01238513, 0.1132669, -1.001092, 0, 1, 0.9921569, 1,
0.01626623, -0.8912523, 3.559719, 0, 1, 1, 1,
0.02058313, -0.08501798, 2.568533, 0, 0.9921569, 1, 1,
0.02191122, -0.3254352, 4.573486, 0, 0.9882353, 1, 1,
0.02500074, 0.6311498, 0.1807392, 0, 0.9803922, 1, 1,
0.02558754, -0.3352356, 4.354861, 0, 0.9764706, 1, 1,
0.02645946, -0.1672297, 1.943464, 0, 0.9686275, 1, 1,
0.02677084, -0.7756771, 3.969362, 0, 0.9647059, 1, 1,
0.0271693, -0.7918539, 4.120664, 0, 0.9568627, 1, 1,
0.03118283, -0.4506183, 3.80275, 0, 0.9529412, 1, 1,
0.03165614, 0.1855866, 0.5987923, 0, 0.945098, 1, 1,
0.03255658, 2.381919, -1.438348, 0, 0.9411765, 1, 1,
0.03547264, 1.068721, -1.226747, 0, 0.9333333, 1, 1,
0.04279406, 1.143513, 0.784841, 0, 0.9294118, 1, 1,
0.04425196, -0.6111326, 3.144488, 0, 0.9215686, 1, 1,
0.044462, 1.586013, -1.092484, 0, 0.9176471, 1, 1,
0.04447282, -0.5133716, 3.54689, 0, 0.9098039, 1, 1,
0.04617786, -0.7703043, 1.477585, 0, 0.9058824, 1, 1,
0.04718169, -0.3978125, 4.564042, 0, 0.8980392, 1, 1,
0.04833278, 1.643867, -0.05735718, 0, 0.8901961, 1, 1,
0.05051364, 0.2567993, 0.7087412, 0, 0.8862745, 1, 1,
0.05110863, 0.2748345, -0.4104993, 0, 0.8784314, 1, 1,
0.05377955, 1.28939, 0.8805103, 0, 0.8745098, 1, 1,
0.05450116, 0.6622944, -1.074427, 0, 0.8666667, 1, 1,
0.05845085, -0.1666251, 3.800858, 0, 0.8627451, 1, 1,
0.06296445, -0.437151, 2.636331, 0, 0.854902, 1, 1,
0.06646863, 3.052202, -0.8194528, 0, 0.8509804, 1, 1,
0.06663615, 0.5467029, 2.229652, 0, 0.8431373, 1, 1,
0.06700329, 0.3680467, -0.795, 0, 0.8392157, 1, 1,
0.06717511, -0.5157989, 2.180763, 0, 0.8313726, 1, 1,
0.07667075, -0.4991075, 2.428701, 0, 0.827451, 1, 1,
0.08572946, -1.49311, 3.583899, 0, 0.8196079, 1, 1,
0.08841274, -0.7194121, 1.576788, 0, 0.8156863, 1, 1,
0.08852545, -0.8290707, 2.64825, 0, 0.8078431, 1, 1,
0.0914693, 0.6888328, 1.280898, 0, 0.8039216, 1, 1,
0.09412478, 0.1315949, -0.1272666, 0, 0.7960784, 1, 1,
0.09472219, -0.04422653, 2.036766, 0, 0.7882353, 1, 1,
0.09633245, 0.1751657, 1.681494, 0, 0.7843137, 1, 1,
0.0973202, 2.65681, -0.1936771, 0, 0.7764706, 1, 1,
0.104684, 0.3725905, -0.2416211, 0, 0.772549, 1, 1,
0.1076487, -0.6420113, 2.658652, 0, 0.7647059, 1, 1,
0.1093184, 0.6863371, 1.026606, 0, 0.7607843, 1, 1,
0.1112688, 1.424394, -0.07836468, 0, 0.7529412, 1, 1,
0.112057, -0.1896846, 1.967642, 0, 0.7490196, 1, 1,
0.1131106, -0.1463712, 1.813909, 0, 0.7411765, 1, 1,
0.1177977, 0.02609845, 1.99118, 0, 0.7372549, 1, 1,
0.1182442, 0.6147972, -2.875641, 0, 0.7294118, 1, 1,
0.1191008, -0.8436812, 3.348793, 0, 0.7254902, 1, 1,
0.1196097, -0.3220346, 1.415408, 0, 0.7176471, 1, 1,
0.1202334, -0.6534448, 3.871672, 0, 0.7137255, 1, 1,
0.121676, 0.6231414, -0.2019739, 0, 0.7058824, 1, 1,
0.123965, -2.609837, 1.560533, 0, 0.6980392, 1, 1,
0.1246407, -1.148543, 3.552304, 0, 0.6941177, 1, 1,
0.1251148, 1.957557, 0.5397294, 0, 0.6862745, 1, 1,
0.1264756, 0.450185, 0.1596117, 0, 0.682353, 1, 1,
0.1266602, 0.4857236, 1.417694, 0, 0.6745098, 1, 1,
0.1310023, 0.4888034, 2.114141, 0, 0.6705883, 1, 1,
0.131515, 1.415243, -1.296288, 0, 0.6627451, 1, 1,
0.1332402, 0.05255162, -0.4890683, 0, 0.6588235, 1, 1,
0.135276, -0.1649757, 3.700832, 0, 0.6509804, 1, 1,
0.1368856, -1.46812, 4.285498, 0, 0.6470588, 1, 1,
0.1384729, -0.2624624, 1.517486, 0, 0.6392157, 1, 1,
0.1428221, 0.07916723, 1.630149, 0, 0.6352941, 1, 1,
0.1496865, -0.304483, 2.112417, 0, 0.627451, 1, 1,
0.1498566, 1.365447, -2.039497, 0, 0.6235294, 1, 1,
0.1525023, -0.9326806, 3.518826, 0, 0.6156863, 1, 1,
0.1539324, -0.639491, 1.537078, 0, 0.6117647, 1, 1,
0.1541671, -1.556234, 4.049917, 0, 0.6039216, 1, 1,
0.1550885, -1.66807, 2.777308, 0, 0.5960785, 1, 1,
0.1566368, -0.00742345, 0.2232966, 0, 0.5921569, 1, 1,
0.1582119, 0.3083329, 1.323168, 0, 0.5843138, 1, 1,
0.1645075, 0.9051063, 0.6953597, 0, 0.5803922, 1, 1,
0.1715528, -0.01125958, 1.755758, 0, 0.572549, 1, 1,
0.1729366, -0.4107632, 2.72082, 0, 0.5686275, 1, 1,
0.1774245, 0.6880148, 0.8226087, 0, 0.5607843, 1, 1,
0.1854838, -0.7994767, 3.31054, 0, 0.5568628, 1, 1,
0.1856672, -0.04191476, 3.735545, 0, 0.5490196, 1, 1,
0.1898307, 0.8322257, -0.03823015, 0, 0.5450981, 1, 1,
0.1948825, -0.5459504, 1.62532, 0, 0.5372549, 1, 1,
0.1961246, -0.6115484, 1.834298, 0, 0.5333334, 1, 1,
0.1962497, -0.3528318, 2.781845, 0, 0.5254902, 1, 1,
0.2005842, -1.863231, 2.266116, 0, 0.5215687, 1, 1,
0.2028371, -0.03686934, 2.157413, 0, 0.5137255, 1, 1,
0.2030426, -1.3622, 3.139136, 0, 0.509804, 1, 1,
0.2133097, 0.3355222, -1.306664, 0, 0.5019608, 1, 1,
0.213685, 0.1341134, 0.8426477, 0, 0.4941176, 1, 1,
0.2154803, -1.524333, 4.060324, 0, 0.4901961, 1, 1,
0.2172483, 0.6195571, 1.083899, 0, 0.4823529, 1, 1,
0.2184244, 0.7751719, -0.4674611, 0, 0.4784314, 1, 1,
0.2185903, 0.5399463, -0.3909229, 0, 0.4705882, 1, 1,
0.220387, -0.1283434, 0.3411887, 0, 0.4666667, 1, 1,
0.2211237, -0.3945098, 3.26524, 0, 0.4588235, 1, 1,
0.2213759, 1.024472, -0.8899951, 0, 0.454902, 1, 1,
0.2284746, -0.1211255, 1.878947, 0, 0.4470588, 1, 1,
0.2297388, 1.028993, 0.2796417, 0, 0.4431373, 1, 1,
0.2301358, -0.5449124, 3.082364, 0, 0.4352941, 1, 1,
0.2310274, 0.510389, 1.876665, 0, 0.4313726, 1, 1,
0.2333524, 0.6586411, -0.8837886, 0, 0.4235294, 1, 1,
0.2340638, -0.6606438, 2.681139, 0, 0.4196078, 1, 1,
0.2341128, 1.288047, -0.7697762, 0, 0.4117647, 1, 1,
0.2343553, 0.1866688, 0.3286128, 0, 0.4078431, 1, 1,
0.2396756, 0.2546568, 0.5332094, 0, 0.4, 1, 1,
0.2423381, 0.2687082, 0.5683823, 0, 0.3921569, 1, 1,
0.2423784, 2.373771, 0.4359201, 0, 0.3882353, 1, 1,
0.2456133, -1.72647, 5.021686, 0, 0.3803922, 1, 1,
0.2485942, 0.2847061, 0.8510458, 0, 0.3764706, 1, 1,
0.2492762, 1.350975, -0.2431338, 0, 0.3686275, 1, 1,
0.2546778, -0.08731669, 0.6122773, 0, 0.3647059, 1, 1,
0.2560631, 1.179548, -0.8180094, 0, 0.3568628, 1, 1,
0.2561471, -1.308796, 0.9734869, 0, 0.3529412, 1, 1,
0.2587539, 1.167285, 0.238777, 0, 0.345098, 1, 1,
0.2587648, 1.19383, 0.1768714, 0, 0.3411765, 1, 1,
0.2644767, 0.7485486, 0.8531626, 0, 0.3333333, 1, 1,
0.2659824, -1.028806, 3.9276, 0, 0.3294118, 1, 1,
0.2686845, 0.6529197, 1.239451, 0, 0.3215686, 1, 1,
0.2693388, 0.7929865, -0.9188642, 0, 0.3176471, 1, 1,
0.2699522, -1.841568, 1.071454, 0, 0.3098039, 1, 1,
0.2700049, 1.142516, -0.6270483, 0, 0.3058824, 1, 1,
0.2742518, -0.1493416, 1.431594, 0, 0.2980392, 1, 1,
0.2746752, -1.124318, 2.897471, 0, 0.2901961, 1, 1,
0.2781605, 0.5852231, 1.546835, 0, 0.2862745, 1, 1,
0.2807915, 0.3052402, 0.8457766, 0, 0.2784314, 1, 1,
0.2909057, 1.062732, 1.775362, 0, 0.2745098, 1, 1,
0.2930439, 0.7633436, -0.3990847, 0, 0.2666667, 1, 1,
0.2935115, 0.07920741, 0.7953906, 0, 0.2627451, 1, 1,
0.2951044, -0.07017648, 1.835141, 0, 0.254902, 1, 1,
0.2953642, 1.31876, -0.4886723, 0, 0.2509804, 1, 1,
0.2959927, -0.08778815, 1.724245, 0, 0.2431373, 1, 1,
0.2972488, -0.4935922, 1.867233, 0, 0.2392157, 1, 1,
0.2986906, -0.8797148, 1.758598, 0, 0.2313726, 1, 1,
0.2999515, 1.426785, 1.150736, 0, 0.227451, 1, 1,
0.302624, 0.08044334, 2.270784, 0, 0.2196078, 1, 1,
0.3102216, 0.9495211, 1.194995, 0, 0.2156863, 1, 1,
0.3107333, -0.8959268, 2.921793, 0, 0.2078431, 1, 1,
0.3166233, 0.0492896, 2.298282, 0, 0.2039216, 1, 1,
0.3194943, -1.299785, 5.070211, 0, 0.1960784, 1, 1,
0.3252224, -1.187887, 2.406335, 0, 0.1882353, 1, 1,
0.3260854, -0.1550788, 1.398103, 0, 0.1843137, 1, 1,
0.3294244, 0.7659168, -0.3322828, 0, 0.1764706, 1, 1,
0.3337823, 1.641391, 2.01636, 0, 0.172549, 1, 1,
0.3374417, 0.387324, 1.758465, 0, 0.1647059, 1, 1,
0.345414, 0.6346493, 1.223601, 0, 0.1607843, 1, 1,
0.345843, 0.5480278, 0.3486834, 0, 0.1529412, 1, 1,
0.3464718, -0.671582, 2.986847, 0, 0.1490196, 1, 1,
0.3524079, -1.287153, 0.9261923, 0, 0.1411765, 1, 1,
0.3552251, 1.517318, 0.364084, 0, 0.1372549, 1, 1,
0.3559963, -0.3149235, 1.114157, 0, 0.1294118, 1, 1,
0.3560408, -1.062114, 1.28024, 0, 0.1254902, 1, 1,
0.3575646, -0.9728582, 4.429078, 0, 0.1176471, 1, 1,
0.3580584, 0.4294986, -0.6334217, 0, 0.1137255, 1, 1,
0.3598391, -1.548023, 3.594001, 0, 0.1058824, 1, 1,
0.3619334, -0.2269612, 3.713763, 0, 0.09803922, 1, 1,
0.3629203, 0.9438875, 0.9711193, 0, 0.09411765, 1, 1,
0.3629382, 0.8556052, -0.6451416, 0, 0.08627451, 1, 1,
0.3633832, 0.2063967, 2.021486, 0, 0.08235294, 1, 1,
0.3636391, 0.2576657, 1.956687, 0, 0.07450981, 1, 1,
0.3666583, 0.348355, -1.416655, 0, 0.07058824, 1, 1,
0.3718787, 1.55697, 0.2257661, 0, 0.0627451, 1, 1,
0.3728211, 0.7501149, 0.6511245, 0, 0.05882353, 1, 1,
0.3736279, -0.4484272, 1.961463, 0, 0.05098039, 1, 1,
0.3742969, -1.999148, 2.951181, 0, 0.04705882, 1, 1,
0.3784262, 1.961769, 0.09521135, 0, 0.03921569, 1, 1,
0.3784859, -0.5489829, 1.677145, 0, 0.03529412, 1, 1,
0.3803646, -2.138789, 2.671066, 0, 0.02745098, 1, 1,
0.3850183, -0.6581104, 3.634679, 0, 0.02352941, 1, 1,
0.3881781, 0.3505642, 0.6438879, 0, 0.01568628, 1, 1,
0.3918265, 0.1899967, 1.735677, 0, 0.01176471, 1, 1,
0.3990553, -0.2305112, 2.453363, 0, 0.003921569, 1, 1,
0.3992239, 1.039308, -0.1460056, 0.003921569, 0, 1, 1,
0.4044967, 0.2586041, 0.0222384, 0.007843138, 0, 1, 1,
0.4074557, 1.356802, 0.6379528, 0.01568628, 0, 1, 1,
0.410007, -0.1040889, 2.613308, 0.01960784, 0, 1, 1,
0.4103162, -1.521202, 3.098506, 0.02745098, 0, 1, 1,
0.410377, -0.06607281, 3.635175, 0.03137255, 0, 1, 1,
0.4112438, -0.4173247, 2.967639, 0.03921569, 0, 1, 1,
0.4117087, 0.4109112, -2.119952, 0.04313726, 0, 1, 1,
0.413162, 1.374937, 0.05392695, 0.05098039, 0, 1, 1,
0.4148332, 0.09150936, 1.370896, 0.05490196, 0, 1, 1,
0.4171768, -0.4769343, 2.617472, 0.0627451, 0, 1, 1,
0.4212947, -0.1058507, 3.624519, 0.06666667, 0, 1, 1,
0.4261445, -0.3283487, 2.998739, 0.07450981, 0, 1, 1,
0.4302908, -0.3437583, 0.5736717, 0.07843138, 0, 1, 1,
0.4415377, -1.444166, 5.023843, 0.08627451, 0, 1, 1,
0.45356, -1.694597, 3.337253, 0.09019608, 0, 1, 1,
0.4542896, -1.747248, 3.396761, 0.09803922, 0, 1, 1,
0.4553867, 0.9774312, -0.5145423, 0.1058824, 0, 1, 1,
0.4555733, -0.9412087, 2.270329, 0.1098039, 0, 1, 1,
0.45983, 1.286617, 1.755296, 0.1176471, 0, 1, 1,
0.4604076, -1.194495, 1.992683, 0.1215686, 0, 1, 1,
0.4615382, -0.4384139, 2.895516, 0.1294118, 0, 1, 1,
0.4647859, 2.356252, 1.672544, 0.1333333, 0, 1, 1,
0.4650263, -0.7722671, 2.919639, 0.1411765, 0, 1, 1,
0.4743108, -0.6700831, 2.329317, 0.145098, 0, 1, 1,
0.4771887, 0.198062, 1.569064, 0.1529412, 0, 1, 1,
0.481003, 0.3662488, 1.519024, 0.1568628, 0, 1, 1,
0.4812305, -2.507389, 3.024395, 0.1647059, 0, 1, 1,
0.4820421, 1.946433, 0.2244003, 0.1686275, 0, 1, 1,
0.4823199, -0.582253, 3.451797, 0.1764706, 0, 1, 1,
0.4824502, -0.2598438, 0.5030923, 0.1803922, 0, 1, 1,
0.483546, 1.112793, -0.0998602, 0.1882353, 0, 1, 1,
0.489035, -2.571648, 3.638385, 0.1921569, 0, 1, 1,
0.4894562, 0.8497139, 0.3236222, 0.2, 0, 1, 1,
0.4918061, 1.935985, 1.770372, 0.2078431, 0, 1, 1,
0.4948274, 1.605142, 0.5979514, 0.2117647, 0, 1, 1,
0.495009, 1.241109, 1.020086, 0.2196078, 0, 1, 1,
0.4991847, 1.411839, 1.984754, 0.2235294, 0, 1, 1,
0.5001002, -0.7182384, 3.024292, 0.2313726, 0, 1, 1,
0.5019858, 0.1948092, 1.291978, 0.2352941, 0, 1, 1,
0.5029511, 0.416118, 1.350086, 0.2431373, 0, 1, 1,
0.5058488, -1.215034, 2.542554, 0.2470588, 0, 1, 1,
0.5156452, 0.687903, 0.4720791, 0.254902, 0, 1, 1,
0.5168346, -0.937474, 1.797986, 0.2588235, 0, 1, 1,
0.5205335, 0.2992997, 0.8635234, 0.2666667, 0, 1, 1,
0.5219492, -1.046119, 3.06007, 0.2705882, 0, 1, 1,
0.5259349, -0.2947711, 1.562691, 0.2784314, 0, 1, 1,
0.5263842, -1.273034, 2.805981, 0.282353, 0, 1, 1,
0.530109, -0.02327866, 1.574722, 0.2901961, 0, 1, 1,
0.530665, -0.2125634, 3.416446, 0.2941177, 0, 1, 1,
0.5325437, -0.8345698, 1.614624, 0.3019608, 0, 1, 1,
0.5337266, 0.2042764, 1.158578, 0.3098039, 0, 1, 1,
0.5348604, 0.4721826, -1.11892, 0.3137255, 0, 1, 1,
0.5381151, -0.9716642, 4.240473, 0.3215686, 0, 1, 1,
0.5384239, 1.326215, 0.7629317, 0.3254902, 0, 1, 1,
0.5384985, -0.7411149, 1.32322, 0.3333333, 0, 1, 1,
0.5400808, 0.2518641, 2.914962, 0.3372549, 0, 1, 1,
0.5425206, -0.1071241, 0.009447508, 0.345098, 0, 1, 1,
0.5590765, 0.2833523, 0.1626054, 0.3490196, 0, 1, 1,
0.5616764, -0.3322867, 1.605976, 0.3568628, 0, 1, 1,
0.5630745, 0.6932639, -0.530911, 0.3607843, 0, 1, 1,
0.5667319, -0.4514627, 2.659843, 0.3686275, 0, 1, 1,
0.5722293, -1.372813, 2.410398, 0.372549, 0, 1, 1,
0.5723353, 1.53744, 0.9872811, 0.3803922, 0, 1, 1,
0.5763829, 0.6137986, 0.4065103, 0.3843137, 0, 1, 1,
0.5774668, 0.7659113, 0.9097025, 0.3921569, 0, 1, 1,
0.5821159, 1.431809, 1.890532, 0.3960784, 0, 1, 1,
0.5855305, 0.1259415, 2.454435, 0.4039216, 0, 1, 1,
0.5885415, 1.896563, -0.1455535, 0.4117647, 0, 1, 1,
0.5960711, 0.8394641, 1.404647, 0.4156863, 0, 1, 1,
0.5969015, -2.228441, 1.919749, 0.4235294, 0, 1, 1,
0.6012803, 1.460077, 1.17922, 0.427451, 0, 1, 1,
0.6036209, 1.036626, 0.8959656, 0.4352941, 0, 1, 1,
0.611237, -0.9598646, 3.42426, 0.4392157, 0, 1, 1,
0.6152553, 0.06643898, 3.020089, 0.4470588, 0, 1, 1,
0.6250088, 0.7226744, 1.530275, 0.4509804, 0, 1, 1,
0.6265221, -0.2644946, 1.697992, 0.4588235, 0, 1, 1,
0.6307328, -0.2890387, 1.931463, 0.4627451, 0, 1, 1,
0.6432238, 0.1779695, 1.887371, 0.4705882, 0, 1, 1,
0.6461617, -0.9993248, 3.004674, 0.4745098, 0, 1, 1,
0.6522533, 0.3658468, 0.6249969, 0.4823529, 0, 1, 1,
0.6569691, -0.8837975, 1.407403, 0.4862745, 0, 1, 1,
0.6597936, 1.342237, 0.2254435, 0.4941176, 0, 1, 1,
0.6605591, -1.836649, 2.299209, 0.5019608, 0, 1, 1,
0.6632204, 1.457704, -0.2128171, 0.5058824, 0, 1, 1,
0.6763657, -1.205351, 2.44874, 0.5137255, 0, 1, 1,
0.6771946, -1.758994, 4.968644, 0.5176471, 0, 1, 1,
0.6792063, 1.009083, -0.1901235, 0.5254902, 0, 1, 1,
0.6792356, 1.013962, 2.725843, 0.5294118, 0, 1, 1,
0.6804726, 0.9951196, 1.646311, 0.5372549, 0, 1, 1,
0.6804826, -1.055477, 3.899988, 0.5411765, 0, 1, 1,
0.6818746, -0.2733476, 2.349899, 0.5490196, 0, 1, 1,
0.6825195, -1.629989, 1.952607, 0.5529412, 0, 1, 1,
0.6857738, 3.530948, 0.5710617, 0.5607843, 0, 1, 1,
0.6906522, 1.087105, -0.4666486, 0.5647059, 0, 1, 1,
0.6945972, -0.2104608, 1.083167, 0.572549, 0, 1, 1,
0.6990422, -1.530257, 1.615416, 0.5764706, 0, 1, 1,
0.6991428, -1.680938, 1.622097, 0.5843138, 0, 1, 1,
0.6993756, -0.06009163, 0.5168992, 0.5882353, 0, 1, 1,
0.7049032, -0.828713, 2.960295, 0.5960785, 0, 1, 1,
0.7060649, 0.9187247, 1.684051, 0.6039216, 0, 1, 1,
0.7122369, 1.623183, 1.525872, 0.6078432, 0, 1, 1,
0.718694, 0.1065649, 1.855207, 0.6156863, 0, 1, 1,
0.7229058, -0.7679596, 1.474251, 0.6196079, 0, 1, 1,
0.7266972, 1.33559, 0.2954859, 0.627451, 0, 1, 1,
0.7283068, -0.1852781, 1.457712, 0.6313726, 0, 1, 1,
0.7317207, -0.416318, 1.317036, 0.6392157, 0, 1, 1,
0.7344516, 0.9054894, 1.223635, 0.6431373, 0, 1, 1,
0.7425916, 0.7091386, -1.597128, 0.6509804, 0, 1, 1,
0.7461372, -0.4547246, 0.8760929, 0.654902, 0, 1, 1,
0.7488874, -0.9841329, 1.034068, 0.6627451, 0, 1, 1,
0.7547476, -0.9355249, 3.349936, 0.6666667, 0, 1, 1,
0.7584938, 0.4737836, 0.302436, 0.6745098, 0, 1, 1,
0.7593373, 0.7906898, 1.151276, 0.6784314, 0, 1, 1,
0.7658588, 0.4966132, 0.8641946, 0.6862745, 0, 1, 1,
0.7710777, 1.069395, 0.1138494, 0.6901961, 0, 1, 1,
0.7810174, -0.6891616, 4.704712, 0.6980392, 0, 1, 1,
0.7849786, -0.03419906, 2.673459, 0.7058824, 0, 1, 1,
0.7914222, 0.2505035, 1.222166, 0.7098039, 0, 1, 1,
0.7915627, 1.398008, 1.934358, 0.7176471, 0, 1, 1,
0.7972164, 0.6476152, 0.6869959, 0.7215686, 0, 1, 1,
0.7977405, -1.192624, 1.510765, 0.7294118, 0, 1, 1,
0.7980818, 0.2383854, 2.012608, 0.7333333, 0, 1, 1,
0.8084613, -0.3696139, 2.396125, 0.7411765, 0, 1, 1,
0.8115037, -1.293637, 2.137819, 0.7450981, 0, 1, 1,
0.8137531, -0.2550328, 0.03144433, 0.7529412, 0, 1, 1,
0.8138056, -0.2020424, 1.594077, 0.7568628, 0, 1, 1,
0.823371, -0.4397428, 2.874183, 0.7647059, 0, 1, 1,
0.8240148, 0.2298119, 0.005875289, 0.7686275, 0, 1, 1,
0.8264492, 0.6648076, 0.9647959, 0.7764706, 0, 1, 1,
0.8275347, 0.01383221, 1.334367, 0.7803922, 0, 1, 1,
0.8279821, 1.070319, 0.4486195, 0.7882353, 0, 1, 1,
0.8313545, -0.6799895, 4.246096, 0.7921569, 0, 1, 1,
0.8322226, -0.235362, 1.438052, 0.8, 0, 1, 1,
0.841585, -0.3212104, 2.008016, 0.8078431, 0, 1, 1,
0.8419426, -0.01595339, 2.800154, 0.8117647, 0, 1, 1,
0.8420209, 1.572054, 1.477125, 0.8196079, 0, 1, 1,
0.8487684, -0.3017993, 2.50467, 0.8235294, 0, 1, 1,
0.849673, -0.2683422, 1.296145, 0.8313726, 0, 1, 1,
0.8508133, 0.6425534, 1.542743, 0.8352941, 0, 1, 1,
0.8528381, -0.2881194, 2.631371, 0.8431373, 0, 1, 1,
0.8547958, -1.941594, 3.144197, 0.8470588, 0, 1, 1,
0.8576124, -0.3099948, 2.652108, 0.854902, 0, 1, 1,
0.8579948, 0.1318741, 2.014354, 0.8588235, 0, 1, 1,
0.8597611, -0.1946369, 2.563922, 0.8666667, 0, 1, 1,
0.8607485, -1.160624, 3.331279, 0.8705882, 0, 1, 1,
0.8634165, -1.727407, 2.682558, 0.8784314, 0, 1, 1,
0.8664088, 0.7281052, 0.6163144, 0.8823529, 0, 1, 1,
0.8675309, 0.2570667, 0.5490981, 0.8901961, 0, 1, 1,
0.868014, 1.546261, -0.07176818, 0.8941177, 0, 1, 1,
0.8699694, 0.4396221, 1.5203, 0.9019608, 0, 1, 1,
0.8704398, -0.6613218, 1.405647, 0.9098039, 0, 1, 1,
0.8771324, 0.4176378, 1.237089, 0.9137255, 0, 1, 1,
0.8871498, -0.7384117, 0.3483535, 0.9215686, 0, 1, 1,
0.8950639, 1.115674, 1.212206, 0.9254902, 0, 1, 1,
0.8968612, 0.4996161, -0.2621469, 0.9333333, 0, 1, 1,
0.8973199, -0.2214083, 1.56967, 0.9372549, 0, 1, 1,
0.898443, 0.4000881, 2.506205, 0.945098, 0, 1, 1,
0.9015373, 1.208423, 0.1525622, 0.9490196, 0, 1, 1,
0.9064025, -2.4029, 3.441016, 0.9568627, 0, 1, 1,
0.9122698, -2.212151, 2.012558, 0.9607843, 0, 1, 1,
0.9144192, -1.650504, 3.020001, 0.9686275, 0, 1, 1,
0.9203307, 1.273489, 1.110028, 0.972549, 0, 1, 1,
0.9208149, 1.035061, -0.4513896, 0.9803922, 0, 1, 1,
0.9235533, -0.04155092, 0.8482824, 0.9843137, 0, 1, 1,
0.9260837, 0.05999332, 2.295702, 0.9921569, 0, 1, 1,
0.9264669, 1.210116, 1.465096, 0.9960784, 0, 1, 1,
0.9275069, 1.38249, 0.7768667, 1, 0, 0.9960784, 1,
0.9401243, 0.212597, 1.030331, 1, 0, 0.9882353, 1,
0.9445882, 0.4151919, 2.085706, 1, 0, 0.9843137, 1,
0.9448128, 0.6559774, -0.3791355, 1, 0, 0.9764706, 1,
0.945433, -0.2580758, 2.347392, 1, 0, 0.972549, 1,
0.9555927, 0.8328092, 1.693986, 1, 0, 0.9647059, 1,
0.9600919, -1.964577, 2.595731, 1, 0, 0.9607843, 1,
0.9616302, 0.02666567, 0.6199527, 1, 0, 0.9529412, 1,
0.9618696, -0.5614765, 4.669702, 1, 0, 0.9490196, 1,
0.9661093, 0.1506577, 2.107137, 1, 0, 0.9411765, 1,
0.9668313, 0.6260009, 1.588429, 1, 0, 0.9372549, 1,
0.9737836, -0.07895418, 1.572837, 1, 0, 0.9294118, 1,
0.9741185, 0.08120698, 0.261025, 1, 0, 0.9254902, 1,
0.9771969, 0.03281009, 1.67669, 1, 0, 0.9176471, 1,
0.9801129, 0.4100745, 1.605637, 1, 0, 0.9137255, 1,
0.9828267, -1.363226, 2.250697, 1, 0, 0.9058824, 1,
0.9913734, -1.155665, 2.766539, 1, 0, 0.9019608, 1,
0.9935524, -0.07603578, 3.514624, 1, 0, 0.8941177, 1,
1.017937, 0.7577059, -0.7172006, 1, 0, 0.8862745, 1,
1.019843, -0.6017948, 2.68735, 1, 0, 0.8823529, 1,
1.0209, -0.9015566, 1.335263, 1, 0, 0.8745098, 1,
1.024823, 1.463121, -0.8400733, 1, 0, 0.8705882, 1,
1.025756, 1.045509, 1.41901, 1, 0, 0.8627451, 1,
1.034885, -0.3944743, 2.024352, 1, 0, 0.8588235, 1,
1.038683, -0.4321963, 1.235802, 1, 0, 0.8509804, 1,
1.044217, 0.2749391, -0.00216783, 1, 0, 0.8470588, 1,
1.044937, -0.3011495, 1.126155, 1, 0, 0.8392157, 1,
1.054068, 1.240291, 0.6317784, 1, 0, 0.8352941, 1,
1.054219, -0.5993029, 2.31251, 1, 0, 0.827451, 1,
1.055935, -0.07436901, 1.871661, 1, 0, 0.8235294, 1,
1.056041, 0.2790585, 2.125152, 1, 0, 0.8156863, 1,
1.069758, -1.012256, 2.626335, 1, 0, 0.8117647, 1,
1.072754, 1.146994, 1.106728, 1, 0, 0.8039216, 1,
1.073203, -0.1303036, -0.2726265, 1, 0, 0.7960784, 1,
1.079303, -1.582654, 0.3997743, 1, 0, 0.7921569, 1,
1.087668, 2.610675, 1.498492, 1, 0, 0.7843137, 1,
1.090629, -1.388332, 3.935083, 1, 0, 0.7803922, 1,
1.098676, -0.3169349, 0.5509222, 1, 0, 0.772549, 1,
1.101271, -1.007846, 1.978827, 1, 0, 0.7686275, 1,
1.106755, 0.8347676, 0.6877971, 1, 0, 0.7607843, 1,
1.123688, -1.927718, 2.887031, 1, 0, 0.7568628, 1,
1.129433, -0.8295345, 2.036963, 1, 0, 0.7490196, 1,
1.129524, 0.8148118, 1.453668, 1, 0, 0.7450981, 1,
1.133561, -0.9715089, 1.78988, 1, 0, 0.7372549, 1,
1.158322, 0.7059277, 2.929479, 1, 0, 0.7333333, 1,
1.15842, 0.1195367, 0.6495517, 1, 0, 0.7254902, 1,
1.16714, -0.2623603, 1.297527, 1, 0, 0.7215686, 1,
1.170785, -0.1566318, 1.741966, 1, 0, 0.7137255, 1,
1.185223, -1.51758, 2.789654, 1, 0, 0.7098039, 1,
1.185435, -0.05825316, 0.4213044, 1, 0, 0.7019608, 1,
1.190096, 0.5241829, 0.7166784, 1, 0, 0.6941177, 1,
1.208213, 2.051982, -0.5291227, 1, 0, 0.6901961, 1,
1.211697, -0.7568932, 3.15088, 1, 0, 0.682353, 1,
1.213728, -0.8334402, 1.559726, 1, 0, 0.6784314, 1,
1.22596, 1.869797, 0.9300124, 1, 0, 0.6705883, 1,
1.235098, -0.501121, 0.7854146, 1, 0, 0.6666667, 1,
1.242842, -0.469284, 1.499896, 1, 0, 0.6588235, 1,
1.243254, 0.2080771, 2.950883, 1, 0, 0.654902, 1,
1.243989, 1.064704, 0.7891683, 1, 0, 0.6470588, 1,
1.245014, -0.7715027, 2.968909, 1, 0, 0.6431373, 1,
1.257548, 0.9651954, 0.3139412, 1, 0, 0.6352941, 1,
1.260048, -0.8673213, 1.959824, 1, 0, 0.6313726, 1,
1.266315, -2.775522, 3.052347, 1, 0, 0.6235294, 1,
1.292903, 0.7092292, 0.8199551, 1, 0, 0.6196079, 1,
1.302632, 0.1027116, 1.288677, 1, 0, 0.6117647, 1,
1.311483, -1.959802, 2.432349, 1, 0, 0.6078432, 1,
1.314524, -1.477898, 1.56256, 1, 0, 0.6, 1,
1.317438, 1.148387, 0.6893994, 1, 0, 0.5921569, 1,
1.323205, -0.6662881, 1.088311, 1, 0, 0.5882353, 1,
1.334208, -0.8265142, 1.645118, 1, 0, 0.5803922, 1,
1.335064, 0.4043732, 2.057787, 1, 0, 0.5764706, 1,
1.348453, 1.826759, 1.243191, 1, 0, 0.5686275, 1,
1.35221, 0.4705559, 2.563711, 1, 0, 0.5647059, 1,
1.362096, -1.051648, 2.17305, 1, 0, 0.5568628, 1,
1.368828, 1.436144, 2.347181, 1, 0, 0.5529412, 1,
1.373246, 0.1546831, -0.1175172, 1, 0, 0.5450981, 1,
1.374327, 0.4767052, -0.7032856, 1, 0, 0.5411765, 1,
1.387292, -1.814366, -0.426248, 1, 0, 0.5333334, 1,
1.405615, -2.114938, 3.672692, 1, 0, 0.5294118, 1,
1.408525, -1.248564, 1.23651, 1, 0, 0.5215687, 1,
1.415413, -0.4974081, 2.692755, 1, 0, 0.5176471, 1,
1.419789, 2.770707, -0.1660789, 1, 0, 0.509804, 1,
1.423198, 0.6545731, 3.006741, 1, 0, 0.5058824, 1,
1.431336, 0.9781673, 2.784595, 1, 0, 0.4980392, 1,
1.435333, 0.7361207, 1.363118, 1, 0, 0.4901961, 1,
1.436511, 1.226486, 0.7691969, 1, 0, 0.4862745, 1,
1.447126, 0.9872096, -0.925747, 1, 0, 0.4784314, 1,
1.449267, -0.4316663, 2.357268, 1, 0, 0.4745098, 1,
1.460162, -0.2900107, 2.404001, 1, 0, 0.4666667, 1,
1.461571, -1.139083, 2.854312, 1, 0, 0.4627451, 1,
1.464769, 1.790378, 3.649963, 1, 0, 0.454902, 1,
1.468348, -1.285967, 2.041153, 1, 0, 0.4509804, 1,
1.481958, 0.5549978, 0.7410756, 1, 0, 0.4431373, 1,
1.482007, 1.186895, 0.8617427, 1, 0, 0.4392157, 1,
1.483465, -0.896077, 2.227256, 1, 0, 0.4313726, 1,
1.485288, -0.3625004, 2.83107, 1, 0, 0.427451, 1,
1.488375, -0.7454742, 2.693851, 1, 0, 0.4196078, 1,
1.515695, -0.810719, 0.7061777, 1, 0, 0.4156863, 1,
1.519554, 1.063267, 2.029942, 1, 0, 0.4078431, 1,
1.52202, 0.617831, 2.07571, 1, 0, 0.4039216, 1,
1.52472, -2.131311, 1.811605, 1, 0, 0.3960784, 1,
1.531697, 1.896209, 3.427098, 1, 0, 0.3882353, 1,
1.533501, -0.966063, 1.941364, 1, 0, 0.3843137, 1,
1.538609, 1.098481, 2.79511, 1, 0, 0.3764706, 1,
1.540398, -0.2288167, 0.03614565, 1, 0, 0.372549, 1,
1.551912, 0.1186706, 2.215792, 1, 0, 0.3647059, 1,
1.566002, 0.05347384, 0.715085, 1, 0, 0.3607843, 1,
1.575469, 1.195024, 2.05021, 1, 0, 0.3529412, 1,
1.579714, -0.2623855, 1.319566, 1, 0, 0.3490196, 1,
1.579942, 0.2570125, 1.072109, 1, 0, 0.3411765, 1,
1.581425, 0.8323548, 1.371844, 1, 0, 0.3372549, 1,
1.585282, 0.6203251, 1.193786, 1, 0, 0.3294118, 1,
1.587257, 1.75528, 2.141579, 1, 0, 0.3254902, 1,
1.594618, 0.9314158, 1.366851, 1, 0, 0.3176471, 1,
1.607133, 0.6229911, 1.495696, 1, 0, 0.3137255, 1,
1.607324, -0.9925035, 3.114508, 1, 0, 0.3058824, 1,
1.626833, -0.2638524, 2.040289, 1, 0, 0.2980392, 1,
1.628783, 0.2654939, 2.346687, 1, 0, 0.2941177, 1,
1.643919, -0.7295923, 4.70919, 1, 0, 0.2862745, 1,
1.652305, -0.7079697, 3.771177, 1, 0, 0.282353, 1,
1.660555, -0.03521209, -1.63117, 1, 0, 0.2745098, 1,
1.672377, 0.2503808, 0.06618495, 1, 0, 0.2705882, 1,
1.682414, -0.1532494, 0.309205, 1, 0, 0.2627451, 1,
1.689905, 0.2464024, 2.80499, 1, 0, 0.2588235, 1,
1.702591, 0.4099343, 0.2775037, 1, 0, 0.2509804, 1,
1.708208, 1.576223, 0.7837497, 1, 0, 0.2470588, 1,
1.726131, -0.16426, 1.459258, 1, 0, 0.2392157, 1,
1.743197, -0.04465099, 0.6000303, 1, 0, 0.2352941, 1,
1.769722, 0.4208916, -0.04012308, 1, 0, 0.227451, 1,
1.824295, 0.3069155, 1.224863, 1, 0, 0.2235294, 1,
1.861961, -2.441143, 3.193767, 1, 0, 0.2156863, 1,
1.895676, -0.3352265, 2.201704, 1, 0, 0.2117647, 1,
1.899679, 1.659621, 0.372664, 1, 0, 0.2039216, 1,
1.902481, 1.374402, 1.48475, 1, 0, 0.1960784, 1,
1.918106, 1.219097, 0.8970075, 1, 0, 0.1921569, 1,
1.935486, 0.1950904, 0.6573039, 1, 0, 0.1843137, 1,
1.94655, 1.239289, 0.8138258, 1, 0, 0.1803922, 1,
1.973202, 0.7798901, 0.5505204, 1, 0, 0.172549, 1,
1.985144, 0.6236154, 1.168647, 1, 0, 0.1686275, 1,
1.994075, 2.156006, 1.661854, 1, 0, 0.1607843, 1,
1.999105, 0.5934618, -0.06683966, 1, 0, 0.1568628, 1,
2.027677, -0.3418607, 2.348052, 1, 0, 0.1490196, 1,
2.030993, -0.5226617, 2.482332, 1, 0, 0.145098, 1,
2.041309, 1.80475, 1.263873, 1, 0, 0.1372549, 1,
2.14315, 0.5120983, 1.066883, 1, 0, 0.1333333, 1,
2.20988, -0.4231025, 1.702043, 1, 0, 0.1254902, 1,
2.211373, 0.3329905, 2.161806, 1, 0, 0.1215686, 1,
2.214277, 0.2787361, 1.858911, 1, 0, 0.1137255, 1,
2.230438, 0.5289254, 0.3301333, 1, 0, 0.1098039, 1,
2.256677, -0.4433218, 0.6389121, 1, 0, 0.1019608, 1,
2.309068, -0.1083895, 2.447757, 1, 0, 0.09411765, 1,
2.314802, 0.04805493, 1.122344, 1, 0, 0.09019608, 1,
2.331254, 0.4598504, 2.166855, 1, 0, 0.08235294, 1,
2.357554, 1.739859, 1.076033, 1, 0, 0.07843138, 1,
2.365663, 0.5666717, 0.9220431, 1, 0, 0.07058824, 1,
2.396858, 1.026047, 0.8275735, 1, 0, 0.06666667, 1,
2.444549, 0.6318096, 0.4074845, 1, 0, 0.05882353, 1,
2.455221, 0.2395842, 2.065542, 1, 0, 0.05490196, 1,
2.457726, 0.06784304, 1.894604, 1, 0, 0.04705882, 1,
2.516253, 1.125631, 1.187214, 1, 0, 0.04313726, 1,
2.690964, 2.530706, 2.849436, 1, 0, 0.03529412, 1,
2.731134, 0.8966075, 3.520459, 1, 0, 0.03137255, 1,
2.732617, -0.2649717, 1.925433, 1, 0, 0.02352941, 1,
2.783985, 1.373148, 2.186596, 1, 0, 0.01960784, 1,
2.807238, 0.4911723, 1.569097, 1, 0, 0.01176471, 1,
3.149819, 0.2879097, 1.191022, 1, 0, 0.007843138, 1
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
-0.04158056, -3.854509, -6.973651, 0, -0.5, 0.5, 0.5,
-0.04158056, -3.854509, -6.973651, 1, -0.5, 0.5, 0.5,
-0.04158056, -3.854509, -6.973651, 1, 1.5, 0.5, 0.5,
-0.04158056, -3.854509, -6.973651, 0, 1.5, 0.5, 0.5
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
-4.314865, 0.3734205, -6.973651, 0, -0.5, 0.5, 0.5,
-4.314865, 0.3734205, -6.973651, 1, -0.5, 0.5, 0.5,
-4.314865, 0.3734205, -6.973651, 1, 1.5, 0.5, 0.5,
-4.314865, 0.3734205, -6.973651, 0, 1.5, 0.5, 0.5
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
-4.314865, -3.854509, -0.07893896, 0, -0.5, 0.5, 0.5,
-4.314865, -3.854509, -0.07893896, 1, -0.5, 0.5, 0.5,
-4.314865, -3.854509, -0.07893896, 1, 1.5, 0.5, 0.5,
-4.314865, -3.854509, -0.07893896, 0, 1.5, 0.5, 0.5
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
-3, -2.878833, -5.382564,
3, -2.878833, -5.382564,
-3, -2.878833, -5.382564,
-3, -3.041445, -5.647745,
-2, -2.878833, -5.382564,
-2, -3.041445, -5.647745,
-1, -2.878833, -5.382564,
-1, -3.041445, -5.647745,
0, -2.878833, -5.382564,
0, -3.041445, -5.647745,
1, -2.878833, -5.382564,
1, -3.041445, -5.647745,
2, -2.878833, -5.382564,
2, -3.041445, -5.647745,
3, -2.878833, -5.382564,
3, -3.041445, -5.647745
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
-3, -3.366671, -6.178108, 0, -0.5, 0.5, 0.5,
-3, -3.366671, -6.178108, 1, -0.5, 0.5, 0.5,
-3, -3.366671, -6.178108, 1, 1.5, 0.5, 0.5,
-3, -3.366671, -6.178108, 0, 1.5, 0.5, 0.5,
-2, -3.366671, -6.178108, 0, -0.5, 0.5, 0.5,
-2, -3.366671, -6.178108, 1, -0.5, 0.5, 0.5,
-2, -3.366671, -6.178108, 1, 1.5, 0.5, 0.5,
-2, -3.366671, -6.178108, 0, 1.5, 0.5, 0.5,
-1, -3.366671, -6.178108, 0, -0.5, 0.5, 0.5,
-1, -3.366671, -6.178108, 1, -0.5, 0.5, 0.5,
-1, -3.366671, -6.178108, 1, 1.5, 0.5, 0.5,
-1, -3.366671, -6.178108, 0, 1.5, 0.5, 0.5,
0, -3.366671, -6.178108, 0, -0.5, 0.5, 0.5,
0, -3.366671, -6.178108, 1, -0.5, 0.5, 0.5,
0, -3.366671, -6.178108, 1, 1.5, 0.5, 0.5,
0, -3.366671, -6.178108, 0, 1.5, 0.5, 0.5,
1, -3.366671, -6.178108, 0, -0.5, 0.5, 0.5,
1, -3.366671, -6.178108, 1, -0.5, 0.5, 0.5,
1, -3.366671, -6.178108, 1, 1.5, 0.5, 0.5,
1, -3.366671, -6.178108, 0, 1.5, 0.5, 0.5,
2, -3.366671, -6.178108, 0, -0.5, 0.5, 0.5,
2, -3.366671, -6.178108, 1, -0.5, 0.5, 0.5,
2, -3.366671, -6.178108, 1, 1.5, 0.5, 0.5,
2, -3.366671, -6.178108, 0, 1.5, 0.5, 0.5,
3, -3.366671, -6.178108, 0, -0.5, 0.5, 0.5,
3, -3.366671, -6.178108, 1, -0.5, 0.5, 0.5,
3, -3.366671, -6.178108, 1, 1.5, 0.5, 0.5,
3, -3.366671, -6.178108, 0, 1.5, 0.5, 0.5
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
-3.328722, -2, -5.382564,
-3.328722, 3, -5.382564,
-3.328722, -2, -5.382564,
-3.49308, -2, -5.647745,
-3.328722, -1, -5.382564,
-3.49308, -1, -5.647745,
-3.328722, 0, -5.382564,
-3.49308, 0, -5.647745,
-3.328722, 1, -5.382564,
-3.49308, 1, -5.647745,
-3.328722, 2, -5.382564,
-3.49308, 2, -5.647745,
-3.328722, 3, -5.382564,
-3.49308, 3, -5.647745
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
-3.821794, -2, -6.178108, 0, -0.5, 0.5, 0.5,
-3.821794, -2, -6.178108, 1, -0.5, 0.5, 0.5,
-3.821794, -2, -6.178108, 1, 1.5, 0.5, 0.5,
-3.821794, -2, -6.178108, 0, 1.5, 0.5, 0.5,
-3.821794, -1, -6.178108, 0, -0.5, 0.5, 0.5,
-3.821794, -1, -6.178108, 1, -0.5, 0.5, 0.5,
-3.821794, -1, -6.178108, 1, 1.5, 0.5, 0.5,
-3.821794, -1, -6.178108, 0, 1.5, 0.5, 0.5,
-3.821794, 0, -6.178108, 0, -0.5, 0.5, 0.5,
-3.821794, 0, -6.178108, 1, -0.5, 0.5, 0.5,
-3.821794, 0, -6.178108, 1, 1.5, 0.5, 0.5,
-3.821794, 0, -6.178108, 0, 1.5, 0.5, 0.5,
-3.821794, 1, -6.178108, 0, -0.5, 0.5, 0.5,
-3.821794, 1, -6.178108, 1, -0.5, 0.5, 0.5,
-3.821794, 1, -6.178108, 1, 1.5, 0.5, 0.5,
-3.821794, 1, -6.178108, 0, 1.5, 0.5, 0.5,
-3.821794, 2, -6.178108, 0, -0.5, 0.5, 0.5,
-3.821794, 2, -6.178108, 1, -0.5, 0.5, 0.5,
-3.821794, 2, -6.178108, 1, 1.5, 0.5, 0.5,
-3.821794, 2, -6.178108, 0, 1.5, 0.5, 0.5,
-3.821794, 3, -6.178108, 0, -0.5, 0.5, 0.5,
-3.821794, 3, -6.178108, 1, -0.5, 0.5, 0.5,
-3.821794, 3, -6.178108, 1, 1.5, 0.5, 0.5,
-3.821794, 3, -6.178108, 0, 1.5, 0.5, 0.5
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
-3.328722, -2.878833, -4,
-3.328722, -2.878833, 4,
-3.328722, -2.878833, -4,
-3.49308, -3.041445, -4,
-3.328722, -2.878833, -2,
-3.49308, -3.041445, -2,
-3.328722, -2.878833, 0,
-3.49308, -3.041445, 0,
-3.328722, -2.878833, 2,
-3.49308, -3.041445, 2,
-3.328722, -2.878833, 4,
-3.49308, -3.041445, 4
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
-3.821794, -3.366671, -4, 0, -0.5, 0.5, 0.5,
-3.821794, -3.366671, -4, 1, -0.5, 0.5, 0.5,
-3.821794, -3.366671, -4, 1, 1.5, 0.5, 0.5,
-3.821794, -3.366671, -4, 0, 1.5, 0.5, 0.5,
-3.821794, -3.366671, -2, 0, -0.5, 0.5, 0.5,
-3.821794, -3.366671, -2, 1, -0.5, 0.5, 0.5,
-3.821794, -3.366671, -2, 1, 1.5, 0.5, 0.5,
-3.821794, -3.366671, -2, 0, 1.5, 0.5, 0.5,
-3.821794, -3.366671, 0, 0, -0.5, 0.5, 0.5,
-3.821794, -3.366671, 0, 1, -0.5, 0.5, 0.5,
-3.821794, -3.366671, 0, 1, 1.5, 0.5, 0.5,
-3.821794, -3.366671, 0, 0, 1.5, 0.5, 0.5,
-3.821794, -3.366671, 2, 0, -0.5, 0.5, 0.5,
-3.821794, -3.366671, 2, 1, -0.5, 0.5, 0.5,
-3.821794, -3.366671, 2, 1, 1.5, 0.5, 0.5,
-3.821794, -3.366671, 2, 0, 1.5, 0.5, 0.5,
-3.821794, -3.366671, 4, 0, -0.5, 0.5, 0.5,
-3.821794, -3.366671, 4, 1, -0.5, 0.5, 0.5,
-3.821794, -3.366671, 4, 1, 1.5, 0.5, 0.5,
-3.821794, -3.366671, 4, 0, 1.5, 0.5, 0.5
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
-3.328722, -2.878833, -5.382564,
-3.328722, 3.625674, -5.382564,
-3.328722, -2.878833, 5.224686,
-3.328722, 3.625674, 5.224686,
-3.328722, -2.878833, -5.382564,
-3.328722, -2.878833, 5.224686,
-3.328722, 3.625674, -5.382564,
-3.328722, 3.625674, 5.224686,
-3.328722, -2.878833, -5.382564,
3.245561, -2.878833, -5.382564,
-3.328722, -2.878833, 5.224686,
3.245561, -2.878833, 5.224686,
-3.328722, 3.625674, -5.382564,
3.245561, 3.625674, -5.382564,
-3.328722, 3.625674, 5.224686,
3.245561, 3.625674, 5.224686,
3.245561, -2.878833, -5.382564,
3.245561, 3.625674, -5.382564,
3.245561, -2.878833, 5.224686,
3.245561, 3.625674, 5.224686,
3.245561, -2.878833, -5.382564,
3.245561, -2.878833, 5.224686,
3.245561, 3.625674, -5.382564,
3.245561, 3.625674, 5.224686
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
var radius = 7.514599;
var distance = 33.4333;
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
mvMatrix.translate( 0.04158056, -0.3734205, 0.07893896 );
mvMatrix.scale( 1.235866, 1.249123, 0.7659791 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.4333);
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
pyrazosulfuron-ethyl<-read.table("pyrazosulfuron-ethyl.xyz")
```

```
## Error in read.table("pyrazosulfuron-ethyl.xyz"): no lines available in input
```

```r
x<-pyrazosulfuron-ethyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyrazosulfuron' not found
```

```r
y<-pyrazosulfuron-ethyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyrazosulfuron' not found
```

```r
z<-pyrazosulfuron-ethyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyrazosulfuron' not found
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
-3.23298, -0.7574427, -0.9137983, 0, 0, 1, 1, 1,
-3.18856, 0.5825875, -1.887244, 1, 0, 0, 1, 1,
-3.066082, 0.5370547, -2.155851, 1, 0, 0, 1, 1,
-2.863658, -1.17881, -2.560287, 1, 0, 0, 1, 1,
-2.817994, -1.285561, -1.656306, 1, 0, 0, 1, 1,
-2.649732, 2.807483, -1.672247, 1, 0, 0, 1, 1,
-2.485277, -2.073563, -3.508453, 0, 0, 0, 1, 1,
-2.311171, 0.4283733, -0.6621009, 0, 0, 0, 1, 1,
-2.301726, -0.2730858, -0.5193859, 0, 0, 0, 1, 1,
-2.293861, -0.3440123, -2.270569, 0, 0, 0, 1, 1,
-2.269342, -1.717344, -3.179868, 0, 0, 0, 1, 1,
-2.256478, -1.161265, -2.987824, 0, 0, 0, 1, 1,
-2.209883, -0.9896336, -2.339871, 0, 0, 0, 1, 1,
-2.177222, 1.482526, -2.88539, 1, 1, 1, 1, 1,
-2.120622, 0.3675269, -1.684386, 1, 1, 1, 1, 1,
-2.040588, 0.2130393, -2.060446, 1, 1, 1, 1, 1,
-1.9878, -0.07727481, -1.463714, 1, 1, 1, 1, 1,
-1.982646, -0.01964749, -1.64661, 1, 1, 1, 1, 1,
-1.941386, -0.6005207, -0.4818396, 1, 1, 1, 1, 1,
-1.934007, -1.278411, -0.977232, 1, 1, 1, 1, 1,
-1.924451, -0.3293482, -3.704099, 1, 1, 1, 1, 1,
-1.912925, -0.80251, 0.2214048, 1, 1, 1, 1, 1,
-1.896349, 0.6919558, -0.8343536, 1, 1, 1, 1, 1,
-1.88603, -0.6311635, -2.095977, 1, 1, 1, 1, 1,
-1.876128, -0.5956088, -1.835333, 1, 1, 1, 1, 1,
-1.875056, 1.372665, -1.037849, 1, 1, 1, 1, 1,
-1.870742, -0.1460221, -1.977607, 1, 1, 1, 1, 1,
-1.830757, 0.8305771, -0.9764917, 1, 1, 1, 1, 1,
-1.812464, -0.1971199, -2.568497, 0, 0, 1, 1, 1,
-1.790375, -1.008814, -2.747077, 1, 0, 0, 1, 1,
-1.788302, 1.801641, 1.028436, 1, 0, 0, 1, 1,
-1.760511, 2.629359, 0.1825808, 1, 0, 0, 1, 1,
-1.752782, -0.1002237, -0.8841184, 1, 0, 0, 1, 1,
-1.742951, -1.845856, -2.775073, 1, 0, 0, 1, 1,
-1.72403, 1.169687, -1.725861, 0, 0, 0, 1, 1,
-1.721445, 1.298374, -1.192531, 0, 0, 0, 1, 1,
-1.704437, 1.86352, -0.03640062, 0, 0, 0, 1, 1,
-1.702475, 0.5458207, -1.372306, 0, 0, 0, 1, 1,
-1.693529, 1.123789, -2.571605, 0, 0, 0, 1, 1,
-1.679039, -2.213105, -0.8998386, 0, 0, 0, 1, 1,
-1.653077, 0.9159255, -0.4944404, 0, 0, 0, 1, 1,
-1.648654, 0.2427829, -3.235097, 1, 1, 1, 1, 1,
-1.648311, -0.716536, -2.092474, 1, 1, 1, 1, 1,
-1.635888, 0.2190989, -1.599791, 1, 1, 1, 1, 1,
-1.596251, 0.2840396, -1.707192, 1, 1, 1, 1, 1,
-1.582839, -0.1062046, -2.628044, 1, 1, 1, 1, 1,
-1.580736, -1.323166, -3.477707, 1, 1, 1, 1, 1,
-1.574764, 0.1851349, -1.23228, 1, 1, 1, 1, 1,
-1.568553, -2.60851, -2.623615, 1, 1, 1, 1, 1,
-1.560425, 1.760722, -1.238345, 1, 1, 1, 1, 1,
-1.559861, -0.064397, -2.444474, 1, 1, 1, 1, 1,
-1.557895, -0.8445455, -1.459473, 1, 1, 1, 1, 1,
-1.555434, -1.301376, -1.889505, 1, 1, 1, 1, 1,
-1.544921, -0.8397512, -2.399652, 1, 1, 1, 1, 1,
-1.541452, 0.276134, -0.7587278, 1, 1, 1, 1, 1,
-1.531268, -1.10196, -1.087709, 1, 1, 1, 1, 1,
-1.499116, 1.703314, 0.03011965, 0, 0, 1, 1, 1,
-1.494547, 1.106501, -0.4398102, 1, 0, 0, 1, 1,
-1.487369, 0.090022, -2.280288, 1, 0, 0, 1, 1,
-1.483302, -2.185562, -2.130021, 1, 0, 0, 1, 1,
-1.476544, 0.6997114, 0.1528553, 1, 0, 0, 1, 1,
-1.472877, -0.1506859, -1.188192, 1, 0, 0, 1, 1,
-1.471498, -1.439172, -2.707416, 0, 0, 0, 1, 1,
-1.468797, 0.04409466, -4.013714, 0, 0, 0, 1, 1,
-1.464749, 2.261158, -0.7928963, 0, 0, 0, 1, 1,
-1.443803, 0.2011317, -3.089935, 0, 0, 0, 1, 1,
-1.439887, -0.9683849, -0.9801356, 0, 0, 0, 1, 1,
-1.431914, -0.9549357, -2.213133, 0, 0, 0, 1, 1,
-1.431706, -0.813659, -1.699585, 0, 0, 0, 1, 1,
-1.431542, -0.5642236, -2.590124, 1, 1, 1, 1, 1,
-1.43118, -0.04928483, -1.770056, 1, 1, 1, 1, 1,
-1.411109, -0.730813, -1.772489, 1, 1, 1, 1, 1,
-1.389652, -0.6482331, -1.935699, 1, 1, 1, 1, 1,
-1.387993, -0.8978798, -1.957742, 1, 1, 1, 1, 1,
-1.383727, -1.37583, -1.195953, 1, 1, 1, 1, 1,
-1.381733, -0.7548245, -2.056243, 1, 1, 1, 1, 1,
-1.380814, 0.2328362, -0.3334318, 1, 1, 1, 1, 1,
-1.376803, -0.06122841, -0.9456419, 1, 1, 1, 1, 1,
-1.365734, 0.3668155, -0.8538939, 1, 1, 1, 1, 1,
-1.363259, -1.347208, -3.376097, 1, 1, 1, 1, 1,
-1.363079, -1.096786, -3.241329, 1, 1, 1, 1, 1,
-1.362209, -0.4045695, -3.627646, 1, 1, 1, 1, 1,
-1.358751, -0.5046057, 0.2358543, 1, 1, 1, 1, 1,
-1.353397, 0.1603366, -1.731975, 1, 1, 1, 1, 1,
-1.348666, 0.8302109, -1.163278, 0, 0, 1, 1, 1,
-1.343298, -0.4524001, -3.090242, 1, 0, 0, 1, 1,
-1.342454, 0.4844573, 0.1268361, 1, 0, 0, 1, 1,
-1.337307, 1.655055, 0.03028202, 1, 0, 0, 1, 1,
-1.335985, 0.4260574, -1.840925, 1, 0, 0, 1, 1,
-1.333666, -2.26808, -3.639285, 1, 0, 0, 1, 1,
-1.330817, -1.03903, -3.027098, 0, 0, 0, 1, 1,
-1.326707, 0.6566167, -0.5507611, 0, 0, 0, 1, 1,
-1.303505, 0.5508084, -1.742739, 0, 0, 0, 1, 1,
-1.292951, 2.763276, -2.579285, 0, 0, 0, 1, 1,
-1.276292, 0.5394544, -1.060216, 0, 0, 0, 1, 1,
-1.271618, -0.7426788, -1.409717, 0, 0, 0, 1, 1,
-1.235002, 0.09095872, -2.825555, 0, 0, 0, 1, 1,
-1.233417, 0.6202291, -1.200854, 1, 1, 1, 1, 1,
-1.224909, -2.784107, -2.231441, 1, 1, 1, 1, 1,
-1.214942, 0.1255681, -2.921211, 1, 1, 1, 1, 1,
-1.210861, -1.100448, -2.141067, 1, 1, 1, 1, 1,
-1.208931, -0.0790962, -1.376117, 1, 1, 1, 1, 1,
-1.195625, 0.2781444, -0.2976371, 1, 1, 1, 1, 1,
-1.178012, 0.08911283, -2.131137, 1, 1, 1, 1, 1,
-1.173104, 0.6812585, -1.521492, 1, 1, 1, 1, 1,
-1.172167, 0.5123607, -0.07779384, 1, 1, 1, 1, 1,
-1.168774, 0.627077, -0.5895785, 1, 1, 1, 1, 1,
-1.167428, 0.1351376, -2.212294, 1, 1, 1, 1, 1,
-1.165565, 0.6456047, -1.57118, 1, 1, 1, 1, 1,
-1.162352, 0.2542803, -2.36747, 1, 1, 1, 1, 1,
-1.15248, 0.08000121, -0.3962706, 1, 1, 1, 1, 1,
-1.151306, 0.3711621, -2.235106, 1, 1, 1, 1, 1,
-1.151048, -0.2151498, -3.882186, 0, 0, 1, 1, 1,
-1.138337, 0.8350733, 0.3882629, 1, 0, 0, 1, 1,
-1.131728, -0.007065947, -0.23255, 1, 0, 0, 1, 1,
-1.12773, 0.5862393, -1.346006, 1, 0, 0, 1, 1,
-1.124921, -1.112292, -3.454802, 1, 0, 0, 1, 1,
-1.119077, 1.537311, -0.9288712, 1, 0, 0, 1, 1,
-1.118697, -0.1337583, -2.960067, 0, 0, 0, 1, 1,
-1.10276, 0.8280954, -1.016792, 0, 0, 0, 1, 1,
-1.094667, 0.1106898, -0.01199415, 0, 0, 0, 1, 1,
-1.07277, -0.1643764, -1.347264, 0, 0, 0, 1, 1,
-1.07184, -0.6948814, -1.481208, 0, 0, 0, 1, 1,
-1.065256, 0.4946967, -0.07845014, 0, 0, 0, 1, 1,
-1.055852, -1.206527, -1.591604, 0, 0, 0, 1, 1,
-1.055762, -0.2725572, -2.193309, 1, 1, 1, 1, 1,
-1.049542, 0.2926164, -0.916582, 1, 1, 1, 1, 1,
-1.047275, -0.7988728, -3.928553, 1, 1, 1, 1, 1,
-1.041482, 0.4583425, -0.9197816, 1, 1, 1, 1, 1,
-1.035894, 0.9410406, -0.2803067, 1, 1, 1, 1, 1,
-1.033757, 0.5272034, -1.086278, 1, 1, 1, 1, 1,
-1.020817, 1.38838, -0.07757377, 1, 1, 1, 1, 1,
-1.019866, 1.131483, -0.1543437, 1, 1, 1, 1, 1,
-1.013713, 1.405174, -0.51662, 1, 1, 1, 1, 1,
-1.013008, -0.1193434, -0.9065474, 1, 1, 1, 1, 1,
-1.012354, 1.795559, -0.2176981, 1, 1, 1, 1, 1,
-1.008018, -0.7703929, -1.351395, 1, 1, 1, 1, 1,
-1.006364, -1.767132, -2.591914, 1, 1, 1, 1, 1,
-1.004645, 0.08359236, 0.239008, 1, 1, 1, 1, 1,
-1.004062, 1.794035, -1.858929, 1, 1, 1, 1, 1,
-0.9997191, -0.8371898, -2.113113, 0, 0, 1, 1, 1,
-0.9992258, 2.292932, -0.1391912, 1, 0, 0, 1, 1,
-0.9937207, 1.220658, -0.9086411, 1, 0, 0, 1, 1,
-0.9866252, 0.2208983, -1.463279, 1, 0, 0, 1, 1,
-0.9857877, -0.1777879, -2.023455, 1, 0, 0, 1, 1,
-0.9852941, 1.712093, -0.6776171, 1, 0, 0, 1, 1,
-0.9852195, 1.048259, -1.165629, 0, 0, 0, 1, 1,
-0.9837629, 0.07013598, -1.50797, 0, 0, 0, 1, 1,
-0.970301, -0.3563626, -2.439735, 0, 0, 0, 1, 1,
-0.9652092, 0.07726462, -2.36959, 0, 0, 0, 1, 1,
-0.9624409, -1.18341, -1.930883, 0, 0, 0, 1, 1,
-0.9597284, -0.8812281, -3.10391, 0, 0, 0, 1, 1,
-0.9548094, -1.038689, -3.66235, 0, 0, 0, 1, 1,
-0.9524276, -0.3949003, -0.7230583, 1, 1, 1, 1, 1,
-0.9516799, -0.6358557, -0.8142483, 1, 1, 1, 1, 1,
-0.9394669, 2.381893, 0.2739489, 1, 1, 1, 1, 1,
-0.9347171, 1.898084, -0.648253, 1, 1, 1, 1, 1,
-0.9319791, -0.4341586, -2.424847, 1, 1, 1, 1, 1,
-0.9308637, -0.1626255, -0.7491745, 1, 1, 1, 1, 1,
-0.9304331, 1.262337, -1.39954, 1, 1, 1, 1, 1,
-0.9297234, -1.347063, -0.2258808, 1, 1, 1, 1, 1,
-0.9190933, 1.032261, -0.123885, 1, 1, 1, 1, 1,
-0.9169664, -0.4491057, -1.143433, 1, 1, 1, 1, 1,
-0.9156368, 0.2274008, -1.145789, 1, 1, 1, 1, 1,
-0.911532, 1.055905, 0.08714508, 1, 1, 1, 1, 1,
-0.9098638, 0.06042871, -0.4792441, 1, 1, 1, 1, 1,
-0.9095302, -1.512889, -2.280814, 1, 1, 1, 1, 1,
-0.9080961, 0.8074051, -1.726075, 1, 1, 1, 1, 1,
-0.9020481, -1.267845, -5.228089, 0, 0, 1, 1, 1,
-0.9019973, 1.151195, -1.961452, 1, 0, 0, 1, 1,
-0.8966701, -1.125135, -3.437278, 1, 0, 0, 1, 1,
-0.8954545, 0.5447618, -1.276699, 1, 0, 0, 1, 1,
-0.8860412, -0.3225517, -0.5004033, 1, 0, 0, 1, 1,
-0.8805057, -0.6309901, -1.186743, 1, 0, 0, 1, 1,
-0.8784211, -0.8393131, -2.774067, 0, 0, 0, 1, 1,
-0.874589, -1.829822, -2.248849, 0, 0, 0, 1, 1,
-0.8725106, -0.6719134, -2.438682, 0, 0, 0, 1, 1,
-0.8693075, -1.755149, -2.687014, 0, 0, 0, 1, 1,
-0.8643807, 0.521234, -2.152425, 0, 0, 0, 1, 1,
-0.8628165, -0.3738611, -2.446711, 0, 0, 0, 1, 1,
-0.8610308, -1.472775, -3.88424, 0, 0, 0, 1, 1,
-0.858547, 1.354637, 0.409263, 1, 1, 1, 1, 1,
-0.8523825, 0.3710579, -2.133649, 1, 1, 1, 1, 1,
-0.8464639, -0.3196131, -3.134879, 1, 1, 1, 1, 1,
-0.841091, -0.6013227, -1.972107, 1, 1, 1, 1, 1,
-0.8404985, 0.2523101, -0.5707448, 1, 1, 1, 1, 1,
-0.8341853, 1.302591, 1.359933, 1, 1, 1, 1, 1,
-0.8314381, 1.924866, -1.55005, 1, 1, 1, 1, 1,
-0.8288172, -0.9592022, -2.406663, 1, 1, 1, 1, 1,
-0.8252479, 0.2616016, -2.226876, 1, 1, 1, 1, 1,
-0.8244998, 1.338779, -2.107555, 1, 1, 1, 1, 1,
-0.8125945, 0.8668187, -1.579404, 1, 1, 1, 1, 1,
-0.8067402, 2.389694, -0.4261226, 1, 1, 1, 1, 1,
-0.8053128, 0.2639062, -1.20197, 1, 1, 1, 1, 1,
-0.8006863, 0.1923408, -0.9671512, 1, 1, 1, 1, 1,
-0.7984209, 0.9604424, 0.5816225, 1, 1, 1, 1, 1,
-0.7978597, -1.353765, -2.996982, 0, 0, 1, 1, 1,
-0.7870898, -0.4349445, -1.3379, 1, 0, 0, 1, 1,
-0.7856709, 0.593416, 0.1228412, 1, 0, 0, 1, 1,
-0.7830917, 0.001775262, -1.751478, 1, 0, 0, 1, 1,
-0.7789127, -1.621045, -2.373957, 1, 0, 0, 1, 1,
-0.7781504, 0.7193746, -0.8434648, 1, 0, 0, 1, 1,
-0.7769309, 1.080998, -0.5187083, 0, 0, 0, 1, 1,
-0.774001, -1.740671, -3.230509, 0, 0, 0, 1, 1,
-0.7719458, 1.80188, 0.8276298, 0, 0, 0, 1, 1,
-0.7679042, 1.264888, 0.02290347, 0, 0, 0, 1, 1,
-0.7585257, 0.0518319, -1.943719, 0, 0, 0, 1, 1,
-0.7572178, 0.1267481, 0.05688763, 0, 0, 0, 1, 1,
-0.7570955, -0.2367934, -2.046569, 0, 0, 0, 1, 1,
-0.7516393, 0.1976933, -1.709257, 1, 1, 1, 1, 1,
-0.7499976, -0.1202681, -2.358419, 1, 1, 1, 1, 1,
-0.7499952, -0.09156371, -3.073786, 1, 1, 1, 1, 1,
-0.7437294, -0.1326308, -1.460248, 1, 1, 1, 1, 1,
-0.7429057, 0.04374063, -0.7479596, 1, 1, 1, 1, 1,
-0.7415606, 0.3739161, -1.033799, 1, 1, 1, 1, 1,
-0.7260416, 0.5293214, 0.2703869, 1, 1, 1, 1, 1,
-0.7257898, 0.3009063, -0.375392, 1, 1, 1, 1, 1,
-0.7186915, 1.517454, -0.6000844, 1, 1, 1, 1, 1,
-0.7167798, 1.540777, 0.8709744, 1, 1, 1, 1, 1,
-0.7109263, 0.1422028, -2.18237, 1, 1, 1, 1, 1,
-0.7027941, -1.172465, -1.828516, 1, 1, 1, 1, 1,
-0.7010748, -0.5286583, -0.7760352, 1, 1, 1, 1, 1,
-0.696406, -0.1071434, -3.283764, 1, 1, 1, 1, 1,
-0.6954355, 0.1931524, -0.6620564, 1, 1, 1, 1, 1,
-0.6913943, -0.7715739, -2.679094, 0, 0, 1, 1, 1,
-0.6882377, 1.891203, -0.5010089, 1, 0, 0, 1, 1,
-0.6864018, 0.4324357, -2.780918, 1, 0, 0, 1, 1,
-0.6858555, 0.1960486, -2.705721, 1, 0, 0, 1, 1,
-0.6804366, -1.519516, -2.710084, 1, 0, 0, 1, 1,
-0.6767097, -0.3374479, -0.9353189, 1, 0, 0, 1, 1,
-0.670628, -0.5114068, -1.239192, 0, 0, 0, 1, 1,
-0.666128, -0.1286265, -0.06898358, 0, 0, 0, 1, 1,
-0.6651483, -0.1336351, -1.627922, 0, 0, 0, 1, 1,
-0.6646944, -0.1107837, -1.972456, 0, 0, 0, 1, 1,
-0.6638007, 0.9063747, -1.496136, 0, 0, 0, 1, 1,
-0.6573068, -0.3081773, -1.715562, 0, 0, 0, 1, 1,
-0.655492, 0.3647929, -2.707588, 0, 0, 0, 1, 1,
-0.6518726, 1.327873, 1.121428, 1, 1, 1, 1, 1,
-0.6468717, -1.989868, -1.19846, 1, 1, 1, 1, 1,
-0.6453267, -1.228356, -4.454308, 1, 1, 1, 1, 1,
-0.6438789, -0.6241861, -2.383005, 1, 1, 1, 1, 1,
-0.6433089, -1.843725, -0.9256785, 1, 1, 1, 1, 1,
-0.6404289, -1.217763, -2.798093, 1, 1, 1, 1, 1,
-0.6322924, 1.272755, 0.4539421, 1, 1, 1, 1, 1,
-0.6248397, -0.0008207893, -0.9944719, 1, 1, 1, 1, 1,
-0.6241294, -0.9250404, -2.547249, 1, 1, 1, 1, 1,
-0.6236071, 1.188856, 0.4173488, 1, 1, 1, 1, 1,
-0.619509, 0.3521954, -2.829506, 1, 1, 1, 1, 1,
-0.6191006, -1.645147, -2.364516, 1, 1, 1, 1, 1,
-0.6166782, -0.5851951, -3.049099, 1, 1, 1, 1, 1,
-0.6129985, -0.7537172, -2.359828, 1, 1, 1, 1, 1,
-0.6124231, 0.7025352, 0.1194395, 1, 1, 1, 1, 1,
-0.6119308, -0.365752, -2.671074, 0, 0, 1, 1, 1,
-0.6118987, 0.8736774, 1.136528, 1, 0, 0, 1, 1,
-0.6107838, -0.47012, -1.164186, 1, 0, 0, 1, 1,
-0.6100478, 0.7534412, -0.2268851, 1, 0, 0, 1, 1,
-0.6083367, 0.06078381, -2.242767, 1, 0, 0, 1, 1,
-0.6063799, 0.8032209, -0.6713043, 1, 0, 0, 1, 1,
-0.6052626, 0.8193386, -0.3340415, 0, 0, 0, 1, 1,
-0.6049364, 1.894897, -0.2367471, 0, 0, 0, 1, 1,
-0.6046299, 0.1072696, -2.486196, 0, 0, 0, 1, 1,
-0.6030059, -0.6868445, -2.945202, 0, 0, 0, 1, 1,
-0.6017507, -0.6921321, -1.721666, 0, 0, 0, 1, 1,
-0.5991452, -0.8250814, -3.065131, 0, 0, 0, 1, 1,
-0.5964679, 0.3216167, -1.275037, 0, 0, 0, 1, 1,
-0.5957555, -1.623855, -4.103611, 1, 1, 1, 1, 1,
-0.5940245, -0.9357001, -2.493084, 1, 1, 1, 1, 1,
-0.5925844, -0.9332569, -2.959927, 1, 1, 1, 1, 1,
-0.5859276, -0.3239784, -3.169743, 1, 1, 1, 1, 1,
-0.5847844, 3.030804, -0.9919232, 1, 1, 1, 1, 1,
-0.5829253, 0.4913576, -3.167856, 1, 1, 1, 1, 1,
-0.5764242, -1.179606, -1.972905, 1, 1, 1, 1, 1,
-0.5704526, 0.1095677, -0.9726267, 1, 1, 1, 1, 1,
-0.5661249, 1.36109, -0.6169226, 1, 1, 1, 1, 1,
-0.564175, -0.4121022, -3.744554, 1, 1, 1, 1, 1,
-0.562035, -0.4625326, -0.6061094, 1, 1, 1, 1, 1,
-0.5579799, 0.6411167, -1.451113, 1, 1, 1, 1, 1,
-0.5577854, -1.744561, -1.844885, 1, 1, 1, 1, 1,
-0.5570205, 1.662292, -1.835105, 1, 1, 1, 1, 1,
-0.5557829, 0.7481337, -2.14135, 1, 1, 1, 1, 1,
-0.5523984, -1.822654, -3.449961, 0, 0, 1, 1, 1,
-0.5500498, -0.9229171, -2.239579, 1, 0, 0, 1, 1,
-0.5476432, -0.5910712, -2.1303, 1, 0, 0, 1, 1,
-0.5442941, -0.06517185, -0.7870825, 1, 0, 0, 1, 1,
-0.5413288, 0.6487222, -0.005851817, 1, 0, 0, 1, 1,
-0.5384418, 1.684505, -1.071125, 1, 0, 0, 1, 1,
-0.5380671, -0.3159653, -3.546262, 0, 0, 0, 1, 1,
-0.5357653, 0.393069, 0.04196129, 0, 0, 0, 1, 1,
-0.5344276, 0.2141862, -1.606075, 0, 0, 0, 1, 1,
-0.5343015, 0.771163, 0.07073295, 0, 0, 0, 1, 1,
-0.5327821, -1.169157, -2.344936, 0, 0, 0, 1, 1,
-0.5316126, -0.4544837, -2.23431, 0, 0, 0, 1, 1,
-0.5291751, -0.6411571, -1.059334, 0, 0, 0, 1, 1,
-0.5274072, -0.05801848, 1.31721, 1, 1, 1, 1, 1,
-0.5267637, -1.157315, -2.960018, 1, 1, 1, 1, 1,
-0.5267183, 0.6370242, -2.052298, 1, 1, 1, 1, 1,
-0.5263188, -0.5783671, -1.866721, 1, 1, 1, 1, 1,
-0.5243316, -0.6463408, -1.599233, 1, 1, 1, 1, 1,
-0.5160429, -0.1285322, -1.206326, 1, 1, 1, 1, 1,
-0.5138211, 0.5455721, 1.358266, 1, 1, 1, 1, 1,
-0.5126049, -1.541396, -2.789876, 1, 1, 1, 1, 1,
-0.5102525, 1.207003, -0.5406893, 1, 1, 1, 1, 1,
-0.5093749, -0.7903962, -2.236524, 1, 1, 1, 1, 1,
-0.5081865, 0.02110746, -1.437822, 1, 1, 1, 1, 1,
-0.5062422, -1.020506, -1.83847, 1, 1, 1, 1, 1,
-0.5055299, -0.6838499, -1.972896, 1, 1, 1, 1, 1,
-0.4976428, 0.04379038, -0.9291997, 1, 1, 1, 1, 1,
-0.4970825, 0.217946, -0.4316941, 1, 1, 1, 1, 1,
-0.4927149, -0.6144019, -1.88304, 0, 0, 1, 1, 1,
-0.4910769, 0.4790461, -2.660449, 1, 0, 0, 1, 1,
-0.4910333, -0.1784846, -2.598072, 1, 0, 0, 1, 1,
-0.4807001, -1.903806, -1.818419, 1, 0, 0, 1, 1,
-0.4720555, 0.1860748, -0.6987099, 1, 0, 0, 1, 1,
-0.4673171, 0.1804868, -2.134123, 1, 0, 0, 1, 1,
-0.4600966, -0.187664, -2.93762, 0, 0, 0, 1, 1,
-0.4593085, 1.038311, 1.127912, 0, 0, 0, 1, 1,
-0.4580059, 1.220299, 0.06412606, 0, 0, 0, 1, 1,
-0.4564897, -0.5595491, -0.7787169, 0, 0, 0, 1, 1,
-0.4524578, 0.2790279, -1.531378, 0, 0, 0, 1, 1,
-0.4470859, -1.531929, -1.744348, 0, 0, 0, 1, 1,
-0.4470632, 0.009547181, -1.672952, 0, 0, 0, 1, 1,
-0.4442242, 0.03290343, -0.9961449, 1, 1, 1, 1, 1,
-0.4431322, 0.02544152, -0.7921662, 1, 1, 1, 1, 1,
-0.4429366, -0.2788703, -2.692536, 1, 1, 1, 1, 1,
-0.4397373, -1.668823, -1.822187, 1, 1, 1, 1, 1,
-0.4346673, 0.7765759, 0.03451651, 1, 1, 1, 1, 1,
-0.4317619, -0.4923386, -2.198045, 1, 1, 1, 1, 1,
-0.4244281, 0.3986251, 0.9855476, 1, 1, 1, 1, 1,
-0.4152046, -0.4683421, -1.388455, 1, 1, 1, 1, 1,
-0.4106209, 1.718529, 0.4623219, 1, 1, 1, 1, 1,
-0.4079679, -0.448314, -2.569912, 1, 1, 1, 1, 1,
-0.4043929, 0.5957426, -1.254768, 1, 1, 1, 1, 1,
-0.4017077, -0.8875088, -3.876551, 1, 1, 1, 1, 1,
-0.3986795, -0.9576393, -3.054406, 1, 1, 1, 1, 1,
-0.3977854, -0.3186483, -2.796625, 1, 1, 1, 1, 1,
-0.3975791, -1.625488, -4.626137, 1, 1, 1, 1, 1,
-0.3920568, 0.6669667, -2.222683, 0, 0, 1, 1, 1,
-0.391608, -0.5626997, -2.768023, 1, 0, 0, 1, 1,
-0.3915716, 0.910831, 0.2624973, 1, 0, 0, 1, 1,
-0.3894634, -1.434534, -3.854177, 1, 0, 0, 1, 1,
-0.3848078, 0.4761825, -1.202923, 1, 0, 0, 1, 1,
-0.3847125, -0.8739359, -1.769972, 1, 0, 0, 1, 1,
-0.379725, 0.9802554, -0.370231, 0, 0, 0, 1, 1,
-0.3785263, 0.3700829, 0.4739871, 0, 0, 0, 1, 1,
-0.3760705, 1.364826, -0.3317842, 0, 0, 0, 1, 1,
-0.3753357, -0.3040601, -2.306742, 0, 0, 0, 1, 1,
-0.3724851, 1.475094, -1.051696, 0, 0, 0, 1, 1,
-0.3720314, -0.8616065, -4.120247, 0, 0, 0, 1, 1,
-0.3707909, 2.006964, -1.363366, 0, 0, 0, 1, 1,
-0.3671164, -2.246119, -3.278477, 1, 1, 1, 1, 1,
-0.3649614, 1.146225, -1.018768, 1, 1, 1, 1, 1,
-0.3644068, -0.405602, -1.661612, 1, 1, 1, 1, 1,
-0.3555086, -1.606568, -1.720975, 1, 1, 1, 1, 1,
-0.3475412, -0.2147963, -0.7978562, 1, 1, 1, 1, 1,
-0.3461172, -0.3818424, -2.709396, 1, 1, 1, 1, 1,
-0.3381224, -0.195718, -3.250617, 1, 1, 1, 1, 1,
-0.3376498, -1.80557, -4.685258, 1, 1, 1, 1, 1,
-0.334861, 1.523982, -1.456489, 1, 1, 1, 1, 1,
-0.3298723, 2.22723, 1.897304, 1, 1, 1, 1, 1,
-0.3274741, -1.003311, -1.15045, 1, 1, 1, 1, 1,
-0.3223881, -0.1622324, -1.262775, 1, 1, 1, 1, 1,
-0.3200704, -1.14823, -3.97085, 1, 1, 1, 1, 1,
-0.3168569, 0.08210015, -1.648328, 1, 1, 1, 1, 1,
-0.3139546, 0.8111328, -0.320379, 1, 1, 1, 1, 1,
-0.3123244, 0.9853743, 2.124067, 0, 0, 1, 1, 1,
-0.3082885, 0.6426796, -0.3658595, 1, 0, 0, 1, 1,
-0.3077951, -0.2991197, -2.136777, 1, 0, 0, 1, 1,
-0.3053426, -0.1678391, -2.485198, 1, 0, 0, 1, 1,
-0.3027091, 1.489149, 0.3253627, 1, 0, 0, 1, 1,
-0.2924556, -0.6280312, -1.389433, 1, 0, 0, 1, 1,
-0.2911906, -1.006497, -1.702624, 0, 0, 0, 1, 1,
-0.2865953, -0.1864979, -1.703086, 0, 0, 0, 1, 1,
-0.2846313, -0.9471632, -2.350989, 0, 0, 0, 1, 1,
-0.2840039, 0.2146206, -0.534495, 0, 0, 0, 1, 1,
-0.2814914, 0.006165694, -1.483401, 0, 0, 0, 1, 1,
-0.2814172, 1.236185, -0.4014285, 0, 0, 0, 1, 1,
-0.2802426, -1.181462, -1.388444, 0, 0, 0, 1, 1,
-0.2790938, -0.3855341, -4.149698, 1, 1, 1, 1, 1,
-0.2785195, 0.163579, 0.3402673, 1, 1, 1, 1, 1,
-0.2777617, 0.7345989, 1.811242, 1, 1, 1, 1, 1,
-0.2766937, 1.667156, 0.42407, 1, 1, 1, 1, 1,
-0.2722225, 0.007739177, -2.529166, 1, 1, 1, 1, 1,
-0.2711712, -1.123007, -2.217562, 1, 1, 1, 1, 1,
-0.2688969, 2.570164e-05, -2.760765, 1, 1, 1, 1, 1,
-0.266473, -0.2362992, -2.284765, 1, 1, 1, 1, 1,
-0.2630497, -2.470039, -1.58671, 1, 1, 1, 1, 1,
-0.2628871, 1.608442, 0.6210567, 1, 1, 1, 1, 1,
-0.2620744, -1.37784, -3.975243, 1, 1, 1, 1, 1,
-0.2615907, 1.450728, 1.329576, 1, 1, 1, 1, 1,
-0.2593634, -0.8375153, -2.643025, 1, 1, 1, 1, 1,
-0.2561026, -2.542927, -3.105539, 1, 1, 1, 1, 1,
-0.2536822, -0.05820336, -0.6939121, 1, 1, 1, 1, 1,
-0.2515352, 0.5837783, -1.000634, 0, 0, 1, 1, 1,
-0.2510846, -0.3442988, -4.262935, 1, 0, 0, 1, 1,
-0.2491903, -0.8740216, -2.082715, 1, 0, 0, 1, 1,
-0.2464789, -1.391773, -2.153195, 1, 0, 0, 1, 1,
-0.2461507, 1.548399, -0.7617111, 1, 0, 0, 1, 1,
-0.2433693, -1.321027, -2.803449, 1, 0, 0, 1, 1,
-0.2406137, -0.7214482, -3.715676, 0, 0, 0, 1, 1,
-0.2382177, -1.28673, -3.966729, 0, 0, 0, 1, 1,
-0.2346138, -1.528612, -2.48388, 0, 0, 0, 1, 1,
-0.2335719, 0.2207673, -1.909719, 0, 0, 0, 1, 1,
-0.23339, -1.83773, -2.763397, 0, 0, 0, 1, 1,
-0.2320863, -1.649876, -2.201787, 0, 0, 0, 1, 1,
-0.2305813, -0.4698782, -2.973861, 0, 0, 0, 1, 1,
-0.227575, -1.146456, -3.735188, 1, 1, 1, 1, 1,
-0.2235516, 0.04918347, -1.600041, 1, 1, 1, 1, 1,
-0.2192902, -1.25047, -2.726328, 1, 1, 1, 1, 1,
-0.2180068, 1.908292, 0.5178904, 1, 1, 1, 1, 1,
-0.2162407, 1.139767, 0.7058951, 1, 1, 1, 1, 1,
-0.2147767, 1.267749, -0.1444451, 1, 1, 1, 1, 1,
-0.210288, -2.497302, -2.472214, 1, 1, 1, 1, 1,
-0.2044227, 0.6647364, -1.100673, 1, 1, 1, 1, 1,
-0.2041164, 0.5898428, -0.6062895, 1, 1, 1, 1, 1,
-0.2020268, -0.5691065, -3.574407, 1, 1, 1, 1, 1,
-0.1949733, 1.260989, -0.07547179, 1, 1, 1, 1, 1,
-0.1943045, 0.07264103, -2.950061, 1, 1, 1, 1, 1,
-0.1930724, -1.163751, -2.434624, 1, 1, 1, 1, 1,
-0.1925403, 0.1031327, -1.048186, 1, 1, 1, 1, 1,
-0.1894146, -0.1424288, -2.418921, 1, 1, 1, 1, 1,
-0.1812762, -0.9245682, -2.284202, 0, 0, 1, 1, 1,
-0.1765025, 1.646824, -0.4394238, 1, 0, 0, 1, 1,
-0.1723729, -0.01571765, -1.714401, 1, 0, 0, 1, 1,
-0.1720974, 0.9674531, 0.5757064, 1, 0, 0, 1, 1,
-0.169723, 1.721762, 0.8356145, 1, 0, 0, 1, 1,
-0.1682599, 1.227672, -0.7855474, 1, 0, 0, 1, 1,
-0.1678187, -1.415138, -3.61553, 0, 0, 0, 1, 1,
-0.1676677, 1.223128, -1.510551, 0, 0, 0, 1, 1,
-0.1611252, -0.5298544, -1.918612, 0, 0, 0, 1, 1,
-0.1558989, -2.419332, -2.486686, 0, 0, 0, 1, 1,
-0.1466116, 0.1839707, -1.023437, 0, 0, 0, 1, 1,
-0.1450633, 0.5448316, -1.178619, 0, 0, 0, 1, 1,
-0.1436757, -0.4356534, -2.923486, 0, 0, 0, 1, 1,
-0.1434968, -0.6184963, -1.649189, 1, 1, 1, 1, 1,
-0.1429693, 0.833104, -0.5739344, 1, 1, 1, 1, 1,
-0.1398937, 1.567477, -0.866573, 1, 1, 1, 1, 1,
-0.1377239, 0.4027186, -0.8166996, 1, 1, 1, 1, 1,
-0.1346986, 0.8521482, 0.8436832, 1, 1, 1, 1, 1,
-0.1305225, -0.02652421, -0.7055629, 1, 1, 1, 1, 1,
-0.1255671, -0.8821105, -2.589147, 1, 1, 1, 1, 1,
-0.1225699, 0.4592197, -0.05774581, 1, 1, 1, 1, 1,
-0.1215601, -0.1146446, -2.113099, 1, 1, 1, 1, 1,
-0.1183465, -0.6709545, -1.702448, 1, 1, 1, 1, 1,
-0.116689, -0.8026249, -3.14011, 1, 1, 1, 1, 1,
-0.1165585, -0.02012709, -1.053037, 1, 1, 1, 1, 1,
-0.1160311, 0.6725742, -0.9994909, 1, 1, 1, 1, 1,
-0.111921, -1.099087, -3.676187, 1, 1, 1, 1, 1,
-0.1115416, -1.69034, -3.200503, 1, 1, 1, 1, 1,
-0.1105411, -0.3985663, -2.785012, 0, 0, 1, 1, 1,
-0.1097504, 1.484866, -0.4799403, 1, 0, 0, 1, 1,
-0.1092367, 1.59903, -0.56857, 1, 0, 0, 1, 1,
-0.1088337, -0.6254844, -3.217927, 1, 0, 0, 1, 1,
-0.1063921, 1.825412, -1.346638, 1, 0, 0, 1, 1,
-0.1051262, 1.597709, -1.491069, 1, 0, 0, 1, 1,
-0.1028738, 0.002723237, -0.7571415, 0, 0, 0, 1, 1,
-0.1018547, -0.6613663, -2.747566, 0, 0, 0, 1, 1,
-0.09807229, 0.654167, -0.2983754, 0, 0, 0, 1, 1,
-0.09164183, 1.189435, 1.686594, 0, 0, 0, 1, 1,
-0.09136336, 2.174891, 0.9522581, 0, 0, 0, 1, 1,
-0.09072866, 2.372941, 0.6840044, 0, 0, 0, 1, 1,
-0.0901515, -1.412347, -1.595605, 0, 0, 0, 1, 1,
-0.08974843, -0.2549535, -1.768721, 1, 1, 1, 1, 1,
-0.08740077, 2.250397, -1.640262, 1, 1, 1, 1, 1,
-0.08732338, 2.563861, -0.04205425, 1, 1, 1, 1, 1,
-0.08621742, -0.3830121, -3.104663, 1, 1, 1, 1, 1,
-0.08553397, 0.8323851, -0.3986394, 1, 1, 1, 1, 1,
-0.08072148, 1.804214, 0.8051024, 1, 1, 1, 1, 1,
-0.0771388, -0.592815, -3.101421, 1, 1, 1, 1, 1,
-0.0769119, -0.848721, -2.345364, 1, 1, 1, 1, 1,
-0.07425015, 0.2334699, 0.401089, 1, 1, 1, 1, 1,
-0.06929896, -0.01876202, -0.918236, 1, 1, 1, 1, 1,
-0.05989859, -0.3339496, -1.812956, 1, 1, 1, 1, 1,
-0.05847842, -0.5765898, -2.12402, 1, 1, 1, 1, 1,
-0.0572841, 1.76219, 0.04401549, 1, 1, 1, 1, 1,
-0.05503923, -1.537001, -3.033731, 1, 1, 1, 1, 1,
-0.05391208, 0.3636752, -1.055442, 1, 1, 1, 1, 1,
-0.0494362, 0.1426476, -0.2451555, 0, 0, 1, 1, 1,
-0.04923036, 1.464265, 0.2041382, 1, 0, 0, 1, 1,
-0.04793336, -0.6777875, -3.960642, 1, 0, 0, 1, 1,
-0.04296621, -0.8233407, -3.302647, 1, 0, 0, 1, 1,
-0.03827469, -1.395422, -3.430453, 1, 0, 0, 1, 1,
-0.03713527, -0.346327, -4.455959, 1, 0, 0, 1, 1,
-0.03621191, -1.805237, -3.033926, 0, 0, 0, 1, 1,
-0.03479945, -0.05106927, -2.660533, 0, 0, 0, 1, 1,
-0.03373397, -0.4923777, -3.709882, 0, 0, 0, 1, 1,
-0.02632475, 1.114178, -0.2540464, 0, 0, 0, 1, 1,
-0.02114841, -0.9531969, -3.932681, 0, 0, 0, 1, 1,
-0.01650814, 0.1716017, 0.5424987, 0, 0, 0, 1, 1,
-0.01527001, 0.1465402, 0.02393296, 0, 0, 0, 1, 1,
-0.01433875, 0.9954934, -0.9166455, 1, 1, 1, 1, 1,
-0.01313333, 0.9565353, -0.6757064, 1, 1, 1, 1, 1,
-0.01290445, 1.110087, -0.2218239, 1, 1, 1, 1, 1,
-0.01133114, 0.3307783, 0.3039913, 1, 1, 1, 1, 1,
-0.01052732, 0.9553956, 0.5440164, 1, 1, 1, 1, 1,
-0.009501167, -0.8338041, -3.815395, 1, 1, 1, 1, 1,
-0.005613275, 1.667601, 1.800917, 1, 1, 1, 1, 1,
-0.005456438, 0.6118839, 0.7252778, 1, 1, 1, 1, 1,
-0.000868954, 0.0590391, -0.5041444, 1, 1, 1, 1, 1,
0.01194164, 0.7469507, -0.8892893, 1, 1, 1, 1, 1,
0.01238513, 0.1132669, -1.001092, 1, 1, 1, 1, 1,
0.01626623, -0.8912523, 3.559719, 1, 1, 1, 1, 1,
0.02058313, -0.08501798, 2.568533, 1, 1, 1, 1, 1,
0.02191122, -0.3254352, 4.573486, 1, 1, 1, 1, 1,
0.02500074, 0.6311498, 0.1807392, 1, 1, 1, 1, 1,
0.02558754, -0.3352356, 4.354861, 0, 0, 1, 1, 1,
0.02645946, -0.1672297, 1.943464, 1, 0, 0, 1, 1,
0.02677084, -0.7756771, 3.969362, 1, 0, 0, 1, 1,
0.0271693, -0.7918539, 4.120664, 1, 0, 0, 1, 1,
0.03118283, -0.4506183, 3.80275, 1, 0, 0, 1, 1,
0.03165614, 0.1855866, 0.5987923, 1, 0, 0, 1, 1,
0.03255658, 2.381919, -1.438348, 0, 0, 0, 1, 1,
0.03547264, 1.068721, -1.226747, 0, 0, 0, 1, 1,
0.04279406, 1.143513, 0.784841, 0, 0, 0, 1, 1,
0.04425196, -0.6111326, 3.144488, 0, 0, 0, 1, 1,
0.044462, 1.586013, -1.092484, 0, 0, 0, 1, 1,
0.04447282, -0.5133716, 3.54689, 0, 0, 0, 1, 1,
0.04617786, -0.7703043, 1.477585, 0, 0, 0, 1, 1,
0.04718169, -0.3978125, 4.564042, 1, 1, 1, 1, 1,
0.04833278, 1.643867, -0.05735718, 1, 1, 1, 1, 1,
0.05051364, 0.2567993, 0.7087412, 1, 1, 1, 1, 1,
0.05110863, 0.2748345, -0.4104993, 1, 1, 1, 1, 1,
0.05377955, 1.28939, 0.8805103, 1, 1, 1, 1, 1,
0.05450116, 0.6622944, -1.074427, 1, 1, 1, 1, 1,
0.05845085, -0.1666251, 3.800858, 1, 1, 1, 1, 1,
0.06296445, -0.437151, 2.636331, 1, 1, 1, 1, 1,
0.06646863, 3.052202, -0.8194528, 1, 1, 1, 1, 1,
0.06663615, 0.5467029, 2.229652, 1, 1, 1, 1, 1,
0.06700329, 0.3680467, -0.795, 1, 1, 1, 1, 1,
0.06717511, -0.5157989, 2.180763, 1, 1, 1, 1, 1,
0.07667075, -0.4991075, 2.428701, 1, 1, 1, 1, 1,
0.08572946, -1.49311, 3.583899, 1, 1, 1, 1, 1,
0.08841274, -0.7194121, 1.576788, 1, 1, 1, 1, 1,
0.08852545, -0.8290707, 2.64825, 0, 0, 1, 1, 1,
0.0914693, 0.6888328, 1.280898, 1, 0, 0, 1, 1,
0.09412478, 0.1315949, -0.1272666, 1, 0, 0, 1, 1,
0.09472219, -0.04422653, 2.036766, 1, 0, 0, 1, 1,
0.09633245, 0.1751657, 1.681494, 1, 0, 0, 1, 1,
0.0973202, 2.65681, -0.1936771, 1, 0, 0, 1, 1,
0.104684, 0.3725905, -0.2416211, 0, 0, 0, 1, 1,
0.1076487, -0.6420113, 2.658652, 0, 0, 0, 1, 1,
0.1093184, 0.6863371, 1.026606, 0, 0, 0, 1, 1,
0.1112688, 1.424394, -0.07836468, 0, 0, 0, 1, 1,
0.112057, -0.1896846, 1.967642, 0, 0, 0, 1, 1,
0.1131106, -0.1463712, 1.813909, 0, 0, 0, 1, 1,
0.1177977, 0.02609845, 1.99118, 0, 0, 0, 1, 1,
0.1182442, 0.6147972, -2.875641, 1, 1, 1, 1, 1,
0.1191008, -0.8436812, 3.348793, 1, 1, 1, 1, 1,
0.1196097, -0.3220346, 1.415408, 1, 1, 1, 1, 1,
0.1202334, -0.6534448, 3.871672, 1, 1, 1, 1, 1,
0.121676, 0.6231414, -0.2019739, 1, 1, 1, 1, 1,
0.123965, -2.609837, 1.560533, 1, 1, 1, 1, 1,
0.1246407, -1.148543, 3.552304, 1, 1, 1, 1, 1,
0.1251148, 1.957557, 0.5397294, 1, 1, 1, 1, 1,
0.1264756, 0.450185, 0.1596117, 1, 1, 1, 1, 1,
0.1266602, 0.4857236, 1.417694, 1, 1, 1, 1, 1,
0.1310023, 0.4888034, 2.114141, 1, 1, 1, 1, 1,
0.131515, 1.415243, -1.296288, 1, 1, 1, 1, 1,
0.1332402, 0.05255162, -0.4890683, 1, 1, 1, 1, 1,
0.135276, -0.1649757, 3.700832, 1, 1, 1, 1, 1,
0.1368856, -1.46812, 4.285498, 1, 1, 1, 1, 1,
0.1384729, -0.2624624, 1.517486, 0, 0, 1, 1, 1,
0.1428221, 0.07916723, 1.630149, 1, 0, 0, 1, 1,
0.1496865, -0.304483, 2.112417, 1, 0, 0, 1, 1,
0.1498566, 1.365447, -2.039497, 1, 0, 0, 1, 1,
0.1525023, -0.9326806, 3.518826, 1, 0, 0, 1, 1,
0.1539324, -0.639491, 1.537078, 1, 0, 0, 1, 1,
0.1541671, -1.556234, 4.049917, 0, 0, 0, 1, 1,
0.1550885, -1.66807, 2.777308, 0, 0, 0, 1, 1,
0.1566368, -0.00742345, 0.2232966, 0, 0, 0, 1, 1,
0.1582119, 0.3083329, 1.323168, 0, 0, 0, 1, 1,
0.1645075, 0.9051063, 0.6953597, 0, 0, 0, 1, 1,
0.1715528, -0.01125958, 1.755758, 0, 0, 0, 1, 1,
0.1729366, -0.4107632, 2.72082, 0, 0, 0, 1, 1,
0.1774245, 0.6880148, 0.8226087, 1, 1, 1, 1, 1,
0.1854838, -0.7994767, 3.31054, 1, 1, 1, 1, 1,
0.1856672, -0.04191476, 3.735545, 1, 1, 1, 1, 1,
0.1898307, 0.8322257, -0.03823015, 1, 1, 1, 1, 1,
0.1948825, -0.5459504, 1.62532, 1, 1, 1, 1, 1,
0.1961246, -0.6115484, 1.834298, 1, 1, 1, 1, 1,
0.1962497, -0.3528318, 2.781845, 1, 1, 1, 1, 1,
0.2005842, -1.863231, 2.266116, 1, 1, 1, 1, 1,
0.2028371, -0.03686934, 2.157413, 1, 1, 1, 1, 1,
0.2030426, -1.3622, 3.139136, 1, 1, 1, 1, 1,
0.2133097, 0.3355222, -1.306664, 1, 1, 1, 1, 1,
0.213685, 0.1341134, 0.8426477, 1, 1, 1, 1, 1,
0.2154803, -1.524333, 4.060324, 1, 1, 1, 1, 1,
0.2172483, 0.6195571, 1.083899, 1, 1, 1, 1, 1,
0.2184244, 0.7751719, -0.4674611, 1, 1, 1, 1, 1,
0.2185903, 0.5399463, -0.3909229, 0, 0, 1, 1, 1,
0.220387, -0.1283434, 0.3411887, 1, 0, 0, 1, 1,
0.2211237, -0.3945098, 3.26524, 1, 0, 0, 1, 1,
0.2213759, 1.024472, -0.8899951, 1, 0, 0, 1, 1,
0.2284746, -0.1211255, 1.878947, 1, 0, 0, 1, 1,
0.2297388, 1.028993, 0.2796417, 1, 0, 0, 1, 1,
0.2301358, -0.5449124, 3.082364, 0, 0, 0, 1, 1,
0.2310274, 0.510389, 1.876665, 0, 0, 0, 1, 1,
0.2333524, 0.6586411, -0.8837886, 0, 0, 0, 1, 1,
0.2340638, -0.6606438, 2.681139, 0, 0, 0, 1, 1,
0.2341128, 1.288047, -0.7697762, 0, 0, 0, 1, 1,
0.2343553, 0.1866688, 0.3286128, 0, 0, 0, 1, 1,
0.2396756, 0.2546568, 0.5332094, 0, 0, 0, 1, 1,
0.2423381, 0.2687082, 0.5683823, 1, 1, 1, 1, 1,
0.2423784, 2.373771, 0.4359201, 1, 1, 1, 1, 1,
0.2456133, -1.72647, 5.021686, 1, 1, 1, 1, 1,
0.2485942, 0.2847061, 0.8510458, 1, 1, 1, 1, 1,
0.2492762, 1.350975, -0.2431338, 1, 1, 1, 1, 1,
0.2546778, -0.08731669, 0.6122773, 1, 1, 1, 1, 1,
0.2560631, 1.179548, -0.8180094, 1, 1, 1, 1, 1,
0.2561471, -1.308796, 0.9734869, 1, 1, 1, 1, 1,
0.2587539, 1.167285, 0.238777, 1, 1, 1, 1, 1,
0.2587648, 1.19383, 0.1768714, 1, 1, 1, 1, 1,
0.2644767, 0.7485486, 0.8531626, 1, 1, 1, 1, 1,
0.2659824, -1.028806, 3.9276, 1, 1, 1, 1, 1,
0.2686845, 0.6529197, 1.239451, 1, 1, 1, 1, 1,
0.2693388, 0.7929865, -0.9188642, 1, 1, 1, 1, 1,
0.2699522, -1.841568, 1.071454, 1, 1, 1, 1, 1,
0.2700049, 1.142516, -0.6270483, 0, 0, 1, 1, 1,
0.2742518, -0.1493416, 1.431594, 1, 0, 0, 1, 1,
0.2746752, -1.124318, 2.897471, 1, 0, 0, 1, 1,
0.2781605, 0.5852231, 1.546835, 1, 0, 0, 1, 1,
0.2807915, 0.3052402, 0.8457766, 1, 0, 0, 1, 1,
0.2909057, 1.062732, 1.775362, 1, 0, 0, 1, 1,
0.2930439, 0.7633436, -0.3990847, 0, 0, 0, 1, 1,
0.2935115, 0.07920741, 0.7953906, 0, 0, 0, 1, 1,
0.2951044, -0.07017648, 1.835141, 0, 0, 0, 1, 1,
0.2953642, 1.31876, -0.4886723, 0, 0, 0, 1, 1,
0.2959927, -0.08778815, 1.724245, 0, 0, 0, 1, 1,
0.2972488, -0.4935922, 1.867233, 0, 0, 0, 1, 1,
0.2986906, -0.8797148, 1.758598, 0, 0, 0, 1, 1,
0.2999515, 1.426785, 1.150736, 1, 1, 1, 1, 1,
0.302624, 0.08044334, 2.270784, 1, 1, 1, 1, 1,
0.3102216, 0.9495211, 1.194995, 1, 1, 1, 1, 1,
0.3107333, -0.8959268, 2.921793, 1, 1, 1, 1, 1,
0.3166233, 0.0492896, 2.298282, 1, 1, 1, 1, 1,
0.3194943, -1.299785, 5.070211, 1, 1, 1, 1, 1,
0.3252224, -1.187887, 2.406335, 1, 1, 1, 1, 1,
0.3260854, -0.1550788, 1.398103, 1, 1, 1, 1, 1,
0.3294244, 0.7659168, -0.3322828, 1, 1, 1, 1, 1,
0.3337823, 1.641391, 2.01636, 1, 1, 1, 1, 1,
0.3374417, 0.387324, 1.758465, 1, 1, 1, 1, 1,
0.345414, 0.6346493, 1.223601, 1, 1, 1, 1, 1,
0.345843, 0.5480278, 0.3486834, 1, 1, 1, 1, 1,
0.3464718, -0.671582, 2.986847, 1, 1, 1, 1, 1,
0.3524079, -1.287153, 0.9261923, 1, 1, 1, 1, 1,
0.3552251, 1.517318, 0.364084, 0, 0, 1, 1, 1,
0.3559963, -0.3149235, 1.114157, 1, 0, 0, 1, 1,
0.3560408, -1.062114, 1.28024, 1, 0, 0, 1, 1,
0.3575646, -0.9728582, 4.429078, 1, 0, 0, 1, 1,
0.3580584, 0.4294986, -0.6334217, 1, 0, 0, 1, 1,
0.3598391, -1.548023, 3.594001, 1, 0, 0, 1, 1,
0.3619334, -0.2269612, 3.713763, 0, 0, 0, 1, 1,
0.3629203, 0.9438875, 0.9711193, 0, 0, 0, 1, 1,
0.3629382, 0.8556052, -0.6451416, 0, 0, 0, 1, 1,
0.3633832, 0.2063967, 2.021486, 0, 0, 0, 1, 1,
0.3636391, 0.2576657, 1.956687, 0, 0, 0, 1, 1,
0.3666583, 0.348355, -1.416655, 0, 0, 0, 1, 1,
0.3718787, 1.55697, 0.2257661, 0, 0, 0, 1, 1,
0.3728211, 0.7501149, 0.6511245, 1, 1, 1, 1, 1,
0.3736279, -0.4484272, 1.961463, 1, 1, 1, 1, 1,
0.3742969, -1.999148, 2.951181, 1, 1, 1, 1, 1,
0.3784262, 1.961769, 0.09521135, 1, 1, 1, 1, 1,
0.3784859, -0.5489829, 1.677145, 1, 1, 1, 1, 1,
0.3803646, -2.138789, 2.671066, 1, 1, 1, 1, 1,
0.3850183, -0.6581104, 3.634679, 1, 1, 1, 1, 1,
0.3881781, 0.3505642, 0.6438879, 1, 1, 1, 1, 1,
0.3918265, 0.1899967, 1.735677, 1, 1, 1, 1, 1,
0.3990553, -0.2305112, 2.453363, 1, 1, 1, 1, 1,
0.3992239, 1.039308, -0.1460056, 1, 1, 1, 1, 1,
0.4044967, 0.2586041, 0.0222384, 1, 1, 1, 1, 1,
0.4074557, 1.356802, 0.6379528, 1, 1, 1, 1, 1,
0.410007, -0.1040889, 2.613308, 1, 1, 1, 1, 1,
0.4103162, -1.521202, 3.098506, 1, 1, 1, 1, 1,
0.410377, -0.06607281, 3.635175, 0, 0, 1, 1, 1,
0.4112438, -0.4173247, 2.967639, 1, 0, 0, 1, 1,
0.4117087, 0.4109112, -2.119952, 1, 0, 0, 1, 1,
0.413162, 1.374937, 0.05392695, 1, 0, 0, 1, 1,
0.4148332, 0.09150936, 1.370896, 1, 0, 0, 1, 1,
0.4171768, -0.4769343, 2.617472, 1, 0, 0, 1, 1,
0.4212947, -0.1058507, 3.624519, 0, 0, 0, 1, 1,
0.4261445, -0.3283487, 2.998739, 0, 0, 0, 1, 1,
0.4302908, -0.3437583, 0.5736717, 0, 0, 0, 1, 1,
0.4415377, -1.444166, 5.023843, 0, 0, 0, 1, 1,
0.45356, -1.694597, 3.337253, 0, 0, 0, 1, 1,
0.4542896, -1.747248, 3.396761, 0, 0, 0, 1, 1,
0.4553867, 0.9774312, -0.5145423, 0, 0, 0, 1, 1,
0.4555733, -0.9412087, 2.270329, 1, 1, 1, 1, 1,
0.45983, 1.286617, 1.755296, 1, 1, 1, 1, 1,
0.4604076, -1.194495, 1.992683, 1, 1, 1, 1, 1,
0.4615382, -0.4384139, 2.895516, 1, 1, 1, 1, 1,
0.4647859, 2.356252, 1.672544, 1, 1, 1, 1, 1,
0.4650263, -0.7722671, 2.919639, 1, 1, 1, 1, 1,
0.4743108, -0.6700831, 2.329317, 1, 1, 1, 1, 1,
0.4771887, 0.198062, 1.569064, 1, 1, 1, 1, 1,
0.481003, 0.3662488, 1.519024, 1, 1, 1, 1, 1,
0.4812305, -2.507389, 3.024395, 1, 1, 1, 1, 1,
0.4820421, 1.946433, 0.2244003, 1, 1, 1, 1, 1,
0.4823199, -0.582253, 3.451797, 1, 1, 1, 1, 1,
0.4824502, -0.2598438, 0.5030923, 1, 1, 1, 1, 1,
0.483546, 1.112793, -0.0998602, 1, 1, 1, 1, 1,
0.489035, -2.571648, 3.638385, 1, 1, 1, 1, 1,
0.4894562, 0.8497139, 0.3236222, 0, 0, 1, 1, 1,
0.4918061, 1.935985, 1.770372, 1, 0, 0, 1, 1,
0.4948274, 1.605142, 0.5979514, 1, 0, 0, 1, 1,
0.495009, 1.241109, 1.020086, 1, 0, 0, 1, 1,
0.4991847, 1.411839, 1.984754, 1, 0, 0, 1, 1,
0.5001002, -0.7182384, 3.024292, 1, 0, 0, 1, 1,
0.5019858, 0.1948092, 1.291978, 0, 0, 0, 1, 1,
0.5029511, 0.416118, 1.350086, 0, 0, 0, 1, 1,
0.5058488, -1.215034, 2.542554, 0, 0, 0, 1, 1,
0.5156452, 0.687903, 0.4720791, 0, 0, 0, 1, 1,
0.5168346, -0.937474, 1.797986, 0, 0, 0, 1, 1,
0.5205335, 0.2992997, 0.8635234, 0, 0, 0, 1, 1,
0.5219492, -1.046119, 3.06007, 0, 0, 0, 1, 1,
0.5259349, -0.2947711, 1.562691, 1, 1, 1, 1, 1,
0.5263842, -1.273034, 2.805981, 1, 1, 1, 1, 1,
0.530109, -0.02327866, 1.574722, 1, 1, 1, 1, 1,
0.530665, -0.2125634, 3.416446, 1, 1, 1, 1, 1,
0.5325437, -0.8345698, 1.614624, 1, 1, 1, 1, 1,
0.5337266, 0.2042764, 1.158578, 1, 1, 1, 1, 1,
0.5348604, 0.4721826, -1.11892, 1, 1, 1, 1, 1,
0.5381151, -0.9716642, 4.240473, 1, 1, 1, 1, 1,
0.5384239, 1.326215, 0.7629317, 1, 1, 1, 1, 1,
0.5384985, -0.7411149, 1.32322, 1, 1, 1, 1, 1,
0.5400808, 0.2518641, 2.914962, 1, 1, 1, 1, 1,
0.5425206, -0.1071241, 0.009447508, 1, 1, 1, 1, 1,
0.5590765, 0.2833523, 0.1626054, 1, 1, 1, 1, 1,
0.5616764, -0.3322867, 1.605976, 1, 1, 1, 1, 1,
0.5630745, 0.6932639, -0.530911, 1, 1, 1, 1, 1,
0.5667319, -0.4514627, 2.659843, 0, 0, 1, 1, 1,
0.5722293, -1.372813, 2.410398, 1, 0, 0, 1, 1,
0.5723353, 1.53744, 0.9872811, 1, 0, 0, 1, 1,
0.5763829, 0.6137986, 0.4065103, 1, 0, 0, 1, 1,
0.5774668, 0.7659113, 0.9097025, 1, 0, 0, 1, 1,
0.5821159, 1.431809, 1.890532, 1, 0, 0, 1, 1,
0.5855305, 0.1259415, 2.454435, 0, 0, 0, 1, 1,
0.5885415, 1.896563, -0.1455535, 0, 0, 0, 1, 1,
0.5960711, 0.8394641, 1.404647, 0, 0, 0, 1, 1,
0.5969015, -2.228441, 1.919749, 0, 0, 0, 1, 1,
0.6012803, 1.460077, 1.17922, 0, 0, 0, 1, 1,
0.6036209, 1.036626, 0.8959656, 0, 0, 0, 1, 1,
0.611237, -0.9598646, 3.42426, 0, 0, 0, 1, 1,
0.6152553, 0.06643898, 3.020089, 1, 1, 1, 1, 1,
0.6250088, 0.7226744, 1.530275, 1, 1, 1, 1, 1,
0.6265221, -0.2644946, 1.697992, 1, 1, 1, 1, 1,
0.6307328, -0.2890387, 1.931463, 1, 1, 1, 1, 1,
0.6432238, 0.1779695, 1.887371, 1, 1, 1, 1, 1,
0.6461617, -0.9993248, 3.004674, 1, 1, 1, 1, 1,
0.6522533, 0.3658468, 0.6249969, 1, 1, 1, 1, 1,
0.6569691, -0.8837975, 1.407403, 1, 1, 1, 1, 1,
0.6597936, 1.342237, 0.2254435, 1, 1, 1, 1, 1,
0.6605591, -1.836649, 2.299209, 1, 1, 1, 1, 1,
0.6632204, 1.457704, -0.2128171, 1, 1, 1, 1, 1,
0.6763657, -1.205351, 2.44874, 1, 1, 1, 1, 1,
0.6771946, -1.758994, 4.968644, 1, 1, 1, 1, 1,
0.6792063, 1.009083, -0.1901235, 1, 1, 1, 1, 1,
0.6792356, 1.013962, 2.725843, 1, 1, 1, 1, 1,
0.6804726, 0.9951196, 1.646311, 0, 0, 1, 1, 1,
0.6804826, -1.055477, 3.899988, 1, 0, 0, 1, 1,
0.6818746, -0.2733476, 2.349899, 1, 0, 0, 1, 1,
0.6825195, -1.629989, 1.952607, 1, 0, 0, 1, 1,
0.6857738, 3.530948, 0.5710617, 1, 0, 0, 1, 1,
0.6906522, 1.087105, -0.4666486, 1, 0, 0, 1, 1,
0.6945972, -0.2104608, 1.083167, 0, 0, 0, 1, 1,
0.6990422, -1.530257, 1.615416, 0, 0, 0, 1, 1,
0.6991428, -1.680938, 1.622097, 0, 0, 0, 1, 1,
0.6993756, -0.06009163, 0.5168992, 0, 0, 0, 1, 1,
0.7049032, -0.828713, 2.960295, 0, 0, 0, 1, 1,
0.7060649, 0.9187247, 1.684051, 0, 0, 0, 1, 1,
0.7122369, 1.623183, 1.525872, 0, 0, 0, 1, 1,
0.718694, 0.1065649, 1.855207, 1, 1, 1, 1, 1,
0.7229058, -0.7679596, 1.474251, 1, 1, 1, 1, 1,
0.7266972, 1.33559, 0.2954859, 1, 1, 1, 1, 1,
0.7283068, -0.1852781, 1.457712, 1, 1, 1, 1, 1,
0.7317207, -0.416318, 1.317036, 1, 1, 1, 1, 1,
0.7344516, 0.9054894, 1.223635, 1, 1, 1, 1, 1,
0.7425916, 0.7091386, -1.597128, 1, 1, 1, 1, 1,
0.7461372, -0.4547246, 0.8760929, 1, 1, 1, 1, 1,
0.7488874, -0.9841329, 1.034068, 1, 1, 1, 1, 1,
0.7547476, -0.9355249, 3.349936, 1, 1, 1, 1, 1,
0.7584938, 0.4737836, 0.302436, 1, 1, 1, 1, 1,
0.7593373, 0.7906898, 1.151276, 1, 1, 1, 1, 1,
0.7658588, 0.4966132, 0.8641946, 1, 1, 1, 1, 1,
0.7710777, 1.069395, 0.1138494, 1, 1, 1, 1, 1,
0.7810174, -0.6891616, 4.704712, 1, 1, 1, 1, 1,
0.7849786, -0.03419906, 2.673459, 0, 0, 1, 1, 1,
0.7914222, 0.2505035, 1.222166, 1, 0, 0, 1, 1,
0.7915627, 1.398008, 1.934358, 1, 0, 0, 1, 1,
0.7972164, 0.6476152, 0.6869959, 1, 0, 0, 1, 1,
0.7977405, -1.192624, 1.510765, 1, 0, 0, 1, 1,
0.7980818, 0.2383854, 2.012608, 1, 0, 0, 1, 1,
0.8084613, -0.3696139, 2.396125, 0, 0, 0, 1, 1,
0.8115037, -1.293637, 2.137819, 0, 0, 0, 1, 1,
0.8137531, -0.2550328, 0.03144433, 0, 0, 0, 1, 1,
0.8138056, -0.2020424, 1.594077, 0, 0, 0, 1, 1,
0.823371, -0.4397428, 2.874183, 0, 0, 0, 1, 1,
0.8240148, 0.2298119, 0.005875289, 0, 0, 0, 1, 1,
0.8264492, 0.6648076, 0.9647959, 0, 0, 0, 1, 1,
0.8275347, 0.01383221, 1.334367, 1, 1, 1, 1, 1,
0.8279821, 1.070319, 0.4486195, 1, 1, 1, 1, 1,
0.8313545, -0.6799895, 4.246096, 1, 1, 1, 1, 1,
0.8322226, -0.235362, 1.438052, 1, 1, 1, 1, 1,
0.841585, -0.3212104, 2.008016, 1, 1, 1, 1, 1,
0.8419426, -0.01595339, 2.800154, 1, 1, 1, 1, 1,
0.8420209, 1.572054, 1.477125, 1, 1, 1, 1, 1,
0.8487684, -0.3017993, 2.50467, 1, 1, 1, 1, 1,
0.849673, -0.2683422, 1.296145, 1, 1, 1, 1, 1,
0.8508133, 0.6425534, 1.542743, 1, 1, 1, 1, 1,
0.8528381, -0.2881194, 2.631371, 1, 1, 1, 1, 1,
0.8547958, -1.941594, 3.144197, 1, 1, 1, 1, 1,
0.8576124, -0.3099948, 2.652108, 1, 1, 1, 1, 1,
0.8579948, 0.1318741, 2.014354, 1, 1, 1, 1, 1,
0.8597611, -0.1946369, 2.563922, 1, 1, 1, 1, 1,
0.8607485, -1.160624, 3.331279, 0, 0, 1, 1, 1,
0.8634165, -1.727407, 2.682558, 1, 0, 0, 1, 1,
0.8664088, 0.7281052, 0.6163144, 1, 0, 0, 1, 1,
0.8675309, 0.2570667, 0.5490981, 1, 0, 0, 1, 1,
0.868014, 1.546261, -0.07176818, 1, 0, 0, 1, 1,
0.8699694, 0.4396221, 1.5203, 1, 0, 0, 1, 1,
0.8704398, -0.6613218, 1.405647, 0, 0, 0, 1, 1,
0.8771324, 0.4176378, 1.237089, 0, 0, 0, 1, 1,
0.8871498, -0.7384117, 0.3483535, 0, 0, 0, 1, 1,
0.8950639, 1.115674, 1.212206, 0, 0, 0, 1, 1,
0.8968612, 0.4996161, -0.2621469, 0, 0, 0, 1, 1,
0.8973199, -0.2214083, 1.56967, 0, 0, 0, 1, 1,
0.898443, 0.4000881, 2.506205, 0, 0, 0, 1, 1,
0.9015373, 1.208423, 0.1525622, 1, 1, 1, 1, 1,
0.9064025, -2.4029, 3.441016, 1, 1, 1, 1, 1,
0.9122698, -2.212151, 2.012558, 1, 1, 1, 1, 1,
0.9144192, -1.650504, 3.020001, 1, 1, 1, 1, 1,
0.9203307, 1.273489, 1.110028, 1, 1, 1, 1, 1,
0.9208149, 1.035061, -0.4513896, 1, 1, 1, 1, 1,
0.9235533, -0.04155092, 0.8482824, 1, 1, 1, 1, 1,
0.9260837, 0.05999332, 2.295702, 1, 1, 1, 1, 1,
0.9264669, 1.210116, 1.465096, 1, 1, 1, 1, 1,
0.9275069, 1.38249, 0.7768667, 1, 1, 1, 1, 1,
0.9401243, 0.212597, 1.030331, 1, 1, 1, 1, 1,
0.9445882, 0.4151919, 2.085706, 1, 1, 1, 1, 1,
0.9448128, 0.6559774, -0.3791355, 1, 1, 1, 1, 1,
0.945433, -0.2580758, 2.347392, 1, 1, 1, 1, 1,
0.9555927, 0.8328092, 1.693986, 1, 1, 1, 1, 1,
0.9600919, -1.964577, 2.595731, 0, 0, 1, 1, 1,
0.9616302, 0.02666567, 0.6199527, 1, 0, 0, 1, 1,
0.9618696, -0.5614765, 4.669702, 1, 0, 0, 1, 1,
0.9661093, 0.1506577, 2.107137, 1, 0, 0, 1, 1,
0.9668313, 0.6260009, 1.588429, 1, 0, 0, 1, 1,
0.9737836, -0.07895418, 1.572837, 1, 0, 0, 1, 1,
0.9741185, 0.08120698, 0.261025, 0, 0, 0, 1, 1,
0.9771969, 0.03281009, 1.67669, 0, 0, 0, 1, 1,
0.9801129, 0.4100745, 1.605637, 0, 0, 0, 1, 1,
0.9828267, -1.363226, 2.250697, 0, 0, 0, 1, 1,
0.9913734, -1.155665, 2.766539, 0, 0, 0, 1, 1,
0.9935524, -0.07603578, 3.514624, 0, 0, 0, 1, 1,
1.017937, 0.7577059, -0.7172006, 0, 0, 0, 1, 1,
1.019843, -0.6017948, 2.68735, 1, 1, 1, 1, 1,
1.0209, -0.9015566, 1.335263, 1, 1, 1, 1, 1,
1.024823, 1.463121, -0.8400733, 1, 1, 1, 1, 1,
1.025756, 1.045509, 1.41901, 1, 1, 1, 1, 1,
1.034885, -0.3944743, 2.024352, 1, 1, 1, 1, 1,
1.038683, -0.4321963, 1.235802, 1, 1, 1, 1, 1,
1.044217, 0.2749391, -0.00216783, 1, 1, 1, 1, 1,
1.044937, -0.3011495, 1.126155, 1, 1, 1, 1, 1,
1.054068, 1.240291, 0.6317784, 1, 1, 1, 1, 1,
1.054219, -0.5993029, 2.31251, 1, 1, 1, 1, 1,
1.055935, -0.07436901, 1.871661, 1, 1, 1, 1, 1,
1.056041, 0.2790585, 2.125152, 1, 1, 1, 1, 1,
1.069758, -1.012256, 2.626335, 1, 1, 1, 1, 1,
1.072754, 1.146994, 1.106728, 1, 1, 1, 1, 1,
1.073203, -0.1303036, -0.2726265, 1, 1, 1, 1, 1,
1.079303, -1.582654, 0.3997743, 0, 0, 1, 1, 1,
1.087668, 2.610675, 1.498492, 1, 0, 0, 1, 1,
1.090629, -1.388332, 3.935083, 1, 0, 0, 1, 1,
1.098676, -0.3169349, 0.5509222, 1, 0, 0, 1, 1,
1.101271, -1.007846, 1.978827, 1, 0, 0, 1, 1,
1.106755, 0.8347676, 0.6877971, 1, 0, 0, 1, 1,
1.123688, -1.927718, 2.887031, 0, 0, 0, 1, 1,
1.129433, -0.8295345, 2.036963, 0, 0, 0, 1, 1,
1.129524, 0.8148118, 1.453668, 0, 0, 0, 1, 1,
1.133561, -0.9715089, 1.78988, 0, 0, 0, 1, 1,
1.158322, 0.7059277, 2.929479, 0, 0, 0, 1, 1,
1.15842, 0.1195367, 0.6495517, 0, 0, 0, 1, 1,
1.16714, -0.2623603, 1.297527, 0, 0, 0, 1, 1,
1.170785, -0.1566318, 1.741966, 1, 1, 1, 1, 1,
1.185223, -1.51758, 2.789654, 1, 1, 1, 1, 1,
1.185435, -0.05825316, 0.4213044, 1, 1, 1, 1, 1,
1.190096, 0.5241829, 0.7166784, 1, 1, 1, 1, 1,
1.208213, 2.051982, -0.5291227, 1, 1, 1, 1, 1,
1.211697, -0.7568932, 3.15088, 1, 1, 1, 1, 1,
1.213728, -0.8334402, 1.559726, 1, 1, 1, 1, 1,
1.22596, 1.869797, 0.9300124, 1, 1, 1, 1, 1,
1.235098, -0.501121, 0.7854146, 1, 1, 1, 1, 1,
1.242842, -0.469284, 1.499896, 1, 1, 1, 1, 1,
1.243254, 0.2080771, 2.950883, 1, 1, 1, 1, 1,
1.243989, 1.064704, 0.7891683, 1, 1, 1, 1, 1,
1.245014, -0.7715027, 2.968909, 1, 1, 1, 1, 1,
1.257548, 0.9651954, 0.3139412, 1, 1, 1, 1, 1,
1.260048, -0.8673213, 1.959824, 1, 1, 1, 1, 1,
1.266315, -2.775522, 3.052347, 0, 0, 1, 1, 1,
1.292903, 0.7092292, 0.8199551, 1, 0, 0, 1, 1,
1.302632, 0.1027116, 1.288677, 1, 0, 0, 1, 1,
1.311483, -1.959802, 2.432349, 1, 0, 0, 1, 1,
1.314524, -1.477898, 1.56256, 1, 0, 0, 1, 1,
1.317438, 1.148387, 0.6893994, 1, 0, 0, 1, 1,
1.323205, -0.6662881, 1.088311, 0, 0, 0, 1, 1,
1.334208, -0.8265142, 1.645118, 0, 0, 0, 1, 1,
1.335064, 0.4043732, 2.057787, 0, 0, 0, 1, 1,
1.348453, 1.826759, 1.243191, 0, 0, 0, 1, 1,
1.35221, 0.4705559, 2.563711, 0, 0, 0, 1, 1,
1.362096, -1.051648, 2.17305, 0, 0, 0, 1, 1,
1.368828, 1.436144, 2.347181, 0, 0, 0, 1, 1,
1.373246, 0.1546831, -0.1175172, 1, 1, 1, 1, 1,
1.374327, 0.4767052, -0.7032856, 1, 1, 1, 1, 1,
1.387292, -1.814366, -0.426248, 1, 1, 1, 1, 1,
1.405615, -2.114938, 3.672692, 1, 1, 1, 1, 1,
1.408525, -1.248564, 1.23651, 1, 1, 1, 1, 1,
1.415413, -0.4974081, 2.692755, 1, 1, 1, 1, 1,
1.419789, 2.770707, -0.1660789, 1, 1, 1, 1, 1,
1.423198, 0.6545731, 3.006741, 1, 1, 1, 1, 1,
1.431336, 0.9781673, 2.784595, 1, 1, 1, 1, 1,
1.435333, 0.7361207, 1.363118, 1, 1, 1, 1, 1,
1.436511, 1.226486, 0.7691969, 1, 1, 1, 1, 1,
1.447126, 0.9872096, -0.925747, 1, 1, 1, 1, 1,
1.449267, -0.4316663, 2.357268, 1, 1, 1, 1, 1,
1.460162, -0.2900107, 2.404001, 1, 1, 1, 1, 1,
1.461571, -1.139083, 2.854312, 1, 1, 1, 1, 1,
1.464769, 1.790378, 3.649963, 0, 0, 1, 1, 1,
1.468348, -1.285967, 2.041153, 1, 0, 0, 1, 1,
1.481958, 0.5549978, 0.7410756, 1, 0, 0, 1, 1,
1.482007, 1.186895, 0.8617427, 1, 0, 0, 1, 1,
1.483465, -0.896077, 2.227256, 1, 0, 0, 1, 1,
1.485288, -0.3625004, 2.83107, 1, 0, 0, 1, 1,
1.488375, -0.7454742, 2.693851, 0, 0, 0, 1, 1,
1.515695, -0.810719, 0.7061777, 0, 0, 0, 1, 1,
1.519554, 1.063267, 2.029942, 0, 0, 0, 1, 1,
1.52202, 0.617831, 2.07571, 0, 0, 0, 1, 1,
1.52472, -2.131311, 1.811605, 0, 0, 0, 1, 1,
1.531697, 1.896209, 3.427098, 0, 0, 0, 1, 1,
1.533501, -0.966063, 1.941364, 0, 0, 0, 1, 1,
1.538609, 1.098481, 2.79511, 1, 1, 1, 1, 1,
1.540398, -0.2288167, 0.03614565, 1, 1, 1, 1, 1,
1.551912, 0.1186706, 2.215792, 1, 1, 1, 1, 1,
1.566002, 0.05347384, 0.715085, 1, 1, 1, 1, 1,
1.575469, 1.195024, 2.05021, 1, 1, 1, 1, 1,
1.579714, -0.2623855, 1.319566, 1, 1, 1, 1, 1,
1.579942, 0.2570125, 1.072109, 1, 1, 1, 1, 1,
1.581425, 0.8323548, 1.371844, 1, 1, 1, 1, 1,
1.585282, 0.6203251, 1.193786, 1, 1, 1, 1, 1,
1.587257, 1.75528, 2.141579, 1, 1, 1, 1, 1,
1.594618, 0.9314158, 1.366851, 1, 1, 1, 1, 1,
1.607133, 0.6229911, 1.495696, 1, 1, 1, 1, 1,
1.607324, -0.9925035, 3.114508, 1, 1, 1, 1, 1,
1.626833, -0.2638524, 2.040289, 1, 1, 1, 1, 1,
1.628783, 0.2654939, 2.346687, 1, 1, 1, 1, 1,
1.643919, -0.7295923, 4.70919, 0, 0, 1, 1, 1,
1.652305, -0.7079697, 3.771177, 1, 0, 0, 1, 1,
1.660555, -0.03521209, -1.63117, 1, 0, 0, 1, 1,
1.672377, 0.2503808, 0.06618495, 1, 0, 0, 1, 1,
1.682414, -0.1532494, 0.309205, 1, 0, 0, 1, 1,
1.689905, 0.2464024, 2.80499, 1, 0, 0, 1, 1,
1.702591, 0.4099343, 0.2775037, 0, 0, 0, 1, 1,
1.708208, 1.576223, 0.7837497, 0, 0, 0, 1, 1,
1.726131, -0.16426, 1.459258, 0, 0, 0, 1, 1,
1.743197, -0.04465099, 0.6000303, 0, 0, 0, 1, 1,
1.769722, 0.4208916, -0.04012308, 0, 0, 0, 1, 1,
1.824295, 0.3069155, 1.224863, 0, 0, 0, 1, 1,
1.861961, -2.441143, 3.193767, 0, 0, 0, 1, 1,
1.895676, -0.3352265, 2.201704, 1, 1, 1, 1, 1,
1.899679, 1.659621, 0.372664, 1, 1, 1, 1, 1,
1.902481, 1.374402, 1.48475, 1, 1, 1, 1, 1,
1.918106, 1.219097, 0.8970075, 1, 1, 1, 1, 1,
1.935486, 0.1950904, 0.6573039, 1, 1, 1, 1, 1,
1.94655, 1.239289, 0.8138258, 1, 1, 1, 1, 1,
1.973202, 0.7798901, 0.5505204, 1, 1, 1, 1, 1,
1.985144, 0.6236154, 1.168647, 1, 1, 1, 1, 1,
1.994075, 2.156006, 1.661854, 1, 1, 1, 1, 1,
1.999105, 0.5934618, -0.06683966, 1, 1, 1, 1, 1,
2.027677, -0.3418607, 2.348052, 1, 1, 1, 1, 1,
2.030993, -0.5226617, 2.482332, 1, 1, 1, 1, 1,
2.041309, 1.80475, 1.263873, 1, 1, 1, 1, 1,
2.14315, 0.5120983, 1.066883, 1, 1, 1, 1, 1,
2.20988, -0.4231025, 1.702043, 1, 1, 1, 1, 1,
2.211373, 0.3329905, 2.161806, 0, 0, 1, 1, 1,
2.214277, 0.2787361, 1.858911, 1, 0, 0, 1, 1,
2.230438, 0.5289254, 0.3301333, 1, 0, 0, 1, 1,
2.256677, -0.4433218, 0.6389121, 1, 0, 0, 1, 1,
2.309068, -0.1083895, 2.447757, 1, 0, 0, 1, 1,
2.314802, 0.04805493, 1.122344, 1, 0, 0, 1, 1,
2.331254, 0.4598504, 2.166855, 0, 0, 0, 1, 1,
2.357554, 1.739859, 1.076033, 0, 0, 0, 1, 1,
2.365663, 0.5666717, 0.9220431, 0, 0, 0, 1, 1,
2.396858, 1.026047, 0.8275735, 0, 0, 0, 1, 1,
2.444549, 0.6318096, 0.4074845, 0, 0, 0, 1, 1,
2.455221, 0.2395842, 2.065542, 0, 0, 0, 1, 1,
2.457726, 0.06784304, 1.894604, 0, 0, 0, 1, 1,
2.516253, 1.125631, 1.187214, 1, 1, 1, 1, 1,
2.690964, 2.530706, 2.849436, 1, 1, 1, 1, 1,
2.731134, 0.8966075, 3.520459, 1, 1, 1, 1, 1,
2.732617, -0.2649717, 1.925433, 1, 1, 1, 1, 1,
2.783985, 1.373148, 2.186596, 1, 1, 1, 1, 1,
2.807238, 0.4911723, 1.569097, 1, 1, 1, 1, 1,
3.149819, 0.2879097, 1.191022, 1, 1, 1, 1, 1
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
var radius = 9.376809;
var distance = 32.93565;
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
mvMatrix.translate( 0.04158068, -0.3734204, 0.07893896 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -32.93565);
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
