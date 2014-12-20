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
-3.503585, 1.564908, -2.820295, 1, 0, 0, 1,
-2.929174, -0.01228456, -1.681075, 1, 0.007843138, 0, 1,
-2.685141, -0.7898161, -2.970195, 1, 0.01176471, 0, 1,
-2.585764, 0.03658326, -1.534798, 1, 0.01960784, 0, 1,
-2.56527, -0.1582513, -1.688317, 1, 0.02352941, 0, 1,
-2.487086, -1.385159, -1.492149, 1, 0.03137255, 0, 1,
-2.485385, 1.721408, -2.336818, 1, 0.03529412, 0, 1,
-2.474912, 1.029041, -0.02400404, 1, 0.04313726, 0, 1,
-2.317984, 0.8062325, 0.4347577, 1, 0.04705882, 0, 1,
-2.300594, 0.4408407, -0.7295286, 1, 0.05490196, 0, 1,
-2.264616, -1.543229, -1.431522, 1, 0.05882353, 0, 1,
-2.247955, 0.6728307, -2.202167, 1, 0.06666667, 0, 1,
-2.185478, -1.214632, -1.618664, 1, 0.07058824, 0, 1,
-2.176373, 0.02269066, -1.128957, 1, 0.07843138, 0, 1,
-2.156583, 0.6929563, -1.677321, 1, 0.08235294, 0, 1,
-2.134995, 0.8418871, -1.83747, 1, 0.09019608, 0, 1,
-2.127039, 0.3897236, -0.8720275, 1, 0.09411765, 0, 1,
-2.095084, 0.3359928, -1.880243, 1, 0.1019608, 0, 1,
-2.074809, 0.1847539, -1.890619, 1, 0.1098039, 0, 1,
-2.057518, -1.467814, -2.126132, 1, 0.1137255, 0, 1,
-2.050495, 0.7761554, -2.427075, 1, 0.1215686, 0, 1,
-2.019002, -1.291184, -2.793463, 1, 0.1254902, 0, 1,
-2.018836, 0.2244479, 0.9080469, 1, 0.1333333, 0, 1,
-1.979361, -1.613386, -3.552232, 1, 0.1372549, 0, 1,
-1.964858, 0.3968072, -2.195724, 1, 0.145098, 0, 1,
-1.962208, 0.5403736, -0.4959738, 1, 0.1490196, 0, 1,
-1.948672, 1.063163, -1.536022, 1, 0.1568628, 0, 1,
-1.931576, -0.1008235, -2.253894, 1, 0.1607843, 0, 1,
-1.928457, 0.6958541, -1.689634, 1, 0.1686275, 0, 1,
-1.916875, -0.01583864, -2.19309, 1, 0.172549, 0, 1,
-1.907858, 0.4128262, -1.63528, 1, 0.1803922, 0, 1,
-1.904271, -0.870998, -2.668408, 1, 0.1843137, 0, 1,
-1.902743, -0.3205246, -1.466897, 1, 0.1921569, 0, 1,
-1.879517, 0.3404364, -2.703767, 1, 0.1960784, 0, 1,
-1.859238, -0.5101478, -1.759274, 1, 0.2039216, 0, 1,
-1.845572, 0.5319998, -2.001272, 1, 0.2117647, 0, 1,
-1.838694, -0.8169098, -1.761339, 1, 0.2156863, 0, 1,
-1.837151, -0.9865112, -0.878223, 1, 0.2235294, 0, 1,
-1.819483, 0.3787337, -1.826073, 1, 0.227451, 0, 1,
-1.802633, 0.2749736, 0.3556737, 1, 0.2352941, 0, 1,
-1.801177, -0.8488087, -2.495298, 1, 0.2392157, 0, 1,
-1.791387, -0.1718975, 0.1321171, 1, 0.2470588, 0, 1,
-1.730731, 1.272694, -2.207697, 1, 0.2509804, 0, 1,
-1.689128, -0.2397911, -1.848013, 1, 0.2588235, 0, 1,
-1.682865, -0.8021951, -0.1309835, 1, 0.2627451, 0, 1,
-1.671514, -0.5386561, -0.2095455, 1, 0.2705882, 0, 1,
-1.662128, 0.4582565, -2.118658, 1, 0.2745098, 0, 1,
-1.642729, 0.1668721, -0.9636849, 1, 0.282353, 0, 1,
-1.641823, 0.9961101, -1.058867, 1, 0.2862745, 0, 1,
-1.638576, 1.169062, -0.1399209, 1, 0.2941177, 0, 1,
-1.615726, -0.7705303, -3.166606, 1, 0.3019608, 0, 1,
-1.613487, -2.142511, -3.050981, 1, 0.3058824, 0, 1,
-1.602651, 0.4648693, -1.621628, 1, 0.3137255, 0, 1,
-1.600567, -1.16377, -1.651984, 1, 0.3176471, 0, 1,
-1.586733, 0.3720838, -1.534646, 1, 0.3254902, 0, 1,
-1.586055, 0.05425107, -4.170326, 1, 0.3294118, 0, 1,
-1.584767, -1.510897, -2.131383, 1, 0.3372549, 0, 1,
-1.583897, 0.4589441, -2.059944, 1, 0.3411765, 0, 1,
-1.565592, 0.1743092, -1.281906, 1, 0.3490196, 0, 1,
-1.551962, 1.795869, 0.9107889, 1, 0.3529412, 0, 1,
-1.542113, 0.1794362, -1.92973, 1, 0.3607843, 0, 1,
-1.5354, -0.8003179, -2.867813, 1, 0.3647059, 0, 1,
-1.531046, 1.407413, 0.8694557, 1, 0.372549, 0, 1,
-1.520274, 0.06488003, -2.732499, 1, 0.3764706, 0, 1,
-1.519501, 1.53076, -0.8612915, 1, 0.3843137, 0, 1,
-1.498213, -0.1127935, 0.3720737, 1, 0.3882353, 0, 1,
-1.495467, -0.6309933, -2.312372, 1, 0.3960784, 0, 1,
-1.49387, -0.2675294, -1.911529, 1, 0.4039216, 0, 1,
-1.493625, 1.936794, -0.2199538, 1, 0.4078431, 0, 1,
-1.465845, 0.8144332, -0.9508047, 1, 0.4156863, 0, 1,
-1.465666, 1.607728, -2.003064, 1, 0.4196078, 0, 1,
-1.463494, -1.21167, -1.928881, 1, 0.427451, 0, 1,
-1.455075, -1.274081, -1.975514, 1, 0.4313726, 0, 1,
-1.454777, 0.008849942, -3.04967, 1, 0.4392157, 0, 1,
-1.454018, -1.126188, -2.570691, 1, 0.4431373, 0, 1,
-1.447336, -0.0542253, 0.826923, 1, 0.4509804, 0, 1,
-1.418006, 1.791818, -1.551596, 1, 0.454902, 0, 1,
-1.410511, -0.6826496, -2.116894, 1, 0.4627451, 0, 1,
-1.398566, -1.792961, -1.839455, 1, 0.4666667, 0, 1,
-1.385266, -1.094047, -3.32893, 1, 0.4745098, 0, 1,
-1.379853, 0.4661318, -0.1238208, 1, 0.4784314, 0, 1,
-1.36617, -0.7022666, -0.9098351, 1, 0.4862745, 0, 1,
-1.364328, -0.3506545, -2.697283, 1, 0.4901961, 0, 1,
-1.33979, 0.4982411, -1.092402, 1, 0.4980392, 0, 1,
-1.326437, -2.540742, -1.8002, 1, 0.5058824, 0, 1,
-1.323117, 1.08917, -1.307547, 1, 0.509804, 0, 1,
-1.318165, 2.545926, 0.3766564, 1, 0.5176471, 0, 1,
-1.316952, 0.6728953, -2.721078, 1, 0.5215687, 0, 1,
-1.315328, 0.6099517, -2.176093, 1, 0.5294118, 0, 1,
-1.311991, 1.231476, 0.00440516, 1, 0.5333334, 0, 1,
-1.307525, -0.5777586, -2.78383, 1, 0.5411765, 0, 1,
-1.296827, 0.2549766, -0.6527272, 1, 0.5450981, 0, 1,
-1.295353, -1.722415, -1.771526, 1, 0.5529412, 0, 1,
-1.292781, 0.4944572, -0.3840404, 1, 0.5568628, 0, 1,
-1.28375, -0.45548, -1.718551, 1, 0.5647059, 0, 1,
-1.248074, 1.103543, -1.129704, 1, 0.5686275, 0, 1,
-1.247235, -0.4975317, -2.868104, 1, 0.5764706, 0, 1,
-1.243703, -1.244328, -2.617174, 1, 0.5803922, 0, 1,
-1.243606, 1.574326, -0.9658843, 1, 0.5882353, 0, 1,
-1.226555, -0.9837066, -1.846969, 1, 0.5921569, 0, 1,
-1.226285, -0.7638617, -2.061176, 1, 0.6, 0, 1,
-1.225484, 0.3189129, -0.6521707, 1, 0.6078432, 0, 1,
-1.212383, -0.4390364, -1.239281, 1, 0.6117647, 0, 1,
-1.209199, 1.480351, -1.737619, 1, 0.6196079, 0, 1,
-1.197316, 1.479816, -1.028189, 1, 0.6235294, 0, 1,
-1.193288, -0.4420524, -2.214864, 1, 0.6313726, 0, 1,
-1.186525, -0.1849067, -0.3169283, 1, 0.6352941, 0, 1,
-1.180276, -0.4645395, -2.040664, 1, 0.6431373, 0, 1,
-1.174884, 0.02858604, -1.201941, 1, 0.6470588, 0, 1,
-1.173437, 0.1364241, -1.739451, 1, 0.654902, 0, 1,
-1.169802, 0.5271934, -1.838706, 1, 0.6588235, 0, 1,
-1.158734, -0.4003303, -1.925858, 1, 0.6666667, 0, 1,
-1.158653, -0.8019483, -1.711611, 1, 0.6705883, 0, 1,
-1.157495, -0.1749207, -2.259518, 1, 0.6784314, 0, 1,
-1.156853, -0.9124669, -1.697278, 1, 0.682353, 0, 1,
-1.153688, -1.176006, -4.165315, 1, 0.6901961, 0, 1,
-1.150669, 0.1795524, -1.294474, 1, 0.6941177, 0, 1,
-1.148277, 0.4360613, -0.8314106, 1, 0.7019608, 0, 1,
-1.144661, 1.916936, -1.06327, 1, 0.7098039, 0, 1,
-1.137362, 1.704272, -1.428954, 1, 0.7137255, 0, 1,
-1.120912, 1.366763, -0.9450901, 1, 0.7215686, 0, 1,
-1.108007, 0.7264086, 1.635226, 1, 0.7254902, 0, 1,
-1.107092, 1.20835, -0.5653114, 1, 0.7333333, 0, 1,
-1.10011, 1.053166, -1.89906, 1, 0.7372549, 0, 1,
-1.091211, -0.9904294, -3.835084, 1, 0.7450981, 0, 1,
-1.089996, -1.561986, -3.634095, 1, 0.7490196, 0, 1,
-1.089437, -0.6299422, -3.343639, 1, 0.7568628, 0, 1,
-1.083204, -1.449359, -4.184211, 1, 0.7607843, 0, 1,
-1.082512, -1.834776, -2.154337, 1, 0.7686275, 0, 1,
-1.082474, 1.249948, -0.9063676, 1, 0.772549, 0, 1,
-1.080733, 0.5661251, -0.5229309, 1, 0.7803922, 0, 1,
-1.077439, -1.13464, -1.447081, 1, 0.7843137, 0, 1,
-1.076443, 0.5910802, -2.493742, 1, 0.7921569, 0, 1,
-1.070686, -0.1781556, -3.346433, 1, 0.7960784, 0, 1,
-1.06302, 1.068928, -0.9959173, 1, 0.8039216, 0, 1,
-1.057127, 0.1170733, -0.3226019, 1, 0.8117647, 0, 1,
-1.056026, 0.7497712, -0.7364026, 1, 0.8156863, 0, 1,
-1.05338, -0.5482807, -2.574551, 1, 0.8235294, 0, 1,
-1.051756, -0.6702324, -2.527543, 1, 0.827451, 0, 1,
-1.050503, -2.023729, -2.064574, 1, 0.8352941, 0, 1,
-1.041108, 2.133661, -1.983763, 1, 0.8392157, 0, 1,
-1.040757, 1.333894, 0.02668587, 1, 0.8470588, 0, 1,
-1.039048, 0.4735891, -1.816649, 1, 0.8509804, 0, 1,
-1.034992, 3.920102, 0.5814303, 1, 0.8588235, 0, 1,
-1.033638, 1.179134, -2.15154, 1, 0.8627451, 0, 1,
-1.028053, 0.4238288, 1.01133, 1, 0.8705882, 0, 1,
-1.017377, -0.6552975, -0.7720072, 1, 0.8745098, 0, 1,
-1.014239, 1.521977, -0.7200303, 1, 0.8823529, 0, 1,
-1.013896, -0.03859828, -2.600181, 1, 0.8862745, 0, 1,
-1.013451, 1.213391, -0.5184068, 1, 0.8941177, 0, 1,
-1.011685, 0.7350386, 0.9175767, 1, 0.8980392, 0, 1,
-0.9964377, 0.5826963, -1.124022, 1, 0.9058824, 0, 1,
-0.9917214, -0.08246337, -1.685902, 1, 0.9137255, 0, 1,
-0.9843643, 0.02194164, -1.113669, 1, 0.9176471, 0, 1,
-0.9839962, 0.6021984, 0.4108019, 1, 0.9254902, 0, 1,
-0.979427, 0.821493, -0.2447959, 1, 0.9294118, 0, 1,
-0.9791902, 0.2437854, -1.475538, 1, 0.9372549, 0, 1,
-0.971634, -0.1707617, -0.301024, 1, 0.9411765, 0, 1,
-0.964537, 0.5574771, -2.036645, 1, 0.9490196, 0, 1,
-0.9642957, -1.375367, -1.097356, 1, 0.9529412, 0, 1,
-0.9628665, -0.3514915, -3.48724, 1, 0.9607843, 0, 1,
-0.9606865, 1.881428, -0.414495, 1, 0.9647059, 0, 1,
-0.9592786, 0.2938115, -1.163466, 1, 0.972549, 0, 1,
-0.958378, -0.4133659, -0.2503512, 1, 0.9764706, 0, 1,
-0.9564947, 0.2501678, -0.4424559, 1, 0.9843137, 0, 1,
-0.9537078, -3.315912, -2.870903, 1, 0.9882353, 0, 1,
-0.9519385, -0.8152252, -4.246809, 1, 0.9960784, 0, 1,
-0.950406, 1.802243, -0.05608386, 0.9960784, 1, 0, 1,
-0.9501204, -1.378403, -3.203147, 0.9921569, 1, 0, 1,
-0.9496368, 0.269084, -2.241174, 0.9843137, 1, 0, 1,
-0.9435293, -0.1706226, -2.811673, 0.9803922, 1, 0, 1,
-0.9401976, 0.04763135, -1.779399, 0.972549, 1, 0, 1,
-0.9121848, -0.8954449, -3.962761, 0.9686275, 1, 0, 1,
-0.9116379, -0.1586197, -0.8832092, 0.9607843, 1, 0, 1,
-0.9112496, -1.393061, -3.332225, 0.9568627, 1, 0, 1,
-0.9097615, 0.9703397, 0.3272829, 0.9490196, 1, 0, 1,
-0.9078202, -0.2603852, -2.111389, 0.945098, 1, 0, 1,
-0.9057502, 1.450724, 0.08569459, 0.9372549, 1, 0, 1,
-0.9045973, -1.073249, -1.449957, 0.9333333, 1, 0, 1,
-0.8981138, 0.2907129, -2.833128, 0.9254902, 1, 0, 1,
-0.8926737, -0.8666366, -2.843998, 0.9215686, 1, 0, 1,
-0.8918808, -0.2584886, -1.02614, 0.9137255, 1, 0, 1,
-0.8865554, 0.7036777, -1.315083, 0.9098039, 1, 0, 1,
-0.8803673, -0.9937606, -2.422542, 0.9019608, 1, 0, 1,
-0.8792756, -1.173056, -2.174665, 0.8941177, 1, 0, 1,
-0.8763876, -0.3492464, -2.134978, 0.8901961, 1, 0, 1,
-0.8746451, 0.8753126, -3.222532, 0.8823529, 1, 0, 1,
-0.8718642, -0.6969593, -1.18089, 0.8784314, 1, 0, 1,
-0.864695, 2.48086, -1.170308, 0.8705882, 1, 0, 1,
-0.862585, -0.5676212, -2.251505, 0.8666667, 1, 0, 1,
-0.8610578, -0.6821043, -1.924562, 0.8588235, 1, 0, 1,
-0.8591479, -0.139022, -1.883459, 0.854902, 1, 0, 1,
-0.8515154, 1.000297, 0.728265, 0.8470588, 1, 0, 1,
-0.8440675, 0.650862, -2.690049, 0.8431373, 1, 0, 1,
-0.843408, -0.4968667, -1.213498, 0.8352941, 1, 0, 1,
-0.8407549, 1.024698, -1.011256, 0.8313726, 1, 0, 1,
-0.8365048, 0.1717948, -0.7919188, 0.8235294, 1, 0, 1,
-0.8335009, 0.2639003, -0.9122596, 0.8196079, 1, 0, 1,
-0.830974, -0.182738, -1.273545, 0.8117647, 1, 0, 1,
-0.8289244, -0.5129901, -2.356525, 0.8078431, 1, 0, 1,
-0.8266482, 1.450283, -1.186898, 0.8, 1, 0, 1,
-0.8203138, -1.080846, -4.591671, 0.7921569, 1, 0, 1,
-0.8199041, 0.8103598, -0.9490584, 0.7882353, 1, 0, 1,
-0.8168835, 1.776715, 0.342601, 0.7803922, 1, 0, 1,
-0.8144484, -0.2866591, -1.065196, 0.7764706, 1, 0, 1,
-0.8130042, -0.1154433, 0.2351991, 0.7686275, 1, 0, 1,
-0.8119256, -0.4914598, -2.246979, 0.7647059, 1, 0, 1,
-0.8093215, 1.255976, -0.5202855, 0.7568628, 1, 0, 1,
-0.8082252, -1.051345, -1.441486, 0.7529412, 1, 0, 1,
-0.7965213, 0.1410979, -1.329944, 0.7450981, 1, 0, 1,
-0.7926098, -1.157092, -3.948452, 0.7411765, 1, 0, 1,
-0.7922496, -0.3473932, -1.958105, 0.7333333, 1, 0, 1,
-0.7916172, -1.898716, -4.006392, 0.7294118, 1, 0, 1,
-0.7895261, 0.1847436, -2.018649, 0.7215686, 1, 0, 1,
-0.7861245, -0.03610536, -1.907693, 0.7176471, 1, 0, 1,
-0.7787794, -0.1972249, -2.978991, 0.7098039, 1, 0, 1,
-0.776421, 0.3241303, -1.725999, 0.7058824, 1, 0, 1,
-0.7753646, 1.375093, -1.002873, 0.6980392, 1, 0, 1,
-0.7753409, -0.6418778, -0.9464411, 0.6901961, 1, 0, 1,
-0.7728512, 0.1908752, -1.885332, 0.6862745, 1, 0, 1,
-0.7699187, -0.3607808, -2.770694, 0.6784314, 1, 0, 1,
-0.7687043, 1.529609, -3.900995, 0.6745098, 1, 0, 1,
-0.7675173, -1.22508, -3.938233, 0.6666667, 1, 0, 1,
-0.7600461, -2.196223, -3.149046, 0.6627451, 1, 0, 1,
-0.7597267, -0.4104443, -1.922093, 0.654902, 1, 0, 1,
-0.7580637, 0.1635288, -0.616897, 0.6509804, 1, 0, 1,
-0.7556222, 0.9570509, 0.5255515, 0.6431373, 1, 0, 1,
-0.7489095, -1.091538, -2.316282, 0.6392157, 1, 0, 1,
-0.7479501, 0.06425646, -2.058504, 0.6313726, 1, 0, 1,
-0.7408355, 0.1077735, -1.395398, 0.627451, 1, 0, 1,
-0.7386211, 0.5389234, -1.601439, 0.6196079, 1, 0, 1,
-0.7378674, 1.260262, 1.304314, 0.6156863, 1, 0, 1,
-0.7357838, 1.080538, -1.842116, 0.6078432, 1, 0, 1,
-0.7299604, -1.404093, -1.612134, 0.6039216, 1, 0, 1,
-0.726637, 0.7159423, 0.128877, 0.5960785, 1, 0, 1,
-0.7176118, -0.1860747, -2.959201, 0.5882353, 1, 0, 1,
-0.7129669, -0.2183659, -2.959191, 0.5843138, 1, 0, 1,
-0.7127986, -0.2987175, 0.2445644, 0.5764706, 1, 0, 1,
-0.7117707, -0.8746758, -3.761239, 0.572549, 1, 0, 1,
-0.7113075, 0.6789693, -1.893262, 0.5647059, 1, 0, 1,
-0.7083691, -0.2906537, -2.754822, 0.5607843, 1, 0, 1,
-0.70214, -0.5359778, -2.915647, 0.5529412, 1, 0, 1,
-0.6945922, 1.122216, -0.4492653, 0.5490196, 1, 0, 1,
-0.6923189, -0.754391, -3.898977, 0.5411765, 1, 0, 1,
-0.6890345, -0.5200632, -2.981281, 0.5372549, 1, 0, 1,
-0.6883693, -1.092723, -2.277067, 0.5294118, 1, 0, 1,
-0.6855167, 0.1689393, -2.381305, 0.5254902, 1, 0, 1,
-0.6833432, -0.8149852, -2.763724, 0.5176471, 1, 0, 1,
-0.6794051, -0.479569, -0.1696081, 0.5137255, 1, 0, 1,
-0.6778748, 1.212096, 0.3034627, 0.5058824, 1, 0, 1,
-0.6729015, -1.811957, -3.36828, 0.5019608, 1, 0, 1,
-0.6726677, 0.1756492, -2.41916, 0.4941176, 1, 0, 1,
-0.6674148, 1.668602, -1.662835, 0.4862745, 1, 0, 1,
-0.6651949, 0.5016053, -1.837029, 0.4823529, 1, 0, 1,
-0.663529, 0.2927934, -0.05118224, 0.4745098, 1, 0, 1,
-0.6621015, 1.221908, -0.4899698, 0.4705882, 1, 0, 1,
-0.6603817, -1.218192, -3.096751, 0.4627451, 1, 0, 1,
-0.6581771, -1.486168, -4.259899, 0.4588235, 1, 0, 1,
-0.6577597, -1.483803, -1.651613, 0.4509804, 1, 0, 1,
-0.6517562, -2.277134, -2.508586, 0.4470588, 1, 0, 1,
-0.6430837, 0.9155962, -1.475121, 0.4392157, 1, 0, 1,
-0.6381204, 1.207748, -0.02176879, 0.4352941, 1, 0, 1,
-0.6370539, -0.9029281, -3.851397, 0.427451, 1, 0, 1,
-0.6344211, -1.776929, -1.256791, 0.4235294, 1, 0, 1,
-0.6295652, -0.08694346, -0.1732128, 0.4156863, 1, 0, 1,
-0.6287201, 1.945078, 0.7909675, 0.4117647, 1, 0, 1,
-0.6247668, 1.283956, -0.06488794, 0.4039216, 1, 0, 1,
-0.6204041, 0.5098057, -3.045785, 0.3960784, 1, 0, 1,
-0.6202759, 0.4888528, -1.330353, 0.3921569, 1, 0, 1,
-0.6173311, -0.01457727, -1.698122, 0.3843137, 1, 0, 1,
-0.6169671, -0.5559919, -0.5364031, 0.3803922, 1, 0, 1,
-0.6162254, -0.07671361, -1.026549, 0.372549, 1, 0, 1,
-0.6012455, -0.4558866, -3.397106, 0.3686275, 1, 0, 1,
-0.6004169, 0.3979398, -0.5904381, 0.3607843, 1, 0, 1,
-0.5966344, 0.3035665, -2.400879, 0.3568628, 1, 0, 1,
-0.5881031, -1.266448, -4.099807, 0.3490196, 1, 0, 1,
-0.5836609, 0.180623, -2.515887, 0.345098, 1, 0, 1,
-0.5819917, 1.058183, 1.153865, 0.3372549, 1, 0, 1,
-0.5790326, 0.6403884, 0.05876761, 0.3333333, 1, 0, 1,
-0.5787159, 1.297314, 0.5539049, 0.3254902, 1, 0, 1,
-0.5785205, 0.9303026, -0.9464247, 0.3215686, 1, 0, 1,
-0.5740728, -0.2686442, -1.164501, 0.3137255, 1, 0, 1,
-0.5718938, 1.031751, 1.834051, 0.3098039, 1, 0, 1,
-0.5707232, 0.9853864, 0.363984, 0.3019608, 1, 0, 1,
-0.5683318, -0.6565781, -1.910656, 0.2941177, 1, 0, 1,
-0.5682372, 1.013123, -1.758949, 0.2901961, 1, 0, 1,
-0.5676465, -0.5763266, -1.321076, 0.282353, 1, 0, 1,
-0.5646237, -0.0004612698, -1.521448, 0.2784314, 1, 0, 1,
-0.5638278, 0.878358, -0.1826466, 0.2705882, 1, 0, 1,
-0.5590871, -0.4851081, -2.206668, 0.2666667, 1, 0, 1,
-0.5569544, 0.6570199, -0.7800308, 0.2588235, 1, 0, 1,
-0.5516014, -1.906113, -2.427521, 0.254902, 1, 0, 1,
-0.5458726, -1.139349, -1.95838, 0.2470588, 1, 0, 1,
-0.5435963, 0.2004701, -1.503459, 0.2431373, 1, 0, 1,
-0.534531, -0.204212, -0.3332036, 0.2352941, 1, 0, 1,
-0.5259879, 0.7908831, -0.3689884, 0.2313726, 1, 0, 1,
-0.5256993, -1.304377, -3.450312, 0.2235294, 1, 0, 1,
-0.5233498, 0.06332813, 0.05117794, 0.2196078, 1, 0, 1,
-0.5204577, -0.6417643, -1.994601, 0.2117647, 1, 0, 1,
-0.5203317, -0.6351436, -3.618429, 0.2078431, 1, 0, 1,
-0.5139248, 0.5011652, 0.4915917, 0.2, 1, 0, 1,
-0.5070606, 0.7601211, -0.3689691, 0.1921569, 1, 0, 1,
-0.5045217, -1.548056, -4.048975, 0.1882353, 1, 0, 1,
-0.5012746, -0.7790167, -1.757975, 0.1803922, 1, 0, 1,
-0.499584, 0.1198051, -1.569327, 0.1764706, 1, 0, 1,
-0.4958697, 0.1002019, -2.915622, 0.1686275, 1, 0, 1,
-0.4940101, 0.7232401, -1.176193, 0.1647059, 1, 0, 1,
-0.4905705, 0.3022262, -0.6720232, 0.1568628, 1, 0, 1,
-0.4888279, 1.747592, -1.040079, 0.1529412, 1, 0, 1,
-0.4888096, -0.211271, -0.2868074, 0.145098, 1, 0, 1,
-0.4887986, 1.546116, -0.5768204, 0.1411765, 1, 0, 1,
-0.4834129, -0.9973785, -2.923749, 0.1333333, 1, 0, 1,
-0.4828697, -0.923436, -2.402406, 0.1294118, 1, 0, 1,
-0.4784787, 2.192913, 0.4049585, 0.1215686, 1, 0, 1,
-0.4779708, -1.342218, -2.235229, 0.1176471, 1, 0, 1,
-0.4742765, 0.6167831, -0.2075868, 0.1098039, 1, 0, 1,
-0.4739461, 0.5930762, 0.1290746, 0.1058824, 1, 0, 1,
-0.4709766, 1.342611, -0.4174917, 0.09803922, 1, 0, 1,
-0.4691726, 0.3286062, 0.626959, 0.09019608, 1, 0, 1,
-0.4669385, 1.171781, 0.2194214, 0.08627451, 1, 0, 1,
-0.4655624, 1.016001, 0.5605097, 0.07843138, 1, 0, 1,
-0.4636856, 0.7579138, -0.04408893, 0.07450981, 1, 0, 1,
-0.4608893, -0.3946843, -2.639094, 0.06666667, 1, 0, 1,
-0.4589222, -0.2078878, -1.58715, 0.0627451, 1, 0, 1,
-0.4490699, 0.6229333, -1.611824, 0.05490196, 1, 0, 1,
-0.4454912, 1.266066, 0.8376937, 0.05098039, 1, 0, 1,
-0.4432656, -0.3551559, -3.796979, 0.04313726, 1, 0, 1,
-0.4391895, -0.7524797, -1.416083, 0.03921569, 1, 0, 1,
-0.4350628, 0.2470604, -0.5652283, 0.03137255, 1, 0, 1,
-0.4268839, -0.005911544, -1.221083, 0.02745098, 1, 0, 1,
-0.419081, -0.8337159, -2.796965, 0.01960784, 1, 0, 1,
-0.4188411, -0.6662718, -0.94379, 0.01568628, 1, 0, 1,
-0.415536, -0.8435243, -1.966549, 0.007843138, 1, 0, 1,
-0.4151516, 0.1668189, -2.994102, 0.003921569, 1, 0, 1,
-0.4101263, -0.7896603, -1.865752, 0, 1, 0.003921569, 1,
-0.4055089, 1.493502, -0.9948736, 0, 1, 0.01176471, 1,
-0.4023815, -0.9235399, -4.011463, 0, 1, 0.01568628, 1,
-0.3996552, 0.4894801, -0.2112753, 0, 1, 0.02352941, 1,
-0.3979304, 1.254964, -0.02803989, 0, 1, 0.02745098, 1,
-0.3974499, -0.4430018, -1.151408, 0, 1, 0.03529412, 1,
-0.389309, -0.05897334, -1.619073, 0, 1, 0.03921569, 1,
-0.3867474, 0.06447296, -1.297878, 0, 1, 0.04705882, 1,
-0.3859961, 0.1863461, -2.346438, 0, 1, 0.05098039, 1,
-0.385568, -1.254851, -4.102332, 0, 1, 0.05882353, 1,
-0.3848485, 0.3012257, -0.9198823, 0, 1, 0.0627451, 1,
-0.384701, -0.3281115, -3.457146, 0, 1, 0.07058824, 1,
-0.3793783, -1.211707, -2.99103, 0, 1, 0.07450981, 1,
-0.3788754, 0.3113548, -0.9730703, 0, 1, 0.08235294, 1,
-0.3766911, 0.01738171, -2.432898, 0, 1, 0.08627451, 1,
-0.3693112, 0.417278, -1.186295, 0, 1, 0.09411765, 1,
-0.3692972, 0.7431512, -1.537161, 0, 1, 0.1019608, 1,
-0.368506, -1.955479, -4.532646, 0, 1, 0.1058824, 1,
-0.3667157, 0.171617, -0.07602614, 0, 1, 0.1137255, 1,
-0.3646667, 0.5160438, -0.4148769, 0, 1, 0.1176471, 1,
-0.3642351, 0.3857433, -1.009879, 0, 1, 0.1254902, 1,
-0.3613873, -1.226204, -2.945413, 0, 1, 0.1294118, 1,
-0.3609363, 0.9980746, -0.1724372, 0, 1, 0.1372549, 1,
-0.3584951, 0.4989425, -1.813497, 0, 1, 0.1411765, 1,
-0.3559955, 0.1881876, -1.101847, 0, 1, 0.1490196, 1,
-0.3514599, 0.8359455, 0.2809638, 0, 1, 0.1529412, 1,
-0.3468247, 1.179443, -1.022648, 0, 1, 0.1607843, 1,
-0.3404448, 1.680183, -2.042062, 0, 1, 0.1647059, 1,
-0.3403784, -2.757994, -2.337457, 0, 1, 0.172549, 1,
-0.3389852, -0.2350859, -2.806805, 0, 1, 0.1764706, 1,
-0.3376724, 0.1011522, -1.21592, 0, 1, 0.1843137, 1,
-0.3340558, 1.860647, 0.1476279, 0, 1, 0.1882353, 1,
-0.3337359, 1.091472, 1.087009, 0, 1, 0.1960784, 1,
-0.3318198, 0.9818777, 0.9995646, 0, 1, 0.2039216, 1,
-0.3295512, 1.236244, 1.763166, 0, 1, 0.2078431, 1,
-0.3245116, -0.8917827, -3.727624, 0, 1, 0.2156863, 1,
-0.3200762, 1.507155, 0.3960793, 0, 1, 0.2196078, 1,
-0.3137902, -0.5686502, -3.714856, 0, 1, 0.227451, 1,
-0.3130705, 1.726557, -0.9498593, 0, 1, 0.2313726, 1,
-0.3128188, 0.3042023, -0.7338135, 0, 1, 0.2392157, 1,
-0.311887, -0.3095861, -2.843706, 0, 1, 0.2431373, 1,
-0.3117749, -0.7107515, -3.521461, 0, 1, 0.2509804, 1,
-0.3052, -2.111761, -3.68575, 0, 1, 0.254902, 1,
-0.3036093, 1.366024, 0.7917919, 0, 1, 0.2627451, 1,
-0.2993962, 0.5588982, -1.002596, 0, 1, 0.2666667, 1,
-0.2993336, 1.644251, 0.100245, 0, 1, 0.2745098, 1,
-0.2991097, -0.8616922, -3.174426, 0, 1, 0.2784314, 1,
-0.2974902, 2.238503, -0.4741931, 0, 1, 0.2862745, 1,
-0.2946983, 0.05985189, -0.6155636, 0, 1, 0.2901961, 1,
-0.2940064, 1.218023, 0.3953055, 0, 1, 0.2980392, 1,
-0.2854159, 0.3504446, 1.01923, 0, 1, 0.3058824, 1,
-0.2831445, 1.391817, 1.523107, 0, 1, 0.3098039, 1,
-0.2758572, -0.06683079, -1.431951, 0, 1, 0.3176471, 1,
-0.2738879, 1.989756, -0.3981061, 0, 1, 0.3215686, 1,
-0.2727616, 0.6284721, 0.001907108, 0, 1, 0.3294118, 1,
-0.2713352, -0.6892168, -3.840285, 0, 1, 0.3333333, 1,
-0.2708755, 0.4442598, 0.9159487, 0, 1, 0.3411765, 1,
-0.2670581, 0.7550158, -0.844947, 0, 1, 0.345098, 1,
-0.2624446, -0.2675596, -3.597793, 0, 1, 0.3529412, 1,
-0.2618422, 0.9333893, -0.7335654, 0, 1, 0.3568628, 1,
-0.2521349, -0.210421, -4.008245, 0, 1, 0.3647059, 1,
-0.2515039, 0.2124063, -1.221774, 0, 1, 0.3686275, 1,
-0.249043, 1.141982, -1.723403, 0, 1, 0.3764706, 1,
-0.2473399, 1.297185, -0.9139591, 0, 1, 0.3803922, 1,
-0.2437925, -0.2153321, -2.321344, 0, 1, 0.3882353, 1,
-0.2432564, 1.189856, -0.5917292, 0, 1, 0.3921569, 1,
-0.2398738, 1.268114, -0.07921514, 0, 1, 0.4, 1,
-0.2354495, -0.1150153, -3.279746, 0, 1, 0.4078431, 1,
-0.2300411, 0.0592201, 0.2007383, 0, 1, 0.4117647, 1,
-0.2287397, 1.046452, 1.733541, 0, 1, 0.4196078, 1,
-0.2246076, 0.289931, -1.209271, 0, 1, 0.4235294, 1,
-0.2213949, -0.4836798, -1.798354, 0, 1, 0.4313726, 1,
-0.2200573, -0.21789, -0.9884974, 0, 1, 0.4352941, 1,
-0.2200391, 1.476456, 1.222034, 0, 1, 0.4431373, 1,
-0.2187883, 0.272795, -1.022372, 0, 1, 0.4470588, 1,
-0.2168724, -0.4302357, -1.895953, 0, 1, 0.454902, 1,
-0.2098453, -0.02550833, 0.9820915, 0, 1, 0.4588235, 1,
-0.2087184, -0.2414861, -2.833149, 0, 1, 0.4666667, 1,
-0.2077536, 0.8301098, -0.5638883, 0, 1, 0.4705882, 1,
-0.2060342, -0.05903794, -0.7664459, 0, 1, 0.4784314, 1,
-0.2028872, 0.6285866, -1.192114, 0, 1, 0.4823529, 1,
-0.202209, -0.6135983, -1.347332, 0, 1, 0.4901961, 1,
-0.1986465, 2.492115, 1.41823, 0, 1, 0.4941176, 1,
-0.19369, 0.111055, -0.5680265, 0, 1, 0.5019608, 1,
-0.1914258, -0.5764717, -1.737369, 0, 1, 0.509804, 1,
-0.1904451, -1.143036, -3.639715, 0, 1, 0.5137255, 1,
-0.186885, -0.5525863, -3.172338, 0, 1, 0.5215687, 1,
-0.1867697, 1.557586, 1.373907, 0, 1, 0.5254902, 1,
-0.1736268, 0.7982538, -1.115492, 0, 1, 0.5333334, 1,
-0.1660689, 1.047865, -0.904025, 0, 1, 0.5372549, 1,
-0.165857, 0.2690545, -1.454403, 0, 1, 0.5450981, 1,
-0.1583994, -1.713544, -2.500282, 0, 1, 0.5490196, 1,
-0.1569423, 0.8190116, 1.491292, 0, 1, 0.5568628, 1,
-0.1489188, -0.2854654, -2.717905, 0, 1, 0.5607843, 1,
-0.1477704, -0.8606287, -2.632723, 0, 1, 0.5686275, 1,
-0.1467385, -0.5933993, -4.581449, 0, 1, 0.572549, 1,
-0.1428571, -1.63756, -3.7594, 0, 1, 0.5803922, 1,
-0.1421244, 1.526939, -1.074222, 0, 1, 0.5843138, 1,
-0.1376479, 0.1680405, -1.20878, 0, 1, 0.5921569, 1,
-0.1366827, 1.343278, 0.3925622, 0, 1, 0.5960785, 1,
-0.135722, 2.177312, 1.175912, 0, 1, 0.6039216, 1,
-0.1337524, -0.2753251, -2.099891, 0, 1, 0.6117647, 1,
-0.1321555, 3.479328, -0.8095334, 0, 1, 0.6156863, 1,
-0.1270202, 0.5089186, -0.8282207, 0, 1, 0.6235294, 1,
-0.1229362, -0.2066572, -1.046655, 0, 1, 0.627451, 1,
-0.1221139, 1.276265, -0.7372729, 0, 1, 0.6352941, 1,
-0.1194143, -1.103441, -4.441634, 0, 1, 0.6392157, 1,
-0.1190309, -0.3675861, -2.771234, 0, 1, 0.6470588, 1,
-0.1187232, -1.24596, -2.797294, 0, 1, 0.6509804, 1,
-0.1158861, -0.8689353, -3.015581, 0, 1, 0.6588235, 1,
-0.1149644, -2.28358, -3.604441, 0, 1, 0.6627451, 1,
-0.1135923, -0.3693141, -3.328508, 0, 1, 0.6705883, 1,
-0.1135073, 0.3191409, 0.8223175, 0, 1, 0.6745098, 1,
-0.1090779, -1.933856, -2.612674, 0, 1, 0.682353, 1,
-0.1059017, 0.6867475, -1.400178, 0, 1, 0.6862745, 1,
-0.1045412, -0.06008847, -1.932437, 0, 1, 0.6941177, 1,
-0.1026176, -0.2958015, -3.489575, 0, 1, 0.7019608, 1,
-0.09481356, -0.5022367, -1.05437, 0, 1, 0.7058824, 1,
-0.09250402, -0.3804172, -3.175195, 0, 1, 0.7137255, 1,
-0.08848526, -1.684893, -3.997993, 0, 1, 0.7176471, 1,
-0.08781825, -0.2376042, -3.262363, 0, 1, 0.7254902, 1,
-0.08327687, 1.484, 1.220557, 0, 1, 0.7294118, 1,
-0.08113791, 0.8567503, -1.354702, 0, 1, 0.7372549, 1,
-0.07731912, -0.1661849, -3.167211, 0, 1, 0.7411765, 1,
-0.07375431, 0.9747342, -0.5560042, 0, 1, 0.7490196, 1,
-0.0705518, 0.59769, 1.827986, 0, 1, 0.7529412, 1,
-0.0695335, -0.1654651, -3.07059, 0, 1, 0.7607843, 1,
-0.06937075, 0.1598282, 0.1456608, 0, 1, 0.7647059, 1,
-0.06476758, -0.6659056, -0.4977102, 0, 1, 0.772549, 1,
-0.05958805, 1.594007, 0.8294268, 0, 1, 0.7764706, 1,
-0.05642214, -1.142581, -2.252093, 0, 1, 0.7843137, 1,
-0.05529426, 1.172573, 0.814221, 0, 1, 0.7882353, 1,
-0.05385218, -0.2668272, -3.285237, 0, 1, 0.7960784, 1,
-0.0532997, -1.7898, -1.190053, 0, 1, 0.8039216, 1,
-0.0449519, 0.164719, 1.135031, 0, 1, 0.8078431, 1,
-0.04387847, -0.1827815, -3.013646, 0, 1, 0.8156863, 1,
-0.0433936, 0.8067464, -0.3743601, 0, 1, 0.8196079, 1,
-0.03954788, -0.4639198, -3.706316, 0, 1, 0.827451, 1,
-0.03928401, 0.8868405, 0.2180405, 0, 1, 0.8313726, 1,
-0.03608461, -0.2250196, -1.796717, 0, 1, 0.8392157, 1,
-0.03308009, -0.04562828, -2.370176, 0, 1, 0.8431373, 1,
-0.02888168, 1.81354, 0.1442946, 0, 1, 0.8509804, 1,
-0.02774873, -0.2265223, -1.99439, 0, 1, 0.854902, 1,
-0.0186279, -0.3538243, -1.417514, 0, 1, 0.8627451, 1,
-0.01714668, -0.2866578, -2.190235, 0, 1, 0.8666667, 1,
-0.01611633, 0.1302095, -0.8994713, 0, 1, 0.8745098, 1,
-0.01222567, 0.07957375, -0.6393322, 0, 1, 0.8784314, 1,
-0.01118472, 1.466767, 0.277279, 0, 1, 0.8862745, 1,
-0.01097673, -1.020532, -3.655537, 0, 1, 0.8901961, 1,
-0.01007768, 0.8213865, -1.032489, 0, 1, 0.8980392, 1,
-0.007325552, -0.03617095, -4.147913, 0, 1, 0.9058824, 1,
-0.00656138, -1.577818, -2.252326, 0, 1, 0.9098039, 1,
-0.005912101, -1.751353, -3.066541, 0, 1, 0.9176471, 1,
-0.005733141, -1.487846, -1.899801, 0, 1, 0.9215686, 1,
-0.00350712, -0.01309248, -3.025037, 0, 1, 0.9294118, 1,
-0.002532657, -0.6357996, -3.947319, 0, 1, 0.9333333, 1,
-0.001532541, 1.152467, 0.8439916, 0, 1, 0.9411765, 1,
4.33689e-05, -0.05653728, 3.674204, 0, 1, 0.945098, 1,
0.002800159, -1.762232, 3.508372, 0, 1, 0.9529412, 1,
0.007039432, 1.293371, 0.809065, 0, 1, 0.9568627, 1,
0.009466221, 0.3720623, 0.5777541, 0, 1, 0.9647059, 1,
0.01025872, -0.007441958, 1.147655, 0, 1, 0.9686275, 1,
0.01051727, -0.1937563, 3.643918, 0, 1, 0.9764706, 1,
0.01322037, -0.181613, 3.584911, 0, 1, 0.9803922, 1,
0.01554036, 0.3381937, -0.43524, 0, 1, 0.9882353, 1,
0.01626397, 0.6192413, 0.2273553, 0, 1, 0.9921569, 1,
0.01801055, 0.2283195, 0.3185987, 0, 1, 1, 1,
0.02051502, 1.5483, 0.971313, 0, 0.9921569, 1, 1,
0.02141801, 1.639413, 0.1830407, 0, 0.9882353, 1, 1,
0.02520021, 0.425346, 1.282855, 0, 0.9803922, 1, 1,
0.02625155, 0.1119285, 0.791634, 0, 0.9764706, 1, 1,
0.02714516, 2.470237, -0.1771746, 0, 0.9686275, 1, 1,
0.03082602, 2.128166, 2.747067, 0, 0.9647059, 1, 1,
0.03451319, 1.118146, -0.5932046, 0, 0.9568627, 1, 1,
0.03583609, -1.34491, 2.820757, 0, 0.9529412, 1, 1,
0.03866579, -2.057006, 4.356523, 0, 0.945098, 1, 1,
0.03879331, 0.71514, 0.9069382, 0, 0.9411765, 1, 1,
0.03892152, -0.1689689, 3.195912, 0, 0.9333333, 1, 1,
0.04516676, 0.464178, 0.2912918, 0, 0.9294118, 1, 1,
0.04636498, -1.274423, 3.303263, 0, 0.9215686, 1, 1,
0.04700173, -0.5502132, 2.832906, 0, 0.9176471, 1, 1,
0.04710065, 1.524157, -0.2880213, 0, 0.9098039, 1, 1,
0.05307671, 0.8492891, 0.7346222, 0, 0.9058824, 1, 1,
0.05733644, -0.1868875, 2.707725, 0, 0.8980392, 1, 1,
0.05897284, 0.3505904, 0.5349592, 0, 0.8901961, 1, 1,
0.05955021, 0.6598684, 1.058377, 0, 0.8862745, 1, 1,
0.06143123, 0.3003331, 1.375806, 0, 0.8784314, 1, 1,
0.06149067, -0.8799433, 2.746795, 0, 0.8745098, 1, 1,
0.06214337, -1.08314, 2.919088, 0, 0.8666667, 1, 1,
0.06247687, 0.7497407, 0.6493798, 0, 0.8627451, 1, 1,
0.06325383, 0.1776687, 0.6756175, 0, 0.854902, 1, 1,
0.0681757, 0.105924, 0.1593058, 0, 0.8509804, 1, 1,
0.06932586, -0.8770829, 3.24718, 0, 0.8431373, 1, 1,
0.07157146, -1.013144, 3.578619, 0, 0.8392157, 1, 1,
0.07476249, 1.261393, -0.5514284, 0, 0.8313726, 1, 1,
0.07572385, 1.164867, -0.2270844, 0, 0.827451, 1, 1,
0.07583324, -0.2616914, 2.592002, 0, 0.8196079, 1, 1,
0.07854789, 0.08113319, 0.5152844, 0, 0.8156863, 1, 1,
0.08099667, 0.3306521, -0.4638984, 0, 0.8078431, 1, 1,
0.08198218, -1.018047, 2.78905, 0, 0.8039216, 1, 1,
0.08375825, 0.7078943, -0.2969565, 0, 0.7960784, 1, 1,
0.09495822, -0.4301519, 4.16601, 0, 0.7882353, 1, 1,
0.09559159, -1.133821, 3.506655, 0, 0.7843137, 1, 1,
0.1003687, -0.3557359, 1.50316, 0, 0.7764706, 1, 1,
0.1008587, 0.3273593, 0.4080476, 0, 0.772549, 1, 1,
0.1027687, -1.259825, 5.145811, 0, 0.7647059, 1, 1,
0.1123638, 0.1863068, 0.1755699, 0, 0.7607843, 1, 1,
0.1136395, 0.4644426, 0.003618605, 0, 0.7529412, 1, 1,
0.1159005, -2.776112, 2.414848, 0, 0.7490196, 1, 1,
0.1257855, 0.4247087, 0.01936909, 0, 0.7411765, 1, 1,
0.126527, -0.4048608, 1.680042, 0, 0.7372549, 1, 1,
0.132414, 0.5315787, 2.438795, 0, 0.7294118, 1, 1,
0.1335505, 1.323412, 0.0371495, 0, 0.7254902, 1, 1,
0.1341054, 0.8370685, -0.3811365, 0, 0.7176471, 1, 1,
0.1388571, -3.179109, 2.745937, 0, 0.7137255, 1, 1,
0.1394325, -0.3745669, 1.839598, 0, 0.7058824, 1, 1,
0.1419864, 1.18916, 0.6756126, 0, 0.6980392, 1, 1,
0.1453827, -0.7174965, 0.826666, 0, 0.6941177, 1, 1,
0.1481524, 0.630614, -0.6835265, 0, 0.6862745, 1, 1,
0.1501216, 0.9324656, 0.6198767, 0, 0.682353, 1, 1,
0.1536105, -0.6623285, 3.153684, 0, 0.6745098, 1, 1,
0.1552485, -1.008541, 3.333357, 0, 0.6705883, 1, 1,
0.1557953, -0.05236542, 1.719515, 0, 0.6627451, 1, 1,
0.1589654, 0.9118666, -0.1805963, 0, 0.6588235, 1, 1,
0.1646166, -1.738693, 4.396083, 0, 0.6509804, 1, 1,
0.1670814, -1.62763, 2.844562, 0, 0.6470588, 1, 1,
0.1732097, -0.3976149, 4.015781, 0, 0.6392157, 1, 1,
0.1750716, -0.723737, 3.41124, 0, 0.6352941, 1, 1,
0.175505, -0.3917993, 3.787836, 0, 0.627451, 1, 1,
0.1774926, 0.07865055, -0.9591343, 0, 0.6235294, 1, 1,
0.1804017, -0.5016863, 2.952688, 0, 0.6156863, 1, 1,
0.1804241, 0.005631222, 1.977059, 0, 0.6117647, 1, 1,
0.1809921, -0.4791085, 4.532905, 0, 0.6039216, 1, 1,
0.1839096, -0.4623863, 2.18219, 0, 0.5960785, 1, 1,
0.1876535, -0.3043994, 2.571876, 0, 0.5921569, 1, 1,
0.1880503, 0.2512378, 0.104754, 0, 0.5843138, 1, 1,
0.1895577, 0.5212377, 2.602, 0, 0.5803922, 1, 1,
0.190787, 0.8600134, 0.4652138, 0, 0.572549, 1, 1,
0.2056659, -0.351411, 2.444953, 0, 0.5686275, 1, 1,
0.2154308, 1.055094, 0.3197325, 0, 0.5607843, 1, 1,
0.2157597, 0.1380044, -0.1751809, 0, 0.5568628, 1, 1,
0.2158794, 0.1541944, -0.1843356, 0, 0.5490196, 1, 1,
0.21691, -0.5236538, 3.52983, 0, 0.5450981, 1, 1,
0.2170979, -2.865391, 3.677091, 0, 0.5372549, 1, 1,
0.2226828, -0.3671501, 3.202558, 0, 0.5333334, 1, 1,
0.2235804, -0.7430198, 2.576082, 0, 0.5254902, 1, 1,
0.2267536, -0.8049141, 2.721496, 0, 0.5215687, 1, 1,
0.2268218, 0.8517736, -1.392311, 0, 0.5137255, 1, 1,
0.2292378, 0.5498743, 0.3976858, 0, 0.509804, 1, 1,
0.2302434, -0.9585606, 3.459081, 0, 0.5019608, 1, 1,
0.2317376, 0.8440577, -0.108842, 0, 0.4941176, 1, 1,
0.2328163, -0.06084, 1.700477, 0, 0.4901961, 1, 1,
0.2330205, -0.124434, 0.7455202, 0, 0.4823529, 1, 1,
0.2393852, 0.05378232, -0.5266776, 0, 0.4784314, 1, 1,
0.2419044, 0.9179314, 0.8165622, 0, 0.4705882, 1, 1,
0.2438731, 2.077516, 0.555135, 0, 0.4666667, 1, 1,
0.2454766, 0.4285038, 1.921221, 0, 0.4588235, 1, 1,
0.2493589, -0.8047032, 4.201587, 0, 0.454902, 1, 1,
0.2496103, 2.05702, 0.1926944, 0, 0.4470588, 1, 1,
0.250246, 0.7489009, 0.2242583, 0, 0.4431373, 1, 1,
0.250614, -0.09115498, 0.6430876, 0, 0.4352941, 1, 1,
0.2508572, 2.351629, -0.6746519, 0, 0.4313726, 1, 1,
0.2518814, 0.4001291, -0.3678716, 0, 0.4235294, 1, 1,
0.2569339, 0.2827754, 1.403158, 0, 0.4196078, 1, 1,
0.2597663, -0.3303263, 3.092559, 0, 0.4117647, 1, 1,
0.2599219, 0.5338895, 1.945283, 0, 0.4078431, 1, 1,
0.2613241, -0.2004593, 2.556996, 0, 0.4, 1, 1,
0.2617494, 1.160744, -0.5000139, 0, 0.3921569, 1, 1,
0.2635287, 0.492673, 0.1385204, 0, 0.3882353, 1, 1,
0.2651428, 0.5418531, -0.112087, 0, 0.3803922, 1, 1,
0.2655492, -1.107383, 4.270171, 0, 0.3764706, 1, 1,
0.2670297, 0.1605397, 1.425933, 0, 0.3686275, 1, 1,
0.2689609, 2.015191, -1.133073, 0, 0.3647059, 1, 1,
0.2703526, 1.00785, 0.4353021, 0, 0.3568628, 1, 1,
0.2706446, 0.2808322, 2.367802, 0, 0.3529412, 1, 1,
0.2707491, -0.02295256, 1.736408, 0, 0.345098, 1, 1,
0.2712013, 1.24008, 0.6078558, 0, 0.3411765, 1, 1,
0.2776345, 0.6256727, 1.70397, 0, 0.3333333, 1, 1,
0.2778465, 0.1284028, 1.340951, 0, 0.3294118, 1, 1,
0.2779385, -0.3805482, 3.072359, 0, 0.3215686, 1, 1,
0.2780263, -0.1110526, 3.925306, 0, 0.3176471, 1, 1,
0.2791879, -0.9375872, 0.1992087, 0, 0.3098039, 1, 1,
0.2817287, 1.979087, 0.01156684, 0, 0.3058824, 1, 1,
0.2818599, 0.2833386, 0.2337536, 0, 0.2980392, 1, 1,
0.2836454, 0.8033078, -0.04225602, 0, 0.2901961, 1, 1,
0.2841035, -2.316699, 3.922426, 0, 0.2862745, 1, 1,
0.2843133, -0.330689, 2.905585, 0, 0.2784314, 1, 1,
0.2881392, -0.7235326, 2.622128, 0, 0.2745098, 1, 1,
0.2935087, 0.5132177, 1.215927, 0, 0.2666667, 1, 1,
0.2987619, 0.1923064, 0.3267421, 0, 0.2627451, 1, 1,
0.2992601, -0.7442526, 0.7733583, 0, 0.254902, 1, 1,
0.2994743, 0.1625881, -0.4630792, 0, 0.2509804, 1, 1,
0.3032563, 0.5965284, -1.752115, 0, 0.2431373, 1, 1,
0.3046361, -0.4860913, 1.027604, 0, 0.2392157, 1, 1,
0.3049113, 2.248035, -0.974281, 0, 0.2313726, 1, 1,
0.3056106, 0.9671612, 0.5028198, 0, 0.227451, 1, 1,
0.3136305, 0.09161426, 2.683537, 0, 0.2196078, 1, 1,
0.3145256, -0.113575, 3.257585, 0, 0.2156863, 1, 1,
0.3154334, 0.2074086, 0.4128953, 0, 0.2078431, 1, 1,
0.321247, 0.3665634, 0.0483661, 0, 0.2039216, 1, 1,
0.3213485, 0.2805771, 3.115978, 0, 0.1960784, 1, 1,
0.3251804, 1.548292, 0.2679007, 0, 0.1882353, 1, 1,
0.3267354, -1.158253, 3.55084, 0, 0.1843137, 1, 1,
0.3289727, 0.2166492, 0.1765454, 0, 0.1764706, 1, 1,
0.3297465, -0.2715399, 1.255103, 0, 0.172549, 1, 1,
0.3299984, -1.408895, 2.819383, 0, 0.1647059, 1, 1,
0.3310831, 1.37591, 0.187861, 0, 0.1607843, 1, 1,
0.334828, -2.430889, 4.785964, 0, 0.1529412, 1, 1,
0.3428643, -0.242006, 2.769737, 0, 0.1490196, 1, 1,
0.3461336, -0.4960454, 1.611863, 0, 0.1411765, 1, 1,
0.3466177, 0.3183822, 1.787983, 0, 0.1372549, 1, 1,
0.346936, -0.4407591, 1.113396, 0, 0.1294118, 1, 1,
0.3491801, 0.1999536, 2.56053, 0, 0.1254902, 1, 1,
0.3517244, -1.643643, 2.511426, 0, 0.1176471, 1, 1,
0.3567748, 0.4872811, 0.7525409, 0, 0.1137255, 1, 1,
0.3596536, -0.609007, 0.01612324, 0, 0.1058824, 1, 1,
0.3609033, -0.6499251, 1.05683, 0, 0.09803922, 1, 1,
0.361556, 1.129971, -0.3188857, 0, 0.09411765, 1, 1,
0.3638722, 0.4968126, 0.4816288, 0, 0.08627451, 1, 1,
0.3656216, 2.491872, 0.8503937, 0, 0.08235294, 1, 1,
0.3667848, -0.6287362, 2.063749, 0, 0.07450981, 1, 1,
0.3673074, -0.6878463, 1.792467, 0, 0.07058824, 1, 1,
0.372476, -0.08621818, 1.307645, 0, 0.0627451, 1, 1,
0.3732307, 0.7875983, 1.250836, 0, 0.05882353, 1, 1,
0.374412, -1.011446, 3.778912, 0, 0.05098039, 1, 1,
0.3785259, 0.8197346, 0.4404438, 0, 0.04705882, 1, 1,
0.379373, 0.6561951, 0.7556616, 0, 0.03921569, 1, 1,
0.3804175, -0.5360562, 3.313974, 0, 0.03529412, 1, 1,
0.383034, -1.268674, 3.416024, 0, 0.02745098, 1, 1,
0.3870966, -1.225076, 2.081908, 0, 0.02352941, 1, 1,
0.3889525, -0.264693, 1.36689, 0, 0.01568628, 1, 1,
0.3924025, 0.2101874, 2.114613, 0, 0.01176471, 1, 1,
0.3958108, -0.6774793, 1.936954, 0, 0.003921569, 1, 1,
0.3985611, -1.06693, 2.363847, 0.003921569, 0, 1, 1,
0.3991342, 1.041264, 0.8688329, 0.007843138, 0, 1, 1,
0.4002449, 2.399355, -0.643397, 0.01568628, 0, 1, 1,
0.4080817, 0.7309318, 0.2587639, 0.01960784, 0, 1, 1,
0.4084588, -0.6190726, 2.576761, 0.02745098, 0, 1, 1,
0.4093106, -0.1030025, 0.5335813, 0.03137255, 0, 1, 1,
0.4127699, -0.1117605, 1.980724, 0.03921569, 0, 1, 1,
0.4149486, 0.6484008, 1.211931, 0.04313726, 0, 1, 1,
0.4151476, 0.4959541, -1.829199, 0.05098039, 0, 1, 1,
0.4182001, 0.1410033, 0.8109142, 0.05490196, 0, 1, 1,
0.4192924, 1.602275, 1.485821, 0.0627451, 0, 1, 1,
0.4240811, 0.6158902, -0.4020843, 0.06666667, 0, 1, 1,
0.4244176, 0.2481807, 2.563522, 0.07450981, 0, 1, 1,
0.4293165, 0.1041541, 1.056437, 0.07843138, 0, 1, 1,
0.4298823, 0.03655128, 0.9661983, 0.08627451, 0, 1, 1,
0.4320209, -0.3470472, 2.565212, 0.09019608, 0, 1, 1,
0.4356478, 1.054119, -1.062124, 0.09803922, 0, 1, 1,
0.4365124, 0.4116123, 0.5939533, 0.1058824, 0, 1, 1,
0.4497194, -1.988395, 3.000602, 0.1098039, 0, 1, 1,
0.455917, -1.049394, 2.869667, 0.1176471, 0, 1, 1,
0.4615241, 1.417703, -0.2242754, 0.1215686, 0, 1, 1,
0.466269, 0.2550993, 1.412788, 0.1294118, 0, 1, 1,
0.4680685, 1.302602, -0.4188464, 0.1333333, 0, 1, 1,
0.4710976, -0.4492632, 2.671311, 0.1411765, 0, 1, 1,
0.4712422, -1.283219, 2.829824, 0.145098, 0, 1, 1,
0.4730747, -1.602904, 3.426535, 0.1529412, 0, 1, 1,
0.4762405, 0.5436229, 1.214631, 0.1568628, 0, 1, 1,
0.4779076, -1.791297, 2.121799, 0.1647059, 0, 1, 1,
0.481073, 1.007653, -1.368655, 0.1686275, 0, 1, 1,
0.4814735, 1.989223, -0.1574634, 0.1764706, 0, 1, 1,
0.482714, -2.080225, 2.145989, 0.1803922, 0, 1, 1,
0.4867861, 0.05854015, 1.066658, 0.1882353, 0, 1, 1,
0.4933472, -0.4027559, 1.438539, 0.1921569, 0, 1, 1,
0.4984744, 0.1278195, 1.79881, 0.2, 0, 1, 1,
0.5050797, 0.5552027, -0.4919214, 0.2078431, 0, 1, 1,
0.5082909, 0.6888523, -0.08037993, 0.2117647, 0, 1, 1,
0.5091559, 0.03447995, 1.861561, 0.2196078, 0, 1, 1,
0.5161424, 0.7852872, 0.5840454, 0.2235294, 0, 1, 1,
0.5168197, 0.5796292, 0.04016208, 0.2313726, 0, 1, 1,
0.5171844, -1.368517, 3.966657, 0.2352941, 0, 1, 1,
0.5177103, -1.431071, 3.05794, 0.2431373, 0, 1, 1,
0.5190101, 0.09341518, -0.3490867, 0.2470588, 0, 1, 1,
0.5198745, -0.2724859, 1.732824, 0.254902, 0, 1, 1,
0.5229427, -0.6799666, 2.548812, 0.2588235, 0, 1, 1,
0.5236976, -0.5750083, 3.091964, 0.2666667, 0, 1, 1,
0.532028, 0.6783239, -1.001426, 0.2705882, 0, 1, 1,
0.5327426, -1.68229, 3.146625, 0.2784314, 0, 1, 1,
0.5337387, -1.032034, 2.430709, 0.282353, 0, 1, 1,
0.5365926, -0.1182456, 1.01965, 0.2901961, 0, 1, 1,
0.5422413, -0.4410315, 3.736796, 0.2941177, 0, 1, 1,
0.5442505, -0.3624836, 1.250398, 0.3019608, 0, 1, 1,
0.5449924, 1.658016, 1.135549, 0.3098039, 0, 1, 1,
0.5462048, 0.216296, 2.449045, 0.3137255, 0, 1, 1,
0.5480241, -1.403457, 3.338625, 0.3215686, 0, 1, 1,
0.548889, -0.03144116, 1.935342, 0.3254902, 0, 1, 1,
0.5510213, -1.618516, 1.965207, 0.3333333, 0, 1, 1,
0.5626116, -0.8107507, 2.932261, 0.3372549, 0, 1, 1,
0.5659597, -1.424427, 2.978309, 0.345098, 0, 1, 1,
0.5772167, 0.1164526, 0.535861, 0.3490196, 0, 1, 1,
0.5778539, -0.7891524, 2.589512, 0.3568628, 0, 1, 1,
0.5788043, 0.5934513, -0.05284604, 0.3607843, 0, 1, 1,
0.581622, 1.073866, 0.6436242, 0.3686275, 0, 1, 1,
0.5910858, -1.870125, 2.528359, 0.372549, 0, 1, 1,
0.5911837, 1.291708, 1.621752, 0.3803922, 0, 1, 1,
0.5936961, 2.048048, -0.4931551, 0.3843137, 0, 1, 1,
0.5988123, 0.8237897, -0.70901, 0.3921569, 0, 1, 1,
0.6004367, -0.8887599, 2.195286, 0.3960784, 0, 1, 1,
0.6012857, 1.982526, 0.5534866, 0.4039216, 0, 1, 1,
0.6024134, -0.295116, 0.9530983, 0.4117647, 0, 1, 1,
0.6027362, -0.4743981, 2.668928, 0.4156863, 0, 1, 1,
0.6047108, 0.5527521, 1.65471, 0.4235294, 0, 1, 1,
0.6166461, -1.912924, 1.977787, 0.427451, 0, 1, 1,
0.6174309, -1.760354, 2.502086, 0.4352941, 0, 1, 1,
0.6194131, 0.8583032, -0.0998086, 0.4392157, 0, 1, 1,
0.62069, 0.2980393, 2.622247, 0.4470588, 0, 1, 1,
0.6209776, -1.257222, 3.135221, 0.4509804, 0, 1, 1,
0.6281485, 0.3927265, 1.606317, 0.4588235, 0, 1, 1,
0.6288486, -0.3208909, 2.497884, 0.4627451, 0, 1, 1,
0.6353288, -0.2394139, 2.739224, 0.4705882, 0, 1, 1,
0.6397564, 0.7599723, 0.3344552, 0.4745098, 0, 1, 1,
0.6415586, -0.2206761, 0.900506, 0.4823529, 0, 1, 1,
0.6428748, -0.237519, 2.43331, 0.4862745, 0, 1, 1,
0.6475604, 0.1959972, 1.324809, 0.4941176, 0, 1, 1,
0.6502636, 1.777386, 1.403779, 0.5019608, 0, 1, 1,
0.6550083, 1.253725, 1.471659, 0.5058824, 0, 1, 1,
0.6619149, -1.246641, 3.384243, 0.5137255, 0, 1, 1,
0.6626144, -0.777428, 2.430764, 0.5176471, 0, 1, 1,
0.6653196, 0.6971296, 1.351458, 0.5254902, 0, 1, 1,
0.6664451, -1.412956, 3.41166, 0.5294118, 0, 1, 1,
0.6688434, 1.445897, -0.9375724, 0.5372549, 0, 1, 1,
0.6700541, -0.2640139, 2.085516, 0.5411765, 0, 1, 1,
0.6724528, -0.8769755, 2.315468, 0.5490196, 0, 1, 1,
0.676999, -0.3851905, 0.7165285, 0.5529412, 0, 1, 1,
0.6772893, 0.1615424, 2.239195, 0.5607843, 0, 1, 1,
0.6814631, -1.404057, 2.992166, 0.5647059, 0, 1, 1,
0.6823698, 0.2789237, 2.806496, 0.572549, 0, 1, 1,
0.6828941, 0.2549154, 0.9671287, 0.5764706, 0, 1, 1,
0.6831036, 0.9533366, 0.4112659, 0.5843138, 0, 1, 1,
0.6881722, -2.040273, 2.258881, 0.5882353, 0, 1, 1,
0.690613, -0.2726302, 1.161954, 0.5960785, 0, 1, 1,
0.6923548, -1.358212, 2.74935, 0.6039216, 0, 1, 1,
0.6929966, -0.1678439, -0.0453504, 0.6078432, 0, 1, 1,
0.6939235, -1.311316, 3.877216, 0.6156863, 0, 1, 1,
0.701196, -1.039956, 2.997957, 0.6196079, 0, 1, 1,
0.7048377, -2.196077, 4.287355, 0.627451, 0, 1, 1,
0.711663, 0.3865615, 0.8359132, 0.6313726, 0, 1, 1,
0.7130102, -1.73036, 2.823189, 0.6392157, 0, 1, 1,
0.7134018, 0.5806335, -0.08529847, 0.6431373, 0, 1, 1,
0.7161062, 0.5101634, -0.6464132, 0.6509804, 0, 1, 1,
0.7180754, -0.2324129, 1.805916, 0.654902, 0, 1, 1,
0.7233846, -3.09095, 3.521839, 0.6627451, 0, 1, 1,
0.7245378, -0.5589756, 0.738941, 0.6666667, 0, 1, 1,
0.7298487, -1.982672, 3.696417, 0.6745098, 0, 1, 1,
0.7334759, -1.266496, 1.728966, 0.6784314, 0, 1, 1,
0.7342373, -1.044493, 3.627945, 0.6862745, 0, 1, 1,
0.7359387, 0.1332462, 1.900451, 0.6901961, 0, 1, 1,
0.7394333, -1.749309, 4.035519, 0.6980392, 0, 1, 1,
0.7434331, -0.4452629, 2.763585, 0.7058824, 0, 1, 1,
0.744402, -0.4695648, 2.636918, 0.7098039, 0, 1, 1,
0.7480338, 1.221996, 0.78914, 0.7176471, 0, 1, 1,
0.7482313, -1.504189, 4.35233, 0.7215686, 0, 1, 1,
0.7502744, -0.2552767, 0.7683948, 0.7294118, 0, 1, 1,
0.7515197, 0.9090451, -1.09308, 0.7333333, 0, 1, 1,
0.7545709, -1.538268, 2.904758, 0.7411765, 0, 1, 1,
0.7549652, 0.1811243, 2.967496, 0.7450981, 0, 1, 1,
0.7598246, -1.95452, 3.711902, 0.7529412, 0, 1, 1,
0.7601944, 0.9010282, 0.8630778, 0.7568628, 0, 1, 1,
0.764773, -0.3192221, 2.483148, 0.7647059, 0, 1, 1,
0.7651656, 0.8204052, 1.792937, 0.7686275, 0, 1, 1,
0.7670006, 0.1763537, 0.8093727, 0.7764706, 0, 1, 1,
0.7683935, 1.268361, -0.3066312, 0.7803922, 0, 1, 1,
0.7706243, -0.05188739, 3.648056, 0.7882353, 0, 1, 1,
0.7710316, -1.012528, 3.143848, 0.7921569, 0, 1, 1,
0.7722146, 1.924452, 0.4914915, 0.8, 0, 1, 1,
0.7746701, 1.2225, 2.132097, 0.8078431, 0, 1, 1,
0.7774457, -0.838185, 2.381875, 0.8117647, 0, 1, 1,
0.7774702, -2.055043, 3.648825, 0.8196079, 0, 1, 1,
0.7800871, -1.489228, 2.529349, 0.8235294, 0, 1, 1,
0.7817339, -0.5765184, 3.668235, 0.8313726, 0, 1, 1,
0.7822033, 0.7220095, 1.000237, 0.8352941, 0, 1, 1,
0.7844155, 0.6030027, 1.228617, 0.8431373, 0, 1, 1,
0.7845354, 1.627541, -0.3767858, 0.8470588, 0, 1, 1,
0.7848109, 1.470743, -0.04925238, 0.854902, 0, 1, 1,
0.7853456, 0.3139712, 1.736501, 0.8588235, 0, 1, 1,
0.7889735, -0.8589552, 3.030403, 0.8666667, 0, 1, 1,
0.7949535, -0.3101457, 1.372877, 0.8705882, 0, 1, 1,
0.7960626, -0.7183765, 1.8573, 0.8784314, 0, 1, 1,
0.796167, -0.7235368, 1.790746, 0.8823529, 0, 1, 1,
0.7965799, -0.8411857, 2.050045, 0.8901961, 0, 1, 1,
0.7975935, 0.185108, 1.74858, 0.8941177, 0, 1, 1,
0.8044322, 1.831669, 0.4817362, 0.9019608, 0, 1, 1,
0.8050137, 0.2467598, 0.2020005, 0.9098039, 0, 1, 1,
0.8145757, 0.2511285, -0.1898576, 0.9137255, 0, 1, 1,
0.815102, 0.6791953, 1.044738, 0.9215686, 0, 1, 1,
0.8214865, 1.869283, -0.8721922, 0.9254902, 0, 1, 1,
0.8309303, 0.5622026, 0.7765614, 0.9333333, 0, 1, 1,
0.8370516, -1.082294, 2.035625, 0.9372549, 0, 1, 1,
0.8379266, -0.9440357, 3.106822, 0.945098, 0, 1, 1,
0.8420043, 1.053364, 2.40846, 0.9490196, 0, 1, 1,
0.8443497, 1.087164, 1.798923, 0.9568627, 0, 1, 1,
0.8452917, -0.001703196, 3.652681, 0.9607843, 0, 1, 1,
0.8505064, 0.1441628, 2.458907, 0.9686275, 0, 1, 1,
0.8517647, -0.91976, 3.1561, 0.972549, 0, 1, 1,
0.8537109, -1.269959, 2.057129, 0.9803922, 0, 1, 1,
0.8540831, 0.9549543, 1.310702, 0.9843137, 0, 1, 1,
0.8555323, -0.5744324, 1.43476, 0.9921569, 0, 1, 1,
0.8636245, -0.424158, 0.03293527, 0.9960784, 0, 1, 1,
0.8667828, 1.500964, -0.3648376, 1, 0, 0.9960784, 1,
0.8755302, -0.07582081, 2.780527, 1, 0, 0.9882353, 1,
0.8836976, 1.796573, 2.187142, 1, 0, 0.9843137, 1,
0.8899325, 0.663042, 0.9094768, 1, 0, 0.9764706, 1,
0.8931072, 1.945837, 1.150039, 1, 0, 0.972549, 1,
0.8979934, 0.6045825, 1.395725, 1, 0, 0.9647059, 1,
0.9029627, 1.310107, 0.3842181, 1, 0, 0.9607843, 1,
0.907342, 0.4552955, 0.1930014, 1, 0, 0.9529412, 1,
0.9124231, 2.173581, 0.02683471, 1, 0, 0.9490196, 1,
0.9155572, 1.131775, 0.6304771, 1, 0, 0.9411765, 1,
0.9174672, 0.4580679, 0.02250004, 1, 0, 0.9372549, 1,
0.9182383, -0.3771591, 2.464793, 1, 0, 0.9294118, 1,
0.9197937, 0.7878183, -1.03128, 1, 0, 0.9254902, 1,
0.9237785, -1.606299, 2.20747, 1, 0, 0.9176471, 1,
0.9274569, 0.2735266, 1.500796, 1, 0, 0.9137255, 1,
0.9297333, 1.283611, 1.072251, 1, 0, 0.9058824, 1,
0.9346071, 0.8452812, 1.165205, 1, 0, 0.9019608, 1,
0.9419097, 0.3168178, 0.6547469, 1, 0, 0.8941177, 1,
0.9438777, -0.178966, 1.86045, 1, 0, 0.8862745, 1,
0.9439026, -0.4184891, 2.396137, 1, 0, 0.8823529, 1,
0.9504744, 1.490345, 1.680443, 1, 0, 0.8745098, 1,
0.9535841, 0.7655103, -0.6513599, 1, 0, 0.8705882, 1,
0.9566233, -1.016613, 0.461725, 1, 0, 0.8627451, 1,
0.9639276, -0.07161129, 1.975577, 1, 0, 0.8588235, 1,
0.9674141, -0.4752545, 1.548275, 1, 0, 0.8509804, 1,
0.9687682, 0.5373588, 1.339986, 1, 0, 0.8470588, 1,
0.9702956, -0.9242166, 3.464139, 1, 0, 0.8392157, 1,
0.9730082, -0.2137935, 1.706268, 1, 0, 0.8352941, 1,
0.9750291, -1.426178, 2.864615, 1, 0, 0.827451, 1,
0.9763929, -0.1170089, 2.741771, 1, 0, 0.8235294, 1,
0.9805879, 0.5361744, 0.9245163, 1, 0, 0.8156863, 1,
0.9845639, 0.1634215, 1.238878, 1, 0, 0.8117647, 1,
0.9882706, -0.6838936, 1.11324, 1, 0, 0.8039216, 1,
0.997596, -1.102266, 2.009257, 1, 0, 0.7960784, 1,
1.000415, -0.3138897, 1.560195, 1, 0, 0.7921569, 1,
1.002585, 0.9740958, 0.9228048, 1, 0, 0.7843137, 1,
1.006725, 1.467666, 1.174941, 1, 0, 0.7803922, 1,
1.01184, -0.4889862, 3.147342, 1, 0, 0.772549, 1,
1.018225, 1.029392, 1.67362, 1, 0, 0.7686275, 1,
1.020171, -0.4931161, 1.659316, 1, 0, 0.7607843, 1,
1.031629, -0.2201985, 2.431288, 1, 0, 0.7568628, 1,
1.031961, 0.5164393, 1.118811, 1, 0, 0.7490196, 1,
1.032611, 0.941274, 1.559623, 1, 0, 0.7450981, 1,
1.044851, 0.7698974, 1.293956, 1, 0, 0.7372549, 1,
1.047226, 0.6485193, 1.675002, 1, 0, 0.7333333, 1,
1.049397, 1.721137, -0.5785118, 1, 0, 0.7254902, 1,
1.052628, -2.410454, 2.833843, 1, 0, 0.7215686, 1,
1.053459, 0.3380637, 0.8818815, 1, 0, 0.7137255, 1,
1.053796, 0.9251412, 0.8154306, 1, 0, 0.7098039, 1,
1.059795, 1.813928, -0.8959, 1, 0, 0.7019608, 1,
1.066311, 0.453307, 1.36635, 1, 0, 0.6941177, 1,
1.067588, 0.0771829, 1.877635, 1, 0, 0.6901961, 1,
1.078876, -0.2335243, -0.2810122, 1, 0, 0.682353, 1,
1.084333, 0.4552685, 0.7261696, 1, 0, 0.6784314, 1,
1.093453, -1.875085, 4.481587, 1, 0, 0.6705883, 1,
1.100059, -0.4407659, 1.180953, 1, 0, 0.6666667, 1,
1.102675, -0.1474624, 0.9246441, 1, 0, 0.6588235, 1,
1.106811, -0.8329318, 2.32578, 1, 0, 0.654902, 1,
1.107997, 0.8825359, 1.294096, 1, 0, 0.6470588, 1,
1.112224, -0.8997459, 2.004131, 1, 0, 0.6431373, 1,
1.122894, 2.103479, -0.4986206, 1, 0, 0.6352941, 1,
1.131035, 0.1596504, 0.6866105, 1, 0, 0.6313726, 1,
1.131812, -0.4128654, 0.5165049, 1, 0, 0.6235294, 1,
1.141979, 1.167166, 0.5388456, 1, 0, 0.6196079, 1,
1.144063, -0.02202938, 1.866382, 1, 0, 0.6117647, 1,
1.144528, -0.01191449, 2.610432, 1, 0, 0.6078432, 1,
1.149626, 0.1817923, 1.681029, 1, 0, 0.6, 1,
1.153546, 1.685124, 1.293223, 1, 0, 0.5921569, 1,
1.161586, 1.402505, 1.45144, 1, 0, 0.5882353, 1,
1.16844, 0.5102238, 1.388353, 1, 0, 0.5803922, 1,
1.173133, 1.424842, -0.3943558, 1, 0, 0.5764706, 1,
1.175462, -0.1609463, 1.383072, 1, 0, 0.5686275, 1,
1.186949, 0.4528492, 0.3913867, 1, 0, 0.5647059, 1,
1.190228, -1.576542, 3.775436, 1, 0, 0.5568628, 1,
1.198836, 0.4411484, 0.3620069, 1, 0, 0.5529412, 1,
1.199569, 0.5532669, 2.096702, 1, 0, 0.5450981, 1,
1.210198, 1.126349, 1.026308, 1, 0, 0.5411765, 1,
1.212906, -1.288202, 2.524731, 1, 0, 0.5333334, 1,
1.229158, -0.8954835, 4.015136, 1, 0, 0.5294118, 1,
1.234624, 0.5108067, 3.474519, 1, 0, 0.5215687, 1,
1.23732, 0.1530478, 1.842184, 1, 0, 0.5176471, 1,
1.238463, 1.290501, 0.6305645, 1, 0, 0.509804, 1,
1.239169, -0.8343828, 2.868467, 1, 0, 0.5058824, 1,
1.240538, 0.1301004, 2.731357, 1, 0, 0.4980392, 1,
1.240775, 0.5221469, -0.5283612, 1, 0, 0.4901961, 1,
1.251557, 0.7090623, 1.509147, 1, 0, 0.4862745, 1,
1.263229, 0.372272, 1.45674, 1, 0, 0.4784314, 1,
1.26696, 0.5133456, 1.180022, 1, 0, 0.4745098, 1,
1.298413, 0.1654008, 0.7021224, 1, 0, 0.4666667, 1,
1.317381, 0.7651837, 0.470394, 1, 0, 0.4627451, 1,
1.340588, -0.06910104, 1.007983, 1, 0, 0.454902, 1,
1.342869, -0.4172173, 2.028254, 1, 0, 0.4509804, 1,
1.349931, -0.2151128, 2.010674, 1, 0, 0.4431373, 1,
1.384347, -1.129436, 2.727869, 1, 0, 0.4392157, 1,
1.385526, 0.5549807, 0.333897, 1, 0, 0.4313726, 1,
1.394339, -1.361692, 2.366151, 1, 0, 0.427451, 1,
1.407737, -0.6947782, 1.248352, 1, 0, 0.4196078, 1,
1.409695, 1.912746, 0.6629741, 1, 0, 0.4156863, 1,
1.411493, 0.5379198, 1.665235, 1, 0, 0.4078431, 1,
1.429094, -0.5834939, 2.644345, 1, 0, 0.4039216, 1,
1.432571, 1.196413, 0.09860281, 1, 0, 0.3960784, 1,
1.437654, 0.853071, 1.334334, 1, 0, 0.3882353, 1,
1.44409, 1.069496, 1.090309, 1, 0, 0.3843137, 1,
1.450427, -1.488148, 2.334943, 1, 0, 0.3764706, 1,
1.462174, -0.850134, 4.088633, 1, 0, 0.372549, 1,
1.477538, -0.09818701, 0.6798457, 1, 0, 0.3647059, 1,
1.479509, -0.9193739, 0.6192345, 1, 0, 0.3607843, 1,
1.493628, 0.5191095, 0.7840202, 1, 0, 0.3529412, 1,
1.49946, -0.3436184, 2.752758, 1, 0, 0.3490196, 1,
1.501584, 1.572409, -1.035448, 1, 0, 0.3411765, 1,
1.511276, 0.02201175, 2.461315, 1, 0, 0.3372549, 1,
1.539366, -1.230939, 2.301814, 1, 0, 0.3294118, 1,
1.546982, 0.7351798, 1.142262, 1, 0, 0.3254902, 1,
1.561832, -0.4200097, 1.670406, 1, 0, 0.3176471, 1,
1.565077, -0.7110091, 1.846489, 1, 0, 0.3137255, 1,
1.574973, -1.132355, 4.150271, 1, 0, 0.3058824, 1,
1.585539, 0.1003152, 2.856676, 1, 0, 0.2980392, 1,
1.610328, -1.194156, 1.923501, 1, 0, 0.2941177, 1,
1.619623, -1.531683, 2.775758, 1, 0, 0.2862745, 1,
1.637403, 0.6426801, 1.362931, 1, 0, 0.282353, 1,
1.640378, 0.4149794, 1.606436, 1, 0, 0.2745098, 1,
1.640987, 1.629424, 1.012573, 1, 0, 0.2705882, 1,
1.643116, 0.4079299, -0.3084478, 1, 0, 0.2627451, 1,
1.648898, -2.010388, 2.688365, 1, 0, 0.2588235, 1,
1.674747, 1.085479, 0.5076987, 1, 0, 0.2509804, 1,
1.679541, -1.59743, 2.037115, 1, 0, 0.2470588, 1,
1.699174, -0.479968, 1.389279, 1, 0, 0.2392157, 1,
1.706658, 0.04165095, 0.9449249, 1, 0, 0.2352941, 1,
1.729692, 0.1569771, 0.8545008, 1, 0, 0.227451, 1,
1.730695, 0.4492908, 2.079029, 1, 0, 0.2235294, 1,
1.751081, 0.6280786, 1.336905, 1, 0, 0.2156863, 1,
1.763436, -0.37585, 2.53425, 1, 0, 0.2117647, 1,
1.803123, 0.8291401, 0.1299745, 1, 0, 0.2039216, 1,
1.814458, -0.8025894, 0.4801073, 1, 0, 0.1960784, 1,
1.842292, 0.4744537, 1.301592, 1, 0, 0.1921569, 1,
1.847625, 0.5096341, 1.100569, 1, 0, 0.1843137, 1,
1.849255, -0.7208043, 2.78603, 1, 0, 0.1803922, 1,
1.854334, -2.185124, 2.776166, 1, 0, 0.172549, 1,
1.86155, -0.5390487, 1.213651, 1, 0, 0.1686275, 1,
1.864257, -0.09985348, 3.253271, 1, 0, 0.1607843, 1,
1.875938, -1.069633, 3.237668, 1, 0, 0.1568628, 1,
1.890573, 1.884889, 1.403899, 1, 0, 0.1490196, 1,
1.896383, 1.455682, 0.1270073, 1, 0, 0.145098, 1,
1.901024, 1.159982, 3.132403, 1, 0, 0.1372549, 1,
1.907597, -0.7013966, 4.146356, 1, 0, 0.1333333, 1,
1.930417, 0.6283523, 1.428093, 1, 0, 0.1254902, 1,
1.967677, -1.456124, 1.737148, 1, 0, 0.1215686, 1,
1.967771, 0.7082756, 2.14011, 1, 0, 0.1137255, 1,
1.98792, 0.01354062, 1.331724, 1, 0, 0.1098039, 1,
2.025292, 1.170617, 2.062345, 1, 0, 0.1019608, 1,
2.048459, 0.5436707, 1.362005, 1, 0, 0.09411765, 1,
2.070646, -0.1380016, 2.636947, 1, 0, 0.09019608, 1,
2.08932, -1.679423, 2.607049, 1, 0, 0.08235294, 1,
2.110918, 1.03685, -0.1344937, 1, 0, 0.07843138, 1,
2.135626, -1.111539, 2.154632, 1, 0, 0.07058824, 1,
2.180048, -0.2990997, 1.002186, 1, 0, 0.06666667, 1,
2.180247, 0.145339, 1.13066, 1, 0, 0.05882353, 1,
2.182612, 0.6145305, 0.1766476, 1, 0, 0.05490196, 1,
2.190479, 0.8004407, 0.4044021, 1, 0, 0.04705882, 1,
2.223819, 0.5765462, -0.2514037, 1, 0, 0.04313726, 1,
2.251105, -0.9371595, 3.701733, 1, 0, 0.03529412, 1,
2.271189, -0.9563333, 3.731782, 1, 0, 0.03137255, 1,
2.309632, -0.3273602, 1.01798, 1, 0, 0.02352941, 1,
2.534296, -0.3791023, 1.792366, 1, 0, 0.01960784, 1,
2.587442, 0.3104299, -0.0909316, 1, 0, 0.01176471, 1,
2.930093, -0.1737639, 1.724079, 1, 0, 0.007843138, 1
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
-0.286746, -4.542417, -6.242174, 0, -0.5, 0.5, 0.5,
-0.286746, -4.542417, -6.242174, 1, -0.5, 0.5, 0.5,
-0.286746, -4.542417, -6.242174, 1, 1.5, 0.5, 0.5,
-0.286746, -4.542417, -6.242174, 0, 1.5, 0.5, 0.5
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
-4.594094, 0.3020946, -6.242174, 0, -0.5, 0.5, 0.5,
-4.594094, 0.3020946, -6.242174, 1, -0.5, 0.5, 0.5,
-4.594094, 0.3020946, -6.242174, 1, 1.5, 0.5, 0.5,
-4.594094, 0.3020946, -6.242174, 0, 1.5, 0.5, 0.5
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
-4.594094, -4.542417, 0.2770703, 0, -0.5, 0.5, 0.5,
-4.594094, -4.542417, 0.2770703, 1, -0.5, 0.5, 0.5,
-4.594094, -4.542417, 0.2770703, 1, 1.5, 0.5, 0.5,
-4.594094, -4.542417, 0.2770703, 0, 1.5, 0.5, 0.5
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
-3, -3.424453, -4.737733,
2, -3.424453, -4.737733,
-3, -3.424453, -4.737733,
-3, -3.61078, -4.988473,
-2, -3.424453, -4.737733,
-2, -3.61078, -4.988473,
-1, -3.424453, -4.737733,
-1, -3.61078, -4.988473,
0, -3.424453, -4.737733,
0, -3.61078, -4.988473,
1, -3.424453, -4.737733,
1, -3.61078, -4.988473,
2, -3.424453, -4.737733,
2, -3.61078, -4.988473
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
-3, -3.983435, -5.489953, 0, -0.5, 0.5, 0.5,
-3, -3.983435, -5.489953, 1, -0.5, 0.5, 0.5,
-3, -3.983435, -5.489953, 1, 1.5, 0.5, 0.5,
-3, -3.983435, -5.489953, 0, 1.5, 0.5, 0.5,
-2, -3.983435, -5.489953, 0, -0.5, 0.5, 0.5,
-2, -3.983435, -5.489953, 1, -0.5, 0.5, 0.5,
-2, -3.983435, -5.489953, 1, 1.5, 0.5, 0.5,
-2, -3.983435, -5.489953, 0, 1.5, 0.5, 0.5,
-1, -3.983435, -5.489953, 0, -0.5, 0.5, 0.5,
-1, -3.983435, -5.489953, 1, -0.5, 0.5, 0.5,
-1, -3.983435, -5.489953, 1, 1.5, 0.5, 0.5,
-1, -3.983435, -5.489953, 0, 1.5, 0.5, 0.5,
0, -3.983435, -5.489953, 0, -0.5, 0.5, 0.5,
0, -3.983435, -5.489953, 1, -0.5, 0.5, 0.5,
0, -3.983435, -5.489953, 1, 1.5, 0.5, 0.5,
0, -3.983435, -5.489953, 0, 1.5, 0.5, 0.5,
1, -3.983435, -5.489953, 0, -0.5, 0.5, 0.5,
1, -3.983435, -5.489953, 1, -0.5, 0.5, 0.5,
1, -3.983435, -5.489953, 1, 1.5, 0.5, 0.5,
1, -3.983435, -5.489953, 0, 1.5, 0.5, 0.5,
2, -3.983435, -5.489953, 0, -0.5, 0.5, 0.5,
2, -3.983435, -5.489953, 1, -0.5, 0.5, 0.5,
2, -3.983435, -5.489953, 1, 1.5, 0.5, 0.5,
2, -3.983435, -5.489953, 0, 1.5, 0.5, 0.5
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
-3.600091, -2, -4.737733,
-3.600091, 2, -4.737733,
-3.600091, -2, -4.737733,
-3.765758, -2, -4.988473,
-3.600091, 0, -4.737733,
-3.765758, 0, -4.988473,
-3.600091, 2, -4.737733,
-3.765758, 2, -4.988473
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
-4.097092, -2, -5.489953, 0, -0.5, 0.5, 0.5,
-4.097092, -2, -5.489953, 1, -0.5, 0.5, 0.5,
-4.097092, -2, -5.489953, 1, 1.5, 0.5, 0.5,
-4.097092, -2, -5.489953, 0, 1.5, 0.5, 0.5,
-4.097092, 0, -5.489953, 0, -0.5, 0.5, 0.5,
-4.097092, 0, -5.489953, 1, -0.5, 0.5, 0.5,
-4.097092, 0, -5.489953, 1, 1.5, 0.5, 0.5,
-4.097092, 0, -5.489953, 0, 1.5, 0.5, 0.5,
-4.097092, 2, -5.489953, 0, -0.5, 0.5, 0.5,
-4.097092, 2, -5.489953, 1, -0.5, 0.5, 0.5,
-4.097092, 2, -5.489953, 1, 1.5, 0.5, 0.5,
-4.097092, 2, -5.489953, 0, 1.5, 0.5, 0.5
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
-3.600091, -3.424453, -4,
-3.600091, -3.424453, 4,
-3.600091, -3.424453, -4,
-3.765758, -3.61078, -4,
-3.600091, -3.424453, -2,
-3.765758, -3.61078, -2,
-3.600091, -3.424453, 0,
-3.765758, -3.61078, 0,
-3.600091, -3.424453, 2,
-3.765758, -3.61078, 2,
-3.600091, -3.424453, 4,
-3.765758, -3.61078, 4
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
-4.097092, -3.983435, -4, 0, -0.5, 0.5, 0.5,
-4.097092, -3.983435, -4, 1, -0.5, 0.5, 0.5,
-4.097092, -3.983435, -4, 1, 1.5, 0.5, 0.5,
-4.097092, -3.983435, -4, 0, 1.5, 0.5, 0.5,
-4.097092, -3.983435, -2, 0, -0.5, 0.5, 0.5,
-4.097092, -3.983435, -2, 1, -0.5, 0.5, 0.5,
-4.097092, -3.983435, -2, 1, 1.5, 0.5, 0.5,
-4.097092, -3.983435, -2, 0, 1.5, 0.5, 0.5,
-4.097092, -3.983435, 0, 0, -0.5, 0.5, 0.5,
-4.097092, -3.983435, 0, 1, -0.5, 0.5, 0.5,
-4.097092, -3.983435, 0, 1, 1.5, 0.5, 0.5,
-4.097092, -3.983435, 0, 0, 1.5, 0.5, 0.5,
-4.097092, -3.983435, 2, 0, -0.5, 0.5, 0.5,
-4.097092, -3.983435, 2, 1, -0.5, 0.5, 0.5,
-4.097092, -3.983435, 2, 1, 1.5, 0.5, 0.5,
-4.097092, -3.983435, 2, 0, 1.5, 0.5, 0.5,
-4.097092, -3.983435, 4, 0, -0.5, 0.5, 0.5,
-4.097092, -3.983435, 4, 1, -0.5, 0.5, 0.5,
-4.097092, -3.983435, 4, 1, 1.5, 0.5, 0.5,
-4.097092, -3.983435, 4, 0, 1.5, 0.5, 0.5
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
-3.600091, -3.424453, -4.737733,
-3.600091, 4.028642, -4.737733,
-3.600091, -3.424453, 5.291873,
-3.600091, 4.028642, 5.291873,
-3.600091, -3.424453, -4.737733,
-3.600091, -3.424453, 5.291873,
-3.600091, 4.028642, -4.737733,
-3.600091, 4.028642, 5.291873,
-3.600091, -3.424453, -4.737733,
3.026598, -3.424453, -4.737733,
-3.600091, -3.424453, 5.291873,
3.026598, -3.424453, 5.291873,
-3.600091, 4.028642, -4.737733,
3.026598, 4.028642, -4.737733,
-3.600091, 4.028642, 5.291873,
3.026598, 4.028642, 5.291873,
3.026598, -3.424453, -4.737733,
3.026598, 4.028642, -4.737733,
3.026598, -3.424453, 5.291873,
3.026598, 4.028642, 5.291873,
3.026598, -3.424453, -4.737733,
3.026598, -3.424453, 5.291873,
3.026598, 4.028642, -4.737733,
3.026598, 4.028642, 5.291873
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
var radius = 7.552657;
var distance = 33.60262;
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
mvMatrix.translate( 0.286746, -0.3020946, -0.2770703 );
mvMatrix.scale( 1.232302, 1.095663, 0.8141975 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.60262);
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
thiamethoxam<-read.table("thiamethoxam.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-thiamethoxam$V2
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
```

```r
y<-thiamethoxam$V3
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
```

```r
z<-thiamethoxam$V4
```

```
## Error in eval(expr, envir, enclos): object 'thiamethoxam' not found
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
-3.503585, 1.564908, -2.820295, 0, 0, 1, 1, 1,
-2.929174, -0.01228456, -1.681075, 1, 0, 0, 1, 1,
-2.685141, -0.7898161, -2.970195, 1, 0, 0, 1, 1,
-2.585764, 0.03658326, -1.534798, 1, 0, 0, 1, 1,
-2.56527, -0.1582513, -1.688317, 1, 0, 0, 1, 1,
-2.487086, -1.385159, -1.492149, 1, 0, 0, 1, 1,
-2.485385, 1.721408, -2.336818, 0, 0, 0, 1, 1,
-2.474912, 1.029041, -0.02400404, 0, 0, 0, 1, 1,
-2.317984, 0.8062325, 0.4347577, 0, 0, 0, 1, 1,
-2.300594, 0.4408407, -0.7295286, 0, 0, 0, 1, 1,
-2.264616, -1.543229, -1.431522, 0, 0, 0, 1, 1,
-2.247955, 0.6728307, -2.202167, 0, 0, 0, 1, 1,
-2.185478, -1.214632, -1.618664, 0, 0, 0, 1, 1,
-2.176373, 0.02269066, -1.128957, 1, 1, 1, 1, 1,
-2.156583, 0.6929563, -1.677321, 1, 1, 1, 1, 1,
-2.134995, 0.8418871, -1.83747, 1, 1, 1, 1, 1,
-2.127039, 0.3897236, -0.8720275, 1, 1, 1, 1, 1,
-2.095084, 0.3359928, -1.880243, 1, 1, 1, 1, 1,
-2.074809, 0.1847539, -1.890619, 1, 1, 1, 1, 1,
-2.057518, -1.467814, -2.126132, 1, 1, 1, 1, 1,
-2.050495, 0.7761554, -2.427075, 1, 1, 1, 1, 1,
-2.019002, -1.291184, -2.793463, 1, 1, 1, 1, 1,
-2.018836, 0.2244479, 0.9080469, 1, 1, 1, 1, 1,
-1.979361, -1.613386, -3.552232, 1, 1, 1, 1, 1,
-1.964858, 0.3968072, -2.195724, 1, 1, 1, 1, 1,
-1.962208, 0.5403736, -0.4959738, 1, 1, 1, 1, 1,
-1.948672, 1.063163, -1.536022, 1, 1, 1, 1, 1,
-1.931576, -0.1008235, -2.253894, 1, 1, 1, 1, 1,
-1.928457, 0.6958541, -1.689634, 0, 0, 1, 1, 1,
-1.916875, -0.01583864, -2.19309, 1, 0, 0, 1, 1,
-1.907858, 0.4128262, -1.63528, 1, 0, 0, 1, 1,
-1.904271, -0.870998, -2.668408, 1, 0, 0, 1, 1,
-1.902743, -0.3205246, -1.466897, 1, 0, 0, 1, 1,
-1.879517, 0.3404364, -2.703767, 1, 0, 0, 1, 1,
-1.859238, -0.5101478, -1.759274, 0, 0, 0, 1, 1,
-1.845572, 0.5319998, -2.001272, 0, 0, 0, 1, 1,
-1.838694, -0.8169098, -1.761339, 0, 0, 0, 1, 1,
-1.837151, -0.9865112, -0.878223, 0, 0, 0, 1, 1,
-1.819483, 0.3787337, -1.826073, 0, 0, 0, 1, 1,
-1.802633, 0.2749736, 0.3556737, 0, 0, 0, 1, 1,
-1.801177, -0.8488087, -2.495298, 0, 0, 0, 1, 1,
-1.791387, -0.1718975, 0.1321171, 1, 1, 1, 1, 1,
-1.730731, 1.272694, -2.207697, 1, 1, 1, 1, 1,
-1.689128, -0.2397911, -1.848013, 1, 1, 1, 1, 1,
-1.682865, -0.8021951, -0.1309835, 1, 1, 1, 1, 1,
-1.671514, -0.5386561, -0.2095455, 1, 1, 1, 1, 1,
-1.662128, 0.4582565, -2.118658, 1, 1, 1, 1, 1,
-1.642729, 0.1668721, -0.9636849, 1, 1, 1, 1, 1,
-1.641823, 0.9961101, -1.058867, 1, 1, 1, 1, 1,
-1.638576, 1.169062, -0.1399209, 1, 1, 1, 1, 1,
-1.615726, -0.7705303, -3.166606, 1, 1, 1, 1, 1,
-1.613487, -2.142511, -3.050981, 1, 1, 1, 1, 1,
-1.602651, 0.4648693, -1.621628, 1, 1, 1, 1, 1,
-1.600567, -1.16377, -1.651984, 1, 1, 1, 1, 1,
-1.586733, 0.3720838, -1.534646, 1, 1, 1, 1, 1,
-1.586055, 0.05425107, -4.170326, 1, 1, 1, 1, 1,
-1.584767, -1.510897, -2.131383, 0, 0, 1, 1, 1,
-1.583897, 0.4589441, -2.059944, 1, 0, 0, 1, 1,
-1.565592, 0.1743092, -1.281906, 1, 0, 0, 1, 1,
-1.551962, 1.795869, 0.9107889, 1, 0, 0, 1, 1,
-1.542113, 0.1794362, -1.92973, 1, 0, 0, 1, 1,
-1.5354, -0.8003179, -2.867813, 1, 0, 0, 1, 1,
-1.531046, 1.407413, 0.8694557, 0, 0, 0, 1, 1,
-1.520274, 0.06488003, -2.732499, 0, 0, 0, 1, 1,
-1.519501, 1.53076, -0.8612915, 0, 0, 0, 1, 1,
-1.498213, -0.1127935, 0.3720737, 0, 0, 0, 1, 1,
-1.495467, -0.6309933, -2.312372, 0, 0, 0, 1, 1,
-1.49387, -0.2675294, -1.911529, 0, 0, 0, 1, 1,
-1.493625, 1.936794, -0.2199538, 0, 0, 0, 1, 1,
-1.465845, 0.8144332, -0.9508047, 1, 1, 1, 1, 1,
-1.465666, 1.607728, -2.003064, 1, 1, 1, 1, 1,
-1.463494, -1.21167, -1.928881, 1, 1, 1, 1, 1,
-1.455075, -1.274081, -1.975514, 1, 1, 1, 1, 1,
-1.454777, 0.008849942, -3.04967, 1, 1, 1, 1, 1,
-1.454018, -1.126188, -2.570691, 1, 1, 1, 1, 1,
-1.447336, -0.0542253, 0.826923, 1, 1, 1, 1, 1,
-1.418006, 1.791818, -1.551596, 1, 1, 1, 1, 1,
-1.410511, -0.6826496, -2.116894, 1, 1, 1, 1, 1,
-1.398566, -1.792961, -1.839455, 1, 1, 1, 1, 1,
-1.385266, -1.094047, -3.32893, 1, 1, 1, 1, 1,
-1.379853, 0.4661318, -0.1238208, 1, 1, 1, 1, 1,
-1.36617, -0.7022666, -0.9098351, 1, 1, 1, 1, 1,
-1.364328, -0.3506545, -2.697283, 1, 1, 1, 1, 1,
-1.33979, 0.4982411, -1.092402, 1, 1, 1, 1, 1,
-1.326437, -2.540742, -1.8002, 0, 0, 1, 1, 1,
-1.323117, 1.08917, -1.307547, 1, 0, 0, 1, 1,
-1.318165, 2.545926, 0.3766564, 1, 0, 0, 1, 1,
-1.316952, 0.6728953, -2.721078, 1, 0, 0, 1, 1,
-1.315328, 0.6099517, -2.176093, 1, 0, 0, 1, 1,
-1.311991, 1.231476, 0.00440516, 1, 0, 0, 1, 1,
-1.307525, -0.5777586, -2.78383, 0, 0, 0, 1, 1,
-1.296827, 0.2549766, -0.6527272, 0, 0, 0, 1, 1,
-1.295353, -1.722415, -1.771526, 0, 0, 0, 1, 1,
-1.292781, 0.4944572, -0.3840404, 0, 0, 0, 1, 1,
-1.28375, -0.45548, -1.718551, 0, 0, 0, 1, 1,
-1.248074, 1.103543, -1.129704, 0, 0, 0, 1, 1,
-1.247235, -0.4975317, -2.868104, 0, 0, 0, 1, 1,
-1.243703, -1.244328, -2.617174, 1, 1, 1, 1, 1,
-1.243606, 1.574326, -0.9658843, 1, 1, 1, 1, 1,
-1.226555, -0.9837066, -1.846969, 1, 1, 1, 1, 1,
-1.226285, -0.7638617, -2.061176, 1, 1, 1, 1, 1,
-1.225484, 0.3189129, -0.6521707, 1, 1, 1, 1, 1,
-1.212383, -0.4390364, -1.239281, 1, 1, 1, 1, 1,
-1.209199, 1.480351, -1.737619, 1, 1, 1, 1, 1,
-1.197316, 1.479816, -1.028189, 1, 1, 1, 1, 1,
-1.193288, -0.4420524, -2.214864, 1, 1, 1, 1, 1,
-1.186525, -0.1849067, -0.3169283, 1, 1, 1, 1, 1,
-1.180276, -0.4645395, -2.040664, 1, 1, 1, 1, 1,
-1.174884, 0.02858604, -1.201941, 1, 1, 1, 1, 1,
-1.173437, 0.1364241, -1.739451, 1, 1, 1, 1, 1,
-1.169802, 0.5271934, -1.838706, 1, 1, 1, 1, 1,
-1.158734, -0.4003303, -1.925858, 1, 1, 1, 1, 1,
-1.158653, -0.8019483, -1.711611, 0, 0, 1, 1, 1,
-1.157495, -0.1749207, -2.259518, 1, 0, 0, 1, 1,
-1.156853, -0.9124669, -1.697278, 1, 0, 0, 1, 1,
-1.153688, -1.176006, -4.165315, 1, 0, 0, 1, 1,
-1.150669, 0.1795524, -1.294474, 1, 0, 0, 1, 1,
-1.148277, 0.4360613, -0.8314106, 1, 0, 0, 1, 1,
-1.144661, 1.916936, -1.06327, 0, 0, 0, 1, 1,
-1.137362, 1.704272, -1.428954, 0, 0, 0, 1, 1,
-1.120912, 1.366763, -0.9450901, 0, 0, 0, 1, 1,
-1.108007, 0.7264086, 1.635226, 0, 0, 0, 1, 1,
-1.107092, 1.20835, -0.5653114, 0, 0, 0, 1, 1,
-1.10011, 1.053166, -1.89906, 0, 0, 0, 1, 1,
-1.091211, -0.9904294, -3.835084, 0, 0, 0, 1, 1,
-1.089996, -1.561986, -3.634095, 1, 1, 1, 1, 1,
-1.089437, -0.6299422, -3.343639, 1, 1, 1, 1, 1,
-1.083204, -1.449359, -4.184211, 1, 1, 1, 1, 1,
-1.082512, -1.834776, -2.154337, 1, 1, 1, 1, 1,
-1.082474, 1.249948, -0.9063676, 1, 1, 1, 1, 1,
-1.080733, 0.5661251, -0.5229309, 1, 1, 1, 1, 1,
-1.077439, -1.13464, -1.447081, 1, 1, 1, 1, 1,
-1.076443, 0.5910802, -2.493742, 1, 1, 1, 1, 1,
-1.070686, -0.1781556, -3.346433, 1, 1, 1, 1, 1,
-1.06302, 1.068928, -0.9959173, 1, 1, 1, 1, 1,
-1.057127, 0.1170733, -0.3226019, 1, 1, 1, 1, 1,
-1.056026, 0.7497712, -0.7364026, 1, 1, 1, 1, 1,
-1.05338, -0.5482807, -2.574551, 1, 1, 1, 1, 1,
-1.051756, -0.6702324, -2.527543, 1, 1, 1, 1, 1,
-1.050503, -2.023729, -2.064574, 1, 1, 1, 1, 1,
-1.041108, 2.133661, -1.983763, 0, 0, 1, 1, 1,
-1.040757, 1.333894, 0.02668587, 1, 0, 0, 1, 1,
-1.039048, 0.4735891, -1.816649, 1, 0, 0, 1, 1,
-1.034992, 3.920102, 0.5814303, 1, 0, 0, 1, 1,
-1.033638, 1.179134, -2.15154, 1, 0, 0, 1, 1,
-1.028053, 0.4238288, 1.01133, 1, 0, 0, 1, 1,
-1.017377, -0.6552975, -0.7720072, 0, 0, 0, 1, 1,
-1.014239, 1.521977, -0.7200303, 0, 0, 0, 1, 1,
-1.013896, -0.03859828, -2.600181, 0, 0, 0, 1, 1,
-1.013451, 1.213391, -0.5184068, 0, 0, 0, 1, 1,
-1.011685, 0.7350386, 0.9175767, 0, 0, 0, 1, 1,
-0.9964377, 0.5826963, -1.124022, 0, 0, 0, 1, 1,
-0.9917214, -0.08246337, -1.685902, 0, 0, 0, 1, 1,
-0.9843643, 0.02194164, -1.113669, 1, 1, 1, 1, 1,
-0.9839962, 0.6021984, 0.4108019, 1, 1, 1, 1, 1,
-0.979427, 0.821493, -0.2447959, 1, 1, 1, 1, 1,
-0.9791902, 0.2437854, -1.475538, 1, 1, 1, 1, 1,
-0.971634, -0.1707617, -0.301024, 1, 1, 1, 1, 1,
-0.964537, 0.5574771, -2.036645, 1, 1, 1, 1, 1,
-0.9642957, -1.375367, -1.097356, 1, 1, 1, 1, 1,
-0.9628665, -0.3514915, -3.48724, 1, 1, 1, 1, 1,
-0.9606865, 1.881428, -0.414495, 1, 1, 1, 1, 1,
-0.9592786, 0.2938115, -1.163466, 1, 1, 1, 1, 1,
-0.958378, -0.4133659, -0.2503512, 1, 1, 1, 1, 1,
-0.9564947, 0.2501678, -0.4424559, 1, 1, 1, 1, 1,
-0.9537078, -3.315912, -2.870903, 1, 1, 1, 1, 1,
-0.9519385, -0.8152252, -4.246809, 1, 1, 1, 1, 1,
-0.950406, 1.802243, -0.05608386, 1, 1, 1, 1, 1,
-0.9501204, -1.378403, -3.203147, 0, 0, 1, 1, 1,
-0.9496368, 0.269084, -2.241174, 1, 0, 0, 1, 1,
-0.9435293, -0.1706226, -2.811673, 1, 0, 0, 1, 1,
-0.9401976, 0.04763135, -1.779399, 1, 0, 0, 1, 1,
-0.9121848, -0.8954449, -3.962761, 1, 0, 0, 1, 1,
-0.9116379, -0.1586197, -0.8832092, 1, 0, 0, 1, 1,
-0.9112496, -1.393061, -3.332225, 0, 0, 0, 1, 1,
-0.9097615, 0.9703397, 0.3272829, 0, 0, 0, 1, 1,
-0.9078202, -0.2603852, -2.111389, 0, 0, 0, 1, 1,
-0.9057502, 1.450724, 0.08569459, 0, 0, 0, 1, 1,
-0.9045973, -1.073249, -1.449957, 0, 0, 0, 1, 1,
-0.8981138, 0.2907129, -2.833128, 0, 0, 0, 1, 1,
-0.8926737, -0.8666366, -2.843998, 0, 0, 0, 1, 1,
-0.8918808, -0.2584886, -1.02614, 1, 1, 1, 1, 1,
-0.8865554, 0.7036777, -1.315083, 1, 1, 1, 1, 1,
-0.8803673, -0.9937606, -2.422542, 1, 1, 1, 1, 1,
-0.8792756, -1.173056, -2.174665, 1, 1, 1, 1, 1,
-0.8763876, -0.3492464, -2.134978, 1, 1, 1, 1, 1,
-0.8746451, 0.8753126, -3.222532, 1, 1, 1, 1, 1,
-0.8718642, -0.6969593, -1.18089, 1, 1, 1, 1, 1,
-0.864695, 2.48086, -1.170308, 1, 1, 1, 1, 1,
-0.862585, -0.5676212, -2.251505, 1, 1, 1, 1, 1,
-0.8610578, -0.6821043, -1.924562, 1, 1, 1, 1, 1,
-0.8591479, -0.139022, -1.883459, 1, 1, 1, 1, 1,
-0.8515154, 1.000297, 0.728265, 1, 1, 1, 1, 1,
-0.8440675, 0.650862, -2.690049, 1, 1, 1, 1, 1,
-0.843408, -0.4968667, -1.213498, 1, 1, 1, 1, 1,
-0.8407549, 1.024698, -1.011256, 1, 1, 1, 1, 1,
-0.8365048, 0.1717948, -0.7919188, 0, 0, 1, 1, 1,
-0.8335009, 0.2639003, -0.9122596, 1, 0, 0, 1, 1,
-0.830974, -0.182738, -1.273545, 1, 0, 0, 1, 1,
-0.8289244, -0.5129901, -2.356525, 1, 0, 0, 1, 1,
-0.8266482, 1.450283, -1.186898, 1, 0, 0, 1, 1,
-0.8203138, -1.080846, -4.591671, 1, 0, 0, 1, 1,
-0.8199041, 0.8103598, -0.9490584, 0, 0, 0, 1, 1,
-0.8168835, 1.776715, 0.342601, 0, 0, 0, 1, 1,
-0.8144484, -0.2866591, -1.065196, 0, 0, 0, 1, 1,
-0.8130042, -0.1154433, 0.2351991, 0, 0, 0, 1, 1,
-0.8119256, -0.4914598, -2.246979, 0, 0, 0, 1, 1,
-0.8093215, 1.255976, -0.5202855, 0, 0, 0, 1, 1,
-0.8082252, -1.051345, -1.441486, 0, 0, 0, 1, 1,
-0.7965213, 0.1410979, -1.329944, 1, 1, 1, 1, 1,
-0.7926098, -1.157092, -3.948452, 1, 1, 1, 1, 1,
-0.7922496, -0.3473932, -1.958105, 1, 1, 1, 1, 1,
-0.7916172, -1.898716, -4.006392, 1, 1, 1, 1, 1,
-0.7895261, 0.1847436, -2.018649, 1, 1, 1, 1, 1,
-0.7861245, -0.03610536, -1.907693, 1, 1, 1, 1, 1,
-0.7787794, -0.1972249, -2.978991, 1, 1, 1, 1, 1,
-0.776421, 0.3241303, -1.725999, 1, 1, 1, 1, 1,
-0.7753646, 1.375093, -1.002873, 1, 1, 1, 1, 1,
-0.7753409, -0.6418778, -0.9464411, 1, 1, 1, 1, 1,
-0.7728512, 0.1908752, -1.885332, 1, 1, 1, 1, 1,
-0.7699187, -0.3607808, -2.770694, 1, 1, 1, 1, 1,
-0.7687043, 1.529609, -3.900995, 1, 1, 1, 1, 1,
-0.7675173, -1.22508, -3.938233, 1, 1, 1, 1, 1,
-0.7600461, -2.196223, -3.149046, 1, 1, 1, 1, 1,
-0.7597267, -0.4104443, -1.922093, 0, 0, 1, 1, 1,
-0.7580637, 0.1635288, -0.616897, 1, 0, 0, 1, 1,
-0.7556222, 0.9570509, 0.5255515, 1, 0, 0, 1, 1,
-0.7489095, -1.091538, -2.316282, 1, 0, 0, 1, 1,
-0.7479501, 0.06425646, -2.058504, 1, 0, 0, 1, 1,
-0.7408355, 0.1077735, -1.395398, 1, 0, 0, 1, 1,
-0.7386211, 0.5389234, -1.601439, 0, 0, 0, 1, 1,
-0.7378674, 1.260262, 1.304314, 0, 0, 0, 1, 1,
-0.7357838, 1.080538, -1.842116, 0, 0, 0, 1, 1,
-0.7299604, -1.404093, -1.612134, 0, 0, 0, 1, 1,
-0.726637, 0.7159423, 0.128877, 0, 0, 0, 1, 1,
-0.7176118, -0.1860747, -2.959201, 0, 0, 0, 1, 1,
-0.7129669, -0.2183659, -2.959191, 0, 0, 0, 1, 1,
-0.7127986, -0.2987175, 0.2445644, 1, 1, 1, 1, 1,
-0.7117707, -0.8746758, -3.761239, 1, 1, 1, 1, 1,
-0.7113075, 0.6789693, -1.893262, 1, 1, 1, 1, 1,
-0.7083691, -0.2906537, -2.754822, 1, 1, 1, 1, 1,
-0.70214, -0.5359778, -2.915647, 1, 1, 1, 1, 1,
-0.6945922, 1.122216, -0.4492653, 1, 1, 1, 1, 1,
-0.6923189, -0.754391, -3.898977, 1, 1, 1, 1, 1,
-0.6890345, -0.5200632, -2.981281, 1, 1, 1, 1, 1,
-0.6883693, -1.092723, -2.277067, 1, 1, 1, 1, 1,
-0.6855167, 0.1689393, -2.381305, 1, 1, 1, 1, 1,
-0.6833432, -0.8149852, -2.763724, 1, 1, 1, 1, 1,
-0.6794051, -0.479569, -0.1696081, 1, 1, 1, 1, 1,
-0.6778748, 1.212096, 0.3034627, 1, 1, 1, 1, 1,
-0.6729015, -1.811957, -3.36828, 1, 1, 1, 1, 1,
-0.6726677, 0.1756492, -2.41916, 1, 1, 1, 1, 1,
-0.6674148, 1.668602, -1.662835, 0, 0, 1, 1, 1,
-0.6651949, 0.5016053, -1.837029, 1, 0, 0, 1, 1,
-0.663529, 0.2927934, -0.05118224, 1, 0, 0, 1, 1,
-0.6621015, 1.221908, -0.4899698, 1, 0, 0, 1, 1,
-0.6603817, -1.218192, -3.096751, 1, 0, 0, 1, 1,
-0.6581771, -1.486168, -4.259899, 1, 0, 0, 1, 1,
-0.6577597, -1.483803, -1.651613, 0, 0, 0, 1, 1,
-0.6517562, -2.277134, -2.508586, 0, 0, 0, 1, 1,
-0.6430837, 0.9155962, -1.475121, 0, 0, 0, 1, 1,
-0.6381204, 1.207748, -0.02176879, 0, 0, 0, 1, 1,
-0.6370539, -0.9029281, -3.851397, 0, 0, 0, 1, 1,
-0.6344211, -1.776929, -1.256791, 0, 0, 0, 1, 1,
-0.6295652, -0.08694346, -0.1732128, 0, 0, 0, 1, 1,
-0.6287201, 1.945078, 0.7909675, 1, 1, 1, 1, 1,
-0.6247668, 1.283956, -0.06488794, 1, 1, 1, 1, 1,
-0.6204041, 0.5098057, -3.045785, 1, 1, 1, 1, 1,
-0.6202759, 0.4888528, -1.330353, 1, 1, 1, 1, 1,
-0.6173311, -0.01457727, -1.698122, 1, 1, 1, 1, 1,
-0.6169671, -0.5559919, -0.5364031, 1, 1, 1, 1, 1,
-0.6162254, -0.07671361, -1.026549, 1, 1, 1, 1, 1,
-0.6012455, -0.4558866, -3.397106, 1, 1, 1, 1, 1,
-0.6004169, 0.3979398, -0.5904381, 1, 1, 1, 1, 1,
-0.5966344, 0.3035665, -2.400879, 1, 1, 1, 1, 1,
-0.5881031, -1.266448, -4.099807, 1, 1, 1, 1, 1,
-0.5836609, 0.180623, -2.515887, 1, 1, 1, 1, 1,
-0.5819917, 1.058183, 1.153865, 1, 1, 1, 1, 1,
-0.5790326, 0.6403884, 0.05876761, 1, 1, 1, 1, 1,
-0.5787159, 1.297314, 0.5539049, 1, 1, 1, 1, 1,
-0.5785205, 0.9303026, -0.9464247, 0, 0, 1, 1, 1,
-0.5740728, -0.2686442, -1.164501, 1, 0, 0, 1, 1,
-0.5718938, 1.031751, 1.834051, 1, 0, 0, 1, 1,
-0.5707232, 0.9853864, 0.363984, 1, 0, 0, 1, 1,
-0.5683318, -0.6565781, -1.910656, 1, 0, 0, 1, 1,
-0.5682372, 1.013123, -1.758949, 1, 0, 0, 1, 1,
-0.5676465, -0.5763266, -1.321076, 0, 0, 0, 1, 1,
-0.5646237, -0.0004612698, -1.521448, 0, 0, 0, 1, 1,
-0.5638278, 0.878358, -0.1826466, 0, 0, 0, 1, 1,
-0.5590871, -0.4851081, -2.206668, 0, 0, 0, 1, 1,
-0.5569544, 0.6570199, -0.7800308, 0, 0, 0, 1, 1,
-0.5516014, -1.906113, -2.427521, 0, 0, 0, 1, 1,
-0.5458726, -1.139349, -1.95838, 0, 0, 0, 1, 1,
-0.5435963, 0.2004701, -1.503459, 1, 1, 1, 1, 1,
-0.534531, -0.204212, -0.3332036, 1, 1, 1, 1, 1,
-0.5259879, 0.7908831, -0.3689884, 1, 1, 1, 1, 1,
-0.5256993, -1.304377, -3.450312, 1, 1, 1, 1, 1,
-0.5233498, 0.06332813, 0.05117794, 1, 1, 1, 1, 1,
-0.5204577, -0.6417643, -1.994601, 1, 1, 1, 1, 1,
-0.5203317, -0.6351436, -3.618429, 1, 1, 1, 1, 1,
-0.5139248, 0.5011652, 0.4915917, 1, 1, 1, 1, 1,
-0.5070606, 0.7601211, -0.3689691, 1, 1, 1, 1, 1,
-0.5045217, -1.548056, -4.048975, 1, 1, 1, 1, 1,
-0.5012746, -0.7790167, -1.757975, 1, 1, 1, 1, 1,
-0.499584, 0.1198051, -1.569327, 1, 1, 1, 1, 1,
-0.4958697, 0.1002019, -2.915622, 1, 1, 1, 1, 1,
-0.4940101, 0.7232401, -1.176193, 1, 1, 1, 1, 1,
-0.4905705, 0.3022262, -0.6720232, 1, 1, 1, 1, 1,
-0.4888279, 1.747592, -1.040079, 0, 0, 1, 1, 1,
-0.4888096, -0.211271, -0.2868074, 1, 0, 0, 1, 1,
-0.4887986, 1.546116, -0.5768204, 1, 0, 0, 1, 1,
-0.4834129, -0.9973785, -2.923749, 1, 0, 0, 1, 1,
-0.4828697, -0.923436, -2.402406, 1, 0, 0, 1, 1,
-0.4784787, 2.192913, 0.4049585, 1, 0, 0, 1, 1,
-0.4779708, -1.342218, -2.235229, 0, 0, 0, 1, 1,
-0.4742765, 0.6167831, -0.2075868, 0, 0, 0, 1, 1,
-0.4739461, 0.5930762, 0.1290746, 0, 0, 0, 1, 1,
-0.4709766, 1.342611, -0.4174917, 0, 0, 0, 1, 1,
-0.4691726, 0.3286062, 0.626959, 0, 0, 0, 1, 1,
-0.4669385, 1.171781, 0.2194214, 0, 0, 0, 1, 1,
-0.4655624, 1.016001, 0.5605097, 0, 0, 0, 1, 1,
-0.4636856, 0.7579138, -0.04408893, 1, 1, 1, 1, 1,
-0.4608893, -0.3946843, -2.639094, 1, 1, 1, 1, 1,
-0.4589222, -0.2078878, -1.58715, 1, 1, 1, 1, 1,
-0.4490699, 0.6229333, -1.611824, 1, 1, 1, 1, 1,
-0.4454912, 1.266066, 0.8376937, 1, 1, 1, 1, 1,
-0.4432656, -0.3551559, -3.796979, 1, 1, 1, 1, 1,
-0.4391895, -0.7524797, -1.416083, 1, 1, 1, 1, 1,
-0.4350628, 0.2470604, -0.5652283, 1, 1, 1, 1, 1,
-0.4268839, -0.005911544, -1.221083, 1, 1, 1, 1, 1,
-0.419081, -0.8337159, -2.796965, 1, 1, 1, 1, 1,
-0.4188411, -0.6662718, -0.94379, 1, 1, 1, 1, 1,
-0.415536, -0.8435243, -1.966549, 1, 1, 1, 1, 1,
-0.4151516, 0.1668189, -2.994102, 1, 1, 1, 1, 1,
-0.4101263, -0.7896603, -1.865752, 1, 1, 1, 1, 1,
-0.4055089, 1.493502, -0.9948736, 1, 1, 1, 1, 1,
-0.4023815, -0.9235399, -4.011463, 0, 0, 1, 1, 1,
-0.3996552, 0.4894801, -0.2112753, 1, 0, 0, 1, 1,
-0.3979304, 1.254964, -0.02803989, 1, 0, 0, 1, 1,
-0.3974499, -0.4430018, -1.151408, 1, 0, 0, 1, 1,
-0.389309, -0.05897334, -1.619073, 1, 0, 0, 1, 1,
-0.3867474, 0.06447296, -1.297878, 1, 0, 0, 1, 1,
-0.3859961, 0.1863461, -2.346438, 0, 0, 0, 1, 1,
-0.385568, -1.254851, -4.102332, 0, 0, 0, 1, 1,
-0.3848485, 0.3012257, -0.9198823, 0, 0, 0, 1, 1,
-0.384701, -0.3281115, -3.457146, 0, 0, 0, 1, 1,
-0.3793783, -1.211707, -2.99103, 0, 0, 0, 1, 1,
-0.3788754, 0.3113548, -0.9730703, 0, 0, 0, 1, 1,
-0.3766911, 0.01738171, -2.432898, 0, 0, 0, 1, 1,
-0.3693112, 0.417278, -1.186295, 1, 1, 1, 1, 1,
-0.3692972, 0.7431512, -1.537161, 1, 1, 1, 1, 1,
-0.368506, -1.955479, -4.532646, 1, 1, 1, 1, 1,
-0.3667157, 0.171617, -0.07602614, 1, 1, 1, 1, 1,
-0.3646667, 0.5160438, -0.4148769, 1, 1, 1, 1, 1,
-0.3642351, 0.3857433, -1.009879, 1, 1, 1, 1, 1,
-0.3613873, -1.226204, -2.945413, 1, 1, 1, 1, 1,
-0.3609363, 0.9980746, -0.1724372, 1, 1, 1, 1, 1,
-0.3584951, 0.4989425, -1.813497, 1, 1, 1, 1, 1,
-0.3559955, 0.1881876, -1.101847, 1, 1, 1, 1, 1,
-0.3514599, 0.8359455, 0.2809638, 1, 1, 1, 1, 1,
-0.3468247, 1.179443, -1.022648, 1, 1, 1, 1, 1,
-0.3404448, 1.680183, -2.042062, 1, 1, 1, 1, 1,
-0.3403784, -2.757994, -2.337457, 1, 1, 1, 1, 1,
-0.3389852, -0.2350859, -2.806805, 1, 1, 1, 1, 1,
-0.3376724, 0.1011522, -1.21592, 0, 0, 1, 1, 1,
-0.3340558, 1.860647, 0.1476279, 1, 0, 0, 1, 1,
-0.3337359, 1.091472, 1.087009, 1, 0, 0, 1, 1,
-0.3318198, 0.9818777, 0.9995646, 1, 0, 0, 1, 1,
-0.3295512, 1.236244, 1.763166, 1, 0, 0, 1, 1,
-0.3245116, -0.8917827, -3.727624, 1, 0, 0, 1, 1,
-0.3200762, 1.507155, 0.3960793, 0, 0, 0, 1, 1,
-0.3137902, -0.5686502, -3.714856, 0, 0, 0, 1, 1,
-0.3130705, 1.726557, -0.9498593, 0, 0, 0, 1, 1,
-0.3128188, 0.3042023, -0.7338135, 0, 0, 0, 1, 1,
-0.311887, -0.3095861, -2.843706, 0, 0, 0, 1, 1,
-0.3117749, -0.7107515, -3.521461, 0, 0, 0, 1, 1,
-0.3052, -2.111761, -3.68575, 0, 0, 0, 1, 1,
-0.3036093, 1.366024, 0.7917919, 1, 1, 1, 1, 1,
-0.2993962, 0.5588982, -1.002596, 1, 1, 1, 1, 1,
-0.2993336, 1.644251, 0.100245, 1, 1, 1, 1, 1,
-0.2991097, -0.8616922, -3.174426, 1, 1, 1, 1, 1,
-0.2974902, 2.238503, -0.4741931, 1, 1, 1, 1, 1,
-0.2946983, 0.05985189, -0.6155636, 1, 1, 1, 1, 1,
-0.2940064, 1.218023, 0.3953055, 1, 1, 1, 1, 1,
-0.2854159, 0.3504446, 1.01923, 1, 1, 1, 1, 1,
-0.2831445, 1.391817, 1.523107, 1, 1, 1, 1, 1,
-0.2758572, -0.06683079, -1.431951, 1, 1, 1, 1, 1,
-0.2738879, 1.989756, -0.3981061, 1, 1, 1, 1, 1,
-0.2727616, 0.6284721, 0.001907108, 1, 1, 1, 1, 1,
-0.2713352, -0.6892168, -3.840285, 1, 1, 1, 1, 1,
-0.2708755, 0.4442598, 0.9159487, 1, 1, 1, 1, 1,
-0.2670581, 0.7550158, -0.844947, 1, 1, 1, 1, 1,
-0.2624446, -0.2675596, -3.597793, 0, 0, 1, 1, 1,
-0.2618422, 0.9333893, -0.7335654, 1, 0, 0, 1, 1,
-0.2521349, -0.210421, -4.008245, 1, 0, 0, 1, 1,
-0.2515039, 0.2124063, -1.221774, 1, 0, 0, 1, 1,
-0.249043, 1.141982, -1.723403, 1, 0, 0, 1, 1,
-0.2473399, 1.297185, -0.9139591, 1, 0, 0, 1, 1,
-0.2437925, -0.2153321, -2.321344, 0, 0, 0, 1, 1,
-0.2432564, 1.189856, -0.5917292, 0, 0, 0, 1, 1,
-0.2398738, 1.268114, -0.07921514, 0, 0, 0, 1, 1,
-0.2354495, -0.1150153, -3.279746, 0, 0, 0, 1, 1,
-0.2300411, 0.0592201, 0.2007383, 0, 0, 0, 1, 1,
-0.2287397, 1.046452, 1.733541, 0, 0, 0, 1, 1,
-0.2246076, 0.289931, -1.209271, 0, 0, 0, 1, 1,
-0.2213949, -0.4836798, -1.798354, 1, 1, 1, 1, 1,
-0.2200573, -0.21789, -0.9884974, 1, 1, 1, 1, 1,
-0.2200391, 1.476456, 1.222034, 1, 1, 1, 1, 1,
-0.2187883, 0.272795, -1.022372, 1, 1, 1, 1, 1,
-0.2168724, -0.4302357, -1.895953, 1, 1, 1, 1, 1,
-0.2098453, -0.02550833, 0.9820915, 1, 1, 1, 1, 1,
-0.2087184, -0.2414861, -2.833149, 1, 1, 1, 1, 1,
-0.2077536, 0.8301098, -0.5638883, 1, 1, 1, 1, 1,
-0.2060342, -0.05903794, -0.7664459, 1, 1, 1, 1, 1,
-0.2028872, 0.6285866, -1.192114, 1, 1, 1, 1, 1,
-0.202209, -0.6135983, -1.347332, 1, 1, 1, 1, 1,
-0.1986465, 2.492115, 1.41823, 1, 1, 1, 1, 1,
-0.19369, 0.111055, -0.5680265, 1, 1, 1, 1, 1,
-0.1914258, -0.5764717, -1.737369, 1, 1, 1, 1, 1,
-0.1904451, -1.143036, -3.639715, 1, 1, 1, 1, 1,
-0.186885, -0.5525863, -3.172338, 0, 0, 1, 1, 1,
-0.1867697, 1.557586, 1.373907, 1, 0, 0, 1, 1,
-0.1736268, 0.7982538, -1.115492, 1, 0, 0, 1, 1,
-0.1660689, 1.047865, -0.904025, 1, 0, 0, 1, 1,
-0.165857, 0.2690545, -1.454403, 1, 0, 0, 1, 1,
-0.1583994, -1.713544, -2.500282, 1, 0, 0, 1, 1,
-0.1569423, 0.8190116, 1.491292, 0, 0, 0, 1, 1,
-0.1489188, -0.2854654, -2.717905, 0, 0, 0, 1, 1,
-0.1477704, -0.8606287, -2.632723, 0, 0, 0, 1, 1,
-0.1467385, -0.5933993, -4.581449, 0, 0, 0, 1, 1,
-0.1428571, -1.63756, -3.7594, 0, 0, 0, 1, 1,
-0.1421244, 1.526939, -1.074222, 0, 0, 0, 1, 1,
-0.1376479, 0.1680405, -1.20878, 0, 0, 0, 1, 1,
-0.1366827, 1.343278, 0.3925622, 1, 1, 1, 1, 1,
-0.135722, 2.177312, 1.175912, 1, 1, 1, 1, 1,
-0.1337524, -0.2753251, -2.099891, 1, 1, 1, 1, 1,
-0.1321555, 3.479328, -0.8095334, 1, 1, 1, 1, 1,
-0.1270202, 0.5089186, -0.8282207, 1, 1, 1, 1, 1,
-0.1229362, -0.2066572, -1.046655, 1, 1, 1, 1, 1,
-0.1221139, 1.276265, -0.7372729, 1, 1, 1, 1, 1,
-0.1194143, -1.103441, -4.441634, 1, 1, 1, 1, 1,
-0.1190309, -0.3675861, -2.771234, 1, 1, 1, 1, 1,
-0.1187232, -1.24596, -2.797294, 1, 1, 1, 1, 1,
-0.1158861, -0.8689353, -3.015581, 1, 1, 1, 1, 1,
-0.1149644, -2.28358, -3.604441, 1, 1, 1, 1, 1,
-0.1135923, -0.3693141, -3.328508, 1, 1, 1, 1, 1,
-0.1135073, 0.3191409, 0.8223175, 1, 1, 1, 1, 1,
-0.1090779, -1.933856, -2.612674, 1, 1, 1, 1, 1,
-0.1059017, 0.6867475, -1.400178, 0, 0, 1, 1, 1,
-0.1045412, -0.06008847, -1.932437, 1, 0, 0, 1, 1,
-0.1026176, -0.2958015, -3.489575, 1, 0, 0, 1, 1,
-0.09481356, -0.5022367, -1.05437, 1, 0, 0, 1, 1,
-0.09250402, -0.3804172, -3.175195, 1, 0, 0, 1, 1,
-0.08848526, -1.684893, -3.997993, 1, 0, 0, 1, 1,
-0.08781825, -0.2376042, -3.262363, 0, 0, 0, 1, 1,
-0.08327687, 1.484, 1.220557, 0, 0, 0, 1, 1,
-0.08113791, 0.8567503, -1.354702, 0, 0, 0, 1, 1,
-0.07731912, -0.1661849, -3.167211, 0, 0, 0, 1, 1,
-0.07375431, 0.9747342, -0.5560042, 0, 0, 0, 1, 1,
-0.0705518, 0.59769, 1.827986, 0, 0, 0, 1, 1,
-0.0695335, -0.1654651, -3.07059, 0, 0, 0, 1, 1,
-0.06937075, 0.1598282, 0.1456608, 1, 1, 1, 1, 1,
-0.06476758, -0.6659056, -0.4977102, 1, 1, 1, 1, 1,
-0.05958805, 1.594007, 0.8294268, 1, 1, 1, 1, 1,
-0.05642214, -1.142581, -2.252093, 1, 1, 1, 1, 1,
-0.05529426, 1.172573, 0.814221, 1, 1, 1, 1, 1,
-0.05385218, -0.2668272, -3.285237, 1, 1, 1, 1, 1,
-0.0532997, -1.7898, -1.190053, 1, 1, 1, 1, 1,
-0.0449519, 0.164719, 1.135031, 1, 1, 1, 1, 1,
-0.04387847, -0.1827815, -3.013646, 1, 1, 1, 1, 1,
-0.0433936, 0.8067464, -0.3743601, 1, 1, 1, 1, 1,
-0.03954788, -0.4639198, -3.706316, 1, 1, 1, 1, 1,
-0.03928401, 0.8868405, 0.2180405, 1, 1, 1, 1, 1,
-0.03608461, -0.2250196, -1.796717, 1, 1, 1, 1, 1,
-0.03308009, -0.04562828, -2.370176, 1, 1, 1, 1, 1,
-0.02888168, 1.81354, 0.1442946, 1, 1, 1, 1, 1,
-0.02774873, -0.2265223, -1.99439, 0, 0, 1, 1, 1,
-0.0186279, -0.3538243, -1.417514, 1, 0, 0, 1, 1,
-0.01714668, -0.2866578, -2.190235, 1, 0, 0, 1, 1,
-0.01611633, 0.1302095, -0.8994713, 1, 0, 0, 1, 1,
-0.01222567, 0.07957375, -0.6393322, 1, 0, 0, 1, 1,
-0.01118472, 1.466767, 0.277279, 1, 0, 0, 1, 1,
-0.01097673, -1.020532, -3.655537, 0, 0, 0, 1, 1,
-0.01007768, 0.8213865, -1.032489, 0, 0, 0, 1, 1,
-0.007325552, -0.03617095, -4.147913, 0, 0, 0, 1, 1,
-0.00656138, -1.577818, -2.252326, 0, 0, 0, 1, 1,
-0.005912101, -1.751353, -3.066541, 0, 0, 0, 1, 1,
-0.005733141, -1.487846, -1.899801, 0, 0, 0, 1, 1,
-0.00350712, -0.01309248, -3.025037, 0, 0, 0, 1, 1,
-0.002532657, -0.6357996, -3.947319, 1, 1, 1, 1, 1,
-0.001532541, 1.152467, 0.8439916, 1, 1, 1, 1, 1,
4.33689e-05, -0.05653728, 3.674204, 1, 1, 1, 1, 1,
0.002800159, -1.762232, 3.508372, 1, 1, 1, 1, 1,
0.007039432, 1.293371, 0.809065, 1, 1, 1, 1, 1,
0.009466221, 0.3720623, 0.5777541, 1, 1, 1, 1, 1,
0.01025872, -0.007441958, 1.147655, 1, 1, 1, 1, 1,
0.01051727, -0.1937563, 3.643918, 1, 1, 1, 1, 1,
0.01322037, -0.181613, 3.584911, 1, 1, 1, 1, 1,
0.01554036, 0.3381937, -0.43524, 1, 1, 1, 1, 1,
0.01626397, 0.6192413, 0.2273553, 1, 1, 1, 1, 1,
0.01801055, 0.2283195, 0.3185987, 1, 1, 1, 1, 1,
0.02051502, 1.5483, 0.971313, 1, 1, 1, 1, 1,
0.02141801, 1.639413, 0.1830407, 1, 1, 1, 1, 1,
0.02520021, 0.425346, 1.282855, 1, 1, 1, 1, 1,
0.02625155, 0.1119285, 0.791634, 0, 0, 1, 1, 1,
0.02714516, 2.470237, -0.1771746, 1, 0, 0, 1, 1,
0.03082602, 2.128166, 2.747067, 1, 0, 0, 1, 1,
0.03451319, 1.118146, -0.5932046, 1, 0, 0, 1, 1,
0.03583609, -1.34491, 2.820757, 1, 0, 0, 1, 1,
0.03866579, -2.057006, 4.356523, 1, 0, 0, 1, 1,
0.03879331, 0.71514, 0.9069382, 0, 0, 0, 1, 1,
0.03892152, -0.1689689, 3.195912, 0, 0, 0, 1, 1,
0.04516676, 0.464178, 0.2912918, 0, 0, 0, 1, 1,
0.04636498, -1.274423, 3.303263, 0, 0, 0, 1, 1,
0.04700173, -0.5502132, 2.832906, 0, 0, 0, 1, 1,
0.04710065, 1.524157, -0.2880213, 0, 0, 0, 1, 1,
0.05307671, 0.8492891, 0.7346222, 0, 0, 0, 1, 1,
0.05733644, -0.1868875, 2.707725, 1, 1, 1, 1, 1,
0.05897284, 0.3505904, 0.5349592, 1, 1, 1, 1, 1,
0.05955021, 0.6598684, 1.058377, 1, 1, 1, 1, 1,
0.06143123, 0.3003331, 1.375806, 1, 1, 1, 1, 1,
0.06149067, -0.8799433, 2.746795, 1, 1, 1, 1, 1,
0.06214337, -1.08314, 2.919088, 1, 1, 1, 1, 1,
0.06247687, 0.7497407, 0.6493798, 1, 1, 1, 1, 1,
0.06325383, 0.1776687, 0.6756175, 1, 1, 1, 1, 1,
0.0681757, 0.105924, 0.1593058, 1, 1, 1, 1, 1,
0.06932586, -0.8770829, 3.24718, 1, 1, 1, 1, 1,
0.07157146, -1.013144, 3.578619, 1, 1, 1, 1, 1,
0.07476249, 1.261393, -0.5514284, 1, 1, 1, 1, 1,
0.07572385, 1.164867, -0.2270844, 1, 1, 1, 1, 1,
0.07583324, -0.2616914, 2.592002, 1, 1, 1, 1, 1,
0.07854789, 0.08113319, 0.5152844, 1, 1, 1, 1, 1,
0.08099667, 0.3306521, -0.4638984, 0, 0, 1, 1, 1,
0.08198218, -1.018047, 2.78905, 1, 0, 0, 1, 1,
0.08375825, 0.7078943, -0.2969565, 1, 0, 0, 1, 1,
0.09495822, -0.4301519, 4.16601, 1, 0, 0, 1, 1,
0.09559159, -1.133821, 3.506655, 1, 0, 0, 1, 1,
0.1003687, -0.3557359, 1.50316, 1, 0, 0, 1, 1,
0.1008587, 0.3273593, 0.4080476, 0, 0, 0, 1, 1,
0.1027687, -1.259825, 5.145811, 0, 0, 0, 1, 1,
0.1123638, 0.1863068, 0.1755699, 0, 0, 0, 1, 1,
0.1136395, 0.4644426, 0.003618605, 0, 0, 0, 1, 1,
0.1159005, -2.776112, 2.414848, 0, 0, 0, 1, 1,
0.1257855, 0.4247087, 0.01936909, 0, 0, 0, 1, 1,
0.126527, -0.4048608, 1.680042, 0, 0, 0, 1, 1,
0.132414, 0.5315787, 2.438795, 1, 1, 1, 1, 1,
0.1335505, 1.323412, 0.0371495, 1, 1, 1, 1, 1,
0.1341054, 0.8370685, -0.3811365, 1, 1, 1, 1, 1,
0.1388571, -3.179109, 2.745937, 1, 1, 1, 1, 1,
0.1394325, -0.3745669, 1.839598, 1, 1, 1, 1, 1,
0.1419864, 1.18916, 0.6756126, 1, 1, 1, 1, 1,
0.1453827, -0.7174965, 0.826666, 1, 1, 1, 1, 1,
0.1481524, 0.630614, -0.6835265, 1, 1, 1, 1, 1,
0.1501216, 0.9324656, 0.6198767, 1, 1, 1, 1, 1,
0.1536105, -0.6623285, 3.153684, 1, 1, 1, 1, 1,
0.1552485, -1.008541, 3.333357, 1, 1, 1, 1, 1,
0.1557953, -0.05236542, 1.719515, 1, 1, 1, 1, 1,
0.1589654, 0.9118666, -0.1805963, 1, 1, 1, 1, 1,
0.1646166, -1.738693, 4.396083, 1, 1, 1, 1, 1,
0.1670814, -1.62763, 2.844562, 1, 1, 1, 1, 1,
0.1732097, -0.3976149, 4.015781, 0, 0, 1, 1, 1,
0.1750716, -0.723737, 3.41124, 1, 0, 0, 1, 1,
0.175505, -0.3917993, 3.787836, 1, 0, 0, 1, 1,
0.1774926, 0.07865055, -0.9591343, 1, 0, 0, 1, 1,
0.1804017, -0.5016863, 2.952688, 1, 0, 0, 1, 1,
0.1804241, 0.005631222, 1.977059, 1, 0, 0, 1, 1,
0.1809921, -0.4791085, 4.532905, 0, 0, 0, 1, 1,
0.1839096, -0.4623863, 2.18219, 0, 0, 0, 1, 1,
0.1876535, -0.3043994, 2.571876, 0, 0, 0, 1, 1,
0.1880503, 0.2512378, 0.104754, 0, 0, 0, 1, 1,
0.1895577, 0.5212377, 2.602, 0, 0, 0, 1, 1,
0.190787, 0.8600134, 0.4652138, 0, 0, 0, 1, 1,
0.2056659, -0.351411, 2.444953, 0, 0, 0, 1, 1,
0.2154308, 1.055094, 0.3197325, 1, 1, 1, 1, 1,
0.2157597, 0.1380044, -0.1751809, 1, 1, 1, 1, 1,
0.2158794, 0.1541944, -0.1843356, 1, 1, 1, 1, 1,
0.21691, -0.5236538, 3.52983, 1, 1, 1, 1, 1,
0.2170979, -2.865391, 3.677091, 1, 1, 1, 1, 1,
0.2226828, -0.3671501, 3.202558, 1, 1, 1, 1, 1,
0.2235804, -0.7430198, 2.576082, 1, 1, 1, 1, 1,
0.2267536, -0.8049141, 2.721496, 1, 1, 1, 1, 1,
0.2268218, 0.8517736, -1.392311, 1, 1, 1, 1, 1,
0.2292378, 0.5498743, 0.3976858, 1, 1, 1, 1, 1,
0.2302434, -0.9585606, 3.459081, 1, 1, 1, 1, 1,
0.2317376, 0.8440577, -0.108842, 1, 1, 1, 1, 1,
0.2328163, -0.06084, 1.700477, 1, 1, 1, 1, 1,
0.2330205, -0.124434, 0.7455202, 1, 1, 1, 1, 1,
0.2393852, 0.05378232, -0.5266776, 1, 1, 1, 1, 1,
0.2419044, 0.9179314, 0.8165622, 0, 0, 1, 1, 1,
0.2438731, 2.077516, 0.555135, 1, 0, 0, 1, 1,
0.2454766, 0.4285038, 1.921221, 1, 0, 0, 1, 1,
0.2493589, -0.8047032, 4.201587, 1, 0, 0, 1, 1,
0.2496103, 2.05702, 0.1926944, 1, 0, 0, 1, 1,
0.250246, 0.7489009, 0.2242583, 1, 0, 0, 1, 1,
0.250614, -0.09115498, 0.6430876, 0, 0, 0, 1, 1,
0.2508572, 2.351629, -0.6746519, 0, 0, 0, 1, 1,
0.2518814, 0.4001291, -0.3678716, 0, 0, 0, 1, 1,
0.2569339, 0.2827754, 1.403158, 0, 0, 0, 1, 1,
0.2597663, -0.3303263, 3.092559, 0, 0, 0, 1, 1,
0.2599219, 0.5338895, 1.945283, 0, 0, 0, 1, 1,
0.2613241, -0.2004593, 2.556996, 0, 0, 0, 1, 1,
0.2617494, 1.160744, -0.5000139, 1, 1, 1, 1, 1,
0.2635287, 0.492673, 0.1385204, 1, 1, 1, 1, 1,
0.2651428, 0.5418531, -0.112087, 1, 1, 1, 1, 1,
0.2655492, -1.107383, 4.270171, 1, 1, 1, 1, 1,
0.2670297, 0.1605397, 1.425933, 1, 1, 1, 1, 1,
0.2689609, 2.015191, -1.133073, 1, 1, 1, 1, 1,
0.2703526, 1.00785, 0.4353021, 1, 1, 1, 1, 1,
0.2706446, 0.2808322, 2.367802, 1, 1, 1, 1, 1,
0.2707491, -0.02295256, 1.736408, 1, 1, 1, 1, 1,
0.2712013, 1.24008, 0.6078558, 1, 1, 1, 1, 1,
0.2776345, 0.6256727, 1.70397, 1, 1, 1, 1, 1,
0.2778465, 0.1284028, 1.340951, 1, 1, 1, 1, 1,
0.2779385, -0.3805482, 3.072359, 1, 1, 1, 1, 1,
0.2780263, -0.1110526, 3.925306, 1, 1, 1, 1, 1,
0.2791879, -0.9375872, 0.1992087, 1, 1, 1, 1, 1,
0.2817287, 1.979087, 0.01156684, 0, 0, 1, 1, 1,
0.2818599, 0.2833386, 0.2337536, 1, 0, 0, 1, 1,
0.2836454, 0.8033078, -0.04225602, 1, 0, 0, 1, 1,
0.2841035, -2.316699, 3.922426, 1, 0, 0, 1, 1,
0.2843133, -0.330689, 2.905585, 1, 0, 0, 1, 1,
0.2881392, -0.7235326, 2.622128, 1, 0, 0, 1, 1,
0.2935087, 0.5132177, 1.215927, 0, 0, 0, 1, 1,
0.2987619, 0.1923064, 0.3267421, 0, 0, 0, 1, 1,
0.2992601, -0.7442526, 0.7733583, 0, 0, 0, 1, 1,
0.2994743, 0.1625881, -0.4630792, 0, 0, 0, 1, 1,
0.3032563, 0.5965284, -1.752115, 0, 0, 0, 1, 1,
0.3046361, -0.4860913, 1.027604, 0, 0, 0, 1, 1,
0.3049113, 2.248035, -0.974281, 0, 0, 0, 1, 1,
0.3056106, 0.9671612, 0.5028198, 1, 1, 1, 1, 1,
0.3136305, 0.09161426, 2.683537, 1, 1, 1, 1, 1,
0.3145256, -0.113575, 3.257585, 1, 1, 1, 1, 1,
0.3154334, 0.2074086, 0.4128953, 1, 1, 1, 1, 1,
0.321247, 0.3665634, 0.0483661, 1, 1, 1, 1, 1,
0.3213485, 0.2805771, 3.115978, 1, 1, 1, 1, 1,
0.3251804, 1.548292, 0.2679007, 1, 1, 1, 1, 1,
0.3267354, -1.158253, 3.55084, 1, 1, 1, 1, 1,
0.3289727, 0.2166492, 0.1765454, 1, 1, 1, 1, 1,
0.3297465, -0.2715399, 1.255103, 1, 1, 1, 1, 1,
0.3299984, -1.408895, 2.819383, 1, 1, 1, 1, 1,
0.3310831, 1.37591, 0.187861, 1, 1, 1, 1, 1,
0.334828, -2.430889, 4.785964, 1, 1, 1, 1, 1,
0.3428643, -0.242006, 2.769737, 1, 1, 1, 1, 1,
0.3461336, -0.4960454, 1.611863, 1, 1, 1, 1, 1,
0.3466177, 0.3183822, 1.787983, 0, 0, 1, 1, 1,
0.346936, -0.4407591, 1.113396, 1, 0, 0, 1, 1,
0.3491801, 0.1999536, 2.56053, 1, 0, 0, 1, 1,
0.3517244, -1.643643, 2.511426, 1, 0, 0, 1, 1,
0.3567748, 0.4872811, 0.7525409, 1, 0, 0, 1, 1,
0.3596536, -0.609007, 0.01612324, 1, 0, 0, 1, 1,
0.3609033, -0.6499251, 1.05683, 0, 0, 0, 1, 1,
0.361556, 1.129971, -0.3188857, 0, 0, 0, 1, 1,
0.3638722, 0.4968126, 0.4816288, 0, 0, 0, 1, 1,
0.3656216, 2.491872, 0.8503937, 0, 0, 0, 1, 1,
0.3667848, -0.6287362, 2.063749, 0, 0, 0, 1, 1,
0.3673074, -0.6878463, 1.792467, 0, 0, 0, 1, 1,
0.372476, -0.08621818, 1.307645, 0, 0, 0, 1, 1,
0.3732307, 0.7875983, 1.250836, 1, 1, 1, 1, 1,
0.374412, -1.011446, 3.778912, 1, 1, 1, 1, 1,
0.3785259, 0.8197346, 0.4404438, 1, 1, 1, 1, 1,
0.379373, 0.6561951, 0.7556616, 1, 1, 1, 1, 1,
0.3804175, -0.5360562, 3.313974, 1, 1, 1, 1, 1,
0.383034, -1.268674, 3.416024, 1, 1, 1, 1, 1,
0.3870966, -1.225076, 2.081908, 1, 1, 1, 1, 1,
0.3889525, -0.264693, 1.36689, 1, 1, 1, 1, 1,
0.3924025, 0.2101874, 2.114613, 1, 1, 1, 1, 1,
0.3958108, -0.6774793, 1.936954, 1, 1, 1, 1, 1,
0.3985611, -1.06693, 2.363847, 1, 1, 1, 1, 1,
0.3991342, 1.041264, 0.8688329, 1, 1, 1, 1, 1,
0.4002449, 2.399355, -0.643397, 1, 1, 1, 1, 1,
0.4080817, 0.7309318, 0.2587639, 1, 1, 1, 1, 1,
0.4084588, -0.6190726, 2.576761, 1, 1, 1, 1, 1,
0.4093106, -0.1030025, 0.5335813, 0, 0, 1, 1, 1,
0.4127699, -0.1117605, 1.980724, 1, 0, 0, 1, 1,
0.4149486, 0.6484008, 1.211931, 1, 0, 0, 1, 1,
0.4151476, 0.4959541, -1.829199, 1, 0, 0, 1, 1,
0.4182001, 0.1410033, 0.8109142, 1, 0, 0, 1, 1,
0.4192924, 1.602275, 1.485821, 1, 0, 0, 1, 1,
0.4240811, 0.6158902, -0.4020843, 0, 0, 0, 1, 1,
0.4244176, 0.2481807, 2.563522, 0, 0, 0, 1, 1,
0.4293165, 0.1041541, 1.056437, 0, 0, 0, 1, 1,
0.4298823, 0.03655128, 0.9661983, 0, 0, 0, 1, 1,
0.4320209, -0.3470472, 2.565212, 0, 0, 0, 1, 1,
0.4356478, 1.054119, -1.062124, 0, 0, 0, 1, 1,
0.4365124, 0.4116123, 0.5939533, 0, 0, 0, 1, 1,
0.4497194, -1.988395, 3.000602, 1, 1, 1, 1, 1,
0.455917, -1.049394, 2.869667, 1, 1, 1, 1, 1,
0.4615241, 1.417703, -0.2242754, 1, 1, 1, 1, 1,
0.466269, 0.2550993, 1.412788, 1, 1, 1, 1, 1,
0.4680685, 1.302602, -0.4188464, 1, 1, 1, 1, 1,
0.4710976, -0.4492632, 2.671311, 1, 1, 1, 1, 1,
0.4712422, -1.283219, 2.829824, 1, 1, 1, 1, 1,
0.4730747, -1.602904, 3.426535, 1, 1, 1, 1, 1,
0.4762405, 0.5436229, 1.214631, 1, 1, 1, 1, 1,
0.4779076, -1.791297, 2.121799, 1, 1, 1, 1, 1,
0.481073, 1.007653, -1.368655, 1, 1, 1, 1, 1,
0.4814735, 1.989223, -0.1574634, 1, 1, 1, 1, 1,
0.482714, -2.080225, 2.145989, 1, 1, 1, 1, 1,
0.4867861, 0.05854015, 1.066658, 1, 1, 1, 1, 1,
0.4933472, -0.4027559, 1.438539, 1, 1, 1, 1, 1,
0.4984744, 0.1278195, 1.79881, 0, 0, 1, 1, 1,
0.5050797, 0.5552027, -0.4919214, 1, 0, 0, 1, 1,
0.5082909, 0.6888523, -0.08037993, 1, 0, 0, 1, 1,
0.5091559, 0.03447995, 1.861561, 1, 0, 0, 1, 1,
0.5161424, 0.7852872, 0.5840454, 1, 0, 0, 1, 1,
0.5168197, 0.5796292, 0.04016208, 1, 0, 0, 1, 1,
0.5171844, -1.368517, 3.966657, 0, 0, 0, 1, 1,
0.5177103, -1.431071, 3.05794, 0, 0, 0, 1, 1,
0.5190101, 0.09341518, -0.3490867, 0, 0, 0, 1, 1,
0.5198745, -0.2724859, 1.732824, 0, 0, 0, 1, 1,
0.5229427, -0.6799666, 2.548812, 0, 0, 0, 1, 1,
0.5236976, -0.5750083, 3.091964, 0, 0, 0, 1, 1,
0.532028, 0.6783239, -1.001426, 0, 0, 0, 1, 1,
0.5327426, -1.68229, 3.146625, 1, 1, 1, 1, 1,
0.5337387, -1.032034, 2.430709, 1, 1, 1, 1, 1,
0.5365926, -0.1182456, 1.01965, 1, 1, 1, 1, 1,
0.5422413, -0.4410315, 3.736796, 1, 1, 1, 1, 1,
0.5442505, -0.3624836, 1.250398, 1, 1, 1, 1, 1,
0.5449924, 1.658016, 1.135549, 1, 1, 1, 1, 1,
0.5462048, 0.216296, 2.449045, 1, 1, 1, 1, 1,
0.5480241, -1.403457, 3.338625, 1, 1, 1, 1, 1,
0.548889, -0.03144116, 1.935342, 1, 1, 1, 1, 1,
0.5510213, -1.618516, 1.965207, 1, 1, 1, 1, 1,
0.5626116, -0.8107507, 2.932261, 1, 1, 1, 1, 1,
0.5659597, -1.424427, 2.978309, 1, 1, 1, 1, 1,
0.5772167, 0.1164526, 0.535861, 1, 1, 1, 1, 1,
0.5778539, -0.7891524, 2.589512, 1, 1, 1, 1, 1,
0.5788043, 0.5934513, -0.05284604, 1, 1, 1, 1, 1,
0.581622, 1.073866, 0.6436242, 0, 0, 1, 1, 1,
0.5910858, -1.870125, 2.528359, 1, 0, 0, 1, 1,
0.5911837, 1.291708, 1.621752, 1, 0, 0, 1, 1,
0.5936961, 2.048048, -0.4931551, 1, 0, 0, 1, 1,
0.5988123, 0.8237897, -0.70901, 1, 0, 0, 1, 1,
0.6004367, -0.8887599, 2.195286, 1, 0, 0, 1, 1,
0.6012857, 1.982526, 0.5534866, 0, 0, 0, 1, 1,
0.6024134, -0.295116, 0.9530983, 0, 0, 0, 1, 1,
0.6027362, -0.4743981, 2.668928, 0, 0, 0, 1, 1,
0.6047108, 0.5527521, 1.65471, 0, 0, 0, 1, 1,
0.6166461, -1.912924, 1.977787, 0, 0, 0, 1, 1,
0.6174309, -1.760354, 2.502086, 0, 0, 0, 1, 1,
0.6194131, 0.8583032, -0.0998086, 0, 0, 0, 1, 1,
0.62069, 0.2980393, 2.622247, 1, 1, 1, 1, 1,
0.6209776, -1.257222, 3.135221, 1, 1, 1, 1, 1,
0.6281485, 0.3927265, 1.606317, 1, 1, 1, 1, 1,
0.6288486, -0.3208909, 2.497884, 1, 1, 1, 1, 1,
0.6353288, -0.2394139, 2.739224, 1, 1, 1, 1, 1,
0.6397564, 0.7599723, 0.3344552, 1, 1, 1, 1, 1,
0.6415586, -0.2206761, 0.900506, 1, 1, 1, 1, 1,
0.6428748, -0.237519, 2.43331, 1, 1, 1, 1, 1,
0.6475604, 0.1959972, 1.324809, 1, 1, 1, 1, 1,
0.6502636, 1.777386, 1.403779, 1, 1, 1, 1, 1,
0.6550083, 1.253725, 1.471659, 1, 1, 1, 1, 1,
0.6619149, -1.246641, 3.384243, 1, 1, 1, 1, 1,
0.6626144, -0.777428, 2.430764, 1, 1, 1, 1, 1,
0.6653196, 0.6971296, 1.351458, 1, 1, 1, 1, 1,
0.6664451, -1.412956, 3.41166, 1, 1, 1, 1, 1,
0.6688434, 1.445897, -0.9375724, 0, 0, 1, 1, 1,
0.6700541, -0.2640139, 2.085516, 1, 0, 0, 1, 1,
0.6724528, -0.8769755, 2.315468, 1, 0, 0, 1, 1,
0.676999, -0.3851905, 0.7165285, 1, 0, 0, 1, 1,
0.6772893, 0.1615424, 2.239195, 1, 0, 0, 1, 1,
0.6814631, -1.404057, 2.992166, 1, 0, 0, 1, 1,
0.6823698, 0.2789237, 2.806496, 0, 0, 0, 1, 1,
0.6828941, 0.2549154, 0.9671287, 0, 0, 0, 1, 1,
0.6831036, 0.9533366, 0.4112659, 0, 0, 0, 1, 1,
0.6881722, -2.040273, 2.258881, 0, 0, 0, 1, 1,
0.690613, -0.2726302, 1.161954, 0, 0, 0, 1, 1,
0.6923548, -1.358212, 2.74935, 0, 0, 0, 1, 1,
0.6929966, -0.1678439, -0.0453504, 0, 0, 0, 1, 1,
0.6939235, -1.311316, 3.877216, 1, 1, 1, 1, 1,
0.701196, -1.039956, 2.997957, 1, 1, 1, 1, 1,
0.7048377, -2.196077, 4.287355, 1, 1, 1, 1, 1,
0.711663, 0.3865615, 0.8359132, 1, 1, 1, 1, 1,
0.7130102, -1.73036, 2.823189, 1, 1, 1, 1, 1,
0.7134018, 0.5806335, -0.08529847, 1, 1, 1, 1, 1,
0.7161062, 0.5101634, -0.6464132, 1, 1, 1, 1, 1,
0.7180754, -0.2324129, 1.805916, 1, 1, 1, 1, 1,
0.7233846, -3.09095, 3.521839, 1, 1, 1, 1, 1,
0.7245378, -0.5589756, 0.738941, 1, 1, 1, 1, 1,
0.7298487, -1.982672, 3.696417, 1, 1, 1, 1, 1,
0.7334759, -1.266496, 1.728966, 1, 1, 1, 1, 1,
0.7342373, -1.044493, 3.627945, 1, 1, 1, 1, 1,
0.7359387, 0.1332462, 1.900451, 1, 1, 1, 1, 1,
0.7394333, -1.749309, 4.035519, 1, 1, 1, 1, 1,
0.7434331, -0.4452629, 2.763585, 0, 0, 1, 1, 1,
0.744402, -0.4695648, 2.636918, 1, 0, 0, 1, 1,
0.7480338, 1.221996, 0.78914, 1, 0, 0, 1, 1,
0.7482313, -1.504189, 4.35233, 1, 0, 0, 1, 1,
0.7502744, -0.2552767, 0.7683948, 1, 0, 0, 1, 1,
0.7515197, 0.9090451, -1.09308, 1, 0, 0, 1, 1,
0.7545709, -1.538268, 2.904758, 0, 0, 0, 1, 1,
0.7549652, 0.1811243, 2.967496, 0, 0, 0, 1, 1,
0.7598246, -1.95452, 3.711902, 0, 0, 0, 1, 1,
0.7601944, 0.9010282, 0.8630778, 0, 0, 0, 1, 1,
0.764773, -0.3192221, 2.483148, 0, 0, 0, 1, 1,
0.7651656, 0.8204052, 1.792937, 0, 0, 0, 1, 1,
0.7670006, 0.1763537, 0.8093727, 0, 0, 0, 1, 1,
0.7683935, 1.268361, -0.3066312, 1, 1, 1, 1, 1,
0.7706243, -0.05188739, 3.648056, 1, 1, 1, 1, 1,
0.7710316, -1.012528, 3.143848, 1, 1, 1, 1, 1,
0.7722146, 1.924452, 0.4914915, 1, 1, 1, 1, 1,
0.7746701, 1.2225, 2.132097, 1, 1, 1, 1, 1,
0.7774457, -0.838185, 2.381875, 1, 1, 1, 1, 1,
0.7774702, -2.055043, 3.648825, 1, 1, 1, 1, 1,
0.7800871, -1.489228, 2.529349, 1, 1, 1, 1, 1,
0.7817339, -0.5765184, 3.668235, 1, 1, 1, 1, 1,
0.7822033, 0.7220095, 1.000237, 1, 1, 1, 1, 1,
0.7844155, 0.6030027, 1.228617, 1, 1, 1, 1, 1,
0.7845354, 1.627541, -0.3767858, 1, 1, 1, 1, 1,
0.7848109, 1.470743, -0.04925238, 1, 1, 1, 1, 1,
0.7853456, 0.3139712, 1.736501, 1, 1, 1, 1, 1,
0.7889735, -0.8589552, 3.030403, 1, 1, 1, 1, 1,
0.7949535, -0.3101457, 1.372877, 0, 0, 1, 1, 1,
0.7960626, -0.7183765, 1.8573, 1, 0, 0, 1, 1,
0.796167, -0.7235368, 1.790746, 1, 0, 0, 1, 1,
0.7965799, -0.8411857, 2.050045, 1, 0, 0, 1, 1,
0.7975935, 0.185108, 1.74858, 1, 0, 0, 1, 1,
0.8044322, 1.831669, 0.4817362, 1, 0, 0, 1, 1,
0.8050137, 0.2467598, 0.2020005, 0, 0, 0, 1, 1,
0.8145757, 0.2511285, -0.1898576, 0, 0, 0, 1, 1,
0.815102, 0.6791953, 1.044738, 0, 0, 0, 1, 1,
0.8214865, 1.869283, -0.8721922, 0, 0, 0, 1, 1,
0.8309303, 0.5622026, 0.7765614, 0, 0, 0, 1, 1,
0.8370516, -1.082294, 2.035625, 0, 0, 0, 1, 1,
0.8379266, -0.9440357, 3.106822, 0, 0, 0, 1, 1,
0.8420043, 1.053364, 2.40846, 1, 1, 1, 1, 1,
0.8443497, 1.087164, 1.798923, 1, 1, 1, 1, 1,
0.8452917, -0.001703196, 3.652681, 1, 1, 1, 1, 1,
0.8505064, 0.1441628, 2.458907, 1, 1, 1, 1, 1,
0.8517647, -0.91976, 3.1561, 1, 1, 1, 1, 1,
0.8537109, -1.269959, 2.057129, 1, 1, 1, 1, 1,
0.8540831, 0.9549543, 1.310702, 1, 1, 1, 1, 1,
0.8555323, -0.5744324, 1.43476, 1, 1, 1, 1, 1,
0.8636245, -0.424158, 0.03293527, 1, 1, 1, 1, 1,
0.8667828, 1.500964, -0.3648376, 1, 1, 1, 1, 1,
0.8755302, -0.07582081, 2.780527, 1, 1, 1, 1, 1,
0.8836976, 1.796573, 2.187142, 1, 1, 1, 1, 1,
0.8899325, 0.663042, 0.9094768, 1, 1, 1, 1, 1,
0.8931072, 1.945837, 1.150039, 1, 1, 1, 1, 1,
0.8979934, 0.6045825, 1.395725, 1, 1, 1, 1, 1,
0.9029627, 1.310107, 0.3842181, 0, 0, 1, 1, 1,
0.907342, 0.4552955, 0.1930014, 1, 0, 0, 1, 1,
0.9124231, 2.173581, 0.02683471, 1, 0, 0, 1, 1,
0.9155572, 1.131775, 0.6304771, 1, 0, 0, 1, 1,
0.9174672, 0.4580679, 0.02250004, 1, 0, 0, 1, 1,
0.9182383, -0.3771591, 2.464793, 1, 0, 0, 1, 1,
0.9197937, 0.7878183, -1.03128, 0, 0, 0, 1, 1,
0.9237785, -1.606299, 2.20747, 0, 0, 0, 1, 1,
0.9274569, 0.2735266, 1.500796, 0, 0, 0, 1, 1,
0.9297333, 1.283611, 1.072251, 0, 0, 0, 1, 1,
0.9346071, 0.8452812, 1.165205, 0, 0, 0, 1, 1,
0.9419097, 0.3168178, 0.6547469, 0, 0, 0, 1, 1,
0.9438777, -0.178966, 1.86045, 0, 0, 0, 1, 1,
0.9439026, -0.4184891, 2.396137, 1, 1, 1, 1, 1,
0.9504744, 1.490345, 1.680443, 1, 1, 1, 1, 1,
0.9535841, 0.7655103, -0.6513599, 1, 1, 1, 1, 1,
0.9566233, -1.016613, 0.461725, 1, 1, 1, 1, 1,
0.9639276, -0.07161129, 1.975577, 1, 1, 1, 1, 1,
0.9674141, -0.4752545, 1.548275, 1, 1, 1, 1, 1,
0.9687682, 0.5373588, 1.339986, 1, 1, 1, 1, 1,
0.9702956, -0.9242166, 3.464139, 1, 1, 1, 1, 1,
0.9730082, -0.2137935, 1.706268, 1, 1, 1, 1, 1,
0.9750291, -1.426178, 2.864615, 1, 1, 1, 1, 1,
0.9763929, -0.1170089, 2.741771, 1, 1, 1, 1, 1,
0.9805879, 0.5361744, 0.9245163, 1, 1, 1, 1, 1,
0.9845639, 0.1634215, 1.238878, 1, 1, 1, 1, 1,
0.9882706, -0.6838936, 1.11324, 1, 1, 1, 1, 1,
0.997596, -1.102266, 2.009257, 1, 1, 1, 1, 1,
1.000415, -0.3138897, 1.560195, 0, 0, 1, 1, 1,
1.002585, 0.9740958, 0.9228048, 1, 0, 0, 1, 1,
1.006725, 1.467666, 1.174941, 1, 0, 0, 1, 1,
1.01184, -0.4889862, 3.147342, 1, 0, 0, 1, 1,
1.018225, 1.029392, 1.67362, 1, 0, 0, 1, 1,
1.020171, -0.4931161, 1.659316, 1, 0, 0, 1, 1,
1.031629, -0.2201985, 2.431288, 0, 0, 0, 1, 1,
1.031961, 0.5164393, 1.118811, 0, 0, 0, 1, 1,
1.032611, 0.941274, 1.559623, 0, 0, 0, 1, 1,
1.044851, 0.7698974, 1.293956, 0, 0, 0, 1, 1,
1.047226, 0.6485193, 1.675002, 0, 0, 0, 1, 1,
1.049397, 1.721137, -0.5785118, 0, 0, 0, 1, 1,
1.052628, -2.410454, 2.833843, 0, 0, 0, 1, 1,
1.053459, 0.3380637, 0.8818815, 1, 1, 1, 1, 1,
1.053796, 0.9251412, 0.8154306, 1, 1, 1, 1, 1,
1.059795, 1.813928, -0.8959, 1, 1, 1, 1, 1,
1.066311, 0.453307, 1.36635, 1, 1, 1, 1, 1,
1.067588, 0.0771829, 1.877635, 1, 1, 1, 1, 1,
1.078876, -0.2335243, -0.2810122, 1, 1, 1, 1, 1,
1.084333, 0.4552685, 0.7261696, 1, 1, 1, 1, 1,
1.093453, -1.875085, 4.481587, 1, 1, 1, 1, 1,
1.100059, -0.4407659, 1.180953, 1, 1, 1, 1, 1,
1.102675, -0.1474624, 0.9246441, 1, 1, 1, 1, 1,
1.106811, -0.8329318, 2.32578, 1, 1, 1, 1, 1,
1.107997, 0.8825359, 1.294096, 1, 1, 1, 1, 1,
1.112224, -0.8997459, 2.004131, 1, 1, 1, 1, 1,
1.122894, 2.103479, -0.4986206, 1, 1, 1, 1, 1,
1.131035, 0.1596504, 0.6866105, 1, 1, 1, 1, 1,
1.131812, -0.4128654, 0.5165049, 0, 0, 1, 1, 1,
1.141979, 1.167166, 0.5388456, 1, 0, 0, 1, 1,
1.144063, -0.02202938, 1.866382, 1, 0, 0, 1, 1,
1.144528, -0.01191449, 2.610432, 1, 0, 0, 1, 1,
1.149626, 0.1817923, 1.681029, 1, 0, 0, 1, 1,
1.153546, 1.685124, 1.293223, 1, 0, 0, 1, 1,
1.161586, 1.402505, 1.45144, 0, 0, 0, 1, 1,
1.16844, 0.5102238, 1.388353, 0, 0, 0, 1, 1,
1.173133, 1.424842, -0.3943558, 0, 0, 0, 1, 1,
1.175462, -0.1609463, 1.383072, 0, 0, 0, 1, 1,
1.186949, 0.4528492, 0.3913867, 0, 0, 0, 1, 1,
1.190228, -1.576542, 3.775436, 0, 0, 0, 1, 1,
1.198836, 0.4411484, 0.3620069, 0, 0, 0, 1, 1,
1.199569, 0.5532669, 2.096702, 1, 1, 1, 1, 1,
1.210198, 1.126349, 1.026308, 1, 1, 1, 1, 1,
1.212906, -1.288202, 2.524731, 1, 1, 1, 1, 1,
1.229158, -0.8954835, 4.015136, 1, 1, 1, 1, 1,
1.234624, 0.5108067, 3.474519, 1, 1, 1, 1, 1,
1.23732, 0.1530478, 1.842184, 1, 1, 1, 1, 1,
1.238463, 1.290501, 0.6305645, 1, 1, 1, 1, 1,
1.239169, -0.8343828, 2.868467, 1, 1, 1, 1, 1,
1.240538, 0.1301004, 2.731357, 1, 1, 1, 1, 1,
1.240775, 0.5221469, -0.5283612, 1, 1, 1, 1, 1,
1.251557, 0.7090623, 1.509147, 1, 1, 1, 1, 1,
1.263229, 0.372272, 1.45674, 1, 1, 1, 1, 1,
1.26696, 0.5133456, 1.180022, 1, 1, 1, 1, 1,
1.298413, 0.1654008, 0.7021224, 1, 1, 1, 1, 1,
1.317381, 0.7651837, 0.470394, 1, 1, 1, 1, 1,
1.340588, -0.06910104, 1.007983, 0, 0, 1, 1, 1,
1.342869, -0.4172173, 2.028254, 1, 0, 0, 1, 1,
1.349931, -0.2151128, 2.010674, 1, 0, 0, 1, 1,
1.384347, -1.129436, 2.727869, 1, 0, 0, 1, 1,
1.385526, 0.5549807, 0.333897, 1, 0, 0, 1, 1,
1.394339, -1.361692, 2.366151, 1, 0, 0, 1, 1,
1.407737, -0.6947782, 1.248352, 0, 0, 0, 1, 1,
1.409695, 1.912746, 0.6629741, 0, 0, 0, 1, 1,
1.411493, 0.5379198, 1.665235, 0, 0, 0, 1, 1,
1.429094, -0.5834939, 2.644345, 0, 0, 0, 1, 1,
1.432571, 1.196413, 0.09860281, 0, 0, 0, 1, 1,
1.437654, 0.853071, 1.334334, 0, 0, 0, 1, 1,
1.44409, 1.069496, 1.090309, 0, 0, 0, 1, 1,
1.450427, -1.488148, 2.334943, 1, 1, 1, 1, 1,
1.462174, -0.850134, 4.088633, 1, 1, 1, 1, 1,
1.477538, -0.09818701, 0.6798457, 1, 1, 1, 1, 1,
1.479509, -0.9193739, 0.6192345, 1, 1, 1, 1, 1,
1.493628, 0.5191095, 0.7840202, 1, 1, 1, 1, 1,
1.49946, -0.3436184, 2.752758, 1, 1, 1, 1, 1,
1.501584, 1.572409, -1.035448, 1, 1, 1, 1, 1,
1.511276, 0.02201175, 2.461315, 1, 1, 1, 1, 1,
1.539366, -1.230939, 2.301814, 1, 1, 1, 1, 1,
1.546982, 0.7351798, 1.142262, 1, 1, 1, 1, 1,
1.561832, -0.4200097, 1.670406, 1, 1, 1, 1, 1,
1.565077, -0.7110091, 1.846489, 1, 1, 1, 1, 1,
1.574973, -1.132355, 4.150271, 1, 1, 1, 1, 1,
1.585539, 0.1003152, 2.856676, 1, 1, 1, 1, 1,
1.610328, -1.194156, 1.923501, 1, 1, 1, 1, 1,
1.619623, -1.531683, 2.775758, 0, 0, 1, 1, 1,
1.637403, 0.6426801, 1.362931, 1, 0, 0, 1, 1,
1.640378, 0.4149794, 1.606436, 1, 0, 0, 1, 1,
1.640987, 1.629424, 1.012573, 1, 0, 0, 1, 1,
1.643116, 0.4079299, -0.3084478, 1, 0, 0, 1, 1,
1.648898, -2.010388, 2.688365, 1, 0, 0, 1, 1,
1.674747, 1.085479, 0.5076987, 0, 0, 0, 1, 1,
1.679541, -1.59743, 2.037115, 0, 0, 0, 1, 1,
1.699174, -0.479968, 1.389279, 0, 0, 0, 1, 1,
1.706658, 0.04165095, 0.9449249, 0, 0, 0, 1, 1,
1.729692, 0.1569771, 0.8545008, 0, 0, 0, 1, 1,
1.730695, 0.4492908, 2.079029, 0, 0, 0, 1, 1,
1.751081, 0.6280786, 1.336905, 0, 0, 0, 1, 1,
1.763436, -0.37585, 2.53425, 1, 1, 1, 1, 1,
1.803123, 0.8291401, 0.1299745, 1, 1, 1, 1, 1,
1.814458, -0.8025894, 0.4801073, 1, 1, 1, 1, 1,
1.842292, 0.4744537, 1.301592, 1, 1, 1, 1, 1,
1.847625, 0.5096341, 1.100569, 1, 1, 1, 1, 1,
1.849255, -0.7208043, 2.78603, 1, 1, 1, 1, 1,
1.854334, -2.185124, 2.776166, 1, 1, 1, 1, 1,
1.86155, -0.5390487, 1.213651, 1, 1, 1, 1, 1,
1.864257, -0.09985348, 3.253271, 1, 1, 1, 1, 1,
1.875938, -1.069633, 3.237668, 1, 1, 1, 1, 1,
1.890573, 1.884889, 1.403899, 1, 1, 1, 1, 1,
1.896383, 1.455682, 0.1270073, 1, 1, 1, 1, 1,
1.901024, 1.159982, 3.132403, 1, 1, 1, 1, 1,
1.907597, -0.7013966, 4.146356, 1, 1, 1, 1, 1,
1.930417, 0.6283523, 1.428093, 1, 1, 1, 1, 1,
1.967677, -1.456124, 1.737148, 0, 0, 1, 1, 1,
1.967771, 0.7082756, 2.14011, 1, 0, 0, 1, 1,
1.98792, 0.01354062, 1.331724, 1, 0, 0, 1, 1,
2.025292, 1.170617, 2.062345, 1, 0, 0, 1, 1,
2.048459, 0.5436707, 1.362005, 1, 0, 0, 1, 1,
2.070646, -0.1380016, 2.636947, 1, 0, 0, 1, 1,
2.08932, -1.679423, 2.607049, 0, 0, 0, 1, 1,
2.110918, 1.03685, -0.1344937, 0, 0, 0, 1, 1,
2.135626, -1.111539, 2.154632, 0, 0, 0, 1, 1,
2.180048, -0.2990997, 1.002186, 0, 0, 0, 1, 1,
2.180247, 0.145339, 1.13066, 0, 0, 0, 1, 1,
2.182612, 0.6145305, 0.1766476, 0, 0, 0, 1, 1,
2.190479, 0.8004407, 0.4044021, 0, 0, 0, 1, 1,
2.223819, 0.5765462, -0.2514037, 1, 1, 1, 1, 1,
2.251105, -0.9371595, 3.701733, 1, 1, 1, 1, 1,
2.271189, -0.9563333, 3.731782, 1, 1, 1, 1, 1,
2.309632, -0.3273602, 1.01798, 1, 1, 1, 1, 1,
2.534296, -0.3791023, 1.792366, 1, 1, 1, 1, 1,
2.587442, 0.3104299, -0.0909316, 1, 1, 1, 1, 1,
2.930093, -0.1737639, 1.724079, 1, 1, 1, 1, 1
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
var radius = 9.433732;
var distance = 33.13559;
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
mvMatrix.translate( 0.286746, -0.3020947, -0.2770703 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.13559);
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
