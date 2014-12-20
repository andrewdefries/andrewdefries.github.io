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
-2.683302, 1.072589, -2.663882, 1, 0, 0, 1,
-2.630834, -0.4062774, -0.9836204, 1, 0.007843138, 0, 1,
-2.523563, -1.212008, -3.457476, 1, 0.01176471, 0, 1,
-2.458384, 1.601401, -1.954575, 1, 0.01960784, 0, 1,
-2.427879, -1.500113, -1.771803, 1, 0.02352941, 0, 1,
-2.337904, 0.3846621, -2.106995, 1, 0.03137255, 0, 1,
-2.337485, 0.2974225, -1.699118, 1, 0.03529412, 0, 1,
-2.158297, -2.787649, -2.565922, 1, 0.04313726, 0, 1,
-2.117306, 0.7807789, -1.999264, 1, 0.04705882, 0, 1,
-2.112924, 0.5672271, -0.2096244, 1, 0.05490196, 0, 1,
-2.078044, 0.7654086, -1.996308, 1, 0.05882353, 0, 1,
-1.963598, -0.4221005, -3.258387, 1, 0.06666667, 0, 1,
-1.949719, 0.7682526, -1.513497, 1, 0.07058824, 0, 1,
-1.927498, 1.006834, 0.1203954, 1, 0.07843138, 0, 1,
-1.918983, 1.451056, 0.02040425, 1, 0.08235294, 0, 1,
-1.913416, -0.1766201, -3.132873, 1, 0.09019608, 0, 1,
-1.908671, 0.01729673, -0.5212073, 1, 0.09411765, 0, 1,
-1.898155, -0.445868, -2.979016, 1, 0.1019608, 0, 1,
-1.88846, -0.8687596, -2.178543, 1, 0.1098039, 0, 1,
-1.887042, 0.5291086, 0.5430064, 1, 0.1137255, 0, 1,
-1.878621, -0.07793844, -2.30746, 1, 0.1215686, 0, 1,
-1.848317, 0.5676026, -0.4940158, 1, 0.1254902, 0, 1,
-1.807299, 0.4700177, -1.973201, 1, 0.1333333, 0, 1,
-1.795632, -0.4372315, -3.483162, 1, 0.1372549, 0, 1,
-1.791889, -0.1115919, -0.3802147, 1, 0.145098, 0, 1,
-1.776601, -0.5277697, -3.04354, 1, 0.1490196, 0, 1,
-1.73772, 0.3286241, -2.24224, 1, 0.1568628, 0, 1,
-1.734715, 2.262817, -1.152936, 1, 0.1607843, 0, 1,
-1.727177, 0.5712245, -0.7641989, 1, 0.1686275, 0, 1,
-1.708423, -1.468571, -2.283235, 1, 0.172549, 0, 1,
-1.706728, 1.691196, -2.490634, 1, 0.1803922, 0, 1,
-1.698546, -0.1335485, -0.7206951, 1, 0.1843137, 0, 1,
-1.694525, 1.03001, -2.186874, 1, 0.1921569, 0, 1,
-1.689233, -0.8300399, -1.882351, 1, 0.1960784, 0, 1,
-1.683667, 1.641126, -0.6171102, 1, 0.2039216, 0, 1,
-1.647301, -0.8296824, -2.676796, 1, 0.2117647, 0, 1,
-1.630726, 1.188367, -1.10668, 1, 0.2156863, 0, 1,
-1.629915, -1.999373, -1.33353, 1, 0.2235294, 0, 1,
-1.60982, -0.5485938, -1.867713, 1, 0.227451, 0, 1,
-1.605759, -0.7650134, -1.017585, 1, 0.2352941, 0, 1,
-1.584368, 0.9181232, -1.162548, 1, 0.2392157, 0, 1,
-1.579411, -0.02964854, -3.019904, 1, 0.2470588, 0, 1,
-1.561333, -0.5260765, -1.48776, 1, 0.2509804, 0, 1,
-1.556173, 0.5108186, -1.676426, 1, 0.2588235, 0, 1,
-1.554856, -0.2562791, -2.282728, 1, 0.2627451, 0, 1,
-1.549422, 0.1959386, -1.092083, 1, 0.2705882, 0, 1,
-1.544882, -0.09813064, -1.772648, 1, 0.2745098, 0, 1,
-1.533069, -1.397992, -0.2873533, 1, 0.282353, 0, 1,
-1.514464, -0.9268457, -2.948992, 1, 0.2862745, 0, 1,
-1.512761, 1.799329, 1.277269, 1, 0.2941177, 0, 1,
-1.499601, 0.05160317, -2.533734, 1, 0.3019608, 0, 1,
-1.499566, 0.3615912, -1.465103, 1, 0.3058824, 0, 1,
-1.48833, 2.378321, -0.3676287, 1, 0.3137255, 0, 1,
-1.487585, 0.5022247, -2.408769, 1, 0.3176471, 0, 1,
-1.477051, 0.4340183, -3.037758, 1, 0.3254902, 0, 1,
-1.476225, -0.1433005, 0.009705557, 1, 0.3294118, 0, 1,
-1.47447, -0.3914063, -1.99846, 1, 0.3372549, 0, 1,
-1.452759, 1.361017, -2.00121, 1, 0.3411765, 0, 1,
-1.452114, -0.1043784, -3.066359, 1, 0.3490196, 0, 1,
-1.44896, -1.072412, -0.5968413, 1, 0.3529412, 0, 1,
-1.441286, -0.5525571, -0.7621784, 1, 0.3607843, 0, 1,
-1.428327, 1.472771, -0.03813726, 1, 0.3647059, 0, 1,
-1.413766, 0.9787402, -4.254513, 1, 0.372549, 0, 1,
-1.407492, 0.1038934, -1.191513, 1, 0.3764706, 0, 1,
-1.407275, -0.8263541, -4.537277, 1, 0.3843137, 0, 1,
-1.400833, 0.7912794, -1.521487, 1, 0.3882353, 0, 1,
-1.391832, -2.007825, -4.06051, 1, 0.3960784, 0, 1,
-1.391093, 0.7983452, -0.1847696, 1, 0.4039216, 0, 1,
-1.38771, 0.2749422, -0.2500405, 1, 0.4078431, 0, 1,
-1.382411, -0.08223067, -0.943442, 1, 0.4156863, 0, 1,
-1.382101, 1.254617, 1.156996, 1, 0.4196078, 0, 1,
-1.381108, -0.5433077, -2.054391, 1, 0.427451, 0, 1,
-1.368948, 1.600639, -1.061909, 1, 0.4313726, 0, 1,
-1.365084, 0.09513614, -2.426905, 1, 0.4392157, 0, 1,
-1.358693, 0.2990378, -0.7116155, 1, 0.4431373, 0, 1,
-1.341515, -0.539256, -1.882803, 1, 0.4509804, 0, 1,
-1.337126, 1.110704, -0.1040378, 1, 0.454902, 0, 1,
-1.335651, 0.4015279, -0.5792496, 1, 0.4627451, 0, 1,
-1.331387, -0.1761078, -1.401281, 1, 0.4666667, 0, 1,
-1.322161, 0.6940971, -1.175211, 1, 0.4745098, 0, 1,
-1.321735, 0.1004003, -1.011783, 1, 0.4784314, 0, 1,
-1.317735, 1.463286, 0.9486213, 1, 0.4862745, 0, 1,
-1.317486, 3.020039, -0.7196947, 1, 0.4901961, 0, 1,
-1.306261, -0.1351957, -1.829106, 1, 0.4980392, 0, 1,
-1.302285, 0.7775453, -0.781094, 1, 0.5058824, 0, 1,
-1.298453, 2.488685, -2.15169, 1, 0.509804, 0, 1,
-1.298291, -0.2042395, -1.367218, 1, 0.5176471, 0, 1,
-1.296807, -0.6250847, -1.3234, 1, 0.5215687, 0, 1,
-1.296255, 0.2367841, -3.017191, 1, 0.5294118, 0, 1,
-1.295077, 1.136775, -0.4119048, 1, 0.5333334, 0, 1,
-1.274435, 0.4923311, -1.671531, 1, 0.5411765, 0, 1,
-1.27143, 0.2957601, -2.208068, 1, 0.5450981, 0, 1,
-1.26915, 0.5540667, -0.4778559, 1, 0.5529412, 0, 1,
-1.269149, 0.95836, -1.220488, 1, 0.5568628, 0, 1,
-1.266419, -0.7572293, -2.475556, 1, 0.5647059, 0, 1,
-1.259761, -1.877141, -3.177358, 1, 0.5686275, 0, 1,
-1.25956, -0.9520853, -2.258319, 1, 0.5764706, 0, 1,
-1.257245, -1.021272, -1.651952, 1, 0.5803922, 0, 1,
-1.250192, -0.4064223, -0.2059714, 1, 0.5882353, 0, 1,
-1.248885, -0.9241409, -0.8875152, 1, 0.5921569, 0, 1,
-1.244345, -2.122875, -3.718801, 1, 0.6, 0, 1,
-1.236462, 0.3415025, 0.6917672, 1, 0.6078432, 0, 1,
-1.231202, 0.2608558, -2.024452, 1, 0.6117647, 0, 1,
-1.226878, 1.674342, -0.3316846, 1, 0.6196079, 0, 1,
-1.224553, 1.128575, -1.656427, 1, 0.6235294, 0, 1,
-1.22058, -0.4608344, -3.1065, 1, 0.6313726, 0, 1,
-1.219974, 0.5492998, 0.9547868, 1, 0.6352941, 0, 1,
-1.213043, 0.4909817, -0.1935853, 1, 0.6431373, 0, 1,
-1.210519, 0.3987329, -2.485184, 1, 0.6470588, 0, 1,
-1.209413, 1.188663, -0.2423735, 1, 0.654902, 0, 1,
-1.208992, -0.806837, -1.889599, 1, 0.6588235, 0, 1,
-1.204558, 0.1830294, 1.169745, 1, 0.6666667, 0, 1,
-1.204505, -2.889751, -3.136967, 1, 0.6705883, 0, 1,
-1.203227, 0.1229253, -2.694368, 1, 0.6784314, 0, 1,
-1.194514, -0.7681884, -2.749376, 1, 0.682353, 0, 1,
-1.192363, 0.5832021, -2.899123, 1, 0.6901961, 0, 1,
-1.189844, 1.126634, -1.343307, 1, 0.6941177, 0, 1,
-1.188841, -0.4850951, -1.03465, 1, 0.7019608, 0, 1,
-1.185838, -1.941942, -0.8205693, 1, 0.7098039, 0, 1,
-1.167334, 0.5341645, -0.1136845, 1, 0.7137255, 0, 1,
-1.167098, 0.2483209, -0.9010663, 1, 0.7215686, 0, 1,
-1.166589, 1.289268, 0.1505953, 1, 0.7254902, 0, 1,
-1.160996, -0.5680636, -2.220241, 1, 0.7333333, 0, 1,
-1.158135, 0.8032079, -1.492234, 1, 0.7372549, 0, 1,
-1.15671, -1.659584, -1.956033, 1, 0.7450981, 0, 1,
-1.153264, 2.496032, 0.02246594, 1, 0.7490196, 0, 1,
-1.133469, -1.446199, -2.788119, 1, 0.7568628, 0, 1,
-1.131845, 0.01347702, -1.227599, 1, 0.7607843, 0, 1,
-1.130212, -1.0537, -2.506965, 1, 0.7686275, 0, 1,
-1.126306, 0.8567499, 0.1440127, 1, 0.772549, 0, 1,
-1.121119, 0.5314608, -0.1050344, 1, 0.7803922, 0, 1,
-1.120107, 0.2377993, -1.15254, 1, 0.7843137, 0, 1,
-1.120033, -0.8328744, -1.858786, 1, 0.7921569, 0, 1,
-1.11828, -1.668296, -1.979567, 1, 0.7960784, 0, 1,
-1.110026, -0.73345, -2.221176, 1, 0.8039216, 0, 1,
-1.10682, -0.8255355, -0.1484331, 1, 0.8117647, 0, 1,
-1.105073, 0.3187036, -0.6738899, 1, 0.8156863, 0, 1,
-1.10428, -1.512401, -2.673632, 1, 0.8235294, 0, 1,
-1.102445, -0.7421368, -2.158616, 1, 0.827451, 0, 1,
-1.092147, 0.6625835, -0.2616619, 1, 0.8352941, 0, 1,
-1.090912, -2.514219, -1.881921, 1, 0.8392157, 0, 1,
-1.089486, 0.4110554, -2.356793, 1, 0.8470588, 0, 1,
-1.086761, 0.1541181, -1.974035, 1, 0.8509804, 0, 1,
-1.086097, -0.2689598, -2.484559, 1, 0.8588235, 0, 1,
-1.06933, -0.5972019, -2.554741, 1, 0.8627451, 0, 1,
-1.067038, -0.2989076, 0.113392, 1, 0.8705882, 0, 1,
-1.06408, 1.477964, -2.688414, 1, 0.8745098, 0, 1,
-1.061196, 1.869718, -0.3584854, 1, 0.8823529, 0, 1,
-1.059682, -0.2016271, -2.939743, 1, 0.8862745, 0, 1,
-1.058681, 0.1015589, -1.186848, 1, 0.8941177, 0, 1,
-1.047553, -0.1387639, -2.451988, 1, 0.8980392, 0, 1,
-1.041119, -0.7151122, -1.575589, 1, 0.9058824, 0, 1,
-1.034715, 2.071896, -1.140998, 1, 0.9137255, 0, 1,
-1.033526, -0.2574125, -0.5794266, 1, 0.9176471, 0, 1,
-1.029578, 0.4357518, -0.316339, 1, 0.9254902, 0, 1,
-1.024005, 0.6466307, -2.01689, 1, 0.9294118, 0, 1,
-1.021132, -1.319747, -2.357487, 1, 0.9372549, 0, 1,
-1.014133, -1.561091, -1.727148, 1, 0.9411765, 0, 1,
-1.013672, -0.01095931, -1.20224, 1, 0.9490196, 0, 1,
-1.01244, -1.257507, -0.9049402, 1, 0.9529412, 0, 1,
-1.002724, -1.340004, -2.306794, 1, 0.9607843, 0, 1,
-0.996868, 0.2685031, -0.1305066, 1, 0.9647059, 0, 1,
-0.9951661, -0.1101985, -1.704133, 1, 0.972549, 0, 1,
-0.9949825, 0.0709913, -2.477859, 1, 0.9764706, 0, 1,
-0.9940078, 1.598189, -0.1259591, 1, 0.9843137, 0, 1,
-0.9798371, 0.1428204, -2.436796, 1, 0.9882353, 0, 1,
-0.9755349, -0.6552871, -2.10039, 1, 0.9960784, 0, 1,
-0.9725221, 0.3084823, -1.111781, 0.9960784, 1, 0, 1,
-0.9652941, -0.3774955, -0.8865058, 0.9921569, 1, 0, 1,
-0.9631914, 2.094163, -0.1732685, 0.9843137, 1, 0, 1,
-0.9581494, -2.637136, -1.457376, 0.9803922, 1, 0, 1,
-0.956566, 1.788336, -0.3902145, 0.972549, 1, 0, 1,
-0.9486156, -0.0383034, 0.3903662, 0.9686275, 1, 0, 1,
-0.9464219, -1.714444, -1.105108, 0.9607843, 1, 0, 1,
-0.9405792, -0.5750883, -2.516398, 0.9568627, 1, 0, 1,
-0.9328663, 0.7281792, -0.7559463, 0.9490196, 1, 0, 1,
-0.9308286, 0.3726006, -1.250613, 0.945098, 1, 0, 1,
-0.9218993, 1.020654, -0.8538247, 0.9372549, 1, 0, 1,
-0.9200471, -0.05648457, -2.266589, 0.9333333, 1, 0, 1,
-0.9173455, -0.6575295, -2.751833, 0.9254902, 1, 0, 1,
-0.9168051, -2.022178, -1.774269, 0.9215686, 1, 0, 1,
-0.9155614, -0.4945646, -2.135233, 0.9137255, 1, 0, 1,
-0.9130008, 0.7141723, -1.956009, 0.9098039, 1, 0, 1,
-0.9112239, -0.7316636, -3.661448, 0.9019608, 1, 0, 1,
-0.9064937, -0.2069461, -2.409257, 0.8941177, 1, 0, 1,
-0.9059367, -0.9523861, -4.012334, 0.8901961, 1, 0, 1,
-0.8994628, 0.5786929, 0.516362, 0.8823529, 1, 0, 1,
-0.8922567, -1.037656, -3.384253, 0.8784314, 1, 0, 1,
-0.8921632, 1.196394, -0.7037309, 0.8705882, 1, 0, 1,
-0.8907048, -1.11392, -2.616512, 0.8666667, 1, 0, 1,
-0.879742, -0.7884613, -1.903064, 0.8588235, 1, 0, 1,
-0.8743538, -0.4573498, -1.311776, 0.854902, 1, 0, 1,
-0.8731157, 1.018631, -0.2430388, 0.8470588, 1, 0, 1,
-0.871093, -0.5455877, -1.422642, 0.8431373, 1, 0, 1,
-0.8675419, 0.08999997, 0.0896062, 0.8352941, 1, 0, 1,
-0.865844, 0.7752857, -0.1837973, 0.8313726, 1, 0, 1,
-0.8529593, -0.09442851, -0.1255936, 0.8235294, 1, 0, 1,
-0.8484257, 1.884956, -0.3539771, 0.8196079, 1, 0, 1,
-0.8469341, 0.2524121, -0.7544041, 0.8117647, 1, 0, 1,
-0.8462757, -0.7086259, -1.501817, 0.8078431, 1, 0, 1,
-0.8461088, -0.8104743, -0.6260875, 0.8, 1, 0, 1,
-0.8447909, -1.581629, -2.199153, 0.7921569, 1, 0, 1,
-0.8429314, -0.3246305, -2.118376, 0.7882353, 1, 0, 1,
-0.8408403, 2.059863, -0.7452459, 0.7803922, 1, 0, 1,
-0.8384413, -0.9434171, -1.639282, 0.7764706, 1, 0, 1,
-0.8304639, -0.773509, -0.7849236, 0.7686275, 1, 0, 1,
-0.8289652, -0.2443648, -1.39948, 0.7647059, 1, 0, 1,
-0.826438, -0.4354654, 0.03597461, 0.7568628, 1, 0, 1,
-0.8255257, 1.297451, -0.7956666, 0.7529412, 1, 0, 1,
-0.8231943, 1.93941, -0.2039808, 0.7450981, 1, 0, 1,
-0.8210816, 0.5245002, -1.899165, 0.7411765, 1, 0, 1,
-0.8180833, -1.593338, -1.487458, 0.7333333, 1, 0, 1,
-0.8171218, -0.3838529, -3.129024, 0.7294118, 1, 0, 1,
-0.8124017, -0.195546, -2.920174, 0.7215686, 1, 0, 1,
-0.8088195, -1.463446, -3.701205, 0.7176471, 1, 0, 1,
-0.8086205, 1.332299, 0.3023967, 0.7098039, 1, 0, 1,
-0.8081101, 0.02189761, -1.810565, 0.7058824, 1, 0, 1,
-0.8042014, 0.3627578, -1.202258, 0.6980392, 1, 0, 1,
-0.8024945, -1.033935, -3.03999, 0.6901961, 1, 0, 1,
-0.7996645, 0.1018849, -1.247889, 0.6862745, 1, 0, 1,
-0.7926438, 1.98579, -1.211285, 0.6784314, 1, 0, 1,
-0.7913423, -1.660996, -4.074299, 0.6745098, 1, 0, 1,
-0.7899779, -0.7917044, -2.469302, 0.6666667, 1, 0, 1,
-0.7868308, 0.8396931, -0.9468556, 0.6627451, 1, 0, 1,
-0.7851255, -2.155367, -2.029333, 0.654902, 1, 0, 1,
-0.7763733, -0.7847174, -1.56451, 0.6509804, 1, 0, 1,
-0.7719409, 1.760501, -0.5547311, 0.6431373, 1, 0, 1,
-0.7662548, 0.8970955, -0.2439856, 0.6392157, 1, 0, 1,
-0.7600994, -1.690417, -2.919093, 0.6313726, 1, 0, 1,
-0.7570153, 2.933607, 1.321208, 0.627451, 1, 0, 1,
-0.7529795, 0.4391421, -0.5378596, 0.6196079, 1, 0, 1,
-0.7528353, -1.977935, -3.488768, 0.6156863, 1, 0, 1,
-0.7453148, -1.442915, -2.972704, 0.6078432, 1, 0, 1,
-0.7448113, -0.7939084, -1.181416, 0.6039216, 1, 0, 1,
-0.7429231, -1.272631, -5.431044, 0.5960785, 1, 0, 1,
-0.738889, -0.6883288, -2.33255, 0.5882353, 1, 0, 1,
-0.7339658, 1.610699, -0.3552431, 0.5843138, 1, 0, 1,
-0.7297618, -1.040413, -3.183196, 0.5764706, 1, 0, 1,
-0.7213479, 1.024618, -0.9086409, 0.572549, 1, 0, 1,
-0.7194382, -1.572441, -2.552421, 0.5647059, 1, 0, 1,
-0.7187555, 1.557536, 0.1454501, 0.5607843, 1, 0, 1,
-0.718135, 0.03105341, -1.21752, 0.5529412, 1, 0, 1,
-0.7123737, -0.8437448, -2.657118, 0.5490196, 1, 0, 1,
-0.7103037, -0.2897151, -1.878278, 0.5411765, 1, 0, 1,
-0.709738, 1.927214, 0.5689985, 0.5372549, 1, 0, 1,
-0.7053305, -0.9782143, -2.97449, 0.5294118, 1, 0, 1,
-0.6967926, 0.98963, -0.857448, 0.5254902, 1, 0, 1,
-0.6886134, -1.022859, -2.352607, 0.5176471, 1, 0, 1,
-0.676271, 1.632983, -1.539888, 0.5137255, 1, 0, 1,
-0.6761069, 0.6851501, -0.9825335, 0.5058824, 1, 0, 1,
-0.6747136, 1.496643, -0.3080209, 0.5019608, 1, 0, 1,
-0.6718245, 0.7623173, 0.6487061, 0.4941176, 1, 0, 1,
-0.6712838, -0.843071, -2.331471, 0.4862745, 1, 0, 1,
-0.6686939, -0.3376795, -2.36428, 0.4823529, 1, 0, 1,
-0.6667683, -0.06335273, -2.883481, 0.4745098, 1, 0, 1,
-0.651671, 1.543452, 0.1842234, 0.4705882, 1, 0, 1,
-0.6470139, -0.1072421, -1.198582, 0.4627451, 1, 0, 1,
-0.6430075, 1.627913, -2.443972, 0.4588235, 1, 0, 1,
-0.6426031, 0.8795849, 0.3383264, 0.4509804, 1, 0, 1,
-0.6412386, 1.347192, -0.296762, 0.4470588, 1, 0, 1,
-0.6387975, -0.8145091, -2.299703, 0.4392157, 1, 0, 1,
-0.6365764, 1.153149, -1.606027, 0.4352941, 1, 0, 1,
-0.6350756, 1.40745, 0.7720191, 0.427451, 1, 0, 1,
-0.6291851, 0.9014198, 0.6919869, 0.4235294, 1, 0, 1,
-0.6273892, -0.6171424, -2.448191, 0.4156863, 1, 0, 1,
-0.6140742, -1.744487, -2.64406, 0.4117647, 1, 0, 1,
-0.6097376, -1.287741, -2.948431, 0.4039216, 1, 0, 1,
-0.6014386, -0.2895823, -1.085263, 0.3960784, 1, 0, 1,
-0.600325, -0.368916, -1.665892, 0.3921569, 1, 0, 1,
-0.5997114, 0.09484424, -0.1397071, 0.3843137, 1, 0, 1,
-0.5973387, -0.8647605, -1.705289, 0.3803922, 1, 0, 1,
-0.5963221, -1.397202, -1.537142, 0.372549, 1, 0, 1,
-0.5929268, 1.987288, -0.5289187, 0.3686275, 1, 0, 1,
-0.5849119, -0.8492782, -4.25111, 0.3607843, 1, 0, 1,
-0.5734619, 0.2158385, -2.587058, 0.3568628, 1, 0, 1,
-0.5681333, 2.658289, -0.5623925, 0.3490196, 1, 0, 1,
-0.5540426, 0.6628371, 0.190847, 0.345098, 1, 0, 1,
-0.5534928, 0.7169961, -1.451013, 0.3372549, 1, 0, 1,
-0.5506618, 2.256262, -1.15491, 0.3333333, 1, 0, 1,
-0.5500435, -0.07725537, -1.523311, 0.3254902, 1, 0, 1,
-0.5495844, -0.9933063, -1.119561, 0.3215686, 1, 0, 1,
-0.5435435, 0.5513011, 0.2966317, 0.3137255, 1, 0, 1,
-0.5372607, 0.2255133, -0.401499, 0.3098039, 1, 0, 1,
-0.5362315, -0.9460005, -4.195261, 0.3019608, 1, 0, 1,
-0.5344697, -2.021444, -3.465698, 0.2941177, 1, 0, 1,
-0.5324575, 0.955789, -1.335488, 0.2901961, 1, 0, 1,
-0.5301128, -1.230423, -1.643019, 0.282353, 1, 0, 1,
-0.5287517, -1.350486, -3.751451, 0.2784314, 1, 0, 1,
-0.528608, 1.147191, -0.5391613, 0.2705882, 1, 0, 1,
-0.5254014, 0.6088104, -1.386952, 0.2666667, 1, 0, 1,
-0.5230944, -0.1151413, -0.8172306, 0.2588235, 1, 0, 1,
-0.5198143, 0.726568, -1.403679, 0.254902, 1, 0, 1,
-0.512431, 0.2395603, -0.3212037, 0.2470588, 1, 0, 1,
-0.5122682, 0.5788535, -0.1338239, 0.2431373, 1, 0, 1,
-0.509768, -0.7686387, -2.802451, 0.2352941, 1, 0, 1,
-0.5076151, 0.9748254, -1.558265, 0.2313726, 1, 0, 1,
-0.5071149, -0.5943317, -3.613286, 0.2235294, 1, 0, 1,
-0.4945726, 0.8844643, -0.3945856, 0.2196078, 1, 0, 1,
-0.493854, -2.326159, -2.332255, 0.2117647, 1, 0, 1,
-0.4904068, 0.1845028, -0.08577034, 0.2078431, 1, 0, 1,
-0.4895036, -0.7223147, -2.464085, 0.2, 1, 0, 1,
-0.4888596, 0.4488881, 0.4159674, 0.1921569, 1, 0, 1,
-0.4826183, 0.06818768, -1.512269, 0.1882353, 1, 0, 1,
-0.4813247, 0.1072474, -0.848215, 0.1803922, 1, 0, 1,
-0.4810299, 0.04038338, -1.206638, 0.1764706, 1, 0, 1,
-0.4742159, -0.8331085, -2.334097, 0.1686275, 1, 0, 1,
-0.4722499, 0.606753, -0.7159425, 0.1647059, 1, 0, 1,
-0.4721527, 0.01352184, -1.176323, 0.1568628, 1, 0, 1,
-0.470485, 0.9309464, -0.649806, 0.1529412, 1, 0, 1,
-0.4645851, -0.5924767, -3.028541, 0.145098, 1, 0, 1,
-0.4644055, 0.1812298, -1.862817, 0.1411765, 1, 0, 1,
-0.4611716, 0.01150871, -1.714872, 0.1333333, 1, 0, 1,
-0.4602402, -0.004231607, -2.847152, 0.1294118, 1, 0, 1,
-0.4591999, 0.1524258, -0.496757, 0.1215686, 1, 0, 1,
-0.4548721, -1.281711, -1.499014, 0.1176471, 1, 0, 1,
-0.4534853, -1.584022, -4.577241, 0.1098039, 1, 0, 1,
-0.4518099, 1.012501, -0.9162135, 0.1058824, 1, 0, 1,
-0.4507096, 0.3236305, -1.307886, 0.09803922, 1, 0, 1,
-0.4497065, -1.433321, -1.658856, 0.09019608, 1, 0, 1,
-0.4483725, 0.3308547, -0.6853675, 0.08627451, 1, 0, 1,
-0.4466202, 1.99847, -2.139802, 0.07843138, 1, 0, 1,
-0.444947, -0.4864173, -1.484177, 0.07450981, 1, 0, 1,
-0.4394723, -0.6514791, -4.253118, 0.06666667, 1, 0, 1,
-0.4372763, 0.9149046, -1.9001, 0.0627451, 1, 0, 1,
-0.4346146, 1.19382, -0.6966925, 0.05490196, 1, 0, 1,
-0.434573, -0.0870844, -3.04045, 0.05098039, 1, 0, 1,
-0.4339879, -0.5322023, -1.49012, 0.04313726, 1, 0, 1,
-0.4267781, 0.6681915, 0.9913278, 0.03921569, 1, 0, 1,
-0.4249723, -0.6402181, -3.597588, 0.03137255, 1, 0, 1,
-0.4247546, 0.5743535, -0.6461768, 0.02745098, 1, 0, 1,
-0.4222835, 1.281565, -1.068397, 0.01960784, 1, 0, 1,
-0.4189208, -1.857966, -1.236901, 0.01568628, 1, 0, 1,
-0.4171982, 0.2163375, -1.474563, 0.007843138, 1, 0, 1,
-0.4169559, -1.275465, -0.8120428, 0.003921569, 1, 0, 1,
-0.4104455, 0.3124791, -1.275563, 0, 1, 0.003921569, 1,
-0.4073026, -1.075098, -2.239286, 0, 1, 0.01176471, 1,
-0.4062501, 1.150209, -1.202807, 0, 1, 0.01568628, 1,
-0.4044834, -0.3310783, -1.782353, 0, 1, 0.02352941, 1,
-0.4033498, 0.4991686, -0.5165359, 0, 1, 0.02745098, 1,
-0.4011622, 3.018642, -1.563842, 0, 1, 0.03529412, 1,
-0.3938242, 0.0279348, -0.118784, 0, 1, 0.03921569, 1,
-0.3890954, -1.051421, -1.749416, 0, 1, 0.04705882, 1,
-0.3889917, -2.601223, -2.136959, 0, 1, 0.05098039, 1,
-0.3856208, -0.5747355, -3.397485, 0, 1, 0.05882353, 1,
-0.3853592, -1.427415, -3.539465, 0, 1, 0.0627451, 1,
-0.3813781, 0.1751413, -1.4307, 0, 1, 0.07058824, 1,
-0.3774615, 1.449478, -0.8030311, 0, 1, 0.07450981, 1,
-0.37597, -1.04689, -3.313798, 0, 1, 0.08235294, 1,
-0.3752943, 2.73842, 0.03244188, 0, 1, 0.08627451, 1,
-0.3745608, 1.401844, -0.2170614, 0, 1, 0.09411765, 1,
-0.3733436, 0.0987047, -2.294445, 0, 1, 0.1019608, 1,
-0.3592837, 1.048986, -0.7485395, 0, 1, 0.1058824, 1,
-0.3555642, 0.04534233, -1.394371, 0, 1, 0.1137255, 1,
-0.3529582, 0.2721676, -2.703121, 0, 1, 0.1176471, 1,
-0.3522076, -1.511187, -3.78751, 0, 1, 0.1254902, 1,
-0.3518116, 1.224835, -0.4195735, 0, 1, 0.1294118, 1,
-0.350271, 0.4844455, -1.091579, 0, 1, 0.1372549, 1,
-0.3501756, 0.7357745, 0.2267775, 0, 1, 0.1411765, 1,
-0.3468585, -0.9768361, -2.221767, 0, 1, 0.1490196, 1,
-0.346742, 0.6025038, -1.7692, 0, 1, 0.1529412, 1,
-0.3451754, -0.01710126, -2.739661, 0, 1, 0.1607843, 1,
-0.3383441, 0.4655311, 0.1636399, 0, 1, 0.1647059, 1,
-0.3336253, 0.5445672, -0.3565913, 0, 1, 0.172549, 1,
-0.329246, 0.5905101, 1.097398, 0, 1, 0.1764706, 1,
-0.3270143, -0.9807575, -3.973808, 0, 1, 0.1843137, 1,
-0.3263883, 1.17716, -0.9682537, 0, 1, 0.1882353, 1,
-0.3233368, -0.148966, -3.633843, 0, 1, 0.1960784, 1,
-0.3225754, 0.3508391, -0.3954062, 0, 1, 0.2039216, 1,
-0.322082, -0.1986428, -2.394663, 0, 1, 0.2078431, 1,
-0.3205011, -0.5735173, -2.279928, 0, 1, 0.2156863, 1,
-0.3187145, 0.7349016, -2.259009, 0, 1, 0.2196078, 1,
-0.3139826, 0.1838377, -0.3331683, 0, 1, 0.227451, 1,
-0.3089633, -0.074295, -0.2258718, 0, 1, 0.2313726, 1,
-0.3078492, -0.5595847, -2.641991, 0, 1, 0.2392157, 1,
-0.3047732, -0.312371, -3.170388, 0, 1, 0.2431373, 1,
-0.3046931, -3.096544, -2.43248, 0, 1, 0.2509804, 1,
-0.3036259, -0.499284, -4.139117, 0, 1, 0.254902, 1,
-0.3029342, 0.3889602, 2.065993, 0, 1, 0.2627451, 1,
-0.3026599, -0.7969229, -3.181339, 0, 1, 0.2666667, 1,
-0.2993018, -1.447137, -2.419045, 0, 1, 0.2745098, 1,
-0.2968877, -0.2126885, -3.743485, 0, 1, 0.2784314, 1,
-0.2961282, -0.6175091, -2.770522, 0, 1, 0.2862745, 1,
-0.2961129, -1.00835, -2.651204, 0, 1, 0.2901961, 1,
-0.2959366, 0.9300225, -0.09142748, 0, 1, 0.2980392, 1,
-0.2916536, -0.3167055, -2.027362, 0, 1, 0.3058824, 1,
-0.2853746, 0.02135062, -1.340453, 0, 1, 0.3098039, 1,
-0.283679, -0.3884883, -3.390259, 0, 1, 0.3176471, 1,
-0.2810965, -1.223146, -3.11119, 0, 1, 0.3215686, 1,
-0.2806249, -1.129176, -4.57161, 0, 1, 0.3294118, 1,
-0.2804372, -0.2186824, -3.679633, 0, 1, 0.3333333, 1,
-0.2763755, -0.2118383, -2.030579, 0, 1, 0.3411765, 1,
-0.2743879, 0.7004223, 1.431355, 0, 1, 0.345098, 1,
-0.2736763, -0.6162167, -4.289819, 0, 1, 0.3529412, 1,
-0.2659877, 1.678852, -0.80869, 0, 1, 0.3568628, 1,
-0.2645803, 2.254129, 0.8671972, 0, 1, 0.3647059, 1,
-0.259844, -0.3522619, -1.916145, 0, 1, 0.3686275, 1,
-0.2583113, -0.444006, -2.770652, 0, 1, 0.3764706, 1,
-0.2536188, -0.6741601, -3.686001, 0, 1, 0.3803922, 1,
-0.2425094, 1.307073, 0.7770388, 0, 1, 0.3882353, 1,
-0.2366696, 0.8661637, -0.7677191, 0, 1, 0.3921569, 1,
-0.2320169, -1.010157, -4.653089, 0, 1, 0.4, 1,
-0.230426, -0.7926921, -2.908745, 0, 1, 0.4078431, 1,
-0.2278194, -0.6284459, -2.407433, 0, 1, 0.4117647, 1,
-0.2266074, -0.7583589, -4.277538, 0, 1, 0.4196078, 1,
-0.2263662, 0.8745171, -0.5223401, 0, 1, 0.4235294, 1,
-0.2234298, 1.173607, -1.399026, 0, 1, 0.4313726, 1,
-0.2218772, -1.16967, -1.24279, 0, 1, 0.4352941, 1,
-0.2209065, -0.05558193, -1.960181, 0, 1, 0.4431373, 1,
-0.219886, 0.6989135, 0.1750467, 0, 1, 0.4470588, 1,
-0.2027328, -0.4915307, -4.321201, 0, 1, 0.454902, 1,
-0.1996795, -0.1714235, -2.945386, 0, 1, 0.4588235, 1,
-0.1995774, -0.3768307, -1.129143, 0, 1, 0.4666667, 1,
-0.1891983, 1.372788, 0.088222, 0, 1, 0.4705882, 1,
-0.1890635, -1.338118, -4.118055, 0, 1, 0.4784314, 1,
-0.1885304, -0.08797057, -2.010536, 0, 1, 0.4823529, 1,
-0.1838617, 0.6450294, 1.089574, 0, 1, 0.4901961, 1,
-0.1822882, 1.522716, 0.85445, 0, 1, 0.4941176, 1,
-0.181279, -1.094089, -3.303593, 0, 1, 0.5019608, 1,
-0.1773499, -1.100263, -4.240158, 0, 1, 0.509804, 1,
-0.1753396, -1.73944, -3.103832, 0, 1, 0.5137255, 1,
-0.1721943, -0.9289722, -1.683581, 0, 1, 0.5215687, 1,
-0.1700149, -1.491938, -2.848589, 0, 1, 0.5254902, 1,
-0.1649155, 0.6889302, 0.4786219, 0, 1, 0.5333334, 1,
-0.1605771, -1.225523, -2.744741, 0, 1, 0.5372549, 1,
-0.1571812, -0.5193498, -3.568748, 0, 1, 0.5450981, 1,
-0.1545317, 1.218055, 0.02518523, 0, 1, 0.5490196, 1,
-0.1537302, -1.330919, -3.260697, 0, 1, 0.5568628, 1,
-0.1536935, -1.264434, -1.336689, 0, 1, 0.5607843, 1,
-0.1526034, 1.155159, -0.1700156, 0, 1, 0.5686275, 1,
-0.1507985, 1.028732, -0.14586, 0, 1, 0.572549, 1,
-0.1492884, -0.5374491, -4.552784, 0, 1, 0.5803922, 1,
-0.1435011, -1.997978, -3.11313, 0, 1, 0.5843138, 1,
-0.1422261, 1.166259, -0.0387071, 0, 1, 0.5921569, 1,
-0.1390155, 1.032054, 0.1349422, 0, 1, 0.5960785, 1,
-0.1389641, -0.34262, -3.122744, 0, 1, 0.6039216, 1,
-0.1372853, 0.5699959, -1.259788, 0, 1, 0.6117647, 1,
-0.1323308, -0.3369823, -1.096275, 0, 1, 0.6156863, 1,
-0.1288955, -0.3701307, -3.654402, 0, 1, 0.6235294, 1,
-0.1259634, -0.9883437, -1.91831, 0, 1, 0.627451, 1,
-0.1257134, -1.039442, -3.125447, 0, 1, 0.6352941, 1,
-0.1239837, 0.3117034, -1.36616, 0, 1, 0.6392157, 1,
-0.1236544, 0.1174277, 0.02742984, 0, 1, 0.6470588, 1,
-0.1216902, -0.5607046, -3.066885, 0, 1, 0.6509804, 1,
-0.1183934, -1.007491, -5.510659, 0, 1, 0.6588235, 1,
-0.1143054, 0.3390935, -1.422913, 0, 1, 0.6627451, 1,
-0.1122462, 0.07156919, -1.316691, 0, 1, 0.6705883, 1,
-0.1107861, 0.589848, -1.105913, 0, 1, 0.6745098, 1,
-0.1105494, -2.12906, -2.890995, 0, 1, 0.682353, 1,
-0.1073474, 0.03061289, -0.8306604, 0, 1, 0.6862745, 1,
-0.1062641, 1.895112, -0.366471, 0, 1, 0.6941177, 1,
-0.09913028, 1.182854, -1.043019, 0, 1, 0.7019608, 1,
-0.09912565, 0.5438481, -0.2054848, 0, 1, 0.7058824, 1,
-0.09711937, -1.043704, -2.296459, 0, 1, 0.7137255, 1,
-0.08830982, 0.4713053, 0.03288677, 0, 1, 0.7176471, 1,
-0.08593515, 1.862228, 0.3467106, 0, 1, 0.7254902, 1,
-0.08484595, -0.8226993, -4.121793, 0, 1, 0.7294118, 1,
-0.08453615, -0.8384422, -2.23676, 0, 1, 0.7372549, 1,
-0.08240931, -0.8980613, -2.640214, 0, 1, 0.7411765, 1,
-0.08099498, 0.3246478, -0.5684745, 0, 1, 0.7490196, 1,
-0.07999434, 1.809121, -1.205143, 0, 1, 0.7529412, 1,
-0.07905575, -0.5754896, -4.795038, 0, 1, 0.7607843, 1,
-0.07782615, 0.6233641, 1.2214, 0, 1, 0.7647059, 1,
-0.07493874, -0.5207741, -1.029841, 0, 1, 0.772549, 1,
-0.07346588, -0.6214904, -3.590711, 0, 1, 0.7764706, 1,
-0.07151546, -0.2399331, -5.021759, 0, 1, 0.7843137, 1,
-0.06914461, 1.82175, -0.2485808, 0, 1, 0.7882353, 1,
-0.0689537, -0.3614355, -3.015861, 0, 1, 0.7960784, 1,
-0.06883731, -0.5412106, -2.61815, 0, 1, 0.8039216, 1,
-0.06740067, 0.80787, 0.4901777, 0, 1, 0.8078431, 1,
-0.06402267, -0.1623181, -1.512594, 0, 1, 0.8156863, 1,
-0.06246976, -0.3656441, -1.952554, 0, 1, 0.8196079, 1,
-0.06104827, -0.08353548, -3.783237, 0, 1, 0.827451, 1,
-0.05695577, -0.252335, -3.773909, 0, 1, 0.8313726, 1,
-0.05450473, 0.03666181, -2.099396, 0, 1, 0.8392157, 1,
-0.04774597, 0.02041037, -2.676526, 0, 1, 0.8431373, 1,
-0.04429577, -0.8859728, -3.944294, 0, 1, 0.8509804, 1,
-0.04175013, -0.5022, -3.702744, 0, 1, 0.854902, 1,
-0.04070746, 0.8147924, 0.0979756, 0, 1, 0.8627451, 1,
-0.04053017, 0.6987979, -2.962925, 0, 1, 0.8666667, 1,
-0.03999162, 1.536046, 0.1524478, 0, 1, 0.8745098, 1,
-0.03878765, -0.5688576, -2.377053, 0, 1, 0.8784314, 1,
-0.03817709, -2.201403, -2.187183, 0, 1, 0.8862745, 1,
-0.03590985, 2.666578, 0.00904694, 0, 1, 0.8901961, 1,
-0.0358426, 0.4517846, -0.9664304, 0, 1, 0.8980392, 1,
-0.03530188, -0.822162, -3.555532, 0, 1, 0.9058824, 1,
-0.0324145, -0.6037679, -3.086453, 0, 1, 0.9098039, 1,
-0.03050197, -1.166083, -3.99023, 0, 1, 0.9176471, 1,
-0.02962744, 0.3296198, 0.1012534, 0, 1, 0.9215686, 1,
-0.02753492, 0.2435514, 0.8943039, 0, 1, 0.9294118, 1,
-0.02688392, -2.54446, -3.247871, 0, 1, 0.9333333, 1,
-0.02603963, 0.9744826, 0.2090817, 0, 1, 0.9411765, 1,
-0.02270962, 1.868151, 1.159336, 0, 1, 0.945098, 1,
-0.01999198, 0.04033737, -0.2464297, 0, 1, 0.9529412, 1,
-0.01934262, 0.9240408, 0.1900762, 0, 1, 0.9568627, 1,
-0.01556828, 0.981292, 2.146473, 0, 1, 0.9647059, 1,
-0.01243119, -0.7460383, -2.200703, 0, 1, 0.9686275, 1,
-0.01033744, 0.1768192, -0.2821861, 0, 1, 0.9764706, 1,
-0.008740949, -0.4262934, -3.116997, 0, 1, 0.9803922, 1,
-0.001502789, 0.7941012, -2.330133, 0, 1, 0.9882353, 1,
-0.0001877763, -0.5337114, -1.603949, 0, 1, 0.9921569, 1,
0.005665223, 0.216846, -0.3181646, 0, 1, 1, 1,
0.006203389, -0.7009974, 3.129544, 0, 0.9921569, 1, 1,
0.007867929, -0.6928835, 3.071756, 0, 0.9882353, 1, 1,
0.008293089, 1.189861, -0.4066039, 0, 0.9803922, 1, 1,
0.009486938, 0.9368433, -0.2740031, 0, 0.9764706, 1, 1,
0.009861725, -0.9189442, 1.818883, 0, 0.9686275, 1, 1,
0.009868098, -0.1105471, 4.422706, 0, 0.9647059, 1, 1,
0.01288902, 1.244267, -0.6328683, 0, 0.9568627, 1, 1,
0.0128945, -0.2733154, 3.44433, 0, 0.9529412, 1, 1,
0.01667279, -0.08914135, 3.696338, 0, 0.945098, 1, 1,
0.01834746, -0.7718943, 2.943691, 0, 0.9411765, 1, 1,
0.0219142, 0.2593946, -0.7834753, 0, 0.9333333, 1, 1,
0.0234957, 0.7177575, -0.2894531, 0, 0.9294118, 1, 1,
0.02353955, -0.1133296, 3.175336, 0, 0.9215686, 1, 1,
0.02433698, 0.09625175, -0.6912042, 0, 0.9176471, 1, 1,
0.03179638, -0.3173806, 3.708259, 0, 0.9098039, 1, 1,
0.03220268, 0.9144716, 0.9075895, 0, 0.9058824, 1, 1,
0.03247853, 1.594302, 0.07347602, 0, 0.8980392, 1, 1,
0.03255422, -0.3248411, 3.166035, 0, 0.8901961, 1, 1,
0.03272007, -0.3779413, 2.722452, 0, 0.8862745, 1, 1,
0.03583172, 1.514407, 1.558006, 0, 0.8784314, 1, 1,
0.0370064, -1.104881, 3.720653, 0, 0.8745098, 1, 1,
0.03868726, -1.98369, 0.9534651, 0, 0.8666667, 1, 1,
0.03880586, 1.834582, -0.89606, 0, 0.8627451, 1, 1,
0.04542551, -0.556968, 3.921422, 0, 0.854902, 1, 1,
0.05497549, -0.3323501, 1.398265, 0, 0.8509804, 1, 1,
0.05549961, 0.1127178, 0.3983834, 0, 0.8431373, 1, 1,
0.05794483, -1.294951, 2.709898, 0, 0.8392157, 1, 1,
0.05868565, 1.037233, 1.429394, 0, 0.8313726, 1, 1,
0.06006381, 0.5231197, 0.6205392, 0, 0.827451, 1, 1,
0.06332742, -0.6618867, 1.923279, 0, 0.8196079, 1, 1,
0.06399181, 0.8399987, -0.8599675, 0, 0.8156863, 1, 1,
0.06400003, 0.2735189, 0.2220483, 0, 0.8078431, 1, 1,
0.06426798, 0.4769394, -2.242429, 0, 0.8039216, 1, 1,
0.06875448, 1.897346, -0.9629487, 0, 0.7960784, 1, 1,
0.069795, 0.8710687, 0.3529507, 0, 0.7882353, 1, 1,
0.07030131, -1.269791, 4.855781, 0, 0.7843137, 1, 1,
0.07279609, 0.5037351, -0.6094479, 0, 0.7764706, 1, 1,
0.07301404, -0.009355208, 1.139627, 0, 0.772549, 1, 1,
0.07441746, 0.5163046, -0.9916013, 0, 0.7647059, 1, 1,
0.0755887, -1.684058, 3.006604, 0, 0.7607843, 1, 1,
0.07627905, 1.359132, 0.3308387, 0, 0.7529412, 1, 1,
0.08060657, -0.3198572, 3.567669, 0, 0.7490196, 1, 1,
0.08212261, 3.104577, 1.017651, 0, 0.7411765, 1, 1,
0.08539666, 1.249046, -1.591156, 0, 0.7372549, 1, 1,
0.08936352, 0.3458416, -1.401871, 0, 0.7294118, 1, 1,
0.09141222, -0.5829623, 3.585437, 0, 0.7254902, 1, 1,
0.09227765, 1.463502, 1.613468, 0, 0.7176471, 1, 1,
0.09708008, -2.411033, 3.46619, 0, 0.7137255, 1, 1,
0.09991559, -1.162645, 2.572798, 0, 0.7058824, 1, 1,
0.1043316, -0.06843366, 2.459904, 0, 0.6980392, 1, 1,
0.1053629, 0.6445407, 0.3974787, 0, 0.6941177, 1, 1,
0.1066443, -1.604142, 3.403776, 0, 0.6862745, 1, 1,
0.1090581, 1.807979, -1.405493, 0, 0.682353, 1, 1,
0.1157978, 1.602475, -1.782087, 0, 0.6745098, 1, 1,
0.1175096, 0.02353327, 1.812355, 0, 0.6705883, 1, 1,
0.1178229, 0.4280681, 1.289121, 0, 0.6627451, 1, 1,
0.1183457, -1.224621, 2.973348, 0, 0.6588235, 1, 1,
0.1236129, -0.2724335, 3.756546, 0, 0.6509804, 1, 1,
0.1257332, -1.253641, 3.283552, 0, 0.6470588, 1, 1,
0.1285819, 0.9542959, -0.08499758, 0, 0.6392157, 1, 1,
0.1286635, 1.820877, 1.884632, 0, 0.6352941, 1, 1,
0.1343178, -1.176021, 2.767573, 0, 0.627451, 1, 1,
0.1381757, 0.2919873, 2.451731, 0, 0.6235294, 1, 1,
0.1405402, -0.3673608, 2.044125, 0, 0.6156863, 1, 1,
0.1446963, -0.9414082, 3.411163, 0, 0.6117647, 1, 1,
0.1454606, 0.5871915, -0.3608065, 0, 0.6039216, 1, 1,
0.1468525, 0.8746473, -0.4012902, 0, 0.5960785, 1, 1,
0.1553196, -0.4258613, 5.854965, 0, 0.5921569, 1, 1,
0.1558931, 0.8252611, -1.178693, 0, 0.5843138, 1, 1,
0.1579883, 1.292743, 0.7848247, 0, 0.5803922, 1, 1,
0.1591706, -0.6237924, 3.767098, 0, 0.572549, 1, 1,
0.160826, 1.469828, -1.964572, 0, 0.5686275, 1, 1,
0.1668046, 0.3929872, -0.9736216, 0, 0.5607843, 1, 1,
0.1687297, -1.693177, 4.049946, 0, 0.5568628, 1, 1,
0.1687539, -1.288286, 2.502131, 0, 0.5490196, 1, 1,
0.1716192, -1.095117, 3.497664, 0, 0.5450981, 1, 1,
0.1719341, -0.1884688, 2.132362, 0, 0.5372549, 1, 1,
0.1736804, -0.04894838, 2.677565, 0, 0.5333334, 1, 1,
0.1738357, 0.1720832, -1.841063, 0, 0.5254902, 1, 1,
0.1757145, -1.828457, 2.784139, 0, 0.5215687, 1, 1,
0.1781019, 1.065648, 0.1386285, 0, 0.5137255, 1, 1,
0.1793511, -0.2812738, 2.51166, 0, 0.509804, 1, 1,
0.1810173, 0.7526455, -1.453489, 0, 0.5019608, 1, 1,
0.1852189, -0.2117165, 3.012826, 0, 0.4941176, 1, 1,
0.1860297, 0.695529, 0.1818735, 0, 0.4901961, 1, 1,
0.1861837, 0.3545407, 1.900759, 0, 0.4823529, 1, 1,
0.1863475, -1.201551, 3.389648, 0, 0.4784314, 1, 1,
0.1865589, 0.1564801, -0.8244286, 0, 0.4705882, 1, 1,
0.1929953, 0.3930657, -1.161098, 0, 0.4666667, 1, 1,
0.1955263, 1.06743, 1.401478, 0, 0.4588235, 1, 1,
0.2001739, 0.6526886, 1.132544, 0, 0.454902, 1, 1,
0.2012582, -1.453215, 4.782527, 0, 0.4470588, 1, 1,
0.202065, 0.05378452, 1.62518, 0, 0.4431373, 1, 1,
0.2046407, -1.697296, 4.37528, 0, 0.4352941, 1, 1,
0.2121968, 1.095373, 1.495777, 0, 0.4313726, 1, 1,
0.217856, -1.044456, 2.873353, 0, 0.4235294, 1, 1,
0.2195696, -0.5289478, 3.911029, 0, 0.4196078, 1, 1,
0.220042, 0.3338281, -0.6299399, 0, 0.4117647, 1, 1,
0.2241334, -0.760276, 2.06344, 0, 0.4078431, 1, 1,
0.2248923, 0.08631571, 0.3355482, 0, 0.4, 1, 1,
0.2322659, -0.3986523, 2.008698, 0, 0.3921569, 1, 1,
0.2334814, 0.08273943, 1.721975, 0, 0.3882353, 1, 1,
0.2357, -0.2512203, 2.108046, 0, 0.3803922, 1, 1,
0.2402582, 0.3255492, 0.03094582, 0, 0.3764706, 1, 1,
0.2411271, -0.9680021, 2.738391, 0, 0.3686275, 1, 1,
0.2433217, -1.583321, 0.3930846, 0, 0.3647059, 1, 1,
0.2436013, 0.4274723, 0.5189294, 0, 0.3568628, 1, 1,
0.244066, -1.626152, 4.045964, 0, 0.3529412, 1, 1,
0.2441416, 1.425508, 0.2002925, 0, 0.345098, 1, 1,
0.2447362, -2.943617, 4.062942, 0, 0.3411765, 1, 1,
0.2447997, -0.8749022, 2.155867, 0, 0.3333333, 1, 1,
0.2459134, -1.518975, 2.588919, 0, 0.3294118, 1, 1,
0.2460362, 0.9800661, -0.6072096, 0, 0.3215686, 1, 1,
0.2509916, 0.1677097, -0.1787459, 0, 0.3176471, 1, 1,
0.2530277, 0.8793191, 0.7055661, 0, 0.3098039, 1, 1,
0.2544453, 0.8159448, 0.1366737, 0, 0.3058824, 1, 1,
0.2579434, 0.06649002, 2.27167, 0, 0.2980392, 1, 1,
0.2590327, -0.1353029, 2.167997, 0, 0.2901961, 1, 1,
0.2631312, 1.017854, -0.2842185, 0, 0.2862745, 1, 1,
0.2688019, -0.7760473, 2.900483, 0, 0.2784314, 1, 1,
0.2742551, -0.9356635, 3.042182, 0, 0.2745098, 1, 1,
0.2796264, -0.4217165, 2.316439, 0, 0.2666667, 1, 1,
0.281141, 0.1450486, 0.2201418, 0, 0.2627451, 1, 1,
0.2811979, -1.658116, 2.452449, 0, 0.254902, 1, 1,
0.2824577, -0.1332377, 1.649711, 0, 0.2509804, 1, 1,
0.282954, 1.295741, 0.2583264, 0, 0.2431373, 1, 1,
0.2846893, 0.2258502, 0.9844399, 0, 0.2392157, 1, 1,
0.2853686, -0.01419026, 2.154238, 0, 0.2313726, 1, 1,
0.2892073, 0.1676527, -0.6596777, 0, 0.227451, 1, 1,
0.2893583, 1.495194, -0.8126394, 0, 0.2196078, 1, 1,
0.2991166, 0.7720729, 0.4347462, 0, 0.2156863, 1, 1,
0.3003152, -0.1298237, 2.499066, 0, 0.2078431, 1, 1,
0.3048969, 0.6167287, -0.5648407, 0, 0.2039216, 1, 1,
0.3053458, 0.07409696, 0.3493706, 0, 0.1960784, 1, 1,
0.3055984, -0.2268659, 2.184092, 0, 0.1882353, 1, 1,
0.3074863, 0.2538216, 0.3964969, 0, 0.1843137, 1, 1,
0.3152036, -0.656633, 3.036455, 0, 0.1764706, 1, 1,
0.3162859, -0.6315827, 2.323389, 0, 0.172549, 1, 1,
0.3193533, 1.485433, 1.763426, 0, 0.1647059, 1, 1,
0.3244871, 0.6434944, -0.2339292, 0, 0.1607843, 1, 1,
0.3277757, -0.5172927, 2.55059, 0, 0.1529412, 1, 1,
0.3283503, 2.341366, 0.6802146, 0, 0.1490196, 1, 1,
0.3290921, -2.293949, 3.986953, 0, 0.1411765, 1, 1,
0.3295715, 0.5686278, -0.2714289, 0, 0.1372549, 1, 1,
0.3319097, -0.1262518, -0.350303, 0, 0.1294118, 1, 1,
0.331918, 0.9222227, 0.02499956, 0, 0.1254902, 1, 1,
0.3333171, 1.869446, 0.243975, 0, 0.1176471, 1, 1,
0.3396818, -0.477071, 3.560201, 0, 0.1137255, 1, 1,
0.3401536, 1.82767, 1.068365, 0, 0.1058824, 1, 1,
0.3465378, 1.134966, -1.060746, 0, 0.09803922, 1, 1,
0.3526258, 0.3851617, 0.761498, 0, 0.09411765, 1, 1,
0.3531321, 0.2434334, 0.7310517, 0, 0.08627451, 1, 1,
0.354501, -1.671022, 2.731973, 0, 0.08235294, 1, 1,
0.3619947, 0.7346063, 1.973299, 0, 0.07450981, 1, 1,
0.362415, 0.1233808, 1.431955, 0, 0.07058824, 1, 1,
0.3625785, 0.2235582, -0.4115737, 0, 0.0627451, 1, 1,
0.3636251, -0.8757915, 2.774132, 0, 0.05882353, 1, 1,
0.3652902, 0.8653998, -0.6266366, 0, 0.05098039, 1, 1,
0.3670074, 0.1989335, 2.879178, 0, 0.04705882, 1, 1,
0.3692523, -0.3267429, 1.953803, 0, 0.03921569, 1, 1,
0.3704517, 0.2805941, 1.624527, 0, 0.03529412, 1, 1,
0.3724448, -0.3081977, 0.685584, 0, 0.02745098, 1, 1,
0.3774009, 1.637368, 0.0657975, 0, 0.02352941, 1, 1,
0.3779511, 0.4338755, -0.5883798, 0, 0.01568628, 1, 1,
0.3872485, -1.085797, 4.30668, 0, 0.01176471, 1, 1,
0.3873967, -1.381822, 4.153242, 0, 0.003921569, 1, 1,
0.3875841, -1.449045, 1.640493, 0.003921569, 0, 1, 1,
0.3909684, -0.5425857, 2.810382, 0.007843138, 0, 1, 1,
0.3911625, 0.6203613, -0.3220719, 0.01568628, 0, 1, 1,
0.3913557, -1.428694, 2.056763, 0.01960784, 0, 1, 1,
0.3957211, 0.6152511, 0.9599133, 0.02745098, 0, 1, 1,
0.3969239, -0.4619354, 2.293001, 0.03137255, 0, 1, 1,
0.3988305, 0.1718425, -0.03104155, 0.03921569, 0, 1, 1,
0.4031007, -0.9086248, 1.169962, 0.04313726, 0, 1, 1,
0.4052073, 1.457272, 0.05753291, 0.05098039, 0, 1, 1,
0.4097784, 0.8239041, 0.2489724, 0.05490196, 0, 1, 1,
0.4144959, -1.138853, 4.476586, 0.0627451, 0, 1, 1,
0.4159552, -1.226834, 1.113296, 0.06666667, 0, 1, 1,
0.421145, 0.2729045, 1.387399, 0.07450981, 0, 1, 1,
0.423095, -0.2147439, 1.727687, 0.07843138, 0, 1, 1,
0.4233661, 1.74125, -0.4133522, 0.08627451, 0, 1, 1,
0.4251684, -0.2876202, 1.72373, 0.09019608, 0, 1, 1,
0.427112, 0.5028849, -0.4001616, 0.09803922, 0, 1, 1,
0.4335913, 0.8548779, 1.537437, 0.1058824, 0, 1, 1,
0.4340456, 0.5414221, 0.3215571, 0.1098039, 0, 1, 1,
0.4372164, 0.8033224, 1.695357, 0.1176471, 0, 1, 1,
0.4377863, 0.9538496, 0.2683911, 0.1215686, 0, 1, 1,
0.4379984, 1.35224, 2.409803, 0.1294118, 0, 1, 1,
0.4398315, -1.246877, 2.222548, 0.1333333, 0, 1, 1,
0.4399301, -0.2419087, 3.932179, 0.1411765, 0, 1, 1,
0.444863, -1.748643, 2.624537, 0.145098, 0, 1, 1,
0.4490472, 0.6648213, -0.5309072, 0.1529412, 0, 1, 1,
0.4525514, 0.8633535, 1.00304, 0.1568628, 0, 1, 1,
0.4556671, 0.4020557, 0.2855725, 0.1647059, 0, 1, 1,
0.461083, -3.014394, 3.92367, 0.1686275, 0, 1, 1,
0.4634545, -0.4869221, 1.284361, 0.1764706, 0, 1, 1,
0.4637132, -0.3240642, 1.125959, 0.1803922, 0, 1, 1,
0.46746, 0.5486467, -1.946463, 0.1882353, 0, 1, 1,
0.4682635, 0.867175, 0.490191, 0.1921569, 0, 1, 1,
0.4721135, -0.2937765, 2.504165, 0.2, 0, 1, 1,
0.4728578, -0.2901747, 2.20911, 0.2078431, 0, 1, 1,
0.4767389, -1.236787, 2.502123, 0.2117647, 0, 1, 1,
0.4806977, -0.182081, 1.506686, 0.2196078, 0, 1, 1,
0.481111, 1.85929, 0.9794807, 0.2235294, 0, 1, 1,
0.487078, 0.5609452, 0.5039456, 0.2313726, 0, 1, 1,
0.4871026, -0.5314924, 2.596569, 0.2352941, 0, 1, 1,
0.4909334, -1.987499, 2.909678, 0.2431373, 0, 1, 1,
0.4918756, 0.6969751, -0.1430115, 0.2470588, 0, 1, 1,
0.4920532, -0.177528, 1.26206, 0.254902, 0, 1, 1,
0.4928073, 0.6876011, 1.313466, 0.2588235, 0, 1, 1,
0.4983701, 0.1549133, -0.408848, 0.2666667, 0, 1, 1,
0.5019474, -0.1939782, -0.2161661, 0.2705882, 0, 1, 1,
0.505269, 0.4243333, 0.3929213, 0.2784314, 0, 1, 1,
0.5052717, 1.024427, -0.7476696, 0.282353, 0, 1, 1,
0.507557, -1.184785, 2.289697, 0.2901961, 0, 1, 1,
0.5146657, -1.883303, 3.387349, 0.2941177, 0, 1, 1,
0.518771, -0.4319783, 2.558695, 0.3019608, 0, 1, 1,
0.5191159, -0.4032884, 2.210947, 0.3098039, 0, 1, 1,
0.5194974, 2.649866, 0.5715837, 0.3137255, 0, 1, 1,
0.5221004, -0.9231514, 1.651764, 0.3215686, 0, 1, 1,
0.5225861, 0.3778665, 0.2061534, 0.3254902, 0, 1, 1,
0.5274772, -0.7817696, 3.237669, 0.3333333, 0, 1, 1,
0.5300119, 1.0053, 0.8570197, 0.3372549, 0, 1, 1,
0.5303457, 0.6527595, 1.475635, 0.345098, 0, 1, 1,
0.5319922, -0.07524608, 2.591011, 0.3490196, 0, 1, 1,
0.5358813, 1.058263, 0.9790519, 0.3568628, 0, 1, 1,
0.5374268, 0.7707667, 1.19185, 0.3607843, 0, 1, 1,
0.5377628, -0.8897395, 2.103643, 0.3686275, 0, 1, 1,
0.5391831, 0.2548359, 2.772396, 0.372549, 0, 1, 1,
0.5417556, 0.2969927, 0.7387478, 0.3803922, 0, 1, 1,
0.5532945, 1.022083, 0.7867436, 0.3843137, 0, 1, 1,
0.5554807, -0.2777017, 1.683078, 0.3921569, 0, 1, 1,
0.559635, 0.777342, 1.077453, 0.3960784, 0, 1, 1,
0.5651723, 1.473291, 0.5325347, 0.4039216, 0, 1, 1,
0.5661255, -1.677176, 4.641685, 0.4117647, 0, 1, 1,
0.581881, -0.08670077, 1.045988, 0.4156863, 0, 1, 1,
0.5824612, -0.02787664, -0.5634105, 0.4235294, 0, 1, 1,
0.5875933, 1.337188, 0.3751652, 0.427451, 0, 1, 1,
0.5940979, 0.6232476, 0.5049799, 0.4352941, 0, 1, 1,
0.5942054, 0.6579185, -1.237375, 0.4392157, 0, 1, 1,
0.5947695, -1.030102, 3.600649, 0.4470588, 0, 1, 1,
0.5966977, -0.7810688, 2.493457, 0.4509804, 0, 1, 1,
0.5972303, 0.4996231, 0.5182834, 0.4588235, 0, 1, 1,
0.6089758, -0.6460884, 2.483467, 0.4627451, 0, 1, 1,
0.6096041, 1.373263, -1.051167, 0.4705882, 0, 1, 1,
0.6126421, -0.3784616, 0.5933392, 0.4745098, 0, 1, 1,
0.6141512, 0.8318689, 0.8499509, 0.4823529, 0, 1, 1,
0.6142069, 0.5186505, 1.041458, 0.4862745, 0, 1, 1,
0.6142777, 0.3485039, 1.196891, 0.4941176, 0, 1, 1,
0.6153681, -1.432868, 3.043058, 0.5019608, 0, 1, 1,
0.6164743, -1.021761, 1.332676, 0.5058824, 0, 1, 1,
0.622296, -0.07570811, 1.115365, 0.5137255, 0, 1, 1,
0.6246631, -0.2883688, 2.037813, 0.5176471, 0, 1, 1,
0.6247281, -1.19547, 3.553281, 0.5254902, 0, 1, 1,
0.6296853, 0.05883424, 2.208702, 0.5294118, 0, 1, 1,
0.6310071, 0.2752083, 0.8364012, 0.5372549, 0, 1, 1,
0.6324798, -0.3483709, 3.093972, 0.5411765, 0, 1, 1,
0.6346053, -0.3695246, 1.018245, 0.5490196, 0, 1, 1,
0.6383901, -0.2956914, 2.334584, 0.5529412, 0, 1, 1,
0.6488649, 0.006014447, 0.3517277, 0.5607843, 0, 1, 1,
0.6547446, 1.154858, 0.7545557, 0.5647059, 0, 1, 1,
0.658946, -0.1661578, 2.065664, 0.572549, 0, 1, 1,
0.6627619, 0.8313602, 0.5396873, 0.5764706, 0, 1, 1,
0.6642391, 1.751638, -0.5601999, 0.5843138, 0, 1, 1,
0.6676988, 0.5374019, 1.624909, 0.5882353, 0, 1, 1,
0.6695725, -2.2616, 2.908623, 0.5960785, 0, 1, 1,
0.6722894, -0.05349311, 2.211083, 0.6039216, 0, 1, 1,
0.672459, -0.04648107, 1.171442, 0.6078432, 0, 1, 1,
0.6830327, -1.179345, 1.017916, 0.6156863, 0, 1, 1,
0.6861746, -0.2432076, 5.008739, 0.6196079, 0, 1, 1,
0.6905001, -0.4478584, 1.032667, 0.627451, 0, 1, 1,
0.6953555, 0.3907996, 0.6485187, 0.6313726, 0, 1, 1,
0.6966296, -0.8505356, 4.032607, 0.6392157, 0, 1, 1,
0.704892, 0.1825206, 1.699418, 0.6431373, 0, 1, 1,
0.7089517, -0.1091497, 0.7415965, 0.6509804, 0, 1, 1,
0.7155011, 0.4982309, -0.7275406, 0.654902, 0, 1, 1,
0.7166988, -0.5989566, 1.980311, 0.6627451, 0, 1, 1,
0.720953, 0.3156739, 0.7119746, 0.6666667, 0, 1, 1,
0.7228566, -2.087774, 2.395222, 0.6745098, 0, 1, 1,
0.7289022, 0.2820866, 3.740936, 0.6784314, 0, 1, 1,
0.7301527, -1.908187, 1.450197, 0.6862745, 0, 1, 1,
0.7340328, -0.1412198, 1.478002, 0.6901961, 0, 1, 1,
0.739579, 0.5172743, -0.08520582, 0.6980392, 0, 1, 1,
0.7436799, -0.8539981, 3.849584, 0.7058824, 0, 1, 1,
0.7510202, 0.7514633, 0.202559, 0.7098039, 0, 1, 1,
0.7511742, 0.5219997, 0.4078274, 0.7176471, 0, 1, 1,
0.7522412, 0.9040162, 2.812963, 0.7215686, 0, 1, 1,
0.7553667, -0.558543, 2.016129, 0.7294118, 0, 1, 1,
0.7554647, -0.7710142, 2.107399, 0.7333333, 0, 1, 1,
0.7570029, -0.2145902, 1.518241, 0.7411765, 0, 1, 1,
0.7607375, -0.8819603, 0.657246, 0.7450981, 0, 1, 1,
0.76214, 0.3324064, 1.889459, 0.7529412, 0, 1, 1,
0.7653074, -0.250833, 1.135903, 0.7568628, 0, 1, 1,
0.7722461, -0.1544503, 2.094933, 0.7647059, 0, 1, 1,
0.7724672, -0.7436413, 2.461262, 0.7686275, 0, 1, 1,
0.7737072, 0.5639767, 1.362073, 0.7764706, 0, 1, 1,
0.7802626, 1.384602, -1.079822, 0.7803922, 0, 1, 1,
0.7819105, 0.9425597, -0.3471601, 0.7882353, 0, 1, 1,
0.7826822, 0.3705428, 1.237029, 0.7921569, 0, 1, 1,
0.7840649, 1.517133, 0.70035, 0.8, 0, 1, 1,
0.7852035, 0.4143136, 1.725352, 0.8078431, 0, 1, 1,
0.7917094, -0.7864044, 0.9920149, 0.8117647, 0, 1, 1,
0.7938232, 0.05680058, 1.084288, 0.8196079, 0, 1, 1,
0.7969473, 1.994624, -0.7198481, 0.8235294, 0, 1, 1,
0.7992437, -1.625846, 1.508833, 0.8313726, 0, 1, 1,
0.8007218, -0.6112524, 0.8075722, 0.8352941, 0, 1, 1,
0.8030974, -1.606466, 3.692098, 0.8431373, 0, 1, 1,
0.8044358, 1.947146, 2.281437, 0.8470588, 0, 1, 1,
0.8066466, -0.7743455, 3.157465, 0.854902, 0, 1, 1,
0.8096726, -0.6845993, 0.7811287, 0.8588235, 0, 1, 1,
0.8234141, -0.007867783, 2.015356, 0.8666667, 0, 1, 1,
0.8238513, -1.897433, 1.201237, 0.8705882, 0, 1, 1,
0.8319488, 0.03581299, 1.216717, 0.8784314, 0, 1, 1,
0.8381248, -0.009731684, 0.7023298, 0.8823529, 0, 1, 1,
0.8406078, 0.7882433, 1.326838, 0.8901961, 0, 1, 1,
0.8432397, 0.1048601, 1.010763, 0.8941177, 0, 1, 1,
0.843878, -0.9443477, 2.0902, 0.9019608, 0, 1, 1,
0.8459496, 0.3982792, 0.8630875, 0.9098039, 0, 1, 1,
0.8478388, -1.074847, 0.7220446, 0.9137255, 0, 1, 1,
0.8489245, 0.352584, 3.568075, 0.9215686, 0, 1, 1,
0.8546841, 3.227659, 1.904972, 0.9254902, 0, 1, 1,
0.858458, 0.1570638, 1.503465, 0.9333333, 0, 1, 1,
0.865667, 1.405413, 0.5338407, 0.9372549, 0, 1, 1,
0.8680826, -2.562118, 3.531329, 0.945098, 0, 1, 1,
0.8698756, 0.01907098, 1.274922, 0.9490196, 0, 1, 1,
0.873292, -0.8119403, 2.094295, 0.9568627, 0, 1, 1,
0.8755119, -0.1997683, 1.054494, 0.9607843, 0, 1, 1,
0.8765894, 0.9091131, 1.929059, 0.9686275, 0, 1, 1,
0.8772903, 0.4023556, 3.049481, 0.972549, 0, 1, 1,
0.8775148, -1.185973, 3.268689, 0.9803922, 0, 1, 1,
0.8784754, -1.445628, 0.2580273, 0.9843137, 0, 1, 1,
0.8789373, -0.1271944, 2.382672, 0.9921569, 0, 1, 1,
0.8915948, -0.01485283, 0.2493349, 0.9960784, 0, 1, 1,
0.8935488, 0.3616033, 1.229545, 1, 0, 0.9960784, 1,
0.895071, -1.412654, 1.240013, 1, 0, 0.9882353, 1,
0.8954102, -1.433066, 3.085619, 1, 0, 0.9843137, 1,
0.8985384, -0.6108236, 1.418058, 1, 0, 0.9764706, 1,
0.8991818, -0.6388572, 1.185292, 1, 0, 0.972549, 1,
0.8992378, -1.124716, 2.040837, 1, 0, 0.9647059, 1,
0.9007459, 0.2091099, 0.443682, 1, 0, 0.9607843, 1,
0.9026591, 1.132371, 1.341264, 1, 0, 0.9529412, 1,
0.903303, -0.9279925, 2.140317, 1, 0, 0.9490196, 1,
0.9054748, 0.2883371, 0.5499876, 1, 0, 0.9411765, 1,
0.9082837, 2.264777, 0.4781227, 1, 0, 0.9372549, 1,
0.9153759, -0.04324852, 2.158548, 1, 0, 0.9294118, 1,
0.9198073, 0.303022, 2.252638, 1, 0, 0.9254902, 1,
0.9258209, 0.3209789, 1.12518, 1, 0, 0.9176471, 1,
0.9283555, 0.6176077, 0.9945665, 1, 0, 0.9137255, 1,
0.9332716, 1.184115, 0.4782652, 1, 0, 0.9058824, 1,
0.9381901, 0.6894713, 1.836333, 1, 0, 0.9019608, 1,
0.9387929, 0.7442253, 1.561792, 1, 0, 0.8941177, 1,
0.9403727, -2.197175, 3.026655, 1, 0, 0.8862745, 1,
0.9498661, 0.429091, 0.7295321, 1, 0, 0.8823529, 1,
0.9506392, -1.32203, 3.821723, 1, 0, 0.8745098, 1,
0.9557222, -0.9575105, 3.237537, 1, 0, 0.8705882, 1,
0.9613171, 1.240093, 1.591013, 1, 0, 0.8627451, 1,
0.9656501, -0.03599834, 1.025608, 1, 0, 0.8588235, 1,
0.9726485, -0.1617531, 2.212157, 1, 0, 0.8509804, 1,
0.9821192, -0.1109384, 2.652392, 1, 0, 0.8470588, 1,
0.9961745, 0.2503709, 1.401758, 1, 0, 0.8392157, 1,
1.00092, -0.01764649, 4.321006, 1, 0, 0.8352941, 1,
1.001555, -0.9896343, 2.833774, 1, 0, 0.827451, 1,
1.003975, 1.060119, 8.290101e-05, 1, 0, 0.8235294, 1,
1.014649, 0.5600181, 0.9698898, 1, 0, 0.8156863, 1,
1.019736, -2.521825, 3.264025, 1, 0, 0.8117647, 1,
1.023523, 0.730029, 1.799093, 1, 0, 0.8039216, 1,
1.026652, 1.924894, -0.252715, 1, 0, 0.7960784, 1,
1.033782, -0.9514078, 1.849694, 1, 0, 0.7921569, 1,
1.034513, 0.03527779, 0.6813108, 1, 0, 0.7843137, 1,
1.038569, 1.168441, 0.8562098, 1, 0, 0.7803922, 1,
1.040099, -1.245811, 1.97243, 1, 0, 0.772549, 1,
1.049606, -1.124626, 4.825389, 1, 0, 0.7686275, 1,
1.050769, -0.767975, 2.202303, 1, 0, 0.7607843, 1,
1.051198, -0.6033179, 2.234586, 1, 0, 0.7568628, 1,
1.052871, -1.133559, 2.22596, 1, 0, 0.7490196, 1,
1.059321, -1.236606, 2.503054, 1, 0, 0.7450981, 1,
1.059919, -0.1359334, 1.046391, 1, 0, 0.7372549, 1,
1.062008, -0.5388278, 4.483292, 1, 0, 0.7333333, 1,
1.064334, -1.738755, 3.488328, 1, 0, 0.7254902, 1,
1.069398, -2.448775, 2.465649, 1, 0, 0.7215686, 1,
1.079707, 0.15914, 2.248277, 1, 0, 0.7137255, 1,
1.085427, -0.0498394, 2.490064, 1, 0, 0.7098039, 1,
1.102156, 0.1616979, 3.384016, 1, 0, 0.7019608, 1,
1.105511, 1.173222, -0.3928626, 1, 0, 0.6941177, 1,
1.114237, -1.821305, 3.229791, 1, 0, 0.6901961, 1,
1.123225, -1.312315, 3.11841, 1, 0, 0.682353, 1,
1.126966, -0.3230792, 2.850639, 1, 0, 0.6784314, 1,
1.137028, 0.7902719, 1.994606, 1, 0, 0.6705883, 1,
1.147667, 0.1324956, 2.156157, 1, 0, 0.6666667, 1,
1.149945, 0.2510962, 2.893901, 1, 0, 0.6588235, 1,
1.168074, 0.2234355, 0.9708701, 1, 0, 0.654902, 1,
1.17957, -0.4716578, 1.087886, 1, 0, 0.6470588, 1,
1.193827, 0.0487395, 2.112787, 1, 0, 0.6431373, 1,
1.198117, 0.134265, 0.848043, 1, 0, 0.6352941, 1,
1.198704, -0.9239039, 1.367766, 1, 0, 0.6313726, 1,
1.201705, 0.7636181, -0.4391187, 1, 0, 0.6235294, 1,
1.211807, -0.6089748, 1.584069, 1, 0, 0.6196079, 1,
1.212001, 1.223376, -0.3270398, 1, 0, 0.6117647, 1,
1.212592, -0.4777502, 1.933324, 1, 0, 0.6078432, 1,
1.213122, -0.02801495, 2.05144, 1, 0, 0.6, 1,
1.218843, -0.5240843, 1.612348, 1, 0, 0.5921569, 1,
1.232692, -0.07776108, 2.086816, 1, 0, 0.5882353, 1,
1.23697, 1.270298, -0.6131379, 1, 0, 0.5803922, 1,
1.238062, 0.9171389, 1.040104, 1, 0, 0.5764706, 1,
1.246635, 1.878807, 1.512592, 1, 0, 0.5686275, 1,
1.247433, -0.8197477, 1.555159, 1, 0, 0.5647059, 1,
1.250071, 0.2458208, -0.7241379, 1, 0, 0.5568628, 1,
1.254603, -0.7125899, 0.4766912, 1, 0, 0.5529412, 1,
1.261431, -2.050954, 2.898021, 1, 0, 0.5450981, 1,
1.267281, 0.7875071, 1.952917, 1, 0, 0.5411765, 1,
1.272667, -0.8832104, 3.45444, 1, 0, 0.5333334, 1,
1.283923, 0.9221959, 0.0264463, 1, 0, 0.5294118, 1,
1.287459, -0.4846131, 2.948335, 1, 0, 0.5215687, 1,
1.301573, -0.4794655, 2.903815, 1, 0, 0.5176471, 1,
1.30276, 0.6581329, 0.4510643, 1, 0, 0.509804, 1,
1.312674, -1.613682, 3.174491, 1, 0, 0.5058824, 1,
1.315318, -1.247979, 3.762453, 1, 0, 0.4980392, 1,
1.315403, -0.3454871, 1.726082, 1, 0, 0.4901961, 1,
1.317229, -1.662685, 2.894013, 1, 0, 0.4862745, 1,
1.318918, -1.170336, 2.177327, 1, 0, 0.4784314, 1,
1.342446, -0.3452922, 0.7175381, 1, 0, 0.4745098, 1,
1.345929, -0.4969376, 3.214643, 1, 0, 0.4666667, 1,
1.352334, -0.6629959, 0.9585961, 1, 0, 0.4627451, 1,
1.353485, -0.5136746, 1.64592, 1, 0, 0.454902, 1,
1.354797, 0.9367818, 1.777652, 1, 0, 0.4509804, 1,
1.355386, -0.7840152, 2.582787, 1, 0, 0.4431373, 1,
1.359971, 3.203426, 0.285832, 1, 0, 0.4392157, 1,
1.364249, -0.9658865, 1.639149, 1, 0, 0.4313726, 1,
1.365795, 0.9022475, 1.631042, 1, 0, 0.427451, 1,
1.36671, -1.100366, 3.43674, 1, 0, 0.4196078, 1,
1.369157, -0.06216332, 0.6852615, 1, 0, 0.4156863, 1,
1.370816, 0.3788266, 0.4177482, 1, 0, 0.4078431, 1,
1.38134, -2.054966, 2.330307, 1, 0, 0.4039216, 1,
1.38924, 0.1339122, 0.9005129, 1, 0, 0.3960784, 1,
1.395763, 0.268416, 2.244859, 1, 0, 0.3882353, 1,
1.411458, -0.2735606, 3.376608, 1, 0, 0.3843137, 1,
1.417668, 0.7536737, 1.354129, 1, 0, 0.3764706, 1,
1.423283, 1.313866, -0.1534508, 1, 0, 0.372549, 1,
1.431894, -0.4010869, 3.024529, 1, 0, 0.3647059, 1,
1.440243, -0.6816128, 1.293486, 1, 0, 0.3607843, 1,
1.442459, 0.554436, 3.039963, 1, 0, 0.3529412, 1,
1.457822, -0.1756763, 0.5577787, 1, 0, 0.3490196, 1,
1.462338, 1.201389, 2.612154, 1, 0, 0.3411765, 1,
1.464467, -1.435099, 3.745493, 1, 0, 0.3372549, 1,
1.483028, 0.590295, 1.049343, 1, 0, 0.3294118, 1,
1.484518, 0.2584242, 1.72479, 1, 0, 0.3254902, 1,
1.485523, -0.1987861, 2.340971, 1, 0, 0.3176471, 1,
1.488136, 1.180169, 0.4627078, 1, 0, 0.3137255, 1,
1.488185, -0.4742786, 2.825902, 1, 0, 0.3058824, 1,
1.492873, 0.3043777, 1.653649, 1, 0, 0.2980392, 1,
1.492905, 0.441913, 1.734576, 1, 0, 0.2941177, 1,
1.502584, 0.3244463, 1.291272, 1, 0, 0.2862745, 1,
1.529725, -0.7957129, 1.436639, 1, 0, 0.282353, 1,
1.556291, -0.4781556, 2.152994, 1, 0, 0.2745098, 1,
1.586216, 1.269988, -1.411082, 1, 0, 0.2705882, 1,
1.61633, 2.201871, 0.7954336, 1, 0, 0.2627451, 1,
1.628049, 0.8100585, 2.07762, 1, 0, 0.2588235, 1,
1.663688, 1.252498, 0.1622069, 1, 0, 0.2509804, 1,
1.691623, 2.119604, 1.404159, 1, 0, 0.2470588, 1,
1.71002, 0.2062987, 1.539714, 1, 0, 0.2392157, 1,
1.716193, 1.58361, 0.1487652, 1, 0, 0.2352941, 1,
1.75849, 0.407569, 1.800161, 1, 0, 0.227451, 1,
1.779673, 1.484138, 1.178278, 1, 0, 0.2235294, 1,
1.847525, 2.296119, 0.4245957, 1, 0, 0.2156863, 1,
1.853592, -0.271365, 3.956917, 1, 0, 0.2117647, 1,
1.87762, -1.310949, 2.224737, 1, 0, 0.2039216, 1,
1.905278, -0.6598718, 2.141815, 1, 0, 0.1960784, 1,
1.915682, -0.2213551, 2.15466, 1, 0, 0.1921569, 1,
1.968913, -0.8361225, 2.35109, 1, 0, 0.1843137, 1,
1.970307, 1.202572, 0.3236089, 1, 0, 0.1803922, 1,
1.998469, -0.008789207, 2.490429, 1, 0, 0.172549, 1,
1.999634, 0.08575397, 1.202659, 1, 0, 0.1686275, 1,
2.031862, 2.222665, 2.041399, 1, 0, 0.1607843, 1,
2.037146, 0.9603246, -0.8957915, 1, 0, 0.1568628, 1,
2.038229, 0.6142053, 0.688737, 1, 0, 0.1490196, 1,
2.109307, -0.07909188, 2.131031, 1, 0, 0.145098, 1,
2.144446, 0.610469, 0.8449043, 1, 0, 0.1372549, 1,
2.166817, 0.4464863, 1.087716, 1, 0, 0.1333333, 1,
2.18911, -0.5478871, 0.98628, 1, 0, 0.1254902, 1,
2.21729, 0.7079719, 2.802082, 1, 0, 0.1215686, 1,
2.222929, -0.8874269, 1.298412, 1, 0, 0.1137255, 1,
2.224438, -0.1155961, 1.180534, 1, 0, 0.1098039, 1,
2.233857, -1.145212, 2.301177, 1, 0, 0.1019608, 1,
2.256557, 0.3867928, 1.701464, 1, 0, 0.09411765, 1,
2.260111, -0.3312438, 2.777121, 1, 0, 0.09019608, 1,
2.264369, -2.613142, 4.024467, 1, 0, 0.08235294, 1,
2.26644, 0.6376863, 0.9674833, 1, 0, 0.07843138, 1,
2.268644, -0.4285452, 3.948877, 1, 0, 0.07058824, 1,
2.311529, 0.1931299, 0.1630314, 1, 0, 0.06666667, 1,
2.367939, -0.5536512, 1.453896, 1, 0, 0.05882353, 1,
2.414242, -0.04253079, -0.08585653, 1, 0, 0.05490196, 1,
2.463694, -1.26157, 0.4922169, 1, 0, 0.04705882, 1,
2.68147, 0.1163613, 0.04992425, 1, 0, 0.04313726, 1,
2.709567, 1.731447, 1.80326, 1, 0, 0.03529412, 1,
2.76848, -0.8544759, 2.082759, 1, 0, 0.03137255, 1,
2.850342, -0.5422387, 3.277649, 1, 0, 0.02352941, 1,
2.965202, 0.6369416, 2.215373, 1, 0, 0.01960784, 1,
3.037972, 0.6041271, 1.478382, 1, 0, 0.01176471, 1,
3.40631, -0.2350679, 2.328928, 1, 0, 0.007843138, 1
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
0.361504, -4.168497, -7.437132, 0, -0.5, 0.5, 0.5,
0.361504, -4.168497, -7.437132, 1, -0.5, 0.5, 0.5,
0.361504, -4.168497, -7.437132, 1, 1.5, 0.5, 0.5,
0.361504, -4.168497, -7.437132, 0, 1.5, 0.5, 0.5
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
-3.715491, 0.0655576, -7.437132, 0, -0.5, 0.5, 0.5,
-3.715491, 0.0655576, -7.437132, 1, -0.5, 0.5, 0.5,
-3.715491, 0.0655576, -7.437132, 1, 1.5, 0.5, 0.5,
-3.715491, 0.0655576, -7.437132, 0, 1.5, 0.5, 0.5
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
-3.715491, -4.168497, 0.172153, 0, -0.5, 0.5, 0.5,
-3.715491, -4.168497, 0.172153, 1, -0.5, 0.5, 0.5,
-3.715491, -4.168497, 0.172153, 1, 1.5, 0.5, 0.5,
-3.715491, -4.168497, 0.172153, 0, 1.5, 0.5, 0.5
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
-2, -3.191407, -5.681144,
3, -3.191407, -5.681144,
-2, -3.191407, -5.681144,
-2, -3.354256, -5.973808,
-1, -3.191407, -5.681144,
-1, -3.354256, -5.973808,
0, -3.191407, -5.681144,
0, -3.354256, -5.973808,
1, -3.191407, -5.681144,
1, -3.354256, -5.973808,
2, -3.191407, -5.681144,
2, -3.354256, -5.973808,
3, -3.191407, -5.681144,
3, -3.354256, -5.973808
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
-2, -3.679952, -6.559138, 0, -0.5, 0.5, 0.5,
-2, -3.679952, -6.559138, 1, -0.5, 0.5, 0.5,
-2, -3.679952, -6.559138, 1, 1.5, 0.5, 0.5,
-2, -3.679952, -6.559138, 0, 1.5, 0.5, 0.5,
-1, -3.679952, -6.559138, 0, -0.5, 0.5, 0.5,
-1, -3.679952, -6.559138, 1, -0.5, 0.5, 0.5,
-1, -3.679952, -6.559138, 1, 1.5, 0.5, 0.5,
-1, -3.679952, -6.559138, 0, 1.5, 0.5, 0.5,
0, -3.679952, -6.559138, 0, -0.5, 0.5, 0.5,
0, -3.679952, -6.559138, 1, -0.5, 0.5, 0.5,
0, -3.679952, -6.559138, 1, 1.5, 0.5, 0.5,
0, -3.679952, -6.559138, 0, 1.5, 0.5, 0.5,
1, -3.679952, -6.559138, 0, -0.5, 0.5, 0.5,
1, -3.679952, -6.559138, 1, -0.5, 0.5, 0.5,
1, -3.679952, -6.559138, 1, 1.5, 0.5, 0.5,
1, -3.679952, -6.559138, 0, 1.5, 0.5, 0.5,
2, -3.679952, -6.559138, 0, -0.5, 0.5, 0.5,
2, -3.679952, -6.559138, 1, -0.5, 0.5, 0.5,
2, -3.679952, -6.559138, 1, 1.5, 0.5, 0.5,
2, -3.679952, -6.559138, 0, 1.5, 0.5, 0.5,
3, -3.679952, -6.559138, 0, -0.5, 0.5, 0.5,
3, -3.679952, -6.559138, 1, -0.5, 0.5, 0.5,
3, -3.679952, -6.559138, 1, 1.5, 0.5, 0.5,
3, -3.679952, -6.559138, 0, 1.5, 0.5, 0.5
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
-2.774646, -3, -5.681144,
-2.774646, 3, -5.681144,
-2.774646, -3, -5.681144,
-2.931453, -3, -5.973808,
-2.774646, -2, -5.681144,
-2.931453, -2, -5.973808,
-2.774646, -1, -5.681144,
-2.931453, -1, -5.973808,
-2.774646, 0, -5.681144,
-2.931453, 0, -5.973808,
-2.774646, 1, -5.681144,
-2.931453, 1, -5.973808,
-2.774646, 2, -5.681144,
-2.931453, 2, -5.973808,
-2.774646, 3, -5.681144,
-2.931453, 3, -5.973808
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
-3.245068, -3, -6.559138, 0, -0.5, 0.5, 0.5,
-3.245068, -3, -6.559138, 1, -0.5, 0.5, 0.5,
-3.245068, -3, -6.559138, 1, 1.5, 0.5, 0.5,
-3.245068, -3, -6.559138, 0, 1.5, 0.5, 0.5,
-3.245068, -2, -6.559138, 0, -0.5, 0.5, 0.5,
-3.245068, -2, -6.559138, 1, -0.5, 0.5, 0.5,
-3.245068, -2, -6.559138, 1, 1.5, 0.5, 0.5,
-3.245068, -2, -6.559138, 0, 1.5, 0.5, 0.5,
-3.245068, -1, -6.559138, 0, -0.5, 0.5, 0.5,
-3.245068, -1, -6.559138, 1, -0.5, 0.5, 0.5,
-3.245068, -1, -6.559138, 1, 1.5, 0.5, 0.5,
-3.245068, -1, -6.559138, 0, 1.5, 0.5, 0.5,
-3.245068, 0, -6.559138, 0, -0.5, 0.5, 0.5,
-3.245068, 0, -6.559138, 1, -0.5, 0.5, 0.5,
-3.245068, 0, -6.559138, 1, 1.5, 0.5, 0.5,
-3.245068, 0, -6.559138, 0, 1.5, 0.5, 0.5,
-3.245068, 1, -6.559138, 0, -0.5, 0.5, 0.5,
-3.245068, 1, -6.559138, 1, -0.5, 0.5, 0.5,
-3.245068, 1, -6.559138, 1, 1.5, 0.5, 0.5,
-3.245068, 1, -6.559138, 0, 1.5, 0.5, 0.5,
-3.245068, 2, -6.559138, 0, -0.5, 0.5, 0.5,
-3.245068, 2, -6.559138, 1, -0.5, 0.5, 0.5,
-3.245068, 2, -6.559138, 1, 1.5, 0.5, 0.5,
-3.245068, 2, -6.559138, 0, 1.5, 0.5, 0.5,
-3.245068, 3, -6.559138, 0, -0.5, 0.5, 0.5,
-3.245068, 3, -6.559138, 1, -0.5, 0.5, 0.5,
-3.245068, 3, -6.559138, 1, 1.5, 0.5, 0.5,
-3.245068, 3, -6.559138, 0, 1.5, 0.5, 0.5
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
-2.774646, -3.191407, -4,
-2.774646, -3.191407, 4,
-2.774646, -3.191407, -4,
-2.931453, -3.354256, -4,
-2.774646, -3.191407, -2,
-2.931453, -3.354256, -2,
-2.774646, -3.191407, 0,
-2.931453, -3.354256, 0,
-2.774646, -3.191407, 2,
-2.931453, -3.354256, 2,
-2.774646, -3.191407, 4,
-2.931453, -3.354256, 4
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
-3.245068, -3.679952, -4, 0, -0.5, 0.5, 0.5,
-3.245068, -3.679952, -4, 1, -0.5, 0.5, 0.5,
-3.245068, -3.679952, -4, 1, 1.5, 0.5, 0.5,
-3.245068, -3.679952, -4, 0, 1.5, 0.5, 0.5,
-3.245068, -3.679952, -2, 0, -0.5, 0.5, 0.5,
-3.245068, -3.679952, -2, 1, -0.5, 0.5, 0.5,
-3.245068, -3.679952, -2, 1, 1.5, 0.5, 0.5,
-3.245068, -3.679952, -2, 0, 1.5, 0.5, 0.5,
-3.245068, -3.679952, 0, 0, -0.5, 0.5, 0.5,
-3.245068, -3.679952, 0, 1, -0.5, 0.5, 0.5,
-3.245068, -3.679952, 0, 1, 1.5, 0.5, 0.5,
-3.245068, -3.679952, 0, 0, 1.5, 0.5, 0.5,
-3.245068, -3.679952, 2, 0, -0.5, 0.5, 0.5,
-3.245068, -3.679952, 2, 1, -0.5, 0.5, 0.5,
-3.245068, -3.679952, 2, 1, 1.5, 0.5, 0.5,
-3.245068, -3.679952, 2, 0, 1.5, 0.5, 0.5,
-3.245068, -3.679952, 4, 0, -0.5, 0.5, 0.5,
-3.245068, -3.679952, 4, 1, -0.5, 0.5, 0.5,
-3.245068, -3.679952, 4, 1, 1.5, 0.5, 0.5,
-3.245068, -3.679952, 4, 0, 1.5, 0.5, 0.5
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
-2.774646, -3.191407, -5.681144,
-2.774646, 3.322522, -5.681144,
-2.774646, -3.191407, 6.02545,
-2.774646, 3.322522, 6.02545,
-2.774646, -3.191407, -5.681144,
-2.774646, -3.191407, 6.02545,
-2.774646, 3.322522, -5.681144,
-2.774646, 3.322522, 6.02545,
-2.774646, -3.191407, -5.681144,
3.497654, -3.191407, -5.681144,
-2.774646, -3.191407, 6.02545,
3.497654, -3.191407, 6.02545,
-2.774646, 3.322522, -5.681144,
3.497654, 3.322522, -5.681144,
-2.774646, 3.322522, 6.02545,
3.497654, 3.322522, 6.02545,
3.497654, -3.191407, -5.681144,
3.497654, 3.322522, -5.681144,
3.497654, -3.191407, 6.02545,
3.497654, 3.322522, 6.02545,
3.497654, -3.191407, -5.681144,
3.497654, -3.191407, 6.02545,
3.497654, 3.322522, -5.681144,
3.497654, 3.322522, 6.02545
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
var radius = 7.898895;
var distance = 35.14308;
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
mvMatrix.translate( -0.361504, -0.0655576, -0.172153 );
mvMatrix.scale( 1.361612, 1.311104, 0.729541 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.14308);
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
ronnel<-read.table("ronnel.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-ronnel$V2
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
```

```r
y<-ronnel$V3
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
```

```r
z<-ronnel$V4
```

```
## Error in eval(expr, envir, enclos): object 'ronnel' not found
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
-2.683302, 1.072589, -2.663882, 0, 0, 1, 1, 1,
-2.630834, -0.4062774, -0.9836204, 1, 0, 0, 1, 1,
-2.523563, -1.212008, -3.457476, 1, 0, 0, 1, 1,
-2.458384, 1.601401, -1.954575, 1, 0, 0, 1, 1,
-2.427879, -1.500113, -1.771803, 1, 0, 0, 1, 1,
-2.337904, 0.3846621, -2.106995, 1, 0, 0, 1, 1,
-2.337485, 0.2974225, -1.699118, 0, 0, 0, 1, 1,
-2.158297, -2.787649, -2.565922, 0, 0, 0, 1, 1,
-2.117306, 0.7807789, -1.999264, 0, 0, 0, 1, 1,
-2.112924, 0.5672271, -0.2096244, 0, 0, 0, 1, 1,
-2.078044, 0.7654086, -1.996308, 0, 0, 0, 1, 1,
-1.963598, -0.4221005, -3.258387, 0, 0, 0, 1, 1,
-1.949719, 0.7682526, -1.513497, 0, 0, 0, 1, 1,
-1.927498, 1.006834, 0.1203954, 1, 1, 1, 1, 1,
-1.918983, 1.451056, 0.02040425, 1, 1, 1, 1, 1,
-1.913416, -0.1766201, -3.132873, 1, 1, 1, 1, 1,
-1.908671, 0.01729673, -0.5212073, 1, 1, 1, 1, 1,
-1.898155, -0.445868, -2.979016, 1, 1, 1, 1, 1,
-1.88846, -0.8687596, -2.178543, 1, 1, 1, 1, 1,
-1.887042, 0.5291086, 0.5430064, 1, 1, 1, 1, 1,
-1.878621, -0.07793844, -2.30746, 1, 1, 1, 1, 1,
-1.848317, 0.5676026, -0.4940158, 1, 1, 1, 1, 1,
-1.807299, 0.4700177, -1.973201, 1, 1, 1, 1, 1,
-1.795632, -0.4372315, -3.483162, 1, 1, 1, 1, 1,
-1.791889, -0.1115919, -0.3802147, 1, 1, 1, 1, 1,
-1.776601, -0.5277697, -3.04354, 1, 1, 1, 1, 1,
-1.73772, 0.3286241, -2.24224, 1, 1, 1, 1, 1,
-1.734715, 2.262817, -1.152936, 1, 1, 1, 1, 1,
-1.727177, 0.5712245, -0.7641989, 0, 0, 1, 1, 1,
-1.708423, -1.468571, -2.283235, 1, 0, 0, 1, 1,
-1.706728, 1.691196, -2.490634, 1, 0, 0, 1, 1,
-1.698546, -0.1335485, -0.7206951, 1, 0, 0, 1, 1,
-1.694525, 1.03001, -2.186874, 1, 0, 0, 1, 1,
-1.689233, -0.8300399, -1.882351, 1, 0, 0, 1, 1,
-1.683667, 1.641126, -0.6171102, 0, 0, 0, 1, 1,
-1.647301, -0.8296824, -2.676796, 0, 0, 0, 1, 1,
-1.630726, 1.188367, -1.10668, 0, 0, 0, 1, 1,
-1.629915, -1.999373, -1.33353, 0, 0, 0, 1, 1,
-1.60982, -0.5485938, -1.867713, 0, 0, 0, 1, 1,
-1.605759, -0.7650134, -1.017585, 0, 0, 0, 1, 1,
-1.584368, 0.9181232, -1.162548, 0, 0, 0, 1, 1,
-1.579411, -0.02964854, -3.019904, 1, 1, 1, 1, 1,
-1.561333, -0.5260765, -1.48776, 1, 1, 1, 1, 1,
-1.556173, 0.5108186, -1.676426, 1, 1, 1, 1, 1,
-1.554856, -0.2562791, -2.282728, 1, 1, 1, 1, 1,
-1.549422, 0.1959386, -1.092083, 1, 1, 1, 1, 1,
-1.544882, -0.09813064, -1.772648, 1, 1, 1, 1, 1,
-1.533069, -1.397992, -0.2873533, 1, 1, 1, 1, 1,
-1.514464, -0.9268457, -2.948992, 1, 1, 1, 1, 1,
-1.512761, 1.799329, 1.277269, 1, 1, 1, 1, 1,
-1.499601, 0.05160317, -2.533734, 1, 1, 1, 1, 1,
-1.499566, 0.3615912, -1.465103, 1, 1, 1, 1, 1,
-1.48833, 2.378321, -0.3676287, 1, 1, 1, 1, 1,
-1.487585, 0.5022247, -2.408769, 1, 1, 1, 1, 1,
-1.477051, 0.4340183, -3.037758, 1, 1, 1, 1, 1,
-1.476225, -0.1433005, 0.009705557, 1, 1, 1, 1, 1,
-1.47447, -0.3914063, -1.99846, 0, 0, 1, 1, 1,
-1.452759, 1.361017, -2.00121, 1, 0, 0, 1, 1,
-1.452114, -0.1043784, -3.066359, 1, 0, 0, 1, 1,
-1.44896, -1.072412, -0.5968413, 1, 0, 0, 1, 1,
-1.441286, -0.5525571, -0.7621784, 1, 0, 0, 1, 1,
-1.428327, 1.472771, -0.03813726, 1, 0, 0, 1, 1,
-1.413766, 0.9787402, -4.254513, 0, 0, 0, 1, 1,
-1.407492, 0.1038934, -1.191513, 0, 0, 0, 1, 1,
-1.407275, -0.8263541, -4.537277, 0, 0, 0, 1, 1,
-1.400833, 0.7912794, -1.521487, 0, 0, 0, 1, 1,
-1.391832, -2.007825, -4.06051, 0, 0, 0, 1, 1,
-1.391093, 0.7983452, -0.1847696, 0, 0, 0, 1, 1,
-1.38771, 0.2749422, -0.2500405, 0, 0, 0, 1, 1,
-1.382411, -0.08223067, -0.943442, 1, 1, 1, 1, 1,
-1.382101, 1.254617, 1.156996, 1, 1, 1, 1, 1,
-1.381108, -0.5433077, -2.054391, 1, 1, 1, 1, 1,
-1.368948, 1.600639, -1.061909, 1, 1, 1, 1, 1,
-1.365084, 0.09513614, -2.426905, 1, 1, 1, 1, 1,
-1.358693, 0.2990378, -0.7116155, 1, 1, 1, 1, 1,
-1.341515, -0.539256, -1.882803, 1, 1, 1, 1, 1,
-1.337126, 1.110704, -0.1040378, 1, 1, 1, 1, 1,
-1.335651, 0.4015279, -0.5792496, 1, 1, 1, 1, 1,
-1.331387, -0.1761078, -1.401281, 1, 1, 1, 1, 1,
-1.322161, 0.6940971, -1.175211, 1, 1, 1, 1, 1,
-1.321735, 0.1004003, -1.011783, 1, 1, 1, 1, 1,
-1.317735, 1.463286, 0.9486213, 1, 1, 1, 1, 1,
-1.317486, 3.020039, -0.7196947, 1, 1, 1, 1, 1,
-1.306261, -0.1351957, -1.829106, 1, 1, 1, 1, 1,
-1.302285, 0.7775453, -0.781094, 0, 0, 1, 1, 1,
-1.298453, 2.488685, -2.15169, 1, 0, 0, 1, 1,
-1.298291, -0.2042395, -1.367218, 1, 0, 0, 1, 1,
-1.296807, -0.6250847, -1.3234, 1, 0, 0, 1, 1,
-1.296255, 0.2367841, -3.017191, 1, 0, 0, 1, 1,
-1.295077, 1.136775, -0.4119048, 1, 0, 0, 1, 1,
-1.274435, 0.4923311, -1.671531, 0, 0, 0, 1, 1,
-1.27143, 0.2957601, -2.208068, 0, 0, 0, 1, 1,
-1.26915, 0.5540667, -0.4778559, 0, 0, 0, 1, 1,
-1.269149, 0.95836, -1.220488, 0, 0, 0, 1, 1,
-1.266419, -0.7572293, -2.475556, 0, 0, 0, 1, 1,
-1.259761, -1.877141, -3.177358, 0, 0, 0, 1, 1,
-1.25956, -0.9520853, -2.258319, 0, 0, 0, 1, 1,
-1.257245, -1.021272, -1.651952, 1, 1, 1, 1, 1,
-1.250192, -0.4064223, -0.2059714, 1, 1, 1, 1, 1,
-1.248885, -0.9241409, -0.8875152, 1, 1, 1, 1, 1,
-1.244345, -2.122875, -3.718801, 1, 1, 1, 1, 1,
-1.236462, 0.3415025, 0.6917672, 1, 1, 1, 1, 1,
-1.231202, 0.2608558, -2.024452, 1, 1, 1, 1, 1,
-1.226878, 1.674342, -0.3316846, 1, 1, 1, 1, 1,
-1.224553, 1.128575, -1.656427, 1, 1, 1, 1, 1,
-1.22058, -0.4608344, -3.1065, 1, 1, 1, 1, 1,
-1.219974, 0.5492998, 0.9547868, 1, 1, 1, 1, 1,
-1.213043, 0.4909817, -0.1935853, 1, 1, 1, 1, 1,
-1.210519, 0.3987329, -2.485184, 1, 1, 1, 1, 1,
-1.209413, 1.188663, -0.2423735, 1, 1, 1, 1, 1,
-1.208992, -0.806837, -1.889599, 1, 1, 1, 1, 1,
-1.204558, 0.1830294, 1.169745, 1, 1, 1, 1, 1,
-1.204505, -2.889751, -3.136967, 0, 0, 1, 1, 1,
-1.203227, 0.1229253, -2.694368, 1, 0, 0, 1, 1,
-1.194514, -0.7681884, -2.749376, 1, 0, 0, 1, 1,
-1.192363, 0.5832021, -2.899123, 1, 0, 0, 1, 1,
-1.189844, 1.126634, -1.343307, 1, 0, 0, 1, 1,
-1.188841, -0.4850951, -1.03465, 1, 0, 0, 1, 1,
-1.185838, -1.941942, -0.8205693, 0, 0, 0, 1, 1,
-1.167334, 0.5341645, -0.1136845, 0, 0, 0, 1, 1,
-1.167098, 0.2483209, -0.9010663, 0, 0, 0, 1, 1,
-1.166589, 1.289268, 0.1505953, 0, 0, 0, 1, 1,
-1.160996, -0.5680636, -2.220241, 0, 0, 0, 1, 1,
-1.158135, 0.8032079, -1.492234, 0, 0, 0, 1, 1,
-1.15671, -1.659584, -1.956033, 0, 0, 0, 1, 1,
-1.153264, 2.496032, 0.02246594, 1, 1, 1, 1, 1,
-1.133469, -1.446199, -2.788119, 1, 1, 1, 1, 1,
-1.131845, 0.01347702, -1.227599, 1, 1, 1, 1, 1,
-1.130212, -1.0537, -2.506965, 1, 1, 1, 1, 1,
-1.126306, 0.8567499, 0.1440127, 1, 1, 1, 1, 1,
-1.121119, 0.5314608, -0.1050344, 1, 1, 1, 1, 1,
-1.120107, 0.2377993, -1.15254, 1, 1, 1, 1, 1,
-1.120033, -0.8328744, -1.858786, 1, 1, 1, 1, 1,
-1.11828, -1.668296, -1.979567, 1, 1, 1, 1, 1,
-1.110026, -0.73345, -2.221176, 1, 1, 1, 1, 1,
-1.10682, -0.8255355, -0.1484331, 1, 1, 1, 1, 1,
-1.105073, 0.3187036, -0.6738899, 1, 1, 1, 1, 1,
-1.10428, -1.512401, -2.673632, 1, 1, 1, 1, 1,
-1.102445, -0.7421368, -2.158616, 1, 1, 1, 1, 1,
-1.092147, 0.6625835, -0.2616619, 1, 1, 1, 1, 1,
-1.090912, -2.514219, -1.881921, 0, 0, 1, 1, 1,
-1.089486, 0.4110554, -2.356793, 1, 0, 0, 1, 1,
-1.086761, 0.1541181, -1.974035, 1, 0, 0, 1, 1,
-1.086097, -0.2689598, -2.484559, 1, 0, 0, 1, 1,
-1.06933, -0.5972019, -2.554741, 1, 0, 0, 1, 1,
-1.067038, -0.2989076, 0.113392, 1, 0, 0, 1, 1,
-1.06408, 1.477964, -2.688414, 0, 0, 0, 1, 1,
-1.061196, 1.869718, -0.3584854, 0, 0, 0, 1, 1,
-1.059682, -0.2016271, -2.939743, 0, 0, 0, 1, 1,
-1.058681, 0.1015589, -1.186848, 0, 0, 0, 1, 1,
-1.047553, -0.1387639, -2.451988, 0, 0, 0, 1, 1,
-1.041119, -0.7151122, -1.575589, 0, 0, 0, 1, 1,
-1.034715, 2.071896, -1.140998, 0, 0, 0, 1, 1,
-1.033526, -0.2574125, -0.5794266, 1, 1, 1, 1, 1,
-1.029578, 0.4357518, -0.316339, 1, 1, 1, 1, 1,
-1.024005, 0.6466307, -2.01689, 1, 1, 1, 1, 1,
-1.021132, -1.319747, -2.357487, 1, 1, 1, 1, 1,
-1.014133, -1.561091, -1.727148, 1, 1, 1, 1, 1,
-1.013672, -0.01095931, -1.20224, 1, 1, 1, 1, 1,
-1.01244, -1.257507, -0.9049402, 1, 1, 1, 1, 1,
-1.002724, -1.340004, -2.306794, 1, 1, 1, 1, 1,
-0.996868, 0.2685031, -0.1305066, 1, 1, 1, 1, 1,
-0.9951661, -0.1101985, -1.704133, 1, 1, 1, 1, 1,
-0.9949825, 0.0709913, -2.477859, 1, 1, 1, 1, 1,
-0.9940078, 1.598189, -0.1259591, 1, 1, 1, 1, 1,
-0.9798371, 0.1428204, -2.436796, 1, 1, 1, 1, 1,
-0.9755349, -0.6552871, -2.10039, 1, 1, 1, 1, 1,
-0.9725221, 0.3084823, -1.111781, 1, 1, 1, 1, 1,
-0.9652941, -0.3774955, -0.8865058, 0, 0, 1, 1, 1,
-0.9631914, 2.094163, -0.1732685, 1, 0, 0, 1, 1,
-0.9581494, -2.637136, -1.457376, 1, 0, 0, 1, 1,
-0.956566, 1.788336, -0.3902145, 1, 0, 0, 1, 1,
-0.9486156, -0.0383034, 0.3903662, 1, 0, 0, 1, 1,
-0.9464219, -1.714444, -1.105108, 1, 0, 0, 1, 1,
-0.9405792, -0.5750883, -2.516398, 0, 0, 0, 1, 1,
-0.9328663, 0.7281792, -0.7559463, 0, 0, 0, 1, 1,
-0.9308286, 0.3726006, -1.250613, 0, 0, 0, 1, 1,
-0.9218993, 1.020654, -0.8538247, 0, 0, 0, 1, 1,
-0.9200471, -0.05648457, -2.266589, 0, 0, 0, 1, 1,
-0.9173455, -0.6575295, -2.751833, 0, 0, 0, 1, 1,
-0.9168051, -2.022178, -1.774269, 0, 0, 0, 1, 1,
-0.9155614, -0.4945646, -2.135233, 1, 1, 1, 1, 1,
-0.9130008, 0.7141723, -1.956009, 1, 1, 1, 1, 1,
-0.9112239, -0.7316636, -3.661448, 1, 1, 1, 1, 1,
-0.9064937, -0.2069461, -2.409257, 1, 1, 1, 1, 1,
-0.9059367, -0.9523861, -4.012334, 1, 1, 1, 1, 1,
-0.8994628, 0.5786929, 0.516362, 1, 1, 1, 1, 1,
-0.8922567, -1.037656, -3.384253, 1, 1, 1, 1, 1,
-0.8921632, 1.196394, -0.7037309, 1, 1, 1, 1, 1,
-0.8907048, -1.11392, -2.616512, 1, 1, 1, 1, 1,
-0.879742, -0.7884613, -1.903064, 1, 1, 1, 1, 1,
-0.8743538, -0.4573498, -1.311776, 1, 1, 1, 1, 1,
-0.8731157, 1.018631, -0.2430388, 1, 1, 1, 1, 1,
-0.871093, -0.5455877, -1.422642, 1, 1, 1, 1, 1,
-0.8675419, 0.08999997, 0.0896062, 1, 1, 1, 1, 1,
-0.865844, 0.7752857, -0.1837973, 1, 1, 1, 1, 1,
-0.8529593, -0.09442851, -0.1255936, 0, 0, 1, 1, 1,
-0.8484257, 1.884956, -0.3539771, 1, 0, 0, 1, 1,
-0.8469341, 0.2524121, -0.7544041, 1, 0, 0, 1, 1,
-0.8462757, -0.7086259, -1.501817, 1, 0, 0, 1, 1,
-0.8461088, -0.8104743, -0.6260875, 1, 0, 0, 1, 1,
-0.8447909, -1.581629, -2.199153, 1, 0, 0, 1, 1,
-0.8429314, -0.3246305, -2.118376, 0, 0, 0, 1, 1,
-0.8408403, 2.059863, -0.7452459, 0, 0, 0, 1, 1,
-0.8384413, -0.9434171, -1.639282, 0, 0, 0, 1, 1,
-0.8304639, -0.773509, -0.7849236, 0, 0, 0, 1, 1,
-0.8289652, -0.2443648, -1.39948, 0, 0, 0, 1, 1,
-0.826438, -0.4354654, 0.03597461, 0, 0, 0, 1, 1,
-0.8255257, 1.297451, -0.7956666, 0, 0, 0, 1, 1,
-0.8231943, 1.93941, -0.2039808, 1, 1, 1, 1, 1,
-0.8210816, 0.5245002, -1.899165, 1, 1, 1, 1, 1,
-0.8180833, -1.593338, -1.487458, 1, 1, 1, 1, 1,
-0.8171218, -0.3838529, -3.129024, 1, 1, 1, 1, 1,
-0.8124017, -0.195546, -2.920174, 1, 1, 1, 1, 1,
-0.8088195, -1.463446, -3.701205, 1, 1, 1, 1, 1,
-0.8086205, 1.332299, 0.3023967, 1, 1, 1, 1, 1,
-0.8081101, 0.02189761, -1.810565, 1, 1, 1, 1, 1,
-0.8042014, 0.3627578, -1.202258, 1, 1, 1, 1, 1,
-0.8024945, -1.033935, -3.03999, 1, 1, 1, 1, 1,
-0.7996645, 0.1018849, -1.247889, 1, 1, 1, 1, 1,
-0.7926438, 1.98579, -1.211285, 1, 1, 1, 1, 1,
-0.7913423, -1.660996, -4.074299, 1, 1, 1, 1, 1,
-0.7899779, -0.7917044, -2.469302, 1, 1, 1, 1, 1,
-0.7868308, 0.8396931, -0.9468556, 1, 1, 1, 1, 1,
-0.7851255, -2.155367, -2.029333, 0, 0, 1, 1, 1,
-0.7763733, -0.7847174, -1.56451, 1, 0, 0, 1, 1,
-0.7719409, 1.760501, -0.5547311, 1, 0, 0, 1, 1,
-0.7662548, 0.8970955, -0.2439856, 1, 0, 0, 1, 1,
-0.7600994, -1.690417, -2.919093, 1, 0, 0, 1, 1,
-0.7570153, 2.933607, 1.321208, 1, 0, 0, 1, 1,
-0.7529795, 0.4391421, -0.5378596, 0, 0, 0, 1, 1,
-0.7528353, -1.977935, -3.488768, 0, 0, 0, 1, 1,
-0.7453148, -1.442915, -2.972704, 0, 0, 0, 1, 1,
-0.7448113, -0.7939084, -1.181416, 0, 0, 0, 1, 1,
-0.7429231, -1.272631, -5.431044, 0, 0, 0, 1, 1,
-0.738889, -0.6883288, -2.33255, 0, 0, 0, 1, 1,
-0.7339658, 1.610699, -0.3552431, 0, 0, 0, 1, 1,
-0.7297618, -1.040413, -3.183196, 1, 1, 1, 1, 1,
-0.7213479, 1.024618, -0.9086409, 1, 1, 1, 1, 1,
-0.7194382, -1.572441, -2.552421, 1, 1, 1, 1, 1,
-0.7187555, 1.557536, 0.1454501, 1, 1, 1, 1, 1,
-0.718135, 0.03105341, -1.21752, 1, 1, 1, 1, 1,
-0.7123737, -0.8437448, -2.657118, 1, 1, 1, 1, 1,
-0.7103037, -0.2897151, -1.878278, 1, 1, 1, 1, 1,
-0.709738, 1.927214, 0.5689985, 1, 1, 1, 1, 1,
-0.7053305, -0.9782143, -2.97449, 1, 1, 1, 1, 1,
-0.6967926, 0.98963, -0.857448, 1, 1, 1, 1, 1,
-0.6886134, -1.022859, -2.352607, 1, 1, 1, 1, 1,
-0.676271, 1.632983, -1.539888, 1, 1, 1, 1, 1,
-0.6761069, 0.6851501, -0.9825335, 1, 1, 1, 1, 1,
-0.6747136, 1.496643, -0.3080209, 1, 1, 1, 1, 1,
-0.6718245, 0.7623173, 0.6487061, 1, 1, 1, 1, 1,
-0.6712838, -0.843071, -2.331471, 0, 0, 1, 1, 1,
-0.6686939, -0.3376795, -2.36428, 1, 0, 0, 1, 1,
-0.6667683, -0.06335273, -2.883481, 1, 0, 0, 1, 1,
-0.651671, 1.543452, 0.1842234, 1, 0, 0, 1, 1,
-0.6470139, -0.1072421, -1.198582, 1, 0, 0, 1, 1,
-0.6430075, 1.627913, -2.443972, 1, 0, 0, 1, 1,
-0.6426031, 0.8795849, 0.3383264, 0, 0, 0, 1, 1,
-0.6412386, 1.347192, -0.296762, 0, 0, 0, 1, 1,
-0.6387975, -0.8145091, -2.299703, 0, 0, 0, 1, 1,
-0.6365764, 1.153149, -1.606027, 0, 0, 0, 1, 1,
-0.6350756, 1.40745, 0.7720191, 0, 0, 0, 1, 1,
-0.6291851, 0.9014198, 0.6919869, 0, 0, 0, 1, 1,
-0.6273892, -0.6171424, -2.448191, 0, 0, 0, 1, 1,
-0.6140742, -1.744487, -2.64406, 1, 1, 1, 1, 1,
-0.6097376, -1.287741, -2.948431, 1, 1, 1, 1, 1,
-0.6014386, -0.2895823, -1.085263, 1, 1, 1, 1, 1,
-0.600325, -0.368916, -1.665892, 1, 1, 1, 1, 1,
-0.5997114, 0.09484424, -0.1397071, 1, 1, 1, 1, 1,
-0.5973387, -0.8647605, -1.705289, 1, 1, 1, 1, 1,
-0.5963221, -1.397202, -1.537142, 1, 1, 1, 1, 1,
-0.5929268, 1.987288, -0.5289187, 1, 1, 1, 1, 1,
-0.5849119, -0.8492782, -4.25111, 1, 1, 1, 1, 1,
-0.5734619, 0.2158385, -2.587058, 1, 1, 1, 1, 1,
-0.5681333, 2.658289, -0.5623925, 1, 1, 1, 1, 1,
-0.5540426, 0.6628371, 0.190847, 1, 1, 1, 1, 1,
-0.5534928, 0.7169961, -1.451013, 1, 1, 1, 1, 1,
-0.5506618, 2.256262, -1.15491, 1, 1, 1, 1, 1,
-0.5500435, -0.07725537, -1.523311, 1, 1, 1, 1, 1,
-0.5495844, -0.9933063, -1.119561, 0, 0, 1, 1, 1,
-0.5435435, 0.5513011, 0.2966317, 1, 0, 0, 1, 1,
-0.5372607, 0.2255133, -0.401499, 1, 0, 0, 1, 1,
-0.5362315, -0.9460005, -4.195261, 1, 0, 0, 1, 1,
-0.5344697, -2.021444, -3.465698, 1, 0, 0, 1, 1,
-0.5324575, 0.955789, -1.335488, 1, 0, 0, 1, 1,
-0.5301128, -1.230423, -1.643019, 0, 0, 0, 1, 1,
-0.5287517, -1.350486, -3.751451, 0, 0, 0, 1, 1,
-0.528608, 1.147191, -0.5391613, 0, 0, 0, 1, 1,
-0.5254014, 0.6088104, -1.386952, 0, 0, 0, 1, 1,
-0.5230944, -0.1151413, -0.8172306, 0, 0, 0, 1, 1,
-0.5198143, 0.726568, -1.403679, 0, 0, 0, 1, 1,
-0.512431, 0.2395603, -0.3212037, 0, 0, 0, 1, 1,
-0.5122682, 0.5788535, -0.1338239, 1, 1, 1, 1, 1,
-0.509768, -0.7686387, -2.802451, 1, 1, 1, 1, 1,
-0.5076151, 0.9748254, -1.558265, 1, 1, 1, 1, 1,
-0.5071149, -0.5943317, -3.613286, 1, 1, 1, 1, 1,
-0.4945726, 0.8844643, -0.3945856, 1, 1, 1, 1, 1,
-0.493854, -2.326159, -2.332255, 1, 1, 1, 1, 1,
-0.4904068, 0.1845028, -0.08577034, 1, 1, 1, 1, 1,
-0.4895036, -0.7223147, -2.464085, 1, 1, 1, 1, 1,
-0.4888596, 0.4488881, 0.4159674, 1, 1, 1, 1, 1,
-0.4826183, 0.06818768, -1.512269, 1, 1, 1, 1, 1,
-0.4813247, 0.1072474, -0.848215, 1, 1, 1, 1, 1,
-0.4810299, 0.04038338, -1.206638, 1, 1, 1, 1, 1,
-0.4742159, -0.8331085, -2.334097, 1, 1, 1, 1, 1,
-0.4722499, 0.606753, -0.7159425, 1, 1, 1, 1, 1,
-0.4721527, 0.01352184, -1.176323, 1, 1, 1, 1, 1,
-0.470485, 0.9309464, -0.649806, 0, 0, 1, 1, 1,
-0.4645851, -0.5924767, -3.028541, 1, 0, 0, 1, 1,
-0.4644055, 0.1812298, -1.862817, 1, 0, 0, 1, 1,
-0.4611716, 0.01150871, -1.714872, 1, 0, 0, 1, 1,
-0.4602402, -0.004231607, -2.847152, 1, 0, 0, 1, 1,
-0.4591999, 0.1524258, -0.496757, 1, 0, 0, 1, 1,
-0.4548721, -1.281711, -1.499014, 0, 0, 0, 1, 1,
-0.4534853, -1.584022, -4.577241, 0, 0, 0, 1, 1,
-0.4518099, 1.012501, -0.9162135, 0, 0, 0, 1, 1,
-0.4507096, 0.3236305, -1.307886, 0, 0, 0, 1, 1,
-0.4497065, -1.433321, -1.658856, 0, 0, 0, 1, 1,
-0.4483725, 0.3308547, -0.6853675, 0, 0, 0, 1, 1,
-0.4466202, 1.99847, -2.139802, 0, 0, 0, 1, 1,
-0.444947, -0.4864173, -1.484177, 1, 1, 1, 1, 1,
-0.4394723, -0.6514791, -4.253118, 1, 1, 1, 1, 1,
-0.4372763, 0.9149046, -1.9001, 1, 1, 1, 1, 1,
-0.4346146, 1.19382, -0.6966925, 1, 1, 1, 1, 1,
-0.434573, -0.0870844, -3.04045, 1, 1, 1, 1, 1,
-0.4339879, -0.5322023, -1.49012, 1, 1, 1, 1, 1,
-0.4267781, 0.6681915, 0.9913278, 1, 1, 1, 1, 1,
-0.4249723, -0.6402181, -3.597588, 1, 1, 1, 1, 1,
-0.4247546, 0.5743535, -0.6461768, 1, 1, 1, 1, 1,
-0.4222835, 1.281565, -1.068397, 1, 1, 1, 1, 1,
-0.4189208, -1.857966, -1.236901, 1, 1, 1, 1, 1,
-0.4171982, 0.2163375, -1.474563, 1, 1, 1, 1, 1,
-0.4169559, -1.275465, -0.8120428, 1, 1, 1, 1, 1,
-0.4104455, 0.3124791, -1.275563, 1, 1, 1, 1, 1,
-0.4073026, -1.075098, -2.239286, 1, 1, 1, 1, 1,
-0.4062501, 1.150209, -1.202807, 0, 0, 1, 1, 1,
-0.4044834, -0.3310783, -1.782353, 1, 0, 0, 1, 1,
-0.4033498, 0.4991686, -0.5165359, 1, 0, 0, 1, 1,
-0.4011622, 3.018642, -1.563842, 1, 0, 0, 1, 1,
-0.3938242, 0.0279348, -0.118784, 1, 0, 0, 1, 1,
-0.3890954, -1.051421, -1.749416, 1, 0, 0, 1, 1,
-0.3889917, -2.601223, -2.136959, 0, 0, 0, 1, 1,
-0.3856208, -0.5747355, -3.397485, 0, 0, 0, 1, 1,
-0.3853592, -1.427415, -3.539465, 0, 0, 0, 1, 1,
-0.3813781, 0.1751413, -1.4307, 0, 0, 0, 1, 1,
-0.3774615, 1.449478, -0.8030311, 0, 0, 0, 1, 1,
-0.37597, -1.04689, -3.313798, 0, 0, 0, 1, 1,
-0.3752943, 2.73842, 0.03244188, 0, 0, 0, 1, 1,
-0.3745608, 1.401844, -0.2170614, 1, 1, 1, 1, 1,
-0.3733436, 0.0987047, -2.294445, 1, 1, 1, 1, 1,
-0.3592837, 1.048986, -0.7485395, 1, 1, 1, 1, 1,
-0.3555642, 0.04534233, -1.394371, 1, 1, 1, 1, 1,
-0.3529582, 0.2721676, -2.703121, 1, 1, 1, 1, 1,
-0.3522076, -1.511187, -3.78751, 1, 1, 1, 1, 1,
-0.3518116, 1.224835, -0.4195735, 1, 1, 1, 1, 1,
-0.350271, 0.4844455, -1.091579, 1, 1, 1, 1, 1,
-0.3501756, 0.7357745, 0.2267775, 1, 1, 1, 1, 1,
-0.3468585, -0.9768361, -2.221767, 1, 1, 1, 1, 1,
-0.346742, 0.6025038, -1.7692, 1, 1, 1, 1, 1,
-0.3451754, -0.01710126, -2.739661, 1, 1, 1, 1, 1,
-0.3383441, 0.4655311, 0.1636399, 1, 1, 1, 1, 1,
-0.3336253, 0.5445672, -0.3565913, 1, 1, 1, 1, 1,
-0.329246, 0.5905101, 1.097398, 1, 1, 1, 1, 1,
-0.3270143, -0.9807575, -3.973808, 0, 0, 1, 1, 1,
-0.3263883, 1.17716, -0.9682537, 1, 0, 0, 1, 1,
-0.3233368, -0.148966, -3.633843, 1, 0, 0, 1, 1,
-0.3225754, 0.3508391, -0.3954062, 1, 0, 0, 1, 1,
-0.322082, -0.1986428, -2.394663, 1, 0, 0, 1, 1,
-0.3205011, -0.5735173, -2.279928, 1, 0, 0, 1, 1,
-0.3187145, 0.7349016, -2.259009, 0, 0, 0, 1, 1,
-0.3139826, 0.1838377, -0.3331683, 0, 0, 0, 1, 1,
-0.3089633, -0.074295, -0.2258718, 0, 0, 0, 1, 1,
-0.3078492, -0.5595847, -2.641991, 0, 0, 0, 1, 1,
-0.3047732, -0.312371, -3.170388, 0, 0, 0, 1, 1,
-0.3046931, -3.096544, -2.43248, 0, 0, 0, 1, 1,
-0.3036259, -0.499284, -4.139117, 0, 0, 0, 1, 1,
-0.3029342, 0.3889602, 2.065993, 1, 1, 1, 1, 1,
-0.3026599, -0.7969229, -3.181339, 1, 1, 1, 1, 1,
-0.2993018, -1.447137, -2.419045, 1, 1, 1, 1, 1,
-0.2968877, -0.2126885, -3.743485, 1, 1, 1, 1, 1,
-0.2961282, -0.6175091, -2.770522, 1, 1, 1, 1, 1,
-0.2961129, -1.00835, -2.651204, 1, 1, 1, 1, 1,
-0.2959366, 0.9300225, -0.09142748, 1, 1, 1, 1, 1,
-0.2916536, -0.3167055, -2.027362, 1, 1, 1, 1, 1,
-0.2853746, 0.02135062, -1.340453, 1, 1, 1, 1, 1,
-0.283679, -0.3884883, -3.390259, 1, 1, 1, 1, 1,
-0.2810965, -1.223146, -3.11119, 1, 1, 1, 1, 1,
-0.2806249, -1.129176, -4.57161, 1, 1, 1, 1, 1,
-0.2804372, -0.2186824, -3.679633, 1, 1, 1, 1, 1,
-0.2763755, -0.2118383, -2.030579, 1, 1, 1, 1, 1,
-0.2743879, 0.7004223, 1.431355, 1, 1, 1, 1, 1,
-0.2736763, -0.6162167, -4.289819, 0, 0, 1, 1, 1,
-0.2659877, 1.678852, -0.80869, 1, 0, 0, 1, 1,
-0.2645803, 2.254129, 0.8671972, 1, 0, 0, 1, 1,
-0.259844, -0.3522619, -1.916145, 1, 0, 0, 1, 1,
-0.2583113, -0.444006, -2.770652, 1, 0, 0, 1, 1,
-0.2536188, -0.6741601, -3.686001, 1, 0, 0, 1, 1,
-0.2425094, 1.307073, 0.7770388, 0, 0, 0, 1, 1,
-0.2366696, 0.8661637, -0.7677191, 0, 0, 0, 1, 1,
-0.2320169, -1.010157, -4.653089, 0, 0, 0, 1, 1,
-0.230426, -0.7926921, -2.908745, 0, 0, 0, 1, 1,
-0.2278194, -0.6284459, -2.407433, 0, 0, 0, 1, 1,
-0.2266074, -0.7583589, -4.277538, 0, 0, 0, 1, 1,
-0.2263662, 0.8745171, -0.5223401, 0, 0, 0, 1, 1,
-0.2234298, 1.173607, -1.399026, 1, 1, 1, 1, 1,
-0.2218772, -1.16967, -1.24279, 1, 1, 1, 1, 1,
-0.2209065, -0.05558193, -1.960181, 1, 1, 1, 1, 1,
-0.219886, 0.6989135, 0.1750467, 1, 1, 1, 1, 1,
-0.2027328, -0.4915307, -4.321201, 1, 1, 1, 1, 1,
-0.1996795, -0.1714235, -2.945386, 1, 1, 1, 1, 1,
-0.1995774, -0.3768307, -1.129143, 1, 1, 1, 1, 1,
-0.1891983, 1.372788, 0.088222, 1, 1, 1, 1, 1,
-0.1890635, -1.338118, -4.118055, 1, 1, 1, 1, 1,
-0.1885304, -0.08797057, -2.010536, 1, 1, 1, 1, 1,
-0.1838617, 0.6450294, 1.089574, 1, 1, 1, 1, 1,
-0.1822882, 1.522716, 0.85445, 1, 1, 1, 1, 1,
-0.181279, -1.094089, -3.303593, 1, 1, 1, 1, 1,
-0.1773499, -1.100263, -4.240158, 1, 1, 1, 1, 1,
-0.1753396, -1.73944, -3.103832, 1, 1, 1, 1, 1,
-0.1721943, -0.9289722, -1.683581, 0, 0, 1, 1, 1,
-0.1700149, -1.491938, -2.848589, 1, 0, 0, 1, 1,
-0.1649155, 0.6889302, 0.4786219, 1, 0, 0, 1, 1,
-0.1605771, -1.225523, -2.744741, 1, 0, 0, 1, 1,
-0.1571812, -0.5193498, -3.568748, 1, 0, 0, 1, 1,
-0.1545317, 1.218055, 0.02518523, 1, 0, 0, 1, 1,
-0.1537302, -1.330919, -3.260697, 0, 0, 0, 1, 1,
-0.1536935, -1.264434, -1.336689, 0, 0, 0, 1, 1,
-0.1526034, 1.155159, -0.1700156, 0, 0, 0, 1, 1,
-0.1507985, 1.028732, -0.14586, 0, 0, 0, 1, 1,
-0.1492884, -0.5374491, -4.552784, 0, 0, 0, 1, 1,
-0.1435011, -1.997978, -3.11313, 0, 0, 0, 1, 1,
-0.1422261, 1.166259, -0.0387071, 0, 0, 0, 1, 1,
-0.1390155, 1.032054, 0.1349422, 1, 1, 1, 1, 1,
-0.1389641, -0.34262, -3.122744, 1, 1, 1, 1, 1,
-0.1372853, 0.5699959, -1.259788, 1, 1, 1, 1, 1,
-0.1323308, -0.3369823, -1.096275, 1, 1, 1, 1, 1,
-0.1288955, -0.3701307, -3.654402, 1, 1, 1, 1, 1,
-0.1259634, -0.9883437, -1.91831, 1, 1, 1, 1, 1,
-0.1257134, -1.039442, -3.125447, 1, 1, 1, 1, 1,
-0.1239837, 0.3117034, -1.36616, 1, 1, 1, 1, 1,
-0.1236544, 0.1174277, 0.02742984, 1, 1, 1, 1, 1,
-0.1216902, -0.5607046, -3.066885, 1, 1, 1, 1, 1,
-0.1183934, -1.007491, -5.510659, 1, 1, 1, 1, 1,
-0.1143054, 0.3390935, -1.422913, 1, 1, 1, 1, 1,
-0.1122462, 0.07156919, -1.316691, 1, 1, 1, 1, 1,
-0.1107861, 0.589848, -1.105913, 1, 1, 1, 1, 1,
-0.1105494, -2.12906, -2.890995, 1, 1, 1, 1, 1,
-0.1073474, 0.03061289, -0.8306604, 0, 0, 1, 1, 1,
-0.1062641, 1.895112, -0.366471, 1, 0, 0, 1, 1,
-0.09913028, 1.182854, -1.043019, 1, 0, 0, 1, 1,
-0.09912565, 0.5438481, -0.2054848, 1, 0, 0, 1, 1,
-0.09711937, -1.043704, -2.296459, 1, 0, 0, 1, 1,
-0.08830982, 0.4713053, 0.03288677, 1, 0, 0, 1, 1,
-0.08593515, 1.862228, 0.3467106, 0, 0, 0, 1, 1,
-0.08484595, -0.8226993, -4.121793, 0, 0, 0, 1, 1,
-0.08453615, -0.8384422, -2.23676, 0, 0, 0, 1, 1,
-0.08240931, -0.8980613, -2.640214, 0, 0, 0, 1, 1,
-0.08099498, 0.3246478, -0.5684745, 0, 0, 0, 1, 1,
-0.07999434, 1.809121, -1.205143, 0, 0, 0, 1, 1,
-0.07905575, -0.5754896, -4.795038, 0, 0, 0, 1, 1,
-0.07782615, 0.6233641, 1.2214, 1, 1, 1, 1, 1,
-0.07493874, -0.5207741, -1.029841, 1, 1, 1, 1, 1,
-0.07346588, -0.6214904, -3.590711, 1, 1, 1, 1, 1,
-0.07151546, -0.2399331, -5.021759, 1, 1, 1, 1, 1,
-0.06914461, 1.82175, -0.2485808, 1, 1, 1, 1, 1,
-0.0689537, -0.3614355, -3.015861, 1, 1, 1, 1, 1,
-0.06883731, -0.5412106, -2.61815, 1, 1, 1, 1, 1,
-0.06740067, 0.80787, 0.4901777, 1, 1, 1, 1, 1,
-0.06402267, -0.1623181, -1.512594, 1, 1, 1, 1, 1,
-0.06246976, -0.3656441, -1.952554, 1, 1, 1, 1, 1,
-0.06104827, -0.08353548, -3.783237, 1, 1, 1, 1, 1,
-0.05695577, -0.252335, -3.773909, 1, 1, 1, 1, 1,
-0.05450473, 0.03666181, -2.099396, 1, 1, 1, 1, 1,
-0.04774597, 0.02041037, -2.676526, 1, 1, 1, 1, 1,
-0.04429577, -0.8859728, -3.944294, 1, 1, 1, 1, 1,
-0.04175013, -0.5022, -3.702744, 0, 0, 1, 1, 1,
-0.04070746, 0.8147924, 0.0979756, 1, 0, 0, 1, 1,
-0.04053017, 0.6987979, -2.962925, 1, 0, 0, 1, 1,
-0.03999162, 1.536046, 0.1524478, 1, 0, 0, 1, 1,
-0.03878765, -0.5688576, -2.377053, 1, 0, 0, 1, 1,
-0.03817709, -2.201403, -2.187183, 1, 0, 0, 1, 1,
-0.03590985, 2.666578, 0.00904694, 0, 0, 0, 1, 1,
-0.0358426, 0.4517846, -0.9664304, 0, 0, 0, 1, 1,
-0.03530188, -0.822162, -3.555532, 0, 0, 0, 1, 1,
-0.0324145, -0.6037679, -3.086453, 0, 0, 0, 1, 1,
-0.03050197, -1.166083, -3.99023, 0, 0, 0, 1, 1,
-0.02962744, 0.3296198, 0.1012534, 0, 0, 0, 1, 1,
-0.02753492, 0.2435514, 0.8943039, 0, 0, 0, 1, 1,
-0.02688392, -2.54446, -3.247871, 1, 1, 1, 1, 1,
-0.02603963, 0.9744826, 0.2090817, 1, 1, 1, 1, 1,
-0.02270962, 1.868151, 1.159336, 1, 1, 1, 1, 1,
-0.01999198, 0.04033737, -0.2464297, 1, 1, 1, 1, 1,
-0.01934262, 0.9240408, 0.1900762, 1, 1, 1, 1, 1,
-0.01556828, 0.981292, 2.146473, 1, 1, 1, 1, 1,
-0.01243119, -0.7460383, -2.200703, 1, 1, 1, 1, 1,
-0.01033744, 0.1768192, -0.2821861, 1, 1, 1, 1, 1,
-0.008740949, -0.4262934, -3.116997, 1, 1, 1, 1, 1,
-0.001502789, 0.7941012, -2.330133, 1, 1, 1, 1, 1,
-0.0001877763, -0.5337114, -1.603949, 1, 1, 1, 1, 1,
0.005665223, 0.216846, -0.3181646, 1, 1, 1, 1, 1,
0.006203389, -0.7009974, 3.129544, 1, 1, 1, 1, 1,
0.007867929, -0.6928835, 3.071756, 1, 1, 1, 1, 1,
0.008293089, 1.189861, -0.4066039, 1, 1, 1, 1, 1,
0.009486938, 0.9368433, -0.2740031, 0, 0, 1, 1, 1,
0.009861725, -0.9189442, 1.818883, 1, 0, 0, 1, 1,
0.009868098, -0.1105471, 4.422706, 1, 0, 0, 1, 1,
0.01288902, 1.244267, -0.6328683, 1, 0, 0, 1, 1,
0.0128945, -0.2733154, 3.44433, 1, 0, 0, 1, 1,
0.01667279, -0.08914135, 3.696338, 1, 0, 0, 1, 1,
0.01834746, -0.7718943, 2.943691, 0, 0, 0, 1, 1,
0.0219142, 0.2593946, -0.7834753, 0, 0, 0, 1, 1,
0.0234957, 0.7177575, -0.2894531, 0, 0, 0, 1, 1,
0.02353955, -0.1133296, 3.175336, 0, 0, 0, 1, 1,
0.02433698, 0.09625175, -0.6912042, 0, 0, 0, 1, 1,
0.03179638, -0.3173806, 3.708259, 0, 0, 0, 1, 1,
0.03220268, 0.9144716, 0.9075895, 0, 0, 0, 1, 1,
0.03247853, 1.594302, 0.07347602, 1, 1, 1, 1, 1,
0.03255422, -0.3248411, 3.166035, 1, 1, 1, 1, 1,
0.03272007, -0.3779413, 2.722452, 1, 1, 1, 1, 1,
0.03583172, 1.514407, 1.558006, 1, 1, 1, 1, 1,
0.0370064, -1.104881, 3.720653, 1, 1, 1, 1, 1,
0.03868726, -1.98369, 0.9534651, 1, 1, 1, 1, 1,
0.03880586, 1.834582, -0.89606, 1, 1, 1, 1, 1,
0.04542551, -0.556968, 3.921422, 1, 1, 1, 1, 1,
0.05497549, -0.3323501, 1.398265, 1, 1, 1, 1, 1,
0.05549961, 0.1127178, 0.3983834, 1, 1, 1, 1, 1,
0.05794483, -1.294951, 2.709898, 1, 1, 1, 1, 1,
0.05868565, 1.037233, 1.429394, 1, 1, 1, 1, 1,
0.06006381, 0.5231197, 0.6205392, 1, 1, 1, 1, 1,
0.06332742, -0.6618867, 1.923279, 1, 1, 1, 1, 1,
0.06399181, 0.8399987, -0.8599675, 1, 1, 1, 1, 1,
0.06400003, 0.2735189, 0.2220483, 0, 0, 1, 1, 1,
0.06426798, 0.4769394, -2.242429, 1, 0, 0, 1, 1,
0.06875448, 1.897346, -0.9629487, 1, 0, 0, 1, 1,
0.069795, 0.8710687, 0.3529507, 1, 0, 0, 1, 1,
0.07030131, -1.269791, 4.855781, 1, 0, 0, 1, 1,
0.07279609, 0.5037351, -0.6094479, 1, 0, 0, 1, 1,
0.07301404, -0.009355208, 1.139627, 0, 0, 0, 1, 1,
0.07441746, 0.5163046, -0.9916013, 0, 0, 0, 1, 1,
0.0755887, -1.684058, 3.006604, 0, 0, 0, 1, 1,
0.07627905, 1.359132, 0.3308387, 0, 0, 0, 1, 1,
0.08060657, -0.3198572, 3.567669, 0, 0, 0, 1, 1,
0.08212261, 3.104577, 1.017651, 0, 0, 0, 1, 1,
0.08539666, 1.249046, -1.591156, 0, 0, 0, 1, 1,
0.08936352, 0.3458416, -1.401871, 1, 1, 1, 1, 1,
0.09141222, -0.5829623, 3.585437, 1, 1, 1, 1, 1,
0.09227765, 1.463502, 1.613468, 1, 1, 1, 1, 1,
0.09708008, -2.411033, 3.46619, 1, 1, 1, 1, 1,
0.09991559, -1.162645, 2.572798, 1, 1, 1, 1, 1,
0.1043316, -0.06843366, 2.459904, 1, 1, 1, 1, 1,
0.1053629, 0.6445407, 0.3974787, 1, 1, 1, 1, 1,
0.1066443, -1.604142, 3.403776, 1, 1, 1, 1, 1,
0.1090581, 1.807979, -1.405493, 1, 1, 1, 1, 1,
0.1157978, 1.602475, -1.782087, 1, 1, 1, 1, 1,
0.1175096, 0.02353327, 1.812355, 1, 1, 1, 1, 1,
0.1178229, 0.4280681, 1.289121, 1, 1, 1, 1, 1,
0.1183457, -1.224621, 2.973348, 1, 1, 1, 1, 1,
0.1236129, -0.2724335, 3.756546, 1, 1, 1, 1, 1,
0.1257332, -1.253641, 3.283552, 1, 1, 1, 1, 1,
0.1285819, 0.9542959, -0.08499758, 0, 0, 1, 1, 1,
0.1286635, 1.820877, 1.884632, 1, 0, 0, 1, 1,
0.1343178, -1.176021, 2.767573, 1, 0, 0, 1, 1,
0.1381757, 0.2919873, 2.451731, 1, 0, 0, 1, 1,
0.1405402, -0.3673608, 2.044125, 1, 0, 0, 1, 1,
0.1446963, -0.9414082, 3.411163, 1, 0, 0, 1, 1,
0.1454606, 0.5871915, -0.3608065, 0, 0, 0, 1, 1,
0.1468525, 0.8746473, -0.4012902, 0, 0, 0, 1, 1,
0.1553196, -0.4258613, 5.854965, 0, 0, 0, 1, 1,
0.1558931, 0.8252611, -1.178693, 0, 0, 0, 1, 1,
0.1579883, 1.292743, 0.7848247, 0, 0, 0, 1, 1,
0.1591706, -0.6237924, 3.767098, 0, 0, 0, 1, 1,
0.160826, 1.469828, -1.964572, 0, 0, 0, 1, 1,
0.1668046, 0.3929872, -0.9736216, 1, 1, 1, 1, 1,
0.1687297, -1.693177, 4.049946, 1, 1, 1, 1, 1,
0.1687539, -1.288286, 2.502131, 1, 1, 1, 1, 1,
0.1716192, -1.095117, 3.497664, 1, 1, 1, 1, 1,
0.1719341, -0.1884688, 2.132362, 1, 1, 1, 1, 1,
0.1736804, -0.04894838, 2.677565, 1, 1, 1, 1, 1,
0.1738357, 0.1720832, -1.841063, 1, 1, 1, 1, 1,
0.1757145, -1.828457, 2.784139, 1, 1, 1, 1, 1,
0.1781019, 1.065648, 0.1386285, 1, 1, 1, 1, 1,
0.1793511, -0.2812738, 2.51166, 1, 1, 1, 1, 1,
0.1810173, 0.7526455, -1.453489, 1, 1, 1, 1, 1,
0.1852189, -0.2117165, 3.012826, 1, 1, 1, 1, 1,
0.1860297, 0.695529, 0.1818735, 1, 1, 1, 1, 1,
0.1861837, 0.3545407, 1.900759, 1, 1, 1, 1, 1,
0.1863475, -1.201551, 3.389648, 1, 1, 1, 1, 1,
0.1865589, 0.1564801, -0.8244286, 0, 0, 1, 1, 1,
0.1929953, 0.3930657, -1.161098, 1, 0, 0, 1, 1,
0.1955263, 1.06743, 1.401478, 1, 0, 0, 1, 1,
0.2001739, 0.6526886, 1.132544, 1, 0, 0, 1, 1,
0.2012582, -1.453215, 4.782527, 1, 0, 0, 1, 1,
0.202065, 0.05378452, 1.62518, 1, 0, 0, 1, 1,
0.2046407, -1.697296, 4.37528, 0, 0, 0, 1, 1,
0.2121968, 1.095373, 1.495777, 0, 0, 0, 1, 1,
0.217856, -1.044456, 2.873353, 0, 0, 0, 1, 1,
0.2195696, -0.5289478, 3.911029, 0, 0, 0, 1, 1,
0.220042, 0.3338281, -0.6299399, 0, 0, 0, 1, 1,
0.2241334, -0.760276, 2.06344, 0, 0, 0, 1, 1,
0.2248923, 0.08631571, 0.3355482, 0, 0, 0, 1, 1,
0.2322659, -0.3986523, 2.008698, 1, 1, 1, 1, 1,
0.2334814, 0.08273943, 1.721975, 1, 1, 1, 1, 1,
0.2357, -0.2512203, 2.108046, 1, 1, 1, 1, 1,
0.2402582, 0.3255492, 0.03094582, 1, 1, 1, 1, 1,
0.2411271, -0.9680021, 2.738391, 1, 1, 1, 1, 1,
0.2433217, -1.583321, 0.3930846, 1, 1, 1, 1, 1,
0.2436013, 0.4274723, 0.5189294, 1, 1, 1, 1, 1,
0.244066, -1.626152, 4.045964, 1, 1, 1, 1, 1,
0.2441416, 1.425508, 0.2002925, 1, 1, 1, 1, 1,
0.2447362, -2.943617, 4.062942, 1, 1, 1, 1, 1,
0.2447997, -0.8749022, 2.155867, 1, 1, 1, 1, 1,
0.2459134, -1.518975, 2.588919, 1, 1, 1, 1, 1,
0.2460362, 0.9800661, -0.6072096, 1, 1, 1, 1, 1,
0.2509916, 0.1677097, -0.1787459, 1, 1, 1, 1, 1,
0.2530277, 0.8793191, 0.7055661, 1, 1, 1, 1, 1,
0.2544453, 0.8159448, 0.1366737, 0, 0, 1, 1, 1,
0.2579434, 0.06649002, 2.27167, 1, 0, 0, 1, 1,
0.2590327, -0.1353029, 2.167997, 1, 0, 0, 1, 1,
0.2631312, 1.017854, -0.2842185, 1, 0, 0, 1, 1,
0.2688019, -0.7760473, 2.900483, 1, 0, 0, 1, 1,
0.2742551, -0.9356635, 3.042182, 1, 0, 0, 1, 1,
0.2796264, -0.4217165, 2.316439, 0, 0, 0, 1, 1,
0.281141, 0.1450486, 0.2201418, 0, 0, 0, 1, 1,
0.2811979, -1.658116, 2.452449, 0, 0, 0, 1, 1,
0.2824577, -0.1332377, 1.649711, 0, 0, 0, 1, 1,
0.282954, 1.295741, 0.2583264, 0, 0, 0, 1, 1,
0.2846893, 0.2258502, 0.9844399, 0, 0, 0, 1, 1,
0.2853686, -0.01419026, 2.154238, 0, 0, 0, 1, 1,
0.2892073, 0.1676527, -0.6596777, 1, 1, 1, 1, 1,
0.2893583, 1.495194, -0.8126394, 1, 1, 1, 1, 1,
0.2991166, 0.7720729, 0.4347462, 1, 1, 1, 1, 1,
0.3003152, -0.1298237, 2.499066, 1, 1, 1, 1, 1,
0.3048969, 0.6167287, -0.5648407, 1, 1, 1, 1, 1,
0.3053458, 0.07409696, 0.3493706, 1, 1, 1, 1, 1,
0.3055984, -0.2268659, 2.184092, 1, 1, 1, 1, 1,
0.3074863, 0.2538216, 0.3964969, 1, 1, 1, 1, 1,
0.3152036, -0.656633, 3.036455, 1, 1, 1, 1, 1,
0.3162859, -0.6315827, 2.323389, 1, 1, 1, 1, 1,
0.3193533, 1.485433, 1.763426, 1, 1, 1, 1, 1,
0.3244871, 0.6434944, -0.2339292, 1, 1, 1, 1, 1,
0.3277757, -0.5172927, 2.55059, 1, 1, 1, 1, 1,
0.3283503, 2.341366, 0.6802146, 1, 1, 1, 1, 1,
0.3290921, -2.293949, 3.986953, 1, 1, 1, 1, 1,
0.3295715, 0.5686278, -0.2714289, 0, 0, 1, 1, 1,
0.3319097, -0.1262518, -0.350303, 1, 0, 0, 1, 1,
0.331918, 0.9222227, 0.02499956, 1, 0, 0, 1, 1,
0.3333171, 1.869446, 0.243975, 1, 0, 0, 1, 1,
0.3396818, -0.477071, 3.560201, 1, 0, 0, 1, 1,
0.3401536, 1.82767, 1.068365, 1, 0, 0, 1, 1,
0.3465378, 1.134966, -1.060746, 0, 0, 0, 1, 1,
0.3526258, 0.3851617, 0.761498, 0, 0, 0, 1, 1,
0.3531321, 0.2434334, 0.7310517, 0, 0, 0, 1, 1,
0.354501, -1.671022, 2.731973, 0, 0, 0, 1, 1,
0.3619947, 0.7346063, 1.973299, 0, 0, 0, 1, 1,
0.362415, 0.1233808, 1.431955, 0, 0, 0, 1, 1,
0.3625785, 0.2235582, -0.4115737, 0, 0, 0, 1, 1,
0.3636251, -0.8757915, 2.774132, 1, 1, 1, 1, 1,
0.3652902, 0.8653998, -0.6266366, 1, 1, 1, 1, 1,
0.3670074, 0.1989335, 2.879178, 1, 1, 1, 1, 1,
0.3692523, -0.3267429, 1.953803, 1, 1, 1, 1, 1,
0.3704517, 0.2805941, 1.624527, 1, 1, 1, 1, 1,
0.3724448, -0.3081977, 0.685584, 1, 1, 1, 1, 1,
0.3774009, 1.637368, 0.0657975, 1, 1, 1, 1, 1,
0.3779511, 0.4338755, -0.5883798, 1, 1, 1, 1, 1,
0.3872485, -1.085797, 4.30668, 1, 1, 1, 1, 1,
0.3873967, -1.381822, 4.153242, 1, 1, 1, 1, 1,
0.3875841, -1.449045, 1.640493, 1, 1, 1, 1, 1,
0.3909684, -0.5425857, 2.810382, 1, 1, 1, 1, 1,
0.3911625, 0.6203613, -0.3220719, 1, 1, 1, 1, 1,
0.3913557, -1.428694, 2.056763, 1, 1, 1, 1, 1,
0.3957211, 0.6152511, 0.9599133, 1, 1, 1, 1, 1,
0.3969239, -0.4619354, 2.293001, 0, 0, 1, 1, 1,
0.3988305, 0.1718425, -0.03104155, 1, 0, 0, 1, 1,
0.4031007, -0.9086248, 1.169962, 1, 0, 0, 1, 1,
0.4052073, 1.457272, 0.05753291, 1, 0, 0, 1, 1,
0.4097784, 0.8239041, 0.2489724, 1, 0, 0, 1, 1,
0.4144959, -1.138853, 4.476586, 1, 0, 0, 1, 1,
0.4159552, -1.226834, 1.113296, 0, 0, 0, 1, 1,
0.421145, 0.2729045, 1.387399, 0, 0, 0, 1, 1,
0.423095, -0.2147439, 1.727687, 0, 0, 0, 1, 1,
0.4233661, 1.74125, -0.4133522, 0, 0, 0, 1, 1,
0.4251684, -0.2876202, 1.72373, 0, 0, 0, 1, 1,
0.427112, 0.5028849, -0.4001616, 0, 0, 0, 1, 1,
0.4335913, 0.8548779, 1.537437, 0, 0, 0, 1, 1,
0.4340456, 0.5414221, 0.3215571, 1, 1, 1, 1, 1,
0.4372164, 0.8033224, 1.695357, 1, 1, 1, 1, 1,
0.4377863, 0.9538496, 0.2683911, 1, 1, 1, 1, 1,
0.4379984, 1.35224, 2.409803, 1, 1, 1, 1, 1,
0.4398315, -1.246877, 2.222548, 1, 1, 1, 1, 1,
0.4399301, -0.2419087, 3.932179, 1, 1, 1, 1, 1,
0.444863, -1.748643, 2.624537, 1, 1, 1, 1, 1,
0.4490472, 0.6648213, -0.5309072, 1, 1, 1, 1, 1,
0.4525514, 0.8633535, 1.00304, 1, 1, 1, 1, 1,
0.4556671, 0.4020557, 0.2855725, 1, 1, 1, 1, 1,
0.461083, -3.014394, 3.92367, 1, 1, 1, 1, 1,
0.4634545, -0.4869221, 1.284361, 1, 1, 1, 1, 1,
0.4637132, -0.3240642, 1.125959, 1, 1, 1, 1, 1,
0.46746, 0.5486467, -1.946463, 1, 1, 1, 1, 1,
0.4682635, 0.867175, 0.490191, 1, 1, 1, 1, 1,
0.4721135, -0.2937765, 2.504165, 0, 0, 1, 1, 1,
0.4728578, -0.2901747, 2.20911, 1, 0, 0, 1, 1,
0.4767389, -1.236787, 2.502123, 1, 0, 0, 1, 1,
0.4806977, -0.182081, 1.506686, 1, 0, 0, 1, 1,
0.481111, 1.85929, 0.9794807, 1, 0, 0, 1, 1,
0.487078, 0.5609452, 0.5039456, 1, 0, 0, 1, 1,
0.4871026, -0.5314924, 2.596569, 0, 0, 0, 1, 1,
0.4909334, -1.987499, 2.909678, 0, 0, 0, 1, 1,
0.4918756, 0.6969751, -0.1430115, 0, 0, 0, 1, 1,
0.4920532, -0.177528, 1.26206, 0, 0, 0, 1, 1,
0.4928073, 0.6876011, 1.313466, 0, 0, 0, 1, 1,
0.4983701, 0.1549133, -0.408848, 0, 0, 0, 1, 1,
0.5019474, -0.1939782, -0.2161661, 0, 0, 0, 1, 1,
0.505269, 0.4243333, 0.3929213, 1, 1, 1, 1, 1,
0.5052717, 1.024427, -0.7476696, 1, 1, 1, 1, 1,
0.507557, -1.184785, 2.289697, 1, 1, 1, 1, 1,
0.5146657, -1.883303, 3.387349, 1, 1, 1, 1, 1,
0.518771, -0.4319783, 2.558695, 1, 1, 1, 1, 1,
0.5191159, -0.4032884, 2.210947, 1, 1, 1, 1, 1,
0.5194974, 2.649866, 0.5715837, 1, 1, 1, 1, 1,
0.5221004, -0.9231514, 1.651764, 1, 1, 1, 1, 1,
0.5225861, 0.3778665, 0.2061534, 1, 1, 1, 1, 1,
0.5274772, -0.7817696, 3.237669, 1, 1, 1, 1, 1,
0.5300119, 1.0053, 0.8570197, 1, 1, 1, 1, 1,
0.5303457, 0.6527595, 1.475635, 1, 1, 1, 1, 1,
0.5319922, -0.07524608, 2.591011, 1, 1, 1, 1, 1,
0.5358813, 1.058263, 0.9790519, 1, 1, 1, 1, 1,
0.5374268, 0.7707667, 1.19185, 1, 1, 1, 1, 1,
0.5377628, -0.8897395, 2.103643, 0, 0, 1, 1, 1,
0.5391831, 0.2548359, 2.772396, 1, 0, 0, 1, 1,
0.5417556, 0.2969927, 0.7387478, 1, 0, 0, 1, 1,
0.5532945, 1.022083, 0.7867436, 1, 0, 0, 1, 1,
0.5554807, -0.2777017, 1.683078, 1, 0, 0, 1, 1,
0.559635, 0.777342, 1.077453, 1, 0, 0, 1, 1,
0.5651723, 1.473291, 0.5325347, 0, 0, 0, 1, 1,
0.5661255, -1.677176, 4.641685, 0, 0, 0, 1, 1,
0.581881, -0.08670077, 1.045988, 0, 0, 0, 1, 1,
0.5824612, -0.02787664, -0.5634105, 0, 0, 0, 1, 1,
0.5875933, 1.337188, 0.3751652, 0, 0, 0, 1, 1,
0.5940979, 0.6232476, 0.5049799, 0, 0, 0, 1, 1,
0.5942054, 0.6579185, -1.237375, 0, 0, 0, 1, 1,
0.5947695, -1.030102, 3.600649, 1, 1, 1, 1, 1,
0.5966977, -0.7810688, 2.493457, 1, 1, 1, 1, 1,
0.5972303, 0.4996231, 0.5182834, 1, 1, 1, 1, 1,
0.6089758, -0.6460884, 2.483467, 1, 1, 1, 1, 1,
0.6096041, 1.373263, -1.051167, 1, 1, 1, 1, 1,
0.6126421, -0.3784616, 0.5933392, 1, 1, 1, 1, 1,
0.6141512, 0.8318689, 0.8499509, 1, 1, 1, 1, 1,
0.6142069, 0.5186505, 1.041458, 1, 1, 1, 1, 1,
0.6142777, 0.3485039, 1.196891, 1, 1, 1, 1, 1,
0.6153681, -1.432868, 3.043058, 1, 1, 1, 1, 1,
0.6164743, -1.021761, 1.332676, 1, 1, 1, 1, 1,
0.622296, -0.07570811, 1.115365, 1, 1, 1, 1, 1,
0.6246631, -0.2883688, 2.037813, 1, 1, 1, 1, 1,
0.6247281, -1.19547, 3.553281, 1, 1, 1, 1, 1,
0.6296853, 0.05883424, 2.208702, 1, 1, 1, 1, 1,
0.6310071, 0.2752083, 0.8364012, 0, 0, 1, 1, 1,
0.6324798, -0.3483709, 3.093972, 1, 0, 0, 1, 1,
0.6346053, -0.3695246, 1.018245, 1, 0, 0, 1, 1,
0.6383901, -0.2956914, 2.334584, 1, 0, 0, 1, 1,
0.6488649, 0.006014447, 0.3517277, 1, 0, 0, 1, 1,
0.6547446, 1.154858, 0.7545557, 1, 0, 0, 1, 1,
0.658946, -0.1661578, 2.065664, 0, 0, 0, 1, 1,
0.6627619, 0.8313602, 0.5396873, 0, 0, 0, 1, 1,
0.6642391, 1.751638, -0.5601999, 0, 0, 0, 1, 1,
0.6676988, 0.5374019, 1.624909, 0, 0, 0, 1, 1,
0.6695725, -2.2616, 2.908623, 0, 0, 0, 1, 1,
0.6722894, -0.05349311, 2.211083, 0, 0, 0, 1, 1,
0.672459, -0.04648107, 1.171442, 0, 0, 0, 1, 1,
0.6830327, -1.179345, 1.017916, 1, 1, 1, 1, 1,
0.6861746, -0.2432076, 5.008739, 1, 1, 1, 1, 1,
0.6905001, -0.4478584, 1.032667, 1, 1, 1, 1, 1,
0.6953555, 0.3907996, 0.6485187, 1, 1, 1, 1, 1,
0.6966296, -0.8505356, 4.032607, 1, 1, 1, 1, 1,
0.704892, 0.1825206, 1.699418, 1, 1, 1, 1, 1,
0.7089517, -0.1091497, 0.7415965, 1, 1, 1, 1, 1,
0.7155011, 0.4982309, -0.7275406, 1, 1, 1, 1, 1,
0.7166988, -0.5989566, 1.980311, 1, 1, 1, 1, 1,
0.720953, 0.3156739, 0.7119746, 1, 1, 1, 1, 1,
0.7228566, -2.087774, 2.395222, 1, 1, 1, 1, 1,
0.7289022, 0.2820866, 3.740936, 1, 1, 1, 1, 1,
0.7301527, -1.908187, 1.450197, 1, 1, 1, 1, 1,
0.7340328, -0.1412198, 1.478002, 1, 1, 1, 1, 1,
0.739579, 0.5172743, -0.08520582, 1, 1, 1, 1, 1,
0.7436799, -0.8539981, 3.849584, 0, 0, 1, 1, 1,
0.7510202, 0.7514633, 0.202559, 1, 0, 0, 1, 1,
0.7511742, 0.5219997, 0.4078274, 1, 0, 0, 1, 1,
0.7522412, 0.9040162, 2.812963, 1, 0, 0, 1, 1,
0.7553667, -0.558543, 2.016129, 1, 0, 0, 1, 1,
0.7554647, -0.7710142, 2.107399, 1, 0, 0, 1, 1,
0.7570029, -0.2145902, 1.518241, 0, 0, 0, 1, 1,
0.7607375, -0.8819603, 0.657246, 0, 0, 0, 1, 1,
0.76214, 0.3324064, 1.889459, 0, 0, 0, 1, 1,
0.7653074, -0.250833, 1.135903, 0, 0, 0, 1, 1,
0.7722461, -0.1544503, 2.094933, 0, 0, 0, 1, 1,
0.7724672, -0.7436413, 2.461262, 0, 0, 0, 1, 1,
0.7737072, 0.5639767, 1.362073, 0, 0, 0, 1, 1,
0.7802626, 1.384602, -1.079822, 1, 1, 1, 1, 1,
0.7819105, 0.9425597, -0.3471601, 1, 1, 1, 1, 1,
0.7826822, 0.3705428, 1.237029, 1, 1, 1, 1, 1,
0.7840649, 1.517133, 0.70035, 1, 1, 1, 1, 1,
0.7852035, 0.4143136, 1.725352, 1, 1, 1, 1, 1,
0.7917094, -0.7864044, 0.9920149, 1, 1, 1, 1, 1,
0.7938232, 0.05680058, 1.084288, 1, 1, 1, 1, 1,
0.7969473, 1.994624, -0.7198481, 1, 1, 1, 1, 1,
0.7992437, -1.625846, 1.508833, 1, 1, 1, 1, 1,
0.8007218, -0.6112524, 0.8075722, 1, 1, 1, 1, 1,
0.8030974, -1.606466, 3.692098, 1, 1, 1, 1, 1,
0.8044358, 1.947146, 2.281437, 1, 1, 1, 1, 1,
0.8066466, -0.7743455, 3.157465, 1, 1, 1, 1, 1,
0.8096726, -0.6845993, 0.7811287, 1, 1, 1, 1, 1,
0.8234141, -0.007867783, 2.015356, 1, 1, 1, 1, 1,
0.8238513, -1.897433, 1.201237, 0, 0, 1, 1, 1,
0.8319488, 0.03581299, 1.216717, 1, 0, 0, 1, 1,
0.8381248, -0.009731684, 0.7023298, 1, 0, 0, 1, 1,
0.8406078, 0.7882433, 1.326838, 1, 0, 0, 1, 1,
0.8432397, 0.1048601, 1.010763, 1, 0, 0, 1, 1,
0.843878, -0.9443477, 2.0902, 1, 0, 0, 1, 1,
0.8459496, 0.3982792, 0.8630875, 0, 0, 0, 1, 1,
0.8478388, -1.074847, 0.7220446, 0, 0, 0, 1, 1,
0.8489245, 0.352584, 3.568075, 0, 0, 0, 1, 1,
0.8546841, 3.227659, 1.904972, 0, 0, 0, 1, 1,
0.858458, 0.1570638, 1.503465, 0, 0, 0, 1, 1,
0.865667, 1.405413, 0.5338407, 0, 0, 0, 1, 1,
0.8680826, -2.562118, 3.531329, 0, 0, 0, 1, 1,
0.8698756, 0.01907098, 1.274922, 1, 1, 1, 1, 1,
0.873292, -0.8119403, 2.094295, 1, 1, 1, 1, 1,
0.8755119, -0.1997683, 1.054494, 1, 1, 1, 1, 1,
0.8765894, 0.9091131, 1.929059, 1, 1, 1, 1, 1,
0.8772903, 0.4023556, 3.049481, 1, 1, 1, 1, 1,
0.8775148, -1.185973, 3.268689, 1, 1, 1, 1, 1,
0.8784754, -1.445628, 0.2580273, 1, 1, 1, 1, 1,
0.8789373, -0.1271944, 2.382672, 1, 1, 1, 1, 1,
0.8915948, -0.01485283, 0.2493349, 1, 1, 1, 1, 1,
0.8935488, 0.3616033, 1.229545, 1, 1, 1, 1, 1,
0.895071, -1.412654, 1.240013, 1, 1, 1, 1, 1,
0.8954102, -1.433066, 3.085619, 1, 1, 1, 1, 1,
0.8985384, -0.6108236, 1.418058, 1, 1, 1, 1, 1,
0.8991818, -0.6388572, 1.185292, 1, 1, 1, 1, 1,
0.8992378, -1.124716, 2.040837, 1, 1, 1, 1, 1,
0.9007459, 0.2091099, 0.443682, 0, 0, 1, 1, 1,
0.9026591, 1.132371, 1.341264, 1, 0, 0, 1, 1,
0.903303, -0.9279925, 2.140317, 1, 0, 0, 1, 1,
0.9054748, 0.2883371, 0.5499876, 1, 0, 0, 1, 1,
0.9082837, 2.264777, 0.4781227, 1, 0, 0, 1, 1,
0.9153759, -0.04324852, 2.158548, 1, 0, 0, 1, 1,
0.9198073, 0.303022, 2.252638, 0, 0, 0, 1, 1,
0.9258209, 0.3209789, 1.12518, 0, 0, 0, 1, 1,
0.9283555, 0.6176077, 0.9945665, 0, 0, 0, 1, 1,
0.9332716, 1.184115, 0.4782652, 0, 0, 0, 1, 1,
0.9381901, 0.6894713, 1.836333, 0, 0, 0, 1, 1,
0.9387929, 0.7442253, 1.561792, 0, 0, 0, 1, 1,
0.9403727, -2.197175, 3.026655, 0, 0, 0, 1, 1,
0.9498661, 0.429091, 0.7295321, 1, 1, 1, 1, 1,
0.9506392, -1.32203, 3.821723, 1, 1, 1, 1, 1,
0.9557222, -0.9575105, 3.237537, 1, 1, 1, 1, 1,
0.9613171, 1.240093, 1.591013, 1, 1, 1, 1, 1,
0.9656501, -0.03599834, 1.025608, 1, 1, 1, 1, 1,
0.9726485, -0.1617531, 2.212157, 1, 1, 1, 1, 1,
0.9821192, -0.1109384, 2.652392, 1, 1, 1, 1, 1,
0.9961745, 0.2503709, 1.401758, 1, 1, 1, 1, 1,
1.00092, -0.01764649, 4.321006, 1, 1, 1, 1, 1,
1.001555, -0.9896343, 2.833774, 1, 1, 1, 1, 1,
1.003975, 1.060119, 8.290101e-05, 1, 1, 1, 1, 1,
1.014649, 0.5600181, 0.9698898, 1, 1, 1, 1, 1,
1.019736, -2.521825, 3.264025, 1, 1, 1, 1, 1,
1.023523, 0.730029, 1.799093, 1, 1, 1, 1, 1,
1.026652, 1.924894, -0.252715, 1, 1, 1, 1, 1,
1.033782, -0.9514078, 1.849694, 0, 0, 1, 1, 1,
1.034513, 0.03527779, 0.6813108, 1, 0, 0, 1, 1,
1.038569, 1.168441, 0.8562098, 1, 0, 0, 1, 1,
1.040099, -1.245811, 1.97243, 1, 0, 0, 1, 1,
1.049606, -1.124626, 4.825389, 1, 0, 0, 1, 1,
1.050769, -0.767975, 2.202303, 1, 0, 0, 1, 1,
1.051198, -0.6033179, 2.234586, 0, 0, 0, 1, 1,
1.052871, -1.133559, 2.22596, 0, 0, 0, 1, 1,
1.059321, -1.236606, 2.503054, 0, 0, 0, 1, 1,
1.059919, -0.1359334, 1.046391, 0, 0, 0, 1, 1,
1.062008, -0.5388278, 4.483292, 0, 0, 0, 1, 1,
1.064334, -1.738755, 3.488328, 0, 0, 0, 1, 1,
1.069398, -2.448775, 2.465649, 0, 0, 0, 1, 1,
1.079707, 0.15914, 2.248277, 1, 1, 1, 1, 1,
1.085427, -0.0498394, 2.490064, 1, 1, 1, 1, 1,
1.102156, 0.1616979, 3.384016, 1, 1, 1, 1, 1,
1.105511, 1.173222, -0.3928626, 1, 1, 1, 1, 1,
1.114237, -1.821305, 3.229791, 1, 1, 1, 1, 1,
1.123225, -1.312315, 3.11841, 1, 1, 1, 1, 1,
1.126966, -0.3230792, 2.850639, 1, 1, 1, 1, 1,
1.137028, 0.7902719, 1.994606, 1, 1, 1, 1, 1,
1.147667, 0.1324956, 2.156157, 1, 1, 1, 1, 1,
1.149945, 0.2510962, 2.893901, 1, 1, 1, 1, 1,
1.168074, 0.2234355, 0.9708701, 1, 1, 1, 1, 1,
1.17957, -0.4716578, 1.087886, 1, 1, 1, 1, 1,
1.193827, 0.0487395, 2.112787, 1, 1, 1, 1, 1,
1.198117, 0.134265, 0.848043, 1, 1, 1, 1, 1,
1.198704, -0.9239039, 1.367766, 1, 1, 1, 1, 1,
1.201705, 0.7636181, -0.4391187, 0, 0, 1, 1, 1,
1.211807, -0.6089748, 1.584069, 1, 0, 0, 1, 1,
1.212001, 1.223376, -0.3270398, 1, 0, 0, 1, 1,
1.212592, -0.4777502, 1.933324, 1, 0, 0, 1, 1,
1.213122, -0.02801495, 2.05144, 1, 0, 0, 1, 1,
1.218843, -0.5240843, 1.612348, 1, 0, 0, 1, 1,
1.232692, -0.07776108, 2.086816, 0, 0, 0, 1, 1,
1.23697, 1.270298, -0.6131379, 0, 0, 0, 1, 1,
1.238062, 0.9171389, 1.040104, 0, 0, 0, 1, 1,
1.246635, 1.878807, 1.512592, 0, 0, 0, 1, 1,
1.247433, -0.8197477, 1.555159, 0, 0, 0, 1, 1,
1.250071, 0.2458208, -0.7241379, 0, 0, 0, 1, 1,
1.254603, -0.7125899, 0.4766912, 0, 0, 0, 1, 1,
1.261431, -2.050954, 2.898021, 1, 1, 1, 1, 1,
1.267281, 0.7875071, 1.952917, 1, 1, 1, 1, 1,
1.272667, -0.8832104, 3.45444, 1, 1, 1, 1, 1,
1.283923, 0.9221959, 0.0264463, 1, 1, 1, 1, 1,
1.287459, -0.4846131, 2.948335, 1, 1, 1, 1, 1,
1.301573, -0.4794655, 2.903815, 1, 1, 1, 1, 1,
1.30276, 0.6581329, 0.4510643, 1, 1, 1, 1, 1,
1.312674, -1.613682, 3.174491, 1, 1, 1, 1, 1,
1.315318, -1.247979, 3.762453, 1, 1, 1, 1, 1,
1.315403, -0.3454871, 1.726082, 1, 1, 1, 1, 1,
1.317229, -1.662685, 2.894013, 1, 1, 1, 1, 1,
1.318918, -1.170336, 2.177327, 1, 1, 1, 1, 1,
1.342446, -0.3452922, 0.7175381, 1, 1, 1, 1, 1,
1.345929, -0.4969376, 3.214643, 1, 1, 1, 1, 1,
1.352334, -0.6629959, 0.9585961, 1, 1, 1, 1, 1,
1.353485, -0.5136746, 1.64592, 0, 0, 1, 1, 1,
1.354797, 0.9367818, 1.777652, 1, 0, 0, 1, 1,
1.355386, -0.7840152, 2.582787, 1, 0, 0, 1, 1,
1.359971, 3.203426, 0.285832, 1, 0, 0, 1, 1,
1.364249, -0.9658865, 1.639149, 1, 0, 0, 1, 1,
1.365795, 0.9022475, 1.631042, 1, 0, 0, 1, 1,
1.36671, -1.100366, 3.43674, 0, 0, 0, 1, 1,
1.369157, -0.06216332, 0.6852615, 0, 0, 0, 1, 1,
1.370816, 0.3788266, 0.4177482, 0, 0, 0, 1, 1,
1.38134, -2.054966, 2.330307, 0, 0, 0, 1, 1,
1.38924, 0.1339122, 0.9005129, 0, 0, 0, 1, 1,
1.395763, 0.268416, 2.244859, 0, 0, 0, 1, 1,
1.411458, -0.2735606, 3.376608, 0, 0, 0, 1, 1,
1.417668, 0.7536737, 1.354129, 1, 1, 1, 1, 1,
1.423283, 1.313866, -0.1534508, 1, 1, 1, 1, 1,
1.431894, -0.4010869, 3.024529, 1, 1, 1, 1, 1,
1.440243, -0.6816128, 1.293486, 1, 1, 1, 1, 1,
1.442459, 0.554436, 3.039963, 1, 1, 1, 1, 1,
1.457822, -0.1756763, 0.5577787, 1, 1, 1, 1, 1,
1.462338, 1.201389, 2.612154, 1, 1, 1, 1, 1,
1.464467, -1.435099, 3.745493, 1, 1, 1, 1, 1,
1.483028, 0.590295, 1.049343, 1, 1, 1, 1, 1,
1.484518, 0.2584242, 1.72479, 1, 1, 1, 1, 1,
1.485523, -0.1987861, 2.340971, 1, 1, 1, 1, 1,
1.488136, 1.180169, 0.4627078, 1, 1, 1, 1, 1,
1.488185, -0.4742786, 2.825902, 1, 1, 1, 1, 1,
1.492873, 0.3043777, 1.653649, 1, 1, 1, 1, 1,
1.492905, 0.441913, 1.734576, 1, 1, 1, 1, 1,
1.502584, 0.3244463, 1.291272, 0, 0, 1, 1, 1,
1.529725, -0.7957129, 1.436639, 1, 0, 0, 1, 1,
1.556291, -0.4781556, 2.152994, 1, 0, 0, 1, 1,
1.586216, 1.269988, -1.411082, 1, 0, 0, 1, 1,
1.61633, 2.201871, 0.7954336, 1, 0, 0, 1, 1,
1.628049, 0.8100585, 2.07762, 1, 0, 0, 1, 1,
1.663688, 1.252498, 0.1622069, 0, 0, 0, 1, 1,
1.691623, 2.119604, 1.404159, 0, 0, 0, 1, 1,
1.71002, 0.2062987, 1.539714, 0, 0, 0, 1, 1,
1.716193, 1.58361, 0.1487652, 0, 0, 0, 1, 1,
1.75849, 0.407569, 1.800161, 0, 0, 0, 1, 1,
1.779673, 1.484138, 1.178278, 0, 0, 0, 1, 1,
1.847525, 2.296119, 0.4245957, 0, 0, 0, 1, 1,
1.853592, -0.271365, 3.956917, 1, 1, 1, 1, 1,
1.87762, -1.310949, 2.224737, 1, 1, 1, 1, 1,
1.905278, -0.6598718, 2.141815, 1, 1, 1, 1, 1,
1.915682, -0.2213551, 2.15466, 1, 1, 1, 1, 1,
1.968913, -0.8361225, 2.35109, 1, 1, 1, 1, 1,
1.970307, 1.202572, 0.3236089, 1, 1, 1, 1, 1,
1.998469, -0.008789207, 2.490429, 1, 1, 1, 1, 1,
1.999634, 0.08575397, 1.202659, 1, 1, 1, 1, 1,
2.031862, 2.222665, 2.041399, 1, 1, 1, 1, 1,
2.037146, 0.9603246, -0.8957915, 1, 1, 1, 1, 1,
2.038229, 0.6142053, 0.688737, 1, 1, 1, 1, 1,
2.109307, -0.07909188, 2.131031, 1, 1, 1, 1, 1,
2.144446, 0.610469, 0.8449043, 1, 1, 1, 1, 1,
2.166817, 0.4464863, 1.087716, 1, 1, 1, 1, 1,
2.18911, -0.5478871, 0.98628, 1, 1, 1, 1, 1,
2.21729, 0.7079719, 2.802082, 0, 0, 1, 1, 1,
2.222929, -0.8874269, 1.298412, 1, 0, 0, 1, 1,
2.224438, -0.1155961, 1.180534, 1, 0, 0, 1, 1,
2.233857, -1.145212, 2.301177, 1, 0, 0, 1, 1,
2.256557, 0.3867928, 1.701464, 1, 0, 0, 1, 1,
2.260111, -0.3312438, 2.777121, 1, 0, 0, 1, 1,
2.264369, -2.613142, 4.024467, 0, 0, 0, 1, 1,
2.26644, 0.6376863, 0.9674833, 0, 0, 0, 1, 1,
2.268644, -0.4285452, 3.948877, 0, 0, 0, 1, 1,
2.311529, 0.1931299, 0.1630314, 0, 0, 0, 1, 1,
2.367939, -0.5536512, 1.453896, 0, 0, 0, 1, 1,
2.414242, -0.04253079, -0.08585653, 0, 0, 0, 1, 1,
2.463694, -1.26157, 0.4922169, 0, 0, 0, 1, 1,
2.68147, 0.1163613, 0.04992425, 1, 1, 1, 1, 1,
2.709567, 1.731447, 1.80326, 1, 1, 1, 1, 1,
2.76848, -0.8544759, 2.082759, 1, 1, 1, 1, 1,
2.850342, -0.5422387, 3.277649, 1, 1, 1, 1, 1,
2.965202, 0.6369416, 2.215373, 1, 1, 1, 1, 1,
3.037972, 0.6041271, 1.478382, 1, 1, 1, 1, 1,
3.40631, -0.2350679, 2.328928, 1, 1, 1, 1, 1
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
var radius = 9.736306;
var distance = 34.19836;
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
mvMatrix.translate( -0.361504, -0.06555748, -0.172153 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.19836);
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
