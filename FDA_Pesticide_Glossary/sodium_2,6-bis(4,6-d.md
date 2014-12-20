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
-2.897217, -0.1494788, -0.8772258, 1, 0, 0, 1,
-2.727639, 1.031128, -0.591804, 1, 0.007843138, 0, 1,
-2.672102, 0.4253822, -3.003607, 1, 0.01176471, 0, 1,
-2.663936, -2.604475, -2.984269, 1, 0.01960784, 0, 1,
-2.635681, 1.315237, -1.092227, 1, 0.02352941, 0, 1,
-2.514116, -0.9172608, -3.098615, 1, 0.03137255, 0, 1,
-2.406936, -1.440464, -3.003152, 1, 0.03529412, 0, 1,
-2.400062, -1.190618, -1.422441, 1, 0.04313726, 0, 1,
-2.381606, -0.8878695, -0.9071934, 1, 0.04705882, 0, 1,
-2.345765, -0.601786, -3.262508, 1, 0.05490196, 0, 1,
-2.338622, 2.073466, -2.796949, 1, 0.05882353, 0, 1,
-2.31602, -1.332515, -0.9350305, 1, 0.06666667, 0, 1,
-2.314015, 0.275571, -1.101777, 1, 0.07058824, 0, 1,
-2.18539, 1.182562, -0.05444564, 1, 0.07843138, 0, 1,
-2.168099, 0.3432272, -0.06181925, 1, 0.08235294, 0, 1,
-2.11387, 1.565883, 1.246633, 1, 0.09019608, 0, 1,
-2.099243, 0.8790557, -1.630751, 1, 0.09411765, 0, 1,
-2.098091, -0.1240402, -0.7572234, 1, 0.1019608, 0, 1,
-2.085018, -0.5095312, -2.663548, 1, 0.1098039, 0, 1,
-2.030548, 0.04330291, -0.7640415, 1, 0.1137255, 0, 1,
-2.017423, -0.02682717, -0.849121, 1, 0.1215686, 0, 1,
-2.003358, 0.8110863, -0.5968484, 1, 0.1254902, 0, 1,
-1.988151, 0.7293518, -0.4444291, 1, 0.1333333, 0, 1,
-1.959908, 0.05374986, -1.663446, 1, 0.1372549, 0, 1,
-1.950973, 0.4958361, -0.3269058, 1, 0.145098, 0, 1,
-1.943916, -3.110631, -3.639637, 1, 0.1490196, 0, 1,
-1.941386, 1.224939, -1.797421, 1, 0.1568628, 0, 1,
-1.932013, 1.985109, 0.1011802, 1, 0.1607843, 0, 1,
-1.845002, -0.08808693, -2.482971, 1, 0.1686275, 0, 1,
-1.844565, -1.146603, -1.338782, 1, 0.172549, 0, 1,
-1.826614, 0.7512128, -2.526632, 1, 0.1803922, 0, 1,
-1.824192, 1.749909, 0.06309824, 1, 0.1843137, 0, 1,
-1.818498, -0.5227525, -0.01239644, 1, 0.1921569, 0, 1,
-1.794874, -0.8953583, -2.295794, 1, 0.1960784, 0, 1,
-1.776874, -0.1835431, -1.239713, 1, 0.2039216, 0, 1,
-1.773968, 0.01620011, -2.376009, 1, 0.2117647, 0, 1,
-1.758818, 0.6579426, -1.015345, 1, 0.2156863, 0, 1,
-1.758048, 0.4835049, -3.164324, 1, 0.2235294, 0, 1,
-1.744462, -0.803106, -3.682462, 1, 0.227451, 0, 1,
-1.738963, -0.3915177, -2.026892, 1, 0.2352941, 0, 1,
-1.732762, -1.256424, -2.504109, 1, 0.2392157, 0, 1,
-1.71135, -0.1996516, -1.877447, 1, 0.2470588, 0, 1,
-1.697075, -0.7718326, -1.842607, 1, 0.2509804, 0, 1,
-1.679142, -1.244994, -1.075207, 1, 0.2588235, 0, 1,
-1.661343, -0.4420851, -3.627774, 1, 0.2627451, 0, 1,
-1.658246, 2.208128, -1.356295, 1, 0.2705882, 0, 1,
-1.655476, 0.238222, -0.9551319, 1, 0.2745098, 0, 1,
-1.643297, -0.6249865, -1.476639, 1, 0.282353, 0, 1,
-1.633875, -1.297493, -2.762434, 1, 0.2862745, 0, 1,
-1.632685, 1.735015, -1.187058, 1, 0.2941177, 0, 1,
-1.632437, -0.8885593, -2.631954, 1, 0.3019608, 0, 1,
-1.618485, -1.458543, -1.05359, 1, 0.3058824, 0, 1,
-1.610091, -0.8601774, -1.614543, 1, 0.3137255, 0, 1,
-1.599934, 0.1923292, -2.174366, 1, 0.3176471, 0, 1,
-1.595509, -0.3195587, -1.00009, 1, 0.3254902, 0, 1,
-1.58098, -0.4379084, -2.702819, 1, 0.3294118, 0, 1,
-1.559967, -1.349271, -1.202572, 1, 0.3372549, 0, 1,
-1.551358, 0.114053, -2.020042, 1, 0.3411765, 0, 1,
-1.549719, 0.7104735, 0.5338736, 1, 0.3490196, 0, 1,
-1.54915, 1.014297, -1.142616, 1, 0.3529412, 0, 1,
-1.526792, -0.2109744, -1.665858, 1, 0.3607843, 0, 1,
-1.519946, 1.089905, -1.105452, 1, 0.3647059, 0, 1,
-1.519766, 2.071988, 0.6798478, 1, 0.372549, 0, 1,
-1.514624, 0.9006933, -2.120802, 1, 0.3764706, 0, 1,
-1.502957, -1.788309, -4.172471, 1, 0.3843137, 0, 1,
-1.498617, 0.8978274, -1.006463, 1, 0.3882353, 0, 1,
-1.497549, 1.374656, -1.667812, 1, 0.3960784, 0, 1,
-1.48199, 2.100224, -1.634479, 1, 0.4039216, 0, 1,
-1.467756, -1.092354, -0.8292453, 1, 0.4078431, 0, 1,
-1.464171, -0.9381499, -2.988955, 1, 0.4156863, 0, 1,
-1.451098, 0.8301901, -1.263152, 1, 0.4196078, 0, 1,
-1.446836, 0.9531857, -2.170152, 1, 0.427451, 0, 1,
-1.44075, 0.07136829, -0.733483, 1, 0.4313726, 0, 1,
-1.43995, -1.499859, -2.061402, 1, 0.4392157, 0, 1,
-1.439617, -2.264559, -2.697742, 1, 0.4431373, 0, 1,
-1.420811, -0.5755913, -3.844709, 1, 0.4509804, 0, 1,
-1.417981, 1.991413, -0.5060015, 1, 0.454902, 0, 1,
-1.412942, 0.01648065, -1.385842, 1, 0.4627451, 0, 1,
-1.411217, 0.9747809, -2.612047, 1, 0.4666667, 0, 1,
-1.407962, 1.137262, -0.5564181, 1, 0.4745098, 0, 1,
-1.401813, 0.207935, 0.511304, 1, 0.4784314, 0, 1,
-1.386324, -0.2701392, -2.463693, 1, 0.4862745, 0, 1,
-1.380801, -0.6295104, -0.00120152, 1, 0.4901961, 0, 1,
-1.375056, -1.422339, -2.566208, 1, 0.4980392, 0, 1,
-1.374607, 0.1451001, 0.0452659, 1, 0.5058824, 0, 1,
-1.372102, -0.6959926, -1.886936, 1, 0.509804, 0, 1,
-1.370777, 0.6522765, -1.33393, 1, 0.5176471, 0, 1,
-1.363128, -0.1991108, -3.652118, 1, 0.5215687, 0, 1,
-1.350498, -0.8354902, -0.4062317, 1, 0.5294118, 0, 1,
-1.342193, 2.128893, -0.6045434, 1, 0.5333334, 0, 1,
-1.335395, -2.464987, -1.957936, 1, 0.5411765, 0, 1,
-1.332766, 0.05716426, -1.278993, 1, 0.5450981, 0, 1,
-1.331794, -0.6831976, -1.080429, 1, 0.5529412, 0, 1,
-1.328618, 0.7928486, -0.185026, 1, 0.5568628, 0, 1,
-1.326664, -0.3717659, -1.687552, 1, 0.5647059, 0, 1,
-1.326585, 0.4100954, -0.3868573, 1, 0.5686275, 0, 1,
-1.322964, 0.6679769, -0.806178, 1, 0.5764706, 0, 1,
-1.314703, -1.056457, -3.652709, 1, 0.5803922, 0, 1,
-1.308582, -0.6303879, -1.380755, 1, 0.5882353, 0, 1,
-1.306144, -0.8834727, -3.179946, 1, 0.5921569, 0, 1,
-1.298796, 0.9506763, -1.631398, 1, 0.6, 0, 1,
-1.296693, -0.4131868, -3.113588, 1, 0.6078432, 0, 1,
-1.285202, 0.1405565, -1.295549, 1, 0.6117647, 0, 1,
-1.280183, -0.2690209, -0.8691079, 1, 0.6196079, 0, 1,
-1.278237, 0.1220534, 0.2047164, 1, 0.6235294, 0, 1,
-1.270298, -0.1776602, -0.6890929, 1, 0.6313726, 0, 1,
-1.266604, -0.7711999, -1.04113, 1, 0.6352941, 0, 1,
-1.263023, 1.96683, -1.058518, 1, 0.6431373, 0, 1,
-1.25838, -1.710142, -2.646364, 1, 0.6470588, 0, 1,
-1.249665, 0.7760412, -1.281005, 1, 0.654902, 0, 1,
-1.245937, -0.03433503, -1.326748, 1, 0.6588235, 0, 1,
-1.242498, -1.060893, -0.6205173, 1, 0.6666667, 0, 1,
-1.226923, 0.0129014, -1.223782, 1, 0.6705883, 0, 1,
-1.226715, 0.07840361, -1.133469, 1, 0.6784314, 0, 1,
-1.220896, -2.676521, -3.058498, 1, 0.682353, 0, 1,
-1.220322, -0.04229599, -2.021054, 1, 0.6901961, 0, 1,
-1.219052, -0.3160259, -0.2032674, 1, 0.6941177, 0, 1,
-1.213367, -0.2090331, -2.619309, 1, 0.7019608, 0, 1,
-1.205815, -0.4321001, -2.028361, 1, 0.7098039, 0, 1,
-1.202955, -0.4403157, -1.981725, 1, 0.7137255, 0, 1,
-1.197706, -0.2127227, -1.57415, 1, 0.7215686, 0, 1,
-1.18596, 0.7864706, -0.6023448, 1, 0.7254902, 0, 1,
-1.182796, -0.002475864, -0.4803479, 1, 0.7333333, 0, 1,
-1.181916, 0.2209342, -0.5798576, 1, 0.7372549, 0, 1,
-1.180955, -0.842518, -2.476976, 1, 0.7450981, 0, 1,
-1.176983, -0.1276392, -0.6045139, 1, 0.7490196, 0, 1,
-1.168693, -1.123478, -1.784814, 1, 0.7568628, 0, 1,
-1.166383, 1.114652, -0.8764519, 1, 0.7607843, 0, 1,
-1.15554, -0.6399895, -4.239286, 1, 0.7686275, 0, 1,
-1.148069, 0.1274861, -2.3148, 1, 0.772549, 0, 1,
-1.146601, 1.757757, -2.486769, 1, 0.7803922, 0, 1,
-1.14146, 0.4001738, -2.950269, 1, 0.7843137, 0, 1,
-1.137203, -0.8257617, -3.628007, 1, 0.7921569, 0, 1,
-1.131909, 0.1747374, -0.783115, 1, 0.7960784, 0, 1,
-1.126733, 2.11646, -0.5632296, 1, 0.8039216, 0, 1,
-1.117433, 1.112317, -2.199105, 1, 0.8117647, 0, 1,
-1.116957, 0.6349986, -1.282832, 1, 0.8156863, 0, 1,
-1.109608, 1.348346, -1.342829, 1, 0.8235294, 0, 1,
-1.099308, 0.5019131, -0.8454509, 1, 0.827451, 0, 1,
-1.09628, -1.033425, -1.878492, 1, 0.8352941, 0, 1,
-1.090982, -1.261495, -3.450905, 1, 0.8392157, 0, 1,
-1.089015, -0.4809296, -0.5781047, 1, 0.8470588, 0, 1,
-1.085982, 0.02611069, -1.246413, 1, 0.8509804, 0, 1,
-1.08575, 0.1390321, -1.740055, 1, 0.8588235, 0, 1,
-1.082727, 0.5304608, -0.4684004, 1, 0.8627451, 0, 1,
-1.066584, 1.435086, -0.514861, 1, 0.8705882, 0, 1,
-1.065279, 0.1918919, -2.851645, 1, 0.8745098, 0, 1,
-1.058618, -0.660273, -1.931945, 1, 0.8823529, 0, 1,
-1.051055, -0.2839735, -2.841528, 1, 0.8862745, 0, 1,
-1.03743, 0.6775824, -1.951341, 1, 0.8941177, 0, 1,
-1.033484, 1.271453, -0.0806658, 1, 0.8980392, 0, 1,
-1.028808, -0.4015279, -3.32788, 1, 0.9058824, 0, 1,
-1.023087, 1.94908, -1.5571, 1, 0.9137255, 0, 1,
-1.020307, 1.649882, -1.264941, 1, 0.9176471, 0, 1,
-1.016256, 0.1470613, -0.9068367, 1, 0.9254902, 0, 1,
-1.014717, 1.126746, 0.1079935, 1, 0.9294118, 0, 1,
-1.004899, 0.3890564, -1.681312, 1, 0.9372549, 0, 1,
-1.002326, -0.07964791, -2.752782, 1, 0.9411765, 0, 1,
-0.9895114, -1.016807, -2.51341, 1, 0.9490196, 0, 1,
-0.9854086, -0.6625453, -2.835565, 1, 0.9529412, 0, 1,
-0.982538, 1.740335, -0.6206989, 1, 0.9607843, 0, 1,
-0.9742626, 0.982657, -0.245279, 1, 0.9647059, 0, 1,
-0.9721292, -0.1042994, -0.9510862, 1, 0.972549, 0, 1,
-0.9715517, 0.4361531, -1.664934, 1, 0.9764706, 0, 1,
-0.9653614, 0.09786031, 0.7415372, 1, 0.9843137, 0, 1,
-0.9641564, 0.7856638, -0.1727111, 1, 0.9882353, 0, 1,
-0.9591731, 1.144208, -2.070701, 1, 0.9960784, 0, 1,
-0.9587635, -0.1757694, -2.950359, 0.9960784, 1, 0, 1,
-0.9549981, 0.2684068, -0.2115761, 0.9921569, 1, 0, 1,
-0.9540495, -1.071697, -4.288236, 0.9843137, 1, 0, 1,
-0.9458131, -1.713222, -3.090286, 0.9803922, 1, 0, 1,
-0.9429106, 1.058587, 0.2074625, 0.972549, 1, 0, 1,
-0.9427825, -0.8454779, -2.366177, 0.9686275, 1, 0, 1,
-0.9402496, 0.7316958, -1.087458, 0.9607843, 1, 0, 1,
-0.9360704, -1.160108, -2.034254, 0.9568627, 1, 0, 1,
-0.9283875, 1.364974, -0.7230946, 0.9490196, 1, 0, 1,
-0.9255351, 1.232363, -0.8779235, 0.945098, 1, 0, 1,
-0.9175197, -1.441371, -3.843508, 0.9372549, 1, 0, 1,
-0.9175112, -0.4852552, -3.833049, 0.9333333, 1, 0, 1,
-0.9111568, 0.4215302, -1.665695, 0.9254902, 1, 0, 1,
-0.9045643, -1.313938, -0.9744275, 0.9215686, 1, 0, 1,
-0.8972317, 1.314743, -2.462049, 0.9137255, 1, 0, 1,
-0.8946118, 0.9665499, -0.5389771, 0.9098039, 1, 0, 1,
-0.8916367, -0.4470248, -0.5662156, 0.9019608, 1, 0, 1,
-0.8833587, 0.6860747, -2.239749, 0.8941177, 1, 0, 1,
-0.883065, -0.3160337, -2.648226, 0.8901961, 1, 0, 1,
-0.8809373, 1.169411, -2.396645, 0.8823529, 1, 0, 1,
-0.8688959, 0.9928598, -0.184314, 0.8784314, 1, 0, 1,
-0.8602176, -1.908058, -2.967438, 0.8705882, 1, 0, 1,
-0.8553879, 0.1581867, -2.014877, 0.8666667, 1, 0, 1,
-0.8480197, 0.8738836, -1.94354, 0.8588235, 1, 0, 1,
-0.8479142, -0.05493142, -1.068371, 0.854902, 1, 0, 1,
-0.8462456, -0.8249032, -1.345942, 0.8470588, 1, 0, 1,
-0.8433315, -0.06360856, -1.824167, 0.8431373, 1, 0, 1,
-0.8406457, 0.2365848, -1.319577, 0.8352941, 1, 0, 1,
-0.8288795, -1.465915, -3.595383, 0.8313726, 1, 0, 1,
-0.8248856, -1.090358, -2.600875, 0.8235294, 1, 0, 1,
-0.8233341, -1.856189, -3.185508, 0.8196079, 1, 0, 1,
-0.8210239, -0.9051434, -4.240082, 0.8117647, 1, 0, 1,
-0.8157884, 1.230277, 1.731463, 0.8078431, 1, 0, 1,
-0.8134907, 0.0350287, -1.414974, 0.8, 1, 0, 1,
-0.8080907, -1.966086, -4.539974, 0.7921569, 1, 0, 1,
-0.8076891, -0.7868253, -3.271298, 0.7882353, 1, 0, 1,
-0.8058664, -2.107358, -3.994423, 0.7803922, 1, 0, 1,
-0.8006634, 0.8068474, -1.515458, 0.7764706, 1, 0, 1,
-0.795063, -0.3219805, -1.577039, 0.7686275, 1, 0, 1,
-0.7916942, -0.5091591, -1.557458, 0.7647059, 1, 0, 1,
-0.7907531, 0.5101038, -2.025547, 0.7568628, 1, 0, 1,
-0.7829133, -2.553123, -1.715224, 0.7529412, 1, 0, 1,
-0.7773255, -0.0001158365, -1.246403, 0.7450981, 1, 0, 1,
-0.7749316, -0.4049254, -3.844109, 0.7411765, 1, 0, 1,
-0.7711077, -2.140409, -3.729255, 0.7333333, 1, 0, 1,
-0.7701708, -2.83754, -4.184399, 0.7294118, 1, 0, 1,
-0.7666233, -0.1125945, -2.265672, 0.7215686, 1, 0, 1,
-0.7616947, -2.238111, -2.908334, 0.7176471, 1, 0, 1,
-0.7604915, -1.160557, -2.675426, 0.7098039, 1, 0, 1,
-0.75878, 1.498751, -0.3406449, 0.7058824, 1, 0, 1,
-0.7563497, 0.4286375, -2.245305, 0.6980392, 1, 0, 1,
-0.7505488, -1.398463, -2.817886, 0.6901961, 1, 0, 1,
-0.7473659, -0.4693277, -2.529164, 0.6862745, 1, 0, 1,
-0.7451816, -2.710463, -3.474371, 0.6784314, 1, 0, 1,
-0.7403983, 0.3076151, -1.825229, 0.6745098, 1, 0, 1,
-0.7317053, 0.7938775, -1.26383, 0.6666667, 1, 0, 1,
-0.7254047, 1.327858, -1.021262, 0.6627451, 1, 0, 1,
-0.7237099, -0.2415376, -2.084551, 0.654902, 1, 0, 1,
-0.7235612, -0.09139211, -0.766575, 0.6509804, 1, 0, 1,
-0.722242, -0.5814663, -2.709217, 0.6431373, 1, 0, 1,
-0.7221519, 0.03400488, -1.066996, 0.6392157, 1, 0, 1,
-0.7024208, 0.9524629, 0.3798495, 0.6313726, 1, 0, 1,
-0.6976481, -0.2441898, -1.998864, 0.627451, 1, 0, 1,
-0.6947742, -0.5231129, -3.944293, 0.6196079, 1, 0, 1,
-0.692118, 1.184592, -0.227033, 0.6156863, 1, 0, 1,
-0.6886647, -1.227439, -2.617115, 0.6078432, 1, 0, 1,
-0.6869464, 0.5265195, -0.5527523, 0.6039216, 1, 0, 1,
-0.6804839, 0.8922943, -2.170074, 0.5960785, 1, 0, 1,
-0.6706166, -0.4427354, -0.6577584, 0.5882353, 1, 0, 1,
-0.6676181, 0.1808081, -1.635287, 0.5843138, 1, 0, 1,
-0.6646439, 1.028219, 1.598317, 0.5764706, 1, 0, 1,
-0.6604866, 0.3200053, -1.336558, 0.572549, 1, 0, 1,
-0.6582875, 0.4418849, -0.04136357, 0.5647059, 1, 0, 1,
-0.6579447, 0.3437265, -0.7838153, 0.5607843, 1, 0, 1,
-0.6569881, -2.223372, -0.129528, 0.5529412, 1, 0, 1,
-0.6558907, 0.5539802, -0.506914, 0.5490196, 1, 0, 1,
-0.648143, -0.7909299, -1.504533, 0.5411765, 1, 0, 1,
-0.6343477, -0.1195166, -2.88208, 0.5372549, 1, 0, 1,
-0.621945, -1.894697, -3.230041, 0.5294118, 1, 0, 1,
-0.620581, 0.4923937, 0.341475, 0.5254902, 1, 0, 1,
-0.6199903, 1.379713, 0.9373125, 0.5176471, 1, 0, 1,
-0.6130345, 1.794605, -1.854812, 0.5137255, 1, 0, 1,
-0.6126986, -0.1093073, -1.449478, 0.5058824, 1, 0, 1,
-0.6013453, 0.7779399, -0.613803, 0.5019608, 1, 0, 1,
-0.5861832, 0.530248, -3.053003, 0.4941176, 1, 0, 1,
-0.5782233, -0.2539478, -0.1086549, 0.4862745, 1, 0, 1,
-0.5770022, -0.2920423, -1.311579, 0.4823529, 1, 0, 1,
-0.575471, 0.8585879, -0.2603881, 0.4745098, 1, 0, 1,
-0.5718229, -0.1136239, -1.865366, 0.4705882, 1, 0, 1,
-0.5699343, -1.144539, -2.705457, 0.4627451, 1, 0, 1,
-0.5663201, -0.7786825, -3.304591, 0.4588235, 1, 0, 1,
-0.5659059, -0.344722, -1.87451, 0.4509804, 1, 0, 1,
-0.5642856, -2.177865, -2.310824, 0.4470588, 1, 0, 1,
-0.5624065, -1.67261, -0.3553124, 0.4392157, 1, 0, 1,
-0.559835, -1.102355, -2.791708, 0.4352941, 1, 0, 1,
-0.5595913, -0.2181726, -2.547222, 0.427451, 1, 0, 1,
-0.5593915, 0.4615495, -1.391129, 0.4235294, 1, 0, 1,
-0.5551867, 0.3675359, -0.3247243, 0.4156863, 1, 0, 1,
-0.5516158, 0.3742859, -1.698939, 0.4117647, 1, 0, 1,
-0.5508769, -1.581754, -2.026292, 0.4039216, 1, 0, 1,
-0.5508483, 0.6007963, -0.8788828, 0.3960784, 1, 0, 1,
-0.5455296, 0.5194752, -1.715655, 0.3921569, 1, 0, 1,
-0.5451502, -0.5763011, -4.173978, 0.3843137, 1, 0, 1,
-0.5414442, -0.1524327, -2.447075, 0.3803922, 1, 0, 1,
-0.5382311, -1.463867, -3.480575, 0.372549, 1, 0, 1,
-0.5380436, -1.587546, -2.2359, 0.3686275, 1, 0, 1,
-0.5375002, -1.215593, -4.026279, 0.3607843, 1, 0, 1,
-0.5365785, -1.598162, -2.239256, 0.3568628, 1, 0, 1,
-0.5347036, 1.154582, -2.507189, 0.3490196, 1, 0, 1,
-0.5337192, -1.94912, -3.370728, 0.345098, 1, 0, 1,
-0.5287539, 0.5297216, 0.1103059, 0.3372549, 1, 0, 1,
-0.5279313, 0.6338903, 1.828, 0.3333333, 1, 0, 1,
-0.523079, 1.697276, 0.2352913, 0.3254902, 1, 0, 1,
-0.5226023, 1.415429, -0.582113, 0.3215686, 1, 0, 1,
-0.5221255, 1.323427, -1.446842, 0.3137255, 1, 0, 1,
-0.5195393, 0.6576989, -0.8265571, 0.3098039, 1, 0, 1,
-0.5160587, 0.1635444, 0.06403849, 0.3019608, 1, 0, 1,
-0.5106737, 0.3257352, -0.159528, 0.2941177, 1, 0, 1,
-0.5084728, 1.915706, -0.234168, 0.2901961, 1, 0, 1,
-0.5065453, 0.003076554, -0.1616214, 0.282353, 1, 0, 1,
-0.5063126, 1.006512, -0.4021147, 0.2784314, 1, 0, 1,
-0.5033235, 0.5481855, -1.946574, 0.2705882, 1, 0, 1,
-0.5024214, -1.068905, -1.985938, 0.2666667, 1, 0, 1,
-0.5020229, -0.6761478, -1.756103, 0.2588235, 1, 0, 1,
-0.4917093, 1.848707, 0.2644944, 0.254902, 1, 0, 1,
-0.4903752, 0.2738567, 0.1993995, 0.2470588, 1, 0, 1,
-0.4874112, -0.1843257, -1.311221, 0.2431373, 1, 0, 1,
-0.4848078, -0.02544733, -0.6855063, 0.2352941, 1, 0, 1,
-0.4845245, 0.9743659, 1.413216, 0.2313726, 1, 0, 1,
-0.480821, 0.3710811, -2.432091, 0.2235294, 1, 0, 1,
-0.4795938, -0.4327514, -2.715826, 0.2196078, 1, 0, 1,
-0.4784009, -0.641668, -3.083861, 0.2117647, 1, 0, 1,
-0.47728, -0.5370737, -4.137905, 0.2078431, 1, 0, 1,
-0.4728328, 0.8379427, -1.250909, 0.2, 1, 0, 1,
-0.4725124, 0.429109, -1.6464, 0.1921569, 1, 0, 1,
-0.4707254, 2.637228, 0.717478, 0.1882353, 1, 0, 1,
-0.4670103, 2.4359, 0.7626955, 0.1803922, 1, 0, 1,
-0.4654817, -1.255301, -3.404964, 0.1764706, 1, 0, 1,
-0.4637072, -0.1028005, -2.730421, 0.1686275, 1, 0, 1,
-0.462071, -0.1281234, -1.880745, 0.1647059, 1, 0, 1,
-0.4596827, 1.508286, -1.963625, 0.1568628, 1, 0, 1,
-0.4507713, 0.6659147, -3.023784, 0.1529412, 1, 0, 1,
-0.4502651, 1.486806, -1.13746, 0.145098, 1, 0, 1,
-0.4485436, 0.3097987, -1.050748, 0.1411765, 1, 0, 1,
-0.4471699, 0.05870171, -3.129805, 0.1333333, 1, 0, 1,
-0.4446815, 0.1886259, -0.9831797, 0.1294118, 1, 0, 1,
-0.4444771, 0.1923881, -2.583706, 0.1215686, 1, 0, 1,
-0.4441294, 0.554538, -2.085384, 0.1176471, 1, 0, 1,
-0.4316505, -1.393111, -3.205738, 0.1098039, 1, 0, 1,
-0.4293541, -0.9494147, -2.6901, 0.1058824, 1, 0, 1,
-0.4256364, -0.8469267, -4.990243, 0.09803922, 1, 0, 1,
-0.4245766, 0.3286137, -0.01783632, 0.09019608, 1, 0, 1,
-0.4207522, -0.6142641, -1.779276, 0.08627451, 1, 0, 1,
-0.4173312, -1.927417, -2.140589, 0.07843138, 1, 0, 1,
-0.4147567, 0.7590147, 0.1464708, 0.07450981, 1, 0, 1,
-0.4139253, 1.206001, 0.9668117, 0.06666667, 1, 0, 1,
-0.4097822, 0.4400158, 0.5171589, 0.0627451, 1, 0, 1,
-0.4092185, 0.9104472, -1.546287, 0.05490196, 1, 0, 1,
-0.4030119, 0.8958441, -0.1093297, 0.05098039, 1, 0, 1,
-0.402232, -1.126163, -4.309669, 0.04313726, 1, 0, 1,
-0.4003884, -0.8083596, -3.054659, 0.03921569, 1, 0, 1,
-0.4003653, -0.983179, -3.990688, 0.03137255, 1, 0, 1,
-0.3983679, 0.0185475, -4.304846, 0.02745098, 1, 0, 1,
-0.3967562, 0.02671864, -1.741624, 0.01960784, 1, 0, 1,
-0.3960965, 0.3699872, -2.622476, 0.01568628, 1, 0, 1,
-0.3939424, 1.10168, 0.675364, 0.007843138, 1, 0, 1,
-0.39338, 2.813784, 0.4618024, 0.003921569, 1, 0, 1,
-0.3930854, 0.7827092, 1.762468, 0, 1, 0.003921569, 1,
-0.3899684, 0.01831537, -1.730031, 0, 1, 0.01176471, 1,
-0.3892789, 0.5521662, -1.029723, 0, 1, 0.01568628, 1,
-0.3889621, 1.179329, -0.08408508, 0, 1, 0.02352941, 1,
-0.3862627, 1.054058, -0.7197474, 0, 1, 0.02745098, 1,
-0.38404, -0.1622382, -0.5899683, 0, 1, 0.03529412, 1,
-0.3837966, 0.6420416, -0.6272197, 0, 1, 0.03921569, 1,
-0.3828979, 0.3032823, -1.48394, 0, 1, 0.04705882, 1,
-0.3818486, -1.11619, -2.660772, 0, 1, 0.05098039, 1,
-0.3737633, -1.424988, -2.539809, 0, 1, 0.05882353, 1,
-0.3716346, 1.632483, 0.003536509, 0, 1, 0.0627451, 1,
-0.3642753, 0.7687362, -0.9627218, 0, 1, 0.07058824, 1,
-0.3639748, 0.01449619, -2.769168, 0, 1, 0.07450981, 1,
-0.3584447, 0.2279913, -2.071526, 0, 1, 0.08235294, 1,
-0.3581634, -0.3282403, -2.058728, 0, 1, 0.08627451, 1,
-0.3487785, 0.3214107, -0.5294986, 0, 1, 0.09411765, 1,
-0.3479091, -0.7252967, -3.826798, 0, 1, 0.1019608, 1,
-0.3461321, 1.904669, -1.673248, 0, 1, 0.1058824, 1,
-0.3426754, -0.2191932, -3.582372, 0, 1, 0.1137255, 1,
-0.3416444, 0.2272352, -1.307298, 0, 1, 0.1176471, 1,
-0.334325, -1.083344, -2.806416, 0, 1, 0.1254902, 1,
-0.3335987, -1.307873, -3.958757, 0, 1, 0.1294118, 1,
-0.3287849, -0.1444208, -1.665624, 0, 1, 0.1372549, 1,
-0.3270804, -0.3030771, -1.373966, 0, 1, 0.1411765, 1,
-0.3249846, 0.5708838, 0.765167, 0, 1, 0.1490196, 1,
-0.3247246, 0.44947, -1.830912, 0, 1, 0.1529412, 1,
-0.323397, -1.389436, -2.793496, 0, 1, 0.1607843, 1,
-0.3191979, -0.1819122, -1.584657, 0, 1, 0.1647059, 1,
-0.3166125, -0.03995335, -2.464055, 0, 1, 0.172549, 1,
-0.3129641, -0.3254734, -1.796942, 0, 1, 0.1764706, 1,
-0.3113524, -0.6046733, -1.115286, 0, 1, 0.1843137, 1,
-0.3093593, -0.4425085, -3.041589, 0, 1, 0.1882353, 1,
-0.3040067, -3.0272, -3.012855, 0, 1, 0.1960784, 1,
-0.3024294, 0.238931, -1.080843, 0, 1, 0.2039216, 1,
-0.3023882, -0.5902575, -2.78013, 0, 1, 0.2078431, 1,
-0.3017575, -0.3374153, -0.7540244, 0, 1, 0.2156863, 1,
-0.2997671, -0.1811942, -2.546637, 0, 1, 0.2196078, 1,
-0.2970758, -1.485829, -2.240417, 0, 1, 0.227451, 1,
-0.2895396, -0.2819818, -3.195867, 0, 1, 0.2313726, 1,
-0.2894251, -1.19461, -4.273532, 0, 1, 0.2392157, 1,
-0.288963, 1.575141, -1.342103, 0, 1, 0.2431373, 1,
-0.2866292, 0.4159344, 0.2784387, 0, 1, 0.2509804, 1,
-0.2814616, 0.3548759, -1.533166, 0, 1, 0.254902, 1,
-0.2808, 1.197664, 1.030329, 0, 1, 0.2627451, 1,
-0.2796385, 1.147516, 0.09823353, 0, 1, 0.2666667, 1,
-0.2790374, 0.9235441, -1.036236, 0, 1, 0.2745098, 1,
-0.2776691, -0.6239025, -1.975462, 0, 1, 0.2784314, 1,
-0.2748083, 0.5473836, -0.3318772, 0, 1, 0.2862745, 1,
-0.2747347, 0.8417515, 0.3754704, 0, 1, 0.2901961, 1,
-0.2673507, -1.269426, -1.958281, 0, 1, 0.2980392, 1,
-0.2671321, -2.109418, -2.714042, 0, 1, 0.3058824, 1,
-0.2629706, 0.2808988, 0.4460356, 0, 1, 0.3098039, 1,
-0.260261, 1.683056, -0.5134766, 0, 1, 0.3176471, 1,
-0.2601032, -0.1694721, -3.195422, 0, 1, 0.3215686, 1,
-0.2584417, 0.2437311, -2.084852, 0, 1, 0.3294118, 1,
-0.256976, -0.1011776, -4.157025, 0, 1, 0.3333333, 1,
-0.2547022, -0.07261351, -1.389032, 0, 1, 0.3411765, 1,
-0.2477031, 0.9440744, -0.1032558, 0, 1, 0.345098, 1,
-0.2429339, 0.4052918, 0.01309118, 0, 1, 0.3529412, 1,
-0.2354546, -0.8985514, -2.775038, 0, 1, 0.3568628, 1,
-0.2351504, -0.6643589, -2.029551, 0, 1, 0.3647059, 1,
-0.2338734, -1.466039, -2.864106, 0, 1, 0.3686275, 1,
-0.2329711, 0.4316697, -0.1447482, 0, 1, 0.3764706, 1,
-0.2302195, -1.040185, -4.556656, 0, 1, 0.3803922, 1,
-0.2281163, -0.1512136, -1.863251, 0, 1, 0.3882353, 1,
-0.2280604, 0.1542521, -1.3909, 0, 1, 0.3921569, 1,
-0.2261876, -0.5492295, -2.569252, 0, 1, 0.4, 1,
-0.224595, 0.02507846, 0.4714267, 0, 1, 0.4078431, 1,
-0.2191803, -0.2990596, -2.363945, 0, 1, 0.4117647, 1,
-0.2088103, -0.09676516, -2.036753, 0, 1, 0.4196078, 1,
-0.2074146, 0.2659037, -0.9698068, 0, 1, 0.4235294, 1,
-0.1901826, 1.490741, 1.968958, 0, 1, 0.4313726, 1,
-0.1872576, 1.400676, -0.06237028, 0, 1, 0.4352941, 1,
-0.1865142, 0.2118742, -0.02430126, 0, 1, 0.4431373, 1,
-0.184335, -1.038608, -2.358847, 0, 1, 0.4470588, 1,
-0.1840803, -1.85831, -3.52293, 0, 1, 0.454902, 1,
-0.1783013, 1.095917, 2.635733, 0, 1, 0.4588235, 1,
-0.1750527, -1.905075, -2.745017, 0, 1, 0.4666667, 1,
-0.1719939, 0.3151385, 1.313349, 0, 1, 0.4705882, 1,
-0.1679124, 0.08713114, 0.3670518, 0, 1, 0.4784314, 1,
-0.1649814, 1.185018, -1.449978, 0, 1, 0.4823529, 1,
-0.1631746, -0.901428, -2.351513, 0, 1, 0.4901961, 1,
-0.1594809, -2.743945, -2.799345, 0, 1, 0.4941176, 1,
-0.1588905, 0.1952527, 0.1098586, 0, 1, 0.5019608, 1,
-0.1578635, 1.610619, 0.3681395, 0, 1, 0.509804, 1,
-0.1530519, 0.06677582, -0.2178219, 0, 1, 0.5137255, 1,
-0.1484171, -0.3340026, -2.886161, 0, 1, 0.5215687, 1,
-0.1458648, -1.008155, -2.195395, 0, 1, 0.5254902, 1,
-0.145098, -1.145003, -1.909694, 0, 1, 0.5333334, 1,
-0.1428505, 0.4778106, 0.4770986, 0, 1, 0.5372549, 1,
-0.1390477, 1.169996, -1.128691, 0, 1, 0.5450981, 1,
-0.1349506, 2.351337, -0.3202125, 0, 1, 0.5490196, 1,
-0.1301326, -0.9678919, -2.795098, 0, 1, 0.5568628, 1,
-0.1202303, 0.6159616, 0.6690742, 0, 1, 0.5607843, 1,
-0.1183295, 0.08684297, -0.5890229, 0, 1, 0.5686275, 1,
-0.1146004, -0.6924096, -5.035023, 0, 1, 0.572549, 1,
-0.1090667, -0.01548217, -3.726018, 0, 1, 0.5803922, 1,
-0.1065411, 0.7257866, -1.525645, 0, 1, 0.5843138, 1,
-0.1064318, 0.4381573, -1.324933, 0, 1, 0.5921569, 1,
-0.1058346, -0.198604, -2.269902, 0, 1, 0.5960785, 1,
-0.1038476, 1.319779, 0.5509353, 0, 1, 0.6039216, 1,
-0.1026148, -0.444205, -3.624436, 0, 1, 0.6117647, 1,
-0.09557113, 0.1276179, 1.017648, 0, 1, 0.6156863, 1,
-0.0949185, 0.7852567, 1.352358, 0, 1, 0.6235294, 1,
-0.08980624, -0.03104442, -2.136121, 0, 1, 0.627451, 1,
-0.08806243, -0.585381, -1.890972, 0, 1, 0.6352941, 1,
-0.08414425, -1.004682, -4.770091, 0, 1, 0.6392157, 1,
-0.08129723, -0.6037859, -2.240656, 0, 1, 0.6470588, 1,
-0.07789508, 0.2527698, -0.1080837, 0, 1, 0.6509804, 1,
-0.07776953, 3.139397, 1.332878, 0, 1, 0.6588235, 1,
-0.07698348, -1.029744, -1.467084, 0, 1, 0.6627451, 1,
-0.07651256, -0.3008613, -4.065355, 0, 1, 0.6705883, 1,
-0.07557502, 0.1130455, -0.08323345, 0, 1, 0.6745098, 1,
-0.07424507, 2.003354, -0.7230493, 0, 1, 0.682353, 1,
-0.07292216, 0.4157969, 0.1893733, 0, 1, 0.6862745, 1,
-0.07197147, 0.493578, -1.360559, 0, 1, 0.6941177, 1,
-0.0698645, 0.6142957, 0.2303646, 0, 1, 0.7019608, 1,
-0.06635749, -1.068956, -1.075316, 0, 1, 0.7058824, 1,
-0.06558077, -2.178462, -5.063455, 0, 1, 0.7137255, 1,
-0.06127627, -0.3349083, -2.292437, 0, 1, 0.7176471, 1,
-0.06121176, -0.1100401, -1.783552, 0, 1, 0.7254902, 1,
-0.06076483, 0.542403, 0.6147598, 0, 1, 0.7294118, 1,
-0.05999762, 0.9918455, 1.417479, 0, 1, 0.7372549, 1,
-0.05650347, 0.241129, -0.3774204, 0, 1, 0.7411765, 1,
-0.05642307, 0.4469548, -0.5411703, 0, 1, 0.7490196, 1,
-0.05556725, 0.2586839, -0.9868243, 0, 1, 0.7529412, 1,
-0.05290499, 0.186335, 0.2020426, 0, 1, 0.7607843, 1,
-0.05279129, 0.4629332, -0.5232429, 0, 1, 0.7647059, 1,
-0.05214855, -0.2839862, -2.135068, 0, 1, 0.772549, 1,
-0.04830339, -0.6641706, -3.535219, 0, 1, 0.7764706, 1,
-0.04798777, -0.03316218, -1.794745, 0, 1, 0.7843137, 1,
-0.04655829, -2.419093, -3.903336, 0, 1, 0.7882353, 1,
-0.04360004, 2.222348, -0.7500873, 0, 1, 0.7960784, 1,
-0.04073086, -1.950588, -3.567403, 0, 1, 0.8039216, 1,
-0.03852844, 0.6231741, 0.2866719, 0, 1, 0.8078431, 1,
-0.03417284, 1.124334, -2.390183, 0, 1, 0.8156863, 1,
-0.03331471, 0.1987925, 0.6634424, 0, 1, 0.8196079, 1,
-0.03022901, 0.2438962, -0.4850519, 0, 1, 0.827451, 1,
-0.02953788, -0.01565762, -1.514013, 0, 1, 0.8313726, 1,
-0.02797947, 0.3988774, -0.5304216, 0, 1, 0.8392157, 1,
-0.02711852, 0.3490874, -1.496154, 0, 1, 0.8431373, 1,
-0.02598868, -1.525482, -4.239, 0, 1, 0.8509804, 1,
-0.02425415, 0.244358, -0.2243749, 0, 1, 0.854902, 1,
-0.02392718, 0.2451807, -1.051204, 0, 1, 0.8627451, 1,
-0.01978832, -1.329151, -4.136914, 0, 1, 0.8666667, 1,
-0.01815015, -0.6835089, -3.924341, 0, 1, 0.8745098, 1,
-0.01590701, -0.04792727, -2.889688, 0, 1, 0.8784314, 1,
-0.01474131, -0.2907038, -3.297419, 0, 1, 0.8862745, 1,
-0.00879465, -0.8548822, -2.727957, 0, 1, 0.8901961, 1,
-0.008727258, 0.2148449, -1.545709, 0, 1, 0.8980392, 1,
-0.008699048, -0.9111418, -3.607149, 0, 1, 0.9058824, 1,
-0.007689999, -0.1820413, -4.909621, 0, 1, 0.9098039, 1,
-0.00581109, 0.688988, 0.227455, 0, 1, 0.9176471, 1,
8.812876e-05, -0.9557554, 3.617676, 0, 1, 0.9215686, 1,
0.001333986, 1.580225, 1.233292, 0, 1, 0.9294118, 1,
0.002899602, -1.129163, 3.560107, 0, 1, 0.9333333, 1,
0.003576283, -1.404562, 3.969591, 0, 1, 0.9411765, 1,
0.008374101, 0.05018262, 0.05320051, 0, 1, 0.945098, 1,
0.009412088, 0.6539661, 1.218625, 0, 1, 0.9529412, 1,
0.01198069, 0.9823715, -1.526873, 0, 1, 0.9568627, 1,
0.01262773, -0.1866952, 1.952162, 0, 1, 0.9647059, 1,
0.01394685, 1.637889, 0.9284303, 0, 1, 0.9686275, 1,
0.01468116, -0.2523057, 2.376376, 0, 1, 0.9764706, 1,
0.01650834, -1.718239, 3.029645, 0, 1, 0.9803922, 1,
0.01840544, -0.3834192, 3.222777, 0, 1, 0.9882353, 1,
0.02214443, 0.6467056, 0.8913525, 0, 1, 0.9921569, 1,
0.02645766, -0.8067683, 5.388638, 0, 1, 1, 1,
0.02888408, -0.04512781, 3.452821, 0, 0.9921569, 1, 1,
0.03241745, -0.7653481, 2.613323, 0, 0.9882353, 1, 1,
0.03247615, 0.4991952, 0.03218375, 0, 0.9803922, 1, 1,
0.03276188, 1.00235, 0.7497323, 0, 0.9764706, 1, 1,
0.03635118, 0.424639, -1.598328, 0, 0.9686275, 1, 1,
0.03644396, 1.285684, 0.8852639, 0, 0.9647059, 1, 1,
0.03812011, 0.750065, -1.638092, 0, 0.9568627, 1, 1,
0.04879318, -0.2722425, 4.042502, 0, 0.9529412, 1, 1,
0.0538271, -0.07231534, 2.310235, 0, 0.945098, 1, 1,
0.05398793, 0.8739171, 0.05226126, 0, 0.9411765, 1, 1,
0.05714694, -0.4867985, 3.243179, 0, 0.9333333, 1, 1,
0.05879263, -0.4989668, 2.974847, 0, 0.9294118, 1, 1,
0.06073381, -0.3263175, 4.01441, 0, 0.9215686, 1, 1,
0.06435152, -0.289815, 2.939795, 0, 0.9176471, 1, 1,
0.06476612, -0.2694665, 0.940697, 0, 0.9098039, 1, 1,
0.0719196, -1.784288, 3.623189, 0, 0.9058824, 1, 1,
0.07322147, -1.137706, 3.862501, 0, 0.8980392, 1, 1,
0.07967049, 0.003539525, 1.235359, 0, 0.8901961, 1, 1,
0.08080145, -0.1723296, 1.802642, 0, 0.8862745, 1, 1,
0.0820173, -0.5203002, 3.891293, 0, 0.8784314, 1, 1,
0.08238955, -0.0807872, 1.361171, 0, 0.8745098, 1, 1,
0.08315941, -0.3286393, 2.25759, 0, 0.8666667, 1, 1,
0.08365732, 1.297202, 0.53255, 0, 0.8627451, 1, 1,
0.08637035, 0.1035313, 0.8459955, 0, 0.854902, 1, 1,
0.08823648, 0.08345715, 0.8686154, 0, 0.8509804, 1, 1,
0.09495871, -0.2831491, 2.362839, 0, 0.8431373, 1, 1,
0.09719039, -0.5026873, 2.918275, 0, 0.8392157, 1, 1,
0.101185, 2.054892, -0.1680549, 0, 0.8313726, 1, 1,
0.1019592, 2.080154, 1.02349, 0, 0.827451, 1, 1,
0.1051483, -1.850651, 2.531995, 0, 0.8196079, 1, 1,
0.1058171, 1.522772, -0.71474, 0, 0.8156863, 1, 1,
0.1091596, -0.8986678, 3.955384, 0, 0.8078431, 1, 1,
0.1094084, 0.5836695, 0.6420535, 0, 0.8039216, 1, 1,
0.1096763, -0.3473971, 1.636152, 0, 0.7960784, 1, 1,
0.1101346, -0.8937899, 2.166649, 0, 0.7882353, 1, 1,
0.1110013, -0.7821719, 3.717706, 0, 0.7843137, 1, 1,
0.1130799, -1.646943, 4.113145, 0, 0.7764706, 1, 1,
0.117253, -0.8099116, 2.415603, 0, 0.772549, 1, 1,
0.1204768, 0.9991862, -0.03110938, 0, 0.7647059, 1, 1,
0.1226452, 0.06745217, -0.101108, 0, 0.7607843, 1, 1,
0.1238854, 1.890034, -0.842508, 0, 0.7529412, 1, 1,
0.130425, 0.1919717, 0.08135798, 0, 0.7490196, 1, 1,
0.1318272, 0.8096338, 0.2307602, 0, 0.7411765, 1, 1,
0.1331974, -0.5604833, 2.702571, 0, 0.7372549, 1, 1,
0.1443411, -1.946276, 1.935503, 0, 0.7294118, 1, 1,
0.147147, -1.00499, 3.662364, 0, 0.7254902, 1, 1,
0.1475358, 0.7564045, -1.251744, 0, 0.7176471, 1, 1,
0.1529413, 1.053001, 2.093861, 0, 0.7137255, 1, 1,
0.1556537, 0.8605614, -0.1405514, 0, 0.7058824, 1, 1,
0.1562719, -0.2301035, 2.618919, 0, 0.6980392, 1, 1,
0.1580768, 1.214525, 0.6475828, 0, 0.6941177, 1, 1,
0.1605224, -0.774315, 3.395382, 0, 0.6862745, 1, 1,
0.1608214, -1.262968, 1.551959, 0, 0.682353, 1, 1,
0.1645263, -1.581403, 3.045156, 0, 0.6745098, 1, 1,
0.1648174, -0.7711788, 3.552707, 0, 0.6705883, 1, 1,
0.1678737, 0.3785431, 0.6361155, 0, 0.6627451, 1, 1,
0.1715984, -0.1150354, 1.610614, 0, 0.6588235, 1, 1,
0.1802614, 0.3493919, 0.1042194, 0, 0.6509804, 1, 1,
0.1835085, 0.3928178, -1.805865, 0, 0.6470588, 1, 1,
0.1853861, -1.337035, 3.064278, 0, 0.6392157, 1, 1,
0.1883192, 0.06903064, 1.743201, 0, 0.6352941, 1, 1,
0.1889812, 0.6483257, 0.1093154, 0, 0.627451, 1, 1,
0.1890308, -0.8039666, 5.610267, 0, 0.6235294, 1, 1,
0.1957779, 0.6823838, 1.230109, 0, 0.6156863, 1, 1,
0.1965631, -1.242537, 2.643653, 0, 0.6117647, 1, 1,
0.1973899, 2.124956, -1.745831, 0, 0.6039216, 1, 1,
0.1979744, 1.56968, -0.09156902, 0, 0.5960785, 1, 1,
0.2035169, 1.959371, 0.01590244, 0, 0.5921569, 1, 1,
0.2095368, -0.1374575, 2.430326, 0, 0.5843138, 1, 1,
0.2099604, 1.13699, 2.655488, 0, 0.5803922, 1, 1,
0.2107943, -0.5512413, 4.216476, 0, 0.572549, 1, 1,
0.2109321, -1.343768, 1.909751, 0, 0.5686275, 1, 1,
0.2118969, 1.855272, 0.2759455, 0, 0.5607843, 1, 1,
0.2139395, 0.610779, -0.6320544, 0, 0.5568628, 1, 1,
0.2203123, -1.09789, 1.840778, 0, 0.5490196, 1, 1,
0.2270114, -1.250934, 3.029411, 0, 0.5450981, 1, 1,
0.2284182, 0.4715759, 1.594536, 0, 0.5372549, 1, 1,
0.2290968, -1.383607, 4.059308, 0, 0.5333334, 1, 1,
0.2302876, 0.7202972, 0.09921895, 0, 0.5254902, 1, 1,
0.2319563, 0.8042925, 0.4166477, 0, 0.5215687, 1, 1,
0.2376881, -0.1580776, 2.90853, 0, 0.5137255, 1, 1,
0.2385659, -0.9988538, 2.982699, 0, 0.509804, 1, 1,
0.2413051, -0.6275478, 2.820848, 0, 0.5019608, 1, 1,
0.2441377, 0.3346386, 1.291703, 0, 0.4941176, 1, 1,
0.2483626, 1.111542, 0.5285771, 0, 0.4901961, 1, 1,
0.2513024, 0.2477021, 3.552061, 0, 0.4823529, 1, 1,
0.2535812, -0.5824115, 2.851804, 0, 0.4784314, 1, 1,
0.254407, -0.7470641, 1.675697, 0, 0.4705882, 1, 1,
0.2561981, -0.6584361, 4.327608, 0, 0.4666667, 1, 1,
0.2624501, 0.54948, 1.151366, 0, 0.4588235, 1, 1,
0.2642376, 0.3480642, 2.247849, 0, 0.454902, 1, 1,
0.2730047, 2.268613, 0.3399024, 0, 0.4470588, 1, 1,
0.2732221, -0.1726242, 4.310948, 0, 0.4431373, 1, 1,
0.2755669, -0.291812, 1.252188, 0, 0.4352941, 1, 1,
0.2820227, 0.03916338, 1.715671, 0, 0.4313726, 1, 1,
0.2861607, -0.1776223, 3.138457, 0, 0.4235294, 1, 1,
0.2886578, -0.3012249, 1.018733, 0, 0.4196078, 1, 1,
0.2892541, 1.159455, -0.9136913, 0, 0.4117647, 1, 1,
0.2907569, 0.4413776, -0.6532608, 0, 0.4078431, 1, 1,
0.2940243, -0.06513809, 1.899698, 0, 0.4, 1, 1,
0.2979216, -1.330168, 2.967626, 0, 0.3921569, 1, 1,
0.2997926, 0.9769982, -0.2557186, 0, 0.3882353, 1, 1,
0.3010347, -0.736059, 1.79157, 0, 0.3803922, 1, 1,
0.304222, 2.08669, 1.206729, 0, 0.3764706, 1, 1,
0.3101535, 1.539901, 0.7320061, 0, 0.3686275, 1, 1,
0.3179196, 0.6234112, 0.6876155, 0, 0.3647059, 1, 1,
0.3181004, -1.600141, 3.91795, 0, 0.3568628, 1, 1,
0.3262247, 0.5888407, 0.3462548, 0, 0.3529412, 1, 1,
0.3269271, 1.69054, 0.8627114, 0, 0.345098, 1, 1,
0.3271497, 0.08203277, 0.0145848, 0, 0.3411765, 1, 1,
0.3283233, -1.368667, 2.216566, 0, 0.3333333, 1, 1,
0.3306073, 0.6897424, 1.854337, 0, 0.3294118, 1, 1,
0.3325741, 0.09869704, 0.2933092, 0, 0.3215686, 1, 1,
0.3398422, 0.6189989, -0.842856, 0, 0.3176471, 1, 1,
0.3453698, -0.7967065, 2.730653, 0, 0.3098039, 1, 1,
0.346802, -0.6304356, 3.505111, 0, 0.3058824, 1, 1,
0.3487726, 0.5929372, 2.004519, 0, 0.2980392, 1, 1,
0.3506021, 1.030667, -0.686598, 0, 0.2901961, 1, 1,
0.3508676, -0.4105867, 2.526022, 0, 0.2862745, 1, 1,
0.3538496, -1.201761, 2.346604, 0, 0.2784314, 1, 1,
0.3542277, 1.376553, 0.236673, 0, 0.2745098, 1, 1,
0.3556189, -0.4844872, 3.761328, 0, 0.2666667, 1, 1,
0.3560271, 0.6440146, -0.630555, 0, 0.2627451, 1, 1,
0.3571566, -0.886811, 2.412235, 0, 0.254902, 1, 1,
0.3633741, 0.2938433, 0.5803913, 0, 0.2509804, 1, 1,
0.3642281, 0.3445552, 1.784976, 0, 0.2431373, 1, 1,
0.3670729, -1.981089, 2.171919, 0, 0.2392157, 1, 1,
0.3700125, 1.795757, 1.123046, 0, 0.2313726, 1, 1,
0.3724002, -0.9588285, 3.28098, 0, 0.227451, 1, 1,
0.3755524, -0.6395181, 1.860504, 0, 0.2196078, 1, 1,
0.3762246, -1.260486, 0.5608919, 0, 0.2156863, 1, 1,
0.376704, -0.5552889, 2.569911, 0, 0.2078431, 1, 1,
0.379222, -0.02049592, 2.014888, 0, 0.2039216, 1, 1,
0.379316, 0.1804447, 2.169017, 0, 0.1960784, 1, 1,
0.3803287, 0.3354433, 1.139636, 0, 0.1882353, 1, 1,
0.3816886, -0.8698829, 2.384557, 0, 0.1843137, 1, 1,
0.3828835, 0.1381403, 1.732141, 0, 0.1764706, 1, 1,
0.3829319, 0.1413693, 1.998332, 0, 0.172549, 1, 1,
0.3887267, -1.308036, 3.583839, 0, 0.1647059, 1, 1,
0.391871, -0.6314085, 2.060334, 0, 0.1607843, 1, 1,
0.3928934, -2.021606, 2.096819, 0, 0.1529412, 1, 1,
0.4012024, -0.6628385, 3.052922, 0, 0.1490196, 1, 1,
0.4026352, -0.467044, 3.953546, 0, 0.1411765, 1, 1,
0.4114133, -1.327361, 2.493133, 0, 0.1372549, 1, 1,
0.4114175, 1.304478, -0.4866483, 0, 0.1294118, 1, 1,
0.4174338, 0.09008083, 0.4363748, 0, 0.1254902, 1, 1,
0.418258, -1.160205, 1.787199, 0, 0.1176471, 1, 1,
0.4186741, 0.760147, 0.7739756, 0, 0.1137255, 1, 1,
0.4190928, -0.9123716, 1.815416, 0, 0.1058824, 1, 1,
0.4210428, -0.1443812, 1.162714, 0, 0.09803922, 1, 1,
0.4226307, 1.1251, -0.006580165, 0, 0.09411765, 1, 1,
0.4256116, -0.002109044, 1.035685, 0, 0.08627451, 1, 1,
0.433555, -0.4927408, 2.958491, 0, 0.08235294, 1, 1,
0.435568, -0.1602134, 1.664656, 0, 0.07450981, 1, 1,
0.4384917, -1.296392, 4.606429, 0, 0.07058824, 1, 1,
0.4430959, -0.6622005, 3.267128, 0, 0.0627451, 1, 1,
0.4431391, -1.320043, 1.1136, 0, 0.05882353, 1, 1,
0.4503654, 0.517894, 0.4793752, 0, 0.05098039, 1, 1,
0.4515741, 1.431589, -0.1778875, 0, 0.04705882, 1, 1,
0.4521331, -0.7853319, 2.794928, 0, 0.03921569, 1, 1,
0.4524887, 1.562336, -1.254232, 0, 0.03529412, 1, 1,
0.4533093, 0.06725778, 2.01827, 0, 0.02745098, 1, 1,
0.4575445, -0.9376334, 2.583579, 0, 0.02352941, 1, 1,
0.4575793, -0.7198315, 4.300985, 0, 0.01568628, 1, 1,
0.4633923, 0.6506425, 1.255084, 0, 0.01176471, 1, 1,
0.4762169, 1.431311, -1.3369, 0, 0.003921569, 1, 1,
0.4773892, 0.8279439, 1.464397, 0.003921569, 0, 1, 1,
0.4777376, -0.01561577, 2.626553, 0.007843138, 0, 1, 1,
0.4779197, 0.5755665, -0.180728, 0.01568628, 0, 1, 1,
0.4801048, -0.2780865, 1.620893, 0.01960784, 0, 1, 1,
0.4837459, 0.8510914, -0.8252224, 0.02745098, 0, 1, 1,
0.4851291, -0.5567406, 2.939162, 0.03137255, 0, 1, 1,
0.4868853, -3.036417, 3.650286, 0.03921569, 0, 1, 1,
0.4899041, -0.1510366, 1.50627, 0.04313726, 0, 1, 1,
0.5045366, -0.5619332, 2.409, 0.05098039, 0, 1, 1,
0.5128611, -0.3797981, 2.912202, 0.05490196, 0, 1, 1,
0.5201343, -2.047856, 2.664187, 0.0627451, 0, 1, 1,
0.5201886, 1.049798, 0.3726054, 0.06666667, 0, 1, 1,
0.521411, 1.719501, 0.3057342, 0.07450981, 0, 1, 1,
0.5225443, 0.5717941, -1.459447, 0.07843138, 0, 1, 1,
0.5278239, 0.4512813, 1.336867, 0.08627451, 0, 1, 1,
0.5326674, 1.583947, 1.46371, 0.09019608, 0, 1, 1,
0.5343066, -0.812501, 0.9598842, 0.09803922, 0, 1, 1,
0.5479483, 0.1541556, 1.215629, 0.1058824, 0, 1, 1,
0.5514175, 0.03483993, -0.2549211, 0.1098039, 0, 1, 1,
0.5517851, -0.4507037, 2.146502, 0.1176471, 0, 1, 1,
0.551845, -0.2849738, 1.663566, 0.1215686, 0, 1, 1,
0.5548195, -0.4240485, 1.191399, 0.1294118, 0, 1, 1,
0.5628459, -1.739009, 2.92972, 0.1333333, 0, 1, 1,
0.569935, 1.350394, -0.9495567, 0.1411765, 0, 1, 1,
0.5722198, -1.659338, 1.224916, 0.145098, 0, 1, 1,
0.5734148, -0.4059152, 2.117532, 0.1529412, 0, 1, 1,
0.5832554, 0.4041634, 0.7622006, 0.1568628, 0, 1, 1,
0.5836324, -1.773695, 3.27969, 0.1647059, 0, 1, 1,
0.5837209, -1.226365, 2.482183, 0.1686275, 0, 1, 1,
0.5890031, -1.194285, 4.126091, 0.1764706, 0, 1, 1,
0.5899849, 0.3116429, -0.9881773, 0.1803922, 0, 1, 1,
0.5904649, 1.582423, 0.9992224, 0.1882353, 0, 1, 1,
0.5924104, -2.0697, 1.671542, 0.1921569, 0, 1, 1,
0.596963, 0.707421, 1.986194, 0.2, 0, 1, 1,
0.5979962, -1.125538, 3.097084, 0.2078431, 0, 1, 1,
0.5988549, -0.3579371, 1.980417, 0.2117647, 0, 1, 1,
0.6022552, -0.5917655, 4.762486, 0.2196078, 0, 1, 1,
0.6052558, -2.387119, 3.728891, 0.2235294, 0, 1, 1,
0.6065687, -0.2409474, 2.537595, 0.2313726, 0, 1, 1,
0.6133838, -0.9314701, 1.327649, 0.2352941, 0, 1, 1,
0.6141453, -0.06754113, 2.757193, 0.2431373, 0, 1, 1,
0.614313, -0.5115884, 2.105852, 0.2470588, 0, 1, 1,
0.6173896, 0.8918076, 2.087943, 0.254902, 0, 1, 1,
0.6177847, 0.8534445, 1.112347, 0.2588235, 0, 1, 1,
0.6208881, 0.719624, 1.952703, 0.2666667, 0, 1, 1,
0.6226862, -0.9965197, 1.316135, 0.2705882, 0, 1, 1,
0.6274573, -0.07139703, 1.128318, 0.2784314, 0, 1, 1,
0.6431611, -0.5440473, 0.9288937, 0.282353, 0, 1, 1,
0.6449159, -1.338753, 4.130925, 0.2901961, 0, 1, 1,
0.6468556, -0.7043763, 2.85896, 0.2941177, 0, 1, 1,
0.6568554, -0.03857134, 0.6967804, 0.3019608, 0, 1, 1,
0.6575354, 0.939179, -0.1673001, 0.3098039, 0, 1, 1,
0.6583165, -0.4482847, 1.249921, 0.3137255, 0, 1, 1,
0.6622414, 0.2627202, 0.578117, 0.3215686, 0, 1, 1,
0.6635717, -0.6457325, 2.487985, 0.3254902, 0, 1, 1,
0.6713934, -0.09456208, 0.3302498, 0.3333333, 0, 1, 1,
0.6725895, -0.3553614, 1.294515, 0.3372549, 0, 1, 1,
0.6776945, -0.2456859, 1.58853, 0.345098, 0, 1, 1,
0.6779134, 2.38101, -0.438739, 0.3490196, 0, 1, 1,
0.6831496, 0.1537442, -1.03257, 0.3568628, 0, 1, 1,
0.6837997, 1.203831, -0.3584058, 0.3607843, 0, 1, 1,
0.686671, 1.287859, 2.656713, 0.3686275, 0, 1, 1,
0.6869554, -1.039554, 1.697957, 0.372549, 0, 1, 1,
0.6869878, -0.6604266, 1.923382, 0.3803922, 0, 1, 1,
0.6882502, 0.3346615, 0.9140751, 0.3843137, 0, 1, 1,
0.6890621, 0.393229, 0.9110588, 0.3921569, 0, 1, 1,
0.6909742, -3.226047, 3.766789, 0.3960784, 0, 1, 1,
0.6923516, -0.6648219, 1.958177, 0.4039216, 0, 1, 1,
0.6925882, -0.4324877, 0.2614343, 0.4117647, 0, 1, 1,
0.6928821, -0.308119, 1.840963, 0.4156863, 0, 1, 1,
0.701377, -0.7558875, 3.779126, 0.4235294, 0, 1, 1,
0.7017747, -0.3871422, 0.8009163, 0.427451, 0, 1, 1,
0.7021728, -0.4591155, 2.982806, 0.4352941, 0, 1, 1,
0.7022699, -0.7698645, 2.518455, 0.4392157, 0, 1, 1,
0.7064703, 0.04942099, 0.8798777, 0.4470588, 0, 1, 1,
0.7101113, -0.9321653, 2.590791, 0.4509804, 0, 1, 1,
0.7175745, 1.276716, 2.024501, 0.4588235, 0, 1, 1,
0.7238936, -0.155472, 3.454539, 0.4627451, 0, 1, 1,
0.7278686, 0.02818459, 2.394854, 0.4705882, 0, 1, 1,
0.7324119, -2.786546, 2.246871, 0.4745098, 0, 1, 1,
0.7388768, -0.1023895, 4.201451, 0.4823529, 0, 1, 1,
0.7407259, 1.237412, -0.3933821, 0.4862745, 0, 1, 1,
0.7417621, -0.7733143, 2.367621, 0.4941176, 0, 1, 1,
0.7491882, -0.7662917, 1.558777, 0.5019608, 0, 1, 1,
0.7513111, -0.824056, 1.406511, 0.5058824, 0, 1, 1,
0.7519659, -0.1245081, 1.699607, 0.5137255, 0, 1, 1,
0.7521791, -0.8647466, 3.245897, 0.5176471, 0, 1, 1,
0.7557434, -0.1782994, 2.61553, 0.5254902, 0, 1, 1,
0.7619009, 1.094113, 1.466344, 0.5294118, 0, 1, 1,
0.7620225, -0.1873135, 0.3298084, 0.5372549, 0, 1, 1,
0.7681147, -0.8801712, 1.682911, 0.5411765, 0, 1, 1,
0.7701908, 1.308172, 0.2595431, 0.5490196, 0, 1, 1,
0.782304, -1.283481, 2.253268, 0.5529412, 0, 1, 1,
0.7825097, -0.3040229, 2.727732, 0.5607843, 0, 1, 1,
0.7894474, 0.6248188, 0.6175181, 0.5647059, 0, 1, 1,
0.7916077, -1.013533, 2.079221, 0.572549, 0, 1, 1,
0.7925376, -0.7478946, 3.588987, 0.5764706, 0, 1, 1,
0.7959338, -0.1358652, 1.13562, 0.5843138, 0, 1, 1,
0.7966456, 0.5422133, 1.593887, 0.5882353, 0, 1, 1,
0.8019783, 0.4346146, -0.9900424, 0.5960785, 0, 1, 1,
0.8054394, 0.5105283, 0.7836565, 0.6039216, 0, 1, 1,
0.8141286, -0.7022556, 2.261549, 0.6078432, 0, 1, 1,
0.8199342, -1.980706, 3.45373, 0.6156863, 0, 1, 1,
0.8204911, -0.2072984, 2.232497, 0.6196079, 0, 1, 1,
0.8229007, 1.22924, 1.602996, 0.627451, 0, 1, 1,
0.8254833, -0.8120455, 2.883092, 0.6313726, 0, 1, 1,
0.8269171, 0.2076201, 1.607881, 0.6392157, 0, 1, 1,
0.8307922, 0.7365522, 0.6985309, 0.6431373, 0, 1, 1,
0.8357592, 1.962707, -0.2031541, 0.6509804, 0, 1, 1,
0.8386573, -1.672347, 4.65286, 0.654902, 0, 1, 1,
0.8413756, -1.928213, 3.351805, 0.6627451, 0, 1, 1,
0.8425087, 2.65785, 2.075369, 0.6666667, 0, 1, 1,
0.8431063, -0.9221705, 0.6665758, 0.6745098, 0, 1, 1,
0.8498507, 0.13927, 2.111255, 0.6784314, 0, 1, 1,
0.85043, -1.405417, 2.346859, 0.6862745, 0, 1, 1,
0.8523691, 0.5822682, 1.423586, 0.6901961, 0, 1, 1,
0.8560544, -0.1317444, 1.768389, 0.6980392, 0, 1, 1,
0.8632753, 2.051105, 2.487373, 0.7058824, 0, 1, 1,
0.8660789, -1.564148, 1.238348, 0.7098039, 0, 1, 1,
0.8668932, -0.9622886, 5.081078, 0.7176471, 0, 1, 1,
0.8772053, 0.7711099, -0.3764793, 0.7215686, 0, 1, 1,
0.8799816, 0.5477594, 0.6957874, 0.7294118, 0, 1, 1,
0.8805854, 0.635045, 0.2170525, 0.7333333, 0, 1, 1,
0.8824884, -0.1862807, 1.732954, 0.7411765, 0, 1, 1,
0.8827866, -0.6169796, 0.2217061, 0.7450981, 0, 1, 1,
0.8868716, 0.258092, -1.079543, 0.7529412, 0, 1, 1,
0.8881469, 0.599291, 0.8967941, 0.7568628, 0, 1, 1,
0.8907725, -0.3678874, 2.438089, 0.7647059, 0, 1, 1,
0.8921109, -0.4330398, 1.845409, 0.7686275, 0, 1, 1,
0.895732, -0.7346644, 3.647415, 0.7764706, 0, 1, 1,
0.9007168, 1.164529, 1.636936, 0.7803922, 0, 1, 1,
0.9046075, 1.340961, -0.02973415, 0.7882353, 0, 1, 1,
0.9071169, 0.1931689, 0.6342961, 0.7921569, 0, 1, 1,
0.9119914, 0.144963, 1.351143, 0.8, 0, 1, 1,
0.9129103, 0.884956, -1.636464, 0.8078431, 0, 1, 1,
0.9139928, 0.9999803, 0.6461077, 0.8117647, 0, 1, 1,
0.9142416, -2.084606, 2.797378, 0.8196079, 0, 1, 1,
0.928149, 0.9641748, 0.9745675, 0.8235294, 0, 1, 1,
0.9293126, 0.5828239, -0.4104313, 0.8313726, 0, 1, 1,
0.9322123, 2.003678, 0.4775496, 0.8352941, 0, 1, 1,
0.9324993, -1.235703, 3.440862, 0.8431373, 0, 1, 1,
0.9354379, 0.1332446, 2.786323, 0.8470588, 0, 1, 1,
0.9357595, -0.7961385, 1.94469, 0.854902, 0, 1, 1,
0.9411388, 0.4476836, 1.043736, 0.8588235, 0, 1, 1,
0.9426042, 0.5950091, 0.9439439, 0.8666667, 0, 1, 1,
0.9431854, 0.5884758, -0.412389, 0.8705882, 0, 1, 1,
0.9442034, -2.4184, 3.379246, 0.8784314, 0, 1, 1,
0.9460438, -0.6377681, 1.348583, 0.8823529, 0, 1, 1,
0.9497384, -1.041906, 2.722533, 0.8901961, 0, 1, 1,
0.9499271, -0.5152872, 1.940318, 0.8941177, 0, 1, 1,
0.9540234, 0.9980882, 0.6558084, 0.9019608, 0, 1, 1,
0.9605278, 0.6430401, 0.220014, 0.9098039, 0, 1, 1,
0.9616931, -0.7911699, 0.7547905, 0.9137255, 0, 1, 1,
0.9668317, 1.149491, 2.108828, 0.9215686, 0, 1, 1,
0.9734621, -0.0940228, 3.787111, 0.9254902, 0, 1, 1,
0.9831508, -0.5876216, 2.558, 0.9333333, 0, 1, 1,
0.9871523, -1.083315, 3.389973, 0.9372549, 0, 1, 1,
0.9894588, 1.32119, 0.3145775, 0.945098, 0, 1, 1,
0.9934615, 0.1685838, 0.6109857, 0.9490196, 0, 1, 1,
0.9988457, 0.1011445, -0.2231293, 0.9568627, 0, 1, 1,
1.013054, 0.2494584, 0.5718993, 0.9607843, 0, 1, 1,
1.014163, 0.3899456, 1.762855, 0.9686275, 0, 1, 1,
1.017397, 0.2386257, 2.748262, 0.972549, 0, 1, 1,
1.017864, -1.05189, 2.087881, 0.9803922, 0, 1, 1,
1.020328, -0.3127652, 1.698336, 0.9843137, 0, 1, 1,
1.027822, -0.5341206, 1.691048, 0.9921569, 0, 1, 1,
1.033562, 1.776494, -0.6437421, 0.9960784, 0, 1, 1,
1.033984, 0.9251039, 0.8525485, 1, 0, 0.9960784, 1,
1.03421, 0.4488897, 1.027304, 1, 0, 0.9882353, 1,
1.034877, 1.331653, -1.734791, 1, 0, 0.9843137, 1,
1.040497, -1.37474, 3.173729, 1, 0, 0.9764706, 1,
1.041443, -0.8791265, 2.069207, 1, 0, 0.972549, 1,
1.046391, -0.247139, 3.789909, 1, 0, 0.9647059, 1,
1.053938, 0.2766821, 0.1953963, 1, 0, 0.9607843, 1,
1.054473, -2.07521, 2.240281, 1, 0, 0.9529412, 1,
1.057899, -0.3153091, 3.015535, 1, 0, 0.9490196, 1,
1.071123, -0.498565, 1.009149, 1, 0, 0.9411765, 1,
1.078423, -0.2704054, 3.141857, 1, 0, 0.9372549, 1,
1.09425, -0.1489797, 1.692897, 1, 0, 0.9294118, 1,
1.096378, 0.8129261, -0.8434662, 1, 0, 0.9254902, 1,
1.100371, -2.171966, 3.04813, 1, 0, 0.9176471, 1,
1.102541, -0.9646161, 2.36686, 1, 0, 0.9137255, 1,
1.103809, -0.002558019, 1.205777, 1, 0, 0.9058824, 1,
1.109779, 0.4177217, 0.02752036, 1, 0, 0.9019608, 1,
1.117593, 0.4287872, 3.628707, 1, 0, 0.8941177, 1,
1.120652, 1.086503, -0.1800023, 1, 0, 0.8862745, 1,
1.122619, -0.7043157, 4.716604, 1, 0, 0.8823529, 1,
1.129113, -0.8195027, 1.471096, 1, 0, 0.8745098, 1,
1.129917, 1.196239, 1.412048, 1, 0, 0.8705882, 1,
1.134872, -0.5151133, 1.442469, 1, 0, 0.8627451, 1,
1.13593, -1.046593, 3.606337, 1, 0, 0.8588235, 1,
1.138051, -1.354876, 2.598751, 1, 0, 0.8509804, 1,
1.139363, -0.1509294, 1.346341, 1, 0, 0.8470588, 1,
1.146369, -1.200506, 4.298792, 1, 0, 0.8392157, 1,
1.153784, 0.18647, 1.516535, 1, 0, 0.8352941, 1,
1.157, -0.3404308, 1.697919, 1, 0, 0.827451, 1,
1.15978, -1.902864, 1.576798, 1, 0, 0.8235294, 1,
1.162277, -1.598348, 2.82097, 1, 0, 0.8156863, 1,
1.167511, -0.08790775, 0.7749121, 1, 0, 0.8117647, 1,
1.170701, -1.042695, 2.204194, 1, 0, 0.8039216, 1,
1.172936, -0.1536938, 1.916249, 1, 0, 0.7960784, 1,
1.188759, -1.652821, 3.080451, 1, 0, 0.7921569, 1,
1.189274, 1.646868, -1.030693, 1, 0, 0.7843137, 1,
1.190581, -0.887776, 2.053749, 1, 0, 0.7803922, 1,
1.19633, 1.697742, 0.3318462, 1, 0, 0.772549, 1,
1.199148, -0.9525346, 1.852359, 1, 0, 0.7686275, 1,
1.201141, -0.6366963, 3.500494, 1, 0, 0.7607843, 1,
1.208192, -0.756534, 2.465011, 1, 0, 0.7568628, 1,
1.210773, 0.2488581, 1.065485, 1, 0, 0.7490196, 1,
1.212787, 0.2324958, 0.7900292, 1, 0, 0.7450981, 1,
1.2129, -0.6422877, 2.456091, 1, 0, 0.7372549, 1,
1.223034, -1.300826, 2.573579, 1, 0, 0.7333333, 1,
1.240307, -0.6077454, 3.154778, 1, 0, 0.7254902, 1,
1.244333, -0.3576082, 4.179228, 1, 0, 0.7215686, 1,
1.246047, 1.133084, 0.3383225, 1, 0, 0.7137255, 1,
1.253239, 1.028108, 0.4551036, 1, 0, 0.7098039, 1,
1.262561, -1.798459, 1.490199, 1, 0, 0.7019608, 1,
1.262703, -0.7243564, 2.723364, 1, 0, 0.6941177, 1,
1.272393, -1.628273, 3.825485, 1, 0, 0.6901961, 1,
1.274935, -0.3962116, 0.2819112, 1, 0, 0.682353, 1,
1.283066, 0.8594361, 1.997868, 1, 0, 0.6784314, 1,
1.28642, 1.663131, -0.222846, 1, 0, 0.6705883, 1,
1.294919, 1.303165, 2.8307, 1, 0, 0.6666667, 1,
1.296774, -0.04767134, 0.3098271, 1, 0, 0.6588235, 1,
1.306331, -0.728541, 0.3969655, 1, 0, 0.654902, 1,
1.306596, -0.6118787, 1.71629, 1, 0, 0.6470588, 1,
1.307253, -0.5919815, 2.386953, 1, 0, 0.6431373, 1,
1.30788, 0.1972811, 1.334903, 1, 0, 0.6352941, 1,
1.324613, -0.3805075, 1.483765, 1, 0, 0.6313726, 1,
1.326276, 1.280383, -0.764314, 1, 0, 0.6235294, 1,
1.332706, 0.8242928, 3.238103, 1, 0, 0.6196079, 1,
1.3333, -0.6790442, 0.1179101, 1, 0, 0.6117647, 1,
1.33688, 0.8270468, 1.040581, 1, 0, 0.6078432, 1,
1.342, 2.551579, 0.1733457, 1, 0, 0.6, 1,
1.346317, 1.112018, -0.4451026, 1, 0, 0.5921569, 1,
1.347657, 0.2802447, 2.441036, 1, 0, 0.5882353, 1,
1.348395, -0.2486636, 1.627942, 1, 0, 0.5803922, 1,
1.353728, -0.7248315, 2.764174, 1, 0, 0.5764706, 1,
1.362596, -1.292235, 3.115411, 1, 0, 0.5686275, 1,
1.363415, -0.01160519, 0.9515888, 1, 0, 0.5647059, 1,
1.381537, -2.004998, 2.847842, 1, 0, 0.5568628, 1,
1.382902, 0.2664124, 2.442603, 1, 0, 0.5529412, 1,
1.403662, 1.316184, 0.6641859, 1, 0, 0.5450981, 1,
1.407421, -1.503156, 1.879985, 1, 0, 0.5411765, 1,
1.416713, 0.8544357, 1.70713, 1, 0, 0.5333334, 1,
1.417703, -0.2612326, 2.475101, 1, 0, 0.5294118, 1,
1.421047, 0.5903106, 0.01511822, 1, 0, 0.5215687, 1,
1.424751, 0.2115989, 1.586586, 1, 0, 0.5176471, 1,
1.435345, -0.3219278, 3.080139, 1, 0, 0.509804, 1,
1.438369, 0.9279563, 2.070349, 1, 0, 0.5058824, 1,
1.445997, -2.172435, 2.533989, 1, 0, 0.4980392, 1,
1.448447, -1.439151, 2.966045, 1, 0, 0.4901961, 1,
1.455465, 0.2220008, 1.34743, 1, 0, 0.4862745, 1,
1.462047, 0.0624139, 0.4443379, 1, 0, 0.4784314, 1,
1.464182, 1.76957, 1.739286, 1, 0, 0.4745098, 1,
1.468737, 0.1803554, 1.388245, 1, 0, 0.4666667, 1,
1.486959, 0.1247292, 2.320384, 1, 0, 0.4627451, 1,
1.488815, -0.5972169, 2.292569, 1, 0, 0.454902, 1,
1.499484, -0.5520607, 1.076463, 1, 0, 0.4509804, 1,
1.502318, 0.1915686, 1.814372, 1, 0, 0.4431373, 1,
1.507928, 1.194612, 0.4292787, 1, 0, 0.4392157, 1,
1.528987, -1.568269, 4.888994, 1, 0, 0.4313726, 1,
1.537548, 0.7435867, 0.4083842, 1, 0, 0.427451, 1,
1.539334, 0.1869273, 0.5720522, 1, 0, 0.4196078, 1,
1.55016, 0.001985158, 2.989921, 1, 0, 0.4156863, 1,
1.552321, 1.900063, 0.4322123, 1, 0, 0.4078431, 1,
1.552559, -0.9069216, 2.416674, 1, 0, 0.4039216, 1,
1.556935, -0.463841, 2.632008, 1, 0, 0.3960784, 1,
1.575142, 0.6737541, 0.899034, 1, 0, 0.3882353, 1,
1.584809, -0.6637769, 2.212732, 1, 0, 0.3843137, 1,
1.59611, 0.06667721, 2.166877, 1, 0, 0.3764706, 1,
1.601267, 1.36724, 1.166752, 1, 0, 0.372549, 1,
1.607672, -0.2415636, 0.392873, 1, 0, 0.3647059, 1,
1.612408, 1.360251, -0.9268647, 1, 0, 0.3607843, 1,
1.614893, -0.8542781, 2.618114, 1, 0, 0.3529412, 1,
1.622621, 0.9404818, -0.156033, 1, 0, 0.3490196, 1,
1.631422, 0.1660789, 2.004139, 1, 0, 0.3411765, 1,
1.641619, 0.04652638, 1.789657, 1, 0, 0.3372549, 1,
1.643742, 0.6702299, -0.6280928, 1, 0, 0.3294118, 1,
1.653526, -0.8615349, 3.189819, 1, 0, 0.3254902, 1,
1.656383, -1.821045, 3.053693, 1, 0, 0.3176471, 1,
1.657447, -1.573899, 1.263257, 1, 0, 0.3137255, 1,
1.661383, 0.9155694, 0.7821785, 1, 0, 0.3058824, 1,
1.6673, 2.226385, 1.124606, 1, 0, 0.2980392, 1,
1.667395, -0.1893849, 2.643982, 1, 0, 0.2941177, 1,
1.686966, 0.9384447, 1.904721, 1, 0, 0.2862745, 1,
1.694602, 0.4725122, 3.349438, 1, 0, 0.282353, 1,
1.695578, -1.39421, 1.555343, 1, 0, 0.2745098, 1,
1.698579, 0.5056367, 1.205568, 1, 0, 0.2705882, 1,
1.700936, -2.327598, 4.249469, 1, 0, 0.2627451, 1,
1.710454, -0.7342033, 1.791517, 1, 0, 0.2588235, 1,
1.7158, 0.8743993, 0.5599961, 1, 0, 0.2509804, 1,
1.724406, 1.129642, 2.730102, 1, 0, 0.2470588, 1,
1.738196, -0.6862326, 2.231109, 1, 0, 0.2392157, 1,
1.740106, -1.227828, 2.155704, 1, 0, 0.2352941, 1,
1.741647, 0.9693415, 1.858326, 1, 0, 0.227451, 1,
1.7487, 0.3993412, 2.170457, 1, 0, 0.2235294, 1,
1.754822, 2.24929, 0.3037356, 1, 0, 0.2156863, 1,
1.785544, -0.6332452, 2.194373, 1, 0, 0.2117647, 1,
1.799006, 1.026485, 1.683684, 1, 0, 0.2039216, 1,
1.807224, -0.148845, 0.9170028, 1, 0, 0.1960784, 1,
1.824948, -1.70896, 3.420352, 1, 0, 0.1921569, 1,
1.867914, -1.562822, -0.3041157, 1, 0, 0.1843137, 1,
1.893949, -0.5611215, 0.7966362, 1, 0, 0.1803922, 1,
1.927428, -0.3131879, 0.8560886, 1, 0, 0.172549, 1,
1.952232, 0.2375031, 2.285954, 1, 0, 0.1686275, 1,
1.956163, 2.130523, -0.4841272, 1, 0, 0.1607843, 1,
1.968973, -0.789785, 2.072509, 1, 0, 0.1568628, 1,
1.984319, 0.652586, 1.972191, 1, 0, 0.1490196, 1,
1.99857, 0.843928, 2.020001, 1, 0, 0.145098, 1,
2.008775, 1.121242, 0.1775667, 1, 0, 0.1372549, 1,
2.015715, 0.6158963, 0.06838387, 1, 0, 0.1333333, 1,
2.028367, 0.4168687, 1.579297, 1, 0, 0.1254902, 1,
2.055659, -0.3779539, 1.149845, 1, 0, 0.1215686, 1,
2.063027, -0.6907036, 2.602298, 1, 0, 0.1137255, 1,
2.071966, -0.194564, 0.7585132, 1, 0, 0.1098039, 1,
2.114538, -0.5692842, 2.656351, 1, 0, 0.1019608, 1,
2.131082, -1.295617, 1.562795, 1, 0, 0.09411765, 1,
2.160615, 1.249589, 0.009589181, 1, 0, 0.09019608, 1,
2.162935, -0.583821, 1.343118, 1, 0, 0.08235294, 1,
2.173146, 0.4859263, 0.007634308, 1, 0, 0.07843138, 1,
2.321405, 0.5233055, 1.013096, 1, 0, 0.07058824, 1,
2.371941, -1.114883, 2.5775, 1, 0, 0.06666667, 1,
2.372972, -0.4482151, 1.128999, 1, 0, 0.05882353, 1,
2.39904, -1.030403, 1.146227, 1, 0, 0.05490196, 1,
2.465819, -0.8387255, 0.6490455, 1, 0, 0.04705882, 1,
2.483968, 0.2062222, 1.368581, 1, 0, 0.04313726, 1,
2.512694, 0.7561719, 1.090854, 1, 0, 0.03529412, 1,
2.529325, -1.057039, 1.309948, 1, 0, 0.03137255, 1,
2.565832, 0.6174207, 1.325545, 1, 0, 0.02352941, 1,
2.733742, -1.549948, 1.887393, 1, 0, 0.01960784, 1,
2.870849, 1.051328, 2.623519, 1, 0, 0.01176471, 1,
2.904619, -1.702524, 0.1699257, 1, 0, 0.007843138, 1
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
0.003700852, -4.304989, -6.872651, 0, -0.5, 0.5, 0.5,
0.003700852, -4.304989, -6.872651, 1, -0.5, 0.5, 0.5,
0.003700852, -4.304989, -6.872651, 1, 1.5, 0.5, 0.5,
0.003700852, -4.304989, -6.872651, 0, 1.5, 0.5, 0.5
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
-3.880628, -0.04332471, -6.872651, 0, -0.5, 0.5, 0.5,
-3.880628, -0.04332471, -6.872651, 1, -0.5, 0.5, 0.5,
-3.880628, -0.04332471, -6.872651, 1, 1.5, 0.5, 0.5,
-3.880628, -0.04332471, -6.872651, 0, 1.5, 0.5, 0.5
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
-3.880628, -4.304989, 0.273406, 0, -0.5, 0.5, 0.5,
-3.880628, -4.304989, 0.273406, 1, -0.5, 0.5, 0.5,
-3.880628, -4.304989, 0.273406, 1, 1.5, 0.5, 0.5,
-3.880628, -4.304989, 0.273406, 0, 1.5, 0.5, 0.5
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
-2, -3.321528, -5.223561,
2, -3.321528, -5.223561,
-2, -3.321528, -5.223561,
-2, -3.485438, -5.498409,
-1, -3.321528, -5.223561,
-1, -3.485438, -5.498409,
0, -3.321528, -5.223561,
0, -3.485438, -5.498409,
1, -3.321528, -5.223561,
1, -3.485438, -5.498409,
2, -3.321528, -5.223561,
2, -3.485438, -5.498409
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
-2, -3.813259, -6.048106, 0, -0.5, 0.5, 0.5,
-2, -3.813259, -6.048106, 1, -0.5, 0.5, 0.5,
-2, -3.813259, -6.048106, 1, 1.5, 0.5, 0.5,
-2, -3.813259, -6.048106, 0, 1.5, 0.5, 0.5,
-1, -3.813259, -6.048106, 0, -0.5, 0.5, 0.5,
-1, -3.813259, -6.048106, 1, -0.5, 0.5, 0.5,
-1, -3.813259, -6.048106, 1, 1.5, 0.5, 0.5,
-1, -3.813259, -6.048106, 0, 1.5, 0.5, 0.5,
0, -3.813259, -6.048106, 0, -0.5, 0.5, 0.5,
0, -3.813259, -6.048106, 1, -0.5, 0.5, 0.5,
0, -3.813259, -6.048106, 1, 1.5, 0.5, 0.5,
0, -3.813259, -6.048106, 0, 1.5, 0.5, 0.5,
1, -3.813259, -6.048106, 0, -0.5, 0.5, 0.5,
1, -3.813259, -6.048106, 1, -0.5, 0.5, 0.5,
1, -3.813259, -6.048106, 1, 1.5, 0.5, 0.5,
1, -3.813259, -6.048106, 0, 1.5, 0.5, 0.5,
2, -3.813259, -6.048106, 0, -0.5, 0.5, 0.5,
2, -3.813259, -6.048106, 1, -0.5, 0.5, 0.5,
2, -3.813259, -6.048106, 1, 1.5, 0.5, 0.5,
2, -3.813259, -6.048106, 0, 1.5, 0.5, 0.5
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
-2.984245, -3, -5.223561,
-2.984245, 3, -5.223561,
-2.984245, -3, -5.223561,
-3.133642, -3, -5.498409,
-2.984245, -2, -5.223561,
-3.133642, -2, -5.498409,
-2.984245, -1, -5.223561,
-3.133642, -1, -5.498409,
-2.984245, 0, -5.223561,
-3.133642, 0, -5.498409,
-2.984245, 1, -5.223561,
-3.133642, 1, -5.498409,
-2.984245, 2, -5.223561,
-3.133642, 2, -5.498409,
-2.984245, 3, -5.223561,
-3.133642, 3, -5.498409
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
-3.432436, -3, -6.048106, 0, -0.5, 0.5, 0.5,
-3.432436, -3, -6.048106, 1, -0.5, 0.5, 0.5,
-3.432436, -3, -6.048106, 1, 1.5, 0.5, 0.5,
-3.432436, -3, -6.048106, 0, 1.5, 0.5, 0.5,
-3.432436, -2, -6.048106, 0, -0.5, 0.5, 0.5,
-3.432436, -2, -6.048106, 1, -0.5, 0.5, 0.5,
-3.432436, -2, -6.048106, 1, 1.5, 0.5, 0.5,
-3.432436, -2, -6.048106, 0, 1.5, 0.5, 0.5,
-3.432436, -1, -6.048106, 0, -0.5, 0.5, 0.5,
-3.432436, -1, -6.048106, 1, -0.5, 0.5, 0.5,
-3.432436, -1, -6.048106, 1, 1.5, 0.5, 0.5,
-3.432436, -1, -6.048106, 0, 1.5, 0.5, 0.5,
-3.432436, 0, -6.048106, 0, -0.5, 0.5, 0.5,
-3.432436, 0, -6.048106, 1, -0.5, 0.5, 0.5,
-3.432436, 0, -6.048106, 1, 1.5, 0.5, 0.5,
-3.432436, 0, -6.048106, 0, 1.5, 0.5, 0.5,
-3.432436, 1, -6.048106, 0, -0.5, 0.5, 0.5,
-3.432436, 1, -6.048106, 1, -0.5, 0.5, 0.5,
-3.432436, 1, -6.048106, 1, 1.5, 0.5, 0.5,
-3.432436, 1, -6.048106, 0, 1.5, 0.5, 0.5,
-3.432436, 2, -6.048106, 0, -0.5, 0.5, 0.5,
-3.432436, 2, -6.048106, 1, -0.5, 0.5, 0.5,
-3.432436, 2, -6.048106, 1, 1.5, 0.5, 0.5,
-3.432436, 2, -6.048106, 0, 1.5, 0.5, 0.5,
-3.432436, 3, -6.048106, 0, -0.5, 0.5, 0.5,
-3.432436, 3, -6.048106, 1, -0.5, 0.5, 0.5,
-3.432436, 3, -6.048106, 1, 1.5, 0.5, 0.5,
-3.432436, 3, -6.048106, 0, 1.5, 0.5, 0.5
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
-2.984245, -3.321528, -4,
-2.984245, -3.321528, 4,
-2.984245, -3.321528, -4,
-3.133642, -3.485438, -4,
-2.984245, -3.321528, -2,
-3.133642, -3.485438, -2,
-2.984245, -3.321528, 0,
-3.133642, -3.485438, 0,
-2.984245, -3.321528, 2,
-3.133642, -3.485438, 2,
-2.984245, -3.321528, 4,
-3.133642, -3.485438, 4
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
-3.432436, -3.813259, -4, 0, -0.5, 0.5, 0.5,
-3.432436, -3.813259, -4, 1, -0.5, 0.5, 0.5,
-3.432436, -3.813259, -4, 1, 1.5, 0.5, 0.5,
-3.432436, -3.813259, -4, 0, 1.5, 0.5, 0.5,
-3.432436, -3.813259, -2, 0, -0.5, 0.5, 0.5,
-3.432436, -3.813259, -2, 1, -0.5, 0.5, 0.5,
-3.432436, -3.813259, -2, 1, 1.5, 0.5, 0.5,
-3.432436, -3.813259, -2, 0, 1.5, 0.5, 0.5,
-3.432436, -3.813259, 0, 0, -0.5, 0.5, 0.5,
-3.432436, -3.813259, 0, 1, -0.5, 0.5, 0.5,
-3.432436, -3.813259, 0, 1, 1.5, 0.5, 0.5,
-3.432436, -3.813259, 0, 0, 1.5, 0.5, 0.5,
-3.432436, -3.813259, 2, 0, -0.5, 0.5, 0.5,
-3.432436, -3.813259, 2, 1, -0.5, 0.5, 0.5,
-3.432436, -3.813259, 2, 1, 1.5, 0.5, 0.5,
-3.432436, -3.813259, 2, 0, 1.5, 0.5, 0.5,
-3.432436, -3.813259, 4, 0, -0.5, 0.5, 0.5,
-3.432436, -3.813259, 4, 1, -0.5, 0.5, 0.5,
-3.432436, -3.813259, 4, 1, 1.5, 0.5, 0.5,
-3.432436, -3.813259, 4, 0, 1.5, 0.5, 0.5
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
-2.984245, -3.321528, -5.223561,
-2.984245, 3.234879, -5.223561,
-2.984245, -3.321528, 5.770373,
-2.984245, 3.234879, 5.770373,
-2.984245, -3.321528, -5.223561,
-2.984245, -3.321528, 5.770373,
-2.984245, 3.234879, -5.223561,
-2.984245, 3.234879, 5.770373,
-2.984245, -3.321528, -5.223561,
2.991646, -3.321528, -5.223561,
-2.984245, -3.321528, 5.770373,
2.991646, -3.321528, 5.770373,
-2.984245, 3.234879, -5.223561,
2.991646, 3.234879, -5.223561,
-2.984245, 3.234879, 5.770373,
2.991646, 3.234879, 5.770373,
2.991646, -3.321528, -5.223561,
2.991646, 3.234879, -5.223561,
2.991646, -3.321528, 5.770373,
2.991646, 3.234879, 5.770373,
2.991646, -3.321528, -5.223561,
2.991646, -3.321528, 5.770373,
2.991646, 3.234879, -5.223561,
2.991646, 3.234879, 5.770373
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
var radius = 7.543396;
var distance = 33.56142;
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
mvMatrix.translate( -0.003700852, 0.04332471, -0.273406 );
mvMatrix.scale( 1.364829, 1.243984, 0.7418698 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.56142);
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
gl.drawArrays(gl.LINES, 0, 12);
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
gl.drawElements(gl.TRIANGLES, 30, gl.UNSIGNED_SHORT, 0);
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


