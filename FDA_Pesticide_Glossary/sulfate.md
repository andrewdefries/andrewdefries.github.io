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
-2.981336, 0.2821507, 0.4894472, 1, 0, 0, 1,
-2.939898, 0.8313173, -3.514376, 1, 0.007843138, 0, 1,
-2.854234, 0.8914312, -2.723849, 1, 0.01176471, 0, 1,
-2.77183, 0.02575981, -1.028818, 1, 0.01960784, 0, 1,
-2.710247, 1.202063, -0.7333878, 1, 0.02352941, 0, 1,
-2.651279, 0.185727, -2.20681, 1, 0.03137255, 0, 1,
-2.597487, 2.805345, 0.5673183, 1, 0.03529412, 0, 1,
-2.372917, 2.215469, -1.810231, 1, 0.04313726, 0, 1,
-2.3263, 0.03908478, -0.04058942, 1, 0.04705882, 0, 1,
-2.309387, 1.775905, 0.1201103, 1, 0.05490196, 0, 1,
-2.237452, 1.130565, -2.046567, 1, 0.05882353, 0, 1,
-2.188979, 1.385244, -2.941639, 1, 0.06666667, 0, 1,
-2.17914, -0.4997439, -2.098791, 1, 0.07058824, 0, 1,
-2.164784, 1.443371, -0.4875022, 1, 0.07843138, 0, 1,
-2.163926, 2.718648, 0.01534428, 1, 0.08235294, 0, 1,
-2.124177, -0.3227974, 0.2449702, 1, 0.09019608, 0, 1,
-2.104834, -0.2487457, 0.3906676, 1, 0.09411765, 0, 1,
-2.09324, 1.861368, 0.3554972, 1, 0.1019608, 0, 1,
-2.07954, -0.7536076, -1.858901, 1, 0.1098039, 0, 1,
-2.071041, 1.0423, -0.7305242, 1, 0.1137255, 0, 1,
-2.061996, 0.2465641, -0.8365871, 1, 0.1215686, 0, 1,
-2.031666, 0.7359689, -0.9732831, 1, 0.1254902, 0, 1,
-2.015234, -0.09873243, -1.221597, 1, 0.1333333, 0, 1,
-1.968969, 1.138288, -1.854266, 1, 0.1372549, 0, 1,
-1.958627, 1.421073, -0.4785375, 1, 0.145098, 0, 1,
-1.954636, 0.4013541, -2.49486, 1, 0.1490196, 0, 1,
-1.945201, 1.051212, -0.2444468, 1, 0.1568628, 0, 1,
-1.932871, 1.461593, -2.332034, 1, 0.1607843, 0, 1,
-1.927422, 1.142662, -1.597161, 1, 0.1686275, 0, 1,
-1.923352, -0.2596581, -1.620853, 1, 0.172549, 0, 1,
-1.920006, -0.907688, -2.093529, 1, 0.1803922, 0, 1,
-1.8917, 0.9951803, -2.834918, 1, 0.1843137, 0, 1,
-1.889001, 0.3641481, -1.937239, 1, 0.1921569, 0, 1,
-1.88523, 0.1533781, -1.733772, 1, 0.1960784, 0, 1,
-1.878316, -0.2194735, -1.67985, 1, 0.2039216, 0, 1,
-1.871335, 0.6123229, -0.6458051, 1, 0.2117647, 0, 1,
-1.858746, -0.4088597, -1.297426, 1, 0.2156863, 0, 1,
-1.850345, 2.39662, 0.7020279, 1, 0.2235294, 0, 1,
-1.835968, -0.9138611, -1.72966, 1, 0.227451, 0, 1,
-1.825902, -0.3791333, -2.135568, 1, 0.2352941, 0, 1,
-1.819648, 0.09891955, -3.446616, 1, 0.2392157, 0, 1,
-1.799407, 1.44776, -1.078758, 1, 0.2470588, 0, 1,
-1.791886, 0.3829553, -1.688439, 1, 0.2509804, 0, 1,
-1.770776, -1.80486, -3.291271, 1, 0.2588235, 0, 1,
-1.769482, 0.5763698, -3.012858, 1, 0.2627451, 0, 1,
-1.765862, 0.5218434, -2.17831, 1, 0.2705882, 0, 1,
-1.754814, -0.8124996, -2.794738, 1, 0.2745098, 0, 1,
-1.748321, 1.048284, -3.206319, 1, 0.282353, 0, 1,
-1.731704, 1.703042, -0.3854973, 1, 0.2862745, 0, 1,
-1.723158, 0.2747678, -1.613279, 1, 0.2941177, 0, 1,
-1.710551, -0.03947116, -1.503514, 1, 0.3019608, 0, 1,
-1.699229, 1.506505, -0.1326781, 1, 0.3058824, 0, 1,
-1.695225, 1.803367, 0.2539535, 1, 0.3137255, 0, 1,
-1.686268, 0.5345882, 0.7832921, 1, 0.3176471, 0, 1,
-1.671306, 1.524666, -0.5205094, 1, 0.3254902, 0, 1,
-1.662938, 1.223353, 0.5720058, 1, 0.3294118, 0, 1,
-1.655523, 1.253504, 0.1139805, 1, 0.3372549, 0, 1,
-1.633201, -0.1312806, -1.292499, 1, 0.3411765, 0, 1,
-1.63014, 0.4206936, -0.9418101, 1, 0.3490196, 0, 1,
-1.629635, 0.6509531, -0.02490119, 1, 0.3529412, 0, 1,
-1.62192, 0.9125093, 0.1794828, 1, 0.3607843, 0, 1,
-1.605407, 1.419342, -0.309116, 1, 0.3647059, 0, 1,
-1.604632, -0.5434915, -1.011083, 1, 0.372549, 0, 1,
-1.604236, 2.386003, -0.8041738, 1, 0.3764706, 0, 1,
-1.60048, -0.4081241, -4.127768, 1, 0.3843137, 0, 1,
-1.597118, -0.7321777, -0.7603179, 1, 0.3882353, 0, 1,
-1.596654, 1.983857, 0.4355532, 1, 0.3960784, 0, 1,
-1.568569, -1.82736, -2.303761, 1, 0.4039216, 0, 1,
-1.566141, 0.5987984, -0.8390914, 1, 0.4078431, 0, 1,
-1.560896, 0.3840075, -1.338404, 1, 0.4156863, 0, 1,
-1.544262, 0.3293957, -1.102141, 1, 0.4196078, 0, 1,
-1.521737, -0.8900403, -3.577154, 1, 0.427451, 0, 1,
-1.50405, 0.002784666, -3.316505, 1, 0.4313726, 0, 1,
-1.481996, -0.1168907, -1.850098, 1, 0.4392157, 0, 1,
-1.474484, -0.8825018, -1.288548, 1, 0.4431373, 0, 1,
-1.461555, 0.02605708, -2.291581, 1, 0.4509804, 0, 1,
-1.459012, 0.7952184, 0.3450927, 1, 0.454902, 0, 1,
-1.456544, 1.618516, -1.145946, 1, 0.4627451, 0, 1,
-1.455695, 0.7661162, 0.4005007, 1, 0.4666667, 0, 1,
-1.452997, 0.0535094, -0.9441873, 1, 0.4745098, 0, 1,
-1.430918, 1.985024, -2.845219, 1, 0.4784314, 0, 1,
-1.414065, 0.8162466, -0.2771206, 1, 0.4862745, 0, 1,
-1.410692, 0.5242804, -1.885804, 1, 0.4901961, 0, 1,
-1.405739, 0.1752524, -1.915779, 1, 0.4980392, 0, 1,
-1.405639, -0.2344476, -2.857953, 1, 0.5058824, 0, 1,
-1.399897, 0.9662916, -2.143209, 1, 0.509804, 0, 1,
-1.399526, 0.68372, -1.533933, 1, 0.5176471, 0, 1,
-1.358214, 1.18362, -0.6699901, 1, 0.5215687, 0, 1,
-1.357969, -0.4675843, -2.807946, 1, 0.5294118, 0, 1,
-1.306601, 0.3371748, -0.7872864, 1, 0.5333334, 0, 1,
-1.286022, -0.4496173, 0.1851227, 1, 0.5411765, 0, 1,
-1.282876, 1.00048, -0.4422497, 1, 0.5450981, 0, 1,
-1.281905, 0.8552433, -1.314261, 1, 0.5529412, 0, 1,
-1.273147, 0.6963757, -2.145107, 1, 0.5568628, 0, 1,
-1.248055, 0.7368523, 0.264108, 1, 0.5647059, 0, 1,
-1.246368, 0.250566, -2.419461, 1, 0.5686275, 0, 1,
-1.236854, -0.7808867, -1.522451, 1, 0.5764706, 0, 1,
-1.236666, -0.2224271, -3.361416, 1, 0.5803922, 0, 1,
-1.223528, -0.03570512, -0.9650729, 1, 0.5882353, 0, 1,
-1.219221, 0.751156, -3.239911, 1, 0.5921569, 0, 1,
-1.217093, -0.1143925, -2.637457, 1, 0.6, 0, 1,
-1.214663, 1.039356, -0.8025758, 1, 0.6078432, 0, 1,
-1.213169, -2.198901, -2.686182, 1, 0.6117647, 0, 1,
-1.20804, -0.9523745, -3.128453, 1, 0.6196079, 0, 1,
-1.206831, 1.857203, -1.218495, 1, 0.6235294, 0, 1,
-1.203295, -0.1243339, -2.470497, 1, 0.6313726, 0, 1,
-1.201882, -0.2826016, -2.615576, 1, 0.6352941, 0, 1,
-1.200703, -0.6314718, -1.970353, 1, 0.6431373, 0, 1,
-1.19926, 0.01756138, -1.511313, 1, 0.6470588, 0, 1,
-1.196239, -1.753742, -2.771341, 1, 0.654902, 0, 1,
-1.195495, -1.577764, -1.601677, 1, 0.6588235, 0, 1,
-1.190871, -1.357227, -3.171497, 1, 0.6666667, 0, 1,
-1.183813, 0.9657065, -0.8228772, 1, 0.6705883, 0, 1,
-1.183088, 0.5159646, -3.414354, 1, 0.6784314, 0, 1,
-1.17869, 0.5652388, -2.870649, 1, 0.682353, 0, 1,
-1.178082, 0.5860663, -0.4389822, 1, 0.6901961, 0, 1,
-1.177419, -1.000287, -2.675455, 1, 0.6941177, 0, 1,
-1.177219, 0.4576553, -2.478234, 1, 0.7019608, 0, 1,
-1.167922, 0.9090338, -2.314843, 1, 0.7098039, 0, 1,
-1.167493, 0.2527383, -1.981993, 1, 0.7137255, 0, 1,
-1.164119, -1.557492, -4.367959, 1, 0.7215686, 0, 1,
-1.161899, 0.3437865, 0.6672997, 1, 0.7254902, 0, 1,
-1.159892, -1.481804, -3.26066, 1, 0.7333333, 0, 1,
-1.159794, -1.124649, -4.331963, 1, 0.7372549, 0, 1,
-1.146815, 0.2482309, -0.9201619, 1, 0.7450981, 0, 1,
-1.145815, 1.312139, -2.319321, 1, 0.7490196, 0, 1,
-1.14321, -0.1609693, -1.876137, 1, 0.7568628, 0, 1,
-1.14181, -0.6386357, -1.981787, 1, 0.7607843, 0, 1,
-1.135037, 0.8152661, -0.7677617, 1, 0.7686275, 0, 1,
-1.129039, 1.628028, -0.2250157, 1, 0.772549, 0, 1,
-1.128456, 0.2595592, -2.717734, 1, 0.7803922, 0, 1,
-1.123297, -0.1218736, -2.607812, 1, 0.7843137, 0, 1,
-1.109083, 0.1620035, -2.142239, 1, 0.7921569, 0, 1,
-1.108077, -0.8202178, -3.97614, 1, 0.7960784, 0, 1,
-1.074129, 0.2931935, -0.8597738, 1, 0.8039216, 0, 1,
-1.068924, 0.1304392, -3.079561, 1, 0.8117647, 0, 1,
-1.067028, -0.5471448, -2.346609, 1, 0.8156863, 0, 1,
-1.063192, 1.467165, 1.601807, 1, 0.8235294, 0, 1,
-1.062927, -1.168244, -0.4513158, 1, 0.827451, 0, 1,
-1.061158, 0.6074547, -1.581242, 1, 0.8352941, 0, 1,
-1.048329, 0.7424783, -1.465784, 1, 0.8392157, 0, 1,
-1.046544, 1.629166, -1.078319, 1, 0.8470588, 0, 1,
-1.045633, -1.05219, -0.6077261, 1, 0.8509804, 0, 1,
-1.03275, 0.5730876, -1.223842, 1, 0.8588235, 0, 1,
-1.03039, -0.8632773, -2.097026, 1, 0.8627451, 0, 1,
-1.027372, -0.566431, -3.067851, 1, 0.8705882, 0, 1,
-1.023947, -0.884262, -2.412915, 1, 0.8745098, 0, 1,
-1.020679, -1.319309, -1.642759, 1, 0.8823529, 0, 1,
-1.017583, 0.4048964, -2.315062, 1, 0.8862745, 0, 1,
-1.010874, 0.4828872, -1.565923, 1, 0.8941177, 0, 1,
-1.010821, 1.847408, -1.366297, 1, 0.8980392, 0, 1,
-1.009145, -0.8640076, -2.15002, 1, 0.9058824, 0, 1,
-1.000655, 1.23956, -1.564222, 1, 0.9137255, 0, 1,
-0.999803, 0.1067816, 0.1562127, 1, 0.9176471, 0, 1,
-0.9973024, -0.2453482, -1.4879, 1, 0.9254902, 0, 1,
-0.993725, 0.8167485, 0.5237908, 1, 0.9294118, 0, 1,
-0.9920484, 1.71748, -2.350224, 1, 0.9372549, 0, 1,
-0.9879863, -0.9033716, -2.920955, 1, 0.9411765, 0, 1,
-0.9875917, 0.4517764, -0.164438, 1, 0.9490196, 0, 1,
-0.9874157, -0.446548, -2.418795, 1, 0.9529412, 0, 1,
-0.9849789, -0.08997087, -1.065903, 1, 0.9607843, 0, 1,
-0.9819179, -0.8867501, -1.156626, 1, 0.9647059, 0, 1,
-0.9791799, 0.6974165, -1.575711, 1, 0.972549, 0, 1,
-0.9788722, 0.6936395, -1.103025, 1, 0.9764706, 0, 1,
-0.9767837, 0.7534546, -1.96342, 1, 0.9843137, 0, 1,
-0.9724913, -0.4402021, 0.556417, 1, 0.9882353, 0, 1,
-0.9714718, 0.6455802, -1.099604, 1, 0.9960784, 0, 1,
-0.9696855, -0.5315631, -3.79496, 0.9960784, 1, 0, 1,
-0.9520959, 0.4705914, -1.193149, 0.9921569, 1, 0, 1,
-0.9468293, 0.7817193, 0.2199907, 0.9843137, 1, 0, 1,
-0.9401398, -0.03140506, -2.469455, 0.9803922, 1, 0, 1,
-0.9396522, -0.6622396, 0.1351002, 0.972549, 1, 0, 1,
-0.9282903, -2.151025, -1.582823, 0.9686275, 1, 0, 1,
-0.9220167, 0.9071312, -1.961456, 0.9607843, 1, 0, 1,
-0.9170231, -1.522113, -2.543788, 0.9568627, 1, 0, 1,
-0.9142969, 0.7640345, -0.4495887, 0.9490196, 1, 0, 1,
-0.9122487, -0.9004593, -1.030277, 0.945098, 1, 0, 1,
-0.911854, 0.8945843, -2.629954, 0.9372549, 1, 0, 1,
-0.9113988, -0.4294189, -3.797316, 0.9333333, 1, 0, 1,
-0.9094667, -2.097193, -1.848071, 0.9254902, 1, 0, 1,
-0.9079561, 0.161617, -1.561587, 0.9215686, 1, 0, 1,
-0.9052905, -0.5712729, -0.9969974, 0.9137255, 1, 0, 1,
-0.8993213, 2.375757, -0.1089696, 0.9098039, 1, 0, 1,
-0.8936123, 0.1576627, -1.208737, 0.9019608, 1, 0, 1,
-0.8781147, -0.6344677, -0.5894823, 0.8941177, 1, 0, 1,
-0.871272, -0.08284555, -1.860788, 0.8901961, 1, 0, 1,
-0.8693834, 1.580372, 0.4870349, 0.8823529, 1, 0, 1,
-0.8644156, 0.8149922, 0.8311123, 0.8784314, 1, 0, 1,
-0.8644033, 0.979651, -2.90958, 0.8705882, 1, 0, 1,
-0.863592, 1.10079, -1.298133, 0.8666667, 1, 0, 1,
-0.8584516, 0.07207961, -1.85412, 0.8588235, 1, 0, 1,
-0.8504612, -2.090991, -0.372608, 0.854902, 1, 0, 1,
-0.8426364, 0.4823018, -0.2394401, 0.8470588, 1, 0, 1,
-0.8356833, 0.9216484, -2.267462, 0.8431373, 1, 0, 1,
-0.8344828, -0.5663673, -2.695306, 0.8352941, 1, 0, 1,
-0.8317537, 0.6202718, -0.9564398, 0.8313726, 1, 0, 1,
-0.8246896, 0.1083767, -1.288423, 0.8235294, 1, 0, 1,
-0.8240112, 1.925106, -0.1767408, 0.8196079, 1, 0, 1,
-0.8190376, -0.7599146, -1.968481, 0.8117647, 1, 0, 1,
-0.8184995, 0.4998657, -1.258566, 0.8078431, 1, 0, 1,
-0.8153362, 0.3803715, -0.2998625, 0.8, 1, 0, 1,
-0.8141177, -1.175112, -2.413298, 0.7921569, 1, 0, 1,
-0.814101, -0.7271008, -2.059493, 0.7882353, 1, 0, 1,
-0.8134292, 2.285, 0.5927057, 0.7803922, 1, 0, 1,
-0.8109959, 0.7383131, -0.8035446, 0.7764706, 1, 0, 1,
-0.8107798, 0.7414759, -0.168473, 0.7686275, 1, 0, 1,
-0.8107735, 1.225465, 0.3315652, 0.7647059, 1, 0, 1,
-0.8059247, 0.02841006, -3.285784, 0.7568628, 1, 0, 1,
-0.8004503, 0.7066786, -0.9772698, 0.7529412, 1, 0, 1,
-0.7984779, 0.004871691, -2.884489, 0.7450981, 1, 0, 1,
-0.7917271, -1.063852, -3.794673, 0.7411765, 1, 0, 1,
-0.7897567, -0.4352762, -3.258653, 0.7333333, 1, 0, 1,
-0.7826453, 1.555344, 1.080255, 0.7294118, 1, 0, 1,
-0.7815113, 0.4339446, 0.1453699, 0.7215686, 1, 0, 1,
-0.7800491, -0.3803268, -2.769299, 0.7176471, 1, 0, 1,
-0.7779813, -0.908196, -3.268817, 0.7098039, 1, 0, 1,
-0.7776092, -1.281919, -2.325456, 0.7058824, 1, 0, 1,
-0.774695, -0.9986245, -2.55073, 0.6980392, 1, 0, 1,
-0.7728404, -2.011251, -3.070684, 0.6901961, 1, 0, 1,
-0.7690422, -0.4199959, -0.4242249, 0.6862745, 1, 0, 1,
-0.7655257, 0.1868641, -0.8365477, 0.6784314, 1, 0, 1,
-0.764681, 1.28284, -2.088151, 0.6745098, 1, 0, 1,
-0.764164, -0.1930297, 0.3835565, 0.6666667, 1, 0, 1,
-0.7625341, -1.971226, -2.954278, 0.6627451, 1, 0, 1,
-0.7568059, 0.0003417547, -2.247107, 0.654902, 1, 0, 1,
-0.755339, 1.272351, -0.08615576, 0.6509804, 1, 0, 1,
-0.7549694, 0.5388668, 0.7629617, 0.6431373, 1, 0, 1,
-0.7546396, 1.380066, -1.636488, 0.6392157, 1, 0, 1,
-0.75449, -0.6666119, -1.69278, 0.6313726, 1, 0, 1,
-0.7540939, -2.41599, -2.248661, 0.627451, 1, 0, 1,
-0.7539743, 0.1854243, -1.624856, 0.6196079, 1, 0, 1,
-0.746502, 1.479917, -1.29649, 0.6156863, 1, 0, 1,
-0.7450181, 0.7945534, -0.7482508, 0.6078432, 1, 0, 1,
-0.7421073, 0.01171087, -1.138192, 0.6039216, 1, 0, 1,
-0.7420692, -1.312268, -3.533682, 0.5960785, 1, 0, 1,
-0.7396749, -0.6756561, -1.300815, 0.5882353, 1, 0, 1,
-0.739468, -0.7976872, -1.374593, 0.5843138, 1, 0, 1,
-0.720773, -0.01467985, -2.175659, 0.5764706, 1, 0, 1,
-0.7168627, -0.7436768, -2.586201, 0.572549, 1, 0, 1,
-0.7090499, 0.8255247, -2.449882, 0.5647059, 1, 0, 1,
-0.7087491, 1.471851, 0.2694431, 0.5607843, 1, 0, 1,
-0.7084478, -1.335165, -3.303422, 0.5529412, 1, 0, 1,
-0.7069253, -0.07593731, -0.6195999, 0.5490196, 1, 0, 1,
-0.7014804, 0.07924991, -2.26607, 0.5411765, 1, 0, 1,
-0.6993432, -1.252542, -4.059666, 0.5372549, 1, 0, 1,
-0.6986775, 0.4874488, -0.5690481, 0.5294118, 1, 0, 1,
-0.694714, 0.1255244, -2.777591, 0.5254902, 1, 0, 1,
-0.6915095, 0.6899284, 0.2038406, 0.5176471, 1, 0, 1,
-0.6846564, -0.8154991, -1.142925, 0.5137255, 1, 0, 1,
-0.6794453, 0.520344, -1.384984, 0.5058824, 1, 0, 1,
-0.677709, -0.3239092, -2.905422, 0.5019608, 1, 0, 1,
-0.6702111, 0.4921047, -0.7545202, 0.4941176, 1, 0, 1,
-0.6641037, 0.6141756, -1.713631, 0.4862745, 1, 0, 1,
-0.6612938, 0.2154096, -2.852517, 0.4823529, 1, 0, 1,
-0.6542123, 1.909964, -2.048469, 0.4745098, 1, 0, 1,
-0.6486058, -0.1742646, -2.130958, 0.4705882, 1, 0, 1,
-0.6429558, 1.024719, -2.634867, 0.4627451, 1, 0, 1,
-0.6392105, 0.05067222, 0.8470572, 0.4588235, 1, 0, 1,
-0.6349065, -0.4090597, -2.040076, 0.4509804, 1, 0, 1,
-0.6343597, -0.3526785, -1.730766, 0.4470588, 1, 0, 1,
-0.6333458, -0.5669296, -2.752621, 0.4392157, 1, 0, 1,
-0.6330051, 1.239885, -2.140112, 0.4352941, 1, 0, 1,
-0.6316466, -1.172034, -2.613553, 0.427451, 1, 0, 1,
-0.6303831, -0.5453387, -1.671732, 0.4235294, 1, 0, 1,
-0.6293801, 1.236099, 0.4044756, 0.4156863, 1, 0, 1,
-0.6277865, -0.5944785, -1.994409, 0.4117647, 1, 0, 1,
-0.6238178, 1.219256, -0.3016272, 0.4039216, 1, 0, 1,
-0.6208095, -1.425352, -3.568736, 0.3960784, 1, 0, 1,
-0.6145913, -0.08830047, -1.930709, 0.3921569, 1, 0, 1,
-0.6135535, 0.6951644, -2.113222, 0.3843137, 1, 0, 1,
-0.6127883, 0.7799274, 0.386913, 0.3803922, 1, 0, 1,
-0.6123428, 1.063062, -1.572587, 0.372549, 1, 0, 1,
-0.6086849, 0.5968692, 0.7895091, 0.3686275, 1, 0, 1,
-0.6044832, -0.68406, -3.984247, 0.3607843, 1, 0, 1,
-0.5981773, 0.01572714, -1.304782, 0.3568628, 1, 0, 1,
-0.5957174, -1.342998, -2.867512, 0.3490196, 1, 0, 1,
-0.5954241, 0.4613736, -0.4293184, 0.345098, 1, 0, 1,
-0.5899681, -0.4961206, -3.708939, 0.3372549, 1, 0, 1,
-0.5875964, -0.3466759, -1.622981, 0.3333333, 1, 0, 1,
-0.5829549, -1.601223, -2.873832, 0.3254902, 1, 0, 1,
-0.575866, 0.3593897, -0.2460308, 0.3215686, 1, 0, 1,
-0.5749946, 1.3215, -0.7352834, 0.3137255, 1, 0, 1,
-0.5643644, -0.9093059, -1.134464, 0.3098039, 1, 0, 1,
-0.5538346, -0.6804013, -1.861335, 0.3019608, 1, 0, 1,
-0.5525137, -0.4244511, -0.792215, 0.2941177, 1, 0, 1,
-0.5451829, -0.9392021, -1.520164, 0.2901961, 1, 0, 1,
-0.5432963, -0.01999028, -3.542658, 0.282353, 1, 0, 1,
-0.5335692, 0.3844998, -1.794848, 0.2784314, 1, 0, 1,
-0.5335287, -0.1084341, -2.060257, 0.2705882, 1, 0, 1,
-0.5289053, 1.106912, -1.317444, 0.2666667, 1, 0, 1,
-0.5259197, -1.970533, -3.847146, 0.2588235, 1, 0, 1,
-0.5249274, 0.1573486, -1.443288, 0.254902, 1, 0, 1,
-0.5198497, -2.375682, -3.632862, 0.2470588, 1, 0, 1,
-0.5122291, 0.6609399, -0.8575867, 0.2431373, 1, 0, 1,
-0.510239, 1.307268, -0.16316, 0.2352941, 1, 0, 1,
-0.5090119, 0.3777615, 1.017104, 0.2313726, 1, 0, 1,
-0.5078704, -0.5285895, -2.727979, 0.2235294, 1, 0, 1,
-0.5033652, 0.2120024, -1.155218, 0.2196078, 1, 0, 1,
-0.5023993, -0.9128147, -3.447484, 0.2117647, 1, 0, 1,
-0.5016418, 1.149442, -0.3757462, 0.2078431, 1, 0, 1,
-0.5009885, -1.166274, -1.996808, 0.2, 1, 0, 1,
-0.4897738, 0.03115975, -1.182987, 0.1921569, 1, 0, 1,
-0.4852426, 0.4574277, -2.04013, 0.1882353, 1, 0, 1,
-0.4843031, -1.324254, -2.692952, 0.1803922, 1, 0, 1,
-0.4841663, -0.4675835, -2.750265, 0.1764706, 1, 0, 1,
-0.4808657, 1.269729, -2.283155, 0.1686275, 1, 0, 1,
-0.4788744, -0.4106281, -3.58507, 0.1647059, 1, 0, 1,
-0.4734446, 2.16139, 0.6987707, 0.1568628, 1, 0, 1,
-0.4730785, 0.5897338, 0.3305636, 0.1529412, 1, 0, 1,
-0.4715739, -1.384692, -3.212176, 0.145098, 1, 0, 1,
-0.4673689, -0.1443254, -1.22359, 0.1411765, 1, 0, 1,
-0.462478, 0.01523582, -2.064516, 0.1333333, 1, 0, 1,
-0.4596469, 1.575188, 0.7685136, 0.1294118, 1, 0, 1,
-0.4545181, 1.161562, 0.3685884, 0.1215686, 1, 0, 1,
-0.4544017, -0.8390241, -1.681364, 0.1176471, 1, 0, 1,
-0.4514278, -0.5713527, -4.05813, 0.1098039, 1, 0, 1,
-0.4467546, 0.926456, 0.4850062, 0.1058824, 1, 0, 1,
-0.4422243, -0.2067771, -0.917286, 0.09803922, 1, 0, 1,
-0.4405047, 1.005528, 0.08949275, 0.09019608, 1, 0, 1,
-0.4387372, 0.3302192, -1.882536, 0.08627451, 1, 0, 1,
-0.4312634, -0.1183341, -3.400526, 0.07843138, 1, 0, 1,
-0.4310252, 0.2154202, 0.3368643, 0.07450981, 1, 0, 1,
-0.426217, -1.311776, -2.97209, 0.06666667, 1, 0, 1,
-0.426189, 1.054878, -0.8571978, 0.0627451, 1, 0, 1,
-0.423858, 0.6765177, 1.429654, 0.05490196, 1, 0, 1,
-0.4227158, 0.2191642, -1.240668, 0.05098039, 1, 0, 1,
-0.4146406, -1.252343, -3.958593, 0.04313726, 1, 0, 1,
-0.4115723, -0.2487422, -4.767895, 0.03921569, 1, 0, 1,
-0.4114259, 1.53621, -1.472666, 0.03137255, 1, 0, 1,
-0.4102234, 0.07521149, -0.9220061, 0.02745098, 1, 0, 1,
-0.4065208, 0.8127, 0.9710594, 0.01960784, 1, 0, 1,
-0.3988973, 0.5002205, -1.443183, 0.01568628, 1, 0, 1,
-0.3942498, -0.3140748, -3.333786, 0.007843138, 1, 0, 1,
-0.3922006, 1.177412, -0.9995515, 0.003921569, 1, 0, 1,
-0.3856027, 0.4099804, -0.4064895, 0, 1, 0.003921569, 1,
-0.3840509, 0.9273717, -0.59794, 0, 1, 0.01176471, 1,
-0.3796691, -1.619761, -2.927323, 0, 1, 0.01568628, 1,
-0.3720974, 0.2724316, -1.146486, 0, 1, 0.02352941, 1,
-0.3720525, 1.223969, -0.7332793, 0, 1, 0.02745098, 1,
-0.3684779, 1.017234, -1.594554, 0, 1, 0.03529412, 1,
-0.3683116, -0.2314801, -4.91879, 0, 1, 0.03921569, 1,
-0.3671966, 1.734383, -0.9787127, 0, 1, 0.04705882, 1,
-0.358389, 1.91321, -0.4419533, 0, 1, 0.05098039, 1,
-0.3518059, 1.105494, 0.3382432, 0, 1, 0.05882353, 1,
-0.3450276, 0.6990116, -0.8333777, 0, 1, 0.0627451, 1,
-0.3333587, 0.09485759, -0.9197782, 0, 1, 0.07058824, 1,
-0.3310336, -0.1667652, -3.296457, 0, 1, 0.07450981, 1,
-0.3260772, 0.8961123, -1.514097, 0, 1, 0.08235294, 1,
-0.3257084, -0.1105326, -2.259921, 0, 1, 0.08627451, 1,
-0.3214804, -0.9696657, -4.655411, 0, 1, 0.09411765, 1,
-0.3208733, -0.02874574, -0.901706, 0, 1, 0.1019608, 1,
-0.3183501, 1.14869, -0.6370882, 0, 1, 0.1058824, 1,
-0.3139132, -1.410511, -4.820551, 0, 1, 0.1137255, 1,
-0.3119099, -2.131964, -3.83009, 0, 1, 0.1176471, 1,
-0.3063634, 0.828108, -1.31239, 0, 1, 0.1254902, 1,
-0.3050978, -0.4737929, -2.318034, 0, 1, 0.1294118, 1,
-0.2991378, -0.1225856, -2.027306, 0, 1, 0.1372549, 1,
-0.2954055, -0.1831448, -0.9753571, 0, 1, 0.1411765, 1,
-0.2942409, -1.355444, -1.590768, 0, 1, 0.1490196, 1,
-0.2921915, 1.188574, 0.2939412, 0, 1, 0.1529412, 1,
-0.2892865, 1.481185, 0.1189895, 0, 1, 0.1607843, 1,
-0.2821096, 0.2779821, -1.490981, 0, 1, 0.1647059, 1,
-0.281627, 0.7643655, 2.079536, 0, 1, 0.172549, 1,
-0.2795771, -1.484308, -1.096018, 0, 1, 0.1764706, 1,
-0.2766923, -0.529348, -2.821666, 0, 1, 0.1843137, 1,
-0.2758931, -0.3855079, -2.584819, 0, 1, 0.1882353, 1,
-0.2737795, -0.5291671, -1.807552, 0, 1, 0.1960784, 1,
-0.2697422, -0.8026386, -1.166879, 0, 1, 0.2039216, 1,
-0.2695942, 0.6622935, -1.528608, 0, 1, 0.2078431, 1,
-0.2657968, -0.4813591, -2.122665, 0, 1, 0.2156863, 1,
-0.2640924, -1.210002, -3.399081, 0, 1, 0.2196078, 1,
-0.2635579, -0.2066618, -1.363988, 0, 1, 0.227451, 1,
-0.2622351, -0.8326526, -1.805275, 0, 1, 0.2313726, 1,
-0.2559029, -1.367905, -1.993814, 0, 1, 0.2392157, 1,
-0.2521393, -0.04473874, -3.247931, 0, 1, 0.2431373, 1,
-0.251323, -0.4600032, -2.55561, 0, 1, 0.2509804, 1,
-0.2487546, 1.528001, 0.3778867, 0, 1, 0.254902, 1,
-0.2479679, -0.6258313, -2.060198, 0, 1, 0.2627451, 1,
-0.2445567, 2.403486, -0.05720689, 0, 1, 0.2666667, 1,
-0.2437097, 1.000546, 0.5057521, 0, 1, 0.2745098, 1,
-0.2421256, 1.368816, -0.4722401, 0, 1, 0.2784314, 1,
-0.2351758, 1.231375, -1.180608, 0, 1, 0.2862745, 1,
-0.2318458, -0.1212301, -1.26457, 0, 1, 0.2901961, 1,
-0.2296975, -0.7689959, -2.49412, 0, 1, 0.2980392, 1,
-0.2292601, -0.6454558, -3.18541, 0, 1, 0.3058824, 1,
-0.2277904, 1.398999, -0.7038531, 0, 1, 0.3098039, 1,
-0.227082, 0.2400753, -0.6741738, 0, 1, 0.3176471, 1,
-0.2267303, 0.2311022, 0.1355478, 0, 1, 0.3215686, 1,
-0.2238122, 0.9161875, 0.0423913, 0, 1, 0.3294118, 1,
-0.2160552, -0.1578221, -2.866318, 0, 1, 0.3333333, 1,
-0.2144472, 1.24079, 0.144316, 0, 1, 0.3411765, 1,
-0.2119885, -0.7069141, -2.737792, 0, 1, 0.345098, 1,
-0.2009503, -2.540781, -3.182103, 0, 1, 0.3529412, 1,
-0.1927836, -0.4307766, -4.311331, 0, 1, 0.3568628, 1,
-0.1913345, 1.834997, 0.8164116, 0, 1, 0.3647059, 1,
-0.1903695, 2.446805, 0.6353803, 0, 1, 0.3686275, 1,
-0.1870395, 0.9156826, -0.2203238, 0, 1, 0.3764706, 1,
-0.1863019, 0.5980423, 0.9777617, 0, 1, 0.3803922, 1,
-0.185416, 0.7882088, -2.824042, 0, 1, 0.3882353, 1,
-0.184881, -1.460339, -3.207495, 0, 1, 0.3921569, 1,
-0.1831158, -0.03644781, -3.626009, 0, 1, 0.4, 1,
-0.1812488, -1.376941, -3.292157, 0, 1, 0.4078431, 1,
-0.176348, 0.4792666, -0.6466641, 0, 1, 0.4117647, 1,
-0.1761328, -0.4809533, -3.182105, 0, 1, 0.4196078, 1,
-0.1723839, 0.2696539, -2.05235, 0, 1, 0.4235294, 1,
-0.1714129, -0.8302557, -2.751289, 0, 1, 0.4313726, 1,
-0.1689496, -0.03891045, -4.547859, 0, 1, 0.4352941, 1,
-0.1676506, 0.9448496, -0.4309443, 0, 1, 0.4431373, 1,
-0.1617031, 0.7117531, -0.304543, 0, 1, 0.4470588, 1,
-0.1579424, -0.3577753, -3.785048, 0, 1, 0.454902, 1,
-0.1535758, 0.2506245, -0.6959342, 0, 1, 0.4588235, 1,
-0.1511927, 0.3593362, -0.3798164, 0, 1, 0.4666667, 1,
-0.1486899, 0.9784169, -1.201487, 0, 1, 0.4705882, 1,
-0.1461564, -0.3438422, -0.783536, 0, 1, 0.4784314, 1,
-0.1438643, -1.472392, -1.665007, 0, 1, 0.4823529, 1,
-0.1425006, 0.1610454, 0.5684294, 0, 1, 0.4901961, 1,
-0.1378056, 0.003106516, -0.5767061, 0, 1, 0.4941176, 1,
-0.1353064, -1.420705, -3.469708, 0, 1, 0.5019608, 1,
-0.1350978, 0.6808949, 0.1652994, 0, 1, 0.509804, 1,
-0.1312136, 1.643922, -0.09854825, 0, 1, 0.5137255, 1,
-0.1306807, -1.663566, -2.42724, 0, 1, 0.5215687, 1,
-0.1297676, 0.6980117, -1.809436, 0, 1, 0.5254902, 1,
-0.1265033, 0.5634305, -0.3329931, 0, 1, 0.5333334, 1,
-0.1245867, -0.8861261, -1.958183, 0, 1, 0.5372549, 1,
-0.1244661, 0.06923193, 0.9437286, 0, 1, 0.5450981, 1,
-0.1197962, 1.638284, 0.4133301, 0, 1, 0.5490196, 1,
-0.1195872, 2.054407, -1.04909, 0, 1, 0.5568628, 1,
-0.1171325, -0.4413834, -3.074558, 0, 1, 0.5607843, 1,
-0.1125292, 1.382786, -0.2011743, 0, 1, 0.5686275, 1,
-0.1122867, 0.495446, -1.932429, 0, 1, 0.572549, 1,
-0.1101914, -1.846748, -0.9497603, 0, 1, 0.5803922, 1,
-0.1101457, 0.5518842, 1.061208, 0, 1, 0.5843138, 1,
-0.1059331, -1.225419, -3.133225, 0, 1, 0.5921569, 1,
-0.1049355, -0.02323961, -0.8117703, 0, 1, 0.5960785, 1,
-0.09995956, 0.7629088, 0.6284305, 0, 1, 0.6039216, 1,
-0.09832306, -0.6724688, -2.426063, 0, 1, 0.6117647, 1,
-0.09510013, -1.69791, -4.15823, 0, 1, 0.6156863, 1,
-0.0906432, -0.4768072, -3.367333, 0, 1, 0.6235294, 1,
-0.09058329, -0.3751052, -2.232519, 0, 1, 0.627451, 1,
-0.08234937, 0.4359979, -1.250989, 0, 1, 0.6352941, 1,
-0.07942197, 1.326943, -0.3579002, 0, 1, 0.6392157, 1,
-0.07863123, 0.7041541, -0.1248577, 0, 1, 0.6470588, 1,
-0.07676013, 0.5610806, 1.544078, 0, 1, 0.6509804, 1,
-0.07624549, 1.702349, 0.704692, 0, 1, 0.6588235, 1,
-0.07495969, 0.9741339, -0.9127246, 0, 1, 0.6627451, 1,
-0.06845099, -0.6054828, -3.437088, 0, 1, 0.6705883, 1,
-0.058896, 0.7314808, -0.7959294, 0, 1, 0.6745098, 1,
-0.05675316, 0.5185395, -0.6449329, 0, 1, 0.682353, 1,
-0.0557691, -1.114175, -1.589017, 0, 1, 0.6862745, 1,
-0.05027382, 0.4042918, -0.3135299, 0, 1, 0.6941177, 1,
-0.04989357, 0.06092957, -1.911196, 0, 1, 0.7019608, 1,
-0.04862333, 1.484049, -0.2000553, 0, 1, 0.7058824, 1,
-0.04676834, 0.1063109, -0.9105125, 0, 1, 0.7137255, 1,
-0.04584938, -0.8252692, -2.967885, 0, 1, 0.7176471, 1,
-0.04058334, 1.24549, -1.092628, 0, 1, 0.7254902, 1,
-0.03811316, -0.443051, -2.064431, 0, 1, 0.7294118, 1,
-0.03763254, -0.5138223, -2.562731, 0, 1, 0.7372549, 1,
-0.0348274, -0.8631341, -3.363877, 0, 1, 0.7411765, 1,
-0.03284667, -0.1238736, -2.477985, 0, 1, 0.7490196, 1,
-0.03263233, 2.180437, 1.323966, 0, 1, 0.7529412, 1,
-0.03003614, 0.1791892, -0.09835666, 0, 1, 0.7607843, 1,
-0.02331977, 0.7303193, -0.4859678, 0, 1, 0.7647059, 1,
-0.02228841, -0.3515429, -4.284878, 0, 1, 0.772549, 1,
-0.01534083, -2.052108, -3.728817, 0, 1, 0.7764706, 1,
-0.01437033, 0.04027345, 0.01016702, 0, 1, 0.7843137, 1,
-0.01287295, 0.4214253, 0.7066601, 0, 1, 0.7882353, 1,
-0.01106894, 0.375009, 0.4427297, 0, 1, 0.7960784, 1,
-0.00919247, 0.159635, -1.668866, 0, 1, 0.8039216, 1,
-0.008488694, -0.8154824, -4.488522, 0, 1, 0.8078431, 1,
-0.0040926, 0.5066351, 0.6262686, 0, 1, 0.8156863, 1,
-0.00215056, 0.4512615, -0.1453434, 0, 1, 0.8196079, 1,
-3.05812e-05, -0.7563779, -2.457275, 0, 1, 0.827451, 1,
0.003418245, -1.16058, 3.959804, 0, 1, 0.8313726, 1,
0.004490111, 1.151494, -0.1383031, 0, 1, 0.8392157, 1,
0.007343439, -1.520639, 1.945621, 0, 1, 0.8431373, 1,
0.007361685, -0.9249408, 4.063332, 0, 1, 0.8509804, 1,
0.007798969, 0.6056932, -0.02622036, 0, 1, 0.854902, 1,
0.009300465, -0.4584037, 2.96749, 0, 1, 0.8627451, 1,
0.009810165, 1.07203, -0.2250728, 0, 1, 0.8666667, 1,
0.01096908, -0.3101161, 4.047818, 0, 1, 0.8745098, 1,
0.01125789, -0.8626643, 2.77518, 0, 1, 0.8784314, 1,
0.0132381, 0.4670082, -0.9706354, 0, 1, 0.8862745, 1,
0.01718645, 0.3446613, 0.2578245, 0, 1, 0.8901961, 1,
0.01775038, -0.5498627, 2.733572, 0, 1, 0.8980392, 1,
0.0206343, -0.6957205, 2.70663, 0, 1, 0.9058824, 1,
0.02167131, 0.8541508, -0.513997, 0, 1, 0.9098039, 1,
0.02305468, -0.9836673, 2.364207, 0, 1, 0.9176471, 1,
0.03130123, 0.520291, -1.881414, 0, 1, 0.9215686, 1,
0.03520849, 0.1339493, 0.2896286, 0, 1, 0.9294118, 1,
0.03579597, 0.8894411, 0.6415157, 0, 1, 0.9333333, 1,
0.03774434, 1.59796, 0.8152747, 0, 1, 0.9411765, 1,
0.03942316, -0.2902553, 2.334982, 0, 1, 0.945098, 1,
0.04060247, -0.2267392, 3.206253, 0, 1, 0.9529412, 1,
0.04432553, -0.5848545, 4.029123, 0, 1, 0.9568627, 1,
0.05140542, -0.1217587, 1.865398, 0, 1, 0.9647059, 1,
0.05197952, -2.795263, 1.288178, 0, 1, 0.9686275, 1,
0.05314578, 0.4495467, -0.5429759, 0, 1, 0.9764706, 1,
0.05695293, -0.7883236, 4.39014, 0, 1, 0.9803922, 1,
0.05812294, 0.1905707, -1.141461, 0, 1, 0.9882353, 1,
0.05909105, 0.4426833, 0.4545419, 0, 1, 0.9921569, 1,
0.0644872, -0.05794401, 1.529153, 0, 1, 1, 1,
0.06529707, 0.5702428, 0.2446791, 0, 0.9921569, 1, 1,
0.07016303, 0.4750437, 2.039605, 0, 0.9882353, 1, 1,
0.07258628, -0.158282, 2.189668, 0, 0.9803922, 1, 1,
0.07290698, 2.328382, 0.746668, 0, 0.9764706, 1, 1,
0.07943948, 0.674339, -0.3490294, 0, 0.9686275, 1, 1,
0.08482951, -2.317098, 2.180607, 0, 0.9647059, 1, 1,
0.08831146, 0.609439, -0.3271092, 0, 0.9568627, 1, 1,
0.08864059, 0.7767866, -1.191897, 0, 0.9529412, 1, 1,
0.08958122, -0.9384915, 2.586926, 0, 0.945098, 1, 1,
0.09054185, 0.3133312, -0.776867, 0, 0.9411765, 1, 1,
0.09183826, 1.269879, 0.63381, 0, 0.9333333, 1, 1,
0.09470907, -0.8559234, 1.842872, 0, 0.9294118, 1, 1,
0.09875973, -1.355798, 3.777547, 0, 0.9215686, 1, 1,
0.1019051, 1.83822, 0.7484231, 0, 0.9176471, 1, 1,
0.10192, -1.372278, 2.430809, 0, 0.9098039, 1, 1,
0.1045713, -0.2368137, 1.385805, 0, 0.9058824, 1, 1,
0.1059534, -0.3508813, 2.480587, 0, 0.8980392, 1, 1,
0.1076454, 1.362985, 1.175633, 0, 0.8901961, 1, 1,
0.1089919, -0.600539, 4.427783, 0, 0.8862745, 1, 1,
0.1090067, 1.274655, -0.7770025, 0, 0.8784314, 1, 1,
0.1096403, -0.9072234, 3.034528, 0, 0.8745098, 1, 1,
0.1103482, -2.541355, 2.952732, 0, 0.8666667, 1, 1,
0.1148418, 1.088683, -1.356634, 0, 0.8627451, 1, 1,
0.117301, 0.3571608, 1.343084, 0, 0.854902, 1, 1,
0.1252317, 0.7522356, 0.6409303, 0, 0.8509804, 1, 1,
0.1294959, 0.4377275, 1.041368, 0, 0.8431373, 1, 1,
0.1299268, 1.615885, -0.7942894, 0, 0.8392157, 1, 1,
0.130844, -0.8237748, 3.558473, 0, 0.8313726, 1, 1,
0.1370461, 0.9367152, 1.88676, 0, 0.827451, 1, 1,
0.151396, -1.185377, 2.089692, 0, 0.8196079, 1, 1,
0.1524436, 1.539295, -0.7548399, 0, 0.8156863, 1, 1,
0.1550512, 0.4700786, 0.3938517, 0, 0.8078431, 1, 1,
0.1563292, -0.8609459, 3.443932, 0, 0.8039216, 1, 1,
0.16034, 0.3653351, 1.081233, 0, 0.7960784, 1, 1,
0.1675304, -1.209203, 2.247069, 0, 0.7882353, 1, 1,
0.1683959, -2.357121, 2.272936, 0, 0.7843137, 1, 1,
0.1685377, 0.8563492, 1.008023, 0, 0.7764706, 1, 1,
0.1733918, 0.4703513, 1.987719, 0, 0.772549, 1, 1,
0.1770379, 1.817717, -0.4602232, 0, 0.7647059, 1, 1,
0.1785675, -0.6053711, 3.238911, 0, 0.7607843, 1, 1,
0.1794971, -0.4436988, 4.105124, 0, 0.7529412, 1, 1,
0.1800369, -2.396396, 2.413091, 0, 0.7490196, 1, 1,
0.1819312, 0.9057159, 0.8495317, 0, 0.7411765, 1, 1,
0.1862099, -2.361391, 0.4289326, 0, 0.7372549, 1, 1,
0.1881647, -1.407786, 3.115708, 0, 0.7294118, 1, 1,
0.188695, -0.2344533, 0.6435907, 0, 0.7254902, 1, 1,
0.1898746, -0.7750965, 3.165165, 0, 0.7176471, 1, 1,
0.1908458, 1.479092, -1.498184, 0, 0.7137255, 1, 1,
0.1918985, -1.600047, 5.783092, 0, 0.7058824, 1, 1,
0.1949015, 0.2500132, 0.4824635, 0, 0.6980392, 1, 1,
0.1951412, -0.2302869, 2.964643, 0, 0.6941177, 1, 1,
0.1957683, 0.6521332, 0.1014936, 0, 0.6862745, 1, 1,
0.1957867, 1.234338, 1.287308, 0, 0.682353, 1, 1,
0.1975154, 0.2312365, -0.1499305, 0, 0.6745098, 1, 1,
0.1998763, 0.2003802, -0.6804578, 0, 0.6705883, 1, 1,
0.2001269, -0.6217727, 4.140095, 0, 0.6627451, 1, 1,
0.2047096, 0.45906, 1.076681, 0, 0.6588235, 1, 1,
0.2067414, -0.06374205, 1.721191, 0, 0.6509804, 1, 1,
0.2088189, -1.713783, 2.607857, 0, 0.6470588, 1, 1,
0.2092286, -0.1323337, 1.800215, 0, 0.6392157, 1, 1,
0.2143098, -1.497452, 1.379206, 0, 0.6352941, 1, 1,
0.2201915, -0.3303289, 1.896518, 0, 0.627451, 1, 1,
0.2208511, 0.09946395, 1.692761, 0, 0.6235294, 1, 1,
0.2239439, 0.9794133, 2.712695, 0, 0.6156863, 1, 1,
0.2282061, -0.9240229, 2.171876, 0, 0.6117647, 1, 1,
0.2291921, -0.9746542, 5.021593, 0, 0.6039216, 1, 1,
0.2305021, -0.07662657, -0.9447452, 0, 0.5960785, 1, 1,
0.232216, -0.04107391, 1.963547, 0, 0.5921569, 1, 1,
0.2374652, 0.5545504, 1.395009, 0, 0.5843138, 1, 1,
0.2383155, 1.045982, 0.6138647, 0, 0.5803922, 1, 1,
0.2397145, 0.6327691, 1.169812, 0, 0.572549, 1, 1,
0.2470273, -0.002960319, 2.402306, 0, 0.5686275, 1, 1,
0.247963, -0.6368197, 3.832537, 0, 0.5607843, 1, 1,
0.2479822, -0.1637812, 3.142831, 0, 0.5568628, 1, 1,
0.2481815, -1.113499, 3.244658, 0, 0.5490196, 1, 1,
0.2563591, -0.1035952, 1.690137, 0, 0.5450981, 1, 1,
0.2590168, -0.803661, 3.204856, 0, 0.5372549, 1, 1,
0.2590679, 0.6438962, -0.3810855, 0, 0.5333334, 1, 1,
0.2598453, -0.8229873, 3.016131, 0, 0.5254902, 1, 1,
0.2629778, -1.576147, 3.938348, 0, 0.5215687, 1, 1,
0.2635699, -0.2940212, 1.117208, 0, 0.5137255, 1, 1,
0.2677576, -0.817872, 3.195173, 0, 0.509804, 1, 1,
0.2700273, 0.357677, 0.4152105, 0, 0.5019608, 1, 1,
0.2720752, 0.0004520013, 0.8542175, 0, 0.4941176, 1, 1,
0.2733846, 1.930408, -0.11098, 0, 0.4901961, 1, 1,
0.2733952, 0.07226966, 3.203711, 0, 0.4823529, 1, 1,
0.2823882, -0.1426633, 3.567604, 0, 0.4784314, 1, 1,
0.2845145, 2.292199, 0.2434442, 0, 0.4705882, 1, 1,
0.2855359, -1.369718, 1.487337, 0, 0.4666667, 1, 1,
0.289243, 2.101651, 0.7839108, 0, 0.4588235, 1, 1,
0.2897744, -0.9151503, 3.779005, 0, 0.454902, 1, 1,
0.2938562, -0.779059, 2.411309, 0, 0.4470588, 1, 1,
0.295787, -1.203723, 3.822164, 0, 0.4431373, 1, 1,
0.2958378, 0.7789856, -0.5577648, 0, 0.4352941, 1, 1,
0.2959248, 0.6294082, -0.9216745, 0, 0.4313726, 1, 1,
0.2973865, 0.8695116, -0.9774589, 0, 0.4235294, 1, 1,
0.3006919, -0.8063446, 4.21866, 0, 0.4196078, 1, 1,
0.3022455, -1.429846, 4.189188, 0, 0.4117647, 1, 1,
0.3029385, 2.124822, 0.08055412, 0, 0.4078431, 1, 1,
0.3029645, 1.269249, 0.1495295, 0, 0.4, 1, 1,
0.3045401, 0.432971, 1.994963, 0, 0.3921569, 1, 1,
0.3050731, -0.2980683, 1.964111, 0, 0.3882353, 1, 1,
0.3135538, 1.140919, 0.9752489, 0, 0.3803922, 1, 1,
0.3225326, 0.9281173, 0.02186183, 0, 0.3764706, 1, 1,
0.3235247, 0.461004, 0.2018788, 0, 0.3686275, 1, 1,
0.3253123, 0.4130535, -1.646871, 0, 0.3647059, 1, 1,
0.3260288, 0.7823557, -0.5551165, 0, 0.3568628, 1, 1,
0.326338, -1.576535, 3.052935, 0, 0.3529412, 1, 1,
0.3289492, -1.21439, 1.19522, 0, 0.345098, 1, 1,
0.3296434, -0.3007533, 2.865876, 0, 0.3411765, 1, 1,
0.3302124, -1.069097, 4.394346, 0, 0.3333333, 1, 1,
0.3309796, -0.2198786, 4.451992, 0, 0.3294118, 1, 1,
0.3329812, -0.01954069, 1.068175, 0, 0.3215686, 1, 1,
0.3367012, 0.0474458, 0.8065822, 0, 0.3176471, 1, 1,
0.3385749, -0.1796938, 4.012149, 0, 0.3098039, 1, 1,
0.3392705, 0.3977997, 1.432582, 0, 0.3058824, 1, 1,
0.3497656, -0.1551988, 2.213762, 0, 0.2980392, 1, 1,
0.3502175, 1.884246, -1.268258, 0, 0.2901961, 1, 1,
0.3503703, 0.5257555, 0.2961231, 0, 0.2862745, 1, 1,
0.3512184, -0.06100164, 0.4188098, 0, 0.2784314, 1, 1,
0.3525644, -1.447406, 2.388178, 0, 0.2745098, 1, 1,
0.3538013, -1.230632, 3.760566, 0, 0.2666667, 1, 1,
0.354535, 0.1526224, 2.782695, 0, 0.2627451, 1, 1,
0.3592153, -1.344239, 3.774714, 0, 0.254902, 1, 1,
0.3599142, -0.6546937, 3.000063, 0, 0.2509804, 1, 1,
0.3618225, -1.077648, 1.74083, 0, 0.2431373, 1, 1,
0.363081, -0.3000491, 3.490399, 0, 0.2392157, 1, 1,
0.3653754, -0.4413208, 2.176875, 0, 0.2313726, 1, 1,
0.3680024, -1.572594, 4.346611, 0, 0.227451, 1, 1,
0.3693206, 0.496073, 1.224416, 0, 0.2196078, 1, 1,
0.3718081, -0.9904214, 2.811554, 0, 0.2156863, 1, 1,
0.3730715, -0.7530001, 3.053071, 0, 0.2078431, 1, 1,
0.3749015, -0.06954369, 1.860898, 0, 0.2039216, 1, 1,
0.3763175, 0.02466087, 1.004718, 0, 0.1960784, 1, 1,
0.3820525, 0.1501659, 2.180196, 0, 0.1882353, 1, 1,
0.3846313, -0.9441065, 1.623134, 0, 0.1843137, 1, 1,
0.3853019, 0.9596724, 0.8234472, 0, 0.1764706, 1, 1,
0.3875617, 0.5873935, 0.1621214, 0, 0.172549, 1, 1,
0.3903684, -1.389211, 3.800573, 0, 0.1647059, 1, 1,
0.3906509, 1.488417, -1.765319, 0, 0.1607843, 1, 1,
0.3932072, 0.8842586, 0.3660956, 0, 0.1529412, 1, 1,
0.3975242, -0.3562168, 1.489216, 0, 0.1490196, 1, 1,
0.3984495, 0.5984696, 2.010241, 0, 0.1411765, 1, 1,
0.4008114, -0.6664836, 0.8128626, 0, 0.1372549, 1, 1,
0.4016181, -1.075411, 2.087424, 0, 0.1294118, 1, 1,
0.4016561, -0.4867679, 2.802592, 0, 0.1254902, 1, 1,
0.401773, 1.553255, 1.338264, 0, 0.1176471, 1, 1,
0.403004, -0.9790488, 2.108037, 0, 0.1137255, 1, 1,
0.4099466, 0.05680761, 1.946694, 0, 0.1058824, 1, 1,
0.4111364, -1.175619, 0.7400705, 0, 0.09803922, 1, 1,
0.4160212, 0.5388968, 1.186154, 0, 0.09411765, 1, 1,
0.4167516, 0.02911007, 1.597282, 0, 0.08627451, 1, 1,
0.4175123, -0.5819803, 3.200459, 0, 0.08235294, 1, 1,
0.4191098, 0.6656389, 0.2972211, 0, 0.07450981, 1, 1,
0.4223918, 0.1762973, 1.771859, 0, 0.07058824, 1, 1,
0.4243706, -0.9560726, 2.511134, 0, 0.0627451, 1, 1,
0.4295557, 0.3851128, 1.73395, 0, 0.05882353, 1, 1,
0.4308788, 1.907505, 2.426122, 0, 0.05098039, 1, 1,
0.4317226, 1.281819, 2.258358, 0, 0.04705882, 1, 1,
0.4319427, 1.344686, 1.423222, 0, 0.03921569, 1, 1,
0.432281, -0.02015238, 0.07899933, 0, 0.03529412, 1, 1,
0.4347482, -0.236233, 3.451926, 0, 0.02745098, 1, 1,
0.4376444, -0.3867761, 1.60115, 0, 0.02352941, 1, 1,
0.4389763, -0.02335507, 1.082123, 0, 0.01568628, 1, 1,
0.4407144, -0.6366386, 2.35176, 0, 0.01176471, 1, 1,
0.4419203, 1.679128, 1.338044, 0, 0.003921569, 1, 1,
0.4504544, 1.078833, -0.3158152, 0.003921569, 0, 1, 1,
0.4530886, 0.3387039, 2.788224, 0.007843138, 0, 1, 1,
0.4572196, -1.496157, 2.376924, 0.01568628, 0, 1, 1,
0.4576897, -0.5449528, 4.726001, 0.01960784, 0, 1, 1,
0.461252, -0.5080364, 1.231558, 0.02745098, 0, 1, 1,
0.4668076, -0.700164, 3.531717, 0.03137255, 0, 1, 1,
0.4682803, -1.054042, 1.232841, 0.03921569, 0, 1, 1,
0.4704373, 1.892848, 0.231554, 0.04313726, 0, 1, 1,
0.470725, 0.8321447, -0.2472817, 0.05098039, 0, 1, 1,
0.474612, -0.08498447, 1.383257, 0.05490196, 0, 1, 1,
0.4770722, 1.836261, 0.69897, 0.0627451, 0, 1, 1,
0.48402, -1.701209, 1.34072, 0.06666667, 0, 1, 1,
0.4845304, -0.8626383, 1.392053, 0.07450981, 0, 1, 1,
0.4887391, -0.5398325, 2.15404, 0.07843138, 0, 1, 1,
0.4900436, 0.6098011, 1.082123, 0.08627451, 0, 1, 1,
0.5015683, 0.2518206, 1.314056, 0.09019608, 0, 1, 1,
0.5020278, 1.086198, -1.247945, 0.09803922, 0, 1, 1,
0.5065361, 0.4507108, 0.7162562, 0.1058824, 0, 1, 1,
0.5070305, -1.756295, 4.646264, 0.1098039, 0, 1, 1,
0.5151005, 1.110851, 0.4178899, 0.1176471, 0, 1, 1,
0.5181909, -1.441723, 2.214556, 0.1215686, 0, 1, 1,
0.5192356, 0.1710016, 2.287618, 0.1294118, 0, 1, 1,
0.5192723, 0.02393376, 0.9561042, 0.1333333, 0, 1, 1,
0.5205998, -0.7941473, 3.214212, 0.1411765, 0, 1, 1,
0.5207437, 0.6496315, -0.09903852, 0.145098, 0, 1, 1,
0.5275078, -1.686373, 2.692607, 0.1529412, 0, 1, 1,
0.5283042, 0.0436248, 2.278089, 0.1568628, 0, 1, 1,
0.5290076, -0.9135378, 2.958833, 0.1647059, 0, 1, 1,
0.5315933, -0.1869149, 2.944473, 0.1686275, 0, 1, 1,
0.540866, 0.824623, -0.10097, 0.1764706, 0, 1, 1,
0.5421755, -0.217904, 0.5446756, 0.1803922, 0, 1, 1,
0.5425743, -1.302253, 1.77691, 0.1882353, 0, 1, 1,
0.5477746, -0.543484, 2.271374, 0.1921569, 0, 1, 1,
0.5495389, -0.7723399, 3.992677, 0.2, 0, 1, 1,
0.5586501, 1.11744, 0.4194889, 0.2078431, 0, 1, 1,
0.5588612, -0.5889504, 1.370342, 0.2117647, 0, 1, 1,
0.5598611, -2.030332, 2.312193, 0.2196078, 0, 1, 1,
0.5599357, -1.404183, 3.48282, 0.2235294, 0, 1, 1,
0.5656053, 0.3815381, 1.862739, 0.2313726, 0, 1, 1,
0.5676356, -0.5642287, 3.53354, 0.2352941, 0, 1, 1,
0.5719466, -0.4273863, 2.345969, 0.2431373, 0, 1, 1,
0.5852196, -0.5747677, 0.7469426, 0.2470588, 0, 1, 1,
0.585906, -0.2556758, 0.3870007, 0.254902, 0, 1, 1,
0.5873668, -0.1420578, 1.622444, 0.2588235, 0, 1, 1,
0.5925266, -0.4413809, 5.001994, 0.2666667, 0, 1, 1,
0.5945515, 0.08119158, 0.3703619, 0.2705882, 0, 1, 1,
0.5961229, 1.594841, 0.5631663, 0.2784314, 0, 1, 1,
0.5990306, -2.445952, 1.956928, 0.282353, 0, 1, 1,
0.6004018, -0.146225, 2.536947, 0.2901961, 0, 1, 1,
0.6012697, 0.1675681, 1.043066, 0.2941177, 0, 1, 1,
0.6094779, 0.4798873, 0.06004098, 0.3019608, 0, 1, 1,
0.6109368, -0.583335, 3.09978, 0.3098039, 0, 1, 1,
0.6146771, -0.08409394, 1.026547, 0.3137255, 0, 1, 1,
0.6194506, -1.130347, 3.049151, 0.3215686, 0, 1, 1,
0.6195719, -0.7830544, 2.42315, 0.3254902, 0, 1, 1,
0.6232219, -0.7108568, 2.715027, 0.3333333, 0, 1, 1,
0.6241165, 0.649391, 2.164244, 0.3372549, 0, 1, 1,
0.6304286, -0.4183404, 4.735136, 0.345098, 0, 1, 1,
0.6374691, 0.07548158, -0.138322, 0.3490196, 0, 1, 1,
0.6382142, -0.5524889, 2.515881, 0.3568628, 0, 1, 1,
0.6388345, 0.3758204, 1.010412, 0.3607843, 0, 1, 1,
0.6465487, -1.006478, 2.276832, 0.3686275, 0, 1, 1,
0.6469029, -1.284732, 0.8583665, 0.372549, 0, 1, 1,
0.647769, 1.894307, -0.6133627, 0.3803922, 0, 1, 1,
0.6611538, 1.455362, 1.93193, 0.3843137, 0, 1, 1,
0.6625037, 1.469124, 1.510235, 0.3921569, 0, 1, 1,
0.6662301, -0.3478802, 1.462931, 0.3960784, 0, 1, 1,
0.6678869, 0.6200796, 0.03006535, 0.4039216, 0, 1, 1,
0.669448, 0.8643791, 0.4524929, 0.4117647, 0, 1, 1,
0.6706035, -0.9154624, 0.7693266, 0.4156863, 0, 1, 1,
0.6748966, -1.250809, 4.216393, 0.4235294, 0, 1, 1,
0.6750412, -0.3710098, 2.801153, 0.427451, 0, 1, 1,
0.676324, 0.1133198, 1.36473, 0.4352941, 0, 1, 1,
0.678832, 0.7726048, 0.4583417, 0.4392157, 0, 1, 1,
0.6792952, -0.1569636, 2.760051, 0.4470588, 0, 1, 1,
0.6812426, -0.835442, 1.591675, 0.4509804, 0, 1, 1,
0.6813201, -0.05861427, 2.347885, 0.4588235, 0, 1, 1,
0.6818433, -0.96704, 3.250702, 0.4627451, 0, 1, 1,
0.6829696, -0.06416411, -0.3451948, 0.4705882, 0, 1, 1,
0.6839251, 0.2292127, 1.905894, 0.4745098, 0, 1, 1,
0.6918264, -0.4064327, 2.663042, 0.4823529, 0, 1, 1,
0.695601, -0.316888, 3.029294, 0.4862745, 0, 1, 1,
0.6956077, 0.8805759, -0.105242, 0.4941176, 0, 1, 1,
0.6971066, 0.01293939, 2.385385, 0.5019608, 0, 1, 1,
0.7057331, 1.025065, 2.295275, 0.5058824, 0, 1, 1,
0.7073908, 0.2932948, -0.6117857, 0.5137255, 0, 1, 1,
0.7075372, 0.6887279, 1.498336, 0.5176471, 0, 1, 1,
0.7084268, -0.225472, 0.6513878, 0.5254902, 0, 1, 1,
0.7197143, -0.3640162, 1.428327, 0.5294118, 0, 1, 1,
0.7240779, -1.121624, 2.992849, 0.5372549, 0, 1, 1,
0.7270414, 1.555091, 1.193485, 0.5411765, 0, 1, 1,
0.729811, -1.245901, 3.031666, 0.5490196, 0, 1, 1,
0.731559, 1.071324, 0.8323041, 0.5529412, 0, 1, 1,
0.736349, -1.287379, 3.860426, 0.5607843, 0, 1, 1,
0.7404543, -1.250337, 1.160419, 0.5647059, 0, 1, 1,
0.7413207, 1.387867, -0.7831842, 0.572549, 0, 1, 1,
0.7419413, 2.267538, 1.125336, 0.5764706, 0, 1, 1,
0.7430828, 1.109303, -0.1746418, 0.5843138, 0, 1, 1,
0.7449005, 1.012406, 0.2626317, 0.5882353, 0, 1, 1,
0.7545944, -0.1023575, 2.79097, 0.5960785, 0, 1, 1,
0.7710436, 2.172607, 0.4216876, 0.6039216, 0, 1, 1,
0.7720752, -0.7154609, 0.2133709, 0.6078432, 0, 1, 1,
0.7751438, 0.8926647, -1.616992, 0.6156863, 0, 1, 1,
0.7814519, -0.4475354, 2.871885, 0.6196079, 0, 1, 1,
0.7818574, -1.571709, 1.870648, 0.627451, 0, 1, 1,
0.7827222, -0.3687652, 3.852374, 0.6313726, 0, 1, 1,
0.784757, -0.2533541, 1.837387, 0.6392157, 0, 1, 1,
0.7902027, 0.6673781, 0.9070879, 0.6431373, 0, 1, 1,
0.7913328, -0.5867347, 2.396005, 0.6509804, 0, 1, 1,
0.7951674, 0.6537801, 1.636391, 0.654902, 0, 1, 1,
0.7966402, 0.8849322, 1.833063, 0.6627451, 0, 1, 1,
0.7973084, 0.9048542, 0.9346287, 0.6666667, 0, 1, 1,
0.7988326, -0.7493338, 2.393107, 0.6745098, 0, 1, 1,
0.80244, 0.06791347, 1.043926, 0.6784314, 0, 1, 1,
0.8053656, 0.636629, 0.8615351, 0.6862745, 0, 1, 1,
0.8058194, 1.954285, 1.41241, 0.6901961, 0, 1, 1,
0.8059531, 1.634268, 0.3756072, 0.6980392, 0, 1, 1,
0.807699, 0.703119, 1.533724, 0.7058824, 0, 1, 1,
0.8103521, 0.9081381, 1.858131, 0.7098039, 0, 1, 1,
0.8124015, 0.5099781, -0.09184451, 0.7176471, 0, 1, 1,
0.8157663, 0.3342311, 1.411132, 0.7215686, 0, 1, 1,
0.8185604, 0.959161, 0.2609757, 0.7294118, 0, 1, 1,
0.8225185, 0.159602, 3.510596, 0.7333333, 0, 1, 1,
0.8257993, -0.6928533, 1.144462, 0.7411765, 0, 1, 1,
0.8329344, 0.9805893, -0.2513509, 0.7450981, 0, 1, 1,
0.8416145, -1.664189, 1.977516, 0.7529412, 0, 1, 1,
0.8448709, 0.6338236, 0.3030888, 0.7568628, 0, 1, 1,
0.8473496, -0.4251332, 2.485844, 0.7647059, 0, 1, 1,
0.852124, -2.034225, 3.331488, 0.7686275, 0, 1, 1,
0.8554986, -0.479592, 1.818554, 0.7764706, 0, 1, 1,
0.8595176, 3.172285, -0.6421683, 0.7803922, 0, 1, 1,
0.8641006, 1.009966, 0.7149062, 0.7882353, 0, 1, 1,
0.8650535, -1.233871, 1.243851, 0.7921569, 0, 1, 1,
0.8696009, -1.478083, 0.07080775, 0.8, 0, 1, 1,
0.8727071, 0.3971295, 0.833223, 0.8078431, 0, 1, 1,
0.8728803, -0.3138127, 0.9906973, 0.8117647, 0, 1, 1,
0.8794975, -0.1980503, 2.977759, 0.8196079, 0, 1, 1,
0.880649, 1.239714, 0.1928429, 0.8235294, 0, 1, 1,
0.8849899, 0.2857435, 1.002399, 0.8313726, 0, 1, 1,
0.8880484, -0.3800361, 0.7114035, 0.8352941, 0, 1, 1,
0.8912277, -1.444539, 3.619085, 0.8431373, 0, 1, 1,
0.8913692, 0.3392757, 1.144779, 0.8470588, 0, 1, 1,
0.8933352, -0.1193024, 2.865125, 0.854902, 0, 1, 1,
0.8988469, -0.4444827, 2.379382, 0.8588235, 0, 1, 1,
0.9021009, -0.0002911302, 1.686991, 0.8666667, 0, 1, 1,
0.9024042, 0.5715416, -0.5164017, 0.8705882, 0, 1, 1,
0.9033509, 0.7611913, 2.529597, 0.8784314, 0, 1, 1,
0.9060267, 1.051744, 0.7781924, 0.8823529, 0, 1, 1,
0.9147975, -2.07515, 3.949369, 0.8901961, 0, 1, 1,
0.9164632, 0.2004542, 1.389227, 0.8941177, 0, 1, 1,
0.9186066, -0.1586934, 2.769201, 0.9019608, 0, 1, 1,
0.9212916, -0.06981017, 0.9937721, 0.9098039, 0, 1, 1,
0.936497, 0.6348366, 0.2279714, 0.9137255, 0, 1, 1,
0.9406177, -1.092402, 2.021678, 0.9215686, 0, 1, 1,
0.945945, 0.5583155, 1.083525, 0.9254902, 0, 1, 1,
0.9568967, -0.3411949, 2.535827, 0.9333333, 0, 1, 1,
0.969645, -1.101465, 1.912359, 0.9372549, 0, 1, 1,
0.9760574, -0.8266184, 0.6154384, 0.945098, 0, 1, 1,
0.9826899, -0.6015819, 3.57929, 0.9490196, 0, 1, 1,
0.9899487, 0.04850044, -1.309168, 0.9568627, 0, 1, 1,
0.9899843, 1.93115, 0.3443014, 0.9607843, 0, 1, 1,
0.9919102, -0.3529946, 0.008920924, 0.9686275, 0, 1, 1,
0.9924908, -0.2561498, 0.4009611, 0.972549, 0, 1, 1,
0.994673, 0.5287176, 0.4021019, 0.9803922, 0, 1, 1,
0.9948648, -0.5185211, 2.587702, 0.9843137, 0, 1, 1,
1.001179, 0.1543143, 1.358822, 0.9921569, 0, 1, 1,
1.009879, -2.178838, 4.275492, 0.9960784, 0, 1, 1,
1.012188, -0.3121098, 2.581725, 1, 0, 0.9960784, 1,
1.016964, 0.5095399, 0.5371568, 1, 0, 0.9882353, 1,
1.017906, -0.823773, 1.207888, 1, 0, 0.9843137, 1,
1.020364, -0.3521003, 1.22345, 1, 0, 0.9764706, 1,
1.023706, 1.712213, 1.257807, 1, 0, 0.972549, 1,
1.027465, -0.4218445, 4.36737, 1, 0, 0.9647059, 1,
1.028982, 0.7842977, 1.519783, 1, 0, 0.9607843, 1,
1.03233, 0.1991031, 0.695681, 1, 0, 0.9529412, 1,
1.034001, 0.1371683, 1.749789, 1, 0, 0.9490196, 1,
1.036947, -1.234194, 2.238469, 1, 0, 0.9411765, 1,
1.037916, -0.4709107, 0.822762, 1, 0, 0.9372549, 1,
1.038656, 0.3814681, 3.235476, 1, 0, 0.9294118, 1,
1.053753, 1.522488, 1.289137, 1, 0, 0.9254902, 1,
1.057068, 0.5807881, -0.835285, 1, 0, 0.9176471, 1,
1.058175, 1.050077, 1.888462, 1, 0, 0.9137255, 1,
1.059496, 3.152802, 0.9012966, 1, 0, 0.9058824, 1,
1.059566, 1.483732, 1.08804, 1, 0, 0.9019608, 1,
1.06583, 0.6287135, -0.7879999, 1, 0, 0.8941177, 1,
1.071237, 0.4496484, 1.984287, 1, 0, 0.8862745, 1,
1.071832, -0.3161213, 3.249966, 1, 0, 0.8823529, 1,
1.080245, 0.8918769, 1.809053, 1, 0, 0.8745098, 1,
1.090481, 1.024854, 2.305368, 1, 0, 0.8705882, 1,
1.092528, 0.2776056, 1.206804, 1, 0, 0.8627451, 1,
1.094394, -1.046439, 2.837454, 1, 0, 0.8588235, 1,
1.096062, 1.754645, -0.218759, 1, 0, 0.8509804, 1,
1.099825, 1.739833, 0.5359643, 1, 0, 0.8470588, 1,
1.100357, -2.081963, 1.714404, 1, 0, 0.8392157, 1,
1.101215, 0.9051861, 0.3251376, 1, 0, 0.8352941, 1,
1.114173, -0.1252634, 0.6902575, 1, 0, 0.827451, 1,
1.116846, -0.4842338, -0.01910083, 1, 0, 0.8235294, 1,
1.117477, 1.106952, -0.4005857, 1, 0, 0.8156863, 1,
1.119793, -0.0936676, 1.41319, 1, 0, 0.8117647, 1,
1.121642, 0.04758427, 2.302234, 1, 0, 0.8039216, 1,
1.124025, 0.5178325, 1.885053, 1, 0, 0.7960784, 1,
1.124894, 0.5860956, 0.1900299, 1, 0, 0.7921569, 1,
1.125432, -0.4248638, 1.352405, 1, 0, 0.7843137, 1,
1.127152, -1.404998, 1.900368, 1, 0, 0.7803922, 1,
1.127604, 0.7175397, -0.08312125, 1, 0, 0.772549, 1,
1.128271, 1.225418, 0.1091719, 1, 0, 0.7686275, 1,
1.129369, -0.3472605, 0.9123834, 1, 0, 0.7607843, 1,
1.131171, -1.9349, 3.450624, 1, 0, 0.7568628, 1,
1.134258, 1.394198, 1.634166, 1, 0, 0.7490196, 1,
1.136935, -0.3536926, 1.469973, 1, 0, 0.7450981, 1,
1.141023, 0.3805488, 2.230456, 1, 0, 0.7372549, 1,
1.145623, -2.647985, 2.541102, 1, 0, 0.7333333, 1,
1.152857, 0.6253124, 2.47534, 1, 0, 0.7254902, 1,
1.153271, -1.194703, 0.7965122, 1, 0, 0.7215686, 1,
1.155569, 0.6161571, 1.055227, 1, 0, 0.7137255, 1,
1.161033, -0.7909616, 2.649563, 1, 0, 0.7098039, 1,
1.16155, 0.6071272, 1.056975, 1, 0, 0.7019608, 1,
1.170142, 1.516195, 0.8216676, 1, 0, 0.6941177, 1,
1.173666, -1.23501, 2.906914, 1, 0, 0.6901961, 1,
1.17517, 0.8966777, 0.8081258, 1, 0, 0.682353, 1,
1.179906, 0.6973172, 0.8410884, 1, 0, 0.6784314, 1,
1.19351, 1.610101, -0.2992769, 1, 0, 0.6705883, 1,
1.195264, 0.8105885, 0.7841193, 1, 0, 0.6666667, 1,
1.195819, 1.629009, 1.541551, 1, 0, 0.6588235, 1,
1.196634, -0.6548365, 1.628032, 1, 0, 0.654902, 1,
1.203283, 0.4992651, 1.610872, 1, 0, 0.6470588, 1,
1.205467, 1.143649, 0.9173561, 1, 0, 0.6431373, 1,
1.243584, 2.932275, -1.120366, 1, 0, 0.6352941, 1,
1.24716, 0.08924308, 1.01661, 1, 0, 0.6313726, 1,
1.254844, 2.216755, -1.192288, 1, 0, 0.6235294, 1,
1.266493, -2.153351, 3.082819, 1, 0, 0.6196079, 1,
1.27852, -0.6788028, 3.050243, 1, 0, 0.6117647, 1,
1.281334, -1.100847, 2.7639, 1, 0, 0.6078432, 1,
1.285292, -1.129353, 2.682637, 1, 0, 0.6, 1,
1.286319, -0.2033247, -0.1551251, 1, 0, 0.5921569, 1,
1.288661, -0.265712, 0.8411241, 1, 0, 0.5882353, 1,
1.289072, 0.2987814, 1.62869, 1, 0, 0.5803922, 1,
1.291335, 0.3690936, 1.521317, 1, 0, 0.5764706, 1,
1.299554, 2.011251, 1.686318, 1, 0, 0.5686275, 1,
1.299654, 0.148555, 2.115101, 1, 0, 0.5647059, 1,
1.30279, 0.01171941, 0.5156438, 1, 0, 0.5568628, 1,
1.304845, 0.3518848, 2.392308, 1, 0, 0.5529412, 1,
1.31034, 1.042071, 0.7935376, 1, 0, 0.5450981, 1,
1.322077, -0.3193631, 0.7584429, 1, 0, 0.5411765, 1,
1.323035, 2.68267, 0.4738136, 1, 0, 0.5333334, 1,
1.323343, 0.09747852, 1.747491, 1, 0, 0.5294118, 1,
1.329216, 0.2322669, 1.874498, 1, 0, 0.5215687, 1,
1.344107, -0.2019155, 2.860854, 1, 0, 0.5176471, 1,
1.347784, 1.124467, 0.1458355, 1, 0, 0.509804, 1,
1.35452, -2.093671, 2.717, 1, 0, 0.5058824, 1,
1.374611, -1.114257, 2.280221, 1, 0, 0.4980392, 1,
1.375421, 0.1109374, 1.956883, 1, 0, 0.4901961, 1,
1.37825, -0.2441401, 1.251392, 1, 0, 0.4862745, 1,
1.386707, 0.951884, 0.8144387, 1, 0, 0.4784314, 1,
1.407653, 0.9444204, 2.088889, 1, 0, 0.4745098, 1,
1.41309, 0.7177621, 1.258787, 1, 0, 0.4666667, 1,
1.416157, 1.745551, 0.7488182, 1, 0, 0.4627451, 1,
1.420865, 1.025292, -0.9122283, 1, 0, 0.454902, 1,
1.423002, 0.3867598, 0.3948438, 1, 0, 0.4509804, 1,
1.424116, 0.3371721, 1.711352, 1, 0, 0.4431373, 1,
1.424342, 0.2974108, 1.828985, 1, 0, 0.4392157, 1,
1.432769, -0.6535808, 0.5006829, 1, 0, 0.4313726, 1,
1.43319, -2.083704, 1.411392, 1, 0, 0.427451, 1,
1.439097, 0.7762761, 3.244994, 1, 0, 0.4196078, 1,
1.43966, -0.2193047, 2.024452, 1, 0, 0.4156863, 1,
1.446241, 1.249076, 2.198348, 1, 0, 0.4078431, 1,
1.449955, 2.616205, 2.325655, 1, 0, 0.4039216, 1,
1.465127, -1.083269, 1.45551, 1, 0, 0.3960784, 1,
1.476193, -0.1747039, 0.4588689, 1, 0, 0.3882353, 1,
1.494558, -1.43253, 1.634735, 1, 0, 0.3843137, 1,
1.497227, -1.221311, 3.254124, 1, 0, 0.3764706, 1,
1.503726, 0.5810846, -1.23277, 1, 0, 0.372549, 1,
1.515261, 0.4779096, 2.279914, 1, 0, 0.3647059, 1,
1.52888, 0.7471403, 2.538558, 1, 0, 0.3607843, 1,
1.533417, 1.077696, 0.4943524, 1, 0, 0.3529412, 1,
1.550139, 1.295655, 1.47368, 1, 0, 0.3490196, 1,
1.550617, -1.223905, 1.894436, 1, 0, 0.3411765, 1,
1.554236, -0.2683097, 3.601061, 1, 0, 0.3372549, 1,
1.577047, -1.2788, 1.189344, 1, 0, 0.3294118, 1,
1.577186, -1.921273, 0.5929669, 1, 0, 0.3254902, 1,
1.584605, 1.742765, 0.8291184, 1, 0, 0.3176471, 1,
1.593182, -0.6150326, 1.064216, 1, 0, 0.3137255, 1,
1.594802, -0.5099444, 2.306286, 1, 0, 0.3058824, 1,
1.603896, 0.3298833, 0.7248145, 1, 0, 0.2980392, 1,
1.60623, 1.110572, 0.2394328, 1, 0, 0.2941177, 1,
1.613872, 0.4222453, 1.802063, 1, 0, 0.2862745, 1,
1.61861, -0.6766658, 0.8634787, 1, 0, 0.282353, 1,
1.623454, 0.007637626, -0.3575453, 1, 0, 0.2745098, 1,
1.625121, 0.1594399, 0.5875589, 1, 0, 0.2705882, 1,
1.637638, 0.5130874, 0.3356825, 1, 0, 0.2627451, 1,
1.642159, -0.6823811, 2.838272, 1, 0, 0.2588235, 1,
1.647414, 1.482764, 1.25486, 1, 0, 0.2509804, 1,
1.659104, -0.355112, 2.069084, 1, 0, 0.2470588, 1,
1.6806, 0.7989031, 2.010709, 1, 0, 0.2392157, 1,
1.69172, 0.5389602, 0.635498, 1, 0, 0.2352941, 1,
1.692952, -0.635074, 0.9906968, 1, 0, 0.227451, 1,
1.699314, 1.261482, -0.01884883, 1, 0, 0.2235294, 1,
1.701996, 0.8091604, 1.131994, 1, 0, 0.2156863, 1,
1.733858, -0.3353969, 2.027015, 1, 0, 0.2117647, 1,
1.783214, -0.1809005, 0.4464717, 1, 0, 0.2039216, 1,
1.783788, 0.170347, 2.564274, 1, 0, 0.1960784, 1,
1.796986, 0.2455945, 0.4212874, 1, 0, 0.1921569, 1,
1.810181, 1.180691, 1.125509, 1, 0, 0.1843137, 1,
1.842633, 0.4430045, 1.316949, 1, 0, 0.1803922, 1,
1.855799, 0.4954544, 3.021853, 1, 0, 0.172549, 1,
1.858784, 0.7673801, 1.585729, 1, 0, 0.1686275, 1,
1.88042, 1.054916, 2.531973, 1, 0, 0.1607843, 1,
1.897265, -0.1742247, 2.193056, 1, 0, 0.1568628, 1,
1.967043, 0.8233459, 1.550995, 1, 0, 0.1490196, 1,
1.986137, -1.372787, 2.567219, 1, 0, 0.145098, 1,
1.993691, -0.7787953, 2.411613, 1, 0, 0.1372549, 1,
1.997283, -0.8464376, 0.4987105, 1, 0, 0.1333333, 1,
1.999199, 0.9468581, 1.60148, 1, 0, 0.1254902, 1,
2.080771, -0.8961176, 1.850583, 1, 0, 0.1215686, 1,
2.081656, 1.2584, 0.4869646, 1, 0, 0.1137255, 1,
2.108846, 0.1472204, 1.595721, 1, 0, 0.1098039, 1,
2.166577, -0.2475468, 2.210944, 1, 0, 0.1019608, 1,
2.22528, 0.1111786, 0.8849038, 1, 0, 0.09411765, 1,
2.238357, 1.153678, 0.5669032, 1, 0, 0.09019608, 1,
2.286897, -1.937922, 2.241472, 1, 0, 0.08235294, 1,
2.347337, -0.4689341, 1.992232, 1, 0, 0.07843138, 1,
2.347606, -0.1056131, 1.520206, 1, 0, 0.07058824, 1,
2.351459, 0.8528565, 1.591382, 1, 0, 0.06666667, 1,
2.407854, 0.03350041, 1.842288, 1, 0, 0.05882353, 1,
2.463982, 0.003675061, 2.590887, 1, 0, 0.05490196, 1,
2.505143, -0.489473, 0.02828601, 1, 0, 0.04705882, 1,
2.50956, -1.608466, 2.204698, 1, 0, 0.04313726, 1,
2.528856, -0.109047, 1.973328, 1, 0, 0.03529412, 1,
2.603492, -0.4591126, 0.475043, 1, 0, 0.03137255, 1,
2.711627, 2.02206, 0.6974379, 1, 0, 0.02352941, 1,
2.83494, -1.324084, 2.822704, 1, 0, 0.01960784, 1,
2.841751, 0.5661796, 2.318017, 1, 0, 0.01176471, 1,
3.233369, -0.04441326, 0.8453099, 1, 0, 0.007843138, 1
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
0.1260165, -3.806763, -6.732759, 0, -0.5, 0.5, 0.5,
0.1260165, -3.806763, -6.732759, 1, -0.5, 0.5, 0.5,
0.1260165, -3.806763, -6.732759, 1, 1.5, 0.5, 0.5,
0.1260165, -3.806763, -6.732759, 0, 1.5, 0.5, 0.5
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
-4.034728, 0.188511, -6.732759, 0, -0.5, 0.5, 0.5,
-4.034728, 0.188511, -6.732759, 1, -0.5, 0.5, 0.5,
-4.034728, 0.188511, -6.732759, 1, 1.5, 0.5, 0.5,
-4.034728, 0.188511, -6.732759, 0, 1.5, 0.5, 0.5
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
-4.034728, -3.806763, 0.4321506, 0, -0.5, 0.5, 0.5,
-4.034728, -3.806763, 0.4321506, 1, -0.5, 0.5, 0.5,
-4.034728, -3.806763, 0.4321506, 1, 1.5, 0.5, 0.5,
-4.034728, -3.806763, 0.4321506, 0, 1.5, 0.5, 0.5
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
-2, -2.884777, -5.079319,
3, -2.884777, -5.079319,
-2, -2.884777, -5.079319,
-2, -3.038441, -5.354892,
-1, -2.884777, -5.079319,
-1, -3.038441, -5.354892,
0, -2.884777, -5.079319,
0, -3.038441, -5.354892,
1, -2.884777, -5.079319,
1, -3.038441, -5.354892,
2, -2.884777, -5.079319,
2, -3.038441, -5.354892,
3, -2.884777, -5.079319,
3, -3.038441, -5.354892
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
-2, -3.34577, -5.906039, 0, -0.5, 0.5, 0.5,
-2, -3.34577, -5.906039, 1, -0.5, 0.5, 0.5,
-2, -3.34577, -5.906039, 1, 1.5, 0.5, 0.5,
-2, -3.34577, -5.906039, 0, 1.5, 0.5, 0.5,
-1, -3.34577, -5.906039, 0, -0.5, 0.5, 0.5,
-1, -3.34577, -5.906039, 1, -0.5, 0.5, 0.5,
-1, -3.34577, -5.906039, 1, 1.5, 0.5, 0.5,
-1, -3.34577, -5.906039, 0, 1.5, 0.5, 0.5,
0, -3.34577, -5.906039, 0, -0.5, 0.5, 0.5,
0, -3.34577, -5.906039, 1, -0.5, 0.5, 0.5,
0, -3.34577, -5.906039, 1, 1.5, 0.5, 0.5,
0, -3.34577, -5.906039, 0, 1.5, 0.5, 0.5,
1, -3.34577, -5.906039, 0, -0.5, 0.5, 0.5,
1, -3.34577, -5.906039, 1, -0.5, 0.5, 0.5,
1, -3.34577, -5.906039, 1, 1.5, 0.5, 0.5,
1, -3.34577, -5.906039, 0, 1.5, 0.5, 0.5,
2, -3.34577, -5.906039, 0, -0.5, 0.5, 0.5,
2, -3.34577, -5.906039, 1, -0.5, 0.5, 0.5,
2, -3.34577, -5.906039, 1, 1.5, 0.5, 0.5,
2, -3.34577, -5.906039, 0, 1.5, 0.5, 0.5,
3, -3.34577, -5.906039, 0, -0.5, 0.5, 0.5,
3, -3.34577, -5.906039, 1, -0.5, 0.5, 0.5,
3, -3.34577, -5.906039, 1, 1.5, 0.5, 0.5,
3, -3.34577, -5.906039, 0, 1.5, 0.5, 0.5
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
-3.074556, -2, -5.079319,
-3.074556, 3, -5.079319,
-3.074556, -2, -5.079319,
-3.234585, -2, -5.354892,
-3.074556, -1, -5.079319,
-3.234585, -1, -5.354892,
-3.074556, 0, -5.079319,
-3.234585, 0, -5.354892,
-3.074556, 1, -5.079319,
-3.234585, 1, -5.354892,
-3.074556, 2, -5.079319,
-3.234585, 2, -5.354892,
-3.074556, 3, -5.079319,
-3.234585, 3, -5.354892
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
-3.554642, -2, -5.906039, 0, -0.5, 0.5, 0.5,
-3.554642, -2, -5.906039, 1, -0.5, 0.5, 0.5,
-3.554642, -2, -5.906039, 1, 1.5, 0.5, 0.5,
-3.554642, -2, -5.906039, 0, 1.5, 0.5, 0.5,
-3.554642, -1, -5.906039, 0, -0.5, 0.5, 0.5,
-3.554642, -1, -5.906039, 1, -0.5, 0.5, 0.5,
-3.554642, -1, -5.906039, 1, 1.5, 0.5, 0.5,
-3.554642, -1, -5.906039, 0, 1.5, 0.5, 0.5,
-3.554642, 0, -5.906039, 0, -0.5, 0.5, 0.5,
-3.554642, 0, -5.906039, 1, -0.5, 0.5, 0.5,
-3.554642, 0, -5.906039, 1, 1.5, 0.5, 0.5,
-3.554642, 0, -5.906039, 0, 1.5, 0.5, 0.5,
-3.554642, 1, -5.906039, 0, -0.5, 0.5, 0.5,
-3.554642, 1, -5.906039, 1, -0.5, 0.5, 0.5,
-3.554642, 1, -5.906039, 1, 1.5, 0.5, 0.5,
-3.554642, 1, -5.906039, 0, 1.5, 0.5, 0.5,
-3.554642, 2, -5.906039, 0, -0.5, 0.5, 0.5,
-3.554642, 2, -5.906039, 1, -0.5, 0.5, 0.5,
-3.554642, 2, -5.906039, 1, 1.5, 0.5, 0.5,
-3.554642, 2, -5.906039, 0, 1.5, 0.5, 0.5,
-3.554642, 3, -5.906039, 0, -0.5, 0.5, 0.5,
-3.554642, 3, -5.906039, 1, -0.5, 0.5, 0.5,
-3.554642, 3, -5.906039, 1, 1.5, 0.5, 0.5,
-3.554642, 3, -5.906039, 0, 1.5, 0.5, 0.5
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
-3.074556, -2.884777, -4,
-3.074556, -2.884777, 4,
-3.074556, -2.884777, -4,
-3.234585, -3.038441, -4,
-3.074556, -2.884777, -2,
-3.234585, -3.038441, -2,
-3.074556, -2.884777, 0,
-3.234585, -3.038441, 0,
-3.074556, -2.884777, 2,
-3.234585, -3.038441, 2,
-3.074556, -2.884777, 4,
-3.234585, -3.038441, 4
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
-3.554642, -3.34577, -4, 0, -0.5, 0.5, 0.5,
-3.554642, -3.34577, -4, 1, -0.5, 0.5, 0.5,
-3.554642, -3.34577, -4, 1, 1.5, 0.5, 0.5,
-3.554642, -3.34577, -4, 0, 1.5, 0.5, 0.5,
-3.554642, -3.34577, -2, 0, -0.5, 0.5, 0.5,
-3.554642, -3.34577, -2, 1, -0.5, 0.5, 0.5,
-3.554642, -3.34577, -2, 1, 1.5, 0.5, 0.5,
-3.554642, -3.34577, -2, 0, 1.5, 0.5, 0.5,
-3.554642, -3.34577, 0, 0, -0.5, 0.5, 0.5,
-3.554642, -3.34577, 0, 1, -0.5, 0.5, 0.5,
-3.554642, -3.34577, 0, 1, 1.5, 0.5, 0.5,
-3.554642, -3.34577, 0, 0, 1.5, 0.5, 0.5,
-3.554642, -3.34577, 2, 0, -0.5, 0.5, 0.5,
-3.554642, -3.34577, 2, 1, -0.5, 0.5, 0.5,
-3.554642, -3.34577, 2, 1, 1.5, 0.5, 0.5,
-3.554642, -3.34577, 2, 0, 1.5, 0.5, 0.5,
-3.554642, -3.34577, 4, 0, -0.5, 0.5, 0.5,
-3.554642, -3.34577, 4, 1, -0.5, 0.5, 0.5,
-3.554642, -3.34577, 4, 1, 1.5, 0.5, 0.5,
-3.554642, -3.34577, 4, 0, 1.5, 0.5, 0.5
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
-3.074556, -2.884777, -5.079319,
-3.074556, 3.261799, -5.079319,
-3.074556, -2.884777, 5.94362,
-3.074556, 3.261799, 5.94362,
-3.074556, -2.884777, -5.079319,
-3.074556, -2.884777, 5.94362,
-3.074556, 3.261799, -5.079319,
-3.074556, 3.261799, 5.94362,
-3.074556, -2.884777, -5.079319,
3.326589, -2.884777, -5.079319,
-3.074556, -2.884777, 5.94362,
3.326589, -2.884777, 5.94362,
-3.074556, 3.261799, -5.079319,
3.326589, 3.261799, -5.079319,
-3.074556, 3.261799, 5.94362,
3.326589, 3.261799, 5.94362,
3.326589, -2.884777, -5.079319,
3.326589, 3.261799, -5.079319,
3.326589, -2.884777, 5.94362,
3.326589, 3.261799, 5.94362,
3.326589, -2.884777, -5.079319,
3.326589, -2.884777, 5.94362,
3.326589, 3.261799, -5.079319,
3.326589, 3.261799, 5.94362
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
var radius = 7.556537;
var distance = 33.61988;
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
mvMatrix.translate( -0.1260165, -0.188511, -0.4321506 );
mvMatrix.scale( 1.276377, 1.32924, 0.7412067 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.61988);
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
sulfate<-read.table("sulfate.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-sulfate$V2
```

```
## Error in eval(expr, envir, enclos): object 'sulfate' not found
```

```r
y<-sulfate$V3
```

```
## Error in eval(expr, envir, enclos): object 'sulfate' not found
```

```r
z<-sulfate$V4
```

```
## Error in eval(expr, envir, enclos): object 'sulfate' not found
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
-2.981336, 0.2821507, 0.4894472, 0, 0, 1, 1, 1,
-2.939898, 0.8313173, -3.514376, 1, 0, 0, 1, 1,
-2.854234, 0.8914312, -2.723849, 1, 0, 0, 1, 1,
-2.77183, 0.02575981, -1.028818, 1, 0, 0, 1, 1,
-2.710247, 1.202063, -0.7333878, 1, 0, 0, 1, 1,
-2.651279, 0.185727, -2.20681, 1, 0, 0, 1, 1,
-2.597487, 2.805345, 0.5673183, 0, 0, 0, 1, 1,
-2.372917, 2.215469, -1.810231, 0, 0, 0, 1, 1,
-2.3263, 0.03908478, -0.04058942, 0, 0, 0, 1, 1,
-2.309387, 1.775905, 0.1201103, 0, 0, 0, 1, 1,
-2.237452, 1.130565, -2.046567, 0, 0, 0, 1, 1,
-2.188979, 1.385244, -2.941639, 0, 0, 0, 1, 1,
-2.17914, -0.4997439, -2.098791, 0, 0, 0, 1, 1,
-2.164784, 1.443371, -0.4875022, 1, 1, 1, 1, 1,
-2.163926, 2.718648, 0.01534428, 1, 1, 1, 1, 1,
-2.124177, -0.3227974, 0.2449702, 1, 1, 1, 1, 1,
-2.104834, -0.2487457, 0.3906676, 1, 1, 1, 1, 1,
-2.09324, 1.861368, 0.3554972, 1, 1, 1, 1, 1,
-2.07954, -0.7536076, -1.858901, 1, 1, 1, 1, 1,
-2.071041, 1.0423, -0.7305242, 1, 1, 1, 1, 1,
-2.061996, 0.2465641, -0.8365871, 1, 1, 1, 1, 1,
-2.031666, 0.7359689, -0.9732831, 1, 1, 1, 1, 1,
-2.015234, -0.09873243, -1.221597, 1, 1, 1, 1, 1,
-1.968969, 1.138288, -1.854266, 1, 1, 1, 1, 1,
-1.958627, 1.421073, -0.4785375, 1, 1, 1, 1, 1,
-1.954636, 0.4013541, -2.49486, 1, 1, 1, 1, 1,
-1.945201, 1.051212, -0.2444468, 1, 1, 1, 1, 1,
-1.932871, 1.461593, -2.332034, 1, 1, 1, 1, 1,
-1.927422, 1.142662, -1.597161, 0, 0, 1, 1, 1,
-1.923352, -0.2596581, -1.620853, 1, 0, 0, 1, 1,
-1.920006, -0.907688, -2.093529, 1, 0, 0, 1, 1,
-1.8917, 0.9951803, -2.834918, 1, 0, 0, 1, 1,
-1.889001, 0.3641481, -1.937239, 1, 0, 0, 1, 1,
-1.88523, 0.1533781, -1.733772, 1, 0, 0, 1, 1,
-1.878316, -0.2194735, -1.67985, 0, 0, 0, 1, 1,
-1.871335, 0.6123229, -0.6458051, 0, 0, 0, 1, 1,
-1.858746, -0.4088597, -1.297426, 0, 0, 0, 1, 1,
-1.850345, 2.39662, 0.7020279, 0, 0, 0, 1, 1,
-1.835968, -0.9138611, -1.72966, 0, 0, 0, 1, 1,
-1.825902, -0.3791333, -2.135568, 0, 0, 0, 1, 1,
-1.819648, 0.09891955, -3.446616, 0, 0, 0, 1, 1,
-1.799407, 1.44776, -1.078758, 1, 1, 1, 1, 1,
-1.791886, 0.3829553, -1.688439, 1, 1, 1, 1, 1,
-1.770776, -1.80486, -3.291271, 1, 1, 1, 1, 1,
-1.769482, 0.5763698, -3.012858, 1, 1, 1, 1, 1,
-1.765862, 0.5218434, -2.17831, 1, 1, 1, 1, 1,
-1.754814, -0.8124996, -2.794738, 1, 1, 1, 1, 1,
-1.748321, 1.048284, -3.206319, 1, 1, 1, 1, 1,
-1.731704, 1.703042, -0.3854973, 1, 1, 1, 1, 1,
-1.723158, 0.2747678, -1.613279, 1, 1, 1, 1, 1,
-1.710551, -0.03947116, -1.503514, 1, 1, 1, 1, 1,
-1.699229, 1.506505, -0.1326781, 1, 1, 1, 1, 1,
-1.695225, 1.803367, 0.2539535, 1, 1, 1, 1, 1,
-1.686268, 0.5345882, 0.7832921, 1, 1, 1, 1, 1,
-1.671306, 1.524666, -0.5205094, 1, 1, 1, 1, 1,
-1.662938, 1.223353, 0.5720058, 1, 1, 1, 1, 1,
-1.655523, 1.253504, 0.1139805, 0, 0, 1, 1, 1,
-1.633201, -0.1312806, -1.292499, 1, 0, 0, 1, 1,
-1.63014, 0.4206936, -0.9418101, 1, 0, 0, 1, 1,
-1.629635, 0.6509531, -0.02490119, 1, 0, 0, 1, 1,
-1.62192, 0.9125093, 0.1794828, 1, 0, 0, 1, 1,
-1.605407, 1.419342, -0.309116, 1, 0, 0, 1, 1,
-1.604632, -0.5434915, -1.011083, 0, 0, 0, 1, 1,
-1.604236, 2.386003, -0.8041738, 0, 0, 0, 1, 1,
-1.60048, -0.4081241, -4.127768, 0, 0, 0, 1, 1,
-1.597118, -0.7321777, -0.7603179, 0, 0, 0, 1, 1,
-1.596654, 1.983857, 0.4355532, 0, 0, 0, 1, 1,
-1.568569, -1.82736, -2.303761, 0, 0, 0, 1, 1,
-1.566141, 0.5987984, -0.8390914, 0, 0, 0, 1, 1,
-1.560896, 0.3840075, -1.338404, 1, 1, 1, 1, 1,
-1.544262, 0.3293957, -1.102141, 1, 1, 1, 1, 1,
-1.521737, -0.8900403, -3.577154, 1, 1, 1, 1, 1,
-1.50405, 0.002784666, -3.316505, 1, 1, 1, 1, 1,
-1.481996, -0.1168907, -1.850098, 1, 1, 1, 1, 1,
-1.474484, -0.8825018, -1.288548, 1, 1, 1, 1, 1,
-1.461555, 0.02605708, -2.291581, 1, 1, 1, 1, 1,
-1.459012, 0.7952184, 0.3450927, 1, 1, 1, 1, 1,
-1.456544, 1.618516, -1.145946, 1, 1, 1, 1, 1,
-1.455695, 0.7661162, 0.4005007, 1, 1, 1, 1, 1,
-1.452997, 0.0535094, -0.9441873, 1, 1, 1, 1, 1,
-1.430918, 1.985024, -2.845219, 1, 1, 1, 1, 1,
-1.414065, 0.8162466, -0.2771206, 1, 1, 1, 1, 1,
-1.410692, 0.5242804, -1.885804, 1, 1, 1, 1, 1,
-1.405739, 0.1752524, -1.915779, 1, 1, 1, 1, 1,
-1.405639, -0.2344476, -2.857953, 0, 0, 1, 1, 1,
-1.399897, 0.9662916, -2.143209, 1, 0, 0, 1, 1,
-1.399526, 0.68372, -1.533933, 1, 0, 0, 1, 1,
-1.358214, 1.18362, -0.6699901, 1, 0, 0, 1, 1,
-1.357969, -0.4675843, -2.807946, 1, 0, 0, 1, 1,
-1.306601, 0.3371748, -0.7872864, 1, 0, 0, 1, 1,
-1.286022, -0.4496173, 0.1851227, 0, 0, 0, 1, 1,
-1.282876, 1.00048, -0.4422497, 0, 0, 0, 1, 1,
-1.281905, 0.8552433, -1.314261, 0, 0, 0, 1, 1,
-1.273147, 0.6963757, -2.145107, 0, 0, 0, 1, 1,
-1.248055, 0.7368523, 0.264108, 0, 0, 0, 1, 1,
-1.246368, 0.250566, -2.419461, 0, 0, 0, 1, 1,
-1.236854, -0.7808867, -1.522451, 0, 0, 0, 1, 1,
-1.236666, -0.2224271, -3.361416, 1, 1, 1, 1, 1,
-1.223528, -0.03570512, -0.9650729, 1, 1, 1, 1, 1,
-1.219221, 0.751156, -3.239911, 1, 1, 1, 1, 1,
-1.217093, -0.1143925, -2.637457, 1, 1, 1, 1, 1,
-1.214663, 1.039356, -0.8025758, 1, 1, 1, 1, 1,
-1.213169, -2.198901, -2.686182, 1, 1, 1, 1, 1,
-1.20804, -0.9523745, -3.128453, 1, 1, 1, 1, 1,
-1.206831, 1.857203, -1.218495, 1, 1, 1, 1, 1,
-1.203295, -0.1243339, -2.470497, 1, 1, 1, 1, 1,
-1.201882, -0.2826016, -2.615576, 1, 1, 1, 1, 1,
-1.200703, -0.6314718, -1.970353, 1, 1, 1, 1, 1,
-1.19926, 0.01756138, -1.511313, 1, 1, 1, 1, 1,
-1.196239, -1.753742, -2.771341, 1, 1, 1, 1, 1,
-1.195495, -1.577764, -1.601677, 1, 1, 1, 1, 1,
-1.190871, -1.357227, -3.171497, 1, 1, 1, 1, 1,
-1.183813, 0.9657065, -0.8228772, 0, 0, 1, 1, 1,
-1.183088, 0.5159646, -3.414354, 1, 0, 0, 1, 1,
-1.17869, 0.5652388, -2.870649, 1, 0, 0, 1, 1,
-1.178082, 0.5860663, -0.4389822, 1, 0, 0, 1, 1,
-1.177419, -1.000287, -2.675455, 1, 0, 0, 1, 1,
-1.177219, 0.4576553, -2.478234, 1, 0, 0, 1, 1,
-1.167922, 0.9090338, -2.314843, 0, 0, 0, 1, 1,
-1.167493, 0.2527383, -1.981993, 0, 0, 0, 1, 1,
-1.164119, -1.557492, -4.367959, 0, 0, 0, 1, 1,
-1.161899, 0.3437865, 0.6672997, 0, 0, 0, 1, 1,
-1.159892, -1.481804, -3.26066, 0, 0, 0, 1, 1,
-1.159794, -1.124649, -4.331963, 0, 0, 0, 1, 1,
-1.146815, 0.2482309, -0.9201619, 0, 0, 0, 1, 1,
-1.145815, 1.312139, -2.319321, 1, 1, 1, 1, 1,
-1.14321, -0.1609693, -1.876137, 1, 1, 1, 1, 1,
-1.14181, -0.6386357, -1.981787, 1, 1, 1, 1, 1,
-1.135037, 0.8152661, -0.7677617, 1, 1, 1, 1, 1,
-1.129039, 1.628028, -0.2250157, 1, 1, 1, 1, 1,
-1.128456, 0.2595592, -2.717734, 1, 1, 1, 1, 1,
-1.123297, -0.1218736, -2.607812, 1, 1, 1, 1, 1,
-1.109083, 0.1620035, -2.142239, 1, 1, 1, 1, 1,
-1.108077, -0.8202178, -3.97614, 1, 1, 1, 1, 1,
-1.074129, 0.2931935, -0.8597738, 1, 1, 1, 1, 1,
-1.068924, 0.1304392, -3.079561, 1, 1, 1, 1, 1,
-1.067028, -0.5471448, -2.346609, 1, 1, 1, 1, 1,
-1.063192, 1.467165, 1.601807, 1, 1, 1, 1, 1,
-1.062927, -1.168244, -0.4513158, 1, 1, 1, 1, 1,
-1.061158, 0.6074547, -1.581242, 1, 1, 1, 1, 1,
-1.048329, 0.7424783, -1.465784, 0, 0, 1, 1, 1,
-1.046544, 1.629166, -1.078319, 1, 0, 0, 1, 1,
-1.045633, -1.05219, -0.6077261, 1, 0, 0, 1, 1,
-1.03275, 0.5730876, -1.223842, 1, 0, 0, 1, 1,
-1.03039, -0.8632773, -2.097026, 1, 0, 0, 1, 1,
-1.027372, -0.566431, -3.067851, 1, 0, 0, 1, 1,
-1.023947, -0.884262, -2.412915, 0, 0, 0, 1, 1,
-1.020679, -1.319309, -1.642759, 0, 0, 0, 1, 1,
-1.017583, 0.4048964, -2.315062, 0, 0, 0, 1, 1,
-1.010874, 0.4828872, -1.565923, 0, 0, 0, 1, 1,
-1.010821, 1.847408, -1.366297, 0, 0, 0, 1, 1,
-1.009145, -0.8640076, -2.15002, 0, 0, 0, 1, 1,
-1.000655, 1.23956, -1.564222, 0, 0, 0, 1, 1,
-0.999803, 0.1067816, 0.1562127, 1, 1, 1, 1, 1,
-0.9973024, -0.2453482, -1.4879, 1, 1, 1, 1, 1,
-0.993725, 0.8167485, 0.5237908, 1, 1, 1, 1, 1,
-0.9920484, 1.71748, -2.350224, 1, 1, 1, 1, 1,
-0.9879863, -0.9033716, -2.920955, 1, 1, 1, 1, 1,
-0.9875917, 0.4517764, -0.164438, 1, 1, 1, 1, 1,
-0.9874157, -0.446548, -2.418795, 1, 1, 1, 1, 1,
-0.9849789, -0.08997087, -1.065903, 1, 1, 1, 1, 1,
-0.9819179, -0.8867501, -1.156626, 1, 1, 1, 1, 1,
-0.9791799, 0.6974165, -1.575711, 1, 1, 1, 1, 1,
-0.9788722, 0.6936395, -1.103025, 1, 1, 1, 1, 1,
-0.9767837, 0.7534546, -1.96342, 1, 1, 1, 1, 1,
-0.9724913, -0.4402021, 0.556417, 1, 1, 1, 1, 1,
-0.9714718, 0.6455802, -1.099604, 1, 1, 1, 1, 1,
-0.9696855, -0.5315631, -3.79496, 1, 1, 1, 1, 1,
-0.9520959, 0.4705914, -1.193149, 0, 0, 1, 1, 1,
-0.9468293, 0.7817193, 0.2199907, 1, 0, 0, 1, 1,
-0.9401398, -0.03140506, -2.469455, 1, 0, 0, 1, 1,
-0.9396522, -0.6622396, 0.1351002, 1, 0, 0, 1, 1,
-0.9282903, -2.151025, -1.582823, 1, 0, 0, 1, 1,
-0.9220167, 0.9071312, -1.961456, 1, 0, 0, 1, 1,
-0.9170231, -1.522113, -2.543788, 0, 0, 0, 1, 1,
-0.9142969, 0.7640345, -0.4495887, 0, 0, 0, 1, 1,
-0.9122487, -0.9004593, -1.030277, 0, 0, 0, 1, 1,
-0.911854, 0.8945843, -2.629954, 0, 0, 0, 1, 1,
-0.9113988, -0.4294189, -3.797316, 0, 0, 0, 1, 1,
-0.9094667, -2.097193, -1.848071, 0, 0, 0, 1, 1,
-0.9079561, 0.161617, -1.561587, 0, 0, 0, 1, 1,
-0.9052905, -0.5712729, -0.9969974, 1, 1, 1, 1, 1,
-0.8993213, 2.375757, -0.1089696, 1, 1, 1, 1, 1,
-0.8936123, 0.1576627, -1.208737, 1, 1, 1, 1, 1,
-0.8781147, -0.6344677, -0.5894823, 1, 1, 1, 1, 1,
-0.871272, -0.08284555, -1.860788, 1, 1, 1, 1, 1,
-0.8693834, 1.580372, 0.4870349, 1, 1, 1, 1, 1,
-0.8644156, 0.8149922, 0.8311123, 1, 1, 1, 1, 1,
-0.8644033, 0.979651, -2.90958, 1, 1, 1, 1, 1,
-0.863592, 1.10079, -1.298133, 1, 1, 1, 1, 1,
-0.8584516, 0.07207961, -1.85412, 1, 1, 1, 1, 1,
-0.8504612, -2.090991, -0.372608, 1, 1, 1, 1, 1,
-0.8426364, 0.4823018, -0.2394401, 1, 1, 1, 1, 1,
-0.8356833, 0.9216484, -2.267462, 1, 1, 1, 1, 1,
-0.8344828, -0.5663673, -2.695306, 1, 1, 1, 1, 1,
-0.8317537, 0.6202718, -0.9564398, 1, 1, 1, 1, 1,
-0.8246896, 0.1083767, -1.288423, 0, 0, 1, 1, 1,
-0.8240112, 1.925106, -0.1767408, 1, 0, 0, 1, 1,
-0.8190376, -0.7599146, -1.968481, 1, 0, 0, 1, 1,
-0.8184995, 0.4998657, -1.258566, 1, 0, 0, 1, 1,
-0.8153362, 0.3803715, -0.2998625, 1, 0, 0, 1, 1,
-0.8141177, -1.175112, -2.413298, 1, 0, 0, 1, 1,
-0.814101, -0.7271008, -2.059493, 0, 0, 0, 1, 1,
-0.8134292, 2.285, 0.5927057, 0, 0, 0, 1, 1,
-0.8109959, 0.7383131, -0.8035446, 0, 0, 0, 1, 1,
-0.8107798, 0.7414759, -0.168473, 0, 0, 0, 1, 1,
-0.8107735, 1.225465, 0.3315652, 0, 0, 0, 1, 1,
-0.8059247, 0.02841006, -3.285784, 0, 0, 0, 1, 1,
-0.8004503, 0.7066786, -0.9772698, 0, 0, 0, 1, 1,
-0.7984779, 0.004871691, -2.884489, 1, 1, 1, 1, 1,
-0.7917271, -1.063852, -3.794673, 1, 1, 1, 1, 1,
-0.7897567, -0.4352762, -3.258653, 1, 1, 1, 1, 1,
-0.7826453, 1.555344, 1.080255, 1, 1, 1, 1, 1,
-0.7815113, 0.4339446, 0.1453699, 1, 1, 1, 1, 1,
-0.7800491, -0.3803268, -2.769299, 1, 1, 1, 1, 1,
-0.7779813, -0.908196, -3.268817, 1, 1, 1, 1, 1,
-0.7776092, -1.281919, -2.325456, 1, 1, 1, 1, 1,
-0.774695, -0.9986245, -2.55073, 1, 1, 1, 1, 1,
-0.7728404, -2.011251, -3.070684, 1, 1, 1, 1, 1,
-0.7690422, -0.4199959, -0.4242249, 1, 1, 1, 1, 1,
-0.7655257, 0.1868641, -0.8365477, 1, 1, 1, 1, 1,
-0.764681, 1.28284, -2.088151, 1, 1, 1, 1, 1,
-0.764164, -0.1930297, 0.3835565, 1, 1, 1, 1, 1,
-0.7625341, -1.971226, -2.954278, 1, 1, 1, 1, 1,
-0.7568059, 0.0003417547, -2.247107, 0, 0, 1, 1, 1,
-0.755339, 1.272351, -0.08615576, 1, 0, 0, 1, 1,
-0.7549694, 0.5388668, 0.7629617, 1, 0, 0, 1, 1,
-0.7546396, 1.380066, -1.636488, 1, 0, 0, 1, 1,
-0.75449, -0.6666119, -1.69278, 1, 0, 0, 1, 1,
-0.7540939, -2.41599, -2.248661, 1, 0, 0, 1, 1,
-0.7539743, 0.1854243, -1.624856, 0, 0, 0, 1, 1,
-0.746502, 1.479917, -1.29649, 0, 0, 0, 1, 1,
-0.7450181, 0.7945534, -0.7482508, 0, 0, 0, 1, 1,
-0.7421073, 0.01171087, -1.138192, 0, 0, 0, 1, 1,
-0.7420692, -1.312268, -3.533682, 0, 0, 0, 1, 1,
-0.7396749, -0.6756561, -1.300815, 0, 0, 0, 1, 1,
-0.739468, -0.7976872, -1.374593, 0, 0, 0, 1, 1,
-0.720773, -0.01467985, -2.175659, 1, 1, 1, 1, 1,
-0.7168627, -0.7436768, -2.586201, 1, 1, 1, 1, 1,
-0.7090499, 0.8255247, -2.449882, 1, 1, 1, 1, 1,
-0.7087491, 1.471851, 0.2694431, 1, 1, 1, 1, 1,
-0.7084478, -1.335165, -3.303422, 1, 1, 1, 1, 1,
-0.7069253, -0.07593731, -0.6195999, 1, 1, 1, 1, 1,
-0.7014804, 0.07924991, -2.26607, 1, 1, 1, 1, 1,
-0.6993432, -1.252542, -4.059666, 1, 1, 1, 1, 1,
-0.6986775, 0.4874488, -0.5690481, 1, 1, 1, 1, 1,
-0.694714, 0.1255244, -2.777591, 1, 1, 1, 1, 1,
-0.6915095, 0.6899284, 0.2038406, 1, 1, 1, 1, 1,
-0.6846564, -0.8154991, -1.142925, 1, 1, 1, 1, 1,
-0.6794453, 0.520344, -1.384984, 1, 1, 1, 1, 1,
-0.677709, -0.3239092, -2.905422, 1, 1, 1, 1, 1,
-0.6702111, 0.4921047, -0.7545202, 1, 1, 1, 1, 1,
-0.6641037, 0.6141756, -1.713631, 0, 0, 1, 1, 1,
-0.6612938, 0.2154096, -2.852517, 1, 0, 0, 1, 1,
-0.6542123, 1.909964, -2.048469, 1, 0, 0, 1, 1,
-0.6486058, -0.1742646, -2.130958, 1, 0, 0, 1, 1,
-0.6429558, 1.024719, -2.634867, 1, 0, 0, 1, 1,
-0.6392105, 0.05067222, 0.8470572, 1, 0, 0, 1, 1,
-0.6349065, -0.4090597, -2.040076, 0, 0, 0, 1, 1,
-0.6343597, -0.3526785, -1.730766, 0, 0, 0, 1, 1,
-0.6333458, -0.5669296, -2.752621, 0, 0, 0, 1, 1,
-0.6330051, 1.239885, -2.140112, 0, 0, 0, 1, 1,
-0.6316466, -1.172034, -2.613553, 0, 0, 0, 1, 1,
-0.6303831, -0.5453387, -1.671732, 0, 0, 0, 1, 1,
-0.6293801, 1.236099, 0.4044756, 0, 0, 0, 1, 1,
-0.6277865, -0.5944785, -1.994409, 1, 1, 1, 1, 1,
-0.6238178, 1.219256, -0.3016272, 1, 1, 1, 1, 1,
-0.6208095, -1.425352, -3.568736, 1, 1, 1, 1, 1,
-0.6145913, -0.08830047, -1.930709, 1, 1, 1, 1, 1,
-0.6135535, 0.6951644, -2.113222, 1, 1, 1, 1, 1,
-0.6127883, 0.7799274, 0.386913, 1, 1, 1, 1, 1,
-0.6123428, 1.063062, -1.572587, 1, 1, 1, 1, 1,
-0.6086849, 0.5968692, 0.7895091, 1, 1, 1, 1, 1,
-0.6044832, -0.68406, -3.984247, 1, 1, 1, 1, 1,
-0.5981773, 0.01572714, -1.304782, 1, 1, 1, 1, 1,
-0.5957174, -1.342998, -2.867512, 1, 1, 1, 1, 1,
-0.5954241, 0.4613736, -0.4293184, 1, 1, 1, 1, 1,
-0.5899681, -0.4961206, -3.708939, 1, 1, 1, 1, 1,
-0.5875964, -0.3466759, -1.622981, 1, 1, 1, 1, 1,
-0.5829549, -1.601223, -2.873832, 1, 1, 1, 1, 1,
-0.575866, 0.3593897, -0.2460308, 0, 0, 1, 1, 1,
-0.5749946, 1.3215, -0.7352834, 1, 0, 0, 1, 1,
-0.5643644, -0.9093059, -1.134464, 1, 0, 0, 1, 1,
-0.5538346, -0.6804013, -1.861335, 1, 0, 0, 1, 1,
-0.5525137, -0.4244511, -0.792215, 1, 0, 0, 1, 1,
-0.5451829, -0.9392021, -1.520164, 1, 0, 0, 1, 1,
-0.5432963, -0.01999028, -3.542658, 0, 0, 0, 1, 1,
-0.5335692, 0.3844998, -1.794848, 0, 0, 0, 1, 1,
-0.5335287, -0.1084341, -2.060257, 0, 0, 0, 1, 1,
-0.5289053, 1.106912, -1.317444, 0, 0, 0, 1, 1,
-0.5259197, -1.970533, -3.847146, 0, 0, 0, 1, 1,
-0.5249274, 0.1573486, -1.443288, 0, 0, 0, 1, 1,
-0.5198497, -2.375682, -3.632862, 0, 0, 0, 1, 1,
-0.5122291, 0.6609399, -0.8575867, 1, 1, 1, 1, 1,
-0.510239, 1.307268, -0.16316, 1, 1, 1, 1, 1,
-0.5090119, 0.3777615, 1.017104, 1, 1, 1, 1, 1,
-0.5078704, -0.5285895, -2.727979, 1, 1, 1, 1, 1,
-0.5033652, 0.2120024, -1.155218, 1, 1, 1, 1, 1,
-0.5023993, -0.9128147, -3.447484, 1, 1, 1, 1, 1,
-0.5016418, 1.149442, -0.3757462, 1, 1, 1, 1, 1,
-0.5009885, -1.166274, -1.996808, 1, 1, 1, 1, 1,
-0.4897738, 0.03115975, -1.182987, 1, 1, 1, 1, 1,
-0.4852426, 0.4574277, -2.04013, 1, 1, 1, 1, 1,
-0.4843031, -1.324254, -2.692952, 1, 1, 1, 1, 1,
-0.4841663, -0.4675835, -2.750265, 1, 1, 1, 1, 1,
-0.4808657, 1.269729, -2.283155, 1, 1, 1, 1, 1,
-0.4788744, -0.4106281, -3.58507, 1, 1, 1, 1, 1,
-0.4734446, 2.16139, 0.6987707, 1, 1, 1, 1, 1,
-0.4730785, 0.5897338, 0.3305636, 0, 0, 1, 1, 1,
-0.4715739, -1.384692, -3.212176, 1, 0, 0, 1, 1,
-0.4673689, -0.1443254, -1.22359, 1, 0, 0, 1, 1,
-0.462478, 0.01523582, -2.064516, 1, 0, 0, 1, 1,
-0.4596469, 1.575188, 0.7685136, 1, 0, 0, 1, 1,
-0.4545181, 1.161562, 0.3685884, 1, 0, 0, 1, 1,
-0.4544017, -0.8390241, -1.681364, 0, 0, 0, 1, 1,
-0.4514278, -0.5713527, -4.05813, 0, 0, 0, 1, 1,
-0.4467546, 0.926456, 0.4850062, 0, 0, 0, 1, 1,
-0.4422243, -0.2067771, -0.917286, 0, 0, 0, 1, 1,
-0.4405047, 1.005528, 0.08949275, 0, 0, 0, 1, 1,
-0.4387372, 0.3302192, -1.882536, 0, 0, 0, 1, 1,
-0.4312634, -0.1183341, -3.400526, 0, 0, 0, 1, 1,
-0.4310252, 0.2154202, 0.3368643, 1, 1, 1, 1, 1,
-0.426217, -1.311776, -2.97209, 1, 1, 1, 1, 1,
-0.426189, 1.054878, -0.8571978, 1, 1, 1, 1, 1,
-0.423858, 0.6765177, 1.429654, 1, 1, 1, 1, 1,
-0.4227158, 0.2191642, -1.240668, 1, 1, 1, 1, 1,
-0.4146406, -1.252343, -3.958593, 1, 1, 1, 1, 1,
-0.4115723, -0.2487422, -4.767895, 1, 1, 1, 1, 1,
-0.4114259, 1.53621, -1.472666, 1, 1, 1, 1, 1,
-0.4102234, 0.07521149, -0.9220061, 1, 1, 1, 1, 1,
-0.4065208, 0.8127, 0.9710594, 1, 1, 1, 1, 1,
-0.3988973, 0.5002205, -1.443183, 1, 1, 1, 1, 1,
-0.3942498, -0.3140748, -3.333786, 1, 1, 1, 1, 1,
-0.3922006, 1.177412, -0.9995515, 1, 1, 1, 1, 1,
-0.3856027, 0.4099804, -0.4064895, 1, 1, 1, 1, 1,
-0.3840509, 0.9273717, -0.59794, 1, 1, 1, 1, 1,
-0.3796691, -1.619761, -2.927323, 0, 0, 1, 1, 1,
-0.3720974, 0.2724316, -1.146486, 1, 0, 0, 1, 1,
-0.3720525, 1.223969, -0.7332793, 1, 0, 0, 1, 1,
-0.3684779, 1.017234, -1.594554, 1, 0, 0, 1, 1,
-0.3683116, -0.2314801, -4.91879, 1, 0, 0, 1, 1,
-0.3671966, 1.734383, -0.9787127, 1, 0, 0, 1, 1,
-0.358389, 1.91321, -0.4419533, 0, 0, 0, 1, 1,
-0.3518059, 1.105494, 0.3382432, 0, 0, 0, 1, 1,
-0.3450276, 0.6990116, -0.8333777, 0, 0, 0, 1, 1,
-0.3333587, 0.09485759, -0.9197782, 0, 0, 0, 1, 1,
-0.3310336, -0.1667652, -3.296457, 0, 0, 0, 1, 1,
-0.3260772, 0.8961123, -1.514097, 0, 0, 0, 1, 1,
-0.3257084, -0.1105326, -2.259921, 0, 0, 0, 1, 1,
-0.3214804, -0.9696657, -4.655411, 1, 1, 1, 1, 1,
-0.3208733, -0.02874574, -0.901706, 1, 1, 1, 1, 1,
-0.3183501, 1.14869, -0.6370882, 1, 1, 1, 1, 1,
-0.3139132, -1.410511, -4.820551, 1, 1, 1, 1, 1,
-0.3119099, -2.131964, -3.83009, 1, 1, 1, 1, 1,
-0.3063634, 0.828108, -1.31239, 1, 1, 1, 1, 1,
-0.3050978, -0.4737929, -2.318034, 1, 1, 1, 1, 1,
-0.2991378, -0.1225856, -2.027306, 1, 1, 1, 1, 1,
-0.2954055, -0.1831448, -0.9753571, 1, 1, 1, 1, 1,
-0.2942409, -1.355444, -1.590768, 1, 1, 1, 1, 1,
-0.2921915, 1.188574, 0.2939412, 1, 1, 1, 1, 1,
-0.2892865, 1.481185, 0.1189895, 1, 1, 1, 1, 1,
-0.2821096, 0.2779821, -1.490981, 1, 1, 1, 1, 1,
-0.281627, 0.7643655, 2.079536, 1, 1, 1, 1, 1,
-0.2795771, -1.484308, -1.096018, 1, 1, 1, 1, 1,
-0.2766923, -0.529348, -2.821666, 0, 0, 1, 1, 1,
-0.2758931, -0.3855079, -2.584819, 1, 0, 0, 1, 1,
-0.2737795, -0.5291671, -1.807552, 1, 0, 0, 1, 1,
-0.2697422, -0.8026386, -1.166879, 1, 0, 0, 1, 1,
-0.2695942, 0.6622935, -1.528608, 1, 0, 0, 1, 1,
-0.2657968, -0.4813591, -2.122665, 1, 0, 0, 1, 1,
-0.2640924, -1.210002, -3.399081, 0, 0, 0, 1, 1,
-0.2635579, -0.2066618, -1.363988, 0, 0, 0, 1, 1,
-0.2622351, -0.8326526, -1.805275, 0, 0, 0, 1, 1,
-0.2559029, -1.367905, -1.993814, 0, 0, 0, 1, 1,
-0.2521393, -0.04473874, -3.247931, 0, 0, 0, 1, 1,
-0.251323, -0.4600032, -2.55561, 0, 0, 0, 1, 1,
-0.2487546, 1.528001, 0.3778867, 0, 0, 0, 1, 1,
-0.2479679, -0.6258313, -2.060198, 1, 1, 1, 1, 1,
-0.2445567, 2.403486, -0.05720689, 1, 1, 1, 1, 1,
-0.2437097, 1.000546, 0.5057521, 1, 1, 1, 1, 1,
-0.2421256, 1.368816, -0.4722401, 1, 1, 1, 1, 1,
-0.2351758, 1.231375, -1.180608, 1, 1, 1, 1, 1,
-0.2318458, -0.1212301, -1.26457, 1, 1, 1, 1, 1,
-0.2296975, -0.7689959, -2.49412, 1, 1, 1, 1, 1,
-0.2292601, -0.6454558, -3.18541, 1, 1, 1, 1, 1,
-0.2277904, 1.398999, -0.7038531, 1, 1, 1, 1, 1,
-0.227082, 0.2400753, -0.6741738, 1, 1, 1, 1, 1,
-0.2267303, 0.2311022, 0.1355478, 1, 1, 1, 1, 1,
-0.2238122, 0.9161875, 0.0423913, 1, 1, 1, 1, 1,
-0.2160552, -0.1578221, -2.866318, 1, 1, 1, 1, 1,
-0.2144472, 1.24079, 0.144316, 1, 1, 1, 1, 1,
-0.2119885, -0.7069141, -2.737792, 1, 1, 1, 1, 1,
-0.2009503, -2.540781, -3.182103, 0, 0, 1, 1, 1,
-0.1927836, -0.4307766, -4.311331, 1, 0, 0, 1, 1,
-0.1913345, 1.834997, 0.8164116, 1, 0, 0, 1, 1,
-0.1903695, 2.446805, 0.6353803, 1, 0, 0, 1, 1,
-0.1870395, 0.9156826, -0.2203238, 1, 0, 0, 1, 1,
-0.1863019, 0.5980423, 0.9777617, 1, 0, 0, 1, 1,
-0.185416, 0.7882088, -2.824042, 0, 0, 0, 1, 1,
-0.184881, -1.460339, -3.207495, 0, 0, 0, 1, 1,
-0.1831158, -0.03644781, -3.626009, 0, 0, 0, 1, 1,
-0.1812488, -1.376941, -3.292157, 0, 0, 0, 1, 1,
-0.176348, 0.4792666, -0.6466641, 0, 0, 0, 1, 1,
-0.1761328, -0.4809533, -3.182105, 0, 0, 0, 1, 1,
-0.1723839, 0.2696539, -2.05235, 0, 0, 0, 1, 1,
-0.1714129, -0.8302557, -2.751289, 1, 1, 1, 1, 1,
-0.1689496, -0.03891045, -4.547859, 1, 1, 1, 1, 1,
-0.1676506, 0.9448496, -0.4309443, 1, 1, 1, 1, 1,
-0.1617031, 0.7117531, -0.304543, 1, 1, 1, 1, 1,
-0.1579424, -0.3577753, -3.785048, 1, 1, 1, 1, 1,
-0.1535758, 0.2506245, -0.6959342, 1, 1, 1, 1, 1,
-0.1511927, 0.3593362, -0.3798164, 1, 1, 1, 1, 1,
-0.1486899, 0.9784169, -1.201487, 1, 1, 1, 1, 1,
-0.1461564, -0.3438422, -0.783536, 1, 1, 1, 1, 1,
-0.1438643, -1.472392, -1.665007, 1, 1, 1, 1, 1,
-0.1425006, 0.1610454, 0.5684294, 1, 1, 1, 1, 1,
-0.1378056, 0.003106516, -0.5767061, 1, 1, 1, 1, 1,
-0.1353064, -1.420705, -3.469708, 1, 1, 1, 1, 1,
-0.1350978, 0.6808949, 0.1652994, 1, 1, 1, 1, 1,
-0.1312136, 1.643922, -0.09854825, 1, 1, 1, 1, 1,
-0.1306807, -1.663566, -2.42724, 0, 0, 1, 1, 1,
-0.1297676, 0.6980117, -1.809436, 1, 0, 0, 1, 1,
-0.1265033, 0.5634305, -0.3329931, 1, 0, 0, 1, 1,
-0.1245867, -0.8861261, -1.958183, 1, 0, 0, 1, 1,
-0.1244661, 0.06923193, 0.9437286, 1, 0, 0, 1, 1,
-0.1197962, 1.638284, 0.4133301, 1, 0, 0, 1, 1,
-0.1195872, 2.054407, -1.04909, 0, 0, 0, 1, 1,
-0.1171325, -0.4413834, -3.074558, 0, 0, 0, 1, 1,
-0.1125292, 1.382786, -0.2011743, 0, 0, 0, 1, 1,
-0.1122867, 0.495446, -1.932429, 0, 0, 0, 1, 1,
-0.1101914, -1.846748, -0.9497603, 0, 0, 0, 1, 1,
-0.1101457, 0.5518842, 1.061208, 0, 0, 0, 1, 1,
-0.1059331, -1.225419, -3.133225, 0, 0, 0, 1, 1,
-0.1049355, -0.02323961, -0.8117703, 1, 1, 1, 1, 1,
-0.09995956, 0.7629088, 0.6284305, 1, 1, 1, 1, 1,
-0.09832306, -0.6724688, -2.426063, 1, 1, 1, 1, 1,
-0.09510013, -1.69791, -4.15823, 1, 1, 1, 1, 1,
-0.0906432, -0.4768072, -3.367333, 1, 1, 1, 1, 1,
-0.09058329, -0.3751052, -2.232519, 1, 1, 1, 1, 1,
-0.08234937, 0.4359979, -1.250989, 1, 1, 1, 1, 1,
-0.07942197, 1.326943, -0.3579002, 1, 1, 1, 1, 1,
-0.07863123, 0.7041541, -0.1248577, 1, 1, 1, 1, 1,
-0.07676013, 0.5610806, 1.544078, 1, 1, 1, 1, 1,
-0.07624549, 1.702349, 0.704692, 1, 1, 1, 1, 1,
-0.07495969, 0.9741339, -0.9127246, 1, 1, 1, 1, 1,
-0.06845099, -0.6054828, -3.437088, 1, 1, 1, 1, 1,
-0.058896, 0.7314808, -0.7959294, 1, 1, 1, 1, 1,
-0.05675316, 0.5185395, -0.6449329, 1, 1, 1, 1, 1,
-0.0557691, -1.114175, -1.589017, 0, 0, 1, 1, 1,
-0.05027382, 0.4042918, -0.3135299, 1, 0, 0, 1, 1,
-0.04989357, 0.06092957, -1.911196, 1, 0, 0, 1, 1,
-0.04862333, 1.484049, -0.2000553, 1, 0, 0, 1, 1,
-0.04676834, 0.1063109, -0.9105125, 1, 0, 0, 1, 1,
-0.04584938, -0.8252692, -2.967885, 1, 0, 0, 1, 1,
-0.04058334, 1.24549, -1.092628, 0, 0, 0, 1, 1,
-0.03811316, -0.443051, -2.064431, 0, 0, 0, 1, 1,
-0.03763254, -0.5138223, -2.562731, 0, 0, 0, 1, 1,
-0.0348274, -0.8631341, -3.363877, 0, 0, 0, 1, 1,
-0.03284667, -0.1238736, -2.477985, 0, 0, 0, 1, 1,
-0.03263233, 2.180437, 1.323966, 0, 0, 0, 1, 1,
-0.03003614, 0.1791892, -0.09835666, 0, 0, 0, 1, 1,
-0.02331977, 0.7303193, -0.4859678, 1, 1, 1, 1, 1,
-0.02228841, -0.3515429, -4.284878, 1, 1, 1, 1, 1,
-0.01534083, -2.052108, -3.728817, 1, 1, 1, 1, 1,
-0.01437033, 0.04027345, 0.01016702, 1, 1, 1, 1, 1,
-0.01287295, 0.4214253, 0.7066601, 1, 1, 1, 1, 1,
-0.01106894, 0.375009, 0.4427297, 1, 1, 1, 1, 1,
-0.00919247, 0.159635, -1.668866, 1, 1, 1, 1, 1,
-0.008488694, -0.8154824, -4.488522, 1, 1, 1, 1, 1,
-0.0040926, 0.5066351, 0.6262686, 1, 1, 1, 1, 1,
-0.00215056, 0.4512615, -0.1453434, 1, 1, 1, 1, 1,
-3.05812e-05, -0.7563779, -2.457275, 1, 1, 1, 1, 1,
0.003418245, -1.16058, 3.959804, 1, 1, 1, 1, 1,
0.004490111, 1.151494, -0.1383031, 1, 1, 1, 1, 1,
0.007343439, -1.520639, 1.945621, 1, 1, 1, 1, 1,
0.007361685, -0.9249408, 4.063332, 1, 1, 1, 1, 1,
0.007798969, 0.6056932, -0.02622036, 0, 0, 1, 1, 1,
0.009300465, -0.4584037, 2.96749, 1, 0, 0, 1, 1,
0.009810165, 1.07203, -0.2250728, 1, 0, 0, 1, 1,
0.01096908, -0.3101161, 4.047818, 1, 0, 0, 1, 1,
0.01125789, -0.8626643, 2.77518, 1, 0, 0, 1, 1,
0.0132381, 0.4670082, -0.9706354, 1, 0, 0, 1, 1,
0.01718645, 0.3446613, 0.2578245, 0, 0, 0, 1, 1,
0.01775038, -0.5498627, 2.733572, 0, 0, 0, 1, 1,
0.0206343, -0.6957205, 2.70663, 0, 0, 0, 1, 1,
0.02167131, 0.8541508, -0.513997, 0, 0, 0, 1, 1,
0.02305468, -0.9836673, 2.364207, 0, 0, 0, 1, 1,
0.03130123, 0.520291, -1.881414, 0, 0, 0, 1, 1,
0.03520849, 0.1339493, 0.2896286, 0, 0, 0, 1, 1,
0.03579597, 0.8894411, 0.6415157, 1, 1, 1, 1, 1,
0.03774434, 1.59796, 0.8152747, 1, 1, 1, 1, 1,
0.03942316, -0.2902553, 2.334982, 1, 1, 1, 1, 1,
0.04060247, -0.2267392, 3.206253, 1, 1, 1, 1, 1,
0.04432553, -0.5848545, 4.029123, 1, 1, 1, 1, 1,
0.05140542, -0.1217587, 1.865398, 1, 1, 1, 1, 1,
0.05197952, -2.795263, 1.288178, 1, 1, 1, 1, 1,
0.05314578, 0.4495467, -0.5429759, 1, 1, 1, 1, 1,
0.05695293, -0.7883236, 4.39014, 1, 1, 1, 1, 1,
0.05812294, 0.1905707, -1.141461, 1, 1, 1, 1, 1,
0.05909105, 0.4426833, 0.4545419, 1, 1, 1, 1, 1,
0.0644872, -0.05794401, 1.529153, 1, 1, 1, 1, 1,
0.06529707, 0.5702428, 0.2446791, 1, 1, 1, 1, 1,
0.07016303, 0.4750437, 2.039605, 1, 1, 1, 1, 1,
0.07258628, -0.158282, 2.189668, 1, 1, 1, 1, 1,
0.07290698, 2.328382, 0.746668, 0, 0, 1, 1, 1,
0.07943948, 0.674339, -0.3490294, 1, 0, 0, 1, 1,
0.08482951, -2.317098, 2.180607, 1, 0, 0, 1, 1,
0.08831146, 0.609439, -0.3271092, 1, 0, 0, 1, 1,
0.08864059, 0.7767866, -1.191897, 1, 0, 0, 1, 1,
0.08958122, -0.9384915, 2.586926, 1, 0, 0, 1, 1,
0.09054185, 0.3133312, -0.776867, 0, 0, 0, 1, 1,
0.09183826, 1.269879, 0.63381, 0, 0, 0, 1, 1,
0.09470907, -0.8559234, 1.842872, 0, 0, 0, 1, 1,
0.09875973, -1.355798, 3.777547, 0, 0, 0, 1, 1,
0.1019051, 1.83822, 0.7484231, 0, 0, 0, 1, 1,
0.10192, -1.372278, 2.430809, 0, 0, 0, 1, 1,
0.1045713, -0.2368137, 1.385805, 0, 0, 0, 1, 1,
0.1059534, -0.3508813, 2.480587, 1, 1, 1, 1, 1,
0.1076454, 1.362985, 1.175633, 1, 1, 1, 1, 1,
0.1089919, -0.600539, 4.427783, 1, 1, 1, 1, 1,
0.1090067, 1.274655, -0.7770025, 1, 1, 1, 1, 1,
0.1096403, -0.9072234, 3.034528, 1, 1, 1, 1, 1,
0.1103482, -2.541355, 2.952732, 1, 1, 1, 1, 1,
0.1148418, 1.088683, -1.356634, 1, 1, 1, 1, 1,
0.117301, 0.3571608, 1.343084, 1, 1, 1, 1, 1,
0.1252317, 0.7522356, 0.6409303, 1, 1, 1, 1, 1,
0.1294959, 0.4377275, 1.041368, 1, 1, 1, 1, 1,
0.1299268, 1.615885, -0.7942894, 1, 1, 1, 1, 1,
0.130844, -0.8237748, 3.558473, 1, 1, 1, 1, 1,
0.1370461, 0.9367152, 1.88676, 1, 1, 1, 1, 1,
0.151396, -1.185377, 2.089692, 1, 1, 1, 1, 1,
0.1524436, 1.539295, -0.7548399, 1, 1, 1, 1, 1,
0.1550512, 0.4700786, 0.3938517, 0, 0, 1, 1, 1,
0.1563292, -0.8609459, 3.443932, 1, 0, 0, 1, 1,
0.16034, 0.3653351, 1.081233, 1, 0, 0, 1, 1,
0.1675304, -1.209203, 2.247069, 1, 0, 0, 1, 1,
0.1683959, -2.357121, 2.272936, 1, 0, 0, 1, 1,
0.1685377, 0.8563492, 1.008023, 1, 0, 0, 1, 1,
0.1733918, 0.4703513, 1.987719, 0, 0, 0, 1, 1,
0.1770379, 1.817717, -0.4602232, 0, 0, 0, 1, 1,
0.1785675, -0.6053711, 3.238911, 0, 0, 0, 1, 1,
0.1794971, -0.4436988, 4.105124, 0, 0, 0, 1, 1,
0.1800369, -2.396396, 2.413091, 0, 0, 0, 1, 1,
0.1819312, 0.9057159, 0.8495317, 0, 0, 0, 1, 1,
0.1862099, -2.361391, 0.4289326, 0, 0, 0, 1, 1,
0.1881647, -1.407786, 3.115708, 1, 1, 1, 1, 1,
0.188695, -0.2344533, 0.6435907, 1, 1, 1, 1, 1,
0.1898746, -0.7750965, 3.165165, 1, 1, 1, 1, 1,
0.1908458, 1.479092, -1.498184, 1, 1, 1, 1, 1,
0.1918985, -1.600047, 5.783092, 1, 1, 1, 1, 1,
0.1949015, 0.2500132, 0.4824635, 1, 1, 1, 1, 1,
0.1951412, -0.2302869, 2.964643, 1, 1, 1, 1, 1,
0.1957683, 0.6521332, 0.1014936, 1, 1, 1, 1, 1,
0.1957867, 1.234338, 1.287308, 1, 1, 1, 1, 1,
0.1975154, 0.2312365, -0.1499305, 1, 1, 1, 1, 1,
0.1998763, 0.2003802, -0.6804578, 1, 1, 1, 1, 1,
0.2001269, -0.6217727, 4.140095, 1, 1, 1, 1, 1,
0.2047096, 0.45906, 1.076681, 1, 1, 1, 1, 1,
0.2067414, -0.06374205, 1.721191, 1, 1, 1, 1, 1,
0.2088189, -1.713783, 2.607857, 1, 1, 1, 1, 1,
0.2092286, -0.1323337, 1.800215, 0, 0, 1, 1, 1,
0.2143098, -1.497452, 1.379206, 1, 0, 0, 1, 1,
0.2201915, -0.3303289, 1.896518, 1, 0, 0, 1, 1,
0.2208511, 0.09946395, 1.692761, 1, 0, 0, 1, 1,
0.2239439, 0.9794133, 2.712695, 1, 0, 0, 1, 1,
0.2282061, -0.9240229, 2.171876, 1, 0, 0, 1, 1,
0.2291921, -0.9746542, 5.021593, 0, 0, 0, 1, 1,
0.2305021, -0.07662657, -0.9447452, 0, 0, 0, 1, 1,
0.232216, -0.04107391, 1.963547, 0, 0, 0, 1, 1,
0.2374652, 0.5545504, 1.395009, 0, 0, 0, 1, 1,
0.2383155, 1.045982, 0.6138647, 0, 0, 0, 1, 1,
0.2397145, 0.6327691, 1.169812, 0, 0, 0, 1, 1,
0.2470273, -0.002960319, 2.402306, 0, 0, 0, 1, 1,
0.247963, -0.6368197, 3.832537, 1, 1, 1, 1, 1,
0.2479822, -0.1637812, 3.142831, 1, 1, 1, 1, 1,
0.2481815, -1.113499, 3.244658, 1, 1, 1, 1, 1,
0.2563591, -0.1035952, 1.690137, 1, 1, 1, 1, 1,
0.2590168, -0.803661, 3.204856, 1, 1, 1, 1, 1,
0.2590679, 0.6438962, -0.3810855, 1, 1, 1, 1, 1,
0.2598453, -0.8229873, 3.016131, 1, 1, 1, 1, 1,
0.2629778, -1.576147, 3.938348, 1, 1, 1, 1, 1,
0.2635699, -0.2940212, 1.117208, 1, 1, 1, 1, 1,
0.2677576, -0.817872, 3.195173, 1, 1, 1, 1, 1,
0.2700273, 0.357677, 0.4152105, 1, 1, 1, 1, 1,
0.2720752, 0.0004520013, 0.8542175, 1, 1, 1, 1, 1,
0.2733846, 1.930408, -0.11098, 1, 1, 1, 1, 1,
0.2733952, 0.07226966, 3.203711, 1, 1, 1, 1, 1,
0.2823882, -0.1426633, 3.567604, 1, 1, 1, 1, 1,
0.2845145, 2.292199, 0.2434442, 0, 0, 1, 1, 1,
0.2855359, -1.369718, 1.487337, 1, 0, 0, 1, 1,
0.289243, 2.101651, 0.7839108, 1, 0, 0, 1, 1,
0.2897744, -0.9151503, 3.779005, 1, 0, 0, 1, 1,
0.2938562, -0.779059, 2.411309, 1, 0, 0, 1, 1,
0.295787, -1.203723, 3.822164, 1, 0, 0, 1, 1,
0.2958378, 0.7789856, -0.5577648, 0, 0, 0, 1, 1,
0.2959248, 0.6294082, -0.9216745, 0, 0, 0, 1, 1,
0.2973865, 0.8695116, -0.9774589, 0, 0, 0, 1, 1,
0.3006919, -0.8063446, 4.21866, 0, 0, 0, 1, 1,
0.3022455, -1.429846, 4.189188, 0, 0, 0, 1, 1,
0.3029385, 2.124822, 0.08055412, 0, 0, 0, 1, 1,
0.3029645, 1.269249, 0.1495295, 0, 0, 0, 1, 1,
0.3045401, 0.432971, 1.994963, 1, 1, 1, 1, 1,
0.3050731, -0.2980683, 1.964111, 1, 1, 1, 1, 1,
0.3135538, 1.140919, 0.9752489, 1, 1, 1, 1, 1,
0.3225326, 0.9281173, 0.02186183, 1, 1, 1, 1, 1,
0.3235247, 0.461004, 0.2018788, 1, 1, 1, 1, 1,
0.3253123, 0.4130535, -1.646871, 1, 1, 1, 1, 1,
0.3260288, 0.7823557, -0.5551165, 1, 1, 1, 1, 1,
0.326338, -1.576535, 3.052935, 1, 1, 1, 1, 1,
0.3289492, -1.21439, 1.19522, 1, 1, 1, 1, 1,
0.3296434, -0.3007533, 2.865876, 1, 1, 1, 1, 1,
0.3302124, -1.069097, 4.394346, 1, 1, 1, 1, 1,
0.3309796, -0.2198786, 4.451992, 1, 1, 1, 1, 1,
0.3329812, -0.01954069, 1.068175, 1, 1, 1, 1, 1,
0.3367012, 0.0474458, 0.8065822, 1, 1, 1, 1, 1,
0.3385749, -0.1796938, 4.012149, 1, 1, 1, 1, 1,
0.3392705, 0.3977997, 1.432582, 0, 0, 1, 1, 1,
0.3497656, -0.1551988, 2.213762, 1, 0, 0, 1, 1,
0.3502175, 1.884246, -1.268258, 1, 0, 0, 1, 1,
0.3503703, 0.5257555, 0.2961231, 1, 0, 0, 1, 1,
0.3512184, -0.06100164, 0.4188098, 1, 0, 0, 1, 1,
0.3525644, -1.447406, 2.388178, 1, 0, 0, 1, 1,
0.3538013, -1.230632, 3.760566, 0, 0, 0, 1, 1,
0.354535, 0.1526224, 2.782695, 0, 0, 0, 1, 1,
0.3592153, -1.344239, 3.774714, 0, 0, 0, 1, 1,
0.3599142, -0.6546937, 3.000063, 0, 0, 0, 1, 1,
0.3618225, -1.077648, 1.74083, 0, 0, 0, 1, 1,
0.363081, -0.3000491, 3.490399, 0, 0, 0, 1, 1,
0.3653754, -0.4413208, 2.176875, 0, 0, 0, 1, 1,
0.3680024, -1.572594, 4.346611, 1, 1, 1, 1, 1,
0.3693206, 0.496073, 1.224416, 1, 1, 1, 1, 1,
0.3718081, -0.9904214, 2.811554, 1, 1, 1, 1, 1,
0.3730715, -0.7530001, 3.053071, 1, 1, 1, 1, 1,
0.3749015, -0.06954369, 1.860898, 1, 1, 1, 1, 1,
0.3763175, 0.02466087, 1.004718, 1, 1, 1, 1, 1,
0.3820525, 0.1501659, 2.180196, 1, 1, 1, 1, 1,
0.3846313, -0.9441065, 1.623134, 1, 1, 1, 1, 1,
0.3853019, 0.9596724, 0.8234472, 1, 1, 1, 1, 1,
0.3875617, 0.5873935, 0.1621214, 1, 1, 1, 1, 1,
0.3903684, -1.389211, 3.800573, 1, 1, 1, 1, 1,
0.3906509, 1.488417, -1.765319, 1, 1, 1, 1, 1,
0.3932072, 0.8842586, 0.3660956, 1, 1, 1, 1, 1,
0.3975242, -0.3562168, 1.489216, 1, 1, 1, 1, 1,
0.3984495, 0.5984696, 2.010241, 1, 1, 1, 1, 1,
0.4008114, -0.6664836, 0.8128626, 0, 0, 1, 1, 1,
0.4016181, -1.075411, 2.087424, 1, 0, 0, 1, 1,
0.4016561, -0.4867679, 2.802592, 1, 0, 0, 1, 1,
0.401773, 1.553255, 1.338264, 1, 0, 0, 1, 1,
0.403004, -0.9790488, 2.108037, 1, 0, 0, 1, 1,
0.4099466, 0.05680761, 1.946694, 1, 0, 0, 1, 1,
0.4111364, -1.175619, 0.7400705, 0, 0, 0, 1, 1,
0.4160212, 0.5388968, 1.186154, 0, 0, 0, 1, 1,
0.4167516, 0.02911007, 1.597282, 0, 0, 0, 1, 1,
0.4175123, -0.5819803, 3.200459, 0, 0, 0, 1, 1,
0.4191098, 0.6656389, 0.2972211, 0, 0, 0, 1, 1,
0.4223918, 0.1762973, 1.771859, 0, 0, 0, 1, 1,
0.4243706, -0.9560726, 2.511134, 0, 0, 0, 1, 1,
0.4295557, 0.3851128, 1.73395, 1, 1, 1, 1, 1,
0.4308788, 1.907505, 2.426122, 1, 1, 1, 1, 1,
0.4317226, 1.281819, 2.258358, 1, 1, 1, 1, 1,
0.4319427, 1.344686, 1.423222, 1, 1, 1, 1, 1,
0.432281, -0.02015238, 0.07899933, 1, 1, 1, 1, 1,
0.4347482, -0.236233, 3.451926, 1, 1, 1, 1, 1,
0.4376444, -0.3867761, 1.60115, 1, 1, 1, 1, 1,
0.4389763, -0.02335507, 1.082123, 1, 1, 1, 1, 1,
0.4407144, -0.6366386, 2.35176, 1, 1, 1, 1, 1,
0.4419203, 1.679128, 1.338044, 1, 1, 1, 1, 1,
0.4504544, 1.078833, -0.3158152, 1, 1, 1, 1, 1,
0.4530886, 0.3387039, 2.788224, 1, 1, 1, 1, 1,
0.4572196, -1.496157, 2.376924, 1, 1, 1, 1, 1,
0.4576897, -0.5449528, 4.726001, 1, 1, 1, 1, 1,
0.461252, -0.5080364, 1.231558, 1, 1, 1, 1, 1,
0.4668076, -0.700164, 3.531717, 0, 0, 1, 1, 1,
0.4682803, -1.054042, 1.232841, 1, 0, 0, 1, 1,
0.4704373, 1.892848, 0.231554, 1, 0, 0, 1, 1,
0.470725, 0.8321447, -0.2472817, 1, 0, 0, 1, 1,
0.474612, -0.08498447, 1.383257, 1, 0, 0, 1, 1,
0.4770722, 1.836261, 0.69897, 1, 0, 0, 1, 1,
0.48402, -1.701209, 1.34072, 0, 0, 0, 1, 1,
0.4845304, -0.8626383, 1.392053, 0, 0, 0, 1, 1,
0.4887391, -0.5398325, 2.15404, 0, 0, 0, 1, 1,
0.4900436, 0.6098011, 1.082123, 0, 0, 0, 1, 1,
0.5015683, 0.2518206, 1.314056, 0, 0, 0, 1, 1,
0.5020278, 1.086198, -1.247945, 0, 0, 0, 1, 1,
0.5065361, 0.4507108, 0.7162562, 0, 0, 0, 1, 1,
0.5070305, -1.756295, 4.646264, 1, 1, 1, 1, 1,
0.5151005, 1.110851, 0.4178899, 1, 1, 1, 1, 1,
0.5181909, -1.441723, 2.214556, 1, 1, 1, 1, 1,
0.5192356, 0.1710016, 2.287618, 1, 1, 1, 1, 1,
0.5192723, 0.02393376, 0.9561042, 1, 1, 1, 1, 1,
0.5205998, -0.7941473, 3.214212, 1, 1, 1, 1, 1,
0.5207437, 0.6496315, -0.09903852, 1, 1, 1, 1, 1,
0.5275078, -1.686373, 2.692607, 1, 1, 1, 1, 1,
0.5283042, 0.0436248, 2.278089, 1, 1, 1, 1, 1,
0.5290076, -0.9135378, 2.958833, 1, 1, 1, 1, 1,
0.5315933, -0.1869149, 2.944473, 1, 1, 1, 1, 1,
0.540866, 0.824623, -0.10097, 1, 1, 1, 1, 1,
0.5421755, -0.217904, 0.5446756, 1, 1, 1, 1, 1,
0.5425743, -1.302253, 1.77691, 1, 1, 1, 1, 1,
0.5477746, -0.543484, 2.271374, 1, 1, 1, 1, 1,
0.5495389, -0.7723399, 3.992677, 0, 0, 1, 1, 1,
0.5586501, 1.11744, 0.4194889, 1, 0, 0, 1, 1,
0.5588612, -0.5889504, 1.370342, 1, 0, 0, 1, 1,
0.5598611, -2.030332, 2.312193, 1, 0, 0, 1, 1,
0.5599357, -1.404183, 3.48282, 1, 0, 0, 1, 1,
0.5656053, 0.3815381, 1.862739, 1, 0, 0, 1, 1,
0.5676356, -0.5642287, 3.53354, 0, 0, 0, 1, 1,
0.5719466, -0.4273863, 2.345969, 0, 0, 0, 1, 1,
0.5852196, -0.5747677, 0.7469426, 0, 0, 0, 1, 1,
0.585906, -0.2556758, 0.3870007, 0, 0, 0, 1, 1,
0.5873668, -0.1420578, 1.622444, 0, 0, 0, 1, 1,
0.5925266, -0.4413809, 5.001994, 0, 0, 0, 1, 1,
0.5945515, 0.08119158, 0.3703619, 0, 0, 0, 1, 1,
0.5961229, 1.594841, 0.5631663, 1, 1, 1, 1, 1,
0.5990306, -2.445952, 1.956928, 1, 1, 1, 1, 1,
0.6004018, -0.146225, 2.536947, 1, 1, 1, 1, 1,
0.6012697, 0.1675681, 1.043066, 1, 1, 1, 1, 1,
0.6094779, 0.4798873, 0.06004098, 1, 1, 1, 1, 1,
0.6109368, -0.583335, 3.09978, 1, 1, 1, 1, 1,
0.6146771, -0.08409394, 1.026547, 1, 1, 1, 1, 1,
0.6194506, -1.130347, 3.049151, 1, 1, 1, 1, 1,
0.6195719, -0.7830544, 2.42315, 1, 1, 1, 1, 1,
0.6232219, -0.7108568, 2.715027, 1, 1, 1, 1, 1,
0.6241165, 0.649391, 2.164244, 1, 1, 1, 1, 1,
0.6304286, -0.4183404, 4.735136, 1, 1, 1, 1, 1,
0.6374691, 0.07548158, -0.138322, 1, 1, 1, 1, 1,
0.6382142, -0.5524889, 2.515881, 1, 1, 1, 1, 1,
0.6388345, 0.3758204, 1.010412, 1, 1, 1, 1, 1,
0.6465487, -1.006478, 2.276832, 0, 0, 1, 1, 1,
0.6469029, -1.284732, 0.8583665, 1, 0, 0, 1, 1,
0.647769, 1.894307, -0.6133627, 1, 0, 0, 1, 1,
0.6611538, 1.455362, 1.93193, 1, 0, 0, 1, 1,
0.6625037, 1.469124, 1.510235, 1, 0, 0, 1, 1,
0.6662301, -0.3478802, 1.462931, 1, 0, 0, 1, 1,
0.6678869, 0.6200796, 0.03006535, 0, 0, 0, 1, 1,
0.669448, 0.8643791, 0.4524929, 0, 0, 0, 1, 1,
0.6706035, -0.9154624, 0.7693266, 0, 0, 0, 1, 1,
0.6748966, -1.250809, 4.216393, 0, 0, 0, 1, 1,
0.6750412, -0.3710098, 2.801153, 0, 0, 0, 1, 1,
0.676324, 0.1133198, 1.36473, 0, 0, 0, 1, 1,
0.678832, 0.7726048, 0.4583417, 0, 0, 0, 1, 1,
0.6792952, -0.1569636, 2.760051, 1, 1, 1, 1, 1,
0.6812426, -0.835442, 1.591675, 1, 1, 1, 1, 1,
0.6813201, -0.05861427, 2.347885, 1, 1, 1, 1, 1,
0.6818433, -0.96704, 3.250702, 1, 1, 1, 1, 1,
0.6829696, -0.06416411, -0.3451948, 1, 1, 1, 1, 1,
0.6839251, 0.2292127, 1.905894, 1, 1, 1, 1, 1,
0.6918264, -0.4064327, 2.663042, 1, 1, 1, 1, 1,
0.695601, -0.316888, 3.029294, 1, 1, 1, 1, 1,
0.6956077, 0.8805759, -0.105242, 1, 1, 1, 1, 1,
0.6971066, 0.01293939, 2.385385, 1, 1, 1, 1, 1,
0.7057331, 1.025065, 2.295275, 1, 1, 1, 1, 1,
0.7073908, 0.2932948, -0.6117857, 1, 1, 1, 1, 1,
0.7075372, 0.6887279, 1.498336, 1, 1, 1, 1, 1,
0.7084268, -0.225472, 0.6513878, 1, 1, 1, 1, 1,
0.7197143, -0.3640162, 1.428327, 1, 1, 1, 1, 1,
0.7240779, -1.121624, 2.992849, 0, 0, 1, 1, 1,
0.7270414, 1.555091, 1.193485, 1, 0, 0, 1, 1,
0.729811, -1.245901, 3.031666, 1, 0, 0, 1, 1,
0.731559, 1.071324, 0.8323041, 1, 0, 0, 1, 1,
0.736349, -1.287379, 3.860426, 1, 0, 0, 1, 1,
0.7404543, -1.250337, 1.160419, 1, 0, 0, 1, 1,
0.7413207, 1.387867, -0.7831842, 0, 0, 0, 1, 1,
0.7419413, 2.267538, 1.125336, 0, 0, 0, 1, 1,
0.7430828, 1.109303, -0.1746418, 0, 0, 0, 1, 1,
0.7449005, 1.012406, 0.2626317, 0, 0, 0, 1, 1,
0.7545944, -0.1023575, 2.79097, 0, 0, 0, 1, 1,
0.7710436, 2.172607, 0.4216876, 0, 0, 0, 1, 1,
0.7720752, -0.7154609, 0.2133709, 0, 0, 0, 1, 1,
0.7751438, 0.8926647, -1.616992, 1, 1, 1, 1, 1,
0.7814519, -0.4475354, 2.871885, 1, 1, 1, 1, 1,
0.7818574, -1.571709, 1.870648, 1, 1, 1, 1, 1,
0.7827222, -0.3687652, 3.852374, 1, 1, 1, 1, 1,
0.784757, -0.2533541, 1.837387, 1, 1, 1, 1, 1,
0.7902027, 0.6673781, 0.9070879, 1, 1, 1, 1, 1,
0.7913328, -0.5867347, 2.396005, 1, 1, 1, 1, 1,
0.7951674, 0.6537801, 1.636391, 1, 1, 1, 1, 1,
0.7966402, 0.8849322, 1.833063, 1, 1, 1, 1, 1,
0.7973084, 0.9048542, 0.9346287, 1, 1, 1, 1, 1,
0.7988326, -0.7493338, 2.393107, 1, 1, 1, 1, 1,
0.80244, 0.06791347, 1.043926, 1, 1, 1, 1, 1,
0.8053656, 0.636629, 0.8615351, 1, 1, 1, 1, 1,
0.8058194, 1.954285, 1.41241, 1, 1, 1, 1, 1,
0.8059531, 1.634268, 0.3756072, 1, 1, 1, 1, 1,
0.807699, 0.703119, 1.533724, 0, 0, 1, 1, 1,
0.8103521, 0.9081381, 1.858131, 1, 0, 0, 1, 1,
0.8124015, 0.5099781, -0.09184451, 1, 0, 0, 1, 1,
0.8157663, 0.3342311, 1.411132, 1, 0, 0, 1, 1,
0.8185604, 0.959161, 0.2609757, 1, 0, 0, 1, 1,
0.8225185, 0.159602, 3.510596, 1, 0, 0, 1, 1,
0.8257993, -0.6928533, 1.144462, 0, 0, 0, 1, 1,
0.8329344, 0.9805893, -0.2513509, 0, 0, 0, 1, 1,
0.8416145, -1.664189, 1.977516, 0, 0, 0, 1, 1,
0.8448709, 0.6338236, 0.3030888, 0, 0, 0, 1, 1,
0.8473496, -0.4251332, 2.485844, 0, 0, 0, 1, 1,
0.852124, -2.034225, 3.331488, 0, 0, 0, 1, 1,
0.8554986, -0.479592, 1.818554, 0, 0, 0, 1, 1,
0.8595176, 3.172285, -0.6421683, 1, 1, 1, 1, 1,
0.8641006, 1.009966, 0.7149062, 1, 1, 1, 1, 1,
0.8650535, -1.233871, 1.243851, 1, 1, 1, 1, 1,
0.8696009, -1.478083, 0.07080775, 1, 1, 1, 1, 1,
0.8727071, 0.3971295, 0.833223, 1, 1, 1, 1, 1,
0.8728803, -0.3138127, 0.9906973, 1, 1, 1, 1, 1,
0.8794975, -0.1980503, 2.977759, 1, 1, 1, 1, 1,
0.880649, 1.239714, 0.1928429, 1, 1, 1, 1, 1,
0.8849899, 0.2857435, 1.002399, 1, 1, 1, 1, 1,
0.8880484, -0.3800361, 0.7114035, 1, 1, 1, 1, 1,
0.8912277, -1.444539, 3.619085, 1, 1, 1, 1, 1,
0.8913692, 0.3392757, 1.144779, 1, 1, 1, 1, 1,
0.8933352, -0.1193024, 2.865125, 1, 1, 1, 1, 1,
0.8988469, -0.4444827, 2.379382, 1, 1, 1, 1, 1,
0.9021009, -0.0002911302, 1.686991, 1, 1, 1, 1, 1,
0.9024042, 0.5715416, -0.5164017, 0, 0, 1, 1, 1,
0.9033509, 0.7611913, 2.529597, 1, 0, 0, 1, 1,
0.9060267, 1.051744, 0.7781924, 1, 0, 0, 1, 1,
0.9147975, -2.07515, 3.949369, 1, 0, 0, 1, 1,
0.9164632, 0.2004542, 1.389227, 1, 0, 0, 1, 1,
0.9186066, -0.1586934, 2.769201, 1, 0, 0, 1, 1,
0.9212916, -0.06981017, 0.9937721, 0, 0, 0, 1, 1,
0.936497, 0.6348366, 0.2279714, 0, 0, 0, 1, 1,
0.9406177, -1.092402, 2.021678, 0, 0, 0, 1, 1,
0.945945, 0.5583155, 1.083525, 0, 0, 0, 1, 1,
0.9568967, -0.3411949, 2.535827, 0, 0, 0, 1, 1,
0.969645, -1.101465, 1.912359, 0, 0, 0, 1, 1,
0.9760574, -0.8266184, 0.6154384, 0, 0, 0, 1, 1,
0.9826899, -0.6015819, 3.57929, 1, 1, 1, 1, 1,
0.9899487, 0.04850044, -1.309168, 1, 1, 1, 1, 1,
0.9899843, 1.93115, 0.3443014, 1, 1, 1, 1, 1,
0.9919102, -0.3529946, 0.008920924, 1, 1, 1, 1, 1,
0.9924908, -0.2561498, 0.4009611, 1, 1, 1, 1, 1,
0.994673, 0.5287176, 0.4021019, 1, 1, 1, 1, 1,
0.9948648, -0.5185211, 2.587702, 1, 1, 1, 1, 1,
1.001179, 0.1543143, 1.358822, 1, 1, 1, 1, 1,
1.009879, -2.178838, 4.275492, 1, 1, 1, 1, 1,
1.012188, -0.3121098, 2.581725, 1, 1, 1, 1, 1,
1.016964, 0.5095399, 0.5371568, 1, 1, 1, 1, 1,
1.017906, -0.823773, 1.207888, 1, 1, 1, 1, 1,
1.020364, -0.3521003, 1.22345, 1, 1, 1, 1, 1,
1.023706, 1.712213, 1.257807, 1, 1, 1, 1, 1,
1.027465, -0.4218445, 4.36737, 1, 1, 1, 1, 1,
1.028982, 0.7842977, 1.519783, 0, 0, 1, 1, 1,
1.03233, 0.1991031, 0.695681, 1, 0, 0, 1, 1,
1.034001, 0.1371683, 1.749789, 1, 0, 0, 1, 1,
1.036947, -1.234194, 2.238469, 1, 0, 0, 1, 1,
1.037916, -0.4709107, 0.822762, 1, 0, 0, 1, 1,
1.038656, 0.3814681, 3.235476, 1, 0, 0, 1, 1,
1.053753, 1.522488, 1.289137, 0, 0, 0, 1, 1,
1.057068, 0.5807881, -0.835285, 0, 0, 0, 1, 1,
1.058175, 1.050077, 1.888462, 0, 0, 0, 1, 1,
1.059496, 3.152802, 0.9012966, 0, 0, 0, 1, 1,
1.059566, 1.483732, 1.08804, 0, 0, 0, 1, 1,
1.06583, 0.6287135, -0.7879999, 0, 0, 0, 1, 1,
1.071237, 0.4496484, 1.984287, 0, 0, 0, 1, 1,
1.071832, -0.3161213, 3.249966, 1, 1, 1, 1, 1,
1.080245, 0.8918769, 1.809053, 1, 1, 1, 1, 1,
1.090481, 1.024854, 2.305368, 1, 1, 1, 1, 1,
1.092528, 0.2776056, 1.206804, 1, 1, 1, 1, 1,
1.094394, -1.046439, 2.837454, 1, 1, 1, 1, 1,
1.096062, 1.754645, -0.218759, 1, 1, 1, 1, 1,
1.099825, 1.739833, 0.5359643, 1, 1, 1, 1, 1,
1.100357, -2.081963, 1.714404, 1, 1, 1, 1, 1,
1.101215, 0.9051861, 0.3251376, 1, 1, 1, 1, 1,
1.114173, -0.1252634, 0.6902575, 1, 1, 1, 1, 1,
1.116846, -0.4842338, -0.01910083, 1, 1, 1, 1, 1,
1.117477, 1.106952, -0.4005857, 1, 1, 1, 1, 1,
1.119793, -0.0936676, 1.41319, 1, 1, 1, 1, 1,
1.121642, 0.04758427, 2.302234, 1, 1, 1, 1, 1,
1.124025, 0.5178325, 1.885053, 1, 1, 1, 1, 1,
1.124894, 0.5860956, 0.1900299, 0, 0, 1, 1, 1,
1.125432, -0.4248638, 1.352405, 1, 0, 0, 1, 1,
1.127152, -1.404998, 1.900368, 1, 0, 0, 1, 1,
1.127604, 0.7175397, -0.08312125, 1, 0, 0, 1, 1,
1.128271, 1.225418, 0.1091719, 1, 0, 0, 1, 1,
1.129369, -0.3472605, 0.9123834, 1, 0, 0, 1, 1,
1.131171, -1.9349, 3.450624, 0, 0, 0, 1, 1,
1.134258, 1.394198, 1.634166, 0, 0, 0, 1, 1,
1.136935, -0.3536926, 1.469973, 0, 0, 0, 1, 1,
1.141023, 0.3805488, 2.230456, 0, 0, 0, 1, 1,
1.145623, -2.647985, 2.541102, 0, 0, 0, 1, 1,
1.152857, 0.6253124, 2.47534, 0, 0, 0, 1, 1,
1.153271, -1.194703, 0.7965122, 0, 0, 0, 1, 1,
1.155569, 0.6161571, 1.055227, 1, 1, 1, 1, 1,
1.161033, -0.7909616, 2.649563, 1, 1, 1, 1, 1,
1.16155, 0.6071272, 1.056975, 1, 1, 1, 1, 1,
1.170142, 1.516195, 0.8216676, 1, 1, 1, 1, 1,
1.173666, -1.23501, 2.906914, 1, 1, 1, 1, 1,
1.17517, 0.8966777, 0.8081258, 1, 1, 1, 1, 1,
1.179906, 0.6973172, 0.8410884, 1, 1, 1, 1, 1,
1.19351, 1.610101, -0.2992769, 1, 1, 1, 1, 1,
1.195264, 0.8105885, 0.7841193, 1, 1, 1, 1, 1,
1.195819, 1.629009, 1.541551, 1, 1, 1, 1, 1,
1.196634, -0.6548365, 1.628032, 1, 1, 1, 1, 1,
1.203283, 0.4992651, 1.610872, 1, 1, 1, 1, 1,
1.205467, 1.143649, 0.9173561, 1, 1, 1, 1, 1,
1.243584, 2.932275, -1.120366, 1, 1, 1, 1, 1,
1.24716, 0.08924308, 1.01661, 1, 1, 1, 1, 1,
1.254844, 2.216755, -1.192288, 0, 0, 1, 1, 1,
1.266493, -2.153351, 3.082819, 1, 0, 0, 1, 1,
1.27852, -0.6788028, 3.050243, 1, 0, 0, 1, 1,
1.281334, -1.100847, 2.7639, 1, 0, 0, 1, 1,
1.285292, -1.129353, 2.682637, 1, 0, 0, 1, 1,
1.286319, -0.2033247, -0.1551251, 1, 0, 0, 1, 1,
1.288661, -0.265712, 0.8411241, 0, 0, 0, 1, 1,
1.289072, 0.2987814, 1.62869, 0, 0, 0, 1, 1,
1.291335, 0.3690936, 1.521317, 0, 0, 0, 1, 1,
1.299554, 2.011251, 1.686318, 0, 0, 0, 1, 1,
1.299654, 0.148555, 2.115101, 0, 0, 0, 1, 1,
1.30279, 0.01171941, 0.5156438, 0, 0, 0, 1, 1,
1.304845, 0.3518848, 2.392308, 0, 0, 0, 1, 1,
1.31034, 1.042071, 0.7935376, 1, 1, 1, 1, 1,
1.322077, -0.3193631, 0.7584429, 1, 1, 1, 1, 1,
1.323035, 2.68267, 0.4738136, 1, 1, 1, 1, 1,
1.323343, 0.09747852, 1.747491, 1, 1, 1, 1, 1,
1.329216, 0.2322669, 1.874498, 1, 1, 1, 1, 1,
1.344107, -0.2019155, 2.860854, 1, 1, 1, 1, 1,
1.347784, 1.124467, 0.1458355, 1, 1, 1, 1, 1,
1.35452, -2.093671, 2.717, 1, 1, 1, 1, 1,
1.374611, -1.114257, 2.280221, 1, 1, 1, 1, 1,
1.375421, 0.1109374, 1.956883, 1, 1, 1, 1, 1,
1.37825, -0.2441401, 1.251392, 1, 1, 1, 1, 1,
1.386707, 0.951884, 0.8144387, 1, 1, 1, 1, 1,
1.407653, 0.9444204, 2.088889, 1, 1, 1, 1, 1,
1.41309, 0.7177621, 1.258787, 1, 1, 1, 1, 1,
1.416157, 1.745551, 0.7488182, 1, 1, 1, 1, 1,
1.420865, 1.025292, -0.9122283, 0, 0, 1, 1, 1,
1.423002, 0.3867598, 0.3948438, 1, 0, 0, 1, 1,
1.424116, 0.3371721, 1.711352, 1, 0, 0, 1, 1,
1.424342, 0.2974108, 1.828985, 1, 0, 0, 1, 1,
1.432769, -0.6535808, 0.5006829, 1, 0, 0, 1, 1,
1.43319, -2.083704, 1.411392, 1, 0, 0, 1, 1,
1.439097, 0.7762761, 3.244994, 0, 0, 0, 1, 1,
1.43966, -0.2193047, 2.024452, 0, 0, 0, 1, 1,
1.446241, 1.249076, 2.198348, 0, 0, 0, 1, 1,
1.449955, 2.616205, 2.325655, 0, 0, 0, 1, 1,
1.465127, -1.083269, 1.45551, 0, 0, 0, 1, 1,
1.476193, -0.1747039, 0.4588689, 0, 0, 0, 1, 1,
1.494558, -1.43253, 1.634735, 0, 0, 0, 1, 1,
1.497227, -1.221311, 3.254124, 1, 1, 1, 1, 1,
1.503726, 0.5810846, -1.23277, 1, 1, 1, 1, 1,
1.515261, 0.4779096, 2.279914, 1, 1, 1, 1, 1,
1.52888, 0.7471403, 2.538558, 1, 1, 1, 1, 1,
1.533417, 1.077696, 0.4943524, 1, 1, 1, 1, 1,
1.550139, 1.295655, 1.47368, 1, 1, 1, 1, 1,
1.550617, -1.223905, 1.894436, 1, 1, 1, 1, 1,
1.554236, -0.2683097, 3.601061, 1, 1, 1, 1, 1,
1.577047, -1.2788, 1.189344, 1, 1, 1, 1, 1,
1.577186, -1.921273, 0.5929669, 1, 1, 1, 1, 1,
1.584605, 1.742765, 0.8291184, 1, 1, 1, 1, 1,
1.593182, -0.6150326, 1.064216, 1, 1, 1, 1, 1,
1.594802, -0.5099444, 2.306286, 1, 1, 1, 1, 1,
1.603896, 0.3298833, 0.7248145, 1, 1, 1, 1, 1,
1.60623, 1.110572, 0.2394328, 1, 1, 1, 1, 1,
1.613872, 0.4222453, 1.802063, 0, 0, 1, 1, 1,
1.61861, -0.6766658, 0.8634787, 1, 0, 0, 1, 1,
1.623454, 0.007637626, -0.3575453, 1, 0, 0, 1, 1,
1.625121, 0.1594399, 0.5875589, 1, 0, 0, 1, 1,
1.637638, 0.5130874, 0.3356825, 1, 0, 0, 1, 1,
1.642159, -0.6823811, 2.838272, 1, 0, 0, 1, 1,
1.647414, 1.482764, 1.25486, 0, 0, 0, 1, 1,
1.659104, -0.355112, 2.069084, 0, 0, 0, 1, 1,
1.6806, 0.7989031, 2.010709, 0, 0, 0, 1, 1,
1.69172, 0.5389602, 0.635498, 0, 0, 0, 1, 1,
1.692952, -0.635074, 0.9906968, 0, 0, 0, 1, 1,
1.699314, 1.261482, -0.01884883, 0, 0, 0, 1, 1,
1.701996, 0.8091604, 1.131994, 0, 0, 0, 1, 1,
1.733858, -0.3353969, 2.027015, 1, 1, 1, 1, 1,
1.783214, -0.1809005, 0.4464717, 1, 1, 1, 1, 1,
1.783788, 0.170347, 2.564274, 1, 1, 1, 1, 1,
1.796986, 0.2455945, 0.4212874, 1, 1, 1, 1, 1,
1.810181, 1.180691, 1.125509, 1, 1, 1, 1, 1,
1.842633, 0.4430045, 1.316949, 1, 1, 1, 1, 1,
1.855799, 0.4954544, 3.021853, 1, 1, 1, 1, 1,
1.858784, 0.7673801, 1.585729, 1, 1, 1, 1, 1,
1.88042, 1.054916, 2.531973, 1, 1, 1, 1, 1,
1.897265, -0.1742247, 2.193056, 1, 1, 1, 1, 1,
1.967043, 0.8233459, 1.550995, 1, 1, 1, 1, 1,
1.986137, -1.372787, 2.567219, 1, 1, 1, 1, 1,
1.993691, -0.7787953, 2.411613, 1, 1, 1, 1, 1,
1.997283, -0.8464376, 0.4987105, 1, 1, 1, 1, 1,
1.999199, 0.9468581, 1.60148, 1, 1, 1, 1, 1,
2.080771, -0.8961176, 1.850583, 0, 0, 1, 1, 1,
2.081656, 1.2584, 0.4869646, 1, 0, 0, 1, 1,
2.108846, 0.1472204, 1.595721, 1, 0, 0, 1, 1,
2.166577, -0.2475468, 2.210944, 1, 0, 0, 1, 1,
2.22528, 0.1111786, 0.8849038, 1, 0, 0, 1, 1,
2.238357, 1.153678, 0.5669032, 1, 0, 0, 1, 1,
2.286897, -1.937922, 2.241472, 0, 0, 0, 1, 1,
2.347337, -0.4689341, 1.992232, 0, 0, 0, 1, 1,
2.347606, -0.1056131, 1.520206, 0, 0, 0, 1, 1,
2.351459, 0.8528565, 1.591382, 0, 0, 0, 1, 1,
2.407854, 0.03350041, 1.842288, 0, 0, 0, 1, 1,
2.463982, 0.003675061, 2.590887, 0, 0, 0, 1, 1,
2.505143, -0.489473, 0.02828601, 0, 0, 0, 1, 1,
2.50956, -1.608466, 2.204698, 1, 1, 1, 1, 1,
2.528856, -0.109047, 1.973328, 1, 1, 1, 1, 1,
2.603492, -0.4591126, 0.475043, 1, 1, 1, 1, 1,
2.711627, 2.02206, 0.6974379, 1, 1, 1, 1, 1,
2.83494, -1.324084, 2.822704, 1, 1, 1, 1, 1,
2.841751, 0.5661796, 2.318017, 1, 1, 1, 1, 1,
3.233369, -0.04441326, 0.8453099, 1, 1, 1, 1, 1
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
var radius = 9.403247;
var distance = 33.0285;
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
mvMatrix.translate( -0.1260166, -0.1885109, -0.4321506 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.0285);
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
