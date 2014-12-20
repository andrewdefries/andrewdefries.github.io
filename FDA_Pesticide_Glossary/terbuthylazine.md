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
-3.154077, -0.1068509, -2.107654, 1, 0, 0, 1,
-2.847234, 0.6268286, -0.3497754, 1, 0.007843138, 0, 1,
-2.599723, -0.0925651, -2.365585, 1, 0.01176471, 0, 1,
-2.449317, 0.2535688, -0.4543129, 1, 0.01960784, 0, 1,
-2.431892, 0.4964845, -2.041451, 1, 0.02352941, 0, 1,
-2.343528, -0.1287086, -1.213696, 1, 0.03137255, 0, 1,
-2.274527, 0.59276, -3.397123, 1, 0.03529412, 0, 1,
-2.231231, -1.047603, -0.250145, 1, 0.04313726, 0, 1,
-2.180992, 0.2369979, -2.34692, 1, 0.04705882, 0, 1,
-2.154581, -1.892874, -0.06012323, 1, 0.05490196, 0, 1,
-2.154374, 1.060736, 0.5682203, 1, 0.05882353, 0, 1,
-2.154282, 0.5022014, -1.379515, 1, 0.06666667, 0, 1,
-2.130225, -0.09722979, -2.270279, 1, 0.07058824, 0, 1,
-2.058284, 0.4415873, -0.9341968, 1, 0.07843138, 0, 1,
-2.014525, -0.006749011, -2.227383, 1, 0.08235294, 0, 1,
-1.956672, 0.1380064, -2.307822, 1, 0.09019608, 0, 1,
-1.935577, -0.9390667, -3.154097, 1, 0.09411765, 0, 1,
-1.9207, -0.3002175, -3.972555, 1, 0.1019608, 0, 1,
-1.917236, 1.187402, -0.7714379, 1, 0.1098039, 0, 1,
-1.889792, -0.1280384, -1.555558, 1, 0.1137255, 0, 1,
-1.880042, -1.627211, -2.064788, 1, 0.1215686, 0, 1,
-1.870518, -1.058254, -2.599204, 1, 0.1254902, 0, 1,
-1.8579, 0.3070011, 0.9038149, 1, 0.1333333, 0, 1,
-1.843211, 0.8326893, -2.17668, 1, 0.1372549, 0, 1,
-1.811579, 0.1687707, -0.2202628, 1, 0.145098, 0, 1,
-1.790192, 0.186875, -1.546327, 1, 0.1490196, 0, 1,
-1.786822, 0.9744148, -1.471667, 1, 0.1568628, 0, 1,
-1.774709, -0.8520808, -2.297766, 1, 0.1607843, 0, 1,
-1.77164, -1.419131, -1.923163, 1, 0.1686275, 0, 1,
-1.768757, 1.774441, -2.227286, 1, 0.172549, 0, 1,
-1.764884, 0.1709354, -0.01950753, 1, 0.1803922, 0, 1,
-1.749098, -0.3405984, -2.920907, 1, 0.1843137, 0, 1,
-1.705125, -0.3863572, -3.517541, 1, 0.1921569, 0, 1,
-1.703418, 0.8776842, -0.8809475, 1, 0.1960784, 0, 1,
-1.698157, 1.314069, 1.327655, 1, 0.2039216, 0, 1,
-1.693938, 0.83686, -1.518036, 1, 0.2117647, 0, 1,
-1.690104, 0.3747182, -2.757143, 1, 0.2156863, 0, 1,
-1.684129, -0.6649494, -3.561785, 1, 0.2235294, 0, 1,
-1.67246, -0.7502937, -3.928852, 1, 0.227451, 0, 1,
-1.665827, -1.092287, -1.091219, 1, 0.2352941, 0, 1,
-1.650941, -0.002083422, -1.493405, 1, 0.2392157, 0, 1,
-1.599639, 0.7127081, -0.09006634, 1, 0.2470588, 0, 1,
-1.573457, 0.01803659, -2.044981, 1, 0.2509804, 0, 1,
-1.555031, 0.5761467, -2.699663, 1, 0.2588235, 0, 1,
-1.553393, -1.10848, -3.452325, 1, 0.2627451, 0, 1,
-1.550837, 1.118418, -0.5958425, 1, 0.2705882, 0, 1,
-1.546983, 0.4009583, -0.3420512, 1, 0.2745098, 0, 1,
-1.526508, 2.97967, -1.811428, 1, 0.282353, 0, 1,
-1.519647, -0.3737169, -2.393337, 1, 0.2862745, 0, 1,
-1.517776, -2.200618, -3.39272, 1, 0.2941177, 0, 1,
-1.510717, 0.05301425, -1.937855, 1, 0.3019608, 0, 1,
-1.507097, 0.3738231, -1.023544, 1, 0.3058824, 0, 1,
-1.498999, 0.7803059, -0.4652163, 1, 0.3137255, 0, 1,
-1.490365, 0.9807271, -1.59441, 1, 0.3176471, 0, 1,
-1.482935, 1.406484, -1.049483, 1, 0.3254902, 0, 1,
-1.481477, -1.014906, -0.7496718, 1, 0.3294118, 0, 1,
-1.469788, 1.12375, -1.448678, 1, 0.3372549, 0, 1,
-1.468342, 0.1702112, -0.250516, 1, 0.3411765, 0, 1,
-1.456318, 0.1641438, -0.8549826, 1, 0.3490196, 0, 1,
-1.447922, -0.1029281, -2.381254, 1, 0.3529412, 0, 1,
-1.44753, -0.9158705, -1.140429, 1, 0.3607843, 0, 1,
-1.428082, -1.084183, -1.162659, 1, 0.3647059, 0, 1,
-1.420975, -0.7772012, -1.607015, 1, 0.372549, 0, 1,
-1.408116, -1.027802, -2.381804, 1, 0.3764706, 0, 1,
-1.398627, 0.9899669, -2.811506, 1, 0.3843137, 0, 1,
-1.387719, 0.9841549, -1.719721, 1, 0.3882353, 0, 1,
-1.379021, 0.3798967, -1.623167, 1, 0.3960784, 0, 1,
-1.369944, -2.438466, -2.420167, 1, 0.4039216, 0, 1,
-1.360871, -1.492483, -1.084055, 1, 0.4078431, 0, 1,
-1.344639, -1.652741, -2.652908, 1, 0.4156863, 0, 1,
-1.333614, -0.2524464, -3.948669, 1, 0.4196078, 0, 1,
-1.32154, -2.165263, -2.334772, 1, 0.427451, 0, 1,
-1.318802, 1.257284, 0.406609, 1, 0.4313726, 0, 1,
-1.316147, -0.8678923, -0.5630214, 1, 0.4392157, 0, 1,
-1.304186, 0.262222, -2.514258, 1, 0.4431373, 0, 1,
-1.298803, 0.01124321, -0.8416146, 1, 0.4509804, 0, 1,
-1.29453, -1.20222, -3.428558, 1, 0.454902, 0, 1,
-1.285039, 1.428457, -2.781728, 1, 0.4627451, 0, 1,
-1.280141, -1.281569, -3.05943, 1, 0.4666667, 0, 1,
-1.275274, 0.2961842, -1.75592, 1, 0.4745098, 0, 1,
-1.26735, -1.305997, -1.90592, 1, 0.4784314, 0, 1,
-1.263736, 0.3982782, 0.7477321, 1, 0.4862745, 0, 1,
-1.257875, -0.01392029, -2.706704, 1, 0.4901961, 0, 1,
-1.252738, 2.649525, 0.6228077, 1, 0.4980392, 0, 1,
-1.239165, -0.5644251, -0.2632949, 1, 0.5058824, 0, 1,
-1.219719, 0.9116779, -1.58174, 1, 0.509804, 0, 1,
-1.214358, -0.1113843, -1.273987, 1, 0.5176471, 0, 1,
-1.21062, 0.5465432, -0.2945007, 1, 0.5215687, 0, 1,
-1.209839, -1.768374, -0.5721648, 1, 0.5294118, 0, 1,
-1.204171, 0.4217133, -2.468946, 1, 0.5333334, 0, 1,
-1.190922, 0.2328088, -1.384108, 1, 0.5411765, 0, 1,
-1.18602, 0.6051109, -0.3000421, 1, 0.5450981, 0, 1,
-1.175273, 0.4578954, -1.52597, 1, 0.5529412, 0, 1,
-1.174921, 1.340992, 0.3505051, 1, 0.5568628, 0, 1,
-1.169526, -0.2949088, -0.8530359, 1, 0.5647059, 0, 1,
-1.161386, -1.490978, -2.116602, 1, 0.5686275, 0, 1,
-1.148568, 0.8654487, -0.01571897, 1, 0.5764706, 0, 1,
-1.148292, -0.09202091, -2.002205, 1, 0.5803922, 0, 1,
-1.143427, -1.070558, -3.9122, 1, 0.5882353, 0, 1,
-1.140107, 0.8702325, 0.01212986, 1, 0.5921569, 0, 1,
-1.13821, 0.1111658, -1.451894, 1, 0.6, 0, 1,
-1.134213, -0.2653644, -3.815734, 1, 0.6078432, 0, 1,
-1.132829, 1.11108, -0.5054616, 1, 0.6117647, 0, 1,
-1.123499, 1.244833, -1.836241, 1, 0.6196079, 0, 1,
-1.123006, 0.9444551, -0.8669696, 1, 0.6235294, 0, 1,
-1.121115, -0.8856123, -3.405771, 1, 0.6313726, 0, 1,
-1.101713, 0.6946481, -1.564221, 1, 0.6352941, 0, 1,
-1.094925, 1.103556, 0.2806804, 1, 0.6431373, 0, 1,
-1.091546, -1.422656, -3.204771, 1, 0.6470588, 0, 1,
-1.088913, -0.9099084, -2.320041, 1, 0.654902, 0, 1,
-1.087771, -0.9924168, -0.2292997, 1, 0.6588235, 0, 1,
-1.084182, 1.21741, -1.682301, 1, 0.6666667, 0, 1,
-1.071647, -0.06376133, -1.931597, 1, 0.6705883, 0, 1,
-1.069587, -0.03928283, -1.012405, 1, 0.6784314, 0, 1,
-1.067483, 2.020543, 0.06397758, 1, 0.682353, 0, 1,
-1.060166, -0.3633751, -3.022834, 1, 0.6901961, 0, 1,
-1.059823, -0.1234402, -2.223251, 1, 0.6941177, 0, 1,
-1.051557, -0.1070539, -1.633267, 1, 0.7019608, 0, 1,
-1.049406, 1.227509, -0.8340667, 1, 0.7098039, 0, 1,
-1.045638, 2.06366, -0.9231575, 1, 0.7137255, 0, 1,
-1.034414, 0.06420164, -1.648497, 1, 0.7215686, 0, 1,
-1.029715, 0.7543097, -0.7914103, 1, 0.7254902, 0, 1,
-1.027909, 1.558896, -1.229499, 1, 0.7333333, 0, 1,
-1.026965, -0.3332377, -2.763966, 1, 0.7372549, 0, 1,
-1.024696, 0.006865076, -2.127435, 1, 0.7450981, 0, 1,
-1.014905, 0.9408775, -0.9529478, 1, 0.7490196, 0, 1,
-1.010955, -0.7328718, -2.8215, 1, 0.7568628, 0, 1,
-1.005278, -0.182818, -0.9280789, 1, 0.7607843, 0, 1,
-1.002391, 0.6592925, -0.8693612, 1, 0.7686275, 0, 1,
-0.9944764, -2.36623, -2.179278, 1, 0.772549, 0, 1,
-0.994274, -0.1501205, -2.953659, 1, 0.7803922, 0, 1,
-0.9929628, 0.01147142, -0.8316558, 1, 0.7843137, 0, 1,
-0.9905326, -0.5317422, -1.606032, 1, 0.7921569, 0, 1,
-0.9896404, 1.744411, -0.2493872, 1, 0.7960784, 0, 1,
-0.9879643, -0.3252719, -1.585361, 1, 0.8039216, 0, 1,
-0.9841952, -0.4175917, -2.413254, 1, 0.8117647, 0, 1,
-0.9827828, -2.181672, -1.930012, 1, 0.8156863, 0, 1,
-0.9807351, -0.1000563, -0.2612549, 1, 0.8235294, 0, 1,
-0.9788027, 0.3369179, -2.537524, 1, 0.827451, 0, 1,
-0.9787039, 1.236598, -0.02679934, 1, 0.8352941, 0, 1,
-0.9743127, -0.3142573, -0.4197481, 1, 0.8392157, 0, 1,
-0.9728634, 0.5435114, 1.486761, 1, 0.8470588, 0, 1,
-0.9723948, 0.1643765, -2.041069, 1, 0.8509804, 0, 1,
-0.9717299, -0.8536086, -1.757625, 1, 0.8588235, 0, 1,
-0.9686362, -0.4160067, -2.31725, 1, 0.8627451, 0, 1,
-0.967428, -0.1099598, -1.20811, 1, 0.8705882, 0, 1,
-0.9608746, -2.0038, -3.656045, 1, 0.8745098, 0, 1,
-0.9578553, -0.7733662, -0.1675453, 1, 0.8823529, 0, 1,
-0.9474627, 1.226261, -1.812362, 1, 0.8862745, 0, 1,
-0.9439132, 0.1617043, -2.174331, 1, 0.8941177, 0, 1,
-0.9438264, 0.1039583, -0.7209324, 1, 0.8980392, 0, 1,
-0.9326567, 0.7456773, -0.6821242, 1, 0.9058824, 0, 1,
-0.9319375, 0.3833611, 0.7304594, 1, 0.9137255, 0, 1,
-0.9258106, -0.7302204, -0.2082387, 1, 0.9176471, 0, 1,
-0.9235986, -0.6241348, -0.9513728, 1, 0.9254902, 0, 1,
-0.922981, 0.6657596, -0.7731059, 1, 0.9294118, 0, 1,
-0.9222984, -0.2426497, -1.765919, 1, 0.9372549, 0, 1,
-0.9212881, 0.2815649, -1.070496, 1, 0.9411765, 0, 1,
-0.918874, 0.407922, -1.860313, 1, 0.9490196, 0, 1,
-0.9186637, -0.3108459, -2.866456, 1, 0.9529412, 0, 1,
-0.9176563, 0.228246, -1.261654, 1, 0.9607843, 0, 1,
-0.9094344, 0.00814385, -0.9148015, 1, 0.9647059, 0, 1,
-0.9082766, -0.8612505, -2.974147, 1, 0.972549, 0, 1,
-0.9079103, -0.6602408, -2.251854, 1, 0.9764706, 0, 1,
-0.9031091, -0.2018538, -1.698902, 1, 0.9843137, 0, 1,
-0.9030436, -0.5609947, -1.622009, 1, 0.9882353, 0, 1,
-0.8971611, -0.4286221, -2.698932, 1, 0.9960784, 0, 1,
-0.8941908, -0.3876154, -2.449612, 0.9960784, 1, 0, 1,
-0.8907425, 0.1902033, -0.9236587, 0.9921569, 1, 0, 1,
-0.8899626, -1.680318, -2.950883, 0.9843137, 1, 0, 1,
-0.8885704, 0.07668424, -1.947554, 0.9803922, 1, 0, 1,
-0.8850292, 1.172355, -1.954094, 0.972549, 1, 0, 1,
-0.8840902, 1.582941, 1.199911, 0.9686275, 1, 0, 1,
-0.8835686, 0.3971084, -1.216486, 0.9607843, 1, 0, 1,
-0.881131, -1.571501, -3.625299, 0.9568627, 1, 0, 1,
-0.8786525, -0.5586292, -0.9080044, 0.9490196, 1, 0, 1,
-0.8760118, 0.5097522, -1.583827, 0.945098, 1, 0, 1,
-0.8714432, 0.4213477, -2.545747, 0.9372549, 1, 0, 1,
-0.8686513, 2.490586, 0.6878847, 0.9333333, 1, 0, 1,
-0.8638898, -0.4264432, -2.525878, 0.9254902, 1, 0, 1,
-0.8621106, 0.2009076, -0.8175016, 0.9215686, 1, 0, 1,
-0.8617171, 0.2302536, -2.593246, 0.9137255, 1, 0, 1,
-0.8600463, 0.5307219, -0.01817141, 0.9098039, 1, 0, 1,
-0.858604, 2.3649, -1.350784, 0.9019608, 1, 0, 1,
-0.8567399, -1.481138, -3.493378, 0.8941177, 1, 0, 1,
-0.854946, 0.3772365, -0.7603068, 0.8901961, 1, 0, 1,
-0.8508539, -0.3228861, -0.200461, 0.8823529, 1, 0, 1,
-0.8488389, -0.9822823, -2.363092, 0.8784314, 1, 0, 1,
-0.8476571, 2.339042, -1.358641, 0.8705882, 1, 0, 1,
-0.842882, 1.961991, 0.3181648, 0.8666667, 1, 0, 1,
-0.8424699, -0.2969201, -0.8227823, 0.8588235, 1, 0, 1,
-0.8410641, -0.4317475, -2.277853, 0.854902, 1, 0, 1,
-0.8348663, 1.464892, 0.6771521, 0.8470588, 1, 0, 1,
-0.8341731, -0.3945831, -2.175394, 0.8431373, 1, 0, 1,
-0.8331817, -0.1291653, -2.498771, 0.8352941, 1, 0, 1,
-0.8323159, -0.7309486, -2.135896, 0.8313726, 1, 0, 1,
-0.83013, -0.5193297, -1.611024, 0.8235294, 1, 0, 1,
-0.8208006, -0.4762454, -1.611369, 0.8196079, 1, 0, 1,
-0.8189348, 0.6426935, -1.775976, 0.8117647, 1, 0, 1,
-0.8158646, 0.8117757, -1.92941, 0.8078431, 1, 0, 1,
-0.8145585, 0.8806437, -0.742353, 0.8, 1, 0, 1,
-0.8117554, -0.6772073, -2.522834, 0.7921569, 1, 0, 1,
-0.8081849, 0.597836, -0.5780599, 0.7882353, 1, 0, 1,
-0.7975038, -1.910107, -2.413554, 0.7803922, 1, 0, 1,
-0.7961534, 1.182768, -1.182948, 0.7764706, 1, 0, 1,
-0.7925307, 0.220236, -1.803078, 0.7686275, 1, 0, 1,
-0.780324, 0.1149731, -3.020732, 0.7647059, 1, 0, 1,
-0.7772213, -0.4240879, -0.7084332, 0.7568628, 1, 0, 1,
-0.7771531, -0.5976241, -3.966544, 0.7529412, 1, 0, 1,
-0.7740735, -1.067812, -3.008416, 0.7450981, 1, 0, 1,
-0.7739865, 0.098203, -2.352785, 0.7411765, 1, 0, 1,
-0.7666191, -0.102929, -2.420245, 0.7333333, 1, 0, 1,
-0.7657841, 0.5686945, -1.119818, 0.7294118, 1, 0, 1,
-0.7640921, -2.252136, -3.9837, 0.7215686, 1, 0, 1,
-0.7624297, 2.07148, -0.05030348, 0.7176471, 1, 0, 1,
-0.7550915, 0.9987054, 0.2007078, 0.7098039, 1, 0, 1,
-0.754899, 0.7635495, -0.3812541, 0.7058824, 1, 0, 1,
-0.7455329, 0.8657485, -2.646015, 0.6980392, 1, 0, 1,
-0.7448494, 0.6718993, -0.4255872, 0.6901961, 1, 0, 1,
-0.74446, -0.5538668, -2.402796, 0.6862745, 1, 0, 1,
-0.7302553, 0.5028881, -2.591292, 0.6784314, 1, 0, 1,
-0.7298604, -0.1462322, -2.730204, 0.6745098, 1, 0, 1,
-0.7253267, 0.460937, -1.163693, 0.6666667, 1, 0, 1,
-0.7240067, -0.3156483, -0.7935817, 0.6627451, 1, 0, 1,
-0.7230275, -2.137471, -2.727047, 0.654902, 1, 0, 1,
-0.7179466, 0.7997748, -2.077524, 0.6509804, 1, 0, 1,
-0.7179154, -0.9137823, -2.962641, 0.6431373, 1, 0, 1,
-0.7171299, 1.268267, -0.137263, 0.6392157, 1, 0, 1,
-0.7163355, -0.8008369, -0.6903593, 0.6313726, 1, 0, 1,
-0.7150831, -2.528423, -4.439124, 0.627451, 1, 0, 1,
-0.7142752, -0.147742, -2.834834, 0.6196079, 1, 0, 1,
-0.7098405, 0.1334217, -2.856193, 0.6156863, 1, 0, 1,
-0.7095255, -0.3680841, -3.052977, 0.6078432, 1, 0, 1,
-0.7092616, -0.2707834, -2.578716, 0.6039216, 1, 0, 1,
-0.7079815, 0.2031054, -1.95004, 0.5960785, 1, 0, 1,
-0.7036797, -1.004778, -2.569993, 0.5882353, 1, 0, 1,
-0.6994337, -1.477217, -2.534395, 0.5843138, 1, 0, 1,
-0.6982536, -0.2056713, -1.133929, 0.5764706, 1, 0, 1,
-0.6952005, 0.5394112, -1.653328, 0.572549, 1, 0, 1,
-0.6944259, 0.07449067, -0.339512, 0.5647059, 1, 0, 1,
-0.6928406, -0.5154236, -4.03485, 0.5607843, 1, 0, 1,
-0.6906418, 0.5230694, -0.9261541, 0.5529412, 1, 0, 1,
-0.6854527, -1.643231, -3.815844, 0.5490196, 1, 0, 1,
-0.6815847, 0.3155227, -0.1129645, 0.5411765, 1, 0, 1,
-0.6792406, -0.474075, -3.357875, 0.5372549, 1, 0, 1,
-0.678795, -0.6844953, -0.5509469, 0.5294118, 1, 0, 1,
-0.6779575, -0.1782547, -0.6346583, 0.5254902, 1, 0, 1,
-0.6658193, -0.1365249, -2.237406, 0.5176471, 1, 0, 1,
-0.660569, 0.9547589, 0.02291484, 0.5137255, 1, 0, 1,
-0.6518837, 0.3595098, -0.3993353, 0.5058824, 1, 0, 1,
-0.6509973, -1.571259, -1.777468, 0.5019608, 1, 0, 1,
-0.6482791, -0.7096798, -3.168872, 0.4941176, 1, 0, 1,
-0.6347828, -1.517222, -3.524641, 0.4862745, 1, 0, 1,
-0.6317382, 0.1815356, -0.5083785, 0.4823529, 1, 0, 1,
-0.6316058, 0.4867396, -1.558459, 0.4745098, 1, 0, 1,
-0.6314628, -0.3972411, -1.625058, 0.4705882, 1, 0, 1,
-0.6257782, 1.332859, 0.4117427, 0.4627451, 1, 0, 1,
-0.6157771, -0.1363596, -0.8062856, 0.4588235, 1, 0, 1,
-0.6124498, 0.3920021, -1.829357, 0.4509804, 1, 0, 1,
-0.61192, -0.102654, -2.629556, 0.4470588, 1, 0, 1,
-0.607945, -1.269498, -4.890902, 0.4392157, 1, 0, 1,
-0.601038, 0.2456123, -3.014901, 0.4352941, 1, 0, 1,
-0.5994653, 1.0443, -0.3703041, 0.427451, 1, 0, 1,
-0.5964817, 0.641794, -0.6515158, 0.4235294, 1, 0, 1,
-0.5924819, 0.222321, -1.98241, 0.4156863, 1, 0, 1,
-0.5920848, 0.02005518, -0.002620906, 0.4117647, 1, 0, 1,
-0.5889742, 0.01769689, -0.9612621, 0.4039216, 1, 0, 1,
-0.5888598, 1.275567, -0.5791898, 0.3960784, 1, 0, 1,
-0.5887228, -1.359471, -4.129369, 0.3921569, 1, 0, 1,
-0.5885161, -0.197437, -2.681082, 0.3843137, 1, 0, 1,
-0.5869383, 0.9689932, -0.07568631, 0.3803922, 1, 0, 1,
-0.5867554, -1.938879, -3.127628, 0.372549, 1, 0, 1,
-0.5800542, 0.594561, -1.835741, 0.3686275, 1, 0, 1,
-0.5800158, -2.172265, -2.190414, 0.3607843, 1, 0, 1,
-0.5738636, -0.1674587, -2.34695, 0.3568628, 1, 0, 1,
-0.5731975, 0.9034965, -0.3627957, 0.3490196, 1, 0, 1,
-0.5653803, -0.4655828, -1.796079, 0.345098, 1, 0, 1,
-0.5653013, 1.017513, -0.249815, 0.3372549, 1, 0, 1,
-0.5640268, 0.7571622, -0.3744418, 0.3333333, 1, 0, 1,
-0.5596637, -1.040896, -3.548814, 0.3254902, 1, 0, 1,
-0.5545245, -2.341435, -3.635952, 0.3215686, 1, 0, 1,
-0.5512785, -1.808946, -3.231662, 0.3137255, 1, 0, 1,
-0.5491414, 0.2941732, -0.7977142, 0.3098039, 1, 0, 1,
-0.5484133, -0.7691174, -3.315475, 0.3019608, 1, 0, 1,
-0.5423138, 0.1569648, -1.482069, 0.2941177, 1, 0, 1,
-0.540525, 0.6950328, -1.276729, 0.2901961, 1, 0, 1,
-0.532015, 0.06971029, -0.975854, 0.282353, 1, 0, 1,
-0.5314106, -0.387019, -2.808763, 0.2784314, 1, 0, 1,
-0.5268565, 1.564464, -0.9807401, 0.2705882, 1, 0, 1,
-0.5252561, -0.09000634, -2.882825, 0.2666667, 1, 0, 1,
-0.5242344, 1.07618, -1.516936, 0.2588235, 1, 0, 1,
-0.5224941, 0.3835251, -2.888315, 0.254902, 1, 0, 1,
-0.5218748, -0.3008677, -1.466804, 0.2470588, 1, 0, 1,
-0.5208582, -1.174704, -3.261578, 0.2431373, 1, 0, 1,
-0.5147044, 0.4724638, -1.403238, 0.2352941, 1, 0, 1,
-0.5133926, -1.954989, -3.4555, 0.2313726, 1, 0, 1,
-0.5130654, -0.9320198, -2.248566, 0.2235294, 1, 0, 1,
-0.5105296, -0.9842729, -3.627993, 0.2196078, 1, 0, 1,
-0.5071768, 1.215544, -0.3487239, 0.2117647, 1, 0, 1,
-0.5021173, 0.3389683, -1.169046, 0.2078431, 1, 0, 1,
-0.4989165, -1.106934, -3.409392, 0.2, 1, 0, 1,
-0.4985247, 0.5141727, 0.06551567, 0.1921569, 1, 0, 1,
-0.497818, 0.230808, 0.2869498, 0.1882353, 1, 0, 1,
-0.4965252, 1.402492, -0.5075909, 0.1803922, 1, 0, 1,
-0.4930188, -1.004687, -1.109224, 0.1764706, 1, 0, 1,
-0.4926008, 0.4111834, -2.858603, 0.1686275, 1, 0, 1,
-0.4917592, 2.629309, -0.1959271, 0.1647059, 1, 0, 1,
-0.4877924, 0.838002, -0.09706497, 0.1568628, 1, 0, 1,
-0.483152, -0.05620703, -1.458134, 0.1529412, 1, 0, 1,
-0.4764255, 0.9275889, 1.300245, 0.145098, 1, 0, 1,
-0.4715892, 0.567291, -0.7407709, 0.1411765, 1, 0, 1,
-0.4649048, -1.503716, -1.925321, 0.1333333, 1, 0, 1,
-0.4631578, -0.3252394, -2.971348, 0.1294118, 1, 0, 1,
-0.4609154, 0.1820739, -1.758582, 0.1215686, 1, 0, 1,
-0.4528998, -0.5249857, -2.972193, 0.1176471, 1, 0, 1,
-0.4505096, 0.1807802, -2.828405, 0.1098039, 1, 0, 1,
-0.448752, -0.00106914, -2.024107, 0.1058824, 1, 0, 1,
-0.446427, -0.4598952, -3.208256, 0.09803922, 1, 0, 1,
-0.4454593, -0.6803677, -3.975128, 0.09019608, 1, 0, 1,
-0.4437127, 0.2889569, -1.646421, 0.08627451, 1, 0, 1,
-0.4432342, -0.06838995, -0.8754517, 0.07843138, 1, 0, 1,
-0.4311768, 0.8066323, 0.2636758, 0.07450981, 1, 0, 1,
-0.4304152, 1.287881, 0.5988506, 0.06666667, 1, 0, 1,
-0.4295308, 0.3748028, -1.099198, 0.0627451, 1, 0, 1,
-0.4292967, 0.3918331, 0.5072281, 0.05490196, 1, 0, 1,
-0.426023, 0.7735863, 0.8919432, 0.05098039, 1, 0, 1,
-0.4251069, -1.880447, -2.577224, 0.04313726, 1, 0, 1,
-0.4208066, 0.1565735, -0.314291, 0.03921569, 1, 0, 1,
-0.4205998, 0.8867639, 0.5618988, 0.03137255, 1, 0, 1,
-0.4204591, -0.2939256, -2.929363, 0.02745098, 1, 0, 1,
-0.415, -0.8873764, -2.021983, 0.01960784, 1, 0, 1,
-0.4133927, 0.3007663, -0.03539685, 0.01568628, 1, 0, 1,
-0.4097246, -0.2464301, -3.223722, 0.007843138, 1, 0, 1,
-0.4086078, 1.411481, 1.064428, 0.003921569, 1, 0, 1,
-0.4073356, 0.9780786, -1.569375, 0, 1, 0.003921569, 1,
-0.4057787, 3.193124, -0.4358719, 0, 1, 0.01176471, 1,
-0.40334, -1.329143, -0.9514688, 0, 1, 0.01568628, 1,
-0.4017251, -0.193045, -0.4724399, 0, 1, 0.02352941, 1,
-0.3973186, -0.4724709, -3.288392, 0, 1, 0.02745098, 1,
-0.3917546, 3.083222, -2.052965, 0, 1, 0.03529412, 1,
-0.3904558, 0.1618334, -1.550863, 0, 1, 0.03921569, 1,
-0.3893242, -0.1029262, -1.346686, 0, 1, 0.04705882, 1,
-0.387973, 0.3896171, -1.627196, 0, 1, 0.05098039, 1,
-0.3876209, -1.539209, -3.618262, 0, 1, 0.05882353, 1,
-0.3858063, 1.305102, -0.8853961, 0, 1, 0.0627451, 1,
-0.3832727, 2.372329, -0.3052422, 0, 1, 0.07058824, 1,
-0.3752384, 0.691778, -0.4175118, 0, 1, 0.07450981, 1,
-0.3741668, 0.6647728, -1.944445, 0, 1, 0.08235294, 1,
-0.3726446, 1.517702, 0.1355224, 0, 1, 0.08627451, 1,
-0.3642357, 0.2599732, 0.1735344, 0, 1, 0.09411765, 1,
-0.3615436, -0.9383141, -4.002987, 0, 1, 0.1019608, 1,
-0.3611478, 1.0718, -0.1160055, 0, 1, 0.1058824, 1,
-0.3565786, 0.4754686, -1.256072, 0, 1, 0.1137255, 1,
-0.344417, 0.3166428, -0.7302049, 0, 1, 0.1176471, 1,
-0.3432642, 0.526955, -1.265498, 0, 1, 0.1254902, 1,
-0.3411517, 0.3531881, -1.431228, 0, 1, 0.1294118, 1,
-0.3373446, 0.5371042, -0.07387544, 0, 1, 0.1372549, 1,
-0.3356566, 0.3692746, 0.199036, 0, 1, 0.1411765, 1,
-0.3347468, -2.014843, -3.717342, 0, 1, 0.1490196, 1,
-0.3317722, -0.6167411, -2.658664, 0, 1, 0.1529412, 1,
-0.3306029, 2.188888, 1.352443, 0, 1, 0.1607843, 1,
-0.3293717, 0.9761468, 0.4273419, 0, 1, 0.1647059, 1,
-0.3293676, 0.9509682, 0.02836961, 0, 1, 0.172549, 1,
-0.3232411, 0.6003442, -0.3519116, 0, 1, 0.1764706, 1,
-0.3204559, 0.9073507, 0.2414668, 0, 1, 0.1843137, 1,
-0.3189875, 0.08527754, -2.567795, 0, 1, 0.1882353, 1,
-0.3180711, 1.136031, 0.505597, 0, 1, 0.1960784, 1,
-0.3141017, 0.7159522, 0.4412783, 0, 1, 0.2039216, 1,
-0.3118282, 0.4144393, -0.4163277, 0, 1, 0.2078431, 1,
-0.3114457, -0.4627149, -2.712327, 0, 1, 0.2156863, 1,
-0.3095694, 0.03164553, -0.07400083, 0, 1, 0.2196078, 1,
-0.3093648, 1.090347, 0.4934421, 0, 1, 0.227451, 1,
-0.3085252, 0.5202301, 0.3381441, 0, 1, 0.2313726, 1,
-0.3072597, 0.706875, -1.384318, 0, 1, 0.2392157, 1,
-0.3056825, -1.54223, -3.65847, 0, 1, 0.2431373, 1,
-0.3046188, 0.1200345, -0.5308291, 0, 1, 0.2509804, 1,
-0.3001166, -0.8215176, -3.00345, 0, 1, 0.254902, 1,
-0.2962708, -0.1912344, -2.186063, 0, 1, 0.2627451, 1,
-0.2958264, -0.7219021, -3.541604, 0, 1, 0.2666667, 1,
-0.2909531, -0.04372191, -1.408996, 0, 1, 0.2745098, 1,
-0.2907034, -0.03700666, -2.586536, 0, 1, 0.2784314, 1,
-0.2906412, -0.158103, -2.748981, 0, 1, 0.2862745, 1,
-0.2894364, -0.6135114, -2.843249, 0, 1, 0.2901961, 1,
-0.2884208, -0.09640829, -2.256827, 0, 1, 0.2980392, 1,
-0.287666, -0.1090646, -2.683556, 0, 1, 0.3058824, 1,
-0.2866468, 1.579872, 2.366976, 0, 1, 0.3098039, 1,
-0.2846665, 0.3032134, -0.2213288, 0, 1, 0.3176471, 1,
-0.2841172, -0.4656666, -3.975526, 0, 1, 0.3215686, 1,
-0.2832207, -0.7746459, -2.861793, 0, 1, 0.3294118, 1,
-0.2832113, 0.7220896, -0.05626745, 0, 1, 0.3333333, 1,
-0.282325, -0.2878993, -3.314131, 0, 1, 0.3411765, 1,
-0.277048, 1.023886, -1.052562, 0, 1, 0.345098, 1,
-0.2743109, 0.9196303, -0.9896095, 0, 1, 0.3529412, 1,
-0.2742553, -1.227248, -4.224515, 0, 1, 0.3568628, 1,
-0.2720399, -0.2172324, -1.305835, 0, 1, 0.3647059, 1,
-0.2700709, -0.4960636, -2.395244, 0, 1, 0.3686275, 1,
-0.2652824, 0.3274445, 0.008240398, 0, 1, 0.3764706, 1,
-0.2576409, 1.029042, 1.340161, 0, 1, 0.3803922, 1,
-0.2504633, 0.9099257, -1.390712, 0, 1, 0.3882353, 1,
-0.2502685, 0.191387, -0.4614793, 0, 1, 0.3921569, 1,
-0.2471123, 0.4189231, -0.7919982, 0, 1, 0.4, 1,
-0.246256, 0.5468252, 1.065487, 0, 1, 0.4078431, 1,
-0.2414013, 0.748976, -0.1556426, 0, 1, 0.4117647, 1,
-0.2404872, -1.247598, -2.928868, 0, 1, 0.4196078, 1,
-0.2401009, 0.8869673, 1.434229, 0, 1, 0.4235294, 1,
-0.233568, 1.059213, -1.860715, 0, 1, 0.4313726, 1,
-0.2328805, 1.323828, -0.3279937, 0, 1, 0.4352941, 1,
-0.229547, 0.5120755, 1.02168, 0, 1, 0.4431373, 1,
-0.2287596, 0.4612753, 0.1790007, 0, 1, 0.4470588, 1,
-0.2283641, -1.170839, -2.71667, 0, 1, 0.454902, 1,
-0.2282852, -2.375802, -2.448033, 0, 1, 0.4588235, 1,
-0.2282223, -0.06919864, -2.924732, 0, 1, 0.4666667, 1,
-0.2258262, -2.249744, -2.720704, 0, 1, 0.4705882, 1,
-0.2250164, 0.2397711, -1.987025, 0, 1, 0.4784314, 1,
-0.2220019, -0.7286793, -3.587092, 0, 1, 0.4823529, 1,
-0.2196926, -1.992955, -3.375802, 0, 1, 0.4901961, 1,
-0.2195094, 0.3103672, -2.485622, 0, 1, 0.4941176, 1,
-0.2175547, 1.19704, 0.272457, 0, 1, 0.5019608, 1,
-0.2165095, 0.6213809, -1.694053, 0, 1, 0.509804, 1,
-0.212543, 0.1414044, -0.7962445, 0, 1, 0.5137255, 1,
-0.2110507, 0.9517964, -1.487023, 0, 1, 0.5215687, 1,
-0.2104649, -0.5647517, -2.250604, 0, 1, 0.5254902, 1,
-0.2088621, 2.416855, -0.01490726, 0, 1, 0.5333334, 1,
-0.2019192, -0.6335342, -4.982447, 0, 1, 0.5372549, 1,
-0.2018506, 1.040334, 0.4080544, 0, 1, 0.5450981, 1,
-0.1983114, -0.04449815, -3.249437, 0, 1, 0.5490196, 1,
-0.1965875, 0.6062464, 0.2242411, 0, 1, 0.5568628, 1,
-0.1939649, -1.362444, -2.689284, 0, 1, 0.5607843, 1,
-0.1938089, 0.2129267, -0.8278472, 0, 1, 0.5686275, 1,
-0.1908345, -1.421695, -3.059104, 0, 1, 0.572549, 1,
-0.186649, -0.2472344, -1.634286, 0, 1, 0.5803922, 1,
-0.1747778, 0.6997724, 0.530598, 0, 1, 0.5843138, 1,
-0.169283, -0.07716973, -2.073936, 0, 1, 0.5921569, 1,
-0.167262, 0.2518502, -0.6062565, 0, 1, 0.5960785, 1,
-0.1649366, -0.8465788, -2.190027, 0, 1, 0.6039216, 1,
-0.1615442, -1.232064, -2.404118, 0, 1, 0.6117647, 1,
-0.1613337, 0.2683967, -0.191824, 0, 1, 0.6156863, 1,
-0.1607898, 0.6276932, -1.262009, 0, 1, 0.6235294, 1,
-0.1602802, -0.7931144, -2.745067, 0, 1, 0.627451, 1,
-0.1599663, 1.979902, 0.9113743, 0, 1, 0.6352941, 1,
-0.1592197, 0.773115, -2.109502, 0, 1, 0.6392157, 1,
-0.1588801, -0.5588124, -2.023915, 0, 1, 0.6470588, 1,
-0.1531292, -0.1546737, -2.798717, 0, 1, 0.6509804, 1,
-0.1520328, -0.2052665, -2.877533, 0, 1, 0.6588235, 1,
-0.1453467, -1.161245, -3.490945, 0, 1, 0.6627451, 1,
-0.140748, -1.252961, -3.606867, 0, 1, 0.6705883, 1,
-0.1398997, 0.2178516, -1.769267, 0, 1, 0.6745098, 1,
-0.1391494, -0.5748002, -2.217176, 0, 1, 0.682353, 1,
-0.1391162, -1.667954, -2.816992, 0, 1, 0.6862745, 1,
-0.1378777, 1.146674, -0.4613033, 0, 1, 0.6941177, 1,
-0.1366641, 0.3006119, -2.092384, 0, 1, 0.7019608, 1,
-0.1339069, 1.865689, -1.276171, 0, 1, 0.7058824, 1,
-0.1308572, -0.4452414, -0.1730188, 0, 1, 0.7137255, 1,
-0.1308029, -1.115881, -5.285326, 0, 1, 0.7176471, 1,
-0.130597, -0.002449364, -1.670686, 0, 1, 0.7254902, 1,
-0.1284249, -1.047725, -2.22227, 0, 1, 0.7294118, 1,
-0.1275573, 0.2414112, -0.9259501, 0, 1, 0.7372549, 1,
-0.1230931, 1.234077, 1.394961, 0, 1, 0.7411765, 1,
-0.1211497, -1.098403, -4.52458, 0, 1, 0.7490196, 1,
-0.117618, -2.443371, -2.529886, 0, 1, 0.7529412, 1,
-0.1168575, -1.291356, -3.904793, 0, 1, 0.7607843, 1,
-0.1158505, -1.988608, -4.331169, 0, 1, 0.7647059, 1,
-0.1095621, 0.537031, 0.4562694, 0, 1, 0.772549, 1,
-0.1033559, 0.1384928, 0.3404828, 0, 1, 0.7764706, 1,
-0.09815934, -0.6355517, -3.415734, 0, 1, 0.7843137, 1,
-0.0979508, -0.04780656, -2.662251, 0, 1, 0.7882353, 1,
-0.09735028, -0.4672676, -1.645998, 0, 1, 0.7960784, 1,
-0.0944488, 0.6967238, -0.795038, 0, 1, 0.8039216, 1,
-0.09357148, -0.0203388, 0.2813788, 0, 1, 0.8078431, 1,
-0.09338046, 0.06610481, -0.1707396, 0, 1, 0.8156863, 1,
-0.09297472, 0.6494056, 0.1276227, 0, 1, 0.8196079, 1,
-0.09232941, -1.490255, -2.17503, 0, 1, 0.827451, 1,
-0.09107973, 0.593457, -0.03397388, 0, 1, 0.8313726, 1,
-0.08910517, 0.2161405, 0.363082, 0, 1, 0.8392157, 1,
-0.08778401, -1.083499, -4.141123, 0, 1, 0.8431373, 1,
-0.08064663, -0.8447834, -1.762209, 0, 1, 0.8509804, 1,
-0.07467939, 0.7053541, 0.2412376, 0, 1, 0.854902, 1,
-0.07455795, 0.9947008, 0.994325, 0, 1, 0.8627451, 1,
-0.07385296, 1.556458, -1.684522, 0, 1, 0.8666667, 1,
-0.07353999, 1.712776, 0.3070343, 0, 1, 0.8745098, 1,
-0.07327735, 1.176744, -1.178649, 0, 1, 0.8784314, 1,
-0.0731723, 0.6536301, -1.658183, 0, 1, 0.8862745, 1,
-0.07035178, -0.1819935, -5.085259, 0, 1, 0.8901961, 1,
-0.06627409, 1.32394, -0.9145169, 0, 1, 0.8980392, 1,
-0.06555021, 0.4857769, -0.2637341, 0, 1, 0.9058824, 1,
-0.06403392, 0.1129035, -1.534359, 0, 1, 0.9098039, 1,
-0.06270441, -2.022141, -1.615417, 0, 1, 0.9176471, 1,
-0.06111273, 1.187016, 0.9980843, 0, 1, 0.9215686, 1,
-0.05924719, -0.7412056, -3.147076, 0, 1, 0.9294118, 1,
-0.05889431, 1.130047, 0.5620053, 0, 1, 0.9333333, 1,
-0.0576898, -0.1778797, -2.959374, 0, 1, 0.9411765, 1,
-0.05616324, -0.2980845, -0.5660412, 0, 1, 0.945098, 1,
-0.05353319, 0.9293803, 0.9608006, 0, 1, 0.9529412, 1,
-0.05119927, 0.9376544, -0.0353838, 0, 1, 0.9568627, 1,
-0.04933998, 2.041221, -0.7854199, 0, 1, 0.9647059, 1,
-0.04898075, 0.9013898, 0.1031563, 0, 1, 0.9686275, 1,
-0.04443191, 0.7462407, -0.0628156, 0, 1, 0.9764706, 1,
-0.0429165, -0.6216201, -2.443751, 0, 1, 0.9803922, 1,
-0.0407825, -0.5714607, -1.953593, 0, 1, 0.9882353, 1,
-0.04030304, 0.8948388, 0.2134666, 0, 1, 0.9921569, 1,
-0.0387733, 0.3989453, -0.5429238, 0, 1, 1, 1,
-0.03187289, -0.72324, -1.694786, 0, 0.9921569, 1, 1,
-0.02537678, -0.9243813, -1.594231, 0, 0.9882353, 1, 1,
-0.02442953, 0.08992695, 0.3070503, 0, 0.9803922, 1, 1,
-0.02377466, -0.5237232, -3.672375, 0, 0.9764706, 1, 1,
-0.02239227, 1.543498, 1.109481, 0, 0.9686275, 1, 1,
-0.01752225, 0.8827878, -0.1558791, 0, 0.9647059, 1, 1,
-0.01602587, -0.1063808, -1.202445, 0, 0.9568627, 1, 1,
-0.0123367, 0.2393416, -0.4511815, 0, 0.9529412, 1, 1,
-0.01109442, 0.52624, 0.5671438, 0, 0.945098, 1, 1,
-0.001033993, 1.263598, -1.561099, 0, 0.9411765, 1, 1,
0.004156187, -1.706865, 4.897355, 0, 0.9333333, 1, 1,
0.007458193, -0.7203401, 2.209543, 0, 0.9294118, 1, 1,
0.0082704, 1.193823, 0.405174, 0, 0.9215686, 1, 1,
0.01341576, 0.4249424, 0.7293658, 0, 0.9176471, 1, 1,
0.0145943, 1.856879, 0.9838731, 0, 0.9098039, 1, 1,
0.01576827, -1.820921, 3.665222, 0, 0.9058824, 1, 1,
0.01679525, 0.3754543, 1.603385, 0, 0.8980392, 1, 1,
0.02009672, -1.483017, 2.073712, 0, 0.8901961, 1, 1,
0.02161459, 0.3064913, 0.1926154, 0, 0.8862745, 1, 1,
0.02712815, -0.4599592, 4.768233, 0, 0.8784314, 1, 1,
0.0290763, -0.009341235, 1.640019, 0, 0.8745098, 1, 1,
0.03008597, -0.2545461, 0.8870556, 0, 0.8666667, 1, 1,
0.04167815, 0.1617323, -1.657291, 0, 0.8627451, 1, 1,
0.04238073, 1.526691, 0.6286086, 0, 0.854902, 1, 1,
0.0463338, -0.6601045, 2.895636, 0, 0.8509804, 1, 1,
0.04763995, 0.5397195, -1.194705, 0, 0.8431373, 1, 1,
0.04900428, 0.7939447, 1.590447, 0, 0.8392157, 1, 1,
0.04911947, -0.6275378, 3.883646, 0, 0.8313726, 1, 1,
0.05417152, 0.1959718, -0.9944847, 0, 0.827451, 1, 1,
0.05501168, -0.009882989, 1.730591, 0, 0.8196079, 1, 1,
0.05803207, -0.2650035, 3.428846, 0, 0.8156863, 1, 1,
0.06069538, 1.499225, -1.134309, 0, 0.8078431, 1, 1,
0.06223448, -0.6973302, 4.026545, 0, 0.8039216, 1, 1,
0.06347278, -0.1006867, 2.302125, 0, 0.7960784, 1, 1,
0.06587157, 0.04630644, 0.8950115, 0, 0.7882353, 1, 1,
0.06675918, -1.027612, 2.938033, 0, 0.7843137, 1, 1,
0.06897302, 0.7177851, 1.372425, 0, 0.7764706, 1, 1,
0.06937482, -0.2837967, 1.951535, 0, 0.772549, 1, 1,
0.06972806, -0.5247648, 3.675551, 0, 0.7647059, 1, 1,
0.06984607, -0.980565, 4.632213, 0, 0.7607843, 1, 1,
0.07043783, -2.233181, 3.743977, 0, 0.7529412, 1, 1,
0.07501543, 1.079675, 0.09604705, 0, 0.7490196, 1, 1,
0.08115629, 0.6173549, -1.222839, 0, 0.7411765, 1, 1,
0.09610461, 0.530682, -0.3411232, 0, 0.7372549, 1, 1,
0.1034541, 0.309801, -1.429252, 0, 0.7294118, 1, 1,
0.1034686, 0.4712496, -0.3960136, 0, 0.7254902, 1, 1,
0.1051651, 0.7831987, 0.4430468, 0, 0.7176471, 1, 1,
0.1056475, 0.7259105, 0.6574476, 0, 0.7137255, 1, 1,
0.1076385, -1.606291, 1.140116, 0, 0.7058824, 1, 1,
0.11366, -0.6857543, 3.053831, 0, 0.6980392, 1, 1,
0.116383, 0.2109753, -0.133671, 0, 0.6941177, 1, 1,
0.1165128, -0.4974172, 1.725149, 0, 0.6862745, 1, 1,
0.1224523, -0.614051, 2.075341, 0, 0.682353, 1, 1,
0.1228382, -0.5796537, 3.777282, 0, 0.6745098, 1, 1,
0.1229706, 1.166385, -0.090669, 0, 0.6705883, 1, 1,
0.1241737, 0.4181668, -1.152564, 0, 0.6627451, 1, 1,
0.129997, 1.869134, 1.140347, 0, 0.6588235, 1, 1,
0.1341622, 0.2312358, -0.4325567, 0, 0.6509804, 1, 1,
0.1356688, -0.7199824, 3.349592, 0, 0.6470588, 1, 1,
0.1356965, -0.05677467, 2.474647, 0, 0.6392157, 1, 1,
0.1358185, 0.4636713, 1.878852, 0, 0.6352941, 1, 1,
0.1364371, 1.24202, -0.9395635, 0, 0.627451, 1, 1,
0.1391294, 0.9233425, -0.3310714, 0, 0.6235294, 1, 1,
0.1485968, 0.5795829, 1.763229, 0, 0.6156863, 1, 1,
0.1544784, 0.3074928, -1.668947, 0, 0.6117647, 1, 1,
0.1560616, 1.266052, 0.06853424, 0, 0.6039216, 1, 1,
0.1574776, 0.6524102, 0.4329666, 0, 0.5960785, 1, 1,
0.1578239, -0.1516979, 3.775449, 0, 0.5921569, 1, 1,
0.160889, -0.9413791, 4.446157, 0, 0.5843138, 1, 1,
0.1622965, 2.183048, -1.045351, 0, 0.5803922, 1, 1,
0.1627826, -1.615047, 3.60725, 0, 0.572549, 1, 1,
0.1673373, -0.02769732, 0.7247688, 0, 0.5686275, 1, 1,
0.1739172, 0.3155517, 2.331048, 0, 0.5607843, 1, 1,
0.1762722, 1.954095, -1.023035, 0, 0.5568628, 1, 1,
0.1764488, 1.045445, 0.7782235, 0, 0.5490196, 1, 1,
0.1777955, 0.9290954, -0.8252544, 0, 0.5450981, 1, 1,
0.1855078, 0.5245352, -0.7043744, 0, 0.5372549, 1, 1,
0.1904861, 1.424932, -0.1098974, 0, 0.5333334, 1, 1,
0.1937491, 0.4190888, 1.7004, 0, 0.5254902, 1, 1,
0.1966627, 0.7264649, 1.303932, 0, 0.5215687, 1, 1,
0.1991287, -0.2842585, 1.138202, 0, 0.5137255, 1, 1,
0.2002139, -1.703836, 2.57488, 0, 0.509804, 1, 1,
0.2043614, 0.2543147, -0.8553457, 0, 0.5019608, 1, 1,
0.204701, -1.770769, 3.388511, 0, 0.4941176, 1, 1,
0.2056546, 0.2180288, 1.921779, 0, 0.4901961, 1, 1,
0.2071672, -0.305925, 3.065425, 0, 0.4823529, 1, 1,
0.2103893, 0.2180942, 2.064164, 0, 0.4784314, 1, 1,
0.2113046, -0.1705318, 2.862909, 0, 0.4705882, 1, 1,
0.2136848, -1.905644, 2.032443, 0, 0.4666667, 1, 1,
0.2152928, 0.111221, 0.3078682, 0, 0.4588235, 1, 1,
0.2161339, 1.33782, 1.247947, 0, 0.454902, 1, 1,
0.2172884, 2.224954, 0.0002692995, 0, 0.4470588, 1, 1,
0.2185726, -0.3881998, 4.069206, 0, 0.4431373, 1, 1,
0.2201693, 0.4218496, 3.044998, 0, 0.4352941, 1, 1,
0.2224479, 0.5514492, 1.247382, 0, 0.4313726, 1, 1,
0.223311, -0.3692668, 0.6389712, 0, 0.4235294, 1, 1,
0.2259037, -1.204093, 2.603374, 0, 0.4196078, 1, 1,
0.2267987, 0.5970547, 0.3849576, 0, 0.4117647, 1, 1,
0.2357725, 0.7839193, 1.509185, 0, 0.4078431, 1, 1,
0.2363013, -1.034283, 3.274885, 0, 0.4, 1, 1,
0.2370239, -0.3119119, 1.602194, 0, 0.3921569, 1, 1,
0.238838, 1.133124, 0.5899107, 0, 0.3882353, 1, 1,
0.2410044, 0.7337601, 0.6963152, 0, 0.3803922, 1, 1,
0.2433747, -0.3749922, 2.967268, 0, 0.3764706, 1, 1,
0.2434735, 1.348819, -0.9522654, 0, 0.3686275, 1, 1,
0.2462277, 1.062701, -0.5219756, 0, 0.3647059, 1, 1,
0.2542515, -0.5605962, 2.38041, 0, 0.3568628, 1, 1,
0.2575927, -0.5134825, 4.744134, 0, 0.3529412, 1, 1,
0.2706421, -1.311528, 4.938363, 0, 0.345098, 1, 1,
0.2708942, -0.9675542, 1.806236, 0, 0.3411765, 1, 1,
0.27425, 0.3367988, -1.482741, 0, 0.3333333, 1, 1,
0.2774662, -0.1738161, 2.596909, 0, 0.3294118, 1, 1,
0.2780436, -0.5418612, 2.786745, 0, 0.3215686, 1, 1,
0.2806594, 0.005426554, 0.4355928, 0, 0.3176471, 1, 1,
0.2882927, 0.502376, -0.9904215, 0, 0.3098039, 1, 1,
0.2916632, -0.2753502, 3.107771, 0, 0.3058824, 1, 1,
0.2947779, 2.432999, -1.642076, 0, 0.2980392, 1, 1,
0.2963977, 0.6947321, 0.2132581, 0, 0.2901961, 1, 1,
0.2988135, 0.345032, 0.09242101, 0, 0.2862745, 1, 1,
0.305579, -0.03222794, 2.820702, 0, 0.2784314, 1, 1,
0.3074442, -1.262653, 3.812395, 0, 0.2745098, 1, 1,
0.3075114, -1.201195, 1.967249, 0, 0.2666667, 1, 1,
0.3079359, -1.147592, 1.755092, 0, 0.2627451, 1, 1,
0.3126094, -0.3580915, 0.5988911, 0, 0.254902, 1, 1,
0.3159681, 0.3124348, 0.9843192, 0, 0.2509804, 1, 1,
0.3186004, 1.529416, 0.04122593, 0, 0.2431373, 1, 1,
0.3236142, 0.4264849, 1.985424, 0, 0.2392157, 1, 1,
0.3237953, -0.01555612, 0.8807619, 0, 0.2313726, 1, 1,
0.3250178, -1.953526, 3.257347, 0, 0.227451, 1, 1,
0.3284447, -1.803953, 4.337451, 0, 0.2196078, 1, 1,
0.3302114, 0.1271879, 1.050349, 0, 0.2156863, 1, 1,
0.3319087, -0.605107, 2.039824, 0, 0.2078431, 1, 1,
0.3350577, -0.6021674, 4.618805, 0, 0.2039216, 1, 1,
0.3383352, -1.501739, 4.35351, 0, 0.1960784, 1, 1,
0.3424483, 1.704471, 0.5324133, 0, 0.1882353, 1, 1,
0.3451692, -0.8193777, 1.347088, 0, 0.1843137, 1, 1,
0.3480795, 0.249387, 0.3770592, 0, 0.1764706, 1, 1,
0.349867, -0.2262275, 3.67106, 0, 0.172549, 1, 1,
0.3568546, 0.8276942, 1.451391, 0, 0.1647059, 1, 1,
0.3610187, 1.417626, -0.4442878, 0, 0.1607843, 1, 1,
0.3615501, 0.677804, 2.058083, 0, 0.1529412, 1, 1,
0.3646069, -1.432642, 2.301013, 0, 0.1490196, 1, 1,
0.3652316, -0.9192839, 3.987878, 0, 0.1411765, 1, 1,
0.3665243, -2.467884, 3.443567, 0, 0.1372549, 1, 1,
0.3688067, -0.4890439, 1.539058, 0, 0.1294118, 1, 1,
0.3710837, -0.2255339, 3.569263, 0, 0.1254902, 1, 1,
0.3774982, 0.3037229, 0.07021284, 0, 0.1176471, 1, 1,
0.3800249, -0.8096582, 3.476679, 0, 0.1137255, 1, 1,
0.380165, -0.2636579, 2.049851, 0, 0.1058824, 1, 1,
0.3925375, -0.7133899, 2.279811, 0, 0.09803922, 1, 1,
0.3969257, -0.9373673, 2.236447, 0, 0.09411765, 1, 1,
0.4027271, 1.071553, 0.4451297, 0, 0.08627451, 1, 1,
0.4028153, 0.08183387, 1.633278, 0, 0.08235294, 1, 1,
0.4080226, 0.6724951, 2.096223, 0, 0.07450981, 1, 1,
0.4133233, 0.1206549, 1.983416, 0, 0.07058824, 1, 1,
0.4157538, -0.6459493, 2.474896, 0, 0.0627451, 1, 1,
0.4183347, -0.4023463, 0.9807734, 0, 0.05882353, 1, 1,
0.4246447, -0.3973833, 3.843413, 0, 0.05098039, 1, 1,
0.4259289, 0.3673211, -0.62561, 0, 0.04705882, 1, 1,
0.4260571, 1.304114, -0.878531, 0, 0.03921569, 1, 1,
0.4269665, 0.5922023, -0.1062663, 0, 0.03529412, 1, 1,
0.427233, -1.122312, 3.840995, 0, 0.02745098, 1, 1,
0.4359591, -1.145971, 3.413677, 0, 0.02352941, 1, 1,
0.4361163, -1.074156, 2.757322, 0, 0.01568628, 1, 1,
0.4365559, -0.4860817, 3.20284, 0, 0.01176471, 1, 1,
0.4370447, 1.740387, 0.7409483, 0, 0.003921569, 1, 1,
0.4432045, -0.1209049, 1.047318, 0.003921569, 0, 1, 1,
0.4445039, 0.1829785, 1.330744, 0.007843138, 0, 1, 1,
0.4446075, -0.890711, 3.636323, 0.01568628, 0, 1, 1,
0.4501752, -1.263094, 4.528986, 0.01960784, 0, 1, 1,
0.4517705, -0.9196295, 3.347955, 0.02745098, 0, 1, 1,
0.4540772, -0.2170264, 2.559244, 0.03137255, 0, 1, 1,
0.4579554, 0.837825, 0.4465807, 0.03921569, 0, 1, 1,
0.4605635, 0.1339213, 1.202206, 0.04313726, 0, 1, 1,
0.4610746, 2.755452, 0.7151874, 0.05098039, 0, 1, 1,
0.4628691, 0.2933538, -0.8209038, 0.05490196, 0, 1, 1,
0.4639541, 0.261736, 1.550736, 0.0627451, 0, 1, 1,
0.4659265, -0.7747685, 1.781202, 0.06666667, 0, 1, 1,
0.471512, 0.1757439, -1.644589, 0.07450981, 0, 1, 1,
0.4718468, 0.5928137, 0.4107673, 0.07843138, 0, 1, 1,
0.4733168, -0.4327299, -0.5489814, 0.08627451, 0, 1, 1,
0.4740527, -1.335432, 3.548932, 0.09019608, 0, 1, 1,
0.4810354, -0.3030363, 2.507317, 0.09803922, 0, 1, 1,
0.4827905, -0.3800716, 2.478569, 0.1058824, 0, 1, 1,
0.4840303, -2.073226, 2.854605, 0.1098039, 0, 1, 1,
0.4851694, 1.268036, 2.168598, 0.1176471, 0, 1, 1,
0.4912618, 1.586791, 0.4269062, 0.1215686, 0, 1, 1,
0.4945594, 1.233865, 0.2932236, 0.1294118, 0, 1, 1,
0.4970069, 0.5653995, 0.08467743, 0.1333333, 0, 1, 1,
0.4972718, -0.5100997, 2.394546, 0.1411765, 0, 1, 1,
0.4973386, -0.6835575, 3.217891, 0.145098, 0, 1, 1,
0.4976718, 0.9980271, 0.5944107, 0.1529412, 0, 1, 1,
0.4986282, 0.2121286, 0.4933383, 0.1568628, 0, 1, 1,
0.5006182, 0.7299599, -0.669241, 0.1647059, 0, 1, 1,
0.5012581, -0.5141, 1.303123, 0.1686275, 0, 1, 1,
0.5020488, -1.276138, 3.652939, 0.1764706, 0, 1, 1,
0.5098928, -0.939605, 2.946562, 0.1803922, 0, 1, 1,
0.5110802, -0.1948801, 4.467565, 0.1882353, 0, 1, 1,
0.5125394, 1.393188, 2.139334, 0.1921569, 0, 1, 1,
0.5138992, 1.033571, 0.20306, 0.2, 0, 1, 1,
0.5171614, 1.035858, -0.9542322, 0.2078431, 0, 1, 1,
0.5182628, -0.0707679, 1.274193, 0.2117647, 0, 1, 1,
0.5187036, -0.8996239, 1.359044, 0.2196078, 0, 1, 1,
0.5217918, 1.604683, 1.077891, 0.2235294, 0, 1, 1,
0.5246512, 1.464885, 0.7094113, 0.2313726, 0, 1, 1,
0.5257521, 0.7417371, 1.178467, 0.2352941, 0, 1, 1,
0.5318088, -0.6201561, 3.505515, 0.2431373, 0, 1, 1,
0.534278, 0.1425557, 0.5258862, 0.2470588, 0, 1, 1,
0.5354435, 0.7197711, -0.9976642, 0.254902, 0, 1, 1,
0.5358441, 0.8635092, -1.841536, 0.2588235, 0, 1, 1,
0.5372981, -1.220482, 4.397725, 0.2666667, 0, 1, 1,
0.5424759, -0.2966952, 1.289313, 0.2705882, 0, 1, 1,
0.545471, -0.4472398, 1.892296, 0.2784314, 0, 1, 1,
0.5463485, 0.1818627, 1.671796, 0.282353, 0, 1, 1,
0.5510904, 0.1489951, 1.871644, 0.2901961, 0, 1, 1,
0.5523537, -2.264068, 2.844396, 0.2941177, 0, 1, 1,
0.553925, 0.6107243, 1.031272, 0.3019608, 0, 1, 1,
0.5550154, 0.1102081, 2.720673, 0.3098039, 0, 1, 1,
0.55525, 0.1994218, 0.4158555, 0.3137255, 0, 1, 1,
0.5622092, 0.1693322, 1.835312, 0.3215686, 0, 1, 1,
0.5631344, 0.6608598, 0.7804099, 0.3254902, 0, 1, 1,
0.5663011, -0.6176874, 2.800782, 0.3333333, 0, 1, 1,
0.5695136, -0.5671933, 2.851001, 0.3372549, 0, 1, 1,
0.5786311, 1.311491, 1.692261, 0.345098, 0, 1, 1,
0.5789815, 0.04146756, 2.045834, 0.3490196, 0, 1, 1,
0.5797747, 0.7253587, 0.4231561, 0.3568628, 0, 1, 1,
0.5865538, -0.7626425, 1.916297, 0.3607843, 0, 1, 1,
0.5921299, -0.2567333, 2.302023, 0.3686275, 0, 1, 1,
0.5926505, -0.329234, 0.8611466, 0.372549, 0, 1, 1,
0.5949227, 0.1732082, 1.159989, 0.3803922, 0, 1, 1,
0.5980805, -1.96756, 2.642576, 0.3843137, 0, 1, 1,
0.6003501, -1.35839, 1.940214, 0.3921569, 0, 1, 1,
0.6033473, -0.1079793, 2.902629, 0.3960784, 0, 1, 1,
0.6073269, 0.5499646, -0.2399232, 0.4039216, 0, 1, 1,
0.612081, -0.3491862, 2.613914, 0.4117647, 0, 1, 1,
0.6230568, 0.05273322, 0.8067645, 0.4156863, 0, 1, 1,
0.6239573, -1.08572, 1.745426, 0.4235294, 0, 1, 1,
0.6290917, 0.3117087, 0.5532138, 0.427451, 0, 1, 1,
0.6325556, 0.5810825, -0.3727355, 0.4352941, 0, 1, 1,
0.6358504, -0.7062454, 2.711989, 0.4392157, 0, 1, 1,
0.6374802, 0.005467512, 1.302952, 0.4470588, 0, 1, 1,
0.6414185, 0.5684037, 0.6949999, 0.4509804, 0, 1, 1,
0.6437839, -0.6356287, 2.366735, 0.4588235, 0, 1, 1,
0.6464845, 1.765066, 0.4597105, 0.4627451, 0, 1, 1,
0.6491132, 0.2948366, 2.570363, 0.4705882, 0, 1, 1,
0.6496816, -0.1624772, 2.679772, 0.4745098, 0, 1, 1,
0.6547461, 1.606522, -0.1249575, 0.4823529, 0, 1, 1,
0.6567952, 0.8954054, -1.421738, 0.4862745, 0, 1, 1,
0.6575, 0.5079898, 0.6355986, 0.4941176, 0, 1, 1,
0.6578848, 0.3333351, 1.733014, 0.5019608, 0, 1, 1,
0.6650699, 0.2198683, -0.9548887, 0.5058824, 0, 1, 1,
0.6739538, 0.4473094, 0.5721202, 0.5137255, 0, 1, 1,
0.6777848, -1.646224, 0.805294, 0.5176471, 0, 1, 1,
0.6844762, -0.7170475, 2.825852, 0.5254902, 0, 1, 1,
0.6894731, -1.118995, 2.551969, 0.5294118, 0, 1, 1,
0.6953517, 1.321771, -0.7903116, 0.5372549, 0, 1, 1,
0.7003431, 0.7734845, 0.02554589, 0.5411765, 0, 1, 1,
0.7116549, 0.7450841, -0.5511619, 0.5490196, 0, 1, 1,
0.7120706, 1.223084, 0.4392903, 0.5529412, 0, 1, 1,
0.7128564, 0.02948075, 1.820471, 0.5607843, 0, 1, 1,
0.7223, -2.345673, 4.021707, 0.5647059, 0, 1, 1,
0.7287841, 0.8285977, 1.30789, 0.572549, 0, 1, 1,
0.7309401, -0.08333445, 1.901013, 0.5764706, 0, 1, 1,
0.7315123, -1.838009, 1.581854, 0.5843138, 0, 1, 1,
0.7320744, -0.03832937, 2.293145, 0.5882353, 0, 1, 1,
0.7369882, 0.235146, -0.04564743, 0.5960785, 0, 1, 1,
0.7514589, -0.5549982, 3.098969, 0.6039216, 0, 1, 1,
0.7542321, 2.55798, 0.07656808, 0.6078432, 0, 1, 1,
0.7554103, -2.021056, 2.788939, 0.6156863, 0, 1, 1,
0.759925, -0.7168434, 3.415565, 0.6196079, 0, 1, 1,
0.7610824, -1.342554, 0.1223079, 0.627451, 0, 1, 1,
0.7634727, 1.189067, -0.567852, 0.6313726, 0, 1, 1,
0.7644111, 0.1966558, 0.4299915, 0.6392157, 0, 1, 1,
0.764477, 1.627323, -0.5218223, 0.6431373, 0, 1, 1,
0.7667054, 0.2670125, 0.417085, 0.6509804, 0, 1, 1,
0.7668564, -0.5924238, 3.506425, 0.654902, 0, 1, 1,
0.7678784, -0.4269851, 1.49312, 0.6627451, 0, 1, 1,
0.7693236, -0.8853446, 2.922353, 0.6666667, 0, 1, 1,
0.7707769, -1.981999, 4.440484, 0.6745098, 0, 1, 1,
0.7742111, 1.933619, 1.310407, 0.6784314, 0, 1, 1,
0.7757543, 1.420728, -0.6260331, 0.6862745, 0, 1, 1,
0.776678, 0.9739807, 0.991296, 0.6901961, 0, 1, 1,
0.7794156, 0.2687795, -0.4480796, 0.6980392, 0, 1, 1,
0.7821766, -0.3960854, 1.705966, 0.7058824, 0, 1, 1,
0.7829029, -0.7763429, 2.813361, 0.7098039, 0, 1, 1,
0.7836052, 2.682611, 1.026346, 0.7176471, 0, 1, 1,
0.7877622, -0.5772376, 2.392168, 0.7215686, 0, 1, 1,
0.7901163, 0.2861402, 1.408994, 0.7294118, 0, 1, 1,
0.7985024, 0.3573299, 1.463594, 0.7333333, 0, 1, 1,
0.8007459, -0.8819599, 1.765663, 0.7411765, 0, 1, 1,
0.8057657, 0.4982765, 0.5168351, 0.7450981, 0, 1, 1,
0.8087337, 0.832886, 1.402295, 0.7529412, 0, 1, 1,
0.8228616, -0.5066944, 1.273383, 0.7568628, 0, 1, 1,
0.8270478, 0.08107135, 0.7983313, 0.7647059, 0, 1, 1,
0.8285179, -1.413916, 3.318756, 0.7686275, 0, 1, 1,
0.834896, 0.7022494, 0.4323518, 0.7764706, 0, 1, 1,
0.8373247, -0.8220052, 0.9925037, 0.7803922, 0, 1, 1,
0.8421913, -0.450141, 1.780207, 0.7882353, 0, 1, 1,
0.8440407, 0.05325045, 0.3514459, 0.7921569, 0, 1, 1,
0.8444582, -0.7085222, 3.391434, 0.8, 0, 1, 1,
0.8571177, -1.341238, 1.800703, 0.8078431, 0, 1, 1,
0.8589301, 0.1279559, 0.5186047, 0.8117647, 0, 1, 1,
0.8590439, 1.594914, 1.110877, 0.8196079, 0, 1, 1,
0.8647044, 1.115596, 0.6042122, 0.8235294, 0, 1, 1,
0.8690171, 0.4404615, 0.3568326, 0.8313726, 0, 1, 1,
0.8754778, 0.1228219, 1.137887, 0.8352941, 0, 1, 1,
0.8763947, -1.84296, 3.332707, 0.8431373, 0, 1, 1,
0.8799314, 1.123624, 0.4518011, 0.8470588, 0, 1, 1,
0.8811578, 0.8584334, -1.403234, 0.854902, 0, 1, 1,
0.8840171, -0.8919473, 3.959022, 0.8588235, 0, 1, 1,
0.8859757, 0.03689245, 0.168449, 0.8666667, 0, 1, 1,
0.8942134, -0.8777672, 2.636914, 0.8705882, 0, 1, 1,
0.8986161, 0.8064398, 2.317575, 0.8784314, 0, 1, 1,
0.9032251, 1.054775, -0.0518904, 0.8823529, 0, 1, 1,
0.9089677, -0.04082873, 0.8589044, 0.8901961, 0, 1, 1,
0.9102309, 0.5933359, -0.2456398, 0.8941177, 0, 1, 1,
0.9132443, -0.3270269, 1.764481, 0.9019608, 0, 1, 1,
0.9148992, 1.621284, -0.4355551, 0.9098039, 0, 1, 1,
0.9177658, 0.8656268, -0.9256792, 0.9137255, 0, 1, 1,
0.9204228, 0.1686647, 0.5059406, 0.9215686, 0, 1, 1,
0.9236441, -0.7972486, 0.2719225, 0.9254902, 0, 1, 1,
0.9285925, -0.1865419, 1.075869, 0.9333333, 0, 1, 1,
0.9310468, 0.5063483, 1.836351, 0.9372549, 0, 1, 1,
0.9316007, -0.3408761, 3.308011, 0.945098, 0, 1, 1,
0.9346376, -1.265271, 2.092619, 0.9490196, 0, 1, 1,
0.9360251, 1.192655, 0.613259, 0.9568627, 0, 1, 1,
0.9365826, 0.1746228, 0.7350495, 0.9607843, 0, 1, 1,
0.9384835, 0.5278545, 0.0540972, 0.9686275, 0, 1, 1,
0.9501209, 0.4611398, 2.413838, 0.972549, 0, 1, 1,
0.9554092, 1.079718, 0.01484201, 0.9803922, 0, 1, 1,
0.9587973, 0.5901564, 0.0619289, 0.9843137, 0, 1, 1,
0.9631012, -1.126433, 1.67403, 0.9921569, 0, 1, 1,
0.9700886, -0.4546515, 3.493021, 0.9960784, 0, 1, 1,
0.9735099, -0.3323714, 1.230431, 1, 0, 0.9960784, 1,
0.9770785, 0.6840803, 1.106004, 1, 0, 0.9882353, 1,
0.9788363, 0.6177433, 0.8495743, 1, 0, 0.9843137, 1,
0.98439, 0.2710777, 0.9002085, 1, 0, 0.9764706, 1,
0.9947254, 1.254584, -0.1376232, 1, 0, 0.972549, 1,
0.9960042, 0.7343125, -1.513676, 1, 0, 0.9647059, 1,
1.001758, 1.436142, -0.04427968, 1, 0, 0.9607843, 1,
1.004936, -2.267442, 4.270731, 1, 0, 0.9529412, 1,
1.006201, -1.727986, 3.158217, 1, 0, 0.9490196, 1,
1.01246, -0.3460165, 0.5488569, 1, 0, 0.9411765, 1,
1.022849, -0.3235429, 3.351403, 1, 0, 0.9372549, 1,
1.026317, -2.143308, 4.073993, 1, 0, 0.9294118, 1,
1.029496, 1.477364, 1.19419, 1, 0, 0.9254902, 1,
1.036972, -0.350347, 0.6841959, 1, 0, 0.9176471, 1,
1.043173, -0.795908, 2.76224, 1, 0, 0.9137255, 1,
1.053638, 0.7187014, 2.443358, 1, 0, 0.9058824, 1,
1.06328, -0.2704694, 4.918333, 1, 0, 0.9019608, 1,
1.063449, 0.03392421, 2.30863, 1, 0, 0.8941177, 1,
1.065117, -0.265446, -0.856618, 1, 0, 0.8862745, 1,
1.065671, 0.9064128, 0.1710621, 1, 0, 0.8823529, 1,
1.072195, -1.280068, 2.19298, 1, 0, 0.8745098, 1,
1.075829, 0.7242607, 0.0821247, 1, 0, 0.8705882, 1,
1.081024, 0.6812014, 3.152656, 1, 0, 0.8627451, 1,
1.087587, -1.066309, 2.522069, 1, 0, 0.8588235, 1,
1.090494, -0.2410579, 1.641432, 1, 0, 0.8509804, 1,
1.114181, 0.8984306, -0.157965, 1, 0, 0.8470588, 1,
1.116246, 2.337919, -0.4603995, 1, 0, 0.8392157, 1,
1.13487, -2.085569, 2.889356, 1, 0, 0.8352941, 1,
1.13547, -0.4169183, 2.81356, 1, 0, 0.827451, 1,
1.144737, 2.247537, -0.5596421, 1, 0, 0.8235294, 1,
1.150641, 1.009894, 0.9189656, 1, 0, 0.8156863, 1,
1.160796, 0.7599946, 1.560243, 1, 0, 0.8117647, 1,
1.16448, 0.09230668, 0.9720557, 1, 0, 0.8039216, 1,
1.17273, 0.2391428, 1.686379, 1, 0, 0.7960784, 1,
1.177107, 0.02051096, 1.02605, 1, 0, 0.7921569, 1,
1.178018, 2.012103, 1.825944, 1, 0, 0.7843137, 1,
1.182476, -0.486144, 2.846231, 1, 0, 0.7803922, 1,
1.184373, 0.1767719, 2.125073, 1, 0, 0.772549, 1,
1.188479, 1.012403, -0.2029625, 1, 0, 0.7686275, 1,
1.196689, -1.878174, 3.308152, 1, 0, 0.7607843, 1,
1.197444, -1.896311, 2.536872, 1, 0, 0.7568628, 1,
1.197947, 0.7137805, -1.685115, 1, 0, 0.7490196, 1,
1.19873, -1.079576, 1.700356, 1, 0, 0.7450981, 1,
1.201373, -2.541015, 1.856558, 1, 0, 0.7372549, 1,
1.201881, 1.100944, 0.3286044, 1, 0, 0.7333333, 1,
1.202266, -0.01860468, 2.186775, 1, 0, 0.7254902, 1,
1.205187, 0.1768501, 1.988086, 1, 0, 0.7215686, 1,
1.207701, 1.807333, 1.21581, 1, 0, 0.7137255, 1,
1.207979, -0.504301, 0.272136, 1, 0, 0.7098039, 1,
1.209566, -0.5982453, 3.042498, 1, 0, 0.7019608, 1,
1.214121, 0.07086322, 1.122924, 1, 0, 0.6941177, 1,
1.215038, 1.265327, 1.637146, 1, 0, 0.6901961, 1,
1.219005, -0.1217213, 1.727862, 1, 0, 0.682353, 1,
1.21998, 1.84929, 1.58019, 1, 0, 0.6784314, 1,
1.220014, -0.01147566, -0.1398665, 1, 0, 0.6705883, 1,
1.222658, -0.440394, 3.017798, 1, 0, 0.6666667, 1,
1.225767, 0.8042704, 2.310611, 1, 0, 0.6588235, 1,
1.227246, 1.764728, 0.9258856, 1, 0, 0.654902, 1,
1.227624, -0.3281592, 1.64137, 1, 0, 0.6470588, 1,
1.24755, -1.560116, 0.7446533, 1, 0, 0.6431373, 1,
1.249186, 0.799088, -0.009929674, 1, 0, 0.6352941, 1,
1.255136, -0.3117176, 1.329877, 1, 0, 0.6313726, 1,
1.259149, -1.60325, 2.620796, 1, 0, 0.6235294, 1,
1.259306, -0.6444684, 2.779716, 1, 0, 0.6196079, 1,
1.260861, -0.341621, 2.957921, 1, 0, 0.6117647, 1,
1.270176, 0.7005854, 0.4563183, 1, 0, 0.6078432, 1,
1.275881, 1.118408, 0.3659537, 1, 0, 0.6, 1,
1.280273, -0.4004676, 2.780195, 1, 0, 0.5921569, 1,
1.282141, 1.432493, 0.8295281, 1, 0, 0.5882353, 1,
1.286476, -0.5035987, 2.275601, 1, 0, 0.5803922, 1,
1.293997, 0.4713386, 2.761549, 1, 0, 0.5764706, 1,
1.294084, -0.596369, 1.064162, 1, 0, 0.5686275, 1,
1.296877, 1.469252, 0.04952806, 1, 0, 0.5647059, 1,
1.301345, 1.166833, 1.37214, 1, 0, 0.5568628, 1,
1.308649, 0.2633182, 2.522365, 1, 0, 0.5529412, 1,
1.313809, 1.042625, 0.9877285, 1, 0, 0.5450981, 1,
1.316964, 0.2633533, 2.090811, 1, 0, 0.5411765, 1,
1.32108, -1.062373, 4.182409, 1, 0, 0.5333334, 1,
1.326876, 1.073998, 1.693642, 1, 0, 0.5294118, 1,
1.327009, 0.06535757, 1.575758, 1, 0, 0.5215687, 1,
1.328632, 1.476858, -0.4091183, 1, 0, 0.5176471, 1,
1.328838, -1.521121, 3.437646, 1, 0, 0.509804, 1,
1.339088, 0.03191941, 0.5408528, 1, 0, 0.5058824, 1,
1.341993, 1.892057, -0.4039376, 1, 0, 0.4980392, 1,
1.352374, 1.970335, 1.180407, 1, 0, 0.4901961, 1,
1.36003, 1.173819, 1.180067, 1, 0, 0.4862745, 1,
1.368436, -0.8518085, 2.607278, 1, 0, 0.4784314, 1,
1.372459, -0.8587291, 2.650954, 1, 0, 0.4745098, 1,
1.384298, 1.086592, 0.6772183, 1, 0, 0.4666667, 1,
1.400084, -1.163699, 1.591939, 1, 0, 0.4627451, 1,
1.401232, 1.450183, 1.523013, 1, 0, 0.454902, 1,
1.411732, -0.1419975, 1.905741, 1, 0, 0.4509804, 1,
1.412359, -0.2704805, 1.937046, 1, 0, 0.4431373, 1,
1.428655, -0.41405, 1.727536, 1, 0, 0.4392157, 1,
1.429596, -0.3431774, 1.025532, 1, 0, 0.4313726, 1,
1.435893, -1.76844, 2.866297, 1, 0, 0.427451, 1,
1.441157, -0.9836451, 1.744128, 1, 0, 0.4196078, 1,
1.441894, 0.4168634, 1.525495, 1, 0, 0.4156863, 1,
1.451813, 0.5802649, 1.406165, 1, 0, 0.4078431, 1,
1.457944, -0.7571965, 2.221899, 1, 0, 0.4039216, 1,
1.458967, 1.157449, -0.6797732, 1, 0, 0.3960784, 1,
1.470782, 1.002901, 0.9734804, 1, 0, 0.3882353, 1,
1.482443, 1.057582, 1.879967, 1, 0, 0.3843137, 1,
1.484852, -2.191928, 1.441326, 1, 0, 0.3764706, 1,
1.49144, 1.085438, 1.490082, 1, 0, 0.372549, 1,
1.493808, 1.100702, 0.9149732, 1, 0, 0.3647059, 1,
1.497634, -0.1864167, 0.1066038, 1, 0, 0.3607843, 1,
1.50247, -0.3134646, 1.742767, 1, 0, 0.3529412, 1,
1.504158, -0.002397883, 0.8042062, 1, 0, 0.3490196, 1,
1.511659, -0.4456091, 2.008116, 1, 0, 0.3411765, 1,
1.523727, 0.6379228, 2.525239, 1, 0, 0.3372549, 1,
1.539161, 0.8270826, 2.083453, 1, 0, 0.3294118, 1,
1.563496, -1.076486, 2.600859, 1, 0, 0.3254902, 1,
1.564108, -1.62117, 1.228569, 1, 0, 0.3176471, 1,
1.589662, -1.069646, 1.608154, 1, 0, 0.3137255, 1,
1.592406, 0.7582147, 1.990923, 1, 0, 0.3058824, 1,
1.598198, 2.086833, 1.512127, 1, 0, 0.2980392, 1,
1.607008, 1.392945, 0.3329034, 1, 0, 0.2941177, 1,
1.625798, -0.4868987, 0.1775367, 1, 0, 0.2862745, 1,
1.632182, -0.7013543, 1.167643, 1, 0, 0.282353, 1,
1.632467, 1.188147, 1.340491, 1, 0, 0.2745098, 1,
1.636494, 0.1924966, 1.874197, 1, 0, 0.2705882, 1,
1.650657, -1.432457, 3.623594, 1, 0, 0.2627451, 1,
1.655933, 0.2833478, 1.276204, 1, 0, 0.2588235, 1,
1.674267, 0.1795716, 0.218493, 1, 0, 0.2509804, 1,
1.684753, 0.3402677, 0.5802313, 1, 0, 0.2470588, 1,
1.717719, 0.09435616, 1.825223, 1, 0, 0.2392157, 1,
1.739582, 0.5852707, 1.72175, 1, 0, 0.2352941, 1,
1.759754, -0.2420633, 1.610597, 1, 0, 0.227451, 1,
1.761631, 0.05280665, 2.318674, 1, 0, 0.2235294, 1,
1.768705, 0.3373934, 1.340526, 1, 0, 0.2156863, 1,
1.812744, 0.9537131, 0.6513581, 1, 0, 0.2117647, 1,
1.82715, 2.553296, 0.6815428, 1, 0, 0.2039216, 1,
1.855356, -0.665489, 1.353736, 1, 0, 0.1960784, 1,
1.856439, -0.8445695, 2.342403, 1, 0, 0.1921569, 1,
1.858116, -0.4049942, 1.287926, 1, 0, 0.1843137, 1,
1.920067, 0.3334561, 0.3003311, 1, 0, 0.1803922, 1,
1.925277, -0.7825192, 3.797, 1, 0, 0.172549, 1,
1.93722, -0.2402543, 1.51343, 1, 0, 0.1686275, 1,
1.976329, 1.56236, 1.962431, 1, 0, 0.1607843, 1,
2.000967, 0.6480173, 1.357305, 1, 0, 0.1568628, 1,
2.004861, -0.7314057, 2.707747, 1, 0, 0.1490196, 1,
2.013065, -0.1217623, -0.4390824, 1, 0, 0.145098, 1,
2.015669, 0.194362, 2.073777, 1, 0, 0.1372549, 1,
2.029463, 0.2650846, 1.983348, 1, 0, 0.1333333, 1,
2.043869, -0.2292583, 1.512131, 1, 0, 0.1254902, 1,
2.053195, 0.05799239, 1.386339, 1, 0, 0.1215686, 1,
2.054466, -2.458636, 5.28295, 1, 0, 0.1137255, 1,
2.059541, 0.8496277, 1.377941, 1, 0, 0.1098039, 1,
2.065599, -1.270385, 3.472984, 1, 0, 0.1019608, 1,
2.072078, 0.6744205, 1.529191, 1, 0, 0.09411765, 1,
2.093223, 0.1257548, -0.5569369, 1, 0, 0.09019608, 1,
2.095674, 0.8397148, -9.182785e-05, 1, 0, 0.08235294, 1,
2.099726, -1.903073, 4.882425, 1, 0, 0.07843138, 1,
2.154757, 0.05036015, 1.184838, 1, 0, 0.07058824, 1,
2.176505, -1.686052, 2.741922, 1, 0, 0.06666667, 1,
2.178521, -0.2577801, 3.311671, 1, 0, 0.05882353, 1,
2.192521, 0.3195274, 0.7210668, 1, 0, 0.05490196, 1,
2.217571, 0.7809623, 1.898516, 1, 0, 0.04705882, 1,
2.218715, -1.391057, 1.866467, 1, 0, 0.04313726, 1,
2.366422, -0.04053048, 0.07932777, 1, 0, 0.03529412, 1,
2.375455, -0.1077059, 1.702929, 1, 0, 0.03137255, 1,
2.479069, 1.117056, 1.973284, 1, 0, 0.02352941, 1,
3.074633, 2.059382, 1.190571, 1, 0, 0.01960784, 1,
3.286857, 0.3232212, 0.6235917, 1, 0, 0.01176471, 1,
3.578793, 1.066395, 0.5205221, 1, 0, 0.007843138, 1
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
0.212358, -3.512951, -7.076648, 0, -0.5, 0.5, 0.5,
0.212358, -3.512951, -7.076648, 1, -0.5, 0.5, 0.5,
0.212358, -3.512951, -7.076648, 1, 1.5, 0.5, 0.5,
0.212358, -3.512951, -7.076648, 0, 1.5, 0.5, 0.5
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
-4.295298, 0.3260546, -7.076648, 0, -0.5, 0.5, 0.5,
-4.295298, 0.3260546, -7.076648, 1, -0.5, 0.5, 0.5,
-4.295298, 0.3260546, -7.076648, 1, 1.5, 0.5, 0.5,
-4.295298, 0.3260546, -7.076648, 0, 1.5, 0.5, 0.5
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
-4.295298, -3.512951, -0.001187563, 0, -0.5, 0.5, 0.5,
-4.295298, -3.512951, -0.001187563, 1, -0.5, 0.5, 0.5,
-4.295298, -3.512951, -0.001187563, 1, 1.5, 0.5, 0.5,
-4.295298, -3.512951, -0.001187563, 0, 1.5, 0.5, 0.5
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
-3, -2.627027, -5.44385,
3, -2.627027, -5.44385,
-3, -2.627027, -5.44385,
-3, -2.774681, -5.715983,
-2, -2.627027, -5.44385,
-2, -2.774681, -5.715983,
-1, -2.627027, -5.44385,
-1, -2.774681, -5.715983,
0, -2.627027, -5.44385,
0, -2.774681, -5.715983,
1, -2.627027, -5.44385,
1, -2.774681, -5.715983,
2, -2.627027, -5.44385,
2, -2.774681, -5.715983,
3, -2.627027, -5.44385,
3, -2.774681, -5.715983
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
-3, -3.069989, -6.260249, 0, -0.5, 0.5, 0.5,
-3, -3.069989, -6.260249, 1, -0.5, 0.5, 0.5,
-3, -3.069989, -6.260249, 1, 1.5, 0.5, 0.5,
-3, -3.069989, -6.260249, 0, 1.5, 0.5, 0.5,
-2, -3.069989, -6.260249, 0, -0.5, 0.5, 0.5,
-2, -3.069989, -6.260249, 1, -0.5, 0.5, 0.5,
-2, -3.069989, -6.260249, 1, 1.5, 0.5, 0.5,
-2, -3.069989, -6.260249, 0, 1.5, 0.5, 0.5,
-1, -3.069989, -6.260249, 0, -0.5, 0.5, 0.5,
-1, -3.069989, -6.260249, 1, -0.5, 0.5, 0.5,
-1, -3.069989, -6.260249, 1, 1.5, 0.5, 0.5,
-1, -3.069989, -6.260249, 0, 1.5, 0.5, 0.5,
0, -3.069989, -6.260249, 0, -0.5, 0.5, 0.5,
0, -3.069989, -6.260249, 1, -0.5, 0.5, 0.5,
0, -3.069989, -6.260249, 1, 1.5, 0.5, 0.5,
0, -3.069989, -6.260249, 0, 1.5, 0.5, 0.5,
1, -3.069989, -6.260249, 0, -0.5, 0.5, 0.5,
1, -3.069989, -6.260249, 1, -0.5, 0.5, 0.5,
1, -3.069989, -6.260249, 1, 1.5, 0.5, 0.5,
1, -3.069989, -6.260249, 0, 1.5, 0.5, 0.5,
2, -3.069989, -6.260249, 0, -0.5, 0.5, 0.5,
2, -3.069989, -6.260249, 1, -0.5, 0.5, 0.5,
2, -3.069989, -6.260249, 1, 1.5, 0.5, 0.5,
2, -3.069989, -6.260249, 0, 1.5, 0.5, 0.5,
3, -3.069989, -6.260249, 0, -0.5, 0.5, 0.5,
3, -3.069989, -6.260249, 1, -0.5, 0.5, 0.5,
3, -3.069989, -6.260249, 1, 1.5, 0.5, 0.5,
3, -3.069989, -6.260249, 0, 1.5, 0.5, 0.5
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
-3.25507, -2, -5.44385,
-3.25507, 3, -5.44385,
-3.25507, -2, -5.44385,
-3.428441, -2, -5.715983,
-3.25507, -1, -5.44385,
-3.428441, -1, -5.715983,
-3.25507, 0, -5.44385,
-3.428441, 0, -5.715983,
-3.25507, 1, -5.44385,
-3.428441, 1, -5.715983,
-3.25507, 2, -5.44385,
-3.428441, 2, -5.715983,
-3.25507, 3, -5.44385,
-3.428441, 3, -5.715983
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
-3.775184, -2, -6.260249, 0, -0.5, 0.5, 0.5,
-3.775184, -2, -6.260249, 1, -0.5, 0.5, 0.5,
-3.775184, -2, -6.260249, 1, 1.5, 0.5, 0.5,
-3.775184, -2, -6.260249, 0, 1.5, 0.5, 0.5,
-3.775184, -1, -6.260249, 0, -0.5, 0.5, 0.5,
-3.775184, -1, -6.260249, 1, -0.5, 0.5, 0.5,
-3.775184, -1, -6.260249, 1, 1.5, 0.5, 0.5,
-3.775184, -1, -6.260249, 0, 1.5, 0.5, 0.5,
-3.775184, 0, -6.260249, 0, -0.5, 0.5, 0.5,
-3.775184, 0, -6.260249, 1, -0.5, 0.5, 0.5,
-3.775184, 0, -6.260249, 1, 1.5, 0.5, 0.5,
-3.775184, 0, -6.260249, 0, 1.5, 0.5, 0.5,
-3.775184, 1, -6.260249, 0, -0.5, 0.5, 0.5,
-3.775184, 1, -6.260249, 1, -0.5, 0.5, 0.5,
-3.775184, 1, -6.260249, 1, 1.5, 0.5, 0.5,
-3.775184, 1, -6.260249, 0, 1.5, 0.5, 0.5,
-3.775184, 2, -6.260249, 0, -0.5, 0.5, 0.5,
-3.775184, 2, -6.260249, 1, -0.5, 0.5, 0.5,
-3.775184, 2, -6.260249, 1, 1.5, 0.5, 0.5,
-3.775184, 2, -6.260249, 0, 1.5, 0.5, 0.5,
-3.775184, 3, -6.260249, 0, -0.5, 0.5, 0.5,
-3.775184, 3, -6.260249, 1, -0.5, 0.5, 0.5,
-3.775184, 3, -6.260249, 1, 1.5, 0.5, 0.5,
-3.775184, 3, -6.260249, 0, 1.5, 0.5, 0.5
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
-3.25507, -2.627027, -4,
-3.25507, -2.627027, 4,
-3.25507, -2.627027, -4,
-3.428441, -2.774681, -4,
-3.25507, -2.627027, -2,
-3.428441, -2.774681, -2,
-3.25507, -2.627027, 0,
-3.428441, -2.774681, 0,
-3.25507, -2.627027, 2,
-3.428441, -2.774681, 2,
-3.25507, -2.627027, 4,
-3.428441, -2.774681, 4
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
-3.775184, -3.069989, -4, 0, -0.5, 0.5, 0.5,
-3.775184, -3.069989, -4, 1, -0.5, 0.5, 0.5,
-3.775184, -3.069989, -4, 1, 1.5, 0.5, 0.5,
-3.775184, -3.069989, -4, 0, 1.5, 0.5, 0.5,
-3.775184, -3.069989, -2, 0, -0.5, 0.5, 0.5,
-3.775184, -3.069989, -2, 1, -0.5, 0.5, 0.5,
-3.775184, -3.069989, -2, 1, 1.5, 0.5, 0.5,
-3.775184, -3.069989, -2, 0, 1.5, 0.5, 0.5,
-3.775184, -3.069989, 0, 0, -0.5, 0.5, 0.5,
-3.775184, -3.069989, 0, 1, -0.5, 0.5, 0.5,
-3.775184, -3.069989, 0, 1, 1.5, 0.5, 0.5,
-3.775184, -3.069989, 0, 0, 1.5, 0.5, 0.5,
-3.775184, -3.069989, 2, 0, -0.5, 0.5, 0.5,
-3.775184, -3.069989, 2, 1, -0.5, 0.5, 0.5,
-3.775184, -3.069989, 2, 1, 1.5, 0.5, 0.5,
-3.775184, -3.069989, 2, 0, 1.5, 0.5, 0.5,
-3.775184, -3.069989, 4, 0, -0.5, 0.5, 0.5,
-3.775184, -3.069989, 4, 1, -0.5, 0.5, 0.5,
-3.775184, -3.069989, 4, 1, 1.5, 0.5, 0.5,
-3.775184, -3.069989, 4, 0, 1.5, 0.5, 0.5
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
-3.25507, -2.627027, -5.44385,
-3.25507, 3.279136, -5.44385,
-3.25507, -2.627027, 5.441474,
-3.25507, 3.279136, 5.441474,
-3.25507, -2.627027, -5.44385,
-3.25507, -2.627027, 5.441474,
-3.25507, 3.279136, -5.44385,
-3.25507, 3.279136, 5.441474,
-3.25507, -2.627027, -5.44385,
3.679786, -2.627027, -5.44385,
-3.25507, -2.627027, 5.441474,
3.679786, -2.627027, 5.441474,
-3.25507, 3.279136, -5.44385,
3.679786, 3.279136, -5.44385,
-3.25507, 3.279136, 5.441474,
3.679786, 3.279136, 5.441474,
3.679786, -2.627027, -5.44385,
3.679786, 3.279136, -5.44385,
3.679786, -2.627027, 5.441474,
3.679786, 3.279136, 5.441474,
3.679786, -2.627027, -5.44385,
3.679786, -2.627027, 5.441474,
3.679786, 3.279136, -5.44385,
3.679786, 3.279136, 5.441474
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
var radius = 7.579238;
var distance = 33.72088;
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
mvMatrix.translate( -0.212358, -0.3260546, 0.001187563 );
mvMatrix.scale( 1.181686, 1.387503, 0.7528321 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.72088);
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
terbuthylazine<-read.table("terbuthylazine.xyz")
```

```
## Error in read.table("terbuthylazine.xyz"): no lines available in input
```

```r
x<-terbuthylazine$V2
```

```
## Error in eval(expr, envir, enclos): object 'terbuthylazine' not found
```

```r
y<-terbuthylazine$V3
```

```
## Error in eval(expr, envir, enclos): object 'terbuthylazine' not found
```

```r
z<-terbuthylazine$V4
```

```
## Error in eval(expr, envir, enclos): object 'terbuthylazine' not found
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
-3.154077, -0.1068509, -2.107654, 0, 0, 1, 1, 1,
-2.847234, 0.6268286, -0.3497754, 1, 0, 0, 1, 1,
-2.599723, -0.0925651, -2.365585, 1, 0, 0, 1, 1,
-2.449317, 0.2535688, -0.4543129, 1, 0, 0, 1, 1,
-2.431892, 0.4964845, -2.041451, 1, 0, 0, 1, 1,
-2.343528, -0.1287086, -1.213696, 1, 0, 0, 1, 1,
-2.274527, 0.59276, -3.397123, 0, 0, 0, 1, 1,
-2.231231, -1.047603, -0.250145, 0, 0, 0, 1, 1,
-2.180992, 0.2369979, -2.34692, 0, 0, 0, 1, 1,
-2.154581, -1.892874, -0.06012323, 0, 0, 0, 1, 1,
-2.154374, 1.060736, 0.5682203, 0, 0, 0, 1, 1,
-2.154282, 0.5022014, -1.379515, 0, 0, 0, 1, 1,
-2.130225, -0.09722979, -2.270279, 0, 0, 0, 1, 1,
-2.058284, 0.4415873, -0.9341968, 1, 1, 1, 1, 1,
-2.014525, -0.006749011, -2.227383, 1, 1, 1, 1, 1,
-1.956672, 0.1380064, -2.307822, 1, 1, 1, 1, 1,
-1.935577, -0.9390667, -3.154097, 1, 1, 1, 1, 1,
-1.9207, -0.3002175, -3.972555, 1, 1, 1, 1, 1,
-1.917236, 1.187402, -0.7714379, 1, 1, 1, 1, 1,
-1.889792, -0.1280384, -1.555558, 1, 1, 1, 1, 1,
-1.880042, -1.627211, -2.064788, 1, 1, 1, 1, 1,
-1.870518, -1.058254, -2.599204, 1, 1, 1, 1, 1,
-1.8579, 0.3070011, 0.9038149, 1, 1, 1, 1, 1,
-1.843211, 0.8326893, -2.17668, 1, 1, 1, 1, 1,
-1.811579, 0.1687707, -0.2202628, 1, 1, 1, 1, 1,
-1.790192, 0.186875, -1.546327, 1, 1, 1, 1, 1,
-1.786822, 0.9744148, -1.471667, 1, 1, 1, 1, 1,
-1.774709, -0.8520808, -2.297766, 1, 1, 1, 1, 1,
-1.77164, -1.419131, -1.923163, 0, 0, 1, 1, 1,
-1.768757, 1.774441, -2.227286, 1, 0, 0, 1, 1,
-1.764884, 0.1709354, -0.01950753, 1, 0, 0, 1, 1,
-1.749098, -0.3405984, -2.920907, 1, 0, 0, 1, 1,
-1.705125, -0.3863572, -3.517541, 1, 0, 0, 1, 1,
-1.703418, 0.8776842, -0.8809475, 1, 0, 0, 1, 1,
-1.698157, 1.314069, 1.327655, 0, 0, 0, 1, 1,
-1.693938, 0.83686, -1.518036, 0, 0, 0, 1, 1,
-1.690104, 0.3747182, -2.757143, 0, 0, 0, 1, 1,
-1.684129, -0.6649494, -3.561785, 0, 0, 0, 1, 1,
-1.67246, -0.7502937, -3.928852, 0, 0, 0, 1, 1,
-1.665827, -1.092287, -1.091219, 0, 0, 0, 1, 1,
-1.650941, -0.002083422, -1.493405, 0, 0, 0, 1, 1,
-1.599639, 0.7127081, -0.09006634, 1, 1, 1, 1, 1,
-1.573457, 0.01803659, -2.044981, 1, 1, 1, 1, 1,
-1.555031, 0.5761467, -2.699663, 1, 1, 1, 1, 1,
-1.553393, -1.10848, -3.452325, 1, 1, 1, 1, 1,
-1.550837, 1.118418, -0.5958425, 1, 1, 1, 1, 1,
-1.546983, 0.4009583, -0.3420512, 1, 1, 1, 1, 1,
-1.526508, 2.97967, -1.811428, 1, 1, 1, 1, 1,
-1.519647, -0.3737169, -2.393337, 1, 1, 1, 1, 1,
-1.517776, -2.200618, -3.39272, 1, 1, 1, 1, 1,
-1.510717, 0.05301425, -1.937855, 1, 1, 1, 1, 1,
-1.507097, 0.3738231, -1.023544, 1, 1, 1, 1, 1,
-1.498999, 0.7803059, -0.4652163, 1, 1, 1, 1, 1,
-1.490365, 0.9807271, -1.59441, 1, 1, 1, 1, 1,
-1.482935, 1.406484, -1.049483, 1, 1, 1, 1, 1,
-1.481477, -1.014906, -0.7496718, 1, 1, 1, 1, 1,
-1.469788, 1.12375, -1.448678, 0, 0, 1, 1, 1,
-1.468342, 0.1702112, -0.250516, 1, 0, 0, 1, 1,
-1.456318, 0.1641438, -0.8549826, 1, 0, 0, 1, 1,
-1.447922, -0.1029281, -2.381254, 1, 0, 0, 1, 1,
-1.44753, -0.9158705, -1.140429, 1, 0, 0, 1, 1,
-1.428082, -1.084183, -1.162659, 1, 0, 0, 1, 1,
-1.420975, -0.7772012, -1.607015, 0, 0, 0, 1, 1,
-1.408116, -1.027802, -2.381804, 0, 0, 0, 1, 1,
-1.398627, 0.9899669, -2.811506, 0, 0, 0, 1, 1,
-1.387719, 0.9841549, -1.719721, 0, 0, 0, 1, 1,
-1.379021, 0.3798967, -1.623167, 0, 0, 0, 1, 1,
-1.369944, -2.438466, -2.420167, 0, 0, 0, 1, 1,
-1.360871, -1.492483, -1.084055, 0, 0, 0, 1, 1,
-1.344639, -1.652741, -2.652908, 1, 1, 1, 1, 1,
-1.333614, -0.2524464, -3.948669, 1, 1, 1, 1, 1,
-1.32154, -2.165263, -2.334772, 1, 1, 1, 1, 1,
-1.318802, 1.257284, 0.406609, 1, 1, 1, 1, 1,
-1.316147, -0.8678923, -0.5630214, 1, 1, 1, 1, 1,
-1.304186, 0.262222, -2.514258, 1, 1, 1, 1, 1,
-1.298803, 0.01124321, -0.8416146, 1, 1, 1, 1, 1,
-1.29453, -1.20222, -3.428558, 1, 1, 1, 1, 1,
-1.285039, 1.428457, -2.781728, 1, 1, 1, 1, 1,
-1.280141, -1.281569, -3.05943, 1, 1, 1, 1, 1,
-1.275274, 0.2961842, -1.75592, 1, 1, 1, 1, 1,
-1.26735, -1.305997, -1.90592, 1, 1, 1, 1, 1,
-1.263736, 0.3982782, 0.7477321, 1, 1, 1, 1, 1,
-1.257875, -0.01392029, -2.706704, 1, 1, 1, 1, 1,
-1.252738, 2.649525, 0.6228077, 1, 1, 1, 1, 1,
-1.239165, -0.5644251, -0.2632949, 0, 0, 1, 1, 1,
-1.219719, 0.9116779, -1.58174, 1, 0, 0, 1, 1,
-1.214358, -0.1113843, -1.273987, 1, 0, 0, 1, 1,
-1.21062, 0.5465432, -0.2945007, 1, 0, 0, 1, 1,
-1.209839, -1.768374, -0.5721648, 1, 0, 0, 1, 1,
-1.204171, 0.4217133, -2.468946, 1, 0, 0, 1, 1,
-1.190922, 0.2328088, -1.384108, 0, 0, 0, 1, 1,
-1.18602, 0.6051109, -0.3000421, 0, 0, 0, 1, 1,
-1.175273, 0.4578954, -1.52597, 0, 0, 0, 1, 1,
-1.174921, 1.340992, 0.3505051, 0, 0, 0, 1, 1,
-1.169526, -0.2949088, -0.8530359, 0, 0, 0, 1, 1,
-1.161386, -1.490978, -2.116602, 0, 0, 0, 1, 1,
-1.148568, 0.8654487, -0.01571897, 0, 0, 0, 1, 1,
-1.148292, -0.09202091, -2.002205, 1, 1, 1, 1, 1,
-1.143427, -1.070558, -3.9122, 1, 1, 1, 1, 1,
-1.140107, 0.8702325, 0.01212986, 1, 1, 1, 1, 1,
-1.13821, 0.1111658, -1.451894, 1, 1, 1, 1, 1,
-1.134213, -0.2653644, -3.815734, 1, 1, 1, 1, 1,
-1.132829, 1.11108, -0.5054616, 1, 1, 1, 1, 1,
-1.123499, 1.244833, -1.836241, 1, 1, 1, 1, 1,
-1.123006, 0.9444551, -0.8669696, 1, 1, 1, 1, 1,
-1.121115, -0.8856123, -3.405771, 1, 1, 1, 1, 1,
-1.101713, 0.6946481, -1.564221, 1, 1, 1, 1, 1,
-1.094925, 1.103556, 0.2806804, 1, 1, 1, 1, 1,
-1.091546, -1.422656, -3.204771, 1, 1, 1, 1, 1,
-1.088913, -0.9099084, -2.320041, 1, 1, 1, 1, 1,
-1.087771, -0.9924168, -0.2292997, 1, 1, 1, 1, 1,
-1.084182, 1.21741, -1.682301, 1, 1, 1, 1, 1,
-1.071647, -0.06376133, -1.931597, 0, 0, 1, 1, 1,
-1.069587, -0.03928283, -1.012405, 1, 0, 0, 1, 1,
-1.067483, 2.020543, 0.06397758, 1, 0, 0, 1, 1,
-1.060166, -0.3633751, -3.022834, 1, 0, 0, 1, 1,
-1.059823, -0.1234402, -2.223251, 1, 0, 0, 1, 1,
-1.051557, -0.1070539, -1.633267, 1, 0, 0, 1, 1,
-1.049406, 1.227509, -0.8340667, 0, 0, 0, 1, 1,
-1.045638, 2.06366, -0.9231575, 0, 0, 0, 1, 1,
-1.034414, 0.06420164, -1.648497, 0, 0, 0, 1, 1,
-1.029715, 0.7543097, -0.7914103, 0, 0, 0, 1, 1,
-1.027909, 1.558896, -1.229499, 0, 0, 0, 1, 1,
-1.026965, -0.3332377, -2.763966, 0, 0, 0, 1, 1,
-1.024696, 0.006865076, -2.127435, 0, 0, 0, 1, 1,
-1.014905, 0.9408775, -0.9529478, 1, 1, 1, 1, 1,
-1.010955, -0.7328718, -2.8215, 1, 1, 1, 1, 1,
-1.005278, -0.182818, -0.9280789, 1, 1, 1, 1, 1,
-1.002391, 0.6592925, -0.8693612, 1, 1, 1, 1, 1,
-0.9944764, -2.36623, -2.179278, 1, 1, 1, 1, 1,
-0.994274, -0.1501205, -2.953659, 1, 1, 1, 1, 1,
-0.9929628, 0.01147142, -0.8316558, 1, 1, 1, 1, 1,
-0.9905326, -0.5317422, -1.606032, 1, 1, 1, 1, 1,
-0.9896404, 1.744411, -0.2493872, 1, 1, 1, 1, 1,
-0.9879643, -0.3252719, -1.585361, 1, 1, 1, 1, 1,
-0.9841952, -0.4175917, -2.413254, 1, 1, 1, 1, 1,
-0.9827828, -2.181672, -1.930012, 1, 1, 1, 1, 1,
-0.9807351, -0.1000563, -0.2612549, 1, 1, 1, 1, 1,
-0.9788027, 0.3369179, -2.537524, 1, 1, 1, 1, 1,
-0.9787039, 1.236598, -0.02679934, 1, 1, 1, 1, 1,
-0.9743127, -0.3142573, -0.4197481, 0, 0, 1, 1, 1,
-0.9728634, 0.5435114, 1.486761, 1, 0, 0, 1, 1,
-0.9723948, 0.1643765, -2.041069, 1, 0, 0, 1, 1,
-0.9717299, -0.8536086, -1.757625, 1, 0, 0, 1, 1,
-0.9686362, -0.4160067, -2.31725, 1, 0, 0, 1, 1,
-0.967428, -0.1099598, -1.20811, 1, 0, 0, 1, 1,
-0.9608746, -2.0038, -3.656045, 0, 0, 0, 1, 1,
-0.9578553, -0.7733662, -0.1675453, 0, 0, 0, 1, 1,
-0.9474627, 1.226261, -1.812362, 0, 0, 0, 1, 1,
-0.9439132, 0.1617043, -2.174331, 0, 0, 0, 1, 1,
-0.9438264, 0.1039583, -0.7209324, 0, 0, 0, 1, 1,
-0.9326567, 0.7456773, -0.6821242, 0, 0, 0, 1, 1,
-0.9319375, 0.3833611, 0.7304594, 0, 0, 0, 1, 1,
-0.9258106, -0.7302204, -0.2082387, 1, 1, 1, 1, 1,
-0.9235986, -0.6241348, -0.9513728, 1, 1, 1, 1, 1,
-0.922981, 0.6657596, -0.7731059, 1, 1, 1, 1, 1,
-0.9222984, -0.2426497, -1.765919, 1, 1, 1, 1, 1,
-0.9212881, 0.2815649, -1.070496, 1, 1, 1, 1, 1,
-0.918874, 0.407922, -1.860313, 1, 1, 1, 1, 1,
-0.9186637, -0.3108459, -2.866456, 1, 1, 1, 1, 1,
-0.9176563, 0.228246, -1.261654, 1, 1, 1, 1, 1,
-0.9094344, 0.00814385, -0.9148015, 1, 1, 1, 1, 1,
-0.9082766, -0.8612505, -2.974147, 1, 1, 1, 1, 1,
-0.9079103, -0.6602408, -2.251854, 1, 1, 1, 1, 1,
-0.9031091, -0.2018538, -1.698902, 1, 1, 1, 1, 1,
-0.9030436, -0.5609947, -1.622009, 1, 1, 1, 1, 1,
-0.8971611, -0.4286221, -2.698932, 1, 1, 1, 1, 1,
-0.8941908, -0.3876154, -2.449612, 1, 1, 1, 1, 1,
-0.8907425, 0.1902033, -0.9236587, 0, 0, 1, 1, 1,
-0.8899626, -1.680318, -2.950883, 1, 0, 0, 1, 1,
-0.8885704, 0.07668424, -1.947554, 1, 0, 0, 1, 1,
-0.8850292, 1.172355, -1.954094, 1, 0, 0, 1, 1,
-0.8840902, 1.582941, 1.199911, 1, 0, 0, 1, 1,
-0.8835686, 0.3971084, -1.216486, 1, 0, 0, 1, 1,
-0.881131, -1.571501, -3.625299, 0, 0, 0, 1, 1,
-0.8786525, -0.5586292, -0.9080044, 0, 0, 0, 1, 1,
-0.8760118, 0.5097522, -1.583827, 0, 0, 0, 1, 1,
-0.8714432, 0.4213477, -2.545747, 0, 0, 0, 1, 1,
-0.8686513, 2.490586, 0.6878847, 0, 0, 0, 1, 1,
-0.8638898, -0.4264432, -2.525878, 0, 0, 0, 1, 1,
-0.8621106, 0.2009076, -0.8175016, 0, 0, 0, 1, 1,
-0.8617171, 0.2302536, -2.593246, 1, 1, 1, 1, 1,
-0.8600463, 0.5307219, -0.01817141, 1, 1, 1, 1, 1,
-0.858604, 2.3649, -1.350784, 1, 1, 1, 1, 1,
-0.8567399, -1.481138, -3.493378, 1, 1, 1, 1, 1,
-0.854946, 0.3772365, -0.7603068, 1, 1, 1, 1, 1,
-0.8508539, -0.3228861, -0.200461, 1, 1, 1, 1, 1,
-0.8488389, -0.9822823, -2.363092, 1, 1, 1, 1, 1,
-0.8476571, 2.339042, -1.358641, 1, 1, 1, 1, 1,
-0.842882, 1.961991, 0.3181648, 1, 1, 1, 1, 1,
-0.8424699, -0.2969201, -0.8227823, 1, 1, 1, 1, 1,
-0.8410641, -0.4317475, -2.277853, 1, 1, 1, 1, 1,
-0.8348663, 1.464892, 0.6771521, 1, 1, 1, 1, 1,
-0.8341731, -0.3945831, -2.175394, 1, 1, 1, 1, 1,
-0.8331817, -0.1291653, -2.498771, 1, 1, 1, 1, 1,
-0.8323159, -0.7309486, -2.135896, 1, 1, 1, 1, 1,
-0.83013, -0.5193297, -1.611024, 0, 0, 1, 1, 1,
-0.8208006, -0.4762454, -1.611369, 1, 0, 0, 1, 1,
-0.8189348, 0.6426935, -1.775976, 1, 0, 0, 1, 1,
-0.8158646, 0.8117757, -1.92941, 1, 0, 0, 1, 1,
-0.8145585, 0.8806437, -0.742353, 1, 0, 0, 1, 1,
-0.8117554, -0.6772073, -2.522834, 1, 0, 0, 1, 1,
-0.8081849, 0.597836, -0.5780599, 0, 0, 0, 1, 1,
-0.7975038, -1.910107, -2.413554, 0, 0, 0, 1, 1,
-0.7961534, 1.182768, -1.182948, 0, 0, 0, 1, 1,
-0.7925307, 0.220236, -1.803078, 0, 0, 0, 1, 1,
-0.780324, 0.1149731, -3.020732, 0, 0, 0, 1, 1,
-0.7772213, -0.4240879, -0.7084332, 0, 0, 0, 1, 1,
-0.7771531, -0.5976241, -3.966544, 0, 0, 0, 1, 1,
-0.7740735, -1.067812, -3.008416, 1, 1, 1, 1, 1,
-0.7739865, 0.098203, -2.352785, 1, 1, 1, 1, 1,
-0.7666191, -0.102929, -2.420245, 1, 1, 1, 1, 1,
-0.7657841, 0.5686945, -1.119818, 1, 1, 1, 1, 1,
-0.7640921, -2.252136, -3.9837, 1, 1, 1, 1, 1,
-0.7624297, 2.07148, -0.05030348, 1, 1, 1, 1, 1,
-0.7550915, 0.9987054, 0.2007078, 1, 1, 1, 1, 1,
-0.754899, 0.7635495, -0.3812541, 1, 1, 1, 1, 1,
-0.7455329, 0.8657485, -2.646015, 1, 1, 1, 1, 1,
-0.7448494, 0.6718993, -0.4255872, 1, 1, 1, 1, 1,
-0.74446, -0.5538668, -2.402796, 1, 1, 1, 1, 1,
-0.7302553, 0.5028881, -2.591292, 1, 1, 1, 1, 1,
-0.7298604, -0.1462322, -2.730204, 1, 1, 1, 1, 1,
-0.7253267, 0.460937, -1.163693, 1, 1, 1, 1, 1,
-0.7240067, -0.3156483, -0.7935817, 1, 1, 1, 1, 1,
-0.7230275, -2.137471, -2.727047, 0, 0, 1, 1, 1,
-0.7179466, 0.7997748, -2.077524, 1, 0, 0, 1, 1,
-0.7179154, -0.9137823, -2.962641, 1, 0, 0, 1, 1,
-0.7171299, 1.268267, -0.137263, 1, 0, 0, 1, 1,
-0.7163355, -0.8008369, -0.6903593, 1, 0, 0, 1, 1,
-0.7150831, -2.528423, -4.439124, 1, 0, 0, 1, 1,
-0.7142752, -0.147742, -2.834834, 0, 0, 0, 1, 1,
-0.7098405, 0.1334217, -2.856193, 0, 0, 0, 1, 1,
-0.7095255, -0.3680841, -3.052977, 0, 0, 0, 1, 1,
-0.7092616, -0.2707834, -2.578716, 0, 0, 0, 1, 1,
-0.7079815, 0.2031054, -1.95004, 0, 0, 0, 1, 1,
-0.7036797, -1.004778, -2.569993, 0, 0, 0, 1, 1,
-0.6994337, -1.477217, -2.534395, 0, 0, 0, 1, 1,
-0.6982536, -0.2056713, -1.133929, 1, 1, 1, 1, 1,
-0.6952005, 0.5394112, -1.653328, 1, 1, 1, 1, 1,
-0.6944259, 0.07449067, -0.339512, 1, 1, 1, 1, 1,
-0.6928406, -0.5154236, -4.03485, 1, 1, 1, 1, 1,
-0.6906418, 0.5230694, -0.9261541, 1, 1, 1, 1, 1,
-0.6854527, -1.643231, -3.815844, 1, 1, 1, 1, 1,
-0.6815847, 0.3155227, -0.1129645, 1, 1, 1, 1, 1,
-0.6792406, -0.474075, -3.357875, 1, 1, 1, 1, 1,
-0.678795, -0.6844953, -0.5509469, 1, 1, 1, 1, 1,
-0.6779575, -0.1782547, -0.6346583, 1, 1, 1, 1, 1,
-0.6658193, -0.1365249, -2.237406, 1, 1, 1, 1, 1,
-0.660569, 0.9547589, 0.02291484, 1, 1, 1, 1, 1,
-0.6518837, 0.3595098, -0.3993353, 1, 1, 1, 1, 1,
-0.6509973, -1.571259, -1.777468, 1, 1, 1, 1, 1,
-0.6482791, -0.7096798, -3.168872, 1, 1, 1, 1, 1,
-0.6347828, -1.517222, -3.524641, 0, 0, 1, 1, 1,
-0.6317382, 0.1815356, -0.5083785, 1, 0, 0, 1, 1,
-0.6316058, 0.4867396, -1.558459, 1, 0, 0, 1, 1,
-0.6314628, -0.3972411, -1.625058, 1, 0, 0, 1, 1,
-0.6257782, 1.332859, 0.4117427, 1, 0, 0, 1, 1,
-0.6157771, -0.1363596, -0.8062856, 1, 0, 0, 1, 1,
-0.6124498, 0.3920021, -1.829357, 0, 0, 0, 1, 1,
-0.61192, -0.102654, -2.629556, 0, 0, 0, 1, 1,
-0.607945, -1.269498, -4.890902, 0, 0, 0, 1, 1,
-0.601038, 0.2456123, -3.014901, 0, 0, 0, 1, 1,
-0.5994653, 1.0443, -0.3703041, 0, 0, 0, 1, 1,
-0.5964817, 0.641794, -0.6515158, 0, 0, 0, 1, 1,
-0.5924819, 0.222321, -1.98241, 0, 0, 0, 1, 1,
-0.5920848, 0.02005518, -0.002620906, 1, 1, 1, 1, 1,
-0.5889742, 0.01769689, -0.9612621, 1, 1, 1, 1, 1,
-0.5888598, 1.275567, -0.5791898, 1, 1, 1, 1, 1,
-0.5887228, -1.359471, -4.129369, 1, 1, 1, 1, 1,
-0.5885161, -0.197437, -2.681082, 1, 1, 1, 1, 1,
-0.5869383, 0.9689932, -0.07568631, 1, 1, 1, 1, 1,
-0.5867554, -1.938879, -3.127628, 1, 1, 1, 1, 1,
-0.5800542, 0.594561, -1.835741, 1, 1, 1, 1, 1,
-0.5800158, -2.172265, -2.190414, 1, 1, 1, 1, 1,
-0.5738636, -0.1674587, -2.34695, 1, 1, 1, 1, 1,
-0.5731975, 0.9034965, -0.3627957, 1, 1, 1, 1, 1,
-0.5653803, -0.4655828, -1.796079, 1, 1, 1, 1, 1,
-0.5653013, 1.017513, -0.249815, 1, 1, 1, 1, 1,
-0.5640268, 0.7571622, -0.3744418, 1, 1, 1, 1, 1,
-0.5596637, -1.040896, -3.548814, 1, 1, 1, 1, 1,
-0.5545245, -2.341435, -3.635952, 0, 0, 1, 1, 1,
-0.5512785, -1.808946, -3.231662, 1, 0, 0, 1, 1,
-0.5491414, 0.2941732, -0.7977142, 1, 0, 0, 1, 1,
-0.5484133, -0.7691174, -3.315475, 1, 0, 0, 1, 1,
-0.5423138, 0.1569648, -1.482069, 1, 0, 0, 1, 1,
-0.540525, 0.6950328, -1.276729, 1, 0, 0, 1, 1,
-0.532015, 0.06971029, -0.975854, 0, 0, 0, 1, 1,
-0.5314106, -0.387019, -2.808763, 0, 0, 0, 1, 1,
-0.5268565, 1.564464, -0.9807401, 0, 0, 0, 1, 1,
-0.5252561, -0.09000634, -2.882825, 0, 0, 0, 1, 1,
-0.5242344, 1.07618, -1.516936, 0, 0, 0, 1, 1,
-0.5224941, 0.3835251, -2.888315, 0, 0, 0, 1, 1,
-0.5218748, -0.3008677, -1.466804, 0, 0, 0, 1, 1,
-0.5208582, -1.174704, -3.261578, 1, 1, 1, 1, 1,
-0.5147044, 0.4724638, -1.403238, 1, 1, 1, 1, 1,
-0.5133926, -1.954989, -3.4555, 1, 1, 1, 1, 1,
-0.5130654, -0.9320198, -2.248566, 1, 1, 1, 1, 1,
-0.5105296, -0.9842729, -3.627993, 1, 1, 1, 1, 1,
-0.5071768, 1.215544, -0.3487239, 1, 1, 1, 1, 1,
-0.5021173, 0.3389683, -1.169046, 1, 1, 1, 1, 1,
-0.4989165, -1.106934, -3.409392, 1, 1, 1, 1, 1,
-0.4985247, 0.5141727, 0.06551567, 1, 1, 1, 1, 1,
-0.497818, 0.230808, 0.2869498, 1, 1, 1, 1, 1,
-0.4965252, 1.402492, -0.5075909, 1, 1, 1, 1, 1,
-0.4930188, -1.004687, -1.109224, 1, 1, 1, 1, 1,
-0.4926008, 0.4111834, -2.858603, 1, 1, 1, 1, 1,
-0.4917592, 2.629309, -0.1959271, 1, 1, 1, 1, 1,
-0.4877924, 0.838002, -0.09706497, 1, 1, 1, 1, 1,
-0.483152, -0.05620703, -1.458134, 0, 0, 1, 1, 1,
-0.4764255, 0.9275889, 1.300245, 1, 0, 0, 1, 1,
-0.4715892, 0.567291, -0.7407709, 1, 0, 0, 1, 1,
-0.4649048, -1.503716, -1.925321, 1, 0, 0, 1, 1,
-0.4631578, -0.3252394, -2.971348, 1, 0, 0, 1, 1,
-0.4609154, 0.1820739, -1.758582, 1, 0, 0, 1, 1,
-0.4528998, -0.5249857, -2.972193, 0, 0, 0, 1, 1,
-0.4505096, 0.1807802, -2.828405, 0, 0, 0, 1, 1,
-0.448752, -0.00106914, -2.024107, 0, 0, 0, 1, 1,
-0.446427, -0.4598952, -3.208256, 0, 0, 0, 1, 1,
-0.4454593, -0.6803677, -3.975128, 0, 0, 0, 1, 1,
-0.4437127, 0.2889569, -1.646421, 0, 0, 0, 1, 1,
-0.4432342, -0.06838995, -0.8754517, 0, 0, 0, 1, 1,
-0.4311768, 0.8066323, 0.2636758, 1, 1, 1, 1, 1,
-0.4304152, 1.287881, 0.5988506, 1, 1, 1, 1, 1,
-0.4295308, 0.3748028, -1.099198, 1, 1, 1, 1, 1,
-0.4292967, 0.3918331, 0.5072281, 1, 1, 1, 1, 1,
-0.426023, 0.7735863, 0.8919432, 1, 1, 1, 1, 1,
-0.4251069, -1.880447, -2.577224, 1, 1, 1, 1, 1,
-0.4208066, 0.1565735, -0.314291, 1, 1, 1, 1, 1,
-0.4205998, 0.8867639, 0.5618988, 1, 1, 1, 1, 1,
-0.4204591, -0.2939256, -2.929363, 1, 1, 1, 1, 1,
-0.415, -0.8873764, -2.021983, 1, 1, 1, 1, 1,
-0.4133927, 0.3007663, -0.03539685, 1, 1, 1, 1, 1,
-0.4097246, -0.2464301, -3.223722, 1, 1, 1, 1, 1,
-0.4086078, 1.411481, 1.064428, 1, 1, 1, 1, 1,
-0.4073356, 0.9780786, -1.569375, 1, 1, 1, 1, 1,
-0.4057787, 3.193124, -0.4358719, 1, 1, 1, 1, 1,
-0.40334, -1.329143, -0.9514688, 0, 0, 1, 1, 1,
-0.4017251, -0.193045, -0.4724399, 1, 0, 0, 1, 1,
-0.3973186, -0.4724709, -3.288392, 1, 0, 0, 1, 1,
-0.3917546, 3.083222, -2.052965, 1, 0, 0, 1, 1,
-0.3904558, 0.1618334, -1.550863, 1, 0, 0, 1, 1,
-0.3893242, -0.1029262, -1.346686, 1, 0, 0, 1, 1,
-0.387973, 0.3896171, -1.627196, 0, 0, 0, 1, 1,
-0.3876209, -1.539209, -3.618262, 0, 0, 0, 1, 1,
-0.3858063, 1.305102, -0.8853961, 0, 0, 0, 1, 1,
-0.3832727, 2.372329, -0.3052422, 0, 0, 0, 1, 1,
-0.3752384, 0.691778, -0.4175118, 0, 0, 0, 1, 1,
-0.3741668, 0.6647728, -1.944445, 0, 0, 0, 1, 1,
-0.3726446, 1.517702, 0.1355224, 0, 0, 0, 1, 1,
-0.3642357, 0.2599732, 0.1735344, 1, 1, 1, 1, 1,
-0.3615436, -0.9383141, -4.002987, 1, 1, 1, 1, 1,
-0.3611478, 1.0718, -0.1160055, 1, 1, 1, 1, 1,
-0.3565786, 0.4754686, -1.256072, 1, 1, 1, 1, 1,
-0.344417, 0.3166428, -0.7302049, 1, 1, 1, 1, 1,
-0.3432642, 0.526955, -1.265498, 1, 1, 1, 1, 1,
-0.3411517, 0.3531881, -1.431228, 1, 1, 1, 1, 1,
-0.3373446, 0.5371042, -0.07387544, 1, 1, 1, 1, 1,
-0.3356566, 0.3692746, 0.199036, 1, 1, 1, 1, 1,
-0.3347468, -2.014843, -3.717342, 1, 1, 1, 1, 1,
-0.3317722, -0.6167411, -2.658664, 1, 1, 1, 1, 1,
-0.3306029, 2.188888, 1.352443, 1, 1, 1, 1, 1,
-0.3293717, 0.9761468, 0.4273419, 1, 1, 1, 1, 1,
-0.3293676, 0.9509682, 0.02836961, 1, 1, 1, 1, 1,
-0.3232411, 0.6003442, -0.3519116, 1, 1, 1, 1, 1,
-0.3204559, 0.9073507, 0.2414668, 0, 0, 1, 1, 1,
-0.3189875, 0.08527754, -2.567795, 1, 0, 0, 1, 1,
-0.3180711, 1.136031, 0.505597, 1, 0, 0, 1, 1,
-0.3141017, 0.7159522, 0.4412783, 1, 0, 0, 1, 1,
-0.3118282, 0.4144393, -0.4163277, 1, 0, 0, 1, 1,
-0.3114457, -0.4627149, -2.712327, 1, 0, 0, 1, 1,
-0.3095694, 0.03164553, -0.07400083, 0, 0, 0, 1, 1,
-0.3093648, 1.090347, 0.4934421, 0, 0, 0, 1, 1,
-0.3085252, 0.5202301, 0.3381441, 0, 0, 0, 1, 1,
-0.3072597, 0.706875, -1.384318, 0, 0, 0, 1, 1,
-0.3056825, -1.54223, -3.65847, 0, 0, 0, 1, 1,
-0.3046188, 0.1200345, -0.5308291, 0, 0, 0, 1, 1,
-0.3001166, -0.8215176, -3.00345, 0, 0, 0, 1, 1,
-0.2962708, -0.1912344, -2.186063, 1, 1, 1, 1, 1,
-0.2958264, -0.7219021, -3.541604, 1, 1, 1, 1, 1,
-0.2909531, -0.04372191, -1.408996, 1, 1, 1, 1, 1,
-0.2907034, -0.03700666, -2.586536, 1, 1, 1, 1, 1,
-0.2906412, -0.158103, -2.748981, 1, 1, 1, 1, 1,
-0.2894364, -0.6135114, -2.843249, 1, 1, 1, 1, 1,
-0.2884208, -0.09640829, -2.256827, 1, 1, 1, 1, 1,
-0.287666, -0.1090646, -2.683556, 1, 1, 1, 1, 1,
-0.2866468, 1.579872, 2.366976, 1, 1, 1, 1, 1,
-0.2846665, 0.3032134, -0.2213288, 1, 1, 1, 1, 1,
-0.2841172, -0.4656666, -3.975526, 1, 1, 1, 1, 1,
-0.2832207, -0.7746459, -2.861793, 1, 1, 1, 1, 1,
-0.2832113, 0.7220896, -0.05626745, 1, 1, 1, 1, 1,
-0.282325, -0.2878993, -3.314131, 1, 1, 1, 1, 1,
-0.277048, 1.023886, -1.052562, 1, 1, 1, 1, 1,
-0.2743109, 0.9196303, -0.9896095, 0, 0, 1, 1, 1,
-0.2742553, -1.227248, -4.224515, 1, 0, 0, 1, 1,
-0.2720399, -0.2172324, -1.305835, 1, 0, 0, 1, 1,
-0.2700709, -0.4960636, -2.395244, 1, 0, 0, 1, 1,
-0.2652824, 0.3274445, 0.008240398, 1, 0, 0, 1, 1,
-0.2576409, 1.029042, 1.340161, 1, 0, 0, 1, 1,
-0.2504633, 0.9099257, -1.390712, 0, 0, 0, 1, 1,
-0.2502685, 0.191387, -0.4614793, 0, 0, 0, 1, 1,
-0.2471123, 0.4189231, -0.7919982, 0, 0, 0, 1, 1,
-0.246256, 0.5468252, 1.065487, 0, 0, 0, 1, 1,
-0.2414013, 0.748976, -0.1556426, 0, 0, 0, 1, 1,
-0.2404872, -1.247598, -2.928868, 0, 0, 0, 1, 1,
-0.2401009, 0.8869673, 1.434229, 0, 0, 0, 1, 1,
-0.233568, 1.059213, -1.860715, 1, 1, 1, 1, 1,
-0.2328805, 1.323828, -0.3279937, 1, 1, 1, 1, 1,
-0.229547, 0.5120755, 1.02168, 1, 1, 1, 1, 1,
-0.2287596, 0.4612753, 0.1790007, 1, 1, 1, 1, 1,
-0.2283641, -1.170839, -2.71667, 1, 1, 1, 1, 1,
-0.2282852, -2.375802, -2.448033, 1, 1, 1, 1, 1,
-0.2282223, -0.06919864, -2.924732, 1, 1, 1, 1, 1,
-0.2258262, -2.249744, -2.720704, 1, 1, 1, 1, 1,
-0.2250164, 0.2397711, -1.987025, 1, 1, 1, 1, 1,
-0.2220019, -0.7286793, -3.587092, 1, 1, 1, 1, 1,
-0.2196926, -1.992955, -3.375802, 1, 1, 1, 1, 1,
-0.2195094, 0.3103672, -2.485622, 1, 1, 1, 1, 1,
-0.2175547, 1.19704, 0.272457, 1, 1, 1, 1, 1,
-0.2165095, 0.6213809, -1.694053, 1, 1, 1, 1, 1,
-0.212543, 0.1414044, -0.7962445, 1, 1, 1, 1, 1,
-0.2110507, 0.9517964, -1.487023, 0, 0, 1, 1, 1,
-0.2104649, -0.5647517, -2.250604, 1, 0, 0, 1, 1,
-0.2088621, 2.416855, -0.01490726, 1, 0, 0, 1, 1,
-0.2019192, -0.6335342, -4.982447, 1, 0, 0, 1, 1,
-0.2018506, 1.040334, 0.4080544, 1, 0, 0, 1, 1,
-0.1983114, -0.04449815, -3.249437, 1, 0, 0, 1, 1,
-0.1965875, 0.6062464, 0.2242411, 0, 0, 0, 1, 1,
-0.1939649, -1.362444, -2.689284, 0, 0, 0, 1, 1,
-0.1938089, 0.2129267, -0.8278472, 0, 0, 0, 1, 1,
-0.1908345, -1.421695, -3.059104, 0, 0, 0, 1, 1,
-0.186649, -0.2472344, -1.634286, 0, 0, 0, 1, 1,
-0.1747778, 0.6997724, 0.530598, 0, 0, 0, 1, 1,
-0.169283, -0.07716973, -2.073936, 0, 0, 0, 1, 1,
-0.167262, 0.2518502, -0.6062565, 1, 1, 1, 1, 1,
-0.1649366, -0.8465788, -2.190027, 1, 1, 1, 1, 1,
-0.1615442, -1.232064, -2.404118, 1, 1, 1, 1, 1,
-0.1613337, 0.2683967, -0.191824, 1, 1, 1, 1, 1,
-0.1607898, 0.6276932, -1.262009, 1, 1, 1, 1, 1,
-0.1602802, -0.7931144, -2.745067, 1, 1, 1, 1, 1,
-0.1599663, 1.979902, 0.9113743, 1, 1, 1, 1, 1,
-0.1592197, 0.773115, -2.109502, 1, 1, 1, 1, 1,
-0.1588801, -0.5588124, -2.023915, 1, 1, 1, 1, 1,
-0.1531292, -0.1546737, -2.798717, 1, 1, 1, 1, 1,
-0.1520328, -0.2052665, -2.877533, 1, 1, 1, 1, 1,
-0.1453467, -1.161245, -3.490945, 1, 1, 1, 1, 1,
-0.140748, -1.252961, -3.606867, 1, 1, 1, 1, 1,
-0.1398997, 0.2178516, -1.769267, 1, 1, 1, 1, 1,
-0.1391494, -0.5748002, -2.217176, 1, 1, 1, 1, 1,
-0.1391162, -1.667954, -2.816992, 0, 0, 1, 1, 1,
-0.1378777, 1.146674, -0.4613033, 1, 0, 0, 1, 1,
-0.1366641, 0.3006119, -2.092384, 1, 0, 0, 1, 1,
-0.1339069, 1.865689, -1.276171, 1, 0, 0, 1, 1,
-0.1308572, -0.4452414, -0.1730188, 1, 0, 0, 1, 1,
-0.1308029, -1.115881, -5.285326, 1, 0, 0, 1, 1,
-0.130597, -0.002449364, -1.670686, 0, 0, 0, 1, 1,
-0.1284249, -1.047725, -2.22227, 0, 0, 0, 1, 1,
-0.1275573, 0.2414112, -0.9259501, 0, 0, 0, 1, 1,
-0.1230931, 1.234077, 1.394961, 0, 0, 0, 1, 1,
-0.1211497, -1.098403, -4.52458, 0, 0, 0, 1, 1,
-0.117618, -2.443371, -2.529886, 0, 0, 0, 1, 1,
-0.1168575, -1.291356, -3.904793, 0, 0, 0, 1, 1,
-0.1158505, -1.988608, -4.331169, 1, 1, 1, 1, 1,
-0.1095621, 0.537031, 0.4562694, 1, 1, 1, 1, 1,
-0.1033559, 0.1384928, 0.3404828, 1, 1, 1, 1, 1,
-0.09815934, -0.6355517, -3.415734, 1, 1, 1, 1, 1,
-0.0979508, -0.04780656, -2.662251, 1, 1, 1, 1, 1,
-0.09735028, -0.4672676, -1.645998, 1, 1, 1, 1, 1,
-0.0944488, 0.6967238, -0.795038, 1, 1, 1, 1, 1,
-0.09357148, -0.0203388, 0.2813788, 1, 1, 1, 1, 1,
-0.09338046, 0.06610481, -0.1707396, 1, 1, 1, 1, 1,
-0.09297472, 0.6494056, 0.1276227, 1, 1, 1, 1, 1,
-0.09232941, -1.490255, -2.17503, 1, 1, 1, 1, 1,
-0.09107973, 0.593457, -0.03397388, 1, 1, 1, 1, 1,
-0.08910517, 0.2161405, 0.363082, 1, 1, 1, 1, 1,
-0.08778401, -1.083499, -4.141123, 1, 1, 1, 1, 1,
-0.08064663, -0.8447834, -1.762209, 1, 1, 1, 1, 1,
-0.07467939, 0.7053541, 0.2412376, 0, 0, 1, 1, 1,
-0.07455795, 0.9947008, 0.994325, 1, 0, 0, 1, 1,
-0.07385296, 1.556458, -1.684522, 1, 0, 0, 1, 1,
-0.07353999, 1.712776, 0.3070343, 1, 0, 0, 1, 1,
-0.07327735, 1.176744, -1.178649, 1, 0, 0, 1, 1,
-0.0731723, 0.6536301, -1.658183, 1, 0, 0, 1, 1,
-0.07035178, -0.1819935, -5.085259, 0, 0, 0, 1, 1,
-0.06627409, 1.32394, -0.9145169, 0, 0, 0, 1, 1,
-0.06555021, 0.4857769, -0.2637341, 0, 0, 0, 1, 1,
-0.06403392, 0.1129035, -1.534359, 0, 0, 0, 1, 1,
-0.06270441, -2.022141, -1.615417, 0, 0, 0, 1, 1,
-0.06111273, 1.187016, 0.9980843, 0, 0, 0, 1, 1,
-0.05924719, -0.7412056, -3.147076, 0, 0, 0, 1, 1,
-0.05889431, 1.130047, 0.5620053, 1, 1, 1, 1, 1,
-0.0576898, -0.1778797, -2.959374, 1, 1, 1, 1, 1,
-0.05616324, -0.2980845, -0.5660412, 1, 1, 1, 1, 1,
-0.05353319, 0.9293803, 0.9608006, 1, 1, 1, 1, 1,
-0.05119927, 0.9376544, -0.0353838, 1, 1, 1, 1, 1,
-0.04933998, 2.041221, -0.7854199, 1, 1, 1, 1, 1,
-0.04898075, 0.9013898, 0.1031563, 1, 1, 1, 1, 1,
-0.04443191, 0.7462407, -0.0628156, 1, 1, 1, 1, 1,
-0.0429165, -0.6216201, -2.443751, 1, 1, 1, 1, 1,
-0.0407825, -0.5714607, -1.953593, 1, 1, 1, 1, 1,
-0.04030304, 0.8948388, 0.2134666, 1, 1, 1, 1, 1,
-0.0387733, 0.3989453, -0.5429238, 1, 1, 1, 1, 1,
-0.03187289, -0.72324, -1.694786, 1, 1, 1, 1, 1,
-0.02537678, -0.9243813, -1.594231, 1, 1, 1, 1, 1,
-0.02442953, 0.08992695, 0.3070503, 1, 1, 1, 1, 1,
-0.02377466, -0.5237232, -3.672375, 0, 0, 1, 1, 1,
-0.02239227, 1.543498, 1.109481, 1, 0, 0, 1, 1,
-0.01752225, 0.8827878, -0.1558791, 1, 0, 0, 1, 1,
-0.01602587, -0.1063808, -1.202445, 1, 0, 0, 1, 1,
-0.0123367, 0.2393416, -0.4511815, 1, 0, 0, 1, 1,
-0.01109442, 0.52624, 0.5671438, 1, 0, 0, 1, 1,
-0.001033993, 1.263598, -1.561099, 0, 0, 0, 1, 1,
0.004156187, -1.706865, 4.897355, 0, 0, 0, 1, 1,
0.007458193, -0.7203401, 2.209543, 0, 0, 0, 1, 1,
0.0082704, 1.193823, 0.405174, 0, 0, 0, 1, 1,
0.01341576, 0.4249424, 0.7293658, 0, 0, 0, 1, 1,
0.0145943, 1.856879, 0.9838731, 0, 0, 0, 1, 1,
0.01576827, -1.820921, 3.665222, 0, 0, 0, 1, 1,
0.01679525, 0.3754543, 1.603385, 1, 1, 1, 1, 1,
0.02009672, -1.483017, 2.073712, 1, 1, 1, 1, 1,
0.02161459, 0.3064913, 0.1926154, 1, 1, 1, 1, 1,
0.02712815, -0.4599592, 4.768233, 1, 1, 1, 1, 1,
0.0290763, -0.009341235, 1.640019, 1, 1, 1, 1, 1,
0.03008597, -0.2545461, 0.8870556, 1, 1, 1, 1, 1,
0.04167815, 0.1617323, -1.657291, 1, 1, 1, 1, 1,
0.04238073, 1.526691, 0.6286086, 1, 1, 1, 1, 1,
0.0463338, -0.6601045, 2.895636, 1, 1, 1, 1, 1,
0.04763995, 0.5397195, -1.194705, 1, 1, 1, 1, 1,
0.04900428, 0.7939447, 1.590447, 1, 1, 1, 1, 1,
0.04911947, -0.6275378, 3.883646, 1, 1, 1, 1, 1,
0.05417152, 0.1959718, -0.9944847, 1, 1, 1, 1, 1,
0.05501168, -0.009882989, 1.730591, 1, 1, 1, 1, 1,
0.05803207, -0.2650035, 3.428846, 1, 1, 1, 1, 1,
0.06069538, 1.499225, -1.134309, 0, 0, 1, 1, 1,
0.06223448, -0.6973302, 4.026545, 1, 0, 0, 1, 1,
0.06347278, -0.1006867, 2.302125, 1, 0, 0, 1, 1,
0.06587157, 0.04630644, 0.8950115, 1, 0, 0, 1, 1,
0.06675918, -1.027612, 2.938033, 1, 0, 0, 1, 1,
0.06897302, 0.7177851, 1.372425, 1, 0, 0, 1, 1,
0.06937482, -0.2837967, 1.951535, 0, 0, 0, 1, 1,
0.06972806, -0.5247648, 3.675551, 0, 0, 0, 1, 1,
0.06984607, -0.980565, 4.632213, 0, 0, 0, 1, 1,
0.07043783, -2.233181, 3.743977, 0, 0, 0, 1, 1,
0.07501543, 1.079675, 0.09604705, 0, 0, 0, 1, 1,
0.08115629, 0.6173549, -1.222839, 0, 0, 0, 1, 1,
0.09610461, 0.530682, -0.3411232, 0, 0, 0, 1, 1,
0.1034541, 0.309801, -1.429252, 1, 1, 1, 1, 1,
0.1034686, 0.4712496, -0.3960136, 1, 1, 1, 1, 1,
0.1051651, 0.7831987, 0.4430468, 1, 1, 1, 1, 1,
0.1056475, 0.7259105, 0.6574476, 1, 1, 1, 1, 1,
0.1076385, -1.606291, 1.140116, 1, 1, 1, 1, 1,
0.11366, -0.6857543, 3.053831, 1, 1, 1, 1, 1,
0.116383, 0.2109753, -0.133671, 1, 1, 1, 1, 1,
0.1165128, -0.4974172, 1.725149, 1, 1, 1, 1, 1,
0.1224523, -0.614051, 2.075341, 1, 1, 1, 1, 1,
0.1228382, -0.5796537, 3.777282, 1, 1, 1, 1, 1,
0.1229706, 1.166385, -0.090669, 1, 1, 1, 1, 1,
0.1241737, 0.4181668, -1.152564, 1, 1, 1, 1, 1,
0.129997, 1.869134, 1.140347, 1, 1, 1, 1, 1,
0.1341622, 0.2312358, -0.4325567, 1, 1, 1, 1, 1,
0.1356688, -0.7199824, 3.349592, 1, 1, 1, 1, 1,
0.1356965, -0.05677467, 2.474647, 0, 0, 1, 1, 1,
0.1358185, 0.4636713, 1.878852, 1, 0, 0, 1, 1,
0.1364371, 1.24202, -0.9395635, 1, 0, 0, 1, 1,
0.1391294, 0.9233425, -0.3310714, 1, 0, 0, 1, 1,
0.1485968, 0.5795829, 1.763229, 1, 0, 0, 1, 1,
0.1544784, 0.3074928, -1.668947, 1, 0, 0, 1, 1,
0.1560616, 1.266052, 0.06853424, 0, 0, 0, 1, 1,
0.1574776, 0.6524102, 0.4329666, 0, 0, 0, 1, 1,
0.1578239, -0.1516979, 3.775449, 0, 0, 0, 1, 1,
0.160889, -0.9413791, 4.446157, 0, 0, 0, 1, 1,
0.1622965, 2.183048, -1.045351, 0, 0, 0, 1, 1,
0.1627826, -1.615047, 3.60725, 0, 0, 0, 1, 1,
0.1673373, -0.02769732, 0.7247688, 0, 0, 0, 1, 1,
0.1739172, 0.3155517, 2.331048, 1, 1, 1, 1, 1,
0.1762722, 1.954095, -1.023035, 1, 1, 1, 1, 1,
0.1764488, 1.045445, 0.7782235, 1, 1, 1, 1, 1,
0.1777955, 0.9290954, -0.8252544, 1, 1, 1, 1, 1,
0.1855078, 0.5245352, -0.7043744, 1, 1, 1, 1, 1,
0.1904861, 1.424932, -0.1098974, 1, 1, 1, 1, 1,
0.1937491, 0.4190888, 1.7004, 1, 1, 1, 1, 1,
0.1966627, 0.7264649, 1.303932, 1, 1, 1, 1, 1,
0.1991287, -0.2842585, 1.138202, 1, 1, 1, 1, 1,
0.2002139, -1.703836, 2.57488, 1, 1, 1, 1, 1,
0.2043614, 0.2543147, -0.8553457, 1, 1, 1, 1, 1,
0.204701, -1.770769, 3.388511, 1, 1, 1, 1, 1,
0.2056546, 0.2180288, 1.921779, 1, 1, 1, 1, 1,
0.2071672, -0.305925, 3.065425, 1, 1, 1, 1, 1,
0.2103893, 0.2180942, 2.064164, 1, 1, 1, 1, 1,
0.2113046, -0.1705318, 2.862909, 0, 0, 1, 1, 1,
0.2136848, -1.905644, 2.032443, 1, 0, 0, 1, 1,
0.2152928, 0.111221, 0.3078682, 1, 0, 0, 1, 1,
0.2161339, 1.33782, 1.247947, 1, 0, 0, 1, 1,
0.2172884, 2.224954, 0.0002692995, 1, 0, 0, 1, 1,
0.2185726, -0.3881998, 4.069206, 1, 0, 0, 1, 1,
0.2201693, 0.4218496, 3.044998, 0, 0, 0, 1, 1,
0.2224479, 0.5514492, 1.247382, 0, 0, 0, 1, 1,
0.223311, -0.3692668, 0.6389712, 0, 0, 0, 1, 1,
0.2259037, -1.204093, 2.603374, 0, 0, 0, 1, 1,
0.2267987, 0.5970547, 0.3849576, 0, 0, 0, 1, 1,
0.2357725, 0.7839193, 1.509185, 0, 0, 0, 1, 1,
0.2363013, -1.034283, 3.274885, 0, 0, 0, 1, 1,
0.2370239, -0.3119119, 1.602194, 1, 1, 1, 1, 1,
0.238838, 1.133124, 0.5899107, 1, 1, 1, 1, 1,
0.2410044, 0.7337601, 0.6963152, 1, 1, 1, 1, 1,
0.2433747, -0.3749922, 2.967268, 1, 1, 1, 1, 1,
0.2434735, 1.348819, -0.9522654, 1, 1, 1, 1, 1,
0.2462277, 1.062701, -0.5219756, 1, 1, 1, 1, 1,
0.2542515, -0.5605962, 2.38041, 1, 1, 1, 1, 1,
0.2575927, -0.5134825, 4.744134, 1, 1, 1, 1, 1,
0.2706421, -1.311528, 4.938363, 1, 1, 1, 1, 1,
0.2708942, -0.9675542, 1.806236, 1, 1, 1, 1, 1,
0.27425, 0.3367988, -1.482741, 1, 1, 1, 1, 1,
0.2774662, -0.1738161, 2.596909, 1, 1, 1, 1, 1,
0.2780436, -0.5418612, 2.786745, 1, 1, 1, 1, 1,
0.2806594, 0.005426554, 0.4355928, 1, 1, 1, 1, 1,
0.2882927, 0.502376, -0.9904215, 1, 1, 1, 1, 1,
0.2916632, -0.2753502, 3.107771, 0, 0, 1, 1, 1,
0.2947779, 2.432999, -1.642076, 1, 0, 0, 1, 1,
0.2963977, 0.6947321, 0.2132581, 1, 0, 0, 1, 1,
0.2988135, 0.345032, 0.09242101, 1, 0, 0, 1, 1,
0.305579, -0.03222794, 2.820702, 1, 0, 0, 1, 1,
0.3074442, -1.262653, 3.812395, 1, 0, 0, 1, 1,
0.3075114, -1.201195, 1.967249, 0, 0, 0, 1, 1,
0.3079359, -1.147592, 1.755092, 0, 0, 0, 1, 1,
0.3126094, -0.3580915, 0.5988911, 0, 0, 0, 1, 1,
0.3159681, 0.3124348, 0.9843192, 0, 0, 0, 1, 1,
0.3186004, 1.529416, 0.04122593, 0, 0, 0, 1, 1,
0.3236142, 0.4264849, 1.985424, 0, 0, 0, 1, 1,
0.3237953, -0.01555612, 0.8807619, 0, 0, 0, 1, 1,
0.3250178, -1.953526, 3.257347, 1, 1, 1, 1, 1,
0.3284447, -1.803953, 4.337451, 1, 1, 1, 1, 1,
0.3302114, 0.1271879, 1.050349, 1, 1, 1, 1, 1,
0.3319087, -0.605107, 2.039824, 1, 1, 1, 1, 1,
0.3350577, -0.6021674, 4.618805, 1, 1, 1, 1, 1,
0.3383352, -1.501739, 4.35351, 1, 1, 1, 1, 1,
0.3424483, 1.704471, 0.5324133, 1, 1, 1, 1, 1,
0.3451692, -0.8193777, 1.347088, 1, 1, 1, 1, 1,
0.3480795, 0.249387, 0.3770592, 1, 1, 1, 1, 1,
0.349867, -0.2262275, 3.67106, 1, 1, 1, 1, 1,
0.3568546, 0.8276942, 1.451391, 1, 1, 1, 1, 1,
0.3610187, 1.417626, -0.4442878, 1, 1, 1, 1, 1,
0.3615501, 0.677804, 2.058083, 1, 1, 1, 1, 1,
0.3646069, -1.432642, 2.301013, 1, 1, 1, 1, 1,
0.3652316, -0.9192839, 3.987878, 1, 1, 1, 1, 1,
0.3665243, -2.467884, 3.443567, 0, 0, 1, 1, 1,
0.3688067, -0.4890439, 1.539058, 1, 0, 0, 1, 1,
0.3710837, -0.2255339, 3.569263, 1, 0, 0, 1, 1,
0.3774982, 0.3037229, 0.07021284, 1, 0, 0, 1, 1,
0.3800249, -0.8096582, 3.476679, 1, 0, 0, 1, 1,
0.380165, -0.2636579, 2.049851, 1, 0, 0, 1, 1,
0.3925375, -0.7133899, 2.279811, 0, 0, 0, 1, 1,
0.3969257, -0.9373673, 2.236447, 0, 0, 0, 1, 1,
0.4027271, 1.071553, 0.4451297, 0, 0, 0, 1, 1,
0.4028153, 0.08183387, 1.633278, 0, 0, 0, 1, 1,
0.4080226, 0.6724951, 2.096223, 0, 0, 0, 1, 1,
0.4133233, 0.1206549, 1.983416, 0, 0, 0, 1, 1,
0.4157538, -0.6459493, 2.474896, 0, 0, 0, 1, 1,
0.4183347, -0.4023463, 0.9807734, 1, 1, 1, 1, 1,
0.4246447, -0.3973833, 3.843413, 1, 1, 1, 1, 1,
0.4259289, 0.3673211, -0.62561, 1, 1, 1, 1, 1,
0.4260571, 1.304114, -0.878531, 1, 1, 1, 1, 1,
0.4269665, 0.5922023, -0.1062663, 1, 1, 1, 1, 1,
0.427233, -1.122312, 3.840995, 1, 1, 1, 1, 1,
0.4359591, -1.145971, 3.413677, 1, 1, 1, 1, 1,
0.4361163, -1.074156, 2.757322, 1, 1, 1, 1, 1,
0.4365559, -0.4860817, 3.20284, 1, 1, 1, 1, 1,
0.4370447, 1.740387, 0.7409483, 1, 1, 1, 1, 1,
0.4432045, -0.1209049, 1.047318, 1, 1, 1, 1, 1,
0.4445039, 0.1829785, 1.330744, 1, 1, 1, 1, 1,
0.4446075, -0.890711, 3.636323, 1, 1, 1, 1, 1,
0.4501752, -1.263094, 4.528986, 1, 1, 1, 1, 1,
0.4517705, -0.9196295, 3.347955, 1, 1, 1, 1, 1,
0.4540772, -0.2170264, 2.559244, 0, 0, 1, 1, 1,
0.4579554, 0.837825, 0.4465807, 1, 0, 0, 1, 1,
0.4605635, 0.1339213, 1.202206, 1, 0, 0, 1, 1,
0.4610746, 2.755452, 0.7151874, 1, 0, 0, 1, 1,
0.4628691, 0.2933538, -0.8209038, 1, 0, 0, 1, 1,
0.4639541, 0.261736, 1.550736, 1, 0, 0, 1, 1,
0.4659265, -0.7747685, 1.781202, 0, 0, 0, 1, 1,
0.471512, 0.1757439, -1.644589, 0, 0, 0, 1, 1,
0.4718468, 0.5928137, 0.4107673, 0, 0, 0, 1, 1,
0.4733168, -0.4327299, -0.5489814, 0, 0, 0, 1, 1,
0.4740527, -1.335432, 3.548932, 0, 0, 0, 1, 1,
0.4810354, -0.3030363, 2.507317, 0, 0, 0, 1, 1,
0.4827905, -0.3800716, 2.478569, 0, 0, 0, 1, 1,
0.4840303, -2.073226, 2.854605, 1, 1, 1, 1, 1,
0.4851694, 1.268036, 2.168598, 1, 1, 1, 1, 1,
0.4912618, 1.586791, 0.4269062, 1, 1, 1, 1, 1,
0.4945594, 1.233865, 0.2932236, 1, 1, 1, 1, 1,
0.4970069, 0.5653995, 0.08467743, 1, 1, 1, 1, 1,
0.4972718, -0.5100997, 2.394546, 1, 1, 1, 1, 1,
0.4973386, -0.6835575, 3.217891, 1, 1, 1, 1, 1,
0.4976718, 0.9980271, 0.5944107, 1, 1, 1, 1, 1,
0.4986282, 0.2121286, 0.4933383, 1, 1, 1, 1, 1,
0.5006182, 0.7299599, -0.669241, 1, 1, 1, 1, 1,
0.5012581, -0.5141, 1.303123, 1, 1, 1, 1, 1,
0.5020488, -1.276138, 3.652939, 1, 1, 1, 1, 1,
0.5098928, -0.939605, 2.946562, 1, 1, 1, 1, 1,
0.5110802, -0.1948801, 4.467565, 1, 1, 1, 1, 1,
0.5125394, 1.393188, 2.139334, 1, 1, 1, 1, 1,
0.5138992, 1.033571, 0.20306, 0, 0, 1, 1, 1,
0.5171614, 1.035858, -0.9542322, 1, 0, 0, 1, 1,
0.5182628, -0.0707679, 1.274193, 1, 0, 0, 1, 1,
0.5187036, -0.8996239, 1.359044, 1, 0, 0, 1, 1,
0.5217918, 1.604683, 1.077891, 1, 0, 0, 1, 1,
0.5246512, 1.464885, 0.7094113, 1, 0, 0, 1, 1,
0.5257521, 0.7417371, 1.178467, 0, 0, 0, 1, 1,
0.5318088, -0.6201561, 3.505515, 0, 0, 0, 1, 1,
0.534278, 0.1425557, 0.5258862, 0, 0, 0, 1, 1,
0.5354435, 0.7197711, -0.9976642, 0, 0, 0, 1, 1,
0.5358441, 0.8635092, -1.841536, 0, 0, 0, 1, 1,
0.5372981, -1.220482, 4.397725, 0, 0, 0, 1, 1,
0.5424759, -0.2966952, 1.289313, 0, 0, 0, 1, 1,
0.545471, -0.4472398, 1.892296, 1, 1, 1, 1, 1,
0.5463485, 0.1818627, 1.671796, 1, 1, 1, 1, 1,
0.5510904, 0.1489951, 1.871644, 1, 1, 1, 1, 1,
0.5523537, -2.264068, 2.844396, 1, 1, 1, 1, 1,
0.553925, 0.6107243, 1.031272, 1, 1, 1, 1, 1,
0.5550154, 0.1102081, 2.720673, 1, 1, 1, 1, 1,
0.55525, 0.1994218, 0.4158555, 1, 1, 1, 1, 1,
0.5622092, 0.1693322, 1.835312, 1, 1, 1, 1, 1,
0.5631344, 0.6608598, 0.7804099, 1, 1, 1, 1, 1,
0.5663011, -0.6176874, 2.800782, 1, 1, 1, 1, 1,
0.5695136, -0.5671933, 2.851001, 1, 1, 1, 1, 1,
0.5786311, 1.311491, 1.692261, 1, 1, 1, 1, 1,
0.5789815, 0.04146756, 2.045834, 1, 1, 1, 1, 1,
0.5797747, 0.7253587, 0.4231561, 1, 1, 1, 1, 1,
0.5865538, -0.7626425, 1.916297, 1, 1, 1, 1, 1,
0.5921299, -0.2567333, 2.302023, 0, 0, 1, 1, 1,
0.5926505, -0.329234, 0.8611466, 1, 0, 0, 1, 1,
0.5949227, 0.1732082, 1.159989, 1, 0, 0, 1, 1,
0.5980805, -1.96756, 2.642576, 1, 0, 0, 1, 1,
0.6003501, -1.35839, 1.940214, 1, 0, 0, 1, 1,
0.6033473, -0.1079793, 2.902629, 1, 0, 0, 1, 1,
0.6073269, 0.5499646, -0.2399232, 0, 0, 0, 1, 1,
0.612081, -0.3491862, 2.613914, 0, 0, 0, 1, 1,
0.6230568, 0.05273322, 0.8067645, 0, 0, 0, 1, 1,
0.6239573, -1.08572, 1.745426, 0, 0, 0, 1, 1,
0.6290917, 0.3117087, 0.5532138, 0, 0, 0, 1, 1,
0.6325556, 0.5810825, -0.3727355, 0, 0, 0, 1, 1,
0.6358504, -0.7062454, 2.711989, 0, 0, 0, 1, 1,
0.6374802, 0.005467512, 1.302952, 1, 1, 1, 1, 1,
0.6414185, 0.5684037, 0.6949999, 1, 1, 1, 1, 1,
0.6437839, -0.6356287, 2.366735, 1, 1, 1, 1, 1,
0.6464845, 1.765066, 0.4597105, 1, 1, 1, 1, 1,
0.6491132, 0.2948366, 2.570363, 1, 1, 1, 1, 1,
0.6496816, -0.1624772, 2.679772, 1, 1, 1, 1, 1,
0.6547461, 1.606522, -0.1249575, 1, 1, 1, 1, 1,
0.6567952, 0.8954054, -1.421738, 1, 1, 1, 1, 1,
0.6575, 0.5079898, 0.6355986, 1, 1, 1, 1, 1,
0.6578848, 0.3333351, 1.733014, 1, 1, 1, 1, 1,
0.6650699, 0.2198683, -0.9548887, 1, 1, 1, 1, 1,
0.6739538, 0.4473094, 0.5721202, 1, 1, 1, 1, 1,
0.6777848, -1.646224, 0.805294, 1, 1, 1, 1, 1,
0.6844762, -0.7170475, 2.825852, 1, 1, 1, 1, 1,
0.6894731, -1.118995, 2.551969, 1, 1, 1, 1, 1,
0.6953517, 1.321771, -0.7903116, 0, 0, 1, 1, 1,
0.7003431, 0.7734845, 0.02554589, 1, 0, 0, 1, 1,
0.7116549, 0.7450841, -0.5511619, 1, 0, 0, 1, 1,
0.7120706, 1.223084, 0.4392903, 1, 0, 0, 1, 1,
0.7128564, 0.02948075, 1.820471, 1, 0, 0, 1, 1,
0.7223, -2.345673, 4.021707, 1, 0, 0, 1, 1,
0.7287841, 0.8285977, 1.30789, 0, 0, 0, 1, 1,
0.7309401, -0.08333445, 1.901013, 0, 0, 0, 1, 1,
0.7315123, -1.838009, 1.581854, 0, 0, 0, 1, 1,
0.7320744, -0.03832937, 2.293145, 0, 0, 0, 1, 1,
0.7369882, 0.235146, -0.04564743, 0, 0, 0, 1, 1,
0.7514589, -0.5549982, 3.098969, 0, 0, 0, 1, 1,
0.7542321, 2.55798, 0.07656808, 0, 0, 0, 1, 1,
0.7554103, -2.021056, 2.788939, 1, 1, 1, 1, 1,
0.759925, -0.7168434, 3.415565, 1, 1, 1, 1, 1,
0.7610824, -1.342554, 0.1223079, 1, 1, 1, 1, 1,
0.7634727, 1.189067, -0.567852, 1, 1, 1, 1, 1,
0.7644111, 0.1966558, 0.4299915, 1, 1, 1, 1, 1,
0.764477, 1.627323, -0.5218223, 1, 1, 1, 1, 1,
0.7667054, 0.2670125, 0.417085, 1, 1, 1, 1, 1,
0.7668564, -0.5924238, 3.506425, 1, 1, 1, 1, 1,
0.7678784, -0.4269851, 1.49312, 1, 1, 1, 1, 1,
0.7693236, -0.8853446, 2.922353, 1, 1, 1, 1, 1,
0.7707769, -1.981999, 4.440484, 1, 1, 1, 1, 1,
0.7742111, 1.933619, 1.310407, 1, 1, 1, 1, 1,
0.7757543, 1.420728, -0.6260331, 1, 1, 1, 1, 1,
0.776678, 0.9739807, 0.991296, 1, 1, 1, 1, 1,
0.7794156, 0.2687795, -0.4480796, 1, 1, 1, 1, 1,
0.7821766, -0.3960854, 1.705966, 0, 0, 1, 1, 1,
0.7829029, -0.7763429, 2.813361, 1, 0, 0, 1, 1,
0.7836052, 2.682611, 1.026346, 1, 0, 0, 1, 1,
0.7877622, -0.5772376, 2.392168, 1, 0, 0, 1, 1,
0.7901163, 0.2861402, 1.408994, 1, 0, 0, 1, 1,
0.7985024, 0.3573299, 1.463594, 1, 0, 0, 1, 1,
0.8007459, -0.8819599, 1.765663, 0, 0, 0, 1, 1,
0.8057657, 0.4982765, 0.5168351, 0, 0, 0, 1, 1,
0.8087337, 0.832886, 1.402295, 0, 0, 0, 1, 1,
0.8228616, -0.5066944, 1.273383, 0, 0, 0, 1, 1,
0.8270478, 0.08107135, 0.7983313, 0, 0, 0, 1, 1,
0.8285179, -1.413916, 3.318756, 0, 0, 0, 1, 1,
0.834896, 0.7022494, 0.4323518, 0, 0, 0, 1, 1,
0.8373247, -0.8220052, 0.9925037, 1, 1, 1, 1, 1,
0.8421913, -0.450141, 1.780207, 1, 1, 1, 1, 1,
0.8440407, 0.05325045, 0.3514459, 1, 1, 1, 1, 1,
0.8444582, -0.7085222, 3.391434, 1, 1, 1, 1, 1,
0.8571177, -1.341238, 1.800703, 1, 1, 1, 1, 1,
0.8589301, 0.1279559, 0.5186047, 1, 1, 1, 1, 1,
0.8590439, 1.594914, 1.110877, 1, 1, 1, 1, 1,
0.8647044, 1.115596, 0.6042122, 1, 1, 1, 1, 1,
0.8690171, 0.4404615, 0.3568326, 1, 1, 1, 1, 1,
0.8754778, 0.1228219, 1.137887, 1, 1, 1, 1, 1,
0.8763947, -1.84296, 3.332707, 1, 1, 1, 1, 1,
0.8799314, 1.123624, 0.4518011, 1, 1, 1, 1, 1,
0.8811578, 0.8584334, -1.403234, 1, 1, 1, 1, 1,
0.8840171, -0.8919473, 3.959022, 1, 1, 1, 1, 1,
0.8859757, 0.03689245, 0.168449, 1, 1, 1, 1, 1,
0.8942134, -0.8777672, 2.636914, 0, 0, 1, 1, 1,
0.8986161, 0.8064398, 2.317575, 1, 0, 0, 1, 1,
0.9032251, 1.054775, -0.0518904, 1, 0, 0, 1, 1,
0.9089677, -0.04082873, 0.8589044, 1, 0, 0, 1, 1,
0.9102309, 0.5933359, -0.2456398, 1, 0, 0, 1, 1,
0.9132443, -0.3270269, 1.764481, 1, 0, 0, 1, 1,
0.9148992, 1.621284, -0.4355551, 0, 0, 0, 1, 1,
0.9177658, 0.8656268, -0.9256792, 0, 0, 0, 1, 1,
0.9204228, 0.1686647, 0.5059406, 0, 0, 0, 1, 1,
0.9236441, -0.7972486, 0.2719225, 0, 0, 0, 1, 1,
0.9285925, -0.1865419, 1.075869, 0, 0, 0, 1, 1,
0.9310468, 0.5063483, 1.836351, 0, 0, 0, 1, 1,
0.9316007, -0.3408761, 3.308011, 0, 0, 0, 1, 1,
0.9346376, -1.265271, 2.092619, 1, 1, 1, 1, 1,
0.9360251, 1.192655, 0.613259, 1, 1, 1, 1, 1,
0.9365826, 0.1746228, 0.7350495, 1, 1, 1, 1, 1,
0.9384835, 0.5278545, 0.0540972, 1, 1, 1, 1, 1,
0.9501209, 0.4611398, 2.413838, 1, 1, 1, 1, 1,
0.9554092, 1.079718, 0.01484201, 1, 1, 1, 1, 1,
0.9587973, 0.5901564, 0.0619289, 1, 1, 1, 1, 1,
0.9631012, -1.126433, 1.67403, 1, 1, 1, 1, 1,
0.9700886, -0.4546515, 3.493021, 1, 1, 1, 1, 1,
0.9735099, -0.3323714, 1.230431, 1, 1, 1, 1, 1,
0.9770785, 0.6840803, 1.106004, 1, 1, 1, 1, 1,
0.9788363, 0.6177433, 0.8495743, 1, 1, 1, 1, 1,
0.98439, 0.2710777, 0.9002085, 1, 1, 1, 1, 1,
0.9947254, 1.254584, -0.1376232, 1, 1, 1, 1, 1,
0.9960042, 0.7343125, -1.513676, 1, 1, 1, 1, 1,
1.001758, 1.436142, -0.04427968, 0, 0, 1, 1, 1,
1.004936, -2.267442, 4.270731, 1, 0, 0, 1, 1,
1.006201, -1.727986, 3.158217, 1, 0, 0, 1, 1,
1.01246, -0.3460165, 0.5488569, 1, 0, 0, 1, 1,
1.022849, -0.3235429, 3.351403, 1, 0, 0, 1, 1,
1.026317, -2.143308, 4.073993, 1, 0, 0, 1, 1,
1.029496, 1.477364, 1.19419, 0, 0, 0, 1, 1,
1.036972, -0.350347, 0.6841959, 0, 0, 0, 1, 1,
1.043173, -0.795908, 2.76224, 0, 0, 0, 1, 1,
1.053638, 0.7187014, 2.443358, 0, 0, 0, 1, 1,
1.06328, -0.2704694, 4.918333, 0, 0, 0, 1, 1,
1.063449, 0.03392421, 2.30863, 0, 0, 0, 1, 1,
1.065117, -0.265446, -0.856618, 0, 0, 0, 1, 1,
1.065671, 0.9064128, 0.1710621, 1, 1, 1, 1, 1,
1.072195, -1.280068, 2.19298, 1, 1, 1, 1, 1,
1.075829, 0.7242607, 0.0821247, 1, 1, 1, 1, 1,
1.081024, 0.6812014, 3.152656, 1, 1, 1, 1, 1,
1.087587, -1.066309, 2.522069, 1, 1, 1, 1, 1,
1.090494, -0.2410579, 1.641432, 1, 1, 1, 1, 1,
1.114181, 0.8984306, -0.157965, 1, 1, 1, 1, 1,
1.116246, 2.337919, -0.4603995, 1, 1, 1, 1, 1,
1.13487, -2.085569, 2.889356, 1, 1, 1, 1, 1,
1.13547, -0.4169183, 2.81356, 1, 1, 1, 1, 1,
1.144737, 2.247537, -0.5596421, 1, 1, 1, 1, 1,
1.150641, 1.009894, 0.9189656, 1, 1, 1, 1, 1,
1.160796, 0.7599946, 1.560243, 1, 1, 1, 1, 1,
1.16448, 0.09230668, 0.9720557, 1, 1, 1, 1, 1,
1.17273, 0.2391428, 1.686379, 1, 1, 1, 1, 1,
1.177107, 0.02051096, 1.02605, 0, 0, 1, 1, 1,
1.178018, 2.012103, 1.825944, 1, 0, 0, 1, 1,
1.182476, -0.486144, 2.846231, 1, 0, 0, 1, 1,
1.184373, 0.1767719, 2.125073, 1, 0, 0, 1, 1,
1.188479, 1.012403, -0.2029625, 1, 0, 0, 1, 1,
1.196689, -1.878174, 3.308152, 1, 0, 0, 1, 1,
1.197444, -1.896311, 2.536872, 0, 0, 0, 1, 1,
1.197947, 0.7137805, -1.685115, 0, 0, 0, 1, 1,
1.19873, -1.079576, 1.700356, 0, 0, 0, 1, 1,
1.201373, -2.541015, 1.856558, 0, 0, 0, 1, 1,
1.201881, 1.100944, 0.3286044, 0, 0, 0, 1, 1,
1.202266, -0.01860468, 2.186775, 0, 0, 0, 1, 1,
1.205187, 0.1768501, 1.988086, 0, 0, 0, 1, 1,
1.207701, 1.807333, 1.21581, 1, 1, 1, 1, 1,
1.207979, -0.504301, 0.272136, 1, 1, 1, 1, 1,
1.209566, -0.5982453, 3.042498, 1, 1, 1, 1, 1,
1.214121, 0.07086322, 1.122924, 1, 1, 1, 1, 1,
1.215038, 1.265327, 1.637146, 1, 1, 1, 1, 1,
1.219005, -0.1217213, 1.727862, 1, 1, 1, 1, 1,
1.21998, 1.84929, 1.58019, 1, 1, 1, 1, 1,
1.220014, -0.01147566, -0.1398665, 1, 1, 1, 1, 1,
1.222658, -0.440394, 3.017798, 1, 1, 1, 1, 1,
1.225767, 0.8042704, 2.310611, 1, 1, 1, 1, 1,
1.227246, 1.764728, 0.9258856, 1, 1, 1, 1, 1,
1.227624, -0.3281592, 1.64137, 1, 1, 1, 1, 1,
1.24755, -1.560116, 0.7446533, 1, 1, 1, 1, 1,
1.249186, 0.799088, -0.009929674, 1, 1, 1, 1, 1,
1.255136, -0.3117176, 1.329877, 1, 1, 1, 1, 1,
1.259149, -1.60325, 2.620796, 0, 0, 1, 1, 1,
1.259306, -0.6444684, 2.779716, 1, 0, 0, 1, 1,
1.260861, -0.341621, 2.957921, 1, 0, 0, 1, 1,
1.270176, 0.7005854, 0.4563183, 1, 0, 0, 1, 1,
1.275881, 1.118408, 0.3659537, 1, 0, 0, 1, 1,
1.280273, -0.4004676, 2.780195, 1, 0, 0, 1, 1,
1.282141, 1.432493, 0.8295281, 0, 0, 0, 1, 1,
1.286476, -0.5035987, 2.275601, 0, 0, 0, 1, 1,
1.293997, 0.4713386, 2.761549, 0, 0, 0, 1, 1,
1.294084, -0.596369, 1.064162, 0, 0, 0, 1, 1,
1.296877, 1.469252, 0.04952806, 0, 0, 0, 1, 1,
1.301345, 1.166833, 1.37214, 0, 0, 0, 1, 1,
1.308649, 0.2633182, 2.522365, 0, 0, 0, 1, 1,
1.313809, 1.042625, 0.9877285, 1, 1, 1, 1, 1,
1.316964, 0.2633533, 2.090811, 1, 1, 1, 1, 1,
1.32108, -1.062373, 4.182409, 1, 1, 1, 1, 1,
1.326876, 1.073998, 1.693642, 1, 1, 1, 1, 1,
1.327009, 0.06535757, 1.575758, 1, 1, 1, 1, 1,
1.328632, 1.476858, -0.4091183, 1, 1, 1, 1, 1,
1.328838, -1.521121, 3.437646, 1, 1, 1, 1, 1,
1.339088, 0.03191941, 0.5408528, 1, 1, 1, 1, 1,
1.341993, 1.892057, -0.4039376, 1, 1, 1, 1, 1,
1.352374, 1.970335, 1.180407, 1, 1, 1, 1, 1,
1.36003, 1.173819, 1.180067, 1, 1, 1, 1, 1,
1.368436, -0.8518085, 2.607278, 1, 1, 1, 1, 1,
1.372459, -0.8587291, 2.650954, 1, 1, 1, 1, 1,
1.384298, 1.086592, 0.6772183, 1, 1, 1, 1, 1,
1.400084, -1.163699, 1.591939, 1, 1, 1, 1, 1,
1.401232, 1.450183, 1.523013, 0, 0, 1, 1, 1,
1.411732, -0.1419975, 1.905741, 1, 0, 0, 1, 1,
1.412359, -0.2704805, 1.937046, 1, 0, 0, 1, 1,
1.428655, -0.41405, 1.727536, 1, 0, 0, 1, 1,
1.429596, -0.3431774, 1.025532, 1, 0, 0, 1, 1,
1.435893, -1.76844, 2.866297, 1, 0, 0, 1, 1,
1.441157, -0.9836451, 1.744128, 0, 0, 0, 1, 1,
1.441894, 0.4168634, 1.525495, 0, 0, 0, 1, 1,
1.451813, 0.5802649, 1.406165, 0, 0, 0, 1, 1,
1.457944, -0.7571965, 2.221899, 0, 0, 0, 1, 1,
1.458967, 1.157449, -0.6797732, 0, 0, 0, 1, 1,
1.470782, 1.002901, 0.9734804, 0, 0, 0, 1, 1,
1.482443, 1.057582, 1.879967, 0, 0, 0, 1, 1,
1.484852, -2.191928, 1.441326, 1, 1, 1, 1, 1,
1.49144, 1.085438, 1.490082, 1, 1, 1, 1, 1,
1.493808, 1.100702, 0.9149732, 1, 1, 1, 1, 1,
1.497634, -0.1864167, 0.1066038, 1, 1, 1, 1, 1,
1.50247, -0.3134646, 1.742767, 1, 1, 1, 1, 1,
1.504158, -0.002397883, 0.8042062, 1, 1, 1, 1, 1,
1.511659, -0.4456091, 2.008116, 1, 1, 1, 1, 1,
1.523727, 0.6379228, 2.525239, 1, 1, 1, 1, 1,
1.539161, 0.8270826, 2.083453, 1, 1, 1, 1, 1,
1.563496, -1.076486, 2.600859, 1, 1, 1, 1, 1,
1.564108, -1.62117, 1.228569, 1, 1, 1, 1, 1,
1.589662, -1.069646, 1.608154, 1, 1, 1, 1, 1,
1.592406, 0.7582147, 1.990923, 1, 1, 1, 1, 1,
1.598198, 2.086833, 1.512127, 1, 1, 1, 1, 1,
1.607008, 1.392945, 0.3329034, 1, 1, 1, 1, 1,
1.625798, -0.4868987, 0.1775367, 0, 0, 1, 1, 1,
1.632182, -0.7013543, 1.167643, 1, 0, 0, 1, 1,
1.632467, 1.188147, 1.340491, 1, 0, 0, 1, 1,
1.636494, 0.1924966, 1.874197, 1, 0, 0, 1, 1,
1.650657, -1.432457, 3.623594, 1, 0, 0, 1, 1,
1.655933, 0.2833478, 1.276204, 1, 0, 0, 1, 1,
1.674267, 0.1795716, 0.218493, 0, 0, 0, 1, 1,
1.684753, 0.3402677, 0.5802313, 0, 0, 0, 1, 1,
1.717719, 0.09435616, 1.825223, 0, 0, 0, 1, 1,
1.739582, 0.5852707, 1.72175, 0, 0, 0, 1, 1,
1.759754, -0.2420633, 1.610597, 0, 0, 0, 1, 1,
1.761631, 0.05280665, 2.318674, 0, 0, 0, 1, 1,
1.768705, 0.3373934, 1.340526, 0, 0, 0, 1, 1,
1.812744, 0.9537131, 0.6513581, 1, 1, 1, 1, 1,
1.82715, 2.553296, 0.6815428, 1, 1, 1, 1, 1,
1.855356, -0.665489, 1.353736, 1, 1, 1, 1, 1,
1.856439, -0.8445695, 2.342403, 1, 1, 1, 1, 1,
1.858116, -0.4049942, 1.287926, 1, 1, 1, 1, 1,
1.920067, 0.3334561, 0.3003311, 1, 1, 1, 1, 1,
1.925277, -0.7825192, 3.797, 1, 1, 1, 1, 1,
1.93722, -0.2402543, 1.51343, 1, 1, 1, 1, 1,
1.976329, 1.56236, 1.962431, 1, 1, 1, 1, 1,
2.000967, 0.6480173, 1.357305, 1, 1, 1, 1, 1,
2.004861, -0.7314057, 2.707747, 1, 1, 1, 1, 1,
2.013065, -0.1217623, -0.4390824, 1, 1, 1, 1, 1,
2.015669, 0.194362, 2.073777, 1, 1, 1, 1, 1,
2.029463, 0.2650846, 1.983348, 1, 1, 1, 1, 1,
2.043869, -0.2292583, 1.512131, 1, 1, 1, 1, 1,
2.053195, 0.05799239, 1.386339, 0, 0, 1, 1, 1,
2.054466, -2.458636, 5.28295, 1, 0, 0, 1, 1,
2.059541, 0.8496277, 1.377941, 1, 0, 0, 1, 1,
2.065599, -1.270385, 3.472984, 1, 0, 0, 1, 1,
2.072078, 0.6744205, 1.529191, 1, 0, 0, 1, 1,
2.093223, 0.1257548, -0.5569369, 1, 0, 0, 1, 1,
2.095674, 0.8397148, -9.182785e-05, 0, 0, 0, 1, 1,
2.099726, -1.903073, 4.882425, 0, 0, 0, 1, 1,
2.154757, 0.05036015, 1.184838, 0, 0, 0, 1, 1,
2.176505, -1.686052, 2.741922, 0, 0, 0, 1, 1,
2.178521, -0.2577801, 3.311671, 0, 0, 0, 1, 1,
2.192521, 0.3195274, 0.7210668, 0, 0, 0, 1, 1,
2.217571, 0.7809623, 1.898516, 0, 0, 0, 1, 1,
2.218715, -1.391057, 1.866467, 1, 1, 1, 1, 1,
2.366422, -0.04053048, 0.07932777, 1, 1, 1, 1, 1,
2.375455, -0.1077059, 1.702929, 1, 1, 1, 1, 1,
2.479069, 1.117056, 1.973284, 1, 1, 1, 1, 1,
3.074633, 2.059382, 1.190571, 1, 1, 1, 1, 1,
3.286857, 0.3232212, 0.6235917, 1, 1, 1, 1, 1,
3.578793, 1.066395, 0.5205221, 1, 1, 1, 1, 1
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
var radius = 9.431201;
var distance = 33.12669;
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
mvMatrix.translate( -0.212358, -0.3260545, 0.001187563 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.12669);
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
