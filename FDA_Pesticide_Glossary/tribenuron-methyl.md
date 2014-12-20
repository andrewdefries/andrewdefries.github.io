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
-3.044667, 0.01490262, -0.8095937, 1, 0, 0, 1,
-2.918212, 0.2229817, -1.10032, 1, 0.007843138, 0, 1,
-2.901174, 1.384544, 1.688736, 1, 0.01176471, 0, 1,
-2.656253, 0.5996039, -2.44919, 1, 0.01960784, 0, 1,
-2.645061, -1.042636, -2.993644, 1, 0.02352941, 0, 1,
-2.592557, -2.299182, -1.075252, 1, 0.03137255, 0, 1,
-2.536992, -0.6325467, -0.3611631, 1, 0.03529412, 0, 1,
-2.375359, 1.228788, -1.719529, 1, 0.04313726, 0, 1,
-2.329409, -0.1156876, -1.184554, 1, 0.04705882, 0, 1,
-2.324769, -0.08634082, -1.620104, 1, 0.05490196, 0, 1,
-2.284287, -1.252298, -2.077895, 1, 0.05882353, 0, 1,
-2.274157, -0.1583394, -1.471697, 1, 0.06666667, 0, 1,
-2.273652, 1.193592, -0.9530274, 1, 0.07058824, 0, 1,
-2.272936, 0.8002305, -2.41362, 1, 0.07843138, 0, 1,
-2.260882, 1.468849, -1.683048, 1, 0.08235294, 0, 1,
-2.250501, -0.4633908, -1.439896, 1, 0.09019608, 0, 1,
-2.174019, -0.1052845, -1.145095, 1, 0.09411765, 0, 1,
-2.136231, -0.9504352, -1.786507, 1, 0.1019608, 0, 1,
-2.132969, -1.301567, -2.204888, 1, 0.1098039, 0, 1,
-2.110855, -0.5066674, -1.982651, 1, 0.1137255, 0, 1,
-2.092373, -0.5986716, -3.820869, 1, 0.1215686, 0, 1,
-2.083396, 0.7982976, -0.8327422, 1, 0.1254902, 0, 1,
-2.054862, 0.9829656, -2.241286, 1, 0.1333333, 0, 1,
-2.013011, -0.747945, -0.3565268, 1, 0.1372549, 0, 1,
-1.994298, -1.273458, -3.177986, 1, 0.145098, 0, 1,
-1.982648, 0.3742756, -1.604319, 1, 0.1490196, 0, 1,
-1.98041, 0.5805194, -1.199693, 1, 0.1568628, 0, 1,
-1.969914, -0.5323952, -1.099042, 1, 0.1607843, 0, 1,
-1.966951, -0.944326, -1.383008, 1, 0.1686275, 0, 1,
-1.960661, -2.12763, -2.640737, 1, 0.172549, 0, 1,
-1.934895, 0.660947, -1.088145, 1, 0.1803922, 0, 1,
-1.91228, -0.4695503, -0.8927298, 1, 0.1843137, 0, 1,
-1.908227, -0.6341197, -2.282629, 1, 0.1921569, 0, 1,
-1.903892, 1.254196, -1.016628, 1, 0.1960784, 0, 1,
-1.874953, 0.7505817, -0.08974007, 1, 0.2039216, 0, 1,
-1.867349, -1.595317, -2.934011, 1, 0.2117647, 0, 1,
-1.843783, -1.476197, -2.702128, 1, 0.2156863, 0, 1,
-1.831878, -1.501547, -3.536793, 1, 0.2235294, 0, 1,
-1.813966, 0.1352315, -1.919403, 1, 0.227451, 0, 1,
-1.727158, -0.4177038, -0.4992835, 1, 0.2352941, 0, 1,
-1.717052, -2.974478, -3.725132, 1, 0.2392157, 0, 1,
-1.704569, -2.274533, -2.549298, 1, 0.2470588, 0, 1,
-1.697753, 0.07090924, -2.602837, 1, 0.2509804, 0, 1,
-1.6925, 1.497558, -1.773591, 1, 0.2588235, 0, 1,
-1.682036, -2.031916, -1.681999, 1, 0.2627451, 0, 1,
-1.667877, -0.1063622, -3.655422, 1, 0.2705882, 0, 1,
-1.653282, -1.582039, -2.722496, 1, 0.2745098, 0, 1,
-1.637951, -0.2167139, -1.945546, 1, 0.282353, 0, 1,
-1.633822, -0.5582177, -0.8979427, 1, 0.2862745, 0, 1,
-1.631344, 1.002089, -0.8864492, 1, 0.2941177, 0, 1,
-1.628206, -0.2216574, -1.151066, 1, 0.3019608, 0, 1,
-1.621445, 0.1912324, -0.7577225, 1, 0.3058824, 0, 1,
-1.619373, -0.1635394, -1.994425, 1, 0.3137255, 0, 1,
-1.614676, 1.693171, -0.9152912, 1, 0.3176471, 0, 1,
-1.578771, -0.644981, -0.6657126, 1, 0.3254902, 0, 1,
-1.578277, -0.6042091, -1.810536, 1, 0.3294118, 0, 1,
-1.578045, -0.1951208, -1.326924, 1, 0.3372549, 0, 1,
-1.573673, -0.7360219, -3.048584, 1, 0.3411765, 0, 1,
-1.534677, 0.4351532, -1.191627, 1, 0.3490196, 0, 1,
-1.525854, 1.254611, -1.928897, 1, 0.3529412, 0, 1,
-1.522465, -0.629464, -2.779358, 1, 0.3607843, 0, 1,
-1.513165, 0.7745839, -1.638022, 1, 0.3647059, 0, 1,
-1.510075, -0.9322667, -0.03542148, 1, 0.372549, 0, 1,
-1.50393, 0.1270861, -1.088002, 1, 0.3764706, 0, 1,
-1.503428, 0.5644037, -0.4213108, 1, 0.3843137, 0, 1,
-1.491937, -0.08232027, -3.902569, 1, 0.3882353, 0, 1,
-1.444364, 0.1378551, -2.355042, 1, 0.3960784, 0, 1,
-1.431757, 0.1411634, -3.29696, 1, 0.4039216, 0, 1,
-1.429554, 0.5134027, -1.224102, 1, 0.4078431, 0, 1,
-1.428178, 2.015444, -0.7645253, 1, 0.4156863, 0, 1,
-1.42708, 0.3604133, -1.747996, 1, 0.4196078, 0, 1,
-1.423713, -1.99717, -3.10525, 1, 0.427451, 0, 1,
-1.415118, 1.926953, -0.2593523, 1, 0.4313726, 0, 1,
-1.407591, -1.244191, -3.21224, 1, 0.4392157, 0, 1,
-1.398685, 0.1782588, -1.875105, 1, 0.4431373, 0, 1,
-1.393035, -1.509989, -2.17574, 1, 0.4509804, 0, 1,
-1.381389, 1.907387, -0.7993026, 1, 0.454902, 0, 1,
-1.380007, -0.6557927, -2.456538, 1, 0.4627451, 0, 1,
-1.374789, 0.2731507, -0.8937817, 1, 0.4666667, 0, 1,
-1.362748, -0.6846635, -1.500407, 1, 0.4745098, 0, 1,
-1.357116, 0.3955172, -3.024937, 1, 0.4784314, 0, 1,
-1.34758, -1.745414, -4.343172, 1, 0.4862745, 0, 1,
-1.345603, -1.217267, -0.1722929, 1, 0.4901961, 0, 1,
-1.344186, 1.678466, -0.842343, 1, 0.4980392, 0, 1,
-1.341562, 0.7357164, -1.324895, 1, 0.5058824, 0, 1,
-1.340794, 0.7558323, -1.581301, 1, 0.509804, 0, 1,
-1.335931, -0.7856563, -3.143878, 1, 0.5176471, 0, 1,
-1.335828, 0.02725193, -3.491508, 1, 0.5215687, 0, 1,
-1.328096, 1.400109, 0.1682257, 1, 0.5294118, 0, 1,
-1.320119, 0.6324823, -2.073486, 1, 0.5333334, 0, 1,
-1.318619, 0.2441846, -2.47468, 1, 0.5411765, 0, 1,
-1.308127, 0.4789435, -0.7347123, 1, 0.5450981, 0, 1,
-1.303814, -1.221278, -1.688897, 1, 0.5529412, 0, 1,
-1.302905, 0.8828145, -1.949531, 1, 0.5568628, 0, 1,
-1.302247, -0.3964834, -3.197603, 1, 0.5647059, 0, 1,
-1.2935, 0.9131674, -2.047902, 1, 0.5686275, 0, 1,
-1.290195, -1.299807, -5.075002, 1, 0.5764706, 0, 1,
-1.289852, 1.663905, -0.9541004, 1, 0.5803922, 0, 1,
-1.287314, 1.821319, 0.9864818, 1, 0.5882353, 0, 1,
-1.284451, -0.2117913, -1.622516, 1, 0.5921569, 0, 1,
-1.28221, -0.5635979, -1.089904, 1, 0.6, 0, 1,
-1.274077, 0.8973318, -0.7700472, 1, 0.6078432, 0, 1,
-1.2623, 1.295877, -1.708019, 1, 0.6117647, 0, 1,
-1.260433, 2.026247, -1.356326, 1, 0.6196079, 0, 1,
-1.259784, 0.5126891, -1.099652, 1, 0.6235294, 0, 1,
-1.256936, 1.839831, -0.604804, 1, 0.6313726, 0, 1,
-1.253849, -1.218169, -3.310519, 1, 0.6352941, 0, 1,
-1.253534, -1.15292, -1.040948, 1, 0.6431373, 0, 1,
-1.252841, -0.2522579, -1.733973, 1, 0.6470588, 0, 1,
-1.250331, 0.7724797, -2.059239, 1, 0.654902, 0, 1,
-1.249803, -0.2005937, -0.4591509, 1, 0.6588235, 0, 1,
-1.24876, 1.539894, -0.6020616, 1, 0.6666667, 0, 1,
-1.247548, -0.005153375, -1.233976, 1, 0.6705883, 0, 1,
-1.242145, -1.050945, -1.99282, 1, 0.6784314, 0, 1,
-1.237883, 0.3554435, -0.5130464, 1, 0.682353, 0, 1,
-1.218264, 0.8729113, 0.2468518, 1, 0.6901961, 0, 1,
-1.215907, 0.2958067, -2.528122, 1, 0.6941177, 0, 1,
-1.207721, 1.202837, -2.584744, 1, 0.7019608, 0, 1,
-1.207194, -0.1611354, -0.3047122, 1, 0.7098039, 0, 1,
-1.194216, -2.078084, -3.167721, 1, 0.7137255, 0, 1,
-1.193998, 0.8173055, -1.967528, 1, 0.7215686, 0, 1,
-1.190173, 1.001616, -3.182674, 1, 0.7254902, 0, 1,
-1.17985, -1.295487, -2.729704, 1, 0.7333333, 0, 1,
-1.178787, 1.593918, -0.5788588, 1, 0.7372549, 0, 1,
-1.178045, 0.411121, -1.93302, 1, 0.7450981, 0, 1,
-1.170156, -0.0353075, -2.224819, 1, 0.7490196, 0, 1,
-1.167236, 0.5542489, -1.035012, 1, 0.7568628, 0, 1,
-1.157096, -0.1888117, -2.393947, 1, 0.7607843, 0, 1,
-1.152756, 0.4393319, 0.5496972, 1, 0.7686275, 0, 1,
-1.151705, 0.5427125, -0.6931921, 1, 0.772549, 0, 1,
-1.149955, -0.2053773, -1.538621, 1, 0.7803922, 0, 1,
-1.147604, 0.5413107, -1.460003, 1, 0.7843137, 0, 1,
-1.145992, 1.334043, -1.326451, 1, 0.7921569, 0, 1,
-1.141535, 0.458582, -2.182037, 1, 0.7960784, 0, 1,
-1.136025, 1.240463, -0.5376864, 1, 0.8039216, 0, 1,
-1.119043, -0.09614977, -2.635197, 1, 0.8117647, 0, 1,
-1.116861, 0.001365376, -2.655699, 1, 0.8156863, 0, 1,
-1.108104, 0.04100164, -1.836726, 1, 0.8235294, 0, 1,
-1.103942, 1.806921, -1.072845, 1, 0.827451, 0, 1,
-1.102808, -1.214887, -2.867635, 1, 0.8352941, 0, 1,
-1.098243, 0.2673815, -1.855307, 1, 0.8392157, 0, 1,
-1.063837, 1.643828, -1.185273, 1, 0.8470588, 0, 1,
-1.045828, -0.5929118, -2.14032, 1, 0.8509804, 0, 1,
-1.04213, 0.8918336, -2.720158, 1, 0.8588235, 0, 1,
-1.037707, -0.4323201, -2.526556, 1, 0.8627451, 0, 1,
-1.034348, 1.530239, -0.3336211, 1, 0.8705882, 0, 1,
-1.032198, -0.3613882, -3.330564, 1, 0.8745098, 0, 1,
-1.02665, -3.448908, -2.998864, 1, 0.8823529, 0, 1,
-1.017562, 2.289062, 0.8146981, 1, 0.8862745, 0, 1,
-1.017466, -0.5094191, -0.771701, 1, 0.8941177, 0, 1,
-1.014661, -0.6042232, -1.926742, 1, 0.8980392, 0, 1,
-1.011995, 1.569318, -0.6334157, 1, 0.9058824, 0, 1,
-1.010928, 1.033664, 1.090298, 1, 0.9137255, 0, 1,
-1.010173, 0.9654453, -1.743267, 1, 0.9176471, 0, 1,
-1.009927, -2.054693, -3.825259, 1, 0.9254902, 0, 1,
-1.006451, -0.3901228, -2.19454, 1, 0.9294118, 0, 1,
-1.005236, 1.611113, 0.2836621, 1, 0.9372549, 0, 1,
-1.002882, -0.9798397, -2.645894, 1, 0.9411765, 0, 1,
-0.9983608, 0.2123018, -0.5748802, 1, 0.9490196, 0, 1,
-0.9950599, 0.1905871, 0.004819417, 1, 0.9529412, 0, 1,
-0.9849174, 1.693984, 0.3973348, 1, 0.9607843, 0, 1,
-0.9811684, 2.245232, -0.6576651, 1, 0.9647059, 0, 1,
-0.9787529, 0.7966387, -1.165746, 1, 0.972549, 0, 1,
-0.9787019, -0.3378102, -2.03056, 1, 0.9764706, 0, 1,
-0.9693374, 0.7439767, -1.624637, 1, 0.9843137, 0, 1,
-0.9677818, -0.5364771, -3.215163, 1, 0.9882353, 0, 1,
-0.9653717, -0.5213292, -2.205247, 1, 0.9960784, 0, 1,
-0.9563115, 0.1819205, -1.60815, 0.9960784, 1, 0, 1,
-0.9539995, -0.710889, -3.138712, 0.9921569, 1, 0, 1,
-0.9520553, -0.06192515, -3.030717, 0.9843137, 1, 0, 1,
-0.9356499, 0.1223898, -0.7454632, 0.9803922, 1, 0, 1,
-0.9291751, 0.225084, -3.064211, 0.972549, 1, 0, 1,
-0.9290847, 1.035667, 0.5520133, 0.9686275, 1, 0, 1,
-0.9278038, 0.8739801, -0.06416401, 0.9607843, 1, 0, 1,
-0.9264717, 0.06269962, -1.775639, 0.9568627, 1, 0, 1,
-0.9194602, 0.6328643, 0.4383071, 0.9490196, 1, 0, 1,
-0.9153594, -0.7545601, -1.103737, 0.945098, 1, 0, 1,
-0.9111252, 0.8114494, -1.011108, 0.9372549, 1, 0, 1,
-0.9076058, -0.4190003, -1.809955, 0.9333333, 1, 0, 1,
-0.9023739, -1.817244, -1.366445, 0.9254902, 1, 0, 1,
-0.898636, -0.001437614, -0.7664723, 0.9215686, 1, 0, 1,
-0.8977813, 0.7001038, -1.167207, 0.9137255, 1, 0, 1,
-0.8971566, 0.05952965, -2.386462, 0.9098039, 1, 0, 1,
-0.894927, 0.8829861, -0.483726, 0.9019608, 1, 0, 1,
-0.8920863, -0.6331518, -2.610557, 0.8941177, 1, 0, 1,
-0.8899943, 0.694869, -1.182432, 0.8901961, 1, 0, 1,
-0.8856415, 1.054186, -1.871622, 0.8823529, 1, 0, 1,
-0.8850458, 1.422433, 1.1233, 0.8784314, 1, 0, 1,
-0.8822387, 0.5503199, -1.412547, 0.8705882, 1, 0, 1,
-0.8813809, -0.3773096, -2.878581, 0.8666667, 1, 0, 1,
-0.8781369, -0.5845122, -1.735796, 0.8588235, 1, 0, 1,
-0.8722255, 0.7861457, -1.704624, 0.854902, 1, 0, 1,
-0.8674622, -0.1668698, -3.086648, 0.8470588, 1, 0, 1,
-0.8672652, 1.013101, -1.567279, 0.8431373, 1, 0, 1,
-0.8634792, -0.7347367, -1.275699, 0.8352941, 1, 0, 1,
-0.8622379, 0.6174234, -2.882886, 0.8313726, 1, 0, 1,
-0.8601912, -1.040279, -1.6817, 0.8235294, 1, 0, 1,
-0.8546294, -1.143138, -2.299663, 0.8196079, 1, 0, 1,
-0.8459426, 0.3725717, -1.971941, 0.8117647, 1, 0, 1,
-0.8456708, 0.75426, -0.763752, 0.8078431, 1, 0, 1,
-0.8409653, 1.855417, 0.1678603, 0.8, 1, 0, 1,
-0.8397268, 0.2430455, -0.4620715, 0.7921569, 1, 0, 1,
-0.8376396, 0.8130443, -0.1865911, 0.7882353, 1, 0, 1,
-0.8349611, 1.015214, -2.019371, 0.7803922, 1, 0, 1,
-0.8336653, -1.894362, -3.839002, 0.7764706, 1, 0, 1,
-0.8281021, -0.3148046, -1.013795, 0.7686275, 1, 0, 1,
-0.8278062, 1.942311, -2.851131, 0.7647059, 1, 0, 1,
-0.8277227, 0.8917303, -0.6934465, 0.7568628, 1, 0, 1,
-0.8265887, -0.8438318, 1.004122, 0.7529412, 1, 0, 1,
-0.8220742, -0.3579623, -1.934645, 0.7450981, 1, 0, 1,
-0.8185388, 0.1946916, -2.873508, 0.7411765, 1, 0, 1,
-0.8182699, -0.7015024, -3.096975, 0.7333333, 1, 0, 1,
-0.8147298, 0.5718713, -2.0553, 0.7294118, 1, 0, 1,
-0.8138064, 0.6808801, -0.05003353, 0.7215686, 1, 0, 1,
-0.8132467, -0.5444903, -2.957338, 0.7176471, 1, 0, 1,
-0.808603, 0.764962, -0.9999779, 0.7098039, 1, 0, 1,
-0.8040172, 0.4260831, -0.5594124, 0.7058824, 1, 0, 1,
-0.8019276, -0.3986639, -3.361486, 0.6980392, 1, 0, 1,
-0.8008161, -0.02574265, -1.270322, 0.6901961, 1, 0, 1,
-0.7934855, 0.2391822, -0.9092013, 0.6862745, 1, 0, 1,
-0.7900252, -1.378702, -2.66257, 0.6784314, 1, 0, 1,
-0.7899434, -0.5441277, -1.831014, 0.6745098, 1, 0, 1,
-0.7830542, 1.218146, 0.7686116, 0.6666667, 1, 0, 1,
-0.7738857, -0.1519937, -2.551665, 0.6627451, 1, 0, 1,
-0.7723239, -0.4439988, -0.7885479, 0.654902, 1, 0, 1,
-0.769457, -0.3593048, -3.406707, 0.6509804, 1, 0, 1,
-0.767246, 0.8676301, -1.08476, 0.6431373, 1, 0, 1,
-0.7662694, 1.410885, -1.154665, 0.6392157, 1, 0, 1,
-0.7647014, 1.732221, 0.1160924, 0.6313726, 1, 0, 1,
-0.7565534, 0.2156613, -1.142304, 0.627451, 1, 0, 1,
-0.7542396, -0.4460885, -1.418451, 0.6196079, 1, 0, 1,
-0.752678, 1.214637, -0.8852886, 0.6156863, 1, 0, 1,
-0.7521384, 0.7036693, -1.413332, 0.6078432, 1, 0, 1,
-0.750702, 1.292257, 0.2153779, 0.6039216, 1, 0, 1,
-0.7381641, 0.8470523, -0.01995866, 0.5960785, 1, 0, 1,
-0.7356242, 1.256008, -1.280697, 0.5882353, 1, 0, 1,
-0.7314007, 1.611884, -2.736086, 0.5843138, 1, 0, 1,
-0.7297328, -1.062921, -2.316262, 0.5764706, 1, 0, 1,
-0.7296851, -0.6865711, -1.639831, 0.572549, 1, 0, 1,
-0.716869, 2.465226, 0.01590437, 0.5647059, 1, 0, 1,
-0.7086643, 1.02219, -1.34422, 0.5607843, 1, 0, 1,
-0.7084376, -0.9766096, -0.2795607, 0.5529412, 1, 0, 1,
-0.706875, -0.3904086, -1.220409, 0.5490196, 1, 0, 1,
-0.7012643, -0.187809, -2.659637, 0.5411765, 1, 0, 1,
-0.6999029, 1.208816, -2.782007, 0.5372549, 1, 0, 1,
-0.6994758, 1.89736, -1.168413, 0.5294118, 1, 0, 1,
-0.6908491, 1.042023, -1.133255, 0.5254902, 1, 0, 1,
-0.6866904, 1.90497, -0.7316203, 0.5176471, 1, 0, 1,
-0.6843735, -0.1014801, -2.688824, 0.5137255, 1, 0, 1,
-0.6817466, -0.148489, -2.483331, 0.5058824, 1, 0, 1,
-0.6656751, -0.05948442, -1.551151, 0.5019608, 1, 0, 1,
-0.6627294, 0.7322402, 0.03982392, 0.4941176, 1, 0, 1,
-0.6586479, -0.4796419, -1.305495, 0.4862745, 1, 0, 1,
-0.6524609, -1.795328, -3.452878, 0.4823529, 1, 0, 1,
-0.6469747, 1.113684, -1.004654, 0.4745098, 1, 0, 1,
-0.6446276, -1.979585, -2.670086, 0.4705882, 1, 0, 1,
-0.6441185, 1.176947, 1.146718, 0.4627451, 1, 0, 1,
-0.6415487, -0.7168657, -2.178438, 0.4588235, 1, 0, 1,
-0.638676, 0.09994522, -2.773692, 0.4509804, 1, 0, 1,
-0.6343576, -0.231386, -5.097919, 0.4470588, 1, 0, 1,
-0.6229872, -0.8854322, -0.4921469, 0.4392157, 1, 0, 1,
-0.6219835, -1.144102, -4.094451, 0.4352941, 1, 0, 1,
-0.6169486, 0.2069864, -0.8200126, 0.427451, 1, 0, 1,
-0.6089559, -1.911428, -3.493109, 0.4235294, 1, 0, 1,
-0.6076204, -1.07885, -3.221573, 0.4156863, 1, 0, 1,
-0.6069715, 0.5348001, -0.9627911, 0.4117647, 1, 0, 1,
-0.6044109, 0.8585994, -0.09355072, 0.4039216, 1, 0, 1,
-0.5925779, 0.4094885, -2.346925, 0.3960784, 1, 0, 1,
-0.5917783, -0.1866019, -2.189137, 0.3921569, 1, 0, 1,
-0.5915527, -0.4424361, -2.0582, 0.3843137, 1, 0, 1,
-0.5911304, 0.8589187, -1.878928, 0.3803922, 1, 0, 1,
-0.5886356, 0.7112201, 0.5687205, 0.372549, 1, 0, 1,
-0.5695075, -0.6737615, -3.753942, 0.3686275, 1, 0, 1,
-0.5688363, -0.2371147, -2.588308, 0.3607843, 1, 0, 1,
-0.5597496, 1.021237, 0.3315503, 0.3568628, 1, 0, 1,
-0.5589436, 0.007044061, -2.182975, 0.3490196, 1, 0, 1,
-0.5579804, -0.3965477, -0.8671384, 0.345098, 1, 0, 1,
-0.5578552, 0.5554725, -0.3938923, 0.3372549, 1, 0, 1,
-0.5476426, 1.058625, 0.4872296, 0.3333333, 1, 0, 1,
-0.5431914, -0.3715636, -0.2131243, 0.3254902, 1, 0, 1,
-0.5363495, -1.461834, -1.24433, 0.3215686, 1, 0, 1,
-0.5341946, 1.142901, 2.306551, 0.3137255, 1, 0, 1,
-0.5311982, 0.4665236, -0.1167366, 0.3098039, 1, 0, 1,
-0.5311046, -2.383929, -4.137423, 0.3019608, 1, 0, 1,
-0.5284745, 0.2806191, 1.252382, 0.2941177, 1, 0, 1,
-0.5281261, 0.0899481, -1.966854, 0.2901961, 1, 0, 1,
-0.5257975, -0.2432239, -3.774691, 0.282353, 1, 0, 1,
-0.5222883, 0.3552966, -0.5101052, 0.2784314, 1, 0, 1,
-0.5216264, 0.1569177, -1.049217, 0.2705882, 1, 0, 1,
-0.5198842, -2.57853, -2.587104, 0.2666667, 1, 0, 1,
-0.5177795, 0.7537645, -2.281462, 0.2588235, 1, 0, 1,
-0.5167302, 0.01671866, -0.6179464, 0.254902, 1, 0, 1,
-0.5153567, -1.515759, -2.695409, 0.2470588, 1, 0, 1,
-0.5139649, -0.7423896, -3.327023, 0.2431373, 1, 0, 1,
-0.5132195, -0.868736, -3.810229, 0.2352941, 1, 0, 1,
-0.5119818, -1.03535, -3.065303, 0.2313726, 1, 0, 1,
-0.5106622, -0.7143691, -2.207778, 0.2235294, 1, 0, 1,
-0.5098548, 0.2884473, -1.639386, 0.2196078, 1, 0, 1,
-0.5058373, 0.6209439, -0.598966, 0.2117647, 1, 0, 1,
-0.5026289, -0.08253417, -2.095523, 0.2078431, 1, 0, 1,
-0.4979943, 0.5036041, 0.733282, 0.2, 1, 0, 1,
-0.4945157, 0.1482441, -2.751194, 0.1921569, 1, 0, 1,
-0.48862, 1.776149, 0.2121267, 0.1882353, 1, 0, 1,
-0.4871645, 0.2955348, -1.558943, 0.1803922, 1, 0, 1,
-0.4806174, -0.2774464, -2.863225, 0.1764706, 1, 0, 1,
-0.4777532, -1.790395, -3.209487, 0.1686275, 1, 0, 1,
-0.4713171, -1.609873, -4.532052, 0.1647059, 1, 0, 1,
-0.4707236, -1.881102, -5.151946, 0.1568628, 1, 0, 1,
-0.4683217, 1.292666, -0.5714279, 0.1529412, 1, 0, 1,
-0.4677466, 0.08215119, -0.5745301, 0.145098, 1, 0, 1,
-0.4673891, -0.9551944, -2.139564, 0.1411765, 1, 0, 1,
-0.4621965, -0.6585068, -4.28006, 0.1333333, 1, 0, 1,
-0.4577833, -1.146351, -3.394097, 0.1294118, 1, 0, 1,
-0.4552349, -0.5672321, -1.745437, 0.1215686, 1, 0, 1,
-0.4539725, -0.9301729, -0.5039216, 0.1176471, 1, 0, 1,
-0.4538233, 0.195818, -1.510906, 0.1098039, 1, 0, 1,
-0.4526195, -1.960235, -3.185761, 0.1058824, 1, 0, 1,
-0.4495004, 0.7532215, 0.7853839, 0.09803922, 1, 0, 1,
-0.4467753, -0.1257654, -2.127619, 0.09019608, 1, 0, 1,
-0.4448985, 0.6641586, -2.826377, 0.08627451, 1, 0, 1,
-0.4447283, -0.7010632, -1.488962, 0.07843138, 1, 0, 1,
-0.4435581, 0.8324315, 0.9782172, 0.07450981, 1, 0, 1,
-0.4422197, 2.525768, -0.9542288, 0.06666667, 1, 0, 1,
-0.4409526, 1.411097, -0.5270321, 0.0627451, 1, 0, 1,
-0.4387678, -0.4473898, -2.687351, 0.05490196, 1, 0, 1,
-0.4357734, 1.041502, -1.64459, 0.05098039, 1, 0, 1,
-0.4288708, -0.6325066, -2.014329, 0.04313726, 1, 0, 1,
-0.4286573, 0.4412018, -1.110381, 0.03921569, 1, 0, 1,
-0.4281417, 1.669651, -0.6955774, 0.03137255, 1, 0, 1,
-0.4272672, -1.367016, -2.034676, 0.02745098, 1, 0, 1,
-0.4254983, 1.800181, 0.1213102, 0.01960784, 1, 0, 1,
-0.4110837, -0.9425296, -3.193299, 0.01568628, 1, 0, 1,
-0.4099585, -0.5930675, -2.310821, 0.007843138, 1, 0, 1,
-0.4087932, -1.371487, -3.43155, 0.003921569, 1, 0, 1,
-0.4087049, 0.9760585, -1.860971, 0, 1, 0.003921569, 1,
-0.4084649, -0.5698794, -2.965214, 0, 1, 0.01176471, 1,
-0.4048376, 0.2101121, 0.7341716, 0, 1, 0.01568628, 1,
-0.4009421, -1.63173, -1.978611, 0, 1, 0.02352941, 1,
-0.398508, 1.060559, -0.747588, 0, 1, 0.02745098, 1,
-0.3940228, -1.78059, -3.538142, 0, 1, 0.03529412, 1,
-0.3855842, -0.1936455, -1.164684, 0, 1, 0.03921569, 1,
-0.3819891, 0.3044047, -0.522406, 0, 1, 0.04705882, 1,
-0.3799218, -0.857613, -2.906873, 0, 1, 0.05098039, 1,
-0.3760802, 0.5066784, 0.1626161, 0, 1, 0.05882353, 1,
-0.3696675, -0.3946375, -3.33733, 0, 1, 0.0627451, 1,
-0.3693877, 1.120474, -0.7758039, 0, 1, 0.07058824, 1,
-0.3673529, 1.296643, -1.374197, 0, 1, 0.07450981, 1,
-0.3659907, -0.0490292, -2.619314, 0, 1, 0.08235294, 1,
-0.3639079, -1.950653, -3.166387, 0, 1, 0.08627451, 1,
-0.3638296, 0.08328328, -0.9084354, 0, 1, 0.09411765, 1,
-0.3602558, 0.0332237, -0.9361017, 0, 1, 0.1019608, 1,
-0.3570054, 1.267722, -0.8551099, 0, 1, 0.1058824, 1,
-0.3568429, -0.7848127, -4.62605, 0, 1, 0.1137255, 1,
-0.3540692, 1.301746, -0.9907039, 0, 1, 0.1176471, 1,
-0.3501304, 0.2363465, -0.5528573, 0, 1, 0.1254902, 1,
-0.3471146, -0.366918, -1.034106, 0, 1, 0.1294118, 1,
-0.3461238, -0.1823667, -1.938848, 0, 1, 0.1372549, 1,
-0.3449102, 0.930143, 0.1871525, 0, 1, 0.1411765, 1,
-0.3441547, 0.8011531, -0.1997455, 0, 1, 0.1490196, 1,
-0.3423057, -1.314565, -3.418739, 0, 1, 0.1529412, 1,
-0.3349898, -0.195245, -2.710312, 0, 1, 0.1607843, 1,
-0.332683, -1.774564, -3.97537, 0, 1, 0.1647059, 1,
-0.3288416, -0.4851113, -1.510375, 0, 1, 0.172549, 1,
-0.3275182, -0.4147031, -3.565695, 0, 1, 0.1764706, 1,
-0.3260225, -1.304148, -2.932002, 0, 1, 0.1843137, 1,
-0.3237705, -0.5618694, -1.480827, 0, 1, 0.1882353, 1,
-0.3203357, -0.6480811, -3.236055, 0, 1, 0.1960784, 1,
-0.3144016, -1.724255, -3.079837, 0, 1, 0.2039216, 1,
-0.3120702, 0.58586, -0.7660617, 0, 1, 0.2078431, 1,
-0.3107061, -1.141362, -1.447002, 0, 1, 0.2156863, 1,
-0.3093101, 0.8431964, 0.4787051, 0, 1, 0.2196078, 1,
-0.3066203, 0.2385893, 0.09789585, 0, 1, 0.227451, 1,
-0.3060575, -0.376859, -2.304199, 0, 1, 0.2313726, 1,
-0.3050074, 0.7088523, -0.3980502, 0, 1, 0.2392157, 1,
-0.2979268, 1.095816, -0.2227513, 0, 1, 0.2431373, 1,
-0.2967401, 0.137486, -3.182033, 0, 1, 0.2509804, 1,
-0.2965943, 0.5453376, -1.010021, 0, 1, 0.254902, 1,
-0.2964468, -0.477853, -2.562757, 0, 1, 0.2627451, 1,
-0.2892549, 0.03441226, -2.833978, 0, 1, 0.2666667, 1,
-0.2880177, -1.225342, -4.35526, 0, 1, 0.2745098, 1,
-0.287085, 1.350437, 0.5198012, 0, 1, 0.2784314, 1,
-0.285853, 3.093276, -1.0437, 0, 1, 0.2862745, 1,
-0.2835438, -0.8237882, -2.012505, 0, 1, 0.2901961, 1,
-0.281572, 1.12685, 0.8426574, 0, 1, 0.2980392, 1,
-0.2811659, -0.2374889, -3.596798, 0, 1, 0.3058824, 1,
-0.2782767, -0.2850621, -2.319057, 0, 1, 0.3098039, 1,
-0.2776526, 0.2111503, -1.699888, 0, 1, 0.3176471, 1,
-0.2775293, 0.1920961, -1.388447, 0, 1, 0.3215686, 1,
-0.2764, 0.2771905, -0.9799777, 0, 1, 0.3294118, 1,
-0.2720808, 1.281762, -0.8002375, 0, 1, 0.3333333, 1,
-0.2677505, 0.4354939, 1.130424, 0, 1, 0.3411765, 1,
-0.2657876, -0.3829708, -0.9172943, 0, 1, 0.345098, 1,
-0.2636529, 0.1522098, -0.2241519, 0, 1, 0.3529412, 1,
-0.2593837, 1.099267, -1.07929, 0, 1, 0.3568628, 1,
-0.2568657, -1.14769, -2.541611, 0, 1, 0.3647059, 1,
-0.2568081, 0.967752, -1.516306, 0, 1, 0.3686275, 1,
-0.2536105, 1.012388, -1.651276, 0, 1, 0.3764706, 1,
-0.2494251, -1.370571, -2.122185, 0, 1, 0.3803922, 1,
-0.2488661, 0.3087126, -1.799562, 0, 1, 0.3882353, 1,
-0.2475615, -0.1864895, -3.019426, 0, 1, 0.3921569, 1,
-0.2455709, -1.18149, -2.67733, 0, 1, 0.4, 1,
-0.2432965, 0.5176649, -0.2189383, 0, 1, 0.4078431, 1,
-0.2396048, -0.5014373, -1.859899, 0, 1, 0.4117647, 1,
-0.2313257, -0.4188923, -2.73112, 0, 1, 0.4196078, 1,
-0.22821, -0.1799098, -1.024416, 0, 1, 0.4235294, 1,
-0.2242969, -1.384793, -4.288847, 0, 1, 0.4313726, 1,
-0.2168311, -0.0774955, -2.548616, 0, 1, 0.4352941, 1,
-0.2158718, -1.239369, -1.615021, 0, 1, 0.4431373, 1,
-0.2152825, -0.2247182, -4.336446, 0, 1, 0.4470588, 1,
-0.2111456, 1.690221, 0.006821878, 0, 1, 0.454902, 1,
-0.2110075, -1.029433, -3.789696, 0, 1, 0.4588235, 1,
-0.2106149, 0.7875325, -0.2113454, 0, 1, 0.4666667, 1,
-0.2093307, -0.8740617, -3.933165, 0, 1, 0.4705882, 1,
-0.208282, 0.9694822, 0.5609314, 0, 1, 0.4784314, 1,
-0.204997, 0.544362, 0.6832108, 0, 1, 0.4823529, 1,
-0.203426, -0.6974025, -5.186974, 0, 1, 0.4901961, 1,
-0.2008927, -0.07855651, -1.84257, 0, 1, 0.4941176, 1,
-0.198231, 0.2569374, -0.855766, 0, 1, 0.5019608, 1,
-0.1949802, 1.182272, -0.7893741, 0, 1, 0.509804, 1,
-0.1926085, 1.669472, -2.321408, 0, 1, 0.5137255, 1,
-0.1902029, 0.9387951, -0.4494678, 0, 1, 0.5215687, 1,
-0.1839511, -0.5428333, -3.541766, 0, 1, 0.5254902, 1,
-0.182798, -1.198764, -2.333234, 0, 1, 0.5333334, 1,
-0.1827075, 2.277408, 0.6991905, 0, 1, 0.5372549, 1,
-0.1826432, 0.7337006, 0.2251625, 0, 1, 0.5450981, 1,
-0.1820858, 1.572149, -0.8252743, 0, 1, 0.5490196, 1,
-0.1820112, 0.630933, -0.060088, 0, 1, 0.5568628, 1,
-0.1814376, -1.031566, -2.999031, 0, 1, 0.5607843, 1,
-0.1806511, 0.7487137, 1.088997, 0, 1, 0.5686275, 1,
-0.1760254, -0.2060438, -2.946934, 0, 1, 0.572549, 1,
-0.1748504, -1.515772, -3.497672, 0, 1, 0.5803922, 1,
-0.1729906, -1.097259, -1.511394, 0, 1, 0.5843138, 1,
-0.1723181, 0.897507, -0.02847577, 0, 1, 0.5921569, 1,
-0.169143, 0.9993009, -0.9151542, 0, 1, 0.5960785, 1,
-0.1682586, -0.2823861, -2.573615, 0, 1, 0.6039216, 1,
-0.1663953, -0.2633286, -4.367139, 0, 1, 0.6117647, 1,
-0.1662065, -0.3068307, -2.678824, 0, 1, 0.6156863, 1,
-0.1616716, 1.193212, 0.2166903, 0, 1, 0.6235294, 1,
-0.1602511, 1.23916, -1.265549, 0, 1, 0.627451, 1,
-0.1589942, -0.8923262, -1.936126, 0, 1, 0.6352941, 1,
-0.1560759, 1.816857, -0.01030314, 0, 1, 0.6392157, 1,
-0.1549472, 0.5760154, -1.718993, 0, 1, 0.6470588, 1,
-0.1526446, -0.3624165, -2.57887, 0, 1, 0.6509804, 1,
-0.1412069, 0.9623803, -0.8065062, 0, 1, 0.6588235, 1,
-0.1320846, 0.7053444, 0.5883009, 0, 1, 0.6627451, 1,
-0.1319616, 0.06518643, -0.4896399, 0, 1, 0.6705883, 1,
-0.1289986, -0.865486, -3.131431, 0, 1, 0.6745098, 1,
-0.1240717, 2.449159, 0.6803349, 0, 1, 0.682353, 1,
-0.1212114, 0.8936097, -0.9289436, 0, 1, 0.6862745, 1,
-0.112802, -0.1221999, -1.12088, 0, 1, 0.6941177, 1,
-0.1124268, 0.06328884, -2.489825, 0, 1, 0.7019608, 1,
-0.1123846, -0.2331323, -3.444407, 0, 1, 0.7058824, 1,
-0.1105449, 0.6290696, 0.02987412, 0, 1, 0.7137255, 1,
-0.1103461, 0.3690445, 1.152901, 0, 1, 0.7176471, 1,
-0.1097903, -2.167525, -2.520215, 0, 1, 0.7254902, 1,
-0.1096511, 1.657257, -1.942741, 0, 1, 0.7294118, 1,
-0.1078477, -1.053155, -2.993782, 0, 1, 0.7372549, 1,
-0.1075372, 0.2834824, -0.714427, 0, 1, 0.7411765, 1,
-0.1071431, 0.63553, 0.4419723, 0, 1, 0.7490196, 1,
-0.1041904, -1.200832, -2.83238, 0, 1, 0.7529412, 1,
-0.10317, 0.9280531, -0.472078, 0, 1, 0.7607843, 1,
-0.0994419, -1.75283, -3.021194, 0, 1, 0.7647059, 1,
-0.09836862, 0.7846923, -1.144651, 0, 1, 0.772549, 1,
-0.09225916, 2.415633, 0.6056868, 0, 1, 0.7764706, 1,
-0.09083175, 1.27222, 0.02708741, 0, 1, 0.7843137, 1,
-0.08165067, -1.319165, -3.254727, 0, 1, 0.7882353, 1,
-0.07479787, -1.822224, -1.932045, 0, 1, 0.7960784, 1,
-0.07286541, 0.1410486, -0.7291073, 0, 1, 0.8039216, 1,
-0.0716751, 0.01912934, -0.868639, 0, 1, 0.8078431, 1,
-0.06933218, -0.3980303, -3.92236, 0, 1, 0.8156863, 1,
-0.06726225, -0.5054316, -3.389555, 0, 1, 0.8196079, 1,
-0.0665631, -0.09249541, -3.560718, 0, 1, 0.827451, 1,
-0.06523518, 1.689583, 0.8375418, 0, 1, 0.8313726, 1,
-0.063314, 0.1040002, -0.8453627, 0, 1, 0.8392157, 1,
-0.06148905, -0.1090535, -2.852233, 0, 1, 0.8431373, 1,
-0.05983788, -0.1932087, -3.392977, 0, 1, 0.8509804, 1,
-0.05565807, -0.528371, -2.124656, 0, 1, 0.854902, 1,
-0.05532048, 0.4609039, 0.5370466, 0, 1, 0.8627451, 1,
-0.05517318, 0.6522885, -1.177038, 0, 1, 0.8666667, 1,
-0.05416841, 0.2053312, -1.158218, 0, 1, 0.8745098, 1,
-0.05100473, 2.214085, -0.01774734, 0, 1, 0.8784314, 1,
-0.04837212, -0.1131948, -2.617804, 0, 1, 0.8862745, 1,
-0.04824763, 1.060866, 0.9678131, 0, 1, 0.8901961, 1,
-0.04612688, 0.3205006, -1.329154, 0, 1, 0.8980392, 1,
-0.04044161, 0.5932735, 0.9816551, 0, 1, 0.9058824, 1,
-0.03072774, 3.119957, -0.04013513, 0, 1, 0.9098039, 1,
-0.02861479, -0.3338086, -3.931042, 0, 1, 0.9176471, 1,
-0.02807236, 0.699078, -0.5949506, 0, 1, 0.9215686, 1,
-0.02750492, -0.5304319, -4.205225, 0, 1, 0.9294118, 1,
-0.02378335, 0.07998364, 0.5782281, 0, 1, 0.9333333, 1,
-0.02325243, 1.360666, -0.2995037, 0, 1, 0.9411765, 1,
-0.01987251, -0.8457789, -2.093785, 0, 1, 0.945098, 1,
-0.01891924, -0.4237224, -3.39647, 0, 1, 0.9529412, 1,
-0.01674147, 1.340603, -0.2517981, 0, 1, 0.9568627, 1,
-0.01568415, 0.1057577, -0.1508946, 0, 1, 0.9647059, 1,
-0.01559983, 0.5484686, -0.3747723, 0, 1, 0.9686275, 1,
-0.007858252, -0.1953511, -3.26455, 0, 1, 0.9764706, 1,
-0.00438522, -0.2570805, -3.480328, 0, 1, 0.9803922, 1,
0.01211814, -0.5829935, 2.620795, 0, 1, 0.9882353, 1,
0.01596037, 0.8801189, -0.3792303, 0, 1, 0.9921569, 1,
0.01615997, -0.4411089, 3.50396, 0, 1, 1, 1,
0.01733758, -0.795966, 3.045784, 0, 0.9921569, 1, 1,
0.020231, -0.4588903, 2.087118, 0, 0.9882353, 1, 1,
0.02027405, 1.646674, -0.2343338, 0, 0.9803922, 1, 1,
0.02454507, 0.6121182, -0.5412822, 0, 0.9764706, 1, 1,
0.02579113, -1.096857, 3.49641, 0, 0.9686275, 1, 1,
0.02945123, 2.008071, -0.8171502, 0, 0.9647059, 1, 1,
0.03180719, 0.6500386, 1.113936, 0, 0.9568627, 1, 1,
0.03237157, -1.344262, 2.424617, 0, 0.9529412, 1, 1,
0.03415397, 0.7731819, -1.054878, 0, 0.945098, 1, 1,
0.03562509, -1.242501, 3.880329, 0, 0.9411765, 1, 1,
0.04001623, 0.9383974, -0.3514703, 0, 0.9333333, 1, 1,
0.0425081, 0.1598524, 1.517297, 0, 0.9294118, 1, 1,
0.04347342, -2.078177, 3.139137, 0, 0.9215686, 1, 1,
0.04830788, 0.4672565, 0.7050942, 0, 0.9176471, 1, 1,
0.04947613, 2.324469, 0.2819818, 0, 0.9098039, 1, 1,
0.05043065, 1.407038, 1.154724, 0, 0.9058824, 1, 1,
0.05344073, -0.502427, 2.064279, 0, 0.8980392, 1, 1,
0.05398178, -0.2453338, 2.28424, 0, 0.8901961, 1, 1,
0.05450054, 0.790036, 1.697006, 0, 0.8862745, 1, 1,
0.06100979, 2.30291, 0.7848214, 0, 0.8784314, 1, 1,
0.06199658, 1.214612, 0.7543209, 0, 0.8745098, 1, 1,
0.06446838, 0.4316429, -1.662766, 0, 0.8666667, 1, 1,
0.06469782, 2.217423, -0.7054422, 0, 0.8627451, 1, 1,
0.06549756, -0.8768948, 2.510806, 0, 0.854902, 1, 1,
0.06844666, -1.07785, 2.898915, 0, 0.8509804, 1, 1,
0.0715689, -0.4020435, 2.693586, 0, 0.8431373, 1, 1,
0.07172206, 0.2004996, -1.442524, 0, 0.8392157, 1, 1,
0.074783, 2.945776, 0.6820989, 0, 0.8313726, 1, 1,
0.07486398, -0.9901963, 4.317983, 0, 0.827451, 1, 1,
0.07596657, 1.476128, -0.6880907, 0, 0.8196079, 1, 1,
0.07743908, 0.3664107, -0.8952509, 0, 0.8156863, 1, 1,
0.0818247, 0.3470028, -1.479738, 0, 0.8078431, 1, 1,
0.08456919, 0.6232678, 1.024452, 0, 0.8039216, 1, 1,
0.08505632, 1.193835, -0.0752736, 0, 0.7960784, 1, 1,
0.08547445, 1.673213, 2.390788, 0, 0.7882353, 1, 1,
0.08626307, 0.06821492, 0.7229528, 0, 0.7843137, 1, 1,
0.08787277, 0.09328883, 1.062719, 0, 0.7764706, 1, 1,
0.08973778, -0.6237564, 3.557781, 0, 0.772549, 1, 1,
0.09150016, -1.054481, 2.849615, 0, 0.7647059, 1, 1,
0.09357944, 0.2550769, 2.25454, 0, 0.7607843, 1, 1,
0.09757204, 0.2426332, -0.074348, 0, 0.7529412, 1, 1,
0.1000365, 2.281157, -0.7192405, 0, 0.7490196, 1, 1,
0.1019562, 0.3730173, 1.891816, 0, 0.7411765, 1, 1,
0.1022821, -1.718658, 2.943952, 0, 0.7372549, 1, 1,
0.1027173, -0.3865911, 2.482619, 0, 0.7294118, 1, 1,
0.1076802, -0.8924447, 4.300156, 0, 0.7254902, 1, 1,
0.1115011, -1.410701, 1.950743, 0, 0.7176471, 1, 1,
0.112329, -0.4935527, 1.997478, 0, 0.7137255, 1, 1,
0.1148598, 0.7202761, 0.2236079, 0, 0.7058824, 1, 1,
0.1165529, -0.8555079, 3.619488, 0, 0.6980392, 1, 1,
0.1241397, -0.1423609, 1.949666, 0, 0.6941177, 1, 1,
0.1246441, -0.3741094, 1.494852, 0, 0.6862745, 1, 1,
0.1246611, -0.07300215, -0.007350761, 0, 0.682353, 1, 1,
0.1255786, 0.4013071, 0.5128792, 0, 0.6745098, 1, 1,
0.1306537, 0.989643, -0.6789076, 0, 0.6705883, 1, 1,
0.1313942, 0.7839853, 1.592092, 0, 0.6627451, 1, 1,
0.1362514, -0.8381489, 3.032629, 0, 0.6588235, 1, 1,
0.1378961, 0.2226482, 1.201437, 0, 0.6509804, 1, 1,
0.1395591, -1.278472, 3.261825, 0, 0.6470588, 1, 1,
0.140205, -0.615239, 3.200131, 0, 0.6392157, 1, 1,
0.1440117, -0.5203034, 2.243943, 0, 0.6352941, 1, 1,
0.1460764, -0.6867644, 4.729998, 0, 0.627451, 1, 1,
0.1461598, 0.1912975, -2.018703, 0, 0.6235294, 1, 1,
0.1487097, -0.2336328, 1.915624, 0, 0.6156863, 1, 1,
0.1491237, -0.6486275, 3.837404, 0, 0.6117647, 1, 1,
0.1513926, 0.1830527, -0.6460092, 0, 0.6039216, 1, 1,
0.1538136, 0.4528622, 1.248561, 0, 0.5960785, 1, 1,
0.1560171, 1.275352, 0.02644468, 0, 0.5921569, 1, 1,
0.1587757, 1.097702, -0.6021215, 0, 0.5843138, 1, 1,
0.1609297, 0.06968816, 2.531713, 0, 0.5803922, 1, 1,
0.1612649, -0.3533317, 2.801186, 0, 0.572549, 1, 1,
0.1650564, -1.205017, 5.121914, 0, 0.5686275, 1, 1,
0.1670344, -0.3469526, 3.569423, 0, 0.5607843, 1, 1,
0.169903, 0.5009713, -0.01427263, 0, 0.5568628, 1, 1,
0.170118, 0.6554242, -0.700637, 0, 0.5490196, 1, 1,
0.1711662, 0.2499215, 1.478516, 0, 0.5450981, 1, 1,
0.1772677, -1.364416, 3.187169, 0, 0.5372549, 1, 1,
0.1785603, 1.182505, 0.5226461, 0, 0.5333334, 1, 1,
0.178784, -0.6561705, 3.811482, 0, 0.5254902, 1, 1,
0.1789915, 0.9089071, 0.01095105, 0, 0.5215687, 1, 1,
0.1798308, 1.070032, -0.01494528, 0, 0.5137255, 1, 1,
0.185879, -0.2956246, 4.591255, 0, 0.509804, 1, 1,
0.1859812, 1.036386, -0.4920993, 0, 0.5019608, 1, 1,
0.1871726, -0.8217345, 4.356546, 0, 0.4941176, 1, 1,
0.1878745, 1.306905, -0.1496522, 0, 0.4901961, 1, 1,
0.1893034, 0.4104131, 1.949716, 0, 0.4823529, 1, 1,
0.1924331, -0.2860496, 1.423988, 0, 0.4784314, 1, 1,
0.1926998, -0.4023063, 2.027858, 0, 0.4705882, 1, 1,
0.193387, -1.76494, 2.269158, 0, 0.4666667, 1, 1,
0.1948779, -0.4872788, 2.631083, 0, 0.4588235, 1, 1,
0.1975635, 1.012184, -0.01705398, 0, 0.454902, 1, 1,
0.20414, -0.1496775, 0.8199205, 0, 0.4470588, 1, 1,
0.2071509, 0.1903933, 0.3182346, 0, 0.4431373, 1, 1,
0.2084519, -0.169051, 1.0952, 0, 0.4352941, 1, 1,
0.2169286, 0.0214971, 1.082547, 0, 0.4313726, 1, 1,
0.2180151, 0.385702, 1.019918, 0, 0.4235294, 1, 1,
0.219545, -1.990899, 4.066923, 0, 0.4196078, 1, 1,
0.220849, 0.3048548, 0.4971516, 0, 0.4117647, 1, 1,
0.2230088, 1.581868, 0.5728793, 0, 0.4078431, 1, 1,
0.2280302, 0.6174799, 0.1909752, 0, 0.4, 1, 1,
0.2320801, -0.04280027, 1.051897, 0, 0.3921569, 1, 1,
0.2400872, 0.1170178, 1.217576, 0, 0.3882353, 1, 1,
0.2432136, -0.08123776, 1.812371, 0, 0.3803922, 1, 1,
0.2446348, 1.22812, -0.2158623, 0, 0.3764706, 1, 1,
0.25964, -1.197889, 3.681164, 0, 0.3686275, 1, 1,
0.2691967, 0.2550269, -0.7384275, 0, 0.3647059, 1, 1,
0.2716663, -1.245649, 2.913087, 0, 0.3568628, 1, 1,
0.2744805, 0.244938, 1.520735, 0, 0.3529412, 1, 1,
0.2768537, -0.303243, 2.734413, 0, 0.345098, 1, 1,
0.2773638, -0.1175207, 3.159105, 0, 0.3411765, 1, 1,
0.2822277, -1.013247, 4.023812, 0, 0.3333333, 1, 1,
0.2823537, 1.608793, 1.119428, 0, 0.3294118, 1, 1,
0.2850949, -1.021792, 3.643101, 0, 0.3215686, 1, 1,
0.289778, 1.172898, 0.6197019, 0, 0.3176471, 1, 1,
0.2951571, 0.7433594, -0.7593437, 0, 0.3098039, 1, 1,
0.2974298, 0.4467302, 0.09057348, 0, 0.3058824, 1, 1,
0.312674, -0.157849, 3.203714, 0, 0.2980392, 1, 1,
0.3155877, -0.4481571, 3.794519, 0, 0.2901961, 1, 1,
0.316194, -0.3935299, 3.647617, 0, 0.2862745, 1, 1,
0.3167411, -1.675816, 2.586146, 0, 0.2784314, 1, 1,
0.3185015, 0.127513, 1.638989, 0, 0.2745098, 1, 1,
0.3225748, -1.582717, 1.858094, 0, 0.2666667, 1, 1,
0.3233346, 0.6896167, -0.1436815, 0, 0.2627451, 1, 1,
0.3329874, -0.7800148, 3.492019, 0, 0.254902, 1, 1,
0.334434, 0.2953197, 2.561573, 0, 0.2509804, 1, 1,
0.3353356, -1.45374, 4.959989, 0, 0.2431373, 1, 1,
0.3359405, -0.1586272, 2.306468, 0, 0.2392157, 1, 1,
0.3422193, 0.01047015, 1.304161, 0, 0.2313726, 1, 1,
0.3426973, 0.9688675, -1.266772, 0, 0.227451, 1, 1,
0.3449217, 0.2021761, 1.076561, 0, 0.2196078, 1, 1,
0.3501467, 1.203483, 0.02256035, 0, 0.2156863, 1, 1,
0.3510836, 0.4319435, 0.4082095, 0, 0.2078431, 1, 1,
0.3560893, 1.96049, 2.714658, 0, 0.2039216, 1, 1,
0.3611261, 1.177748, 0.8948048, 0, 0.1960784, 1, 1,
0.3612353, 0.5688751, 0.3922642, 0, 0.1882353, 1, 1,
0.3621921, -0.4065401, 1.583506, 0, 0.1843137, 1, 1,
0.3633103, -0.9321605, 2.403945, 0, 0.1764706, 1, 1,
0.3644831, 0.5198143, 1.000673, 0, 0.172549, 1, 1,
0.3694931, 0.4078974, -1.844201, 0, 0.1647059, 1, 1,
0.3696304, 0.06740049, 0.168489, 0, 0.1607843, 1, 1,
0.3723473, 1.260562, 2.836615, 0, 0.1529412, 1, 1,
0.3766598, -0.1956591, 2.664543, 0, 0.1490196, 1, 1,
0.3778371, -0.04622372, 0.6125701, 0, 0.1411765, 1, 1,
0.3834107, -0.7031518, 1.940449, 0, 0.1372549, 1, 1,
0.3928797, -0.3042459, 1.982337, 0, 0.1294118, 1, 1,
0.3944232, -0.269617, 0.9460854, 0, 0.1254902, 1, 1,
0.4037675, 1.574374, -0.4860049, 0, 0.1176471, 1, 1,
0.4062475, -0.2186095, 0.9799024, 0, 0.1137255, 1, 1,
0.4072348, 0.5115839, -0.1595845, 0, 0.1058824, 1, 1,
0.4120487, -1.455056, 4.56404, 0, 0.09803922, 1, 1,
0.4145881, 0.5916429, 1.760048, 0, 0.09411765, 1, 1,
0.4162957, 0.673912, 0.1718199, 0, 0.08627451, 1, 1,
0.4231881, 0.5197391, 1.120525, 0, 0.08235294, 1, 1,
0.4242086, 1.43567, 1.524535, 0, 0.07450981, 1, 1,
0.4314193, -0.08692522, 2.601707, 0, 0.07058824, 1, 1,
0.4329841, 0.6929231, 0.3180804, 0, 0.0627451, 1, 1,
0.4353862, 0.2385301, 1.025801, 0, 0.05882353, 1, 1,
0.436906, 0.7265938, 0.3236136, 0, 0.05098039, 1, 1,
0.43783, 0.4399827, 2.471005, 0, 0.04705882, 1, 1,
0.4419624, -1.557879, 4.404008, 0, 0.03921569, 1, 1,
0.4546706, -1.281139, 4.211541, 0, 0.03529412, 1, 1,
0.4566202, -0.4069987, 2.866882, 0, 0.02745098, 1, 1,
0.4574378, -1.876284, 4.162863, 0, 0.02352941, 1, 1,
0.4574753, -0.1538502, 1.074741, 0, 0.01568628, 1, 1,
0.4596364, -1.151966, 3.573126, 0, 0.01176471, 1, 1,
0.460567, 1.535004, -0.2708721, 0, 0.003921569, 1, 1,
0.4662849, -0.03585578, 0.9219112, 0.003921569, 0, 1, 1,
0.4678481, -0.08329868, 2.200509, 0.007843138, 0, 1, 1,
0.4693481, -0.5701735, 0.8289998, 0.01568628, 0, 1, 1,
0.470318, -0.607123, 2.893772, 0.01960784, 0, 1, 1,
0.4731314, -1.556564, 1.905142, 0.02745098, 0, 1, 1,
0.4735894, 1.799771, 0.493055, 0.03137255, 0, 1, 1,
0.4753657, -0.5714809, 2.892844, 0.03921569, 0, 1, 1,
0.4855422, -1.833211, 2.669295, 0.04313726, 0, 1, 1,
0.4864194, 2.136585, 1.124417, 0.05098039, 0, 1, 1,
0.4882239, 1.382272, 0.1198412, 0.05490196, 0, 1, 1,
0.490679, 1.300565, 0.1904453, 0.0627451, 0, 1, 1,
0.4918174, 0.5968779, 2.712065, 0.06666667, 0, 1, 1,
0.4983644, -0.6189095, 2.911884, 0.07450981, 0, 1, 1,
0.4994498, -0.4178152, 3.49209, 0.07843138, 0, 1, 1,
0.5021518, 0.1959492, 0.1513972, 0.08627451, 0, 1, 1,
0.5042447, 0.2120929, 0.4801962, 0.09019608, 0, 1, 1,
0.5044378, -0.6315889, 3.177565, 0.09803922, 0, 1, 1,
0.5046604, -1.99229, 2.755539, 0.1058824, 0, 1, 1,
0.5066306, 0.03072085, 2.611386, 0.1098039, 0, 1, 1,
0.5072566, 0.128108, 1.246655, 0.1176471, 0, 1, 1,
0.5080959, -1.328187, 4.197961, 0.1215686, 0, 1, 1,
0.5175661, -1.98294, 3.283724, 0.1294118, 0, 1, 1,
0.5180188, -0.1912545, 1.943877, 0.1333333, 0, 1, 1,
0.5202397, 0.6434291, -0.7754735, 0.1411765, 0, 1, 1,
0.5226766, -1.013486, 2.289973, 0.145098, 0, 1, 1,
0.522857, -0.9663497, 2.343441, 0.1529412, 0, 1, 1,
0.5284148, -1.4954, 4.047127, 0.1568628, 0, 1, 1,
0.5295458, 1.476558, -2.346666, 0.1647059, 0, 1, 1,
0.5301438, -0.8558508, 3.511822, 0.1686275, 0, 1, 1,
0.5326914, 0.5461027, 2.95266, 0.1764706, 0, 1, 1,
0.5332056, 0.656926, 1.600735, 0.1803922, 0, 1, 1,
0.5368044, 1.322082, -0.3894975, 0.1882353, 0, 1, 1,
0.5391887, -0.1558945, 3.508289, 0.1921569, 0, 1, 1,
0.5436882, -1.739647, 1.247168, 0.2, 0, 1, 1,
0.5438766, -0.02493919, 0.393324, 0.2078431, 0, 1, 1,
0.5505334, 1.486881, 0.5521861, 0.2117647, 0, 1, 1,
0.5515069, -1.354753, 0.9760749, 0.2196078, 0, 1, 1,
0.5537575, 0.1471515, -1.044091, 0.2235294, 0, 1, 1,
0.5555915, 0.6897219, -0.643231, 0.2313726, 0, 1, 1,
0.5586656, 0.5322043, 1.197284, 0.2352941, 0, 1, 1,
0.5600216, 0.7471033, 2.013038, 0.2431373, 0, 1, 1,
0.5614661, -0.5892954, 2.646364, 0.2470588, 0, 1, 1,
0.5642484, -1.520786, 3.091395, 0.254902, 0, 1, 1,
0.5693663, -0.1976813, 1.260663, 0.2588235, 0, 1, 1,
0.57016, -0.2230093, 1.449948, 0.2666667, 0, 1, 1,
0.5735136, 1.298378, 0.4763277, 0.2705882, 0, 1, 1,
0.5741659, 0.2439086, -0.1868024, 0.2784314, 0, 1, 1,
0.5766101, -0.04550551, 1.394073, 0.282353, 0, 1, 1,
0.5772557, 0.1592804, 1.832091, 0.2901961, 0, 1, 1,
0.5779217, 1.710705, 0.5300213, 0.2941177, 0, 1, 1,
0.5825924, -1.018451, 2.316551, 0.3019608, 0, 1, 1,
0.5842148, -0.5059298, 2.763994, 0.3098039, 0, 1, 1,
0.5843636, -0.2997815, 0.8314336, 0.3137255, 0, 1, 1,
0.5863334, -0.8056986, 1.331791, 0.3215686, 0, 1, 1,
0.5940727, -1.287339, 4.834215, 0.3254902, 0, 1, 1,
0.5955369, -1.267752, 2.719679, 0.3333333, 0, 1, 1,
0.6011395, 0.5854923, 2.770564, 0.3372549, 0, 1, 1,
0.6032802, -0.1025482, 2.25508, 0.345098, 0, 1, 1,
0.6096141, 1.732019, 1.181646, 0.3490196, 0, 1, 1,
0.6172899, -0.1237149, 2.728288, 0.3568628, 0, 1, 1,
0.6235993, 0.6590493, 0.9284091, 0.3607843, 0, 1, 1,
0.6244126, 0.4764606, 0.5365977, 0.3686275, 0, 1, 1,
0.6247307, 1.613241, -1.237681, 0.372549, 0, 1, 1,
0.6317959, -0.7338896, 4.740624, 0.3803922, 0, 1, 1,
0.6358114, -1.366238, 1.865271, 0.3843137, 0, 1, 1,
0.637756, 1.023989, -0.625579, 0.3921569, 0, 1, 1,
0.6393775, -2.790669, 3.651492, 0.3960784, 0, 1, 1,
0.642545, -0.3494782, 1.572278, 0.4039216, 0, 1, 1,
0.6451027, -0.02886602, 0.4579706, 0.4117647, 0, 1, 1,
0.6468295, -0.9752347, 3.067595, 0.4156863, 0, 1, 1,
0.6583337, -1.722834, 2.855436, 0.4235294, 0, 1, 1,
0.6591265, 0.3312683, 2.069262, 0.427451, 0, 1, 1,
0.6618204, 0.6664507, 1.060309, 0.4352941, 0, 1, 1,
0.6629738, -0.649772, 3.450258, 0.4392157, 0, 1, 1,
0.6668296, 1.563931, 1.842472, 0.4470588, 0, 1, 1,
0.6750541, 1.256198, 0.8797024, 0.4509804, 0, 1, 1,
0.6784344, 1.278707, -0.9096265, 0.4588235, 0, 1, 1,
0.6793532, -0.3163415, 4.186493, 0.4627451, 0, 1, 1,
0.6927716, -1.014969, 1.625318, 0.4705882, 0, 1, 1,
0.694894, -1.668143, 2.803293, 0.4745098, 0, 1, 1,
0.6966673, 0.6855614, -0.8316505, 0.4823529, 0, 1, 1,
0.6989667, -0.9306374, 1.664911, 0.4862745, 0, 1, 1,
0.7000403, 1.488011, 0.09210336, 0.4941176, 0, 1, 1,
0.7021999, 0.5271099, 1.853311, 0.5019608, 0, 1, 1,
0.7070431, 0.2915361, -0.07288159, 0.5058824, 0, 1, 1,
0.7101177, 1.910439, -1.833842, 0.5137255, 0, 1, 1,
0.7130631, 0.07524403, 0.7444906, 0.5176471, 0, 1, 1,
0.7191142, 1.090043, 0.42073, 0.5254902, 0, 1, 1,
0.7242005, -0.09982022, 2.826192, 0.5294118, 0, 1, 1,
0.7273982, 0.5795906, -1.082111, 0.5372549, 0, 1, 1,
0.7299269, 0.8904353, 0.4819493, 0.5411765, 0, 1, 1,
0.7324076, -0.3489676, 1.172622, 0.5490196, 0, 1, 1,
0.7335474, 2.130783, -0.5667372, 0.5529412, 0, 1, 1,
0.7385081, -0.0886857, 2.222133, 0.5607843, 0, 1, 1,
0.7394373, -0.147121, 0.71948, 0.5647059, 0, 1, 1,
0.7398692, -1.381384, 2.754616, 0.572549, 0, 1, 1,
0.7414914, -0.9830222, 1.188516, 0.5764706, 0, 1, 1,
0.7425316, -0.1637736, 2.197138, 0.5843138, 0, 1, 1,
0.7431195, 0.1451112, 2.666734, 0.5882353, 0, 1, 1,
0.7431513, 0.08951987, 1.596194, 0.5960785, 0, 1, 1,
0.7480415, 0.2425752, 2.245153, 0.6039216, 0, 1, 1,
0.7528297, -0.559258, 2.833689, 0.6078432, 0, 1, 1,
0.7538215, 1.07075, 0.9180718, 0.6156863, 0, 1, 1,
0.7549638, 2.134261, 0.3994527, 0.6196079, 0, 1, 1,
0.7619573, -0.3033235, 2.923339, 0.627451, 0, 1, 1,
0.7667745, -0.1612543, 0.6149955, 0.6313726, 0, 1, 1,
0.7689959, -1.860295, 4.141006, 0.6392157, 0, 1, 1,
0.7751321, -0.02512638, 0.7138351, 0.6431373, 0, 1, 1,
0.7758924, -0.4272677, 2.079881, 0.6509804, 0, 1, 1,
0.7811599, 1.179985, 0.2710797, 0.654902, 0, 1, 1,
0.7898014, 1.847703, 0.1492689, 0.6627451, 0, 1, 1,
0.799171, -1.01398, 2.764612, 0.6666667, 0, 1, 1,
0.8007904, -0.1849884, 2.49505, 0.6745098, 0, 1, 1,
0.8038806, 0.4777302, 0.08494932, 0.6784314, 0, 1, 1,
0.8050207, -1.468906, 2.355505, 0.6862745, 0, 1, 1,
0.8086264, -0.7693293, 2.964601, 0.6901961, 0, 1, 1,
0.8108917, 0.4051389, 0.711996, 0.6980392, 0, 1, 1,
0.8119308, -0.6934729, 1.332353, 0.7058824, 0, 1, 1,
0.8123822, -0.2085912, 2.448557, 0.7098039, 0, 1, 1,
0.8137786, 0.3541222, 1.37694, 0.7176471, 0, 1, 1,
0.8157353, -1.265744, 2.842209, 0.7215686, 0, 1, 1,
0.8167527, 0.3071368, -0.6567646, 0.7294118, 0, 1, 1,
0.8171657, -0.3049924, 1.923631, 0.7333333, 0, 1, 1,
0.8227547, -0.2953914, 2.252814, 0.7411765, 0, 1, 1,
0.8337926, 0.2265828, 1.385161, 0.7450981, 0, 1, 1,
0.835098, 0.5591886, 3.164763, 0.7529412, 0, 1, 1,
0.8448448, 0.2857759, 1.696865, 0.7568628, 0, 1, 1,
0.8509107, -0.07125579, 1.912757, 0.7647059, 0, 1, 1,
0.8671336, 0.5795584, 0.8436052, 0.7686275, 0, 1, 1,
0.8693507, 0.2828581, 1.92697, 0.7764706, 0, 1, 1,
0.8716127, 0.3716634, 0.1163682, 0.7803922, 0, 1, 1,
0.8728627, -0.6003387, 2.747766, 0.7882353, 0, 1, 1,
0.8749279, -0.4617333, 1.475624, 0.7921569, 0, 1, 1,
0.8763708, 0.9175796, -0.6987952, 0.8, 0, 1, 1,
0.887436, -0.445418, 0.4064897, 0.8078431, 0, 1, 1,
0.8874978, 1.691502, 0.2062001, 0.8117647, 0, 1, 1,
0.8886226, 0.7700429, 1.536631, 0.8196079, 0, 1, 1,
0.8891125, -0.09232602, 2.500103, 0.8235294, 0, 1, 1,
0.895555, -0.5534191, 2.245253, 0.8313726, 0, 1, 1,
0.8959969, 1.154118, 0.2193824, 0.8352941, 0, 1, 1,
0.8985719, 1.10928, -0.2952129, 0.8431373, 0, 1, 1,
0.9016771, 0.9493645, 0.7245613, 0.8470588, 0, 1, 1,
0.9018495, -1.08902, 2.009293, 0.854902, 0, 1, 1,
0.9036172, 0.5414727, 0.213561, 0.8588235, 0, 1, 1,
0.9044678, 0.5103813, 1.359326, 0.8666667, 0, 1, 1,
0.9056512, 0.1616227, 1.977906, 0.8705882, 0, 1, 1,
0.9129941, -0.1317179, 2.604386, 0.8784314, 0, 1, 1,
0.9134741, -0.856116, 2.653345, 0.8823529, 0, 1, 1,
0.9160097, 0.244162, 0.3776601, 0.8901961, 0, 1, 1,
0.9172652, 2.077523, 0.9687623, 0.8941177, 0, 1, 1,
0.9183204, -0.4118585, 2.388623, 0.9019608, 0, 1, 1,
0.9226512, -3.217794, 2.619115, 0.9098039, 0, 1, 1,
0.9231163, 1.65012, 1.315992, 0.9137255, 0, 1, 1,
0.9236176, -0.9419782, 1.519265, 0.9215686, 0, 1, 1,
0.9270097, 0.8398029, 2.068231, 0.9254902, 0, 1, 1,
0.9271596, 0.8005085, 0.8712283, 0.9333333, 0, 1, 1,
0.9277578, -1.421609, 2.169295, 0.9372549, 0, 1, 1,
0.9299254, -0.07699697, 1.01482, 0.945098, 0, 1, 1,
0.9346613, 0.6250469, 2.129445, 0.9490196, 0, 1, 1,
0.9365066, -0.4837941, 1.540523, 0.9568627, 0, 1, 1,
0.9378541, 1.079917, -0.01706866, 0.9607843, 0, 1, 1,
0.9430003, -1.276274, 2.562909, 0.9686275, 0, 1, 1,
0.943234, 0.4138416, 1.547966, 0.972549, 0, 1, 1,
0.9448087, 0.1918385, 1.626177, 0.9803922, 0, 1, 1,
0.9453539, 0.160671, 1.651121, 0.9843137, 0, 1, 1,
0.9454741, -0.8214181, 2.009598, 0.9921569, 0, 1, 1,
0.9474243, 0.831269, 0.9161116, 0.9960784, 0, 1, 1,
0.9487044, 0.1187947, 1.249669, 1, 0, 0.9960784, 1,
0.9492772, -0.1577147, 1.131964, 1, 0, 0.9882353, 1,
0.9533792, 0.1182838, 2.331762, 1, 0, 0.9843137, 1,
0.9538248, 0.08551501, 3.949419, 1, 0, 0.9764706, 1,
0.955135, 0.814316, 0.6068563, 1, 0, 0.972549, 1,
0.9779975, 0.7360528, 1.018788, 1, 0, 0.9647059, 1,
0.9806576, -2.013182, 3.043215, 1, 0, 0.9607843, 1,
0.9820853, 0.3429807, 0.2981641, 1, 0, 0.9529412, 1,
0.992816, 0.05462807, 2.915941, 1, 0, 0.9490196, 1,
0.9941495, -0.8307598, 2.149268, 1, 0, 0.9411765, 1,
0.9958422, 0.9342721, 0.8104441, 1, 0, 0.9372549, 1,
0.9967256, 1.275575, 0.6748239, 1, 0, 0.9294118, 1,
0.9986671, -0.1449542, 0.07950084, 1, 0, 0.9254902, 1,
0.9991726, 0.5881375, -0.7742069, 1, 0, 0.9176471, 1,
1.000142, 1.672529, 1.133995, 1, 0, 0.9137255, 1,
1.002412, 1.398418, 0.8706717, 1, 0, 0.9058824, 1,
1.003928, -0.1723646, 3.582699, 1, 0, 0.9019608, 1,
1.007854, -0.08674326, 1.558125, 1, 0, 0.8941177, 1,
1.007923, -0.9192033, 3.065959, 1, 0, 0.8862745, 1,
1.009879, 0.6217877, 2.012166, 1, 0, 0.8823529, 1,
1.012325, -0.8902393, 1.127973, 1, 0, 0.8745098, 1,
1.01248, -0.3666077, 3.10339, 1, 0, 0.8705882, 1,
1.018448, -1.764754, 3.092734, 1, 0, 0.8627451, 1,
1.01927, -0.1714544, 1.186589, 1, 0, 0.8588235, 1,
1.02171, 1.873461, -1.122224, 1, 0, 0.8509804, 1,
1.023196, 1.060174, 1.950791, 1, 0, 0.8470588, 1,
1.031083, 1.815934, 1.251645, 1, 0, 0.8392157, 1,
1.033639, 0.3149729, 1.264432, 1, 0, 0.8352941, 1,
1.033839, 0.7552439, 0.9040409, 1, 0, 0.827451, 1,
1.034352, -0.4687918, 3.442023, 1, 0, 0.8235294, 1,
1.035868, 0.4470141, 0.1239906, 1, 0, 0.8156863, 1,
1.038197, -2.614994, 3.623169, 1, 0, 0.8117647, 1,
1.03846, 0.08782043, 2.079271, 1, 0, 0.8039216, 1,
1.03883, 0.4646306, 0.2911725, 1, 0, 0.7960784, 1,
1.039022, -0.9762333, 3.625326, 1, 0, 0.7921569, 1,
1.039506, 0.9937471, 1.525596, 1, 0, 0.7843137, 1,
1.043433, -0.5349592, 1.756462, 1, 0, 0.7803922, 1,
1.044443, -0.2067827, 0.984947, 1, 0, 0.772549, 1,
1.048747, 0.03491072, 2.424633, 1, 0, 0.7686275, 1,
1.050517, 1.308319, 2.912714, 1, 0, 0.7607843, 1,
1.052281, 1.484588, 0.7783422, 1, 0, 0.7568628, 1,
1.055544, 0.2259894, 2.904765, 1, 0, 0.7490196, 1,
1.061599, -1.142376, 2.642417, 1, 0, 0.7450981, 1,
1.080889, 1.182739, 1.742473, 1, 0, 0.7372549, 1,
1.086788, -1.042723, 1.830166, 1, 0, 0.7333333, 1,
1.091283, 1.067486, 1.552355, 1, 0, 0.7254902, 1,
1.097215, 0.123272, 2.184816, 1, 0, 0.7215686, 1,
1.098285, 0.6159592, 1.998785, 1, 0, 0.7137255, 1,
1.10588, 0.5160226, 1.562712, 1, 0, 0.7098039, 1,
1.107352, -0.6153977, 1.15636, 1, 0, 0.7019608, 1,
1.107674, 0.1471008, 0.860294, 1, 0, 0.6941177, 1,
1.110137, 1.653333, -0.9039034, 1, 0, 0.6901961, 1,
1.11793, -0.06350917, 1.652577, 1, 0, 0.682353, 1,
1.123989, 0.5873851, 2.015188, 1, 0, 0.6784314, 1,
1.125306, -1.139399, 2.126836, 1, 0, 0.6705883, 1,
1.12982, 1.028243, 2.48354, 1, 0, 0.6666667, 1,
1.140187, 1.862285, -0.02886559, 1, 0, 0.6588235, 1,
1.147834, -0.07004336, 2.826504, 1, 0, 0.654902, 1,
1.164081, 1.54108, 0.2154708, 1, 0, 0.6470588, 1,
1.165879, 1.698152, 0.7615775, 1, 0, 0.6431373, 1,
1.17325, -0.4857447, 2.786487, 1, 0, 0.6352941, 1,
1.174823, -0.5116347, 1.678105, 1, 0, 0.6313726, 1,
1.175588, -0.3733014, 0.9213276, 1, 0, 0.6235294, 1,
1.178365, 2.891171, 1.291145, 1, 0, 0.6196079, 1,
1.197536, 1.69959, 1.039645, 1, 0, 0.6117647, 1,
1.204913, 0.217115, 0.4600814, 1, 0, 0.6078432, 1,
1.205998, 0.9155785, 0.2816406, 1, 0, 0.6, 1,
1.209605, 0.2690617, 1.925907, 1, 0, 0.5921569, 1,
1.214545, -1.554398, 1.365115, 1, 0, 0.5882353, 1,
1.21694, -0.1474728, 1.459492, 1, 0, 0.5803922, 1,
1.217136, 0.1229385, 2.297787, 1, 0, 0.5764706, 1,
1.21801, -1.546854, 3.769688, 1, 0, 0.5686275, 1,
1.220729, 1.422664, 2.369389, 1, 0, 0.5647059, 1,
1.226022, 0.101411, 2.242027, 1, 0, 0.5568628, 1,
1.22962, 0.674569, 2.529957, 1, 0, 0.5529412, 1,
1.233586, -0.3645401, 1.015048, 1, 0, 0.5450981, 1,
1.233913, -0.3049076, 1.350564, 1, 0, 0.5411765, 1,
1.270966, -0.5407423, 3.980031, 1, 0, 0.5333334, 1,
1.279276, -0.04915313, 1.98765, 1, 0, 0.5294118, 1,
1.279726, 0.6132356, 1.797649, 1, 0, 0.5215687, 1,
1.28206, -1.376911, 0.9705888, 1, 0, 0.5176471, 1,
1.30337, -1.294933, 2.984751, 1, 0, 0.509804, 1,
1.303511, -0.3953413, 2.445531, 1, 0, 0.5058824, 1,
1.308736, -1.336392, 3.200347, 1, 0, 0.4980392, 1,
1.310883, -0.08985768, 0.9449806, 1, 0, 0.4901961, 1,
1.331455, 1.279711, 0.7969036, 1, 0, 0.4862745, 1,
1.332996, -1.81914, 3.220835, 1, 0, 0.4784314, 1,
1.355657, 0.2778152, 1.743557, 1, 0, 0.4745098, 1,
1.357463, 1.351462, -0.591139, 1, 0, 0.4666667, 1,
1.36435, -0.01743898, 1.59375, 1, 0, 0.4627451, 1,
1.365277, 0.8406189, 0.9369004, 1, 0, 0.454902, 1,
1.371503, -0.03328518, 1.805832, 1, 0, 0.4509804, 1,
1.374013, -0.5396182, 0.566084, 1, 0, 0.4431373, 1,
1.385251, 1.132648, 0.8431754, 1, 0, 0.4392157, 1,
1.387865, -0.5634552, 0.4976566, 1, 0, 0.4313726, 1,
1.393927, -0.5040166, 1.213327, 1, 0, 0.427451, 1,
1.394635, 0.0305639, 2.53771, 1, 0, 0.4196078, 1,
1.406967, -0.4400541, 1.321968, 1, 0, 0.4156863, 1,
1.409467, -0.1306469, 4.500489, 1, 0, 0.4078431, 1,
1.411654, -0.3888684, 1.65435, 1, 0, 0.4039216, 1,
1.416584, -0.3801147, 0.8258513, 1, 0, 0.3960784, 1,
1.41684, 0.4048068, 0.0950108, 1, 0, 0.3882353, 1,
1.419317, 0.2951991, 1.320816, 1, 0, 0.3843137, 1,
1.44034, 0.6645051, 2.682361, 1, 0, 0.3764706, 1,
1.444727, -1.695211, 2.735285, 1, 0, 0.372549, 1,
1.448747, 0.6166626, 1.404085, 1, 0, 0.3647059, 1,
1.450379, 0.2065593, 0.9976486, 1, 0, 0.3607843, 1,
1.454351, -0.8713486, 2.177109, 1, 0, 0.3529412, 1,
1.454881, 0.4231702, 3.060625, 1, 0, 0.3490196, 1,
1.484532, -0.5592548, 1.489842, 1, 0, 0.3411765, 1,
1.500497, -0.9235016, 0.4175804, 1, 0, 0.3372549, 1,
1.532924, 0.5806, 1.526748, 1, 0, 0.3294118, 1,
1.533335, -0.4167265, 1.27128, 1, 0, 0.3254902, 1,
1.538034, 0.5885158, 0.8536459, 1, 0, 0.3176471, 1,
1.541202, -0.8896641, 3.003774, 1, 0, 0.3137255, 1,
1.575635, 0.4216923, 1.308312, 1, 0, 0.3058824, 1,
1.577317, 0.004130659, 1.959344, 1, 0, 0.2980392, 1,
1.606464, -0.5106907, 1.586385, 1, 0, 0.2941177, 1,
1.612613, -0.1427579, 1.833233, 1, 0, 0.2862745, 1,
1.613346, 2.492659, -0.1508426, 1, 0, 0.282353, 1,
1.621243, 0.4039316, 3.111118, 1, 0, 0.2745098, 1,
1.623831, -1.32748, 2.955039, 1, 0, 0.2705882, 1,
1.62613, 0.8604116, -1.198201, 1, 0, 0.2627451, 1,
1.636927, -0.4698755, 3.248029, 1, 0, 0.2588235, 1,
1.693443, 1.255231, 1.620031, 1, 0, 0.2509804, 1,
1.706412, 0.1226912, 1.097384, 1, 0, 0.2470588, 1,
1.733246, 0.3555513, 0.639426, 1, 0, 0.2392157, 1,
1.799282, 0.6352782, -0.04621236, 1, 0, 0.2352941, 1,
1.799491, -0.6580589, 2.795373, 1, 0, 0.227451, 1,
1.80791, 0.6112511, 3.446922, 1, 0, 0.2235294, 1,
1.816837, -1.708104, 3.276024, 1, 0, 0.2156863, 1,
1.820819, -1.580676, 1.229653, 1, 0, 0.2117647, 1,
1.829696, -0.8804234, 3.07846, 1, 0, 0.2039216, 1,
1.83236, 0.8987356, 1.636263, 1, 0, 0.1960784, 1,
1.83424, -0.0688084, 2.95913, 1, 0, 0.1921569, 1,
1.836362, 0.005125303, 0.7955561, 1, 0, 0.1843137, 1,
1.856234, 0.378134, 0.5351049, 1, 0, 0.1803922, 1,
1.870145, 0.5560175, 1.587179, 1, 0, 0.172549, 1,
1.876516, -0.08349186, 3.232147, 1, 0, 0.1686275, 1,
1.877358, 0.4958139, 0.8063241, 1, 0, 0.1607843, 1,
1.918577, 0.3872134, 1.50745, 1, 0, 0.1568628, 1,
1.980746, -0.8442242, 0.9664226, 1, 0, 0.1490196, 1,
1.988761, 2.055763, 0.9155222, 1, 0, 0.145098, 1,
2.04273, -0.2486621, 0.5431041, 1, 0, 0.1372549, 1,
2.055557, -1.006328, 2.831912, 1, 0, 0.1333333, 1,
2.055597, 1.223608, 1.531462, 1, 0, 0.1254902, 1,
2.062415, 1.353197, 1.892215, 1, 0, 0.1215686, 1,
2.067461, -0.3516114, 1.534592, 1, 0, 0.1137255, 1,
2.071123, 0.4440746, 0.8404057, 1, 0, 0.1098039, 1,
2.071546, -1.346914, 2.973325, 1, 0, 0.1019608, 1,
2.079386, -0.01170143, 0.7606381, 1, 0, 0.09411765, 1,
2.083063, 0.3432316, 1.163818, 1, 0, 0.09019608, 1,
2.083917, -0.9124009, 2.592315, 1, 0, 0.08235294, 1,
2.103421, 0.06068781, 1.768251, 1, 0, 0.07843138, 1,
2.109032, 0.5376925, 0.2821069, 1, 0, 0.07058824, 1,
2.11865, 0.3130952, 1.616831, 1, 0, 0.06666667, 1,
2.15675, 0.8345565, 3.189137, 1, 0, 0.05882353, 1,
2.256064, 0.1463327, 0.8031339, 1, 0, 0.05490196, 1,
2.327437, -1.019888, 2.925428, 1, 0, 0.04705882, 1,
2.339854, -2.182151, 2.444408, 1, 0, 0.04313726, 1,
2.35796, 0.1683163, 0.766311, 1, 0, 0.03529412, 1,
2.413711, 0.05321988, 2.180817, 1, 0, 0.03137255, 1,
2.518307, -0.4218802, 2.045512, 1, 0, 0.02352941, 1,
2.805445, 1.531614, 2.249531, 1, 0, 0.01960784, 1,
2.878826, -1.36737, 1.761484, 1, 0, 0.01176471, 1,
3.999954, -0.8717706, 1.693869, 1, 0, 0.007843138, 1
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
0.4776438, -4.56233, -6.93433, 0, -0.5, 0.5, 0.5,
0.4776438, -4.56233, -6.93433, 1, -0.5, 0.5, 0.5,
0.4776438, -4.56233, -6.93433, 1, 1.5, 0.5, 0.5,
0.4776438, -4.56233, -6.93433, 0, 1.5, 0.5, 0.5
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
-4.23873, -0.1644753, -6.93433, 0, -0.5, 0.5, 0.5,
-4.23873, -0.1644753, -6.93433, 1, -0.5, 0.5, 0.5,
-4.23873, -0.1644753, -6.93433, 1, 1.5, 0.5, 0.5,
-4.23873, -0.1644753, -6.93433, 0, 1.5, 0.5, 0.5
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
-4.23873, -4.56233, -0.03253007, 0, -0.5, 0.5, 0.5,
-4.23873, -4.56233, -0.03253007, 1, -0.5, 0.5, 0.5,
-4.23873, -4.56233, -0.03253007, 1, 1.5, 0.5, 0.5,
-4.23873, -4.56233, -0.03253007, 0, 1.5, 0.5, 0.5
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
-2, -3.547441, -5.341608,
2, -3.547441, -5.341608,
-2, -3.547441, -5.341608,
-2, -3.716589, -5.607061,
0, -3.547441, -5.341608,
0, -3.716589, -5.607061,
2, -3.547441, -5.341608,
2, -3.716589, -5.607061
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
"0",
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
-2, -4.054886, -6.137969, 0, -0.5, 0.5, 0.5,
-2, -4.054886, -6.137969, 1, -0.5, 0.5, 0.5,
-2, -4.054886, -6.137969, 1, 1.5, 0.5, 0.5,
-2, -4.054886, -6.137969, 0, 1.5, 0.5, 0.5,
0, -4.054886, -6.137969, 0, -0.5, 0.5, 0.5,
0, -4.054886, -6.137969, 1, -0.5, 0.5, 0.5,
0, -4.054886, -6.137969, 1, 1.5, 0.5, 0.5,
0, -4.054886, -6.137969, 0, 1.5, 0.5, 0.5,
2, -4.054886, -6.137969, 0, -0.5, 0.5, 0.5,
2, -4.054886, -6.137969, 1, -0.5, 0.5, 0.5,
2, -4.054886, -6.137969, 1, 1.5, 0.5, 0.5,
2, -4.054886, -6.137969, 0, 1.5, 0.5, 0.5
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
-3.150336, -3, -5.341608,
-3.150336, 3, -5.341608,
-3.150336, -3, -5.341608,
-3.331735, -3, -5.607061,
-3.150336, -2, -5.341608,
-3.331735, -2, -5.607061,
-3.150336, -1, -5.341608,
-3.331735, -1, -5.607061,
-3.150336, 0, -5.341608,
-3.331735, 0, -5.607061,
-3.150336, 1, -5.341608,
-3.331735, 1, -5.607061,
-3.150336, 2, -5.341608,
-3.331735, 2, -5.607061,
-3.150336, 3, -5.341608,
-3.331735, 3, -5.607061
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
-3.694533, -3, -6.137969, 0, -0.5, 0.5, 0.5,
-3.694533, -3, -6.137969, 1, -0.5, 0.5, 0.5,
-3.694533, -3, -6.137969, 1, 1.5, 0.5, 0.5,
-3.694533, -3, -6.137969, 0, 1.5, 0.5, 0.5,
-3.694533, -2, -6.137969, 0, -0.5, 0.5, 0.5,
-3.694533, -2, -6.137969, 1, -0.5, 0.5, 0.5,
-3.694533, -2, -6.137969, 1, 1.5, 0.5, 0.5,
-3.694533, -2, -6.137969, 0, 1.5, 0.5, 0.5,
-3.694533, -1, -6.137969, 0, -0.5, 0.5, 0.5,
-3.694533, -1, -6.137969, 1, -0.5, 0.5, 0.5,
-3.694533, -1, -6.137969, 1, 1.5, 0.5, 0.5,
-3.694533, -1, -6.137969, 0, 1.5, 0.5, 0.5,
-3.694533, 0, -6.137969, 0, -0.5, 0.5, 0.5,
-3.694533, 0, -6.137969, 1, -0.5, 0.5, 0.5,
-3.694533, 0, -6.137969, 1, 1.5, 0.5, 0.5,
-3.694533, 0, -6.137969, 0, 1.5, 0.5, 0.5,
-3.694533, 1, -6.137969, 0, -0.5, 0.5, 0.5,
-3.694533, 1, -6.137969, 1, -0.5, 0.5, 0.5,
-3.694533, 1, -6.137969, 1, 1.5, 0.5, 0.5,
-3.694533, 1, -6.137969, 0, 1.5, 0.5, 0.5,
-3.694533, 2, -6.137969, 0, -0.5, 0.5, 0.5,
-3.694533, 2, -6.137969, 1, -0.5, 0.5, 0.5,
-3.694533, 2, -6.137969, 1, 1.5, 0.5, 0.5,
-3.694533, 2, -6.137969, 0, 1.5, 0.5, 0.5,
-3.694533, 3, -6.137969, 0, -0.5, 0.5, 0.5,
-3.694533, 3, -6.137969, 1, -0.5, 0.5, 0.5,
-3.694533, 3, -6.137969, 1, 1.5, 0.5, 0.5,
-3.694533, 3, -6.137969, 0, 1.5, 0.5, 0.5
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
-3.150336, -3.547441, -4,
-3.150336, -3.547441, 4,
-3.150336, -3.547441, -4,
-3.331735, -3.716589, -4,
-3.150336, -3.547441, -2,
-3.331735, -3.716589, -2,
-3.150336, -3.547441, 0,
-3.331735, -3.716589, 0,
-3.150336, -3.547441, 2,
-3.331735, -3.716589, 2,
-3.150336, -3.547441, 4,
-3.331735, -3.716589, 4
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
-3.694533, -4.054886, -4, 0, -0.5, 0.5, 0.5,
-3.694533, -4.054886, -4, 1, -0.5, 0.5, 0.5,
-3.694533, -4.054886, -4, 1, 1.5, 0.5, 0.5,
-3.694533, -4.054886, -4, 0, 1.5, 0.5, 0.5,
-3.694533, -4.054886, -2, 0, -0.5, 0.5, 0.5,
-3.694533, -4.054886, -2, 1, -0.5, 0.5, 0.5,
-3.694533, -4.054886, -2, 1, 1.5, 0.5, 0.5,
-3.694533, -4.054886, -2, 0, 1.5, 0.5, 0.5,
-3.694533, -4.054886, 0, 0, -0.5, 0.5, 0.5,
-3.694533, -4.054886, 0, 1, -0.5, 0.5, 0.5,
-3.694533, -4.054886, 0, 1, 1.5, 0.5, 0.5,
-3.694533, -4.054886, 0, 0, 1.5, 0.5, 0.5,
-3.694533, -4.054886, 2, 0, -0.5, 0.5, 0.5,
-3.694533, -4.054886, 2, 1, -0.5, 0.5, 0.5,
-3.694533, -4.054886, 2, 1, 1.5, 0.5, 0.5,
-3.694533, -4.054886, 2, 0, 1.5, 0.5, 0.5,
-3.694533, -4.054886, 4, 0, -0.5, 0.5, 0.5,
-3.694533, -4.054886, 4, 1, -0.5, 0.5, 0.5,
-3.694533, -4.054886, 4, 1, 1.5, 0.5, 0.5,
-3.694533, -4.054886, 4, 0, 1.5, 0.5, 0.5
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
-3.150336, -3.547441, -5.341608,
-3.150336, 3.21849, -5.341608,
-3.150336, -3.547441, 5.276547,
-3.150336, 3.21849, 5.276547,
-3.150336, -3.547441, -5.341608,
-3.150336, -3.547441, 5.276547,
-3.150336, 3.21849, -5.341608,
-3.150336, 3.21849, 5.276547,
-3.150336, -3.547441, -5.341608,
4.105624, -3.547441, -5.341608,
-3.150336, -3.547441, 5.276547,
4.105624, -3.547441, 5.276547,
-3.150336, 3.21849, -5.341608,
4.105624, 3.21849, -5.341608,
-3.150336, 3.21849, 5.276547,
4.105624, 3.21849, 5.276547,
4.105624, -3.547441, -5.341608,
4.105624, 3.21849, -5.341608,
4.105624, -3.547441, 5.276547,
4.105624, 3.21849, 5.276547,
4.105624, -3.547441, -5.341608,
4.105624, -3.547441, 5.276547,
4.105624, 3.21849, -5.341608,
4.105624, 3.21849, 5.276547
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
var radius = 7.759677;
var distance = 34.52368;
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
mvMatrix.translate( -0.4776438, 0.1644753, 0.03253007 );
mvMatrix.scale( 1.156279, 1.240024, 0.7901481 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -34.52368);
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
gl.drawArrays(gl.LINES, 0, 8);
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
gl.drawElements(gl.TRIANGLES, 18, gl.UNSIGNED_SHORT, 0);
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
tribenuron-methyl<-read.table("tribenuron-methyl.xyz", skip=1)
```

```
## Error in scan(file, what, nmax, sep, dec, quote, skip, nlines, na.strings, : line 1 did not have 4 elements
```

```r
x<-tribenuron-methyl$V2
```

```
## Error in eval(expr, envir, enclos): object 'tribenuron' not found
```

```r
y<-tribenuron-methyl$V3
```

```
## Error in eval(expr, envir, enclos): object 'tribenuron' not found
```

```r
z<-tribenuron-methyl$V4
```

```
## Error in eval(expr, envir, enclos): object 'tribenuron' not found
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
-3.044667, 0.01490262, -0.8095937, 0, 0, 1, 1, 1,
-2.918212, 0.2229817, -1.10032, 1, 0, 0, 1, 1,
-2.901174, 1.384544, 1.688736, 1, 0, 0, 1, 1,
-2.656253, 0.5996039, -2.44919, 1, 0, 0, 1, 1,
-2.645061, -1.042636, -2.993644, 1, 0, 0, 1, 1,
-2.592557, -2.299182, -1.075252, 1, 0, 0, 1, 1,
-2.536992, -0.6325467, -0.3611631, 0, 0, 0, 1, 1,
-2.375359, 1.228788, -1.719529, 0, 0, 0, 1, 1,
-2.329409, -0.1156876, -1.184554, 0, 0, 0, 1, 1,
-2.324769, -0.08634082, -1.620104, 0, 0, 0, 1, 1,
-2.284287, -1.252298, -2.077895, 0, 0, 0, 1, 1,
-2.274157, -0.1583394, -1.471697, 0, 0, 0, 1, 1,
-2.273652, 1.193592, -0.9530274, 0, 0, 0, 1, 1,
-2.272936, 0.8002305, -2.41362, 1, 1, 1, 1, 1,
-2.260882, 1.468849, -1.683048, 1, 1, 1, 1, 1,
-2.250501, -0.4633908, -1.439896, 1, 1, 1, 1, 1,
-2.174019, -0.1052845, -1.145095, 1, 1, 1, 1, 1,
-2.136231, -0.9504352, -1.786507, 1, 1, 1, 1, 1,
-2.132969, -1.301567, -2.204888, 1, 1, 1, 1, 1,
-2.110855, -0.5066674, -1.982651, 1, 1, 1, 1, 1,
-2.092373, -0.5986716, -3.820869, 1, 1, 1, 1, 1,
-2.083396, 0.7982976, -0.8327422, 1, 1, 1, 1, 1,
-2.054862, 0.9829656, -2.241286, 1, 1, 1, 1, 1,
-2.013011, -0.747945, -0.3565268, 1, 1, 1, 1, 1,
-1.994298, -1.273458, -3.177986, 1, 1, 1, 1, 1,
-1.982648, 0.3742756, -1.604319, 1, 1, 1, 1, 1,
-1.98041, 0.5805194, -1.199693, 1, 1, 1, 1, 1,
-1.969914, -0.5323952, -1.099042, 1, 1, 1, 1, 1,
-1.966951, -0.944326, -1.383008, 0, 0, 1, 1, 1,
-1.960661, -2.12763, -2.640737, 1, 0, 0, 1, 1,
-1.934895, 0.660947, -1.088145, 1, 0, 0, 1, 1,
-1.91228, -0.4695503, -0.8927298, 1, 0, 0, 1, 1,
-1.908227, -0.6341197, -2.282629, 1, 0, 0, 1, 1,
-1.903892, 1.254196, -1.016628, 1, 0, 0, 1, 1,
-1.874953, 0.7505817, -0.08974007, 0, 0, 0, 1, 1,
-1.867349, -1.595317, -2.934011, 0, 0, 0, 1, 1,
-1.843783, -1.476197, -2.702128, 0, 0, 0, 1, 1,
-1.831878, -1.501547, -3.536793, 0, 0, 0, 1, 1,
-1.813966, 0.1352315, -1.919403, 0, 0, 0, 1, 1,
-1.727158, -0.4177038, -0.4992835, 0, 0, 0, 1, 1,
-1.717052, -2.974478, -3.725132, 0, 0, 0, 1, 1,
-1.704569, -2.274533, -2.549298, 1, 1, 1, 1, 1,
-1.697753, 0.07090924, -2.602837, 1, 1, 1, 1, 1,
-1.6925, 1.497558, -1.773591, 1, 1, 1, 1, 1,
-1.682036, -2.031916, -1.681999, 1, 1, 1, 1, 1,
-1.667877, -0.1063622, -3.655422, 1, 1, 1, 1, 1,
-1.653282, -1.582039, -2.722496, 1, 1, 1, 1, 1,
-1.637951, -0.2167139, -1.945546, 1, 1, 1, 1, 1,
-1.633822, -0.5582177, -0.8979427, 1, 1, 1, 1, 1,
-1.631344, 1.002089, -0.8864492, 1, 1, 1, 1, 1,
-1.628206, -0.2216574, -1.151066, 1, 1, 1, 1, 1,
-1.621445, 0.1912324, -0.7577225, 1, 1, 1, 1, 1,
-1.619373, -0.1635394, -1.994425, 1, 1, 1, 1, 1,
-1.614676, 1.693171, -0.9152912, 1, 1, 1, 1, 1,
-1.578771, -0.644981, -0.6657126, 1, 1, 1, 1, 1,
-1.578277, -0.6042091, -1.810536, 1, 1, 1, 1, 1,
-1.578045, -0.1951208, -1.326924, 0, 0, 1, 1, 1,
-1.573673, -0.7360219, -3.048584, 1, 0, 0, 1, 1,
-1.534677, 0.4351532, -1.191627, 1, 0, 0, 1, 1,
-1.525854, 1.254611, -1.928897, 1, 0, 0, 1, 1,
-1.522465, -0.629464, -2.779358, 1, 0, 0, 1, 1,
-1.513165, 0.7745839, -1.638022, 1, 0, 0, 1, 1,
-1.510075, -0.9322667, -0.03542148, 0, 0, 0, 1, 1,
-1.50393, 0.1270861, -1.088002, 0, 0, 0, 1, 1,
-1.503428, 0.5644037, -0.4213108, 0, 0, 0, 1, 1,
-1.491937, -0.08232027, -3.902569, 0, 0, 0, 1, 1,
-1.444364, 0.1378551, -2.355042, 0, 0, 0, 1, 1,
-1.431757, 0.1411634, -3.29696, 0, 0, 0, 1, 1,
-1.429554, 0.5134027, -1.224102, 0, 0, 0, 1, 1,
-1.428178, 2.015444, -0.7645253, 1, 1, 1, 1, 1,
-1.42708, 0.3604133, -1.747996, 1, 1, 1, 1, 1,
-1.423713, -1.99717, -3.10525, 1, 1, 1, 1, 1,
-1.415118, 1.926953, -0.2593523, 1, 1, 1, 1, 1,
-1.407591, -1.244191, -3.21224, 1, 1, 1, 1, 1,
-1.398685, 0.1782588, -1.875105, 1, 1, 1, 1, 1,
-1.393035, -1.509989, -2.17574, 1, 1, 1, 1, 1,
-1.381389, 1.907387, -0.7993026, 1, 1, 1, 1, 1,
-1.380007, -0.6557927, -2.456538, 1, 1, 1, 1, 1,
-1.374789, 0.2731507, -0.8937817, 1, 1, 1, 1, 1,
-1.362748, -0.6846635, -1.500407, 1, 1, 1, 1, 1,
-1.357116, 0.3955172, -3.024937, 1, 1, 1, 1, 1,
-1.34758, -1.745414, -4.343172, 1, 1, 1, 1, 1,
-1.345603, -1.217267, -0.1722929, 1, 1, 1, 1, 1,
-1.344186, 1.678466, -0.842343, 1, 1, 1, 1, 1,
-1.341562, 0.7357164, -1.324895, 0, 0, 1, 1, 1,
-1.340794, 0.7558323, -1.581301, 1, 0, 0, 1, 1,
-1.335931, -0.7856563, -3.143878, 1, 0, 0, 1, 1,
-1.335828, 0.02725193, -3.491508, 1, 0, 0, 1, 1,
-1.328096, 1.400109, 0.1682257, 1, 0, 0, 1, 1,
-1.320119, 0.6324823, -2.073486, 1, 0, 0, 1, 1,
-1.318619, 0.2441846, -2.47468, 0, 0, 0, 1, 1,
-1.308127, 0.4789435, -0.7347123, 0, 0, 0, 1, 1,
-1.303814, -1.221278, -1.688897, 0, 0, 0, 1, 1,
-1.302905, 0.8828145, -1.949531, 0, 0, 0, 1, 1,
-1.302247, -0.3964834, -3.197603, 0, 0, 0, 1, 1,
-1.2935, 0.9131674, -2.047902, 0, 0, 0, 1, 1,
-1.290195, -1.299807, -5.075002, 0, 0, 0, 1, 1,
-1.289852, 1.663905, -0.9541004, 1, 1, 1, 1, 1,
-1.287314, 1.821319, 0.9864818, 1, 1, 1, 1, 1,
-1.284451, -0.2117913, -1.622516, 1, 1, 1, 1, 1,
-1.28221, -0.5635979, -1.089904, 1, 1, 1, 1, 1,
-1.274077, 0.8973318, -0.7700472, 1, 1, 1, 1, 1,
-1.2623, 1.295877, -1.708019, 1, 1, 1, 1, 1,
-1.260433, 2.026247, -1.356326, 1, 1, 1, 1, 1,
-1.259784, 0.5126891, -1.099652, 1, 1, 1, 1, 1,
-1.256936, 1.839831, -0.604804, 1, 1, 1, 1, 1,
-1.253849, -1.218169, -3.310519, 1, 1, 1, 1, 1,
-1.253534, -1.15292, -1.040948, 1, 1, 1, 1, 1,
-1.252841, -0.2522579, -1.733973, 1, 1, 1, 1, 1,
-1.250331, 0.7724797, -2.059239, 1, 1, 1, 1, 1,
-1.249803, -0.2005937, -0.4591509, 1, 1, 1, 1, 1,
-1.24876, 1.539894, -0.6020616, 1, 1, 1, 1, 1,
-1.247548, -0.005153375, -1.233976, 0, 0, 1, 1, 1,
-1.242145, -1.050945, -1.99282, 1, 0, 0, 1, 1,
-1.237883, 0.3554435, -0.5130464, 1, 0, 0, 1, 1,
-1.218264, 0.8729113, 0.2468518, 1, 0, 0, 1, 1,
-1.215907, 0.2958067, -2.528122, 1, 0, 0, 1, 1,
-1.207721, 1.202837, -2.584744, 1, 0, 0, 1, 1,
-1.207194, -0.1611354, -0.3047122, 0, 0, 0, 1, 1,
-1.194216, -2.078084, -3.167721, 0, 0, 0, 1, 1,
-1.193998, 0.8173055, -1.967528, 0, 0, 0, 1, 1,
-1.190173, 1.001616, -3.182674, 0, 0, 0, 1, 1,
-1.17985, -1.295487, -2.729704, 0, 0, 0, 1, 1,
-1.178787, 1.593918, -0.5788588, 0, 0, 0, 1, 1,
-1.178045, 0.411121, -1.93302, 0, 0, 0, 1, 1,
-1.170156, -0.0353075, -2.224819, 1, 1, 1, 1, 1,
-1.167236, 0.5542489, -1.035012, 1, 1, 1, 1, 1,
-1.157096, -0.1888117, -2.393947, 1, 1, 1, 1, 1,
-1.152756, 0.4393319, 0.5496972, 1, 1, 1, 1, 1,
-1.151705, 0.5427125, -0.6931921, 1, 1, 1, 1, 1,
-1.149955, -0.2053773, -1.538621, 1, 1, 1, 1, 1,
-1.147604, 0.5413107, -1.460003, 1, 1, 1, 1, 1,
-1.145992, 1.334043, -1.326451, 1, 1, 1, 1, 1,
-1.141535, 0.458582, -2.182037, 1, 1, 1, 1, 1,
-1.136025, 1.240463, -0.5376864, 1, 1, 1, 1, 1,
-1.119043, -0.09614977, -2.635197, 1, 1, 1, 1, 1,
-1.116861, 0.001365376, -2.655699, 1, 1, 1, 1, 1,
-1.108104, 0.04100164, -1.836726, 1, 1, 1, 1, 1,
-1.103942, 1.806921, -1.072845, 1, 1, 1, 1, 1,
-1.102808, -1.214887, -2.867635, 1, 1, 1, 1, 1,
-1.098243, 0.2673815, -1.855307, 0, 0, 1, 1, 1,
-1.063837, 1.643828, -1.185273, 1, 0, 0, 1, 1,
-1.045828, -0.5929118, -2.14032, 1, 0, 0, 1, 1,
-1.04213, 0.8918336, -2.720158, 1, 0, 0, 1, 1,
-1.037707, -0.4323201, -2.526556, 1, 0, 0, 1, 1,
-1.034348, 1.530239, -0.3336211, 1, 0, 0, 1, 1,
-1.032198, -0.3613882, -3.330564, 0, 0, 0, 1, 1,
-1.02665, -3.448908, -2.998864, 0, 0, 0, 1, 1,
-1.017562, 2.289062, 0.8146981, 0, 0, 0, 1, 1,
-1.017466, -0.5094191, -0.771701, 0, 0, 0, 1, 1,
-1.014661, -0.6042232, -1.926742, 0, 0, 0, 1, 1,
-1.011995, 1.569318, -0.6334157, 0, 0, 0, 1, 1,
-1.010928, 1.033664, 1.090298, 0, 0, 0, 1, 1,
-1.010173, 0.9654453, -1.743267, 1, 1, 1, 1, 1,
-1.009927, -2.054693, -3.825259, 1, 1, 1, 1, 1,
-1.006451, -0.3901228, -2.19454, 1, 1, 1, 1, 1,
-1.005236, 1.611113, 0.2836621, 1, 1, 1, 1, 1,
-1.002882, -0.9798397, -2.645894, 1, 1, 1, 1, 1,
-0.9983608, 0.2123018, -0.5748802, 1, 1, 1, 1, 1,
-0.9950599, 0.1905871, 0.004819417, 1, 1, 1, 1, 1,
-0.9849174, 1.693984, 0.3973348, 1, 1, 1, 1, 1,
-0.9811684, 2.245232, -0.6576651, 1, 1, 1, 1, 1,
-0.9787529, 0.7966387, -1.165746, 1, 1, 1, 1, 1,
-0.9787019, -0.3378102, -2.03056, 1, 1, 1, 1, 1,
-0.9693374, 0.7439767, -1.624637, 1, 1, 1, 1, 1,
-0.9677818, -0.5364771, -3.215163, 1, 1, 1, 1, 1,
-0.9653717, -0.5213292, -2.205247, 1, 1, 1, 1, 1,
-0.9563115, 0.1819205, -1.60815, 1, 1, 1, 1, 1,
-0.9539995, -0.710889, -3.138712, 0, 0, 1, 1, 1,
-0.9520553, -0.06192515, -3.030717, 1, 0, 0, 1, 1,
-0.9356499, 0.1223898, -0.7454632, 1, 0, 0, 1, 1,
-0.9291751, 0.225084, -3.064211, 1, 0, 0, 1, 1,
-0.9290847, 1.035667, 0.5520133, 1, 0, 0, 1, 1,
-0.9278038, 0.8739801, -0.06416401, 1, 0, 0, 1, 1,
-0.9264717, 0.06269962, -1.775639, 0, 0, 0, 1, 1,
-0.9194602, 0.6328643, 0.4383071, 0, 0, 0, 1, 1,
-0.9153594, -0.7545601, -1.103737, 0, 0, 0, 1, 1,
-0.9111252, 0.8114494, -1.011108, 0, 0, 0, 1, 1,
-0.9076058, -0.4190003, -1.809955, 0, 0, 0, 1, 1,
-0.9023739, -1.817244, -1.366445, 0, 0, 0, 1, 1,
-0.898636, -0.001437614, -0.7664723, 0, 0, 0, 1, 1,
-0.8977813, 0.7001038, -1.167207, 1, 1, 1, 1, 1,
-0.8971566, 0.05952965, -2.386462, 1, 1, 1, 1, 1,
-0.894927, 0.8829861, -0.483726, 1, 1, 1, 1, 1,
-0.8920863, -0.6331518, -2.610557, 1, 1, 1, 1, 1,
-0.8899943, 0.694869, -1.182432, 1, 1, 1, 1, 1,
-0.8856415, 1.054186, -1.871622, 1, 1, 1, 1, 1,
-0.8850458, 1.422433, 1.1233, 1, 1, 1, 1, 1,
-0.8822387, 0.5503199, -1.412547, 1, 1, 1, 1, 1,
-0.8813809, -0.3773096, -2.878581, 1, 1, 1, 1, 1,
-0.8781369, -0.5845122, -1.735796, 1, 1, 1, 1, 1,
-0.8722255, 0.7861457, -1.704624, 1, 1, 1, 1, 1,
-0.8674622, -0.1668698, -3.086648, 1, 1, 1, 1, 1,
-0.8672652, 1.013101, -1.567279, 1, 1, 1, 1, 1,
-0.8634792, -0.7347367, -1.275699, 1, 1, 1, 1, 1,
-0.8622379, 0.6174234, -2.882886, 1, 1, 1, 1, 1,
-0.8601912, -1.040279, -1.6817, 0, 0, 1, 1, 1,
-0.8546294, -1.143138, -2.299663, 1, 0, 0, 1, 1,
-0.8459426, 0.3725717, -1.971941, 1, 0, 0, 1, 1,
-0.8456708, 0.75426, -0.763752, 1, 0, 0, 1, 1,
-0.8409653, 1.855417, 0.1678603, 1, 0, 0, 1, 1,
-0.8397268, 0.2430455, -0.4620715, 1, 0, 0, 1, 1,
-0.8376396, 0.8130443, -0.1865911, 0, 0, 0, 1, 1,
-0.8349611, 1.015214, -2.019371, 0, 0, 0, 1, 1,
-0.8336653, -1.894362, -3.839002, 0, 0, 0, 1, 1,
-0.8281021, -0.3148046, -1.013795, 0, 0, 0, 1, 1,
-0.8278062, 1.942311, -2.851131, 0, 0, 0, 1, 1,
-0.8277227, 0.8917303, -0.6934465, 0, 0, 0, 1, 1,
-0.8265887, -0.8438318, 1.004122, 0, 0, 0, 1, 1,
-0.8220742, -0.3579623, -1.934645, 1, 1, 1, 1, 1,
-0.8185388, 0.1946916, -2.873508, 1, 1, 1, 1, 1,
-0.8182699, -0.7015024, -3.096975, 1, 1, 1, 1, 1,
-0.8147298, 0.5718713, -2.0553, 1, 1, 1, 1, 1,
-0.8138064, 0.6808801, -0.05003353, 1, 1, 1, 1, 1,
-0.8132467, -0.5444903, -2.957338, 1, 1, 1, 1, 1,
-0.808603, 0.764962, -0.9999779, 1, 1, 1, 1, 1,
-0.8040172, 0.4260831, -0.5594124, 1, 1, 1, 1, 1,
-0.8019276, -0.3986639, -3.361486, 1, 1, 1, 1, 1,
-0.8008161, -0.02574265, -1.270322, 1, 1, 1, 1, 1,
-0.7934855, 0.2391822, -0.9092013, 1, 1, 1, 1, 1,
-0.7900252, -1.378702, -2.66257, 1, 1, 1, 1, 1,
-0.7899434, -0.5441277, -1.831014, 1, 1, 1, 1, 1,
-0.7830542, 1.218146, 0.7686116, 1, 1, 1, 1, 1,
-0.7738857, -0.1519937, -2.551665, 1, 1, 1, 1, 1,
-0.7723239, -0.4439988, -0.7885479, 0, 0, 1, 1, 1,
-0.769457, -0.3593048, -3.406707, 1, 0, 0, 1, 1,
-0.767246, 0.8676301, -1.08476, 1, 0, 0, 1, 1,
-0.7662694, 1.410885, -1.154665, 1, 0, 0, 1, 1,
-0.7647014, 1.732221, 0.1160924, 1, 0, 0, 1, 1,
-0.7565534, 0.2156613, -1.142304, 1, 0, 0, 1, 1,
-0.7542396, -0.4460885, -1.418451, 0, 0, 0, 1, 1,
-0.752678, 1.214637, -0.8852886, 0, 0, 0, 1, 1,
-0.7521384, 0.7036693, -1.413332, 0, 0, 0, 1, 1,
-0.750702, 1.292257, 0.2153779, 0, 0, 0, 1, 1,
-0.7381641, 0.8470523, -0.01995866, 0, 0, 0, 1, 1,
-0.7356242, 1.256008, -1.280697, 0, 0, 0, 1, 1,
-0.7314007, 1.611884, -2.736086, 0, 0, 0, 1, 1,
-0.7297328, -1.062921, -2.316262, 1, 1, 1, 1, 1,
-0.7296851, -0.6865711, -1.639831, 1, 1, 1, 1, 1,
-0.716869, 2.465226, 0.01590437, 1, 1, 1, 1, 1,
-0.7086643, 1.02219, -1.34422, 1, 1, 1, 1, 1,
-0.7084376, -0.9766096, -0.2795607, 1, 1, 1, 1, 1,
-0.706875, -0.3904086, -1.220409, 1, 1, 1, 1, 1,
-0.7012643, -0.187809, -2.659637, 1, 1, 1, 1, 1,
-0.6999029, 1.208816, -2.782007, 1, 1, 1, 1, 1,
-0.6994758, 1.89736, -1.168413, 1, 1, 1, 1, 1,
-0.6908491, 1.042023, -1.133255, 1, 1, 1, 1, 1,
-0.6866904, 1.90497, -0.7316203, 1, 1, 1, 1, 1,
-0.6843735, -0.1014801, -2.688824, 1, 1, 1, 1, 1,
-0.6817466, -0.148489, -2.483331, 1, 1, 1, 1, 1,
-0.6656751, -0.05948442, -1.551151, 1, 1, 1, 1, 1,
-0.6627294, 0.7322402, 0.03982392, 1, 1, 1, 1, 1,
-0.6586479, -0.4796419, -1.305495, 0, 0, 1, 1, 1,
-0.6524609, -1.795328, -3.452878, 1, 0, 0, 1, 1,
-0.6469747, 1.113684, -1.004654, 1, 0, 0, 1, 1,
-0.6446276, -1.979585, -2.670086, 1, 0, 0, 1, 1,
-0.6441185, 1.176947, 1.146718, 1, 0, 0, 1, 1,
-0.6415487, -0.7168657, -2.178438, 1, 0, 0, 1, 1,
-0.638676, 0.09994522, -2.773692, 0, 0, 0, 1, 1,
-0.6343576, -0.231386, -5.097919, 0, 0, 0, 1, 1,
-0.6229872, -0.8854322, -0.4921469, 0, 0, 0, 1, 1,
-0.6219835, -1.144102, -4.094451, 0, 0, 0, 1, 1,
-0.6169486, 0.2069864, -0.8200126, 0, 0, 0, 1, 1,
-0.6089559, -1.911428, -3.493109, 0, 0, 0, 1, 1,
-0.6076204, -1.07885, -3.221573, 0, 0, 0, 1, 1,
-0.6069715, 0.5348001, -0.9627911, 1, 1, 1, 1, 1,
-0.6044109, 0.8585994, -0.09355072, 1, 1, 1, 1, 1,
-0.5925779, 0.4094885, -2.346925, 1, 1, 1, 1, 1,
-0.5917783, -0.1866019, -2.189137, 1, 1, 1, 1, 1,
-0.5915527, -0.4424361, -2.0582, 1, 1, 1, 1, 1,
-0.5911304, 0.8589187, -1.878928, 1, 1, 1, 1, 1,
-0.5886356, 0.7112201, 0.5687205, 1, 1, 1, 1, 1,
-0.5695075, -0.6737615, -3.753942, 1, 1, 1, 1, 1,
-0.5688363, -0.2371147, -2.588308, 1, 1, 1, 1, 1,
-0.5597496, 1.021237, 0.3315503, 1, 1, 1, 1, 1,
-0.5589436, 0.007044061, -2.182975, 1, 1, 1, 1, 1,
-0.5579804, -0.3965477, -0.8671384, 1, 1, 1, 1, 1,
-0.5578552, 0.5554725, -0.3938923, 1, 1, 1, 1, 1,
-0.5476426, 1.058625, 0.4872296, 1, 1, 1, 1, 1,
-0.5431914, -0.3715636, -0.2131243, 1, 1, 1, 1, 1,
-0.5363495, -1.461834, -1.24433, 0, 0, 1, 1, 1,
-0.5341946, 1.142901, 2.306551, 1, 0, 0, 1, 1,
-0.5311982, 0.4665236, -0.1167366, 1, 0, 0, 1, 1,
-0.5311046, -2.383929, -4.137423, 1, 0, 0, 1, 1,
-0.5284745, 0.2806191, 1.252382, 1, 0, 0, 1, 1,
-0.5281261, 0.0899481, -1.966854, 1, 0, 0, 1, 1,
-0.5257975, -0.2432239, -3.774691, 0, 0, 0, 1, 1,
-0.5222883, 0.3552966, -0.5101052, 0, 0, 0, 1, 1,
-0.5216264, 0.1569177, -1.049217, 0, 0, 0, 1, 1,
-0.5198842, -2.57853, -2.587104, 0, 0, 0, 1, 1,
-0.5177795, 0.7537645, -2.281462, 0, 0, 0, 1, 1,
-0.5167302, 0.01671866, -0.6179464, 0, 0, 0, 1, 1,
-0.5153567, -1.515759, -2.695409, 0, 0, 0, 1, 1,
-0.5139649, -0.7423896, -3.327023, 1, 1, 1, 1, 1,
-0.5132195, -0.868736, -3.810229, 1, 1, 1, 1, 1,
-0.5119818, -1.03535, -3.065303, 1, 1, 1, 1, 1,
-0.5106622, -0.7143691, -2.207778, 1, 1, 1, 1, 1,
-0.5098548, 0.2884473, -1.639386, 1, 1, 1, 1, 1,
-0.5058373, 0.6209439, -0.598966, 1, 1, 1, 1, 1,
-0.5026289, -0.08253417, -2.095523, 1, 1, 1, 1, 1,
-0.4979943, 0.5036041, 0.733282, 1, 1, 1, 1, 1,
-0.4945157, 0.1482441, -2.751194, 1, 1, 1, 1, 1,
-0.48862, 1.776149, 0.2121267, 1, 1, 1, 1, 1,
-0.4871645, 0.2955348, -1.558943, 1, 1, 1, 1, 1,
-0.4806174, -0.2774464, -2.863225, 1, 1, 1, 1, 1,
-0.4777532, -1.790395, -3.209487, 1, 1, 1, 1, 1,
-0.4713171, -1.609873, -4.532052, 1, 1, 1, 1, 1,
-0.4707236, -1.881102, -5.151946, 1, 1, 1, 1, 1,
-0.4683217, 1.292666, -0.5714279, 0, 0, 1, 1, 1,
-0.4677466, 0.08215119, -0.5745301, 1, 0, 0, 1, 1,
-0.4673891, -0.9551944, -2.139564, 1, 0, 0, 1, 1,
-0.4621965, -0.6585068, -4.28006, 1, 0, 0, 1, 1,
-0.4577833, -1.146351, -3.394097, 1, 0, 0, 1, 1,
-0.4552349, -0.5672321, -1.745437, 1, 0, 0, 1, 1,
-0.4539725, -0.9301729, -0.5039216, 0, 0, 0, 1, 1,
-0.4538233, 0.195818, -1.510906, 0, 0, 0, 1, 1,
-0.4526195, -1.960235, -3.185761, 0, 0, 0, 1, 1,
-0.4495004, 0.7532215, 0.7853839, 0, 0, 0, 1, 1,
-0.4467753, -0.1257654, -2.127619, 0, 0, 0, 1, 1,
-0.4448985, 0.6641586, -2.826377, 0, 0, 0, 1, 1,
-0.4447283, -0.7010632, -1.488962, 0, 0, 0, 1, 1,
-0.4435581, 0.8324315, 0.9782172, 1, 1, 1, 1, 1,
-0.4422197, 2.525768, -0.9542288, 1, 1, 1, 1, 1,
-0.4409526, 1.411097, -0.5270321, 1, 1, 1, 1, 1,
-0.4387678, -0.4473898, -2.687351, 1, 1, 1, 1, 1,
-0.4357734, 1.041502, -1.64459, 1, 1, 1, 1, 1,
-0.4288708, -0.6325066, -2.014329, 1, 1, 1, 1, 1,
-0.4286573, 0.4412018, -1.110381, 1, 1, 1, 1, 1,
-0.4281417, 1.669651, -0.6955774, 1, 1, 1, 1, 1,
-0.4272672, -1.367016, -2.034676, 1, 1, 1, 1, 1,
-0.4254983, 1.800181, 0.1213102, 1, 1, 1, 1, 1,
-0.4110837, -0.9425296, -3.193299, 1, 1, 1, 1, 1,
-0.4099585, -0.5930675, -2.310821, 1, 1, 1, 1, 1,
-0.4087932, -1.371487, -3.43155, 1, 1, 1, 1, 1,
-0.4087049, 0.9760585, -1.860971, 1, 1, 1, 1, 1,
-0.4084649, -0.5698794, -2.965214, 1, 1, 1, 1, 1,
-0.4048376, 0.2101121, 0.7341716, 0, 0, 1, 1, 1,
-0.4009421, -1.63173, -1.978611, 1, 0, 0, 1, 1,
-0.398508, 1.060559, -0.747588, 1, 0, 0, 1, 1,
-0.3940228, -1.78059, -3.538142, 1, 0, 0, 1, 1,
-0.3855842, -0.1936455, -1.164684, 1, 0, 0, 1, 1,
-0.3819891, 0.3044047, -0.522406, 1, 0, 0, 1, 1,
-0.3799218, -0.857613, -2.906873, 0, 0, 0, 1, 1,
-0.3760802, 0.5066784, 0.1626161, 0, 0, 0, 1, 1,
-0.3696675, -0.3946375, -3.33733, 0, 0, 0, 1, 1,
-0.3693877, 1.120474, -0.7758039, 0, 0, 0, 1, 1,
-0.3673529, 1.296643, -1.374197, 0, 0, 0, 1, 1,
-0.3659907, -0.0490292, -2.619314, 0, 0, 0, 1, 1,
-0.3639079, -1.950653, -3.166387, 0, 0, 0, 1, 1,
-0.3638296, 0.08328328, -0.9084354, 1, 1, 1, 1, 1,
-0.3602558, 0.0332237, -0.9361017, 1, 1, 1, 1, 1,
-0.3570054, 1.267722, -0.8551099, 1, 1, 1, 1, 1,
-0.3568429, -0.7848127, -4.62605, 1, 1, 1, 1, 1,
-0.3540692, 1.301746, -0.9907039, 1, 1, 1, 1, 1,
-0.3501304, 0.2363465, -0.5528573, 1, 1, 1, 1, 1,
-0.3471146, -0.366918, -1.034106, 1, 1, 1, 1, 1,
-0.3461238, -0.1823667, -1.938848, 1, 1, 1, 1, 1,
-0.3449102, 0.930143, 0.1871525, 1, 1, 1, 1, 1,
-0.3441547, 0.8011531, -0.1997455, 1, 1, 1, 1, 1,
-0.3423057, -1.314565, -3.418739, 1, 1, 1, 1, 1,
-0.3349898, -0.195245, -2.710312, 1, 1, 1, 1, 1,
-0.332683, -1.774564, -3.97537, 1, 1, 1, 1, 1,
-0.3288416, -0.4851113, -1.510375, 1, 1, 1, 1, 1,
-0.3275182, -0.4147031, -3.565695, 1, 1, 1, 1, 1,
-0.3260225, -1.304148, -2.932002, 0, 0, 1, 1, 1,
-0.3237705, -0.5618694, -1.480827, 1, 0, 0, 1, 1,
-0.3203357, -0.6480811, -3.236055, 1, 0, 0, 1, 1,
-0.3144016, -1.724255, -3.079837, 1, 0, 0, 1, 1,
-0.3120702, 0.58586, -0.7660617, 1, 0, 0, 1, 1,
-0.3107061, -1.141362, -1.447002, 1, 0, 0, 1, 1,
-0.3093101, 0.8431964, 0.4787051, 0, 0, 0, 1, 1,
-0.3066203, 0.2385893, 0.09789585, 0, 0, 0, 1, 1,
-0.3060575, -0.376859, -2.304199, 0, 0, 0, 1, 1,
-0.3050074, 0.7088523, -0.3980502, 0, 0, 0, 1, 1,
-0.2979268, 1.095816, -0.2227513, 0, 0, 0, 1, 1,
-0.2967401, 0.137486, -3.182033, 0, 0, 0, 1, 1,
-0.2965943, 0.5453376, -1.010021, 0, 0, 0, 1, 1,
-0.2964468, -0.477853, -2.562757, 1, 1, 1, 1, 1,
-0.2892549, 0.03441226, -2.833978, 1, 1, 1, 1, 1,
-0.2880177, -1.225342, -4.35526, 1, 1, 1, 1, 1,
-0.287085, 1.350437, 0.5198012, 1, 1, 1, 1, 1,
-0.285853, 3.093276, -1.0437, 1, 1, 1, 1, 1,
-0.2835438, -0.8237882, -2.012505, 1, 1, 1, 1, 1,
-0.281572, 1.12685, 0.8426574, 1, 1, 1, 1, 1,
-0.2811659, -0.2374889, -3.596798, 1, 1, 1, 1, 1,
-0.2782767, -0.2850621, -2.319057, 1, 1, 1, 1, 1,
-0.2776526, 0.2111503, -1.699888, 1, 1, 1, 1, 1,
-0.2775293, 0.1920961, -1.388447, 1, 1, 1, 1, 1,
-0.2764, 0.2771905, -0.9799777, 1, 1, 1, 1, 1,
-0.2720808, 1.281762, -0.8002375, 1, 1, 1, 1, 1,
-0.2677505, 0.4354939, 1.130424, 1, 1, 1, 1, 1,
-0.2657876, -0.3829708, -0.9172943, 1, 1, 1, 1, 1,
-0.2636529, 0.1522098, -0.2241519, 0, 0, 1, 1, 1,
-0.2593837, 1.099267, -1.07929, 1, 0, 0, 1, 1,
-0.2568657, -1.14769, -2.541611, 1, 0, 0, 1, 1,
-0.2568081, 0.967752, -1.516306, 1, 0, 0, 1, 1,
-0.2536105, 1.012388, -1.651276, 1, 0, 0, 1, 1,
-0.2494251, -1.370571, -2.122185, 1, 0, 0, 1, 1,
-0.2488661, 0.3087126, -1.799562, 0, 0, 0, 1, 1,
-0.2475615, -0.1864895, -3.019426, 0, 0, 0, 1, 1,
-0.2455709, -1.18149, -2.67733, 0, 0, 0, 1, 1,
-0.2432965, 0.5176649, -0.2189383, 0, 0, 0, 1, 1,
-0.2396048, -0.5014373, -1.859899, 0, 0, 0, 1, 1,
-0.2313257, -0.4188923, -2.73112, 0, 0, 0, 1, 1,
-0.22821, -0.1799098, -1.024416, 0, 0, 0, 1, 1,
-0.2242969, -1.384793, -4.288847, 1, 1, 1, 1, 1,
-0.2168311, -0.0774955, -2.548616, 1, 1, 1, 1, 1,
-0.2158718, -1.239369, -1.615021, 1, 1, 1, 1, 1,
-0.2152825, -0.2247182, -4.336446, 1, 1, 1, 1, 1,
-0.2111456, 1.690221, 0.006821878, 1, 1, 1, 1, 1,
-0.2110075, -1.029433, -3.789696, 1, 1, 1, 1, 1,
-0.2106149, 0.7875325, -0.2113454, 1, 1, 1, 1, 1,
-0.2093307, -0.8740617, -3.933165, 1, 1, 1, 1, 1,
-0.208282, 0.9694822, 0.5609314, 1, 1, 1, 1, 1,
-0.204997, 0.544362, 0.6832108, 1, 1, 1, 1, 1,
-0.203426, -0.6974025, -5.186974, 1, 1, 1, 1, 1,
-0.2008927, -0.07855651, -1.84257, 1, 1, 1, 1, 1,
-0.198231, 0.2569374, -0.855766, 1, 1, 1, 1, 1,
-0.1949802, 1.182272, -0.7893741, 1, 1, 1, 1, 1,
-0.1926085, 1.669472, -2.321408, 1, 1, 1, 1, 1,
-0.1902029, 0.9387951, -0.4494678, 0, 0, 1, 1, 1,
-0.1839511, -0.5428333, -3.541766, 1, 0, 0, 1, 1,
-0.182798, -1.198764, -2.333234, 1, 0, 0, 1, 1,
-0.1827075, 2.277408, 0.6991905, 1, 0, 0, 1, 1,
-0.1826432, 0.7337006, 0.2251625, 1, 0, 0, 1, 1,
-0.1820858, 1.572149, -0.8252743, 1, 0, 0, 1, 1,
-0.1820112, 0.630933, -0.060088, 0, 0, 0, 1, 1,
-0.1814376, -1.031566, -2.999031, 0, 0, 0, 1, 1,
-0.1806511, 0.7487137, 1.088997, 0, 0, 0, 1, 1,
-0.1760254, -0.2060438, -2.946934, 0, 0, 0, 1, 1,
-0.1748504, -1.515772, -3.497672, 0, 0, 0, 1, 1,
-0.1729906, -1.097259, -1.511394, 0, 0, 0, 1, 1,
-0.1723181, 0.897507, -0.02847577, 0, 0, 0, 1, 1,
-0.169143, 0.9993009, -0.9151542, 1, 1, 1, 1, 1,
-0.1682586, -0.2823861, -2.573615, 1, 1, 1, 1, 1,
-0.1663953, -0.2633286, -4.367139, 1, 1, 1, 1, 1,
-0.1662065, -0.3068307, -2.678824, 1, 1, 1, 1, 1,
-0.1616716, 1.193212, 0.2166903, 1, 1, 1, 1, 1,
-0.1602511, 1.23916, -1.265549, 1, 1, 1, 1, 1,
-0.1589942, -0.8923262, -1.936126, 1, 1, 1, 1, 1,
-0.1560759, 1.816857, -0.01030314, 1, 1, 1, 1, 1,
-0.1549472, 0.5760154, -1.718993, 1, 1, 1, 1, 1,
-0.1526446, -0.3624165, -2.57887, 1, 1, 1, 1, 1,
-0.1412069, 0.9623803, -0.8065062, 1, 1, 1, 1, 1,
-0.1320846, 0.7053444, 0.5883009, 1, 1, 1, 1, 1,
-0.1319616, 0.06518643, -0.4896399, 1, 1, 1, 1, 1,
-0.1289986, -0.865486, -3.131431, 1, 1, 1, 1, 1,
-0.1240717, 2.449159, 0.6803349, 1, 1, 1, 1, 1,
-0.1212114, 0.8936097, -0.9289436, 0, 0, 1, 1, 1,
-0.112802, -0.1221999, -1.12088, 1, 0, 0, 1, 1,
-0.1124268, 0.06328884, -2.489825, 1, 0, 0, 1, 1,
-0.1123846, -0.2331323, -3.444407, 1, 0, 0, 1, 1,
-0.1105449, 0.6290696, 0.02987412, 1, 0, 0, 1, 1,
-0.1103461, 0.3690445, 1.152901, 1, 0, 0, 1, 1,
-0.1097903, -2.167525, -2.520215, 0, 0, 0, 1, 1,
-0.1096511, 1.657257, -1.942741, 0, 0, 0, 1, 1,
-0.1078477, -1.053155, -2.993782, 0, 0, 0, 1, 1,
-0.1075372, 0.2834824, -0.714427, 0, 0, 0, 1, 1,
-0.1071431, 0.63553, 0.4419723, 0, 0, 0, 1, 1,
-0.1041904, -1.200832, -2.83238, 0, 0, 0, 1, 1,
-0.10317, 0.9280531, -0.472078, 0, 0, 0, 1, 1,
-0.0994419, -1.75283, -3.021194, 1, 1, 1, 1, 1,
-0.09836862, 0.7846923, -1.144651, 1, 1, 1, 1, 1,
-0.09225916, 2.415633, 0.6056868, 1, 1, 1, 1, 1,
-0.09083175, 1.27222, 0.02708741, 1, 1, 1, 1, 1,
-0.08165067, -1.319165, -3.254727, 1, 1, 1, 1, 1,
-0.07479787, -1.822224, -1.932045, 1, 1, 1, 1, 1,
-0.07286541, 0.1410486, -0.7291073, 1, 1, 1, 1, 1,
-0.0716751, 0.01912934, -0.868639, 1, 1, 1, 1, 1,
-0.06933218, -0.3980303, -3.92236, 1, 1, 1, 1, 1,
-0.06726225, -0.5054316, -3.389555, 1, 1, 1, 1, 1,
-0.0665631, -0.09249541, -3.560718, 1, 1, 1, 1, 1,
-0.06523518, 1.689583, 0.8375418, 1, 1, 1, 1, 1,
-0.063314, 0.1040002, -0.8453627, 1, 1, 1, 1, 1,
-0.06148905, -0.1090535, -2.852233, 1, 1, 1, 1, 1,
-0.05983788, -0.1932087, -3.392977, 1, 1, 1, 1, 1,
-0.05565807, -0.528371, -2.124656, 0, 0, 1, 1, 1,
-0.05532048, 0.4609039, 0.5370466, 1, 0, 0, 1, 1,
-0.05517318, 0.6522885, -1.177038, 1, 0, 0, 1, 1,
-0.05416841, 0.2053312, -1.158218, 1, 0, 0, 1, 1,
-0.05100473, 2.214085, -0.01774734, 1, 0, 0, 1, 1,
-0.04837212, -0.1131948, -2.617804, 1, 0, 0, 1, 1,
-0.04824763, 1.060866, 0.9678131, 0, 0, 0, 1, 1,
-0.04612688, 0.3205006, -1.329154, 0, 0, 0, 1, 1,
-0.04044161, 0.5932735, 0.9816551, 0, 0, 0, 1, 1,
-0.03072774, 3.119957, -0.04013513, 0, 0, 0, 1, 1,
-0.02861479, -0.3338086, -3.931042, 0, 0, 0, 1, 1,
-0.02807236, 0.699078, -0.5949506, 0, 0, 0, 1, 1,
-0.02750492, -0.5304319, -4.205225, 0, 0, 0, 1, 1,
-0.02378335, 0.07998364, 0.5782281, 1, 1, 1, 1, 1,
-0.02325243, 1.360666, -0.2995037, 1, 1, 1, 1, 1,
-0.01987251, -0.8457789, -2.093785, 1, 1, 1, 1, 1,
-0.01891924, -0.4237224, -3.39647, 1, 1, 1, 1, 1,
-0.01674147, 1.340603, -0.2517981, 1, 1, 1, 1, 1,
-0.01568415, 0.1057577, -0.1508946, 1, 1, 1, 1, 1,
-0.01559983, 0.5484686, -0.3747723, 1, 1, 1, 1, 1,
-0.007858252, -0.1953511, -3.26455, 1, 1, 1, 1, 1,
-0.00438522, -0.2570805, -3.480328, 1, 1, 1, 1, 1,
0.01211814, -0.5829935, 2.620795, 1, 1, 1, 1, 1,
0.01596037, 0.8801189, -0.3792303, 1, 1, 1, 1, 1,
0.01615997, -0.4411089, 3.50396, 1, 1, 1, 1, 1,
0.01733758, -0.795966, 3.045784, 1, 1, 1, 1, 1,
0.020231, -0.4588903, 2.087118, 1, 1, 1, 1, 1,
0.02027405, 1.646674, -0.2343338, 1, 1, 1, 1, 1,
0.02454507, 0.6121182, -0.5412822, 0, 0, 1, 1, 1,
0.02579113, -1.096857, 3.49641, 1, 0, 0, 1, 1,
0.02945123, 2.008071, -0.8171502, 1, 0, 0, 1, 1,
0.03180719, 0.6500386, 1.113936, 1, 0, 0, 1, 1,
0.03237157, -1.344262, 2.424617, 1, 0, 0, 1, 1,
0.03415397, 0.7731819, -1.054878, 1, 0, 0, 1, 1,
0.03562509, -1.242501, 3.880329, 0, 0, 0, 1, 1,
0.04001623, 0.9383974, -0.3514703, 0, 0, 0, 1, 1,
0.0425081, 0.1598524, 1.517297, 0, 0, 0, 1, 1,
0.04347342, -2.078177, 3.139137, 0, 0, 0, 1, 1,
0.04830788, 0.4672565, 0.7050942, 0, 0, 0, 1, 1,
0.04947613, 2.324469, 0.2819818, 0, 0, 0, 1, 1,
0.05043065, 1.407038, 1.154724, 0, 0, 0, 1, 1,
0.05344073, -0.502427, 2.064279, 1, 1, 1, 1, 1,
0.05398178, -0.2453338, 2.28424, 1, 1, 1, 1, 1,
0.05450054, 0.790036, 1.697006, 1, 1, 1, 1, 1,
0.06100979, 2.30291, 0.7848214, 1, 1, 1, 1, 1,
0.06199658, 1.214612, 0.7543209, 1, 1, 1, 1, 1,
0.06446838, 0.4316429, -1.662766, 1, 1, 1, 1, 1,
0.06469782, 2.217423, -0.7054422, 1, 1, 1, 1, 1,
0.06549756, -0.8768948, 2.510806, 1, 1, 1, 1, 1,
0.06844666, -1.07785, 2.898915, 1, 1, 1, 1, 1,
0.0715689, -0.4020435, 2.693586, 1, 1, 1, 1, 1,
0.07172206, 0.2004996, -1.442524, 1, 1, 1, 1, 1,
0.074783, 2.945776, 0.6820989, 1, 1, 1, 1, 1,
0.07486398, -0.9901963, 4.317983, 1, 1, 1, 1, 1,
0.07596657, 1.476128, -0.6880907, 1, 1, 1, 1, 1,
0.07743908, 0.3664107, -0.8952509, 1, 1, 1, 1, 1,
0.0818247, 0.3470028, -1.479738, 0, 0, 1, 1, 1,
0.08456919, 0.6232678, 1.024452, 1, 0, 0, 1, 1,
0.08505632, 1.193835, -0.0752736, 1, 0, 0, 1, 1,
0.08547445, 1.673213, 2.390788, 1, 0, 0, 1, 1,
0.08626307, 0.06821492, 0.7229528, 1, 0, 0, 1, 1,
0.08787277, 0.09328883, 1.062719, 1, 0, 0, 1, 1,
0.08973778, -0.6237564, 3.557781, 0, 0, 0, 1, 1,
0.09150016, -1.054481, 2.849615, 0, 0, 0, 1, 1,
0.09357944, 0.2550769, 2.25454, 0, 0, 0, 1, 1,
0.09757204, 0.2426332, -0.074348, 0, 0, 0, 1, 1,
0.1000365, 2.281157, -0.7192405, 0, 0, 0, 1, 1,
0.1019562, 0.3730173, 1.891816, 0, 0, 0, 1, 1,
0.1022821, -1.718658, 2.943952, 0, 0, 0, 1, 1,
0.1027173, -0.3865911, 2.482619, 1, 1, 1, 1, 1,
0.1076802, -0.8924447, 4.300156, 1, 1, 1, 1, 1,
0.1115011, -1.410701, 1.950743, 1, 1, 1, 1, 1,
0.112329, -0.4935527, 1.997478, 1, 1, 1, 1, 1,
0.1148598, 0.7202761, 0.2236079, 1, 1, 1, 1, 1,
0.1165529, -0.8555079, 3.619488, 1, 1, 1, 1, 1,
0.1241397, -0.1423609, 1.949666, 1, 1, 1, 1, 1,
0.1246441, -0.3741094, 1.494852, 1, 1, 1, 1, 1,
0.1246611, -0.07300215, -0.007350761, 1, 1, 1, 1, 1,
0.1255786, 0.4013071, 0.5128792, 1, 1, 1, 1, 1,
0.1306537, 0.989643, -0.6789076, 1, 1, 1, 1, 1,
0.1313942, 0.7839853, 1.592092, 1, 1, 1, 1, 1,
0.1362514, -0.8381489, 3.032629, 1, 1, 1, 1, 1,
0.1378961, 0.2226482, 1.201437, 1, 1, 1, 1, 1,
0.1395591, -1.278472, 3.261825, 1, 1, 1, 1, 1,
0.140205, -0.615239, 3.200131, 0, 0, 1, 1, 1,
0.1440117, -0.5203034, 2.243943, 1, 0, 0, 1, 1,
0.1460764, -0.6867644, 4.729998, 1, 0, 0, 1, 1,
0.1461598, 0.1912975, -2.018703, 1, 0, 0, 1, 1,
0.1487097, -0.2336328, 1.915624, 1, 0, 0, 1, 1,
0.1491237, -0.6486275, 3.837404, 1, 0, 0, 1, 1,
0.1513926, 0.1830527, -0.6460092, 0, 0, 0, 1, 1,
0.1538136, 0.4528622, 1.248561, 0, 0, 0, 1, 1,
0.1560171, 1.275352, 0.02644468, 0, 0, 0, 1, 1,
0.1587757, 1.097702, -0.6021215, 0, 0, 0, 1, 1,
0.1609297, 0.06968816, 2.531713, 0, 0, 0, 1, 1,
0.1612649, -0.3533317, 2.801186, 0, 0, 0, 1, 1,
0.1650564, -1.205017, 5.121914, 0, 0, 0, 1, 1,
0.1670344, -0.3469526, 3.569423, 1, 1, 1, 1, 1,
0.169903, 0.5009713, -0.01427263, 1, 1, 1, 1, 1,
0.170118, 0.6554242, -0.700637, 1, 1, 1, 1, 1,
0.1711662, 0.2499215, 1.478516, 1, 1, 1, 1, 1,
0.1772677, -1.364416, 3.187169, 1, 1, 1, 1, 1,
0.1785603, 1.182505, 0.5226461, 1, 1, 1, 1, 1,
0.178784, -0.6561705, 3.811482, 1, 1, 1, 1, 1,
0.1789915, 0.9089071, 0.01095105, 1, 1, 1, 1, 1,
0.1798308, 1.070032, -0.01494528, 1, 1, 1, 1, 1,
0.185879, -0.2956246, 4.591255, 1, 1, 1, 1, 1,
0.1859812, 1.036386, -0.4920993, 1, 1, 1, 1, 1,
0.1871726, -0.8217345, 4.356546, 1, 1, 1, 1, 1,
0.1878745, 1.306905, -0.1496522, 1, 1, 1, 1, 1,
0.1893034, 0.4104131, 1.949716, 1, 1, 1, 1, 1,
0.1924331, -0.2860496, 1.423988, 1, 1, 1, 1, 1,
0.1926998, -0.4023063, 2.027858, 0, 0, 1, 1, 1,
0.193387, -1.76494, 2.269158, 1, 0, 0, 1, 1,
0.1948779, -0.4872788, 2.631083, 1, 0, 0, 1, 1,
0.1975635, 1.012184, -0.01705398, 1, 0, 0, 1, 1,
0.20414, -0.1496775, 0.8199205, 1, 0, 0, 1, 1,
0.2071509, 0.1903933, 0.3182346, 1, 0, 0, 1, 1,
0.2084519, -0.169051, 1.0952, 0, 0, 0, 1, 1,
0.2169286, 0.0214971, 1.082547, 0, 0, 0, 1, 1,
0.2180151, 0.385702, 1.019918, 0, 0, 0, 1, 1,
0.219545, -1.990899, 4.066923, 0, 0, 0, 1, 1,
0.220849, 0.3048548, 0.4971516, 0, 0, 0, 1, 1,
0.2230088, 1.581868, 0.5728793, 0, 0, 0, 1, 1,
0.2280302, 0.6174799, 0.1909752, 0, 0, 0, 1, 1,
0.2320801, -0.04280027, 1.051897, 1, 1, 1, 1, 1,
0.2400872, 0.1170178, 1.217576, 1, 1, 1, 1, 1,
0.2432136, -0.08123776, 1.812371, 1, 1, 1, 1, 1,
0.2446348, 1.22812, -0.2158623, 1, 1, 1, 1, 1,
0.25964, -1.197889, 3.681164, 1, 1, 1, 1, 1,
0.2691967, 0.2550269, -0.7384275, 1, 1, 1, 1, 1,
0.2716663, -1.245649, 2.913087, 1, 1, 1, 1, 1,
0.2744805, 0.244938, 1.520735, 1, 1, 1, 1, 1,
0.2768537, -0.303243, 2.734413, 1, 1, 1, 1, 1,
0.2773638, -0.1175207, 3.159105, 1, 1, 1, 1, 1,
0.2822277, -1.013247, 4.023812, 1, 1, 1, 1, 1,
0.2823537, 1.608793, 1.119428, 1, 1, 1, 1, 1,
0.2850949, -1.021792, 3.643101, 1, 1, 1, 1, 1,
0.289778, 1.172898, 0.6197019, 1, 1, 1, 1, 1,
0.2951571, 0.7433594, -0.7593437, 1, 1, 1, 1, 1,
0.2974298, 0.4467302, 0.09057348, 0, 0, 1, 1, 1,
0.312674, -0.157849, 3.203714, 1, 0, 0, 1, 1,
0.3155877, -0.4481571, 3.794519, 1, 0, 0, 1, 1,
0.316194, -0.3935299, 3.647617, 1, 0, 0, 1, 1,
0.3167411, -1.675816, 2.586146, 1, 0, 0, 1, 1,
0.3185015, 0.127513, 1.638989, 1, 0, 0, 1, 1,
0.3225748, -1.582717, 1.858094, 0, 0, 0, 1, 1,
0.3233346, 0.6896167, -0.1436815, 0, 0, 0, 1, 1,
0.3329874, -0.7800148, 3.492019, 0, 0, 0, 1, 1,
0.334434, 0.2953197, 2.561573, 0, 0, 0, 1, 1,
0.3353356, -1.45374, 4.959989, 0, 0, 0, 1, 1,
0.3359405, -0.1586272, 2.306468, 0, 0, 0, 1, 1,
0.3422193, 0.01047015, 1.304161, 0, 0, 0, 1, 1,
0.3426973, 0.9688675, -1.266772, 1, 1, 1, 1, 1,
0.3449217, 0.2021761, 1.076561, 1, 1, 1, 1, 1,
0.3501467, 1.203483, 0.02256035, 1, 1, 1, 1, 1,
0.3510836, 0.4319435, 0.4082095, 1, 1, 1, 1, 1,
0.3560893, 1.96049, 2.714658, 1, 1, 1, 1, 1,
0.3611261, 1.177748, 0.8948048, 1, 1, 1, 1, 1,
0.3612353, 0.5688751, 0.3922642, 1, 1, 1, 1, 1,
0.3621921, -0.4065401, 1.583506, 1, 1, 1, 1, 1,
0.3633103, -0.9321605, 2.403945, 1, 1, 1, 1, 1,
0.3644831, 0.5198143, 1.000673, 1, 1, 1, 1, 1,
0.3694931, 0.4078974, -1.844201, 1, 1, 1, 1, 1,
0.3696304, 0.06740049, 0.168489, 1, 1, 1, 1, 1,
0.3723473, 1.260562, 2.836615, 1, 1, 1, 1, 1,
0.3766598, -0.1956591, 2.664543, 1, 1, 1, 1, 1,
0.3778371, -0.04622372, 0.6125701, 1, 1, 1, 1, 1,
0.3834107, -0.7031518, 1.940449, 0, 0, 1, 1, 1,
0.3928797, -0.3042459, 1.982337, 1, 0, 0, 1, 1,
0.3944232, -0.269617, 0.9460854, 1, 0, 0, 1, 1,
0.4037675, 1.574374, -0.4860049, 1, 0, 0, 1, 1,
0.4062475, -0.2186095, 0.9799024, 1, 0, 0, 1, 1,
0.4072348, 0.5115839, -0.1595845, 1, 0, 0, 1, 1,
0.4120487, -1.455056, 4.56404, 0, 0, 0, 1, 1,
0.4145881, 0.5916429, 1.760048, 0, 0, 0, 1, 1,
0.4162957, 0.673912, 0.1718199, 0, 0, 0, 1, 1,
0.4231881, 0.5197391, 1.120525, 0, 0, 0, 1, 1,
0.4242086, 1.43567, 1.524535, 0, 0, 0, 1, 1,
0.4314193, -0.08692522, 2.601707, 0, 0, 0, 1, 1,
0.4329841, 0.6929231, 0.3180804, 0, 0, 0, 1, 1,
0.4353862, 0.2385301, 1.025801, 1, 1, 1, 1, 1,
0.436906, 0.7265938, 0.3236136, 1, 1, 1, 1, 1,
0.43783, 0.4399827, 2.471005, 1, 1, 1, 1, 1,
0.4419624, -1.557879, 4.404008, 1, 1, 1, 1, 1,
0.4546706, -1.281139, 4.211541, 1, 1, 1, 1, 1,
0.4566202, -0.4069987, 2.866882, 1, 1, 1, 1, 1,
0.4574378, -1.876284, 4.162863, 1, 1, 1, 1, 1,
0.4574753, -0.1538502, 1.074741, 1, 1, 1, 1, 1,
0.4596364, -1.151966, 3.573126, 1, 1, 1, 1, 1,
0.460567, 1.535004, -0.2708721, 1, 1, 1, 1, 1,
0.4662849, -0.03585578, 0.9219112, 1, 1, 1, 1, 1,
0.4678481, -0.08329868, 2.200509, 1, 1, 1, 1, 1,
0.4693481, -0.5701735, 0.8289998, 1, 1, 1, 1, 1,
0.470318, -0.607123, 2.893772, 1, 1, 1, 1, 1,
0.4731314, -1.556564, 1.905142, 1, 1, 1, 1, 1,
0.4735894, 1.799771, 0.493055, 0, 0, 1, 1, 1,
0.4753657, -0.5714809, 2.892844, 1, 0, 0, 1, 1,
0.4855422, -1.833211, 2.669295, 1, 0, 0, 1, 1,
0.4864194, 2.136585, 1.124417, 1, 0, 0, 1, 1,
0.4882239, 1.382272, 0.1198412, 1, 0, 0, 1, 1,
0.490679, 1.300565, 0.1904453, 1, 0, 0, 1, 1,
0.4918174, 0.5968779, 2.712065, 0, 0, 0, 1, 1,
0.4983644, -0.6189095, 2.911884, 0, 0, 0, 1, 1,
0.4994498, -0.4178152, 3.49209, 0, 0, 0, 1, 1,
0.5021518, 0.1959492, 0.1513972, 0, 0, 0, 1, 1,
0.5042447, 0.2120929, 0.4801962, 0, 0, 0, 1, 1,
0.5044378, -0.6315889, 3.177565, 0, 0, 0, 1, 1,
0.5046604, -1.99229, 2.755539, 0, 0, 0, 1, 1,
0.5066306, 0.03072085, 2.611386, 1, 1, 1, 1, 1,
0.5072566, 0.128108, 1.246655, 1, 1, 1, 1, 1,
0.5080959, -1.328187, 4.197961, 1, 1, 1, 1, 1,
0.5175661, -1.98294, 3.283724, 1, 1, 1, 1, 1,
0.5180188, -0.1912545, 1.943877, 1, 1, 1, 1, 1,
0.5202397, 0.6434291, -0.7754735, 1, 1, 1, 1, 1,
0.5226766, -1.013486, 2.289973, 1, 1, 1, 1, 1,
0.522857, -0.9663497, 2.343441, 1, 1, 1, 1, 1,
0.5284148, -1.4954, 4.047127, 1, 1, 1, 1, 1,
0.5295458, 1.476558, -2.346666, 1, 1, 1, 1, 1,
0.5301438, -0.8558508, 3.511822, 1, 1, 1, 1, 1,
0.5326914, 0.5461027, 2.95266, 1, 1, 1, 1, 1,
0.5332056, 0.656926, 1.600735, 1, 1, 1, 1, 1,
0.5368044, 1.322082, -0.3894975, 1, 1, 1, 1, 1,
0.5391887, -0.1558945, 3.508289, 1, 1, 1, 1, 1,
0.5436882, -1.739647, 1.247168, 0, 0, 1, 1, 1,
0.5438766, -0.02493919, 0.393324, 1, 0, 0, 1, 1,
0.5505334, 1.486881, 0.5521861, 1, 0, 0, 1, 1,
0.5515069, -1.354753, 0.9760749, 1, 0, 0, 1, 1,
0.5537575, 0.1471515, -1.044091, 1, 0, 0, 1, 1,
0.5555915, 0.6897219, -0.643231, 1, 0, 0, 1, 1,
0.5586656, 0.5322043, 1.197284, 0, 0, 0, 1, 1,
0.5600216, 0.7471033, 2.013038, 0, 0, 0, 1, 1,
0.5614661, -0.5892954, 2.646364, 0, 0, 0, 1, 1,
0.5642484, -1.520786, 3.091395, 0, 0, 0, 1, 1,
0.5693663, -0.1976813, 1.260663, 0, 0, 0, 1, 1,
0.57016, -0.2230093, 1.449948, 0, 0, 0, 1, 1,
0.5735136, 1.298378, 0.4763277, 0, 0, 0, 1, 1,
0.5741659, 0.2439086, -0.1868024, 1, 1, 1, 1, 1,
0.5766101, -0.04550551, 1.394073, 1, 1, 1, 1, 1,
0.5772557, 0.1592804, 1.832091, 1, 1, 1, 1, 1,
0.5779217, 1.710705, 0.5300213, 1, 1, 1, 1, 1,
0.5825924, -1.018451, 2.316551, 1, 1, 1, 1, 1,
0.5842148, -0.5059298, 2.763994, 1, 1, 1, 1, 1,
0.5843636, -0.2997815, 0.8314336, 1, 1, 1, 1, 1,
0.5863334, -0.8056986, 1.331791, 1, 1, 1, 1, 1,
0.5940727, -1.287339, 4.834215, 1, 1, 1, 1, 1,
0.5955369, -1.267752, 2.719679, 1, 1, 1, 1, 1,
0.6011395, 0.5854923, 2.770564, 1, 1, 1, 1, 1,
0.6032802, -0.1025482, 2.25508, 1, 1, 1, 1, 1,
0.6096141, 1.732019, 1.181646, 1, 1, 1, 1, 1,
0.6172899, -0.1237149, 2.728288, 1, 1, 1, 1, 1,
0.6235993, 0.6590493, 0.9284091, 1, 1, 1, 1, 1,
0.6244126, 0.4764606, 0.5365977, 0, 0, 1, 1, 1,
0.6247307, 1.613241, -1.237681, 1, 0, 0, 1, 1,
0.6317959, -0.7338896, 4.740624, 1, 0, 0, 1, 1,
0.6358114, -1.366238, 1.865271, 1, 0, 0, 1, 1,
0.637756, 1.023989, -0.625579, 1, 0, 0, 1, 1,
0.6393775, -2.790669, 3.651492, 1, 0, 0, 1, 1,
0.642545, -0.3494782, 1.572278, 0, 0, 0, 1, 1,
0.6451027, -0.02886602, 0.4579706, 0, 0, 0, 1, 1,
0.6468295, -0.9752347, 3.067595, 0, 0, 0, 1, 1,
0.6583337, -1.722834, 2.855436, 0, 0, 0, 1, 1,
0.6591265, 0.3312683, 2.069262, 0, 0, 0, 1, 1,
0.6618204, 0.6664507, 1.060309, 0, 0, 0, 1, 1,
0.6629738, -0.649772, 3.450258, 0, 0, 0, 1, 1,
0.6668296, 1.563931, 1.842472, 1, 1, 1, 1, 1,
0.6750541, 1.256198, 0.8797024, 1, 1, 1, 1, 1,
0.6784344, 1.278707, -0.9096265, 1, 1, 1, 1, 1,
0.6793532, -0.3163415, 4.186493, 1, 1, 1, 1, 1,
0.6927716, -1.014969, 1.625318, 1, 1, 1, 1, 1,
0.694894, -1.668143, 2.803293, 1, 1, 1, 1, 1,
0.6966673, 0.6855614, -0.8316505, 1, 1, 1, 1, 1,
0.6989667, -0.9306374, 1.664911, 1, 1, 1, 1, 1,
0.7000403, 1.488011, 0.09210336, 1, 1, 1, 1, 1,
0.7021999, 0.5271099, 1.853311, 1, 1, 1, 1, 1,
0.7070431, 0.2915361, -0.07288159, 1, 1, 1, 1, 1,
0.7101177, 1.910439, -1.833842, 1, 1, 1, 1, 1,
0.7130631, 0.07524403, 0.7444906, 1, 1, 1, 1, 1,
0.7191142, 1.090043, 0.42073, 1, 1, 1, 1, 1,
0.7242005, -0.09982022, 2.826192, 1, 1, 1, 1, 1,
0.7273982, 0.5795906, -1.082111, 0, 0, 1, 1, 1,
0.7299269, 0.8904353, 0.4819493, 1, 0, 0, 1, 1,
0.7324076, -0.3489676, 1.172622, 1, 0, 0, 1, 1,
0.7335474, 2.130783, -0.5667372, 1, 0, 0, 1, 1,
0.7385081, -0.0886857, 2.222133, 1, 0, 0, 1, 1,
0.7394373, -0.147121, 0.71948, 1, 0, 0, 1, 1,
0.7398692, -1.381384, 2.754616, 0, 0, 0, 1, 1,
0.7414914, -0.9830222, 1.188516, 0, 0, 0, 1, 1,
0.7425316, -0.1637736, 2.197138, 0, 0, 0, 1, 1,
0.7431195, 0.1451112, 2.666734, 0, 0, 0, 1, 1,
0.7431513, 0.08951987, 1.596194, 0, 0, 0, 1, 1,
0.7480415, 0.2425752, 2.245153, 0, 0, 0, 1, 1,
0.7528297, -0.559258, 2.833689, 0, 0, 0, 1, 1,
0.7538215, 1.07075, 0.9180718, 1, 1, 1, 1, 1,
0.7549638, 2.134261, 0.3994527, 1, 1, 1, 1, 1,
0.7619573, -0.3033235, 2.923339, 1, 1, 1, 1, 1,
0.7667745, -0.1612543, 0.6149955, 1, 1, 1, 1, 1,
0.7689959, -1.860295, 4.141006, 1, 1, 1, 1, 1,
0.7751321, -0.02512638, 0.7138351, 1, 1, 1, 1, 1,
0.7758924, -0.4272677, 2.079881, 1, 1, 1, 1, 1,
0.7811599, 1.179985, 0.2710797, 1, 1, 1, 1, 1,
0.7898014, 1.847703, 0.1492689, 1, 1, 1, 1, 1,
0.799171, -1.01398, 2.764612, 1, 1, 1, 1, 1,
0.8007904, -0.1849884, 2.49505, 1, 1, 1, 1, 1,
0.8038806, 0.4777302, 0.08494932, 1, 1, 1, 1, 1,
0.8050207, -1.468906, 2.355505, 1, 1, 1, 1, 1,
0.8086264, -0.7693293, 2.964601, 1, 1, 1, 1, 1,
0.8108917, 0.4051389, 0.711996, 1, 1, 1, 1, 1,
0.8119308, -0.6934729, 1.332353, 0, 0, 1, 1, 1,
0.8123822, -0.2085912, 2.448557, 1, 0, 0, 1, 1,
0.8137786, 0.3541222, 1.37694, 1, 0, 0, 1, 1,
0.8157353, -1.265744, 2.842209, 1, 0, 0, 1, 1,
0.8167527, 0.3071368, -0.6567646, 1, 0, 0, 1, 1,
0.8171657, -0.3049924, 1.923631, 1, 0, 0, 1, 1,
0.8227547, -0.2953914, 2.252814, 0, 0, 0, 1, 1,
0.8337926, 0.2265828, 1.385161, 0, 0, 0, 1, 1,
0.835098, 0.5591886, 3.164763, 0, 0, 0, 1, 1,
0.8448448, 0.2857759, 1.696865, 0, 0, 0, 1, 1,
0.8509107, -0.07125579, 1.912757, 0, 0, 0, 1, 1,
0.8671336, 0.5795584, 0.8436052, 0, 0, 0, 1, 1,
0.8693507, 0.2828581, 1.92697, 0, 0, 0, 1, 1,
0.8716127, 0.3716634, 0.1163682, 1, 1, 1, 1, 1,
0.8728627, -0.6003387, 2.747766, 1, 1, 1, 1, 1,
0.8749279, -0.4617333, 1.475624, 1, 1, 1, 1, 1,
0.8763708, 0.9175796, -0.6987952, 1, 1, 1, 1, 1,
0.887436, -0.445418, 0.4064897, 1, 1, 1, 1, 1,
0.8874978, 1.691502, 0.2062001, 1, 1, 1, 1, 1,
0.8886226, 0.7700429, 1.536631, 1, 1, 1, 1, 1,
0.8891125, -0.09232602, 2.500103, 1, 1, 1, 1, 1,
0.895555, -0.5534191, 2.245253, 1, 1, 1, 1, 1,
0.8959969, 1.154118, 0.2193824, 1, 1, 1, 1, 1,
0.8985719, 1.10928, -0.2952129, 1, 1, 1, 1, 1,
0.9016771, 0.9493645, 0.7245613, 1, 1, 1, 1, 1,
0.9018495, -1.08902, 2.009293, 1, 1, 1, 1, 1,
0.9036172, 0.5414727, 0.213561, 1, 1, 1, 1, 1,
0.9044678, 0.5103813, 1.359326, 1, 1, 1, 1, 1,
0.9056512, 0.1616227, 1.977906, 0, 0, 1, 1, 1,
0.9129941, -0.1317179, 2.604386, 1, 0, 0, 1, 1,
0.9134741, -0.856116, 2.653345, 1, 0, 0, 1, 1,
0.9160097, 0.244162, 0.3776601, 1, 0, 0, 1, 1,
0.9172652, 2.077523, 0.9687623, 1, 0, 0, 1, 1,
0.9183204, -0.4118585, 2.388623, 1, 0, 0, 1, 1,
0.9226512, -3.217794, 2.619115, 0, 0, 0, 1, 1,
0.9231163, 1.65012, 1.315992, 0, 0, 0, 1, 1,
0.9236176, -0.9419782, 1.519265, 0, 0, 0, 1, 1,
0.9270097, 0.8398029, 2.068231, 0, 0, 0, 1, 1,
0.9271596, 0.8005085, 0.8712283, 0, 0, 0, 1, 1,
0.9277578, -1.421609, 2.169295, 0, 0, 0, 1, 1,
0.9299254, -0.07699697, 1.01482, 0, 0, 0, 1, 1,
0.9346613, 0.6250469, 2.129445, 1, 1, 1, 1, 1,
0.9365066, -0.4837941, 1.540523, 1, 1, 1, 1, 1,
0.9378541, 1.079917, -0.01706866, 1, 1, 1, 1, 1,
0.9430003, -1.276274, 2.562909, 1, 1, 1, 1, 1,
0.943234, 0.4138416, 1.547966, 1, 1, 1, 1, 1,
0.9448087, 0.1918385, 1.626177, 1, 1, 1, 1, 1,
0.9453539, 0.160671, 1.651121, 1, 1, 1, 1, 1,
0.9454741, -0.8214181, 2.009598, 1, 1, 1, 1, 1,
0.9474243, 0.831269, 0.9161116, 1, 1, 1, 1, 1,
0.9487044, 0.1187947, 1.249669, 1, 1, 1, 1, 1,
0.9492772, -0.1577147, 1.131964, 1, 1, 1, 1, 1,
0.9533792, 0.1182838, 2.331762, 1, 1, 1, 1, 1,
0.9538248, 0.08551501, 3.949419, 1, 1, 1, 1, 1,
0.955135, 0.814316, 0.6068563, 1, 1, 1, 1, 1,
0.9779975, 0.7360528, 1.018788, 1, 1, 1, 1, 1,
0.9806576, -2.013182, 3.043215, 0, 0, 1, 1, 1,
0.9820853, 0.3429807, 0.2981641, 1, 0, 0, 1, 1,
0.992816, 0.05462807, 2.915941, 1, 0, 0, 1, 1,
0.9941495, -0.8307598, 2.149268, 1, 0, 0, 1, 1,
0.9958422, 0.9342721, 0.8104441, 1, 0, 0, 1, 1,
0.9967256, 1.275575, 0.6748239, 1, 0, 0, 1, 1,
0.9986671, -0.1449542, 0.07950084, 0, 0, 0, 1, 1,
0.9991726, 0.5881375, -0.7742069, 0, 0, 0, 1, 1,
1.000142, 1.672529, 1.133995, 0, 0, 0, 1, 1,
1.002412, 1.398418, 0.8706717, 0, 0, 0, 1, 1,
1.003928, -0.1723646, 3.582699, 0, 0, 0, 1, 1,
1.007854, -0.08674326, 1.558125, 0, 0, 0, 1, 1,
1.007923, -0.9192033, 3.065959, 0, 0, 0, 1, 1,
1.009879, 0.6217877, 2.012166, 1, 1, 1, 1, 1,
1.012325, -0.8902393, 1.127973, 1, 1, 1, 1, 1,
1.01248, -0.3666077, 3.10339, 1, 1, 1, 1, 1,
1.018448, -1.764754, 3.092734, 1, 1, 1, 1, 1,
1.01927, -0.1714544, 1.186589, 1, 1, 1, 1, 1,
1.02171, 1.873461, -1.122224, 1, 1, 1, 1, 1,
1.023196, 1.060174, 1.950791, 1, 1, 1, 1, 1,
1.031083, 1.815934, 1.251645, 1, 1, 1, 1, 1,
1.033639, 0.3149729, 1.264432, 1, 1, 1, 1, 1,
1.033839, 0.7552439, 0.9040409, 1, 1, 1, 1, 1,
1.034352, -0.4687918, 3.442023, 1, 1, 1, 1, 1,
1.035868, 0.4470141, 0.1239906, 1, 1, 1, 1, 1,
1.038197, -2.614994, 3.623169, 1, 1, 1, 1, 1,
1.03846, 0.08782043, 2.079271, 1, 1, 1, 1, 1,
1.03883, 0.4646306, 0.2911725, 1, 1, 1, 1, 1,
1.039022, -0.9762333, 3.625326, 0, 0, 1, 1, 1,
1.039506, 0.9937471, 1.525596, 1, 0, 0, 1, 1,
1.043433, -0.5349592, 1.756462, 1, 0, 0, 1, 1,
1.044443, -0.2067827, 0.984947, 1, 0, 0, 1, 1,
1.048747, 0.03491072, 2.424633, 1, 0, 0, 1, 1,
1.050517, 1.308319, 2.912714, 1, 0, 0, 1, 1,
1.052281, 1.484588, 0.7783422, 0, 0, 0, 1, 1,
1.055544, 0.2259894, 2.904765, 0, 0, 0, 1, 1,
1.061599, -1.142376, 2.642417, 0, 0, 0, 1, 1,
1.080889, 1.182739, 1.742473, 0, 0, 0, 1, 1,
1.086788, -1.042723, 1.830166, 0, 0, 0, 1, 1,
1.091283, 1.067486, 1.552355, 0, 0, 0, 1, 1,
1.097215, 0.123272, 2.184816, 0, 0, 0, 1, 1,
1.098285, 0.6159592, 1.998785, 1, 1, 1, 1, 1,
1.10588, 0.5160226, 1.562712, 1, 1, 1, 1, 1,
1.107352, -0.6153977, 1.15636, 1, 1, 1, 1, 1,
1.107674, 0.1471008, 0.860294, 1, 1, 1, 1, 1,
1.110137, 1.653333, -0.9039034, 1, 1, 1, 1, 1,
1.11793, -0.06350917, 1.652577, 1, 1, 1, 1, 1,
1.123989, 0.5873851, 2.015188, 1, 1, 1, 1, 1,
1.125306, -1.139399, 2.126836, 1, 1, 1, 1, 1,
1.12982, 1.028243, 2.48354, 1, 1, 1, 1, 1,
1.140187, 1.862285, -0.02886559, 1, 1, 1, 1, 1,
1.147834, -0.07004336, 2.826504, 1, 1, 1, 1, 1,
1.164081, 1.54108, 0.2154708, 1, 1, 1, 1, 1,
1.165879, 1.698152, 0.7615775, 1, 1, 1, 1, 1,
1.17325, -0.4857447, 2.786487, 1, 1, 1, 1, 1,
1.174823, -0.5116347, 1.678105, 1, 1, 1, 1, 1,
1.175588, -0.3733014, 0.9213276, 0, 0, 1, 1, 1,
1.178365, 2.891171, 1.291145, 1, 0, 0, 1, 1,
1.197536, 1.69959, 1.039645, 1, 0, 0, 1, 1,
1.204913, 0.217115, 0.4600814, 1, 0, 0, 1, 1,
1.205998, 0.9155785, 0.2816406, 1, 0, 0, 1, 1,
1.209605, 0.2690617, 1.925907, 1, 0, 0, 1, 1,
1.214545, -1.554398, 1.365115, 0, 0, 0, 1, 1,
1.21694, -0.1474728, 1.459492, 0, 0, 0, 1, 1,
1.217136, 0.1229385, 2.297787, 0, 0, 0, 1, 1,
1.21801, -1.546854, 3.769688, 0, 0, 0, 1, 1,
1.220729, 1.422664, 2.369389, 0, 0, 0, 1, 1,
1.226022, 0.101411, 2.242027, 0, 0, 0, 1, 1,
1.22962, 0.674569, 2.529957, 0, 0, 0, 1, 1,
1.233586, -0.3645401, 1.015048, 1, 1, 1, 1, 1,
1.233913, -0.3049076, 1.350564, 1, 1, 1, 1, 1,
1.270966, -0.5407423, 3.980031, 1, 1, 1, 1, 1,
1.279276, -0.04915313, 1.98765, 1, 1, 1, 1, 1,
1.279726, 0.6132356, 1.797649, 1, 1, 1, 1, 1,
1.28206, -1.376911, 0.9705888, 1, 1, 1, 1, 1,
1.30337, -1.294933, 2.984751, 1, 1, 1, 1, 1,
1.303511, -0.3953413, 2.445531, 1, 1, 1, 1, 1,
1.308736, -1.336392, 3.200347, 1, 1, 1, 1, 1,
1.310883, -0.08985768, 0.9449806, 1, 1, 1, 1, 1,
1.331455, 1.279711, 0.7969036, 1, 1, 1, 1, 1,
1.332996, -1.81914, 3.220835, 1, 1, 1, 1, 1,
1.355657, 0.2778152, 1.743557, 1, 1, 1, 1, 1,
1.357463, 1.351462, -0.591139, 1, 1, 1, 1, 1,
1.36435, -0.01743898, 1.59375, 1, 1, 1, 1, 1,
1.365277, 0.8406189, 0.9369004, 0, 0, 1, 1, 1,
1.371503, -0.03328518, 1.805832, 1, 0, 0, 1, 1,
1.374013, -0.5396182, 0.566084, 1, 0, 0, 1, 1,
1.385251, 1.132648, 0.8431754, 1, 0, 0, 1, 1,
1.387865, -0.5634552, 0.4976566, 1, 0, 0, 1, 1,
1.393927, -0.5040166, 1.213327, 1, 0, 0, 1, 1,
1.394635, 0.0305639, 2.53771, 0, 0, 0, 1, 1,
1.406967, -0.4400541, 1.321968, 0, 0, 0, 1, 1,
1.409467, -0.1306469, 4.500489, 0, 0, 0, 1, 1,
1.411654, -0.3888684, 1.65435, 0, 0, 0, 1, 1,
1.416584, -0.3801147, 0.8258513, 0, 0, 0, 1, 1,
1.41684, 0.4048068, 0.0950108, 0, 0, 0, 1, 1,
1.419317, 0.2951991, 1.320816, 0, 0, 0, 1, 1,
1.44034, 0.6645051, 2.682361, 1, 1, 1, 1, 1,
1.444727, -1.695211, 2.735285, 1, 1, 1, 1, 1,
1.448747, 0.6166626, 1.404085, 1, 1, 1, 1, 1,
1.450379, 0.2065593, 0.9976486, 1, 1, 1, 1, 1,
1.454351, -0.8713486, 2.177109, 1, 1, 1, 1, 1,
1.454881, 0.4231702, 3.060625, 1, 1, 1, 1, 1,
1.484532, -0.5592548, 1.489842, 1, 1, 1, 1, 1,
1.500497, -0.9235016, 0.4175804, 1, 1, 1, 1, 1,
1.532924, 0.5806, 1.526748, 1, 1, 1, 1, 1,
1.533335, -0.4167265, 1.27128, 1, 1, 1, 1, 1,
1.538034, 0.5885158, 0.8536459, 1, 1, 1, 1, 1,
1.541202, -0.8896641, 3.003774, 1, 1, 1, 1, 1,
1.575635, 0.4216923, 1.308312, 1, 1, 1, 1, 1,
1.577317, 0.004130659, 1.959344, 1, 1, 1, 1, 1,
1.606464, -0.5106907, 1.586385, 1, 1, 1, 1, 1,
1.612613, -0.1427579, 1.833233, 0, 0, 1, 1, 1,
1.613346, 2.492659, -0.1508426, 1, 0, 0, 1, 1,
1.621243, 0.4039316, 3.111118, 1, 0, 0, 1, 1,
1.623831, -1.32748, 2.955039, 1, 0, 0, 1, 1,
1.62613, 0.8604116, -1.198201, 1, 0, 0, 1, 1,
1.636927, -0.4698755, 3.248029, 1, 0, 0, 1, 1,
1.693443, 1.255231, 1.620031, 0, 0, 0, 1, 1,
1.706412, 0.1226912, 1.097384, 0, 0, 0, 1, 1,
1.733246, 0.3555513, 0.639426, 0, 0, 0, 1, 1,
1.799282, 0.6352782, -0.04621236, 0, 0, 0, 1, 1,
1.799491, -0.6580589, 2.795373, 0, 0, 0, 1, 1,
1.80791, 0.6112511, 3.446922, 0, 0, 0, 1, 1,
1.816837, -1.708104, 3.276024, 0, 0, 0, 1, 1,
1.820819, -1.580676, 1.229653, 1, 1, 1, 1, 1,
1.829696, -0.8804234, 3.07846, 1, 1, 1, 1, 1,
1.83236, 0.8987356, 1.636263, 1, 1, 1, 1, 1,
1.83424, -0.0688084, 2.95913, 1, 1, 1, 1, 1,
1.836362, 0.005125303, 0.7955561, 1, 1, 1, 1, 1,
1.856234, 0.378134, 0.5351049, 1, 1, 1, 1, 1,
1.870145, 0.5560175, 1.587179, 1, 1, 1, 1, 1,
1.876516, -0.08349186, 3.232147, 1, 1, 1, 1, 1,
1.877358, 0.4958139, 0.8063241, 1, 1, 1, 1, 1,
1.918577, 0.3872134, 1.50745, 1, 1, 1, 1, 1,
1.980746, -0.8442242, 0.9664226, 1, 1, 1, 1, 1,
1.988761, 2.055763, 0.9155222, 1, 1, 1, 1, 1,
2.04273, -0.2486621, 0.5431041, 1, 1, 1, 1, 1,
2.055557, -1.006328, 2.831912, 1, 1, 1, 1, 1,
2.055597, 1.223608, 1.531462, 1, 1, 1, 1, 1,
2.062415, 1.353197, 1.892215, 0, 0, 1, 1, 1,
2.067461, -0.3516114, 1.534592, 1, 0, 0, 1, 1,
2.071123, 0.4440746, 0.8404057, 1, 0, 0, 1, 1,
2.071546, -1.346914, 2.973325, 1, 0, 0, 1, 1,
2.079386, -0.01170143, 0.7606381, 1, 0, 0, 1, 1,
2.083063, 0.3432316, 1.163818, 1, 0, 0, 1, 1,
2.083917, -0.9124009, 2.592315, 0, 0, 0, 1, 1,
2.103421, 0.06068781, 1.768251, 0, 0, 0, 1, 1,
2.109032, 0.5376925, 0.2821069, 0, 0, 0, 1, 1,
2.11865, 0.3130952, 1.616831, 0, 0, 0, 1, 1,
2.15675, 0.8345565, 3.189137, 0, 0, 0, 1, 1,
2.256064, 0.1463327, 0.8031339, 0, 0, 0, 1, 1,
2.327437, -1.019888, 2.925428, 0, 0, 0, 1, 1,
2.339854, -2.182151, 2.444408, 1, 1, 1, 1, 1,
2.35796, 0.1683163, 0.766311, 1, 1, 1, 1, 1,
2.413711, 0.05321988, 2.180817, 1, 1, 1, 1, 1,
2.518307, -0.4218802, 2.045512, 1, 1, 1, 1, 1,
2.805445, 1.531614, 2.249531, 1, 1, 1, 1, 1,
2.878826, -1.36737, 1.761484, 1, 1, 1, 1, 1,
3.999954, -0.8717706, 1.693869, 1, 1, 1, 1, 1
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
var radius = 9.632686;
var distance = 33.8344;
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
mvMatrix.translate( -0.4776437, 0.1644754, 0.03253007 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -33.8344);
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
