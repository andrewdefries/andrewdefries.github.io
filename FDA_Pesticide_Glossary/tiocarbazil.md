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
-3.107927, -1.796789, -1.191267, 1, 0, 0, 1,
-3.018049, -0.09254716, -3.197383, 1, 0.007843138, 0, 1,
-3.001971, -0.3842568, -3.615251, 1, 0.01176471, 0, 1,
-2.782993, 0.5367245, -3.005884, 1, 0.01960784, 0, 1,
-2.728724, -0.2203563, -1.808481, 1, 0.02352941, 0, 1,
-2.619999, -1.459416, -0.08574404, 1, 0.03137255, 0, 1,
-2.551331, -1.628718, -2.401878, 1, 0.03529412, 0, 1,
-2.41751, -0.06863495, -0.2340886, 1, 0.04313726, 0, 1,
-2.340822, 0.1207951, -1.629222, 1, 0.04705882, 0, 1,
-2.287403, -0.4152542, -1.652292, 1, 0.05490196, 0, 1,
-2.279346, 0.1415296, -3.150064, 1, 0.05882353, 0, 1,
-2.274909, 1.125588, -1.224101, 1, 0.06666667, 0, 1,
-2.265203, -0.2992669, -0.5985229, 1, 0.07058824, 0, 1,
-2.253903, -0.7625777, -2.258177, 1, 0.07843138, 0, 1,
-2.161878, -0.3564497, -1.213354, 1, 0.08235294, 0, 1,
-2.152755, -0.8978165, -0.639895, 1, 0.09019608, 0, 1,
-2.150023, 0.4256284, -2.153461, 1, 0.09411765, 0, 1,
-2.138603, 1.426003, -1.419895, 1, 0.1019608, 0, 1,
-2.137691, 1.267058, -1.46806, 1, 0.1098039, 0, 1,
-2.116616, 1.600664, 0.8776019, 1, 0.1137255, 0, 1,
-2.114832, 0.1056058, -1.232839, 1, 0.1215686, 0, 1,
-2.111864, -0.7231491, -1.595789, 1, 0.1254902, 0, 1,
-2.078062, -0.7359232, -1.585384, 1, 0.1333333, 0, 1,
-2.070694, -1.314937, -2.539009, 1, 0.1372549, 0, 1,
-2.022626, 0.1788188, -1.338676, 1, 0.145098, 0, 1,
-1.998005, -1.017134, -2.432146, 1, 0.1490196, 0, 1,
-1.989012, -1.698021, -1.432384, 1, 0.1568628, 0, 1,
-1.985084, 1.92618, -1.075484, 1, 0.1607843, 0, 1,
-1.984428, 0.7804067, -1.321552, 1, 0.1686275, 0, 1,
-1.98202, -0.1376115, -2.732087, 1, 0.172549, 0, 1,
-1.936318, 0.9115466, -1.235634, 1, 0.1803922, 0, 1,
-1.934666, 0.002148602, -2.100918, 1, 0.1843137, 0, 1,
-1.932009, 2.252129, -1.538964, 1, 0.1921569, 0, 1,
-1.931362, 1.092391, -2.512664, 1, 0.1960784, 0, 1,
-1.911792, 0.8564054, -1.576548, 1, 0.2039216, 0, 1,
-1.908132, -0.05500966, -2.819354, 1, 0.2117647, 0, 1,
-1.895009, 0.5560855, -1.166282, 1, 0.2156863, 0, 1,
-1.89019, -0.169987, -2.027954, 1, 0.2235294, 0, 1,
-1.866724, -1.412071, -1.448269, 1, 0.227451, 0, 1,
-1.864888, 1.190241, -1.818526, 1, 0.2352941, 0, 1,
-1.850877, 1.530281, -1.356238, 1, 0.2392157, 0, 1,
-1.840168, 0.6520662, 0.1365954, 1, 0.2470588, 0, 1,
-1.827833, -1.083477, -2.815366, 1, 0.2509804, 0, 1,
-1.820931, -2.175623, -3.863919, 1, 0.2588235, 0, 1,
-1.801424, 0.002854195, -1.397622, 1, 0.2627451, 0, 1,
-1.800777, 0.2144902, -0.8096736, 1, 0.2705882, 0, 1,
-1.785712, -0.9773155, -0.3565786, 1, 0.2745098, 0, 1,
-1.768457, 2.131433, -0.2833232, 1, 0.282353, 0, 1,
-1.726201, 0.4959134, -1.408047, 1, 0.2862745, 0, 1,
-1.721329, -0.2300931, -0.93279, 1, 0.2941177, 0, 1,
-1.719486, -0.4416077, -2.423032, 1, 0.3019608, 0, 1,
-1.717597, 0.1709397, 1.310188, 1, 0.3058824, 0, 1,
-1.711253, 0.3216982, -0.1374283, 1, 0.3137255, 0, 1,
-1.707392, 3.262152, -0.9988116, 1, 0.3176471, 0, 1,
-1.700834, -0.846911, -1.178009, 1, 0.3254902, 0, 1,
-1.693437, -1.266703, -2.884612, 1, 0.3294118, 0, 1,
-1.685374, 2.122948, 1.035474, 1, 0.3372549, 0, 1,
-1.678116, 0.5892146, -0.9131832, 1, 0.3411765, 0, 1,
-1.678037, 0.01102838, -0.5258666, 1, 0.3490196, 0, 1,
-1.654697, -1.019722, -0.9200492, 1, 0.3529412, 0, 1,
-1.645702, 1.437247, -1.648554, 1, 0.3607843, 0, 1,
-1.643965, 1.347799, -2.162948, 1, 0.3647059, 0, 1,
-1.640915, -1.236646, -2.770853, 1, 0.372549, 0, 1,
-1.631985, -0.900928, -3.488021, 1, 0.3764706, 0, 1,
-1.618246, -0.786741, -1.508002, 1, 0.3843137, 0, 1,
-1.603598, -1.66398, -2.388994, 1, 0.3882353, 0, 1,
-1.598187, 0.1164265, 0.7746285, 1, 0.3960784, 0, 1,
-1.578542, -0.1010082, -2.761634, 1, 0.4039216, 0, 1,
-1.576716, -3.818643, -3.581013, 1, 0.4078431, 0, 1,
-1.575152, 0.4250196, -2.434877, 1, 0.4156863, 0, 1,
-1.55862, 1.547916, -2.265319, 1, 0.4196078, 0, 1,
-1.551955, 0.414896, -0.8258898, 1, 0.427451, 0, 1,
-1.547471, 0.494826, -2.082442, 1, 0.4313726, 0, 1,
-1.544045, 1.854259, 0.3460842, 1, 0.4392157, 0, 1,
-1.531089, -1.438186, -4.387348, 1, 0.4431373, 0, 1,
-1.524109, -0.8541617, -2.513781, 1, 0.4509804, 0, 1,
-1.521761, 0.1032862, -1.948583, 1, 0.454902, 0, 1,
-1.511011, 1.559667, -0.4352752, 1, 0.4627451, 0, 1,
-1.499462, -0.7388246, -1.489147, 1, 0.4666667, 0, 1,
-1.498845, 0.2198368, -1.434968, 1, 0.4745098, 0, 1,
-1.498771, 1.239803, 0.9113248, 1, 0.4784314, 0, 1,
-1.491335, 0.8398276, -0.6791548, 1, 0.4862745, 0, 1,
-1.486557, -0.6462133, -1.129699, 1, 0.4901961, 0, 1,
-1.471907, -1.719685, -2.501478, 1, 0.4980392, 0, 1,
-1.471056, -1.404922, -1.718119, 1, 0.5058824, 0, 1,
-1.467946, 0.09156685, -0.6940601, 1, 0.509804, 0, 1,
-1.458107, -1.008039, 0.4567803, 1, 0.5176471, 0, 1,
-1.457493, 2.411559, -0.3761193, 1, 0.5215687, 0, 1,
-1.449689, 1.439126, -1.494608, 1, 0.5294118, 0, 1,
-1.449655, 2.098864, -0.7835657, 1, 0.5333334, 0, 1,
-1.449187, -0.08425337, -1.971002, 1, 0.5411765, 0, 1,
-1.444073, 0.4448536, -3.196512, 1, 0.5450981, 0, 1,
-1.443438, 0.736751, -0.8289368, 1, 0.5529412, 0, 1,
-1.439775, -1.943028, -1.688475, 1, 0.5568628, 0, 1,
-1.436935, -0.3224202, -1.477688, 1, 0.5647059, 0, 1,
-1.416352, -1.121577, -1.482773, 1, 0.5686275, 0, 1,
-1.414419, -0.07600085, -1.191458, 1, 0.5764706, 0, 1,
-1.410101, 0.2523024, -3.383983, 1, 0.5803922, 0, 1,
-1.40461, 2.50767, -0.8910291, 1, 0.5882353, 0, 1,
-1.401265, 0.09458807, -0.3100835, 1, 0.5921569, 0, 1,
-1.397629, 0.6556039, -2.321501, 1, 0.6, 0, 1,
-1.391515, 0.6039332, -0.2191281, 1, 0.6078432, 0, 1,
-1.39082, 0.2178773, -1.639112, 1, 0.6117647, 0, 1,
-1.385851, -0.2589503, -1.302547, 1, 0.6196079, 0, 1,
-1.37404, -1.373121, -1.533746, 1, 0.6235294, 0, 1,
-1.373503, 0.208193, -2.403383, 1, 0.6313726, 0, 1,
-1.358473, 0.5482681, -1.281599, 1, 0.6352941, 0, 1,
-1.353163, -0.7388467, -0.9958732, 1, 0.6431373, 0, 1,
-1.350958, -0.5167553, -1.054446, 1, 0.6470588, 0, 1,
-1.346663, -0.4717462, -1.113496, 1, 0.654902, 0, 1,
-1.340567, 0.1973357, -1.882632, 1, 0.6588235, 0, 1,
-1.338388, -0.9548898, -2.794217, 1, 0.6666667, 0, 1,
-1.336555, 0.04690945, -1.497324, 1, 0.6705883, 0, 1,
-1.336218, 1.51016, -0.6886606, 1, 0.6784314, 0, 1,
-1.311189, 0.5385903, -1.43774, 1, 0.682353, 0, 1,
-1.308426, -0.7575538, -3.194225, 1, 0.6901961, 0, 1,
-1.301972, -0.7045266, -2.699098, 1, 0.6941177, 0, 1,
-1.299896, -0.4042664, -0.8263456, 1, 0.7019608, 0, 1,
-1.299629, -0.9396689, -1.659714, 1, 0.7098039, 0, 1,
-1.293942, 0.2035727, -2.640905, 1, 0.7137255, 0, 1,
-1.290587, 0.7477636, 0.1098209, 1, 0.7215686, 0, 1,
-1.285429, 0.6666987, -1.362255, 1, 0.7254902, 0, 1,
-1.269503, -0.9212225, -2.185254, 1, 0.7333333, 0, 1,
-1.267191, -0.1258142, -2.499311, 1, 0.7372549, 0, 1,
-1.253179, 0.5904561, -1.799898, 1, 0.7450981, 0, 1,
-1.252671, -0.981663, -1.425286, 1, 0.7490196, 0, 1,
-1.244788, 1.714015, -1.876523, 1, 0.7568628, 0, 1,
-1.244119, 0.7896777, -0.1601188, 1, 0.7607843, 0, 1,
-1.235633, -0.6663821, -2.847479, 1, 0.7686275, 0, 1,
-1.234586, -0.1749639, -2.257898, 1, 0.772549, 0, 1,
-1.233654, 0.9708715, -0.9091909, 1, 0.7803922, 0, 1,
-1.22346, -0.6378206, -1.015667, 1, 0.7843137, 0, 1,
-1.222088, 1.032592, -1.12693, 1, 0.7921569, 0, 1,
-1.219498, 0.4638506, -2.362842, 1, 0.7960784, 0, 1,
-1.217384, 0.1819414, -1.64884, 1, 0.8039216, 0, 1,
-1.217044, -0.1090697, -2.858103, 1, 0.8117647, 0, 1,
-1.214056, -0.9309717, -3.609091, 1, 0.8156863, 0, 1,
-1.213909, 1.414158, -0.4168094, 1, 0.8235294, 0, 1,
-1.199594, -0.8472655, -3.750975, 1, 0.827451, 0, 1,
-1.192476, 0.5291713, -0.476054, 1, 0.8352941, 0, 1,
-1.180098, -1.727569, -0.2955624, 1, 0.8392157, 0, 1,
-1.174554, -0.6224069, -2.415447, 1, 0.8470588, 0, 1,
-1.166579, 1.558763, -0.4754992, 1, 0.8509804, 0, 1,
-1.164251, 0.5671693, -2.644552, 1, 0.8588235, 0, 1,
-1.15915, -1.835401, -3.385802, 1, 0.8627451, 0, 1,
-1.14872, 0.8335053, -0.6466665, 1, 0.8705882, 0, 1,
-1.135256, -2.370774, -4.653124, 1, 0.8745098, 0, 1,
-1.130759, -0.1370654, -0.6885409, 1, 0.8823529, 0, 1,
-1.129951, 0.6628679, 0.01558531, 1, 0.8862745, 0, 1,
-1.129069, 1.613911, -0.7975905, 1, 0.8941177, 0, 1,
-1.124745, 1.091516, -2.35365, 1, 0.8980392, 0, 1,
-1.123281, 0.5134709, -2.183675, 1, 0.9058824, 0, 1,
-1.105749, -0.8211572, -1.562975, 1, 0.9137255, 0, 1,
-1.102202, 0.4054384, -0.3723206, 1, 0.9176471, 0, 1,
-1.100509, 0.526525, -2.621546, 1, 0.9254902, 0, 1,
-1.100416, -0.9972882, -1.380353, 1, 0.9294118, 0, 1,
-1.100341, 0.4606124, 0.6727706, 1, 0.9372549, 0, 1,
-1.09899, -0.9174266, -0.7287427, 1, 0.9411765, 0, 1,
-1.093282, 0.3521845, -0.4750955, 1, 0.9490196, 0, 1,
-1.091069, -1.93462, -4.067009, 1, 0.9529412, 0, 1,
-1.081864, -0.9101795, -2.062313, 1, 0.9607843, 0, 1,
-1.08175, -1.435469, -3.159343, 1, 0.9647059, 0, 1,
-1.079008, -1.551786, -0.7852331, 1, 0.972549, 0, 1,
-1.075704, 0.4671342, -1.795785, 1, 0.9764706, 0, 1,
-1.069217, 0.0428998, -1.221851, 1, 0.9843137, 0, 1,
-1.064397, 0.7243772, -0.7428443, 1, 0.9882353, 0, 1,
-1.040887, 2.093354, -0.6698914, 1, 0.9960784, 0, 1,
-1.03128, -0.4844802, -2.452673, 0.9960784, 1, 0, 1,
-1.015021, 0.6743042, -1.983454, 0.9921569, 1, 0, 1,
-1.013498, 0.1033003, 1.956399, 0.9843137, 1, 0, 1,
-1.013084, -1.643122, -1.373044, 0.9803922, 1, 0, 1,
-1.012819, 1.363875, 0.01176265, 0.972549, 1, 0, 1,
-1.012543, -0.04569569, -2.288059, 0.9686275, 1, 0, 1,
-1.012027, -1.065677, -2.785556, 0.9607843, 1, 0, 1,
-1.009294, 0.5165688, -1.297929, 0.9568627, 1, 0, 1,
-1.006067, 0.5290588, -0.7296329, 0.9490196, 1, 0, 1,
-1.000969, 0.6791988, -1.107968, 0.945098, 1, 0, 1,
-1.000033, -1.452837, -2.166267, 0.9372549, 1, 0, 1,
-0.9975342, -0.0396729, -2.263419, 0.9333333, 1, 0, 1,
-0.9929253, -1.96695, -2.379959, 0.9254902, 1, 0, 1,
-0.9900547, 0.4157157, -0.9308469, 0.9215686, 1, 0, 1,
-0.9887798, 0.4923435, -1.42144, 0.9137255, 1, 0, 1,
-0.9861832, -0.1490651, -1.281309, 0.9098039, 1, 0, 1,
-0.9855328, 1.292306, -0.4995089, 0.9019608, 1, 0, 1,
-0.9829439, -0.6055226, -1.559481, 0.8941177, 1, 0, 1,
-0.9822488, 0.9113322, -2.656694, 0.8901961, 1, 0, 1,
-0.9712967, -0.1295273, -3.138583, 0.8823529, 1, 0, 1,
-0.9662029, 0.7916126, -1.017696, 0.8784314, 1, 0, 1,
-0.9651483, -0.6441856, -1.778708, 0.8705882, 1, 0, 1,
-0.9573133, -1.097427, -1.481332, 0.8666667, 1, 0, 1,
-0.9528725, 0.4358026, -1.020739, 0.8588235, 1, 0, 1,
-0.9442484, 1.164373, 0.6388081, 0.854902, 1, 0, 1,
-0.9420986, 1.294679, 0.250091, 0.8470588, 1, 0, 1,
-0.942061, -1.100126, -3.057723, 0.8431373, 1, 0, 1,
-0.9405363, -1.479066, -0.6259419, 0.8352941, 1, 0, 1,
-0.938437, 0.312388, -1.42593, 0.8313726, 1, 0, 1,
-0.938282, -0.8409319, -1.159852, 0.8235294, 1, 0, 1,
-0.9358814, -1.582325, -1.741626, 0.8196079, 1, 0, 1,
-0.9337256, -0.04421925, -0.965679, 0.8117647, 1, 0, 1,
-0.9296801, -0.003943033, -1.171031, 0.8078431, 1, 0, 1,
-0.9259655, 1.054453, -0.471026, 0.8, 1, 0, 1,
-0.9240737, 0.9629472, -0.6857034, 0.7921569, 1, 0, 1,
-0.9212213, 0.7428938, -1.356707, 0.7882353, 1, 0, 1,
-0.9204197, -1.749502, -3.978288, 0.7803922, 1, 0, 1,
-0.9101078, -0.2733123, -2.055964, 0.7764706, 1, 0, 1,
-0.9098474, 1.892826, 0.6233799, 0.7686275, 1, 0, 1,
-0.906902, -0.06788077, -1.151506, 0.7647059, 1, 0, 1,
-0.9031792, 1.558168, -2.202219, 0.7568628, 1, 0, 1,
-0.9028986, -0.8656378, -1.008132, 0.7529412, 1, 0, 1,
-0.9012211, 0.2130932, -1.503105, 0.7450981, 1, 0, 1,
-0.8996869, 1.228113, 1.031427, 0.7411765, 1, 0, 1,
-0.8901355, -0.2725251, -3.361009, 0.7333333, 1, 0, 1,
-0.8869945, -0.7124127, -2.650309, 0.7294118, 1, 0, 1,
-0.8816912, 0.5057646, -0.9749146, 0.7215686, 1, 0, 1,
-0.8682829, 1.352914, -0.2944996, 0.7176471, 1, 0, 1,
-0.8658572, -0.1145589, -1.780294, 0.7098039, 1, 0, 1,
-0.8638422, -0.02847616, -3.172652, 0.7058824, 1, 0, 1,
-0.8515697, -0.2003481, -3.400513, 0.6980392, 1, 0, 1,
-0.8475713, 0.7060871, -2.153065, 0.6901961, 1, 0, 1,
-0.8473287, 0.01281718, -1.208109, 0.6862745, 1, 0, 1,
-0.8431031, 0.650452, 0.5448238, 0.6784314, 1, 0, 1,
-0.8399496, -1.703621, -4.02977, 0.6745098, 1, 0, 1,
-0.837646, 0.5542744, -0.1949352, 0.6666667, 1, 0, 1,
-0.8356329, 1.22958, -1.037669, 0.6627451, 1, 0, 1,
-0.8339136, 1.147304, -0.8843892, 0.654902, 1, 0, 1,
-0.8242428, -0.4009603, -1.46543, 0.6509804, 1, 0, 1,
-0.8215663, 2.062791, -0.01841489, 0.6431373, 1, 0, 1,
-0.8215231, -1.354973, -2.478372, 0.6392157, 1, 0, 1,
-0.8175091, -0.4170456, -2.611967, 0.6313726, 1, 0, 1,
-0.8166598, -1.526097, -1.356589, 0.627451, 1, 0, 1,
-0.8155243, -0.7351136, -3.092042, 0.6196079, 1, 0, 1,
-0.8148752, -1.762363, -1.521328, 0.6156863, 1, 0, 1,
-0.8114963, 2.150054, -0.1152357, 0.6078432, 1, 0, 1,
-0.8068215, -0.3510298, -2.042634, 0.6039216, 1, 0, 1,
-0.8049732, -0.9146411, -2.70509, 0.5960785, 1, 0, 1,
-0.7978398, -0.7040535, -0.8551761, 0.5882353, 1, 0, 1,
-0.7975196, -2.115817, -2.506322, 0.5843138, 1, 0, 1,
-0.7970401, 0.3459265, -1.418983, 0.5764706, 1, 0, 1,
-0.7925975, 0.1902046, -1.585628, 0.572549, 1, 0, 1,
-0.7910435, -1.284392, -3.222244, 0.5647059, 1, 0, 1,
-0.7899199, -0.01256464, -0.9807552, 0.5607843, 1, 0, 1,
-0.7882347, -0.3315373, -3.029065, 0.5529412, 1, 0, 1,
-0.7870105, -0.5395527, -3.120042, 0.5490196, 1, 0, 1,
-0.7853096, -0.06166154, -2.557631, 0.5411765, 1, 0, 1,
-0.7839182, 0.6439152, -1.15468, 0.5372549, 1, 0, 1,
-0.7837732, -0.4307955, -1.877175, 0.5294118, 1, 0, 1,
-0.7813202, 0.8036742, -2.704068, 0.5254902, 1, 0, 1,
-0.7795198, -0.2222438, -1.074002, 0.5176471, 1, 0, 1,
-0.7738599, -0.0899184, -1.697645, 0.5137255, 1, 0, 1,
-0.7691912, 0.2175558, -1.350376, 0.5058824, 1, 0, 1,
-0.7689472, -1.358612, -5.449839, 0.5019608, 1, 0, 1,
-0.7616318, 0.3052288, -1.188487, 0.4941176, 1, 0, 1,
-0.7551526, 0.4288099, -0.7007979, 0.4862745, 1, 0, 1,
-0.7506527, 0.7699347, 0.705691, 0.4823529, 1, 0, 1,
-0.7500074, -0.1833945, -2.240217, 0.4745098, 1, 0, 1,
-0.7473932, -0.8200462, -4.211887, 0.4705882, 1, 0, 1,
-0.7456063, -0.8131412, -3.238145, 0.4627451, 1, 0, 1,
-0.7410023, -2.557741, -2.620667, 0.4588235, 1, 0, 1,
-0.7354891, -0.3728183, -1.503715, 0.4509804, 1, 0, 1,
-0.7328994, 0.6173629, -1.700215, 0.4470588, 1, 0, 1,
-0.7298555, 0.09280342, -1.564353, 0.4392157, 1, 0, 1,
-0.727051, 0.6584939, -0.1589509, 0.4352941, 1, 0, 1,
-0.7187819, 1.066179, -0.960666, 0.427451, 1, 0, 1,
-0.7169442, -0.2458582, -2.218953, 0.4235294, 1, 0, 1,
-0.7166295, -0.2276008, -1.269027, 0.4156863, 1, 0, 1,
-0.7162284, 0.2244356, -2.177808, 0.4117647, 1, 0, 1,
-0.7159612, 0.2886462, -1.930492, 0.4039216, 1, 0, 1,
-0.7152452, 0.1601679, -1.421826, 0.3960784, 1, 0, 1,
-0.7139925, 0.52578, -2.334885, 0.3921569, 1, 0, 1,
-0.709911, 1.40819, -1.23027, 0.3843137, 1, 0, 1,
-0.7086816, 0.6559334, 0.4615936, 0.3803922, 1, 0, 1,
-0.6973537, 1.121831, -2.872904, 0.372549, 1, 0, 1,
-0.6952937, -0.268281, -2.226792, 0.3686275, 1, 0, 1,
-0.6901946, -1.155167, -3.765643, 0.3607843, 1, 0, 1,
-0.6896999, 0.6149898, -0.8235897, 0.3568628, 1, 0, 1,
-0.6831794, -0.4256905, -3.423696, 0.3490196, 1, 0, 1,
-0.6726149, -1.136017, -2.909224, 0.345098, 1, 0, 1,
-0.6723192, 0.03340679, -1.580408, 0.3372549, 1, 0, 1,
-0.6680165, 0.3996883, -0.2034454, 0.3333333, 1, 0, 1,
-0.6655974, -0.002003056, -1.127449, 0.3254902, 1, 0, 1,
-0.6589037, 1.065228, -0.5478784, 0.3215686, 1, 0, 1,
-0.6585853, 0.698777, 0.1455045, 0.3137255, 1, 0, 1,
-0.656813, -1.946018, -1.996896, 0.3098039, 1, 0, 1,
-0.6462159, 0.963279, -0.5318771, 0.3019608, 1, 0, 1,
-0.6418828, -0.06373122, -3.428838, 0.2941177, 1, 0, 1,
-0.6371272, -1.381577, -4.471359, 0.2901961, 1, 0, 1,
-0.6364961, 1.209363, -0.9055405, 0.282353, 1, 0, 1,
-0.6340359, 0.2563042, 0.6332106, 0.2784314, 1, 0, 1,
-0.6334354, -0.2651716, -2.079481, 0.2705882, 1, 0, 1,
-0.6326764, -0.6712837, -2.720748, 0.2666667, 1, 0, 1,
-0.6283723, -2.087448, -3.728665, 0.2588235, 1, 0, 1,
-0.6281996, 0.2766441, -0.9086211, 0.254902, 1, 0, 1,
-0.613092, -0.5920646, -4.722073, 0.2470588, 1, 0, 1,
-0.6123912, -0.859486, -3.353477, 0.2431373, 1, 0, 1,
-0.6102134, -0.1824108, -2.152074, 0.2352941, 1, 0, 1,
-0.6096656, 0.9288809, -2.218853, 0.2313726, 1, 0, 1,
-0.607493, 0.238317, 0.5212977, 0.2235294, 1, 0, 1,
-0.6040657, 0.3205543, -0.1358626, 0.2196078, 1, 0, 1,
-0.6037763, 0.8834113, 0.4980021, 0.2117647, 1, 0, 1,
-0.6034949, 1.074893, 0.3710771, 0.2078431, 1, 0, 1,
-0.6031876, 1.081149, -1.459153, 0.2, 1, 0, 1,
-0.6002327, 1.103634, 1.178386, 0.1921569, 1, 0, 1,
-0.5994604, -0.4961325, -1.943327, 0.1882353, 1, 0, 1,
-0.5980904, -0.0315614, -3.388683, 0.1803922, 1, 0, 1,
-0.5901556, 2.143336, -0.03223544, 0.1764706, 1, 0, 1,
-0.5859166, -1.715439, -3.050492, 0.1686275, 1, 0, 1,
-0.5853747, 0.06069809, -2.127376, 0.1647059, 1, 0, 1,
-0.5823742, 0.2437658, -0.9826093, 0.1568628, 1, 0, 1,
-0.5823097, -0.4130741, -3.315628, 0.1529412, 1, 0, 1,
-0.5817447, -0.104277, -0.4517862, 0.145098, 1, 0, 1,
-0.5809135, 0.9832807, -2.798812, 0.1411765, 1, 0, 1,
-0.5795914, -0.6784355, -2.088584, 0.1333333, 1, 0, 1,
-0.5793365, 1.589784, 1.293957, 0.1294118, 1, 0, 1,
-0.5773599, -1.389376, -1.423221, 0.1215686, 1, 0, 1,
-0.5764053, 0.4391874, -0.1984732, 0.1176471, 1, 0, 1,
-0.574051, 2.080081, 0.2519358, 0.1098039, 1, 0, 1,
-0.5710081, 0.1084868, -1.675449, 0.1058824, 1, 0, 1,
-0.5709042, 1.218469, -0.01742133, 0.09803922, 1, 0, 1,
-0.5668329, -0.2670718, -1.536408, 0.09019608, 1, 0, 1,
-0.5634111, 0.3973119, -0.1491655, 0.08627451, 1, 0, 1,
-0.561813, -1.879688, -2.720937, 0.07843138, 1, 0, 1,
-0.5585856, 0.5505068, 0.04622056, 0.07450981, 1, 0, 1,
-0.5521256, 2.524427, 0.8149369, 0.06666667, 1, 0, 1,
-0.5510116, 1.04674, 0.8270037, 0.0627451, 1, 0, 1,
-0.5509369, -0.3227124, -0.5238835, 0.05490196, 1, 0, 1,
-0.5508446, 0.9040825, -0.8057963, 0.05098039, 1, 0, 1,
-0.548915, 0.4581555, -0.509306, 0.04313726, 1, 0, 1,
-0.5431498, 0.07866212, -1.431872, 0.03921569, 1, 0, 1,
-0.5391741, -1.078678, -0.9915004, 0.03137255, 1, 0, 1,
-0.5385267, 1.444548, -0.1369847, 0.02745098, 1, 0, 1,
-0.5343578, -0.4176801, -4.410169, 0.01960784, 1, 0, 1,
-0.531456, 1.976238, 0.3440936, 0.01568628, 1, 0, 1,
-0.5311976, -0.3752162, -1.081694, 0.007843138, 1, 0, 1,
-0.5296291, -1.567724, -2.825947, 0.003921569, 1, 0, 1,
-0.5272341, -1.147825, -2.619923, 0, 1, 0.003921569, 1,
-0.5271501, -0.5448595, -2.282259, 0, 1, 0.01176471, 1,
-0.5258675, 0.3121452, -2.08114, 0, 1, 0.01568628, 1,
-0.5226225, -0.3823698, -2.181298, 0, 1, 0.02352941, 1,
-0.5151665, 0.909963, -0.3336883, 0, 1, 0.02745098, 1,
-0.5142828, -0.3498009, -1.987529, 0, 1, 0.03529412, 1,
-0.5073208, 1.037667, -0.826624, 0, 1, 0.03921569, 1,
-0.5053679, -1.367223, -3.646455, 0, 1, 0.04705882, 1,
-0.5042, -0.04379101, -0.2512222, 0, 1, 0.05098039, 1,
-0.4927548, 1.107301, 1.217548, 0, 1, 0.05882353, 1,
-0.4912194, 0.9412038, -0.1073813, 0, 1, 0.0627451, 1,
-0.489924, -0.9317145, -2.189191, 0, 1, 0.07058824, 1,
-0.4887167, -0.3363056, -3.082325, 0, 1, 0.07450981, 1,
-0.484722, 0.7900338, -0.7178361, 0, 1, 0.08235294, 1,
-0.4820368, -0.5679439, -2.740644, 0, 1, 0.08627451, 1,
-0.4809318, -1.655615, -1.804063, 0, 1, 0.09411765, 1,
-0.4797354, 0.7186111, -0.8432507, 0, 1, 0.1019608, 1,
-0.4796903, -0.225506, -2.645289, 0, 1, 0.1058824, 1,
-0.4765813, -0.1000182, -1.595224, 0, 1, 0.1137255, 1,
-0.4759425, -0.1292351, -2.763191, 0, 1, 0.1176471, 1,
-0.4750376, 0.2075393, -1.918971, 0, 1, 0.1254902, 1,
-0.4695996, 1.378282, -1.413039, 0, 1, 0.1294118, 1,
-0.4686027, 0.2962075, 1.063514, 0, 1, 0.1372549, 1,
-0.468174, 0.212467, -1.853639, 0, 1, 0.1411765, 1,
-0.4669396, -3.227546, -1.83508, 0, 1, 0.1490196, 1,
-0.4565609, 1.17484, -0.09993263, 0, 1, 0.1529412, 1,
-0.4520513, -0.7148463, -2.689772, 0, 1, 0.1607843, 1,
-0.450486, 1.422433, -0.1713272, 0, 1, 0.1647059, 1,
-0.4497516, -1.061906, -4.062819, 0, 1, 0.172549, 1,
-0.4485645, -0.2673155, -1.942091, 0, 1, 0.1764706, 1,
-0.446344, -2.125669, -2.740989, 0, 1, 0.1843137, 1,
-0.4417244, -0.3579764, -2.563899, 0, 1, 0.1882353, 1,
-0.4390421, -0.2397797, -0.6891362, 0, 1, 0.1960784, 1,
-0.4334437, 0.9875604, 0.04532958, 0, 1, 0.2039216, 1,
-0.4325286, 1.213148, 0.03866309, 0, 1, 0.2078431, 1,
-0.4306875, -0.1927451, -2.34515, 0, 1, 0.2156863, 1,
-0.4305414, 0.5086994, -1.207536, 0, 1, 0.2196078, 1,
-0.4251893, -0.2376389, 0.07083178, 0, 1, 0.227451, 1,
-0.4212177, -0.625949, -2.013945, 0, 1, 0.2313726, 1,
-0.4179873, 0.4760118, -1.376332, 0, 1, 0.2392157, 1,
-0.41375, 0.3496088, -0.1979546, 0, 1, 0.2431373, 1,
-0.4115958, -1.525931, -4.23706, 0, 1, 0.2509804, 1,
-0.4103692, 0.6509095, -0.8274441, 0, 1, 0.254902, 1,
-0.4073096, -0.3779226, -1.234647, 0, 1, 0.2627451, 1,
-0.4058158, -0.2323269, -2.126552, 0, 1, 0.2666667, 1,
-0.4039593, 0.3154928, -1.692549, 0, 1, 0.2745098, 1,
-0.4003926, -0.9107173, -2.270329, 0, 1, 0.2784314, 1,
-0.3982692, -1.362867, -0.8973294, 0, 1, 0.2862745, 1,
-0.3950422, 0.1070043, -1.252148, 0, 1, 0.2901961, 1,
-0.3906747, 0.8131186, -0.4501441, 0, 1, 0.2980392, 1,
-0.3839073, -0.6442251, -1.815337, 0, 1, 0.3058824, 1,
-0.3813963, 1.348206, 0.9275094, 0, 1, 0.3098039, 1,
-0.3742487, -0.8948326, -3.147906, 0, 1, 0.3176471, 1,
-0.3731641, 0.1139018, -0.7402248, 0, 1, 0.3215686, 1,
-0.3718118, -0.9005772, -2.206404, 0, 1, 0.3294118, 1,
-0.3674968, -0.8114291, -2.870287, 0, 1, 0.3333333, 1,
-0.3661337, 2.965932, -0.6639518, 0, 1, 0.3411765, 1,
-0.3660627, 1.079799, -0.5979192, 0, 1, 0.345098, 1,
-0.3556851, -1.188649, -4.489506, 0, 1, 0.3529412, 1,
-0.3511237, 1.482831, -0.5240094, 0, 1, 0.3568628, 1,
-0.3463449, -0.2803401, -3.432278, 0, 1, 0.3647059, 1,
-0.3403166, -0.4948668, -3.318881, 0, 1, 0.3686275, 1,
-0.3364096, 1.073878, -1.21344, 0, 1, 0.3764706, 1,
-0.3353211, -0.5267941, -4.207488, 0, 1, 0.3803922, 1,
-0.3339002, -0.006031723, -1.603968, 0, 1, 0.3882353, 1,
-0.3331377, -0.6445132, -0.5681474, 0, 1, 0.3921569, 1,
-0.3329497, 1.616583, 0.1458592, 0, 1, 0.4, 1,
-0.3327852, 0.4137908, -1.254054, 0, 1, 0.4078431, 1,
-0.3305517, -0.01667534, -1.412563, 0, 1, 0.4117647, 1,
-0.3281975, 1.015851, -0.7603802, 0, 1, 0.4196078, 1,
-0.3262919, 0.1381157, -0.1751987, 0, 1, 0.4235294, 1,
-0.3248063, 0.2048585, -1.52705, 0, 1, 0.4313726, 1,
-0.3244962, -1.589425, -1.974112, 0, 1, 0.4352941, 1,
-0.322945, 0.01611808, -4.480935, 0, 1, 0.4431373, 1,
-0.3219223, -0.1738974, -1.9658, 0, 1, 0.4470588, 1,
-0.3194665, 0.7751256, -1.376269, 0, 1, 0.454902, 1,
-0.3163632, -0.4204221, -3.704477, 0, 1, 0.4588235, 1,
-0.3150983, 0.0527948, -1.78954, 0, 1, 0.4666667, 1,
-0.3089856, 2.992154, 0.5089157, 0, 1, 0.4705882, 1,
-0.3016357, 1.665942, -1.895723, 0, 1, 0.4784314, 1,
-0.3010453, 2.694566, 2.330703, 0, 1, 0.4823529, 1,
-0.3004264, -0.3777762, -3.097633, 0, 1, 0.4901961, 1,
-0.298505, 0.6450987, -0.9760545, 0, 1, 0.4941176, 1,
-0.2955917, -0.8861915, -2.882767, 0, 1, 0.5019608, 1,
-0.294545, 0.7992918, 1.053041, 0, 1, 0.509804, 1,
-0.2915106, -0.6931416, -3.531223, 0, 1, 0.5137255, 1,
-0.2905498, 0.6827341, 1.133277, 0, 1, 0.5215687, 1,
-0.2896077, -1.092396, -1.343338, 0, 1, 0.5254902, 1,
-0.2870086, 0.4284526, -0.5873125, 0, 1, 0.5333334, 1,
-0.2869239, -0.8612492, -3.272119, 0, 1, 0.5372549, 1,
-0.2858794, 1.564152, -1.264858, 0, 1, 0.5450981, 1,
-0.2847153, -1.547218, -4.026821, 0, 1, 0.5490196, 1,
-0.2824985, -0.04329452, -1.906537, 0, 1, 0.5568628, 1,
-0.2819028, -0.2820741, -3.326394, 0, 1, 0.5607843, 1,
-0.2796349, -0.6177629, -2.522126, 0, 1, 0.5686275, 1,
-0.2746421, -2.28979, -4.840609, 0, 1, 0.572549, 1,
-0.2745486, -0.1873122, -1.213315, 0, 1, 0.5803922, 1,
-0.2743324, 0.1805287, -0.5418762, 0, 1, 0.5843138, 1,
-0.2741912, -0.6576287, -2.960391, 0, 1, 0.5921569, 1,
-0.2650624, 1.139544, -1.747527, 0, 1, 0.5960785, 1,
-0.2619639, 0.2039094, 1.178831, 0, 1, 0.6039216, 1,
-0.2601108, -0.3766072, -2.512332, 0, 1, 0.6117647, 1,
-0.2457971, 0.9717675, -0.3445565, 0, 1, 0.6156863, 1,
-0.2448441, -0.9085854, -4.416512, 0, 1, 0.6235294, 1,
-0.2437951, 0.1221065, -0.6209164, 0, 1, 0.627451, 1,
-0.2398141, 2.054816, 0.3104563, 0, 1, 0.6352941, 1,
-0.2380731, 0.04292555, -0.2439492, 0, 1, 0.6392157, 1,
-0.2370815, -0.5579477, -1.636008, 0, 1, 0.6470588, 1,
-0.2369156, 0.6131848, -0.263217, 0, 1, 0.6509804, 1,
-0.2360563, -0.9965931, -2.091749, 0, 1, 0.6588235, 1,
-0.2328781, 0.955749, -1.624796, 0, 1, 0.6627451, 1,
-0.2301073, -1.416176, -3.049774, 0, 1, 0.6705883, 1,
-0.2209102, -1.40369, -4.739647, 0, 1, 0.6745098, 1,
-0.2175234, -1.545754, -5.554143, 0, 1, 0.682353, 1,
-0.2155169, 1.618443, 0.1268863, 0, 1, 0.6862745, 1,
-0.2096854, -1.131722, -1.950701, 0, 1, 0.6941177, 1,
-0.2081626, 0.1548731, -2.032427, 0, 1, 0.7019608, 1,
-0.2070965, 1.181737, -0.4394445, 0, 1, 0.7058824, 1,
-0.2039317, -0.01383593, -0.7467258, 0, 1, 0.7137255, 1,
-0.201639, -0.4890133, -3.619866, 0, 1, 0.7176471, 1,
-0.2002114, -0.1186409, 0.4561026, 0, 1, 0.7254902, 1,
-0.2000485, -1.139723, -4.012316, 0, 1, 0.7294118, 1,
-0.1970955, -0.1509648, -1.275582, 0, 1, 0.7372549, 1,
-0.1945466, 0.2796572, -1.128288, 0, 1, 0.7411765, 1,
-0.1936981, -0.173047, -1.602294, 0, 1, 0.7490196, 1,
-0.1933895, -0.3172501, -5.264744, 0, 1, 0.7529412, 1,
-0.1902379, -1.077774, -4.758932, 0, 1, 0.7607843, 1,
-0.1870618, 0.2669504, 0.9239806, 0, 1, 0.7647059, 1,
-0.1867726, 1.075627, 0.4960365, 0, 1, 0.772549, 1,
-0.1821017, -0.06597289, -1.09428, 0, 1, 0.7764706, 1,
-0.1806971, -0.8523888, -3.496288, 0, 1, 0.7843137, 1,
-0.1792046, 0.158657, 0.6134524, 0, 1, 0.7882353, 1,
-0.1758179, 0.2001997, -2.720937, 0, 1, 0.7960784, 1,
-0.1718342, -1.230084, -2.971122, 0, 1, 0.8039216, 1,
-0.1709793, 1.862687, 2.161857, 0, 1, 0.8078431, 1,
-0.1640528, 0.4793711, 0.2575886, 0, 1, 0.8156863, 1,
-0.1605727, -0.4856344, -2.417181, 0, 1, 0.8196079, 1,
-0.1600634, -1.966252, -4.222094, 0, 1, 0.827451, 1,
-0.1553733, 0.07709102, -2.07733, 0, 1, 0.8313726, 1,
-0.1488453, -1.41416, -1.675039, 0, 1, 0.8392157, 1,
-0.1479746, 0.8638091, -1.033967, 0, 1, 0.8431373, 1,
-0.1427175, -0.9382401, -2.124679, 0, 1, 0.8509804, 1,
-0.1423786, -0.4882891, -1.848565, 0, 1, 0.854902, 1,
-0.1417164, 0.1786428, -0.5472723, 0, 1, 0.8627451, 1,
-0.1381015, -0.2329496, -3.333382, 0, 1, 0.8666667, 1,
-0.1327792, 0.2099667, -1.835376, 0, 1, 0.8745098, 1,
-0.1311316, 0.04689896, -0.1487705, 0, 1, 0.8784314, 1,
-0.1310689, -0.8458256, -1.791966, 0, 1, 0.8862745, 1,
-0.1302513, -0.5272434, -2.903743, 0, 1, 0.8901961, 1,
-0.1292856, -0.008978788, -1.146805, 0, 1, 0.8980392, 1,
-0.1292172, 0.8562043, -1.267359, 0, 1, 0.9058824, 1,
-0.1289198, -1.048666, -3.654327, 0, 1, 0.9098039, 1,
-0.1279808, 1.522019, -0.8770786, 0, 1, 0.9176471, 1,
-0.1240132, 1.421224, -0.5263822, 0, 1, 0.9215686, 1,
-0.1217022, 0.6661535, -0.2050953, 0, 1, 0.9294118, 1,
-0.1170186, 0.1932419, -1.279492, 0, 1, 0.9333333, 1,
-0.1142865, -0.3743666, -4.082353, 0, 1, 0.9411765, 1,
-0.1133942, 0.7026417, -0.4820794, 0, 1, 0.945098, 1,
-0.1051442, -0.3860936, -1.870108, 0, 1, 0.9529412, 1,
-0.1023345, 1.760195, -1.210494, 0, 1, 0.9568627, 1,
-0.1009592, 0.4681533, -1.006384, 0, 1, 0.9647059, 1,
-0.09973382, 0.2876427, -1.643335, 0, 1, 0.9686275, 1,
-0.09940699, 1.23344, -1.518737, 0, 1, 0.9764706, 1,
-0.09510699, -2.14199, -3.597333, 0, 1, 0.9803922, 1,
-0.08526678, 0.851738, 0.8865676, 0, 1, 0.9882353, 1,
-0.0816771, -1.493267, -3.601358, 0, 1, 0.9921569, 1,
-0.08102083, -1.003811, -2.975823, 0, 1, 1, 1,
-0.07936721, -1.395855, -1.823647, 0, 0.9921569, 1, 1,
-0.07899021, -0.8227209, -4.071785, 0, 0.9882353, 1, 1,
-0.07697403, 0.04960041, -2.048709, 0, 0.9803922, 1, 1,
-0.07357971, -0.916773, -3.248108, 0, 0.9764706, 1, 1,
-0.07221679, 2.403232, 0.4310941, 0, 0.9686275, 1, 1,
-0.06379011, 1.65333, 0.5903509, 0, 0.9647059, 1, 1,
-0.06311741, 0.04515702, 0.3749079, 0, 0.9568627, 1, 1,
-0.06045983, 0.483146, -0.8452173, 0, 0.9529412, 1, 1,
-0.05993911, -0.3437359, -3.304617, 0, 0.945098, 1, 1,
-0.05939646, 0.6395007, 1.335414, 0, 0.9411765, 1, 1,
-0.05669878, 0.0230341, -1.748749, 0, 0.9333333, 1, 1,
-0.05569712, -0.7262965, -2.081792, 0, 0.9294118, 1, 1,
-0.05547012, -0.08058876, -1.492099, 0, 0.9215686, 1, 1,
-0.05123886, -0.2127304, -2.794224, 0, 0.9176471, 1, 1,
-0.04927458, 1.406936, -0.1224994, 0, 0.9098039, 1, 1,
-0.0486486, -0.4496472, -5.551593, 0, 0.9058824, 1, 1,
-0.04759904, 0.5838412, 0.1939062, 0, 0.8980392, 1, 1,
-0.03410899, -0.3038225, -3.255466, 0, 0.8901961, 1, 1,
-0.03283333, -0.1195076, -3.503851, 0, 0.8862745, 1, 1,
-0.030665, 0.5633022, -0.4148608, 0, 0.8784314, 1, 1,
-0.0292613, 1.186097, -0.3000395, 0, 0.8745098, 1, 1,
-0.02168828, -0.5704336, -4.677144, 0, 0.8666667, 1, 1,
-0.01262806, 0.4657716, -0.781711, 0, 0.8627451, 1, 1,
-0.006276551, 1.419815, 0.1616531, 0, 0.854902, 1, 1,
-0.005888169, -0.1064732, -3.688643, 0, 0.8509804, 1, 1,
-0.001224799, 1.119494, 0.6810783, 0, 0.8431373, 1, 1,
0.0001455914, -0.02679309, 4.958165, 0, 0.8392157, 1, 1,
0.0002893771, -0.05443319, 2.79681, 0, 0.8313726, 1, 1,
0.003720135, 1.734737, -2.624296, 0, 0.827451, 1, 1,
0.004407011, -0.6661921, 4.868196, 0, 0.8196079, 1, 1,
0.0067141, -0.9834142, 2.620807, 0, 0.8156863, 1, 1,
0.009786401, -0.5863554, 1.954893, 0, 0.8078431, 1, 1,
0.0131972, 1.014707, 0.2193348, 0, 0.8039216, 1, 1,
0.02427282, -0.6584094, 1.420167, 0, 0.7960784, 1, 1,
0.02445125, -0.5013258, 1.590952, 0, 0.7882353, 1, 1,
0.02558248, -0.9381208, 0.7585722, 0, 0.7843137, 1, 1,
0.03047845, -0.2190626, 1.369356, 0, 0.7764706, 1, 1,
0.03264449, -0.9921449, 2.942732, 0, 0.772549, 1, 1,
0.03881502, -0.565176, 5.042335, 0, 0.7647059, 1, 1,
0.04082047, 0.8422536, 1.000423, 0, 0.7607843, 1, 1,
0.0433226, -0.249345, 3.546215, 0, 0.7529412, 1, 1,
0.04428378, -0.6991934, 4.343244, 0, 0.7490196, 1, 1,
0.0485329, -0.1732099, 2.865391, 0, 0.7411765, 1, 1,
0.05540463, 0.3840099, -0.1856955, 0, 0.7372549, 1, 1,
0.05571096, 1.126608, -0.3434768, 0, 0.7294118, 1, 1,
0.05848988, 0.7791153, 1.248875, 0, 0.7254902, 1, 1,
0.05924732, 0.05107152, 1.245183, 0, 0.7176471, 1, 1,
0.06410218, 2.542922, 0.005878143, 0, 0.7137255, 1, 1,
0.06747404, 0.3721185, 0.2674381, 0, 0.7058824, 1, 1,
0.07326968, 0.9371777, 1.099933, 0, 0.6980392, 1, 1,
0.07327745, -0.00586873, 0.3720219, 0, 0.6941177, 1, 1,
0.07672668, -1.388053, 5.360704, 0, 0.6862745, 1, 1,
0.07745173, -0.9344077, 5.343244, 0, 0.682353, 1, 1,
0.07799075, -0.1197354, 4.116617, 0, 0.6745098, 1, 1,
0.08420959, 1.322972, 0.4932531, 0, 0.6705883, 1, 1,
0.09326479, -0.5043822, 2.18274, 0, 0.6627451, 1, 1,
0.09548378, 2.100087, 1.699233, 0, 0.6588235, 1, 1,
0.09652568, -0.8610919, 1.902137, 0, 0.6509804, 1, 1,
0.09816234, 0.4386909, -1.192593, 0, 0.6470588, 1, 1,
0.1018541, -1.315219, 1.968558, 0, 0.6392157, 1, 1,
0.1075012, 1.199748, -0.748839, 0, 0.6352941, 1, 1,
0.1079285, -0.851902, 1.656439, 0, 0.627451, 1, 1,
0.1152112, 0.802332, 2.359884, 0, 0.6235294, 1, 1,
0.1158968, 0.765765, 0.03769115, 0, 0.6156863, 1, 1,
0.1173925, -0.7660491, 4.166554, 0, 0.6117647, 1, 1,
0.1193284, 0.3339062, -0.4656754, 0, 0.6039216, 1, 1,
0.1217799, 0.5701615, 0.2071852, 0, 0.5960785, 1, 1,
0.131627, 1.455453, 1.529632, 0, 0.5921569, 1, 1,
0.1352393, -1.051775, 2.646123, 0, 0.5843138, 1, 1,
0.1431612, -0.8802561, 3.913401, 0, 0.5803922, 1, 1,
0.1458833, 0.03066915, -0.9660988, 0, 0.572549, 1, 1,
0.1499621, -0.1929274, 1.963393, 0, 0.5686275, 1, 1,
0.1527994, -0.7299951, 3.660204, 0, 0.5607843, 1, 1,
0.155319, 0.779306, 1.020998, 0, 0.5568628, 1, 1,
0.1576038, 1.023396, -0.4854547, 0, 0.5490196, 1, 1,
0.1578883, -0.1186826, 0.7398884, 0, 0.5450981, 1, 1,
0.159933, -0.512958, 4.181919, 0, 0.5372549, 1, 1,
0.1623759, -1.386545, 3.301162, 0, 0.5333334, 1, 1,
0.1636335, 0.1152983, 1.026821, 0, 0.5254902, 1, 1,
0.1640758, -1.9641, 3.346355, 0, 0.5215687, 1, 1,
0.1654251, 0.4279892, 2.15072, 0, 0.5137255, 1, 1,
0.170953, -1.345278, 1.917997, 0, 0.509804, 1, 1,
0.1722487, -0.440776, 2.032369, 0, 0.5019608, 1, 1,
0.1760316, 0.3169582, -0.1223421, 0, 0.4941176, 1, 1,
0.1795708, -0.6147892, 3.411333, 0, 0.4901961, 1, 1,
0.1795859, -1.299266, 5.227821, 0, 0.4823529, 1, 1,
0.1888485, 0.6423585, -1.224185, 0, 0.4784314, 1, 1,
0.191737, 0.8033161, 1.434783, 0, 0.4705882, 1, 1,
0.1989238, -1.567732, 3.144246, 0, 0.4666667, 1, 1,
0.1992064, 0.188963, 2.074628, 0, 0.4588235, 1, 1,
0.1992073, -0.3813072, 4.290696, 0, 0.454902, 1, 1,
0.199682, 1.366444, 0.6934736, 0, 0.4470588, 1, 1,
0.2032847, 1.271012, -0.2913072, 0, 0.4431373, 1, 1,
0.2060274, 0.05185906, 2.511853, 0, 0.4352941, 1, 1,
0.2060755, -0.975151, 2.469398, 0, 0.4313726, 1, 1,
0.2110319, 0.2701583, -0.1468628, 0, 0.4235294, 1, 1,
0.21157, -0.6086806, 5.312142, 0, 0.4196078, 1, 1,
0.2137632, 0.1768425, 1.159809, 0, 0.4117647, 1, 1,
0.2162121, 1.010082, 0.8800681, 0, 0.4078431, 1, 1,
0.2180706, -0.5344084, 3.201329, 0, 0.4, 1, 1,
0.218307, -0.6825278, 1.761118, 0, 0.3921569, 1, 1,
0.2266753, -0.7031201, 2.465482, 0, 0.3882353, 1, 1,
0.2280139, 1.02309, 1.277882, 0, 0.3803922, 1, 1,
0.2282622, 0.3235423, 2.516165, 0, 0.3764706, 1, 1,
0.2317317, 0.5019572, -0.1700166, 0, 0.3686275, 1, 1,
0.2349039, -0.6335148, 3.139293, 0, 0.3647059, 1, 1,
0.2368941, 0.1104997, 1.812101, 0, 0.3568628, 1, 1,
0.2398738, 0.07868231, 2.137698, 0, 0.3529412, 1, 1,
0.2441038, -0.3570316, 2.86796, 0, 0.345098, 1, 1,
0.2444114, -0.9955504, 3.603693, 0, 0.3411765, 1, 1,
0.2458011, -1.366316, 3.592692, 0, 0.3333333, 1, 1,
0.2465118, -0.1695882, 0.5509055, 0, 0.3294118, 1, 1,
0.2503943, -0.1993158, 3.417174, 0, 0.3215686, 1, 1,
0.2507691, -0.4688571, 1.682865, 0, 0.3176471, 1, 1,
0.2533836, 1.183331, 0.184831, 0, 0.3098039, 1, 1,
0.2554078, 1.348846, -1.220824, 0, 0.3058824, 1, 1,
0.2564914, -1.365541, 0.7307165, 0, 0.2980392, 1, 1,
0.2634696, 0.2723936, 1.241113, 0, 0.2901961, 1, 1,
0.2694195, 1.549816, -0.6718871, 0, 0.2862745, 1, 1,
0.2723925, 1.005749, -0.6992797, 0, 0.2784314, 1, 1,
0.273332, 0.7027152, -0.7608936, 0, 0.2745098, 1, 1,
0.2758052, 0.9801445, 0.2565482, 0, 0.2666667, 1, 1,
0.2779914, 0.1512708, 0.2644464, 0, 0.2627451, 1, 1,
0.2792764, 0.2042927, 1.307519, 0, 0.254902, 1, 1,
0.2800809, 0.5010521, 0.4153693, 0, 0.2509804, 1, 1,
0.2822722, -0.2954324, 3.30256, 0, 0.2431373, 1, 1,
0.2837227, 1.117949, -1.291927, 0, 0.2392157, 1, 1,
0.2877021, -0.5366845, 1.431143, 0, 0.2313726, 1, 1,
0.2883536, -0.1227546, 2.684361, 0, 0.227451, 1, 1,
0.2892341, -0.6322909, 5.025857, 0, 0.2196078, 1, 1,
0.2899294, -0.1437981, 1.82626, 0, 0.2156863, 1, 1,
0.2948387, -1.207265, 4.52392, 0, 0.2078431, 1, 1,
0.2961035, 0.7891399, 0.7109613, 0, 0.2039216, 1, 1,
0.2986757, 0.8488692, 1.798225, 0, 0.1960784, 1, 1,
0.3042617, 1.282693, -0.4729116, 0, 0.1882353, 1, 1,
0.3053116, 1.242231, 0.2909201, 0, 0.1843137, 1, 1,
0.3056499, -0.7957015, 3.658445, 0, 0.1764706, 1, 1,
0.3064161, -0.361183, 1.60977, 0, 0.172549, 1, 1,
0.3093126, -0.318327, 1.969123, 0, 0.1647059, 1, 1,
0.312904, 0.7442025, 1.061902, 0, 0.1607843, 1, 1,
0.316991, 1.34583, 0.5171143, 0, 0.1529412, 1, 1,
0.3183285, -0.9950024, 1.937436, 0, 0.1490196, 1, 1,
0.3211287, -0.7893108, 3.841728, 0, 0.1411765, 1, 1,
0.3240308, -1.502206, 2.705828, 0, 0.1372549, 1, 1,
0.3265758, 0.689925, -0.1327936, 0, 0.1294118, 1, 1,
0.3431461, 1.40766, 0.5560966, 0, 0.1254902, 1, 1,
0.3461936, -1.303645, 0.8294734, 0, 0.1176471, 1, 1,
0.3496864, -0.3020386, 3.09647, 0, 0.1137255, 1, 1,
0.3563765, 1.197411, 0.2864045, 0, 0.1058824, 1, 1,
0.357598, 1.242258, 0.4164762, 0, 0.09803922, 1, 1,
0.3583408, 0.3013311, 1.775198, 0, 0.09411765, 1, 1,
0.3618825, -0.9772569, 1.814162, 0, 0.08627451, 1, 1,
0.3619189, 1.119935, 2.295327, 0, 0.08235294, 1, 1,
0.3632954, -1.814182, 1.424819, 0, 0.07450981, 1, 1,
0.3649473, -0.1336113, 1.283824, 0, 0.07058824, 1, 1,
0.3684595, -0.2714639, 1.375326, 0, 0.0627451, 1, 1,
0.3688746, 0.3218542, 0.4962716, 0, 0.05882353, 1, 1,
0.3695522, -0.9360282, 3.545579, 0, 0.05098039, 1, 1,
0.3726701, -1.300577, 4.659985, 0, 0.04705882, 1, 1,
0.382354, 0.4193743, 0.461392, 0, 0.03921569, 1, 1,
0.3910785, -0.2987544, 2.938093, 0, 0.03529412, 1, 1,
0.3937677, -1.167446, 2.071297, 0, 0.02745098, 1, 1,
0.3948582, 0.1113463, 2.661104, 0, 0.02352941, 1, 1,
0.3989738, 0.6121757, 0.4569637, 0, 0.01568628, 1, 1,
0.4012497, 0.9255634, 1.158579, 0, 0.01176471, 1, 1,
0.4024419, 1.005026, 0.824834, 0, 0.003921569, 1, 1,
0.4033659, -2.696457, 1.732412, 0.003921569, 0, 1, 1,
0.4081057, 1.273561, 0.9935173, 0.007843138, 0, 1, 1,
0.4087456, -0.6122949, 3.016661, 0.01568628, 0, 1, 1,
0.4121705, 0.7484421, -0.7065523, 0.01960784, 0, 1, 1,
0.4123514, -0.8435637, 1.221538, 0.02745098, 0, 1, 1,
0.4126444, 0.5744965, -0.005386846, 0.03137255, 0, 1, 1,
0.4139774, 0.5579245, 0.5512707, 0.03921569, 0, 1, 1,
0.4178564, 0.8681594, 1.777322, 0.04313726, 0, 1, 1,
0.4185498, 0.1139745, 0.6416257, 0.05098039, 0, 1, 1,
0.4225926, -0.3710145, 1.84723, 0.05490196, 0, 1, 1,
0.4234904, -0.2545511, 2.731501, 0.0627451, 0, 1, 1,
0.4308797, -2.323895, 3.51464, 0.06666667, 0, 1, 1,
0.4329377, 0.5346258, 0.6351264, 0.07450981, 0, 1, 1,
0.4360688, -1.700179, 4.55829, 0.07843138, 0, 1, 1,
0.4373185, 1.025598, -0.7425773, 0.08627451, 0, 1, 1,
0.4396416, 1.002339, 0.5409974, 0.09019608, 0, 1, 1,
0.443093, 1.373528, 0.8579076, 0.09803922, 0, 1, 1,
0.4506192, 0.9914677, -1.340672, 0.1058824, 0, 1, 1,
0.4511907, -1.04749, 2.80837, 0.1098039, 0, 1, 1,
0.4514796, 0.06949341, 2.575214, 0.1176471, 0, 1, 1,
0.461835, -0.6403834, 1.839973, 0.1215686, 0, 1, 1,
0.4629159, -1.177821, 5.486716, 0.1294118, 0, 1, 1,
0.4638993, 0.1269047, 1.762992, 0.1333333, 0, 1, 1,
0.4706001, -0.5827957, 2.134037, 0.1411765, 0, 1, 1,
0.471462, 1.564367, 0.5172837, 0.145098, 0, 1, 1,
0.4749687, 0.9160058, 0.790096, 0.1529412, 0, 1, 1,
0.4761632, -0.1389677, 2.818191, 0.1568628, 0, 1, 1,
0.4780484, -0.6562951, 3.09345, 0.1647059, 0, 1, 1,
0.4849413, 1.195124, -0.3620364, 0.1686275, 0, 1, 1,
0.4850695, -1.192346, 2.405432, 0.1764706, 0, 1, 1,
0.4898599, -1.27271, 2.509879, 0.1803922, 0, 1, 1,
0.4908953, -0.861087, 0.8467144, 0.1882353, 0, 1, 1,
0.4912538, 1.3484, -0.3462322, 0.1921569, 0, 1, 1,
0.4978004, -0.4981489, 3.53747, 0.2, 0, 1, 1,
0.4980922, -0.2314415, 2.189677, 0.2078431, 0, 1, 1,
0.5018863, -1.164076, 3.999194, 0.2117647, 0, 1, 1,
0.5032397, -0.8628678, 2.429599, 0.2196078, 0, 1, 1,
0.5105584, -1.819193, 3.839333, 0.2235294, 0, 1, 1,
0.517769, 0.5840027, 1.503805, 0.2313726, 0, 1, 1,
0.5205543, 1.057055, -2.19058, 0.2352941, 0, 1, 1,
0.5291522, 1.030178, 1.275592, 0.2431373, 0, 1, 1,
0.5295189, -0.03834137, 1.215123, 0.2470588, 0, 1, 1,
0.5351641, -0.8594807, 1.024338, 0.254902, 0, 1, 1,
0.5440731, 0.6223801, 0.7069196, 0.2588235, 0, 1, 1,
0.5443378, -0.2228656, 1.975304, 0.2666667, 0, 1, 1,
0.5476763, 0.3139814, 2.971925, 0.2705882, 0, 1, 1,
0.5481029, 0.6736119, 1.758949, 0.2784314, 0, 1, 1,
0.5537652, 0.2724162, 1.458625, 0.282353, 0, 1, 1,
0.5551091, -0.6076767, 2.722496, 0.2901961, 0, 1, 1,
0.5567425, -0.9828471, 3.092228, 0.2941177, 0, 1, 1,
0.5570112, 0.4682543, 1.73764, 0.3019608, 0, 1, 1,
0.5582355, -0.5773171, 1.009649, 0.3098039, 0, 1, 1,
0.5596471, -1.301447, 3.088351, 0.3137255, 0, 1, 1,
0.5617496, 0.09127515, 1.860707, 0.3215686, 0, 1, 1,
0.5649889, -1.106704, 0.8940873, 0.3254902, 0, 1, 1,
0.5665991, 0.7025381, 0.6030265, 0.3333333, 0, 1, 1,
0.5694252, 1.054513, 0.7680683, 0.3372549, 0, 1, 1,
0.579945, -0.5017812, 3.78561, 0.345098, 0, 1, 1,
0.5809607, -0.519322, 0.936613, 0.3490196, 0, 1, 1,
0.5881602, 0.1950407, 0.9404569, 0.3568628, 0, 1, 1,
0.590701, -0.177119, 1.373421, 0.3607843, 0, 1, 1,
0.5914861, 1.141661, -0.0701862, 0.3686275, 0, 1, 1,
0.5949869, 1.363096, -1.299681, 0.372549, 0, 1, 1,
0.5955285, 0.6602775, 1.42532, 0.3803922, 0, 1, 1,
0.6021393, 1.56779, -0.4995292, 0.3843137, 0, 1, 1,
0.6030601, -0.3653297, 2.119402, 0.3921569, 0, 1, 1,
0.6063579, -0.5752477, 3.766629, 0.3960784, 0, 1, 1,
0.6100281, 0.7103591, 0.04366539, 0.4039216, 0, 1, 1,
0.6127918, 0.3436694, 1.068056, 0.4117647, 0, 1, 1,
0.6160364, -0.7692478, 2.765414, 0.4156863, 0, 1, 1,
0.6189367, 2.401906, -0.2063076, 0.4235294, 0, 1, 1,
0.6190057, 2.387933, -0.8597682, 0.427451, 0, 1, 1,
0.6269926, 0.7761113, 1.542374, 0.4352941, 0, 1, 1,
0.6335231, 0.07115314, 2.629539, 0.4392157, 0, 1, 1,
0.6379857, -1.476413, 2.21621, 0.4470588, 0, 1, 1,
0.6381533, 0.3907876, -0.267215, 0.4509804, 0, 1, 1,
0.6416055, 2.255186, 1.398212, 0.4588235, 0, 1, 1,
0.6422899, -0.719945, 2.113893, 0.4627451, 0, 1, 1,
0.6461318, 1.751243, 2.195099, 0.4705882, 0, 1, 1,
0.6506082, -0.3855337, 0.8504169, 0.4745098, 0, 1, 1,
0.6512691, 0.9835752, 3.515332, 0.4823529, 0, 1, 1,
0.6606564, -0.3346737, 1.977456, 0.4862745, 0, 1, 1,
0.6663626, 0.1963706, 0.398116, 0.4941176, 0, 1, 1,
0.6682116, -0.5786064, 2.516457, 0.5019608, 0, 1, 1,
0.6697775, 1.949369, -0.168407, 0.5058824, 0, 1, 1,
0.6799674, -1.527691, 4.804419, 0.5137255, 0, 1, 1,
0.6824406, 0.08288111, -1.0906, 0.5176471, 0, 1, 1,
0.6876699, -0.4833947, 1.263429, 0.5254902, 0, 1, 1,
0.6881082, -0.1569471, 2.48498, 0.5294118, 0, 1, 1,
0.6899132, -1.05186, 1.910768, 0.5372549, 0, 1, 1,
0.6916973, 0.1947156, 2.043662, 0.5411765, 0, 1, 1,
0.7056909, -0.07754558, 2.324249, 0.5490196, 0, 1, 1,
0.707799, -0.5822024, 1.0025, 0.5529412, 0, 1, 1,
0.7106832, 0.1004571, -0.1495412, 0.5607843, 0, 1, 1,
0.7107544, -2.199822, 3.893672, 0.5647059, 0, 1, 1,
0.7155398, -1.001815, 1.754781, 0.572549, 0, 1, 1,
0.7187953, 0.1576479, 1.767215, 0.5764706, 0, 1, 1,
0.7199914, 0.99928, 0.974259, 0.5843138, 0, 1, 1,
0.7226782, -0.4700465, 2.404117, 0.5882353, 0, 1, 1,
0.7247638, -0.3968557, 0.8918376, 0.5960785, 0, 1, 1,
0.7288731, 0.004051547, 1.11496, 0.6039216, 0, 1, 1,
0.7293572, -0.155855, 4.835617, 0.6078432, 0, 1, 1,
0.7305654, 0.6536215, 0.2630023, 0.6156863, 0, 1, 1,
0.73721, 0.1148901, 1.32095, 0.6196079, 0, 1, 1,
0.7387103, -0.3756746, 2.463079, 0.627451, 0, 1, 1,
0.7387776, -0.1207813, 2.534198, 0.6313726, 0, 1, 1,
0.7449901, -0.1455516, 0.790316, 0.6392157, 0, 1, 1,
0.7465852, 1.352991, 0.5047927, 0.6431373, 0, 1, 1,
0.7483943, -0.2562547, 0.1003244, 0.6509804, 0, 1, 1,
0.7504585, -1.26967, 2.07985, 0.654902, 0, 1, 1,
0.7505357, -1.241483, 1.160983, 0.6627451, 0, 1, 1,
0.7529109, -1.454599, 2.031959, 0.6666667, 0, 1, 1,
0.7634004, 2.282923, -0.03970914, 0.6745098, 0, 1, 1,
0.7663904, 0.4377885, 0.4480137, 0.6784314, 0, 1, 1,
0.7675912, 0.4756631, 1.340822, 0.6862745, 0, 1, 1,
0.7678694, 0.3907208, 2.072659, 0.6901961, 0, 1, 1,
0.7688319, 1.946295, 1.097055, 0.6980392, 0, 1, 1,
0.7759641, -0.140044, 2.273154, 0.7058824, 0, 1, 1,
0.7782921, 0.5426996, 0.8185964, 0.7098039, 0, 1, 1,
0.7807811, 0.5250855, 1.131416, 0.7176471, 0, 1, 1,
0.783423, -2.733336, 2.067348, 0.7215686, 0, 1, 1,
0.7908344, -0.9515256, 3.475223, 0.7294118, 0, 1, 1,
0.7926295, -1.310113, 3.001622, 0.7333333, 0, 1, 1,
0.7954316, 0.2989882, 0.9067522, 0.7411765, 0, 1, 1,
0.7964587, 1.217567, -0.5011889, 0.7450981, 0, 1, 1,
0.8067479, 0.2145387, -0.1703525, 0.7529412, 0, 1, 1,
0.8116125, -0.6608705, 4.277257, 0.7568628, 0, 1, 1,
0.8143944, -1.050727, 1.755455, 0.7647059, 0, 1, 1,
0.8171713, 0.5772733, 1.702286, 0.7686275, 0, 1, 1,
0.8187444, 0.2313536, 0.2681692, 0.7764706, 0, 1, 1,
0.823746, -1.825774, 2.736237, 0.7803922, 0, 1, 1,
0.8273849, 0.2588553, 1.379703, 0.7882353, 0, 1, 1,
0.8283931, 1.099791, -0.2729016, 0.7921569, 0, 1, 1,
0.8321014, 0.7705182, 0.7542391, 0.8, 0, 1, 1,
0.8348722, -0.9733988, 3.384529, 0.8078431, 0, 1, 1,
0.841186, 0.4556956, 0.9699348, 0.8117647, 0, 1, 1,
0.8474101, -0.7019724, 2.224283, 0.8196079, 0, 1, 1,
0.8476515, -0.6940943, 3.176142, 0.8235294, 0, 1, 1,
0.848946, -0.2454036, 1.988682, 0.8313726, 0, 1, 1,
0.8532758, 1.218453, 1.966454, 0.8352941, 0, 1, 1,
0.8541875, -1.583437, 1.495987, 0.8431373, 0, 1, 1,
0.8554283, 1.578734, -0.3575216, 0.8470588, 0, 1, 1,
0.8567938, 0.3257036, 3.559707, 0.854902, 0, 1, 1,
0.8572614, 0.9247522, -0.6835144, 0.8588235, 0, 1, 1,
0.8583041, -0.1946832, 1.410815, 0.8666667, 0, 1, 1,
0.8634897, 0.4732109, 1.134454, 0.8705882, 0, 1, 1,
0.871076, -0.9052233, 3.890235, 0.8784314, 0, 1, 1,
0.8717592, 1.156849, -1.213932, 0.8823529, 0, 1, 1,
0.8736987, 1.241507, 1.729004, 0.8901961, 0, 1, 1,
0.8881278, 0.1389605, -0.6079755, 0.8941177, 0, 1, 1,
0.8903124, 1.362886, 0.6372015, 0.9019608, 0, 1, 1,
0.8928883, 0.1053918, 0.5882264, 0.9098039, 0, 1, 1,
0.8931311, 0.3041564, 1.67313, 0.9137255, 0, 1, 1,
0.8992025, 0.07243492, 2.587711, 0.9215686, 0, 1, 1,
0.9001401, 0.5389191, 1.249591, 0.9254902, 0, 1, 1,
0.9162133, -2.2779, 4.56622, 0.9333333, 0, 1, 1,
0.9313993, 0.5050482, 0.8533711, 0.9372549, 0, 1, 1,
0.9360587, 1.152241, 1.917169, 0.945098, 0, 1, 1,
0.938289, 1.025011, 1.509717, 0.9490196, 0, 1, 1,
0.9428401, 1.198679, 1.087281, 0.9568627, 0, 1, 1,
0.9439283, -1.509786, 2.644735, 0.9607843, 0, 1, 1,
0.9445099, -0.6532313, 1.749879, 0.9686275, 0, 1, 1,
0.945605, 1.154362, 2.808459, 0.972549, 0, 1, 1,
0.9522048, 0.6681191, 1.611148, 0.9803922, 0, 1, 1,
0.9542794, -0.5419015, 3.366719, 0.9843137, 0, 1, 1,
0.959897, 0.2019507, -0.4340926, 0.9921569, 0, 1, 1,
0.9766831, -0.8900943, 2.36841, 0.9960784, 0, 1, 1,
0.9880826, 2.486689, -0.2474489, 1, 0, 0.9960784, 1,
0.9917805, -0.3001955, 1.499444, 1, 0, 0.9882353, 1,
0.9939009, -0.2061752, 0.7628977, 1, 0, 0.9843137, 1,
0.994351, 0.9686034, 1.72831, 1, 0, 0.9764706, 1,
0.999269, 0.6903359, 3.396011, 1, 0, 0.972549, 1,
1.000967, 2.882855, 1.305257, 1, 0, 0.9647059, 1,
1.001066, -0.9241768, 3.762324, 1, 0, 0.9607843, 1,
1.002969, -0.2245822, 1.642353, 1, 0, 0.9529412, 1,
1.005332, -1.178628, 0.1168646, 1, 0, 0.9490196, 1,
1.009581, -0.5752566, 2.355633, 1, 0, 0.9411765, 1,
1.009947, 0.7913949, 1.144983, 1, 0, 0.9372549, 1,
1.010916, -0.1475912, 1.597795, 1, 0, 0.9294118, 1,
1.010972, -0.1234157, 0.6346894, 1, 0, 0.9254902, 1,
1.01413, 1.001586, 0.5078741, 1, 0, 0.9176471, 1,
1.018213, -0.507393, 3.38681, 1, 0, 0.9137255, 1,
1.018948, -1.033444, 2.489263, 1, 0, 0.9058824, 1,
1.023899, 0.4464555, 1.288272, 1, 0, 0.9019608, 1,
1.025282, -0.5095632, 3.238964, 1, 0, 0.8941177, 1,
1.027138, -0.8272983, 4.870566, 1, 0, 0.8862745, 1,
1.029634, 1.931503, -1.809224, 1, 0, 0.8823529, 1,
1.035408, -0.7728713, 2.285564, 1, 0, 0.8745098, 1,
1.035911, -0.3298239, 1.851054, 1, 0, 0.8705882, 1,
1.038161, -2.158751, 2.476069, 1, 0, 0.8627451, 1,
1.039888, -1.494127, 3.387484, 1, 0, 0.8588235, 1,
1.047828, -0.518541, 3.425923, 1, 0, 0.8509804, 1,
1.052459, -1.825436, 3.275387, 1, 0, 0.8470588, 1,
1.053227, -0.4412163, 3.080301, 1, 0, 0.8392157, 1,
1.067367, 0.6358513, 0.5834934, 1, 0, 0.8352941, 1,
1.068057, -0.05509131, 1.836072, 1, 0, 0.827451, 1,
1.069317, -0.4826694, 2.900385, 1, 0, 0.8235294, 1,
1.076085, -1.184895, 1.428065, 1, 0, 0.8156863, 1,
1.079776, -0.6058525, 3.538429, 1, 0, 0.8117647, 1,
1.083709, 1.079933, 1.149245, 1, 0, 0.8039216, 1,
1.093719, -1.893622, 2.106331, 1, 0, 0.7960784, 1,
1.096069, 1.743667, 0.9522868, 1, 0, 0.7921569, 1,
1.099427, -0.3847562, 3.248344, 1, 0, 0.7843137, 1,
1.100026, -0.9977026, 1.096105, 1, 0, 0.7803922, 1,
1.103056, -2.7619, 2.818353, 1, 0, 0.772549, 1,
1.107701, -0.0193483, 2.436928, 1, 0, 0.7686275, 1,
1.113487, 1.935061, 0.1942448, 1, 0, 0.7607843, 1,
1.119986, -0.8262624, 2.471071, 1, 0, 0.7568628, 1,
1.120611, -1.254284, 3.308205, 1, 0, 0.7490196, 1,
1.121221, 0.1749079, 2.411137, 1, 0, 0.7450981, 1,
1.123248, -2.79986, 3.947906, 1, 0, 0.7372549, 1,
1.123354, -0.5839149, 3.29717, 1, 0, 0.7333333, 1,
1.124009, 1.072736, -0.2243169, 1, 0, 0.7254902, 1,
1.125414, 1.000574, 0.6198263, 1, 0, 0.7215686, 1,
1.128252, -0.9273376, 3.340142, 1, 0, 0.7137255, 1,
1.130624, 0.8826087, -1.544289, 1, 0, 0.7098039, 1,
1.133738, 1.124819, 0.3852117, 1, 0, 0.7019608, 1,
1.135718, -0.3555751, 1.381324, 1, 0, 0.6941177, 1,
1.142591, -0.5081953, 2.007359, 1, 0, 0.6901961, 1,
1.147794, -0.1834785, 0.8524048, 1, 0, 0.682353, 1,
1.154315, 0.6221824, 0.1853746, 1, 0, 0.6784314, 1,
1.156274, 0.5326911, 0.9606068, 1, 0, 0.6705883, 1,
1.157154, 0.508239, 1.023616, 1, 0, 0.6666667, 1,
1.161021, 0.3225658, 1.838174, 1, 0, 0.6588235, 1,
1.161208, -0.9749607, 2.107078, 1, 0, 0.654902, 1,
1.161281, -0.7198737, 2.933254, 1, 0, 0.6470588, 1,
1.162326, -0.8297501, 1.542624, 1, 0, 0.6431373, 1,
1.163514, 1.882139, 0.6741086, 1, 0, 0.6352941, 1,
1.164572, -3.475486, 3.837726, 1, 0, 0.6313726, 1,
1.178675, -1.00195, 1.004363, 1, 0, 0.6235294, 1,
1.180571, -0.8458573, 2.81818, 1, 0, 0.6196079, 1,
1.198822, 0.8873578, 0.4835744, 1, 0, 0.6117647, 1,
1.200308, 0.4557831, 2.438009, 1, 0, 0.6078432, 1,
1.201741, 0.3334766, 0.7604099, 1, 0, 0.6, 1,
1.201885, 0.02708492, 1.044189, 1, 0, 0.5921569, 1,
1.204306, 1.51584, 1.597024, 1, 0, 0.5882353, 1,
1.208476, -0.2581731, 1.411001, 1, 0, 0.5803922, 1,
1.217098, 1.116645, -1.392289, 1, 0, 0.5764706, 1,
1.217871, -0.5414722, 2.629565, 1, 0, 0.5686275, 1,
1.223989, 0.4358274, -0.1751953, 1, 0, 0.5647059, 1,
1.229006, -0.6380231, 2.209666, 1, 0, 0.5568628, 1,
1.229334, 1.032062, 0.9357942, 1, 0, 0.5529412, 1,
1.230165, -1.89283, 2.207973, 1, 0, 0.5450981, 1,
1.237347, 0.5174474, 0.9908316, 1, 0, 0.5411765, 1,
1.239601, -0.4101299, 3.271875, 1, 0, 0.5333334, 1,
1.244834, -0.9654923, 1.574072, 1, 0, 0.5294118, 1,
1.245983, -0.187007, 1.068629, 1, 0, 0.5215687, 1,
1.269692, -1.355957, 2.515521, 1, 0, 0.5176471, 1,
1.279386, -0.2421049, 2.675892, 1, 0, 0.509804, 1,
1.282738, 0.9396168, -0.03353218, 1, 0, 0.5058824, 1,
1.306656, -0.3375792, 1.788258, 1, 0, 0.4980392, 1,
1.307413, -1.063813, 3.655384, 1, 0, 0.4901961, 1,
1.311844, -1.753657, 1.403725, 1, 0, 0.4862745, 1,
1.325673, 1.06175, 2.266021, 1, 0, 0.4784314, 1,
1.329078, 0.2166665, 0.2240176, 1, 0, 0.4745098, 1,
1.338779, 0.5197105, 2.251176, 1, 0, 0.4666667, 1,
1.345006, 1.174412, -0.6041686, 1, 0, 0.4627451, 1,
1.360392, 0.03485241, 3.264973, 1, 0, 0.454902, 1,
1.364179, -0.1679851, 3.26454, 1, 0, 0.4509804, 1,
1.364321, 0.1995963, 1.827337, 1, 0, 0.4431373, 1,
1.378391, -0.2098917, 2.90535, 1, 0, 0.4392157, 1,
1.394445, -2.010857, 1.73837, 1, 0, 0.4313726, 1,
1.399292, 0.07882686, 1.514273, 1, 0, 0.427451, 1,
1.399554, -0.02666611, 1.382323, 1, 0, 0.4196078, 1,
1.429218, 1.437128, 0.4375692, 1, 0, 0.4156863, 1,
1.462055, -0.4812445, 2.662608, 1, 0, 0.4078431, 1,
1.466356, 0.4149116, 2.221141, 1, 0, 0.4039216, 1,
1.476393, 0.07878016, -0.3438107, 1, 0, 0.3960784, 1,
1.484798, -0.09823737, 1.694536, 1, 0, 0.3882353, 1,
1.485669, -0.7472425, 0.4920827, 1, 0, 0.3843137, 1,
1.495061, -0.8812578, 2.292109, 1, 0, 0.3764706, 1,
1.498974, -0.3359862, 1.734367, 1, 0, 0.372549, 1,
1.499648, 0.9535859, -0.2027802, 1, 0, 0.3647059, 1,
1.505292, -0.7108787, 3.219773, 1, 0, 0.3607843, 1,
1.508566, 0.745138, 1.549635, 1, 0, 0.3529412, 1,
1.545152, -0.3546031, 0.4792455, 1, 0, 0.3490196, 1,
1.549836, 1.129874, 1.691947, 1, 0, 0.3411765, 1,
1.589382, 0.7487905, -1.002195, 1, 0, 0.3372549, 1,
1.611389, -0.5608326, 2.053668, 1, 0, 0.3294118, 1,
1.617007, -0.1187041, 3.422386, 1, 0, 0.3254902, 1,
1.619174, 0.2228657, 1.304396, 1, 0, 0.3176471, 1,
1.625236, 1.120353, -1.306137, 1, 0, 0.3137255, 1,
1.62585, -1.170942, 4.038483, 1, 0, 0.3058824, 1,
1.637212, -0.1338352, 0.7207571, 1, 0, 0.2980392, 1,
1.640323, -0.1983099, 1.32236, 1, 0, 0.2941177, 1,
1.653409, 0.504128, 0.3055847, 1, 0, 0.2862745, 1,
1.655387, -0.8374094, 2.610716, 1, 0, 0.282353, 1,
1.661746, 1.521936, 0.01393463, 1, 0, 0.2745098, 1,
1.668264, -2.017807, 1.591334, 1, 0, 0.2705882, 1,
1.676347, -1.315885, 1.17275, 1, 0, 0.2627451, 1,
1.693773, -1.321051, 2.966708, 1, 0, 0.2588235, 1,
1.69514, -1.17975, 2.882123, 1, 0, 0.2509804, 1,
1.701779, -0.02041654, 1.265013, 1, 0, 0.2470588, 1,
1.726079, -0.753539, 3.360803, 1, 0, 0.2392157, 1,
1.73403, 0.5990664, 4.134125, 1, 0, 0.2352941, 1,
1.738891, 0.7891423, 2.840216, 1, 0, 0.227451, 1,
1.73906, -0.9421225, 0.08276667, 1, 0, 0.2235294, 1,
1.768911, 0.6580977, -0.2078622, 1, 0, 0.2156863, 1,
1.778843, -1.154869, 1.404, 1, 0, 0.2117647, 1,
1.809364, -0.04029602, -0.2428845, 1, 0, 0.2039216, 1,
1.810322, -1.328507, 3.096401, 1, 0, 0.1960784, 1,
1.820848, -0.9753038, 1.904695, 1, 0, 0.1921569, 1,
1.823056, -0.2835252, 0.1817676, 1, 0, 0.1843137, 1,
1.85037, 0.2905122, 2.064672, 1, 0, 0.1803922, 1,
1.858771, -0.3133395, 1.391102, 1, 0, 0.172549, 1,
1.867585, -0.6407323, 0.1590751, 1, 0, 0.1686275, 1,
1.883772, 0.07388606, 1.731454, 1, 0, 0.1607843, 1,
1.893834, 1.05346, 2.63078, 1, 0, 0.1568628, 1,
1.898749, 0.03864726, 0.6812399, 1, 0, 0.1490196, 1,
1.90471, 0.3161809, 1.889149, 1, 0, 0.145098, 1,
1.934099, -1.186323, 1.731374, 1, 0, 0.1372549, 1,
1.967093, 0.8133597, 0.9913721, 1, 0, 0.1333333, 1,
1.992619, -1.941046, 2.647904, 1, 0, 0.1254902, 1,
2.020898, 0.5140286, 0.7148636, 1, 0, 0.1215686, 1,
2.031619, 0.2413876, 2.469924, 1, 0, 0.1137255, 1,
2.084542, 1.569291, 0.6911486, 1, 0, 0.1098039, 1,
2.188353, 1.315281, 1.535223, 1, 0, 0.1019608, 1,
2.228515, 0.2943208, 2.948761, 1, 0, 0.09411765, 1,
2.323703, -0.0006553528, 1.742523, 1, 0, 0.09019608, 1,
2.324503, 0.4525853, 2.884767, 1, 0, 0.08235294, 1,
2.355613, 0.4569485, 2.351974, 1, 0, 0.07843138, 1,
2.390339, -1.416733, 1.686828, 1, 0, 0.07058824, 1,
2.430882, 0.7640413, 2.596569, 1, 0, 0.06666667, 1,
2.48628, -1.761906, 1.147397, 1, 0, 0.05882353, 1,
2.491199, -0.4042982, 1.912278, 1, 0, 0.05490196, 1,
2.492877, 0.2351617, 2.056153, 1, 0, 0.04705882, 1,
2.535932, -1.579707, 1.753369, 1, 0, 0.04313726, 1,
2.553761, 0.5757668, 2.052699, 1, 0, 0.03529412, 1,
2.592722, -1.044931, 1.545802, 1, 0, 0.03137255, 1,
2.702655, -0.4675137, 2.116894, 1, 0, 0.02352941, 1,
2.866024, -1.129736, 2.085629, 1, 0, 0.01960784, 1,
3.006917, -1.980183, 1.82764, 1, 0, 0.01176471, 1,
3.066632, 1.729037, 1.778081, 1, 0, 0.007843138, 1
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
-0.02064717, -5.018838, -7.425569, 0, -0.5, 0.5, 0.5,
-0.02064717, -5.018838, -7.425569, 1, -0.5, 0.5, 0.5,
-0.02064717, -5.018838, -7.425569, 1, 1.5, 0.5, 0.5,
-0.02064717, -5.018838, -7.425569, 0, 1.5, 0.5, 0.5
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
-4.154514, -0.2782458, -7.425569, 0, -0.5, 0.5, 0.5,
-4.154514, -0.2782458, -7.425569, 1, -0.5, 0.5, 0.5,
-4.154514, -0.2782458, -7.425569, 1, 1.5, 0.5, 0.5,
-4.154514, -0.2782458, -7.425569, 0, 1.5, 0.5, 0.5
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
-4.154514, -5.018838, -0.03371382, 0, -0.5, 0.5, 0.5,
-4.154514, -5.018838, -0.03371382, 1, -0.5, 0.5, 0.5,
-4.154514, -5.018838, -0.03371382, 1, 1.5, 0.5, 0.5,
-4.154514, -5.018838, -0.03371382, 0, 1.5, 0.5, 0.5
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
-3, -3.924855, -5.719756,
3, -3.924855, -5.719756,
-3, -3.924855, -5.719756,
-3, -4.107186, -6.004058,
-2, -3.924855, -5.719756,
-2, -4.107186, -6.004058,
-1, -3.924855, -5.719756,
-1, -4.107186, -6.004058,
0, -3.924855, -5.719756,
0, -4.107186, -6.004058,
1, -3.924855, -5.719756,
1, -4.107186, -6.004058,
2, -3.924855, -5.719756,
2, -4.107186, -6.004058,
3, -3.924855, -5.719756,
3, -4.107186, -6.004058
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
-3, -4.471847, -6.572663, 0, -0.5, 0.5, 0.5,
-3, -4.471847, -6.572663, 1, -0.5, 0.5, 0.5,
-3, -4.471847, -6.572663, 1, 1.5, 0.5, 0.5,
-3, -4.471847, -6.572663, 0, 1.5, 0.5, 0.5,
-2, -4.471847, -6.572663, 0, -0.5, 0.5, 0.5,
-2, -4.471847, -6.572663, 1, -0.5, 0.5, 0.5,
-2, -4.471847, -6.572663, 1, 1.5, 0.5, 0.5,
-2, -4.471847, -6.572663, 0, 1.5, 0.5, 0.5,
-1, -4.471847, -6.572663, 0, -0.5, 0.5, 0.5,
-1, -4.471847, -6.572663, 1, -0.5, 0.5, 0.5,
-1, -4.471847, -6.572663, 1, 1.5, 0.5, 0.5,
-1, -4.471847, -6.572663, 0, 1.5, 0.5, 0.5,
0, -4.471847, -6.572663, 0, -0.5, 0.5, 0.5,
0, -4.471847, -6.572663, 1, -0.5, 0.5, 0.5,
0, -4.471847, -6.572663, 1, 1.5, 0.5, 0.5,
0, -4.471847, -6.572663, 0, 1.5, 0.5, 0.5,
1, -4.471847, -6.572663, 0, -0.5, 0.5, 0.5,
1, -4.471847, -6.572663, 1, -0.5, 0.5, 0.5,
1, -4.471847, -6.572663, 1, 1.5, 0.5, 0.5,
1, -4.471847, -6.572663, 0, 1.5, 0.5, 0.5,
2, -4.471847, -6.572663, 0, -0.5, 0.5, 0.5,
2, -4.471847, -6.572663, 1, -0.5, 0.5, 0.5,
2, -4.471847, -6.572663, 1, 1.5, 0.5, 0.5,
2, -4.471847, -6.572663, 0, 1.5, 0.5, 0.5,
3, -4.471847, -6.572663, 0, -0.5, 0.5, 0.5,
3, -4.471847, -6.572663, 1, -0.5, 0.5, 0.5,
3, -4.471847, -6.572663, 1, 1.5, 0.5, 0.5,
3, -4.471847, -6.572663, 0, 1.5, 0.5, 0.5
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
-3.200545, -2, -5.719756,
-3.200545, 2, -5.719756,
-3.200545, -2, -5.719756,
-3.35954, -2, -6.004058,
-3.200545, 0, -5.719756,
-3.35954, 0, -6.004058,
-3.200545, 2, -5.719756,
-3.35954, 2, -6.004058
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
-3.67753, -2, -6.572663, 0, -0.5, 0.5, 0.5,
-3.67753, -2, -6.572663, 1, -0.5, 0.5, 0.5,
-3.67753, -2, -6.572663, 1, 1.5, 0.5, 0.5,
-3.67753, -2, -6.572663, 0, 1.5, 0.5, 0.5,
-3.67753, 0, -6.572663, 0, -0.5, 0.5, 0.5,
-3.67753, 0, -6.572663, 1, -0.5, 0.5, 0.5,
-3.67753, 0, -6.572663, 1, 1.5, 0.5, 0.5,
-3.67753, 0, -6.572663, 0, 1.5, 0.5, 0.5,
-3.67753, 2, -6.572663, 0, -0.5, 0.5, 0.5,
-3.67753, 2, -6.572663, 1, -0.5, 0.5, 0.5,
-3.67753, 2, -6.572663, 1, 1.5, 0.5, 0.5,
-3.67753, 2, -6.572663, 0, 1.5, 0.5, 0.5
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
-3.200545, -3.924855, -4,
-3.200545, -3.924855, 4,
-3.200545, -3.924855, -4,
-3.35954, -4.107186, -4,
-3.200545, -3.924855, -2,
-3.35954, -4.107186, -2,
-3.200545, -3.924855, 0,
-3.35954, -4.107186, 0,
-3.200545, -3.924855, 2,
-3.35954, -4.107186, 2,
-3.200545, -3.924855, 4,
-3.35954, -4.107186, 4
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
-3.67753, -4.471847, -4, 0, -0.5, 0.5, 0.5,
-3.67753, -4.471847, -4, 1, -0.5, 0.5, 0.5,
-3.67753, -4.471847, -4, 1, 1.5, 0.5, 0.5,
-3.67753, -4.471847, -4, 0, 1.5, 0.5, 0.5,
-3.67753, -4.471847, -2, 0, -0.5, 0.5, 0.5,
-3.67753, -4.471847, -2, 1, -0.5, 0.5, 0.5,
-3.67753, -4.471847, -2, 1, 1.5, 0.5, 0.5,
-3.67753, -4.471847, -2, 0, 1.5, 0.5, 0.5,
-3.67753, -4.471847, 0, 0, -0.5, 0.5, 0.5,
-3.67753, -4.471847, 0, 1, -0.5, 0.5, 0.5,
-3.67753, -4.471847, 0, 1, 1.5, 0.5, 0.5,
-3.67753, -4.471847, 0, 0, 1.5, 0.5, 0.5,
-3.67753, -4.471847, 2, 0, -0.5, 0.5, 0.5,
-3.67753, -4.471847, 2, 1, -0.5, 0.5, 0.5,
-3.67753, -4.471847, 2, 1, 1.5, 0.5, 0.5,
-3.67753, -4.471847, 2, 0, 1.5, 0.5, 0.5,
-3.67753, -4.471847, 4, 0, -0.5, 0.5, 0.5,
-3.67753, -4.471847, 4, 1, -0.5, 0.5, 0.5,
-3.67753, -4.471847, 4, 1, 1.5, 0.5, 0.5,
-3.67753, -4.471847, 4, 0, 1.5, 0.5, 0.5
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
-3.200545, -3.924855, -5.719756,
-3.200545, 3.368364, -5.719756,
-3.200545, -3.924855, 5.652328,
-3.200545, 3.368364, 5.652328,
-3.200545, -3.924855, -5.719756,
-3.200545, -3.924855, 5.652328,
-3.200545, 3.368364, -5.719756,
-3.200545, 3.368364, 5.652328,
-3.200545, -3.924855, -5.719756,
3.159251, -3.924855, -5.719756,
-3.200545, -3.924855, 5.652328,
3.159251, -3.924855, 5.652328,
-3.200545, 3.368364, -5.719756,
3.159251, 3.368364, -5.719756,
-3.200545, 3.368364, 5.652328,
3.159251, 3.368364, 5.652328,
3.159251, -3.924855, -5.719756,
3.159251, 3.368364, -5.719756,
3.159251, -3.924855, 5.652328,
3.159251, 3.368364, 5.652328,
3.159251, -3.924855, -5.719756,
3.159251, -3.924855, 5.652328,
3.159251, 3.368364, -5.719756,
3.159251, 3.368364, 5.652328
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
var radius = 7.973358;
var distance = 35.47437;
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
mvMatrix.translate( 0.02064717, 0.2782458, 0.03371382 );
mvMatrix.scale( 1.355539, 1.18205, 0.75808 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -35.47437);
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
tiocarbazil<-read.table("tiocarbazil.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tiocarbazil$V2
```

```
## Error in eval(expr, envir, enclos): object 'tiocarbazil' not found
```

```r
y<-tiocarbazil$V3
```

```
## Error in eval(expr, envir, enclos): object 'tiocarbazil' not found
```

```r
z<-tiocarbazil$V4
```

```
## Error in eval(expr, envir, enclos): object 'tiocarbazil' not found
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
-3.107927, -1.796789, -1.191267, 0, 0, 1, 1, 1,
-3.018049, -0.09254716, -3.197383, 1, 0, 0, 1, 1,
-3.001971, -0.3842568, -3.615251, 1, 0, 0, 1, 1,
-2.782993, 0.5367245, -3.005884, 1, 0, 0, 1, 1,
-2.728724, -0.2203563, -1.808481, 1, 0, 0, 1, 1,
-2.619999, -1.459416, -0.08574404, 1, 0, 0, 1, 1,
-2.551331, -1.628718, -2.401878, 0, 0, 0, 1, 1,
-2.41751, -0.06863495, -0.2340886, 0, 0, 0, 1, 1,
-2.340822, 0.1207951, -1.629222, 0, 0, 0, 1, 1,
-2.287403, -0.4152542, -1.652292, 0, 0, 0, 1, 1,
-2.279346, 0.1415296, -3.150064, 0, 0, 0, 1, 1,
-2.274909, 1.125588, -1.224101, 0, 0, 0, 1, 1,
-2.265203, -0.2992669, -0.5985229, 0, 0, 0, 1, 1,
-2.253903, -0.7625777, -2.258177, 1, 1, 1, 1, 1,
-2.161878, -0.3564497, -1.213354, 1, 1, 1, 1, 1,
-2.152755, -0.8978165, -0.639895, 1, 1, 1, 1, 1,
-2.150023, 0.4256284, -2.153461, 1, 1, 1, 1, 1,
-2.138603, 1.426003, -1.419895, 1, 1, 1, 1, 1,
-2.137691, 1.267058, -1.46806, 1, 1, 1, 1, 1,
-2.116616, 1.600664, 0.8776019, 1, 1, 1, 1, 1,
-2.114832, 0.1056058, -1.232839, 1, 1, 1, 1, 1,
-2.111864, -0.7231491, -1.595789, 1, 1, 1, 1, 1,
-2.078062, -0.7359232, -1.585384, 1, 1, 1, 1, 1,
-2.070694, -1.314937, -2.539009, 1, 1, 1, 1, 1,
-2.022626, 0.1788188, -1.338676, 1, 1, 1, 1, 1,
-1.998005, -1.017134, -2.432146, 1, 1, 1, 1, 1,
-1.989012, -1.698021, -1.432384, 1, 1, 1, 1, 1,
-1.985084, 1.92618, -1.075484, 1, 1, 1, 1, 1,
-1.984428, 0.7804067, -1.321552, 0, 0, 1, 1, 1,
-1.98202, -0.1376115, -2.732087, 1, 0, 0, 1, 1,
-1.936318, 0.9115466, -1.235634, 1, 0, 0, 1, 1,
-1.934666, 0.002148602, -2.100918, 1, 0, 0, 1, 1,
-1.932009, 2.252129, -1.538964, 1, 0, 0, 1, 1,
-1.931362, 1.092391, -2.512664, 1, 0, 0, 1, 1,
-1.911792, 0.8564054, -1.576548, 0, 0, 0, 1, 1,
-1.908132, -0.05500966, -2.819354, 0, 0, 0, 1, 1,
-1.895009, 0.5560855, -1.166282, 0, 0, 0, 1, 1,
-1.89019, -0.169987, -2.027954, 0, 0, 0, 1, 1,
-1.866724, -1.412071, -1.448269, 0, 0, 0, 1, 1,
-1.864888, 1.190241, -1.818526, 0, 0, 0, 1, 1,
-1.850877, 1.530281, -1.356238, 0, 0, 0, 1, 1,
-1.840168, 0.6520662, 0.1365954, 1, 1, 1, 1, 1,
-1.827833, -1.083477, -2.815366, 1, 1, 1, 1, 1,
-1.820931, -2.175623, -3.863919, 1, 1, 1, 1, 1,
-1.801424, 0.002854195, -1.397622, 1, 1, 1, 1, 1,
-1.800777, 0.2144902, -0.8096736, 1, 1, 1, 1, 1,
-1.785712, -0.9773155, -0.3565786, 1, 1, 1, 1, 1,
-1.768457, 2.131433, -0.2833232, 1, 1, 1, 1, 1,
-1.726201, 0.4959134, -1.408047, 1, 1, 1, 1, 1,
-1.721329, -0.2300931, -0.93279, 1, 1, 1, 1, 1,
-1.719486, -0.4416077, -2.423032, 1, 1, 1, 1, 1,
-1.717597, 0.1709397, 1.310188, 1, 1, 1, 1, 1,
-1.711253, 0.3216982, -0.1374283, 1, 1, 1, 1, 1,
-1.707392, 3.262152, -0.9988116, 1, 1, 1, 1, 1,
-1.700834, -0.846911, -1.178009, 1, 1, 1, 1, 1,
-1.693437, -1.266703, -2.884612, 1, 1, 1, 1, 1,
-1.685374, 2.122948, 1.035474, 0, 0, 1, 1, 1,
-1.678116, 0.5892146, -0.9131832, 1, 0, 0, 1, 1,
-1.678037, 0.01102838, -0.5258666, 1, 0, 0, 1, 1,
-1.654697, -1.019722, -0.9200492, 1, 0, 0, 1, 1,
-1.645702, 1.437247, -1.648554, 1, 0, 0, 1, 1,
-1.643965, 1.347799, -2.162948, 1, 0, 0, 1, 1,
-1.640915, -1.236646, -2.770853, 0, 0, 0, 1, 1,
-1.631985, -0.900928, -3.488021, 0, 0, 0, 1, 1,
-1.618246, -0.786741, -1.508002, 0, 0, 0, 1, 1,
-1.603598, -1.66398, -2.388994, 0, 0, 0, 1, 1,
-1.598187, 0.1164265, 0.7746285, 0, 0, 0, 1, 1,
-1.578542, -0.1010082, -2.761634, 0, 0, 0, 1, 1,
-1.576716, -3.818643, -3.581013, 0, 0, 0, 1, 1,
-1.575152, 0.4250196, -2.434877, 1, 1, 1, 1, 1,
-1.55862, 1.547916, -2.265319, 1, 1, 1, 1, 1,
-1.551955, 0.414896, -0.8258898, 1, 1, 1, 1, 1,
-1.547471, 0.494826, -2.082442, 1, 1, 1, 1, 1,
-1.544045, 1.854259, 0.3460842, 1, 1, 1, 1, 1,
-1.531089, -1.438186, -4.387348, 1, 1, 1, 1, 1,
-1.524109, -0.8541617, -2.513781, 1, 1, 1, 1, 1,
-1.521761, 0.1032862, -1.948583, 1, 1, 1, 1, 1,
-1.511011, 1.559667, -0.4352752, 1, 1, 1, 1, 1,
-1.499462, -0.7388246, -1.489147, 1, 1, 1, 1, 1,
-1.498845, 0.2198368, -1.434968, 1, 1, 1, 1, 1,
-1.498771, 1.239803, 0.9113248, 1, 1, 1, 1, 1,
-1.491335, 0.8398276, -0.6791548, 1, 1, 1, 1, 1,
-1.486557, -0.6462133, -1.129699, 1, 1, 1, 1, 1,
-1.471907, -1.719685, -2.501478, 1, 1, 1, 1, 1,
-1.471056, -1.404922, -1.718119, 0, 0, 1, 1, 1,
-1.467946, 0.09156685, -0.6940601, 1, 0, 0, 1, 1,
-1.458107, -1.008039, 0.4567803, 1, 0, 0, 1, 1,
-1.457493, 2.411559, -0.3761193, 1, 0, 0, 1, 1,
-1.449689, 1.439126, -1.494608, 1, 0, 0, 1, 1,
-1.449655, 2.098864, -0.7835657, 1, 0, 0, 1, 1,
-1.449187, -0.08425337, -1.971002, 0, 0, 0, 1, 1,
-1.444073, 0.4448536, -3.196512, 0, 0, 0, 1, 1,
-1.443438, 0.736751, -0.8289368, 0, 0, 0, 1, 1,
-1.439775, -1.943028, -1.688475, 0, 0, 0, 1, 1,
-1.436935, -0.3224202, -1.477688, 0, 0, 0, 1, 1,
-1.416352, -1.121577, -1.482773, 0, 0, 0, 1, 1,
-1.414419, -0.07600085, -1.191458, 0, 0, 0, 1, 1,
-1.410101, 0.2523024, -3.383983, 1, 1, 1, 1, 1,
-1.40461, 2.50767, -0.8910291, 1, 1, 1, 1, 1,
-1.401265, 0.09458807, -0.3100835, 1, 1, 1, 1, 1,
-1.397629, 0.6556039, -2.321501, 1, 1, 1, 1, 1,
-1.391515, 0.6039332, -0.2191281, 1, 1, 1, 1, 1,
-1.39082, 0.2178773, -1.639112, 1, 1, 1, 1, 1,
-1.385851, -0.2589503, -1.302547, 1, 1, 1, 1, 1,
-1.37404, -1.373121, -1.533746, 1, 1, 1, 1, 1,
-1.373503, 0.208193, -2.403383, 1, 1, 1, 1, 1,
-1.358473, 0.5482681, -1.281599, 1, 1, 1, 1, 1,
-1.353163, -0.7388467, -0.9958732, 1, 1, 1, 1, 1,
-1.350958, -0.5167553, -1.054446, 1, 1, 1, 1, 1,
-1.346663, -0.4717462, -1.113496, 1, 1, 1, 1, 1,
-1.340567, 0.1973357, -1.882632, 1, 1, 1, 1, 1,
-1.338388, -0.9548898, -2.794217, 1, 1, 1, 1, 1,
-1.336555, 0.04690945, -1.497324, 0, 0, 1, 1, 1,
-1.336218, 1.51016, -0.6886606, 1, 0, 0, 1, 1,
-1.311189, 0.5385903, -1.43774, 1, 0, 0, 1, 1,
-1.308426, -0.7575538, -3.194225, 1, 0, 0, 1, 1,
-1.301972, -0.7045266, -2.699098, 1, 0, 0, 1, 1,
-1.299896, -0.4042664, -0.8263456, 1, 0, 0, 1, 1,
-1.299629, -0.9396689, -1.659714, 0, 0, 0, 1, 1,
-1.293942, 0.2035727, -2.640905, 0, 0, 0, 1, 1,
-1.290587, 0.7477636, 0.1098209, 0, 0, 0, 1, 1,
-1.285429, 0.6666987, -1.362255, 0, 0, 0, 1, 1,
-1.269503, -0.9212225, -2.185254, 0, 0, 0, 1, 1,
-1.267191, -0.1258142, -2.499311, 0, 0, 0, 1, 1,
-1.253179, 0.5904561, -1.799898, 0, 0, 0, 1, 1,
-1.252671, -0.981663, -1.425286, 1, 1, 1, 1, 1,
-1.244788, 1.714015, -1.876523, 1, 1, 1, 1, 1,
-1.244119, 0.7896777, -0.1601188, 1, 1, 1, 1, 1,
-1.235633, -0.6663821, -2.847479, 1, 1, 1, 1, 1,
-1.234586, -0.1749639, -2.257898, 1, 1, 1, 1, 1,
-1.233654, 0.9708715, -0.9091909, 1, 1, 1, 1, 1,
-1.22346, -0.6378206, -1.015667, 1, 1, 1, 1, 1,
-1.222088, 1.032592, -1.12693, 1, 1, 1, 1, 1,
-1.219498, 0.4638506, -2.362842, 1, 1, 1, 1, 1,
-1.217384, 0.1819414, -1.64884, 1, 1, 1, 1, 1,
-1.217044, -0.1090697, -2.858103, 1, 1, 1, 1, 1,
-1.214056, -0.9309717, -3.609091, 1, 1, 1, 1, 1,
-1.213909, 1.414158, -0.4168094, 1, 1, 1, 1, 1,
-1.199594, -0.8472655, -3.750975, 1, 1, 1, 1, 1,
-1.192476, 0.5291713, -0.476054, 1, 1, 1, 1, 1,
-1.180098, -1.727569, -0.2955624, 0, 0, 1, 1, 1,
-1.174554, -0.6224069, -2.415447, 1, 0, 0, 1, 1,
-1.166579, 1.558763, -0.4754992, 1, 0, 0, 1, 1,
-1.164251, 0.5671693, -2.644552, 1, 0, 0, 1, 1,
-1.15915, -1.835401, -3.385802, 1, 0, 0, 1, 1,
-1.14872, 0.8335053, -0.6466665, 1, 0, 0, 1, 1,
-1.135256, -2.370774, -4.653124, 0, 0, 0, 1, 1,
-1.130759, -0.1370654, -0.6885409, 0, 0, 0, 1, 1,
-1.129951, 0.6628679, 0.01558531, 0, 0, 0, 1, 1,
-1.129069, 1.613911, -0.7975905, 0, 0, 0, 1, 1,
-1.124745, 1.091516, -2.35365, 0, 0, 0, 1, 1,
-1.123281, 0.5134709, -2.183675, 0, 0, 0, 1, 1,
-1.105749, -0.8211572, -1.562975, 0, 0, 0, 1, 1,
-1.102202, 0.4054384, -0.3723206, 1, 1, 1, 1, 1,
-1.100509, 0.526525, -2.621546, 1, 1, 1, 1, 1,
-1.100416, -0.9972882, -1.380353, 1, 1, 1, 1, 1,
-1.100341, 0.4606124, 0.6727706, 1, 1, 1, 1, 1,
-1.09899, -0.9174266, -0.7287427, 1, 1, 1, 1, 1,
-1.093282, 0.3521845, -0.4750955, 1, 1, 1, 1, 1,
-1.091069, -1.93462, -4.067009, 1, 1, 1, 1, 1,
-1.081864, -0.9101795, -2.062313, 1, 1, 1, 1, 1,
-1.08175, -1.435469, -3.159343, 1, 1, 1, 1, 1,
-1.079008, -1.551786, -0.7852331, 1, 1, 1, 1, 1,
-1.075704, 0.4671342, -1.795785, 1, 1, 1, 1, 1,
-1.069217, 0.0428998, -1.221851, 1, 1, 1, 1, 1,
-1.064397, 0.7243772, -0.7428443, 1, 1, 1, 1, 1,
-1.040887, 2.093354, -0.6698914, 1, 1, 1, 1, 1,
-1.03128, -0.4844802, -2.452673, 1, 1, 1, 1, 1,
-1.015021, 0.6743042, -1.983454, 0, 0, 1, 1, 1,
-1.013498, 0.1033003, 1.956399, 1, 0, 0, 1, 1,
-1.013084, -1.643122, -1.373044, 1, 0, 0, 1, 1,
-1.012819, 1.363875, 0.01176265, 1, 0, 0, 1, 1,
-1.012543, -0.04569569, -2.288059, 1, 0, 0, 1, 1,
-1.012027, -1.065677, -2.785556, 1, 0, 0, 1, 1,
-1.009294, 0.5165688, -1.297929, 0, 0, 0, 1, 1,
-1.006067, 0.5290588, -0.7296329, 0, 0, 0, 1, 1,
-1.000969, 0.6791988, -1.107968, 0, 0, 0, 1, 1,
-1.000033, -1.452837, -2.166267, 0, 0, 0, 1, 1,
-0.9975342, -0.0396729, -2.263419, 0, 0, 0, 1, 1,
-0.9929253, -1.96695, -2.379959, 0, 0, 0, 1, 1,
-0.9900547, 0.4157157, -0.9308469, 0, 0, 0, 1, 1,
-0.9887798, 0.4923435, -1.42144, 1, 1, 1, 1, 1,
-0.9861832, -0.1490651, -1.281309, 1, 1, 1, 1, 1,
-0.9855328, 1.292306, -0.4995089, 1, 1, 1, 1, 1,
-0.9829439, -0.6055226, -1.559481, 1, 1, 1, 1, 1,
-0.9822488, 0.9113322, -2.656694, 1, 1, 1, 1, 1,
-0.9712967, -0.1295273, -3.138583, 1, 1, 1, 1, 1,
-0.9662029, 0.7916126, -1.017696, 1, 1, 1, 1, 1,
-0.9651483, -0.6441856, -1.778708, 1, 1, 1, 1, 1,
-0.9573133, -1.097427, -1.481332, 1, 1, 1, 1, 1,
-0.9528725, 0.4358026, -1.020739, 1, 1, 1, 1, 1,
-0.9442484, 1.164373, 0.6388081, 1, 1, 1, 1, 1,
-0.9420986, 1.294679, 0.250091, 1, 1, 1, 1, 1,
-0.942061, -1.100126, -3.057723, 1, 1, 1, 1, 1,
-0.9405363, -1.479066, -0.6259419, 1, 1, 1, 1, 1,
-0.938437, 0.312388, -1.42593, 1, 1, 1, 1, 1,
-0.938282, -0.8409319, -1.159852, 0, 0, 1, 1, 1,
-0.9358814, -1.582325, -1.741626, 1, 0, 0, 1, 1,
-0.9337256, -0.04421925, -0.965679, 1, 0, 0, 1, 1,
-0.9296801, -0.003943033, -1.171031, 1, 0, 0, 1, 1,
-0.9259655, 1.054453, -0.471026, 1, 0, 0, 1, 1,
-0.9240737, 0.9629472, -0.6857034, 1, 0, 0, 1, 1,
-0.9212213, 0.7428938, -1.356707, 0, 0, 0, 1, 1,
-0.9204197, -1.749502, -3.978288, 0, 0, 0, 1, 1,
-0.9101078, -0.2733123, -2.055964, 0, 0, 0, 1, 1,
-0.9098474, 1.892826, 0.6233799, 0, 0, 0, 1, 1,
-0.906902, -0.06788077, -1.151506, 0, 0, 0, 1, 1,
-0.9031792, 1.558168, -2.202219, 0, 0, 0, 1, 1,
-0.9028986, -0.8656378, -1.008132, 0, 0, 0, 1, 1,
-0.9012211, 0.2130932, -1.503105, 1, 1, 1, 1, 1,
-0.8996869, 1.228113, 1.031427, 1, 1, 1, 1, 1,
-0.8901355, -0.2725251, -3.361009, 1, 1, 1, 1, 1,
-0.8869945, -0.7124127, -2.650309, 1, 1, 1, 1, 1,
-0.8816912, 0.5057646, -0.9749146, 1, 1, 1, 1, 1,
-0.8682829, 1.352914, -0.2944996, 1, 1, 1, 1, 1,
-0.8658572, -0.1145589, -1.780294, 1, 1, 1, 1, 1,
-0.8638422, -0.02847616, -3.172652, 1, 1, 1, 1, 1,
-0.8515697, -0.2003481, -3.400513, 1, 1, 1, 1, 1,
-0.8475713, 0.7060871, -2.153065, 1, 1, 1, 1, 1,
-0.8473287, 0.01281718, -1.208109, 1, 1, 1, 1, 1,
-0.8431031, 0.650452, 0.5448238, 1, 1, 1, 1, 1,
-0.8399496, -1.703621, -4.02977, 1, 1, 1, 1, 1,
-0.837646, 0.5542744, -0.1949352, 1, 1, 1, 1, 1,
-0.8356329, 1.22958, -1.037669, 1, 1, 1, 1, 1,
-0.8339136, 1.147304, -0.8843892, 0, 0, 1, 1, 1,
-0.8242428, -0.4009603, -1.46543, 1, 0, 0, 1, 1,
-0.8215663, 2.062791, -0.01841489, 1, 0, 0, 1, 1,
-0.8215231, -1.354973, -2.478372, 1, 0, 0, 1, 1,
-0.8175091, -0.4170456, -2.611967, 1, 0, 0, 1, 1,
-0.8166598, -1.526097, -1.356589, 1, 0, 0, 1, 1,
-0.8155243, -0.7351136, -3.092042, 0, 0, 0, 1, 1,
-0.8148752, -1.762363, -1.521328, 0, 0, 0, 1, 1,
-0.8114963, 2.150054, -0.1152357, 0, 0, 0, 1, 1,
-0.8068215, -0.3510298, -2.042634, 0, 0, 0, 1, 1,
-0.8049732, -0.9146411, -2.70509, 0, 0, 0, 1, 1,
-0.7978398, -0.7040535, -0.8551761, 0, 0, 0, 1, 1,
-0.7975196, -2.115817, -2.506322, 0, 0, 0, 1, 1,
-0.7970401, 0.3459265, -1.418983, 1, 1, 1, 1, 1,
-0.7925975, 0.1902046, -1.585628, 1, 1, 1, 1, 1,
-0.7910435, -1.284392, -3.222244, 1, 1, 1, 1, 1,
-0.7899199, -0.01256464, -0.9807552, 1, 1, 1, 1, 1,
-0.7882347, -0.3315373, -3.029065, 1, 1, 1, 1, 1,
-0.7870105, -0.5395527, -3.120042, 1, 1, 1, 1, 1,
-0.7853096, -0.06166154, -2.557631, 1, 1, 1, 1, 1,
-0.7839182, 0.6439152, -1.15468, 1, 1, 1, 1, 1,
-0.7837732, -0.4307955, -1.877175, 1, 1, 1, 1, 1,
-0.7813202, 0.8036742, -2.704068, 1, 1, 1, 1, 1,
-0.7795198, -0.2222438, -1.074002, 1, 1, 1, 1, 1,
-0.7738599, -0.0899184, -1.697645, 1, 1, 1, 1, 1,
-0.7691912, 0.2175558, -1.350376, 1, 1, 1, 1, 1,
-0.7689472, -1.358612, -5.449839, 1, 1, 1, 1, 1,
-0.7616318, 0.3052288, -1.188487, 1, 1, 1, 1, 1,
-0.7551526, 0.4288099, -0.7007979, 0, 0, 1, 1, 1,
-0.7506527, 0.7699347, 0.705691, 1, 0, 0, 1, 1,
-0.7500074, -0.1833945, -2.240217, 1, 0, 0, 1, 1,
-0.7473932, -0.8200462, -4.211887, 1, 0, 0, 1, 1,
-0.7456063, -0.8131412, -3.238145, 1, 0, 0, 1, 1,
-0.7410023, -2.557741, -2.620667, 1, 0, 0, 1, 1,
-0.7354891, -0.3728183, -1.503715, 0, 0, 0, 1, 1,
-0.7328994, 0.6173629, -1.700215, 0, 0, 0, 1, 1,
-0.7298555, 0.09280342, -1.564353, 0, 0, 0, 1, 1,
-0.727051, 0.6584939, -0.1589509, 0, 0, 0, 1, 1,
-0.7187819, 1.066179, -0.960666, 0, 0, 0, 1, 1,
-0.7169442, -0.2458582, -2.218953, 0, 0, 0, 1, 1,
-0.7166295, -0.2276008, -1.269027, 0, 0, 0, 1, 1,
-0.7162284, 0.2244356, -2.177808, 1, 1, 1, 1, 1,
-0.7159612, 0.2886462, -1.930492, 1, 1, 1, 1, 1,
-0.7152452, 0.1601679, -1.421826, 1, 1, 1, 1, 1,
-0.7139925, 0.52578, -2.334885, 1, 1, 1, 1, 1,
-0.709911, 1.40819, -1.23027, 1, 1, 1, 1, 1,
-0.7086816, 0.6559334, 0.4615936, 1, 1, 1, 1, 1,
-0.6973537, 1.121831, -2.872904, 1, 1, 1, 1, 1,
-0.6952937, -0.268281, -2.226792, 1, 1, 1, 1, 1,
-0.6901946, -1.155167, -3.765643, 1, 1, 1, 1, 1,
-0.6896999, 0.6149898, -0.8235897, 1, 1, 1, 1, 1,
-0.6831794, -0.4256905, -3.423696, 1, 1, 1, 1, 1,
-0.6726149, -1.136017, -2.909224, 1, 1, 1, 1, 1,
-0.6723192, 0.03340679, -1.580408, 1, 1, 1, 1, 1,
-0.6680165, 0.3996883, -0.2034454, 1, 1, 1, 1, 1,
-0.6655974, -0.002003056, -1.127449, 1, 1, 1, 1, 1,
-0.6589037, 1.065228, -0.5478784, 0, 0, 1, 1, 1,
-0.6585853, 0.698777, 0.1455045, 1, 0, 0, 1, 1,
-0.656813, -1.946018, -1.996896, 1, 0, 0, 1, 1,
-0.6462159, 0.963279, -0.5318771, 1, 0, 0, 1, 1,
-0.6418828, -0.06373122, -3.428838, 1, 0, 0, 1, 1,
-0.6371272, -1.381577, -4.471359, 1, 0, 0, 1, 1,
-0.6364961, 1.209363, -0.9055405, 0, 0, 0, 1, 1,
-0.6340359, 0.2563042, 0.6332106, 0, 0, 0, 1, 1,
-0.6334354, -0.2651716, -2.079481, 0, 0, 0, 1, 1,
-0.6326764, -0.6712837, -2.720748, 0, 0, 0, 1, 1,
-0.6283723, -2.087448, -3.728665, 0, 0, 0, 1, 1,
-0.6281996, 0.2766441, -0.9086211, 0, 0, 0, 1, 1,
-0.613092, -0.5920646, -4.722073, 0, 0, 0, 1, 1,
-0.6123912, -0.859486, -3.353477, 1, 1, 1, 1, 1,
-0.6102134, -0.1824108, -2.152074, 1, 1, 1, 1, 1,
-0.6096656, 0.9288809, -2.218853, 1, 1, 1, 1, 1,
-0.607493, 0.238317, 0.5212977, 1, 1, 1, 1, 1,
-0.6040657, 0.3205543, -0.1358626, 1, 1, 1, 1, 1,
-0.6037763, 0.8834113, 0.4980021, 1, 1, 1, 1, 1,
-0.6034949, 1.074893, 0.3710771, 1, 1, 1, 1, 1,
-0.6031876, 1.081149, -1.459153, 1, 1, 1, 1, 1,
-0.6002327, 1.103634, 1.178386, 1, 1, 1, 1, 1,
-0.5994604, -0.4961325, -1.943327, 1, 1, 1, 1, 1,
-0.5980904, -0.0315614, -3.388683, 1, 1, 1, 1, 1,
-0.5901556, 2.143336, -0.03223544, 1, 1, 1, 1, 1,
-0.5859166, -1.715439, -3.050492, 1, 1, 1, 1, 1,
-0.5853747, 0.06069809, -2.127376, 1, 1, 1, 1, 1,
-0.5823742, 0.2437658, -0.9826093, 1, 1, 1, 1, 1,
-0.5823097, -0.4130741, -3.315628, 0, 0, 1, 1, 1,
-0.5817447, -0.104277, -0.4517862, 1, 0, 0, 1, 1,
-0.5809135, 0.9832807, -2.798812, 1, 0, 0, 1, 1,
-0.5795914, -0.6784355, -2.088584, 1, 0, 0, 1, 1,
-0.5793365, 1.589784, 1.293957, 1, 0, 0, 1, 1,
-0.5773599, -1.389376, -1.423221, 1, 0, 0, 1, 1,
-0.5764053, 0.4391874, -0.1984732, 0, 0, 0, 1, 1,
-0.574051, 2.080081, 0.2519358, 0, 0, 0, 1, 1,
-0.5710081, 0.1084868, -1.675449, 0, 0, 0, 1, 1,
-0.5709042, 1.218469, -0.01742133, 0, 0, 0, 1, 1,
-0.5668329, -0.2670718, -1.536408, 0, 0, 0, 1, 1,
-0.5634111, 0.3973119, -0.1491655, 0, 0, 0, 1, 1,
-0.561813, -1.879688, -2.720937, 0, 0, 0, 1, 1,
-0.5585856, 0.5505068, 0.04622056, 1, 1, 1, 1, 1,
-0.5521256, 2.524427, 0.8149369, 1, 1, 1, 1, 1,
-0.5510116, 1.04674, 0.8270037, 1, 1, 1, 1, 1,
-0.5509369, -0.3227124, -0.5238835, 1, 1, 1, 1, 1,
-0.5508446, 0.9040825, -0.8057963, 1, 1, 1, 1, 1,
-0.548915, 0.4581555, -0.509306, 1, 1, 1, 1, 1,
-0.5431498, 0.07866212, -1.431872, 1, 1, 1, 1, 1,
-0.5391741, -1.078678, -0.9915004, 1, 1, 1, 1, 1,
-0.5385267, 1.444548, -0.1369847, 1, 1, 1, 1, 1,
-0.5343578, -0.4176801, -4.410169, 1, 1, 1, 1, 1,
-0.531456, 1.976238, 0.3440936, 1, 1, 1, 1, 1,
-0.5311976, -0.3752162, -1.081694, 1, 1, 1, 1, 1,
-0.5296291, -1.567724, -2.825947, 1, 1, 1, 1, 1,
-0.5272341, -1.147825, -2.619923, 1, 1, 1, 1, 1,
-0.5271501, -0.5448595, -2.282259, 1, 1, 1, 1, 1,
-0.5258675, 0.3121452, -2.08114, 0, 0, 1, 1, 1,
-0.5226225, -0.3823698, -2.181298, 1, 0, 0, 1, 1,
-0.5151665, 0.909963, -0.3336883, 1, 0, 0, 1, 1,
-0.5142828, -0.3498009, -1.987529, 1, 0, 0, 1, 1,
-0.5073208, 1.037667, -0.826624, 1, 0, 0, 1, 1,
-0.5053679, -1.367223, -3.646455, 1, 0, 0, 1, 1,
-0.5042, -0.04379101, -0.2512222, 0, 0, 0, 1, 1,
-0.4927548, 1.107301, 1.217548, 0, 0, 0, 1, 1,
-0.4912194, 0.9412038, -0.1073813, 0, 0, 0, 1, 1,
-0.489924, -0.9317145, -2.189191, 0, 0, 0, 1, 1,
-0.4887167, -0.3363056, -3.082325, 0, 0, 0, 1, 1,
-0.484722, 0.7900338, -0.7178361, 0, 0, 0, 1, 1,
-0.4820368, -0.5679439, -2.740644, 0, 0, 0, 1, 1,
-0.4809318, -1.655615, -1.804063, 1, 1, 1, 1, 1,
-0.4797354, 0.7186111, -0.8432507, 1, 1, 1, 1, 1,
-0.4796903, -0.225506, -2.645289, 1, 1, 1, 1, 1,
-0.4765813, -0.1000182, -1.595224, 1, 1, 1, 1, 1,
-0.4759425, -0.1292351, -2.763191, 1, 1, 1, 1, 1,
-0.4750376, 0.2075393, -1.918971, 1, 1, 1, 1, 1,
-0.4695996, 1.378282, -1.413039, 1, 1, 1, 1, 1,
-0.4686027, 0.2962075, 1.063514, 1, 1, 1, 1, 1,
-0.468174, 0.212467, -1.853639, 1, 1, 1, 1, 1,
-0.4669396, -3.227546, -1.83508, 1, 1, 1, 1, 1,
-0.4565609, 1.17484, -0.09993263, 1, 1, 1, 1, 1,
-0.4520513, -0.7148463, -2.689772, 1, 1, 1, 1, 1,
-0.450486, 1.422433, -0.1713272, 1, 1, 1, 1, 1,
-0.4497516, -1.061906, -4.062819, 1, 1, 1, 1, 1,
-0.4485645, -0.2673155, -1.942091, 1, 1, 1, 1, 1,
-0.446344, -2.125669, -2.740989, 0, 0, 1, 1, 1,
-0.4417244, -0.3579764, -2.563899, 1, 0, 0, 1, 1,
-0.4390421, -0.2397797, -0.6891362, 1, 0, 0, 1, 1,
-0.4334437, 0.9875604, 0.04532958, 1, 0, 0, 1, 1,
-0.4325286, 1.213148, 0.03866309, 1, 0, 0, 1, 1,
-0.4306875, -0.1927451, -2.34515, 1, 0, 0, 1, 1,
-0.4305414, 0.5086994, -1.207536, 0, 0, 0, 1, 1,
-0.4251893, -0.2376389, 0.07083178, 0, 0, 0, 1, 1,
-0.4212177, -0.625949, -2.013945, 0, 0, 0, 1, 1,
-0.4179873, 0.4760118, -1.376332, 0, 0, 0, 1, 1,
-0.41375, 0.3496088, -0.1979546, 0, 0, 0, 1, 1,
-0.4115958, -1.525931, -4.23706, 0, 0, 0, 1, 1,
-0.4103692, 0.6509095, -0.8274441, 0, 0, 0, 1, 1,
-0.4073096, -0.3779226, -1.234647, 1, 1, 1, 1, 1,
-0.4058158, -0.2323269, -2.126552, 1, 1, 1, 1, 1,
-0.4039593, 0.3154928, -1.692549, 1, 1, 1, 1, 1,
-0.4003926, -0.9107173, -2.270329, 1, 1, 1, 1, 1,
-0.3982692, -1.362867, -0.8973294, 1, 1, 1, 1, 1,
-0.3950422, 0.1070043, -1.252148, 1, 1, 1, 1, 1,
-0.3906747, 0.8131186, -0.4501441, 1, 1, 1, 1, 1,
-0.3839073, -0.6442251, -1.815337, 1, 1, 1, 1, 1,
-0.3813963, 1.348206, 0.9275094, 1, 1, 1, 1, 1,
-0.3742487, -0.8948326, -3.147906, 1, 1, 1, 1, 1,
-0.3731641, 0.1139018, -0.7402248, 1, 1, 1, 1, 1,
-0.3718118, -0.9005772, -2.206404, 1, 1, 1, 1, 1,
-0.3674968, -0.8114291, -2.870287, 1, 1, 1, 1, 1,
-0.3661337, 2.965932, -0.6639518, 1, 1, 1, 1, 1,
-0.3660627, 1.079799, -0.5979192, 1, 1, 1, 1, 1,
-0.3556851, -1.188649, -4.489506, 0, 0, 1, 1, 1,
-0.3511237, 1.482831, -0.5240094, 1, 0, 0, 1, 1,
-0.3463449, -0.2803401, -3.432278, 1, 0, 0, 1, 1,
-0.3403166, -0.4948668, -3.318881, 1, 0, 0, 1, 1,
-0.3364096, 1.073878, -1.21344, 1, 0, 0, 1, 1,
-0.3353211, -0.5267941, -4.207488, 1, 0, 0, 1, 1,
-0.3339002, -0.006031723, -1.603968, 0, 0, 0, 1, 1,
-0.3331377, -0.6445132, -0.5681474, 0, 0, 0, 1, 1,
-0.3329497, 1.616583, 0.1458592, 0, 0, 0, 1, 1,
-0.3327852, 0.4137908, -1.254054, 0, 0, 0, 1, 1,
-0.3305517, -0.01667534, -1.412563, 0, 0, 0, 1, 1,
-0.3281975, 1.015851, -0.7603802, 0, 0, 0, 1, 1,
-0.3262919, 0.1381157, -0.1751987, 0, 0, 0, 1, 1,
-0.3248063, 0.2048585, -1.52705, 1, 1, 1, 1, 1,
-0.3244962, -1.589425, -1.974112, 1, 1, 1, 1, 1,
-0.322945, 0.01611808, -4.480935, 1, 1, 1, 1, 1,
-0.3219223, -0.1738974, -1.9658, 1, 1, 1, 1, 1,
-0.3194665, 0.7751256, -1.376269, 1, 1, 1, 1, 1,
-0.3163632, -0.4204221, -3.704477, 1, 1, 1, 1, 1,
-0.3150983, 0.0527948, -1.78954, 1, 1, 1, 1, 1,
-0.3089856, 2.992154, 0.5089157, 1, 1, 1, 1, 1,
-0.3016357, 1.665942, -1.895723, 1, 1, 1, 1, 1,
-0.3010453, 2.694566, 2.330703, 1, 1, 1, 1, 1,
-0.3004264, -0.3777762, -3.097633, 1, 1, 1, 1, 1,
-0.298505, 0.6450987, -0.9760545, 1, 1, 1, 1, 1,
-0.2955917, -0.8861915, -2.882767, 1, 1, 1, 1, 1,
-0.294545, 0.7992918, 1.053041, 1, 1, 1, 1, 1,
-0.2915106, -0.6931416, -3.531223, 1, 1, 1, 1, 1,
-0.2905498, 0.6827341, 1.133277, 0, 0, 1, 1, 1,
-0.2896077, -1.092396, -1.343338, 1, 0, 0, 1, 1,
-0.2870086, 0.4284526, -0.5873125, 1, 0, 0, 1, 1,
-0.2869239, -0.8612492, -3.272119, 1, 0, 0, 1, 1,
-0.2858794, 1.564152, -1.264858, 1, 0, 0, 1, 1,
-0.2847153, -1.547218, -4.026821, 1, 0, 0, 1, 1,
-0.2824985, -0.04329452, -1.906537, 0, 0, 0, 1, 1,
-0.2819028, -0.2820741, -3.326394, 0, 0, 0, 1, 1,
-0.2796349, -0.6177629, -2.522126, 0, 0, 0, 1, 1,
-0.2746421, -2.28979, -4.840609, 0, 0, 0, 1, 1,
-0.2745486, -0.1873122, -1.213315, 0, 0, 0, 1, 1,
-0.2743324, 0.1805287, -0.5418762, 0, 0, 0, 1, 1,
-0.2741912, -0.6576287, -2.960391, 0, 0, 0, 1, 1,
-0.2650624, 1.139544, -1.747527, 1, 1, 1, 1, 1,
-0.2619639, 0.2039094, 1.178831, 1, 1, 1, 1, 1,
-0.2601108, -0.3766072, -2.512332, 1, 1, 1, 1, 1,
-0.2457971, 0.9717675, -0.3445565, 1, 1, 1, 1, 1,
-0.2448441, -0.9085854, -4.416512, 1, 1, 1, 1, 1,
-0.2437951, 0.1221065, -0.6209164, 1, 1, 1, 1, 1,
-0.2398141, 2.054816, 0.3104563, 1, 1, 1, 1, 1,
-0.2380731, 0.04292555, -0.2439492, 1, 1, 1, 1, 1,
-0.2370815, -0.5579477, -1.636008, 1, 1, 1, 1, 1,
-0.2369156, 0.6131848, -0.263217, 1, 1, 1, 1, 1,
-0.2360563, -0.9965931, -2.091749, 1, 1, 1, 1, 1,
-0.2328781, 0.955749, -1.624796, 1, 1, 1, 1, 1,
-0.2301073, -1.416176, -3.049774, 1, 1, 1, 1, 1,
-0.2209102, -1.40369, -4.739647, 1, 1, 1, 1, 1,
-0.2175234, -1.545754, -5.554143, 1, 1, 1, 1, 1,
-0.2155169, 1.618443, 0.1268863, 0, 0, 1, 1, 1,
-0.2096854, -1.131722, -1.950701, 1, 0, 0, 1, 1,
-0.2081626, 0.1548731, -2.032427, 1, 0, 0, 1, 1,
-0.2070965, 1.181737, -0.4394445, 1, 0, 0, 1, 1,
-0.2039317, -0.01383593, -0.7467258, 1, 0, 0, 1, 1,
-0.201639, -0.4890133, -3.619866, 1, 0, 0, 1, 1,
-0.2002114, -0.1186409, 0.4561026, 0, 0, 0, 1, 1,
-0.2000485, -1.139723, -4.012316, 0, 0, 0, 1, 1,
-0.1970955, -0.1509648, -1.275582, 0, 0, 0, 1, 1,
-0.1945466, 0.2796572, -1.128288, 0, 0, 0, 1, 1,
-0.1936981, -0.173047, -1.602294, 0, 0, 0, 1, 1,
-0.1933895, -0.3172501, -5.264744, 0, 0, 0, 1, 1,
-0.1902379, -1.077774, -4.758932, 0, 0, 0, 1, 1,
-0.1870618, 0.2669504, 0.9239806, 1, 1, 1, 1, 1,
-0.1867726, 1.075627, 0.4960365, 1, 1, 1, 1, 1,
-0.1821017, -0.06597289, -1.09428, 1, 1, 1, 1, 1,
-0.1806971, -0.8523888, -3.496288, 1, 1, 1, 1, 1,
-0.1792046, 0.158657, 0.6134524, 1, 1, 1, 1, 1,
-0.1758179, 0.2001997, -2.720937, 1, 1, 1, 1, 1,
-0.1718342, -1.230084, -2.971122, 1, 1, 1, 1, 1,
-0.1709793, 1.862687, 2.161857, 1, 1, 1, 1, 1,
-0.1640528, 0.4793711, 0.2575886, 1, 1, 1, 1, 1,
-0.1605727, -0.4856344, -2.417181, 1, 1, 1, 1, 1,
-0.1600634, -1.966252, -4.222094, 1, 1, 1, 1, 1,
-0.1553733, 0.07709102, -2.07733, 1, 1, 1, 1, 1,
-0.1488453, -1.41416, -1.675039, 1, 1, 1, 1, 1,
-0.1479746, 0.8638091, -1.033967, 1, 1, 1, 1, 1,
-0.1427175, -0.9382401, -2.124679, 1, 1, 1, 1, 1,
-0.1423786, -0.4882891, -1.848565, 0, 0, 1, 1, 1,
-0.1417164, 0.1786428, -0.5472723, 1, 0, 0, 1, 1,
-0.1381015, -0.2329496, -3.333382, 1, 0, 0, 1, 1,
-0.1327792, 0.2099667, -1.835376, 1, 0, 0, 1, 1,
-0.1311316, 0.04689896, -0.1487705, 1, 0, 0, 1, 1,
-0.1310689, -0.8458256, -1.791966, 1, 0, 0, 1, 1,
-0.1302513, -0.5272434, -2.903743, 0, 0, 0, 1, 1,
-0.1292856, -0.008978788, -1.146805, 0, 0, 0, 1, 1,
-0.1292172, 0.8562043, -1.267359, 0, 0, 0, 1, 1,
-0.1289198, -1.048666, -3.654327, 0, 0, 0, 1, 1,
-0.1279808, 1.522019, -0.8770786, 0, 0, 0, 1, 1,
-0.1240132, 1.421224, -0.5263822, 0, 0, 0, 1, 1,
-0.1217022, 0.6661535, -0.2050953, 0, 0, 0, 1, 1,
-0.1170186, 0.1932419, -1.279492, 1, 1, 1, 1, 1,
-0.1142865, -0.3743666, -4.082353, 1, 1, 1, 1, 1,
-0.1133942, 0.7026417, -0.4820794, 1, 1, 1, 1, 1,
-0.1051442, -0.3860936, -1.870108, 1, 1, 1, 1, 1,
-0.1023345, 1.760195, -1.210494, 1, 1, 1, 1, 1,
-0.1009592, 0.4681533, -1.006384, 1, 1, 1, 1, 1,
-0.09973382, 0.2876427, -1.643335, 1, 1, 1, 1, 1,
-0.09940699, 1.23344, -1.518737, 1, 1, 1, 1, 1,
-0.09510699, -2.14199, -3.597333, 1, 1, 1, 1, 1,
-0.08526678, 0.851738, 0.8865676, 1, 1, 1, 1, 1,
-0.0816771, -1.493267, -3.601358, 1, 1, 1, 1, 1,
-0.08102083, -1.003811, -2.975823, 1, 1, 1, 1, 1,
-0.07936721, -1.395855, -1.823647, 1, 1, 1, 1, 1,
-0.07899021, -0.8227209, -4.071785, 1, 1, 1, 1, 1,
-0.07697403, 0.04960041, -2.048709, 1, 1, 1, 1, 1,
-0.07357971, -0.916773, -3.248108, 0, 0, 1, 1, 1,
-0.07221679, 2.403232, 0.4310941, 1, 0, 0, 1, 1,
-0.06379011, 1.65333, 0.5903509, 1, 0, 0, 1, 1,
-0.06311741, 0.04515702, 0.3749079, 1, 0, 0, 1, 1,
-0.06045983, 0.483146, -0.8452173, 1, 0, 0, 1, 1,
-0.05993911, -0.3437359, -3.304617, 1, 0, 0, 1, 1,
-0.05939646, 0.6395007, 1.335414, 0, 0, 0, 1, 1,
-0.05669878, 0.0230341, -1.748749, 0, 0, 0, 1, 1,
-0.05569712, -0.7262965, -2.081792, 0, 0, 0, 1, 1,
-0.05547012, -0.08058876, -1.492099, 0, 0, 0, 1, 1,
-0.05123886, -0.2127304, -2.794224, 0, 0, 0, 1, 1,
-0.04927458, 1.406936, -0.1224994, 0, 0, 0, 1, 1,
-0.0486486, -0.4496472, -5.551593, 0, 0, 0, 1, 1,
-0.04759904, 0.5838412, 0.1939062, 1, 1, 1, 1, 1,
-0.03410899, -0.3038225, -3.255466, 1, 1, 1, 1, 1,
-0.03283333, -0.1195076, -3.503851, 1, 1, 1, 1, 1,
-0.030665, 0.5633022, -0.4148608, 1, 1, 1, 1, 1,
-0.0292613, 1.186097, -0.3000395, 1, 1, 1, 1, 1,
-0.02168828, -0.5704336, -4.677144, 1, 1, 1, 1, 1,
-0.01262806, 0.4657716, -0.781711, 1, 1, 1, 1, 1,
-0.006276551, 1.419815, 0.1616531, 1, 1, 1, 1, 1,
-0.005888169, -0.1064732, -3.688643, 1, 1, 1, 1, 1,
-0.001224799, 1.119494, 0.6810783, 1, 1, 1, 1, 1,
0.0001455914, -0.02679309, 4.958165, 1, 1, 1, 1, 1,
0.0002893771, -0.05443319, 2.79681, 1, 1, 1, 1, 1,
0.003720135, 1.734737, -2.624296, 1, 1, 1, 1, 1,
0.004407011, -0.6661921, 4.868196, 1, 1, 1, 1, 1,
0.0067141, -0.9834142, 2.620807, 1, 1, 1, 1, 1,
0.009786401, -0.5863554, 1.954893, 0, 0, 1, 1, 1,
0.0131972, 1.014707, 0.2193348, 1, 0, 0, 1, 1,
0.02427282, -0.6584094, 1.420167, 1, 0, 0, 1, 1,
0.02445125, -0.5013258, 1.590952, 1, 0, 0, 1, 1,
0.02558248, -0.9381208, 0.7585722, 1, 0, 0, 1, 1,
0.03047845, -0.2190626, 1.369356, 1, 0, 0, 1, 1,
0.03264449, -0.9921449, 2.942732, 0, 0, 0, 1, 1,
0.03881502, -0.565176, 5.042335, 0, 0, 0, 1, 1,
0.04082047, 0.8422536, 1.000423, 0, 0, 0, 1, 1,
0.0433226, -0.249345, 3.546215, 0, 0, 0, 1, 1,
0.04428378, -0.6991934, 4.343244, 0, 0, 0, 1, 1,
0.0485329, -0.1732099, 2.865391, 0, 0, 0, 1, 1,
0.05540463, 0.3840099, -0.1856955, 0, 0, 0, 1, 1,
0.05571096, 1.126608, -0.3434768, 1, 1, 1, 1, 1,
0.05848988, 0.7791153, 1.248875, 1, 1, 1, 1, 1,
0.05924732, 0.05107152, 1.245183, 1, 1, 1, 1, 1,
0.06410218, 2.542922, 0.005878143, 1, 1, 1, 1, 1,
0.06747404, 0.3721185, 0.2674381, 1, 1, 1, 1, 1,
0.07326968, 0.9371777, 1.099933, 1, 1, 1, 1, 1,
0.07327745, -0.00586873, 0.3720219, 1, 1, 1, 1, 1,
0.07672668, -1.388053, 5.360704, 1, 1, 1, 1, 1,
0.07745173, -0.9344077, 5.343244, 1, 1, 1, 1, 1,
0.07799075, -0.1197354, 4.116617, 1, 1, 1, 1, 1,
0.08420959, 1.322972, 0.4932531, 1, 1, 1, 1, 1,
0.09326479, -0.5043822, 2.18274, 1, 1, 1, 1, 1,
0.09548378, 2.100087, 1.699233, 1, 1, 1, 1, 1,
0.09652568, -0.8610919, 1.902137, 1, 1, 1, 1, 1,
0.09816234, 0.4386909, -1.192593, 1, 1, 1, 1, 1,
0.1018541, -1.315219, 1.968558, 0, 0, 1, 1, 1,
0.1075012, 1.199748, -0.748839, 1, 0, 0, 1, 1,
0.1079285, -0.851902, 1.656439, 1, 0, 0, 1, 1,
0.1152112, 0.802332, 2.359884, 1, 0, 0, 1, 1,
0.1158968, 0.765765, 0.03769115, 1, 0, 0, 1, 1,
0.1173925, -0.7660491, 4.166554, 1, 0, 0, 1, 1,
0.1193284, 0.3339062, -0.4656754, 0, 0, 0, 1, 1,
0.1217799, 0.5701615, 0.2071852, 0, 0, 0, 1, 1,
0.131627, 1.455453, 1.529632, 0, 0, 0, 1, 1,
0.1352393, -1.051775, 2.646123, 0, 0, 0, 1, 1,
0.1431612, -0.8802561, 3.913401, 0, 0, 0, 1, 1,
0.1458833, 0.03066915, -0.9660988, 0, 0, 0, 1, 1,
0.1499621, -0.1929274, 1.963393, 0, 0, 0, 1, 1,
0.1527994, -0.7299951, 3.660204, 1, 1, 1, 1, 1,
0.155319, 0.779306, 1.020998, 1, 1, 1, 1, 1,
0.1576038, 1.023396, -0.4854547, 1, 1, 1, 1, 1,
0.1578883, -0.1186826, 0.7398884, 1, 1, 1, 1, 1,
0.159933, -0.512958, 4.181919, 1, 1, 1, 1, 1,
0.1623759, -1.386545, 3.301162, 1, 1, 1, 1, 1,
0.1636335, 0.1152983, 1.026821, 1, 1, 1, 1, 1,
0.1640758, -1.9641, 3.346355, 1, 1, 1, 1, 1,
0.1654251, 0.4279892, 2.15072, 1, 1, 1, 1, 1,
0.170953, -1.345278, 1.917997, 1, 1, 1, 1, 1,
0.1722487, -0.440776, 2.032369, 1, 1, 1, 1, 1,
0.1760316, 0.3169582, -0.1223421, 1, 1, 1, 1, 1,
0.1795708, -0.6147892, 3.411333, 1, 1, 1, 1, 1,
0.1795859, -1.299266, 5.227821, 1, 1, 1, 1, 1,
0.1888485, 0.6423585, -1.224185, 1, 1, 1, 1, 1,
0.191737, 0.8033161, 1.434783, 0, 0, 1, 1, 1,
0.1989238, -1.567732, 3.144246, 1, 0, 0, 1, 1,
0.1992064, 0.188963, 2.074628, 1, 0, 0, 1, 1,
0.1992073, -0.3813072, 4.290696, 1, 0, 0, 1, 1,
0.199682, 1.366444, 0.6934736, 1, 0, 0, 1, 1,
0.2032847, 1.271012, -0.2913072, 1, 0, 0, 1, 1,
0.2060274, 0.05185906, 2.511853, 0, 0, 0, 1, 1,
0.2060755, -0.975151, 2.469398, 0, 0, 0, 1, 1,
0.2110319, 0.2701583, -0.1468628, 0, 0, 0, 1, 1,
0.21157, -0.6086806, 5.312142, 0, 0, 0, 1, 1,
0.2137632, 0.1768425, 1.159809, 0, 0, 0, 1, 1,
0.2162121, 1.010082, 0.8800681, 0, 0, 0, 1, 1,
0.2180706, -0.5344084, 3.201329, 0, 0, 0, 1, 1,
0.218307, -0.6825278, 1.761118, 1, 1, 1, 1, 1,
0.2266753, -0.7031201, 2.465482, 1, 1, 1, 1, 1,
0.2280139, 1.02309, 1.277882, 1, 1, 1, 1, 1,
0.2282622, 0.3235423, 2.516165, 1, 1, 1, 1, 1,
0.2317317, 0.5019572, -0.1700166, 1, 1, 1, 1, 1,
0.2349039, -0.6335148, 3.139293, 1, 1, 1, 1, 1,
0.2368941, 0.1104997, 1.812101, 1, 1, 1, 1, 1,
0.2398738, 0.07868231, 2.137698, 1, 1, 1, 1, 1,
0.2441038, -0.3570316, 2.86796, 1, 1, 1, 1, 1,
0.2444114, -0.9955504, 3.603693, 1, 1, 1, 1, 1,
0.2458011, -1.366316, 3.592692, 1, 1, 1, 1, 1,
0.2465118, -0.1695882, 0.5509055, 1, 1, 1, 1, 1,
0.2503943, -0.1993158, 3.417174, 1, 1, 1, 1, 1,
0.2507691, -0.4688571, 1.682865, 1, 1, 1, 1, 1,
0.2533836, 1.183331, 0.184831, 1, 1, 1, 1, 1,
0.2554078, 1.348846, -1.220824, 0, 0, 1, 1, 1,
0.2564914, -1.365541, 0.7307165, 1, 0, 0, 1, 1,
0.2634696, 0.2723936, 1.241113, 1, 0, 0, 1, 1,
0.2694195, 1.549816, -0.6718871, 1, 0, 0, 1, 1,
0.2723925, 1.005749, -0.6992797, 1, 0, 0, 1, 1,
0.273332, 0.7027152, -0.7608936, 1, 0, 0, 1, 1,
0.2758052, 0.9801445, 0.2565482, 0, 0, 0, 1, 1,
0.2779914, 0.1512708, 0.2644464, 0, 0, 0, 1, 1,
0.2792764, 0.2042927, 1.307519, 0, 0, 0, 1, 1,
0.2800809, 0.5010521, 0.4153693, 0, 0, 0, 1, 1,
0.2822722, -0.2954324, 3.30256, 0, 0, 0, 1, 1,
0.2837227, 1.117949, -1.291927, 0, 0, 0, 1, 1,
0.2877021, -0.5366845, 1.431143, 0, 0, 0, 1, 1,
0.2883536, -0.1227546, 2.684361, 1, 1, 1, 1, 1,
0.2892341, -0.6322909, 5.025857, 1, 1, 1, 1, 1,
0.2899294, -0.1437981, 1.82626, 1, 1, 1, 1, 1,
0.2948387, -1.207265, 4.52392, 1, 1, 1, 1, 1,
0.2961035, 0.7891399, 0.7109613, 1, 1, 1, 1, 1,
0.2986757, 0.8488692, 1.798225, 1, 1, 1, 1, 1,
0.3042617, 1.282693, -0.4729116, 1, 1, 1, 1, 1,
0.3053116, 1.242231, 0.2909201, 1, 1, 1, 1, 1,
0.3056499, -0.7957015, 3.658445, 1, 1, 1, 1, 1,
0.3064161, -0.361183, 1.60977, 1, 1, 1, 1, 1,
0.3093126, -0.318327, 1.969123, 1, 1, 1, 1, 1,
0.312904, 0.7442025, 1.061902, 1, 1, 1, 1, 1,
0.316991, 1.34583, 0.5171143, 1, 1, 1, 1, 1,
0.3183285, -0.9950024, 1.937436, 1, 1, 1, 1, 1,
0.3211287, -0.7893108, 3.841728, 1, 1, 1, 1, 1,
0.3240308, -1.502206, 2.705828, 0, 0, 1, 1, 1,
0.3265758, 0.689925, -0.1327936, 1, 0, 0, 1, 1,
0.3431461, 1.40766, 0.5560966, 1, 0, 0, 1, 1,
0.3461936, -1.303645, 0.8294734, 1, 0, 0, 1, 1,
0.3496864, -0.3020386, 3.09647, 1, 0, 0, 1, 1,
0.3563765, 1.197411, 0.2864045, 1, 0, 0, 1, 1,
0.357598, 1.242258, 0.4164762, 0, 0, 0, 1, 1,
0.3583408, 0.3013311, 1.775198, 0, 0, 0, 1, 1,
0.3618825, -0.9772569, 1.814162, 0, 0, 0, 1, 1,
0.3619189, 1.119935, 2.295327, 0, 0, 0, 1, 1,
0.3632954, -1.814182, 1.424819, 0, 0, 0, 1, 1,
0.3649473, -0.1336113, 1.283824, 0, 0, 0, 1, 1,
0.3684595, -0.2714639, 1.375326, 0, 0, 0, 1, 1,
0.3688746, 0.3218542, 0.4962716, 1, 1, 1, 1, 1,
0.3695522, -0.9360282, 3.545579, 1, 1, 1, 1, 1,
0.3726701, -1.300577, 4.659985, 1, 1, 1, 1, 1,
0.382354, 0.4193743, 0.461392, 1, 1, 1, 1, 1,
0.3910785, -0.2987544, 2.938093, 1, 1, 1, 1, 1,
0.3937677, -1.167446, 2.071297, 1, 1, 1, 1, 1,
0.3948582, 0.1113463, 2.661104, 1, 1, 1, 1, 1,
0.3989738, 0.6121757, 0.4569637, 1, 1, 1, 1, 1,
0.4012497, 0.9255634, 1.158579, 1, 1, 1, 1, 1,
0.4024419, 1.005026, 0.824834, 1, 1, 1, 1, 1,
0.4033659, -2.696457, 1.732412, 1, 1, 1, 1, 1,
0.4081057, 1.273561, 0.9935173, 1, 1, 1, 1, 1,
0.4087456, -0.6122949, 3.016661, 1, 1, 1, 1, 1,
0.4121705, 0.7484421, -0.7065523, 1, 1, 1, 1, 1,
0.4123514, -0.8435637, 1.221538, 1, 1, 1, 1, 1,
0.4126444, 0.5744965, -0.005386846, 0, 0, 1, 1, 1,
0.4139774, 0.5579245, 0.5512707, 1, 0, 0, 1, 1,
0.4178564, 0.8681594, 1.777322, 1, 0, 0, 1, 1,
0.4185498, 0.1139745, 0.6416257, 1, 0, 0, 1, 1,
0.4225926, -0.3710145, 1.84723, 1, 0, 0, 1, 1,
0.4234904, -0.2545511, 2.731501, 1, 0, 0, 1, 1,
0.4308797, -2.323895, 3.51464, 0, 0, 0, 1, 1,
0.4329377, 0.5346258, 0.6351264, 0, 0, 0, 1, 1,
0.4360688, -1.700179, 4.55829, 0, 0, 0, 1, 1,
0.4373185, 1.025598, -0.7425773, 0, 0, 0, 1, 1,
0.4396416, 1.002339, 0.5409974, 0, 0, 0, 1, 1,
0.443093, 1.373528, 0.8579076, 0, 0, 0, 1, 1,
0.4506192, 0.9914677, -1.340672, 0, 0, 0, 1, 1,
0.4511907, -1.04749, 2.80837, 1, 1, 1, 1, 1,
0.4514796, 0.06949341, 2.575214, 1, 1, 1, 1, 1,
0.461835, -0.6403834, 1.839973, 1, 1, 1, 1, 1,
0.4629159, -1.177821, 5.486716, 1, 1, 1, 1, 1,
0.4638993, 0.1269047, 1.762992, 1, 1, 1, 1, 1,
0.4706001, -0.5827957, 2.134037, 1, 1, 1, 1, 1,
0.471462, 1.564367, 0.5172837, 1, 1, 1, 1, 1,
0.4749687, 0.9160058, 0.790096, 1, 1, 1, 1, 1,
0.4761632, -0.1389677, 2.818191, 1, 1, 1, 1, 1,
0.4780484, -0.6562951, 3.09345, 1, 1, 1, 1, 1,
0.4849413, 1.195124, -0.3620364, 1, 1, 1, 1, 1,
0.4850695, -1.192346, 2.405432, 1, 1, 1, 1, 1,
0.4898599, -1.27271, 2.509879, 1, 1, 1, 1, 1,
0.4908953, -0.861087, 0.8467144, 1, 1, 1, 1, 1,
0.4912538, 1.3484, -0.3462322, 1, 1, 1, 1, 1,
0.4978004, -0.4981489, 3.53747, 0, 0, 1, 1, 1,
0.4980922, -0.2314415, 2.189677, 1, 0, 0, 1, 1,
0.5018863, -1.164076, 3.999194, 1, 0, 0, 1, 1,
0.5032397, -0.8628678, 2.429599, 1, 0, 0, 1, 1,
0.5105584, -1.819193, 3.839333, 1, 0, 0, 1, 1,
0.517769, 0.5840027, 1.503805, 1, 0, 0, 1, 1,
0.5205543, 1.057055, -2.19058, 0, 0, 0, 1, 1,
0.5291522, 1.030178, 1.275592, 0, 0, 0, 1, 1,
0.5295189, -0.03834137, 1.215123, 0, 0, 0, 1, 1,
0.5351641, -0.8594807, 1.024338, 0, 0, 0, 1, 1,
0.5440731, 0.6223801, 0.7069196, 0, 0, 0, 1, 1,
0.5443378, -0.2228656, 1.975304, 0, 0, 0, 1, 1,
0.5476763, 0.3139814, 2.971925, 0, 0, 0, 1, 1,
0.5481029, 0.6736119, 1.758949, 1, 1, 1, 1, 1,
0.5537652, 0.2724162, 1.458625, 1, 1, 1, 1, 1,
0.5551091, -0.6076767, 2.722496, 1, 1, 1, 1, 1,
0.5567425, -0.9828471, 3.092228, 1, 1, 1, 1, 1,
0.5570112, 0.4682543, 1.73764, 1, 1, 1, 1, 1,
0.5582355, -0.5773171, 1.009649, 1, 1, 1, 1, 1,
0.5596471, -1.301447, 3.088351, 1, 1, 1, 1, 1,
0.5617496, 0.09127515, 1.860707, 1, 1, 1, 1, 1,
0.5649889, -1.106704, 0.8940873, 1, 1, 1, 1, 1,
0.5665991, 0.7025381, 0.6030265, 1, 1, 1, 1, 1,
0.5694252, 1.054513, 0.7680683, 1, 1, 1, 1, 1,
0.579945, -0.5017812, 3.78561, 1, 1, 1, 1, 1,
0.5809607, -0.519322, 0.936613, 1, 1, 1, 1, 1,
0.5881602, 0.1950407, 0.9404569, 1, 1, 1, 1, 1,
0.590701, -0.177119, 1.373421, 1, 1, 1, 1, 1,
0.5914861, 1.141661, -0.0701862, 0, 0, 1, 1, 1,
0.5949869, 1.363096, -1.299681, 1, 0, 0, 1, 1,
0.5955285, 0.6602775, 1.42532, 1, 0, 0, 1, 1,
0.6021393, 1.56779, -0.4995292, 1, 0, 0, 1, 1,
0.6030601, -0.3653297, 2.119402, 1, 0, 0, 1, 1,
0.6063579, -0.5752477, 3.766629, 1, 0, 0, 1, 1,
0.6100281, 0.7103591, 0.04366539, 0, 0, 0, 1, 1,
0.6127918, 0.3436694, 1.068056, 0, 0, 0, 1, 1,
0.6160364, -0.7692478, 2.765414, 0, 0, 0, 1, 1,
0.6189367, 2.401906, -0.2063076, 0, 0, 0, 1, 1,
0.6190057, 2.387933, -0.8597682, 0, 0, 0, 1, 1,
0.6269926, 0.7761113, 1.542374, 0, 0, 0, 1, 1,
0.6335231, 0.07115314, 2.629539, 0, 0, 0, 1, 1,
0.6379857, -1.476413, 2.21621, 1, 1, 1, 1, 1,
0.6381533, 0.3907876, -0.267215, 1, 1, 1, 1, 1,
0.6416055, 2.255186, 1.398212, 1, 1, 1, 1, 1,
0.6422899, -0.719945, 2.113893, 1, 1, 1, 1, 1,
0.6461318, 1.751243, 2.195099, 1, 1, 1, 1, 1,
0.6506082, -0.3855337, 0.8504169, 1, 1, 1, 1, 1,
0.6512691, 0.9835752, 3.515332, 1, 1, 1, 1, 1,
0.6606564, -0.3346737, 1.977456, 1, 1, 1, 1, 1,
0.6663626, 0.1963706, 0.398116, 1, 1, 1, 1, 1,
0.6682116, -0.5786064, 2.516457, 1, 1, 1, 1, 1,
0.6697775, 1.949369, -0.168407, 1, 1, 1, 1, 1,
0.6799674, -1.527691, 4.804419, 1, 1, 1, 1, 1,
0.6824406, 0.08288111, -1.0906, 1, 1, 1, 1, 1,
0.6876699, -0.4833947, 1.263429, 1, 1, 1, 1, 1,
0.6881082, -0.1569471, 2.48498, 1, 1, 1, 1, 1,
0.6899132, -1.05186, 1.910768, 0, 0, 1, 1, 1,
0.6916973, 0.1947156, 2.043662, 1, 0, 0, 1, 1,
0.7056909, -0.07754558, 2.324249, 1, 0, 0, 1, 1,
0.707799, -0.5822024, 1.0025, 1, 0, 0, 1, 1,
0.7106832, 0.1004571, -0.1495412, 1, 0, 0, 1, 1,
0.7107544, -2.199822, 3.893672, 1, 0, 0, 1, 1,
0.7155398, -1.001815, 1.754781, 0, 0, 0, 1, 1,
0.7187953, 0.1576479, 1.767215, 0, 0, 0, 1, 1,
0.7199914, 0.99928, 0.974259, 0, 0, 0, 1, 1,
0.7226782, -0.4700465, 2.404117, 0, 0, 0, 1, 1,
0.7247638, -0.3968557, 0.8918376, 0, 0, 0, 1, 1,
0.7288731, 0.004051547, 1.11496, 0, 0, 0, 1, 1,
0.7293572, -0.155855, 4.835617, 0, 0, 0, 1, 1,
0.7305654, 0.6536215, 0.2630023, 1, 1, 1, 1, 1,
0.73721, 0.1148901, 1.32095, 1, 1, 1, 1, 1,
0.7387103, -0.3756746, 2.463079, 1, 1, 1, 1, 1,
0.7387776, -0.1207813, 2.534198, 1, 1, 1, 1, 1,
0.7449901, -0.1455516, 0.790316, 1, 1, 1, 1, 1,
0.7465852, 1.352991, 0.5047927, 1, 1, 1, 1, 1,
0.7483943, -0.2562547, 0.1003244, 1, 1, 1, 1, 1,
0.7504585, -1.26967, 2.07985, 1, 1, 1, 1, 1,
0.7505357, -1.241483, 1.160983, 1, 1, 1, 1, 1,
0.7529109, -1.454599, 2.031959, 1, 1, 1, 1, 1,
0.7634004, 2.282923, -0.03970914, 1, 1, 1, 1, 1,
0.7663904, 0.4377885, 0.4480137, 1, 1, 1, 1, 1,
0.7675912, 0.4756631, 1.340822, 1, 1, 1, 1, 1,
0.7678694, 0.3907208, 2.072659, 1, 1, 1, 1, 1,
0.7688319, 1.946295, 1.097055, 1, 1, 1, 1, 1,
0.7759641, -0.140044, 2.273154, 0, 0, 1, 1, 1,
0.7782921, 0.5426996, 0.8185964, 1, 0, 0, 1, 1,
0.7807811, 0.5250855, 1.131416, 1, 0, 0, 1, 1,
0.783423, -2.733336, 2.067348, 1, 0, 0, 1, 1,
0.7908344, -0.9515256, 3.475223, 1, 0, 0, 1, 1,
0.7926295, -1.310113, 3.001622, 1, 0, 0, 1, 1,
0.7954316, 0.2989882, 0.9067522, 0, 0, 0, 1, 1,
0.7964587, 1.217567, -0.5011889, 0, 0, 0, 1, 1,
0.8067479, 0.2145387, -0.1703525, 0, 0, 0, 1, 1,
0.8116125, -0.6608705, 4.277257, 0, 0, 0, 1, 1,
0.8143944, -1.050727, 1.755455, 0, 0, 0, 1, 1,
0.8171713, 0.5772733, 1.702286, 0, 0, 0, 1, 1,
0.8187444, 0.2313536, 0.2681692, 0, 0, 0, 1, 1,
0.823746, -1.825774, 2.736237, 1, 1, 1, 1, 1,
0.8273849, 0.2588553, 1.379703, 1, 1, 1, 1, 1,
0.8283931, 1.099791, -0.2729016, 1, 1, 1, 1, 1,
0.8321014, 0.7705182, 0.7542391, 1, 1, 1, 1, 1,
0.8348722, -0.9733988, 3.384529, 1, 1, 1, 1, 1,
0.841186, 0.4556956, 0.9699348, 1, 1, 1, 1, 1,
0.8474101, -0.7019724, 2.224283, 1, 1, 1, 1, 1,
0.8476515, -0.6940943, 3.176142, 1, 1, 1, 1, 1,
0.848946, -0.2454036, 1.988682, 1, 1, 1, 1, 1,
0.8532758, 1.218453, 1.966454, 1, 1, 1, 1, 1,
0.8541875, -1.583437, 1.495987, 1, 1, 1, 1, 1,
0.8554283, 1.578734, -0.3575216, 1, 1, 1, 1, 1,
0.8567938, 0.3257036, 3.559707, 1, 1, 1, 1, 1,
0.8572614, 0.9247522, -0.6835144, 1, 1, 1, 1, 1,
0.8583041, -0.1946832, 1.410815, 1, 1, 1, 1, 1,
0.8634897, 0.4732109, 1.134454, 0, 0, 1, 1, 1,
0.871076, -0.9052233, 3.890235, 1, 0, 0, 1, 1,
0.8717592, 1.156849, -1.213932, 1, 0, 0, 1, 1,
0.8736987, 1.241507, 1.729004, 1, 0, 0, 1, 1,
0.8881278, 0.1389605, -0.6079755, 1, 0, 0, 1, 1,
0.8903124, 1.362886, 0.6372015, 1, 0, 0, 1, 1,
0.8928883, 0.1053918, 0.5882264, 0, 0, 0, 1, 1,
0.8931311, 0.3041564, 1.67313, 0, 0, 0, 1, 1,
0.8992025, 0.07243492, 2.587711, 0, 0, 0, 1, 1,
0.9001401, 0.5389191, 1.249591, 0, 0, 0, 1, 1,
0.9162133, -2.2779, 4.56622, 0, 0, 0, 1, 1,
0.9313993, 0.5050482, 0.8533711, 0, 0, 0, 1, 1,
0.9360587, 1.152241, 1.917169, 0, 0, 0, 1, 1,
0.938289, 1.025011, 1.509717, 1, 1, 1, 1, 1,
0.9428401, 1.198679, 1.087281, 1, 1, 1, 1, 1,
0.9439283, -1.509786, 2.644735, 1, 1, 1, 1, 1,
0.9445099, -0.6532313, 1.749879, 1, 1, 1, 1, 1,
0.945605, 1.154362, 2.808459, 1, 1, 1, 1, 1,
0.9522048, 0.6681191, 1.611148, 1, 1, 1, 1, 1,
0.9542794, -0.5419015, 3.366719, 1, 1, 1, 1, 1,
0.959897, 0.2019507, -0.4340926, 1, 1, 1, 1, 1,
0.9766831, -0.8900943, 2.36841, 1, 1, 1, 1, 1,
0.9880826, 2.486689, -0.2474489, 1, 1, 1, 1, 1,
0.9917805, -0.3001955, 1.499444, 1, 1, 1, 1, 1,
0.9939009, -0.2061752, 0.7628977, 1, 1, 1, 1, 1,
0.994351, 0.9686034, 1.72831, 1, 1, 1, 1, 1,
0.999269, 0.6903359, 3.396011, 1, 1, 1, 1, 1,
1.000967, 2.882855, 1.305257, 1, 1, 1, 1, 1,
1.001066, -0.9241768, 3.762324, 0, 0, 1, 1, 1,
1.002969, -0.2245822, 1.642353, 1, 0, 0, 1, 1,
1.005332, -1.178628, 0.1168646, 1, 0, 0, 1, 1,
1.009581, -0.5752566, 2.355633, 1, 0, 0, 1, 1,
1.009947, 0.7913949, 1.144983, 1, 0, 0, 1, 1,
1.010916, -0.1475912, 1.597795, 1, 0, 0, 1, 1,
1.010972, -0.1234157, 0.6346894, 0, 0, 0, 1, 1,
1.01413, 1.001586, 0.5078741, 0, 0, 0, 1, 1,
1.018213, -0.507393, 3.38681, 0, 0, 0, 1, 1,
1.018948, -1.033444, 2.489263, 0, 0, 0, 1, 1,
1.023899, 0.4464555, 1.288272, 0, 0, 0, 1, 1,
1.025282, -0.5095632, 3.238964, 0, 0, 0, 1, 1,
1.027138, -0.8272983, 4.870566, 0, 0, 0, 1, 1,
1.029634, 1.931503, -1.809224, 1, 1, 1, 1, 1,
1.035408, -0.7728713, 2.285564, 1, 1, 1, 1, 1,
1.035911, -0.3298239, 1.851054, 1, 1, 1, 1, 1,
1.038161, -2.158751, 2.476069, 1, 1, 1, 1, 1,
1.039888, -1.494127, 3.387484, 1, 1, 1, 1, 1,
1.047828, -0.518541, 3.425923, 1, 1, 1, 1, 1,
1.052459, -1.825436, 3.275387, 1, 1, 1, 1, 1,
1.053227, -0.4412163, 3.080301, 1, 1, 1, 1, 1,
1.067367, 0.6358513, 0.5834934, 1, 1, 1, 1, 1,
1.068057, -0.05509131, 1.836072, 1, 1, 1, 1, 1,
1.069317, -0.4826694, 2.900385, 1, 1, 1, 1, 1,
1.076085, -1.184895, 1.428065, 1, 1, 1, 1, 1,
1.079776, -0.6058525, 3.538429, 1, 1, 1, 1, 1,
1.083709, 1.079933, 1.149245, 1, 1, 1, 1, 1,
1.093719, -1.893622, 2.106331, 1, 1, 1, 1, 1,
1.096069, 1.743667, 0.9522868, 0, 0, 1, 1, 1,
1.099427, -0.3847562, 3.248344, 1, 0, 0, 1, 1,
1.100026, -0.9977026, 1.096105, 1, 0, 0, 1, 1,
1.103056, -2.7619, 2.818353, 1, 0, 0, 1, 1,
1.107701, -0.0193483, 2.436928, 1, 0, 0, 1, 1,
1.113487, 1.935061, 0.1942448, 1, 0, 0, 1, 1,
1.119986, -0.8262624, 2.471071, 0, 0, 0, 1, 1,
1.120611, -1.254284, 3.308205, 0, 0, 0, 1, 1,
1.121221, 0.1749079, 2.411137, 0, 0, 0, 1, 1,
1.123248, -2.79986, 3.947906, 0, 0, 0, 1, 1,
1.123354, -0.5839149, 3.29717, 0, 0, 0, 1, 1,
1.124009, 1.072736, -0.2243169, 0, 0, 0, 1, 1,
1.125414, 1.000574, 0.6198263, 0, 0, 0, 1, 1,
1.128252, -0.9273376, 3.340142, 1, 1, 1, 1, 1,
1.130624, 0.8826087, -1.544289, 1, 1, 1, 1, 1,
1.133738, 1.124819, 0.3852117, 1, 1, 1, 1, 1,
1.135718, -0.3555751, 1.381324, 1, 1, 1, 1, 1,
1.142591, -0.5081953, 2.007359, 1, 1, 1, 1, 1,
1.147794, -0.1834785, 0.8524048, 1, 1, 1, 1, 1,
1.154315, 0.6221824, 0.1853746, 1, 1, 1, 1, 1,
1.156274, 0.5326911, 0.9606068, 1, 1, 1, 1, 1,
1.157154, 0.508239, 1.023616, 1, 1, 1, 1, 1,
1.161021, 0.3225658, 1.838174, 1, 1, 1, 1, 1,
1.161208, -0.9749607, 2.107078, 1, 1, 1, 1, 1,
1.161281, -0.7198737, 2.933254, 1, 1, 1, 1, 1,
1.162326, -0.8297501, 1.542624, 1, 1, 1, 1, 1,
1.163514, 1.882139, 0.6741086, 1, 1, 1, 1, 1,
1.164572, -3.475486, 3.837726, 1, 1, 1, 1, 1,
1.178675, -1.00195, 1.004363, 0, 0, 1, 1, 1,
1.180571, -0.8458573, 2.81818, 1, 0, 0, 1, 1,
1.198822, 0.8873578, 0.4835744, 1, 0, 0, 1, 1,
1.200308, 0.4557831, 2.438009, 1, 0, 0, 1, 1,
1.201741, 0.3334766, 0.7604099, 1, 0, 0, 1, 1,
1.201885, 0.02708492, 1.044189, 1, 0, 0, 1, 1,
1.204306, 1.51584, 1.597024, 0, 0, 0, 1, 1,
1.208476, -0.2581731, 1.411001, 0, 0, 0, 1, 1,
1.217098, 1.116645, -1.392289, 0, 0, 0, 1, 1,
1.217871, -0.5414722, 2.629565, 0, 0, 0, 1, 1,
1.223989, 0.4358274, -0.1751953, 0, 0, 0, 1, 1,
1.229006, -0.6380231, 2.209666, 0, 0, 0, 1, 1,
1.229334, 1.032062, 0.9357942, 0, 0, 0, 1, 1,
1.230165, -1.89283, 2.207973, 1, 1, 1, 1, 1,
1.237347, 0.5174474, 0.9908316, 1, 1, 1, 1, 1,
1.239601, -0.4101299, 3.271875, 1, 1, 1, 1, 1,
1.244834, -0.9654923, 1.574072, 1, 1, 1, 1, 1,
1.245983, -0.187007, 1.068629, 1, 1, 1, 1, 1,
1.269692, -1.355957, 2.515521, 1, 1, 1, 1, 1,
1.279386, -0.2421049, 2.675892, 1, 1, 1, 1, 1,
1.282738, 0.9396168, -0.03353218, 1, 1, 1, 1, 1,
1.306656, -0.3375792, 1.788258, 1, 1, 1, 1, 1,
1.307413, -1.063813, 3.655384, 1, 1, 1, 1, 1,
1.311844, -1.753657, 1.403725, 1, 1, 1, 1, 1,
1.325673, 1.06175, 2.266021, 1, 1, 1, 1, 1,
1.329078, 0.2166665, 0.2240176, 1, 1, 1, 1, 1,
1.338779, 0.5197105, 2.251176, 1, 1, 1, 1, 1,
1.345006, 1.174412, -0.6041686, 1, 1, 1, 1, 1,
1.360392, 0.03485241, 3.264973, 0, 0, 1, 1, 1,
1.364179, -0.1679851, 3.26454, 1, 0, 0, 1, 1,
1.364321, 0.1995963, 1.827337, 1, 0, 0, 1, 1,
1.378391, -0.2098917, 2.90535, 1, 0, 0, 1, 1,
1.394445, -2.010857, 1.73837, 1, 0, 0, 1, 1,
1.399292, 0.07882686, 1.514273, 1, 0, 0, 1, 1,
1.399554, -0.02666611, 1.382323, 0, 0, 0, 1, 1,
1.429218, 1.437128, 0.4375692, 0, 0, 0, 1, 1,
1.462055, -0.4812445, 2.662608, 0, 0, 0, 1, 1,
1.466356, 0.4149116, 2.221141, 0, 0, 0, 1, 1,
1.476393, 0.07878016, -0.3438107, 0, 0, 0, 1, 1,
1.484798, -0.09823737, 1.694536, 0, 0, 0, 1, 1,
1.485669, -0.7472425, 0.4920827, 0, 0, 0, 1, 1,
1.495061, -0.8812578, 2.292109, 1, 1, 1, 1, 1,
1.498974, -0.3359862, 1.734367, 1, 1, 1, 1, 1,
1.499648, 0.9535859, -0.2027802, 1, 1, 1, 1, 1,
1.505292, -0.7108787, 3.219773, 1, 1, 1, 1, 1,
1.508566, 0.745138, 1.549635, 1, 1, 1, 1, 1,
1.545152, -0.3546031, 0.4792455, 1, 1, 1, 1, 1,
1.549836, 1.129874, 1.691947, 1, 1, 1, 1, 1,
1.589382, 0.7487905, -1.002195, 1, 1, 1, 1, 1,
1.611389, -0.5608326, 2.053668, 1, 1, 1, 1, 1,
1.617007, -0.1187041, 3.422386, 1, 1, 1, 1, 1,
1.619174, 0.2228657, 1.304396, 1, 1, 1, 1, 1,
1.625236, 1.120353, -1.306137, 1, 1, 1, 1, 1,
1.62585, -1.170942, 4.038483, 1, 1, 1, 1, 1,
1.637212, -0.1338352, 0.7207571, 1, 1, 1, 1, 1,
1.640323, -0.1983099, 1.32236, 1, 1, 1, 1, 1,
1.653409, 0.504128, 0.3055847, 0, 0, 1, 1, 1,
1.655387, -0.8374094, 2.610716, 1, 0, 0, 1, 1,
1.661746, 1.521936, 0.01393463, 1, 0, 0, 1, 1,
1.668264, -2.017807, 1.591334, 1, 0, 0, 1, 1,
1.676347, -1.315885, 1.17275, 1, 0, 0, 1, 1,
1.693773, -1.321051, 2.966708, 1, 0, 0, 1, 1,
1.69514, -1.17975, 2.882123, 0, 0, 0, 1, 1,
1.701779, -0.02041654, 1.265013, 0, 0, 0, 1, 1,
1.726079, -0.753539, 3.360803, 0, 0, 0, 1, 1,
1.73403, 0.5990664, 4.134125, 0, 0, 0, 1, 1,
1.738891, 0.7891423, 2.840216, 0, 0, 0, 1, 1,
1.73906, -0.9421225, 0.08276667, 0, 0, 0, 1, 1,
1.768911, 0.6580977, -0.2078622, 0, 0, 0, 1, 1,
1.778843, -1.154869, 1.404, 1, 1, 1, 1, 1,
1.809364, -0.04029602, -0.2428845, 1, 1, 1, 1, 1,
1.810322, -1.328507, 3.096401, 1, 1, 1, 1, 1,
1.820848, -0.9753038, 1.904695, 1, 1, 1, 1, 1,
1.823056, -0.2835252, 0.1817676, 1, 1, 1, 1, 1,
1.85037, 0.2905122, 2.064672, 1, 1, 1, 1, 1,
1.858771, -0.3133395, 1.391102, 1, 1, 1, 1, 1,
1.867585, -0.6407323, 0.1590751, 1, 1, 1, 1, 1,
1.883772, 0.07388606, 1.731454, 1, 1, 1, 1, 1,
1.893834, 1.05346, 2.63078, 1, 1, 1, 1, 1,
1.898749, 0.03864726, 0.6812399, 1, 1, 1, 1, 1,
1.90471, 0.3161809, 1.889149, 1, 1, 1, 1, 1,
1.934099, -1.186323, 1.731374, 1, 1, 1, 1, 1,
1.967093, 0.8133597, 0.9913721, 1, 1, 1, 1, 1,
1.992619, -1.941046, 2.647904, 1, 1, 1, 1, 1,
2.020898, 0.5140286, 0.7148636, 0, 0, 1, 1, 1,
2.031619, 0.2413876, 2.469924, 1, 0, 0, 1, 1,
2.084542, 1.569291, 0.6911486, 1, 0, 0, 1, 1,
2.188353, 1.315281, 1.535223, 1, 0, 0, 1, 1,
2.228515, 0.2943208, 2.948761, 1, 0, 0, 1, 1,
2.323703, -0.0006553528, 1.742523, 1, 0, 0, 1, 1,
2.324503, 0.4525853, 2.884767, 0, 0, 0, 1, 1,
2.355613, 0.4569485, 2.351974, 0, 0, 0, 1, 1,
2.390339, -1.416733, 1.686828, 0, 0, 0, 1, 1,
2.430882, 0.7640413, 2.596569, 0, 0, 0, 1, 1,
2.48628, -1.761906, 1.147397, 0, 0, 0, 1, 1,
2.491199, -0.4042982, 1.912278, 0, 0, 0, 1, 1,
2.492877, 0.2351617, 2.056153, 0, 0, 0, 1, 1,
2.535932, -1.579707, 1.753369, 1, 1, 1, 1, 1,
2.553761, 0.5757668, 2.052699, 1, 1, 1, 1, 1,
2.592722, -1.044931, 1.545802, 1, 1, 1, 1, 1,
2.702655, -0.4675137, 2.116894, 1, 1, 1, 1, 1,
2.866024, -1.129736, 2.085629, 1, 1, 1, 1, 1,
3.006917, -1.980183, 1.82764, 1, 1, 1, 1, 1,
3.066632, 1.729037, 1.778081, 1, 1, 1, 1, 1
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
var radius = 9.828675;
var distance = 34.5228;
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
mvMatrix.translate( 0.02064705, 0.2782459, 0.03371382 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -34.5228);
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