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
-3.14469, 0.5604571, -1.861505, 1, 0, 0, 1,
-2.949971, -1.501017, -1.480225, 1, 0.007843138, 0, 1,
-2.906836, -0.6842315, -0.7922006, 1, 0.01176471, 0, 1,
-2.880485, -1.866248, -1.086921, 1, 0.01960784, 0, 1,
-2.762461, -1.325195, -0.8972606, 1, 0.02352941, 0, 1,
-2.472786, 1.020895, -1.305796, 1, 0.03137255, 0, 1,
-2.438767, 1.770569, -0.8621303, 1, 0.03529412, 0, 1,
-2.377772, 0.928208, -1.156087, 1, 0.04313726, 0, 1,
-2.353136, -0.6955978, -2.543159, 1, 0.04705882, 0, 1,
-2.325274, -0.047267, -0.01087152, 1, 0.05490196, 0, 1,
-2.283455, 0.2777812, -1.739823, 1, 0.05882353, 0, 1,
-2.268075, 0.8544915, -0.7176396, 1, 0.06666667, 0, 1,
-2.264951, -0.5231538, -0.7661248, 1, 0.07058824, 0, 1,
-2.236713, 0.532888, -0.7724868, 1, 0.07843138, 0, 1,
-2.175185, -0.7144291, -2.917063, 1, 0.08235294, 0, 1,
-2.139771, 0.4827851, -1.465727, 1, 0.09019608, 0, 1,
-2.137991, -0.3124157, -1.617929, 1, 0.09411765, 0, 1,
-2.131153, -2.584487, -1.593399, 1, 0.1019608, 0, 1,
-2.089928, 0.3020457, -1.480508, 1, 0.1098039, 0, 1,
-1.984943, 1.229327, -0.8519909, 1, 0.1137255, 0, 1,
-1.934625, 0.3686331, -2.576504, 1, 0.1215686, 0, 1,
-1.931568, 1.963401, -0.1563577, 1, 0.1254902, 0, 1,
-1.911311, -0.5154933, -2.221886, 1, 0.1333333, 0, 1,
-1.870921, 1.339535, -0.665137, 1, 0.1372549, 0, 1,
-1.861458, -0.1043011, -0.3348152, 1, 0.145098, 0, 1,
-1.858783, -0.4841982, -2.910964, 1, 0.1490196, 0, 1,
-1.845879, -0.128978, -1.349366, 1, 0.1568628, 0, 1,
-1.833894, 0.6539356, -1.921631, 1, 0.1607843, 0, 1,
-1.830255, 0.8140925, -1.140235, 1, 0.1686275, 0, 1,
-1.830066, -0.4657471, -3.836061, 1, 0.172549, 0, 1,
-1.818231, -0.3395812, -0.649362, 1, 0.1803922, 0, 1,
-1.809322, -0.4330705, -1.169391, 1, 0.1843137, 0, 1,
-1.795845, 0.09977808, -2.28153, 1, 0.1921569, 0, 1,
-1.789344, -2.685087, -1.286592, 1, 0.1960784, 0, 1,
-1.776083, -0.3347482, -1.546135, 1, 0.2039216, 0, 1,
-1.772237, 0.7463174, -0.4545087, 1, 0.2117647, 0, 1,
-1.739817, -1.142267, -1.244034, 1, 0.2156863, 0, 1,
-1.738923, -0.3910777, -0.5981715, 1, 0.2235294, 0, 1,
-1.705354, 2.334818, -1.341293, 1, 0.227451, 0, 1,
-1.704014, -0.9620823, -2.94399, 1, 0.2352941, 0, 1,
-1.703816, -1.086915, -2.80665, 1, 0.2392157, 0, 1,
-1.697323, 1.037788, -0.01506844, 1, 0.2470588, 0, 1,
-1.692114, 1.577774, 0.7804803, 1, 0.2509804, 0, 1,
-1.681385, 0.8961597, -0.5402641, 1, 0.2588235, 0, 1,
-1.671726, 0.3275315, -3.033866, 1, 0.2627451, 0, 1,
-1.656663, -0.9203984, -2.406079, 1, 0.2705882, 0, 1,
-1.652725, -0.5556651, -1.973173, 1, 0.2745098, 0, 1,
-1.650678, -0.7610381, -1.945596, 1, 0.282353, 0, 1,
-1.645152, -0.8563349, -1.654498, 1, 0.2862745, 0, 1,
-1.637585, -1.397298, -3.599624, 1, 0.2941177, 0, 1,
-1.634301, -0.3989166, -2.877263, 1, 0.3019608, 0, 1,
-1.629236, 0.23288, -0.007300205, 1, 0.3058824, 0, 1,
-1.615389, -0.8132051, -1.831967, 1, 0.3137255, 0, 1,
-1.605878, -0.1247773, -0.9932709, 1, 0.3176471, 0, 1,
-1.601152, -0.9600753, -3.596988, 1, 0.3254902, 0, 1,
-1.600647, 0.2882115, -0.5071024, 1, 0.3294118, 0, 1,
-1.600532, -0.8141514, -2.486251, 1, 0.3372549, 0, 1,
-1.600268, -0.2973652, -2.546895, 1, 0.3411765, 0, 1,
-1.594318, 1.497892, -0.203593, 1, 0.3490196, 0, 1,
-1.593993, 0.8711351, 0.686685, 1, 0.3529412, 0, 1,
-1.591209, 2.233728, -2.371453, 1, 0.3607843, 0, 1,
-1.590744, -0.3099362, -2.012776, 1, 0.3647059, 0, 1,
-1.582837, 0.3605512, -2.846589, 1, 0.372549, 0, 1,
-1.582484, -0.9750273, -2.069622, 1, 0.3764706, 0, 1,
-1.581873, 0.8902991, -2.731804, 1, 0.3843137, 0, 1,
-1.579096, -2.991133, -1.584074, 1, 0.3882353, 0, 1,
-1.554761, -1.757871, -0.8943471, 1, 0.3960784, 0, 1,
-1.547839, -0.8605974, -1.833707, 1, 0.4039216, 0, 1,
-1.547145, -0.8673793, -1.179844, 1, 0.4078431, 0, 1,
-1.528867, -0.3960919, -0.6970496, 1, 0.4156863, 0, 1,
-1.525511, 2.69423, -0.6656855, 1, 0.4196078, 0, 1,
-1.515617, -2.025177, -2.109732, 1, 0.427451, 0, 1,
-1.505833, -0.2167277, 0.325009, 1, 0.4313726, 0, 1,
-1.498573, 0.1387375, -0.6297981, 1, 0.4392157, 0, 1,
-1.461933, 0.2994122, -0.6711331, 1, 0.4431373, 0, 1,
-1.459864, -1.631172, -2.528732, 1, 0.4509804, 0, 1,
-1.44848, -0.2322022, 0.5754009, 1, 0.454902, 0, 1,
-1.447918, -0.3342991, -0.8783377, 1, 0.4627451, 0, 1,
-1.445174, 0.3215133, -0.2093456, 1, 0.4666667, 0, 1,
-1.442325, 0.3926661, -0.07468849, 1, 0.4745098, 0, 1,
-1.44164, 1.862995, -0.1003896, 1, 0.4784314, 0, 1,
-1.435716, -0.5530348, -2.88821, 1, 0.4862745, 0, 1,
-1.422534, 0.2820597, -1.091232, 1, 0.4901961, 0, 1,
-1.412805, 1.074882, -1.239154, 1, 0.4980392, 0, 1,
-1.407324, 1.810755, -1.054708, 1, 0.5058824, 0, 1,
-1.406859, -0.2811513, -2.063858, 1, 0.509804, 0, 1,
-1.394485, 0.753788, -2.296934, 1, 0.5176471, 0, 1,
-1.388092, 0.232837, -1.077908, 1, 0.5215687, 0, 1,
-1.377934, -0.4572086, -1.794937, 1, 0.5294118, 0, 1,
-1.368228, -1.185432, -2.468669, 1, 0.5333334, 0, 1,
-1.367798, -0.7481089, -0.9521641, 1, 0.5411765, 0, 1,
-1.362308, 0.442801, -1.015942, 1, 0.5450981, 0, 1,
-1.346054, -0.3752829, -2.952505, 1, 0.5529412, 0, 1,
-1.342568, 0.6979918, -2.15241, 1, 0.5568628, 0, 1,
-1.340508, -0.8792615, -2.657532, 1, 0.5647059, 0, 1,
-1.334246, 0.6938615, -2.084653, 1, 0.5686275, 0, 1,
-1.332515, -0.04019759, -1.258527, 1, 0.5764706, 0, 1,
-1.322655, -0.1720862, -1.952236, 1, 0.5803922, 0, 1,
-1.320232, 0.3523918, -2.807847, 1, 0.5882353, 0, 1,
-1.320194, 2.264898, 0.2680795, 1, 0.5921569, 0, 1,
-1.318008, 0.6507021, -1.247816, 1, 0.6, 0, 1,
-1.313354, 2.782011, 0.4411351, 1, 0.6078432, 0, 1,
-1.30043, -0.5940554, -2.705978, 1, 0.6117647, 0, 1,
-1.299648, 0.1469622, -1.079621, 1, 0.6196079, 0, 1,
-1.299293, 0.6266357, -1.318925, 1, 0.6235294, 0, 1,
-1.294709, 0.1665016, -2.823443, 1, 0.6313726, 0, 1,
-1.293809, 0.8877715, 0.9784095, 1, 0.6352941, 0, 1,
-1.289931, 0.4849696, -1.331548, 1, 0.6431373, 0, 1,
-1.285677, -0.8463852, -0.5881056, 1, 0.6470588, 0, 1,
-1.281062, 0.8094513, -0.8429718, 1, 0.654902, 0, 1,
-1.267908, -1.461451, -2.136112, 1, 0.6588235, 0, 1,
-1.267825, -0.3685809, -1.256752, 1, 0.6666667, 0, 1,
-1.265863, 0.7318934, -2.177817, 1, 0.6705883, 0, 1,
-1.265279, -0.8006764, -3.344826, 1, 0.6784314, 0, 1,
-1.255896, -0.7974585, -0.6838916, 1, 0.682353, 0, 1,
-1.254514, -0.02589653, -0.2131694, 1, 0.6901961, 0, 1,
-1.244498, -0.5849055, -0.9594368, 1, 0.6941177, 0, 1,
-1.235525, 0.3473087, -1.448755, 1, 0.7019608, 0, 1,
-1.234301, 2.500223, -0.1462095, 1, 0.7098039, 0, 1,
-1.223617, 1.379809, 0.6280195, 1, 0.7137255, 0, 1,
-1.215148, 0.9095504, -0.5934755, 1, 0.7215686, 0, 1,
-1.214325, -0.2896707, -4.226974, 1, 0.7254902, 0, 1,
-1.212785, 0.9294856, -1.546011, 1, 0.7333333, 0, 1,
-1.212188, 0.8711474, -0.953002, 1, 0.7372549, 0, 1,
-1.205723, 0.9174703, -1.832757, 1, 0.7450981, 0, 1,
-1.201365, -0.8415433, -1.241787, 1, 0.7490196, 0, 1,
-1.195143, -0.02070659, -3.585408, 1, 0.7568628, 0, 1,
-1.192524, -0.3638551, -1.471819, 1, 0.7607843, 0, 1,
-1.191719, -0.2200747, -2.116912, 1, 0.7686275, 0, 1,
-1.182196, -0.3794782, -0.8599181, 1, 0.772549, 0, 1,
-1.175282, 0.2839625, -2.276855, 1, 0.7803922, 0, 1,
-1.172348, 0.5392842, -0.7828587, 1, 0.7843137, 0, 1,
-1.169846, -1.498211, -0.3685803, 1, 0.7921569, 0, 1,
-1.169768, 0.6609356, -1.152464, 1, 0.7960784, 0, 1,
-1.16958, -0.5215543, -4.243723, 1, 0.8039216, 0, 1,
-1.16594, -0.3051743, -1.109779, 1, 0.8117647, 0, 1,
-1.164834, -0.3513913, -3.409613, 1, 0.8156863, 0, 1,
-1.163946, 0.5354051, -1.403649, 1, 0.8235294, 0, 1,
-1.142955, -0.4183828, -2.224975, 1, 0.827451, 0, 1,
-1.141583, -0.700801, -1.552165, 1, 0.8352941, 0, 1,
-1.129766, -1.376521, -1.85595, 1, 0.8392157, 0, 1,
-1.126565, 0.5729501, 0.2813412, 1, 0.8470588, 0, 1,
-1.121454, 0.4273912, -0.7994636, 1, 0.8509804, 0, 1,
-1.115326, -1.262217, -2.475509, 1, 0.8588235, 0, 1,
-1.114457, -1.541294, -4.730917, 1, 0.8627451, 0, 1,
-1.113663, 2.556838, -0.6037751, 1, 0.8705882, 0, 1,
-1.105541, -1.01405, -2.174936, 1, 0.8745098, 0, 1,
-1.104595, -0.8697587, -3.435986, 1, 0.8823529, 0, 1,
-1.100563, -0.5842842, -2.516922, 1, 0.8862745, 0, 1,
-1.094071, 0.1828421, -0.8046357, 1, 0.8941177, 0, 1,
-1.093524, 0.2339907, -1.788224, 1, 0.8980392, 0, 1,
-1.093357, -0.901506, -0.6230425, 1, 0.9058824, 0, 1,
-1.088451, 0.5000079, 0.1449514, 1, 0.9137255, 0, 1,
-1.079089, -0.4192655, -2.429996, 1, 0.9176471, 0, 1,
-1.076514, -0.8350433, 1.186738, 1, 0.9254902, 0, 1,
-1.074351, 0.9903791, -0.09482396, 1, 0.9294118, 0, 1,
-1.071407, -0.07214751, 0.3405281, 1, 0.9372549, 0, 1,
-1.070294, -0.2281884, -1.902077, 1, 0.9411765, 0, 1,
-1.063896, -0.3317862, -1.1405, 1, 0.9490196, 0, 1,
-1.063533, 0.6302691, -1.444193, 1, 0.9529412, 0, 1,
-1.058556, -0.1495995, -0.5116513, 1, 0.9607843, 0, 1,
-1.053991, -0.3412883, -1.500186, 1, 0.9647059, 0, 1,
-1.049717, 0.2606826, 0.6695964, 1, 0.972549, 0, 1,
-1.045553, 0.7872258, -0.4967683, 1, 0.9764706, 0, 1,
-1.042182, -0.09262651, -3.018111, 1, 0.9843137, 0, 1,
-1.038377, -0.7101516, -1.396307, 1, 0.9882353, 0, 1,
-1.038058, -0.8297684, -3.604133, 1, 0.9960784, 0, 1,
-1.035548, -0.3959309, -0.1386604, 0.9960784, 1, 0, 1,
-1.034748, 0.6889745, -1.822812, 0.9921569, 1, 0, 1,
-1.032034, 1.536529, -1.633635, 0.9843137, 1, 0, 1,
-1.015579, 0.3897458, -0.7574022, 0.9803922, 1, 0, 1,
-1.012862, -0.6660858, -2.92422, 0.972549, 1, 0, 1,
-1.010308, 0.9971007, -2.427397, 0.9686275, 1, 0, 1,
-1.008667, -0.3410954, -0.4414501, 0.9607843, 1, 0, 1,
-1.006412, -0.7360645, -2.197307, 0.9568627, 1, 0, 1,
-1.006233, -1.077118, -3.2031, 0.9490196, 1, 0, 1,
-1.005384, -1.415776, -3.676018, 0.945098, 1, 0, 1,
-1.004253, -1.594808, -2.916539, 0.9372549, 1, 0, 1,
-0.9997159, 1.443059, 0.3382306, 0.9333333, 1, 0, 1,
-0.9975105, -1.394611, -3.856811, 0.9254902, 1, 0, 1,
-0.9972562, 2.084184, -1.049928, 0.9215686, 1, 0, 1,
-0.988905, -1.062093, -2.952624, 0.9137255, 1, 0, 1,
-0.9852238, -0.9544538, -2.472129, 0.9098039, 1, 0, 1,
-0.9830029, -0.2782803, -2.217504, 0.9019608, 1, 0, 1,
-0.9820664, -2.30537, -0.6801333, 0.8941177, 1, 0, 1,
-0.9808223, -0.5624264, -1.329735, 0.8901961, 1, 0, 1,
-0.9784879, -1.28808, -2.847858, 0.8823529, 1, 0, 1,
-0.9780051, 1.486992, -0.1746881, 0.8784314, 1, 0, 1,
-0.9729908, -1.75685, -3.05507, 0.8705882, 1, 0, 1,
-0.970137, 0.5386657, -1.597834, 0.8666667, 1, 0, 1,
-0.9685268, 0.6334743, 0.2026598, 0.8588235, 1, 0, 1,
-0.9666803, 0.7237203, -0.4195112, 0.854902, 1, 0, 1,
-0.964727, -0.9240123, -1.270303, 0.8470588, 1, 0, 1,
-0.959161, -0.6184068, -2.425258, 0.8431373, 1, 0, 1,
-0.9588141, -0.5662868, -2.98372, 0.8352941, 1, 0, 1,
-0.9522505, -0.2564833, -0.6758135, 0.8313726, 1, 0, 1,
-0.9483165, -0.4835033, -2.416828, 0.8235294, 1, 0, 1,
-0.9481767, 0.3912273, -1.762349, 0.8196079, 1, 0, 1,
-0.9469044, 1.027309, -1.914491, 0.8117647, 1, 0, 1,
-0.9310318, -1.587372, -2.856647, 0.8078431, 1, 0, 1,
-0.9300817, -1.616894, -2.533604, 0.8, 1, 0, 1,
-0.9299575, -0.3509406, -1.803035, 0.7921569, 1, 0, 1,
-0.9278913, -0.1098957, -1.840439, 0.7882353, 1, 0, 1,
-0.924352, -0.4845279, -1.538939, 0.7803922, 1, 0, 1,
-0.9225855, -0.1159559, -0.3277295, 0.7764706, 1, 0, 1,
-0.9198326, -0.3438046, -1.25434, 0.7686275, 1, 0, 1,
-0.9187223, 1.540941, -1.563726, 0.7647059, 1, 0, 1,
-0.9105698, -0.6628921, -2.928772, 0.7568628, 1, 0, 1,
-0.9026726, 1.141601, 0.1441481, 0.7529412, 1, 0, 1,
-0.9008909, -0.4897425, -1.488349, 0.7450981, 1, 0, 1,
-0.8956392, 0.09335257, -0.4953136, 0.7411765, 1, 0, 1,
-0.8857704, -1.583991, -3.306562, 0.7333333, 1, 0, 1,
-0.8850583, 0.416485, -1.316122, 0.7294118, 1, 0, 1,
-0.8725739, -2.012434, -0.4783019, 0.7215686, 1, 0, 1,
-0.8706225, -2.556134, -1.948884, 0.7176471, 1, 0, 1,
-0.8625709, 0.6780134, -0.9704078, 0.7098039, 1, 0, 1,
-0.8619591, 1.043728, -1.277017, 0.7058824, 1, 0, 1,
-0.8589624, 1.637319, -1.122951, 0.6980392, 1, 0, 1,
-0.8557048, 0.3137899, -1.248996, 0.6901961, 1, 0, 1,
-0.8517553, -1.146352, -1.992396, 0.6862745, 1, 0, 1,
-0.8491636, -0.6601018, -2.628978, 0.6784314, 1, 0, 1,
-0.8381308, -0.8016454, -1.451351, 0.6745098, 1, 0, 1,
-0.8358357, 0.0944685, -2.273452, 0.6666667, 1, 0, 1,
-0.8349518, 0.1634334, -2.432234, 0.6627451, 1, 0, 1,
-0.83495, -2.64644, -3.0411, 0.654902, 1, 0, 1,
-0.8335234, -0.7386431, -0.7296667, 0.6509804, 1, 0, 1,
-0.8320823, 0.6361824, -1.057052, 0.6431373, 1, 0, 1,
-0.8262943, -1.076826, -1.554458, 0.6392157, 1, 0, 1,
-0.825834, 0.804899, -0.9217596, 0.6313726, 1, 0, 1,
-0.8257521, 0.1040698, 0.09391373, 0.627451, 1, 0, 1,
-0.8197744, 1.906421, -1.589848, 0.6196079, 1, 0, 1,
-0.81345, -1.678692, -2.494632, 0.6156863, 1, 0, 1,
-0.8103107, -0.4042228, -1.662704, 0.6078432, 1, 0, 1,
-0.8007196, -0.930423, -3.365939, 0.6039216, 1, 0, 1,
-0.7965869, -0.8277656, -1.270408, 0.5960785, 1, 0, 1,
-0.7955047, 0.908735, -0.4326751, 0.5882353, 1, 0, 1,
-0.7830662, -1.544062, -4.705866, 0.5843138, 1, 0, 1,
-0.780791, -1.322713, -1.797006, 0.5764706, 1, 0, 1,
-0.7803465, -0.8967906, -2.806124, 0.572549, 1, 0, 1,
-0.7783514, -2.051407, -2.487993, 0.5647059, 1, 0, 1,
-0.7777944, 0.8020446, 0.8255087, 0.5607843, 1, 0, 1,
-0.7777933, -0.3829351, -0.1660749, 0.5529412, 1, 0, 1,
-0.7777556, -2.020598, -2.953751, 0.5490196, 1, 0, 1,
-0.7772895, 0.003615574, -2.695971, 0.5411765, 1, 0, 1,
-0.7723531, 0.0004864254, -2.06591, 0.5372549, 1, 0, 1,
-0.7710983, -0.1405629, -2.004359, 0.5294118, 1, 0, 1,
-0.77012, -0.7830985, -3.168889, 0.5254902, 1, 0, 1,
-0.7691759, -0.4153365, -3.850653, 0.5176471, 1, 0, 1,
-0.7648264, -0.3992292, -0.9210288, 0.5137255, 1, 0, 1,
-0.7648044, -0.7630371, -1.401867, 0.5058824, 1, 0, 1,
-0.7619773, 0.2242516, -0.7549499, 0.5019608, 1, 0, 1,
-0.7570482, 1.097415, 0.9835707, 0.4941176, 1, 0, 1,
-0.753474, -0.2743753, -3.625582, 0.4862745, 1, 0, 1,
-0.7506657, 1.108608, -2.592748, 0.4823529, 1, 0, 1,
-0.7491333, 0.2777868, -0.7695588, 0.4745098, 1, 0, 1,
-0.7432916, 1.063353, 0.1139366, 0.4705882, 1, 0, 1,
-0.7423518, -1.074993, -2.506231, 0.4627451, 1, 0, 1,
-0.7340339, 0.3803014, -1.111828, 0.4588235, 1, 0, 1,
-0.7257814, 0.422819, -0.8458668, 0.4509804, 1, 0, 1,
-0.7209239, -0.1807915, 0.2361558, 0.4470588, 1, 0, 1,
-0.7157277, 0.01313033, -0.6672224, 0.4392157, 1, 0, 1,
-0.7137546, -0.4496444, -1.603687, 0.4352941, 1, 0, 1,
-0.7109088, 0.8294873, -0.712112, 0.427451, 1, 0, 1,
-0.7108796, -0.2732494, -0.3944635, 0.4235294, 1, 0, 1,
-0.7041928, -0.5079563, -2.844308, 0.4156863, 1, 0, 1,
-0.7014783, -0.513087, -2.550397, 0.4117647, 1, 0, 1,
-0.7007224, 0.5356273, -0.9714149, 0.4039216, 1, 0, 1,
-0.6982715, -0.868424, -0.7097123, 0.3960784, 1, 0, 1,
-0.6978087, -0.7712207, -2.74514, 0.3921569, 1, 0, 1,
-0.6955271, 0.9231523, -1.622854, 0.3843137, 1, 0, 1,
-0.691812, -2.03626, -4.350238, 0.3803922, 1, 0, 1,
-0.6826665, -0.3236437, -3.04847, 0.372549, 1, 0, 1,
-0.6819351, 0.1037581, -2.456012, 0.3686275, 1, 0, 1,
-0.6816719, -0.5619662, -2.269513, 0.3607843, 1, 0, 1,
-0.6801422, -0.399784, -3.074558, 0.3568628, 1, 0, 1,
-0.6779503, -0.5901858, -1.721263, 0.3490196, 1, 0, 1,
-0.6775703, 1.321596, 0.07218187, 0.345098, 1, 0, 1,
-0.6723883, -0.2578451, -2.547853, 0.3372549, 1, 0, 1,
-0.6665864, -0.1504685, -1.501004, 0.3333333, 1, 0, 1,
-0.6661029, 0.3610391, -0.9688681, 0.3254902, 1, 0, 1,
-0.6577123, 0.01896822, 1.184353, 0.3215686, 1, 0, 1,
-0.6569847, 0.8113924, -0.6232591, 0.3137255, 1, 0, 1,
-0.6542383, -0.9152415, -2.849789, 0.3098039, 1, 0, 1,
-0.6500198, 0.3209572, -3.005933, 0.3019608, 1, 0, 1,
-0.6450858, 0.08750136, 0.0798887, 0.2941177, 1, 0, 1,
-0.6420922, 1.167247, -1.516975, 0.2901961, 1, 0, 1,
-0.6417671, 1.380067, -1.921439, 0.282353, 1, 0, 1,
-0.632658, 0.9522651, -0.03218422, 0.2784314, 1, 0, 1,
-0.632177, -0.8830572, -3.520274, 0.2705882, 1, 0, 1,
-0.6320941, -1.077132, -0.2558223, 0.2666667, 1, 0, 1,
-0.631628, 0.61681, -2.45431, 0.2588235, 1, 0, 1,
-0.6314772, -0.4602939, -2.902762, 0.254902, 1, 0, 1,
-0.6314747, -0.1694797, -2.339719, 0.2470588, 1, 0, 1,
-0.6285015, 0.8412781, -2.638394, 0.2431373, 1, 0, 1,
-0.6223181, -0.384172, -1.882406, 0.2352941, 1, 0, 1,
-0.6192793, 1.55313, -2.457818, 0.2313726, 1, 0, 1,
-0.6168898, 0.8235418, -1.574817, 0.2235294, 1, 0, 1,
-0.6130745, -1.437322, -3.218407, 0.2196078, 1, 0, 1,
-0.6124088, -0.6146284, -1.980167, 0.2117647, 1, 0, 1,
-0.6115041, 0.02419375, -1.695418, 0.2078431, 1, 0, 1,
-0.6079513, 0.5461458, -2.13988, 0.2, 1, 0, 1,
-0.6069373, 3.174355, 2.311611, 0.1921569, 1, 0, 1,
-0.600709, 0.4053987, -1.135424, 0.1882353, 1, 0, 1,
-0.5980679, 0.1402007, -1.434098, 0.1803922, 1, 0, 1,
-0.5880438, 0.3221826, -1.872146, 0.1764706, 1, 0, 1,
-0.583996, -0.3840742, -4.513603, 0.1686275, 1, 0, 1,
-0.5831354, 1.535348, -0.2504103, 0.1647059, 1, 0, 1,
-0.5797527, 0.1458611, -1.413312, 0.1568628, 1, 0, 1,
-0.5743864, 0.7056816, -0.8874482, 0.1529412, 1, 0, 1,
-0.5736679, -1.770079, -1.703581, 0.145098, 1, 0, 1,
-0.5657422, -0.3229297, -3.488622, 0.1411765, 1, 0, 1,
-0.5615719, -0.2262089, -0.9539552, 0.1333333, 1, 0, 1,
-0.554769, -0.6565821, -1.266587, 0.1294118, 1, 0, 1,
-0.5539427, 0.5602081, -0.5982916, 0.1215686, 1, 0, 1,
-0.5538953, -0.4759916, -1.717906, 0.1176471, 1, 0, 1,
-0.5524095, 1.494429, -0.6542595, 0.1098039, 1, 0, 1,
-0.5514519, -1.145407, -1.981147, 0.1058824, 1, 0, 1,
-0.5499749, -0.2791334, -1.413691, 0.09803922, 1, 0, 1,
-0.5481894, 0.7134541, -0.7409291, 0.09019608, 1, 0, 1,
-0.5434502, -1.441529, -3.900673, 0.08627451, 1, 0, 1,
-0.539957, 0.01736513, -1.71519, 0.07843138, 1, 0, 1,
-0.534775, 0.9030759, -0.4769452, 0.07450981, 1, 0, 1,
-0.5320366, -0.2431749, -2.501776, 0.06666667, 1, 0, 1,
-0.531026, -0.9289948, -5.001787, 0.0627451, 1, 0, 1,
-0.5236382, 0.5682551, -1.30575, 0.05490196, 1, 0, 1,
-0.5235409, 0.2365636, 0.9023772, 0.05098039, 1, 0, 1,
-0.5205919, 0.02545885, -2.195654, 0.04313726, 1, 0, 1,
-0.5196661, 0.6180227, -0.8096486, 0.03921569, 1, 0, 1,
-0.5051618, 0.2588874, -0.1909668, 0.03137255, 1, 0, 1,
-0.505133, -0.7101399, -1.63974, 0.02745098, 1, 0, 1,
-0.494653, -0.4982854, -2.728366, 0.01960784, 1, 0, 1,
-0.4936787, -0.3270512, -0.417521, 0.01568628, 1, 0, 1,
-0.4893957, 0.4697726, -1.395764, 0.007843138, 1, 0, 1,
-0.489121, -0.5001892, -1.889528, 0.003921569, 1, 0, 1,
-0.4837448, -0.7239451, -2.213799, 0, 1, 0.003921569, 1,
-0.4795559, 0.8856395, -0.4642724, 0, 1, 0.01176471, 1,
-0.4786503, 1.605659, 0.3283886, 0, 1, 0.01568628, 1,
-0.4745769, -2.146882, -3.125225, 0, 1, 0.02352941, 1,
-0.4706441, -0.7114016, -1.538499, 0, 1, 0.02745098, 1,
-0.4691888, -0.1998923, -3.417072, 0, 1, 0.03529412, 1,
-0.4633352, -0.2183898, -0.4682485, 0, 1, 0.03921569, 1,
-0.4609089, 0.1924411, -1.772422, 0, 1, 0.04705882, 1,
-0.4592033, 1.477747, -1.118055, 0, 1, 0.05098039, 1,
-0.4590888, -0.8981088, -2.608071, 0, 1, 0.05882353, 1,
-0.4483843, -0.04991083, -3.215471, 0, 1, 0.0627451, 1,
-0.4442835, -0.003586623, -3.649929, 0, 1, 0.07058824, 1,
-0.441865, -0.1422062, -1.778047, 0, 1, 0.07450981, 1,
-0.4417579, 0.4741018, 0.7661647, 0, 1, 0.08235294, 1,
-0.4391149, -0.2661803, -1.428108, 0, 1, 0.08627451, 1,
-0.4383036, -0.1211014, -3.439243, 0, 1, 0.09411765, 1,
-0.4342462, -0.2984759, -4.714904, 0, 1, 0.1019608, 1,
-0.4339801, -0.4413273, -2.140121, 0, 1, 0.1058824, 1,
-0.4313908, -0.4265243, -3.178218, 0, 1, 0.1137255, 1,
-0.4308466, -0.2996176, -1.544391, 0, 1, 0.1176471, 1,
-0.4292698, 2.151047, 0.1242142, 0, 1, 0.1254902, 1,
-0.4280908, -0.434178, -2.615018, 0, 1, 0.1294118, 1,
-0.4252386, 1.243334, 0.4037922, 0, 1, 0.1372549, 1,
-0.4212292, -0.7991015, -1.639982, 0, 1, 0.1411765, 1,
-0.4202686, 0.6068401, 0.3474978, 0, 1, 0.1490196, 1,
-0.4124702, 0.8583217, -0.6622038, 0, 1, 0.1529412, 1,
-0.4099433, 0.9023564, 1.219473, 0, 1, 0.1607843, 1,
-0.4009977, 0.4287052, -0.8429292, 0, 1, 0.1647059, 1,
-0.3979082, 0.4423434, -0.9086754, 0, 1, 0.172549, 1,
-0.3956393, -2.196444, -3.884261, 0, 1, 0.1764706, 1,
-0.3943829, 1.094244, 0.4160542, 0, 1, 0.1843137, 1,
-0.3928, -0.6572688, -2.396031, 0, 1, 0.1882353, 1,
-0.3898063, -0.6015434, -2.444689, 0, 1, 0.1960784, 1,
-0.3889809, 0.2057356, 0.3790706, 0, 1, 0.2039216, 1,
-0.3880427, -2.127223, -2.73565, 0, 1, 0.2078431, 1,
-0.3878411, -0.03910398, -1.795638, 0, 1, 0.2156863, 1,
-0.3875968, 1.204287, 0.368805, 0, 1, 0.2196078, 1,
-0.3857449, 0.5854792, 0.04938471, 0, 1, 0.227451, 1,
-0.3829659, -0.2086861, -1.714627, 0, 1, 0.2313726, 1,
-0.382104, -0.02398283, -1.870618, 0, 1, 0.2392157, 1,
-0.3815462, 1.498637, -0.3967056, 0, 1, 0.2431373, 1,
-0.380038, 1.335855, -0.7226102, 0, 1, 0.2509804, 1,
-0.3738434, 1.839957, -0.5122416, 0, 1, 0.254902, 1,
-0.3699264, 0.9042613, 0.2811002, 0, 1, 0.2627451, 1,
-0.3691872, 0.7217895, -1.038272, 0, 1, 0.2666667, 1,
-0.3666333, 0.7735858, -0.9201099, 0, 1, 0.2745098, 1,
-0.3659839, 0.6291214, 0.091933, 0, 1, 0.2784314, 1,
-0.3636596, -0.9426164, -4.003675, 0, 1, 0.2862745, 1,
-0.3635723, -1.091808, -2.176865, 0, 1, 0.2901961, 1,
-0.3604819, 0.6021048, -0.8387769, 0, 1, 0.2980392, 1,
-0.3603766, -0.8563123, -2.94263, 0, 1, 0.3058824, 1,
-0.3559164, -0.1960725, -3.54734, 0, 1, 0.3098039, 1,
-0.3550699, 0.4707936, -1.077759, 0, 1, 0.3176471, 1,
-0.3482776, -0.7774901, -2.885112, 0, 1, 0.3215686, 1,
-0.3481385, 0.5128347, -0.528281, 0, 1, 0.3294118, 1,
-0.3465256, 0.1983472, -0.9929767, 0, 1, 0.3333333, 1,
-0.3418725, -0.7539486, -2.04089, 0, 1, 0.3411765, 1,
-0.3416718, -0.2966076, -4.102198, 0, 1, 0.345098, 1,
-0.3408293, -1.112972, -3.624611, 0, 1, 0.3529412, 1,
-0.3407476, 1.958853, 0.07312065, 0, 1, 0.3568628, 1,
-0.3397586, 0.2862888, -0.3377022, 0, 1, 0.3647059, 1,
-0.3386215, -1.16467, -4.257334, 0, 1, 0.3686275, 1,
-0.3359274, 0.4984144, -0.8944376, 0, 1, 0.3764706, 1,
-0.3350804, 0.4532995, -0.1778117, 0, 1, 0.3803922, 1,
-0.333407, 0.05848676, 0.03309307, 0, 1, 0.3882353, 1,
-0.3324559, -1.518727, -2.429273, 0, 1, 0.3921569, 1,
-0.3298965, 1.418698, -0.9695203, 0, 1, 0.4, 1,
-0.3280826, -1.437559, -3.150592, 0, 1, 0.4078431, 1,
-0.3273663, 0.8470717, -1.078285, 0, 1, 0.4117647, 1,
-0.3268081, 0.03713245, -0.5021583, 0, 1, 0.4196078, 1,
-0.3225142, -0.7195027, -2.739417, 0, 1, 0.4235294, 1,
-0.3208779, 1.010478, -1.018385, 0, 1, 0.4313726, 1,
-0.3203202, 0.3096477, -0.9859769, 0, 1, 0.4352941, 1,
-0.319088, 1.925681, -0.3515865, 0, 1, 0.4431373, 1,
-0.3155933, 0.8389092, -0.1191843, 0, 1, 0.4470588, 1,
-0.3154272, -1.411023, -2.921693, 0, 1, 0.454902, 1,
-0.3081466, 1.793795, 0.6979135, 0, 1, 0.4588235, 1,
-0.3035371, -0.6933925, -4.301603, 0, 1, 0.4666667, 1,
-0.3011115, -0.2056151, -2.667393, 0, 1, 0.4705882, 1,
-0.298858, -0.7771124, -2.666818, 0, 1, 0.4784314, 1,
-0.2958322, 1.356982, -1.88635, 0, 1, 0.4823529, 1,
-0.2867126, 0.2301282, -3.071607, 0, 1, 0.4901961, 1,
-0.2860181, 0.08390906, -3.508544, 0, 1, 0.4941176, 1,
-0.2813856, 1.215107, 0.78736, 0, 1, 0.5019608, 1,
-0.2784751, 0.7351798, 0.7923885, 0, 1, 0.509804, 1,
-0.2751978, -1.350898, -3.936777, 0, 1, 0.5137255, 1,
-0.2720434, -0.4581844, -2.539237, 0, 1, 0.5215687, 1,
-0.2711249, 0.5262414, -1.37149, 0, 1, 0.5254902, 1,
-0.2677494, -0.1262281, -1.830954, 0, 1, 0.5333334, 1,
-0.2628271, 0.9789742, -0.5376583, 0, 1, 0.5372549, 1,
-0.260122, 0.8859246, 0.3135392, 0, 1, 0.5450981, 1,
-0.2526533, 0.8532605, -2.003747, 0, 1, 0.5490196, 1,
-0.2525612, 0.6938173, -1.170585, 0, 1, 0.5568628, 1,
-0.2437105, 0.4049616, -0.1779041, 0, 1, 0.5607843, 1,
-0.2413085, -1.016516, -2.708707, 0, 1, 0.5686275, 1,
-0.2412868, -1.056647, -4.567816, 0, 1, 0.572549, 1,
-0.2405802, 0.9202293, -0.3365879, 0, 1, 0.5803922, 1,
-0.2398801, 0.457719, -0.3895496, 0, 1, 0.5843138, 1,
-0.2398695, 0.51071, -0.8720722, 0, 1, 0.5921569, 1,
-0.2370301, -0.5930808, -4.146435, 0, 1, 0.5960785, 1,
-0.2353401, -0.229336, 0.0524663, 0, 1, 0.6039216, 1,
-0.2270368, -0.3263774, -0.6129357, 0, 1, 0.6117647, 1,
-0.2227017, 0.590501, -2.059589, 0, 1, 0.6156863, 1,
-0.2218785, -1.267483, -2.056866, 0, 1, 0.6235294, 1,
-0.2158731, -0.3898786, -4.491669, 0, 1, 0.627451, 1,
-0.2091877, -0.2932183, -2.503839, 0, 1, 0.6352941, 1,
-0.2079023, -0.8945358, -1.218404, 0, 1, 0.6392157, 1,
-0.2042747, -1.130582, -3.763849, 0, 1, 0.6470588, 1,
-0.203572, -1.334202, -3.805947, 0, 1, 0.6509804, 1,
-0.20123, -0.1328479, -4.078864, 0, 1, 0.6588235, 1,
-0.2011802, -0.3592608, -2.685649, 0, 1, 0.6627451, 1,
-0.2004761, 1.371048, 1.20284, 0, 1, 0.6705883, 1,
-0.198214, 0.5906619, 0.5299213, 0, 1, 0.6745098, 1,
-0.1981962, 0.5623922, -0.1443947, 0, 1, 0.682353, 1,
-0.1955451, 0.1155701, -1.772903, 0, 1, 0.6862745, 1,
-0.1951674, -0.7655075, -2.38665, 0, 1, 0.6941177, 1,
-0.1936085, -0.05313867, -2.937748, 0, 1, 0.7019608, 1,
-0.1935385, -0.1770782, -2.813892, 0, 1, 0.7058824, 1,
-0.1920352, -1.722552, -3.88775, 0, 1, 0.7137255, 1,
-0.1918216, 1.682272, 0.09879526, 0, 1, 0.7176471, 1,
-0.1913057, 0.07574499, -1.977879, 0, 1, 0.7254902, 1,
-0.1893656, 0.3640948, -0.6627693, 0, 1, 0.7294118, 1,
-0.1874736, 0.9299784, -1.072283, 0, 1, 0.7372549, 1,
-0.1867271, -0.5022468, -2.591398, 0, 1, 0.7411765, 1,
-0.178054, -1.941848, -2.840361, 0, 1, 0.7490196, 1,
-0.1745745, 0.1968392, 0.7021731, 0, 1, 0.7529412, 1,
-0.1703642, 0.8646278, 2.133513, 0, 1, 0.7607843, 1,
-0.1694618, -0.336728, -4.212493, 0, 1, 0.7647059, 1,
-0.1687945, 0.5035679, 1.338346, 0, 1, 0.772549, 1,
-0.1676748, 1.846115, -0.583983, 0, 1, 0.7764706, 1,
-0.1672183, 2.374376, 1.092261, 0, 1, 0.7843137, 1,
-0.162764, 1.663752, -0.4546129, 0, 1, 0.7882353, 1,
-0.1613739, 0.9016711, 0.8067305, 0, 1, 0.7960784, 1,
-0.1537394, -0.2434149, -3.837901, 0, 1, 0.8039216, 1,
-0.1483666, 0.4014837, -0.1423734, 0, 1, 0.8078431, 1,
-0.1474088, -0.1973028, -2.754069, 0, 1, 0.8156863, 1,
-0.1468992, -0.7795746, -4.330155, 0, 1, 0.8196079, 1,
-0.1468621, 0.1112735, -0.3663698, 0, 1, 0.827451, 1,
-0.1466953, -0.08435297, -1.391977, 0, 1, 0.8313726, 1,
-0.1450287, 0.7652573, 0.3421166, 0, 1, 0.8392157, 1,
-0.1439251, 0.01862284, -2.036105, 0, 1, 0.8431373, 1,
-0.1436877, 1.324187, 0.1130624, 0, 1, 0.8509804, 1,
-0.1413698, 0.2034322, -2.241422, 0, 1, 0.854902, 1,
-0.1407257, 0.3715568, -2.226423, 0, 1, 0.8627451, 1,
-0.1401011, -1.320259, -3.519748, 0, 1, 0.8666667, 1,
-0.1396349, 0.3695838, 0.09127112, 0, 1, 0.8745098, 1,
-0.1346665, -0.7422475, -2.525594, 0, 1, 0.8784314, 1,
-0.1286368, 0.6834838, -1.118691, 0, 1, 0.8862745, 1,
-0.1247541, -0.01066152, -2.007923, 0, 1, 0.8901961, 1,
-0.1157227, -0.1957493, -2.909794, 0, 1, 0.8980392, 1,
-0.1144112, 0.9913863, 0.1827392, 0, 1, 0.9058824, 1,
-0.1139208, 1.641096, -0.5499659, 0, 1, 0.9098039, 1,
-0.1098246, -0.06699907, -3.117449, 0, 1, 0.9176471, 1,
-0.1093757, -0.642083, -3.958173, 0, 1, 0.9215686, 1,
-0.1079296, 0.02875237, -1.719797, 0, 1, 0.9294118, 1,
-0.1066792, -1.013584, -4.581273, 0, 1, 0.9333333, 1,
-0.09593837, 1.18215, -0.8898445, 0, 1, 0.9411765, 1,
-0.09119618, -0.03634413, -3.209152, 0, 1, 0.945098, 1,
-0.08963592, 1.094347, 0.8505403, 0, 1, 0.9529412, 1,
-0.08864865, 0.1496832, -0.2103477, 0, 1, 0.9568627, 1,
-0.08443701, -0.4593063, -2.194634, 0, 1, 0.9647059, 1,
-0.08147333, 1.005284, 1.157534, 0, 1, 0.9686275, 1,
-0.08091273, -0.4077783, -3.952812, 0, 1, 0.9764706, 1,
-0.08008865, 1.912192, -0.4950252, 0, 1, 0.9803922, 1,
-0.07900885, -0.4784478, -3.499018, 0, 1, 0.9882353, 1,
-0.07590842, 0.2580705, 1.004018, 0, 1, 0.9921569, 1,
-0.07116181, -1.084214, -4.133812, 0, 1, 1, 1,
-0.06953296, 2.22736, 0.9602916, 0, 0.9921569, 1, 1,
-0.06749565, -0.7396223, -3.959227, 0, 0.9882353, 1, 1,
-0.06688359, -0.3349216, -3.407854, 0, 0.9803922, 1, 1,
-0.06381119, 0.1834199, -1.736973, 0, 0.9764706, 1, 1,
-0.06248199, 0.9631189, -1.005031, 0, 0.9686275, 1, 1,
-0.0607299, -0.2896875, -2.090601, 0, 0.9647059, 1, 1,
-0.04874127, -0.9789684, -2.75019, 0, 0.9568627, 1, 1,
-0.0472263, -0.02563164, -1.320981, 0, 0.9529412, 1, 1,
-0.04260314, -0.2063523, -2.446336, 0, 0.945098, 1, 1,
-0.04209642, 0.02966955, -0.1982114, 0, 0.9411765, 1, 1,
-0.03374799, 0.7660715, 1.002555, 0, 0.9333333, 1, 1,
-0.0335035, -0.8415293, -1.776752, 0, 0.9294118, 1, 1,
-0.03116438, 0.8162846, 0.0597201, 0, 0.9215686, 1, 1,
-0.02492644, 0.9549932, -0.3603407, 0, 0.9176471, 1, 1,
-0.02386557, -0.5388747, -2.906869, 0, 0.9098039, 1, 1,
-0.02207396, 1.065618, -0.6907663, 0, 0.9058824, 1, 1,
-0.01990868, -0.3917117, -4.07317, 0, 0.8980392, 1, 1,
-0.01921207, -0.009439588, -2.870928, 0, 0.8901961, 1, 1,
-0.0175115, 3.106816, -0.3443331, 0, 0.8862745, 1, 1,
-0.004723532, -0.8331752, -2.350265, 0, 0.8784314, 1, 1,
-0.002837581, 0.7659433, 0.3882739, 0, 0.8745098, 1, 1,
-0.00216723, -0.07180148, -2.385725, 0, 0.8666667, 1, 1,
-0.001928091, -0.6067591, -4.414307, 0, 0.8627451, 1, 1,
0.0002318242, -0.6866776, 3.148395, 0, 0.854902, 1, 1,
0.00341458, -0.6583827, 1.842138, 0, 0.8509804, 1, 1,
0.006561675, -0.682757, 3.051898, 0, 0.8431373, 1, 1,
0.01111749, -0.3577406, 3.67237, 0, 0.8392157, 1, 1,
0.01395139, 0.0817306, 0.2366081, 0, 0.8313726, 1, 1,
0.01437169, 1.213885, -0.6092622, 0, 0.827451, 1, 1,
0.01754556, -0.7197771, 3.768154, 0, 0.8196079, 1, 1,
0.01799589, -2.018619, 3.432006, 0, 0.8156863, 1, 1,
0.01868698, -0.0848698, 1.82696, 0, 0.8078431, 1, 1,
0.02057415, 1.488522, 0.5920808, 0, 0.8039216, 1, 1,
0.0224851, -0.7731354, 3.454428, 0, 0.7960784, 1, 1,
0.02942676, -0.2251375, 4.575387, 0, 0.7882353, 1, 1,
0.0447237, 0.895571, 1.347365, 0, 0.7843137, 1, 1,
0.04534004, -1.3061, 4.777242, 0, 0.7764706, 1, 1,
0.04600551, -1.602449, 2.689116, 0, 0.772549, 1, 1,
0.05205403, 1.863232, -0.3434816, 0, 0.7647059, 1, 1,
0.05251488, 0.2390746, 1.207611, 0, 0.7607843, 1, 1,
0.06318769, -0.9866827, 4.708503, 0, 0.7529412, 1, 1,
0.06570053, -0.85021, 2.125516, 0, 0.7490196, 1, 1,
0.06603254, -1.400955, 3.838931, 0, 0.7411765, 1, 1,
0.06629151, 0.1337801, -1.117787, 0, 0.7372549, 1, 1,
0.06935672, 0.7809467, -1.173876, 0, 0.7294118, 1, 1,
0.07402214, 0.02149909, 1.545989, 0, 0.7254902, 1, 1,
0.07687516, -0.8702651, 3.094269, 0, 0.7176471, 1, 1,
0.07878791, 0.4136696, -0.1566708, 0, 0.7137255, 1, 1,
0.07912099, -0.7780684, 3.090336, 0, 0.7058824, 1, 1,
0.07937407, -2.726978, 2.708574, 0, 0.6980392, 1, 1,
0.08056622, -2.542346, 3.132083, 0, 0.6941177, 1, 1,
0.08807532, 0.04072818, 1.609984, 0, 0.6862745, 1, 1,
0.08956278, 0.4628597, 1.415758, 0, 0.682353, 1, 1,
0.08971746, 2.03939, 0.4605464, 0, 0.6745098, 1, 1,
0.09195909, 0.716979, 1.138356, 0, 0.6705883, 1, 1,
0.09556739, -0.8489715, 3.692837, 0, 0.6627451, 1, 1,
0.09644756, -1.730274, 3.262596, 0, 0.6588235, 1, 1,
0.09793118, 0.005304807, 1.349393, 0, 0.6509804, 1, 1,
0.09941316, 1.396662, 1.099445, 0, 0.6470588, 1, 1,
0.100428, -0.4362251, 2.209591, 0, 0.6392157, 1, 1,
0.1018131, 0.4104146, -0.03789629, 0, 0.6352941, 1, 1,
0.103568, 1.427573, -0.0627242, 0, 0.627451, 1, 1,
0.1064999, 0.9749866, 0.294173, 0, 0.6235294, 1, 1,
0.1074767, 1.304707, 1.15864, 0, 0.6156863, 1, 1,
0.1099269, -0.3994352, 1.641634, 0, 0.6117647, 1, 1,
0.1124729, 0.8324714, 0.1881309, 0, 0.6039216, 1, 1,
0.1125579, 0.9292523, 2.169692, 0, 0.5960785, 1, 1,
0.1177746, 1.879378, 0.2826302, 0, 0.5921569, 1, 1,
0.1190053, -0.9210725, 1.584337, 0, 0.5843138, 1, 1,
0.1196219, -0.2327638, 3.773382, 0, 0.5803922, 1, 1,
0.1337096, -0.3624117, 2.875547, 0, 0.572549, 1, 1,
0.1338378, 0.8441331, -0.000159462, 0, 0.5686275, 1, 1,
0.1393152, -0.6098552, 2.76761, 0, 0.5607843, 1, 1,
0.1394127, 1.383667, 1.762298, 0, 0.5568628, 1, 1,
0.1398377, -1.457026, 3.753211, 0, 0.5490196, 1, 1,
0.1439654, 0.003811311, 2.422092, 0, 0.5450981, 1, 1,
0.1453401, 0.4413619, 0.5350081, 0, 0.5372549, 1, 1,
0.1456304, -0.5085003, 2.206995, 0, 0.5333334, 1, 1,
0.155551, -0.5909078, 3.514116, 0, 0.5254902, 1, 1,
0.156402, -0.5468828, 2.161667, 0, 0.5215687, 1, 1,
0.1585455, -0.8196624, 0.7023854, 0, 0.5137255, 1, 1,
0.1648349, -1.231711, 2.745793, 0, 0.509804, 1, 1,
0.1671263, 0.9202573, 0.8080013, 0, 0.5019608, 1, 1,
0.1677616, 0.2247866, 1.550138, 0, 0.4941176, 1, 1,
0.1688323, -0.4137934, 2.790588, 0, 0.4901961, 1, 1,
0.1725739, 0.1576027, 0.5130804, 0, 0.4823529, 1, 1,
0.1737895, -0.7936954, 2.353392, 0, 0.4784314, 1, 1,
0.1752741, -0.2287381, 1.837985, 0, 0.4705882, 1, 1,
0.176808, -0.7342534, 1.916834, 0, 0.4666667, 1, 1,
0.1777744, -0.4699479, 4.250346, 0, 0.4588235, 1, 1,
0.1863626, -0.1411693, 0.9163426, 0, 0.454902, 1, 1,
0.1864297, -0.7627549, 2.82547, 0, 0.4470588, 1, 1,
0.1867718, -0.5737484, 1.385831, 0, 0.4431373, 1, 1,
0.1911299, 0.7779059, 0.4862961, 0, 0.4352941, 1, 1,
0.1926807, -0.4882188, 3.085182, 0, 0.4313726, 1, 1,
0.1932103, 0.07911194, 1.796189, 0, 0.4235294, 1, 1,
0.1967439, -1.419742, 2.579361, 0, 0.4196078, 1, 1,
0.1977542, -0.3143917, 1.625432, 0, 0.4117647, 1, 1,
0.1996842, 0.531444, 1.970642, 0, 0.4078431, 1, 1,
0.1998077, -1.299802, 0.8589373, 0, 0.4, 1, 1,
0.2021583, -1.238397, 2.41222, 0, 0.3921569, 1, 1,
0.2036312, 0.0957506, -1.40254, 0, 0.3882353, 1, 1,
0.2039653, 0.1464409, 0.6937165, 0, 0.3803922, 1, 1,
0.2047573, 0.6985843, 0.8883685, 0, 0.3764706, 1, 1,
0.2049199, -0.1672076, 1.660692, 0, 0.3686275, 1, 1,
0.2137747, -0.1172733, 1.738322, 0, 0.3647059, 1, 1,
0.2141764, -1.381729, 1.734096, 0, 0.3568628, 1, 1,
0.2151385, -0.4752394, 3.467565, 0, 0.3529412, 1, 1,
0.2158136, -1.027643, 2.400708, 0, 0.345098, 1, 1,
0.2223583, 0.524117, -1.250225, 0, 0.3411765, 1, 1,
0.224318, -0.3937781, 1.934755, 0, 0.3333333, 1, 1,
0.2246113, 0.472283, -0.04570195, 0, 0.3294118, 1, 1,
0.2392564, 1.939708, -0.3037851, 0, 0.3215686, 1, 1,
0.239698, -0.4751619, 2.926532, 0, 0.3176471, 1, 1,
0.2420255, -1.675653, 3.572813, 0, 0.3098039, 1, 1,
0.2434074, -0.6808263, 3.743145, 0, 0.3058824, 1, 1,
0.2446751, 0.8786548, -1.998251, 0, 0.2980392, 1, 1,
0.2496322, 0.3126643, 0.3002501, 0, 0.2901961, 1, 1,
0.2521997, -1.471996, 3.066727, 0, 0.2862745, 1, 1,
0.2529233, 1.513531, 0.4827598, 0, 0.2784314, 1, 1,
0.2559126, 1.250116, -0.7159683, 0, 0.2745098, 1, 1,
0.2590523, -2.06585, 3.426157, 0, 0.2666667, 1, 1,
0.2614716, -0.3157307, 3.632154, 0, 0.2627451, 1, 1,
0.2621538, 0.2179925, -0.09313432, 0, 0.254902, 1, 1,
0.2622087, -0.04904914, 3.063007, 0, 0.2509804, 1, 1,
0.2643488, -0.05999385, 2.034959, 0, 0.2431373, 1, 1,
0.2663638, 0.3351274, 0.07240418, 0, 0.2392157, 1, 1,
0.270614, 0.2133675, 1.211076, 0, 0.2313726, 1, 1,
0.2714646, -0.1645531, 2.832097, 0, 0.227451, 1, 1,
0.2753633, -0.8453448, 3.407438, 0, 0.2196078, 1, 1,
0.2754625, 0.8577243, 0.3079816, 0, 0.2156863, 1, 1,
0.2770009, 0.8910815, 1.664903, 0, 0.2078431, 1, 1,
0.2793631, 0.650765, 1.12507, 0, 0.2039216, 1, 1,
0.2812819, 1.28734, 0.5827174, 0, 0.1960784, 1, 1,
0.2815162, -0.5437757, 1.359556, 0, 0.1882353, 1, 1,
0.2816772, -0.2945105, 1.746252, 0, 0.1843137, 1, 1,
0.2876644, -0.2355541, 2.187776, 0, 0.1764706, 1, 1,
0.2879148, -1.354582, 0.904479, 0, 0.172549, 1, 1,
0.296417, -0.3499781, 3.606007, 0, 0.1647059, 1, 1,
0.3003404, -1.821163, 1.822792, 0, 0.1607843, 1, 1,
0.3186449, 0.004510932, -0.3913829, 0, 0.1529412, 1, 1,
0.320159, 1.333695, 0.7091657, 0, 0.1490196, 1, 1,
0.3215698, -2.105291, 4.006803, 0, 0.1411765, 1, 1,
0.3236959, 1.578669, -0.9354692, 0, 0.1372549, 1, 1,
0.3254841, 0.1606897, 2.113606, 0, 0.1294118, 1, 1,
0.330117, 0.1789385, 1.695395, 0, 0.1254902, 1, 1,
0.3339978, 0.4941491, 1.147162, 0, 0.1176471, 1, 1,
0.3372376, 0.3896831, 0.3228352, 0, 0.1137255, 1, 1,
0.3375673, -1.463519, 1.172471, 0, 0.1058824, 1, 1,
0.3486267, -0.6215239, 1.985163, 0, 0.09803922, 1, 1,
0.3495722, 1.163554, -0.1153239, 0, 0.09411765, 1, 1,
0.3495954, 1.342732, 1.918664, 0, 0.08627451, 1, 1,
0.3510703, -0.8232783, 2.214948, 0, 0.08235294, 1, 1,
0.3531702, 0.4525393, 0.5585499, 0, 0.07450981, 1, 1,
0.3610423, -1.795478, 3.025614, 0, 0.07058824, 1, 1,
0.3663197, 0.3047913, -1.133604, 0, 0.0627451, 1, 1,
0.366776, 0.7903591, 0.124657, 0, 0.05882353, 1, 1,
0.3670089, 0.2525826, 0.8975605, 0, 0.05098039, 1, 1,
0.36708, 0.2324591, -0.3114497, 0, 0.04705882, 1, 1,
0.367264, 1.487745, 1.177254, 0, 0.03921569, 1, 1,
0.3688429, -0.833147, 3.31673, 0, 0.03529412, 1, 1,
0.3781951, 0.3626313, 0.3693931, 0, 0.02745098, 1, 1,
0.3858756, 0.4333985, 0.2496265, 0, 0.02352941, 1, 1,
0.3884104, -0.2496798, 2.180593, 0, 0.01568628, 1, 1,
0.3948716, 0.9169023, 0.009397516, 0, 0.01176471, 1, 1,
0.3960455, 0.6976746, 0.2173616, 0, 0.003921569, 1, 1,
0.3990293, -0.7205709, 1.468979, 0.003921569, 0, 1, 1,
0.4017538, 0.9758993, -0.2030852, 0.007843138, 0, 1, 1,
0.4029324, 0.04852334, 1.955246, 0.01568628, 0, 1, 1,
0.4046847, 0.7574537, 0.601287, 0.01960784, 0, 1, 1,
0.4072627, 1.599201, 0.8031215, 0.02745098, 0, 1, 1,
0.4117343, -0.09800069, 0.9471614, 0.03137255, 0, 1, 1,
0.4146104, 1.729046, 0.1858306, 0.03921569, 0, 1, 1,
0.4197585, 1.155133, -0.8769397, 0.04313726, 0, 1, 1,
0.4203741, 1.322425, -0.3810065, 0.05098039, 0, 1, 1,
0.4241276, -1.054013, 2.195287, 0.05490196, 0, 1, 1,
0.424723, 1.869862, -1.078029, 0.0627451, 0, 1, 1,
0.429228, -1.26717, 2.317102, 0.06666667, 0, 1, 1,
0.4346725, 1.268385, 0.03669717, 0.07450981, 0, 1, 1,
0.4363292, 1.100662, 1.498517, 0.07843138, 0, 1, 1,
0.4363913, -0.8870926, 0.8317238, 0.08627451, 0, 1, 1,
0.4373536, 1.346554, -0.5125598, 0.09019608, 0, 1, 1,
0.4378192, -0.4861914, 0.8601555, 0.09803922, 0, 1, 1,
0.4382955, -2.16275, 1.82239, 0.1058824, 0, 1, 1,
0.4431373, 0.225375, 1.464598, 0.1098039, 0, 1, 1,
0.4452585, -0.6092032, 3.003719, 0.1176471, 0, 1, 1,
0.4457316, -0.1931009, 1.616596, 0.1215686, 0, 1, 1,
0.4464024, -0.5139945, 2.565403, 0.1294118, 0, 1, 1,
0.4522724, 1.109783, 1.399154, 0.1333333, 0, 1, 1,
0.4542369, 0.5777649, 1.603592, 0.1411765, 0, 1, 1,
0.4593164, 1.258164, -0.2356608, 0.145098, 0, 1, 1,
0.4617971, 0.785463, 0.9057372, 0.1529412, 0, 1, 1,
0.4629334, 1.551809, -0.03164396, 0.1568628, 0, 1, 1,
0.4641354, 1.785379, 0.1302458, 0.1647059, 0, 1, 1,
0.4682057, -0.09318005, 3.057909, 0.1686275, 0, 1, 1,
0.4692094, -0.4234432, 1.470265, 0.1764706, 0, 1, 1,
0.4725747, 0.6076197, 0.906984, 0.1803922, 0, 1, 1,
0.4786632, -0.1749176, 1.407047, 0.1882353, 0, 1, 1,
0.483634, 0.7275021, 0.9629012, 0.1921569, 0, 1, 1,
0.4866402, -0.9704775, 2.758539, 0.2, 0, 1, 1,
0.4916311, -0.168381, 2.336883, 0.2078431, 0, 1, 1,
0.501114, 0.1063274, 2.411781, 0.2117647, 0, 1, 1,
0.5025959, 1.095236, -0.3959417, 0.2196078, 0, 1, 1,
0.5046232, -0.3353133, 2.379523, 0.2235294, 0, 1, 1,
0.5046798, 1.403986, 1.54822, 0.2313726, 0, 1, 1,
0.5097023, -0.5249874, 2.367649, 0.2352941, 0, 1, 1,
0.5113982, -1.961724, 3.022566, 0.2431373, 0, 1, 1,
0.5154243, 1.24612, 0.3196322, 0.2470588, 0, 1, 1,
0.5166743, 0.4520831, 1.399272, 0.254902, 0, 1, 1,
0.5169671, 0.173354, -0.5630032, 0.2588235, 0, 1, 1,
0.5188595, -0.5443468, 1.49912, 0.2666667, 0, 1, 1,
0.5259882, 1.31441, 0.5250019, 0.2705882, 0, 1, 1,
0.5264352, 1.28427, -1.009619, 0.2784314, 0, 1, 1,
0.5270041, 0.4779522, 3.104143, 0.282353, 0, 1, 1,
0.5274591, 1.008849, 1.895441, 0.2901961, 0, 1, 1,
0.5280402, -0.640354, 2.62221, 0.2941177, 0, 1, 1,
0.5292869, 1.079774, -0.9725165, 0.3019608, 0, 1, 1,
0.5314397, 0.9699691, 0.479467, 0.3098039, 0, 1, 1,
0.5328667, -0.9816431, 0.5659472, 0.3137255, 0, 1, 1,
0.5357114, 0.4478864, -0.6339749, 0.3215686, 0, 1, 1,
0.5375659, 0.9865962, 1.050843, 0.3254902, 0, 1, 1,
0.5377742, -0.7841967, 2.164125, 0.3333333, 0, 1, 1,
0.5439427, 0.1784859, 3.232215, 0.3372549, 0, 1, 1,
0.5474359, 0.6354305, 1.273702, 0.345098, 0, 1, 1,
0.5485835, -0.5759785, 2.41688, 0.3490196, 0, 1, 1,
0.5510392, -0.5227098, 2.36119, 0.3568628, 0, 1, 1,
0.5519106, -0.4986747, 2.354477, 0.3607843, 0, 1, 1,
0.5519546, -0.4303048, 2.794242, 0.3686275, 0, 1, 1,
0.5558021, 3.247844, -1.474169, 0.372549, 0, 1, 1,
0.5615466, -0.4141683, 4.218971, 0.3803922, 0, 1, 1,
0.5619112, -0.66433, 3.015881, 0.3843137, 0, 1, 1,
0.5619487, -0.1886767, 2.972957, 0.3921569, 0, 1, 1,
0.5713982, 1.486023, 0.7182409, 0.3960784, 0, 1, 1,
0.5721212, 0.6164204, 1.816705, 0.4039216, 0, 1, 1,
0.5751819, -0.3967986, 2.863883, 0.4117647, 0, 1, 1,
0.5797371, 0.9088912, 0.1204638, 0.4156863, 0, 1, 1,
0.5813105, 0.7800901, 1.277463, 0.4235294, 0, 1, 1,
0.5836211, 0.7703159, -1.134565, 0.427451, 0, 1, 1,
0.5889546, 0.9423885, 0.06346942, 0.4352941, 0, 1, 1,
0.595745, 0.5275953, 0.07357185, 0.4392157, 0, 1, 1,
0.595882, -0.1326419, 3.162146, 0.4470588, 0, 1, 1,
0.5983215, -0.5453421, 4.462656, 0.4509804, 0, 1, 1,
0.6079288, 1.33498, -1.548873, 0.4588235, 0, 1, 1,
0.6121397, 0.7696069, 0.9444863, 0.4627451, 0, 1, 1,
0.6153955, -0.8568362, 1.82146, 0.4705882, 0, 1, 1,
0.6160216, 0.3556495, 1.629208, 0.4745098, 0, 1, 1,
0.6203504, 1.251154, 2.518636, 0.4823529, 0, 1, 1,
0.6215124, -1.251656, 1.41823, 0.4862745, 0, 1, 1,
0.6233754, 0.6433997, -0.05080983, 0.4941176, 0, 1, 1,
0.627362, 0.2532214, 0.2633252, 0.5019608, 0, 1, 1,
0.6287611, 0.7603545, 0.1888904, 0.5058824, 0, 1, 1,
0.6299105, -1.11341, 3.62638, 0.5137255, 0, 1, 1,
0.6381624, 0.1613999, 2.898381, 0.5176471, 0, 1, 1,
0.63822, -1.121056, 0.8189291, 0.5254902, 0, 1, 1,
0.6385691, 0.7169384, -0.1755878, 0.5294118, 0, 1, 1,
0.6429334, 0.1260478, 1.229776, 0.5372549, 0, 1, 1,
0.6447119, -0.8057456, 0.9194602, 0.5411765, 0, 1, 1,
0.6488505, 1.57685, 0.09871284, 0.5490196, 0, 1, 1,
0.6540065, 1.345167, 0.7304885, 0.5529412, 0, 1, 1,
0.6677054, -0.5767888, 2.134512, 0.5607843, 0, 1, 1,
0.6770821, -0.02571803, 0.6052197, 0.5647059, 0, 1, 1,
0.6821234, -1.404655, 3.206788, 0.572549, 0, 1, 1,
0.6878038, -0.3677674, 1.236999, 0.5764706, 0, 1, 1,
0.6887249, 0.5842521, 1.742769, 0.5843138, 0, 1, 1,
0.6889805, -0.2307453, 2.216931, 0.5882353, 0, 1, 1,
0.6892346, 0.3713534, 0.1308612, 0.5960785, 0, 1, 1,
0.6950783, -1.38537, 1.676768, 0.6039216, 0, 1, 1,
0.6971052, 0.2053327, -1.107754, 0.6078432, 0, 1, 1,
0.6981, -1.458126, 2.157797, 0.6156863, 0, 1, 1,
0.7069223, -1.014598, 2.152617, 0.6196079, 0, 1, 1,
0.7091837, -0.4749373, 2.315045, 0.627451, 0, 1, 1,
0.7194647, -1.744709, 5.371982, 0.6313726, 0, 1, 1,
0.7233712, -0.4913002, 0.5162556, 0.6392157, 0, 1, 1,
0.7239022, -0.374182, 3.029508, 0.6431373, 0, 1, 1,
0.7259977, -1.519531, 2.415116, 0.6509804, 0, 1, 1,
0.7279794, -1.722705, 3.126534, 0.654902, 0, 1, 1,
0.7302185, 0.005483484, 1.983848, 0.6627451, 0, 1, 1,
0.7311089, -0.9457594, 2.858592, 0.6666667, 0, 1, 1,
0.7363374, 0.3197266, 2.426658, 0.6745098, 0, 1, 1,
0.7364716, 0.9761512, 0.7752131, 0.6784314, 0, 1, 1,
0.7386912, 2.415712, 0.3810428, 0.6862745, 0, 1, 1,
0.7491692, -0.9178045, 1.105807, 0.6901961, 0, 1, 1,
0.7526122, -0.8698172, 1.519526, 0.6980392, 0, 1, 1,
0.753036, 1.006317, 0.8856912, 0.7058824, 0, 1, 1,
0.7593188, 0.2556328, 2.237644, 0.7098039, 0, 1, 1,
0.7632411, -0.1435851, 2.834494, 0.7176471, 0, 1, 1,
0.7706944, 0.6697192, -0.8694773, 0.7215686, 0, 1, 1,
0.7777246, 0.7977484, 1.185016, 0.7294118, 0, 1, 1,
0.7782848, -1.590871, 2.447617, 0.7333333, 0, 1, 1,
0.778596, -0.8100695, 1.323079, 0.7411765, 0, 1, 1,
0.7810686, 0.7172916, 1.026108, 0.7450981, 0, 1, 1,
0.7851705, -0.6081167, 2.150199, 0.7529412, 0, 1, 1,
0.7864777, 1.910356, 1.314607, 0.7568628, 0, 1, 1,
0.7900721, -1.061028, 2.536632, 0.7647059, 0, 1, 1,
0.7973372, 1.865577, -1.314261, 0.7686275, 0, 1, 1,
0.7993733, -1.257402, 3.171811, 0.7764706, 0, 1, 1,
0.8150798, 1.716462, -0.241645, 0.7803922, 0, 1, 1,
0.8177396, -0.3041892, 0.2748117, 0.7882353, 0, 1, 1,
0.8290049, 0.6169292, 0.6729756, 0.7921569, 0, 1, 1,
0.8323441, -1.46745, 1.757314, 0.8, 0, 1, 1,
0.8324666, -0.4076359, 2.735602, 0.8078431, 0, 1, 1,
0.8351383, 0.6016093, -0.9428768, 0.8117647, 0, 1, 1,
0.8404785, 1.001037, 1.926417, 0.8196079, 0, 1, 1,
0.8449539, -0.6697356, 1.099049, 0.8235294, 0, 1, 1,
0.8468639, -0.6552472, 1.32439, 0.8313726, 0, 1, 1,
0.8475177, -0.01968642, 2.460788, 0.8352941, 0, 1, 1,
0.8516201, -0.6669134, 2.908288, 0.8431373, 0, 1, 1,
0.8564087, -0.8303187, 2.274306, 0.8470588, 0, 1, 1,
0.8586815, -0.1828596, 1.379837, 0.854902, 0, 1, 1,
0.8587014, 0.7198576, 1.114404, 0.8588235, 0, 1, 1,
0.8675304, -0.321852, 2.375701, 0.8666667, 0, 1, 1,
0.8692268, 0.8168303, 0.7911399, 0.8705882, 0, 1, 1,
0.8781515, 0.388851, -0.9399896, 0.8784314, 0, 1, 1,
0.8812025, -1.107334, 0.7170607, 0.8823529, 0, 1, 1,
0.8900231, 0.3608119, 2.706647, 0.8901961, 0, 1, 1,
0.8906042, -0.09996804, 1.421042, 0.8941177, 0, 1, 1,
0.8980865, -1.370022, 2.488929, 0.9019608, 0, 1, 1,
0.9022614, -0.2353237, 2.211166, 0.9098039, 0, 1, 1,
0.9061119, -0.3664835, 1.003682, 0.9137255, 0, 1, 1,
0.9129353, -0.66096, 1.753713, 0.9215686, 0, 1, 1,
0.9137109, 0.2001038, 0.572138, 0.9254902, 0, 1, 1,
0.9153164, 0.6389592, 0.2567468, 0.9333333, 0, 1, 1,
0.917114, 1.352783, 1.721746, 0.9372549, 0, 1, 1,
0.9174203, 2.368454, 0.2841265, 0.945098, 0, 1, 1,
0.9252517, 1.247965, 1.511413, 0.9490196, 0, 1, 1,
0.927782, -0.3806965, 2.85771, 0.9568627, 0, 1, 1,
0.9303303, 1.723743, 0.1972103, 0.9607843, 0, 1, 1,
0.9363965, -0.08417647, 1.07618, 0.9686275, 0, 1, 1,
0.9391434, 0.1038555, 0.6372896, 0.972549, 0, 1, 1,
0.9413682, 0.5330038, 0.7688798, 0.9803922, 0, 1, 1,
0.9459725, 0.5121713, 1.786772, 0.9843137, 0, 1, 1,
0.9508495, 0.5838279, 0.9020385, 0.9921569, 0, 1, 1,
0.9560941, -0.3079165, 0.7119755, 0.9960784, 0, 1, 1,
0.9622053, -2.13988, 2.133558, 1, 0, 0.9960784, 1,
0.9703884, -0.8541918, 3.540957, 1, 0, 0.9882353, 1,
0.9744506, -0.5610104, 2.278763, 1, 0, 0.9843137, 1,
0.977854, 0.3827825, 0.361598, 1, 0, 0.9764706, 1,
0.9843904, -1.566331, 0.3672965, 1, 0, 0.972549, 1,
0.9844084, -0.5423107, 2.420045, 1, 0, 0.9647059, 1,
0.9853713, 1.55075, 0.7838119, 1, 0, 0.9607843, 1,
0.9947471, 0.7901728, -0.04472682, 1, 0, 0.9529412, 1,
1.002377, 0.06428974, 3.961947, 1, 0, 0.9490196, 1,
1.002638, 0.2456463, 0.1328323, 1, 0, 0.9411765, 1,
1.006003, 0.5155053, 1.13711, 1, 0, 0.9372549, 1,
1.009497, 0.9051502, -0.2578249, 1, 0, 0.9294118, 1,
1.012931, -0.3276727, 2.598864, 1, 0, 0.9254902, 1,
1.013211, -0.009019932, 0.9469523, 1, 0, 0.9176471, 1,
1.014935, -0.7607009, 2.776362, 1, 0, 0.9137255, 1,
1.023307, -0.2509214, 1.471851, 1, 0, 0.9058824, 1,
1.029716, 0.731943, 0.8402829, 1, 0, 0.9019608, 1,
1.030915, 0.3150773, 1.973233, 1, 0, 0.8941177, 1,
1.031938, -1.702864, 3.018287, 1, 0, 0.8862745, 1,
1.039023, 0.6869954, -0.4801473, 1, 0, 0.8823529, 1,
1.045962, -0.2973821, 2.393229, 1, 0, 0.8745098, 1,
1.050565, 0.1374232, 1.903904, 1, 0, 0.8705882, 1,
1.052713, 0.2099147, 1.175134, 1, 0, 0.8627451, 1,
1.055214, -0.7320781, 2.686776, 1, 0, 0.8588235, 1,
1.055664, 2.004867, -0.9222662, 1, 0, 0.8509804, 1,
1.059559, -0.4734924, 1.121109, 1, 0, 0.8470588, 1,
1.07012, 1.58615, 0.99569, 1, 0, 0.8392157, 1,
1.072333, -0.8799613, 1.543111, 1, 0, 0.8352941, 1,
1.073881, 0.5031123, 0.338634, 1, 0, 0.827451, 1,
1.078324, 1.860285, -0.3748552, 1, 0, 0.8235294, 1,
1.092415, 1.357163, 0.8881742, 1, 0, 0.8156863, 1,
1.095774, 0.3714144, 1.470215, 1, 0, 0.8117647, 1,
1.096433, 0.8547563, 0.9001453, 1, 0, 0.8039216, 1,
1.101706, -0.3128234, 1.497446, 1, 0, 0.7960784, 1,
1.10409, 0.4568426, 0.6598886, 1, 0, 0.7921569, 1,
1.116381, -0.7346467, 2.683379, 1, 0, 0.7843137, 1,
1.117133, -0.2023373, 2.525981, 1, 0, 0.7803922, 1,
1.119095, 0.4751802, 0.6734692, 1, 0, 0.772549, 1,
1.119435, -0.7732307, 2.723664, 1, 0, 0.7686275, 1,
1.120004, 0.2648862, 1.519081, 1, 0, 0.7607843, 1,
1.12404, -1.069614, 4.009254, 1, 0, 0.7568628, 1,
1.126212, 1.850021, 1.058312, 1, 0, 0.7490196, 1,
1.13756, -0.6402172, 3.210806, 1, 0, 0.7450981, 1,
1.137615, -0.08786705, 2.978047, 1, 0, 0.7372549, 1,
1.139674, -0.1580497, 0.6533824, 1, 0, 0.7333333, 1,
1.152548, 0.6905265, 1.227689, 1, 0, 0.7254902, 1,
1.155458, 1.089529, 1.516754, 1, 0, 0.7215686, 1,
1.160504, -0.8245616, 2.323119, 1, 0, 0.7137255, 1,
1.164402, 0.1000498, 0.9946666, 1, 0, 0.7098039, 1,
1.191, -2.354996, 2.819144, 1, 0, 0.7019608, 1,
1.192201, -0.4228385, 1.704041, 1, 0, 0.6941177, 1,
1.194264, -0.876704, 1.627656, 1, 0, 0.6901961, 1,
1.194752, -1.048407, 0.8396958, 1, 0, 0.682353, 1,
1.20094, 1.758184, 1.113988, 1, 0, 0.6784314, 1,
1.207321, -1.128234, 3.752751, 1, 0, 0.6705883, 1,
1.22545, -0.1357293, 4.382683, 1, 0, 0.6666667, 1,
1.227433, 0.4884179, 0.9209502, 1, 0, 0.6588235, 1,
1.245505, -0.9122581, 1.467056, 1, 0, 0.654902, 1,
1.24831, -1.070425, 1.91036, 1, 0, 0.6470588, 1,
1.254458, 0.05705925, 1.358008, 1, 0, 0.6431373, 1,
1.255573, -0.3208732, 2.043418, 1, 0, 0.6352941, 1,
1.256333, -0.6145773, 1.869644, 1, 0, 0.6313726, 1,
1.262415, -0.5164177, 0.9404938, 1, 0, 0.6235294, 1,
1.266901, 1.184459, 0.8338474, 1, 0, 0.6196079, 1,
1.267296, 1.266408, -1.154247, 1, 0, 0.6117647, 1,
1.269183, 0.3162122, 0.5839081, 1, 0, 0.6078432, 1,
1.271696, -1.354194, 2.640664, 1, 0, 0.6, 1,
1.273172, -0.07982855, 2.791617, 1, 0, 0.5921569, 1,
1.27923, -0.570227, 1.397987, 1, 0, 0.5882353, 1,
1.279701, 0.2567179, 0.148541, 1, 0, 0.5803922, 1,
1.28778, -0.7110782, 3.522668, 1, 0, 0.5764706, 1,
1.289393, -0.7809197, 3.604716, 1, 0, 0.5686275, 1,
1.299117, -0.01299579, 2.213059, 1, 0, 0.5647059, 1,
1.300969, -0.9276894, 2.920206, 1, 0, 0.5568628, 1,
1.303103, 0.04625729, 1.077232, 1, 0, 0.5529412, 1,
1.3033, -0.6733011, 2.441178, 1, 0, 0.5450981, 1,
1.303672, -0.5440952, 1.12722, 1, 0, 0.5411765, 1,
1.307053, 0.05233775, 0.6790429, 1, 0, 0.5333334, 1,
1.315037, 1.918294, -0.5387409, 1, 0, 0.5294118, 1,
1.31927, -0.7193535, 2.553004, 1, 0, 0.5215687, 1,
1.327591, 0.8004895, 1.229717, 1, 0, 0.5176471, 1,
1.329791, -0.4724835, -0.1644187, 1, 0, 0.509804, 1,
1.335052, 0.6784843, 2.669409, 1, 0, 0.5058824, 1,
1.343745, -0.1586492, 1.608928, 1, 0, 0.4980392, 1,
1.358625, -0.5619131, 4.099133, 1, 0, 0.4901961, 1,
1.360324, -0.9484073, 2.800557, 1, 0, 0.4862745, 1,
1.366983, -1.128228, 0.8826617, 1, 0, 0.4784314, 1,
1.367205, 0.0689025, 2.798824, 1, 0, 0.4745098, 1,
1.372636, 1.709301, 0.5108481, 1, 0, 0.4666667, 1,
1.386079, -0.006967729, 2.089372, 1, 0, 0.4627451, 1,
1.389136, 0.7178125, 0.6378422, 1, 0, 0.454902, 1,
1.408425, -0.6324024, 3.529563, 1, 0, 0.4509804, 1,
1.421033, 0.06442125, -0.06107733, 1, 0, 0.4431373, 1,
1.443113, 1.076172, -0.7688778, 1, 0, 0.4392157, 1,
1.455202, 0.5998121, 1.575191, 1, 0, 0.4313726, 1,
1.460769, 0.6654324, 0.9313475, 1, 0, 0.427451, 1,
1.471346, 0.5881159, 1.180644, 1, 0, 0.4196078, 1,
1.476199, -0.146719, 2.425989, 1, 0, 0.4156863, 1,
1.480036, -0.8213071, 2.062795, 1, 0, 0.4078431, 1,
1.480221, 0.4855466, 1.02167, 1, 0, 0.4039216, 1,
1.484283, -0.9629933, 1.867835, 1, 0, 0.3960784, 1,
1.486145, 0.5575908, 2.932466, 1, 0, 0.3882353, 1,
1.494082, -0.2861238, 0.8062155, 1, 0, 0.3843137, 1,
1.502443, 2.426117, 0.1658674, 1, 0, 0.3764706, 1,
1.507738, 1.359918, 0.5958133, 1, 0, 0.372549, 1,
1.518359, 2.517768, 2.114319, 1, 0, 0.3647059, 1,
1.560606, 0.5063245, 0.4562587, 1, 0, 0.3607843, 1,
1.585657, -1.645757, 2.327724, 1, 0, 0.3529412, 1,
1.58833, -1.18968, 1.787328, 1, 0, 0.3490196, 1,
1.613025, -0.3018764, 3.812243, 1, 0, 0.3411765, 1,
1.613811, -1.191141, 0.2346176, 1, 0, 0.3372549, 1,
1.615585, 0.3307637, 1.13174, 1, 0, 0.3294118, 1,
1.623977, -0.5448312, 0.304396, 1, 0, 0.3254902, 1,
1.639049, -1.18456, 1.694196, 1, 0, 0.3176471, 1,
1.640287, 1.587956, 0.5514775, 1, 0, 0.3137255, 1,
1.654308, 1.000658, 1.196821, 1, 0, 0.3058824, 1,
1.6655, 0.07858994, 2.260585, 1, 0, 0.2980392, 1,
1.683619, 1.459962, 1.384289, 1, 0, 0.2941177, 1,
1.68559, -0.1611165, 2.360031, 1, 0, 0.2862745, 1,
1.691457, 0.3724729, 3.945113, 1, 0, 0.282353, 1,
1.695538, 0.5463888, 0.08359874, 1, 0, 0.2745098, 1,
1.705171, -0.01397106, 1.504516, 1, 0, 0.2705882, 1,
1.716475, 0.5534086, 2.538813, 1, 0, 0.2627451, 1,
1.740685, -0.03060315, 1.804877, 1, 0, 0.2588235, 1,
1.75861, -0.9440407, 2.636929, 1, 0, 0.2509804, 1,
1.785457, -0.2194534, 3.479887, 1, 0, 0.2470588, 1,
1.792361, 1.280151, -0.454778, 1, 0, 0.2392157, 1,
1.80827, -2.09344, 1.868179, 1, 0, 0.2352941, 1,
1.810048, 0.3724983, 0.2967109, 1, 0, 0.227451, 1,
1.836487, 0.06125665, 0.3806891, 1, 0, 0.2235294, 1,
1.841472, -1.385359, 0.5003961, 1, 0, 0.2156863, 1,
1.87099, -0.1170443, 2.962507, 1, 0, 0.2117647, 1,
1.902589, 0.2309242, 2.409568, 1, 0, 0.2039216, 1,
1.904114, 1.353845, 0.3380976, 1, 0, 0.1960784, 1,
1.918646, -1.067847, 2.570745, 1, 0, 0.1921569, 1,
1.975747, 0.5729694, 1.599293, 1, 0, 0.1843137, 1,
2.014807, -0.09253141, 0.884833, 1, 0, 0.1803922, 1,
2.04881, -1.383629, 1.028861, 1, 0, 0.172549, 1,
2.064279, -1.89816, 2.82489, 1, 0, 0.1686275, 1,
2.064842, 2.105443, 0.4916454, 1, 0, 0.1607843, 1,
2.079223, -0.845834, 0.2930183, 1, 0, 0.1568628, 1,
2.080482, -2.927529, 1.882154, 1, 0, 0.1490196, 1,
2.088347, -1.218516, 0.4924295, 1, 0, 0.145098, 1,
2.094669, 0.7643306, -1.037764, 1, 0, 0.1372549, 1,
2.120005, 0.2113678, 0.9979057, 1, 0, 0.1333333, 1,
2.137865, 1.034728, 0.8434674, 1, 0, 0.1254902, 1,
2.154984, 0.9195795, 2.726436, 1, 0, 0.1215686, 1,
2.172573, -2.07939, 2.223941, 1, 0, 0.1137255, 1,
2.217722, 2.059967, 1.215447, 1, 0, 0.1098039, 1,
2.240051, -1.180142, 2.371627, 1, 0, 0.1019608, 1,
2.244891, -1.10266, 0.9333714, 1, 0, 0.09411765, 1,
2.267582, 0.3901436, 0.9483639, 1, 0, 0.09019608, 1,
2.273208, 1.553081, 1.274307, 1, 0, 0.08235294, 1,
2.285926, 0.4115304, 3.032951, 1, 0, 0.07843138, 1,
2.420533, 2.391485, -0.1173378, 1, 0, 0.07058824, 1,
2.456107, 0.6536837, 2.042391, 1, 0, 0.06666667, 1,
2.52193, -0.2413341, 1.371433, 1, 0, 0.05882353, 1,
2.557523, 0.6004056, 1.823401, 1, 0, 0.05490196, 1,
2.597207, 0.228949, 0.2634249, 1, 0, 0.04705882, 1,
2.635515, 0.7357967, 2.676589, 1, 0, 0.04313726, 1,
2.741139, 1.927963, 0.9961203, 1, 0, 0.03529412, 1,
2.783544, -0.553381, 2.328341, 1, 0, 0.03137255, 1,
2.830219, -2.063932, 0.9025806, 1, 0, 0.02352941, 1,
2.879379, 0.3972666, 1.67501, 1, 0, 0.01960784, 1,
2.971914, 0.7336105, 1.600543, 1, 0, 0.01176471, 1,
3.119803, -1.388684, 1.222442, 1, 0, 0.007843138, 1
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
-0.01244366, -4.04864, -6.76014, 0, -0.5, 0.5, 0.5,
-0.01244366, -4.04864, -6.76014, 1, -0.5, 0.5, 0.5,
-0.01244366, -4.04864, -6.76014, 1, 1.5, 0.5, 0.5,
-0.01244366, -4.04864, -6.76014, 0, 1.5, 0.5, 0.5
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
-4.206522, 0.1283554, -6.76014, 0, -0.5, 0.5, 0.5,
-4.206522, 0.1283554, -6.76014, 1, -0.5, 0.5, 0.5,
-4.206522, 0.1283554, -6.76014, 1, 1.5, 0.5, 0.5,
-4.206522, 0.1283554, -6.76014, 0, 1.5, 0.5, 0.5
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
-4.206522, -4.04864, 0.1850975, 0, -0.5, 0.5, 0.5,
-4.206522, -4.04864, 0.1850975, 1, -0.5, 0.5, 0.5,
-4.206522, -4.04864, 0.1850975, 1, 1.5, 0.5, 0.5,
-4.206522, -4.04864, 0.1850975, 0, 1.5, 0.5, 0.5
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
-3, -3.084718, -5.157393,
3, -3.084718, -5.157393,
-3, -3.084718, -5.157393,
-3, -3.245372, -5.424518,
-2, -3.084718, -5.157393,
-2, -3.245372, -5.424518,
-1, -3.084718, -5.157393,
-1, -3.245372, -5.424518,
0, -3.084718, -5.157393,
0, -3.245372, -5.424518,
1, -3.084718, -5.157393,
1, -3.245372, -5.424518,
2, -3.084718, -5.157393,
2, -3.245372, -5.424518,
3, -3.084718, -5.157393,
3, -3.245372, -5.424518
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
-3, -3.566679, -5.958767, 0, -0.5, 0.5, 0.5,
-3, -3.566679, -5.958767, 1, -0.5, 0.5, 0.5,
-3, -3.566679, -5.958767, 1, 1.5, 0.5, 0.5,
-3, -3.566679, -5.958767, 0, 1.5, 0.5, 0.5,
-2, -3.566679, -5.958767, 0, -0.5, 0.5, 0.5,
-2, -3.566679, -5.958767, 1, -0.5, 0.5, 0.5,
-2, -3.566679, -5.958767, 1, 1.5, 0.5, 0.5,
-2, -3.566679, -5.958767, 0, 1.5, 0.5, 0.5,
-1, -3.566679, -5.958767, 0, -0.5, 0.5, 0.5,
-1, -3.566679, -5.958767, 1, -0.5, 0.5, 0.5,
-1, -3.566679, -5.958767, 1, 1.5, 0.5, 0.5,
-1, -3.566679, -5.958767, 0, 1.5, 0.5, 0.5,
0, -3.566679, -5.958767, 0, -0.5, 0.5, 0.5,
0, -3.566679, -5.958767, 1, -0.5, 0.5, 0.5,
0, -3.566679, -5.958767, 1, 1.5, 0.5, 0.5,
0, -3.566679, -5.958767, 0, 1.5, 0.5, 0.5,
1, -3.566679, -5.958767, 0, -0.5, 0.5, 0.5,
1, -3.566679, -5.958767, 1, -0.5, 0.5, 0.5,
1, -3.566679, -5.958767, 1, 1.5, 0.5, 0.5,
1, -3.566679, -5.958767, 0, 1.5, 0.5, 0.5,
2, -3.566679, -5.958767, 0, -0.5, 0.5, 0.5,
2, -3.566679, -5.958767, 1, -0.5, 0.5, 0.5,
2, -3.566679, -5.958767, 1, 1.5, 0.5, 0.5,
2, -3.566679, -5.958767, 0, 1.5, 0.5, 0.5,
3, -3.566679, -5.958767, 0, -0.5, 0.5, 0.5,
3, -3.566679, -5.958767, 1, -0.5, 0.5, 0.5,
3, -3.566679, -5.958767, 1, 1.5, 0.5, 0.5,
3, -3.566679, -5.958767, 0, 1.5, 0.5, 0.5
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
-3.238658, -2, -5.157393,
-3.238658, 3, -5.157393,
-3.238658, -2, -5.157393,
-3.399968, -2, -5.424518,
-3.238658, -1, -5.157393,
-3.399968, -1, -5.424518,
-3.238658, 0, -5.157393,
-3.399968, 0, -5.424518,
-3.238658, 1, -5.157393,
-3.399968, 1, -5.424518,
-3.238658, 2, -5.157393,
-3.399968, 2, -5.424518,
-3.238658, 3, -5.157393,
-3.399968, 3, -5.424518
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
-3.72259, -2, -5.958767, 0, -0.5, 0.5, 0.5,
-3.72259, -2, -5.958767, 1, -0.5, 0.5, 0.5,
-3.72259, -2, -5.958767, 1, 1.5, 0.5, 0.5,
-3.72259, -2, -5.958767, 0, 1.5, 0.5, 0.5,
-3.72259, -1, -5.958767, 0, -0.5, 0.5, 0.5,
-3.72259, -1, -5.958767, 1, -0.5, 0.5, 0.5,
-3.72259, -1, -5.958767, 1, 1.5, 0.5, 0.5,
-3.72259, -1, -5.958767, 0, 1.5, 0.5, 0.5,
-3.72259, 0, -5.958767, 0, -0.5, 0.5, 0.5,
-3.72259, 0, -5.958767, 1, -0.5, 0.5, 0.5,
-3.72259, 0, -5.958767, 1, 1.5, 0.5, 0.5,
-3.72259, 0, -5.958767, 0, 1.5, 0.5, 0.5,
-3.72259, 1, -5.958767, 0, -0.5, 0.5, 0.5,
-3.72259, 1, -5.958767, 1, -0.5, 0.5, 0.5,
-3.72259, 1, -5.958767, 1, 1.5, 0.5, 0.5,
-3.72259, 1, -5.958767, 0, 1.5, 0.5, 0.5,
-3.72259, 2, -5.958767, 0, -0.5, 0.5, 0.5,
-3.72259, 2, -5.958767, 1, -0.5, 0.5, 0.5,
-3.72259, 2, -5.958767, 1, 1.5, 0.5, 0.5,
-3.72259, 2, -5.958767, 0, 1.5, 0.5, 0.5,
-3.72259, 3, -5.958767, 0, -0.5, 0.5, 0.5,
-3.72259, 3, -5.958767, 1, -0.5, 0.5, 0.5,
-3.72259, 3, -5.958767, 1, 1.5, 0.5, 0.5,
-3.72259, 3, -5.958767, 0, 1.5, 0.5, 0.5
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
-3.238658, -3.084718, -4,
-3.238658, -3.084718, 4,
-3.238658, -3.084718, -4,
-3.399968, -3.245372, -4,
-3.238658, -3.084718, -2,
-3.399968, -3.245372, -2,
-3.238658, -3.084718, 0,
-3.399968, -3.245372, 0,
-3.238658, -3.084718, 2,
-3.399968, -3.245372, 2,
-3.238658, -3.084718, 4,
-3.399968, -3.245372, 4
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
-3.72259, -3.566679, -4, 0, -0.5, 0.5, 0.5,
-3.72259, -3.566679, -4, 1, -0.5, 0.5, 0.5,
-3.72259, -3.566679, -4, 1, 1.5, 0.5, 0.5,
-3.72259, -3.566679, -4, 0, 1.5, 0.5, 0.5,
-3.72259, -3.566679, -2, 0, -0.5, 0.5, 0.5,
-3.72259, -3.566679, -2, 1, -0.5, 0.5, 0.5,
-3.72259, -3.566679, -2, 1, 1.5, 0.5, 0.5,
-3.72259, -3.566679, -2, 0, 1.5, 0.5, 0.5,
-3.72259, -3.566679, 0, 0, -0.5, 0.5, 0.5,
-3.72259, -3.566679, 0, 1, -0.5, 0.5, 0.5,
-3.72259, -3.566679, 0, 1, 1.5, 0.5, 0.5,
-3.72259, -3.566679, 0, 0, 1.5, 0.5, 0.5,
-3.72259, -3.566679, 2, 0, -0.5, 0.5, 0.5,
-3.72259, -3.566679, 2, 1, -0.5, 0.5, 0.5,
-3.72259, -3.566679, 2, 1, 1.5, 0.5, 0.5,
-3.72259, -3.566679, 2, 0, 1.5, 0.5, 0.5,
-3.72259, -3.566679, 4, 0, -0.5, 0.5, 0.5,
-3.72259, -3.566679, 4, 1, -0.5, 0.5, 0.5,
-3.72259, -3.566679, 4, 1, 1.5, 0.5, 0.5,
-3.72259, -3.566679, 4, 0, 1.5, 0.5, 0.5
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
-3.238658, -3.084718, -5.157393,
-3.238658, 3.341429, -5.157393,
-3.238658, -3.084718, 5.527588,
-3.238658, 3.341429, 5.527588,
-3.238658, -3.084718, -5.157393,
-3.238658, -3.084718, 5.527588,
-3.238658, 3.341429, -5.157393,
-3.238658, 3.341429, 5.527588,
-3.238658, -3.084718, -5.157393,
3.21377, -3.084718, -5.157393,
-3.238658, -3.084718, 5.527588,
3.21377, -3.084718, 5.527588,
-3.238658, 3.341429, -5.157393,
3.21377, 3.341429, -5.157393,
-3.238658, 3.341429, 5.527588,
3.21377, 3.341429, 5.527588,
3.21377, -3.084718, -5.157393,
3.21377, 3.341429, -5.157393,
3.21377, -3.084718, 5.527588,
3.21377, 3.341429, 5.527588,
3.21377, -3.084718, -5.157393,
3.21377, -3.084718, 5.527588,
3.21377, 3.341429, -5.157393,
3.21377, 3.341429, 5.527588
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
var radius = 7.496639;
var distance = 33.35339;
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
mvMatrix.translate( 0.01244366, -0.1283554, -0.1850975 );
mvMatrix.scale( 1.256196, 1.261333, 0.7585893 );   
mvMatrix.multRight( userMatrix[1] );
mvMatrix.translate(-0, -0, -33.35339);
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
triphenyltin_acetate<-read.table("triphenyltin_acetate.xyz", skip=1)
x<-triphenyltin_acetate$V2
y<-triphenyltin_acetate$V3
z<-triphenyltin_acetate$V4
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
19, 17, 2, 0, 0, 1, 1, 1,
2, 9, 1, 1, 0, 0, 1, 1,
3, 12, 1, 1, 0, 0, 1, 1,
3, 14, 1, 1, 0, 0, 1, 1,
9, 11, 1, 1, 0, 0, 1, 1,
2, 2, 1, 1, 0, 0, 1, 1,
2, 5, 1, 0, 0, 0, 1, 1,
5, 10, 1, 0, 0, 0, 1, 1,
5, 13, 1, 0, 0, 0, 1, 1,
2, 15, 1, 0, 0, 0, 1, 1,
3, 13, 1, 0, 0, 0, 1, 1,
3, 10, 1, 0, 0, 0, 1, 1,
4, 2, 1, 0, 0, 0, 1, 1,
7, 3, 1, 1, 1, 1, 1, 1,
10, 3, 1, 1, 1, 1, 1, 1,
12, 2, 1, 1, 1, 1, 1, 1,
10, 7, 1, 1, 1, 1, 1, 1,
7, 7, 1, 1, 1, 1, 1, 1,
6, 2, 1, 1, 1, 1, 1, 1,
8, 7, 1, 1, 1, 1, 1, 1,
11, 7, 1, 1, 1, 1, 1, 1,
13, 2, 1, 1, 1, 1, 1, 1,
11, 3, 1, 1, 1, 1, 1, 1,
8, 3, 1, 1, 1, 1, 1, 1,
17, 1, 1, 1, 1, 1, 1, 1,
1, 16, 1, 1, 1, 1, 1, 1,
18, 1, 1, 1, 1, 1, 1, 1,
17, 6, 1, 1, 1, 1, 1, 1,
17, 8, 1, 0, 0, 1, 1, 1,
16, 1, 1, 1, 0, 0, 1, 1,
15, 4, 1, 1, 0, 0, 1, 1,
14, 4, 1, 1, 0, 0, 1, 1
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
var radius = 14.89069;
var distance = 52.3029;
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
mvMatrix.translate( -10, -9, -1.5 );
mvMatrix.scale( 1, 1, 1 );   
mvMatrix.multRight( userMatrix[19] );
mvMatrix.translate(-0, -0, -52.3029);
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
for (var i = 0; i < 32; i++) {
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
