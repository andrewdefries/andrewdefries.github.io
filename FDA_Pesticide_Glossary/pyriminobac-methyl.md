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
-2.920362, 0.2536588, -0.3589557, 1, 0, 0, 1,
-2.834404, -0.5796092, -1.720067, 1, 0.007843138, 0, 1,
-2.579723, -0.5551288, -2.845822, 1, 0.01176471, 0, 1,
-2.575568, 0.9064186, -2.341048, 1, 0.01960784, 0, 1,
-2.539337, 0.5523977, -0.7016301, 1, 0.02352941, 0, 1,
-2.468984, -0.06377743, -1.818008, 1, 0.03137255, 0, 1,
-2.452097, -0.433227, -1.679291, 1, 0.03529412, 0, 1,
-2.451006, 1.045274, 0.1110553, 1, 0.04313726, 0, 1,
-2.367989, 0.7644205, -0.5602416, 1, 0.04705882, 0, 1,
-2.336663, -0.3697661, -2.993208, 1, 0.05490196, 0, 1,
-2.334031, -0.9787228, -3.600588, 1, 0.05882353, 0, 1,
-2.2999, -0.4752193, -2.264815, 1, 0.06666667, 0, 1,
-2.289833, 0.2879402, -2.032458, 1, 0.07058824, 0, 1,
-2.282819, -0.3212221, -0.4800463, 1, 0.07843138, 0, 1,
-2.243082, -1.760699, -2.411479, 1, 0.08235294, 0, 1,
-2.145115, -2.525919, -3.72249, 1, 0.09019608, 0, 1,
-2.12033, -1.104825, -1.270467, 1, 0.09411765, 0, 1,
-2.101679, 0.4393515, -1.389502, 1, 0.1019608, 0, 1,
-2.076323, -0.5464675, -3.015965, 1, 0.1098039, 0, 1,
-2.007484, -0.3383979, -0.8928081, 1, 0.1137255, 0, 1,
-1.996647, -0.8942281, -2.204831, 1, 0.1215686, 0, 1,
-1.973356, -0.710146, -1.600478, 1, 0.1254902, 0, 1,
-1.971885, -1.44671, -1.14444, 1, 0.1333333, 0, 1,
-1.966854, 0.01084042, -0.5472186, 1, 0.1372549, 0, 1,
-1.956638, 3.038652, -1.593923, 1, 0.145098, 0, 1,
-1.943277, -0.9616385, -4.023931, 1, 0.1490196, 0, 1,
-1.924352, 1.667266, 0.2157499, 1, 0.1568628, 0, 1,
-1.894288, -1.277339, -1.095973, 1, 0.1607843, 0, 1,
-1.880076, -0.7139416, -2.192032, 1, 0.1686275, 0, 1,
-1.856088, 0.6286659, -0.2729133, 1, 0.172549, 0, 1,
-1.827263, 0.03026082, -0.7131556, 1, 0.1803922, 0, 1,
-1.823688, -0.5787039, -1.391155, 1, 0.1843137, 0, 1,
-1.822225, -1.506819, -3.652789, 1, 0.1921569, 0, 1,
-1.758518, -3.174265, -2.08995, 1, 0.1960784, 0, 1,
-1.75657, -0.1448249, -0.3587318, 1, 0.2039216, 0, 1,
-1.754138, 2.12254, -0.957699, 1, 0.2117647, 0, 1,
-1.738552, -0.0959054, -2.484978, 1, 0.2156863, 0, 1,
-1.734626, 1.259319, -2.684991, 1, 0.2235294, 0, 1,
-1.686585, -0.842099, -2.163796, 1, 0.227451, 0, 1,
-1.651068, -0.588328, -1.570545, 1, 0.2352941, 0, 1,
-1.635596, -1.327, -1.786773, 1, 0.2392157, 0, 1,
-1.634077, 0.1253607, -0.2527144, 1, 0.2470588, 0, 1,
-1.626493, 1.069299, -1.649727, 1, 0.2509804, 0, 1,
-1.598943, -0.6492971, -2.480473, 1, 0.2588235, 0, 1,
-1.591598, -1.761139, -2.074775, 1, 0.2627451, 0, 1,
-1.591499, -0.3300909, -2.555044, 1, 0.2705882, 0, 1,
-1.57738, -0.6652542, -2.546777, 1, 0.2745098, 0, 1,
-1.577044, 0.5335197, -0.4817566, 1, 0.282353, 0, 1,
-1.57294, -0.6157076, -3.003347, 1, 0.2862745, 0, 1,
-1.565151, -0.7697974, -3.400967, 1, 0.2941177, 0, 1,
-1.560501, 1.771864, -2.06846, 1, 0.3019608, 0, 1,
-1.559275, 0.9655836, -3.100152, 1, 0.3058824, 0, 1,
-1.55452, -0.2268122, -2.494821, 1, 0.3137255, 0, 1,
-1.553414, 0.4864215, -2.492672, 1, 0.3176471, 0, 1,
-1.55007, -0.8678527, -2.157331, 1, 0.3254902, 0, 1,
-1.547085, 0.005331318, -2.457354, 1, 0.3294118, 0, 1,
-1.54513, 0.3460212, -1.8469, 1, 0.3372549, 0, 1,
-1.514285, 1.405592, 0.3155983, 1, 0.3411765, 0, 1,
-1.500409, -1.546937, -2.878929, 1, 0.3490196, 0, 1,
-1.485432, -0.5198369, -2.995316, 1, 0.3529412, 0, 1,
-1.477305, 0.2717162, -1.79476, 1, 0.3607843, 0, 1,
-1.475766, 0.1161834, -2.008985, 1, 0.3647059, 0, 1,
-1.45886, -1.363708, -1.689096, 1, 0.372549, 0, 1,
-1.455043, 0.2420956, -0.3728164, 1, 0.3764706, 0, 1,
-1.447248, -0.7016557, -2.716322, 1, 0.3843137, 0, 1,
-1.445139, -0.08546495, -0.07947563, 1, 0.3882353, 0, 1,
-1.43875, 1.481108, 0.6255612, 1, 0.3960784, 0, 1,
-1.409837, 1.092204, -2.261783, 1, 0.4039216, 0, 1,
-1.40769, 0.5561491, -0.3578029, 1, 0.4078431, 0, 1,
-1.395209, -0.06775324, -1.706307, 1, 0.4156863, 0, 1,
-1.391524, 0.7188271, -1.217284, 1, 0.4196078, 0, 1,
-1.376394, -0.1796878, -1.726317, 1, 0.427451, 0, 1,
-1.374159, -0.7727326, -2.481717, 1, 0.4313726, 0, 1,
-1.366877, 1.148996, -2.106856, 1, 0.4392157, 0, 1,
-1.354234, 0.4181356, -1.477108, 1, 0.4431373, 0, 1,
-1.345722, -0.3255776, -1.644367, 1, 0.4509804, 0, 1,
-1.343778, -0.3452218, -2.707631, 1, 0.454902, 0, 1,
-1.336525, 0.6097769, -1.689369, 1, 0.4627451, 0, 1,
-1.334607, -1.388974, -2.368056, 1, 0.4666667, 0, 1,
-1.329543, -0.2055682, -0.4289164, 1, 0.4745098, 0, 1,
-1.328852, -1.010925, -2.32672, 1, 0.4784314, 0, 1,
-1.326465, 0.4384853, -2.370334, 1, 0.4862745, 0, 1,
-1.319273, 0.785521, -0.8239297, 1, 0.4901961, 0, 1,
-1.31466, -0.7491166, -2.392132, 1, 0.4980392, 0, 1,
-1.30495, -1.960672, -4.068267, 1, 0.5058824, 0, 1,
-1.302335, -1.50667, -3.377274, 1, 0.509804, 0, 1,
-1.295599, -1.576385, -3.647994, 1, 0.5176471, 0, 1,
-1.29446, 0.07208136, -2.836521, 1, 0.5215687, 0, 1,
-1.292656, 0.8320816, -0.9669449, 1, 0.5294118, 0, 1,
-1.288995, 0.1595826, -3.183711, 1, 0.5333334, 0, 1,
-1.287195, -0.3990338, -2.8779, 1, 0.5411765, 0, 1,
-1.275614, -0.1969069, -2.164155, 1, 0.5450981, 0, 1,
-1.274731, -0.4900636, -3.43434, 1, 0.5529412, 0, 1,
-1.272398, 1.603869, -1.709246, 1, 0.5568628, 0, 1,
-1.262878, -0.05515369, -0.01995614, 1, 0.5647059, 0, 1,
-1.261023, 1.617605, -1.722794, 1, 0.5686275, 0, 1,
-1.248952, -0.1609315, 0.7213122, 1, 0.5764706, 0, 1,
-1.244763, 0.6132826, -0.08691353, 1, 0.5803922, 0, 1,
-1.228932, -0.9244049, -2.021858, 1, 0.5882353, 0, 1,
-1.228227, -1.003307, -3.747882, 1, 0.5921569, 0, 1,
-1.223674, -0.3115618, -0.6149421, 1, 0.6, 0, 1,
-1.223232, -0.5960841, -2.58756, 1, 0.6078432, 0, 1,
-1.214819, -0.2668501, -3.091151, 1, 0.6117647, 0, 1,
-1.204983, -0.9510269, -2.163073, 1, 0.6196079, 0, 1,
-1.188775, -1.040259, -1.929011, 1, 0.6235294, 0, 1,
-1.179393, 1.054538, -2.827894, 1, 0.6313726, 0, 1,
-1.170208, 0.7442751, -1.736782, 1, 0.6352941, 0, 1,
-1.16283, -0.02194657, -1.824255, 1, 0.6431373, 0, 1,
-1.1578, 0.2276556, -1.438257, 1, 0.6470588, 0, 1,
-1.15273, -0.01641312, -2.028873, 1, 0.654902, 0, 1,
-1.143504, -0.5665309, -0.7890165, 1, 0.6588235, 0, 1,
-1.141574, -0.05631047, -1.771996, 1, 0.6666667, 0, 1,
-1.138279, 0.1425393, -3.206423, 1, 0.6705883, 0, 1,
-1.11536, -0.8870085, -2.486714, 1, 0.6784314, 0, 1,
-1.111314, 0.32087, -0.4223448, 1, 0.682353, 0, 1,
-1.111288, -0.7738286, -2.042387, 1, 0.6901961, 0, 1,
-1.110793, -1.96111, -2.894198, 1, 0.6941177, 0, 1,
-1.105072, 0.2712601, -0.05581354, 1, 0.7019608, 0, 1,
-1.102542, -1.707571, -2.093424, 1, 0.7098039, 0, 1,
-1.099608, 0.7589269, -1.430048, 1, 0.7137255, 0, 1,
-1.094683, 1.602874, 0.1155708, 1, 0.7215686, 0, 1,
-1.094531, 1.197635, -3.166204, 1, 0.7254902, 0, 1,
-1.090631, 0.4525835, -3.67492, 1, 0.7333333, 0, 1,
-1.086496, -0.7312132, -1.630866, 1, 0.7372549, 0, 1,
-1.083115, -0.1271168, 0.4513059, 1, 0.7450981, 0, 1,
-1.079656, -0.4768271, -1.834696, 1, 0.7490196, 0, 1,
-1.076519, -0.9832719, -2.48981, 1, 0.7568628, 0, 1,
-1.073148, -0.7753999, -0.1633098, 1, 0.7607843, 0, 1,
-1.071593, -0.2878438, -0.5894866, 1, 0.7686275, 0, 1,
-1.069094, -0.01733981, -1.073336, 1, 0.772549, 0, 1,
-1.060081, 0.1196817, -1.420732, 1, 0.7803922, 0, 1,
-1.056814, -1.571603, -3.218286, 1, 0.7843137, 0, 1,
-1.051929, -0.05381963, -1.607812, 1, 0.7921569, 0, 1,
-1.051628, 1.004393, -0.9499537, 1, 0.7960784, 0, 1,
-1.033579, 0.9542858, -0.4814174, 1, 0.8039216, 0, 1,
-1.029086, 0.06451166, -0.6090628, 1, 0.8117647, 0, 1,
-1.025722, 0.2977919, -0.4908876, 1, 0.8156863, 0, 1,
-1.021913, 0.6636022, -1.466729, 1, 0.8235294, 0, 1,
-1.018475, -0.2426683, -2.222458, 1, 0.827451, 0, 1,
-1.017695, -1.819291, -3.54714, 1, 0.8352941, 0, 1,
-1.016486, -2.157074, -2.003234, 1, 0.8392157, 0, 1,
-1.015611, -0.4773583, -1.75785, 1, 0.8470588, 0, 1,
-1.014976, 1.761482, -1.221178, 1, 0.8509804, 0, 1,
-1.013608, 0.4128943, -2.11269, 1, 0.8588235, 0, 1,
-1.008324, 0.511871, -2.073587, 1, 0.8627451, 0, 1,
-1.004494, -0.317004, -2.693368, 1, 0.8705882, 0, 1,
-1.002762, 1.779406, -1.567869, 1, 0.8745098, 0, 1,
-0.9970584, 0.6721397, -2.209293, 1, 0.8823529, 0, 1,
-0.9935445, 0.1528883, -1.05767, 1, 0.8862745, 0, 1,
-0.9848701, -0.235656, -1.068038, 1, 0.8941177, 0, 1,
-0.9764472, 0.4150758, 0.01578788, 1, 0.8980392, 0, 1,
-0.971852, -0.4832483, -3.420575, 1, 0.9058824, 0, 1,
-0.9713227, -0.7467192, -2.136822, 1, 0.9137255, 0, 1,
-0.969719, 0.1582673, -1.178781, 1, 0.9176471, 0, 1,
-0.9658957, 0.1889454, 0.4377422, 1, 0.9254902, 0, 1,
-0.9595571, -0.3157238, -1.404957, 1, 0.9294118, 0, 1,
-0.9557876, 0.7111737, -1.090915, 1, 0.9372549, 0, 1,
-0.9505535, 0.8032112, -1.360775, 1, 0.9411765, 0, 1,
-0.9466428, 0.04461298, -2.465657, 1, 0.9490196, 0, 1,
-0.9314195, -1.275409, -1.117785, 1, 0.9529412, 0, 1,
-0.9285913, -0.1763213, -0.8969148, 1, 0.9607843, 0, 1,
-0.9281631, 0.009108099, -1.020812, 1, 0.9647059, 0, 1,
-0.9262781, -0.7991353, -3.810015, 1, 0.972549, 0, 1,
-0.9199708, 0.5899463, -0.03189053, 1, 0.9764706, 0, 1,
-0.9181495, -1.19138, -3.168937, 1, 0.9843137, 0, 1,
-0.9145087, -1.426993, -2.746639, 1, 0.9882353, 0, 1,
-0.911992, 0.3506085, -2.322733, 1, 0.9960784, 0, 1,
-0.9082782, -0.6775597, -1.812326, 0.9960784, 1, 0, 1,
-0.9056924, -0.3619771, -2.217305, 0.9921569, 1, 0, 1,
-0.9018423, -2.592005, -2.991917, 0.9843137, 1, 0, 1,
-0.897512, 0.4932599, -0.1506399, 0.9803922, 1, 0, 1,
-0.8935875, -0.500562, -1.969589, 0.972549, 1, 0, 1,
-0.8913866, 0.5950703, 0.5800036, 0.9686275, 1, 0, 1,
-0.8829759, -0.06936608, -0.7644383, 0.9607843, 1, 0, 1,
-0.8764133, 1.529362, -3.688319, 0.9568627, 1, 0, 1,
-0.868296, 0.472973, -3.109103, 0.9490196, 1, 0, 1,
-0.8679582, 1.204703, 0.5114548, 0.945098, 1, 0, 1,
-0.8646387, -0.1052907, -2.372177, 0.9372549, 1, 0, 1,
-0.8638015, 0.5629734, -0.5850515, 0.9333333, 1, 0, 1,
-0.8526091, -1.227676, -2.728283, 0.9254902, 1, 0, 1,
-0.8512522, -1.700529, -1.468302, 0.9215686, 1, 0, 1,
-0.8423344, -0.3902719, -2.229228, 0.9137255, 1, 0, 1,
-0.8407296, -0.1570323, -3.032504, 0.9098039, 1, 0, 1,
-0.8395999, -1.708747, -2.062221, 0.9019608, 1, 0, 1,
-0.8362081, -0.7773311, -2.942097, 0.8941177, 1, 0, 1,
-0.8328673, 0.6804283, -2.324394, 0.8901961, 1, 0, 1,
-0.821843, -0.2733659, -2.256027, 0.8823529, 1, 0, 1,
-0.8193271, -0.139536, -1.258047, 0.8784314, 1, 0, 1,
-0.8126337, -1.750836, -4.569735, 0.8705882, 1, 0, 1,
-0.811523, -0.847562, -2.451155, 0.8666667, 1, 0, 1,
-0.8106425, 0.7910588, -2.112267, 0.8588235, 1, 0, 1,
-0.8032544, 0.7626239, -0.4063589, 0.854902, 1, 0, 1,
-0.8002663, -1.018296, -2.051442, 0.8470588, 1, 0, 1,
-0.7980629, 1.935024, -2.369736, 0.8431373, 1, 0, 1,
-0.797191, 1.19758, -0.6362416, 0.8352941, 1, 0, 1,
-0.7971738, 1.570938, -1.19664, 0.8313726, 1, 0, 1,
-0.7944371, -0.6020319, -3.158955, 0.8235294, 1, 0, 1,
-0.7929788, -1.160424, -4.484888, 0.8196079, 1, 0, 1,
-0.7927948, -0.08415423, 0.4632332, 0.8117647, 1, 0, 1,
-0.7880307, -0.7939326, -3.377031, 0.8078431, 1, 0, 1,
-0.7861671, -0.7392986, -3.074123, 0.8, 1, 0, 1,
-0.7851271, 0.4841817, -0.2377161, 0.7921569, 1, 0, 1,
-0.7749619, 1.237035, -0.4691523, 0.7882353, 1, 0, 1,
-0.7724286, 0.06309341, -0.9680679, 0.7803922, 1, 0, 1,
-0.7681808, 0.3954129, -1.007593, 0.7764706, 1, 0, 1,
-0.7653752, -1.822538, -3.159392, 0.7686275, 1, 0, 1,
-0.7652932, -0.0395033, -2.683385, 0.7647059, 1, 0, 1,
-0.7504322, 0.3015928, -2.385396, 0.7568628, 1, 0, 1,
-0.7373743, 2.169605, -0.0004478087, 0.7529412, 1, 0, 1,
-0.7342637, -0.2463116, -1.098597, 0.7450981, 1, 0, 1,
-0.7270989, -0.8939136, -2.04393, 0.7411765, 1, 0, 1,
-0.7237403, 0.8265574, -1.80944, 0.7333333, 1, 0, 1,
-0.7198948, -0.2457376, -4.147763, 0.7294118, 1, 0, 1,
-0.7158199, 0.4169948, -0.6088148, 0.7215686, 1, 0, 1,
-0.7158005, 0.3766246, -0.8457157, 0.7176471, 1, 0, 1,
-0.7123531, 1.500614, -0.208488, 0.7098039, 1, 0, 1,
-0.7085383, 0.6758531, -0.171334, 0.7058824, 1, 0, 1,
-0.7056999, -0.005045177, -3.482379, 0.6980392, 1, 0, 1,
-0.7048916, 0.2234751, -2.043797, 0.6901961, 1, 0, 1,
-0.7034897, 1.466351, -1.097347, 0.6862745, 1, 0, 1,
-0.6984873, -1.958976, -3.689998, 0.6784314, 1, 0, 1,
-0.6960945, 1.03288, -2.082007, 0.6745098, 1, 0, 1,
-0.6925094, -0.2871226, -2.248631, 0.6666667, 1, 0, 1,
-0.6856936, 0.3712194, -3.51729, 0.6627451, 1, 0, 1,
-0.6702219, 0.6192809, -0.8779483, 0.654902, 1, 0, 1,
-0.6696488, -1.311301, -3.518626, 0.6509804, 1, 0, 1,
-0.669134, 0.5131177, -1.89447, 0.6431373, 1, 0, 1,
-0.6665561, -0.4400425, -0.985668, 0.6392157, 1, 0, 1,
-0.6602407, -0.8242536, -0.853771, 0.6313726, 1, 0, 1,
-0.6565456, -0.01066395, -2.351771, 0.627451, 1, 0, 1,
-0.6562857, -0.1357611, -2.994686, 0.6196079, 1, 0, 1,
-0.6550638, 0.4883534, -1.687558, 0.6156863, 1, 0, 1,
-0.6547036, 1.069288, -0.6100394, 0.6078432, 1, 0, 1,
-0.6541606, 0.7665995, -0.9052329, 0.6039216, 1, 0, 1,
-0.6466975, 2.135761, -0.7320339, 0.5960785, 1, 0, 1,
-0.6422946, 1.517661, 0.70374, 0.5882353, 1, 0, 1,
-0.6416106, -0.04618969, -1.310785, 0.5843138, 1, 0, 1,
-0.6397237, -1.098815, -3.378082, 0.5764706, 1, 0, 1,
-0.6322415, 0.2043225, -0.6573538, 0.572549, 1, 0, 1,
-0.628966, -0.4743513, -2.423927, 0.5647059, 1, 0, 1,
-0.626731, -0.07932954, -2.884695, 0.5607843, 1, 0, 1,
-0.6223834, 0.2150405, -0.3923138, 0.5529412, 1, 0, 1,
-0.6208706, 0.03125034, -2.117017, 0.5490196, 1, 0, 1,
-0.6189745, 0.998234, -2.42892, 0.5411765, 1, 0, 1,
-0.6186664, -0.4238656, -0.5074229, 0.5372549, 1, 0, 1,
-0.617942, -0.7525989, -2.138308, 0.5294118, 1, 0, 1,
-0.6156274, 0.2578877, -0.530274, 0.5254902, 1, 0, 1,
-0.6101689, 0.6242882, 0.1042492, 0.5176471, 1, 0, 1,
-0.609604, -0.5702653, -1.446222, 0.5137255, 1, 0, 1,
-0.6009555, -1.71743, -4.012196, 0.5058824, 1, 0, 1,
-0.5990452, 1.389817, -1.88649, 0.5019608, 1, 0, 1,
-0.5983875, 0.3151325, -2.874852, 0.4941176, 1, 0, 1,
-0.5970903, 1.118975, -0.07419351, 0.4862745, 1, 0, 1,
-0.5823632, -0.3936161, -2.288262, 0.4823529, 1, 0, 1,
-0.576531, -0.2553082, -2.154002, 0.4745098, 1, 0, 1,
-0.5751523, -1.083261, -5.804627, 0.4705882, 1, 0, 1,
-0.5742052, 1.631982, 0.04380669, 0.4627451, 1, 0, 1,
-0.5730508, 1.505675, 0.213192, 0.4588235, 1, 0, 1,
-0.572599, 0.7804704, 0.4689905, 0.4509804, 1, 0, 1,
-0.5714813, -0.691044, -1.028241, 0.4470588, 1, 0, 1,
-0.5714576, 0.2092613, -1.299273, 0.4392157, 1, 0, 1,
-0.5677482, 0.06661604, -0.6177326, 0.4352941, 1, 0, 1,
-0.5668963, -0.2440043, -1.47363, 0.427451, 1, 0, 1,
-0.5618541, -2.460395, -1.990662, 0.4235294, 1, 0, 1,
-0.5604692, -0.9977124, -3.9447, 0.4156863, 1, 0, 1,
-0.556998, -1.315796, -2.915149, 0.4117647, 1, 0, 1,
-0.554794, -0.5889168, -1.831729, 0.4039216, 1, 0, 1,
-0.5538291, -2.1754, -1.092745, 0.3960784, 1, 0, 1,
-0.5478652, 0.001029668, -2.858566, 0.3921569, 1, 0, 1,
-0.5444394, 1.934246, 0.1683257, 0.3843137, 1, 0, 1,
-0.5434592, 0.3339012, -1.796651, 0.3803922, 1, 0, 1,
-0.5417935, -0.1303007, -2.539516, 0.372549, 1, 0, 1,
-0.5407046, -1.539284, -1.614057, 0.3686275, 1, 0, 1,
-0.5405086, 0.2159445, -1.316555, 0.3607843, 1, 0, 1,
-0.5331753, 1.589253, -0.7728391, 0.3568628, 1, 0, 1,
-0.5281177, 3.208312, -0.7663128, 0.3490196, 1, 0, 1,
-0.5252303, 1.579217, -0.4270092, 0.345098, 1, 0, 1,
-0.5231679, -0.8864357, -3.999746, 0.3372549, 1, 0, 1,
-0.5176935, 1.22478, 0.2502643, 0.3333333, 1, 0, 1,
-0.5167891, -0.1654851, -1.635295, 0.3254902, 1, 0, 1,
-0.5154868, -1.177637, -3.503827, 0.3215686, 1, 0, 1,
-0.514728, -0.6298005, -0.53473, 0.3137255, 1, 0, 1,
-0.5136762, 0.9374411, -3.629645, 0.3098039, 1, 0, 1,
-0.5084429, -0.9460016, -2.371855, 0.3019608, 1, 0, 1,
-0.5042344, -0.6221249, -1.416283, 0.2941177, 1, 0, 1,
-0.5031038, 0.8189165, 0.0148055, 0.2901961, 1, 0, 1,
-0.4933761, -1.458737, -2.665704, 0.282353, 1, 0, 1,
-0.490906, 0.3685668, -0.5800905, 0.2784314, 1, 0, 1,
-0.4892165, 0.3898175, -0.4062306, 0.2705882, 1, 0, 1,
-0.4858569, -0.3777887, -3.543812, 0.2666667, 1, 0, 1,
-0.4855453, -0.3672903, -2.395039, 0.2588235, 1, 0, 1,
-0.4832915, 1.284006, 1.071256, 0.254902, 1, 0, 1,
-0.4812787, 1.355869, 0.4624768, 0.2470588, 1, 0, 1,
-0.479998, -0.2366789, -2.258995, 0.2431373, 1, 0, 1,
-0.4788123, 0.1942339, -2.996006, 0.2352941, 1, 0, 1,
-0.4781109, 1.595897, -0.03755934, 0.2313726, 1, 0, 1,
-0.477555, -0.46703, -3.360199, 0.2235294, 1, 0, 1,
-0.4732584, 0.3230259, -0.3158878, 0.2196078, 1, 0, 1,
-0.4706276, -0.03347266, -2.499664, 0.2117647, 1, 0, 1,
-0.4701242, 0.3318965, -1.076803, 0.2078431, 1, 0, 1,
-0.4678424, 0.4837648, -1.719478, 0.2, 1, 0, 1,
-0.4674191, -0.3586999, -1.42495, 0.1921569, 1, 0, 1,
-0.4659483, -0.8520344, -3.295692, 0.1882353, 1, 0, 1,
-0.4654553, -0.3928663, -2.450036, 0.1803922, 1, 0, 1,
-0.4643984, -0.3607516, -2.331096, 0.1764706, 1, 0, 1,
-0.4584533, 1.467578, -0.8427385, 0.1686275, 1, 0, 1,
-0.4580051, 0.6248912, -0.4804541, 0.1647059, 1, 0, 1,
-0.4528633, -1.614311, -1.565198, 0.1568628, 1, 0, 1,
-0.4525576, -2.520371, -2.964977, 0.1529412, 1, 0, 1,
-0.451862, 2.854422, -1.243961, 0.145098, 1, 0, 1,
-0.451692, 0.7063786, -2.779957, 0.1411765, 1, 0, 1,
-0.4508543, -0.962245, -3.209806, 0.1333333, 1, 0, 1,
-0.4498877, -0.1618962, -3.081728, 0.1294118, 1, 0, 1,
-0.4497876, 1.357778, -2.611282, 0.1215686, 1, 0, 1,
-0.4452169, 0.43137, -2.516734, 0.1176471, 1, 0, 1,
-0.4438615, 2.093769, 0.4983535, 0.1098039, 1, 0, 1,
-0.4398381, 1.099695, 0.173777, 0.1058824, 1, 0, 1,
-0.4373765, 0.3772871, -1.658447, 0.09803922, 1, 0, 1,
-0.4373329, 0.5274115, 1.105727, 0.09019608, 1, 0, 1,
-0.436274, -1.210138, -2.92346, 0.08627451, 1, 0, 1,
-0.4336855, 0.9123028, 0.2746082, 0.07843138, 1, 0, 1,
-0.432754, -0.7857851, -2.246662, 0.07450981, 1, 0, 1,
-0.4299586, 0.253929, -0.179015, 0.06666667, 1, 0, 1,
-0.4225434, 0.9411398, 0.06923404, 0.0627451, 1, 0, 1,
-0.4200613, 0.4762523, -0.04748203, 0.05490196, 1, 0, 1,
-0.419957, -1.86151, -4.322011, 0.05098039, 1, 0, 1,
-0.4163831, 0.5038766, -0.5261039, 0.04313726, 1, 0, 1,
-0.4106393, -1.603613, -2.173289, 0.03921569, 1, 0, 1,
-0.4055786, 0.6387353, -0.8858076, 0.03137255, 1, 0, 1,
-0.4001402, -0.3772864, -1.863867, 0.02745098, 1, 0, 1,
-0.3910767, 0.1305797, -2.758286, 0.01960784, 1, 0, 1,
-0.3887993, -2.29611, -2.378304, 0.01568628, 1, 0, 1,
-0.3884448, 0.9928918, -1.278387, 0.007843138, 1, 0, 1,
-0.3802836, -1.808049, -3.169508, 0.003921569, 1, 0, 1,
-0.3791823, 0.9020406, -0.1970572, 0, 1, 0.003921569, 1,
-0.3772899, 0.3339867, -0.5539868, 0, 1, 0.01176471, 1,
-0.3770369, -2.029614, -2.630308, 0, 1, 0.01568628, 1,
-0.3766298, -1.730102, -2.219204, 0, 1, 0.02352941, 1,
-0.3744004, -0.8727601, -2.329298, 0, 1, 0.02745098, 1,
-0.3716792, -0.2247919, -1.703723, 0, 1, 0.03529412, 1,
-0.3700504, -0.4093779, -2.353503, 0, 1, 0.03921569, 1,
-0.3684029, -1.507099, -1.032062, 0, 1, 0.04705882, 1,
-0.3658886, 1.21135, -0.3384677, 0, 1, 0.05098039, 1,
-0.3643775, -0.3109908, -2.252806, 0, 1, 0.05882353, 1,
-0.3616659, 0.3302917, 0.1106736, 0, 1, 0.0627451, 1,
-0.3604176, 0.1083802, -0.8336441, 0, 1, 0.07058824, 1,
-0.3543574, 0.5147036, 1.91463, 0, 1, 0.07450981, 1,
-0.352797, 0.96827, 1.154727, 0, 1, 0.08235294, 1,
-0.3493625, -0.7797408, -4.427635, 0, 1, 0.08627451, 1,
-0.3466748, 0.60949, -1.4173, 0, 1, 0.09411765, 1,
-0.3429816, -1.393303, -1.088262, 0, 1, 0.1019608, 1,
-0.3425117, -0.5713097, -1.814844, 0, 1, 0.1058824, 1,
-0.3373116, -0.8613057, -2.939427, 0, 1, 0.1137255, 1,
-0.3368242, 0.5028939, 0.2688738, 0, 1, 0.1176471, 1,
-0.334851, -1.586425, -2.748623, 0, 1, 0.1254902, 1,
-0.3343625, -1.496025, -1.673757, 0, 1, 0.1294118, 1,
-0.3329097, -0.6005699, -2.803666, 0, 1, 0.1372549, 1,
-0.3313299, 0.8415906, 0.09399045, 0, 1, 0.1411765, 1,
-0.3313227, 1.550505, -0.623022, 0, 1, 0.1490196, 1,
-0.3308555, -0.7061374, -2.391422, 0, 1, 0.1529412, 1,
-0.3300666, -1.98517, -3.090644, 0, 1, 0.1607843, 1,
-0.3272111, -0.113317, -0.9468438, 0, 1, 0.1647059, 1,
-0.3271789, 0.8416578, 2.03505, 0, 1, 0.172549, 1,
-0.3249807, -0.7452877, -2.349067, 0, 1, 0.1764706, 1,
-0.3217193, -1.035598, -2.460196, 0, 1, 0.1843137, 1,
-0.3188454, 0.9904094, -0.06619905, 0, 1, 0.1882353, 1,
-0.3187622, -2.567123e-05, -3.073213, 0, 1, 0.1960784, 1,
-0.3187458, -0.4169492, -2.009465, 0, 1, 0.2039216, 1,
-0.3152862, 0.2895522, -1.300348, 0, 1, 0.2078431, 1,
-0.311381, 0.7614483, -0.8506351, 0, 1, 0.2156863, 1,
-0.3032551, -0.9025213, -2.504953, 0, 1, 0.2196078, 1,
-0.301224, 0.2376757, -0.6277838, 0, 1, 0.227451, 1,
-0.2991989, -0.5660901, -2.022396, 0, 1, 0.2313726, 1,
-0.2941935, 1.522106, -1.048002, 0, 1, 0.2392157, 1,
-0.2922964, 1.089718, 0.4285691, 0, 1, 0.2431373, 1,
-0.2887728, -0.2901946, -2.547397, 0, 1, 0.2509804, 1,
-0.2878778, -1.328582, -2.623101, 0, 1, 0.254902, 1,
-0.2865638, 0.6097229, -1.033419, 0, 1, 0.2627451, 1,
-0.2811179, 1.360955, -0.9693038, 0, 1, 0.2666667, 1,
-0.2728478, 1.280566, 0.5118313, 0, 1, 0.2745098, 1,
-0.2665823, 1.073235, -2.243328, 0, 1, 0.2784314, 1,
-0.2650355, 1.360587, 2.143127, 0, 1, 0.2862745, 1,
-0.2602573, 0.757561, -0.5417693, 0, 1, 0.2901961, 1,
-0.2591911, -1.351837, -3.659492, 0, 1, 0.2980392, 1,
-0.2575113, 0.8992153, -1.060766, 0, 1, 0.3058824, 1,
-0.2543082, -1.332303, -3.445454, 0, 1, 0.3098039, 1,
-0.2509132, 0.432824, -1.028619, 0, 1, 0.3176471, 1,
-0.2496999, 0.2253442, -0.8883879, 0, 1, 0.3215686, 1,
-0.2491185, -0.6104824, -2.907141, 0, 1, 0.3294118, 1,
-0.2443609, -1.821734, -2.084396, 0, 1, 0.3333333, 1,
-0.2441823, 1.779475, 3.088841, 0, 1, 0.3411765, 1,
-0.2385929, 1.235445, 1.386589, 0, 1, 0.345098, 1,
-0.2378097, -0.5821767, -3.790945, 0, 1, 0.3529412, 1,
-0.2353785, 0.4287814, -1.22499, 0, 1, 0.3568628, 1,
-0.2353321, 0.07073159, -2.156131, 0, 1, 0.3647059, 1,
-0.2339941, -0.9558884, -2.719861, 0, 1, 0.3686275, 1,
-0.2308382, -0.2377097, -1.704883, 0, 1, 0.3764706, 1,
-0.2306151, -0.2841043, -3.068992, 0, 1, 0.3803922, 1,
-0.2298609, 1.240795, -1.551142, 0, 1, 0.3882353, 1,
-0.2263929, 0.2545432, -0.886394, 0, 1, 0.3921569, 1,
-0.2263193, -1.130292, -2.912035, 0, 1, 0.4, 1,
-0.2224677, 0.8358644, -0.7734845, 0, 1, 0.4078431, 1,
-0.2173481, 0.5816962, 0.5081925, 0, 1, 0.4117647, 1,
-0.2158956, 0.2631667, -1.043107, 0, 1, 0.4196078, 1,
-0.2156592, -1.141577, -4.153981, 0, 1, 0.4235294, 1,
-0.2110796, 0.2554074, -1.516675, 0, 1, 0.4313726, 1,
-0.2049883, 0.456123, -0.07565335, 0, 1, 0.4352941, 1,
-0.2027524, 0.7327779, 0.01207825, 0, 1, 0.4431373, 1,
-0.1985813, -1.896755, -3.198773, 0, 1, 0.4470588, 1,
-0.1974722, -0.1799529, -1.449819, 0, 1, 0.454902, 1,
-0.196658, 1.206664, -0.6898538, 0, 1, 0.4588235, 1,
-0.1922557, -0.4754837, -1.904864, 0, 1, 0.4666667, 1,
-0.1921207, -0.4091773, -2.199042, 0, 1, 0.4705882, 1,
-0.1883487, 0.03361562, -3.170662, 0, 1, 0.4784314, 1,
-0.1870098, 0.6455618, -0.07070719, 0, 1, 0.4823529, 1,
-0.1861327, -0.7677082, -3.870525, 0, 1, 0.4901961, 1,
-0.1839572, 0.0421954, -1.740178, 0, 1, 0.4941176, 1,
-0.1802647, 0.1606876, 0.2434709, 0, 1, 0.5019608, 1,
-0.1767563, 0.7222345, -1.786843, 0, 1, 0.509804, 1,
-0.1740678, 0.4272231, -0.8986546, 0, 1, 0.5137255, 1,
-0.1731104, 1.717368, 0.4092965, 0, 1, 0.5215687, 1,
-0.1727713, 0.802183, 1.475713, 0, 1, 0.5254902, 1,
-0.1716199, 0.2954459, -0.3154479, 0, 1, 0.5333334, 1,
-0.1673032, -0.1925174, -3.132773, 0, 1, 0.5372549, 1,
-0.166734, 0.1298439, -0.7979443, 0, 1, 0.5450981, 1,
-0.1651431, -0.1883115, -1.835428, 0, 1, 0.5490196, 1,
-0.1648757, 0.6453881, -0.4360584, 0, 1, 0.5568628, 1,
-0.1643299, 0.3146582, -0.2971854, 0, 1, 0.5607843, 1,
-0.1622909, 0.55407, 1.836596, 0, 1, 0.5686275, 1,
-0.1612558, -2.109469, -3.144711, 0, 1, 0.572549, 1,
-0.1583192, -0.3110968, -3.419894, 0, 1, 0.5803922, 1,
-0.1554501, 0.6905494, -1.106824, 0, 1, 0.5843138, 1,
-0.1542435, -1.847841, -3.010401, 0, 1, 0.5921569, 1,
-0.148437, -0.6810732, -1.130145, 0, 1, 0.5960785, 1,
-0.1458394, -1.479749, -2.327623, 0, 1, 0.6039216, 1,
-0.1376425, -0.2077605, -1.808504, 0, 1, 0.6117647, 1,
-0.1354965, -2.124016, -3.238709, 0, 1, 0.6156863, 1,
-0.1344741, 0.940977, 1.230687, 0, 1, 0.6235294, 1,
-0.1328143, -1.321049, -3.043683, 0, 1, 0.627451, 1,
-0.1325797, 0.009617821, -1.580214, 0, 1, 0.6352941, 1,
-0.130381, -0.2516072, -1.487065, 0, 1, 0.6392157, 1,
-0.1273983, 1.600132, 0.2155497, 0, 1, 0.6470588, 1,
-0.1253642, -0.3407119, -3.636902, 0, 1, 0.6509804, 1,
-0.1204799, 0.9445432, 0.03197446, 0, 1, 0.6588235, 1,
-0.1160034, -0.8357887, -2.953461, 0, 1, 0.6627451, 1,
-0.1148437, 1.007327, -0.1629924, 0, 1, 0.6705883, 1,
-0.113586, 0.8857027, -0.2300236, 0, 1, 0.6745098, 1,
-0.1128007, 0.8358756, -0.1557212, 0, 1, 0.682353, 1,
-0.1109911, 0.8396823, -0.02369237, 0, 1, 0.6862745, 1,
-0.1068299, 0.9750757, -0.4092619, 0, 1, 0.6941177, 1,
-0.106795, 0.8321574, 0.3146109, 0, 1, 0.7019608, 1,
-0.09921653, -0.6732267, -3.327029, 0, 1, 0.7058824, 1,
-0.08801465, 1.369159, 0.3157428, 0, 1, 0.7137255, 1,
-0.08336839, 0.1364127, -0.05689505, 0, 1, 0.7176471, 1,
-0.08144659, -1.082544, -3.568316, 0, 1, 0.7254902, 1,
-0.08083777, 0.4757299, 0.5379171, 0, 1, 0.7294118, 1,
-0.0736155, 0.3710009, -2.031014, 0, 1, 0.7372549, 1,
-0.07072889, -1.324583, -5.400546, 0, 1, 0.7411765, 1,
-0.07020838, 0.762504, 0.3720238, 0, 1, 0.7490196, 1,
-0.06917466, 0.2230799, -1.737181, 0, 1, 0.7529412, 1,
-0.06735061, 0.6631719, 1.06764, 0, 1, 0.7607843, 1,
-0.06547787, -0.1959132, -3.227397, 0, 1, 0.7647059, 1,
-0.05486684, 0.4018556, -2.499207, 0, 1, 0.772549, 1,
-0.05435463, -1.186167, -3.997579, 0, 1, 0.7764706, 1,
-0.05157323, -0.447304, -2.833182, 0, 1, 0.7843137, 1,
-0.05130726, 0.09915879, -1.062778, 0, 1, 0.7882353, 1,
-0.05047381, 0.1679953, -1.226288, 0, 1, 0.7960784, 1,
-0.04939882, 2.291331, 0.859682, 0, 1, 0.8039216, 1,
-0.04905521, -0.4303514, -2.362664, 0, 1, 0.8078431, 1,
-0.04498592, 0.08104926, -0.06423036, 0, 1, 0.8156863, 1,
-0.04435125, 0.8217316, -0.7807833, 0, 1, 0.8196079, 1,
-0.03984895, -0.3190823, -2.435324, 0, 1, 0.827451, 1,
-0.03690011, -1.912108, 0.09759305, 0, 1, 0.8313726, 1,
-0.03553338, -1.601267, -1.305251, 0, 1, 0.8392157, 1,
-0.0338679, -0.5143526, -3.245373, 0, 1, 0.8431373, 1,
-0.03115666, 0.05335398, -3.038308, 0, 1, 0.8509804, 1,
-0.02966476, -1.532997, -4.333394, 0, 1, 0.854902, 1,
-0.02762994, -0.9752127, -1.844605, 0, 1, 0.8627451, 1,
-0.02567036, 1.285703, -0.9299902, 0, 1, 0.8666667, 1,
-0.02022247, -1.321151, -3.922058, 0, 1, 0.8745098, 1,
-0.02016782, 0.8238465, -0.4041087, 0, 1, 0.8784314, 1,
-0.0173962, 1.351104, 0.1314838, 0, 1, 0.8862745, 1,
-0.009860022, -0.3423312, -5.976207, 0, 1, 0.8901961, 1,
-0.004625543, 0.8476347, 0.2009014, 0, 1, 0.8980392, 1,
-0.003667928, -0.6522951, -0.9873412, 0, 1, 0.9058824, 1,
-0.002462493, 1.043183, 1.430897, 0, 1, 0.9098039, 1,
-0.001858764, -0.8605955, -2.953237, 0, 1, 0.9176471, 1,
-0.0008679255, 0.9129573, -0.4256683, 0, 1, 0.9215686, 1,
0.01295718, -0.3901415, 1.953787, 0, 1, 0.9294118, 1,
0.01424334, -0.1038635, 2.845805, 0, 1, 0.9333333, 1,
0.01554908, 1.330791, 0.6067201, 0, 1, 0.9411765, 1,
0.01653758, -1.037056, 1.489961, 0, 1, 0.945098, 1,
0.0199582, -0.372103, 2.053607, 0, 1, 0.9529412, 1,
0.02286312, -0.5726493, 2.900503, 0, 1, 0.9568627, 1,
0.02620854, -0.1768209, 2.74479, 0, 1, 0.9647059, 1,
0.03176704, 1.44426, 0.3284424, 0, 1, 0.9686275, 1,
0.0341657, 1.314363, -0.4727157, 0, 1, 0.9764706, 1,
0.0360487, -0.7587532, 2.613312, 0, 1, 0.9803922, 1,
0.03910645, 0.5189916, 0.662861, 0, 1, 0.9882353, 1,
0.03925806, -0.5984435, 1.981509, 0, 1, 0.9921569, 1,
0.0393674, 0.9836112, 0.7301427, 0, 1, 1, 1,
0.04107149, 0.5749357, -0.126165, 0, 0.9921569, 1, 1,
0.04222289, -2.296365, 4.703605, 0, 0.9882353, 1, 1,
0.04660518, -0.06959683, 4.422445, 0, 0.9803922, 1, 1,
0.05023859, -0.1570124, 3.623689, 0, 0.9764706, 1, 1,
0.05037015, -1.38674, 3.47487, 0, 0.9686275, 1, 1,
0.05284817, 0.1010039, 2.05587, 0, 0.9647059, 1, 1,
0.0547286, 1.278371, -0.8248193, 0, 0.9568627, 1, 1,
0.05489869, 0.1709717, -0.03208755, 0, 0.9529412, 1, 1,
0.06208855, 0.7608003, -1.063761, 0, 0.945098, 1, 1,
0.06239726, -0.781039, 3.271588, 0, 0.9411765, 1, 1,
0.06693439, 0.07387823, 2.595298, 0, 0.9333333, 1, 1,
0.07055253, -0.4872917, 3.61695, 0, 0.9294118, 1, 1,
0.07093037, -1.592433, 4.389874, 0, 0.9215686, 1, 1,
0.0735139, -0.07232824, 2.824215, 0, 0.9176471, 1, 1,
0.07366826, 0.276748, -0.3643163, 0, 0.9098039, 1, 1,
0.07628173, -0.1292484, 0.9492418, 0, 0.9058824, 1, 1,
0.0811175, -0.8202524, 1.82107, 0, 0.8980392, 1, 1,
0.08262261, 0.7973022, 1.066901, 0, 0.8901961, 1, 1,
0.0829289, 0.1403715, 1.211194, 0, 0.8862745, 1, 1,
0.08534104, -0.05269443, 3.108561, 0, 0.8784314, 1, 1,
0.08604527, -1.020543, 1.560018, 0, 0.8745098, 1, 1,
0.08719983, -0.3088545, 2.738668, 0, 0.8666667, 1, 1,
0.09078897, -1.322644, 4.842857, 0, 0.8627451, 1, 1,
0.09189832, 0.533233, 1.294667, 0, 0.854902, 1, 1,
0.0923715, 1.032246, -0.134056, 0, 0.8509804, 1, 1,
0.0940277, 1.365257, -0.5516092, 0, 0.8431373, 1, 1,
0.09813787, 0.7648776, -0.6578259, 0, 0.8392157, 1, 1,
0.098708, 0.7828573, -0.5131648, 0, 0.8313726, 1, 1,
0.09950166, -0.2258648, 2.651912, 0, 0.827451, 1, 1,
0.1014241, 0.1951902, -0.03355305, 0, 0.8196079, 1, 1,
0.1020731, 0.1294634, 0.9924992, 0, 0.8156863, 1, 1,
0.1038231, 0.86224, 0.1892271, 0, 0.8078431, 1, 1,
0.113545, -0.2040473, 3.606196, 0, 0.8039216, 1, 1,
0.1136949, -0.1977003, 2.065238, 0, 0.7960784, 1, 1,
0.1152634, -0.5052471, 2.408309, 0, 0.7882353, 1, 1,
0.1248353, -0.8789885, 1.474777, 0, 0.7843137, 1, 1,
0.1275451, -1.580599, 2.343533, 0, 0.7764706, 1, 1,
0.1291155, -1.013505, 1.521486, 0, 0.772549, 1, 1,
0.130618, 0.505001, 1.160798, 0, 0.7647059, 1, 1,
0.1322164, 1.841443, 1.963069, 0, 0.7607843, 1, 1,
0.1333983, 1.280862, 0.5768604, 0, 0.7529412, 1, 1,
0.1354998, 0.9378699, -0.4342736, 0, 0.7490196, 1, 1,
0.1378472, 0.4797781, 0.4167056, 0, 0.7411765, 1, 1,
0.1380207, 0.4050418, 1.077284, 0, 0.7372549, 1, 1,
0.140602, 1.687992, -0.2154682, 0, 0.7294118, 1, 1,
0.1515725, -0.02179444, 2.054861, 0, 0.7254902, 1, 1,
0.1555969, 0.1089183, 0.2742397, 0, 0.7176471, 1, 1,
0.1558566, -0.4049366, 3.762509, 0, 0.7137255, 1, 1,
0.1576535, 1.29592, 0.1451528, 0, 0.7058824, 1, 1,
0.1587789, -0.8024989, 4.238071, 0, 0.6980392, 1, 1,
0.1605846, 0.2552098, 2.241623, 0, 0.6941177, 1, 1,
0.1629005, 1.770156, 0.132539, 0, 0.6862745, 1, 1,
0.1654572, 0.9375363, 0.5874041, 0, 0.682353, 1, 1,
0.1666818, 1.365848, 0.09578938, 0, 0.6745098, 1, 1,
0.1673062, 0.780337, 0.8211733, 0, 0.6705883, 1, 1,
0.1692901, -1.710464, 1.842812, 0, 0.6627451, 1, 1,
0.1706019, -0.8844386, 4.86674, 0, 0.6588235, 1, 1,
0.172165, 0.6135138, 0.6218781, 0, 0.6509804, 1, 1,
0.1753318, -0.1950505, 1.339013, 0, 0.6470588, 1, 1,
0.1755291, 1.01705, 1.073425, 0, 0.6392157, 1, 1,
0.1757809, 0.5351152, 0.7917213, 0, 0.6352941, 1, 1,
0.1770392, 0.7554858, -0.1189964, 0, 0.627451, 1, 1,
0.178433, -0.7162496, 4.662858, 0, 0.6235294, 1, 1,
0.1789276, 0.6026684, 0.06914531, 0, 0.6156863, 1, 1,
0.1859546, 0.3590403, -0.09862264, 0, 0.6117647, 1, 1,
0.1864779, -0.3613594, 1.410754, 0, 0.6039216, 1, 1,
0.1882138, 2.980815, 1.824797, 0, 0.5960785, 1, 1,
0.1888316, 0.03178775, 1.405471, 0, 0.5921569, 1, 1,
0.1928034, 1.714027, 1.301831, 0, 0.5843138, 1, 1,
0.1972986, -0.2604328, 1.352983, 0, 0.5803922, 1, 1,
0.1985502, 0.9318762, 0.2103457, 0, 0.572549, 1, 1,
0.2037204, 1.675479, -0.2269114, 0, 0.5686275, 1, 1,
0.2040516, -0.4858356, 3.782451, 0, 0.5607843, 1, 1,
0.2101135, 0.8226912, -1.129272, 0, 0.5568628, 1, 1,
0.2119852, -0.729892, 1.4439, 0, 0.5490196, 1, 1,
0.2133409, 0.4053022, -0.09265927, 0, 0.5450981, 1, 1,
0.2142906, 1.08785, 0.5317639, 0, 0.5372549, 1, 1,
0.2158553, 0.2757889, 0.4696838, 0, 0.5333334, 1, 1,
0.2198157, 0.06774852, 1.182234, 0, 0.5254902, 1, 1,
0.2222163, 0.3438014, 0.4243715, 0, 0.5215687, 1, 1,
0.2243575, 0.5337114, 0.4801351, 0, 0.5137255, 1, 1,
0.2260737, -0.6197699, 3.944678, 0, 0.509804, 1, 1,
0.2271281, -1.815265, 1.743274, 0, 0.5019608, 1, 1,
0.22848, -0.6732345, 3.150925, 0, 0.4941176, 1, 1,
0.2339928, 0.6602218, 0.2427547, 0, 0.4901961, 1, 1,
0.2369404, 0.290685, 0.4979181, 0, 0.4823529, 1, 1,
0.2374961, 0.8594886, 0.1161955, 0, 0.4784314, 1, 1,
0.2400165, -0.9529017, 2.702132, 0, 0.4705882, 1, 1,
0.2442891, 0.3798057, 1.414717, 0, 0.4666667, 1, 1,
0.2458738, 1.639785, -0.4141474, 0, 0.4588235, 1, 1,
0.2464962, 0.5975256, 0.00446497, 0, 0.454902, 1, 1,
0.2556114, 1.466343, -0.0142394, 0, 0.4470588, 1, 1,
0.2583195, -0.5659373, 1.879246, 0, 0.4431373, 1, 1,
0.2589413, -1.136007, 2.870754, 0, 0.4352941, 1, 1,
0.2595811, 0.6025847, 1.248527, 0, 0.4313726, 1, 1,
0.2625504, 0.4362546, 0.835202, 0, 0.4235294, 1, 1,
0.2645068, -0.6951683, 3.969604, 0, 0.4196078, 1, 1,
0.2651045, -0.7039573, 4.44333, 0, 0.4117647, 1, 1,
0.2655235, 0.2961223, 2.20801, 0, 0.4078431, 1, 1,
0.2699994, -0.06844602, 2.142589, 0, 0.4, 1, 1,
0.2701133, -1.214201, 2.620797, 0, 0.3921569, 1, 1,
0.2712497, 0.160778, 0.662107, 0, 0.3882353, 1, 1,
0.2719532, 0.2058498, 0.8235583, 0, 0.3803922, 1, 1,
0.2719905, -1.758318, 1.078123, 0, 0.3764706, 1, 1,
0.2770466, -1.948233, 3.080443, 0, 0.3686275, 1, 1,
0.2812901, 0.01787086, 1.853384, 0, 0.3647059, 1, 1,
0.2889174, 0.2024917, 1.998062, 0, 0.3568628, 1, 1,
0.2890458, -0.8695459, 2.617604, 0, 0.3529412, 1, 1,
0.2894697, 0.5191405, 1.761539, 0, 0.345098, 1, 1,
0.2923174, 0.7495855, -0.2196745, 0, 0.3411765, 1, 1,
0.2927131, -0.6129118, 1.593907, 0, 0.3333333, 1, 1,
0.29549, -0.4517485, 1.466862, 0, 0.3294118, 1, 1,
0.2983604, 0.2496592, 0.2917171, 0, 0.3215686, 1, 1,
0.3115024, 0.2024073, 0.410845, 0, 0.3176471, 1, 1,
0.3116501, 0.1733793, 0.03573984, 0, 0.3098039, 1, 1,
0.3133955, 0.191641, 1.720682, 0, 0.3058824, 1, 1,
0.3147874, 2.256306, 0.2854366, 0, 0.2980392, 1, 1,
0.3191254, 0.1478638, 0.4969979, 0, 0.2901961, 1, 1,
0.320127, -1.82386, 3.345879, 0, 0.2862745, 1, 1,
0.3202787, 0.05411327, 2.255551, 0, 0.2784314, 1, 1,
0.3254942, -0.3178203, 1.510207, 0, 0.2745098, 1, 1,
0.3271067, -2.23461, 4.283861, 0, 0.2666667, 1, 1,
0.329745, -0.8087823, 1.573477, 0, 0.2627451, 1, 1,
0.3298042, -0.6327875, 3.329489, 0, 0.254902, 1, 1,
0.3380606, -0.1288138, 2.093188, 0, 0.2509804, 1, 1,
0.3384963, 0.1172578, 1.107584, 0, 0.2431373, 1, 1,
0.3417006, 0.9629529, 0.820723, 0, 0.2392157, 1, 1,
0.3438185, -0.1063033, 2.480222, 0, 0.2313726, 1, 1,
0.3440567, -0.6998621, 3.758765, 0, 0.227451, 1, 1,
0.3456073, 0.3735251, 1.133506, 0, 0.2196078, 1, 1,
0.3484342, -0.4480214, 1.289914, 0, 0.2156863, 1, 1,
0.3561833, 0.527491, 1.581298, 0, 0.2078431, 1, 1,
0.3564719, -0.346151, 2.242962, 0, 0.2039216, 1, 1,
0.3579469, -0.009085192, 1.449604, 0, 0.1960784, 1, 1,
0.3589107, -0.002775132, 1.789957, 0, 0.1882353, 1, 1,
0.3596348, 0.6305369, 0.294078, 0, 0.1843137, 1, 1,
0.3658084, -1.05637, 3.529328, 0, 0.1764706, 1, 1,
0.368409, 0.1657111, 1.955814, 0, 0.172549, 1, 1,
0.3721422, 1.852111, -1.987189, 0, 0.1647059, 1, 1,
0.3733961, -0.8274794, 3.863266, 0, 0.1607843, 1, 1,
0.37415, -0.3826177, 3.163006, 0, 0.1529412, 1, 1,
0.3800808, 1.136621, -0.75644, 0, 0.1490196, 1, 1,
0.3823398, -0.3822212, 2.40325, 0, 0.1411765, 1, 1,
0.3825697, -0.05416417, 2.153427, 0, 0.1372549, 1, 1,
0.3858465, 0.02514716, 3.120962, 0, 0.1294118, 1, 1,
0.3887202, 1.225739, 1.148391, 0, 0.1254902, 1, 1,
0.3947271, -0.1060619, 1.101124, 0, 0.1176471, 1, 1,
0.3963552, 1.11067, -0.2493888, 0, 0.1137255, 1, 1,
0.3967645, -0.3163061, 1.276393, 0, 0.1058824, 1, 1,
0.4006378, 0.2699431, 3.37801, 0, 0.09803922, 1, 1,
0.4050458, -0.2803262, 1.830405, 0, 0.09411765, 1, 1,
0.4056692, -1.143133, 3.05623, 0, 0.08627451, 1, 1,
0.4066944, 0.02750617, 2.402009, 0, 0.08235294, 1, 1,
0.4078824, 0.8092077, 0.1235306, 0, 0.07450981, 1, 1,
0.4110848, 2.895037, 0.2323373, 0, 0.07058824, 1, 1,
0.4157874, 0.1195713, 0.6761754, 0, 0.0627451, 1, 1,
0.4173832, 0.3083211, 2.165992, 0, 0.05882353, 1, 1,
0.423998, -0.3037856, 1.012151, 0, 0.05098039, 1, 1,
0.425711, -1.416367, 1.90905, 0, 0.04705882, 1, 1,
0.4265586, -0.4215105, 2.481791, 0, 0.03921569, 1, 1,
0.4283405, 0.5787661, 0.5473777, 0, 0.03529412, 1, 1,
0.4288704, 0.6159993, -0.09780432, 0, 0.02745098, 1, 1,
0.4305369, -1.306771, 3.073096, 0, 0.02352941, 1, 1,
0.4361165, -0.2413982, 4.39218, 0, 0.01568628, 1, 1,
0.4363145, 0.8445694, 1.328429, 0, 0.01176471, 1, 1,
0.4394449, 0.5997328, 0.4572329, 0, 0.003921569, 1, 1,
0.4441519, 0.9426994, 1.231695, 0.003921569, 0, 1, 1,
0.4446098, 1.20806, -0.01519995, 0.007843138, 0, 1, 1,
0.4474918, 1.196775, -0.8936886, 0.01568628, 0, 1, 1,
0.4498972, 0.03204916, 1.761638, 0.01960784, 0, 1, 1,
0.4568424, -0.6117065, 3.544096, 0.02745098, 0, 1, 1,
0.464434, 0.8177366, 1.926071, 0.03137255, 0, 1, 1,
0.4645058, -0.6333735, 4.548364, 0.03921569, 0, 1, 1,
0.4667924, -0.09941707, 2.797644, 0.04313726, 0, 1, 1,
0.4672821, 0.5114303, 1.371465, 0.05098039, 0, 1, 1,
0.475397, 1.34757, -0.9069946, 0.05490196, 0, 1, 1,
0.4781867, -0.2019945, 3.218594, 0.0627451, 0, 1, 1,
0.4799383, -2.047065, 3.591739, 0.06666667, 0, 1, 1,
0.4813457, 0.06464613, 0.4392364, 0.07450981, 0, 1, 1,
0.4830939, 0.01741096, 0.7235957, 0.07843138, 0, 1, 1,
0.4840336, 1.56142, 0.5718693, 0.08627451, 0, 1, 1,
0.484582, 0.8810543, 1.096714, 0.09019608, 0, 1, 1,
0.4858582, -0.4059319, 2.667213, 0.09803922, 0, 1, 1,
0.4896972, 0.1525005, 1.825411, 0.1058824, 0, 1, 1,
0.4930988, 0.180577, -0.1787674, 0.1098039, 0, 1, 1,
0.4956478, -0.07336728, 0.76274, 0.1176471, 0, 1, 1,
0.4980671, 0.7465202, 0.2498702, 0.1215686, 0, 1, 1,
0.4993852, -0.08510277, -0.4080503, 0.1294118, 0, 1, 1,
0.5010535, -1.002687, 2.757352, 0.1333333, 0, 1, 1,
0.5015246, -0.4376588, -0.2496691, 0.1411765, 0, 1, 1,
0.5020781, 1.05682, 0.07141775, 0.145098, 0, 1, 1,
0.5035827, -0.4249246, 3.739899, 0.1529412, 0, 1, 1,
0.5039099, 0.4470064, 1.066351, 0.1568628, 0, 1, 1,
0.5094328, -1.58626, 2.052484, 0.1647059, 0, 1, 1,
0.5121437, 0.3616911, 0.5091538, 0.1686275, 0, 1, 1,
0.521922, 0.7743587, 1.625746, 0.1764706, 0, 1, 1,
0.5223363, -1.998133, 3.600778, 0.1803922, 0, 1, 1,
0.524335, 0.04534683, 2.936016, 0.1882353, 0, 1, 1,
0.5267702, 0.663645, 0.4551767, 0.1921569, 0, 1, 1,
0.5299958, -1.267076, 3.769975, 0.2, 0, 1, 1,
0.5307899, -0.9037961, 3.765482, 0.2078431, 0, 1, 1,
0.5391743, -0.1213748, 3.288975, 0.2117647, 0, 1, 1,
0.5398455, 0.1540865, 3.17607, 0.2196078, 0, 1, 1,
0.54297, 0.6694037, 1.215402, 0.2235294, 0, 1, 1,
0.5438611, 0.7286898, 0.3716819, 0.2313726, 0, 1, 1,
0.5472732, -0.8251599, 1.460373, 0.2352941, 0, 1, 1,
0.5490173, -0.7133515, 2.784064, 0.2431373, 0, 1, 1,
0.5570432, 0.4021988, -0.5282004, 0.2470588, 0, 1, 1,
0.5609279, -0.3484604, 3.101275, 0.254902, 0, 1, 1,
0.561082, -0.3117028, 1.405352, 0.2588235, 0, 1, 1,
0.5611454, 0.6263331, 0.6423705, 0.2666667, 0, 1, 1,
0.5663948, 0.616338, 0.3025655, 0.2705882, 0, 1, 1,
0.5753497, 0.8392671, 1.827568, 0.2784314, 0, 1, 1,
0.5788398, 0.0512832, 2.442845, 0.282353, 0, 1, 1,
0.5820123, 0.7694879, -1.520587, 0.2901961, 0, 1, 1,
0.5851623, 1.48854, 1.003608, 0.2941177, 0, 1, 1,
0.5879335, -0.2877709, 0.4118911, 0.3019608, 0, 1, 1,
0.5904866, 0.7153174, 1.007266, 0.3098039, 0, 1, 1,
0.5922671, 0.2399107, 0.64145, 0.3137255, 0, 1, 1,
0.5927494, -0.9262189, 1.764521, 0.3215686, 0, 1, 1,
0.5937181, -0.9247177, 3.803639, 0.3254902, 0, 1, 1,
0.5937542, 0.1654624, 1.792471, 0.3333333, 0, 1, 1,
0.5981693, 1.169953, 2.426406, 0.3372549, 0, 1, 1,
0.6022037, -1.542825, 4.278081, 0.345098, 0, 1, 1,
0.6033304, -0.001639796, 2.312567, 0.3490196, 0, 1, 1,
0.6053357, 0.3277993, 0.961845, 0.3568628, 0, 1, 1,
0.6122369, 1.110839, 0.6953877, 0.3607843, 0, 1, 1,
0.6172121, 0.501721, 0.5842484, 0.3686275, 0, 1, 1,
0.6245641, 0.07371762, 0.7358054, 0.372549, 0, 1, 1,
0.6273528, -0.8248119, 1.809994, 0.3803922, 0, 1, 1,
0.6288111, 1.023833, -1.299756, 0.3843137, 0, 1, 1,
0.6301945, -0.9087566, 2.622233, 0.3921569, 0, 1, 1,
0.6345696, -0.3392985, 3.248675, 0.3960784, 0, 1, 1,
0.6456555, 0.4017987, -0.2587392, 0.4039216, 0, 1, 1,
0.6469032, 1.337379, 0.7791315, 0.4117647, 0, 1, 1,
0.6500357, -0.8383564, 2.431864, 0.4156863, 0, 1, 1,
0.6510891, -1.04195, 2.383251, 0.4235294, 0, 1, 1,
0.6566955, 0.02792565, 3.03452, 0.427451, 0, 1, 1,
0.6629125, -1.71983, 2.652763, 0.4352941, 0, 1, 1,
0.66619, 0.8830913, -0.06185247, 0.4392157, 0, 1, 1,
0.667047, 0.03595139, 1.417138, 0.4470588, 0, 1, 1,
0.6679137, -0.9347583, 2.980963, 0.4509804, 0, 1, 1,
0.671977, 0.9223012, 2.06881, 0.4588235, 0, 1, 1,
0.674058, -0.8683565, 3.60241, 0.4627451, 0, 1, 1,
0.6752056, 0.4227497, 0.3894194, 0.4705882, 0, 1, 1,
0.6754072, -1.516634, 2.03455, 0.4745098, 0, 1, 1,
0.6761566, 0.365044, 0.2075258, 0.4823529, 0, 1, 1,
0.6805878, -0.6177379, 1.023328, 0.4862745, 0, 1, 1,
0.6822804, -0.9282598, 2.274123, 0.4941176, 0, 1, 1,
0.68388, 0.7498413, 0.8832173, 0.5019608, 0, 1, 1,
0.6895998, -0.8665482, 2.746176, 0.5058824, 0, 1, 1,
0.6911325, 0.1306478, 0.9526523, 0.5137255, 0, 1, 1,
0.6912267, -0.1662497, 1.344886, 0.5176471, 0, 1, 1,
0.6928971, 1.203636, 0.3659882, 0.5254902, 0, 1, 1,
0.6957132, 1.511834, 0.8576996, 0.5294118, 0, 1, 1,
0.6968501, 0.8259619, 2.582568, 0.5372549, 0, 1, 1,
0.6995993, -1.038309, 2.836957, 0.5411765, 0, 1, 1,
0.700255, -1.288481, 2.824275, 0.5490196, 0, 1, 1,
0.7076015, 0.6266743, 1.473792, 0.5529412, 0, 1, 1,
0.7104657, -1.713606, 2.761141, 0.5607843, 0, 1, 1,
0.7161111, 0.3297939, 0.8252569, 0.5647059, 0, 1, 1,
0.7166437, 1.20304, 0.4099376, 0.572549, 0, 1, 1,
0.719979, -0.1514655, 2.427595, 0.5764706, 0, 1, 1,
0.723566, -0.4325619, 2.612948, 0.5843138, 0, 1, 1,
0.7235664, -0.8905055, 2.488705, 0.5882353, 0, 1, 1,
0.7236749, -1.581268, 2.128256, 0.5960785, 0, 1, 1,
0.7262609, 0.06146502, 1.795663, 0.6039216, 0, 1, 1,
0.7294198, -0.02733378, 1.836317, 0.6078432, 0, 1, 1,
0.7309707, -0.06358897, 2.255777, 0.6156863, 0, 1, 1,
0.7322801, -1.756296, 3.690371, 0.6196079, 0, 1, 1,
0.7325921, 1.777727, -1.555992, 0.627451, 0, 1, 1,
0.7337006, 0.6830984, 0.774814, 0.6313726, 0, 1, 1,
0.7384738, 1.254432, 0.8720788, 0.6392157, 0, 1, 1,
0.7421181, 0.5436807, 1.081897, 0.6431373, 0, 1, 1,
0.7505245, 1.173119, 0.2243199, 0.6509804, 0, 1, 1,
0.7601826, 0.232635, 2.048025, 0.654902, 0, 1, 1,
0.7615585, -1.180161, 1.798356, 0.6627451, 0, 1, 1,
0.7618365, 0.3167908, 3.152497, 0.6666667, 0, 1, 1,
0.763614, 0.9062709, 0.3063939, 0.6745098, 0, 1, 1,
0.7661471, 0.4501934, 3.068464, 0.6784314, 0, 1, 1,
0.7684535, -0.4829256, 0.964747, 0.6862745, 0, 1, 1,
0.7688781, -0.6444393, 4.749967, 0.6901961, 0, 1, 1,
0.7710279, 1.505473, 1.701656, 0.6980392, 0, 1, 1,
0.7733709, 1.144525, 0.8578503, 0.7058824, 0, 1, 1,
0.7765222, -0.9856153, 3.776608, 0.7098039, 0, 1, 1,
0.7775459, -0.1655029, 2.372252, 0.7176471, 0, 1, 1,
0.7804048, -0.4950015, 2.611116, 0.7215686, 0, 1, 1,
0.7850829, 1.750387, 1.108767, 0.7294118, 0, 1, 1,
0.7898771, -0.5928969, 0.6292024, 0.7333333, 0, 1, 1,
0.7904547, 1.842373, 0.8000639, 0.7411765, 0, 1, 1,
0.7952331, 0.9641483, 3.181308, 0.7450981, 0, 1, 1,
0.8007573, 1.292562, 0.2496595, 0.7529412, 0, 1, 1,
0.8090906, 1.199642, -0.9575773, 0.7568628, 0, 1, 1,
0.8118777, 1.749636, 0.4822882, 0.7647059, 0, 1, 1,
0.8122915, 0.4907523, 0.2404612, 0.7686275, 0, 1, 1,
0.8173273, -0.5206826, 0.8937844, 0.7764706, 0, 1, 1,
0.8242734, -0.5755038, 2.246884, 0.7803922, 0, 1, 1,
0.8371229, -0.2117637, 1.002425, 0.7882353, 0, 1, 1,
0.8371493, -0.5030625, 2.496537, 0.7921569, 0, 1, 1,
0.8397954, 0.6010265, 0.7440562, 0.8, 0, 1, 1,
0.8443848, 0.216153, 2.312391, 0.8078431, 0, 1, 1,
0.8444127, -0.3498466, 3.540356, 0.8117647, 0, 1, 1,
0.8455522, 0.547264, 1.838243, 0.8196079, 0, 1, 1,
0.8520296, -1.100991, 1.064169, 0.8235294, 0, 1, 1,
0.8535811, 1.093435, 3.21616, 0.8313726, 0, 1, 1,
0.8538715, 0.8914435, -0.5808476, 0.8352941, 0, 1, 1,
0.8598721, 0.691426, 0.3891318, 0.8431373, 0, 1, 1,
0.8682181, -1.077024, 2.617196, 0.8470588, 0, 1, 1,
0.8775539, -2.382811, 3.333558, 0.854902, 0, 1, 1,
0.8805114, -1.177273, 2.626373, 0.8588235, 0, 1, 1,
0.8849364, -1.561508, 2.780058, 0.8666667, 0, 1, 1,
0.8852892, 0.9467489, -0.3127759, 0.8705882, 0, 1, 1,
0.8939787, 0.3982105, 1.286363, 0.8784314, 0, 1, 1,
0.900687, 0.8478635, 0.122698, 0.8823529, 0, 1, 1,
0.9037288, 0.4082182, 0.3576557, 0.8901961, 0, 1, 1,
0.9052184, 0.2256661, 1.286437, 0.8941177, 0, 1, 1,
0.90738, 1.064414, 1.173799, 0.9019608, 0, 1, 1,
0.9080386, -1.239256, 1.620447, 0.9098039, 0, 1, 1,
0.9115078, -1.436309, 2.610808, 0.9137255, 0, 1, 1,
0.9143697, 0.8881737, -0.4288633, 0.9215686, 0, 1, 1,
0.916191, -0.4346263, 2.708276, 0.9254902, 0, 1, 1,
0.9220088, -0.170222, 1.485101, 0.9333333, 0, 1, 1,
0.9245168, 0.3041918, 1.441394, 0.9372549, 0, 1, 1,
0.9261711, 0.5789015, -0.0312685, 0.945098, 0, 1, 1,
0.9281026, -0.1677841, 4.323532, 0.9490196, 0, 1, 1,
0.9360285, 0.7260759, 0.4168465, 0.9568627, 0, 1, 1,
0.9429344, -0.3104753, 1.375661, 0.9607843, 0, 1, 1,
0.9455438, 0.2651691, 1.596161, 0.9686275, 0, 1, 1,
0.9458131, -1.180162, 2.357648, 0.972549, 0, 1, 1,
0.9500828, 0.458523, 0.1067164, 0.9803922, 0, 1, 1,
0.9543331, 2.096387, -0.2580507, 0.9843137, 0, 1, 1,
0.9567373, -0.2747137, 1.482469, 0.9921569, 0, 1, 1,
0.9588061, -0.5477304, 2.836613, 0.9960784, 0, 1, 1,
0.9685754, -2.605393, 3.290425, 1, 0, 0.9960784, 1,
0.9702967, -1.227304, 2.924943, 1, 0, 0.9882353, 1,
0.9710755, 1.5507, 1.872086, 1, 0, 0.9843137, 1,
0.9742332, 0.3644457, 0.01798244, 1, 0, 0.9764706, 1,
0.9743074, 0.192677, 1.247563, 1, 0, 0.972549, 1,
0.9846422, -0.1984848, 1.633673, 1, 0, 0.9647059, 1,
0.9859102, 0.151694, -0.4437763, 1, 0, 0.9607843, 1,
0.9929872, 0.7134515, 0.7539473, 1, 0, 0.9529412, 1,
0.9984686, 0.4609716, 0.4043149, 1, 0, 0.9490196, 1,
0.9999715, -0.353535, 2.482775, 1, 0, 0.9411765, 1,
1.008669, -0.9010313, 2.095995, 1, 0, 0.9372549, 1,
1.014507, -0.09780494, 2.270133, 1, 0, 0.9294118, 1,
1.018992, -0.2678888, 2.31178, 1, 0, 0.9254902, 1,
1.021013, 0.8104058, -1.068677, 1, 0, 0.9176471, 1,
1.02364, -1.134448, 2.223953, 1, 0, 0.9137255, 1,
1.036269, -1.415692, 1.859118, 1, 0, 0.9058824, 1,
1.042328, -1.129982, 1.310414, 1, 0, 0.9019608, 1,
1.047718, -0.5690804, 3.107584, 1, 0, 0.8941177, 1,
1.061011, 0.5229493, -0.1176383, 1, 0, 0.8862745, 1,
1.062879, -1.086684, 3.888732, 1, 0, 0.8823529, 1,
1.06514, -0.2215751, 0.3005497, 1, 0, 0.8745098, 1,
1.075956, 1.368276, -1.070256, 1, 0, 0.8705882, 1,
1.080359, 1.524588, 0.4252381, 1, 0, 0.8627451, 1,
1.10408, -2.145715, 2.884923, 1, 0, 0.8588235, 1,
1.110156, -0.5026519, 2.088427, 1, 0, 0.8509804, 1,
1.113385, 1.249585, 1.122178, 1, 0, 0.8470588, 1,
1.116342, -0.7904286, 0.8146363, 1, 0, 0.8392157, 1,
1.116371, 0.09526993, 0.4597913, 1, 0, 0.8352941, 1,
1.117933, 0.5665771, 2.139446, 1, 0, 0.827451, 1,
1.127843, 0.5599765, 1.948054, 1, 0, 0.8235294, 1,
1.131469, 0.180399, 1.828904, 1, 0, 0.8156863, 1,
1.167785, -1.892771, 1.554452, 1, 0, 0.8117647, 1,
1.168759, 0.6983327, 0.1342753, 1, 0, 0.8039216, 1,
1.169483, -0.4950703, 0.7680328, 1, 0, 0.7960784, 1,
1.175297, 0.7867315, -0.4034034, 1, 0, 0.7921569, 1,
1.176523, 0.7385521, 1.461402, 1, 0, 0.7843137, 1,
1.177679, -0.06293548, 0.1779178, 1, 0, 0.7803922, 1,
1.180291, -0.4164036, 2.914452, 1, 0, 0.772549, 1,
1.184747, 0.7657647, 1.157297, 1, 0, 0.7686275, 1,
1.187546, 2.213127, 0.7452211, 1, 0, 0.7607843, 1,
1.2023, -0.3310882, 2.981298, 1, 0, 0.7568628, 1,
1.204641, 1.045016, 2.201335, 1, 0, 0.7490196, 1,
1.214308, -1.829013, 2.819948, 1, 0, 0.7450981, 1,
1.215003, -1.48248, 2.026294, 1, 0, 0.7372549, 1,
1.215153, -1.206887, 1.856153, 1, 0, 0.7333333, 1,
1.216564, 0.4941031, 1.72962, 1, 0, 0.7254902, 1,
1.223697, 0.3073395, 1.577117, 1, 0, 0.7215686, 1,
1.225745, 2.235192, -0.588061, 1, 0, 0.7137255, 1,
1.228545, 1.230984, -0.4205734, 1, 0, 0.7098039, 1,
1.231549, -0.07684401, 1.436682, 1, 0, 0.7019608, 1,
1.242109, 1.461725, 0.7019734, 1, 0, 0.6941177, 1,
1.246191, 0.7519708, 0.9953921, 1, 0, 0.6901961, 1,
1.257209, 1.41771, 2.019209, 1, 0, 0.682353, 1,
1.267176, 0.6288061, 0.935504, 1, 0, 0.6784314, 1,
1.28597, 0.3478212, 3.692298, 1, 0, 0.6705883, 1,
1.29606, -0.408127, 0.1587071, 1, 0, 0.6666667, 1,
1.305364, 0.2891256, 2.576859, 1, 0, 0.6588235, 1,
1.310265, -0.9989523, 2.716842, 1, 0, 0.654902, 1,
1.326973, 0.9821271, 0.6839417, 1, 0, 0.6470588, 1,
1.330169, 1.085402, 0.403111, 1, 0, 0.6431373, 1,
1.331604, 0.9899281, 0.5076973, 1, 0, 0.6352941, 1,
1.335049, 0.5589366, 0.7955648, 1, 0, 0.6313726, 1,
1.340837, -0.7961426, 2.407612, 1, 0, 0.6235294, 1,
1.344662, -0.6222605, 1.955853, 1, 0, 0.6196079, 1,
1.355989, -0.6696514, 0.3658257, 1, 0, 0.6117647, 1,
1.357882, 2.146788, 2.009734, 1, 0, 0.6078432, 1,
1.364435, -1.673573, 1.020492, 1, 0, 0.6, 1,
1.368367, 0.3117717, 1.310743, 1, 0, 0.5921569, 1,
1.374072, 1.429065, -0.5338356, 1, 0, 0.5882353, 1,
1.375556, 1.054979, 1.3757, 1, 0, 0.5803922, 1,
1.38092, -1.012382, 1.158579, 1, 0, 0.5764706, 1,
1.383197, 0.9369452, 2.073305, 1, 0, 0.5686275, 1,
1.383937, -0.1422163, 1.479512, 1, 0, 0.5647059, 1,
1.384265, 0.3986394, 2.897144, 1, 0, 0.5568628, 1,
1.387529, 0.03142337, 2.048841, 1, 0, 0.5529412, 1,
1.424629, -1.555334, 2.773099, 1, 0, 0.5450981, 1,
1.42472, -0.3610851, 0.08484887, 1, 0, 0.5411765, 1,
1.439067, 0.05932849, 1.771071, 1, 0, 0.5333334, 1,
1.441859, -0.430679, 2.439751, 1, 0, 0.5294118, 1,
1.445352, 1.988428, -0.1958614, 1, 0, 0.5215687, 1,
1.446424, 0.9533312, 1.225726, 1, 0, 0.5176471, 1,
1.462337, -0.5031437, 1.080151, 1, 0, 0.509804, 1,
1.476109, -2.527417, 2.503544, 1, 0, 0.5058824, 1,
1.48914, -0.7881806, 3.431811, 1, 0, 0.4980392, 1,
1.499086, -0.2797665, 2.158856, 1, 0, 0.4901961, 1,
1.501047, -0.3287742, 1.148097, 1, 0, 0.4862745, 1,
1.50529, -0.1574894, 2.331957, 1, 0, 0.4784314, 1,
1.509912, -0.6091197, 0.5264789, 1, 0, 0.4745098, 1,
1.51045, -1.138589, 3.139116, 1, 0, 0.4666667, 1,
1.513668, 0.6651048, 1.15677, 1, 0, 0.4627451, 1,
1.517338, -0.5983378, 2.149622, 1, 0, 0.454902, 1,
1.519276, -0.9011571, 1.990172, 1, 0, 0.4509804, 1,
1.520069, -0.789226, 2.315728, 1, 0, 0.4431373, 1,
1.524951, 0.769725, 0.4912646, 1, 0, 0.4392157, 1,
1.526362, 1.014906, 0.908648, 1, 0, 0.4313726, 1,
1.527145, 0.4200977, 0.8969108, 1, 0, 0.427451, 1,
1.529513, 0.5402752, 0.5851861, 1, 0, 0.4196078, 1,
1.539494, -0.6317255, 1.674326, 1, 0, 0.4156863, 1,
1.547832, -0.02979564, 1.843691, 1, 0, 0.4078431, 1,
1.551091, -0.7009108, 3.700552, 1, 0, 0.4039216, 1,
1.552598, 0.4788608, 1.399684, 1, 0, 0.3960784, 1,
1.554869, -0.4530596, 3.040146, 1, 0, 0.3882353, 1,
1.571776, -0.5996794, 1.81897, 1, 0, 0.3843137, 1,
1.576612, -2.044919, 2.366389, 1, 0, 0.3764706, 1,
1.58099, 0.3278789, 2.409007, 1, 0, 0.372549, 1,
1.595127, -0.5259248, 2.929207, 1, 0, 0.3647059, 1,
1.603608, -0.601913, 2.029043, 1, 0, 0.3607843, 1,
1.610521, 0.06136306, 2.368766, 1, 0, 0.3529412, 1,
1.626446, 1.139154, 2.182891, 1, 0, 0.3490196, 1,
1.635347, -0.524269, 3.051626, 1, 0, 0.3411765, 1,
1.639026, -1.252605, 1.134948, 1, 0, 0.3372549, 1,
1.651061, 0.3921786, -1.266034, 1, 0, 0.3294118, 1,
1.660453, -0.7674276, 1.528766, 1, 0, 0.3254902, 1,
1.662805, -1.398877, 0.1564858, 1, 0, 0.3176471, 1,
1.668104, 0.9318875, 0.1572187, 1, 0, 0.3137255, 1,
1.681236, -0.08769256, 1.263803, 1, 0, 0.3058824, 1,
1.683557, -1.984517, 1.928624, 1, 0, 0.2980392, 1,
1.691602, -0.6430795, 2.124572, 1, 0, 0.2941177, 1,
1.69618, -1.026202, 0.03867204, 1, 0, 0.2862745, 1,
1.700921, 0.4230791, 1.799233, 1, 0, 0.282353, 1,
1.709005, -1.718535, 2.382711, 1, 0, 0.2745098, 1,
1.742565, 0.7490206, 2.082774, 1, 0, 0.2705882, 1,
1.747929, 0.3617641, 1.482907, 1, 0, 0.2627451, 1,
1.760257, -0.0701112, 1.696303, 1, 0, 0.2588235, 1,
1.772837, 0.4993027, -0.4167475, 1, 0, 0.2509804, 1,
1.782556, 0.5361912, 0.9803113, 1, 0, 0.2470588, 1,
1.794173, -1.020708, 3.945899, 1, 0, 0.2392157, 1,
1.811687, -1.00893, 2.226596, 1, 0, 0.2352941, 1,
1.817846, -0.3390529, 2.448311, 1, 0, 0.227451, 1,
1.826896, 0.3000427, 2.075349, 1, 0, 0.2235294, 1,
1.83136, -0.4560987, 1.360016, 1, 0, 0.2156863, 1,
1.834169, -0.5267444, 3.752499, 1, 0, 0.2117647, 1,
1.835715, -0.35071, 1.311808, 1, 0, 0.2039216, 1,
1.845354, 0.5024447, 2.095364, 1, 0, 0.1960784, 1,
1.851185, -0.5265827, 0.9271694, 1, 0, 0.1921569, 1,
1.861367, -2.581511, 1.346064, 1, 0, 0.1843137, 1,
1.869579, 1.230341, 1.880361, 1, 0, 0.1803922, 1,
1.88771, 0.5776255, -0.08125886, 1, 0, 0.172549, 1,
1.907468, 1.057949, 0.7550549, 1, 0, 0.1686275, 1,
1.911993, 1.525061, 0.8777805, 1, 0, 0.1607843, 1,
1.912725, 0.1895307, 1.64768, 1, 0, 0.1568628, 1,
1.928535, -1.160719, 1.790515, 1, 0, 0.1490196, 1,
1.93715, 0.7988833, 0.08518878, 1, 0, 0.145098, 1,
1.939026, -0.4768753, 0.9846238, 1, 0, 0.1372549, 1,
1.952158, -0.4296511, 1.6477, 1, 0, 0.1333333, 1,
1.997499, 1.058205, 0.1445573, 1, 0, 0.1254902, 1,
2.027289, -0.3484376, 1.190575, 1, 0, 0.1215686, 1,
2.031039, 1.882372, -0.5161323, 1, 0, 0.1137255, 1,
2.037293, 2.410724, 1.290964, 1, 0, 0.1098039, 1,
2.061315, -0.4793592, 1.517506, 1, 0, 0.1019608, 1,
2.081889, 1.324834, 0.9345428, 1, 0, 0.09411765, 1,
2.149106, -1.198123, 2.438762, 1, 0, 0.09019608, 1,
2.174235, -0.1038685, 4.186009, 1, 0, 0.08235294, 1,
2.20533, 0.228021, 2.412186, 1, 0, 0.07843138, 1,
2.220093, 0.02057899, 0.7042871, 1, 0, 0.07058824, 1,
2.250154, 0.2656317, 2.493407, 1, 0, 0.06666667, 1,
2.329242, -0.8860136, 1.504844, 1, 0, 0.05882353, 1,
2.337574, 0.512412, 1.753025, 1, 0, 0.05490196, 1,
2.395611, 2.006913, 2.149234, 1, 0, 0.04705882, 1,
2.3979, 0.1500392, 1.429952, 1, 0, 0.04313726, 1,
2.400146, 0.2444645, 1.074624, 1, 0, 0.03529412, 1,
2.421793, -1.212156, 1.018895, 1, 0, 0.03137255, 1,
2.538628, 1.085522, 2.09467, 1, 0, 0.02352941, 1,
2.583369, 0.6479219, 1.180521, 1, 0, 0.01960784, 1,
2.605834, -0.2850251, -0.02317769, 1, 0, 0.01176471, 1,
3.14309, 1.688637, 2.157749, 1, 0, 0.007843138, 1
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
0.1113641, -4.256112, -7.814087, 0, -0.5, 0.5, 0.5,
0.1113641, -4.256112, -7.814087, 1, -0.5, 0.5, 0.5,
0.1113641, -4.256112, -7.814087, 1, 1.5, 0.5, 0.5,
0.1113641, -4.256112, -7.814087, 0, 1.5, 0.5, 0.5
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
-3.948117, 0.01702332, -7.814087, 0, -0.5, 0.5, 0.5,
-3.948117, 0.01702332, -7.814087, 1, -0.5, 0.5, 0.5,
-3.948117, 0.01702332, -7.814087, 1, 1.5, 0.5, 0.5,
-3.948117, 0.01702332, -7.814087, 0, 1.5, 0.5, 0.5
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
-3.948117, -4.256112, -0.5547338, 0, -0.5, 0.5, 0.5,
-3.948117, -4.256112, -0.5547338, 1, -0.5, 0.5, 0.5,
-3.948117, -4.256112, -0.5547338, 1, 1.5, 0.5, 0.5,
-3.948117, -4.256112, -0.5547338, 0, 1.5, 0.5, 0.5
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
-2, -3.270004, -6.138852,
3, -3.270004, -6.138852,
-2, -3.270004, -6.138852,
-2, -3.434355, -6.418057,
-1, -3.270004, -6.138852,
-1, -3.434355, -6.418057,
0, -3.270004, -6.138852,
0, -3.434355, -6.418057,
1, -3.270004, -6.138852,
1, -3.434355, -6.418057,
2, -3.270004, -6.138852,
2, -3.434355, -6.418057,
3, -3.270004, -6.138852,
3, -3.434355, -6.418057
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
-2, -3.763058, -6.976469, 0, -0.5, 0.5, 0.5,
-2, -3.763058, -6.976469, 1, -0.5, 0.5, 0.5,
-2, -3.763058, -6.976469, 1, 1.5, 0.5, 0.5,
-2, -3.763058, -6.976469, 0, 1.5, 0.5, 0.5,
-1, -3.763058, -6.976469, 0, -0.5, 0.5, 0.5,
-1, -3.763058, -6.976469, 1, -0.5, 0.5, 0.5,
-1, -3.763058, -6.976469, 1, 1.5, 0.5, 0.5,
-1, -3.763058, -6.976469, 0, 1.5, 0.5, 0.5,
0, -3.763058, -6.976469, 0, -0.5, 0.5, 0.5,
0, -3.763058, -6.976469, 1, -0.5, 0.5, 0.5,
0, -3.763058, -6.976469, 1, 1.5, 0.5, 0.5,
0, -3.763058, -6.976469, 0, 1.5, 0.5, 0.5,
1, -3.763058, -6.976469, 0, -0.5, 0.5, 0.5,
1, -3.763058, -6.976469, 1, -0.5, 0.5, 0.5,
1, -3.763058, -6.976469, 1, 1.5, 0.5, 0.5,
1, -3.763058, -6.976469, 0, 1.5, 0.5, 0.5,
2, -3.763058, -6.976469, 0, -0.5, 0.5, 0.5,
2, -3.763058, -6.976469, 1, -0.5, 0.5, 0.5,
2, -3.763058, -6.976469, 1, 1.5, 0.5, 0.5,
2, -3.763058, -6.976469, 0, 1.5, 0.5, 0.5,
3, -3.763058, -6.976469, 0, -0.5, 0.5, 0.5,
3, -3.763058, -6.976469, 1, -0.5, 0.5, 0.5,
3, -3.763058, -6.976469, 1, 1.5, 0.5, 0.5,
3, -3.763058, -6.976469, 0, 1.5, 0.5, 0.5
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
-3.011313, -3, -6.138852,
-3.011313, 3, -6.138852,
-3.011313, -3, -6.138852,
-3.167447, -3, -6.418057,
-3.011313, -2, -6.138852,
-3.167447, -2, -6.418057,
-3.011313, -1, -6.138852,
-3.167447, -1, -6.418057,
-3.011313, 0, -6.138852,
-3.167447, 0, -6.418057,
-3.011313, 1, -6.138852,
-3.167447, 1, -6.418057,
-3.011313, 2, -6.138852,
-3.167447, 2, -6.418057,
-3.011313, 3, -6.138852,
-3.167447, 3, -6.418057
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
-3.479715, -3, -6.976469, 0, -0.5, 0.5, 0.5,
-3.479715, -3, -6.976469, 1, -0.5, 0.5, 0.5,
-3.479715, -3, -6.976469, 1, 1.5, 0.5, 0.5,
-3.479715, -3, -6.976469, 0, 1.5, 0.5, 0.5,
-3.479715, -2, -6.976469, 0, -0.5, 0.5, 0.5,
-3.479715, -2, -6.976469, 1, -0.5, 0.5, 0.5,
-3.479715, -2, -6.976469, 1, 1.5, 0.5, 0.5,
-3.479715, -2, -6.976469, 0, 1.5, 0.5, 0.5,
-3.479715, -1, -6.976469, 0, -0.5, 0.5, 0.5,
-3.479715, -1, -6.976469, 1, -0.5, 0.5, 0.5,
-3.479715, -1, -6.976469, 1, 1.5, 0.5, 0.5,
-3.479715, -1, -6.976469, 0, 1.5, 0.5, 0.5,
-3.479715, 0, -6.976469, 0, -0.5, 0.5, 0.5,
-3.479715, 0, -6.976469, 1, -0.5, 0.5, 0.5,
-3.479715, 0, -6.976469, 1, 1.5, 0.5, 0.5,
-3.479715, 0, -6.976469, 0, 1.5, 0.5, 0.5,
-3.479715, 1, -6.976469, 0, -0.5, 0.5, 0.5,
-3.479715, 1, -6.976469, 1, -0.5, 0.5, 0.5,
-3.479715, 1, -6.976469, 1, 1.5, 0.5, 0.5,
-3.479715, 1, -6.976469, 0, 1.5, 0.5, 0.5,
-3.479715, 2, -6.976469, 0, -0.5, 0.5, 0.5,
-3.479715, 2, -6.976469, 1, -0.5, 0.5, 0.5,
-3.479715, 2, -6.976469, 1, 1.5, 0.5, 0.5,
-3.479715, 2, -6.976469, 0, 1.5, 0.5, 0.5,
-3.479715, 3, -6.976469, 0, -0.5, 0.5, 0.5,
-3.479715, 3, -6.976469, 1, -0.5, 0.5, 0.5,
-3.479715, 3, -6.976469, 1, 1.5, 0.5, 0.5,
-3.479715, 3, -6.976469, 0, 1.5, 0.5, 0.5
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
-3.011313, -3.270004, -4,
-3.011313, -3.270004, 4,
-3.011313, -3.270004, -4,
-3.167447, -3.434355, -4,
-3.011313, -3.270004, -2,
-3.167447, -3.434355, -2,
-3.011313, -3.270004, 0,
-3.167447, -3.434355, 0,
-3.011313, -3.270004, 2,
-3.167447, -3.434355, 2,
-3.011313, -3.270004, 4,
-3.167447, -3.434355, 4
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
-3.479715, -3.763058, -4, 0, -0.5, 0.5, 0.5,
-3.479715, -3.763058, -4, 1, -0.5, 0.5, 0.5,
-3.479715, -3.763058, -4, 1, 1.5, 0.5, 0.5,
-3.479715, -3.763058, -4, 0, 1.5, 0.5, 0.5,
-3.479715, -3.763058, -2, 0, -0.5, 0.5, 0.5,
-3.479715, -3.763058, -2, 1, -0.5, 0.5, 0.5,
-3.479715, -3.763058, -2, 1, 1.5, 0.5, 0.5,
-3.479715, -3.763058, -2, 0, 1.5, 0.5, 0.5,
-3.479715, -3.763058, 0, 0, -0.5, 0.5, 0.5,
-3.479715, -3.763058, 0, 1, -0.5, 0.5, 0.5,
-3.479715, -3.763058, 0, 1, 1.5, 0.5, 0.5,
-3.479715, -3.763058, 0, 0, 1.5, 0.5, 0.5,
-3.479715, -3.763058, 2, 0, -0.5, 0.5, 0.5,
-3.479715, -3.763058, 2, 1, -0.5, 0.5, 0.5,
-3.479715, -3.763058, 2, 1, 1.5, 0.5, 0.5,
-3.479715, -3.763058, 2, 0, 1.5, 0.5, 0.5,
-3.479715, -3.763058, 4, 0, -0.5, 0.5, 0.5,
-3.479715, -3.763058, 4, 1, -0.5, 0.5, 0.5,
-3.479715, -3.763058, 4, 1, 1.5, 0.5, 0.5,
-3.479715, -3.763058, 4, 0, 1.5, 0.5, 0.5
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
-3.011313, -3.270004, -6.138852,
-3.011313, 3.304051, -6.138852,
-3.011313, -3.270004, 5.029384,
-3.011313, 3.304051, 5.029384,
-3.011313, -3.270004, -6.138852,
-3.011313, -3.270004, 5.029384,
-3.011313, 3.304051, -6.138852,
-3.011313, 3.304051, 5.029384,
-3.011313, -3.270004, -6.138852,
3.234041, -3.270004, -6.138852,
-3.011313, -3.270004, 5.029384,
3.234041, -3.270004, 5.029384,
-3.011313, 3.304051, -6.138852,
3.234041, 3.304051, -6.138852,
-3.011313, 3.304051, 5.029384,
3.234041, 3.304051, 5.029384,
3.234041, -3.270004, -6.138852,
3.234041, 3.304051, -6.138852,
3.234041, -3.270004, 5.029384,
3.234041, 3.304051, 5.029384,
3.234041, -3.270004, -6.138852,
3.234041, -3.270004, 5.029384,
3.234041, 3.304051, -6.138852,
3.234041, 3.304051, 5.029384
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
var radius = 7.681754;
var distance = 34.17699;
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
mvMatrix.translate( -0.1113641, -0.01702332, 0.5547338 );
mvMatrix.scale( 1.329895, 1.2634, 0.7436863 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.17699);
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
pyriminobac-methyl<-read.table("pyriminobac-methyl.xyz")
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-pyriminobac-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
```

```r
y<-pyriminobac-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
```

```r
z<-pyriminobac-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'pyriminobac' not found
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
-2.920362, 0.2536588, -0.3589557, 0, 0, 1, 1, 1,
-2.834404, -0.5796092, -1.720067, 1, 0, 0, 1, 1,
-2.579723, -0.5551288, -2.845822, 1, 0, 0, 1, 1,
-2.575568, 0.9064186, -2.341048, 1, 0, 0, 1, 1,
-2.539337, 0.5523977, -0.7016301, 1, 0, 0, 1, 1,
-2.468984, -0.06377743, -1.818008, 1, 0, 0, 1, 1,
-2.452097, -0.433227, -1.679291, 0, 0, 0, 1, 1,
-2.451006, 1.045274, 0.1110553, 0, 0, 0, 1, 1,
-2.367989, 0.7644205, -0.5602416, 0, 0, 0, 1, 1,
-2.336663, -0.3697661, -2.993208, 0, 0, 0, 1, 1,
-2.334031, -0.9787228, -3.600588, 0, 0, 0, 1, 1,
-2.2999, -0.4752193, -2.264815, 0, 0, 0, 1, 1,
-2.289833, 0.2879402, -2.032458, 0, 0, 0, 1, 1,
-2.282819, -0.3212221, -0.4800463, 1, 1, 1, 1, 1,
-2.243082, -1.760699, -2.411479, 1, 1, 1, 1, 1,
-2.145115, -2.525919, -3.72249, 1, 1, 1, 1, 1,
-2.12033, -1.104825, -1.270467, 1, 1, 1, 1, 1,
-2.101679, 0.4393515, -1.389502, 1, 1, 1, 1, 1,
-2.076323, -0.5464675, -3.015965, 1, 1, 1, 1, 1,
-2.007484, -0.3383979, -0.8928081, 1, 1, 1, 1, 1,
-1.996647, -0.8942281, -2.204831, 1, 1, 1, 1, 1,
-1.973356, -0.710146, -1.600478, 1, 1, 1, 1, 1,
-1.971885, -1.44671, -1.14444, 1, 1, 1, 1, 1,
-1.966854, 0.01084042, -0.5472186, 1, 1, 1, 1, 1,
-1.956638, 3.038652, -1.593923, 1, 1, 1, 1, 1,
-1.943277, -0.9616385, -4.023931, 1, 1, 1, 1, 1,
-1.924352, 1.667266, 0.2157499, 1, 1, 1, 1, 1,
-1.894288, -1.277339, -1.095973, 1, 1, 1, 1, 1,
-1.880076, -0.7139416, -2.192032, 0, 0, 1, 1, 1,
-1.856088, 0.6286659, -0.2729133, 1, 0, 0, 1, 1,
-1.827263, 0.03026082, -0.7131556, 1, 0, 0, 1, 1,
-1.823688, -0.5787039, -1.391155, 1, 0, 0, 1, 1,
-1.822225, -1.506819, -3.652789, 1, 0, 0, 1, 1,
-1.758518, -3.174265, -2.08995, 1, 0, 0, 1, 1,
-1.75657, -0.1448249, -0.3587318, 0, 0, 0, 1, 1,
-1.754138, 2.12254, -0.957699, 0, 0, 0, 1, 1,
-1.738552, -0.0959054, -2.484978, 0, 0, 0, 1, 1,
-1.734626, 1.259319, -2.684991, 0, 0, 0, 1, 1,
-1.686585, -0.842099, -2.163796, 0, 0, 0, 1, 1,
-1.651068, -0.588328, -1.570545, 0, 0, 0, 1, 1,
-1.635596, -1.327, -1.786773, 0, 0, 0, 1, 1,
-1.634077, 0.1253607, -0.2527144, 1, 1, 1, 1, 1,
-1.626493, 1.069299, -1.649727, 1, 1, 1, 1, 1,
-1.598943, -0.6492971, -2.480473, 1, 1, 1, 1, 1,
-1.591598, -1.761139, -2.074775, 1, 1, 1, 1, 1,
-1.591499, -0.3300909, -2.555044, 1, 1, 1, 1, 1,
-1.57738, -0.6652542, -2.546777, 1, 1, 1, 1, 1,
-1.577044, 0.5335197, -0.4817566, 1, 1, 1, 1, 1,
-1.57294, -0.6157076, -3.003347, 1, 1, 1, 1, 1,
-1.565151, -0.7697974, -3.400967, 1, 1, 1, 1, 1,
-1.560501, 1.771864, -2.06846, 1, 1, 1, 1, 1,
-1.559275, 0.9655836, -3.100152, 1, 1, 1, 1, 1,
-1.55452, -0.2268122, -2.494821, 1, 1, 1, 1, 1,
-1.553414, 0.4864215, -2.492672, 1, 1, 1, 1, 1,
-1.55007, -0.8678527, -2.157331, 1, 1, 1, 1, 1,
-1.547085, 0.005331318, -2.457354, 1, 1, 1, 1, 1,
-1.54513, 0.3460212, -1.8469, 0, 0, 1, 1, 1,
-1.514285, 1.405592, 0.3155983, 1, 0, 0, 1, 1,
-1.500409, -1.546937, -2.878929, 1, 0, 0, 1, 1,
-1.485432, -0.5198369, -2.995316, 1, 0, 0, 1, 1,
-1.477305, 0.2717162, -1.79476, 1, 0, 0, 1, 1,
-1.475766, 0.1161834, -2.008985, 1, 0, 0, 1, 1,
-1.45886, -1.363708, -1.689096, 0, 0, 0, 1, 1,
-1.455043, 0.2420956, -0.3728164, 0, 0, 0, 1, 1,
-1.447248, -0.7016557, -2.716322, 0, 0, 0, 1, 1,
-1.445139, -0.08546495, -0.07947563, 0, 0, 0, 1, 1,
-1.43875, 1.481108, 0.6255612, 0, 0, 0, 1, 1,
-1.409837, 1.092204, -2.261783, 0, 0, 0, 1, 1,
-1.40769, 0.5561491, -0.3578029, 0, 0, 0, 1, 1,
-1.395209, -0.06775324, -1.706307, 1, 1, 1, 1, 1,
-1.391524, 0.7188271, -1.217284, 1, 1, 1, 1, 1,
-1.376394, -0.1796878, -1.726317, 1, 1, 1, 1, 1,
-1.374159, -0.7727326, -2.481717, 1, 1, 1, 1, 1,
-1.366877, 1.148996, -2.106856, 1, 1, 1, 1, 1,
-1.354234, 0.4181356, -1.477108, 1, 1, 1, 1, 1,
-1.345722, -0.3255776, -1.644367, 1, 1, 1, 1, 1,
-1.343778, -0.3452218, -2.707631, 1, 1, 1, 1, 1,
-1.336525, 0.6097769, -1.689369, 1, 1, 1, 1, 1,
-1.334607, -1.388974, -2.368056, 1, 1, 1, 1, 1,
-1.329543, -0.2055682, -0.4289164, 1, 1, 1, 1, 1,
-1.328852, -1.010925, -2.32672, 1, 1, 1, 1, 1,
-1.326465, 0.4384853, -2.370334, 1, 1, 1, 1, 1,
-1.319273, 0.785521, -0.8239297, 1, 1, 1, 1, 1,
-1.31466, -0.7491166, -2.392132, 1, 1, 1, 1, 1,
-1.30495, -1.960672, -4.068267, 0, 0, 1, 1, 1,
-1.302335, -1.50667, -3.377274, 1, 0, 0, 1, 1,
-1.295599, -1.576385, -3.647994, 1, 0, 0, 1, 1,
-1.29446, 0.07208136, -2.836521, 1, 0, 0, 1, 1,
-1.292656, 0.8320816, -0.9669449, 1, 0, 0, 1, 1,
-1.288995, 0.1595826, -3.183711, 1, 0, 0, 1, 1,
-1.287195, -0.3990338, -2.8779, 0, 0, 0, 1, 1,
-1.275614, -0.1969069, -2.164155, 0, 0, 0, 1, 1,
-1.274731, -0.4900636, -3.43434, 0, 0, 0, 1, 1,
-1.272398, 1.603869, -1.709246, 0, 0, 0, 1, 1,
-1.262878, -0.05515369, -0.01995614, 0, 0, 0, 1, 1,
-1.261023, 1.617605, -1.722794, 0, 0, 0, 1, 1,
-1.248952, -0.1609315, 0.7213122, 0, 0, 0, 1, 1,
-1.244763, 0.6132826, -0.08691353, 1, 1, 1, 1, 1,
-1.228932, -0.9244049, -2.021858, 1, 1, 1, 1, 1,
-1.228227, -1.003307, -3.747882, 1, 1, 1, 1, 1,
-1.223674, -0.3115618, -0.6149421, 1, 1, 1, 1, 1,
-1.223232, -0.5960841, -2.58756, 1, 1, 1, 1, 1,
-1.214819, -0.2668501, -3.091151, 1, 1, 1, 1, 1,
-1.204983, -0.9510269, -2.163073, 1, 1, 1, 1, 1,
-1.188775, -1.040259, -1.929011, 1, 1, 1, 1, 1,
-1.179393, 1.054538, -2.827894, 1, 1, 1, 1, 1,
-1.170208, 0.7442751, -1.736782, 1, 1, 1, 1, 1,
-1.16283, -0.02194657, -1.824255, 1, 1, 1, 1, 1,
-1.1578, 0.2276556, -1.438257, 1, 1, 1, 1, 1,
-1.15273, -0.01641312, -2.028873, 1, 1, 1, 1, 1,
-1.143504, -0.5665309, -0.7890165, 1, 1, 1, 1, 1,
-1.141574, -0.05631047, -1.771996, 1, 1, 1, 1, 1,
-1.138279, 0.1425393, -3.206423, 0, 0, 1, 1, 1,
-1.11536, -0.8870085, -2.486714, 1, 0, 0, 1, 1,
-1.111314, 0.32087, -0.4223448, 1, 0, 0, 1, 1,
-1.111288, -0.7738286, -2.042387, 1, 0, 0, 1, 1,
-1.110793, -1.96111, -2.894198, 1, 0, 0, 1, 1,
-1.105072, 0.2712601, -0.05581354, 1, 0, 0, 1, 1,
-1.102542, -1.707571, -2.093424, 0, 0, 0, 1, 1,
-1.099608, 0.7589269, -1.430048, 0, 0, 0, 1, 1,
-1.094683, 1.602874, 0.1155708, 0, 0, 0, 1, 1,
-1.094531, 1.197635, -3.166204, 0, 0, 0, 1, 1,
-1.090631, 0.4525835, -3.67492, 0, 0, 0, 1, 1,
-1.086496, -0.7312132, -1.630866, 0, 0, 0, 1, 1,
-1.083115, -0.1271168, 0.4513059, 0, 0, 0, 1, 1,
-1.079656, -0.4768271, -1.834696, 1, 1, 1, 1, 1,
-1.076519, -0.9832719, -2.48981, 1, 1, 1, 1, 1,
-1.073148, -0.7753999, -0.1633098, 1, 1, 1, 1, 1,
-1.071593, -0.2878438, -0.5894866, 1, 1, 1, 1, 1,
-1.069094, -0.01733981, -1.073336, 1, 1, 1, 1, 1,
-1.060081, 0.1196817, -1.420732, 1, 1, 1, 1, 1,
-1.056814, -1.571603, -3.218286, 1, 1, 1, 1, 1,
-1.051929, -0.05381963, -1.607812, 1, 1, 1, 1, 1,
-1.051628, 1.004393, -0.9499537, 1, 1, 1, 1, 1,
-1.033579, 0.9542858, -0.4814174, 1, 1, 1, 1, 1,
-1.029086, 0.06451166, -0.6090628, 1, 1, 1, 1, 1,
-1.025722, 0.2977919, -0.4908876, 1, 1, 1, 1, 1,
-1.021913, 0.6636022, -1.466729, 1, 1, 1, 1, 1,
-1.018475, -0.2426683, -2.222458, 1, 1, 1, 1, 1,
-1.017695, -1.819291, -3.54714, 1, 1, 1, 1, 1,
-1.016486, -2.157074, -2.003234, 0, 0, 1, 1, 1,
-1.015611, -0.4773583, -1.75785, 1, 0, 0, 1, 1,
-1.014976, 1.761482, -1.221178, 1, 0, 0, 1, 1,
-1.013608, 0.4128943, -2.11269, 1, 0, 0, 1, 1,
-1.008324, 0.511871, -2.073587, 1, 0, 0, 1, 1,
-1.004494, -0.317004, -2.693368, 1, 0, 0, 1, 1,
-1.002762, 1.779406, -1.567869, 0, 0, 0, 1, 1,
-0.9970584, 0.6721397, -2.209293, 0, 0, 0, 1, 1,
-0.9935445, 0.1528883, -1.05767, 0, 0, 0, 1, 1,
-0.9848701, -0.235656, -1.068038, 0, 0, 0, 1, 1,
-0.9764472, 0.4150758, 0.01578788, 0, 0, 0, 1, 1,
-0.971852, -0.4832483, -3.420575, 0, 0, 0, 1, 1,
-0.9713227, -0.7467192, -2.136822, 0, 0, 0, 1, 1,
-0.969719, 0.1582673, -1.178781, 1, 1, 1, 1, 1,
-0.9658957, 0.1889454, 0.4377422, 1, 1, 1, 1, 1,
-0.9595571, -0.3157238, -1.404957, 1, 1, 1, 1, 1,
-0.9557876, 0.7111737, -1.090915, 1, 1, 1, 1, 1,
-0.9505535, 0.8032112, -1.360775, 1, 1, 1, 1, 1,
-0.9466428, 0.04461298, -2.465657, 1, 1, 1, 1, 1,
-0.9314195, -1.275409, -1.117785, 1, 1, 1, 1, 1,
-0.9285913, -0.1763213, -0.8969148, 1, 1, 1, 1, 1,
-0.9281631, 0.009108099, -1.020812, 1, 1, 1, 1, 1,
-0.9262781, -0.7991353, -3.810015, 1, 1, 1, 1, 1,
-0.9199708, 0.5899463, -0.03189053, 1, 1, 1, 1, 1,
-0.9181495, -1.19138, -3.168937, 1, 1, 1, 1, 1,
-0.9145087, -1.426993, -2.746639, 1, 1, 1, 1, 1,
-0.911992, 0.3506085, -2.322733, 1, 1, 1, 1, 1,
-0.9082782, -0.6775597, -1.812326, 1, 1, 1, 1, 1,
-0.9056924, -0.3619771, -2.217305, 0, 0, 1, 1, 1,
-0.9018423, -2.592005, -2.991917, 1, 0, 0, 1, 1,
-0.897512, 0.4932599, -0.1506399, 1, 0, 0, 1, 1,
-0.8935875, -0.500562, -1.969589, 1, 0, 0, 1, 1,
-0.8913866, 0.5950703, 0.5800036, 1, 0, 0, 1, 1,
-0.8829759, -0.06936608, -0.7644383, 1, 0, 0, 1, 1,
-0.8764133, 1.529362, -3.688319, 0, 0, 0, 1, 1,
-0.868296, 0.472973, -3.109103, 0, 0, 0, 1, 1,
-0.8679582, 1.204703, 0.5114548, 0, 0, 0, 1, 1,
-0.8646387, -0.1052907, -2.372177, 0, 0, 0, 1, 1,
-0.8638015, 0.5629734, -0.5850515, 0, 0, 0, 1, 1,
-0.8526091, -1.227676, -2.728283, 0, 0, 0, 1, 1,
-0.8512522, -1.700529, -1.468302, 0, 0, 0, 1, 1,
-0.8423344, -0.3902719, -2.229228, 1, 1, 1, 1, 1,
-0.8407296, -0.1570323, -3.032504, 1, 1, 1, 1, 1,
-0.8395999, -1.708747, -2.062221, 1, 1, 1, 1, 1,
-0.8362081, -0.7773311, -2.942097, 1, 1, 1, 1, 1,
-0.8328673, 0.6804283, -2.324394, 1, 1, 1, 1, 1,
-0.821843, -0.2733659, -2.256027, 1, 1, 1, 1, 1,
-0.8193271, -0.139536, -1.258047, 1, 1, 1, 1, 1,
-0.8126337, -1.750836, -4.569735, 1, 1, 1, 1, 1,
-0.811523, -0.847562, -2.451155, 1, 1, 1, 1, 1,
-0.8106425, 0.7910588, -2.112267, 1, 1, 1, 1, 1,
-0.8032544, 0.7626239, -0.4063589, 1, 1, 1, 1, 1,
-0.8002663, -1.018296, -2.051442, 1, 1, 1, 1, 1,
-0.7980629, 1.935024, -2.369736, 1, 1, 1, 1, 1,
-0.797191, 1.19758, -0.6362416, 1, 1, 1, 1, 1,
-0.7971738, 1.570938, -1.19664, 1, 1, 1, 1, 1,
-0.7944371, -0.6020319, -3.158955, 0, 0, 1, 1, 1,
-0.7929788, -1.160424, -4.484888, 1, 0, 0, 1, 1,
-0.7927948, -0.08415423, 0.4632332, 1, 0, 0, 1, 1,
-0.7880307, -0.7939326, -3.377031, 1, 0, 0, 1, 1,
-0.7861671, -0.7392986, -3.074123, 1, 0, 0, 1, 1,
-0.7851271, 0.4841817, -0.2377161, 1, 0, 0, 1, 1,
-0.7749619, 1.237035, -0.4691523, 0, 0, 0, 1, 1,
-0.7724286, 0.06309341, -0.9680679, 0, 0, 0, 1, 1,
-0.7681808, 0.3954129, -1.007593, 0, 0, 0, 1, 1,
-0.7653752, -1.822538, -3.159392, 0, 0, 0, 1, 1,
-0.7652932, -0.0395033, -2.683385, 0, 0, 0, 1, 1,
-0.7504322, 0.3015928, -2.385396, 0, 0, 0, 1, 1,
-0.7373743, 2.169605, -0.0004478087, 0, 0, 0, 1, 1,
-0.7342637, -0.2463116, -1.098597, 1, 1, 1, 1, 1,
-0.7270989, -0.8939136, -2.04393, 1, 1, 1, 1, 1,
-0.7237403, 0.8265574, -1.80944, 1, 1, 1, 1, 1,
-0.7198948, -0.2457376, -4.147763, 1, 1, 1, 1, 1,
-0.7158199, 0.4169948, -0.6088148, 1, 1, 1, 1, 1,
-0.7158005, 0.3766246, -0.8457157, 1, 1, 1, 1, 1,
-0.7123531, 1.500614, -0.208488, 1, 1, 1, 1, 1,
-0.7085383, 0.6758531, -0.171334, 1, 1, 1, 1, 1,
-0.7056999, -0.005045177, -3.482379, 1, 1, 1, 1, 1,
-0.7048916, 0.2234751, -2.043797, 1, 1, 1, 1, 1,
-0.7034897, 1.466351, -1.097347, 1, 1, 1, 1, 1,
-0.6984873, -1.958976, -3.689998, 1, 1, 1, 1, 1,
-0.6960945, 1.03288, -2.082007, 1, 1, 1, 1, 1,
-0.6925094, -0.2871226, -2.248631, 1, 1, 1, 1, 1,
-0.6856936, 0.3712194, -3.51729, 1, 1, 1, 1, 1,
-0.6702219, 0.6192809, -0.8779483, 0, 0, 1, 1, 1,
-0.6696488, -1.311301, -3.518626, 1, 0, 0, 1, 1,
-0.669134, 0.5131177, -1.89447, 1, 0, 0, 1, 1,
-0.6665561, -0.4400425, -0.985668, 1, 0, 0, 1, 1,
-0.6602407, -0.8242536, -0.853771, 1, 0, 0, 1, 1,
-0.6565456, -0.01066395, -2.351771, 1, 0, 0, 1, 1,
-0.6562857, -0.1357611, -2.994686, 0, 0, 0, 1, 1,
-0.6550638, 0.4883534, -1.687558, 0, 0, 0, 1, 1,
-0.6547036, 1.069288, -0.6100394, 0, 0, 0, 1, 1,
-0.6541606, 0.7665995, -0.9052329, 0, 0, 0, 1, 1,
-0.6466975, 2.135761, -0.7320339, 0, 0, 0, 1, 1,
-0.6422946, 1.517661, 0.70374, 0, 0, 0, 1, 1,
-0.6416106, -0.04618969, -1.310785, 0, 0, 0, 1, 1,
-0.6397237, -1.098815, -3.378082, 1, 1, 1, 1, 1,
-0.6322415, 0.2043225, -0.6573538, 1, 1, 1, 1, 1,
-0.628966, -0.4743513, -2.423927, 1, 1, 1, 1, 1,
-0.626731, -0.07932954, -2.884695, 1, 1, 1, 1, 1,
-0.6223834, 0.2150405, -0.3923138, 1, 1, 1, 1, 1,
-0.6208706, 0.03125034, -2.117017, 1, 1, 1, 1, 1,
-0.6189745, 0.998234, -2.42892, 1, 1, 1, 1, 1,
-0.6186664, -0.4238656, -0.5074229, 1, 1, 1, 1, 1,
-0.617942, -0.7525989, -2.138308, 1, 1, 1, 1, 1,
-0.6156274, 0.2578877, -0.530274, 1, 1, 1, 1, 1,
-0.6101689, 0.6242882, 0.1042492, 1, 1, 1, 1, 1,
-0.609604, -0.5702653, -1.446222, 1, 1, 1, 1, 1,
-0.6009555, -1.71743, -4.012196, 1, 1, 1, 1, 1,
-0.5990452, 1.389817, -1.88649, 1, 1, 1, 1, 1,
-0.5983875, 0.3151325, -2.874852, 1, 1, 1, 1, 1,
-0.5970903, 1.118975, -0.07419351, 0, 0, 1, 1, 1,
-0.5823632, -0.3936161, -2.288262, 1, 0, 0, 1, 1,
-0.576531, -0.2553082, -2.154002, 1, 0, 0, 1, 1,
-0.5751523, -1.083261, -5.804627, 1, 0, 0, 1, 1,
-0.5742052, 1.631982, 0.04380669, 1, 0, 0, 1, 1,
-0.5730508, 1.505675, 0.213192, 1, 0, 0, 1, 1,
-0.572599, 0.7804704, 0.4689905, 0, 0, 0, 1, 1,
-0.5714813, -0.691044, -1.028241, 0, 0, 0, 1, 1,
-0.5714576, 0.2092613, -1.299273, 0, 0, 0, 1, 1,
-0.5677482, 0.06661604, -0.6177326, 0, 0, 0, 1, 1,
-0.5668963, -0.2440043, -1.47363, 0, 0, 0, 1, 1,
-0.5618541, -2.460395, -1.990662, 0, 0, 0, 1, 1,
-0.5604692, -0.9977124, -3.9447, 0, 0, 0, 1, 1,
-0.556998, -1.315796, -2.915149, 1, 1, 1, 1, 1,
-0.554794, -0.5889168, -1.831729, 1, 1, 1, 1, 1,
-0.5538291, -2.1754, -1.092745, 1, 1, 1, 1, 1,
-0.5478652, 0.001029668, -2.858566, 1, 1, 1, 1, 1,
-0.5444394, 1.934246, 0.1683257, 1, 1, 1, 1, 1,
-0.5434592, 0.3339012, -1.796651, 1, 1, 1, 1, 1,
-0.5417935, -0.1303007, -2.539516, 1, 1, 1, 1, 1,
-0.5407046, -1.539284, -1.614057, 1, 1, 1, 1, 1,
-0.5405086, 0.2159445, -1.316555, 1, 1, 1, 1, 1,
-0.5331753, 1.589253, -0.7728391, 1, 1, 1, 1, 1,
-0.5281177, 3.208312, -0.7663128, 1, 1, 1, 1, 1,
-0.5252303, 1.579217, -0.4270092, 1, 1, 1, 1, 1,
-0.5231679, -0.8864357, -3.999746, 1, 1, 1, 1, 1,
-0.5176935, 1.22478, 0.2502643, 1, 1, 1, 1, 1,
-0.5167891, -0.1654851, -1.635295, 1, 1, 1, 1, 1,
-0.5154868, -1.177637, -3.503827, 0, 0, 1, 1, 1,
-0.514728, -0.6298005, -0.53473, 1, 0, 0, 1, 1,
-0.5136762, 0.9374411, -3.629645, 1, 0, 0, 1, 1,
-0.5084429, -0.9460016, -2.371855, 1, 0, 0, 1, 1,
-0.5042344, -0.6221249, -1.416283, 1, 0, 0, 1, 1,
-0.5031038, 0.8189165, 0.0148055, 1, 0, 0, 1, 1,
-0.4933761, -1.458737, -2.665704, 0, 0, 0, 1, 1,
-0.490906, 0.3685668, -0.5800905, 0, 0, 0, 1, 1,
-0.4892165, 0.3898175, -0.4062306, 0, 0, 0, 1, 1,
-0.4858569, -0.3777887, -3.543812, 0, 0, 0, 1, 1,
-0.4855453, -0.3672903, -2.395039, 0, 0, 0, 1, 1,
-0.4832915, 1.284006, 1.071256, 0, 0, 0, 1, 1,
-0.4812787, 1.355869, 0.4624768, 0, 0, 0, 1, 1,
-0.479998, -0.2366789, -2.258995, 1, 1, 1, 1, 1,
-0.4788123, 0.1942339, -2.996006, 1, 1, 1, 1, 1,
-0.4781109, 1.595897, -0.03755934, 1, 1, 1, 1, 1,
-0.477555, -0.46703, -3.360199, 1, 1, 1, 1, 1,
-0.4732584, 0.3230259, -0.3158878, 1, 1, 1, 1, 1,
-0.4706276, -0.03347266, -2.499664, 1, 1, 1, 1, 1,
-0.4701242, 0.3318965, -1.076803, 1, 1, 1, 1, 1,
-0.4678424, 0.4837648, -1.719478, 1, 1, 1, 1, 1,
-0.4674191, -0.3586999, -1.42495, 1, 1, 1, 1, 1,
-0.4659483, -0.8520344, -3.295692, 1, 1, 1, 1, 1,
-0.4654553, -0.3928663, -2.450036, 1, 1, 1, 1, 1,
-0.4643984, -0.3607516, -2.331096, 1, 1, 1, 1, 1,
-0.4584533, 1.467578, -0.8427385, 1, 1, 1, 1, 1,
-0.4580051, 0.6248912, -0.4804541, 1, 1, 1, 1, 1,
-0.4528633, -1.614311, -1.565198, 1, 1, 1, 1, 1,
-0.4525576, -2.520371, -2.964977, 0, 0, 1, 1, 1,
-0.451862, 2.854422, -1.243961, 1, 0, 0, 1, 1,
-0.451692, 0.7063786, -2.779957, 1, 0, 0, 1, 1,
-0.4508543, -0.962245, -3.209806, 1, 0, 0, 1, 1,
-0.4498877, -0.1618962, -3.081728, 1, 0, 0, 1, 1,
-0.4497876, 1.357778, -2.611282, 1, 0, 0, 1, 1,
-0.4452169, 0.43137, -2.516734, 0, 0, 0, 1, 1,
-0.4438615, 2.093769, 0.4983535, 0, 0, 0, 1, 1,
-0.4398381, 1.099695, 0.173777, 0, 0, 0, 1, 1,
-0.4373765, 0.3772871, -1.658447, 0, 0, 0, 1, 1,
-0.4373329, 0.5274115, 1.105727, 0, 0, 0, 1, 1,
-0.436274, -1.210138, -2.92346, 0, 0, 0, 1, 1,
-0.4336855, 0.9123028, 0.2746082, 0, 0, 0, 1, 1,
-0.432754, -0.7857851, -2.246662, 1, 1, 1, 1, 1,
-0.4299586, 0.253929, -0.179015, 1, 1, 1, 1, 1,
-0.4225434, 0.9411398, 0.06923404, 1, 1, 1, 1, 1,
-0.4200613, 0.4762523, -0.04748203, 1, 1, 1, 1, 1,
-0.419957, -1.86151, -4.322011, 1, 1, 1, 1, 1,
-0.4163831, 0.5038766, -0.5261039, 1, 1, 1, 1, 1,
-0.4106393, -1.603613, -2.173289, 1, 1, 1, 1, 1,
-0.4055786, 0.6387353, -0.8858076, 1, 1, 1, 1, 1,
-0.4001402, -0.3772864, -1.863867, 1, 1, 1, 1, 1,
-0.3910767, 0.1305797, -2.758286, 1, 1, 1, 1, 1,
-0.3887993, -2.29611, -2.378304, 1, 1, 1, 1, 1,
-0.3884448, 0.9928918, -1.278387, 1, 1, 1, 1, 1,
-0.3802836, -1.808049, -3.169508, 1, 1, 1, 1, 1,
-0.3791823, 0.9020406, -0.1970572, 1, 1, 1, 1, 1,
-0.3772899, 0.3339867, -0.5539868, 1, 1, 1, 1, 1,
-0.3770369, -2.029614, -2.630308, 0, 0, 1, 1, 1,
-0.3766298, -1.730102, -2.219204, 1, 0, 0, 1, 1,
-0.3744004, -0.8727601, -2.329298, 1, 0, 0, 1, 1,
-0.3716792, -0.2247919, -1.703723, 1, 0, 0, 1, 1,
-0.3700504, -0.4093779, -2.353503, 1, 0, 0, 1, 1,
-0.3684029, -1.507099, -1.032062, 1, 0, 0, 1, 1,
-0.3658886, 1.21135, -0.3384677, 0, 0, 0, 1, 1,
-0.3643775, -0.3109908, -2.252806, 0, 0, 0, 1, 1,
-0.3616659, 0.3302917, 0.1106736, 0, 0, 0, 1, 1,
-0.3604176, 0.1083802, -0.8336441, 0, 0, 0, 1, 1,
-0.3543574, 0.5147036, 1.91463, 0, 0, 0, 1, 1,
-0.352797, 0.96827, 1.154727, 0, 0, 0, 1, 1,
-0.3493625, -0.7797408, -4.427635, 0, 0, 0, 1, 1,
-0.3466748, 0.60949, -1.4173, 1, 1, 1, 1, 1,
-0.3429816, -1.393303, -1.088262, 1, 1, 1, 1, 1,
-0.3425117, -0.5713097, -1.814844, 1, 1, 1, 1, 1,
-0.3373116, -0.8613057, -2.939427, 1, 1, 1, 1, 1,
-0.3368242, 0.5028939, 0.2688738, 1, 1, 1, 1, 1,
-0.334851, -1.586425, -2.748623, 1, 1, 1, 1, 1,
-0.3343625, -1.496025, -1.673757, 1, 1, 1, 1, 1,
-0.3329097, -0.6005699, -2.803666, 1, 1, 1, 1, 1,
-0.3313299, 0.8415906, 0.09399045, 1, 1, 1, 1, 1,
-0.3313227, 1.550505, -0.623022, 1, 1, 1, 1, 1,
-0.3308555, -0.7061374, -2.391422, 1, 1, 1, 1, 1,
-0.3300666, -1.98517, -3.090644, 1, 1, 1, 1, 1,
-0.3272111, -0.113317, -0.9468438, 1, 1, 1, 1, 1,
-0.3271789, 0.8416578, 2.03505, 1, 1, 1, 1, 1,
-0.3249807, -0.7452877, -2.349067, 1, 1, 1, 1, 1,
-0.3217193, -1.035598, -2.460196, 0, 0, 1, 1, 1,
-0.3188454, 0.9904094, -0.06619905, 1, 0, 0, 1, 1,
-0.3187622, -2.567123e-05, -3.073213, 1, 0, 0, 1, 1,
-0.3187458, -0.4169492, -2.009465, 1, 0, 0, 1, 1,
-0.3152862, 0.2895522, -1.300348, 1, 0, 0, 1, 1,
-0.311381, 0.7614483, -0.8506351, 1, 0, 0, 1, 1,
-0.3032551, -0.9025213, -2.504953, 0, 0, 0, 1, 1,
-0.301224, 0.2376757, -0.6277838, 0, 0, 0, 1, 1,
-0.2991989, -0.5660901, -2.022396, 0, 0, 0, 1, 1,
-0.2941935, 1.522106, -1.048002, 0, 0, 0, 1, 1,
-0.2922964, 1.089718, 0.4285691, 0, 0, 0, 1, 1,
-0.2887728, -0.2901946, -2.547397, 0, 0, 0, 1, 1,
-0.2878778, -1.328582, -2.623101, 0, 0, 0, 1, 1,
-0.2865638, 0.6097229, -1.033419, 1, 1, 1, 1, 1,
-0.2811179, 1.360955, -0.9693038, 1, 1, 1, 1, 1,
-0.2728478, 1.280566, 0.5118313, 1, 1, 1, 1, 1,
-0.2665823, 1.073235, -2.243328, 1, 1, 1, 1, 1,
-0.2650355, 1.360587, 2.143127, 1, 1, 1, 1, 1,
-0.2602573, 0.757561, -0.5417693, 1, 1, 1, 1, 1,
-0.2591911, -1.351837, -3.659492, 1, 1, 1, 1, 1,
-0.2575113, 0.8992153, -1.060766, 1, 1, 1, 1, 1,
-0.2543082, -1.332303, -3.445454, 1, 1, 1, 1, 1,
-0.2509132, 0.432824, -1.028619, 1, 1, 1, 1, 1,
-0.2496999, 0.2253442, -0.8883879, 1, 1, 1, 1, 1,
-0.2491185, -0.6104824, -2.907141, 1, 1, 1, 1, 1,
-0.2443609, -1.821734, -2.084396, 1, 1, 1, 1, 1,
-0.2441823, 1.779475, 3.088841, 1, 1, 1, 1, 1,
-0.2385929, 1.235445, 1.386589, 1, 1, 1, 1, 1,
-0.2378097, -0.5821767, -3.790945, 0, 0, 1, 1, 1,
-0.2353785, 0.4287814, -1.22499, 1, 0, 0, 1, 1,
-0.2353321, 0.07073159, -2.156131, 1, 0, 0, 1, 1,
-0.2339941, -0.9558884, -2.719861, 1, 0, 0, 1, 1,
-0.2308382, -0.2377097, -1.704883, 1, 0, 0, 1, 1,
-0.2306151, -0.2841043, -3.068992, 1, 0, 0, 1, 1,
-0.2298609, 1.240795, -1.551142, 0, 0, 0, 1, 1,
-0.2263929, 0.2545432, -0.886394, 0, 0, 0, 1, 1,
-0.2263193, -1.130292, -2.912035, 0, 0, 0, 1, 1,
-0.2224677, 0.8358644, -0.7734845, 0, 0, 0, 1, 1,
-0.2173481, 0.5816962, 0.5081925, 0, 0, 0, 1, 1,
-0.2158956, 0.2631667, -1.043107, 0, 0, 0, 1, 1,
-0.2156592, -1.141577, -4.153981, 0, 0, 0, 1, 1,
-0.2110796, 0.2554074, -1.516675, 1, 1, 1, 1, 1,
-0.2049883, 0.456123, -0.07565335, 1, 1, 1, 1, 1,
-0.2027524, 0.7327779, 0.01207825, 1, 1, 1, 1, 1,
-0.1985813, -1.896755, -3.198773, 1, 1, 1, 1, 1,
-0.1974722, -0.1799529, -1.449819, 1, 1, 1, 1, 1,
-0.196658, 1.206664, -0.6898538, 1, 1, 1, 1, 1,
-0.1922557, -0.4754837, -1.904864, 1, 1, 1, 1, 1,
-0.1921207, -0.4091773, -2.199042, 1, 1, 1, 1, 1,
-0.1883487, 0.03361562, -3.170662, 1, 1, 1, 1, 1,
-0.1870098, 0.6455618, -0.07070719, 1, 1, 1, 1, 1,
-0.1861327, -0.7677082, -3.870525, 1, 1, 1, 1, 1,
-0.1839572, 0.0421954, -1.740178, 1, 1, 1, 1, 1,
-0.1802647, 0.1606876, 0.2434709, 1, 1, 1, 1, 1,
-0.1767563, 0.7222345, -1.786843, 1, 1, 1, 1, 1,
-0.1740678, 0.4272231, -0.8986546, 1, 1, 1, 1, 1,
-0.1731104, 1.717368, 0.4092965, 0, 0, 1, 1, 1,
-0.1727713, 0.802183, 1.475713, 1, 0, 0, 1, 1,
-0.1716199, 0.2954459, -0.3154479, 1, 0, 0, 1, 1,
-0.1673032, -0.1925174, -3.132773, 1, 0, 0, 1, 1,
-0.166734, 0.1298439, -0.7979443, 1, 0, 0, 1, 1,
-0.1651431, -0.1883115, -1.835428, 1, 0, 0, 1, 1,
-0.1648757, 0.6453881, -0.4360584, 0, 0, 0, 1, 1,
-0.1643299, 0.3146582, -0.2971854, 0, 0, 0, 1, 1,
-0.1622909, 0.55407, 1.836596, 0, 0, 0, 1, 1,
-0.1612558, -2.109469, -3.144711, 0, 0, 0, 1, 1,
-0.1583192, -0.3110968, -3.419894, 0, 0, 0, 1, 1,
-0.1554501, 0.6905494, -1.106824, 0, 0, 0, 1, 1,
-0.1542435, -1.847841, -3.010401, 0, 0, 0, 1, 1,
-0.148437, -0.6810732, -1.130145, 1, 1, 1, 1, 1,
-0.1458394, -1.479749, -2.327623, 1, 1, 1, 1, 1,
-0.1376425, -0.2077605, -1.808504, 1, 1, 1, 1, 1,
-0.1354965, -2.124016, -3.238709, 1, 1, 1, 1, 1,
-0.1344741, 0.940977, 1.230687, 1, 1, 1, 1, 1,
-0.1328143, -1.321049, -3.043683, 1, 1, 1, 1, 1,
-0.1325797, 0.009617821, -1.580214, 1, 1, 1, 1, 1,
-0.130381, -0.2516072, -1.487065, 1, 1, 1, 1, 1,
-0.1273983, 1.600132, 0.2155497, 1, 1, 1, 1, 1,
-0.1253642, -0.3407119, -3.636902, 1, 1, 1, 1, 1,
-0.1204799, 0.9445432, 0.03197446, 1, 1, 1, 1, 1,
-0.1160034, -0.8357887, -2.953461, 1, 1, 1, 1, 1,
-0.1148437, 1.007327, -0.1629924, 1, 1, 1, 1, 1,
-0.113586, 0.8857027, -0.2300236, 1, 1, 1, 1, 1,
-0.1128007, 0.8358756, -0.1557212, 1, 1, 1, 1, 1,
-0.1109911, 0.8396823, -0.02369237, 0, 0, 1, 1, 1,
-0.1068299, 0.9750757, -0.4092619, 1, 0, 0, 1, 1,
-0.106795, 0.8321574, 0.3146109, 1, 0, 0, 1, 1,
-0.09921653, -0.6732267, -3.327029, 1, 0, 0, 1, 1,
-0.08801465, 1.369159, 0.3157428, 1, 0, 0, 1, 1,
-0.08336839, 0.1364127, -0.05689505, 1, 0, 0, 1, 1,
-0.08144659, -1.082544, -3.568316, 0, 0, 0, 1, 1,
-0.08083777, 0.4757299, 0.5379171, 0, 0, 0, 1, 1,
-0.0736155, 0.3710009, -2.031014, 0, 0, 0, 1, 1,
-0.07072889, -1.324583, -5.400546, 0, 0, 0, 1, 1,
-0.07020838, 0.762504, 0.3720238, 0, 0, 0, 1, 1,
-0.06917466, 0.2230799, -1.737181, 0, 0, 0, 1, 1,
-0.06735061, 0.6631719, 1.06764, 0, 0, 0, 1, 1,
-0.06547787, -0.1959132, -3.227397, 1, 1, 1, 1, 1,
-0.05486684, 0.4018556, -2.499207, 1, 1, 1, 1, 1,
-0.05435463, -1.186167, -3.997579, 1, 1, 1, 1, 1,
-0.05157323, -0.447304, -2.833182, 1, 1, 1, 1, 1,
-0.05130726, 0.09915879, -1.062778, 1, 1, 1, 1, 1,
-0.05047381, 0.1679953, -1.226288, 1, 1, 1, 1, 1,
-0.04939882, 2.291331, 0.859682, 1, 1, 1, 1, 1,
-0.04905521, -0.4303514, -2.362664, 1, 1, 1, 1, 1,
-0.04498592, 0.08104926, -0.06423036, 1, 1, 1, 1, 1,
-0.04435125, 0.8217316, -0.7807833, 1, 1, 1, 1, 1,
-0.03984895, -0.3190823, -2.435324, 1, 1, 1, 1, 1,
-0.03690011, -1.912108, 0.09759305, 1, 1, 1, 1, 1,
-0.03553338, -1.601267, -1.305251, 1, 1, 1, 1, 1,
-0.0338679, -0.5143526, -3.245373, 1, 1, 1, 1, 1,
-0.03115666, 0.05335398, -3.038308, 1, 1, 1, 1, 1,
-0.02966476, -1.532997, -4.333394, 0, 0, 1, 1, 1,
-0.02762994, -0.9752127, -1.844605, 1, 0, 0, 1, 1,
-0.02567036, 1.285703, -0.9299902, 1, 0, 0, 1, 1,
-0.02022247, -1.321151, -3.922058, 1, 0, 0, 1, 1,
-0.02016782, 0.8238465, -0.4041087, 1, 0, 0, 1, 1,
-0.0173962, 1.351104, 0.1314838, 1, 0, 0, 1, 1,
-0.009860022, -0.3423312, -5.976207, 0, 0, 0, 1, 1,
-0.004625543, 0.8476347, 0.2009014, 0, 0, 0, 1, 1,
-0.003667928, -0.6522951, -0.9873412, 0, 0, 0, 1, 1,
-0.002462493, 1.043183, 1.430897, 0, 0, 0, 1, 1,
-0.001858764, -0.8605955, -2.953237, 0, 0, 0, 1, 1,
-0.0008679255, 0.9129573, -0.4256683, 0, 0, 0, 1, 1,
0.01295718, -0.3901415, 1.953787, 0, 0, 0, 1, 1,
0.01424334, -0.1038635, 2.845805, 1, 1, 1, 1, 1,
0.01554908, 1.330791, 0.6067201, 1, 1, 1, 1, 1,
0.01653758, -1.037056, 1.489961, 1, 1, 1, 1, 1,
0.0199582, -0.372103, 2.053607, 1, 1, 1, 1, 1,
0.02286312, -0.5726493, 2.900503, 1, 1, 1, 1, 1,
0.02620854, -0.1768209, 2.74479, 1, 1, 1, 1, 1,
0.03176704, 1.44426, 0.3284424, 1, 1, 1, 1, 1,
0.0341657, 1.314363, -0.4727157, 1, 1, 1, 1, 1,
0.0360487, -0.7587532, 2.613312, 1, 1, 1, 1, 1,
0.03910645, 0.5189916, 0.662861, 1, 1, 1, 1, 1,
0.03925806, -0.5984435, 1.981509, 1, 1, 1, 1, 1,
0.0393674, 0.9836112, 0.7301427, 1, 1, 1, 1, 1,
0.04107149, 0.5749357, -0.126165, 1, 1, 1, 1, 1,
0.04222289, -2.296365, 4.703605, 1, 1, 1, 1, 1,
0.04660518, -0.06959683, 4.422445, 1, 1, 1, 1, 1,
0.05023859, -0.1570124, 3.623689, 0, 0, 1, 1, 1,
0.05037015, -1.38674, 3.47487, 1, 0, 0, 1, 1,
0.05284817, 0.1010039, 2.05587, 1, 0, 0, 1, 1,
0.0547286, 1.278371, -0.8248193, 1, 0, 0, 1, 1,
0.05489869, 0.1709717, -0.03208755, 1, 0, 0, 1, 1,
0.06208855, 0.7608003, -1.063761, 1, 0, 0, 1, 1,
0.06239726, -0.781039, 3.271588, 0, 0, 0, 1, 1,
0.06693439, 0.07387823, 2.595298, 0, 0, 0, 1, 1,
0.07055253, -0.4872917, 3.61695, 0, 0, 0, 1, 1,
0.07093037, -1.592433, 4.389874, 0, 0, 0, 1, 1,
0.0735139, -0.07232824, 2.824215, 0, 0, 0, 1, 1,
0.07366826, 0.276748, -0.3643163, 0, 0, 0, 1, 1,
0.07628173, -0.1292484, 0.9492418, 0, 0, 0, 1, 1,
0.0811175, -0.8202524, 1.82107, 1, 1, 1, 1, 1,
0.08262261, 0.7973022, 1.066901, 1, 1, 1, 1, 1,
0.0829289, 0.1403715, 1.211194, 1, 1, 1, 1, 1,
0.08534104, -0.05269443, 3.108561, 1, 1, 1, 1, 1,
0.08604527, -1.020543, 1.560018, 1, 1, 1, 1, 1,
0.08719983, -0.3088545, 2.738668, 1, 1, 1, 1, 1,
0.09078897, -1.322644, 4.842857, 1, 1, 1, 1, 1,
0.09189832, 0.533233, 1.294667, 1, 1, 1, 1, 1,
0.0923715, 1.032246, -0.134056, 1, 1, 1, 1, 1,
0.0940277, 1.365257, -0.5516092, 1, 1, 1, 1, 1,
0.09813787, 0.7648776, -0.6578259, 1, 1, 1, 1, 1,
0.098708, 0.7828573, -0.5131648, 1, 1, 1, 1, 1,
0.09950166, -0.2258648, 2.651912, 1, 1, 1, 1, 1,
0.1014241, 0.1951902, -0.03355305, 1, 1, 1, 1, 1,
0.1020731, 0.1294634, 0.9924992, 1, 1, 1, 1, 1,
0.1038231, 0.86224, 0.1892271, 0, 0, 1, 1, 1,
0.113545, -0.2040473, 3.606196, 1, 0, 0, 1, 1,
0.1136949, -0.1977003, 2.065238, 1, 0, 0, 1, 1,
0.1152634, -0.5052471, 2.408309, 1, 0, 0, 1, 1,
0.1248353, -0.8789885, 1.474777, 1, 0, 0, 1, 1,
0.1275451, -1.580599, 2.343533, 1, 0, 0, 1, 1,
0.1291155, -1.013505, 1.521486, 0, 0, 0, 1, 1,
0.130618, 0.505001, 1.160798, 0, 0, 0, 1, 1,
0.1322164, 1.841443, 1.963069, 0, 0, 0, 1, 1,
0.1333983, 1.280862, 0.5768604, 0, 0, 0, 1, 1,
0.1354998, 0.9378699, -0.4342736, 0, 0, 0, 1, 1,
0.1378472, 0.4797781, 0.4167056, 0, 0, 0, 1, 1,
0.1380207, 0.4050418, 1.077284, 0, 0, 0, 1, 1,
0.140602, 1.687992, -0.2154682, 1, 1, 1, 1, 1,
0.1515725, -0.02179444, 2.054861, 1, 1, 1, 1, 1,
0.1555969, 0.1089183, 0.2742397, 1, 1, 1, 1, 1,
0.1558566, -0.4049366, 3.762509, 1, 1, 1, 1, 1,
0.1576535, 1.29592, 0.1451528, 1, 1, 1, 1, 1,
0.1587789, -0.8024989, 4.238071, 1, 1, 1, 1, 1,
0.1605846, 0.2552098, 2.241623, 1, 1, 1, 1, 1,
0.1629005, 1.770156, 0.132539, 1, 1, 1, 1, 1,
0.1654572, 0.9375363, 0.5874041, 1, 1, 1, 1, 1,
0.1666818, 1.365848, 0.09578938, 1, 1, 1, 1, 1,
0.1673062, 0.780337, 0.8211733, 1, 1, 1, 1, 1,
0.1692901, -1.710464, 1.842812, 1, 1, 1, 1, 1,
0.1706019, -0.8844386, 4.86674, 1, 1, 1, 1, 1,
0.172165, 0.6135138, 0.6218781, 1, 1, 1, 1, 1,
0.1753318, -0.1950505, 1.339013, 1, 1, 1, 1, 1,
0.1755291, 1.01705, 1.073425, 0, 0, 1, 1, 1,
0.1757809, 0.5351152, 0.7917213, 1, 0, 0, 1, 1,
0.1770392, 0.7554858, -0.1189964, 1, 0, 0, 1, 1,
0.178433, -0.7162496, 4.662858, 1, 0, 0, 1, 1,
0.1789276, 0.6026684, 0.06914531, 1, 0, 0, 1, 1,
0.1859546, 0.3590403, -0.09862264, 1, 0, 0, 1, 1,
0.1864779, -0.3613594, 1.410754, 0, 0, 0, 1, 1,
0.1882138, 2.980815, 1.824797, 0, 0, 0, 1, 1,
0.1888316, 0.03178775, 1.405471, 0, 0, 0, 1, 1,
0.1928034, 1.714027, 1.301831, 0, 0, 0, 1, 1,
0.1972986, -0.2604328, 1.352983, 0, 0, 0, 1, 1,
0.1985502, 0.9318762, 0.2103457, 0, 0, 0, 1, 1,
0.2037204, 1.675479, -0.2269114, 0, 0, 0, 1, 1,
0.2040516, -0.4858356, 3.782451, 1, 1, 1, 1, 1,
0.2101135, 0.8226912, -1.129272, 1, 1, 1, 1, 1,
0.2119852, -0.729892, 1.4439, 1, 1, 1, 1, 1,
0.2133409, 0.4053022, -0.09265927, 1, 1, 1, 1, 1,
0.2142906, 1.08785, 0.5317639, 1, 1, 1, 1, 1,
0.2158553, 0.2757889, 0.4696838, 1, 1, 1, 1, 1,
0.2198157, 0.06774852, 1.182234, 1, 1, 1, 1, 1,
0.2222163, 0.3438014, 0.4243715, 1, 1, 1, 1, 1,
0.2243575, 0.5337114, 0.4801351, 1, 1, 1, 1, 1,
0.2260737, -0.6197699, 3.944678, 1, 1, 1, 1, 1,
0.2271281, -1.815265, 1.743274, 1, 1, 1, 1, 1,
0.22848, -0.6732345, 3.150925, 1, 1, 1, 1, 1,
0.2339928, 0.6602218, 0.2427547, 1, 1, 1, 1, 1,
0.2369404, 0.290685, 0.4979181, 1, 1, 1, 1, 1,
0.2374961, 0.8594886, 0.1161955, 1, 1, 1, 1, 1,
0.2400165, -0.9529017, 2.702132, 0, 0, 1, 1, 1,
0.2442891, 0.3798057, 1.414717, 1, 0, 0, 1, 1,
0.2458738, 1.639785, -0.4141474, 1, 0, 0, 1, 1,
0.2464962, 0.5975256, 0.00446497, 1, 0, 0, 1, 1,
0.2556114, 1.466343, -0.0142394, 1, 0, 0, 1, 1,
0.2583195, -0.5659373, 1.879246, 1, 0, 0, 1, 1,
0.2589413, -1.136007, 2.870754, 0, 0, 0, 1, 1,
0.2595811, 0.6025847, 1.248527, 0, 0, 0, 1, 1,
0.2625504, 0.4362546, 0.835202, 0, 0, 0, 1, 1,
0.2645068, -0.6951683, 3.969604, 0, 0, 0, 1, 1,
0.2651045, -0.7039573, 4.44333, 0, 0, 0, 1, 1,
0.2655235, 0.2961223, 2.20801, 0, 0, 0, 1, 1,
0.2699994, -0.06844602, 2.142589, 0, 0, 0, 1, 1,
0.2701133, -1.214201, 2.620797, 1, 1, 1, 1, 1,
0.2712497, 0.160778, 0.662107, 1, 1, 1, 1, 1,
0.2719532, 0.2058498, 0.8235583, 1, 1, 1, 1, 1,
0.2719905, -1.758318, 1.078123, 1, 1, 1, 1, 1,
0.2770466, -1.948233, 3.080443, 1, 1, 1, 1, 1,
0.2812901, 0.01787086, 1.853384, 1, 1, 1, 1, 1,
0.2889174, 0.2024917, 1.998062, 1, 1, 1, 1, 1,
0.2890458, -0.8695459, 2.617604, 1, 1, 1, 1, 1,
0.2894697, 0.5191405, 1.761539, 1, 1, 1, 1, 1,
0.2923174, 0.7495855, -0.2196745, 1, 1, 1, 1, 1,
0.2927131, -0.6129118, 1.593907, 1, 1, 1, 1, 1,
0.29549, -0.4517485, 1.466862, 1, 1, 1, 1, 1,
0.2983604, 0.2496592, 0.2917171, 1, 1, 1, 1, 1,
0.3115024, 0.2024073, 0.410845, 1, 1, 1, 1, 1,
0.3116501, 0.1733793, 0.03573984, 1, 1, 1, 1, 1,
0.3133955, 0.191641, 1.720682, 0, 0, 1, 1, 1,
0.3147874, 2.256306, 0.2854366, 1, 0, 0, 1, 1,
0.3191254, 0.1478638, 0.4969979, 1, 0, 0, 1, 1,
0.320127, -1.82386, 3.345879, 1, 0, 0, 1, 1,
0.3202787, 0.05411327, 2.255551, 1, 0, 0, 1, 1,
0.3254942, -0.3178203, 1.510207, 1, 0, 0, 1, 1,
0.3271067, -2.23461, 4.283861, 0, 0, 0, 1, 1,
0.329745, -0.8087823, 1.573477, 0, 0, 0, 1, 1,
0.3298042, -0.6327875, 3.329489, 0, 0, 0, 1, 1,
0.3380606, -0.1288138, 2.093188, 0, 0, 0, 1, 1,
0.3384963, 0.1172578, 1.107584, 0, 0, 0, 1, 1,
0.3417006, 0.9629529, 0.820723, 0, 0, 0, 1, 1,
0.3438185, -0.1063033, 2.480222, 0, 0, 0, 1, 1,
0.3440567, -0.6998621, 3.758765, 1, 1, 1, 1, 1,
0.3456073, 0.3735251, 1.133506, 1, 1, 1, 1, 1,
0.3484342, -0.4480214, 1.289914, 1, 1, 1, 1, 1,
0.3561833, 0.527491, 1.581298, 1, 1, 1, 1, 1,
0.3564719, -0.346151, 2.242962, 1, 1, 1, 1, 1,
0.3579469, -0.009085192, 1.449604, 1, 1, 1, 1, 1,
0.3589107, -0.002775132, 1.789957, 1, 1, 1, 1, 1,
0.3596348, 0.6305369, 0.294078, 1, 1, 1, 1, 1,
0.3658084, -1.05637, 3.529328, 1, 1, 1, 1, 1,
0.368409, 0.1657111, 1.955814, 1, 1, 1, 1, 1,
0.3721422, 1.852111, -1.987189, 1, 1, 1, 1, 1,
0.3733961, -0.8274794, 3.863266, 1, 1, 1, 1, 1,
0.37415, -0.3826177, 3.163006, 1, 1, 1, 1, 1,
0.3800808, 1.136621, -0.75644, 1, 1, 1, 1, 1,
0.3823398, -0.3822212, 2.40325, 1, 1, 1, 1, 1,
0.3825697, -0.05416417, 2.153427, 0, 0, 1, 1, 1,
0.3858465, 0.02514716, 3.120962, 1, 0, 0, 1, 1,
0.3887202, 1.225739, 1.148391, 1, 0, 0, 1, 1,
0.3947271, -0.1060619, 1.101124, 1, 0, 0, 1, 1,
0.3963552, 1.11067, -0.2493888, 1, 0, 0, 1, 1,
0.3967645, -0.3163061, 1.276393, 1, 0, 0, 1, 1,
0.4006378, 0.2699431, 3.37801, 0, 0, 0, 1, 1,
0.4050458, -0.2803262, 1.830405, 0, 0, 0, 1, 1,
0.4056692, -1.143133, 3.05623, 0, 0, 0, 1, 1,
0.4066944, 0.02750617, 2.402009, 0, 0, 0, 1, 1,
0.4078824, 0.8092077, 0.1235306, 0, 0, 0, 1, 1,
0.4110848, 2.895037, 0.2323373, 0, 0, 0, 1, 1,
0.4157874, 0.1195713, 0.6761754, 0, 0, 0, 1, 1,
0.4173832, 0.3083211, 2.165992, 1, 1, 1, 1, 1,
0.423998, -0.3037856, 1.012151, 1, 1, 1, 1, 1,
0.425711, -1.416367, 1.90905, 1, 1, 1, 1, 1,
0.4265586, -0.4215105, 2.481791, 1, 1, 1, 1, 1,
0.4283405, 0.5787661, 0.5473777, 1, 1, 1, 1, 1,
0.4288704, 0.6159993, -0.09780432, 1, 1, 1, 1, 1,
0.4305369, -1.306771, 3.073096, 1, 1, 1, 1, 1,
0.4361165, -0.2413982, 4.39218, 1, 1, 1, 1, 1,
0.4363145, 0.8445694, 1.328429, 1, 1, 1, 1, 1,
0.4394449, 0.5997328, 0.4572329, 1, 1, 1, 1, 1,
0.4441519, 0.9426994, 1.231695, 1, 1, 1, 1, 1,
0.4446098, 1.20806, -0.01519995, 1, 1, 1, 1, 1,
0.4474918, 1.196775, -0.8936886, 1, 1, 1, 1, 1,
0.4498972, 0.03204916, 1.761638, 1, 1, 1, 1, 1,
0.4568424, -0.6117065, 3.544096, 1, 1, 1, 1, 1,
0.464434, 0.8177366, 1.926071, 0, 0, 1, 1, 1,
0.4645058, -0.6333735, 4.548364, 1, 0, 0, 1, 1,
0.4667924, -0.09941707, 2.797644, 1, 0, 0, 1, 1,
0.4672821, 0.5114303, 1.371465, 1, 0, 0, 1, 1,
0.475397, 1.34757, -0.9069946, 1, 0, 0, 1, 1,
0.4781867, -0.2019945, 3.218594, 1, 0, 0, 1, 1,
0.4799383, -2.047065, 3.591739, 0, 0, 0, 1, 1,
0.4813457, 0.06464613, 0.4392364, 0, 0, 0, 1, 1,
0.4830939, 0.01741096, 0.7235957, 0, 0, 0, 1, 1,
0.4840336, 1.56142, 0.5718693, 0, 0, 0, 1, 1,
0.484582, 0.8810543, 1.096714, 0, 0, 0, 1, 1,
0.4858582, -0.4059319, 2.667213, 0, 0, 0, 1, 1,
0.4896972, 0.1525005, 1.825411, 0, 0, 0, 1, 1,
0.4930988, 0.180577, -0.1787674, 1, 1, 1, 1, 1,
0.4956478, -0.07336728, 0.76274, 1, 1, 1, 1, 1,
0.4980671, 0.7465202, 0.2498702, 1, 1, 1, 1, 1,
0.4993852, -0.08510277, -0.4080503, 1, 1, 1, 1, 1,
0.5010535, -1.002687, 2.757352, 1, 1, 1, 1, 1,
0.5015246, -0.4376588, -0.2496691, 1, 1, 1, 1, 1,
0.5020781, 1.05682, 0.07141775, 1, 1, 1, 1, 1,
0.5035827, -0.4249246, 3.739899, 1, 1, 1, 1, 1,
0.5039099, 0.4470064, 1.066351, 1, 1, 1, 1, 1,
0.5094328, -1.58626, 2.052484, 1, 1, 1, 1, 1,
0.5121437, 0.3616911, 0.5091538, 1, 1, 1, 1, 1,
0.521922, 0.7743587, 1.625746, 1, 1, 1, 1, 1,
0.5223363, -1.998133, 3.600778, 1, 1, 1, 1, 1,
0.524335, 0.04534683, 2.936016, 1, 1, 1, 1, 1,
0.5267702, 0.663645, 0.4551767, 1, 1, 1, 1, 1,
0.5299958, -1.267076, 3.769975, 0, 0, 1, 1, 1,
0.5307899, -0.9037961, 3.765482, 1, 0, 0, 1, 1,
0.5391743, -0.1213748, 3.288975, 1, 0, 0, 1, 1,
0.5398455, 0.1540865, 3.17607, 1, 0, 0, 1, 1,
0.54297, 0.6694037, 1.215402, 1, 0, 0, 1, 1,
0.5438611, 0.7286898, 0.3716819, 1, 0, 0, 1, 1,
0.5472732, -0.8251599, 1.460373, 0, 0, 0, 1, 1,
0.5490173, -0.7133515, 2.784064, 0, 0, 0, 1, 1,
0.5570432, 0.4021988, -0.5282004, 0, 0, 0, 1, 1,
0.5609279, -0.3484604, 3.101275, 0, 0, 0, 1, 1,
0.561082, -0.3117028, 1.405352, 0, 0, 0, 1, 1,
0.5611454, 0.6263331, 0.6423705, 0, 0, 0, 1, 1,
0.5663948, 0.616338, 0.3025655, 0, 0, 0, 1, 1,
0.5753497, 0.8392671, 1.827568, 1, 1, 1, 1, 1,
0.5788398, 0.0512832, 2.442845, 1, 1, 1, 1, 1,
0.5820123, 0.7694879, -1.520587, 1, 1, 1, 1, 1,
0.5851623, 1.48854, 1.003608, 1, 1, 1, 1, 1,
0.5879335, -0.2877709, 0.4118911, 1, 1, 1, 1, 1,
0.5904866, 0.7153174, 1.007266, 1, 1, 1, 1, 1,
0.5922671, 0.2399107, 0.64145, 1, 1, 1, 1, 1,
0.5927494, -0.9262189, 1.764521, 1, 1, 1, 1, 1,
0.5937181, -0.9247177, 3.803639, 1, 1, 1, 1, 1,
0.5937542, 0.1654624, 1.792471, 1, 1, 1, 1, 1,
0.5981693, 1.169953, 2.426406, 1, 1, 1, 1, 1,
0.6022037, -1.542825, 4.278081, 1, 1, 1, 1, 1,
0.6033304, -0.001639796, 2.312567, 1, 1, 1, 1, 1,
0.6053357, 0.3277993, 0.961845, 1, 1, 1, 1, 1,
0.6122369, 1.110839, 0.6953877, 1, 1, 1, 1, 1,
0.6172121, 0.501721, 0.5842484, 0, 0, 1, 1, 1,
0.6245641, 0.07371762, 0.7358054, 1, 0, 0, 1, 1,
0.6273528, -0.8248119, 1.809994, 1, 0, 0, 1, 1,
0.6288111, 1.023833, -1.299756, 1, 0, 0, 1, 1,
0.6301945, -0.9087566, 2.622233, 1, 0, 0, 1, 1,
0.6345696, -0.3392985, 3.248675, 1, 0, 0, 1, 1,
0.6456555, 0.4017987, -0.2587392, 0, 0, 0, 1, 1,
0.6469032, 1.337379, 0.7791315, 0, 0, 0, 1, 1,
0.6500357, -0.8383564, 2.431864, 0, 0, 0, 1, 1,
0.6510891, -1.04195, 2.383251, 0, 0, 0, 1, 1,
0.6566955, 0.02792565, 3.03452, 0, 0, 0, 1, 1,
0.6629125, -1.71983, 2.652763, 0, 0, 0, 1, 1,
0.66619, 0.8830913, -0.06185247, 0, 0, 0, 1, 1,
0.667047, 0.03595139, 1.417138, 1, 1, 1, 1, 1,
0.6679137, -0.9347583, 2.980963, 1, 1, 1, 1, 1,
0.671977, 0.9223012, 2.06881, 1, 1, 1, 1, 1,
0.674058, -0.8683565, 3.60241, 1, 1, 1, 1, 1,
0.6752056, 0.4227497, 0.3894194, 1, 1, 1, 1, 1,
0.6754072, -1.516634, 2.03455, 1, 1, 1, 1, 1,
0.6761566, 0.365044, 0.2075258, 1, 1, 1, 1, 1,
0.6805878, -0.6177379, 1.023328, 1, 1, 1, 1, 1,
0.6822804, -0.9282598, 2.274123, 1, 1, 1, 1, 1,
0.68388, 0.7498413, 0.8832173, 1, 1, 1, 1, 1,
0.6895998, -0.8665482, 2.746176, 1, 1, 1, 1, 1,
0.6911325, 0.1306478, 0.9526523, 1, 1, 1, 1, 1,
0.6912267, -0.1662497, 1.344886, 1, 1, 1, 1, 1,
0.6928971, 1.203636, 0.3659882, 1, 1, 1, 1, 1,
0.6957132, 1.511834, 0.8576996, 1, 1, 1, 1, 1,
0.6968501, 0.8259619, 2.582568, 0, 0, 1, 1, 1,
0.6995993, -1.038309, 2.836957, 1, 0, 0, 1, 1,
0.700255, -1.288481, 2.824275, 1, 0, 0, 1, 1,
0.7076015, 0.6266743, 1.473792, 1, 0, 0, 1, 1,
0.7104657, -1.713606, 2.761141, 1, 0, 0, 1, 1,
0.7161111, 0.3297939, 0.8252569, 1, 0, 0, 1, 1,
0.7166437, 1.20304, 0.4099376, 0, 0, 0, 1, 1,
0.719979, -0.1514655, 2.427595, 0, 0, 0, 1, 1,
0.723566, -0.4325619, 2.612948, 0, 0, 0, 1, 1,
0.7235664, -0.8905055, 2.488705, 0, 0, 0, 1, 1,
0.7236749, -1.581268, 2.128256, 0, 0, 0, 1, 1,
0.7262609, 0.06146502, 1.795663, 0, 0, 0, 1, 1,
0.7294198, -0.02733378, 1.836317, 0, 0, 0, 1, 1,
0.7309707, -0.06358897, 2.255777, 1, 1, 1, 1, 1,
0.7322801, -1.756296, 3.690371, 1, 1, 1, 1, 1,
0.7325921, 1.777727, -1.555992, 1, 1, 1, 1, 1,
0.7337006, 0.6830984, 0.774814, 1, 1, 1, 1, 1,
0.7384738, 1.254432, 0.8720788, 1, 1, 1, 1, 1,
0.7421181, 0.5436807, 1.081897, 1, 1, 1, 1, 1,
0.7505245, 1.173119, 0.2243199, 1, 1, 1, 1, 1,
0.7601826, 0.232635, 2.048025, 1, 1, 1, 1, 1,
0.7615585, -1.180161, 1.798356, 1, 1, 1, 1, 1,
0.7618365, 0.3167908, 3.152497, 1, 1, 1, 1, 1,
0.763614, 0.9062709, 0.3063939, 1, 1, 1, 1, 1,
0.7661471, 0.4501934, 3.068464, 1, 1, 1, 1, 1,
0.7684535, -0.4829256, 0.964747, 1, 1, 1, 1, 1,
0.7688781, -0.6444393, 4.749967, 1, 1, 1, 1, 1,
0.7710279, 1.505473, 1.701656, 1, 1, 1, 1, 1,
0.7733709, 1.144525, 0.8578503, 0, 0, 1, 1, 1,
0.7765222, -0.9856153, 3.776608, 1, 0, 0, 1, 1,
0.7775459, -0.1655029, 2.372252, 1, 0, 0, 1, 1,
0.7804048, -0.4950015, 2.611116, 1, 0, 0, 1, 1,
0.7850829, 1.750387, 1.108767, 1, 0, 0, 1, 1,
0.7898771, -0.5928969, 0.6292024, 1, 0, 0, 1, 1,
0.7904547, 1.842373, 0.8000639, 0, 0, 0, 1, 1,
0.7952331, 0.9641483, 3.181308, 0, 0, 0, 1, 1,
0.8007573, 1.292562, 0.2496595, 0, 0, 0, 1, 1,
0.8090906, 1.199642, -0.9575773, 0, 0, 0, 1, 1,
0.8118777, 1.749636, 0.4822882, 0, 0, 0, 1, 1,
0.8122915, 0.4907523, 0.2404612, 0, 0, 0, 1, 1,
0.8173273, -0.5206826, 0.8937844, 0, 0, 0, 1, 1,
0.8242734, -0.5755038, 2.246884, 1, 1, 1, 1, 1,
0.8371229, -0.2117637, 1.002425, 1, 1, 1, 1, 1,
0.8371493, -0.5030625, 2.496537, 1, 1, 1, 1, 1,
0.8397954, 0.6010265, 0.7440562, 1, 1, 1, 1, 1,
0.8443848, 0.216153, 2.312391, 1, 1, 1, 1, 1,
0.8444127, -0.3498466, 3.540356, 1, 1, 1, 1, 1,
0.8455522, 0.547264, 1.838243, 1, 1, 1, 1, 1,
0.8520296, -1.100991, 1.064169, 1, 1, 1, 1, 1,
0.8535811, 1.093435, 3.21616, 1, 1, 1, 1, 1,
0.8538715, 0.8914435, -0.5808476, 1, 1, 1, 1, 1,
0.8598721, 0.691426, 0.3891318, 1, 1, 1, 1, 1,
0.8682181, -1.077024, 2.617196, 1, 1, 1, 1, 1,
0.8775539, -2.382811, 3.333558, 1, 1, 1, 1, 1,
0.8805114, -1.177273, 2.626373, 1, 1, 1, 1, 1,
0.8849364, -1.561508, 2.780058, 1, 1, 1, 1, 1,
0.8852892, 0.9467489, -0.3127759, 0, 0, 1, 1, 1,
0.8939787, 0.3982105, 1.286363, 1, 0, 0, 1, 1,
0.900687, 0.8478635, 0.122698, 1, 0, 0, 1, 1,
0.9037288, 0.4082182, 0.3576557, 1, 0, 0, 1, 1,
0.9052184, 0.2256661, 1.286437, 1, 0, 0, 1, 1,
0.90738, 1.064414, 1.173799, 1, 0, 0, 1, 1,
0.9080386, -1.239256, 1.620447, 0, 0, 0, 1, 1,
0.9115078, -1.436309, 2.610808, 0, 0, 0, 1, 1,
0.9143697, 0.8881737, -0.4288633, 0, 0, 0, 1, 1,
0.916191, -0.4346263, 2.708276, 0, 0, 0, 1, 1,
0.9220088, -0.170222, 1.485101, 0, 0, 0, 1, 1,
0.9245168, 0.3041918, 1.441394, 0, 0, 0, 1, 1,
0.9261711, 0.5789015, -0.0312685, 0, 0, 0, 1, 1,
0.9281026, -0.1677841, 4.323532, 1, 1, 1, 1, 1,
0.9360285, 0.7260759, 0.4168465, 1, 1, 1, 1, 1,
0.9429344, -0.3104753, 1.375661, 1, 1, 1, 1, 1,
0.9455438, 0.2651691, 1.596161, 1, 1, 1, 1, 1,
0.9458131, -1.180162, 2.357648, 1, 1, 1, 1, 1,
0.9500828, 0.458523, 0.1067164, 1, 1, 1, 1, 1,
0.9543331, 2.096387, -0.2580507, 1, 1, 1, 1, 1,
0.9567373, -0.2747137, 1.482469, 1, 1, 1, 1, 1,
0.9588061, -0.5477304, 2.836613, 1, 1, 1, 1, 1,
0.9685754, -2.605393, 3.290425, 1, 1, 1, 1, 1,
0.9702967, -1.227304, 2.924943, 1, 1, 1, 1, 1,
0.9710755, 1.5507, 1.872086, 1, 1, 1, 1, 1,
0.9742332, 0.3644457, 0.01798244, 1, 1, 1, 1, 1,
0.9743074, 0.192677, 1.247563, 1, 1, 1, 1, 1,
0.9846422, -0.1984848, 1.633673, 1, 1, 1, 1, 1,
0.9859102, 0.151694, -0.4437763, 0, 0, 1, 1, 1,
0.9929872, 0.7134515, 0.7539473, 1, 0, 0, 1, 1,
0.9984686, 0.4609716, 0.4043149, 1, 0, 0, 1, 1,
0.9999715, -0.353535, 2.482775, 1, 0, 0, 1, 1,
1.008669, -0.9010313, 2.095995, 1, 0, 0, 1, 1,
1.014507, -0.09780494, 2.270133, 1, 0, 0, 1, 1,
1.018992, -0.2678888, 2.31178, 0, 0, 0, 1, 1,
1.021013, 0.8104058, -1.068677, 0, 0, 0, 1, 1,
1.02364, -1.134448, 2.223953, 0, 0, 0, 1, 1,
1.036269, -1.415692, 1.859118, 0, 0, 0, 1, 1,
1.042328, -1.129982, 1.310414, 0, 0, 0, 1, 1,
1.047718, -0.5690804, 3.107584, 0, 0, 0, 1, 1,
1.061011, 0.5229493, -0.1176383, 0, 0, 0, 1, 1,
1.062879, -1.086684, 3.888732, 1, 1, 1, 1, 1,
1.06514, -0.2215751, 0.3005497, 1, 1, 1, 1, 1,
1.075956, 1.368276, -1.070256, 1, 1, 1, 1, 1,
1.080359, 1.524588, 0.4252381, 1, 1, 1, 1, 1,
1.10408, -2.145715, 2.884923, 1, 1, 1, 1, 1,
1.110156, -0.5026519, 2.088427, 1, 1, 1, 1, 1,
1.113385, 1.249585, 1.122178, 1, 1, 1, 1, 1,
1.116342, -0.7904286, 0.8146363, 1, 1, 1, 1, 1,
1.116371, 0.09526993, 0.4597913, 1, 1, 1, 1, 1,
1.117933, 0.5665771, 2.139446, 1, 1, 1, 1, 1,
1.127843, 0.5599765, 1.948054, 1, 1, 1, 1, 1,
1.131469, 0.180399, 1.828904, 1, 1, 1, 1, 1,
1.167785, -1.892771, 1.554452, 1, 1, 1, 1, 1,
1.168759, 0.6983327, 0.1342753, 1, 1, 1, 1, 1,
1.169483, -0.4950703, 0.7680328, 1, 1, 1, 1, 1,
1.175297, 0.7867315, -0.4034034, 0, 0, 1, 1, 1,
1.176523, 0.7385521, 1.461402, 1, 0, 0, 1, 1,
1.177679, -0.06293548, 0.1779178, 1, 0, 0, 1, 1,
1.180291, -0.4164036, 2.914452, 1, 0, 0, 1, 1,
1.184747, 0.7657647, 1.157297, 1, 0, 0, 1, 1,
1.187546, 2.213127, 0.7452211, 1, 0, 0, 1, 1,
1.2023, -0.3310882, 2.981298, 0, 0, 0, 1, 1,
1.204641, 1.045016, 2.201335, 0, 0, 0, 1, 1,
1.214308, -1.829013, 2.819948, 0, 0, 0, 1, 1,
1.215003, -1.48248, 2.026294, 0, 0, 0, 1, 1,
1.215153, -1.206887, 1.856153, 0, 0, 0, 1, 1,
1.216564, 0.4941031, 1.72962, 0, 0, 0, 1, 1,
1.223697, 0.3073395, 1.577117, 0, 0, 0, 1, 1,
1.225745, 2.235192, -0.588061, 1, 1, 1, 1, 1,
1.228545, 1.230984, -0.4205734, 1, 1, 1, 1, 1,
1.231549, -0.07684401, 1.436682, 1, 1, 1, 1, 1,
1.242109, 1.461725, 0.7019734, 1, 1, 1, 1, 1,
1.246191, 0.7519708, 0.9953921, 1, 1, 1, 1, 1,
1.257209, 1.41771, 2.019209, 1, 1, 1, 1, 1,
1.267176, 0.6288061, 0.935504, 1, 1, 1, 1, 1,
1.28597, 0.3478212, 3.692298, 1, 1, 1, 1, 1,
1.29606, -0.408127, 0.1587071, 1, 1, 1, 1, 1,
1.305364, 0.2891256, 2.576859, 1, 1, 1, 1, 1,
1.310265, -0.9989523, 2.716842, 1, 1, 1, 1, 1,
1.326973, 0.9821271, 0.6839417, 1, 1, 1, 1, 1,
1.330169, 1.085402, 0.403111, 1, 1, 1, 1, 1,
1.331604, 0.9899281, 0.5076973, 1, 1, 1, 1, 1,
1.335049, 0.5589366, 0.7955648, 1, 1, 1, 1, 1,
1.340837, -0.7961426, 2.407612, 0, 0, 1, 1, 1,
1.344662, -0.6222605, 1.955853, 1, 0, 0, 1, 1,
1.355989, -0.6696514, 0.3658257, 1, 0, 0, 1, 1,
1.357882, 2.146788, 2.009734, 1, 0, 0, 1, 1,
1.364435, -1.673573, 1.020492, 1, 0, 0, 1, 1,
1.368367, 0.3117717, 1.310743, 1, 0, 0, 1, 1,
1.374072, 1.429065, -0.5338356, 0, 0, 0, 1, 1,
1.375556, 1.054979, 1.3757, 0, 0, 0, 1, 1,
1.38092, -1.012382, 1.158579, 0, 0, 0, 1, 1,
1.383197, 0.9369452, 2.073305, 0, 0, 0, 1, 1,
1.383937, -0.1422163, 1.479512, 0, 0, 0, 1, 1,
1.384265, 0.3986394, 2.897144, 0, 0, 0, 1, 1,
1.387529, 0.03142337, 2.048841, 0, 0, 0, 1, 1,
1.424629, -1.555334, 2.773099, 1, 1, 1, 1, 1,
1.42472, -0.3610851, 0.08484887, 1, 1, 1, 1, 1,
1.439067, 0.05932849, 1.771071, 1, 1, 1, 1, 1,
1.441859, -0.430679, 2.439751, 1, 1, 1, 1, 1,
1.445352, 1.988428, -0.1958614, 1, 1, 1, 1, 1,
1.446424, 0.9533312, 1.225726, 1, 1, 1, 1, 1,
1.462337, -0.5031437, 1.080151, 1, 1, 1, 1, 1,
1.476109, -2.527417, 2.503544, 1, 1, 1, 1, 1,
1.48914, -0.7881806, 3.431811, 1, 1, 1, 1, 1,
1.499086, -0.2797665, 2.158856, 1, 1, 1, 1, 1,
1.501047, -0.3287742, 1.148097, 1, 1, 1, 1, 1,
1.50529, -0.1574894, 2.331957, 1, 1, 1, 1, 1,
1.509912, -0.6091197, 0.5264789, 1, 1, 1, 1, 1,
1.51045, -1.138589, 3.139116, 1, 1, 1, 1, 1,
1.513668, 0.6651048, 1.15677, 1, 1, 1, 1, 1,
1.517338, -0.5983378, 2.149622, 0, 0, 1, 1, 1,
1.519276, -0.9011571, 1.990172, 1, 0, 0, 1, 1,
1.520069, -0.789226, 2.315728, 1, 0, 0, 1, 1,
1.524951, 0.769725, 0.4912646, 1, 0, 0, 1, 1,
1.526362, 1.014906, 0.908648, 1, 0, 0, 1, 1,
1.527145, 0.4200977, 0.8969108, 1, 0, 0, 1, 1,
1.529513, 0.5402752, 0.5851861, 0, 0, 0, 1, 1,
1.539494, -0.6317255, 1.674326, 0, 0, 0, 1, 1,
1.547832, -0.02979564, 1.843691, 0, 0, 0, 1, 1,
1.551091, -0.7009108, 3.700552, 0, 0, 0, 1, 1,
1.552598, 0.4788608, 1.399684, 0, 0, 0, 1, 1,
1.554869, -0.4530596, 3.040146, 0, 0, 0, 1, 1,
1.571776, -0.5996794, 1.81897, 0, 0, 0, 1, 1,
1.576612, -2.044919, 2.366389, 1, 1, 1, 1, 1,
1.58099, 0.3278789, 2.409007, 1, 1, 1, 1, 1,
1.595127, -0.5259248, 2.929207, 1, 1, 1, 1, 1,
1.603608, -0.601913, 2.029043, 1, 1, 1, 1, 1,
1.610521, 0.06136306, 2.368766, 1, 1, 1, 1, 1,
1.626446, 1.139154, 2.182891, 1, 1, 1, 1, 1,
1.635347, -0.524269, 3.051626, 1, 1, 1, 1, 1,
1.639026, -1.252605, 1.134948, 1, 1, 1, 1, 1,
1.651061, 0.3921786, -1.266034, 1, 1, 1, 1, 1,
1.660453, -0.7674276, 1.528766, 1, 1, 1, 1, 1,
1.662805, -1.398877, 0.1564858, 1, 1, 1, 1, 1,
1.668104, 0.9318875, 0.1572187, 1, 1, 1, 1, 1,
1.681236, -0.08769256, 1.263803, 1, 1, 1, 1, 1,
1.683557, -1.984517, 1.928624, 1, 1, 1, 1, 1,
1.691602, -0.6430795, 2.124572, 1, 1, 1, 1, 1,
1.69618, -1.026202, 0.03867204, 0, 0, 1, 1, 1,
1.700921, 0.4230791, 1.799233, 1, 0, 0, 1, 1,
1.709005, -1.718535, 2.382711, 1, 0, 0, 1, 1,
1.742565, 0.7490206, 2.082774, 1, 0, 0, 1, 1,
1.747929, 0.3617641, 1.482907, 1, 0, 0, 1, 1,
1.760257, -0.0701112, 1.696303, 1, 0, 0, 1, 1,
1.772837, 0.4993027, -0.4167475, 0, 0, 0, 1, 1,
1.782556, 0.5361912, 0.9803113, 0, 0, 0, 1, 1,
1.794173, -1.020708, 3.945899, 0, 0, 0, 1, 1,
1.811687, -1.00893, 2.226596, 0, 0, 0, 1, 1,
1.817846, -0.3390529, 2.448311, 0, 0, 0, 1, 1,
1.826896, 0.3000427, 2.075349, 0, 0, 0, 1, 1,
1.83136, -0.4560987, 1.360016, 0, 0, 0, 1, 1,
1.834169, -0.5267444, 3.752499, 1, 1, 1, 1, 1,
1.835715, -0.35071, 1.311808, 1, 1, 1, 1, 1,
1.845354, 0.5024447, 2.095364, 1, 1, 1, 1, 1,
1.851185, -0.5265827, 0.9271694, 1, 1, 1, 1, 1,
1.861367, -2.581511, 1.346064, 1, 1, 1, 1, 1,
1.869579, 1.230341, 1.880361, 1, 1, 1, 1, 1,
1.88771, 0.5776255, -0.08125886, 1, 1, 1, 1, 1,
1.907468, 1.057949, 0.7550549, 1, 1, 1, 1, 1,
1.911993, 1.525061, 0.8777805, 1, 1, 1, 1, 1,
1.912725, 0.1895307, 1.64768, 1, 1, 1, 1, 1,
1.928535, -1.160719, 1.790515, 1, 1, 1, 1, 1,
1.93715, 0.7988833, 0.08518878, 1, 1, 1, 1, 1,
1.939026, -0.4768753, 0.9846238, 1, 1, 1, 1, 1,
1.952158, -0.4296511, 1.6477, 1, 1, 1, 1, 1,
1.997499, 1.058205, 0.1445573, 1, 1, 1, 1, 1,
2.027289, -0.3484376, 1.190575, 0, 0, 1, 1, 1,
2.031039, 1.882372, -0.5161323, 1, 0, 0, 1, 1,
2.037293, 2.410724, 1.290964, 1, 0, 0, 1, 1,
2.061315, -0.4793592, 1.517506, 1, 0, 0, 1, 1,
2.081889, 1.324834, 0.9345428, 1, 0, 0, 1, 1,
2.149106, -1.198123, 2.438762, 1, 0, 0, 1, 1,
2.174235, -0.1038685, 4.186009, 0, 0, 0, 1, 1,
2.20533, 0.228021, 2.412186, 0, 0, 0, 1, 1,
2.220093, 0.02057899, 0.7042871, 0, 0, 0, 1, 1,
2.250154, 0.2656317, 2.493407, 0, 0, 0, 1, 1,
2.329242, -0.8860136, 1.504844, 0, 0, 0, 1, 1,
2.337574, 0.512412, 1.753025, 0, 0, 0, 1, 1,
2.395611, 2.006913, 2.149234, 0, 0, 0, 1, 1,
2.3979, 0.1500392, 1.429952, 1, 1, 1, 1, 1,
2.400146, 0.2444645, 1.074624, 1, 1, 1, 1, 1,
2.421793, -1.212156, 1.018895, 1, 1, 1, 1, 1,
2.538628, 1.085522, 2.09467, 1, 1, 1, 1, 1,
2.583369, 0.6479219, 1.180521, 1, 1, 1, 1, 1,
2.605834, -0.2850251, -0.02317769, 1, 1, 1, 1, 1,
3.14309, 1.688637, 2.157749, 1, 1, 1, 1, 1
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
var radius = 9.529901;
var distance = 33.47337;
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
mvMatrix.translate( -0.1113641, -0.01702332, 0.5547338 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.47337);
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
